-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\arsha\panel_arsha.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_Window_Arsha:SetShow(false)
local arshaPvP = {btn_Close = (UI.getChildControl)(Panel_Window_Arsha, "Button_Close"), arshaManagementTitle = (UI.getChildControl)(Panel_Window_Arsha, "StaticText_ArshaManagementTitle"), img_NotAdmin = (UI.getChildControl)(Panel_Window_Arsha, "Static_NotAdminBG"), list2_ArshaWait = (UI.getChildControl)(Panel_Window_Arsha, "List2_ArshaWait"), list2_ArshaObserver = (UI.getChildControl)(Panel_Window_Arsha, "List2_ArshaObserver"), roundWing = (UI.getChildControl)(Panel_Window_Arsha, "Static_RoundWing"), freeWing = (UI.getChildControl)(Panel_Window_Arsha, "Static_FreeWing"), list2_ArshaTeamA = (UI.getChildControl)(Panel_Window_Arsha, "List2_ArshaTeamA"), list2_ArshaTeamB = (UI.getChildControl)(Panel_Window_Arsha, "List2_ArshaTeamB"), btn_AllResurrection = (UI.getChildControl)(Panel_Window_Arsha, "Button_AllResurrection"), btn_InviteList = (UI.getChildControl)(Panel_Window_Arsha, "Button_InviteList"), btn_GoA = (UI.getChildControl)(Panel_Window_Arsha, "Button_GoA"), btn_GoB = (UI.getChildControl)(Panel_Window_Arsha, "Button_GoB"), btn_GameStart = (UI.getChildControl)(Panel_Window_Arsha, "Button_GameStart"), btn_GameStop = (UI.getChildControl)(Panel_Window_Arsha, "Button_GameStop"), btn_GoWait = (UI.getChildControl)(Panel_Window_Arsha, "Button_GoWait"), btn_Exit = (UI.getChildControl)(Panel_Window_Arsha, "Button_Exit"), rdo_SelectWait = (UI.getChildControl)(Panel_Window_Arsha, "Radiobutton_SelectWait"), rdo_SelectWatch = (UI.getChildControl)(Panel_Window_Arsha, "Radiobutton_SelectWatch"), txt_bottomDesc = (UI.getChildControl)(Panel_Window_Arsha, "StaticText_BottomDesc"), btn_Kick_A = (UI.getChildControl)(Panel_Window_Arsha, "Button_Kick_A"), btn_Kick_B = (UI.getChildControl)(Panel_Window_Arsha, "Button_Kick_B"), _isOpen = false, _targetScore = 3, _timeLimit = ToClient_CompetitionMatchTimeLimit(), _levelLimit = 58, _maxPartyMemberCount = 5, _maxWaitTime = 20}
local checkPopUp = (UI.getChildControl)(Panel_Window_Arsha, "CheckButton_PopUp")
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
checkPopUp:SetShow(false)
checkPopUp:addInputEvent("Mouse_LUp", "PaGlobal_Panel_Arsha_PopUp()")
checkPopUp:addInputEvent("Mouse_On", "PaGlobal_Panel_Arsha_ShowIconToolTip( true )")
checkPopUp:addInputEvent("Mouse_Out", "PaGlobal_Panel_Arsha_ShowIconToolTip( false )")
arshaPvP.rdo_RoundMode = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Radiobutton_RoundMode")
arshaPvP.rdo_FreeMode = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Radiobutton_FreeMode")
arshaPvP.chk_ArshaOpen = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Checkbox_ArshaOpen")
arshaPvP.txt_RoundCountTitle = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_RoundCountTitle")
arshaPvP.txt_RoundCount = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_RoundCount")
arshaPvP.btn_RoundCount = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Button_RoundCount")
arshaPvP.txt_LimitTimeTitle = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_LimitTimeTitle")
arshaPvP.txt_LimitMinute = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_LimitMinute")
arshaPvP.txt_LimitMinuteTitle = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_LimitMinuteTitle")
arshaPvP.txt_LimitSecond = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_LimitSecond")
arshaPvP.txt_LimitSecondTitle = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_LimitSecondTitle")
arshaPvP.btn_LimitTime = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Button_LimitTime")
arshaPvP.txt_LimitLevelTitle = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_LimitLevelTitle")
arshaPvP.txt_LimitLevel = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_LimitLevel")
arshaPvP.btn_LimitLevel = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Button_LimitLevel")
arshaPvP.txt_PartyMemberLimitTItle = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_PartyMemberLimitTitle")
arshaPvP.txt_PartyMemberLimitCount = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "StaticText_PartyMemberLimitCount")
arshaPvP.btn_PartyMemberLimit = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Button_PartyMemberLimit")
arshaPvP.chk_WatchMemberInvite = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Checkbox_WatchMemberInvite")
arshaPvP.edit_InviteMemberEdit = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Edit_CharacterName")
arshaPvP.btn_Invite = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Button_Invite")
arshaPvP.btn_NameChange = (UI.getChildControl)(arshaPvP.arshaManagementTitle, "Button_ChangeTeamName")
arshaPvP.roundMark = (UI.getChildControl)(arshaPvP.roundWing, "Static_RoundMark")
arshaPvP.txt_RoundMarkCount = (UI.getChildControl)(arshaPvP.roundWing, "StaticText_RoundCount")
arshaPvP.txt_RoundMarkText = (UI.getChildControl)(arshaPvP.roundWing, "StaticText_RoundText")
arshaPvP.txt_RoundMarkTeamA = (UI.getChildControl)(arshaPvP.roundWing, "StaticText_TeamA")
arshaPvP.txt_RoundMarkTeamB = (UI.getChildControl)(arshaPvP.roundWing, "StaticText_TeamB")
arshaPvP.freeMark = (UI.getChildControl)(arshaPvP.freeWing, "Static_FreeMark")
arshaPvP.txt_FreeMarkCount = (UI.getChildControl)(arshaPvP.freeWing, "StaticText_FreeCount")
arshaPvP.txt_FreeMarkText = (UI.getChildControl)(arshaPvP.freeWing, "StaticText_FreeText")
arshaPvP.txt_modeTitle = (UI.getChildControl)(arshaPvP.img_NotAdmin, "StaticText_NotAdminTitle")
arshaPvP.descBG = (UI.getChildControl)(arshaPvP.img_NotAdmin, "StaticText_DescBG")
local sub_Kick = (UI.getChildControl)(Panel_Window_ArshaPvPSubMenu, "Button_Kick")
local sub_KickAll = (UI.getChildControl)(Panel_Window_ArshaPvPSubMenu, "Button_KickAll")
local sub_teamChange = (UI.getChildControl)(Panel_Window_ArshaPvPSubMenu, "Button_TeamChange")
local sub_Upgrade = (UI.getChildControl)(Panel_Window_ArshaPvPSubMenu, "Button_SubMaster")
ArshaPvP_init = function()
  -- function num : 0_0 , upvalues : arshaPvP, UI_TM, sub_Kick, sub_KickAll, sub_Upgrade, sub_teamChange
  local self = arshaPvP
  ;
  (self.list2_ArshaTeamA):changeAnimationSpeed(10)
  ;
  (self.list2_ArshaTeamA):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ArshaPvP_TeamA_Update")
  ;
  (self.list2_ArshaTeamA):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.list2_ArshaTeamB):changeAnimationSpeed(10)
  ;
  (self.list2_ArshaTeamB):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ArshaPvP_TeamB_Update")
  ;
  (self.list2_ArshaTeamB):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.list2_ArshaWait):changeAnimationSpeed(10)
  ;
  (self.list2_ArshaWait):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ArshaPvP_Wait_Update")
  ;
  (self.list2_ArshaWait):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.list2_ArshaObserver):changeAnimationSpeed(10)
  ;
  (self.list2_ArshaObserver):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ArshaPvP_Observer_Update")
  ;
  (self.list2_ArshaObserver):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.btn_Close):addInputEvent("Mouse_LUp", "FGlobal_ArshaPvP_Close()")
  if ToClient_IsCompetitionHost() then
    (self.arshaManagementTitle):SetShow(true)
    ;
    (self.img_NotAdmin):SetShow(false)
  else
    ;
    (self.arshaManagementTitle):SetShow(false)
    ;
    (self.img_NotAdmin):SetShow(true)
  end
  local matchMode = ToClient_CompetitionMatchType()
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round == matchMode then
    (self.txt_modeTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_TEAMMODE_TITLE"))
    ;
    (self.rdo_RoundMode):SetCheck(true)
    ;
    (self.rdo_FreeMode):SetCheck(false)
    ;
    (self.roundWing):SetShow(true)
    ;
    (self.freeWing):SetShow(false)
    ;
    (self.txt_PartyMemberLimitTItle):SetShow(false)
    ;
    (self.txt_PartyMemberLimitCount):SetShow(false)
    ;
    (self.btn_PartyMemberLimit):SetShow(false)
  else
    if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_FreeForAll == matchMode then
      (self.txt_modeTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ALIVEMODE_TITLE"))
      ;
      (self.rdo_RoundMode):SetCheck(false)
      ;
      (self.rdo_FreeMode):SetCheck(true)
      ;
      (self.roundWing):SetShow(false)
      ;
      (self.freeWing):SetShow(true)
      ;
      (self.txt_PartyMemberLimitTItle):SetShow(true)
      ;
      (self.txt_PartyMemberLimitCount):SetShow(true)
      ;
      (self.btn_PartyMemberLimit):SetShow(true)
    end
  end
  ;
  (self.rdo_SelectWait):SetCheck(true)
  ;
  (self.rdo_SelectWatch):SetCheck(false)
  ;
  (self.list2_ArshaWait):SetShow(true)
  ;
  (self.list2_ArshaObserver):SetShow(false)
  ;
  (self.txt_bottomDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.txt_bottomDesc):SetShow(false)
  ;
  (self.btn_GoA):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_TeamChange(" .. 1 .. ")")
  ;
  (self.btn_GoB):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_TeamChange(" .. 2 .. ")")
  ;
  (self.btn_GoWait):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_TeamChange(" .. 0 .. ")")
  ;
  (self.btn_Exit):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_Exit()")
  ;
  (self.btn_GameStart):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_GameStart()")
  ;
  (self.btn_GameStop):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_GameStop()")
  ;
  (self.rdo_RoundMode):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_ModeChange(" .. (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round .. ")")
  ;
  (self.rdo_FreeMode):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_ModeChange(" .. (CppEnums.CompetitionMatchType).eCompetitionMatchMode_FreeForAll .. ")")
  ;
  (self.rdo_SelectWait):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_WaitAndWatch( 0 )")
  ;
  (self.rdo_SelectWatch):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_WaitAndWatch( 1 )")
  ;
  (self.btn_NameChange):addInputEvent("Mouse_LUp", "Team_NameChangeOpen()")
  ;
  (self.edit_InviteMemberEdit):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_EditSetFocus()")
  ;
  (self.btn_Invite):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_Summon()")
  ;
  (self.edit_InviteMemberEdit):RegistReturnKeyEvent("HandleClicked_ArshaPvP_Summon()")
  ;
  (self.btn_AllResurrection):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_AllPlayerResurrection()")
  ;
  (self.btn_InviteList):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_InviteList()")
  ;
  (self.txt_RoundCount):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_RoundCountSetting()")
  ;
  (self.txt_LimitMinute):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_LimitMinuteSetting()")
  ;
  (self.txt_LimitSecond):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_LimitSecondSetting()")
  ;
  (self.txt_LimitLevel):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_LimitLevelSetting()")
  ;
  (self.txt_PartyMemberLimitCount):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_PartyMemberCountSetting()")
  ;
  (self.btn_RoundCount):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_Setting()")
  ;
  (self.btn_LimitTime):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_Setting()")
  ;
  (self.btn_LimitLevel):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_Setting()")
  ;
  (self.btn_LimitTime):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_Setting()")
  ;
  (self.btn_PartyMemberLimit):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_Setting()")
  ;
  (self.chk_ArshaOpen):addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_OpenOrClose()")
  ;
  (self.rdo_RoundMode):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 0 .. ")")
  ;
  (self.rdo_RoundMode):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.rdo_FreeMode):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 1 .. ")")
  ;
  (self.rdo_FreeMode):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.chk_ArshaOpen):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 2 .. ")")
  ;
  (self.chk_ArshaOpen):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.btn_RoundCount):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 3 .. ")")
  ;
  (self.btn_RoundCount):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.btn_LimitTime):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 4 .. ")")
  ;
  (self.btn_LimitTime):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.btn_LimitLevel):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 5 .. ")")
  ;
  (self.btn_LimitLevel):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.btn_PartyMemberLimit):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 6 .. ")")
  ;
  (self.btn_PartyMemberLimit):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.chk_WatchMemberInvite):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 7 .. ")")
  ;
  (self.chk_WatchMemberInvite):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.btn_AllResurrection):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 9 .. ")")
  ;
  (self.btn_AllResurrection):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.btn_InviteList):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 10 .. ")")
  ;
  (self.btn_InviteList):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.btn_GameStart):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 11 .. ")")
  ;
  (self.btn_GameStart):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.btn_GameStop):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 12 .. ")")
  ;
  (self.btn_GameStop):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.btn_Exit):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 13 .. ")")
  ;
  (self.btn_Exit):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.rdo_SelectWait):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 14 .. ")")
  ;
  (self.rdo_SelectWait):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  ;
  (self.rdo_SelectWatch):addInputEvent("Mouse_On", "ArshaPvP_Simpletooltip(true, " .. 15 .. ")")
  ;
  (self.rdo_SelectWatch):addInputEvent("Mouse_Out", "ArshaPvP_Simpletooltip()")
  sub_Kick:addInputEvent("Mouse_Out", "ArshaPvP_SubMenu_Off()")
  sub_KickAll:addInputEvent("Mouse_Out", "ArshaPvP_SubMenu_Off()")
  sub_Upgrade:addInputEvent("Mouse_Out", "ArshaPvP_SubMenu_Off()")
  sub_teamChange:addInputEvent("Mouse_Out", "ArshaPvP_SubMenu_Off()")
  ;
  (self.btn_Kick_A):addInputEvent("Mouse_LUp", "ArshaPvP_Team_Kick(1, 0)")
  ;
  (self.btn_Kick_B):addInputEvent("Mouse_LUp", "ArshaPvP_Team_Kick(2, 0)")
