-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\questlist\panel_checkedquest.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UIMode = Defines.UIMode
local IM = CppEnums.EProcessorInputMode
PaGlobal_CheckedQuest = {_uiNormalQuestGroup = (UI.getChildControl)(Panel_CheckedQuest, "Static_NormalQuestGroup"), _uiTransBG = (UI.getChildControl)(Panel_CheckedQuest, "Static_TransBG"), _uiResizeButton = (UI.getChildControl)(Panel_CheckedQuest, "Button_Size"), _uiGuideButton = (UI.getChildControl)(Panel_CheckedQuest, "Button_Guide"), _uiGuideButton_Desc = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Guide_Desc"), _uiGuideNumber = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Number"), _uiHistoryButton = (UI.getChildControl)(Panel_CheckedQuest, "Button_History"), _uiHistoryButton_Desc = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Detail_Desc"), _uiFindGuild = (UI.getChildControl)(Panel_CheckedQuest, "Button_WantGuild"), _uiDarkSpirit = (UI.getChildControl)(Panel_CheckedQuest, "Static_DarkSpirit"), _uiDarkSpirit_Notice = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_DarkSpirit_Notice"), _uiNotice_NpcNavi = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_1"), _uiNotice_GiveUp = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_2"), _uiNotice_Reward = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_3"), _uiMouseOn_BG = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Mouse_On"), _uiMouseLeft = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Mouse_Left"), _uiMouseRight = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Mouse_Right"), _uiMouseLeftIcon = (UI.getChildControl)(Panel_CheckedQuest, "Static_Mouse_Left"), _uiMouseRightIcon = (UI.getChildControl)(Panel_CheckedQuest, "Static_Mouse_Right"), _uiTooltipBG = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_IconHelp_BG"), _uifavorLineBG = (UI.getChildControl)(Panel_CheckedQuest, "Static_FavorLineBG"), _uiHelpWidget = nil, _uiScrollBar = nil, _uiOptionButton = nil, 
_uiQuestFavorType = {}
, 
_guildQuest = {}
, _uiList = (Array.new)(), _giveupLimitLv = 10, _maxQuestListCnt = 30, _maxConditionCnt = 5, _defaultButtonSize = 18, _extendButtonSize = 25, _refUiQuestAutoNaviButton = nil, _refUiQuestNaviButton = nil, _refUiQuestTitle = nil}
local MAX_QUEST_FAVOR_TYPE = 6
-- DECOMPILER ERROR at PC165: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_CheckedQuest.initialize = function(self)
  -- function num : 0_0 , upvalues : MAX_QUEST_FAVOR_TYPE
  for ii = 0, self._maxQuestListCnt - 1 do
    local elements = {}
    elements._uiGroupBG = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Static_GroupBG", self._uiNormalQuestGroup, "uiGroupBG_" .. ii)
    elements._uiSelectBG = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Static_SelectedQuestBG", elements._uiGroupBG, "uiGroupSelectBG_" .. ii)
    elements._uiQuestTitle = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "StaticText_Quest_Title", elements._uiGroupBG, "uiQuestTitle_" .. ii)
    elements._uiGroupTitle = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "StaticText_WidgetGroupTitle", elements._uiGroupBG, "uiGroupTitle_" .. ii)
    elements._uiQuestIcon = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Static_Quest_Type", elements._uiGroupBG, "uiQuestIcon_" .. ii)
    elements._uiCompleteNpc = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "StaticText_Quest_ClearNpc", elements._uiGroupBG, "uiCompleteNpc_" .. ii)
    elements._uiAutoNaviBtn = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "CheckButton_AutoNavi", elements._uiGroupBG, "uiAutoNaviBtn_" .. ii)
    elements._uiNaviBtn = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Checkbox_Quest_Navi", elements._uiGroupBG, "uiNaviBtn_" .. ii)
    elements._uiGiveupBtn = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Checkbox_Quest_Giveup", elements._uiGroupBG, "uiGiveupBtn_" .. ii)
    elements._uiHideBtn = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Checkbox_Quest_Hide", elements._uiGroupBG, "_uiHideBtn_" .. ii)
    elements._questNo = {_groupId = 0, _questId = 0}
    elements._uiConditions = (Array.new)()
    for jj = 0, self._maxConditionCnt - 1 do
      -- DECOMPILER ERROR at PC131: Confused about usage of register: R10 in 'UnsetPending'

      (elements._uiConditions)[jj] = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "StaticText_Quest_Demand", elements._uiGroupBG, "uiConditions_" .. ii .. "_" .. jj)
    end
    -- DECOMPILER ERROR at PC134: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._uiList)[ii] = elements
  end
  self:createGuildQuest()
  for ii = 0, MAX_QUEST_FAVOR_TYPE - 1 do
    local controlIdNumber = ii + 1
    local controlId = "CheckButton_FavorType_" .. tostring(controlIdNumber)
    local control = (UI.getChildControl)(self._uiTransBG, controlId)
    control:addInputEvent("Mouse_LUp", "QuestWidget_SelectQuestFavorType(" .. ii .. ")")
    control:addInputEvent("Mouse_On", "QuestWidget_FavorTypeTooltip( true, " .. ii .. ")")
    control:addInputEvent("Mouse_Out", "QuestWidget_FavorTypeTooltip( false, " .. ii .. ")")
    control:SetShow(true)
    -- DECOMPILER ERROR at PC179: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._uiQuestFavorType)[ii] = control
  end
  for ii = 0, MAX_QUEST_FAVOR_TYPE - 1 do
    if ii == 0 then
      ((self._uiQuestFavorType)[ii]):SetPosX(0)
    else
      ;
      ((self._uiQuestFavorType)[ii]):SetPosX(((self._uiQuestFavorType)[ii - 1]):GetPosX() + ((self._uiQuestFavorType)[ii - 1]):GetSizeX() + 3)
    end
    ;
    ((self._uiQuestFavorType)[ii]):SetPosY(4)
  end
  self._uiScrollBar = (UI.getChildControl)(self._uiNormalQuestGroup, "Scroll_CheckQuestList")
  self._uiOptionButton = (UI.getChildControl)(self._uiTransBG, "Button_Option")
  self:initDefaults()
  self:subscribeEvents()
end

-- DECOMPILER ERROR at PC169: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_CheckedQuest.initDefaults = function(self)
  -- function num : 0_1 , upvalues : UI_color
  Panel_CheckedQuest:ActiveMouseEventEffect(true)
  Panel_CheckedQuest:SetShow(true)
  Panel_CheckedQuest:setMaskingChild(true)
  Panel_CheckedQuest:setGlassBackground(true)
  Panel_CheckedQuest:SetDragEnable(false)
  ;
  (self._uiNormalQuestGroup):SetPosX(2)
  ;
  (self._uiNormalQuestGroup):SetIgnore(false)
  ;
  (self._uiNormalQuestGroup):SetAlpha(0)
  ;
  (self._uiNormalQuestGroup):SetSize(Panel_CheckedQuest:GetSizeX(), Panel_CheckedQuest:GetSizeY())
  ;
  (self._uiTransBG):SetNotAbleMasking(true)
  ;
  (self._uiTransBG):SetIgnore(true)
  ;
  (self._uiTransBG):SetPosX(0)
  ;
  (self._uiTransBG):SetPosY(0)
  ;
  (self._uiScrollBar):SetShow(false)
  ;
  (self._uiScrollBar):SetControlTop()
  ;
  (self._uiScrollBar):SetPosX(Panel_CheckedQuest:GetSizeX() - (self._uiScrollBar):GetSizeX())
  ;
  ((self._uiScrollBar):GetControlButton()):SetNotAbleMasking(true)
  ;
  (self._uiResizeButton):SetVerticalBottom()
  ;
  (self._uiResizeButton):SetNotAbleMasking(true)
  ;
  (self._uiResizeButton):SetShow(false)
  ;
  (self._uiResizeButton):SetPosY(Panel_CheckedQuest:GetSizeY())
  ;
  (self._uiResizeButton):SetPosX(150)
  ;
  (self._uiGuideButton):SetShow(false)
  ;
  (self._uiGuideButton):SetNotAbleMasking(true)
  ;
  (self._uiGuideButton_Desc):SetNotAbleMasking(true)
  ;
  (self._uiGuideNumber):SetNotAbleMasking(true)
  ;
  (self._uiGuideButton):ActiveMouseEventEffect(true)
  ;
  (self._uiGuideButton):SetCheck(false)
  ;
  (self._uiGuideButton_Desc):SetShow(false)
  ;
  (self._uiGuideNumber):SetShow(false)
  ;
  (self._uiHistoryButton):SetShow(false)
  ;
  (self._uiHistoryButton):SetNotAbleMasking(true)
  ;
  (self._uiHistoryButton_Desc):SetNotAbleMasking(true)
  ;
  (self._uiHistoryButton_Desc):SetShow(false)
  ;
  (self._uiHistoryButton):ActiveMouseEventEffect(true)
  ;
  (self._uiFindGuild):SetShow(false)
  ;
  (self._uiFindGuild):SetNotAbleMasking(true)
  ;
  (self._uiFindGuild):SetCheck(false)
  ;
  (self._uiNotice_NpcNavi):SetAlpha(0)
  ;
  (self._uiNotice_NpcNavi):SetFontAlpha(0)
  ;
  (self._uiNotice_GiveUp):SetAlpha(0)
  ;
  (self._uiNotice_GiveUp):SetFontAlpha(0)
  ;
  (self._uiNotice_Reward):SetAlpha(0)
  ;
  (self._uiNotice_Reward):SetFontAlpha(0)
  ;
  (self._uiMouseOn_BG):SetShow(false)
  ;
  (self._uiMouseLeft):SetShow(false)
  ;
  (self._uiMouseRight):SetShow(false)
  ;
  (self._uiMouseLeftIcon):SetShow(false)
  ;
  (self._uiMouseRightIcon):SetShow(false)
  self._uiHelpWidget = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_CheckedQuest, "HelpWindow_For_QuestWidget")
  CopyBaseProperty(self._uiNotice_NpcNavi, self._uiHelpWidget)
  ;
  (self._uiHelpWidget):SetColor(UI_color.C_FFFFFFFF)
  ;
  (self._uiHelpWidget):SetAlpha(1)
  ;
  (self._uiHelpWidget):SetFontColor(UI_color.C_FFC4BEBE)
  ;
  (self._uiHelpWidget):SetAutoResize(true)
  ;
  (self._uiHelpWidget):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._uiHelpWidget):SetShow(false)
  ;
  (self._uiHelpWidget):SetNotAbleMasking(true)
  ;
  (self._uifavorLineBG):SetShow(false)
  for ii = 0, self._maxQuestListCnt - 1 do
    (((self._uiList)[ii])._uiGroupBG):SetChildIndex(((self._uiList)[ii])._uiAutoNaviBtn, 9999)
    ;
    (((self._uiList)[ii])._uiGroupBG):SetChildIndex(((self._uiList)[ii])._uiNaviBtn, 9999)
    ;
    (((self._uiList)[ii])._uiGroupBG):SetChildIndex(((self._uiList)[ii])._uiGiveupBtn, 9999)
    ;
    (((self._uiList)[ii])._uiGroupBG):SetChildIndex(((self._uiList)[ii])._uiHideBtn, 9999)
  end
end

-- DECOMPILER ERROR at PC172: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_CheckedQuest.subscribeEvents = function(self)
  -- function num : 0_2
  Panel_CheckedQuest:RegisterShowEventFunc(true, "QuestListShowAni()")
  Panel_CheckedQuest:RegisterShowEventFunc(false, "QuestListHideAni()")
  Panel_CheckedQuest:addInputEvent("Mouse_DownScroll", "QuestWidget_ScrollEvent( true )")
  Panel_CheckedQuest:addInputEvent("Mouse_UpScroll", "QuestWidget_ScrollEvent( false )")
  Panel_CheckedQuest:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
  Panel_CheckedQuest:addInputEvent("Mouse_On", "FGlobal_QuestWidget_MouseOver( true )")
  Panel_CheckedQuest:addInputEvent("Mouse_Out", "FGlobal_QuestWidget_MouseOver( false )")
  ;
  (self._uiTransBG):addInputEvent("Mouse_DownScroll", "QuestWidget_ScrollEvent( true )")
  ;
  (self._uiTransBG):addInputEvent("Mouse_UpScroll", "QuestWidget_ScrollEvent( false )")
  ;
  (self._uiTransBG):addInputEvent("Mouse_On", "FGlobal_QuestWidget_MouseOver( true )")
  ;
  (self._uiTransBG):addInputEvent("Mouse_Out", "FGlobal_QuestWidget_MouseOver( false )")
  ;
  (self._uiNormalQuestGroup):addInputEvent("Mouse_DownScroll", "QuestWidget_ScrollEvent( true )")
  ;
  (self._uiNormalQuestGroup):addInputEvent("Mouse_UpScroll", "QuestWidget_ScrollEvent( false )")
  ;
  (self._uiNormalQuestGroup):addInputEvent("Mouse_On", "FGlobal_QuestWidget_MouseOver( true )")
  ;
  (self._uiNormalQuestGroup):addInputEvent("Mouse_Out", "FGlobal_QuestWidget_MouseOver( false )")
  ;
  (self._uiScrollBar):addInputEvent("Mouse_LPress", "QuestWidget_ScrollLPress()")
  ;
  (self._uiScrollBar):addInputEvent("Mouse_DownScroll", "QuestWidget_ScrollEvent( true )")
  ;
  (self._uiScrollBar):addInputEvent("Mouse_UpScroll", "QuestWidget_ScrollEvent( false )")
  ;
  ((self._uiScrollBar):GetControlButton()):addInputEvent("Mouse_LPress", "QuestWidget_ScrollLPress()")
  ;
  (self._uiResizeButton):addInputEvent("Mouse_LPress", "HandleClicked_QuestWidgetPanelResize()")
  ;
  (self._uiResizeButton):addInputEvent("Mouse_LDown", "HandleClicked_QuestWidgetPanelSize()")
  ;
  (self._uiResizeButton):addInputEvent("Mouse_LUp", "HandleClicked_QuestWidgetSaveResize()")
  ;
  (self._uiResizeButton):addInputEvent("Mouse_On", "HandleOn_QuestWidgetPanelResize( true )")
  ;
  (self._uiResizeButton):addInputEvent("Mouse_Out", "HandleOn_QuestWidgetPanelResize( false )")
  ;
  (self._uiGuideButton):addInputEvent("Mouse_On", "HandleClicked_QuestWidget_GuideQuest_MouseOver( true )")
  ;
  (self._uiGuideButton):addInputEvent("Mouse_Out", "HandleClicked_QuestWidget_GuideQuest_MouseOver( false )")
  ;
  (self._uiGuideButton):addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_GuideQuest()")
  ;
  (self._uiHistoryButton):addInputEvent("Mouse_On", "HandleClicked_QuestNew_MouseOver( true )")
  ;
  (self._uiHistoryButton):addInputEvent("Mouse_Out", "HandleClicked_QuestNew_MouseOver( false )")
  ;
  (self._uiHistoryButton):addInputEvent("Mouse_LUp", "Panel_Window_QuestNew_Toggle()")
  ;
  (self._uiFindGuild):addInputEvent("Mouse_On", "HandleOn_CheckedQuest_WantJoinGuild( true )")
  ;
  (self._uiFindGuild):addInputEvent("Mouse_Out", "HandleOn_CheckedQuest_WantJoinGuild( false )")
  ;
  (self._uiFindGuild):addInputEvent("Mouse_On", "FindGuild_Button_Simpletooltips( true )")
  ;
  (self._uiFindGuild):addInputEvent("Mouse_Out", "FindGuild_Button_Simpletooltips( false )")
  ;
  (self._uiFindGuild):addInputEvent("Mouse_LUp", "HandleClieked_CheckedQuest_WantJoinGuild()")
  ;
  (self._uiOptionButton):addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_OptionButton()")
  ;
  (self._uiOptionButton):addInputEvent("Mouse_On", "ShowTooltip_QuestWidget_OptionButton()")
  ;
  (self._uiOptionButton):addInputEvent("Mouse_Out", "HideTooltip_QuestWidget_OptionButton()")
end

