-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\knowledge\panel_knowledge_main.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_Knowledge}, false)
Panel_Knowledge_Main:TEMP_UseUpdateListSwap(true)
Panel_Knowledge_List:TEMP_UseUpdateListSwap(true)
local ui_Copy = {_icon = (UI.getChildControl)(Panel_Knowledge_Main, "Static_C_Knowledge_Icon"), _gaugeBG = (UI.getChildControl)(Panel_Knowledge_Main, "Static_C_GaugeBG"), _gauge = (UI.getChildControl)(Panel_Knowledge_Main, "Progress_C_Gauge"), _name = (UI.getChildControl)(Panel_Knowledge_Main, "StaticText_C_Knowledge_Name"), _normal = (UI.getChildControl)(Panel_Knowledge_Main, "Static_C_Knowledge_Nor"), _cardIcon = (UI.getChildControl)(Panel_Knowledge_Main, "StaticText_C_Knowledge_NrIcon"), _category = (UI.getChildControl)(Panel_Knowledge_List, "StaticText_ListStep_1"), _nextArrow = (UI.getChildControl)(Panel_Knowledge_List, "Static_ListStepArrow_1"), _list_Step2 = (UI.getChildControl)(Panel_Knowledge_List, "StaticText_ListStep_2"), _list_Step3 = (UI.getChildControl)(Panel_Knowledge_List, "StaticText_ListStep_3"), _list_Arrow2 = (UI.getChildControl)(Panel_Knowledge_List, "Static_ListStepArrow_2")}
uiConst = {main = Panel_Knowledge_Main, main_WhosKnowledge = (UI.getChildControl)(Panel_Knowledge_Main, "StaticText_WhosKnowledge"), main_Top = (UI.getChildControl)(Panel_Knowledge_Main, "Button_Top"), main_Hint = (UI.getChildControl)(Panel_Knowledge_Main, "StaticText_Notice"), list = Panel_Knowledge_List, list_MenuBg = (UI.getChildControl)(Panel_Knowledge_List, "Static_TopMenuBG"), list_ListBg = (UI.getChildControl)(Panel_Knowledge_List, "Static_ListBG"), list_Edit = (UI.getChildControl)(Panel_Knowledge_List, "Edit_FindKnowledge"), list_Tree = (UI.getChildControl)(Panel_Knowledge_List, "Tree_Knowledge_List"), list_FindList = (UI.getChildControl)(Panel_Knowledge_List, "Button_MyList"), list_Hint = (UI.getChildControl)(Panel_Knowledge_List, "StaticText_Notice"), info = Panel_Knowledge_Info, info_Picture = (UI.getChildControl)(Panel_Knowledge_Info, "Static_Knowledge_Icon"), info_Name = (UI.getChildControl)(Panel_Knowledge_Info, "StaticText_NamePanel"), info_Story = (UI.getChildControl)(Panel_Knowledge_Info, "StaticText_Knowledge_Story"), info_Zodiac = (UI.getChildControl)(Panel_Knowledge_Info, "Static_StarBG"), info_zodiacName = (UI.getChildControl)(Panel_Knowledge_Info, "StaticText_StarName"), info_InfoBg = (UI.getChildControl)(Panel_Knowledge_Info, "Static_InfoBG"), info_npcInfoBG = (UI.getChildControl)(Panel_Knowledge_Info, "Static_NpcInfo_BG"), info_NpcInterest = (UI.getChildControl)(Panel_Knowledge_Info, "StaticText_OnlyNpc_Interest"), info_NpcInt = (UI.getChildControl)(Panel_Knowledge_Info, "StaticText_OnlyNpc_NpcInt"), info_NpcValue = (UI.getChildControl)(Panel_Knowledge_Info, "StaticText_OnlyNpc_Value"), info_Value = (UI.getChildControl)(Panel_Knowledge_Info, "Static_Icon_Value"), info_Interest = (UI.getChildControl)(Panel_Knowledge_Info, "Static_Icon_Interest"), info_CardEffect = (UI.getChildControl)(Panel_Knowledge_Info, "StaticText_CardEffect"), list_GetKnowledgeCount = (UI.getChildControl)(Panel_Knowledge_List, "StaticText_GetKnowledgeCount")}
local uiListControlByKey = {[1] = (UI.getChildControl)(Panel_Knowledge_List, "Button_Man"), [5001] = (UI.getChildControl)(Panel_Knowledge_List, "Button_Land"), [5020] = (UI.getChildControl)(Panel_Knowledge_List, "Button_BigSea"), [10001] = (UI.getChildControl)(Panel_Knowledge_List, "Button_Env"), [25001] = (UI.getChildControl)(Panel_Knowledge_List, "Button_Book"), [20001] = (UI.getChildControl)(Panel_Knowledge_List, "Button_Travel"), [30001] = (UI.getChildControl)(Panel_Knowledge_List, "Button_Life"), [31300] = (UI.getChildControl)(Panel_Knowledge_List, "Button_Guide"), [31310] = (UI.getChildControl)(Panel_Knowledge_List, "Button_TradeItem")}
local circularColorValue = {[1] = (Defines.Color).C_FFF4D35D, [5001] = (Defines.Color).C_FF387f14, [5020] = (Defines.Color).C_FF3E5CFF, [10001] = (Defines.Color).C_FF00C2EA, [25001] = (Defines.Color).C_FF844BE3, [20001] = (Defines.Color).C_FFBCF44B, [30001] = (Defines.Color).C_FFDA0000, [31300] = (Defines.Color).C_FFf570a1, [31310] = (Defines.Color).C_FF25c28b}
local ui = {
mainGroup = {}
, 
currentGroup = {}
, 
cardGroup = {}
, 
topList = {}
}
local constValue = {
buffTypeString = {PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_INTERESTING"), PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_DEMANDINGINTERESTING"), PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_DEMANDINGFAVOR"); [0] = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_FAVOR")}
, listIconLeft = (uiListControlByKey[1]):GetPosX()}
local rotateValue = 0
local rotateResultValue = 0
local radiusValue = 0
local radiusResultValue = 100
local zodiacInfo = {
lineKeyList = {}
, color = float4(1, 1, 1, 1), zOrder = 10, width = 1, 
lineBGKeyList = {}
, colorBG = float4(0.8, 0.9, 0.6, 0.5), colorFG = float4(0.8, 0.9, 0.6, 1), zOrderBG = 5, widthBG = 10, category = "InstantLine_MentalKnowledgeZodiac"}
local init = function()
  -- function num : 0_0 , upvalues : ui_Copy, uiListControlByKey, UI_TM
  for _,v in pairs(ui_Copy) do
    v:SetShow(false)
  end
  for key,value in pairs(uiListControlByKey) do
    value:SetShow(false)
    value:addInputEvent("Mouse_LUp", "Panel_Knowledge_SelectMainUIByKey(" .. key .. ")")
  end
  ;
  (uiConst.main_WhosKnowledge):SetShow(true)
  ;
  (uiConst.main_Top):SetShow(true)
  ;
  (uiConst.main_WhosKnowledge):SetPosX(100)
  ;
  (uiConst.main_WhosKnowledge):SetPosY(100)
  ;
  (uiConst.main_Top):SetPosX(100)
  ;
  (uiConst.main_Top):SetPosY(100)
  ;
  (uiConst.info_Story):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (uiConst.info_Story):SetAutoResize(true)
  ;
  (uiConst.info_npcInfoBG):AddChild(uiConst.info_NpcInterest)
  ;
  (uiConst.info_npcInfoBG):AddChild(uiConst.info_NpcInt)
  ;
  (uiConst.info_npcInfoBG):AddChild(uiConst.info_NpcValue)
  ;
  (uiConst.info_InfoBg):AddChild(uiConst.info_CardEffect)
  ;
  (uiConst.info_InfoBg):AddChild(uiConst.info_Value)
  ;
  (uiConst.info_InfoBg):AddChild(uiConst.info_Interest)
  ;
  (uiConst.info):RemoveControl(uiConst.info_NpcInterest)
  ;
  (uiConst.info):RemoveControl(uiConst.info_NpcInt)
  ;
  (uiConst.info):RemoveControl(uiConst.info_NpcValue)
  ;
  (uiConst.info):RemoveControl(uiConst.info_CardEffect)
  ;
  (uiConst.info):RemoveControl(uiConst.info_Value)
  ;
  (uiConst.info):RemoveControl(uiConst.info_Interest)
  ;
  (uiConst.info_NpcValue):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (uiConst.info_Value):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (uiConst.list_GetKnowledgeCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_MAIN_GETKNOWLEDGECOUNT", "count", ToClient_GetTotalMentalCardCount()))
end

Panel_Knowledge_AddItemTree = function(parentUIItem, theme)
  -- function num : 0_1
  local childItem = (uiConst.list_Tree):createRootItem()
  childItem:SetKey(-theme:getKey())
  local nameString = theme:getName()
  if theme:getMaxIncreaseWp() > 0 then
    nameString = nameString .. PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Knowledge_TalkingPowerUp", "increaseWp", theme:getIncreaseWp() .. "/" .. theme:getMaxIncreaseWp() .. " ")
  end
  local collected_complete = nil
  if theme:getCardCollectedCount() == theme:getCardCollectMaxCount() then
    collected_complete = PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_LIST_COMPLETE")
    childItem:SetFontColor((Defines.Color).C_FF6DC6FF)
  else
    collected_complete = ""
    childItem:SetFontColor((Defines.Color).C_FFFFFFFF)
  end
  nameString = nameString .. " " .. collected_complete
  childItem:SetText(nameString)
  if parentUIItem == nil then
    (uiConst.list_Tree):AddRootItem(childItem)
  else
    ;
    (uiConst.list_Tree):AddItem(childItem, parentUIItem)
  end
  local childThemeCount = theme:getChildThemeCount()
  for idx = 0, childThemeCount - 1 do
    local childTheme = theme:getChildThemeByIndex(idx)
    Panel_Knowledge_AddItemTree(childItem, childTheme)
  end
  local childCardCount = theme:getChildCardCount()
  for idx = 0, childCardCount - 1 do
    local childCard = theme:getChildCardByIndex(idx)
    local childCardItem = (uiConst.list_Tree):createChildItem()
    childCardItem:SetKey(childCard:getKey())
    childCardItem:SetText(childCard:getName())
    ;
    (uiConst.list_Tree):AddItem(childCardItem, childItem)
  end
end

local createMainControls = function(progressCount)
  -- function num : 0_2 , upvalues : ui, UI_PUCT, ui_Copy
  for index = 0, progressCount - 1 do
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R5 in 'UnsetPending'

    if (ui.mainGroup)[index] == nil then
      (ui.mainGroup)[index] = {}
    end
    local gaugeBG = ((ui.mainGroup)[index])._gaugeBG
    if gaugeBG == nil then
      gaugeBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Knowledge_Main, "Static_GaugeBG_" .. index)
      CopyBaseProperty(ui_Copy._gaugeBG, gaugeBG)
      gaugeBG:SetPosX(20 + index * 140)
      gaugeBG:addInputEvent("Mouse_LUp", "Panel_Knowledge_SelectMainUI(" .. index .. ")")
      gaugeBG:addInputEvent("Mouse_DownScroll", "Panel_Knowledge_RotateValueUpdate(true)")
      gaugeBG:addInputEvent("Mouse_UpScroll", "Panel_Knowledge_RotateValueUpdate(false)")
      -- DECOMPILER ERROR at PC56: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((ui.mainGroup)[index])._gaugeBG = gaugeBG
    end
    gaugeBG:SetShow(true)
    local gauge = ((ui.mainGroup)[index])._gauge
    if gauge == nil then
      gauge = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_CIRCULAR_PROGRESS, gaugeBG, "Progress_Gauge_" .. index)
      CopyBaseProperty(ui_Copy._gauge, gauge)
      gauge:SetVerticalMiddle()
      gauge:SetHorizonCenter()
      gauge:SetIgnore(true)
      -- DECOMPILER ERROR at PC91: Confused about usage of register: R7 in 'UnsetPending'

      ;
      ((ui.mainGroup)[index])._gauge = gauge
    end
    gauge:SetCurrentControlPos(0)
    gauge:SetShow(true)
    local icon = ((ui.mainGroup)[index])._icon
    if icon == nil then
      icon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, gaugeBG, "Static_Icon_" .. index)
      CopyBaseProperty(ui_Copy._icon, icon)
      icon:SetVerticalMiddle()
      icon:SetHorizonCenter()
      icon:SetIgnore(true)
      -- DECOMPILER ERROR at PC129: Confused about usage of register: R8 in 'UnsetPending'

      ;
      ((ui.mainGroup)[index])._icon = icon
    end
    icon:SetShow(true)
    local name = ((ui.mainGroup)[index])._name
    if name == nil then
      name = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, gaugeBG, "StaticText_Name_" .. index)
      CopyBaseProperty(ui_Copy._name, name)
      name:SetVerticalBottom()
      name:SetHorizonCenter()
      name:SetSpanSize((name:GetSpanSize()).x, -name:GetSizeY())
      name:SetIgnore(true)
      -- DECOMPILER ERROR at PC172: Confused about usage of register: R9 in 'UnsetPending'

      ;
      ((ui.mainGroup)[index])._name = name
    end
    name:SetShow(true)
  end
