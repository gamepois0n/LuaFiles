-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guild.luac 

-- params : ...
-- function num : 0
local CT2S = CppEnums.ClassType2String
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local IM = CppEnums.EProcessorInputMode
local UI_VT = CppEnums.VehicleType
Panel_Window_Guild:SetShow(false)
Panel_Window_Guild:setMaskingChild(true)
Panel_Window_Guild:setGlassBackground(true)
Panel_Window_Guild:SetDragAll(true)
Panel_Window_Guild:RegisterShowEventFunc(true, "guild_ShowAni()")
Panel_Window_Guild:RegisterShowEventFunc(false, "guild_HideAni()")
local isProtectGuildMember = ToClient_IsContentsGroupOpen("52")
local isContentsGuildDuel = ToClient_IsContentsGroupOpen("69")
local isContentsGuildInfo = ToClient_IsContentsGroupOpen("206")
local isContentsArsha = ToClient_IsContentsGroupOpen("227")
local isContentsGuildHouse = ToClient_IsContentsGroupOpen("36")
local isCanDoReservation = ToClient_IsCanDoReservationArsha()
local isGuildBattle = isGameServiceTypeDev()
local lifeType = {[0] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_GATHERING"), [1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_FISHING"), [2] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_HUNTING"), [3] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_COOKING"), [4] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_ALCHEMY"), [5] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_PROCESSING"), [6] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_OBEDIENCE"), [7] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TRADE"), [8] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_GROWTH"), [9] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_WEALTH"), [10] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_COMBAT")}
local tabNumber = 99
local btn_GuildMasterMandateBG = (UI.getChildControl)(Panel_Window_Guild, "Static_GuildMandateBG")
local btn_GuildMasterMandate = (UI.getChildControl)(Panel_Window_Guild, "Button_GuildMandate")
local notice_title = (UI.getChildControl)(Panel_Window_Guild, "StaticText_NoticeTitle")
local notice_edit = (UI.getChildControl)(Panel_Window_Guild, "Edit_Notice")
local notice_btn = (UI.getChildControl)(Panel_Window_Guild, "Button_Notice")
local introduce_btn = (UI.getChildControl)(Panel_Window_Guild, "Button_Introduce")
local introduce_Reset = (UI.getChildControl)(Panel_Window_Guild, "Button_IntroReset")
local introduce_edit = (UI.getChildControl)(Panel_Window_Guild, "MultilineEdit_Introduce")
local introduce_edit_TW = (UI.getChildControl)(Panel_Window_Guild, "MultilineEdit_Introduce_TW")
local checkPopUp = (UI.getChildControl)(Panel_Window_Guild, "CheckButton_PopUp")
local _urlCache = ""
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
checkPopUp:SetShow(isPopUpContentsEnable)
guild_ShowAni = function()
  -- function num : 0_0
  Panel_Window_Guild:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Window_Guild, 0, 0.3)
end

guild_HideAni = function()
  -- function num : 0_1
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_Window_Guild, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

local constCreateWarInfoCount = 4
local keyUseCheck = true
local guildCommentsWebUrl = nil
local GuildInfoPage = {}
GuildInfoPage.initialize = function(self)
  -- function num : 0_2 , upvalues : UI_TM, isContentsGuildInfo, isProtectGuildMember, isContentsArsha, isCanDoReservation, isContentsGuildHouse, btn_GuildMasterMandate, btn_GuildMasterMandateBG, checkPopUp
  self._guildMainBG = (UI.getChildControl)(Panel_Window_Guild, "Static_Menu_BG_0")
  self._windowTitle = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Title")
  self._textGuildInfoTitle = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Title_Info")
  self._txtGuildName = (UI.getChildControl)(Panel_Window_Guild, "StaticText_GuildName")
  self._iconOccupyTerritory = (UI.getChildControl)(Panel_Window_Guild, "Static_GuildIcon_BG")
  self._iconGuildMark = (UI.getChildControl)(Panel_Window_Guild, "Static_Guild_Icon")
  self._txtMaster = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Master")
  self._txtRGuildName = (UI.getChildControl)(Panel_Window_Guild, "StaticText_R_GuildName")
  self._txtRMaster = (UI.getChildControl)(Panel_Window_Guild, "StaticText_R_Master")
  self._txtRRank_Title = (UI.getChildControl)(Panel_Window_Guild, "StaticText_GuildRank")
  self._txtRRank = (UI.getChildControl)(Panel_Window_Guild, "StaticText_GuildRank_Value")
  self._txtUnpaidTax = (UI.getChildControl)(Panel_Window_Guild, "StaticText_UnpaidTax")
  self._btnGuildDel = (UI.getChildControl)(Panel_Window_Guild, "Button_GuildDispersal")
  self._btnChangeMark = (UI.getChildControl)(Panel_Window_Guild, "Button_GuildMark")
  self._btnIncreaseMember = (UI.getChildControl)(Panel_Window_Guild, "Button_IncreaseMember")
  self._btnTaxPayment = (UI.getChildControl)(Panel_Window_Guild, "Button_TaxPayment")
  self._txtGuildPoint = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Point")
  self._txtGuildPointValue = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Point_Value")
  self._txtGuildPointPercent = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Point_Percent")
  self._txtGuildMpValue = (UI.getChildControl)(Panel_Window_Guild, "StaticText_GuildMp_Value")
  self._txtGuildMpPercent = (UI.getChildControl)(Panel_Window_Guild, "StaticText_GuildMp_Percent")
  self._progressMpPoint = (UI.getChildControl)(Panel_Window_Guild, "Progress2_GuildMp")
  self._guildIntroduce_Title = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Title_GuildIntroduce")
  self._guildIntroduce_BG = (UI.getChildControl)(Panel_Window_Guild, "Static_GuildIntroduce_BG")
  self._guildBbs_Title = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Title_Bbs")
  self._guildBbs_BG = (UI.getChildControl)(Panel_Window_Guild, "Static_GuildBbs_BG")
  self._planning = (UI.getChildControl)(Panel_Window_Guild, "StaticText_1")
  ;
  (self._planning):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TODAY_COMMENT"))
  self._txtProtect = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Protect")
  self._txtProtectValue = (UI.getChildControl)(Panel_Window_Guild, "StaticText_ProtectValue")
  self._btnProtectAdd = (UI.getChildControl)(Panel_Window_Guild, "Button_ProtectAdd")
  self._txtGuildMoneyTitle = (UI.getChildControl)(Panel_Window_Guild, "StaticText_GuildMoneyTitle")
  self._txtGuildMoney = (UI.getChildControl)(Panel_Window_Guild, "StaticText_GuildMoneyValue")
  self._txtGuildTerritoryTitle = (UI.getChildControl)(Panel_Window_Guild, "StaticText_TerritoryArea")
  self._txtGuildTerritoryValue = (UI.getChildControl)(Panel_Window_Guild, "StaticText_TerritoryAreaValue")
  ;
  (self._txtGuildTerritoryValue):SetTextMode(UI_TM.eTextMode_LimitText)
  self._txtGuildServantTitle = (UI.getChildControl)(Panel_Window_Guild, "StaticText_GuildServant")
  self._txtGuildServantValue = (UI.getChildControl)(Panel_Window_Guild, "StaticText_GuildServantValue")
  ;
  (self._txtGuildServantValue):SetTextMode(UI_TM.eTextMode_LimitText)
  self._btnGuildWebInfo = (UI.getChildControl)(Panel_Window_Guild, "Button_GuildInfo_Web")
  self._btnGuildWarehouse = (UI.getChildControl)(Panel_Window_Guild, "Button_GuildInfo_Warehouse")
  self._btnGetArshaHost = (UI.getChildControl)(Panel_Window_Guild, "Button_GetArshaHost")
  if not isContentsGuildInfo then
    (self._btnGuildWebInfo):SetShow(false)
  end
  if ToClient_IsConferenceMode() then
    (self._btnGuildWebInfo):SetIgnore(true)
    ;
    (self._btnGuildWebInfo):SetMonoTone(true)
  end
  if not isProtectGuildMember then
    (self._btnProtectAdd):SetShow(false)
  end
  if isContentsArsha == false or isCanDoReservation == false then
    (self._btnGetArshaHost):SetShow(false)
  end
  if not isContentsGuildHouse then
    (self._btnGuildWarehouse):SetShow(false)
  end
  self.SetShow = function(self, isShow)
    -- function num : 0_2_0
  end

  self.GetShow = function(self)
    -- function num : 0_2_1
    return (self._btnGuildDel):GetShow()
  end

  if isGameTypeEnglish() then
    (self._txtGuildName):SetShow(false)
    ;
    (self._txtMaster):SetShow(false)
  else
    ;
    (self._txtGuildName):SetShow(false)
    ;
    (self._txtMaster):SetShow(false)
  end
  self:SetShow(false)
  ;
  (self._btnGuildDel):addInputEvent("Mouse_LUp", "HandleClickedGuildDel()")
  ;
  (self._btnChangeMark):addInputEvent("Mouse_LUp", "HandleClickedChangeMark()")
  ;
  (self._btnTaxPayment):addInputEvent("Mouse_LUp", "HandleClicked_TaxPayment()")
  ;
  (self._btnIncreaseMember):addInputEvent("Mouse_LUp", "HandleClickedIncreaseMember()")
  ;
  (self._btnIncreaseMember):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 6, true )")
  ;
  (self._btnIncreaseMember):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 6, false )")
  ;
  (self._btnProtectAdd):addInputEvent("Mouse_LUp", "HandleClickedIncreaseProtectMember()")
  ;
  (self._btnProtectAdd):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 8, true )")
  ;
  (self._btnProtectAdd):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 8, false )")
  ;
  (self._btnChangeMark):addInputEvent("Mouse_On", "GuildSimplTooltips(true, 2)")
  ;
  (self._btnChangeMark):addInputEvent("Mouse_Out", "GuildSimplTooltips(false, 2)")
  ;
  (self._btnGuildDel):addInputEvent("Mouse_On", "GuildSimplTooltips(true, 3)")
  ;
  (self._btnGuildDel):addInputEvent("Mouse_Out", "GuildSimplTooltips(false, 3)")
  ;
  (self._btnGuildWebInfo):addInputEvent("Mouse_LUp", "FGlobal_GuildWebInfoFromGuildMain_Open()")
  ;
  (self._btnGuildWebInfo):addInputEvent("Mouse_On", "GuildSimplTooltips( true, 6 )")
  ;
  (self._btnGuildWebInfo):addInputEvent("Mouse_Out", "GuildSimplTooltips( false, 6 )")
  ;
  (self._btnGuildWarehouse):addInputEvent("Mouse_LUp", "GuildWarehouseOpen()")
  ;
  (self._btnGuildWarehouse):addInputEvent("Mouse_On", "GuildSimplTooltips( true, 7 )")
  ;
  (self._btnGuildWarehouse):addInputEvent("Mouse_Out", "GuildSimplTooltips( false, 7 )")
  if isContentsArsha == true and isCanDoReservation == true then
    (self._btnGetArshaHost):addInputEvent("Mouse_LUp", "HandleClickedGetArshaHost()")
    ;
    (self._btnGetArshaHost):addInputEvent("Mouse_On", "GuildSimplTooltips( true, 8 )")
    ;
    (self._btnGetArshaHost):addInputEvent("Mouse_Out", "GuildSimplTooltips( false, 8 )")
  end
  btn_GuildMasterMandate:addInputEvent("Mouse_On", "GuildSimplTooltips( true, 0 )")
  btn_GuildMasterMandate:addInputEvent("Mouse_Out", "GuildSimplTooltips( false, 0 )")
  btn_GuildMasterMandateBG:addInputEvent("Mouse_On", "GuildSimplTooltips( true, 1 )")
  btn_GuildMasterMandateBG:addInputEvent("Mouse_Out", "GuildSimplTooltips( false, 1 )")
  checkPopUp:addInputEvent("Mouse_LUp", "HandleClickedGuild_PopUp()")
  checkPopUp:addInputEvent("Mouse_On", "Guild_PopUp_ShowIconToolTip( true )")
  checkPopUp:addInputEvent("Mouse_Out", "Guild_PopUp_ShowIconToolTip( false )")
  if not isGameTypeEnglish() then
    (self._txtRGuildName):addInputEvent("Mouse_On", "GuildSimplTooltips( true, 4 )")
    ;
    (self._txtRGuildName):addInputEvent("Mouse_Out", "GuildSimplTooltips( false, 4 )")
    ;
    (self._txtRMaster):addInputEvent("Mouse_On", "GuildSimplTooltips( true, 5 )")
    ;
    (self._txtRMaster):addInputEvent("Mouse_Out", "GuildSimplTooltips( false, 5 )")
    ;
    (self._txtRGuildName):setTooltipEventRegistFunc("GuildSimplTooltips( true, 4 )")
    ;
    (self._txtRMaster):setTooltipEventRegistFunc("GuildSimplTooltips( true, 5 )")
    ;
    (self._txtRGuildName):SetIgnore(false)
    ;
    (self._txtRMaster):SetIgnore(false)
  else
    ;
    (self._txtRGuildName):SetIgnore(true)
    ;
    (self._txtRMaster):SetIgnore(true)
  end
  btn_GuildMasterMandate:setTooltipEventRegistFunc("GuildSimplTooltips( true, 0 )")
  btn_GuildMasterMandateBG:setTooltipEventRegistFunc("GuildSimplTooltips( true, 1 )")
  ;
  (self._btnChangeMark):setTooltipEventRegistFunc("GuildSimplTooltips( true, 2 )")
  ;
  (self._btnGuildDel):setTooltipEventRegistFunc("GuildSimplTooltips( true, 3 )")
  ;
  (self._btnIncreaseMember):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 6, true )")
  ;
  (self._btnProtectAdd):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 8, true )")
end

local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_Window_Guild, "WebControl_EventNotify_WebLink")
_Web:SetShow(true)
_Web:SetPosX(410)
_Web:SetPosY(430)
_Web:SetSize(323, 272)
_Web:ResetUrl()
Panel_Window_Guild:SetChildIndex(_Web, 9999)
local HandleClickedGuildDelContinue = function()
  -- function num : 0_3
  ToClient_RequestDestroyGuild()
  HandleClickedGuildHideButton()
end

local HandleClickedGuildLeaveContinue = function()
  -- function num : 0_4
  ToClient_RequestDisjoinGuild()
  HandleClickedGuildHideButton()
end

HandleClickedGuild_PopUp = function()
  -- function num : 0_5 , upvalues : checkPopUp
  if checkPopUp:IsCheck() then
    Panel_Window_Guild:OpenUISubApp()
  else
    Panel_Window_Guild:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

HandleClickedGuildDel = function()
  -- function num : 0_6 , upvalues : HandleClickedGuildDelContinue, UCT, HandleClickedGuildLeaveContinue
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    _PA_ASSERT(false, "ResponseGuildInviteForGuildGrade 에서 길드 정보�\128 없습니다.")
    return 
  end
  local guildGrade = (myGuildInfo:getGuildGrade())
  local messageboxData = nil
  if ((getSelfPlayer()):get()):isGuildMaster() == true then
    if myGuildInfo:getMemberCount() <= 1 then
      messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD_ASK"), functionYes = HandleClickedGuildDelContinue, functionNo = MessageBox_Empty_function, priority = UCT.PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_CANT_DISPERSE"))
    end
  else
    local tempText = nil
    if guildGrade == 0 then
      tempText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLANLIST_CLANOUT_ASK")
    else
      tempText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD_ASK") .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MENTINFO")
    end
    messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD"), content = tempText, functionYes = HandleClickedGuildLeaveContinue, functionNo = MessageBox_Empty_function, priority = UCT.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
end

HandleClickedChangeMark = function()
  -- function num : 0_7 , upvalues : UCT
  messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ADDMARK_MESSAGEBOX_TITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ADDMARK_MESSAGEBOX_TEXT"), functionYes = HandleClickedChangeMark_Continue, functionNo = MessageBox_Empty_function, priority = UCT.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
end

HandleClickedChangeMark_Continue = function()
  -- function num : 0_8
  guildMarkUpdate()
end

HandleClickedOpenSiegeGate = function()
  -- function num : 0_9
  ToClient_RequestOpenSiegeGate()
end

HandleClicked_TaxPayment = function()
  -- function num : 0_10 , upvalues : UCT
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local taxValue = Int64toInt32(myGuildInfo:getAccumulateTax())
  local costValue = Int64toInt32(myGuildInfo:getAccumulateGuildHouseCost())
  if taxValue > 0 then
    local msgBox_Title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_GUILDLAWTAX")
    local msgBox_Content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_GUILDLAWTAX_ASK", "taxValue", taxValue)
    messageboxData = {title = msgBox_Title, content = msgBox_Content, functionYes = Guild_DoTaxPayment, functionNo = MessageBox_Empty_function, priority = UCT.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData, "middle")
  else
    do
      if costValue > 0 then
        local msgBox_Title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_HOUSECOSTS_PAY")
        local msgBox_Content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_HOUSECOSTS_PAY_ASK", "taxValue", costValue)
        messageboxData = {title = msgBox_Title, content = msgBox_Content, functionYes = Guild_DoGuildHouseCost, functionNo = MessageBox_Empty_function, priority = UCT.PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData, "middle")
      else
        do
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UNPAID_CONFIRM"))
          do return  end
        end
      end
    end
  end
end

Guild_DoTaxPayment = function()
  -- function num : 0_11
  ToClient_PayComporateTax()
end

Guild_DoGuildHouseCost = function()
  -- function num : 0_12
  ToClient_PayGuildHouseCost()
end

HandleClickedIncreaseMember = function()
  -- function num : 0_13
  local skillPointInfo = getSkillPointInfo(3)
  if skillPointInfo._remainPoint < 2 then
    local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NEED_GUILDSKILLPOINT") .. tostring(skillPointInfo._remainPoint) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_EXPAND_POINT_LACK")
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_EXPAND_MAX_COUNT"), content = messageContent, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_EXPAND_MAX_COUNT_EXECUTE") .. tostring(skillPointInfo._remainPoint)
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_EXPAND_MAX_COUNT"), content = messageContent, functionYes = Guild_IncreaseMember_Confirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData, "top")
    end
  end
end

Guild_IncreaseMember_Confirm = function()
  -- function num : 0_14
  ToClient_RequestVaryJoinableGuildMemeberCount()
end

HandleClickedIncreaseProtectMember = function()
  -- function num : 0_15
  local skillPointInfo = getSkillPointInfo(3)
  if skillPointInfo._remainPoint < 3 then
    local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PROTECTADD_MOREPOINT") .. tostring(skillPointInfo._remainPoint) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_EXPAND_POINT_LACK")
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PROTECTADD_TITLE"), content = messageContent, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PROTECTADD_POINT") .. tostring(skillPointInfo._remainPoint)
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PROTECTADD_TITLE"), content = messageContent, functionYes = Guild_IncreaseProtectMember_Confirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData, "top")
    end
  end
