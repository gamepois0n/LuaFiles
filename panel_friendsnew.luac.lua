-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\friend\console\panel_friendsnew.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UnDefinedFriendIdx = -1
PaGlobal_FriendNew = {
_ui = {_Static_TabTypeBg = (UI.getChildControl)(Panel_FriendList, "Static_TabTypeBg"), _Static_TabListBg = (UI.getChildControl)(Panel_FriendList, "Static_TabListBg"), _Static_FriendBg = (UI.getChildControl)(Panel_FriendList, "Static_FriendBg"), _List2_OfferBg = (UI.getChildControl)(Panel_FriendList, "List2_OfferBg"), _Static_BottomBg = (UI.getChildControl)(Panel_FriendList, "Static_BottomBg"), _Static_AddFriendBg = (UI.getChildControl)(Panel_FriendList, "Static_AddFriendBg")}
, 
_STRING = {_INVITE_PARTY = PAGetString(Defines.StringSheet_GAME, "INTERACTION_MENU3"), _DELETE_FRIEND = PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_REMOVE_FRIEND"), _ACCEPT_ADDREQUEST = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMPETITIONGAME_ACCEPT"), _DECLINE_ADDREQUEST = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMPETITIONGAME_REFUSE"), _XBOX_PROFILE = PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_XBOX_PROFILE"), _XBOX_GAMERTAG = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FRIENDNEW_XBOXNAME"), _CHARACTERNAME = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FRIENDNEW_CHARACTERNAME")}
, _isPCFriendTab = true, _isFriendListTab = true, _currentFriendIdx = UnDefinedFriendIdx}
-- DECOMPILER ERROR at PC99: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.Clear = function(self)
  -- function num : 0_0 , upvalues : UnDefinedFriendIdx
  self._isPCFriendTab = true
  self._isFriendListTab = true
  self._currentFriendIdx = UnDefinedFriendIdx
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.Open = function(self)
  -- function num : 0_1
  Panel_FriendList:SetShow(true)
  Panel_FriendList:setMaskingChild(true)
  Panel_FriendList:ActiveMouseEventEffect(true)
  Panel_FriendList:setGlassBackground(true)
  self:Clear()
  self:Update()
  RequestFriendList_getFriendList()
  RequestFriendList_getAddFriendList()
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.Close = function(self)
  -- function num : 0_2
  Panel_FriendList:SetShow(false)
  Panel_FriendList:SetMonoTone(false)
  ;
  ((self._ui)._Static_AddFriendBg):SetShow(false)
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.UpdatePcFriendTab = function(self)
  -- function num : 0_3
  ((self._ui)._Static_TabListBg):SetShow(true)
  if self._isFriendListTab == true then
    ((self._ui)._Static_FriendBg):SetShow(true)
    ;
    ((self._ui)._List2_FriendBg):SetShow(true)
    ;
    ((self._ui)._List2_OfferBg):SetShow(false)
    ;
    ((self._ui)._StaticText_InviteParty):SetShow(true)
    ;
    ((self._ui)._StaticText_DeleteFriend):SetShow(true)
    ;
    ((self._ui)._StaticText_InviteParty):SetText((self._STRING)._INVITE_PARTY)
    ;
    ((self._ui)._StaticText_DeleteFriend):SetText((self._STRING)._DELETE_FRIEND)
    ;
    ((self._ui)._StaticText_CharactorNameTitle):SetText((self._STRING)._CHARACTERNAME)
    ;
    ((self._ui)._StaticText_AddFriend):SetShow(true)
    self:UpdatePCFriendList()
  else
    ;
    ((self._ui)._Static_FriendBg):SetShow(false)
    ;
    ((self._ui)._List2_FriendBg):SetShow(false)
    ;
    ((self._ui)._List2_OfferBg):SetShow(true)
    ;
    ((self._ui)._StaticText_InviteParty):SetShow(true)
    ;
    ((self._ui)._StaticText_DeleteFriend):SetShow(true)
    ;
    ((self._ui)._StaticText_InviteParty):SetText((self._STRING)._ACCEPT_ADDREQUEST)
    ;
    ((self._ui)._StaticText_DeleteFriend):SetText((self._STRING)._DECLINE_ADDREQUEST)
    self:UpdateOfferList()
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.UpdateXboxFriendTab = function(self)
  -- function num : 0_4
  self._isFriendListTab = true
  ;
  ((self._ui)._Static_TabListBg):SetShow(false)
  ;
  ((self._ui)._Static_FriendBg):SetShow(true)
  ;
  ((self._ui)._List2_FriendBg):SetShow(true)
  ;
  ((self._ui)._List2_OfferBg):SetShow(false)
  ;
  ((self._ui)._StaticText_InviteParty):SetShow(true)
  ;
  ((self._ui)._StaticText_DeleteFriend):SetShow(false)
  ;
  ((self._ui)._StaticText_InviteParty):SetText((self._STRING)._XBOX_PROFILE)
  ;
  ((self._ui)._StaticText_CharactorNameTitle):SetText((self._STRING)._XBOX_GAMERTAG)
  ;
  ((self._ui)._StaticText_AddFriend):SetShow(false)
  self:UpdateXboxFriendList()
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.UpdateOfferList = function(self)
  -- function num : 0_5
  (((self._ui)._List2_OfferBg):getElementManager()):clearKey()
  local friendCount = RequestFriends_getAddFriendCount()
  for friendIndex = 0, friendCount - 1 do
    (((self._ui)._List2_OfferBg):getElementManager()):pushKey(friendIndex)
  end
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.UpdatePCFriendList = function(self)
  -- function num : 0_6
  (((self._ui)._List2_FriendBg):getElementManager()):clearKey()
  local pcFriendGroup = RequestFriends_getFriendGroupAt(0)
  local friendCount = pcFriendGroup:getFriendCount()
  for friendIndex = 0, friendCount - 1 do
    (((self._ui)._List2_FriendBg):getElementManager()):pushKey(friendIndex)
  end
  if friendCount < 1 then
    ((self._ui)._StaticText_InviteParty):SetShow(false)
    ;
    ((self._ui)._StaticText_DeleteFriend):SetShow(false)
  else
    ;
    ((self._ui)._StaticText_InviteParty):SetShow(true)
    ;
    ((self._ui)._StaticText_DeleteFriend):SetShow(true)
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.UpdateXboxFriendList = function(self)
  -- function num : 0_7
  (((self._ui)._List2_FriendBg):getElementManager()):clearKey()
  local xboxFriendSize = ToClient_InitializeXboxFriendForLua()
  for i = 0, xboxFriendSize - 1 do
    (((self._ui)._List2_FriendBg):getElementManager()):pushKey(i)
  end
  if xboxFriendSize < 1 then
    ((self._ui)._StaticText_InviteParty):SetShow(false)
  else
    ;
    ((self._ui)._StaticText_InviteParty):SetShow(true)
  end