-- DECOMPILER ERROR at PC176: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_CheckedQuest.createGuildQuest = function(self)
  -- function num : 0_3 , upvalues : UI_TM
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._guildQuest)._ControlBG = (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_Static_BG")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._guildQuest)._Title = (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_StaticText_Title")
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._guildQuest)._AutoNavi = (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_CheckButton_AutoNavi")
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._guildQuest)._Navi = (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_Checkbox_Quest_Navi")
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._guildQuest)._Reward = (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_Checkbox_Quest_Reward")
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._guildQuest)._Giveup = (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_Checkbox_Quest_Giveup")
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._guildQuest)._LimitTime = (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_StaticText_LimitTime")
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._guildQuest)._Condition = {(UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_StaticText_Condition1"), (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_StaticText_Condition2"), (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_StaticText_Condition3"), (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_StaticText_Condition4"), (UI.getChildControl)(Panel_CheckedQuest, "GuildQuest_StaticText_Condition5")}
  ;
  (self._uiNormalQuestGroup):AddChild((self._guildQuest)._ControlBG)
  ;
  ((self._guildQuest)._ControlBG):AddChild((self._guildQuest)._Title)
  ;
  ((self._guildQuest)._ControlBG):AddChild((self._guildQuest)._AutoNavi)
  ;
  ((self._guildQuest)._ControlBG):AddChild((self._guildQuest)._Navi)
  ;
  ((self._guildQuest)._ControlBG):AddChild((self._guildQuest)._Reward)
  ;
  ((self._guildQuest)._ControlBG):AddChild((self._guildQuest)._Giveup)
  ;
  ((self._guildQuest)._ControlBG):AddChild((self._guildQuest)._LimitTime)
  ;
  ((self._guildQuest)._ControlBG):AddChild(((self._guildQuest)._Condition)[1])
  ;
  ((self._guildQuest)._ControlBG):AddChild(((self._guildQuest)._Condition)[2])
  ;
  ((self._guildQuest)._ControlBG):AddChild(((self._guildQuest)._Condition)[3])
  ;
  ((self._guildQuest)._ControlBG):AddChild(((self._guildQuest)._Condition)[4])
  ;
  ((self._guildQuest)._ControlBG):AddChild(((self._guildQuest)._Condition)[5])
  Panel_CheckedQuest:RemoveControl((self._guildQuest)._ControlBG)
  Panel_CheckedQuest:RemoveControl((self._guildQuest)._Title)
  Panel_CheckedQuest:RemoveControl((self._guildQuest)._AutoNavi)
  Panel_CheckedQuest:RemoveControl((self._guildQuest)._Navi)
  Panel_CheckedQuest:RemoveControl((self._guildQuest)._Reward)
  Panel_CheckedQuest:RemoveControl((self._guildQuest)._Giveup)
  Panel_CheckedQuest:RemoveControl((self._guildQuest)._LimitTime)
  Panel_CheckedQuest:RemoveControl(((self._guildQuest)._Condition)[1])
  Panel_CheckedQuest:RemoveControl(((self._guildQuest)._Condition)[2])
  Panel_CheckedQuest:RemoveControl(((self._guildQuest)._Condition)[3])
  Panel_CheckedQuest:RemoveControl(((self._guildQuest)._Condition)[4])
  Panel_CheckedQuest:RemoveControl(((self._guildQuest)._Condition)[5])
  ;
  ((self._guildQuest)._ControlBG):SetShow(false)
  ;
  ((self._guildQuest)._ControlBG):SetAlpha(0)
  for idx = 1, 5 do
    (((self._guildQuest)._Condition)[idx]):SetShow(false)
    ;
    (((self._guildQuest)._Condition)[idx]):SetAutoResize(true)
    ;
    (((self._guildQuest)._Condition)[idx]):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    ((self._guildQuest)._Title):SetFontColor(4293712127)
    ;
    ((self._guildQuest)._Title):useGlowFont(true, "BaseFont_10_Glow", 4283243897)
  end
  ;
  ((self._guildQuest)._ControlBG):addInputEvent("Mouse_On", "guildQuestWidget_MouseOn( true )")
  ;
  ((self._guildQuest)._ControlBG):addInputEvent("Mouse_Out", "guildQuestWidget_MouseOn( false )")
  ;
  ((self._guildQuest)._Reward):addInputEvent("Mouse_LUp", "HandleCliekedGuildQuestReward()")
  ;
  ((self._guildQuest)._Giveup):addInputEvent("Mouse_LUp", "HandleClieked_GuildQuestWidget_Giveup()")
  ;
  ((self._guildQuest)._Title):ComputePos()
  ;
  ((self._guildQuest)._AutoNavi):ComputePos()
  ;
  ((self._guildQuest)._Navi):ComputePos()
  ;
  ((self._guildQuest)._Reward):ComputePos()
  ;
  ((self._guildQuest)._Giveup):ComputePos()
  ;
  ((self._guildQuest)._LimitTime):ComputePos()
  ;
  (((self._guildQuest)._Condition)[1]):ComputePos()
  ;
  (((self._guildQuest)._Condition)[2]):ComputePos()
  ;
  (((self._guildQuest)._Condition)[3]):ComputePos()
  ;
  (((self._guildQuest)._Condition)[4]):ComputePos()
  ;
  (((self._guildQuest)._Condition)[5]):ComputePos()
end

PaGlobal_CheckedQuest:initialize()
-- DECOMPILER ERROR at PC182: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_CheckedQuest.clear = function(self)
  -- function num : 0_4
  for ii = 0, self._maxQuestListCnt - 1 do
    local uiElem = (self._uiList)[ii]
    ;
    (uiElem._uiGroupBG):SetShow(false)
    ;
    (uiElem._uiSelectBG):SetShow(false)
    ;
    (uiElem._uiQuestTitle):SetShow(false)
    ;
    (uiElem._uiGroupTitle):SetShow(false)
    ;
    (uiElem._uiQuestIcon):SetShow(false)
    ;
    (uiElem._uiAutoNaviBtn):SetShow(false)
    ;
    (uiElem._uiNaviBtn):SetShow(false)
    ;
    (uiElem._uiGiveupBtn):SetShow(false)
    ;
    (uiElem._uiHideBtn):SetShow(false)
    ;
    (uiElem._uiCompleteNpc):SetShow(false)
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (uiElem._questNo)._groupId = 0
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (uiElem._questNo)._questId = 0
    for jj = 0, self._maxConditionCnt - 1 do
      ((uiElem._uiConditions)[jj]):SetShow(false)
    end
  end
  ;
  (self._uiHelpWidget):SetShow(false)
  _shownListCount = 0
end

local UIRect = {left, top, right, bottom}
-- DECOMPILER ERROR at PC191: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.checkPosition = function(self)
  -- function num : 0_5
  local Rect1 = {}
  local Rect2 = {}
  Rect1.left = Panel_MainQuest:GetPosX()
  Rect1.top = Panel_MainQuest:GetPosY()
  Rect1.right = Rect1.left + Panel_MainQuest:GetSizeX()
  Rect1.bottom = Rect1.top + Panel_MainQuest:GetSizeY()
  Rect2.left = Panel_CheckedQuest:GetPosX()
  Rect2.top = Panel_CheckedQuest:GetPosY()
  Rect2.right = Rect2.left + Panel_CheckedQuest:GetSizeX()
  Rect2.bottom = Rect2.top + Panel_CheckedQuest:GetSizeY()
  if Rect1.left < Rect2.right and Rect1.top < Rect2.bottom and Rect2.left < Rect1.right and Rect2.top < Rect1.bottom then
    Panel_CheckedQuest:SetPosY(Rect1.bottom + 5)
  end
end

-- DECOMPILER ERROR at PC194: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.findShownQuestUiInCheckedQuest = function(self, questGroupNo, questId)
  -- function num : 0_6
  local shownIndex = -1
  shownIndex = PaGlobal_LatestQuest:findShownIndexInLatestQuest(questGroupNo, questId)
  if shownIndex ~= -1 then
    return {PaGlobal_LatestQuest, (PaGlobal_LatestQuest._uiList)[shownIndex]}
  end
  shownIndex = PaGlobal_CheckedQuest:findShownIndexInCheckedQuest(questGroupNo, questId)
  if shownIndex ~= -1 then
    return {PaGlobal_CheckedQuest, (PaGlobal_CheckedQuest._uiList)[shownIndex]}
  end
  return nil
end

-- DECOMPILER ERROR at PC197: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.findShownQuestUiInCheckedQuestIndex = function(self, questGroupNo, questId)
  -- function num : 0_7
  local shownIndex = -1
  shownIndex = PaGlobal_LatestQuest:findShownIndexInLatestQuest(questGroupNo, questId)
  if shownIndex ~= -1 then
    return shownIndex
  end
  shownIndex = PaGlobal_CheckedQuest:findShownIndexInCheckedQuest(questGroupNo, questId)
  if shownIndex ~= -1 then
    return shownIndex
  end
  return nil
end

-- DECOMPILER ERROR at PC200: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.findShownIndexInCheckedQuest = function(self, questGroupNo, questId)
  -- function num : 0_8
  local checkedQuestIndex = self:findQuestUiIndexInCheckedQuest(questGroupNo, questId)
  if checkedQuestIndex == -1 then
    return -1
  end
  local startIndex = FGlobal_QuestWidgetGetStartPosition()
  local endIndex = PaGlobal_CheckedQuest:getLastShownGroupIndex()
  do
    local isShown = startIndex <= checkedQuestIndex and checkedQuestIndex <= endIndex and endIndex ~= -1
    if isShown == true then
      return checkedQuestIndex
    end
    do return -1 end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC203: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.isExistProgressingQuestInCheckedGroup = function(self, checkedQuestGroupInfo)
  -- function num : 0_9
  if checkedQuestGroupInfo:isGroupQuest() == false then
    return true
  end
  local questCount = checkedQuestGroupInfo:getQuestCount()
  for index = 0, questCount - 1 do
    local questInfo = checkedQuestGroupInfo:getQuestAt(index)
    if questInfo._isProgressing == true and questInfo._isCleared == false then
      return true
    end
  end
  return false
end

-- DECOMPILER ERROR at PC206: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.addEffectQuestFindNaviButtonForTutorial = function(self, questUiInfoInPanelCheckedQuest)
  -- function num : 0_10
  if questUiInfoInPanelCheckedQuest[2] ~= nil then
    self._refUiQuestNaviButton = (questUiInfoInPanelCheckedQuest[2])._uiNaviBtn
    self._refUiQuestTitle = (questUiInfoInPanelCheckedQuest[2])._uiQuestTitle
    local groupBG = (questUiInfoInPanelCheckedQuest[2])._uiGroupBG
    if self._refUiQuestNaviButton ~= nil then
      (self._refUiQuestNaviButton):AddEffect("fUI_Alarm01", true, 0, 0)
      ;
      (self._refUiQuestTitle):AddEffect("UI_QustAccept01", true, 0, 0)
    end
    local uiQuestGroup = nil
    if questUiInfoInPanelCheckedQuest[1] == PaGlobal_CheckedQuest then
      uiQuestGroup = PaGlobal_CheckedQuest._uiNormalQuestGroup
    else
      if questUiInfoInPanelCheckedQuest[1] == PaGlobal_LatestQuest then
        uiQuestGroup = PaGlobal_LatestQuest._uiLatestGroup
      end
    end
    if uiQuestGroup == nil or groupBG == nil or self._refUiQuestNaviButton == nil then
      _PA_ASSERT(false, "퀘스�\184 위젯 마스�\185 적용 실패. nil값이 있습니다.")
      return 
    end
    local posX = uiQuestGroup:GetPosX() + groupBG:GetPosX() + (self._refUiQuestNaviButton):GetPosX()
    local posY = uiQuestGroup:GetPosY() + groupBG:GetPosY() + (self._refUiQuestNaviButton):GetPosY()
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):showQuestMasking(posX, posY)
  else
    do
      ;
      (PaGlobal_TutorialUiManager:getUiMasking()):showPanelMasking(Panel_CheckedQuest)
    end
  end
end

-- DECOMPILER ERROR at PC209: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.eraseEffectQuestNaviButtonForTutorial = function(self)
  -- function num : 0_11
  if self._refUiQuestNaviButton ~= nil then
    (self._refUiQuestNaviButton):EraseAllEffect()
    ;
    (self._refUiQuestTitle):EraseAllEffect()
    self._refUiQuestNaviButton = nil
    self._refUiQuestTitle = nil
  end
  ;
  (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
end

-- DECOMPILER ERROR at PC212: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.findQuestUiIndexInCheckedQuest = function(self, questGruopNo, questId)
  -- function num : 0_12
  for ii = 0, self._maxQuestListCnt - 1 do
    local questNo = ((self._uiList)[ii])._questNo
    if questNo._groupId == questGruopNo and questNo._questId == questId then
      return ii
    end
  end
  return -1
end

FGlobal_CheckedQuestGetQuestUiButtonPosition = function(questGroupNo, questId)
  -- function num : 0_13
  local index = PaGlobal_CheckedQuest:findShownQuestUiInCheckedQuestIndex(questGroupNo, questId)
  if index == -1 then
    return -1
  end
  return index
end

HandleClicked_QuestWidget_OptionButton = function()
  -- function num : 0_14
  FGlobal_CheckedQuestOptionOpen()
end

ShowTooltip_QuestWidget_OptionButton = function()
  -- function num : 0_15
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_OPTIONBUTTON_TOOLTIPTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_OPTIONBUTTON_TOOLTIPDESC")
  TooltipSimple_Show(PaGlobal_CheckedQuest._uiOptionButton, name, desc)
end

HideTooltip_QuestWidget_OptionButton = function()
  -- function num : 0_16
  TooltipSimple_Hide()
end

QuestWidget_SelectQuestFavorType = function(selectType)
  -- function num : 0_17
  if ((getSelfPlayer()):get()):getLevel() >= 20 then
    if selectType == 0 then
      _update_QuestWidgetSetCheckAll()
    else
      ToClient_ToggleQuestSelectType(selectType)
    end
    FGlobal_UpdateQuestFavorType()
  else
    ;
    ((PaGlobal_CheckedQuest._uiQuestFavorType)[1]):SetCheck(true)
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_FAVORITETYPE_ALERT"))
  end
end

LvFivty_SetQuestFavorateType = function()
  -- function num : 0_18
  if ((getSelfPlayer()):get()):getLevel() ~= 50 then
    return 
  end
  if ((PaGlobal_CheckedQuest._uiQuestFavorType)[5]):IsCheck() then
    return 
  end
  ToClient_ToggleQuestSelectType(5)
  FGlobal_UpdateQuestFavorType()
end

registerEvent("ToClient_SelfPlayerLevelUp", "LvFivty_SetQuestFavorateType")
QuestWidget_FavorTypeTooltip = function(isShow, buttonNo)
  -- function num : 0_19
  local control, name, desc = nil
  if isShow == true then
    control = (PaGlobal_CheckedQuest._uiQuestFavorType)[buttonNo]
    if buttonNo == 0 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_ALL_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_ALL_DESC")
    else
      if buttonNo == 1 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_COMBAT_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_COMBAT_DESC")
      else
        if buttonNo == 2 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_LIFE_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_LIFE_DESC")
        else
          if buttonNo == 3 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_FISH_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_FISH_DESC")
          else
            if buttonNo == 4 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_TRADE_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_TRADE_DESC")
            else
              if buttonNo == 5 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_ETC_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_ETC_DESC")
              end
            end
          end
        end
      end
    end
    TooltipSimple_Show(control, name, desc)
  else
    FGlobal_QuestWidget_MouseOver(false)
    TooltipSimple_Hide()
  end
end

QuestWidget_ShowSelectQuestFavorType = function(selectType)
  -- function num : 0_20 , upvalues : MAX_QUEST_FAVOR_TYPE
  if selectType == 0 then
    local QuestListInfo = ToClient_GetQuestList()
    for ii = 0, MAX_QUEST_FAVOR_TYPE - 1 do
      QuestListInfo:setQuestSelectType(ii, true)
      ;
      ((PaGlobal_CheckedQuest._uiQuestFavorType)[ii]):SetCheck(true)
    end
  else
    do
      do
        local QuestListInfo = ToClient_GetQuestList()
        for ii = 0, MAX_QUEST_FAVOR_TYPE - 1 do
          if ii == selectType then
            QuestListInfo:setQuestSelectType(ii, true)
            ;
            ((PaGlobal_CheckedQuest._uiQuestFavorType)[ii]):SetCheck(true)
          else
            QuestListInfo:setQuestSelectType(ii, false)
            ;
            ((PaGlobal_CheckedQuest._uiQuestFavorType)[ii]):SetCheck(false)
          end
        end
        QuestListInfo:setQuestSelectType(0, true)
        FGlobal_UpdateQuestFavorType()
      end
    end
  end
end

_update_QuestWidgetSetCheckAll = function()
  -- function num : 0_21 , upvalues : MAX_QUEST_FAVOR_TYPE
  local isCheck = ((PaGlobal_CheckedQuest._uiQuestFavorType)[0]):IsCheck()
  for i = 1, MAX_QUEST_FAVOR_TYPE - 1 do
    if isCheck == not ((PaGlobal_CheckedQuest._uiQuestFavorType)[i]):IsCheck() then
      ToClient_ToggleQuestSelectType(i)
      ;
      ((PaGlobal_CheckedQuest._uiQuestFavorType)[i]):SetCheck(isCheck)
    end
  end
end

-- DECOMPILER ERROR at PC239: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.updateFavorType = function(self)
  -- function num : 0_22
  if isLuaLoadingComplete then
    if isQuest160524_chk() then
      FGlobal_QuestWindow_favorTypeUpdate()
    else
      updateQuestWindowFavorType()
    end
  end
  self:updateQuestWidgetFavorType()
end

FGlobal_UpdateQuestFavorType = function()
  -- function num : 0_23
  if isQuest160524_chk() then
    FGlobal_QuestWindow_favorTypeUpdate()
  else
    updateQuestWindowFavorType()
  end
  PaGlobal_CheckedQuest:updateQuestWidgetFavorType()
  UIMain_QuestUpdate()
end

-- DECOMPILER ERROR at PC245: Confused about usage of register: R9 in 'UnsetPending'

PaGlobal_CheckedQuest.updateQuestWidgetFavorType = function(self)
  -- function num : 0_24 , upvalues : MAX_QUEST_FAVOR_TYPE
  local allButtonCheck = true
  local QuestListInfo = ToClient_GetQuestList()
  for ii = 1, MAX_QUEST_FAVOR_TYPE - 1 do
    local bChecked = QuestListInfo:isQuestSelectType(ii)
    ;
    ((self._uiQuestFavorType)[ii]):SetCheck(bChecked)
    ;
    ((self._uiQuestFavorType)[ii]):SetMonoTone(bChecked)
    if bChecked == false then
      ((self._uiQuestFavorType)[0]):SetMonoTone(true)
      allButtonCheck = false
    end
    if allButtonCheck == true then
      ((self._uiQuestFavorType)[ii]):SetMonoTone(false)
      ;
      ((self._uiQuestFavorType)[0]):SetMonoTone(false)
    else
      if bChecked == true then
        ((self._uiQuestFavorType)[ii]):SetMonoTone(false)
      else
        ;
        ((self._uiQuestFavorType)[ii]):SetMonoTone(true)
      end
    end
  end
  ;
  ((self._uiQuestFavorType)[0]):SetCheck(allButtonCheck)
end

checkedquestIcon = function(favorIndex)
  -- function num : 0_25
  ToClient_ToggleQuestSelectType(favorIndex)
end

QuestWidget_NationalCheck = function()
  -- function num : 0_26
  if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_RUS) then
    _update_QuestWidgetSetCheckAll()
  end
end

local battleTutorial = {
{groupKey = 1017, questKey = 1}
, 
{groupKey = 1025, questKey = 1}
, 
{groupKey = 1029, questKey = 1}
, 
{groupKey = 1021, questKey = 1}
, 
{groupKey = 1033, questKey = 1}
, 
{groupKey = 1037, questKey = 1}
}
local widgetMouseOn = false
HandleClieked_GuildQuestWidget_Giveup = function()
  -- function num : 0_27
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  if not isGuildMaster and not isGuildSubMaster then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_GUILDQUEST_GIVEUP"))
    return 
  end
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_GIVERUP_MESSAGE_0"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_GIVERUP_MESSAGE_1"), functionYes = ToClient_RequestGuildQuestGiveup, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

FindGuild_Button_Simpletooltips = function(isShow)
  -- function num : 0_28
  local name, desc, control = nil
  if isShow == true then
    control = (UI.getChildControl)(Panel_CheckedQuest, "Button_WantGuild")
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_SIMPLE_TOOLTIP_FINDGUILD_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_SIMPLE_TOOLTIP_FINDGUILD_DESC")
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

