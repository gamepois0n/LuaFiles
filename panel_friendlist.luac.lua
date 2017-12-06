-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\friend\panel_friendlist.luac 

-- params : ...
-- function num : 0
Panel_FriendList:SetShow(false, false)
Panel_FriendList:RegisterShowEventFunc(true, "PaGlobal_FriendList:ShowAni()")
Panel_FriendList:RegisterShowEventFunc(false, "PaGlobal_FriendList:HideAni()")
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
PaGlobal_FriendList = {
_ui = {_btnClose = (UI.getChildControl)(Panel_FriendList, "Button_Close"), _btnQuestion = (UI.getChildControl)(Panel_FriendList, "Button_Question"), _btnRequestList = (UI.getChildControl)(Panel_FriendList, "Button_Offer"), _btnAddFriend = (UI.getChildControl)(Panel_FriendList, "Button_AddFriend"), _checkBtnSound = (UI.getChildControl)(Panel_FriendList, "CheckButton_Sound"), _checkBtnEffect = (UI.getChildControl)(Panel_FriendList, "CheckButton_Effect"), _checkBtnSortByOnline = (UI.getChildControl)(Panel_FriendList, "CheckButton_SortByOnline"), _treeFriend = (UI.getChildControl)(Panel_FriendList, "Tree_Friend"), _treeFriendBackStatic = nil, _treeFriendOverStatic = nil, _treeFriendScroll = nil}
, 
_groupData = {_selectedIndex = -1, 
_info = {}
, 
_infoByIndex = {}
, _count = 0, _maxCount = 5, _isMenuShow = false}
, 
_friendData = {_selectedIndex = -1, 
_info = {}
, _maxCount = 50, _isMenuShow = false}
}
-- DECOMPILER ERROR at PC91: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FriendList.Initialize = function(self)
  -- function num : 0_0
  ToClient_GetFriendList()
  Panel_FriendList:addInputEvent("Mouse_Out", "PaGlobal_FriendList:ClosePopupMenu()")
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._treeFriendBackStatic = (UI.getChildControl)((self._ui)._treeFriend, "Tree_Friend_BackStatic")
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._treeFriendOverStatic = (UI.getChildControl)((self._ui)._treeFriend, "Tree_Friend_OverStatic")
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._treeFriendScroll = (UI.getChildControl)((self._ui)._treeFriend, "Tree_Friend_Scroll")
  ;
  ((self._ui)._btnClose):addInputEvent("Mouse_LUp", " PaGlobal_FriendList:Hide()")
  ;
  ((self._ui)._btnQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelFriends\" )")
  ;
  ((self._ui)._btnQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelFriends\", \"true\")")
  ;
  ((self._ui)._btnQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelFriends\", \"false\")")
  ;
  ((self._ui)._btnRequestList):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:ClickRequestButton()")
  ;
  ((self._ui)._btnAddFriend):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:ClickAddFriendButton()")
  ;
  ((self._ui)._checkBtnSound):addInputEvent("Mouse_LUp", "ToClient_ToggleSoundNotice()")
  ;
  ((self._ui)._checkBtnEffect):addInputEvent("Mouse_LUp", "ToClient_ToggleEffectNotice()")
  ;
  ((self._ui)._checkBtnSortByOnline):addInputEvent("Mouse_LUp", "ToClient_ToggleSortByOnline()")
  ;
  ((self._ui)._treeFriend):addInputEvent("Mouse_RUp", "PaGlobal_FriendList:ClickFriendList(true)")
  ;
  ((self._ui)._treeFriend):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:ClickFriendList(false)")
  ;
  ((self._ui)._treeFriend):addInputEvent("Mouse_UpScroll", "PaGlobal_FriendList:ClosePopupMenu()")
  ;
  ((self._ui)._treeFriend):addInputEvent("Mouse_DownScroll", "PaGlobal_FriendList:ClosePopupMenu()")
  ;
  ((self._ui)._treeFriend):SetItemQuantity(15)
  ;
  ((self._ui)._treeFriendScroll):SetSize(((self._ui)._treeFriendScroll):GetSizeX(), ((self._ui)._treeFriend):GetSizeY())
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_FriendList.UpdateList = function(self)
  -- function num : 0_1
  local prePos = ((self._ui)._treeFriendScroll):GetControlPos()
  ;
  ((self._ui)._treeFriend):ClearTree()
  ;
  ((self._ui)._treeFriend):SetShow(true)
  ;
  ((self._ui)._treeFriendBackStatic):SetShow(true)
  ;
  ((self._ui)._treeFriendOverStatic):SetShow(true)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._groupData)._count = ToClient_GetFriendGroupCount()
  local indexCnt = 0
  local groupIndexCnt = 0
  for groupIndex = 0, (self._groupData)._count - 1 do
    local friendGroup = ToClient_GetFriendGroupAt(groupIndex)
    local rootItem = ((self._ui)._treeFriend):createRootItem()
    if friendGroup:getGroupNo() == -1 then
      rootItem:SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_GROUP_ETC"))
    else
      rootItem:SetText(friendGroup:getName())
    end
    rootItem:SetCustomData(rootItem)
    ;
    ((self._ui)._treeFriend):AddRootItem(rootItem)
    -- DECOMPILER ERROR at PC68: Confused about usage of register: R10 in 'UnsetPending'

    ;
    ((self._groupData)._info)[indexCnt] = friendGroup
    -- DECOMPILER ERROR at PC71: Confused about usage of register: R10 in 'UnsetPending'

    ;
    ((self._groupData)._infoByIndex)[groupIndex] = friendGroup
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self._groupData)._count = (self._groupData)._count
    indexCnt = indexCnt + 1
    groupIndexCnt = indexCnt
    if friendGroup:isHide() == false then
      local friendCount = friendGroup:getFriendCount()
      for friendIndex = 0, friendCount - 1 do
        local friendInfo = friendGroup:getFriendAt(friendIndex)
        local childItem = ((self._ui)._treeFriend):createChildItem()
        local friendName = (friendInfo:getName())
        local fontColor = nil
        if friendInfo:isOnline() == false then
          local s64_lastLogoutTime = friendInfo:getLastLogoutTime_s64()
          friendName = friendName .. "(" .. convertStringFromDatetimeOverHourForFriends(s64_lastLogoutTime) .. ")"
          fontColor = (Defines.Color).C_FF888888
        else
          do
            fontColor = (Defines.Color).C_FFFFFFFF
            if friendInfo:getWp() > -1 and friendInfo:getExplorationPoint() > -1 then
              friendName = friendName .. "(" .. friendInfo:getCharacterName() .. ", " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. tostring(friendInfo:getLevel()) .. ") " .. tostring(friendInfo:getWp()) .. "/" .. tostring(friendInfo:getExplorationPoint())
            else
              friendName = friendName .. "(" .. PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_ONLINE") .. ")"
            end
            childItem:SetText(friendName)
            childItem:SetFontColor(fontColor)
            childItem:SetCustomData(childItem)
            ;
            ((self._ui)._treeFriend):AddItem(childItem, rootItem)
            local messageList = ToClient_GetFriendMessageListByUserNo(friendInfo:getUserNo())
            if messageList ~= nil then
              local messageCount = messageList:getMessageCount()
              if messageCount > 0 then
                local childIcon = childItem:GetChildIcon()
                childIcon:SetText(messageCount)
                childIcon:SetTextureByPath("New_UI_Common_forLua/Widget/Character_Main/Knowledge_00.dds")
                childIcon:SetTextureUV(196, 1, 20, 20)
                childIcon:SetIconSize(14, 14)
              end
            end
            do
              do
                -- DECOMPILER ERROR at PC206: Confused about usage of register: R20 in 'UnsetPending'

                ;
                ((self._friendData)._info)[indexCnt] = friendInfo
                indexCnt = indexCnt + 1
                -- DECOMPILER ERROR at PC208: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC208: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC208: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC208: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
      if friendCount > 0 then
        ((self._ui)._treeFriend):SetSelectItem(groupIndexCnt)
      end
    end
  end
  ;
  ((self._ui)._treeFriend):RefreshOpenList()
  ;
  ((self._ui)._treeFriendScroll):SetControlPos(prePos)
