-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\quest\panel_quest_window_160525.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local QuestType = CppEnums.QuestType
local QuestRegionType = CppEnums.QuestRegionType
local isContentsEnableMedia = ToClient_IsContentsGroupOpen("3")
local isContentsEnableValencia = ToClient_IsContentsGroupOpen("4")
local isContentsEnableKamasilvia = ToClient_IsContentsGroupOpen("5")
local isContentsEnableDragan = ToClient_IsContentsGroupOpen("6")
Panel_Window_Quest_New:SetShow(false)
Panel_Window_Quest_New:setGlassBackground(true)
Panel_Window_Quest_New:ActiveMouseEventEffect(true)
Panel_Window_Quest_New:RegisterShowEventFunc(true, "Panel_QuestListShowAni()")
Panel_Window_Quest_New:RegisterShowEventFunc(false, "Panel_QuestListHideAni()")
local QuestTabType = {QuestTabType_Progress = 0, QuestTabType_Recommendation = 1, QuestTabType_Repetition = 2, QuestTabType_Main = 3}
local QuestWindow = {
ui = {btn_Close = (UI.getChildControl)(Panel_Window_Quest_New, "Button_Win_Close"), btn_Question = (UI.getChildControl)(Panel_Window_Quest_New, "Button_Question"), favorTitle_BG = (UI.getChildControl)(Panel_Window_Quest_New, "Static_FavorLineBG"), questListWindow_BG = (UI.getChildControl)(Panel_Window_Quest_New, "Static_BG"), contentBG = (UI.getChildControl)(Panel_Window_Quest_New, "Static_LineBG"), scroll = (UI.getChildControl)(Panel_Window_Quest_New, "Scroll_CheckQuestList"), groupTypeBG = (UI.getChildControl)(Panel_Window_Quest_New, "Static_GroupTypeBG"), ListFilterBG = (UI.getChildControl)(Panel_Window_Quest_New, "Static_ListFilterBG"), tabProgress = (UI.getChildControl)(Panel_Window_Quest_New, "RadioButton_TabProgressing"), tabImportant = (UI.getChildControl)(Panel_Window_Quest_New, "RadioButton_TabImportant"), tabRepeat = (UI.getChildControl)(Panel_Window_Quest_New, "RadioButton_TabRepeat"), tabMain = (UI.getChildControl)(Panel_Window_Quest_New, "RadioButton_Main"), templateGroupBG = (UI.getChildControl)(Panel_Window_Quest_New, "Static_GroupTitleBG"), templateListBG = (UI.getChildControl)(Panel_Window_Quest_New, "Static_ListMainBG"), checkPopUp = (UI.getChildControl)(Panel_Window_Quest_New, "CheckButton_PopUp")}
, 
uiPool = {
questFavorType = {}
, 
groupTitle = {}
, 
listMain = {}
}
, 
config = {favorCount = 6, slotMaxCount = 13, listCount = 0, startSlotIndex = 1, isRegionExpanded = true, isTypeExpanded = true}
, 
selectWay = {groupID = "", questID = "", isAuto = false}
}
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
;
((QuestWindow.ui).checkPopUp):SetShow(isPopUpContentsEnable)
-- DECOMPILER ERROR at PC184: Confused about usage of register: R15 in 'UnsetPending'

;
(QuestWindow.ui).favorTitle = (UI.getChildControl)((QuestWindow.ui).favorTitle_BG, "StaticText_FavorType")
-- DECOMPILER ERROR at PC192: Confused about usage of register: R15 in 'UnsetPending'

;
(QuestWindow.ui).scrollBtn = (UI.getChildControl)((QuestWindow.ui).scroll, "Scroll_CtrlButton")
-- DECOMPILER ERROR at PC200: Confused about usage of register: R15 in 'UnsetPending'

;
(QuestWindow.ui).questCount = (UI.getChildControl)((QuestWindow.ui).groupTypeBG, "StaticText_QuestCount")
-- DECOMPILER ERROR at PC208: Confused about usage of register: R15 in 'UnsetPending'

;
(QuestWindow.ui).radioTerritoryGroup = (UI.getChildControl)((QuestWindow.ui).groupTypeBG, "RadioButton_Territory")
-- DECOMPILER ERROR at PC216: Confused about usage of register: R15 in 'UnsetPending'

;
(QuestWindow.ui).radioTypeGroup = (UI.getChildControl)((QuestWindow.ui).groupTypeBG, "RadioButton_QuestType")
-- DECOMPILER ERROR at PC224: Confused about usage of register: R15 in 'UnsetPending'

;
(QuestWindow.ui).chkEmptyGroupHide = (UI.getChildControl)((QuestWindow.ui).groupTypeBG, "CheckButton_EmptyGroupHide")
;
((QuestWindow.ui).favorTitle_BG):SetNotAbleMasking(true)
-- DECOMPILER ERROR at PC237: Confused about usage of register: R15 in 'UnsetPending'

;
(QuestWindow.ui).hideCompBtn = (UI.getChildControl)((QuestWindow.ui).ListFilterBG, "CheckButton_Complete")
;
((QuestWindow.ui).favorTitle):SetNotAbleMasking(true)
;
((QuestWindow.ui).questListWindow_BG):SetNotAbleMasking(true)
;
((QuestWindow.ui).questListWindow_BG):setGlassBackground(true)
;
((QuestWindow.ui).contentBG):SetNotAbleMasking(true)
;
((QuestWindow.ui).contentBG):SetAlpha(0.8)
;
((QuestWindow.ui).contentBG):SetIgnore(false)
local group_0 = Panel_Window_Quest_New:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
group_0:addControl(0, 0, 4, 1, (QuestWindow.ui).tabProgress)
group_0:addControl(1, 0, 4, 1, (QuestWindow.ui).tabMain)
group_0:addControl(2, 0, 4, 1, (QuestWindow.ui).tabImportant)
group_0:addControl(3, 0, 4, 1, (QuestWindow.ui).tabRepeat)
local useArray = {}
local regionString = {[QuestRegionType.eQuestRegionType_None] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_99"), [QuestRegionType.eQuestRegionType_Balenos] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_1"), [QuestRegionType.eQuestRegionType_Serendia] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_2"), [QuestRegionType.eQuestRegionType_NorthCalpheon] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_3"), [QuestRegionType.eQuestRegionType_CalpheonBigCity] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_4"), [QuestRegionType.eQuestRegionType_Keplan] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_5"), [QuestRegionType.eQuestRegionType_SouthWestCalpheon] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_6"), [QuestRegionType.eQuestRegionType_Media] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_7"), [QuestRegionType.eQuestRegionType_Valencia] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_8"), [QuestRegionType.eQuestRegionType_Kamasylvia] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_9")}
local regionOpen = {[QuestRegionType.eQuestRegionType_None] = true, [QuestRegionType.eQuestRegionType_Balenos] = true, [QuestRegionType.eQuestRegionType_Serendia] = true, [QuestRegionType.eQuestRegionType_NorthCalpheon] = true, [QuestRegionType.eQuestRegionType_CalpheonBigCity] = true, [QuestRegionType.eQuestRegionType_Keplan] = true, [QuestRegionType.eQuestRegionType_SouthWestCalpheon] = true, [QuestRegionType.eQuestRegionType_Media] = true, [QuestRegionType.eQuestRegionType_Valencia] = true, [QuestRegionType.eQuestRegionType_Kamasylvia] = true, [QuestRegionType.eQuestRegionType_Count] = false}
local questType = {black = 0, story = 1, town = 2, adv = 3, trade = 4, craft = 5, rep = 6, count = 7}
local questSelectType = {story = 0, hunt = 1, life = 2, fish = 3, adv = 4, etc = 5}
local typeString = {[QuestType.eQuestType_BlackSpirit] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_1"), [QuestType.eQuestType_Story] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_2"), [QuestType.eQuestType_Town] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_3"), [QuestType.eQuestType_Adventure] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_4"), [QuestType.eQuestType_Trade] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_5"), [QuestType.eQuestType_Craft] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_6"), [QuestType.eQuestType_Repetition] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_7"), [QuestType.eQuestType_Guild] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_TYPE_8")}
local typeOpen = {[QuestType.eQuestType_BlackSpirit] = true, [QuestType.eQuestType_Story] = true, [QuestType.eQuestType_Town] = true, [QuestType.eQuestType_Adventure] = true, [QuestType.eQuestType_Trade] = true, [QuestType.eQuestType_Craft] = true, [QuestType.eQuestType_Repetition] = true, [QuestType.eQuestType_Guild] = true, [QuestType.eQuestType_Count] = false}
local groupOpen = {}
local repetitiveQuestGroupOpen = {}
local questArrayGroupCount = {}
local questArrayGroupCompleteCount = {}
local questSortArrayRegion = {
[QuestRegionType.eQuestRegionType_None] = {}
, 
[QuestRegionType.eQuestRegionType_Balenos] = {}
, 
[QuestRegionType.eQuestRegionType_Serendia] = {}
, 
[QuestRegionType.eQuestRegionType_NorthCalpheon] = {}
, 
[QuestRegionType.eQuestRegionType_CalpheonBigCity] = {}
, 
[QuestRegionType.eQuestRegionType_Keplan] = {}
, 
[QuestRegionType.eQuestRegionType_SouthWestCalpheon] = {}
, 
[QuestRegionType.eQuestRegionType_Media] = {}
, 
[QuestRegionType.eQuestRegionType_Valencia] = {}
, 
[QuestRegionType.eQuestRegionType_Kamasylvia] = {}
}
local questArrayRegionCount = {[QuestRegionType.eQuestRegionType_None] = 0, [QuestRegionType.eQuestRegionType_Balenos] = 0, [QuestRegionType.eQuestRegionType_Serendia] = 0, [QuestRegionType.eQuestRegionType_NorthCalpheon] = 0, [QuestRegionType.eQuestRegionType_CalpheonBigCity] = 0, [QuestRegionType.eQuestRegionType_Keplan] = 0, [QuestRegionType.eQuestRegionType_SouthWestCalpheon] = 0, [QuestRegionType.eQuestRegionType_Media] = 0, [QuestRegionType.eQuestRegionType_Valencia] = 0, [QuestRegionType.eQuestRegionType_Kamasylvia] = 0}
local questArrayRegionProgressCount = {[QuestRegionType.eQuestRegionType_None] = 0, [QuestRegionType.eQuestRegionType_Balenos] = 0, [QuestRegionType.eQuestRegionType_Serendia] = 0, [QuestRegionType.eQuestRegionType_NorthCalpheon] = 0, [QuestRegionType.eQuestRegionType_CalpheonBigCity] = 0, [QuestRegionType.eQuestRegionType_Keplan] = 0, [QuestRegionType.eQuestRegionType_SouthWestCalpheon] = 0, [QuestRegionType.eQuestRegionType_Media] = 0, [QuestRegionType.eQuestRegionType_Valencia] = 0, [QuestRegionType.eQuestRegionType_Kamasylvia] = 0}
local questArrayRegionSort = {[0] = QuestRegionType.eQuestRegionType_Balenos, [1] = QuestRegionType.eQuestRegionType_Serendia, [2] = QuestRegionType.eQuestRegionType_NorthCalpheon, [3] = QuestRegionType.eQuestRegionType_CalpheonBigCity, [4] = QuestRegionType.eQuestRegionType_Keplan, [5] = QuestRegionType.eQuestRegionType_SouthWestCalpheon, [6] = QuestRegionType.eQuestRegionType_Media, [7] = QuestRegionType.eQuestRegionType_Valencia, [8] = QuestRegionType.eQuestRegionType_Kamasylvia, [9] = QuestRegionType.eQuestRegionType_None}
local questSortArrayType = {
[QuestType.eQuestType_BlackSpirit] = {}
, 
[QuestType.eQuestType_Story] = {}
, 
[QuestType.eQuestType_Town] = {}
, 
[QuestType.eQuestType_Adventure] = {}
, 
[QuestType.eQuestType_Trade] = {}
, 
[QuestType.eQuestType_Craft] = {}
, 
[QuestType.eQuestType_Repetition] = {}
, 
[QuestType.eQuestType_Guild] = {}
}
local questArrayTypeCount = {[QuestType.eQuestType_BlackSpirit] = 0, [QuestType.eQuestType_Story] = 0, [QuestType.eQuestType_Town] = 0, [QuestType.eQuestType_Adventure] = 0, [QuestType.eQuestType_Trade] = 0, [QuestType.eQuestType_Craft] = 0, [QuestType.eQuestType_Repetition] = 0, 
[QuestType.eQuestType_Guild] = {}
}
local questArrayTypeProgressCount = {[QuestType.eQuestType_BlackSpirit] = 0, [QuestType.eQuestType_Story] = 0, [QuestType.eQuestType_Town] = 0, [QuestType.eQuestType_Adventure] = 0, [QuestType.eQuestType_Trade] = 0, [QuestType.eQuestType_Craft] = 0, [QuestType.eQuestType_Repetition] = 0, 
[QuestType.eQuestType_Guild] = {}
}
local questSelectTypeString = {[questSelectType.story] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_QUESTSELECTTYPE_TXT_TYPE_1"), [questSelectType.hunt] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_QUESTSELECTTYPE_TXT_TYPE_2"), [questSelectType.life] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_QUESTSELECTTYPE_TXT_TYPE_3"), [questSelectType.fish] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_QUESTSELECTTYPE_TXT_TYPE_4"), [questSelectType.adv] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_QUESTSELECTTYPE_TXT_TYPE_5"), [questSelectType.etc] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_QUESTSELECTTYPE_TXT_TYPE_6")}
Panel_QuestListShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
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
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
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

