-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\quest\panel_quest_window.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local isContentsEnableMedia = ToClient_IsContentsGroupOpen("3")
local isContentsEnableValencia = ToClient_IsContentsGroupOpen("4")
local QuestListUIPool = {
_listGroupBG = {}
, 
_listExtendCheck = {}
, 
_listGroupTitle = {}
, 
_listGroupTitleSub = {}
, 
_listQuestTypeIcon = {}
, 
_listQuestTitle = {}
, 
_listQuestTitleBG = {}
, 
_listQuestCompleteDest = {}
, 
_listQuestCondition = {}
, 
_listQuestImage = {}
, 
_listQuestImageBoarder = {}
, 
_listQuestNaviButton = {}
, 
_listQuestAutoNaviButton = {}
, 
_listQuestGiveupButton = {}
, 
_listQuestRewardButton = {}
, 
_listQuestClearIcon = {}
, 
_listQuestNaviEffect = {}
, _countGroupBG = 0, _maxcountGroupBG = 20, _countExtendCheck = 0, _maxcountExtendCheck = 20, _countGroupTitle = 0, _maxcountGroupTitle = 20, _countGroupTitleSub = 0, _maxcountGroupTitleSub = 20, _countQuestTypeIcon = 0, _maxcountQuestTypeIcon = 30, _countQuestTitle = 0, _maxcountQuestTitle = 30, _countQuestTitleBG = 0, _maxcountQuestTitleBG = 30, _countQuestCompleteDest = 0, _maxcountQuestCompleteDest = 20, _countQuestCondition = 0, _maxcountQuestCondition = 30, _countQuestImage = 0, _maxcountQuestImage = 20, _countQuestImageBoarder = 0, _maxcountQuestImageBoarder = 20, _countQuestNaviButton = 0, _maxcountQuestNaviButton = 20, _countQuestAutoNaviButton = 0, _maxcountQuestAutoNaviButton = 20, _countQuestGiveupButton = 0, _maxcountQuestGiveupButton = 20, _countQuestRewardButton = 0, _maxcountQuestRewardButton = 20, _countQuestClearIcon = 0, _maxcountQuestClearIcon = 20, _countQuestNaviEffect = 0, _maxcountQuestNaviEffect = 20}
QuestListUIPool.prepareControl = function(self, Panel, parantControl, createdCotrolList, controlType, controlName, createCount)
  -- function num : 0_0
  local styleUI = (UI.getChildControl)(Panel, controlName)
  for index = 0, createCount do
    createdCotrolList[index] = (UI.createControl)(controlType, parantControl, controlName .. index)
    CopyBaseProperty(styleUI, createdCotrolList[index])
    ;
    (createdCotrolList[index]):SetShow(true)
  end
end

QuestListUIPool.initialize = function(self, stylePanel, parantControl)
  -- function num : 0_1 , upvalues : QuestListUIPool, UI_PUCT
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listGroupBG, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_GroupBG", self._maxcountGroupBG)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestCompleteDest, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_Quest_ClearNpc", self._maxcountQuestCompleteDest)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listGroupTitle, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_GroupQuest_Title", self._maxcountGroupTitle)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listGroupTitleSub, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_GroupQuest_Progress", self._maxcountGroupTitleSub)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listExtendCheck, UI_PUCT.PA_UI_CONTROL_CHECKBUTTON, "Checkbox_GroupQuest_ClearedQuest_Show", self._maxcountExtendCheck)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestTitleBG, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_Quest_Title_BG", self._maxcountQuestTitleBG)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestTitle, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_Quest_Title", self._maxcountQuestTitle)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestTypeIcon, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_Quest_Type", self._maxcountQuestTypeIcon)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestCondition, UI_PUCT.PA_UI_CONTROL_STATICTEXT, "StaticText_Quest_Demand", self._maxcountQuestCondition)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestImage, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_Quest_Image", self._maxcountQuestImage)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestImageBoarder, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_Quest_ImageBoarder", self._maxcountQuestImageBoarder)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestNaviEffect, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_Quest_Icon_NaviEffect", self._maxcountQuestNaviEffect)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestNaviButton, UI_PUCT.PA_UI_CONTROL_CHECKBUTTON, "Checkbox_Quest_Navi", self._maxcountQuestNaviButton)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestAutoNaviButton, UI_PUCT.PA_UI_CONTROL_CHECKBUTTON, "CheckButton_AutoNavi", self._maxcountQuestAutoNaviButton)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestGiveupButton, UI_PUCT.PA_UI_CONTROL_BUTTON, "Checkbox_Quest_Giveup", self._maxcountQuestGiveupButton)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestRewardButton, UI_PUCT.PA_UI_CONTROL_BUTTON, "Checkbox_Quest_Reward", self._maxcountQuestRewardButton)
  QuestListUIPool:prepareControl(stylePanel, parantControl, self._listQuestClearIcon, UI_PUCT.PA_UI_CONTROL_STATIC, "Static_Quest_Icon_ClearCheck", self._maxcountQuestClearIcon)
  QuestListUIPool:clear()
end

QuestListUIPool.newGroupBG = function(self)
  -- function num : 0_2
  self._countGroupBG = self._countGroupBG + 1
  return (self._listGroupBG)[self._countGroupBG - 1]
end

QuestListUIPool.newExtendButton = function(self)
  -- function num : 0_3
  self._countExtendCheck = self._countExtendCheck + 1
  return (self._listExtendCheck)[self._countExtendCheck - 1]
end

QuestListUIPool.newGroupTitle = function(self)
  -- function num : 0_4
  self._countGroupTitle = self._countGroupTitle + 1
  return (self._listGroupTitle)[self._countGroupTitle - 1]
end

QuestListUIPool.newGroupTitleSub = function(self)
  -- function num : 0_5
  self._countGroupTitleSub = self._countGroupTitleSub + 1
  return (self._listGroupTitleSub)[self._countGroupTitleSub - 1]
end

QuestListUIPool.newQuestTypeIcon = function(self)
  -- function num : 0_6
  self._countQuestTypeIcon = self._countQuestTypeIcon + 1
  return (self._listQuestTypeIcon)[self._countQuestTypeIcon - 1]
end

QuestListUIPool.newQuestTitle = function(self)
  -- function num : 0_7
  self._countQuestTitle = self._countQuestTitle + 1
  return (self._listQuestTitle)[self._countQuestTitle - 1]
end

QuestListUIPool.newQuestTitleBG = function(self)
  -- function num : 0_8
  self._countQuestTitleBG = self._countQuestTitleBG + 1
  return (self._listQuestTitleBG)[self._countQuestTitleBG - 1]
end

QuestListUIPool.newCompleteDest = function(self)
  -- function num : 0_9
  self._countQuestCompleteDest = self._countQuestCompleteDest + 1
  return (self._listQuestCompleteDest)[self._countQuestCompleteDest - 1]
end

QuestListUIPool.newQuestCondition = function(self)
  -- function num : 0_10
  self._countQuestCondition = self._countQuestCondition + 1
  return (self._listQuestCondition)[self._countQuestCondition - 1]
end

QuestListUIPool.newQuestImage = function(self)
  -- function num : 0_11
  self._countQuestImage = self._countQuestImage + 1
  return (self._listQuestImage)[self._countQuestImage - 1]
end

QuestListUIPool.newQuestImageBoarder = function(self)
  -- function num : 0_12
  self._countQuestImageBoarder = self._countQuestImageBoarder + 1
  return (self._listQuestImageBoarder)[self._countQuestImageBoarder - 1]
end

QuestListUIPool.newQuestNaviButton = function(self)
  -- function num : 0_13
  self._countQuestNaviButton = self._countQuestNaviButton + 1
  return (self._listQuestNaviButton)[self._countQuestNaviButton - 1]
end

QuestListUIPool.newQuestAutoNaviButton = function(self)
  -- function num : 0_14
  self._countQuestAutoNaviButton = self._countQuestAutoNaviButton + 1
  return (self._listQuestAutoNaviButton)[self._countQuestAutoNaviButton - 1]
