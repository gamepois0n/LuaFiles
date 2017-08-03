-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_setvoicechat.luac 

-- params : ...
-- function num : 0
Panel_SetVoiceChat:SetShow(false)
Panel_SetVoiceChat:ActiveMouseEventEffect(true)
Panel_SetVoiceChat:setGlassBackground(true)
local isVoiceOpen = ToClient_IsContentsGroupOpen("75")
local voiceSet = {
ui = {micOnOff = (UI.getChildControl)(Panel_SetVoiceChat, "Checkbox_MicOnOff"), headphoneOnOff = (UI.getChildControl)(Panel_SetVoiceChat, "CheckButton_SpeakerOnOff"), pushToTalk = (UI.getChildControl)(Panel_SetVoiceChat, "CheckButton_PushToTalkOnOff"), slider_0 = (UI.getChildControl)(Panel_SetVoiceChat, "Slider_MicVolControl_0"), slider_1 = (UI.getChildControl)(Panel_SetVoiceChat, "Slider_MicVolControl_1"), slider_2 = (UI.getChildControl)(Panel_SetVoiceChat, "Slider_MicVolControl_2"), slider_3 = (UI.getChildControl)(Panel_SetVoiceChat, "Slider_MicVolControl_3"), confirm = (UI.getChildControl)(Panel_SetVoiceChat, "Button_Confirm"), cancel = (UI.getChildControl)(Panel_SetVoiceChat, "Button_Cancel"), winClose = (UI.getChildControl)(Panel_SetVoiceChat, "Button_WinClose")}
, 
uiPool = {}
, 
enumVoiceType = {enVoiceChatType_Guild = 0, enVoiceChatType_Party = 1, enVoiceChatType_World = 2}
, 
config = {sliderCount = 4, openIsMicOn = true, openIsHeadphoneOn = true, openIsPushToTalk = true, openMicVolume = 0, openHeadphoneVolume = 0, openMicSensitivity = 0, openMicAmplification = 0}
}
-- DECOMPILER ERROR at PC102: Confused about usage of register: R2 in 'UnsetPending'

;
(voiceSet.ui).sliderBtn = (UI.getChildControl)((voiceSet.ui).slider_0, "Slider_MicVol_Button")
local titleArray = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_TALK_VOLUME"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_HEARING_VOLUME"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_MIC_SENSITIVITY"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_SETVOICECHAT_MIC_AMPLIFICATION")}
voiceSet.Init = function(self)
  -- function num : 0_0 , upvalues : voiceSet, titleArray
  local defaultPosY = 135
  for sliderIdx = 0, (self.config).sliderCount - 1 do
    local tempSlot = {}
    tempSlot.titleBg = (UI.createAndCopyBasePropertyControl)(Panel_SetVoiceChat, "Static_MicBG", Panel_SetVoiceChat, "Panel_SetVoiceChat_TitleBg_" .. sliderIdx)
    tempSlot.title = (UI.createAndCopyBasePropertyControl)(Panel_SetVoiceChat, "StaticText_MicTitle", tempSlot.titleBg, "Panel_SetVoiceChat_Title_" .. sliderIdx)
    tempSlot.vol_0 = (UI.createAndCopyBasePropertyControl)(Panel_SetVoiceChat, "StaticText_MicVol_0", tempSlot.titleBg, "Panel_SetVoiceChat_Vol_0_" .. sliderIdx)
    tempSlot.vol_50 = (UI.createAndCopyBasePropertyControl)(Panel_SetVoiceChat, "StaticText_MicVol_50", tempSlot.titleBg, "Panel_SetVoiceChat_Vol_50_" .. sliderIdx)
    tempSlot.vol_100 = (UI.createAndCopyBasePropertyControl)(Panel_SetVoiceChat, "StaticText_MicVol_100", tempSlot.titleBg, "Panel_SetVoiceChat_Vol_100_" .. sliderIdx)
    local slider = nil
    if sliderIdx == 0 then
      slider = (voiceSet.ui).slider_0
    else
      if sliderIdx == 1 then
        slider = (voiceSet.ui).slider_1
      else
        if sliderIdx == 2 then
          slider = (voiceSet.ui).slider_2
        else
          if sliderIdx == 3 then
            slider = (voiceSet.ui).slider_3
          end
        end
      end
    end
    Panel_SetVoiceChat:RemoveControl(slider)
    ;
    (tempSlot.titleBg):AddChild(slider)
    tempSlot.vol_Slider = slider
    tempSlot.vol_SliderBtn = (UI.getChildControl)(tempSlot.vol_Slider, "Slider_MicVol_Button")
    ;
    (tempSlot.vol_Slider):SetShow(true)
    ;
    (tempSlot.titleBg):SetPosY(defaultPosY + 75 * sliderIdx)
    ;
    (tempSlot.title):SetPosX(10)
    ;
    (tempSlot.title):SetPosY(1)
    ;
    (tempSlot.vol_0):SetPosX(5)
    ;
    (tempSlot.vol_0):SetPosY(25)
    ;
    (tempSlot.vol_50):SetPosX((tempSlot.vol_Slider):GetSizeX() / 2 - (tempSlot.vol_50):GetSizeX() / 3)
    ;
    (tempSlot.vol_50):SetPosY(25)
    ;
    (tempSlot.vol_100):SetPosX((tempSlot.vol_Slider):GetSizeX() - (tempSlot.vol_100):GetSizeX())
    ;
    (tempSlot.vol_100):SetPosY(25)
    ;
    (tempSlot.vol_Slider):SetPosX(5)
    ;
    (tempSlot.vol_Slider):SetPosY(50)
    ;
    (tempSlot.title):SetText(titleArray[sliderIdx])
    ;
    (tempSlot.vol_Slider):SetControlPos(0)
    ;
    (tempSlot.vol_Slider):addInputEvent("Mouse_LUp", "HandleMove_VoiceChat_Volume( " .. sliderIdx .. " )")
    ;
    (tempSlot.vol_SliderBtn):addInputEvent("Mouse_LPress", "HandleMove_VoiceChat_Volume( " .. sliderIdx .. " )")
    -- DECOMPILER ERROR at PC186: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self.uiPool)[sliderIdx] = tempSlot
  end
