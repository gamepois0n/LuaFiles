local _panel = Panel_FriendList
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UnDefinedFriendIdx = -1
PaGlobal_FriendNew = {
  _ui = {
    _Static_TabTypeBg = UI.getChildControl(_panel, "Static_TabTypeBg"),
    _Static_TabListBg = UI.getChildControl(_panel, "Static_TabListBg"),
    _Static_FriendBg = UI.getChildControl(_panel, "Static_FriendBg"),
    _List2_OfferBg = UI.getChildControl(_panel, "List2_OfferBg"),
    _Static_BottomBg = UI.getChildControl(_panel, "Static_BottomBg"),
    _Static_AddFriendBg = UI.getChildControl(_panel, "Static_AddFriendBg")
  },
  _STRING = {
    _INVITE_PARTY = PAGetString(Defines.StringSheet_GAME, "INTERACTION_MENU3"),
    _DELETE_FRIEND = PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_REMOVE_FRIEND"),
    _ACCEPT_ADDREQUEST = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMPETITIONGAME_ACCEPT"),
    _DECLINE_ADDREQUEST = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMPETITIONGAME_REFUSE"),
    _XBOX_PROFILE = PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_XBOX_PROFILE"),
    _XBOX_GAMERTAG = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FRIENDNEW_XBOXNAME"),
    _CHARACTERNAME = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FRIENDNEW_CHARACTERNAME"),
    _GUILD_INVITE = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INVITE"),
    _XBOX_INVITE = PAGetString(Defines.StringSheet_GAME, "LUA_XBOX_FRIEND_GAMEINVITE")
  },
  _isPCFriendTab = true,
  _isFriendListTab = true,
  _currentFriendIdx = UnDefinedFriendIdx,
  _tempAddFriendStr = ""
}
function PaGlobal_FriendNew:Clear()
  self._isPCFriendTab = true
  self._isFriendListTab = true
  self._currentFriendIdx = UnDefinedFriendIdx
end
function PaGlobal_FriendNew:Open()
  _panel:SetShow(true)
  _panel:setMaskingChild(true)
  _panel:ActiveMouseEventEffect(true)
  _panel:setGlassBackground(true)
  self._ui._Static_AddFriendBg:SetShow(false)
  self:Clear()
  self:Update()
  RequestFriendList_getFriendList()
  RequestFriendList_getAddFriendList()
  local keyGuideList = {
    self._ui._StaticText_KeyGuideInviteParty,
    self._ui._StaticText_KeyGuideDeleteFriend,
    self._ui._StaticText_KeyGuideClose
  }
  PaGlobalFunc_ConsoleKeyGuide_SetAlign(keyGuideList, self._ui._Static_BottomBg, CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT)
end
function PaGlobal_FriendNew:Close()
  if true == self._ui._Static_AddFriendBg:GetShow() then
    PaGlobal_FriendNew:CloseAddFriendEdit()
    return
  end
  _AudioPostEvent_SystemUiForXBOX(50, 3)
  _panel:SetShow(false)
  _panel:SetMonoTone(false)
  self._ui._Static_AddFriendBg:SetShow(false)