end

local createCurrentControls = function(progressCount)
  -- function num : 0_3 , upvalues : ui, UI_PUCT, ui_Copy
  for index = 0, progressCount - 1 do
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R5 in 'UnsetPending'

    if (ui.currentGroup)[index] == nil then
      (ui.currentGroup)[index] = {}
    end
    local gaugeBG = ((ui.currentGroup)[index])._gaugeBG
    if gaugeBG == nil then
      gaugeBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Knowledge_Main, "Static_GaugeBG__" .. index)
      CopyBaseProperty(ui_Copy._gaugeBG, gaugeBG)
      gaugeBG:SetPosX(20 + index * 140)
      gaugeBG:addInputEvent("Mouse_LUp", "Panel_Knowledge_SelectMainUI(" .. index .. ")")
      gaugeBG:addInputEvent("Mouse_DownScroll", "Panel_Knowledge_RotateValueUpdate(true)")
      gaugeBG:addInputEvent("Mouse_UpScroll", "Panel_Knowledge_RotateValueUpdate(false)")
      -- DECOMPILER ERROR at PC56: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((ui.currentGroup)[index])._gaugeBG = gaugeBG
    end
    gaugeBG:SetShow(true)
    local gauge = ((ui.currentGroup)[index])._gauge
    if gauge == nil then
      gauge = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_CIRCULAR_PROGRESS, gaugeBG, "Progress_Gauge_" .. index)
      CopyBaseProperty(ui_Copy._gauge, gauge)
      gauge:SetVerticalMiddle()
      gauge:SetHorizonCenter()
      gauge:SetIgnore(true)
      -- DECOMPILER ERROR at PC91: Confused about usage of register: R7 in 'UnsetPending'

      ;
      ((ui.currentGroup)[index])._gauge = gauge
    end
    gauge:SetCurrentControlPos(0)
    gauge:SetShow(true)
    local icon = ((ui.currentGroup)[index])._icon
    if icon == nil then
      icon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, gaugeBG, "Static_Icon__" .. index)
      CopyBaseProperty(ui_Copy._icon, icon)
      icon:SetVerticalMiddle()
      icon:SetHorizonCenter()
      icon:SetIgnore(true)
      -- DECOMPILER ERROR at PC129: Confused about usage of register: R8 in 'UnsetPending'

      ;
      ((ui.currentGroup)[index])._icon = icon
    end
    icon:SetShow(true)
    local normal = ((ui.currentGroup)[index])._normal
    if normal == nil then
      normal = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, gaugeBG, "Progress_Normal__" .. index)
      CopyBaseProperty(ui_Copy._normal, normal)
      normal:SetVerticalMiddle()
      normal:SetHorizonCenter()
      normal:SetIgnore(true)
      -- DECOMPILER ERROR at PC164: Confused about usage of register: R9 in 'UnsetPending'

      ;
      ((ui.currentGroup)[index])._normal = normal
    end
    normal:SetShow(true)
    local name = ((ui.currentGroup)[index])._name
    if name == nil then
      name = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, gaugeBG, "StaticText_Name__" .. index)
      CopyBaseProperty(ui_Copy._name, name)
      name:SetVerticalBottom()
      name:SetHorizonCenter()
      name:SetSpanSize((name:GetSpanSize()).x, -name:GetSizeY())
      name:SetIgnore(true)
      -- DECOMPILER ERROR at PC207: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((ui.currentGroup)[index])._name = name
    end
    name:SetShow(true)
  end