end

QuestListUIPool.newQuestNaviEffect = function(self)
  -- function num : 0_15
  self._countQuestNaviEffect = self._countQuestNaviEffect + 1
  return (self._listQuestNaviEffect)[self._countQuestNaviEffect - 1]
end

QuestListUIPool.newQuestGiveupButton = function(self)
  -- function num : 0_16
  self._countQuestGiveupButton = self._countQuestGiveupButton + 1
  return (self._listQuestGiveupButton)[self._countQuestGiveupButton - 1]
end

QuestListUIPool.newQuestRewardButton = function(self)
  -- function num : 0_17
  self._countQuestRewardButton = self._countQuestRewardButton + 1
  return (self._listQuestRewardButton)[self._countQuestRewardButton - 1]
end

QuestListUIPool.newQuestClearIcon = function(self)
  -- function num : 0_18
  self._countQuestClearIcon = self._countQuestClearIcon + 1
  return (self._listQuestClearIcon)[self._countQuestClearIcon - 1]
end

QuestListUIPool.clear = function(self)
  -- function num : 0_19 , upvalues : QuestListUIPool
  self._countGroupBG = 0
  self._countExtendCheck = 0
  self._countGroupTitle = 0
  self._countGroupTitleSub = 0
  self._countQuestTypeIcon = 0
  self._countQuestTitle = 0
  self._countQuestTitleBG = 0
  self._countQuestCompleteDest = 0
  self._countQuestCondition = 0
  self._countQuestImage = 0
  self._countQuestImageBoarder = 0
  self._countQuestNaviButton = 0
  self._countQuestAutoNaviButton = 0
  self._countQuestGiveupButton = 0
  self._countQuestRewardButton = 0
  self._countQuestClearIcon = 0
  self._countQuestNaviEffect = 0
  QuestListUIPool:hideNotUse()
end

QuestListUIPool.hideNotUse = function(self)
  -- function num : 0_20
  for index = self._countGroupBG, self._maxcountGroupBG do
    ((self._listGroupBG)[index]):SetShow(false)
  end
  for index = self._countExtendCheck, self._maxcountExtendCheck do
    ((self._listExtendCheck)[index]):SetShow(false)
  end
  for index = self._countGroupTitle, self._maxcountGroupTitle do
    ((self._listGroupTitle)[index]):SetShow(false)
  end
  for index = self._countGroupTitleSub, self._maxcountGroupTitleSub do
    ((self._listGroupTitleSub)[index]):SetShow(false)
  end
  for index = self._countQuestTypeIcon, self._maxcountQuestTypeIcon do
    ((self._listQuestTypeIcon)[index]):SetShow(false)
  end
  for index = self._countQuestTitle, self._maxcountQuestTitle do
    ((self._listQuestTitle)[index]):SetShow(false)
  end
  for index = self._countQuestTitleBG, self._maxcountQuestTitleBG do
    ((self._listQuestTitleBG)[index]):SetShow(false)
  end
  for index = self._countQuestCompleteDest, self._maxcountQuestCompleteDest do
    ((self._listQuestCompleteDest)[index]):SetShow(false)
  end
  for index = self._countQuestCondition, self._maxcountQuestCondition do
    ((self._listQuestCondition)[index]):SetShow(false)
  end
  for index = self._countQuestImage, self._maxcountQuestImage do
    ((self._listQuestImage)[index]):SetShow(false)
  end
  for index = self._countQuestImageBoarder, self._maxcountQuestImageBoarder do
    ((self._listQuestImageBoarder)[index]):SetShow(false)
  end
  for index = self._countQuestNaviButton, self._maxcountQuestNaviButton do
    ((self._listQuestNaviButton)[index]):SetShow(false)
  end
  for index = self._countQuestAutoNaviButton, self._maxcountQuestAutoNaviButton do
    ((self._listQuestAutoNaviButton)[index]):SetShow(false)
  end
  for index = self._countQuestNaviEffect, self._maxcountQuestNaviEffect do
    ((self._listQuestNaviEffect)[index]):SetShow(false)
  end
  for index = self._countQuestGiveupButton, self._maxcountQuestGiveupButton do
    ((self._listQuestGiveupButton)[index]):SetShow(false)
  end
  for index = self._countQuestRewardButton, self._maxcountQuestRewardButton do
    ((self._listQuestRewardButton)[index]):SetShow(false)
  end
  for index = self._countQuestClearIcon, self._maxcountQuestClearIcon do
    ((self._listQuestClearIcon)[index]):SetShow(false)
  end
end

Panel_Window_Quest_New:SetShow(false)
Panel_Window_Quest_New:setGlassBackground(true)
Panel_Window_Quest_New:ActiveMouseEventEffect(true)
Panel_Window_Quest_New:setMaskingChild(true)
Panel_Window_Quest_New:RegisterShowEventFunc(true, "Panel_QuestListShowAni()")
Panel_Window_Quest_New:RegisterShowEventFunc(false, "Panel_QuestListHideAni()")
Panel_Window_Quest_New:addInputEvent("Mouse_DownScroll", "QuestWindow_ScrollEvent(true)")
Panel_Window_Quest_New:addInputEvent("Mouse_UpScroll", "QuestWindow_ScrollEvent(false)")
Panel_Window_Quest_New:SetPosX(getScreenSizeX() - getScreenSizeX() / 2)
local _buttonClose = (UI.getChildControl)(Panel_Window_Quest_New, "Button_Win_Close")
_buttonClose:addInputEvent("Mouse_LUp", "Panel_Window_QuestNew_Show( false )")
local _buttonQuestion = (UI.getChildControl)(Panel_Window_Quest_New, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "")
local questListWindow_BG = (UI.getChildControl)(Panel_Window_Quest_New, "Static_BG")
questListWindow_BG:SetNotAbleMasking(true)
questListWindow_BG:setGlassBackground(true)
local MAX_QUEST_FAVOR_TYPE = 6
local questFavorType = {}
for ii = 0, MAX_QUEST_FAVOR_TYPE - 1 do
  local controlIdNumber = ii + 1
  local controlId = "CheckButton_FavorType_" .. tostring(controlIdNumber)
  local control = (UI.getChildControl)(Panel_Window_Quest_New, controlId)
  control:addInputEvent("Mouse_LUp", "QuestWindow_SelectQuestFavorType(" .. ii .. ")")
  questFavorType[ii] = control
end
QuestWindow_SelectQuestFavorType = function(selectType)
  -- function num : 0_21
  if selectType == 0 then
    _update_QuestWindowSetCheckAll()
  else
    ToClient_ToggleQuestSelectType(selectType)
  end
  FGlobal_UpdateQuestFavorType()
end

_update_QuestWindowSetCheckAll = function()
  -- function num : 0_22 , upvalues : questFavorType, MAX_QUEST_FAVOR_TYPE
  local isCheck = (questFavorType[0]):IsCheck()
  for i = 1, MAX_QUEST_FAVOR_TYPE - 1 do
    if isCheck == not (questFavorType[i]):IsCheck() then
      ToClient_ToggleQuestSelectType(i)
      ;
      (questFavorType[i]):SetCheck(isCheck)
    end
  end
end

QuestWindow_NationalCheck = function()
  -- function num : 0_23
  if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_RUS) then
    _update_QuestWindowSetCheckAll()
  end
end

