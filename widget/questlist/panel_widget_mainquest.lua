Panel_MainQuest:SetDragEnable(false)
local mainQuestWidget = {
  _ui = {
    _static_TitleBG = UI.getChildControl(Panel_MainQuest, "Static_TitleBG"),
    _staticText_Quest_Title = UI.getChildControl(Panel_MainQuest, "StaticText_Quest_Title"),
    _static_Eff_Complete_Eff1 = UI.getChildControl(Panel_MainQuest, "Static_Eff_Complete_Eff1"),
    _static_Quest_Type = UI.getChildControl(Panel_MainQuest, "Static_Quest_Type"),
    _staticText_WidgetGroupTitle = UI.getChildControl(Panel_MainQuest, "StaticText_WidgetGroupTitle"),
    _staticText_Quest_ClearNpc = UI.getChildControl(Panel_MainQuest, "StaticText_Quest_ClearNpc"),
    _staticText_Quest_Demand = UI.getChildControl(Panel_MainQuest, "StaticText_Quest_Demand"),
    _checkButton_AutoNavi = UI.getChildControl(Panel_MainQuest, "CheckButton_AutoNavi"),
    _checkbox_Quest_Navi = UI.getChildControl(Panel_MainQuest, "Checkbox_Quest_Navi"),
    _button_Quest_Giveup = UI.getChildControl(Panel_MainQuest, "Checkbox_Quest_Giveup")
  },
  _config = {_maxConditionCount = 5, _closableLevel = 50},
  _uiQuestConditions = {},
  _isButtonOn = false,
  _mainQuestNo = nil,
  _isInitialized = false
}
function mainQuestWidget:initialize()
  self:createControl()
  self:initControl()
end
function mainQuestWidget:createControl()
  self._ui._staticText_Quest_Demand:SetShow(false)
  for index = 0, self._config._maxConditionCount - 1 do
    self._uiQuestConditions[index] = UI.cloneControl(self._ui._staticText_Quest_Demand, Panel_MainQuest, "uiCondition_" .. index)
    self._uiQuestConditions[index]:SetText("")
    self._uiQuestConditions[index]:SetIgnore(true)
    self._uiQuestConditions[index]:SetShow(false)
    self._uiQuestConditions[index]:SetPosX(2)
  end
end
function mainQuestWidget:initControl()
  Panel_MainQuest:SetChildIndex(self._ui._checkbox_Quest_Navi, 9999)
  Panel_MainQuest:SetChildIndex(self._ui._checkButton_AutoNavi, 9999)
  self._ui._checkButton_AutoNavi:addInputEvent("Mouse_On", "HandleMouseOver_Button( true , 1 )")
  self._ui._checkButton_AutoNavi:addInputEvent("Mouse_Out", "HandleMouseOver_Button( false ,1 )")
  self._ui._checkbox_Quest_Navi:addInputEvent("Mouse_On", "HandleMouseOver_Button( true , 2 )")
  self._ui._checkbox_Quest_Navi:addInputEvent("Mouse_Out", "HandleMouseOver_Button( false , 2 )")
  if -1 < ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_MainQuest, 0, CppEnums.PanelSaveType.PanelSaveType_IsShow) then
    if 0 < ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_MainQuest, 0, CppEnums.PanelSaveType.PanelSaveType_IsShow) then
      Panel_MainQuest:SetShow(true)
    else
      Panel_MainQuest:SetShow(false)
    end
  else
    Panel_MainQuest:SetShow(true)
  end
  self._isInitialized = true
  if true == Panel_MainQuest:GetShow() then
    self:update()
  end
end
function PaGlobalFunc_MainQuestWidget_Open()
  mainQuestWidget:open()
end
function mainQuestWidget:open()
  Panel_MainQuest:SetShow(true)
  self:update()
end
function PaGlobalFunc_MainQuestWidget_Close()
  mainQuestWidget:close()
end
function mainQuestWidget:close()
  Panel_MainQuest:SetShow(false)
  self:clearAll()
end
function PaGlobalFunc_MainQuestWidget_SetQuestGroupTitleInfo(uiQuestInfo)
  return mainQuestWidget:setQuestGroupTitleInfo(uiQuestInfo)