end

local selectedKey = -1
ArshaPvP_TeamA_Update = function(contents, key)
  -- function num : 0_1 , upvalues : selectedKey
  local idx = Int64toInt32(key)
  selectedKey = idx
  local matchMode = (ToClient_CompetitionMatchType())
  local waitListInfo = nil
  if matchMode == 0 then
    waitListInfo = ToClient_GetTeamUserInfoAt(1, idx)
  else
    local teamInfo = ToClient_GetTeamListAt(idx)
    if teamInfo == nil then
      return 
    end
    waitListInfo = ToClient_GetTeamLeaderInfo(teamInfo:getTeamNo())
  end
  do
    if waitListInfo ~= nil then
      local _txt_Level = (UI.getChildControl)(contents, "StaticText_Level")
      _txt_Level:SetShow(true)
      _txt_Level:SetPosX(7)
      _txt_Level:SetPosY(0)
      local _txt_Class = (UI.getChildControl)(contents, "StaticText_Class")
      _txt_Class:SetShow(true)
      _txt_Class:SetPosX(80)
      _txt_Class:SetPosY(0)
      local _txt_Name = (UI.getChildControl)(contents, "StaticText_Name")
      _txt_Name:SetShow(true)
      _txt_Name:SetPosX(175)
      _txt_Name:SetPosY(0)
      local teamNo = waitListInfo:getTeamNo()
      local userNo = waitListInfo:getUserNo()
      local userLevel = waitListInfo:getCharacterLevel()
      local userClass = waitListInfo:getCharacterClass()
      local userName = waitListInfo:getUserName()
      local characterName = waitListInfo:getCharacterName()
      local isAssistant = waitListInfo:isAssistant()
      _txt_Level:SetText(userLevel)
      _txt_Class:SetText(getCharacterClassName(userClass))
      _txt_Name:SetText(characterName)
      if waitListInfo:isHost() then
        _txt_Name:SetFontColor((Defines.Color).C_FFFFD237)
      else
        if waitListInfo:isAssistant() then
          _txt_Name:SetFontColor((Defines.Color).C_FFB5FF6D)
        else
          _txt_Name:SetFontColor((Defines.Color).C_FFFFFFFF)
        end
      end
      local isHost = ToClient_IsCompetitionHost()
      local isSubHost = ToClient_IsCompetitionAssistant()
      if isHost or isSubHost then
        _txt_Name:addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_TeamSubMenuShow( " .. idx .. ", " .. 0 .. ", " .. tostring(userNo) .. ", " .. tostring(isAssistant) .. " )")
      else
        _txt_Name:addInputEvent("Mouse_LUp", "")
      end
      Panel_Window_ArshaPvPSubMenu:addInputEvent("Mouse_Out", "ArshaPvP_SubMenu_Off()")
    end
  end
end

ArshaPvP_TeamB_Update = function(contents, key)
  -- function num : 0_2 , upvalues : selectedKey
  local idx = Int64toInt32(key)
  selectedKey = idx
  local matchMode = (ToClient_CompetitionMatchType())
  local waitListInfo = nil
  if matchMode == 0 then
    waitListInfo = ToClient_GetTeamUserInfoAt(2, idx)
  else
    waitListInfo = ToClient_GetEntryListAt(idx)
  end
  if waitListInfo ~= nil then
    local _txt_Level = (UI.getChildControl)(contents, "StaticText_Level")
    _txt_Level:SetShow(true)
    _txt_Level:SetPosX(7)
    _txt_Level:SetPosY(0)
    local _txt_Class = (UI.getChildControl)(contents, "StaticText_Class")
    _txt_Class:SetShow(true)
    _txt_Class:SetPosX(80)
    _txt_Class:SetPosY(0)
    local _txt_Name = (UI.getChildControl)(contents, "StaticText_Name")
    _txt_Name:SetShow(true)
    _txt_Name:SetPosX(175)
    _txt_Name:SetPosY(0)
    local matchMode = ToClient_CompetitionMatchType()
    if matchMode == 1 then
      local teamNo = waitListInfo:getTeamNo()
      local userNo = waitListInfo:getUserNo()
      local userLevel = waitListInfo:getCharacterLevel()
      local userClass = waitListInfo:getCharacterClass()
      local characterName = waitListInfo:getCharacterName()
      local isAssistant = waitListInfo:isAssistant()
      _txt_Level:SetText(userLevel)
      _txt_Class:SetText(getCharacterClassName(userClass))
      _txt_Name:SetText(characterName)
      if waitListInfo:isHost() then
        _txt_Name:SetFontColor((Defines.Color).C_FFFFD237)
      else
        if waitListInfo:isAssistant() then
          _txt_Name:SetFontColor((Defines.Color).C_FFB5FF6D)
        else
          _txt_Name:SetFontColor((Defines.Color).C_FFFFFFFF)
        end
      end
      local isHost = ToClient_IsCompetitionHost()
      local isSubHost = ToClient_IsCompetitionAssistant()
      if isHost or isSubHost then
        _txt_Name:addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_TeamSubMenuShow( " .. idx .. ", " .. 1 .. ", " .. tostring(userNo) .. ", " .. tostring(isAssistant) .. " )")
      else
        _txt_Name:addInputEvent("Mouse_LUp", "")
      end
      Panel_Window_ArshaPvPSubMenu:addInputEvent("Mouse_Out", "ArshaPvP_SubMenu_Off()")
    end
  end
end