QuestWindow.init = function(self)
  -- function num : 0_2 , upvalues : QuestWindow, UI_TM, repetitiveQuestGroupOpen, questArrayGroupCount, questArrayGroupCompleteCount
  local questFavorType = {}
  local favorStartPosX = 85
  local group_3 = Panel_Window_Quest_New:addConsoleUIGroup(3, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  for ii = 0, (self.config).favorCount - 1 do
    local controlIdNumber = ii + 1
    local controlId = "CheckButton_FavorType_" .. tostring(controlIdNumber)
    local control = (UI.getChildControl)((QuestWindow.ui).favorTitle_BG, controlId)
    control:addInputEvent("Mouse_LUp", "QuestWindow_SelectQuestFavorType(" .. ii .. ")")
    control:SetNotAbleMasking(true)
    if controlIdNumber == 5 then
      control:SetTextMode(UI_TM.eTextMode_LimitText)
    else
      control:SetTextMode(UI_TM.eTextMode_None)
    end
    control:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUEST_NEW_FAVORTYPE" .. controlIdNumber))
    control:addInputEvent("Mouse_On", "QUestWindow_SelectQuestFavorTypeSimpleTooltip( true, " .. ii .. " )")
    control:addInputEvent("Mouse_Out", "QUestWindow_SelectQuestFavorTypeSimpleTooltip( false, " .. ii .. " )")
    -- DECOMPILER ERROR at PC74: Confused about usage of register: R11 in 'UnsetPending'

    ;
    ((self.uiPool).questFavorType)[ii] = control
    group_3:addControl(ii, 0, (self.config).favorCount, 1, ((self.uiPool).questFavorType)[ii])
  end
  ;
  ((QuestWindow.ui).favorTitle):addInputEvent("Mouse_On", "QUestWindow_SelectQuestFavorTypeSimpleTooltip( true, 99 )")
  ;
  ((QuestWindow.ui).favorTitle):addInputEvent("Mouse_Out", "QUestWindow_SelectQuestFavorTypeSimpleTooltip( false, 99 )")
  for slotIdx = 0, (self.config).slotMaxCount - 1 do
    local groupSlot = {}
    local baseGroupControl = (QuestWindow.ui).templateGroupBG
    groupSlot.bg = (UI.createAndCopyBasePropertyControl)(Panel_Window_Quest_New, "Static_GroupTitleBG", (self.ui).contentBG, "QuestWindow_GroupTitleBG_" .. slotIdx)
    groupSlot.typeIcon = (UI.createAndCopyBasePropertyControl)(baseGroupControl, "Static_QuestTypeIcon", groupSlot.bg, "QuestWindow_GroupTypeIcon_" .. slotIdx)
    groupSlot.name = (UI.createAndCopyBasePropertyControl)(baseGroupControl, "StaticText_QuestName", groupSlot.bg, "QuestWindow_GroupName_" .. slotIdx)
    groupSlot.expandIcon = (UI.createAndCopyBasePropertyControl)(baseGroupControl, "Static_QuestExpanded", groupSlot.bg, "QuestWindow_GroupQuestExpanded_" .. slotIdx)
    groupSlot.completePercent = (UI.createAndCopyBasePropertyControl)(baseGroupControl, "StaticText_CompletePercent", groupSlot.bg, "QuestWindow_GroupCompletePercent_" .. slotIdx)
    ;
    (groupSlot.bg):SetPosX(5)
    ;
    (groupSlot.bg):SetPosY(slotIdx * ((groupSlot.bg):GetSizeY() + 5) + 5)
    ;
    (groupSlot.bg):SetShow(false)
    ;
    (groupSlot.bg):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (groupSlot.bg):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (groupSlot.typeIcon):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (groupSlot.typeIcon):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (groupSlot.name):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (groupSlot.name):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (groupSlot.expandIcon):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (groupSlot.expandIcon):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (groupSlot.completePercent):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (groupSlot.completePercent):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (groupSlot.name):SetTextMode(UI_TM.eTextMode_LimitText)
    -- DECOMPILER ERROR at PC235: Confused about usage of register: R10 in 'UnsetPending'

    ;
    ((self.uiPool).groupTitle)[slotIdx] = groupSlot
    local listSlot = {}
    local baseListControl = (QuestWindow.ui).templateListBG
    listSlot.bg = (UI.createAndCopyBasePropertyControl)(Panel_Window_Quest_New, "Static_ListMainBG", (self.ui).contentBG, "QuestWindow_ListMainBG_" .. slotIdx)
    listSlot.showBtn = (UI.createAndCopyBasePropertyControl)(baseListControl, "CheckButton_ShowWidget", listSlot.bg, "QuestWindow_ListShowWidgetBtn_" .. slotIdx)
    listSlot.typeIcon = (UI.createAndCopyBasePropertyControl)(baseListControl, "Static_ListMain_QuestTypeIcon", listSlot.bg, "QuestWindow_ListTypeIcon_" .. slotIdx)
    listSlot.name = (UI.createAndCopyBasePropertyControl)(baseListControl, "StaticText_ListMain_QuestName", listSlot.bg, "QuestWindow_ListQuestName_" .. slotIdx)
    listSlot.remainTime = (UI.createAndCopyBasePropertyControl)(baseListControl, "StaticText_ListMain_Quest_RemainTime", listSlot.bg, "QuestWindow_ListQuestRemainTime_" .. slotIdx)
    listSlot.btnAuto = (UI.createAndCopyBasePropertyControl)(baseListControl, "CheckButton_ListMain_AutoNavi", listSlot.bg, "QuestWindow_ListAutoNavi_" .. slotIdx)
    listSlot.btnNavi = (UI.createAndCopyBasePropertyControl)(baseListControl, "Checkbox_ListMain_QuestNavi", listSlot.bg, "QuestWindow_ListNavi_" .. slotIdx)
    listSlot.btnGiveup = (UI.createAndCopyBasePropertyControl)(baseListControl, "Checkbox_ListMain_QuestGiveup", listSlot.bg, "QuestWindow_ListGiveup_" .. slotIdx)
    listSlot.btnReward = (UI.createAndCopyBasePropertyControl)(baseListControl, "Checkbox_ListMain_QuestReward", listSlot.bg, "QuestWindow_ListReward_" .. slotIdx)
    listSlot.completeCount = (UI.createAndCopyBasePropertyControl)(baseListControl, "StaticText_ListMain_GroupCompleteCount", listSlot.bg, "QuestWindow_ListCompleteCount_" .. slotIdx)
    ;
    (listSlot.bg):SetPosX(5)
    ;
    (listSlot.bg):SetPosY(slotIdx * ((listSlot.bg):GetSizeY() + 5) + 5)
    ;
    (listSlot.bg):SetShow(false)
    ;
    (listSlot.name):SetTextMode(UI_TM.eTextMode_LimitText)
    ;
    (listSlot.bg):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.bg):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.showBtn):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.showBtn):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.typeIcon):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.typeIcon):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.name):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.name):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.remainTime):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.remainTime):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.btnAuto):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.btnAuto):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.btnNavi):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.btnNavi):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.btnGiveup):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.btnGiveup):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.btnReward):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.btnReward):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.completeCount):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
    ;
    (listSlot.completeCount):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
    ;
    (listSlot.btnAuto):addInputEvent("Mouse_On", "")
    ;
    (listSlot.btnAuto):addInputEvent("Mouse_Out", "")
    ;
    (listSlot.btnNavi):addInputEvent("Mouse_On", "")
    ;
    (listSlot.btnNavi):addInputEvent("Mouse_Out", "")
    ;
    (listSlot.btnGiveup):addInputEvent("Mouse_On", "")
    ;
    (listSlot.btnGiveup):addInputEvent("Mouse_Out", "")
    ;
    (listSlot.btnReward):addInputEvent("Mouse_On", "")
    ;
    (listSlot.btnReward):addInputEvent("Mouse_Out", "")
    -- DECOMPILER ERROR at PC505: Confused about usage of register: R12 in 'UnsetPending'

    ;
    ((self.uiPool).listMain)[slotIdx] = listSlot
  end
  local questListInfo = ToClient_GetQuestList()
  local repeatitionQuestGroupCount = questListInfo:getRepetitionQuestGroupCount()
  local questGroupCount = questListInfo:getRecommendationQuestGroupCount()
  local mainQuestGroupCount = questListInfo:getMainQuestGroupCount()
  recommendationGroupOpen = {}
  repetitiveQuestGroupOpen = {}
  mainQuestGroupOpen = {}
  questArrayGroupCount = {}
  questArrayGroupCompleteCount = {}
  for groupIdx = 0, questGroupCount - 1 do
    -- DECOMPILER ERROR at PC530: Confused about usage of register: R12 in 'UnsetPending'

    recommendationGroupOpen[groupIdx] = false
  end
  for groupIdx = 0, repeatitionQuestGroupCount - 1 do
    -- DECOMPILER ERROR at PC537: Confused about usage of register: R12 in 'UnsetPending'

    repetitiveQuestGroupOpen[groupIdx] = false
  end
  for groupIdx = 0, mainQuestGroupCount - 1 do
    -- DECOMPILER ERROR at PC544: Confused about usage of register: R12 in 'UnsetPending'

    mainQuestGroupOpen[groupIdx] = false
  end
  local btnTabProgressSizeX = ((self.ui).tabProgress):GetSizeX() + 23
  local btnTabProgressTextPosX = btnTabProgressSizeX - btnTabProgressSizeX / 2 - ((self.ui).tabProgress):GetTextSizeX() / 2
  ;
  ((self.ui).tabProgress):SetTextSpan(btnTabProgressTextPosX, 5)
  local btnTabImportantSizeX = ((self.ui).tabImportant):GetSizeX() + 10
  local btnTabImportantTextPosX = btnTabImportantSizeX - btnTabImportantSizeX / 2 - ((self.ui).tabImportant):GetTextSizeX() / 2
  ;
  ((self.ui).tabImportant):SetTextSpan(btnTabImportantTextPosX, 5)
  local btnTabRepeatSizeX = ((self.ui).tabRepeat):GetSizeX() + 23
  local btnTabRepeatTextPosX = btnTabRepeatSizeX - btnTabRepeatSizeX / 2 - ((self.ui).tabRepeat):GetTextSizeX() / 2
  ;
  ((self.ui).tabRepeat):SetTextSpan(btnTabRepeatTextPosX, 5)
  local btnTabMainSizeX = ((self.ui).tabMain):GetSizeX() + 23
  local btnTabMainTextPosX = btnTabMainSizeX - btnTabMainSizeX / 2 - ((self.ui).tabMain):GetTextSizeX() / 2
  ;
  ((self.ui).tabMain):SetTextSpan(btnTabMainTextPosX, 5)
  ;
  ((self.ui).templateGroupBG):SetShow(false)
  ;
  ((self.ui).templateListBG):SetShow(false)
  ;
  ((self.ui).tabProgress):SetCheck(true)
  ;
  ((self.ui).tabImportant):SetCheck(false)
  ;
  ((self.ui).tabRepeat):SetCheck(false)
  ;
  ((self.ui).tabMain):SetCheck(false)
  ;
  ((self.ui).groupTypeBG):SetShow(true)
  ;
  ((self.ui).ListFilterBG):SetShow(false)
  ;
  ((self.ui).radioTerritoryGroup):SetCheck(true)
  ;
  ((self.ui).radioTypeGroup):SetCheck(false)
  ;
  ((self.ui).chkEmptyGroupHide):SetCheck(true)
  ;
  ((self.ui).hideCompBtn):SetCheck(true)
end

QuestWindow_SelectQuestFavorType = function(selectType)
  -- function num : 0_3 , upvalues : QuestWindow
  if ((getSelfPlayer()):get()):getLevel() >= 20 then
    if selectType == 0 then
      QuestWindow:favorCheckAll()
    else
      ToClient_ToggleQuestSelectType(selectType)
    end
    FGlobal_UpdateQuestFavorType()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_FAVORITETYPE_ALERT"))
  end
end

QUestWindow_SelectQuestFavorTypeSimpleTooltip = function(isShow, index)
  -- function num : 0_4 , upvalues : QuestWindow
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  local controlId = "CheckButton_FavorType_" .. tostring(index + 1)
  local controlQuestType = (UI.getChildControl)((QuestWindow.ui).favorTitle_BG, controlId)
  if index == 0 then
    name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUEST_NEW_FAVORTYPE1")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_FAVORTYPE_TOOLTIP_DESC_ALL")
    control = controlQuestType
  else
    if index == 1 then
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUEST_NEW_FAVORTYPE2")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_FAVORTYPE_TOOLTIP_DESC_COMBAT")
      control = controlQuestType
    else
      if index == 2 then
        name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUEST_NEW_FAVORTYPE3")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_FAVORTYPE_TOOLTIP_DESC_LIFE")
        control = controlQuestType
      else
        if index == 3 then
          name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUEST_NEW_FAVORTYPE4")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_FAVORTYPE_TOOLTIP_DESC_FISHING")
          control = controlQuestType
        else
          if index == 4 then
            name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUEST_NEW_FAVORTYPE5")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_FAVORTYPE_TOOLTIP_DESC_TRADE")
            control = controlQuestType
          else
            if index == 5 then
              name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUEST_NEW_FAVORTYPE6")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_FAVORTYPE_TOOLTIP_DESC_ETC")
              control = controlQuestType
            else
              if index == 99 then
                name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_QUEST_NEW_FAVORTYPE")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_QUEST_FAVORTYPE_TOOLTIP_DESC_FAVORTYPE")
                control = (QuestWindow.ui).favorTitle
              end
            end
          end
        end
      end
    end
  end
  TooltipSimple_Show(control, name, desc)
end

QuestWindow.favorCheckAll = function(self)
  -- function num : 0_5
  local isCheck = (((self.uiPool).questFavorType)[0]):IsCheck()
  for i = 1, (self.config).favorCount - 1 do
    if isCheck == not (((self.uiPool).questFavorType)[i]):IsCheck() then
      ToClient_ToggleQuestSelectType(i)
      ;
      (((self.uiPool).questFavorType)[i]):SetCheck(isCheck)
    end
  end