end

Guild_IncreaseProtectMember_Confirm = function()
  -- function num : 0_16
  ToClient_RequestVaryProtectGuildMemeberCount()
end

GuildWarehouseOpen = function()
  -- function num : 0_17
  warehouse_requestGuildWarehouseInfo()
end

local maxGuildMp = 1500
GuildInfoPage.UpdateData = function(self)
  -- function num : 0_18 , upvalues : maxGuildMp, UI_VT, GuildInfoPage
  SetDATAByGuildGrade()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo ~= nil then
    local guildRank = myGuildInfo:getMemberCountLevel()
    local guildRankString = ""
    if guildRank == 1 then
      guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_SMALL")
    else
      if guildRank == 2 then
        guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_MIDDLE")
      else
        if guildRank == 3 then
          guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIG")
        else
          if guildRank == 4 then
            guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIGGEST")
          end
        end
      end
    end
    local skillPointInfo = getSkillPointInfo(3)
    local skillPointPercent = (string.format)("%.0f", skillPointInfo._currentExp / skillPointInfo._nextLevelExp * 100)
    if tonumber(skillPointPercent) > 100 then
      skillPointPercent = 100
    end
    ;
    (self._txtRGuildName):SetText(myGuildInfo:getName())
    ;
    (self._txtRRank):SetText(guildRankString .. "(" .. myGuildInfo:getMemberCount() .. "/" .. myGuildInfo:getJoinableMemberCount() .. ")")
    ;
    (self._txtRRank):SetSpanSize(((self._txtRRank_Title):GetSpanSize()).x + (self._txtRRank_Title):GetTextSizeX() + 10, ((self._txtRRank):GetSpanSize()).y)
    ;
    (self._btnIncreaseMember):SetPosX((self._txtRRank):GetPosX() + (self._txtRRank):GetTextSizeX() + 50)
    ;
    (self._txtRMaster):SetText(myGuildInfo:getGuildMasterName())
    ;
    (self._txtProtectValue):SetText(myGuildInfo:getProtectGuildMemberCount() .. "/" .. myGuildInfo:getAvaiableProtectGuildMemberCount())
    ;
    (self._txtProtectValue):SetSpanSize(((self._txtProtect):GetSpanSize()).x + (self._txtProtect):GetTextSizeX(), ((self._txtProtectValue):GetSpanSize()).y)
    ;
    (self._btnProtectAdd):SetPosX((self._txtProtectValue):GetPosX() + (self._txtProtectValue):GetTextSizeX() + 50)
    ;
    (self._txtGuildPointValue):SetText(tostring(skillPointInfo._remainPoint) .. "/" .. tostring(skillPointInfo._acquirePoint - 1))
    ;
    (self._txtGuildPointPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_SKILLPOINTPERCENT_SUBTITLE", "skillPointPercent", skillPointPercent))
    ;
    (self._txtGuildPointPercent):SetSpanSize(((self._txtGuildPointValue):GetSpanSize()).x + (self._txtGuildPointValue):GetTextSizeX() + 25, ((self._txtGuildPointPercent):GetSpanSize()).y)
    ;
    (self._txtGuildPointValue):SetSpanSize(((self._txtGuildPoint):GetSpanSize()).x + (self._txtGuildPoint):GetTextSizeX(), ((self._txtGuildPointValue):GetSpanSize()).y)
    ;
    (self._txtGuildPointPercent):SetSpanSize(((self._txtGuildPointValue):GetSpanSize()).x + (self._txtGuildPointValue):GetTextSizeX() + 20, ((self._txtGuildPointPercent):GetSpanSize()).y)
    local currentGuildMp = myGuildInfo:getGuildMp()
    ;
    (self._txtGuildMpValue):SetText(currentGuildMp)
    local guildMpGrade = ""
    if currentGuildMp < 300 then
      guildMpGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GULDGRADE_1")
    else
      if currentGuildMp >= 300 and currentGuildMp < 600 then
        guildMpGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GULDGRADE_2")
      else
        if currentGuildMp >= 600 and currentGuildMp < 900 then
          guildMpGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GULDGRADE_3")
        else
          if currentGuildMp >= 900 and currentGuildMp < 1200 then
            guildMpGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GULDGRADE_4")
          else
            if currentGuildMp >= 1200 and currentGuildMp < 1500 then
              guildMpGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GULDGRADE_5")
            else
              if currentGuildMp >= 1500 then
                guildMpGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GULDGRADE_6")
              end
            end
          end
        end
      end
    end
    ;
    (self._txtGuildMpPercent):SetText(guildMpGrade)
    if currentGuildMp < 0 then
      currentGuildMp = 0
    end
    ;
    (self._progressMpPoint):SetProgressRate(currentGuildMp / maxGuildMp * 100)
    local getGuildMoney = myGuildInfo:getGuildBusinessFunds_s64()
    ;
    (self._txtGuildMoney):SetText(makeDotMoney(getGuildMoney))
    ;
    (self._txtGuildMoney):SetSpanSize(((self._txtGuildMoneyTitle):GetSpanSize()).x + (self._txtGuildMoneyTitle):GetTextSizeX() + 10, ((self._txtGuildMoney):GetSpanSize()).y)
    ;
    (self._txtGuildTerritoryValue):SetText("-")
    ;
    (self._txtGuildTerritoryValue):SetSpanSize(((self._txtGuildTerritoryTitle):GetSpanSize()).x + (self._txtGuildTerritoryTitle):GetTextSizeX() + 10, ((self._txtGuildTerritoryValue):GetSpanSize()).y)
    ;
    (self._txtGuildServantValue):SetText("-")
    ;
    (self._txtGuildServantValue):SetSpanSize(((self._txtGuildServantTitle):GetSpanSize()).x + (self._txtGuildServantTitle):GetTextSizeX() + 10, ((self._txtGuildServantValue):GetSpanSize()).y)
    local guildArea1 = ""
    local territoryKey = ""
    local territoryWarName = ""
    if myGuildInfo:getTerritoryCount() > 0 then
      for idx = 0, myGuildInfo:getTerritoryCount() - 1 do
        territoryKey = myGuildInfo:getTerritoryKeyAt(idx)
        if territoryKey >= 0 then
          local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(territoryKey)
          if territoryInfoWrapper ~= nil then
            guildArea1 = territoryInfoWrapper:getTerritoryName()
            local territoryComma = ", "
            if territoryWarName == "" then
              territoryComma = ""
            end
            territoryWarName = territoryWarName .. territoryComma .. guildArea1
          end
          do
            do
              ;
              (self._txtGuildTerritoryValue):SetText(territoryWarName)
              -- DECOMPILER ERROR at PC398: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC398: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC398: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    local guildArea2 = ""
    local regionKey = ""
    local siegeWarName = ""
    if myGuildInfo:getSiegeCount() > 0 then
      for idx = 0, myGuildInfo:getSiegeCount() - 1 do
        regionKey = myGuildInfo:getSiegeKeyAt(idx)
        if regionKey > 0 then
          local regionInfoWrapper = getRegionInfoWrapper(regionKey)
          if regionInfoWrapper ~= nil then
            guildArea2 = regionInfoWrapper:getAreaName()
            local siegeComma = ", "
            if siegeWarName == "" then
              siegeComma = ""
            end
            siegeWarName = siegeWarName .. siegeComma .. guildArea2
          end
          do
            do
              ;
              (self._txtGuildTerritoryValue):SetText(siegeWarName)
              -- DECOMPILER ERROR at PC438: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC438: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC438: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    if (self._txtGuildTerritoryValue):GetTextSizeX() + 30 < (self._txtGuildTerritoryValue):GetSizeX() then
      (self._txtGuildTerritoryValue):SetIgnore(true)
    else
      ;
      (self._txtGuildTerritoryValue):SetIgnore(false)
    end
    ;
    (self._txtGuildTerritoryValue):addInputEvent("Mouse_On", "HandleClicked_TerritoryNameOnEvent( true )")
    ;
    (self._txtGuildTerritoryValue):addInputEvent("Mouse_Out", "HandleClicked_TerritoryNameOnEvent( false )")
    local guildServantElephantCount = guildStable_getServantCount(UI_VT.Type_Elephant)
    local guildServantShipCount = guildStable_getServantCount(UI_VT.Type_SailingBoat)
    local guilServantValueCount = ""
    if guildServantElephantCount > 0 then
      guilServantValueCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_SERVANTCOUNT_ELEPHANT_ONLY", "guildServantElephantCount", guildServantElephantCount)
    end
    if guildServantShipCount > 0 then
      if guildServantElephantCount > 0 then
        guilServantValueCount = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_SERVANTCOUNT_GUILDVEHICLE_BOTH", "guilServantValueCount", guilServantValueCount, "guildServantShipCount", guildServantShipCount)
      else
        guilServantValueCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_SERVANTCOUNT_SAILBOAT_ONLY", "guildServantShipCount", guildServantShipCount)
      end
    end
    ;
    (self._txtGuildServantValue):SetText(guilServantValueCount)
    if (self._txtGuildServantValue):GetTextSizeX() + 30 < (self._txtGuildServantValue):GetSizeX() then
      (self._txtGuildServantValue):SetIgnore(true)
    else
      ;
      (self._txtGuildServantValue):SetIgnore(false)
    end
    ;
    (self._txtGuildServantValue):addInputEvent("Mouse_On", "HandleClicked_GuildServantCountOnEvent( true )")
    ;
    (self._txtGuildServantValue):addInputEvent("Mouse_Out", "HandleClicked_GuildServantCountOnEvent( false )")
    if toInt64(0, 0) < myGuildInfo:getAccumulateTax() then
      (self._txtUnpaidTax):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UNPAIDTAX", "getAccumulateTax", tostring(myGuildInfo:getAccumulateTax())))
    else
      if toInt64(0, 0) < myGuildInfo:getAccumulateGuildHouseCost() then
        (self._txtUnpaidTax):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UNPAIDTAX_HOUSE", "getAccumulateGuildHouseCost", tostring(myGuildInfo:getAccumulateGuildHouseCost())))
      end
    end
    local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
    if isGuildMaster == true then
      self:SetShow(true)
      if myGuildInfo:getGuildGrade() == 0 then
        local skillPointInfo = getSkillPointInfo(3)
        do
          local isEnable = ToClient_GetGuildSkillPointPerIncreaseMember() <= skillPointInfo._remainPoint
          ;
          (self._btnIncreaseMember):SetMonoTone(not isEnable)
          self:SetShow(false)
          if myGuildInfo:getGuildGrade() == 0 then
            do
              do
                local isSet = setGuildTextureByGuildNo(myGuildInfo:getGuildNo_s64(), GuildInfoPage._iconGuildMark)
                if isSet == false then
                  (GuildInfoPage._iconGuildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(GuildInfoPage._iconGuildMark, 183, 1, 188, 6)
                  ;
                  ((GuildInfoPage._iconGuildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (GuildInfoPage._iconGuildMark):setRenderTexture((GuildInfoPage._iconGuildMark):getBaseTexture())
                else
                  ((GuildInfoPage._iconGuildMark):getBaseTexture()):setUV(0, 0, 1, 1)
                  ;
                  (GuildInfoPage._iconGuildMark):setRenderTexture((GuildInfoPage._iconGuildMark):getBaseTexture())
                end
                HandleClickedGuildHideButton()
                -- DECOMPILER ERROR: 6 unprocessed JMP targets
              end
            end
          end
        end
      end
    end
  end
end

local GuildLetsWarPage = {}
GuildLetsWarPage.initialize = function(self)
  -- function num : 0_19 , upvalues : UI_TM
  self._letsWarBG = (UI.getChildControl)(Panel_Guild_Declaration, "Static_Menu_BG_2")
  self._txtLetsWarTitle = (UI.getChildControl)(Panel_Guild_Declaration, "StaticText_Title")
  self._btnLetsWarDoWar = (UI.getChildControl)(Panel_Guild_Declaration, "Button_LetsWar")
  self._editLetsWarInputName = (UI.getChildControl)(Panel_Guild_Declaration, "Edit_InputGuild")
  self._txtLetsWarHelp = (UI.getChildControl)(Panel_Guild_Declaration, "StaticText_WarDesc_help")
  self._btnCose = (UI.getChildControl)(Panel_Guild_Declaration, "Button_Close")
  self.SetShow = function(self, isShow)
    -- function num : 0_19_0
    (self._letsWarBG):SetShow(isShow)
    ;
    (self._btnLetsWarDoWar):SetShow(isShow)
    ;
    (self._editLetsWarInputName):SetShow(isShow)
    ;
    (self._txtLetsWarHelp):SetShow(isShow)
  end

  self.GetShow = function(self)
    -- function num : 0_19_1
    return (self._letsWarBG):GetShow()
  end

  self:SetShow(false)
  ;
  (self._txtLetsWarHelp):SetTextMode(UI_TM.eTextMode_AutoWrap)
  if (CppEnums.GuildWarType).GuildWarType_Normal == ToClient_GetGuildWarType() then
    (self._txtLetsWarHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_LETSWARHELP"))
  else
    if (CppEnums.GuildWarType).GuildWarType_Both == ToClient_GetGuildWarType() then
      (self._txtLetsWarHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_LETSWARHELP_JP"))
    else
      ;
      (self._txtLetsWarHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_LETSWARHELP"))
    end
  end
  Panel_Guild_Declaration:SetSize(Panel_Guild_Declaration:GetSizeX(), (self._txtLetsWarHelp):GetTextSizeY() + 10 + (self._txtLetsWarTitle):GetSizeY() + (self._btnLetsWarDoWar):GetSizeY() + 50)
  ;
  (self._letsWarBG):SetSize((self._letsWarBG):GetSizeX(), (self._txtLetsWarHelp):GetTextSizeY() + 50)
  ;
  (self._txtLetsWarHelp):SetSize((self._txtLetsWarHelp):GetSizeX(), (self._txtLetsWarHelp):GetTextSizeY() + 10)
  ;
  (self._btnLetsWarDoWar):addInputEvent("Mouse_LUp", "HandleClickedLetsWar()")
  ;
  (self._editLetsWarInputName):addInputEvent("Mouse_LUp", "HandleClickedLetsWarEditName()")
  ;
  (self._btnCose):addInputEvent("Mouse_LUp", "HandleClicked_LetsWarHide()")
  ;
  (self._editLetsWarInputName):RegistReturnKeyEvent("HandleClickedLetsWar()")
end

HandleClickedLetsWar = function()
  -- function num : 0_20 , upvalues : GuildLetsWarPage, IM
  local guildName = (GuildLetsWarPage._editLetsWarInputName):GetEditText()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local myGuildName = myGuildInfo:getName()
  local accumulateTax_s32 = Int64toInt32(myGuildInfo:getAccumulateTax())
  local accumulateCost_s32 = Int64toInt32(myGuildInfo:getAccumulateGuildHouseCost())
  local close_function = function()
    -- function num : 0_20_0 , upvalues : IM
    if AllowChangeInputMode() then
      if (UI.checkShowWindow)() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    else
      SetFocusChatting()
    end
  end

  if accumulateTax_s32 > 0 or accumulateCost_s32 > 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_TAXFIRST"))
    ClearFocusEdit()
    close_function()
    return 
  end
  if guildName == myGuildName then
    local messageboxData = {title = "", content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_LETSWARFAIL"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      if (CppEnums.GuildWarType).GuildWarType_Both == ToClient_GetGuildWarType() then
        local messageboxData = {title = "", content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DECLAREWAR_DECREASEMONEY"), functionYes = ConfirmDeclareGuildWar, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData, nil, nil)
      else
        do
          ConfirmDeclareGuildWar()
          ClearFocusEdit()
          close_function()
        end
      end
    end
  end
end

ConfirmDeclareGuildWar = function()
  -- function num : 0_21 , upvalues : GuildLetsWarPage
  local guildName = (GuildLetsWarPage._editLetsWarInputName):GetEditText()
  ToClient_RequestDeclareGuildWar(0, guildName, false)
  ;
  (GuildLetsWarPage._editLetsWarInputName):SetEditText("", true)
end

HandleClickedLetsWarEditName = function()
  -- function num : 0_22 , upvalues : IM, GuildLetsWarPage
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetFocusEdit(GuildLetsWarPage._editLetsWarInputName)
  ;
  (GuildLetsWarPage._editLetsWarInputName):SetEditText("", true)
end

FGlobal_CheckGuildLetsWarUiEdit = function(targetUI)
  -- function num : 0_23 , upvalues : GuildLetsWarPage
  do return targetUI ~= nil and targetUI:GetKey() == (GuildLetsWarPage._editLetsWarInputName):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_GuildLetsWarClearFocusEdit = function()
  -- function num : 0_24 , upvalues : GuildLetsWarPage, IM
  (GuildLetsWarPage._editLetsWarInputName):SetText("", true)
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWindow)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

GuildLetsWarPage.UpdateData = function(self)
  -- function num : 0_25
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  if isGuildMaster == true or isGuildSubMaster == true then
    self:SetShow(true)
  else
    self:SetShow(false)
  end
end

HandleClicked_LetsWarShow = function()
  -- function num : 0_26
  Panel_Guild_Declaration:SetShow(true)
end

HandleClicked_LetsWarHide = function()
  -- function num : 0_27
  Panel_Guild_Declaration:SetShow(false)
end

local GuildWarInfoPage = {
_list = {}
, 
_list2 = {}
, slotMaxCount = 4, _listCount = 0, _startIndex = 0}
GuildWarInfoPage.initialize = function(self)
  -- function num : 0_28 , upvalues : UCT, isContentsGuildDuel, constCreateWarInfoCount, UI_TM
  local constStartY = 450
  self._txtWarInfoTitle = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Title_WarInfo")
  self._static_WarInfoBG = (UI.getChildControl)(Panel_Window_Guild, "Static_Menu_BG_1")
  self._txtNoWar = (UI.getChildControl)(Panel_Window_Guild, "StaticText_NoWar")
  self._txtWarHelp = (UI.getChildControl)(Panel_Window_Guild, "StaticText_WarInfo_help")
  self._btnWarList1 = (UI.getChildControl)(Panel_Window_Guild, "RadioButton_WarList1")
  self._btnWarList2 = (UI.getChildControl)(Panel_Window_Guild, "RadioButton_WarList2")
  self._btnDeclaration = (UI.getChildControl)(Panel_Window_Guild, "Button_Declaration")
  self._scroll = (UI.getChildControl)(Panel_Window_Guild, "Scroll_DeclareGuildWar")
  local copyWarBG = (UI.getChildControl)(Panel_Window_Guild, "Static_C_WarBG")
  local copyGuildIconBG = (UI.getChildControl)(Panel_Window_Guild, "Static_C_EnemyGuild_IconBG")
  local copyGuildIcon = (UI.getChildControl)(Panel_Window_Guild, "Static_C_EnemyGuild_Icon")
  local copyGuildName = (UI.getChildControl)(Panel_Window_Guild, "StaticText_C_EnemyGuild_Name")
  local copyKill = (UI.getChildControl)(Panel_Window_Guild, "StaticText_C_Kill")
  local copyDeath = (UI.getChildControl)(Panel_Window_Guild, "StaticText_C_Death")
  local copyStopWar = (UI.getChildControl)(Panel_Window_Guild, "Button_C_WarStop")
  local copyShowbu = (UI.getChildControl)(Panel_Window_Guild, "Button_C_Showbu")
  local copyWarIcon = (UI.getChildControl)(Panel_Window_Guild, "Static_WarIcon")
  Panel_Window_Guild:RemoveControl(self._static_WarInfoBG)
  Panel_Window_Guild:RemoveControl(self._btnWarList1)
  Panel_Window_Guild:RemoveControl(self._btnWarList2)
  Panel_Window_Guild:RemoveControl(self._btnDeclaration)
  ;
  (self._txtWarInfoTitle):AddChild(self._static_WarInfoBG)
  ;
  (self._txtWarInfoTitle):AddChild(self._btnWarList1)
  ;
  (self._txtWarInfoTitle):AddChild(self._btnWarList2)
  ;
  (self._txtWarInfoTitle):AddChild(self._btnDeclaration)
  ;
  (self._static_WarInfoBG):SetSpanSize(0, (self._txtWarInfoTitle):GetSizeY() + 25)
  ;
  (self._static_WarInfoBG):ComputePos()
  if isGameTypeEnglish() then
    (self._btnWarList1):SetSize(100, 23)
    ;
    (self._btnWarList2):SetSize(100, 23)
    ;
    (self._btnDeclaration):SetSize(120, 23)
    ;
    (self._btnDeclaration):SetSpanSize(220, 22)
  else
    ;
    (self._btnWarList1):SetSize(70, 23)
    ;
    (self._btnWarList2):SetSize(70, 23)
    ;
    (self._btnDeclaration):SetSize(100, 23)
    ;
    (self._btnDeclaration):SetSpanSize(240, 22)
  end
  ;
  (self._btnWarList1):SetPosX(10)
  ;
  (self._btnWarList1):SetPosY(23)
  ;
  (self._btnWarList2):SetPosX((self._btnWarList1):GetPosX() + (self._btnWarList1):GetSizeX())
  ;
  (self._btnWarList2):SetPosY(23)
  ;
  (self._btnDeclaration):ComputePos()
  ;
  (self._static_WarInfoBG):AddChild(self._txtNoWar)
  ;
  (self._static_WarInfoBG):AddChild(self._txtWarHelp)
  ;
  (self._static_WarInfoBG):AddChild(self._scroll)
  Panel_Window_Guild:RemoveControl(self._txtNoWar)
  Panel_Window_Guild:RemoveControl(self._txtWarHelp)
  Panel_Window_Guild:RemoveControl(self._scroll)
  ;
  (self._txtNoWar):SetSpanSize(30, 120)
  ;
  (self._txtNoWar):ComputePos()
  ;
  (self._txtWarHelp):SetSpanSize(5, 230)
  ;
  (self._txtWarHelp):ComputePos()
  ;
  (self._scroll):ComputePos()
  ;
  (self._btnWarList1):addInputEvent("Mouse_LUp", "HandleClicked_WarInfoUpdate( " .. 1 .. " )")
  ;
  (self._btnWarList2):addInputEvent("Mouse_LUp", "HandleClicked_WarInfoUpdate( " .. 2 .. " )")
  ;
  (self._btnDeclaration):addInputEvent("Mouse_LUp", "HandleClicked_LetsWarShow()")
  ;
  (self._static_WarInfoBG):SetIgnore(false)
  ;
  (self._static_WarInfoBG):addInputEvent("Mouse_UpScroll", "GuildWarInfoPage_ScrollEvent( true )")
  ;
  (self._static_WarInfoBG):addInputEvent("Mouse_DownScroll", "GuildWarInfoPage_ScrollEvent( false )")
  createWarinfo = function(pIndex)
    -- function num : 0_28_0 , upvalues : UCT, self, copyWarBG, copyGuildIconBG, copyGuildIcon, copyGuildName, copyKill, copyDeath, copyStopWar, copyShowbu, copyWarIcon, isContentsGuildDuel
    local rtGuildWarInfo = {}
    rtGuildWarInfo._warBG = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self._static_WarInfoBG, "Static_WarBG_" .. pIndex)
    rtGuildWarInfo._guildIconBG = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, rtGuildWarInfo._warBG, "Static_GuildIconBG_" .. pIndex)
    rtGuildWarInfo._guildIcon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, rtGuildWarInfo._warBG, "Static_GuildIcon_" .. pIndex)
    rtGuildWarInfo._txtGuildName = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtGuildWarInfo._warBG, "StaticText_GuildName_" .. pIndex)
    rtGuildWarInfo._guildWarScore = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtGuildWarInfo._warBG, "StaticText_Kill_" .. pIndex)
    rtGuildWarInfo._guildShowbuScore = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtGuildWarInfo._warBG, "StaticText_Death_" .. pIndex)
    rtGuildWarInfo._txtStopWar = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, rtGuildWarInfo._warBG, "Button_WarStop_" .. pIndex)
    rtGuildWarInfo._txtShowbu = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, rtGuildWarInfo._warBG, "Button_Showbu_" .. pIndex)
    rtGuildWarInfo._WarIcon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, rtGuildWarInfo._warBG, "Static_WarIcon_" .. pIndex)
    rtGuildWarInfo._PenaltyType = 0
    CopyBaseProperty(copyWarBG, rtGuildWarInfo._warBG)
    CopyBaseProperty(copyGuildIconBG, rtGuildWarInfo._guildIconBG)
    CopyBaseProperty(copyGuildIcon, rtGuildWarInfo._guildIcon)
    CopyBaseProperty(copyGuildName, rtGuildWarInfo._txtGuildName)
    CopyBaseProperty(copyKill, rtGuildWarInfo._guildWarScore)
    CopyBaseProperty(copyDeath, rtGuildWarInfo._guildShowbuScore)
    CopyBaseProperty(copyStopWar, rtGuildWarInfo._txtStopWar)
    CopyBaseProperty(copyShowbu, rtGuildWarInfo._txtShowbu)
    CopyBaseProperty(copyWarIcon, rtGuildWarInfo._WarIcon)
    ;
    (rtGuildWarInfo._warBG):SetSize(315, (rtGuildWarInfo._warBG):GetSizeY())
    ;
    (rtGuildWarInfo._warBG):ComputePos()
    ;
    (rtGuildWarInfo._guildIconBG):ComputePos()
    ;
    (rtGuildWarInfo._guildIcon):ComputePos()
    ;
    (rtGuildWarInfo._txtGuildName):ComputePos()
    ;
    (rtGuildWarInfo._guildWarScore):ComputePos()
    ;
    (rtGuildWarInfo._guildShowbuScore):ComputePos()
    ;
    (rtGuildWarInfo._txtStopWar):ComputePos()
    ;
    (rtGuildWarInfo._txtShowbu):ComputePos()
    ;
    (rtGuildWarInfo._WarIcon):ComputePos()
    ;
    (rtGuildWarInfo._warBG):SetPosY(pIndex * 51 + 5)
    ;
    (rtGuildWarInfo._guildIconBG):SetPosY(pIndex + 4)
    ;
    (rtGuildWarInfo._guildIcon):SetPosY(pIndex + 5)
    ;
    (rtGuildWarInfo._txtGuildName):SetPosY(pIndex + 7)
    ;
    (rtGuildWarInfo._guildWarScore):SetPosY(pIndex + 25)
    ;
    (rtGuildWarInfo._guildShowbuScore):SetPosY(pIndex + 25)
    ;
    (rtGuildWarInfo._txtStopWar):SetPosY(pIndex + 5)
    ;
    (rtGuildWarInfo._WarIcon):SetPosY(pIndex + 6)
    ;
    (rtGuildWarInfo._txtStopWar):SetShow(false)
    ;
    (rtGuildWarInfo._txtShowbu):SetShow(false)
    rtGuildWarInfo.SetShow = function(self, isShow)
      -- function num : 0_28_0_0 , upvalues : rtGuildWarInfo, isContentsGuildDuel
      (rtGuildWarInfo._warBG):SetShow(isShow)
      ;
      (rtGuildWarInfo._guildIconBG):SetShow(isShow)
      ;
      (rtGuildWarInfo._guildIcon):SetShow(isShow)
      ;
      (rtGuildWarInfo._txtGuildName):SetShow(isShow)
      ;
      (rtGuildWarInfo._guildWarScore):SetShow(isShow)
      ;
      (rtGuildWarInfo._WarIcon):SetShow(isShow)
      ;
      (rtGuildWarInfo._txtStopWar):SetShow(isShow)
      if isContentsGuildDuel then
        (rtGuildWarInfo._txtShowbu):SetShow(isShow)
        ;
        (rtGuildWarInfo._guildShowbuScore):SetShow(isShow)
      end
    end

    rtGuildWarInfo.GetShow = function(self)
      -- function num : 0_28_0_1 , upvalues : rtGuildWarInfo
      return (rtGuildWarInfo._warBG):GetShow()
    end

    rtGuildWarInfo.SetData = function(self, pWarringGuild, gIdx)
      -- function num : 0_28_0_2 , upvalues : rtGuildWarInfo, isContentsGuildDuel
      local isSet = false
      local guildNo_s64 = pWarringGuild:getGuildNo()
      if pWarringGuild:isExist() then
        isSet = setGuildTextureByGuildNo(guildNo_s64, rtGuildWarInfo._guildIcon)
      end
      if isSet == false then
        (rtGuildWarInfo._guildIcon):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(rtGuildWarInfo._guildIcon, 183, 1, 188, 6)
        ;
        ((rtGuildWarInfo._guildIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (rtGuildWarInfo._guildIcon):setRenderTexture((rtGuildWarInfo._guildIcon):getBaseTexture())
      else
        do
          ;
          ((rtGuildWarInfo._guildIcon):getBaseTexture()):setUV(0, 0, 1, 1)
          ;
          (rtGuildWarInfo._guildIcon):setRenderTexture((rtGuildWarInfo._guildIcon):getBaseTexture())
          if pWarringGuild:isExist() then
            (rtGuildWarInfo._txtGuildName):SetMonoTone(false)
            ;
            (rtGuildWarInfo._txtGuildName):SetText(pWarringGuild:getGuildName())
          else
            ;
            (rtGuildWarInfo._txtGuildName):SetMonoTone(true)
            ;
            (rtGuildWarInfo._txtGuildName):SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISSOLUTION"))
          end
          local guildWarKillScore = tostring(Uint64toUint32(pWarringGuild:getKillCount()))
          local guildWarDeathScore = tostring(Uint64toUint32(pWarringGuild:getDeathCount()))
          ;
          (rtGuildWarInfo._guildWarScore):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_GUILDWARSCORE", "killCount", guildWarKillScore, "deathCount", guildWarDeathScore))
          ;
          (rtGuildWarInfo._guildShowbuScore):EraseAllEffect()
          if isContentsGuildDuel then
            if ToClient_IsGuildDuelingGuild(guildNo_s64) then
              local guildDuelKillScore = tostring(ToClient_GetGuildDuelKillCount(guildNo_s64))
              local guildDuelDeathScore = tostring(ToClient_GetGuildDuelDeathCount(guildNo_s64))
              ;
              (rtGuildWarInfo._guildShowbuScore):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_GUILDDUELSCORE", "killCount", guildDuelKillScore, "deathCount", guildDuelDeathScore))
              local deadline = ToClient_GetGuildDuelDeadline_s64(guildNo_s64)
              if deadline < toInt64(0, 3600) then
                (rtGuildWarInfo._guildShowbuScore):AddEffect("UI_Quest_Complete_GoldAura", true, 0, 0)
              end
            else
              do
                ;
                (rtGuildWarInfo._guildShowbuScore):addInputEvent("Mouse_On", "")
                ;
                (rtGuildWarInfo._guildShowbuScore):addInputEvent("Mouse_Out", "")
                ;
                (rtGuildWarInfo._guildShowbuScore):setTooltipEventRegistFunc("")
                ;
                (rtGuildWarInfo._guildShowbuScore):SetShow(false)
                local penaltyCount = pWarringGuild:getPenaltyCount()
                if penaltyCount == 0 then
                  (rtGuildWarInfo._WarIcon):SetShow(false)
                else
                  ;
                  (rtGuildWarInfo._WarIcon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Guild/Guild_WarPenaltyIcon.dds")
                  ;
                  (rtGuildWarInfo._WarIcon):SetShow(true)
                end
                ;
                (rtGuildWarInfo._txtShowbu):SetIgnore(false)
                ;
                (rtGuildWarInfo._txtShowbu):SetMonoTone(false)
                ;
                (rtGuildWarInfo._txtStopWar):addInputEvent("Mouse_LUp", "HandleClickedStopWar(" .. gIdx .. ")")
                ;
                (rtGuildWarInfo._txtShowbu):addInputEvent("Mouse_LUp", "HandleClickedGuildDuel(" .. gIdx .. ")")
                if ToClient_IsGuildDuelingGuild(guildNo_s64) then
                  (rtGuildWarInfo._txtShowbu):SetIgnore(true)
                  ;
                  (rtGuildWarInfo._txtShowbu):SetMonoTone(true)
                  ;
                  (rtGuildWarInfo._txtShowbu):addInputEvent("Mouse_LUp", "")
                end
                -- DECOMPILER ERROR at PC267: Confused about usage of register: R8 in 'UnsetPending'

                rtGuildWarInfo._PenaltyType = 7
              end
            end
          end
        end
      end
    end

    return rtGuildWarInfo
  end

  for index = 0, constCreateWarInfoCount - 1 do
    -- DECOMPILER ERROR at PC308: Confused about usage of register: R15 in 'UnsetPending'

    (self._list)[index] = createWarinfo(index)
  end
  createWarinfo2 = function(pIndex)
    -- function num : 0_28_1 , upvalues : self
    local rtGuildWarInfo = {}
    rtGuildWarInfo._warBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_Guild, "Static_C_WarBG", self._static_WarInfoBG, "Static_WarBG2_" .. pIndex)
    rtGuildWarInfo._guildIconBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_Guild, "Static_C_EnemyGuild_IconBG", rtGuildWarInfo._warBG, "Static_GuildIconBG2_" .. pIndex)
    rtGuildWarInfo._guildIcon = (UI.createAndCopyBasePropertyControl)(Panel_Window_Guild, "Static_C_EnemyGuild_Icon", rtGuildWarInfo._warBG, "Static_GuildIcon2_" .. pIndex)
    rtGuildWarInfo._txtGuildName = (UI.createAndCopyBasePropertyControl)(Panel_Window_Guild, "StaticText_C_EnemyGuild_Name", rtGuildWarInfo._warBG, "StaticText_GuildName2_" .. pIndex)
    rtGuildWarInfo._txtGuildMaster = (UI.createAndCopyBasePropertyControl)(Panel_Window_Guild, "StaticText_C_Kill", rtGuildWarInfo._warBG, "StaticText_GuildShowbuScore2_" .. pIndex)
    ;
    (rtGuildWarInfo._warBG):ComputePos()
    ;
    (rtGuildWarInfo._guildIconBG):ComputePos()
    ;
    (rtGuildWarInfo._guildIcon):ComputePos()
    ;
    (rtGuildWarInfo._txtGuildName):ComputePos()
    ;
    (rtGuildWarInfo._txtGuildMaster):ComputePos()
    ;
    (rtGuildWarInfo._warBG):SetSize(315, (rtGuildWarInfo._warBG):GetSizeY())
    ;
    (rtGuildWarInfo._warBG):SetPosY(pIndex * 51 + 5)
    ;
    (rtGuildWarInfo._guildIconBG):SetPosY(pIndex + 4)
    ;
    (rtGuildWarInfo._guildIcon):SetPosY(pIndex + 5)
    ;
    (rtGuildWarInfo._txtGuildName):SetPosY(pIndex + 7)
    ;
    (rtGuildWarInfo._txtGuildMaster):SetPosY(pIndex + 27)
    rtGuildWarInfo.SetShow = function(self, isShow)
      -- function num : 0_28_1_0 , upvalues : rtGuildWarInfo
      (rtGuildWarInfo._warBG):SetShow(isShow)
      ;
      (rtGuildWarInfo._guildIconBG):SetShow(isShow)
      ;
      (rtGuildWarInfo._guildIcon):SetShow(isShow)
      ;
      (rtGuildWarInfo._txtGuildName):SetShow(isShow)
      ;
      (rtGuildWarInfo._txtGuildMaster):SetShow(isShow)
    end

    rtGuildWarInfo.GetShow = function(self)
      -- function num : 0_28_1_1 , upvalues : rtGuildWarInfo
      return (rtGuildWarInfo._warBG):GetShow()
    end

    rtGuildWarInfo.SetData = function(self, guildWrapper)
      -- function num : 0_28_1_2 , upvalues : rtGuildWarInfo
      if guildWrapper ~= nil then
        local guildNo_s64 = tostring(guildWrapper:getGuildNo_s64())
        local isSet = setGuildTextureByGuildNo(guildWrapper:getGuildNo_s64(), rtGuildWarInfo._guildIcon)
        if isSet == false then
          (rtGuildWarInfo._guildIcon):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(rtGuildWarInfo._guildIcon, 183, 1, 188, 6)
          ;
          ((rtGuildWarInfo._guildIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          (rtGuildWarInfo._guildIcon):setRenderTexture((rtGuildWarInfo._guildIcon):getBaseTexture())
        else
          do
            ;
            ((rtGuildWarInfo._guildIcon):getBaseTexture()):setUV(0, 0, 1, 1)
            ;
            (rtGuildWarInfo._guildIcon):setRenderTexture((rtGuildWarInfo._guildIcon):getBaseTexture())
            ;
            (rtGuildWarInfo._txtGuildName):SetText(guildWrapper:getName())
            ;
            (rtGuildWarInfo._txtGuildMaster):SetText(guildWrapper:getGuildMasterName())
          end
        end
      end
    end

    ;
    (rtGuildWarInfo._warBG):SetIgnore(false)
    ;
    (rtGuildWarInfo._guildIconBG):SetIgnore(false)
    ;
    (rtGuildWarInfo._guildIcon):SetIgnore(false)
    ;
    (rtGuildWarInfo._txtGuildName):SetIgnore(false)
    ;
    (rtGuildWarInfo._warBG):addInputEvent("Mouse_UpScroll", "GuildWarInfoPage_ScrollEvent( true )")
    ;
    (rtGuildWarInfo._warBG):addInputEvent("Mouse_DownScroll", "GuildWarInfoPage_ScrollEvent( false )")
    ;
    (rtGuildWarInfo._guildIcon):addInputEvent("Mouse_UpScroll", "GuildWarInfoPage_ScrollEvent( true )")
    ;
    (rtGuildWarInfo._guildIcon):addInputEvent("Mouse_DownScroll", "GuildWarInfoPage_ScrollEvent( false )")
    ;
    (rtGuildWarInfo._txtGuildName):addInputEvent("Mouse_UpScroll", "GuildWarInfoPage_ScrollEvent( true )")
    ;
    (rtGuildWarInfo._txtGuildName):addInputEvent("Mouse_DownScroll", "GuildWarInfoPage_ScrollEvent( false )")
    ;
    (UIScroll.InputEvent)(self._scroll, "GuildWarInfoPage_ScrollEvent")
    return rtGuildWarInfo
  end

  for index = 0, constCreateWarInfoCount - 1 do
    -- DECOMPILER ERROR at PC322: Confused about usage of register: R15 in 'UnsetPending'

    (self._list2)[index] = createWarinfo2(index)
  end
  ;
  (self._txtNoWar):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_NOWAR"))
  ;
  (self._txtNoWar):SetShow(false)
  ;
  (self._txtWarHelp):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txtWarHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_WARHELP"))
  ;
  (self._scroll):SetShow(false)
  ;
  (UI.deleteControl)(copyWarBG)
  ;
  (UI.deleteControl)(copyGuildIcon)
  ;
  (UI.deleteControl)(copyGuildName)
  ;
  (UI.deleteControl)(copyKill)
  ;
  (UI.deleteControl)(copyDeath)
  ;
  (UI.deleteControl)(copyStopWar)
  ;
  (UI.deleteControl)(copyShowbu)
  copyWarBG = nil
  copyGuildIcon, copyGuildName, copyKill, copyDeath = nil
  copyWarBG = nil
  ;
  (self._txtWarInfoTitle):SetSpanSize(50, 395)
  ;
  (self._txtWarInfoTitle):ComputePos()
  ;
  (self._scroll):SetControlTop()
end

GuildWarInfoPage_ScrollEvent = function(isUp)
  -- function num : 0_29 , upvalues : GuildWarInfoPage
  local self = GuildWarInfoPage
  self._startIndex = (UIScroll.ScrollEvent)(self._scroll, isUp, self.slotMaxCount, self._listCount, self._startIndex, 1)
  self:UpdateData()
end

HandleClickedStopWar = function(index)
  -- function num : 0_30
  ToClient_RequestStopGuildWar(index)
end

GuildWarInfoPage.UpdateData = function(self)
  -- function num : 0_31 , upvalues : constCreateWarInfoCount, isContentsGuildDuel
  for index = 0, constCreateWarInfoCount - 1 do
    ((self._list)[index]):SetShow(false)
  end
  for index = 0, constCreateWarInfoCount - 1 do
    ((self._list2)[index]):SetShow(false)
  end
  self._listCount = 0
  ;
  (self._scroll):SetShow(false)
  ToClient_RequestDeclareGuildWarToMyGuild()
  if (self._btnWarList1):IsCheck() then
    self._listCount = ToClient_GetWarringGuildListCount()
    ;
    (UIScroll.SetButtonSize)(self._scroll, self.slotMaxCount, self._listCount)
    if self._listCount == 0 then
      (self._txtNoWar):SetShow(true)
    else
      if constCreateWarInfoCount < self._listCount then
        (self._scroll):SetShow(true)
      end
      local uiIdx = 0
      for index = self._startIndex, self._listCount - 1 do
        if constCreateWarInfoCount <= uiIdx then
          break
        end
        if index < self._listCount then
          (self._txtNoWar):SetShow(false)
          ;
          ((self._list)[uiIdx]):SetShow(true)
          ;
          ((self._list)[uiIdx]):SetData(ToClient_GetWarringGuildListAt(index), index)
          ;
          (((self._list)[uiIdx])._WarIcon):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( " .. ((self._list)[uiIdx])._PenaltyType .. ", true, " .. uiIdx .. " )")
          ;
          (((self._list)[uiIdx])._WarIcon):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( " .. ((self._list)[uiIdx])._PenaltyType .. ", false, " .. uiIdx .. " )")
          ;
          (((self._list)[uiIdx])._WarIcon):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( " .. ((self._list)[uiIdx])._PenaltyType .. ", true, " .. uiIdx .. " )")
          ;
          (((self._list)[uiIdx])._txtStopWar):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( " .. 9 .. ", true, " .. uiIdx .. " )")
          ;
          (((self._list)[uiIdx])._txtStopWar):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( " .. 9 .. ", false, " .. uiIdx .. " )")
          ;
          (((self._list)[uiIdx])._txtStopWar):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( " .. 9 .. ", true, " .. uiIdx .. " )")
          ;
          (((self._list)[uiIdx])._txtShowbu):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( " .. 10 .. ", true, " .. uiIdx .. " )")
          ;
          (((self._list)[uiIdx])._txtShowbu):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( " .. 10 .. ", false, " .. uiIdx .. " )")
          ;
          (((self._list)[uiIdx])._txtShowbu):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( " .. 10 .. ", true, " .. uiIdx .. " )")
          if isContentsGuildDuel then
            (((self._list)[uiIdx])._guildShowbuScore):addInputEvent("Mouse_On", "HandleOnOut_GuildDuelInfo_Tooltip( true,\t" .. index .. ", " .. uiIdx .. " )")
            ;
            (((self._list)[uiIdx])._guildShowbuScore):addInputEvent("Mouse_Out", "HandleOnOut_GuildDuelInfo_Tooltip( false,\t" .. index .. ", " .. uiIdx .. " )")
            ;
            (((self._list)[uiIdx])._guildShowbuScore):setTooltipEventRegistFunc("HandleOnOut_GuildDuelInfo_Tooltip( true,\t" .. index .. ", " .. uiIdx .. " )")
          end
          local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
          local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
          if isGuildMaster == true or isGuildSubMaster == true then
            (((self._list)[uiIdx])._txtStopWar):SetShow(true)
            ;
            (((self._list)[uiIdx])._txtShowbu):SetShow(isContentsGuildDuel)
          else
            ;
            (((self._list)[uiIdx])._txtStopWar):SetShow(false)
            ;
            (((self._list)[uiIdx])._txtShowbu):SetShow(false)
          end
        else
          do
            do
              ;
              ((self._list)[uiIdx]):SetShow(false)
              uiIdx = uiIdx + 1
              -- DECOMPILER ERROR at PC286: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC286: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC286: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  else
    do
      self._listCount = ToClient_GetCountDeclareGuildWarToMyGuild()
      ;
      (UIScroll.SetButtonSize)(self._scroll, self.slotMaxCount, self._listCount)
      if self._listCount == 0 then
        (self._txtNoWar):SetShow(true)
      else
        for index = 0, constCreateWarInfoCount - 1 do
          ((self._list2)[index]):SetShow(false)
        end
        if constCreateWarInfoCount < self._listCount then
          (self._scroll):SetShow(true)
        end
        local uiIdx = 0
        for index = self._startIndex, self._listCount - 1 do
          if constCreateWarInfoCount <= uiIdx then
            break
          end
          ;
          (self._txtNoWar):SetShow(false)
          local guildNo = ToClient_GetDeclareGuildWarToMyGuild_s64(index)
          local guildWrapper = ToClient_GetGuildInfoWrapperByGuildNo(guildNo)
          ;
          ((self._list2)[uiIdx]):SetShow(true)
          ;
          ((self._list2)[uiIdx]):SetData(guildWrapper)
          uiIdx = uiIdx + 1
        end
      end
    end
  end
end

local warInfoTypeIsMine = true
HandleClicked_WarInfoUpdate = function(typeNo)
  -- function num : 0_32 , upvalues : GuildWarInfoPage, warInfoTypeIsMine
  local self = GuildWarInfoPage
  if typeNo == 1 then
    if warInfoTypeIsMine == true then
      return 
    end
    warInfoTypeIsMine = true
    self._startIndex = 0
    ;
    (self._scroll):SetControlTop()
  else
    if warInfoTypeIsMine == false then
      return 
    end
    warInfoTypeIsMine = false
    self._startIndex = 0
    ;
    (self._scroll):SetControlTop()
  end
  self:UpdateData()
end

GuildManager = {_mainTagName = (UI.getChildControl)(Panel_Window_Guild, "StaticText_MenuTag"), _doHaveSeige = false}
local _txt_Help_History = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Help_History")
local _txt_Help_GuildMember = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Help_GuildMember")
local _txt_Help_GuildQuest = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Help_GuildQuest")
local _txt_Help_GuildSkill = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Help_GuildSkill")
local _txt_Help_WarInfo = (UI.getChildControl)(Panel_Window_Guild, "StaticText_Help_WarInfo")
-- DECOMPILER ERROR at PC368: Confused about usage of register: R45 in 'UnsetPending'

GuildManager.initialize = function(self)
  -- function num : 0_33 , upvalues : GuildInfoPage, GuildLetsWarPage, GuildWarInfoPage
  self.mainBtn_Main = (UI.getChildControl)(Panel_Window_Guild, "Button_Tab_Main")
  self.mainBtn_History = (UI.getChildControl)(Panel_Window_Guild, "Button_Tab_History")
  self.mainBtn_Info = (UI.getChildControl)(Panel_Window_Guild, "Button_Tab_GuildInfo")
  self.mainBtn_Quest = (UI.getChildControl)(Panel_Window_Guild, "Button_Tab_GuildQuest")
  self.mainBtn_Tree = (UI.getChildControl)(Panel_Window_Guild, "Button_Tab_Skill")
  self.mainBtn_Warfare = (UI.getChildControl)(Panel_Window_Guild, "Button_Tab_Warfare")
  self.mainBtn_Recruitment = (UI.getChildControl)(Panel_Window_Guild, "Button_Tab_Recruitment")
  self.mainBtn_CraftInfo = (UI.getChildControl)(Panel_Window_Guild, "Button_Tab_CraftInfo")
  self.mainBtn_GuildBattle = (UI.getChildControl)(Panel_Window_Guild, "Button_Tab_GuildBattle")
  self.closeButton = (UI.getChildControl)(Panel_Window_Guild, "Button_Close")
  self._buttonQuestion = (UI.getChildControl)(Panel_Window_Guild, "Button_Question")
  ;
  (self.mainBtn_Main):addInputEvent("Mouse_LUp", "GuildManager:TabToggle( 99 )")
  ;
  (self.mainBtn_History):addInputEvent("Mouse_LUp", "GuildManager:TabToggle( 0 )")
  ;
  (self.mainBtn_Info):addInputEvent("Mouse_LUp", "GuildManager:TabToggle( 1 )")
  ;
  (self.mainBtn_Quest):addInputEvent("Mouse_LUp", "GuildManager:TabToggle( 2 )")
  ;
  (self.mainBtn_Tree):addInputEvent("Mouse_LUp", "GuildManager:TabToggle( 3 )")
  ;
  (self.mainBtn_Warfare):addInputEvent("Mouse_LUp", "GuildManager:TabToggle( 4 )")
  ;
  (self.mainBtn_Recruitment):addInputEvent("Mouse_LUp", "GuildManager:TabToggle( 5 )")
  ;
  (self.mainBtn_CraftInfo):addInputEvent("Mouse_LUp", "GuildManager:TabToggle( 6 )")
  ;
  (self.mainBtn_GuildBattle):addInputEvent("Mouse_LUp", "GuildManager:TabToggle( 7 )")
  ;
  (self.closeButton):addInputEvent("Mouse_LUp", "HandleClickedGuildHideButton()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelGuild\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelGuild\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelGuild\", \"false\")")
  ;
  (self.mainBtn_Main):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 99, true )")
  ;
  (self.mainBtn_History):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 5, true )")
  ;
  (self.mainBtn_Info):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 0, true )")
  ;
  (self.mainBtn_Quest):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 1, true )")
  ;
  (self.mainBtn_Tree):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 2, true )")
  ;
  (self.mainBtn_Warfare):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 3, true )")
  ;
  (self.mainBtn_Recruitment):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 4, true )")
  ;
  (self.mainBtn_CraftInfo):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 11, true )")
  ;
  (self.mainBtn_GuildBattle):addInputEvent("Mouse_On", "Panel_Guild_Tab_ToolTip_Func( 12, true )")
  ;
  (self.mainBtn_Main):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 99, false )")
  ;
  (self.mainBtn_History):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 5, false )")
  ;
  (self.mainBtn_Info):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 0, false )")
  ;
  (self.mainBtn_Quest):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 1, false )")
  ;
  (self.mainBtn_Tree):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 2, false )")
  ;
  (self.mainBtn_Warfare):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 3, false )")
  ;
  (self.mainBtn_Recruitment):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 4, false )")
  ;
  (self.mainBtn_CraftInfo):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 11, false )")
  ;
  (self.mainBtn_GuildBattle):addInputEvent("Mouse_Out", "Panel_Guild_Tab_ToolTip_Func( 12, false )")
  ;
  (self.mainBtn_Main):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 99, true )")
  ;
  (self.mainBtn_History):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 5, true )")
  ;
  (self.mainBtn_Info):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 0, true )")
  ;
  (self.mainBtn_Quest):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 1, true )")
  ;
  (self.mainBtn_Tree):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 2, true )")
  ;
  (self.mainBtn_Warfare):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 3, true )")
  ;
  (self.mainBtn_Recruitment):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 4, true )")
  ;
  (self.mainBtn_CraftInfo):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 11, true )")
  ;
  (self.mainBtn_GuildBattle):setTooltipEventRegistFunc("Panel_Guild_Tab_ToolTip_Func( 12, true )")
  GuildInfoPage:initialize()
  GuildLetsWarPage:initialize()
  GuildWarInfoPage:initialize()
  GuildListInfoPage:initialize()
  GuildQuestInfoPage:initialize()
  GuildWarfareInfoPage:initialize()
  GuildSkillFrame_Init()
  Guild_Recruitment_Initialize()
  FGlobal_Guild_CraftInfo_Init()
  self.ChangeTab = function(self, pText, pX1, pY1, pX2, pY2)
    -- function num : 0_33_0
    local x1, y1, x2, y2 = setTextureUV_Func(self._mainTagName, pX1, pY1, pX2, pY2)
    ;
    (self._mainTagName):SetText(pText)
    ;
    ((self._mainTagName):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (self._mainTagName):setRenderTexture((self._mainTagName):getBaseTexture())
  end

end

HandleClickedGuildHideButton = function()
  -- function num : 0_34 , upvalues : checkPopUp
  Panel_Window_Guild:CloseUISubApp()
  checkPopUp:SetCheck(false)
  GuildManager:Hide()
end

Panel_Guild_Tab_ToolTip_Func = function(tabNo, isOn, inPut_index)
  -- function num : 0_35 , upvalues : GuildInfoPage, GuildWarInfoPage
  if isOn == true then
    local uiControl, name, desc = nil, nil, nil
    if tabNo == 0 then
      uiControl = GuildManager.mainBtn_Info
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDLIST")
      desc = nil
    else
      if tabNo == 1 then
        uiControl = GuildManager.mainBtn_Quest
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDQUEST")
        desc = nil
      else
        if tabNo == 2 then
          uiControl = GuildManager.mainBtn_Tree
          name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDSKILL")
          desc = nil
        else
          if tabNo == 3 then
            uiControl = GuildManager.mainBtn_Warfare
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDWARFAREINFO")
            desc = nil
          else
            if tabNo == 4 then
              uiControl = GuildManager.mainBtn_Recruitment
              name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENTGUILD")
              desc = nil
            else
              if tabNo == 5 then
                uiControl = GuildManager.mainBtn_History
                name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDHISTORY")
                desc = nil
              else
                if tabNo == 6 then
                  uiControl = GuildInfoPage._btnIncreaseMember
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_HELP_WARINFO")
                  desc = nil
                else
                  if tabNo == 7 then
                    uiControl = ((GuildWarInfoPage._list)[inPut_index])._WarIcon
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PENALTY")
                    desc = nil
                  else
                    if tabNo == 8 then
                      uiControl = GuildInfoPage._btnProtectAdd
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_HELP_PROTECTADD")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PROTECTADD_DESC")
                    else
                      if tabNo == 9 then
                        uiControl = ((GuildWarInfoPage._list)[inPut_index])._txtStopWar
                        name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WARSTOP")
                        desc = nil
                      else
                        if tabNo == 10 then
                          uiControl = ((GuildWarInfoPage._list)[inPut_index])._txtShowbu
                          name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WARREQUEST")
                          desc = nil
                        else
                          if tabNo == 11 then
                            uiControl = GuildManager.mainBtn_CraftInfo
                            name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDCRAFTINFO_TITLE")
                            desc = nil
                          else
                            if tabNo == 12 then
                              uiControl = GuildManager.mainBtn_GuildBattle
                              name = PAGetString(Defines.StringSheet_GAME, "LUA_MENU_GUILDBATTLE")
                              desc = nil
                            else
                              if tabNo == 99 then
                                uiControl = GuildManager.mainBtn_Main
                                name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDINFO_TITLE")
                                desc = nil
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

