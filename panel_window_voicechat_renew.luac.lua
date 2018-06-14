-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\voicechat\console\panel_window_voicechat_renew.luac 

-- params : ...
-- function num : 0
local Window_VoiceChatInfo = {_arrowDefaultPosY; 
_ui = {_static_OnOffGroup = (UI.getChildControl)(Panel_Window_VoiceChat, "Static_OnOffGroup"), _static_MicVolGroup = (UI.getChildControl)(Panel_Window_VoiceChat, "Static_MicVolGroup"), _static_ListenVolGroup = (UI.getChildControl)(Panel_Window_VoiceChat, "Static_ListenVolGroup"), _static_MicSenseGroup = (UI.getChildControl)(Panel_Window_VoiceChat, "Static_MicSenseGroup"), _static_MicAmpGroup = (UI.getChildControl)(Panel_Window_VoiceChat, "Static_MicAmpGroup"), _static_KeyGuide = (UI.getChildControl)(Panel_Window_VoiceChat, "Static_KeyGuide_ConsoleUI"), 
_slider = {}
, 
_button = {}
, 
_buttonText = {}
, 
_focusBox = {}
}
, 
_config = {_buttomType_Talk = 0, _buttomType_Listen = 1, _buttomType_PressTalk = 2, _maxSlider = 4, _talk = 0, _listen = 1, _pressTalk = 2, _talkVol = 0, _listenVol = 1, _micSense = 2, _micAmp = 3}
, 
_enumVoiceType = {_enVoiceChatType_Guild = 0, _enVoiceChatType_Party = 1, _enVoiceChatType_World = 2}
, _openIsMicOn = true, _openIsHeadphoneOn = true, _openIsPushToTalk = true, _openMicVolume = 0, _openHeadphoneVolume = 0, _openMicSensitivity = 0, _openMicAmplification = 0, _prevOpenIsMicOn = true, _prevOpenIsHeadphoneOn = true, _prevOpenIsPushToTalk = true, _prevOpenMicVolume = 0, _prevOpenHeadphoneVolume = 0, _prevOpenMicSensitivity = 0, _prevOpenMicAmplification = 0, _isTalk = false, _isListen = false, _isPressTalk = false}
PaGlobalFunc_VoiceChat_SliderHandleOn = function(sliderIdx)
  -- function num : 0_0 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  for index = 0, (self._config)._maxSlider - 1 do
    (((self._ui)._focusBox)[index]):SetShow(index == sliderIdx)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

PaGlobalFunc_VoiceChat_SliderHandle = function(sliderIdx)
  -- function num : 0_1 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  local slider = ((self._ui)._slider)[sliderIdx]
  if slider == nil then
    return 
  end
  local posPercent = slider:GetControlPos() * 100
  if (self._config)._talkVol == sliderIdx then
    ToClient_setMicVolume(posPercent)
    if posPercent > 0 then
      self:SetTalkButtonByCheck(true)
    else
      self:SetTalkButtonByCheck(false)
    end
  else
    if (self._config)._listenVol == sliderIdx then
      ToClient_setSpeakerVolume(posPercent)
      if posPercent > 0 then
        self:SetListenButtonByCheck(true)
      else
        self:SetListenButtonByCheck(false)
      end
    else
      if (self._config)._micSense == sliderIdx then
        ToClient_setMicSensitivity(posPercent)
      else
        if (self._config)._micAmp == sliderIdx then
          ToClient_setMicAdjustment(posPercent)
        end
      end
    end
  end
  self:Update()
end

PaGlobalFunc_VoiceChat_LClick_SetTalk = function(isCheck)
  -- function num : 0_2 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  self:SetTalkButtonByCheck(isCheck)
end

PaGlobalFunc_VoiceChat_LClick_SetListen = function(isCheck)
  -- function num : 0_3 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  self:SetListenButtonByCheck(isCheck)
end