end
function PaGlobal_FriendNew:UpdatePcFriendTab()
  self._ui._Static_TabListBg:SetShow(true)
  if true == self._isFriendListTab then
    self._ui._Static_FriendBg:SetShow(true)
    self._ui._List2_FriendBg:SetShow(true)
    self._ui._List2_OfferBg:SetShow(false)
    self._ui._StaticText_KeyGuideInviteParty:SetShow(true)
    self._ui._StaticText_KeyGuideDeleteFriend:SetShow(true)
    self._ui._StaticText_KeyGuideAddFriend:SetShow(true)
    self._ui._StaticText_KeyGuideInviteParty:SetText(self._STRING._GUILD_INVITE)
    self._ui._StaticText_KeyGuideDeleteFriend:SetText(self._STRING._DELETE_FRIEND)
    self._ui._StaticText_CharactorNameTitle:SetText(self._STRING._CHARACTERNAME)
    local keyGuideList = {
      self._ui._StaticText_KeyGuideInviteParty,
      self._ui._StaticText_KeyGuideDeleteFriend,
      self._ui._StaticText_KeyGuideClose
    }
    PaGlobalFunc_ConsoleKeyGuide_SetAlign(keyGuideList, self._ui._Static_BottomBg, CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT)
    self:UpdatePCFriendList()
  else
    self._ui._Static_FriendBg:SetShow(false)
    self._ui._List2_FriendBg:SetShow(false)
    self._ui._List2_OfferBg:SetShow(true)
    self._ui._StaticText_KeyGuideInviteParty:SetShow(true)
    self._ui._StaticText_KeyGuideDeleteFriend:SetShow(true)
    self._ui._StaticText_KeyGuideClose:SetShow(true)
    local keyGuideList = {
      self._ui._StaticText_KeyGuideInviteParty,
      self._ui._StaticText_KeyGuideDeleteFriend,
      self._ui._StaticText_KeyGuideClose
    }
    PaGlobalFunc_ConsoleKeyGuide_SetAlign(keyGuideList, self._ui._Static_BottomBg, CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT)
    self:UpdateOfferList()
  end
end
function PaGlobal_FriendNew:UpdateXboxFriendTab()
  self._isFriendListTab = true
  self._ui._Static_TabListBg:SetShow(false)
  self._ui._Static_FriendBg:SetShow(true)
  self._ui._List2_FriendBg:SetShow(true)
  self._ui._List2_OfferBg:SetShow(false)
  self._ui._StaticText_KeyGuideInviteParty:SetShow(true)
  self._ui._StaticText_KeyGuideDeleteFriend:SetShow(true)
  self._ui._StaticText_KeyGuideAddFriend:SetShow(false)
  self._ui._StaticText_KeyGuideInviteParty:SetText(self._STRING._XBOX_PROFILE)
  self._ui._StaticText_KeyGuideDeleteFriend:SetText(self._STRING._XBOX_INVITE)
  self._ui._StaticText_CharactorNameTitle:SetText(self._STRING._XBOX_GAMERTAG)
  local keyGuideList = {
    self._ui._StaticText_KeyGuideInviteParty,
    self._ui._StaticText_KeyGuideDeleteFriend,
    self._ui._StaticText_KeyGuideClose
  }
  PaGlobalFunc_ConsoleKeyGuide_SetAlign(keyGuideList, self._ui._Static_BottomBg, CONSOLEKEYGUID_ALIGN_TYPE.eALIGN_TYPE_RIGHT)
  self:UpdateXboxFriendList()
end
function PaGlobal_FriendNew:UpdateOfferList()
  self._ui._List2_OfferBg:getElementManager():clearKey()
  local friendCount = RequestFriends_getAddFriendCount()
  for friendIndex = 0, friendCount - 1 do
    self._ui._List2_OfferBg:getElementManager():pushKey(friendIndex)
  end
end
function PaGlobal_FriendNew:UpdatePCFriendList()
  self._ui._List2_FriendBg:getElementManager():clearKey()
  local pcFriendGroup = RequestFriends_getFriendGroupAt(0)
  local friendCount = pcFriendGroup:getFriendCount()
  for friendIndex = 0, friendCount - 1 do
    self._ui._List2_FriendBg:getElementManager():pushKey(friendIndex)
  end
  self._ui._StaticText_KeyGuideInviteParty:SetShow(false)
  if friendCount < 1 then
    self._ui._StaticText_KeyGuideDeleteFriend:SetShow(false)
  else
    self._ui._StaticText_KeyGuideDeleteFriend:SetShow(true)
  end
  local selfPlayer = getSelfPlayer()
  if nil ~= selfPlayer then
    local selfActorKeyRaw = selfPlayer:getActorKey()
    local isGuildMaster = selfPlayer:isSpecialGuildMember(selfActorKeyRaw)
    if true == isGuildMaster and friendCount > 0 then
      self._ui._StaticText_KeyGuideInviteParty:SetShow(true)
    end
  end
