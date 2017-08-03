-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\remotecontrol\panel_remotewarehouse.luac 

-- params : ...
-- function num : 0
Panel_RemoteWarehouse:SetShow(false)
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local remoteWarehouse = {slotBg = (UI.getChildControl)(Panel_RemoteWarehouse, "Static_SlotBg"), btn_Prev = (UI.getChildControl)(Panel_RemoteWarehouse, "Button_Prev"), btn_Next = (UI.getChildControl)(Panel_RemoteWarehouse, "Button_Next"), pageValue = (UI.getChildControl)(Panel_RemoteWarehouse, "StaticText_PageValue"), capacity = (UI.getChildControl)(Panel_RemoteWarehouse, "StaticText_Capacity"), moneyValue = (UI.getChildControl)(Panel_RemoteWarehouse, "Static_Text_Money"), assetValue = (UI.getChildControl)(Panel_RemoteWarehouse, "StaticText_MarketValue"), maxSlotCount = 8, slotBgBasePosX = 20, slotBgBasePosY = 60, 
config = {createBorder = true, createIcon = true, createExpirationBG = true, createExpiration2h = true, createRemoteEnchant = true, createCash = true, createClassEquipBG = true}
, pageIndex = 0, 
itemSlot = {}
, isFilter = false}
local tempSlot = {itemSlotBg = (UI.getChildControl)(remoteWarehouse.slotBg, "Static_SlotBG"), itemName = (UI.getChildControl)(remoteWarehouse.slotBg, "StaticText_ItemName"), itemCount = (UI.getChildControl)(remoteWarehouse.slotBg, "StaticText_Count"), leftTime = (UI.getChildControl)(remoteWarehouse.slotBg, "StaticText_LeftTime")}
remoteWarehouse.Init = function(self)
  -- function num : 0_0 , upvalues : UCT, tempSlot
  for index = 0, self.maxSlotCount - 1 do
    local temp = {}
    temp.slotBg = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, Panel_RemoteWarehouse, "Static_SlotBg_" .. index)
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
    (SlotItem.new)(slot, "RemoteWarehouseItemIcon_" .. index, index, temp.itemSlotBg, self.config)
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
    -- DECOMPILER ERROR at PC223: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self.itemSlot)[index]).bg = temp.slotBg
  end
end

remoteWarehouse.Update = function(self)
  -- function num : 0_1 , upvalues : UI_color
  local warehouseWrapper = warehouse_get(getCurrentWaypointKey())
  if warehouseWrapper == nil then
    return 
  end
  local useStartSlot = 1
  local itemCount = warehouseWrapper:getSize()
  local useMaxCount = warehouseWrapper:getUseMaxCount()
  local freeCount = warehouseWrapper:getFreeCount()
  local money_s64 = warehouseWrapper:getMoney_s64()
  local maxCount = warehouseWrapper:getMaxCount()
  if useMaxCount - useStartSlot < itemCount then
    (self.capacity):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "Lua_WareHouse_OverCapacity", "HaveCount", tostring(itemCount), "FullCount", tostring(useMaxCount - useStartSlot)))
  else
    ;
    (self.capacity):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "Lua_WareHouse_Capacity", "HaveCount", tostring(itemCount), "FullCount", tostring(useMaxCount - useStartSlot)))
  end
  ;
  (self.moneyValue):SetText(makeDotMoney(money_s64))
  local myAsset = toInt64(0, 0)
  if useMaxCount >= 2 then
    for index = 0, useMaxCount - 2 do
      local slotNo = index + useStartSlot
      local itemWrapper = warehouseWrapper:getItem(slotNo)
      if itemWrapper ~= nil then
        local itemSSW = itemWrapper:getStaticStatus()
        local itemEnchantKey = ((itemSSW:get())._key):get()
        local itemCount_s64 = (itemWrapper:get()):getCount_s64()
        local npcSellPrice_s64 = (itemSSW:get())._sellPriceToNpc_s64
        local tradeInfo = nil
        local tradeSummaryInfo = getItemMarketSummaryInClientByItemEnchantKey(itemEnchantKey)
        local tradeMasterInfo = getItemMarketMasterByItemEnchantKey(itemEnchantKey)
        if tradeSummaryInfo ~= nil then
          tradeInfo = tradeSummaryInfo
        else
          if tradeMasterInfo ~= nil then
            tradeInfo = tradeMasterInfo
          else
            tradeInfo = nil
          end
        end
        if tradeInfo ~= nil then
          if tradeSummaryInfo ~= nil and toInt64(0, 0) ~= tradeSummaryInfo:getDisplayedTotalAmount() then
            myAsset = myAsset + (tradeInfo:getDisplayedLowestOnePrice() + tradeInfo:getDisplayedHighestOnePrice()) / toInt64(0, 2) * itemCount_s64
          else
            myAsset = myAsset + (tradeMasterInfo:getMinPrice() + tradeMasterInfo:getMaxPrice()) / toInt64(0, 2) * itemCount_s64
          end
        else
          myAsset = myAsset + npcSellPrice_s64 * itemCount_s64
        end
      end
    end
  end
  do
    ;
    (self.assetValue):SetText(makeDotMoney(myAsset + money_s64))
    for index = 0, self.maxSlotCount - 1 do
      local slotNo = index + self.pageIndex * self.maxSlotCount + useStartSlot
      local itemWrapper = warehouseWrapper:getItem(slotNo)
      if itemWrapper == nil then
        local slot = (self.itemSlot)[index]
        slot:clearItem()
        ;
        (slot.itemName):SetShow(false)
        ;
        (slot.itemCount):SetShow(false)
        ;
        (slot.leftTime):SetShow(false)
        ;
        (slot.bg):addInputEvent("Mouse_RUp", "")
      else
        do
          local itemSSW = itemWrapper:getStaticStatus()
          local itemEnchantKey = ((itemSSW:get())._key):get()
          local itemCount_s64 = (itemWrapper:get()):getCount_s64()
          local npcSellPrice_s64 = (itemSSW:get())._sellPriceToNpc_s64
          local slot = (self.itemSlot)[index]
          slot:setItem(itemWrapper, R23_PC209)
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
                    (slot.itemName):SetFontColor(UI_color.C_FFFFFFFF)
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
            ;
            (slot.bg):addInputEvent("Mouse_RUp", "RemoteWarehouse_MoveToInven(" .. R28_PC422 .. ")")
            ;
            (slot.icon):addInputEvent("Mouse_RUp", "RemoteWarehouse_MoveToInven(" .. R28_PC422 .. ")")
            self.isFilter = false
            if Panel_RemoteManufacture:GetShow() then
              local actionIndex, actionName = FGlobal_RemoteManufactureActionIndex()
              local regionKey = (getSelfPlayer()):getRegionKey()
              -- DECOMPILER ERROR at PC447: Overwrote pending register: R28 in 'AssignReg'

              if actionIndex > 0 then
                local isEnable = isManufactureItemInWareHouse(R28_PC422, slotNo, actionName)
                -- DECOMPILER ERROR at PC451: Overwrote pending register: R28 in 'AssignReg'

                self.isFilter = R28_PC422
                -- DECOMPILER ERROR at PC453: Overwrote pending register: R28 in 'AssignReg'

                -- DECOMPILER ERROR at PC454: Overwrote pending register: R28 in 'AssignReg'

                R28_PC422(R28_PC422, "Mouse_RUp", "RemoteWarehouse_SetManufacture(" .. R32_PC459 .. ")")
                -- DECOMPILER ERROR at PC461: Overwrote pending register: R28 in 'AssignReg'

                -- DECOMPILER ERROR at PC462: Overwrote pending register: R28 in 'AssignReg'

                R28_PC422(R28_PC422, "Mouse_RUp", "RemoteWarehouse_SetManufacture(" .. R32_PC459 .. ")")
              end
            end
            do
              do
                ;
                (slot.bg):SetMonoTone(self.isFilter)
                -- DECOMPILER ERROR at PC473: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC473: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC473: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC473: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC473: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
    ;
    (self.pageValue):SetText(self.pageIndex + 1)
  end
