-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_knowledgemanagement.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
Panel_KnowledgeManagement:SetShow(false)
local _textNeed = (UI.getChildControl)(Panel_KnowledgeManagement, "StaticText_UseWP")
local _textHave = (UI.getChildControl)(Panel_KnowledgeManagement, "StaticText_HoldWP")
local _textNeedValue = (UI.getChildControl)(Panel_KnowledgeManagement, "StaticText_UseWP_Value")
local _textHaveValue = (UI.getChildControl)(Panel_KnowledgeManagement, "StaticText_HoldWP_Value")
local _buttonSearch = (UI.getChildControl)(Panel_KnowledgeManagement, "Button_Knowledge_SearchBTN")
local _editSearch = (UI.getChildControl)(Panel_KnowledgeManagement, "Edit_Knowledge_SearchBar")
local _textHelp = (UI.getChildControl)(Panel_KnowledgeManagement, "StaticText_Knowledge_Warning")
local _tabRemoveCard = (UI.getChildControl)(Panel_KnowledgeManagement, "Static_Knowledge_DeleteIcon")
local _tabCreateThemeBook = (UI.getChildControl)(Panel_KnowledgeManagement, "Static_Knowledge_BookCaseIcon")
local _tabCreateBook = (UI.getChildControl)(Panel_KnowledgeManagement, "Static_Knowledge_BookIcon")
_tabCreateBook:SetShow(false)
local _buttonRemoveKnowLedge = (UI.getChildControl)(Panel_KnowledgeManagement, "Button_Knowledge_DeleteBTN")
local _buttonMakeThemeBook = (UI.getChildControl)(Panel_KnowledgeManagement, "Button_Knowledge_BookCaseBTN")
local _buttonWinClose = (UI.getChildControl)(Panel_KnowledgeManagement, "Button_Win_Close")
local _buttonClose = (UI.getChildControl)(Panel_KnowledgeManagement, "Button_Knowledge_Close")
local _treeKnowledgeList = (UI.getChildControl)(Panel_KnowledgeManagement, "Tree_KnowledgeManage")
local _listKnowledgeList = (UI.getChildControl)(Panel_KnowledgeManagement, "List_KnowledgeManage")
local eventInputType = false
_tabRemoveCard:addInputEvent("Mouse_LUp", "HandleClicked_TabRemoveCard()")
_tabRemoveCard:addInputEvent("Mouse_On", "Knowledge_Tab_Simpletooltips( true, 0 )")
_tabRemoveCard:addInputEvent("Mouse_Out", "Knowledge_Tab_Simpletooltips( false )")
_tabCreateThemeBook:addInputEvent("Mouse_LUp", "HandleClicked_TabCreateThemeBook()")
_tabCreateThemeBook:addInputEvent("Mouse_On", "Knowledge_Tab_Simpletooltips( true, 1)")
_tabCreateThemeBook:addInputEvent("Mouse_Out", "Knowledge_Tab_Simpletooltips( false )")
_buttonRemoveKnowLedge:addInputEvent("Mouse_LUp", "HandleClicked_RemoveKnowledge()")
_buttonMakeThemeBook:addInputEvent("Mouse_LUp", "HandleClicked_MakeThemeBookMSG()")
_listKnowledgeList:addInputEvent("Mouse_LUp", "HandleClicked_SelectCard()")
_buttonSearch:addInputEvent("Mouse_LUp", "HandleClicked_SearchCard()")
_editSearch:RegistReturnKeyEvent("HandleClicked_SearchCard()")
_buttonWinClose:addInputEvent("Mouse_LUp", "KnowledgeClose()")
_buttonClose:addInputEvent("Mouse_LUp", "KnowledgeClose()")
_editSearch:addInputEvent("Mouse_LUp", "HandleClicked_KnowledgeManagement_Edit()")
_tabRemoveCard:setTooltipEventRegistFunc("Knowledge_Tab_Simpletooltips( true, 0 )")
_tabCreateThemeBook:setTooltipEventRegistFunc("Knowledge_Tab_Simpletooltips( true, 1)")
KnowledgeManagement_updateTheme = function(parentUIItem, theme)
  -- function num : 0_0 , upvalues : _treeKnowledgeList
  local childItem = _treeKnowledgeList:createRootItem()
  childItem:SetKey(-theme:getKey())
  local nameString = (theme:getName())
  local collected_complete = nil
  if theme:getCardCollectedCount() == theme:getCardCollectMaxCount() then
    collected_complete = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_LIST_COMPLETE")
    childItem:SetFontColor((Defines.Color).C_FF6DC6FF)
  else
    collected_complete = ""
    childItem:SetFontColor((Defines.Color).C_FFFFFFFF)
  end
  nameString = nameString .. " " .. collected_complete
  childItem:SetText(nameString)
  if parentUIItem == nil then
    _treeKnowledgeList:AddRootItem(childItem)
  else
    _treeKnowledgeList:AddItem(childItem, parentUIItem)
  end
  local childThemeCount = theme:getChildThemeCount()
  for idx = 0, childThemeCount - 1 do
    local childTheme = theme:getChildThemeByIndex(idx)
    if childTheme:isRemovable() then
      KnowledgeManagement_updateTheme(childItem, childTheme)
    end
  end
  local childCardCount = theme:getChildCardCount()
  for idx = 0, childCardCount - 1 do
    local childCard = theme:getChildCardByIndex(idx)
    if childCard:hasCard() then
      local childCardItem = _treeKnowledgeList:createChildItem()
      childCardItem:SetKey(childCard:getKey())
      childCardItem:SetText(childCard:getName())
      _treeKnowledgeList:AddItem(childCardItem, childItem)
    end
  end
