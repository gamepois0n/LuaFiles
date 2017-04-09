-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\npcnavigation\npcnavigation.luac 

-- params : ...
-- function num : 0
Panel_NpcNavi:setMaskingChild(true)
Panel_Tooltip_NpcNavigation:setMaskingChild(true)
Panel_NpcNavi:ActiveMouseEventEffect(true)
Panel_NpcNavi:setGlassBackground(true)
local npcNaviText = (UI.getChildControl)(Panel_NpcNavi, "StaticText_npcNaviText")
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local _math_AddVectorToVector = (Util.Math).AddVectorToVector
local _math_MulNumberToVector = (Util.Math).MulNumberToVector
local UILink = {treeView = (UI.getChildControl)(Panel_NpcNavi, "Tree_View"), closeNpcNavi = (UI.getChildControl)(Panel_NpcNavi, "Button_Win_Close"), staticSearchBack = (UI.getChildControl)(Panel_NpcNavi, "StaticSearchBack"), editSearchText = (UI.getChildControl)(Panel_NpcNavi, "EditSearchText"), btnSearch = (UI.getChildControl)(Panel_NpcNavi, "BtnSearch"), textSubject = (UI.getChildControl)(Panel_NpcNavi, "StaticText_Subject"), errorMessage = (UI.getChildControl)(Panel_NpcNavi, "StaticText_ErrorNotice"), tooltip = Panel_Tooltip_NpcNavigation, tooltip_NpcName = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "Tooltip_NpcName"), tooltip_text = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "Tooltip_NpcDescription"), tooltip_itemName = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "StaticText_ItemName"), tooltip_Icon = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "Static_Icon"), tooltip_NeedExplorePoint = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "StaticText_NeedExplorePoint"), tooltip_Description = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "StaticText_Description"), tooltip_NotFind = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "StaticText_NotFound"), tooltip_ProgressBG = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "Static_ProgressBG"), tooltip_CircularProgress = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "CircularProgress_Current"), tooltip_FruitageValue = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "StaticText_Fruitage_Value"), tooltip_GiftIcon = (UI.getChildControl)(Panel_Tooltip_NpcNavigation, "Static_GiftIcon"), initPosX = Panel_NpcNavi:GetPosX(), initPosY = Panel_NpcNavi:GetPosY()}
local resizingGap = {treeGap = Panel_NpcNavi:GetSizeX() - (UILink.treeView):GetSizeX(), tooltipDescExplorePointGap = (UILink.tooltip_NeedExplorePoint):GetPosY() - (UILink.tooltip_Description):GetPosY() - (UILink.tooltip_Description):GetTextSizeY(), tooltipExplorePointPanelGap = Panel_Tooltip_NpcNavigation:GetSizeY() - (UILink.tooltip_NeedExplorePoint):GetPosY() - (UILink.tooltip_NeedExplorePoint):GetTextSizeY()}
local naviDesc = (UI.getChildControl)(Panel_NpcNavi, "StaticText_NpcNavi_Desc")
naviDesc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
naviDesc:SetText(naviDesc:GetText())
local lazyUpdate = false
local overIndex = -1
local selectIndex = -1
local treeGroupData = {}
local preLoadTextureKey = {}
local preLoadTextureKey_territory = {}
local cacheExecuteDialogData = {}
local cachingCharacterData = {}
local filterText = ""
local isMouseOnPanel = false
local isMouseOnTreeView = false
local isFirstUpdate = true
local errorMessageShow = true
local searchGroupShow = function(isShow)
  -- function num : 0_0
end

local isChecked_AddEffect = 0
local isChecked_EffectReset = 0
local initialize = function()
  -- function num : 0_1 , upvalues : UILink, preLoadTextureKey, preLoadTextureKey_territory
  Panel_NpcNavi:SetShow(false, false)
  Panel_Tooltip_NpcNavigation:SetShow(false, false)
  Panel_NpcNavi:SetAlpha(1)
  Panel_NpcNavi:SetIgnore(false)
  Panel_NpcNavi:addInputEvent("Mouse_On", "NpcNavi_ChangeTexture_On()")
  Panel_NpcNavi:addInputEvent("Mouse_Out", "NpcNavi_ChangeTexture_Off()")
  ;
  (UILink.treeView):SetShow(true)
  ;
  (UILink.staticSearchBack):SetShow(true)
  ;
  (UILink.editSearchText):SetShow(true)
  ;
  (UILink.btnSearch):SetShow(true)
  ;
  (UILink.textSubject):SetShow(true)
  ;
  (UILink.errorMessage):SetShow(false)
  ;
  (UILink.closeNpcNavi):SetShow(false)
  Panel_NpcNavi:RegisterUpdateFunc("NpcNavi_OverBarUpdatePerFrame")
  registerEvent("selfPlayer_regionChanged", "NpcListUpdate_selfPlayer_regionChanged")
  registerEvent("EventMentalCardUpdate", "NpcListUpdate_EventMentalCardUpdate")
  registerEvent("EventExplorePointUpdate", "NpcListUpdate_EventExplorePointUpdate")
  registerEvent("onScreenResize", "NpcListUpdate_ScreenResize")
  ;
  (UILink.treeView):addInputEvent("Mouse_LUp", "NpcNavi_DrawLine()")
  ;
  (UILink.treeView):addInputEvent("Mouse_On", "NpcNavi_TreeViewInOut(true)")
  ;
  (UILink.treeView):addInputEvent("Mouse_Out", "NpcNavi_TreeViewInOut(false)")
  ;
  (UILink.btnSearch):addInputEvent("Mouse_LDown", "NpcNavi_SearchBtn()")
  ;
  (UILink.editSearchText):addInputEvent("Mouse_LDown", "NpcNavi_OnInputMode()")
  ;
  (UILink.editSearchText):addInputEvent("Mouse_LUp", "NpcNavi_OnInputMode()")
  ;
  (UILink.editSearchText):RegistReturnKeyEvent("NpcNavi_OutInputMode( true )")
  -- DECOMPILER ERROR at PC128: Confused about usage of register: R0 in 'UnsetPending'

  preLoadTextureKey[0] = preLoadTexture("new_ui_common_forlua/widget/minimap/icon/minimap_icon_npc_general.dds")
  -- DECOMPILER ERROR at PC133: Confused about usage of register: R0 in 'UnsetPending'

  preLoadTextureKey[1] = preLoadTexture("new_ui_common_forlua/widget/minimap/icon/minimap_icon_npc_skill.dds")
  -- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

  preLoadTextureKey[2] = preLoadTexture("new_ui_common_forlua/widget/minimap/icon/minimap_icon_npc_artisan.dds")
  -- DECOMPILER ERROR at PC143: Confused about usage of register: R0 in 'UnsetPending'

  preLoadTextureKey[3] = preLoadTexture("new_ui_common_forlua/widget/minimap/icon/minimap_icon_npc_store_liquid.dds")
  -- DECOMPILER ERROR at PC148: Confused about usage of register: R0 in 'UnsetPending'

  preLoadTextureKey[4] = preLoadTexture("new_ui_common_forlua/widget/minimap/icon/minimap_icon_npc_general.dds")
  -- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

  preLoadTextureKey[5] = preLoadTexture("new_ui_common_forlua/widget/minimap/icon/minimap_icon_npc_store_liquid.dds")
  local territoryCount = getTerritoryInfoCount()
  for i = 1, territoryCount do
    local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(i - 1)
    -- DECOMPILER ERROR at PC172: Confused about usage of register: R6 in 'UnsetPending'

    if territoryInfoWrapper ~= nil then
      preLoadTextureKey_territory[territoryInfoWrapper:getKeyRaw()] = preLoadTexture(territoryInfoWrapper:getTerritorySmallImage())
    end
  end
