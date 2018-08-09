local _panel = Panel_Widget_ChattingViewer_Renew
local _isInitialized = false
local ChattingViewer = {
  _ui = {
    stc_sampleBG = UI.getChildControl(_panel, "Static_SampleBG")
  },
  _messageData = {},
  _uiPool = {},
  _cloneCount = 30,
  _chattingPanelCount = 5,
  _displayableMessageCount = 10,
  _previouseMessageCountPerPanel = {}
}
local _reserveDataMax = 100
function FromClient_luaLoadComplete_ChattingViewer_Init()
  ChattingViewer:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_ChattingViewer_Init")
function ChattingViewer:initialize()
  if _isInitialized then
    return
  end
  self._uiPool = self:createPool()
  self._previouseMessageCountPerPanel = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0
  }
  _panel:SetShow(true)
  self:registMessageHandler()
  ToClient_getFontWrapper("BaseFont_10_Chat"):changeFontSize(20)
  _isInitialized = true
end
function ChattingViewer:createPool()
  local ch = ChattingViewer
  local ChatUIPool = {
    _list_PanelBG = {},
    _list_ChattingIcon = {},
    _list_ChattingSender = {},
    _list_ChattingContents = {},
    _list_ChattingGuildMark = {},
    _list_ChattingLinkedItem = {},
    _list_ChattingLinkedGuild = {},
    _list_ChattingLinkedWebSite = {},
    _list_Emoticon = {},
    _list_At = {},
    _count_ChattingIcon = 1,
    _count_ChattingSender = 1,
    _count_ChattingContents = 1,
    _count_ChattingLinkedItem = 1,
    _count_ChattingLinkedGuild = 1,
    _count_ChattingGuildMark = 1,
    _count_ChattingLinkedWebSite = 1,
    _count_Emoticon = 1,
    _count_At = 1,
    _maxcount_ChattingIcon = ch._cloneCount,
    _maxcount_ChattingSender = ch._cloneCount,
    _maxcount_ChattingContents = ch._cloneCount,
    _maxcount_ChattingLinkedItem = ch._cloneCount,
    _maxcount_ChattingLinkedGuild = ch._cloneCount,
    _maxcount_ChattingGuildMark = ch._cloneCount,
    _maxcount_ChattingLinkedWebSite = ch._cloneCount,
    _maxcount_Emoticon = ch._cloneCount,
    _maxcount_At = ch._cloneCount,
    _list_SenderMessageIndex = {},
    _list_ContentMessageIndex = {},
    _list_LinkedItemMessageIndex = {},
    _list_LinkedGuildMessageIndex = {},
    _list_LinkedWebSiteMessageIndex = {},
    _list_LinkedAtMessageIndex = {},
    _list_LinkedAtIndex = {}
  }
  function ChatUIPool:initialize()
    for ii = 1, ch._cloneCount do
      ChatUIPool._list_ChattingIcon[ii] = UI.createAndCopyBasePropertyControl(ch._ui.stc_sampleBG, "Static_ChatIcon", ch._ui.stc_sampleBG, "Static_ChatIcon" .. ii)
      ChatUIPool._list_ChattingSender[ii] = UI.createAndCopyBasePropertyControl(ch._ui.stc_sampleBG, "StaticText_ChatSender", ch._ui.stc_sampleBG, "StaticText_ChatSender" .. ii)
      ChatUIPool._list_ChattingContents[ii] = UI.createAndCopyBasePropertyControl(ch._ui.stc_sampleBG, "StaticText_ChatContent", ch._ui.stc_sampleBG, "StaticText_ChatContent" .. ii)
      ChatUIPool._list_ChattingGuildMark[ii] = UI.createAndCopyBasePropertyControl(ch._ui.stc_sampleBG, "Static_GuildMark", ch._ui.stc_sampleBG, "Static_GuildMark" .. ii)
      ChatUIPool._list_ChattingLinkedItem[ii] = UI.createAndCopyBasePropertyControl(ch._ui.stc_sampleBG, "StaticText_ChatLinkedItem", ch._ui.stc_sampleBG, "StaticText_ChatLinkedItem" .. ii)
      ChatUIPool._list_ChattingLinkedGuild[ii] = UI.createAndCopyBasePropertyControl(ch._ui.stc_sampleBG, "StaticText_ChatLinkedGuild", ch._ui.stc_sampleBG, "StaticText_ChatLinkedGuild" .. ii)
      ChatUIPool._list_ChattingLinkedWebSite[ii] = UI.createAndCopyBasePropertyControl(ch._ui.stc_sampleBG, "StaticText_ChatLinkedWebSite", ch._ui.stc_sampleBG, "StaticText_ChatLinkedWebSite" .. ii)
      ChatUIPool._list_Emoticon[ii] = UI.createAndCopyBasePropertyControl(ch._ui.stc_sampleBG, "Static_Emoticon", ch._ui.stc_sampleBG, "Static_Emoticon" .. ii)
      ChatUIPool._list_At[ii] = UI.createAndCopyBasePropertyControl(ch._ui.stc_sampleBG, "Static_At", ch._ui.stc_sampleBG, "Static_At" .. ii)
    end
    ChatUIPool._list_PanelBG[0] = _panel
    ChattingOption_SelectFontSize(20)
  end
  function ChatUIPool:newChattingIcon()
    self._count_ChattingIcon = self._count_ChattingIcon + 1
    return self._list_ChattingIcon[self._count_ChattingIcon - 1]
  end
  function ChatUIPool:getCurrentChattingIconIndex()
    return self._count_ChattingIcon - 1
  end
  function ChatUIPool:getChattingIconByIndex(index)
    return self._list_ChattingIcon[index]
  end
  function ChatUIPool:newChattingSender(messageIndex)
    self._count_ChattingSender = self._count_ChattingSender + 1
    self._list_SenderMessageIndex[self._count_ChattingSender - 1] = messageIndex
    return self._list_ChattingSender[self._count_ChattingSender - 1]
  end
  function ChatUIPool:getChattingContentByIndex(index)
    return self._list_ChattingContents[index]
  end
  function ChatUIPool:newChattingContents(messageIndex)
    self._count_ChattingContents = self._count_ChattingContents + 1
    if nil ~= messageIndex and nil == self._list_ContentMessageIndex[messageIndex] then
      self._list_ContentMessageIndex[messageIndex] = self._list_ChattingContents[self._count_ChattingContents - 1]
    end
    return self._list_ChattingContents[self._count_ChattingContents - 1]
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
  function ChatUIPool:clearChattingIcon()
    self._count_ChattingIcon = 1
  end
  function ChatUIPool:clearChattingSender(messageIndex)
    self._count_ChattingSender = 1
  end
  function ChatUIPool:clearChattingContents()
    self._count_ChattingContents = 1
  end
  function ChatUIPool:clearChattingLinkedItem(messageIndex)
    self._count_ChattingLinkedItem = 1
  end
  function ChatUIPool:clearChattingLinkedGuild(messageIndex)
    self._count_ChattingLinkedGuild = 1
  end
  function ChatUIPool:clearChattingGuildMark()
    self._count_ChattingGuildMark = 1
  end
  function ChatUIPool:clearChattingLinkedwebsite(messageIndex)
    self._count_ChattingLinkedWebSite = 1
  end
  function ChatUIPool:clearEmoticon()
    self._count_Emoticon = 1
  end
  function ChatUIPool:clearAt()
    self._count_At = 1
  end
  function ChatUIPool:clear()
    self._count_ChattingIcon = 1
    self._count_ChattingSender = 1
    self._count_ChattingContents = 1
    self._count_ChattingLinkedItem = 1
    self._count_ChattingLinkedGuild = 1
    self._count_ChattingGuildMark = 1
    self._count_ChattingLinkedWebSite = 1
    self._count_Emoticon = 1
    self._count_At = 1
    self._list_SenderMessageIndex = {}
    self._list_ContentMessageIndex = {}
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
    for index = self._count_Emoticon, self._maxcount_Emoticon do
      self._list_Emoticon[index]:SetShow(false)
    end
    for index = self._count_At, self._maxcount_At do
      self._list_At[index]:SetShow(false)
    end
  end
  ChatUIPool:initialize()
  return ChatUIPool