end

local createCardControls = function(count)
  -- function num : 0_4 , upvalues : ui, UI_PUCT, ui_Copy
  for index = 0, count - 1 do
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R5 in 'UnsetPending'

    if (ui.cardGroup)[index] == nil then
      (ui.cardGroup)[index] = {}
    end
    local cardIcon = ((ui.cardGroup)[index])._cardIcon
    if cardIcon == nil then
      cardIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_Knowledge_Main, "Static_CardIcon__" .. index)
      CopyBaseProperty(ui_Copy._cardIcon, cardIcon)
      cardIcon:SetPosX(20 + index * 140)
      cardIcon:addInputEvent("Mouse_LUp", "Panel_Knowledge_SelectMainUICard(" .. index .. ")")
      cardIcon:addInputEvent("Mouse_On", "Panel_Knowledge_ShowHint(" .. index .. ")")
      cardIcon:addInputEvent("Mouse_Out", "Panel_Knowledge_HideHint()")
      cardIcon:addInputEvent("Mouse_DownScroll", "Panel_Knowledge_RotateValueUpdate(true)")
      cardIcon:addInputEvent("Mouse_UpScroll", "Panel_Knowledge_RotateValueUpdate(false)")
      -- DECOMPILER ERROR at PC67: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((ui.cardGroup)[index])._cardIcon = cardIcon
    end
    cardIcon:SetShow(true)
  end
end

local createTopListControls = function(count)
  -- function num : 0_5 , upvalues : ui, UI_PUCT, ui_Copy
  for index = 0, count - 1 do
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R5 in 'UnsetPending'

    if (ui.topList)[index] == nil then
      (ui.topList)[index] = {}
    end
    local category = ((ui.topList)[index])._category
    if category == nil then
      category = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_Knowledge_List, "StaticText_CategoryStr_" .. index)
      CopyBaseProperty(ui_Copy._category, category)
      category:SetIgnore(true)
      -- DECOMPILER ERROR at PC40: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((ui.topList)[index])._category = category
    end
    category:SetShow(true)
    local nextArrow = ((ui.topList)[index])._nextArrow
    if nextArrow == nil then
      nextArrow = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Knowledge_List, "Static_NextArrow_" .. index)
      CopyBaseProperty(ui_Copy._nextArrow, nextArrow)
      nextArrow:SetIgnore(true)
      -- DECOMPILER ERROR at PC71: Confused about usage of register: R7 in 'UnsetPending'

      ;
      ((ui.topList)[index])._nextArrow = nextArrow
    end
    nextArrow:SetShow(count - 1 ~= index)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local createAndUpdateCircle = function(inputData)
  -- function num : 0_6
  if inputData.circleLineRadius <= 0 then
    return 
  end
  local lineDataBuffer = nil
  do
    if inputData.circleKey == -1 then
      local colorCore = float4(1, 1, 1, 0.8 * inputData.lineAlpha)
      inputData.circleKey = insertCircleLine(inputData.lineCategory, float3(0, 0, 0), colorCore, inputData.circleLineRadius, 2, inputData.coreInteractionLineOrder)
      lineDataBuffer = getLine(inputData.lineCategory, inputData.circleKey, inputData.coreInteractionLineOrder)
      lineDataBuffer._isGlowLine = true
      lineDataBuffer._colorGlow = float4(0.65, 0.8, 1, 0.8 * inputData.lineAlpha)
      lineDataBuffer._lineWidthGlow = 20
    end
    if lineDataBuffer == nil then
      lineDataBuffer = getLine(inputData.lineCategory, inputData.circleKey, inputData.coreInteractionLineOrder)
    end
    if lineDataBuffer ~= nil then
      lineDataBuffer._position = inputData.position
      lineDataBuffer._scale = float3(inputData.circleLineRadius, inputData.circleLineRadius, inputData.circleLineRadius)
      -- DECOMPILER ERROR at PC66: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (lineDataBuffer._color).w = inputData.constAlphaCore * inputData.lineAlpha
      -- DECOMPILER ERROR at PC71: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (lineDataBuffer._colorGlow).w = inputData.constAlphaAura * inputData.lineAlpha
    end
  end
end

local insertCircleLineAndObject = function(zodiacSignStaticStatusWrapper)
  -- function num : 0_7 , upvalues : zodiacInfo
  (uiConst.info_Zodiac):ChangeTextureInfoName(zodiacSignStaticStatusWrapper:getZodiacImagePath())
  local defaultPosX = (uiConst.info_Zodiac):GetParentPosX() + (uiConst.info_Zodiac):GetSizeX() / 2
  local defaultPosY = (uiConst.info_Zodiac):GetParentPosY() + (uiConst.info_Zodiac):GetSizeY() / 2
  local percents = 0.45
  local uiScale = (ToClient_getGameOptionControllerWrapper()):getUIScale()
  local lineCount = zodiacSignStaticStatusWrapper:getLineListCount()
  local maxPointX = (zodiacSignStaticStatusWrapper:getLineFirstPointByIndex(0)).x
  local maxPointY = (zodiacSignStaticStatusWrapper:getLineFirstPointByIndex(0)).y
  local minPointX = (zodiacSignStaticStatusWrapper:getLineFirstPointByIndex(0)).x
  local minPointY = (zodiacSignStaticStatusWrapper:getLineFirstPointByIndex(0)).y
  for index = 0, lineCount - 1 do
    local fromPos = zodiacSignStaticStatusWrapper:getLineFirstPointByIndex(index)
    local toPos = zodiacSignStaticStatusWrapper:getLineSecondPointByIndex(index)
    maxPointX = (math.max)(maxPointX, fromPos.x)
    maxPointY = (math.max)(maxPointY, fromPos.y)
    minPointX = (math.min)(minPointX, fromPos.x)
    minPointY = (math.min)(minPointY, fromPos.y)
    maxPointX = (math.max)(maxPointX, toPos.x)
    maxPointY = (math.max)(maxPointY, toPos.y)
    minPointX = (math.min)(minPointX, toPos.x)
    minPointY = (math.min)(minPointY, toPos.y)
  end
  local centerX = (maxPointX + minPointX) / 2
  local centerY = (maxPointY + minPointY) / 2
  for index = 0, lineCount - 1 do
    local fromPos = zodiacSignStaticStatusWrapper:getLineFirstPointByIndex(index)
    local toPos = zodiacSignStaticStatusWrapper:getLineSecondPointByIndex(index)
    local vecX = fromPos.x - centerX
    local vecY = fromPos.y - centerY
    local lenth = (math.sqrt)(vecX * vecX + vecY * vecY)
    local normalVecX = vecX / lenth
    local normalVecY = vecY / lenth
    fromPos.x = centerX + normalVecX * lenth * uiScale
    fromPos.y = centerY + normalVecY * lenth * uiScale
    vecX = toPos.x - centerX
    vecY = toPos.y - centerY
    lenth = (math.sqrt)((vecX) * (vecX) + (vecY) * (vecY))
    normalVecX = (vecX) / lenth
    normalVecY = (vecY) / lenth
    toPos.x = centerX + normalVecX * lenth * uiScale
    toPos.y = centerY + normalVecY * lenth * uiScale
    fromPos.x = fromPos.x * percents + defaultPosX * uiScale
    fromPos.y = fromPos.y * percents + defaultPosY * uiScale
    toPos.x = toPos.x * percents + defaultPosX * uiScale
    toPos.y = toPos.y * percents + defaultPosY * uiScale
    -- DECOMPILER ERROR at PC198: Confused about usage of register: R23 in 'UnsetPending'

    ;
    (zodiacInfo.lineKeyList)[index] = insertLine(zodiacInfo.category, fromPos, toPos, zodiacInfo.color, zodiacInfo.width * uiScale, zodiacInfo.zOrder)
    local lineData = getLine(zodiacInfo.category, (zodiacInfo.lineKeyList)[index], zodiacInfo.zOrder)
    lineData._isScreenDemension = true
    lineData._isGlowLine = true
    lineData._colorGlow = zodiacInfo.colorBG
    lineData._lineWidthGlow = zodiacInfo.widthBG
    lineData:setLinePointRadius(0, 12)
    lineData:setLinePointRadius(2, 12)
    lineData:setLinePointColor(0, zodiacInfo.colorFG)
    lineData:setLinePointColor(2, zodiacInfo.colorFG)
  end