GuildSimplTooltips = function(isShow, tipType)
  -- function num : 0_36 , upvalues : btn_GuildMasterMandate, btn_GuildMasterMandateBG, GuildInfoPage, isContentsArsha, isCanDoReservation
  local name, desc, control = nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMASTER_MANDATE_TOOLTIP_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMASTER_MANDATE_TOOLTIP_DESC")
    control = btn_GuildMasterMandate
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMASTER_MANDATE_TOOLTIP_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMASTER_MANDATE_TOOLTIP_DESC")
      control = btn_GuildMasterMandateBG
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMARK_BTN_TOOLTIP_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMARK_BTN_TOOLTIP_DESC")
        control = GuildInfoPage._btnChangeMark
      else
        if tipType == 3 then
          if ((getSelfPlayer()):get()):isGuildMaster() then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDDEL_BTN_TOOLTIP_DESC")
          else
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDDEL_BTN_TOOLTIP_DESC2")
          end
          control = GuildInfoPage._btnGuildDel
        else
          if tipType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_SIMPLETOOLTIP_GUILDNAME")
            control = GuildInfoPage._txtRGuildName
          else
            if tipType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_SIMPLETOOLTIP_GUILDNICKNAME")
              control = GuildInfoPage._txtRMaster
            else
              if tipType == 6 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_SIMPLETOOLTIP_WEBINFO")
                control = GuildInfoPage._btnGuildWebInfo
              else
                if tipType == 7 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_SIMPLETOOLTIP_WAREHOUSE")
                  control = GuildInfoPage._btnGuildWarehouse
                else
                  if tipType == 8 and isContentsArsha == true and isCanDoReservation == true then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_SIMPLETOOLTIP_GETARSHAHOST")
                    control = GuildInfoPage._btnGetArshaHost
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