end

local updateTreeKnowledge = function()
  -- function num : 0_1 , upvalues : _treeKnowledgeList
  _treeKnowledgeList:ClearTree()
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local mainTopTheme = knowledge:getMainTheme()
  local childThemeCount = mainTopTheme:getChildThemeCount()
  for index = 0, childThemeCount - 1 do
    local theme = mainTopTheme:getChildThemeByIndex(index)
    if theme:isRemovable() then
      KnowledgeManagement_updateTheme(nil, theme)
    end
  end
  _treeKnowledgeList:RefreshOpenList()
end

updateTreeCompletedTheme = function()
  -- function num : 0_2 , upvalues : _listKnowledgeList
  _listKnowledgeList:DeleteAll()
  local themeBook = ToClient_ThemeBookBegin()
  while nill ~= themeBook do
    _listKnowledgeList:AddItemWithLineFeed(themeBook:getName(), (Defines.Color).C_FF626262)
    themeBook = ToClient_ThemeBookNext()
  end
end

HandleClicked_RemoveKnowledge = function()
  -- function num : 0_3 , upvalues : _treeKnowledgeList, updateTreeKnowledge, eventInputType
  local CheckKnowledgeDelete = function()
    -- function num : 0_3_0 , upvalues : _treeKnowledgeList, updateTreeKnowledge
    local selectItem = _treeKnowledgeList:GetSelectItem()
    if selectItem == nil then
      return 
    end
    local mentalObjectKey = selectItem:GetKey()
    if mentalObjectKey == nil then
      return 
    end
    if mentalObjectKey > 0 then
      ToClient_RequestRemoveCard(mentalObjectKey)
      updateTreeKnowledge()
    end
    KnowledgeClose()
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_ACK_DELETEKNOWLEDGE"))
  end

  local selectItem = _treeKnowledgeList:GetSelectItem()
  if selectItem == nil then
    return 
  end
  local mentalObjectKey = selectItem:GetKey()
  if mentalObjectKey < 0 then
    return 
  end
  local selectItemName = selectItem:GetText()
  if eventInputType == true then
    messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_MSGBOX_DELETECONFIRM_ITEM", "selectItemName", selectItemName)
  else
    messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_MSGBOX_DELETECONFIRM_INTERACTION", "selectItemName", selectItemName)
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_MSGBOX_DELETECONFIRM_TITLE"), content = messageBoxMemo, functionYes = CheckKnowledgeDelete, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_MakeThemeBookMSG = function()
  -- function num : 0_4 , upvalues : _listKnowledgeList
  local index = _listKnowledgeList:GetSelectIndex()
  local themeBook = ToClient_GetThemeBookAt(index)
  if themeBook == nil then
    return 
  end
  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "GUILD_MESSAGEBOX_TITLE")
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_MSGBOX_MAKEBOOK_MEMO")
  local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = HandleClicked_MakeThemeBook, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

