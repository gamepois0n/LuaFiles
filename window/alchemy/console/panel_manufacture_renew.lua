local manufacture = {
  _init = false,
  _panel = Panel_Window_Manufacture,
  _ui = {
    radioButtonControlList = {},
    radioButtonControlListSize = 0,
    knowledgeFrameControl,
    knowledgeFrameContentControl,
    knowledgeFrameScroll,
    knowledgeTitleControl = nil,
    knowledgeDescControl = nil,
    materialGroupControl = nil,
    materialDescControl = nil,
    actionIconControl = nil,
    actionTitleControl = nil,
    actionDescControl = nil,
    doButtonControl = nil,
    doRepeatButtonControl = nil,
    doMassButtonControl = nil,
    list2 = nil
  },
  _actionListSize = 14,
  _actionList = {},
  _warehouseWayPointKey = 0,
  _installationType = CppEnums.InstallationType.TypeCount,
  _selectedActionIndex = -1,
  _selectedKnowledgeIndex = -1,
  _actionButtonGapX = 5,
  _materialListSize = 5,
  _materialTable = {},
  _massActionFlag = false,
  _repeatActionFlag = false,
  _failCount = 0
}
local Material = {}
Material.__index = Material
function Material.new(index)
  local material = {index = index}
  setmetatable(material, Material)
  material:clearXXX()
  return material
end
function Material:toString()
  return "" .. self.index .. ":" .. self.itemWhereType .. "/" .. self.slotNo .. "/" .. self.itemKey
end
function Material:clearXXX()
  self.slotNo = CppEnums.TInventorySlotNoUndefined
  self.itemWhereType = CppEnums.ItemWhereType.eCount
  self.itemKey = 0
end
function Material:checkEmpty()
  return CppEnums.TInventorySlotNoUndefined == self.slotNo or CppEnums.ItemWhereType.eCount == self.itemWhereType or 0 == self.itemKey
end
function Material.getItemXXX(itemWhereType, slotNo, warehouseWaypointKey)
  if not getSelfPlayer() then
    return
  end
  if CppEnums.TInventorySlotNoUndefined == slotNo then
    return
  end
  if CppEnums.ItemWhereType.eInventory == itemWhereType or CppEnums.ItemWhereType.eCashInventory == itemWhereType then
    return getInventoryItemByType(itemWhereType, slotNo)
  end
  if CppEnums.ItemWhereType.eWarehouse == itemWhereType and CppEnums.WaypointKeyUndefined ~= warehouseWaypointKey then
    return warehouse_get(warehouseWaypointKey):getItem(slotNo)
  end
end
function Material:replaceSlotNo()
  local nextSlotNo = self:getNextSlotNo()
  if nextSlotNo >= 0 then
    self.slotNo = nextSlotNo
    return true
  end
  return false
end
function Material:getNextSlotNo()
  if self:checkEmpty() then
    return -1
  end
  if CppEnums.ItemWhereType.eInventory == self.itemWhereType or CppEnums.ItemWhereType.eCashInventory == self.itemWhereType then
    for i = 2, Inventory_GetCurrentInventory():sizeXXX() - 1 do
      local item = Material.getItemXXX(self.itemWhereType, i, manufacture._warehouseWayPointKey)
      if i ~= self.slotNo then
        local item = Material.getItemXXX(self.itemWhereType, i, manufacture._warehouseWayPointKey)
        if item and item:get():getKey():getItemKey() == self.itemKey then
          return i
        end
      end
    end
  end
  if CppEnums.ItemWhereType.eWarehouse == self.itemWhereType then
    for i = 1, warehouse_get(manufacture._warehouseWayPointKey):getUseMaxCount() - 1 do
      if i ~= self.slotNo then
        local item = Material.getItemXXX(self.itemWhereType, i, manufacture._warehouseWayPointKey)
        if item and item:get():getKey():getItemKey() == self.itemKey then
          return i
        end
      end
    end
  end
  return -1
end
function Material:getItem()
  return Material.getItemXXX(self.itemWhereType, self.slotNo, manufacture._warehouseWayPointKey)