PaGlobalFunc_VoiceChat_LClick_SetPressTalk = function(isCheck)
  -- function num : 0_4 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  self:SetPressTalkButtonByCheck(isCheck)
end

PaGlobalFunc_VoiceChat_ButtonClickHandle = function(index)
  -- function num : 0_5 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  ;
  ((self._ui)._button_LArrow):SetPosY(self._arrowDefaultPosY)
  ;
  ((self._ui)._button_LArrow):SetPosY(((self._ui)._button_LArrow):GetPosY() + index * 40)
  ;
  ((self._ui)._button_RArrow):SetPosY(self._arrowDefaultPosY)
  ;
  ((self._ui)._button_RArrow):SetPosY(((self._ui)._button_RArrow):GetPosY() + index * 40)
  ;
  ((self._ui)._button_LArrow):SetShow(true)
  ;
  ((self._ui)._button_RArrow):SetShow(true)
  if (self._config)._talk == index then
    ((self._ui)._button_LArrow):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetTalk(false)")
    ;
    ((self._ui)._button_RArrow):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetTalk(true)")
  else
    if (self._config)._listen == index then
      ((self._ui)._button_LArrow):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetListen(false)")
      ;
      ((self._ui)._button_RArrow):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetListen(true)")
    else
      if (self._config)._pressTalk == index then
        ((self._ui)._button_LArrow):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetPressTalk(false)")
        ;
        ((self._ui)._button_RArrow):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetPressTalk(true)")
      end
    end
  end
end

PaGlobalFunc_VoiceChat_ButtonHandleOut = function()
  -- function num : 0_6 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  ;
  ((self._ui)._button_LArrow):SetShow(false)
  ;
  ((self._ui)._button_RArrow):SetShow(false)
end

Window_VoiceChatInfo.SetTalkButtonByCheck = function(self, isCheck)
  -- function num : 0_7
  ToClient_setMicOnOff((self._enumVoiceType)._enVoiceChatType_Guild, isCheck)
  if ToClient_IsConnectedMic() == true then
    ToClient_setMicOnOff((self._enumVoiceType)._enVoiceChatType_Guild, isCheck)
  else
    ToClient_setMicOnOff((self._enumVoiceType)._enVoiceChatType_Guild, false)
  end
  self:Update()
end

Window_VoiceChatInfo.SetListenButtonByCheck = function(self, isCheck)
  -- function num : 0_8
  ToClient_setSpeakerOnOff((self._enumVoiceType)._enVoiceChatType_Guild, isCheck)
  self:Update()
end

Window_VoiceChatInfo.SetPressTalkButtonByCheck = function(self, isCheck)
  -- function num : 0_9
  ToClient_setPushToTalkOnOff(isCheck)
  self:Update()
end

PaGlobalFunc_VoiceChat_SliderHadleOut = function(index)
  -- function num : 0_10 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  ;
  (((self._ui)._focusBox)[index]):SetShow(false)
end