ArshaPvP_Wait_Update = function(contents, key)
  -- function num : 0_3 , upvalues : selectedKey
  local idx = Int64toInt32(key)
  selectedKey = idx
  local waitListInfo = ToClient_GetTeamUserInfoAt(0, idx)
  if waitListInfo ~= nil and waitListInfo:getTeamNo() == 0 then
    local _txt_Level = (UI.getChildControl)(contents, "StaticText_Level")
    _txt_Level:SetShow(true)
    _txt_Level:SetPosX(7)
    _txt_Level:SetPosY(5)
    local _txt_Class = (UI.getChildControl)(contents, "StaticText_Class")
    _txt_Class:SetShow(true)
    _txt_Class:SetPosX(73)
    _txt_Class:SetPosY(5)
    local _txt_Name = (UI.getChildControl)(contents, "StaticText_Name")
    _txt_Name:SetShow(true)
    _txt_Name:SetPosX(200)
    _txt_Name:SetPosY(5)
    local teamNo = waitListInfo:getTeamNo()
    local userNo = waitListInfo:getUserNo()
    local userLevel = waitListInfo:getCharacterLevel()
    local userClass = waitListInfo:getCharacterClass()
    local characterName = waitListInfo:getCharacterName()
    local isAssistant = waitListInfo:isAssistant()
    _txt_Level:SetText(userLevel)
    _txt_Class:SetText(getCharacterClassName(userClass))
    _txt_Name:SetText(characterName)
    if waitListInfo:isHost() then
      _txt_Name:SetFontColor((Defines.Color).C_FFFFD237)
    else
      if waitListInfo:isAssistant() then
        _txt_Name:SetFontColor((Defines.Color).C_FFB5FF6D)
      else
        _txt_Name:SetFontColor((Defines.Color).C_FFFFFFFF)
      end
    end
    local isHost = ToClient_IsCompetitionHost()
    local isSubHost = ToClient_IsCompetitionAssistant()
    if isHost or isSubHost then
      _txt_Name:addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_TeamSubMenuShow( " .. idx .. ", " .. 2 .. ", " .. tostring(userNo) .. ", " .. tostring(isAssistant) .. " )")
    else
      _txt_Name:addInputEvent("Mouse_LUp", "")
    end
    Panel_Window_ArshaPvPSubMenu:addInputEvent("Mouse_Out", "ArshaPvP_SubMenu_Off()")
  end
end

ArshaPvP_Observer_Update = function(contents, key)
  -- function num : 0_4 , upvalues : selectedKey
  local idx = Int64toInt32(key)
  selectedKey = idx
  local waitListInfo = ToClient_GetObserverListAt(idx)
  if waitListInfo ~= nil then
    local _txt_Level = (UI.getChildControl)(contents, "StaticText_Level")
    _txt_Level:SetShow(true)
    _txt_Level:SetPosX(7)
    _txt_Level:SetPosY(5)
    local _txt_Class = (UI.getChildControl)(contents, "StaticText_Class")
    _txt_Class:SetShow(true)
    _txt_Class:SetPosX(73)
    _txt_Class:SetPosY(5)
    local _txt_Name = (UI.getChildControl)(contents, "StaticText_Name")
    _txt_Name:SetShow(true)
    _txt_Name:SetPosX(200)
    _txt_Name:SetPosY(5)
    local teamNo = waitListInfo:getTeamNo()
    local userNo = waitListInfo:getUserNo()
    local userLevel = waitListInfo:getCharacterLevel()
    local userClass = waitListInfo:getCharacterClass()
    local characterName = waitListInfo:getCharacterName()
    local isAssistant = waitListInfo:isAssistant()
    _txt_Level:SetText(userLevel)
    _txt_Class:SetText(getCharacterClassName(userClass))
    _txt_Name:SetText(characterName)
    if waitListInfo:isHost() then
      _txt_Name:SetFontColor((Defines.Color).C_FFFFD237)
    else
      if waitListInfo:isAssistant() then
        _txt_Name:SetFontColor((Defines.Color).C_FFB5FF6D)
      else
        _txt_Name:SetFontColor((Defines.Color).C_FFFFFFFF)
      end
    end
    local isHost = ToClient_IsCompetitionHost()
    local isSubHost = ToClient_IsCompetitionAssistant()
    if isHost or isSubHost then
      _txt_Name:addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_TeamSubMenuShow( " .. idx .. ", " .. 3 .. ", " .. tostring(userNo) .. ", " .. tostring(isAssistant) .. " )")
    else
      _txt_Name:addInputEvent("Mouse_LUp", "")
    end
    Panel_Window_ArshaPvPSubMenu:addInputEvent("Mouse_Out", "ArshaPvP_SubMenu_Off()")
  end
end

ArshaPvP_SelectedUpdate_Round = function()
  -- function num : 0_5 , upvalues : arshaPvP
  local self = arshaPvP
  local ListTeamACount = ToClient_GetTeamUserInfoCount(1)
  ;
  ((self.list2_ArshaTeamA):getElementManager()):clearKey()
  if ListTeamACount > 0 then
    for idx = 0, ListTeamACount - 1 do
      ((self.list2_ArshaTeamA):getElementManager()):pushKey(toInt64(0, idx))
    end
  end
  do
    local ListTeamBCount = ToClient_GetTeamUserInfoCount(2)
    ;
    ((self.list2_ArshaTeamB):getElementManager()):clearKey()
    if ListTeamBCount > 0 then
      for idx = 0, ListTeamBCount - 1 do
        ((self.list2_ArshaTeamB):getElementManager()):pushKey(toInt64(0, idx))
      end
    end
    do
      local ListWaitCount = ToClient_GetTeamUserInfoCount(0)
      ;
      ((self.list2_ArshaWait):getElementManager()):clearKey()
      if ListWaitCount > 0 then
        for idx = 0, ListWaitCount - 1 do
          ((self.list2_ArshaWait):getElementManager()):pushKey(toInt64(0, idx))
        end
      end
      do
        local ListObserverCount = ToClient_GetObserverListCount()
        ;
        ((self.list2_ArshaObserver):getElementManager()):clearKey()
        if ListObserverCount > 0 then
          for idx = 0, ListObserverCount - 1 do
            ((self.list2_ArshaObserver):getElementManager()):pushKey(toInt64(0, idx))
          end
        end
        do
          local teamA_Info = ToClient_GetTeamListAt(0)
          local teamB_Info = ToClient_GetTeamListAt(1)
          local teamA_Name = ""
          local teamB_Name = ""
          if teamA_Info ~= nil and teamB_Info ~= nil then
            teamA_Name = teamA_Info:getTeamName()
            teamB_Name = teamB_Info:getTeamName()
          end
          if teamA_Name == "" or teamB_Name == "" then
            teamA_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A")
            teamB_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B")
          end
          ;
          (self.txt_RoundMarkTeamA):SetText(teamA_Name)
          ;
          (self.txt_RoundMarkTeamB):SetText(teamB_Name)
        end
      end
    end
  end
end

ArshaPvP_SelectedUpdate_FreeForAll = function()
  -- function num : 0_6 , upvalues : arshaPvP
  local self = arshaPvP
  local tempidx = 0
  local ListPartyMasterCount = ToClient_GetTeamListCountWithOutZero()
  ;
  ((self.list2_ArshaTeamA):getElementManager()):clearKey()
  if ListPartyMasterCount > 0 then
    for idx = 0, ListPartyMasterCount - 1 do
      ((self.list2_ArshaTeamA):getElementManager()):pushKey(toInt64(0, idx))
    end
  end
  do
    local ListAllUserCount = ToClient_GetEntryListCount()
    ;
    ((self.list2_ArshaTeamB):getElementManager()):clearKey()
    if ListAllUserCount > 0 then
      for idx = 0, ListAllUserCount - 1 do
        ((self.list2_ArshaTeamB):getElementManager()):pushKey(toInt64(0, idx))
      end
    end
    do
      local ListWaitCount = ToClient_GetTeamUserInfoCount(0)
      ;
      ((self.list2_ArshaWait):getElementManager()):clearKey()
      if ListWaitCount > 0 then
        for idx = 0, ListWaitCount - 1 do
          ((self.list2_ArshaWait):getElementManager()):pushKey(toInt64(0, idx))
        end
      end
      do
        local ListObserverCount = ToClient_GetObserverListCount()
        ;
        ((self.list2_ArshaObserver):getElementManager()):clearKey()
        if ListObserverCount > 0 then
          for idx = 0, ListObserverCount - 1 do
            ((self.list2_ArshaObserver):getElementManager()):pushKey(toInt64(0, idx))
          end
        end
      end
    end
  end
end

FGlobal_ArshaPvP_ChangeAssistant = function(userNo_s64, isAssistant)
  -- function num : 0_7
  local ChangeAssistantUser = function()
    -- function num : 0_7_0 , upvalues : userNo_s64, isAssistant
    ToClient_RequestChangeAssistans(userNo_s64, isAssistant)
  end

  local userinfo = ToClient_GetCompetitionDefinedUser(userNo_s64)
  local characterName = ""
  if userinfo ~= nil then
    characterName = userinfo:getCharacterName()
  end
  local message = nil
  if isAssistant == true then
    message = "LUA_COMPETITION_REQUEST_SET_ASSISTANT"
  else
    message = "LUA_COMPETITION_REQUEST_RELEASE_ASSISTANT"
  end
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, message, "name", characterName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = ChangeAssistantUser, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_ArshaPvP_ChangeTeam = function(teamNo, userNo, isObserver)
  -- function num : 0_8
  if teamNo == -1 then
    txt_teamNo:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_OBSERVER"))
  end
  ToClient_RequestSetTeam(userNo, teamNo)
  ClearFocusEdit()
end

FGlobal_CheckArshaPvpUiEdit = function(targetUI)
  -- function num : 0_9 , upvalues : arshaPvP
  do
    local self = arshaPvP
    do return targetUI ~= nil and targetUI:GetKey() == (self.edit_InviteMemberEdit):GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