end
function mainQuestWidget:setQuestGroupTitleInfo(uiQuestInfo)
  local startPosY = self._ui._staticText_Quest_Title:GetPosY() + self._ui._staticText_Quest_Title:GetSizeY() * 2
  if uiQuestInfo:isSatisfied() or not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
    return startPosY
  end
  local questNo = uiQuestInfo:getQuestNo()
  local questListInfo = ToClient_GetQuestList()
  local uiQuestGroupInfo = questListInfo:getQuestGroup(questNo)
  if nil ~= uiQuestGroupInfo and uiQuestGroupInfo:isGroupQuest() then
    local groupTitle = uiQuestGroupInfo:getTitle()
    local questGroupCount = uiQuestGroupInfo:getTotalQuestCount()
    local groupQuestTitleInfo = " " .. groupTitle .. " (" .. questNo._quest .. "/" .. questGroupCount .. ")"
    self._ui._staticText_WidgetGroupTitle:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_GROUPTITLEINFO", "titleinfo", groupQuestTitleInfo))
    self._ui._staticText_WidgetGroupTitle:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
    self._ui._staticText_WidgetGroupTitle:SetSize(230, self._ui._staticText_Quest_Title:GetSizeY())
    self._ui._staticText_WidgetGroupTitle:SetPosX(8)
    self._ui._staticText_WidgetGroupTitle:SetPosY(self._ui._staticText_Quest_Title:GetPosY() + self._ui._staticText_Quest_Title:GetSizeY() + self._ui._staticText_Quest_Title:GetSizeY() + 5)
    self._ui._staticText_WidgetGroupTitle:SetAutoResize(true)
    self._ui._staticText_WidgetGroupTitle:SetIgnore(true)
    self._ui._staticText_WidgetGroupTitle:SetShow(true)
    startPosY = startPosY + self._ui._staticText_Quest_Title:GetSizeY() * 2
  end
  return startPosY
end
function FGlobal_MainQuest_Update()
  mainQuestWidget:update()
end
function mainQuestWidget:update()
  if false == self._isInitialized then
    return
  end
  local questList = ToClient_GetQuestList()
  if true == questList:isMainQuestClearAll() then
    self:close()
    return
  end
  self:clearAll()
  local uiQuestInfo = questList:getMainQuestInfo()
  if nil ~= uiQuestInfo then
    self._mainQuestNo = uiQuestInfo:getQuestNo()
    self:setIconInfo(uiQuestInfo)
    self:setQuestTitleInfo(uiQuestInfo)
    local startPosY = self:setQuestGroupTitleInfo(uiQuestInfo)
    self:setConditionInfo(uiQuestInfo, startPosY)
    self:setButtonCheckState(uiQuestInfo)
  else
    self:close()
  end
end
function mainQuestWidget:clearAll()
  self._ui._staticText_Quest_Title:SetShow(false)
  self._ui._static_Eff_Complete_Eff1:SetShow(false)
  self._ui._static_Quest_Type:SetShow(false)
  self._ui._staticText_WidgetGroupTitle:SetShow(false)
  self._ui._staticText_Quest_ClearNpc:SetShow(false)
  self._ui._staticText_Quest_Demand:SetShow(false)
  self._ui._checkButton_AutoNavi:SetShow(false)
  self._ui._checkbox_Quest_Navi:SetShow(false)
  self._ui._button_Quest_Giveup:SetShow(false)
  for index = 0, self._config._maxConditionCount - 1 do
    if nil ~= self._uiQuestConditions[index] then
      self._uiQuestConditions[index]:SetText("")
      self._uiQuestConditions[index]:SetIgnore(true)
      self._uiQuestConditions[index]:SetShow(false)
    end
  end
  self._isButtonOn = false
  self._mainQuestNo = nil
end
function mainQuestWidget:getQuestTitle(uiQuestInfo)
  local questTitle = uiQuestInfo:getTitle()
  local recommandLevel = uiQuestInfo:getRecommendLevel()
  if nil ~= recommandLevel and 0 ~= recommandLevel then
    questTitle = "[" .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. recommandLevel .. "] " .. questTitle
  end
  return questTitle