HandleClicked_MakeThemeBook = function()
  -- function num : 0_5 , upvalues : _listKnowledgeList
  local index = _listKnowledgeList:GetSelectIndex()
  local selfMoney = Int64toInt32((((getSelfPlayer()):get()):getInventory()):getMoney_s64())
  local themeBook = ToClient_GetThemeBookAt(index)
  ToClient_RequestMakeThemeBook(index)
  if tonumber(Int64toInt32(selfMoney)) < tonumber(Int64toInt32(themeBook:getNeedMoney())) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_ACK_MAKEBOOK"))
  end
end

HandleClicked_SelectCard = function()
  -- function num : 0_6 , upvalues : _listKnowledgeList, _textNeedValue
  local index = _listKnowledgeList:GetSelectIndex()
  local themeBook = ToClient_GetThemeBookAt(index)
  if themeBook then
    _textNeedValue:SetText(makeDotMoney(themeBook:getNeedMoney()))
  end
end

HandleClicked_SearchCard = function()
  -- function num : 0_7 , upvalues : _listKnowledgeList, _treeKnowledgeList, _editSearch, IM
  local index = _listKnowledgeList:GetSelectIndex()
  _treeKnowledgeList:SetFilterString(_editSearch:GetText())
  _treeKnowledgeList:RefreshOpenList()
  _treeKnowledgeList:SetSelectItem(index + 2)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ClearFocusEdit()
end

local changeTab = function(tabNo)
  -- function num : 0_8 , upvalues : _buttonRemoveKnowLedge, _buttonMakeThemeBook, _treeKnowledgeList, _listKnowledgeList, _buttonSearch, _editSearch, _textHelp, _textNeed, _textHave, _textNeedValue, _textHaveValue, updateTreeKnowledge
  if tabNo == 0 then
    _buttonRemoveKnowLedge:SetShow(true)
    _buttonMakeThemeBook:SetShow(false)
    _treeKnowledgeList:SetShow(true)
    _treeKnowledgeList:SetFilterString("")
    _listKnowledgeList:SetShow(false)
    _buttonSearch:SetShow(true)
    _editSearch:SetShow(true)
    _textHelp:SetShow(false)
    _textNeed:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_TEXT_NEED"))
    _textHave:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_TEXT_HAVE"))
    _textNeedValue:SetText("10")
    _textHaveValue:SetText(tostring((getSelfPlayer()):getWp()))
    updateTreeKnowledge()
  else
    if tabNo == 1 then
      _buttonRemoveKnowLedge:SetShow(false)
      _buttonMakeThemeBook:SetShow(true)
      _treeKnowledgeList:SetShow(false)
      _listKnowledgeList:SetShow(true)
      _buttonSearch:SetShow(false)
      _editSearch:SetShow(false)
      _textHelp:SetShow(true)
      _textNeed:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_TEXT_NEEDMONEY"))
      _textHave:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_TEXT_HAVEMONEY"))
      _textNeedValue:SetText("0")
      local selfMoney = (((getSelfPlayer()):get()):getInventory()):getMoney_s64()
      _textHaveValue:SetText(makeDotMoney(selfMoney))
      updateTreeCompletedTheme()
    end
  end