end
function manufacture:checkToDo(showMessage)
  if Panel_Win_System:GetShow() then
    return false
  end
  local action = self:getSelectedAction()
  if not action then
    return false
  end
  if self:getInsertedMaterialCount() <= 0 then
    if showMessage then
      if "MANUFACTURE_SHAKE" == action.name or "MANUFACTURE_HEAT" == action.name then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_SLOT_LEAST_ONE"))
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_SLOT_EMPTY"))
      end
    end
    return false
  end
  if "MANUFACTURE_DRY" == action.name then
    local terraintype = selfPlayerNaviMaterial()
    local onBoat = selfplayerIsCurrentlyOnShip()
    if (2 == terraintype or 4 == terraintype or 6 == terraintype or 8 == terraintype or getSelfPlayer():getCurrentRegionInfo():isOcean()) and not onBoat then
      if showMessage then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_DONT_WARTER_ACK"))
      end
      return false
    end
  elseif "MANUFACTURE_GUILD" == action.name then
    local houseWrapper = housing_getHouseholdActor_CurrentPosition()
    if not houseWrapper then
      if showMessage then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_INNTER_GUILDHOUSE_USE"))
      end
      return false
    end
  end
  if 2 > getSelfPlayer():get():getInventory():getFreeCount() then
    if showMessage then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_INVENTORY_LEAST_ONE"))
    end
    return false
  end
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local allWeight = Int64toInt32(s64_allWeight) / 10000
  local maxWeight = Int64toInt32(s64_maxWeight) / 10000
  local playerWeightPercent = allWeight / maxWeight * 100
  local s64_moneyWeight = selfPlayer:getInventory():getMoneyWeight_s64()
  local s64_equipmentWeight = selfPlayer:getEquipment():getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local moneyWeight = Int64toInt32(s64_moneyWeight) / 10000
  local equipmentWeight = Int64toInt32(s64_equipmentWeight) / 10000
  local allWeight = Int64toInt32(s64_allWeight) / 10000
  local maxWeight = Int64toInt32(s64_maxWeight) / 10000
  local invenWeight = allWeight - equipmentWeight - moneyWeight
  local playerFairyWeight = ToClient_getDecreaseWeightByFairy() / 10000
  if playerFairyWeight < 0 then
    playerFairyWeight = 0
  end
  local totalWeight = allWeight / maxWeight * 100
  if totalWeight >= 100 + playerFairyWeight then
    if showMessage then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_INVENTORY_WEIGHTOVER"))
    end
    return false
  end
  if "REPAIR_ITEM" == action.name then
    for i = 1, table.getn(self._materialTable) do
      local material = self._materialTable[i]
      if not material:checkEmpty() then
        local rv = repair_RepairItemBySelf(material.slotNo)
        if 0 ~= rv then
          return false
        end
      end
    end
  end
  return true
end
function manufacture:selectAction(actionIndex)
  local action = self:getAction(actionIndex)
  if not action then
    return false
  end
  self:clearMaterial()
  self:clearKnowledge()
  self._selectedActionIndex = actionIndex
  if 0 < action.knowledgeMentalThemeKey then
    ReconstructionAlchemyKnowledge(action.knowledgeMentalThemeKey)
  else
    ReconstructionAlchemyKnowledge()
  end
  ToClient_padSnapSetTargetGroup(self._ui.materialGroupControl)
  self:initKnowledgeList()
  return true
end
function manufacture:clearKnowledge()
  self._selectedKnowledgeIndex = -1
  self._ui.list2:getElementManager():clearKey()
end
function manufacture:initKnowledgeList()
  for i = 0, getCountAlchemyKnowledge() - 1 do
    self._ui.list2:getElementManager():pushKey(toInt64(0, i))
  end
end
function PaGlobalFunc_ManufactureSelectAction(actionIndex)
  if manufacture:selectAction(actionIndex) then
    return manufacture:update()
  end
end
function manufacture:checkValidAction(actionIndex)
  return actionIndex >= 0 and actionIndex < self._actionListSize
end
function manufacture:changeAction(diffIndex)
  local nextActionIndex = self._selectedActionIndex + diffIndex
  while self:checkValidAction(nextActionIndex) do
    if self:checkActionVisible(nextActionIndex) and self:selectAction(nextActionIndex) then
      return true
    end
    nextActionIndex = nextActionIndex + diffIndex
  end
  return false
end
function PaGlobalFunc_ManufactureChangeAction(diffIndex)
  if manufacture:changeAction(diffIndex) then
    return manufacture:update()
  end
end
function manufacture:selectKnowledge(knowledgeIndex)
  local prevIndex = self._selectedKnowledgeIndex
  self._selectedKnowledgeIndex = knowledgeIndex
  self._ui.list2:requestUpdateByKey(toInt64(0, prevIndex))
  self._ui.list2:requestUpdateByKey(toInt64(0, knowledgeIndex))
  self._ui.knowledgeFrameScroll:SetControlTop()
  return true
end
function PaGlobalFunc_ManufactureSelectKnowledge(knowledgeIndex)
  if manufacture:selectKnowledge(knowledgeIndex) then
    return manufacture:updateKnowledge()
  end
end
function manufacture:createListItem(content, key)
  local knowledgeIndex = Int64toInt32(key)
  local knowledge = getAlchemyKnowledge(knowledgeIndex)
  if not knowledge then
    return false
  end
  local buttonControl = UI.getChildControl(content, "RadioButton_Item")
  buttonControl:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  buttonControl:addInputEvent("Mouse_On", "PaGlobalFunc_ManufactureSelectKnowledge(" .. knowledgeIndex .. ")")
  local checkFlag = false
  buttonControl:SetCheck(checkFlag)
  local learnFlag = isLearnMentalCardForAlchemy(knowledge:getKey())
  if learnFlag then
    buttonControl:SetFontColor(Defines.Color.C_FF84FFF5)
    buttonControl:SetText(knowledge:getName())
  else
    buttonControl:SetFontColor(Defines.Color.C_FF888888)
    buttonControl:SetText("??? ( " .. knowledge:getKeyword() .. " )")
  end
  content:SetShow(true)
  return true
