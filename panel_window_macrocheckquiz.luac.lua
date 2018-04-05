-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\macrocheckquiz\panel_window_macrocheckquiz.luac 

-- params : ...
-- function num : 0
local PaGlobal_MacroCheckQuiz = {
_ui = {titleName = (UI.getChildControl)(Panel_Window_MacroCheckQuiz, "StaticText_Title"), questionTitle = (UI.getChildControl)(Panel_Window_MacroCheckQuiz, "StaticText_QuestionTitle"), timeCount = (UI.getChildControl)(Panel_Window_MacroCheckQuiz, "StaticText_TimeCount"), limitTimeGauge = (UI.getChildControl)(Panel_Window_MacroCheckQuiz, "Progress2_limitTime"), questionBG = (UI.getChildControl)(Panel_Window_MacroCheckQuiz, "Static_QuestionBG"), warningBG = (UI.getChildControl)(Panel_Window_MacroCheckQuiz, "Static_WarningBG"), button_Apply = (UI.getChildControl)(Panel_Window_MacroCheckQuiz, "Button_Apply")}
, 
_keyPadUi = {currentTypeName = (UI.getChildControl)(Panel_Window_MacroCheckQuizKeyPad, "StaticText_CurrentTypeName"), inputDisplay = (UI.getChildControl)(Panel_Window_MacroCheckQuizKeyPad, "Static_DisplayNumber"), button_Keypad_Back = (UI.getChildControl)(Panel_Window_MacroCheckQuizKeyPad, "Button_Back"), button_Keypad_Clear = (UI.getChildControl)(Panel_Window_MacroCheckQuizKeyPad, "Button_Clear"), button_Keypad_Confirm = (UI.getChildControl)(Panel_Window_MacroCheckQuizKeyPad, "Button_Confirm"), button_Keypad_Close = (UI.getChildControl)(Panel_Window_MacroCheckQuizKeyPad, "Button_Close"), button_Keypad_Cancel = (UI.getChildControl)(Panel_Window_MacroCheckQuizKeyPad, "Button_Cancel")}
, 
_config = {indexMax = 10, startX = 4, startY = 56, gapX = 64, gapY = 34, row = 4, column = 3}
, _isadmin = false, _maxQuestionCount = __eSecureCodeQuestion_TotalCount, 
_questionTypeName = {}
, 
_agreed = {}
, _questionNo = 0, _beforQuestionNo = 0, 
_questionTypeNo = {}
, _currentAnswer = "", _correctCount = 0, 
_quizAnswer = {}
, 
_numberButton = {}
, _keyCount = 0, _state = 0, _currentAnsewerNo = "", _isChangeTexture = false, _confirmCount = 0, _messageNo = 0, 
_logMessage = {}
, _limitTime = 180, _currentTime = 0, _playerName = nil}
OpenMacroCheckQuiz = function()
  -- function num : 0_0 , upvalues : PaGlobal_MacroCheckQuiz
  PaGlobal_MacroCheckQuiz:reset()
  audioPostEvent_SystemUi(8, 16)
  PaGlobal_MacroCheckQuiz:questionSetting()
  PaGlobal_MacroCheckQuiz:keyShuffle()
  Panel_Window_MacroCheckQuiz:SetShow(true, true)
end

Close_MacroCheckQuiz = function()
  -- function num : 0_1
  Panel_Window_MacroCheckQuiz:SetShow(false, false)
end

