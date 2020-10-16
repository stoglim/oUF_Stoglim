local NAME_STRING = "[raidcolor][name]"
local LEVEL_STRING = "[difficultyColor][smartlevel]"
local RAID_EXTREME_WIDTH = 800

local ADDITIONAL_POWER_DISPLAY_PAIRS = {
	DRUID = {
		[Enum.PowerType.LunarPower] = true,
		[Enum.PowerType.Rage] = true,
		[Enum.PowerType.Energy] = true,
	},
	PRIEST = {
		[Enum.PowerType.Insanity] = true,
	},
	SHAMAN = {
		[Enum.PowerType.Maelstrom] = true,
	},
}

local DK_RUNE_TEXTURES = {
	[0] = 'Interface\\AddOns\\oUF_Stoglim\\textures\\ButtonBG',
	[1] = 'Interface\\CHARACTERFRAME\\DeathKnight-BloodRune-Desat',
	[2] = 'Interface\\CHARACTERFRAME\\DeathKnight-FrostRune-Desat',
	[3] = 'Interface\\CHARACTERFRAME\\DeathKnight-UnholyRune-Desat'
}

local DK_RUNE_BG_TEXTURES = {
	[0] = 'Interface\\AddOns\\oUF_Stoglim\\textures\\ButtonBG',
	[1] = 'Interface\\CHARACTERFRAME\\DeathKnight-BloodRune-Glow',
	[2] = 'Interface\\CHARACTERFRAME\\DeathKnight-FrostRune-Glow',
	[3] = 'Interface\\CHARACTERFRAME\\DeathKnight-UnholyRune-Glow'
}
--------------------------------------------------
-- Custom textures
--------------------------------------------------
local barTexture = [[Interface\AddOns\oUF_Stoglim\textures\BarBG]]
local borderTexture = [[Interface\AddOns\oUF_Stoglim\textures\BarBorder]]
local dbhiglightTexture = [[Interface\AddOns\oUF_Stoglim\textures\BarDBHL]]
local higlightTexture = [[Interface\AddOns\oUF_Stoglim\textures\BarHL]]
local btnBgTex = [[Interface\AddOns\oUF_Stoglim\textures\ButtonBG]]
local btnBrdTex	= [[Interface\AddOns\oUF_Stoglim\textures\ButtonBorder]]
local btnGlrTex	= [[Interface\AddOns\oUF_Stoglim\textures\ButtonGlare]]
local castTexture = [[Interface\AddOns\oUF_Stoglim\textures\Cast]]
local castborderTexture = [[Interface\AddOns\oUF_Stoglim\textures\CastBG]]
local comboTexture = [[Interface\AddOns\oUF_Stoglim\textures\CPoint]]
local drgnTex = [[Interface\AddOns\oUF_Stoglim\textures\Dragon]]
local nplTex = [[Interface\AddOns\oUF_Stoglim\textures\NamePlateL]]
local npmTex = [[Interface\AddOns\oUF_Stoglim\textures\NamePlateM]]
local nprTex = [[Interface\AddOns\oUF_Stoglim\textures\NamePlateR]]

-- brighten this a little
QuestDifficultyColors.trivial.r = 0.65
QuestDifficultyColors.trivial.g = 0.65
QuestDifficultyColors.trivial.b = 0.65

--------------------------------------------------
-- Saved Variables
--------------------------------------------------
if frameLayout == nil then
	thisThing = '12323';
	frameLayout = {
		player = {
			enable = true,
			frmHeight = 40,
			frmWidth = 160,
			showAvatar = true,
			showElite = true,
			showPvPIndicator = true,
			showGroupRole = true,
			showReady = true,
			showCastbar = true,
			castBarHeight = 20,
			castBarWidth = 200,
			fontSize = 10
		},
		target = {
			enable = true,
			frmHeight = 40,
			frmWidth = 160,
			showAvatar = true,
			showElite = true,
			showPvPIndicator = true,
			showCastbar = true,
			castBarHeight = 20,
			castBarWidth = 250,
			showAuras = true,
			fontSize = 10
		},
		targettarget = {
			enable = true,
			fontSize = 10,
			frmHeight = 33,
			frmWidth = 120,
			showElite = true,
			showAvatar = false,
			showPvPIndicator = true,
			showCastbar = true,
			showAuras = true,
			scale = .8
		},
		pet = {
			enable = true,
			fontSize = 10,
			frmHeight = 40,
			frmWidth = 160,
			showAvatar = true,
			showElite = true,
			scale = .8,
			showAuras = true
		},
		pettarget = {enable = false, frmHeight = 0,	frmWidth = 0, },
		focus = {
			enable = true,
			fontSize = 10,
			frmHeight = 33,
			frmWidth = 120,
			showElite = true,
			showPvPIndicator = true,
			showAuras = true
		},
		focustarget = {enable = false, frmHeight = 0,	frmWidth = 0, },
		party = {
			enable = true,
			fontSize = 10,
			frmHeight = 40,
			frmWidth = 160,
			showAvatar = true,
			showElite = true,
			showPvPIndicator = true,
			showGroupRole = true,
			showReady = true,
			scale = .8,
			showAuras = true
		},
		partytarget = {
			enable = true,
			fontSize = 10,
			frmHeight = 40,
			frmWidth = 90,
			showElite = true,
			showPvPIndicator = true,
			scale = .7,
			showAuras = false
		},
		partypet = {
			enable = true,
			fontSize = 10,
			frmHeight = 40,
			frmWidth = 160,
			scale = .7,
			showAuras = true
		},
		partypettarget = {enable = false, frmHeight = 0, frmWidth = 0,},
		boss = {
			enable = true,
			fontSize = 10,
			frmHeight = 40,
			frmWidth = 160,
			showAvatar = true,
			showPvPIndicator = true,
			scale = .9,
			showAuras = true,
			offset = {
				x = 20,
				y = -100
			},
			healthPct = true
		},
		arena = {
			enable = true,
			fontSize = 10,
			frmHeight = 40,
			frmWidth = 160,
			showAvatar = true,
			showPvPIndicator = true,
			scale = .9,
			showAuras = true,
			offset = {
				x = 20,
				y = -100
			}
		},
		raid15 = {
			enable = true,
			frmHeight = 30,
			frmWidth = RAID_EXTREME_WIDTH / 6,
			fontSize = 10,
			raidMem = true,
			showReady = true
		},
		raid15target = {
			enable = true,
			frmHeight = 30,
			frmWidth = RAID_EXTREME_WIDTH / 12,
			setOffset = {
				anchor = 'TOPLEFT',
				anchorTo = 'TOPRIGHT',
				offsetX = RAID_EXTREME_WIDTH / 12,
				offsetY = 0
			},
			fontSize = 8,
			raidTarget = true
		},
		raid15pet = {
			enable = true,
			frmHeight = 30,
			frmWidth = RAID_EXTREME_WIDTH / 12,
			fontSize = 8,
			raidPet = true
		},
		raid25 = {
			enable = true,
			frmHeight = 30,
			frmWidth = RAID_EXTREME_WIDTH / 8,
			fontSize = 10,
			raidMem = true,
			showReady = true
		},
		raid25target = {
			enable = true,
			frmHeight = 15,
			frmWidth = RAID_EXTREME_WIDTH / 16,
			raidTarget = true
		},
		raid25pet = {
			enable = true,
			frmHeight = 15,
			frmWidth = RAID_EXTREME_WIDTH / 16,
			raidPet = true
		},
		raid40 = {
			enable = true,
			frmHeight = 30,
			frmWidth = RAID_EXTREME_WIDTH / 8,
			fontSize = 10,
			raidMem = true,
			showReady = true
		},
		raid40target = {enable = false, frmHeight = 0, frmWidth = 0,},
		raid40pet = {enable = false, frmHeight = 0, frmWidth = 0,},
		borderColor = { r = 0.0, g = 0.3, b = 0.8, a = 1.0},
		partyHeader = {
			columns = 2,
			rows = 2,
			columnGutter = 150,
			offsetX = 0,
			offsetY = -250
		},
		raidHeaders = {
			raidTotalWidth = RAID_EXTREME_WIDTH,
			raid15ColumnGutter = RAID_EXTREME_WIDTH / 6,
			raid25ColumnGutter = RAID_EXTREME_WIDTH / 8,
			raid25ColumnGutter =  RAID_EXTREME_WIDTH / 16,
			raidOffsetX = 0,
			raidOffsetY = -350
		},
		buttonSize = 18,
		raidIconSize = 15,
		debuffHL = {
			alpha = .9,
			filter = true,
			enabled = true
		}
	}