end

QuestWindow.favorTypeUpdate = function(self)
  -- function num : 0_6
  local allButtonCheck = true
  local QuestListInfo = ToClient_GetQuestList()
  for ii = 1, (self.config).favorCount - 1 do
    local bChecked = QuestListInfo:isQuestSelectType(ii)
    ;
    (((self.uiPool).questFavorType)[ii]):SetCheck(bChecked)
    ;
    (((self.uiPool).questFavorType)[ii]):SetMonoTone(bChecked)
    if bChecked == false then
      (((self.uiPool).questFavorType)[0]):SetMonoTone(true)
      allButtonCheck = false
    end
    if allButtonCheck == true then
      (((self.uiPool).questFavorType)[ii]):SetMonoTone(false)
      ;
      (((self.uiPool).questFavorType)[0]):SetMonoTone(false)
    else
      if bChecked == true then
        (((self.uiPool).questFavorType)[ii]):SetMonoTone(false)
      else
        ;
        (((self.uiPool).questFavorType)[ii]):SetMonoTone(true)
      end
    end
  end
  ;
  (((self.uiPool).questFavorType)[0]):SetCheck(allButtonCheck)
end

QuestWindow.nationalCheck = function(self)
  -- function num : 0_7 , upvalues : QuestWindow
  if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_RUS) then
    QuestWindow:favorCheckAll()
  end
end

QuestWindow.ResetDataArray = function(self)
  -- function num : 0_8 , upvalues : questSortArrayRegion, QuestRegionType, questArrayRegionCount, questArrayRegionProgressCount, questArrayRegionSort, questSortArrayType, QuestType, questArrayTypeCount, questArrayTypeProgressCount
  questSortArrayRegion = {
[QuestRegionType.eQuestRegionType_None] = {}
, 
[QuestRegionType.eQuestRegionType_Balenos] = {}
, 
[QuestRegionType.eQuestRegionType_Serendia] = {}
, 
[QuestRegionType.eQuestRegionType_NorthCalpheon] = {}
, 
[QuestRegionType.eQuestRegionType_CalpheonBigCity] = {}
, 
[QuestRegionType.eQuestRegionType_Keplan] = {}
, 
[QuestRegionType.eQuestRegionType_SouthWestCalpheon] = {}
, 
[QuestRegionType.eQuestRegionType_Media] = {}
, 
[QuestRegionType.eQuestRegionType_Valencia] = {}
, 
[QuestRegionType.eQuestRegionType_Kamasylvia] = {}
}
  questArrayRegionCount = {[QuestRegionType.eQuestRegionType_None] = 0, [QuestRegionType.eQuestRegionType_Balenos] = 0, [QuestRegionType.eQuestRegionType_Serendia] = 0, [QuestRegionType.eQuestRegionType_NorthCalpheon] = 0, [QuestRegionType.eQuestRegionType_CalpheonBigCity] = 0, [QuestRegionType.eQuestRegionType_Keplan] = 0, [QuestRegionType.eQuestRegionType_SouthWestCalpheon] = 0, [QuestRegionType.eQuestRegionType_Media] = 0, [QuestRegionType.eQuestRegionType_Valencia] = 0, [QuestRegionType.eQuestRegionType_Kamasylvia] = 0}
  questArrayRegionProgressCount = {[QuestRegionType.eQuestRegionType_None] = 0, [QuestRegionType.eQuestRegionType_Balenos] = 0, [QuestRegionType.eQuestRegionType_Serendia] = 0, [QuestRegionType.eQuestRegionType_NorthCalpheon] = 0, [QuestRegionType.eQuestRegionType_CalpheonBigCity] = 0, [QuestRegionType.eQuestRegionType_Keplan] = 0, [QuestRegionType.eQuestRegionType_SouthWestCalpheon] = 0, [QuestRegionType.eQuestRegionType_Media] = 0, [QuestRegionType.eQuestRegionType_Valencia] = 0, [QuestRegionType.eQuestRegionType_Kamasylvia] = 0}
  questArrayRegionSort = {[0] = QuestRegionType.eQuestRegionType_Balenos, [1] = QuestRegionType.eQuestRegionType_Serendia, [2] = QuestRegionType.eQuestRegionType_NorthCalpheon, [3] = QuestRegionType.eQuestRegionType_CalpheonBigCity, [4] = QuestRegionType.eQuestRegionType_Keplan, [5] = QuestRegionType.eQuestRegionType_SouthWestCalpheon, [6] = QuestRegionType.eQuestRegionType_Media, [7] = QuestRegionType.eQuestRegionType_Valencia, [8] = QuestRegionType.eQuestRegionType_Kamasylvia, [9] = QuestRegionType.eQuestRegionType_None}
  questSortArrayType = {
[QuestType.eQuestType_BlackSpirit] = {}
, 
[QuestType.eQuestType_Story] = {}
, 
[QuestType.eQuestType_Town] = {}
, 
[QuestType.eQuestType_Adventure] = {}
, 
[QuestType.eQuestType_Trade] = {}
, 
[QuestType.eQuestType_Craft] = {}
, 
[QuestType.eQuestType_Repetition] = {}
, 
[QuestType.eQuestType_Guild] = {}
}
  questArrayTypeCount = {[QuestType.eQuestType_BlackSpirit] = 0, [QuestType.eQuestType_Story] = 0, [QuestType.eQuestType_Town] = 0, [QuestType.eQuestType_Adventure] = 0, [QuestType.eQuestType_Trade] = 0, [QuestType.eQuestType_Craft] = 0, [QuestType.eQuestType_Repetition] = 0, [QuestType.eQuestType_Guild] = 0}
  questArrayTypeProgressCount = {[QuestType.eQuestType_BlackSpirit] = 0, [QuestType.eQuestType_Story] = 0, [QuestType.eQuestType_Town] = 0, [QuestType.eQuestType_Adventure] = 0, [QuestType.eQuestType_Trade] = 0, [QuestType.eQuestType_Craft] = 0, [QuestType.eQuestType_Repetition] = 0, [QuestType.eQuestType_Guild] = 0}
end

QuestWindow.GetProgressingActiveTab = function(self)
  -- function num : 0_9 , upvalues : QuestTabType
  local progressingActiveTab = nil
  if ((self.ui).tabProgress):IsCheck() then
    progressingActiveTab = QuestTabType.QuestTabType_Progress
  else
    if ((self.ui).tabImportant):IsCheck() then
      progressingActiveTab = QuestTabType.QuestTabType_Recommendation
    else
      if ((self.ui).tabRepeat):IsCheck() then
        progressingActiveTab = QuestTabType.QuestTabType_Repetition
      else
        progressingActiveTab = QuestTabType.QuestTabType_Main
      end
    end
  end
  return progressingActiveTab
end