PaGlobal_MacroCheckQuiz.reset = function(self)
  -- function num : 0_2
  self._questionNo = 0
  self._currentTime = 0
  for ii = 0, self._maxQuestionCount - 1 do
    (((self._ui).answerTemplete)[ii]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_INPUT_TEXT"))
  end
  ;
  ((self._ui).warningBG):SetShow(true, true)
  ;
  ((self._ui).button_Apply):SetShow(false, true)
  ;
  ((self._ui).button_Apply):addInputEvent("Mouse_LUp", "MacroCheckQuiz_applyConfirm()")
  self._quizAnswer = {[0] = "", [1] = "", [2] = ""}
  self._logMessage = {[1] = "", [2] = "", [3] = ""}
end

PaGlobal_MacroCheckQuiz.initialize = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).qPadBg0 = (UI.getChildControl)((self._ui).questionBG, "Static_QPadBG0")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).qPadBg1 = (UI.getChildControl)((self._ui).questionBG, "Static_QPadBG1")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).qPadBg2 = (UI.getChildControl)((self._ui).questionBG, "Static_QPadBG2")
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).questionNameUi = {}
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).questionNameUi)[0] = (UI.getChildControl)((self._ui).qPadBg0, "StaticText_Question0")
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).questionNameUi)[1] = (UI.getChildControl)((self._ui).qPadBg1, "StaticText_Question1")
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).questionNameUi)[2] = (UI.getChildControl)((self._ui).qPadBg2, "StaticText_Question2")
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).answerTemplete = {}
  -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).answerTemplete)[0] = (UI.getChildControl)((self._ui).qPadBg0, "Radiobutton_Answer0")
  -- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).answerTemplete)[1] = (UI.getChildControl)((self._ui).qPadBg1, "Radiobutton_Answer1")
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).answerTemplete)[2] = (UI.getChildControl)((self._ui).qPadBg2, "Radiobutton_Answer2")
  ;
  (((self._ui).answerTemplete)[0]):addInputEvent("Mouse_LUp", "FGlobal_MacroCheckQuiz_KeyPadOpen(0)")
  ;
  (((self._ui).answerTemplete)[1]):addInputEvent("Mouse_LUp", "FGlobal_MacroCheckQuiz_KeyPadOpen(1)")
  ;
  (((self._ui).answerTemplete)[2]):addInputEvent("Mouse_LUp", "FGlobal_MacroCheckQuiz_KeyPadOpen(2)")
  -- DECOMPILER ERROR at PC107: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).answerBG = {}
  -- DECOMPILER ERROR at PC116: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).answerBG)[0] = (UI.getChildControl)((self._ui).qPadBg0, "Static_AnswerBG0")
  -- DECOMPILER ERROR at PC125: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).answerBG)[1] = (UI.getChildControl)((self._ui).qPadBg1, "Static_AnswerBG1")
  -- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).answerBG)[2] = (UI.getChildControl)((self._ui).qPadBg2, "Static_AnswerBG2")
  -- DECOMPILER ERROR at PC142: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._questionTypeName)[__eSecureCodeQuestionType_MaxHp] = PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_TYPEMAXHP_TEXT")
  -- DECOMPILER ERROR at PC150: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._questionTypeName)[__eSecureCodeQuestionType_MaxMp] = PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_TYPEMAXMP_TEXT")
  -- DECOMPILER ERROR at PC158: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._questionTypeName)[__eSecureCodeQuestionType_MaxWp] = PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_QTYPEMAXWP_TEXT")
  -- DECOMPILER ERROR at PC166: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._questionTypeName)[__eSecureCodeQuestionType_MaxExplorePoint] = PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_QTYPECONTRIBUTION_TEXT")
  -- DECOMPILER ERROR at PC174: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._questionTypeName)[__eeSecureCodeQuestionType_Level] = PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_QTYPELEVEL_TEXT")
  Panel_Window_MacroCheckQuiz:RegisterUpdateFunc("FGlobal_MacroCheckQuiz_limitTime")
end