end

FGlobal_NpcNavi_HideAni = function()
  -- function num : 0_2
  Panel_NpcNavi:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_NpcNavi, 0, 0.75)
  aniInfo:SetHideAtEnd(true)
end

local AddEffectList = function(list)
  -- function num : 0_3 , upvalues : UILink
  local itemHeight = (UILink.treeView):GetSizeY() / (UILink.treeView):GetItemQuantity()
  for keyRaw,index in pairs(list) do
    local pos = (UILink.treeView):getViewIndex(index)
    if pos.x ~= -1 or pos.y ~= -1 then
      (UILink.treeView):AddEffect("UI_DarkSpiritQuestSubject", false, pos.x - (UILink.treeView):GetSizeX() / 5, pos.y - (UILink.treeView):GetSizeY() / 2 + itemHeight / 2)
    end
  end
end

local checkIsNewAdd = function(index, key)
  -- function num : 0_4 , upvalues : cachingCharacterData
  if cachingCharacterData[key] == true then
    return false
  else
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

    cachingCharacterData[key] = true
    return true
  end
end

local clearFocusEdit = function()
  -- function num : 0_5 , upvalues : searchGroupShow, UILink, IM
  if NpcNavi_CheckCurrentUiEdit(GetFocusEdit()) then
    ClearFocusEdit()
    searchGroupShow(false)
    ;
    (UILink.editSearchText):SetEditText("")
    if AllowChangeInputMode() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      SetFocusChatting()
    end
  end
end

local getCacheDialogData = function(characterKeyRaw, dialogIndex)
  -- function num : 0_6 , upvalues : cacheExecuteDialogData
  if cacheExecuteDialogData[characterKeyRaw] == nil then
    local executeDisplayData = dialog_getExecuteDisplayDataWithoutActor(characterKeyRaw, dialogIndex)
    if executeDisplayData ~= nil then
      local insertData = {itemName = "", itemPath = "", needPoint = 0}
      local itemSSW = getItemEnchantStaticStatus(executeDisplayData:getItemKey())
      if itemSSW ~= nil then
        insertData.itemName = itemSSW:getName()
        insertData.itemPath = itemSSW:getIconPath()
        insertData.itemDescription = itemSSW:getDescription()
        insertData.needAdditionalCondtion = dialog_getExecuteDisplayDataWithoutActorCount(characterKeyRaw, dialogIndex) > 0
      else
        insertData.needAdditionalCondtion = false
      end
      insertData.needPoint = executeDisplayData._needPoint
      insertData.territoryKey = (executeDisplayData._territoryKey):get()
      -- DECOMPILER ERROR at PC47: Confused about usage of register: R5 in 'UnsetPending'

      cacheExecuteDialogData[characterKeyRaw] = insertData
    end
  end
  do return cacheExecuteDialogData[characterKeyRaw] end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

local getByKey = function(key, list)
  -- function num : 0_7
  for k,v in pairs(list) do
    if v.key == key then
      return v
    end
  end
  return nil
end

local getByName = function(name, list)
  -- function num : 0_8
  for k,v in pairs(list) do
    if v.name == name then
      return v
    end
  end
  return nil
end

local getByCharacterGroupByTreeKey = function(treeKey)
  -- function num : 0_9 , upvalues : treeGroupData
  for _,territoryGroup in pairs(treeGroupData) do
    for _,regionGroup in pairs(territoryGroup.child) do
      if (regionGroup.child)[treeKey] ~= nil then
        return (regionGroup.child)[treeKey]
      end
    end
  end
  return nil
end

local insertData = function(treeIndex, parentLuaGroup, treeElement, objectkey, name)
  -- function num : 0_10
  local tempGroup = {index = treeIndex, element = treeElement, 
child = {}
, key = objectkey, name = name}
  parentLuaGroup[treeIndex] = tempGroup
  return tempGroup
end

local insertTreeRoot = function(parentLuaGroup, text, key, imageKey, color)
  -- function num : 0_11 , upvalues : getByKey, treeGroupData, UILink, insertData
  local childItemGroup = (getByKey(key, treeGroupData))
  local rv = nil
  if childItemGroup == nil or childItemGroup.element == nil then
    local childItem = (UILink.treeView):createRootItem()
    childItem:SetText(text)
    childItem:SetFontColor(color)
    childItem:SetTextureHash(imageKey)
    ;
    (UILink.treeView):AddRootItem(childItem)
    return insertData(childItem:GetIndex(), parentLuaGroup, childItem, key, text)
  else
    do
      local childItem = childItemGroup.element
      childItem:SetText(text)
      childItem:SetFontColor(color)
      childItem:SetTextureHash(imageKey)
      do return childItemGroup end
    end
  end
