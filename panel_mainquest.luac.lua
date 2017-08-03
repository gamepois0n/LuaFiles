-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\questlist\panel_mainquest.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UIMode = Defines.UIMode
local IM = CppEnums.EProcessorInputMode
local nextGroupPosY = 0
local isMouseOnWidget = false
local questNo = {_groupId = 0, _questId = 0}
Panel_MainQuest:SetShow(true, false)
Panel_MainQuest:setGlassBackground(true)
Panel_MainQuest:SetDragEnable(false)
PaGlobal_MainQuest = {_uiGroupBG = (UI.getChildControl)(Panel_MainQuest, "Static_GroupBG"), _uiQuestCompleteNpc = (UI.getChildControl)(Panel_MainQuest, "StaticText_Quest_ClearNpc"), _uiQuestGroupTitle = (UI.getChildControl)(Panel_MainQuest, "StaticText_WidgetGroupTitle"), _uiQuestTypeIcon = (UI.getChildControl)(Panel_MainQuest, "Static_Quest_Type"), _uiQuestTitle = (UI.getChildControl)(Panel_MainQuest, "StaticText_Quest_Title"), _uiAutoNaviBtn = (UI.getChildControl)(Panel_MainQuest, "CheckButton_AutoNavi"), _uiNaviBtn = (UI.getChildControl)(Panel_MainQuest, "Checkbox_Quest_Navi"), _uiQuestClearIcon = (UI.getChildControl)(Panel_MainQuest, "Static_Quest_Icon_ClearCheck"), _uiQuestTopDeco = (UI.getChildControl)(Panel_MainQuest, "Static_TopDeco"), _uiQuestBottomDeco = (UI.getChildControl)(Panel_MainQuest, "Static_BottomDeco"), _uiTooltip = (UI.getChildControl)(Panel_MainQuest, "StaticText_Notice_1"), _uiQuestConditions = (Array.new)(), _maxConditionCnt = 5, _closeableLevel = 50}
-- DECOMPILER ERROR at PC109: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.initialize = function(self)
  -- function num : 0_0 , upvalues : UI_color
  local uiCondition = (UI.getChildControl)(Panel_MainQuest, "StaticText_Quest_Demand")
  uiCondition:SetShow(false)
  for ii = 0, self._maxConditionCnt - 1 do
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R6 in 'UnsetPending'

    (self._uiQuestConditions)[ii] = (UI.createAndCopyBasePropertyControl)(Panel_MainQuest, "StaticText_Quest_Demand", Panel_MainQuest, "uiConditions_" .. ii)
    ;
    ((self._uiQuestConditions)[ii]):SetShow(false)
    ;
    ((self._uiQuestConditions)[ii]):SetText("")
    ;
    ((self._uiQuestConditions)[ii]):SetIgnore(true)
  end
  ;
  (self._uiQuestTopDeco):SetIgnore(true)
  ;
  (self._uiQuestTitle):SetIgnore(true)
  ;
  (self._uiQuestBottomDeco):SetIgnore(true)
  ;
  (self._uiQuestCompleteNpc):SetIgnore(true)
  ;
  (self._uiQuestGroupTitle):SetIgnore(true)
  Panel_MainQuest:SetChildIndex(self._uiAutoNaviBtn, 9999)
  Panel_MainQuest:SetChildIndex(self._uiNaviBtn, 9999)
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
  Panel_MainQuest:SetSize(Panel_MainQuest:GetSizeX(), 60)
  ;
  (self._uiQuestTopDeco):ComputePos()
  ;
  (self._uiQuestBottomDeco):ComputePos()
  self:subscribeDefaultHandler()
  self:clearAll()
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.subscribeDefaultHandler = function(self)
  -- function num : 0_1
  (self._uiAutoNaviBtn):addInputEvent("Mouse_On", "HandleMouseOver_Buttons( true, \"Autonavi\" )")
  ;
  (self._uiAutoNaviBtn):addInputEvent("Mouse_Out", "HandleMouseOver_Buttons( false, \"Autonavi\" )")
  ;
  (self._uiNaviBtn):addInputEvent("Mouse_On", "HandleMouseOver_Buttons( true, \"navi\" )")
  ;
  (self._uiNaviBtn):addInputEvent("Mouse_Out", "HandleMouseOver_Buttons( false, \"navi\")")
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.update = function(self)
  -- function num : 0_2
  local questList = ToClient_GetQuestList()
  if questList:isMainQuestClearAll() == true then
    self:CloseMainQuest()
    return 
  end
  self:clearAll()
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo ~= nil then
    self:setIconInfo(uiQuestInfo)
    self:setQuestTitleInfo(uiQuestInfo)
    local startPosY = self:setQuestGroupTitleInfo(uiQuestInfo)
    self:setConditionInfo(uiQuestInfo, startPosY)
    self:setButtonCheckState(uiQuestInfo)
  end
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.OpenMainQuest = function(self)
  -- function num : 0_3
  Panel_MainQuest:SetShow(true, true)
  PaGlobal_MainQuest:update()
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.CloseMainQuest = function(self)
  -- function num : 0_4
  Panel_MainQuest:SetShow(false)
  self:clearAll()
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.clearAll = function(self)
  -- function num : 0_5
  (self._uiQuestCompleteNpc):SetShow(false)
  ;
  (self._uiQuestGroupTitle):SetShow(false)
  ;
  (self._uiQuestTypeIcon):SetShow(false)
  ;
  (self._uiQuestTitle):SetShow(false)
  ;
  (self._uiQuestClearIcon):SetShow(false)
  ;
  (self._uiAutoNaviBtn):SetShow(false)
  ;
  (self._uiNaviBtn):SetShow(false)
  ;
  (self._uiQuestCompleteNpc):SetText("")
  ;
  (self._uiQuestGroupTitle):SetText("")
  ;
  (self._uiQuestTitle):SetText("")
  self:clearConditionInfo()
