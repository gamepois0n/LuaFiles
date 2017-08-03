-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\keytutorial.luac 

-- params : ...
-- function num : 0
local VCK = CppEnums.VirtualKeyCode
local _updateGab = 0.1
local _updateTime = 0
local TutorialUI = {_uiTextGole = (UI.getChildControl)(Panel_KeyTutorial, "Text_Gole"), _uiButtonW = (UI.getChildControl)(Panel_KeyTutorial, "Button_W"), _uiButtonA = (UI.getChildControl)(Panel_KeyTutorial, "Button_A"), _uiButtonS = (UI.getChildControl)(Panel_KeyTutorial, "Button_S"), _uiButtonD = (UI.getChildControl)(Panel_KeyTutorial, "Button_D"), _uiButtonF = (UI.getChildControl)(Panel_KeyTutorial, "Button_F"), _uiButtonE = (UI.getChildControl)(Panel_KeyTutorial, "Button_E"), _uiButtonML = (UI.getChildControl)(Panel_KeyTutorial, "Mouse_Left"), _uiButtonMR = (UI.getChildControl)(Panel_KeyTutorial, "Mouse_Right"), _uiButtonShift = (UI.getChildControl)(Panel_KeyTutorial, "Button_Shift"), _uiButtonSpace = (UI.getChildControl)(Panel_KeyTutorial, "Button_Space"), _uiButtonTab = (UI.getChildControl)(Panel_KeyTutorial, "Button_Tab")}
TutorialUI.Show = function(self)
  -- function num : 0_0
  Panel_KeyTutorial:SetShow(true)
  ;
  (self._uiButtonW):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonW):SetIgnore(true)
  ;
  (self._uiButtonA):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonA):SetIgnore(true)
  ;
  (self._uiButtonS):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonS):SetIgnore(true)
  ;
  (self._uiButtonD):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonD):SetIgnore(true)
  ;
  (self._uiButtonF):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonF):SetIgnore(true)
  ;
  (self._uiButtonE):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonE):SetIgnore(true)
  ;
  (self._uiButtonML):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonML):SetIgnore(true)
  ;
  (self._uiButtonMR):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonMR):SetIgnore(true)
  ;
  (self._uiButtonShift):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonShift):SetIgnore(true)
  ;
  (self._uiButtonSpace):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonSpace):SetIgnore(true)
  ;
  (self._uiButtonTab):SetColor((Defines.Color).C_FF444444)
  ;
  (self._uiButtonTab):SetIgnore(true)
end

TutorialUI.Hide = function(self)
  -- function num : 0_1
  Panel_KeyTutorial:SetShow(false)
end

TutorialUI.CheckKeyPressed = function(self)
  -- function num : 0_2 , upvalues : VCK
  (self._uiButtonW):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.ActionInputType).ActionInputType_MoveFront))
  ;
  (self._uiButtonA):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.ActionInputType).ActionInputType_MoveLeft))
  ;
  (self._uiButtonS):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.ActionInputType).ActionInputType_MoveBack))
  ;
  (self._uiButtonD):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.ActionInputType).ActionInputType_MoveRight))
  ;
  (self._uiButtonF):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.ActionInputType).ActionInputType_Kick))
  ;
  (self._uiButtonE):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed((CppEnums.ActionInputType).ActionInputType_CrouchOrSkill))
  ;
  (self._uiButtonShift):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed(VCK.ActionInputType_Dash))
  ;
  (self._uiButtonSpace):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed(VCK.ActionInputType_Jump))
  ;
  (self._uiButtonTab):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed(VCK.ActionInputType_WeaponInOut))
  ;
  (self._uiButtonML):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed(VCK.ActionInputType_Attack1))
  ;
  (self._uiButtonMR):SetCheck(GlobalKeyBinder_CheckCustomKeyPressed(VCK.ActionInputType_Attack2))
end

TutorialUI.SetGole = function(self, textGole)
  -- function num : 0_3
  (self._uiTextGole):SetText(textGole)
end

TutorialUI.SetForMove = function(self, textGole)
  -- function num : 0_4 , upvalues : TutorialUI
  TutorialUI:Show()
  ;
  (self._uiTextGole):SetText(textGole)
  ;
  (self._uiButtonW):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  (self._uiButtonA):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  (self._uiButtonS):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  (self._uiButtonD):SetColor((Defines.Color).C_FFFFFFFF)
end

TutorialUI.SetForRun = function(self, textGole)
  -- function num : 0_5 , upvalues : TutorialUI
  TutorialUI:Show()
  ;
  (self._uiTextGole):SetText(textGole)
  ;
  (self._uiButtonW):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  (self._uiButtonShift):SetColor((Defines.Color).C_FFFFFFFF)
end

TutorialUI.SetForTab = function(self, textGole)
  -- function num : 0_6 , upvalues : TutorialUI
  TutorialUI:Show()
  ;
  (self._uiTextGole):SetText(textGole)
  ;
  (self._uiButtonTab):SetColor((Defines.Color).C_FFFFFFFF)
