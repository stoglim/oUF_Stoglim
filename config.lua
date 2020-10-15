
function CancelButton_OnClick()
end


function configFramep_OnLoad(panel)
	panel:RegisterEvent("ADDON_LOADED");
	panel:RegisterEvent("PLAYER_LOGOUT");
    panel.name = "oUF_Stoglm";

    panel.okay = function (self) SaveButton_OnClick(panel); end;
    panel.cancel = function (self) CancelButton_OnClick();  end;

    -- Add the panel to the Interface Options
    --
    InterfaceOptions_AddCategory(panel);

	panel:SetScript('OnEvent', configFramep_OnEvent);
end


local oUFStoglimCfg = CreateFrame("Frame", "oUF_Stoglim_Panel", UIParent);

local eb = CreateFrame("EditBox", "ebScale", oUFStoglimCfg, "InputBoxTemplate")
	eb:SetMultiLine(false)
    eb:SetAutoFocus(false)
	eb:SetHeight(52)
	eb:SetWidth(100)
	eb:SetPoint('TOPLEFT', oUFStoglimCfg, 'TOPLEFT', 50, -50)
	eb:SetFontObject("ChatFontNormal")

oUFStoglimCfg.EditBox = eb;
configFramep_OnLoad(oUFStoglimCfg);

function configFramep_OnEvent(self, event, ...)	
	if(thisThing) then
	else 
		thisThing = '123';
	end
	
	print('plls'..thisThing)
	oUFStoglimCfg.EditBox:SetText(thisThing)
end

function SaveButton_OnClick(panel)
	print(oUFStoglimCfg.EditBox:GetText());
	thisThing = oUFStoglimCfg.EditBox:GetText()
end
 
