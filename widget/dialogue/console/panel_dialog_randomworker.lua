Panel_Dialog_RandomWorker:SetShow(false)
Panel_Dialog_RandomWorker:ignorePadSnapMoveToOtherPanel()
local randomWorker = {
  _ui = {
    _static_Worker_BG = UI.getChildControl(Panel_Dialog_RandomWorker, "Static_Worker_BG")
  },
  _config = {
    _shopType_Worker = 7,
    _buttonTypeWarehouse = 0,
    _buttonTypeInventory = 1,
    _needWP = 5,
    _workerIconRadius = 60,
    _workerCenterX = 12,
    _workerCenterY = 26,
    _coinIconGapX = 25
  },
  _selectWorkerSlotNo = -1,
  _selectWorkerPrice = 0
}
function randomWorker:initialize()
  self:initControl()
end
function randomWorker:initControl()
  local RandomWorkerUI = self._ui
  RandomWorkerUI._staticText_Title = UI.getChildControl(RandomWorkerUI._static_Worker_BG, "StaticText_Title")
  RandomWorkerUI._static_CenterBg = UI.getChildControl(RandomWorkerUI._static_Worker_BG, "Static_CenterBg")
  RandomWorkerUI._staticText_WorkerImage = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_WorkerImage")
  RandomWorkerUI._staticText_WorkSpeed_Title = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_WorkSpeed_Title")
  RandomWorkerUI._staticText_MoveSpeed_Title = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_MoveSpeed_Title")
  RandomWorkerUI._staticText_Luck_Title = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_Luck_Title")
  RandomWorkerUI._staticText_ActionPoint_Title = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_ActionPoint_Title")
  RandomWorkerUI._staticText_WorkSpeed_Value = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_WorkSpeed_Value")
  RandomWorkerUI._staticText_MoveSpeed_Value = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_MoveSpeed_Value")
  RandomWorkerUI._staticText_Luck_Value = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_Luck_Value")
  RandomWorkerUI._staticText_ActionPoint_Value = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_ActionPoint_Value")
  RandomWorkerUI._staticText_CurrentWP = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_CurrentWP")
  RandomWorkerUI._staticText_LeftCount = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_LeftCount")
  RandomWorkerUI._staticText_Cost_Title = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_Cost_Title")
  RandomWorkerUI._staticText_Cost_Value = UI.getChildControl(RandomWorkerUI._static_CenterBg, "StaticText_Cost_Value")
  RandomWorkerUI._static_Cost_Icon = UI.getChildControl(RandomWorkerUI._static_CenterBg, "Static_Cost_Icon")
  RandomWorkerUI._radioButton_InventoryMoney = UI.getChildControl(RandomWorkerUI._static_Worker_BG, "RadioButton_InventoryMoney")
  RandomWorkerUI._staticText_InventoryMoneyValue = UI.getChildControl(RandomWorkerUI._radioButton_InventoryMoney, "StaticText_InventoryValue")
  RandomWorkerUI._radioButton_WarehouseMoney = UI.getChildControl(RandomWorkerUI._static_Worker_BG, "RadioButton_WarehouseMoney")
  RandomWorkerUI._staticText_WarehouseMoneyValue = UI.getChildControl(RandomWorkerUI._radioButton_WarehouseMoney, "StaticText_WhareHouseValue")
  RandomWorkerUI._radioButton_InventoryMoney:addInputEvent("Mouse_On", "FromClient_MoneyButtonOn( true )")
  RandomWorkerUI._radioButton_WarehouseMoney:addInputEvent("Mouse_On", "FromClient_MoneyButtonOn( false)")
  RandomWorkerUI._static_BottomBg = UI.getChildControl(RandomWorkerUI._static_Worker_BG, "Static_BottomBg")
  RandomWorkerUI._staticText_Change_Worker = UI.getChildControl(RandomWorkerUI._static_BottomBg, "StaticText_Change_Worker")
  RandomWorkerUI._staticText_Hire = UI.getChildControl(RandomWorkerUI._static_BottomBg, "StaticText_Hire")
  local xPos = RandomWorkerUI._staticText_Hire:GetPosX() - RandomWorkerUI._staticText_Change_Worker:GetTextSizeX() - 50
  RandomWorkerUI._staticText_Change_Worker:SetPosX(xPos)
  RandomWorkerUI._button_NextWorker = UI.getChildControl(RandomWorkerUI._static_BottomBg, "Button_NextWorker")
  RandomWorkerUI._button_Hire = UI.getChildControl(RandomWorkerUI._static_BottomBg, "Button_Hire")
  Panel_Dialog_RandomWorker:registerPadEvent(__eConsoleUIPadEvent_Up_A, "FGlobalFunc_Hire_RandomWorker()")
  Panel_Dialog_RandomWorker:registerPadEvent(__eCONSOLE_UI_INPUT_TYPE_B, "FGlobalFunc_Close_RandomWorker()")
  Panel_Dialog_RandomWorker:registerPadEvent(__eConsoleUIPadEvent_Up_X, "FGlobalFunc_NextWorker_RandomWorker()")