updateQuestWindowFavorType = function()
  -- function num : 0_24 , upvalues : MAX_QUEST_FAVOR_TYPE, questFavorType
  local allButtonCheck = true
  local QuestListInfo = ToClient_GetQuestList()
  for ii = 1, MAX_QUEST_FAVOR_TYPE - 1 do
    local bChecked = QuestListInfo:isQuestSelectType(ii)
    ;
    (questFavorType[ii]):SetCheck(bChecked)
    ;
    (questFavorType[ii]):SetMonoTone(bChecked)
    if bChecked == false then
      (questFavorType[0]):SetMonoTone(true)
      allButtonCheck = false
    end
    if allButtonCheck == true then
      (questFavorType[ii]):SetMonoTone(false)
      ;
      (questFavorType[0]):SetMonoTone(false)
    else
      if bChecked == true then
        (questFavorType[ii]):SetMonoTone(false)
      else
        ;
        (questFavorType[ii]):SetMonoTone(true)
      end
    end
  end
  ;
  (questFavorType[0]):SetCheck(allButtonCheck)
end

local questListWindow_ContentBG = (UI.getChildControl)(Panel_Window_Quest_New, "Static_LineBG")
questListWindow_ContentBG:SetNotAbleMasking(true)
questListWindow_ContentBG:SetAlpha(0.8)
questListWindow_ContentBG:SetIgnore(false)
questListWindow_ContentBG:addInputEvent("Mouse_DownScroll", "QuestWindow_ScrollEvent(true)")
questListWindow_ContentBG:addInputEvent("Mouse_UpScroll", "QuestWindow_ScrollEvent(false)")
local questCount = (UI.getChildControl)(Panel_Window_Quest_New, "StaticText_QuestCount")
local filter_Zone = (UI.getChildControl)(Panel_Window_Quest_New, "Combobox_Filter_Zone")
local filter_Zone_Box = (UI.getChildControl)(filter_Zone, "Combobox_List")
local filter_Zone_Scroll = (UI.getChildControl)(filter_Zone_Box, "Combobox_List_Scroll")
filter_Zone:addInputEvent("Mouse_LUp", "_questWindow_ToggleFilterZone()")
local filter_QuestType = (UI.getChildControl)(Panel_Window_Quest_New, "Combobox_Filter_QuestType")
local filter_QuestType_Box = (UI.getChildControl)(filter_QuestType, "Combobox_List")
local filter_QuestType_Scroll = (UI.getChildControl)(filter_QuestType_Box, "Combobox_List_Scroll")
filter_QuestType:addInputEvent("Mouse_LUp", "_questWindow_ToggleFilterQuestType()")
local questListWindow_ScrollBar = (UI.getChildControl)(Panel_Window_Quest_New, "Scroll_CheckQuestList")
questListWindow_ScrollBar:SetShow(true)
questListWindow_ScrollBar:SetControlTop()
questListWindow_ScrollBar:addInputEvent("Mouse_LPress", "QuestWindow_ScrollLPress()")
questListWindow_ScrollBar:SetPosX(Panel_Window_Quest_New:GetSizeX() - questListWindow_ScrollBar:GetSizeX() - 15)
local questListWindow_ScrollBar_CtrBT = (UI.getChildControl)(questListWindow_ScrollBar, "Scroll_CtrlButton")
questListWindow_ScrollBar_CtrBT:addInputEvent("Mouse_LPress", "QuestWindow_ScrollLPress()")
local helpWidgetBase = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_1")
local ButtonTooltip = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_Quest_New, "HelpWindow_For_QuestWindow")
CopyBaseProperty(helpWidgetBase, ButtonTooltip)
ButtonTooltip:SetColor(UI_color.C_FFFFFFFF)
ButtonTooltip:SetAlpha(1)
ButtonTooltip:SetFontColor(UI_color.C_FFC4BEBE)
ButtonTooltip:SetAutoResize(true)
ButtonTooltip:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
ButtonTooltip:SetShow(false)
local _buttonQuestion = (UI.getChildControl)(Panel_Window_Quest_New, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelQuestHistory\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelQuestHistory\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelQuestHistory\", \"false\")")
QuestListUIPool:initialize(Panel_CheckedQuest, Panel_Window_Quest_New)
local _startPosition = 0
local _setLastQuestOfList = 0
local _questGroupCount = 0
local _next_QuestPosY = 0
local list_Space = 10
local temp_GroupSizeY = 110
local questObjectCount = 0
local displayGroupQuestCount = 0
local _scrollBar_MoveOneStep = 0
local _isDontDownScroll = false
local filterZone_id = -1
local filterQuestType_id = -1
Panel_QuestListShowAni = function()
  -- function num : 0_25 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_Window_Quest_New:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.05)
  aniInfo1.AxisX = Panel_Window_Quest_New:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_Quest_New:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_Quest_New:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.05)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_Quest_New:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_Quest_New:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_QuestListHideAni = function()
  -- function num : 0_26 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_Quest_New:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_Quest_New:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

QuestWindow_ScrollBar_initialize = function()
  -- function num : 0_27 , upvalues : questListWindow_ScrollBar, _questGroupCount
  questListWindow_ScrollBar:SetInterval(_questGroupCount - 1)
end

QuestWindow_ScrollEvent = function(UpDown)
  -- function num : 0_28 , upvalues : _startPosition, _isDontDownScroll
  local prevPos = _startPosition
  if UpDown == true then
    if _isDontDownScroll == true then
      return 
    end
    _startPosition = _startPosition + 1
  else
    if _startPosition <= 0 then
      return 
    end
    _startPosition = _startPosition - 1
  end
  if prevPos ~= _startPosition then
    updateQuestWindowList(_startPosition)
    questWindow_updateScrollPosition()
  end
end

local _scrollBar_LPress_Pos = 0
local _maxscrollBarPos = 0
QuestWindow_ScrollLPress = function()
  -- function num : 0_29 , upvalues : _startPosition, questListWindow_ScrollBar, _questGroupCount, _isDontDownScroll
  local prevPos = _startPosition
  local currentPos = (math.floor)(questListWindow_ScrollBar:GetControlPos() * (_questGroupCount - 1) + 0.5)
  if prevPos ~= currentPos then
    if prevPos < _startPosition and _isDontDownScroll then
      return 
    end
    _startPosition = currentPos
    updateQuestWindowList(_startPosition)
  end
end

questWindow_updateScrollButtonSize = function()
  -- function num : 0_30 , upvalues : questListWindow_ScrollBar, temp_GroupSizeY, _questGroupCount, questListWindow_ScrollBar_CtrBT
  questListWindow_ScrollBar:SetSize(questListWindow_ScrollBar:GetSizeX(), Panel_Window_Quest_New:GetSizeY() - 80 - 20)
  local scrollButtonSizePercent = (Panel_Window_Quest_New:GetSizeY() - 80) / temp_GroupSizeY / _questGroupCount * 100
  if scrollButtonSizePercent < 10 then
    scrollButtonSizePercent = 10
  else
    if scrollButtonSizePercent > 99 then
      scrollButtonSizePercent = 99
    end
  end
  questListWindow_ScrollBar_CtrBT:SetSize(questListWindow_ScrollBar_CtrBT:GetSizeX(), questListWindow_ScrollBar:GetSizeY() / 100 * scrollButtonSizePercent)
end

questWindow_updateScrollPosition = function()
  -- function num : 0_31 , upvalues : questListWindow_ScrollBar, _startPosition, _questGroupCount, questListWindow_ScrollBar_CtrBT
  local posY = questListWindow_ScrollBar:GetSizeY() * (_startPosition / _questGroupCount)
  local maxPosY = questListWindow_ScrollBar:GetSizeY() - questListWindow_ScrollBar_CtrBT:GetSizeY()
  if maxPosY < posY then
    questListWindow_ScrollBar_CtrBT:SetPosY(maxPosY)
  else
    questListWindow_ScrollBar_CtrBT:SetPosY(posY)
  end
end

