-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\remotecontrol\panel_remoteinventory.luac 

-- params : ...
-- function num : 0
Panel_RemoteInventory:SetShow(false)
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local isItemLock = ToClient_IsContentsGroupOpen("219")
local remoteInven = {radioBtn_Normal = (UI.getChildControl)(Panel_RemoteInventory, "RadioButton_Normal"), radioBtn_Pearl = (UI.getChildControl)(Panel_RemoteInventory, "RadioButton_Pearl"), checkBtn_Sort = (UI.getChildControl)(Panel_RemoteInventory, "CheckButton_ItemSort"), slotBg = (UI.getChildControl)(Panel_RemoteInventory, "Static_SlotBg"), btn_Prev = (UI.getChildControl)(Panel_RemoteInventory, "Button_Prev"), btn_Next = (UI.getChildControl)(Panel_RemoteInventory, "Button_Next"), pageValue = (UI.getChildControl)(Panel_RemoteInventory, "StaticText_Page"), slotValue = (UI.getChildControl)(Panel_RemoteInventory, "StaticText_Capacity"), weightValue = (UI.getChildControl)(Panel_RemoteInventory, "StaticText_WeightValue"), moneyValue = (UI.getChildControl)(Panel_RemoteInventory, "Static_Text_Money"), pearlValue = (UI.getChildControl)(Panel_RemoteInventory, "StaticText_PearlValue"), mileValue = (UI.getChildControl)(Panel_RemoteInventory, "StaticText_MileageValue"), progress_Weight = (UI.getChildControl)(Panel_RemoteInventory, "Progress2_Weight"), progress_Equip = (UI.getChildControl)(Panel_RemoteInventory, "Progress2_Equipment"), progress_Money = (UI.getChildControl)(Panel_RemoteInventory, "Progress2_Money"), maxSlotCount = 8, slotBgBasePosX = 20, slotBgBasePosY = 110, 
config = {createBorder = true, createIcon = true, createExpirationBG = true, createExpiration2h = true, createRemoteEnchant = true, createCash = true, createClassEquipBG = true}
, pageIndex = 0, currentWhereType = (CppEnums.ItemWhereType).eInventory, 
itemSlot = {}
}
local tempSlot = {itemSlotBg = (UI.getChildControl)(remoteInven.slotBg, "Static_SlotBG"), itemName = (UI.getChildControl)(remoteInven.slotBg, "StaticText_ItemName"), itemCount = (UI.getChildControl)(remoteInven.slotBg, "StaticText_Count"), leftTime = (UI.getChildControl)(remoteInven.slotBg, "StaticText_LeftTime")}
remoteInven.Init = function(self)
  -- function num : 0_0 , upvalues : UCT, tempSlot
  for index = 0, self.maxSlotCount - 1 do
    local temp = {}
    temp.slotBg = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, Panel_RemoteInventory, "Static_SlotBg_" .. index)
    CopyBaseProperty(self.slotBg, temp.slotBg)
    ;
    (temp.slotBg):SetPosX(self.slotBgBasePosX + ((self.slotBg):GetSizeX() + 10) * (index % 2))
    ;
    (temp.slotBg):SetPosY(self.slotBgBasePosY + ((self.slotBg):GetSizeY() + 5) * (math.floor)(index / 2))
    temp.itemSlotBg = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, temp.slotBg, "Static_ItemSlotBg_" .. index)
    CopyBaseProperty(tempSlot.itemSlotBg, temp.itemSlotBg)
    temp.itemName = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, temp.slotBg, "StaticText_ItemName_" .. index)
    CopyBaseProperty(tempSlot.itemName, temp.itemName)
    ;
    (temp.itemName):SetShow(false)
    ;
    (temp.itemName):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    temp.itemCount = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, temp.slotBg, "StaticText_ItemCount_" .. index)
    CopyBaseProperty(tempSlot.itemCount, temp.itemCount)
    ;
    (temp.itemCount):SetShow(false)
    temp.leftTime = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, temp.slotBg, "StaticText_LeftTime_" .. index)
    CopyBaseProperty(tempSlot.leftTime, temp.leftTime)
    ;
    (temp.leftTime):SetShow(false)
    local slot = {}
    ;
    (SlotItem.new)(slot, "RemoteItemIcon_" .. index, index, temp.itemSlotBg, self.config)
    ;
    (slot.icon):SetSize((temp.itemSlotBg):GetSizeX() - 2, (temp.itemSlotBg):GetSizeY() - 2)
    ;
    (slot.icon):SetPosX(1)
    ;
    (slot.icon):SetPosY(1)
    slot:createChild()
    ;
    (slot.border):SetSize((temp.itemSlotBg):GetSizeX(), (temp.itemSlotBg):GetSizeY())
    ;
    (slot.expiration2h):SetSize((temp.itemSlotBg):GetSizeX(), (temp.itemSlotBg):GetSizeY())
    ;
    (slot.expirationBG):SetSize((temp.itemSlotBg):GetSizeX(), (temp.itemSlotBg):GetSizeY())
    ;
    (slot.remoteEnchantText):SetSize((temp.itemSlotBg):GetSizeX() - 2, (temp.itemSlotBg):GetSizeY() - 2)
    ;
    (slot.isCash):SetSize(70, 70)
    ;
    (slot.isCash):SetPosX(1)
    ;
    (slot.isCash):SetPosY(1)
    -- DECOMPILER ERROR at PC207: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self.itemSlot)[index] = slot
    -- DECOMPILER ERROR at PC211: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self.itemSlot)[index]).itemName = temp.itemName
    -- DECOMPILER ERROR at PC215: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self.itemSlot)[index]).itemCount = temp.itemCount
    -- DECOMPILER ERROR at PC219: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self.itemSlot)[index]).leftTime = temp.leftTime
  end
  ;
  (self.radioBtn_Normal):SetCheck(true)