end

FGlobal_FriendList_UpdateList = function()
  -- function num : 0_2
  PaGlobal_FriendList:UpdateList()
end

FromClient_UpdateFriendList = function()
  -- function num : 0_3
  PaGlobal_FriendList:UpdateList()
end

FromClient_NoticeNewMessage = function(isSoundNotice, isEffectNotice)
  -- function num : 0_4
  if isEffectNotice and Panel_FriendList:GetShow() == false then
    UIMain_FriendListUpdate()
    UIMain_FriendsUpdate()
  end
  if isSoundNotice then
    audioPostEvent_SystemUi(3, 11)
  end
end

PaGlobal_FriendList:Initialize()
local FriendRequestList = {_maxFriendCount = 30, 
_ui = {_backGround = (UI.getChildControl)(Panel_FriendList, "Static_OfferWindow"), _listBox = nil, _btnClose = nil, _btnAccept = nil, _btnRefuse = nil, _partLine = nil, _titleName = nil, _scroll = nil, _scrollCtrlButton = nil}
, _selectFriendIndex = -1, _slotRows = 12}
FriendRequestList.SetShow = function(self, isShow)
  -- function num : 0_5
  ((self._ui)._backGround):SetShow(isShow)
end

FriendRequestList.Initialize = function(self)
  -- function num : 0_6
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._listBox = (UI.getChildControl)((self._ui)._backGround, "Listbox_RequestFriend")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btnClose = (UI.getChildControl)((self._ui)._backGround, "RequestFriend_Close")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btnAccept = (UI.getChildControl)((self._ui)._backGround, "Button_Accept")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btnRefuse = (UI.getChildControl)((self._ui)._backGround, "Button_Refuse")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._partLine = (UI.getChildControl)((self._ui)._backGround, "Static_RequestFriendPartLine")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._titleName = (UI.getChildControl)((self._ui)._backGround, "StaticText_RequestFriendName")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._scroll = (UI.getChildControl)((self._ui)._listBox, "RequestFriend_Scroll")
  ;
  ((self._ui)._scroll):SetControlTop()
  ;
  ((self._ui)._listBox):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:ClickRequestList()")
  ;
  ((self._ui)._btnClose):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:HideRequestList()")
  ;
  ((self._ui)._btnAccept):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:AcceptRequest()")
  ;
  ((self._ui)._btnRefuse):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:RefuseRequest()")
  self:SetShow(false)