end

fvcr = frameLayout.borderColor.r
fvcg = frameLayout.borderColor.g
fvcb = frameLayout.borderColor.b
fvca = frameLayout.borderColor.a

local getLayoutParams = function(self, unit)
	local frameunit = unit

	if (self:GetParent():GetName():match('oUF_StoglimRaid40')) then
		if self:GetName():match('%wPet') then
			frameunit = 'raid40pet'
		elseif self:GetName():match('%wTarget') then
			frameunit = 'raid40target'
		else
			frameunit = 'raid40'
		end
	elseif (self:GetParent():GetName():match('oUF_StoglimRaid25')) then
		if self:GetName():match('%wPet') then
			frameunit = 'raid25pet'
		elseif self:GetName():match('%wTarget') then
			frameunit = 'raid25target'
		else
			frameunit = 'raid25'
		end
	elseif (self:GetParent():GetName():match('oUF_StoglimRaid15')) then
		if self:GetName():match('%wPet') then
			frameunit = 'raid15pet'
		elseif self:GetName():match('%wTarget') then
			frameunit = 'raid15target'
		else
			frameunit = 'raid15'
		end
	elseif (unit:match('boss')) then
		frameunit = 'boss'
	elseif (unit:match('arena')) then
		frameunit = 'arena'
	elseif (self:GetParent():GetName():match('oUF_StoglimParty')) then
		if self:GetName():match('%wPet') then
			frameunit = 'partypet'
		elseif self:GetName():match('%wTarget') then
			frameunit = 'partytarget'
		else
			frameunit = 'party'
		end
	end

	if (not frameLayout) then print(unit) end

	return frameLayout[frameunit]
end

--------------------------------------------------
--  Format health and stuff
--------------------------------------------------
local numFormat = function(valin)
	if valin >= 1e7 then
		valout = ('%.1fm'):format(valin / 1e6):gsub('%.?0([km])$', '%1')
	elseif valin >= 1e6 then
		valout = ('%.2fm'):format(valin / 1e6):gsub('%.?0+([km])$', '%1')
	elseif valin >= 1e5 then
		valout = ('%.0fk'):format(valin / 1e3)
	elseif (valin >= 1e3) or (valin <= -1e3) then
		valout = ('%.1fk'):format(valin / 1e3):gsub('%.?0([km])$', '%1')
	else
		valout = valin
	end

	return valout
end

--------------------------------------------------
--  Update nameplate
--------------------------------------------------
local function nameUpdate(self, unit)
		local uName, realm = UnitName(unit)

		if (self.NamePlate) then											--Player, Party, Pet, PartyPet
			if (uName) then
				self.NamePlate:SetWidth(self.Name:GetStringWidth() + 18)
			else
				self.NamePlate:SetWidth(25)
			end
		end

		if (self.stogParams.showElite) then
			classification = UnitClassification(unit)
			if (classification == 'elite') then
				self.Elite:Show()
				self.EliteBorder:SetVertexColor(0.95, 0.85, 0.02, 1)
				self.EliteDragon:SetVertexColor(0.95, 0.85, 0.02, 1)
			elseif (classification == 'rare') then
				self.Elite:Show()
				self.EliteBorder:SetVertexColor(0.90, 0.95, 0.98, 1)
				self.EliteDragon:SetVertexColor(0.90, 0.95, 0.98, 1)
			elseif (classification == 'rareelite') then
				self.Elite:Show()
				self.EliteBorder:SetVertexColor(0.90, 0.95, 0.98, 1)
				self.EliteDragon:SetVertexColor(0.95, 0.85, 0.02, 1)
			else
				self.Elite:Hide()
			end
		end
end

local PostUpdateHealth = function(bar, unit, hp, hpmax)

	if(UnitIsDead(unit)) then
		bar:SetValue(0)
		bar.value:SetFormattedText('Dead: 0/%s', numFormat(hpmax))
	elseif(UnitIsGhost(unit)) then
		bar:SetValue(0)
		bar.value:SetFormattedText('Ghost: %s/%s', numFormat(hp), numFormat(hpmax))
	elseif(not UnitIsConnected(unit)) then
		bar.value:SetText('Offline')
	elseif(bar:GetParent():GetName():match('oUF_StoglimRaid') and (bar:GetParent():GetName():match('%wTarget') or bar:GetParent():GetName():match('%wPet'))) then
		bar.value:SetFormattedText('%s/\n%s', numFormat(hp), numFormat(hpmax))
	else
		bar.value:SetFormattedText('%s/%s', numFormat(hp), numFormat(hpmax))
	end

	nameUpdate(bar:GetParent(), unit)
end

local PostUpdatePower = function(bar, unit, power, pmin, pmax)
	if(power == 0) then
		bar.value:SetText()
	elseif(UnitIsDead(unit) or UnitIsGhost(unit)) then
		bar:SetValue(0)
	elseif(not UnitIsConnected(unit)) then
		bar.value:SetText()
	else
		bar.value:SetFormattedText('%s/%s', numFormat(power), numFormat(pmax))
	end

	-- TODO: This is not the right place for this.  need to register events for
	-- changing forms/talents and put this there.
	if(bar:GetParent():GetName():match('oUF_StoglimPlayer')) then
		local uClass = UnitClass('player');
		if (uClass == 'Druid')then
			if (GetShapeshiftForm() == 2 ) then
				bar:GetParent().ClassIconFrame:Show()
			else
				bar:GetParent().ClassIconFrame:Hide()
			end
		elseif uClass == 'Warlock' then
			bar:GetParent().ClassIconFrame:Show()
		elseif uClass == 'Mage' then
			if(GetSpecialization() == 1) then
				bar:GetParent().ClassIconFrame:Show()
			else
				bar:GetParent().ClassIconFrame:Hide()
			end
		end
	end
end

--------------------------------------------------
-- Format string based on color provided
--------------------------------------------------
local function Colorize(color)
	return string.format("|cff%02x%02x%02x", color.r * 255, color.g * 255, color.b * 255)
end

--Add tag 'difficultyColor' to oUF tags.  Differs from difficulty tag by also adding color to friendly targets
oUF.Tags.Methods['difficultyColor']  = function(unit)
	local ulevel = UnitLevel(unit)
	return Colorize(GetQuestDifficultyColor(ulevel))
end

--Shorten names for raid and party memebers to first 8 letters
oUF.Tags.Methods['StogName'] = function(unit)
	local name = UnitName(unit) or "unknown"

	if not (unit == 'focus' or unit == 'pet' or unit == 'targettarget' or unit == 'target' or unit == 'player') then
		name = name:sub(1,8)
	end
	return name
end
oUF.Tags.Events['StogName'] = 'UNIT_NAME_UPDATE PLAYER_ENTERING_WORLD GROUP_ROSTER_UPDATE'