PaGlobal_MacroCheckQuiz.questionSetting = function(self)
  -- function num : 0_4
  for ii = 0, self._maxQuestionCount - 1 do
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R5 in 'UnsetPending'

    (self._questionTypeNo)[ii] = ToClient_getSecureCodeQuestionType(ii)
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R5 in 'UnsetPending'

    if __eSecureCodeQuestionType_MaxHp == (self._questionTypeNo)[ii] then
      (self._questionTypeName)[(self._questionTypeNo)[ii]] = (self._questionTypeName)[__eSecureCodeQuestionType_MaxHp]
    else
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R5 in 'UnsetPending'

      if __eSecureCodeQuestionType_MaxMp == (self._questionTypeNo)[ii] then
        (self._questionTypeName)[(self._questionTypeNo)[ii]] = (self._questionTypeName)[__eSecureCodeQuestionType_MaxMp]
      else
        -- DECOMPILER ERROR at PC47: Confused about usage of register: R5 in 'UnsetPending'

        if __eSecureCodeQuestionType_MaxWp == (self._questionTypeNo)[ii] then
          (self._questionTypeName)[(self._questionTypeNo)[ii]] = (self._questionTypeName)[__eSecureCodeQuestionType_MaxWp]
        else
          -- DECOMPILER ERROR at PC60: Confused about usage of register: R5 in 'UnsetPending'

          if __eSecureCodeQuestionType_MaxExplorePoint == (self._questionTypeNo)[ii] then
            (self._questionTypeName)[(self._questionTypeNo)[ii]] = (self._questionTypeName)[__eSecureCodeQuestionType_MaxExplorePoint]
          else
            -- DECOMPILER ERROR at PC73: Confused about usage of register: R5 in 'UnsetPending'

            if __eeSecureCodeQuestionType_Level == (self._questionTypeNo)[ii] then
              (self._questionTypeName)[(self._questionTypeNo)[ii]] = (self._questionTypeName)[__eeSecureCodeQuestionType_Level]
            end
          end
        end
      end
    end
    ;
    (((self._ui).questionNameUi)[ii]):SetText((self._questionTypeName)[(self._questionTypeNo)[ii]])
  end
end

FGlobal_MacroCheckQuiz_KeyPadOpen = function(index)
  -- function num : 0_5 , upvalues : PaGlobal_MacroCheckQuiz
  local self = PaGlobal_MacroCheckQuiz
  for ii = 0, self._maxQuestionCount - 1 do
    if (self._agreed)[ii] ~= true then
      (((self._ui).answerTemplete)[ii]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_INPUT_TEXT"))
      ;
      (((self._ui).answerBG)[self._questionNo]):ResetAndClearVertexAni(true)
    end
  end
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._agreed)[index] = false
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._quizAnswer)[index] = ""
  ;
  (((self._ui).answerTemplete)[index]):SetText("")
  PaGlobal_MacroCheckQuiz:confirmCheck()
  ;
  (((self._ui).answerBG)[index]):SetVertexAniRun("Ani_Color", true)
  self._questionNo = index
  ;
  ((self._keyPadUi).currentTypeName):SetText((self._questionTypeName)[(self._questionTypeNo)[index]])
  PaGlobal_MacroCheckQuiz:keyPadInit()
  Panel_Window_MacroCheckQuizKeyPad:SetShow(true, true)
end

PaGlobal_MacroCheckQuiz.keyShuffle = function(self)
  -- function num : 0_6 , upvalues : PaGlobal_MacroCheckQuiz
  for i = 0, (self._config).indexMax - 1 do
    local index = {}
    index.buttonControl = (UI.getChildControl)(Panel_Window_MacroCheckQuizKeyPad, "Button_" .. i .. "_Import")
    ;
    (index.buttonControl):addInputEvent("Mouse_Out", "MacroCheckQuiz_buttonMouseOut(" .. i .. ")")
    ;
    (index.buttonControl):addInputEvent("Mouse_LDown", "MacroCheckQuiz_buttonBlind(" .. i .. ")")
    ;
    (index.buttonControl):addInputEvent("Mouse_LUp", "MacroCheckQuiz_numberInput(" .. i .. ")")
    index.baseText = ""
    index.num = i
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._numberButton)[i] = index
  end
  local shuffleIndex = 0
  local tempNum = 0
  local posX = 0
  local posY = 0
  for i = 0, (self._config).indexMax - 1 do
    shuffleIndex = getRandomValue(0, 9)
    tempNum = ((self._numberButton)[i]).num
    -- DECOMPILER ERROR at PC68: Confused about usage of register: R9 in 'UnsetPending'

    ;
    ((self._numberButton)[i]).num = ((self._numberButton)[shuffleIndex]).num
    -- DECOMPILER ERROR at PC71: Confused about usage of register: R9 in 'UnsetPending'

    ;
    ((self._numberButton)[shuffleIndex]).num = tempNum
  end
  for j = 0, (self._config).indexMax - 1 do
    posX = (self._config).startX + (self._config).gapX * (j % (self._config).column)
    posY = (self._config).startY + (self._config).gapY * (math.floor)(j / (self._config).column)
    ;
    (((self._numberButton)[((self._numberButton)[j]).num]).buttonControl):SetPosX(posX)
    ;
    (((self._numberButton)[((self._numberButton)[j]).num]).buttonControl):SetPosY(posY)
    -- DECOMPILER ERROR at PC125: Confused about usage of register: R9 in 'UnsetPending'

    ;
    ((self._numberButton)[j]).baseText = tostring(((self._numberButton)[j]).num)
  end
  ;
  ((self._keyPadUi).button_Keypad_Back):SetPosX((self._config).startX + (self._config).gapX * ((self._config).column - 2))
  ;
  ((self._keyPadUi).button_Keypad_Back):SetPosY((self._config).startY + (self._config).gapY * ((self._config).row - 1))
  ;
  ((self._keyPadUi).button_Keypad_Clear):SetPosX((self._config).startX + (self._config).gapX * ((self._config).column - 1))
  ;
  ((self._keyPadUi).button_Keypad_Clear):SetPosY((self._config).startY + (self._config).gapY * ((self._config).row - 1))
  ;
  ((self._keyPadUi).button_Keypad_Back):addInputEvent("Mouse_LUp", "MacroCheckQuiz_input_Back()")
  ;
  ((self._keyPadUi).button_Keypad_Clear):addInputEvent("Mouse_LUp", "MacroCheckQuiz_input_Clear()")
  ;
  ((self._keyPadUi).button_Keypad_Confirm):addInputEvent("Mouse_LUp", "MacroCheckQuiz_answerConfirm()")
  ;
  ((self._keyPadUi).button_Keypad_Cancel):addInputEvent("Mouse_LUp", "PaGlobal_MacroCheckQuizkeyPadClose()")
  ;
  ((self._keyPadUi).button_Keypad_Close):addInputEvent("Mouse_LUp", "PaGlobal_MacroCheckQuizkeyPadClose()")
  PaGlobal_MacroCheckQuiz:buttonInit()
