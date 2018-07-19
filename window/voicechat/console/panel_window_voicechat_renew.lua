local Window_VoiceChatInfo = {
  _ui = {
    _static_OnOffGroup = UI.getChildControl(Panel_Window_VoiceChat, "Static_OnOffGroup"),
    _static_MicVolGroup = UI.getChildControl(Panel_Window_VoiceChat, "Static_MicVolGroup"),
    _static_ListenVolGroup = UI.getChildControl(Panel_Window_VoiceChat, "Static_ListenVolGroup"),
    _static_MicSenseGroup = UI.getChildControl(Panel_Window_VoiceChat, "Static_MicSenseGroup"),
    _static_MicAmpGroup = UI.getChildControl(Panel_Window_VoiceChat, "Static_MicAmpGroup"),
    _static_KeyGuide = UI.getChildControl(Panel_Window_VoiceChat, "Static_KeyGuide_ConsoleUI"),
    _slider = {},
    _button = {},
    _buttonText = {},
    _focusBox = {}
  },
  _config = {
    _buttomType_Talk = 0,
    _buttomType_Listen = 1,
    _buttomType_PressTalk = 2,
    _maxSlider = 4,
    _talk = 0,
    _listen = 1,
    _pressTalk = 2,
    _talkVol = 0,
    _listenVol = 1,
    _micSense = 2,
    _micAmp = 3
  },
  _enumVoiceType = {
    _enVoiceChatType_Guild = 0,
    _enVoiceChatType_Party = 1,
    _enVoiceChatType_World = 2
  },
  _openIsMicOn = true,
  _openIsHeadphoneOn = true,
  _openIsPushToTalk = true,
  _openMicVolume = 0,
  _openHeadphoneVolume = 0,
  _openMicSensitivity = 0,
  _openMicAmplification = 0,
  _prevOpenIsMicOn = true,
  _prevOpenIsHeadphoneOn = true,
  _prevOpenIsPushToTalk = true,
  _prevOpenMicVolume = 0,
  _prevOpenHeadphoneVolume = 0,
  _prevOpenMicSensitivity = 0,
  _prevOpenMicAmplification = 0,
  _isTalk = false,
  _isListen = false,
  _isPressTalk = false,
  _arrowDefaultPosY
}
function PaGlobalFunc_VoiceChat_SliderHandleOn(sliderIdx)
  local self = Window_VoiceChatInfo
  for index = 0, self._config._maxSlider - 1 do
    self._ui._focusBox[index]:SetShow(index == sliderIdx)
  end
end
function PaGlobalFunc_VoiceChat_SliderHandle(sliderIdx)
  local self = Window_VoiceChatInfo
  local slider = self._ui._slider[sliderIdx]
  if nil == slider then
    return
  end
  local posPercent = slider:GetControlPos() * 100
  if self._config._talkVol == sliderIdx then
    if posPercent > 0 then
      self:SetTalkButtonByCheck(true)
    else
      self:SetTalkButtonByCheck(false)
    end
    self._openMicVolume = posPercent
  elseif self._config._listenVol == sliderIdx then
    if posPercent > 0 then
      self:SetListenButtonByCheck(true)
    else
      self:SetListenButtonByCheck(false)
    end
    self._openHeadphoneVolume = posPercent
  elseif self._config._micSense == sliderIdx then
    self._openMicSensitivity = posPercent
  elseif self._config._micAmp == sliderIdx then
    self._openMicAmplification = posPercent
  end
  self:Update()
end
function PaGlobalFunc_VoiceChat_LClick_SetTalk(isCheck)
  local self = Window_VoiceChatInfo
  self:SetTalkButtonByCheck(isCheck)
end
function PaGlobalFunc_VoiceChat_LClick_SetListen(isCheck)
  local self = Window_VoiceChatInfo
  self:SetListenButtonByCheck(isCheck)
end
function PaGlobalFunc_VoiceChat_LClick_SetPressTalk(isCheck)
  local self = Window_VoiceChatInfo
  self:SetPressTalkButtonByCheck(isCheck)
end
function PaGlobalFunc_VoiceChat_ButtonClickHandle(index)
  local self = Window_VoiceChatInfo
  self._ui._button_LArrow:SetPosY(self._arrowDefaultPosY)
  self._ui._button_LArrow:SetPosY(self._ui._button_LArrow:GetPosY() + index * 40)
  self._ui._button_RArrow:SetPosY(self._arrowDefaultPosY)
  self._ui._button_RArrow:SetPosY(self._ui._button_RArrow:GetPosY() + index * 40)
  self._ui._button_LArrow:SetShow(true)
  self._ui._button_RArrow:SetShow(true)
  if self._config._talk == index then
    self._ui._button_LArrow:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetTalk(false)")
    self._ui._button_RArrow:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetTalk(true)")
  elseif self._config._listen == index then
    self._ui._button_LArrow:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetListen(false)")
    self._ui._button_RArrow:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetListen(true)")
  elseif self._config._pressTalk == index then
    self._ui._button_LArrow:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetPressTalk(false)")
    self._ui._button_RArrow:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_LClick_SetPressTalk(true)")
  end