end

HandleClicked_TabRemoveCard = function()
  -- function num : 0_9 , upvalues : changeTab
  changeTab(0)
end

HandleClicked_TabCreateThemeBook = function()
  -- function num : 0_10 , upvalues : changeTab
  changeTab(1)
end

FGlobal_KnowledgeManagementShow = function()
  -- function num : 0_11 , upvalues : changeTab, _textNeed, _textNeedValue, IM, _tabCreateThemeBook, _buttonRemoveKnowLedge, _buttonClose, eventInputType
  if Panel_KnowledgeManagement:IsShow() then
    Panel_KnowledgeManagement:SetShow(false)
  else
    changeTab(0)
    Panel_KnowledgeManagement:SetShow(true)
    _textNeed:SetShow(true)
    _textNeedValue:SetShow(true)
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
    _tabCreateThemeBook:SetShow(true)
    _buttonRemoveKnowLedge:SetSpanSize(0, (_buttonRemoveKnowLedge:GetSpanSize()).y)
    _buttonClose:SetShow(false)
    KnowledgeManagementPosition()
    eventInputType = false
  end
end

FromClient_RemoveKnowledgeByItem = function()
  -- function num : 0_12 , upvalues : changeTab, _tabCreateThemeBook, _textNeed, _textNeedValue, _buttonClose, _buttonRemoveKnowLedge, eventInputType
  changeTab(0)
  _tabCreateThemeBook:SetShow(false)
  _textNeed:SetShow(false)
  _textNeedValue:SetShow(false)
  Panel_KnowledgeManagement:SetShow(true)
  _buttonClose:SetShow(true)
  _buttonRemoveKnowLedge:SetSpanSize(-80, (_buttonRemoveKnowLedge:GetSpanSize()).y)
  _buttonClose:SetSpanSize(80, (_buttonClose:GetSpanSize()).y)
  KnowledgeManagementPosition()
  eventInputType = true
end

FromClient_UpdateKnowledgeManage = function(isByItem)
  -- function num : 0_13 , upvalues : changeTab
  changeTab(0)
end

HandleClicked_KnowledgeManagement_Edit = function()
  -- function num : 0_14 , upvalues : _editSearch, IM
  SetFocusEdit(_editSearch)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

KnowledgeManagementPosition = function()
  -- function num : 0_15
  Panel_KnowledgeManagement:GetPosX((getScreenSizeX() - Panel_KnowledgeManagement:GetSizeX()) / 2)
  Panel_KnowledgeManagement:GetPosY((getScreenSizeY() - Panel_KnowledgeManagement:GetSizeY()) / 3)
end

KnowledgeClose = function()
  -- function num : 0_16 , upvalues : _editSearch, IM
  Panel_KnowledgeManagement:SetShow(false, false)
  ClearFocusEdit()
  _editSearch:SetEditText("", true)
  if AllowChangeInputMode() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  else
    SetFocusChatting()
  end
end

FGlobal_KnowledgeClose = function()
  -- function num : 0_17
  KnowledgeClose()
end

Knowledge_Tab_Simpletooltips = function(isShow, tabType)
  -- function num : 0_18 , upvalues : _tabRemoveCard, _tabCreateThemeBook
  local name, desc, uiControl = nil
  if tabType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_TOOLTIP_DELETE_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_TOOLTIP_DELETE_DESC")
    uiControl = _tabRemoveCard
  else
    if tabType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_TOOLTIP_MAKEBOOK_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_TOOLTIP_MAKEBOOK_DESC")
      uiControl = _tabCreateThemeBook
    end
  end
  if isShow == true then
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

registerEvent("FromClient_RemoveKnowledgeByItem", "FromClient_RemoveKnowledgeByItem")
registerEvent("FromClient_UpdateKnowledgeManage", "FromClient_UpdateKnowledgeManage")

