local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_CT = CppEnums.ChatType
local UI_CNT = CppEnums.EChatNoticeType
local UI_Group = Defines.UIGroup
local IM = CppEnums.EProcessorInputMode
local UI_CST = CppEnums.ChatSystemType
local UI_LangType = CppEnums.paLanguageType
local currentPoolIndex, clickedMessageIndex, clickedName, clickedUserNickName, clickedMsg, isMouseOnChattingViewIndex
local isMouseOn = false
local chattingWindowMaxWidth = 600
local chattingUpTime = 0
local premsgCount = {
  [0] = 0,
  [1] = 0,
  [2] = 0,
  [3] = 0,
  [4] = 0
}
local prepopmsgCount = {
  [0] = 0,
  [1] = 0,
  [2] = 0,
  [3] = 0,
  [4] = 0
}
local issmoothupMessage = false
local smoothScorllTime = 0
local deltascrollPosy = {
  [0] = 0,
  [1] = 0,
  [2] = 0,
  [3] = 0,
  [4] = 0
}
local issmoothscroll = false
local preScrollControlPos = {
  [0] = 0,
  [1] = 0,
  [2] = 0,
  [3] = 0,
  [4] = 0
}
local ScrollHistroy = {
  [0] = _maxHistoryCount,
  _maxHistoryCount,
  _maxHistoryCount,
  _maxHistoryCount,
  _maxHistoryCount
}
local smoothWheelScorllTime = 0
local issmoothWheelscroll = false
local isUpDown = false
local scrollIndex = 0
local scrollresetSpeed = 0
local smoothResetScorllTime = 0
local isResetsmoothscroll = false
local preDownPosY = 0
local ismsgin = false
local isUsedSmoothChattingUp = ToClient_getGameUIManagerWrapper():getLuaCacheDataListBool(CppEnums.GlobalUIOptionType.ChattingAnimation)
local isReportGoldSellerOpen = ToClient_IsContentsGroupOpen("89")
local _scroll_Interval_AddPos = {
  [0] = 0,
  [1] = 0,
  [2] = 0,
  [3] = 0,
  [4] = 0
}
local ChatSubMenu = {
  _mainPanel = Panel_Chat_SubMenu,
  _uiBg = UI.getChildControl(Panel_Chat_SubMenu, "Static_SubMenu"),
  _uiButtonWhisper = UI.getChildControl(Panel_Chat_SubMenu, "Button_Whisper"),
  _uiButtonAddFriend = UI.getChildControl(Panel_Chat_SubMenu, "Button_AddFriend"),
  _uiButtonInviteParty = UI.getChildControl(Panel_Chat_SubMenu, "Button_InviteParty"),
  _uiButtonInviteLargeParty = UI.getChildControl(Panel_Chat_SubMenu, "Button_InviteLargeParty"),
  _uiButtonInviteGuild = UI.getChildControl(Panel_Chat_SubMenu, "Button_InviteGuild"),
  _uiButtonInviteCompetition = UI.getChildControl(Panel_Chat_SubMenu, "Button_InviteCompetition"),
  _uiButtonBlock = UI.getChildControl(Panel_Chat_SubMenu, "Button_Block"),
  _uiButtonReportGoldSeller = UI.getChildControl(Panel_Chat_SubMenu, "Button_ReportGoldSeller"),
  _uiButtonBlockVote = UI.getChildControl(Panel_Chat_SubMenu, "Button_BlockVote"),
  _uiButtonIntroduce = UI.getChildControl(Panel_Chat_SubMenu, "Button_ShowIntroduce"),
  _uiButtonWinClose = UI.getChildControl(Panel_Chat_SubMenu, "Button_WinClose")
}
local partyPosY = ChatSubMenu._uiButtonInviteParty:GetPosY()
local guildPosY = ChatSubMenu._uiButtonInviteGuild:GetPosY()
local isLargePartyOpen = ToClient_IsContentsGroupOpen("286")
function ChatSubMenu:initialize()
  self._uiBg:addInputEvent("Mouse_On", "HandleOn_ChattingSubMenu()")
  self._uiButtonWhisper:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_SendWhisper()")
  self._uiButtonAddFriend:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_AddFriend()")
  self._uiButtonInviteParty:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_InviteParty()")
  self._uiButtonInviteLargeParty:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_InviteLargeParty()")
  self._uiButtonInviteGuild:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_InviteGuild()")
  self._uiButtonInviteCompetition:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_InviteCompetition()")
  self._uiButtonWinClose:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_Close()")
  self._uiButtonBlock:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_Block()")
  self._uiButtonReportGoldSeller:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_ReportGoldSeller()")
  self._uiButtonBlockVote:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_BlockVote()")
  self._uiButtonIntroduce:addInputEvent("Mouse_LUp", "HandleClicked_ChatSubMenu_Introduce()")
  self._uiButtonIntroduce:SetShow(false)
  self._uiBg:SetIgnore(false)
  self:SetShow(false)
end
function HandleOn_ChattingSubMenu()
  if nil ~= currentPanelIndex then
    Chatting_PanelTransparency(currentPanelIndex, false)
  end
end
function HandleClicked_ChatSubMenu_Close()
  ChatSubMenu:SetShow(false)
end
function ChatSubMenu:SetShow(isShow, isInviteParty, isInviteGuild, isInviteCompetition, isGameManager, clickedName, clickedUserNickName)
  if isShow then
    local bgSizeY = 165
    local buttonPosY = 160
    local gapY = 35
    local isCountryShow = true
    if isGameTypeKorea() then
      isCountryShow = true
    elseif isGameTypeJapan() then
      isCountryShow = false
    elseif isGameTypeEnglish() then
      isCountryShow = false
    elseif isGameTypeRussia() then
      isCountryShow = true
    end
    ToClient_updateAddFriendAllowed()
    if true == isGameManager then
      self._uiButtonBlockVote:SetShow(false)
      self._uiButtonReportGoldSeller:SetShow(false)
    else
      self._uiButtonBlockVote:SetShow(isCountryShow)
      self._uiButtonReportGoldSeller:SetShow(isReportGoldSellerOpen)
    end
    self._uiButtonInviteParty:SetShow(isInviteParty)
    self._uiButtonInviteGuild:SetShow(isInviteGuild)
    self._uiButtonInviteCompetition:SetShow(isInviteCompetition)
    self._uiButtonInviteParty:SetShow(false)
    self._uiButtonInviteLargeParty:SetShow(false)
    local isEmptyParty = ToClient_IsPartyEmpty()
    if isEmptyParty then
      self._uiButtonInviteParty:SetShow(true)
      if isLargePartyOpen then
        self._uiButtonInviteLargeParty:SetShow(true)
      else
        self._uiButtonInviteLargeParty:SetShow(false)
      end
    else
      local isPartyType = ToClient_GetPartyType()
      if false == isLargePartyOpen then
        isPartyType = 0
        self._uiButtonInviteLargeParty:SetShow(false)
      end
      if 0 == isPartyType then
        self._uiButtonInviteParty:SetShow(isInviteParty)
        self._uiButtonInviteLargeParty:SetShow(false)
      elseif 1 == isPartyType then
        self._uiButtonInviteLargeParty:SetShow(true)
        self._uiButtonInviteParty:SetShow(false)
      end
    end
    if self._uiButtonBlockVote:GetShow() then
      self._uiButtonBlockVote:SetPosY(buttonPosY)
      buttonPosY = buttonPosY + gapY
      bgSizeY = bgSizeY + gapY
    end
    if self._uiButtonReportGoldSeller:GetShow() then
      self._uiButtonReportGoldSeller:SetPosY(buttonPosY)
      buttonPosY = buttonPosY + gapY
      bgSizeY = bgSizeY + gapY
    end
    if self._uiButtonInviteParty:GetShow() then
      self._uiButtonInviteParty:SetPosY(buttonPosY)
      buttonPosY = buttonPosY + gapY
      bgSizeY = bgSizeY + gapY
    end
    if self._uiButtonInviteLargeParty:GetShow() then
      self._uiButtonInviteLargeParty:SetPosY(buttonPosY)
      buttonPosY = buttonPosY + gapY
      bgSizeY = bgSizeY + gapY
    end
    if self._uiButtonInviteGuild:GetShow() then
      self._uiButtonInviteGuild:SetPosY(buttonPosY)
      buttonPosY = buttonPosY + gapY
      bgSizeY = bgSizeY + gapY
    end
    if self._uiButtonInviteCompetition:GetShow() then
      self._uiButtonInviteCompetition:SetPosY(buttonPosY)
      buttonPosY = buttonPosY + gapY
      bgSizeY = bgSizeY + gapY
    end
    self._uiBg:SetText(clickedUserNickName .. "\n" .. clickedName)
    self._uiBg:SetSize(self._uiBg:GetSizeX(), bgSizeY)
  else
    currentPoolIndex = nil
    clickedMessageIndex = nil
    clickedName, clickedUserNickName = nil, nil
    clickedMsg = nil
  end
  self._mainPanel:SetShow(isShow)
end
function ChatSubMenu:SetPos(x, y)
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  if screenSizeX <= x + self._uiBg:GetSizeX() then
    x = screenSizeX - self._uiBg:GetSizeX()
  end
  if screenSizeY <= y + self._uiBg:GetSizeY() then
    y = screenSizeY - self._uiBg:GetSizeY()
  end
  self._mainPanel:SetPosX(x)
  self._mainPanel:SetPosY(y)
end
ChatSubMenu:initialize()
local ChatUIPoolManager = {
  _poolCount = 5,
  _listPanel = {},
  _listChatUIPool = {},
  _listPopupNameMenu = {},
  _maxListCount = 100,
  _defaultPanelSizeX = 420,
  _defaultPanelSizeY = 222
}
local _currentInitPool = 0
local ChatRenderMode = PAUIRenderModeBitSet({
  Defines.RenderMode.eRenderMode_Default,
  Defines.RenderMode.eRenderMode_WorldMap
})
function ChatUIPoolManager:createPanel(poolIndex, stylePanel)
  local panel = UI.createPanelAndSetPanelRenderMode("Panel_Chat" .. poolIndex, UI_Group.PAGameUIGroup_Chatting, ChatRenderMode)
  CopyBaseProperty(stylePanel, panel)
  panel:ChangeSpecialTextureInfoName("new_ui_common_forlua/Window/Chatting/Chatting_Win_transparency.dds")
  panel:setMaskingChild(true)
  panel:setGlassBackground(true)
  panel:SetSize(ChatUIPoolManager._defaultPanelSizeX, ChatUIPoolManager._defaultPanelSizeY)
  panel:SetPosX(0)
  panel:SetPosY(getScreenSizeY() - panel:GetSizeY() - 35)
  panel:SetColor(UI_color.C_FFFFFFFF)
  panel:SetIgnore(false)
  panel:SetDragAll(false)
  panel:addInputEvent("Mouse_UpScroll", "Chatting_ScrollEvent( " .. poolIndex .. ", true )")
  panel:addInputEvent("Mouse_DownScroll", "Chatting_ScrollEvent( " .. poolIndex .. ", false )")
  panel:addInputEvent("Mouse_On", "Chatting_PanelTransparency( " .. poolIndex .. ", true )")
  panel:addInputEvent("Mouse_Out", "Chatting_PanelTransparency( " .. poolIndex .. ", false , " .. 9999 .. ")")
  local show = ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_ChattingWindow, poolIndex, CppEnums.PanelSaveType.PanelSaveType_IsShow)
  panel:SetShow(show)
  return panel
