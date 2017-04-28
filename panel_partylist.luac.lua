-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\party\panel_partylist.luac 

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
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_PartyList)
  local aniInfo1 = Panel_PartyList:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_PartyList:GetSizeX() / 2
  aniInfo1.AxisY = Panel_PartyList:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_PartyList:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_PartyList:GetSizeX() / 2
  aniInfo2.AxisY = Panel_PartyList:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_PartyList_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_PartyList:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_PartyList:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local partyList = {
control = {_btnClose = (UI.getChildControl)(Panel_PartyList, "Button_Close"), _btnRecruite = (UI.getChildControl)(Panel_PartyList, "Button_Recruite"), _btnReload = (UI.getChildControl)(Panel_PartyList, "Button_Reload"), _editSearch = (UI.getChildControl)(Panel_PartyList, "Edit_Search"), _btnSearch = (UI.getChildControl)(Panel_PartyList, "Button_Search"), _list2PartyList = (UI.getChildControl)(Panel_PartyList, "List2_PartyList")}
}
partyList.Update = function(self)
  -- function num : 0_2
  (((self.control)._list2PartyList):getElementManager()):clearKey()
  local partyListCount = ToClient_GetRecruitmentPartyListCount()
  if partyListCount > 0 then
    for index = 0, partyListCount - 1 do
      (((self.control)._list2PartyList):getElementManager()):pushKey(toInt64(0, index))
    end
  end
  do
    ClearFocusEdit()
    FGlobal_MyIntroduceClearFocusEdit()
  end
end

PartyListControlCreate = function(control, key)
  -- function num : 0_3
  local content = (UI.getChildControl)(control, "StaticText_Content")
  local level = (UI.getChildControl)(control, "StaticText_Level")
  local count = (UI.getChildControl)(control, "StaticText_Count")
  local leader = (UI.getChildControl)(control, "StaticText_PartyLeader")
  local server = (UI.getChildControl)(control, "StaticText_ServerName")
  local btnSupport = (UI.getChildControl)(control, "Button_Support")
  local _key = Int64toInt32(key)
  local partyWrapper = ToClient_GetRecruitmentPartyListAt(_key)
  if partyWrapper ~= nil then
    content:SetText(partyWrapper:getTitle())
    level:SetText(tostring(partyWrapper:getMinLevel()))
    leader:SetText(partyWrapper:getLeaderCharacterName())
    local serverNo = partyWrapper:getServerNo()
    local curChannelData = getCurrentChannelServerData()
    local currentServerNo = curChannelData._serverNo
    local channelName = getChannelName(curChannelData._worldNo, currentServerNo)
    server:SetText(channelName)
    if currentServerNo == serverNo then
      local partyKey = partyWrapper:getPartyRecruitmentKey()
      local myPartyKey = ToClient_GetMyPartyRecruitmentKey()
      if myPartyKey == partyKey then
        btnSupport:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_CANCEL"))
        btnSupport:addInputEvent("Mouse_LUp", "PartyList_Cancel()")
      else
        btnSupport:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_SUPPORT"))
        btnSupport:addInputEvent("Mouse_LUp", "PartyList_Support(" .. _key .. ")")
      end
    else
      do
        btnSupport:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_MOVESERVER"))
        btnSupport:addInputEvent("Mouse_LUp", "PartyList_MoveServer(" .. serverNo .. ")")
      end
    end
  end
end

PartyList_Cancel = function()
  -- function num : 0_4
  local party_Cancel = function()
    -- function num : 0_4_0
    ToClient_RequestCancelRecruitPartyMember()
  end

  local memoTitle = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_MSGCANCELTITLE")
  local memoContent = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_MSGCANCELCONTENT")
  local messageBoxData = {title = memoTitle, content = memoContent, functionYes = party_Cancel, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PartyList_Support = function(index)
  -- function num : 0_5
  local partyWrapper = ToClient_GetRecruitmentPartyListAt(index)
  if partyWrapper ~= nil then
    local partyNo = partyWrapper:getPartyNo()
    local serverNo = partyWrapper:getServerNo()
    ToClient_RequestJoinPartyRecruitment(partyNo, serverNo)
  end
end

PartyList_MoveServer = function(serverNo)
  -- function num : 0_6
  local moveServer = function()
    -- function num : 0_6_0 , upvalues : serverNo
    gameExit_MoveChannel(serverNo)
  end

  local curChannelData = getCurrentChannelServerData()
  local currentServerNo = curChannelData._serverNo
  local tempChannel = getGameChannelServerDataByWorldNo(curChannelData._worldNo, serverNo)
  local channelName = getChannelName(tempChannel._worldNo, tempChannel._serverNo)
  local memoTitle = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_MOVESERVER")
  local memoContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PARTYLIST_MSGMOVESERVERCONTENT", "serverName", channelName)
  local messageBoxData = {title = memoTitle, content = memoContent, functionYes = moveServer, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

partyList.Show = function(self)
  -- function num : 0_7
  Panel_PartyList:SetShow(true, true)
  ToClient_RequestListPartyRecruitment()
  ;
  ((self.control)._editSearch):SetEditText("")
end

partyList.Hide = function(self)
  -- function num : 0_8
  Panel_PartyList:SetShow(false, false)
  ClearFocusEdit()
  FGlobal_MyIntroduceClearFocusEdit()
end

FGlobal_PartyList_ShowToggle = function()
  -- function num : 0_9 , upvalues : partyList
  if Panel_PartyList:GetShow() then
    partyList:Hide()
  else
    partyList:Show()
  end
end

FromClient_ResponsePartyRecruitmentInfo = function(param1)
  -- function num : 0_10 , upvalues : partyList
  if param1 == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_REGISTALERT"))
  else
  end
  if param1 ~= 1 or param2 == 2 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_CANCELALERT"))
  end
  partyList:Update()
end

FromClient_RequestPartyJoin = function(guestActorKey, characterName, level, classType)
  -- function num : 0_11
  local partyJoin = function()
    -- function num : 0_11_0 , upvalues : guestActorKey
    ToClient_InvitePartyByActorkey(guestActorKey)
  end

  local className = getClassName(classType)
  local memoTitle = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_ALERTTITLE")
  local memoContent = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_PARTYLISTRECRUITE_ALERTCONTENT", "name", characterName, "class", className, "level", level)
  local messageBoxData = {title = memoTitle, content = memoContent, functionYes = partyJoin, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PartyList_Update = function()
  -- function num : 0_12
  ToClient_RequestListPartyRecruitment()
end

HandleClicked_PartyList_SearchEdit = function()
  -- function num : 0_13 , upvalues : partyList
  local self = partyList
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
  SetFocusEdit((self.control)._editSearch)
  ;
  ((self.control)._editSearch):SetEditText(((self.control)._editSearch):GetEditText(), true)
end

HandleClicked_PartyList_DoSearch = function()
  -- function num : 0_14 , upvalues : partyList
  local self = partyList
  local msg = ((self.control)._editSearch):GetEditText()
  if msg == "" then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYLIST_SEARCHALERT"))
    return 
  end
  local curChannelData = getCurrentChannelServerData()
  local serverNo = curChannelData._serverNo
  ToClient_FilteredPartyRecruitmentList(serverNo, msg)
end

partyList.RegisterEvent = function(self)
  -- function num : 0_15
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
end

partyList:RegisterEvent()