end

local insertTreeVertex = function(parentTreeVertex, parentLuaGroup, text, key, imageKey, color)
  -- function num : 0_12 , upvalues : getByName, UILink, insertData
  local childItemGroup = getByName(text, parentLuaGroup)
  if childItemGroup == nil or childItemGroup.element == nil then
    local childItem = (UILink.treeView):createRootItem()
    childItem:SetText(text)
    childItem:SetFontColor(color)
    childItem:SetTextureHash(imageKey)
    ;
    (UILink.treeView):AddItem(childItem, parentTreeVertex)
    return insertData(childItem:GetIndex(), parentLuaGroup, childItem, key, text)
  else
    do
      local childItem = childItemGroup.element
      childItem:SetText(text)
      childItem:SetFontColor(color)
      childItem:SetTextureHash(imageKey)
      do return childItemGroup end
    end
  end
end

local insertTreeLeaf = function(parentTreeVertex, parentLuaGroup, text, key, imageKey, color)
  -- function num : 0_13 , upvalues : getByKey, UILink, insertData
  local childItemGroup = getByKey(key, parentLuaGroup)
  if childItemGroup == nil or childItemGroup.element == nil then
    local childItem = (UILink.treeView):createChildItem()
    childItem:SetText(text)
    childItem:SetFontColor(color)
    childItem:SetTextureHash(imageKey)
    ;
    (UILink.treeView):AddItem(childItem, parentTreeVertex)
    return insertData(childItem:GetIndex(), parentLuaGroup, childItem, key, text)
  else
    do
      local childItem = childItemGroup.element
      childItem:SetText(text)
      childItem:SetFontColor(color)
      childItem:SetTextureHash(imageKey)
      do return childItemGroup end
    end
  end
end

local getCharacterString = function(npcData)
  -- function num : 0_14 , upvalues : getCacheDialogData
  local inputString = ""
  if npcData:getTitle() == "" or npcData:getTitle() == nil then
    inputString = "<PAColor0xffefefef>" .. npcData:getName() .. " "
  else
    inputString = "<PAColor0xffefefef>" .. npcData:getTitle() .. " " .. npcData:getName() .. " "
  end
  local executeDialogData = getCacheDialogData(npcData:getKeyRaw(), npcData:getDialogIndex())
  do
    if executeDialogData ~= nil then
      local explorePointInfo = getExplorePointByTerritoryRaw(executeDialogData.territoryKey)
      if explorePointInfo ~= nil and executeDialogData.needPoint <= explorePointInfo:getRemainedPoint() then
        inputString = inputString .. "(<PAColor0xffe0d5a7>" .. executeDialogData.itemName .. ":" .. executeDialogData.needPoint .. "<PAOldColor>)"
      else
        inputString = inputString .. "(" .. executeDialogData.itemName .. ":" .. executeDialogData.needPoint .. ")"
      end
    end
    if checkActiveCondition(npcData:getKeyRaw()) == false then
      local len = (string.wlen)(inputString)
      if len > 20 then
        len = 20
      end
      inputString = "<PAColor0xffbfbfbf>" .. PAGetString(Defines.StringSheet_GAME, "LUA_NPCNAVI_UNKNOWN_NPC")
      return inputString, false
    else
      do
        do return inputString, true end
      end
    end
  end
end

local createListElement = function(index, npcData, parentTreeVertex, parentLuaGroup, key, colorKey)
  -- function num : 0_15 , upvalues : preLoadTextureKey, getCharacterString, insertTreeLeaf
  local baseIcon = nil
  local getSpawnType = npcData:getSpawnType()
  local iconHide = getSpawnType > 5 or getSpawnType < 0
  local iconImageKey = 0
  if iconHide == false then
    iconImageKey = preLoadTextureKey[getSpawnType]
  end
  local inputString, isHasView = getCharacterString(npcData)
  do
    local characterGroup = insertTreeLeaf(parentTreeVertex, parentLuaGroup, inputString, key, iconImageKey, colorKey)
    characterGroup.data = npcData
    do return characterGroup, isHasView end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

local naviPathClear = function()
  -- function num : 0_16 , upvalues : UILink, selectIndex
  ToClient_DeleteNaviGuideByGroup(0)
  ;
  (UILink.treeView):ResetSelectItem()
  selectIndex = -1
end

local treeClear = function()
  -- function num : 0_17 , upvalues : UILink, treeGroupData
  (UILink.treeView):ClearTree()
  treeGroupData = {}
end

NpcNavi_TreeViewInOut = function(isIn)
  -- function num : 0_18 , upvalues : isMouseOnTreeView, searchGroupShow
  NpcNavi_UpdateSize()
  do
    local IsMouseOver = Panel_NpcNavi:GetPosX() < getMousePosX() and getMousePosX() < Panel_NpcNavi:GetPosX() + Panel_NpcNavi:GetSizeX() and Panel_NpcNavi:GetPosY() < getMousePosY() and getMousePosY() < Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY()
    if IsMouseOver and isIn == false then
      return 
    end
    isMouseOnTreeView = isIn
    searchGroupShow(isIn)
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

NpcNavi_UpdateSize = function()
  -- function num : 0_19
end

NpcNavi_OverBarUpdatePerFrame = function(deltaTime)
  -- function num : 0_20 , upvalues : isChecked_AddEffect, isChecked_EffectReset, selectIndex, naviPathClear
  NpcNavi_OverBarUpdate(true)
  if getSelfPlayer() == nil then
    return 
  end
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  if playerLevel <= 2 and isChecked_AddEffect == 0 and Panel_NpcNavi:GetShow() == true then
    isChecked_AddEffect = 1
    isChecked_EffectReset = 0
  end
  if playerLevel >= 3 and isChecked_AddEffect == 1 and isChecked_EffectReset == 0 then
    isChecked_EffectReset = 1
    isChecked_AddEffect = 2
  end
  if isChecked_EffectReset == 1 and isChecked_AddEffect == 2 then
    isChecked_EffectReset = 2
    isChecked_AddEffect = 3
  end
  if not ToClient_IsShowNaviGuideGroup(0) and selectIndex ~= -1 then
    naviPathClear()
  end