end

FriendNew_CreateOfferList = function(control, key)
  -- function num : 0_8
  local self = PaGlobal_FriendNew
  local addFriendInfo = RequestFriends_getAddFriendAt(Int64toInt32(key))
  if addFriendInfo == nil then
    return 
  end
  local uiOfferControl = (UI.getChildControl)(control, "Button_OfferTemplete")
  uiOfferControl:SetText(addFriendInfo:getName())
  if _ContentsGroup_isConsolePadControl then
    control:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobal_FriendNew:AddFriendAccept(" .. tostring(key) .. ")")
    control:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobal_FriendNew:AddFriendDecline(" .. tostring(key) .. ")")
  else
    uiOfferControl:addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:AddFriendAccept(" .. tostring(key) .. ")")
    uiOfferControl:addInputEvent("Mouse_RUp", "PaGlobal_FriendNew:AddFriendDecline(" .. tostring(key) .. ")")
  end
end

FriendNew_CreateFriendList = function(control, key)
  -- function num : 0_9
  local self = PaGlobal_FriendNew
  control:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "")
  control:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "")
  if self._isPCFriendTab == true then
    local uiCharacterName = (UI.getChildControl)(control, "StaticText_CharactorName")
    local uiFamilyName = (UI.getChildControl)(control, "StaticText_FamilyName")
    local uiLogin = (UI.getChildControl)(control, "StaticText_LoginLog")
    local uiButton = (UI.getChildControl)(control, "Button_FriendTemplete")
    local pcFriendGroup = RequestFriends_getFriendGroupAt(0)
    local friendInfo = pcFriendGroup:getFriendAt(Int64toInt32(key))
    local isLogin = friendInfo:isOnline()
    local loginString = PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_ONLINE")
    do
      do
        if isLogin == false then
          local s64_lastLogoutTime = friendInfo:getLastLogoutTime_s64()
          loginString = convertStringFromDatetimeOverHourForFriends(s64_lastLogoutTime)
        end
        uiCharacterName:SetText(friendInfo:getCharacterName())
        uiFamilyName:SetText(friendInfo:getName())
        uiLogin:SetText(loginString)
        if _ContentsGroup_isConsolePadControl then
          control:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobal_FriendNew:InviteParty(" .. tostring(key) .. ")")
          control:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobal_FriendNew:DeleteFriend(" .. tostring(key) .. ")")
        else
          uiButton:addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:InviteParty(" .. tostring(key) .. ")")
          uiButton:addInputEvent("Mouse_RUp", "PaGlobal_FriendNew:DeleteFriend(" .. tostring(key) .. ")")
        end
        local uiGamerTag = (UI.getChildControl)(control, "StaticText_CharactorName")
        local uiFamilyName = (UI.getChildControl)(control, "StaticText_FamilyName")
        local uiLogin = (UI.getChildControl)(control, "StaticText_LoginLog")
        local uiButton = (UI.getChildControl)(control, "Button_FriendTemplete")
        local xboxFriendInfo = ToClient_getXboxFriendInfoByIndex(Int64toInt32(key))
        local isLogin = xboxFriendInfo:isOnline()
        local loginString = PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_ONLINE")
        if isLogin == false then
          loginString = PAGetString(Defines.StringSheet_GAME, "LUA_FRIENDINFO_LOGOUT")
        end
        uiGamerTag:SetText(xboxFriendInfo:getGamerTag())
        uiFamilyName:SetText(xboxFriendInfo:getName())
        uiLogin:SetText(loginString)
        if _ContentsGroup_isConsolePadControl then
          control:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobal_FriendNew:ShowXBoxProfile(" .. tostring(key) .. ")")
        else
          uiButton:addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:ShowXBoxProfile(" .. tostring(key) .. ")")
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.ShowXBoxProfile = function(self, index)
  -- function num : 0_10
  local xboxFriendInfo = ToClient_getXboxFriendInfoByIndex(Int64toInt32(index))
  ToClient_showXboxFriendProfile(xboxFriendInfo:getXuid())
