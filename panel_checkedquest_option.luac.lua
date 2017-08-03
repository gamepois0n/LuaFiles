-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\questlist\panel_checkedquest_option.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UIMode = Defines.UIMode
local IM = CppEnums.EProcessorInputMode
local UI_PD = CppEnums.Padding
Panel_Window_Quest_New_Option:SetShow(false)
Panel_Window_Quest_New_Option:SetIgnore(true)
Panel_Window_Quest_New_Option:ActiveMouseEventEffect(true)
Panel_Window_Quest_New_Option:setGlassBackground(true)
local _sortType = {Distance = 0, TimeRecent = 1, Favor = 2, Count = 3}
local _sortState = {none = 0, desc = 1, asc = 2, Count = 3}
local _favorType = {All = 0, Battle = 1, Life = 2, Fishing = 3, Trade = 4, Etc = 5, Count = 6}
local _latestQuestCount = {zero = 0, one = 1, two = 2, three = 3, Count = 4}
local CheckedQuestOptionPanel = {
_enableSortButton = {[_sortType.Distance] = ToClient_GetCheckedQuestSortType(0), [_sortType.TimeRecent] = ToClient_GetCheckedQuestSortType(1), [_sortType.Favor] = ToClient_GetCheckedQuestSortType(2)}
, 
_sortButton_Favor = {[_sortState.asc] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_SortType1"), [_sortState.desc] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_SortType2"), [_sortState.none] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_SortType3")}
, 
_sortButton_Distance = {[_sortState.desc] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_SortDistanceNear1"), [_sortState.asc] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_SortDistanceNear2"), [_sortState.none] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_SortDistanceNear3")}
, 
_sortButton_TimeRecent = {[_sortState.asc] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_SortTimeRecent1"), [_sortState.desc] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_SortTimeRecent2"), [_sortState.none] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_SortTimeRecent3")}
, 
_favorCheckBoxButton = {[_favorType.All] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Checkbox_AllType"), [_favorType.Battle] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Checkbox_BattleType"), [_favorType.Life] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Checkbox_LifeType"), [_favorType.Fishing] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Checkbox_FishingType"), [_favorType.Trade] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Checkbox_TradeType"), [_favorType.Etc] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Checkbox_EtcType")}
, 
_latestQuestCountButton = {[_latestQuestCount.zero] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_0"), [_latestQuestCount.one] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_1"), [_latestQuestCount.two] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_2"), [_latestQuestCount.three] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_3")}
, 
_questWidgetButton = {[(CppEnums.QuestWidgetType).eQuestWidgetType_Simple] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_View"), [(CppEnums.QuestWidgetType).eQuestWidgetType_Extend] = (UI.getChildControl)(Panel_Window_Quest_New_Option, "RadioButton_NotView")}
, _favorDesc = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_SortTypeDescBg"), _confirmButton = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Button_Confirm"), _cancleButton = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Button_Cancle"), _closeIcon = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Button_CloseIcon"), sortTitle = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_SortTitle"), sortTypeTitle = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_SortTypeTitle"), sortTypeBg = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Static_SortTypeBg"), distanceTitle = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_SortDistanceNear"), distanceBg = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Static_SortDistanceNearBg"), recentTItle = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_RecentUpdateTitle"), viewableCount = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_ViewableCount"), recentUpdateBG = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_RecentUpdateBg"), normalQuestViewCheck = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_NormalQuestViewCheck"), viewCheckBG = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_ViewCheckBg"), acceptTimeTitle = (UI.getChildControl)(Panel_Window_Quest_New_Option, "StaticText_SortTimeRecent"), acceptTimeBg = (UI.getChildControl)(Panel_Window_Quest_New_Option, "Static_SortTimeRecentBg")}
CheckedQuestOptionPanel.SetFavorButtonCheckAll = function(self)
  -- function num : 0_0 , upvalues : _favorType
  local isCheck = ((self._favorCheckBoxButton)[_favorType.All]):IsCheck()
  for ii = 1, _favorType.Count - 1 do
    ((self._favorCheckBoxButton)[ii]):SetCheck(isCheck)
  end
end

CheckedQuestOptionPanel.UpdateFavorButton = function(self)
  -- function num : 0_1 , upvalues : _favorType
  local isAllCheck = true
  local isCheck = false
  for ii = 1, _favorType.Count - 1 do
    isCheck = ((self._favorCheckBoxButton)[ii]):IsCheck()
    if not isCheck then
      isAllCheck = false
    end
  end
  ;
  ((self._favorCheckBoxButton)[_favorType.All]):SetCheck(isAllCheck)
