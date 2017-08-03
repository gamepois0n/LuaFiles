-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\chatting\panel_chatnew.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_CT = CppEnums.ChatType
local UI_CNT = CppEnums.EChatNoticeType
local UI_Group = Defines.UIGroup
local IM = CppEnums.EProcessorInputMode
local UI_CST = CppEnums.ChatSystemType
local currentPoolIndex, clickedMessageIndex, clickedName, clickedUserNickName, clickedMsg, isMouseOnChattingViewIndex = nil, nil, nil, nil, nil, nil
local isMouseOn = false
local chattingWindowMaxWidth = 600
local chattingUpTime = 0
local premsgCount = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0}
local prepopmsgCount = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0}
local issmoothupMessage = false
local smoothScorllTime = 0
local deltascrollPosy = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0}
local issmoothscroll = false
local preScrollControlPos = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0}
local ScrollHistroy = {_maxHistoryCount, _maxHistoryCount, _maxHistoryCount, _maxHistoryCount; [0] = _maxHistoryCount}
local smoothWheelScorllTime = 0
local issmoothWheelscroll = false
local isUpDown = false
local scrollIndex = 0
local scrollresetSpeed = 0
local smoothResetScorllTime = 0
local isResetsmoothscroll = false
local preDownPosY = 0
local ismsgin = false
local isUsedSmoothChattingUp = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).ChattingAnimation)
local isReportGoldSellerOpen = ToClient_IsContentsGroupOpen("89")
local _scroll_Interval_AddPos = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0}
local ChatSubMenu = {_mainPanel = Panel_Chat_SubMenu, _uiBg = (UI.getChildControl)(Panel_Chat_SubMenu, "Static_SubMenu"), _uiButtonWhisper = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_Whisper"), _uiButtonAddFriend = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_AddFriend"), _uiButtonInviteParty = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_InviteParty"), _uiButtonInviteLargeParty = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_InviteLargeParty"), _uiButtonInviteGuild = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_InviteGuild"), _uiButtonInviteCompetition = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_InviteCompetition"), _uiButtonBlock = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_Block"), _uiButtonReportGoldSeller = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_ReportGoldSeller"), _uiButtonBlockVote = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_BlockVote"), _uiButtonIntroduce = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_ShowIntroduce"), _uiButtonWinClose = (UI.getChildControl)(Panel_Chat_SubMenu, "Button_WinClose")}
local partyPosY = (ChatSubMenu._uiButtonInviteParty):GetPosY()
local guildPosY = (ChatSubMenu._uiButtonInviteGuild):GetPosY()
local isLargePartyOpen = ToClient_IsContentsGroupOpen("286")
ChatSubMenu.initialize = function(self)
  -- function num : 0_0
  (self._uiBg):addInputEvent("Mouse_On", "HandleOn_ChattingSubMenu()")
  ;
  (self._uiButtonWhisper):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_SendWhisper()")
  ;
  (self._uiButtonAddFriend):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_AddFriend()")
  ;
  (self._uiButtonInviteParty):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_InviteParty()")
  ;
  (self._uiButtonInviteLargeParty):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_InviteLargeParty()")
  ;
  (self._uiButtonInviteGuild):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_InviteGuild()")
  ;
  (self._uiButtonInviteCompetition):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_InviteCompetition()")
  ;
  (self._uiButtonWinClose):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_Close()")
  ;
  (self._uiButtonBlock):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_Block()")
  ;
  (self._uiButtonReportGoldSeller):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_ReportGoldSeller()")
  ;
  (self._uiButtonBlockVote):addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_BlockVote()")
  ;
  (self._uiButtonIntroduce):addInputEvent("Mouse_LUp", "HanldeClicked_ChatSubMenu_Introduce()")
  ;
  (self._uiButtonIntroduce):SetShow(false)
  ;
  (self._uiBg):SetIgnore(false)
  self:SetShow(false)
end

HandleOn_ChattingSubMenu = function()
  -- function num : 0_1
  if currentPanelIndex ~= nil then
    Chatting_PanelTransparency(currentPanelIndex, false)
  end
end

HandleClicked_ChatSubMenu_Close = function()
  -- function num : 0_2 , upvalues : ChatSubMenu
  ChatSubMenu:SetShow(false)
end

ChatSubMenu.SetShow = function(self, isShow, isInviteParty, isInviteGuild, isInviteCompetition, isGameManager, clickedName, clickedUserNickName)
  -- function num : 0_3 , upvalues : isReportGoldSellerOpen, isLargePartyOpen, currentPoolIndex, clickedMessageIndex, clickedMsg
  if isShow then
    local bgSizeY = 165
    local buttonPosY = 160
    local gapY = 35
    local isCountryShow = true
    if isGameTypeKorea() then
      isCountryShow = true
    else
      if isGameTypeJapan() then
        isCountryShow = false
      else
        if isGameTypeEnglish() then
          isCountryShow = false
        else
          if isGameTypeRussia() then
            isCountryShow = true
          end
        end
      end
    end
    if isGameManager == true then
      (self._uiButtonBlockVote):SetShow(false)
      ;
      (self._uiButtonReportGoldSeller):SetShow(false)
    else
      ;
      (self._uiButtonBlockVote):SetShow(isCountryShow)
      ;
      (self._uiButtonReportGoldSeller):SetShow(isReportGoldSellerOpen)
    end
    ;
    (self._uiButtonInviteParty):SetShow(isInviteParty)
    ;
    (self._uiButtonInviteGuild):SetShow(isInviteGuild)
    ;
    (self._uiButtonInviteCompetition):SetShow(isInviteCompetition)
    ;
    (self._uiButtonInviteParty):SetShow(false)
    ;
    (self._uiButtonInviteLargeParty):SetShow(false)
    local isEmptyParty = ToClient_IsPartyEmpty()
    if isEmptyParty then
      (self._uiButtonInviteParty):SetShow(true)
      if isLargePartyOpen then
        (self._uiButtonInviteLargeParty):SetShow(true)
      else
        ;
        (self._uiButtonInviteLargeParty):SetShow(false)
      end
    else
      local isPartyType = ToClient_GetPartyType()
      if isLargePartyOpen == false then
        isPartyType = 0
        ;
        (self._uiButtonInviteLargeParty):SetShow(false)
      end
      if isPartyType == 0 then
        (self._uiButtonInviteParty):SetShow(isInviteParty)
        ;
        (self._uiButtonInviteLargeParty):SetShow(false)
      else
        if isPartyType == 1 then
          (self._uiButtonInviteLargeParty):SetShow(true)
          ;
          (self._uiButtonInviteParty):SetShow(false)
        end
      end
    end
    do
      do
        if (self._uiButtonBlockVote):GetShow() then
          (self._uiButtonBlockVote):SetPosY(buttonPosY)
          buttonPosY = buttonPosY + gapY
          bgSizeY = bgSizeY + gapY
        end
        if (self._uiButtonReportGoldSeller):GetShow() then
          (self._uiButtonReportGoldSeller):SetPosY(buttonPosY)
          buttonPosY = buttonPosY + gapY
          bgSizeY = bgSizeY + gapY
        end
        if (self._uiButtonInviteParty):GetShow() then
          (self._uiButtonInviteParty):SetPosY(buttonPosY)
          buttonPosY = buttonPosY + gapY
          bgSizeY = bgSizeY + gapY
        end
        if (self._uiButtonInviteLargeParty):GetShow() then
          (self._uiButtonInviteLargeParty):SetPosY(buttonPosY)
          buttonPosY = buttonPosY + gapY
          bgSizeY = bgSizeY + gapY
        end
        if (self._uiButtonInviteGuild):GetShow() then
          (self._uiButtonInviteGuild):SetPosY(buttonPosY)
          buttonPosY = buttonPosY + gapY
          bgSizeY = bgSizeY + gapY
        end
        if (self._uiButtonInviteCompetition):GetShow() then
          (self._uiButtonInviteCompetition):SetPosY(buttonPosY)
          buttonPosY = buttonPosY + gapY
          bgSizeY = bgSizeY + gapY
        end
        ;
        (self._uiBg):SetText(clickedUserNickName .. "\n" .. clickedName)
        ;
        (self._uiBg):SetSize((self._uiBg):GetSizeX(), bgSizeY)
        currentPoolIndex = nil
        clickedMessageIndex = nil
        clickedMsg = nil
        ;
        (self._mainPanel):SetShow(isShow)
      end
    end
  end
end

ChatSubMenu.SetPos = function(self, x, y)
  -- function num : 0_4
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  if screenSizeX <= x + (self._uiBg):GetSizeX() then
    x = screenSizeX - (self._uiBg):GetSizeX()
  end
  if screenSizeY <= y + (self._uiBg):GetSizeY() then
    y = screenSizeY - (self._uiBg):GetSizeY()
  end
  ;
  (self._mainPanel):SetPosX(x)
  ;
  (self._mainPanel):SetPosY(y)
end

ChatSubMenu:initialize()
local ChatUIPoolManager = {_poolCount = 5, 
_listPanel = {}
, 
_listChatUIPool = {}
, 
_listPopupNameMenu = {}
, _maxListCount = 100}
local _currentInitPool = 0
local ChatRenderMode = PAUIRenderModeBitSet({(Defines.RenderMode).eRenderMode_Default, (Defines.RenderMode).eRenderMode_WorldMap})
ChatUIPoolManager.createPanel = function(self, poolIndex, stylePanel)
  -- function num : 0_5 , upvalues : UI_Group, ChatRenderMode, UI_color
  local panel = (UI.createPanelAndSetPanelRenderMode)("Panel_Chat" .. poolIndex, UI_Group.PAGameUIGroup_Chatting, ChatRenderMode)
  CopyBaseProperty(stylePanel, panel)
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Window/Chatting/Chatting_Win_transparency.dds")
  panel:setMaskingChild(true)
  panel:setGlassBackground(true)
  panel:SetSize(420, 222)
  panel:SetPosX(0)
  panel:SetPosY(getScreenSizeY() - panel:GetSizeY() - 35)
  panel:SetColor(UI_color.C_FFFFFFFF)
  panel:SetIgnore(false)
  panel:SetDragAll(false)
  panel:addInputEvent("Mouse_UpScroll", "Chatting_ScrollEvent( " .. poolIndex .. ", true )")
  panel:addInputEvent("Mouse_DownScroll", "Chatting_ScrollEvent( " .. poolIndex .. ", false )")
  panel:addInputEvent("Mouse_On", "Chatting_PanelTransparency( " .. poolIndex .. ", true )")
  panel:addInputEvent("Mouse_Out", "Chatting_PanelTransparency( " .. poolIndex .. ", false , " .. 9999 .. ")")
  local show = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, poolIndex, (CppEnums.PanelSaveType).PanelSaveType_IsShow)
  panel:SetShow(show)
  return panel
end