end
function PaGlobalFunc_VoiceChat_ButtonHandleOut()
  local self = Window_VoiceChatInfo
  self._ui._button_LArrow:SetShow(false)
  self._ui._button_RArrow:SetShow(false)
end
function Window_VoiceChatInfo:SetTalkButtonByCheck(isCheck)
  self._openIsMicOn = isCheck
  if true == ToClient_IsConnectedMic() then
    self._openIsMicOn = isCheck
  else
    self._openIsMicOn = false
  end
  self:Update()
end
function Window_VoiceChatInfo:SetListenButtonByCheck(isCheck)
  self._openIsHeadphoneOn = isCheck
  self:Update()
end
function Window_VoiceChatInfo:SetPressTalkButtonByCheck(isCheck)
  self._openIsPushToTalk = isCheck
  self:Update()
end
function PaGlobalFunc_VoiceChat_SliderHadleOut(index)
  local self = Window_VoiceChatInfo
  self._ui._focusBox[index]:SetShow(false)
end
function Window_VoiceChatInfo:InitEvent()
  self._ui._button_Close:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_Close()")
  self._ui._button_Confirm:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_Confirm()")
  for index = 0, self._config._maxSlider - 1 do
    if _ContentsGroup_isConsolePadControl then
      self._ui._slider[index]:addInputEvent("Mouse_On", "PaGlobalFunc_VoiceChat_SliderHandleOn(" .. index .. ")")
      self._ui._slider[index]:addInputEvent("Mouse_Out", "PaGlobalFunc_VoiceChat_SliderHadleOut(" .. index .. ")")
      self._ui._slider[index]:addInputEvent("Mouse_LPress", "PaGlobalFunc_VoiceChat_SliderHandle(" .. index .. ")")
    else
      self._ui._slider[index]:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_SliderHandle(" .. index .. ")")
      self._ui._button[index]:addInputEvent("Mouse_LPress", "PaGlobalFunc_VoiceChat_SliderHandle(" .. index .. ")")
    end
  end
  if _ContentsGroup_isConsolePadControl then
    self._ui._button_Talk:addInputEvent("Mouse_On", "PaGlobalFunc_VoiceChat_ButtonClickHandle(0)")
    self._ui._button_Talk:addInputEvent("Mouse_Out", "PaGlobalFunc_VoiceChat_ButtonHandleOut()")
    self._ui._button_Listen:addInputEvent("Mouse_On", "PaGlobalFunc_VoiceChat_ButtonClickHandle(1)")
    self._ui._button_Listen:addInputEvent("Mouse_Out", "PaGlobalFunc_VoiceChat_ButtonHandleOut()")
    self._ui._button_PressTalk:addInputEvent("Mouse_On", "PaGlobalFunc_VoiceChat_ButtonClickHandle(2)")
    self._ui._button_PressTalk:addInputEvent("Mouse_Out", "PaGlobalFunc_VoiceChat_ButtonHandleOut()")
    self._ui._button_Talk:registerPadEvent(__eConsoleUIPadEvent_DpadLeft, "PaGlobalFunc_VoiceChat_LClick_SetTalk(false)")
    self._ui._button_Talk:registerPadEvent(__eConsoleUIPadEvent_DpadRight, "PaGlobalFunc_VoiceChat_LClick_SetTalk(true)")
    self._ui._button_Listen:registerPadEvent(__eConsoleUIPadEvent_DpadLeft, "PaGlobalFunc_VoiceChat_LClick_SetListen(false)")
    self._ui._button_Listen:registerPadEvent(__eConsoleUIPadEvent_DpadRight, "PaGlobalFunc_VoiceChat_LClick_SetListen(true)")
    self._ui._button_PressTalk:registerPadEvent(__eConsoleUIPadEvent_DpadLeft, "PaGlobalFunc_VoiceChat_LClick_SetPressTalk(false)")
    self._ui._button_PressTalk:registerPadEvent(__eConsoleUIPadEvent_DpadRight, "PaGlobalFunc_VoiceChat_LClick_SetPressTalk(true)")
    Panel_Window_VoiceChat:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_VoiceChat_Confirm()")
  else
    self._ui._button_Talk:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_ButtonClickHandle(0)")
    self._ui._button_Listen:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_ButtonClickHandle(1)")
    self._ui._button_PressTalk:addInputEvent("Mouse_LUp", "PaGlobalFunc_VoiceChat_ButtonClickHandle(2)")
  end