end
function PaGlobal_FriendNew:UpdateXboxFriendList()
  self._ui._List2_FriendBg:getElementManager():clearKey()
  local xboxFriendSize = ToClient_InitializeXboxFriendForLua()
  for i = 0, xboxFriendSize - 1 do
    self._ui._List2_FriendBg:getElementManager():pushKey(i)
  end
  if xboxFriendSize < 1 then
    self._ui._StaticText_KeyGuideInviteParty:SetShow(false)
    self._ui._StaticText_KeyGuideDeleteFriend:SetShow(false)
  else
    self._ui._StaticText_KeyGuideInviteParty:SetShow(true)
    self._ui._StaticText_KeyGuideDeleteFriend:SetShow(true)
  end
end
function FriendNew_CreateOfferList(control, key)
  local self = PaGlobal_FriendNew
  local addFriendInfo = RequestFriends_getAddFriendAt(Int64toInt32(key))
  if nil == addFriendInfo then
    return
  end
  local uiOfferControl = UI.getChildControl(control, "Button_OfferTemplete")
  uiOfferControl:SetText(addFriendInfo:getName())
  if _ContentsGroup_isConsolePadControl then
    control:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobal_FriendNew:AddFriendAccept(" .. tostring(key) .. ")")
    control:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobal_FriendNew:AddFriendDecline(" .. tostring(key) .. ")")
  else
    uiOfferControl:addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:AddFriendAccept(" .. tostring(key) .. ")")
    uiOfferControl:addInputEvent("Mouse_RUp", "PaGlobal_FriendNew:AddFriendDecline(" .. tostring(key) .. ")")
  end
end
function FriendNew_InviteGuild(targetName, value)
  if true == self._ui._Static_AddFriendBg:GetShow() then
    return
  end
  if false == value then
    local messageBoxMemo = PAGetString(Defines.StringSheet_SymbolNo, "eErrNoGuildTeamBattleAttendCantAttach")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_RESOURCE, "FRIEND_TEXT_TITLE"),
      content = messageBoxMemo,
      functionApply = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    return
  end
  local guildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil ~= guildInfo and nil ~= guildInfo:getMemberByUserNo() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_POPUP_ALREADY_JOIN_CLAN_OR_GUILD"))
    return
  end
  FromClient_GuildMain_ResponseGuildInviteForGuild(0, targetName, 0)
