-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\quest\console\panel_window_questinfo.luac 

-- params : ...
-- function num : 0
local Window_QuestInfoRenewal = {
_ui = {_expToolTip; 
_questTitle = {}
, 
_questDetail = {}
, 
_baseRewardSlot = {}
, 
_selectRewardSlot = {}
, _static_RadioGroup = (UI.getChildControl)(Panel_Window_QuestInfo, "Static_RadioGroup"), _list2_Quest = (UI.getChildControl)(Panel_Window_QuestInfo, "List2_Quest"), _frame_Detail = (UI.getChildControl)(Panel_Window_QuestInfo, "Frame_Detail"), _static_BaseReward = (UI.getChildControl)(Panel_Window_QuestInfo, "Static_BaseReward"), _static_SelectReward = (UI.getChildControl)(Panel_Window_QuestInfo, "Static_SelectReward"), _staticText_RadioButtonTooltip = (UI.getChildControl)(Panel_Window_QuestInfo, "StaticText_RadioButtonTooltip"), _static_KeyGuideBg = (UI.getChildControl)(Panel_Window_QuestInfo, "Static_KeyGuideBg")}
, 
_config = {
_title = {_progress = 0, _main = 1, _recommend = 2, _repeat = 3}
, _selectRewardMax = 6, _baseRewardMax = 6, 
_questRewardSlotConfig = {_createIcon = true, _createBorder = true, _createCount = true, _createClassEquipBG = true, _createCash = true}
}
, 
_questInfo = {}
, _currentQuestCount = 0, _currentTitleType = 0}
FGlobal_SelectTitleButton = function(value)
  -- function num : 0_0 , upvalues : Window_QuestInfoRenewal
  local self = Window_QuestInfoRenewal
  self._currentTitleType = self._currentTitleType + value
  if self._currentTitleType < ((self._config)._title)._progress then
    self._currentTitleType = ((self._config)._title)._repeat
  end
  if ((self._config)._title)._repeat < self._currentTitleType then
    self._currentTitleType = ((self._config)._title)._progress
  end
  FGlobal_SelectQuestTitle(self._currentTitleType)
end

FGlobal_SelectQuestTitle = function(questType)
  -- function num : 0_1 , upvalues : Window_QuestInfoRenewal
  local self = Window_QuestInfoRenewal
  local titleType = -1
  self:DetailClear()
  self:SlotClear()
  ;
  (((self._ui)._list2_Quest):getElementManager()):clearKey()
  self._currentTitleType = questType
  if ((self._config)._title)._progress == self._currentTitleType then
    titleType = ((self._config)._title)._progress
    ;
    ((self._ui)._staticText_RadioButtonTooltip):SetText("진행�\145")
    ;
    ((self._ui)._staticText_RadioButtonTooltip):SetPosX((((self._ui)._questTitle)._progress):GetPosX() - (((self._ui)._questTitle)._progress):GetSizeX() / 2)
  else
    if ((self._config)._title)._main == self._currentTitleType then
      titleType = ((self._config)._title)._main
      ;
      ((self._ui)._staticText_RadioButtonTooltip):SetText("메인")
      ;
      ((self._ui)._staticText_RadioButtonTooltip):SetPosX((((self._ui)._questTitle)._main):GetPosX() - (((self._ui)._questTitle)._main):GetSizeX() / 2)
    else
      if ((self._config)._title)._recommend == self._currentTitleType then
        titleType = ((self._config)._title)._recommend
        ;
        ((self._ui)._staticText_RadioButtonTooltip):SetText("추천")
        ;
        ((self._ui)._staticText_RadioButtonTooltip):SetPosX((((self._ui)._questTitle)._recommend):GetPosX() - (((self._ui)._questTitle)._recommend):GetSizeX() / 2)
      else
        if ((self._config)._title)._repeat == self._currentTitleType then
          titleType = ((self._config)._title)._repeat
          ;
          ((self._ui)._staticText_RadioButtonTooltip):SetText("반복")
          ;
          ((self._ui)._staticText_RadioButtonTooltip):SetPosX((((self._ui)._questTitle)._repeat):GetPosX() - (((self._ui)._questTitle)._repeat):GetSizeX() / 2)
        else
          titleType = -1
        end
      end
    end
  end
  self:SettingQuestInfo(titleType)