end

local removeMainControls = function()
  -- function num : 0_8 , upvalues : ui
  for key,value in pairs(ui.mainGroup) do
    (value._gaugeBG):SetShow(false)
  end
end

local removeCurrentControls = function()
  -- function num : 0_9 , upvalues : ui
  for key,value in pairs(ui.currentGroup) do
    (value._gaugeBG):SetShow(false)
  end
end

local removeCardControls = function()
  -- function num : 0_10 , upvalues : ui
  for key,value in pairs(ui.cardGroup) do
    (value._cardIcon):SetShow(false)
  end
end

local removeTopListControls = function()
  -- function num : 0_11 , upvalues : ui
  for key,value in pairs(ui.topList) do
    (value._category):SetShow(false)
    ;
    (value._nextArrow):SetShow(false)
  end
end

local removeCircle = function(inputData)
  -- function num : 0_12
  if inputData.circleKey ~= -1 then
    deleteLine(inputData.lineCategory, inputData.circleKey, inputData.coreInteractionLineOrder)
    inputData.circleKey = -1
  end
  isChanged = false
end

local clearZodiacLine = function()
  -- function num : 0_13 , upvalues : zodiacInfo
  for key,value in pairs(zodiacInfo.lineKeyList) do
    deleteLine(zodiacInfo.category, value, zodiacInfo.zOrder)
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

  zodiacInfo.lineKeyList = {}
end

local settingUIMainGroup = function(isFullUpdate)
  -- function num : 0_14 , upvalues : ui, circularColorValue, rotateValue, radiusValue
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childCount = knowledge:getMainKnowledgeCount()
  local visibleChildCount = childCount
  for index,value in pairs(ui.mainGroup) do
    local mentalCardKeyRaw = knowledge:getMainKnowledgeKeyByIndex(index)
    if circularColorValue[mentalCardKeyRaw] == nil then
      visibleChildCount = visibleChildCount - 1
      if visibleChildCount <= 0 then
        return 
      end
    end
  end
  local discountIndex = 0
  for index = 0, childCount - 1 do
    local value = (ui.mainGroup)[index]
    if value ~= nil then
      local mentalCardKeyRaw = knowledge:getMainKnowledgeKeyByIndex(index)
      local mentalObject = knowledge:getThemeByKeyRaw(mentalCardKeyRaw)
      if circularColorValue[mentalCardKeyRaw] ~= nil then
        if isFullUpdate then
          (value._gauge):SetColor(circularColorValue[mentalCardKeyRaw])
          ;
          (value._gauge):SetProgressRate(mentalObject:getCardCollectPercents())
          ;
          (value._name):SetText(mentalObject:getName())
        end
        local pos2d = knowledge:getElementaPos2dByPlayerPos(rotateValue + index - discountIndex, visibleChildCount, radiusValue)
        ;
        (value._gaugeBG):SetDepth(-pos2d.z)
        local zOrder = (math.min)((math.max)(pos2d.z, 0), 1)
        ;
        (value._gaugeBG):SetScale(zOrder, zOrder)
        ;
        (value._icon):SetScale(zOrder, zOrder)
        ;
        (value._gauge):SetScale(zOrder, zOrder)
        ;
        (value._name):SetScale(zOrder, zOrder)
        ;
        (value._gaugeBG):SetPosX(pos2d.x - (value._gaugeBG):GetSizeX() / 2)
        ;
        (value._gaugeBG):SetPosY(pos2d.y - (value._gaugeBG):GetSizeY() / 2)
      else
        do
          do
            discountIndex = discountIndex + 1
            ;
            (value._gaugeBG):SetShow(false)
            -- DECOMPILER ERROR at PC129: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC129: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC129: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC129: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC129: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end

local settingUICurrentGroup = function(isFullUpdate)
  -- function num : 0_15 , upvalues : ui, rotateValue, radiusValue
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childCount = knowledge:getCurrentThemeChildThemeCount()
  for index,value in pairs(ui.currentGroup) do
    if (value._gaugeBG):GetShow() then
      if isFullUpdate then
        local mentalCardKeyRaw = knowledge:getCurrentThemeChildThemeKeyByIndex(index)
        local mentalObject = knowledge:getThemeByKeyRaw(mentalCardKeyRaw)
        ;
        (value._gauge):SetProgressRate(mentalObject:getCardCollectPercents())
        ;
        (value._name):SetText(mentalObject:getName())
      end
      do
        local pos2d = knowledge:getElementaPos2dByPlayerPos(rotateValue + index, childCount, radiusValue)
        ;
        (value._gaugeBG):SetDepth(-pos2d.z)
        do
          local zOrder = (math.min)((math.max)(pos2d.z, 0), 1)
          ;
          (value._gaugeBG):SetScale(zOrder, zOrder)
          ;
          (value._gauge):SetColor((Defines.Color).C_FF00C2EA)
          ;
          (value._gauge):SetScale(zOrder, zOrder)
          ;
          (value._icon):SetScale(zOrder, zOrder)
          ;
          (value._normal):SetScale(zOrder, zOrder)
          ;
          (value._name):SetScale(zOrder, zOrder)
          ;
          (value._normal):SetShow(false)
          ;
          (value._gaugeBG):SetPosX(pos2d.x - (value._gaugeBG):GetSizeX() / 2)
          ;
          (value._gaugeBG):SetPosY(pos2d.y - (value._gaugeBG):GetSizeY() / 2)
          -- DECOMPILER ERROR at PC109: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC109: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC109: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

local settingUIMainCard = function(isFullupdate)
  -- function num : 0_16 , upvalues : rotateValue, radiusValue, ui
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local currentTheme = knowledge:getCurrentTheme()
  local childCardCount = currentTheme:getChildCardCount()
  for index = 0, childCardCount - 1 do
    local card = currentTheme:getChildCardByIndex(index)
    local pos2d = knowledge:getElementaPos2dByPlayerPos(rotateValue + index, childCardCount, radiusValue)
    if isFullupdate then
      (((ui.cardGroup)[index])._cardIcon):SetText(card:getName())
      ;
      (((ui.cardGroup)[index])._cardIcon):ChangeTextureInfoName(card:getPicture())
    end
    ;
    (((ui.cardGroup)[index])._cardIcon):SetDepth(-pos2d.z)
    local zOrder = (math.min)((math.max)(pos2d.z, 0), 1)
    ;
    (((ui.cardGroup)[index])._cardIcon):SetScale(zOrder, zOrder)
    ;
    (((ui.cardGroup)[index])._cardIcon):SetPosX(pos2d.x - (((ui.cardGroup)[index])._cardIcon):GetSizeX() / 2)
    ;
    (((ui.cardGroup)[index])._cardIcon):SetPosY(pos2d.y - (((ui.cardGroup)[index])._cardIcon):GetSizeY() / 2)
    ;
    (((ui.cardGroup)[index])._cardIcon):SetDepth(9999)
  end
  ;
  (uiConst.main):SetDepthSort()
  ;
  (uiConst.main_Hint):SetDepth(0)
end