end

PaGlobal_MacroCheckQuiz.buttonInit = function(self)
  -- function num : 0_7
  for ii = 0, (self._config).indexMax - 1 do
    (((self._numberButton)[ii]).buttonControl):SetText(((self._numberButton)[ii]).baseText)
  end
  self._isChangeTexture = false
end

MacroCheckQuiz_buttonMouseOut = function(index)
  -- function num : 0_8 , upvalues : PaGlobal_MacroCheckQuiz
  PaGlobal_MacroCheckQuiz:buttonInit()
end

MacroCheckQuiz_buttonBlind = function(index)
  -- function num : 0_9 , upvalues : PaGlobal_MacroCheckQuiz
  local self = PaGlobal_MacroCheckQuiz
  self._isChangeTexture = true
end

MacroCheckQuiz_numberInput = function(index)
  -- function num : 0_10 , upvalues : PaGlobal_MacroCheckQuiz
  local self = PaGlobal_MacroCheckQuiz
  if (string.len)(self._currentAnswer) < 5 or self._keyCount < 0 then
    self._keyCount = self._keyCount + 1
    local _shuffleIndex = ((self._numberButton)[index]).num
    if self._currentAnswer == "0" then
      self._currentAnswer = ""
    end
    self._currentAnswer = tostring(self._currentAnswer .. _shuffleIndex)
    PaGlobal_MacroCheckQuiz:currentAnswer(self._questionNo, self._currentAnswer)
  end
end

PaGlobal_MacroCheckQuiz.currentAnswer = function(self, index, currentAnswer)
  -- function num : 0_11
  (((self._ui).answerTemplete)[index]):SetText(currentAnswer)
  ;
  ((self._keyPadUi).inputDisplay):SetText(currentAnswer)
end

PaGlobal_MacroCheckQuiz.keyPadInit = function(self)
  -- function num : 0_12
  self._currentAnswer = ""
  self._keyCount = 0
  ;
  ((self._keyPadUi).inputDisplay):SetText(currentAnswer)
end

MacroCheckQuiz_input_Clear = function()
  -- function num : 0_13 , upvalues : PaGlobal_MacroCheckQuiz
  local self = PaGlobal_MacroCheckQuiz
  self._currentAnswer = ""
  self._keyCount = 0
  PaGlobal_MacroCheckQuiz:currentAnswer(self._questionNo, self._currentAnswer)
end