end

remoteInven.Update = function(self)
  -- function num : 0_1 , upvalues : UI_color
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = ((getSelfPlayer()):get()):getInventorySlotCount(not (self.radioBtn_Normal):IsCheck())
  local inventory = ((getSelfPlayer()):get()):getInventoryByType(self.currentWhereType)
  local invenMaxSize = inventory:sizeXXX()
  local freeCount = inventory:getFreeCount()
  ;
  (self.slotValue):SetText(invenUseSize - freeCount - useStartSlot .. "/" .. invenUseSize - 2)
  local slotNoList = (Array.new)()
  slotNoList:fill(useStartSlot, invenMaxSize - 1)
  if (self.checkBtn_Sort):IsCheck() then
    local sortList = (Array.new)()
    sortList:fill(useStartSlot, invenUseSize - 1)
    sortList:quicksort(RemoteInven_ItemComparer)
    for ii = 1, invenUseSize - 2 do
      slotNoList[ii] = sortList[ii]
    end
  end
  do
    for index = 0, self.maxSlotCount - 1 do
      local slotNo = slotNoList[index + self.pageIndex * self.maxSlotCount + 1]
      local itemWrapper = getInventoryItemByType(self.currentWhereType, slotNo)
      if itemWrapper == nil then
        local slot = (self.itemSlot)[index]
        slot:clearItem()
        ;
        (slot.itemName):SetShow(false)
        ;
        (slot.itemCount):SetShow(false)
        ;
        (slot.leftTime):SetShow(false)
      else
        do
          local itemSSW = itemWrapper:getStaticStatus()
          local slot = (self.itemSlot)[index]
          slot:setItem(itemWrapper, index)
          ;
          (slot.itemName):SetShow(true)
          ;
          (slot.itemName):SetText(itemSSW:getName())
          local nameColorGrade = itemSSW:getGradeType()
          if nameColorGrade == 0 then
            (slot.itemName):SetFontColor(UI_color.C_FFFFFFFF)
          else
            if nameColorGrade == 1 then
              (slot.itemName):SetFontColor(4284350320)
            else
              if nameColorGrade == 2 then
                (slot.itemName):SetFontColor(4283144191)
              else
                if nameColorGrade == 3 then
                  (slot.itemName):SetFontColor(4294953010)
                else
                  if nameColorGrade == 4 then
                    (slot.itemName):SetFontColor(4294929408)
                  else
                    ;
                    (slot.itemName):SetFontColor(UI_color.C_sFFFFFFFF)
                  end
                end
              end
            end
          end
          local itemCount = (itemWrapper:get()):getCount_s64()
          local itemStatic = itemSSW:get()
          if itemStatic and itemStatic._isStack then
            (slot.itemCount):SetText(tostring(itemCount) .. "�\156")
          else
            ;
            (slot.itemCount):SetText("")
          end
          ;
          (slot.itemCount):SetShow(true)
          local leftTime = ""
          ;
          (slot.leftTime):SetShow(false)
          if itemSSW and not (itemWrapper:getExpirationDate()):isIndefinite() then
            local s64_remainingTime = getLeftSecond_s64(itemWrapper:getExpirationDate())
            local fontColor = UI_color.C_FFC4BEBE
            local itemExpiration = itemWrapper:getExpirationDate()
            local leftPeriod = FromClient_getTradeItemExpirationDate(itemExpiration, ((itemWrapper:getStaticStatus()):get())._expirationPeriod)
            if not (itemSSW:get()):isCash() and itemSSW:isTradeAble() then
              leftTime = ""
            else
              leftTime = "유효 기간 : "
            end
            if (Defines.s64_const).s64_0 == s64_remainingTime then
              if not (itemSSW:get()):isCash() and itemSSW:isTradeAble() then
                leftTime = leftTime .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_REMAIN_TIME") .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_MARKETPRICE") .. " : " .. leftPeriod / 10000 .. " %)"
              else
                leftTime = leftTime .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_REMAIN_TIME")
              end
              fontColor = UI_color.C_FFF26A6A
            else
              if not (itemSSW:get()):isCash() and itemSSW:isTradeAble() then
                leftTime = leftTime .. convertStringFromDatetime(s64_remainingTime) .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_MARKETPRICE") .. " : " .. leftPeriod / 10000 .. " %)"
              else
                leftTime = leftTime .. convertStringFromDatetime(s64_remainingTime)
              end
            end
            ;
            (slot.leftTime):SetText(leftTime)
            ;
            (slot.leftTime):SetFontColor(fontColor)
            ;
            (slot.leftTime):SetShow(true)
          end
          do
            do
              ;
              (slot.icon):addInputEvent("Mouse_LUp", "HandleClicked_InventorySlot(" .. slotNo .. ")")
              ;
              (slot.icon):addInputEvent("Mouse_RUp", "HandleClicked_InventorySlot(" .. slotNo .. ")")
              -- DECOMPILER ERROR at PC324: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC324: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC324: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC324: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    self:MoneyUpdate()
    self:WeightUpdate()
    ;
    (self.pageValue):SetText(self.pageIndex + 1)
  end