end
function FriendNew_CreateFriendList(control, key)
  local self = PaGlobal_FriendNew
  control:registerPadEvent(__eConsoleUIPadEvent_Up_X, "")
  control:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "")
  if true == self._isPCFriendTab then
    local uiCharacterName = UI.getChildControl(control, "StaticText_CharactorName")
    local uiFamilyName = UI.getChildControl(control, "StaticText_FamilyName")
    local uiLogin = UI.getChildControl(control, "StaticText_LoginLog")
    local uiButton = UI.getChildControl(control, "Button_FriendTemplete")
    local pcFriendGroup = RequestFriends_getFriendGroupAt(0)
    local friendInfo = pcFriendGroup:getFriendAt(Int64toInt32(key))
    local isLogin = friendInfo:isOnline()
    local loginString = PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_ONLINE")
    if false == isLogin then
      local s64_lastLogoutTime = friendInfo:getLastLogoutTime_s64()
      loginString = convertStringFromDatetimeOverHourForFriends(s64_lastLogoutTime)
    end
    uiCharacterName:SetText(friendInfo:getCharacterName())
    uiFamilyName:SetText(friendInfo:getName())
    uiLogin:SetText(loginString)
    if _ContentsGroup_isConsolePadControl then
      control:registerPadEvent(__eConsoleUIPadEvent_Up_X, "FriendNew_InviteGuild(\"" .. tostring(friendInfo:getCharacterName()) .. "\"," .. tostring(isLogin) .. ")")
      control:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobal_FriendNew:DeleteFriend(" .. tostring(key) .. ")")
    else
      uiButton:addInputEvent("Mouse_LUp", "FriendNew_InviteGuild(\"" .. tostring(friendInfo:getCharacterName()) .. "\"," .. tostring(isLogin) .. ")")
      uiButton:addInputEvent("Mouse_RUp", "PaGlobal_FriendNew:DeleteFriend(" .. tostring(key) .. ")")
    end
    if false == isLogin then
      uiCharacterName:SetFontColor(UI_color.C_FF797979)
      uiFamilyName:SetFontColor(UI_color.C_FF797979)
      uiLogin:SetFontColor(UI_color.C_FF797979)
    else
      uiCharacterName:SetFontColor(UI_color.C_FFFFFFFF)
      uiFamilyName:SetFontColor(UI_color.C_FFFFFFFF)
      uiLogin:SetFontColor(UI_color.C_FFFFFFFF)
    end
  else
    local uiGamerTag = UI.getChildControl(control, "StaticText_CharactorName")
    local uiFamilyName = UI.getChildControl(control, "StaticText_FamilyName")
    local uiLogin = UI.getChildControl(control, "StaticText_LoginLog")
    local uiButton = UI.getChildControl(control, "Button_FriendTemplete")
    local xboxFriendInfo = ToClient_getXboxFriendInfoByIndex(Int64toInt32(key))
    local isLogin = xboxFriendInfo:isOnline()
    local loginString = PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_ONLINE")
    if false == isLogin then
      loginString = PAGetString(Defines.StringSheet_GAME, "LUA_FRIENDINFO_LOGOUT")
    end
    uiGamerTag:SetText(xboxFriendInfo:getGamerTag())
    uiFamilyName:SetText(xboxFriendInfo:getName())
    uiLogin:SetText(loginString)
    if false == isLogin then
      uiGamerTag:SetFontColor(UI_color.C_FF797979)
      uiFamilyName:SetFontColor(UI_color.C_FF797979)
      uiLogin:SetFontColor(UI_color.C_FF797979)
    else
      uiGamerTag:SetFontColor(UI_color.C_FFFFFFFF)
      uiFamilyName:SetFontColor(UI_color.C_FFFFFFFF)
      uiLogin:SetFontColor(UI_color.C_FFFFFFFF)
    end
    if _ContentsGroup_isConsolePadControl then
      control:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobal_FriendNew:ShowXBoxProfile(" .. tostring(key) .. ")")
      control:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobal_FriendNew:SendXboxInvite(" .. tostring(key) .. ")")
    else
      uiButton:addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:ShowXBoxProfile(" .. tostring(key) .. ")")
      uiButton:addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:SendXboxInvite(" .. tostring(key) .. ")")
    end
  end
end
function PaGlobal_FriendNew:ShowXBoxProfile(index)
  if true == self._ui._Static_AddFriendBg:GetShow() then
    return
  end
  local xboxFriendInfo = ToClient_getXboxFriendInfoByIndex(Int64toInt32(index))
  ToClient_showXboxFriendProfile(xboxFriendInfo:getXuid())
end
function PaGlobal_FriendNew:SendXboxInvite(index)
  local xboxFriendInfo = ToClient_getXboxFriendInfoByIndex(Int64toInt32(index))
  ToClient_sendXboxInvite(xboxFriendInfo:getXuid(), "Hello!")