end
function mainQuestWidget:setQuestTitleInfo(uiQuestInfo)
  local questTitle = self:getQuestTitle(uiQuestInfo)
  local isAccepted = 1
  if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
    isAccepted = 0
  end
  self._ui._staticText_Quest_Title:SetAutoResize(true)
  self._ui._staticText_Quest_Title:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  self._ui._staticText_Quest_Title:SetSize(200, self._ui._staticText_Quest_Title:GetSizeY())
  if 0 == isAccepted then
    self._ui._staticText_Quest_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_NOTACCEPTTITLE", "title", questTitle))
  else
    self._ui._staticText_Quest_Title:SetText(questTitle)
  end
  self._ui._staticText_Quest_Title:SetLineRender(false)
  self._ui._staticText_Quest_Title:SetShow(true)
  self._ui._staticText_Quest_Title:SetIgnore(true)
  self._ui._staticText_Quest_Title:SetFontColor(Defines.Color.C_FFEFEFEF)
  self._ui._staticText_Quest_Title:useGlowFont(true, "BaseFont_8_Glow", 4287655978)
  local questNo = uiQuestInfo:getQuestNo()
  local questStaticStatus = questList_getQuestStatic(questNo._group, questNo._quest)
  local checkCondition
  if true == uiQuestInfo:isSatisfied() then
    checkCondition = QuestConditionCheckType.eQuestConditionCheckType_Complete
  elseif 0 == isAccepted then
    checkCondition = QuestConditionCheckType.eQuestConditionCheckType_NotAccept
  else
    checkCondition = QuestConditionCheckType.eQuestConditionCheckType_Progress
  end
  local groupTitle = "nil"
  local questGroupCnt = 0
  local questListInfo = ToClient_GetQuestList()
  local uiQuestGroupInfo = questListInfo:getQuestGroup(questNo)
  if nil ~= uiQuestGroupInfo then
    groupTitle = uiQuestGroupInfo:getTitle()
    questGroupCnt = uiQuestGroupInfo:getTotalQuestCount()
  end
  Panel_MainQuest:addInputEvent("Mouse_LUp", "HandleClicked_ShowMainQuestDetail( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", \"" .. groupTitle .. "\", " .. questGroupCnt .. " )")
  Panel_MainQuest:addInputEvent("Mouse_RUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", false ," .. isAccepted .. ", \"GroupBG\" )")
  self._ui._staticText_Quest_ClearNpc:addInputEvent("Mouse_LUp", "HandleClicked_ShowMainQuestDetail( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", \"" .. groupTitle .. "\", " .. questGroupCnt .. " )")
  self._ui._staticText_Quest_ClearNpc:addInputEvent("Mouse_RUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", false ," .. isAccepted .. ", \"GroupBG\" )")
  self._ui._checkbox_Quest_Navi:addInputEvent("Mouse_LUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", false ," .. isAccepted .. ", \"Navi\" )")
  self._ui._checkButton_AutoNavi:addInputEvent("Mouse_LUp", "HandleClicked_MainQuest_FindWay( " .. questNo._group .. ", " .. questNo._quest .. ", " .. checkCondition .. ", true ," .. isAccepted .. ", \"AutoNavi\" )")
  self._ui._static_TitleBG:addInputEvent("Mouse_On", "HandleMouseOver_MainQuestWidget( true," .. isAccepted .. ")")
  self._ui._static_TitleBG:addInputEvent("Mouse_Out", "HandleMouseOver_MainQuestWidget( false," .. isAccepted .. ")")
  self._ui._staticText_Quest_ClearNpc:addInputEvent("Mouse_On", "HandleMouseOver_MainQuestWidget( true," .. isAccepted .. ")")
  self._ui._staticText_Quest_ClearNpc:addInputEvent("Mouse_Out", "HandleMouseOver_MainQuestWidget( false," .. isAccepted .. ")")
  local posCount = questStaticStatus:getQuestPositionCount()
  local enable = false == uiQuestInfo:isSatisfied() and 0 ~= posCount
  enable = true
  self._ui._checkButton_AutoNavi:SetEnable(enable)
  self._ui._checkbox_Quest_Navi:SetEnable(enable)
end
function mainQuestWidget:setIconInfo(uiQuestInfo)
  self._ui._static_Quest_Type:EraseAllEffect()
  self._ui._static_Quest_Type:SetShow(true)
  self._ui._static_Quest_Type:SetIgnore(true)
  FGlobal_ChangeOnTextureForDialogQuestIcon(self._ui._static_Quest_Type, uiQuestInfo:getQuestType())