local create_QuestFilter = function()
  -- function num : 0_32 , upvalues : filter_Zone, UI_color, isContentsEnableMedia, isContentsEnableValencia, filter_QuestType
  filter_Zone:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_1"))
  filter_Zone:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_2"), UI_color.C_FFC4BEBE)
  filter_Zone:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_3"), UI_color.C_FFC4BEBE)
  filter_Zone:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_4"), UI_color.C_FFC4BEBE)
  filter_Zone:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_5"), UI_color.C_FFC4BEBE)
  filter_Zone:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_6"), UI_color.C_FFC4BEBE)
  filter_Zone:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_7"), UI_color.C_FFC4BEBE)
  if isContentsEnableMedia then
    filter_Zone:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_15"), UI_color.C_FFC4BEBE)
  end
  if isContentsEnableValencia then
    filter_Zone:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_16"), UI_color.C_FFC4BEBE)
  end
  filter_QuestType:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_1"), UI_color.C_FFC4BEBE)
  filter_QuestType:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_8"), UI_color.C_FFC4BEBE)
  filter_QuestType:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_9"), UI_color.C_FFC4BEBE)
  filter_QuestType:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_10"), UI_color.C_FFC4BEBE)
  filter_QuestType:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_11"), UI_color.C_FFC4BEBE)
  filter_QuestType:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_12"), UI_color.C_FFC4BEBE)
  filter_QuestType:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_13"), UI_color.C_FFC4BEBE)
  filter_QuestType:AddItem(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_FILTER_ZONE_14"), UI_color.C_FFC4BEBE)
end

create_QuestFilter()
local filterZoneSelectedId = -1
_questWindow_ToggleFilterZone = function()
  -- function num : 0_33 , upvalues : filter_Zone, filterZoneSelectedId, filter_Zone_Scroll, filter_QuestType_Scroll
  Panel_Window_Quest_New:SetChildIndex(filter_Zone, 9999)
  local list = filter_Zone:GetListControl()
  list:addInputEvent("Mouse_LUp", "_questWindow_ToggleFilterZoneSelect()")
  if filterZoneSelectedId ~= -1 then
    filter_Zone:SetSelectItemKey(filterZoneSelectedId)
  end
  local tmp = filter_Zone:GetListControl()
  local listCount = tmp:GetItemSize()
  tmp:SetSize(tmp:GetSizeX(), listCount * 20)
  filter_Zone_Scroll:SetSize(filter_QuestType_Scroll:GetSizeX(), tmp:GetSizeY())
  tmp:SetItemQuantity(listCount)
  filter_Zone:ToggleListbox()
end

_questWindow_ToggleFilterZoneSelect = function()
  -- function num : 0_34 , upvalues : filter_Zone, filterZone_id, filterZoneSelectedId
  local selectIndex = filter_Zone:GetSelectIndex()
  if selectIndex == 0 then
    filterZone_id = -1
    filterZoneSelectedId = 0
  else
    if selectIndex == 1 then
      filterZone_id = 1
      filterZoneSelectedId = 1
    else
      if selectIndex == 2 then
        filterZone_id = 2
        filterZoneSelectedId = 2
      else
        if selectIndex == 3 then
          filterZone_id = 3
          filterZoneSelectedId = 3
        else
          if selectIndex == 4 then
            filterZone_id = 4
            filterZoneSelectedId = 4
          else
            if selectIndex == 5 then
              filterZone_id = 5
              filterZoneSelectedId = 5
            else
              if selectIndex == 6 then
                filterZone_id = 6
                filterZoneSelectedId = 6
              else
                if selectIndex == 7 then
                  filterZone_id = 7
                  filterZoneSelectedId = 7
                else
                  if selectIndex == 8 then
                    filterZone_id = 8
                    filterZoneSelectedId = 8
                  else
                    filterZone_id = -1
                    filterZoneSelectedId = 0
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  ToClient_SetQuestRegionFilter(filterZone_id)
  filter_Zone:SetSelectItemKey(filterZoneSelectedId)
  _questWindow_ToggleFilterZone()
end

local filterQuestTypeSelectedId = -1
_questWindow_ToggleFilterQuestType = function()
  -- function num : 0_35 , upvalues : filter_QuestType, filterQuestTypeSelectedId, filter_QuestType_Scroll
  Panel_Window_Quest_New:SetChildIndex(filter_QuestType, 9999)
  local list = filter_QuestType:GetListControl()
  list:addInputEvent("Mouse_LUp", "_questWindow_ToggleFilterQuestTypeSelect()")
  if filterQuestTypeSelectedId ~= -1 then
    filter_QuestType:SetSelectItemKey(filterQuestTypeSelectedId)
  end
  local tmp = filter_QuestType:GetListControl()
  local listCount = tmp:GetItemSize()
  tmp:SetSize(tmp:GetSizeX(), listCount * 20)
  filter_QuestType_Scroll:SetSize(filter_QuestType_Scroll:GetSizeX(), tmp:GetSizeY())
  tmp:SetItemQuantity(listCount)
  filter_QuestType:ToggleListbox()
end

_questWindow_ToggleFilterQuestTypeSelect = function()
  -- function num : 0_36 , upvalues : filter_QuestType, filterQuestType_id, filterQuestTypeSelectedId
  local selectIndex = filter_QuestType:GetSelectIndex()
  if selectIndex == 0 then
    filterQuestType_id = -1
    filterQuestTypeSelectedId = 0
  else
    if selectIndex == 1 then
      filterQuestType_id = 0
      filterQuestTypeSelectedId = 1
    else
      if selectIndex == 2 then
        filterQuestType_id = 1
        filterQuestTypeSelectedId = 2
      else
        if selectIndex == 3 then
          filterQuestType_id = 2
          filterQuestTypeSelectedId = 3
        else
          if selectIndex == 4 then
            filterQuestType_id = 3
            filterQuestTypeSelectedId = 4
          else
            if selectIndex == 5 then
              filterQuestType_id = 4
              filterQuestTypeSelectedId = 5
            else
              if selectIndex == 6 then
                filterQuestType_id = 5
                filterQuestTypeSelectedId = 6
              else
                if selectIndex == 7 then
                  filterQuestType_id = 6
                  filterQuestTypeSelectedId = 7
                else
                  if selectIndex == 8 then
                    filterQuestType_id = 7
                    filterQuestTypeSelectedId = 8
                  else
                    if selectIndex == 9 then
                      filterQuestType_id = 8
                      filterQuestTypeSelectedId = 9
                    else
                      filterQuestType_id = -1
                      filterQuestTypeSelectedId = 0
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
  ToClient_SetQuestTypeFilter(filterQuestType_id)
  _questWindow_ToggleFilterQuestType()
end

FromClient_QuestWindow_Update = function()
  -- function num : 0_37 , upvalues : _startPosition
  questWindow_updateScrollButtonSize()
  updateQuestWindowList(_startPosition)
end

questWindow_GetProgressCount = function()
  -- function num : 0_38
  local questListInfo = ToClient_GetQuestList()
  local temp_questGroupCount = questListInfo:getQuestGroupCount()
  local temp_progressCount = 0
  for questGroupIndex = 0, temp_questGroupCount - 1 do
    local temp_questGroupInfo = questListInfo:getQuestGroupAt(questGroupIndex)
    if temp_questGroupInfo:isGroupQuest() == true then
      local tempGroupCount = temp_questGroupInfo:getQuestCount()
      for questGroupIdx = 0, tempGroupCount - 1 do
        local tempQuestInfo = temp_questGroupInfo:getQuestAt(questGroupIdx)
        if tempQuestInfo._isProgressing and not tempQuestInfo._isCleared then
          temp_progressCount = temp_progressCount + 1
        end
      end
    else
      do
        do
          local tempQuestInfo = temp_questGroupInfo:getQuestAt(questGroupIdx)
          if tempQuestInfo._isProgressing and not tempQuestInfo._isCleared then
            temp_progressCount = temp_progressCount + 1
          end
          -- DECOMPILER ERROR at PC44: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC44: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC44: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return temp_progressCount
end

updateQuestWindowList = function(startPosition)
  -- function num : 0_39 , upvalues : _maxscrollBarPos, QuestListUIPool, _next_QuestPosY, displayGroupQuestCount, _questGroupCount, questListWindow_ScrollBar, _isDontDownScroll, questCount, questObjectCount, _scrollBar_LPress_Pos, _startPosition
  if _maxscrollBarPos ~= 0 and _maxscrollBarPos < startPosition then
    startPosition = _maxscrollBarPos
  end
  QuestListUIPool:clear()
  _next_QuestPosY = 135
  displayGroupQuestCount = 0
  local questListInfo = ToClient_GetQuestList()
  _questGroupCount = questListInfo:getQuestGroupCount() - 1
  questListWindow_ScrollBar:SetInterval(_questGroupCount - 2)
  if _questGroupCount + 1 == 0 then
    questListWindow_ScrollBar:SetShow(false)
    return 
  else
    questListWindow_ScrollBar:SetShow(true)
    for questGroupIndex = startPosition, _questGroupCount do
      local questGroupInfo = questListInfo:getQuestGroupAt(questGroupIndex)
      local uiGroupCheckBTN = QuestListUIPool:newExtendButton()
      uiGroupCheckBTN:SetPosY(_next_QuestPosY - 5)
      uiGroupCheckBTN:SetPosX(15)
      if ((getSelfPlayer()):get()):getLevel() > 10 then
        uiGroupCheckBTN:SetShow(true)
      else
        uiGroupCheckBTN:SetShow(false)
      end
      uiGroupCheckBTN:addInputEvent("Mouse_LUp", "HandleClicked_QuestShowCheck(" .. (questGroupInfo:getQuestNo())._group .. "," .. (questGroupInfo:getQuestNo())._quest .. ")")
      if questGroupInfo:isCheckShow() == true then
        uiGroupCheckBTN:SetCheck(true)
      else
        uiGroupCheckBTN:SetCheck(false)
      end
      if questGroupInfo:isGroupQuest() == true then
        _next_QuestPosY = QuestWindow_GroupQuestInfo(questGroupInfo, _next_QuestPosY, questGroupIndex)
      else
        local uiQuestInfo = questGroupInfo:getQuestAt(0)
        _next_QuestPosY = QuestWindow_QuestInfo(questGroupInfo, uiQuestInfo, _next_QuestPosY, true, questGroupIndex, 0, nil, 0)
      end
      do
        do
          if Panel_Window_Quest_New:GetSizeY() < _next_QuestPosY then
            _maxscrollBarPos = 0
            _isDontDownScroll = false
            questListWindow_ScrollBar:SetShow(true)
            break
          else
            _maxscrollBarPos = startPosition
            _isDontDownScroll = true
            if startPosition == 0 then
              questListWindow_ScrollBar:SetShow(false)
            end
          end
          -- DECOMPILER ERROR at PC145: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
    questCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_COUNTQUEST", "count", questWindow_GetProgressCount()))
    questObjectCount = 0
    _scrollBar_LPress_Pos = 0
  end
  if _startPosition == 0 then
    questWindow_updateScrollButtonSize()
  end
end

QuestWindow_GroupQuestInfo = function(questGroupInfo, _next_QuestPosY, questGroupIndex)
  -- function num : 0_40 , upvalues : QuestListUIPool, UI_color
  local tmp_next_GroupPosY = _next_QuestPosY
  local tmp_Quest_ClearCount = 0
  local tmp_Quest_Clear = 0
  local questGroupTitle = questGroupInfo:getTitle()
  local questGroupCount = questGroupInfo:getTotalQuestCount()
  local uiGroupTitle = QuestListUIPool:newGroupTitle()
  uiGroupTitle:SetFontColor(UI_color.C_FFEEBA3E)
  uiGroupTitle:SetAutoResize(true)
  uiGroupTitle:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  uiGroupTitle:SetText(questGroupTitle)
  uiGroupTitle:SetTextSpan(10, -1)
  uiGroupTitle:SetShow(true)
  uiGroupTitle:SetPosY(tmp_next_GroupPosY - 4)
  uiGroupTitle:SetPosX(35)
  uiGroupTitle:SetSize(400, uiGroupTitle:GetSizeY())
  uiGroupTitle:SetIgnore(false)
  uiGroupTitle:addInputEvent("Mouse_DownScroll", "QuestWindow_ScrollEvent(true)")
  uiGroupTitle:addInputEvent("Mouse_UpScroll", "QuestWindow_ScrollEvent(false)")
  local uiGroupProgress = QuestListUIPool:newGroupTitleSub()
  uiGroupProgress:SetTextSpan(10, 1)
  uiGroupProgress:SetShow(true)
  uiGroupProgress:SetPosY(tmp_next_GroupPosY - 5)
  uiGroupProgress:SetPosX(uiGroupTitle:GetPosX() + uiGroupTitle:GetSizeX() - uiGroupProgress:GetSizeX())
  tmp_next_GroupPosY = tmp_next_GroupPosY + uiGroupTitle:GetSizeY() + 5
  for questIndex = 0, questGroupInfo:getQuestCount() - 1 do
    local uiQuestInfo = questGroupInfo:getQuestAt(questIndex)
    tmp_next_GroupPosY = QuestWindow_QuestInfo(questGroupInfo, uiQuestInfo, tmp_next_GroupPosY, false, questGroupIndex, questIndex, questGroupTitle, questGroupCount)
    tmp_Quest_ClearCount = tmp_Quest_ClearCount + tmp_Quest_Clear
  end
  uiGroupProgress:SetText(tmp_Quest_ClearCount .. "/" .. questGroupInfo:getTotalQuestCount() .. " " .. PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST_COMPLETE"))
  return tmp_next_GroupPosY
end

QuestWindow_QuestInfo = function(questGroupInfo, uiQuestInfo, _next_QuestPosY, isSingle, questGroupIndex, questIndex, groupTitle, questGroupCount)
  -- function num : 0_41 , upvalues : questObjectCount
  local tmp_next_QuestPosY = _next_QuestPosY
  local questCondition_Check = {}
  local questCondition_AllCheck = 0
  local tmp_Quest_Clear = 0
  questObjectCount = questObjectCount + 1
  local QuestGroupId = (uiQuestInfo:getQuestNo())._group
  local QuestId = (uiQuestInfo:getQuestNo())._quest
  -- DECOMPILER ERROR at PC25: Unhandled construct in 'MakeBoolean' P1

  if uiQuestInfo._isCleared == true and questObjectCount < 21 then
    tmp_next_QuestPosY = _questWindownInfo_Cleared(uiQuestInfo, tmp_next_QuestPosY, tmp_Quest_Clear)
  end
  if uiQuestInfo._isCleared == false and uiQuestInfo._isProgressing == false then
    tmp_next_QuestPosY = _questWindowInfo_Next(uiQuestInfo, QuestGroupId, QuestId, tmp_next_QuestPosY)
  else
    tmp_next_QuestPosY = _questWindowInfo_Progressing(questGroupInfo, uiQuestInfo, QuestGroupId, QuestId, tmp_next_QuestPosY, isSingle, groupTitle, questGroupCount)
  end
  return tmp_next_QuestPosY, tmp_Quest_Clear
end

_questWindownInfo_Cleared = function(uiQuestInfo, tmp_next_QuestPosY, tmp_Quest_Clear)
  -- function num : 0_42 , upvalues : QuestListUIPool, UI_color, list_Space
  local uiQuestTypeIcon = QuestListUIPool:newQuestTypeIcon()
  uiQuestTypeIcon:SetPosY(tmp_next_QuestPosY - 6)
  uiQuestTypeIcon:SetShow(true)
  FGlobal_ChangeOnTextureForDialogQuestIcon(uiQuestTypeIcon, uiQuestInfo:getQuestType())
  tmp_next_QuestPosY = tmp_next_QuestPosY + 4
  local uiQuestTitleBG = QuestListUIPool:newQuestTitleBG()
  local questTitle = uiQuestInfo:getTitle()
  local uiQuestTitle = QuestListUIPool:newQuestTitle()
  uiQuestTitleBG:SetPosY(tmp_next_QuestPosY - 10)
  uiQuestTitleBG:SetShow(true)
  uiQuestTitle:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_COMPLETEQUEST", "questTitle", questTitle))
  uiQuestTitle:SetFontColor(UI_color.C_FF888888)
  uiQuestTitle:SetPosY(tmp_next_QuestPosY - list_Space)
  uiQuestTitle:SetLineRender(true)
  uiQuestTitle:SetShow(true)
  uiQuestTitle:addInputEvent("Mouse_LUp", "FGlobal_QuestInfoDetail_Close()")
  if isSingle == true then
    uiQuestTitleBG:SetPosX(30)
    uiQuestTitle:SetPosX(55)
    uiQuestTypeIcon:SetPosX(35)
  else
    uiQuestTitleBG:SetPosX(60)
    uiQuestTitle:SetPosX(85)
    uiQuestTypeIcon:SetPosX(65)
  end
  tmp_Quest_Clear = tmp_Quest_Clear + 1
  tmp_next_QuestPosY = tmp_next_QuestPosY + list_Space * 2
  return tmp_next_QuestPosY, tmp_Quest_Clear
end

_questWindowInfo_Next = function(uiQuestInfo, questGroupId, questId, tmp_next_QuestPosY)
  -- function num : 0_43 , upvalues : QuestListUIPool, list_Space
  local uiQuestTypeIcon = QuestListUIPool:newQuestTypeIcon()
  uiQuestTypeIcon:SetPosY(tmp_next_QuestPosY - 6)
  uiQuestTypeIcon:SetShow(true)
  FGlobal_ChangeOnTextureForDialogQuestIcon(uiQuestTypeIcon, uiQuestInfo:getQuestType())
  tmp_next_QuestPosY = tmp_next_QuestPosY + 4
  local uiQuestTitleBG = QuestListUIPool:newQuestTitleBG()
  local uiQuestTitle = QuestListUIPool:newQuestTitle()
  uiQuestTitleBG:SetPosY(tmp_next_QuestPosY - 10)
  uiQuestTitleBG:SetShow(true)
  if uiQuestInfo:getQuestType() == 0 then
    uiQuestTitle:SetFontColor(4290209076)
    uiQuestTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_NEXTQUEST_NOTYET_BLACKSPIRIT"))
  else
    uiQuestTitle:SetFontColor(4287405590)
    uiQuestTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_NEXTQUEST_NOTYET_OTHER"))
  end
  uiQuestTitle:SetPosY(tmp_next_QuestPosY - list_Space)
  uiQuestTitle:SetLineRender(false)
  uiQuestTitle:SetShow(true)
  uiQuestTitle:addInputEvent("Mouse_LUp", "FGlobal_QuestInfoDetail_Close()")
  local uiQuestNaviButton = QuestListUIPool:newQuestNaviButton()
  local uiQuestAutoNaviButton = QuestListUIPool:newQuestAutoNaviButton()
  if uiQuestInfo:getQuestType() ~= 0 then
    uiQuestNaviButton:SetPosY(tmp_next_QuestPosY - 8)
    uiQuestNaviButton:SetShow(true)
    uiQuestAutoNaviButton:SetPosY(tmp_next_QuestPosY - 8)
    uiQuestAutoNaviButton:SetShow(true)
    local _questGroupId, _questId, _naviInfoAgain = _QuestWidget_ReturnQuestState()
    if _questGroupId == questGroupId and _questId == questId then
      if _naviInfoAgain == true then
        uiQuestNaviButton:SetCheck(false)
        uiQuestAutoNaviButton:SetCheck(false)
      else
        if uiQuestAutoNaviButton:IsCheck() == true then
          uiQuestAutoNaviButton:SetCheck(true)
          uiQuestNaviButton:SetCheck(true)
        else
          uiQuestAutoNaviButton:SetCheck(false)
          uiQuestNaviButton:SetCheck(true)
        end
      end
    else
      uiQuestNaviButton:SetCheck(false)
      uiQuestAutoNaviButton:SetCheck(false)
    end
    uiQuestNaviButton:addInputEvent("Mouse_On", "QuestWindow_questButtonToolTip( true, \"navi\" )")
    uiQuestNaviButton:addInputEvent("Mouse_Out", "QuestWindow_questButtonToolTip( false, \"navi\" )")
    uiQuestNaviButton:addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. 99 .. ", false)")
    uiQuestTitle:addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. 99 .. ", false)")
  end
  do
    if isSingle == true then
      uiQuestTitleBG:SetPosX(30)
      uiQuestTitle:SetPosX(55)
      uiQuestTypeIcon:SetPosX(35)
    else
      uiQuestTitleBG:SetPosX(60)
      uiQuestTitle:SetPosX(85)
      uiQuestTypeIcon:SetPosX(65)
    end
    tmp_next_QuestPosY = tmp_next_QuestPosY + list_Space * 2
    return tmp_next_QuestPosY
  end