end

voiceSet.close = function(self)
  -- function num : 0_1 , upvalues : voiceSet
  local selfPlayer = (getSelfPlayer()):get()
  local isMicOn = (voiceSet.config).openIsMicOn
  local isHeadphoneOn = (voiceSet.config).openIsHeadphoneOn
  local isPushToTalk = (voiceSet.config).openIsPushToTalk
  local micVolume = (voiceSet.config).openMicVolume
  local headphoneVolume = (voiceSet.config).openHeadphoneVolume
  local micSensitivity = (voiceSet.config).openMicSensitivity
  local micAmplification = (voiceSet.config).openMicAmplification
  if ToClient_IsConnectedMic() then
    ToClient_setMicOnOff((voiceSet.enumVoiceType).enVoiceChatType_Guild, isMicOn)
  else
    ToClient_setMicOnOff((voiceSet.enumVoiceType).enVoiceChatType_Guild, false)
  end
  ToClient_setSpeakerOnOff((voiceSet.enumVoiceType).enVoiceChatType_Guild, isHeadphoneOn)
  ToClient_setPushToTalkOnOff(isPushToTalk)
  ToClient_setMicVolume(micVolume)
  ToClient_setSpeakerVolume(headphoneVolume)
  ToClient_setMicSensitivity(micSensitivity)
  ToClient_setMicAdjustment(micAmplification)
  ToClient_VoiceChatChangeState((CppEnums.VoiceChatType).eVoiceChatType_Guild, selfPlayer:getUserNo(), isMicOn, isHeadphoneOn, false)
  Panel_SetVoiceChat:SetShow(false)
  FGlobal_VoiceChatState()
end

HandleMove_VoiceChat_Volume = function(sliderIdx)
  -- function num : 0_2 , upvalues : voiceSet
  local slider = ((voiceSet.uiPool)[sliderIdx]).vol_Slider
  if slider == nil then
    return 
  end
  local posPercent = slider:GetControlPos() * 100
  if sliderIdx == 0 then
    ToClient_setMicVolume(posPercent)
    if posPercent > 0 then
      ((voiceSet.ui).micOnOff):SetCheck(true)
    else
      ;
      ((voiceSet.ui).micOnOff):SetCheck(false)
    end
  else
    if sliderIdx == 1 then
      ToClient_setSpeakerVolume(posPercent)
      if posPercent > 0 then
        ((voiceSet.ui).headphoneOnOff):SetCheck(true)
      else
        ;
        ((voiceSet.ui).headphoneOnOff):SetCheck(false)
      end
    else
      if sliderIdx == 2 then
        ToClient_setMicSensitivity(posPercent)
      else
        if sliderIdx == 3 then
          ToClient_setMicAdjustment(posPercent)
        end
      end
    end
  end
  HandleClick_VoiceChat_SetOnOff()
  FGlobal_VoiceChatState()
end

HandleClick_VoiceChat_SetOnOff = function()
  -- function num : 0_3 , upvalues : voiceSet
  local isMicOn = ((voiceSet.ui).micOnOff):IsCheck()
  local isHeadphoneOn = ((voiceSet.ui).headphoneOnOff):IsCheck()
  local isPushToTalk = ((voiceSet.ui).pushToTalk):IsCheck()
  if ToClient_IsConnectedMic() then
    ToClient_setMicOnOff((voiceSet.enumVoiceType).enVoiceChatType_Guild, isMicOn)
  else
    if isMicOn then
      ((voiceSet.ui).micOnOff):SetCheck(false)
    end
    ToClient_setMicOnOff((voiceSet.enumVoiceType).enVoiceChatType_Guild, false)
  end
  ToClient_setSpeakerOnOff((voiceSet.enumVoiceType).enVoiceChatType_Guild, isHeadphoneOn)
  ToClient_setPushToTalkOnOff(isPushToTalk)
  FGlobal_VoiceChatState()
