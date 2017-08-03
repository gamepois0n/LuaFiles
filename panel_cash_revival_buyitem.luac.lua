-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\deadmessage\panel_cash_revival_buyitem.luac 

-- params : ...
-- function num : 0
Panel_Cash_Revival_BuyItem:SetShow(false)
Panel_Cash_Revival_BuyItem:setGlassBackground(true)
Panel_Cash_Revival_BuyItem:ActiveMouseEventEffect(true)
local CashRevivalBuy = {bg = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Static_BG"), bg_notify = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Static_NotifyBG"), staticText_notify = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "StaticText_Notify"), BTN_Confirm = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Button_Confirm"), BTN_Cancel = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Button_Cancel"), 
ItemUiPOOL = {}
, ItemUiMaxCount = 0, ItemListRow = -1, SelectedItemNo = -1}
local TemplateBuyPanelUI = {ItemBG = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Template_Static_ItemBG"), ItemNameBG = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Template_StaticText_ItemNameBG"), ItemName = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Template_StaticText_ItemName"), ItemPeriod = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Template_StaticText_Period"), ItemPrice = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Template_StaticText_ItemPrice"), PearlIcon = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Template_Static_PearlIcon"), BTN_ItemSelected = (UI.getChildControl)(Panel_Cash_Revival_BuyItem, "Template_RadioButton_SelectedItem")}
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local CashRevivalData = {}
local CashRevivalCount = 0
local _selectSpawnType = enRespawnType.respawnType_None
CashRevivalBuy.Update = function(self)
  -- function num : 0_0 , upvalues : CashRevivalData, UI_PUCT, TemplateBuyPanelUI, UI_color
  CashRevivalData = {}
  for idx,itemUi in pairs(self.ItemUiPOOL) do
    (itemUi.ItemBG):SetShow(false)
  end
  CashRevivalDataCount = 0
  local idx = 0
  local cashInvenItem = nil
  for cashInvenIdx = 0, ToClient_InventoryGetSize((CppEnums.ItemWhereType).eCashInventory) - 1 do
    cashInvenItem = ToClient_GetInventoryItemByProductCategory((CppEnums.ItemWhereType).eCashInventory, (CppEnums.ItemProductCategory).eItemProductCategory_Revival, cashInvenIdx)
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R7 in 'UnsetPending'

    if cashInvenItem ~= nil then
      CashRevivalData[idx] = {}
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).name = (cashInvenItem:getStaticStatus()):getName()
      -- DECOMPILER ERROR at PC49: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).slotNo = cashInvenIdx
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).itemWhereType = (CppEnums.ItemWhereType).eCashInventory
      -- DECOMPILER ERROR at PC62: Confused about usage of register: R7 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).count = (cashInvenItem:get()):getCount_s64()
      -- DECOMPILER ERROR at PC71: Confused about usage of register: R7 in 'UnsetPending'

      if (cashInvenItem:getExpirationDate()):isIndefinite() then
        (CashRevivalData[idx]).expirationDate = nil
      else
        local timeValue = PATime((cashInvenItem:getExpirationDate()):get_s64())
        local timeStr = tostring(timeValue:GetYear()) .. "." .. tostring(timeValue:GetMonth()) .. "." .. tostring(timeValue:GetDay())
        -- DECOMPILER ERROR at PC96: Confused about usage of register: R9 in 'UnsetPending'

        ;
        (CashRevivalData[idx]).expirationDate = timeStr
      end
      do
        do
          idx = idx + 1
          -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  CashRevivalDataCount = #CashRevivalData + 1
  ;
  (self.staticText_notify):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_Cash_Revival_BuyItem_UseAbleItem_Notify_Msg"))
  local slotStartX = 15
  local slotStartY = 110
  local slotGapX = 255
  local slotGapY = 75
  local slotCols = 2
  local slotRows = (CashRevivalDataCount - 1) / slotCols
  for itemIdx = 0, CashRevivalDataCount - 1 do
    if (self.ItemUiPOOL)[itemIdx] == nil then
      local tempSlot = {}
      local CreateItemBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Cash_Revival_BuyItem, "CashRevivalBuy_ItemBG_" .. itemIdx)
      CopyBaseProperty(TemplateBuyPanelUI.ItemBG, CreateItemBG)
      CreateItemBG:SetPosX(25)
      CreateItemBG:SetPosY(80)
      CreateItemBG:SetShow(false)
      tempSlot.ItemBG = CreateItemBG
      local CreateItemNameBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, CreateItemBG, "CashRevivalBuy_ItemNameBG_" .. itemIdx)
      CopyBaseProperty(TemplateBuyPanelUI.ItemNameBG, CreateItemNameBG)
      CreateItemNameBG:SetPosX(5)
      CreateItemNameBG:SetPosY(5)
      CreateItemNameBG:SetShow(true)
      tempSlot.ItemNameBG = CreateItemNameBG
      local CreateItemSelectBTN = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_RADIOBUTTON, CreateItemBG, "CashRevivalBuy_ItemSelectBTN_" .. itemIdx)
      CopyBaseProperty(TemplateBuyPanelUI.BTN_ItemSelected, CreateItemSelectBTN)
      CreateItemSelectBTN:SetPosX(5)
      CreateItemSelectBTN:SetPosY(7)
      CreateItemSelectBTN:SetShow(true)
      tempSlot.ItemSelectBTN = CreateItemSelectBTN
      local CreateItemName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, CreateItemBG, "CashRevivalBuy_ItemName_" .. itemIdx)
      CopyBaseProperty(TemplateBuyPanelUI.ItemName, CreateItemName)
      CreateItemName:SetPosX(20)
      CreateItemName:SetPosY(3)
      CreateItemName:SetShow(true)
      tempSlot.ItemName = CreateItemName
      local CreateItemPeriod = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, CreateItemBG, "CashRevivalBuy_ItemPeriod_" .. itemIdx)
      CopyBaseProperty(TemplateBuyPanelUI.ItemPeriod, CreateItemPeriod)
      CreateItemPeriod:SetPosX(10)
      CreateItemPeriod:SetPosY(35)
      CreateItemPeriod:SetShow(true)
      tempSlot.ItemPeriod = CreateItemPeriod
      local CreatePearlIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, CreateItemBG, "CashRevivalBuy_PearlIcon_" .. itemIdx)
      CopyBaseProperty(TemplateBuyPanelUI.PearlIcon, CreatePearlIcon)
      CreatePearlIcon:SetPosX(10)
      CreatePearlIcon:SetPosY(40)
      CreatePearlIcon:SetShow(true)
      tempSlot.PearlIcon = CreatePearlIcon
      local CreateItemPrice = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, CreateItemBG, "CashRevivalBuy_ItemPrice_" .. itemIdx)
      CopyBaseProperty(TemplateBuyPanelUI.ItemPrice, CreateItemPrice)
      CreateItemPrice:SetPosX(40)
      CreateItemPrice:SetPosY(35)
      CreateItemPrice:SetShow(true)
      tempSlot.ItemPrice = CreateItemPrice
      -- DECOMPILER ERROR at PC298: Confused about usage of register: R21 in 'UnsetPending'

      ;
      (self.ItemUiPOOL)[itemIdx] = tempSlot
      self.ItemUiMaxCount = self.ItemUiMaxCount + 1
    end
    do
      local col = itemIdx % slotCols
      local row = (math.floor)(itemIdx / slotCols)
      local posX = slotStartX + slotGapX * col
      local posY = slotStartY + slotGapY * row
      self.ItemListRow = row
      do
        local UiBase = (self.ItemUiPOOL)[itemIdx]
        ;
        (UiBase.ItemBG):SetPosX(posX)
        ;
        (UiBase.ItemBG):SetPosY(posY)
        ;
        (UiBase.ItemBG):SetShow(true)
        ;
        (UiBase.ItemName):SetFontColor(UI_color.C_FFE7E7E7)
        ;
        (UiBase.ItemName):SetText((CashRevivalData[itemIdx]).name .. "(" .. tostring((CashRevivalData[itemIdx]).count) .. ")")
        ;
        (UiBase.ItemPeriod):SetFontColor(UI_color.C_FF999999)
        if (CashRevivalData[itemIdx]).expirationDate == nil then
          (UiBase.ItemPeriod):SetShow(false)
        else
          ;
          (UiBase.ItemPeriod):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Cash_Revival_BuyItem_ItemPeriod", "itemExpirationDate", (CashRevivalData[itemIdx]).expirationDate))
          ;
          (UiBase.ItemPeriod):SetShow(true)
        end
        ;
        (UiBase.PearlIcon):SetShow(false)
        ;
        (UiBase.ItemPrice):SetShow(false)
        ;
        (UiBase.ItemSelectBTN):addInputEvent("Mouse_LUp", "HandleClicked_CashRevival_SelectItem( " .. itemIdx .. " )")
        ;
        (UiBase.ItemName):addInputEvent("Mouse_LUp", "HandleClicked_CashRevival_SelectItem( " .. itemIdx .. " )")
        ;
        (UiBase.ItemNameBG):addInputEvent("Mouse_LUp", "HandleClicked_CashRevival_SelectItem( " .. itemIdx .. " )")
        -- DECOMPILER ERROR at PC408: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  ;
  (self.bg):SetSize((self.bg):GetSizeX(), (self.bg_notify):GetSizeY() + 15 + (self.ItemListRow + 1) * ((TemplateBuyPanelUI.ItemBG):GetSizeY() + 5))