local function spawnHealth(self, params)
	self.Health = CreateFrame('StatusBar', nil, self)
	local healthBarText = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
	local healthBarBG = self.Health:CreateTexture(nil, 'ARTWORK')

	healthBarBG:SetAlpha(.5)

	self.Health:SetFrameLevel(self:GetFrameLevel())
	self.Health.frequentUpdates = true
	self.Health.colorDisconnected = true
	self.Health.colorTapping = true
	self.Health.colorSmooth = true
	self.Health:SetPoint('TOPRIGHT', 0, 0)
	self.Health:SetStatusBarTexture(barTexture)

	if (params.showAvatar) then
		self.Health:SetWidth(self:GetWidth() * 3 / 4)			-- Health and Mana/Power/Energy bars 3/4 size of frame
		self.Health:SetHeight(self:GetHeight() / 2)				-- And half height
	else
		self.Health:SetWidth(self:GetWidth())
		self.Health:SetHeight(self:GetHeight() * 2 / 3)
	end

	--Health bar text
	if (not params.showAvatar) then
		healthBarText:SetPoint('BOTTOMRIGHT', self.Health, 'BOTTOMRIGHT', -5, 0)
	else
		healthBarText:SetPoint('RIGHT', self.Health, 'RIGHT', -5, 0)
	end

	healthBarText:SetFont(GameFontNormal:GetFont(), params.fontSize or 6)
	healthBarText:SetJustifyH('RIGHT')
	healthBarText:SetTextColor(1,1,1,1)

	-- Show health percentage.  This is mainly for bosses, but could be used elsewhere
	if (params.healthPct) then
		local healthPct = nil
		if (params.showAvatar) then
			healthPct = self.Portrait:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
			healthPct:SetFont(GameFontNormal:GetFont(), (params.fontSize or 10) * 1.6)
			healthPct:SetPoint('CENTER', self.Portrait)
		else
			healthPct = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
			healthPct:SetFont(GameFontNormal:GetFont(), params.fontSize or 10)
			healthPct:SetPoint('LEFT', self.Health, 'LEFT', 1, 0)
		end
		healthPct:SetJustifyH('LEFT')
		healthPct:SetTextColor(1,1,1,1)
		self:Tag(healthPct, "[perhp]%")
		self.Health.pct = healthPct
	end

	-- Health bar background
	healthBarBG:SetAllPoints(self.Health)
	healthBarBG:SetTexture(barTexture)

	self.Health.value = healthBarText
	self.Health.bg = healthBarBG
	self.Health.PostUpdate = PostUpdateHealth
end

local function spawnPower(self, unit, params)
	local _, unitClass = UnitClass(unit)
	local Power = CreateFrame('StatusBar', nil, self)
	local powerBarBG = Power:CreateTexture(nil, 'BORDER')
	local powerBarText = Power:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')

	Power:SetFrameLevel(self:GetFrameLevel())
	Power.colorClass = true
	Power.colorClassNPC = true
	Power.frequentUpdates = true

	if (params.showAvatar) then
		Power:SetWidth(self:GetWidth() * 3 / 4)
		Power:SetHeight(self:GetHeight() / 2)
		-- Power Bar Text
		powerBarText:SetPoint('RIGHT', Power, 'RIGHT', -5, -2)
		powerBarText:SetJustifyH('RIGHT')
		powerBarText:SetFont(GameFontNormal:GetFont(), 10)
		powerBarText:SetTextColor(1, 1, 1)
	else
		Power:SetWidth(self:GetWidth())
		Power:SetHeight(self:GetHeight() / 3)
	end

	powerBarBG:SetAlpha(.5)
	Power:SetStatusBarTexture(barTexture)
	Power:SetPoint('BOTTOMRIGHT', 0, 0)

	-- Power bar background
	powerBarBG:SetAllPoints(Power)
	powerBarBG:SetTexture(barTexture)

	Power.value = powerBarText
	Power.bg = powerBarBG
	Power.PostUpdate = PostUpdatePower

	self.Power = Power
	--Druid and Shadow Priest Mana--
	if(unit == 'player' and ADDITIONAL_POWER_DISPLAY_PAIRS[unitClass]) then
		local AdditionalPower = CreateFrame('StatusBar', nil, self)
		AdditionalPower:SetSize(self:GetWidth() / 2, self:GetHeight() / 5)
		AdditionalPower:SetPoint('TOPRIGHT', self, 'BOTTOMRIGHT', -5,  0)
		AdditionalPower:SetStatusBarTexture(barTexture)
		AdditionalPower:SetStatusBarColor(.6,.6,.9)  -- a kinder/less blue than PowerBarColor["MANA"] = { r = 0.00, g = 0.00, b = 1.00 };
		AdditionalPower.colorPower = false

		local bg = AdditionalPower:CreateTexture(nil, 'OVERLAY')
		bg:SetAllPoints(AdditionalPower);
		bg:SetTexture(borderTexture)
		bg:SetVertexColor(fvcr, fvcg, fvcb, fvca)

 		AdditionalPower.displayPairs = ADDITIONAL_POWER_DISPLAY_PAIRS
		AdditionalPower.bg = bg
		AdditionalPower:SetScript('OnUpdate', function() UnitPower("player", SPELL_POWER_MANA) end)
		self.AdditionalPower = AdditionalPower
	end

	-- Monk Stagger bar
	if(unit == 'player' and unitClass == 'MONK') then
		local Stagger = CreateFrame('StatusBar', nil, self)
		Stagger:SetSize(self:GetWidth() / 2, self:GetHeight() / 5)
		Stagger:SetPoint('TOPRIGHT', self, 'BOTTOMRIGHT', -5,  0)
		Stagger:SetStatusBarTexture(barTexture)

		local bg = Stagger:CreateTexture(nil, 'OVERLAY')
		bg:SetAllPoints(Stagger);
		bg:SetTexture(borderTexture)
		bg:SetVertexColor(fvcr, fvcg, fvcb, fvca)

		local staggerBarText = Stagger:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
		staggerBarText:SetPoint('RIGHT', Stagger, 'RIGHT', -5, -1)
		staggerBarText:SetJustifyH('RIGHT')
		staggerBarText:SetFont(GameFontNormal:GetFont(), 8)
		staggerBarText:SetTextColor(1, 1, 1)

		Stagger:Hide()
		
		Stagger.bg = bg
		Stagger.PostUpdate = function(self, cur, max)
			if(cur == 0 or UnitIsDead('player') or UnitIsGhost('player')) then
				staggerBarText:SetText()
			else
				local pct =  math.floor(cur/max * 100 + .5)
				staggerBarText:SetFormattedText('%s%%', pct)
			end
		end
		
		self.Stagger = Stagger
	end
end