checkedQuestPanel_Init = function()
  -- function num : 0_29
  local haveServerPosotion = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_CheckedQuest, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0
  if not haveServerPosotion then
    Panel_CheckedQuest:SetSize(305, 350)
    local newEquipGap = 0
    local posY = 0
    if Panel_NewEquip:GetShow() == true then
      newEquipGap = Panel_NewEquip:GetSizeY() + 15
    end
    Panel_CheckedQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 40 + (newEquipGap))
    Panel_CheckedQuest:SetPosX(getScreenSizeX() - Panel_CheckedQuest:GetSizeX() - 20)
    ;
    (PaGlobal_CheckedQuest._uiResizeButton):SetPosY(Panel_CheckedQuest:GetSizeY())
    ;
    (PaGlobal_CheckedQuest._uiGuideButton):SetPosY(Panel_CheckedQuest:GetSizeY())
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton):SetPosY(Panel_CheckedQuest:GetSizeY())
    ;
    (PaGlobal_CheckedQuest._uiFindGuild):SetPosY(Panel_CheckedQuest:GetSizeY())
  end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

checkedQuestPanel_Init()
changePositionBySever(Panel_CheckedQuest, (CppEnums.PAGameUIType).PAGameUIPanel_CheckedQuest, true, true, true)
local CheckedQuest_SizeY = Panel_CheckedQuest:GetSizeY()
local _startPosition = 0
local _setLastQuestOfList = 0
local _questGroupCount = 0
local _nextPosY = 0
local _list_Space = 10
local _isDontDownScroll = false
local _scrollBarStartPosition = 20
local _shownListCount = 0
local _questGroupId = 0
local _questId = 0
local _naviInfoAgain = false
local _guideQuestChechk = false
local _hasGuildQuest = false
local _positionList = {}
local _isAutoRun = false
local _autoNaviGuide = {groupKey = 0, questKey = 0}
QuestListShowAni = function()
  -- function num : 0_30 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_CheckedQuest:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local QuestListOpen_Alpha = Panel_CheckedQuest:addColorAnimation(0, 0.35, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  QuestListOpen_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  QuestListOpen_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  QuestListOpen_Alpha.IsChangeChild = true
end

QuestListHideAni = function()
  -- function num : 0_31 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_CheckedQuest:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local QuestListClose_Alpha = Panel_CheckedQuest:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  QuestListClose_Alpha:SetStartColor(UI_color.C_FFFFFFFF)
  QuestListClose_Alpha:SetEndColor(UI_color.C_00FFFFFF)
  QuestListClose_Alpha.IsChangeChild = true
  QuestListClose_Alpha:SetHideAtEnd(true)
  QuestListClose_Alpha:SetDisableWhileAni(true)
end

QuestWidget_ScrollEvent = function(UpDown)
  -- function num : 0_32 , upvalues : _startPosition, _isDontDownScroll
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
    PaGlobal_CheckedQuest:updateQuestList(_startPosition)
    PaGlobal_CheckedQuest:updateScrollPosition()
  end
  PaGlobal_TutorialManager:handleQuestWidgetScrollEvent(UpDown)
end

local _maxscrollBarPos = 0
QuestWidget_ScrollLPress = function()
  -- function num : 0_33 , upvalues : _startPosition, _isDontDownScroll
  local prevPos = _startPosition
  local totalCount = PaGlobal_CheckedQuest:getTotalListCount()
  local currentPos = (math.floor)((PaGlobal_CheckedQuest._uiScrollBar):GetControlPos() * (totalCount - 1) + 0.5)
  if prevPos ~= currentPos then
    if prevPos < _startPosition and _isDontDownScroll then
      return 
    end
    _startPosition = currentPos
    PaGlobal_CheckedQuest:updateQuestList(_startPosition)
  end
end

-- DECOMPILER ERROR at PC333: Confused about usage of register: R29 in 'UnsetPending'

PaGlobal_CheckedQuest.updateScrollButtonSize = function(self)
  -- function num : 0_34 , upvalues : _startPosition, widgetMouseOn, _hasGuildQuest
  local pageSize = (self._uiTransBG):GetSizeY() - (self._uiNormalQuestGroup):GetPosY()
  if _startPosition == 0 and (self._uiNormalQuestGroup):GetSizeY() < pageSize then
    (self._uiScrollBar):SetShow(false)
  else
    if widgetMouseOn == true then
      (self._uiScrollBar):SetShow(true)
    end
  end
  ;
  (self._uiScrollBar):SetSize((self._uiScrollBar):GetSizeX(), pageSize)
  if _hasGuildQuest == true then
    defaultGap = 90
  else
    defaultGap = 60
  end
  local totalCount = self:getTotalListCount()
  local scrollButtonSizePercent = pageSize / defaultGap / totalCount * 100
  if scrollButtonSizePercent < 10 then
    scrollButtonSizePercent = 10
  else
    if scrollButtonSizePercent > 99 then
      scrollButtonSizePercent = 99
    end
  end
  local button_sizeY = (self._uiScrollBar):GetSizeY() / 100 * scrollButtonSizePercent
  if button_sizeY < 25 then
    button_sizeY = 25
  else
    if pageSize < button_sizeY then
      button_sizeY = pageSize
    end
  end
  ;
  ((self._uiScrollBar):GetControlButton()):SetSize(((self._uiScrollBar):GetControlButton()):GetSizeX(), button_sizeY)
end

-- DECOMPILER ERROR at PC336: Confused about usage of register: R29 in 'UnsetPending'

PaGlobal_CheckedQuest.isAlreadyShown = function(self, questNo)
  -- function num : 0_35
  if not PaGlobal_LatestQuest:isShownQuest(questNo) then
    return PaGlobal_MainQuest:isShownQuest(questNo)
  end
end

-- DECOMPILER ERROR at PC339: Confused about usage of register: R29 in 'UnsetPending'

PaGlobal_CheckedQuest.getTotalListCount = function(self)
  -- function num : 0_36
  local totalCount = 0
  local questListInfo = ToClient_GetQuestList()
  local questGroupCount = questListInfo:getQuestCheckedGroupCount()
  for Index = 0, questGroupCount - 1 do
    local questGroupInfo = questListInfo:getQuestCheckedGroupAt(Index)
    if questGroupInfo == nil then
      return 
    end
    if questGroupInfo:isGroupQuest() == true then
      for questIndex = 0, questGroupInfo:getQuestCount() - 1 do
        local uiQuestInfo = questGroupInfo:getQuestAt(questIndex)
        local isAlreadyShown = self:isAlreadyShown(uiQuestInfo:getQuestNo())
        if isAlreadyShown == false then
          totalCount = totalCount + 1
        end
      end
    else
      do
        local uiQuestInfo = questGroupInfo:getQuestAt(0)
        do
          local isAlreadyShown = self:isAlreadyShown(uiQuestInfo:getQuestNo())
          if isAlreadyShown == false then
            totalCount = totalCount + 1
          end
          -- DECOMPILER ERROR at PC47: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC47: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC47: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return totalCount
end

-- DECOMPILER ERROR at PC343: Confused about usage of register: R29 in 'UnsetPending'

PaGlobal_CheckedQuest.updateScrollPosition = function(self)
  -- function num : 0_37 , upvalues : _startPosition
  local totalListCount = self:getTotalListCount()
  local posY = (self._uiScrollBar):GetSizeY() * (_startPosition / totalListCount)
  local maxPosY = (self._uiScrollBar):GetSizeY() - ((self._uiScrollBar):GetControlButton()):GetSizeY()
  if maxPosY < posY then
    ((self._uiScrollBar):GetControlButton()):SetPosY(maxPosY)
  else
    ;
    ((self._uiScrollBar):GetControlButton()):SetPosY(posY)
  end
end

-- DECOMPILER ERROR at PC348: Confused about usage of register: R29 in 'UnsetPending'

PaGlobal_CheckedQuest.checkShowScrollbar = function(self)
  -- function num : 0_38 , upvalues : _startPosition, widgetMouseOn
  local scrollSizeY = (self._uiTransBG):GetSizeY() - (self._uiNormalQuestGroup):GetPosY()
  if _startPosition == 0 and (self._uiNormalQuestGroup):GetSizeY() < scrollSizeY then
    (self._uiScrollBar):SetShow(false)
  else
    if widgetMouseOn == true then
      (self._uiScrollBar):SetShow(true)
    end
  end
end

-- DECOMPILER ERROR at PC351: Confused about usage of register: R29 in 'UnsetPending'

PaGlobal_CheckedQuest.getScollPageSize = function(self)
  -- function num : 0_39
  local pageSize = (self._uiTransBG):GetSizeY() - (self._uiNormalQuestGroup):GetPosY()
  return pageSize
end

-- DECOMPILER ERROR at PC354: Confused about usage of register: R29 in 'UnsetPending'

PaGlobal_CheckedQuest.getLastShownGroupIndex = function(self)
  -- function num : 0_40
  local index = -1
  for ii = 0, self._maxQuestListCnt - 1 do
    local uiElem = (self._uiList)[ii]
    if (uiElem._uiGroupBG):GetShow() == true then
      index = ii
    end
  end
  return index
end

FromClient_QuestWidget_Update = function()
  -- function num : 0_41 , upvalues : _startPosition
  PaGlobal_CheckedQuest:updateFavorType()
  FGlobal_MainQuest_Update()
  FGlobal_LatestQuest_UpdateList()
  PaGlobal_CheckedQuest:updateQuestList(_startPosition)
  PaGlobal_CheckedQuest:updateScrollButtonSize()
  FGlobal_ChangeWidgetType()
  PaGlobal_SummonBossTutorial_Manager:checkQuestCondition()
  if Panel_LifeTutorial:GetShow() then
    FGlobal_LifeTutorial_Check()
  end
end

GuideButton_MouseOnOut = function(isOut)
  -- function num : 0_42
  if not getEnableSimpleUI() then
    return 
  end
  if isOut then
    (PaGlobal_CheckedQuest._uiGuideButton):SetAlpha(0.7)
    ;
    (PaGlobal_CheckedQuest._uiGuideButton):SetFontAlpha(0.8)
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton):SetAlpha(0.7)
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton):SetFontAlpha(0.8)
  else
    ;
    (PaGlobal_CheckedQuest._uiGuideButton):SetAlpha(1)
    ;
    (PaGlobal_CheckedQuest._uiGuideButton):SetFontAlpha(1)
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton):SetAlpha(1)
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton):SetFontAlpha(1)
  end
end

HandleClicked_QuestShowCheck = function(groupId, questId)
  -- function num : 0_43
  ToClient_ToggleCheckShow(groupId, questId)
  if Panel_CheckedQuestInfo:GetShow() == true then
    if Panel_CheckedQuestInfo:IsUISubApp() then
      Panel_CheckedQuestInfo:CloseUISubApp()
    end
    Panel_CheckedQuestInfo:SetShow(false)
  end
  HandleMouseOver_HelpPop(false, 0, "hide", 0)
end

local questNoSaveForTutorial = {_questGroupIndex, _questGroupIdx}
local welcomeToTheWorld = true
FGlobal_CheckedQuest_SetWelcomeToTheWorld = function(isFirst)
  -- function num : 0_44 , upvalues : welcomeToTheWorld
  welcomeToTheWorld = isFirst
end

-- DECOMPILER ERROR at PC380: Confused about usage of register: R31 in 'UnsetPending'

PaGlobal_CheckedQuest.updateQuestList = function(self, startPosition)
  -- function num : 0_45 , upvalues : _maxscrollBarPos, _nextPosY, _shownListCount, _questGroupCount, _scrollBarStartPosition, CheckedQuest_SizeY, _isDontDownScroll, widgetMouseOn
  if _maxscrollBarPos ~= 0 and _maxscrollBarPos < startPosition then
    startPosition = _maxscrollBarPos
  end
  startPosition = (math.max)((math.min)(startPosition, self._maxQuestListCnt - 1), 0)
  self:clear()
  self:doGuideQuest()
  self:doReleaseCheckForTutorial()
  _nextPosY = PaGlobal_LatestQuest:getLatestGroupPosY() + PaGlobal_LatestQuest:getLatestGroupSizeY()
  ;
  (self._uiNormalQuestGroup):SetPosY(_nextPosY)
  ;
  (self._uiNormalQuestGroup):SetAlpha(0)
  _nextPosY = 0
  _shownListCount = 0
  _nextPosY = self:QuestWidget_ProgressingGuildQuest(_nextPosY)
  local questListInfo = ToClient_GetQuestList()
  _questGroupCount = questListInfo:getQuestCheckedGroupCount()
  if isEmptyNormalQuestGroup() == 0 and ToClient_isProgressingGuildQuest() == true then
    (self._uiTransBG):SetSize(Panel_CheckedQuest:GetSizeX(), 350)
    ;
    (self._uiNormalQuestGroup):SetShow(false)
    return 
  else
    _scrollBarStartPosition = _nextPosY
    for questIndex = startPosition, _questGroupCount - 1 do
      local questGroupInfo = questListInfo:getQuestCheckedGroupAt(questIndex)
      if questGroupInfo == nil then
        return 
      end
      if questGroupInfo:isGroupQuest() == true then
        _nextPosY = self:groupQuestInfo(questGroupInfo, _nextPosY, questIndex)
      else
        local uiQuestInfo = questGroupInfo:getQuestAt(0)
        local isAlreadyShow = self:isAlreadyShown(uiQuestInfo:getQuestNo())
        if isAlreadyShow == false then
          _nextPosY = self:questInfo(questGroupInfo, uiQuestInfo, _nextPosY, true, questIndex, 0, nil, 0)
        end
      end
      do
        do
          if startPosition == 0 then
            if _nextPosY <= CheckedQuest_SizeY then
              (self._uiGuideButton):SetPosY(Panel_CheckedQuest:GetSizeY())
              ;
              (self._uiHistoryButton):SetPosY(Panel_CheckedQuest:GetSizeY())
              ;
              (self._uiFindGuild):SetPosY(Panel_CheckedQuest:GetSizeY())
              ;
              (self._uiResizeButton):SetPosY(Panel_CheckedQuest:GetSizeY())
            else
              ;
              (self._uiGuideButton):SetPosY(CheckedQuest_SizeY)
              ;
              (self._uiHistoryButton):SetPosY(CheckedQuest_SizeY)
              ;
              (self._uiFindGuild):SetPosY(CheckedQuest_SizeY)
              ;
              (self._uiResizeButton):SetPosY(CheckedQuest_SizeY)
            end
          end
          if CheckedQuest_SizeY - (self._uiNormalQuestGroup):GetPosY() < _nextPosY then
            _maxscrollBarPos = 0
            _isDontDownScroll = false
            if widgetMouseOn == true then
              (self._uiScrollBar):SetShow(true)
            end
            break
          else
            _maxscrollBarPos = startPosition
            _isDontDownScroll = true
          end
          -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
    local normalGroupSizeY = _nextPosY
    local totalListCount = self:getTotalListCount()
    ;
    (self._uiScrollBar):SetInterval(totalListCount - 2)
    ;
    (self._uiScrollBar):SetPosX(Panel_CheckedQuest:GetSizeX() - (self._uiScrollBar):GetSizeX() * 2)
    ;
    (self._uiNormalQuestGroup):SetSize(Panel_CheckedQuest:GetSizeX(), normalGroupSizeY + 10)
    ;
    (self._uiTransBG):SetSize(Panel_CheckedQuest:GetSizeX(), Panel_CheckedQuest:GetSizeY())
    local widgetType = FGlobal_GetSelectedWidgetType()
    if _shownListCount == 0 or widgetMouseOn == false and (CppEnums.QuestWidgetType).eQuestWidgetType_Simple == widgetType then
      (self._uiNormalQuestGroup):SetShow(false)
    else
      ;
      (self._uiNormalQuestGroup):SetShow(true)
    end
  end
end

-- DECOMPILER ERROR at PC383: Confused about usage of register: R31 in 'UnsetPending'

PaGlobal_CheckedQuest.getGroupCount = function(self)
  -- function num : 0_46
  local groupCount = 0
  for ii = 0, self._maxQuestListCnt - 1 do
    if (((self._uiList)[ii])._questNo)._groupId ~= 0 and (((self._uiList)[ii])._questNo)._questId ~= 0 then
      groupCount = groupCount + 1
    end
  end
  return groupCount
end

isEmptyNormalQuestGroup = function()
  -- function num : 0_47
  local count = PaGlobal_CheckedQuest:getGroupCount()
  if count == 0 then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC388: Confused about usage of register: R31 in 'UnsetPending'

PaGlobal_CheckedQuest.doGuideQuest = function(self)
  -- function num : 0_48
  local doGuideQuestCount = questList_getDoGuideQuestCount()
  if doGuideQuestCount > 0 then
    (self._uiGuideButton):SetTextHorizonCenter()
    ;
    (self._uiGuideNumber):SetText(doGuideQuestCount)
    ;
    (self._uiGuideButton):SetPosY(Panel_CheckedQuest:GetSizeY())
    ;
    (self._uiGuideNumber):SetPosX((self._uiGuideButton):GetPosX() + (self._uiGuideButton):GetSizeX() - (self._uiGuideNumber):GetSizeX() / 2 - 7)
    ;
    (self._uiGuideNumber):SetPosY((self._uiGuideButton):GetPosY() + (self._uiGuideButton):GetSizeY() - (self._uiGuideNumber):GetSizeY() / 2 - 7)
    if getEnableSimpleUI() then
      (self._uiGuideButton):SetAlpha(0.7)
      ;
      (self._uiGuideButton):SetFontAlpha(0.8)
      ;
      (self._uiGuideButton):addInputEvent("Mouse_On", "GuideButton_MouseOnOut( false )")
      ;
      (self._uiGuideButton):addInputEvent("Mouse_Out", "GuideButton_MouseOnOut( true )")
    end
  else
    ;
    (self._uiGuideButton):SetShow(false)
    ;
    (self._uiGuideNumber):SetShow(false)
  end
  local isWantGuildJoin = ToClient_GetJoinedMode()
  if isWantGuildJoin == 0 then
    (self._uiFindGuild):SetCheck(true)
  else
    if isWantGuildJoin == 1 then
      (self._uiFindGuild):SetCheck(false)
    end
  end
  ;
  (self._uiHistoryButton):SetPosX(Panel_CheckedQuest:GetSizeX() - (self._uiHistoryButton):GetSizeX())
  ;
  (self._uiHistoryButton):SetPosY(Panel_CheckedQuest:GetSizeY())
  ;
  (self._uiFindGuild):SetPosX(0)
  ;
  (self._uiFindGuild):SetPosY(Panel_CheckedQuest:GetSizeY())
  ;
  (self._uiResizeButton):SetPosY((self._uiHistoryButton):GetPosY())
end

-- DECOMPILER ERROR at PC393: Confused about usage of register: R31 in 'UnsetPending'