end
function ChatUIPoolManager:createPool(poolIndex, poolStylePanel, poolParentPanel)
  local ChatUIPool = {
    _list_PanelBG = {},
    _list_TitleTab = {},
    _list_TitleTabText = {},
    _list_TitleTabConfigButton = {},
    _list_OtherTab = {},
    _list_AddTab = {},
    _list_ResizeButton = {},
    _list_PanelDivision = {},
    _list_PanelDelete = {},
    _list_ChattingIcon = {},
    _list_ChattingSender = {},
    _list_ChattingContents = {},
    _list_ChattingLinkedItem = {},
    _list_ChattingLinkedGuild = {},
    _list_ChattingGuildMark = {},
    _list_ChattingLinkedWebSite = {},
    _list_Scroll = {},
    _list_CloseButton = {},
    _list_ScrollReset = {},
    _list_MoreList = {},
    _list_Emoticon = {},
    _list_At = {},
    _list_SenderMessageIndex = {},
    _list_LinkedItemMessageIndex = {},
    _list_LinkedGuildMessageIndex = {},
    _list_LinkedWebSiteMessageIndex = {},
    _list_LinkedAtMessageIndex = {},
    _count_PanelBG = 0,
    _maxcount_PanelBG = 5,
    _count_TitleTab = 0,
    _maxcount_TitleTab = 5,
    _count_TitleTabText = 0,
    _maxcount_TitleTabText = 5,
    _count_TitleTabConfigButton = 0,
    _maxcount_TitleTabConfigButton = 5,
    _count_OtherTab = 0,
    _maxcount_OtherTab = 4,
    _count_AddTab = 0,
    _maxcount_AddTab = 1,
    _count_PanelDivision = 0,
    _maxcount_PanelDivision = 5,
    _count_PanelDelete = 0,
    _maxcount_PanelDelete = 5,
    _count_ResizeButton = 0,
    _maxcount_ResizeButton = 5,
    _count_ChattingIcon = 0,
    _maxcount_ChattingIcon = self._maxListCount,
    _count_ChattingSender = 0,
    _maxcount_ChattingSender = self._maxListCount,
    _count_ChattingContents = 0,
    _maxcount_ChattingContents = self._maxListCount,
    _count_ChattingLinkedItem = 0,
    _maxcount_ChattingLinkedItem = self._maxListCount,
    _count_ChattingLinkedGuild = 0,
    _maxcount_ChattingLinkedGuild = self._maxListCount,
    _count_ChattingGuildMark = 0,
    _maxcount_ChattingGuildMark = self._maxListCount,
    _count_ChattingLinkedWebSite = 0,
    _maxcount_ChattingLinkedWebSite = self._maxListCount,
    _count_Scroll = 0,
    _maxcount_Scroll = 1,
    _count_CloseButton = 0,
    _maxcount_CloseButton = 4,
    _count_ScrollReset = 0,
    _maxcount_ScrollReset = 4,
    _count_MoreList = 0,
    _maxcount_MoreList = 4,
    _count_Emoticon = 0,
    _maxcount_Emoticon = self._maxListCount * 4,
    _count_At = 0,
    _maxcount_At = self._maxListCount
  }
  function ChatUIPool:prepareControl(Panel, parentControl, createdCotrolList, controlType, controlName, createCount)
    local styleUI = UI.getChildControl(Panel, controlName)
    for index = 0, createCount do
      createdCotrolList[index] = UI.createControl(controlType, parentControl, controlName .. index)
      CopyBaseProperty(styleUI, createdCotrolList[index])
      createdCotrolList[index]:SetShow(true)
    end
  end
  function ChatUIPool:initialize(stylePanel, parentControl, poolIndex)
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
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ChattingLinkedGuild, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_ChatLinkedGuild", self._maxcount_ChattingLinkedGuild)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ChattingGuildMark, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_GuildMark", self._maxcount_ChattingGuildMark)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ChattingLinkedWebSite, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_ChatLinkedWebSite", self._maxcount_ChattingLinkedWebSite)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_Scroll, UI_PUCT.PA_UI_CONTROL_SCROLL, "Scroll_Chatting", self._maxcount_Scroll)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_CloseButton, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_Close", self._maxcount_CloseButton)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_ScrollReset, UI_PUCT.PA_UI_CONTROL_BUTTON, "Button_ScrollReset", self._maxcount_ScrollReset)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_MoreList, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_MoreList", self._maxcount_MoreList)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_Emoticon, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_Emoticon", self._maxcount_Emoticon)
    ChatUIPool:prepareControl(stylePanel, parentControl, self._list_At, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "Static_At", self._maxcount_At)
    for index = 0, self._maxcount_ChattingLinkedItem do
      self._list_ChattingLinkedItem[index]:addInputEvent("Mouse_On", "HandleOn_ChattingLinkedItem(" .. poolIndex .. ", " .. index .. ", false)")
      self._list_ChattingLinkedItem[index]:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. poolIndex .. ", false, true )")
      self._list_ChattingLinkedItem[index]:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. poolIndex .. ")")
      self._list_ChattingLinkedItem[index]:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. poolIndex .. ")")
      self._list_ChattingLinkedItem[index]:addInputEvent("Mouse_LUp", "HandleOn_ChattingLinkedItem(" .. poolIndex .. ", " .. index .. ", true)")
    end
    for index = 0, self._maxcount_ChattingLinkedGuild do
      self._list_ChattingLinkedGuild[index]:addInputEvent("Mouse_LUp", "HandleOn_ChattingLinkedGuild(" .. poolIndex .. ", " .. index .. ", 2)")
    end
    for index = 0, self._maxcount_ChattingLinkedWebSite do
      self._list_ChattingLinkedWebSite[index]:addInputEvent("Mouse_LUp", "HandleOn_ChattingLinkedWebSite(" .. poolIndex .. ", " .. index .. ", 2)")
    end
    for index = 0, self._maxcount_ChattingSender do
      self._list_ChattingSender[index]:addInputEvent("Mouse_LUp", "HandleClicked_ChattingSender(" .. poolIndex .. ", " .. index .. ")")
      self._list_ChattingSender[index]:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. poolIndex .. ", false )")
      self._list_ChattingSender[index]:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. poolIndex .. ")")
      self._list_ChattingSender[index]:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. poolIndex .. ")")
    end
    for index = 0, self._maxcount_ChattingIcon do
      self._list_ChattingIcon[index]:SetIgnore(false)
    end
    ChatUIPool:clear()
  end
  function ChatUIPool:newPanelBG()
    self._count_PanelBG = self._count_PanelBG + 1
    return self._list_PanelBG[self._count_PanelBG - 1]
  end
  function ChatUIPool:newTitleTab()
    self._count_TitleTab = self._count_TitleTab + 1
    return self._list_TitleTab[self._count_TitleTab - 1]
  end
  function ChatUIPool:newTitleTabText()
    self._count_TitleTabText = self._count_TitleTabText + 1
    return self._list_TitleTabText[self._count_TitleTabText - 1]
  end
  function ChatUIPool:newTitleTabConfigButton()
    self._count_TitleTabConfigButton = self._count_TitleTabConfigButton + 1
    return self._list_TitleTabConfigButton[self._count_TitleTabConfigButton - 1]
  end
  function ChatUIPool:newOtherTab()
    self._count_OtherTab = self._count_OtherTab + 1
    return self._list_OtherTab[self._count_OtherTab - 1]
  end
  function ChatUIPool:newAddTab()
    self._count_AddTab = self._count_AddTab + 1
    return self._list_AddTab[self._count_AddTab - 1]
  end
  function ChatUIPool:newPanelDivision()
    self._count_PanelDivision = self._count_PanelDivision + 1
    return self._list_PanelDivision[self._count_PanelDivision - 1]
  end
  function ChatUIPool:newPanelCombine()
    self._count_PanelDelete = self._count_PanelDelete + 1
    return self._list_PanelDelete[self._count_PanelDelete - 1]
  end
  function ChatUIPool:newResizeButton()
    self._count_ResizeButton = self._count_ResizeButton + 1
    return self._list_ResizeButton[self._count_ResizeButton - 1]
  end
  function ChatUIPool:newChattingIcon()
    self._count_ChattingIcon = self._count_ChattingIcon + 1
    return self._list_ChattingIcon[self._count_ChattingIcon - 1]
  end
  function ChatUIPool:getCurrentChattingIconIndex()
    return self._count_ChattingIcon - 1
  end
  function PaGlobal_getChattingIconByIndex(index)
    return ChatUIPool:getChattingIconByIndex(index)
  end
  function ChatUIPool:getChattingIconByIndex(index)
    return self._list_ChattingIcon[index]
  end
  function ChatUIPool:newChattingSender(messageIndex)
    self._count_ChattingSender = self._count_ChattingSender + 1
    self._list_SenderMessageIndex[self._count_ChattingSender - 1] = messageIndex
    return self._list_ChattingSender[self._count_ChattingSender - 1]
  end
  function ChatUIPool:newChattingContents()
    self._count_ChattingContents = self._count_ChattingContents + 1
    return self._list_ChattingContents[self._count_ChattingContents - 1]
  end
  function PaGlobal_getChattingContentsByIndex(index)
    return ChatUIPool._list_ChattingContents[index]
  end
  function ChatUIPool:newChattingLinkedItem(messageIndex)
    self._count_ChattingLinkedItem = self._count_ChattingLinkedItem + 1
    self._list_LinkedItemMessageIndex[self._count_ChattingLinkedItem - 1] = messageIndex
    return self._list_ChattingLinkedItem[self._count_ChattingLinkedItem - 1]
  end
  function ChatUIPool:newChattingLinkedGuild(messageIndex)
    self._count_ChattingLinkedGuild = self._count_ChattingLinkedGuild + 1
    self._list_LinkedGuildMessageIndex[self._count_ChattingLinkedGuild - 1] = messageIndex
    return self._list_ChattingLinkedGuild[self._count_ChattingLinkedGuild - 1]
  end
  function ChatUIPool:newChattingGuildMark()
    self._count_ChattingGuildMark = self._count_ChattingGuildMark + 1
    return self._list_ChattingGuildMark[self._count_ChattingGuildMark - 1]
  end
  function ChatUIPool:getCurrentChattingGuildMarkIndex()
    return self._count_ChattingGuildMark - 1
  end
  function PaGlobal_getChattingGuildMarkByIndex(index)
    return ChatUIPool:getChattingGuildMarkByIndex(index)
  end
  function ChatUIPool:getChattingGuildMarkByIndex(index)
    return self._list_ChattingGuildMark[index]
  end
  function ChatUIPool:newChattingEmoticon()
    self._count_Emoticon = self._count_Emoticon + 1
    return self._list_Emoticon[self._count_Emoticon - 1]
  end
  function ChatUIPool:newChattingLinkedWebSite(messageIndex)
    self._count_ChattingLinkedWebSite = self._count_ChattingLinkedWebSite + 1
    self._list_LinkedWebSiteMessageIndex[self._count_ChattingLinkedWebSite - 1] = messageIndex
    return self._list_ChattingLinkedWebSite[self._count_ChattingLinkedWebSite - 1]
  end
  function ChatUIPool:newChattingAt(messageIndex)
    self._count_At = self._count_At + 1
    self._list_LinkedAtMessageIndex[self._count_At - 1] = messageIndex
    return self._list_At[self._count_At - 1]
  end
  function ChatUIPool:newScroll()
    self._count_Scroll = self._count_Scroll + 1
    return self._list_Scroll[self._count_Scroll - 1]
  end
  function ChatUIPool:newCloseButton()
    self._count_CloseButton = self._count_CloseButton + 1
    return self._list_CloseButton[self._count_CloseButton - 1]
  end
  function ChatUIPool:newScrollReset()
    self._count_ScrollReset = self._count_ScrollReset + 1
    return self._list_ScrollReset[self._count_ScrollReset - 1]
  end
  function ChatUIPool:newMorelist()
    self._count_MoreList = self._count_MoreList + 1
    return self._list_MoreList[self._count_MoreList - 1]
  end
  function ChatUIPool:clearChattingIcon()
    self._count_ChattingIcon = 0
  end
  function ChatUIPool:clearChattingSender(messageIndex)
    self._count_ChattingSender = 0
  end
  function ChatUIPool:clearChattingContents()
    self._count_ChattingContents = 0
  end
  function ChatUIPool:clearChattingLinkedItem(messageIndex)
    self._count_ChattingLinkedItem = 0
  end
  function ChatUIPool:clearChattingLinkedGuild(messageIndex)
    self._count_ChattingLinkedGuild = 0
  end
  function ChatUIPool:clearChattingGuildMark()
    self._count_ChattingGuildMark = 0
  end
  function ChatUIPool:clearChattingLinkedwebsite(messageIndex)
    self._count_ChattingLinkedWebSite = 0
  end
  function ChatUIPool:clearEmoticon()
    self._count_Emoticon = 0
  end
  function ChatUIPool:clearAt()
    self._count_At = 0
  end
  function ChatUIPool:clear()
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
    self._count_ChattingLinkedGuild = 0
    self._count_ChattingGuildMark = 0
    self._count_ChattingLinkedWebSite = 0
    self._count_Scroll = 0
    self._count_CloseButton = 0
    self._count_ScrollReset = 0
    self._count_MoreList = 0
    self._count_Emoticon = 0
    self._count_At = 0
    self._list_SenderMessageIndex = {}
    self._list_LinkedItemMessageIndex = {}
    self._list_LinkedGuildMessageIndex = {}
    self._list_LinkedWebSiteMessageIndex = {}
    self._list_LinkedAtMessageIndex = {}
    self._list_LinkedAtIndex = {}
    ChatUIPool:hideNotUse()
  end
  function ChatUIPool:drawclear()
    self.clearChattingIcon()
    self.clearChattingContents()
    self.clearChattingSender()
    self.clearChattingLinkedItem()
    self.clearChattingLinkedGuild()
    self.clearChattingGuildMark()
    self.clearChattingLinkedwebsite()
    self.clearEmoticon()
    self.clearAt()
  end
  function ChatUIPool:hideNotUse()
    for index = self._count_PanelBG, self._maxcount_PanelBG do
      self._list_PanelBG[index]:SetShow(false)
    end
    for index = self._count_TitleTab, self._maxcount_TitleTab do
      self._list_TitleTab[index]:SetShow(false)
    end
    for index = self._count_TitleTabText, self._maxcount_TitleTabText do
      self._list_TitleTabText[index]:SetShow(false)
    end
    for index = self._count_TitleTabConfigButton, self._maxcount_TitleTabConfigButton do
      self._list_TitleTabConfigButton[index]:SetShow(false)
    end
    for index = self._count_OtherTab, self._maxcount_OtherTab do
      self._list_OtherTab[index]:SetShow(false)
    end
    for index = self._count_AddTab, self._maxcount_AddTab do
      self._list_AddTab[index]:SetShow(false)
    end
    for index = self._count_PanelDivision, self._maxcount_PanelDivision do
      self._list_PanelDivision[index]:SetShow(false)
    end
    for index = self._count_PanelDelete, self._maxcount_PanelDelete do
      self._list_PanelDelete[index]:SetShow(false)
    end
    for index = self._count_ResizeButton + 1, self._maxcount_ResizeButton do
      self._list_ResizeButton[index]:SetShow(false)
    end
    for index = self._count_ChattingIcon, self._maxcount_ChattingIcon do
      self._list_ChattingIcon[index]:SetShow(false)
    end
    for index = self._count_ChattingSender, self._maxcount_ChattingSender do
      self._list_ChattingSender[index]:SetShow(false)
    end
    for index = self._count_ChattingContents, self._maxcount_ChattingContents do
      self._list_ChattingContents[index]:SetShow(false)
    end
    for index = self._count_ChattingLinkedItem, self._maxcount_ChattingLinkedItem do
      self._list_ChattingLinkedItem[index]:SetShow(false)
    end
    for index = self._count_ChattingLinkedGuild, self._maxcount_ChattingLinkedGuild do
      self._list_ChattingLinkedGuild[index]:SetShow(false)
    end
    for index = self._count_ChattingGuildMark, self._maxcount_ChattingGuildMark do
      self._list_ChattingGuildMark[index]:SetShow(false)
    end
    for index = self._count_ChattingLinkedWebSite, self._maxcount_ChattingLinkedWebSite do
      self._list_ChattingLinkedWebSite[index]:SetShow(false)
    end
    for index = self._count_Scroll, self._maxcount_Scroll do
      self._list_Scroll[index]:SetShow(false)
    end
    for index = self._count_CloseButton, self._maxcount_CloseButton do
      self._list_CloseButton[index]:SetShow(false)
    end
    for index = self._count_ScrollReset, self._maxcount_ScrollReset do
      self._list_ScrollReset[index]:SetShow(false)
    end
    for index = self._count_MoreList, self._maxcount_MoreList do
      self._list_MoreList[index]:SetShow(false)
    end
    for index = self._count_Emoticon, self._maxcount_Emoticon do
      self._list_Emoticon[index]:SetShow(false)
    end
    for index = self._count_At, self._maxcount_At do
      self._list_At[index]:SetShow(false)
    end
  end
  ChatUIPool:initialize(poolStylePanel, poolParentPanel, poolIndex)
  return ChatUIPool