end

_questWindowInfo_Progressing = function(questGroupInfo, uiQuestInfo, questGroupId, questId, tmp_next_QuestPosY, isSingle, groupTitle, questGroupCount)
  -- function num : 0_44 , upvalues : QuestListUIPool, list_Space, UI_color, questListWindow_ContentBG, displayGroupQuestCount
  local selfLevel = ((getSelfPlayer()):get()):getLevel()
  if groupTitle == nil then
    groupTitle = "nil"
  end
  local progressingStartPosY = tmp_next_QuestPosY
  local uigroupBG = QuestListUIPool:newGroupBG()
  uigroupBG:SetShow(true)
  uigroupBG:SetPosY(tmp_next_QuestPosY - 6)
  uigroupBG:addInputEvent("Mouse_DownScroll", "QuestWindow_ScrollEvent(true)")
  uigroupBG:addInputEvent("Mouse_UpScroll", "QuestWindow_ScrollEvent(false)")
  local uiQuestTypeIcon = QuestListUIPool:newQuestTypeIcon()
  uiQuestTypeIcon:SetPosY(tmp_next_QuestPosY - 6)
  uiQuestTypeIcon:SetPosX(5)
  uiQuestTypeIcon:SetShow(true)
  FGlobal_ChangeOnTextureForDialogQuestIcon(uiQuestTypeIcon, uiQuestInfo:getQuestType())
  tmp_next_QuestPosY = tmp_next_QuestPosY + 4
  local uiQuestTitleBG = QuestListUIPool:newQuestTitleBG()
  local questTitle = uiQuestInfo:getTitle()
  local recommandLevel = uiQuestInfo:getRecommendLevel()
  local selfPlayerLevel = ((getSelfPlayer()):get()):getLevel()
  if recommandLevel ~= nil and recommandLevel ~= 0 then
    questTitle = questTitle .. "(Lv." .. recommandLevel .. ")"
  end
  local uiQuestTitle = QuestListUIPool:newQuestTitle()
  uiQuestTitleBG:SetPosY(tmp_next_QuestPosY - 10)
  uiQuestTitleBG:SetShow(true)
  if uiQuestInfo:getQuestType() == 0 then
    uiQuestTitle:SetFontColor(4290209076)
  else
    uiQuestTitle:SetFontColor(4287405590)
  end
  uiQuestTitle:SetText(questTitle)
  uiQuestTitle:SetPosY(tmp_next_QuestPosY - list_Space)
  uiQuestTitle:SetLineRender(false)
  uiQuestTitle:SetShow(true)
  uiQuestTitle:addInputEvent("Mouse_DownScroll", "QuestWindow_ScrollEvent(true)")
  uiQuestTitle:addInputEvent("Mouse_UpScroll", "QuestWindow_ScrollEvent(false)")
  local questCompleteNpc = uiQuestInfo:getCompleteDisplay()
  local uiQuestCompleteNpc = QuestListUIPool:newCompleteDest()
  uiQuestCompleteNpc:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "QUESTLIST_COMPLETETARGET", "getCompleteDisplay", questCompleteNpc))
  uiQuestCompleteNpc:SetPosY(tmp_next_QuestPosY + list_Space)
  uiQuestCompleteNpc:SetShow(true)
  uiQuestCompleteNpc:addInputEvent("Mouse_DownScroll", "QuestWindow_ScrollEvent(true)")
  uiQuestCompleteNpc:addInputEvent("Mouse_UpScroll", "QuestWindow_ScrollEvent(false)")
  local uiQuestRewardButton = QuestListUIPool:newQuestRewardButton()
  uiQuestRewardButton:SetPosY(tmp_next_QuestPosY - 8)
  uiQuestRewardButton:SetShow(true)
  uiQuestRewardButton:addInputEvent("Mouse_On", "QuestWindow_questButtonToolTip( true, \"reward\" )")
  uiQuestRewardButton:addInputEvent("Mouse_Out", "QuestWindow_questButtonToolTip( false, \"reward\" )")
  uiQuestRewardButton:addInputEvent("Mouse_LUp", "HandleClicked_QuestReward_Show(" .. questGroupId .. "," .. questId .. ")")
  uiQuestRewardButton:SetPosX(350)
  local uiQuestGiveupButton = QuestListUIPool:newQuestGiveupButton()
  uiQuestGiveupButton:SetPosY(tmp_next_QuestPosY - 8)
  uiQuestGiveupButton:SetShow(true)
  uiQuestGiveupButton:addInputEvent("Mouse_On", "QuestWindow_questButtonToolTip( true, \"giveup\" )")
  uiQuestGiveupButton:addInputEvent("Mouse_Out", "QuestWindow_questButtonToolTip( false, \"giveup\" )")
  uiQuestGiveupButton:addInputEvent("Mouse_LUp", "HandleClicked_QuestWindow_QuestGiveUp(" .. questGroupId .. "," .. questId .. ")")
  uiQuestGiveupButton:SetPosX(370)
  uiQuestGiveupButton:SetMonoTone(false)
  uiQuestGiveupButton:SetEnable(true)
  local uiQuestNaviButton = QuestListUIPool:newQuestNaviButton()
  uiQuestNaviButton:SetPosY(tmp_next_QuestPosY - 8)
  uiQuestNaviButton:SetPosX(390)
  local uiQuestAutoNaviButton = QuestListUIPool:newQuestAutoNaviButton()
  uiQuestAutoNaviButton:SetPosY(tmp_next_QuestPosY - 8)
  uiQuestAutoNaviButton:SetPosX(410)
  local uiQuestImage = QuestListUIPool:newQuestImage()
  uiQuestImage:SetPosY(tmp_next_QuestPosY + 11)
  uiQuestImage:ChangeTextureInfoName(uiQuestInfo:getIconPath())
  uiQuestImage:SetShow(true)
  uiQuestImage:addInputEvent("Mouse_DownScroll", "QuestWindow_ScrollEvent(true)")
  uiQuestImage:addInputEvent("Mouse_UpScroll", "QuestWindow_ScrollEvent(false)")
  local uiQuestImageBoarder = QuestListUIPool:newQuestImageBoarder()
  uiQuestImageBoarder:SetPosY(tmp_next_QuestPosY + 11)
  uiQuestImageBoarder:SetShow(true)
  local uiQuestNaviEffect = QuestListUIPool:newQuestNaviEffect()
  uiQuestNaviEffect:SetPosY(tmp_next_QuestPosY - 3)
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if playerLevel == nil then
    return 
  end
  if playerLevel <= 4 then
    uiQuestNaviEffect:SetNotAbleMasking(true)
    uiQuestNaviEffect:EraseAllEffect()
    uiQuestNaviEffect:AddEffect("fUI_Alarm01", true, 0, 0)
  else
    uiQuestNaviEffect:EraseAllEffect()
  end
  local uiQuestClearIcon = QuestListUIPool:newQuestClearIcon()
  uiQuestClearIcon:SetPosY(tmp_next_QuestPosY + 13)
  uiQuestClearIcon:SetShow(false)
  if isSingle == true then
    uigroupBG:SetPosX(32)
    uiQuestTitleBG:SetPosX(35)
    uiQuestTitle:SetPosX(60)
    uiQuestTypeIcon:SetPosX(40)
    uiQuestCompleteNpc:SetPosX(85)
    uiQuestImage:SetPosX(35)
    uiQuestImageBoarder:SetPosX(35)
    uiQuestNaviEffect:SetPosX(20)
    uiQuestClearIcon:SetPosX(35)
  else
    uigroupBG:SetPosX(57)
    uiQuestTitleBG:SetPosX(60)
    uiQuestTitle:SetPosX(85)
    uiQuestTypeIcon:SetPosX(65)
    uiQuestCompleteNpc:SetPosX(110)
    uiQuestImage:SetPosX(60)
    uiQuestImageBoarder:SetPosX(60)
    uiQuestNaviEffect:SetPosX(45)
    uiQuestClearIcon:SetPosX(60)
  end
  tmp_next_QuestPosY = tmp_next_QuestPosY + uiQuestCompleteNpc:GetSizeY() + 8
  local questCondition_Chk = nil
  if uiQuestInfo:isSatisfied() == true then
    questCondition_Chk = 0
  else
    questCondition_Chk = 1
  end
  for conditionIndex = 0, uiQuestInfo:getDemandCount() - 1 do
    local questCondition = uiQuestInfo:getDemandAt(conditionIndex)
    local uiQuestCondition = QuestListUIPool:newQuestCondition()
    uiQuestCondition:SetAutoResize(true)
    uiQuestCondition:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    if questCondition._currentCount == questCondition._destCount or questCondition._destCount <= questCondition._currentCount then
      uiQuestCondition:SetText(questCondition._desc .. "(" .. PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_COMPLETE") .. ")")
      uiQuestCondition:SetLineRender(true)
      uiQuestCondition:SetFontColor(UI_color.C_FF626262)
    else
      if questCondition._destCount == 1 then
        uiQuestCondition:SetText(questCondition._desc .. "(" .. PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_TARGETONLY") .. ")")
        uiQuestCondition:SetLineRender(false)
      else
        uiQuestCondition:SetText(questCondition._desc .. "(" .. questCondition._currentCount .. "/" .. questCondition._destCount .. ")")
        uiQuestCondition:SetLineRender(false)
      end
    end
    uiQuestCondition:SetPosY(tmp_next_QuestPosY)
    uiQuestCondition:addInputEvent("Mouse_DownScroll", "QuestWindow_ScrollEvent(true)")
    uiQuestCondition:addInputEvent("Mouse_UpScroll", "QuestWindow_ScrollEvent(false)")
    uiQuestCondition:addInputEvent("Mouse_LUp", "FGlobal_QuestInfoDetail( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", \"" .. groupTitle .. "\", " .. questGroupCount .. " )")
    uiQuestCondition:addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", false )")
    if isSingle == true then
      uiQuestCondition:SetPosX(85)
    else
      uiQuestCondition:SetPosX(110)
    end
    uiQuestCondition:SetShow(true)
    tmp_next_QuestPosY = tmp_next_QuestPosY + uiQuestCondition:GetSizeY()
  end
  local questPosCount = uiQuestInfo:getQuestPositionCount()
  uiQuestNaviButton:SetShow(true)
  uiQuestAutoNaviButton:SetShow(true)
  do
    if isLuaLoadingComplete == true then
      local _questGroupId, _questId, _naviInfoAgain = _QuestWidget_ReturnQuestState()
      if _questGroupId == questGroupId and _questId == questId then
        if _naviInfoAgain == true then
          uiQuestNaviButton:SetCheck(false)
          uiQuestAutoNaviButton:SetCheck(false)
          uiQuestNaviEffect:SetShow(false)
        else
          if uiQuestAutoNaviButton:IsCheck() == true then
            uiQuestAutoNaviButton:SetCheck(true)
            uiQuestNaviButton:SetCheck(true)
          else
            uiQuestAutoNaviButton:SetCheck(false)
            uiQuestNaviButton:SetCheck(true)
          end
        end
      else
        uiQuestNaviButton:SetCheck(false)
        uiQuestAutoNaviButton:SetCheck(false)
        uiQuestNaviEffect:SetShow(false)
      end
    end
    uigroupBG:addInputEvent("Mouse_LUp", "FGlobal_QuestInfoDetail( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", \"" .. groupTitle .. "\", " .. questGroupCount .. " )")
    uiQuestTypeIcon:addInputEvent("Mouse_LUp", "FGlobal_QuestInfoDetail( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", \"" .. groupTitle .. "\", " .. questGroupCount .. " )")
    uiQuestTitleBG:addInputEvent("Mouse_LUp", "FGlobal_QuestInfoDetail( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", \"" .. groupTitle .. "\", " .. questGroupCount .. " )")
    uiQuestTitle:addInputEvent("Mouse_LUp", "FGlobal_QuestInfoDetail( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", \"" .. groupTitle .. "\", " .. questGroupCount .. " )")
    uiQuestCompleteNpc:addInputEvent("Mouse_LUp", "FGlobal_QuestInfoDetail( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", \"" .. groupTitle .. "\", " .. questGroupCount .. " )")
    uiQuestImage:addInputEvent("Mouse_LUp", "FGlobal_QuestInfoDetail( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", \"" .. groupTitle .. "\", " .. questGroupCount .. " )")
    uigroupBG:addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", false )")
    uiQuestTypeIcon:addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", false )")
    uiQuestTitleBG:addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", false )")
    uiQuestTitle:addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", false )")
    uiQuestCompleteNpc:addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", false )")
    uiQuestImage:addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", false )")
    uiQuestNaviButton:addInputEvent("Mouse_On", "QuestWindow_questButtonToolTip( true, \"navi\" )")
    uiQuestNaviButton:addInputEvent("Mouse_Out", "QuestWindow_questButtonToolTip( false, \"navi\" )")
    uiQuestNaviButton:addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", false )")
    uiQuestAutoNaviButton:addInputEvent("Mouse_On", "QuestWindow_questButtonToolTip( true, \"Autonavi\" )")
    uiQuestAutoNaviButton:addInputEvent("Mouse_Out", "QuestWindow_questButtonToolTip( false, \"Autonavi\" )")
    uiQuestAutoNaviButton:addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. questCondition_Chk .. ", true )")
    if questCondition_Chk == 0 then
      uiQuestClearIcon:SetShow(true)
      uiQuestImage:SetMonoTone(true)
    else
      uiQuestClearIcon:SetShow(false)
      uiQuestImage:SetMonoTone(false)
    end
    if _questCondition == 0 and uiQuestInfo:getQuestType() == 0 then
      uiQuestNaviButton:SetShow(false)
      uiQuestAutoNaviButton:SetShow(false)
    end
    if _questCondition ~= 0 and questPosCount == 0 then
      uiQuestNaviButton:SetShow(false)
      uiQuestAutoNaviButton:SetShow(false)
      uiQuestImage:addInputEvent("Mouse_LUp", "")
    end
    if tmp_next_QuestPosY < uiQuestImage:GetPosY() + uiQuestImage:GetSizeY() then
      tmp_next_QuestPosY = uiQuestImage:GetPosY() + uiQuestImage:GetSizeY() + 13
    else
      tmp_next_QuestPosY = tmp_next_QuestPosY + 10
    end
    local progressingEndPosY = tmp_next_QuestPosY + 5
    local uigroupBGSizeX = questListWindow_ContentBG:GetSizeX() - uigroupBG:GetPosX()
    uigroupBG:SetSize(uigroupBGSizeX, progressingEndPosY - progressingStartPosY - 3)
    displayGroupQuestCount = displayGroupQuestCount + 1
    return tmp_next_QuestPosY + 5, displayGroupQuestCount
  end