end
function PaGlobalFunc_ManufactureCreateListItem(content, key)
  if manufacture:createListItem(content, key) then
  end
end
function manufacture:initMaterial()
  local slotItemConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCash = true,
    createEnduranceIcon = true
  }
  for i = 1, self._materialListSize do
    local material = Material.new(i)
    local bgControl = UI.getChildControl(self._ui.materialGroupControl, "Static_Item_Slot" .. i)
    bgControl:SetSize(45, 45)
    material.bgControl = bgControl
    local slotItem = {}
    SlotItem.new(slotItem, "Slot" .. i, i, bgControl, slotItemConfig)
    slotItem:createChild()
    slotItem.icon:addInputEvent("Mouse_LUp", "PaGlobalFunc_ManufactureSelectMultipleMaterials()")
    material.slotItem = slotItem
    table.insert(self._materialTable, material)
  end
end
function manufacture:initAction()
  local tabGroupControl = UI.getChildControl(self._panel, "Static_TapGroup")
  for i = 0, self._actionListSize - 1 do
    local radioButtonKey = "RadioButton_Action" .. i + 1
    local radioButtonControl = UI.getChildControlNoneAssert(tabGroupControl, radioButtonKey)
    if radioButtonControl then
      radioButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_ManufactureSelectAction(" .. i .. ")")
      self._ui.radioButtonControlList[i] = radioButtonControl
      self._ui.radioButtonControlListSize = self._ui.radioButtonControlListSize + 1
    end
  end
  local action
  action = {
    name = "MANUFACTURE_SHAKE",
    titleString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_SHAKE"),
    descString = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_SHAKE"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_SHAKE"),
    disabledDescString = "",
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 2,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 30200
  }
  self._actionList[0] = action
  action = {
    name = "MANUFACTURE_GRIND",
    titleString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_GRIND"),
    descString = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_GRIND"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_GRIND"),
    disabledDescString = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE_MORTAR"),
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 2,
    installationType = CppEnums.InstallationType.eType_Stump,
    knowledgeMentalThemeKey = 30500
  }
  self._actionList[1] = action
  action = {
    name = "MANUFACTURE_FIREWOOD",
    titleString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_WOODSPLITTING"),
    descString = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_FIREWOOD"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_FIREWOOD"),
    disabledDescString = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE_STUMP"),
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 1,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 30700
  }
  self._actionList[2] = action
  action = {
    name = "MANUFACTURE_DRY",
    titleString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_DRY"),
    descString = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_DRY"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_DRY"),
    disabledDescString = "",
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 1,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 30300
  }
  self._actionList[3] = action
  action = {
    name = "MANUFACTURE_THINNING",
    titleString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_THINNING"),
    descString = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_THINNING"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_THINNING"),
    disabledDescString = "",
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 1,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 30400
  }
  self._actionList[4] = action
  action = {
    name = "MANUFACTURE_HEAT",
    titleString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_HEATING"),
    descString = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_HEAT"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_HEAT"),
    disabledDescString = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE_FIREBOWL"),
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 2,
    installationType = CppEnums.InstallationType.eType_FireBowl,
    knowledgeMentalThemeKey = 30600
  }
  self._actionList[5] = action
  action = {
    name = "MANUFACTURE_RAINWATER",
    titleString = "",
    descString = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_RAINWATER"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_RAINWATER"),
    disabledDescString = "",
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 1,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 30800
  }
  self._actionList[6] = action
  action = {
    name = "REPAIR_ITEM",
    titleString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_REPAIR"),
    descString = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_REPAIR"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_REPAIR"),
    disabledDescString = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE_ANVIL"),
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_REPAIR"),
    materialCount = 1,
    installationType = CppEnums.InstallationType.eType_Anvil,
    knowledgeMentalThemeKey = -1
  }
  self._actionList[7] = action
  action = {
    name = "MANUFACTURE_ALCHEMY",
    titleString = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ALCHEMY"),
    descString = PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC2_ALCHEMY"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC_ALCHEMY"),
    disabledDescString = "",
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 5,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 31009
  }
  self._actionList[8] = action
  action = {
    name = "MANUFACTURE_COOK",
    titleString = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_COOK"),
    descString = PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC2_COOK"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC_COOK"),
    disabledDescString = "",
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 2,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 30109
  }
  self._actionList[9] = action
  if ToClient_IsContentsGroupOpen("327") then
    self._actionList[9].materialCount = 4
  elseif ToClient_IsContentsGroupOpen("228") then
    self._actionList[9].materialCount = 3
  elseif isGameTypeTaiwan() then
    self._actionList[9].materialCount = 3
  else
    self._actionList[9].materialCount = 2
  end
  action = {
    name = "MANUFACTURE_ROYALGIFT_COOK",
    titleString = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_COOK"),
    descString = PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC2_ROYALGIFT_COOK"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_ROYALGIFT_COOK"),
    disabledDescString = "",
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 3,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 30110
  }
  self._actionList[10] = action
  action = {
    name = "MANUFACTURE_ROYALGIFT_ALCHEMY",
    titleString = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_ALCHEMY"),
    descString = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_ROYALGIFT_ALCHEMY"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC2_ROYALGIFT_ALCHEMY"),
    disabledDescString = "",
    isEnabled = true,
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 3,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 31012
  }
  self._actionList[11] = action
  action = {
    name = "MANUFACTURE_GUILD",
    titleString = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_GUILDMANURACTURE_NAME"),
    descString = PAGetString(Defines.StringSheet_GAME, ""),
    desc2String = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_GUILDMANUFACTURE_SUBDESC"),
    disabledDescString = "",
    isEnabled = ToClient_IsContentsGroupOpen("36"),
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 5,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 31013
  }
  self._actionList[12] = action
  action = {
    name = "MANUFACTURE_CRAFT",
    titleString = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CRAFT_NAME"),
    descString = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CRAFT_SUBDESC"),
    desc2String = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CRAFT_DESC"),
    disabledDescString = "",
    isEnabled = ToClient_IsContentsGroupOpen("285"),
    doActionButtonString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"),
    materialCount = 5,
    installationType = CppEnums.InstallationType.TypeCount,
    knowledgeMentalThemeKey = 30800
  }
  self._actionList[13] = action