end

FriendRequestList.UpdateList = function(self)
  -- function num : 0_7
  local listControl = (self._ui)._listBox
  listControl:DeleteAll()
  local friendCount = ToClient_GetAddFriendCount()
  for friendIndex = 0, friendCount - 1 do
    local addFriendInfo = ToClient_GetAddFriendAt(friendIndex)
    listControl:AddItemWithLineFeed(addFriendInfo:getName(), (Defines.Color).C_FFC4BEBE)
  end
  ;
  (UIScroll.SetButtonSize)((self._ui)._scroll, self._slotRows, friendCount)
  if friendCount > 0 then
    self:SetShow(true)
  end
  FGlobal_NewFriendAlertOff()
end

FriendRequestList.Show = function(self)
  -- function num : 0_8
  self._selectFriendIndex = -1
  self:SetShow(true)
  ToClient_GetAddFriendList()
  self:UpdateList()
end

FriendRequestList.Hide = function(self)
  -- function num : 0_9
  self:SetShow(false)
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FriendList.ClickRequestButton = function(self)
  -- function num : 0_10 , upvalues : FriendRequestList
  if ((FriendRequestList._ui)._backGround):GetShow() then
    FriendRequestList:Hide()
  else
    FriendRequestList:Show()
  end
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FriendList.AcceptRequest = function(self)
  -- function num : 0_11 , upvalues : FriendRequestList
  if FriendRequestList._selectFriendIndex ~= -1 then
    ToClient_AcceptFriend(FriendRequestList._selectFriendIndex)
  end
end

-- DECOMPILER ERROR at PC145: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FriendList.RefuseRequest = function(self)
  -- function num : 0_12 , upvalues : FriendRequestList
  if FriendRequestList._selectFriendIndex ~= -1 then
    ToClient_RefuseFriend(FriendRequestList._selectFriendIndex)
  end
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FriendList.ClickRequestList = function(self)
  -- function num : 0_13 , upvalues : FriendRequestList
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  FriendRequestList._selectFriendIndex = ((FriendRequestList._ui)._listBox):GetSelectIndex()
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FriendList.HideRequestList = function(self)
  -- function num : 0_14 , upvalues : FriendRequestList
  FriendRequestList:Hide()
end

FromClient_UpdateFriendRequestList = function()
  -- function num : 0_15 , upvalues : FriendRequestList
  FriendRequestList:UpdateList()
end