end

RemoteWarehouse_MoveToInven = function(index)
  -- function num : 0_2 , upvalues : remoteWarehouse
  local self = remoteWarehouse
  local slotNo = index + self.pageIndex * self.maxSlotCount + 1
  local warehouseWrapper = warehouse_get(getCurrentWaypointKey())
  if warehouseWrapper == nil then
    return 
  end
  local itemWrapper = warehouseWrapper:getItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  local moveInvenFromRemoteWarehouse = function(inputNumber)
    -- function num : 0_2_0 , upvalues : slotNo
    warehouse_popToInventoryByNpc(slotNo, inputNumber, (getSelfPlayer()):getActorKey())
  end

  Panel_NumberPad_Show(true, (itemWrapper:get()):getCount_s64(), slotNo, moveInvenFromRemoteWarehouse)
end

RemoteWarehouse_SetManufacture = function(index)
  -- function num : 0_3 , upvalues : remoteWarehouse
  local self = remoteWarehouse
  local slotNo = index + self.pageIndex * self.maxSlotCount + 1
  local warehouseWrapper = warehouse_get(getCurrentWaypointKey())
  if warehouseWrapper == nil then
    return 
  end
  local itemWrapper = warehouseWrapper:getItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  FGlobal_RemoteManufacture_SetItem(slotNo)
end

RemoteWarehouse_PageMove = function(isNext)
  -- function num : 0_4 , upvalues : remoteWarehouse
  local self = remoteWarehouse
  if isNext then
    local warehouseWrapper = warehouse_get(getCurrentWaypointKey())
    local useMaxCount = warehouseWrapper:getUseMaxCount()
    if (self.pageIndex + 1) * self.maxSlotCount < useMaxCount - 1 then
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

remoteWarehouse.ShowToggle = function(self)
  -- function num : 0_5
  if Panel_RemoteWarehouse:GetShow() then
    Panel_RemoteWarehouse:SetShow(false)
  else
    warehouse_requestInfo(getCurrentWaypointKey())
    Panel_RemoteWarehouse:SetShow(true)
    self:Update()
    Panel_RemoteWarehouse:SetPosX(getScreenSizeX() - Panel_RemoteInventory:GetSizeX() - Panel_RemoteWarehouse:GetSizeX() - 10)
  end
end

FGlobal_Dialog_WarehouseOpen = function()
  -- function num : 0_6 , upvalues : remoteWarehouse
  remoteWarehouse:ShowToggle()
  FGlobal_RemoteInven_ShowToggle(true)
end

FGlobal_RemoteWarehouse_Update = function()
  -- function num : 0_7 , upvalues : remoteWarehouse
  remoteWarehouse:Update()
end

remoteWarehouse.registerEvnet = function(self)
  -- function num : 0_8
  (self.btn_Prev):addInputEvent("Mouse_LUp", "RemoteWarehouse_PageMove(false)")
  ;
  (self.btn_Next):addInputEvent("Mouse_LUp", "RemoteWarehouse_PageMove(true)")
  registerEvent("EventWarehouseUpdate", "FGlobal_RemoteWarehouse_Update")
end

remoteWarehouse:Init()
remoteWarehouse:registerEvnet()

