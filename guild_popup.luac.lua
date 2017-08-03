-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\guild_popup.luac 

-- params : ...
-- function num : 0
Panel_CreateGuild:SetShow(false)
Panel_CreateClan:SetShow(false, false)
Panel_CreateClan:RegisterShowEventFunc(true, "CreateClanShowAni()")
Panel_CreateClan:RegisterShowEventFunc(false, "CreateClanHideAni()")
Panel_CreateClan:setGlassBackground(true)
Panel_ClanToGuild:SetShow(false, false)
Panel_ClanToGuild:RegisterShowEventFunc(true, "ClanToGuildShowAni()")
Panel_ClanToGuild:RegisterShowEventFunc(false, "ClanToGuildHideAni()")
Panel_ClanToGuild:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local IM = CppEnums.EProcessorInputMode
local CreateClan = {selectedClan = (UI.getChildControl)(Panel_CreateClan, "RadioButton_Clan"), selectedGuild = (UI.getChildControl)(Panel_CreateClan, "RadioButton_Guild"), create = (UI.getChildControl)(Panel_CreateClan, "Button_Confirm"), createDescBG = (UI.getChildControl)(Panel_CreateClan, "Static_CreateClanDescBG"), guideMainBaseBG = (UI.getChildControl)(Panel_CreateClan, "Static_BaseBG"), guideMainBG = (UI.getChildControl)(Panel_CreateClan, "Static_SelectedTypeDescBG"), guideTitle = (UI.getChildControl)(Panel_CreateClan, "StaticText_SelectedTypeTitle"), guideDesc = (UI.getChildControl)(Panel_CreateClan, "StaticText_SelectedTypeDesc"), help = (UI.getChildControl)(Panel_CreateClan, "Button_Question"), close = (UI.getChildControl)(Panel_CreateClan, "Button_Win_Close")}
local ClanToGuild = {convert = (UI.getChildControl)(Panel_ClanToGuild, "Button_Convert"), help = (UI.getChildControl)(Panel_ClanToGuild, "Button_Question"), close = (UI.getChildControl)(Panel_ClanToGuild, "Button_Win_Close")}
CreateClanShowAni = function()
  -- function num : 0_0
end

CreateClanHideAni = function()
  -- function num : 0_1
end

ClanToGuildShowAni = function()
  -- function num : 0_2
end

ClanToGuildHideAni = function()
  -- function num : 0_3
end

local GuildCreateManager = {_createGuildBG = (UI.getChildControl)(Panel_CreateGuild, "Static_BG"), _buttonApply = (UI.getChildControl)(Panel_CreateGuild, "Button_Confirm"), _buttonCancel = (UI.getChildControl)(Panel_CreateGuild, "Button_Cancel"), _editGuildNameInput = (UI.getChildControl)(Panel_CreateGuild, "Edit_GuildName"), _txt_NameDesc = (UI.getChildControl)(Panel_CreateGuild, "StaticText_NameDesc"), _staticCreateServantNameBG = (UI.getChildControl)(Panel_CreateGuild, "Static_NamingPolicyBG"), _staticCreateServantNameTitle = (UI.getChildControl)(Panel_CreateGuild, "StaticText_NamingPolicyTitle"), _staticCreateServantName = (UI.getChildControl)(Panel_CreateGuild, "StaticText_NamingPolicy")}
GuildCreateManager.initialize = function(self)
  -- function num : 0_4 , upvalues : GuildCreateManager, UI_TM
  (GuildCreateManager._buttonApply):addInputEvent("Mouse_LUp", "handleClicked_GuildCreateApply()")
  ;
  (GuildCreateManager._buttonCancel):addInputEvent("Mouse_LUp", "handleClicked_GuildCreateCancel()")
  ;
  (GuildCreateManager._editGuildNameInput):RegistReturnKeyEvent("handleClicked_GuildCreateApply()")
  if isGameTypeEnglish() or isGameTypeTaiwan() then
    (GuildCreateManager._staticCreateServantName):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (GuildCreateManager._staticCreateServantName):SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_EN"))
    ;
    (GuildCreateManager._staticCreateServantName):SetShow(true)
    ;
    (GuildCreateManager._staticCreateServantNameBG):SetShow(true)
    ;
    (GuildCreateManager._staticCreateServantNameTitle):SetShow(true)
  else
    ;
    (GuildCreateManager._staticCreateServantName):SetShow(false)
    ;
    (GuildCreateManager._staticCreateServantNameBG):SetShow(false)
    ;
    (GuildCreateManager._staticCreateServantNameTitle):SetShow(false)
  end