PaGlobal_CheckedQuest.doReleaseCheckForTutorial = function(self)
  -- function num : 0_49 , upvalues : welcomeToTheWorld, questNoSaveForTutorial
  local questListInfo = ToClient_GetQuestList()
  local temp_questGroupCount = questListInfo:getQuestCheckedGroupCount()
  local temp_progressCount = 0
  if welcomeToTheWorld == true then
    for questGroupIndex = 0, temp_questGroupCount - 1 do
      -- DECOMPILER ERROR at PC17: Confused about usage of register: R8 in 'UnsetPending'

      questNoSaveForTutorial[temp_progressCount] = {_questGroupIndex, _questGroupIdx}
      local temp_questGroupInfo = questListInfo:getQuestCheckedGroupAt(questGroupIndex)
      if temp_questGroupInfo ~= nil then
        if temp_questGroupInfo:isGroupQuest() == true then
          local tempGroupCount = temp_questGroupInfo:getQuestCount()
          for questGroupIdx = 0, tempGroupCount - 1 do
            local tempQuestInfo = temp_questGroupInfo:getQuestAt(questGroupIdx)
            local recommandLevel = tempQuestInfo:getRecommendLevel()
            local selfLevel = ((getSelfPlayer()):get()):getLevel() + 10
            -- DECOMPILER ERROR at PC81: Confused about usage of register: R17 in 'UnsetPending'

            if tempQuestInfo._isProgressing and not tempQuestInfo._isCleared and welcomeToTheWorld and not TutorialQuestCompleteCheck() and (tempQuestInfo:getQuestType() == 3 or tempQuestInfo:getQuestType() == 4 or tempQuestInfo:getQuestType() == 5 or tempQuestInfo:getQuestType() == 6 or selfLevel < recommandLevel) then
              (questNoSaveForTutorial[temp_progressCount])._questGroupIndex = (tempQuestInfo:getQuestNo())._group
              -- DECOMPILER ERROR at PC87: Confused about usage of register: R17 in 'UnsetPending'

              ;
              (questNoSaveForTutorial[temp_progressCount])._questGroupIdx = (tempQuestInfo:getQuestNo())._quest
            end
            temp_progressCount = temp_progressCount + 1
          end
        else
          do
            local tempQuestInfo = temp_questGroupInfo:getQuestAt(0)
            local recommandLevel = tempQuestInfo:getRecommendLevel()
            do
              local selfLevel = ((getSelfPlayer()):get()):getLevel() + 10
              -- DECOMPILER ERROR at PC139: Confused about usage of register: R12 in 'UnsetPending'

              if tempQuestInfo._isProgressing and not tempQuestInfo._isCleared and welcomeToTheWorld and not TutorialQuestCompleteCheck() and (tempQuestInfo:getQuestType() == 3 or tempQuestInfo:getQuestType() == 4 or tempQuestInfo:getQuestType() == 5 or tempQuestInfo:getQuestType() == 6 or selfLevel < recommandLevel) then
                (questNoSaveForTutorial[temp_progressCount])._questGroupIndex = (tempQuestInfo:getQuestNo())._group
                -- DECOMPILER ERROR at PC145: Confused about usage of register: R12 in 'UnsetPending'

                ;
                (questNoSaveForTutorial[temp_progressCount])._questGroupIdx = (tempQuestInfo:getQuestNo())._quest
              end
              temp_progressCount = temp_progressCount + 1
              -- DECOMPILER ERROR at PC147: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC147: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC147: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC147: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC147: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    if welcomeToTheWorld and not TutorialQuestCompleteCheck() and temp_progressCount > 0 then
      welcomeToTheWorld = false
      for index = 0, temp_progressCount - 1 do
        ToClient_ToggleCheckShow((questNoSaveForTutorial[index])._questGroupIndex, (questNoSaveForTutorial[index])._questGroupIdx)
      end
    end
  end
  do
    welcomeToTheWorld = false
  end
end

-- DECOMPILER ERROR at PC399: Confused about usage of register: R31 in 'UnsetPending'