end
function PaGlobal_FriendNew:ClickedFriendList(index)
  local prevFriendIdx = self._currentFriendIdx
  self._currentFriendIdx = index
  if UnDefinedFriendIdx ~= prevFriendIdx then
    local control = self._ui._List2_FriendBg:GetContentByKey(prevFriendIdx)
    control:SetColor(UI_color.C_FFFFFFFF)
  end
  local control = self._ui._List2_FriendBg:GetContentByKey(index)
  control:SetColor(UI_color.C_FFEF9C7F)
end
function PaGlobal_FriendNew:ToggleTabType()
  if true == self._isPCFriendTab then
    self._ui._RadioButton_PCFrined:SetFontColor(UI_color.C_FFFFFFFF)
    self._ui._RadioButton_XBoxFrined:SetFontColor(UI_color.C_FF797979)
  else
    self._ui._RadioButton_PCFrined:SetFontColor(UI_color.C_FF797979)
    self._ui._RadioButton_XBoxFrined:SetFontColor(UI_color.C_FFFFFFFF)
  end
end
function PaGlobal_FriendNew:ToggleTabList()
  if true == self._isFriendListTab then
    self._ui._RadioButton_Friend:SetFontColor(UI_color.C_FFFFFFFF)
    self._ui._RadioButton_Offer:SetFontColor(UI_color.C_FF797979)
  else
    self._ui._RadioButton_Friend:SetFontColor(UI_color.C_FF797979)
    self._ui._RadioButton_Offer:SetFontColor(UI_color.C_FFFFFFFF)
  end
end
function PaGlobal_FriendNew:ClickLB()
  if true == self._isPCFriendTab then
    return false
  end
  _AudioPostEvent_SystemUiForXBOX(51, 6)
  self._isPCFriendTab = true
  PaGlobal_FriendNew:Update()
end
function PaGlobal_FriendNew:ClickRB()
  if false == self._isPCFriendTab then
    return false
  end
  _AudioPostEvent_SystemUiForXBOX(51, 6)
  self._isPCFriendTab = false
  PaGlobal_FriendNew:Update()
end
function PaGlobal_FriendNew:AddFriendAccept(index)
  if true == self._ui._Static_AddFriendBg:GetShow() then
    return
  end
  if ToClient_isAddFriendAllowed() then
    requestFriendList_acceptFriend(index)
  else
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DONOTHAVE_PRIVILEGE")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
      content = messageBoxMemo,
      functionYes = MessageBox_Empty_function,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    ToClient_showPrivilegeError()
  end
end
function PaGlobal_FriendNew:AddFriendDecline(index)
  if true == self._ui._Static_AddFriendBg:GetShow() then
    return
  end
  requestFriendList_refuseFriend(index)
end
function isSelectFriendBlocked(groupNo, userNo)
  return RequestFriends_isBlockedFriend(userNo, groupNo - 1)
end
function PaGlobal_FriendNew:InviteParty(index)
  local pcFriendGroup = RequestFriends_getFriendGroupAt(0)
  local friendInfo = pcFriendGroup:getFriendAt(index)
  local isSelfPlayerPlayingPvPMatch = getSelfPlayer():isDefinedPvPMatch()
  if nil == friendInfo then
    return
  end
  local userCharacterName = friendInfo:getCharacterName()
  if isSelectFriendBlocked(0, friendInfo:getUserNo()) then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DONOTHAVE_PRIVILEGE")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
      content = messageBoxMemo,
      functionYes = MessageBox_Empty_function,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    return
  end
  if false == isSelfPlayerPlayingPvPMatch then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ACK_INVITE", "targetName", userCharacterName))
  end
  RequestParty_inviteCharacter(userCharacterName)
end
function PaGlobal_FriendNew:DeleteFriend(index)
  local pcFriendGroup = RequestFriends_getFriendGroupAt(0)
  local friendInfo = pcFriendGroup:getFriendAt(index)
  if nil == friendInfo then
    return
  end
  requestFriendList_deleteFriend(friendInfo:getUserNo())
end
function FriendList_show()
  PaGlobal_FriendNew:Open()