end
function manufacture:initialize()
  if self._init then
    return
  end
  self._init = true
  local listBgControl = UI.getChildControl(self._panel, "Static_List_BG")
  self._ui.list2 = UI.getChildControl(listBgControl, "List2_Manufacture")
  self._ui.list2:changeAnimationSpeed(10)
  self._ui.list2:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_ManufactureCreateListItem")
  self._ui.list2:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui.knowledgeFrameControl = UI.getChildControl(listBgControl, "Frame_Knowledge")
  self._ui.knowledgeFrameContentControl = UI.getChildControl(self._ui.knowledgeFrameControl, "Frame_1_Content")
  self._ui.knowledgeFrameScroll = UI.getChildControl(self._ui.knowledgeFrameControl, "Frame_1_VerticalScroll")
  self._ui.knowledgeTitleControl = UI.getChildControl(self._ui.knowledgeFrameContentControl, "StaticText_Item_Name")
  self._ui.knowledgeDescControl = UI.getChildControl(self._ui.knowledgeFrameContentControl, "StaticText_Item_Desc")
  self._ui.knowledgeDescControl:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.actionIconControl = UI.getChildControl(self._panel, "Static_Type_Icon")
  self._ui.actionTitleControl = UI.getChildControl(self._panel, "StaticText_Type_Name")
  self._ui.actionDescControl = UI.getChildControl(self._panel, "StaticText_Type_Desc")
  self._ui.actionDescControl:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.materialGroupControl = UI.getChildControl(self._panel, "Static_Ingredient")
  local recipeGroupControl = UI.getChildControl(self._ui.materialGroupControl, "Static_Recipe")
  self._ui.materialDescControl = UI.getChildControl(recipeGroupControl, "StaticText_Material")
  self._ui.materialDescControl:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.materialDescControl:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_SLOT_EMPTY"))
  self._panel:registerPadEvent(__eConsoleUIPadEvent_LB, "PaGlobalFunc_ManufactureChangeAction(-1)")
  self._panel:registerPadEvent(__eConsoleUIPadEvent_RB, "PaGlobalFunc_ManufactureChangeAction(1)")
  self._panel:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_ManufactureDo()")
  UI.getChildControl(self._panel, "StaticText_Do_ConsoleUI"):addInputEvent("Mouse_LUp", "PaGlobalFunc_ManufactureDo()")
  self._ui.doRepeatButtonControl = UI.getChildControl(self._panel, "StaticText_RepeatDo_ConsoleUI")
  self._ui.doRepeatButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_ManufactureDoRepeat()")
  self._ui.doMassButtonControl = UI.getChildControl(self._panel, "StaticText_MessDo_ConsoleUI")
  self._ui.doMassButtonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_ManufactureDoMass()")
  self:initAction()
  self:initMaterial()
  local massButton = UI.getChildControl(self._panel, "StaticText_MessDo_ConsoleUI")
  massButton:SetShow(_ContentsGroup_LifeStatManufacturing)
  if _ContentsGroup_LifeStatManufacturing then
    massButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ManufactureDoMass()")
  end
  self._panel:RegisterUpdateFunc("PaGlobalFunc_ManufacturePerFrameUpdate")
  registerEvent("Event_ManufactureResultList", "PaGlobalFunc_ManufactureResponse")
end
function manufacture:doXXX()
  local action = self:getSelectedAction()
  if not action then
    return
  end
  local actionName = action.name
  if _ContentsGroup_LifeStatManufacturing and self._massActionFlag then
    actionName = actionName .. "_MASS"
  end
  self._failCount = 0
  self:close()
  return Manufacture_Do(self._installationType, actionName, self._materialTable[1].itemWhereType, self._materialTable[1].slotNo, self._materialTable[2].slotNo, self._materialTable[3].slotNo, self._materialTable[4].slotNo, self._materialTable[5].slotNo)