--------------------------------------------------
-- Combo Points / class power(s) for most classes.  DK and Shaman are special.
--------------------------------------------------
local function spawnClassPower(self, pclass)
	if(pclass == 'Druid' or pclass == 'Mage' or pclass == 'Monk' or pclass == 'Paladin' or pclass == 'Rogue' or pclass == 'Warlock') then
		local maxIdx = 5

		if (pclass == 'Rogue' or pclass == 'Monk') then
			maxIdx = 6
		end

		local ClassPower = {}
		local ClassPowerArt = {}

		local classIconFrame = CreateFrame('StatusBar', nil, self)
		cifw = (self:GetWidth() * 2 / 3)
		cifh = cifw / 5
		classIconFrame:SetWidth(cifw)
		classIconFrame:SetHeight(cifh)
		classIconFrame:SetFrameLevel(self:GetFrameLevel() + 2)
		classIconFrame:SetPoint('TOPRIGHT', self)
		classIconFrame.unit = self.unit
		classIconFrame.owner = self
		classIconFrame.class = pclass

		for index = 1, maxIdx do
			local Icon = CreateFrame('StatusBar', nil, classIconFrame) -- status bar for combo point.  These are hidden by oUF.classpower if empty.
			local IconArt = CreateFrame('StatusBar', nil, classIconFrame)	-- Styling for status bars as oUF.classpower hides the status bars when not active
			IconArt:SetHeight(frameLayout.buttonSize*3/5)
			IconArt:SetWidth(frameLayout.buttonSize*3/5)
			IconArt:SetPoint('TOPRIGHT', self, 'TOPRIGHT', (index -1) * - (IconArt:GetWidth()+2), IconArt:GetHeight()/2)

			local iconBG = IconArt:CreateTexture(nil, 'BACKGROUND')
			iconBG:SetTexture(btnBgTex)
			iconBG:SetVertexColor(1,1,1,1)
			iconBG:SetAllPoints(IconArt)

			Icon:SetSize(cifh, cifh)
			Icon:SetStatusBarTexture(comboTexture)
			Icon:SetAllPoints(iconBG)

			local iconBrd = IconArt:CreateTexture(nil,'ARTWORK', 2)
			iconBrd:SetTexture(btnBrdTex)
			iconBrd:SetAllPoints(IconArt)
			iconBrd:SetVertexColor(fvcr, fvcg, fvcb, fvca)

			local iconGlr = IconArt:CreateTexture(nil, 'OVERLAY')
			iconGlr:SetTexture(btnGlrTex)
			iconGlr:SetVertexColor(1,1,1,.5)
			iconGlr:SetAllPoints(IconArt)

			Icon.IconArt = IconArt

			ClassPower[index] = Icon
			if(index > UnitPowerMax('player', Enum.PowerType.ComboPoints) and pclass == 'Rogue') then
				IconArt:Hide()
			end
		end

		if(pclass == 'Rogue' or pclass == 'Monk') then
			classIconFrame:RegisterEvent('PLAYER_TALENT_UPDATE')
			classIconFrame:SetScript('OnEvent', function(self, event, ...)
				 -- Meh.  Need to wait for Max power to be updated to actually show change... if any
				C_Timer.After(1.0, function()
					local maxIdx = 5
					if(pclass == 'Rogue') then
						maxIdx = UnitPowerMax('player', Enum.PowerType.ComboPoints)
					else
						maxIdx = UnitPowerMax('player', Enum.PowerType.Chi)
					end
					
					for i = 1, #ClassPower do
						local spec = GetSpecialization()
						if (i > maxIdx or (pclass == 'Monk' and spec ~= SPEC_MONK_WINDWALKER)) then
							ClassPower[i].IconArt:Hide()
						else
							ClassPower[i].IconArt:Show()
						end
					end
				end)
			end)
		end
		
		if(pclass == 'Druid') then		
			classIconFrame:RegisterEvent('UPDATE_SHAPESHIFT_FORM')
			classIconFrame:SetScript('OnEvent', function(self, event, ...)
				self.shiftedForm = true	-- Post Update power will fix combo points
			end)
		end
		
		if(pclass == 'Monk') then
			if GetSpecialization() ~= SPEC_MONK_WINDWALKER then
				for i = 1, maxIdx do
					ClassPower[i].IconArt:Hide()
				end
			end
		end
		self.ClassIconFrame = classIconFrame
		self.ClassPower = ClassPower
	end
end -- spawnClassPower

--------------------------------------------------
-- Make sure we still need to show class power (shape shift/talent change could affect this)
--------------------------------------------------
local function cpointPost(self, cur, max, diff, powerType)
	if(self.shiftedForm) then
		self.shiftedForm = false
		if(GetShapeshiftForm() == 2) then  -- Puddy tat!
			self.ClassIconFrame:Show()
		else							   -- Not a puddy tat - no combo!
			self.ClassIconFrame:Hide()
		end
	end
end

--------------------------------------------------
-- Set up Shaman Totems
--------------------------------------------------
local function spawnTotems(self)
	local Totems = {}
	for i = 1, MAX_TOTEMS + 1 do	-- Elemental can effectively have an extra totem
		local Totem = CreateFrame('Button', nil, self)
		Totem:SetSize(frameLayout.buttonSize, frameLayout.buttonSize)
		Totem:SetPoint('BOTTOMRIGHT', self, 'TOPRIGHT', -(i -1) * (frameLayout.buttonSize + 2), 0)

		local Icon = Totem:CreateTexture(nil, 'OVERLAY', 0)
		Icon:SetAllPoints()
		Icon:SetTexCoord(0, 1, 0, 1)
		Icon:SetMask("Interface\\CharacterFrame\\TempPortraitAlphaMask")

		local IconGlare = Totem:CreateTexture(nil, 'OVERLAY',3)
		IconGlare:SetAllPoints()
		IconGlare:SetTexture(btnGlrTex)
		IconGlare:SetVertexColor(1,1,1,.5)

		local Cooldown = CreateFrame('Cooldown', nil, Totem, 'CooldownFrameTemplate')
		Cooldown:SetAllPoints()

		Totem.Icon = Icon
		Totem.IconGlare = IconGlare
		Totem.Cooldown = Cooldown

		Totems[i] = Totem
	end

	self.Totems = Totems
end

--------------------------------------------------
-- Set up Death Knight Runes
--------------------------------------------------
local function switchRunes(runes, index)
	local specIndex = GetSpecialization() or 0
	--runes[index]:SetStatusBarTexture(DK_RUNE_TEXTURES[specIndex])
	--runes[index].bg:SetTexture(DK_RUNE_BG_TEXTURES[specIndex])

	local color
	if(specIndex ~= 0) then
		color = oUF.colors.runes[specIndex]
	else
		color = oUF.colors.power.RUNES
	end

	local r, g, b = color[1], color[2], color[3]

	--runes[index]:SetStatusBarColor(r, g, b)
end

local function spawnRunes(self)
	-- Using Blizzard for now... should at least add borders.....
	 RuneFrame:SetParent(self)
	 RuneFrame:ClearAllPoints()
	 RuneFrame:SetPoint('BOTTOMRIGHT', self, 'TOPRIGHT', 7, -5)
	 RuneFrame:SetScale(0.7)
--
--	local Runes = {}
--	for i = 1, 6 do
--		local Rune = CreateFrame('StatusBar', nil, self)
--		Rune:SetSize(frameLayout.buttonSize, frameLayout.buttonSize)
--		Rune:SetPoint('BOTTOMRIGHT', self, 'TOPRIGHT', -(i -1) * (frameLayout.buttonSize-2), -3)

--		local RuneBG = Rune:CreateTexture(nil, 'BACKGROUND')
--		RuneBG:SetAllPoints()
--		RuneBG:SetVertexColor(0,0,0,1)

--		Rune.bg = RuneBG

--		Runes[i] = Rune
--	end
--	Runes.UpdateColor = switchRunes

--	for i = 1, 6 do
--		switchRunes(Runes, i)
--	end

--	self.Runes = Runes

end