end

Window_QuestInfoRenewal.SettingQuestInfo = function(self, titleType)
  -- function num : 0_2
  if titleType == -1 then
    return 
  end
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
  self:SettingQuestListInfo(questGroupCount, questGroupList)
end

Window_QuestInfoRenewal.SettingQuestListInfo = function(self, questGroupCount, questGroupList)
  -- function num : 0_3
  self._questInfo = {}
  local currentQuestListCount = 0
  for groupIndex = 0, questGroupCount - 1 do
    local questGroup = questGroupList[groupIndex]
    if questGroup == nil then
      return 
    end
    local questCount = nil
    questCount = questGroup:getQuestCount()
    if questCount == nil or questCount == 0 then
      return 
    end
    for questIndex = 0, questCount - 1 do
      local uiQuestInfo = questGroup:getQuestAt(questIndex)
      if uiQuestInfo == nil then
        _PA_LOG("이호�\156", "uiQuestInfo �\128 없다 ")
        return 
      end
      if uiQuestInfo._isCleared == false and uiQuestInfo:checkVisibleCondition() == true then
        local questInfo = {_isCleared = uiQuestInfo._isCleared, _isProgressing = uiQuestInfo._isProgressing, _isContinueQuest = false, _groupTitle = nil, _groupTitleDetail = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_QUESTINFO_NORMAL_TITLE"), _totalProgressCount = nil, _currentProgressCount = nil, _buttonIgnore = false, _questType = uiQuestInfo:getQuestType(), _questNo = uiQuestInfo:getQuestNo(), _questName = uiQuestInfo:getTitle(), _completeNpc = uiQuestInfo:getCompleteDisplay(), _questCondition = 0, _desc = ToClient_getReplaceDialog(uiQuestInfo:getDesc()), _isSatisfied = uiQuestInfo:isSatisfied()}
        local questNo = questInfo._questNo
        local questListInfo = ToClient_GetQuestList()
        if questListInfo == nil then
          _PA_LOG("이호�\156", "questListInfo �\128 없다 ")
          return 
        end
        local uiQuestGroupInfo = questListInfo:getQuestGroup(questNo)
        if uiQuestGroupInfo ~= nil then
          questInfo._totalProgressCount = uiQuestGroupInfo:getTotalQuestCount()
          questInfo._currentProgressCount = questNo._quest
          questInfo._groupTitle = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GROUPTITLEINFO", "titleinfo", uiQuestGroupInfo:getTitle())
          questInfo._buttonIgnore = true
          questInfo._isContinueQuest = true
          questInfo._questName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_COUNTQUEST", "title", uiQuestInfo:getTitle())
          if uiQuestInfo._isProgressing == false then
            questInfo._questName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_NOTACCEPTTITLE", "title", uiQuestInfo:getTitle())
          end
          local groupTitleDetail = uiQuestGroupInfo:getTitle() .. " (" .. questNo._quest .. "/" .. uiQuestGroupInfo:getTotalQuestCount() .. " "
          questInfo._groupTitleDetail = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_QUESTINFO_GROUP_TITLE", "value", groupTitleDetail)
        end
        do
          local questCondition = PAGetStringParam1(Defines.StringSheet_GAME, "QUESTLIST_COMPLETETARGET", "getCompleteDisplay", questInfo._completeNpc)
          local demand = 0
          do
            local demandCount = uiQuestInfo:getDemandCount()
            for demandIndex = 0, demandCount - 1 do
              demand = uiQuestInfo:getDemandAt(demandIndex)
              questCondition = questCondition .. "\n -" .. demand._desc
            end
            questInfo._questCondition = questCondition
            ;
            (((self._ui)._list2_Quest):getElementManager()):pushKey(toInt64(0, currentQuestListCount))
            ;
            ((self._ui)._list2_Quest):requestUpdateByKey(toInt64(0, currentQuestListCount))
            -- DECOMPILER ERROR at PC190: Confused about usage of register: R22 in 'UnsetPending'

            ;
            (self._questInfo)[currentQuestListCount] = questInfo
            currentQuestListCount = currentQuestListCount + 1
            -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  self._currentQuestCount = currentQuestListCount
end

Window_QuestInfoRenewal.InitInputEvent = function(self)
  -- function num : 0_4
  (((self._ui)._questTitle)._progress):addInputEvent("Mouse_LUp", "FGlobal_SelectQuestTitle(" .. ((self._config)._title)._progress .. ")")
  ;
  (((self._ui)._questTitle)._main):addInputEvent("Mouse_LUp", "FGlobal_SelectQuestTitle(" .. ((self._config)._title)._main .. ")")
  ;
  (((self._ui)._questTitle)._recommend):addInputEvent("Mouse_LUp", "FGlobal_SelectQuestTitle(" .. ((self._config)._title)._recommend .. ")")
  ;
  (((self._ui)._questTitle)._repeat):addInputEvent("Mouse_LUp", "FGlobal_SelectQuestTitle(" .. ((self._config)._title)._repeat .. ")")
  ;
  (((self._ui)._questTitle)._buttonLB):addInputEvent("Mouse_LUp", "FGlobal_SelectTitleButton(-1)")
  ;
  (((self._ui)._questTitle)._buttonRB):addInputEvent("Mouse_LUp", "FGlobal_SelectTitleButton(1)")
  ;
  ((self._ui)._list2_Quest):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_Quest_List2EventControlCreate")
  ;
  ((self._ui)._list2_Quest):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  for index = 0, (self._config)._baseRewardMax - 1 do
    Panel_Tooltip_Item_SetPosition(index, ((self._ui)._baseRewardSlot)[index], "QuestReward_Base")
  end
  for index = 0, (self._config)._selectRewardMax - 1 do
    Panel_Tooltip_Item_SetPosition(index, ((self._ui)._selectRewardSlot)[index], "QuestReward_Select")
  end
end

FGlobal_Quest_List2EventControlCreate = function(list_content, key)
  -- function num : 0_5 , upvalues : Window_QuestInfoRenewal
  local self = Window_QuestInfoRenewal
  local id = Int64toInt32(key)
  local questInfo = (self._questInfo)[id]
  if questInfo == nil then
    return 
  end
  local radioButton_QuestBg = (UI.getChildControl)(list_content, "RadioButton_QuestBg")
  local static_QuesetTypeIcon = (UI.getChildControl)(list_content, "Static_QuestTypeIcon")
  local staticText_QuestName = (UI.getChildControl)(list_content, "StaticText_QuestName")
  local staticText_ProgressCount = (UI.getChildControl)(list_content, "StaticText_ProgressCount")
  staticText_ProgressCount:SetText("")
  if questInfo._isContinueQuest == true then
    FGlobal_ChangeOnTextureForDialogQuestIcon(static_QuesetTypeIcon, questInfo._questType)
    staticText_QuestName:SetText(questInfo._groupTitle)
    staticText_ProgressCount:SetText(questInfo._currentProgressCount .. "/" .. questInfo._totalProgressCount)
  else
    FGlobal_ChangeOnTextureForDialogQuestIcon(static_QuesetTypeIcon, questInfo._questType)
    staticText_QuestName:SetText(questInfo._questName)
  end
  radioButton_QuestBg:addInputEvent("Mouse_LUp", "FGlobal_SelectQuest(" .. id .. ")")
end

FromClient_luaLoadComplete = function()
  -- function num : 0_6 , upvalues : Window_QuestInfoRenewal
  local self = Window_QuestInfoRenewal
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._progress = (UI.getChildControl)((self._ui)._static_RadioGroup, "RadioButton_Progress")
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._main = (UI.getChildControl)((self._ui)._static_RadioGroup, "RadioButton_Main")
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._recommend = (UI.getChildControl)((self._ui)._static_RadioGroup, "RadioButton_recommend")
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._repeat = (UI.getChildControl)((self._ui)._static_RadioGroup, "RadioButton_Repeat")
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._buttonLB = (UI.getChildControl)((self._ui)._static_RadioGroup, "Button_LB")
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questTitle)._buttonRB = (UI.getChildControl)((self._ui)._static_RadioGroup, "Button_RB")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._frameContent_1_Content = (UI.getChildControl)((self._ui)._frame_Detail, "Frame_1_Content")
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._scroll_FrameVertical = (UI.getChildControl)((self._ui)._frame_Detail, "Frame_1_VerticalScroll")
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questDetail)._staticText_Title = (UI.getChildControl)((self._ui)._frameContent_1_Content, "StaticText_Title")
  -- DECOMPILER ERROR at PC88: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questDetail)._staticText_Type = (UI.getChildControl)((self._ui)._frameContent_1_Content, "StaticText_Type")
  -- DECOMPILER ERROR at PC97: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui)._questDetail)._staticText_Desc = (UI.getChildControl)((self._ui)._frameContent_1_Content, "StaticText_Desc")
  -- DECOMPILER ERROR at PC106: Confused about usage of register: R1 in 'UnsetPending'

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
    -- DECOMPILER ERROR at PC154: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._ui)._baseRewardSlot)[index] = slot
  end
  for index = 0, (self._config)._selectRewardMax - 1 do
    local control = (UI.getChildControl)((self._ui)._static_SelectReward, "Static_Item0" .. index)
    local slot = {}
    ;
    (SlotItem.new)(slot, "Static_SelectReward_" .. index, index, control, (self._config)._questRewardSlotConfig)
    slot:createChild()
    -- DECOMPILER ERROR at PC186: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._ui)._selectRewardSlot)[index] = slot
  end
  self:InitInputEvent()
  self:CreateToolTip()
  FGlobal_SelectQuestTitle(((self._config)._title)._progress)