end

FGlobal_QuestWindowGetStartPosition = function()
  -- function num : 0_45 , upvalues : _startPosition
  return _startPosition
end

Panel_Window_QuestNew_Show = function(show, fromWidget)
  -- function num : 0_46
  if show == false then
    if Panel_CheckedQuestInfo:GetShow() then
      FGlobal_QuestInfoDetail_Close()
    end
    Panel_Window_Quest_New:SetShow(false, true)
    _QuestWidget_QuestToolTipHide()
    FGlobal_QuestHistoryClose()
  else
    Panel_Window_Quest_New:SetShow(true, true)
    updateQuestWindowList(FGlobal_QuestWindowGetStartPosition())
    FGlobal_QuestWidget_UpdateList()
    updateQuestWindowFavorType()
    FGlobal_QuestHistoryOpen()
  end
end

Panel_Window_QuestNew_Toggle = function()
  -- function num : 0_47
  Panel_Window_QuestNew_Show(not Panel_Window_Quest_New:GetShow())
end

HandleClicked_QuestWindowList_GroupList_Show = function(groupId, questId)
  -- function num : 0_48
  ToClient_ToggleCheckShow(groupId, questId)
end

QuestWindowNpcNavi_ClearCheckBox = function()
  -- function num : 0_49 , upvalues : QuestListUIPool
  for naviIndex = 0, QuestListUIPool._maxcountQuestNaviButton do
    ((QuestListUIPool._listQuestNaviButton)[naviIndex]):SetCheck(false)
    ;
    ((QuestListUIPool._listQuestNaviEffect)[naviIndex]):SetShow(false)
  end
  ToClient_DeleteNaviGuideByGroup(0)