PaGlobal_CheckedQuest.QuestWidget_ProgressingGuildQuest = function(self, _nextPosY)
  -- function num : 0_50 , upvalues : _hasGuildQuest, UI_color, _shownListCount
  if PaGlobal_TutorialManager:isDoingTutorial() then
    ((self._guildQuest)._ControlBG):SetShow(false)
    _hasGuildQuest = false
    return _nextPosY, _hasGuildQuest
  end
  local ControlBG_sizeY = _nextPosY
  local isProgressingGuildQuest = ToClient_isProgressingGuildQuest()
  local questConditionDefaultPosY = 40
  if isProgressingGuildQuest then
    ((self._guildQuest)._AutoNavi):ComputePos()
    ;
    ((self._guildQuest)._Navi):ComputePos()
    ;
    ((self._guildQuest)._Reward):ComputePos()
    ;
    ((self._guildQuest)._Giveup):ComputePos()
    local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
    local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
    if isGuildMaster or isGuildSubMaster then
      ((self._guildQuest)._Giveup):SetShow(true)
    else
      ;
      ((self._guildQuest)._Giveup):SetShow(false)
    end
    for index = 1, 5 do
      (((self._guildQuest)._Condition)[index]):SetShow(false)
      ;
      (((self._guildQuest)._Condition)[index]):SetText("")
    end
    ;
    ((self._guildQuest)._ControlBG):SetShow(true)
    ;
    ((self._guildQuest)._ControlBG):SetPosY(ControlBG_sizeY)
    local guildQuestName = ToClient_getCurrentGuildQuestName()
    ;
    ((self._guildQuest)._Title):SetText(guildQuestName)
    local remainTime = ToClient_getCurrentGuildQuestRemainedTime()
    local strMinute = (math.floor)(remainTime / 60)
    if remainTime <= 0 then
      ((self._guildQuest)._LimitTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_TIMEOUT"))
    else
      ;
      ((self._guildQuest)._LimitTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_REMAINTIME", "time_minute", strMinute))
    end
    local questConditionCount = ToClient_getCurrentGuildQuestConditionCount()
    local completeConditionCount = 0
    for index = 1, 5 do
      if index <= questConditionCount then
        local currentGuildQuestInfo = ToClient_getCurrentGuildQuestConditionAt(index - 1)
        ;
        (((self._guildQuest)._Condition)[index]):SetShow(true)
        ;
        (((self._guildQuest)._Condition)[index]):SetText("- " .. currentGuildQuestInfo._desc .. "(" .. currentGuildQuestInfo._currentCount .. "/" .. currentGuildQuestInfo._destCount .. ")")
        ;
        (((self._guildQuest)._Condition)[index]):SetPosY(questConditionDefaultPosY)
        if currentGuildQuestInfo._destCount <= currentGuildQuestInfo._currentCount then
          (((self._guildQuest)._Condition)[index]):SetFontColor(UI_color.C_FF626262)
          completeConditionCount = completeConditionCount + 1
        else
          ;
          (((self._guildQuest)._Condition)[index]):SetFontColor(UI_color.C_FFC4BEBE)
        end
        questConditionDefaultPosY = questConditionDefaultPosY + (((self._guildQuest)._Condition)[index]):GetTextSizeY() + 5
      end
    end
    if completeConditionCount == questConditionCount then
      for index = 1, 5 do
        if index <= questConditionCount then
          (((self._guildQuest)._Condition)[index]):SetFontColor(UI_color.C_FFF26A6A)
          ;
          (((self._guildQuest)._Condition)[index]):SetText("")
        end
      end
      ;
      ((self._guildQuest)._Title):EraseAllEffect()
      ;
      ((self._guildQuest)._Title):AddEffect("UI_Quest_Complete_GoldAura", true, -10, 0)
      if questConditionCount > 1 then
        for ii = questConditionCount, 2, -1 do
          questConditionDefaultPosY = questConditionDefaultPosY - (((self._guildQuest)._Condition)[ii]):GetTextSizeY() - 5
        end
      end
      do
        ;
        (((self._guildQuest)._Condition)[1]):SetFontColor((Defines.Color).C_FFF26A6A)
        ;
        (((self._guildQuest)._Condition)[1]):SetText(" " .. PAGetString(Defines.StringSheet_GAME, "GUILDQUEST_COMPLETE"))
        if remainTime <= 0 then
          if questConditionCount > 1 then
            for ii = questConditionCount, 2, -1 do
              questConditionDefaultPosY = questConditionDefaultPosY - (((self._guildQuest)._Condition)[ii]):GetTextSizeY() - 5
            end
          end
          do
            do
              ;
              (((self._guildQuest)._Condition)[1]):SetFontColor((Defines.Color).C_FFF26A6A)
              ;
              (((self._guildQuest)._Condition)[1]):SetText(PAGetString(Defines.StringSheet_GAME, "GUILDQUEST_TIMEOVER"))
              ;
              ((self._guildQuest)._ControlBG):SetSize(((self._guildQuest)._ControlBG):GetSizeX(), questConditionDefaultPosY)
              _hasGuildQuest = true
              _shownListCount = _shownListCount + 1
              do return ((self._guildQuest)._ControlBG):GetSizeY() + 10, _hasGuildQuest end
              ;
              ((self._guildQuest)._ControlBG):SetShow(false)
              _hasGuildQuest = false
              do return _nextPosY, _hasGuildQuest end
            end
          end
        end
      end
    end
  end
end

local elapsedTime = 0
QuestWidget_ProgressingGuildQuest_UpdateRemainTime = function(deltaTime)
  -- function num : 0_51 , upvalues : elapsedTime
  elapsedTime = elapsedTime + deltaTime
  if elapsedTime < 5 then
    return 
  end
  if not ToClient_isProgressingGuildQuest() then
    return 
  end
  local remainTime = ToClient_getCurrentGuildQuestRemainedTime()
  local strMinute = (math.floor)(remainTime / 60)
  if remainTime <= 0 then
    ((PaGlobal_CheckedQuest._guildQuest)._LimitTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_TIMEOUT"))
  else
    ;
    ((PaGlobal_CheckedQuest._guildQuest)._LimitTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_REMAINTIME", "time_minute", strMinute))
  end
  elapsedTime = 0
end

Panel_CheckedQuest:RegisterUpdateFunc("QuestWidget_ProgressingGuildQuest_UpdateRemainTime")
-- DECOMPILER ERROR at PC410: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.groupQuestInfo = function(self, questGroupInfo, _nextPosY, questGroupIndex)
  -- function num : 0_52
  local tmp_next_GroupPosY = _nextPosY + 2
  local questGroupTitle = questGroupInfo:getTitle()
  local questGroupCount = questGroupInfo:getTotalQuestCount()
  for questIndex = 0, questGroupInfo:getQuestCount() - 1 do
    local uiQuestInfo = questGroupInfo:getQuestAt(questIndex)
    if not PaGlobal_LatestQuest:isShownQuest(uiQuestInfo:getQuestNo()) then
      local isAlreadyShown = PaGlobal_MainQuest:isShownQuest(uiQuestInfo:getQuestNo())
    end
    if isAlreadyShown == false then
      tmp_next_GroupPosY = self:questInfo(questGroupInfo, uiQuestInfo, tmp_next_GroupPosY, false, questGroupIndex, questIndex, questGroupTitle, questGroupCount)
    end
  end
  return tmp_next_GroupPosY
end

-- DECOMPILER ERROR at PC413: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.questInfo = function(self, questGroupInfo, uiQuestInfo, _nextPosY, isSingle, questGroupIndex, questIndex, groupTitle, questGroupCount)
  -- function num : 0_53
  local tmp_nextPosY = _nextPosY + 2
  local questGroupId = (uiQuestInfo:getQuestNo())._group
  local questId = (uiQuestInfo:getQuestNo())._quest
  if uiQuestInfo._isCleared == false and uiQuestInfo._isProgressing == true then
    tmp_nextPosY = self:ProgressQuest(questGroupInfo, uiQuestInfo, tmp_nextPosY, isSingle, groupTitle, questGroupCount, questGroupIndex)
  end
  return tmp_nextPosY
end

-- DECOMPILER ERROR at PC417: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.ProgressQuest = function(self, questGroupInfo, uiQuestInfo, tmp_nextPosY, isSingle, groupTitle, questGroupCount, questGroupIndex)
  -- function num : 0_54 , upvalues : _shownListCount
  if getSelfPlayer() == nil then
    return tmp_nextPosY
  end
  if self._maxQuestListCnt <= questGroupIndex then
    return tmp_nextPosY
  end
  local questNo = uiQuestInfo:getQuestNo()
  local questGroupId = questNo._group
  local questId = questNo._quest
  local groupIdx = questGroupIndex
  local groupStartPos = tmp_nextPosY
  local uiGroupBG = ((self._uiList)[groupIdx])._uiGroupBG
  local uiSelectBG = ((self._uiList)[groupIdx])._uiSelectBG
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R15 in 'UnsetPending'

  ;
  (((self._uiList)[groupIdx])._questNo)._groupId = questGroupId
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R15 in 'UnsetPending'

  ;
  (((self._uiList)[groupIdx])._questNo)._questId = questId
  self:setQuestGroupPos(groupIdx, uiQuestInfo, questGroupId, questId, questGroupCount, groupTitle, groupStartPos)
  self:setQuestTypeIcon(groupIdx, uiQuestInfo)
  self:setQuestTitle(groupIdx, uiQuestInfo)
  self:setHideButtonInfo(groupIdx, questNo, isSingle)
  self:setGiveupButtonInfo(groupIdx, uiQuestInfo)
  self:setNaviButtonInfo(groupIdx, uiQuestInfo)
  local nextUIPos = self:setQuestGroupTitle(groupIdx, isSingle, groupTitle, questId, questGroupCount)
  nextUIPos = self:setQuestCondition(groupIdx, uiQuestInfo, questNo, nextUIPos)
  uiGroupBG:SetSize(Panel_CheckedQuest:GetSizeX() - 18, nextUIPos + 5)
  uiSelectBG:SetSize(uiGroupBG:GetSizeX(), uiGroupBG:GetSizeY())
  local isOnMouse = self:isHitTestQuestGroup(uiGroupBG)
  self:resizingConvenienceButtons(groupIdx, isOnMouse)
  tmp_nextPosY = groupStartPos + uiGroupBG:GetSizeY()
  _shownListCount = _shownListCount + 1
  return tmp_nextPosY
end

-- DECOMPILER ERROR at PC420: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.setQuestGroupPos = function(self, idx, uiQuestInfo, questGroupId, questId, questGroupCount, groupTitle, posY)
  -- function num : 0_55
  if idx < 0 or PaGlobal_CheckedQuest._maxQuestListCnt <= idx then
    _PA_LOG("�\128병호", "===================error==================")
    _PA_LOG("�\128병호", "setQuestGroupPos : idx == " .. tostring(idx))
    _PA_LOG("�\128병호", "===================error==================")
    return 
  end
  local elem = (self._uiList)[idx]
  ;
  (elem._uiGroupBG):SetShow(true)
  ;
  (elem._uiGroupBG):SetAlpha(0)
  ;
  (elem._uiGroupBG):SetPosX(5)
  ;
  (elem._uiGroupBG):SetPosY(posY)
  ;
  (elem._uiSelectBG):SetPosX(0)
  ;
  (elem._uiSelectBG):SetPosY(0)
  local conditionCheck = nil
  if uiQuestInfo:isSatisfied() == true then
    conditionCheck = QuestConditionCheckType.eQuestConditionCheckType_Complete
  else
    conditionCheck = QuestConditionCheckType.eQuestConditionCheckType_Progress
  end
  local naviBtnShow = 0
  if uiQuestInfo:isSatisfied() == false and uiQuestInfo:getQuestPositionCount() == 0 then
    naviBtnShow = 1
  end
  if groupTitle == nil then
    groupTitle = "nil"
  end
  ;
  (elem._uiGroupBG):addInputEvent("Mouse_LUp", "HandleClicked_ShowQuestInfo( " .. questGroupId .. ", " .. questId .. ", " .. conditionCheck .. ", \"" .. groupTitle .. "\", " .. questGroupCount .. " )")
  ;
  (elem._uiGroupBG):addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. conditionCheck .. ", false )")
  ;
  (elem._uiGroupBG):addInputEvent("Mouse_DownScroll", "QuestWidget_ScrollEvent( true )")
  ;
  (elem._uiGroupBG):addInputEvent("Mouse_UpScroll", "QuestWidget_ScrollEvent( false )")
  ;
  (elem._uiGroupBG):addInputEvent("Mouse_On", "HandleMouseOver_CheckedQuestGroup( true, " .. idx .. "," .. naviBtnShow .. " )")
  ;
  (elem._uiGroupBG):addInputEvent("Mouse_Out", "HandleMouseOver_CheckedQuestGroup( false, " .. idx .. "," .. naviBtnShow .. " )")
  if uiQuestInfo:isSatisfied() == true and uiQuestInfo:isCompleteBlackSpirit() then
    (elem._uiGroupBG):addInputEvent("Mouse_RUp", "HandleClicked_CallBlackSpirit()")
  end
end

-- DECOMPILER ERROR at PC423: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.setQuestTypeIcon = function(self, idx, uiQuestInfo)
  -- function num : 0_56
  if uiQuestInfo == nil or PaGlobal_CheckedQuest._maxQuestListCnt <= idx then
    return 
  end
  local uiQuestIcon = ((self._uiList)[idx])._uiQuestIcon
  uiQuestIcon:EraseAllEffect()
  uiQuestIcon:SetShow(true)
  uiQuestIcon:SetIgnore(true)
  uiQuestIcon:SetPosX(3)
  uiQuestIcon:SetPosY(3)
  FGlobal_ChangeOnTextureForDialogQuestIcon(uiQuestIcon, uiQuestInfo:getQuestType())
end

-- DECOMPILER ERROR at PC427: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.setQuestTitle = function(self, idx, uiQuestInfo)
  -- function num : 0_57 , upvalues : UI_color
  if uiQuestInfo == nil or self._maxQuestListCnt <= idx then
    return 
  end
  local questNo = uiQuestInfo:getQuestNo()
  local questTitle = self:getQuestTitle(questNo._group, questNo._quest)
  local uiQuestTitle = ((self._uiList)[idx])._uiQuestTitle
  local uiQuestIcon = ((self._uiList)[idx])._uiQuestIcon
  uiQuestTitle:SetAutoResize(true)
  uiQuestTitle:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  uiQuestTitle:SetSize(200, uiQuestTitle:GetSizeY())
  uiQuestTitle:SetText(questTitle)
  uiQuestTitle:SetPosX(uiQuestIcon:GetPosX() + uiQuestIcon:GetSizeX() + 5)
  uiQuestTitle:SetPosY(uiQuestIcon:GetPosY())
  uiQuestTitle:SetLineRender(false)
  uiQuestTitle:SetShow(true)
  uiQuestTitle:SetIgnore(true)
  uiQuestTitle:SetFontColor(UI_color.C_FFEFEFEF)
  uiQuestTitle:useGlowFont(true, "BaseFont_8_Glow", 4287655978)
end

-- DECOMPILER ERROR at PC431: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.setQuestGroupTitle = function(self, idx, isSingle, groupTitle, questId, questGroupCount)
  -- function num : 0_58 , upvalues : UI_color
  if self._maxQuestListCnt <= idx then
    return 
  end
  if groupTitle == nil then
    groupTitle = "nil"
  end
  local uiQuestTitle = ((self._uiList)[idx])._uiQuestTitle
  local uiGroupTitle = ((self._uiList)[idx])._uiGroupTitle
  local posY = uiQuestTitle:GetPosY() + uiQuestTitle:GetSizeY() + 5
  do
    if isSingle == false then
      local groupQuestTitleInfo = groupTitle .. " (" .. questId .. "/" .. questGroupCount .. ")"
      uiGroupTitle:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GROUPTITLEINFO", "titleinfo", groupQuestTitleInfo))
      uiGroupTitle:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
      uiGroupTitle:SetSize(230, uiGroupTitle:GetSizeY())
      uiGroupTitle:SetPosX(25)
      uiGroupTitle:SetPosY(uiQuestTitle:GetPosY() + uiQuestTitle:GetSizeY() + 5)
      uiGroupTitle:SetFontColor(UI_color.C_FFEDE699)
      uiGroupTitle:SetAutoResize(true)
      uiGroupTitle:SetIgnore(true)
      uiGroupTitle:SetShow(true)
      posY = posY + uiGroupTitle:GetSizeY()
    end
    return posY
  end
end

-- DECOMPILER ERROR at PC435: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.setQuestCondition = function(self, idx, uiQuestInfo, questNo, posY)
  -- function num : 0_59 , upvalues : UI_color
  if self._maxQuestListCnt <= idx then
    return 
  end
  local questGroupId = questNo._group
  local questId = questNo._quest
  if uiQuestInfo:isSatisfied() == false then
    for index = 0, uiQuestInfo:getDemandCount() - 1 do
      local uiCondition = (((self._uiList)[idx])._uiConditions)[index]
      local conditionInfo = uiQuestInfo:getDemandAt(index)
      uiCondition:SetAutoResize(true)
      uiCondition:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      uiCondition:SetFontColor(UI_color.C_FFC4BEBE)
      if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
        uiCondition:SetPosX(10)
      else
        uiCondition:SetPosX(25)
      end
      uiCondition:SetPosY(posY)
      uiCondition:SetSize((((self._uiList)[idx])._uiGroupBG):GetSizeX() - uiCondition:GetPosX(), uiCondition:GetTextSizeY())
      local conditionText = nil
      if conditionInfo._currentCount == conditionInfo._destCount or conditionInfo._destCount <= conditionInfo._currentCount then
        conditionText = "- " .. conditionInfo._desc .. " (" .. PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST_COMPLETE") .. ")"
        uiCondition:SetText(conditionText)
        uiCondition:SetLineRender(true)
        uiCondition:SetFontColor(UI_color.C_FF626262)
      else
        if conditionInfo._destCount == 1 then
          conditionText = "- " .. conditionInfo._desc
          uiCondition:SetText(conditionText)
          uiCondition:SetLineRender(false)
        else
          conditionText = "- " .. conditionInfo._desc .. " (" .. conditionInfo._currentCount .. "/" .. conditionInfo._destCount .. ")"
          uiCondition:SetText(conditionText)
          uiCondition:SetLineRender(false)
        end
      end
      uiCondition:SetShow(true)
      uiCondition:SetIgnore(true)
      posY = posY + uiCondition:GetTextSizeY() + 2
    end
  else
    do
      local uiCompleteNpc = ((PaGlobal_CheckedQuest._uiList)[idx])._uiCompleteNpc
      do
        local uiQuestIcon = ((PaGlobal_CheckedQuest._uiList)[idx])._uiQuestIcon
        if uiQuestInfo:getQuestType() == 0 then
          uiQuestIcon:AddEffect("UI_Quest_Complete_GoldAura", true, 130, 0)
        else
          if uiQuestInfo:getQuestType() > 0 then
            uiQuestIcon:AddEffect("UI_Quest_Complete_GreenAura", true, 130, 0)
          end
        end
        uiCompleteNpc:SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_QUESTCOMPLETENPC"))
        uiCompleteNpc:SetFontColor((Defines.Color).C_FFF26A6A)
        FGlobal_QuestWidget_AutoReleaseNavi(uiQuestInfo)
        if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
          uiCompleteNpc:SetPosX(10)
        else
          uiCompleteNpc:SetPosX(25)
        end
        uiCompleteNpc:SetPosY(posY)
        uiCompleteNpc:SetShow(true)
        uiCompleteNpc:SetLineRender(true)
        uiCompleteNpc:SetIgnore(true)
        FGlobal_ChangeOnTextureForDialogQuestIcon(uiQuestIcon, 8)
        if isSingle == false then
          uiGroupInfomation:SetFontColor(UI_color.C_FFF26A6A)
        end
        posY = posY + uiCompleteNpc:GetTextSizeY() + 2
        return posY
      end
    end
  end
end

-- DECOMPILER ERROR at PC439: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.setVisibleConvenienceButton = function(self, show)
  -- function num : 0_60 , upvalues : widgetMouseOn
  local selfLevel = ((getSelfPlayer()):get()):getLevel()
  for idx = 0, self._maxQuestListCnt - 1 do
    local uiElem = (self._uiList)[idx]
    if show == true then
      if (uiElem._uiAutoNaviBtn):IsEnable() then
        (uiElem._uiAutoNaviBtn):SetShow(widgetMouseOn)
        ;
        (uiElem._uiNaviBtn):SetShow(widgetMouseOn)
      end
      if self._giveupLimitLv < selfLevel then
        (uiElem._uiGiveupBtn):SetShow(widgetMouseOn)
        ;
        (uiElem._uiHideBtn):SetShow(widgetMouseOn)
      end
    else
      ;
      (uiElem._uiAutoNaviBtn):SetShow(false)
      ;
      (uiElem._uiNaviBtn):SetShow(false)
      ;
      (uiElem._uiGiveupBtn):SetShow(false)
      ;
      (uiElem._uiHideBtn):SetShow(false)
    end
  end
end

-- DECOMPILER ERROR at PC442: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.resizingConvenienceButtons = function(self, idx, isMouseOn)
  -- function num : 0_61
  if idx < 0 or self._maxQuestListCnt <= idx then
    _PA_LOG("�\128병호", "==================error====================")
    _PA_LOG("�\128병호", "resizingConvenienceButtons : idx == " .. tostring(idx))
    _PA_LOG("�\128병호", "==================error====================")
    return 
  end
  local uiElem = (self._uiList)[idx]
  local sizeX = self._defaultButtonSize
  local sizeY = self._defaultButtonSize
  if isMouseOn == true then
    sizeX = self._extendButtonSize
    sizeY = self._extendButtonSize
    ;
    (uiElem._uiAutoNaviBtn):SetPosX(260)
    ;
    (uiElem._uiNaviBtn):SetPosX(235)
    ;
    (uiElem._uiGiveupBtn):SetPosX(210)
    ;
    (uiElem._uiHideBtn):SetPosX(185)
  else
    ;
    (uiElem._uiAutoNaviBtn):SetPosX(265)
    ;
    (uiElem._uiNaviBtn):SetPosX(245)
    ;
    (uiElem._uiGiveupBtn):SetPosX(225)
    ;
    (uiElem._uiHideBtn):SetPosX(205)
  end
  ;
  (uiElem._uiAutoNaviBtn):SetPosY((uiElem._uiQuestIcon):GetPosY())
  ;
  (uiElem._uiNaviBtn):SetPosY((uiElem._uiQuestIcon):GetPosY())
  ;
  (uiElem._uiGiveupBtn):SetPosY((uiElem._uiQuestIcon):GetPosY())
  ;
  (uiElem._uiHideBtn):SetPosY((uiElem._uiQuestIcon):GetPosY())
  ;
  (uiElem._uiAutoNaviBtn):SetSize(sizeX, sizeY)
  ;
  (uiElem._uiNaviBtn):SetSize(sizeX, sizeY)
  ;
  (uiElem._uiGiveupBtn):SetSize(sizeX, sizeY)
  ;
  (uiElem._uiHideBtn):SetSize(sizeX, sizeY)
end

-- DECOMPILER ERROR at PC449: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.setNaviButtonInfo = function(self, idx, uiQuestInfo)
  -- function num : 0_62 , upvalues : _questGroupId, _questId, _naviInfoAgain, widgetMouseOn
  if idx < 0 or self._maxQuestListCnt <= idx then
    _PA_LOG("�\128병호", "====================error=================" .. tostring(idx))
    _PA_LOG("�\128병호", "setNaviButtonInfo : idx == \t\t\t\t" .. tostring(idx))
    _PA_LOG("�\128병호", "========================================" .. tostring(idx))
    return 
  end
  local questGroupId = (uiQuestInfo:getQuestNo())._group
  local questId = (uiQuestInfo:getQuestNo())._quest
  local uiGroupBG = ((self._uiList)[idx])._uiGroupBG
  local uiSelectBG = ((self._uiList)[idx])._uiSelectBG
  local uiAutoNaviBtn = ((self._uiList)[idx])._uiAutoNaviBtn
  local uiNaviBtn = ((self._uiList)[idx])._uiNaviBtn
  local uiAutoNaviBtnPosY = (self._uiNormalQuestGroup):GetPosY() + uiGroupBG:GetPosY() + uiAutoNaviBtn:GetPosY()
  local uiNaviBtnPosY = (self._uiNormalQuestGroup):GetPosY() + uiGroupBG:GetPosY() + uiNaviBtn:GetPosY()
  local conditionCheck = nil
  if uiQuestInfo:isSatisfied() == true then
    conditionCheck = QuestConditionCheckType.eQuestConditionCheckType_Complete
  else
    conditionCheck = QuestConditionCheckType.eQuestConditionCheckType_Progress
  end
  uiAutoNaviBtn:addInputEvent("Mouse_On", "HandleMouseOver_HelpPop( true," .. uiAutoNaviBtnPosY .. ", \"Autonavi\", " .. idx .. "  )")
  uiAutoNaviBtn:addInputEvent("Mouse_Out", "HandleMouseOver_HelpPop( false," .. uiAutoNaviBtnPosY .. ", \"Autonavi\", " .. idx .. "  )")
  uiAutoNaviBtn:addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. conditionCheck .. ", true )")
  uiNaviBtn:addInputEvent("Mouse_On", "HandleMouseOver_HelpPop( true," .. uiNaviBtnPosY .. ", \"navi\", " .. idx .. "  )")
  uiNaviBtn:addInputEvent("Mouse_Out", "HandleMouseOver_HelpPop( false," .. uiNaviBtnPosY .. ", \"navi\", " .. idx .. "  )")
  uiNaviBtn:addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_FindTarget( " .. questGroupId .. ", " .. questId .. ", " .. conditionCheck .. ", false )")
  if _questGroupId == questGroupId and _questId == questId then
    if _naviInfoAgain == true then
      uiSelectBG:SetShow(false)
      uiAutoNaviBtn:SetCheck(false)
      uiNaviBtn:SetCheck(false)
    else
      uiSelectBG:SetShow(true)
      if uiAutoNaviBtn:IsCheck() == true then
        uiAutoNaviBtn:SetCheck(true)
        uiNaviBtn:SetCheck(true)
      else
        uiAutoNaviBtn:SetCheck(false)
        uiNaviBtn:SetCheck(true)
      end
    end
  else
    uiSelectBG:SetShow(false)
    uiAutoNaviBtn:SetCheck(false)
    uiNaviBtn:SetCheck(false)
  end
  local questStaticStatus = questList_getQuestStatic(questGroupId, questId)
  local posCount = questStaticStatus:getQuestPositionCount()
  local enable = true
  if uiQuestInfo:isSatisfied() == false and posCount == 0 then
    enable = false
  end
  if enable == true then
    uiAutoNaviBtn:SetShow(widgetMouseOn)
    uiNaviBtn:SetShow(widgetMouseOn)
  end
  uiAutoNaviBtn:SetEnable(enable)
  uiNaviBtn:SetEnable(enable)
  if uiQuestInfo:isSatisfied() == true and uiQuestInfo:isCompleteBlackSpirit() then
    uiAutoNaviBtn:addInputEvent("Mouse_LUp", "HandleClicked_CallBlackSpirit()")
    uiNaviBtn:addInputEvent("Mouse_LUp", "HandleClicked_CallBlackSpirit()")
  end
end

-- DECOMPILER ERROR at PC453: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.setGiveupButtonInfo = function(self, idx, uiQuestInfo)
  -- function num : 0_63 , upvalues : widgetMouseOn
  if self._maxQuestListCnt <= idx then
    _PA_LOG("�\128병호", "=================error==================" .. tostring(idx))
    _PA_LOG("�\128병호", "setGiveupButtonInfo : idx == " .. tostring(idx))
    _PA_LOG("�\128병호", "======================================" .. tostring(idx))
    return 
  end
  local questGroupId = (uiQuestInfo:getQuestNo())._group
  local questId = (uiQuestInfo:getQuestNo())._quest
  local selfLevel = ((getSelfPlayer()):get()):getLevel()
  local uiGroupBG = ((self._uiList)[idx])._uiGroupBG
  local uiGiveupBtn = ((self._uiList)[idx])._uiGiveupBtn
  local uiGiveupBtnPosY = (self._uiNormalQuestGroup):GetPosY() + uiGroupBG:GetPosY() + uiGiveupBtn:GetPosY()
  uiGiveupBtn:addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_QuestGiveUp( " .. questGroupId .. "," .. questId .. " )")
  uiGiveupBtn:addInputEvent("Mouse_On", "HandleMouseOver_HelpPop( true," .. uiGiveupBtnPosY .. ", \"giveup\", " .. idx .. "  )")
  uiGiveupBtn:addInputEvent("Mouse_Out", "HandleMouseOver_HelpPop( false," .. uiGiveupBtnPosY .. ", \"giveup\", " .. idx .. "  )")
  do
    local isEnable = self._giveupLimitLv < selfLevel
    uiGiveupBtn:SetEnable(isEnable)
    if self._giveupLimitLv < selfLevel then
      uiGiveupBtn:SetShow(widgetMouseOn)
    else
      uiGiveupBtn:SetShow(false)
    end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC457: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.setHideButtonInfo = function(self, idx, questNo, isSingle)
  -- function num : 0_64 , upvalues : widgetMouseOn
  if idx < 0 or self._maxQuestListCnt <= idx then
    _PA_LOG("�\128병호", "====================error=================" .. tostring(idx))
    _PA_LOG("�\128병호", "setHideButtonInfo : idx == \t\t\t\t" .. tostring(idx))
    _PA_LOG("�\128병호", "========================================" .. tostring(idx))
    return 
  end
  local questGroupId = questNo._group
  local questId = questNo._quest
  local selfLevel = ((getSelfPlayer()):get()):getLevel()
  local uiHideBtn = ((self._uiList)[idx])._uiHideBtn
  local uiGroupBG = ((self._uiList)[idx])._uiGroupBG
  if self._giveupLimitLv < selfLevel then
    uiHideBtn:SetShow(widgetMouseOn)
  else
    uiHideBtn:SetShow(false)
  end
  if isSingle == true then
    uiHideBtn:addInputEvent("Mouse_LUp", "HandleClicked_QuestShowCheck(" .. questGroupId .. "," .. questId .. ")")
  else
    uiHideBtn:addInputEvent("Mouse_LUp", "HandleClicked_QuestShowCheck(" .. questGroupId .. "," .. 0 .. ")")
  end
  local uiHideBtnPosY = (self._uiNormalQuestGroup):GetPosY() + uiGroupBG:GetPosY() + uiHideBtn:GetPosY()
  uiHideBtn:addInputEvent("Mouse_On", "HandleMouseOver_HelpPop( true," .. uiHideBtnPosY .. ", \"hide\", " .. idx .. "  )")
  uiHideBtn:addInputEvent("Mouse_Out", "HandleMouseOver_HelpPop( false," .. uiHideBtnPosY .. ", \"hide\", " .. idx .. "  )")
end

-- DECOMPILER ERROR at PC460: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.isHitTestQuestGroup = function(self, groupControl)
  -- function num : 0_65
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  local panel = Panel_CheckedQuest
  local panelPosX = panel:GetPosX() + (self._uiNormalQuestGroup):GetPosX() + groupControl:GetPosX()
  local panelPosY = panel:GetPosY() + (self._uiNormalQuestGroup):GetPosY() + groupControl:GetPosY()
  local bgPosX = panelPosX
  local bgPosY = panelPosY
  local bgSizeX = groupControl:GetSizeX() - 3
  local bgSizeY = groupControl:GetSizeY() - 5
  if bgPosX <= mousePosX and mousePosX <= bgPosX + bgSizeX and bgPosY <= mousePosY and mousePosY <= bgPosY + bgSizeY then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC463: Confused about usage of register: R32 in 'UnsetPending'

PaGlobal_CheckedQuest.getQuestTitle = function(self, groupId, questId)
  -- function num : 0_66
  local questTitle, questLevel = nil, nil
  local uiQuestInfo = ToClient_GetQuestInfo(groupId, questId)
  if uiQuestInfo ~= nil then
    questTitle = uiQuestInfo:getTitle()
    questLevel = uiQuestInfo:getRecommendLevel()
    if questLevel ~= nil and questLevel ~= 0 then
      questTitle = "[" .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. questLevel .. "] " .. questTitle
    end
  end
  return questTitle
end

local blackQuestTexture = {
{70, 70, 115, 115}
, 
{197, 197, 250, 250}
}
_questWidget_ChangeTextureForBlackSpirit = function(isBlack, control)
  -- function num : 0_67 , upvalues : blackQuestTexture
  control:ChangeTextureInfoName("New_ui_common_forlua/default/blackpanel_series.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, (blackQuestTexture[isBlack])[1], (blackQuestTexture[isBlack])[2], (blackQuestTexture[isBlack])[3], (blackQuestTexture[isBlack])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

haveQuestCheck = function(questGroupId, questId)
  -- function num : 0_68 , upvalues : questNoSaveForTutorial
  local questListInfo = ToClient_GetQuestList()
  local temp_questGroupCount = questListInfo:getQuestGroupCount()
  local haveQuest = false
  for temp_progressCount = 0, temp_questGroupCount - 1 do
    if questNoSaveForTutorial[temp_progressCount] ~= nil and (questNoSaveForTutorial[temp_progressCount])._questGroupIndex == questGroupId and (questNoSaveForTutorial[temp_progressCount])._questGroupIdx == questId then
      haveQuest = true
    end
  end
  return haveQuest
end

HandleMouseOver_HelpPop = function(show, posY, target, idx)
  -- function num : 0_69
  Panel_CheckedQuest:SetChildIndex(PaGlobal_CheckedQuest._uiHelpWidget, 9999)
  if show == true then
    if target == "navi" then
      (PaGlobal_CheckedQuest._uiHelpWidget):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_NAVITOOLTIP"))
    else
      if target == "Autonavi" then
        (PaGlobal_CheckedQuest._uiHelpWidget):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_AUTONAVITOOLTIP"))
      else
        if target == "hide" then
          (PaGlobal_CheckedQuest._uiHelpWidget):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_HIDETOOLTIP"))
        else
          if target == "giveup" then
            (PaGlobal_CheckedQuest._uiHelpWidget):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GIVEUPTOOLTIP"))
          end
        end
      end
    end
    _questWidgetBubblePos(posY)
    ;
    (PaGlobal_CheckedQuest._uiHelpWidget):SetShow(true)
    PaGlobal_CheckedQuest:resizingConvenienceButtons(idx, true)
  else
    FGlobal_QuestWidget_MouseOver(false)
    ;
    (PaGlobal_CheckedQuest._uiHelpWidget):SetShow(false)
  end
end

_questWidgetBubblePos = function(posY)
  -- function num : 0_70
  local screenY = getScreenSizeY()
  local panelPosY = Panel_CheckedQuest:GetPosY()
  local _uiHelpWidgetSizeY = (PaGlobal_CheckedQuest._uiHelpWidget):GetSizeY()
  local buttonSizeY = (((PaGlobal_CheckedQuest._uiList)[0])._uiHideBtn):GetSizeY()
  if screenY < panelPosY + posY + _uiHelpWidgetSizeY then
    (PaGlobal_CheckedQuest._uiHelpWidget):SetPosY(posY - _uiHelpWidgetSizeY - 5)
  else
    ;
    (PaGlobal_CheckedQuest._uiHelpWidget):SetPosY(posY + buttonSizeY + 5)
  end
  ;
  (PaGlobal_CheckedQuest._uiHelpWidget):SetPosX(Panel_CheckedQuest:GetSizeX() - (PaGlobal_CheckedQuest._uiHelpWidget):GetSizeX() + 5)
end

local IM = CppEnums.EProcessorInputMode
-- DECOMPILER ERROR at PC493: Confused about usage of register: R34 in 'UnsetPending'

PaGlobal_CheckedQuest.Common_WidgetMouseOut = function(self)
  -- function num : 0_71 , upvalues : IM
  if IM.eProcessorInputMode_GameMode ~= (UI.Get_ProcessorInputMode)() then
    local panelPosX = Panel_CheckedQuest:GetPosX()
    local panelPosY = Panel_CheckedQuest:GetPosY()
    local panelSizeX = Panel_CheckedQuest:GetSizeX()
    local panelSizeY = Panel_CheckedQuest:GetSizeY() + (PaGlobal_CheckedQuest._uiHistoryButton):GetSizeY()
    local mousePosX = getMousePosX()
    local mousePosY = getMousePosY()
    if panelPosX < mousePosX and mousePosX < panelPosX + panelSizeX and panelPosY < mousePosY and mousePosY < panelPosY + panelSizeY then
      return false
    end
  end
  do
    return true
  end
end

FGlobal_QuestWidget_MouseOver = function(show)
  -- function num : 0_72 , upvalues : widgetMouseOn
  if show == true then
    (PaGlobal_CheckedQuest._uiTransBG):SetShow(true)
    if isEmptyNormalQuestGroup() == false then
      (PaGlobal_CheckedQuest._uiNormalQuestGroup):SetShow(true)
    end
    widgetMouseOn = true
    ;
    (PaGlobal_CheckedQuest._uiTooltipBG):SetShow(true)
    PaGlobal_CheckedQuest:checkShowScrollbar()
    PaGlobal_CheckedQuest:tooltipReposition()
    PaGlobal_CheckedQuest:setShowFunctionButtons(true)
    PaGlobal_CheckedQuest:setVisibleConvenienceButton(true)
    FGlobal_LatestQuestWidget_MouseOver(true)
  else
    if PaGlobal_CheckedQuest:Common_WidgetMouseOut() == false then
      return 
    end
    local widgetType = FGlobal_GetSelectedWidgetType()
    if (CppEnums.QuestWidgetType).eQuestWidgetType_Extend ~= widgetType then
      (PaGlobal_CheckedQuest._uiNormalQuestGroup):SetShow(false)
    end
    widgetMouseOn = false
    ;
    (PaGlobal_CheckedQuest._uiTransBG):SetShow(false)
    ;
    (PaGlobal_CheckedQuest._uiTooltipBG):SetShow(false)
    PaGlobal_CheckedQuest:setShowFunctionButtons(false)
    PaGlobal_CheckedQuest:setVisibleConvenienceButton(false)
    FGlobal_LatestQuestWidget_MouseOver(false)
  end
  do
    PaGlobal_TutorialManager:handleQuestWidgetMouseOver(show)
  end
end

FGlobal_ChangeWidgetType = function()
  -- function num : 0_73
  local widgetType = FGlobal_GetSelectedWidgetType()
  if (CppEnums.QuestWidgetType).eQuestWidgetType_Simple == widgetType then
    (PaGlobal_CheckedQuest._uiNormalQuestGroup):SetShow(false)
  else
    ;
    (PaGlobal_CheckedQuest._uiNormalQuestGroup):SetShow(true)
  end
end

-- DECOMPILER ERROR at PC501: Confused about usage of register: R34 in 'UnsetPending'

PaGlobal_CheckedQuest.tooltipReposition = function(self)
  -- function num : 0_74
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
    (self._uiTooltipBG):SetSize(120, 68)
  else
    ;
    (self._uiTooltipBG):SetSize(100, 68)
  end
  do
    local isLeft = getScreenSizeX() / 2 < Panel_CheckedQuest:GetPosX()
    if not isLeft then
      (self._uiTooltipBG):SetPosX(Panel_CheckedQuest:GetSizeX() + 10)
    else
      (self._uiTooltipBG):SetPosX(Panel_CheckedQuest:GetSizeX() - Panel_CheckedQuest:GetSizeX() - (self._uiTooltipBG):GetSizeX() - 10)
    end
    ;
    (self._uiTooltipBG):SetPosY((self._uiTransBG):GetPosY())
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC504: Confused about usage of register: R34 in 'UnsetPending'

PaGlobal_CheckedQuest.setShowFunctionButtons = function(self, isMouseOver)
  -- function num : 0_75
  if isMouseOver == true then
    (PaGlobal_CheckedQuest._uiResizeButton):SetShow(true)
    if questList_getDoGuideQuestCount() > 0 then
      (PaGlobal_CheckedQuest._uiGuideButton):SetShow(true)
      ;
      (PaGlobal_CheckedQuest._uiGuideNumber):SetShow(true)
    end
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton):SetShow(true)
    local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
    if myGuildInfo == nil then
      (PaGlobal_CheckedQuest._uiFindGuild):SetShow(true)
    end
  else
    do
      ;
      (PaGlobal_CheckedQuest._uiResizeButton):SetShow(false)
      ;
      (PaGlobal_CheckedQuest._uiGuideButton):SetShow(false)
      ;
      (PaGlobal_CheckedQuest._uiGuideNumber):SetShow(false)
      ;
      (PaGlobal_CheckedQuest._uiHistoryButton):SetShow(false)
      ;
      (PaGlobal_CheckedQuest._uiFindGuild):SetShow(false)
      ;
      (PaGlobal_CheckedQuest._uiScrollBar):SetShow(false)
    end
  end
end

questWidget_ShowTooptip = function(questGroupId, questId, isMouseShow)
  -- function num : 0_76
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  questInfo_TooltipShow(true, questGroupId, questId, mousePosX, mousePosY, isMouseShow)
end

HandleMouseOver_CheckedQuestGroup = function(show, bgIndex, naviBtnShow)
  -- function num : 0_77
  if bgIndex < 0 or PaGlobal_CheckedQuest._maxQuestListCnt <= bgIndex then
    _PA_LOG("�\128병호", "=================error=================")
    _PA_LOG("�\128병호", "HandleMouseOver_CheckedQuestGroup: bgIndex == " .. tostring(bgIndex))
    _PA_LOG("�\128병호", "=================error=================")
    return 
  end
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  local uiGroupBG = ((PaGlobal_CheckedQuest._uiList)[bgIndex])._uiGroupBG
  local uiNaviBtn = ((PaGlobal_CheckedQuest._uiList)[bgIndex])._uiNaviBtn
  local uiSelectBG = ((PaGlobal_CheckedQuest._uiList)[bgIndex])._uiSelectBG
  if show == true then
    FGlobal_QuestWidget_MouseOver(true)
    if uiNaviBtn:IsCheck() == false then
      uiSelectBG:SetShow(true)
    end
    PaGlobal_CheckedQuest:resizingConvenienceButtons(bgIndex, true)
  else
    if uiNaviBtn:IsCheck() == false then
      uiSelectBG:SetShow(false)
    end
    questInfo_TooltipShow(false)
    FGlobal_QuestWidget_MouseOver(false)
    if PaGlobal_CheckedQuest:isHitTestQuestGroup(uiGroupBG) == true then
      return 
    end
    PaGlobal_CheckedQuest:resizingConvenienceButtons(bgIndex, false)
  end
end

FGlobal_QuestWidgetGetStartPosition = function()
  -- function num : 0_78 , upvalues : _startPosition
  return _startPosition
end

FGlobal_QuestWidget_UpdateList = function()
  -- function num : 0_79 , upvalues : _startPosition
  PaGlobal_CheckedQuest:updateQuestList(_startPosition)
end

FGlobal_QuestWidget_CalcScrollButtonSize = function()
  -- function num : 0_80
  PaGlobal_CheckedQuest:updateScrollButtonSize()
end

FGlobal_QuestWidget_GetSelectedNaviInfo = function()
  -- function num : 0_81 , upvalues : _questGroupId, _questId, _naviInfoAgain
  return _questGroupId, _questId, _naviInfoAgain
end

FGlobal_QuestWidget_IsMouseOn = function()
  -- function num : 0_82 , upvalues : widgetMouseOn
  return widgetMouseOn
end

FGlobal_QuestWidget_GetPositionList = function()
  -- function num : 0_83 , upvalues : _positionList
  return _positionList
end

FGlobal_QuestWidget_AutoReleaseNavi = function(uiQuestInfo)
  -- function num : 0_84 , upvalues : _positionList, _questGroupId, _questId
  local questNo = uiQuestInfo:getQuestNo()
  if questNo._group == _positionList._questGroupId and questNo._quest == _positionList._questId then
    _positionList = {}
    if not uiQuestInfo:isCompleteBlackSpirit() then
      _questGroupId = 0
      _questId = 0
      HandleClicked_QuestWidget_FindTarget(questNo._group, questNo._quest, 0, false)
    end
  end
end

HandleClicked_QuestWidget_Show = function()
  -- function num : 0_85
  if Panel_CheckedQuest:GetShow() then
    Panel_CheckedQuest:SetShow(false, false)
  else
    Panel_CheckedQuest:SetShow(true, true)
  end
end

FGlobal_QuestWidget_Open = function()
  -- function num : 0_86
  Panel_CheckedQuest:SetShow(true, true)
  Panel_MainQuest:SetShow(true, false)
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(Panel_CheckedQuest, true)
  end
end

FGlobal_QuestWidget_Close = function()
  -- function num : 0_87
  Panel_CheckedQuest:SetShow(false, false)
  Panel_MainQuest:SetShow(false, false)
  questInfo_TooltipShow(false)
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  end
end

HandleClicked_ShowQuestInfo = function(questGroupId, questId, questCondition_Chk, groupTitle, questGroupCount)
  -- function num : 0_88
  local fromQuestWidget = true
  if isQuest160524_chk() then
    FGlobal_QuestWindow_SetProgress()
  end
  FGlobal_QuestInfoDetail(questGroupId, questId, questCondition_Chk, groupTitle, questGroupCount, fromQuestWidget)
  audioPostEvent_SystemUi(0, 0)
end

QuestNpcNavi_ClearCheckBox = function()
  -- function num : 0_89
  for naviIndex = 0, PaGlobal_CheckedQuest._maxQuestListCnt - 1 do
    local elem = (PaGlobal_CheckedQuest._uiList)[nabiIndex]
    ;
    (elem._uiAutoNaviBtn):SetCheck(false)
  end
  for naviIndex = 0, PaGlobal_CheckedQuest._maxQuestListCnt - 1 do
    local elem = (PaGlobal_CheckedQuest._uiList)[nabiIndex]
    ;
    (elem._uiNaviBtn):SetCheck(false)
  end
  ToClient_DeleteNaviGuideByGroup(0)
end

HandleClicked_QuestWidget_FindTarget = function(questGroupId, questId, condition, isAuto)
  -- function num : 0_90 , upvalues : _questGroupId, _questId, _naviInfoAgain, _isAutoRun
  PaGlobal_TutorialManager:handleClickedQuestWidgetFindTarget(questGroupId, questId, condition, isAuto)
  if _questGroupId == questGroupId and _questId == questId then
    if _naviInfoAgain == false then
      ToClient_DeleteNaviGuideByGroup(0)
      audioPostEvent_SystemUi(0, 15)
      _naviInfoAgain = true
    else
      _naviInfoAgain = false
      _QuestWidget_FindTarget_DrawMapPath(questGroupId, questId, condition, isAuto)
    end
  else
    _questGroupId = questGroupId
    _questId = questId
    _naviInfoAgain = false
    _QuestWidget_FindTarget_DrawMapPath(questGroupId, questId, condition, isAuto)
  end
  _isAutoRun = isAuto
  FGlobal_MainQuest_Update()
  FGlobal_LatestQuest_UpdateList()
  FGlobal_QuestWidget_UpdateList()
  if isQuest160524_chk() then
    FGlobal_QuestWindow_Update_FindWay(questGroupId, questId, isAuto)
  else
    PaGlobal_CheckedQuest:updateQuestWindowList(FGlobal_QuestWindowGetStartPosition())
  end
end

_QuestWidget_FindTarget_Auto = function(questGroupId, questId, condition, _isAutoRun, bgIdx)
  -- function num : 0_91 , upvalues : _autoNaviGuide, _questGroupId, _questId, _naviInfoAgain
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R5 in 'UnsetPending'

  _autoNaviGuide.groupKey = questGroupId
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R5 in 'UnsetPending'

  _autoNaviGuide.questKey = questId
  _questGroupId = questGroupId
  _questId = questId
  _naviInfoAgain = false
  local uiNaviBtn = ((PaGlobal_CheckedQuest._uiList)[bgIdx])._uiNaviBtn
  local uiSelectBG = ((PaGlobal_CheckedQuest._uiList)[bgIdx])._uiSelectBG
  if uiNaviBtn ~= nil then
    uiNaviBtn:SetCheck(true)
    uiSelectBG:SetShow(true)
    _QuestWidget_FindTarget_DrawMapPath(questGroupId, questId, condition, _isAutoRun)
  end
end

local navigationGuideParam = NavigationGuideParam()
_QuestWidget_FindTarget_DrawMapPath = function(questGroupId, questId, condition, isAuto)
  -- function num : 0_92 , upvalues : navigationGuideParam, _positionList
  ToClient_DeleteNaviGuideByGroup(0)
  ;
  (PaGlobal_CheckedQuest._uiGuideButton):SetCheck(false)
  local questInfo = questList_getQuestStatic(questGroupId, questId)
  if questInfo == nil then
    return 
  end
  local isGuideAutoErase = questInfo:isGuideAutoErase()
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R6 in 'UnsetPending'

  navigationGuideParam._questGroupNo = questGroupId
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R6 in 'UnsetPending'

  navigationGuideParam._questNo = questId
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R6 in 'UnsetPending'

  navigationGuideParam._isAutoErase = isGuideAutoErase
  if condition == 0 then
    local npcData = npcByCharacterKey_getNpcInfo(questInfo:getCompleteNpc(), questInfo:getCompleteDialogIndex())
    if npcData ~= nil then
      do
        do
          if npcData:hasTimeSpawn() and npcData:isTimeSpawn((math.floor)(getIngameTime_minute() / 60)) == false then
            local _errorMsg = PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_NPC_VACATION")
            Proc_ShowMessage_Ack(_errorMsg)
          end
          posX = (npcData:getPosition()).x
          posY = (npcData:getPosition()).y
          posZ = (npcData:getPosition()).z
          worldmapNavigatorStart(float3(posX, posY, posZ), navigationGuideParam, isAuto, false, true)
          audioPostEvent_SystemUi(0, 14)
          if condition == 99 then
            local npcData = npcByCharacterKey_getNpcInfo(questInfo:getAccecptNpc(), questInfo:getAccecptDialogIndex())
            if npcData ~= nil then
              do
                do
                  if npcData:hasTimeSpawn() and npcData:isTimeSpawn((math.floor)(getIngameTime_minute() / 60)) == false then
                    local _errorMsg = PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_NPC_VACATION")
                    Proc_ShowMessage_Ack(_errorMsg)
                  end
                  posX = (npcData:getPosition()).x
                  posY = (npcData:getPosition()).y
                  posZ = (npcData:getPosition()).z
                  worldmapNavigatorStart(float3(posX, posY, posZ), navigationGuideParam, isAuto, false, true)
                  audioPostEvent_SystemUi(0, 14)
                  local questPosCount = questInfo:getQuestPositionCount()
                  if questPosCount ~= 0 then
                    _positionList = {}
                    -- DECOMPILER ERROR at PC150: Confused about usage of register: R7 in 'UnsetPending'

                    _positionList._questGroupId = questGroupId
                    -- DECOMPILER ERROR at PC152: Confused about usage of register: R7 in 'UnsetPending'

                    _positionList._questId = questId
                    local totalLength = 0
                    for questPositionIndex = 0, questPosCount - 1 do
                      local questPosInfo = questInfo:getQuestPositionAt(questPositionIndex)
                      posX = (questPosInfo._position).x
                      posY = (questPosInfo._position).y
                      posZ = (questPosInfo._position).z
                      -- DECOMPILER ERROR at PC172: Confused about usage of register: R13 in 'UnsetPending'

                      _positionList[questPositionIndex] = {}
                      -- DECOMPILER ERROR at PC186: Confused about usage of register: R13 in 'UnsetPending'

                      ;
                      (_positionList[questPositionIndex])._key = worldmapNavigatorStart(float3(posX, posY, posZ), navigationGuideParam, isAuto, false, true)
                      -- DECOMPILER ERROR at PC190: Confused about usage of register: R13 in 'UnsetPending'

                      ;
                      (_positionList[questPositionIndex])._radius = questPosInfo._radius
                      -- DECOMPILER ERROR at PC193: Confused about usage of register: R13 in 'UnsetPending'

                      ;
                      (_positionList[questPositionIndex])._startRate = totalLength
                      totalLength = totalLength + (_positionList[questPositionIndex])._radius
                    end
                    if questPosCount - 1 > 0 then
                      local randomRate = (math.random)(0, 100) / 100
                      local randomIndex = 0
                      for idx = 0, questPosCount - 1 do
                        if (_positionList[idx])._startRate / (totalLength) < randomRate and randomRate < ((_positionList[idx])._startRate + (_positionList[idx])._radius) / (totalLength) then
                          randomIndex = idx
                          break
                        end
                      end
                      do
                        do
                          local selfPlayer = (getSelfPlayer()):get()
                          if selfPlayer:getNavigationMovePathIndex() ~= (_positionList[randomIndex])._key then
                            if ToClient_GetNaviGuideGroupNo((_positionList[randomIndex])._key) ~= 0 then
                              ToClient_DeleteNaviGuideByGroup(0)
                            end
                            selfPlayer:setNavigationMovePath((_positionList[randomIndex])._key)
                            selfPlayer:checkNaviPathUI((_positionList[randomIndex])._key)
                          end
                          if TutorialQuestCompleteCheck() then
                            audioPostEvent_SystemUi(0, 14)
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

local questConditionType = {eQuestProgressingState_yetAccept = 0, eQuestProgressingState_Accept = 1, eQuestProgressingState_Complete = 2, eQuestProgressingState_AlreadyComplete = 3, eQuestProgressingState_Count = 4}
local convertQuestConditionToNaviFindType = {[questConditionType.eQuestProgressingState_yetAccept] = 99, [questConditionType.eQuestProgressingState_Accept] = 1, [questConditionType.eQuestProgressingState_Complete] = 0, [questConditionType.eQuestProgressingState_AlreadyComplete] = 99}
FromClient_SetQuestNavigationByServer = function(questGroupId, questId, condition)
  -- function num : 0_93 , upvalues : convertQuestConditionToNaviFindType
  local questCondition = convertQuestConditionToNaviFindType[condition]
  if questCondition == nil then
    return 
  end
  _QuestWidget_FindTarget_DrawMapPath(questGroupId, questId, questCondition, false)
end

_askAutoRun_FromNaviClick = function()
  -- function num : 0_94
  local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_ASKAUTORUN_MSG")
  local messageboxData = {title = messageboxTitle, content = messageboxMemo, functionYes = _doAutoRun_FromNaviClick, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

_doAutoRun_FromNaviClick = function()
  -- function num : 0_95
end

_QuestWidget_ReturnQuestState = function()
  -- function num : 0_96 , upvalues : _questGroupId, _questId, _naviInfoAgain
  return _questGroupId, _questId, _naviInfoAgain
end

HandleClicked_CallBlackSpirit = function()
  -- function num : 0_97
  if Panel_Window_Exchange:GetShow() == false then
    if not IsSelfPlayerWaitAction() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_SUMMON_BLACKSPIRIT"))
      return 
    end
    ToClient_AddBlackSpiritFlush()
  end
end

HandleClicked_QuestWidget_GuideQuest_MouseOver = function(isOn)
  -- function num : 0_98
  (PaGlobal_CheckedQuest._uiGuideButton_Desc):SetPosX((PaGlobal_CheckedQuest._uiGuideButton):GetPosX() - (PaGlobal_CheckedQuest._uiGuideButton_Desc):GetSizeX() + 35)
  ;
  (PaGlobal_CheckedQuest._uiGuideButton_Desc):SetPosY((PaGlobal_CheckedQuest._uiGuideButton):GetPosY() + 35)
  if isOn then
    (PaGlobal_CheckedQuest._uiGuideButton_Desc):SetShow(true)
    ;
    (PaGlobal_CheckedQuest._uiGuideButton_Desc):SetAlpha(0)
    ;
    (PaGlobal_CheckedQuest._uiGuideButton_Desc):SetFontAlpha(0)
    ;
    (PaGlobal_CheckedQuest._uiGuideButton_Desc):ResetVertexAni()
    ;
    (UIAni.AlphaAnimation)(1, PaGlobal_CheckedQuest._uiGuideButton_Desc, 0, 0.15)
  else
    ;
    (PaGlobal_CheckedQuest._uiGuideButton_Desc):ResetVertexAni()
    local AniInfo = (UIAni.AlphaAnimation)(0, PaGlobal_CheckedQuest._uiGuideButton_Desc, 0, 0.1)
    AniInfo:SetHideAtEnd(true)
  end
  do
    FGlobal_QuestWidget_MouseOver(isOn)
  end
end

HandleClicked_QuestNew_MouseOver = function(isOn)
  -- function num : 0_99
  (PaGlobal_CheckedQuest._uiHistoryButton_Desc):SetPosX((PaGlobal_CheckedQuest._uiHistoryButton):GetPosX() - (PaGlobal_CheckedQuest._uiHistoryButton_Desc):GetSizeX() + 35)
  ;
  (PaGlobal_CheckedQuest._uiHistoryButton_Desc):SetPosY((PaGlobal_CheckedQuest._uiHistoryButton):GetPosY() + 35)
  if isOn then
    (PaGlobal_CheckedQuest._uiHistoryButton_Desc):SetShow(true)
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton_Desc):SetAlpha(0)
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton_Desc):SetFontAlpha(0)
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton_Desc):ResetVertexAni()
    ;
    (UIAni.AlphaAnimation)(1, PaGlobal_CheckedQuest._uiHistoryButton_Desc, 0, 0.15)
  else
    ;
    (PaGlobal_CheckedQuest._uiHistoryButton_Desc):ResetVertexAni()
    local AniInfo1 = (UIAni.AlphaAnimation)(0, PaGlobal_CheckedQuest._uiHistoryButton_Desc, 0, 0.1)
    AniInfo1:SetHideAtEnd(true)
  end
  do
    FGlobal_QuestWidget_MouseOver(isOn)
  end
