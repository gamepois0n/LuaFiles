-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\chatting\panel_chatnew_reportgoldseller.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_CT = CppEnums.ChatType
local UI_CNT = CppEnums.EChatNoticeType
local UI_Group = Defines.UIGroup
local IM = CppEnums.EProcessorInputMode
local reportSeller = {panel_Title = (UI.getChildControl)(Panel_Chatting_Block_GoldSeller, "StaticText_Title"), inputNameBG = (UI.getChildControl)(Panel_Chatting_Block_GoldSeller, "Static_BG"), title_UserName = (UI.getChildControl)(Panel_Chatting_Block_GoldSeller, "StaticText_Title_UserName"), edit_UserName = (UI.getChildControl)(Panel_Chatting_Block_GoldSeller, "Edit_Value_UserName"), report_Notify = (UI.getChildControl)(Panel_Chatting_Block_GoldSeller, "StaticText_ReportNotice"), chattingMsgBG = (UI.getChildControl)(Panel_Chatting_Block_GoldSeller, "Static_ChattingMsgBG"), str_ChatLog = (UI.getChildControl)(Panel_Chatting_Block_GoldSeller, "StaticText_ChattingMsg"), btn_Confirm = (UI.getChildControl)(Panel_Chatting_Block_GoldSeller, "Button_Confirm"), btn_Cancel = (UI.getChildControl)(Panel_Chatting_Block_GoldSeller, "Button_Cancel"), 
data = {reportUserName = nil, reportUserMsg = nil}
}
reportSeller.init = function(self)
  -- function num : 0_0 , upvalues : UI_TM, IM
  (self.report_Notify):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.report_Notify):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_REPORT_GOLD_SELLER_NOTIFY"))
  ;
  (self.str_ChatLog):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
  ;
  (self.str_ChatLog):setLineCountByLimitAutoWrap(7)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

reportSeller.update = function(self)
  -- function num : 0_1
  if (self.data).reportUserName ~= nil and (self.data).reportUserMsg ~= nil then
    (self.panel_Title):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHAT_REPORT_GOLD_SELLER_TITLE", "name", (self.data).reportUserName))
    ;
    (self.edit_UserName):SetEditText("")
    SetFocusEdit(self.edit_UserName)
    ;
    (self.str_ChatLog):SetText((self.data).reportUserMsg)
    ;
    (self.chattingMsgBG):SetSize((self.chattingMsgBG):GetSizeX(), (self.str_ChatLog):GetTextSizeY() + 20)
    ;
    (self.str_ChatLog):SetSize((self.str_ChatLog):GetSizeX(), (self.str_ChatLog):GetTextSizeY())
    Panel_Chatting_Block_GoldSeller:SetSize(Panel_Chatting_Block_GoldSeller:GetSizeX(), (self.inputNameBG):GetSizeY() + (self.str_ChatLog):GetTextSizeY() + 150)
    ;
    (self.btn_Confirm):SetSpanSize(((self.btn_Confirm):GetSpanSize()).x, 15)
    ;
    (self.btn_Cancel):SetSpanSize(((self.btn_Cancel):GetSpanSize()).x, 15)
  end
end

reportSeller.Open = function(self)
  -- function num : 0_2 , upvalues : IM
  Panel_Chatting_Block_GoldSeller:SetShow(true)
  self:update()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

reportSeller.Close = function(self)
  -- function num : 0_3 , upvalues : IM
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self.data).reportUserName = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.data).reportUserMsg = nil
  ClearFocusEdit()
  Panel_Chatting_Block_GoldSeller:SetShow(false)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
end

HandleClicked_reportSeller_Close = function()
  -- function num : 0_4 , upvalues : reportSeller, IM
  reportSeller:Close()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
end

HandleClicked_reportSeller_Confirm = function()
  -- function num : 0_5 , upvalues : reportSeller
  if (reportSeller.edit_UserName):GetEditText() == "" or (reportSeller.edit_UserName):GetEditText() == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_REPORT_GOLD_SELLER_NO_NAME"))
    return 
  end
  local typeSpell = (reportSeller.edit_UserName):GetEditText()
  local typeSpellCheck = typeSpell == "Yes" or typeSpell == "YES" or typeSpell == "yes" or typeSpell == "Ja" or typeSpell == "ja" or typeSpell == "JA" or typeSpell == "Oui" or typeSpell == "oui" or typeSpell == "OUI"
  if typeSpellCheck == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_REPORT_GOLD_SELLER_NOT_MATCH"))
    return 
  end
  local messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHAT_REPORT_GOLD_SELLER_CHECK_AGAIN", "name", (reportSeller.data).reportUserName)
  do
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "GUILD_MESSAGEBOX_TITLE"), content = messageContent, functionYes = _reportSeller_ConfirmDo, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    ClearFocusEdit()
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

_reportSeller_ConfirmDo = function()
  -- function num : 0_6 , upvalues : reportSeller, IM
  ToClient_BlockChatWithItem((reportSeller.data).reportUserName, (reportSeller.data).reportUserMsg)
  reportSeller:Close()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
end

FGlobal_reportSeller_Open = function(userName, userMsg)
  -- function num : 0_7 , upvalues : reportSeller
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  (reportSeller.data).reportUserName = userName
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (reportSeller.data).reportUserMsg = userMsg
  reportSeller:Open()
end

FGlobal_reportSeller_Close = function()
  -- function num : 0_8 , upvalues : reportSeller, IM
  reportSeller:Close()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
end

reportSeller_OnscreenResize = function()
  -- function num : 0_9
  Panel_Chatting_Block_GoldSeller:ComputePos()
end

HandleClicked_reportSeller_EditBox = function()
  -- function num : 0_10 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

reportSeller.registEventHandler = function(self)
  -- function num : 0_11
  (self.btn_Cancel):addInputEvent("Mouse_LUp", "HandleClicked_reportSeller_Close()")
  ;
  (self.btn_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_reportSeller_Confirm()")
  ;
  (self.edit_UserName):addInputEvent("Mouse_LUp", "HandleClicked_reportSeller_EditBox()")
  ;
  (self.edit_UserName):RegistReturnKeyEvent("HandleClicked_reportSeller_Confirm()")
end

reportSeller.registMessageHandler = function(self)
  -- function num : 0_12
  registerEvent("onScreenResize", "reportSeller_OnscreenResize")
end

reportSeller:init()
reportSeller:registEventHandler()
reportSeller:registMessageHandler()

