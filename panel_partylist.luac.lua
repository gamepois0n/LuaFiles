-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\party\panel_partylist.luac 

-- params : ...
-- function num : 0
Panel_PartyList:SetShow(false, false)
Panel_PartyList:setGlassBackground(true)
Panel_PartyList:SetDragAll(true)
Panel_PartyList:RegisterShowEventFunc(true, "Panel_PartyList_ShowAni()")
Panel_PartyList:RegisterShowEventFunc(false, "Panel_PartyList_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
Panel_PartyList_ShowAni = function()
  -- function num : 0_0
end

Panel_PartyList_HideAni = function()
  -- function num : 0_1
end

local partyList = {
control = {_btnClose = (UI.getChildControl)(Panel_PartyList, "Button_Close"), _btnRecruite = (UI.getChildControl)(Panel_PartyList, "Button_Recruite"), _btnReload = (UI.getChildControl)(Panel_PartyList, "Button_Reload"), _editSearch = (UI.getChildControl)(Panel_PartyList, "Edit_Search"), _btnSearch = (UI.getChildControl)(Panel_PartyList, "Button_Search"), _btnReset = (UI.getChildControl)(Panel_PartyList, "Button_Reset"), _list2PartyList = (UI.getChildControl)(Panel_PartyList, "List2_PartyList")}
}
partyList.checkBlocked = function(self, index)
  -- function num : 0_2
  local partyWrapper = ToClient_GetRecruitmentPartyListAt(index)
  if partyWrapper == nil then
    return false
  end
  local isBlocked = partyWrapper:isBlocked()
  local curChannelData = getCurrentChannelServerData()
  local myPartyNo = ToClient_GetPartyNo()
  local myServerNo = curChannelData._serverNo
  local partyNo = partyWrapper:getPartyNo()
  local serverNo = partyWrapper:getServerNo()
  if isBlocked and myPartyNo == partyNo and myServerNo == serverNo then
    return true
  else
    if isBlocked then
      return false
    end
  end
  return true
end

partyList.Update = function(self)
  -- function num : 0_3 , upvalues : partyList
  (((self.control)._list2PartyList):getElementManager()):clearKey()
  local partyListCount = ToClient_GetRecruitmentPartyListCount()
  if partyListCount > 0 then
    for index = 0, partyListCount - 1 do
      if partyList:checkBlocked(index) then
        (((self.control)._list2PartyList):getElementManager()):pushKey(toInt64(0, index))
      end
    end
  end
  do
    ClearFocusEdit()
    FGlobal_PartyListClearFocusEdit()
  end
end

PartyListControlCreate = function(control, key)
  -- function num : 0_4
  local bg = (UI.getChildControl)(control, "Static_Bg")
  local myBg = (UI.getChildControl)(control, "Static_MyServerBg")
  local content = (UI.getChildControl)(control, "StaticText_Content")
  local level = (UI.getChildControl)(control, "StaticText_Level")
  local count = (UI.getChildControl)(control, "StaticText_Count")
  local leader = (UI.getChildControl)(control, "StaticText_PartyLeader")
  local server = (UI.getChildControl)(control, "StaticText_ServerName")
  local btnSupport = (UI.getChildControl)(control, "Button_Support")
  local btnAd = (UI.getChildControl)(control, "Button_Advertise")
  btnAd:SetAutoDisableTime(60)
  content:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  bg:SetShow(true)
  myBg:SetShow(false)
  local _key = Int64toInt32(key)
  local partyWrapper = ToClient_GetRecruitmentPartyListAt(_key)
  if partyWrapper ~= nil then
    if partyWrapper:isBlocked() then
      content:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BLOCKED_PARTYRECRUITMENT_BY_MASTER"))
    else
      content:SetText(partyWrapper:getTitle())
    end
    level:SetText(tostring(partyWrapper:getMinLevel()))
    count:SetText(partyWrapper:getCurrentCount() .. "/5")
    leader:SetText(partyWrapper:getLeaderCharacterName())
    local serverNo = partyWrapper:getServerNo()
    local curChannelData = getCurrentChannelServerData()
    local currentServerNo = curChannelData._serverNo
    local channelName = getChannelName(curChannelData._worldNo, serverNo)
    local curWorldData = getGameWorldServerDataByWorldNo(curChannelData._worldNo)
    local channelMoveableGlobalTime = getChannelMoveableTime(curWorldData._worldNo)
    local channelMoveableRemainTime = getChannelMoveableRemainTime(curWorldData._worldNo)
    local restrictedServerNo = curWorldData._restrictedServerNo
    local partyNo = partyWrapper:getPartyNo()
    server:SetText(channelName)
    btnSupport:SetShow(false)
    btnAd:SetShow(false)
    leader:addInputEvent("Mouse_LUp", "")
    leader:addInputEvent("Mouse_RUp", "")
    local isPartyEmpty = ToClient_IsPartyEmpty()
    local isPartyLeader = RequestParty_isLeader()
    local myPartyNo = ToClient_GetPartyNo()
    if currentServerNo == serverNo then
      if myPartyNo == partyNo and isPartyLeader then
        btnSupport:SetShow(true)
        btnSupport:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_CANCEL"))
        btnSupport:addInputEvent("Mouse_LUp", "PartyList_Cancel()")
        btnAd:SetShow(true)
        btnAd:addInputEvent("Mouse_LUp", "PartyList_Advertising(" .. _key .. ")")
        leader:addInputEvent("Mouse_LUp", "")
        leader:addInputEvent("Mouse_RUp", "")
        content:SetFontColor((Defines.Color).C_FFFFF3AF)
        level:SetFontColor((Defines.Color).C_FFFFF3AF)
        count:SetFontColor((Defines.Color).C_FFFFF3AF)
        leader:SetFontColor((Defines.Color).C_FFFFF3AF)
        server:SetFontColor((Defines.Color).C_FFFFF3AF)
        btnSupport:SetFontColor((Defines.Color).C_FFFFF3AF)
      end
      if isPartyEmpty then
        btnSupport:SetShow(true)
        btnSupport:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_SUPPORT"))
        btnSupport:addInputEvent("Mouse_LUp", "PartyList_Support(" .. _key .. ")")
        leader:addInputEvent("Mouse_LUp", "PartyList_WhisperToLeader(" .. _key .. ")")
        leader:addInputEvent("Mouse_RUp", "PartyList_WhisperToLeader(" .. _key .. ")")
      end
      bg:SetShow(false)
      myBg:SetShow(true)
    else
      local busyState = 0
      local channelCount = getGameChannelServerDataCount(curWorldData._worldNo)
      if channelCount > 0 then
        for index = 0, channelCount - 1 do
          local serverData = getGameChannelServerDataByWorldNo(curWorldData._worldNo, index)
          if serverData ~= nil and serverData._serverNo == serverNo then
            busyState = serverData._busyState
            break
          end
        end
      end
      do
        local isAdmission = true
        local isSiegeBeing = deadMessage_isSiegeBeingMyChannel()
        do
          local isInSiegeBattle = deadMessage_isInSiegeBattle()
          if isSiegeBeing == true and isInSiegeBattle == false then
            isAdmission = true
          else
            if restrictedServerNo ~= 0 and toInt64(0, 0) ~= channelMoveableGlobalTime then
              if restrictedServerNo == currentServerNo then
                isAdmission = true
              else
                if toInt64(0, 0) < channelMoveableRemainTime then
                  isAdmission = false
                else
                  isAdmission = true
                end
              end
            end
          end
          isAdmission = not isAdmission or busyState ~= 0
          if isAdmission and isPartyEmpty then
            btnSupport:SetShow(true)
            btnSupport:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_MOVESERVER"))
            btnSupport:addInputEvent("Mouse_LUp", "PartyList_MoveServer(" .. serverNo .. ", " .. partyNo .. ")")
            leader:addInputEvent("Mouse_LUp", "PartyList_WhisperToLeader(" .. _key .. ")")
            leader:addInputEvent("Mouse_RUp", "PartyList_WhisperToLeader(" .. _key .. ")")
          end
          -- DECOMPILER ERROR: 3 unprocessed JMP targets
        end
      end
    end
  end
end

PartyList_WhisperToLeader = function(index)
  -- function num : 0_5
  local partyWrapper = ToClient_GetRecruitmentPartyListAt(index)
  if partyWrapper == nil then
    return 
  end
  local leaderName = partyWrapper:getLeaderCharacterName()
  local title = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_MSGWHISPERTITLE")
  local content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PARTYLIST_MSGWHISPERDESC", "name", leaderName)
  local party_Whisper = function()
    -- function num : 0_5_0 , upvalues : leaderName
    FGlobal_ChattingInput_ShowWhisper(leaderName)
  end

  local messageBoxData = {title = title, content = content, functionYes = party_Whisper, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PartyList_Advertising = function(index)
  -- function num : 0_6
  local partyWrapper = ToClient_GetRecruitmentPartyListAt(index)
  if partyWrapper ~= nil then
    local adMsg = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_PARTYLIST_ADDVERSTISING_ADMSG", "title", partyWrapper:getTitle(), "level", partyWrapper:getMinLevel(), "count", partyWrapper:getCurrentCount())
    chatting_sendMessage("", adMsg, (CppEnums.ChatType).World)
  end
end

PartyList_Cancel = function()
  -- function num : 0_7
  local party_Cancel = function()
    -- function num : 0_7_0
    ToClient_RequestCancelRecruitPartyMember()
  end

  local memoTitle = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_MSGCANCELTITLE")
  local memoContent = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_MSGCANCELCONTENT")
  local messageBoxData = {title = memoTitle, content = memoContent, functionYes = party_Cancel, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PartyList_Support = function(index)
  -- function num : 0_8
  local partyWrapper = ToClient_GetRecruitmentPartyListAt(index)
  if partyWrapper == nil then
    return 
  end
  local partyNo = partyWrapper:getPartyNo()
  local serverNo = partyWrapper:getServerNo()
  local requestJoinPartyRecruitment = function()
    -- function num : 0_8_0 , upvalues : partyNo, serverNo
    ToClient_RequestJoinPartyRecruitment(partyNo, serverNo)
  end

  local requestBreakPartyRecruitment = function()
    -- function num : 0_8_1 , upvalues : partyNo, serverNo
    ToClient_RequestBreakPartyRecruitment(partyNo, serverNo)
  end

  if ToClient_SelfPlayerIsGM() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_BREAK_PARTYRECRUITMENT_BY_MASTER")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = requestBreakPartyRecruitment, functionNo = requestJoinPartyRecruitment, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    requestJoinPartyRecruitment()
  end
end

PartyList_MoveServer = function(serverNo, partyNo)
  -- function num : 0_9
  local serverCount = getGameWorldServerDataCount()
  local curChannelData = getCurrentChannelServerData()
  local curWorldData = getGameWorldServerDataByWorldNo(curChannelData._worldNo)
  local channelCount = getGameChannelServerDataCount(curWorldData._worldNo)
  local channelName = (getChannelName(curChannelData._worldNo, serverNo))
  local serverIndex = nil
  for sIndex = 0, serverCount - 1 do
    for index = 0, channelCount - 1 do
      local serverData = getGameChannelServerDataByIndex(sIndex, index)
      if serverData ~= nil then
        local _serverNo = serverData._serverNo
        if serverNo == _serverNo then
          serverIndex = index
          break
        end
      end
    end
  end
  local moveServer = function()
    -- function num : 0_9_0 , upvalues : serverIndex
    if serverIndex ~= nil then
      gameExit_MoveChannel(serverIndex)
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELWAIT_MSG")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), content = messageBoxMemo, functionYes = nil, functionClose = nil, exitButton = true, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  end

  local requestBreakPartyRecruitment = function()
    -- function num : 0_9_1 , upvalues : partyNo, serverNo
    ToClient_RequestBreakPartyRecruitment(partyNo, serverNo)
  end

  if ToClient_SelfPlayerIsGM() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_BREAK_PARTYRECRUITMENT_BY_MASTER")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = requestBreakPartyRecruitment, functionNo = moveServer, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    local memoTitle = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_MOVESERVER")
    local memoContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PARTYLIST_MSGMOVESERVERCONTENT", "serverName", channelName)
    local messageBoxData = {title = memoTitle, content = memoContent, functionYes = moveServer, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

partyList.Show = function(self)
  -- function num : 0_10
  Panel_PartyList:SetShow(true, true)
  ToClient_RequestListPartyRecruitment()
  Panel_PartyList:SetPosX(getScreenSizeX() / 2 - Panel_PartyList:GetSizeX() / 2)
  Panel_PartyList:SetPosY(getScreenSizeY() / 2 - Panel_PartyList:GetSizeY() / 2 - 100)
  HandleClicked_PartyList_Reset()
end

partyList.Hide = function(self)
  -- function num : 0_11
  Panel_PartyList:SetShow(false, false)
  ClearFocusEdit()
  FGlobal_PartyListClearFocusEdit()
end

FGlobal_CheckPartyListUiEdit = function(targetUI)
  -- function num : 0_12 , upvalues : partyList
  do return targetUI ~= nil and targetUI:GetKey() == ((partyList.control)._editSearch):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_PartyListClearFocusEdit = function()
  -- function num : 0_13
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWindow)() then
      (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

FGlobal_PartyList_ShowToggle = function()
  -- function num : 0_14 , upvalues : partyList
  if Panel_PartyList:GetShow() then
    partyList:Hide()
  else
    partyList:Show()
  end
end

FromClient_ResponsePartyRecruitmentInfo = function(param1)
  -- function num : 0_15 , upvalues : partyList
  if param1 == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_REGISTALERT"))
  else
  end
  if param1 ~= 1 or param1 == 2 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_CANCELALERT"))
  end
  partyList:Update()
end

FromClient_RequestPartyJoin = function(guestActorKey, characterName, level, classType)
  -- function num : 0_16
  local partyJoin = function()
    -- function num : 0_16_0 , upvalues : characterName
    RequestParty_inviteCharacter(characterName)
  end

  local className = getClassName(classType)
  local memoTitle = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_ALERTTITLE")
  local memoContent = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_ALERTCONTENT", "name", characterName, "class", className, "level", level)
  local messageBoxData = {title = memoTitle, content = memoContent, functionYes = partyJoin, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PartyList_Update = function()
  -- function num : 0_17
  ToClient_RequestListPartyRecruitment()
end

HandleClicked_PartyList_SearchEdit = function()
  -- function num : 0_18 , upvalues : partyList
  local self = partyList
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
  SetFocusEdit((self.control)._editSearch)
  ;
  ((self.control)._editSearch):SetEditText(((self.control)._editSearch):GetEditText(), true)
end

HandleClicked_PartyList_DoSearch = function()
  -- function num : 0_19 , upvalues : partyList
  local self = partyList
  local msg = ((self.control)._editSearch):GetEditText()
  if msg == "" then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_SEARCHALERT"))
    return 
  end
  local serverNo = 0
  ToClient_FilteredPartyRecruitmentList(serverNo, msg)
end

HandleClicked_PartyList_Reset = function()
  -- function num : 0_20 , upvalues : partyList
  local serverNo = 0
  local msg = ""
  ;
  ((partyList.control)._editSearch):SetEditText(msg)
  ToClient_FilteredPartyRecruitmentList(serverNo, msg)
end

partyList.RegisterEvent = function(self)
  -- function num : 0_21
  registerEvent("FromClient_ResponsePartyRecruitmentInfo", "FromClient_ResponsePartyRecruitmentInfo")
  registerEvent("FromClient_RequestPartyJoin", "FromClient_RequestPartyJoin")
  ;
  ((self.control)._list2PartyList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PartyListControlCreate")
  ;
  ((self.control)._list2PartyList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self.control)._btnRecruite):addInputEvent("Mouse_LUp", "FGlobal_PartyListRecruite_Show()")
  ;
  ((self.control)._btnClose):addInputEvent("Mouse_LUp", "FGlobal_PartyList_ShowToggle()")
  ;
  ((self.control)._btnReload):addInputEvent("Mouse_LUp", "PartyList_Update()")
  ;
  ((self.control)._editSearch):addInputEvent("Mouse_LUp", "HandleClicked_PartyList_SearchEdit()")
  ;
  ((self.control)._btnSearch):addInputEvent("Mouse_LUp", "HandleClicked_PartyList_DoSearch()")
  ;
  ((self.control)._btnReset):addInputEvent("Mouse_LUp", "HandleClicked_PartyList_Reset()")
end

partyList:RegisterEvent()

