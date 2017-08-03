-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\questlist\panel_latestquest.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UIMode = Defines.UIMode
local IM = CppEnums.EProcessorInputMode
PaGlobal_LatestQuest = {_uiLatestGroup = (UI.getChildControl)(Panel_CheckedQuest, "Static_QuestRecentUpdateGroupBg"), _uiTooltip = nil, _uiList = (Array.new)(), _maxVisibleCnt = 3, _maxConditionCnt = 5}
-- DECOMPILER ERROR at PC32: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.initialize = function(self)
  -- function num : 0_0 , upvalues : UI_color
  for ii = 0, self._maxVisibleCnt - 1 do
    local element = {}
    element._uiGroupBG = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Static_GroupBG", self._uiLatestGroup, "uiGroupBG_" .. ii)
    element._uiSelectBG = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Static_SelectedQuestBG", element._uiGroupBG, "uiGroupSelectBG_" .. ii)
    element._uiQuestTitle = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "StaticText_Quest_Title", element._uiGroupBG, "uiQuestTitle_" .. ii)
    element._uiGroupTitle = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "StaticText_WidgetGroupTitle", element._uiGroupBG, "uiGroupTitle_" .. ii)
    element._uiQuestIcon = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Static_Quest_Type", element._uiGroupBG, "uiQuestIcon_" .. ii)
    element._uiAutoNaviBtn = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "CheckButton_AutoNavi", element._uiGroupBG, "uiAutoNaviBtn_" .. ii)
    element._uiNaviBtn = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Checkbox_Quest_Navi", element._uiGroupBG, "uiNaviBtn_" .. ii)
    element._uiGiveupBtn = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "Checkbox_Quest_Giveup", element._uiGroupBG, "uiGiveupBtn_" .. ii)
    element._uiCompleteNpc = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "StaticText_Quest_ClearNpc", element._uiGroupBG, "uiCompleteNpc_" .. ii)
    element._questNo = {_groupId = 0, _questId = 0}
    ;
    (element._uiQuestTitle):SetIgnore(true)
    ;
    (element._uiGroupTitle):SetIgnore(true)
    ;
    (element._uiQuestIcon):SetIgnore(true)
    ;
    (element._uiCompleteNpc):SetIgnore(true)
    element._uiConditions = (Array.new)()
    for jj = 0, self._maxConditionCnt - 1 do
      -- DECOMPILER ERROR at PC137: Confused about usage of register: R10 in 'UnsetPending'

      (element._uiConditions)[jj] = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "StaticText_Quest_Demand", element._uiGroupBG, "uiConditions_" .. ii .. "_" .. jj)
    end
    -- DECOMPILER ERROR at PC140: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._uiList)[ii] = element
  end
  ;
  (self._uiLatestGroup):SetShow(true)
  ;
  (self._uiLatestGroup):SetIgnore(true)
  ;
  (self._uiLatestGroup):SetPosX(2)
  ;
  (self._uiLatestGroup):SetPosY(28)
  ;
  (self._uiLatestGroup):SetNotAbleMasking(false)
  self._uiTooltip = (UI.createAndCopyBasePropertyControl)(Panel_CheckedQuest, "StaticText_Notice_1", self._uiLatestGroup, "uiTooltipForLatestQuest")
  ;
  (self._uiTooltip):SetColor(UI_color.C_FFFFFFFF)
  ;
  (self._uiTooltip):SetAlpha(1)
  ;
  (self._uiTooltip):SetFontColor(UI_color.C_FFC4BEBE)
  ;
  (self._uiTooltip):SetAutoResize(true)
  ;
  (self._uiTooltip):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._uiTooltip):SetShow(false)
  ;
  (self._uiTooltip):SetNotAbleMasking(true)
  for ii = 0, self._maxVisibleCnt - 1 do
    (((self._uiList)[ii])._uiGroupBG):SetSize(Panel_CheckedQuest:GetSizeX() - 18, 30)
    ;
    (((self._uiList)[ii])._uiGroupBG):SetChildIndex(((self._uiList)[ii])._uiAutoNaviBtn, 9999)
    ;
    (((self._uiList)[ii])._uiGroupBG):SetChildIndex(((self._uiList)[ii])._uiNaviBtn, 9999)
    ;
    (((self._uiList)[ii])._uiGroupBG):SetChildIndex(((self._uiList)[ii])._uiGiveupBtn, 9999)
  end