end

HandleClicked_InventorySlot = function(slotNo)
  -- function num : 0_2 , upvalues : remoteInven
  local self = remoteInven
  local inventoryType = self.currentWhereType
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if itemWrapper == nil then
    return 
  end
  if Panel_Win_System:GetShow() then
    return 
  end
  local itemSSW = itemWrapper:getStaticStatus()
  local itemStatic = (itemWrapper:getStaticStatus()):get()
  if ((getSelfPlayer()):get()):doRideMyVehicle() and itemStatic:isUseToVehicle() then
    inventoryUseItem(inventoryType, slotNo, nil, false)
    return 
  end
  local itemCount_s64 = (itemWrapper:get()):getCount_s64()
  local actorKeyRaw = (getSelfPlayer()):getActorKey()
  if Panel_RemoteWarehouse:GetShow() then
    Warehouse_PushFromInventoryItem(itemCount_s64, inventoryType, slotNo, actorKeyRaw)
    return 
  end
  if Panel_RemoteManufacture:GetShow() then
    return 
  end
  if ((itemSSW:get())._vestedType):getItemKey() == 2 and (itemWrapper:get()):isVested() == false then
    local bindingItemUse = function()
    -- function num : 0_2_0 , upvalues : inventoryType, slotNo
    Inventory_UseItemTargetSelf(inventoryType, slotNo, nil)
  end

    local messageContent = nil
    if itemSSW:isUserVested() then
      messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT_USERVESTED")
    else
      messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT")
    end
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_TITLE"), content = messageContent, functionYes = bindingItemUse, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      if eConnectUiType.eConnectUi_Undefined ~= (itemWrapper:getStaticStatus()):getConnectUi() then
        FGlobal_RemoteControl_Hide()
        ConnectUI((itemWrapper:getStaticStatus()):getConnectUi())
      else
        if itemSSW:isPopupItem() then
          Panel_UserItem_PopupItem(itemSSW, inventoryType, slotNo)
        else
          if not itemStatic:isUseToVehicle() then
            local useTradeItem = function()
    -- function num : 0_2_1 , upvalues : inventoryType, slotNo
    Inventory_UseItemTargetSelf(inventoryType, slotNo)
  end

            local item_type = itemSSW:getItemType()
            if item_type == 2 and (itemSSW:get()):isForJustTrade() == true then
              local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRADEITEMUSE_CONTENT")
              local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRADEITEMUSE_TITLE"), content = messageContent, functionYes = useTradeItem, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
              ;
              (MessageBox.showMessageBox)(messageboxData)
            else
              do
                local equipType = (itemWrapper:getStaticStatus()):getEquipType()
                if equipType == 16 or equipType == 17 then
                  local accSlotNo = FGlobal_AccSlotNo(itemWrapper)
                  Inventory_UseItemTargetSelf(inventoryType, slotNo, accSlotNo)
                else
                  do
                    do
                      Inventory_UseItemTargetSelf(inventoryType, slotNo)
                      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_CANT_USEITEM"))
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
end