QuestWindow.MakeDataArray = function(self)
  -- function num : 0_10 , upvalues : QuestWindow, QuestTabType, questArrayRegionCount, questSortArrayRegion, questArrayTypeCount, questSortArrayType, QuestRegionType, questArrayRegionProgressCount, questArrayTypeProgressCount, useArray, questArrayRegionSort, isContentsEnableMedia, isContentsEnableValencia, isContentsEnableKamasilvia, regionString, regionOpen, questType, typeString, typeOpen, questArrayGroupCount, questArrayGroupCompleteCount, repetitiveQuestGroupOpen
  local progressingActiveTab = QuestWindow:GetProgressingActiveTab()
  local questListInfo = (ToClient_GetQuestList())
  local questGroupCount = nil
  if QuestTabType.QuestTabType_Progress == progressingActiveTab then
    questGroupCount = questListInfo:getQuestGroupCount()
  else
    if QuestTabType.QuestTabType_Recommendation == progressingActiveTab then
      questGroupCount = questListInfo:getRecommendationQuestGroupCount()
    else
      if QuestTabType.QuestTabType_Repetition == progressingActiveTab then
        questGroupCount = questListInfo:getRepetitionQuestGroupCount()
      else
        questGroupCount = questListInfo:getMainQuestGroupCount()
      end
    end
  end
  local progressQuestCount = 0
  do
    for questGroupIndex = 0, questGroupCount - 1 do
      local questGroupInfo = nil
      do
        if QuestTabType.QuestTabType_Progress == progressingActiveTab then
          questGroupInfo = questListInfo:getQuestGroupAt(questGroupIndex)
        else
          if QuestTabType.QuestTabType_Recommendation == progressingActiveTab then
            questGroupInfo = questListInfo:getRecommendationQuestGroupAt(questGroupIndex)
          else
            if QuestTabType.QuestTabType_Repetition == progressingActiveTab then
              questGroupInfo = questListInfo:getRepetitionQuestGroupAt(questGroupIndex)
            else
              questGroupInfo = questListInfo:getMainQuestGroupAt(questGroupIndex)
            end
          end
        end
        if QuestTabType.QuestTabType_Progress == progressingActiveTab then
          if questGroupInfo:isGroupQuest() == true then
            local questCount = questGroupInfo:getQuestCount()
            do
              local startIdx = 0
              do
                if questCount == 1 then
                  local uiQuestInfo = questGroupInfo:getQuestAt(startIdx)
                  do
                    local dataRegionIdx = uiQuestInfo:getQuestRegion()
                    local regionIdx = questArrayRegionCount[dataRegionIdx]
                    -- DECOMPILER ERROR at PC129: Confused about usage of register: R15 in 'UnsetPending'

                    ;
                    (questSortArrayRegion[dataRegionIdx])[regionIdx] = {questRegion = dataRegionIdx, questType = uiQuestInfo:getQuestType(), questTitle = uiQuestInfo:getTitle(), gruopNo = (uiQuestInfo:getQuestNo())._group, questNo = (uiQuestInfo:getQuestNo())._quest, posCount = uiQuestInfo:getQuestPositionCount(), conditionComp = uiQuestInfo:isSatisfied(), completeCount = 0, isShowWidget = questGroupInfo:isCheckShow(), isCleared = true, isNext = false, isGroupQuest = true, groupIdx = questGroupIndex, groupCount = questCount, resetTime = uiQuestInfo:getResetTime(), repeatTime = uiQuestInfo:getRepeatTime()}
                    -- DECOMPILER ERROR at PC134: Confused about usage of register: R15 in 'UnsetPending'

                    questArrayRegionCount[dataRegionIdx] = questArrayRegionCount[dataRegionIdx] + 1
                    local typeIdx = questArrayTypeCount[uiQuestInfo:getQuestType()]
                    -- DECOMPILER ERROR at PC180: Confused about usage of register: R16 in 'UnsetPending'

                    ;
                    (questSortArrayType[uiQuestInfo:getQuestType()])[typeIdx] = {questRegion = dataRegionIdx, questType = uiQuestInfo:getQuestType(), questTitle = uiQuestInfo:getTitle(), gruopNo = (uiQuestInfo:getQuestNo())._group, questNo = (uiQuestInfo:getQuestNo())._quest, posCount = uiQuestInfo:getQuestPositionCount(), conditionComp = uiQuestInfo:isSatisfied(), completeCount = 0, isShowWidget = questGroupInfo:isCheckShow(), isCleared = true, isNext = false, isGroupQuest = true, groupIdx = questGroupIndex, groupCount = questCount, resetTime = uiQuestInfo:getResetTime(), repeatTime = uiQuestInfo:getRepeatTime()}
                    -- DECOMPILER ERROR at PC189: Confused about usage of register: R16 in 'UnsetPending'

                    questArrayTypeCount[uiQuestInfo:getQuestType()] = questArrayTypeCount[uiQuestInfo:getQuestType()] + 1
                  end
                else
                  do
                    if questCount >= 2 then
                      startIdx = questCount - 2
                    end
                    for questIdx = startIdx, questCount - 1 do
                      local uiQuestInfo = questGroupInfo:getQuestAt(questIdx)
                      local dataRegionIdx = uiQuestInfo:getQuestRegion()
                      if QuestRegionType.eQuestRegionType_Kamasylvia < dataRegionIdx or dataRegionIdx < QuestRegionType.eQuestRegionType_None then
                        dataRegionIdx = QuestRegionType.eQuestRegionType_None
                      end
                      local regionIdx = questArrayRegionCount[dataRegionIdx]
                      -- DECOMPILER ERROR at PC264: Confused about usage of register: R19 in 'UnsetPending'

                      ;
                      (questSortArrayRegion[dataRegionIdx])[regionIdx] = {questRegion = dataRegionIdx, questType = uiQuestInfo:getQuestType(), questTitle = uiQuestInfo:getTitle(), gruopNo = (uiQuestInfo:getQuestNo())._group, questNo = (uiQuestInfo:getQuestNo())._quest, posCount = uiQuestInfo:getQuestPositionCount(), conditionComp = uiQuestInfo:isSatisfied(), completeCount = questIdx + 1, isShowWidget = questGroupInfo:isCheckShow(), isCleared = uiQuestInfo._isCleared, isNext = (not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing), isGroupQuest = true, groupIdx = questGroupIndex, groupCount = questCount, resetTime = uiQuestInfo:getResetTime(), repeatTime = uiQuestInfo:getRepeatTime()}
                      -- DECOMPILER ERROR at PC269: Confused about usage of register: R19 in 'UnsetPending'

                      questArrayRegionCount[dataRegionIdx] = questArrayRegionCount[dataRegionIdx] + 1
                      local typeIdx = questArrayTypeCount[uiQuestInfo:getQuestType()]
                      -- DECOMPILER ERROR at PC325: Confused about usage of register: R20 in 'UnsetPending'

                      ;
                      (questSortArrayType[uiQuestInfo:getQuestType()])[typeIdx] = {questRegion = dataRegionIdx, questType = uiQuestInfo:getQuestType(), questTitle = uiQuestInfo:getTitle(), gruopNo = (uiQuestInfo:getQuestNo())._group, questNo = (uiQuestInfo:getQuestNo())._quest, posCount = uiQuestInfo:getQuestPositionCount(), conditionComp = uiQuestInfo:isSatisfied(), completeCount = questIdx + 1, isShowWidget = questGroupInfo:isCheckShow(), isCleared = uiQuestInfo._isCleared, isNext = (not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing), isGroupQuest = true, groupIdx = questGroupIndex, groupCount = questCount, resetTime = uiQuestInfo:getResetTime(), repeatTime = uiQuestInfo:getRepeatTime()}
                      -- DECOMPILER ERROR at PC334: Confused about usage of register: R20 in 'UnsetPending'

                      questArrayTypeCount[uiQuestInfo:getQuestType()] = questArrayTypeCount[uiQuestInfo:getQuestType()] + 1
                      if uiQuestInfo._isProgressing then
                        progressQuestCount = progressQuestCount + 1
                        -- DECOMPILER ERROR at PC343: Confused about usage of register: R20 in 'UnsetPending'

                        questArrayRegionProgressCount[dataRegionIdx] = questArrayRegionProgressCount[dataRegionIdx] + 1
                        -- DECOMPILER ERROR at PC352: Confused about usage of register: R20 in 'UnsetPending'

                        questArrayTypeProgressCount[uiQuestInfo:getQuestType()] = questArrayTypeProgressCount[uiQuestInfo:getQuestType()] + 1
                      end
                    end
                  end
                  local uiQuestInfo = questGroupInfo:getQuestAt(0)
                  local dataRegionIdx = uiQuestInfo:getQuestRegion()
                  if QuestRegionType.eQuestRegionType_Kamasylvia < dataRegionIdx or dataRegionIdx < QuestRegionType.eQuestRegionType_None then
                    dataRegionIdx = QuestRegionType.eQuestRegionType_None
                  end
                  local regionIdx = questArrayRegionCount[dataRegionIdx]
                  -- DECOMPILER ERROR at PC410: Confused about usage of register: R13 in 'UnsetPending'

                  ;
                  (questSortArrayRegion[dataRegionIdx])[regionIdx] = {questRegion = dataRegionIdx, questType = uiQuestInfo:getQuestType(), questTitle = uiQuestInfo:getTitle(), gruopNo = (uiQuestInfo:getQuestNo())._group, questNo = (uiQuestInfo:getQuestNo())._quest, conditionComp = uiQuestInfo:isSatisfied(), completeCount = 0, isShowWidget = questGroupInfo:isCheckShow(), isCleared = uiQuestInfo._isCleared, isNext = false, isGroupQuest = false, groupIdx = questGroupIndex, groupCount = 1, resetTime = uiQuestInfo:getResetTime(), repeatTime = uiQuestInfo:getRepeatTime(), isSubQuest = false}
                  -- DECOMPILER ERROR at PC415: Confused about usage of register: R13 in 'UnsetPending'

                  questArrayRegionCount[dataRegionIdx] = questArrayRegionCount[dataRegionIdx] + 1
                  do
                    local typeIdx = questArrayTypeCount[uiQuestInfo:getQuestType()]
                    -- DECOMPILER ERROR at PC460: Confused about usage of register: R14 in 'UnsetPending'

                    ;
                    (questSortArrayType[uiQuestInfo:getQuestType()])[typeIdx] = {questRegion = dataRegionIdx, questType = uiQuestInfo:getQuestType(), questTitle = uiQuestInfo:getTitle(), gruopNo = (uiQuestInfo:getQuestNo())._group, questNo = (uiQuestInfo:getQuestNo())._quest, conditionComp = uiQuestInfo:isSatisfied(), completeCount = 0, isShowWidget = questGroupInfo:isCheckShow(), isCleared = uiQuestInfo._isCleared, isNext = false, isGroupQuest = false, groupIdx = questGroupIndex, groupCount = 1, resetTime = uiQuestInfo:getResetTime(), repeatTime = uiQuestInfo:getRepeatTime(), isSubQuest = false}
                    -- DECOMPILER ERROR at PC469: Confused about usage of register: R14 in 'UnsetPending'

                    questArrayTypeCount[uiQuestInfo:getQuestType()] = questArrayTypeCount[uiQuestInfo:getQuestType()] + 1
                    if uiQuestInfo._isProgressing then
                      progressQuestCount = progressQuestCount + 1
                      -- DECOMPILER ERROR at PC478: Confused about usage of register: R14 in 'UnsetPending'

                      questArrayRegionProgressCount[dataRegionIdx] = questArrayRegionProgressCount[dataRegionIdx] + 1
                      -- DECOMPILER ERROR at PC487: Confused about usage of register: R14 in 'UnsetPending'

                      questArrayTypeProgressCount[uiQuestInfo:getQuestType()] = questArrayTypeProgressCount[uiQuestInfo:getQuestType()] + 1
                    end
                    -- DECOMPILER ERROR at PC489: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC489: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
              -- DECOMPILER ERROR at PC489: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC489: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC489: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC489: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC489: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC489: LeaveBlock: unexpected jumping out DO_STMT

            end
          end
        end
      end
    end
  end
  ;
  ((self.ui).questCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_COUNTQUEST", "count", progressQuestCount))
  useArray = {}
  if QuestTabType.QuestTabType_Progress == progressingActiveTab then
    local emptyHide = ((self.ui).chkEmptyGroupHide):IsCheck()
    local arrayIdx = 1
    if ((self.ui).radioTerritoryGroup):IsCheck() then
      local regionCount = QuestRegionType.eQuestRegionType_Count - 1
      for index = 0, regionCount do
        local regionIdx = questArrayRegionSort[index]
        local count = questArrayRegionCount[regionIdx]
        local doInsertData = function()
    -- function num : 0_10_0 , upvalues : isContentsEnableMedia, QuestRegionType, index, isContentsEnableValencia, isContentsEnableKamasilvia, useArray, arrayIdx, regionIdx, regionString, regionOpen, count, questSortArrayRegion
    if not isContentsEnableMedia and QuestRegionType.eQuestRegionType_Media - 1 == index then
      return 
    end
    if not isContentsEnableValencia and QuestRegionType.eQuestRegionType_Valencia - 1 == index then
      return 
    end
    if not isContentsEnableKamasilvia and QuestRegionType.eQuestRegionType_Kamasylvia - 1 == index then
      return 
    end
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

    useArray[arrayIdx] = {isQuest = false, isNext = false, isCleared = false, questRegion = regionIdx, questType = nil, title = regionString[regionIdx], gruopNo = nil, questNo = nil, conditionComp = nil, isShowWidget = nil, groupIdx = nil, isGroupQuest = nil, groupCount = nil, resetTime = nil, repeatTime = nil, isSubQuest = nil}
    arrayIdx = arrayIdx + 1
    if regionOpen[regionIdx] and count > 0 then
      for questIdx = 0, count - 1 do
        -- DECOMPILER ERROR at PC176: Confused about usage of register: R4 in 'UnsetPending'

        useArray[arrayIdx] = {isQuest = true, isNext = ((questSortArrayRegion[regionIdx])[questIdx]).isNext, isCleared = ((questSortArrayRegion[regionIdx])[questIdx]).isCleared, questRegion = ((questSortArrayRegion[regionIdx])[questIdx]).questRegion, questType = ((questSortArrayRegion[regionIdx])[questIdx]).questType, title = ((questSortArrayRegion[regionIdx])[questIdx]).questTitle, gruopNo = ((questSortArrayRegion[regionIdx])[questIdx]).gruopNo, questNo = ((questSortArrayRegion[regionIdx])[questIdx]).questNo, posCount = ((questSortArrayRegion[regionIdx])[questIdx]).posCount, conditionComp = ((questSortArrayRegion[regionIdx])[questIdx]).conditionComp, completeCount = ((questSortArrayRegion[regionIdx])[questIdx]).completeCount, isShowWidget = ((questSortArrayRegion[regionIdx])[questIdx]).isShowWidget, groupIdx = ((questSortArrayRegion[regionIdx])[questIdx]).groupIdx, isGroupQuest = ((questSortArrayRegion[regionIdx])[questIdx]).isGroupQuest, groupCount = ((questSortArrayRegion[regionIdx])[questIdx]).groupCount, resetTime = ((questSortArrayRegion[regionIdx])[questIdx]).resetTime, repeatTime = ((questSortArrayRegion[regionIdx])[questIdx]).repeatTime, isSubQuest = ((questSortArrayRegion[regionIdx])[questIdx]).isSubQuest}
        arrayIdx = arrayIdx + 1
      end
    end
  end

        -- DECOMPILER ERROR at PC547: Unhandled construct in 'MakeBoolean' P1

        if emptyHide and count > 0 then
          doInsertData()
        end
        doInsertData()
      end
    else
      local typeCount = questType.count - 1
      for typeIdx = 0, typeCount do
        local count = questArrayTypeCount[typeIdx]
        local doInsertData = function()
    -- function num : 0_10_1 , upvalues : useArray, arrayIdx, typeIdx, typeString, typeOpen, count, questSortArrayType
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

    useArray[arrayIdx] = {isQuest = false, isNext = false, isCleared = false, questRegion = nil, questType = typeIdx, title = typeString[typeIdx], gruopNo = nil, questNo = nil, conditionComp = nil, isShowWidget = nil, groupIdx = nil, isGroupQuest = nil, groupCount = nil, resetTime = nil, repeatTime = nil, isSubQuest = nil}
    arrayIdx = arrayIdx + 1
    if typeOpen[typeIdx] and count > 0 then
      for questIdx = 0, count - 1 do
        -- DECOMPILER ERROR at PC146: Confused about usage of register: R4 in 'UnsetPending'

        useArray[arrayIdx] = {isQuest = true, isNext = ((questSortArrayType[typeIdx])[questIdx]).isNext, isCleared = ((questSortArrayType[typeIdx])[questIdx]).isCleared, questRegion = ((questSortArrayType[typeIdx])[questIdx]).questRegion, questType = ((questSortArrayType[typeIdx])[questIdx]).questType, title = ((questSortArrayType[typeIdx])[questIdx]).questTitle, gruopNo = ((questSortArrayType[typeIdx])[questIdx]).gruopNo, questNo = ((questSortArrayType[typeIdx])[questIdx]).questNo, posCount = ((questSortArrayType[typeIdx])[questIdx]).posCount, conditionComp = ((questSortArrayType[typeIdx])[questIdx]).conditionComp, completeCount = ((questSortArrayType[typeIdx])[questIdx]).completeCount, isShowWidget = ((questSortArrayType[typeIdx])[questIdx]).isShowWidget, groupIdx = ((questSortArrayType[typeIdx])[questIdx]).groupIdx, isGroupQuest = ((questSortArrayType[typeIdx])[questIdx]).isGroupQuest, groupCount = ((questSortArrayType[typeIdx])[questIdx]).groupCount, resetTime = ((questSortArrayType[typeIdx])[questIdx]).resetTime, repeatTime = ((questSortArrayType[typeIdx])[questIdx]).repeatTime, isSubQuest = ((questSortArrayType[typeIdx])[questIdx]).isSubQuest}
        arrayIdx = arrayIdx + 1
      end
    end
  end

        -- DECOMPILER ERROR at PC577: Unhandled construct in 'MakeBoolean' P1

        if emptyHide and count > 0 then
          doInsertData()
        end
        doInsertData()
      end
    end
  elseif QuestTabType.QuestTabType_Recommendation == progressingActiveTab then
    local arrayIdx = 1
    for groupIdx = 0, questGroupCount - 1 do
      local questGroupInfo = questListInfo:getRecommendationQuestGroupAt(groupIdx)
      local groupTitle = questGroupInfo:getTitle()
      local questCount = questGroupInfo:getQuestCount()
      local completeHide = ((self.ui).hideCompBtn):IsCheck()
      local completeChkCount = 0
      local hideCount = 0
      local sumHideCount = 0
      for chkIdx = 0, questCount - 1 do
        local uiQuestInfo = questGroupInfo:getQuestAt(chkIdx)
        if uiQuestInfo:checkHideCondition() == false and uiQuestInfo:checkVisibleCondition() == true then
          local isCleared = uiQuestInfo._isCleared
          if isCleared == true then
            completeChkCount = completeChkCount + 1
          end
        else
          hideCount = hideCount + 1
        end
      end
      sumHideCount = questCount - (hideCount)
      local makeRecommandArray = function()
    -- function num : 0_10_2 , upvalues : questArrayGroupCount, groupIdx, questArrayGroupCompleteCount, useArray, arrayIdx, groupTitle, questCount, questGroupInfo, questGroupCount, completeHide
    -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

    questArrayGroupCount[groupIdx] = 0
    -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

    questArrayGroupCompleteCount[groupIdx] = 0
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

    useArray[arrayIdx] = {isQuest = false, isNext = false, isCleared = false, questRegion = arrayIdx, questType = 8, title = groupTitle, gruopNo = nil, questNo = nil, posCount = 0, conditionComp = nil, completeCount = 0, isShowWidget = nil, isGroupQuest = nil, groupIdx = groupIdx, groupCount = questCount, resetTime = nil, repeatTime = nil, isSubQuest = nil}
    arrayIdx = arrayIdx + 1
    local recommandCount = 0
    for questIdx = 0, questCount - 1 do
      local uiQuestInfo = questGroupInfo:getQuestAt(questIdx)
      do
        if uiQuestInfo:checkHideCondition() == false and uiQuestInfo:checkVisibleCondition() == true then
          local setQuestData = function()
      -- function num : 0_10_2_0 , upvalues : uiQuestInfo, groupIdx, useArray, arrayIdx, questGroupCount, questArrayGroupCompleteCount
      do
        local dataRegionIdx = uiQuestInfo:getQuestRegion()
        if dataRegionIdx > 8 or dataRegionIdx < 0 then
          dataRegionIdx = 0
        end
        -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

        useArray[arrayIdx] = {isQuest = true, isNext = (not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing), isCleared = uiQuestInfo._isCleared, questRegion = dataRegionIdx, questType = uiQuestInfo:getQuestType(), title = uiQuestInfo:getTitle(), gruopNo = (uiQuestInfo:getQuestNo())._group, questNo = (uiQuestInfo:getQuestNo())._quest, posCount = uiQuestInfo:getQuestPositionCount(), conditionComp = uiQuestInfo:isSatisfied(), completeCount = 0, isShowWidget = uiQuestInfo:getAcceptConditionText(), isGroupQuest = true, groupIdx = groupIdx, groupCount = questGroupCount, resetTime = uiQuestInfo:getResetTime(), repeatTime = uiQuestInfo:getRepeatTime(), isSubQuest = uiQuestInfo._isSubQuest}
        arrayIdx = arrayIdx + 1
        -- DECOMPILER ERROR at PC93: Confused about usage of register: R1 in 'UnsetPending'

        if uiQuestInfo._isCleared then
          questArrayGroupCompleteCount[groupIdx] = questArrayGroupCompleteCount[groupIdx] + 1
        end
        -- DECOMPILER ERROR: 4 unprocessed JMP targets
      end
    end

          if completeHide == true and not uiQuestInfo._isCleared then
            setQuestData()
            recommandCount = recommandCount + 1
          end
        end
        setQuestData()
        recommandCount = recommandCount + 1
      end
    end
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

    questArrayGroupCount[groupIdx] = recommandCount
  end

      if completeChkCount < sumHideCount then
        makeRecommandArray()
      elseif not completeHide and sumHideCount ~= 0 then
        makeRecommandArray()
      end
    end
  elseif QuestTabType.QuestTabType_Repetition == progressingActiveTab then
    local arrayIdx = 1
    for groupIdx = 0, questGroupCount - 1 do
      local questGroupInfo = questListInfo:getRepetitionQuestGroupAt(groupIdx)
      local groupTitle = questGroupInfo:getTitle()
      local questCount = questGroupInfo:getQuestCount()
      local completeChkCount = 0
      local hideCount = 0
      local sumHideCount = 0
      for chkIdx = 0, questCount - 1 do
        local uiQuestInfo = questGroupInfo:getQuestAt(chkIdx)
        if uiQuestInfo:checkHideCondition() == false and uiQuestInfo:checkVisibleCondition() == true then
          local isCleared = uiQuestInfo._isCleared
          if isCleared == true then
            completeChkCount = completeChkCount + 1
          end
        else
          hideCount = hideCount + 1
        end
      end
      sumHideCount = questCount - (hideCount)
      local makeRepetitiveArray = function()
    -- function num : 0_10_3 , upvalues : questArrayGroupCount, groupIdx, questArrayGroupCompleteCount, useArray, arrayIdx, groupTitle, questCount, self, questGroupInfo, repetitiveQuestGroupOpen, questGroupCount
    -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

    questArrayGroupCount[groupIdx] = 0
    -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

    questArrayGroupCompleteCount[groupIdx] = 0
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

    useArray[arrayIdx] = {isQuest = false, isNext = false, isCleared = false, questRegion = arrayIdx, questType = 8, title = groupTitle, gruopNo = nil, questNo = nil, posCount = 0, conditionComp = nil, completeCount = 0, isShowWidget = nil, isGroupQuest = nil, groupIdx = groupIdx, groupCount = questCount, resetTime = nil, repeatTime = nil, isSubQuest = nil}
    arrayIdx = arrayIdx + 1
    local recommandCount = 0
    local completeHide = ((self.ui).hideCompBtn):IsCheck()
    for questIdx = 0, questCount - 1 do
      local uiQuestInfo = questGroupInfo:getQuestAt(questIdx)
      do
        if uiQuestInfo:checkHideCondition() == false and uiQuestInfo:checkVisibleCondition() == true then
          do
            local setQuestData = function()
      -- function num : 0_10_3_0 , upvalues : uiQuestInfo, repetitiveQuestGroupOpen, groupIdx, completeHide, useArray, arrayIdx, questGroupCount, questArrayGroupCompleteCount
      do
        local dataRegionIdx = uiQuestInfo:getQuestRegion()
        if dataRegionIdx > 8 or dataRegionIdx < 0 then
          dataRegionIdx = 0
        end
        if repetitiveQuestGroupOpen[groupIdx] then
          local questInfoResetTime = uiQuestInfo:getResetTime()
          local questInfoRepeatTime = uiQuestInfo:getRepeatTime()
          local questInfoIsNext = (not uiQuestInfo._isProgressing and not uiQuestInfo._isCleared)
          local questInfoTitle = uiQuestInfo:getTitle()
          local questInfoIsCleared = uiQuestInfo._isCleared
          if uiQuestInfo._isCleared and questInfoRepeatTime > 0 then
            if Int64toInt32(getLeftSecond_TTime64(questInfoResetTime)) > 0 then
              questInfoIsNext = false
            else
              questInfoIsCleared = false
              questInfoIsNext = true
            end
          end
          -- DECOMPILER ERROR at PC103: Confused about usage of register: R6 in 'UnsetPending'

          if not completeHide or questInfoRepeatTime > 0 or not questInfoIsCleared then
            useArray[arrayIdx] = {isQuest = true, isNext = questInfoIsNext, isCleared = questInfoIsCleared, questRegion = dataRegionIdx, questType = uiQuestInfo:getQuestType(), title = questInfoTitle, gruopNo = (uiQuestInfo:getQuestNo())._group, questNo = (uiQuestInfo:getQuestNo())._quest, posCount = uiQuestInfo:getQuestPositionCount(), conditionComp = uiQuestInfo:isSatisfied(), completeCount = 0, isShowWidget = uiQuestInfo:getAcceptConditionText(), isGroupQuest = true, groupIdx = groupIdx, groupCount = questGroupCount, resetTime = questInfoResetTime, repeatTime = questInfoRepeatTime, isSubQuest = uiQuestInfo._isSubQuest}
            arrayIdx = arrayIdx + 1
          end
        end
        -- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

        if uiQuestInfo._isCleared then
          questArrayGroupCompleteCount[groupIdx] = questArrayGroupCompleteCount[groupIdx] + 1
        end
        -- DECOMPILER ERROR: 7 unprocessed JMP targets
      end
    end

            setQuestData()
            recommandCount = recommandCount + 1
            -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    -- DECOMPILER ERROR at PC74: Confused about usage of register: R2 in 'UnsetPending'

    questArrayGroupCount[groupIdx] = recommandCount
  end

      if sumHideCount ~= 0 then
        makeRepetitiveArray()
      end
    end
  else
    local arrayIdx = 1
    for groupIdx = 0, questGroupCount - 1 do
      local questGroupInfo = questListInfo:getMainQuestGroupAt(groupIdx)
      local groupTitle = questGroupInfo:getTitle()
      local questCount = questGroupInfo:getQuestCount()
      local completeHide = ((self.ui).hideCompBtn):IsCheck()
      local completeChkCount = 0
      local hideCount = 0
      local sumHideCount = 0
      for chkIdx = 0, questCount - 1 do
        local uiQuestInfo = questGroupInfo:getQuestAt(chkIdx)
        if uiQuestInfo:checkHideCondition() == false and uiQuestInfo:checkVisibleCondition() == true then
          local isCleared = uiQuestInfo._isCleared
          if isCleared == true then
            completeChkCount = completeChkCount + 1
          end
        else
          hideCount = hideCount + 1
        end
      end
      sumHideCount = questCount - (hideCount)
      local makeArray = function()
    -- function num : 0_10_4 , upvalues : questArrayGroupCount, groupIdx, questArrayGroupCompleteCount, useArray, arrayIdx, groupTitle, questCount, questGroupInfo, questGroupCount, completeHide
    -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

    questArrayGroupCount[groupIdx] = 0
    -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

    questArrayGroupCompleteCount[groupIdx] = 0
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

    useArray[arrayIdx] = {isQuest = false, isNext = false, isCleared = false, questRegion = arrayIdx, questType = 8, title = groupTitle, gruopNo = nil, questNo = nil, posCount = 0, conditionComp = nil, completeCount = 0, isShowWidget = nil, isGroupQuest = nil, groupIdx = groupIdx, groupCount = questCount, resetTime = nil, repeatTime = nil, isSubQuest = nil}
    arrayIdx = arrayIdx + 1
    local mainCount = 0
    for questIdx = 0, questCount - 1 do
      local uiQuestInfo = questGroupInfo:getQuestAt(questIdx)
      do
        if uiQuestInfo:checkHideCondition() == false and uiQuestInfo:checkVisibleCondition() == true then
          local setQuestData = function()
      -- function num : 0_10_4_0 , upvalues : uiQuestInfo, groupIdx, useArray, arrayIdx, questGroupCount, questArrayGroupCompleteCount
      do
        local dataRegionIdx = uiQuestInfo:getQuestRegion()
        if dataRegionIdx > 8 or dataRegionIdx < 0 then
          dataRegionIdx = 0
        end
        -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

        useArray[arrayIdx] = {isQuest = true, isNext = (not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing), isCleared = uiQuestInfo._isCleared, questRegion = dataRegionIdx, questType = uiQuestInfo:getQuestType(), title = uiQuestInfo:getTitle(), gruopNo = (uiQuestInfo:getQuestNo())._group, questNo = (uiQuestInfo:getQuestNo())._quest, posCount = uiQuestInfo:getQuestPositionCount(), conditionComp = uiQuestInfo:isSatisfied(), completeCount = 0, isShowWidget = uiQuestInfo:getAcceptConditionText(), isGroupQuest = true, groupIdx = groupIdx, groupCount = questGroupCount, resetTime = uiQuestInfo:getResetTime(), repeatTime = uiQuestInfo:getRepeatTime(), isSubQuest = uiQuestInfo._isSubQuest}
        arrayIdx = arrayIdx + 1
        -- DECOMPILER ERROR at PC93: Confused about usage of register: R1 in 'UnsetPending'

        if uiQuestInfo._isCleared then
          questArrayGroupCompleteCount[groupIdx] = questArrayGroupCompleteCount[groupIdx] + 1
        end
        -- DECOMPILER ERROR: 4 unprocessed JMP targets
      end
    end

          if completeHide == true and not uiQuestInfo._isCleared then
            setQuestData()
            mainCount = mainCount + 1
          end
        end
        setQuestData()
        mainCount = mainCount + 1
      end
    end
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

    questArrayGroupCount[groupIdx] = mainCount
  end

      if completeChkCount < sumHideCount then
        makeArray()
      elseif not completeHide and sumHideCount ~= 0 then
        makeArray()
      end
    end
  end
  -- DECOMPILER ERROR: 30 unprocessed JMP targets
end

local beforeUiCount = 0
local isCheckConsolePadGroup = true
local spreadIndex = -1
QuestWindow.update = function(self)
  -- function num : 0_11 , upvalues : QuestWindow, QuestTabType, useArray, questArrayTypeProgressCount, questArrayRegionProgressCount, questArrayGroupCompleteCount, questArrayGroupCount, regionOpen, typeOpen, repetitiveQuestGroupOpen, UI_color, UI_TM, questType, beforeUiCount, isCheckConsolePadGroup
  local progressingActiveTab = QuestWindow:GetProgressingActiveTab()
  if QuestTabType.QuestTabType_Progress == progressingActiveTab then
    ((self.ui).groupTypeBG):SetShow(true)
    ;
    ((self.ui).ListFilterBG):SetShow(false)
  else
    if QuestTabType.QuestTabType_Recommendation == progressingActiveTab then
      ((self.ui).groupTypeBG):SetShow(false)
      ;
      ((self.ui).ListFilterBG):SetShow(true)
    else
      if QuestTabType.QuestTabType_Repetition == progressingActiveTab then
        ((self.ui).groupTypeBG):SetShow(false)
        ;
        ((self.ui).ListFilterBG):SetShow(true)
      else
        ;
        ((self.ui).groupTypeBG):SetShow(false)
        ;
        ((self.ui).ListFilterBG):SetShow(true)
      end
    end
  end
  QuestWindow:ResetDataArray()
  QuestWindow:MakeDataArray()
  for uiIdx = 0, (self.config).slotMaxCount - 1 do
    ((((self.uiPool).groupTitle)[uiIdx]).bg):SetShow(false)
    ;
    ((((self.uiPool).listMain)[uiIdx]).bg):SetShow(false)
  end
  -- DECOMPILER ERROR at PC88: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.config).listCount = #useArray
  ;
  (UIScroll.SetButtonSize)((self.ui).scroll, (self.config).slotMaxCount, (self.config).listCount)
  do
    local uiCount = 0
    for questIdx = (QuestWindow.config).startSlotIndex, (self.config).listCount do
      if (self.config).slotMaxCount - 1 < uiCount then
        break
      end
      if (self.config).listCount > 0 then
        local countBase = 0
        if QuestTabType.QuestTabType_Progress == progressingActiveTab then
          if not ((self.ui).radioTerritoryGroup):IsCheck() then
            countBase = questArrayTypeProgressCount[(useArray[questIdx]).questType]
          else
            countBase = questArrayRegionProgressCount[(useArray[questIdx]).questRegion]
          end
        else
          countBase = questArrayGroupCompleteCount[(useArray[questIdx]).groupIdx] .. "/" .. questArrayGroupCount[(useArray[questIdx]).groupIdx]
        end
        if (useArray[questIdx]).isQuest == false then
          ((((self.uiPool).groupTitle)[uiCount]).bg):SetShow(true)
          local isOpenTypeCheck = 0
          local typeKey = 0
          local clearedQuestCnt = 0
          local totalQuestCnt = 0
          local progressRate = 0
          local iconType = 0
          ;
          ((((self.uiPool).groupTitle)[uiCount]).name):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_GROUPTITLE", "title", (useArray[questIdx]).title, "count", countBase))
          ;
          ((((self.uiPool).groupTitle)[uiCount]).bg):addInputEvent("Mouse_On", "QuestWindow_SimpleTooltip(true, " .. questIdx .. ", " .. uiCount .. ", " .. tostring(countBase) .. ")")
          ;
          ((((self.uiPool).groupTitle)[uiCount]).bg):addInputEvent("Mouse_Out", "QuestWindow_SimpleTooltip()")
          local isBarExpand = nil
          if QuestTabType.QuestTabType_Progress == progressingActiveTab then
            if ((self.ui).radioTerritoryGroup):IsCheck() then
              isOpenTypeCheck = 0
              typeKey = (useArray[questIdx]).questRegion
              clearedQuestCnt = ToClient_GetClearedQuestCountByQuestRegion(typeKey)
              totalQuestCnt = ToClient_GetTotalQuestCountByQuestRegion(typeKey)
              progressRate = clearedQuestCnt / totalQuestCnt * 100
              iconType = 8
              isBarExpand = regionOpen[typeKey]
            else
              isOpenTypeCheck = 1
              typeKey = (useArray[questIdx]).questType
              clearedQuestCnt = ToClient_GetClearedQuestCountByQuestType(typeKey)
              totalQuestCnt = ToClient_GetTotalQuestCountByQuestType(typeKey)
              progressRate = clearedQuestCnt / totalQuestCnt * 100
              iconType = typeKey
              isBarExpand = typeOpen[typeKey]
            end
            ;
            ((((self.uiPool).groupTitle)[uiCount]).completePercent):SetShow(true)
            ;
            ((((self.uiPool).groupTitle)[uiCount]).completePercent):SetText((string.format)("%.2f", progressRate) .. "%")
          else
            if QuestTabType.QuestTabType_Recommendation == progressingActiveTab then
              isOpenTypeCheck = 2
              typeKey = (useArray[questIdx]).groupIdx
              iconType = 8
              isBarExpand = recommendationGroupOpen[typeKey]
              ;
              ((((self.uiPool).groupTitle)[uiCount]).completePercent):SetShow(false)
            else
              if QuestTabType.QuestTabType_Repetition == progressingActiveTab then
                isOpenTypeCheck = 3
                typeKey = (useArray[questIdx]).groupIdx
                iconType = 8
                isBarExpand = repetitiveQuestGroupOpen[typeKey]
                ;
                ((((self.uiPool).groupTitle)[uiCount]).completePercent):SetShow(false)
              else
                isOpenTypeCheck = 4
                typeKey = (useArray[questIdx]).groupIdx
                iconType = 8
                isBarExpand = mainQuestGroupOpen[typeKey]
                ;
                ((((self.uiPool).groupTitle)[uiCount]).completePercent):SetShow(false)
              end
            end
          end
          FGlobal_ChangeOnTextureForDialogQuestIcon((((self.uiPool).groupTitle)[uiCount]).typeIcon, iconType)
          local expandCheckKey = 0
          if not isBarExpand then
            expandCheckKey = 1
          end
          local textureArray = {
[0] = {437, 419, 449, 431}
, 
[1] = {437, 406, 449, 418}
}
          local expandIcon = (((self.uiPool).groupTitle)[uiCount]).expandIcon
          expandIcon:ChangeTextureInfoName("new_ui_common_forlua/default/default_buttons_03.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(expandIcon, (textureArray[expandCheckKey])[1], (textureArray[expandCheckKey])[2], (textureArray[expandCheckKey])[3], (textureArray[expandCheckKey])[4])
          ;
          (expandIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
          expandIcon:setRenderTexture(expandIcon:getBaseTexture())
          ;
          ((((self.uiPool).groupTitle)[uiCount]).bg):addInputEvent("Mouse_LUp", "HandleClick_QuestWindow_UpdateExpandBar( " .. isOpenTypeCheck .. ", " .. typeKey .. ", " .. uiCount .. " )")
        else
          do
            ;
            ((((self.uiPool).listMain)[uiCount]).bg):SetShow(true)
            ;
            ((((self.uiPool).listMain)[uiCount]).showBtn):SetShow(false)
            ;
            ((((self.uiPool).listMain)[uiCount]).btnAuto):SetShow(false)
            ;
            ((((self.uiPool).listMain)[uiCount]).btnNavi):SetShow(false)
            ;
            ((((self.uiPool).listMain)[uiCount]).btnGiveup):SetShow(false)
            ;
            ((((self.uiPool).listMain)[uiCount]).btnReward):SetShow(false)
            ;
            ((((self.uiPool).listMain)[uiCount]).completeCount):SetShow(false)
            ;
            ((((self.uiPool).listMain)[uiCount]).name):SetIgnore(false)
            ;
            ((((self.uiPool).listMain)[uiCount]).remainTime):SetIgnore(false)
            ;
            ((((self.uiPool).listMain)[uiCount]).showBtn):SetCheck(false)
            ;
            ((((self.uiPool).listMain)[uiCount]).showBtn):addInputEvent("Mouse_LUp", "")
            ;
            ((((self.uiPool).listMain)[uiCount]).btnAuto):addInputEvent("Mouse_LUp", "")
            ;
            ((((self.uiPool).listMain)[uiCount]).btnNavi):addInputEvent("Mouse_LUp", "")
            ;
            ((((self.uiPool).listMain)[uiCount]).btnGiveup):addInputEvent("Mouse_LUp", "")
            ;
            ((((self.uiPool).listMain)[uiCount]).btnReward):addInputEvent("Mouse_LUp", "")
            local questListInfo, questGroupInfo, isGroup, groupTotalCount = nil, nil, nil, nil
            FGlobal_ChangeOnTextureForDialogQuestIcon((((self.uiPool).listMain)[uiCount]).typeIcon, (useArray[questIdx]).questType)
            if QuestTabType.QuestTabType_Progress == progressingActiveTab then
              questListInfo = ToClient_GetQuestList()
              questGroupInfo = questListInfo:getQuestGroupAt((useArray[questIdx]).groupIdx)
              isGroup = questGroupInfo:isGroupQuest()
              if isGroup then
                groupTotalCount = questGroupInfo:getTotalQuestCount()
              end
            end
            ;
            ((((self.uiPool).listMain)[uiCount]).remainTime):SetShow(false)
            if not (useArray[questIdx]).isNext then
              ((((self.uiPool).listMain)[uiCount]).typeIcon):SetShow(true)
              ;
              ((((self.uiPool).listMain)[uiCount]).typeIcon):SetSpanSize(40, 0)
              ;
              ((((self.uiPool).listMain)[uiCount]).name):SetSpanSize(65, 0)
              if QuestTabType.QuestTabType_Progress == progressingActiveTab then
                ((((self.uiPool).listMain)[uiCount]).showBtn):SetShow(true)
                ;
                ((((self.uiPool).listMain)[uiCount]).showBtn):SetCheck((useArray[questIdx]).isShowWidget)
                local showCheckKey = (useArray[questIdx]).questNo
                if isGroup then
                  showCheckKey = 0
                end
                ;
                ((((self.uiPool).listMain)[uiCount]).showBtn):addInputEvent("Mouse_LUp", "HandleClicked_QuestWindow_ShowCheck(" .. (useArray[questIdx]).gruopNo .. "," .. showCheckKey .. ")")
              end
              do
                if (useArray[questIdx]).isCleared then
                  local groupTitle = (useArray[questIdx]).title
                  local stringColor = UI_color.C_FF888888
                  do
                    if QuestTabType.QuestTabType_Progress == progressingActiveTab and isGroup then
                      local replaceTitle = questGroupInfo:getTitle() .. "(" .. (useArray[questIdx]).completeCount + 1 .. "/" .. groupTotalCount .. ")"
                      groupTitle = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GROUPTITLEINFO", "titleinfo", replaceTitle)
                      stringColor = UI_color.C_FFEEBA3E
                    end
                    ;
                    ((((self.uiPool).listMain)[uiCount]).name):SetTextMode(UI_TM.eTextMode_LimitText)
                    if ((((self.uiPool).listMain)[uiCount]).btnReward):GetShow() then
                      ((((self.uiPool).listMain)[uiCount]).name):SetSize(240, 20)
                    else
                      ;
                      ((((self.uiPool).listMain)[uiCount]).name):SetSize(300, 20)
                    end
                    ;
                    ((((self.uiPool).listMain)[uiCount]).name):SetText(groupTitle)
                    ;
                    ((((self.uiPool).listMain)[uiCount]).name):SetIgnore(true)
                    ;
                    ((((self.uiPool).listMain)[uiCount]).name):SetFontColor(stringColor)
                    if Int64toInt32(getLeftSecond_TTime64((useArray[questIdx]).resetTime)) > 0 then
                      ((((self.uiPool).listMain)[uiCount]).remainTime):SetShow(true)
                      local remainTime = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTINFO_REMAINTIME", "time", convertStringFromDatetime(getLeftSecond_TTime64((useArray[questIdx]).resetTime)))
                      ;
                      ((((self.uiPool).listMain)[uiCount]).remainTime):SetText(remainTime)
                    end
                    do
                      if questType.black == (useArray[questIdx]).questType then
                        ((((self.uiPool).listMain)[uiCount]).name):SetFontColor(4290209076)
                      else
                        ;
                        ((((self.uiPool).listMain)[uiCount]).name):SetFontColor(4287405590)
                      end
                      local groupTitle = (useArray[questIdx]).title
                      if QuestTabType.QuestTabType_Progress == progressingActiveTab and isGroup then
                        ((((self.uiPool).listMain)[uiCount]).typeIcon):SetSpanSize(60, 0)
                        ;
                        ((((self.uiPool).listMain)[uiCount]).name):SetSpanSize(85, 0)
                        ;
                        ((((self.uiPool).listMain)[uiCount]).showBtn):SetShow(false)
                        local beforIdx = uiCount - 1
                        if beforIdx >= 0 then
                          FGlobal_ChangeOnTextureForDialogQuestIcon((((self.uiPool).listMain)[beforIdx]).typeIcon, (useArray[questIdx]).questType)
                          ;
                          ((((self.uiPool).listMain)[uiCount]).typeIcon):SetShow(false)
                          ;
                          ((((self.uiPool).listMain)[uiCount]).typeIcon):SetSpanSize(40, 0)
                          ;
                          ((((self.uiPool).listMain)[uiCount]).name):SetSpanSize(65, 0)
                        end
                      end
                      do
                        do
                          ;
                          ((((self.uiPool).listMain)[uiCount]).name):SetText(groupTitle)
                          if (useArray[questIdx]).conditionComp then
                            ((((self.uiPool).listMain)[uiCount]).name):SetFontColor(UI_color.C_FFEE5555)
                            ;
                            ((((self.uiPool).listMain)[uiCount]).name):SetText(PAGetString(Defines.StringSheet_RESOURCE, "WORLDMAP_WOKRPROGRESS_TXT_PROGRESS_2") .. " : " .. (useArray[questIdx]).title)
                          end
                          local questInfo = questList_getQuestStatic((useArray[questIdx]).gruopNo, (useArray[questIdx]).questNo)
                          do
                            local posCount = questInfo:getQuestPositionCount()
                            ;
                            ((((self.uiPool).listMain)[uiCount]).btnAuto):SetShow((posCount ~= 0 and not (useArray[questIdx]).isCleared))
                            ;
                            ((((self.uiPool).listMain)[uiCount]).btnNavi):SetShow((posCount ~= 0 and not (useArray[questIdx]).isCleared))
                            ;
                            ((((self.uiPool).listMain)[uiCount]).btnGiveup):SetShow(not (useArray[questIdx]).isCleared)
                            ;
                            ((((self.uiPool).listMain)[uiCount]).btnReward):SetShow(not (useArray[questIdx]).isCleared)
                            if ((((self.uiPool).listMain)[uiCount]).btnReward):GetShow() then
                              ((((self.uiPool).listMain)[uiCount]).name):SetSize(260, 20)
                            else
                              ((((self.uiPool).listMain)[uiCount]).name):SetSize(300, 20)
                            end
                            ;
                            ((((self.uiPool).listMain)[uiCount]).showBtn):SetShow(false)
                            do
                              if isGroup then
                                local beforIdx = uiCount - 1
                                if beforIdx >= 0 then
                                  ((((self.uiPool).listMain)[beforIdx]).showBtn):SetShow(false)
                                end
                              end
                              if ((((self.uiPool).listMain)[uiCount]).btnReward):GetShow() then
                                ((((self.uiPool).listMain)[uiCount]).name):SetSize(260, 20)
                              else
                                ((((self.uiPool).listMain)[uiCount]).name):SetSize(300, 20)
                              end
                              ;
                              ((((self.uiPool).listMain)[uiCount]).name):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_NOTACCEPTTITLE", "title", (useArray[questIdx]).title))
                              ;
                              ((((self.uiPool).listMain)[uiCount]).name):SetFontColor(UI_color.C_FFEDE699)
                              FGlobal_ChangeOnTextureForDialogQuestIcon((((self.uiPool).listMain)[uiCount]).typeIcon, (useArray[questIdx]).questType)
                              ;
                              ((((self.uiPool).listMain)[uiCount]).typeIcon):SetShow(true)
                              if not (useArray[questIdx]).isSubQuest then
                                ((((self.uiPool).listMain)[uiCount]).typeIcon):SetSpanSize(40, 0)
                                ;
                                ((((self.uiPool).listMain)[uiCount]).name):SetSpanSize(65, 0)
                              else
                                ((((self.uiPool).listMain)[uiCount]).typeIcon):SetSpanSize(65, 0)
                                ;
                                ((((self.uiPool).listMain)[uiCount]).name):SetSpanSize(90, 0)
                              end
                              ;
                              ((((self.uiPool).listMain)[uiCount]).btnAuto):SetShow(true)
                              ;
                              ((((self.uiPool).listMain)[uiCount]).btnNavi):SetShow(true)
                              local questCondition = QuestConditionCheckType.eQuestConditionCheckType_Complete
                              if (useArray[questIdx]).conditionComp then
                                questCondition = QuestConditionCheckType.eQuestConditionCheckType_Complete
                              elseif not (useArray[questIdx]).isCleared then
                                if (useArray[questIdx]).isNext then
                                  questCondition = QuestConditionCheckType.eQuestConditionCheckType_NotAccept
                                else
                                  questCondition = QuestConditionCheckType.eQuestConditionCheckType_Progress
                                end
                              end
                              ;
                              ((((self.uiPool).listMain)[uiCount]).btnNavi):SetCheck(false)
                              ;
                              ((((self.uiPool).listMain)[uiCount]).btnAuto):SetCheck(false)
                              if (QuestWindow.selectWay).groupID == (useArray[questIdx]).gruopNo and (QuestWindow.selectWay).questID == (useArray[questIdx]).questNo then
                                ((((self.uiPool).listMain)[uiCount]).btnNavi):SetCheck(true)
                                if (QuestWindow.selectWay).isAuto then
                                  ((((self.uiPool).listMain)[uiCount]).btnAuto):SetCheck(true)
                                end
                              end
                              do
                                do
                                  local nextCheck = 0
                                  if not (useArray[questIdx]).isNext then
                                    nextCheck = 1
                                  end
                                  ;
                                  ((((self.uiPool).listMain)[uiCount]).name):addInputEvent("Mouse_LUp", "HandleClicked_QuestWindow_ShowDetailInfo(  " .. (useArray[questIdx]).gruopNo .. ", " .. (useArray[questIdx]).questNo .. ", " .. questCondition .. ", " .. (useArray[questIdx]).groupIdx .. ", " .. nextCheck .. " )")
                                  ;
                                  ((((self.uiPool).listMain)[uiCount]).name):addInputEvent("Mouse_On", "HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. " )")
                                  ;
                                  ((((self.uiPool).listMain)[uiCount]).name):addInputEvent("Mouse_Out", "HandleOnout_QuestWindow_ShowCondition( false, " .. questIdx .. ", " .. uiCount .. " )")
                                  ;
                                  ((((self.uiPool).listMain)[uiCount]).name):setTooltipEventRegistFunc("HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. " )")
                                  if ((((self.uiPool).listMain)[uiCount]).btnAuto):GetShow() then
                                    ((((self.uiPool).listMain)[uiCount]).btnAuto):addInputEvent("Mouse_LUp", "HandleClicked_QuestWindow_FindWay_Prepare( " .. (useArray[questIdx]).gruopNo .. ", " .. (useArray[questIdx]).questNo .. ", " .. questCondition .. ", true )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnAuto):addInputEvent("Mouse_On", "HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. ", " .. 0 .. " )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnAuto):addInputEvent("Mouse_Out", "HandleOnout_QuestWindow_ShowCondition( false, " .. questIdx .. ", " .. uiCount .. ", " .. 0 .. " )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnAuto):setTooltipEventRegistFunc("HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. ", " .. 0 .. " )")
                                  end
                                  if ((((self.uiPool).listMain)[uiCount]).btnNavi):GetShow() then
                                    ((((self.uiPool).listMain)[uiCount]).btnNavi):addInputEvent("Mouse_LUp", "HandleClicked_QuestWindow_FindWay_Prepare( " .. (useArray[questIdx]).gruopNo .. ", " .. (useArray[questIdx]).questNo .. ", " .. questCondition .. ", false )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnNavi):addInputEvent("Mouse_On", "HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. ", " .. 1 .. " )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnNavi):addInputEvent("Mouse_Out", "HandleOnout_QuestWindow_ShowCondition( false, " .. questIdx .. ", " .. uiCount .. ", " .. 1 .. " )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnNavi):setTooltipEventRegistFunc("HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. ", " .. 1 .. " )")
                                  end
                                  if ((((self.uiPool).listMain)[uiCount]).btnGiveup):GetShow() then
                                    ((((self.uiPool).listMain)[uiCount]).btnGiveup):addInputEvent("Mouse_LUp", "HandleClicked_QuestWindow_QuestGiveUp(" .. (useArray[questIdx]).gruopNo .. "," .. (useArray[questIdx]).questNo .. ")")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnGiveup):addInputEvent("Mouse_On", "HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. ", " .. 2 .. " )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnGiveup):addInputEvent("Mouse_Out", "HandleOnout_QuestWindow_ShowCondition( false, " .. questIdx .. ", " .. uiCount .. ", " .. 2 .. " )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnGiveup):setTooltipEventRegistFunc("HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. ", " .. 2 .. " )")
                                  end
                                  if ((((self.uiPool).listMain)[uiCount]).btnReward):GetShow() then
                                    ((((self.uiPool).listMain)[uiCount]).btnReward):addInputEvent("Mouse_LUp", "HandleClicked_QuestReward_Show(" .. (useArray[questIdx]).gruopNo .. "," .. (useArray[questIdx]).questNo .. ")")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnReward):addInputEvent("Mouse_On", "HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. ", " .. 3 .. " )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnReward):addInputEvent("Mouse_Out", "HandleOnout_QuestWindow_ShowCondition( false, " .. questIdx .. ", " .. uiCount .. ", " .. 3 .. " )")
                                    ;
                                    ((((self.uiPool).listMain)[uiCount]).btnReward):setTooltipEventRegistFunc("HandleOnout_QuestWindow_ShowCondition( true, " .. questIdx .. ", " .. uiCount .. ", " .. 3 .. " )")
                                  end
                                  uiCount = uiCount + 1
                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_STMT

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
    if uiCount ~= beforeUiCount then
      beforeUiCount = uiCount
      isCheckConsolePadGroup = true
    end
    if isCheckConsolePadGroup then
      Panel_Window_Quest_New:deleteConsoleUIGroup(2)
      local group_2 = Panel_Window_Quest_New:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
      group_2:setConsoleKeyEventForLUA("QuestWindow_UpScrollEvent", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_UP)
      group_2:setConsoleKeyEventForLUA("QuestWindow_DownScrollEvent", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_DOWN)
      for index = 0, uiCount - 1 do
        if ((((self.uiPool).groupTitle)[index]).bg):GetShow() then
          group_2:addControl(0, index, 1, uiCount, (((self.uiPool).groupTitle)[index]).bg)
        else
          local groupIndex = 0
          local columnCount = 0
          if ((((self.uiPool).listMain)[index]).name):GetShow() then
            columnCount = columnCount + 1
          end
          if ((((self.uiPool).listMain)[index]).btnReward):GetShow() then
            columnCount = columnCount + 1
          end
          if ((((self.uiPool).listMain)[index]).btnGiveup):GetShow() then
            columnCount = columnCount + 1
          end
          if ((((self.uiPool).listMain)[index]).btnNavi):GetShow() then
            columnCount = columnCount + 1
          end
          if ((((self.uiPool).listMain)[index]).btnAuto):GetShow() then
            columnCount = columnCount + 1
          end
          if ((((self.uiPool).listMain)[index]).showBtn):GetShow() then
            columnCount = columnCount + 1
          end
          if ((((self.uiPool).listMain)[index]).name):GetShow() then
            group_2:addControl(groupIndex, index, columnCount, uiCount, (((self.uiPool).listMain)[index]).name)
            groupIndex = groupIndex + 1
          end
          if ((((self.uiPool).listMain)[index]).btnReward):GetShow() then
            group_2:addControl(groupIndex, index, columnCount, uiCount, (((self.uiPool).listMain)[index]).btnReward)
            groupIndex = groupIndex + 1
          end
          if ((((self.uiPool).listMain)[index]).btnGiveup):GetShow() then
            group_2:addControl(groupIndex, index, columnCount, uiCount, (((self.uiPool).listMain)[index]).btnGiveup)
            groupIndex = groupIndex + 1
          end
          if ((((self.uiPool).listMain)[index]).btnNavi):GetShow() then
            group_2:addControl(groupIndex, index, columnCount, uiCount, (((self.uiPool).listMain)[index]).btnNavi)
            groupIndex = groupIndex + 1
          end
          if ((((self.uiPool).listMain)[index]).btnAuto):GetShow() then
            group_2:addControl(groupIndex, index, columnCount, uiCount, (((self.uiPool).listMain)[index]).btnAuto)
            groupIndex = groupIndex + 1
          end
          if ((((self.uiPool).listMain)[index]).showBtn):GetShow() then
            group_2:addControl(groupIndex, index, columnCount, uiCount, (((self.uiPool).listMain)[index]).showBtn)
            groupIndex = groupIndex + 1
          end
        end
      end
      isCheckConsolePadGroup = false
    end
    QuestWindow:ResetDataArray()
    -- DECOMPILER ERROR: 38 unprocessed JMP targets
  end