end
local ChattingViewManager = {
  _mainPanelSelectPanelIndex = 0,
  _maxHistoryCount = ToClient_getChattingMaxContentsCount() - 50,
  _cacheSimpleUI = false,
  _addChattingIdx = nil,
  _addChattingPreset = false,
  _srollPosition = {
    [0] = 0,
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0
  },
  _transparency = {
    [0] = 0.5,
    [1] = 0.5,
    [2] = 0.5,
    [3] = 0.5,
    [4] = 0.5
  },
  _scroll_BTNPos = {
    [0] = 1,
    [1] = 1,
    [2] = 1,
    [3] = 1,
    [4] = 1
  },
  _linkedItemTooltipIsClicked = false
}
function Chatting_Transparency(index)
  if -1 == index then
    if nil == currentPanelIndex then
      return
    end
    index = currentPanelIndex
  end
  Chatting_PanelTransparency(index, false)
end
function ChatUIPoolManager:initialize()
  local divisionPanel, panel, panelSizeX, panelSizeY, chatUI
  for poolIndex = 0, self._poolCount - 1 do
    self._listPanel[poolIndex] = self:createPanel(poolIndex, Panel_Chat)
    self._listChatUIPool[poolIndex] = self:createPool(poolIndex, Panel_Chat, self._listPanel[poolIndex])
    divisionPanel = ToClient_getChattingPanel(poolIndex)
    panel = self._listPanel[poolIndex]
    chatUI = self._listChatUIPool[poolIndex]
    if 0 < divisionPanel:getPanelSizeX() then
      panelSizeX = divisionPanel:getPanelSizeX()
      panelSizeY = divisionPanel:getPanelSizeY()
      panel:SetSize(panelSizeX, panelSizeY)
      chatUI._list_PanelBG[0]:SetSize(panelSizeX, panelSizeY)
      chatUI._list_Scroll[0]:SetSize(chatUI._list_Scroll[0]:GetSizeX(), panelSizeY - 67)
      for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
        chatUI._list_ChattingContents[chattingContents_idx]:SetSize(panelSizeX - 25, chatUI._list_ChattingContents[chattingContents_idx]:GetSizeY())
      end
      chatUI._list_ResizeButton[0]:SetPosX(panelSizeX - (chatUI._list_ResizeButton[0]:GetSizeX() + 5))
      chatUI._list_Scroll[0]:SetPosX(panelSizeX - (chatUI._list_Scroll[0]:GetSizeX() + 5))
      chatUI._list_Scroll[0]:SetControlBottom()
    else
      panelSizeX = ChatUIPoolManager._defaultPanelSizeX
      panelSizeY = ChatUIPoolManager._defaultPanelSizeY
      panel:SetSize(panelSizeX, panelSizeY)
      chatUI._list_PanelBG[0]:SetSize(panelSizeX, panelSizeY)
      chatUI._list_Scroll[0]:SetSize(chatUI._list_Scroll[0]:GetSizeX(), panelSizeY - 67)
      for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
        chatUI._list_ChattingContents[chattingContents_idx]:SetSize(panelSizeX - 25, chatUI._list_ChattingContents[chattingContents_idx]:GetSizeY())
      end
      chatUI._list_ResizeButton[0]:SetPosX(panelSizeX - (chatUI._list_ResizeButton[0]:GetSizeX() + 5))
      chatUI._list_Scroll[0]:SetPosX(panelSizeX - (chatUI._list_Scroll[0]:GetSizeX() + 5))
      chatUI._list_Scroll[0]:SetControlBottom()
    end
    if 0 > divisionPanel:getPositionX() and 0 > divisionPanel:getPositionY() then
      panel:SetPosX(0)
      panel:SetPosY(getScreenSizeY() - panel:GetSizeY() - 35)
    else
      panel:SetPosX(divisionPanel:getPositionX())
      panel:SetPosY(divisionPanel:getPositionY())
    end
    ChattingViewManager._transparency[poolIndex] = divisionPanel:getTransparency()
    FGlobal_PanelMove(panel, true)
  end
end
function ChatUIPoolManager:getPool(poolIndex)
  return self._listChatUIPool[poolIndex]
end
function ChatUIPoolManager:getPanel(poolIndex)
  return self._listPanel[poolIndex]
end
function ChatUIPoolManager:getPopupNameMenu(poolIndex)
  return self._listPopupNameMenu[poolIndex]
end
ChatUIPoolManager:initialize()
local _tabButton_PosX = 0
local addChat_PosX = 0
function ChattingViewManager:update(chatPanel, panelIndex, isShow)
  if nil == getSelfPlayer() or nil == getSelfPlayer():get() then
    return
  end
  if false == CheckTutorialEnd() and true == PaGlobal_TutorialManager:isDoingTutorial() then
    return
  end
  local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
  local drawPanelIndex = panelIndex
  local bgAlpah = self._transparency[drawPanelIndex]
  if true == isCombinedMainPanel then
    drawPanelIndex = 0
  end
  local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
  local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
  self._currentPoolIndex = drawPanelIndex
  local IsMouseOver = UI.checkIsInMouseAndEventPanel(currentPanel)
  if nil == isShow then
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
    if 0 ~= panelIndex then
      ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
      ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
    end
    if false == isActivePanel then
      return
    end
  elseif false == isCombinedMainPanel and true == chatPanel:isOpen() then
    if ChatUIPoolManager:getPanel(0):GetShow() then
      ChatUIPoolManager:getPanel(panelIndex):SetShow(true)
      ChatUIPoolManager:getPanel(panelIndex):SetIgnore(false)
    end
  elseif false == isCombinedMainPanel and false == chatPanel:isOpen() then
    ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
    ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
  end
  if false == CheckTutorialEnd() then
    for ii = 1, ChatUIPoolManager._poolCount - 1 do
      ChatUIPoolManager:getPanel(ii):SetShow(false)
    end
  end
  local panel_resizeButton = poolCurrentUI:newResizeButton()
  panel_resizeButton:SetNotAbleMasking(true)
  panel_resizeButton:SetShow(isShow)
  panel_resizeButton:addInputEvent("Mouse_On", "HandleOn_ChattingAddTabToolTip(true, " .. drawPanelIndex .. ", 3)")
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
  panel_Scroll:SetControlPos(self._scroll_BTNPos[panelIndex])
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
  if isChangeFontSize() == true then
    local fontType = chatPanel:getChatFontSizeType()
    ToClient_getFontWrapper("BaseFont_10_Chat"):changeFontSize(ChattingOption_convertChatFontTypeToFontSize(fontType))
    ChatPanel_Update()
  end
  if true == isResetsmoothscroll or true == issmoothWheelscroll or true == issmoothscroll then
    return
  end
  local addMessageCount = 0
  if false == ismsgin and true == isUsedSmoothChattingUp then
    if chatPanel:getPushchattingMsg() and false == issmoothupMessage then
      if 0 < chatPanel:getMessageCount() - premsgCount[panelIndex] and chatPanel:getMessageCount() - premsgCount[panelIndex] < 5 then
        if 0 == chatPanel:getPopMessageCount() then
          issmoothupMessage = true
          chattingUpTime = 0
          ismsgin = true
        else
          if chatPanel:getPopMessageCount() < prepopmsgCount[panelIndex] then
            prepopmsgCount[panelIndex] = 0
          end
          if 5 > chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex] then
            issmoothupMessage = true
            chattingUpTime = 0
            ismsgin = true
          end
        end
      end
      if false == issmoothupMessage then
        if 0 == chatPanel:getPopMessageCount() then
          addMessageCount = chatPanel:getMessageCount() - premsgCount[panelIndex]
          premsgCount[panelIndex] = chatPanel:getMessageCount()
        else
          if chatPanel:getPopMessageCount() < prepopmsgCount[panelIndex] then
            prepopmsgCount[panelIndex] = 0
          end
          if ToClient_getChattingMaxContentsCount() == premsgCount[panelIndex] then
            addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex]
          else
            addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex] + ToClient_getChattingMaxContentsCount() - premsgCount[panelIndex]
            premsgCount[panelIndex] = ToClient_getChattingMaxContentsCount()
          end
          prepopmsgCount[panelIndex] = chatPanel:getPopMessageCount()
        end
      end
    end
  elseif false == isUsedSmoothChattingUp then
    if 0 == chatPanel:getPopMessageCount() then
      addMessageCount = chatPanel:getMessageCount() - premsgCount[panelIndex]
      premsgCount[panelIndex] = chatPanel:getMessageCount()
    else
      if chatPanel:getPopMessageCount() < prepopmsgCount[panelIndex] then
        prepopmsgCount[panelIndex] = 0
      end
      if ToClient_getChattingMaxContentsCount() == premsgCount[panelIndex] then
        addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex]
      else
        addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex] + ToClient_getChattingMaxContentsCount() - premsgCount[panelIndex]
        premsgCount[panelIndex] = ToClient_getChattingMaxContentsCount()
      end
      prepopmsgCount[panelIndex] = chatPanel:getPopMessageCount()
    end
  end
  if true == issmoothupMessage then
    if isCombinedMainPanel then
      local count = ToClient_getChattingPanelCount()
      for combinepanelIndex = 0, count - 1 do
        local checkchatPanel = ToClient_getChattingPanel(combinepanelIndex)
        local checkCombined = checkchatPanel:isCombinedToMainPanel()
        if checkCombined then
          if 0 == checkchatPanel:getPopMessageCount() then
            addMessageCount = checkchatPanel:getMessageCount() - premsgCount[combinepanelIndex]
            premsgCount[combinepanelIndex] = checkchatPanel:getMessageCount()
          else
            if checkchatPanel:getPopMessageCount() < prepopmsgCount[combinepanelIndex] then
              prepopmsgCount[combinepanelIndex] = 0
            end
            if ToClient_getChattingMaxContentsCount() == premsgCount[combinepanelIndex] then
              addMessageCount = checkchatPanel:getPopMessageCount() - prepopmsgCount[combinepanelIndex]
            else
              addMessageCount = checkchatPanel:getPopMessageCount() - prepopmsgCount[combinepanelIndex] + ToClient_getChattingMaxContentsCount() - premsgCount[combinepanelIndex]
              premsgCount[combinepanelIndex] = ToClient_getChattingMaxContentsCount()
            end
            prepopmsgCount[combinepanelIndex] = checkchatPanel:getPopMessageCount()
          end
          if checkchatPanel:isChattingPanelFreeze() and checkchatPanel:isFreezingMsgUpdatedValue() then
            self._srollPosition[combinepanelIndex] = _scroll_Interval_AddPos[combinepanelIndex] + addMessageCount
            _scroll_Interval_AddPos[combinepanelIndex] = self._srollPosition[combinepanelIndex]
          end
          checkchatPanel:setFreezingMsgUpdated(false)
        end
      end
    else
      if 0 == chatPanel:getPopMessageCount() then
        addMessageCount = chatPanel:getMessageCount() - premsgCount[panelIndex]
        premsgCount[panelIndex] = chatPanel:getMessageCount()
      else
        if chatPanel:getPopMessageCount() < prepopmsgCount[panelIndex] then
          prepopmsgCount[panelIndex] = 0
        end
        if ToClient_getChattingMaxContentsCount() == premsgCount[panelIndex] then
          addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex]
        else
          addMessageCount = chatPanel:getPopMessageCount() - prepopmsgCount[panelIndex] + ToClient_getChattingMaxContentsCount() - premsgCount[panelIndex]
          premsgCount[panelIndex] = ToClient_getChattingMaxContentsCount()
        end
        prepopmsgCount[panelIndex] = chatPanel:getPopMessageCount()
      end
      if chatPanel:isChattingPanelFreeze() and chatPanel:isFreezingMsgUpdatedValue() then
        self._srollPosition[panelIndex] = _scroll_Interval_AddPos[panelIndex] + addMessageCount
        _scroll_Interval_AddPos[panelIndex] = self._srollPosition[panelIndex]
      end
      chatPanel:setFreezingMsgUpdated(false)
    end
    return
  end
  local messageIndex = self._srollPosition[panelIndex]
  local chattingMessage = chatPanel:beginMessage(messageIndex)
  local chatting_content_PosY = currentPanel:GetSizeY() - 10
  poolCurrentUI:drawclear()
  while nil ~= chattingMessage do
    chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
    if chatting_content_PosY < 45 then
      break
    else
      chattingMessage = chatPanel:nextMessage()
      messageIndex = messageIndex + 1
    end
  end
  if chatPanel:isChattingPanelFreeze() and chatPanel:isFreezingMsgUpdatedValue() then
    self._srollPosition[panelIndex] = _scroll_Interval_AddPos[panelIndex] + addMessageCount
    _scroll_Interval_AddPos[panelIndex] = self._srollPosition[panelIndex]
  end
  chatPanel:setFreezingMsgUpdated(false)