end

Window_QuestInfoRenewal.CreateToolTip = function(self)
  -- function num : 0_7
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
  ((self._ui)._expToolTip):SetAutoResize(true)
  ;
  ((self._ui)._expToolTip):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._expToolTip):SetTextHorizonCenter()
  ;
  ((self._ui)._expToolTip):SetShow(false)
end

FGlobal_SelectQuest = function(index)
  -- function num : 0_8 , upvalues : Window_QuestInfoRenewal
  local self = Window_QuestInfoRenewal
  self:DetailClear()
  local questInfo = (self._questInfo)[index]
  if questInfo == nil then
    return 
  end
  ;
  (((self._ui)._questDetail)._staticText_Title):SetText(questInfo._questName)
  local desc = ((self._ui)._questDetail)._staticText_Desc
  desc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  desc:SetAutoResize(true)
  desc:SetText(questInfo._desc)
  local condition = ((self._ui)._questDetail)._staticText_Condition
  condition:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  condition:SetAutoResize(true)
  condition:SetPosY((((self._ui)._questDetail)._staticText_Desc):GetPosY() + (((self._ui)._questDetail)._staticText_Desc):GetSizeY() + 5)
  condition:SetText(questInfo._questCondition)
  ;
  (((self._ui)._questDetail)._staticText_Type):SetText(questInfo._groupTitleDetail)
  ;
  ((self._ui)._frameContent_1_Content):SetSize((((self._ui)._questDetail)._staticText_Desc):GetSizeY() + (((self._ui)._questDetail)._staticText_Condition):GetSizeY())
  ;
  ((self._ui)._frame_Detail):UpdateContentScroll()
  ;
  ((self._ui)._scroll_FrameVertical):SetControlPos(0)
  ;
  ((self._ui)._frame_Detail):UpdateContentPos()
  ;
  ((self._ui)._static_KeyGuideBg):addInputEvent("Mouse_LUp", "FGlobal_QuestFindWay(" .. (questInfo._questNo)._group .. "," .. (questInfo._questNo)._quest .. ",false)")
  self:SetReward((questInfo._questNo)._group, (questInfo._questNo)._quest)