MacroCheckQuiz_input_Back = function()
  -- function num : 0_14 , upvalues : PaGlobal_MacroCheckQuiz
  local self = PaGlobal_MacroCheckQuiz
  if self._keyCount < 1 then
    MacroCheckQuiz_input_Clear()
  else
    self._keyCount = self._keyCount - 1
    self._currentAnswer = (string.sub)(self._currentAnswer, 1, self._keyCount)
    PaGlobal_MacroCheckQuiz:currentAnswer(self._questionNo, self._currentAnswer)
  end
end

PaGlobal_MacroCheckQuiz.confirmCheck = function(self)
  -- function num : 0_15
  local _confirmCount = 0
  for ii = 0, self._maxQuestionCount - 1 do
    if (self._agreed)[ii] == true then
      _confirmCount = _confirmCount + 1
    end
  end
  if self._maxQuestionCount == _confirmCount then
    ((self._ui).warningBG):SetShow(false, true)
    ;
    ((self._ui).button_Apply):SetShow(true, true)
  else
    ;
    ((self._ui).warningBG):SetShow(true, true)
    ;
    ((self._ui).button_Apply):SetShow(false, true)
  end
end

MacroCheckQuiz_answerConfirm = function()
  -- function num : 0_16 , upvalues : PaGlobal_MacroCheckQuiz
  local self = PaGlobal_MacroCheckQuiz
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  if self._currentAnswer ~= "" then
    (self._quizAnswer)[self._questionNo] = self._currentAnswer
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._agreed)[self._questionNo] = true
    PaGlobal_MacroCheckQuiz:keyPadInit()
    Panel_Window_MacroCheckQuizKeyPad:SetShow(false, true)
    PaGlobal_MacroCheckQuiz:confirmCheck()
  else
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._quizAnswer)[self._questionNo] = ""
    ;
    (((self._ui).answerTemplete)[self._questionNo]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_INPUT_TEXT"))
  end
  ;
  (((self._ui).answerBG)[self._questionNo]):ResetAndClearVertexAni(true)
  Panel_Window_MacroCheckQuizKeyPad:SetShow(false, true)
end

MacroCheckQuiz_applyConfirm = function()
  -- function num : 0_17 , upvalues : PaGlobal_MacroCheckQuiz
  local self = PaGlobal_MacroCheckQuiz
  for ii = 0, self._maxQuestionCount - 1 do
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R5 in 'UnsetPending'

    (self._quizAnswer)[ii] = tonumber((self._quizAnswer)[ii])
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R5 in 'UnsetPending'

    if (self._quizAnswer)[ii] == nil then
      (self._quizAnswer)[ii] = 0
    end
    ToClient_setSecureCodeAnswer(ii, (self._quizAnswer)[ii])
  end
  ToClient_sendSecureCodeAnswer()
  local _sendToPlayermessage = PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_FEEDBACK_TEXT")
  PaGlobal_MacroCheckQuiz:close()
  Panel_Window_MacroCheckQuiz:SetShow(false, true)
  Panel_Window_MacroCheckQuizKeyPad:SetShow(false, true)
  Proc_ShowMessage_Ack(_sendToPlayermessage)
end

PaGlobal_MacroCheckQuizkeyPadClose = function()
  -- function num : 0_18 , upvalues : PaGlobal_MacroCheckQuiz
  local self = PaGlobal_MacroCheckQuiz
  MacroCheckQuiz_input_Clear()
  ;
  (((self._ui).answerTemplete)[self._questionNo]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MACROCHECKQUIZ_QUIZ_INPUT_TEXT"))
  ;
  (((self._ui).answerBG)[self._questionNo]):ResetAndClearVertexAni(true)
  Panel_Window_MacroCheckQuizKeyPad:SetShow(false, true)
end

PaGlobal_MacroCheckQuiz.close = function(self)
  -- function num : 0_19
  self._currentTime = 0
  self._confirmCount = 0
  for ii = 0, self._maxQuestionCount - 1 do
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R5 in 'UnsetPending'

    (self._quizAnswer)[ii] = ""
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._agreed)[ii] = false
    ;
    (((self._ui).answerTemplete)[ii]):SetText("")
  end
  Panel_Window_MacroCheckQuiz:SetShow(false, true)
  Panel_Window_MacroCheckQuizKeyPad:SetShow(false, true)
end

FGlobal_MacroCheckQuiz_limitTime = function(deltaTime)
  -- function num : 0_20 , upvalues : PaGlobal_MacroCheckQuiz
  local self = PaGlobal_MacroCheckQuiz
  self._currentTime = self._currentTime + deltaTime
  local clockMinutes = tonumber((math.floor)((self._limitTime - self._currentTime) / 60))
  local clockSeconds = tonumber((math.floor)((self._limitTime - self._currentTime) % 60))
  if clockSeconds > 9 then
    ((self._ui).timeCount):SetText("0" .. clockMinutes .. " : " .. clockSeconds)
  else
    ;
    ((self._ui).timeCount):SetText("0" .. clockMinutes .. " : 0" .. clockSeconds)
  end
  local _last = (self._limitTime - self._currentTime) / 180 * 100
  ;
  ((self._ui).limitTimeGauge):SetProgressRate(_last)
  if _last <= 0 then
    PaGlobal_MacroCheckQuiz:close()
  end
end

FromClient_receiveSecureCodeQuestion = function(name, isAdmin, type)
  -- function num : 0_21 , upvalues : PaGlobal_MacroCheckQuiz
  self = PaGlobal_MacroCheckQuiz
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R3 in 'UnsetPending'

  self._playerName = tostring(name)
  if isAdmin ~= true then
    OpenMacroCheckQuiz()
  else
    local _sendToGMMessage = " GM Send the MacroCheckQuiz to \' " .. tostring(name) .. " \'"
    Proc_ShowMessage_Ack(_sendToGMMessage)
  end
end

FromClient_receiveSecureCodeTimeOver = function(name)
  -- function num : 0_22
  local _sendToGMMessage = "PlayerName = " .. tostring(name) .. ",   Time Out"
  Proc_ShowMessage_Ack(_sendToGMMessage)
end

FromClient_receiveSecureCodeAnswer_Detail = function(isCorrect, type, value, correctAnswer)
  -- function num : 0_23 , upvalues : PaGlobal_MacroCheckQuiz
  self = PaGlobal_MacroCheckQuiz
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R4 in 'UnsetPending'

  self._messageNo = self._messageNo + 1
  local _typName = (self._questionTypeName)[type]
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._logMessage)[self._messageNo] = "Player Name = " .. tostring(self._playerName) .. " IsCorrect = " .. tostring(isCorrect) .. " QuestionType = " .. tostring(_typName) .. " UserAnswer = " .. tostring(value) .. " CorrectAnswer = " .. tostring(correctAnswer)
  if __eSecureCodeQuestion_TotalCount == self._messageNo then
    PaGlobal_MacroCheckQuiz:Send_To_GMMessage()
  end
