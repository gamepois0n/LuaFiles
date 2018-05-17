-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\quest\console\panel_window_questinfo_renew.luac 

-- params : ...
-- function num : 0
local Window_QuestInfo = {
_ui = {_expToolTip; 
_questTitle = {}
, 
_questDetail = {}
, 
_baseRewardSlot = {}
, 
_baseRewardControl = {}
, 
_selectRewardSlot = {}
, 
_selectRewardControl = {}
, _static_RadioGroup = (UI.getChildControl)(Panel_Window_QuestInfo, "Static_RadioGroup"), _list2_Quest = (UI.getChildControl)(Panel_Window_QuestInfo, "List2_Quest"), _frame_Detail = (UI.getChildControl)(Panel_Window_QuestInfo, "Frame_Detail"), _static_BaseReward = (UI.getChildControl)(Panel_Window_QuestInfo, "Static_BaseReward"), _static_SelectReward = (UI.getChildControl)(Panel_Window_QuestInfo, "Static_SelectReward"), _staticText_RadioButtonTooltip = (UI.getChildControl)(Panel_Window_QuestInfo, "StaticText_RadioButtonTooltip"), _static_KeyGuideBg = (UI.getChildControl)(Panel_Window_QuestInfo, "Static_KeyGuideBg"), _static_Title = (UI.getChildControl)(Panel_Window_QuestInfo, "Static_Title")}
, 
_config = {
_title = {_progress = 0, _main = 1, _recommend = 2, _repeat = 3}
, _selectRewardMax = 6, _baseRewardMax = 6, 
_questRewardSlotConfig = {_createIcon = true, _createBorder = true, _createCount = true, _createClassEquipBG = true, _createCash = true}
, _regionCount = (CppEnums.QuestRegionType).eQuestRegionType_Count}
, 
_questInfo = {}
, 
_qusetUI = {}
, _currentTitleType = 0, _currentQuestIndex = 0, 
_progressTable = {}
, 
_recommendTable = {}
, 
_mainTable = {}
, 
_repetitionTable = {}
}
local questRegion = {[(CppEnums.QuestRegionType).eQuestRegionType_None] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_99"), [(CppEnums.QuestRegionType).eQuestRegionType_Balenos] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_1"), [(CppEnums.QuestRegionType).eQuestRegionType_Serendia] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_2"), [(CppEnums.QuestRegionType).eQuestRegionType_NorthCalpheon] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_3"), [(CppEnums.QuestRegionType).eQuestRegionType_CalpheonBigCity] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_4"), [(CppEnums.QuestRegionType).eQuestRegionType_Keplan] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_5"), [(CppEnums.QuestRegionType).eQuestRegionType_SouthWestCalpheon] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_6"), [(CppEnums.QuestRegionType).eQuestRegionType_Media] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_7"), [(CppEnums.QuestRegionType).eQuestRegionType_Valencia] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_8"), [(CppEnums.QuestRegionType).eQuestRegionType_Kamasylvia] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_9"), [(CppEnums.QuestRegionType).eQuestRegionType_Drigan] = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTLIST_HISTORY_TXT_REGION_10")}
PaGlobalFunc_Quest_SelectTitleButton = function(value)
  -- function num : 0_0 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  self._currentTitleType = self._currentTitleType + value
  if self._currentTitleType < ((self._config)._title)._progress then
    self._currentTitleType = ((self._config)._title)._repeat
  end
  if ((self._config)._title)._repeat < self._currentTitleType then
    self._currentTitleType = ((self._config)._title)._progress
  end
  PaGlobalFunc_Quest_SelectQuestTitle(self._currentTitleType)
end

PaGlobalFunc_Quest_SelectQuestTitle = function(questType)
  -- function num : 0_1 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  self._currentQuestIndex = -1
  self._currentTitleType = questType
  if ((self._config)._title)._progress == self._currentTitleType then
    titleType = ((self._config)._title)._progress
    ;
    ((self._ui)._staticText_RadioButtonTooltip):SetText("진행�\145")
    ;
    ((self._ui)._staticText_RadioButtonTooltip):SetPosX((((self._ui)._questTitle)._progress):GetPosX() - (((self._ui)._questTitle)._progress):GetSizeX() / 2)
    self:ShowListByGroup(self._progressTable)
  else
    if ((self._config)._title)._main == self._currentTitleType then
      titleType = ((self._config)._title)._main
      ;
      ((self._ui)._staticText_RadioButtonTooltip):SetText("메인")
      ;
      ((self._ui)._staticText_RadioButtonTooltip):SetPosX((((self._ui)._questTitle)._main):GetPosX() - (((self._ui)._questTitle)._main):GetSizeX() / 2)
      self:ShowListByGroup(self._mainTable)
    else
      if ((self._config)._title)._recommend == self._currentTitleType then
        titleType = ((self._config)._title)._recommend
        ;
        ((self._ui)._staticText_RadioButtonTooltip):SetText("추천")
        ;
        ((self._ui)._staticText_RadioButtonTooltip):SetPosX((((self._ui)._questTitle)._recommend):GetPosX() - (((self._ui)._questTitle)._recommend):GetSizeX() / 2)
        self:ShowListByGroup(self._recommendTable)
      else
        if ((self._config)._title)._repeat == self._currentTitleType then
          titleType = ((self._config)._title)._repeat
          ;
          ((self._ui)._staticText_RadioButtonTooltip):SetText("반복")
          ;
          ((self._ui)._staticText_RadioButtonTooltip):SetPosX((((self._ui)._questTitle)._repeat):GetPosX() - (((self._ui)._questTitle)._repeat):GetSizeX() / 2)
          self:ShowListByGroup(self._repetitionTable)
        else
          _PA_LOG("이호�\156", "제목�\180 잘못 됬습니다.")
        end
      end
    end
  end
end