ChatUIPoolManager.createPool = function(self, poolIndex, poolStylePanel, poolParentPanel)
  -- function num : 0_6 , upvalues : UI_PUCT
  local ChatUIPool = {
_list_PanelBG = {}
, 
_list_TitleTab = {}
, 
_list_TitleTabText = {}
, 
_list_TitleTabConfigButton = {}
, 
_list_OtherTab = {}
, 
_list_AddTab = {}
, 
_list_ResizeButton = {}
, 
_list_PanelDivision = {}
, 
_list_PanelDelete = {}
, 
_list_ChattingIcon = {}
, 
_list_ChattingSender = {}
, 
_list_ChattingContents = {}
, 
_list_ChattingLinkedItem = {}
, 
_list_ChattingLinkedWebSite = {}
, 
_list_Scroll = {}
, 
_list_CloseButton = {}
, 
_list_ScrollReset = {}
, 
_list_MoreList = {}
, 
_list_Emoticon = {}
, 
_list_At = {}
, 
_list_SenderMessageIndex = {}
, 
_list_LinkedItemMessageIndex = {}
, 
_list_LinkedWebSiteMessageIndex = {}
, 
_list_LinkedAtMessageIndex = {}
, _count_PanelBG = 0, _maxcount_PanelBG = 5, _count_TitleTab = 0, _maxcount_TitleTab = 5, _count_TitleTabText = 0, _maxcount_TitleTabText = 5, _count_TitleTabConfigButton = 0, _maxcount_TitleTabConfigButton = 5, _count_OtherTab = 0, _maxcount_OtherTab = 4, _count_AddTab = 0, _maxcount_AddTab = 1, _count_PanelDivision = 0, _maxcount_PanelDivision = 5, _count_PanelDelete = 0, _maxcount_PanelDelete = 5, _count_ResizeButton = 0, _maxcount_ResizeButton = 5, _count_ChattingIcon = 0, _maxcount_ChattingIcon = self._maxListCount, _count_ChattingSender = 0, _maxcount_ChattingSender = self._maxListCount, _count_ChattingContents = 0, _maxcount_ChattingContents = self._maxListCount, _count_ChattingLinkedItem = 0, _maxcount_ChattingLinkedItem = self._maxListCount, _count_ChattingLinkedWebSite = 0, _maxcount_ChattingLinkedWebSite = self._maxListCount, _count_Scroll = 0, _maxcount_Scroll = 1, _count_CloseButton = 0, _maxcount_CloseButton = 4, _count_ScrollReset = 0, _maxcount_ScrollReset = 4, _count_MoreList = 0, _maxcount_MoreList = 4, _count_Emoticon = 0, _maxcount_Emoticon = self._maxListCount * 4, _count_At = 0, _maxcount_At = self._maxListCount}
  ChatUIPool.prepareControl = function(self, Panel, parentControl, createdCotrolList, controlType, controlName, createCount)
    -- function num : 0_6_0
    local styleUI = (UI.getChildControl)(Panel, controlName)
    for index = 0, createCount do
      createdCotrolList[index] = (UI.createControl)(controlType, parentControl, controlName .. index)
      CopyBaseProperty(styleUI, createdCotrolList[index])
      ;
      (createdCotrolList[index]):SetShow(true)
    end
  end

  ChatUIPool.initialize = function(self, stylePanel, parentControl, poolIndex)
    -- function num : 0_6_1 , upvalues : ChatUIPool, UI_PUCT
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_PanelBG, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_ChattingBG", self._maxcount_PanelBG)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_TitleTab, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_TitleButton", self._maxcount_TitleTab)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_TitleTabText, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_chattingText", self._maxcount_TitleTabText)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_TitleTabConfigButton, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_Setting", self._maxcount_TitleTabConfigButton)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_OtherTab, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_OtherChat", self._maxcount_OtherTab)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_AddTab, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_AddChat", self._maxcount_AddTab)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_PanelDivision, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_PanelDivision", self._maxcount_PanelDivision)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_PanelDelete, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_PanelCombine", self._maxcount_PanelDelete)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ResizeButton, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_Size", self._maxcount_ResizeButton)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ChattingIcon, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "Static_ChatIcon", self._maxcount_ChattingIcon)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ChattingSender, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_ChatSender", self._maxcount_ChattingSender)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ChattingContents, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_ChatContent", self._maxcount_ChattingContents)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ChattingLinkedItem, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_ChatLinkedItem", self._maxcount_ChattingLinkedItem)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ChattingLinkedWebSite, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_ChatLinkedWebSite", self._maxcount_ChattingLinkedWebSite)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_Scroll, UI_PUCT.PA_UI_CONTROL_SCROLL, "Scroll_Chatting", self._maxcount_Scroll)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_CloseButton, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_Close", self._maxcount_CloseButton)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ScrollReset, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_ScrollReset", self._maxcount_ScrollReset)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_MoreList, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_MoreList", self._maxcount_MoreList)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_Emoticon, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_Emoticon", self._maxcount_Emoticon)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_At, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "Static_At", self._maxcount_At)
    for index = 0, self._maxcount_ChattingLinkedItem do
      ((self._list_ChattingLinkedItem)[index]):addInputEvent("Mouse_On", "HandleOn_ChattingLinkedItem(" .. poolIndex .. ", " .. index .. ", false)")
      ;
      ((self._list_ChattingLinkedItem)[index]):addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. poolIndex .. ", false, true )")
      ;
      ((self._list_ChattingLinkedItem)[index]):addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. poolIndex .. ")")
      ;
      ((self._list_ChattingLinkedItem)[index]):addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. poolIndex .. ")")
      ;
      ((self._list_ChattingLinkedItem)[index]):addInputEvent("Mouse_LUp", "HandleOn_ChattingLinkedItem(" .. poolIndex .. ", " .. index .. ", true)")
    end
    for index = 0, self._maxcount_ChattingLinkedWebSite do
      ((self._list_ChattingLinkedWebSite)[index]):addInputEvent("Mouse_LUp", "HandleOn_ChattingLinkedWebSite(" .. poolIndex .. ", " .. index .. ", 2)")
    end
    for index = 0, self._maxcount_ChattingSender do
      ((self._list_ChattingSender)[index]):addInputEvent("Mouse_LUp", "HandleClicked_ChattingSender(" .. poolIndex .. ", " .. index .. ")")
      ;
      ((self._list_ChattingSender)[index]):addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. poolIndex .. ", false )")
      ;
      ((self._list_ChattingSender)[index]):addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. poolIndex .. ")")
      ;
      ((self._list_ChattingSender)[index]):addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. poolIndex .. ")")
    end
    ChatUIPool:clear()
  end

  ChatUIPool.newPanelBG = function(self)
    -- function num : 0_6_2
    self._count_PanelBG = self._count_PanelBG + 1
    return (self._list_PanelBG)[self._count_PanelBG - 1]
  end

  ChatUIPool.newTitleTab = function(self)
    -- function num : 0_6_3
    self._count_TitleTab = self._count_TitleTab + 1
    return (self._list_TitleTab)[self._count_TitleTab - 1]
  end

  ChatUIPool.newTitleTabText = function(self)
    -- function num : 0_6_4
    self._count_TitleTabText = self._count_TitleTabText + 1
    return (self._list_TitleTabText)[self._count_TitleTabText - 1]
  end

  ChatUIPool.newTitleTabConfigButton = function(self)
    -- function num : 0_6_5
    self._count_TitleTabConfigButton = self._count_TitleTabConfigButton + 1
    return (self._list_TitleTabConfigButton)[self._count_TitleTabConfigButton - 1]
  end

  ChatUIPool.newOtherTab = function(self)
    -- function num : 0_6_6
    self._count_OtherTab = self._count_OtherTab + 1
    return (self._list_OtherTab)[self._count_OtherTab - 1]
  end

  ChatUIPool.newAddTab = function(self)
    -- function num : 0_6_7
    self._count_AddTab = self._count_AddTab + 1
    return (self._list_AddTab)[self._count_AddTab - 1]
  end

  ChatUIPool.newPanelDivision = function(self)
    -- function num : 0_6_8
    self._count_PanelDivision = self._count_PanelDivision + 1
    return (self._list_PanelDivision)[self._count_PanelDivision - 1]
  end

  ChatUIPool.newPanelCombine = function(self)
    -- function num : 0_6_9
    self._count_PanelDelete = self._count_PanelDelete + 1
    return (self._list_PanelDelete)[self._count_PanelDelete - 1]
  end

  ChatUIPool.newResizeButton = function(self)
    -- function num : 0_6_10
    self._count_ResizeButton = self._count_ResizeButton + 1
    return (self._list_ResizeButton)[self._count_ResizeButton - 1]
  end

  ChatUIPool.newChattingIcon = function(self)
    -- function num : 0_6_11
    self._count_ChattingIcon = self._count_ChattingIcon + 1
    return (self._list_ChattingIcon)[self._count_ChattingIcon - 1]
  end

  ChatUIPool.newChattingSender = function(self, messageIndex)
    -- function num : 0_6_12
    self._count_ChattingSender = self._count_ChattingSender + 1
    -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._list_SenderMessageIndex)[self._count_ChattingSender - 1] = messageIndex
    return (self._list_ChattingSender)[self._count_ChattingSender - 1]
  end

  ChatUIPool.newChattingContents = function(self)
    -- function num : 0_6_13
    self._count_ChattingContents = self._count_ChattingContents + 1
    return (self._list_ChattingContents)[self._count_ChattingContents - 1]
  end

  ChatUIPool.newChattingLinkedItem = function(self, messageIndex)
    -- function num : 0_6_14
    self._count_ChattingLinkedItem = self._count_ChattingLinkedItem + 1
    -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._list_LinkedItemMessageIndex)[self._count_ChattingLinkedItem - 1] = messageIndex
    return (self._list_ChattingLinkedItem)[self._count_ChattingLinkedItem - 1]
  end

  ChatUIPool.newChattingEmoticon = function(self)
    -- function num : 0_6_15
    self._count_Emoticon = self._count_Emoticon + 1
    return (self._list_Emoticon)[self._count_Emoticon - 1]
  end

  ChatUIPool.newChattingLinkedWebSite = function(self, messageIndex)
    -- function num : 0_6_16
    self._count_ChattingLinkedWebSite = self._count_ChattingLinkedWebSite + 1
    -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._list_LinkedWebSiteMessageIndex)[self._count_ChattingLinkedWebSite - 1] = messageIndex
    return (self._list_ChattingLinkedWebSite)[self._count_ChattingLinkedWebSite - 1]
  end

  ChatUIPool.newChattingAt = function(self, messageIndex)
    -- function num : 0_6_17
    self._count_At = self._count_At + 1
    -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._list_LinkedAtMessageIndex)[self._count_At - 1] = messageIndex
    return (self._list_At)[self._count_At - 1]
  end

  ChatUIPool.newScroll = function(self)
    -- function num : 0_6_18
    self._count_Scroll = self._count_Scroll + 1
    return (self._list_Scroll)[self._count_Scroll - 1]
  end

  ChatUIPool.newCloseButton = function(self)
    -- function num : 0_6_19
    self._count_CloseButton = self._count_CloseButton + 1
    return (self._list_CloseButton)[self._count_CloseButton - 1]
  end

  ChatUIPool.newScrollReset = function(self)
    -- function num : 0_6_20
    self._count_ScrollReset = self._count_ScrollReset + 1
    return (self._list_ScrollReset)[self._count_ScrollReset - 1]
  end

  ChatUIPool.newMorelist = function(self)
    -- function num : 0_6_21
    self._count_MoreList = self._count_MoreList + 1
    return (self._list_MoreList)[self._count_MoreList - 1]
  end

  ChatUIPool.clearChattingIcon = function(self)
    -- function num : 0_6_22
    self._count_ChattingIcon = 0
  end

  ChatUIPool.clearChattingSender = function(self, messageIndex)
    -- function num : 0_6_23
    self._count_ChattingSender = 0
  end

  ChatUIPool.clearChattingContents = function(self)
    -- function num : 0_6_24
    self._count_ChattingContents = 0
  end

  ChatUIPool.clearChattingLinkedItem = function(self, messageIndex)
    -- function num : 0_6_25
    self._count_ChattingLinkedItem = 0
  end

  ChatUIPool.clearChattingLinkedwebsite = function(self, messageIndex)
    -- function num : 0_6_26
    self._count_ChattingLinkedWebSite = 0
  end

  ChatUIPool.clearEmoticon = function(self)
    -- function num : 0_6_27
    self._count_Emoticon = 0
  end

  ChatUIPool.clearAt = function(self)
    -- function num : 0_6_28
    self._count_At = 0
  end

  ChatUIPool.clear = function(self)
    -- function num : 0_6_29 , upvalues : ChatUIPool
    self._count_PanelBG = 0
    self._count_TitleTab = 0
    self._count_TitleTabText = 0
    self._count_TitleTabConfigButton = 0
    self._count_OtherTab = 0
    self._count_AddTab = 0
    self._count_PanelDivision = 0
    self._count_PanelDelete = 0
    self._count_ResizeButton = 0
    self._count_ChattingIcon = 0
    self._count_ChattingSender = 0
    self._count_ChattingContents = 0
    self._count_ChattingLinkedItem = 0
    self._count_ChattingLinkedWebSite = 0
    self._count_Scroll = 0
    self._count_CloseButton = 0
    self._count_ScrollReset = 0
    self._count_MoreList = 0
    self._count_Emoticon = 0
    self._count_At = 0
    self._list_SenderMessageIndex = {}
    self._list_LinkedItemMessageIndex = {}
    self._list_LinkedWebSiteMessageIndex = {}
    self._list_LinkedAtMessageIndex = {}
    self._list_LinkedAtIndex = {}
    ChatUIPool:hideNotUse()
  end

  ChatUIPool.drawclear = function(self)
    -- function num : 0_6_30
    (self.clearChattingIcon)()
    ;
    (self.clearChattingContents)()
    ;
    (self.clearChattingSender)()
    ;
    (self.clearChattingLinkedItem)()
    ;
    (self.clearChattingLinkedwebsite)()
    ;
    (self.clearEmoticon)()
    ;
    (self.clearAt)()
  end

  ChatUIPool.hideNotUse = function(self)
    -- function num : 0_6_31
    for index = self._count_PanelBG, self._maxcount_PanelBG do
      ((self._list_PanelBG)[index]):SetShow(false)
    end
    for index = self._count_TitleTab, self._maxcount_TitleTab do
      ((self._list_TitleTab)[index]):SetShow(false)
    end
    for index = self._count_TitleTabText, self._maxcount_TitleTabText do
      ((self._list_TitleTabText)[index]):SetShow(false)
    end
    for index = self._count_TitleTabConfigButton, self._maxcount_TitleTabConfigButton do
      ((self._list_TitleTabConfigButton)[index]):SetShow(false)
    end
    for index = self._count_OtherTab, self._maxcount_OtherTab do
      ((self._list_OtherTab)[index]):SetShow(false)
    end
    for index = self._count_AddTab, self._maxcount_AddTab do
      ((self._list_AddTab)[index]):SetShow(false)
    end
    for index = self._count_PanelDivision, self._maxcount_PanelDivision do
      ((self._list_PanelDivision)[index]):SetShow(false)
    end
    for index = self._count_PanelDelete, self._maxcount_PanelDelete do
      ((self._list_PanelDelete)[index]):SetShow(false)
    end
    for index = self._count_ResizeButton + 1, self._maxcount_ResizeButton do
      ((self._list_ResizeButton)[index]):SetShow(false)
    end
    for index = self._count_ChattingIcon, self._maxcount_ChattingIcon do
      ((self._list_ChattingIcon)[index]):SetShow(false)
    end
    for index = self._count_ChattingSender, self._maxcount_ChattingSender do
      ((self._list_ChattingSender)[index]):SetShow(false)
    end
    for index = self._count_ChattingContents, self._maxcount_ChattingContents do
      ((self._list_ChattingContents)[index]):SetShow(false)
    end
    for index = self._count_ChattingLinkedItem, self._maxcount_ChattingLinkedItem do
      ((self._list_ChattingLinkedItem)[index]):SetShow(false)
    end
    for index = self._count_ChattingLinkedWebSite, self._maxcount_ChattingLinkedWebSite do
      ((self._list_ChattingLinkedWebSite)[index]):SetShow(false)
    end
    for index = self._count_Scroll, self._maxcount_Scroll do
      ((self._list_Scroll)[index]):SetShow(false)
    end
    for index = self._count_CloseButton, self._maxcount_CloseButton do
      ((self._list_CloseButton)[index]):SetShow(false)
    end
    for index = self._count_ScrollReset, self._maxcount_ScrollReset do
      ((self._list_ScrollReset)[index]):SetShow(false)
    end
    for index = self._count_MoreList, self._maxcount_MoreList do
      ((self._list_MoreList)[index]):SetShow(false)
    end
    for index = self._count_Emoticon, self._maxcount_Emoticon do
      ((self._list_Emoticon)[index]):SetShow(false)
    end
    for index = self._count_At, self._maxcount_At do
      ((self._list_At)[index]):SetShow(false)
    end
  end

  ChatUIPool:initialize(poolStylePanel, poolParentPanel, poolIndex)
  return ChatUIPool
end

local ChattingViewManager = {_mainPanelSelectPanelIndex = 0, _maxHistoryCount = ToClient_getChattingMaxContentsCount() - 50, _cacheSimpleUI = false, _addChattingIdx = nil, _addChattingPreset = false, 
_srollPosition = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0}
, 
_transparency = {[0] = 0.5, [1] = 0.5, [2] = 0.5, [3] = 0.5, [4] = 0.5}
, 
_scroll_BTNPos = {[0] = 1, [1] = 1, [2] = 1, [3] = 1, [4] = 1}
, _linkedItemTooltipIsClicked = false}
Chatting_Transparency = function(index)
  -- function num : 0_7
  if index == -1 then
    if currentPanelIndex == nil then
      return 
    end
    index = currentPanelIndex
  end
  Chatting_PanelTransparency(index, false)
end

ChatUIPoolManager.initialize = function(self)
  -- function num : 0_8 , upvalues : ChattingViewManager
  local divisionPanel, panel, panelSizeX, panelSizeY, chatUI = nil, nil, nil, nil, nil
  for poolIndex = 0, self._poolCount - 1 do
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R10 in 'UnsetPending'

    (self._listPanel)[poolIndex] = self:createPanel(poolIndex, Panel_Chat)
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self._listChatUIPool)[poolIndex] = self:createPool(poolIndex, Panel_Chat, (self._listPanel)[poolIndex])
    divisionPanel = ToClient_getChattingPanel(poolIndex)
    panel = (self._listPanel)[poolIndex]
    chatUI = (self._listChatUIPool)[poolIndex]
    if divisionPanel:getPanelSizeX() > 0 then
      panelSizeX = divisionPanel:getPanelSizeX()
      panelSizeY = divisionPanel:getPanelSizeY()
      panel:SetSize(panelSizeX, panelSizeY)
      ;
      ((chatUI._list_PanelBG)[0]):SetSize(panelSizeX, panelSizeY)
      ;
      ((chatUI._list_Scroll)[0]):SetSize(((chatUI._list_Scroll)[0]):GetSizeX(), panelSizeY - 67)
      for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
        ((chatUI._list_ChattingContents)[chattingContents_idx]):SetSize(panelSizeX - 25, ((chatUI._list_ChattingContents)[chattingContents_idx]):GetSizeY())
      end
      ;
      ((chatUI._list_ResizeButton)[0]):SetPosX(panelSizeX - (((chatUI._list_ResizeButton)[0]):GetSizeX() + 5))
      ;
      ((chatUI._list_Scroll)[0]):SetPosX(panelSizeX - (((chatUI._list_Scroll)[0]):GetSizeX() + 5))
      ;
      ((chatUI._list_Scroll)[0]):SetControlBottom()
    else
      panelSizeX = 420
      panelSizeY = 222
      panel:SetSize(panelSizeX, panelSizeY)
      ;
      ((chatUI._list_PanelBG)[0]):SetSize(panelSizeX, panelSizeY)
      ;
      ((chatUI._list_Scroll)[0]):SetSize(((chatUI._list_Scroll)[0]):GetSizeX(), panelSizeY - 67)
      for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
        ((chatUI._list_ChattingContents)[chattingContents_idx]):SetSize(panelSizeX - 25, ((chatUI._list_ChattingContents)[chattingContents_idx]):GetSizeY())
      end
      ;
      ((chatUI._list_ResizeButton)[0]):SetPosX(panelSizeX - (((chatUI._list_ResizeButton)[0]):GetSizeX() + 5))
      ;
      ((chatUI._list_Scroll)[0]):SetPosX(panelSizeX - (((chatUI._list_Scroll)[0]):GetSizeX() + 5))
      ;
      ((chatUI._list_Scroll)[0]):SetControlBottom()
    end
    if divisionPanel:getPositionX() < 0 and divisionPanel:getPositionY() < 0 then
      panel:SetPosX(0)
      panel:SetPosY(getScreenSizeY() - panel:GetSizeY() - 35)
    else
      panel:SetPosX(divisionPanel:getPositionX())
      panel:SetPosY(divisionPanel:getPositionY())
    end
    -- DECOMPILER ERROR at PC188: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (ChattingViewManager._transparency)[poolIndex] = divisionPanel:getTransparency()
    FGlobal_PanelMove(panel, true)
  end