end

-- DECOMPILER ERROR at PC132: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.ClickedFriendList = function(self, index)
  -- function num : 0_11 , upvalues : UnDefinedFriendIdx, UI_color
  local prevFriendIdx = self._currentFriendIdx
  self._currentFriendIdx = index
  do
    if UnDefinedFriendIdx ~= prevFriendIdx then
      local control = ((self._ui)._List2_FriendBg):GetContentByKey(prevFriendIdx)
      control:SetColor(UI_color.C_FFFFFFFF)
    end
    local control = ((self._ui)._List2_FriendBg):GetContentByKey(index)
    control:SetColor(UI_color.C_FFEF9C7F)
  end
end

-- DECOMPILER ERROR at PC136: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.ToggleTabType = function(self)
  -- function num : 0_12 , upvalues : UI_color
  if self._isPCFriendTab == true then
    ((self._ui)._RadioButton_PCFrined):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    ((self._ui)._RadioButton_XBoxFrined):SetFontColor(UI_color.C_FF797979)
  else
    ;
    ((self._ui)._RadioButton_PCFrined):SetFontColor(UI_color.C_FF797979)
    ;
    ((self._ui)._RadioButton_XBoxFrined):SetFontColor(UI_color.C_FFFFFFFF)
  end
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.ToggleTabList = function(self)
  -- function num : 0_13 , upvalues : UI_color
  if self._isFriendListTab == true then
    ((self._ui)._RadioButton_Friend):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    ((self._ui)._RadioButton_Offer):SetFontColor(UI_color.C_FF797979)
  else
    ;
    ((self._ui)._RadioButton_Friend):SetFontColor(UI_color.C_FF797979)
    ;
    ((self._ui)._RadioButton_Offer):SetFontColor(UI_color.C_FFFFFFFF)
  end
end

-- DECOMPILER ERROR at PC143: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.ClickLB = function(self)
  -- function num : 0_14
  if self._isPCFriendTab == true then
    return false
  end
  self._isPCFriendTab = true
  PaGlobal_FriendNew:Update()
end

-- DECOMPILER ERROR at PC146: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.ClickRB = function(self)
  -- function num : 0_15
  if self._isPCFriendTab == false then
    return false
  end
  self._isPCFriendTab = false
  PaGlobal_FriendNew:Update()
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.AddFriendAccept = function(self, index)
  -- function num : 0_16
  if ToClient_isAddFriendAllowed() then
    requestFriendList_acceptFriend(index)
  else
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DONOTHAVE_PRIVILEGE")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.AddFriendDecline = function(self, index)
  -- function num : 0_17
  requestFriendList_refuseFriend(index)