FriendRequestList:Initialize()
local PopupAddFriend = {
_ui = {_backGround = (UI.getChildControl)(Panel_FriendList, "Static_FriendName_BG"), _editName = nil, _btnConfirm = nil, _btnCancel = nil, _btnClose = nil, _staticTitle = nil, _checkUserNickName = nil}
}
PopupAddFriend.SetShow = function(self, isShow)
  -- function num : 0_16
  ((self._ui)._backGround):SetShow(isShow)
  if isShow then
    (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
    SetFocusEdit((self._ui)._editName)
    ;
    ((self._ui)._editName):SetMaxInput(getGameServiceTypeUserNickNameLength())
  else
    if AllowChangeInputMode() then
      (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
    else
      SetFocusChatting()
    end
  end
  ;
  ((self._ui)._editName):SetEditText("", true)
end

PopupAddFriend.Initialize = function(self)
  -- function num : 0_17
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._editName = (UI.getChildControl)((self._ui)._backGround, "Edit_FriendName")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btnConfirm = (UI.getChildControl)((self._ui)._backGround, "Button_AddFriend_Confirm")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btnCancel = (UI.getChildControl)((self._ui)._backGround, "Button_AddFriend_Cancel")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btnClose = (UI.getChildControl)((self._ui)._backGround, "Button_AddFriend_Close")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticTitle = (UI.getChildControl)((self._ui)._backGround, "StaticText_AddFriend")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._checkUserNickName = (UI.getChildControl)((self._ui)._backGround, "CheckButton_IsUserNickName")
  ;
  ((self._ui)._btnConfirm):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:AddFriend()")
  ;
  ((self._ui)._btnCancel):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:CloseAddFriendPopup()")
  ;
  ((self._ui)._btnClose):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:CloseAddFriendPopup()")
  ;
  ((self._ui)._editName):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:ChangeInputMode()")
  ;
  ((self._ui)._checkUserNickName):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:ChangeNickNameMode()")
  ;
  ((self._ui)._checkUserNickName):SetCheck(true)
  ;
  ((self._ui)._checkUserNickName):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_BTN_NICKNAME"))
  ;
  ((self._ui)._editName):RegistReturnKeyEvent("PaGlobal_FriendList:AddFriend()")
  self:SetShow(false)
  PaGlobal_FriendList:ChangeNickNameMode()
end

-- DECOMPILER ERROR at PC181: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FriendList.ClickAddFriendButton = function(self)
  -- function num : 0_18 , upvalues : PopupAddFriend
  if ((PopupAddFriend._ui)._backGround):GetShow() then
    PopupAddFriend:SetShow(false)
  else
    PopupAddFriend:SetShow(true)
  end
end

-- DECOMPILER ERROR at PC185: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FriendList.AddFriend = function(self)
  -- function num : 0_19 , upvalues : PopupAddFriend
  local isNickName = ((PopupAddFriend._ui)._checkUserNickName):IsCheck()
  ToClient_AddFriend(((PopupAddFriend._ui)._editName):GetEditText(), isNickName)
  PopupAddFriend:SetShow(false)
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC189: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FriendList.CloseAddFriendPopup = function(self)
  -- function num : 0_20 , upvalues : PopupAddFriend
  PopupAddFriend:SetShow(false)
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC192: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FriendList.ChangeInputMode = function(self)
  -- function num : 0_21
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
end

-- DECOMPILER ERROR at PC196: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_FriendList.ChangeNickNameMode = function(self)
  -- function num : 0_22 , upvalues : PopupAddFriend
  local isNickName = not ((PopupAddFriend._ui)._checkUserNickName):IsCheck()
  if isNickName then
    ((PopupAddFriend._ui)._checkUserNickName):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_BTN_NICKNAME"))
  else
    ;
    ((PopupAddFriend._ui)._checkUserNickName):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_BTN_CHARACTERNAME"))
  end
end

FGlobal_FriendList_AddFriendPopupClose = function()
  -- function num : 0_23 , upvalues : PopupAddFriend
  PopupAddFriend:SetShow(false)
  ClearFocusEdit()
end

FGlobal_FriendList_CheckUiEdit = function(targetUI)
  -- function num : 0_24 , upvalues : PopupAddFriend
  do return targetUI ~= nil and targetUI:GetKey() == ((PopupAddFriend._ui)._editName):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

PopupAddFriend:Initialize()
local PopupRenameGroup = {
_ui = {_backGround = (UI.getChildControl)(Panel_FriendList, "Static_GroupName_BG"), _editName = nil, _btnConfirm = nil, _btnCancel = nil, _btnClose = nil, _staticTitle = nil}
}
PopupRenameGroup.SetShow = function(self, isShow)
  -- function num : 0_25
  self._isShow = isShow
  ;
  ((self._ui)._backGround):SetShow(isShow)
  if isShow then
    (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
  else
    if AllowChangeInputMode() then
      (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
    else
      SetFocusChatting()
    end
  end
  ;
  ((self._ui)._editName):SetEditText("", true)
end

PopupRenameGroup.Initialize = function(self)
  -- function num : 0_26
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._editName = (UI.getChildControl)((self._ui)._backGround, "Edit_GroupName")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btnConfirm = (UI.getChildControl)((self._ui)._backGround, "Button_GroupName_Confirm")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btnCancel = (UI.getChildControl)((self._ui)._backGround, "Button_GroupName_Cancel")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._btnClose = (UI.getChildControl)((self._ui)._backGround, "Button_GroupName_Close")
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticTitle = (UI.getChildControl)((self._ui)._backGround, "StaticText_ChangeGroupName")
  ;
  ((self._ui)._btnConfirm):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:PopupRenameGroup()")
  ;
  ((self._ui)._btnCancel):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:ClosePopupRenameGroup()")
  ;
  ((self._ui)._btnClose):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:ClosePopupRenameGroup()")
  ;
  ((self._ui)._editName):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:ChangeInputMode()")
  ;
  ((self._ui)._editName):SetMaxInput(getGameServiceTypeUserNickNameLength())
  self:SetShow(false)
end

-- DECOMPILER ERROR at PC226: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_FriendList.PopupRenameGroup = function(self)
  -- function num : 0_27 , upvalues : PopupRenameGroup
  do
    if (self._groupData)._selectedIndex >= 0 then
      local friendGroup = ((self._groupData)._info)[(self._groupData)._selectedIndex]
      if ((PopupRenameGroup._ui)._editName):GetEditText() == friendGroup:getName() then
        return 
      end
      _PA_LOG("YHG", tostring(((PopupRenameGroup._ui)._editName):GetEditText()))
      _PA_LOG("YHG", tostring(""))
      if ((PopupRenameGroup._ui)._editName):GetEditText() == nil then
        _PA_LOG("YHG", tostring(nil))
        return 
      end
      ToClient_RenameGroup((((self._groupData)._info)[(self._groupData)._selectedIndex]):getGroupNo(), ((PopupRenameGroup._ui)._editName):GetEditText())
    end
    PopupRenameGroup:SetShow(false)
  end
end

-- DECOMPILER ERROR at PC230: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_FriendList.ClosePopupRenameGroup = function(self)
  -- function num : 0_28 , upvalues : PopupRenameGroup
  PopupRenameGroup:SetShow(false)
end

PopupRenameGroup:Initialize()
local styleMenuButton = (UI.getChildControl)(Panel_FriendList, "Style_Function")
styleMenuButton:SetShow(false)
local PopupGroupMenu = {
_ui = {_backGround, _renameGroup, _addGroup}
}
PopupGroupMenu.Initialize = function(self)
  -- function num : 0_29 , upvalues : UI_PUCT, styleMenuButton
  local stylePopupBackGround = (UI.getChildControl)(Panel_FriendList, "Static_Function_BG")
  stylePopupBackGround:SetShow(false)
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._backGround = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_FriendList, "FriendPopupGroupMenu")
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._renameGroup = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, (self._ui)._backGround, "FriendPopupRenameGroup")
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._addGroup = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, (self._ui)._backGround, "FriendPopupAddGroup")
  CopyBaseProperty(styleMenuButton, (self._ui)._renameGroup)
  CopyBaseProperty(stylePopupBackGround, (self._ui)._backGround)
  CopyBaseProperty(styleMenuButton, (self._ui)._addGroup)
  local buttonSizeX = styleMenuButton:GetSizeX()
  local buttonSizeY = styleMenuButton:GetSizeY()
  ;
  ((self._ui)._backGround):SetSize(buttonSizeX, buttonSizeY * 2)
  ;
  ((self._ui)._renameGroup):SetPosX(0)
  ;
  ((self._ui)._renameGroup):SetPosY(0)
  ;
  ((self._ui)._addGroup):SetPosX(0)
  ;
  ((self._ui)._addGroup):SetPosY(buttonSizeY)
  ;
  ((self._ui)._renameGroup):SetShow(true)
  ;
  ((self._ui)._addGroup):SetShow(true)
  ;
  ((self._ui)._renameGroup):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_RENAME"))
  ;
  ((self._ui)._addGroup):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_ADD_GROUP"))
  ;
  ((self._ui)._renameGroup):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:RenameFriendGroup()")
  ;
  ((self._ui)._addGroup):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:AddFriendGroup()")
  ;
  ((self._ui)._backGround):SetShow(false)
end

PopupGroupMenu.SetShow = function(self, isShow)
  -- function num : 0_30
  local groupEtc = 0
  if groupEtc == (PaGlobal_FriendList._groupData)._selectedIndex then
    ((self._ui)._renameGroup):SetEnable(false)
    ;
    ((self._ui)._renameGroup):SetMonoTone(true)
    ;
    ((self._ui)._renameGroup):SetIgnore(true)
  else
    ;
    ((self._ui)._renameGroup):SetEnable(true)
    ;
    ((self._ui)._renameGroup):SetMonoTone(false)
    ;
    ((self._ui)._renameGroup):SetIgnore(false)
  end
  ;
  ((self._ui)._addGroup):SetEnable(true)
  ;
  ((self._ui)._addGroup):SetIgnore(false)
  ;
  ((self._ui)._backGround):SetShow(isShow)
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (PaGlobal_FriendList._groupData)._isMenuShow = isShow
end

PopupGroupMenu.SetPos = function(self, x, y)
  -- function num : 0_31
  ((self._ui)._backGround):SetPosX(x)
  ;
  ((self._ui)._backGround):SetPosY(y)
end

PopupGroupMenu:Initialize()
local PopupFriendMenu = {
_ui = {_backGround, _partyInvite, _messanger, _moveGroup, _delete}
}
PopupFriendMenu.Initialize = function(self)
  -- function num : 0_32 , upvalues : UI_PUCT, styleMenuButton
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._backGround = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_FriendList, "FriendPopupFriendMenu")
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._partyInvite = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, (self._ui)._backGround, "FriendPopupPartyInvite")
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._messanger = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, (self._ui)._backGround, "FriendPopupWhisper")
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._moveGroup = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, (self._ui)._backGround, "FriendPopupMoveGroup")
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._delete = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, (self._ui)._backGround, "FriendPopupDeleteFriend")
  CopyBaseProperty(styleMenuButton, (self._ui)._partyInvite)
  CopyBaseProperty(styleMenuButton, (self._ui)._messanger)
  CopyBaseProperty(styleMenuButton, (self._ui)._moveGroup)
  CopyBaseProperty(styleMenuButton, (self._ui)._delete)
  local buttonSizeX = styleMenuButton:GetSizeX()
  local buttonSizeY = styleMenuButton:GetSizeY()
  ;
  ((self._ui)._backGround):SetSize(buttonSizeX, buttonSizeY * 2)
  ;
  ((self._ui)._partyInvite):SetPosX(0)
  ;
  ((self._ui)._partyInvite):SetPosY(0)
  ;
  ((self._ui)._messanger):SetPosX(0)
  ;
  ((self._ui)._messanger):SetPosY(buttonSizeY)
  ;
  ((self._ui)._moveGroup):SetPosX(0)
  ;
  ((self._ui)._moveGroup):SetPosY(buttonSizeY * 2)
  ;
  ((self._ui)._delete):SetPosX(0)
  ;
  ((self._ui)._delete):SetPosY(buttonSizeY * 3)
  ;
  ((self._ui)._partyInvite):SetShow(true)
  ;
  ((self._ui)._messanger):SetShow(true)
  ;
  ((self._ui)._moveGroup):SetShow(true)
  ;
  ((self._ui)._delete):SetShow(true)
  ;
  ((self._ui)._partyInvite):SetText(PAGetString(Defines.StringSheet_GAME, "INTERACTION_MENU3"))
  ;
  ((self._ui)._messanger):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_WHISPER"))
  ;
  ((self._ui)._moveGroup):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_CHANGE_GROUP"))
  ;
  ((self._ui)._delete):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_REMOVE_FRIEND"))
  ;
  ((self._ui)._partyInvite):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:PartyInvite()")
  ;
  ((self._ui)._messanger):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:OpenMessanger()")
  ;
  ((self._ui)._moveGroup):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:GroupMoveList()")
  ;
  ((self._ui)._delete):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:DeleteFriend()")
  ;
  ((self._ui)._backGround):SetShow(false)