local function stogStyle(settings, self, unit)
	pclass = UnitClass('player')

	self.menu = menu
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	self:RegisterForClicks('anyup')
	self:SetFrameLevel(0)

	local params = getLayoutParams(self, unit)
	self.stogParams = params
		-- Reset offset.  This is necessary for some raid frames to allow for Total raid width to change
		-- for example raid15 target has pet in between [==5==][5p][5t]
	if (params.setOffset) then
		self:SetPoint(params.setOffset.anchor, self:GetParent(), params.setOffset.anchorTo, params.setOffset.offsetX, params.setOffset.offsetY)
	end

	self:SetHeight(params.frmHeight)
	self:SetWidth(params.frmWidth)
	self:SetAttribute('initial-height', params.frmHeight)
	self:SetAttribute('initial-width', params.frmWidth)

	if (params.showAvatar) then
		local portrait = CreateFrame('PlayerModel', nil, self)
		portrait:SetPoint('TOPLEFT', self)
		portrait:SetWidth(self:GetWidth()/4 - 2)
		portrait:SetHeight(self:GetHeight() - 2)
		portrait:SetFrameLevel(self:GetFrameLevel())
		portrait.type = '3D'
		self.Portrait = portrait

		 if (unit == 'target') then
		 	local QuestIndicator = portrait:CreateTexture(nil, 'OVERLAY')
	     QuestIndicator:SetSize(frameLayout.buttonSize, frameLayout.buttonSize)
	     QuestIndicator:SetPoint('TOPRIGHT', portrait)
	     self.QuestIndicator = QuestIndicator
		 end
	end
	---------------------------------
	-- Health bar                  --
	---------------------------------
	spawnHealth(self, params)

	---------------------------------
	-- Power bar                   --
	---------------------------------
	spawnPower(self, unit, params)

	if(unit == 'player') then
		spawnClassPower(self, pclass)

		if(pclass == 'Death Knight') then -- This needs a lot of work.  Using Blizz atm.
			spawnRunes(self)
		end

		if(pclass == 'Shaman') then
			spawnTotems(self)
		end
	end

	-- Frame around unit
	local border = self:CreateTexture(nil,'OVERLAY')
	border:SetTexture(borderTexture)
	border:SetVertexColor(fvcr, fvcg, fvcb, fvca)
	border:SetAllPoints(self)
	self.Border = border

	-- Highlight for mouse over
	self.Highlight = self:CreateTexture(nil, 'HIGHLIGHT', nil, 3)
	self.Highlight:SetAllPoints(self)
	self.Highlight:SetWidth(self.Highlight:GetWidth()+8)
	self.Highlight:SetHeight(self.Highlight:GetHeight()+8)
	self.Highlight:SetPoint('CENTER', self, 'CENTER')
	self.Highlight:SetBlendMode('ADD')
	self.Highlight:SetTexture(higlightTexture)

	-- Debuff "Highlight" for poison, disease, etc.
	if(frameLayout.debuffHL.enabled) then
		self.DebuffHighlight = self:CreateTexture(nil, 'OVERLAY',2)
		self.DebuffHighlight:SetAllPoints(self)
		self.DebuffHighlight:SetWidth(self.DebuffHighlight:GetWidth()+8)
		self.DebuffHighlight:SetHeight(self.DebuffHighlight:GetHeight()+8)
		self.DebuffHighlight:SetPoint('CENTER', self, 'CENTER')
		self.DebuffHighlight:SetBlendMode('ADD')
		self.DebuffHighlight:SetVertexColor(0, 0, 0, 0)
		self.DebuffHighlight.alpha = frameLayout.debuffHL.alpha
		self.DebuffHighlight.filter = frameLayout.debuffHL.filter
		self.DebuffHighlight:SetTexture(dbhiglightTexture)
	end

	-- Phase Icon
	local PhaseIndicator = self:CreateTexture(nil, 'OVERLAY')
	PhaseIndicator:SetSize(frameLayout.buttonSize, frameLayout.buttonSize)
	PhaseIndicator:SetPoint('CENTER', self, 'LEFT')
	self.PhaseIndicator = PhaseIndicator

	-- Resurrect Icon
	local ResurrectIndicator = self:CreateTexture(nil, 'OVERLAY')
	ResurrectIndicator:SetSize(frameLayout.buttonSize * 2, frameLayout.buttonSize * 2)
	ResurrectIndicator:SetPoint('CENTER', self)
	self.ResurrectIndicator = ResurrectIndicator

	-- Summons
	local SummonIndicator = self:CreateTexture(nil, 'OVERLAY')
	SummonIndicator:SetSize(frameLayout.buttonSize * 2, frameLayout.buttonSize * 2)
	SummonIndicator:SetPoint('CENTER', self)
	self.SummonIndicator = SummonIndicator
	
	---------------------------------
	-- Unit Name                   --
	---------------------------------
	if (params.showAvatar) then		-- Name in border offset from frame
		local namePlate = CreateFrame('Frame', nil, self)
		local nplBG = namePlate:CreateTexture(nil, 'ARTWORK')
		local npBG = namePlate:CreateTexture(nil, 'BACKGROUND', namePlate)
		local nprBG = namePlate:CreateTexture(nil, 'ARTWORK')
		local name = namePlate:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')

		namePlate:SetPoint('TOPLEFT', self, 'TOPLEFT', -10, 15)
		namePlate:SetFrameStrata(self:GetFrameStrata())
		namePlate:SetFrameLevel(self:GetFrameLevel()+2)
		namePlate:SetHeight(20)
		namePlate:SetWidth(100)

		npBG:SetTexture(npmTex)
		npBG:SetVertexColor(fvcr, fvcg, fvcb, fvca)
		npBG:SetAllPoints(namePlate)
		npBG:SetWidth(namePlate:GetWidth() - 10)
		namePlate.texture = npBG

		name:SetPoint('CENTER', 0, 0)
		name:SetJustifyH('LEFT')
		name:SetFont(GameFontNormal:GetFont(), 11)
		name:SetTextColor(1, 1, 1, 1)
		self:Tag(name, "[raidcolor][StogName]")
		self.Name = name

		nplBG:SetTexture(nplTex)
		nplBG:SetPoint('TOPLEFT', -5, 0)
		nplBG:SetVertexColor(fvcr, fvcg, fvcb, fvca)
		nplBG:SetHeight(20)
		nplBG:SetWidth(5)
		nplBG:Show()

		nprBG:SetTexture(nprTex)
		nprBG:SetPoint('TOPRIGHT', 5, 0)
		nprBG:SetVertexColor(fvcr, fvcg, fvcb, fvca)
		nprBG:SetHeight(20)
		nprBG:SetWidth(5)
		nprBG:Show()
		self.NamePlate = namePlate

		-- Level Button
		local levBtn = CreateFrame('Frame', nil, self)
		levBtn:SetPoint('BOTTOMLEFT', -frameLayout.buttonSize* 1/2, -frameLayout.buttonSize * 1/2)
		levBtn:SetWidth(frameLayout.buttonSize)
		levBtn:SetHeight(frameLayout.buttonSize)
		levBtn:SetFrameStrata(self:GetFrameStrata())
		levBtn:SetFrameLevel(self:GetFrameLevel()+3)

		local levBtnBG = levBtn:CreateTexture(nil, 'BACKGROUND')
		levBtnBG:SetTexture(btnBgTex)
		levBtnBG:SetAllPoints(levBtn)
		levBtnBG:SetVertexColor(1,1,1,1)

		local levBtnBrd = levBtn:CreateTexture(nil,'ARTWORK')
		levBtnBrd:SetTexture(btnBrdTex)
		levBtnBrd:SetAllPoints(levBtn)
		levBtnBrd:SetVertexColor(fvcr, fvcg, fvcb, fvca)

		local level = levBtn:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
		level:SetPoint('CENTER', 0, 0)
		level:SetJustifyH('CENTER')
		level:SetJustifyV('CENTER')
		level:SetFont(GameFontNormal:GetFont(), frameLayout.buttonSize/2)
		self:Tag(level, '[difficultyColor][level]')
		self.Level = level

		local levBtnGlr = levBtn:CreateTexture(nil, 'OVERLAY')
		levBtnGlr:SetTexture(btnGlrTex)
		levBtnGlr:SetVertexColor(1,1,1,.25)
		levBtnGlr:SetAllPoints(levBtn)
		levBtn:Show()
	else
		local name
		if (params.raidMem) then
			local namePlate = CreateFrame('Frame', nil, self)
			local npBG = namePlate:CreateTexture(nil, 'BACKGROUND', barg)
			name = namePlate:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')

			namePlate:SetPoint('TOPLEFT', self.Health, 'TOPLEFT', -5, 5)
			namePlate:SetFrameStrata(self:GetFrameStrata())
			namePlate:SetFrameLevel(self:GetFrameLevel()+2)
			namePlate:SetHeight(12)
			namePlate:SetWidth(70)

			npBG:SetTexture(npmTex)
			npBG:SetVertexColor(fvcr, fvcg, fvcb, .4)
			npBG:SetAllPoints(namePlate)
			npBG:SetWidth(namePlate:GetWidth() - 10)
			namePlate.texture = npBG

			name:SetPoint('CENTER', 0, 0)
			name:SetFont(GameFontNormal:GetFont(), 10)
		else
			name = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
			name:SetPoint('TOPLEFT', -(params.fontSize or 6)/2, params.fontSize or 6)
			name:SetFont(GameFontNormal:GetFont(), params.fontSize or 6)
		end
		name:SetJustifyH('LEFT')
		name:SetTextColor(1,1,1,1)
		self:Tag(name, '[level] [raidcolor][StogName]')
		self.Name = name
	end

 -- FIXME:
	if(params.showAuras) then
		-- Buffs
		local buffs = CreateFrame('Frame', nil, self)
		buffs:SetPoint('BOTTOMRIGHT', self, 'TOPRIGHT', 0, 15)
		buffs:SetHeight(15)
		buffs:SetWidth(self:GetWidth() - 20)
		buffs.size = 15
		buffs.num = math.floor(self:GetWidth() / buffs.size + .5)
		self.Buffs = buffs

		-- Debuffs
		local debuffs = CreateFrame('Frame', nil, self)
		debuffs:SetPoint('TOPLEFT', self, 'BOTTOMLEFT', 0, 0)
		debuffs:SetHeight(15)
		debuffs:SetWidth(self:GetWidth())
		debuffs.initialAnchor = 'TOPLEFT'
		debuffs.size = 15
		debuffs.showDebuffType = true
		debuffs.num = math.floor(self:GetWidth() / debuffs.size + .5)
		self.Debuffs = debuffs
	elseif(params.raidMem) then
		-- Debuffs
		local debuffs = CreateFrame('Frame', nil, self)
		debuffs:SetPoint('TOPRIGHT', self, 'BOTTOMRIGHT', 0, 0)
		debuffs:SetHeight(15)
		debuffs:SetWidth(self:GetWidth())
		debuffs.initialAnchor = 'TOPRIGHT'
		debuffs.size = 15
		debuffs.showDebuffType = true
		debuffs.num = math.floor(self:GetWidth() / (2 * debuffs.size) + .5)
		self.Debuffs = debuffs
	end

	-- Elite Button
	if (params.showElite) then
		local eliteBtn = CreateFrame('Frame', nil, self)
		eliteBtn:SetPoint('LEFT', -frameLayout.buttonSize * 1/2, 0)
		eliteBtn:SetWidth(frameLayout.buttonSize)
		eliteBtn:SetHeight(frameLayout.buttonSize)
		eliteBtn:SetFrameStrata(self:GetFrameStrata())
		eliteBtn:SetFrameLevel(self:GetFrameLevel()+2)

		local eliteBtnBG = eliteBtn:CreateTexture(nil, 'BACKGROUND')
		eliteBtnBG:SetTexture(btnBgTex)
		eliteBtnBG:SetAllPoints(eliteBtn)
		eliteBtnBG:SetVertexColor(1,1,1,1)

		local eliteBtnBrd = eliteBtn:CreateTexture(nil,'OVERLAY')
		eliteBtnBrd:SetTexture(btnBrdTex)
		eliteBtnBrd:SetAllPoints(eliteBtn)

		local eliteBtnDrg = eliteBtn:CreateTexture(nil, 'ARTWORK')
		eliteBtnDrg:SetTexture(drgnTex)
		eliteBtnDrg:SetAllPoints(eliteBtn)

		local eliteBtnGlr = eliteBtn:CreateTexture(nil, 'OVERLAY')
		eliteBtnGlr:SetTexture(btnGlrTex)
		eliteBtnGlr:SetVertexColor(1,1,1,.5)
		eliteBtnGlr:SetAllPoints(eliteBtn)

		self.Elite = eliteBtn
		self.EliteBorder = eliteBtnBrd
		self.EliteDragon = eliteBtnDrg
		self.Elite:Hide()
	end

	if (params.showCastbar) then
		self.Castbar = CreateFrame('StatusBar', nil, self, BackdropTemplateMixin and "BackdropTemplate");
		if (unit == 'player') then
			self.Castbar:SetHeight(params.castBarHeight)
			self.Castbar:SetWidth(params.castBarWidth)
			self.Castbar:SetPoint('CENTER', UIParent, 'CENTER', 0, -params.castBarHeight * 5)
			self.Castbar:SetBackdrop({bgFile='Interface\\Tooltips\\UI-Tooltip-Background', insets ={left = -1, right = -1, top = -1, bottom = -1}})
			self.Castbar:SetBackdropColor(.7, .7, .7, .7)
		elseif (unit == 'target') then
			self.Castbar:SetHeight(params.castBarHeight)
			self.Castbar:SetWidth(params.castBarWidth)
			self.Castbar:SetPoint('CENTER', UIParent, 'CENTER', 0, params.castBarHeight * 3)
			self.Castbar:SetBackdrop({bgFile='Interface\\Tooltips\\UI-Tooltip-Background', insets ={left = -1, right = -1, top = -1, bottom = -1}})
			self.Castbar:SetBackdropColor(.7, .7, .7, .8)
		else
			self.Castbar:SetAllPoints(self.Power)
		end

		self.Castbar:SetStatusBarTexture(castTexture)
		self.Castbar:SetStatusBarColor(1, 1, .50, 1)
		self.Castbar:SetParent(self)
		self.Castbar:SetMinMaxValues(1, 100)
		self.Castbar:SetValue(1)
		self.Castbar:Hide()

		self.Castbar.bg = self.Castbar:CreateTexture(nil, 'BACKGROUND')
		self.Castbar.bg:SetAllPoints(self.Castbar)
		self.Castbar.bg:SetTexture(castTexture)
		if(unit == 'player' or unit == 'target') then
			self.Castbar.bg:SetAlpha(0.25)
		else
			self.Castbar.bg:SetAlpha(0.05)  -- very minimal... this is covering the power bar
		end

		local Spark = self.Castbar:CreateTexture(nil, 'ARTWORK', 5)
    Spark:SetHeight(self.Castbar:GetHeight())
    Spark:SetBlendMode('ADD')
		self.Castbar.Spark = Spark

		if(unit == 'target') then
			local Shield = self.Castbar:CreateTexture(nil, 'OVERLAY')
			Shield:SetAllPoints(self.Castbar)
			Shield:SetTexture(castborderTexture)
			Shield:SetVertexColor(1, .35, .45, 1)  --- red border when can't interrupt
			self.Castbar.Shield = Shield
		end

		self.Castbar.Time = self.Castbar:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
		self.Castbar.Time:SetPoint('RIGHT', self.Castbar, -2, 0)
		self.Castbar.Time:SetFont('GameFontNormal', 10)
		self.Castbar.Time:SetTextColor(1, 1, 1)
		self.Castbar.Time:SetJustifyH('RIGHT')

		self.Castbar.Text = self.Castbar:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
		self.Castbar.Text:SetPoint('LEFT', self.Castbar, 2, 0)
		self.Castbar.Text:SetWidth(240)
		self.Castbar.Text:SetFont('GameFontNormal', 10)
		self.Castbar.Text:SetTextColor(1, 1, 1)
		self.Castbar.Text:SetJustifyH('LEFT')

		self.Castbar.Time:SetTextHeight(12)
		self.Castbar.Text:SetTextHeight(12)

		self.Castbar.SafeZone = self.Castbar:CreateTexture(nil, 'ARTWORK', 3)
		self.Castbar.SafeZone:SetTexture(castTexture)
		self.Castbar.SafeZone:SetVertexColor(.4, .5, .65, 0.8)
		self.Castbar.SafeZone:SetHeight(self.Castbar:GetHeight())
		self.Castbar.SafeZone:SetPoint('RIGHT', self.Castbar)

		if (unit == 'target') then
			self.Castbar:SetAlpha(1)
		else
			self.Castbar:SetAlpha(.7)
		end
	end

	if(unit == 'player' and params.showAltPower) then
		-- Some uses of alternative power
		-- makes it difficult to use a "status bar" - see: https://www.wowhead.com/quest=29890/finding-your-center
		self.AlternativePower = CreateFrame('StatusBar', nil, self)
		self.AlternativePower:SetHeight(params.castBarHeight)
		self.AlternativePower:SetWidth(params.castBarWidth / 2)
		self.AlternativePower:SetPoint('BOTTOM', self.Castbar, 'TOP')
		self.AlternativePower:SetBackdrop({bgFile='Interface\\Tooltips\\UI-Tooltip-Background', insets ={left = -1, right = -1, top = -1, bottom = -1}})
		self.AlternativePower:SetBackdropColor(.7, .7, .7, .7)

		self.AlternativePower:SetStatusBarTexture(castTexture)
		self.AlternativePower:SetStatusBarColor(.67, .78, .94, 1)
		self.AlternativePower:SetMinMaxValues(1, 100)

		self.AlternativePower.bg = self.AlternativePower:CreateTexture(nil, 'BORDER')
		self.AlternativePower.bg:SetAllPoints(self.AlternativePower)
		self.AlternativePower.bg:SetTexture(castTexture)
		self.AlternativePower.bg:SetAlpha(0.05)
	end

	--Raid Icons
	if(self.NamePlate) then
		self.LeaderIndicator = self.NamePlate:CreateTexture(nil, 'OVERLAY')
		self.AssistantIndicator = self.NamePlate:CreateTexture(nil, 'OVERLAY')
		self.MasterLooterIndicator = self.NamePlate:CreateTexture(nil, 'OVERLAY')
		self.RaidTargetIndicator = self.NamePlate:CreateTexture(nil, 'OVERLAY')
	else
		self.LeaderIndicator = self:CreateTexture(nil, 'OVERLAY')
		self.AssistantIndicator = self:CreateTexture(nil, 'OVERLAY')
		self.MasterLooterIndicator = self:CreateTexture(nil, 'OVERLAY')
		self.RaidTargetIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
	end

	self.LeaderIndicator:SetHeight(frameLayout.raidIconSize)
	self.LeaderIndicator:SetWidth(frameLayout.raidIconSize)
	self.LeaderIndicator:SetPoint('BOTTOM', self, 'TOP', 0, -frameLayout.raidIconSize/3)

	self.AssistantIndicator:SetAllPoints(self.LeaderIndicator)

	self.MasterLooterIndicator:SetHeight(frameLayout.raidIconSize)
	self.MasterLooterIndicator:SetWidth(frameLayout.raidIconSize)
	self.MasterLooterIndicator:SetPoint('LEFT', self.LeaderIndicator, 'RIGHT', 0, 0)

	self.RaidTargetIndicator:SetHeight(frameLayout.raidIconSize)
	self.RaidTargetIndicator:SetWidth(frameLayout.raidIconSize)
  if (params.raidMem or params.raidPet or params.raidTarget) then
		self.RaidTargetIndicator:SetPoint('BOTTOMLEFT', self, 'BOTTOMLEFT', 0, 0)
	else
		self.RaidTargetIndicator:SetPoint('LEFT', self.Health, 'LEFT', frameLayout.raidIconSize/3, 0)
	end

	if (params.showPvPIndicator) then
		local PvPIndicator = nil
		if(self.NamePlate) then
			PvPIndicator = self.NamePlate:CreateTexture(nil, 'OVERLAY')
		else
			PvPIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
		end
		PvPIndicator:SetHeight(frameLayout.buttonSize * 5/4)
		PvPIndicator:SetWidth(frameLayout.buttonSize * 5/4)

		if (self.NamePlate) then
			PvPIndicator:SetPoint('CENTER', self.NamePlate, 'LEFT')
		else
			PvPIndicator:SetPoint('CENTER', self, 'TOPLEFT', -frameLayout.buttonSize / 4 , 0)
		end
		self.PvPIndicator = PvPIndicator
	end

	if (params.showPvPClassification) then  -- BGs, etc.: flag carrier, orb carrier, cart holder, bounty
		local PvPClassificationIndicator = nil
		if(self.NamePlate) then
			PvPClassificationIndicator = self.NamePlate:CreateTexture(nil, 'OVERLAY')
		else
			PvPClassificationIndicator = self.NamePlate:CreateTexture(nil, 'OVERLAY')
		end
		PvPClassificationIndicator:SetHeight(frameLayout.buttonSize * 5/4)
		PvPClassificationIndicator:SetWidth(frameLayout.buttonSize * 5/4)

		if (self.NamePlate) then
			PvPClassificationIndicator:SetPoint('CENTER', self.NamePlate, 'RIGHT')
		else
			PvPClassificationIndicator:SetPoint('CENTER', self, 'TOPRIGHT')
		end

		self.PvPClassificationIndicator = PvPClassificationIndicator
	end

	if (params.showGroupRole) then
		if(self.NamePlate) then
			self.GroupRoleIndicator = self.NamePlate:CreateTexture(nil, 'OVERLAY')
		else
			self.GroupRoleIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
		end
		self.GroupRoleIndicator:SetHeight(15)
		self.GroupRoleIndicator:SetWidth(15)
		self.GroupRoleIndicator:SetPoint('CENTER', self, 'BOTTOMRIGHT', 0, 0)
	end

	if (params.showReady) then
		self.ReadyCheckIndicator = self.Power:CreateTexture(nil, 'OVERLAY')
		self.ReadyCheckIndicator:SetHeight(self.Health:GetHeight())
		self.ReadyCheckIndicator:SetWidth(self.Health:GetHeight())
		self.ReadyCheckIndicator:SetPoint('RIGHT', self.Power, 'RIGHT', -self.Power:GetHeight()/4, 0)
	end

	self.Range = {enabled = true}	
	self.Range.outsideAlpha = 0.45

	local healAbsorbBar = CreateFrame('StatusBar', nil, self.Health)
  healAbsorbBar:SetPoint('TOP')
  healAbsorbBar:SetPoint('BOTTOM')
  healAbsorbBar:SetPoint('RIGHT', self.Health:GetStatusBarTexture())
	healAbsorbBar:SetStatusBarTexture(castTexture)
	healAbsorbBar:SetStatusBarColor(.95, .75, .40)
  healAbsorbBar:SetWidth(params.frmWidth)
  healAbsorbBar:SetReverseFill(true)
	healAbsorbBar:SetAlpha(.7)

	local myBar = CreateFrame('StatusBar', nil, self.Health)
	myBar:SetPoint('TOP')
  myBar:SetPoint('BOTTOM')
  myBar:SetPoint('LEFT', healAbsorbBar, 'RIGHT')
	myBar:SetStatusBarColor(.1, .7, .35)
	myBar:SetStatusBarTexture(barTexture)
  myBar:SetWidth(params.frmWidth)
	myBar:SetAlpha(.6)

  local otherBar = CreateFrame('StatusBar', nil, self.Health)
  otherBar:SetPoint('TOP')
  otherBar:SetPoint('BOTTOM')
  otherBar:SetPoint('LEFT', myBar:GetStatusBarTexture(), 'RIGHT')
	otherBar:SetStatusBarColor(.6, .9, .7)
	otherBar:SetStatusBarTexture(barTexture)
  otherBar:SetWidth(params.frmWidth)
	otherBar:SetAlpha(.6)

  local absorbBar = CreateFrame('StatusBar', nil, self.Health)
  absorbBar:SetPoint('TOP')
  absorbBar:SetPoint('BOTTOM')
	absorbBar:SetStatusBarTexture(castTexture)
  absorbBar:SetPoint('LEFT', otherBar:GetStatusBarTexture(), 'RIGHT')
	absorbBar:SetStatusBarColor(.5, .85, .90)
  absorbBar:SetWidth(params.frmWidth)
	absorbBar:SetAlpha(.6)

  local overAbsorb = self.Health:CreateTexture(nil, "OVERLAY")
  overAbsorb:SetPoint('TOP')
  overAbsorb:SetPoint('BOTTOM')
  overAbsorb:SetPoint('LEFT', self.Health, 'RIGHT')
  overAbsorb:SetWidth(params.frmWidth/20)

	local overHealAbsorb = self.Health:CreateTexture(nil, "OVERLAY")
  overHealAbsorb:SetPoint('TOP')
  overHealAbsorb:SetPoint('BOTTOM')
  overHealAbsorb:SetPoint('RIGHT', self.Health, 'LEFT')
  overHealAbsorb:SetWidth(params.frmWidth/20)
	overHealAbsorb:SetAlpha(.75)

	self.HealthPrediction = {
		myBar = myBar,
		otherBar = otherBar,
		absorbBar = absorbBar,
		healAbsorbBar = healAbsorbBar,
		overAbsorb = overAbsorb,
		overHealAbsorb = overHealAbsorb,
		maxOverflow = 1.05,
		frequentUpdates = true,
	}


	if (params.scale) then
		self:SetScale(params.scale)
	end