end

local panelSizeY = Panel_Window_Quest_New_Option:GetSizeY()
CheckedQuestOptionPanel.Initialize = function(self)
  -- function num : 0_2 , upvalues : _sortState, _sortType, _favorType, CheckedQuestOptionPanel, _latestQuestCount, UI_TM, UI_PD, panelSizeY
  for ii = 0, _sortState.Count - 1 do
    ((self._sortButton_Distance)[ii]):SetCheck(false)
    ;
    ((self._sortButton_Favor)[ii]):SetCheck(false)
    ;
    ((self._sortButton_TimeRecent)[ii]):SetCheck(false)
  end
  ;
  ((self._sortButton_Distance)[(self._enableSortButton)[_sortType.Distance]]):SetCheck(true)
  ;
  ((self._sortButton_TimeRecent)[(self._enableSortButton)[_sortType.TimeRecent]]):SetCheck(true)
  ;
  ((self._sortButton_Favor)[(self._enableSortButton)[_sortType.Favor]]):SetCheck(true)
  ToClient_SetCheckedQuestSort((self._enableSortButton)[_sortType.Favor], (self._enableSortButton)[_sortType.Distance], (self._enableSortButton)[_sortType.TimeRecent])
  local QuestListInfo = ToClient_GetQuestList()
  for ii = 0, _favorType.Count - 1 do
    ((self._favorCheckBoxButton)[ii]):SetCheck(QuestListInfo:isQuestSelectType(ii))
  end
  CheckedQuestOptionPanel:UpdateFavorButton()
  for ii = 0, _latestQuestCount.Count - 1 do
    ((self._latestQuestCountButton)[ii]):SetCheck(false)
  end
  local showCount = ToClient_GetLatestQuestShowCount()
  ;
  ((self._latestQuestCountButton)[showCount]):SetCheck(true)
  for ii = 0, (CppEnums.QuestWidgetType).eQuestWidgetType_Count - 1 do
    ((self._questWidgetButton)[ii]):SetCheck(false)
  end
  local questWidgetType = ToClient_GetQuestWidgetType()
  ;
  ((self._questWidgetButton)[questWidgetType]):SetCheck(true)
  ;
  (self._favorDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._favorDesc):setPadding(UI_PD.ePadding_Left, 5)
  ;
  (self._favorDesc):setPadding(UI_PD.ePadding_Right, 5)
  ;
  (self._favorDesc):setPadding(UI_PD.ePadding_Top, 5)
  ;
  (self._favorDesc):setPadding(UI_PD.ePadding_Bottom, 5)
  local favorDescText = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTOPTIONE_DESC")
  ;
  (self._favorDesc):SetText(favorDescText)
  local textSizeY = (self._favorDesc):GetTextSizeY()
  ;
  (self._favorDesc):SetSize((self._favorDesc):GetSizeX(), textSizeY + 10)
  ;
  (self.sortTitle):SetPosY((self._favorDesc):GetPosY() + textSizeY + 15)
  ;
  (self.sortTypeTitle):SetPosY((self.sortTitle):GetPosY() + 30)
  ;
  (self.sortTypeBg):SetPosY((self.sortTypeTitle):GetPosY() + 25)
  ;
  ((self._sortButton_Favor)[_sortState.asc]):SetPosY((self.sortTypeBg):GetPosY() + 3)
  ;
  ((self._sortButton_Favor)[_sortState.desc]):SetPosY((self.sortTypeBg):GetPosY() + 3)
  ;
  ((self._sortButton_Favor)[_sortState.none]):SetPosY((self.sortTypeBg):GetPosY() + 3)
  ;
  (self.distanceTitle):SetPosY((self.sortTypeBg):GetPosY() + 40)
  ;
  (self.distanceBg):SetPosY((self.distanceTitle):GetPosY() + 25)
  ;
  ((self._sortButton_Distance)[_sortState.asc]):SetPosY((self.distanceBg):GetPosY() + 3)
  ;
  ((self._sortButton_Distance)[_sortState.desc]):SetPosY((self.distanceBg):GetPosY() + 3)
  ;
  ((self._sortButton_Distance)[_sortState.none]):SetPosY((self.distanceBg):GetPosY() + 3)
  ;
  (self.acceptTimeTitle):SetPosY((self.distanceBg):GetPosY() + 40)
  ;
  (self.acceptTimeBg):SetPosY((self.acceptTimeTitle):GetPosY() + 25)
  ;
  (self.recentTItle):SetPosY((self.acceptTimeBg):GetPosY() + 40)
  ;
  (self.viewableCount):SetPosY((self.recentTItle):GetPosY() + 30)
  ;
  (self.recentUpdateBG):SetPosY((self.viewableCount):GetPosY() + 25)
  ;
  ((self._latestQuestCountButton)[_latestQuestCount.zero]):SetPosY((self.recentUpdateBG):GetPosY() + 3)
  ;
  ((self._latestQuestCountButton)[_latestQuestCount.one]):SetPosY((self.recentUpdateBG):GetPosY() + 3)
  ;
  ((self._latestQuestCountButton)[_latestQuestCount.two]):SetPosY((self.recentUpdateBG):GetPosY() + 3)
  ;
  ((self._latestQuestCountButton)[_latestQuestCount.three]):SetPosY((self.recentUpdateBG):GetPosY() + 3)
  ;
  (self.normalQuestViewCheck):SetPosY((self.recentUpdateBG):GetPosY() + 40)
  ;
  (self.viewCheckBG):SetPosY((self.normalQuestViewCheck):GetPosY())
  ;
  ((self._sortButton_TimeRecent)[_sortState.asc]):SetPosY((self.acceptTimeBg):GetPosY() + 3)
  ;
  ((self._sortButton_TimeRecent)[_sortState.desc]):SetPosY((self.acceptTimeBg):GetPosY() + 3)
  ;
  ((self._sortButton_TimeRecent)[_sortState.none]):SetPosY((self.acceptTimeBg):GetPosY() + 3)
  ;
  ((self._questWidgetButton)[(CppEnums.QuestWidgetType).eQuestWidgetType_Simple]):SetPosY((self.viewCheckBG):GetPosY() + 3)
  ;
  ((self._questWidgetButton)[(CppEnums.QuestWidgetType).eQuestWidgetType_Extend]):SetPosY((self.viewCheckBG):GetPosY() + 3)
  Panel_Window_Quest_New_Option:SetSize(Panel_Window_Quest_New_Option:GetSizeX(), panelSizeY + (textSizeY - 85))
  ;
  (self._confirmButton):ComputePos()
  ;
  (self._cancleButton):ComputePos()