end

Window_QuestInfoRenewal.SetReward = function(self, groupID, questID)
  -- function num : 0_9
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

Window_QuestInfoRenewal.SetRewardIcon = function(self, slot, reward, index, rewardStr)
  -- function num : 0_10
  local rewardType = reward:getType()
  if rewardType == nil then
    return 
  end
  slot._type = rewardType
  if __eRewardExp == rewardType then
    (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
    ;
    (slot.icon):addInputEvent("Mouse_On", "FGlobal_SetTooltip( \"Exp\", true,\"" .. rewardStr .. "\"," .. index .. " )")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "FGlobal_SetTooltip( \"Exp\", false,\"" .. rewardStr .. "\"," .. index .. " )")
    ;
    (slot.icon):SetShow(true)
  else
    if __eRewardSkillExp == rewardType then
      (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExp.dds")
      ;
      (slot.icon):addInputEvent("Mouse_On", "FGlobal_SetTooltip( \"SkillExp\", true,\"" .. rewardStr .. "\"," .. index .. " )")
      ;
      (slot.icon):addInputEvent("Mouse_Out", "FGlobal_SetTooltip( \"SkillExp\", false,\"" .. rewardStr .. "\"," .. index .. " )")
      ;
      (slot.icon):SetShow(true)
    else
      if __eRewardExpGrade == rewardType then
        (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/ExpGrade.dds")
        ;
        (slot.icon):addInputEvent("Mouse_On", "FGlobal_SetTooltip( \"ExpGrade\", true,\"" .. rewardStr .. "\"," .. index .. " )")
        ;
        (slot.icon):addInputEvent("Mouse_Out", "FGlobal_SetTooltip( \"ExpGrade\", false,\"" .. rewardStr .. "\"," .. index .. " )")
        ;
        (slot.icon):SetShow(true)
      else
        if __eRewardSkillExpGrade == rewardType then
          (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExpGrade.dds")
          ;
          (slot.icon):addInputEvent("Mouse_On", "FGlobal_SetTooltip( \"SkillExpGrade\", true,\"" .. rewardStr .. "\"," .. index .. " )")
          ;
          (slot.icon):addInputEvent("Mouse_Out", "FGlobal_SetTooltip( \"SkillExpGrade\", false,\"" .. rewardStr .. "\"," .. index .. " )")
          ;
          (slot.icon):SetShow(true)
        else
          if __eRewardLifeExp == rewardType then
            (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
            ;
            (slot.icon):addInputEvent("Mouse_On", "FGlobal_SetTooltip( \"ProductExp\", true,\"" .. rewardStr .. "\"," .. index .. " )")
            ;
            (slot.icon):addInputEvent("Mouse_Out", "FGlobal_SetTooltip( \"ProductExp\", false,\"" .. rewardStr .. "\"," .. index .. " )")
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
                (slot.count):SetTextHorizonRight()
                ;
                (slot.count):SetTextVerticalBottom()
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
                  (slot.icon):addInputEvent("Mouse_On", "FGlobal_SetTooltip( \"Intimacy\", true,\"" .. rewardStr .. "\"," .. index .. " )")
                  ;
                  (slot.icon):addInputEvent("Mouse_Out", "FGlobal_SetTooltip( \"Intimacy\", false,\"" .. rewardStr .. "\"," .. index .. " )")
                  ;
                  (slot.icon):SetShow(true)
                else
                  if __eRewardKnowledge == rewardType then
                    (slot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/00000000_know_icon.dds")
                    ;
                    (slot.icon):addInputEvent("Mouse_On", "FGlobal_SetTooltip( \"Knowledge\", true,\"" .. rewardStr .. "\"," .. index .. "," .. reward:getMentalCardKey() .. " )")
                    ;
                    (slot.icon):addInputEvent("Mouse_Out", "FGlobal_SetTooltip( \"Knowledge\", false,\"" .. rewardStr .. "\"," .. index .. "," .. reward:getMentalCardKey() .. " )")
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

FGlobal_QuestFindWay = function(groupNo, questNo, isAuto)
  -- function num : 0_11 , upvalues : Window_QuestInfoRenewal
  local self = Window_QuestInfoRenewal
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

FGlobal_SetTooltip = function(questType, show, rewardStr, index, mentalCardKey)
  -- function num : 0_12 , upvalues : Window_QuestInfoRenewal
  local self = Window_QuestInfoRenewal
  if (self._ui)._expToolTip == nil then
    return 
  end
  if show == true then
    if questType == "Exp" then
      ((self._ui)._expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_EXP"))
    else
      if questType == "SkillExp" then
        ((self._ui)._expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_SKILLEXP"))
      else
        if questType == "ExpGrade" then
          ((self._ui)._expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_EXP_GRADE"))
        else
          if questType == "SkillExpGrade" then
            ((self._ui)._expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_SKILLEXP_GRADE"))
          else
            if questType == "ProductExp" then
              ((self._ui)._expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_PRODUCTEXP"))
            else
              if questType == "Intimacy" then
                ((self._ui)._expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_INTIMACY"))
              else
                if questType == "Knowledge" then
                  local mentalCardSSW = ToClinet_getMentalCardStaticStatus(mentalCardKey)
                  if mentalCardSSW == nil then
                    return 
                  end
                  local mentalCardName = mentalCardSSW:getName()
                  local mentalCardDesc = mentalCardSSW:getDesc()
                  ;
                  ((self._ui)._expToolTip):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARD_TOOLTIP_KNOWLEDGE", "mentalCardName", mentalCardName, "mentalCardName2", mentalCardName))
                end
              end
            end
          end
        end
      end
    end
    do
      if rewardStr == "base" then
        ((self._ui)._expToolTip):SetPosX(((((self._ui)._baseRewardSlot)[index]).icon):GetPosX() - ((self._ui)._expToolTip):GetSizeX() / 2)
        ;
        ((self._ui)._expToolTip):SetPosY(((((self._ui)._baseRewardSlot)[index]).icon):GetPosY())
      else
        if rewardStr == "select" then
          ((self._ui)._expToolTip):SetPosX(((((self._ui)._selectRewardSlot)[index]).icon):GetPosX() - ((self._ui)._expToolTip):GetSizeX() / 2)
          ;
          ((self._ui)._expToolTip):SetPosY(((((self._ui)._selectRewardSlot)[index]).icon):GetPosY() - ((self._ui)._expToolTip):GetSizeY())
        end
      end
      ;
      ((self._ui)._expToolTip):SetShow(true)
      ;
      ((self._ui)._expToolTip):SetShow(false)
    end
  end
end

Window_QuestInfoRenewal.SlotClear = function(self)
  -- function num : 0_13
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

Window_QuestInfoRenewal.DetailClear = function(self)
  -- function num : 0_14
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

FGlobal_OpenQuestDetail = function(questGroupId, questId)
  -- function num : 0_15 , upvalues : Window_QuestInfoRenewal
  local self = Window_QuestInfoRenewal
  if Panel_Window_QuestInfo:GetShow() == false then
    Panel_Window_QuestInfo:SetShow(true)
  end
  FGlobal_SelectQuestTitle(((self._config)._title)._progress)
  for index = 0, self._currentQuestCount - 1 do
    local questInfo = (self._questInfo)[index]
    if questGroupId == (questInfo._questNo)._group and questId == (questInfo._questNo)._quest then
      FGlobal_SelectQuest(index)
      break
    end
  end
end

Window_QuestInfoRenewal.GetQuestGroupCount = function(self, titleType, selfPlayerQuestInfo)
  -- function num : 0_16
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

Window_QuestInfoRenewal.GetQuestGroupByIndex = function(self, titleType, questListIndex, selfPlayerQuestInfo)
  -- function num : 0_17
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

FGlobal_QuestInfoSetShow = function(value)
  -- function num : 0_18 , upvalues : Window_QuestInfoRenewal
  local self = Window_QuestInfoRenewal
  Panel_Window_QuestInfo:SetShow(value)
  if FGlobal_QuestInfoGetShow() == true then
    FGlobal_SelectQuestTitle(((self._config)._title)._progress)
  end
end

FGlobal_QuestInfoGetShow = function()
  -- function num : 0_19
  return Panel_Window_QuestInfo:GetShow()
end

FGlobal_QuestInfoIsUISubApp = function()
  -- function num : 0_20
  return Panel_Window_QuestInfo:IsUISubApp()
end

FGlobal_QuestInfoIsUISubAppClose = function()
  -- function num : 0_21
  Panel_Window_QuestInfo:CloseUISubApp()
  FGlobal_QuestInfoSetShow(false)
end

FGlobal_QuestInfoIsUISubAppOpen = function()
  -- function num : 0_22
  Panel_Window_QuestInfo:OpenUISubApp()
end

FGlobal_QuestInfoToggle = function()
  -- function num : 0_23
  Panel_Window_QuestInfo:SetShow(not Panel_Window_QuestInfo:GetShow())
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete")