end

HandleClicked_QuestWidget_GuideQuest = function()
  -- function num : 0_100 , upvalues : _guideQuestChechk
  if GlobalKeyBinder_CheckProgress_chk() then
    return 
  end
  if Panel_Global_Manual:GetShow() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MINIGAMING_DO_NOT_USE"))
    return 
  end
  local doGuideQuestCount = questList_getDoGuideQuestCount()
  if _guideQuestChechk == false then
    ToClient_DeleteNaviGuideByGroup(0)
    for guideIndex = 1, doGuideQuestCount do
      local doGuideQuest = questList_getDoGuideQuestAt(guideIndex - 1)
      if questList_isSelectQuest(doGuideQuest:getSelectType()) then
        local spawnData = (npcByCharacterKey_getNpcInfo(doGuideQuest:getAccecptNpc(), doGuideQuest:getAccecptDialogIndex()))
        local guideQuestPos = nil
        do
          do
            if spawnData ~= nil then
              local npcPosition = spawnData:getPosition()
              guideQuestPos = float3(npcPosition.x, npcPosition.y, npcPosition.z)
            end
            ToClient_WorldMapNaviStart(guideQuestPos, NavigationGuideParam(), false, false)
            -- DECOMPILER ERROR at PC63: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC63: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC63: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    _guideQuestChechk = true
    ;
    (PaGlobal_CheckedQuest._uiGuideButton):SetCheck(true)
    if ToClient_WorldMapIsShow() then
      return 
    end
    FGlobal_PushOpenWorldMap()
  else
    if ToClient_WorldMapIsShow() then
      return 
    end
    ToClient_DeleteNaviGuideByGroup(0)
    _guideQuestChechk = false
    ;
    (PaGlobal_CheckedQuest._uiGuideButton):SetCheck(false)
  end