end

CheckedQuestOptionPanel.Confirm = function(self)
  -- function num : 0_3 , upvalues : _sortState, _sortType, _favorType
  for ii = 0, _sortState.Count - 1 do
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

    if ((self._sortButton_Distance)[ii]):IsCheck() then
      (self._enableSortButton)[_sortType.Distance] = ii
    end
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R5 in 'UnsetPending'

    if ((self._sortButton_TimeRecent)[ii]):IsCheck() then
      (self._enableSortButton)[_sortType.TimeRecent] = ii
    end
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R5 in 'UnsetPending'

    if ((self._sortButton_Favor)[ii]):IsCheck() then
      (self._enableSortButton)[_sortType.Favor] = ii
    end
  end
  ToClient_SetCheckedQuestSort((self._enableSortButton)[_sortType.Favor], (self._enableSortButton)[_sortType.Distance], (self._enableSortButton)[_sortType.TimeRecent])
  local QuestListInfo = ToClient_GetQuestList()
  for ii = 0, _favorType.Count - 1 do
    QuestListInfo:setQuestSelectType(ii, ((self._favorCheckBoxButton)[ii]):IsCheck())
  end
  local showCount = self:getLatestQuestShowCount()
  ToClient_SetLatestQuestShowCount(showCount)
  local questWidgetType = self:getQuestWidgetType()
  ToClient_SetQuestWidgetType(questWidgetType)
  FGlobal_CheckedQuestOptionClose()
end

CheckedQuestOptionPanel.getLatestQuestShowCount = function(self)
  -- function num : 0_4 , upvalues : _latestQuestCount
  local showCount = 0
  for ii = 0, _latestQuestCount.Count - 1 do
    if ((self._latestQuestCountButton)[ii]):IsCheck() then
      showCount = ii
      break
    end
  end
  do
    return showCount
  end
end

FGlobal_CheckedQuestOptionPanel_GetLatestQuestShowCount = function()
  -- function num : 0_5 , upvalues : CheckedQuestOptionPanel
  return CheckedQuestOptionPanel:getLatestQuestShowCount()
end