end

HandleClick_VoiceChat_Confirm = function()
  -- function num : 0_4 , upvalues : voiceSet
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  (voiceSet.config).openIsMicOn = ((voiceSet.ui).micOnOff):IsCheck()
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (voiceSet.config).openIsHeadphoneOn = ((voiceSet.ui).headphoneOnOff):IsCheck()
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (voiceSet.config).openIsPushToTalk = ((voiceSet.ui).pushToTalk):IsCheck()
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (voiceSet.config).openMicVolume = (math.ceil)((((voiceSet.uiPool)[0]).vol_Slider):GetControlPos() * 100)
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (voiceSet.config).openHeadphoneVolume = (math.ceil)((((voiceSet.uiPool)[1]).vol_Slider):GetControlPos() * 100)
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (voiceSet.config).openMicSensitivity = (math.ceil)((((voiceSet.uiPool)[2]).vol_Slider):GetControlPos() * 100)
  -- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (voiceSet.config).openMicAmplification = (math.ceil)((((voiceSet.uiPool)[3]).vol_Slider):GetControlPos() * 100)
  voiceSet:close()
end

HandleClick_VoiceChat_Close = function()
  -- function num : 0_5 , upvalues : voiceSet
  voiceSet:close()
end

FGlobal_SetVoiceChat_Close = function()
  -- function num : 0_6 , upvalues : voiceSet
  voiceSet:close()
end

FGlobal_SetVoiceChat_Toggle = function()
  -- function num : 0_7 , upvalues : isVoiceOpen, voiceSet
  if not isVoiceOpen then
    return 
  end
  if Panel_SetVoiceChat:GetShow() then
    Panel_SetVoiceChat:SetShow(false)
  else
    local voiceChatButton = FGlobal_GetPersonalIconControl(2)
    Panel_SetVoiceChat:SetShow(true)
    Panel_SetVoiceChat:SetPosX(Panel_Radar:GetPosX() - Panel_SetVoiceChat:GetSizeX())
    Panel_SetVoiceChat:SetPosY(voiceChatButton:GetPosY() + voiceChatButton:GetSizeY() + 5)
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (voiceSet.config).openIsMicOn = ToClient_isVoiceChatMic((voiceSet.enumVoiceType).enVoiceChatType_Guild)
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (voiceSet.config).openIsHeadphoneOn = ToClient_isVoiceChatListen((voiceSet.enumVoiceType).enVoiceChatType_Guild)
    -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (voiceSet.config).openIsPushToTalk = ToClient_isVoiceChatPushToTalk()
    -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (voiceSet.config).openMicVolume = ToClient_getMicVolume()
    -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (voiceSet.config).openHeadphoneVolume = ToClient_getSpeakerVolume()
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (voiceSet.config).openMicSensitivity = ToClient_getMicSensitivity()
    -- DECOMPILER ERROR at PC85: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (voiceSet.config).openMicAmplification = (math.ceil)(ToClient_getMicAdjustment() * 100) - 100
    ;
    (((voiceSet.uiPool)[0]).vol_Slider):SetControlPos((voiceSet.config).openMicVolume)
    ;
    (((voiceSet.uiPool)[1]).vol_Slider):SetControlPos((voiceSet.config).openHeadphoneVolume)
    ;
    (((voiceSet.uiPool)[2]).vol_Slider):SetControlPos((voiceSet.config).openMicSensitivity)
    ;
    (((voiceSet.uiPool)[3]).vol_Slider):SetControlPos((voiceSet.config).openMicAmplification)
    ;
    ((voiceSet.ui).micOnOff):SetCheck((voiceSet.config).openIsMicOn)
    ;
    ((voiceSet.ui).headphoneOnOff):SetCheck((voiceSet.config).openIsHeadphoneOn)
    ;
    ((voiceSet.ui).pushToTalk):SetCheck((voiceSet.config).openIsPushToTalk)
  end
end

voiceSet.registEventHandler = function(self)
  -- function num : 0_8
  ((self.ui).confirm):addInputEvent("Mouse_LUp", "HandleClick_VoiceChat_Confirm()")
  ;
  ((self.ui).cancel):addInputEvent("Mouse_LUp", "HandleClick_VoiceChat_Close()")
  ;
  ((self.ui).winClose):addInputEvent("Mouse_LUp", "HandleClick_VoiceChat_Close()")
  ;
  ((self.ui).micOnOff):addInputEvent("Mouse_LUp", "HandleClick_VoiceChat_SetOnOff()")
  ;
  ((self.ui).headphoneOnOff):addInputEvent("Mouse_LUp", "HandleClick_VoiceChat_SetOnOff()")
  ;
  ((self.ui).pushToTalk):addInputEvent("Mouse_LUp", "HandleClick_VoiceChat_SetOnOff()")
end

voiceSet.registMessageHandler = function(self)
  -- function num : 0_9
end

voiceSet:Init()
voiceSet:registEventHandler()
voiceSet:registMessageHandler()