Window_QuestInfo.GetQuestGroupByTitle = function(self, titleType)
  -- function num : 0_2
  local questGroupList = {}
  local selfPlayerQuestInfo = ToClient_GetQuestList()
  if selfPlayerQuestInfo == nil then
    return 
  end
  local questGroupCount = self:GetQuestGroupCount(titleType, selfPlayerQuestInfo)
  if questGroupCount == -1 then
    return 
  end
  for groupIndex = 0, questGroupCount - 1 do
    local questGroup = self:GetQuestGroupByIndex(titleType, groupIndex, selfPlayerQuestInfo)
    if questGroup == nil then
      return 
    end
    questGroupList[groupIndex] = questGroup
  end
  if ((self._config)._title)._progress == titleType then
    return self:SetProgressGroupData(questGroupCount, questGroupList)
  else
    return self:SetGroupData(questGroupCount, questGroupList)
  end
end

Window_QuestInfo.ShowListByGroup = function(self, groupTable)
  -- function num : 0_3
  self:DetailClear()
  self:SlotClear()
  self._questInfo = {}
  ;
  (((self._ui)._list2_Quest):getElementManager()):clearKey()
  local list2Index = 0
  for index = 0, #groupTable do
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R7 in 'UnsetPending'

    (self._questInfo)[list2Index] = self:CreateGroupData(groupTable[index])
    ;
    (((self._ui)._list2_Quest):getElementManager()):pushKey(toInt64(0, list2Index))
    ;
    ((self._ui)._list2_Quest):requestUpdateByKey(toInt64(0, list2Index))
    list2Index = list2Index + 1
    if (groupTable[index])._isClicked == true then
      for questIndex = 0, (groupTable[index])._count - 1 do
        -- DECOMPILER ERROR at PC55: Confused about usage of register: R11 in 'UnsetPending'

        (self._questInfo)[list2Index] = ((groupTable[index])._questTable)[questIndex]
        ;
        (((self._ui)._list2_Quest):getElementManager()):pushKey(toInt64(0, list2Index))
        ;
        ((self._ui)._list2_Quest):requestUpdateByKey(toInt64(0, list2Index))
        list2Index = list2Index + 1
      end
    end
  end
end

Window_QuestInfo.SetProgressGroupData = function(self, questGroupCount, questGroupList)
  -- function num : 0_4 , upvalues : questRegion
  local table = {}
  for groupIndex = 0, (self._config)._regionCount - 1 do
    local info = {_isClicked = false, _isGroup = true, _name = questRegion[groupIndex], _groupType = questRegion[groupIndex], _count = 0, 
_questTable = {}
}
    table[groupIndex] = info
  end
  for groupIndex = 0, questGroupCount - 1 do
    local questGroup = questGroupList[groupIndex]
    if questGroup == nil then
      return 
    end
    local questCount = questGroup:getQuestCount()
    for questIndex = 0, questCount - 1 do
      local uiQuestInfo = questGroup:getQuestAt(questIndex)
      if uiQuestInfo == nil then
        return 
      end
      if uiQuestInfo._isCleared == false and uiQuestInfo:checkVisibleCondition() == true then
        local questInfo = self:SetQuestData(uiQuestInfo)
        local groupInfo = table[questInfo._regionType]
        -- DECOMPILER ERROR at PC55: Confused about usage of register: R17 in 'UnsetPending'

        ;
        (groupInfo._questTable)[groupInfo._count] = questInfo
        groupInfo._count = groupInfo._count + 1
      end
    end
  end
  for groupIndex = 0, (self._config)._regionCount - 1 do
    local groupInfo = table[groupIndex]
    groupInfo._name = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_GROUPTITLE", "title", groupInfo._name, "count", groupInfo._count)
  end
  return table
end

Window_QuestInfo.SetGroupData = function(self, questGroupCount, questGroupList)
  -- function num : 0_5
  local table = {}
  local tableIndex = 0
  for groupIndex = 0, questGroupCount - 1 do
    local clearedQuestCount = 0
    local questGroup = questGroupList[groupIndex]
    if questGroup == nil then
      return 
    end
    local info = {_isClicked = false, _isGroup = true, _name = questGroup:getTitle(), _groupType = questGroup:getTitle(), _count = 0, 
_questTable = {}
}
    local questCount = questGroup:getQuestCount()
    for questIndex = 0, questCount - 1 do
      local uiQuestInfo = questGroup:getQuestAt(questIndex)
      if uiQuestInfo == nil then
        _PA_LOG("이호�\156", "uiQuestInfo �\128 없다 ")
        return 
      end
      if uiQuestInfo._isCleared == true then
        clearedQuestCount = clearedQuestCount + 1
      end
      if uiQuestInfo._isCleared == false and uiQuestInfo:checkVisibleCondition() == true then
        local questInfo = self:SetQuestData(uiQuestInfo)
        -- DECOMPILER ERROR at PC55: Confused about usage of register: R19 in 'UnsetPending'

        ;
        (info._questTable)[info._count] = questInfo
        info._count = info._count + 1
      end
    end
    local countBase = tostring(clearedQuestCount) .. "/" .. tostring(info._count)
    info._name = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_GROUPTITLE", "title", questGroup:getTitle(), "count", countBase)
    if info._count ~= 0 then
      table[tableIndex] = info
      tableIndex = tableIndex + 1
    end
  end
  return table
end