end

PaGlobal_LatestQuest:initialize()
-- DECOMPILER ERROR at PC38: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.update = function(self)
  -- function num : 0_1
  self:clearAll()
  local groupStartY = 5
  local offsetY = 10
  local questListInfo = ToClient_GetQuestList()
  local questCount = questListInfo:getLatestQuestCount()
  local mainQuestInfo = questListInfo:getMainQuestInfo()
  local viewLimitCount = ToClient_GetLatestQuestShowCount()
  if viewLimitCount == 0 or questCount == 0 then
    (self._uiLatestGroup):SetShow(false)
  else
    local viewCount = 0
    for ii = 0, questCount - 1 do
      if viewCount < viewLimitCount then
        local questEntry = (self._uiList)[viewCount]
        local questNo = questListInfo:getLatestQuestAt(ii)
        local uiQuestInfo = ToClient_GetQuestInfo(questNo._group, questNo._quest)
        local isAlreadyShown = PaGlobal_MainQuest:isShownQuest(questNo)
        if uiQuestInfo ~= nil and isAlreadyShown == false then
          self:setGroupBG(viewCount, groupStartY, uiQuestInfo)
          self:setIcon(viewCount, uiQuestInfo:getQuestType())
          self:setTitle(viewCount, questNo._group, questNo._quest)
          self:setButtons(viewCount, uiQuestInfo)
          local nextPosY = (questEntry._uiQuestTitle):GetPosY() + (questEntry._uiQuestTitle):GetSizeY() + 2
          nextPosY = self:setGroupTitle(viewCount, nextPosY, questNo)
          nextPosY = self:setConditions(viewCount, nextPosY, uiQuestInfo)
          ;
          (questEntry._uiGroupBG):SetSize((questEntry._uiGroupBG):GetSizeX(), nextPosY)
          ;
          (questEntry._uiSelectBG):SetSize((questEntry._uiGroupBG):GetSizeX(), nextPosY)
          -- DECOMPILER ERROR at PC100: Confused about usage of register: R17 in 'UnsetPending'

          ;
          (questEntry._questNo)._groupId = questNo._group
          -- DECOMPILER ERROR at PC103: Confused about usage of register: R17 in 'UnsetPending'

          ;
          (questEntry._questNo)._questId = questNo._quest
          groupStartY = groupStartY + nextPosY + 5
          viewCount = viewCount + 1
        end
      end
    end
    ;
    (self._uiLatestGroup):SetSize(Panel_CheckedQuest:GetSizeX() - 5, groupStartY + 5)
    if viewCount == 0 then
      (self._uiLatestGroup):SetShow(false)
    else
      ;
      (self._uiLatestGroup):SetShow(true)
    end
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.isShownQuest = function(self, questNo)
  -- function num : 0_2
  local visibleCount = ToClient_GetLatestQuestShowCount()
  for ii = 0, visibleCount - 1 do
    local questEntry = (self._uiList)[ii]
    if (questEntry._questNo)._groupId == questNo._group and (questEntry._questNo)._questId == questNo._quest then
      return true
    end
  end
  return false
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setGroupBG = function(self, index, posY, uiQuestInfo)
  -- function num : 0_3
  if index < self._maxVisibleCnt then
    local questEntry = (self._uiList)[index]
    local questNo = (uiQuestInfo:getQuestNo())
    local checkCondition = nil
    if uiQuestInfo:isSatisfied() == true then
      checkCondition = 0
    else
      checkCondition = 1
    end
    local groupTitle = "nil"
    local questGroupCnt = 0
    local questListInfo = ToClient_GetQuestList()
    local uiQuestGroupInfo = questListInfo:getQuestGroup(questNo)
    if uiQuestGroupInfo ~= nil then
      groupTitle = uiQuestGroupInfo:getTitle()
      questGroupCnt = uiQuestGroupInfo:getTotalQuestCount()
    end
    ;
    (questEntry._uiGroupBG):SetAlpha(0)
    ;
    (questEntry._uiGroupBG):SetShow(true)
    ;
    (questEntry._uiGroupBG):SetPosX(5)
    ;
    (questEntry._uiGroupBG):SetPosY(posY)
    ;
    (questEntry._uiSelectBG):SetPosX(0)
    ;
    (questEntry._uiSelectBG):SetPosY(0)
    ;
    (questEntry._uiGroupBG):addInputEvent("Mouse_LUp", "HandleClicked_ShowQuestInfo( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", \"" .. groupTitle .. "\", " .. questGroupCnt .. " )")
    ;
    (questEntry._uiGroupBG):addInputEvent("Mouse_RUp", "HandleClicked_QuestWidget_FindTarget( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", false )")
    ;
    (questEntry._uiGroupBG):addInputEvent("Mouse_DownScroll", "QuestWidget_ScrollEvent( true )")
    ;
    (questEntry._uiGroupBG):addInputEvent("Mouse_UpScroll", "QuestWidget_ScrollEvent( false )")
    ;
    (questEntry._uiGroupBG):addInputEvent("Mouse_On", "HandleMouseOver_QuestGroup( true, " .. index .. ", " .. questNo._group .. ", " .. questNo._quest .. " )")
    ;
    (questEntry._uiGroupBG):addInputEvent("Mouse_Out", "HandleMouseOver_QuestGroup( false, " .. index .. ", " .. questNo._group .. " )")
  end
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setIcon = function(self, index, questType)
  -- function num : 0_4
  if index < self._maxVisibleCnt then
    local questEntry = (self._uiList)[index]
    ;
    (questEntry._uiQuestIcon):EraseAllEffect()
    ;
    (questEntry._uiQuestIcon):SetShow(true)
    ;
    (questEntry._uiQuestIcon):SetPosX(2)
    ;
    (questEntry._uiQuestIcon):SetPosY(2)
    FGlobal_ChangeOnTextureForDialogQuestIcon(questEntry._uiQuestIcon, questType)
  end
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setTitle = function(self, index, groupId, questId)
  -- function num : 0_5 , upvalues : UI_color
  if index < self._maxVisibleCnt then
    local questEntry = (self._uiList)[index]
    local questTitle = self:getTitle(groupId, questId)
    ;
    (questEntry._uiQuestTitle):SetAutoResize(true)
    ;
    (questEntry._uiQuestTitle):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
    ;
    (questEntry._uiQuestTitle):SetShow(true)
    ;
    (questEntry._uiQuestTitle):SetIgnore(true)
    ;
    (questEntry._uiQuestTitle):SetLineRender(false)
    ;
    (questEntry._uiQuestTitle):SetPosX((questEntry._uiQuestIcon):GetPosX() + (questEntry._uiQuestIcon):GetSizeX() + 2)
    ;
    (questEntry._uiQuestTitle):SetPosY(2)
    ;
    (questEntry._uiQuestTitle):SetSize(200, (questEntry._uiQuestTitle):GetSizeY())
    ;
    (questEntry._uiQuestTitle):SetText(questTitle)
    ;
    (questEntry._uiQuestTitle):SetFontColor(UI_color.C_FFEFEFEF)
    ;
    (questEntry._uiQuestTitle):useGlowFont(true, "BaseFont_8_Glow", 4287655978)
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setGroupTitle = function(self, index, posY, questNo)
  -- function num : 0_6 , upvalues : UI_color
  if index < self._maxVisibleCnt then
    local questEntry = (self._uiList)[index]
    local questListInfo = ToClient_GetQuestList()
    local uiQuestGroupInfo = questListInfo:getQuestGroup(questNo)
    if uiQuestGroupInfo ~= nil then
      if uiQuestGroupInfo:isGroupQuest() == true then
        local groupTitle = uiQuestGroupInfo:getTitle()
        local groupQuestTitleInfo = groupTitle .. " (" .. questNo._quest .. "/" .. uiQuestGroupInfo:getTotalQuestCount() .. ")"
        ;
        (questEntry._uiGroupTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GROUPTITLEINFO", "titleinfo", groupQuestTitleInfo))
        ;
        (questEntry._uiGroupTitle):SetSize(230, (questEntry._uiQuestTitle):GetSizeY())
        ;
        (questEntry._uiGroupTitle):SetAutoResize(true)
        ;
        (questEntry._uiGroupTitle):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
        ;
        (questEntry._uiGroupTitle):SetPosX(25)
        ;
        (questEntry._uiGroupTitle):SetPosY(posY)
        ;
        (questEntry._uiGroupTitle):SetFontColor(UI_color.C_FFEDE699)
        ;
        (questEntry._uiGroupTitle):SetShow(true)
        ;
        (questEntry._uiGroupTitle):SetIgnore(true)
        posY = posY + (questEntry._uiGroupTitle):GetSizeY()
      else
        do
          do
            ;
            (questEntry._uiGroupTiltle):SetShow(false)
            posY = posY + 5
            return posY
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setConditions = function(self, index, PosY, uiQuestInfo)
  -- function num : 0_7 , upvalues : UI_color
  if index < self._maxVisibleCnt then
    local questEntry = (self._uiList)[index]
    if uiQuestInfo:isSatisfied() == false then
      for index = 0, uiQuestInfo:getDemandCount() - 1 do
        local uiCondition = (questEntry._uiConditions)[index]
        local conditionInfo = uiQuestInfo:getDemandAt(index)
        uiCondition:SetAutoResize(true)
        uiCondition:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
        uiCondition:SetFontColor(UI_color.C_FFC4BEBE)
        if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
          uiCondition:SetPosX(10)
        else
          uiCondition:SetPosX(25)
        end
        uiCondition:SetPosY(PosY)
        uiCondition:SetSize((questEntry._uiGroupBG):GetSizeX() - uiCondition:GetPosX(), uiCondition:GetTextSizeY())
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
        PosY = PosY + uiCondition:GetSizeY() + 2
      end
    else
      do
        do
          if uiQuestInfo:getQuestType() == 0 then
            (questEntry._uiQuestIcon):AddEffect("UI_Quest_Complete_GoldAura", true, 130, 0)
            ;
            (questEntry._uiCompleteNpc):SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_QUESTCOMPLETENPC"))
            ;
            (questEntry._uiCompleteNpc):SetFontColor((Defines.Color).C_FFF26A6A)
          else
            if uiQuestInfo:getQuestType() > 0 then
              (questEntry._uiQuestIcon):AddEffect("UI_Quest_Complete_GreenAura", true, 130, 0)
              ;
              (questEntry._uiCompleteNpc):SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_QUESTCOMPLETENPC"))
              ;
              (questEntry._uiCompleteNpc):SetFontColor((Defines.Color).C_FFF26A6A)
            end
          end
          ;
          (questEntry._uiCompleteNpc):SetLineRender(true)
          ;
          (questEntry._uiCompleteNpc):SetIgnore(true)
          ;
          (questEntry._uiCompleteNpc):SetShow(true)
          if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
            (questEntry._uiCompleteNpc):SetPosX(10)
          else
            ;
            (questEntry._uiCompleteNpc):SetPosX(25)
          end
          ;
          (questEntry._uiCompleteNpc):SetPosY(PosY)
          FGlobal_ChangeOnTextureForDialogQuestIcon(questEntry._uiQuestIcon, 8)
          PosY = PosY + (questEntry._uiCompleteNpc):GetSizeY() + 3
          FGlobal_QuestWidget_AutoReleaseNavi(uiQuestInfo)
          return PosY
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setButtons = function(self, index, uiQuestInfo)
  -- function num : 0_8
  if index < self._maxVisibleCnt then
    local questEntry = (self._uiList)[index]
    local questNo = uiQuestInfo:getQuestNo()
    local isMouseOnGroup = self:isHitTestInLatestQuestGroup(questEntry._uiGroupBG)
    self:setSizeConvenienceButtons(index, isMouseOnGroup)
    self:refreshNaviButtonCheckState(index, questNo)
    local autoNaviTooltipPos = (questEntry._uiGroupBG):GetPosY() + (questEntry._uiAutoNaviBtn):GetPosY()
    local naviTooltipPos = (questEntry._uiGroupBG):GetPosY() + (questEntry._uiNaviBtn):GetPosY()
    local giveupTooltipPos = (questEntry._uiGroupBG):GetPosY() + (questEntry._uiGiveupBtn):GetPosY()
    local checkCondition = nil
    if uiQuestInfo:isSatisfied() == true then
      checkCondition = 0
    else
      checkCondition = 1
    end
    local questStaticStatus = questList_getQuestStatic((uiQuestInfo:getQuestNo())._group, (uiQuestInfo:getQuestNo())._quest)
    local posCount = questStaticStatus:getQuestPositionCount()
    local isCleared = uiQuestInfo._isCleared
    local enableNavi = true
    if uiQuestInfo:isSatisfied() == false and posCount == 0 then
      enableNavi = false
    end
    local isMouseOn = FGlobal_QuestWidget_IsMouseOn()
    if enableNavi == true then
      (questEntry._uiAutoNaviBtn):SetShow(isMouseOn)
      ;
      (questEntry._uiNaviBtn):SetShow(isMouseOn)
    end
    ;
    (questEntry._uiAutoNaviBtn):SetEnable(enableNavi)
    ;
    (questEntry._uiNaviBtn):SetEnable(enableNavi)
    local selfLevel = ((getSelfPlayer()):get()):getLevel()
    local enableGiveup = (selfLevel > 10 and not isCleared)
    ;
    (questEntry._uiGiveupBtn):SetEnable(enableGiveup)
    if enableGiveup == true then
      (questEntry._uiGiveupBtn):SetShow(isMouseOn)
    end
    ;
    (questEntry._uiAutoNaviBtn):addInputEvent("Mouse_On", "HandleMouseOver_LatestQuestGroupButtons( true," .. autoNaviTooltipPos .. ", \"autoNavi\", " .. index .. "  )")
    ;
    (questEntry._uiAutoNaviBtn):addInputEvent("Mouse_Out", "HandleMouseOver_LatestQuestGroupButtons( false," .. autoNaviTooltipPos .. ", \"autoNavi\", " .. index .. "  )")
    ;
    (questEntry._uiNaviBtn):addInputEvent("Mouse_On", "HandleMouseOver_LatestQuestGroupButtons( true," .. naviTooltipPos .. ", \"navi\", " .. index .. "  )")
    ;
    (questEntry._uiNaviBtn):addInputEvent("Mouse_Out", "HandleMouseOver_LatestQuestGroupButtons( false," .. naviTooltipPos .. ", \"navi\", " .. index .. "  )")
    ;
    (questEntry._uiGiveupBtn):addInputEvent("Mouse_On", "HandleMouseOver_LatestQuestGroupButtons( true," .. giveupTooltipPos .. ", \"giveup\", " .. index .. "  )")
    ;
    (questEntry._uiGiveupBtn):addInputEvent("Mouse_Out", "HandleMouseOver_LatestQuestGroupButtons( false," .. giveupTooltipPos .. ", \"giveup\", " .. index .. "  )")
    ;
    (questEntry._uiNaviBtn):addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_FindTarget( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", false )")
    ;
    (questEntry._uiAutoNaviBtn):addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_FindTarget( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", true )")
    ;
    (questEntry._uiGiveupBtn):addInputEvent("Mouse_LUp", "HandleClicked_QuestWidget_QuestGiveUp( " .. questNo._group .. ", " .. questNo._quest .. ") ")
    if uiQuestInfo:isSatisfied() == true and uiQuestInfo:isCompleteBlackSpirit() then
      (questEntry._uiGroupBG):addInputEvent("Mouse_RUp", "HandleClicked_CallBlackSpirit()")
      ;
      (questEntry._uiAutoNaviBtn):addInputEvent("Mouse_LUp", "HandleClicked_CallBlackSpirit()")
      ;
      (questEntry._uiNaviBtn):addInputEvent("Mouse_LUp", "HandleClicked_CallBlackSpirit()")
    end
  end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.refreshNaviButtonCheckState = function(self, index, questNo)
  -- function num : 0_9
  if index < self._maxVisibleCnt then
    local questEntry = (self._uiList)[index]
    local questGroup, questId, naviInfoAgain = FGlobal_QuestWidget_GetSelectedNaviInfo()
    if questGroup == questNo._group and questId == questNo._quest then
      if naviInfoAgain == true then
        (questEntry._uiSelectBG):SetShow(false)
        ;
        (questEntry._uiAutoNaviBtn):SetCheck(false)
        ;
        (questEntry._uiNaviBtn):SetCheck(false)
      else
        ;
        (questEntry._uiSelectBG):SetShow(true)
        if (questEntry._uiAutoNaviBtn):IsCheck() == true then
          (questEntry._uiAutoNaviBtn):SetCheck(true)
          ;
          (questEntry._uiNaviBtn):SetCheck(true)
        else
          ;
          (questEntry._uiAutoNaviBtn):SetCheck(false)
          ;
          (questEntry._uiNaviBtn):SetCheck(true)
        end
      end
    else
      ;
      (questEntry._uiSelectBG):SetShow(false)
      ;
      (questEntry._uiAutoNaviBtn):SetCheck(false)
      ;
      (questEntry._uiNaviBtn):SetCheck(false)
    end
  end
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.isHitTestInLatestQuestGroup = function(self, control)
  -- function num : 0_10
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  local panelPosX = Panel_CheckedQuest:GetPosX()
  local panelPosY = Panel_CheckedQuest:GetPosY()
  local bgPosX = panelPosX + (self._uiLatestGroup):GetPosX() + control:GetPosX()
  local bgPosY = panelPosY + (self._uiLatestGroup):GetPosY() + control:GetPosY()
  local bgSizeX = control:GetSizeX() - 3
  local bgSizeY = control:GetSizeY() - 3
  if bgPosX <= mousePosX and mousePosX <= bgPosX + bgSizeX and bgPosY <= mousePosY and mousePosY <= bgPosY + bgSizeY then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setSizeConvenienceButtons = function(self, index, isMouseOver)
  -- function num : 0_11
  if index < self._maxVisibleCnt then
    local questEntry = (self._uiList)[index]
    ;
    (questEntry._uiAutoNaviBtn):SetPosY(5)
    ;
    (questEntry._uiNaviBtn):SetPosY(5)
    ;
    (questEntry._uiGiveupBtn):SetPosY(5)
    if isMouseOver == true then
      (questEntry._uiAutoNaviBtn):SetPosX(262)
      ;
      (questEntry._uiNaviBtn):SetPosX(237)
      ;
      (questEntry._uiGiveupBtn):SetPosX(212)
      ;
      (questEntry._uiAutoNaviBtn):SetSize(25, 25)
      ;
      (questEntry._uiNaviBtn):SetSize(25, 25)
      ;
      (questEntry._uiGiveupBtn):SetSize(25, 25)
    else
      ;
      (questEntry._uiAutoNaviBtn):SetPosX(265)
      ;
      (questEntry._uiNaviBtn):SetPosX(245)
      ;
      (questEntry._uiGiveupBtn):SetPosX(225)
      ;
      (questEntry._uiAutoNaviBtn):SetSize(18, 18)
      ;
      (questEntry._uiNaviBtn):SetSize(18, 18)
      ;
      (questEntry._uiGiveupBtn):SetSize(18, 18)
    end
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.getTitle = function(self, groupId, questId)
  -- function num : 0_12
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

-- DECOMPILER ERROR at PC77: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.clearAll = function(self)
  -- function num : 0_13
  for ii = 0, self._maxVisibleCnt - 1 do
    (((self._uiList)[ii])._uiGroupBG):SetShow(false)
    ;
    (((self._uiList)[ii])._uiSelectBG):SetShow(false)
    ;
    (((self._uiList)[ii])._uiQuestTitle):SetShow(false)
    ;
    (((self._uiList)[ii])._uiGroupTitle):SetShow(false)
    ;
    (((self._uiList)[ii])._uiQuestIcon):SetShow(false)
    ;
    (((self._uiList)[ii])._uiCompleteNpc):SetShow(false)
    ;
    (((self._uiList)[ii])._uiAutoNaviBtn):SetShow(false)
    ;
    (((self._uiList)[ii])._uiNaviBtn):SetShow(false)
    ;
    (((self._uiList)[ii])._uiGiveupBtn):SetShow(false)
    for jj = 0, self._maxConditionCnt - 1 do
      ((((self._uiList)[ii])._uiConditions)[jj]):SetShow(false)
    end
  end
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setTooltipPos = function(self, posY, idx)
  -- function num : 0_14
  local questEntry = (self._uiList)[idx]
  local uiTooltip = self._uiTooltip
  local screenY = getScreenSizeY()
  local panelPosY = Panel_CheckedQuest:GetPosY()
  local tooltipSizeY = uiTooltip:GetSizeY()
  local buttonSizeY = (questEntry._uiAutoNaviBtn):GetSizeY()
  if screenY < panelPosY + posY + tooltipSizeY then
    uiTooltip:SetPosY(posY - tooltipSizeY - 5)
  else
    uiTooltip:SetPosY(posY + buttonSizeY + 5)
  end
  uiTooltip:SetPosX(Panel_CheckedQuest:GetSizeX() - uiTooltip:GetSizeX() + 5)
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setVisibleConvenienceButtonGroup = function(self, show)
  -- function num : 0_15
  for ii = 0, self._maxVisibleCnt - 1 do
    self:setVisibleConvenienceButtons(ii, show)
  end
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setVisibleConvenienceButtons = function(self, idx, show)
  -- function num : 0_16
  if idx < self._maxVisibleCnt then
    if show == true then
      local isMouseOn = FGlobal_QuestWidget_IsMouseOn()
      if (((self._uiList)[idx])._uiAutoNaviBtn):IsEnable() then
        (((self._uiList)[idx])._uiAutoNaviBtn):SetShow(isMouseOn)
        ;
        (((self._uiList)[idx])._uiNaviBtn):SetShow(isMouseOn)
      end
      local selfLevel = ((getSelfPlayer()):get()):getLevel()
      if selfLevel > 10 then
        (((self._uiList)[idx])._uiGiveupBtn):SetShow(isMouseOn)
      end
    else
      do
        ;
        (((self._uiList)[idx])._uiAutoNaviBtn):SetShow(false)
        ;
        (((self._uiList)[idx])._uiNaviBtn):SetShow(false)
        ;
        (((self._uiList)[idx])._uiGiveupBtn):SetShow(false)
      end
    end
  end
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.setWidgetMouseOver = function(self, isMouseOver)
  -- function num : 0_17
  FGlobal_QuestWidget_MouseOver(isMouseOver)
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.getLatestGroupPosX = function(self)
  -- function num : 0_18
  return (self._uiLatestGroup):GetPosX()
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.getLatestGroupPosY = function(self)
  -- function num : 0_19
  return (self._uiLatestGroup):GetPosY()
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.getLatestGroupSizeX = function(self)
  -- function num : 0_20
  return (self._uiLatestGroup):GetSizeX()
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.getLatestGroupSizeY = function(self)
  -- function num : 0_21
  if (self._uiLatestGroup):GetShow() == false then
    return 5
  end
  return (self._uiLatestGroup):GetSizeY()
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_LatestQuest.findShownIndexInLatestQuest = function(self, questGroupNo, questId)
  -- function num : 0_22
  local uiIndex = -1
  local latestQuestShowCount = FGlobal_CheckedQuestOptionPanel_GetLatestQuestShowCount()
  if latestQuestShowCount == 0 then
    return -1
  end
  for ii = 0, self._maxVisibleCnt - 1 do
    local questNo = ((self._uiList)[ii])._questNo
    if questNo._groupId == questGroupNo and questNo._questId == questId then
      uiIndex = ii
      break
    end
  end
  do
    if uiIndex <= latestQuestShowCount then
      return uiIndex
    end
    return -1
  end
end

HandleMouseOver_QuestGroup = function(isMouseOver, index, groupId, questId)
  -- function num : 0_23
  if index < PaGlobal_LatestQuest._maxVisibleCnt then
    local questEntry = (PaGlobal_LatestQuest._uiList)[index]
    if isMouseOver == true then
      (questEntry._uiSelectBG):SetShow(true)
      PaGlobal_LatestQuest:setSizeConvenienceButtons(index, true)
      FGlobal_QuestWidget_MouseOver(true)
    else
      if not (questEntry._uiAutoNaviBtn):IsCheck() then
        local isCheckedNaviBtn = (questEntry._uiNaviBtn):IsCheck()
      end
      if isCheckedNaviBtn == false then
        (questEntry._uiSelectBG):SetShow(false)
      end
      if PaGlobal_LatestQuest:isHitTestInLatestQuestGroup(questEntry._uiGroupBG) == true then
        return 
      end
      PaGlobal_LatestQuest:setSizeConvenienceButtons(index, false)
      FGlobal_QuestWidget_MouseOver(false)
    end
  end
end

HandleMouseOver_LatestQuestGroupButtons = function(isMouseOver, posY, target, index)
  -- function num : 0_24
  local uiTooltip = PaGlobal_LatestQuest._uiTooltip
  if isMouseOver == true then
    if target == "navi" then
      uiTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_NAVITOOLTIP"))
    else
      if target == "autoNavi" then
        uiTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_AUTONAVITOOLTIP"))
      else
        if target == "giveup" then
          uiTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GIVEUPTOOLTIP"))
        end
      end
    end
    PaGlobal_LatestQuest:setTooltipPos(posY, index)
    uiTooltip:SetShow(true)
  else
    uiTooltip:SetShow(false)
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_LatestQuest")
registerEvent("FromClient_ChangeLatestQuestShowCount", "FromClient_ChangeLatestQuestShowCount")
FGlobal_LatestQuest_UpdateList = function()
  -- function num : 0_25
  PaGlobal_LatestQuest:update()
end

FGlobal_ChangeLatestQuestShowCount = function()
  -- function num : 0_26
  PaGlobal_LatestQuest:update()
  FromClient_QuestWidget_Update(false)
end

FGlobal_LatestQuestWidget_MouseOver = function(isMouseOver)
  -- function num : 0_27
  PaGlobal_LatestQuest:setVisibleConvenienceButtonGroup(isMouseOver)
end

FromClient_ChangeLatestQuestShowCount = function()
  -- function num : 0_28
  FGlobal_ChangeLatestQuestShowCount()
end

FromClient_luaLoadComplete_LatestQuest = function()
  -- function num : 0_29
end

local viewCount = PaGlobal_LatestQuest._maxVisibleCnt

