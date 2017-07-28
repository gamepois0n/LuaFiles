-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\console\panel_console_mainquest.luac 

-- params : ...
-- function num : 0
Panel_Console_MainQuest:SetShow(true, false)
Panel_Console_MainQuest:setGlassBackground(true)
Panel_Console_MainQuest:SetDragEnable(false)
PaGlobal_ConsoleMainQuest = {_staticQuestBg = (UI.getChildControl)(Panel_Console_MainQuest, "Static_GroupBG"), _textQuestTitle = (UI.getChildControl)(Panel_Console_MainQuest, "StaticText_Quest_Title"), _staticEffectComplete = (UI.getChildControl)(Panel_Console_MainQuest, "Static_Eff_Complete_Eff1"), _staticQuestType = (UI.getChildControl)(Panel_Console_MainQuest, "Static_Quest_Type"), _staticQuestClearIcon = (UI.getChildControl)(Panel_Console_MainQuest, "Static_Quest_Icon_ClearCheck"), _textWidgetGroupTitle = (UI.getChildControl)(Panel_Console_MainQuest, "StaticText_WidgetGroupTitle"), _textClearNpc = (UI.getChildControl)(Panel_Console_MainQuest, "StaticText_Quest_ClearNpc"), _checkbuttonAutoNavi = (UI.getChildControl)(Panel_Console_MainQuest, "CheckButton_AutoNavi"), _checkboxQuestNavi = (UI.getChildControl)(Panel_Console_MainQuest, "Checkbox_Quest_Navi"), _checkboxQuestGiveup = (UI.getChildControl)(Panel_Console_MainQuest, "Checkbox_Quest_Giveup"), _textMouseOn = (UI.getChildControl)(Panel_Console_MainQuest, "StaticText_Mouse_On"), _textMouseLeft = (UI.getChildControl)(Panel_Console_MainQuest, "StaticText_Mouse_Left"), _textMouseRight = (UI.getChildControl)(Panel_Console_MainQuest, "StaticText_Mouse_Right"), _staticMouseLeft = (UI.getChildControl)(Panel_Console_MainQuest, "Static_Mouse_Left"), _staticMouseRight = (UI.getChildControl)(Panel_Console_MainQuest, "Static_Mouse_Right"), _statictopDeco = (UI.getChildControl)(Panel_Console_MainQuest, "Static_TopDeco"), _staticbottomDeco = (UI.getChildControl)(Panel_Console_MainQuest, "Static_BottomDeco"), _textQuestTooltip = (UI.getChildControl)(Panel_Console_MainQuest, "StaticText_Notice_1"), _textQuestConditions = (Array.new)(), _maxConditionCnt = 5, _isMouseOnWidget = false}
local UI_color = Defines.Color
-- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.Initialize = function(self)
  -- function num : 0_0 , upvalues : UI_color
  local textdemand = (UI.getChildControl)(Panel_Console_MainQuest, "StaticText_Quest_Demand")
  textdemand:SetShow(false)
  for ii = 0, self._maxConditionCnt - 1 do
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R6 in 'UnsetPending'

    (self._textQuestConditions)[ii] = (UI.createAndCopyBasePropertyControl)(Panel_Console_MainQuest, "StaticText_Quest_Demand", Panel_Console_MainQuest, "StaticText_Quest_Demand_" .. ii)
    ;
    ((self._textQuestConditions)[ii]):SetShow(false)
    ;
    ((self._textQuestConditions)[ii]):SetText("")
    ;
    ((self._textQuestConditions)[ii]):SetIgnore(true)
  end
  ;
  (self._statictopDeco):SetIgnore(true)
  ;
  (self._staticbottomDeco):SetIgnore(true)
  ;
  (self._textQuestTitle):SetIgnore(true)
  ;
  (self._textClearNpc):SetIgnore(true)
  ;
  (self._textWidgetGroupTitle):SetIgnore(true)
  ;
  (self._textQuestTooltip):SetColor(UI_color.C_FFFFFFFF)
  ;
  (self._textQuestTooltip):SetAlpha(1)
  ;
  (self._textQuestTooltip):SetFontColor(UI_color.C_FFC4BEBE)
  ;
  (self._textQuestTooltip):SetAutoResize(true)
  ;
  (self._textQuestTooltip):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._textQuestTooltip):SetShow(false)
  ;
  (self._textQuestTooltip):SetNotAbleMasking(true)
  Panel_Console_MainQuest:SetSize(Panel_Console_MainQuest:GetSizeX(), 60)
  ;
  (self._statictopDeco):ComputePos()
  ;
  (self._staticbottomDeco):ComputePos()
  self:subscribeDefaultHandler()
  self:clearAll()
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.subscribeDefaultHandler = function(self)
  -- function num : 0_1
  (self._checkbuttonAutoNavi):addInputEvent("Mouse_On", "FGlobal_Panel_Console_MainQuest_HandleMouse( true, \"Autonavi\" )")
  ;
  (self._checkbuttonAutoNavi):addInputEvent("Mouse_Out", "FGlobal_Panel_Console_MainQuest_HandleMouse( false, \"Autonavi\" )")
  ;
  (self._checkboxQuestNavi):addInputEvent("Mouse_On", "FGlobal_Panel_Console_MainQuest_HandleMouse( true, \"navi\" )")
  ;
  (self._checkboxQuestNavi):addInputEvent("Mouse_Out", "FGlobal_Panel_Console_MainQuest_HandleMouse( false, \"navi\")")
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.setTooltipPos = function(self, posY)
  -- function num : 0_2
  local uiTooltip = self._textQuestTooltip
  local screenY = getScreenSizeY()
  local panelPosY = Panel_Console_MainQuest:GetPosY()
  local tooltipSizeY = uiTooltip:GetSizeY()
  local buttonSizeY = (self._checkbuttonAutoNavi):GetSizeY()
  if screenY < panelPosY + posY + tooltipSizeY then
    uiTooltip:SetPosY(posY - tooltipSizeY - 5)
  else
    uiTooltip:SetPosY(posY + buttonSizeY + 5)
  end
  uiTooltip:SetPosX(Panel_Console_MainQuest:GetSizeX() - uiTooltip:GetSizeX() + 5)