end
function PaGlobalFunc_ManufactureDoXXX()
  return manufacture:doXXX()
end
function manufacture:doManufacture()
  if not self:checkToDo(true) then
    return
  end
  self._massActionFlag = false
  self._repeatActionFlag = false
  return self:doXXX()
end
function PaGlobalFunc_ManufactureDo()
  if manufacture:doManufacture() then
  end
end
function manufacture:replaceMaterialSlotNo()
  for i = 1, table.getn(self._materialTable) do
    local material = self._materialTable[i]
    if material:replaceSlotNo() then
      return false
    end
  end
  return true
end
function manufacture:checkToDoRepeat(showMessage)
  if self:getInsertedMaterialCount() <= 0 then
    return false
  end
  for i = 1, table.getn(self._materialTable) do
    local material = self._materialTable[i]
    if not material:checkEmpty() and 0 > material:getNextSlotNo() then
      if showMessage then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE"))
      end
      return false
    end
  end
  return self:checkToDo(showMessage)
end
function manufacture:doRepeat()
  if not self:checkToDoRepeat(true) then
    return false
  end
  self._massActionFlag = false
  self._repeatActionFlag = true
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE"),
    content = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CONTINUEGRIND_MSGBOX_DESC"),
    functionYes = PaGlobalFunc_ManufactureDoXXX,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData, "middle")
end
function PaGlobalFunc_ManufactureDoRepeat()
  if manufacture:doRepeat() then
  end
end
function manufacture:checkMassActionEnabled(actionIndex)
  if not _ContentsGroup_LifeStatManufacturing then
    return false
  end
  if actionIndex < 0 or actionIndex > 5 then
    return false
  end
  return true
end
function manufacture:checkToDoMass(showMessage)
  for i = 1, table.getn(self._materialTable) do
    local material = self._materialTable[i]
    if not material:checkEmpty() then
      local item = material:getItem()
      if not item then
        return false
      elseif not item:getStaticStatus():isStackable() then
        if showMessage then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_MASSMANUFACTURE_BTN_TOOLTIP"))
        end
        return false
      end
    end
  end
  if not self:checkMassActionEnabled(self._selectedActionIndex) then
    if showMessage then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE"))
    end
    return false
  end
  local itemWrapper = ToClient_getEquipmentItem(CppEnums.EquipSlotNoClient.eEquipSlotNoSubTool)
  if not itemWrapper then
    if showMessage then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoMassManufactureEndurance"))
    end
    return false
  end
  local itemSSW = itemWrapper:getStaticStatus()
  if __ePlayerLifeStatType_Manufacturing ~= itemSSW:getLifeStatMainType() or self._selectedActionIndex + 1 ~= itemSSW:getLifeStatSubType() then
    return false
  end
  return self:checkToDo(showMessage)
end
function manufacture:doMass()
  if not self:checkToDoMass(true) then
    return false
  end
  self._massActionFlag = true
  self._repeatActionFlag = false
  return self:doXXX()
end
function PaGlobalFunc_ManufactureDoMass()
  if manufacture:doMass() then
  end
end
function manufacture:filterImpl(slotNo, itemWhereType, itemWrapper)
  local action = self:getSelectedAction()
  if not action then
    return true
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return false
  end
  if isUsePcExchangeInLocalizingValue() then
    local isVested = itemWrapper:get():isVested()
    local isPersonalTrade = itemWrapper:getStaticStatus():isPersonalTrade()
    if isVested and isPersonalTrade then
      return true
    end
  end
  if action.materialCount <= self:getInsertedMaterialCount() and not self:getMaterialBySlotNoAndItemWhereType(slotNo, itemWhereType) then
    return true
  end
  if action.name == "MANUFACTURE_HEAT" and not itemWrapper:checkToRepairItem() then
    return true
  end
  return false
end
function manufacture:filterInventory(slotNo, itemWrapper, inventoryType)
  if self:filterImpl(slotNo, inventoryType, itemWrapper) then
    return true
  end
  local action = self:getSelectedAction()
  if not action then
    return false
  end
  if action.name ~= "MANUFACTURE_HEAT" and not isManufactureItem(inventoryType, slotNo, action.name) then
    return true
  end
  return false
end
function PaGlobalFunc_ManufactureFilterInventory(slotNo, itemWrapper, inventoryType)
  return manufacture:filterInventory(slotNo, itemWrapper, inventoryType)
end
function manufacture:rightClickInventory(slotNo, itemWrapper, count, inventoryType)
  PaGlobalFunc_InventoryInfo_ToggleMultipleSelect(slotNo - 1, inventoryType)
  local material = self:getMaterialBySlotNoAndItemWhereType(slotNo, inventoryType)
  if material then
    return self:removeMaterialByIndex(material.index)
  else
    return self:insertMaterial(slotNo, itemWrapper, count, CppEnums.ItemWhereType.eInventory)
  end