end

isSelectFriendBlocked = function(groupNo, userNo)
  -- function num : 0_18
  return RequestFriends_isBlockedFriend(userNo, groupNo - 1)
end

-- DECOMPILER ERROR at PC157: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.InviteParty = function(self, index)
  -- function num : 0_19
  local pcFriendGroup = RequestFriends_getFriendGroupAt(0)
  local friendInfo = pcFriendGroup:getFriendAt(index)
  local isSelfPlayerPlayingPvPMatch = (getSelfPlayer()):isDefinedPvPMatch()
  if friendInfo == nil then
    return 
  end
  local userCharacterName = friendInfo:getCharacterName()
  if isSelectFriendBlocked(0, friendInfo:getUserNo()) then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DONOTHAVE_PRIVILEGE")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    if isSelfPlayerPlayingPvPMatch == false then
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ACK_INVITE", "targetName", userCharacterName))
    end
    RequestParty_inviteCharacter(userCharacterName)
  end
end

-- DECOMPILER ERROR at PC160: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.DeleteFriend = function(self, index)
  -- function num : 0_20
  local pcFriendGroup = RequestFriends_getFriendGroupAt(0)
  local friendInfo = pcFriendGroup:getFriendAt(index)
  if friendInfo == nil then
    return 
  end
  requestFriendList_deleteFriend(friendInfo:getUserNo())
end

FriendList_show = function()
  -- function num : 0_21
  PaGlobal_FriendNew:Open()
end

FriendList_hide = function()
  -- function num : 0_22
  PaGlobal_FriendNew:Close()
end

-- DECOMPILER ERROR at PC167: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.Init = function(self)
  -- function num : 0_23
  Panel_FriendList:SetShow(false)
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._RadioButton_PCFrined = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_TabTypeBg, "RadioButton_PCFrined")
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._RadioButton_XBoxFrined = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_TabTypeBg, "RadioButton_XBoxFrined")
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._Static_LB = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_TabTypeBg, "Static_LB")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._Static_RB = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_TabTypeBg, "Static_RB")
  ;
  ((self._ui)._Static_LB):addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:ClickLB()")
  ;
  ((self._ui)._Static_RB):addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:ClickRB()")
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._RadioButton_Friend = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_TabListBg, "RadioButton_Friend")
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._RadioButton_Offer = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_TabListBg, "RadioButton_Offer")
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._Static_LT_ConsoleUI = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_TabListBg, "Static_LT_ConsoleUI")
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._Static_RT_ConsoleUI = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_TabListBg, "Static_RT_ConsoleUI")
  -- DECOMPILER ERROR at PC96: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._List2_FriendBg = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_FriendBg, "List2_FriendBg")
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._StaticText_CharactorNameTitle = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_FriendBg, "StaticText_CharactorNameTitle")
  ;
  ((self._ui)._List2_FriendBg):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._List2_FriendBg):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FriendNew_CreateFriendList")
  ;
  ((self._ui)._List2_OfferBg):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._List2_OfferBg):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FriendNew_CreateOfferList")
  -- DECOMPILER ERROR at PC144: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._StaticText_InviteParty = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_BottomBg, "StaticText_InviteParty")
  -- DECOMPILER ERROR at PC153: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._StaticText_DeleteFriend = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_BottomBg, "StaticText_DeleteFriend")
  -- DECOMPILER ERROR at PC162: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._Button_InviteParty = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_BottomBg, "Button_InviteParty")
  -- DECOMPILER ERROR at PC171: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._Button_Delete = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_BottomBg, "Button_Delete")
  -- DECOMPILER ERROR at PC180: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._Button_Close = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_BottomBg, "Button_Close")
  -- DECOMPILER ERROR at PC189: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._StaticText_AddFriend = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_BottomBg, "StaticText_AddFriend")
  -- DECOMPILER ERROR at PC198: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._Edit_Nickname = (UI.getChildControl)((PaGlobal_FriendNew._ui)._Static_AddFriendBg, "Edit_Nickname")
  ;
  ((self._ui)._Button_Delete):addInputEvent("Mouse_LUp", "PaGlobal_FriendNew:DeleteFriend()")
  ;
  ((self._ui)._Edit_Nickname):setXboxVirtualKeyBoardEndEvent("PaGlobal_FriendNew:EnterAddFriendEdit")
  if _ContentsGroup_isConsolePadControl then
    Panel_FriendList:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "PaGlobal_FriendNew:OpenAddFriendEdit()")
    Panel_FriendList:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "PaGlobal_FriendNew:ClickLB()")
    Panel_FriendList:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "PaGlobal_FriendNew:ClickRB()")
  end