end

CreateClan.initialize = function(self)
  -- function num : 0_5 , upvalues : UI_TM, GuildCreateManager
  (self.guideDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.guideTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDETITLE_CLAN"))
  ;
  (self.guideDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDEDESC_CLAN"))
  if isGameTypeEnglish() or isGameTypeTaiwan() then
    (GuildCreateManager._staticCreateServantName):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (GuildCreateManager._staticCreateServantName):SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_EN"))
    ;
    (GuildCreateManager._staticCreateServantName):SetShow(true)
    ;
    (GuildCreateManager._staticCreateServantNameBG):SetShow(true)
    ;
    (GuildCreateManager._staticCreateServantNameTitle):SetShow(true)
  else
    ;
    (GuildCreateManager._staticCreateServantName):SetShow(false)
    ;
    (GuildCreateManager._staticCreateServantNameBG):SetShow(false)
    ;
    (GuildCreateManager._staticCreateServantNameTitle):SetShow(false)
  end
end

FGlobal_CehckedGuildEditUI = function(uiEdit)
  -- function num : 0_6 , upvalues : GuildCreateManager
  if uiEdit == nil then
    return false
  end
  do return uiEdit:GetKey() == (GuildCreateManager._editGuildNameInput):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

handleClickedShowGuildCreateComment = function()
  -- function num : 0_7 , upvalues : GuildCreateManager, UI_TM
  local luaGuildTextGuildCreateMsg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_CREATE_MSG")
  if (GuildCreateManager._buttonCreateGuild):IsChecked() then
    (GuildCreateManager._textCommentTitle):SetText(GuildCreateManager._titleGuild)
    ;
    (GuildCreateManager._textComment):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (GuildCreateManager._textComment):SetText(GuildCreateManager._commentGuild)
    ;
    (GuildCreateManager._textBottomText):SetText(luaGuildTextGuildCreateMsg)
  end
end

handleClickedGuildCreateCancel = function()
  -- function num : 0_8
  Panel_GuildManager:SetShow(false, false)
end

Guild_PopupCreate = function(guildGrade)
  -- function num : 0_9 , upvalues : IM, GuildCreateManager, UI_TM
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  local showInputGuildName = function()
    -- function num : 0_9_0 , upvalues : IM, GuildCreateManager, UI_TM
    Panel_CreateGuild:SetShow(true)
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
    ;
    (GuildCreateManager._editGuildNameInput):SetEditText("", true)
    ;
    (GuildCreateManager._editGuildNameInput):SetMaxInput(getGameServiceTypeGuildNameLength())
    SetFocusEdit(GuildCreateManager._editGuildNameInput)
    ;
    (GuildCreateManager._editGuildNameInput):SetEnable(true)
    ;
    (GuildCreateManager._editGuildNameInput):SetMonoTone(false)
    ;
    (GuildCreateManager._txt_NameDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (GuildCreateManager._txt_NameDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_POPUP_1"))
    ;
    (GuildCreateManager._createGuildBG):SetSize((GuildCreateManager._createGuildBG):GetSizeX(), (GuildCreateManager._txt_NameDesc):GetTextSizeY() + (GuildCreateManager._editGuildNameInput):GetSizeY() + 40)
    Panel_CreateGuild:SetSize(Panel_CreateGuild:GetSizeX(), (GuildCreateManager._txt_NameDesc):GetTextSizeY() + (GuildCreateManager._editGuildNameInput):GetSizeY() + 140)
    ;
    (GuildCreateManager._buttonApply):SetSpanSize(((GuildCreateManager._buttonApply):GetSpanSize()).x, 10)
    ;
    (GuildCreateManager._buttonCancel):SetSpanSize(((GuildCreateManager._buttonCancel):GetSpanSize()).x, 10)
    ;
    (GuildCreateManager._buttonApply):SetText(PAGetString(Defines.StringSheet_RESOURCE, "EXCHANGE_NUMBER_BTN_APPLY"))
    ;
    (GuildCreateManager._buttonCancel):SetText(PAGetString(Defines.StringSheet_RESOURCE, "EXCHANGE_NUMBER_BTN_CANCEL"))
    ;
    (GuildCreateManager._staticCreateServantName):ComputePos()
    ;
    (GuildCreateManager._staticCreateServantNameBG):ComputePos()
    ;
    (GuildCreateManager._staticCreateServantNameTitle):ComputePos()
  end

  if myGuildListInfo ~= nil then
    local myGuildGrade = myGuildListInfo:getGuildGrade()
    local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
    if guildGrade == 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_ALREADYCLAN_ACK"))
      return 
    else
      if guildGrade == 1 then
        if myGuildGrade ~= 0 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_CURRENT_ACK"))
          return 
        end
        if not isGuildMaster then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_ONLYGUILDMASTER_ACK"))
          return 
        end
        if isGuildMaster and myGuildGrade == 0 then
          local myGuildName = myGuildListInfo:getName()
          ToClient_RequestRaisingGuildGrade(1, 100000)
        end
      end
    end
  else
    do
      if guildGrade == 0 then
        showInputGuildName()
      else
        if guildGrade == 1 then
          if playerLevel >= 1 then
            showInputGuildName()
          else
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOLEVEL_ACK"))
            return 
          end
        end
      end
    end
  end
end

handleClicked_GuildCreateApply = function()
  -- function num : 0_10 , upvalues : GuildCreateManager, CreateClan
  if (GuildCreateManager._editGuildNameInput):GetEditText() == "" then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_POPUP_ENTER_GUILDNAME"))
    ClearFocusEdit()
    return 
  end
  local self = CreateClan
  local isRaisingGuildGrade = false
  local guildGrade = 0
  local guildName = (GuildCreateManager._editGuildNameInput):GetEditText()
  local businessFunds = 100000
  if (self.selectedClan):IsCheck() then
    guildGrade = 0
  else
    if (self.selectedGuild):IsCheck() then
      guildGrade = 1
      local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
      if myGuildListInfo ~= nil then
        local myGuildGrade = myGuildListInfo:getGuildGrade()
        if myGuildGrade ~= 0 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOGUILD_NOUPGRADE_ACK"))
          ClearFocusEdit()
          return 
        end
        isRaisingGuildGrade = true
      end
    end
  end
  do
    if isRaisingGuildGrade == false then
      ToClient_RequestCreateGuild(guildName, guildGrade, businessFunds)
    else
      ToClient_RequestRaisingGuildGrade(guildGrade, businessFunds)
    end
    Panel_CreateGuild:SetShow(false)
    ClearFocusEdit()
    CreateClan_Close()
  end
end

handleClicked_GuildCreateCancel = function()
  -- function num : 0_11
  CreateClan_Close()
end

FGlobal_GuildCreateManagerPopup = function()
  -- function num : 0_12
  CreateClan_Open()
end

CreateClan_PressCreate = function()
  -- function num : 0_13 , upvalues : CreateClan
  local self = CreateClan
  if (self.selectedClan):IsCheck() then
    Guild_PopupCreate(0)
  else
    if (self.selectedGuild):IsCheck() then
      if ((getSelfPlayer()):get()):getLevel() < 1 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOLEVEL_ACK"))
        return 
      end
      Guild_PopupCreate(1)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_CLANORGUILD_SELECT_ACK"))
    end
  end
end

CreateClan_SelectGroupType = function()
  -- function num : 0_14 , upvalues : CreateClan
  local self = CreateClan
  local myGuildListInfo = (ToClient_GetMyGuildInfoWrapper())
  local title, desc = nil, nil
  if (self.selectedClan):IsCheck() then
    title = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDETITLE_CLAN")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDEDESC_CLAN")
  else
    if (self.selectedGuild):IsCheck() then
      title = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDETITLE_GUILD")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDEDESC_GUILD")
    end
  end
  ;
  (self.guideTitle):SetText(title)
  ;
  (self.guideDesc):SetText(desc)
  ;
  (self.guideMainBaseBG):SetSize((self.guideMainBaseBG):GetSizeX(), (self.guideDesc):GetTextSizeY() + (self.guideTitle):GetTextSizeY() + (self.createDescBG):GetSizeY() + (self.selectedClan):GetSizeY() + 100)
  ;
  (self.guideMainBG):SetSize((self.guideMainBG):GetSizeX(), (self.guideDesc):GetTextSizeY() + (self.guideTitle):GetTextSizeY() + 20)
  Panel_CreateClan:SetSize(Panel_CreateClan:GetSizeX(), (self.guideDesc):GetTextSizeY() + (self.guideTitle):GetTextSizeY() + (self.selectedClan):GetSizeY() + 260)
  ;
  (self.create):SetSpanSize(((self.create):GetSpanSize()).x, 20)
end

CreateClan_Open = function()
  -- function num : 0_15 , upvalues : CreateClan, UI_TM
  local self = CreateClan
  ;
  (self.selectedClan):SetCheck(true)
  ;
  (self.selectedGuild):SetCheck(false)
  ;
  (self.create):SetMonoTone(false)
  ;
  (self.selectedClan):SetMonoTone(false)
  ;
  (self.selectedGuild):SetMonoTone(false)
  ;
  (self.create):SetEnable(true)
  ;
  (self.selectedClan):SetEnable(true)
  ;
  (self.selectedGuild):SetEnable(true)
  if ToClient_CanMakeGuild() == false then
    (CreateClan.selectedGuild):SetEnable(false)
    ;
    (CreateClan.selectedGuild):SetMonoTone(true)
  end
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo ~= nil then
    local guildGrade = myGuildListInfo:getGuildGrade()
    local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
    if guildGrade ~= 0 then
      (self.selectedClan):SetMonoTone(true)
      ;
      (self.selectedClan):SetEnable(false)
      ;
      (self.selectedGuild):SetMonoTone(true)
      ;
      (self.selectedGuild):SetEnable(false)
      ;
      (self.create):SetMonoTone(true)
      ;
      (self.create):SetEnable(false)
    else
      if isGuildMaster then
        (self.selectedClan):SetCheck(false)
        ;
        (self.selectedClan):SetMonoTone(true)
        ;
        (self.selectedClan):SetEnable(false)
        ;
        (self.selectedGuild):SetCheck(true)
        ;
        (self.selectedGuild):SetMonoTone(false)
        ;
        (self.selectedGuild):SetEnable(true)
      else
        ;
        (self.selectedClan):SetCheck(true)
        ;
        (self.selectedClan):SetMonoTone(false)
        ;
        (self.selectedClan):SetEnable(true)
        ;
        (self.selectedGuild):SetCheck(false)
        ;
        (self.selectedGuild):SetMonoTone(false)
        ;
        (self.selectedGuild):SetEnable(true)
      end
    end
  end
  do
    local title = ""
    local desc = ""
    ;
    (self.guideDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
    if (self.selectedClan):IsCheck() then
      title = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDETITLE_CLAN")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDEDESC_CLAN")
    else
      title = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDETITLE_GUILD")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CREATECLAN_GUIDEDESC_GUILD")
    end
    ;
    (self.guideTitle):SetText(title)
    ;
    (self.guideDesc):SetText(desc)
    ;
    (self.guideMainBaseBG):SetSize((self.guideMainBaseBG):GetSizeX(), (self.guideDesc):GetTextSizeY() + (self.guideTitle):GetTextSizeY() + (self.createDescBG):GetSizeY() + (self.selectedClan):GetSizeY() + 100)
    ;
    (self.guideMainBG):SetSize((self.guideMainBG):GetSizeX(), (self.guideDesc):GetTextSizeY() + (self.guideTitle):GetTextSizeY() + 20)
    Panel_CreateClan:SetSize(Panel_CreateClan:GetSizeX(), (self.guideDesc):GetTextSizeY() + (self.guideTitle):GetTextSizeY() + (self.selectedClan):GetSizeY() + 260)
    ;
    (self.create):SetSpanSize(((self.create):GetSpanSize()).x, 20)
    Panel_CreateClan:SetShow(true)
  end
end

CreateClan_Close = function()
  -- function num : 0_16 , upvalues : IM
  Panel_CreateGuild:SetShow(false)
  Panel_CreateClan:SetShow(false)
  ClearFocusEdit()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

CreateClan.registEventHandler = function(self)
  -- function num : 0_17
  (self.selectedClan):addInputEvent("Mouse_LUp", "CreateClan_SelectGroupType()")
  ;
  (self.selectedGuild):addInputEvent("Mouse_LUp", "CreateClan_SelectGroupType()")
  ;
  (self.create):addInputEvent("Mouse_LUp", "CreateClan_PressCreate()")
  ;
  (self.close):addInputEvent("Mouse_LUp", "CreateClan_Close()")
  ;
  (self.help):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelClan\" )")
  ;
  (self.help):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelClan\", \"true\")")
  ;
  (self.help):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelClan\", \"false\")")
  registerEvent("onScreenResize", "FromClient_CreateGuild_onScreenResize")