end

QuestWindow_UpScrollEvent = function()
  -- function num : 0_12
  HandleWheel_QuestWindow(true)
end

QuestWindow_DownScrollEvent = function()
  -- function num : 0_13
  HandleWheel_QuestWindow(false)
end

HandleClicked_QuestNew_Close = function()
  -- function num : 0_14 , upvalues : QuestWindow
  Panel_Window_Quest_New:CloseUISubApp()
  ;
  ((QuestWindow.ui).checkPopUp):SetCheck(false)
  Panel_Window_QuestNew_Show(false)
end

Panel_Window_QuestNew_Show = function(isShow)
  -- function num : 0_15 , upvalues : QuestWindow
  if Panel_Window_Quest_New:IsUISubApp() then
    return 
  end
  if isShow == true then
    Panel_Window_Quest_New:SetShow(true, true)
    Panel_Window_Quest_New:ComputePos()
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (QuestWindow.config).startSlotIndex = 1
    ;
    ((QuestWindow.ui).scroll):SetControlTop()
    QuestWindow:update()
    Panel_Window_QuestNew_SetConsolePadGroup()
  else
    Panel_Window_Quest_New:SetShow(false, false)
    if Panel_CheckedQuestInfo:GetShow() then
      FGlobal_QuestInfoDetail_Close()
    end
  end
  PaGlobal_TutorialManager:handleShowQuestNewWindow(isShow)