end

QuestWindow_questButtonToolTip = function(show, target)
  -- function num : 0_50 , upvalues : ButtonTooltip
  if show == true then
    if target == "giveup" then
      ButtonTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_GIVEUP_HELP"))
    else
      if target == "reward" then
        ButtonTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_REWARD_HELP"))
      else
        if target == "navi" then
          ButtonTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_NPCNAVI_HELP"))
        else
          if target == "Autonavi" then
            ButtonTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_AUTONAVITOOLTIP"))
          end
        end
      end
    end
    ButtonTooltip:SetShow(true)
    ButtonTooltip:SetPosX(getMousePosX() - Panel_Window_Quest_New:GetPosX() - ButtonTooltip:GetSizeX())
    ButtonTooltip:SetPosY(getMousePosY() - Panel_Window_Quest_New:GetPosY() - ButtonTooltip:GetSizeY() * 2)
  else
    ButtonTooltip:SetShow(false)
  end
end

HandleClicked_QuestWindow_QuestGiveUp = function(groupId, questId)
  -- function num : 0_51
  FGlobal_PassGroupIdQuestId(groupId, questId)
  local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "GUILD_MESSAGEBOX_TITLE")
  local messageboxContent = PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_REAL_GIVEUP_QUESTION")
  local messageboxData = {title = messageboxTitle, content = messageboxContent, functionYes = QuestWidget_QuestGiveUp_Confirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Panel_Window_QuestNew_OnScreenResize = function()
  -- function num : 0_52
  Panel_Window_Quest_New:SetPosX(getScreenSizeX() / 2 - Panel_Window_Quest_New:GetSizeX() / 2)
  Panel_Window_Quest_New:SetPosY(getScreenSizeY() / 2 - Panel_Window_Quest_New:GetSizeY() / 2 - 30)
  Panel_Window_Quest_History:SetPosX(Panel_Window_Quest_New:GetPosX() - Panel_Window_Quest_History:GetSizeX())
  Panel_Window_Quest_History:SetPosY(Panel_Window_Quest_New:GetPosY())
end

QuestListUIPool:clear()
QuestWindow_NationalCheck()
FromClient_QuestWindow_Update()
Panel_Window_Quest_New:SetChildIndex(ButtonTooltip, 9999)
registerEvent("FromClient_UpdateQuestList", "FromClient_QuestWindow_Update")
registerEvent("onScreenResize", "Panel_Window_QuestNew_OnScreenResize")