end

CreateClan.registMessageHandler = function(self)
  -- function num : 0_18
end

GuildTotClan_Convert = function()
  -- function num : 0_19
end

HandleClicked_GuildTotClanClose = function()
  -- function num : 0_20
  Panel_ClanToGuild:SetShow(false, false)
end

FGlobal_GuildTotClanOpen = function()
  -- function num : 0_21
  Panel_ClanToGuild:SetShow(true, true)
end

FGlobal_GuildTotClanClose = function()
  -- function num : 0_22
  Panel_ClanToGuild:SetShow(false, false)
end

ClanToGuild.registEventHandler = function(self)
  -- function num : 0_23
  (self.convert):addInputEvent("Mouse_LUp", "GuildTotClan_Convert()")
  ;
  (self.help):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelClan\" )")
  ;
  (self.help):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelClan\", \"true\")")
  ;
  (self.help):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelClan\", \"false\")")
  ;
  (self.close):addInputEvent("Mouse_LUp", "HandleClicked_GuildTotClanClose()")
end

ClanToGuild.registMessageHandler = function(self)
  -- function num : 0_24
end

Guild_CreateGuild = function()
  -- function num : 0_25
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local myGuildGrade = myGuildListInfo:getGuildGrade()
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  if isGuildMaster and myGuildGrade == 0 then
    local strTemp1 = PAGetString(Defines.StringSheet_GAME, "LUA_CREATE_GUILD_MESSAGEBOX_TITLE")
    local strTemp2 = PAGetString(Defines.StringSheet_GAME, "LUA_CREATE_GUILD_MESSAGEBOX_MESSAGE")
    local messageboxData = {title = strTemp1, content = strTemp2, functionYes = Guild_CreateGuild_ConfirmFromMessageBox, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      if not isGuildMaster then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_ALREADY_JOIN_CLAN_OR_GUILD"))
        return 
      else
        if myGuildGrade == 1 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_NOMORE_UPGRADE"))
          return 
        end
      end
    end
  end
end

Guild_CreateGuild_ConfirmFromMessageBox = function()
  -- function num : 0_26
  local guildGrade = 1
  local businessFunds = 300000
  ToClient_RequestRaisingGuildGrade(guildGrade, businessFunds)
  Panel_CreateGuild:SetShow(false)
  CreateClan_Close()
end

FromClient_CreateGuild_onScreenResize = function()
  -- function num : 0_27
  local createClanPosY = (getScreenSizeY() - Panel_Npc_Dialog:GetSizeY()) / 2 - Panel_CreateClan:GetSizeY() / 2
  if createClanPosY < -10 then
    createClanPosY = 0
  end
  Panel_CreateClan:SetPosY(createClanPosY)
end

GuildCreateManager:initialize()
CreateClan:initialize()
CreateClan:registEventHandler()
CreateClan:registMessageHandler()
ClanToGuild:registEventHandler()
ClanToGuild:registMessageHandler()