end

Panel_Window_QuestNew_PopUp = function()
  -- function num : 0_16 , upvalues : QuestWindow
  if ((QuestWindow.ui).checkPopUp):IsCheck() then
    Panel_Window_Quest_New:OpenUISubApp()
  else
    Panel_Window_Quest_New:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

HandleClick_QuestWindow_Update = function()
  -- function num : 0_17 , upvalues : QuestWindow
  Panel_Window_QuestNew_SetConsolePadGroup()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (QuestWindow.config).startSlotIndex = 1
  ;
  ((QuestWindow.ui).scroll):SetControlTop()
  QuestWindow:update()
end

Panel_Window_QuestNew_SetConsolePadGroup = function()
  -- function num : 0_18 , upvalues : QuestTabType, QuestWindow
  Panel_Window_Quest_New:deleteConsoleUIGroup(1)
  local group_1 = Panel_Window_Quest_New:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  if QuestTabType.QuestTabType_Progress == QuestWindow:GetProgressingActiveTab() then
    group_1:addControl(0, 0, 3, 1, (QuestWindow.ui).radioTerritoryGroup)
    group_1:addControl(1, 0, 3, 1, (QuestWindow.ui).radioTypeGroup)
    group_1:addControl(2, 0, 3, 1, (QuestWindow.ui).chkEmptyGroupHide)
  else
    group_1:addControl(0, 0, 1, 1, (QuestWindow.ui).hideCompBtn)
  end