end

ChatUIPoolManager.getPool = function(self, poolIndex)
  -- function num : 0_9
  return (self._listChatUIPool)[poolIndex]
end

ChatUIPoolManager.getPanel = function(self, poolIndex)
  -- function num : 0_10
  return (self._listPanel)[poolIndex]
end

ChatUIPoolManager.getPopupNameMenu = function(self, poolIndex)
  -- function num : 0_11
  return (self._listPopupNameMenu)[poolIndex]
end

ChatUIPoolManager:initialize()
local _tabButton_PosX = 0
local addChat_PosX = 0
ChattingViewManager.update = function(self, chatPanel, panelIndex, isShow)
  -- function num : 0_12 , upvalues : ChatUIPoolManager, isMouseOnChattingViewIndex, isMouseOn, UI_color, _tabButton_PosX, addChat_PosX, isResetsmoothscroll, issmoothWheelscroll, issmoothscroll, ismsgin, isUsedSmoothChattingUp, issmoothupMessage, premsgCount, chattingUpTime, prepopmsgCount, _scroll_Interval_AddPos, deltascrollPosy
  if getSelfPlayer() == nil or (getSelfPlayer()):get() == nil then
    return 
  end
  if CheckTutorialEnd() == false and PaGlobal_TutorialManager:isDoingTutorial() == true then
    return 
  end
  local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
  local drawPanelIndex = panelIndex
  local bgAlpah = (self._transparency)[drawPanelIndex]
  if isCombinedMainPanel == true then
    drawPanelIndex = 0
  end
  local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
  local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
  self._currentPoolIndex = drawPanelIndex
  local IsMouseOver = (UI.checkIsInMouseAndEventPanel)(currentPanel)
  if isShow == nil then
    isShow = false
  end
  if isMouseOnChattingViewIndex ~= nil and isMouseOnChattingViewIndex == drawPanelIndex then
    isShow = isMouseOn
    if isShow then
      bgAlpah = 1
    end
  else
    isShow = IsMouseOver
  end
  currentPanel:SetColor(UI_color.C_00000000)
  local isActivePanel = panelIndex == self._mainPanelSelectPanelIndex
  _tabButton_PosX = self:createTab(poolCurrentUI, panelIndex, isActivePanel, drawPanelIndex, isCombinedMainPanel, _tabButton_PosX, isShow)
  addChat_PosX = _tabButton_PosX
  if isCombinedMainPanel then
    if panelIndex ~= 0 then
      (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
      ;
      (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
    end
    if isActivePanel == false then
      return 
    end
  elseif isCombinedMainPanel == false and chatPanel:isOpen() == true and (ChatUIPoolManager:getPanel(0)):GetShow() then
    (ChatUIPoolManager:getPanel(panelIndex)):SetShow(true)
    ;
    (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(false)
  end
  if isCombinedMainPanel == false and chatPanel:isOpen() == false then
    (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
    ;
    (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
  end
  if CheckTutorialEnd() == false then
    for ii = 1, ChatUIPoolManager._poolCount - 1 do
      (ChatUIPoolManager:getPanel(ii)):SetShow(false)
    end
  end
  local panel_resizeButton = poolCurrentUI:newResizeButton()
  panel_resizeButton:SetNotAbleMasking(true)
  panel_resizeButton:SetShow(isShow)
  panel_resizeButton:addInputEvent("Mouse_LDown", "HandleClicked_Chatting_ResizeStartPos( " .. drawPanelIndex .. " )")
  panel_resizeButton:addInputEvent("Mouse_LPress", "HandleClicked_Chatting_Resize( " .. drawPanelIndex .. ", " .. panelIndex .. " )")
  panel_resizeButton:addInputEvent("Mouse_RPress", "Chatting_PanelTransparency( " .. drawPanelIndex .. ", false )")
  panel_resizeButton:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_ResizeStartPosEND(" .. drawPanelIndex .. ")")
  panel_resizeButton:addInputEvent("Mouse_RUp", "Chatting_PanelTransparency( " .. drawPanelIndex .. ", false )")
  panel_resizeButton:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
  local panel_Bg = poolCurrentUI:newPanelBG()
  panel_Bg:SetNotAbleMasking(true)
  panel_Bg:SetShow(true)
  panel_Bg:SetIgnore(true)
  panel_Bg:SetAlpha(bgAlpah)
  panel_Bg:SetSize(panel_Bg:GetSizeX(), currentPanel:GetSizeY() - 30)
  panel_Bg:SetPosY(30)
  local panel_Scroll = poolCurrentUI:newScroll()
  panel_Scroll:SetShow(isShow)
  panel_Scroll:SetInterval(self._maxHistoryCount)
  panel_Scroll:SetCtrlWeight(0.1)
  panel_Scroll:SetPosX(panel_Bg:GetSizeX() - panel_Scroll:GetSizeX() - 3)
  panel_Scroll:SetControlPos((self._scroll_BTNPos)[panelIndex])
  panel_Scroll:addInputEvent("Mouse_LUp", "HandleClicked_ScrollBtnPosY( " .. panelIndex .. " )")
  panel_Scroll:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. panelIndex .. ", false )")
  local panel_ScrollBtn = panel_Scroll:GetControlButton()
  panel_ScrollBtn:addInputEvent("Mouse_LPress", "HandleClicked_ScrollBtnPosY( " .. panelIndex .. " )")
  panel_ScrollBtn:addInputEvent("Mouse_RPress", "HandleClicked_ScrollBtnPosY( " .. panelIndex .. " )")
  panel_ScrollBtn:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. panelIndex .. ", false )")
  panel_ScrollBtn:SetShow(isShow)
  if getEnableSimpleUI() then
    panel_Scroll:SetShow(self._cacheSimpleUI)
    panel_ScrollBtn:SetShow(self._cacheSimpleUI)
  end
  do
    if isChangeFontSize() == true then
      local fontType = chatPanel:getChatFontSizeType()
      ;
      (ToClient_getFontWrapper("BaseFont_10_Chat")):changeFontSize(ChattingOption_convertChatFontTypeToFontSize(fontType))
      ChatPanel_Update()
    end
    if isResetsmoothscroll == true or issmoothWheelscroll == true or issmoothscroll == true then
      return 
    end
    local addMessageCount = 0
    if ismsgin == false and isUsedSmoothChattingUp == true and chatPanel:getPushchattingMsg() and issmoothupMessage == false then
      if chatPanel:getMessageCount() - premsgCount[panelIndex] > 0 and chatPanel:getMessageCount() - premsgCount[panelIndex] < 5 then
        if chatPanel:getPopMessageCount() == 0 then
          issmoothupMessage = true
          chattingUpTime = 0
          ismsgin = true
        else
          -- DECOMPILER ERROR at PC388: Confused about usage of register: R16 in 'UnsetPending'

          if chatPanel:getPopMessageCount() < prepopmsgCount[panelIndex] then
            prepopmsgCount[panelIndex] = 0
          end
          if chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex] < 5 then
            issmoothupMessage = true
            chattingUpTime = 0
            ismsgin = true
          end
        end
      end
      if issmoothupMessage == false then
        if chatPanel:getPopMessageCount() == 0 then
          addMessageCount = chatPanel:getMessageCount() - premsgCount[panelIndex]
          -- DECOMPILER ERROR at PC417: Confused about usage of register: R16 in 'UnsetPending'

          premsgCount[panelIndex] = chatPanel:getMessageCount()
        else
          -- DECOMPILER ERROR at PC426: Confused about usage of register: R16 in 'UnsetPending'

          if chatPanel:getPopMessageCount() < prepopmsgCount[panelIndex] then
            prepopmsgCount[panelIndex] = 0
          end
          if ToClient_getChattingMaxContentsCount() == premsgCount[panelIndex] then
            addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex]
          else
            addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex] + ToClient_getChattingMaxContentsCount() - premsgCount[panelIndex]
            -- DECOMPILER ERROR at PC453: Confused about usage of register: R16 in 'UnsetPending'

            premsgCount[panelIndex] = ToClient_getChattingMaxContentsCount()
          end
          -- DECOMPILER ERROR at PC457: Confused about usage of register: R16 in 'UnsetPending'

          prepopmsgCount[panelIndex] = chatPanel:getPopMessageCount()
        end
      end
    end
    if isUsedSmoothChattingUp == false then
      if chatPanel:getPopMessageCount() == 0 then
        addMessageCount = chatPanel:getMessageCount() - premsgCount[panelIndex]
        -- DECOMPILER ERROR at PC474: Confused about usage of register: R16 in 'UnsetPending'

        premsgCount[panelIndex] = chatPanel:getMessageCount()
      else
        -- DECOMPILER ERROR at PC483: Confused about usage of register: R16 in 'UnsetPending'

        if chatPanel:getPopMessageCount() < prepopmsgCount[panelIndex] then
          prepopmsgCount[panelIndex] = 0
        end
        if ToClient_getChattingMaxContentsCount() == premsgCount[panelIndex] then
          addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex]
        else
          addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex] + ToClient_getChattingMaxContentsCount() - premsgCount[panelIndex]
          -- DECOMPILER ERROR at PC510: Confused about usage of register: R16 in 'UnsetPending'

          premsgCount[panelIndex] = ToClient_getChattingMaxContentsCount()
        end
        -- DECOMPILER ERROR at PC514: Confused about usage of register: R16 in 'UnsetPending'

        prepopmsgCount[panelIndex] = chatPanel:getPopMessageCount()
      end
    end
    if issmoothupMessage == true then
      if isCombinedMainPanel then
        local count = ToClient_getChattingPanelCount()
        for combinepanelIndex = 0, count - 1 do
          local checkchatPanel = ToClient_getChattingPanel(combinepanelIndex)
          local checkCombined = checkchatPanel:isCombinedToMainPanel()
          if checkCombined then
            if checkchatPanel:getPopMessageCount() == 0 then
              addMessageCount = checkchatPanel:getMessageCount() - premsgCount[combinepanelIndex]
              -- DECOMPILER ERROR at PC545: Confused about usage of register: R23 in 'UnsetPending'

              premsgCount[combinepanelIndex] = checkchatPanel:getMessageCount()
            else
              -- DECOMPILER ERROR at PC554: Confused about usage of register: R23 in 'UnsetPending'

              if checkchatPanel:getPopMessageCount() < prepopmsgCount[combinepanelIndex] then
                prepopmsgCount[combinepanelIndex] = 0
              end
              if ToClient_getChattingMaxContentsCount() == premsgCount[combinepanelIndex] then
                addMessageCount = checkchatPanel:getPopMessageCount() - prepopmsgCount[combinepanelIndex]
              else
                addMessageCount = checkchatPanel:getPopMessageCount() - prepopmsgCount[combinepanelIndex] + ToClient_getChattingMaxContentsCount() - premsgCount[combinepanelIndex]
                -- DECOMPILER ERROR at PC581: Confused about usage of register: R23 in 'UnsetPending'

                premsgCount[combinepanelIndex] = ToClient_getChattingMaxContentsCount()
              end
              -- DECOMPILER ERROR at PC585: Confused about usage of register: R23 in 'UnsetPending'

              prepopmsgCount[combinepanelIndex] = checkchatPanel:getPopMessageCount()
            end
            -- DECOMPILER ERROR at PC598: Confused about usage of register: R23 in 'UnsetPending'

            if checkchatPanel:isChattingPanelFreeze() and checkchatPanel:isFreezingMsgUpdatedValue() then
              (self._srollPosition)[combinepanelIndex] = _scroll_Interval_AddPos[combinepanelIndex] + (addMessageCount)
              -- DECOMPILER ERROR at PC602: Confused about usage of register: R23 in 'UnsetPending'

              _scroll_Interval_AddPos[combinepanelIndex] = (self._srollPosition)[combinepanelIndex]
            end
            checkchatPanel:setFreezingMsgUpdated(false)
          end
        end
      else
        if chatPanel:getPopMessageCount() == 0 then
          addMessageCount = chatPanel:getMessageCount() - premsgCount[panelIndex]
          -- DECOMPILER ERROR at PC620: Confused about usage of register: R16 in 'UnsetPending'

          premsgCount[panelIndex] = chatPanel:getMessageCount()
        else
          -- DECOMPILER ERROR at PC629: Confused about usage of register: R16 in 'UnsetPending'

          if chatPanel:getPopMessageCount() < prepopmsgCount[panelIndex] then
            prepopmsgCount[panelIndex] = 0
          end
          if ToClient_getChattingMaxContentsCount() == premsgCount[panelIndex] then
            addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex]
          else
            addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex] + ToClient_getChattingMaxContentsCount() - premsgCount[panelIndex]
            -- DECOMPILER ERROR at PC656: Confused about usage of register: R16 in 'UnsetPending'

            premsgCount[panelIndex] = ToClient_getChattingMaxContentsCount()
          end
          -- DECOMPILER ERROR at PC660: Confused about usage of register: R16 in 'UnsetPending'

          prepopmsgCount[panelIndex] = chatPanel:getPopMessageCount()
        end
        -- DECOMPILER ERROR at PC673: Confused about usage of register: R16 in 'UnsetPending'

        if chatPanel:isChattingPanelFreeze() and chatPanel:isFreezingMsgUpdatedValue() then
          (self._srollPosition)[panelIndex] = _scroll_Interval_AddPos[panelIndex] + (addMessageCount)
          -- DECOMPILER ERROR at PC677: Confused about usage of register: R16 in 'UnsetPending'

          _scroll_Interval_AddPos[panelIndex] = (self._srollPosition)[panelIndex]
        end
        chatPanel:setFreezingMsgUpdated(false)
      end
      return 
    end
    local messageIndex = (self._srollPosition)[panelIndex]
    local chattingMessage = chatPanel:beginMessage(messageIndex)
    do
      local chatting_content_PosY = currentPanel:GetSizeY() - 10
      poolCurrentUI:drawclear()
      while 1 do
        while 1 do
          if chattingMessage ~= nil then
            chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
          end
        end
        if chatting_content_PosY < 45 then
          chattingMessage = chatPanel:nextMessage()
          messageIndex = messageIndex + 1
          -- DECOMPILER ERROR at PC714: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC714: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
      -- DECOMPILER ERROR at PC727: Confused about usage of register: R19 in 'UnsetPending'

      if chatPanel:isChattingPanelFreeze() and chatPanel:isFreezingMsgUpdatedValue() then
        (self._srollPosition)[panelIndex] = _scroll_Interval_AddPos[panelIndex] + (addMessageCount)
        -- DECOMPILER ERROR at PC731: Confused about usage of register: R19 in 'UnsetPending'

        _scroll_Interval_AddPos[panelIndex] = (self._srollPosition)[panelIndex]
      end
      chatPanel:setFreezingMsgUpdated(false)
      -- DECOMPILER ERROR: 43 unprocessed JMP targets
    end
  end
end