end
function PaGlobalFunc_ManufactureRightClickInventory(slotNo, itemWrapper, count, inventoryType)
  if manufacture:rightClickInventory(slotNo, itemWrapper, count, inventoryType) then
    return manufacture:update()
  end
end
function manufacture:clearMaterial()
  for i = 1, table.getn(self._materialTable) do
    local material = self._materialTable[i]
    material:clearXXX()
  end
end
function manufacture:getInsertedMaterialCount()
  local count = 0
  for i = 1, table.getn(self._materialTable) do
    local material = self._materialTable[i]
    if not material:checkEmpty() then
      count = count + 1
    end
  end
  return count
end
function manufacture:getMaterialBySlotNoAndItemWhereType(slotNo, itemWhereType)
  for i = 1, table.getn(self._materialTable) do
    local material = self._materialTable[i]
    if material.slotNo == slotNo and material.itemWhereType == itemWhereType then
      return material
    end
  end
end
function manufacture:insertMaterial(slotNo, itemWrapper, count, itemWhereType)
  local action = self:getSelectedAction()
  if not action then
    return false
  end
  if action.materialCount <= self:getInsertedMaterialCount() then
    return false
  end
  if self:getMaterialBySlotNoAndItemWhereType(slotNo, itemWhereType) then
    return false
  end
  for i = 1, table.getn(self._materialTable) do
    local material = self._materialTable[i]
    if material:checkEmpty() then
      local materialItem = Material.getItemXXX(itemWhereType, slotNo, self._warehouseWayPointKey)
      if not materialItem then
        return false
      end
      material.slotNo = slotNo
      material.itemWhereType = itemWhereType
      material.itemKey = materialItem:get():getKey():getItemKey()
      return true
    end
  end
  return false
end
function manufacture:removeMaterialByIndex(index)
  local len = table.getn(self._materialTable)
  for i = index, len - 1 do
    local material = self._materialTable[i]
    local nextMaterial = self._materialTable[i + 1]
    material.slotNo = nextMaterial.slotNo
    material.itemWhereType = nextMaterial.itemWhereType
    material.itemKey = nextMaterial.itemKey
  end
  self._materialTable[len]:clearXXX()
  return true
end
function manufacture:completeMultipleSelection()
  if PaGlobalFunc_InventoryInfo_GetShow() then
    InventoryWindow_Close()
    return true
  end
end
function PaGlobalFunc_ManufactureCompleteMultipleSelection()
  return manufacture:completeMultipleSelection()
end
function manufacture:selectMultipleMaterials()
  PaGlobalFunc_InventoryInfo_Open()
  PaGlobalFunc_InventoryInfo_InitMultipleSelect()
  for i = 1, table.getn(self._materialTable) do
    local material = self._materialTable[i]
    if not material:checkEmpty() then
      PaGlobalFunc_InventoryInfo_ToggleMultipleSelect(material.slotNo - 1, material.itemWhereType)
    end
  end
  Inventory_SetFunctor(PaGlobalFunc_ManufactureFilterInventory, PaGlobalFunc_ManufactureRightClickInventory, nil, nil, {multipleSelectEndFunc = PaGlobalFunc_ManufactureCompleteMultipleSelection, button = __eConsoleUIPadEvent_Up_X})
  Inventory_updateSlotData()
end
function PaGlobalFunc_ManufactureSelectMultipleMaterials()
  return manufacture:selectMultipleMaterials()
end
function manufacture:open(initFlag)
  if self:checkShow() then
    return false
  end
  if 0 ~= ToClient_GetMyTeamNoLocalWar() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_LOCALWAR_ALERT"))
    return false
  end
  if selfPlayerIsInCompetitionArea() then
    return false
  end
  if Panel_AlchemyFigureHead:GetShow() then
    FGlobal_AlchemyFigureHead_Close()
  end
  if Panel_AlchemyStone:GetShow() then
    FGlobal_AlchemyStone_Close()
  end
  if Panel_DyePalette:GetShow() then
    FGlobal_DyePalette_Close()
  end
  if false == _ContentsGroup_RenewUI and Panel_Equipment:GetShow() then
    EquipmentWindow_Close()
  end
  if true == Panel_Window_ItemMarket_RegistItem:GetShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
  ClothInventory_Close()
  StopManufactureAction()
  if initFlag then
    self:clearMaterial()
    self:clearKnowledge()
    self:selectAction(0)
  end
  self:update()
  self._panel:SetShow(true, true)
  if Panel_Window_Inventory:IsUISubApp() then
    self:OpenUISubApp()
  end
  return true
end
function PaGlobalFunc_ManufactureOpen(initFlag)
  if manufacture:open(initFlag) then
    return manufacture:update()
  end
end
function manufacture:checkShow()
  return self._panel:GetShow()
end
function PaGlobalFunc_ManufactureCheckShow()
  return manufacture:checkShow()
end
function manufacture:popMaterial()
  if 0 < self:getInsertedMaterialCount() then
    return self:removeMaterialByIndex(self:getInsertedMaterialCount())
  end