end
function FriendList_hide()
  PaGlobal_FriendNew:Close()
end
function PaGlobal_FriendNew:Init()
  _panel:SetShow(false)
  self._ui._RadioButton_PCFrined = UI.getChildControl(PaGlobal_FriendNew._ui._Static_TabTypeBg, "RadioButton_PCFrined")
  self._ui._RadioButton_XBoxFrined = UI.getChildControl(PaGlobal_FriendNew._ui._Static_TabTypeBg, "RadioButton_XBoxFrined")
  self._ui._Static_LB = UI.getChildControl(PaGlobal_FriendNew._ui._Static_TabTypeBg, "Static_LB")
  self._ui._Static_RB = UI.getChildControl(PaGlobal_FriendNew._ui._Static_TabTypeBg, "Static_RB")
  self._ui._Static_LB:addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:ClickLB()")
  self._ui._Static_RB:addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:ClickRB()")
  self._ui._RadioButton_Friend = UI.getChildControl(PaGlobal_FriendNew._ui._Static_TabListBg, "RadioButton_Friend")
  self._ui._RadioButton_Offer = UI.getChildControl(PaGlobal_FriendNew._ui._Static_TabListBg, "RadioButton_Offer")
  self._ui._Static_LT_ConsoleUI = UI.getChildControl(PaGlobal_FriendNew._ui._Static_TabListBg, "Static_LT_ConsoleUI")
  self._ui._Static_RT_ConsoleUI = UI.getChildControl(PaGlobal_FriendNew._ui._Static_TabListBg, "Static_RT_ConsoleUI")
  self._ui._List2_FriendBg = UI.getChildControl(PaGlobal_FriendNew._ui._Static_FriendBg, "List2_FriendBg")
  self._ui._StaticText_CharactorNameTitle = UI.getChildControl(PaGlobal_FriendNew._ui._Static_FriendBg, "StaticText_CharactorNameTitle")
  self._ui._List2_FriendBg:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui._List2_FriendBg:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "FriendNew_CreateFriendList")
  self._ui._List2_OfferBg:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui._List2_OfferBg:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "FriendNew_CreateOfferList")
  self._ui._StaticText_KeyGuideInviteParty = UI.getChildControl(self._ui._Static_BottomBg, "StaticText_InviteParty")
  self._ui._StaticText_KeyGuideDeleteFriend = UI.getChildControl(self._ui._Static_BottomBg, "StaticText_DeleteFriend")
  self._ui._StaticText_KeyGuideClose = UI.getChildControl(self._ui._Static_BottomBg, "StaticText_Close")
  self._ui._Button_InviteParty = UI.getChildControl(self._ui._Static_BottomBg, "Button_InviteParty")
  self._ui._Button_Delete = UI.getChildControl(self._ui._Static_BottomBg, "Button_Delete")
  self._ui._Button_Close = UI.getChildControl(self._ui._Static_BottomBg, "Button_Close")
  self._ui._StaticText_KeyGuideAddFriend = UI.getChildControl(self._ui._Static_BottomBg, "StaticText_AddFriend")
  self._ui._Static_CenterBG = UI.getChildControl(self._ui._Static_AddFriendBg, "Static_CenterBg")
  self._ui._Edit_Nickname = UI.getChildControl(self._ui._Static_CenterBG, "Edit_Nickname")
  self._ui._Edit_Nickname:setXboxVirtualKeyBoardEndEvent("PaGlobal_FriendNew_EnterAddFriendEdit")
  self._ui._Edit_Nickname:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobal_FriendNew:OpenAddFriendEdit()")
  self._ui._Button_Delete:addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:DeleteFriend()")
  if _ContentsGroup_isConsolePadControl then
    _panel:registerPadEvent(__eConsoleUIPadEvent_LT, "PaGlobal_FriendNew:OpenAddFriendEdit()")
    _panel:registerPadEvent(__eConsoleUIPadEvent_LB, "PaGlobal_FriendNew:ClickLB()")
    _panel:registerPadEvent(__eConsoleUIPadEvent_RB, "PaGlobal_FriendNew:ClickRB()")
  end