local settingToFirstButton = function()
  -- function num : 0_17
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local pos2d = knowledge:getPlayerPos2d(float3(0, -100, 0))
  pos2d.x = 350
  ;
  (uiConst.main_Top):SetPosX(pos2d.x - (uiConst.main_Top):GetSizeX() / 2)
  ;
  (uiConst.main_Top):SetPosY(pos2d.y - (uiConst.main_Top):GetSizeY() / 2 + 180)
  ;
  (uiConst.main_WhosKnowledge):SetPosX(pos2d.x - (uiConst.main_WhosKnowledge):GetSizeX() / 2)
  ;
  (uiConst.main_WhosKnowledge):SetPosY((uiConst.main_Top):GetPosY() - (uiConst.main_WhosKnowledge):GetSizeY())
  ;
  (uiConst.main_WhosKnowledge):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Knowledge_OfKnowledge", "name", (getSelfPlayer()):getName()))
end

local settingUIListIcon = function(progressCount)
  -- function num : 0_18 , upvalues : uiListControlByKey, constValue
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  for _,value in pairs(uiListControlByKey) do
    value:SetShow(false)
  end
  local posX = constValue.listIconLeft
  for index = 0, progressCount - 1 do
    local mentalCardKeyRaw = knowledge:getMainKnowledgeKeyByIndex(index)
    local mentalObject = knowledge:getThemeByKeyRaw(mentalCardKeyRaw)
    local targetUIList = uiListControlByKey[mentalCardKeyRaw]
    if targetUIList ~= nil then
      targetUIList:SetShow(true)
      targetUIList:SetPosX(posX)
      posX = posX + targetUIList:GetSizeX()
    end
  end
end

local settingUIListTree = function()
  -- function num : 0_19 , upvalues : circularColorValue
  (uiConst.list_Tree):ClearTree()
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local mainTopTheme = knowledge:getMainTheme()
  local childThemeCount = mainTopTheme:getChildThemeCount()
  for index = 0, childThemeCount - 1 do
    local theme = mainTopTheme:getChildThemeByIndex(index)
    local mentalCardKeyRaw = theme:getKey()
    if circularColorValue[mentalCardKeyRaw] ~= nil then
      Panel_Knowledge_AddItemTree(nil, theme)
    end
  end
  ;
  (uiConst.list_Tree):RefreshOpenList()
end

local settingListTopLine = function()
  -- function num : 0_20 , upvalues : removeTopListControls, createTopListControls, ui
  local nameList = (Array.new)()
  local treeItem = (uiConst.list_Tree):GetSelectItem()
  while treeItem ~= nil do
    nameList:push_back(treeItem:GetText())
    treeItem = treeItem:getParent()
  end
  local count = #nameList
  removeTopListControls()
  local leftValue = 20
  local drawCount = count
  if count > 2 then
    drawCount = 2
  end
  createTopListControls(drawCount)
  local index = 0
  local endIndex = count - 1
  if endIndex < 1 then
    endIndex = 1
  end
  for rindex = count, endIndex, -1 do
    (((ui.topList)[index])._category):SetText(nameList[rindex])
    ;
    (((ui.topList)[index])._category):SetPosX(leftValue)
    ;
    (((ui.topList)[index])._category):SetSize((((ui.topList)[index])._category):GetTextSizeX(), (((ui.topList)[index])._category):GetSizeY())
    leftValue = leftValue + (((ui.topList)[index])._category):GetSizeX()
    ;
    (((ui.topList)[index])._nextArrow):SetPosX(leftValue)
    leftValue = leftValue + (((ui.topList)[index])._nextArrow):GetSizeX()
    index = index + 1
  end
end