end
function ChattingViewManager_UpdatePerFrame(deltaTime)
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
  elseif issmoothupMessage then
    chattingUpTime = chattingUpTime + deltaTime
    if chattingUpTime > 0.2 then
      issmoothupMessage = false
    end
    ChattingViewManager:UpdateSmoothChattingContent(chattingUpTime)
  end
end
function ChattingViewManager:UpdateSmoothChattingContent(chattingUpTime)
  FromClient_ChatUpdate(true)
  local count = ToClient_getChattingPanelCount()
  local checkchattingupTime = 0
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local addMessageCount = 0
      if false == chatPanel:getPushchattingMsg() or true == chatPanel:isChattingPanelFreeze() then
        checkchattingupTime = 0
      else
        checkchattingupTime = chattingUpTime
      end
      local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
      local drawPanelIndex = panelIndex
      local bgAlpah = self._transparency[drawPanelIndex]
      if true == isCombinedMainPanel then
        drawPanelIndex = 0
      end
      local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
      local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
      self._currentPoolIndex = drawPanelIndex
      local IsMouseOver = UI.checkIsInMouseAndEventPanel(currentPanel)
      if nil == isShow then
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
      local messageIndex = self._srollPosition[panelIndex]
      local chattingMessage = chatPanel:beginMessage(messageIndex)
      local chatting_content_PosY = currentPanel:GetSizeY() - 10
      if isCombinedMainPanel then
        if 0 ~= panelIndex then
          ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
          ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
        end
      elseif false == isCombinedMainPanel and true == chatPanel:isOpen() then
        if ChatUIPoolManager:getPanel(0):GetShow() then
          ChatUIPoolManager:getPanel(panelIndex):SetShow(true)
          ChatUIPoolManager:getPanel(panelIndex):SetIgnore(false)
        end
      elseif false == isCombinedMainPanel and false == chatPanel:isOpen() then
        ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
        ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
      end
      if false == CheckTutorialEnd() then
        for ii = 1, ChatUIPoolManager._poolCount - 1 do
          ChatUIPoolManager:getPanel(ii):SetShow(false)
        end
      end
      if false == isCombinedMainPanel then
        if false == issmoothupMessage then
          poolCurrentUI:drawclear()
          while true do
            if nil ~= chattingMessage then
              chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              if chatting_content_PosY < 45 then
                break
              end
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              else
                if 0 ~= messageIndex then
                  poolCurrentUI:drawclear()
                  while true do
                    if nil ~= chattingMessage then
                      chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
                      if chatting_content_PosY < 45 then
                        break
                      end
                      chattingMessage = chatPanel:nextMessage()
                      messageIndex = messageIndex + 1
                      else
                        poolCurrentUI:drawclear()
                        deltascrollPosy[panelIndex] = 0
                        while true do
                          if nil ~= chattingMessage then
                            chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, checkchattingupTime)
                            if chatting_content_PosY < 45 then
                              break
                            end
                            chattingMessage = chatPanel:nextMessage()
                            messageIndex = messageIndex + 1
                            elseif isActivePanel then
                              if false == issmoothupMessage then
                                poolCurrentUI:drawclear()
                                while true do
                                  if nil ~= chattingMessage then
                                    chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
                                    if chatting_content_PosY < 45 then
                                      break
                                    end
                                    chattingMessage = chatPanel:nextMessage()
                                    messageIndex = messageIndex + 1
                                    else
                                      if 0 ~= messageIndex then
                                        poolCurrentUI:drawclear()
                                        while true do
                                          if nil ~= chattingMessage then
                                            chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
                                            if chatting_content_PosY < 45 then
                                              break
                                            end
                                            chattingMessage = chatPanel:nextMessage()
                                            messageIndex = messageIndex + 1
                                            else
                                              poolCurrentUI:drawclear()
                                              deltascrollPosy[panelIndex] = 0
                                              while nil ~= chattingMessage do
                                                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, checkchattingupTime)
                                                if chatting_content_PosY < 45 then
                                                  break
                                                else
                                                  chattingMessage = chatPanel:nextMessage()
                                                  messageIndex = messageIndex + 1
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
  if chattingUpTime > 0.2 and false == issmoothupMessage then
    ismsgin = false
    for panelIndex = 0, count - 1 do
      local chatPanel = ToClient_getChattingPanel(panelIndex)
      chatPanel:setPushchattingMsg(false)
    end
  end
end
function ChattingViewManager:UpdateSmoothScrollContent()
  local count = ToClient_getChattingPanelCount()
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
      local drawPanelIndex = panelIndex
      local bgAlpah = self._transparency[drawPanelIndex]
      if true == isCombinedMainPanel then
        drawPanelIndex = 0
      end
      local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
      local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
      self._currentPoolIndex = drawPanelIndex
      local IsMouseOver = UI.checkIsInMouseAndEventPanel(currentPanel)
      if nil == isShow then
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
      local messageIndex = self._srollPosition[panelIndex]
      local chattingMessage = chatPanel:beginMessage(messageIndex)
      local chatting_content_PosY = currentPanel:GetSizeY() - 10
      if isCombinedMainPanel then
        if 0 ~= panelIndex then
          ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
          ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
        end
      elseif false == isCombinedMainPanel and true == chatPanel:isOpen() then
        if ChatUIPoolManager:getPanel(0):GetShow() then
          ChatUIPoolManager:getPanel(panelIndex):SetShow(true)
          ChatUIPoolManager:getPanel(panelIndex):SetIgnore(false)
        end
      elseif false == isCombinedMainPanel and false == chatPanel:isOpen() then
        ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
        ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
      end
      if false == CheckTutorialEnd() then
        for ii = 1, ChatUIPoolManager._poolCount - 1 do
          ChatUIPoolManager:getPanel(ii):SetShow(false)
        end
      end
      if false == isCombinedMainPanel then
        local messageIndex = self._srollPosition[panelIndex]
        local chattingMessage = chatPanel:beginMessage(messageIndex)
        local chatting_content_PosY = currentPanel:GetSizeY() - 10
        poolCurrentUI:drawclear()
        while true do
          if nil ~= chattingMessage then
            chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
            if chatting_content_PosY < 45 then
              break
            end
            chattingMessage = chatPanel:nextMessage()
            messageIndex = messageIndex + 1
            elseif isActivePanel then
              local messageIndex = self._srollPosition[panelIndex]
              local chattingMessage = chatPanel:beginMessage(messageIndex)
              local chatting_content_PosY = currentPanel:GetSizeY() - 10
              poolCurrentUI:drawclear()
              while nil ~= chattingMessage do
                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
                if chatting_content_PosY < 45 then
                  break
                else
                  chattingMessage = chatPanel:nextMessage()
                  messageIndex = messageIndex + 1
                end
              end
            end
          end
        end
    end
  end