end
function Window_VoiceChatInfo:InitControl()
  self._ui._button_Talk = UI.getChildControl(self._ui._static_OnOffGroup, "Button_1")
  self._ui._button_Listen = UI.getChildControl(self._ui._static_OnOffGroup, "Button_2")
  self._ui._button_PressTalk = UI.getChildControl(self._ui._static_OnOffGroup, "Button_3")
  self._ui._button_LArrow = UI.getChildControl(self._ui._static_OnOffGroup, "Static_ArrowLeft")
  self._ui._button_RArrow = UI.getChildControl(self._ui._static_OnOffGroup, "Static_ArrowRight")
  self._arrowDefaultPosY = self._ui._button_LArrow:GetPosY()
  self._ui._slider[0] = UI.getChildControl(self._ui._static_MicVolGroup, "Slider_Vol")
  self._ui._slider[1] = UI.getChildControl(self._ui._static_ListenVolGroup, "Slider_Vol")
  self._ui._slider[2] = UI.getChildControl(self._ui._static_MicSenseGroup, "Slider_Sens")
  self._ui._slider[3] = UI.getChildControl(self._ui._static_MicAmpGroup, "Slider_Amp")
  self._ui._staticText_ListenVol = UI.getChildControl(self._ui._static_ListenVolGroup, "StaticText_SubTitle")
  self._ui._staticText_ListenVol:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_HEARING_VOLUME"))
  self._ui._staticText_MicSense = UI.getChildControl(self._ui._static_MicSenseGroup, "StaticText_SubTitle")
  self._ui._staticText_MicSense:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_MIC_SENSITIVITY"))
  self._ui._staticText_MicAmp = UI.getChildControl(self._ui._static_MicAmpGroup, "StaticText_SubTitle")
  self._ui._staticText_MicAmp:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_MIC_AMPLIFICATION"))
  self._ui._focusBox[0] = UI.getChildControl(self._ui._static_MicVolGroup, "Static_FocusBox")
  self._ui._focusBox[1] = UI.getChildControl(self._ui._static_ListenVolGroup, "Static_FocusBox")
  self._ui._focusBox[2] = UI.getChildControl(self._ui._static_MicSenseGroup, "Static_FocusBox")
  self._ui._focusBox[3] = UI.getChildControl(self._ui._static_MicAmpGroup, "Static_FocusBox")
  self._ui._button_Close = UI.getChildControl(self._ui._static_KeyGuide, "StaticText_Close_ConsoleUI")
  self._ui._button_Confirm = UI.getChildControl(self._ui._static_KeyGuide, "StaticText_Confirm_ConsoleUI")
  for index = 0, self._config._maxSlider - 1 do
    self._ui._button[index] = UI.getChildControl(self._ui._slider[index], "Slider_Button")
    self._ui._button[index]:SetIgnore(true)
    self._ui._buttonText[index] = UI.getChildControl(self._ui._button[index], "StaticText_Val")
    self._ui._focusBox[index]:SetShow(false)
  end
end
function Window_VoiceChatInfo:Initialize()
  self:InitControl()
  self:InitEvent()
end
function FGlobal_SetVoiceChat_Toggle()
  if true == PaGlobalFunc_VoiceChat_GetShow() then
    PaGlobalFunc_VoiceChat_Close()
  else
    PaGlobalFunc_VoiceChat_Open()
  end
end
function Window_VoiceChatInfo:Update()
  if true == self._openIsMicOn then
    self._ui._button_Talk:SetText("ON")
  else
    self._ui._button_Talk:SetText("OFF")
  end
  if true == self._openIsHeadphoneOn then
    self._ui._button_Listen:SetText("ON")
  else
    self._ui._button_Listen:SetText("OFF")
  end
  if true == self._openIsPushToTalk then
    self._ui._button_PressTalk:SetText("ON")
  else
    self._ui._button_PressTalk:SetText("OFF")
  end
  self._ui._buttonText[0]:SetText(Int64toInt32(self._openMicVolume))
  self._ui._buttonText[1]:SetText(Int64toInt32(self._openHeadphoneVolume))
  self._ui._buttonText[2]:SetText(Int64toInt32(self._openMicSensitivity))
  self._ui._buttonText[3]:SetText(Int64toInt32(self._openMicAmplification))