HandleClicked_ArshaPvP_EditSetFocus = function()
  -- function num : 0_10 , upvalues : arshaPvP
  local self = arshaPvP
  SetFocusEdit(self.edit_InviteMemberEdit)
  ;
  (self.edit_InviteMemberEdit):SetEditText((self.edit_InviteMemberEdit):GetEditText(), true)
end

FGlobal_ArshaPvPClearFocusEdit = function()
  -- function num : 0_11
  ClearFocusEdit()
  CheckChattingInput()
end

HandleClicked_ArshaPvP_TeamChange = function(teamNo)
  -- function num : 0_12
  if getSelfPlayer() == nil then
    return 
  end
  local userNo = ((getSelfPlayer()):get()):getUserNo()
  ToClient_RequestSetTeam(userNo, teamNo)
end

ArshaPvP_RefreshUpdate = function()
  -- function num : 0_13 , upvalues : arshaPvP
  local self = arshaPvP
  local matchMode = ToClient_CompetitionMatchType()
  local isHost = ToClient_IsCompetitionHost()
  local isSubHost = ToClient_IsCompetitionAssistant()
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round == matchMode then
    (self.rdo_RoundMode):SetCheck(true)
    ;
    (self.rdo_FreeMode):SetCheck(false)
    ;
    (self.roundWing):SetShow(true)
    ;
    (self.freeWing):SetShow(false)
  else
    if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_FreeForAll == matchMode then
      (self.rdo_RoundMode):SetCheck(false)
      ;
      (self.rdo_FreeMode):SetCheck(true)
      ;
      (self.roundWing):SetShow(false)
      ;
      (self.freeWing):SetShow(true)
    end
  end
  if isHost then
    (self.btn_GoA):SetShow(true)
    ;
    (self.btn_GoB):SetShow(true)
    ;
    (self.btn_GoWait):SetShow(true)
    ;
    (self.btn_GameStart):SetShow(true)
    ;
    (self.btn_GameStop):SetShow(true)
    ;
    (self.btn_Exit):SetShow(true)
    ;
    (self.btn_AllResurrection):SetShow(true)
    ;
    (self.btn_InviteList):SetShow(true)
    ;
    (self.btn_NameChange):SetShow(true)
  else
    if isSubHost then
      (self.btn_GoA):SetShow(true)
      ;
      (self.btn_GoB):SetShow(true)
      ;
      (self.btn_GoWait):SetShow(true)
      ;
      (self.btn_GameStart):SetShow(false)
      ;
      (self.btn_GameStop):SetShow(false)
      ;
      (self.btn_Exit):SetShow(true)
      ;
      (self.btn_AllResurrection):SetShow(false)
      ;
      (self.btn_InviteList):SetShow(true)
      ;
      (self.btn_NameChange):SetShow(true)
    else
      local isHost = ToClient_IsCompetitionHost()
      local isSubHost = ToClient_IsCompetitionAssistant()
      local isCanChangeTeam = ToClient_IsMyselfInEntryUser() and ((matchMode == 0 and not isHost and not isSubHost))
      ;
      (self.btn_GoA):SetShow(isCanChangeTeam)
      ;
      (self.btn_GoB):SetShow(isCanChangeTeam)
      ;
      (self.btn_GoWait):SetShow(isCanChangeTeam)
      ;
      (self.btn_Exit):SetShow(true)
      ;
      (self.btn_GameStart):SetShow(false)
      ;
      (self.btn_GameStop):SetShow(false)
      ;
      (self.btn_AllResurrection):SetShow(false)
      ;
      (self.btn_InviteList):SetShow(false)
      ;
      (self.btn_NameChange):SetShow(false)
    end
  end
  self._targetScore = ToClient_GetTargetScore()
  self._timeLimit = ToClient_CompetitionMatchTimeLimit()
  self._levelLimit = ToClient_GetLevelLimit()
  self._maxPartyMemberCount = ToClient_GetMaxPartyMemberCount()
  ArshaPvP_Widget_Update()
  ArshaPvP_SubMenu_ButtonPosition()
  local isLimitSecondTime = self._timeLimit
  local limitMinuteTime = 0
  do
    local limitSecondTime = 0
    if isLimitSecondTime >= 60 then
      limitMinuteTime = (math.floor)(isLimitSecondTime / 60)
      limitSecondTime = (math.ceil)(isLimitSecondTime % 60)
    else
      limitSecondTime = isLimitSecondTime
    end
    ;
    (self.txt_RoundCount):SetText(self._targetScore)
    ;
    (self.txt_LimitMinute):SetText(limitMinuteTime)
    ;
    (self.txt_LimitSecond):SetText(limitSecondTime)
    ;
    (self.txt_LimitLevel):SetText(self._levelLimit)
    ;
    (self.txt_PartyMemberLimitCount):SetText(self._maxPartyMemberCount)
    -- DECOMPILER ERROR: 5 unprocessed JMP targets
  end
end

HandleClicked_ArshaPvP_GameStart = function()
  -- function num : 0_14 , upvalues : arshaPvP
  local self = arshaPvP
  local targetScore = ToClient_GetTargetScore()
  ToClient_RequestSetFight((CppEnums.CompetitionFightState).eCompetitionFightState_Wait, targetScore)
end

HandleClicked_ArshaPvP_GameStop = function()
  -- function num : 0_15
  ToClient_RequestSetFight((CppEnums.CompetitionFightState).eCompetitionFightState_Done)
end

