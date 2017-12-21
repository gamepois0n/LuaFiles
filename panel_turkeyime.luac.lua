-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\turkeyime\panel_turkeyime.luac 

-- params : ...
-- function num : 0
local VCK = CppEnums.VirtualKeyCode
Panel_TurkeyIME:SetShow(false)
PaGlobal_TurkeyIME = {
_ui = {_buttonKeyboard = (UI.getChildControl)(Panel_TurkeyIME, "Button_Keyboard"), _staticInputTurkeyLan = (UI.getChildControl)(Panel_TurkeyIME, "Static_KeyBG"), 
_buttonTurkeyLan = {}
, 
_buttonTurkeyUpperLan = {}
}
, 
_turkeyLanLower = {[1] = "ç", [2] = "ğ", [3] = "ı", [4] = "ö", [5] = "ş", [6] = "ü"}
, 
_turkeyLanUpper = {[1] = "Ç", [2] = "Ğ", [3] = "I", [4] = "Ö", [5] = "Ş", [6] = "Ü"}
, _turkeyLanCount = 6, _isShiftMode = false}
-- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TurkeyIME.Init = function(self)
  -- function num : 0_0
  ((self._ui)._buttonKeyboard):addInputEvent("Mouse_LUp", "PaGlobal_TurkeyIME:ToggleInputTurkeyLan()")
  for ii = 1, self._turkeyLanCount do
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._buttonTurkeyLan)[ii] = (UI.getChildControl)((self._ui)._staticInputTurkeyLan, "Button_" .. ii)
    ;
    (((self._ui)._buttonTurkeyLan)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_TurkeyIME:SetInputTurkeyLan(" .. ii .. ")")
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._buttonTurkeyUpperLan)[ii] = (UI.getChildControl)((self._ui)._staticInputTurkeyLan, "Button_Upper" .. ii)
    ;
    (((self._ui)._buttonTurkeyUpperLan)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_TurkeyIME:SetInputTurkeyLan(" .. ii .. ")")
    ;
    (((self._ui)._buttonTurkeyUpperLan)[ii]):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TurkeyIME.ToggleInputTurkeyLan = function(self)
  -- function num : 0_1
  if ((self._ui)._staticInputTurkeyLan):GetShow() == true then
    ((self._ui)._staticInputTurkeyLan):SetShow(false)
    Panel_TurkeyIME:RegisterUpdateFunc("")
  else
    ;
    ((self._ui)._staticInputTurkeyLan):SetShow(true)
    Panel_TurkeyIME:RegisterUpdateFunc("FromClient_TurkeyInputUpdate")
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TurkeyIME.SetInputTurkeyLan = function(self, index)
  -- function num : 0_2
  local uiEdit = GetFocusEdit()
  local turkeyLan = self:GetTurkeyLan(index)
  uiEdit:SetEditText(uiEdit:GetEditText() .. turkeyLan, true)
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TurkeyIME.GetTurkeyLan = function(self, index)
  -- function num : 0_3 , upvalues : VCK
  if self._turkeyLanCount < index or index <= 0 then
    return ""
  end
  if isKeyPressed(VCK.KeyCode_SHIFT) == true then
    return (self._turkeyLanUpper)[index]
  else
    return (self._turkeyLanLower)[index]
  end
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TurkeyIME.UpdateShiftKey = function(self)
  -- function num : 0_4 , upvalues : VCK
  local beforeState = self._isShiftMode
  if isKeyPressed(VCK.KeyCode_SHIFT) == true then
    self._isShiftMode = true
  else
    self._isShiftMode = false
  end
  if beforeState ~= self._isShiftMode then
    for ii = 1, self._turkeyLanCount do
      if self._isShiftMode == true then
        (((self._ui)._buttonTurkeyUpperLan)[ii]):SetShow(true)
      else
        ;
        (((self._ui)._buttonTurkeyUpperLan)[ii]):SetShow(false)
      end
    end
  end
end

FromClient_TurkeyInputUpdate = function()
  -- function num : 0_5
  PaGlobal_TurkeyIME:UpdateShiftKey()
end

FromClient_OpenTurkeyInput = function()
  -- function num : 0_6
  Panel_TurkeyIME:SetShow(true)
  ;
  ((PaGlobal_TurkeyIME._ui)._staticInputTurkeyLan):SetShow(false)
  local uiEdit = GetFocusEdit()
  if uiEdit == nil then
    return 
  end
  local uiEdit = GetFocusEdit()
  local uiEditPanel = uiEdit:GetParentPanel()
  local imeSizeX = ((PaGlobal_TurkeyIME._ui)._buttonKeyboard):GetSizeX()
  Panel_TurkeyIME:SetPosX(uiEditPanel:GetPosX() + uiEdit:GetPosX() + uiEdit:GetSizeX() - imeSizeX)
  Panel_TurkeyIME:SetPosY(uiEditPanel:GetPosY() + uiEdit:GetPosY() + uiEdit:GetSizeY() + 3)
end

FromClient_CloseTurkeyInput = function()
  -- function num : 0_7
  Panel_TurkeyIME:SetShow(false)
  Panel_TurkeyIME:RegisterUpdateFunc("")
end

PaGlobal_TurkeyIME:Init()
registerEvent("FromClient_OpenTurkeyInput", "FromClient_OpenTurkeyInput")
registerEvent("FromClient_CloseTurkeyInput", "FromClient_CloseTurkeyInput")