end

local giftIcon = {}
local uv = {
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 62, y1 = 1, x2 = 122, y2 = 61}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 62, y1 = 62, x2 = 122, y2 = 122}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 1, y1 = 62, x2 = 61, y2 = 122}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 62, y1 = 62, x2 = 122, y2 = 122}
, 
{_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_02.dds", x1 = 1, y1 = 1, x2 = 61, y2 = 61}
; 
[0] = {_fileName = "New_UI_Common_forLua/Widget/HumanRelations/Compensation_00.dds", x1 = 1, y1 = 1, x2 = 61, y2 = 61}
}
local _npcNavi_Target = nil
Panel_NpcNavi_updateIntimacyCircle = function(characterKeyRaw)
  -- function num : 0_21 , upvalues : UILink, giftIcon, _npcNavi_Target, _math_AddVectorToVector, _math_MulNumberToVector, UCT, uv
  local intimacy = getIntimacyByCharacterKey(characterKeyRaw)
  ;
  (UILink.tooltip_FruitageValue):SetText(tostring(intimacy))
  local valuePercent = intimacy / 1000 * 100
  if valuePercent > 100 then
    valuePercent = 100
  end
  ;
  (UILink.tooltip_CircularProgress):SetProgressRate(valuePercent)
  local count = getIntimacyInformationCount(characterKeyRaw)
  local colorKey = float4(1, 1, 1, 1)
  local startSize = 28
  local endSize = ((UILink.tooltip_ProgressBG):GetSizeX() + (UILink.tooltip_GiftIcon):GetSizeX()) / 2
  local centerPosition = float3((UILink.tooltip_ProgressBG):GetPosX() + (UILink.tooltip_ProgressBG):GetSizeX() / 2, (UILink.tooltip_ProgressBG):GetPosY() + (UILink.tooltip_ProgressBG):GetSizeY() / 2, 0)
  for index,value in pairs(giftIcon) do
    (UI.deleteControl)(value)
  end
  _npcNavi_Target = nil
  giftIcon = {}
  for index = 0, count - 1 do
    local intimacyInformationData = getIntimacyInformation(characterKeyRaw, index)
    local percent = intimacyInformationData:getIntimacy() / 1000
    local imageType = intimacyInformationData:getTypeIndex()
    local imageFileName = ""
    if percent >= 0 and percent <= 1 and ToClient_checkIntimacyInformationFixedState(intimacyInformationData) then
      local angle = math.pi * 2 * percent
      local lineStart = float3((math.sin)(angle), -(math.cos)(angle), 0)
      local lineEnd = float3((math.sin)(angle), -(math.cos)(angle), 0)
      lineStart = _math_AddVectorToVector(centerPosition, _math_MulNumberToVector(lineStart, startSize))
      lineEnd = _math_AddVectorToVector(centerPosition, _math_MulNumberToVector(lineEnd, endSize))
      _npcNavi_Target = giftIcon[index]
      if _npcNavi_Target == nil then
        _npcNavi_Target = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, UILink.tooltip, "GiftIcon_" .. tostring(index))
        -- DECOMPILER ERROR at PC165: Confused about usage of register: R19 in 'UnsetPending'

        giftIcon[index] = _npcNavi_Target
        CopyBaseProperty(UILink.tooltip_GiftIcon, _npcNavi_Target)
      end
      _npcNavi_Target:SetShow(true)
      _npcNavi_Target:ChangeTextureInfoName((uv[imageType])._fileName)
      local x1, y1, x2, y2 = setTextureUV_Func(_npcNavi_Target, (uv[imageType]).x1, (uv[imageType]).y1, (uv[imageType]).x2, (uv[imageType]).y2)
      ;
      (_npcNavi_Target:getBaseTexture()):setUV(x1, y1, x2, y2)
      _npcNavi_Target:setRenderTexture(_npcNavi_Target:getBaseTexture())
      _npcNavi_Target:SetPosX(lineEnd.x - _npcNavi_Target:GetSizeX() / 2)
      _npcNavi_Target:SetPosY(lineEnd.y - _npcNavi_Target:GetSizeY() / 2)
    end
  end
  return true
end