end
function manufacture:back()
  if self:popMaterial() then
    return true
  end
  if PaGlobalFunc_InventoryInfo_GetShow() then
    return InventoryWindow_Close()
  end
  if not self:checkShow() then
    return false
  end
  self:close()
end
function PaGlobalFunc_ManufactureBack()
  if manufacture:back() then
    return manufacture:update()
  end
end
function manufacture:close()
  Inventory_SetFunctor(nil, nil, nil, nil)
  Warehouse_SetFunctor(nil, nil)
  self._panel:SetShow(false)
end
function PaGlobalFunc_ManufactureClose()
  return manufacture:close()
end
function manufacture:getActionIndexByInstallationType(type)
  if CppEnums.InstallationType.TypeCount == type then
    return -1
  end
  for i = 0, self._actionListSize - 1 do
    local action = self:getAction(i)
    if action.installationType == type then
      return i
    end
  end
  return -1
end
function manufacture:getActionButton(i)
  if i < 0 or i >= self._ui.radioButtonControlListSize then
    return
  end
  return self._ui.radioButtonControlList[i]
end
function manufacture:getAction(i)
  if i < 0 or i >= self._actionListSize then
    return
  end
  return self._actionList[i]
end
function manufacture:getSelectedKnowledge()
  if self._selectedKnowledgeIndex < 0 or getCountAlchemyKnowledge() <= self._selectedKnowledgeIndex then
    return
  end
  return getAlchemyKnowledge(self._selectedKnowledgeIndex)
end
function manufacture:getSelectedAction()
  return self:getAction(self._selectedActionIndex)
end
function manufacture:checkActionVisible(actionIndex)
  local action = self:getAction(actionIndex)
  if not action then
    return false
  end
  if not isVisibleManufactureAction(action.name) then
    return false
  end
  if (actionIndex == 10 or actionIndex == 11) and not ToClient_IsContentsGroupOpen("22") then
    return false
  end
  local actionIndexUsingInstallation = self:getActionIndexByInstallationType(self._installationType)
  if actionIndexUsingInstallation >= 0 and actionIndex ~= actionIndexUsingInstallation then
    return false
  end
  return true
end
function manufacture:checkActionEnabled(actionIndex)
  local action = self:getAction(actionIndex)
  if not action then
    return false
  end
  if not isEnableManufactureAction(action.name) then
    return false
  end
  if actionIndex == 1 then
    if not isNearInstallation(CppEnums.InstallationType.eType_Anvil) then
      return false
    end
  elseif actionIndex == 12 then
    if not ToClient_IsContentsGroupOpen("36") then
      return false
    end
    local houseWrapper = housing_getHouseholdActor_CurrentPosition()
    local enabledFlag = houseWrapper and houseWrapper:isMyGuildHouse()
    if not enabledFlag then
      return false
    end
  elseif actionIndex == 13 and not ToClient_IsContentsGroupOpen("285") then
    return false
  end
  return true
end
function manufacture:updateAction()
  local posX = 60
  for i = 0, self._actionListSize - 1 do
    local actionButton = self:getActionButton(i)
    if actionButton then
      local visibleFlag = self:checkActionVisible(i)
      actionButton:SetShow(visibleFlag)
      if visibleFlag then
        actionButton:SetPosX(posX)
        posX = posX + actionButton:GetSizeX() + self._actionButtonGapX
      end
      local checkedFlag = self._selectedActionIndex == i
      actionButton:SetCheck(checkedFlag)
    end
  end
  local action = self:getSelectedAction()
  if action then
    self._ui.actionTitleControl:SetText(action.titleString)
    self._ui.actionTitleControl:SetShow(true)
    if self:checkActionEnabled(self._selectedActionIndex) then
      self._ui.actionDescControl:SetText(action.descString)
    else
      self._ui.actionDescControl:SetText(action.disabledDescString)
    end
  else
    self._ui.actionTitleControl:SetShow(false)
    self._ui.actionDescControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_SELECT_TYPE"))
  end
end
function manufacture:getItemBySlotNo(itemWhereType, slotNo)
  if CppEnums.ItemWhereType.eInventory == itemWhereType or CppEnums.ItemWhereType.eCashInventory == itemWhereType then
    return getInventoryItemByType(itemWhereType, slotNo)
  elseif CppEnums.ItemWhereType.eWarehouse == itemWhereType and CppEnums.WaypointKeyUndefined ~= self._warehouseWayPointKey then
    return warehouse_get(self._warehouseWayPointKey):getItem(slotNo)
  end
end
function manufacture:getSlotNoByKey(itemWhereType, itemKey, excludeIndex)
  if CppEnums.ItemWhereType.eInventory == itemWhereType or CppEnums.ItemWhereType.eCashInventory then
    for i = 2, Inventory_GetCurrentInventory():sizeXXX() - 1 do
      if i ~= excludeIndex then
        local item = self:getItemBySlotNo(itemWhereType, i)
        if item and item:get():getKey():getItemKey() == itemKey then
          return i
        end
      end
    end
  elseif CppEnums.ItemWhereType.eWarehouse == itemWhereType then
    for i = 1, warehouse_get(self._warehouseWayPointKey):getUseMaxCount() - 1 do
      if i ~= excludeIndex then
        local item = warehouse:getItem(i)
        if item and item:get():getKey():getItemKey() == itemKey then
          return i
        end
      end
    end
  end
  return -1
