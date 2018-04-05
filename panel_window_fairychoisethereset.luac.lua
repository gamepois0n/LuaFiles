-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\fairyinfo\panel_window_fairychoisethereset.luac 

-- params : ...
-- function num : 0
Panel_Window_FairyChoiseTheReset:SetShow(false)
PaGlobal_FairyChoice = {_isClearSkill = false, _fairyAttr = false, _fairyNo = nil, 
_ui = {_close = (UI.getChildControl)(Panel_Window_FairyChoiseTheReset, "Button_Close"), _select = (UI.getChildControl)(Panel_Window_FairyChoiseTheReset, "Button_Select"), _cancel = (UI.getChildControl)(Panel_Window_FairyChoiseTheReset, "Button_Cancel"), _skillClear = (UI.getChildControl)(Panel_Window_FairyChoiseTheReset, "RadioButton_Skill"), _voiceClear = (UI.getChildControl)(Panel_Window_FairyChoiseTheReset, "RadioButton_Voice")}
}
-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FairyChoice.Open = function(self)
  -- function num : 0_0
  if PaGlobal_FairyInfo_isUnseal() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoNeedSealFairy"))
    return 
  end
  PaGlobal_FairyChoice:Clear()
  PaGlobal_FairyChoice:Update()
  Panel_Window_FairyChoiseTheReset:SetShow(true)
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FairyChoice.Close = function(self)
  -- function num : 0_1
  Panel_Window_FairyChoiseTheReset:SetShow(false)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FairyChoice.Clear = function(self)
  -- function num : 0_2
  self._isClearSkill = true
  self._fairyAttr = false
  ;
  ((self._ui)._skillClear):SetCheck(true)
  ;
  ((self._ui)._voiceClear):SetCheck(false)
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FairyChoice.Update = function(self)
  -- function num : 0_3
  PaGlobal_FairyChoice:Clear()
  self._fairyNo = PaGlobal_FairyInfo_GetFairyNo()
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FairyChoice.RequestRebirth = function(self)
  -- function num : 0_4
  local FunctionYes = function()
    -- function num : 0_4_0
    local self = PaGlobal_FairyChoice
    if self._fairyNo == nil then
      return 
    end
    if PaGlobal_FairyInfo_GetLevel() < 10 and self._isClearSkill == true then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrCantRebirthLessLevel"))
      return 
    end
    ToClient_FairyRebirth(self._fairyNo, self._isClearSkill, self._fairyAttr)
    PaGlobal_FairyChoice:Close()
  end

  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING")
  local _contenet = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_REBIRTH_ALERT")
  if self._fairyAttr == true then
    _contenet = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRY_REBIRTH_ALERT_CHANGE_VOICE")
  end
  local messageBoxData = {title = _title, content = _contenet, functionYes = FunctionYes, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FairyChoice.Initialize = function(self)
  -- function num : 0_5
  ((self._ui)._close):addInputEvent("Mouse_LUp", "PaGlobal_FairyChoice:Close()")
  ;
  ((self._ui)._cancel):addInputEvent("Mouse_LUp", "PaGlobal_FairyChoice:Close()")
  ;
  ((self._ui)._select):addInputEvent("Mouse_LUp", "PaGlobal_FairyChoice:RequestRebirth()")
  ;
  ((self._ui)._skillClear):addInputEvent("Mouse_LUp", "PaGlobal_FairyChoice:ClickedSkill(true)")
  ;
  ((self._ui)._voiceClear):addInputEvent("Mouse_LUp", "PaGlobal_FairyChoice:ClickedSkill(false)")
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_FairyChoice.ClickedSkill = function(self, bValue)
  -- function num : 0_6
  if bValue == true then
    self._isClearSkill = true
    self._fairyAttr = false
  else
    self._isClearSkill = false
    self._fairyAttr = true
  end
end

TestUpgrade = function()
  -- function num : 0_7
  ToClient_FairyUpgradeRequest(PaGlobal_FairyInfo_GetFairyNo(), 0, 2, 50)
end

PaGlobal_FairyChoice:Initialize()