end

_QuestWidget_QuestToolTipShow = function(questGroupIndex, questIndex)
  -- function num : 0_101
  (QuestInfoData.questCheckDescShowWindow2)(questGroupIndex, questIndex)
end

_QuestWidget_QuestToolTipHide = function()
  -- function num : 0_102
  (QuestInfoData.questDescHideWindow)()
end

guildQuestWidget_MouseOn = function(isShow)
  -- function num : 0_103
  local control = (PaGlobal_CheckedQuest._guildQuest)._ControlBG
  if isShow == true then
    (QuestInfoData.guildQuestDescShowWindow)()
    control:ChangeTextureInfoName("New_UI_Common_forLua/Default/BlackPanel_Series.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 1, 64, 63, 126)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:SetAlpha(1)
  else
    do
      ;
      (QuestInfoData.questDescHideWindow)()
      control:ChangeTextureInfoName("New_UI_Common_forLua/Default/BlackPanel_Series.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(control, 127, 127, 189, 189)
      ;
      (control:getBaseTexture()):setUV(x1, y1, x2, y2)
      control:setRenderTexture(control:getBaseTexture())
      control:SetAlpha(0)
    end
  end
end

local orgMouseY = 0
local orgPanelSizeY = 0
local orgPanelPosY = 0
HandleClicked_QuestWidgetPanelSize = function()
  -- function num : 0_104 , upvalues : orgMouseY, orgPanelPosY, orgPanelSizeY
  local panel = Panel_CheckedQuest
  orgMouseY = getMousePosY()
  orgPanelPosY = panel:GetPosY()
  orgPanelSizeY = panel:GetSizeY()
end

HandleClicked_QuestWidgetPanelResize = function()
  -- function num : 0_105 , upvalues : orgMouseY, orgPanelSizeY, CheckedQuest_SizeY, _startPosition
  local panel = Panel_CheckedQuest
  local currentY = getMousePosY()
  local deltaY = currentY - orgMouseY
  local panelPosY = panel:GetPosY()
  local panelSizeX = panel:GetSizeX()
  local panelSizeY = panel:GetSizeY()
  local mousePosY = getMousePosY()
  if orgPanelSizeY + deltaY > 300 and orgPanelSizeY + deltaY < 700 then
    Panel_CheckedQuest:SetSize(panelSizeX, orgPanelSizeY + deltaY)
    ;
    (PaGlobal_CheckedQuest._uiTransBG):SetSize(panelSizeX, orgPanelSizeY + deltaY)
  end
  if panel:GetSizeY() > 300 then
    CheckedQuest_SizeY = panel:GetSizeY()
  end
  ;
  (PaGlobal_CheckedQuest._uiResizeButton):SetPosY(Panel_CheckedQuest:GetSizeY())
  ;
  (PaGlobal_CheckedQuest._uiGuideButton):SetPosY(Panel_CheckedQuest:GetSizeY())
  ;
  (PaGlobal_CheckedQuest._uiHistoryButton):SetPosY(Panel_CheckedQuest:GetSizeY())
  ;
  (PaGlobal_CheckedQuest._uiFindGuild):SetPosY(Panel_CheckedQuest:GetSizeY())
  local guide_button = PaGlobal_CheckedQuest._uiGuideButton
  local guide_number = PaGlobal_CheckedQuest._uiGuideNumber
  guide_number:SetPosX(guide_button:GetPosX() + guide_button:GetSizeX() - guide_number:GetSizeX() / 2 - 7)
  guide_number:SetPosY(guide_button:GetPosY() + guide_button:GetSizeY() - guide_number:GetSizeY() / 2 - 7)
  PaGlobal_CheckedQuest:updateQuestList(_startPosition)
  PaGlobal_CheckedQuest:updateScrollButtonSize()
  ToClient_SaveUiInfo(false)
end

HandleClicked_QuestWidgetSaveResize = function()
  -- function num : 0_106
  ToClient_SaveUiInfo(false)
end

HandleOn_QuestWidgetPanelResize = function(isShow)
  -- function num : 0_107
  FGlobal_QuestWidget_MouseOver(isShow)
end

local _tmpGroupId, _tmpQuestId = nil, nil
FGlobal_PassGroupIdQuestId = function(groupId, questId)
  -- function num : 0_108 , upvalues : _tmpGroupId, _tmpQuestId
  if groupId == nil and questId == nil then
    return _tmpGroupId, _tmpQuestId
  else
    _tmpGroupId = groupId
    _tmpQuestId = questId
  end
end

HandleClicked_QuestWidget_QuestGiveUp = function(groupId, questId)
  -- function num : 0_109
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

QuestWidget_QuestGiveUp_Confirm = function()
  -- function num : 0_110
  local groupId, questId = FGlobal_PassGroupIdQuestId()
  ToClient_GiveupQuest(groupId, questId)
  if Panel_CheckedQuestInfo:GetShow() == true then
    if Panel_CheckedQuestInfo:IsUISubApp() then
      Panel_CheckedQuestInfo:CloseUISubApp()
    end
    Panel_CheckedQuestInfo:SetShow(false)
  end
end

HandleClicked_QuestReward_Show = function(groupId, questId, window)
  -- function num : 0_111
  local questReward = questList_getQuestStatic(groupId, questId)
  local baseCount = questReward:getQuestBaseRewardCount()
  local selectCount = questReward:getQuestSelectRewardCount()
  local _baseReward = {}
  for baseReward_index = 1, baseCount do
    local baseReward = questReward:getQuestBaseRewardAt(baseReward_index - 1)
    _baseReward[baseReward_index] = {}
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R12 in 'UnsetPending'

    ;
    (_baseReward[baseReward_index])._type = baseReward:getType()
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R12 in 'UnsetPending'

    if (CppEnums.RewardType).RewardType_Exp == baseReward:getType() then
      (_baseReward[baseReward_index])._exp = baseReward:getExperience()
    else
      -- DECOMPILER ERROR at PC44: Confused about usage of register: R12 in 'UnsetPending'

      if (CppEnums.RewardType).RewardType_SkillExp == baseReward:getType() then
        (_baseReward[baseReward_index])._exp = baseReward:getSkillExperience()
      else
        -- DECOMPILER ERROR at PC56: Confused about usage of register: R12 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_ProductExp == baseReward:getType() then
          (_baseReward[baseReward_index])._exp = baseReward:getProductExperience()
        else
          -- DECOMPILER ERROR at PC68: Confused about usage of register: R12 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_Item == baseReward:getType() then
            (_baseReward[baseReward_index])._item = baseReward:getItemEnchantKey()
            -- DECOMPILER ERROR at PC72: Confused about usage of register: R12 in 'UnsetPending'

            ;
            (_baseReward[baseReward_index])._count = baseReward:getItemCount()
          else
            -- DECOMPILER ERROR at PC84: Confused about usage of register: R12 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_Intimacy == baseReward:getType() then
              (_baseReward[baseReward_index])._character = baseReward:getIntimacyCharacter()
              -- DECOMPILER ERROR at PC88: Confused about usage of register: R12 in 'UnsetPending'

              ;
              (_baseReward[baseReward_index])._value = baseReward:getIntimacyValue()
            else
              -- DECOMPILER ERROR at PC100: Confused about usage of register: R12 in 'UnsetPending'

              if (CppEnums.RewardType).RewardType_Knowledge == baseReward:getType() then
                (_baseReward[baseReward_index])._mentalCard = baseReward:getMentalCardKey()
              end
            end
          end
        end
      end
    end
  end
  local _selectReward = {}
  for selectReward_index = 1, selectCount do
    local selectReward = questReward:getQuestSelectRewardAt(selectReward_index - 1)
    _selectReward[selectReward_index] = {}
    -- DECOMPILER ERROR at PC115: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (_selectReward[selectReward_index])._type = selectReward:getType()
    -- DECOMPILER ERROR at PC126: Confused about usage of register: R13 in 'UnsetPending'

    if (CppEnums.RewardType).RewardType_Exp == selectReward:getType() then
      (_selectReward[selectReward_index])._exp = selectReward:getExperience()
    else
      -- DECOMPILER ERROR at PC138: Confused about usage of register: R13 in 'UnsetPending'

      if (CppEnums.RewardType).RewardType_SkillExp == selectReward:getType() then
        (_selectReward[selectReward_index])._exp = selectReward:getSkillExperience()
      else
        -- DECOMPILER ERROR at PC150: Confused about usage of register: R13 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_ProductExp == selectReward:getType() then
          (_selectReward[selectReward_index])._exp = selectReward:getProductExperience()
        else
          -- DECOMPILER ERROR at PC162: Confused about usage of register: R13 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_Item == selectReward:getType() then
            (_selectReward[selectReward_index])._item = selectReward:getItemEnchantKey()
            -- DECOMPILER ERROR at PC166: Confused about usage of register: R13 in 'UnsetPending'

            ;
            (_selectReward[selectReward_index])._count = selectReward:getItemCount()
          else
            -- DECOMPILER ERROR at PC178: Confused about usage of register: R13 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_Intimacy == selectReward:getType() then
              (_selectReward[selectReward_index])._character = selectReward:getIntimacyCharacter()
              -- DECOMPILER ERROR at PC182: Confused about usage of register: R13 in 'UnsetPending'

              ;
              (_selectReward[selectReward_index])._value = selectReward:getIntimacyValue()
            else
              -- DECOMPILER ERROR at PC194: Confused about usage of register: R13 in 'UnsetPending'

              if (CppEnums.RewardType).RewardType_Knowledge == selectReward:getType() then
                (_selectReward[selectReward_index])._mentalCard = selectReward:getMentalCardKey()
              end
            end
          end
        end
      end
    end
  end
  FGlobal_ShowRewardList(false)
  FGlobal_SetRewardList(_baseReward, _selectReward, nil)
  Panel_Npc_Quest_Reward:SetPosX(getMousePosX() - Panel_Npc_Quest_Reward:GetSizeX() - 10)
  Panel_Npc_Quest_Reward:SetPosY(getMousePosY())
  FGlobal_ShowRewardList(true)
  if Panel_Window_Quest_New:IsUISubApp() == true then
    Panel_Npc_Quest_Reward:OpenUISubApp()
  end
end

local darkSpiritFirstTime = true
FromClient_Panel_updateBlackSpirit = function()
  -- function num : 0_112 , upvalues : darkSpiritFirstTime, UI_TM
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if darkSpiritFirstTime == true and isClearedQuest == true then
    (PaGlobal_CheckedQuest._uiDarkSpirit):EraseAllEffect()
    ;
    (PaGlobal_CheckedQuest._uiDarkSpirit):AddEffect("fUI_uiDarkSpirit_Tutorial", true, 0, 0)
    ;
    (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetShow(true)
    ;
    (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetAutoResize(true)
    ;
    (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(220, 86)
    ;
    (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_uiDarkSpirit_HELP"))
    ;
    (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize((PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeX() + 5, (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeY() + 30)
    ;
    (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosX((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosX() + 140)
    ;
    (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosY((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosY() + 50)
    darkSpiritFirstTime = false
  else
    if playerLevel >= 5 then
      (PaGlobal_CheckedQuest._uiDarkSpirit):SetShow(false)
      ;
      (PaGlobal_CheckedQuest._uiDarkSpirit):EraseAllEffect()
      ;
      (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetShow(false)
    end
  end
end

registerEvent("EventCharacterInfoUpdate", "FromClient_Panel_updateBlackSpirit")
QuestAutoNpcNavi_Over = function(isNpcNaviShow)
  -- function num : 0_113 , upvalues : UI_TM, darkSpiritFirstTime
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if playerLevel >= 4 then
    if isNpcNaviShow == true then
      _questListMessage = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_AUTONPCNAVI_HELP")
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetAutoResize(true)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetText(_questListMessage)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetPosX(getMousePosX() - Panel_CheckedQuest:GetPosX() - 150)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetPosY(getMousePosY() - Panel_CheckedQuest:GetPosY() - 60)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):ComputePos()
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetSize((PaGlobal_CheckedQuest._uiNotice_NpcNavi):GetSizeX(), (PaGlobal_CheckedQuest._uiNotice_NpcNavi):GetSizeY())
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetAlpha(0)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetFontAlpha(0)
      ;
      (UIAni.AlphaAnimation)(1, PaGlobal_CheckedQuest._uiNotice_NpcNavi, 0, 0.2)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetShow(true)
    else
      local aniInfo = (UIAni.AlphaAnimation)(0, PaGlobal_CheckedQuest._uiNotice_NpcNavi, 0, 0.2)
      aniInfo:SetHideAtEnd(true)
    end
  else
    do
      if playerLevel >= 1 and isClearedQuest == true then
        if isNpcNaviShow == true then
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetAutoResize(true)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(220, 86)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_uiDarkSpirit_NPCNAVI"))
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize((PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeX() + 5, (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeY() + 30)
        else
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetAutoResize(true)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(220, 86)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_uiDarkSpirit_HELP"))
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize((PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeX() + 5, (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeY() + 30)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosX((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosX() + 140)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosY((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosY() + 50)
          darkSpiritFirstTime = false
        end
      end
    end
  end
end

QuestNpcNavi_Over = function(isNpcNaviShow)
  -- function num : 0_114 , upvalues : UI_TM, darkSpiritFirstTime
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if playerLevel >= 4 then
    if Panel_Help:GetShow() then
      if isNpcNaviShow == true then
        Button_NpcNaviOn()
      else
        Button_NpcNaviOut()
      end
    end
    if isNpcNaviShow == true then
      _questListMessage = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_NPCNAVI_HELP")
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetAutoResize(true)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetText(_questListMessage)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetPosX(getMousePosX() - Panel_CheckedQuest:GetPosX() - 150)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetPosY(getMousePosY() - Panel_CheckedQuest:GetPosY() - 60)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):ComputePos()
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetSize((PaGlobal_CheckedQuest._uiNotice_NpcNavi):GetSizeX(), (PaGlobal_CheckedQuest._uiNotice_NpcNavi):GetSizeY())
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetAlpha(0)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetFontAlpha(0)
      ;
      (UIAni.AlphaAnimation)(1, _uiNotice_NpcNavi, 0, 0.2)
      ;
      (PaGlobal_CheckedQuest._uiNotice_NpcNavi):SetShow(true)
    else
      local aniInfo = (UIAni.AlphaAnimation)(0, _uiNotice_NpcNavi, 0, 0.2)
      aniInfo:SetHideAtEnd(true)
    end
  else
    do
      if playerLevel >= 1 and isClearedQuest == true then
        if isNpcNaviShow == true then
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetAutoResize(true)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(220, 86)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_uiDarkSpirit_NPCNAVI"))
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize((PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeX() + 5, (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeY() + 30)
        else
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetAutoResize(true)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(220, 86)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_uiDarkSpirit_HELP"))
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize((PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeX() + 5, (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeY() + 30)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosX((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosX() + 140)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosY((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosY() + 50)
          darkSpiritFirstTime = false
        end
      end
    end
  end
end

questGiveUp_Over = function(isGiveShow)
  -- function num : 0_115 , upvalues : UI_TM, darkSpiritFirstTime
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if playerLevel >= 4 then
    if isGiveShow == true then
      _questListMessage = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_GIVEUP_HELP")
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetAutoResize(true)
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetText(_questListMessage)
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetSpanSize(10, 0)
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetPosX(getMousePosX() - Panel_CheckedQuest:GetPosX() - _uiNotice_GiveUp:GetSizeX())
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetPosY(getMousePosY() - Panel_CheckedQuest:GetPosY() - 60)
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):ComputePos()
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetSize(_uiNotice_GiveUp:GetSizeX(), _uiNotice_GiveUp:GetSizeY())
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetAlpha(0)
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetFontAlpha(0)
      ;
      (UIAni.AlphaAnimation)(1, _uiNotice_GiveUp, 0, 0.2)
      ;
      (PaGlobal_CheckedQuest._uiNotice_GiveUp):SetShow(true)
    else
      local aniInfo = (UIAni.AlphaAnimation)(0, _uiNotice_GiveUp, 0, 0.2)
      aniInfo:SetHideAtEnd(true)
    end
  else
    do
      if playerLevel >= 1 and isClearedQuest == true then
        if isGiveShow == true then
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetAutoResize(true)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(220, 86)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_uiDarkSpirit_GIVEUP"))
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize((PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeX() + 5, (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeY() + 30)
        else
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetAutoResize(true)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(220, 86)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_uiDarkSpirit_HELP"))
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize((PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeX() + 5, (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeY() + 30)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosX((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosX() + 140)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosY((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosY() + 50)
          darkSpiritFirstTime = false
        end
      end
    end
  end
end

QuestReward_Over = function(isRewardShow)
  -- function num : 0_116 , upvalues : UI_TM, darkSpiritFirstTime
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if playerLevel >= 4 then
    if isRewardShow == true then
      _questListMessage = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_REWARD_HELP")
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):SetAutoResize(true)
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):SetText(_questListMessage)
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):SetPosX(getMousePosX() - Panel_CheckedQuest:GetPosX() - (PaGlobal_CheckedQuest._uiNotice_Reward):GetSizeX())
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):SetPosY(getMousePosY() - Panel_CheckedQuest:GetPosY() - 60)
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):ComputePos()
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):SetSize((PaGlobal_CheckedQuest._uiNotice_Reward):GetSizeX(), (PaGlobal_CheckedQuest._uiNotice_Reward):GetSizeY())
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):SetAlpha(0)
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):SetFontAlpha(0)
      ;
      (UIAni.AlphaAnimation)(1, _uiNotice_Reward, 0, 0.2)
      ;
      (PaGlobal_CheckedQuest._uiNotice_Reward):SetShow(true)
    else
      local aniInfo = (UIAni.AlphaAnimation)(0, _uiNotice_Reward, 0, 0.2)
      aniInfo:SetHideAtEnd(true)
    end
  else
    do
      if playerLevel >= 1 and isClearedQuest == true then
        if isRewardShow == true then
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetAutoResize(true)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(220, 86)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_uiDarkSpirit_REWARD"))
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(_uiDarkSpirit_Notice:GetSizeX() + 5, _uiDarkSpirit_Notice:GetSizeY() + 30)
        else
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetAutoResize(true)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize(220, 86)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_uiDarkSpirit_HELP"))
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetSize((PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeX() + 5, (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):GetSizeY() + 30)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosX((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosX() + 140)
          ;
          (PaGlobal_CheckedQuest._uiDarkSpirit_Notice):SetPosY((PaGlobal_CheckedQuest._uiDarkSpirit):GetPosY() + 50)
          darkSpiritFirstTime = false
        end
      end
    end
  end
end

FromClient_SetQuestType = function(questType)
  -- function num : 0_117
  local QuestListInfo = ToClient_GetQuestList()
  QuestListInfo:setQuestSelectType(questType, true)
end

HandleClieked_CheckedQuest_WantJoinGuild = function()
  -- function num : 0_118
  if (PaGlobal_CheckedQuest._uiFindGuild):IsCheck() then
    ToClient_SetJoinedMode(0)
  else
    ToClient_SetJoinedMode(1)
  end
end

HandleOn_CheckedQuest_WantJoinGuild = function(isShow)
  -- function num : 0_119
  FGlobal_QuestWidget_MouseOver(isShow)
end

EventRadingOnQuest = function(questStaticWrapper, index)
  -- function num : 0_120
  if questStaticWrapper == nil then
    return 
  end
  local uiQuestInfo = questStaticWrapper
  local npcData = npcByCharacterKey_getNpcInfo(uiQuestInfo:getCompleteNpc(), uiQuestInfo:getCompleteDialogIndex())
  if npcData ~= nil then
    HandleClicked_QuestWidget_FindTarget((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest, 0, false)
  end
end

EventUnradingOnQuest = function(questStaticWrapper, index)
  -- function num : 0_121
  audioPostEvent_SystemUi(0, 15)
  ToClient_DeleteNaviGuideByGroup(0)
end

registerEvent("EventRadingOnQuest", "EventRadingOnQuest")
registerEvent("EventUnradingOnQuest", "EventUnradingOnQuest")
local checkQuest_posX = 0
local checkQuest_posY = 0
FromClient_UpdateQuestSetPos = function()
  -- function num : 0_122 , upvalues : _startPosition
  PaGlobal_CheckedQuest:updateQuestList(_startPosition)
  local newEquipGap = 0
  if Panel_NewEquip:GetShow() == true then
    newEquipGap = Panel_NewEquip:GetSizeY()
    local _x1 = Panel_NewEquip:GetPosX()
    local _x2 = Panel_NewEquip:GetPosX() + Panel_NewEquip:GetSizeX()
    local _y1 = Panel_NewEquip:GetPosY()
    local _y2 = Panel_NewEquip:GetPosY() + Panel_NewEquip:GetSizeY()
    local x1 = Panel_CheckedQuest:GetPosX()
    local x2 = Panel_CheckedQuest:GetPosX() + Panel_CheckedQuest:GetSizeX()
    local y1 = Panel_CheckedQuest:GetPosY()
    local y2 = Panel_CheckedQuest:GetPosY() + Panel_CheckedQuest:GetSizeY()
    for xx = x1, x2, 10 do
      for yy = y1, y2, 10 do
        if _x1 <= xx and xx <= _x2 and _y1 <= yy and yy <= _y2 then
          Panel_CheckedQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 65 + newEquipGap)
        end
      end
    end
  end
  do
    do
      local haveServerPosotion = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_CheckedQuest, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0
      if not haveServerPosotion then
        Panel_CheckedQuest:SetPosX(getScreenSizeX() - Panel_CheckedQuest:GetSizeX() - 20)
        Panel_CheckedQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 65 + newEquipGap)
      end
      if getScreenSizeX() < Panel_CheckedQuest:GetPosX() + Panel_CheckedQuest:GetSizeX() or getScreenSizeY() < Panel_CheckedQuest:GetPosY() + Panel_CheckedQuest:GetSizeY() then
        Panel_CheckedQuest:SetPosX(getScreenSizeX() - Panel_CheckedQuest:GetSizeX() - 20)
        Panel_CheckedQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 65 + newEquipGap)
      end
      -- DECOMPILER ERROR: 4 unprocessed JMP targets
    end
  end
end

QuestListChecked_EnableSimpleUI = function()
  -- function num : 0_123 , upvalues : _startPosition
  PaGlobal_CheckedQuest:updateQuestList(_startPosition)
end

registerEvent("EventSimpleUIEnable", "QuestListChecked_EnableSimpleUI")
registerEvent("EventSimpleUIDisable", "QuestListChecked_EnableSimpleUI")
local rateValue = nil
FGlobal_QuestWindowRateSetting = function()
  -- function num : 0_124 , upvalues : rateValue
  rateValue = {}
  local sizeWithOutPanelX = getScreenSizeX() - Panel_CheckedQuest:GetSizeX()
  local sizeWithOutPanelY = getScreenSizeY() - Panel_CheckedQuest:GetSizeY()
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  rateValue.x = (math.max)((math.min)(Panel_CheckedQuest:GetPosX() / sizeWithOutPanelX, 1), 0)
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

  rateValue.y = (math.max)((math.min)(Panel_CheckedQuest:GetPosY() / sizeWithOutPanelY, 1), 0)
end

FromClient_questWidget_ResetPosition = function()
  -- function num : 0_125
  local newEquipGap = 0
  if Panel_NewEquip:GetShow() == true then
    newEquipGap = Panel_NewEquip:GetSizeY()
    local _x1 = Panel_NewEquip:GetPosX()
    local _x2 = Panel_NewEquip:GetPosX() + Panel_NewEquip:GetSizeX()
    local _y1 = Panel_NewEquip:GetPosY()
    local _y2 = Panel_NewEquip:GetPosY() + Panel_NewEquip:GetSizeY()
    local x1 = Panel_CheckedQuest:GetPosX()
    local x2 = Panel_CheckedQuest:GetPosX() + Panel_CheckedQuest:GetSizeX()
    local y1 = Panel_CheckedQuest:GetPosY()
    local y2 = Panel_CheckedQuest:GetPosY() + Panel_CheckedQuest:GetSizeY()
    for xx = x1, x2, 20 do
      for yy = y1, y2, 20 do
        if _x1 <= xx and xx <= _x2 and _y1 <= yy and yy <= _y2 then
          Panel_CheckedQuest:SetPosX(getScreenSizeX() - Panel_CheckedQuest:GetSizeX() - 20)
          Panel_CheckedQuest:SetPosY(Panel_Radar:GetPosY() + Panel_Radar:GetSizeY() + 130 + newEquipGap)
          break
        end
      end
    end
  end
  do
    do
      if CppDefine.ChangeUIAndResolution == true then
        if Panel_CheckedQuest:GetRelativePosX() == -1 and Panel_CheckedQuest:GetRelativePosY() == -1 then
          local initPosX = getScreenSizeX() - Panel_CheckedQuest:GetSizeX() - 20
          local initPosY = FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 130 + newEquipGap
          local haveServerPosotion = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_CheckedQuest, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0
          if not haveServerPosotion then
            Panel_CheckedQuest:SetPosX(initPosX)
            Panel_CheckedQuest:SetPosY(initPosY)
          end
          changePositionBySever(Panel_CheckedQuest, (CppEnums.PAGameUIType).PAGameUIPanel_CheckedQuest, false, true, false)
          FGlobal_InitPanelRelativePos(Panel_CheckedQuest, initPosX, initPosY)
        elseif Panel_CheckedQuest:GetRelativePosX() == 0 and Panel_CheckedQuest:GetRelativePosY() == 0 then
          Panel_CheckedQuest:SetPosX(getScreenSizeX() - Panel_CheckedQuest:GetSizeX() - 20)
          Panel_CheckedQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + Panel_MainQuest:GetSizeY() + 20 + newEquipGap)
        else
          Panel_CheckedQuest:SetPosX(getScreenSizeX() * Panel_CheckedQuest:GetRelativePosX() - Panel_CheckedQuest:GetSizeX() / 2)
          Panel_CheckedQuest:SetPosY(getScreenSizeY() * Panel_CheckedQuest:GetRelativePosY() - Panel_CheckedQuest:GetSizeY() / 2)
        end
      else
        local haveServerPosotion = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_CheckedQuest, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0
        if not haveServerPosotion then
          Panel_CheckedQuest:SetPosX(getScreenSizeX() - Panel_CheckedQuest:GetSizeX() - 20)
          Panel_CheckedQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 130 + newEquipGap)
        end
        changePositionBySever(Panel_CheckedQuest, (CppEnums.PAGameUIType).PAGameUIPanel_CheckedQuest, false, true, false)
      end
      FGlobal_PanelRepostionbyScreenOut(Panel_CheckedQuest)
      -- DECOMPILER ERROR: 8 unprocessed JMP targets
    end
  end
end

renderModeChange_FromClient_questWidget_ResetPosition = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_126
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  FromClient_questWidget_ResetPosition()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_FromClient_questWidget_ResetPosition")
TutorialQuestCompleteCheck = function()
  -- function num : 0_127
  do return questList_isClearQuest(104, 1) or ((getSelfPlayer()):get()):getLevel() >= 15 end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

registerEvent("updateProgressQuestList", "FromClient_UpdateQuestSetPos")
registerEvent("FromClient_UpdateProgressGuildQuestList", "FromClient_UpdateQuestSetPos")
registerEvent("FromClient_UpdateQuestList", "FromClient_QuestWidget_Update")
registerEvent("onScreenResize", "FromClient_questWidget_ResetPosition")
registerEvent("FromClient_SetQuestNavigationByServer", "FromClient_SetQuestNavigationByServer")
registerEvent("FromClient_SetQuestType", "FromClient_SetQuestType")
registerEvent("FromClient_UpdateQuestSortType", "QuestWidget_DefaultTextureFunction")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_CheckedQuest")
registerEvent("FromClient_ChangeQuestWidgetType", "FromClient_ChangeQuestWidgetType")
FromClient_ChangeQuestWidgetType = function()
  -- function num : 0_128
  FromClient_QuestWidget_Update()
end

FromClient_luaLoadComplete_CheckedQuest = function()
  -- function num : 0_129 , upvalues : MAX_QUEST_FAVOR_TYPE
  QuestWidget_NationalCheck()
  do
    if CheckTutorialEnd() == false then
      local QuestListInfo = ToClient_GetQuestList()
      for ii = 0, MAX_QUEST_FAVOR_TYPE - 1 do
        QuestListInfo:setQuestSelectType(ii, false)
      end
      QuestListInfo:setQuestSelectType(1, true)
    end
    FromClient_QuestWidget_Update()
    Panel_CheckedQuest:SetChildIndex(PaGlobal_CheckedQuest._uiResizeButton, 9999)
    Panel_CheckedQuest:SetChildIndex(PaGlobal_CheckedQuest._uiGuideButton, 9999)
    Panel_CheckedQuest:SetChildIndex(PaGlobal_CheckedQuest._uiGuideNumber, 9999)
    Panel_CheckedQuest:SetChildIndex(PaGlobal_CheckedQuest._uiHistoryButton, 9999)
    Panel_CheckedQuest:SetChildIndex(PaGlobal_CheckedQuest._uiFindGuild, 9999)
    FGlobal_PanelMove(Panel_CheckedQuest, true)
  end
end

FromClient_StartQuestNavigationGuide = function(questNoRaw)
  -- function num : 0_130 , upvalues : _questGroupId, _questId
  local questInfoWrapper = questList_getQuestInfo(questNoRaw)
  if questInfoWrapper ~= nil then
    _questGroupId = 0
    _questId = 0
    HandleClicked_QuestWidget_FindTarget((questInfoWrapper:getQuestNo())._group, (questInfoWrapper:getQuestNo())._quest, 1, false)
  end
end

registerEvent("FromClient_StartQuestNavigationGuide", "FromClient_StartQuestNavigationGuide")