end

HandleClicked_QuestWindow_ShowCheck = function(gruopNo, questNo)
  -- function num : 0_19
  HandleClicked_QuestShowCheck(gruopNo, questNo)
end

HandleClick_QuestWindow_UpdateExpandBar = function(isRegion, Idx, uiIdx)
  -- function num : 0_20 , upvalues : regionOpen, typeOpen, repetitiveQuestGroupOpen, QuestWindow
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R3 in 'UnsetPending'

  if isRegion == 0 then
    regionOpen[Idx] = not regionOpen[Idx]
  else
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R3 in 'UnsetPending'

    if isRegion == 1 then
      typeOpen[Idx] = not typeOpen[Idx]
    else
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R3 in 'UnsetPending'

      if isRegion == 2 then
        recommendationGroupOpen[Idx] = not recommendationGroupOpen[Idx]
      else
        -- DECOMPILER ERROR at PC30: Confused about usage of register: R3 in 'UnsetPending'

        if isRegion == 3 then
          repetitiveQuestGroupOpen[Idx] = not repetitiveQuestGroupOpen[Idx]
        else
          -- DECOMPILER ERROR at PC36: Confused about usage of register: R3 in 'UnsetPending'

          mainQuestGroupOpen[Idx] = not mainQuestGroupOpen[Idx]
        end
      end
    end
  end
  QuestWindow:update()
end

HandleClicked_SetQuestSelectType = function(gruopNo, questNo, questCondition, isAuto, selectQuestType)
  -- function num : 0_21
  local QuestListInfo = ToClient_GetQuestList()
  QuestListInfo:setQuestSelectType(selectQuestType, true)
  FGlobal_UpdateQuestFavorType()
  HandleClicked_QuestWindow_FindWay(gruopNo, questNo, questCondition, isAuto)
end