NpcNavi_OverBarUpdate = function(isShow)
  -- function num : 0_22 , upvalues : UILink, overIndex, getByCharacterGroupByTreeKey, getCharacterString, _npcNavi_Target, resizingGap, getCacheDialogData
  local index = (UILink.treeView):GetOverItmeIndex()
  local isUiMode = (CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode == getInputMode()
  if index == -1 or isUiMode == false or isShow == false then
    (UILink.tooltip):SetShow(false)
    overIndex = -1
    return 
  end
  do
    local characterGroup = getByCharacterGroupByTreeKey(index)
    if overIndex == index then
      return 
    end
    if characterGroup ~= nil then
      local sizeList, SizeY = nil, nil
      local isUpdateIntimacy = false
      if checkActiveCondition((characterGroup.data):getKeyRaw()) == false then
        (UILink.tooltip_NpcName):SetText(getCharacterString(characterGroup.data))
        ;
        (UILink.tooltip_itemName):SetShow(false)
        ;
        (UILink.tooltip_Icon):SetShow(false)
        if _npcNavi_Target == nil then
          (UILink.tooltip_Description):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
          ;
          (UILink.tooltip_Description):SetShow(false)
          ;
          (UILink.tooltip_NeedExplorePoint):SetShow(false)
          ;
          (UILink.tooltip_text):SetShow(false)
          ;
          (UILink.tooltip_NotFind):SetShow(true)
          ;
          (UILink.tooltip_NeedExplorePoint):SetShow(false)
          ;
          (UILink.tooltip_ProgressBG):SetShow(false)
          ;
          (UILink.tooltip_CircularProgress):SetShow(false)
          ;
          (UILink.tooltip_FruitageValue):SetShow(false)
        else
          _npcNavi_Target:SetShow(false)
        end
        sizeList = {(UILink.tooltip_NpcName):GetTextSizeX() + (UILink.tooltip_NpcName):GetPosX() * 2, (UILink.tooltip_NotFind):GetTextSizeX() + (UILink.tooltip_NotFind):GetPosX() * 2}
        SizeY = (UILink.tooltip_NotFind):GetPosY() + (UILink.tooltip_NotFind):GetTextSizeY() + resizingGap.tooltipExplorePointPanelGap
      else
        (UILink.tooltip_NpcName):SetText((characterGroup.data):getName())
        if (characterGroup.data):hasTimeSpawn() then
          local tooltipStr = ""
          if (characterGroup.data):isTimeSpawn((math.floor)(getIngameTime_minute() / 60)) then
            tooltipStr = PAGetString(Defines.StringSheet_GAME, "NPCNAVIGATION_OPEN")
          else
            tooltipStr = PAGetString(Defines.StringSheet_GAME, "NPCNAVIGATION_CLOSED")
          end
          local startHour = convertVariableTime((characterGroup.data):getSpawnStartTime() * 3600)
          local startMin = (math.floor)(startHour % 3600 / 60)
          startHour = (math.floor)(startHour / 3600)
          local endHour = convertVariableTime((characterGroup.data):getSpawnEndTime() * 3600)
          local endMin = (math.floor)(endHour % 3600 / 60)
          endHour = (math.floor)(endHour / 3600)
          ;
          (UILink.tooltip_text):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "NPCNAVIGATION_OPEN_TIME", "opentime", startHour .. ":" .. startMin, "closetime", endHour .. ":" .. endMin) .. tooltipStr)
        else
          (UILink.tooltip_text):SetText(PAGetString(Defines.StringSheet_GAME, "NPCNAVIGATION_EVERYDAYS_OPEN"))
        end
        local executeDialogData = (getCacheDialogData(characterGroup.key))
        local explorePointInfo = nil
        if executeDialogData ~= nil then
          explorePointInfo = getExplorePointByTerritoryRaw(executeDialogData.territoryKey)
        end
        ;
        (UILink.tooltip_NeedExplorePoint):SetShow(true)
        ;
        (UILink.tooltip_ProgressBG):SetShow(true)
        ;
        (UILink.tooltip_CircularProgress):SetShow(true)
        ;
        (UILink.tooltip_FruitageValue):SetShow(true)
        if explorePointInfo ~= nil then
          (UILink.tooltip_itemName):SetText(executeDialogData.itemName)
          ;
          (UILink.tooltip_Icon):ChangeTextureInfoName("Icon/" .. executeDialogData.itemPath)
          if executeDialogData.needAdditionalCondtion then
            local stringData = PAGetStringParam2(Defines.StringSheet_GAME, "NPCNAVIGATION_TOOLTIP_NEEDPOINTANDMINE_ADDCONDITION", "needPoint", executeDialogData.needPoint, "myPoint", explorePointInfo:getRemainedPoint())
            ;
            (UILink.tooltip_NeedExplorePoint):SetText(stringData)
          else
            local stringData = PAGetStringParam2(Defines.StringSheet_GAME, "NPCNAVIGATION_TOOLTIP_NEEDPOINTANDMINE", "needPoint", executeDialogData.needPoint, "myPoint", explorePointInfo:getRemainedPoint())
            ;
            (UILink.tooltip_NeedExplorePoint):SetText(stringData)
          end
          ;
          (UILink.tooltip_itemName):SetShow(true)
          ;
          (UILink.tooltip_Icon):SetShow(true)
          ;
          (UILink.tooltip_Description):SetAutoResize(true)
          ;
          (UILink.tooltip_Description):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
          ;
          (UILink.tooltip_Description):SetText(executeDialogData.itemDescription)
          ;
          (UILink.tooltip_Description):SetShow(true)
          ;
          (UILink.tooltip_NeedExplorePoint):SetShow(true)
          ;
          (UILink.tooltip_text):SetShow(true)
          ;
          (UILink.tooltip_NotFind):SetShow(false)
          ;
          (UILink.tooltip_NeedExplorePoint):SetPosY((UILink.tooltip_Description):GetPosY() + (UILink.tooltip_Description):GetSizeY() + resizingGap.tooltipDescExplorePointGap + 5)
          local ProgressSizeY = (UILink.tooltip_GiftIcon):GetSizeY() * 2 + (UILink.tooltip_NeedExplorePoint):GetPosY() + (UILink.tooltip_NeedExplorePoint):GetSizeY() + resizingGap.tooltipDescExplorePointGap / 2
          ;
          (UILink.tooltip_ProgressBG):SetPosY(ProgressSizeY)
          ;
          (UILink.tooltip_CircularProgress):SetPosY(ProgressSizeY)
          ;
          (UILink.tooltip_FruitageValue):SetPosY(ProgressSizeY)
          isUpdateIntimacy = isIntimacyCharacterByKey((characterGroup.data):getKeyRaw())
          if isUpdateIntimacy then
            sizeList = {(UILink.tooltip_NpcName):GetTextSizeX() + (UILink.tooltip_NpcName):GetPosX() * 2, (UILink.tooltip_text):GetTextSizeX() + (UILink.tooltip_text):GetPosX() * 2, (UILink.tooltip_itemName):GetTextSizeX() + (UILink.tooltip_itemName):GetPosX() + (UILink.tooltip_Icon):GetPosX(), (UILink.tooltip_NeedExplorePoint):GetTextSizeX() + (UILink.tooltip_NeedExplorePoint):GetPosX() * 2, (UILink.tooltip_Description):GetTextSizeX() + (UILink.tooltip_Description):GetPosX() * 2, (UILink.tooltip_CircularProgress):GetSizeX() + (UILink.tooltip_GiftIcon):GetSizeX() * 2 + 20}
            SizeY = (UILink.tooltip_CircularProgress):GetPosY() + (UILink.tooltip_CircularProgress):GetSizeY() + resizingGap.tooltipExplorePointPanelGap + (UILink.tooltip_GiftIcon):GetSizeY()
          else
            sizeList = {(UILink.tooltip_NpcName):GetTextSizeX() + (UILink.tooltip_NpcName):GetPosX() * 2, (UILink.tooltip_text):GetTextSizeX() + (UILink.tooltip_text):GetPosX() * 2, (UILink.tooltip_itemName):GetTextSizeX() + (UILink.tooltip_itemName):GetPosX() + (UILink.tooltip_Icon):GetPosX(), (UILink.tooltip_NeedExplorePoint):GetTextSizeX() + (UILink.tooltip_NeedExplorePoint):GetPosX() * 2, (UILink.tooltip_Description):GetTextSizeX() + (UILink.tooltip_Description):GetPosX() * 2}
            SizeY = (UILink.tooltip_NeedExplorePoint):GetPosY() + (UILink.tooltip_NeedExplorePoint):GetTextSizeY() + resizingGap.tooltipExplorePointPanelGap
          end
        else
          (UILink.tooltip_itemName):SetShow(false)
          ;
          (UILink.tooltip_Icon):SetShow(false)
          ;
          (UILink.tooltip_Description):SetShow(false)
          ;
          (UILink.tooltip_NeedExplorePoint):SetShow(false)
          ;
          (UILink.tooltip_text):SetShow(true)
          ;
          (UILink.tooltip_NotFind):SetShow(false)
          local ProgressSizeY = (UILink.tooltip_GiftIcon):GetSizeY() + (UILink.tooltip_text):GetPosY() + (UILink.tooltip_text):GetTextSizeY() + resizingGap.tooltipDescExplorePointGap / 2
          ;
          (UILink.tooltip_NeedExplorePoint):SetPosY(ProgressSizeY)
          ;
          (UILink.tooltip_ProgressBG):SetPosY(ProgressSizeY)
          ;
          (UILink.tooltip_CircularProgress):SetPosY(ProgressSizeY)
          ;
          (UILink.tooltip_FruitageValue):SetPosY(ProgressSizeY)
          isUpdateIntimacy = isIntimacyCharacterByKey((characterGroup.data):getKeyRaw())
          if isUpdateIntimacy then
            sizeList = {(UILink.tooltip_NpcName):GetTextSizeX() + (UILink.tooltip_NpcName):GetPosX() * 2, (UILink.tooltip_text):GetTextSizeX() + (UILink.tooltip_text):GetPosX() * 2, (UILink.tooltip_CircularProgress):GetSizeX() + (UILink.tooltip_GiftIcon):GetSizeX() * 2 + 20}
            SizeY = (UILink.tooltip_CircularProgress):GetPosY() + (UILink.tooltip_CircularProgress):GetSizeY() + resizingGap.tooltipExplorePointPanelGap + (UILink.tooltip_GiftIcon):GetSizeY()
          else
            sizeList = {(UILink.tooltip_NpcName):GetTextSizeX() + (UILink.tooltip_NpcName):GetPosX() * 2, (UILink.tooltip_text):GetTextSizeX() + (UILink.tooltip_text):GetPosX() * 2}
            SizeY = (UILink.tooltip_text):GetPosY() + (UILink.tooltip_text):GetTextSizeY() + resizingGap.tooltipExplorePointPanelGap
          end
        end
      end
      local tooltip_SizeX = 290
      ;
      (UILink.tooltip):SetSize(tooltip_SizeX, SizeY)
      ;
      (UILink.tooltip):ComputePos()
      if isUpdateIntimacy then
        (UILink.tooltip_NeedExplorePoint):ComputePos()
        ;
        (UILink.tooltip_ProgressBG):ComputePos()
        ;
        (UILink.tooltip_CircularProgress):ComputePos()
        ;
        (UILink.tooltip_FruitageValue):ComputePos()
        Panel_NpcNavi_updateIntimacyCircle((characterGroup.data):getKeyRaw())
      end
      ;
      (UILink.tooltip):SetShow(true)
      ;
      (UILink.tooltip):SetPosX(Panel_NpcNavi:GetPosX() - (UILink.tooltip):GetSizeX() - 5)
      ;
      (UILink.tooltip):SetPosY(Panel_NpcNavi:GetPosY())
    else
      (UILink.tooltip):SetShow(false)
    end
    overIndex = index
    -- DECOMPILER ERROR: 21 unprocessed JMP targets
  end
