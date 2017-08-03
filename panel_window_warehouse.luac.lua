-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\warehouse\panel_window_warehouse.luac 

-- params : ...
-- function num : 0
Panel_Window_Warehouse:SetShow(false, false)
Panel_Window_Warehouse:setMaskingChild(true)
Panel_Window_Warehouse:ActiveMouseEventEffect(true)
Panel_Window_Warehouse:setGlassBackground(true)
Panel_Window_Warehouse:RegisterShowEventFunc(true, "WarehouseShowAni()")
Panel_Window_Warehouse:RegisterShowEventFunc(false, "WarehouseHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
WarehouseShowAni = function()
  -- function num : 0_0
  Panel_Window_Warehouse:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Window_Warehouse, 0, 0.15)
  audioPostEvent_SystemUi(1, 0)
end

WarehouseHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_Warehouse:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_Warehouse:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(1, 0)
end

local effectScene = {
newItem = {}
}
local _wareHouse_HelpMovie = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_Window_Warehouse, "Static_ClassMovie")
local _wareHouse_HelpMovie_Btn = (UI.getChildControl)(Panel_Window_Warehouse, "Static_MoviePlayButton")
local _wareHouseHelp = (UI.getChildControl)(Panel_Window_Warehouse, "StaticText_LoaderHelp")
local warehouse = {
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCooltime = true, createExpiration = true, createExpirationBG = true, createExpiration2h = true, createClassEquipBG = true, createEnduranceIcon = true, createCash = true, createEnduranceIcon = true, createCheckBox = true}
, 
config = {slotCount = 64, slotCols = 8, slotRows = 0, slotStartX = 19, slotStartY = 64, slotGapX = 47, slotGapY = 47}
, blankSlots = (Array.new)(), slots = (Array.new)(), 
slotNilEffect = {}
, 
slotFilterEffect = {}
, staticTitle = (UI.getChildControl)(Panel_Window_Warehouse, "Static_Text_Title"), staticCapacity = (UI.getChildControl)(Panel_Window_Warehouse, "Static_Text_Capacity"), staticWeight = (UI.getChildControl)(Panel_Window_Warehouse, "Static_Text_Weight"), staticMoney = (UI.getChildControl)(Panel_Window_Warehouse, "Static_Text_Money"), buttonMoney = (UI.getChildControl)(Panel_Window_Warehouse, "Button_Money"), buttonMoney2 = (UI.getChildControl)(Panel_Window_Warehouse, "Button_Money_2"), buttonClose = (UI.getChildControl)(Panel_Window_Warehouse, "Button_Win_Close"), buttonQuestion = (UI.getChildControl)(Panel_Window_Warehouse, "Button_Question"), checkSort = (UI.getChildControl)(Panel_Window_Warehouse, "CheckButton_ItemSort"), BtnMarketRegist = (UI.getChildControl)(Panel_Window_Warehouse, "Button_ItemMarketRegist"), BtnManufacture = (UI.getChildControl)(Panel_Window_Warehouse, "Button_Manufacture"), _buttonDelivery = (UI.getChildControl)(Panel_Window_Warehouse, "Button_DeliveryInformation"), BtnGuildUpdate = (UI.getChildControl)(Panel_Window_Warehouse, "Button_GuildUpdate"), _scroll = (UI.getChildControl)(Panel_Window_Warehouse, "Scroll_WareHouse"), moneyTitle = (UI.getChildControl)(Panel_Window_Warehouse, "StaticText_MoneyTitle"), bottomBG = (UI.getChildControl)(Panel_Window_Warehouse, "Static_BlackPanel_Bottom1"), assetBG = (UI.getChildControl)(Panel_Window_Warehouse, "Static_BlackPanel_Bottom2"), assetTitle = (UI.getChildControl)(Panel_Window_Warehouse, "StaticText_AssetValueTitle"), assetValue = (UI.getChildControl)(Panel_Window_Warehouse, "StaticText_AssetValue"), _currentWaypointKey = 0, _currentRegionName = "None", _fromType = (CppEnums.WarehoouseFromType).eWarehoouseFromType_Worldmap, _installationActorKeyRaw = 0, _targetActorKeyRaw = nil, _deleteSlotNo = nil, _s64_deleteCount = (Defines.s64_const).s64_0, _startSlotIndex = 0, _tooltipSlotNo = nil, _myAsset = toInt64(0, 0), itemMarketFilterFunc = nil, itemMarketRclickFunc = nil, manufactureFilterFunc = nil, manufactureRclickFunc = nil, addSizeY = 30, sellCheck = false}
warehouse.init = function(self)
  -- function num : 0_2 , upvalues : _wareHouse_HelpMovie_Btn, _wareHouse_HelpMovie
  _wareHouse_HelpMovie_Btn:addInputEvent("Mouse_On", "Panel_WareHouse_MovieHelpFunc( true )")
  _wareHouse_HelpMovie_Btn:addInputEvent("Mouse_Out", "Panel_WareHouse_MovieHelpFunc( false )")
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).slotRows = (self.config).slotCount / (self.config).slotCols
  for ii = 0, (self.config).slotCount - 1 do
    local slotNo = ii + 1
    local slot = {}
    slot.empty = (UI.createAndCopyBasePropertyControl)(Panel_Window_Warehouse, "Static_Slot", Panel_Window_Warehouse, "Warehouse_Slot_Base_" .. ii)
    slot.lock = (UI.createAndCopyBasePropertyControl)(Panel_Window_Warehouse, "Static_LockedSlot", Panel_Window_Warehouse, "Warehouse_Slot_Lock_" .. ii)
    ;
    (UIScroll.InputEventByControl)(slot.empty, "Warehouse_Scroll")
    local row = (math.floor)(ii / (self.config).slotCols)
    local column = ii % (self.config).slotCols
    ;
    (slot.empty):SetPosX((self.config).slotStartX + (self.config).slotGapX * column)
    ;
    (slot.empty):SetPosY((self.config).slotStartY + (self.config).slotGapY * row)
    ;
    (slot.lock):SetPosX((self.config).slotStartX + (self.config).slotGapX * column)
    ;
    (slot.lock):SetPosY((self.config).slotStartY + (self.config).slotGapY * row)
    ;
    (slot.empty):SetShow(false)
    ;
    (slot.lock):SetShow(true)
    -- DECOMPILER ERROR at PC104: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (self.blankSlots)[ii] = slot
  end
  local group_1 = Panel_Window_Warehouse:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  for ii = 0, (self.config).slotCount - 1 do
    local slot = {}
    ;
    (SlotItem.new)(slot, "ItemIcon_" .. ii, ii, Panel_Window_Warehouse, self.slotConfig)
    slot:createChild()
    group_1:addControl(ii % 8, ii / 8, 8, 8, slot.icon)
    local row = (math.floor)(ii / (self.config).slotCols)
    local column = ii % (self.config).slotCols
    ;
    (slot.icon):SetPosX((self.config).slotStartX + (self.config).slotGapX * column)
    ;
    (slot.icon):SetPosY((self.config).slotStartY + (self.config).slotGapY * row)
    ;
    (slot.icon):SetEnableDragAndDrop(true)
    ;
    (slot.icon):SetAutoDisableTime(0.5)
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "HandleClickedWarehouseItem(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "Warehouse_DropHandler(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_PressMove", "Warehouse_SlotDrag(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "Warehouse_IconOver(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "Warehouse_IconOut(" .. ii .. ")")
    ;
    (UIScroll.InputEventByControl)(slot.icon, "Warehouse_Scroll")
    Panel_Tooltip_Item_SetPosition(ii, slot, "WareHouse")
    -- DECOMPILER ERROR at PC225: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (self.slots)[ii] = slot
  end
  ;
  (self.BtnManufacture):addInputEvent("Mouse_LUp", "HandleClicked_ManufactureOpen()")
  ;
  (self.BtnMarketRegist):addInputEvent("Mouse_LUp", "HandleClicked_WhItemMarketRegistItem_Open()")
  ;
  (self.BtnMarketRegist):SetShow(false)
  ;
  (self.BtnGuildUpdate):addInputEvent("Mouse_LUp", "HandleClicked_GuildWareHouseUpdate()")
  ;
  (self._scroll):SetShow(true)
  _wareHouse_HelpMovie:SetSize(320, 240)
  _wareHouse_HelpMovie:SetSpanSize(-1, 0)
  _wareHouse_HelpMovie:SetShow(false)
  ;
  (self.BtnManufacture):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WAREHOUSE_BTNTEXT_1"))
  ;
  (self.BtnMarketRegist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WAREHOUSE_BTNTEXT_2"))
  local btnDeliverySizeX = (self._buttonDelivery):GetSizeX() + 23
  local btnDeliveryTextPosX = btnDeliverySizeX - btnDeliverySizeX / 2 - (self._buttonDelivery):GetTextSizeX() / 2
  ;
  (self._buttonDelivery):SetTextSpan(btnDeliveryTextPosX, 5)
end

local btnMarketRegSpanSizeY = ((warehouse.BtnMarketRegist):GetSpanSize()).y
warehouse.update = function(self)
  -- function num : 0_3 , upvalues : warehouse
  local warehouseWrapper = self:getWarehouse()
  if warehouseWrapper == nil then
    return 
  end
  local addSizeY = 0
  if warehouse:isNpc() then
    addSizeY = self.addSizeY
  end
  local useStartSlot = 1
  local itemCount = warehouseWrapper:getSize()
  local useMaxCount = warehouseWrapper:getUseMaxCount()
  local freeCount = warehouseWrapper:getFreeCount()
  local money_s64 = warehouseWrapper:getMoney_s64()
  local maxCount = warehouseWrapper:getMaxCount()
  if useMaxCount - useStartSlot < itemCount then
    (self.staticCapacity):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "Lua_WareHouse_OverCapacity", "HaveCount", tostring(itemCount), "FullCount", tostring(useMaxCount - useStartSlot)))
  else
    ;
    (self.staticCapacity):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "Lua_WareHouse_Capacity", "HaveCount", tostring(itemCount), "FullCount", tostring(useMaxCount - useStartSlot)))
  end
  ;
  (self.staticMoney):SetText(makeDotMoney(money_s64))
  local slotNoList = (Array.new)()
  slotNoList:fill(useStartSlot, maxCount - 1)
  if (self.checkSort):IsCheck() then
    local sortList = (Array.new)()
    sortList:fill(useStartSlot, useMaxCount - 1)
    sortList:quicksort(Warehouse_ItemComparer)
    for ii = 1, useMaxCount - 1 do
      slotNoList[ii] = sortList[ii]
    end
  end
  do
    for ii = 0, (self.config).slotCount - 1 do
      local slot = (self.blankSlots)[ii]
      ;
      (slot.empty):SetShow(false)
      ;
      (slot.lock):SetShow(false)
      if ii < useMaxCount - useStartSlot - self._startSlotIndex then
        (slot.empty):SetShow(true)
      else
        ;
        (slot.lock):SetShow(true)
      end
    end
    ;
    (UIScroll.SetButtonSize)(self._scroll, (self.config).slotCount, maxCount - useStartSlot)
    for ii = 0, (self.config).slotCount - 1 do
      local slot = (self.slots)[ii]
      slot:clearItem()
      ;
      (slot.icon):SetEnable(true)
      ;
      (slot.icon):SetMonoTone(true)
    end
    if not self:isGuildHouse() then
      self._myAsset = toInt64(0, 0)
      if useMaxCount >= 2 then
        for ii = 0, useMaxCount - 2 do
          local slotNo = slotNoList[1 + ii + 0]
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
                self._myAsset = self._myAsset + (tradeInfo:getDisplayedLowestOnePrice() + tradeInfo:getDisplayedHighestOnePrice()) / toInt64(0, 2) * itemCount_s64
              else
                self._myAsset = self._myAsset + (tradeMasterInfo:getMinPrice() + tradeMasterInfo:getMaxPrice()) / toInt64(0, 2) * itemCount_s64
              end
            else
              self._myAsset = self._myAsset + npcSellPrice_s64 * itemCount_s64
            end
          end
        end
      end
      do
        ;
        (self.assetTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WAREHOUSE_ASSETS"))
        ;
        (self.assetValue):SetText(makeDotMoney(self._myAsset + money_s64))
        for ii = 0, (self.config).slotCount - 1 do
          local slot = (self.slots)[ii]
          local slotNo = slotNoList[1 + ii + self._startSlotIndex]
          slot.slotNo = slotNo
          local row = (math.floor)(ii / (self.config).slotCols)
          local column = ii % (self.config).slotCols
          ;
          (slot.icon):SetPosX((self.config).slotStartX + (self.config).slotGapX * column)
          ;
          (slot.icon):SetPosY((self.config).slotStartY + (self.config).slotGapY * row)
          ;
          (slot.icon):SetMonoTone(false)
          ;
          (slot.count):SetShow(false)
          local itemExist = false
          local itemWrapper = warehouseWrapper:getItem(slotNo)
          if itemWrapper ~= nil then
            slot:setItem(itemWrapper)
            if self.itemMarketFilterFunc ~= nil then
              if (self.itemMarketFilterFunc)(slot.icon, itemWrapper) == false then
                if (self.slotFilterEffect)[ii] then
                  (slot.icon):EraseEffect((self.slotFilterEffect)[ii])
                  -- DECOMPILER ERROR at PC342: Confused about usage of register: R20 in 'UnsetPending'

                  ;
                  (self.slotFilterEffect)[ii] = nil
                end
                -- DECOMPILER ERROR at PC351: Confused about usage of register: R20 in 'UnsetPending'

                ;
                (self.slotFilterEffect)[ii] = (slot.icon):AddEffect("UI_Inventory_Filtering", true, 0, 0)
                ;
                (slot.icon):SetMonoTone(false)
                ;
                (slot.icon):SetEnable(true)
                ;
                (slot.icon):SetIgnore(false)
              else
                if (self.slotFilterEffect)[ii] then
                  (slot.icon):EraseEffect((self.slotFilterEffect)[ii])
                  -- DECOMPILER ERROR at PC375: Confused about usage of register: R20 in 'UnsetPending'

                  ;
                  (self.slotFilterEffect)[ii] = nil
                end
                ;
                (slot.icon):SetMonoTone(true)
                ;
                (slot.icon):SetEnable(false)
                ;
                (slot.icon):SetIgnore(true)
              end
            else
              if self.manufactureFilterFunc ~= nil then
                if (self.manufactureFilterFunc)(slot.slotNo, itemWrapper) == false then
                  if (self.slotFilterEffect)[ii] then
                    (slot.icon):EraseEffect((self.slotFilterEffect)[ii])
                    -- DECOMPILER ERROR at PC408: Confused about usage of register: R20 in 'UnsetPending'

                    ;
                    (self.slotFilterEffect)[ii] = nil
                  end
                  -- DECOMPILER ERROR at PC417: Confused about usage of register: R20 in 'UnsetPending'

                  ;
                  (self.slotFilterEffect)[ii] = (slot.icon):AddEffect("UI_Inventory_Filtering", true, 0, 0)
                  ;
                  (slot.icon):SetMonoTone(false)
                  ;
                  (slot.icon):SetEnable(true)
                  ;
                  (slot.icon):SetIgnore(false)
                else
                  if (self.slotFilterEffect)[ii] then
                    (slot.icon):EraseEffect((self.slotFilterEffect)[ii])
                    -- DECOMPILER ERROR at PC441: Confused about usage of register: R20 in 'UnsetPending'

                    ;
                    (self.slotFilterEffect)[ii] = nil
                  end
                  ;
                  (slot.icon):SetMonoTone(true)
                  ;
                  (slot.icon):SetEnable(false)
                  ;
                  (slot.icon):SetIgnore(true)
                end
              else
                if (self.slotFilterEffect)[ii] then
                  (slot.icon):EraseEffect((self.slotFilterEffect)[ii])
                  -- DECOMPILER ERROR at PC465: Confused about usage of register: R20 in 'UnsetPending'

                  ;
                  (self.slotFilterEffect)[ii] = nil
                end
                ;
                (slot.icon):SetMonoTone(false)
                ;
                (slot.icon):SetEnable(true)
                ;
                (slot.icon):SetIgnore(false)
              end
            end
            do
              -- DECOMPILER ERROR at PC487: Unhandled construct in 'MakeBoolean' P1

              if self.itemMarketRclickFunc == nil or self.itemMarketFilterFunc == nil then
                local packingCount_s64 = delivery_getPackItemCount(slotNo)
                if (Defines.s64_const).s64_0 == (itemWrapper:get()):getCount_s64() then
                  (slot.icon):SetMonoTone(true)
                else
                  ;
                  (slot.count):SetShow(true)
                end
              end
              itemExist = true
              if self.sellCheck then
                if not warehouse_itemMarketFilterFunc(nil, itemWrapper) and not itemWrapper:isCash() and (itemWrapper:getStaticStatus()):isDisposalWareHouse() then
                  local isCheck = warehouseWrapper:isSellToSystem(slotNo)
                  ;
                  (slot.checkBox):SetShow(true)
                  ;
                  (slot.checkBox):SetCheck(isCheck)
                  ;
                  (slot.checkBox):addInputEvent("Mouse_LUp", "Warehouse_CheckBoxSet(" .. slotNo .. ")")
                  ;
                  (slot.icon):SetMonoTone(false)
                else
                  do
                    do
                      ;
                      (slot.icon):SetMonoTone(true)
                      ;
                      (slot.checkBox):SetShow(false)
                      if (self.slotFilterEffect)[ii] ~= nil then
                        (slot.icon):EraseEffect((self.slotFilterEffect)[ii])
                        -- DECOMPILER ERROR at PC569: Confused about usage of register: R20 in 'UnsetPending'

                        ;
                        (self.slotFilterEffect)[ii] = nil
                      end
                      ;
                      (slot.icon):SetMonoTone(false)
                      ;
                      (slot.icon):SetEnable(true)
                      ;
                      (slot.icon):SetIgnore(false)
                      if not itemExist then
                        slot:clearItem()
                        ;
                        (slot.icon):SetEnable(true)
                        ;
                        (slot.icon):SetMonoTone(true)
                        ;
                        (slot.icon):SetIgnore(false)
                      end
                      -- DECOMPILER ERROR at PC598: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC598: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                      -- DECOMPILER ERROR at PC598: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC598: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC598: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC598: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC598: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC598: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
        if not self:isGuildHouse() then
          (self.bottomBG):SetSize((self.bottomBG):GetSizeX(), 85)
          ;
          (self.assetBG):SetShow(true)
          ;
          (self.assetTitle):SetShow(true)
          ;
          (self.assetValue):SetShow(true)
          ;
          (self.buttonMoney2):SetShow(true)
        else
          ;
          (self.bottomBG):SetSize((self.bottomBG):GetSizeX(), 55)
          ;
          (self.assetBG):SetShow(false)
          ;
          (self.assetTitle):SetShow(false)
          ;
          (self.assetValue):SetShow(false)
          ;
          (self.buttonMoney2):SetShow(false)
        end
        Panel_Tooltip_Item_hideTooltip()
        WareHouse_PanelSize_Change(warehouse:isNpc())
      end
    end
  end
end

warehouse.isNpc = function(self)
  -- function num : 0_4
  do return (CppEnums.WarehoouseFromType).eWarehoouseFromType_Npc == self._fromType end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

warehouse.isInstallation = function(self)
  -- function num : 0_5
  do return (CppEnums.WarehoouseFromType).eWarehoouseFromType_Installation == self._fromType end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

warehouse.isWorldMapNode = function(self)
  -- function num : 0_6
  do return (CppEnums.WarehoouseFromType).eWarehoouseFromType_Worldmap == self._fromType end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

warehouse.isGuildHouse = function(self)
  -- function num : 0_7
  do return (CppEnums.WarehoouseFromType).eWarehoouseFromType_GuildHouse == self._fromType end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

warehouse.isMaid = function(self)
  -- function num : 0_8
  do return (CppEnums.WarehoouseFromType).eWarehoouseFromType_Maid == self._fromType end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

warehouse.isManufacture = function(self)
  -- function num : 0_9
  do return (CppEnums.WarehoouseFromType).eWarehoouseFromType_Manufacture == self._fromType end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

warehouse.isDeliveryWindow = function(self)
  -- function num : 0_10
  return Panel_Window_Delivery_Request:GetShow()
end

warehouse.getWarehouse = function(self)
  -- function num : 0_11 , upvalues : warehouse
  local warehouseWrapper = nil
  if warehouse:isGuildHouse() then
    warehouseWrapper = warehouse_getGuild()
  else
    warehouseWrapper = warehouse_get(self._currentWaypointKey)
  end
  return warehouseWrapper
end

FGlobal_WarehouseOpenByMaidCheck = function()
  -- function num : 0_12 , upvalues : warehouse
  return warehouse:isMaid()
end

Panel_WareHouse_MovieHelpFunc = function(isOn)
  -- function num : 0_13 , upvalues : _wareHouse_HelpMovie, _wareHouseHelp, UI_TM
  _wareHouse_HelpMovie:SetPosX(Panel_Window_Warehouse:GetSizeX())
  _wareHouse_HelpMovie:SetPosY(70)
  _wareHouseHelp:SetPosX(_wareHouse_HelpMovie:GetPosX())
  _wareHouseHelp:SetPosY(_wareHouse_HelpMovie:GetPosY() - _wareHouseHelp:GetSizeY())
  if isOn == true then
    _wareHouseHelp:SetShow(true)
    _wareHouseHelp:SetSize(320, 40)
    _wareHouseHelp:SetTextMode(UI_TM.eTextMode_AutoWrap)
    _wareHouseHelp:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_WAREHOUSE_HELP"))
    _wareHouse_HelpMovie:SetShow(true)
    _wareHouse_HelpMovie:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/WareHouse_AddSlot_KR.webm")
  else
    _wareHouseHelp:SetShow(false)
    _wareHouse_HelpMovie:SetShow(false)
  end
end

warehouse.registMessageHandler = function(self)
  -- function num : 0_14
  registerEvent("FromClient_WarehouseOpenByInstallation", "FromClient_WarehouseOpenByInstallation")
  registerEvent("EventWarehouseUpdate", "FromClient_WarehouseUpdate")
  registerEvent("FromClient_WarehouseClose", "FromClient_WarehouseClose")
  registerEvent("EventGuildWarehouseUpdate", "FromClient_GuildWarehouseUpdate")
end

warehouse.registEventHandler = function(self)
  -- function num : 0_15
  (UIScroll.InputEvent)(self._scroll, "Warehouse_Scroll")
  ;
  (UIScroll.InputEventByControl)(Panel_Window_Warehouse, "Warehouse_Scroll")
  ;
  (self.buttonClose):addInputEvent("Mouse_LUp", "Warehouse_Close()")
  ;
  (self.buttonMoney):addInputEvent("Mouse_LUp", "HandleClickedWarehousePopMoney()")
  ;
  (self.buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"WareHouse\" )")
  ;
  (self.buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"WareHouse\", \"true\")")
  ;
  (self.buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"WareHouse\", \"false\")")
  ;
  (self._buttonDelivery):addInputEvent("Mouse_LUp", "Warehouse_OpenDelivery()")
  ;
  (self.checkSort):addInputEvent("Mouse_LUp", "Warehouse_CheckSort()")
end

FGlobal_Warehouse_IsMoveItem = function()
  -- function num : 0_16 , upvalues : warehouse
  local self = warehouse
  if self:isNpc() or self:isInstallation() or not self:isWorldMapNode() or self:isDeliveryWindow() or self:isGuildHouse() or self:isMaid() then
    return true
  end
  return false
end

FromClient_WarehouseUpdate = function()
  -- function num : 0_17 , upvalues : warehouse
  if not Panel_Window_Warehouse:GetShow() then
    return 
  end
  local self = warehouse
  self:update()
end

FromClient_WarehouseClose = function()
  -- function num : 0_18
  Warehouse_Close()
end

FromClient_GuildWarehouseUpdate = function(bForcedOpen, bForcedClose)
  -- function num : 0_19 , upvalues : warehouse
  if Worldmap_Grand_GuildHouseControl:GetShow() or Worldmap_Grand_GuildCraft:GetShow() then
    return 
  end
  if Panel_Window_NpcShop:IsShow() then
    NpcShop_UpdateContent()
    return 
  end
  if bForcedOpen == false and Panel_Window_Warehouse:GetShow() == false then
    return 
  end
  if bForcedClose == true then
    Warehouse_Close()
    return 
  end
  if Panel_Window_Warehouse:GetShow() and not (warehouse.BtnGuildUpdate):GetShow() then
    return 
  end
  local self = warehouse
  self._currentWaypointKey = 0
  self._fromType = (CppEnums.WarehoouseFromType).eWarehoouseFromType_GuildHouse
  self._currentRegionName = PAGetString(Defines.StringSheet_GAME, "Lua_WareHouse_CurrentRegionName")
  ;
  (self.staticTitle):SetText(self._currentRegionName)
  self:update()
  if FGlobal_Warehouse_IsMoveItem() then
    (self.buttonMoney):SetIgnore(false)
  else
    ;
    (self.buttonMoney):SetIgnore(true)
  end
  ;
  (warehouse.BtnMarketRegist):SetShow(false)
  ;
  (warehouse.BtnManufacture):SetShow(false)
  ;
  (warehouse._buttonDelivery):SetShow(false)
  ;
  (warehouse.BtnGuildUpdate):SetShow(true)
  Warehouse_SetIgnoreMoneyButton(true)
  Panel_Window_Warehouse:ChangeSpecialTextureInfoName("")
  Panel_Window_Warehouse:SetAlphaExtraChild(1)
  Panel_Window_Warehouse:SetShow(true, true)
  Warehouse_OpenWithInventory()
end

local panelSizeY = Panel_Window_Warehouse:GetSizeY()
local bg1_y = (warehouse.bottomBG):GetSizeY()
local bg2_y = (warehouse.assetBG):GetSizeY()
local assetTitlePosY = (warehouse.assetTitle):GetPosY()
local assetValuePosY = (warehouse.assetValue):GetPosY()
local staticCapacityPosY = (warehouse.staticCapacity):GetPosY()
local moneyValuePosY = (warehouse.staticMoney):GetPosY()
WareHouse_PanelSize_Change = function(isNpc)
  -- function num : 0_20 , upvalues : warehouse, staticCapacityPosY, panelSizeY, bg1_y, bg2_y, assetTitlePosY, assetValuePosY, moneyValuePosY
  local self = warehouse
  local bigSizeY = nil
  if isNpc then
    bigSizeY = self.addSizeY
    ;
    (self.moneyTitle):SetShow(true)
    if (self.BtnManufacture):GetShow() or (self.BtnMarketRegist):GetShow() then
      (self.staticCapacity):SetPosY(staticCapacityPosY - 14)
    else
      ;
      (self.staticCapacity):SetPosY(staticCapacityPosY + bigSizeY)
    end
  else
    bigSizeY = 0
    ;
    (self.moneyTitle):SetShow(false)
    ;
    (self.staticCapacity):SetPosY(staticCapacityPosY + bigSizeY)
  end
  if not self:isGuildHouse() then
    Panel_Window_Warehouse:SetSize(Panel_Window_Warehouse:GetSizeX(), panelSizeY + bigSizeY)
  else
    Panel_Window_Warehouse:SetSize(Panel_Window_Warehouse:GetSizeX(), panelSizeY - bigSizeY)
  end
  ;
  (self.bottomBG):SetSize((self.bottomBG):GetSizeX(), bg1_y + bigSizeY)
  ;
  (self.assetBG):SetSize((self.assetBG):GetSizeX(), bg2_y + bigSizeY)
  ;
  (self.assetTitle):SetPosY(assetTitlePosY + bigSizeY)
  ;
  (self.assetValue):SetPosY(assetValuePosY + bigSizeY)
  ;
  (self.staticMoney):SetPosY(moneyValuePosY + bigSizeY)
  ;
  (self.buttonMoney):SetSpanSize((self.staticMoney):GetTextSizeX() + (self.buttonMoney):GetSizeX() + 2, ((self.staticMoney):GetSpanSize()).y - 7)
  ;
  (self.buttonMoney2):SetSpanSize((self.assetValue):GetTextSizeX() + (self.buttonMoney2):GetSizeX() + 5, ((self.assetValue):GetSpanSize()).y - 7)
end

Warehouse_ItemComparer = function(ii, jj)
  -- function num : 0_21
  return Global_ItemComparer(ii, jj, Warehouse_GetItem)
end

Warehouse_CheckSort = function()
  -- function num : 0_22 , upvalues : warehouse
  local self = warehouse
  if self.sellCheck then
    audioPostEvent_SystemUi(0, 0)
    local isSorted = (self.checkSort):IsCheck()
    ToClient_SetSortedWarehouse(isSorted)
    FromClient_WarehouseUpdate()
  end
end

Warehouse_OpenDelivery = function()
  -- function num : 0_23 , upvalues : warehouse
  local self = warehouse
  DeliveryInformation_OpenPanelFromWorldmap(self._currentWaypointKey)
end

HandleClickedWarehousePopMoney = function()
  -- function num : 0_24 , upvalues : warehouse
  local self = warehouse
  local slotNo = getMoneySlotNo()
  if not FGlobal_Warehouse_IsMoveItem() then
    return 
  end
  HandleClickedWarehouseItemXXX(slotNo)
end

HandleClickedWarehouseItem = function(index)
  -- function num : 0_25 , upvalues : warehouse
  if Warehouse_DropHandler(index) then
    return 
  end
  if not FGlobal_Warehouse_IsMoveItem() then
    return 
  end
  local self = warehouse
  local slotNo = ((self.slots)[index]).slotNo
  if self.itemMarketRclickFunc == nil and self.manufactureRclickFunc == nil then
    HandleClickedWarehouseItemXXX(slotNo)
  else
    local warehouseWrapper = self:getWarehouse()
    local itemWrapper = warehouseWrapper:getItem(slotNo)
    if self.manufactureRclickFunc ~= nil then
      (self.manufactureRclickFunc)(slotNo, itemWrapper, (itemWrapper:get()):getCount_s64())
    else
      if itemWrapper ~= nil then
        warehouse_itemMarketRclickFunc(slotNo, itemWrapper, (itemWrapper:get()):getCount_s64())
      end
    end
  end
end

HandleClickedWarehouseItemXXX = function(slotNo)
  -- function num : 0_26 , upvalues : warehouse
  local self = warehouse
  local warehouseWrapper = self:getWarehouse()
  local itemWrapper = warehouseWrapper:getItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  if (Defines.s64_const).s64_0 == (itemWrapper:get()):getCount_s64() then
    return 
  end
  FGlobal_PopupMoveItem_Init(nil, slotNo, (CppEnums.MoveItemToType).Type_Warehouse, nil, true)
end

HandleClicked_WhItemMarketRegistItem_Open = function(byMaid)
  -- function num : 0_27 , upvalues : warehouse
  local self = warehouse
  if self.sellCheck then
    Proc_ShowMessage_Ack("정리 해제 �\132 사용해주세요.")
    return 
  end
  local isOpenWarehouse = true
  Inventory_SetFunctor(nil, nil, nil, nil)
  FGlobal_ItemMarketRegistItem_Open(isOpenWarehouse, byMaid)
  self.itemMarketFilterFunc = warehouse_itemMarketFilterFunc
  self.itemMarketRclickFunc = warehouse_itemMarketRclickFunc
  Panel_Window_Warehouse:SetPosX(0)
  self:update()
end

HandleClicked_ManufactureOpen = function()
  -- function num : 0_28 , upvalues : warehouse
  local self = warehouse
  if self.sellCheck then
    Proc_ShowMessage_Ack("정리 해제 �\132 사용해주세요.")
    return 
  end
  Manufacture_Show(nil, (CppEnums.ItemWhereType).eWarehouse, true, nil, self._currentWaypointKey)
end

Warehouse_CheckBoxSet = function(slotNo)
  -- function num : 0_29 , upvalues : warehouse
  warehouse_checkSellToSystem(slotNo)
  local self = warehouse
  local warehouseWrapper = self:getWarehouse()
  local isCheck = warehouseWrapper:isSellToSystem(slotNo)
  ;
  (((self.slots)[slotNo - 1]).checkBox):SetCheck(isCheck)
  self:update()
end

warehouse_itemMarketFilterFunc = function(slot, itemWrapper)
  -- function num : 0_30
  if itemWrapper == nil then
    return true
  end
  local isAble = requestIsRegisterItemForItemMarket((itemWrapper:get()):getKey())
  return not isAble
end

warehouse_itemMarketRclickFunc = function(slotNo, itemWrapper, s64_count)
  -- function num : 0_31
  if (Defines.s64_const).s64_1 == s64_count then
    FGlobal_ItemMarketRegistItemFromInventory(1, slotNo, (CppEnums.ItemWhereType).eWarehouse)
  else
    local masterInfo = getItemMarketMasterByItemEnchantKey(((itemWrapper:get()):getKey()):get())
    if masterInfo ~= nil and masterInfo:getMaxRegisterCount() < s64_count then
      s64_count = masterInfo:getMaxRegisterCount()
    end
    Panel_NumberPad_Show(true, s64_count, slotNo, FGlobal_ItemMarketRegistItemFromInventory, nil, (CppEnums.ItemWhereType).eWarehouse)
  end
end

HandleClicked_WhItemMarketItemSet_Close = function()
  -- function num : 0_32
  FGlobal_WareHouseItemMarketRegistItem_Close()
end

HandleClicked_GuildWareHouseUpdate = function()
  -- function num : 0_33
  warehouse_requestGuildWarehouseInfo()
end

Warehouse_PushFromInventoryItem = function(s64_count, whereType, slotNo, fromActorKeyRaw)
  -- function num : 0_34 , upvalues : warehouse
  local self = warehouse
  self._targetActorKeyRaw = fromActorKeyRaw
  Panel_NumberPad_Show_MaxCount(true, s64_count, slotNo, Warehouse_PushFromInventoryItemXXX, nil, whereType)
end

Warehouse_PushFromInventoryItemXXX = function(s64_count, slotNo, whereType)
  -- function num : 0_35 , upvalues : warehouse
  local self = warehouse
  if self:isNpc() or Panel_RemoteWarehouse:GetShow() then
    warehouse_pushFromInventoryItemByNpc(whereType, slotNo, s64_count, self._targetActorKeyRaw)
  else
    if self:isInstallation() then
      warehouse_pushFromInventoryItemByInstallation(self._installationActorKeyRaw, whereType, slotNo, s64_count, self._targetActorKeyRaw)
    else
      if self:isGuildHouse() then
        warehouse_pushFromInventoryItemByGuildHouse(whereType, slotNo, s64_count, self._targetActorKeyRaw)
      else
        if self:isMaid() then
          local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
          if regionInfo == nil then
            return 
          end
          local warehouseInMaid = checkMaid_WarehouseIn(true)
          if warehouseInMaid then
            warehouse_pushFromInventoryItemByMaid(whereType, slotNo, s64_count, self._targetActorKeyRaw)
          else
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_COOLTIME"))
          end
        end
      end
    end
  end
end

Warehouse_PopToSomewhere = function(s64_count, slotNo, toActorKeyRaw)
  -- function num : 0_36 , upvalues : warehouse
  local self = warehouse
  self._targetActorKeyRaw = toActorKeyRaw
  if FGlobal_WarehouseOpenByMaidCheck() then
    local warehouseWrapper = warehouse:getWarehouse()
    local itemWrapper = warehouseWrapper:getItem(slotNo)
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local weight = Int64toInt32((itemSSW:get())._weight) / 10000
      if Int64toInt32(s64_count) < 0 then
        s64_count = toInt64(0, 2147483647)
      end
      s64_count = toInt64(0, (math.min)((math.floor)(100 / weight), Int64toInt32(s64_count)))
    end
  end
  do
    Panel_NumberPad_Show(true, s64_count, slotNo, Warehouse_PopToSomewhereXXX)
  end
end

Warehouse_PopToSomewhereXXX = function(s64_count, slotNo)
  -- function num : 0_37 , upvalues : warehouse
  local self = warehouse
  if Panel_Window_Inventory:GetShow() and GetUIMode() ~= (Defines.UIMode).eUIMode_WorldMap then
    if self:isNpc() then
      warehouse_popToInventoryByNpc(slotNo, s64_count, self._targetActorKeyRaw)
    else
      if self:isInstallation() then
        warehouse_popToInventoryByInstallation(self._installationActorKeyRaw, slotNo, s64_count, self._targetActorKeyRaw)
      else
        if self:isGuildHouse() then
          warehouse_popToInventoryByGuildHouse(slotNo, s64_count, self._targetActorKeyRaw)
        else
          if self:isMaid() then
            local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
            if regionInfo == nil then
              return 
            end
            local warehouseOutMaid = checkMaid_WarehouseOut(true)
            if warehouseOutMaid then
              warehouse_popToInventoryByMaid(slotNo, s64_count, self._targetActorKeyRaw)
            else
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_COOLTIME"))
            end
          end
        end
      end
    end
  else
    do
      if Panel_Window_Delivery_Request:GetShow() then
        DeliveryRequest_PushPackingItem(slotNo, s64_count)
      end
    end
  end
end

Warehouse_Scroll = function(isUp)
  -- function num : 0_38 , upvalues : warehouse
  local self = warehouse
  local useStartSlot = 1
  local warehouseWrapper = self:getWarehouse()
  if warehouseWrapper == nil then
    return 
  end
  local maxSize = warehouseWrapper:getMaxCount() - useStartSlot
  self._startSlotIndex = (UIScroll.ScrollEvent)(self._scroll, isUp, (self.config).slotRows, maxSize, self._startSlotIndex, (self.config).slotCols)
  self:update()
end

Warehouse_SlotDrag = function(index)
  -- function num : 0_39 , upvalues : warehouse
  local self = warehouse
  local slotNo = ((self.slots)[index]).slotNo
  local warehouseWrapper = self:getWarehouse()
  local itemWrapper = warehouseWrapper:getItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  if (Defines.s64_const).s64_0 == (itemWrapper:get()):getCount_s64() then
    return 
  end
  DragManager:setDragInfo(Panel_Window_Warehouse, nil, slotNo, "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath(), Warehouse_GroundClick, nil)
end

Warehouse_DropHandler = function(index)
  -- function num : 0_40 , upvalues : warehouse
  local self = warehouse
  if DragManager.dragStartPanel == nil then
    return false
  end
  return DragManager:itemDragMove((CppEnums.MoveItemToType).Type_Warehouse, nil)
end

Warehouse_GroundClick = function(whereType, slotNo)
  -- function num : 0_41 , upvalues : warehouse
  if Panel_Window_Warehouse:GetShow() == false then
    return 
  end
  local self = warehouse
  local warehouseWrapper = self:getWarehouse()
  local itemWrapper = warehouseWrapper:getItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  s64_count = (itemWrapper:get()):getCount_s64()
  itemName = (itemWrapper:getStaticStatus()):getName()
  if (Defines.s64_const).s64_1 == s64_count then
    Warehouse_GroundClick_Message((Defines.s64_const).s64_1, slotNo)
  else
    Panel_NumberPad_Show(true, s64_count, slotNo, Warehouse_GroundClick_Message)
  end
end

Warehouse_GroundClick_Message = function(s64_count, slotNo)
  -- function num : 0_42 , upvalues : warehouse
  local self = warehouse
  self._deleteSlotNo = slotNo
  self._s64_deleteCount = s64_count
  local luaDeleteItemMsg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DELETEITEM_MSG", "itemName", itemName, "itemCount", tostring(s64_count))
  local luaDelete = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DELETE")
  local messageContent = luaDeleteItemMsg
  local messageboxData = {title = luaDelete, content = messageContent, functionYes = Warehouse_Delete_Yes, functionNo = Warehouse_Delete_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Warehouse_Delete_Yes = function()
  -- function num : 0_43 , upvalues : warehouse
  local self = warehouse
  if self._deleteSlotNo == nil then
    return 
  end
  local warehouseWrapper = self:getWarehouse()
  local itemWrapper = warehouseWrapper:getItem(self._deleteSlotNo)
  if itemWrapper == nil then
    return 
  end
  if itemWrapper:isCash() then
    PaymentPassword(Warehouse_Delete_YesXXX)
    return 
  end
  Warehouse_Delete_YesXXX()
end

Warehouse_Delete_YesXXX = function()
  -- function num : 0_44 , upvalues : warehouse
  local self = warehouse
  if self:isNpc() then
    warehouse_deleteItemByNpc(self._deleteSlotNo, self._s64_deleteCount)
  else
    if self:isInstallation() then
      warehouse_deleteItemByInstallation(self._installationActorKeyRaw, self._deleteSlotNo, self._s64_deleteCount)
    end
  end
  self._deleteSlotNo = nil
  self._s64_deleteCount = (Defines.s64_const).s64_0
  DragManager:clearInfo()
end

Warehouse_Delete_No = function()
  -- function num : 0_45 , upvalues : warehouse
  local self = warehouse
  self._deleteSlotNo = nil
  self._s64_deleteCount = (Defines.s64_const).s64_0
end

Warehouse_IconOver = function(index)
  -- function num : 0_46 , upvalues : warehouse
  local self = warehouse
  local slot = (self.slots)[index]
  if (self.slotNilEffect)[index] then
    (slot.icon):EraseEffect((self.slotNilEffect)[index])
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self.slotNilEffect)[index] = (slot.icon):AddEffect("UI_Inventory_EmptySlot", false, -1.5, -1.5)
  else
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self.slotNilEffect)[index] = (slot.icon):AddEffect("UI_Inventory_EmptySlot", false, -1.5, -1.5)
  end
  self._tooltipSlotNo = slot.slotNo
  Panel_Tooltip_Item_Show_GeneralNormal(index, "WareHouse", true)
end

Warehouse_IconOut = function(index)
  -- function num : 0_47 , upvalues : warehouse
  local self = warehouse
  local slot = (self.slots)[index]
  self._tooltipSlotNo = nil
  Panel_Tooltip_Item_Show_GeneralNormal(index, "WareHouse", false)
end

Warehouse_GetToopTipItem = function()
  -- function num : 0_48 , upvalues : warehouse
  local self = warehouse
  local warehouseWrapper = self:getWarehouse()
  if warehouseWrapper == nil then
    return nil
  end
  if self._tooltipSlotNo == nil then
    return nil
  end
  return warehouseWrapper:getItem(self._tooltipSlotNo)
end

Warehouse_GetItem = function(slotNo)
  -- function num : 0_49 , upvalues : warehouse
  local self = warehouse
  local warehouseWrapper = self:getWarehouse()
  if warehouseWrapper == nil then
    return nil
  end
  return warehouseWrapper:getItem(slotNo)
end

Warehouse_SetIgnoreMoneyButton = function(setIgnore)
  -- function num : 0_50 , upvalues : warehouse
  local self = warehouse
  if setIgnore == true then
    (self.buttonMoney):SetIgnore(true)
  else
    ;
    (self.buttonMoney):SetIgnore(false)
  end
end

FromClient_WarehouseOpenByInstallation = function(actorKeyRaw, waypointKey)
  -- function num : 0_51 , upvalues : warehouse
  local self = warehouse
  self._installationActorKeyRaw = actorKeyRaw
  Warehouse_OpenPanel(waypointKey, (CppEnums.WarehoouseFromType).eWarehoouseFromType_Installation)
  Warehouse_SetIgnoreMoneyButton(false)
  Warehouse_OpenWithInventory()
end

Warehouse_OpenPanelFromDialog = function()
  -- function num : 0_52 , upvalues : warehouse
  local self = warehouse
  self.sellCheck = false
  warehouse_clearSellToSystem()
  Warehouse_OpenPanel(getCurrentWaypointKey(), (CppEnums.WarehoouseFromType).eWarehoouseFromType_Npc)
  Warehouse_SetIgnoreMoneyButton(false)
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  if not ToClient_WorldMapIsShow() then
    Panel_Window_Warehouse:SetVerticalMiddle()
    Panel_Window_Warehouse:SetHorizonCenter()
    if screenSizeX <= 1400 then
      Panel_Window_Warehouse:SetSpanSize(screenSizeX / 2 - Panel_Window_Warehouse:GetPosX() / 2 - 490, -30)
    else
      Panel_Window_Warehouse:SetSpanSize(screenSizeX / 2 - Panel_Window_Warehouse:GetPosX() / 2 - 400, -30)
    end
  end
  Warehouse_OpenWithInventory()
  if Panel_Window_ItemMarket_RegistItem:GetShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
end

Warehouse_OpenPanelFromDialogWithoutInventory = function(waypointKey, fromType)
  -- function num : 0_53 , upvalues : warehouse
  local self = warehouse
  Warehouse_OpenPanel(waypointKey, fromType)
  Warehouse_SetIgnoreMoneyButton(true)
  if ToClient_WorldMapIsShow() then
    Panel_Window_Warehouse:SetVerticalMiddle()
    Panel_Window_Warehouse:SetHorizonCenter()
    Panel_Window_Warehouse:SetSpanSize(100, 0)
  end
end

Warehouse_OpenPanelFromWorldmap = function(waypointKey, fromType)
  -- function num : 0_54 , upvalues : warehouse
  local self = warehouse
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(Panel_Window_Warehouse, true)
    if isWorldMapGrandOpen() then
      Panel_Window_Warehouse:SetHorizonRight()
      Panel_Window_Warehouse:SetVerticalMiddle()
    else
      Panel_Window_Warehouse:SetHorizonRight()
      Panel_Window_Warehouse:SetVerticalBottom()
      Panel_Window_Warehouse:SetPosY(Panel_Window_Warehouse:GetPosY() - 50)
    end
  end
  Warehouse_OpenPanel(waypointKey, fromType)
  Warehouse_SetIgnoreMoneyButton(true)
  if not FGlobal_Warehouse_IsMoveItem() then
    DeliveryRequestWindow_Close()
    DeliveryInformationWindow_Close()
  end
end

Warehouse_OpenPanelFromMaid = function()
  -- function num : 0_55 , upvalues : warehouse
  local self = warehouse
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if regionInfo == nil then
    return 
  end
  local regionInfoWrapper = getRegionInfoWrapper(regionInfo:getAffiliatedTownRegionKey())
  local plantWayKey = (regionInfoWrapper:getPlantKeyByWaypointKey()):getWaypointKey()
  local regionKey = regionInfoWrapper:getRegionKey()
  if ToClient_IsAccessibleRegionKey(regionKey) == false then
    plantWayKey = ToClient_GetOtherRegionKey_NeerByTownRegionKey()
  end
  Warehouse_OpenPanel(plantWayKey, (CppEnums.WarehoouseFromType).eWarehoouseFromType_Maid)
  Warehouse_SetIgnoreMoneyButton(false)
  Warehouse_OpenWithInventory()
end

local btnMarketRegistSizeX = (warehouse.BtnMarketRegist):GetSizeX()
Warehouse_OpenPanel = function(waypointKey, fromType)
  -- function num : 0_56 , upvalues : warehouse, btnMarketRegistSizeX, btnMarketRegSpanSizeY
  local self = warehouse
  self._currentWaypointKey = waypointKey
  self._fromType = fromType
  self._currentRegionName = getRegionNameByWaypointKey(self._currentWaypointKey)
  ;
  (self.staticTitle):SetText(self._currentRegionName)
  local isSorted = ToClient_IsSortedWarehouse()
  ;
  (self.checkSort):SetCheck(isSorted)
  ;
  (self._buttonDelivery):SetShow(false)
  do
    if self:isWorldMapNode() then
      local regionInfoWrapper = ToClient_getRegionInfoWrapperByWaypoint(waypointKey)
      if regionInfoWrapper ~= nil and (regionInfoWrapper:get()):hasDeliveryNpc() then
        (self._buttonDelivery):SetShow(true)
      end
    end
    clearDeliveryPack()
    ;
    (self.BtnManufacture):SetShow(false)
    if ((CppEnums.WarehoouseFromType).eWarehoouseFromType_Npc == self._fromType or (CppEnums.WarehoouseFromType).eWarehoouseFromType_Manufacture == self._fromType) and ToClient_isPossibleManufactureAtWareHouse() then
      (self.BtnManufacture):SetShow(true)
    end
    local myRegionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
    local hasItemMarket = (myRegionInfo:get()):hasItemMarketNpc()
    local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
    if hasItemMarket and dialog_getTalker() ~= nil and dialog_isTalking() and not self:isGuildHouse() then
      (self.BtnMarketRegist):SetShow(true)
    else
      ;
      (self.BtnMarketRegist):SetShow(false)
    end
    if FGlobal_Warehouse_IsMoveItem() then
      (self.buttonMoney):SetIgnore(false)
    else
      ;
      (self.buttonMoney):SetIgnore(true)
    end
    ;
    (warehouse.BtnGuildUpdate):SetShow(false)
    WareHouse_PanelSize_Change(warehouse:isNpc())
    if (CppEnums.WarehoouseFromType).eWarehoouseFromType_Npc == self._fromType and (self.BtnMarketRegist):GetShow() then
      if (self.BtnManufacture):GetShow() then
        (self.BtnMarketRegist):SetSize(btnMarketRegistSizeX - 30, (self.BtnMarketRegist):GetSizeY())
        ;
        (self.BtnManufacture):SetSize(btnMarketRegistSizeX - 30, (self.BtnMarketRegist):GetSizeY())
        ;
        (self.BtnMarketRegist):SetSpanSize(25 + (self.BtnManufacture):GetSizeX() + 5, btnMarketRegSpanSizeY + self.addSizeY)
      else
        ;
        (self.BtnMarketRegist):SetSize(btnMarketRegistSizeX, (self.BtnMarketRegist):GetSizeY())
        ;
        (self.BtnManufacture):SetSize(btnMarketRegistSizeX, (self.BtnMarketRegist):GetSizeY())
        ;
        (self.BtnMarketRegist):SetSpanSize(25, btnMarketRegSpanSizeY + self.addSizeY)
      end
    end
    if (self.BtnManufacture):GetShow() then
      (self.BtnMarketRegist):SetSpanSize(25 + (self.BtnManufacture):GetSizeX() + 5, btnMarketRegSpanSizeY)
    end
    ;
    (self.BtnManufacture):SetTextSpan(((self.BtnManufacture):GetSizeX() + 26) / 2 - (self.BtnManufacture):GetTextSizeX() / 2, (self.BtnManufacture):GetSizeY() / 2 - (self.BtnManufacture):GetTextSizeY() / 2)
    ;
    (self.BtnMarketRegist):SetTextSpan(((self.BtnMarketRegist):GetSizeX() + 26) / 2 - (self.BtnMarketRegist):GetTextSizeX() / 2, (self.BtnMarketRegist):GetSizeY() / 2 - (self.BtnMarketRegist):GetTextSizeY() / 2)
    Panel_Window_Warehouse:ChangeSpecialTextureInfoName("")
    Panel_Window_Warehouse:SetAlphaExtraChild(1)
    Panel_Window_Warehouse:SetShow(true, true)
    self._startSlotIndex = 0
    ;
    (self._scroll):SetControlTop()
    ;
    (self._scroll):SetControlPos(0)
    warehouse_requestInfo(self._currentWaypointKey)
    if (CppEnums.WarehoouseFromType).eWarehoouseFromType_Maid == fromType then
      Panel_Window_Warehouse:SetPosX(getScreenSizeX() - Panel_Window_Inventory:GetSizeX() - Panel_Window_Warehouse:GetSizeX())
      Panel_Window_Warehouse:SetPosY(getScreenSizeY() / 2 - Panel_Window_Warehouse:GetSizeY() / 2)
    else
      if (CppEnums.WarehoouseFromType).eWarehoouseFromType_Manufacture == fromType then
        Panel_Window_Warehouse:SetPosX(Panel_Manufacture:GetPosX() + Panel_Manufacture:GetSizeX() - 20)
        Panel_Window_Warehouse:SetPosY(Panel_Manufacture:GetPosY())
      end
    end
    local groupIndex = 0
    local groupCount = 0
    Panel_Window_Warehouse:deleteConsoleUIGroup(2)
    local group_2 = Panel_Window_Warehouse:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
    if (self.BtnManufacture):GetShow() then
      groupCount = groupCount + 1
    end
    if (self.BtnMarketRegist):GetShow() then
      groupCount = groupCount + 1
    end
    if (self.BtnGuildUpdate):GetShow() then
      groupCount = groupCount + 1
    end
    if (self.BtnManufacture):GetShow() then
      group_2:addControl(groupIndex, 0, groupCount, 1, self.BtnManufacture)
      groupIndex = groupIndex + 1
    end
    if (self.BtnMarketRegist):GetShow() then
      group_2:addControl(groupIndex, 0, groupCount, 1, self.BtnMarketRegist)
      groupIndex = groupIndex + 1
    end
    if (self.BtnGuildUpdate):GetShow() then
      group_2:addControl(groupIndex, 0, groupCount, 1, self.BtnGuildUpdate)
      groupIndex = groupIndex + 1
    end
    Panel_Window_Warehouse:deleteConsoleUIGroup(3)
    local group_3 = Panel_Window_Warehouse:addConsoleUIGroup(3, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
    if FGlobal_Warehouse_IsMoveItem() then
      group_3:addControl(0, 0, 1, 1, self.buttonMoney)
    end
    self:update()
  end
end

Warehouse_OpenWithInventory = function()
  -- function num : 0_57 , upvalues : warehouse
  local self = warehouse
  Inventory_SetFunctor(nil, FGlobal_PopupMoveItem_InitByInventory, Warehouse_Close, nil)
  InventoryWindow_Show()
  self._startSlotIndex = 0
  ;
  (self._scroll):SetControlTop()
  ServantInventory_OpenAll()
end

Warehouse_Close = function()
  -- function num : 0_58 , upvalues : warehouse
  local self = warehouse
  self._fromType = (CppEnums.WarehoouseFromType).eWarehoouseFromType_Worldmap
  if Panel_Window_Warehouse:GetShow() then
    if Panel_Window_Delivery_Information:GetShow() then
      DeliveryInformationWindow_Close()
    end
    if Panel_Window_Delivery_Request:GetShow() then
      DeliveryRequestWindow_Close()
    end
    if Panel_Window_Inventory:GetShow() then
      InventoryWindow_Close()
    end
  end
  if self.itemMarketFilterFunc ~= nil then
    self.itemMarketFilterFunc = nil
    self.itemMarketRclickFunc = nil
  end
  if self.manufactureRclickFunc ~= nil then
    self.manufactureFilterFunc = nil
    self.manufactureRclickFunc = nil
  end
  if ToClient_WorldMapIsShow() then
    WorldMapPopupManager:pop()
  else
    Panel_Window_Warehouse:SetShow(false, false)
  end
  Panel_Window_Warehouse:ChangeSpecialTextureInfoName("")
  ServantInventory_Close()
  if ToClient_CheckExistSummonMaid() then
    ToClient_CallHandlerMaid("_maidLogOut")
  end
end

Warehouse_GetWarehouseWarpper = function()
  -- function num : 0_59 , upvalues : warehouse
  local self = warehouse
  return self:getWarehouse()
end

Warehouse_updateSlotData = function()
  -- function num : 0_60
  FromClient_WarehouseUpdate()
end

Warehouse_SetFunctor = function(filterFunc, rClickFunc)
  -- function num : 0_61 , upvalues : warehouse
  local self = warehouse
  if filterFunc ~= nil and type(filterFunc) ~= "function" then
    filterFunc = nil
    ;
    (UI.ASSERT)(false, "Param 1 must be Function type")
  end
  if rClickFunc ~= nil and type(rClickFunc) ~= "function" then
    rClickFunc = nil
    ;
    (UI.ASSERT)(false, "Param 2 must be Function type")
  end
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R3 in 'UnsetPending'

  warehouse.manufactureFilterFunc = filterFunc
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R3 in 'UnsetPending'

  warehouse.manufactureRclickFunc = rClickFunc
end

FGlobal_Warehouse_ResetFilter = function()
  -- function num : 0_62 , upvalues : warehouse
  local self = warehouse
  if self.itemMarketFilterFunc ~= nil then
    self.itemMarketFilterFunc = nil
    self.itemMarketRclickFunc = nil
  end
  self:update()
end

Warehouse_OpenPanelFromManufacture = function()
  -- function num : 0_63
  Warehouse_OpenPanel(getCurrentWaypointKey(), (CppEnums.WarehoouseFromType).eWarehoouseFromType_Manufacture)
end

warehouse:init()
warehouse:registEventHandler()
warehouse:registMessageHandler()
ConsoleGroupCreate_Panel_Window_Warehouse = function()
  -- function num : 0_64 , upvalues : warehouse
  local group_0 = Panel_Window_Warehouse:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_0:addControl(0, 0, 1, 1, warehouse.checkSort)
end

ConsoleGroupCreate_Panel_Window_Warehouse()