Window_QuestInfo.SetQuestData = function(self, uiQuestInfo)
  -- function num : 0_6
  local questListInfo = ToClient_GetQuestList()
  if questListInfo == nil then
    _PA_LOG("이호�\156", "questListInfo �\128 없다 ")
    return 
  end
  local questInfo = {_isCleared = uiQuestInfo._isCleared, _isProgressing = uiQuestInfo._isProgressing, _isContinueQuest = false, _continueQuestName = nil, _continueQuestDetail = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_QUESTINFO_NORMAL_TITLE"), _totalProgressCount = nil, _currentProgressCount = nil, _questType = uiQuestInfo:getQuestType(), _questNo = uiQuestInfo:getQuestNo(), _questName = uiQuestInfo:getTitle(), _completeNpc = uiQuestInfo:getCompleteDisplay(), _questCondition = 0, _desc = ToClient_getReplaceDialog(uiQuestInfo:getDesc()), _isSatisfied = uiQuestInfo:isSatisfied(), _regionType = uiQuestInfo:getQuestRegion(), _groupType = "", _isGroup = false}
  local questNo = questInfo._questNo
  local uiQuestGroupInfo = questListInfo:getQuestGroup(questNo)
  if uiQuestGroupInfo ~= nil then
    questInfo._totalProgressCount = uiQuestGroupInfo:getTotalQuestCount()
    questInfo._currentProgressCount = questNo._quest
    questInfo._continueQuestName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GROUPTITLEINFO", "titleinfo", uiQuestInfo:getTitle())
    questInfo._isContinueQuest = true
    questInfo._questName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_COUNTQUEST", "count", uiQuestInfo:getTitle())
    if uiQuestInfo._isProgressing == false then
      questInfo._questName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_NOTACCEPTTITLE", "title", uiQuestInfo:getTitle())
    end
    local groupTitleDetail = uiQuestGroupInfo:getTitle() .. " (" .. questNo._quest .. "/" .. uiQuestGroupInfo:getTotalQuestCount() .. " "
    questInfo._continueQuestDetail = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_QUESTINFO_GROUP_TITLE", "value", groupTitleDetail)
  end
  do
    local questCondition = PAGetStringParam1(Defines.StringSheet_GAME, "QUESTLIST_COMPLETETARGET", "getCompleteDisplay", questInfo._completeNpc)
    local demand = 0
    local demandCount = uiQuestInfo:getDemandCount()
    for demandIndex = 0, demandCount - 1 do
      demand = uiQuestInfo:getDemandAt(demandIndex)
      questCondition = questCondition .. "\n -" .. demand._desc
    end
    questInfo._questCondition = questCondition
    return questInfo
  end
end

Window_QuestInfo.CreateGroupData = function(self, groupTable)
  -- function num : 0_7
  local questInfo = {_isCleared = nil, _isProgressing = nil, _isContinueQuest = nil, _continueQuestName = nil, _continueQuestDetail = nil, _totalProgressCount = nil, _currentProgressCount = nil, _questType = nil, _questNo = nil, _questName = groupTable._name, _groupType = groupTable._groupType, _completeNpc = nil, _questCondition = nil, _desc = nil, _isSatisfied = nil, _regionType = nil, _isGroup = true}
  return questInfo
end

Window_QuestInfo.InitInputEvent = function(self)
  -- function num : 0_8
  (((self._ui)._questTitle)._progress):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_SelectQuestTitle(" .. ((self._config)._title)._progress .. ")")
  ;
  (((self._ui)._questTitle)._main):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_SelectQuestTitle(" .. ((self._config)._title)._main .. ")")
  ;
  (((self._ui)._questTitle)._recommend):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_SelectQuestTitle(" .. ((self._config)._title)._recommend .. ")")
  ;
  (((self._ui)._questTitle)._repeat):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_SelectQuestTitle(" .. ((self._config)._title)._repeat .. ")")
  ;
  (((self._ui)._questTitle)._buttonLB):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_SelectTitleButton(-1)")
  ;
  (((self._ui)._questTitle)._buttonRB):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_SelectTitleButton(1)")
  ;
  ((self._ui)._list2_Quest):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_Quest_List2EventControlCreate")
  ;
  ((self._ui)._list2_Quest):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  for index = 0, (self._config)._baseRewardMax - 1 do
    Panel_Tooltip_Item_SetPosition(index, ((self._ui)._baseRewardSlot)[index], "QuestReward_Base")
  end
  for index = 0, (self._config)._selectRewardMax - 1 do
    Panel_Tooltip_Item_SetPosition(index, ((self._ui)._selectRewardSlot)[index], "QuestReward_Select")
  end
  ;
  ((self._ui)._radioButton_SetQuestType):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_SetQuestType()")
  ;
  ((self._ui)._radioButton_WorldMap):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_WorldMap()")
  Panel_Window_QuestInfo:RegisterShowEventFunc(true, "PaGlobalFunc_Quest_ShowAni()")
  Panel_Window_QuestInfo:RegisterShowEventFunc(false, "PaGlobalFunc_Quest_HideAni()")
end

PaGlobalFunc_Quest_List2EventControlCreate = function(list_content, key)
  -- function num : 0_9 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  local id = Int64toInt32(key)
  local questInfo = (self._questInfo)[id]
  if questInfo == nil then
    return 
  end
  do
    local questUI = {_radioButton_QuestBg = (UI.getChildControl)(list_content, "RadioButton_QuestBg"), _static_QuesetTypeIcon = (UI.getChildControl)(list_content, "Static_QuestTypeIcon"), _staticText_QuestName = (UI.getChildControl)(list_content, "StaticText_QuestName"), _staticText_ProgressCount = (UI.getChildControl)(list_content, "StaticText_ProgressCount")}
    ;
    (questUI._radioButton_QuestBg):SetCheck(id == self._currentQuestIndex)
    ;
    (questUI._staticText_ProgressCount):SetText("")
    if questInfo._isGroup == true then
      (questUI._static_QuesetTypeIcon):SetShow(false)
      ;
      (questUI._staticText_QuestName):SetText(questInfo._questName)
      ;
      (questUI._radioButton_QuestBg):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_GroupToggle(" .. id .. "," .. self._currentTitleType .. ")")
      return 
    else
      (questUI._static_QuesetTypeIcon):SetShow(true)
      if questInfo._isContinueQuest == true then
        FGlobal_ChangeOnTextureForDialogQuestIcon(questUI._static_QuesetTypeIcon, questInfo._questType)
        ;
        (questUI._staticText_QuestName):SetText(questInfo._continueQuestName)
        ;
        (questUI._staticText_ProgressCount):SetText(questInfo._currentProgressCount .. "/" .. questInfo._totalProgressCount)
      else
        FGlobal_ChangeOnTextureForDialogQuestIcon(questUI._static_QuesetTypeIcon, questInfo._questType)
        ;
        (questUI._staticText_QuestName):SetText(questInfo._questName)
      end
      if _ContentsGroup_isConsoleTest == false then
        (questUI._radioButton_QuestBg):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_SelectQuest(" .. id .. ")")
      else
        (questUI._radioButton_QuestBg):addInputEvent("Mouse_On", "PaGlobalFunc_Quest_SelectQuest(" .. id .. ")")
      end
    end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

Window_QuestInfo.GetTableByTitleType = function(self, titleType)
  -- function num : 0_10
  if ((self._config)._title)._progress == titleType then
    return self._progressTable
  else
    if ((self._config)._title)._main == titleType then
      return self._mainTable
    else
      if ((self._config)._title)._recommend == titleType then
        return self._recommendTable
      else
        if ((self._config)._title)._repeat == titleType then
          return self._repetitionTable
        else
          _PA_LOG("이호�\156", "제목�\180 잘못 됬습니다.")
        end
      end
    end
  end
end

Window_QuestInfo.UpdateTableByTitleType = function(self, table, titleType)
  -- function num : 0_11
  if ((self._config)._title)._progress == titleType then
    self._progressTable = table
  else
    if ((self._config)._title)._main == titleType then
      self._mainTable = table
    else
      if ((self._config)._title)._recommend == titleType then
        self._recommendTable = table
      else
        if ((self._config)._title)._repeat == titleType then
          self._repetitionTable = table
        else
          _PA_LOG("이호�\156", "제목�\180 잘못 됬습니다.")
        end
      end
    end
  end
end

PaGlobalFunc_Quest_GroupToggle = function(id, titleType)
  -- function num : 0_12 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  local questInfo = (self._questInfo)[id]
  if questInfo == nil then
    return 
  end
  local table = self:GetTableByTitleType(titleType)
  if table == nil then
    return 
  end
  for index = 0, #table do
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R9 in 'UnsetPending'

    if (table[index])._groupType == questInfo._groupType then
      (table[index])._isClicked = not (table[index])._isClicked
      break
    end
  end
  do
    self:UpdateTableByTitleType(table, titleType)
    PaGlobalFunc_Quest_SelectQuestTitle(titleType)
  end
end

FromClient_luaLoadComplete = function()
  -- function num : 0_13 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticText_TopTitle = (UI.getChildControl)((self._ui)._static_Title, "StaticText_Title")
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._static_TopTitleIcon = (UI.getChildControl)((self._ui)._static_Title, "Static_TitleIcon")
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._progress = (UI.getChildControl)((self._ui)._static_RadioGroup, "RadioButton_Progress")
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._main = (UI.getChildControl)((self._ui)._static_RadioGroup, "RadioButton_Main")
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._recommend = (UI.getChildControl)((self._ui)._static_RadioGroup, "RadioButton_recommend")
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._repeat = (UI.getChildControl)((self._ui)._static_RadioGroup, "RadioButton_Repeat")
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._buttonLB = (UI.getChildControl)((self._ui)._static_RadioGroup, "Button_LB")
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._buttonRB = (UI.getChildControl)((self._ui)._static_RadioGroup, "Button_RB")
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._frameContent_1_Content = (UI.getChildControl)((self._ui)._frame_Detail, "Frame_1_Content")
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._scroll_FrameVertical = (UI.getChildControl)((self._ui)._frame_Detail, "Frame_1_VerticalScroll")
  -- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questDetail)._staticText_Title = (UI.getChildControl)((self._ui)._frameContent_1_Content, "StaticText_Title")
  -- DECOMPILER ERROR at PC104: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questDetail)._staticText_Type = (UI.getChildControl)((self._ui)._frameContent_1_Content, "StaticText_Type")
  -- DECOMPILER ERROR at PC113: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questDetail)._staticText_Desc = (UI.getChildControl)((self._ui)._frameContent_1_Content, "StaticText_Desc")
  -- DECOMPILER ERROR at PC122: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questDetail)._staticText_Condition = (UI.getChildControl)((self._ui)._frameContent_1_Content, "StaticText_Condition")
  ;
  ((self._ui)._frameContent_1_Content):SetIgnore(false)
  ;
  (((self._ui)._questDetail)._staticText_Desc):SetIgnore(false)
  ;
  (((self._ui)._questDetail)._staticText_Condition):SetIgnore(false)
  for index = 0, (self._config)._baseRewardMax - 1 do
    local control = (UI.getChildControl)((self._ui)._static_BaseReward, "Static_Item0" .. index)
    local slot = {}
    ;
    (SlotItem.new)(slot, "Static_BaseReward_" .. index, index, control, (self._config)._questRewardSlotConfig)
    slot:createChild()
    -- DECOMPILER ERROR at PC170: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._ui)._baseRewardSlot)[index] = slot
    -- DECOMPILER ERROR at PC173: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._ui)._baseRewardControl)[index] = control
  end
  for index = 0, (self._config)._selectRewardMax - 1 do
    local control = (UI.getChildControl)((self._ui)._static_SelectReward, "Static_Item0" .. index)
    local slot = {}
    ;
    (SlotItem.new)(slot, "Static_SelectReward_" .. index, index, control, (self._config)._questRewardSlotConfig)
    slot:createChild()
    -- DECOMPILER ERROR at PC205: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._ui)._selectRewardSlot)[index] = slot
    -- DECOMPILER ERROR at PC208: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._ui)._selectRewardControl)[index] = control
  end
  -- DECOMPILER ERROR at PC217: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radioButton_autoFindWay = (UI.getChildControl)((self._ui)._static_KeyGuideBg, "Radiobutton_autoFindWay")
  -- DECOMPILER ERROR at PC225: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radioButton_WorldMap = (UI.getChildControl)((self._ui)._static_KeyGuideBg, "Radiobutton_WorldMap")
  -- DECOMPILER ERROR at PC233: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radioButton_QuestGiveUp = (UI.getChildControl)((self._ui)._static_KeyGuideBg, "Radiobutton_QuestGiveUp")
  -- DECOMPILER ERROR at PC241: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radioButton_SetQuestType = (UI.getChildControl)((self._ui)._static_KeyGuideBg, "Radiobutton_SetQuestType")
  self:InitInputEvent()
  self:CreateToolTip()
  PaGlobalFunc_Quest_UpdateList()
  PaGlobalFunc_Quest_SelectQuestTitle(((self._config)._title)._progress)
