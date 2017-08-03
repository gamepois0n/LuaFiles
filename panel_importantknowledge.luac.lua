-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\importantknowledge\panel_importantknowledge.luac 

-- params : ...
-- function num : 0
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local cardKeyRaw = nil
Panel_NewKnowledge:setMaskingChild(true)
Panel_NewKnowledge:ActiveMouseEventEffect(true)
Panel_NewKnowledge:setGlassBackground(true)
Panel_NewKnowledge:RegisterShowEventFunc(true, "Panel_ImportantKnowledge_ShowAni()")
Panel_NewKnowledge:RegisterShowEventFunc(false, "Panel_ImportantKnowledge_HideAni()")
Panel_NewKnowledge_Value_CountIsCurrent = false
Panel_ImportantKnowledge_ShowAni = function()
  -- function num : 0_0
  Panel_NewKnowledge:SetShow(true)
end

Panel_ImportantKnowledge_HideAni = function()
  -- function num : 0_1
  Panel_NewKnowledge:SetShow(false)
end

Panel_NewKnowledge:SetShow(false)
knowledgeWidget = {}
-- DECOMPILER ERROR at PC45: Confused about usage of register: R5 in 'UnsetPending'

knowledgeWidget.__index = knowledgeWidget
-- DECOMPILER ERROR at PC48: Confused about usage of register: R5 in 'UnsetPending'

knowledgeWidget.showFunctionRaw = function(self)
  -- function num : 0_2
  local newCount = (self._cardList):length()
  if newCount > 0 then
    Panel_NewKnowledge_Value_CountIsCurrent = true
    ;
    (self._staticNewCount):SetText(tostring(newCount))
    ;
    (self._panel):SetShow(true)
    ;
    (self._buttonNewKnowledge):EraseAllEffect()
    if self._usingType == 0 then
      (self._buttonNewKnowledge):AddEffect("fUI_KnowledgeNotice01", true, -2, -2)
    else
      if self._usingType == 1 then
        (self._buttonNewKnowledge):AddEffect("fUI_KnowledgeNotice_Important01", true, -2, -2)
        ;
        (self._buttonNewKnowledge):SetPosX((self._buttonNewKnowledge):GetPosX())
      end
    end
  else
    Panel_NewKnowledge_Value_CountIsCurrent = false
    ;
    (self._panel):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R5 in 'UnsetPending'

knowledgeWidget.insertCardList = function(self, mentalCardStaticStatusWrapper)
  -- function num : 0_3 , upvalues : cardKeyRaw
  if mentalCardStaticStatusWrapper == nil then
    return 
  end
  if self._usingType ~= mentalCardStaticStatusWrapper:getMentalCardType() then
    return 
  end
  local cardData = {name = mentalCardStaticStatusWrapper:getName(), desc = mentalCardStaticStatusWrapper:getDesc(), imagePath = mentalCardStaticStatusWrapper:getImagePath()}
  ;
  (self._cardList):push_back(cardData)
  if isFlushedUI() == false then
    _PA_LOG("광운", "----------------------                 새로�\180 �\128식을 얻을�\140 FlushedUI() false�\184 경우는가 있는�\128???")
    self:showFunctionRaw()
  end
  cardKeyRaw = mentalCardStaticStatusWrapper:getKey()
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R5 in 'UnsetPending'

knowledgeWidget.new = function(self, arr)
  -- function num : 0_4
  setmetatable(arr, knowledgeWidget)
  arr._cardList = (Array.new)()
  return arr
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R5 in 'UnsetPending'

knowledgeWidget.initialize = function(self)
  -- function num : 0_5
  (self._buttonNewKnowledge):addInputEvent("Mouse_LUp", "HandleClicked_ShowNewKnowledgePopup(" .. self._usingType .. ")")
end

knowledgeList = {[0] = knowledgeWidget:new({_panel = Panel_NormalKnowledge, _buttonNewKnowledge = (UI.getChildControl)(Panel_NormalKnowledge, "Button_Knowledge"), _staticNewCount = (UI.getChildControl)(Panel_NormalKnowledge, "StaticText_Number"), _usingType = 0}), [1] = knowledgeWidget:new({_panel = Panel_ImportantKnowledge, _buttonNewKnowledge = (UI.getChildControl)(Panel_ImportantKnowledge, "Button_Important"), _staticNewCount = (UI.getChildControl)(Panel_ImportantKnowledge, "StaticText_Number"), _usingType = 1})}
KnowledgeWidget_Restore = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_6
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  for _,value in pairs(knowledgeList) do
    value:showFunctionRaw()
  end
end

registerEvent("FromClient_RenderModeChangeState", "KnowledgeWidget_Restore")
NewKnowledgeWidget_Show = function(mentalCardStaticStatusWrapper)
  -- function num : 0_7
  local temporaryWrapper = getTemporaryInformationWrapper()
  if mentalCardStaticStatusWrapper == nil then
    return 
  end
  local target = knowledgeList[mentalCardStaticStatusWrapper:getMentalCardType()]
  if target == nil then
    return 
  end
  target:insertCardList(mentalCardStaticStatusWrapper)
  if GetUIMode ~= nil and (Defines.UIMode).eUIMode_Default == GetUIMode() then
    target:showFunctionRaw()
  end
  FGlobal_PackageIconUpdate()
end