RemoteInven_ItemComparer = function(ii, jj)
  -- function num : 0_3 , upvalues : remoteInven
  Global_ItemComparer(ii, jj, getInventoryItemByType, remoteInven.currentWhereType)
end

remoteInven.MoneyUpdate = function(self)
  -- function num : 0_4
  local money = (Defines.s64_const).s64_0
  local pearl = (Defines.s64_const).s64_0
  local mileage = (Defines.s64_const).s64_0
  local moneyItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, getMoneySlotNo())
  if moneyItemWrapper ~= nil then
    money = (moneyItemWrapper:get()):getCount_s64()
  end
  local pearlItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getPearlSlotNo())
  if pearlItemWrapper ~= nil then
    pearl = (pearlItemWrapper:get()):getCount_s64()
  end
  local mileagelItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getMileageSlotNo())
  if mileagelItemWrapper ~= nil then
    mileage = (mileagelItemWrapper:get()):getCount_s64()
  end
  ;
  (self.moneyValue):SetText(makeDotMoney(money))
  ;
  (self.pearlValue):SetText(makeDotMoney(pearl))
  ;
  (self.mileValue):SetText(makeDotMoney(mileage))
end

remoteInven.WeightUpdate = function(self)
  -- function num : 0_5
  local selfPlayer = (getSelfPlayer()):get()
  local normalInventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local s64_moneyWeight = normalInventory:getMoneyWeight_s64()
  local s64_equipmentWeight = (selfPlayer:getEquipment()):getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local s64_allWeight_div = s64_allWeight / (Defines.s64_const).s64_100
  local s64_maxWeight_div = s64_maxWeight / (Defines.s64_const).s64_100
  local str_AllWeight = (string.format)("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local str_MaxWeight = (string.format)("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  if Int64toInt32(s64_allWeight) <= Int64toInt32(s64_maxWeight) then
    (self.progress_Money):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_maxWeight_div))
    ;
    (self.progress_Equip):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_maxWeight_div))
    ;
    (self.progress_Weight):SetProgressRate(Int64toInt32(s64_allWeight / s64_maxWeight_div))
  else
    ;
    (self.progress_Money):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_allWeight_div))
    ;
    (self.progress_Equip):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_allWeight_div))
    ;
    (self.progress_Weight):SetProgressRate(Int64toInt32(s64_allWeight / s64_allWeight_div))
  end
  ;
  (self.weightValue):SetText(str_AllWeight .. " / " .. str_MaxWeight .. " LT")