Window_VoiceChatInfo.InitEvent = function(self)
  -- function num : 0_11
  ((self._ui)._button_Close):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_Close()")
  ;
  ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_Confirm()")
  for index = 0, (self._config)._maxSlider - 1 do
    if _ContentsGroup_isConsolePadControl then
      (((self._ui)._slider)[index]):addInputEvent("Mouse_On", "PaGlobalFunc_VoiceChat_SliderHandleOn(" .. index .. ")")
      ;
      (((self._ui)._slider)[index]):addInputEvent("Mouse_Out", "PaGlobalFunc_VoiceChat_SliderHadleOut(" .. index .. ")")
      ;
      (((self._ui)._slider)[index]):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_VoiceChat_SliderHandle(" .. index .. ")")
      ;
      (((self._ui)._slider)[index]):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_VoiceChat_SliderHandle(" .. index .. ")")
    else
      ;
      (((self._ui)._slider)[index]):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_SliderHandle(" .. index .. ")")
      ;
      (((self._ui)._button)[index]):addInputEvent("Mouse_LPress", "PaGlobalFunc_VoiceChat_SliderHandle(" .. index .. ")")
    end
  end
  if _ContentsGroup_isConsolePadControl then
    ((self._ui)._button_Talk):addInputEvent("Mouse_On", "PaGlobalFunc_VoiceChat_ButtonClickHandle(0)")
    ;
    ((self._ui)._button_Talk):addInputEvent("Mouse_Out", "PaGlobalFunc_VoiceChat_ButtonHandleOut()")
    ;
    ((self._ui)._button_Listen):addInputEvent("Mouse_On", "PaGlobalFunc_VoiceChat_ButtonClickHandle(1)")
    ;
    ((self._ui)._button_Listen):addInputEvent("Mouse_Out", "PaGlobalFunc_VoiceChat_ButtonHandleOut()")
    ;
    ((self._ui)._button_PressTalk):addInputEvent("Mouse_On", "PaGlobalFunc_VoiceChat_ButtonClickHandle(2)")
    ;
    ((self._ui)._button_PressTalk):addInputEvent("Mouse_Out", "PaGlobalFunc_VoiceChat_ButtonHandleOut()")
    ;
    ((self._ui)._button_Talk):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_VoiceChat_LClick_SetTalk(false)")
    ;
    ((self._ui)._button_Talk):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_VoiceChat_LClick_SetTalk(true)")
    ;
    ((self._ui)._button_Listen):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_VoiceChat_LClick_SetListen(false)")
    ;
    ((self._ui)._button_Listen):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_VoiceChat_LClick_SetListen(true)")
    ;
    ((self._ui)._button_PressTalk):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_VoiceChat_LClick_SetPressTalk(false)")
    ;
    ((self._ui)._button_PressTalk):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_VoiceChat_LClick_SetPressTalk(true)")
    Panel_Window_VoiceChat:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "PaGlobalFunc_VoiceChat_Confirm()")
  else
    ;
    ((self._ui)._button_Talk):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_ButtonClickHandle(0)")
    ;
    ((self._ui)._button_Listen):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_ButtonClickHandle(1)")
    ;
    ((self._ui)._button_PressTalk):addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_ButtonClickHandle(2)")
  end
end

Window_VoiceChatInfo.InitControl = function(self)
  -- function num : 0_12
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._button_Talk = (UI.getChildControl)((self._ui)._static_OnOffGroup, "Button_1")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_Listen = (UI.getChildControl)((self._ui)._static_OnOffGroup, "Button_2")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_PressTalk = (UI.getChildControl)((self._ui)._static_OnOffGroup, "Button_3")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_LArrow = (UI.getChildControl)((self._ui)._static_OnOffGroup, "Static_ArrowLeft")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_RArrow = (UI.getChildControl)((self._ui)._static_OnOffGroup, "Static_ArrowRight")
  self._arrowDefaultPosY = ((self._ui)._button_LArrow):GetPosY()
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._slider)[0] = (UI.getChildControl)((self._ui)._static_MicVolGroup, "Slider_Vol")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._slider)[1] = (UI.getChildControl)((self._ui)._static_ListenVolGroup, "Slider_Vol")
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._slider)[2] = (UI.getChildControl)((self._ui)._static_MicSenseGroup, "Slider_Sens")
  -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._slider)[3] = (UI.getChildControl)((self._ui)._static_MicAmpGroup, "Slider_Amp")
  -- DECOMPILER ERROR at PC88: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_ListenVol = (UI.getChildControl)((self._ui)._static_MicVolGroup, "StaticText_SubTitle")
  ;
  ((self._ui)._staticText_ListenVol):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_HEARING_VOLUME"))
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_MicSense = (UI.getChildControl)((self._ui)._static_MicSenseGroup, "StaticText_SubTitle")
  ;
  ((self._ui)._staticText_MicSense):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_MIC_SENSITIVITY"))
  -- DECOMPILER ERROR at PC122: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_MicAmp = (UI.getChildControl)((self._ui)._static_MicAmpGroup, "StaticText_SubTitle")
  ;
  ((self._ui)._staticText_MicAmp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_MIC_AMPLIFICATION"))
  -- DECOMPILER ERROR at PC140: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._focusBox)[0] = (UI.getChildControl)((self._ui)._static_MicVolGroup, "Static_FocusBox")
  -- DECOMPILER ERROR at PC149: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._focusBox)[1] = (UI.getChildControl)((self._ui)._static_ListenVolGroup, "Static_FocusBox")
  -- DECOMPILER ERROR at PC158: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._focusBox)[2] = (UI.getChildControl)((self._ui)._static_MicSenseGroup, "Static_FocusBox")
  -- DECOMPILER ERROR at PC167: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._focusBox)[3] = (UI.getChildControl)((self._ui)._static_MicAmpGroup, "Static_FocusBox")
  -- DECOMPILER ERROR at PC175: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_Close = (UI.getChildControl)((self._ui)._static_KeyGuide, "StaticText_Close_ConsoleUI")
  -- DECOMPILER ERROR at PC183: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._button_Confirm = (UI.getChildControl)((self._ui)._static_KeyGuide, "StaticText_Confirm_ConsoleUI")
  for index = 0, (self._config)._maxSlider - 1 do
    -- DECOMPILER ERROR at PC199: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._button)[index] = (UI.getChildControl)(((self._ui)._slider)[index], "Slider_Button")
    -- DECOMPILER ERROR at PC209: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._buttonText)[index] = (UI.getChildControl)(((self._ui)._button)[index], "StaticText_Val")
    ;
    (((self._ui)._focusBox)[index]):SetShow(false)
  end