end

oUF:RegisterStyle('Stoglim', setmetatable({
	['initial-width'] = pwidth,
	['initial-height'] = pheight,
}, {__call = stogStyle}))

oUF:Factory(function(self)
	local player = oUF:Spawn('player')
	player:SetPoint('BOTTOMRIGHT', UIParent, 'CENTER', -300, 30)
	local target = oUF:Spawn('target')
	target:SetPoint('BOTTOMLEFT', UIParent, 'CENTER', 300, 30)

	local pet = oUF:Spawn('pet'):SetPoint('TOP', player, 'BOTTOM', 20, -30)
	local tot = oUF:Spawn('targettarget'):SetPoint('TOPLEFT', target, 'TOPRIGHT', 8, -25)
	local focus = oUF:Spawn('focus'):SetPoint('TOPRIGHT', player, 'TOPLEFT', -8, -25)

	-- Arena frames
	for i = 1, 5 do
		local arena = self:Spawn('arena' .. i)

		if(i == 1) then
			arena:SetPoint('TOPLEFT', UIParent, 'TOPLEFT', frameLayout.arena.offset.x, frameLayout.arena.offset.y)
		else
			arena:SetPoint('TOP', _G['oUF_StoglimArena' .. i - 1], 'BOTTOM', 0, -50)
		end
	end

	-- Boss Frames
	for i = 1, MAX_BOSS_FRAMES do
			local boss = self:Spawn('boss' .. i)

			if(i == 1) then
				boss:SetPoint('TOPLEFT', UIParent, 'TOPLEFT', frameLayout.boss.offset.x, frameLayout.boss.offset.y)
			else
				boss:SetPoint('TOP', _G['oUF_StoglimBoss' .. i - 1], 'BOTTOM', 0, -50)
			end
	end

	party = oUF:SpawnHeader('oUF_StoglimParty', nil, nil,
		'showParty', true,
		'showPlayer', false,
		'showSolo', false,
		'showRaid', false,
		'yoffset', -80,
		'xOffset', 0,
		'maxColumns', frameLayout.partyHeader.columns,
		'unitsperColumn', frameLayout.partyHeader.rows,
		'columnSpacing', frameLayout.partyHeader.columnGutter,
		'columnAnchorPoint', 'LEFT',
		'template', 'PartyBT'
	)
	party:SetPoint('CENTER', frameLayout.partyHeader.offsetX, frameLayout.partyHeader.offsetY)

	raid15 = oUF:SpawnHeader('oUF_StoglimRaid15', nil, nil,
		'showParty', false,
		'showPlayer', true,
		'showSolo', false,
		'showRaid', true,
		'yoffset', -18,
		'xOffset', 0,
		'maxColumns', 3,
		'unitsperColumn', 5,
		'columnSpacing', frameLayout.raidHeaders.raid15ColumnGutter,
		'columnAnchorPoint', 'LEFT',
		'template','Raid15BT',
		'groupBy', 'GROUP',
		'groupingOrder', '1,2,3,4,5,6,7,8',
		'sortMethod', 'INDEX'
	)
	raid15:SetPoint('CENTER', frameLayout.raidHeaders.raidOffsetX, frameLayout.raidHeaders.raidOffsetY)

	raid25 = oUF:SpawnHeader('oUF_StoglimRaid25', nil, nil,
		'showParty', false,
		'showPlayer', true,
		'showSolo', false,
		'showRaid', true,
		'yoffset', -10,
		'xOffset', 0,
		'maxColumns', 5,
		'unitsperColumn', 5,
		'columnSpacing', frameLayout.raidHeaders.raid25ColumnGutter,
		'columnAnchorPoint', 'LEFT',
		'template','Raid25BT',
		'groupBy', 'GROUP',
		'groupingOrder', '1,2,3,4,5,6,7,8',
		'sortMethod', 'INDEX'
	)
	raid25:SetPoint('CENTER', frameLayout.raidHeaders.raidOffsetX, frameLayout.raidHeaders.raidOffsetY)

	raid40 = oUF:SpawnHeader('oUF_StoglimRaid40', nil, nil,
		'showParty', false,
		'showPlayer', true,
		'showSolo', false,
		'showRaid', true,
		'yoffset', -20,
		'xOffset', 0,
		'maxColumns', 8,
		'unitsperColumn', 5,
		'columnSpacing', frameLayout.raidHeaders.raid40ColumnGutter,
		'columnAnchorPoint', 'LEFT',
		'template','Raid40BT',
		'groupBy', 'GROUP',
		'groupingOrder', '1,2,3,4,5,6,7,8',
		'sortMethod', 'INDEX'
	)
	raid40:SetPoint('CENTER', frameLayout.raidHeaders.raidOffsetX, frameLayout.raidHeaders.raidOffsetY)

	raid15:Hide()
	raid25:Hide()
	raid40:Hide()
	party:Show()
end)