end

TutorialUI.SetForLeftAttack = function(self, textGole)
  -- function num : 0_7 , upvalues : TutorialUI
  TutorialUI:Show()
  ;
  (self._uiTextGole):SetText(textGole)
  ;
  (self._uiButtonML):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  (self._uiButtonMR):SetColor((Defines.Color).C_FFFFFFFF)
end

TutorialUI.SetForKick = function(self, textGole)
  -- function num : 0_8 , upvalues : TutorialUI
  TutorialUI:Show()
  ;
  (self._uiTextGole):SetText(textGole)
  ;
  (self._uiButtonF):SetColor((Defines.Color).C_FFFFFFFF)
end

TutorialUI.SetForKeyE = function(self, textGole)
  -- function num : 0_9 , upvalues : TutorialUI
  TutorialUI:Show()
  ;
  (self._uiTextGole):SetText(textGole)
  ;
  (self._uiButtonE):SetColor((Defines.Color).C_FFFFFFFF)
end

local Tutorial = {_currentStep = 0, _pushed_key = false, _pushed_time = 0, 
_currentTutorial = {}
}
Tutorial.Clear = function(self)
  -- function num : 0_10
  self._pushed_key = false
  self._pushed_time = 0
end

Tutorial.StepMove = function(self)
  -- function num : 0_11 , upvalues : Tutorial, TutorialUI
  Tutorial:Clear()
  TutorialUI:SetForMove(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_MESSAGE1"))
  Panel_KeyTutorial:RegisterUpdateFunc("Update_StepMove")
end

Update_StepMove = function(deltaTime)
  -- function num : 0_12 , upvalues : _updateTime, _updateGab, TutorialUI, Tutorial
  _updateTime = _updateTime + deltaTime
  if _updateGab < _updateTime then
    TutorialUI:CheckKeyPressed()
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

    if (TutorialUI._uiButtonW):IsCheck() or (TutorialUI._uiButtonA):IsCheck() or (TutorialUI._uiButtonS):IsCheck() or (TutorialUI._uiButtonD):IsCheck() then
      Tutorial._pushed_time = Tutorial._pushed_time + _updateTime
    end
    _updateTime = 0
    if Tutorial._pushed_time > 5 then
      (Tutorial._currentTutorial):NextStep()
    end
  end
end

Tutorial.StepRun = function(self)
  -- function num : 0_13 , upvalues : Tutorial, TutorialUI
  Tutorial:Clear()
  TutorialUI:SetForRun(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_MESSAGE2"))
  Panel_KeyTutorial:RegisterUpdateFunc("Update_StepRun")
end

Update_StepRun = function(deltaTime)
  -- function num : 0_14 , upvalues : _updateTime, _updateGab, TutorialUI, Tutorial
  _updateTime = _updateTime + deltaTime
  if _updateGab < _updateTime then
    TutorialUI:CheckKeyPressed()
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

    if (TutorialUI._uiButtonW):IsCheck() and (TutorialUI._uiButtonShift):IsCheck() then
      Tutorial._pushed_time = Tutorial._pushed_time + _updateTime
    end
    _updateTime = 0
    if Tutorial._pushed_time > 5 then
      (Tutorial._currentTutorial):NextStep()
    end
  end
end

Tutorial.StepLeftAttack = function(self)
  -- function num : 0_15 , upvalues : Tutorial, TutorialUI
  Tutorial:Clear()
  TutorialUI:SetForLeftAttack(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_MESSAGE3"))
  Panel_KeyTutorial:RegisterUpdateFunc("Update_StepLeftAttack")
end

Update_StepLeftAttack = function(deltaTime)
  -- function num : 0_16 , upvalues : _updateTime, _updateGab, TutorialUI, Tutorial
  _updateTime = _updateTime + deltaTime
  if _updateGab < _updateTime then
    TutorialUI:CheckKeyPressed()
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

    if (TutorialUI._uiButtonML):IsCheck() or (TutorialUI._uiButtonMR):IsCheck() then
      Tutorial._pushed_time = Tutorial._pushed_time + _updateTime
    end
    _updateTime = 0
    if Tutorial._pushed_time > 5 then
      (Tutorial._currentTutorial):NextStep()
    end
  end
end

Tutorial.StepKick = function(self)
  -- function num : 0_17 , upvalues : Tutorial, TutorialUI
  Tutorial:Clear()
  TutorialUI:SetForKick(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_MESSAGE4"))
  Panel_KeyTutorial:RegisterUpdateFunc("Update_StepKeyF")
end

Update_StepKeyF = function(deltaTime)
  -- function num : 0_18 , upvalues : _updateTime, _updateGab, TutorialUI, Tutorial
  _updateTime = _updateTime + deltaTime
  if _updateGab < _updateTime then
    TutorialUI:CheckKeyPressed()
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

    if (TutorialUI._uiButtonF):IsCheck() then
      Tutorial._pushed_key = true
    end
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

    if Tutorial._pushed_key then
      Tutorial._pushed_time = Tutorial._pushed_time + _updateTime
    end
    _updateTime = 0
    if Tutorial._pushed_time > 5 then
      (Tutorial._currentTutorial):NextStep()
    end
  end
end

Tutorial.StepCatch = function(self)
  -- function num : 0_19 , upvalues : Tutorial, TutorialUI
  Tutorial:Clear()
  TutorialUI:SetForKeyE(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_MESSAGE5"))
  Panel_KeyTutorial:RegisterUpdateFunc("Update_StepKeyE")
end

Tutorial.StepGuard = function(self)
  -- function num : 0_20 , upvalues : Tutorial, TutorialUI
  Tutorial:Clear()
  TutorialUI:SetForKeyE(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_MESSAGE6"))
  Panel_KeyTutorial:RegisterUpdateFunc("Update_StepKeyE")
end

Update_StepKeyE = function(deltaTime)
  -- function num : 0_21 , upvalues : _updateTime, _updateGab, TutorialUI, Tutorial
  _updateTime = _updateTime + deltaTime
  if _updateGab < _updateTime then
    TutorialUI:CheckKeyPressed()
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

    if (TutorialUI._uiButtonE):IsCheck() then
      Tutorial._pushed_key = true
    end
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

    if Tutorial._pushed_key then
      Tutorial._pushed_time = Tutorial._pushed_time + _updateTime
    end
    _updateTime = 0
    if Tutorial._pushed_time > 3 then
      (Tutorial._currentTutorial):NextStep()
    end
  end
end

Tutorial.StepComplete = function(self)
  -- function num : 0_22 , upvalues : Tutorial, TutorialUI
  Tutorial:Clear()
  TutorialUI:Show()
  TutorialUI:SetGole(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_MESSAGE7"))
  Panel_KeyTutorial:RegisterUpdateFunc("Update_StepComplete")
end

Update_StepComplete = function(deltaTime)
  -- function num : 0_23 , upvalues : _updateTime, _updateGab, TutorialUI, Tutorial
  _updateTime = _updateTime + deltaTime
  if _updateGab < _updateTime then
    TutorialUI:CheckKeyPressed()
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

    Tutorial._pushed_time = Tutorial._pushed_time + _updateTime
    _updateTime = 0
    if Tutorial._pushed_time > 3 then
      TutorialUI:Hide()
      Panel_KeyTutorial:RegisterUpdateFunc("")
    end
  end
end

MoveTutorial = {}
-- DECOMPILER ERROR at PC181: Confused about usage of register: R5 in 'UnsetPending'

MoveTutorial.Start = function(self)
  -- function num : 0_24 , upvalues : Tutorial
  Tutorial:Clear()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  Tutorial._currentStep = 0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  Tutorial._currentTutorial = MoveTutorial
  self:NextStep()
end

-- DECOMPILER ERROR at PC185: Confused about usage of register: R5 in 'UnsetPending'

MoveTutorial.NextStep = function(self)
  -- function num : 0_25 , upvalues : Tutorial
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  Tutorial._currentStep = Tutorial._currentStep + 1
  if Tutorial._currentStep == 1 then
    Tutorial:StepMove()
  else
    if Tutorial._currentStep == 2 then
      Tutorial:StepRun()
    else
      if Tutorial._currentStep == 3 then
        Tutorial:StepComplete()
      end
    end
  end
end

AttackTutorial = {}
-- DECOMPILER ERROR at PC191: Confused about usage of register: R5 in 'UnsetPending'

AttackTutorial.Start = function(self)
  -- function num : 0_26 , upvalues : Tutorial
  Tutorial:Clear()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  Tutorial._currentStep = 0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  Tutorial._currentTutorial = AttackTutorial
  self:NextStep()
end

-- DECOMPILER ERROR at PC195: Confused about usage of register: R5 in 'UnsetPending'

AttackTutorial.NextStep = function(self)
  -- function num : 0_27 , upvalues : Tutorial
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  Tutorial._currentStep = Tutorial._currentStep + 1
  if Tutorial._currentStep == 1 then
    Tutorial:StepLeftAttack()
  else
    if Tutorial._currentStep == 2 then
      Tutorial:StepKick()
    else
      if Tutorial._currentStep == 3 then
        local classType = (getSelfPlayer()):getClassType()
        if (CppEnums.ClassType).ClassType_Ranger == classType or (CppEnums.ClassType).ClassType_Sorcerer == classType then
          Tutorial:StepComplete()
        else
          if (CppEnums.ClassType).ClassType_Warrior == classType then
            Tutorial:StepGuard()
          else
            if (CppEnums.ClassType).ClassType_Giant == classType then
              Tutorial:StepCatch()
            end
          end
        end
      else
        do
          if Tutorial._currentStep == 4 then
            Tutorial:StepComplete()
          end
        end
      end
    end
  end
end