end

PopupFriendMenu.SetShow = function(self, isShow)
  -- function num : 0_33
  if isShow then
    local isOnline = (((PaGlobal_FriendList._friendData)._info)[(PaGlobal_FriendList._friendData)._selectedIndex]):isOnline()
    local isMessage = ToClient_IsMessageList((((PaGlobal_FriendList._friendData)._info)[(PaGlobal_FriendList._friendData)._selectedIndex]):getUserNo())
    if isOnline == false and isMessage == false then
      ((self._ui)._messanger):SetEnable(false)
      ;
      ((self._ui)._messanger):SetMonoTone(true)
      ;
      ((self._ui)._messanger):SetIgnore(true)
    else
      ;
      ((self._ui)._messanger):SetEnable(true)
      ;
      ((self._ui)._messanger):SetMonoTone(false)
      ;
      ((self._ui)._messanger):SetIgnore(false)
    end
  end
  do
    ;
    ((self._ui)._backGround):SetShow(isShow)
    -- DECOMPILER ERROR at PC64: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (PaGlobal_FriendList._friendData)._isMenuShow = isShow
  end
end

PopupFriendMenu.SetPos = function(self, x, y)
  -- function num : 0_34
  ((self._ui)._backGround):SetPosX(x)
  ;
  ((self._ui)._backGround):SetPosY(y)