end
function ChattingViewManager:UpdateSmoothResetScrollContent(chattingScrollingTime)
  local count = ToClient_getChattingPanelCount()
  FromClient_ChatUpdate(true)
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local isDraw = true
      local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
      local drawPanelIndex = panelIndex
      local bgAlpah = self._transparency[drawPanelIndex]
      if true == isCombinedMainPanel then
        drawPanelIndex = 0
      end
      local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
      local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
      self._currentPoolIndex = drawPanelIndex
      local IsMouseOver = UI.checkIsInMouseAndEventPanel(currentPanel)
      if nil == isShow then
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
        if 0 ~= panelIndex then
          ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
          ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
        end
        if false == isActivePanel then
        end
      elseif false == isCombinedMainPanel and true == chatPanel:isOpen() then
        if ChatUIPoolManager:getPanel(0):GetShow() then
          ChatUIPoolManager:getPanel(panelIndex):SetShow(true)
          ChatUIPoolManager:getPanel(panelIndex):SetIgnore(false)
        end
      elseif false == isCombinedMainPanel and false == chatPanel:isOpen() then
        ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
        ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
      end
      if false == CheckTutorialEnd() then
        for ii = 1, ChatUIPoolManager._poolCount - 1 do
          ChatUIPoolManager:getPanel(ii):SetShow(false)
        end
      end
      if false == isCombinedMainPanel then
        local messageIndex = self._srollPosition[panelIndex]
        local downIndex = 0
        local currdownPosY = 0
        local downPosY = 0
        if scrollIndex == panelIndex then
          ChattingPoolUpdate(poolCurrentUI, currentPanel, panelIndex, drawPanelIndex)
          if scrollresetSpeed < 5 then
            scrollresetSpeed = scrollresetSpeed + 2
          end
          currdownPosY = PaGlobal_AnimationEasingFun_easeOutQuadFragments(chattingScrollingTime, scrollresetSpeed * 0.9)
          downPosY = math.abs(currdownPosY - preDownPosY)
          if downPosY > 1 then
            preDownPosY = currdownPosY
          end
          downIndex = math.floor(downPosY)
          deltascrollPosy[panelIndex] = -(downPosY - downIndex)
          if false == isResetsmoothscroll then
            smoothResetScorllTime = 0
            preDownPosY = 0
            deltascrollPosy[scrollIndex] = 0
            self._srollPosition[panelIndex] = 0
            ChattingViewManager._scroll_BTNPos[panelIndex] = 1
            Scroll_IntervalAddPosCalc(panelIndex)
            FromClient_ChatUpdate(true)
            break
          end
          self._srollPosition[panelIndex] = self._srollPosition[panelIndex] - downIndex
          if 0 >= self._srollPosition[panelIndex] then
            smoothResetScorllTime = 0
            preDownPosY = 0
            deltascrollPosy[panelIndex] = 0
            self._srollPosition[panelIndex] = 0
            ChattingViewManager._scroll_BTNPos[panelIndex] = 1
            Scroll_IntervalAddPosCalc(panelIndex)
            isResetsmoothscroll = false
            FromClient_ChatUpdate(true)
            break
          end
          poolCurrentUI._list_Scroll[0]:SetControlPos(1 - self._srollPosition[panelIndex] / (self._maxHistoryCount - 1))
          Scroll_IntervalAddPosCalc(panelIndex)
          messageIndex = self._srollPosition[panelIndex]
        end
        local chattingMessage = chatPanel:beginMessage(messageIndex)
        local chatting_content_PosY = currentPanel:GetSizeY() - 10
        if isDraw then
          poolCurrentUI:drawclear()
          while true do
            if nil ~= chattingMessage then
              chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              if chatting_content_PosY < 38 then
                break
              end
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              elseif isActivePanel then
                local messageIndex = self._srollPosition[panelIndex]
                local downIndex = 0
                local currdownPosY = 0
                local downPosY = 0
                if scrollIndex == panelIndex then
                  ChattingPoolUpdate(poolCurrentUI, currentPanel, panelIndex, drawPanelIndex)
                  if scrollresetSpeed < 5 then
                    scrollresetSpeed = scrollresetSpeed + 2
                  end
                  currdownPosY = PaGlobal_AnimationEasingFun_easeOutQuadFragments(chattingScrollingTime, scrollresetSpeed * 0.9)
                  downPosY = math.abs(currdownPosY - preDownPosY)
                  if downPosY > 1 then
                    preDownPosY = currdownPosY
                  end
                  downIndex = math.floor(downPosY)
                  deltascrollPosy[scrollIndex] = -(downPosY - downIndex)
                  if false == isResetsmoothscroll then
                    smoothResetScorllTime = 0
                    preDownPosY = 0
                    deltascrollPosy[panelIndex] = 0
                    self._srollPosition[scrollIndex] = 0
                    ChattingViewManager._scroll_BTNPos[scrollIndex] = 1
                    Scroll_IntervalAddPosCalc(scrollIndex)
                    FromClient_ChatUpdate(true)
                    break
                  end
                  self._srollPosition[scrollIndex] = self._srollPosition[scrollIndex] - downIndex
                  if 0 >= self._srollPosition[scrollIndex] then
                    smoothResetScorllTime = 0
                    preDownPosY = 0
                    deltascrollPosy[panelIndex] = 0
                    self._srollPosition[scrollIndex] = 0
                    ChattingViewManager._scroll_BTNPos[scrollIndex] = 1
                    Scroll_IntervalAddPosCalc(scrollIndex)
                    isResetsmoothscroll = false
                    FromClient_ChatUpdate(true)
                    break
                  end
                  poolCurrentUI._list_Scroll[0]:SetControlPos(1 - self._srollPosition[panelIndex] / (self._maxHistoryCount - 1))
                  Scroll_IntervalAddPosCalc(scrollIndex)
                  messageIndex = self._srollPosition[scrollIndex]
                end
                local chattingMessage = chatPanel:beginMessage(messageIndex)
                local chatting_content_PosY = currentPanel:GetSizeY() - 10
                if isDraw then
                  poolCurrentUI:drawclear()
                  while nil ~= chattingMessage do
                    chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
                    if chatting_content_PosY < 38 then
                      break
                    else
                      chattingMessage = chatPanel:nextMessage()
                      messageIndex = messageIndex + 1
                    end
                  end
                end
              end
            end
          end
        end
    end
  end
  if false == isResetsmoothscroll then
    _tabButton_PosX = 0
    for panelIndex = 0, count - 1 do
      local chatPanel = ToClient_getChattingPanel(panelIndex)
      if chatPanel:isOpen() then
        ChatUIPoolManager:getPool(panelIndex):clear()
        ChattingViewManager:update(chatPanel, panelIndex)
      end
    end
  end
end
function ChattingViewManager:UpdateSmoothWheelScrollContent(wheelScrollingTime)
  local count = ToClient_getChattingPanelCount()
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local isCombinedMainPanel = chatPanel:isCombinedToMainPanel()
      local drawPanelIndex = panelIndex
      local bgAlpah = self._transparency[drawPanelIndex]
      if true == isCombinedMainPanel then
        drawPanelIndex = 0
      end
      local currentPanel = ChatUIPoolManager:getPanel(drawPanelIndex)
      local poolCurrentUI = ChatUIPoolManager:getPool(drawPanelIndex)
      self._currentPoolIndex = drawPanelIndex
      local IsMouseOver = UI.checkIsInMouseAndEventPanel(currentPanel)
      if nil == isShow then
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
        if 0 ~= panelIndex then
          ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
          ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
        end
        if false == isActivePanel then
        end
      elseif false == isCombinedMainPanel and true == chatPanel:isOpen() then
        if ChatUIPoolManager:getPanel(0):GetShow() then
          ChatUIPoolManager:getPanel(panelIndex):SetShow(true)
          ChatUIPoolManager:getPanel(panelIndex):SetIgnore(false)
        end
      elseif false == isCombinedMainPanel and false == chatPanel:isOpen() then
        ChatUIPoolManager:getPanel(panelIndex):SetShow(false)
        ChatUIPoolManager:getPanel(panelIndex):SetIgnore(true)
      end
      if false == CheckTutorialEnd() then
        for ii = 1, ChatUIPoolManager._poolCount - 1 do
          ChatUIPoolManager:getPanel(ii):SetShow(false)
        end
      end
      if false == isCombinedMainPanel then
        if scrollIndex == panelIndex and issmoothWheelscroll then
          local poolScrollUI = ChatUIPoolManager:getPool(scrollIndex)
          if isUpDown then
            poolScrollUI._list_Scroll[0]:SetControlPos(poolScrollUI._list_Scroll[0]:GetControlPos() - 1 / (ChattingViewManager._maxHistoryCount - 1) * wheelScrollingTime * 11.3)
          else
            poolScrollUI._list_Scroll[0]:SetControlPos(poolScrollUI._list_Scroll[0]:GetControlPos() + 1 / (ChattingViewManager._maxHistoryCount - 1) * wheelScrollingTime * 11.3)
          end
          if 1 < poolScrollUI._list_Scroll[0]:GetControlPos() then
            poolScrollUI._list_Scroll[0]:SetControlPos(1)
          end
          if 0 > poolScrollUI._list_Scroll[0]:GetControlPos() then
            poolScrollUI._list_Scroll[0]:SetControlPos(0)
          end
          local index = math.floor((1 - poolScrollUI._list_Scroll[0]:GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1))
          if 0 == index then
            deltascrollPosy[panelIndex] = (1 - poolScrollUI._list_Scroll[0]:GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) % 1
          else
            deltascrollPosy[panelIndex] = ((1 - poolScrollUI._list_Scroll[0]:GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) - index) % 1
          end
          preScrollControlPos[panelIndex] = poolScrollUI._list_Scroll[0]:GetControlPos()
          ChattingViewManager._srollPosition[panelIndex] = index
          ChattingViewManager._scroll_BTNPos[panelIndex] = poolScrollUI._list_Scroll[0]:GetControlPos()
          Scroll_IntervalAddPosCalc(panelIndex)
          local messageIndex = self._srollPosition[panelIndex]
          local chattingMessage = chatPanel:beginMessage(messageIndex)
          local chatting_content_PosY = currentPanel:GetSizeY() - 10
          poolCurrentUI:drawclear()
          while true do
            if nil ~= chattingMessage then
              chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
              if chatting_content_PosY < 45 then
                break
              end
              chattingMessage = chatPanel:nextMessage()
              messageIndex = messageIndex + 1
              else
                local messageIndex = self._srollPosition[drawPanelIndex]
                local chattingMessage = chatPanel:beginMessage(messageIndex)
                local chatting_content_PosY = currentPanel:GetSizeY() - 10
                poolCurrentUI:drawclear()
                while true do
                  if nil ~= chattingMessage then
                    chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, drawPanelIndex, deltascrollPosy[drawPanelIndex], self._cacheSimpleUI, 0)
                    if chatting_content_PosY < 45 then
                      break
                    end
                    chattingMessage = chatPanel:nextMessage()
                    messageIndex = messageIndex + 1
                    elseif isActivePanel then
                      if scrollIndex == panelIndex and issmoothWheelscroll then
                        local poolScrollUI = ChatUIPoolManager:getPool(drawPanelIndex)
                        if isUpDown then
                          poolScrollUI._list_Scroll[0]:SetControlPos(poolScrollUI._list_Scroll[0]:GetControlPos() - 1 / (ChattingViewManager._maxHistoryCount - 1) * wheelScrollingTime * 11.3)
                        else
                          poolScrollUI._list_Scroll[0]:SetControlPos(poolScrollUI._list_Scroll[0]:GetControlPos() + 1 / (ChattingViewManager._maxHistoryCount - 1) * wheelScrollingTime * 11.3)
                        end
                        if 1 < poolScrollUI._list_Scroll[0]:GetControlPos() then
                          poolScrollUI._list_Scroll[0]:SetControlPos(1)
                        end
                        if 0 > poolScrollUI._list_Scroll[0]:GetControlPos() then
                          poolScrollUI._list_Scroll[0]:SetControlPos(0)
                        end
                        local index = math.floor((1 - poolScrollUI._list_Scroll[0]:GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1))
                        if 0 == index then
                          deltascrollPosy[panelIndex] = (1 - poolScrollUI._list_Scroll[0]:GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) % 1
                        else
                          deltascrollPosy[panelIndex] = ((1 - poolScrollUI._list_Scroll[0]:GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) - index) % 1
                        end
                        preScrollControlPos[panelIndex] = poolScrollUI._list_Scroll[0]:GetControlPos()
                        ChattingViewManager._srollPosition[panelIndex] = index
                        ChattingViewManager._scroll_BTNPos[panelIndex] = poolScrollUI._list_Scroll[0]:GetControlPos()
                        Scroll_IntervalAddPosCalc(panelIndex)
                        local messageIndex = self._srollPosition[panelIndex]
                        local chattingMessage = chatPanel:beginMessage(messageIndex)
                        local chatting_content_PosY = currentPanel:GetSizeY() - 10
                        poolCurrentUI:drawclear()
                        while true do
                          if nil ~= chattingMessage then
                            chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
                            if chatting_content_PosY < 45 then
                              break
                            end
                            chattingMessage = chatPanel:nextMessage()
                            messageIndex = messageIndex + 1
                            else
                              local messageIndex = self._srollPosition[panelIndex]
                              local chattingMessage = chatPanel:beginMessage(messageIndex)
                              local chatting_content_PosY = currentPanel:GetSizeY() - 10
                              poolCurrentUI:drawclear()
                              while nil ~= chattingMessage do
                                chatting_content_PosY = Chatnew_CreateChattingContent(chattingMessage, poolCurrentUI, chatting_content_PosY, messageIndex, panelIndex, deltascrollPosy[panelIndex], self._cacheSimpleUI, 0)
                                if chatting_content_PosY < 45 then
                                  break
                                else
                                  chattingMessage = chatPanel:nextMessage()
                                  messageIndex = messageIndex + 1
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
function ChattingViewManager:createTab(poolCurrentUI, panelIndex, isActivePanel, drawPanelIndex, isCombinedMainPanel, PosX, isShow)
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
      settingButton:addInputEvent("Mouse_On", "HandleOn_ChattingAddTabToolTip(true, " .. drawPanelIndex .. ", 2)")
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
      if 0 ~= panelIndex then
        local divisionButton = poolCurrentUI:newPanelDivision()
        divisionButton:SetShow(isShow)
        divisionButton:SetNotAbleMasking(true)
        divisionButton:SetPosX(PosX + mainTab:GetSizeX() - divisionButton:GetSizeX() * 2 - 5)
        divisionButton:addInputEvent("Mouse_On", "HandleOn_ChattingAddTabToolTip(true, " .. drawPanelIndex .. ", 1)")
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
      local isBottom = 0 == ChattingViewManager._srollPosition[panelIndex]
      local scrollResetBtn = poolCurrentUI:newScrollReset()
      scrollResetBtn:SetShow(not isBottom)
      scrollResetBtn:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_ScrollReset( " .. panelIndex .. " )")
      scrollResetBtn:SetSize(ChatUIPoolManager._listPanel[drawPanelIndex]:GetSizeX(), 28)
      scrollResetBtn:ComputePos()
      local moreList = poolCurrentUI:newMorelist()
      moreList:SetShow(scrollResetBtn:GetShow())
      moreList:ComputePos()
      PosX = PosX + mainTab:GetSizeX()
    else
      local subTab = poolCurrentUI:newOtherTab()
      subTab:SetTextHorizonCenter(true)
      subTab:SetText(panelIndex + 1)
      subTab:SetNotAbleMasking(true)
      subTab:SetPosX(PosX)
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
    end
  else
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
    settingButton:addInputEvent("Mouse_On", "HandleOn_ChattingAddTabToolTip(true, " .. drawPanelIndex .. ", 2)")
    settingButton:addInputEvent("Mouse_LUp", "ChattingOption_Open( " .. panelIndex .. ", " .. drawPanelIndex .. ", " .. tostring(isCombinedMainPanel) .. " )")
    settingButton:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. drawPanelIndex .. ", false )")
    settingButton:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
    settingButton:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. drawPanelIndex .. ")")
    local combineButton = poolCurrentUI:newPanelCombine()
    combineButton:SetShow(isShow)
    combineButton:SetNotAbleMasking(true)
    combineButton:SetPosX(mainTab:GetSizeX() - combineButton:GetSizeX() * 2 - 5)
    combineButton:addInputEvent("Mouse_On", "HandleOn_ChattingAddTabToolTip(true, " .. drawPanelIndex .. ", 4)")
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
    local isBottom = 0 == ChattingViewManager._srollPosition[panelIndex]
    local scrollResetBtn = poolCurrentUI:newScrollReset()
    scrollResetBtn:SetShow(not isBottom)
    scrollResetBtn:addInputEvent("Mouse_LUp", "HandleClicked_Chatting_ScrollReset( " .. panelIndex .. " )")
    scrollResetBtn:SetSize(ChatUIPoolManager._listPanel[drawPanelIndex]:GetSizeX(), 28)
    scrollResetBtn:ComputePos()
    local moreList = poolCurrentUI:newMorelist()
    moreList:SetShow(scrollResetBtn:GetShow())
    moreList:ComputePos()
  end
  return PosX