end

PaGlobal_MacroCheckQuiz.Send_To_GMMessage = function(self)
  -- function num : 0_24
  self._messageNo = 0
  local _sendToGMMessage = ""
  for ii = 1, self._maxQuestionCount do
    _sendToGMMessage = tostring(_sendToGMMessage .. (self._logMessage)[ii] .. "\n")
  end
  Proc_ShowMessage_Ack(_sendToGMMessage)
end

FromClient_receiveSecureCodeAnswer = function(correctCount, name)
  -- function num : 0_25 , upvalues : PaGlobal_MacroCheckQuiz
  self = PaGlobal_MacroCheckQuiz
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  self._playerName = tostring(name)
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_MacroCheckQuiz")
registerEvent("FromClient_receiveSecureCodeQuestion", "FromClient_receiveSecureCodeQuestion")
registerEvent("FromClient_receiveSecureCodeAnswer_Detail", "FromClient_receiveSecureCodeAnswer_Detail")
registerEvent("FromClient_receiveSecureCodeAnswer", "FromClient_receiveSecureCodeAnswer")
registerEvent("FromClient_receiveSecureCodeTimeOver", "FromClient_receiveSecureCodeTimeOver")
FromClient_luaLoadComplete_Panel_Window_MacroCheckQuiz = function()
  -- function num : 0_26 , upvalues : PaGlobal_MacroCheckQuiz
  PaGlobal_MacroCheckQuiz:initialize()
end