end

PopupFriendMenu:Initialize()
local PopupGroupList = {
_ui = {_backGround; 
_moveGroups = {}
}
}
PopupGroupList.Initialize = function(self)
  -- function num : 0_35 , upvalues : UI_PUCT, styleMenuButton
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._backGround = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_FriendList, "FriendPopupGroupList")
  for groupIndex = 0, (PaGlobal_FriendList._groupData)._maxCount - 1 do
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._moveGroups)[groupIndex] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, (self._ui)._backGround, "FriendPopupMoveGroups_" .. groupIndex)
    CopyBaseProperty(styleMenuButton, ((self._ui)._moveGroups)[groupIndex])
    local buttonSizeY = styleMenuButton:GetSizeY()
    ;
    (((self._ui)._moveGroups)[groupIndex]):SetSize(styleMenuButton:GetSizeX() + styleMenuButton:GetSizeX() / 3, styleMenuButton:GetSizeY())
    ;
    (((self._ui)._moveGroups)[groupIndex]):SetPosX(0)
    ;
    (((self._ui)._moveGroups)[groupIndex]):SetPosY(buttonSizeY * groupIndex)
    ;
    (((self._ui)._moveGroups)[groupIndex]):addInputEvent("Mouse_LUp", "PaGlobal_FriendList:MoveGroup(" .. groupIndex .. ")")
  end
  ;
  ((self._ui)._backGround):SetShow(false)