end
function PaGlobalFunc_VoiceChat_Open()
  local self = Window_VoiceChatInfo
  self._prevOpenIsMicOn = ToClient_isVoiceChatMic(self._enumVoiceType._enVoiceChatType_Guild)
  self._prevOpenIsHeadphoneOn = ToClient_isVoiceChatListen(self._enumVoiceType._enVoiceChatType_Guild)
  self._prevOpenIsPushToTalk = ToClient_isVoiceChatPushToTalk()
  self._prevOpenMicVolume = ToClient_getMicVolume()
  self._prevOpenHeadphoneVolume = ToClient_getSpeakerVolume()
  self._prevOpenMicSensitivity = ToClient_getMicSensitivity()
  self._prevOpenMicAmplification = math.ceil(ToClient_getMicAdjustment() * 100) - 100
  self._openIsMicOn = self._prevOpenIsMicOn
  self._openIsHeadphoneOn = self._prevOpenIsHeadphoneOn
  self._openIsPushToTalk = self._prevOpenIsPushToTalk
  self._openMicVolume = self._prevOpenMicVolume
  self._openHeadphoneVolume = self._prevOpenHeadphoneVolume
  self._openMicSensitivity = self._prevOpenMicSensitivity
  self._openMicAmplification = self._prevOpenMicAmplification
  if true == self._openIsMicOn then
    self._ui._button_Talk:SetText("ON")
  else
    self._ui._button_Talk:SetText("OFF")
  end
  if true == self._openIsHeadphoneOn then
    self._ui._button_Listen:SetText("ON")
  else
    self._ui._button_Listen:SetText("OFF")
  end
  if true == self._openIsPushToTalk then
    self._ui._button_PressTalk:SetText("ON")
  else
    self._ui._button_PressTalk:SetText("OFF")
  end
  self._ui._slider[0]:SetControlPos(self._openMicVolume)
  self._ui._slider[1]:SetControlPos(self._openHeadphoneVolume)
  self._ui._slider[2]:SetControlPos(self._openMicSensitivity)
  self._ui._slider[3]:SetControlPos(self._openMicAmplification)
  self._ui._buttonText[0]:SetText(Int64toInt32(self._openMicVolume))
  self._ui._buttonText[1]:SetText(Int64toInt32(self._openHeadphoneVolume))
  self._ui._buttonText[2]:SetText(Int64toInt32(self._openMicSensitivity))
  self._ui._buttonText[3]:SetText(Int64toInt32(self._openMicAmplification))
  if true == Panel_Widget_Chatting_Renew:GetShow() then
    PaGlobalFunc_ChattingInfo_Close()
  end
  Panel_Window_VoiceChat:SetShow(true)
end
function PaGlobalFunc_VoiceChat_Confirm()
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
function PaGlobalFunc_VoiceChat_Close()
  local self = Window_VoiceChatInfo
  local selfPlayer = getSelfPlayer():get()
  local isMicOn = self._prevOpenIsMicOn
  local isHeadphoneOn = self._prevOpenIsHeadphoneOn
  local isPushToTalk = self._prevOpenIsPushToTalk
  local micVolume = self._prevOpenMicVolume
  local headphoneVolume = self._prevOpenHeadphoneVolume
  local micSensitivity = self._prevOpenMicSensitivity
  local micAmplification = self._prevOpenMicAmplification
  for index = 0, self._config._maxSlider - 1 do
    self._ui._focusBox[index]:SetShow(false)
  end
  if true == ToClient_IsConnectedMic() then
    ToClient_setMicOnOff(self._enumVoiceType._enVoiceChatType_Guild, isMicOn)
  else
    ToClient_setMicOnOff(self._enumVoiceType._enVoiceChatType_Guild, false)
  end
  ToClient_setSpeakerOnOff(self._enumVoiceType._enVoiceChatType_Guild, isHeadphoneOn)
  ToClient_setPushToTalkOnOff(isPushToTalk)
  ToClient_setMicVolume(micVolume)
  ToClient_setSpeakerVolume(headphoneVolume)
  ToClient_setMicSensitivity(micSensitivity)
  ToClient_setMicAdjustment(micAmplification)
  ToClient_VoiceChatChangeState(CppEnums.VoiceChatType.eVoiceChatType_Guild, selfPlayer:getUserNo(), isMicOn, isHeadphoneOn, false)
  Panel_Window_VoiceChat:SetShow(false)
end
function PaGlobalFunc_VoiceChat_GetShow()
  return Panel_Window_VoiceChat:GetShow()
end
function PaGlobalFunc_FromClient_VoiceChat_luaLoadComplete()
  local self = Window_VoiceChatInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_VoiceChat_luaLoadComplete")