end

Window_VoiceChatInfo.Initialize = function(self)
  -- function num : 0_13
  self:InitControl()
  self:InitEvent()
end

FGlobal_SetVoiceChat_Toggle = function()
  -- function num : 0_14
  if PaGlobalFunc_VoiceChat_GetShow() == true then
    PaGlobalFunc_VoiceChat_Close()
  else
    PaGlobalFunc_VoiceChat_Open()
  end
end

Window_VoiceChatInfo.Update = function(self)
  -- function num : 0_15
  self._openIsMicOn = ToClient_isVoiceChatMic((self._enumVoiceType)._enVoiceChatType_Guild)
  self._openIsHeadphoneOn = ToClient_isVoiceChatListen((self._enumVoiceType)._enVoiceChatType_Guild)
  self._openIsPushToTalk = ToClient_isVoiceChatPushToTalk()
  self._openMicVolume = ToClient_getMicVolume()
  self._openHeadphoneVolume = ToClient_getSpeakerVolume()
  self._openMicSensitivity = ToClient_getMicSensitivity()
  self._openMicAmplification = (math.ceil)(ToClient_getMicAdjustment() * 100) - 100
  if self._openIsMicOn == true then
    ((self._ui)._button_Talk):SetText("ON")
  else
    ;
    ((self._ui)._button_Talk):SetText("OFF")
  end
  if self._openIsHeadphoneOn == true then
    ((self._ui)._button_Listen):SetText("ON")
  else
    ;
    ((self._ui)._button_Listen):SetText("OFF")
  end
  if self._openIsPushToTalk == true then
    ((self._ui)._button_PressTalk):SetText("ON")
  else
    ;
    ((self._ui)._button_PressTalk):SetText("OFF")
  end
  ;
  (((self._ui)._slider)[0]):SetControlPos(self._openMicVolume)
  ;
  (((self._ui)._slider)[1]):SetControlPos(self._openHeadphoneVolume)
  ;
  (((self._ui)._slider)[2]):SetControlPos(self._openMicSensitivity)
  ;
  (((self._ui)._slider)[3]):SetControlPos(self._openMicAmplification)
  ;
  (((self._ui)._buttonText)[0]):SetText(Int64toInt32(self._openMicVolume))
  ;
  (((self._ui)._buttonText)[1]):SetText(Int64toInt32(self._openHeadphoneVolume))
  ;
  (((self._ui)._buttonText)[2]):SetText(Int64toInt32(self._openMicSensitivity))
  ;
  (((self._ui)._buttonText)[3]):SetText(Int64toInt32(self._openMicAmplification))
