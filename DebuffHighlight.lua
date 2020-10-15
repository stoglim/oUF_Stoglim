--[[
# DebuffHighlight

Displays overlay on frame(s) if player can dispel an effect on the target

## Widget

DebuffHiglight - A `Texture` or `Object` if using unit backdrop and/or backdrop
								 border to display when can dispel

## Notes

## Options
.alpha           - alpha (transparency) level for highlight [.5]
.filter          - whether or not to filter debuff highlighting based upon
										class/spec abilities [false]
.backdrop        - Boolean whether or not to use unit backdrop as highlight [false]
.backdropAlpha   - alpha level if using backdrop [1]
.backdropBorder  - Boolean whether or not to use unit backdrop border [false]
.backdropBorderAlpha - alpha level for backdrop border [1]

## Attributes


## Examples
	local DebuffHighlight = self:CreateTexture(nil, 'OVERLAY')
	DebuffHighlight:SetAllPoints(self)
	DebuffHighlight:SetBlendMode('ADD')
	DebuffHighlight:SetVertexColor(0, 0, 0, 0)
	DebuffHighlight.alpha = .75
	DebuffHighlight.filter = true
	DebuffHighlight:SetTexture(HIGHLIGHT_TEXTURE_TGA)

	self.DebuffHighlight = DebuffHighlight


	---- Just use backdrop and backdrop border
	local DebuffHighlight = {

	}
	self.DebuffHighlight = DebuffHighlight
--]]
if not oUF then return end

local playerClass = select(2, UnitClass('player'))
local CanDispel = {
	PRIEST = { Magic = false, Disease = false },
	SHAMAN = { Magic = false, Curse = false },
	PALADIN = { Magic = false, Poison = false, Disease = false },
	MAGE = { Curse = false },
	DRUID = { Magic = false, Curse = false, Poison = false },
	MONK = { Magic = false, Poison = false, Disease = false }
}

local dispellist = CanDispel[playerClass] or {}
local origColors = {}
local origBorderColors = {}
local origPostUpdateAura = {}
local filter = false
--[[


--]]
local function GetDebuffType(unit, filter)
	-- Doesn't matter if we can't help
	if not UnitCanAssist('player', unit) then
		return nil
	end

	local i = 1
	while true do
		local _, _, count, debufftype = UnitDebuff(unit, i)

		if count == nil then break end  -- 0 indicates non-stackable debuff

		if debufftype and (not filter or (filter and dispellist[debufftype])) then
			return debufftype, texture
		end
		i = i + 1
	end
end

-- Check class/specilization to see if we are a dispeller
local function CheckSpec(...)
	local spec = GetSpecialization()
	local slevel = UnitLevel('player')

	if playerClass == 'PALADIN'  and slevel > 20 then	-- Cleanse Toxins
		dispellist.Poison = true
		dispellist.Disease = true
		if (spec == 1) then								-- Cleanse
			dispellist.Magic = true
		else
			dispellist.Magic = false
		end
	elseif playerClass == 'SHAMAN' and slevel > 17 then	-- Cleanse Spirit
		dispellist.Curse = true
		if (spec == 3) then								-- Purify Spirit
			dispellist.Magic = true
		else
			dispellist.Magic = false
		end
	elseif playerClass == 'DRUID' and slevel > 21 then	-- Remove Corruption
		dispellist.Poison = true
		dispellist.Curse = true
		if (spec == 4) then								-- Nature's Cure
			dispellist.Magic = true
		else
			dispellist.Magic = false
		end
	elseif playerClass == 'PRIEST' and slevel > 21 then
		if not (spec == 3) then							-- Purify
			dispellist.Magic = true
			dispellist.Disease = true
		else
			if slevel > 71 then							-- Mass Dispel
				dispellist.Magic = true
			else
				dispellist.Magic = false
			end
			dispellist.Disease = false
		end
	elseif playerClass == 'MONK' and slevel > 21 then	-- Detox
		dispellist.Poison = true
		dispellist.Disease = true
		if (spec == 2) then								-- Internal Medicine
			dispellist.Magic = true
		else
			dispellist.Magic = false
		end
	elseif playerClass == "MAGE" and slevel > 27 then	-- Remove Curse
		dispellist.Curse = true
	end
end

local function Update(object, event, unit)
	if object.unit ~= unit then return end

	local debuffType = GetDebuffType(unit, object.DebuffHighlight.filter)

	if debuffType then
		local color = oUF.colors.debuff[debuffType]
		if object.DebuffHighlight.backdrop or object.DebuffHighlight.backdropBorder then
			if object.DebuffHighlight.backdrop then
				object:SetBackdropColor(color[1], color[2], color[3], object.DebuffHighlight.backdropAlpha or 1)
			end
			if object.DebuffHighlight.backdropBorder then
				object:SetBackdropBorderColor(color[1], color[2], color[3], object.DebuffHighlight.backdropBorderAlpha or 1)
			end
		else
			object.DebuffHighlight:SetVertexColor(color[1], color[2], color[3], object.DebuffHighlight.alpha or .5)
		end
	else	-- No longer highlighting
		if object.DebuffHighlight.backdrop or object.DebuffHighlight.backdropBorder then
			local color
			if object.DebuffHighlight.backdrop then
				color = origColors[object]
				object:SetBackdropColor(color[1], color[2], color[3], color.a)
			end
			if object.DebuffHighlight.backdropBorder then
				color = origBorderColors[object]
				object:SetBackdropBorderColor(color[1], color[2], color[3], color.a)
			end
		else
			local color = origColors[object]
			if color == nil then
				color = {0, 0, 0, 0}
			end
			object.DebuffHighlight:SetVertexColor(color[1], color[2], color[3], color.a)
		end
	end
end

local function Enable(object, unit)

	-- if we're not highlighting this unit or we're filtering highlights
	-- and we're not of the dispelling type, exit
	if (not object.DebuffHighlight) or
		(object.DebuffHighlight.filter and not CanDispel[playerClass]) then
			return
	end

	-- make sure aura scanning is active for this
	if (UnitIsPlayer(unit)) then
		object:RegisterEvent("UNIT_AURA", Update)
	end

		object:RegisterEvent("UNIT_HEALTH", Update)

		-- If we're filtering: set up class/spec filters.
		if(object.DebuffHighlight.filter) then
			CheckSpec()
			object:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED", CheckSpec, true)
			object:RegisterEvent("CHARACTER_POINTS_CHANGED", CheckSpec, true)
		end


	if object.DebuffHighlight.backdrop then
		local r, g, b, a = object:GetBackdropColor()
		origColors[object] = { r = r, g = g, b = b, a = a}
	else
		local r, g, b, a = object.DebuffHighlight:GetVertexColor()
		origColors[object] = { r = r, g = g, b = b, a = a}
	end

	if object.DebuffHighlight.backdropBorder then
		r, g, b, a = object:GetBackdropBorderColor()
		origBorderColors[object] = { r = r, g = g, b = b, a = a}
	end

	return true
end

local function Disable(object)
	if object.DebuffHighlight then
		if UnitIsPlayer(object) then
			object:UnregisterEvent("UNIT_AURA", Update)
		end
		object:UnregisterEvent("UNIT_HEALTH", Update)
		if(object.DebuffHighlight.filter) then
			object:UnregisterEvent("ACTIVE_TALENT_GROUP_CHANGED", CheckSpec)
			object:UnregisterEvent("CHARACTER_POINTS_CHANGED", CheckSpec)
		end
	end
end

oUF:AddElement('DebuffHighlight', Update, Enable, Disable)