end
function mainQuestWidget:setConditionInfo(uiQuestInfo, startPosY)
  self:clearConditionInfo()
  local checkCondition
  if true == uiQuestInfo:isSatisfied() then
    checkCondition = 0
  else
    checkCondition = 1
  end
  local uiQuestCondition
  self._ui._staticText_Quest_ClearNpc:SetLineRender(false)
  if not uiQuestInfo._isCleared and not uiQuestInfo._isProgressing then
    self._ui._staticText_Quest_ClearNpc:SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_MAINQUEST_ACCEPT_NOTICE"))
    self._ui._staticText_Quest_ClearNpc:SetFontColor(Defines.Color.C_FFC4BEBE)
    self._ui._staticText_Quest_ClearNpc:SetShow(true)
    startPosY = startPosY + self._ui._staticText_Quest_ClearNpc:GetSizeY() + 2
  elseif 1 == checkCondition then
    for conditionIndex = 0, uiQuestInfo:getDemandCount() - 1 do
      local conditionInfo = uiQuestInfo:getDemandAt(conditionIndex)
      uiQuestCondition = self._uiQuestConditions[conditionIndex]
      uiQuestCondition:SetAutoResize(true)
      uiQuestCondition:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
      uiQuestCondition:SetFontColor(Defines.Color.C_FFC4BEBE)
      uiQuestCondition:SetPosY(startPosY)
      uiQuestCondition:SetSize(self._ui._static_TitleBG:GetSizeX(), uiQuestCondition:GetTextSizeY())
      local conditionText
      if conditionInfo._currentCount == conditionInfo._destCount or conditionInfo._destCount <= conditionInfo._currentCount then
        uiQuestCondition:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
        uiQuestCondition:SetLineCount(1)
        conditionText = " - " .. conditionInfo._desc .. " (" .. PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST_COMPLETE") .. ")"
        uiQuestCondition:SetText(ToClient_getReplaceDialog(conditionText))
        uiQuestCondition:SetLineRender(true)
        uiQuestCondition:SetFontColor(Defines.Color.C_FF626262)
      elseif 1 == conditionInfo._destCount then
        conditionText = " - " .. conditionInfo._desc
        uiQuestCondition:SetText(ToClient_getReplaceDialog(conditionText))
        uiQuestCondition:SetLineRender(false)
      else
        conditionText = " - " .. conditionInfo._desc .. " (" .. conditionInfo._currentCount .. "/" .. conditionInfo._destCount .. ")"
        uiQuestCondition:SetText(ToClient_getReplaceDialog(conditionText))
        uiQuestCondition:SetLineRender(false)
      end
      uiQuestCondition:SetShow(true)
      uiQuestCondition:SetIgnore(true)
      startPosY = startPosY + uiQuestCondition:GetSizeY() + 2
    end
  elseif 0 == checkCondition then
    if 0 == uiQuestInfo:getQuestType() then
      self._ui._static_Quest_Type:AddEffect("UI_Quest_Complete_GoldAura", true, 130, 0)
    elseif 0 < uiQuestInfo:getQuestType() then
      self._ui._static_Quest_Type:AddEffect("UI_Quest_Complete_GreenAura", true, 130, 0)
    end
    self._ui._staticText_Quest_ClearNpc:SetText(" " .. PAGetString(Defines.StringSheet_GAME, "LUA_CHECKEDQUEST_QUESTCOMPLETENPC"))
    self._ui._staticText_Quest_ClearNpc:SetLineRender(true)
    self._ui._staticText_Quest_ClearNpc:SetFontColor(Defines.Color.C_FFF26A6A)
    self._ui._staticText_Quest_ClearNpc:SetShow(true)
    FGlobal_ChangeOnTextureForDialogQuestIcon(self._ui._static_Quest_Type, 8)
    startPosY = startPosY + self._ui._staticText_Quest_ClearNpc:GetSizeY() + 2
    FGlobal_QuestWidget_AutoReleaseNavi(uiQuestInfo)
  end
  Panel_MainQuest:SetSize(Panel_MainQuest:GetSizeX(), startPosY + 10)