end

PaGlobalFunc_VoiceChat_Open = function()
  -- function num : 0_16 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  self._prevOpenIsMicOn = ToClient_isVoiceChatMic((self._enumVoiceType)._enVoiceChatType_Guild)
  self._prevOpenIsHeadphoneOn = ToClient_isVoiceChatListen((self._enumVoiceType)._enVoiceChatType_Guild)
  self._prevOpenIsPushToTalk = ToClient_isVoiceChatPushToTalk()
  self._prevOpenMicVolume = ToClient_getMicVolume()
  self._prevOpenHeadphoneVolume = ToClient_getSpeakerVolume()
  self._prevOpenMicSensitivity = ToClient_getMicSensitivity()
  self._prevOpenMicAmplification = (math.ceil)(ToClient_getMicAdjustment() * 100) - 100
  self:Update()
  Panel_Window_VoiceChat:SetShow(true)
end

PaGlobalFunc_VoiceChat_Confirm = function()
  -- function num : 0_17 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  self._prevOpenIsMicOn = self._openIsMicOn
  self._prevOpenIsHeadphoneOn = self._openIsHeadphoneOn
  self._prevOpenIsPushToTalk = self._openIsPushToTalk
  self._prevOpenMicVolume = self._openMicVolume
  self._prevOpenHeadphoneVolume = self._openHeadphoneVolume
  self._prevOpenMicSensitivity = self._openMicSensitivity
  self._prevOpenMicAmplification = self._openMicAmplification
  PaGlobalFunc_VoiceChat_Close()
end

PaGlobalFunc_VoiceChat_Close = function()
  -- function num : 0_18 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  local selfPlayer = (getSelfPlayer()):get()
  local isMicOn = self._prevOpenIsMicOn
  local isHeadphoneOn = self._prevOpenIsHeadphoneOn
  local isPushToTalk = self._prevOpenIsPushToTalk
  local micVolume = self._prevOpenMicVolume
  local headphoneVolume = self._prevOpenHeadphoneVolume
  local micSensitivity = self._prevOpenMicSensitivity
  local micAmplification = self._prevOpenMicAmplification
  for index = 0, (self._config)._maxSlider - 1 do
    (((self._ui)._focusBox)[index]):SetShow(false)
  end
  if ToClient_IsConnectedMic() == true then
    ToClient_setMicOnOff((self._enumVoiceType)._enVoiceChatType_Guild, isMicOn)
  else
    ToClient_setMicOnOff((self._enumVoiceType)._enVoiceChatType_Guild, false)
  end
  ToClient_setSpeakerOnOff((self._enumVoiceType)._enVoiceChatType_Guild, isHeadphoneOn)
  ToClient_setPushToTalkOnOff(isPushToTalk)
  ToClient_setMicVolume(micVolume)
  ToClient_setSpeakerVolume(headphoneVolume)
  ToClient_setMicSensitivity(micSensitivity)
  ToClient_setMicAdjustment(micAmplification)
  ToClient_VoiceChatChangeState((CppEnums.VoiceChatType).eVoiceChatType_Guild, selfPlayer:getUserNo(), isMicOn, isHeadphoneOn, false)
  Panel_Window_VoiceChat:SetShow(false)
end

PaGlobalFunc_VoiceChat_GetShow = function()
  -- function num : 0_19
  return Panel_Window_VoiceChat:GetShow()
end

PaGlobalFunc_FromClient_VoiceChat_luaLoadComplete = function()
  -- function num : 0_20 , upvalues : Window_VoiceChatInfo
  local self = Window_VoiceChatInfo
  self:Initialize()
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_VoiceChat_luaLoadComplete")