CheckedQuestOptionPanel.getQuestWidgetType = function(self)
  -- function num : 0_6
  local questWidgetType = (CppEnums.QuestWidgetType).eQuestWidgetType_Simple
  for ii = 0, (CppEnums.QuestWidgetType).eQuestWidgetType_Count - 1 do
    if ((self._questWidgetButton)[ii]):IsCheck() then
      questWidgetType = ii
      break
    end
  end
  do
    return questWidgetType
  end
end

FGlobal_GetSelectedWidgetType = function()
  -- function num : 0_7 , upvalues : CheckedQuestOptionPanel
  local questWidgetType = CheckedQuestOptionPanel:getQuestWidgetType()
  return questWidgetType
end

HandleClicked_SelectQuestFavorType = function(selectType)
  -- function num : 0_8 , upvalues : CheckedQuestOptionPanel
  if ((getSelfPlayer()):get()):getLevel() >= 20 then
    if selectType == 0 then
      CheckedQuestOptionPanel:SetFavorButtonCheckAll()
    else
      CheckedQuestOptionPanel:UpdateFavorButton()
    end
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_FAVORITETYPE_ALERT"))
    ;
    ((CheckedQuestOptionPanel._favorCheckBoxButton)[selectType]):SetCheck(not ((CheckedQuestOptionPanel._favorCheckBoxButton)[selectType]):IsCheck())
  end
end

HandleClicked_QueestOptionConfirm = function()
  -- function num : 0_9 , upvalues : CheckedQuestOptionPanel
  CheckedQuestOptionPanel:Confirm()
  FGlobal_QuestWindow_favorTypeUpdate()
  FGlobal_ChangeLatestQuestShowCount()
end

FGlobal_CheckedQuestOptionClose = function()
  -- function num : 0_10
  Panel_Window_Quest_New_Option:SetShow(false, false)
  Panel_Window_Quest_New_Option:SetIgnore(true)
end

ShowTooltip_SelectQuestFavorType = function(favorType)
  -- function num : 0_11 , upvalues : CheckedQuestOptionPanel
  if favorType == nil then
    TooltipSimple_Hide()
    return 
  end
  local control, name, desc = nil, nil, nil
  control = (CheckedQuestOptionPanel._favorCheckBoxButton)[favorType]
  if favorType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_ALL_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_ALL_DESC")
  else
    if favorType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_COMBAT_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_COMBAT_DESC")
    else
      if favorType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_LIFE_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_LIFE_DESC")
      else
        if favorType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_FISH_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_FISH_DESC")
        else
          if favorType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_TRADE_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_TRADE_DESC")
          else
            if favorType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_ETC_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_TOOLTIP_QUESTTYPE_ETC_DESC")
            end
          end
        end
      end
    end
  end
  TooltipSimple_Show(control, name, desc)
end

CheckedQuestOptionPanel.RegistEventHandler = function(self)
  -- function num : 0_12 , upvalues : _favorType
  for ii = 0, _favorType.Count - 1 do
    ((self._favorCheckBoxButton)[ii]):addInputEvent("Mouse_LUp", "HandleClicked_SelectQuestFavorType(" .. ii .. ")")
    ;
    ((self._favorCheckBoxButton)[ii]):addInputEvent("Mouse_On", "ShowTooltip_SelectQuestFavorType(" .. ii .. ")")
    ;
    ((self._favorCheckBoxButton)[ii]):addInputEvent("Mouse_Out", "ShowTooltip_SelectQuestFavorType()")
  end
  ;
  (self._confirmButton):addInputEvent("Mouse_LUp", "HandleClicked_QueestOptionConfirm()")
  ;
  (self._closeIcon):addInputEvent("Mouse_LUp", "FGlobal_CheckedQuestOptionClose()")
  ;
  (self._cancleButton):addInputEvent("Mouse_LUp", "FGlobal_CheckedQuestOptionClose()")
end

FGlobal_CheckedQuestOptionOpen = function()
  -- function num : 0_13 , upvalues : CheckedQuestOptionPanel
  if not Panel_Window_Quest_New_Option:GetShow() then
    Panel_Window_Quest_New_Option:SetShow(true, true)
    Panel_Window_Quest_New_Option:SetSpanSize(0, 0)
    Panel_Window_Quest_New_Option:SetIgnore(false)
  end
  CheckedQuestOptionPanel:Initialize()
end

CheckedQuestOptionPanel:Initialize()
CheckedQuestOptionPanel:RegistEventHandler()