end

CashRevivalBuy_SetPosition = function()
  -- function num : 0_1 , upvalues : CashRevivalBuy, TemplateBuyPanelUI
  local self = CashRevivalBuy
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  Panel_Cash_Revival_BuyItem:SetSize(Panel_Cash_Revival_BuyItem:GetSizeX(), (self.ItemListRow + 1) * (TemplateBuyPanelUI.ItemBG):GetSizeY() + 175)
  local panelSizeX = Panel_Cash_Revival_BuyItem:GetSizeX()
  local panelSizeY = Panel_Cash_Revival_BuyItem:GetSizeY()
  Panel_Cash_Revival_BuyItem:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Cash_Revival_BuyItem:SetPosY(scrSizeY / 2 - panelSizeY / 2)
  ;
  (self.BTN_Confirm):ComputePos()
  ;
  (self.BTN_Cancel):ComputePos()
end

CashRevivalBuy_Open = function(respawnType)
  -- function num : 0_2 , upvalues : _selectSpawnType, CashRevivalBuy
  _selectSpawnType = respawnType
  local self = CashRevivalBuy
  CashRevivalBuy:Update()
  CashRevivalBuy_SetPosition()
  Panel_Cash_Revival_BuyItem:SetShow(true)
end

CashRevivalBuy_Close = function()
  -- function num : 0_3
  Panel_Cash_Revival_BuyItem:SetShow(false)
  Panel_Cash_Customization_BuyItem:SetShow(false)