ChattingViewManager_UpdatePerFrame = function(deltaTime)
  -- function num : 0_13 , upvalues : isResetsmoothscroll, smoothResetScorllTime, ChattingViewManager, issmoothWheelscroll, smoothWheelScorllTime, issmoothscroll, smoothScorllTime, issmoothupMessage, chattingUpTime
  if isResetsmoothscroll then
    smoothResetScorllTime = smoothResetScorllTime + deltaTime / 2
    ChattingViewManager:UpdateSmoothResetScrollContent(smoothResetScorllTime)
    return 
  end
  if issmoothWheelscroll then
    FromClient_ChatUpdate(true)
    smoothWheelScorllTime = smoothWheelScorllTime + deltaTime
    if smoothWheelScorllTime > 0.2 then
      issmoothWheelscroll = false
      smoothWheelScorllTime = 0
      ChattingViewManager:UpdateSmoothWheelScrollContent(deltaTime)
      return 
    end
    ChattingViewManager:UpdateSmoothWheelScrollContent(deltaTime)
    return 
  end
  if issmoothscroll then
    smoothScorllTime = smoothScorllTime + deltaTime
    if smoothScorllTime > 0.01 then
      issmoothscroll = false
      smoothScorllTime = 0
      ChattingViewManager:UpdateSmoothScrollContent()
      return 
    end
    ChattingViewManager:UpdateSmoothScrollContent()
  else
    if issmoothupMessage then
      chattingUpTime = chattingUpTime + deltaTime
      if chattingUpTime > 0.2 then
        issmoothupMessage = false
      end
      ChattingViewManager:UpdateSmoothChattingContent(chattingUpTime)
    end
  end
end