end
function Chatting_ScrollEvent(poolIndex, updown)
  if issmoothWheelscroll then
    return
  end
  local chatPanel = ToClient_getChattingPanel(poolIndex)
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
end
function Scroll_IntervalAddPosCalc(panelIndex)
  local self = ChattingViewManager
  local panel = ToClient_getChattingPanel(panelIndex)
  if panel:setChattingPanelFreeze(true, self._srollPosition[panelIndex]) == false then
    _scroll_Interval_AddPos[panelIndex] = 0
  end
  _scroll_Interval_AddPos[panelIndex] = self._srollPosition[panelIndex]
end
function Chatting_OnResize()
  chattingWindowMaxWidth = getScreenSizeX() * 0.67
  local divisionPanel, panel, chatUI
  for poolIndex = 0, ChatUIPoolManager._poolCount - 1 do
    divisionPanel = ToClient_getChattingPanel(poolIndex)
    panel = ChatUIPoolManager._listPanel[poolIndex]
    chatUI = ChatUIPoolManager._listChatUIPool[poolIndex]
    if poolIndex ~= 0 and (false == divisionPanel:isOpen() or divisionPanel:isCombinedToMainPanel()) then
      panel:SetShow(false)
    end
    local panelSizeX = divisionPanel:getPanelSizeX()
    local panelSizeY = divisionPanel:getPanelSizeY()
    local panelPosX = divisionPanel:getPositionX()
    local panelPosY = divisionPanel:getPositionY()
    if panel:GetRelativePosX() == -1 and panel:GetRelativePosY() == -1 then
      local initPosX = 0
      local initPosY
      if false == _ContentsGroup_RenewUI then
        initPosY = getScreenSizeY() - panelSizeY - Panel_GameTips:GetSizeY()
      else
        initPosY = getScreenSizeY() - panelSizeY
      end
      panelPosX = initPosX
      panelPosY = initPosY
      panel:SetPosX(panelPosX)
      panel:SetPosY(panelPosY)
      FGlobal_InitPanelRelativePos(panel, initPosX, initPosY)
    end
    if panel:GetRelativePosX() == 0 and panel:GetRelativePosY() == 0 then
      panelPosX = 0
      if false == _ContentsGroup_RenewUI then
        panelPosY = getScreenSizeY() - panelSizeY - Panel_GameTips:GetSizeY()
      else
        panelPosY = getScreenSizeY() - panelSizeY
      end
    elseif 0 < panel:GetRelativePosX() or 0 < panel:GetRelativePosY() then
      panelPosX = panel:GetRelativePosX() * getScreenSizeX() - panel:GetSizeX() / 2
      panelPosY = panel:GetRelativePosY() * getScreenSizeY() - panel:GetSizeY() / 2
    end
    if panelSizeX > 25 and panelSizeY > 50 then
      panel:SetSize(panelSizeX, panelSizeY)
      chatUI._list_PanelBG[0]:SetSize(panelSizeX, panelSizeY)
      chatUI._list_Scroll[0]:SetSize(chatUI._list_Scroll[0]:GetSizeX(), panelSizeY - 67)
      for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
        chatUI._list_ChattingContents[chattingContents_idx]:SetSize(panelSizeX - 25, chatUI._list_ChattingContents[chattingContents_idx]:GetSizeY())
      end
      chatUI._list_ResizeButton[0]:SetPosX(panelSizeX - (chatUI._list_ResizeButton[0]:GetSizeX() + 5))
      chatUI._list_Scroll[0]:SetPosX(panelSizeX - (chatUI._list_Scroll[0]:GetSizeX() + 5))
      chatUI._list_Scroll[0]:SetPosY(50)
      chatUI._list_Scroll[0]:SetControlBottom()
    else
      panelSizeX = ChatUIPoolManager._defaultPanelSizeX
      panelSizeY = ChatUIPoolManager._defaultPanelSizeY
      panel:SetSize(panelSizeX, panelSizeY)
      chatUI._list_PanelBG[0]:SetSize(panelSizeX, panelSizeY)
      chatUI._list_Scroll[0]:SetSize(chatUI._list_Scroll[0]:GetSizeX(), panelSizeY - 67)
      for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
        chatUI._list_ChattingContents[chattingContents_idx]:SetSize(panelSizeX - 25, chatUI._list_ChattingContents[chattingContents_idx]:GetSizeY())
      end
      chatUI._list_ResizeButton[0]:SetPosX(panelSizeX - (chatUI._list_ResizeButton[0]:GetSizeX() + 5))
      chatUI._list_Scroll[0]:SetPosX(panelSizeX - (chatUI._list_Scroll[0]:GetSizeX() + 5))
      chatUI._list_Scroll[0]:SetPosY(50)
      chatUI._list_Scroll[0]:SetControlBottom()
    end
    local defaultPosY
    if false == _ContentsGroup_RenewUI then
      defaultPosY = getScreenSizeY() - panel:GetSizeY() - Panel_GameTips:GetSizeY()
    else
      defaultPosY = getScreenSizeY() - panel:GetSizeY()
    end
    if -1 == panelPosX and -1 == panelPosY then
      panelPosX = 0
      panelPosY = defaultPosY
    else
      if panelPosX < 0 then
        panelPosX = 0
      elseif panelPosX > getScreenSizeX() - panel:GetSizeX() then
        if false == _ContentsGroup_RenewUI then
          panelPosX = getScreenSizeX() - panel:GetSizeX() - Panel_GameTips:GetSizeY()
        else
          panelPosX = getScreenSizeX() - panel:GetSizeX()
        end
      end
      if panelPosY < 0 then
        panelPosY = 0
      elseif panelPosY == 0 then
        panelPosY = defaultPosY
      elseif panelPosY > getScreenSizeY() - panel:GetSizeY() then
        panelPosY = defaultPosY
      end
    end
    if ChatUIPoolManager._poolCount - 1 == poolIndex and panelPosY == defaultPosY then
      panelPosY = panelPosY - ChatUIPoolManager._defaultPanelSizeY
    end
    panel:SetPosX(panelPosX)
    panel:SetPosY(panelPosY)
    local isCombinePanel = divisionPanel:isCombinedToMainPanel()
    divisionPanel:setPosition(panelPosX, panelPosY, panelSizeX, panelSizeY)
    if isCombinePanel then
      divisionPanel:combineToMainPanel()
    end
  end
  FromClient_ChatUpdate()
end
function HandleClicked_ScrollBtnPosY(panelIndex)
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
  if preScrollControlPos[panelIndex] == poolCurrentUI._list_Scroll[0]:GetControlPos() then
    FromClient_ChatUpdate(true)
    return
  end
  local index = math.floor((1 - poolCurrentUI._list_Scroll[0]:GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1))
  if 0 == index then
    deltascrollPosy[panelIndex] = (1 - poolCurrentUI._list_Scroll[0]:GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) % 1
  else
    deltascrollPosy[panelIndex] = ((1 - poolCurrentUI._list_Scroll[0]:GetControlPos()) * (ChattingViewManager._maxHistoryCount - 1) - index) % 1
  end
  preScrollControlPos[panelIndex] = poolCurrentUI._list_Scroll[0]:GetControlPos()
  ChattingViewManager._srollPosition[panelIndex] = index
  ChattingViewManager._scroll_BTNPos[panelIndex] = poolCurrentUI._list_Scroll[0]:GetControlPos()
  Scroll_IntervalAddPosCalc(panelIndex)
  FromClient_ChatUpdate(true)
end
function HandleClicked_Chatting_AddTab()
  ChattingViewManager._addChattingPreset = false
  ChattingViewManager._addChattingIdx = ToClient_openChattingPanel()
  local mainPaenl = ToClient_getChattingPanel(0)
  local mainPanelTransparency = mainPaenl:getTransparency()
  FGlobal_Chatting_PanelTransparency(ChattingViewManager._addChattingIdx, mainPanelTransparency, false)
  TooltipSimple_Hide()
  FromClient_ChatUpdate(true)
  ToClient_SaveUiInfo(false)
end
function HandleClicked_Chatting_AddTabByIndex(panelIndex)
  ChattingViewManager._addChattingIdx = ToClient_openChattingPanelbyIndex(panelIndex)
  ChattingViewManager._addChattingPreset = true
  if ChattingViewManager._addChattingIdx == -1 then
    ChattingViewManager._addChattingIdx = nil
  else
    FromClient_ChatUpdate(true)
    ToClient_SaveUiInfo(false)
  end
  FromClient_ChatUpdate(true)
  ToClient_SaveUiInfo(false)
end
function HandleClicked_Chatting_ChangeTab(panelIndex)
  ChattingViewManager._mainPanelSelectPanelIndex = panelIndex
  TooltipSimple_Hide()
  FromClient_ChatUpdate(true)
end
function moveChatTab(moveTo)
  local isSuccess = false
  local tempValue = 0
  while false == isSuccess and tempValue < 5 do
    isSuccess = moveChatTabExec(moveTo)
    tempValue = tempValue + 1
  end
end
function moveChatTabExec(moveTo)
  local isSuccess = false
  local addIndex = 1
  if false == moveTo then
    addIndex = -1
  end
  local index = ChattingViewManager._mainPanelSelectPanelIndex + addIndex
  if index < 0 then
    index = 4
  elseif index > 4 then
    index = 0
  end
  local chatPanelInfo = ToClient_getChattingPanel(index)
  if nil ~= chatPanelInfo then
    isSuccess = chatPanelInfo:isCombinedToMainPanel() and chatPanelInfo:isOpen()
  end
  HandleClicked_Chatting_ChangeTab(index)
  return isSuccess
end
function HandleClicked_Chatting_Division(panelIndex)
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
  chatUI._list_PanelBG[0]:SetSize(sizeX, sizeY)
  chatUI._list_Scroll[0]:SetSize(chatUI._list_Scroll[0]:GetSizeX(), sizeY - 67)
  chatUI._list_ResizeButton[0]:SetPosX(sizeX - (chatUI._list_ResizeButton[0]:GetSizeX() + 5))
  chatUI._list_Scroll[0]:SetControlBottom()
  ChattingViewManager._mainPanelSelectPanelIndex = 0
  ChattingViewManager._transparency[panelIndex] = 0.5
  TooltipSimple_Hide()
  FromClient_ChatUpdate(true)
  ToClient_SaveUiInfo(false)
end
function HandleClicked_Chatting_CombineTab(panelIndex)
  local panel = ToClient_getChattingPanel(panelIndex)
  local mainPaenl = ToClient_getChattingPanel(0)
  local mainPanelTransparency = mainPaenl:getTransparency()
  panel:combineToMainPanel()
  panel:setTransparency(mainPanelTransparency)
  FGlobal_Chatting_PanelTransparency(panelIndex, mainPanelTransparency, false)
  TooltipSimple_Hide()
  FromClient_ChatUpdate(true)
  ToClient_SaveUiInfo(false)
end
function HandleClicked_Chatting_Close(panelIndex)
  ToClient_closeChattingPanel(panelIndex)
  ChattingViewManager._mainPanelSelectPanelIndex = 0
  FromClient_ChatUpdate()
  Chatting_PanelTransparency(panelIndex, false, true)
  TooltipSimple_Hide()
  ToClient_SaveUiInfo(false)