local _index = nil
-- DECOMPILER ERROR at PC391: Confused about usage of register: R46 in 'UnsetPending'

GuildManager.TabToggle = function(self, index)
  -- function num : 0_37 , upvalues : tabNumber, _Web, btn_GuildMasterMandateBG, btn_GuildMasterMandate, _index
  (self._mainTagName):ChangeTextureInfoName("New_UI_Common_forLua/Window/Guild/Guild_00.dds")
  tabNumber = 99
  ;
  (self.mainBtn_Main):SetCheck(index == 99)
  ;
  (self.mainBtn_History):SetCheck(index == 0)
  ;
  (self.mainBtn_Info):SetCheck(index == 1)
  ;
  (self.mainBtn_Quest):SetCheck(index == 2)
  ;
  (self.mainBtn_Tree):SetCheck(index == 3)
  ;
  (self.mainBtn_Warfare):SetCheck(index == 4)
  ;
  (self.mainBtn_Recruitment):SetCheck(index == 5)
  ;
  (self.mainBtn_CraftInfo):SetCheck(index == 6)
  ;
  (self.mainBtn_GuildBattle):SetCheck(index == 7)
  ConsoleGroupDelete_Panel_Window_Guild()
  if ((getSelfPlayer()):get()):isGuildMaster() and ((getSelfPlayer()):get()):isGuildSubMaster() then
    FGlobal_ClearCandidate()
    _Web:ResetUrl()
  end
  if index == 0 then
    self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDHISTORY"), 92, 1, 104, 15)
    FGlobal_GuildHistory_Show(true)
    GuildListInfoPage:Hide()
    GuildQuestInfoPage:Hide()
    GuildWarfareInfoPage:Hide()
    GuildSkillFrame_Hide()
    Guild_Recruitment_Close()
    GuildMainInfo_Hide()
    btn_GuildMasterMandateBG:SetShow(false)
    btn_GuildMasterMandate:SetShow(false)
    tabNumber = 0
  elseif index == 1 then
    local myGuildInfo = (ToClient_GetMyGuildInfoWrapper())
    local guildGrade = nil
    if myGuildInfo ~= nil then
      guildGrade = myGuildInfo:getGuildGrade()
    end
    if guildGrade == 0 then
      self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN_MEMBERINFO"), 107, 1, 119, 15)
    else
      self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDLIST"), 107, 1, 119, 15)
    end
    FGlobal_GuildHistory_Show(false)
    GuildListInfoPage:Show()
    GuildQuestInfoPage:Hide()
    GuildWarfareInfoPage:Hide()
    GuildSkillFrame_Hide()
    Guild_Recruitment_Close()
    GuildMainInfo_Hide()
    btn_GuildMasterMandateBG:SetShow(false)
    btn_GuildMasterMandate:SetShow(false)
    PaGlobal_GuildBattle:Close()
    tabNumber = 1
  elseif index == 2 then
    self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDQUEST"), 122, 1, 134, 15)
    FGlobal_GuildHistory_Show(false)
    GuildListInfoPage:Hide()
    GuildQuestInfoPage:Show()
    GuildWarfareInfoPage:Hide()
    GuildSkillFrame_Hide()
    GuildMainInfo_Hide()
    Guild_Recruitment_Close()
    btn_GuildMasterMandateBG:SetShow(false)
    btn_GuildMasterMandate:SetShow(false)
    PaGlobal_GuildBattle:Close()
    tabNumber = 2
  elseif index == 3 then
    self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDSKILL"), 137, 1, 149, 15)
    FGlobal_GuildHistory_Show(false)
    GuildListInfoPage:Hide()
    GuildQuestInfoPage:Hide()
    GuildWarfareInfoPage:Hide()
    GuildSkillFrame_Show()
    GuildMainInfo_Hide()
    Guild_Recruitment_Close()
    btn_GuildMasterMandateBG:SetShow(false)
    btn_GuildMasterMandate:SetShow(false)
    PaGlobal_GuildBattle:Close()
    tabNumber = 3
  elseif index == 4 then
    self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDWARFAREINFO"), 152, 1, 164, 15)
    FGlobal_GuildHistory_Show(false)
    GuildListInfoPage:Hide()
    GuildQuestInfoPage:Hide()
    GuildWarfareInfoPage:Show()
    GuildSkillFrame_Hide()
    GuildMainInfo_Hide()
    Guild_Recruitment_Close()
    btn_GuildMasterMandateBG:SetShow(false)
    btn_GuildMasterMandate:SetShow(false)
    PaGlobal_GuildBattle:Close()
    tabNumber = 4
  elseif index == 5 then
    local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
    if myGuildInfo == nil then
      return 
    end
    if not ((getSelfPlayer()):get()):isGuildMaster() and not ((getSelfPlayer()):get()):isGuildSubMaster() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ONLYMASTER"))
      ;
      (self.mainBtn_Main):SetCheck(_index == 99)
      ;
      (self.mainBtn_History):SetCheck(_index == 0)
      ;
      (self.mainBtn_Info):SetCheck(_index == 1)
      ;
      (self.mainBtn_Quest):SetCheck(_index == 2)
      ;
      (self.mainBtn_Tree):SetCheck(_index == 3)
      ;
      (self.mainBtn_Warfare):SetCheck(_index == 4)
      ;
      (self.mainBtn_Recruitment):SetCheck(_index == 5)
      ;
      (self.mainBtn_CraftInfo):SetCheck(_index == 6)
      ;
      (self.mainBtn_GuildBattle):SetCheck(_index == 7)
      return 
    end
    self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENTGUILD"), 152, 1, 164, 15)
    FGlobal_GuildHistory_Show(false)
    GuildListInfoPage:Hide()
    GuildQuestInfoPage:Hide()
    GuildWarfareInfoPage:Hide()
    GuildSkillFrame_Hide()
    GuildMainInfo_Hide()
    Guild_Recruitment_Open()
    btn_GuildMasterMandateBG:SetShow(false)
    btn_GuildMasterMandate:SetShow(false)
    PaGlobal_GuildBattle:Close()
    tabNumber = 5
  elseif index == 99 then
    GuildMainInfo_Show()
    FGlobal_GuildHistory_Show(false)
    self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDINFO_TITLE"), 446, 2, 458, 14)
    GuildListInfoPage:Hide()
    GuildQuestInfoPage:Hide()
    GuildWarfareInfoPage:Hide()
    GuildSkillFrame_Hide()
    Guild_Recruitment_Close()
    GuildComment_Load()
    PaGlobal_GuildBattle:Close()
    tabNumber = 99
  elseif index == 6 then
    self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDCRAFTINFO_TITLE"), 461, 2, 473, 14)
    FGlobal_GuildHistory_Show(false)
    GuildMainInfo_Hide()
    GuildListInfoPage:Hide()
    GuildQuestInfoPage:Hide()
    GuildWarfareInfoPage:Hide()
    GuildSkillFrame_Hide()
    Guild_Recruitment_Close()
    btn_GuildMasterMandateBG:SetShow(false)
    btn_GuildMasterMandate:SetShow(false)
    PaGlobal_GuildBattle:Close()
    tabNumber = 6
  elseif index == 7 then
    self:ChangeTab(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_GUILDBATTLE"), 461, 2, 473, 14)
    FGlobal_GuildBattle_Open()
    FGlobal_GuildHistory_Show(false)
    GuildMainInfo_Hide()
    GuildListInfoPage:Hide()
    GuildQuestInfoPage:Hide()
    GuildWarfareInfoPage:Hide()
    GuildSkillFrame_Hide()
    Guild_Recruitment_Close()
    btn_GuildMasterMandateBG:SetShow(false)
    btn_GuildMasterMandate:SetShow(false)
    tabNumber = 7
  end
  FGlobal_Guild_CraftInfo_Open(index == 6)
  FGlobal_GuildMenuButtonHide()
  _index = index
  -- DECOMPILER ERROR: 34 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC396: Confused about usage of register: R46 in 'UnsetPending'

GuildManager.Hide = function(self)
  -- function num : 0_38 , upvalues : IM, _Web
  if Panel_Window_Guild:IsShow() == false then
    return 
  end
  if Panel_Window_Guild:IsUISubApp() then
    return 
  end
  Panel_Window_Guild:SetShow(false, true)
  FGlobal_ShowRewardList(false)
  HelpMessageQuestion_Out()
  FGlobal_AgreementGuild_Close()
  agreementGuild_Master_Close()
  Panel_GuildIncentiveOption_Close()
  HandleClicked_LetsWarHide()
  FGlobal_GuildMenuButtonHide()
  TooltipSimple_Hide()
  TooltipGuild_Hide()
  FGlobal_GetDailyPay_Hide()
  if AllowChangeInputMode() then
    ClearFocusEdit()
    if check_ShowWindow() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
  FGlobal_ClearCandidate()
  _Web:ResetUrl()
end

-- DECOMPILER ERROR at PC402: Confused about usage of register: R46 in 'UnsetPending'

GuildManager.Show = function(self)
  -- function num : 0_39 , upvalues : GuildWarInfoPage, GuildInfoPage, GuildLetsWarPage
  if Panel_Window_Guild:IsShow() == false then
    local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
    local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
    local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R4 in 'UnsetPending'

    if myGuildInfo ~= nil then
      GuildManager._doHaveSeige = myGuildInfo:doHaveOccupyingSiege()
    end
    local isAdmin = 0
    if isGuildMaster or isGuildSubMaster then
      isAdmin = 1
    end
    ;
    (self.mainBtn_Main):SetCheck(true)
    ;
    (self.mainBtn_Info):SetCheck(false)
    ;
    (self.mainBtn_Quest):SetCheck(false)
    ;
    (self.mainBtn_Tree):SetCheck(false)
    ;
    (self.mainBtn_Warfare):SetCheck(false)
    ;
    (self.mainBtn_History):SetCheck(false)
    ;
    (self.mainBtn_Recruitment):SetCheck(false)
    ;
    (self.mainBtn_Main):SetIgnore(false)
    ;
    (self.mainBtn_Info):SetIgnore(false)
    ;
    (self.mainBtn_Quest):SetIgnore(false)
    ;
    (self.mainBtn_Tree):SetIgnore(false)
    ;
    (self.mainBtn_Warfare):SetIgnore(false)
    ;
    (self.mainBtn_History):SetIgnore(false)
    ;
    (self.mainBtn_Recruitment):SetIgnore(false)
    ;
    (self.mainBtn_CraftInfo):SetIgnore(false)
    ;
    (self.mainBtn_GuildBattle):SetIgnore(false)
    ;
    (self.mainBtn_Main):SetMonoTone(false)
    ;
    (self.mainBtn_Info):SetMonoTone(false)
    ;
    (self.mainBtn_Quest):SetMonoTone(false)
    ;
    (self.mainBtn_Tree):SetMonoTone(false)
    ;
    (self.mainBtn_Warfare):SetMonoTone(false)
    ;
    (self.mainBtn_History):SetMonoTone(false)
    if ((getSelfPlayer()):get()):isGuildMaster() or ((getSelfPlayer()):get()):isGuildSubMaster() then
      (self.mainBtn_Recruitment):SetMonoTone(false)
    else
      ;
      (self.mainBtn_Recruitment):SetMonoTone(true)
    end
    ;
    (self.mainBtn_CraftInfo):SetMonoTone(false)
    ;
    (GuildWarInfoPage._btnWarList1):SetCheck(true)
    ;
    (GuildWarInfoPage._btnWarList2):SetCheck(false)
    -- DECOMPILER ERROR at PC159: Confused about usage of register: R5 in 'UnsetPending'

    GuildWarInfoPage._startIndex = 0
    ;
    (GuildWarInfoPage._scroll):SetControlPos(0)
    if isDeadInWatchingMode() and not Panel_DeadMessage:GetShow() then
      GuildManager:TabToggle(4)
      ;
      (self.mainBtn_Main):SetCheck(false)
      ;
      (self.mainBtn_Info):SetCheck(false)
      ;
      (self.mainBtn_Quest):SetCheck(false)
      ;
      (self.mainBtn_Tree):SetCheck(false)
      ;
      (self.mainBtn_Warfare):SetCheck(true)
      ;
      (self.mainBtn_History):SetCheck(false)
      ;
      (self.mainBtn_Recruitment):SetCheck(false)
      ;
      (self.mainBtn_CraftInfo):SetCheck(false)
      ;
      (self.mainBtn_GuildBattle):SetCheck(false)
      ;
      (self.mainBtn_Main):SetIgnore(true)
      ;
      (self.mainBtn_Info):SetIgnore(true)
      ;
      (self.mainBtn_Quest):SetIgnore(true)
      ;
      (self.mainBtn_Tree):SetIgnore(true)
      ;
      (self.mainBtn_Warfare):SetIgnore(false)
      ;
      (self.mainBtn_History):SetIgnore(true)
      ;
      (self.mainBtn_Recruitment):SetIgnore(true)
      ;
      (self.mainBtn_CraftInfo):SetIgnore(true)
      ;
      (self.mainBtn_GuildBattle):SetIgnore(true)
      ;
      (self.mainBtn_Main):SetMonoTone(true)
      ;
      (self.mainBtn_Info):SetMonoTone(true)
      ;
      (self.mainBtn_Quest):SetMonoTone(true)
      ;
      (self.mainBtn_Tree):SetMonoTone(true)
      ;
      (self.mainBtn_Warfare):SetMonoTone(true)
      ;
      (self.mainBtn_History):SetMonoTone(true)
      ;
      (self.mainBtn_Recruitment):SetMonoTone(true)
      ;
      (self.mainBtn_CraftInfo):SetMonoTone(true)
      ;
      (self.mainBtn_GuildBattle):SetMonoTone(true)
    else
      GuildManager:TabToggle(99)
    end
    GuildMainInfo_MandateBtn()
    GuildInfoPage:UpdateData()
    GuildListInfoPage:UpdateData()
    GuildLetsWarPage:UpdateData()
    GuildWarInfoPage:UpdateData()
    GuildSkillFrame_Update()
    FGlobal_Notice_Update()
    GuildIntroduce_Update()
    FromClient_ResponseGuildNotice()
    FGlobal_GuildListScrollTop()
    guildQuest_ProgressingGuildQuest_UpdateRemainTime()
    Panel_Window_Guild:SetShow(true, true)
    ToClient_RequestGuildUnjoinedPlayerList()
    GuildComment_Load()
  end
end

GuildComment_Load = function()
  -- function num : 0_40 , upvalues : guildCommentsWebUrl, _urlCache, _Web
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  if guildWrapper == nil then
    return 
  end
  local guildNo_s64 = guildWrapper:getGuildNo_s64()
  local myUserNo = ((getSelfPlayer()):get()):getUserNo()
  local cryptKey = ((getSelfPlayer()):get()):getWebAuthenticKeyCryptString()
  guildCommentsWebUrl = guildCommentsUrlByServiceType()
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  local isAdmin = 0
  if isGuildMaster or isGuildSubMaster then
    isAdmin = 1
  end
  if guildCommentsWebUrl ~= nil then
    FGlobal_SetCandidate()
    local url = guildCommentsWebUrl .. "?guildNo=" .. tostring(guildNo_s64) .. "&userNo=" .. tostring(myUserNo) .. "&certKey=" .. tostring(cryptKey) .. "&isMaster=" .. tostring(isAdmin)
    _urlCache = url
    _Web:SetUrl(323, 272, url, false, true)
    _Web:SetIME(true)
  end
end

GuildMainInfo_MandateBtn = function()
  -- function num : 0_41 , upvalues : tabNumber, btn_GuildMasterMandate, btn_GuildMasterMandateBG, UI_color
  if tabNumber ~= 99 then
    return 
  end
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  if toInt64(0, -1) == myGuildInfo:getGuildMasterUserNo() and not isGuildMaster then
    btn_GuildMasterMandate:SetShow(true)
    btn_GuildMasterMandateBG:SetShow(false)
    btn_GuildMasterMandate:SetEnable(true)
    btn_GuildMasterMandate:SetMonoTone(false)
    btn_GuildMasterMandate:SetFontColor(UI_color.C_FF00C0D7)
  end
  if isGuildSubMaster then
    if ToClient_IsAbleChangeMaster() then
      if myGuildInfo:getGuildBusinessFunds_s64() < toInt64(0, 20000000) then
        btn_GuildMasterMandate:SetShow(true)
        btn_GuildMasterMandateBG:SetShow(true)
        btn_GuildMasterMandate:SetEnable(false)
        btn_GuildMasterMandate:SetMonoTone(true)
        btn_GuildMasterMandate:SetFontColor(UI_color.C_FFC4BEBE)
      else
        btn_GuildMasterMandate:SetShow(true)
        btn_GuildMasterMandateBG:SetShow(false)
        btn_GuildMasterMandate:SetEnable(true)
        btn_GuildMasterMandate:SetMonoTone(false)
        btn_GuildMasterMandate:SetFontColor(UI_color.C_FF00C0D7)
      end
    else
      btn_GuildMasterMandate:SetShow(true)
      btn_GuildMasterMandate:SetEnable(false)
      btn_GuildMasterMandateBG:SetShow(true)
      btn_GuildMasterMandate:SetMonoTone(true)
    end
  else
    btn_GuildMasterMandate:SetShow(false)
    btn_GuildMasterMandateBG:SetShow(false)
    TooltipSimple_Hide()
  end
end

GuildMainInfo_Show = function()
  -- function num : 0_42 , upvalues : tabNumber, GuildWarInfoPage, GuildInfoPage, notice_btn, introduce_btn, introduce_Reset, isProtectGuildMember, introduce_edit_TW, introduce_edit, notice_title, notice_edit, isContentsGuildHouse, isContentsGuildInfo, isContentsArsha, isCanDoReservation, guildCommentsWebUrl, _Web
  if tabNumber ~= 99 then
    return 
  end
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local hasOccupyTerritory = myGuildInfo:getHasSiegeCount()
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  ;
  (GuildWarInfoPage._txtWarInfoTitle):SetShow(true)
  if isGuildMaster then
    (GuildInfoPage._btnChangeMark):SetShow(true)
    notice_btn:SetShow(true)
    introduce_btn:SetShow(true)
    introduce_Reset:SetShow(true)
    ;
    (GuildWarInfoPage._btnDeclaration):SetShow(true)
    ;
    (GuildInfoPage._btnIncreaseMember):SetShow(true)
    if isProtectGuildMember then
      (GuildInfoPage._btnProtectAdd):SetShow(true)
    end
    if isGameTypeTaiwan() then
      introduce_edit_TW:SetEnable(true)
    else
      introduce_edit:SetEnable(true)
    end
  else
    if isGuildSubMaster then
      (GuildInfoPage._btnChangeMark):SetShow(false)
      notice_btn:SetShow(true)
      introduce_btn:SetShow(true)
      introduce_Reset:SetShow(true)
      ;
      (GuildWarInfoPage._btnDeclaration):SetShow(true)
      ;
      (GuildInfoPage._btnIncreaseMember):SetShow(false)
      ;
      (GuildInfoPage._btnProtectAdd):SetShow(false)
      if isGameTypeTaiwan() then
        introduce_edit_TW:SetEnable(true)
      else
        introduce_edit:SetEnable(true)
      end
    else
      ;
      (GuildInfoPage._btnChangeMark):SetShow(false)
      notice_btn:SetShow(false)
      introduce_btn:SetShow(false)
      introduce_Reset:SetShow(false)
      ;
      (GuildWarInfoPage._btnDeclaration):SetShow(false)
      ;
      (GuildInfoPage._btnIncreaseMember):SetShow(false)
      ;
      (GuildInfoPage._btnProtectAdd):SetShow(false)
      if isGameTypeTaiwan() then
        introduce_edit_TW:SetEnable(false)
      else
        introduce_edit:SetEnable(false)
      end
    end
  end
  if hasOccupyTerritory ~= 0 then
    (GuildInfoPage._iconOccupyTerritory):SetShow(true)
  else
    ;
    (GuildInfoPage._iconOccupyTerritory):SetShow(false)
  end
  notice_title:SetShow(true)
  notice_edit:SetShow(true)
  if isGameTypeTaiwan() then
    introduce_edit_TW:SetShow(true)
    introduce_edit:SetShow(false)
  else
    introduce_edit:SetShow(true)
    introduce_edit_TW:SetShow(false)
  end
  if isGameTypeEnglish() then
    (GuildInfoPage._txtMaster):SetShow(false)
    ;
    (GuildInfoPage._txtGuildName):SetShow(false)
  else
    ;
    (GuildInfoPage._txtMaster):SetShow(true)
    ;
    (GuildInfoPage._txtGuildName):SetShow(true)
  end
  ;
  (GuildInfoPage._textGuildInfoTitle):SetShow(true)
  ;
  (GuildInfoPage._guildMainBG):SetShow(true)
  ;
  (GuildInfoPage._iconGuildMark):SetShow(true)
  ;
  (GuildInfoPage._txtRGuildName):SetShow(true)
  ;
  (GuildInfoPage._txtRMaster):SetShow(true)
  ;
  (GuildInfoPage._txtRRank_Title):SetShow(true)
  ;
  (GuildInfoPage._txtRRank):SetShow(true)
  ;
  (GuildInfoPage._txtGuildPoint):SetShow(true)
  ;
  (GuildInfoPage._txtGuildPointValue):SetShow(true)
  ;
  (GuildInfoPage._txtGuildPointPercent):SetShow(true)
  ;
  (GuildInfoPage._txtGuildMpValue):SetShow(false)
  ;
  (GuildInfoPage._txtGuildMpPercent):SetShow(false)
  ;
  (GuildInfoPage._progressMpPoint):SetShow(false)
  ;
  (GuildInfoPage._btnGuildDel):SetShow(true)
  ;
  (GuildInfoPage._guildIntroduce_Title):SetShow(true)
  ;
  (GuildInfoPage._guildIntroduce_BG):SetShow(true)
  ;
  (GuildInfoPage._guildBbs_Title):SetShow(true)
  ;
  (GuildInfoPage._guildBbs_BG):SetShow(true)
  ;
  (GuildInfoPage._planning):SetShow(true)
  ;
  (GuildInfoPage._txtProtect):SetShow(true)
  ;
  (GuildInfoPage._txtProtectValue):SetShow(true)
  ;
  (GuildInfoPage._txtGuildMoneyTitle):SetShow(true)
  ;
  (GuildInfoPage._txtGuildMoney):SetShow(true)
  ;
  (GuildInfoPage._txtGuildTerritoryTitle):SetShow(true)
  ;
  (GuildInfoPage._txtGuildTerritoryValue):SetShow(true)
  ;
  (GuildInfoPage._txtGuildServantTitle):SetShow(true)
  ;
  (GuildInfoPage._txtGuildServantValue):SetShow(true)
  if isContentsGuildHouse then
    (GuildInfoPage._btnGuildWarehouse):SetShow(true)
  else
    ;
    (GuildInfoPage._btnGuildWarehouse):SetShow(false)
  end
  if isContentsGuildInfo then
    (GuildInfoPage._btnGuildWebInfo):SetShow(true)
  else
    ;
    (GuildInfoPage._btnGuildWebInfo):SetShow(false)
    ;
    (GuildInfoPage._btnGuildWarehouse):SetPosX((GuildInfoPage._btnGuildWebInfo):GetPosX())
  end
  ;
  (GuildInfoPage._btnGetArshaHost):SetShow(false)
  if (isGuildMaster or isGuildSubMaster) and isContentsArsha == true and isCanDoReservation == true then
    (GuildInfoPage._btnGetArshaHost):SetShow(true)
  end
  GuildMainInfo_MandateBtn()
  if isGameTypeKR2() then
    (GuildInfoPage._btnChangeMark):SetShow(false)
  end
  if guildCommentsWebUrl ~= nil then
    _Web:SetShow(true)
  end
end

guildCommentsUrlByServiceType = function()
  -- function num : 0_43
  local url = nil
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_KOR_DEV")
  else
    if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_KOR_ALPHA")
    else
      if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_KOR_REAL")
      else
        if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
          if getServiceNationType() == 0 then
            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_URL_NA_ALPHA_NA", "port", worldNo)
          else
            if getServiceNationType() == 1 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_URL_NA_ALPHA_EU", "port", worldNo)
            end
          end
        else
          if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_URL_NA_REAL_NA", "port", worldNo)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_URL_NA_REAL_EU", "port", worldNo)
              end
            end
          else
            if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
              url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_JP_ALPHA")
            else
              if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_JP_REAL")
              else
                if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_RUS_ALPHA")
                else
                  if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                    if isServerFixedCharge() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_RUS_REAL_P2P")
                    else
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_RUS_REAL_F2P")
                    end
                  else
                    if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_TW_ALPHA")
                    else
                      if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_TW_REAL")
                      else
                        if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_SA_ALPHA")
                        else
                          if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_SA_REAL")
                          else
                            if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                              url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_KR2_ALPHA")
                            else
                              if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                                url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_URL_KR2_REAL")
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return url
end