local settingCardInfo = function()
  -- function num : 0_21 , upvalues : clearZodiacLine, UI_TM, insertCircleLineAndObject, constValue
  (uiConst.info):SetShow(false)
  clearZodiacLine()
  local selectItem = (uiConst.list_Tree):GetSelectItem()
  if selectItem == nil then
    return 
  end
  local mentalObjectKey = selectItem:GetKey()
  if mentalObjectKey <= 0 then
    return 
  end
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local card = knowledge:getCardByKeyRaw(mentalObjectKey)
  if card:hasCard() == false then
    (uiConst.info_Picture):ChangeTextureInfoName(card:getPicture())
    ;
    (uiConst.info_Name):SetText(card:getName())
    ;
    (uiConst.info_Zodiac):SetShow(false)
    ;
    (uiConst.info_zodiacName):SetShow(false)
    ;
    (uiConst.info_NpcInt):SetShow(false)
    ;
    (uiConst.info_NpcValue):SetShow(false)
    ;
    (uiConst.info_NpcInterest):SetShow(false)
    ;
    (uiConst.info_npcInfoBG):SetShow(false)
    ;
    (uiConst.info_Story):SetShow(false)
    ;
    (uiConst.info_CardEffect):SetShow(false)
    ;
    (uiConst.info_Interest):SetShow(false)
    ;
    (uiConst.info_Value):SetShow(false)
    ;
    (uiConst.info_InfoBg):SetShow(false)
    ;
    (uiConst.info):SetShow(true)
    return 
  else
    ;
    (uiConst.info_Story):SetShow(true)
    ;
    (uiConst.info_CardEffect):SetShow(true)
    ;
    (uiConst.info_Interest):SetShow(true)
    ;
    (uiConst.info_Value):SetShow(true)
    ;
    (uiConst.info_InfoBg):SetShow(true)
    ;
    (uiConst.info):SetShow(true)
  end
  local npcpersonalityStaticWrapper = card:getNpcPersonalityStaticStatus()
  if npcpersonalityStaticWrapper == nil then
    (uiConst.info_Zodiac):SetShow(false)
    ;
    (uiConst.info_zodiacName):SetShow(false)
    ;
    (uiConst.info_NpcInt):SetShow(false)
    ;
    (uiConst.info_NpcValue):SetShow(false)
    ;
    (uiConst.info_NpcInterest):SetShow(false)
    ;
    (uiConst.info_npcInfoBG):SetShow(false)
  else
    ;
    (uiConst.info_Zodiac):SetShow(true)
    ;
    (uiConst.info_zodiacName):SetShow(true)
    ;
    (uiConst.info_zodiacName):SetText(npcpersonalityStaticWrapper:getZodiacName())
    local favoritedList = ""
    local isFirst = true
    local count = npcpersonalityStaticWrapper:getFavoritedThemeCount()
    for index = 0, count - 1 do
      local favoritedName = npcpersonalityStaticWrapper:getFavoritedThemeNameByIndex(index)
      if isFirst then
        favoritedList = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Knowledge_FavoritedList", "favoritedName", favoritedName)
        isFirst = false
      else
        favoritedList = favoritedList .. "," .. favoritedName
      end
    end
    ;
    (uiConst.info_NpcInterest):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (uiConst.info_NpcInterest):SetText(favoritedList)
    ;
    (uiConst.info_npcInfoBG):SetSize(350, (uiConst.info_NpcInterest):GetTextSizeY() + 35)
    local npcPersonalityStatic = npcpersonalityStaticWrapper:get()
    ;
    (uiConst.info_NpcInt):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_DEMANDINGINTERESTING") .. " : " .. npcPersonalityStatic._minDv .. "~" .. npcPersonalityStatic._maxDv)
    ;
    (uiConst.info_NpcValue):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_DEMANDINGFAVOR") .. " : " .. npcPersonalityStatic._minPv .. "~" .. npcPersonalityStatic._maxPv)
    ;
    (uiConst.info_NpcInt):SetShow(true)
    ;
    (uiConst.info_NpcValue):SetShow(true)
    ;
    (uiConst.info_NpcInterest):SetShow(true)
    ;
    (uiConst.info_npcInfoBG):SetShow(true)
    ;
    (uiConst.info_NpcInt):ComputePos()
    ;
    (uiConst.info_NpcValue):ComputePos()
    clearZodiacLine()
    insertCircleLineAndObject((npcpersonalityStaticWrapper:getZodiacOrderStaticStatusWrapper()):getZodiacSignStaticStatusWrapper())
  end
  do
    ;
    (uiConst.info_Picture):ChangeTextureInfoName(card:getPicture())
    ;
    (uiConst.info_Name):SetText(card:getName())
    ;
    (uiConst.info_Story):SetText(card:getDescription())
    ;
    (uiConst.info_Story):setLocalizedKey(card:getDescriptionLocalizedKey())
    ;
    (uiConst.info_Story):SetIgnore(false)
    local buffText = PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFF_EMPTY")
    if card:isBuff() then
      if card:getApplyTurn() == 0 then
        if card:getBuffType() < 2 then
          buffText = PAGetStringParam3(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_1_UP", "buff", (constValue.buffTypeString)[card:getBuffType()], "turn", tostring(card:getValidTurn()), "value", tostring(card:getVariedValue()))
        else
          buffText = PAGetStringParam3(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_1_DOWN", "buff", (constValue.buffTypeString)[card:getBuffType()], "turn", tostring(card:getValidTurn()), "value", tostring(card:getVariedValue()))
        end
      else
        if card:getBuffType() < 2 then
          buffText = PAGetStringParam4(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_ANY_UP", "count", tostring(card:getApplyTurn() + 1), "buff", (constValue.buffTypeString)[card:getBuffType()], "turn", tostring(card:getValidTurn()), "value", tostring(card:getVariedValue()))
        else
          buffText = PAGetStringParam4(Defines.StringSheet_GAME, "MENTALGAME_BUFF_MESSAGE_ANY_DOWN", "count", tostring(card:getApplyTurn() + 1), "buff", (constValue.buffTypeString)[card:getBuffType()], "turn", tostring(card:getValidTurn()), "value", tostring(card:getVariedValue()))
        end
      end
    end
    ;
    (uiConst.info_CardEffect):SetText(buffText)
    ;
    (uiConst.info_Interest):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_INTERESTING") .. " : " .. card:getHit())
    ;
    (uiConst.info_Value):SetText(PAGetString(Defines.StringSheet_GAME, "MENTALGAME_BUFFTYPE_FAVOR") .. " : " .. card:getMinDd() .. "~" .. card:getMaxDd())
    local ySize = 0
    local sizeYInfo_Picture = 360
    local sizeYInfo_Story = (uiConst.info_Story):GetSizeY()
    local sizeYInfo_InfoBg = (uiConst.info_InfoBg):GetSizeY()
    local sizeYList_Panel = (uiConst.list):GetSizeY()
    if getScreenSizeY() < sizeYInfo_Picture + sizeYInfo_Story + sizeYInfo_InfoBg + sizeYList_Panel then
      local pictureSize = getScreenSizeY() - (sizeYInfo_Story + sizeYInfo_InfoBg + sizeYList_Panel)
      ;
      (uiConst.info_Picture):SetSize(pictureSize, pictureSize)
      ;
      (uiConst.info_Picture):SetPosX((uiConst.info_Name):GetPosX() + (uiConst.info_Name):GetSizeX() / 2 - (uiConst.info_Picture):GetSizeX() / 2)
      ;
      (uiConst.info_Story):SetPosY((uiConst.info_Picture):GetPosY() + (uiConst.info_Picture):GetSizeY() * 0.9)
      ;
      (uiConst.info_InfoBg):SetPosY((uiConst.info_Story):GetPosY() + (uiConst.info_Story):GetSizeY())
      ;
      (uiConst.info_Zodiac):SetPosY((uiConst.info_Picture):GetPosY() + (uiConst.info_Picture):GetSizeY() * 2 / 3 - (uiConst.info_Zodiac):GetSizeY() / 2)
      ;
      (uiConst.info_zodiacName):SetPosY((uiConst.info_Zodiac):GetPosY() + (uiConst.info_Zodiac):GetSizeY() * 3 / 4 - (uiConst.info_zodiacName):GetSizeY())
    else
      do
        Panel_Knowledge_Info:SetSize(Panel_Knowledge_Info:GetSizeX(), getScreenSizeY() - Panel_Knowledge_List:GetSizeY() - 10)
        Panel_Knowledge_Info:ComputePos()
        ;
        (uiConst.info_Picture):SetSize(360, 360)
        ;
        (uiConst.info_Picture):ComputePos()
        ;
        (uiConst.info_Story):ComputePos()
        ;
        (uiConst.info_InfoBg):ComputePos()
        audioPostEvent_SystemUi(5, 0)
        ;
        (uiConst.info):SetShow(true)
      end
    end
  end
end

local settingTheme = function()
  -- function num : 0_22
  local selectItem = (uiConst.list_Tree):GetSelectItem()
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  if selectItem == nil then
    knowledge:setCurrentTheme(knowledge:getMainTheme())
    return 
  end
  local mentalObjectKey = selectItem:GetKey()
  if mentalObjectKey == 0 then
    return 
  end
  if mentalObjectKey < 0 then
    local theme = knowledge:getThemeByKeyRaw(-mentalObjectKey)
    if theme == nil then
      return 
    end
    knowledge:setCurrentTheme(theme)
  else
    do
      local card = knowledge:getCardByKeyRaw(mentalObjectKey)
      knowledge:setCurrentThemeByCard(card)
    end
  end
end

local settingForNextTheme = function()
  -- function num : 0_23 , upvalues : radiusResultValue, rotateValue, rotateResultValue
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  radiusResultValue = 0
  rotateValue = 0
  rotateResultValue = knowledge:getCurrentThemeChildThemeCount()
  if rotateResultValue == 0 then
    rotateResultValue = knowledge:getCurrentThemeChildCardCount()
  end
end

local inputData = {lineCategory = "InstantLine_HumanRelation", lineAlpha = 1, circleLineRadius = 150, isChanged = false, circleKey = -1, intimacyKey = -1, coreInteractionLineOrder = 10, constAlphaAura = 0.2, constAlphaCore = 0.7, position = float3(0, 0, 0)}
local settingCircleInputData = function()
  -- function num : 0_24 , upvalues : inputData, radiusValue
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local targetPos = knowledge:getCameraTargetPos()
  targetPos.y = targetPos.y + 30
  do
    local isChangedPos = inputData.position ~= targetPos
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

    inputData.position = targetPos
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R3 in 'UnsetPending'

    inputData.circleLineRadius = radiusValue
    do return isChangedPos end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

local UIMode = Defines.UIMode
local onShowLoadControls = function()
  -- function num : 0_25 , upvalues : rotateResultValue, rotateValue, radiusValue, radiusResultValue, UIMode, renderMode, createMainControls, settingUIMainGroup, settingUIListTree, settingUIListIcon, settingCardInfo
  ToClient_SaveUiInfo(false)
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local mainKnowledgeCount = knowledge:getMainKnowledgeCount()
  rotateResultValue = 0
  rotateValue = 0
  radiusValue = 0
  radiusResultValue = 100
  SetUIMode(UIMode.eUIMode_Mental)
  renderMode:set()
  ;
  (uiConst.main):SetShow(true)
  ;
  (uiConst.main):SetIgnore(false)
  createMainControls(mainKnowledgeCount)
  settingUIMainGroup(true)
  settingUIListTree()
  ;
  (uiConst.list):SetShow(true)
  settingUIListIcon(mainKnowledgeCount)
  settingCardInfo()
end

local onHideCloseControls = function()
  -- function num : 0_26 , upvalues : UIMode, renderMode, removeMainControls, removeCurrentControls, removeCardControls, removeCircle, inputData, clearZodiacLine
  SetUIMode(UIMode.eUIMode_Default)
  renderMode:reset()
  ;
  (uiConst.main):SetShow(false)
  removeMainControls()
  removeCurrentControls()
  removeCardControls()
  ;
  (uiConst.list):SetShow(false)
  ;
  (uiConst.list_Edit):SetEditText("")
  ;
  (uiConst.list_Tree):SetFilterString("")
  ;
  (uiConst.info):SetShow(false)
  removeCircle(inputData)
  clearZodiacLine()
  if Panel_Knowledge_CheckCurrentUiEdit(GetFocusEdit()) then
    Panel_Knowledge_OutInputMode()
  end
end

local updateMainUI = function()
  -- function num : 0_27 , upvalues : removeMainControls, removeCurrentControls, removeCardControls, createMainControls, settingUIMainGroup, createCurrentControls, createCardControls, settingUICurrentGroup, settingUIMainCard, settingListTopLine, settingCardInfo
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  removeMainControls()
  removeCurrentControls()
  removeCardControls()
  if (knowledge:getCurrentTheme()):getKey() == (knowledge:getMainTheme()):getKey() then
    createMainControls(knowledge:getMainKnowledgeCount())
    settingUIMainGroup(true)
  else
    local theme = knowledge:getCurrentTheme()
    createCurrentControls(theme:getChildThemeCount())
    createCardControls(theme:getChildCardCount())
    settingUICurrentGroup(true)
    settingUIMainCard(true)
  end
  do
    settingListTopLine()
    settingCardInfo()
  end
end

local _cardKeyRaw = nil
Panel_Knowledge_Show = function()
  -- function num : 0_28 , upvalues : IM, onShowLoadControls, _cardKeyRaw
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEOPENALERT_INDEAD"))
    return 
  end
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  if knowledge:isShow() or GetUIMode() ~= (Defines.UIMode).eUIMode_Default then
    return 
  end
  if selfPlayerIsInCompetitionArea() then
    return 
  end
  audioPostEvent_SystemUi(1, 32)
  local isShowable = knowledge:show()
  if isShowable == false then
    return 
  end
  if Panel_Win_System:GetShow() then
    allClearMessageData()
  end
  UIMain_KnowledgeUpdateRemove()
  ;
  (uiConst.list_GetKnowledgeCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_KNOWLEDGE_MAIN_GETKNOWLEDGECOUNT", "count", ToClient_GetTotalMentalCardCount()))
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  onShowLoadControls()
  if _cardKeyRaw ~= FGlobal_CardKeyReturn() then
    _cardKeyRaw = FGlobal_CardKeyReturn()
    Panel_Knowledge_SelectAnotherCard(_cardKeyRaw)
  end
end

Panel_Knowledge_Hide = function()
  -- function num : 0_29 , upvalues : IM, onHideCloseControls
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  if knowledge:isShow() == false then
    return 
  end
  if (UI.isGameOptionMouseMode)() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
  end
  audioPostEvent_SystemUi(1, 33)
  knowledge:hide()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
  onHideCloseControls()
  PackageIconPosition()
end

Panel_Knowledge_ShowHint = function(index)
  -- function num : 0_30 , upvalues : ui, UI_TM
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local mentalCardKeyRaw = knowledge:getCurrentThemeChildCardKeyByIndex(index)
  local card = knowledge:getCardByKeyRaw(mentalCardKeyRaw)
  local cardIcon = ((ui.cardGroup)[index])._cardIcon
  if card:hasCard() == false then
    if (string.len)(card:getKeyword()) == 0 then
      (uiConst.main_Hint):SetShow(false)
    else
      ;
      (uiConst.main_Hint):SetAutoResize(true)
      ;
      (uiConst.main_Hint):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (uiConst.main_Hint):SetText(card:getKeyword())
      ;
      (uiConst.main_Hint):SetSize((uiConst.main_Hint):GetSizeX(), (uiConst.main_Hint):GetSizeY() + 25)
      ;
      (uiConst.main_Hint):SetPosX(cardIcon:GetPosX() - ((uiConst.main_Hint):GetSizeX() - cardIcon:GetSizeX()) / 2)
      ;
      (uiConst.main_Hint):SetPosY(cardIcon:GetPosY() - 40)
      ;
      (uiConst.main_Hint):SetShow(true)
    end
  end
end

Panel_Knowledge_HideHint = function()
  -- function num : 0_31
  (uiConst.main_Hint):SetShow(false)
  ;
  (uiConst.list_Hint):SetShow(false)
end

Panel_Knowledge_ShowHint_byList = function()
  -- function num : 0_32 , upvalues : UI_TM
  local isUiMode = (CppEnums.EProcessorInputMode).eProcessorInputMode_UiModeNotInput == getInputMode()
  local index = (uiConst.list_Tree):GetOverItemKey()
  if index < 0 or isUiMode == false then
    (uiConst.list_Hint):SetShow(false)
    return 
  end
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  do
    local card = knowledge:getCardByKeyRaw(index)
    if card ~= nil then
      if card:hasCard() == false then
        if (string.len)(card:getKeyword()) == 0 then
          (uiConst.list_Hint):SetShow(false)
        else
          (uiConst.list_Hint):SetAutoResize(true)
          ;
          (uiConst.list_Hint):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (uiConst.list_Hint):SetText(card:getKeyword())
          ;
          (uiConst.list_Hint):SetSize((uiConst.list_Hint):GetSizeX(), (uiConst.list_Hint):GetSizeY() + 25)
          ;
          (uiConst.list_Hint):SetPosX((uiConst.list_Tree):GetPosX() - (uiConst.list_Hint):GetSizeX() - 5)
          ;
          (uiConst.list_Hint):SetPosY((uiConst.list_Tree):GetPosY() + (uiConst.list_Hint):GetSizeY() / 2)
          ;
          (uiConst.list_Hint):SetShow(true)
        end
      else
        (uiConst.list_Hint):SetShow(false)
      end
    end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

;
(uiConst.main):addInputEvent("Mouse_DownScroll", "Panel_Knowledge_RotateValueUpdate(true)")
;
(uiConst.main):addInputEvent("Mouse_UpScroll", "Panel_Knowledge_RotateValueUpdate(false)")
;
(uiConst.main):RegisterUpdateFunc("Panel_Knowledge_UpdatePerFrame")
;
(uiConst.list_Tree):addInputEvent("Mouse_LUp", "Panel_Knowledge_SelectElement()")
;
(uiConst.list_Tree):addInputEvent("Mouse_On", "Panel_Knowledge_ShowHint_byList()")
;
(uiConst.list_Tree):addInputEvent("Mouse_Out", "Panel_Knowledge_HideHint()")
;
(uiConst.list):RegisterUpdateFunc("Panel_Knowledge_OverBarUpdatePerFrame")
;
(uiConst.main_Top):addInputEvent("Mouse_LUp", "Panel_Knowledge_GotoParents()")
;
(uiConst.list_Edit):addInputEvent("Mouse_LDown", "Panel_Knowledge_OnInputMode()")
;
(uiConst.list_Edit):addInputEvent("Mouse_LUp", "Panel_Knowledge_OnInputMode()")
;
(uiConst.list_FindList):addInputEvent("Mouse_LUp", "Panel_Knowledge_OutInputMode(true)")
;
(uiConst.list_Edit):RegistReturnKeyEvent("Panel_Knowledge_OutInputMode( true )")
Panel_Knowledge_OverBarUpdatePerFrame = function(deltaTime)
  -- function num : 0_33
  Panel_Knowledge_ShowHint_byList()
end

Panel_Knowledge_OnLPressStart = function()
  -- function num : 0_34
  inputModeManageMove(true)
end

Panel_Knowledge_OnLPressEnd = function()
  -- function num : 0_35
  inputModeManageMove(false)
end

Panel_Knowledge_OnRPressStart = function()
  -- function num : 0_36
  inputModeManageRotate(true)
end

Panel_Knowledge_OnRPressEnd = function()
  -- function num : 0_37
  inputModeManageRotate(false)
end

Panel_Knowledge_SelectElement = function()
  -- function num : 0_38 , upvalues : settingForNextTheme, updateMainUI
  local selectItem = (uiConst.list_Tree):GetSelectItem()
  if selectItem == nil then
    return 
  end
  local mentalObjectKey = selectItem:GetKey()
  if mentalObjectKey == 0 then
    return 
  end
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  if mentalObjectKey < 0 then
    local theme = knowledge:getThemeByKeyRaw(-mentalObjectKey)
    if theme == nil then
      return 
    end
    settingForNextTheme()
  else
    do
      local card = knowledge:getCardByKeyRaw(mentalObjectKey)
      if card:getParents() ~= nil and (knowledge:getCurrentTheme()):getKey() == (card:getParents()):getKey() then
        updateMainUI()
      else
        settingForNextTheme()
      end
    end
  end
end

Panel_Knowledge_GotoRoot = function()
  -- function num : 0_39
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  knowledge:setCurrentTheme(knowledge:getMainTheme())
  ;
  (uiConst.list_Tree):RefreshOpenList()
end

Panel_Knowledge_GotoParents = function()
  -- function num : 0_40 , upvalues : settingForNextTheme
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local theme = knowledge:getCurrentTheme()
  if theme == nil then
    return 
  end
  local parentsTheme = theme:getParents()
  if parentsTheme == nil then
    return 
  end
  if parentsTheme:getKey() == (knowledge:getMainTheme()):getKey() then
    (uiConst.list_Tree):ResetSelectItem()
  else
    ;
    (uiConst.list_Tree):SetSelectItemByKey(-parentsTheme:getKey())
  end
  settingForNextTheme()
end

Panel_Knowledge_SelectMainUI = function(index)
  -- function num : 0_41 , upvalues : settingForNextTheme
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local theme = knowledge:getCurrentTheme()
  local childTheme = theme:getChildThemeByIndex(index)
  if childTheme == nil then
    return 
  end
  ;
  (uiConst.list_Tree):SetSelectItemByKey(-childTheme:getKey())
  settingForNextTheme()
end

Panel_Knowledge_SelectMainUICard = function(index)
  -- function num : 0_42 , upvalues : updateMainUI, ui
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local theme = knowledge:getCurrentTheme()
  local childCard = theme:getChildCardByIndex(index)
  ;
  (uiConst.list_Tree):SetSelectItemByKey(childCard:getKey())
  updateMainUI()
  ;
  (((ui.cardGroup)[index])._cardIcon):EraseAllEffect()
  ;
  (((ui.cardGroup)[index])._cardIcon):AddEffect("fUI_SkillButton01", false, 0, 0)
  ;
  (((ui.cardGroup)[index])._cardIcon):AddEffect("UI_Knowledge_Select01", false, 0, 0)
end

Panel_Knowledge_SelectMainUIByKey = function(themeKeyRaw)
  -- function num : 0_43 , upvalues : settingForNextTheme
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local theme = knowledge:getThemeByKeyRaw(themeKeyRaw)
  if theme == nil then
    return 
  end
  ;
  (uiConst.list_Tree):SetSelectItemByKey(-theme:getKey())
  settingForNextTheme()
end

Panel_Knowledge_SelectAnotherCard = function(cardKeyRaw)
  -- function num : 0_44 , upvalues : settingForNextTheme, updateMainUI
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local childCard = knowledge:getCardByKeyRaw(cardKeyRaw)
  if childCard == nil then
    return 
  end
  local theme = childCard:getParents()
  ;
  (uiConst.list_Tree):SetSelectItemByKey(-theme:getKey())
  settingForNextTheme()
  ;
  (uiConst.list_Tree):SetSelectItemByKey(childCard:getKey())
  updateMainUI()
end

Panel_Knowledge_OnInputMode = function()
  -- function num : 0_45 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetFocusEdit(uiConst.list_Edit)
  ;
  (uiConst.list_Edit):SetEditText("")
end

local filterText = ""
Panel_Knowledge_OutInputMode = function(isApply)
  -- function num : 0_46 , upvalues : IM
  if isApply ~= true then
    (uiConst.list_Edit):SetEditText("")
  end
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ClearFocusEdit()
  ;
  (uiConst.list_Tree):SetFilterString((uiConst.list_Edit):GetEditText())
  ;
  (uiConst.list_Tree):RefreshOpenList()
end

Panel_Knowledge_CheckCurrentUiEdit = function(targetUI)
  -- function num : 0_47
  do return targetUI ~= nil and targetUI:GetKey() == (uiConst.list_Edit):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

Panel_Knowledge_RotateValueUpdate = function(isUp)
  -- function num : 0_48 , upvalues : rotateResultValue
  if isUp then
    rotateResultValue = rotateResultValue + 1
  else
    rotateResultValue = rotateResultValue - 1
  end
end

Panel_Knowledge_UpdatePerFrame = function(deltaTime)
  -- function num : 0_49 , upvalues : rotateResultValue, rotateValue, radiusResultValue, radiusValue, settingTheme, updateMainUI, settingCircleInputData, settingUIMainCard, settingUIMainGroup, settingUICurrentGroup, settingToFirstButton, createAndUpdateCircle, inputData
  local diff = rotateResultValue - rotateValue
  if diff ~= 0 then
    if (math.abs)(diff) < 0.01 then
      rotateValue = rotateResultValue
    else
      local moveRate = deltaTime * 5
      if radiusDiff ~= 0 then
        moveRate = deltaTime * 10
      end
      moveRate = (math.min)(moveRate, 1)
      rotateValue = rotateValue + diff * moveRate
    end
  end
  do
    local radiusDiff = radiusResultValue - radiusValue
    if radiusDiff ~= 0 then
      if (math.abs)(radiusDiff) < 0.01 then
        radiusValue = radiusResultValue
      else
        local absRaiusDiff = (math.abs)(radiusDiff)
        local moveRate = deltaTime * 600
        moveRate = (math.min)(moveRate, absRaiusDiff) * (absRaiusDiff / radiusDiff)
        radiusValue = radiusValue + moveRate
      end
    end
    do
      if radiusValue == 0 then
        settingTheme()
        radiusResultValue = 100
        updateMainUI()
      end
      local isChanged = settingCircleInputData()
      if diff ~= 0 or radiusDiff ~= 0 or isChanged then
        settingUIMainCard(false)
        settingUIMainGroup(false)
        settingUICurrentGroup(false)
        settingToFirstButton()
      end
      createAndUpdateCircle(inputData)
    end
  end
end

registerEvent("onScreenResize", "Panel_Knowledge_ReSizeScreen")
registerEvent("ToClient_MentalKnowlegeViewFirstUpdate", "ToClient_MentalKnowlegeViewFirstUpdate")
Panel_Knowledge_ReSizeScreen = function()
  -- function num : 0_50
  (uiConst.main):SetSize(getScreenSizeX(), getScreenSizeY())
  ;
  (uiConst.main):SetPosX(0)
  ;
  (uiConst.main):SetPosY(0)
  ;
  (uiConst.list):ComputePos()
  ;
  (uiConst.info):ComputePos()
  ;
  (uiConst.list):SetSize((uiConst.list):GetSizeX(), getScreenSizeY() * 0.38)
  ;
  (uiConst.list_ListBg):SetSize((uiConst.list_ListBg):GetSizeX(), (uiConst.list):GetSizeY() - 126)
  ;
  (uiConst.list_Tree):SetSize((uiConst.list_Tree):GetSizeX(), (uiConst.list):GetSizeY() - 126)
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
    (uiConst.list_Tree):SetItemQuantity((uiConst.list_Tree):GetSizeY() / 465 * 18)
    ;
    (uiConst.list_Tree):setAddImagePosY(5)
  else
    ;
    (uiConst.list_Tree):SetItemQuantity((uiConst.list_Tree):GetSizeY() / 465 * 25)
    ;
    (uiConst.list_Tree):setAddImagePosY(2)
  end
  for _,v in pairs(uiConst) do
    v:ComputePos()
  end
  local scrollVertical = (UI.getChildControl)(uiConst.list_Tree, "Tree_1_Scroll")
  scrollVertical:SetSize(scrollVertical:GetSizeX(), (uiConst.list_Tree):GetSizeY())
  scrollVertical:ComputePos()
end

ToClient_MentalKnowlegeViewFirstUpdate = function()
  -- function num : 0_51 , upvalues : settingToFirstButton
  settingToFirstButton()
end

init()
ToClient_setNoHasCardPicture("UI_Artwork/COLLECTED_noBrain.dds")
renderMode:setClosefunctor(renderMode, Panel_Knowledge_Hide)