local NewKnowledgePopup = {_panel = Panel_NewKnowledge, _buttonNext = (UI.getChildControl)(Panel_NewKnowledge, "Button_Next"), _buttonClose = (UI.getChildControl)(Panel_NewKnowledge, "Button_Close"), _buttonCloseAll = (UI.getChildControl)(Panel_NewKnowledge, "Button_AllClose"), _buttonWinClose = (UI.getChildControl)(Panel_NewKnowledge, "Button_WinClose"), _buttonQuestion = (UI.getChildControl)(Panel_NewKnowledge, "Button_Question"), _bubbleNotice = (UI.getChildControl)(Panel_NewKnowledge, "StaticText_Notice"), _frameKnowledge = (UI.getChildControl)(Panel_NewKnowledge, "Frame_Knowledge_Desc"), _staticTitle = (UI.getChildControl)(Panel_NewKnowledge, "StaticText_Knowledge_Title"), _staticImage = (UI.getChildControl)(Panel_NewKnowledge, "Static_Knowledge_Img"), _staticImageBG = (UI.getChildControl)(Panel_NewKnowledge, "Static_Knowledge_ImgBG")}
NewKnowledgePopup.initialize = function(self)
  -- function num : 0_8 , upvalues : UI_TM
  self._frameContent = (UI.getChildControl)(self._frameKnowledge, "Frame_1_Content")
  self._frameScrollV = (UI.getChildControl)(self._frameKnowledge, "Frame_1_VerticalScroll")
  self._staticDesc = (UI.getChildControl)(self._frameContent, "StaticText_Knowledge_Desc")
  ;
  (self._buttonNext):addInputEvent("Mouse_LUp", "HandleClicked_nextNewKnowledge()")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "HandleClicked_closeKnowledgePopup()")
  ;
  (self._buttonWinClose):addInputEvent("Mouse_LUp", "HandleClicked_closeKnowledgePopup()")
  ;
  (self._bubbleNotice):SetShow(false)
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelImportantKnowledge\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelImportantKnowledge\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelImportantKnowledge\", \"false\")")
  ;
  (self._staticDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._staticTitle):SetTextMode(UI_TM.eTextMode_AutoWrap)
end

NewKnowledgePopup.show = function(self, usingType)
  -- function num : 0_9
  local target = knowledgeList[usingType]
  local iconPosX = (target._panel):GetPosX()
  local iconPosY = (target._panel):GetPosY()
  self._usingType = usingType
  if not Panel_NewKnowledge:GetShow() then
    (self._panel):SetPosX(iconPosX)
    ;
    (self._panel):SetPosY(iconPosY)
  end
  ;
  (self._buttonCloseAll):addInputEvent("Mouse_LUp", "HandleClicked_closeKnowledgeOnlyZero( " .. usingType .. ")")
  local newCount = (target._cardList):length()
  if newCount > 0 then
    local cardData = (target._cardList)[1]
    ;
    (self._staticTitle):SetText(cardData.name)
    ;
    (self._staticDesc):SetAutoResize(true)
    ;
    (self._staticDesc):SetText(cardData.desc)
    ;
    (self._staticDesc):SetSize((self._staticDesc):GetSizeX(), (self._staticDesc):GetSizeY())
    ;
    (self._staticImage):ChangeTextureInfoName(cardData.imagePath)
    ;
    (self._frameKnowledge):UpdateContentScroll()
    ;
    (self._frameScrollV):SetControlTop()
    ;
    (self._frameScrollV):SetInterval(2)
    ;
    (self._frameKnowledge):UpdateContentPos()
    ;
    (target._cardList):pop_front()
    if newCount > 2 then
      (self._buttonNext):SetShow(true)
    else
      if newCount == 1 then
        (self._buttonNext):SetShow(false)
      end
    end
    ;
    (self._panel):SetShow(true, true)
  else
    do
      ;
      (self._panel):SetShow(false, false)
      target:showFunctionRaw()
    end
  end
end

NewKnowledgePopup.hide = function(self)
  -- function num : 0_10
  if (self._panel):IsShow() then
    FGlobal_PackageIconUpdate()
    ;
    (self._panel):SetShow(false, true)
  end
end

HandleClicked_ShowNewKnowledgePopup = function(usingType)
  -- function num : 0_11 , upvalues : NewKnowledgePopup
  NewKnowledgePopup:show(usingType)
end

HandleClicked_nextNewKnowledge = function()
  -- function num : 0_12 , upvalues : NewKnowledgePopup
  NewKnowledgePopup:show(NewKnowledgePopup._usingType)
end

HandleClicked_closeKnowledgePopup = function()
  -- function num : 0_13 , upvalues : NewKnowledgePopup
  NewKnowledgePopup:hide()
end

HandleClicked_closeKnowledgeOnlyZero = function(usingType)
  -- function num : 0_14 , upvalues : NewKnowledgePopup
  local target = knowledgeList[usingType]
  target._cardList = (Array.new)()
  target:showFunctionRaw()
  NewKnowledgePopup:hide()
end

FromClient_NewKnowledge = function(mentalCardStaticStatusWrapper)
  -- function num : 0_15
  NewKnowledgeWidget_Show(mentalCardStaticStatusWrapper)
end

registerEvent("FromClient_NewKnowledge", "FromClient_NewKnowledge")
for _,value in pairs(knowledgeList) do
  value:initialize()
end
NewKnowledgePopup:initialize()
FGlobal_CardKeyReturn = function()
  -- function num : 0_16 , upvalues : cardKeyRaw
  return cardKeyRaw
end