GuildMainInfo_Hide = function()
  -- function num : 0_44 , upvalues : GuildWarInfoPage, _Web, notice_title, notice_edit, notice_btn, introduce_btn, introduce_Reset, introduce_edit_TW, introduce_edit, GuildInfoPage
  (GuildWarInfoPage._txtWarInfoTitle):SetShow(false)
  _Web:SetShow(false)
  notice_title:SetShow(false)
  notice_edit:SetShow(false)
  notice_btn:SetShow(false)
  introduce_btn:SetShow(false)
  introduce_Reset:SetShow(false)
  introduce_edit_TW:SetShow(false)
  introduce_edit:SetShow(false)
  ;
  (GuildInfoPage._txtMaster):SetShow(false)
  ;
  (GuildInfoPage._textGuildInfoTitle):SetShow(false)
  ;
  (GuildInfoPage._guildMainBG):SetShow(false)
  ;
  (GuildInfoPage._iconOccupyTerritory):SetShow(false)
  ;
  (GuildInfoPage._iconGuildMark):SetShow(false)
  ;
  (GuildInfoPage._txtGuildName):SetShow(false)
  ;
  (GuildInfoPage._txtRGuildName):SetShow(false)
  ;
  (GuildInfoPage._txtRMaster):SetShow(false)
  ;
  (GuildInfoPage._txtRRank_Title):SetShow(false)
  ;
  (GuildInfoPage._txtRRank):SetShow(false)
  ;
  (GuildInfoPage._btnIncreaseMember):SetShow(false)
  ;
  (GuildInfoPage._txtGuildPoint):SetShow(false)
  ;
  (GuildInfoPage._txtGuildPointValue):SetShow(false)
  ;
  (GuildInfoPage._txtGuildPointPercent):SetShow(false)
  ;
  (GuildInfoPage._txtGuildMpValue):SetShow(false)
  ;
  (GuildInfoPage._txtGuildMpPercent):SetShow(false)
  ;
  (GuildInfoPage._progressMpPoint):SetShow(false)
  ;
  (GuildInfoPage._btnGuildDel):SetShow(false)
  ;
  (GuildInfoPage._btnChangeMark):SetShow(false)
  ;
  (GuildInfoPage._guildIntroduce_Title):SetShow(false)
  ;
  (GuildInfoPage._guildIntroduce_BG):SetShow(false)
  ;
  (GuildInfoPage._guildBbs_Title):SetShow(false)
  ;
  (GuildInfoPage._guildBbs_BG):SetShow(false)
  ;
  (GuildInfoPage._planning):SetShow(false)
  ;
  (GuildInfoPage._txtProtect):SetShow(false)
  ;
  (GuildInfoPage._txtProtectValue):SetShow(false)
  ;
  (GuildInfoPage._btnProtectAdd):SetShow(false)
  ;
  (GuildInfoPage._txtGuildMoneyTitle):SetShow(false)
  ;
  (GuildInfoPage._txtGuildMoney):SetShow(false)
  ;
  (GuildInfoPage._txtGuildTerritoryTitle):SetShow(false)
  ;
  (GuildInfoPage._txtGuildTerritoryValue):SetShow(false)
  ;
  (GuildInfoPage._txtGuildServantTitle):SetShow(false)
  ;
  (GuildInfoPage._txtGuildServantValue):SetShow(false)
  ;
  (GuildInfoPage._btnGuildWebInfo):SetShow(false)
  ;
  (GuildInfoPage._btnGuildWarehouse):SetShow(false)
  ;
  (GuildInfoPage._btnGetArshaHost):SetShow(false)
  GuildMainInfo_MandateBtn()