end
function ChattingViewer:registMessageHandler()
  registerEvent("EventChattingMessageUpdate", "FromClient_ChattingViewer_Update")
end
function FromClient_ChattingViewer_Update()
  local self = ChattingViewer
  if not _isInitialized then
    return
  end
  if false == CheckTutorialEnd() and true == PaGlobal_TutorialManager:isDoingTutorial() then
    return
  end
  self._uiPool:clear()
  local chatting_content_PosY = _panel:GetSizeY() - 10
  local chattingPanel = ToClient_getChattingPanel(0)
  local thisPanelMessageCount = chattingPanel:getMessageCount()
  local messageData = {}
  local shownCount = 0
  for ii = 1, thisPanelMessageCount do
    local message = chattingPanel:getChattingMessageByIndex(ii - 1)
    if nil ~= message and (CppEnums.ChatType.Notice == message.chatType or CppEnums.ChatType.World == message.chatType or CppEnums.ChatType.Public == message.chatType or CppEnums.ChatType.Private == message.chatType or CppEnums.ChatType.Battle == message.chatType or CppEnums.ChatType.Guild == message.chatType or CppEnums.ChatType.Party == message.chatType) then
      chatting_content_PosY = Chatnew_CreateChattingContent(message, self._uiPool, chatting_content_PosY, ii, nil, 1, false, 0)
      shownCount = shownCount + 1
      if shownCount > self._displayableMessageCount then
        break
      end
    end
  end
  self._uiPool:hideNotUse()
end
function PaGlobalFunc_ChattingViewer_MessageComparer(ii, jj)
  return ii._time_s64 > jj._time_s64
end
function PaGlobalFunc_ChattingViewer_On()
  if true == Panel_Widget_ChattingViewer_Renew:GetShow() then
    return
  end
  Panel_Widget_ChattingViewer_Renew:SetShow(true)
end
function PaGlobalFunc_ChattingViewer_Off()
  if false == Panel_Widget_ChattingViewer_Renew:GetShow() then
    return
  end
  Panel_Widget_ChattingViewer_Renew:SetShow(false)
end