end

PaGlobal_FriendNew_IsFriendAddEdit = function(targetUI)
  -- function num : 0_24
  do
    local self = PaGlobal_FriendNew
    do return targetUI ~= nil and targetUI:GetKey() == ((self._ui)._Edit_Nickname):GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC172: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.ClearAddFriendEdit = function(self)
  -- function num : 0_25
  Panel_FriendList:SetMonoTone(false)
  ;
  ((self._ui)._Edit_Nickname):SetEditText("", true)
  ;
  ((self._ui)._Static_AddFriendBg):SetShow(false)
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC175: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.EnterAddFriendEdit = function(self)
  -- function num : 0_26
  Panel_FriendList:SetMonoTone(false)
  requestFriendList_addFriend(((self._ui)._Edit_Nickname):GetEditText(), true)
  ;
  ((self._ui)._Static_AddFriendBg):SetShow(false)
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC178: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.OpenAddFriendEdit = function(self)
  -- function num : 0_27
  if self._isPCFriendTab == false then
    return 
  end
  Panel_FriendList:SetMonoTone(true)
  ;
  ((self._ui)._Static_AddFriendBg):SetShow(true)
  ;
  ((self._ui)._Edit_Nickname):SetEditText("", true)
  SetFocusEdit((self._ui)._Edit_Nickname)
end

PaGlobalFunc_FromClient_FriendNew_luaLoadComplete = function()
  -- function num : 0_28
  PaGlobal_FriendNew:Init()
end

-- DECOMPILER ERROR at PC183: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_FriendNew.Update = function(self)
  -- function num : 0_29
  self:ToggleTabType()
  self:ToggleTabList()
  if self._isPCFriendTab == true then
    self:UpdatePcFriendTab()
  else
    self:UpdateXboxFriendTab()
  end
end

FromClient_NotifyFriendMessage = function(msgType, strParam1, param1, param2)
  -- function num : 0_30
  local msgStr = ""
  if msgType == 0 then
    if param1 == 1 then
      msgStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FRIENDS_NOTIFYFRIENDMESSAGE_LOGIN", "strParam1", strParam1)
    else
      if msgType == 0 then
        msgStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FRIENDS_NOTIFYFRIENDMESSAGE_LOGOUT", "strParam1", strParam1)
      end
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
ResponseFriendList_updateFriends = function()
  -- function num : 0_31
  if Panel_FriendList:GetShow() == true then
    PaGlobal_FriendNew:Update()
  end
end

ResponseFriendList_updateAddFriends = function()
  -- function num : 0_32
  if Panel_FriendList:GetShow() == true then
    PaGlobal_FriendNew:Update()
  end
end

FromClient_NoticeNewMessage = function(isSoundNotice, isEffectNotice)
  -- function num : 0_33
  if isEffectNotice and Panel_FriendList:GetShow() == false then
    UIMain_FriendListUpdate()
    UIMain_FriendsUpdate()
  end
  if isSoundNotice then
    audioPostEvent_SystemUi(3, 11)
  end
end

friend_clickAddFriendClose = function()
  -- function num : 0_34
end

FriendMessanger_KillFocusEdit = function()
  -- function num : 0_35
end

friend_killFocusMessangerByKey = function()
  -- function num : 0_36
end

AddFriendInput_CheckCurrentUiEdit = function(targetUI)
  -- function num : 0_37
  return false
end

FriendMessanger_CheckCurrentUiEdit = function(targetUI)
  -- function num : 0_38
  return false
end

FriendfunctionYes = function()
  -- function num : 0_39
  ToClient_RquestDirectlyCompelte(true)
end

FriendfunctionNo = function()
  -- function num : 0_40
  ToClient_RquestDirectlyCompelte(false)
end

FromClient_FriendDirectlyMessage = function(fromUserName)
  -- function num : 0_41
  local messageBoxData = {title = PAGetString(Defines.StringSheet_RESOURCE, "FRIEND_TEXT_TITLE"), content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_XBOX_FRIEND_MESSAGE", "userName", fromUserName), functionYes = FriendfunctionYes, functionNo = FriendfunctionNo, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_FriendNew_luaLoadComplete")