end

HandleClicked_CashRevival_SelectItem = function(itemId)
  -- function num : 0_4 , upvalues : CashRevivalBuy
  local self = CashRevivalBuy
  self.SelectedItemNo = itemId
  for idx = 0, self.ItemUiMaxCount - 1 do
    local UiBase = (self.ItemUiPOOL)[idx]
    ;
    (UiBase.ItemSelectBTN):SetCheck(false)
    if idx == itemId then
      (UiBase.ItemSelectBTN):SetCheck(true)
    end
  end
end

HandleClicked_Buy_CashRevivalItem = function(respawnType)
  -- function num : 0_5 , upvalues : _selectSpawnType, CashRevivalBuy
  _selectSpawnType = respawnType
  local self = CashRevivalBuy
  local msgTitle = PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_FINAL_CHECK")
  local msgContent = ""
  local cPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(getRevivalItem())
  msgContent = PAGetStringParam2(Defines.StringSheet_GAME, "Lua_Cash_Revival_BuyItem_Confirm_RevialBuyPearl", "RevivalItemName", cPSSW:getName(), "PearlPrice", tostring(cPSSW:getPrice()))
  local messageboxData = {title = msgTitle, content = msgContent, functionYes = ToClient_Buy_CashRevivalBuy_Do, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

ToClient_Buy_CashRevivalBuy_Do = function()
  -- function num : 0_6
  local cPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(getRevivalItem())
  ;
  (getIngameCashMall()):requestBuyItem(cPSSW:getNoRaw(), 1, cPSSW:getPrice(), (CppEnums.BuyItemReqTrType).eBuyItemReqTrType_ImmediatelyUse, toInt64(0, -1), 0)
end

HandleClicked_Apply_CashRevivalItem = function(respawnType)
  -- function num : 0_7 , upvalues : _selectSpawnType, CashRevivalBuy, CashRevivalData
  _selectSpawnType = respawnType
  local self = CashRevivalBuy
  local msgTitle = PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_FINAL_CHECK")
  local msgContent = ""
  local idx = 0
  self.SelectedItemNo = 0
  CashRevivalData = {}
  local cashInvenItem = nil
  for cashInvenIdx = 0, ToClient_InventoryGetSize((CppEnums.ItemWhereType).eCashInventory) - 1 do
    cashInvenItem = ToClient_GetInventoryItemByProductCategory((CppEnums.ItemWhereType).eCashInventory, (CppEnums.ItemProductCategory).eItemProductCategory_Revival, cashInvenIdx)
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R10 in 'UnsetPending'

    if cashInvenItem ~= nil then
      CashRevivalData[idx] = {}
      -- DECOMPILER ERROR at PC43: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).name = (cashInvenItem:getStaticStatus()):getName()
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).slotNo = cashInvenIdx
      -- DECOMPILER ERROR at PC52: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).itemWhereType = (CppEnums.ItemWhereType).eCashInventory
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).count = (cashInvenItem:get()):getCount_s64()
    end
  end
  msgContent = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Cash_Revival_BuyItem_Confirm_ThisItemApply", "cashItemName", (CashRevivalData[self.SelectedItemNo]).name)
  local messageboxData = {title = msgTitle, content = msgContent, functionYes = ToClient_CashRevivalBuy_Confirm_Do, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

HandleClicked_CashRevivalBuy_Confirm = function()
  -- function num : 0_8 , upvalues : CashRevivalBuy, CashRevivalData
  local self = CashRevivalBuy
  if self.SelectedItemNo < 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_REGISTITEM_ITEMSELECT_TEXT"))
    return 
  end
  local msgTitle = PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_FINAL_CHECK")
  local msgContent = ""
  msgContent = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Cash_Revival_BuyItem_Confirm_ThisItemApply", "cashItemName", (CashRevivalData[self.SelectedItemNo]).name)
  local messageboxData = {title = msgTitle, content = msgContent, functionYes = ToClient_CashRevivalBuy_Confirm_Do, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

ToClient_CashRevivalBuy_Confirm_Do = function()
  -- function num : 0_9 , upvalues : CashRevivalBuy, _selectSpawnType, CashRevivalData
  local self = CashRevivalBuy
  deadMessage_Revival(_selectSpawnType, (CashRevivalData[self.SelectedItemNo]).slotNo, (CashRevivalData[self.SelectedItemNo]).itemWhereType, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
  CashRevivalBuy_Close()
end

FromClient_NotifyCacheRespawn = function()
  -- function num : 0_10 , upvalues : CashRevivalBuy, CashRevivalData
  local self = CashRevivalBuy
  local msgTitle = PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_FINAL_CHECK")
  local msgContent = ""
  local idx = 0
  self.SelectedItemNo = 0
  CashRevivalData = {}
  local cashInvenItem = nil
  for cashInvenIdx = 0, ToClient_InventoryGetSize((CppEnums.ItemWhereType).eCashInventory) - 1 do
    cashInvenItem = ToClient_GetInventoryItemByProductCategory((CppEnums.ItemWhereType).eCashInventory, (CppEnums.ItemProductCategory).eItemProductCategory_Revival, cashInvenIdx)
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R9 in 'UnsetPending'

    if cashInvenItem ~= nil then
      CashRevivalData[idx] = {}
      -- DECOMPILER ERROR at PC42: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).name = (cashInvenItem:getStaticStatus()):getName()
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).slotNo = cashInvenIdx
      -- DECOMPILER ERROR at PC51: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).itemWhereType = (CppEnums.ItemWhereType).eCashInventory
      -- DECOMPILER ERROR at PC58: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (CashRevivalData[idx]).count = (cashInvenItem:get()):getCount_s64()
    end
  end
  ToClient_CashRevivalBuy_Confirm_Do()
end

CashRevivalBuy.registEventHandler = function(self)
  -- function num : 0_11
  (self.BTN_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_CashRevivalBuy_Confirm()")
  ;
  (self.BTN_Cancel):addInputEvent("Mouse_LUp", "CashRevivalBuy_Close()")
end

CashRevivalBuy:registEventHandler()
registerEvent("FromClient_NotifyCacheRespawn", "FromClient_NotifyCacheRespawn")

