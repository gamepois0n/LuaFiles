-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\recommand\panel_recommandname.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
Panel_RecommandName:SetShow(false, false)
Panel_RecommandName:SetDragAll(true)
Panel_RecommandName:setGlassBackground(true)
Panel_RecommandName:ActiveMouseEventEffect(true)
Panel_RecommandName:setMaskingChild(true)
local HelpMailType = {eHelpMailType_Repay = 0, eHelpMailType_Thanks = 1, eHelpMailType_Valentine = 2}
local _helpMailType = HelpMailType.eHelpMailType_Thanks
local uiButtonCloseX = (UI.getChildControl)(Panel_RecommandName, "Button_Win_Close")
local uiButtonApply = (UI.getChildControl)(Panel_RecommandName, "Button_Apply")
local uiButtonClose = (UI.getChildControl)(Panel_RecommandName, "Button_Cancel")
local uiEditName = (UI.getChildControl)(Panel_RecommandName, "Edit_Nickname")
local uiStaticTitle = (UI.getChildControl)(Panel_RecommandName, "StaticText_Title")
local uiStaticContentHelper = (UI.getChildControl)(Panel_RecommandName, "StaticText_ToRecommander")
local uiStaticWarnning = (UI.getChildControl)(Panel_RecommandName, "StaticText_Warnning")
uiStaticWarnning:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
uiButtonCloseX:addInputEvent("Mouse_LUp", "FGlobal_SendMailForHelpClose()")
uiButtonApply:addInputEvent("Mouse_LUp", "HandleClicked_SendMailForHelp()")
uiButtonClose:addInputEvent("Mouse_LUp", "FGlobal_SendMailForHelpClose()")
SendMailForHelpInit = function()
  -- function num : 0_0 , upvalues : uiEditName
  uiEditName:SetMaxInput(getGameServiceTypeCharacterNameLength())
end

HandleClicked_SendMailForHelp = function()
  -- function num : 0_1 , upvalues : uiStaticContentHelper, _helpMailType, HelpMailType, uiEditName, IM
  local content = uiStaticContentHelper:GetText()
  local title = PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_RECOMMANDGIFT")
  if _helpMailType == HelpMailType.eHelpMailType_Thanks then
    title = PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_RECOMMANDGIFT")
    content = PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_SENDMAIL2")
  else
    if _helpMailType == HelpMailType.eHelpMailType_Repay then
      title = PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_RECOMMANDGIFT")
      content = PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_SENDMAIL1")
    else
      title = PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_VALENTINE")
      content = PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_SENDMAIL_BALENTINE")
    end
  end
  ToClient_SendMailForHelp(uiEditName:GetEditText(), title, content)
  Panel_RecommandName:SetShow(false, false)
  if AllowChangeInputMode() then
    if check_ShowWindow() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
  uiEditName:SetEditText("", true)
  ClearFocusEdit()
end

FromClient_SendMailForHelp = function(helpMailType)
  -- function num : 0_2 , upvalues : _helpMailType, uiStaticContentHelper, uiButtonApply, HelpMailType, uiStaticTitle, uiStaticWarnning, uiEditName, IM
  Panel_RecommandName:SetShow(true, false)
  _helpMailType = helpMailType
  uiStaticContentHelper:SetShow(true)
  uiStaticContentHelper:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  uiButtonApply:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_RECOMMAND_BTN"))
  if _helpMailType == HelpMailType.eHelpMailType_Thanks then
    uiStaticContentHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_TONEWBIE"))
    uiStaticTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_THANKSGIFTMAIL"))
    uiStaticWarnning:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_EDITCHARACTERNAME"))
  else
    if _helpMailType == HelpMailType.eHelpMailType_Repay then
      uiStaticContentHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_TORECOMMANDER"))
      uiStaticTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_PAYMAIL"))
      uiStaticWarnning:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_EDITCHARACTERNAME"))
    else
      uiStaticContentHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_BALENTINEMAIL"))
      uiStaticTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_BALENTINEMAIL"))
      uiStaticWarnning:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_EDITCHARACTERNAME"))
      uiButtonApply:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_SEND_BTN"))
    end
  end
  SetFocusEdit(uiEditName)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

FromClient_SendMailForHelpComplete = function(isSender, helpMailType)
  -- function num : 0_3 , upvalues : HelpMailType
  if helpMailType == HelpMailType.eHelpMailType_Thanks then
    if isSender then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_COMPLETE"))
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_GETRECOMMAND"))
    end
  else
  end
  if helpMailType ~= HelpMailType.eHelpMailType_Repay or isSender then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_SENDCOMPLETE_BALENTINE"))
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RECOMMANDNAME_GETBALENTINE"))
  end
end

FGlobal_SendMailForHelpClose = function()
  -- function num : 0_4 , upvalues : IM, uiEditName
  Panel_RecommandName:SetShow(false, false)
  if AllowChangeInputMode() then
    if check_ShowWindow() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
  uiEditName:SetEditText("", true)
  ClearFocusEdit()
end

registerEvent("FromClient_SendMailForHelp", "FromClient_SendMailForHelp")
registerEvent("FromClient_SendMailForHelpComplete", "FromClient_SendMailForHelpComplete")
SendMailForHelpInit()