end
function mainQuestWidget:setButtonCheckState(uiQuestInfo)
  local questNo = uiQuestInfo:getQuestNo()
  local questGroup, questId, naviInfoAgain = FGlobal_QuestWidget_GetSelectedNaviInfo()
  if questGroup == questNo._group and questId == questNo._quest then
    if true == naviInfoAgain then
      self._ui._checkButton_AutoNavi:SetCheck(false)
      self._ui._checkbox_Quest_Navi:SetCheck(false)
    elseif true == self._ui._checkButton_AutoNavi:IsCheck() then
      self._ui._checkbox_Quest_Navi:SetCheck(true)
      self._ui._checkButton_AutoNavi:SetCheck(false)
    else
      self._ui._checkbox_Quest_Navi:SetCheck(false)
      self._ui._checkButton_AutoNavi:SetCheck(true)
    end
  else
    self._ui._checkButton_AutoNavi:SetCheck(false)
    self._ui._checkbox_Quest_Navi:SetCheck(false)
  end
end
function mainQuestWidget:setButtonState(isMouseOver)
end
function HandleClicked_ShowMainQuestDetail(groupId, questId, checkCondition, groupTitle, questGroupCount)
  local fromQuestWidget = true
  FGlobal_QuestWindow_SetProgress()
  FGlobal_QuestInfoDetail(groupId, questId, checkCondition, groupTitle, questGroupCount, true)
  audioPostEvent_SystemUi(0, 0)
end
function HandleClicked_MainQuest_FindWay(gruopNo, questNo, questCondition, isAuto, checkAcceptable, control)
  if 0 == checkAcceptable then
    local isAcceptable = questList_isAcceptableQuest(gruopNo, questNo)
    if false == isAcceptable then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MAINQUEST_CHECH_CONDITION_NOTICE"))
      return
    end
  end
  HandleClicked_QuestWindow_FindWay(gruopNo, questNo, questCondition, isAuto)
end
function mainQuestWidget:showAcceptConditionTooltip(show)
  if true == show then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWINDOW_ACCEPTCONDITION")
    local questList = ToClient_GetQuestList()
    local uiQuestInfo = questList:getMainQuestInfo()
    if nil ~= uiQuestInfo then
      local desc = uiQuestInfo:getAcceptConditionText()
      registTooltipControl(Panel_MainQuest, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(Panel_MainQuest, name, desc)
    end
  else
    TooltipSimple_Hide()
  end
end
function mainQuestWidget:clearConditionInfo()
  self._ui._staticText_Quest_ClearNpc:SetShow(false)
  self._ui._staticText_Quest_ClearNpc:SetText("")
  for index = 0, self._config._maxConditionCount - 1 do
    self._uiQuestConditions[index]:SetShow(false)
    self._uiQuestConditions[index]:SetText("")
  end
end
function mainQuestWidget:ShowGroupBG(show)
end
function mainQuestWidget:isHitTest(control)
  local panel = Panel_MainQuest
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  local panelPosX = panel:GetPosX()
  local panelPosY = panel:GetPosY()
  local bgPosX = panelPosX
  local bgPosY = panelPosY
  local bgSizeX = panel:GetSizeX()
  local bgSizeY = panel:GetSizeY()
  if mousePosX >= bgPosX and mousePosX <= bgPosX + bgSizeX and mousePosY >= bgPosY and mousePosY <= bgPosY + bgSizeY then
    return true
  end
  return false
end
function mainQuestWidget:setTooltipPos(posY)
end
function mainQuestWidget:isShownQuest(questNo)
  local uiQuestInfo = self._mainQuestNo
  if nil ~= uiQuestInfo then
    if uiQuestInfo._group == questNo._group and uiQuestInfo._quest == questNo._quest then
      return true
    else
      return false
    end
  end
  return false
end
function HandleMouseOver_Button(show, target)
  mainQuestWidget:mouseOverToButton(show, target)
end
function mainQuestWidget:mouseOverToButton(show, target)
  local control, msg = nil, ""
  local posY = 0
  if true == show then
    if 2 == target then
      msg = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_NAVITOOLTIP")
      control = self._ui._checkbox_Quest_Navi
    elseif 1 == target then
      msg = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_AUTONAVITOOLTIP")
      control = self._ui._checkButton_AutoNavi
    end
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, "", msg)
    self._isButtonOn = true
  else
    TooltipSimple_Hide()
    self._isButtonOn = false
  end
end
local isMouseOnWidget = false
function HandleMouseOver_MainQuestWidget(isMouseOver, isAcceptedQuest)
  mainQuestWidget:mouseOverToMaindQuestWidget(isMouseOver, isAcceptedQuest)