end

NpcNavi_ShowToggle = function()
  -- function num : 0_23 , upvalues : clearFocusEdit, lazyUpdate
  local isShow = not Panel_NpcNavi:IsShow()
  if isShow then
    NpcNavi_Reset_Posistion()
  else
    clearFocusEdit()
  end
  Panel_NpcNavi:SetShow(isShow, false)
  if isShow == false then
    Panel_Tooltip_NpcNavigation:SetShow(false, false)
  else
    if lazyUpdate then
      NpcListUpdate()
      lazyUpdate = false
    end
  end
  Panel_NpcNavi:EraseAllEffect()
  Panel_NpcNavi:AddEffect("UI_Item_MenuAura03", true, 0, 0)
  local rndNo_1 = (math.random)(0, 30)
  local rndNo_2 = (math.random)(30, 60)
  if Panel_WorldMap:GetShow() then
    Panel_NpcNavi:SetPosX(getScreenSizeX() - Panel_NpcNavi:GetSizeX() - 300)
    Panel_NpcNavi:SetPosY(30)
  else
    NpcNavi_Reset_Posistion()
  end
  Panel_NpcNavi:SetPosX(Panel_NpcNavi:GetPosX() - rndNo_1)
  Panel_NpcNavi:SetPosY(Panel_NpcNavi:GetPosY() + rndNo_2)
  PaGlobal_TutorialManager:handleNpcNavi_ShowToggle(isShow)
end

FGlobal_NpcNavi_Hide = function()
  -- function num : 0_24 , upvalues : clearFocusEdit
  local isShow = Panel_NpcNavi:IsShow()
  if isShow then
    clearFocusEdit()
  end
  Panel_NpcNavi:SetShow(false, false)
  Panel_Tooltip_NpcNavigation:SetShow(false, false)