end
function HandleClicked_Chatting_ScrollReset(panelIndex)
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
  local poolCurrentUI = ChatUIPoolManager:getPool(panelIndex)
  scrollresetSpeed = _scroll_Interval_AddPos[scrollIndex]
end
local orgMouseX = 0
local orgMouseY = 0
local orgPanelSizeX = 0
local orgPanelSizeY = 0
local orgPanelPosY = 0
function HandleClicked_Chatting_ResizeStartPos(drawPanelIndex)
  local panel = ChatUIPoolManager:getPanel(drawPanelIndex)
  orgMouseX = getMousePosX()
  orgMouseY = getMousePosY()
  orgPanelPosY = panel:GetPosY()
  orgPanelSizeX = panel:GetSizeX()
  orgPanelSizeY = panel:GetSizeY()
  FromClient_ChatUpdate(true, drawPanelIndex)
end
function HandleClicked_Chatting_ResizeStartPosEND(drawPanelIndex)
  ToClient_SaveUiInfo(false)
  Chatting_PanelTransparency(drawPanelIndex, false)
end
function HandleClicked_Chatting_Resize(drawPanelIndex, panelIdx)
  local panel = ChatUIPoolManager:getPanel(drawPanelIndex)
  local chatUI = ChatUIPoolManager:getPool(drawPanelIndex)
  local currentX = getMousePosX()
  local currentY = getMousePosY()
  local deltaX = currentX - orgMouseX
  local deltaY = orgMouseY - currentY
  local sizeX = orgPanelSizeX + deltaX
  local sizeY = orgPanelSizeY + deltaY
  if sizeX >= chattingWindowMaxWidth then
    sizeX = chattingWindowMaxWidth
  elseif sizeX <= 400 then
    sizeX = 400
  end
  if sizeY <= 200 then
    sizeY = 200
  end
  local deltaPosY = orgPanelSizeY - sizeY
  panel:SetSize(sizeX, sizeY)
  chatUI._list_PanelBG[0]:SetSize(sizeX, sizeY)
  chatUI._list_Scroll[0]:SetSize(chatUI._list_Scroll[0]:GetSizeX(), sizeY - 67)
  for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
    chatUI._list_ChattingContents[chattingContents_idx]:SetSize(sizeX - 25, chatUI._list_ChattingContents[chattingContents_idx]:GetSizeY())
  end
  panel:SetPosY(orgPanelPosY + deltaPosY)
  chatUI._list_ResizeButton[0]:SetPosX(sizeX - (chatUI._list_ResizeButton[0]:GetSizeX() + 5))
  chatUI._list_Scroll[0]:SetPosX(sizeX - (chatUI._list_Scroll[0]:GetSizeX() + 5))
  chatUI._list_Scroll[0]:SetControlBottom()
  PAGlobal_setPanelChattingPoolRelativeSize(drawPanelIndex)
  FromClient_ChatUpdate(true, drawPanelIndex)
  ToClient_SaveUiInfo(false)
end
function HandleOn_ChattingLinkedItem(poolIndex, LinkedItemStaticIndex, isClicked)
  FromClient_ChatUpdate()
  ChattingViewManager._linkedItemTooltipIsClicked = isClicked
  local paramIndex = poolIndex
  if 0 == poolIndex then
    paramIndex = ChattingViewManager._mainPanelSelectPanelIndex
  end
  local chatPanel = ToClient_getChattingPanel(paramIndex)
  local poolCurrentUI = ChatUIPoolManager:getPool(poolIndex)
  local panelCurrentUI = ChatUIPoolManager:getPanel(poolIndex)
  local messageIndex = poolCurrentUI._list_LinkedItemMessageIndex[LinkedItemStaticIndex]
  local chattingMessage = chatPanel:getChattingMessageByIndex(messageIndex)
  if chattingMessage:isLinkedItem() then
    local chattingLinkedItem = chattingMessage:getLinkedItemInfo()
    local itemSSW = chattingLinkedItem:getLinkedItemStaticStatus()
    if nil ~= itemSSW then
      Panel_Tooltip_Item_Show_ForChattingLinkedItem(itemSSW, panelCurrentUI, true, false, chattingLinkedItem, isClicked)
      Scroll_IntervalAddPosCalc(paramIndex)
    end
  end
end
function HandleOn_ChattingLinkedGuild(poolIndex, LinkedGuildIndex)
  FromClient_ChatUpdate()
  ChattingViewManager._linkedItemTooltipIsClicked = isClicked
  local paramIndex = poolIndex
  if 0 == poolIndex then
    paramIndex = ChattingViewManager._mainPanelSelectPanelIndex
  end
  local chatPanel = ToClient_getChattingPanel(paramIndex)
  local poolCurrentUI = ChatUIPoolManager:getPool(poolIndex)
  local messageIndex = poolCurrentUI._list_LinkedGuildMessageIndex[LinkedGuildIndex]
  local chattingMessage = chatPanel:getChattingMessageByIndex(messageIndex)
  if chattingMessage:isLinkedGuild() then
    local linkedGuildInfo = chattingMessage:getLinkedGuildInfo()
    local guildNo = linkedGuildInfo:getGuildNo()
    FGlobal_GuildWebInfoForGuildRank_Open(tostring(guildNo))
  end
end
function HandleOn_ChattingLinkedWebSite(poolIndex, LinkedWebsiteIndex)
  FromClient_ChatUpdate()
  ChattingViewManager._linkedItemTooltipIsClicked = isClicked
  local paramIndex = poolIndex
  if 0 == poolIndex then
    paramIndex = ChattingViewManager._mainPanelSelectPanelIndex
  end
  local chatPanel = ToClient_getChattingPanel(paramIndex)
  local poolCurrentUI = ChatUIPoolManager:getPool(poolIndex)
  local messageIndex = poolCurrentUI._list_LinkedWebSiteMessageIndex[LinkedWebsiteIndex]
  local chattingMessage = chatPanel:getChattingMessageByIndex(messageIndex)
  if chattingMessage:isLinkedWebsite() then
    ToClient_OpenChargeWebPage(chattingMessage:getLinkedWebsite(), false)
  end
end
function HandleOn_ChattingAddTabToolTip(isShow, poolIndex, tipType)
  if not isShow then
    TooltipSimple_Hide()
    return
  end
  if nil == poolIndex then
    return
  end
  local self = ChatUIPool
  local name, desc, control
  local poolCurrentUI = ChatUIPoolManager:getPool(poolIndex)
  local addTabControl = poolCurrentUI._list_AddTab[0]
  local divisionControl = poolCurrentUI._list_PanelDivision[poolIndex]
  local settingControl = poolCurrentUI._list_TitleTabConfigButton[poolIndex]
  local sizeControl = poolCurrentUI._list_ResizeButton[poolIndex]
  local combineControl = poolCurrentUI._list_PanelDelete[poolIndex]
  if 0 == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_ADDTAB_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_ADDTAB_DESC")
    control = addTabControl
  elseif 1 == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_DIVISION_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_DIVISION_DESC")
    control = divisionControl
  elseif 2 == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_CONFIG_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_CONFIG_DESC")
    control = settingControl
  elseif 3 == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_RESIZE_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_RESIZE_DESC")
    control = sizeControl
  elseif 4 == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_MERGE_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_TOOLTIP_MERGE_DESC")
    control = combineControl
  end
  if nil ~= control then
    TooltipSimple_Show(control, name, desc)
  end
end
function HandleClicked_ChattingSender(poolIndex, senderStaticIndex)
  FromClient_ChatUpdate()
  local paramIndex = poolIndex
  if 0 == poolIndex then
    paramIndex = ChattingViewManager._mainPanelSelectPanelIndex
  end
  local posX = getMousePosX()
  local posY = getMousePosY()
  local chatPanel = ToClient_getChattingPanel(paramIndex)
  local poolCurrentUI = ChatUIPoolManager:getPool(poolIndex)
  local messageIndex = poolCurrentUI._list_SenderMessageIndex[senderStaticIndex]
  local chattingMessage = chatPanel:getChattingMessageByIndex(messageIndex)
  local isBlockedUser = ToClient_isChatMsgFromBlockedUser(chattingMessage)
  if false == isBlockedUser then
    if nil ~= chattingMessage then
      clickedName = chattingMessage:getSender(0)
      clickedUserNickName = chattingMessage:getSender(1)
      clickedMsg = chattingMessage:getContent()
      chatType = chattingMessage.chatType
      isSameChannel = chattingMessage.isSameChannel
      currentPoolIndex = paramIndex
      clickedMessageIndex = messageIndex
      if nil ~= clickedName and nil ~= clickedUserNickName then
        setClipBoardText(clickedName)
        if ChatSubMenu._mainPanel:IsShow() then
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
  end
end
function isInviteParty(chatType, isSameChannel)
  local selfPlayer = getSelfPlayer()
  local selfActorKeyRaw = selfPlayer:getActorKey()
  local isInvite = selfPlayer:isPartyLeader(selfActorKeyRaw) or false == selfPlayer:isPartyMemberActorKey(selfActorKeyRaw)
  return isSameChannel and UI_CT.Party ~= chatType and isInvite
end
function isInviteGuild(chatType, isSameChannel)
  local selfPlayer = getSelfPlayer()
  local selfActorKeyRaw = selfPlayer:getActorKey()
  return isSameChannel and UI_CT.Guild ~= chatType and selfPlayer:isSpecialGuildMember(selfActorKeyRaw)
end
function isInviteCompetition(isSameChannel)
  local selfPlayer = getSelfPlayer()
  local selfActorKeyRaw = selfPlayer:getActorKey()
  return isSameChannel and ToClient_IsCompetitionHost()
end
function HandleClicked_ChatSubMenu_SendWhisper()
  if nil ~= clickedName and nil ~= clickedUserNickName then
    local nameType = ToClient_getChatNameType()
    if nameType == 0 then
      FGlobal_ChattingInput_ShowWhisper(clickedName)
    elseif nameType == 1 then
      FGlobal_ChattingInput_ShowWhisper(clickedUserNickName)
    end
    ChatSubMenu:SetShow(false)
    clickedName = nil
    clickedUserNickName = nil
    clickedMsg = nil
    currentPoolIndex = nil
    clickedMessageIndex = nil
  end
end
function HandleClicked_ChatSubMenu_AddFriend()
  if ToClient_isAddFriendAllowed() then
    if nil ~= clickedName and nil ~= clickedUserNickName then
      local nameType = ToClient_getChatNameType()
      if nameType == 0 then
        requestFriendList_addFriend(clickedName, true)
      elseif nameType == 1 then
        requestFriendList_addFriend(clickedUserNickName, false)
      end
      ChatSubMenu:SetShow(false)
      clickedName = nil
      clickedUserNickName = nil
      clickedMsg = nil
      currentPoolIndex = nil
      clickedMessageIndex = nil
    end
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
    return
  end
end
function HandleClicked_ChatSubMenu_InviteParty()
  if nil ~= currentPoolIndex and nil ~= clickedMessageIndex then
    ToClient_RequestInvitePartyByChatSubMenu(currentPoolIndex, clickedName)
    ChatSubMenu:SetShow(false)
    local isSelfPlayerPlayingPvPMatch = getSelfPlayer():isDefinedPvPMatch()
    if false == isSelfPlayerPlayingPvPMatch then
      local nameType = ToClient_getChatNameType()
      local selectName
      if nameType == 0 then
        selectName = clickedName
      elseif nameType == 1 then
        selectName = clickedUserNickName
      end
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ACK_INVITE", "targetName", selectName))
    end
    clickedName = nil
    clickedUserNickName = nil
    clickedMsg = nil
    currentPoolIndex = nil
    clickedMessageIndex = nil
  end
end
function HandleClicked_ChatSubMenu_InviteLargeParty()
  if nil ~= currentPoolIndex and nil ~= clickedMessageIndex then
    ToClient_InviteLargePartyByCharacterName(clickedName)
    ChatSubMenu:SetShow(false)
    local isSelfPlayerPlayingPvPMatch = getSelfPlayer():isDefinedPvPMatch()
    if false == isSelfPlayerPlayingPvPMatch then
      local nameType = ToClient_getChatNameType()
      local selectName
      if nameType == 0 then
        selectName = clickedName
      elseif nameType == 1 then
        selectName = clickedUserNickName
      end
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ACK_LARGEPARTYINVITE", "targetName", selectName))
    end
    clickedName = nil
    clickedUserNickName = nil
    clickedMsg = nil
    currentPoolIndex = nil
    clickedMessageIndex = nil
  end
end
function HandleClicked_ChatSubMenu_InviteGuild()
  if nil ~= currentPoolIndex and nil ~= clickedMessageIndex then
    ToClient_RequestInviteGuildByChatSubMenu(currentPoolIndex, clickedName)
    ChatSubMenu:SetShow(false)
  end