ChattingViewManager.UpdateSmoothChattingContent = function(self, chattingUpTime)
  -- function num : 0_14 , upvalues : ChatUIPoolManager, isMouseOnChattingViewIndex, isMouseOn, UI_color, issmoothupMessage, deltascrollPosy, ismsgin
  FromClient_ChatUpdate(true)
  local count = ToClient_getChattingPanelCount()
  local checkchattingupTime = 0
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local addMessageCount = 0
      if chatPanel:getPushchattingMsg() == false or chatPanel:isChattingPanelFreeze() == true then
        checkchattingupTime = 0
      else
        checkchattingupTime = chattingUpTime
      end
      local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
      local drawPanelIndex = panelIndex
      local bgAlpah = (self._transparency)[drawPanelIndex]
      if isCombinedMainPanel == true then
        drawPanelIndex = 0
      end
      local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
      local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
      self._currentPoolIndex = drawPanelIndex
      local IsMouseOver = (UI.checkIsInMouseAndEventPanel)(currentPanel)
      if isShow == nil then
        isShow = false
      end
      if isMouseOnChattingViewIndex ~= nil and isMouseOnChattingViewIndex == drawPanelIndex then
        isShow = isMouseOn
        if isShow then
          bgAlpah = 1
        end
      else
        isShow = IsMouseOver
      end
      local isActivePanel = panelIndex == self._mainPanelSelectPanelIndex
      currentPanel:SetColor(UI_color.C_00000000)
      local messageIndex = (self._srollPosition)[panelIndex]
      local chattingMessage = chatPanel:beginMessage(messageIndex)
      local chatting_content_PosY = currentPanel:GetSizeY() - 10
      -- DECOMPILER ERROR at PC96: Unhandled construct in 'MakeBoolean' P1

      if isCombinedMainPanel and panelIndex ~= 0 then
        (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
        ;
        (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
      end
      if isCombinedMainPanel == false and chatPanel:isOpen() == true and (ChatUIPoolManager:getPanel(0)):GetShow() then
        (ChatUIPoolManager:getPanel(panelIndex)):SetShow(true)
        ;
        (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(false)
      end
      if isCombinedMainPanel == false and chatPanel:isOpen() == false then
        (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
        ;
        (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
      end
      if CheckTutorialEnd() == false then
        for ii = 1, ChatUIPoolManager._poolCount - 1 do
          (ChatUIPoolManager:getPanel(ii)):SetShow(false)
        end
      end
      if isCombinedMainPanel == false then
        if issmoothupMessage == false then
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC201: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC201: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        elseif messageIndex ~= 0 then
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC229: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        else
          poolCurrentUI:drawclear()
          -- DECOMPILER ERROR at PC234: Confused about usage of register: R20 in 'UnsetPending'

          deltascrollPosy[panelIndex] = 0
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, checkchattingupTime)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC257: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC257: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      elseif isActivePanel then
        if issmoothupMessage == false then
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC288: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC288: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        elseif messageIndex ~= 0 then
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC316: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC316: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        else
          poolCurrentUI:drawclear()
          -- DECOMPILER ERROR at PC321: Confused about usage of register: R20 in 'UnsetPending'

          deltascrollPosy[panelIndex] = 0
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, checkchattingupTime)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC344: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC344: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  if chattingUpTime > 0.2 and issmoothupMessage == false then
    ismsgin = false
    for panelIndex = 0, count - 1 do
      local chatPanel = ToClient_getChattingPanel(panelIndex)
      chatPanel:setPushchattingMsg(false)
    end
  end
  -- DECOMPILER ERROR: 24 unprocessed JMP targets
end

ChattingViewManager.UpdateSmoothScrollContent = function(self)
  -- function num : 0_15 , upvalues : ChatUIPoolManager, isMouseOnChattingViewIndex, isMouseOn, UI_color, deltascrollPosy
  local count = ToClient_getChattingPanelCount()
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
      local drawPanelIndex = panelIndex
      local bgAlpah = (self._transparency)[drawPanelIndex]
      if isCombinedMainPanel == true then
        drawPanelIndex = 0
      end
      local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
      local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
      self._currentPoolIndex = drawPanelIndex
      local IsMouseOver = (UI.checkIsInMouseAndEventPanel)(currentPanel)
      if isShow == nil then
        isShow = false
      end
      if isMouseOnChattingViewIndex ~= nil and isMouseOnChattingViewIndex == drawPanelIndex then
        isShow = isMouseOn
        if isShow then
          bgAlpah = 1
        end
      else
        isShow = IsMouseOver
      end
      local isActivePanel = panelIndex == self._mainPanelSelectPanelIndex
      currentPanel:SetColor(UI_color.C_00000000)
      local messageIndex = (self._srollPosition)[panelIndex]
      local chattingMessage = chatPanel:beginMessage(messageIndex)
      local chatting_content_PosY = currentPanel:GetSizeY() - 10
      -- DECOMPILER ERROR at PC80: Unhandled construct in 'MakeBoolean' P1

      if isCombinedMainPanel and panelIndex ~= 0 then
        (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
        ;
        (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
      end
      if isCombinedMainPanel == false and chatPanel:isOpen() == true and (ChatUIPoolManager:getPanel(0)):GetShow() then
        (ChatUIPoolManager:getPanel(panelIndex)):SetShow(true)
        ;
        (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(false)
      end
      if isCombinedMainPanel == false and chatPanel:isOpen() == false then
        (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
        ;
        (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
      end
      if CheckTutorialEnd() == false then
        for ii = 1, ChatUIPoolManager._poolCount - 1 do
          (ChatUIPoolManager:getPanel(ii)):SetShow(false)
        end
      end
      if isCombinedMainPanel == false then
        local messageIndex = (self._srollPosition)[panelIndex]
        local chattingMessage = chatPanel:beginMessage(messageIndex)
        local chatting_content_PosY = currentPanel:GetSizeY() - 10
        poolCurrentUI:drawclear()
        while 1 do
          while 1 do
            if chattingMessage ~= nil then
              chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
            end
          end
          if chatting_content_PosY < 45 then
            chattingMessage = chatPanel:nextMessage()
            messageIndex = messageIndex + 1
            -- DECOMPILER ERROR at PC190: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC190: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      elseif isActivePanel then
        local messageIndex = (self._srollPosition)[panelIndex]
        local chattingMessage = chatPanel:beginMessage(messageIndex)
        local chatting_content_PosY = currentPanel:GetSizeY() - 10
        poolCurrentUI:drawclear()
        while 1 do
          while 1 do
            if chattingMessage ~= nil then
              chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
            end
          end
          if chatting_content_PosY < 45 then
            chattingMessage = chatPanel:nextMessage()
            messageIndex = messageIndex + 1
            -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  -- DECOMPILER ERROR: 11 unprocessed JMP targets
end

ChattingViewManager.UpdateSmoothResetScrollContent = function(self, chattingScrollingTime)
  -- function num : 0_16 , upvalues : ChatUIPoolManager, isMouseOnChattingViewIndex, isMouseOn, UI_color, scrollIndex, scrollresetSpeed, preDownPosY, deltascrollPosy, isResetsmoothscroll, smoothResetScorllTime, ChattingViewManager
  local count = ToClient_getChattingPanelCount()
  FromClient_ChatUpdate(true)
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local isDraw = true
      local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
      local drawPanelIndex = panelIndex
      local bgAlpah = (self._transparency)[drawPanelIndex]
      if isCombinedMainPanel == true then
        drawPanelIndex = 0
      end
      local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
      local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
      self._currentPoolIndex = drawPanelIndex
      local IsMouseOver = (UI.checkIsInMouseAndEventPanel)(currentPanel)
      if isShow == nil then
        isShow = false
      end
      if isMouseOnChattingViewIndex ~= nil and isMouseOnChattingViewIndex == drawPanelIndex then
        isShow = isMouseOn
        if isShow then
          bgAlpah = 1
        end
      else
        isShow = IsMouseOver
      end
      currentPanel:SetColor(UI_color.C_00000000)
      local isActivePanel = panelIndex == self._mainPanelSelectPanelIndex
      if isCombinedMainPanel then
        if panelIndex ~= 0 then
          (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
          ;
          (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
        end
      else
        -- DECOMPILER ERROR at PC107: Unhandled construct in 'MakeBoolean' P1

        if isActivePanel == false and isCombinedMainPanel == false and chatPanel:isOpen() == true and (ChatUIPoolManager:getPanel(0)):GetShow() then
          (ChatUIPoolManager:getPanel(panelIndex)):SetShow(true)
          ;
          (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(false)
        end
      end
      if isCombinedMainPanel == false and chatPanel:isOpen() == false then
        (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
        ;
        (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
      end
      if CheckTutorialEnd() == false then
        for ii = 1, ChatUIPoolManager._poolCount - 1 do
          (ChatUIPoolManager:getPanel(ii)):SetShow(false)
        end
      end
      if isCombinedMainPanel == false then
        local messageIndex = (self._srollPosition)[panelIndex]
        local downIndex = 0
        local currdownPosY = 0
        local downPosY = 0
        if scrollIndex == panelIndex then
          ChattingPoolUpdate(poolCurrentUI, currentPanel, panelIndex, drawPanelIndex)
          if scrollresetSpeed < 5 then
            scrollresetSpeed = scrollresetSpeed + 2
          end
          currdownPosY = PaGlobal_AnimationEasingFun_easeOutQuadFragments(chattingScrollingTime, scrollresetSpeed * 0.9)
          downPosY = (math.abs)(currdownPosY - preDownPosY)
          if downPosY > 1 then
            preDownPosY = currdownPosY
          end
          downIndex = (math.floor)(downPosY)
          -- DECOMPILER ERROR at PC199: Confused about usage of register: R20 in 'UnsetPending'

          deltascrollPosy[panelIndex] = -(downPosY - downIndex)
          if isResetsmoothscroll == false then
            smoothResetScorllTime = 0
            preDownPosY = 0
            -- DECOMPILER ERROR at PC209: Confused about usage of register: R20 in 'UnsetPending'

            deltascrollPosy[scrollIndex] = 0
            -- DECOMPILER ERROR at PC211: Confused about usage of register: R20 in 'UnsetPending'

            ;
            (self._srollPosition)[panelIndex] = 0
            -- DECOMPILER ERROR at PC214: Confused about usage of register: R20 in 'UnsetPending'

            ;
            (ChattingViewManager._scroll_BTNPos)[panelIndex] = 1
            Scroll_IntervalAddPosCalc(panelIndex)
            FromClient_ChatUpdate(true)
            break
          end
          -- DECOMPILER ERROR at PC226: Confused about usage of register: R20 in 'UnsetPending'

          ;
          (self._srollPosition)[panelIndex] = (self._srollPosition)[panelIndex] - downIndex
          if (self._srollPosition)[panelIndex] <= 0 then
            smoothResetScorllTime = 0
            preDownPosY = 0
            -- DECOMPILER ERROR at PC236: Confused about usage of register: R20 in 'UnsetPending'

            deltascrollPosy[panelIndex] = 0
            -- DECOMPILER ERROR at PC238: Confused about usage of register: R20 in 'UnsetPending'

            ;
            (self._srollPosition)[panelIndex] = 0
            -- DECOMPILER ERROR at PC241: Confused about usage of register: R20 in 'UnsetPending'

            ;
            (ChattingViewManager._scroll_BTNPos)[panelIndex] = 1
            Scroll_IntervalAddPosCalc(panelIndex)
            isResetsmoothscroll = false
            FromClient_ChatUpdate(true)
            break
          end
          ;
          ((poolCurrentUI._list_Scroll)[0]):SetControlPos(1 - (self._srollPosition)[panelIndex] / (self._maxHistoryCount - 1))
          Scroll_IntervalAddPosCalc(panelIndex)
          messageIndex = (self._srollPosition)[panelIndex]
        end
        local chattingMessage = chatPanel:beginMessage(messageIndex)
        local chatting_content_PosY = currentPanel:GetSizeY() - 10
        if isDraw then
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 38 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC298: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC298: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      elseif isActivePanel then
        local messageIndex = (self._srollPosition)[panelIndex]
        local downIndex = 0
        local currdownPosY = 0
        local downPosY = 0
        if scrollIndex == panelIndex then
          ChattingPoolUpdate(poolCurrentUI, currentPanel, panelIndex, drawPanelIndex)
          if scrollresetSpeed < 5 then
            scrollresetSpeed = scrollresetSpeed + 2
          end
          currdownPosY = PaGlobal_AnimationEasingFun_easeOutQuadFragments(chattingScrollingTime, scrollresetSpeed * 0.9)
          downPosY = (math.abs)(currdownPosY - preDownPosY)
          if downPosY > 1 then
            preDownPosY = currdownPosY
          end
          downIndex = (math.floor)(downPosY)
          -- DECOMPILER ERROR at PC346: Confused about usage of register: R20 in 'UnsetPending'

          deltascrollPosy[scrollIndex] = -(downPosY - downIndex)
          if isResetsmoothscroll == false then
            smoothResetScorllTime = 0
            preDownPosY = 0
            -- DECOMPILER ERROR at PC355: Confused about usage of register: R20 in 'UnsetPending'

            deltascrollPosy[panelIndex] = 0
            -- DECOMPILER ERROR at PC358: Confused about usage of register: R20 in 'UnsetPending'

            ;
            (self._srollPosition)[scrollIndex] = 0
            -- DECOMPILER ERROR at PC362: Confused about usage of register: R20 in 'UnsetPending'

            ;
            (ChattingViewManager._scroll_BTNPos)[scrollIndex] = 1
            Scroll_IntervalAddPosCalc(scrollIndex)
            FromClient_ChatUpdate(true)
            break
          end
          -- DECOMPILER ERROR at PC376: Confused about usage of register: R20 in 'UnsetPending'

          ;
          (self._srollPosition)[scrollIndex] = (self._srollPosition)[scrollIndex] - downIndex
          if (self._srollPosition)[scrollIndex] <= 0 then
            smoothResetScorllTime = 0
            preDownPosY = 0
            -- DECOMPILER ERROR at PC387: Confused about usage of register: R20 in 'UnsetPending'

            deltascrollPosy[panelIndex] = 0
            -- DECOMPILER ERROR at PC390: Confused about usage of register: R20 in 'UnsetPending'

            ;
            (self._srollPosition)[scrollIndex] = 0
            -- DECOMPILER ERROR at PC394: Confused about usage of register: R20 in 'UnsetPending'

            ;
            (ChattingViewManager._scroll_BTNPos)[scrollIndex] = 1
            Scroll_IntervalAddPosCalc(scrollIndex)
            isResetsmoothscroll = false
            FromClient_ChatUpdate(true)
            break
          end
          ;
          ((poolCurrentUI._list_Scroll)[0]):SetControlPos(1 - (self._srollPosition)[panelIndex] / (self._maxHistoryCount - 1))
          Scroll_IntervalAddPosCalc(scrollIndex)
          messageIndex = (self._srollPosition)[scrollIndex]
        end
        local chattingMessage = chatPanel:beginMessage(messageIndex)
        local chatting_content_PosY = currentPanel:GetSizeY() - 10
        if isDraw then
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 38 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC452: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC452: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  if isResetsmoothscroll == false then
    for panelIndex = 0, count - 1 do
      local chatPanel = ToClient_getChattingPanel(panelIndex)
      if chatPanel:isOpen() then
        (ChatUIPoolManager:getPool(panelIndex)):clear()
        ChattingViewManager:update(chatPanel, panelIndex)
      end
    end
  end
  -- DECOMPILER ERROR: 25 unprocessed JMP targets
end

ChattingViewManager.UpdateSmoothWheelScrollContent = function(self, wheelScrollingTime)
  -- function num : 0_17 , upvalues : ChatUIPoolManager, isMouseOnChattingViewIndex, isMouseOn, UI_color, scrollIndex, issmoothWheelscroll, isUpDown, ChattingViewManager, deltascrollPosy, preScrollControlPos
  local count = ToClient_getChattingPanelCount()
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
      local drawPanelIndex = panelIndex
      local bgAlpah = (self._transparency)[drawPanelIndex]
      if isCombinedMainPanel == true then
        drawPanelIndex = 0
      end
      local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
      local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
      self._currentPoolIndex = drawPanelIndex
      local IsMouseOver = (UI.checkIsInMouseAndEventPanel)(currentPanel)
      if isShow == nil then
        isShow = false
      end
      if isMouseOnChattingViewIndex ~= nil and isMouseOnChattingViewIndex == drawPanelIndex then
        isShow = isMouseOn
        if isShow then
          bgAlpah = 1
        end
      else
        isShow = IsMouseOver
      end
      currentPanel:SetColor(UI_color.C_00000000)
      local isActivePanel = panelIndex == self._mainPanelSelectPanelIndex
      if isCombinedMainPanel then
        if panelIndex ~= 0 then
          (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
          ;
          (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
        end
      else
        -- DECOMPILER ERROR at PC103: Unhandled construct in 'MakeBoolean' P1

        if isActivePanel == false and isCombinedMainPanel == false and chatPanel:isOpen() == true and (ChatUIPoolManager:getPanel(0)):GetShow() then
          (ChatUIPoolManager:getPanel(panelIndex)):SetShow(true)
          ;
          (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(false)
        end
      end
      if isCombinedMainPanel == false and chatPanel:isOpen() == false then
        (ChatUIPoolManager:getPanel(panelIndex)):SetShow(false)
        ;
        (ChatUIPoolManager:getPanel(panelIndex)):SetIgnore(true)
      end
      if CheckTutorialEnd() == false then
        for ii = 1, ChatUIPoolManager._poolCount - 1 do
          (ChatUIPoolManager:getPanel(ii)):SetShow(false)
        end
      end
      if isCombinedMainPanel == false then
        if scrollIndex == panelIndex and issmoothWheelscroll then
          local poolScrollUI = ChatUIPoolManager:getPool(scrollIndex)
          if isUpDown then
            ((poolScrollUI._list_Scroll)[0]):SetControlPos(((poolScrollUI._list_Scroll)[0]):GetControlPos() - 1 / (ChattingViewManager._maxHistoryCount - 1) * wheelScrollingTime * 11.3)
          else
            ((poolScrollUI._list_Scroll)[0]):SetControlPos(((poolScrollUI._list_Scroll)[0]):GetControlPos() + 1 / (ChattingViewManager._maxHistoryCount - 1) * wheelScrollingTime * 11.3)
          end
          if ((poolScrollUI._list_Scroll)[0]):GetControlPos() > 1 then
            ((poolScrollUI._list_Scroll)[0]):SetControlPos(1)
          end
          if ((poolScrollUI._list_Scroll)[0]):GetControlPos() < 0 then
            ((poolScrollUI._list_Scroll)[0]):SetControlPos(0)
          end
          local index = (math.floor)((1 - ((poolScrollUI._list_Scroll)[0]):GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1))
          -- DECOMPILER ERROR at PC243: Confused about usage of register: R17 in 'UnsetPending'

          if index == 0 then
            deltascrollPosy[panelIndex] = (1 - ((poolScrollUI._list_Scroll)[0]):GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) % 1
          else
            -- DECOMPILER ERROR at PC257: Confused about usage of register: R17 in 'UnsetPending'

            deltascrollPosy[panelIndex] = ((1 - ((poolScrollUI._list_Scroll)[0]):GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) - index) % 1
          end
          -- DECOMPILER ERROR at PC263: Confused about usage of register: R17 in 'UnsetPending'

          preScrollControlPos[panelIndex] = ((poolScrollUI._list_Scroll)[0]):GetControlPos()
          -- DECOMPILER ERROR at PC266: Confused about usage of register: R17 in 'UnsetPending'

          ;
          (ChattingViewManager._srollPosition)[panelIndex] = index
          -- DECOMPILER ERROR at PC273: Confused about usage of register: R17 in 'UnsetPending'

          ;
          (ChattingViewManager._scroll_BTNPos)[panelIndex] = ((poolScrollUI._list_Scroll)[0]):GetControlPos()
          Scroll_IntervalAddPosCalc(panelIndex)
          local messageIndex = (self._srollPosition)[panelIndex]
          local chattingMessage = chatPanel:beginMessage(messageIndex)
          local chatting_content_PosY = currentPanel:GetSizeY() - 10
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC309: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        else
          local messageIndex = (self._srollPosition)[drawPanelIndex]
          local chattingMessage = chatPanel:beginMessage(messageIndex)
          local chatting_content_PosY = currentPanel:GetSizeY() - 10
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, drawPanelIndex, deltascrollPosy[drawPanelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC343: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      elseif isActivePanel then
        if scrollIndex == panelIndex and issmoothWheelscroll then
          local poolScrollUI = ChatUIPoolManager:getPool(drawPanelIndex)
          if isUpDown then
            ((poolScrollUI._list_Scroll)[0]):SetControlPos(((poolScrollUI._list_Scroll)[0]):GetControlPos() - 1 / (ChattingViewManager._maxHistoryCount - 1) * wheelScrollingTime * 11.3)
          else
            ((poolScrollUI._list_Scroll)[0]):SetControlPos(((poolScrollUI._list_Scroll)[0]):GetControlPos() + 1 / (ChattingViewManager._maxHistoryCount - 1) * wheelScrollingTime * 11.3)
          end
          if ((poolScrollUI._list_Scroll)[0]):GetControlPos() > 1 then
            ((poolScrollUI._list_Scroll)[0]):SetControlPos(1)
          end
          if ((poolScrollUI._list_Scroll)[0]):GetControlPos() < 0 then
            ((poolScrollUI._list_Scroll)[0]):SetControlPos(0)
          end
          local index = (math.floor)((1 - ((poolScrollUI._list_Scroll)[0]):GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1))
          -- DECOMPILER ERROR at PC438: Confused about usage of register: R17 in 'UnsetPending'

          if index == 0 then
            deltascrollPosy[panelIndex] = (1 - ((poolScrollUI._list_Scroll)[0]):GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) % 1
          else
            -- DECOMPILER ERROR at PC452: Confused about usage of register: R17 in 'UnsetPending'

            deltascrollPosy[panelIndex] = ((1 - ((poolScrollUI._list_Scroll)[0]):GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) - index) % 1
          end
          -- DECOMPILER ERROR at PC458: Confused about usage of register: R17 in 'UnsetPending'

          preScrollControlPos[panelIndex] = ((poolScrollUI._list_Scroll)[0]):GetControlPos()
          -- DECOMPILER ERROR at PC461: Confused about usage of register: R17 in 'UnsetPending'

          ;
          (ChattingViewManager._srollPosition)[panelIndex] = index
          -- DECOMPILER ERROR at PC468: Confused about usage of register: R17 in 'UnsetPending'

          ;
          (ChattingViewManager._scroll_BTNPos)[panelIndex] = ((poolScrollUI._list_Scroll)[0]):GetControlPos()
          Scroll_IntervalAddPosCalc(panelIndex)
          local messageIndex = (self._srollPosition)[panelIndex]
          local chattingMessage = chatPanel:beginMessage(messageIndex)
          local chatting_content_PosY = currentPanel:GetSizeY() - 10
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC504: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC504: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        else
          local messageIndex = (self._srollPosition)[panelIndex]
          local chattingMessage = chatPanel:beginMessage(messageIndex)
          local chatting_content_PosY = currentPanel:GetSizeY() - 10
          poolCurrentUI:drawclear()
          while 1 do
            while 1 do
              if chattingMessage ~= nil then
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              end
            end
            if chatting_content_PosY < 45 then
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              -- DECOMPILER ERROR at PC538: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC538: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR: 30 unprocessed JMP targets
end

ChattingViewManager.createTab = function(self, poolCurrentUI, panelIndex, isActivePanel, drawPanelIndex, isCombinedMainPanel, PosX, isShow)
  -- function num : 0_18 , upvalues : ChattingViewManager, ChatUIPoolManager
  if isCombinedMainPanel then
    if isActivePanel then
      local mainTab = poolCurrentUI:newTitleTab()
      mainTab:SetTextHorizonLeft(true)
      mainTab:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHATTING_MAINTAB_TITLE", "panel_Index", panelIndex + 1))
      mainTab:SetNotAbleMasking(true)
      mainTab:SetPosX(PosX)
      mainTab:SetTextSpan(40, 9)
      mainTab:SetShow(isShow)
      mainTab:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
      local settingButton = poolCurrentUI:newTitleTabConfigButton()
      settingButton:SetShow(isShow)
      settingButton:SetNotAbleMasking(true)
      settingButton:SetPosX(PosX + 3)
      settingButton:addInputEvent("Mouse_LUp", "ChattingOption_Open( " .. panelIndex .. ", " .. drawPanelIndex .. ", " .. tostring(isCombinedMainPanel) .. " )")
      settingButton:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
      settingButton:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
      settingButton:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
      if getEnableSimpleUI() then
        if ChattingViewManager._cacheSimpleUI then
          mainTab:SetFontAlpha(1)
          mainTab:SetAlpha(1)
          settingButton:SetAlpha(1)
        else
          mainTab:SetFontAlpha(0.8)
          mainTab:SetAlpha(0.7)
          settingButton:SetAlpha(0.7)
        end
      end
      if panelIndex ~= 0 then
        local divisionButton = poolCurrentUI:newPanelDivision()
        divisionButton:SetShow(isShow)
        divisionButton:SetNotAbleMasking(true)
        divisionButton:SetPosX(PosX + mainTab:GetSizeX() - divisionButton:GetSizeX() * 2 - 5)
        divisionButton:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_Division( " .. panelIndex .. " )")
        divisionButton:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
        divisionButton:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
        divisionButton:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
        local deleteButton = poolCurrentUI:newCloseButton()
        deleteButton:SetShow(isShow)
        deleteButton:SetNotAbleMasking(true)
        deleteButton:SetIgnore(false)
        deleteButton:SetPosX(PosX + mainTab:GetSizeX() - deleteButton:GetSizeX() - 5)
        deleteButton:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_Close( " .. panelIndex .. " )")
        deleteButton:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
        deleteButton:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
        deleteButton:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
        if getEnableSimpleUI() then
          if ChattingViewManager._cacheSimpleUI then
            divisionButton:SetAlpha(1)
            deleteButton:SetAlpha(1)
          else
            divisionButton:SetAlpha(0.7)
            deleteButton:SetAlpha(0.7)
          end
        end
      end
      do
        local isBottom = (ChattingViewManager._srollPosition)[panelIndex] == 0
        local scrollResetBtn = poolCurrentUI:newScrollReset()
        scrollResetBtn:SetShow(not isBottom)
        scrollResetBtn:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_ScrollReset( " .. panelIndex .. " )")
        scrollResetBtn:SetSize(((ChatUIPoolManager._listPanel)[drawPanelIndex]):GetSizeX(), 28)
        scrollResetBtn:ComputePos()
        do
          local moreList = poolCurrentUI:newMorelist()
          moreList:SetShow(scrollResetBtn:GetShow())
          moreList:ComputePos()
          PosX = PosX + mainTab:GetSizeX()
          local subTab = poolCurrentUI:newOtherTab()
          subTab:SetTextHorizonCenter(true)
          subTab:SetText(panelIndex + 1)
          subTab:SetNotAbleMasking(true)
          subTab:SetPosX(PosX)
          do
            local penal = ToClient_getChattingPanel(0)
            subTab:SetShow(isShow)
            if getEnableSimpleUI() then
              if ChattingViewManager._cacheSimpleUI then
                subTab:SetFontAlpha(1)
                subTab:SetAlpha(1)
              else
                subTab:SetFontAlpha(0.8)
                subTab:SetAlpha(0.7)
              end
            end
            subTab:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_ChangeTab( " .. panelIndex .. " )")
            subTab:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
            PosX = PosX + subTab:GetSizeX()
            local mainTab = poolCurrentUI:newTitleTab()
            mainTab:SetTextHorizonLeft(true)
            mainTab:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHATTING_MAINTAB_TITLE", "panel_Index", panelIndex + 1))
            mainTab:SetNotAbleMasking(true)
            mainTab:SetPosX(0)
            mainTab:SetTextSpan(40, 8)
            mainTab:SetShow(isShow)
            mainTab:addInputEvent("Mouse_On", "Chatting_PanelTransparency(" .. panelIndex .. ", true )")
            mainTab:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. panelIndex .. ", false )")
            local settingButton = poolCurrentUI:newTitleTabConfigButton()
            settingButton:SetShow(isShow)
            settingButton:SetNotAbleMasking(true)
            settingButton:SetPosX(3)
            settingButton:addInputEvent("Mouse_LUp", "ChattingOption_Open( " .. panelIndex .. ", " .. drawPanelIndex .. ", " .. tostring(isCombinedMainPanel) .. " )")
            settingButton:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
            settingButton:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
            settingButton:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
            local combineButton = poolCurrentUI:newPanelCombine()
            combineButton:SetShow(isShow)
            combineButton:SetNotAbleMasking(true)
            combineButton:SetPosX(mainTab:GetSizeX() - combineButton:GetSizeX() * 2 - 5)
            combineButton:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_CombineTab( " .. panelIndex .. " )")
            combineButton:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
            combineButton:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
            combineButton:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
            local deleteButton = poolCurrentUI:newCloseButton()
            deleteButton:SetShow(isShow)
            deleteButton:SetNotAbleMasking(true)
            deleteButton:SetIgnore(false)
            deleteButton:SetPosX(mainTab:GetSizeX() - deleteButton:GetSizeX() - 5)
            deleteButton:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_Close( " .. panelIndex .. " )")
            deleteButton:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
            deleteButton:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
            deleteButton:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
            if getEnableSimpleUI() then
              if ChattingViewManager._cacheSimpleUI then
                mainTab:SetFontAlpha(1)
                mainTab:SetAlpha(1)
                settingButton:SetAlpha(1)
                combineButton:SetAlpha(1)
                deleteButton:SetAlpha(1)
              else
                mainTab:SetFontAlpha(0.8)
                mainTab:SetAlpha(0.7)
                settingButton:SetAlpha(0.7)
                combineButton:SetAlpha(0.7)
                deleteButton:SetAlpha(0.7)
              end
            end
            local isBottom = (ChattingViewManager._srollPosition)[panelIndex] == 0
            local scrollResetBtn = poolCurrentUI:newScrollReset()
            scrollResetBtn:SetShow(not isBottom)
            scrollResetBtn:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_ScrollReset( " .. panelIndex .. " )")
            scrollResetBtn:SetSize(((ChatUIPoolManager._listPanel)[drawPanelIndex]):GetSizeX(), 28)
            scrollResetBtn:ComputePos()
            do
              local moreList = poolCurrentUI:newMorelist()
              moreList:SetShow(scrollResetBtn:GetShow())
              moreList:ComputePos()
              do return PosX end
              -- DECOMPILER ERROR: 9 unprocessed JMP targets
            end
          end
        end
      end
    end
  end
end

Chatting_ScrollEvent = function(poolIndex, updown)
  -- function num : 0_19 , upvalues : issmoothWheelscroll, ChattingViewManager, isUpDown, scrollIndex
  if issmoothWheelscroll then
    return 
  end
  local chatPanel = ToClient_getChattingPanel(poolIndex)
  do
    local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
    if isCombinedMainPanel then
      local count = ToClient_getChattingPanelCount()
      for panelIndex = 0, count - 1 do
        local isActivePanel = panelIndex == ChattingViewManager._mainPanelSelectPanelIndex
        if isActivePanel then
          issmoothWheelscroll = true
          isUpDown = updown
          scrollIndex = panelIndex
        end
      end
    else
      issmoothWheelscroll = true
      isUpDown = updown
      scrollIndex = poolIndex
    end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

Scroll_IntervalAddPosCalc = function(panelIndex)
  -- function num : 0_20 , upvalues : ChattingViewManager, _scroll_Interval_AddPos
  local self = ChattingViewManager
  local panel = ToClient_getChattingPanel(panelIndex)
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  if panel:setChattingPanelFreeze(true, (self._srollPosition)[panelIndex]) == false then
    _scroll_Interval_AddPos[panelIndex] = 0
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R3 in 'UnsetPending'

  _scroll_Interval_AddPos[panelIndex] = (self._srollPosition)[panelIndex]
end

Chatting_OnResize = function()
  -- function num : 0_21 , upvalues : chattingWindowMaxWidth, ChatUIPoolManager
  chattingWindowMaxWidth = getScreenSizeX() * 0.67
  local divisionPanel, panel, chatUI = nil, nil, nil
  for poolIndex = 0, ChatUIPoolManager._poolCount - 1 do
    divisionPanel = ToClient_getChattingPanel(poolIndex)
    panel = (ChatUIPoolManager._listPanel)[poolIndex]
    chatUI = (ChatUIPoolManager._listChatUIPool)[poolIndex]
    if poolIndex ~= 0 and (divisionPanel:isOpen() == false or divisionPanel:isCombinedToMainPanel()) then
      panel:SetShow(false)
    end
    local panelSizeX = divisionPanel:getPanelSizeX()
    local panelSizeY = divisionPanel:getPanelSizeY()
    local panelPosX = divisionPanel:getPositionX()
    local panelPosY = divisionPanel:getPositionY()
    if CppDefine.ChangeUIAndResolution == true then
      if panel:GetRelativePosX() == -1 and panel:GetRelativePosY() == -1 then
        local initPosX = 0
        local initPosY = getScreenSizeY() - panelSizeY - Panel_GameTips:GetSizeY()
        panelPosX = initPosX
        panelPosY = initPosY
        panel:SetPosX(panelPosX)
        panel:SetPosY(panelPosY)
        FGlobal_InitPanelRelativePos(panel, initPosX, initPosY)
      end
      do
        if panel:GetRelativePosX() == 0 and panel:GetRelativePosY() == 0 then
          panelPosX = 0
          panelPosY = getScreenSizeY() - panelSizeY - Panel_GameTips:GetSizeY()
        else
          if panel:GetRelativePosX() > 0 or panel:GetRelativePosY() > 0 then
            panelPosX = panel:GetRelativePosX() * getScreenSizeX() - panel:GetSizeX() / 2
            panelPosY = panel:GetRelativePosY() * getScreenSizeY() - panel:GetSizeY() / 2
          end
        end
        if panelPosX ~= -1 or panelPosY ~= -1 then
          panelPosX = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, poolIndex, (CppEnums.PanelSaveType).PanelSaveType_PositionX)
          panelPosY = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, poolIndex, (CppEnums.PanelSaveType).PanelSaveType_PositionY)
        end
        if panelSizeX > 25 and panelSizeY > 50 then
          panel:SetSize(panelSizeX, panelSizeY)
          ;
          ((chatUI._list_PanelBG)[0]):SetSize(panelSizeX, panelSizeY)
          ;
          ((chatUI._list_Scroll)[0]):SetSize(((chatUI._list_Scroll)[0]):GetSizeX(), panelSizeY - 67)
          for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
            ((chatUI._list_ChattingContents)[chattingContents_idx]):SetSize(panelSizeX - 25, ((chatUI._list_ChattingContents)[chattingContents_idx]):GetSizeY())
          end
          ;
          ((chatUI._list_ResizeButton)[0]):SetPosX(panelSizeX - (((chatUI._list_ResizeButton)[0]):GetSizeX() + 5))
          ;
          ((chatUI._list_Scroll)[0]):SetPosX(panelSizeX - (((chatUI._list_Scroll)[0]):GetSizeX() + 5))
          ;
          ((chatUI._list_Scroll)[0]):SetPosY(50)
          ;
          ((chatUI._list_Scroll)[0]):SetControlBottom()
        else
          panelSizeX = 420
          panelSizeY = 222
          panel:SetSize(panelSizeX, panelSizeY)
          ;
          ((chatUI._list_PanelBG)[0]):SetSize(panelSizeX, panelSizeY)
          ;
          ((chatUI._list_Scroll)[0]):SetSize(((chatUI._list_Scroll)[0]):GetSizeX(), panelSizeY - 67)
          for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
            ((chatUI._list_ChattingContents)[chattingContents_idx]):SetSize(panelSizeX - 25, ((chatUI._list_ChattingContents)[chattingContents_idx]):GetSizeY())
          end
          ;
          ((chatUI._list_ResizeButton)[0]):SetPosX(panelSizeX - (((chatUI._list_ResizeButton)[0]):GetSizeX() + 5))
          ;
          ((chatUI._list_Scroll)[0]):SetPosX(panelSizeX - (((chatUI._list_Scroll)[0]):GetSizeX() + 5))
          ;
          ((chatUI._list_Scroll)[0]):SetPosY(50)
          ;
          ((chatUI._list_Scroll)[0]):SetControlBottom()
        end
        local defaultPosY = getScreenSizeY() - panel:GetSizeY() - Panel_GameTips:GetSizeY()
        if panelPosX == -1 and panelPosY == -1 then
          panelPosX = 0
          panelPosY = defaultPosY
        else
          if panelPosX < 0 then
            panelPosX = 0
          else
            if getScreenSizeX() - panel:GetSizeX() < panelPosX then
              panelPosX = getScreenSizeX() - panel:GetSizeX() - Panel_GameTips:GetSizeY()
            end
          end
          if CppDefine.ChangeUIAndResolution == true then
            if panelPosY < 0 then
              panelPosY = 0
            else
              if panelPosY == 0 then
                panelPosY = defaultPosY
              else
                if getScreenSizeY() - panel:GetSizeY() < panelPosY then
                  panelPosY = defaultPosY
                end
              end
            end
          else
            if panelPosY < 0 then
              panelPosY = 0
            else
              if getScreenSizeY() - panel:GetSizeY() < panelPosY then
                panelPosY = defaultPosY
              end
            end
          end
        end
        panel:SetPosX(panelPosX)
        panel:SetPosY(panelPosY)
        do
          local isCombinePanel = divisionPanel:isCombinedToMainPanel()
          divisionPanel:setPosition(panelPosX, panelPosY, panelSizeX, panelSizeY)
          if isCombinePanel then
            divisionPanel:combineToMainPanel()
          end
          -- DECOMPILER ERROR at PC363: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC363: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC363: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  FromClient_ChatUpdate()
end

HandleClicked_ScrollBtnPosY = function(panelIndex)
  -- function num : 0_22 , upvalues : issmoothscroll, ChattingViewManager, ChatUIPoolManager, preScrollControlPos, deltascrollPosy
  if issmoothscroll then
    return 
  end
  local selectindex = 0
  local chatPanel = ToClient_getChattingPanel(panelIndex)
  local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
  if isCombinedMainPanel then
    local count = ToClient_getChattingPanelCount()
    for checkpanelIndex = 0, count - 1 do
      local isActivePanel = checkpanelIndex == ChattingViewManager._mainPanelSelectPanelIndex
      if isActivePanel then
        issmoothscroll = true
        selectindex = 0
      end
    end
  else
    issmoothscroll = true
    selectindex = panelIndex
  end
  local poolCurrentUI = ChatUIPoolManager:getPool(selectindex)
  if preScrollControlPos[panelIndex] == ((poolCurrentUI._list_Scroll)[0]):GetControlPos() then
    FromClient_ChatUpdate(true)
    return 
  end
  do
    local index = (math.floor)((1 - ((poolCurrentUI._list_Scroll)[0]):GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1))
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R6 in 'UnsetPending'

    if index == 0 then
      deltascrollPosy[panelIndex] = (1 - ((poolCurrentUI._list_Scroll)[0]):GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) % 1
    else
      -- DECOMPILER ERROR at PC89: Confused about usage of register: R6 in 'UnsetPending'

      deltascrollPosy[panelIndex] = ((1 - ((poolCurrentUI._list_Scroll)[0]):GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) - index) % 1
    end
    -- DECOMPILER ERROR at PC95: Confused about usage of register: R6 in 'UnsetPending'

    preScrollControlPos[panelIndex] = ((poolCurrentUI._list_Scroll)[0]):GetControlPos()
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (ChattingViewManager._srollPosition)[panelIndex] = index
    -- DECOMPILER ERROR at PC105: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (ChattingViewManager._scroll_BTNPos)[panelIndex] = ((poolCurrentUI._list_Scroll)[0]):GetControlPos()
    Scroll_IntervalAddPosCalc(panelIndex)
    FromClient_ChatUpdate(true)
    -- DECOMPILER ERROR: 7 unprocessed JMP targets
  end
end

HandleClicked_Chatting_AddTab = function()
  -- function num : 0_23 , upvalues : ChattingViewManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  ChattingViewManager._addChattingPreset = false
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  ChattingViewManager._addChattingIdx = ToClient_openChattingPanel()
  FromClient_ChatUpdate(true)
  ToClient_SaveUiInfo(false)
end

HandleClicked_Chatting_AddTabByIndex = function(panelIndex)
  -- function num : 0_24 , upvalues : ChattingViewManager
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ChattingViewManager._addChattingIdx = ToClient_openChattingPanelbyIndex(panelIndex)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ChattingViewManager._addChattingPreset = true
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  if ChattingViewManager._addChattingIdx == -1 then
    ChattingViewManager._addChattingIdx = nil
  else
    FromClient_ChatUpdate(true)
    ToClient_SaveUiInfo(false)
  end
  FromClient_ChatUpdate(true)
  ToClient_SaveUiInfo(false)
end

HandleClicked_Chatting_ChangeTab = function(panelIndex)
  -- function num : 0_25 , upvalues : ChattingViewManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  ChattingViewManager._mainPanelSelectPanelIndex = panelIndex
  FromClient_ChatUpdate(true)
end

moveChatTab = function(moveTo)
  -- function num : 0_26
  local isSuccess = false
  local tempValue = 0
  while isSuccess == false and tempValue < 5 do
    isSuccess = moveChatTabExec(moveTo)
    tempValue = tempValue + 1
  end
end

moveChatTabExec = function(moveTo)
  -- function num : 0_27 , upvalues : ChattingViewManager
  local isSuccess = false
  local addIndex = 1
  if moveTo == false then
    addIndex = -1
  end
  local index = ChattingViewManager._mainPanelSelectPanelIndex + addIndex
  if index < 0 then
    index = 4
  else
    if index > 4 then
      index = 0
    end
  end
  local chatPanelInfo = ToClient_getChattingPanel(index)
  if chatPanelInfo ~= nil and chatPanelInfo:isCombinedToMainPanel() then
    isSuccess = chatPanelInfo:isOpen()
  end
  HandleClicked_Chatting_ChangeTab(index)
  return isSuccess
end

HandleClicked_Chatting_Division = function(panelIndex)
  -- function num : 0_28 , upvalues : ChatUIPoolManager, ChattingViewManager
  local divisionPanel = ToClient_getChattingPanel(panelIndex)
  local panel = ChatUIPoolManager:getPanel(panelIndex)
  local chatUI = ChatUIPoolManager:getPool(panelIndex)
  divisionPanel:setPosition(getScreenSizeX() / 2 - panel:GetSizeX() / 2, getScreenSizeY() / 2 - panel:GetSizeY() / 2, panel:GetSizeX(), panel:GetSizeY())
  panel:SetSize(400, 200)
  panel:SetPosX(getScreenSizeX() / 2 - panel:GetSizeX() / 2)
  panel:SetPosY(getScreenSizeY() / 2 - panel:GetSizeY() / 2)
  panel:SetShow(true)
  panel:SetIgnore(false)
  panel:SetRelativePosX(0.5)
  panel:SetRelativePosY(0.5)
  local sizeX = panel:GetSizeX()
  local sizeY = panel:GetSizeY()
  ;
  ((chatUI._list_PanelBG)[0]):SetSize(sizeX, sizeY)
  ;
  ((chatUI._list_Scroll)[0]):SetSize(((chatUI._list_Scroll)[0]):GetSizeX(), sizeY - 67)
  ;
  ((chatUI._list_ResizeButton)[0]):SetPosX(sizeX - (((chatUI._list_ResizeButton)[0]):GetSizeX() + 5))
  ;
  ((chatUI._list_Scroll)[0]):SetControlBottom()
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R6 in 'UnsetPending'

  ChattingViewManager._mainPanelSelectPanelIndex = 0
  -- DECOMPILER ERROR at PC102: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (ChattingViewManager._transparency)[panelIndex] = 0.5
  FromClient_ChatUpdate(true)
  ToClient_SaveUiInfo(false)
end

HandleClicked_Chatting_CombineTab = function(panelIndex)
  -- function num : 0_29
  local penel = ToClient_getChattingPanel(panelIndex)
  penel:combineToMainPanel()
  FromClient_ChatUpdate(true)
  ToClient_SaveUiInfo(false)
end

HandleClicked_Chatting_Close = function(panelIndex)
  -- function num : 0_30 , upvalues : ChattingViewManager
  ToClient_closeChattingPanel(panelIndex)
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ChattingViewManager._mainPanelSelectPanelIndex = 0
  FromClient_ChatUpdate()
  ToClient_SaveUiInfo(false)
end

HandleClicked_Chatting_ScrollReset = function(panelIndex)
  -- function num : 0_31 , upvalues : isResetsmoothscroll, ChattingViewManager, issmoothscroll, scrollIndex, ChatUIPoolManager, scrollresetSpeed, _scroll_Interval_AddPos
  isResetsmoothscroll = true
  local chatPanel = ToClient_getChattingPanel(panelIndex)
  local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
  if isCombinedMainPanel then
    local count = ToClient_getChattingPanelCount()
    for checkpanelIndex = 0, count - 1 do
      local isActivePanel = checkpanelIndex == ChattingViewManager._mainPanelSelectPanelIndex
      if isActivePanel then
        issmoothscroll = true
        scrollIndex = panelIndex
        panelIndex = 0
      end
    end
  else
    issmoothscroll = true
    scrollIndex = panelIndex
  end
  do
    local poolCurrentUI = ChatUIPoolManager:getPool(panelIndex)
    scrollresetSpeed = _scroll_Interval_AddPos[scrollIndex]
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

local orgMouseX = 0
local orgMouseY = 0
local orgPanelSizeX = 0
local orgPanelSizeY = 0
local orgPanelPosY = 0
HandleClicked_Chatting_ResizeStartPos = function(drawPanelIndex)
  -- function num : 0_32 , upvalues : ChatUIPoolManager, orgMouseX, orgMouseY, orgPanelPosY, orgPanelSizeX, orgPanelSizeY
  local panel = ChatUIPoolManager:getPanel(drawPanelIndex)
  orgMouseX = getMousePosX()
  orgMouseY = getMousePosY()
  orgPanelPosY = panel:GetPosY()
  orgPanelSizeX = panel:GetSizeX()
  orgPanelSizeY = panel:GetSizeY()
  FromClient_ChatUpdate(true, drawPanelIndex)
end

HandleClicked_Chatting_ResizeStartPosEND = function(drawPanelIndex)
  -- function num : 0_33
  ToClient_SaveUiInfo(false)
  Chatting_PanelTransparency(drawPanelIndex, false)
end

HandleClicked_Chatting_Resize = function(drawPanelIndex, panelIdx)
  -- function num : 0_34 , upvalues : ChatUIPoolManager, orgMouseX, orgMouseY, orgPanelSizeX, orgPanelSizeY, chattingWindowMaxWidth, orgPanelPosY
  local panel = ChatUIPoolManager:getPanel(drawPanelIndex)
  local chatUI = ChatUIPoolManager:getPool(drawPanelIndex)
  local currentX = getMousePosX()
  local currentY = getMousePosY()
  local deltaX = currentX - orgMouseX
  local deltaY = orgMouseY - currentY
  local sizeX = orgPanelSizeX + deltaX
  local sizeY = orgPanelSizeY + deltaY
  if chattingWindowMaxWidth <= sizeX then
    sizeX = chattingWindowMaxWidth
  else
    if sizeX <= 400 then
      sizeX = 400
    end
  end
  if sizeY <= 200 then
    sizeY = 200
  end
  local deltaPosY = orgPanelSizeY - sizeY
  panel:SetSize(sizeX, sizeY)
  ;
  ((chatUI._list_PanelBG)[0]):SetSize(sizeX, sizeY)
  ;
  ((chatUI._list_Scroll)[0]):SetSize(((chatUI._list_Scroll)[0]):GetSizeX(), sizeY - 67)
  for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
    ((chatUI._list_ChattingContents)[chattingContents_idx]):SetSize(sizeX - 25, ((chatUI._list_ChattingContents)[chattingContents_idx]):GetSizeY())
  end
  panel:SetPosY(orgPanelPosY + deltaPosY)
  ;
  ((chatUI._list_ResizeButton)[0]):SetPosX(sizeX - (((chatUI._list_ResizeButton)[0]):GetSizeX() + 5))
  ;
  ((chatUI._list_Scroll)[0]):SetPosX(sizeX - (((chatUI._list_Scroll)[0]):GetSizeX() + 5))
  ;
  ((chatUI._list_Scroll)[0]):SetControlBottom()
  if CppDefine.ChangeUIAndResolution == true then
    PAGlobal_setPanelChattingPoolRelativeSize(drawPanelIndex)
  end
  FromClient_ChatUpdate(true, drawPanelIndex)
  ToClient_SaveUiInfo(false)
end

HandleOn_ChattingLinkedItem = function(poolIndex, LinkedItemStaticIndex, isClicked)
  -- function num : 0_35 , upvalues : ChattingViewManager, ChatUIPoolManager
  FromClient_ChatUpdate()
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R3 in 'UnsetPending'

  ChattingViewManager._linkedItemTooltipIsClicked = isClicked
  local paramIndex = poolIndex
  if poolIndex == 0 then
    paramIndex = ChattingViewManager._mainPanelSelectPanelIndex
  end
  local chatPanel = ToClient_getChattingPanel(paramIndex)
  local poolCurrentUI = ChatUIPoolManager:getPool(poolIndex)
  local panelCurrentUI = ChatUIPoolManager:getPanel(poolIndex)
  local messageIndex = (poolCurrentUI._list_LinkedItemMessageIndex)[LinkedItemStaticIndex]
  local chattingMessage = chatPanel:getChattingMessageByIndex(messageIndex)
  if chattingMessage:isLinkedItem() then
    local chattingLinkedItem = chattingMessage:getLinkedItemInfo()
    local itemSSW = chattingLinkedItem:getLinkedItemStaticStatus()
    if itemSSW ~= nil then
      Panel_Tooltip_Item_Show_ForChattingLinkedItem(itemSSW, panelCurrentUI, true, false, chattingLinkedItem, isClicked)
      Scroll_IntervalAddPosCalc(paramIndex)
    end
  end
end

HandleOn_ChattingLinkedWebSite = function(poolIndex, LinkedWebsiteIndex)
  -- function num : 0_36 , upvalues : ChattingViewManager, ChatUIPoolManager
  FromClient_ChatUpdate()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  ChattingViewManager._linkedItemTooltipIsClicked = isClicked
  local paramIndex = poolIndex
  if poolIndex == 0 then
    paramIndex = ChattingViewManager._mainPanelSelectPanelIndex
  end
  local chatPanel = ToClient_getChattingPanel(paramIndex)
  local poolCurrentUI = ChatUIPoolManager:getPool(poolIndex)
  local messageIndex = (poolCurrentUI._list_LinkedWebSiteMessageIndex)[LinkedWebsiteIndex]
  local chattingMessage = chatPanel:getChattingMessageByIndex(messageIndex)
  if chattingMessage:isLinkedWebsite() then
    ToClient_OpenChargeWebPage(chattingMessage:getLinkedWebsite(), false)
  end
end

HandleClicked_ChattingSender = function(poolIndex, senderStaticIndex)
  -- function num : 0_37 , upvalues : ChattingViewManager, ChatUIPoolManager, clickedName, clickedUserNickName, clickedMsg, currentPoolIndex, clickedMessageIndex, ChatSubMenu
  FromClient_ChatUpdate()
  local paramIndex = poolIndex
  if poolIndex == 0 then
    paramIndex = ChattingViewManager._mainPanelSelectPanelIndex
  end
  local posX = getMousePosX()
  local posY = getMousePosY()
  local chatPanel = ToClient_getChattingPanel(paramIndex)
  local poolCurrentUI = ChatUIPoolManager:getPool(poolIndex)
  local messageIndex = (poolCurrentUI._list_SenderMessageIndex)[senderStaticIndex]
  local chattingMessage = chatPanel:getChattingMessageByIndex(messageIndex)
  if chattingMessage ~= nil then
    clickedName = chattingMessage:getSender(0)
    clickedUserNickName = chattingMessage:getSender(1)
    clickedMsg = chattingMessage:getContent()
    chatType = chattingMessage.chatType
    isSameChannel = chattingMessage.isSameChannel
    currentPoolIndex = paramIndex
    clickedMessageIndex = messageIndex
    if clickedName ~= nil and clickedUserNickName ~= nil then
      setClipBoardText(clickedName)
      if (ChatSubMenu._mainPanel):IsShow() then
        ChatSubMenu:SetShow(false)
      end
      ChatSubMenu:SetShow(true, isInviteParty(chatType, isSameChannel), isInviteGuild(chatType, isSameChannel), isInviteCompetition(isSameChannel), chattingMessage.isGameManager, clickedName, clickedUserNickName)
      ChatSubMenu:SetPos(posX, posY)
    end
  else
    clickedName = nil
    clickedUserNickName = nil
    clickedMsg = nil
    currentPoolIndex = nil
    clickedMessageIndex = nil
  end
end

isInviteParty = function(chatType, isSameChannel)
  -- function num : 0_38 , upvalues : UI_CT
  local selfPlayer = getSelfPlayer()
  local selfActorKeyRaw = selfPlayer:getActorKey()
  do
    local isInvite = selfPlayer:isPartyLeader(selfActorKeyRaw) or selfPlayer:isPartyMemberActorKey(selfActorKeyRaw) == false
    do return isSameChannel and ((UI_CT.Party ~= chatType and isInvite)) end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

isInviteGuild = function(chatType, isSameChannel)
  -- function num : 0_39 , upvalues : UI_CT
  local selfPlayer = getSelfPlayer()
  do
    local selfActorKeyRaw = selfPlayer:getActorKey()
    do return isSameChannel and ((UI_CT.Guild ~= chatType and selfPlayer:isSpecialGuildMember(selfActorKeyRaw))) end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

isInviteCompetition = function(isSameChannel)
  -- function num : 0_40
  local selfPlayer = getSelfPlayer()
  local selfActorKeyRaw = selfPlayer:getActorKey()
  if isSameChannel then
    return ToClient_IsCompetitionHost()
  end
end

HandleClicked_ChatSubMenu_SendWhisper = function()
  -- function num : 0_41 , upvalues : clickedName, clickedUserNickName, ChatSubMenu, clickedMsg, currentPoolIndex, clickedMessageIndex
  if clickedName ~= nil and clickedUserNickName ~= nil then
    local nameType = ToClient_getChatNameType()
    if nameType == 0 then
      FGlobal_ChattingInput_ShowWhisper(clickedName)
    else
      if nameType == 1 then
        FGlobal_ChattingInput_ShowWhisper(clickedUserNickName)
      end
    end
    ChatSubMenu:SetShow(false)
    clickedName = nil
    clickedUserNickName = nil
    clickedMsg = nil
    currentPoolIndex = nil
    clickedMessageIndex = nil
  end
end

HandleClicked_ChatSubMenu_AddFriend = function()
  -- function num : 0_42 , upvalues : clickedName, clickedUserNickName, ChatSubMenu, clickedMsg, currentPoolIndex, clickedMessageIndex
  if clickedName ~= nil and clickedUserNickName ~= nil then
    local nameType = ToClient_getChatNameType()
    if nameType == 0 then
      requestFriendList_addFriend(clickedName, true)
    else
      if nameType == 1 then
        requestFriendList_addFriend(clickedUserNickName, false)
      end
    end
    ChatSubMenu:SetShow(false)
    clickedName = nil
    clickedUserNickName = nil
    clickedMsg = nil
    currentPoolIndex = nil
    clickedMessageIndex = nil
  end
end

HandleClicked_ChatSubMenu_InviteParty = function()
  -- function num : 0_43 , upvalues : currentPoolIndex, clickedMessageIndex, clickedName, ChatSubMenu, clickedUserNickName, clickedMsg
  if currentPoolIndex ~= nil and clickedMessageIndex ~= nil then
    ToClient_RequestInvitePartyByChatSubMenu(currentPoolIndex, clickedName)
    ChatSubMenu:SetShow(false)
    local isSelfPlayerPlayingPvPMatch = (getSelfPlayer()):isDefinedPvPMatch()
    if isSelfPlayerPlayingPvPMatch == false then
      local nameType = (ToClient_getChatNameType())
      local selectName = nil
      if nameType == 0 then
        selectName = clickedName
      else
        if nameType == 1 then
          selectName = clickedUserNickName
        end
      end
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ACK_INVITE", "targetName", selectName))
    end
    do
      clickedName = nil
      clickedUserNickName = nil
      clickedMsg = nil
      currentPoolIndex = nil
      clickedMessageIndex = nil
    end
  end
end

HandleClicked_ChatSubMenu_InviteLargeParty = function()
  -- function num : 0_44 , upvalues : currentPoolIndex, clickedMessageIndex, clickedName, ChatSubMenu, clickedUserNickName, clickedMsg
  if currentPoolIndex ~= nil and clickedMessageIndex ~= nil then
    ToClient_InviteLargePartyByCharacterName(clickedName)
    ChatSubMenu:SetShow(false)
    local isSelfPlayerPlayingPvPMatch = (getSelfPlayer()):isDefinedPvPMatch()
    if isSelfPlayerPlayingPvPMatch == false then
      local nameType = (ToClient_getChatNameType())
      local selectName = nil
      if nameType == 0 then
        selectName = clickedName
      else
        if nameType == 1 then
          selectName = clickedUserNickName
        end
      end
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ACK_INVITE", "targetName", selectName))
    end
    do
      clickedName = nil
      clickedUserNickName = nil
      clickedMsg = nil
      currentPoolIndex = nil
      clickedMessageIndex = nil
    end
  end
end

HandleClicked_ChatSubMenu_InviteGuild = function()
  -- function num : 0_45 , upvalues : currentPoolIndex, clickedMessageIndex, clickedName, ChatSubMenu
  if currentPoolIndex ~= nil and clickedMessageIndex ~= nil then
    ToClient_RequestInviteGuildByChatSubMenu(currentPoolIndex, clickedName)
    ChatSubMenu:SetShow(false)
  end
end

HandleClicked_ChatSubMenu_InviteCompetition = function()
  -- function num : 0_46 , upvalues : currentPoolIndex, clickedMessageIndex, clickedName, ChatSubMenu
  if currentPoolIndex ~= nil and clickedMessageIndex ~= nil then
    ToClient_RequestInviteCompetitionByChatSubMenu(clickedName, false)
    ChatSubMenu:SetShow(false)
  end
end

FromClient_requestInviteGuildByChatSubMenu = function(actorKeyRaw)
  -- function num : 0_47 , upvalues : clickedName, clickedUserNickName, clickedMsg, currentPoolIndex, clickedMessageIndex
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  if guildGrade == 0 then
    toClient_RequestInviteGuild(clickedName, 0, 0, 0)
  else
    FGlobal_AgreementGuild_Master_Open_ForJoin(actorKeyRaw, clickedName, 0)
  end
  clickedName = nil
  clickedUserNickName = nil
  clickedMsg = nil
  currentPoolIndex = nil
  clickedMessageIndex = nil
end

HandleClicked_ChatSubMenu_Block = function()
  -- function num : 0_48 , upvalues : currentPoolIndex, clickedMessageIndex, clickedUserNickName, ChatSubMenu, clickedName, clickedMsg
  if currentPoolIndex ~= nil and clickedMessageIndex ~= nil then
    local chatBlock = function()
    -- function num : 0_48_0 , upvalues : currentPoolIndex, clickedUserNickName, ChatSubMenu, clickedName, clickedMsg, clickedMessageIndex
    ToClient_RequestBlockCharacter(currentPoolIndex, clickedUserNickName)
    ChatSubMenu:SetShow(false)
    clickedName = nil
    clickedUserNickName = nil
    clickedMsg = nil
    currentPoolIndex = nil
    clickedMessageIndex = nil
  end

    local messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHNATNEW_INTERCEPTION_MEMO", "clickedName", clickedUserNickName)
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_CHNATNEW_INTERCEPTION_TITLE"), content = messageContent, functionYes = chatBlock, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

HandleClicked_ChatSubMenu_ReportGoldSeller = function()
  -- function num : 0_49 , upvalues : currentPoolIndex, clickedMessageIndex, clickedMsg, clickedName
  local selfProxy = (getSelfPlayer()):get()
  local inventory = selfProxy:getCashInventory()
  local hasItem = inventory:getItemCount_s64(ItemEnchantKey(65208, 0))
  if toInt64(0, 0) == hasItem then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_NO_HAVE_ITEM"))
    return 
  end
  local limitLevel = 20
  if ((getSelfPlayer()):get()):getLevel() < limitLevel then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHATNEW_GOLDSELLERITEM_LIMITLEVEL", "limitLevel", limitLevel))
    return 
  end
  if currentPoolIndex ~= nil and clickedMessageIndex ~= nil and clickedMsg ~= nil then
    FGlobal_reportSeller_Open(clickedName, clickedMsg)
  end
end

HandleClicked_ChatSubMenu_BlockVote = function()
  -- function num : 0_50 , upvalues : currentPoolIndex, clickedMessageIndex, clickedName, ChatSubMenu, clickedUserNickName, clickedMsg
  if currentPoolIndex ~= nil and clickedMessageIndex ~= nil then
    local chatBlockVote = function()
    -- function num : 0_50_0 , upvalues : clickedName, ChatSubMenu, clickedUserNickName, clickedMsg, currentPoolIndex, clickedMessageIndex
    ToClient_RequestBlockChatByUser(clickedName)
    ChatSubMenu:SetShow(false)
    clickedName = nil
    clickedUserNickName = nil
    clickedMsg = nil
    currentPoolIndex = nil
    clickedMessageIndex = nil
  end

    local nameType = (ToClient_getChatNameType())
    local selectName = nil
    if nameType == 0 then
      selectName = clickedName
    else
      if nameType == 1 then
        selectName = clickedUserNickName
      end
    end
    local messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHNATNEW_CHAT_BAN_MEMO", "clickedName", selectName)
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_CHNATNEW_CHAT_BAN_TITLE"), content = messageContent, functionYes = chatBlockVote, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

HanldeClicked_ChatSubMenu_Introduce = function()
  -- function num : 0_51
end

FGlobal_ChattingPanel_Reset = function()
  -- function num : 0_52 , upvalues : ChatUIPoolManager
  for index = 0, ChatUIPoolManager._poolCount - 1 do
    local panel = ToClient_getChattingPanel(index)
    panel:setPosition(-1, -1, -1, -1)
    if index ~= 0 then
      panel:combineToMainPanel()
    end
    ChattingOption_SelectFontSize(14)
    setisChangeFontSize(true)
  end
  local baseChatPanel = ChatUIPoolManager:getPanel(0)
  baseChatPanel:SetShow(true)
  FromClient_ChatUpdate()
end

FGlobal_Chatting_ShowToggle = function()
  -- function num : 0_53 , upvalues : ChatUIPoolManager
  local baseChatPanel = ChatUIPoolManager:getPanel(0)
  if baseChatPanel:GetShow() == true then
    baseChatPanel:SetShow(false)
  else
    baseChatPanel:SetShow(true)
  end
  FromClient_ChatUpdate()
end

FGlobal_Chatting_PanelTransparency = function(panelIndex, _transparency, update)
  -- function num : 0_54 , upvalues : ChattingViewManager
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R3 in 'UnsetPending'

  (ChattingViewManager._transparency)[panelIndex] = _transparency
  local chatPanel = ToClient_getChattingPanel(panelIndex)
  chatPanel:setTransparency(_transparency)
  if update then
    FromClient_ChatUpdate()
  end
end

FGlobal_Chatting_PanelTransparency_Chk = function(panelIndex)
  -- function num : 0_55 , upvalues : ChattingViewManager
  return (ChattingViewManager._transparency)[panelIndex]
end

Chatting_PanelTransparency = function(panelIndex, transparency, isHideTooltip)
  -- function num : 0_56 , upvalues : ChatUIPoolManager, isMouseOn, ChattingViewManager, isMouseOnChattingViewIndex
  local count = ToClient_getChattingPanelCount()
  if count < panelIndex then
    return 
  end
  local currentPanel = ChatUIPoolManager:getPanel(panelIndex)
  local IsMouseOver = (UI.checkIsInMouseAndEventPanel)(currentPanel)
  if isHideTooltip == true and Panel_Tooltip_Item_chattingLinkedItem:GetShow() then
    Panel_Tooltip_Item_hideTooltip()
  end
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R6 in 'UnsetPending'

  -- DECOMPILER ERROR at PC30: Unhandled construct in 'MakeBoolean' P1

  if transparency == true and IsMouseOver == true and isMouseOn == false then
    ChattingViewManager._cacheSimpleUI = true
    isMouseOnChattingViewIndex = panelIndex
    isMouseOn = true
    FromClient_ChatUpdate(IsMouseOver, panelIndex)
  end
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R6 in 'UnsetPending'

  if transparency == false and IsMouseOver == false then
    ChattingViewManager._cacheSimpleUI = false
    isMouseOn = false
    isMouseOnChattingViewIndex = nil
    FromClient_ChatUpdate(IsMouseOver, panelIndex)
  end
end

FGlobal_MainChatPanelUpdate = function()
  -- function num : 0_57 , upvalues : ChatUIPoolManager, UI_color
  local chatPanelInfo = ToClient_getChattingPanel(0)
  local targetPanel = ChatUIPoolManager:getPanel(0)
  targetPanel:SetShow(false, false)
  if getSelfPlayer() == nil or (getSelfPlayer()):get() == nil then
    return 
  end
  if CheckTutorialEnd() == false and PaGlobal_TutorialManager:isDoingTutorial() == true then
    return 
  end
  targetPanel:SetColor(UI_color.C_00000000)
  if chatPanelInfo:isOpen() then
    targetPanel:SetShow(true)
  else
    targetPanel:SetShow(false)
  end
end

ChatPanel_Update = function()
  -- function num : 0_58 , upvalues : ChatUIPoolManager
  local count = ToClient_getChattingPanelCount()
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    local chatUI = ChatUIPoolManager:getPool(panelIndex)
    for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
      ((chatUI._list_ChattingSender)[chattingContents_idx]):SetText("")
      ;
      ((chatUI._list_ChattingSender)[chattingContents_idx]):SetSize(((chatUI._list_ChattingSender)[chattingContents_idx]):GetSizeX(), ((chatUI._list_ChattingSender)[chattingContents_idx]):GetSizeY())
    end
    chatUI:clear()
  end
end

ChattingPoolUpdate = function(poolCurrentUI, currentPanel, panelIndex, drawPanelIndex)
  -- function num : 0_59 , upvalues : ChattingViewManager
  poolCurrentUI:clear()
  local panel_resizeButton = poolCurrentUI:newResizeButton()
  panel_resizeButton:SetNotAbleMasking(true)
  panel_resizeButton:SetShow(true)
  panel_resizeButton:addInputEvent("Mouse_LDown", "HandleClicked_Chatting_ResizeStartPos( " .. drawPanelIndex .. " )")
  panel_resizeButton:addInputEvent("Mouse_LPress", "HandleClicked_Chatting_Resize( " .. drawPanelIndex .. ", " .. panelIndex .. " )")
  panel_resizeButton:addInputEvent("Mouse_RPress", "Chatting_PanelTransparency( " .. drawPanelIndex .. ", false )")
  panel_resizeButton:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_ResizeStartPosEND(" .. drawPanelIndex .. ")")
  panel_resizeButton:addInputEvent("Mouse_RUp", "Chatting_PanelTransparency( " .. drawPanelIndex .. ", false )")
  panel_resizeButton:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
  local panel_Bg = poolCurrentUI:newPanelBG()
  panel_Bg:SetNotAbleMasking(true)
  panel_Bg:SetShow(true)
  panel_Bg:SetIgnore(true)
  panel_Bg:SetAlpha(1)
  panel_Bg:SetSize(panel_Bg:GetSizeX(), currentPanel:GetSizeY() - 30)
  panel_Bg:SetPosY(30)
  local panel_Scroll = poolCurrentUI:newScroll()
  panel_Scroll:SetShow(true)
  panel_Scroll:SetInterval(ChattingViewManager._maxHistoryCount)
  panel_Scroll:SetCtrlWeight(0.1)
  panel_Scroll:SetPosX(panel_Bg:GetSizeX() - panel_Scroll:GetSizeX() - 3)
  panel_Scroll:SetControlPos((ChattingViewManager._scroll_BTNPos)[panelIndex])
  panel_Scroll:addInputEvent("Mouse_LUp", "HandleClicked_ScrollBtnPosY( " .. panelIndex .. " )")
  panel_Scroll:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. panelIndex .. ", false )")
  local panel_ScrollBtn = panel_Scroll:GetControlButton()
  panel_ScrollBtn:addInputEvent("Mouse_LPress", "HandleClicked_ScrollBtnPosY( " .. panelIndex .. " )")
  panel_ScrollBtn:addInputEvent("Mouse_RPress", "HandleClicked_ScrollBtnPosY( " .. panelIndex .. " )")
  panel_ScrollBtn:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. panelIndex .. ", false )")
  panel_ScrollBtn:SetShow(true)
  if getEnableSimpleUI() then
    local self = ChattingViewManager
    panel_Scroll:SetShow(self._cacheSimpleUI)
    panel_ScrollBtn:SetShow(self._cacheSimpleUI)
  end
end

FromClient_ChatUpdate = function(isShow, currentPanelIndex)
  -- function num : 0_60 , upvalues : _tabButton_PosX, addChat_PosX, ChatUIPoolManager, ChattingViewManager, isMouseOn
  _tabButton_PosX = 0
  addChat_PosX = 0
  local openedChattingPanelCount = 0
  local count = ToClient_getChattingPanelCount()
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      openedChattingPanelCount = openedChattingPanelCount + 1
      if chatPanel:isUpdated() then
        (ChatUIPoolManager:getPool(panelIndex)):clear()
        local isCombinedPanel = chatPanel:isCombinedToMainPanel()
        if currentPanelIndex == panelIndex then
          ChattingViewManager:update(chatPanel, panelIndex, isShow)
        else
          if currentPanelIndex == 0 and isCombinedPanel then
            ChattingViewManager:update(chatPanel, panelIndex, isShow)
          else
            ChattingViewManager:update(chatPanel, panelIndex)
          end
        end
      end
    else
      do
        local panel = ChatUIPoolManager:getPanel(panelIndex)
        panel:SetShow(false)
        do
          local poolCurrentUI = ChatUIPoolManager:getPool(panelIndex)
          poolCurrentUI:clear()
          -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  setisChangeFontSize(false)
  if openedChattingPanelCount < 5 then
    local poolCurrentUI = ChatUIPoolManager:getPool(0)
    local panel_addTab = poolCurrentUI:newAddTab()
    local mainPanel = ChatUIPoolManager:getPanel(0)
    panel_addTab:SetNotAbleMasking(true)
    if currentPanelIndex == 0 or currentPanelIndex == nil then
      panel_addTab:SetShow(isMouseOn)
    else
      if currentPanelIndex ~= nil and currentPanelIndex ~= 0 then
        panel_addTab:SetShow(false)
      end
    end
    panel_addTab:SetPosX(addChat_PosX)
    panel_addTab:SetPosY(1)
    if getEnableSimpleUI() then
      if ChattingViewManager._cacheSimpleUI then
        panel_addTab:SetAlpha(1)
      else
        panel_addTab:SetAlpha(0.8)
      end
    end
    panel_addTab:SetIgnore(false)
    panel_addTab:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_AddTab()")
    if currentPanelIndex ~= nil then
      panel_addTab:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. currentPanelIndex .. ", false )")
      panel_addTab:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. currentPanelIndex .. ")")
      panel_addTab:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. currentPanelIndex .. ")")
    end
  end
  do
    if ChattingViewManager._addChattingIdx ~= nil and Panel_UI_Setting:GetShow() == false then
      if ChattingViewManager._addChattingPreset == false then
        ChattingOption_Open(ChattingViewManager._addChattingIdx, 0, true)
      end
      -- DECOMPILER ERROR at PC175: Confused about usage of register: R4 in 'UnsetPending'

      ChattingViewManager._addChattingIdx = nil
    end
  end
end

FGlobal_getChattingPanel = function(poolIndex)
  -- function num : 0_61 , upvalues : ChatUIPoolManager
  local panel = ChatUIPoolManager:getPanel(poolIndex)
  return panel
end

FGlobal_getChattingPanelUIPool = function(panelIndex)
  -- function num : 0_62 , upvalues : ChatUIPoolManager
  return ChatUIPoolManager:getPool(panelIndex)
end

Chatting_EnableSimpleUI = function()
  -- function num : 0_63
  FromClient_ChatUpdate()
end

FGlobal_InputModeChangeForChatting = function()
  -- function num : 0_64 , upvalues : isMouseOn, ChattingViewManager
  local IM = CppEnums.EProcessorInputMode
  if ToClient_isLoadingProcessor() == false and IM.eProcessorInputMode_GameMode == getInputMode() then
    isMouseOn = false
    FromClient_ChatUpdate(false, ChattingViewManager._mainPanelSelectPanelIndex)
  end
end

local saveWhisperTime = getTime()
local checkWhistperTime = toUint64(0, 60000)
local sendPossibleTime = toUint64(0, 0)
FromClient_PrivateChatMessageUpdate = function()
  -- function num : 0_65 , upvalues : sendPossibleTime, checkWhistperTime
  if sendPossibleTime <= getTime() then
    audioPostEvent_SystemUi(100, 0)
    sendPossibleTime = getTime() + checkWhistperTime
  end
end

Chatting_setIsOpenValue = function(panelIndex, isOpen)
  -- function num : 0_66
  local chatPanel = ToClient_getChattingPanel(panelIndex)
  chatPanel:setOpenValue(isOpen)
end

Chatting_setUsedSmoothChattingUp = function(flag)
  -- function num : 0_67 , upvalues : isUsedSmoothChattingUp
  isUsedSmoothChattingUp = flag
end

Chatting_getUsedSmoothChattingUp = function()
  -- function num : 0_68 , upvalues : isUsedSmoothChattingUp
  return isUsedSmoothChattingUp
end

checkCombineandActiveMainPanel = function()
  -- function num : 0_69
end

ResetAllScroll = function()
  -- function num : 0_70 , upvalues : ChatUIPoolManager, ChattingViewManager
  local count = ToClient_getChattingPanelCount()
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local poolCurrentUI = ChatUIPoolManager:getPool(panelIndex)
      local panelCurrentUI = ChatUIPoolManager:getPanel(panelIndex)
      if chatPanel:isChattingPanelFreeze() then
        chatPanel:setChattingPanelFreeze(false)
        chatPanel:setFreezingMsgUpdated(true)
      end
      -- DECOMPILER ERROR at PC33: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (ChattingViewManager._srollPosition)[panelIndex] = 0
      ;
      ((poolCurrentUI._list_Scroll)[0]):SetControlPos(1)
    end
  end
  FromClient_ChatUpdate(true)
end

registerEvent("EventSimpleUIEnable", "Chatting_EnableSimpleUI")
registerEvent("EventSimpleUIDisable", "Chatting_EnableSimpleUI")
registerEvent("EventChattingMessageUpdate", "FromClient_ChatUpdate")
registerEvent("onScreenResize", "Chatting_OnResize")
registerEvent("EventProcessorInputModeChange", "FGlobal_InputModeChangeForChatting")
registerEvent("FromClient_requestInviteGuildByChatSubMenu", "FromClient_requestInviteGuildByChatSubMenu")
registerEvent("FromClient_PrivateChatMessageUpdate", "FromClient_PrivateChatMessageUpdate")
registerEvent("FromClient_RenderModeChangeState", "Chatting_OnResize")
registerEvent("FromClient_luaLoadComplete", "ResetAllScroll")