end

FGlobal_NpcNavi_IsShowCheck = function()
  -- function num : 0_25
  return Panel_NpcNavi:IsShow()
end

FGlobal_NpcNavi_ShowRequestOuter = function()
  -- function num : 0_26 , upvalues : clearFocusEdit
  clearFocusEdit()
end

NpcNavi_Reset_Posistion = function()
  -- function num : 0_27
  Panel_NpcNavi:SetPosX(FGlobal_Panel_Radar_GetPosX() - Panel_NpcNavi:GetSizeX())
  Panel_NpcNavi:SetPosY(FGlobal_Panel_Radar_GetPosY())
end

NpcNavi_ShowRequestOuter = function(isShow)
  -- function num : 0_28 , upvalues : lazyUpdate
  Panel_NpcNavi:SetShow(isShow, false)
  if isShow == false then
    Panel_Tooltip_NpcNavigation:SetShow(false, false)
  else
    if lazyUpdate then
      NpcListUpdate()
      lazyUpdate = false
    end
  end
end

NpcNavi_OnInputMode = function()
  -- function num : 0_29 , upvalues : IM, UILink, searchGroupShow
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetFocusEdit(UILink.editSearchText)
  ;
  (UILink.editSearchText):SetEditText("")
  searchGroupShow(true)
end

NpcNavi_CheckCurrentUiEdit = function(_npcNavi_TargetUI)
  -- function num : 0_30 , upvalues : UILink
  do return _npcNavi_TargetUI ~= nil and _npcNavi_TargetUI:GetKey() == (UILink.editSearchText):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

NpcNavi_OutInputMode = function(isOk)
  -- function num : 0_31 , upvalues : UILink, searchGroupShow
  if isOk ~= true then
    (UILink.editSearchText):SetEditText("")
  end
  NpcNavi_SearchBtn()
  searchGroupShow(false)
  ClearFocusEdit()
end

local stringMatching = function(dstString, filterString)
  -- function num : 0_32
  return stringSearch(dstString, filterString)
end

local sortComparer = function(lhs, rhs)
  -- function num : 0_33
  if stringCompare(lhs.areaName, rhs.areaName) >= 0 then
    do return lhs.territoryName ~= rhs.territoryName end
    do return stringCompare(lhs.territoryName, rhs.territoryName) < 0 end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

NpcListUpdate_selfPlayer_regionChanged = function()
  -- function num : 0_34 , upvalues : lazyUpdate
  if Panel_NpcNavi:IsShow() == false then
    lazyUpdate = true
    return 
  end
  NpcListUpdate()
end

NpcListUpdate_EventMentalCardUpdate = function()
  -- function num : 0_35 , upvalues : lazyUpdate
  if Panel_NpcNavi:IsShow() == false then
    lazyUpdate = true
    return 
  end
  NpcListUpdate()
end

NpcListUpdate_EventExplorePointUpdate = function()
  -- function num : 0_36 , upvalues : lazyUpdate
  if Panel_NpcNavi:IsShow() == false then
    lazyUpdate = true
    return 
  end
  NpcListUpdate()
end

NpcListUpdate = function()
  -- function num : 0_37 , upvalues : sortComparer, stringMatching, filterText, getCharacterString, insertTreeRoot, treeGroupData, preLoadTextureKey_territory, UI_color, insertTreeVertex, createListElement, UILink, checkIsNewAdd, errorMessageShow, selectIndex, isFirstUpdate, AddEffectList
  local newList = {}
  local regionInfoCount = getRegionInfoCount()
  local regionInfoList = {}
  for index = 0, regionInfoCount - 1 do
    local regionInfo = getRegionInfo(index)
    regionInfoList[index + 1] = {}
    local _npcNavi_TargetInfo = regionInfoList[index + 1]
    _npcNavi_TargetInfo.areaName = regionInfo:getAreaName()
    _npcNavi_TargetInfo.territoryKey = regionInfo:getTerritoryKeyRaw()
    _npcNavi_TargetInfo.regionKey = regionInfo:getRegionKey()
    _npcNavi_TargetInfo.isAccessible = (regionInfo:get()):isAccessibleArea()
    _npcNavi_TargetInfo.territoryName = regionInfo:getTerritoryName()
  end
  ;
  (table.sort)(regionInfoList, sortComparer)
  do
    local isFilterFail = true
    for index = 1, regionInfoCount do
      local regionInfo = regionInfoList[index]
      local territoryMatch = stringMatching(regionInfo.territoryName, filterText)
      local regionMatch = stringMatching(regionInfo.areaName, filterText)
      local count = npcList_getNpcCount(regionInfo.regionKey)
      local checkFiltering = filterText ~= nil and filterText:len() ~= 0 and territoryMatch == false and regionMatch == false
      local filterStrCountOverOne = false
      if checkFiltering then
        for idx = 0, count - 1 do
          local npcData = npcList_getNpcInfo(idx)
          local characeterName, isHasView = getCharacterString(npcData)
          if stringMatching(characeterName, filterText) and npcData:isImportantNpc() then
            filterStrCountOverOne = true
            break
          end
        end
      else
        filterStrCountOverOne = count ~= 0
      end
      if filterStrCountOverOne then
        isFilterFail = false
      end
      local canActive = false
      for index = 0, count - 1 do
        local npcData = npcList_getNpcInfo(index)
        local isActiveCondition = checkActiveCondition(npcData:getKeyRaw())
        if isActiveCondition and npcData:isImportantNpc() then
          canActive = true
          break
        end
      end
      if filterStrCountOverOne and regionInfo.isAccessible and canActive then
        local territoryKeyRaw = regionInfo.territoryKey
        local explorePointInfo = getExplorePointByTerritoryRaw(territoryKeyRaw)
        local territoryName = regionInfo.territoryName
        if explorePointInfo ~= nil then
          territoryName = PAGetStringParam1(Defines.StringSheet_GAME, "NPCNAVIGATION_TERRITORYNAME", "territoryName", territoryName)
          WorldMapWindow_Update_ExplorePoint()
        end
        local territoryGroup = insertTreeRoot(treeGroupData, territoryName, territoryKeyRaw, preLoadTextureKey_territory[regionInfo.territoryKey], UI_color.C_FFFFAB6D)
        local regionGroup = insertTreeVertex(territoryGroup.element, territoryGroup.child, regionInfo.areaName, regionInfo.regionKey, 0, UI_color.C_FFFFFFFF)
        if filterText ~= nil and filterText:len() ~= 0 then
          for idx = 0, count - 1 do
            local npcData = npcList_getNpcInfo(idx)
            local characeterName, isHasView = getCharacterString(npcData)
            if (stringMatching(characeterName, filterText) or not checkFiltering) and npcData:isImportantNpc() then
              local characterGroup, isHasView = createListElement(idx, npcData, regionGroup.element, regionGroup.child, npcData:getKeyRaw(), UI_color.C_FFFFFFFF)
              ;
              (UILink.treeView):SetSelectItem(characterGroup.index)
              if isHasView then
                local isTrue = checkIsNewAdd(characterGroup.index, npcData:getKeyRaw())
                if isTrue then
                  newList[npcData:getKeyRaw()] = characterGroup.index
                end
              end
            end
          end
        else
          for idx = 0, count - 1 do
            local npcData = npcList_getNpcInfo(idx)
            if npcData:isImportantNpc() then
              local characterGroup, isHasView = createListElement(idx, npcData, regionGroup.element, regionGroup.child, npcData:getKeyRaw(), UI_color.C_FFFFFFFF)
              if isHasView then
                local isTrue = checkIsNewAdd(characterGroup.index, npcData:getKeyRaw())
                if isTrue then
                  newList[npcData:getKeyRaw()] = characterGroup.index
                end
              end
            end
          end
        end
      end
    end
    if regionInfoCount > 0 and isFilterFail then
      errorMessageShow = true
    else
      errorMessageShow = false
    end
    ;
    (UILink.errorMessage):SetShow(errorMessageShow)
    ;
    (UILink.treeView):SetFilterString("")
    ;
    (UILink.treeView):RefreshOpenList()
    if selectIndex > -1 then
      (UILink.treeView):SetSelectItem(selectIndex)
    end
    if isFirstUpdate then
      isFirstUpdate = false
    else
      for key,value in pairs(newList) do
        (UILink.treeView):SetSelectItem(value)
      end
      AddEffectList(newList)
      ;
      (UILink.treeView):ResetSelectItem()
    end
    -- DECOMPILER ERROR: 20 unprocessed JMP targets
  end