end

Window_QuestInfo.CreateToolTip = function(self)
  -- function num : 0_14
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._expToolTip = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._ui)._static_BaseReward, "expTooltip")
  CopyBaseProperty((self._ui)._static_BaseReward, (self._ui)._expToolTip)
  ;
  ((self._ui)._expToolTip):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._expToolTip):SetAlpha(1)
  ;
  ((self._ui)._expToolTip):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui)._expToolTip):SetSize(80, 50)
  ;
  ((self._ui)._expToolTip):SetAutoResize(true)
  ;
  ((self._ui)._expToolTip):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._expToolTip):SetTextHorizonCenter()
  ;
  ((self._ui)._expToolTip):SetShow(false)
end

PaGlobalFunc_Quest_SelectQuest = function(index)
  -- function num : 0_15 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  self:DetailClear()
  local questInfo = (self._questInfo)[index]
  if questInfo == nil then
    return 
  end
  local title = ((self._ui)._questDetail)._staticText_Title
  title:SetText(questInfo._questName)
  local questType = ((self._ui)._questDetail)._staticText_Type
  questType:SetPosX(title:GetPosX())
  questType:SetPosY(title:GetPosY() + title:GetSizeY() + 7)
  questType:SetText(questInfo._continueQuestDetail)
  local desc = ((self._ui)._questDetail)._staticText_Desc
  desc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  desc:SetAutoResize(true)
  desc:SetPosY(questType:GetPosY() + questType:GetSizeY() + 5)
  desc:SetText(questInfo._desc)
  local condition = ((self._ui)._questDetail)._staticText_Condition
  condition:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  condition:SetAutoResize(true)
  condition:SetPosY((((self._ui)._questDetail)._staticText_Desc):GetPosY() + (((self._ui)._questDetail)._staticText_Desc):GetSizeY() + 5)
  condition:SetText(questInfo._questCondition)
  ;
  ((self._ui)._frameContent_1_Content):SetSize((((self._ui)._questDetail)._staticText_Desc):GetSizeY() + (((self._ui)._questDetail)._staticText_Condition):GetSizeY())
  ;
  ((self._ui)._frame_Detail):UpdateContentScroll()
  ;
  ((self._ui)._scroll_FrameVertical):SetControlPos(0)
  ;
  ((self._ui)._frame_Detail):UpdateContentPos()
  ;
  ((self._ui)._radioButton_autoFindWay):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_FindWay(" .. (questInfo._questNo)._group .. "," .. (questInfo._questNo)._quest .. ",false)")
  ;
  ((self._ui)._radioButton_QuestGiveUp):addInputEvent("Mouse_LUp", "PaGlobalFunc_Quest_GiveUp(" .. index .. ")")
  self._currentQuestIndex = index
  self:SetReward((questInfo._questNo)._group, (questInfo._questNo)._quest)