end
function PaGlobal_FriendNew_IsFriendAddEdit(targetUI)
  local self = PaGlobal_FriendNew
  return nil ~= targetUI and targetUI:GetKey() == self._ui._Edit_Nickname:GetKey()
end
function PaGlobal_FriendNew:ClearAddFriendEdit()
  _panel:SetMonoTone(false)
  self._ui._Static_BottomBg:SetShow(true)
  self._ui._Edit_Nickname:SetEditText("", true)
  self._ui._Static_AddFriendBg:SetShow(false)
  ClearFocusEdit()
  self:UpdatePcFriendTab()
end
function PaGlobal_FriendNew_EnterAddFriendEdit(str)
  PaGlobal_FriendNew:EnterAddFriendEdit(str)
end
function PaGlobal_FriendNew:EnterAddFriendEdit(str)
  _panel:SetMonoTone(false)
  self._tempAddFriendStr = str
  self._ui._Static_BottomBg:SetShow(true)
  self._ui._Static_AddFriendBg:SetShow(false)
  ClearFocusEdit()
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "FRIEND_TEXT_TITLE"),
    content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_XBOX_FRIEND_ADD_ALERT", "characterName", tostring(str)),
    functionYes = PaGlobal_FriendNew_EnterAddFriendFunctionYes,
    functionNo = PaGlobal_FriendNew_EnterAddFriendFunctionNo,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function PaGlobal_FriendNew:CloseAddFriendEdit()
  _panel:SetMonoTone(false)
  self._ui._Static_BottomBg:SetShow(true)
  self._ui._Edit_Nickname:SetEditText("", true)
  self._ui._Static_AddFriendBg:SetShow(false)
  _AudioPostEvent_SystemUiForXBOX(50, 3)
  ClearFocusEdit()
end
function PaGlobal_FriendNew_EnterAddFriendFunctionYes()
  requestFriendList_addFriend(PaGlobal_FriendNew._tempAddFriendStr, true)
  PaGlobal_FriendNew._tempAddFriendStr = ""
end
function PaGlobal_FriendNew_EnterAddFriendFunctionNo()
  PaGlobal_FriendNew._tempAddFriendStr = ""
end
function PaGlobal_FriendNew:OpenAddFriendEdit()
  if false == self._isPCFriendTab then
    return
  end
  _AudioPostEvent_SystemUiForXBOX(51, 7)
  _panel:SetMonoTone(true)
  self._ui._Static_BottomBg:SetShow(false)
  self._ui._Static_AddFriendBg:SetMonoTone(false)
  self._ui._Static_AddFriendBg:SetShow(true)
  self._ui._Edit_Nickname:SetEditText("", true)
  SetFocusEdit(self._ui._Edit_Nickname)
end
function PaGlobalFunc_FromClient_FriendNew_luaLoadComplete()
  PaGlobal_FriendNew:Init()
end
function PaGlobal_FriendNew:Update()
  self:ToggleTabType()
  self:ToggleTabList()
  if true == self._isPCFriendTab then
    self:UpdatePcFriendTab()
  else
    self:UpdateXboxFriendTab()
  end
end
function FromClient_NotifyFriendMessage(msgType, strParam1, param1, param2)
  local msgStr = ""
  if 0 == msgType then
    if 1 == param1 then
      msgStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FRIENDS_NOTIFYFRIENDMESSAGE_LOGIN", "strParam1", strParam1)
    elseif 0 == msgType then
      msgStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FRIENDS_NOTIFYFRIENDMESSAGE_LOGOUT", "strParam1", strParam1)
    end
    Proc_ShowMessage_Ack(msgStr)
    PaGlobal_FriendNew:Update()
  end