HandleClicked_ArshaPvP_Exit = function()
  -- function num : 0_16
  local ArshaPvP_Exit = function()
    -- function num : 0_16_0
    ToClient_RequestLeaveMyself()
  end

  local isHost = ToClient_IsCompetitionHost()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_EXIT_BTN_DESC_MESSAGEBOX_NORMAL")
  if isHost then
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_EXIT_BTN_DESC_MESSAGEBOX_HOST")
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_EXIT_BTN_DESC_MESSAGEBOX_NORMAL")
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = ArshaPvP_Exit, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_ArshaPvP_ModeChange = function(matchMode)
  -- function num : 0_17 , upvalues : arshaPvP
  local self = arshaPvP
  local isHost = ToClient_IsCompetitionHost()
  local isSubHost = ToClient_IsCompetitionAssistant()
  ToClient_CompetitionMatchTypeChange(matchMode)
  if matchMode == 0 then
    (self.txt_RoundCountTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ROUNDOFWIN_TITLE"))
    ;
    (self.txt_PartyMemberLimitTItle):SetShow(false)
    ;
    (self.txt_PartyMemberLimitCount):SetShow(false)
    ;
    (self.btn_PartyMemberLimit):SetShow(false)
    if isHost or isSubHost then
      (self.btn_Kick_A):SetShow(true)
      ;
      (self.btn_Kick_B):SetShow(true)
    else
      ;
      (self.btn_Kick_A):SetShow(false)
      ;
      (self.btn_Kick_B):SetShow(false)
    end
  else
    if matchMode == 1 then
      (self.txt_RoundCountTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ROUNDOFALIVE_TITLE"))
      ;
      (self.txt_PartyMemberLimitTItle):SetShow(true)
      ;
      (self.txt_PartyMemberLimitCount):SetShow(true)
      ;
      (self.btn_PartyMemberLimit):SetShow(true)
      ;
      (self.btn_Kick_A):SetShow(false)
      ;
      (self.btn_Kick_B):SetShow(false)
    end
  end
  ToClient_RequestCompetitionOption(self._isOpen, self._timeLimit, self._targetScore, self._levelLimit, self._maxPartyMemberCount, self._maxWaitTime)
end

HandleClicked_ArshaPvP_Setting = function()
  -- function num : 0_18 , upvalues : arshaPvP
  local self = arshaPvP
  local matchMode = ToClient_CompetitionMatchType()
  local targetScore = ToClient_GetTargetScore()
  local limitTimeSum = 0
  if tonumber((self.txt_LimitMinute):GetText()) > 0 then
    limitTimeSum = tonumber((self.txt_LimitMinute):GetText()) * 60
  end
  if tonumber((self.txt_LimitSecond):GetText()) > 0 then
    limitTimeSum = limitTimeSum + tonumber((self.txt_LimitSecond):GetText())
  end
  self._timeLimit = limitTimeSum
  self._targetScore = tonumber((self.txt_RoundCount):GetText())
  self._levelLimit = tonumber((self.txt_LimitLevel):GetText())
  self._maxPartyMemberCount = tonumber((self.txt_PartyMemberLimitCount):GetText())
  self._maxWaitTime = 20
  if self._isOpen == true then
    (self.chk_ArshaOpen):SetCheck(false)
  else
    ;
    (self.chk_ArshaOpen):SetCheck(true)
  end
  if matchMode == 0 then
    local roundCount = targetScore * 2 - 1
    ;
    (self.descBG):SetText(PAGetStringParam4(Defines.StringSheet_GAME, "LUA_ARSHA_USER_DESC_GAMEPROGRESSES_ROUND", "limitTimeSum", limitTimeSum, "level", ToClient_GetLevelLimit(), "round", roundCount, "targetScore", targetScore))
    ;
    (self.txt_RoundMarkCount):SetText(roundCount)
    ;
    (self.txt_RoundCountTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ROUNDOFWIN_TITLE"))
  else
    do
      if matchMode == 1 then
        (self.descBG):SetText(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_ARSHA_USER_DESC_GAMEPROGRESSES_FREE", "limitTimeSum", limitTimeSum, "level", ToClient_GetLevelLimit(), "targetScore", targetScore))
        ;
        (self.txt_FreeMarkCount):SetText(targetScore)
        ;
        (self.txt_RoundCountTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ROUNDOFALIVE_TITLE"))
      end
      ;
      (self.descBG):SetSize((self.descBG):GetSizeX(), (self.descBG):GetTextSizeY() + 10)
      ;
      (self.descBG):ComputePos()
      ToClient_RequestCompetitionOption(self._isOpen, self._timeLimit, self._targetScore, self._levelLimit, self._maxPartyMemberCount, self._maxWaitTime)
    end
  end
end

HandleClicked_ArshaPvP_ChangeOption = function()
  -- function num : 0_19 , upvalues : arshaPvP
  local self = arshaPvP
  local matchMode = ToClient_CompetitionMatchType()
  do
    local targetScore = ToClient_GetTargetScore()
    if matchMode == 0 then
      (self.txt_modeTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_TEAMMODE_TITLE"))
      ;
      (self.txt_RoundCountTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ROUNDOFWIN_TITLE"))
      ;
      (self.txt_RoundMarkCount):SetText(targetScore * 2 - 1)
      ;
      (self.txt_RoundMarkText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_USER_OPTION_ROUND_FORCOUNT", "targetScore", targetScore))
    else
      if targetScore == 1 and matchMode == 1 then
        (self.txt_modeTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ALIVEMODE_TITLE"))
        ;
        (self.txt_RoundCountTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ROUNDOFALIVE_TITLE"))
        ;
        (self.txt_FreeMarkCount):SetText(targetScore)
        ;
        (self.txt_FreeMarkText):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ALIVEMODE_TITLE"))
      end
    end
    if targetScore <= 0 then
    end
  end
end

HandleClicked_ArshaPvP_WaitAndWatch = function(selectType)
  -- function num : 0_20 , upvalues : arshaPvP
  local self = arshaPvP
  local isWaitList = (self.rdo_SelectWait):IsCheck()
  local isWatchList = (self.rdo_SelectWatch):IsCheck()
  ArshaPvP_SubMenu_PowerOff()
  local isHost = ToClient_IsCompetitionHost()
  local isSubHost = ToClient_IsCompetitionAssistant()
  if isWaitList then
    (self.rdo_SelectWait):SetCheck(true)
    ;
    (self.rdo_SelectWatch):SetCheck(false)
    ;
    (self.list2_ArshaWait):SetShow(true)
    ;
    (self.list2_ArshaObserver):SetShow(false)
  else
    if isWatchList then
      (self.rdo_SelectWait):SetCheck(false)
      ;
      (self.rdo_SelectWatch):SetCheck(true)
      ;
      (self.list2_ArshaWait):SetShow(false)
      ;
      (self.list2_ArshaObserver):SetShow(true)
    end
  end
  ArshaPvP_SubMenu_ButtonPosition()
end

HandleClicked_ArshaPvP_Summon = function()
  -- function num : 0_21 , upvalues : arshaPvP
  local self = arshaPvP
  local characterName = (self.edit_InviteMemberEdit):GetEditText()
  local isObserver = (self.chk_WatchMemberInvite):IsCheck()
  if characterName == nil or characterName == "" then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SUMMON_ACK"))
    return 
  end
  ToClient_RequestInviteCompetition(characterName, isObserver)
  ClearFocusEdit()
end

HandleClicked_ArshaPvP_AllPlayerResurrection = function()
  -- function num : 0_22
  ToClient_RequestRebirthPlayerAll()
end

HandleClicked_ArshaPvP_InviteList = function()
  -- function num : 0_23
  FGlobal_ArshaPvP_InviteList_Open()
end

HandleClicked_ArshaPvP_RoundCountSetting = function()
  -- function num : 0_24
  local s64_maxNumber = toInt64(0, 10)
  Panel_NumberPad_Show(true, s64_maxNumber, param, ArshaPvP_RoundCountConfirmFunction)
end

ArshaPvP_RoundCountConfirmFunction = function(inputNumber, param)
  -- function num : 0_25 , upvalues : arshaPvP
  local self = arshaPvP
  ;
  (self.txt_RoundCount):SetText(Int64toInt32(inputNumber))
end

HandleClicked_ArshaPvP_LimitMinuteSetting = function()
  -- function num : 0_26
  local s64_maxNumber = toInt64(0, 60)
  Panel_NumberPad_Show(true, s64_maxNumber, param, ArshaPvP_LimitMinuteConfirmFunction)
end

ArshaPvP_LimitMinuteConfirmFunction = function(inputNumber, param)
  -- function num : 0_27 , upvalues : arshaPvP
  local self = arshaPvP
  ;
  (self.txt_LimitSecond):SetText(0)
  ;
  (self.txt_LimitMinute):SetText(Int64toInt32(inputNumber))
end

HandleClicked_ArshaPvP_LimitSecondSetting = function()
  -- function num : 0_28 , upvalues : arshaPvP
  local self = arshaPvP
  local s64_maxNumber = toInt64(0, 60)
  if tonumber((self.txt_LimitMinute):GetText()) >= 5 then
    return 
  end
  Panel_NumberPad_Show(true, s64_maxNumber, param, ArshaPvP_LimitSecondConfirmFunction)
end

ArshaPvP_LimitSecondConfirmFunction = function(inputNumber, param)
  -- function num : 0_29 , upvalues : arshaPvP
  local self = arshaPvP
  if tonumber((self.txt_LimitMinute):GetText()) > 5 then
    (self.txt_LimitSecond):SetText(0)
    return 
  end
  ;
  (self.txt_LimitSecond):SetText(Int64toInt32(inputNumber))
end

HandleClicked_ArshaPvP_LimitLevelSetting = function()
  -- function num : 0_30 , upvalues : arshaPvP
  local self = arshaPvP
  local s64_maxNumber = toInt64(0, 99)
  Panel_NumberPad_Show(true, s64_maxNumber, param, ArshaPvP_LimitLevelConfirmFunction)
end

ArshaPvP_LimitLevelConfirmFunction = function(inputNumber, param)
  -- function num : 0_31 , upvalues : arshaPvP
  local self = arshaPvP
  ;
  (self.txt_LimitLevel):SetText(Int64toInt32(inputNumber))
end

HandleClicked_ArshaPvP_PartyMemberCountSetting = function()
  -- function num : 0_32 , upvalues : arshaPvP
  local self = arshaPvP
  local s64_maxNumber = toInt64(0, 5)
  Panel_NumberPad_Show(true, s64_maxNumber, param, ArshaPvP_PartyMemberConfirmFunction)
end

ArshaPvP_PartyMemberConfirmFunction = function(inputNumber, param)
  -- function num : 0_33 , upvalues : arshaPvP
  local self = arshaPvP
  ;
  (self.txt_PartyMemberLimitCount):SetText(Int64toInt32(inputNumber))
end

HandleClicked_ArshaPvP_TeamSubMenuShow = function(idx, controlType, userNo_s64, isAssistant)
  -- function num : 0_34 , upvalues : arshaPvP, sub_Kick, sub_KickAll, sub_Upgrade, sub_teamChange
  local self = arshaPvP
  local isHost = ToClient_IsCompetitionHost()
  local isSubHost = ToClient_IsCompetitionAssistant()
  local isMatchType = ToClient_CompetitionMatchType()
  local contents = (self.list2_ArshaTeamA):GetContentByKey(toInt64(0, idx))
  Panel_Window_ArshaPvPSubMenu:SetSize(162, 150)
  sub_Kick:SetPosY(6)
  sub_KickAll:SetPosY(42)
  sub_Upgrade:SetPosY(77)
  sub_teamChange:SetPosY(112)
  if controlType == 0 then
    contents = (self.list2_ArshaTeamA):GetContentByKey(toInt64(0, idx))
    if isHost then
      if isMatchType == 1 then
        Panel_Window_ArshaPvPSubMenu:SetSize(162, 110)
        sub_teamChange:SetShow(false)
        sub_Upgrade:SetPosY(77)
        sub_teamChange:SetPosY(112)
      else
        sub_KickAll:addInputEvent("Mouse_LUp", "ArshaPvP_Team_Kick(1, " .. 0 .. ")")
        Panel_Window_ArshaPvPSubMenu:SetSize(162, 150)
        sub_teamChange:SetShow(true)
        sub_Upgrade:SetPosY(77)
        sub_teamChange:SetPosY(112)
      end
      sub_Kick:SetShow(true)
      sub_KickAll:SetShow(true)
      sub_Upgrade:SetShow(true)
      sub_Kick:SetPosY(6)
    else
      if isSubHost then
        Panel_Window_ArshaPvPSubMenu:SetSize(162, 75)
        sub_Kick:SetShow(true)
        sub_Upgrade:SetShow(false)
        sub_teamChange:SetShow(false)
      end
    end
  else
    if controlType == 1 then
      contents = (self.list2_ArshaTeamB):GetContentByKey(toInt64(0, idx))
      if isHost then
        if isMatchType == 1 then
          Panel_Window_ArshaPvPSubMenu:SetSize(162, 110)
          sub_teamChange:SetShow(false)
          sub_Upgrade:SetPosY(77)
          sub_teamChange:SetPosY(112)
        else
          sub_KickAll:addInputEvent("Mouse_LUp", "ArshaPvP_Team_Kick(2, " .. 0 .. ")")
          Panel_Window_ArshaPvPSubMenu:SetSize(162, 150)
          sub_teamChange:SetShow(true)
          sub_Upgrade:SetPosY(77)
          sub_teamChange:SetPosY(112)
        end
        sub_Kick:SetShow(true)
        sub_KickAll:SetShow(true)
        sub_Upgrade:SetShow(true)
        sub_Kick:SetPosY(6)
      else
        if isSubHost then
          Panel_Window_ArshaPvPSubMenu:SetSize(162, 75)
          sub_Kick:SetShow(true)
          sub_Upgrade:SetShow(false)
          sub_teamChange:SetShow(false)
        end
      end
    else
      if controlType == 2 then
        contents = (self.list2_ArshaWait):GetContentByKey(toInt64(0, idx))
        if isHost then
          if isMatchType == 1 then
            Panel_Window_ArshaPvPSubMenu:SetSize(162, 75)
            sub_teamChange:SetShow(false)
            sub_Upgrade:SetPosY(42)
            sub_teamChange:SetPosY(77)
          else
            Panel_Window_ArshaPvPSubMenu:SetSize(162, 110)
            sub_teamChange:SetShow(true)
            sub_Upgrade:SetPosY(42)
            sub_teamChange:SetPosY(77)
          end
          sub_Kick:SetShow(true)
          sub_KickAll:SetShow(false)
          sub_Upgrade:SetShow(true)
          sub_Kick:SetPosY(6)
        else
          if isSubHost then
            Panel_Window_ArshaPvPSubMenu:SetSize(162, 40)
            sub_Kick:SetShow(true)
            sub_KickAll:SetShow(false)
            sub_Upgrade:SetShow(false)
            sub_teamChange:SetShow(false)
          end
        end
      else
        if controlType == 3 then
          contents = (self.list2_ArshaObserver):GetContentByKey(toInt64(0, idx))
          if isHost then
            if isMatchType == 1 then
              Panel_Window_ArshaPvPSubMenu:SetSize(162, 40)
              sub_teamChange:SetShow(false)
              sub_teamChange:SetPosY(38)
            else
              Panel_Window_ArshaPvPSubMenu:SetSize(162, 40)
              sub_teamChange:SetShow(false)
              sub_teamChange:SetPosY(38)
            end
            sub_Kick:SetShow(true)
            sub_KickAll:SetShow(false)
            sub_Upgrade:SetShow(false)
            sub_Kick:SetPosY(4)
          else
            if isSubHost then
              Panel_Window_ArshaPvPSubMenu:SetSize(162, 40)
              sub_Kick:SetShow(true)
              sub_KickAll:SetShow(false)
              sub_Upgrade:SetShow(false)
              sub_teamChange:SetShow(false)
            end
          end
        end
      end
    end
  end
  if contents ~= nil then
    local charName = (UI.getChildControl)(contents, "StaticText_Name")
    Panel_Window_ArshaPvPSubMenu:SetShow(true)
    Panel_Window_ArshaPvPSubMenu:SetPosX(charName:GetParentPosX())
    Panel_Window_ArshaPvPSubMenu:SetPosY(charName:GetParentPosY() + charName:GetSizeY())
    sub_Kick:addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_UserKick(" .. idx .. ", " .. userNo_s64 .. ")")
    if isMatchType == 1 then
      sub_KickAll:addInputEvent("Mouse_LUp", "ArshaPvP_Team_Kick(" .. userNo_s64 .. ", " .. 1 .. ")")
    end
    sub_teamChange:addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_UserTeamChange(" .. idx .. ", " .. userNo_s64 .. ", " .. tostring(not isAssistant) .. ")")
    sub_Upgrade:addInputEvent("Mouse_LUp", "HandleClicked_ArshaPvP_UserUpgrade(" .. idx .. ", " .. userNo_s64 .. ", " .. tostring(not isAssistant) .. ")")
  end
end

ArshaPvP_SubMenu_Off = function()
  -- function num : 0_35
  local panelPosX = Panel_Window_ArshaPvPSubMenu:GetPosX()
  local panelPosY = Panel_Window_ArshaPvPSubMenu:GetPosY()
  local panelSizeX = Panel_Window_ArshaPvPSubMenu:GetSizeX()
  local panelSizeY = Panel_Window_ArshaPvPSubMenu:GetSizeY()
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  if panelPosX <= mousePosX and mousePosX <= panelPosX + panelSizeX and panelPosY <= mousePosY and mousePosY <= panelPosY + panelSizeY then
    return 
  end
  Panel_Window_ArshaPvPSubMenu:SetShow(false)
end

ArshaPvP_SubMenu_PowerOff = function()
  -- function num : 0_36
  Panel_Window_ArshaPvPSubMenu:SetShow(false)
end

ArshaPvP_SubMenu_ButtonPosition = function()
  -- function num : 0_37 , upvalues : sub_Kick, sub_Upgrade, sub_teamChange
  local iconPosY = 4
  if sub_Kick:GetShow() then
    sub_Kick:SetPosY(iconPosY)
    iconPosY = iconPosY + sub_Kick:GetSizeY() + 5
  end
  if sub_Upgrade:GetShow() then
    sub_Upgrade:SetPosY(iconPosY)
    iconPosY = iconPosY + sub_Upgrade:GetSizeY() + 5
  end
  if sub_teamChange:GetShow() then
    sub_teamChange:SetPosY(iconPosY)
    iconPosY = iconPosY + sub_teamChange:GetSizeY() + 5
  end
end

HandleClicked_ArshaPvP_UserKick = function(idx, userNo_str)
  -- function num : 0_38
  local userinfo = ToClient_GetCompetitionDefinedUser(userNo_str)
  ArshaPvP_SubMenu_PowerOff()
  local characterName = nil
  if userinfo ~= nil then
    characterName = userinfo:getCharacterName()
  end
  local KickUserCompetition = function()
    -- function num : 0_38_0 , upvalues : userNo_str
    ToClient_RequestLeavePlayer(userNo_str)
  end

  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_USERKICK_MESSAGEBOX", "name", characterName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = KickUserCompetition, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_ArshaPvP_UserTeamChange = function(idx, userNo_str, isAssistant)
  -- function num : 0_39
  FGlobal_ArshaPvP_TeamChangeControl_Open(idx, userNo_str, isAssistant)
  ArshaPvP_SubMenu_PowerOff()
end

HandleClicked_ArshaPvP_UserUpgrade = function(idx, userNo_str, isAssistant)
  -- function num : 0_40
  local ChangeAssistantUser = function()
    -- function num : 0_40_0 , upvalues : userNo_str, isAssistant
    ToClient_RequestChangeAssistans(userNo_str, isAssistant)
  end

  ArshaPvP_SubMenu_PowerOff()
  local userinfo = ToClient_GetCompetitionDefinedUser(userNo_str)
  local characterName = ""
  if userinfo ~= nil then
    characterName = userinfo:getCharacterName()
  end
  local message = nil
  if isAssistant == true then
    message = "LUA_COMPETITION_REQUEST_SET_ASSISTANT"
  else
    message = "LUA_COMPETITION_REQUEST_RELEASE_ASSISTANT"
  end
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, message, "name", characterName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = ChangeAssistantUser, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_ArshaPvP_OpenOrClose = function()
  -- function num : 0_41 , upvalues : arshaPvP
  local self = arshaPvP
  local isOpen = ToClient_IsCompetitionOpen_HostOnly()
  self._isOpen = not isOpen
  HandleClicked_ArshaPvP_Setting()
end

ArshaPvP_Simpletooltip = function(isShow, tipType)
  -- function num : 0_42 , upvalues : arshaPvP
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local self = arshaPvP
  local name, desc, control, isOpenType = nil, nil, nil, nil
  local isMatchType = ToClient_CompetitionMatchType()
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_TEAMMODE_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_ROUND_DESC")
    control = self.rdo_RoundMode
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ALIVEMODE_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_FREE_DESC")
      control = self.rdo_FreeMode
    else
      if tipType == 2 then
        if self._isOpen then
          isOpenType = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_OPENTYPE")
        else
          isOpenType = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_CLOSETYPE")
        end
        name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_OPENCLOSE_TITLE")
        desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_OPENCLOSE_DESC", "isOpenType", isOpenType)
        control = self.chk_ArshaOpen
      else
        if tipType == 3 then
          if isMatchType == 0 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_ROUNDTYPE_ROUND_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_ROUNDTYPE_ROUND_DESC")
          else
            if isMatchType == 1 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_ROUNDTYPE_FREE_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_ROUNDTYPE_FREE_DESC")
            end
          end
          control = self.btn_RoundCount
        else
          if tipType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_LIMITTIME_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_LIMITTIME_DESC")
            control = self.btn_LimitTime
          else
            if tipType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_LIMITLEVEL_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_LIMITLEVEL_DESC")
              control = self.btn_LimitLevel
            else
              if tipType == 6 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_LIMITMEMBER_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_LIMITMEMBER_DESC")
                control = self.btn_PartyMemberLimit
              else
                if tipType == 7 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_WATCHINVITE_NAME")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_WATCHINVITE_DESC")
                  control = self.chk_WatchMemberInvite
                else
                  if tipType == 9 then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_RESURRECTION_NAME")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_RESURRECTION_DESC")
                    control = self.btn_AllResurrection
                  else
                    if tipType == 10 then
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_INVITELIST_NAME")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_INVITELIST_DESC")
                      control = self.btn_InviteList
                    else
                      if tipType == 11 then
                        name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_GAMESTART_NAME")
                        desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_GAMESTART_DESC")
                        control = self.btn_GameStart
                      else
                        if tipType == 12 then
                          name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_GAMESTOP_NAME")
                          desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_GAMESTOP_DESC")
                          control = self.btn_GameStop
                        else
                          if tipType == 13 then
                            name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_EXIT_NAME")
                            desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_EXIT_DESC")
                            control = self.btn_Exit
                          else
                            if tipType == 14 then
                              name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_WAIT_NAME")
                              desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_WAIT_DESC")
                              control = self.rdo_SelectWait
                            else
                              if tipType == 15 then
                                name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_WATCH_NAME")
                                desc = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SIMPLETOOLTIP_WATCH_DESC")
                                control = self.rdo_SelectWatch
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
  TooltipSimple_Show(control, name, desc)
end

FGlobal_ArshaPvP_HostJoin = function()
  -- function num : 0_43
  ToClient_RequestEnterCompetitionHost()
end

FGlobal_ArshaPvP_Open = function()
  -- function num : 0_44 , upvalues : arshaPvP
  local self = arshaPvP
  local isHost = ToClient_IsCompetitionHost()
  local isSubHost = ToClient_IsCompetitionAssistant()
  FromClient_UpdateTeamUserList()
  ArshaPvP_RefreshUpdate()
  ArshaPvP_SubMenu_ButtonPosition()
  ;
  (self.rdo_RoundMode):SetIgnore(false)
  ;
  (self.rdo_FreeMode):SetIgnore(false)
  ;
  (self.chk_ArshaOpen):SetIgnore(false)
  ;
  (self.txt_RoundCount):SetIgnore(false)
  ;
  (self.btn_RoundCount):SetIgnore(false)
  ;
  (self.txt_LimitMinute):SetIgnore(false)
  ;
  (self.txt_LimitSecond):SetIgnore(false)
  ;
  (self.btn_LimitTime):SetIgnore(false)
  ;
  (self.txt_LimitLevel):SetIgnore(false)
  ;
  (self.btn_LimitLevel):SetIgnore(false)
  ;
  (self.txt_PartyMemberLimitCount):SetIgnore(false)
  ;
  (self.btn_PartyMemberLimit):SetIgnore(false)
  ;
  (self.chk_WatchMemberInvite):SetIgnore(false)
  ;
  (self.rdo_RoundMode):SetMonoTone(false)
  ;
  (self.rdo_FreeMode):SetMonoTone(false)
  ;
  (self.chk_ArshaOpen):SetMonoTone(false)
  ;
  (self.txt_RoundCount):SetMonoTone(false)
  ;
  (self.btn_RoundCount):SetMonoTone(false)
  ;
  (self.txt_LimitMinute):SetMonoTone(false)
  ;
  (self.txt_LimitSecond):SetMonoTone(false)
  ;
  (self.btn_LimitTime):SetMonoTone(false)
  ;
  (self.txt_LimitLevel):SetMonoTone(false)
  ;
  (self.btn_LimitLevel):SetMonoTone(false)
  ;
  (self.txt_PartyMemberLimitCount):SetMonoTone(false)
  ;
  (self.btn_PartyMemberLimit):SetMonoTone(false)
  ;
  (self.chk_WatchMemberInvite):SetMonoTone(false)
  if isHost then
    (self.arshaManagementTitle):SetShow(true)
    ;
    (self.img_NotAdmin):SetShow(false)
  else
    if isSubHost then
      (self.arshaManagementTitle):SetShow(true)
      ;
      (self.img_NotAdmin):SetShow(false)
      ;
      (self.rdo_RoundMode):SetIgnore(true)
      ;
      (self.rdo_FreeMode):SetIgnore(true)
      ;
      (self.chk_ArshaOpen):SetIgnore(true)
      ;
      (self.txt_RoundCount):SetIgnore(true)
      ;
      (self.btn_RoundCount):SetIgnore(true)
      ;
      (self.txt_LimitMinute):SetIgnore(true)
      ;
      (self.txt_LimitSecond):SetIgnore(true)
      ;
      (self.btn_LimitTime):SetIgnore(true)
      ;
      (self.txt_LimitLevel):SetIgnore(true)
      ;
      (self.btn_LimitLevel):SetIgnore(true)
      ;
      (self.txt_PartyMemberLimitCount):SetIgnore(true)
      ;
      (self.btn_PartyMemberLimit):SetIgnore(true)
      ;
      (self.rdo_RoundMode):SetMonoTone(true)
      ;
      (self.rdo_FreeMode):SetMonoTone(true)
      ;
      (self.chk_ArshaOpen):SetMonoTone(true)
      ;
      (self.txt_RoundCount):SetMonoTone(true)
      ;
      (self.btn_RoundCount):SetMonoTone(true)
      ;
      (self.txt_LimitMinute):SetMonoTone(true)
      ;
      (self.txt_LimitSecond):SetMonoTone(true)
      ;
      (self.btn_LimitTime):SetMonoTone(true)
      ;
      (self.txt_LimitLevel):SetMonoTone(true)
      ;
      (self.btn_LimitLevel):SetMonoTone(true)
      ;
      (self.txt_PartyMemberLimitCount):SetMonoTone(true)
      ;
      (self.btn_PartyMemberLimit):SetMonoTone(true)
    else
      ;
      (self.arshaManagementTitle):SetShow(false)
      ;
      (self.img_NotAdmin):SetShow(true)
      ;
      (self.btn_Kick_A):SetShow(false)
      ;
      (self.btn_Kick_B):SetShow(false)
    end
  end
  ;
  (self.rdo_SelectWait):SetCheck(true)
  ;
  (self.rdo_SelectWatch):SetCheck(false)
  local matchMode = ToClient_CompetitionMatchType()
  local isLimitSecondTime = ToClient_CompetitionMatchTimeLimit()
  local matchMode = ToClient_CompetitionMatchType()
  local targetScore = ToClient_GetTargetScore()
  local limitMinuteTime = 0
  local limitSecondTime = 0
  if isLimitSecondTime >= 60 then
    limitMinuteTime = (math.floor)(isLimitSecondTime / 60)
    limitSecondTime = (math.ceil)(isLimitSecondTime % 60)
  else
    limitSecondTime = isLimitSecondTime
  end
  if matchMode == 0 then
    local roundCount = targetScore * 2 - 1
    ;
    (self.descBG):SetText(PAGetStringParam4(Defines.StringSheet_GAME, "LUA_ARSHA_USER_DESC_GAMEPROGRESSES_ROUND", "limitTimeSum", limitMinuteTime, "level", ToClient_GetLevelLimit(), "round", roundCount, "targetScore", targetScore))
    ;
    (self.txt_RoundMarkCount):SetText(tostring(roundCount))
    ;
    (self.txt_RoundCountTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ROUNDOFWIN_TITLE"))
    ;
    (self.txt_RoundMarkText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_USER_OPTION_ROUND_FORCOUNT", "targetScore", targetScore))
    if isHost or isSubHost then
      (self.btn_Kick_A):SetShow(true)
      ;
      (self.btn_Kick_B):SetShow(true)
    else
      ;
      (self.btn_Kick_A):SetShow(false)
      ;
      (self.btn_Kick_B):SetShow(false)
    end
  else
    do
      if matchMode == 1 then
        (self.descBG):SetText(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_ARSHA_USER_DESC_GAMEPROGRESSES_FREE", "limitTimeSum", limitMinuteTime, "level", ToClient_GetLevelLimit(), "targetScore", targetScore))
        ;
        (self.txt_FreeMarkCount):SetText(tostring(targetScore))
        ;
        (self.txt_RoundCountTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ROUNDOFALIVE_TITLE"))
        ;
        (self.txt_FreeMarkText):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_ALIVEMODE_TITLE"))
        ;
        (self.btn_Kick_A):SetShow(false)
        ;
        (self.btn_Kick_B):SetShow(false)
      end
      ;
      (self.descBG):SetSize((self.descBG):GetSizeX(), (self.descBG):GetTextSizeY() + 10)
      ;
      (self.descBG):ComputePos()
      ;
      (self.txt_RoundCount):SetText(targetScore)
      ;
      (self.txt_LimitMinute):SetText(limitMinuteTime)
      ;
      (self.txt_LimitSecond):SetText(limitSecondTime)
      ;
      (self.txt_LimitLevel):SetText(ToClient_GetLevelLimit())
      ;
      (self.txt_PartyMemberLimitCount):SetText(ToClient_GetMaxPartyMemberCount())
      Panel_Window_Arsha:SetShow(true)
    end
  end
end

FGlobal_ArshaPvP_Close = function()
  -- function num : 0_45 , upvalues : checkPopUp
  Panel_Window_Arsha:SetShow(false)
  Panel_Window_Arsha:CloseUISubApp()
  checkPopUp:SetCheck(false)
  ArshaPvP_SubMenu_PowerOff()
end

ArshaPvP_Team_Kick = function(teamNo, isMode)
  -- function num : 0_46 , upvalues : arshaPvP
  if teamNo == nil then
    return 
  end
  _PA_LOG("추방", "추방 �\128번호 " .. tostring(teamNo))
  if teamNo == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_ALLKICK_NOWAITMEMBERKICK"))
    return 
  end
  local self = arshaPvP
  do
    if isMode == 1 then
      local userinfo = ToClient_GetCompetitionDefinedUser(teamNo)
      teamNo = userinfo:getTeamNo()
    end
    local KickTeamAll = function()
    -- function num : 0_46_0 , upvalues : teamNo
    ToClient_RequestLeaveTeam(teamNo)
  end

    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_ALLKICK_EXECUTE")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = KickTeamAll, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

Team_NameChangeOpen = function()
  -- function num : 0_47
  FGlobal_TeamNameChangeControl_Open()
end

PaGlobal_Panel_Arsha_PopUp = function()
  -- function num : 0_48 , upvalues : checkPopUp
  if checkPopUp:IsCheck() then
    Panel_Window_Arsha:OpenUISubApp()
  else
    Panel_Window_Arsha:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

PaGlobal_Panel_Arsha_ShowIconToolTip = function(isShow)
  -- function num : 0_49 , upvalues : checkPopUp
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

FromClient_UpdateTeamUserList = function()
  -- function num : 0_50
  if (CppEnums.CompetitionMatchType).eCompetitionMatchMode_Round == ToClient_CompetitionMatchType() then
    ArshaPvP_SelectedUpdate_Round()
  else
    ArshaPvP_SelectedUpdate_FreeForAll()
  end
  ArshaPvP_RefreshUpdate()
  HandleClicked_ArshaPvP_WaitAndWatch()
end

FromClient_ChangeMatchType = function()
  -- function num : 0_51 , upvalues : arshaPvP
  local self = arshaPvP
  if not Panel_Window_Arsha:GetShow() then
    return 
  end
  FromClient_UpdateTeamUserList()
  HandleClicked_ArshaPvP_ChangeOption()
end

FromClient_UpdateTeamScore = function(teamNum, scoreValue, round, winTeamHP, loseTeamHP)
  -- function num : 0_52
  if teamNum == 0 then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAMSCORE_DRAW", "currentRound", round))
  else
    local matchMode = ToClient_CompetitionMatchType()
    local teamA_Info = ToClient_GetTeamListAt(0)
    local teamB_Info = ToClient_GetTeamListAt(1)
    local teamA_Name = ""
    local teamB_Name = ""
    if teamA_Info ~= nil and teamB_Info ~= nil then
      teamA_Name = teamA_Info:getTeamName()
      teamB_Name = teamB_Info:getTeamName()
    end
    if teamA_Name == "" or teamB_Name == "" then
      teamA_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A")
      teamB_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B")
    end
    local teamWinString = teamB_Name
    local teamLoseString = teamA_Name
    if teamNum == 1 then
      teamWinString = teamA_Name
      teamLoseString = teamB_Name
    end
    if matchMode == 0 then
      Proc_ShowMessage_Ack(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAMSCORE", "currentRound", round, "teamNo", teamWinString, "score", scoreValue))
    else
      if matchMode == 1 then
        local leaderInfo = ToClient_GetTeamLeaderInfo(teamNum)
        Proc_ShowMessage_Ack(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAMSCORE", "currentRound", round, "teamNo", leaderInfo:getUserName(), "score", scoreValue))
      end
    end
    do
      Proc_ShowMessage_Ack(PAGetStringParam4(Defines.StringSheet_GAME, "LUA_ARSHA_TEAMWIN_PERCENT_HP", "teamNameA", teamWinString, "hpA", winTeamHP, "teamNameB", teamLoseString, "hpB", loseTeamHP))
    end
  end
end

FromClient_CompetitionMatchDone = function(teamNo, rank, teamHpPercent)
  -- function num : 0_53
  if teamNo == 0 then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_MATCH_DONE_DRAW", "teamNo", teamNo))
    return 
  end
  _PA_LOG("HP", tostring(teamHpPercent))
  local matchMode = ToClient_CompetitionMatchType()
  if matchMode == 0 then
    local teamA_Info = ToClient_GetTeamListAt(0)
    local teamB_Info = ToClient_GetTeamListAt(1)
    local teamA_Name = ""
    local teamB_Name = ""
    if teamA_Info ~= nil and teamB_Info ~= nil then
      teamA_Name = teamA_Info:getTeamName()
      teamB_Name = teamB_Info:getTeamName()
    end
    if teamA_Name == "" or teamB_Name == "" then
      teamA_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_A")
      teamB_Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TEAM_B")
    end
    local winTeamName = teamB_Name
    if teamNo == 1 then
      winTeamName = teamA_Name
    end
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_MATCH_DONE", "teamNo", winTeamName))
  else
    do
      if matchMode == 1 then
        local leaderInfo = ToClient_GetTeamLeaderInfo(teamNo)
        if leaderInfo ~= nil then
          Proc_ShowMessage_Ack(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_COMPETITION_MATCH_DONE_FREEFORALL", "rank", rank, "hpPercent", tostring(teamHpPercent), "leaderName", leaderInfo:getCharacterName()))
        end
      end
    end
  end
end

FromClient_JoinNewPlayer = function(characterName, isEntryUser)
  -- function num : 0_54
  if isEntryUser then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_JOINNEWPLAYER_ENTRY", "characterName", characterName))
  else
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_JOINNEWPLAYER_OBSERVER", "characterName", characterName))
  end
end

FromClient_KillHistory = function(deadUserInfo, attackerUserInfo)
  -- function num : 0_55
  if attackerUserInfo == nil then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITION_USERDEAD_SELF", "characterName", deadUserInfo:getCharacterName()))
  else
    Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_COMPETITION_USERDEAD_ATTACKED", "attackerName", attackerUserInfo:getCharacterName(), "deadUserName", deadUserInfo:getCharacterName()))
  end
end

FromClient_EntryUserChangeTeam = function(userInfo)
  -- function num : 0_56
  local matchMode = ToClient_CompetitionMatchType()
  if matchMode ~= 0 or userInfo == nil then
    return 
  end
  local teamAlphabet = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMPETITIONGAME_WAITINGLIST")
  if userInfo:getTeamNo() == 1 then
    teamAlphabet = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_A")
  else
    if userInfo:getTeamNo() == 2 then
      teamAlphabet = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_B")
    end
  end
  local message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_COMPETITION_USER_CHANGETEAM", "characterName", userInfo:getCharacterName(), "teamNo", teamAlphabet)
  chatting_sendMessage("", message, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
end

FromClient_GetOutUserFromCompetition = function(outUserInfo)
  -- function num : 0_57
  if outUserInfo == nil then
    return 
  end
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GETOUT_FROM_COMPETITION", "characterName", outUserInfo:getCharacterName()))
end

FromClient_ChangeAssistant = function(userInfo)
  -- function num : 0_58
end

FromClient_CompetitionOptionChanged = function(isOpen, matchTimeLimit, targetScore, levelLimit, maxPartyMemberCount, maxWaitTime)
  -- function num : 0_59 , upvalues : arshaPvP
  local self = arshaPvP
  ;
  (self.chk_ArshaOpen):SetCheck(isOpen)
  self._isOpen = isOpen
  self._timeLimit = matchTimeLimit
  self._targetScore = targetScore
  self._levelLimit = levelLimit
  self._maxPartyMemberCount = maxPartyMemberCount
  self._maxWaitTime = maxWaitTime
  local isLimitSecondTime = matchTimeLimit
  local matchMode = ToClient_CompetitionMatchType()
  local isHost = ToClient_IsCompetitionHost()
  local limitMinuteTime = 0
  local limitSecondTime = 0
  if isLimitSecondTime >= 60 then
    limitMinuteTime = (math.floor)(isLimitSecondTime / 60)
    limitSecondTime = (math.ceil)(isLimitSecondTime % 60)
  else
    limitSecondTime = isLimitSecondTime
  end
  if matchMode == 0 then
    local roundCount = targetScore * 2 - 1
    ;
    (self.descBG):SetText(PAGetStringParam4(Defines.StringSheet_GAME, "LUA_ARSHA_USER_DESC_GAMEPROGRESSES_ROUND", "limitTimeSum", limitMinuteTime, "level", ToClient_GetLevelLimit(), "round", roundCount, "targetScore", targetScore))
    ;
    (self.txt_RoundMarkCount):SetText(roundCount)
    ;
    (self.txt_RoundMarkText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_USER_OPTION_ROUND_FORCOUNT", "targetScore", targetScore))
  else
    do
      if matchMode == 1 then
        (self.descBG):SetText(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_ARSHA_USER_DESC_GAMEPROGRESSES_FREE", "limitTimeSum", limitMinuteTime, "level", ToClient_GetLevelLimit(), "targetScore", targetScore))
        ;
        (self.txt_FreeMarkCount):SetText(targetScore)
        ;
        (self.txt_RoundCount):SetText(targetScore)
      end
      ;
      (self.descBG):SetSize((self.descBG):GetSizeX(), (self.descBG):GetTextSizeY() + 10)
      ;
      (self.descBG):ComputePos()
      if isHost then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_SETTING_GAME_ACK"))
      end
      HandleClicked_ArshaPvP_ChangeOption()
      ArshaPvP_Widget_Update()
    end
  end
end

FromClient_NotifyUseSkill = function(userName, skillName)
  -- function num : 0_60
  local message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_ARSHA_NOTIFYUSESKILL_MESSAGE", "userName", userName, "skillName", skillName)
  chatting_sendMessage("", message, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
end

FromClient_CompetitionUseItemModeChanged = function(isCanUseItemMode)
  -- function num : 0_61
  if isCanUseItemMode == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_CHANGED_CANUSEITEMMODE"))
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_CHANGED_CANNOTUSEITEMMODE"))
  end
end

FromClient_ChangeTeamName = function()
  -- function num : 0_62
  ArshaPvP_SelectedUpdate_Round()
  ArshaPvP_Widget_Init()
  ArshaPvP_Widget_Update()
end

getArshaPvpOption = function()
  -- function num : 0_63 , upvalues : arshaPvP
  local self = arshaPvP
  local option = {}
  option._isOpen = self._isOpen
  option._timeLimit = self._timeLimit
  option._targetScore = self._targetScore
  option._levelLimit = self._levelLimit
  option._maxPartyMemberCount = self._maxPartyMemberCount
  option._maxWaitTime = self._maxWaitTime
  return option
end

ArshaPvP_init()
registerEvent("FromClient_UpdateObserverList", "FromClient_UpdateTeamUserList")
registerEvent("FromClient_UpdateEntryList", "FromClient_UpdateTeamUserList")
registerEvent("FromClient_ChangeMatchType", "FromClient_ChangeMatchType")
registerEvent("FromClient_UpdateTeamScore", "FromClient_UpdateTeamScore")
registerEvent("FromClient_CompetitionMatchDone", "FromClient_CompetitionMatchDone")
registerEvent("FromClient_CompetitionOptionChanged", "FromClient_CompetitionOptionChanged")
registerEvent("FromClient_CompetitionUseItemModeChanged", "FromClient_CompetitionUseItemModeChanged")
registerEvent("FromClient_JoinNewPlayer", "FromClient_JoinNewPlayer")
registerEvent("FromClient_KillHistory", "FromClient_KillHistory")
registerEvent("FromClient_EntryUserChangeTeam", "FromClient_EntryUserChangeTeam")
registerEvent("FromClient_GetOutUserFromCompetition", "FromClient_GetOutUserFromCompetition")
registerEvent("FromClient_ChangeAssistant", "FromClient_ChangeAssistant")
registerEvent("FromClient_NotifyUseSkill", "FromClient_NotifyUseSkill")
registerEvent("FromClient_NotifyUseSkillCoolTime", "FromClient_NotifyUseSkillCoolTime")
registerEvent("FromClient_ChangeTeamName", "FromClient_ChangeTeamName")
Panel_Window_Arsha:RegisterUpdateFunc("SkillCooltime_UpdatePerFrame")
ArshaDebuff = function(isOn)
  -- function num : 0_64
  ToClient_ArshaDebuffOnOff(isOn)
end