end
function mainQuestWidget:mouseOverToMaindQuestWidget(isMouseOver, isAcceptedQuest)
  if true == self._isButtonOn then
    return
  end
  if true == isMouseOver then
    if self._ui._checkButton_AutoNavi:IsEnable() then
      self._ui._checkButton_AutoNavi:SetShow(true)
      self._ui._checkbox_Quest_Navi:SetShow(true)
    end
    isMouseOnWidget = true
  else
    self._ui._checkButton_AutoNavi:SetShow(false)
    self._ui._checkbox_Quest_Navi:SetShow(false)
    if true == self:isHitTest(Panel_MainQuest) then
      return
    end
    local isSelectedNaviBtn = not self._ui._checkButton_AutoNavi:IsCheck() and self._ui._checkbox_Quest_Navi:IsCheck()
    isMouseOnWidget = false
    self:showAcceptConditionTooltip(false)
  end
  if 0 == isAcceptedQuest then
    self:showAcceptConditionTooltip(isMouseOver)
  end
end
function PaGlobalFunc_MainQuestWidget_IsShownQuest(questNo)
  return mainQuestWidget:isShownQuest(questNo)
end
function PaGlobalFunc_MainQuestWidget_GetAutoNaviButton()
  return mainQuestWidget._ui._checkbox_Quest_Navi
end
function PaGlobalFunc_MainQuestWidget_GetClosableLevel()
  return mainQuestWidget._config._closableLevel
end
function FromClient_MainQuestWidget_ResetPosition()
  if Panel_MainQuest:GetRelativePosX() == -1 and Panel_MainQuest:GetRelativePosY() == -1 then
    local initPosX = getScreenSizeX() - Panel_MainQuest:GetSizeX() - 16
    local initPosY = FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 10
    local haveServerPosition = 0 < ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_MainQuest, 0, CppEnums.PanelSaveType.PanelSaveType_IsSaved)
    if not haveServerPosition then
      Panel_MainQuest:SetPosX(initPosX)
      Panel_MainQuest:SetPosY(initPosY)
    end
    FGlobal_InitPanelRelativePos(Panel_MainQuest, initPosX, initPosY)
  elseif Panel_MainQuest:GetRelativePosX() == 0 and Panel_MainQuest:GetRelativePosY() == 0 then
    Panel_MainQuest:SetPosX(getScreenSizeX() - Panel_MainQuest:GetSizeX() - 16)
    Panel_MainQuest:SetPosY(FGlobal_Panel_Radar_GetPosY() + FGlobal_Panel_Radar_GetSizeY() + 10)
    PaGlobalFunc_Quest_UpdatePosition()
  else
    Panel_MainQuest:SetPosX(getScreenSizeX() * Panel_MainQuest:GetRelativePosX() - Panel_MainQuest:GetSizeX() / 2)
    Panel_MainQuest:SetPosY(getScreenSizeY() * Panel_MainQuest:GetRelativePosY() - Panel_MainQuest:GetSizeY() / 2)
  end
  if -1 < ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_MainQuest, 0, CppEnums.PanelSaveType.PanelSaveType_IsShow) then
    if 0 < ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_MainQuest, 0, CppEnums.PanelSaveType.PanelSaveType_IsShow) then
      Panel_MainQuest:SetShow(true)
    else
      Panel_MainQuest:SetShow(false)
    end
  else
    Panel_MainQuest:SetShow(true)
  end
  FGlobal_PanelRepostionbyScreenOut(Panel_MainQuest)
  if true == Panel_MainQuest:GetShow() then
    FGlobal_MainQuest_Update()
  end
end
function FGlobal_QuestWidget_CalcScrollButtonSize()
end
function FromClient_luaLoadComplete_MainQuest()
  mainQuestWidget:initialize()
end
function renderModeChange_Panel_MainQuest_ResetPosition(prevRenderModeList, nextRenderModeList)
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return
  end
  FromClient_MainQuestWidget_ResetPosition()
end
function mainQuestWidget:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_MainQuest")
  registerEvent("onScreenResize", "FromClient_MainQuestWidget_ResetPosition")
  registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_MainQuest_ResetPosition")
end
mainQuestWidget:registEventHandler()
changePositionBySever(Panel_MainQuest, CppEnums.PAGameUIType.PAGameUIPanel_MainQuest, true, true, true)