end
registerEvent("FromClient_FriendListUpdateLogOnOffForMessanger", "FromClient_FriendListUpdateLogOnOffForMessanger")
registerEvent("ResponseFriendList_updateFriends", "ResponseFriendList_updateFriends")
registerEvent("FromClient_NoticeNewMessage", "FromClient_NoticeNewMessage")
registerEvent("ResponseFriendList_updateAddFriends", "ResponseFriendList_updateAddFriends")
registerEvent("FromClient_FriendDirectlyMessage", "FromClient_FriendDirectlyMessage")
registerEvent("FromClient_CantFindFriendForXbox", "FromClient_CantFindFriendForXbox")
function ResponseFriendList_updateFriends()
  if true == _panel:GetShow() then
    PaGlobal_FriendNew:Update()
  end
end
function ResponseFriendList_updateAddFriends()
  if true == _panel:GetShow() then
    PaGlobal_FriendNew:Update()
  end
end
function FromClient_NoticeNewMessage(isSoundNotice, isEffectNotice)
  if isEffectNotice and false == _panel:GetShow() then
    UIMain_FriendListUpdate()
    UIMain_FriendsUpdate()
  end
  if isSoundNotice then
    _AudioPostEvent_SystemUiForXBOX(3, 11)
  end
end
function friend_clickAddFriendClose()
end
function FriendMessanger_KillFocusEdit()
end
function friend_killFocusMessangerByKey()
end
function FromClient_CantFindFriendForXbox()
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "FRIEND_TEXT_TITLE"),
    content = PAGetString(Defines.StringSheet_SymbolNo, "eErrCantFindFriendForXbox"),
    functionYes = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function AddFriendInput_CheckCurrentUiEdit(targetUI)
  return false
end
function FriendMessanger_CheckCurrentUiEdit(targetUI)
  return false
end
function FriendfunctionYes()
  ToClient_RquestDirectlyCompelte(true)
end
function FriendfunctionNo()
  ToClient_RquestDirectlyCompelte(false)
end
function FromClient_FriendDirectlyMessage(fromUserName)
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "FRIEND_TEXT_TITLE"),
    content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_XBOX_FRIEND_MESSAGE", "userName", fromUserName),
    functionYes = FriendfunctionYes,
    functionNo = FriendfunctionNo,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function XboxFriendAsyncCall()
  ToClient_addXboxFriendAsync()
end
function FromClient_ResponseFriendResult(fromUserName, isAccept)
  local messageStr = ""
  local isAlReadyXboxFriend = ToClient_isAlreadyXboxFriend()
  if true == isAccept then
    if true == isAlReadyXboxFriend then
      messageStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_XBOX_FRIEND_REQUEST_ACCEPT", "characterName", fromUserName)
      local messageBoxDataXX = {
        title = PAGetString(Defines.StringSheet_RESOURCE, "FRIEND_TEXT_TITLE"),
        content = messageStr,
        functionApply = MessageBox_Empty_function,
        priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageBoxDataXX)
      return
    else
      messageStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_XBOX_FRIEND_REQUEST_ACCEPT_AND_XBOX_FRIEND", "characterName", fromUserName)
      local messageBoxDataXX = {
        title = PAGetString(Defines.StringSheet_RESOURCE, "FRIEND_TEXT_TITLE"),
        content = messageStr,
        functionYes = XboxFriendAsyncCall,
        functionNo = MessageBox_Empty_function,
        priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageBoxDataXX)
      return
    end
  else
    messageStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_XBOX_FRIEND_REQUEST_REFUSE", "characterName", fromUserName)
  end
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "FRIEND_TEXT_TITLE"),
    content = messageStr,
    functionApply = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function addFriendXbox(characterName)
  ToClinet_RequestDirectyleComplete(characterName)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_FriendNew_luaLoadComplete")
registerEvent("FromClient_ResponseFriendResult", "FromClient_ResponseFriendResult")