local raidToggle = CreateFrame('Frame')
raidToggle:RegisterEvent('PLAYER_LOGIN')
raidToggle:RegisterEvent('GROUP_ROSTER_UPDATE')
raidToggle:RegisterEvent('PARTY_LEADER_CHANGED')
raidToggle:RegisterEvent('GROUP_JOINED')
raidToggle:SetScript('OnEvent', function(self)
	if not InCombatLockdown() or event == "PLAYER_LEAVE_COMBAT" then
		self:UnregisterEvent("PLAYER_LEAVE_COMBAT")
		if (GetNumGroupMembers() > 25) then
			raid40:Show()
			raid25:Hide()
			raid15:Hide()
			party:Hide()
		elseif(GetNumGroupMembers() > 15) then
			raid40:Hide()
			raid25:Show()
			raid15:Hide()
			party:Hide()
		elseif(GetNumGroupMembers() > 5) then
			raid40:Hide()
			raid25:Hide()
			raid15:Show()
			party:Hide()
		else
			raid40:Hide()
			raid25:Hide()
			raid15:Hide()
			party:Show()
		end
	else
		print('- raidToggle called in combat lockdown!  ')
		self:RegisterEvent("PLAYER_LEAVE_COMBAT")
	end
end)

oUF:SetActiveStyle('Stoglim')