end
function manufacture:updateKnowledge()
  local knowledge = self:getSelectedKnowledge()
  if knowledge then
    self._ui.knowledgeTitleControl:SetText(knowledge:getName())
    if isLearnMentalCardForAlchemy(knowledge:getKey()) then
      self._ui.knowledgeDescControl:SetText(knowledge:getDesc())
    else
      self._ui.knowledgeDescControl:SetText("???")
    end
  else
    self._ui.knowledgeTitleControl:SetText("")
    self._ui.knowledgeDescControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_DEFAULT_MSG_1"))
  end
  self._ui.knowledgeFrameContentControl:SetSize(self._ui.knowledgeFrameContentControl:GetSizeX(), self._ui.knowledgeDescControl:GetTextSizeY())
  self._ui.knowledgeFrameControl:UpdateContentScroll()
  self._ui.knowledgeFrameControl:UpdateContentPos()
end
function manufacture:updateMaterial()
  local action = self:getAction(self._selectedActionIndex)
  if not action then
    return
  end
  PaGlobalFunc_InventoryInfo_InitMultipleSelect()
  for i = 1, table.getn(self._materialTable) do
    local material = self._materialTable[i]
    local enabledFlag = i <= action.materialCount
    material.bgControl:SetMonoTone(not enabledFlag)
    if material:checkEmpty() then
      material.slotItem:clearItem()
    else
      local item = material:getItem()
      material.slotItem:setItemByStaticStatus(item:getStaticStatus(), item:get():getCount_s64())
      PaGlobalFunc_InventoryInfo_ToggleMultipleSelect(material.slotNo - 1, material.itemWhereType)
    end
  end
  local showMaterialDescFlag = self:getInsertedMaterialCount() <= 0
  self._ui.materialDescControl:SetShow(showMaterialDescFlag)
end
function manufacture:update()
  self:updateAction()
  self:updateMaterial()
  self:updateKnowledge()
  self:updateDoButton()
  if CppEnums.WaypointKeyUndefined == self._warehouseWayPointKey then
    Inventory_updateSlotData()
  else
    Warehouse_updateSlotData()
  end
end
function manufacture:updateDoButton()
  local showRepeatButton = false
  local showMassButton = false
  if self:checkToDoRepeat() then
    showRepeatButton = true
    self._panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_ManufactureDoRepeat()")
  elseif self:checkToDoMass() then
    showMassButton = true
    self._panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_ManufactureDoMass()")
  else
    self._panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "")
  end
  self._ui.doRepeatButtonControl:SetShow(showRepeatButton)
  self._ui.doMassButtonControl:SetShow(showMassButton)
end
function PaGlobalFunc_ManufacturePerFrameUpdate()
end
function manufacture:perFrameUpdate()
  return false
end
function manufacture:changePlatformSpecKey()
end
function PaGlobalFunc_ManufactureInit()
  return manufacture:initialize()
end
function manufacture:response(itemDynamicListWrapper, failReason)
  local size = itemDynamicListWrapper:getSize()
  if size <= 0 then
    return self:responseFail(failReason)
  end
  return self:responseSuccess(itemDynamicListWrapper)
end
function manufacture:responseSuccess(itemDynamicListWrapper)
  self._failCount = 0
  if self._repeatActionFlag then
    if self:replaceMaterialSlotNo() then
      StopManufactureAction()
      luaTimer_AddEvent(PaGlobalFunc_ManufactureManufactureXXX, 500, false, 0)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_COMPLETE_REPEAT"))
    end
  end
end
function manufacture:responseFail(failReason)
  local message
  if 0 == failReason then
  elseif 1 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON1")
  elseif 2 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON2")
  elseif 3 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON3")
  elseif 4 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON4")
  elseif 5 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON5")
  elseif 6 == failReason then
  elseif 7 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON7")
  elseif 8 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_INVENTORY_LEAST_ONE")
  elseif 9 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_INVENTORY_WEIGHTOVER")
  elseif 10 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_WP_IS_LACK")
  elseif 11 == failReason then
    message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON_MASS")
  end
  if 6 ~= failReason and nil ~= message then
    Proc_ShowMessage_Ack(message)
  end
  self._failCount = self._failCount + 1
  if self:checkFailCount() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_DONT_THIS_WAY"))
    self._failCount = 0
    Manufacture_Response()
  end
end
function manufacture:checkFailCount(currentFailCount)
  local defaultFailCount = 30
  if self._massActionFlag then
    return (ToClient_CheckIsManufactureFail(self._selectedActionIndex + 1, defaultFailCount, self._failCount))
  end
  return defaultFailCount < self._failCount
end
function PaGlobalFunc_ManufactureResponse(itemDynamicListWrapper, failReason)
  return manufacture:response(itemDynamicListWrapper, failReason)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_ManufactureInit")