end

-- DECOMPILER ERROR at PC128: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.setQuestGroupTitleInfo = function(self, uiQuestInfo)
  -- function num : 0_6 , upvalues : UI_color
  local startPosY = (self._uiQuestTitle):GetPosY() + (self._uiQuestTitle):GetSizeY() + 3
  if uiQuestInfo:isSatisfied() or not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
    return startPosY
  end
  local questNo = uiQuestInfo:getQuestNo()
  local questListInfo = ToClient_GetQuestList()
  local uiQuestGroupInfo = questListInfo:getQuestGroup(questNo)
  if uiQuestGroupInfo ~= nil and uiQuestGroupInfo:isGroupQuest() then
    local groupTitle = uiQuestGroupInfo:getTitle()
    local questGroupCount = uiQuestGroupInfo:getTotalQuestCount()
    local groupQuestTitleInfo = groupTitle .. " (" .. questNo._quest .. "/" .. questGroupCount .. ")"
    ;
    (self._uiQuestGroupTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GROUPTITLEINFO", "titleinfo", groupQuestTitleInfo))
    ;
    (self._uiQuestGroupTitle):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
    ;
    (self._uiQuestGroupTitle):SetSize(230, (self._uiQuestTitle):GetSizeY())
    ;
    (self._uiQuestGroupTitle):SetPosX(25)
    ;
    (self._uiQuestGroupTitle):SetPosY((self._uiQuestTitle):GetPosY() + (self._uiQuestTitle):GetSizeY() + 5)
    ;
    (self._uiQuestGroupTitle):SetFontColor(UI_color.C_FFEDE699)
    ;
    (self._uiQuestGroupTitle):SetAutoResize(true)
    ;
    (self._uiQuestGroupTitle):SetIgnore(true)
    ;
    (self._uiQuestGroupTitle):SetShow(true)
    startPosY = startPosY + (self._uiQuestTitle):GetSizeY() + 3
  end
  do
    return startPosY
  end
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.setQuestTitleInfo = function(self, uiQuestInfo)
  -- function num : 0_7 , upvalues : UI_color, isMouseOnWidget
  local questTitle = self:getQuestTitle(uiQuestInfo)
  local isAccepted = 1
  if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
    isAccepted = 0
  end
  ;
  (self._uiQuestTitle):SetAutoResize(true)
  ;
  (self._uiQuestTitle):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  ;
  (self._uiQuestTitle):SetSize(200, (self._uiQuestTitle):GetSizeY())
  if isAccepted == 0 then
    (self._uiQuestTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_NOTACCEPTTITLE", "title", questTitle))
  else
    ;
    (self._uiQuestTitle):SetText(questTitle)
  end
  ;
  (self._uiQuestTitle):SetLineRender(false)
  ;
  (self._uiQuestTitle):SetShow(true)
  ;
  (self._uiQuestTitle):SetIgnore(true)
  ;
  (self._uiQuestTitle):SetFontColor(UI_color.C_FFEFEFEF)
  ;
  (self._uiQuestTitle):useGlowFont(true, "BaseFont_8_Glow", 4287655978)
  local questNo = uiQuestInfo:getQuestNo()
  local questStaticStatus = (questList_getQuestStatic(questNo._group, questNo._quest))
  local checkCondition = nil
  if uiQuestInfo:isSatisfied() == true then
    checkCondition = QuestConditionCheckType.eQuestConditionCheckType_Complete
  else
    if isAccepted == 0 then
      checkCondition = QuestConditionCheckType.eQuestConditionCheckType_NotAccept
    else
      checkCondition = QuestConditionCheckType.eQuestConditionCheckType_Progress
    end
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
  (self._uiGroupBG):addInputEvent("Mouse_LUp", "HandleClicked_ShowMainQuestDetail( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", \"" .. groupTitle .. "\", " .. questGroupCnt .. " )")
  ;
  (self._uiGroupBG):addInputEvent("Mouse_RUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", false ," .. isAccepted .. ", \"GroupBG\" )")
  ;
  (self._uiNaviBtn):addInputEvent("Mouse_LUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", false ," .. isAccepted .. ", \"Navi\" )")
  ;
  (self._uiAutoNaviBtn):addInputEvent("Mouse_LUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", true ," .. isAccepted .. ", \"AutoNavi\" )")
  Panel_MainQuest:addInputEvent("Mouse_On", "HandleMouseOver_MainQuestWidget( true," .. isAccepted .. ")")
  Panel_MainQuest:addInputEvent("Mouse_Out", "HandleMouseOver_MainQuestWidget( false," .. isAccepted .. ")")
  ;
  (self._uiGroupBG):addInputEvent("Mouse_On", "HandleMouseOver_MainQuestWidget( true," .. isAccepted .. ")")
  ;
  (self._uiGroupBG):addInputEvent("Mouse_Out", "HandleMouseOver_MainQuestWidget( false," .. isAccepted .. ")")
  local posCount = questStaticStatus:getQuestPositionCount()
  do
    local enable = uiQuestInfo:isSatisfied() == false and posCount ~= 0
    enable = true
    ;
    (self._uiAutoNaviBtn):SetShow(isMouseOnWidget)
    ;
    (self._uiNaviBtn):SetShow(isMouseOnWidget)
    ;
    (self._uiAutoNaviBtn):SetEnable(enable)
    ;
    (self._uiNaviBtn):SetEnable(enable)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC136: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.getQuestTitle = function(self, uiQuestInfo)
  -- function num : 0_8
  local questTitle = uiQuestInfo:getTitle()
  local recommandLevel = uiQuestInfo:getRecommendLevel()
  if recommandLevel ~= nil and recommandLevel ~= 0 then
    questTitle = "[" .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. recommandLevel .. "] " .. questTitle
  end
  return questTitle
end

-- DECOMPILER ERROR at PC139: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.setIconInfo = function(self, uiQuestInfo)
  -- function num : 0_9
  (self._uiQuestTypeIcon):EraseAllEffect()
  ;
  (self._uiQuestTypeIcon):SetShow(true)
  ;
  (self._uiQuestTypeIcon):SetIgnore(true)
  FGlobal_ChangeOnTextureForDialogQuestIcon(self._uiQuestTypeIcon, uiQuestInfo:getQuestType())
end

-- DECOMPILER ERROR at PC143: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.setConditionInfo = function(self, uiQuestInfo, startPosY)
  -- function num : 0_10 , upvalues : UI_color
  PaGlobal_MainQuest:clearConditionInfo()
  local checkCondition = nil
  if uiQuestInfo:isSatisfied() == true then
    checkCondition = 0
  else
    checkCondition = 1
  end
  local uiQuestCondition = nil
  if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
    (self._uiQuestCompleteNpc):SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_MAINQUEST_ACCEPT_NOTICE"))
    ;
    (self._uiQuestCompleteNpc):SetFontColor((Defines.Color).C_FFC4BEBE)
    ;
    (self._uiQuestCompleteNpc):SetShow(true)
    startPosY = startPosY + (self._uiQuestCompleteNpc):GetSizeY() + 2
  else
    if checkCondition == 1 then
      for conditionIndex = 0, uiQuestInfo:getDemandCount() - 1 do
        local conditionInfo = uiQuestInfo:getDemandAt(conditionIndex)
        uiQuestCondition = (self._uiQuestConditions)[conditionIndex]
        uiQuestCondition:SetAutoResize(true)
        uiQuestCondition:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
        uiQuestCondition:SetFontColor(UI_color.C_FFC4BEBE)
        uiQuestCondition:SetPosX(25)
        uiQuestCondition:SetPosY(startPosY)
        uiQuestCondition:SetSize((self._uiGroupBG):GetSizeX() - uiQuestCondition:GetPosX(), uiQuestCondition:GetTextSizeY())
        local conditionText = nil
        if conditionInfo._currentCount == conditionInfo._destCount or conditionInfo._destCount <= conditionInfo._currentCount then
          conditionText = "- " .. conditionInfo._desc .. " (" .. PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST_COMPLETE") .. ")"
          uiQuestCondition:SetText(conditionText)
          uiQuestCondition:SetLineRender(true)
          uiQuestCondition:SetFontColor(UI_color.C_FF626262)
        else
          if conditionInfo._destCount == 1 then
            conditionText = "- " .. conditionInfo._desc
            uiQuestCondition:SetText(conditionText)
            uiQuestCondition:SetLineRender(false)
          else
            conditionText = "- " .. conditionInfo._desc .. " (" .. conditionInfo._currentCount .. "/" .. conditionInfo._destCount .. ")"
            uiQuestCondition:SetText(conditionText)
            uiQuestCondition:SetLineRender(false)
          end
        end
        uiQuestCondition:SetShow(true)
        uiQuestCondition:SetIgnore(true)
        startPosY = startPosY + uiQuestCondition:GetSizeY() + 2
      end
    else
      do
        if checkCondition == 0 then
          if uiQuestInfo:getQuestType() == 0 then
            (self._uiQuestTypeIcon):AddEffect("UI_Quest_Complete_GoldAura", true, 130, 0)
          else
            if uiQuestInfo:getQuestType() > 0 then
              (self._uiQuestTypeIcon):AddEffect("UI_Quest_Complete_GreenAura", true, 130, 0)
            end
          end
          ;
          (self._uiQuestCompleteNpc):SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_QUESTCOMPLETENPC"))
          ;
          (self._uiQuestCompleteNpc):SetFontColor((Defines.Color).C_FFF26A6A)
          ;
          (self._uiQuestCompleteNpc):SetShow(true)
          FGlobal_ChangeOnTextureForDialogQuestIcon(self._uiQuestTypeIcon, 8)
          startPosY = startPosY + (self._uiQuestCompleteNpc):GetSizeY() + 2
          FGlobal_QuestWidget_AutoReleaseNavi(uiQuestInfo)
        end
        Panel_MainQuest:SetSize(Panel_MainQuest:GetSizeX(), startPosY + 10)
        ;
        (self._uiGroupBG):SetSize(Panel_MainQuest:GetSizeX(), startPosY + 10)
        ;
        (self._uiQuestTopDeco):ComputePos()
        ;
        (self._uiQuestBottomDeco):ComputePos()
      end
    end
  end
end

-- DECOMPILER ERROR at PC146: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.setButtonCheckState = function(self, uiQuestInfo)
  -- function num : 0_11
  local questNo = uiQuestInfo:getQuestNo()
  local questGroup, questId, naviInfoAgain = FGlobal_QuestWidget_GetSelectedNaviInfo()
  if questGroup == questNo._group and questId == questNo._quest then
    if naviInfoAgain == true then
      (self._uiGroupBG):SetShow(false)
      ;
      (self._uiAutoNaviBtn):SetCheck(false)
      ;
      (self._uiNaviBtn):SetCheck(false)
    else
      ;
      (self._uiGroupBG):SetShow(true)
      if (self._uiAutoNaviBtn):IsCheck() == true then
        (self._uiAutoNaviBtn):SetCheck(true)
        ;
        (self._uiNaviBtn):SetCheck(true)
      else
        ;
        (self._uiAutoNaviBtn):SetCheck(false)
        ;
        (self._uiNaviBtn):SetCheck(true)
      end
    end
  else
    ;
    (self._uiGroupBG):SetShow(false)
    ;
    (self._uiAutoNaviBtn):SetCheck(false)
    ;
    (self._uiNaviBtn):SetCheck(false)
  end
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.setButtonState = function(self, isMouseOver)
  -- function num : 0_12
  (self._uiAutoNaviBtn):SetPosY(5)
  ;
  (self._uiNaviBtn):SetPosY(5)
  if isMouseOver == true then
    (self._uiAutoNaviBtn):SetPosX(263)
    ;
    (self._uiNaviBtn):SetPosX(238)
    ;
    (self._uiAutoNaviBtn):SetSize(25, 25)
    ;
    (self._uiNaviBtn):SetSize(25, 25)
  else
    ;
    (self._uiAutoNaviBtn):SetPosX(268)
    ;
    (self._uiNaviBtn):SetPosX(248)
    ;
    (self._uiAutoNaviBtn):SetSize(18, 18)
    ;
    (self._uiNaviBtn):SetSize(18, 18)
  end
end

HandleClicked_ShowMainQuestDetail = function(groupId, questId, checkCondition, groupTitle, questGroupCount)
  -- function num : 0_13
  local fromQuestWidget = true
  FGlobal_QuestWindow_SetProgress()
  FGlobal_QuestInfoDetail(groupId, questId, checkCondition, groupTitle, questGroupCount, true)
  audioPostEvent_SystemUi(0, 0)
end

HandleClicked_MainQuest_FindWay = function(gruopNo, questNo, questCondition, isAuto, checkAcceptable, control)
  -- function num : 0_14
  do
    if checkAcceptable == 0 then
      local isAcceptable = questList_isAcceptableQuest(gruopNo, questNo)
      if isAcceptable == false then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MAINQUEST_CHECH_CONDITION_NOTICE"))
        return 
      end
    end
    HandleClicked_QuestWindow_FindWay(gruopNo, questNo, questCondition, isAuto)
  end
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.showAcceptConditionTooltip = function(self, show)
  -- function num : 0_15
  if show == true then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_ACCEPTCONDITION")
    local questList = ToClient_GetQuestList()
    local uiQuestInfo = questList:getMainQuestInfo()
    if uiQuestInfo ~= nil then
      local desc = uiQuestInfo:getAcceptConditionText()
      registTooltipControl(Panel_MainQuest, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(Panel_MainQuest, name, desc)
    end
  else
    do
      TooltipSimple_Hide()
    end
  end
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.clearConditionInfo = function(self)
  -- function num : 0_16
  (self._uiQuestCompleteNpc):SetShow(false)
  ;
  (self._uiQuestCompleteNpc):SetText("")
  for ii = 0, self._maxConditionCnt - 1 do
    ((self._uiQuestConditions)[ii]):SetShow(false)
    ;
    ((self._uiQuestConditions)[ii]):SetText("")
  end
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.ShowGroupBG = function(self, show)
  -- function num : 0_17
  if show == true then
    (self._uiGroupBG):SetShow(true)
  else
    ;
    (self._uiGroupBG):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.isHitTest = function(self, control)
  -- function num : 0_18
  local panel = Panel_MainQuest
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  local panelPosX = panel:GetPosX()
  local panelPosY = panel:GetPosY()
  local bgPosX = panelPosX
  local bgPosY = panelPosY
  local bgSizeX = panel:GetSizeX()
  local bgSizeY = panel:GetSizeY()
  if bgPosX <= mousePosX and mousePosX <= bgPosX + bgSizeX and bgPosY <= mousePosY and mousePosY <= bgPosY + bgSizeY then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.setTooltipPos = function(self, posY)
  -- function num : 0_19
  local uiTooltip = PaGlobal_MainQuest._uiTooltip
  local screenY = getScreenSizeY()
  local panelPosY = Panel_MainQuest:GetPosY()
  local tooltipSizeY = uiTooltip:GetSizeY()
  local buttonSizeY = (PaGlobal_MainQuest._uiAutoNaviBtn):GetSizeY()
  if screenY < panelPosY + posY + tooltipSizeY then
    uiTooltip:SetPosY(posY - tooltipSizeY - 5)
  else
    uiTooltip:SetPosY(posY + buttonSizeY + 5)
  end
  uiTooltip:SetPosX(Panel_MainQuest:GetSizeX() - uiTooltip:GetSizeX() + 5)
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_MainQuest.isShownQuest = function(self, questNo)
  -- function num : 0_20
  local questList = ToClient_GetQuestList()
  local uiQuestInfo = questList:getMainQuestInfo()
  if uiQuestInfo ~= nil then
    if (uiQuestInfo:getQuestNo())._group == questNo._group and (uiQuestInfo:getQuestNo())._quest == questNo._quest then
      return true
    else
      return false
    end
  end
  return false
end

FGlobal_MainQuest_Update = function()
  -- function num : 0_21
  PaGlobal_MainQuest:update()
end

HandleMouseOver_Buttons = function(show, target)
  -- function num : 0_22
  Panel_MainQuest:SetChildIndex(PaGlobal_MainQuest._uiTooltip, 9999)
  local uiTooltip = PaGlobal_MainQuest._uiTooltip
  local posY = 0
  if show == true then
    if target == "navi" then
      uiTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_NAVITOOLTIP"))
      posY = (PaGlobal_MainQuest._uiAutoNaviBtn):GetPosY()
    else
      if target == "Autonavi" then
        uiTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_AUTONAVITOOLTIP"))
        posY = (PaGlobal_MainQuest._uiNaviBtn):GetPosY()
      end
    end
    PaGlobal_MainQuest:setTooltipPos(posY)
    uiTooltip:SetShow(true)
  else
    uiTooltip:SetShow(false)
  end
end

HandleMouseOver_MainQuestWidget = function(isMouseOver, isAcceptedQuest)
  -- function num : 0_23 , upvalues : isMouseOnWidget
  if isMouseOver == true then
    PaGlobal_MainQuest:ShowGroupBG(true)
    PaGlobal_MainQuest:setButtonState(true)
    if (PaGlobal_MainQuest._uiAutoNaviBtn):IsEnable() then
      (PaGlobal_MainQuest._uiAutoNaviBtn):SetShow(true)
      ;
      (PaGlobal_MainQuest._uiNaviBtn):SetShow(true)
    end
    isMouseOnWidget = true
  else
    if PaGlobal_MainQuest:isHitTest(PaGlobal_MainQuest._uiGroupBG) == true then
      return 
    end
    if not (PaGlobal_MainQuest._uiAutoNaviBtn):IsCheck() then
      local isSelectedNaviBtn = (PaGlobal_MainQuest._uiNaviBtn):IsCheck()
    end
    if isSelectedNaviBtn == false then
      PaGlobal_MainQuest:ShowGroupBG(false)
    end
    PaGlobal_MainQuest:setButtonState(false)
    ;
    (PaGlobal_MainQuest._uiAutoNaviBtn):SetShow(false)
    ;
    (PaGlobal_MainQuest._uiNaviBtn):SetShow(false)
    isMouseOnWidget = false
  end
  do
    if isAcceptedQuest == 0 then
      PaGlobal_MainQuest:showAcceptConditionTooltip(isMouseOver)
    end
  end
end

registerEvent("onScreenResize", "FromClient_MainQuestWidget_ResetPosition")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_MainQuest")
registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_MainQuest_ResetPosition")
FromClient_luaLoadComplete_MainQuest = function()
  -- function num : 0_24
end

FromClient_MainQuestWidget_ResetPosition = function()
  -- function num : 0_25
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_MainQuest:GetRelativePosX() == -1 and Panel_MainQuest:GetRelativePosY() == -1 then
      local initPosX = getScreenSizeX() - Panel_MainQuest:GetSizeX() - 20
      local initPosY = FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 10
      local haveServerPosition = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0
      if not haveServerPosition then
        Panel_MainQuest:SetPosX(initPosX)
        Panel_MainQuest:SetPosY(initPosY)
      end
      changePositionBySever(Panel_MainQuest, (CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, true, true, true)
      FGlobal_InitPanelRelativePos(Panel_MainQuest, initPosX, initPosY)
    elseif Panel_MainQuest:GetRelativePosX() == 0 and Panel_MainQuest:GetRelativePosY() == 0 then
      Panel_MainQuest:SetPosX(getScreenSizeX() - Panel_MainQuest:GetSizeX() - 20)
      Panel_MainQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 10)
    else
      Panel_MainQuest:SetPosX(getScreenSizeX() * Panel_MainQuest:GetRelativePosX() - Panel_MainQuest:GetSizeX() / 2)
      Panel_MainQuest:SetPosY(getScreenSizeY() * Panel_MainQuest:GetRelativePosY() - Panel_MainQuest:GetSizeY() / 2)
    end
    FGlobal_PanelRepostionbyScreenOut(Panel_MainQuest)
  else
    local haveServerPosition = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0
    if not haveServerPosition then
      Panel_MainQuest:SetPosX(getScreenSizeX() - Panel_MainQuest:GetSizeX() - 20)
      Panel_MainQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 10)
    end
    changePositionBySever(Panel_MainQuest, (CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, true, true, true)
  end
  -- DECOMPILER ERROR: 9 unprocessed JMP targets
end

renderModeChange_Panel_MainQuest_ResetPosition = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_26
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  FromClient_MainQuestWidget_ResetPosition()
end

PaGlobal_MainQuest:initialize()
changePositionBySever(Panel_MainQuest, (CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, true, true, true)