end

HandleClicked_TerritoryNameOnEvent = function(isShow)
  -- function num : 0_45 , upvalues : GuildInfoPage
  local self = GuildInfoPage
  local name, desc, control = nil, nil, nil
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local guildArea1 = ""
  local territoryKey = ""
  local territoryWarName = ""
  if myGuildInfo:getTerritoryCount() > 0 then
    for idx = 0, myGuildInfo:getTerritoryCount() - 1 do
      territoryKey = myGuildInfo:getTerritoryKeyAt(idx)
      local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(territoryKey)
      if territoryInfoWrapper ~= nil then
        guildArea1 = territoryInfoWrapper:getTerritoryName()
        local territoryComma = ", "
        if territoryWarName == "" then
          territoryComma = ""
        end
        territoryWarName = territoryWarName .. territoryComma .. guildArea1
      end
    end
    name = territoryWarName
    control = self._txtGuildTerritoryValue
  end
  local guildArea2 = ""
  local regionKey = ""
  local siegeWarName = ""
  if myGuildInfo:getSiegeCount() > 0 then
    for idx = 0, myGuildInfo:getSiegeCount() - 1 do
      regionKey = myGuildInfo:getSiegeKeyAt(idx)
      local regionInfoWrapper = getRegionInfoWrapper(regionKey)
      if regionInfoWrapper ~= nil then
        guildArea2 = regionInfoWrapper:getAreaName()
        local siegeComma = ", "
        if siegeWarName == "" then
          siegeComma = ""
        end
        siegeWarName = siegeWarName .. siegeComma .. guildArea2
      end
    end
    name = siegeWarName
    control = self._txtGuildTerritoryValue
  end
  if isShow then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

HandleClicked_GuildServantCountOnEvent = function(isShow)
  -- function num : 0_46 , upvalues : GuildInfoPage, UI_VT
  local self = GuildInfoPage
  local name, desc, control = nil, nil, nil
  local guildServantElephantCount = guildStable_getServantCount(UI_VT.Type_Elephant)
  local guildServantShipCount = guildStable_getServantCount(UI_VT.Type_SailingBoat)
  local guilServantValueCount = ""
  if guildServantElephantCount > 0 then
    guilServantValueCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_SERVANTCOUNT_ELEPHANT_ONLY", "guildServantElephantCount", guildServantElephantCount)
  end
  if guildServantShipCount > 0 then
    if guildServantElephantCount > 0 then
      guilServantValueCount = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_SERVANTCOUNT_GUILDVEHICLE_BOTH", "guilServantValueCount", guilServantValueCount, "guildServantShipCount", guildServantShipCount)
    else
      guilServantValueCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_SERVANTCOUNT_SAILBOAT_ONLY", "guildServantShipCount", guildServantShipCount)
    end
  end
  if guilServantValueCount ~= nil then
    name = guilServantValueCount
    control = self._txtGuildServantValue
  end
  if isShow then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

FromClient_ResponseGuildUpdate = function()
  -- function num : 0_47 , upvalues : GuildInfoPage, GuildWarInfoPage
  if Panel_Window_Guild:GetShow() == true then
    GuildInfoPage:UpdateData()
    GuildListInfoPage:UpdateData()
    GuildWarInfoPage:UpdateData()
    GuildSkillFrame_Update()
    guildQuest_ProgressingGuildQuest_UpdateRemainTime()
  else
    if Panel_ClanList:GetShow() == true then
      FGlobal_ClanList_Update()
    end
  end
end

FromClient_GuildListUpdate = function(userNo)
  -- function num : 0_48
  if Panel_Window_Guild:GetShow() == true then
    GuildListInfoPage:UpdateVoiceDataByUserNo(userNo)
  end
end

FromClient_EventActorChangeGuildInfo = function()
  -- function num : 0_49 , upvalues : GuildInfoPage
  GuildInfoPage:UpdateData()
end

local messageBox_guild_accept = function()
  -- function num : 0_50
  ToClient_RequestAcceptGuildInvite()
end

local messageBox_guild_refuse = function()
  -- function num : 0_51
  ToClient_RequestRefuseGuildInvite()
end

FromClient_ResponseGuild_refuse = function(questName, s64_joinableTime)
  -- function num : 0_52
  if toInt64(0, 0) < s64_joinableTime then
    local lefttimeText = convertStringFromDatetime(getLeftSecond_TTime64(s64_joinableTime))
    local contentString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_MSGBOX_JOINWAITTIME_CONTENT", "questName", questName, "lefttimeText", lefttimeText)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INVITE"), content = contentString, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
      if myGuildInfo == nil then
        _PA_ASSERT(false, "FromClient_ResponseGuild_refuse 에서 길드 정보�\128 없습니다.")
      end
      local textGuild = ""
      local guildGrade = myGuildInfo:getGuildGrade()
      if guildGrade == 0 then
        textGuild = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN")
      else
        textGuild = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD")
      end
      local contentString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_REFUSE_GUILDINVITE", "name", questName, "guild", textGuild)
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INVITE"), content = contentString, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

