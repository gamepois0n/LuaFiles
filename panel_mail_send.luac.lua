-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\mail\panel_mail_send.luac 

-- params : ...
-- function num : 0
Panel_Mail_Send:SetShow(false, false)
Panel_Mail_Send:ActiveMouseEventEffect(true)
Panel_Mail_Send:setMaskingChild(true)
Panel_Mail_Send:setGlassBackground(true)
Panel_Mail_Send:RegisterShowEventFunc(true, "MailSendShowAni()")
Panel_Mail_Send:RegisterShowEventFunc(false, "MailSendHideAni()")
local IM = CppEnums.EProcessorInputMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local mailSend = {_buttonQuestion = (UI.getChildControl)(Panel_Mail_Send, "Button_Question"), _inventoryType = 0, _inventorySlotNo = -1}
local editContentWebcontrol = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_Mail_Send, "Mail_TextArea")
MailSendShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Down)(Panel_Mail_Send)
end

MailSendHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Mail_Send:ChangeSpecialTextureInfoName("")
  Panel_Mail_Send:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Mail_Send:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

MailSend_Resize = function()
  -- function num : 0_2
  screenX = getScreenSizeX()
  screenY = getScreenSizeY()
end

mailSend.init = function(self)
  -- function num : 0_3 , upvalues : editContentWebcontrol
  editContentWebcontrol:SetUrl(Panel_Mail_Send:GetSizeX() - 20, Panel_Mail_Send:GetSizeY() - 80, "coui://UI_Data/UI_Html/Window/Mail/Mail_InputText2.html")
  editContentWebcontrol:SetSize(Panel_Mail_Send:GetSizeX() - 20, Panel_Mail_Send:GetSizeY() - 80)
  editContentWebcontrol:SetShow(true)
  editContentWebcontrol:SetPosX(10)
  editContentWebcontrol:SetPosY(40)
  editContentWebcontrol:SetIME()
end

mailSend.registEventHandler = function(self)
  -- function num : 0_4
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelMailSend\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelMailSend\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelMailSend\", \"false\")")
end

mailSend.registMessageHandler = function(self)
  -- function num : 0_5
  registerEvent("onScreenResize", "MailSend_Resize")
  registerEvent("EventMailSendOpen", "MailSend_Open")
  registerEvent("EventMailSendClose", "MailSend_Close")
end

MailSend_Send = function()
  -- function num : 0_6 , upvalues : mailSend, editContentWebcontrol
  local self = mailSend
  local receiveCharactername = (self.editTarget):GetEditText()
  local title = (self.editTitle):GetEditText()
  local contents = editContentWebcontrol:GetText()
  mail_sendMail(self._inventoryType, self._inventorySlotNo, receiveCharactername, title, contents)
end

MailSend_Cancle = function()
  -- function num : 0_7
  MailSend_Close()
end

MailSend_PressedUp = function()
  -- function num : 0_8
end

MailSend_PressedDown = function()
  -- function num : 0_9
end

MailSend_Open = function(inventoryType, inventorySlotNo)
  -- function num : 0_10 , upvalues : mailSend, IM, editContentWebcontrol
  if not Panel_Mail_Send:GetShow() then
    Panel_Mail_Send:ChangeSpecialTextureInfoName("")
    Panel_Mail_Send:SetAlphaExtraChild(1)
    Panel_Mail_Send:SetShow(true, IsAniUse())
  end
  local self = mailSend
  self._inventoryType = inventoryType
  self._inventorySlotNo = inventorySlotNo
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  editContentWebcontrol:TriggerEvent("InventorySlotNo", inventorySlotNo)
end

MailSend_Close = function()
  -- function num : 0_11 , upvalues : IM, UI_ANI_ADV, UI_color
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  Panel_Mail_Send:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Mail_Send:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  local aniInfo2 = Panel_Mail_Send:addScaleAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(0.97)
  aniInfo2.AxisX = 200
  aniInfo2.AxisY = 295
  aniInfo2.IsChangeChild = true
  aniInfo2:SetDisableWhileAni(true)
  Panel_Mail_Send:SetShow(false, false)
end