HandleClicked_QuestWindow_SetQuestSlectType = function(gruopNo, questNo, questCondition, isAuto, selectQuestType)
  -- function num : 0_22 , upvalues : questSelectType, questSelectTypeString
  if selectQuestType < 0 or questSelectType.etc < selectQuestType then
    return 
  end
  local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "GUILD_MESSAGEBOX_TITLE")
  local messageboxContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_FAVORTYPE_ENABLE", "favortype", questSelectTypeString[selectQuestType])
  local funcSetQuestSelectType = function()
    -- function num : 0_22_0 , upvalues : gruopNo, questNo, questCondition, isAuto, selectQuestType
    HandleClicked_SetQuestSelectType(gruopNo, questNo, questCondition, isAuto, selectQuestType)
  end

  local messageboxData = {title = messageboxTitle, content = messageboxContent, functionYes = funcSetQuestSelectType, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

HandleClicked_QuestWindow_FindWay_Prepare = function(gruopNo, questNo, questCondition, isAuto)
  -- function num : 0_23
  local QuestStatic = questList_getQuestStatic(gruopNo, questNo)
  if QuestStatic ~= nil and ToClient_getTutorialLimitLevel() <= ((getSelfPlayer()):get()):getLevel() then
    local selectQuestType = QuestStatic:getSelectType()
    if selectQuestType ~= 0 then
      local QuestListInfo = ToClient_GetQuestList()
      if QuestListInfo:isQuestSelectType(selectQuestType) == false then
        HandleClicked_QuestWindow_SetQuestSlectType(gruopNo, questNo, questCondition, isAuto, selectQuestType)
      else
        HandleClicked_QuestWindow_FindWay(gruopNo, questNo, questCondition, isAuto)
      end
    else
      do
        HandleClicked_QuestWindow_FindWay(gruopNo, questNo, questCondition, isAuto)
      end
    end
  end
end

HandleClicked_QuestWindow_FindWay = function(gruopNo, questNo, questCondition, isAuto)
  -- function num : 0_24 , upvalues : QuestWindow
  local QuestStatic = questList_getQuestStatic(gruopNo, questNo)
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R5 in 'UnsetPending'

  if QuestStatic ~= nil then
    if QuestConditionCheckType.eQuestConditionCheckType_Complete == questCondition then
      if QuestStatic:isCompleteBlackSpirit() then
        (QuestWindow.selectWay).groupID = ""
        -- DECOMPILER ERROR at PC19: Confused about usage of register: R5 in 'UnsetPending'

        ;
        (QuestWindow.selectWay).questID = ""
        HandleClicked_CallBlackSpirit()
      else
        HandleClicked_QuestWidget_FindTarget(gruopNo, questNo, questCondition, isAuto)
      end
    else
      -- DECOMPILER ERROR at PC42: Confused about usage of register: R5 in 'UnsetPending'

      if QuestConditionCheckType.eQuestConditionCheckType_NotAccept == questCondition then
        if (QuestStatic:getAccecptNpc()):get() == 0 then
          (QuestWindow.selectWay).questID = ""
          -- DECOMPILER ERROR at PC45: Confused about usage of register: R5 in 'UnsetPending'

          ;
          (QuestWindow.selectWay).groupID = ""
          HandleClicked_CallBlackSpirit()
        else
          HandleClicked_QuestWidget_FindTarget(gruopNo, questNo, questCondition, isAuto)
        end
      else
        HandleClicked_QuestWidget_FindTarget(gruopNo, questNo, questCondition, isAuto)
      end
    end
  end
end

HandleClicked_QuestWindow_ShowDetailInfo = function(questGroupId, questId, questCondition_Chk, groupIdx, nextChk)
  -- function num : 0_25 , upvalues : QuestWindow, QuestTabType
  local progressingActiveTab = QuestWindow:GetProgressingActiveTab()
  local isProgressingActive = false
  if QuestTabType.QuestTabType_Progress == progressingActiveTab then
    isProgressingActive = true
  end
  local questListInfo, questGroupInfo, isGroup, groupTitle = nil, nil, nil, nil
  local isNext = false
  local groupCount = nil
  if nextChk == 0 then
    isNext = true
  end
  questListInfo = ToClient_GetQuestList()
  if QuestTabType.QuestTabType_Progress == progressingActiveTab then
    questGroupInfo = questListInfo:getQuestGroupAt(groupIdx)
    isGroup = questGroupInfo:isGroupQuest()
    groupTitle = "nil"
    groupCount = nil
    if isGroup then
      groupCount = questGroupInfo:getTotalQuestCount()
    end
  else
    if QuestTabType.QuestTabType_Recommendation == progressingActiveTab then
      questGroupInfo = questListInfo:getRecommendationQuestGroupAt(groupIdx)
      isGroup = false
      groupTitle = "nil"
      groupCount = nil
    else
      if QuestTabType.QuestTabType_Repetition == progressingActiveTab then
        questGroupInfo = questListInfo:getRepetitionQuestGroupAt(groupIdx)
        isGroup = false
        groupTitle = "nil"
        groupCount = nil
      else
        questGroupInfo = questListInfo:getMainQuestGroupAt(groupIdx)
        isGroup = false
        groupTitle = "nil"
        groupCount = nil
      end
    end
  end
  if isGroup then
    groupTitle = questGroupInfo:getTitle()
  end
  FGlobal_QuestInfoDetail(questGroupId, questId, questCondition_Chk, groupTitle, groupCount, false, not isProgressingActive, isNext)
end

HandleClicked_QuestWindow_QuestGiveUp = function(groupId, questId)
  -- function num : 0_26
  if PaGlobal_TutorialManager:isBeginnerTutorialQuest(groupId, questId) == true and PaGlobal_TutorialManager:isDoingTutorial() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
    return 
  end
  FGlobal_PassGroupIdQuestId(groupId, questId)
  local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "GUILD_MESSAGEBOX_TITLE")
  local messageboxContent = PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_REAL_GIVEUP_QUESTION")
  local messageboxData = {title = messageboxTitle, content = messageboxContent, functionYes = QuestWidget_QuestGiveUp_Confirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

HandleOnout_QuestWindow_ShowCondition = function(isShow, arrayIdx, uiIdx, buttonType)
  -- function num : 0_27 , upvalues : QuestWindow, useArray
  if not ((QuestWindow.ui).tabProgress):IsCheck() then
    if isShow then
      local uiControl = (((QuestWindow.uiPool).listMain)[uiIdx]).name
      local name = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_ACCEPTCONDITION")
      local desc = (useArray[arrayIdx]).isShowWidget
      if buttonType ~= nil then
        if buttonType == 0 then
          uiControl = (((QuestWindow.uiPool).listMain)[uiIdx]).btnAuto
          desc = desc .. "\n\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_AUTONPCNAVI_HELP")
        else
          if buttonType == 1 then
            uiControl = (((QuestWindow.uiPool).listMain)[uiIdx]).btnNavi
            desc = desc .. "\n\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_NPCNAVI_HELP")
          else
            if buttonType == 2 then
              uiControl = (((QuestWindow.uiPool).listMain)[uiIdx]).btnGiveup
              desc = desc .. "\n\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_GIVEUP_HELP")
            else
              if buttonType == 3 then
                uiControl = (((QuestWindow.uiPool).listMain)[uiIdx]).btnReward
                desc = desc .. "\n\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_REWARD_HELP")
              end
            end
          end
        end
      end
      registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(uiControl, name, desc)
    else
      do
        TooltipSimple_Hide()
      end
    end
  end
end

QuestWindow_SimpleTooltip = function(isShow, idx, uiCount, baseCount)
  -- function num : 0_28 , upvalues : QuestWindow, QuestTabType, useArray, questArrayGroupCompleteCount, questArrayGroupCount
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local self = QuestWindow
  if not ((((self.uiPool).groupTitle)[uiCount]).name):IsLimitText() then
    return 
  end
  local progressingActiveTab = QuestWindow:GetProgressingActiveTab()
  if QuestTabType.QuestTabType_Progress == progressingActiveTab then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  name = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_GROUPTITLE", "title", (useArray[idx]).title, "count", questArrayGroupCompleteCount[(useArray[idx]).groupIdx] .. "/" .. questArrayGroupCount[(useArray[idx]).groupIdx])
  control = (((self.uiPool).groupTitle)[uiCount]).bg
  TooltipSimple_Show(control, name, desc)
end

HandleWheel_QuestWindow = function(isScrollUp)
  -- function num : 0_29 , upvalues : QuestWindow
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  (QuestWindow.config).startSlotIndex = (UIScroll.ScrollEvent)((QuestWindow.ui).scroll, isScrollUp, (QuestWindow.config).slotMaxCount, (QuestWindow.config).listCount + 1, (QuestWindow.config).startSlotIndex, 1)
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  if (QuestWindow.config).startSlotIndex < 1 then
    (QuestWindow.config).startSlotIndex = 1
  end
  QuestWindow:update()
end

FGlobal_QuestWindow_Update_FindWay = function(groupId, questId, isAuto)
  -- function num : 0_30 , upvalues : QuestWindow
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  if (QuestWindow.selectWay).groupID == groupId and (QuestWindow.selectWay).questID == questId then
    (QuestWindow.selectWay).groupID = ""
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (QuestWindow.selectWay).questID = ""
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (QuestWindow.selectWay).isAuto = false
  else
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (QuestWindow.selectWay).groupID = groupId
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (QuestWindow.selectWay).questID = questId
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (QuestWindow.selectWay).isAuto = isAuto
  end
  if Panel_Window_Quest_New:GetShow() then
    QuestWindow:update()
  end
end

FGlobal_QuestWindow_favorTypeUpdate = function()
  -- function num : 0_31 , upvalues : QuestWindow
  QuestWindow:favorTypeUpdate()
end

FGlobal_QuestWindowGetStartPosition = function()
  -- function num : 0_32 , upvalues : QuestWindow
  return (QuestWindow.config).startSlotIndex
end

FGlobal_QuestWindow_Update = function()
  -- function num : 0_33 , upvalues : QuestWindow
  QuestWindow:update()
end

FGlobal_QuestWindow_SetProgress = function()
  -- function num : 0_34 , upvalues : QuestWindow
  ((QuestWindow.ui).tabProgress):SetCheck(true)
  ;
  ((QuestWindow.ui).tabImportant):SetCheck(false)
  ;
  ((QuestWindow.ui).tabRepeat):SetCheck(false)
  ;
  ((QuestWindow.ui).tabMain):SetCheck(false)
end

FromClient_QuestWindow_Update = function()
  -- function num : 0_35 , upvalues : QuestWindow
  QuestWindow:update()
end

Panel_Window_QuestNew_OnScreenResize = function()
  -- function num : 0_36
  Panel_Window_Quest_New:ComputePos()
end

Panel_Window_QuestNew_Toggle = function()
  -- function num : 0_37
  Panel_Window_QuestNew_Show(not Panel_Window_Quest_New:GetShow())
end

QuestWindow.registEventHandler = function(self)
  -- function num : 0_38
  ((self.ui).btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_QuestNew_Close()")
  ;
  ((self.ui).checkPopUp):addInputEvent("Mouse_LUp", "Panel_Window_QuestNew_PopUp()")
  ;
  ((self.ui).checkPopUp):addInputEvent("Mouse_On", "Panel_Window_QuestNew_PopUp_ShowIconToolTip(true)")
  ;
  ((self.ui).checkPopUp):addInputEvent("Mouse_Out", "Panel_Window_QuestNew_PopUp_ShowIconToolTip(false)")
  ;
  ((self.ui).btn_Question):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelQuestHistory\" )")
  ;
  ((self.ui).btn_Question):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelQuestHistory\", \"true\")")
  ;
  ((self.ui).btn_Question):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelQuestHistory\", \"false\")")
  ;
  ((self.ui).tabProgress):addInputEvent("Mouse_LUp", "HandleClick_QuestWindow_Update()")
  ;
  ((self.ui).tabImportant):addInputEvent("Mouse_LUp", "HandleClick_QuestWindow_Update()")
  ;
  ((self.ui).tabRepeat):addInputEvent("Mouse_LUp", "HandleClick_QuestWindow_Update()")
  ;
  ((self.ui).tabMain):addInputEvent("Mouse_LUp", "HandleClick_QuestWindow_Update()")
  ;
  ((self.ui).radioTerritoryGroup):addInputEvent("Mouse_LUp", "HandleClick_QuestWindow_Update()")
  ;
  ((self.ui).radioTypeGroup):addInputEvent("Mouse_LUp", "HandleClick_QuestWindow_Update()")
  ;
  ((self.ui).chkEmptyGroupHide):addInputEvent("Mouse_LUp", "HandleClick_QuestWindow_Update()")
  ;
  ((self.ui).hideCompBtn):addInputEvent("Mouse_LUp", "HandleClick_QuestWindow_Update()")
  ;
  ((self.ui).contentBG):addInputEvent("Mouse_UpScroll", "HandleWheel_QuestWindow( true )")
  ;
  ((self.ui).contentBG):addInputEvent("Mouse_DownScroll", "HandleWheel_QuestWindow( false )")
  ;
  (UIScroll.InputEvent)((self.ui).scroll, "HandleWheel_QuestWindow")
end

QuestWindow.registMessageHandler = function(self)
  -- function num : 0_39
  registerEvent("FromClient_UpdateQuestList", "FromClient_QuestWindow_Update")
  registerEvent("onScreenResize", "Panel_Window_QuestNew_OnScreenResize")
end

Panel_Window_QuestNew_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_40 , upvalues : QuestWindow
  if isShow then
    local self = QuestWindow
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if ((self.ui).checkPopUp):IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show((self.ui).checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

QuestWindow:init()
QuestWindow:registEventHandler()
QuestWindow:registMessageHandler()
QuestWindow:nationalCheck()
QuestWindow:favorTypeUpdate()