end

NpcNavi_SearchBtn = function()
  -- function num : 0_38 , upvalues : IM, filterText, UILink, treeClear
  if AllowChangeInputMode() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    ClearFocusEdit()
  else
    SetFocusChatting()
  end
  filterText = (UILink.editSearchText):GetEditText()
  treeClear()
  NpcListUpdate()
  NpcNavi_UpdateSize()
end

NpcNavi_DrawLine = function()
  -- function num : 0_39 , upvalues : UILink, naviPathClear, getByCharacterGroupByTreeKey, selectIndex
  NpcNavi_UpdateSize()
  local selectItem = (UILink.treeView):GetSelectItem()
  if selectItem == nil then
    naviPathClear()
    return 
  end
  local index = selectItem:GetIndex()
  local chracterGroup = getByCharacterGroupByTreeKey(index)
  if selectIndex == index or chracterGroup == nil then
    naviPathClear()
    return 
  else
    if checkActiveCondition((chracterGroup.data):getKeyRaw()) then
      NpcNavi_Clear()
      if (chracterGroup.data):hasTimeSpawn() and (chracterGroup.data):isTimeSpawn((math.floor)(getIngameTime_minute() / 60)) == false then
        NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "NPCNAVIGATION_REST_AVAILABLE"))
      end
      worldmapNavigatorStart((chracterGroup.data):getPosition(), NavigationGuideParam(), false, false, true)
      selectIndex = index
    else
      NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "NPCNAVIGATION_NOFIND"))
      naviPathClear()
      return 
    end
  end
end

NpcNavi_Clear = function()
  -- function num : 0_40
  ToClient_DeleteNaviGuideByGroup(0)
end

NpcNavi_ChangeTexture_On = function()
  -- function num : 0_41 , upvalues : isMouseOnPanel, searchGroupShow, npcNaviText
  isMouseOnPanel = true
  searchGroupShow(true)
  npcNaviText:SetText(PAGetString(Defines.StringSheet_GAME, "NPCNAVIGATION_DRAGABLE"))
  npcNaviText:SetSize(npcNaviText:GetTextSizeX(), npcNaviText:GetSizeY())
  npcNaviText:ComputePos()
end

NpcNavi_ChangeTexture_Off = function()
  -- function num : 0_42 , upvalues : isMouseOnPanel, searchGroupShow, npcNaviText
  do
    local IsMouseOver = Panel_NpcNavi:GetPosX() < getMousePosX() and getMousePosX() < Panel_NpcNavi:GetPosX() + Panel_NpcNavi:GetSizeX() and Panel_NpcNavi:GetPosY() < getMousePosY() and getMousePosY() < Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY()
    if IsMouseOver then
      return 
    end
    isMouseOnPanel = false
    searchGroupShow(false)
    npcNaviText:SetText(PAGetString(Defines.StringSheet_GAME, "NPCNAVIGATION_NOTDRAGABLE"))
    npcNaviText:SetSize(npcNaviText:GetTextSizeX(), npcNaviText:GetSizeY())
    npcNaviText:ComputePos()
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

NpcListUpdate_ScreenResize = function()
  -- function num : 0_43 , upvalues : UILink
  local self = UILink
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
    (self.treeView):SetItemQuantity((self.treeView):GetSizeY() / 195 * 8)
    ;
    (self.treeView):setAddImagePosY(5)
  else
    ;
    (self.treeView):SetItemQuantity((self.treeView):GetSizeY() / 465 * 25)
    ;
    (self.treeView):setAddImagePosY(2)
  end
end

initialize()