end
function HandleClicked_ChatSubMenu_InviteCompetition()
  if nil ~= currentPoolIndex and nil ~= clickedMessageIndex then
    ToClient_RequestInviteCompetitionByChatSubMenu(clickedName, false)
    ChatSubMenu:SetShow(false)
  end
end
function FromClient_requestInviteGuildByChatSubMenu(actorKeyRaw)
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    return
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  if 0 == guildGrade then
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
function HandleClicked_ChatSubMenu_Block()
  if nil ~= currentPoolIndex and nil ~= clickedMessageIndex then
    local function chatBlock()
      ToClient_RequestBlockCharacter(currentPoolIndex, clickedUserNickName)
      ChatSubMenu:SetShow(false)
      clickedName = nil
      clickedUserNickName = nil
      clickedMsg = nil
      currentPoolIndex = nil
      clickedMessageIndex = nil
    end
    local messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHNATNEW_INTERCEPTION_MEMO", "clickedName", clickedUserNickName)
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_CHNATNEW_INTERCEPTION_TITLE"),
      content = messageContent,
      functionYes = chatBlock,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
  end
end
function HandleClicked_ChatSubMenu_ReportGoldSeller()
  local selfProxy = getSelfPlayer():get()
  local inventory = selfProxy:getCashInventory()
  local hasItem = inventory:getItemCount_s64(ItemEnchantKey(65208, 0))
  if toInt64(0, 0) == hasItem then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_NO_HAVE_ITEM"))
    return
  end
  local limitLevel = 20
  if limitLevel > getSelfPlayer():get():getLevel() then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHATNEW_GOLDSELLERITEM_LIMITLEVEL", "limitLevel", limitLevel))
    return
  end
  if nil ~= currentPoolIndex and nil ~= clickedMessageIndex and nil ~= clickedMsg then
    FGlobal_reportSeller_Open(clickedName, clickedMsg)
  end
end
function HandleClicked_ChatSubMenu_BlockVote()
  if nil ~= currentPoolIndex and nil ~= clickedMessageIndex then
    local function chatBlockVote()
      ToClient_RequestBlockChatByUser(clickedName)
      ChatSubMenu:SetShow(false)
      clickedName = nil
      clickedUserNickName = nil
      clickedMsg = nil
      currentPoolIndex = nil
      clickedMessageIndex = nil
    end
    local nameType = ToClient_getChatNameType()
    local selectName
    if nameType == 0 then
      selectName = clickedName
    elseif nameType == 1 then
      selectName = clickedUserNickName
    end
    local messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHNATNEW_CHAT_BAN_MEMO", "clickedName", selectName)
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_CHNATNEW_CHAT_BAN_TITLE"),
      content = messageContent,
      functionYes = chatBlockVote,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
  end
end
function HandleClicked_ChatSubMenu_Introduce()
end
function FGlobal_ChattingPanel_Reset()
  ToClient_setDefaultChattingPanel()
  setisChangeFontSize(true)
  local baseChatPanel = ChatUIPoolManager:getPanel(0)
  baseChatPanel:SetShow(true)
  FromClient_ChatUpdate()
end
function FGlobal_Chatting_ShowToggle()
  local baseChatPanel = ChatUIPoolManager:getPanel(0)
  if true == baseChatPanel:GetShow() then
    baseChatPanel:SetShow(false)
  else
    baseChatPanel:SetShow(true)
  end
  FromClient_ChatUpdate()
end
function PaGlobalFunc_Chatting_ShowOff()
  for chatPoolIdx = 0, 4 do
    local baseChatPanel = ChatUIPoolManager:getPanel(chatPoolIdx)
    if nil ~= baseChatPanel then
      baseChatPanel:SetShow(false)
    end
  end
end
function FGlobal_Chatting_PanelTransparency(panelIndex, _transparency, update)
  ChattingViewManager._transparency[panelIndex] = _transparency
  local chatPanel = ToClient_getChattingPanel(panelIndex)
  chatPanel:setTransparency(_transparency)
  if update then
    FromClient_ChatUpdate()
  end
end
function FGlobal_Chatting_PanelTransparency_Chk(panelIndex)
  return ChattingViewManager._transparency[panelIndex]
end
function Chatting_PanelTransparency(panelIndex, transparency, isHideTooltip)
  local count = ToClient_getChattingPanelCount()
  if panelIndex > count then
    return
  end
  local currentPanel = ChatUIPoolManager:getPanel(panelIndex)
  local IsMouseOver = UI.checkIsInMouseAndEventPanel(currentPanel)
  if true == isHideTooltip and Panel_Tooltip_Item_chattingLinkedItem:GetShow() then
    Panel_Tooltip_Item_hideTooltip()
    TooltipSimple_Hide()
  end
  if true == transparency and true == IsMouseOver then
    if false == isMouseOn then
      ChattingViewManager._cacheSimpleUI = true
      isMouseOnChattingViewIndex = panelIndex
      isMouseOn = true
      FromClient_ChatUpdate(IsMouseOver, panelIndex)
    end
    TooltipSimple_Hide()
  elseif false == transparency and false == IsMouseOver then
    ChattingViewManager._cacheSimpleUI = false
    isMouseOn = false
    isMouseOnChattingViewIndex = nil
    TooltipSimple_Hide()
    FromClient_ChatUpdate(IsMouseOver, panelIndex)
  end
end
function FGlobal_MainChatPanelUpdate()
  local chatPanelInfo = ToClient_getChattingPanel(0)
  local targetPanel = ChatUIPoolManager:getPanel(0)
  targetPanel:SetShow(false, false)
  if nil == getSelfPlayer() or nil == getSelfPlayer():get() then
    return
  end
  if false == CheckTutorialEnd() and true == PaGlobal_TutorialManager:isDoingTutorial() then
    return
  end
  targetPanel:SetColor(UI_color.C_00000000)
  if chatPanelInfo:isOpen() then
    targetPanel:SetShow(true)
  else
    targetPanel:SetShow(false)
  end
end
function ChatPanel_Update()
  local count = ToClient_getChattingPanelCount()
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    local chatUI = ChatUIPoolManager:getPool(panelIndex)
    for chattingContents_idx = 0, chatUI._maxcount_ChattingContents - 1 do
      chatUI._list_ChattingSender[chattingContents_idx]:SetText(" ")
      chatUI._list_ChattingSender[chattingContents_idx]:SetSize(chatUI._list_ChattingSender[chattingContents_idx]:GetSizeX(), chatUI._list_ChattingSender[chattingContents_idx]:GetSizeY())
    end
    chatUI:clear()
  end
end
function ChattingPoolUpdate(poolCurrentUI, currentPanel, panelIndex, drawPanelIndex)
  poolCurrentUI:clear()
  local panel_resizeButton = poolCurrentUI:newResizeButton()
  panel_resizeButton:SetNotAbleMasking(true)
  panel_resizeButton:SetShow(true)
  panel_resizeButton:addInputEvent("Mouse_On", "HandleOn_ChattingAddTabToolTip(true, " .. drawPanelIndex .. ", 3)")
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
  panel_Scroll:SetControlPos(ChattingViewManager._scroll_BTNPos[panelIndex])
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
function FromClient_ChatUpdate(isShow, currentPanelIndex)
  if true == _ContentsGroup_RenewUI then
    PaGlobalFunc_Chatting_ShowOff()
    return
  end
  _tabButton_PosX = 0
  addChat_PosX = 0
  local openedChattingPanelCount = 0
  local count = ToClient_getChattingPanelCount()
  for panelIndex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      openedChattingPanelCount = openedChattingPanelCount + 1
      if chatPanel:isUpdated() then
        ChatUIPoolManager:getPool(panelIndex):clear()
        local isCombinedPanel = chatPanel:isCombinedToMainPanel()
        if currentPanelIndex == panelIndex then
          ChattingViewManager:update(chatPanel, panelIndex, isShow)
        elseif 0 == currentPanelIndex and isCombinedPanel then
          ChattingViewManager:update(chatPanel, panelIndex, isShow)
        else
          ChattingViewManager:update(chatPanel, panelIndex)
        end
      end
    else
      local panel = ChatUIPoolManager:getPanel(panelIndex)
      panel:SetShow(false)
      local poolCurrentUI = ChatUIPoolManager:getPool(panelIndex)
      poolCurrentUI:clear()
    end
  end
  setisChangeFontSize(false)
  if openedChattingPanelCount < 5 then
    local poolCurrentUI = ChatUIPoolManager:getPool(0)
    local panel_addTab = poolCurrentUI:newAddTab()
    local panel_division = poolCurrentUI:newPanelDivision()
    local mainPanel = ChatUIPoolManager:getPanel(0)
    panel_addTab:SetNotAbleMasking(true)
    if 0 == currentPanelIndex or nil == currentPanelIndex then
      panel_addTab:SetShow(isMouseOn)
    elseif nil ~= currentPanelIndex and 0 ~= currentPanelIndex then
      panel_addTab:SetShow(false)
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
    if nil ~= currentPanelIndex then
      panel_addTab:addInputEvent("Mouse_On", "HandleOn_ChattingAddTabToolTip(true, " .. currentPanelIndex .. ", 0)")
      panel_division:addInputEvent("Mouse_On", "HandleOn_ChattingAddTabToolTip(true, " .. currentPanelIndex .. ", 1)")
      panel_addTab:addInputEvent("Mouse_Out", "Chatting_PanelTransparency(" .. currentPanelIndex .. ", false )")
      panel_addTab:addInputEvent("Mouse_LPress", "Chatting_Transparency(" .. currentPanelIndex .. ")")
      panel_addTab:addInputEvent("Mouse_RPress", "Chatting_Transparency(" .. currentPanelIndex .. ")")
    end
  end
  if nil ~= ChattingViewManager._addChattingIdx then
    if ChattingViewManager._addChattingPreset == false then
      ChattingOption_Open(ChattingViewManager._addChattingIdx, 0, true)
    end
    ChattingViewManager._addChattingIdx = nil
  end
end
function FGlobal_getChattingPanel(poolIndex)
  local panel = ChatUIPoolManager:getPanel(poolIndex)
  return panel
end
function FGlobal_getChattingPanelUIPool(panelIndex)
  return ChatUIPoolManager:getPool(panelIndex)
end
function Chatting_EnableSimpleUI()
  FromClient_ChatUpdate()
end
function FGlobal_InputModeChangeForChatting()
  local IM = CppEnums.EProcessorInputMode
  if false == ToClient_isLoadingProcessor() and IM.eProcessorInputMode_GameMode == getInputMode() then
    isMouseOn = false
    FromClient_ChatUpdate(false, ChattingViewManager._mainPanelSelectPanelIndex)
  end
end
local saveWhisperTime = getTime()
local checkWhistperTime = toUint64(0, 60000)
local sendPossibleTime = toUint64(0, 0)
function FromClient_PrivateChatMessageUpdate()
  if sendPossibleTime <= getTime() then
    audioPostEvent_SystemUi(100, 0)
    sendPossibleTime = getTime() + checkWhistperTime
  end
end
function Chatting_setIsOpenValue(panelIndex, isOpen)
  local chatPanel = ToClient_getChattingPanel(panelIndex)
  chatPanel:setOpenValue(isOpen)
end
function Chatting_setUsedSmoothChattingUp(flag)
  isUsedSmoothChattingUp = flag
end
function Chatting_getUsedSmoothChattingUp()
  return isUsedSmoothChattingUp
end
function checkCombineandActiveMainPanel()
end
function ResetAllScroll()
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
      ChattingViewManager._srollPosition[panelIndex] = 0
      poolCurrentUI._list_Scroll[0]:SetControlPos(1)
    end
  end
  if true == _ContentsGroup_RenewUI then
    PaGlobalFunc_Chatting_ShowOff()
  else
    FromClient_ChatUpdate(true)
  end
end
function FromClient_ChatNew_luaLoadComplete()
  ResetAllScroll()
  registerEvent("EventProcessorInputModeChange", "FGlobal_InputModeChangeForChatting")
end
registerEvent("EventSimpleUIEnable", "Chatting_EnableSimpleUI")
registerEvent("EventSimpleUIDisable", "Chatting_EnableSimpleUI")
registerEvent("EventChattingMessageUpdate", "FromClient_ChatUpdate")
registerEvent("onScreenResize", "Chatting_OnResize")
registerEvent("FromClient_requestInviteGuildByChatSubMenu", "FromClient_requestInviteGuildByChatSubMenu")
registerEvent("FromClient_PrivateChatMessageUpdate", "FromClient_PrivateChatMessageUpdate")
registerEvent("FromClient_RenderModeChangeState", "Chatting_OnResize")
registerEvent("FromClient_luaLoadComplete", "FromClient_ChatNew_luaLoadComplete")