FromClient_ResponseGuild_invite = function(s64_guildNo, hostUsername, hostName, guildName, guildGrade, periodDay, benefit, penalty)
  -- function num : 0_53 , upvalues : messageBox_guild_accept, messageBox_guild_refuse
  if guildGrade == 0 then
    local luaGuildTextGuildInviteMsg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN_INVITE_MSG")
    local luaGuildTextGuildInvite = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN_INVITE")
    local contentString = hostUsername .. "(" .. hostName .. ")" .. luaGuildTextGuildInviteMsg
    local messageboxData = {title = luaGuildTextGuildInvite, content = contentString, functionYes = messageBox_guild_accept, functionCancel = messageBox_guild_refuse, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      if guildGrade == 1 then
        FGlobal_AgreementGuild_Open(true, hostUsername, hostName, guildName, periodDay, benefit, penalty, s64_guildNo)
      end
    end
  end
end

messageBox_guildAlliance_accept = function()
  -- function num : 0_54
  ToClient_RequestAcceptGuildAllianceInvite()
end

messageBox_guildAlliance_refuse = function()
  -- function num : 0_55
  ToClient_RequestRefuseGuildAllianceInvite()
end

FromClient_ResponseGuildAlliance_invite = function(hostName)
  -- function num : 0_56
  local luaGuildTextGuildAllianceInviteMsg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDALLIANCE_INVITE_MSG")
  local luaGuildTextGuildAllianceInvite = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDALLIANCE_INVITE")
  local contentString = hostName .. luaGuildTextGuildAllianceInviteMsg
  local messageboxData = {title = luaGuildTextGuildAllianceInvite, content = contentString, functionYes = messageBox_guildAlliance_accept, functionCancel = messageBox_guildAlliance_refuse, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

FromClient_ResponseGuildAlliance_refuse = function(guestName)
  -- function num : 0_57
  local luaGuildTextGuildAllianceRefuseMsg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDALLIANCE_REFUSE_MSG")
  local luaGuildTextGuildAllianceRefuse = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDALLIANCE_REFUSE")
  local contentString = guestName .. luaGuildTextGuildAllianceRefuseMsg
  local messageboxData = {title = luaGuildTextGuildAllianceRefuse, content = contentString, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

FromClient_ResponseUpdateGuildContract = function(notifyType, userNickName, characterName, strParam1, strParam2, s64_param1, s64_param2, s64_param3)
  -- function num : 0_58
  local param1 = Int64toInt32(s64_param1)
  local param2 = Int64toInt32(s64_param2)
  local param3 = Int64toInt32(s64_param3)
  if notifyType == 0 then
    local tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PENSION")
    local guildWrapper = ToClient_GetMyGuildInfoWrapper()
    if guildWrapper == nil then
      return 
    end
    local guildGrade = guildWrapper:getGuildGrade()
    if guildGrade == 1 then
      Proc_ShowMessage_Ack(tempStr)
    end
  else
    do
      if notifyType == 1 then
        local tempStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_DEPOSIT", "userNickName", userNickName, "money", tostring(param1))
        Proc_ShowMessage_Ack(tempStr)
      else
        do
          if notifyType == 2 then
            local isWarehouseGet = FGlobal_GetDailyPay_WarehouseCheckReturn()
            local tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_COLLECTION_INVEN", "money", makeDotMoney(param1))
            if isWarehouseGet == true then
              tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_COLLECTION_WAREHOUSE", "money", makeDotMoney(param1))
            else
              tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_COLLECTION_INVEN", "money", makeDotMoney(param1))
            end
            if param2 == 1 then
              Proc_ShowMessage_Ack(tempStr)
            end
          else
            do
              if notifyType == 3 then
                local tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_HIRE_RENEWAL", "userNickName", userNickName)
                Proc_ShowMessage_Ack(tempStr)
              else
                do
                  if notifyType == 4 then
                    local tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_EXPIRATION", "userNickName", userNickName)
                    Proc_ShowMessage_Ack(tempStr)
                  else
                    do
                      if notifyType == 5 then
                        local periodDay = (getTemporaryInformationWrapper()):getContractedPeriodDay()
                        local benefit = (getTemporaryInformationWrapper()):getContractedBenefit()
                        local penalty = (getTemporaryInformationWrapper()):getContractedPenalty()
                        local guildWrapper = ToClient_GetMyGuildInfoWrapper()
                        if guildWrapper == nil then
                          _PA_ASSERT(false, "길드원이 고용계약서를 받는�\176 길드 정보�\128 없습니다.")
                          return 
                        end
                        local guildName = guildWrapper:getName()
                        FGlobal_AgreementGuild_Open(false, userNickName, characterName, guildName, periodDay, benefit, penalty, guildWrapper:getGuildNo_s64())
                      else
                        do
                          if notifyType == 6 then
                            local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PAYMENTS", "typeMoney", tostring(param2))
                            if param1 ~= 0 then
                              tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UNPAID", "typeMoney", tostring(param2))
                            end
                            Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INCOMETAX", "type", tempTxt))
                          else
                            do
                              if notifyType == 7 then
                                local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_LEAVE", "userNickName", userNickName)
                                if param1 > 0 then
                                  tempTxt = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PENALTIES", "tempTxt", tempTxt, "money", tostring(param1))
                                end
                                Proc_ShowMessage_Ack(tempTxt)
                                Panel_Window_Guild:SetShow(false, true)
                              else
                                do
                                  if notifyType == 8 then
                                    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_FIRE", "userNickName", userNickName)
                                    if param1 > 0 then
                                      tempTxt = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BONUS", "tempTxt", tempTxt, "money", tostring(param1))
                                    end
                                    Proc_ShowMessage_Ack(tempTxt)
                                  else
                                    do
                                      if notifyType == 9 then
                                        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UPGRADES"))
                                      else
                                      end
                                      if notifyType ~= 10 or notifyType == 11 then
                                        local text = ""
                                        if param3 == 1 then
                                          text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BESTMONEY", "money", makeDotMoney(s64_param1))
                                        else
                                          text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_NOTBESTMONEY", "money", makeDotMoney(s64_param1))
                                        end
                                        Proc_ShowMessage_Ack(text)
                                      else
                                        do
                                          if notifyType == 12 then
                                            local text = nil
                                            if param1 == 1 then
                                              text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BIDCANCEL")
                                            else
                                              text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BIDSUCCESS")
                                            end
                                            Proc_ShowMessage_Ack(text)
                                          else
                                            do
                                              if notifyType == 13 then
                                                if toInt64(0, 0) == s64_param1 then
                                                  Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_USEGUILDSHOP_BUY", "userNickName", tostring(userNickName), "param2", makeDotMoney(s64_param2)))
                                                end
                                                if Panel_Window_NpcShop:IsShow() and npcShop_isGuildShopContents() then
                                                  NpcShop_UpdateMoneyWarehouse()
                                                  return 
                                                end
                                              else
                                                if notifyType == 14 then
                                                  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INCENTIVE"))
                                                else
                                                  if notifyType == 15 then
                                                    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PAYMENTS", "typeMoney", tostring(param2))
                                                    if param1 ~= 0 then
                                                      tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UNPAID", "typeMoney", tostring(param2))
                                                    end
                                                    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_HOUSECOSTS", "tempTxt", tempTxt))
                                                  else
                                                    do
                                                      if notifyType == 16 then
                                                        local text = ""
                                                        if param1 == 0 then
                                                          text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_CREATE_CLAN", "name", userNickName)
                                                        else
                                                          text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_CREATE_GUILD", "name", userNickName)
                                                        end
                                                        Proc_ShowMessage_Ack(text)
                                                      else
                                                        do
                                                          do
                                                            -- DECOMPILER ERROR at PC425: Unhandled construct in 'MakeBoolean' P1

                                                            if notifyType == 17 and ToClient_GetMessageFilter(9) == false then
                                                              local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ACCEPT_GUILDQUEST")
                                                              Proc_ShowMessage_Ack(text)
                                                            end
                                                            do
                                                              -- DECOMPILER ERROR at PC441: Unhandled construct in 'MakeBoolean' P1

                                                              if notifyType == 18 and ToClient_GetMessageFilter(9) == false then
                                                                local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_COMPLETE_GUILDQUEST")
                                                                Proc_ShowMessage_Ack(text)
                                                              end
                                                              if notifyType == 19 then
                                                                local regionInfoWrapper = getRegionInfoWrapper(param2)
                                                                if regionInfoWrapper == nil then
                                                                  _PA_ASSERT(false, "성주�\128 마을세금�\132 수금했는�\176 마을 정보�\128 없습니다.")
                                                                  return 
                                                                end
                                                                local text = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_LORD_MOVETAX_TO_GUILDMONEY", "region", regionInfoWrapper:getAreaName(), "silver", makeDotMoney(s64_param1))
                                                                Proc_ShowMessage_Ack(text)
                                                              else
                                                              end
                                                              do
                                                                -- DECOMPILER ERROR at PC492: Unhandled construct in 'MakeBoolean' P1

                                                                if (notifyType ~= 20 or notifyType == 21) and (CppEnums.GuildWarType).GuildWarType_Normal == ToClient_GetGuildWarType() then
                                                                  if param3 == 1 then
                                                                    local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ACCEPT_BATTLE_NO_RESOURCE")
                                                                    Proc_ShowMessage_Ack(text)
                                                                  else
                                                                    do
                                                                      local tendency = param1
                                                                      do
                                                                        local text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_DECLARE_WAR_CONSUME", "silver", makeDotMoney(s64_param2))
                                                                        Proc_ShowMessage_Ack(text)
                                                                        if (((notifyType ~= 22 or notifyType == 23) and notifyType ~= 24) or notifyType == 25) and Panel_GuildWarInfo:GetShow() then
                                                                          if notifyType == 26 then
                                                                            GuildQuestInfoPage:UpdateData()
                                                                          else
                                                                          end
                                                                        end
                                                                        if notifyType ~= 27 or notifyType == 28 then
                                                                          if param1 == 0 then
                                                                            local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMP_DOWN")
                                                                            Proc_ShowMessage_Ack(userNickName .. text)
                                                                          else
                                                                            do
                                                                              do
                                                                                local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMP_UP")
                                                                                Proc_ShowMessage_Ack(userNickName .. text)
                                                                                if Panel_GuildWarInfo:GetShow() then
                                                                                  FromClient_WarInfoContent_Set()
                                                                                end
                                                                                if notifyType == 29 then
                                                                                  if param1 == 0 then
                                                                                    local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_CHEER_GUILD")
                                                                                    Proc_ShowMessage_Ack(userNickName .. text)
                                                                                    FromClient_NotifySiegeScoreToLog()
                                                                                  else
                                                                                    do
                                                                                      FromClient_NotifySiegeScoreToLog()
                                                                                      if Panel_GuildWarInfo:GetShow() then
                                                                                        FromClient_WarInfoContent_Set()
                                                                                      end
                                                                                      do
                                                                                        if notifyType == 30 then
                                                                                          local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DONOT_GUILDQUEST")
                                                                                          Proc_ShowMessage_Ack(text)
                                                                                        else
                                                                                        end
                                                                                        if notifyType ~= 31 or notifyType == 32 then
                                                                                          local regionInfoWrapper = getRegionInfoWrapper(param3)
                                                                                          local areaName = ""
                                                                                          if regionInfoWrapper ~= nil then
                                                                                            areaName = regionInfoWrapper:getAreaName()
                                                                                          end
                                                                                          local characterStaticStatusWarpper = getCharacterStaticStatusWarpper(param2)
                                                                                          local characterName = ""
                                                                                          if characterStaticStatusWarpper ~= nil then
                                                                                            characterName = characterStaticStatusWarpper:getName()
                                                                                          end
                                                                                          local msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BUILDING_AUTODESTROYBUILD", "areaName", areaName, "characterName", characterName)
                                                                                          Proc_ShowMessage_Ack(msg)
                                                                                        else
                                                                                          do
                                                                                            if notifyType == 38 then
                                                                                              local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDE_PAYPROPERTYTAX", "typeMoney", makeDotMoney(s64_param1))
                                                                                              Proc_ShowMessage_Ack(tempTxt)
                                                                                            else
                                                                                              do
                                                                                                if notifyType == 39 then
                                                                                                  local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_GETWELFARE", "typeMoney", makeDotMoney(s64_param1))
                                                                                                  Proc_ShowMessage_Ack(tempTxt)
                                                                                                else
                                                                                                  do
                                                                                                    do
                                                                                                      if notifyType == 43 then
                                                                                                        local tempTxt = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NOTIFYWELFARE")
                                                                                                        Proc_ShowMessage_Ack(tempTxt)
                                                                                                      end
                                                                                                      FromClient_ResponseGuildUpdate()
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

FromClient_NotifyGuildMessage = function(msgType, strParam1, strParam2, s64_param1, s64_param2, s64_param3)
  -- function num : 0_59 , upvalues : lifeType
  local param1 = Int64toInt32(s64_param1)
  local param2 = Int64toInt32(s64_param2)
  local param3 = Int64toInt32(s64_param3)
  if msgType == 0 then
    local message = ""
    if param1 == 0 then
      message = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_CLAN_OUT")
    else
      message = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_GUILD_OUT")
    end
    Proc_ShowMessage_Ack(message)
  else
    do
      if msgType == 1 then
        local message = ""
        if param1 == 0 then
          message = PAGetStringParam1(Defines.StringSheet_GAME, "GAME_MESSAGE_CLANMEMBER_OUT", "familyName", strParam1)
        else
          message = PAGetStringParam1(Defines.StringSheet_GAME, "GAME_MESSAGE_GUILDMEMBER_OUT", "familyName", strParam1)
        end
        Proc_ShowMessage_Ack(message)
      else
        do
          if msgType == 2 then
            local message = ""
            if param1 == 0 then
              message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_JOIN_GUILD", "name", strParam1)
            else
              message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_JOIN_GUILD", "name", strParam1)
            end
            Proc_ShowMessage_Ack(message)
          else
            do
              if msgType == 3 then
                local message = ""
                if param1 == 0 then
                  message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_WHO_JOIN_CLAN", "name", strParam1)
                else
                  message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_WHO_JOIN_GUILD", "name", strParam1)
                end
                Proc_ShowMessage_Ack(message)
              else
                do
                  if msgType == 4 then
                    local message = ""
                    if param1 == 0 then
                      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_CLAN_MSG", "name", strParam1)
                    else
                      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD_MSG", "name", strParam1)
                    end
                    Proc_ShowMessage_Ack(message)
                  else
                    do
                      if msgType == 5 then
                        local textGrade = ""
                        if param1 == 0 then
                          textGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN")
                        else
                          textGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD")
                        end
                        local message = ""
                        if param2 == 0 then
                          message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_EXPEL_SELF", "guild", strParam2)
                        else
                          message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_EXPEL_OTHER", "name", strParam1, "guild", strParam2)
                        end
                        Proc_ShowMessage_Ack(message)
                      else
                        do
                          if msgType == 6 then
                            local message = ""
                            if param1 <= 30 and param2 > 30 then
                              message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_COMPORATETAX_GUILDMEMBERCOUNT", "membercount", "30", "silver", PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERCOUNT_10"))
                            else
                              if param1 <= 50 and param2 > 50 then
                                message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_COMPORATETAX_GUILDMEMBERCOUNT", "membercount", "50", "silver", PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERCOUNT_25"))
                              else
                                if param1 <= 75 and param2 > 75 then
                                  message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_COMPORATETAX_GUILDMEMBERCOUNT", "membercount", "75", "silver", PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERCOUNT_50"))
                                else
                                  message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_INCREASE_GUILDMEMBERCOUNT", "membercount", param2)
                                end
                              end
                            end
                            Proc_ShowMessage_Ack(message)
                          else
                            do
                              if msgType == 7 then
                                local message = ""
                                local characterName = strParam1
                                local userNickName = strParam2
                                if GameOption_ShowGuildLoginMessage() == true then
                                  if param1 == 0 then
                                    message = PAGetStringParam2(Defines.StringSheet_GAME, "GAME_MESSAGE_LOGIN_GUILD_MEMBER", "familyName", userNickName, "characterName", characterName)
                                  else
                                    if param1 == 1 then
                                      message = PAGetStringParam2(Defines.StringSheet_GAME, "GAME_MESSAGE_LOGOUT_GUILD_MEMBER", "familyName", userNickName, "characterName", characterName)
                                    end
                                  end
                                  Proc_ShowMessage_Ack(message)
                                end
                              else
                                do
                                  if msgType == 8 then
                                    local message = ""
                                    local characterName = strParam1
                                    local userNickName = strParam2
                                    if param1 == 1 then
                                      message = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_LOGOUT_GUILD_ALLIANCE_MEMBER") .. " " .. userNickName .. " " .. characterName
                                    end
                                    Proc_ShowMessage_Ack(message)
                                  else
                                    do
                                      if msgType == 9 then
                                        local message = {}
                                        if param1 > 15 then
                                          message.main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERLEVELUP_MAIN", "strParam1", strParam1, "param1", param1)
                                          message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
                                          message.addMsg = ""
                                          Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
                                        end
                                      else
                                        do
                                          if msgType == 10 then
                                            local message = {}
                                            if param1 <= 8 then
                                              local lifeLevel = FGlobal_CraftLevel_Replace(param2, param1)
                                              message.main = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERLIFELEVELUP_MAIN", "strParam1", strParam1, "param1", lifeType[param1], "lifeLevel", lifeLevel)
                                              message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
                                              message.addMsg = ""
                                              Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
                                            end
                                          else
                                            do
                                              if msgType == 11 then
                                                local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(param1))
                                                if itemSSW == nil then
                                                  return 
                                                end
                                                local itemName = itemSSW:getName()
                                                local itemClassify = itemSSW:getItemClassify()
                                                local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
                                                local enchantLevelHigh = 0
                                                if enchantLevel ~= nil and enchantLevel ~= 0 then
                                                  if enchantLevel >= 16 then
                                                    enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel)
                                                  else
                                                    if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemClassify then
                                                      enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel + 15)
                                                    else
                                                      enchantLevelHigh = "+ " .. enchantLevel
                                                    end
                                                  end
                                                end
                                                local message = {}
                                                message.main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERENCHANTSUCCESS_MAIN1", "strParam1", strParam1) .. " " .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERENCHANTSUCCESS_MAIN2", "param1", enchantLevelHigh, "strParam2", itemName)
                                                message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
                                                message.addMsg = ""
                                                Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
                                              else
                                                do
                                                  if msgType == 12 then
                                                    local message = ""
                                                    message = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDDUELWILLBEEND")
                                                    Proc_ShowMessage_Ack(message)
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

FromClient_NotifyGuildMemberDoPk = function(attackerGuildName, attackerUserNickName, attackerCharacterName, deadGuildName, deadUserNickName, deadCharacterName)
  -- function num : 0_60
  local text = ""
  local myGuildMember = attackerUserNickName .. "(" .. attackerCharacterName .. ")"
  local deadUser = deadUserNickName .. "(" .. deadCharacterName .. ")"
  if deadGuildName ~= "" then
    text = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_MEMBER_PK_DO_OTHER_GUILD_MEMBER", "username", myGuildMember, "GuildName", deadGuildName, "targetUserName", deadUser)
  else
    text = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_MEMBER_PK_DO", "username", myGuildMember, "deadUser", deadUser)
  end
  Proc_ShowMessage_Ack(text)
end

FromClient_NotifyGuildMemberKilledOtherPlayer = function(attackerGuildName, attackerUserNickName, attackerCharacterName, deadGuildName, deadUserNickName, deadCharacterName)
  -- function num : 0_61
  local text = ""
  local myGuildMember = attackerUserNickName .. "(" .. attackerCharacterName .. ")"
  local deadUser = deadUserNickName .. "(" .. deadCharacterName .. ")"
  do return  end
  if deadGuildName ~= "" then
    text = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_MEMBER_KILLEDBY_OTHER_GUILD_MEMBER", "username", myGuildMember, "GuildName", deadGuildName, "targetUserName", deadUser)
  else
    text = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_MEMBER_KILLEDBY_PC", "username", myGuildMember, "deadUser", deadUser)
  end
  Proc_ShowMessage_Ack(text)
end

FromClient_ResponseGuildInviteForGuildGrade = function(targetActorKeyRaw, targetName, preGuildActivity)
  -- function num : 0_62
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    _PA_ASSERT(false, "ResponseGuildInviteForGuildGrade 에서 길드 정보�\128 없습니다.")
    return 
  end
  if targetName == nil then
    _PA_ASSERT(false, "targetName 정보�\128 없습니다.")
    return 
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  if guildGrade == 0 then
    toClient_RequestInviteGuild(targetName, 0, 0, 0)
  else
    FGlobal_AgreementGuild_Master_Open_ForJoin(targetActorKeyRaw, targetName, preGuildActivity)
  end
end

FromClient_ResponseDeclareGuildWarToMyGuild = function()
  -- function num : 0_63 , upvalues : GuildWarInfoPage
  if Panel_Window_Guild:GetShow() and (GuildWarInfoPage._btnWarList2):IsCheck() then
    GuildWarInfoPage:UpdateData()
  end
end

