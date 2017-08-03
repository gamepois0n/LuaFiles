-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\voicechat\panel_voicechatstatus.luac 

-- params : ...
-- function num : 0
local isVoiceOpen = ToClient_IsContentsGroupOpen("75")
Panel_VoiceChatStatus:SetShow(isVoiceOpen)
local VoiceChat = {
ui = {button = (UI.getChildControl)(Panel_VoiceChatStatus, "Button_SetState")}
, 
config = {micVol = false, headphoneVol = false}
}
-- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

;
(VoiceChat.ui).mic = (UI.getChildControl)((VoiceChat.ui).button, "Static_Mic")
-- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

;
(VoiceChat.ui).headphone = (UI.getChildControl)((VoiceChat.ui).button, "Static_Headphone")
local iconType = {mic = 0, headphone = 1}
local iconTexture = {
[iconType.mic] = {
[0] = {182, 347, 226, 390}
, 
[1] = {272, 347, 316, 390}
}
, 
[iconType.headphone] = {
[0] = {137, 347, 181, 390}
, 
[1] = {227, 347, 271, 390}
}
}
VoiceChat.Init = function(self)
  -- function num : 0_0 , upvalues : isVoiceOpen
  if not isVoiceOpen then
    return 
  end
  FGlobal_VoiceChatState()
end

VoiceChat.IconChange = function(self, icon, isOn)
  -- function num : 0_1 , upvalues : iconType, iconTexture
  local ui = nil
  if iconType.mic == icon then
    ui = (self.ui).mic
  else
    ui = (self.ui).headphone
  end
  local textureArray = {}
  if isOn == true then
    textureArray = (iconTexture[icon])[0]
  else
    textureArray = (iconTexture[icon])[1]
  end
  local x1, y1, x2, y2 = setTextureUV_Func(ui, textureArray[1], textureArray[2], textureArray[3], textureArray[4])
  ;
  (ui:getBaseTexture()):setUV(x1, y1, x2, y2)
  ui:setRenderTexture(ui:getBaseTexture())
end

VoiceChat.Update = function(self)
  -- function num : 0_2 , upvalues : iconType
  local isMicOn = (self.config).micVol
  local isHeadphoneOn = (self.config).headphoneVol
  self:IconChange(iconType.mic, isMicOn)
  self:IconChange(iconType.headphone, isHeadphoneOn)
end

FGlobal_VoiceChatState = function()
  -- function num : 0_3 , upvalues : isVoiceOpen, VoiceChat
  if not isVoiceOpen then
    return 
  end
  local isMicOn = ToClient_isVoiceChatMic()
  local isHeadphoneOn = ToClient_isVoiceChatListen()
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (VoiceChat.config).micVol = isMicOn
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (VoiceChat.config).headphoneVol = isHeadphoneOn
  VoiceChat:Update()
end

HandleOnOut_SetVoiceChat_Tooltip = function(isShow)
  -- function num : 0_4 , upvalues : VoiceChat
  local uiControl = (VoiceChat.ui).button
  if isShow == true then
    local changeString = function(isOn)
    -- function num : 0_4_0
    local returnValue = ""
    if isOn == true then
      returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_VOICECHAT_TOOLTIP_ISON")
    else
      returnValue = PAGetString(Defines.StringSheet_GAME, "LUA_VOICECHAT_TOOLTIP_ISOFF")
    end
    return returnValue
  end

    local isMicOn = changeString(ToClient_isVoiceChatMic())
    local isHeadphoneOn = changeString(ToClient_isVoiceChatListen())
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_VOICECHAT_TOOLTIP_TITLE")
    local desc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_VOICECHAT_TOOLTIP_DESC", "mic", isMicOn, "speaker", isHeadphoneOn)
    TooltipSimple_Show(uiControl, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

VoiceChat.registEventHandler = function(self)
  -- function num : 0_5
  ((self.ui).button):addInputEvent("Mouse_LUp", "FGlobal_SetVoiceChat_Toggle()")
  ;
  ((self.ui).button):addInputEvent("Mouse_On", "HandleOnOut_SetVoiceChat_Tooltip( true )")
  ;
  ((self.ui).button):addInputEvent("Mouse_Out", "HandleOnOut_SetVoiceChat_Tooltip( false )")
  ;
  ((self.ui).button):setTooltipEventRegistFunc("HandleOnOut_SetVoiceChat_Tooltip( true )")
end

VoiceChat.registMessageHandler = function(self)
  -- function num : 0_6
  registerEvent("FromClient_VoiceChatState", "FGlobal_VoiceChatState")
end

VoiceChat:Init()
VoiceChat:registEventHandler()
VoiceChat:registMessageHandler()