end

RemoteInven_PageMove = function(isNext)
  -- function num : 0_6 , upvalues : remoteInven
  local self = remoteInven
  if isNext then
    local invenUseSize = ((getSelfPlayer()):get()):getInventorySlotCount(not (self.radioBtn_Normal):IsCheck())
    if (self.pageIndex + 1) * self.maxSlotCount < invenUseSize - 2 then
      self.pageIndex = self.pageIndex + 1
    else
      return 
    end
  else
    do
      self.pageIndex = (math.max)(self.pageIndex - 1, 0)
      self:Update()
    end
  end
end

RemoteInven_SetWhereType = function(isNormal)
  -- function num : 0_7 , upvalues : remoteInven
  local self = remoteInven
  if isNormal then
    self.currentWhereType = (CppEnums.ItemWhereType).eInventory
  else
    self.currentWhereType = (CppEnums.ItemWhereType).eCashInventory
  end
  self.pageIndex = 0
  self:Update()
  FGlobal_RemoteControl_SetInven()
end

RemoteInven_SetSorted = function()
  -- function num : 0_8 , upvalues : remoteInven
  local self = remoteInven
  local bSorted = (self.checkBtn_Sort):IsCheck()
  ToClient_SetSortedInventory(bSorted)
  self:Update()
end

remoteInven.Open = function(self)
  -- function num : 0_9
  Inventory_SetCheckRadioButtonNormalInventory(true)
  self.pageIndex = 0
  ;
  (self.radioBtn_Normal):SetCheck(true)
  ;
  (self.radioBtn_Pearl):SetCheck(false)
  RemoteInven_SetWhereType(true)
  self:Update()
  Panel_RemoteInventory:SetShow(true)
  ;
  (self.checkBtn_Sort):SetShow(false)
  Panel_RemoteInventory:SetPosX(getScreenSizeX() - Panel_RemoteInventory:GetSizeX() - 10)
  Panel_RemoteInventory:SetPosY(getScreenSizeY() / 2 - Panel_RemoteInventory:GetSizeY() / 2)
end

remoteInven.Close = function(self)
  -- function num : 0_10
  Panel_RemoteInventory:SetShow(false)
end

FGlobal_RemoteInven_ShowToggle = function(isWarehouse)
  -- function num : 0_11 , upvalues : remoteInven
  if Panel_RemoteInventory:GetShow() then
    remoteInven:Close()
  else
    remoteInven:Open()
  end
  if isWarehouse then
    Panel_RemoteInventory:SetPosY(getScreenSizeY() / 2 - Panel_RemoteInventory:GetSizeY() / 2 - 100)
  else
    FGlobal_RemoteEquip_ShowToggle()
  end
end

FGlobal_RemoteInven_CheckNormalInven = function()
  -- function num : 0_12 , upvalues : remoteInven
  return (remoteInven.radioBtn_Normal):IsCheck()
end

FGboal_RemoteInven_CurrentWhereType = function()
  -- function num : 0_13 , upvalues : remoteInven
  return remoteInven.currentWhereType
end

RemoteInven_updateSlotData = function()
  -- function num : 0_14 , upvalues : remoteInven
  remoteInven:Update()
end

remoteInven.registerEvnet = function(self)
  -- function num : 0_15
  (self.btn_Prev):addInputEvent("Mouse_LUp", "RemoteInven_PageMove(false)")
  ;
  (self.btn_Next):addInputEvent("Mouse_LUp", "RemoteInven_PageMove(true)")
  ;
  (self.radioBtn_Normal):addInputEvent("Mouse_LUp", "RemoteInven_SetWhereType(true)")
  ;
  (self.radioBtn_Pearl):addInputEvent("Mouse_LUp", "RemoteInven_SetWhereType(false)")
  ;
  (self.checkBtn_Sort):addInputEvent("Mouse_LUp", "RemoteInven_SetSorted()")
  registerEvent("FromClient_WeightChanged", "RemoteInven_updateSlotData")
  registerEvent("FromClient_InventoryUpdate", "RemoteInven_updateSlotData")
end

remoteInven:Init()
remoteInven:registerEvnet()

