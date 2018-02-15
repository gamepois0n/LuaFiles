-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fairyinfo\panel_window_fairyregister.luac 

-- params : ...
-- function num : 0
Panel_Window_FairyRegister:SetShow(false)
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
local uiStatic_FairyRegister = (UI.getChildControl)(Panel_Window_FairyRegister, "Static_FairyRegister")
local uiStatic_FairyBG = (UI.getChildControl)(uiStatic_FairyRegister, "Static_SettingMainBG")
local FairyRegister = {uiSlot_HpItem = (UI.getChildControl)(uiStatic_FairyBG, "Static_HPItemSlotBig"), uiSlot_MpItem = (UI.getChildControl)(uiStatic_FairyBG, "Static_MPItemSlotBig"), uiEdit_FairyName = (UI.getChildControl)(uiStatic_FairyRegister, "Edit_Naming"), uiIcon_FairyIcon = (UI.getChildControl)(uiStatic_FairyRegister, "Static_FairySlotBG"), 
Radio_HpRate = {[10] = (UI.getChildControl)(uiStatic_FairyBG, "Radiobutton_HP10Percent"), [20] = (UI.getChildControl)(uiStatic_FairyBG, "Radiobutton_HP20Percent"), [30] = (UI.getChildControl)(uiStatic_FairyBG, "Radiobutton_HP30Percent"), [50] = (UI.getChildControl)(uiStatic_FairyBG, "Radiobutton_HP50Percent")}
, 
Radio_MpRate = {[10] = (UI.getChildControl)(uiStatic_FairyBG, "Radiobutton_MP10Percent"), [20] = (UI.getChildControl)(uiStatic_FairyBG, "Radiobutton_MP20Percent"), [30] = (UI.getChildControl)(uiStatic_FairyBG, "Radiobutton_MP30Percent"), [50] = (UI.getChildControl)(uiStatic_FairyBG, "Radiobutton_MP50Percent")}
}
FromClient_InputFairyName = function(fromWhereType, fromSlotNo)
  -- function num : 0_0
  FromClient_InputPetName(fromWhereType, fromSlotNo)
end

FairyRegister.SetPosition = function(self)
  -- function num : 0_1
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_FairyRegister:GetSizeX()
  local panelSizeY = Panel_Window_FairyRegister:GetSizeY()
  Panel_Window_FairyRegister:SetPosX(scrSizeX / 2 - panelSizeX - 50)
  Panel_Window_FairyRegister:SetPosY(scrSizeY / 2 - panelSizeY / 2 - 100)
end

HandleClicked_FairyRegister_ClearEdit = function()
  -- function num : 0_2 , upvalues : FairyRegister
  local self = FairyRegister
  ;
  (self.uiEdit_FairyName):SetEditText("", false)
  SetFocusEdit(self.uiEdit_FairyName)
end

registerEvent("FromClient_InputFairyName", "FromClient_InputFairyName")