end
function randomWorker:resetData()
  self._selectWorkerSlotNo = -1
  self._selectWorkerPrice = 0
end
function randomWorker:open()
  if true == Panel_Dialog_RandomWorker:GetShow() then
    Panel_Dialog_RandomWorker:SetShow(false)
  end
  Panel_Dialog_RandomWorker:SetShow(true)
end
function randomWorker:close()
  if false == Panel_Dialog_RandomWorker:GetShow() then
    return
  end
  ToClient_padSnapResetControl()
  PaGlobalFunc_MainDialog_ReOpen()
  Panel_Dialog_RandomWorker:SetShow(false)
end
function randomWorker:setPosition()
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_PetList_Renew:GetSizeX()
  local panelSizeY = Panel_Window_PetList_Renew:GetSizeY()
  Panel_Window_PetList_Renew:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_PetList_Renew:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end
function randomWorker:update(workerShopSlotNo)
  local RandomWorkerUI = self._ui
  local sellCount = npcShop_getBuyCount()
  local selfPlayer = getSelfPlayer()
  local pcPosition = selfPlayer:get():getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  local MyWp = selfPlayer:getWp()
  local regionPlantKey = regionInfo:getPlantKeyByWaypointKey()
  local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(regionPlantKey, 0)
  local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(regionPlantKey)
  for index = 0, sellCount - 1 do
    local itemwrapper = npcShop_getItemBuy(index)
    local shopItem = itemwrapper:get()
    if workerShopSlotNo == shopItem.shopSlotNo then
      self._selectWorkerSlotNo = workerShopSlotNo
      self._selectWorkerPrice = shopItem.price_s64
      local plantWorkerStaticStatus = itemwrapper:getPlantWorkerStaticStatus()
      local plantWorkerGrade = plantWorkerStaticStatus:getCharacterStaticStatus()._gradeType:get()
      local workerColorSet
      if CppEnums.CharacterGradeType.CharacterGradeType_Normal == plantWorkerGrade then
        workerColorSet = "<PAColor0xffc4bebe>"
      elseif CppEnums.CharacterGradeType.CharacterGradeType_Elite == plantWorkerGrade then
        workerColorSet = "<PAColor0xFF5DFF70>"
      elseif CppEnums.CharacterGradeType.CharacterGradeType_Hero == plantWorkerGrade then
        workerColorSet = "<PAColor0xFF4B97FF>"
      elseif CppEnums.CharacterGradeType.CharacterGradeType_Legend == plantWorkerGrade then
        workerColorSet = "<PAColor0xFFFFC832>"
      elseif CppEnums.CharacterGradeType.CharacterGradeType_Boss == plantWorkerGrade then
        workerColorSet = "<PAColor0xFFFF6C00>"
      elseif CppEnums.CharacterGradeType.CharacterGradeType_Assistant == plantWorkerGrade then
        workerColorSet = "<PAColor0xffc4bebe>"
      else
        workerColorSet = "<PAColor0xffc4bebe>"
      end
      local workerIconPath = getWorkerIcon(plantWorkerStaticStatus)
      local efficiency = plantWorkerStaticStatus:getEfficiency(2, ItemExchangeKey(0))
      MyWp = MyWp - self._config._needWP
      if MyWp < 0 then
        MyWp = 0
      end
      local currentWP = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERRANDOMSELECT_NOWWP", "getWp", MyWp)
      currentWP = string.gsub(currentWP, "\n", "")
      currentWP = string.gsub(currentWP, ":", " ")
      RandomWorkerUI._staticText_Title:SetText(workerColorSet .. getWorkerName(plantWorkerStaticStatus) .. "<PAOldColor>")
      RandomWorkerUI._staticText_WorkerImage:ChangeTextureInfoNameAsync(workerIconPath)
      local posX = RandomWorkerUI._staticText_WorkerImage:GetPosX() + self._config._workerCenterX
      local posY = RandomWorkerUI._staticText_WorkerImage:GetPosY() + self._config._workerCenterY
      RandomWorkerUI._staticText_WorkerImage:SetCircularClip(self._config._workerIconRadius, float2(posX, posY))
      RandomWorkerUI._staticText_MoveSpeed_Value:SetText(plantWorkerStaticStatus._moveSpeed / 100)
      RandomWorkerUI._staticText_WorkSpeed_Value:SetText(efficiency / 1000000)
      RandomWorkerUI._staticText_Luck_Value:SetText(plantWorkerStaticStatus._luck / 10000)
      RandomWorkerUI._staticText_ActionPoint_Value:SetText(plantWorkerStaticStatus._actionPoint)
      RandomWorkerUI._staticText_CurrentWP:SetText(currentWP)
      RandomWorkerUI._staticText_Cost_Value:SetText(makeDotMoney(shopItem.price_s64))
      local IconPosX = RandomWorkerUI._staticText_Cost_Value:GetPosX() + RandomWorkerUI._staticText_Cost_Value:GetSizeX() - RandomWorkerUI._staticText_Cost_Value:GetTextSizeX()
      IconPosX = IconPosX - self._config._coinIconGapX
      RandomWorkerUI._static_Cost_Icon:SetPosX(IconPosX)
      RandomWorkerUI._staticText_LeftCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERRANDOMSELECT_WORKERCOUNTVALUE", "value", maxWorkerCount - waitWorkerCount))
      local myInvenMoney = selfPlayer:get():getInventory():getMoney_s64()
      local myWareHouseMoney = warehouse_moneyFromNpcShop_s64()
      RandomWorkerUI._staticText_InventoryMoneyValue:SetText(makeDotMoney(myInvenMoney))
      RandomWorkerUI._staticText_WarehouseMoneyValue:SetText(makeDotMoney(myWareHouseMoney))
      break
    end
  end
  if MyWp < self._config._needWP then
    if true == ToClient_isXBox() then
      RandomWorkerUI._staticText_Change_Worker:SetShow(false)
      Panel_Dialog_RandomWorker:registerPadEvent(__eConsoleUIPadEvent_Up_X, "")
    else
      RandomWorkerUI._button_NextWorker:SetEnable(false)
      RandomWorkerUI._button_NextWorker:SetMonoTone(true)
    end
  elseif true == ToClient_isXBox() then
    RandomWorkerUI._staticText_Change_Worker:SetShow(true)
    Panel_Dialog_RandomWorker:registerPadEvent(__eConsoleUIPadEvent_Up_X, "FGlobalFunc_NextWorker_RandomWorker()")
  else
    RandomWorkerUI._button_NextWorker:SetEnable(true)
    RandomWorkerUI._button_NextWorker:SetMonoTone(false)
  end
  if ToClient_HasWareHouseFromNpc() then
    if toInt64(0, 0) == warehouse_moneyFromNpcShop_s64() then
      RandomWorkerUI._radioButton_InventoryMoney:SetCheck(true)
      RandomWorkerUI._radioButton_WarehouseMoney:SetCheck(false)
    else
      RandomWorkerUI._radioButton_InventoryMoney:SetCheck(false)
      RandomWorkerUI._radioButton_WarehouseMoney:SetCheck(true)
    end
  else
    RandomWorkerUI._radioButton_InventoryMoney:SetCheck(false)
    RandomWorkerUI._radioButton_WarehouseMoney:SetCheck(true)
  end