end

PopupGroupList.UpdateGroups = function(self)
  -- function num : 0_36 , upvalues : styleMenuButton
  for index = 0, (PaGlobal_FriendList._groupData)._maxCount - 1 do
    (((self._ui)._moveGroups)[index]):SetShow(false)
  end
  ;
  ((self._ui)._backGround):SetSize(styleMenuButton:GetSizeX(), styleMenuButton:GetSizeY() * (PaGlobal_FriendList._groupData)._count)
  for groupIndex = 0, (PaGlobal_FriendList._groupData)._count - 1 do
    local groupName = (((PaGlobal_FriendList._groupData)._infoByIndex)[groupIndex]):getName()
    if groupName == "" then
      (((self._ui)._moveGroups)[groupIndex]):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_GROUP_ETC"))
    else
      ;
      (((self._ui)._moveGroups)[groupIndex]):SetText(groupName)
    end
    ;
    (((self._ui)._moveGroups)[groupIndex]):SetShow(true)
  end
end

PopupGroupList.SetShow = function(self, isShow)
  -- function num : 0_37 , upvalues : PopupGroupList
  ((self._ui)._backGround):SetShow(isShow)
  if isShow then
    PopupGroupList:UpdateGroups()
  end
end

PopupGroupList.SetPos = function(self, x, y)
  -- function num : 0_38
  ((self._ui)._backGround):SetPosX(x)
  ;
  ((self._ui)._backGround):SetPosY(y)
end

PopupGroupList:Initialize()
-- DECOMPILER ERROR at PC302: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.RenameFriendGroup = function(self)
  -- function num : 0_39 , upvalues : PopupRenameGroup, PopupGroupMenu
  PopupRenameGroup:SetShow(true)
  PopupGroupMenu:SetShow(false)
end

