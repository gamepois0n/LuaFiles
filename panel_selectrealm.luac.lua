-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\panel_selectrealm.luac 

-- params : ...
-- function num : 0
Panel_SelectRealm:SetShow(false)
PaGlobal_SelectRealm = {_selectedRealm = 0}
-- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SelectRealm.init = function(self)
  -- function num : 0_0
  local Base = (UI.getChildControl)(Panel_SelectRealm, "Static_SelectRealmBG")
  local buttonCalpheon = (UI.getChildControl)(Base, "Button_Calpheon")
  local buttonMediah = (UI.getChildControl)(Base, "Button_Mediah")
  local buttonValencia = (UI.getChildControl)(Base, "Button_Valencia")
  local buttonCancel = (UI.getChildControl)(Base, "Button_Cancel")
  buttonCalpheon:addInputEvent("Mouse_LUp", "HandleClickedButtonRealm(1)")
  buttonMediah:addInputEvent("Mouse_LUp", "HandleClickedButtonRealm(2)")
  buttonValencia:addInputEvent("Mouse_LUp", "HandleClickedButtonRealm(3)")
  buttonCancel:addInputEvent("Mouse_LUp", "HandleClickedButtonCancel()")
end

-- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SelectRealm.RequestSelectComplete = function(self)
  -- function num : 0_1
  _PA_LOG("μ‘°μ¬μ\144", tostring(self._selectedRealm) .. "μ§μμ\180 μ ν λμμ΅λλ\164.")
  Panel_SelectRealm:SetShow(false)
end

-- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SelectRealm.ClickedButtonRealm = function(self, realm)
  -- function num : 0_2
  self._selectedRealm = realm
  local messageBoxData = {title = "μ§μ μ ν", content = tostring(realm) .. "λ²\136 μ§μμ\132 μ ν νμ΅λλ€. \n νμ  νκ² μ΅λκΉ\140?", functionYes = RequestSelectComplete, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClickedButtonRealm = function(realm)
  -- function num : 0_3
  local self = PaGlobal_SelectRealm
  self:ClickedButtonRealm(realm)
end

HandleClickedButtonCancel = function()
  -- function num : 0_4
  Panel_SelectRealm:SetShow(false)
end

FromClient_selectRealm = function()
  -- function num : 0_5
  Panel_SelectRealm:SetShow(true)
end

RequestSelectComplete = function()
  -- function num : 0_6
  local self = PaGlobal_SelectRealm
  self:RequestSelectComplete()
end

registerEvent("FromClient_selectRealm", "FromClient_selectRealm")
PaGlobal_SelectRealm:init()

