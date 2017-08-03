-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tutorial\panel_tutorial_uiheadlinemessage.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialUiHeadlineMessage = {
_ui = {_purposeText = (UI.getChildControl)(Panel_Tutorial, "StaticText_Purpose"), _nextStep_1 = (UI.getChildControl)(Panel_Tutorial, "StaticText_Step_1"), _nextStep_2 = (UI.getChildControl)(Panel_Tutorial, "StaticText_Step_2"), _nextStep_3 = (UI.getChildControl)(Panel_Tutorial, "StaticText_Step_3"), _nextStep_4 = (UI.getChildControl)(Panel_Tutorial, "StaticText_Step_4"), _nextArrow_0 = (UI.getChildControl)(Panel_Tutorial, "Static_NextArrow_0"), _nextArrow_1 = (UI.getChildControl)(Panel_Tutorial, "Static_NextArrow_1"), _nextArrow_2 = (UI.getChildControl)(Panel_Tutorial, "Static_NextArrow_2"), _clearStep_1 = (UI.getChildControl)(Panel_Tutorial, "Static_Clear_Step1"), _clearStep_2 = (UI.getChildControl)(Panel_Tutorial, "Static_Clear_Step2"), _clearStep_3 = (UI.getChildControl)(Panel_Tutorial, "Static_Clear_Step3"), _clearStep_4 = (UI.getChildControl)(Panel_Tutorial, "Static_Clear_Step4")}
}
-- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.setPurposeText = function(self, string)
  -- function num : 0_0
  if string == nil then
    ((self._ui)._purposeText):SetText("")
  else
    ;
    ((self._ui)._purposeText):SetText(string)
  end
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.setShow = function(self, key, isShow)
  -- function num : 0_1
  ((self._ui)[key]):SetShow(isShow)
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.setAlpha = function(self, key, value)
  -- function num : 0_2
  ((self._ui)[key]):SetAlpha(value)
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.addEffect = function(self, key, effectName, isLoop, posX, posY)
  -- function num : 0_3
  ((self._ui)[key]):AddEffect(effectName, isLoop, posX, posY)
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.setShowAll = function(self, isShow)
  -- function num : 0_4
  for key,value in pairs(self._ui) do
    value:SetShow(isShow)
  end
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.setAlphaAll = function(self, value)
  -- function num : 0_5
  for key,value in pairs(self._ui) do
    value:SetAlpha(value)
  end
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.setTextPurposeText = function(self, text)
  -- function num : 0_6
  ((self._ui)._purposeText):SetText(text)
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.computePosAll = function(self)
  -- function num : 0_7
  ((self._ui)._purposeText):ComputePos()
  ;
  ((self._ui)._nextStep_1):ComputePos()
  ;
  ((self._ui)._nextStep_2):ComputePos()
  ;
  ((self._ui)._nextStep_3):ComputePos()
  ;
  ((self._ui)._nextStep_4):ComputePos()
  ;
  ((self._ui)._nextArrow_0):ComputePos()
  ;
  ((self._ui)._nextArrow_1):ComputePos()
  ;
  ((self._ui)._nextArrow_2):ComputePos()
  ;
  ((self._ui)._clearStep_1):ComputePos()
  ;
  ((self._ui)._clearStep_2):ComputePos()
  ;
  ((self._ui)._clearStep_3):ComputePos()
  ;
  ((self._ui)._clearStep_4):ComputePos()
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.resetShowAll = function(self)
  -- function num : 0_8
  self:computePosAll()
  ;
  ((self._ui)._nextStep_1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_STEP1"))
  ;
  ((self._ui)._nextStep_2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_STEP2"))
  ;
  ((self._ui)._nextStep_3):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_STEP3"))
  ;
  ((self._ui)._nextStep_4):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_STEP4"))
  ;
  ((self._ui)._nextStep_1):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._nextStep_2):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._nextStep_3):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._nextStep_4):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._nextStep_1):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextStep_2):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextStep_3):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextStep_4):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextArrow_0):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextArrow_1):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextArrow_2):SetColor((Defines.Color).C_FFFFFFFF)
  self:setShowAll(true)
  ;
  ((self._ui)._clearStep_1):SetShow(false)
  ;
  ((self._ui)._clearStep_2):SetShow(false)
  ;
  ((self._ui)._clearStep_3):SetShow(false)
  ;
  ((self._ui)._clearStep_4):SetShow(false)
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.addClearStepEffect = function(self, clearCount)
  -- function num : 0_9
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._purposeText):AddEffect("fUI_Gauge_BigWhite", false, 0, 0)
  local uiClearStepKey, uiNextStepKey, uiNextArrow = nil, nil, nil
  if clearCount == 1 then
    uiClearStepKey = "_clearStep_1"
    uiNextStepKey = "_nextStep_1"
    uiNextArrow = "_nextArrow_0"
  else
    if clearCount == 2 then
      uiClearStepKey = "_clearStep_2"
      uiNextStepKey = "_nextStep_2"
      uiNextArrow = "_nextArrow_1"
    else
      if clearCount == 3 then
        uiClearStepKey = "_clearStep_3"
        uiNextStepKey = "_nextStep_3"
        uiNextArrow = "_nextArrow_2"
      else
        if clearCount == 4 then
          uiClearStepKey = "_clearStep_4"
          uiNextStepKey = "_nextStep_4"
          uiNextArrow = nil
        end
      end
    end
  end
  ;
  ((self._ui)[uiNextStepKey]):SetFontColor((Defines.Color).C_FFB5FF6D)
  ;
  ((self._ui)[uiClearStepKey]):SetShow(true)
  ;
  ((self._ui)[uiClearStepKey]):AddEffect("fUI_Light", false, 0, 0)
  ;
  ((self._ui)[uiClearStepKey]):AddEffect("UI_Check01", false, -2, 0)
  ;
  ((self._ui)[uiClearStepKey]):AddEffect("fL_CheckSpark01", false, -2, 0)
  if uiNextArrow ~= nil then
    ((self._ui)[uiNextArrow]):SetColor((Defines.Color).C_FFB5FF6D)
  end
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiHeadlineMessage.resetClearStepEffect = function(self)
  -- function num : 0_10
  self:computePosAll()
  ;
  ((self._ui)._nextStep_1):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextStep_2):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextStep_3):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextStep_4):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextArrow_0):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextArrow_1):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._nextArrow_2):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._clearStep_1):EraseAllEffect()
  ;
  ((self._ui)._clearStep_2):EraseAllEffect()
  ;
  ((self._ui)._clearStep_3):EraseAllEffect()
  ;
  ((self._ui)._clearStep_4):EraseAllEffect()
  ;
  ((self._ui)._clearStep_1):SetShow(false)
  ;
  ((self._ui)._clearStep_2):SetShow(false)
  ;
  ((self._ui)._clearStep_3):SetShow(false)
  ;
  ((self._ui)._clearStep_4):SetShow(false)
end