-- DECOMPILER ERROR at PC306: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.AddFriendGroup = function(self)
  -- function num : 0_40 , upvalues : PopupGroupMenu
  ToClient_AddFriendGroup(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_NEW_GROUPNAME"))
  PopupGroupMenu:SetShow(false)
end

-- DECOMPILER ERROR at PC312: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.ClickFriendList = function(self, isRUp)
  -- function num : 0_41 , upvalues : PopupFriendMenu, PopupGroupMenu, PopupGroupList
  ((self._ui)._treeFriend):SetSelectItemMousePoint()
  local friendIndex = ((self._ui)._treeFriend):GetSelectItem()
  if friendIndex == nil then
    return 
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R3 in 'UnsetPending'

  if isRUp then
    if (CppEnums.TreeItemType).PA_TREE_ITEM_ROOT == friendIndex:GetType() then
      (self._groupData)._selectedIndex = friendIndex:GetIndex()
      PopupFriendMenu:SetShow(false)
      PopupGroupMenu:SetShow(true)
      PopupGroupMenu:SetPos(getMousePosX() - Panel_FriendList:GetPosX(), getMousePosY() - Panel_FriendList:GetPosY())
    else
      -- DECOMPILER ERROR at PC51: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (self._friendData)._selectedIndex = friendIndex:GetIndex()
      PopupGroupMenu:SetShow(false)
      PopupFriendMenu:SetShow(true)
      PopupFriendMenu:SetPos(getMousePosX() - Panel_FriendList:GetPosX(), getMousePosY() - Panel_FriendList:GetPosY())
    end
    PopupGroupList:SetShow(false)
  else
    if (self._friendData)._isMenuShow or (self._groupData)._isMenuShow then
      self:ClosePopupMenu()
    else
    end
  end
  -- DECOMPILER ERROR at PC102: Confused about usage of register: R3 in 'UnsetPending'

  if (CppEnums.TreeItemType).PA_TREE_ITEM_ROOT == friendIndex:GetType() then
    (self._friendData)._selectedIndex = friendIndex:GetIndex()
    -- DECOMPILER ERROR at PC116: Confused about usage of register: R3 in 'UnsetPending'

    if (((self._friendData)._info)[(self._friendData)._selectedIndex]):getFriendType() == 1 then
      (self._friendData)._selectedIndex = friendIndex:GetIndex()
      self:OpenMessanger()
    end
  end
end

-- DECOMPILER ERROR at PC315: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.PartyInvite = function(self)
  -- function num : 0_42
  local userCharacterName = (((PaGlobal_FriendList._friendData)._info)[(PaGlobal_FriendList._friendData)._selectedIndex]):getCharacterName()
  local isOnline = (((PaGlobal_FriendList._friendData)._info)[(PaGlobal_FriendList._friendData)._selectedIndex]):isOnline()
  local isSelfPlayerPlayingPvPMatch = (getSelfPlayer()):isDefinedPvPMatch()
  if isSelfPlayerPlayingPvPMatch == false then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ACK_INVITE", "targetName", userCharacterName))
  end
  RequestParty_inviteCharacter(userCharacterName)
end

-- DECOMPILER ERROR at PC319: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.OpenMessanger = function(self)
  -- function num : 0_43 , upvalues : PopupFriendMenu
  local selectedUser = ((self._friendData)._info)[(self._friendData)._selectedIndex]
  ToClient_OpenMessanger(selectedUser:getUserNo(), selectedUser:getName(), selectedUser:isOnline())
  PopupFriendMenu:SetShow(false)
end

-- DECOMPILER ERROR at PC324: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.GroupMoveList = function(self)
  -- function num : 0_44 , upvalues : PopupGroupList, PopupFriendMenu
  PopupGroupList:SetShow(true)
  PopupGroupList:SetPos(((PopupFriendMenu._ui)._backGround):GetPosX() + ((PopupFriendMenu._ui)._backGround):GetSizeX(), ((PopupFriendMenu._ui)._backGround):GetPosY())
end

-- DECOMPILER ERROR at PC328: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.DeleteFriend = function(self)
  -- function num : 0_45 , upvalues : PopupFriendMenu
  ToClient_DeleteFriend((((self._friendData)._info)[(self._friendData)._selectedIndex]):getUserNo())
  PopupFriendMenu:SetShow(false)
end

-- DECOMPILER ERROR at PC333: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.MoveGroup = function(self, groupIndex)
  -- function num : 0_46 , upvalues : PopupFriendMenu, PopupGroupList
  ToClient_MoveGroup((((self._friendData)._info)[(self._friendData)._selectedIndex]):getUserNo(), (((self._groupData)._infoByIndex)[groupIndex]):getGroupNo())
  PopupFriendMenu:SetShow(false)
  PopupGroupList:SetShow(false)
end

-- DECOMPILER ERROR at PC336: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.Show = function(self)
  -- function num : 0_47
  local friendsBTN = (UI.getChildControl)(Panel_UIMain, "Button_FriendList")
  friendsBTN:EraseAllEffect()
  FGlobal_NewMessage_Close()
  Panel_FriendList:SetShow(true, true)
end

-- DECOMPILER ERROR at PC341: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.Hide = function(self)
  -- function num : 0_48 , upvalues : PopupAddFriend, FriendRequestList
  self:ClosePopupMenu(false)
  PopupAddFriend:SetShow(false)
  FriendRequestList:SetShow(false)
  Panel_FriendList:SetShow(false, true)
end

-- DECOMPILER ERROR at PC345: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.ShowAni = function(self)
  -- function num : 0_49 , upvalues : FriendRequestList
  ToClient_GetFriendList()
  ToClient_GetAddFriendList()
  self:UpdateList()
  FriendRequestList:UpdateList()
  ;
  (UIAni.AlphaAnimation)(1, Panel_FriendList, 0, 0.15)
  local aniInfo1 = Panel_FriendList:addScaleAnimation(0, 0.08, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_FriendList:GetSizeX() / 2
  aniInfo1.AxisY = Panel_FriendList:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_FriendList:addScaleAnimation(0.08, 0.15, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_FriendList:GetSizeX() / 2
  aniInfo2.AxisY = Panel_FriendList:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

-- DECOMPILER ERROR at PC348: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.HideAni = function(self)
  -- function num : 0_50
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_FriendList, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

-- DECOMPILER ERROR at PC354: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_FriendList.ClosePopupMenu = function(self)
  -- function num : 0_51 , upvalues : PopupFriendMenu, PopupGroupMenu, PopupGroupList
  PopupFriendMenu:SetShow(false)
  PopupGroupMenu:SetShow(false)
  PopupGroupList:SetShow(false)
end

FGlobal_FriendList_Show = function()
  -- function num : 0_52
  PaGlobal_FriendList:Show()
end

FGlobal_FriendList_Hide = function()
  -- function num : 0_53
  PaGlobal_FriendList:Hide()
end

FromClient_OnScreenResize_FriendList = function()
  -- function num : 0_54
  Panel_FriendList:SetPosX(getScreenSizeX() - Panel_FriendList:GetSizeX())
  Panel_FriendList:SetPosY(getScreenSizeY() / 2 - Panel_FriendList:GetSizeY() / 2)
end

registerEvent("FromClient_UpdateFriendList", "FromClient_UpdateFriendList")
registerEvent("FromClient_NoticeNewMessage", "FromClient_NoticeNewMessage")
registerEvent("FromClient_UpdateFriendRequestList", "FromClient_UpdateFriendRequestList")
registerEvent("onScreenResize", "FromClient_OnScreenResize_FriendList")