end

Window_QuestInfo.SetReward = function(self, groupID, questID)
  -- function num : 0_16
  self:SlotClear()
  local questInfo = questList_getQuestStatic(groupID, questID)
  if questInfo == nil then
    _PA_LOG("이호�\156", "questInfo nil")
    return 
  end
  local baseRewardCount = questInfo:getQuestBaseRewardCount()
  local selectRewardCount = questInfo:getQuestSelectRewardCount()
  for baseIndex = 0, baseRewardCount - 1 do
    local baseReward = questInfo:getQuestBaseRewardAt(baseIndex)
    if baseReward == nil then
      return 
    end
    self:SetRewardIcon(((self._ui)._baseRewardSlot)[baseIndex], baseReward, baseIndex, "base")
  end
  for selectIndex = 0, selectRewardCount - 1 do
    local selectReward = questInfo:getQuestSelectRewardAt(selectIndex)
    if selectReward == nil then
      return 
    end
    self:SetRewardIcon(((self._ui)._selectRewardSlot)[selectIndex], selectReward, selectIndex, "select")
  end
end

Window_QuestInfo.SetRewardIcon = function(self, slot, reward, index, rewardStr)
  -- function num : 0_17
  local rewardType = reward:getType()
  if rewardType == nil then
    return 
  end
  slot._type = rewardType
  if __eRewardExp == rewardType then
    (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
    ;
    (slot.icon):addInputEvent("Mouse_On", "PaGlobalFunc_Quest_SetTooltip( \"Exp\", true,\"" .. rewardStr .. "\"," .. index .. " )")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "PaGlobalFunc_Quest_SetTooltip( \"Exp\", false,\"" .. rewardStr .. "\"," .. index .. " )")
    ;
    (slot.icon):SetShow(true)
  else
    if __eRewardSkillExp == rewardType then
      (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExp.dds")
      ;
      (slot.icon):addInputEvent("Mouse_On", "PaGlobalFunc_Quest_SetTooltip( \"SkillExp\", true,\"" .. rewardStr .. "\"," .. index .. " )")
      ;
      (slot.icon):addInputEvent("Mouse_Out", "PaGlobalFunc_Quest_SetTooltip( \"SkillExp\", false,\"" .. rewardStr .. "\"," .. index .. " )")
      ;
      (slot.icon):SetShow(true)
    else
      if __eRewardExpGrade == rewardType then
        (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/ExpGrade.dds")
        ;
        (slot.icon):addInputEvent("Mouse_On", "PaGlobalFunc_Quest_SetTooltip( \"ExpGrade\", true,\"" .. rewardStr .. "\"," .. index .. " )")
        ;
        (slot.icon):addInputEvent("Mouse_Out", "PaGlobalFunc_Quest_SetTooltip( \"ExpGrade\", false,\"" .. rewardStr .. "\"," .. index .. " )")
        ;
        (slot.icon):SetShow(true)
      else
        if __eRewardSkillExpGrade == rewardType then
          (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExpGrade.dds")
          ;
          (slot.icon):addInputEvent("Mouse_On", "PaGlobalFunc_Quest_SetTooltip( \"SkillExpGrade\", true,\"" .. rewardStr .. "\"," .. index .. " )")
          ;
          (slot.icon):addInputEvent("Mouse_Out", "PaGlobalFunc_Quest_SetTooltip( \"SkillExpGrade\", false,\"" .. rewardStr .. "\"," .. index .. " )")
          ;
          (slot.icon):SetShow(true)
        else
          if __eRewardLifeExp == rewardType then
            (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
            ;
            (slot.icon):addInputEvent("Mouse_On", "PaGlobalFunc_Quest_SetTooltip( \"ProductExp\", true,\"" .. rewardStr .. "\"," .. index .. " )")
            ;
            (slot.icon):addInputEvent("Mouse_Out", "PaGlobalFunc_Quest_SetTooltip( \"ProductExp\", false,\"" .. rewardStr .. "\"," .. index .. " )")
            ;
            (slot.icon):SetShow(true)
          else
            if __eRewardItem == rewardType then
              local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(reward:getItemEnchantKey()))
              if itemStatic == nil then
                return 
              end
              ;
              (slot.icon):SetShow(true)
              if reward:getItemCount() ~= 0 and slot.count == nil then
                slot.count = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.icon, "StaticText_" .. slot.id .. "_Count")
                ;
                (slot.count):SetHorizonRight()
                ;
                (slot.count):SetVerticalBottom()
                ;
                (slot.count):SetIgnore(true)
              end
              slot:setItemByStaticStatus(itemStatic, reward:getItemCount())
              slot._item = reward:getItemEnchantKey()
              if rewardStr == "base" then
                (slot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"QuestReward_Base\",true)")
                ;
                (slot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"QuestReward_Base\",false)")
              end
              if rewardStr == "select" then
                (slot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"QuestReward_Select\",true)")
                ;
                (slot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"QuestReward_Select\",false)")
              end
            else
              do
                if __eRewardIntimacy == rewardType then
                  (slot.icon):ChangeTextureInfoName("Icon/New_Icon/00000000_Special_Contributiveness.dds")
                  ;
                  (slot.icon):addInputEvent("Mouse_On", "PaGlobalFunc_Quest_SetTooltip( \"Intimacy\", true,\"" .. rewardStr .. "\"," .. index .. " )")
                  ;
                  (slot.icon):addInputEvent("Mouse_Out", "PaGlobalFunc_Quest_SetTooltip( \"Intimacy\", false,\"" .. rewardStr .. "\"," .. index .. " )")
                  ;
                  (slot.icon):SetShow(true)
                else
                  if __eRewardKnowledge == rewardType then
                    (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/00000000_know_icon.dds")
                    ;
                    (slot.icon):addInputEvent("Mouse_On", "PaGlobalFunc_Quest_SetTooltip( \"Knowledge\", true,\"" .. rewardStr .. "\"," .. index .. "," .. reward:getMentalCardKey() .. " )")
                    ;
                    (slot.icon):addInputEvent("Mouse_Out", "PaGlobalFunc_Quest_SetTooltip( \"Knowledge\", false,\"" .. rewardStr .. "\"," .. index .. "," .. reward:getMentalCardKey() .. " )")
                    ;
                    (slot.icon):SetShow(true)
                  else
                    _PA_LOG("이호�\156", "rewardType�\180 잘못 들어왔다.")
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

PaGlobalFunc_Quest_FindWay = function(groupNo, questNo, isAuto)
  -- function num : 0_18 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  local questInfo = ToClient_GetQuestInfo(groupNo, questNo)
  if questInfo == nil then
    return 
  end
  local questStatic = questList_getQuestStatic(groupNo, questNo)
  if questStatic == nil then
    return 
  end
  local questCondition = QuestConditionCheckType.eQuestConditionCheckType_Complete
  if questInfo:isSatisfied() == true then
    questCondition = QuestConditionCheckType.eQuestConditionCheckType_Complete
  else
    if questInfo._isCleared == false then
      if questInfo._isCleared == false and questInfo._isProgressing == false then
        questCondition = QuestConditionCheckType.eQuestConditionCheckType_NotAccept
      else
        questCondition = QuestConditionCheckType.eQuestConditionCheckType_Progress
      end
    end
  end
  if QuestConditionCheckType.eQuestConditionCheckType_Complete == questCondition then
    if questStatic:isCompleteBlackSpirit() == true then
      HandleClicked_CallBlackSpirit()
    else
      HandleClicked_QuestWidget_FindTarget(groupNo, questNo, questCondition, isAuto)
    end
  else
    if QuestConditionCheckType.eQuestConditionCheckType_NotAccept == questCondition then
      if (questStatic:getAccecptNpc()):get() == 0 then
        HandleClicked_CallBlackSpirit()
      else
        HandleClicked_QuestWidget_FindTarget(groupNo, questNo, questCondition, isAuto)
      end
    else
      HandleClicked_QuestWidget_FindTarget(groupNo, questNo, questCondition, isAuto)
    end
  end
end

PaGlobalFunc_Quest_GiveUp = function(index)
  -- function num : 0_19 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  local questInfo = (self._questInfo)[index]
  if questInfo == nil then
    return 
  end
  if PaGlobal_TutorialManager:isBeginnerTutorialQuest(groupId, questId) == true and PaGlobal_TutorialManager:isDoingTutorial() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
    return 
  end
  ToClient_GiveupQuest((questInfo._questNo)._group, (questInfo._questNo)._quest)
end

PaGlobalFunc_Quest_SetQuestType = function()
  -- function num : 0_20
  FGlobal_CheckedQuestOptionOpen()
end

PaGlobalFunc_Quest_WorldMap = function()
  -- function num : 0_21
  PaGlobalFunc_Quest_SetShow(false)
  FGlobal_PushOpenWorldMap()
end

PaGlobalFunc_Quest_SetTooltip = function(questType, show, rewardStr, index, mentalCardKey)
  -- function num : 0_22 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  local tooltip = (self._ui)._expToolTip
  if tooltip == nil then
    return 
  end
  if show == true then
    if questType == "Exp" then
      tooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_EXP"))
    else
      if questType == "SkillExp" then
        tooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_SKILLEXP"))
      else
        if questType == "ExpGrade" then
          tooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_EXP_GRADE"))
        else
          if questType == "SkillExpGrade" then
            tooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_SKILLEXP_GRADE"))
          else
            if questType == "ProductExp" then
              tooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_PRODUCTEXP"))
            else
              if questType == "Intimacy" then
                tooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_INTIMACY"))
              else
                if questType == "Knowledge" then
                  local mentalCardSSW = ToClinet_getMentalCardStaticStatus(mentalCardKey)
                  if mentalCardSSW == nil then
                    return 
                  end
                  local mentalCardName = mentalCardSSW:getName()
                  local mentalCardDesc = mentalCardSSW:getDesc()
                  tooltip:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARD_TOOLTIP_KNOWLEDGE", "mentalCardName", mentalCardName, "mentalCardName2", mentalCardName))
                end
              end
            end
          end
        end
      end
    end
    do
      if rewardStr == "base" then
        tooltip:SetPosX((((self._ui)._baseRewardControl)[index]):GetPosX() - (((self._ui)._baseRewardControl)[index]):GetPosX() / 2)
        tooltip:SetPosY((((self._ui)._baseRewardControl)[index]):GetPosY() - tooltip:GetSizeY())
      else
        if rewardStr == "select" then
          tooltip:SetPosX((((self._ui)._selectRewardControl)[index]):GetPosX() - (((self._ui)._selectRewardControl)[index]):GetPosX() / 2)
          tooltip:SetPosY((((self._ui)._selectRewardControl)[index]):GetPosY() - tooltip:GetSizeY())
        end
      end
      tooltip:SetShow(true)
      tooltip:SetShow(false)
    end
  end
end

Window_QuestInfo.SlotClear = function(self)
  -- function num : 0_23
  for index = 0, (self._config)._baseRewardMax - 1 do
    ((((self._ui)._baseRewardSlot)[index]).icon):SetShow(false)
    if (((self._ui)._baseRewardSlot)[index]).count ~= nil then
      ((((self._ui)._baseRewardSlot)[index]).count):SetShow(false)
      -- DECOMPILER ERROR at PC29: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (((self._ui)._baseRewardSlot)[index])._item = 0
    end
  end
  for index = 0, (self._config)._selectRewardMax - 1 do
    ((((self._ui)._selectRewardSlot)[index]).icon):SetShow(false)
    if (((self._ui)._selectRewardSlot)[index]).count ~= nil then
      ((((self._ui)._selectRewardSlot)[index]).count):SetShow(false)
      -- DECOMPILER ERROR at PC60: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (((self._ui)._selectRewardSlot)[index])._item = 0
    end
  end
end

Window_QuestInfo.DetailClear = function(self)
  -- function num : 0_24
  (((self._ui)._questDetail)._staticText_Title):SetText("")
  ;
  (((self._ui)._questDetail)._staticText_Desc):SetText("")
  ;
  (((self._ui)._questDetail)._staticText_Condition):SetText("")
  ;
  (((self._ui)._questDetail)._staticText_Type):SetText("")
  ;
  ((self._ui)._frame_Detail):UpdateContentScroll()
  ;
  ((self._ui)._scroll_FrameVertical):SetControlPos(0)
  ;
  ((self._ui)._frame_Detail):UpdateContentPos()
end

PaGlobalFunc_Quest_OpenDetail = function(questGroupId, questId, titleType)
  -- function num : 0_25 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  local table = self:GetTableByTitleType(titleType)
  if table == nil then
    return 
  end
  if PaGlobalFunc_Quest_GetShow() == false then
    PaGlobalFunc_Quest_SetShow(true)
  end
  PaGlobalFunc_Quest_UpdateList()
  for groupIndex = 0, #table do
    for questIndex = 0, (table[groupIndex])._count - 1 do
      local questInfo = ((table[groupIndex])._questTable)[questIndex]
      if questInfo == nil then
        return 
      end
      -- DECOMPILER ERROR at PC41: Confused about usage of register: R14 in 'UnsetPending'

      if questGroupId == (questInfo._questNo)._group and questId == (questInfo._questNo)._quest then
        (table[groupIndex])._isClicked = true
        self:UpdateTableByTitleType(table, titleType)
        break
      end
    end
  end
  PaGlobalFunc_Quest_SelectQuestTitle(titleType)
  for index = 0, #self._questInfo - 1 do
    local questInfo = (self._questInfo)[index]
    if questInfo._isGroup == false and questGroupId == (questInfo._questNo)._group and questId == (questInfo._questNo)._quest then
      PaGlobalFunc_Quest_SelectQuest(index)
      break
    end
  end
end

Window_QuestInfo.GetQuestGroupCount = function(self, titleType, selfPlayerQuestInfo)
  -- function num : 0_26
  local count = -1
  if ((self._config)._title)._progress == titleType then
    count = selfPlayerQuestInfo:getQuestGroupCount()
  else
    if ((self._config)._title)._main == titleType then
      count = selfPlayerQuestInfo:getMainQuestGroupCount()
    else
      if ((self._config)._title)._recommend == titleType then
        count = selfPlayerQuestInfo:getRecommendationQuestGroupCount()
      else
        if ((self._config)._title)._repeat == titleType then
          count = selfPlayerQuestInfo:getRepetitionQuestGroupCount()
        else
          count = -1
        end
      end
    end
  end
  return count
end

Window_QuestInfo.GetQuestGroupByIndex = function(self, titleType, questListIndex, selfPlayerQuestInfo)
  -- function num : 0_27
  local questGroup = nil
  if ((self._config)._title)._progress == titleType then
    questGroup = selfPlayerQuestInfo:getQuestGroupAt(questListIndex)
  else
    if ((self._config)._title)._main == titleType then
      questGroup = selfPlayerQuestInfo:getMainQuestGroupAt(questListIndex)
    else
      if ((self._config)._title)._recommend == titleType then
        questGroup = selfPlayerQuestInfo:getRecommendationQuestGroupAt(questListIndex)
      else
        if ((self._config)._title)._repeat == titleType then
          questGroup = selfPlayerQuestInfo:getRepetitionQuestGroupAt(questListIndex)
        else
          questGroup = nil
        end
      end
    end
  end
  return questGroup
end

PaGlobalFunc_Quest_ShowAni = function()
  -- function num : 0_28 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  local panel = Panel_Window_QuestInfo
  panel:ResetVertexAni()
  local aniInfo = panel:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartPosition(getScreenSizeX(), 0)
  aniInfo:SetEndPosition(getScreenSizeX() - panel:GetSizeX(), 0)
  aniInfo.IsChangeChild = true
  aniInfo:SetHideAtEnd(false)
  aniInfo:SetDisableWhileAni(true)
  ;
  ((self._ui)._staticText_TopTitle):ComputePos()
  ;
  ((self._ui)._staticText_TopTitle):ResetVertexAni()
  ;
  ((self._ui)._staticText_TopTitle):SetVertexAniRun("Ani_Move_Pos_Show", true)
  ;
  ((self._ui)._static_TopTitleIcon):ComputePos()
  ;
  ((self._ui)._static_TopTitleIcon):ResetVertexAni()
  ;
  ((self._ui)._static_TopTitleIcon):SetVertexAniRun("Ani_Move_Pos_Show", true)
end

PaGlobalFunc_Quest_HideAni = function()
  -- function num : 0_29
  local panel = Panel_Window_QuestInfo
  panel:ResetVertexAni()
  local aniInfo = panel:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo:SetStartPosition(panel:GetPosX(), 0)
  aniInfo:SetEndPosition(panel:GetPosX() + 600, 0)
  aniInfo.IsChangeChild = true
  aniInfo:SetHideAtEnd(true)
  aniInfo:SetDisableWhileAni(true)
end

PaGlobalFunc_Quest_Close = function()
  -- function num : 0_30
  Panel_Window_QuestInfo:SetShow(false, true)
end

PaGlobalFunc_Quest_SetShow = function(value)
  -- function num : 0_31 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  if value == true then
    FGlobal_Panel_Radar_Show(false, true)
    Panel_TimeBar:SetShow(false, true)
    FGlobal_QuestWidget_Close()
  else
    FGlobal_Panel_Radar_Show(true, true)
    Panel_TimeBar:SetShow(true, true)
    FGlobal_QuestWidget_Open()
  end
  Panel_Window_QuestInfo:SetShow(value, true)
end

PaGlobalFunc_Quest_GetShow = function()
  -- function num : 0_32
  return Panel_Window_QuestInfo:GetShow()
end

PaGlobalFunc_Quest_Toggle = function()
  -- function num : 0_33
  Panel_Window_QuestInfo:SetShow(not Panel_Window_QuestInfo:GetShow())
end

Toggle_QuestTab_forPadEventFunc = function(index)
  -- function num : 0_34 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  _PA_LOG("원선", "�\164 먹음?" .. index)
  if index == 0 then
    PaGlobalFunc_Quest_SelectQuestTitle(((self._config)._title)._progress)
  else
    if index == 1 then
      PaGlobalFunc_Quest_SelectQuestTitle(((self._config)._title)._main)
    else
      if index == 2 then
        PaGlobalFunc_Quest_SelectQuestTitle(((self._config)._title)._recommend)
      else
        if index == 3 then
          PaGlobalFunc_Quest_SelectQuestTitle(((self._config)._title)._repeat)
        end
      end
    end
  end
end

Quest_TabSound = function()
  -- function num : 0_35
  if DragManager:isDragging() then
    DragManager:clearInfo()
  end
  if isFirstTab == true then
    isFirstTab = false
  else
    audioPostEvent_SystemUi(0, 0)
  end
  Inventory_updateSlotData()
  Inventory_CashTabScroll(true)
end

Window_QuestInfo.Resize = function(self)
  -- function num : 0_36
end

PaGlobalFunc_Quest_Resize = function()
  -- function num : 0_37 , upvalues : Window_QuestInfo
  Window_QuestInfo:Resize()
end

Window_QuestInfo.Clear = function(self)
  -- function num : 0_38
  local titleType = -1
  self:DetailClear()
  self:SlotClear()
  ;
  (((self._ui)._list2_Quest):getElementManager()):clearKey()
  self._progressTable = {}
  self._recommendTable = {}
  self._mainTable = {}
  self._repetitionTable = {}
end

PaGlobalFunc_Quest_UpdateList = function()
  -- function num : 0_39 , upvalues : Window_QuestInfo
  local self = Window_QuestInfo
  self:Clear()
  self._progressTable = self:GetQuestGroupByTitle(((self._config)._title)._progress)
  self._recommendTable = self:GetQuestGroupByTitle(((self._config)._title)._recommend)
  self._mainTable = self:GetQuestGroupByTitle(((self._config)._title)._main)
  self._repetitionTable = self:GetQuestGroupByTitle(((self._config)._title)._repeat)
  PaGlobalFunc_Quest_SelectQuestTitle(self._currentTitleType)
end

registerEvent("EventQuestListChanged", "PaGlobalFunc_Quest_UpdateList")
registerEvent("onScreenResize", "PaGlobalFunc_Quest_Resize")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete")