end

FGlobal_Panel_Console_MainQuest_HandleMouse = function(show, target)
  -- function num : 0_3
  Panel_Console_MainQuest:SetChildIndex(PaGlobal_ConsoleMainQuest._textQuestTooltip, 9999)
  local uiTooltip = PaGlobal_ConsoleMainQuest._textQuestTooltip
  local posY = 0
  if show == true then
    if target == "navi" then
      uiTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_NAVITOOLTIP"))
      posY = (PaGlobal_ConsoleMainQuest._checkboxQuestNavi):GetPosY()
    else
      if target == "Autonavi" then
        uiTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_AUTONAVITOOLTIP"))
        posY = (PaGlobal_ConsoleMainQuest._checkbuttonAutoNavi):GetPosY()
      end
    end
    PaGlobal_ConsoleMainQuest:setTooltipPos(posY)
    uiTooltip:SetShow(true)
  else
    uiTooltip:SetShow(false)
  end
end

-- DECOMPILER ERROR at PC145: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.showAcceptConditionTooltip = function(self, show)
  -- function num : 0_4
  if show == true then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_ACCEPTCONDITION")
    local questList = ToClient_GetQuestList()
    local uiQuestInfo = questList:getMainQuestInfo()
    if uiQuestInfo ~= nil then
      local desc = uiQuestInfo:getAcceptConditionText()
      registTooltipControl(Panel_Console_MainQuest, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(Panel_Console_MainQuest, name, desc)
    end
  else
    do
      TooltipSimple_Hide()
    end
  end
end

-- DECOMPILER ERROR at PC148: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.ShowGroupBG = function(self, show)
  -- function num : 0_5
  if show == true then
    (self._staticQuestBg):SetShow(true)
  else
    ;
    (self._staticQuestBg):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC151: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.setButtonState = function(self, isMouseOver)
  -- function num : 0_6
  (self._checkbuttonAutoNavi):SetPosY(5)
  ;
  (self._checkboxQuestNavi):SetPosY(5)
  if isMouseOver == true then
    (self._checkbuttonAutoNavi):SetPosX(263)
    ;
    (self._checkboxQuestNavi):SetPosX(238)
    ;
    (self._checkbuttonAutoNavi):SetSize(25, 25)
    ;
    (self._checkboxQuestNavi):SetSize(25, 25)
  else
    ;
    (self._checkbuttonAutoNavi):SetPosX(268)
    ;
    (self._checkboxQuestNavi):SetPosX(248)
    ;
    (self._checkbuttonAutoNavi):SetSize(18, 18)
    ;
    (self._checkboxQuestNavi):SetSize(18, 18)
  end
end

-- DECOMPILER ERROR at PC154: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.isHitTest = function(self, control)
  -- function num : 0_7
  local panel = Panel_Console_MainQuest
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

FGlobal_Panel_Console_MainQuest_HandleMouseOver_MainQuestWidget = function(isMouseOver, isAcceptedQuest)
  -- function num : 0_8
  if isMouseOver == true then
    PaGlobal_ConsoleMainQuest:ShowGroupBG(true)
    PaGlobal_ConsoleMainQuest:setButtonState(true)
    if (PaGlobal_ConsoleMainQuest._checkbuttonAutoNavi):IsEnable() then
      (PaGlobal_ConsoleMainQuest._checkbuttonAutoNavi):SetShow(true)
      ;
      (PaGlobal_ConsoleMainQuest._checkboxQuestNavi):SetShow(true)
    end
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

    PaGlobal_ConsoleMainQuest._isMouseOnWidget = true
  else
    if PaGlobal_ConsoleMainQuest:isHitTest(PaGlobal_ConsoleMainQuest._staticQuestBg) == true then
      return 
    end
    if not (PaGlobal_ConsoleMainQuest._checkbuttonAutoNavi):IsCheck() then
      local isSelectedNaviBtn = (PaGlobal_ConsoleMainQuest._checkboxQuestNavi):IsCheck()
    end
    if isSelectedNaviBtn == false then
      PaGlobal_ConsoleMainQuest:ShowGroupBG(false)
    end
    PaGlobal_ConsoleMainQuest:setButtonState(false)
    ;
    (PaGlobal_ConsoleMainQuest._checkbuttonAutoNavi):SetShow(false)
    ;
    (PaGlobal_ConsoleMainQuest._checkboxQuestNavi):SetShow(false)
    -- DECOMPILER ERROR at PC68: Confused about usage of register: R3 in 'UnsetPending'

    PaGlobal_ConsoleMainQuest._isMouseOnWidget = false
  end
  do
    if isAcceptedQuest == 0 then
      PaGlobal_ConsoleMainQuest:showAcceptConditionTooltip(isMouseOver)
    end
  end
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.clearAll = function(self)
  -- function num : 0_9
  (self._textClearNpc):SetShow(false)
  ;
  (self._textWidgetGroupTitle):SetShow(false)
  ;
  (self._staticQuestType):SetShow(false)
  ;
  (self._textQuestTitle):SetShow(false)
  ;
  (self._staticQuestClearIcon):SetShow(false)
  ;
  (self._checkbuttonAutoNavi):SetShow(false)
  ;
  (self._checkboxQuestNavi):SetShow(false)
  ;
  (self._textClearNpc):SetText("")
  ;
  (self._textWidgetGroupTitle):SetText("")
  ;
  (self._textQuestTitle):SetText("")
  self:clearConditionInfo()
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.clearConditionInfo = function(self)
  -- function num : 0_10
  (self._textClearNpc):SetShow(false)
  ;
  (self._textClearNpc):SetText("")
  for ii = 0, self._maxConditionCnt - 1 do
    ((self._textQuestConditions)[ii]):SetShow(false)
    ;
    ((self._textQuestConditions)[ii]):SetText("")
  end
end

FGlobal_Panel_Console_MainQuest_Update = function()
  -- function num : 0_11
  if Panel_Console_MainQuest:GetShow() then
    PaGlobal_ConsoleMainQuest:update()
  end
end

-- DECOMPILER ERROR at PC167: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.update = function(self)
  -- function num : 0_12
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

-- DECOMPILER ERROR at PC170: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.CloseMainQuest = function(self)
  -- function num : 0_13
  Panel_Console_MainQuest:SetShow(false)
  self:clearAll()
end

-- DECOMPILER ERROR at PC173: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.setIconInfo = function(self, uiQuestInfo)
  -- function num : 0_14
  (self._staticQuestType):EraseAllEffect()
  ;
  (self._staticQuestType):SetShow(true)
  ;
  (self._staticQuestType):SetIgnore(true)
  FGlobal_ChangeOnTextureForDialogQuestIcon(self._staticQuestType, uiQuestInfo:getQuestType())
end

-- DECOMPILER ERROR at PC177: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.setQuestTitleInfo = function(self, uiQuestInfo)
  -- function num : 0_15 , upvalues : UI_color
  local questTitle = self:getQuestTitle(uiQuestInfo)
  local isAccepted = 1
  if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
    isAccepted = 0
  end
  ;
  (self._textQuestTitle):SetAutoResize(true)
  ;
  (self._textQuestTitle):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  ;
  (self._textQuestTitle):SetSize(200, (self._textQuestTitle):GetSizeY())
  if isAccepted == 0 then
    (self._textQuestTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_NOTACCEPTTITLE", "title", questTitle))
  else
    ;
    (self._textQuestTitle):SetText(questTitle)
  end
  ;
  (self._textQuestTitle):SetLineRender(false)
  ;
  (self._textQuestTitle):SetShow(true)
  ;
  (self._textQuestTitle):SetIgnore(true)
  ;
  (self._textQuestTitle):SetFontColor(UI_color.C_FFEFEFEF)
  ;
  (self._textQuestTitle):useGlowFont(true, "BaseFont_8_Glow", 4287655978)
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
  (self._staticQuestBg):addInputEvent("Mouse_LUp", "HandleClicked_ShowMainQuestDetail( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", \"" .. groupTitle .. "\", " .. questGroupCnt .. " )")
  ;
  (self._staticQuestBg):addInputEvent("Mouse_RUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", false ," .. isAccepted .. ", \"GroupBG\" )")
  ;
  (self._checkboxQuestNavi):addInputEvent("Mouse_LUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", false ," .. isAccepted .. ", \"Navi\" )")
  ;
  (self._checkbuttonAutoNavi):addInputEvent("Mouse_LUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", true ," .. isAccepted .. ", \"AutoNavi\" )")
  Panel_Console_MainQuest:addInputEvent("Mouse_On", "FGlobal_Panel_Console_MainQuest_HandleMouseOver_MainQuestWidget( true," .. isAccepted .. ")")
  Panel_Console_MainQuest:addInputEvent("Mouse_Out", "FGlobal_Panel_Console_MainQuest_HandleMouseOver_MainQuestWidget( false," .. isAccepted .. ")")
  ;
  (self._staticQuestBg):addInputEvent("Mouse_On", "FGlobal_Panel_Console_MainQuest_HandleMouseOver_MainQuestWidget( true," .. isAccepted .. ")")
  ;
  (self._staticQuestBg):addInputEvent("Mouse_Out", "FGlobal_Panel_Console_MainQuest_HandleMouseOver_MainQuestWidget( false," .. isAccepted .. ")")
  local posCount = questStaticStatus:getQuestPositionCount()
  do
    local enable = uiQuestInfo:isSatisfied() == false and posCount ~= 0
    enable = true
    ;
    (self._checkbuttonAutoNavi):SetShow(self._isMouseOnWidget)
    ;
    (self._checkboxQuestNavi):SetShow(self.isMouseOnWidget)
    ;
    (self._checkbuttonAutoNavi):SetEnable(enable)
    ;
    (self._checkboxQuestNavi):SetEnable(enable)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC180: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.getQuestTitle = function(self, uiQuestInfo)
  -- function num : 0_16
  local questTitle = uiQuestInfo:getTitle()
  local recommandLevel = uiQuestInfo:getRecommendLevel()
  if recommandLevel ~= nil and recommandLevel ~= 0 then
    questTitle = "[" .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. recommandLevel .. "] " .. questTitle
  end
  return questTitle
end

-- DECOMPILER ERROR at PC184: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.setQuestGroupTitleInfo = function(self, uiQuestInfo)
  -- function num : 0_17 , upvalues : UI_color
  local startPosY = (self._textQuestTitle):GetPosY() + (self._textQuestTitle):GetSizeY() + 3
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
    (self._textWidgetGroupTitle):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GROUPTITLEINFO", "titleinfo", groupQuestTitleInfo))
    ;
    (self._textWidgetGroupTitle):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
    ;
    (self._textWidgetGroupTitle):SetSize(230, (self._uiQuestTitle):GetSizeY())
    ;
    (self._textWidgetGroupTitle):SetPosX(25)
    ;
    (self._textWidgetGroupTitle):SetPosY((self._uiQuestTitle):GetPosY() + (self._uiQuestTitle):GetSizeY() + 5)
    ;
    (self._textWidgetGroupTitle):SetFontColor(UI_color.C_FFEDE699)
    ;
    (self._textWidgetGroupTitle):SetAutoResize(true)
    ;
    (self._textWidgetGroupTitle):SetIgnore(true)
    ;
    (self._textWidgetGroupTitle):SetShow(true)
    startPosY = startPosY + (self._textQuestTitle):GetSizeY() + 3
  end
  do
    return startPosY
  end
end

-- DECOMPILER ERROR at PC188: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.setConditionInfo = function(self, uiQuestInfo, startPosY)
  -- function num : 0_18 , upvalues : UI_color
  PaGlobal_ConsoleMainQuest:clearConditionInfo()
  local checkCondition = nil
  if uiQuestInfo:isSatisfied() == true then
    checkCondition = 0
  else
    checkCondition = 1
  end
  local uiQuestCondition = nil
  if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
    (self._textClearNpc):SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_MAINQUEST_ACCEPT_NOTICE"))
    ;
    (self._textClearNpc):SetFontColor((Defines.Color).C_FFC4BEBE)
    ;
    (self._textClearNpc):SetShow(true)
    startPosY = startPosY + (self._textClearNpc):GetSizeY() + 2
  else
    if checkCondition == 1 then
      for conditionIndex = 0, uiQuestInfo:getDemandCount() - 1 do
        local conditionInfo = uiQuestInfo:getDemandAt(conditionIndex)
        uiQuestCondition = (self._textQuestConditions)[conditionIndex]
        uiQuestCondition:SetAutoResize(true)
        uiQuestCondition:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
        uiQuestCondition:SetFontColor(UI_color.C_FFC4BEBE)
        uiQuestCondition:SetPosX(25)
        uiQuestCondition:SetPosY(startPosY)
        uiQuestCondition:SetSize((self._staticQuestBg):GetSizeX() - uiQuestCondition:GetPosX(), uiQuestCondition:GetTextSizeY())
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
            (self._staticQuestType):AddEffect("UI_Quest_Complete_GoldAura", true, 130, 0)
          else
            if uiQuestInfo:getQuestType() > 0 then
              (self._staticQuestType):AddEffect("UI_Quest_Complete_GreenAura", true, 130, 0)
            end
          end
          ;
          (self._uiQuestCompleteNpc):SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_QUESTCOMPLETENPC"))
          ;
          (self._uiQuestCompleteNpc):SetFontColor((Defines.Color).C_FFF26A6A)
          ;
          (self._uiQuestCompleteNpc):SetShow(true)
          FGlobal_ChangeOnTextureForDialogQuestIcon(self._staticQuestType, 8)
          startPosY = startPosY + (self._uiQuestCompleteNpc):GetSizeY() + 2
          FGlobal_QuestWidget_AutoReleaseNavi(uiQuestInfo)
        end
        Panel_Console_MainQuest:SetSize(Panel_Console_MainQuest:GetSizeX(), startPosY + 10)
        ;
        (self._staticQuestBg):SetSize(Panel_Console_MainQuest:GetSizeX(), startPosY + 10)
        ;
        (self._statictopDeco):ComputePos()
        ;
        (self._staticbottomDeco):ComputePos()
      end
    end
  end
end

-- DECOMPILER ERROR at PC191: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.setButtonCheckState = function(self, uiQuestInfo)
  -- function num : 0_19
  local questNo = uiQuestInfo:getQuestNo()
  local questGroup, questId, naviInfoAgain = FGlobal_QuestWidget_GetSelectedNaviInfo()
  if questGroup == questNo._group and questId == questNo._quest then
    if naviInfoAgain == true then
      (self._staticQuestBg):SetShow(false)
      ;
      (self._checkboxQuestNavi):SetCheck(false)
      ;
      (self._checkbuttonAutoNavi):SetCheck(false)
    else
      ;
      (self._staticQuestBg):SetShow(true)
      if (self._checkbuttonAutoNavi):IsCheck() == true then
        (self._checkbuttonAutoNavi):SetCheck(true)
        ;
        (self._checkboxQuestNavi):SetCheck(true)
      else
        ;
        (self._checkbuttonAutoNavi):SetCheck(false)
        ;
        (self._checkboxQuestNavi):SetCheck(true)
      end
    end
  else
    ;
    (self._staticQuestBg):SetShow(false)
    ;
    (self._checkbuttonAutoNavi):SetCheck(false)
    ;
    (self._checkboxQuestNavi):SetCheck(false)
  end
end

-- DECOMPILER ERROR at PC194: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleMainQuest.isShownQuest = function(self, questNo)
  -- function num : 0_20
  if Panel_Console_MainQuest:GetShow() == false then
    return false
  end
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

PaGlobal_ConsoleMainQuest:Initialize()
registerEvent("onScreenResize", "FromClient_MainConsoleQuestWidget_ResetPosition")
registerEvent("FromClient_RenderModeChangeState", "FromClient_MainConsoleQuestWidget_RenderModeChangeState")
FromClient_MainConsoleQuestWidget_ResetPosition = function()
  -- function num : 0_21
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_Console_MainQuest:GetRelativePosX() == -1 and Panel_Console_MainQuest:GetRelativePosY() == -1 then
      local initPosX = getScreenSizeX() - Panel_Console_MainQuest:GetSizeX() - 20
      local initPosY = FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 10
      local haveServerPosition = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0
      if not haveServerPosition then
        Panel_Console_MainQuest:SetPosX(initPosX)
        Panel_Console_MainQuest:SetPosY(initPosY)
      end
      changePositionBySever(Panel_Console_MainQuest, (CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, true, true, true)
      FGlobal_InitPanelRelativePos(Panel_Console_MainQuest, initPosX, initPosY)
    elseif Panel_Console_MainQuest:GetRelativePosX() == 0 and Panel_Console_MainQuest:GetRelativePosY() == 0 then
      Panel_Console_MainQuest:SetPosX(getScreenSizeX() - Panel_Console_MainQuest:GetSizeX() - 20)
      Panel_Console_MainQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 10)
    else
      Panel_Console_MainQuest:SetPosX(getScreenSizeX() * Panel_Console_MainQuest:GetRelativePosX() - Panel_Console_MainQuest:GetSizeX() / 2)
      Panel_Console_MainQuest:SetPosY(getScreenSizeY() * Panel_Console_MainQuest:GetRelativePosY() - Panel_Console_MainQuest:GetSizeY() / 2)
    end
    FGlobal_PanelRepostionbyScreenOut(Panel_Console_MainQuest)
  else
    local haveServerPosition = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0
    if not haveServerPosition then
      Panel_Console_MainQuest:SetPosX(getScreenSizeX() - Panel_Console_MainQuest:GetSizeX() - 20)
      Panel_Console_MainQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 10)
    end
    changePositionBySever(Panel_Console_MainQuest, (CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, true, true, true)
  end
  -- DECOMPILER ERROR: 9 unprocessed JMP targets
end

FromClient_MainConsoleQuestWidget_RenderModeChangeState = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_22
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  FromClient_MainConsoleQuestWidget_ResetPosition()
end