end
function randomWorker:hire()
  local RandomWorkerUI = self._ui
  local selfPlayer = getSelfPlayer()
  local myInvenMoney = selfPlayer:get():getInventory():getMoney_s64()
  local myWareHouseMoney = warehouse_moneyFromNpcShop_s64()
  local function Worker_RequestDoBuy()
    local fromWhereType = CppEnums.ItemWhereType.eWarehouse
    if true == RandomWorkerUI._radioButton_InventoryMoney:IsCheck() then
      fromWhereType = CppEnums.ItemWhereType.eInventory
    end
    npcShop_doBuy(self._selectWorkerSlotNo, 1, fromWhereType, 0, false)
    self:resetData()
    FGlobalFunc_Close_RandomWorker()
  end
  if myInvenMoney < self._selectWorkerPrice and RandomWorkerUI._radioButton_InventoryMoney:IsCheck() or myWareHouseMoney < self._selectWorkerPrice and RandomWorkerUI._radioButton_WarehouseMoney:IsCheck() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_KNOWLEDGEMANAGEMENT_ACK_MAKEBOOK"))
  else
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Employ"),
      content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Employ_Question"),
      functionYes = Worker_RequestDoBuy,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function randomWorker:getNextWorker()
  local pcPosition = getSelfPlayer():get():getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  local region = regionInfo:get()
  local regionPlantKey = regionInfo:getPlantKeyByWaypointKey()
  local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(regionPlantKey, 0)
  local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(regionPlantKey)
  if waitWorkerCount == maxWorkerCount then
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect"),
      content = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_Cant_Employ"),
      functionApply = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
    return
  end
  local contentString = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect_Question") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERRANDOMSELECT_NOWWP", "getWp", getSelfPlayer():getWp())
  local function Worker_RequestShopList()
    local myWp = getSelfPlayer():getWp()
    if myWp < self._config._needWP then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERRANDOMSELECT_SHORTAGE_WP_ACK"))
      FGlobalFunc_Close_RandomWorker()
    else
      npcShop_requestList(CppEnums.ContentsType.Contents_Shop)
    end
  end
  local messageboxData = {
    title = PAGetString(Defines.StringSheet_GAME, "Lua_WorkerShop_ReSelect"),
    content = contentString,
    functionYes = Worker_RequestShopList,
    functionCancel = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function randomWorker:moneyButtonOn(isInventyroy)
  local RandomWorkerUI = self._ui
  RandomWorkerUI._radioButton_InventoryMoney:SetCheck(isInventyroy)
  RandomWorkerUI._radioButton_WarehouseMoney:SetCheck(not isInventyroy)
end
function randomWorker:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_RandomWorker")
  registerEvent("FromClient_EventRandomShopShow", "FGlobalFunc_Open_RandomWorker")
end
function FromClient_MoneyButtonOn(isInventyroy)
  randomWorker:moneyButtonOn(isInventyroy)
end
function FromClient_luaLoadComplete_RandomWorker()
  randomWorker:initialize()
end
function FGlobalFunc_Open_RandomWorker(shopType, slotNo)
  if randomWorker._config._shopType_Worker ~= shopType then
    return
  end
  randomWorker:resetData()
  randomWorker:setPosition()
  randomWorker:open()
  randomWorker:update(slotNo)
end
function FGlobalFunc_Close_RandomWorker()
  randomWorker:close()
end
function FGlobalFunc_Hire_RandomWorker()
  randomWorker:hire()
end
function FGlobalFunc_NextWorker_RandomWorker()
  randomWorker:getNextWorker()
end
randomWorker:registEventHandler()