SetDATAByGuildGrade = function()
  -- function num : 0_64 , upvalues : GuildInfoPage, GuildLetsWarPage, GuildWarInfoPage, UI_color
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local guildGrade = (myGuildInfo:getGuildGrade())
  local memberData = nil
  local memberCount = myGuildInfo:getMemberCount()
  for memberIdx = 0, memberCount - 1 do
    memberData = myGuildInfo:getMember(memberIdx)
    if memberData:isSelf() then
      break
    end
  end
  do
    if memberData == nil then
      return 
    end
    if guildGrade == 0 then
      (GuildManager.mainBtn_Info):SetEnable(true)
      ;
      (GuildManager.mainBtn_History):SetEnable(false)
      ;
      (GuildManager.mainBtn_Quest):SetEnable(false)
      ;
      (GuildManager.mainBtn_Tree):SetEnable(false)
      ;
      (GuildManager.mainBtn_Warfare):SetEnable(false)
      ;
      (GuildInfoPage._btnChangeMark):SetEnable(false)
      ;
      (GuildLetsWarPage._btnLetsWarDoWar):SetEnable(false)
      ;
      (GuildLetsWarPage._editLetsWarInputName):SetEnable(false)
      ;
      (GuildManager.mainBtn_Info):SetMonoTone(false)
      ;
      (GuildManager.mainBtn_History):SetMonoTone(true)
      ;
      (GuildManager.mainBtn_Quest):SetMonoTone(true)
      ;
      (GuildManager.mainBtn_Tree):SetMonoTone(true)
      ;
      (GuildManager.mainBtn_Warfare):SetMonoTone(true)
      ;
      (GuildInfoPage._btnChangeMark):SetMonoTone(true)
      ;
      (GuildLetsWarPage._btnLetsWarDoWar):SetMonoTone(true)
      ;
      (GuildLetsWarPage._editLetsWarInputName):SetMonoTone(true)
      ;
      (GuildInfoPage._btnTaxPayment):SetShow(false)
      ;
      (GuildInfoPage._txtUnpaidTax):SetShow(false)
      ;
      (GuildInfoPage._btnIncreaseMember):SetShow(false)
      ;
      (GuildListInfoPage._btnPaypal):SetShow(false)
      ;
      (GuildListInfoPage._btnGiveIncentive):SetShow(false)
      ;
      (GuildListInfoPage._btnDeposit):SetShow(false)
      ;
      (GuildListInfoPage._textBusinessFundsBG):SetShow(false)
      ;
      (GuildListInfoPage.decoIcon_Guild):SetShow(false)
      ;
      (GuildListInfoPage.decoIcon_Clan):SetShow(true)
      ;
      (GuildInfoPage._windowTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_CLANNAME"))
      ;
      (GuildInfoPage._textGuildInfoTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_CLANINFO"))
      ;
      (GuildInfoPage._txtGuildName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_CLANNAMING"))
    else
      ;
      (GuildManager.mainBtn_Info):SetEnable(true)
      ;
      (GuildManager.mainBtn_History):SetEnable(true)
      ;
      (GuildManager.mainBtn_Quest):SetEnable(true)
      ;
      (GuildManager.mainBtn_Tree):SetEnable(true)
      ;
      (GuildManager.mainBtn_Warfare):SetEnable(true)
      ;
      (GuildInfoPage._btnChangeMark):SetEnable(true)
      ;
      (GuildManager.mainBtn_Info):SetMonoTone(false)
      ;
      (GuildManager.mainBtn_History):SetMonoTone(false)
      if isGameTypeEnglish() then
        (GuildManager.mainBtn_Quest):SetMonoTone(true)
      else
        ;
        (GuildManager.mainBtn_Quest):SetMonoTone(false)
      end
      ;
      (GuildManager.mainBtn_Tree):SetMonoTone(false)
      ;
      (GuildManager.mainBtn_Warfare):SetMonoTone(false)
      ;
      (GuildInfoPage._btnChangeMark):SetMonoTone(false)
      ;
      (GuildListInfoPage._btnDeposit):SetMonoTone(true)
      local accumulateTax_s64 = myGuildInfo:getAccumulateTax()
      local accumulateCost_s64 = myGuildInfo:getAccumulateGuildHouseCost()
      local businessFunds_s64 = myGuildInfo:getGuildBusinessFunds_s64()
      if toInt64(0, 0) < accumulateTax_s64 or toInt64(0, 0) < accumulateCost_s64 then
        (GuildInfoPage._txtUnpaidTax):SetShow(true)
        if businessFunds_s64 < accumulateTax_s64 or businessFunds_s64 < accumulateCost_s64 then
          (GuildListInfoPage._btnDeposit):SetMonoTone(false)
          ;
          (GuildListInfoPage._btnDeposit):SetEnable(true)
        else
          ;
          (GuildListInfoPage._btnDeposit):SetMonoTone(true)
          ;
          (GuildListInfoPage._btnDeposit):SetEnable(false)
        end
      else
        ;
        (GuildInfoPage._txtUnpaidTax):SetShow(false)
        ;
        (GuildListInfoPage._btnDeposit):SetMonoTone(true)
        ;
        (GuildListInfoPage._btnDeposit):SetEnable(false)
      end
      if ((getSelfPlayer()):get()):isGuildMaster() then
        (GuildWarInfoPage._txtWarInfoTitle):SetSpanSize(50, 395)
        if toInt64(0, 0) < accumulateTax_s64 or toInt64(0, 0) < accumulateCost_s64 then
          (GuildInfoPage._btnTaxPayment):SetShow(true)
        else
          ;
          (GuildInfoPage._btnTaxPayment):SetShow(false)
        end
        if GuildManager._doHaveSeige then
          (GuildListInfoPage._btnGiveIncentive):SetShow(true)
        else
          ;
          (GuildListInfoPage._btnGiveIncentive):SetShow(false)
        end
      else
        if ((getSelfPlayer()):get()):isGuildSubMaster() then
          (GuildWarInfoPage._txtWarInfoTitle):SetSpanSize(50, 395)
          ;
          (GuildInfoPage._btnIncreaseMember):SetShow(false)
          if toInt64(0, 0) < accumulateTax_s64 or toInt64(0, 0) < accumulateCost_s64 then
            (GuildInfoPage._btnTaxPayment):SetShow(true)
          else
            ;
            (GuildInfoPage._btnTaxPayment):SetShow(false)
          end
          ;
          (GuildListInfoPage._btnGiveIncentive):SetShow(false)
        else
          ;
          (GuildWarInfoPage._txtWarInfoTitle):SetSpanSize(50, 395)
          ;
          (GuildInfoPage._btnIncreaseMember):SetShow(false)
          ;
          (GuildInfoPage._btnTaxPayment):SetShow(false)
          ;
          (GuildListInfoPage._btnGiveIncentive):SetShow(false)
        end
      end
      if memberData:isCollectableBenefit() and memberData:isFreeAgent() == false and toInt64(0, 0) < memberData:getContractedBenefit() then
        (GuildListInfoPage._btnPaypal):SetEnable(true)
        ;
        (GuildListInfoPage._btnPaypal):SetMonoTone(false)
        if toInt64(0, 0) == businessFunds_s64 then
          (GuildListInfoPage._btnPaypal):SetFontColor(UI_color.C_FFF26A6A)
        else
          ;
          (GuildListInfoPage._btnPaypal):SetFontColor(UI_color.C_FFC4A68A)
        end
      else
        ;
        (GuildListInfoPage._btnPaypal):SetEnable(false)
        ;
        (GuildListInfoPage._btnPaypal):SetMonoTone(true)
      end
      ;
      (GuildListInfoPage._btnPaypal):SetShow(true)
      ;
      (GuildListInfoPage._textBusinessFundsBG):SetShow(true)
      ;
      (GuildListInfoPage.decoIcon_Guild):SetShow(true)
      ;
      (GuildListInfoPage.decoIcon_Clan):SetShow(false)
      ;
      (GuildInfoPage._windowTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_GUILDNAME"))
      ;
      (GuildInfoPage._textGuildInfoTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_GUILDINFO"))
      ;
      (GuildInfoPage._txtGuildName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_GUILDNAMING"))
    end
  end
end

Guild_onScreenResize = function()
  -- function num : 0_65
  Panel_Window_Guild:SetPosX(getScreenSizeX() / 2 - Panel_Window_Guild:GetSizeX() / 2)
  Panel_Window_Guild:SetPosY(getScreenSizeY() / 2 - Panel_Window_Guild:GetSizeY() / 2)
end

local targetUserNo, targetGuildNo, targetGuildName = nil, nil, nil
FromClient_RequestGuildWar = function(userNo, guildNo, guildName)
  -- function num : 0_66 , upvalues : targetGuildNo, keyUseCheck, targetUserNo, targetGuildName
  if (MessageBox.isPopUp)() and targetGuildNo == guildNo then
    return 
  end
  if isGameTypeJapan() or isGameTypeKR2() then
    keyUseCheck = false
  end
  targetUserNo = userNo
  targetGuildNo = guildNo
  targetGuildName = guildName
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_DECLAREWAR", "guildName", targetGuildName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = FGlobal_AcceptGuildWar, functionNo = FGlobal_RefuseGuildWar, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData, nil, nil, keyUseCheck)
end

FGlobal_AcceptGuildWar = function()
  -- function num : 0_67 , upvalues : targetGuildNo, targetGuildName, targetUserNo
  ToClient_RequestDeclareGuildWar(targetGuildNo, targetGuildName, true)
  targetUserNo = nil
  targetGuildNo = nil
  targetGuildName = nil
end

FGlobal_RefuseGuildWar = function()
  -- function num : 0_68 , upvalues : targetUserNo, targetGuildName, targetGuildNo
  ToClient_RequestRefuseGuildWar(targetUserNo, targetGuildName)
  targetUserNo = nil
  targetGuildNo = nil
  targetGuildName = nil
end

HandleClickedGuildDuel = function(index)
  -- function num : 0_69
  local guildWrapper = ToClient_GetWarringGuildListAt(index)
  local guildNo_s64 = guildWrapper:getGuildNo()
  FGlobal_GuildDuel_Open(guildNo_s64)
end

HandleOnOut_GuildDuelInfo_Tooltip = function(isShow, gIdx, uiIdx)
  -- function num : 0_70 , upvalues : GuildWarInfoPage
  if isShow then
    local guildwarWrapper = ToClient_GetWarringGuildListAt(gIdx)
    local guildNo_s64 = guildwarWrapper:getGuildNo()
    local deadline = ToClient_GetGuildDuelDeadline_s64(guildNo_s64)
    local lefttimeText = convertStringFromDatetime(getLeftSecond_TTime64(deadline))
    local targetKillCount = ToClient_GetGuildDuelTargetKillByGuild(guildNo_s64)
    local fightMoney_s64 = ToClient_GetGuildDuelPrizeByGuild_s64(guildNo_s64)
    local control = ((GuildWarInfoPage._list)[uiIdx])._guildShowbuScore
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDDUEL_INFOTOOLTIP_TITLE")
    local desc = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_GUILDDUEL_INFOTOOLTIP_DESC", "targetKillCount", targetKillCount, "fightMoney", makeDotMoney(fightMoney_s64), "time", lefttimeText)
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

Notice_Init = function()
  -- function num : 0_71 , upvalues : notice_edit, notice_btn
  notice_edit:SetMaxInput(40)
  notice_btn:addInputEvent("Mouse_LUp", "Notice_Regist()")
  notice_edit:addInputEvent("Mouse_LUp", "HandleClicked_NoticeEditSetFocus()")
  notice_edit:RegistReturnKeyEvent("Notice_Regist()")
end

Notice_Regist = function()
  -- function num : 0_72 , upvalues : IM, notice_edit
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  if isGuildMaster == false and isGuildSubMaster == false then
    return 
  end
  local close_function = function()
    -- function num : 0_72_0 , upvalues : IM
    if AllowChangeInputMode() then
      if (UI.checkShowWindow)() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    else
      SetFocusChatting()
    end
  end

  ToClient_RequestSetGuildNotice(tostring(notice_edit:GetEditText()))
  close_function()
  ClearFocusEdit()
end

HandleClicked_NoticeEditSetFocus = function()
  -- function num : 0_73 , upvalues : IM, notice_edit
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetFocusEdit(notice_edit)
  notice_edit:SetEditText(notice_edit:GetEditText(), true)
end

FromClient_ResponseGuildNotice = function()
  -- function num : 0_74 , upvalues : notice_edit
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  if guildWrapper == nil then
    return 
  end
  local guildNotice = guildWrapper:getGuildNotice()
  notice_edit:SetEditText(guildNotice, false)
end

FGlobal_Notice_Update = function()
  -- function num : 0_75
  FGlobal_Notice_AuthorizationUpdate()
end

FGlobal_Notice_AuthorizationUpdate = function()
  -- function num : 0_76 , upvalues : notice_edit, notice_btn
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  if isGuildMaster == true or isGuildSubMaster == true then
    if isGameTypeEnglish() then
      notice_edit:SetSize(500, 28)
      notice_btn:SetSize(100, 30)
      notice_btn:SetSpanSize(45, 140)
    else
      notice_edit:SetSize(550, 28)
      notice_btn:SetSize(50, 30)
      notice_btn:SetSpanSize(45, 140)
    end
    notice_edit:SetIgnore(false)
  else
    notice_edit:SetSize(605, 28)
    notice_edit:SetIgnore(true)
  end
end

FGlobal_GuildNoticeClearFocusEdit = function()
  -- function num : 0_77 , upvalues : IM
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWindow)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

FGlobal_CheckGuildNoticeUiEdit = function(targetUI)
  -- function num : 0_78 , upvalues : notice_edit
  do return targetUI ~= nil and targetUI:GetKey() == notice_edit:GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

Introduce_Init = function()
  -- function num : 0_79 , upvalues : introduce_edit_TW, introduce_edit, introduce_btn, introduce_Reset
  if isGameTypeTaiwan() then
    introduce_edit_TW:SetMaxEditLine(7)
  else
    introduce_edit:SetMaxEditLine(10)
  end
  introduce_edit:SetMaxInput(200)
  introduce_edit_TW:SetMaxInput(200)
  introduce_btn:addInputEvent("Mouse_LUp", "Introduce_Regist()")
  introduce_Reset:addInputEvent("Mouse_LUp", "Introduce_Reset()")
  introduce_edit:addInputEvent("Mouse_LUp", "HandleClicked_IntroduceEditSetFocus()")
  introduce_edit_TW:addInputEvent("Mouse_LUp", "HandleClicked_IntroduceEditSetFocus()")
end

HandleClicked_IntroduceEditSetFocus = function()
  -- function num : 0_80 , upvalues : IM, introduce_edit_TW, introduce_edit
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  if isGameTypeTaiwan() then
    SetFocusEdit(introduce_edit_TW)
    introduce_edit_TW:SetEditText(introduce_edit_TW:GetEditText(), true)
  else
    SetFocusEdit(introduce_edit)
    introduce_edit:SetEditText(introduce_edit:GetEditText(), true)
  end
end

FGlobal_GuildIntroduceClearFocusEdit = function()
  -- function num : 0_81 , upvalues : IM
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWindow)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

Introduce_Regist = function()
  -- function num : 0_82 , upvalues : IM, introduce_edit_TW, introduce_edit
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  if isGuildMaster == false and isGuildSubMaster == false then
    return 
  end
  local close_function = function()
    -- function num : 0_82_0 , upvalues : IM
    if AllowChangeInputMode() then
      if (UI.checkShowWindow)() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    else
      SetFocusChatting()
    end
  end

  if isGameTypeTaiwan() then
    ToClient_RequestSetIntrodution(tostring(introduce_edit_TW:GetEditText()))
  else
    ToClient_RequestSetIntrodution(tostring(introduce_edit:GetEditText()))
  end
  close_function()
  ClearFocusEdit()
end

Introduce_Reset = function()
  -- function num : 0_83 , upvalues : introduce_edit_TW, introduce_edit
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  if isGuildMaster == false and isGuildSubMaster == false then
    return 
  end
  if isGameTypeTaiwan() then
    introduce_edit_TW:SetEditText("", true)
  else
    introduce_edit:SetEditText("", true)
  end
  ToClient_RequestSetIntrodution(tostring(""))
end

GuildIntroduce_Update = function()
  -- function num : 0_84 , upvalues : introduce_edit_TW, introduce_edit
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  if guildWrapper == nil then
    return 
  end
  local guildIntroduce = guildWrapper:getGuildIntrodution()
  if isGameTypeTaiwan() then
    introduce_edit_TW:SetEditText(guildIntroduce, false)
  else
    introduce_edit:SetEditText(guildIntroduce, false)
  end
end

FGlobal_CheckGuildIntroduceUiEdit = function(targetUI)
  -- function num : 0_85 , upvalues : introduce_edit_TW, introduce_edit
  if targetUI == nil or targetUI:GetKey() ~= introduce_edit_TW:GetKey() then
    do return not isGameTypeTaiwan() end
    do return targetUI ~= nil and targetUI:GetKey() == introduce_edit:GetKey() end
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

FromWeb_WebPageError = function(url, statusCode)
  -- function num : 0_86 , upvalues : _urlCache, _Web
  if statusCode ~= 200 then
    return 
  end
  if _urlCache ~= url then
    return 
  end
  local startIndex = (string.find)(url, "?")
  do
    if startIndex ~= nil then
      local _url = (string.sub)(url, 1, startIndex - 1)
      if guildCommentsUrlByServiceType() == _url then
        _Web:SetShow(true)
        return 
      end
    end
    _Web:SetShow(false)
  end
end

HandleClickedGetArshaHost = function()
  -- function num : 0_87 , upvalues : isContentsArsha, isCanDoReservation
  if isContentsArsha == false or isCanDoReservation == false then
    return 
  end
  local isHost = ToClient_IsCompetitionHost()
  local messageBoxMemo = ""
  local func = function()
    -- function num : 0_87_0
    ToClient_RequestGetHostByReservationInfo()
  end

  if isHost == false then
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_LENT_ARSHAHOST")
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_RELEASE_ARSHAHOST")
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = func, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

Guild_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_88 , upvalues : checkPopUp
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if checkPopUp:IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

registerEvent("FromClient_ResponseGuildUpdate", "FromClient_ResponseGuildUpdate")
registerEvent("ResponseGuild_invite", "FromClient_ResponseGuild_invite")
registerEvent("ResponseGuild_refuse", "FromClient_ResponseGuild_refuse")
registerEvent("ResponseGuildAlliance_invite", "FromClient_ResponseGuildAlliance_invite")
registerEvent("ResponseGuildAlliance_refuse", "FromClient_ResponseGuildAlliance_refuse")
registerEvent("EventChangeGuildInfo", "FromClient_EventActorChangeGuildInfo")
registerEvent("FromClient_UpdateGuildContract", "FromClient_ResponseUpdateGuildContract")
registerEvent("FromClient_NotifyGuildMessage", "FromClient_NotifyGuildMessage")
registerEvent("FromClient_GuildInviteForGuildGrade", "FromClient_ResponseGuildInviteForGuildGrade")
registerEvent("FromClient_ResponseDeclareGuildWarToMyGuild ", "FromClient_ResponseDeclareGuildWarToMyGuild")
registerEvent("FromClient_RequestGuildWar", "FromClient_RequestGuildWar")
registerEvent("FromClient_ResponseGuildNotice", "FromClient_ResponseGuildNotice")
registerEvent("FromClient_GuildListUpdate", "FromClient_GuildListUpdate")
registerEvent("FromWeb_WebPageError", "FromWeb_WebPageError")
registerEvent("onScreenResize", "Guild_onScreenResize")
registerEvent("FromClient_luaLoadComplete", "Guild_Init")
Guild_Init = function()
  -- function num : 0_89 , upvalues : isGuildBattle
  GuildManager:initialize()
  GuildMainInfo_Show()
  Notice_Init()
  Introduce_Init()
  ConsoleGroupCreate_Panel_Window_Guild()
  ;
  (GuildManager.mainBtn_GuildBattle):SetShow(isGuildBattle)
end

ConsoleGroupCreate_Panel_Window_Guild = function()
  -- function num : 0_90
  local self = GuildManager
end

ConsoleGroupDelete_Panel_Window_Guild = function()
  -- function num : 0_91
end

Test_GiveMeGuildWelfare = function()
  -- function num : 0_92
  ToClient_RequestguildWelfare()
end


