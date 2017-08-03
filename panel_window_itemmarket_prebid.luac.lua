-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_prebid.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
ItemMarketPreBid_ShowAni = function()
  -- function num : 0_0
  Panel_ItemMarket_PreBid:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_ItemMarket_PreBid, 0, 0.3)
end

ItemMarketPreBid_HideAni = function()
  -- function num : 0_1
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_ItemMarket_PreBid, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

Panel_ItemMarket_PreBid:RegisterShowEventFunc(true, "ItemMarketPreBid_ShowAni()")
Panel_ItemMarket_PreBid:RegisterShowEventFunc(false, "ItemMarketPreBid_HideAni()")
Panel_ItemMarket_PreBid:SetShow(false, false)
Panel_ItemMarket_PreBid:ActiveMouseEventEffect(true)
Panel_ItemMarket_PreBid:setGlassBackground(true)
local ItemMarketPreBid = {
ui = {btn_Confirm = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Button_Confirm"), btn_Cancel = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Button_Cancel"), bg = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Static_BG"), title_01 = (UI.getChildControl)(Panel_ItemMarket_PreBid, "StaticText_Title_01"), title_02 = (UI.getChildControl)(Panel_ItemMarket_PreBid, "StaticText_Title_02"), value_01 = (UI.getChildControl)(Panel_ItemMarket_PreBid, "StaticText_Value_01"), value_02_Edit = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Edit_Value_02"), title_03 = (UI.getChildControl)(Panel_ItemMarket_PreBid, "StaticText_Title_03"), value_03_Edit = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Edit_Value_03"), notify = (UI.getChildControl)(Panel_ItemMarket_PreBid, "StaticText_Notify"), sumPriceText = (UI.getChildControl)(Panel_ItemMarket_PreBid, "StaticText_SumPrice"), button_PayInven = (UI.getChildControl)(Panel_ItemMarket_PreBid, "RadioButton_Icon_Money"), button_PayWarehouse = (UI.getChildControl)(Panel_ItemMarket_PreBid, "RadioButton_Icon_Money2"), hasSilver_Inven = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Static_Text_Money"), hasSilver_Warehouse = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Static_Text_Money2"), itemIconBG = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Static_Slot_IconBG"), itemIcon = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Static_Slot_Icon"), itemIconBorder = (UI.getChildControl)(Panel_ItemMarket_PreBid, "Static_Slot_Border"), itemName = (UI.getChildControl)(Panel_ItemMarket_PreBid, "StaticText_Slot_ItemName"), enchantLevel = (UI.getChildControl)(Panel_ItemMarket_PreBid, "StaticText_EnchantLevel")}
, 
config = {itemEnchantKey = nil, alarmEnchantKey = nil, isOpen = false, openType = 0, buyingName = ""}
, 
value = {invenMoney = toInt64(0, 0), wareHouseMoney = toInt64(0, 0), minInputMoney = toInt64(0, 0), notifyBGDefaultSize = 0}
}
local penelOpenType = {regist = 0, manage = 1, alarm = 2}
ItemMarketPreBid.Init = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  ((self.ui).itemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self.ui).notify):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self.ui).notify):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_REGIST_NOTIFY"))
  ;
  ((self.ui).title_01):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self.ui).value_02_Edit):SetNumberMode(true)
  ;
  ((self.ui).value_03_Edit):SetNumberMode(true)
  ;
  ((self.ui).sumPriceText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_SUMPRICE_INIT"))
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.value).notifyBGDefaultSize = ((self.ui).notify):GetSizeY()
end

ItemMarketPreBid.updateSilver = function(self)
  -- function num : 0_3
  local invenMoney = (((getSelfPlayer()):get()):getInventory()):getMoney_s64()
  local wareHouseMoney = warehouse_moneyFromNpcShop_s64()
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.value).invenMoney = invenMoney
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.value).wareHouseMoney = wareHouseMoney
  ;
  ((self.ui).hasSilver_Inven):SetText(makeDotMoney(invenMoney))
  ;
  ((self.ui).hasSilver_Warehouse):SetText(makeDotMoney(wareHouseMoney))
end

ItemMarketPreBid.updateControl = function(self)
  -- function num : 0_4 , upvalues : penelOpenType
  local isRegist = penelOpenType.regist == (self.config).openType
  do
    local isAlarm = penelOpenType.alarm == (self.config).openType
    ;
    ((self.ui).button_PayInven):SetShow(isRegist)
    ;
    ((self.ui).button_PayWarehouse):SetShow(isRegist)
    ;
    ((self.ui).hasSilver_Inven):SetShow(isRegist)
    ;
    ((self.ui).hasSilver_Warehouse):SetShow(isRegist)
    ;
    ((self.ui).value_01):SetShow(isRegist)
    ;
    ((self.ui).title_02):SetShow(isRegist)
    ;
    ((self.ui).value_02_Edit):SetShow(isRegist)
    ;
    ((self.ui).title_03):SetShow(isRegist)
    ;
    ((self.ui).value_03_Edit):SetShow(isRegist)
    ;
    ((self.ui).sumPriceText):SetShow(isRegist)
    ;
    ((self.ui).notify):SetShow(isRegist)
    ;
    ((self.ui).btn_Confirm):SetShow(not isAlarm)
    ;
    ((self.ui).button_PayInven):SetCheck(not isRegist)
    ;
    ((self.ui).button_PayWarehouse):SetCheck(isRegist)
    ;
    ((self.ui).value_02_Edit):SetIgnore(not isRegist)
    ;
    ((self.ui).btn_Cancel):SetSpanSize(45, 10)
    if penelOpenType.alarm ~= (self.config).openType then
      local notifyGap = ((self.ui).notify):GetTextSizeY() - (self.value).notifyBGDefaultSize - 10
      ;
      ((self.ui).notify):SetSize(((self.ui).notify):GetSizeX(), ((self.ui).notify):GetTextSizeY())
      Panel_ItemMarket_PreBid:SetSize(320, 415 + notifyGap)
      ;
      ((self.ui).bg):SetSize(290, 260 + notifyGap)
      ;
      ((self.ui).title_01):SetSize(80, 20)
      ;
      ((self.ui).button_PayInven):ComputePos()
      ;
      ((self.ui).button_PayWarehouse):ComputePos()
      ;
      ((self.ui).hasSilver_Inven):ComputePos()
      ;
      ((self.ui).hasSilver_Warehouse):ComputePos()
      Panel_ItemMarket_PreBid:SetHorizonCenter()
      Panel_ItemMarket_PreBid:SetVerticalMiddle()
      Panel_ItemMarket_PreBid:SetSpanSize(0, -120)
    else
      Panel_ItemMarket_PreBid:SetSize(320, 240)
      ;
      ((self.ui).bg):SetSize(290, 135)
      ;
      ((self.ui).btn_Cancel):SetSpanSize(0, 10)
      ;
      ((self.ui).title_01):SetSize(250, 40)
      Panel_ItemMarket_PreBid:SetHorizonRight()
      Panel_ItemMarket_PreBid:SetVerticalBottom()
      Panel_ItemMarket_PreBid:SetSpanSize(10, 10)
    end
    Panel_ItemMarket_PreBid:ComputePos()
    ;
    ((self.ui).btn_Confirm):ComputePos()
    ;
    ((self.ui).btn_Cancel):ComputePos()
    if penelOpenType.regist == (self.config).openType then
      ((self.ui).title_01):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_RESERVATION_MIN_PRICE"))
      ;
      ((self.ui).btn_Confirm):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_RESERVATION"))
      ;
      ((self.ui).btn_Cancel):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_REGISTITEM_BTN_CANCEL"))
      self:updateSilver()
    elseif penelOpenType.alarm == (self.config).openType then
      ((self.ui).btn_Cancel):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_REGISTITEM_BTN_CHECKSUM"))
    end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

ItemMarketPreBid.Update = function(self)
  -- function num : 0_5 , upvalues : penelOpenType, UI_color
  local isRegist = penelOpenType.regist == (self.config).openType
  local itemEnchantKeyRaw = (self.config).itemEnchantKey
  if isRegist then
    itemEnchantKeyRaw = (self.config).itemEnchantKey
  else
    itemEnchantKeyRaw = (self.config).alarmEnchantKey
  end
  local territoryKey = toInt64(0, 0)
  local territoryName = ""
  local reservePrice = toInt64(0, 0)
  local ranking = 0
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKeyRaw))
  if itemSSW == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_REGIST_WRONG_ITEMINFO"))
    return 
  end
  local itemName = itemSSW:getName()
  local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
  local iconPath = itemSSW:getIconPath()
  local isCash = (itemSSW:get()):isCash()
  local masterInfo = getItemMarketMasterByItemEnchantKey(itemEnchantKeyRaw)
  local minPrice_s64 = masterInfo:getMaxPrice()
  local minPrice_s32 = Int64toInt32(minPrice_s64)
  ;
  ((self.ui).value_01):SetText(makeDotMoney(minPrice_s64))
  if isRegist then
    ((self.ui).value_02_Edit):SetEditText(0)
    ;
    ((self.ui).value_03_Edit):SetEditText(1)
    -- DECOMPILER ERROR at PC83: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self.value).minInputMoney = minPrice_s64
  else
    ((self.ui).title_01):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_BUYING_FAIL", "userName", (self.config).buyingName) .. " [" .. getTimeYearMonthDayHourMinSecByTTime64(getUtc64()) .. "]")
  end
  do
    local nameColorGrade = itemSSW:getGradeType()
    if nameColorGrade == 0 then
      ((self.ui).itemName):SetFontColor(UI_color.C_FFFFFFFF)
    elseif nameColorGrade == 1 then
      ((self.ui).itemName):SetFontColor(4284350320)
    elseif nameColorGrade == 2 then
      ((self.ui).itemName):SetFontColor(4283144191)
    elseif nameColorGrade == 3 then
      ((self.ui).itemName):SetFontColor(4294953010)
    elseif nameColorGrade == 4 then
      ((self.ui).itemName):SetFontColor(4294929408)
    else
      ((self.ui).itemName):SetFontColor(UI_color.C_FFFFFFFF)
    end
    ;
    ((self.ui).itemName):SetText(itemName)
    if enchantLevel > 0 then
      ((self.ui).enchantLevel):SetShow(true)
    else
      ((self.ui).enchantLevel):SetShow(false)
    end
    if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
      if enchantLevel == 1 then
        ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
      elseif enchantLevel == 2 then
        ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
      elseif enchantLevel == 3 then
        ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
      elseif enchantLevel == 4 then
        ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
      elseif enchantLevel == 5 then
        ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
      end
    elseif enchantLevel > 0 and enchantLevel < 16 then
      ((self.ui).enchantLevel):SetText("+" .. tostring(enchantLevel))
    elseif enchantLevel == 16 then
      ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
    elseif enchantLevel == 17 then
      ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
    elseif enchantLevel == 18 then
      ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
    elseif enchantLevel == 19 then
      ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
    elseif enchantLevel == 20 then
      ((self.ui).enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
    end
    ;
    ((self.ui).itemIcon):ChangeTextureInfoName("Icon/" .. iconPath)
    ;
    ((self.ui).itemIconBorder):ChangeTextureInfoName("")
    -- DECOMPILER ERROR: 25 unprocessed JMP targets
  end
end

HandleClicked_ItemMarketPreBid_InputMoney = function()
  -- function num : 0_6 , upvalues : ItemMarketPreBid
  local maxMoney = (ItemMarketPreBid.value).invenMoney
  if ((ItemMarketPreBid.ui).button_PayWarehouse):IsCheck() then
    maxMoney = (ItemMarketPreBid.value).wareHouseMoney
  end
  ClearFocusEdit()
  Panel_NumberPad_Show(true, maxMoney, nil, ItemMarketPreBid_InputMoney_ConfirmFunction, false, nil, false)
end

ItemMarketPreBid_InputMoney_ConfirmFunction = function(inputNumber, param)
  -- function num : 0_7 , upvalues : ItemMarketPreBid
  ((ItemMarketPreBid.ui).value_02_Edit):SetEditText(makeDotMoney(inputNumber))
  local reservationPrice = tonumber64((string.gsub)(((ItemMarketPreBid.ui).value_02_Edit):GetEditText(), ",", ""))
  local itemCount = tonumber64((string.gsub)(((ItemMarketPreBid.ui).value_03_Edit):GetEditText(), ",", ""))
  local sumPrice = reservationPrice * itemCount
  ;
  ((ItemMarketPreBid.ui).sumPriceText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_SUMPRICE_SUM", "sumPrice", makeDotMoney(sumPrice)))
end

HandleClicked_ItemMarketPreBid_InputCount = function()
  -- function num : 0_8 , upvalues : ItemMarketPreBid
  local itemEnchantKeyRaw = (ItemMarketPreBid.config).itemEnchantKey
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKeyRaw))
  local isStack = itemSSW:isStackable()
  local maxCount = 500
  if not isStack then
    maxCount = 1
  end
  ClearFocusEdit()
  Panel_NumberPad_Show(true, (toInt64(0, maxCount)), nil, ItemMarketPreBid_InputCount_ConfirmFunction, false, nil, false)
end

ItemMarketPreBid_InputCount_ConfirmFunction = function(inputNumber, param)
  -- function num : 0_9 , upvalues : ItemMarketPreBid
  ((ItemMarketPreBid.ui).value_03_Edit):SetEditText(Int64toInt32(inputNumber))
  local reservationPrice = tonumber64((string.gsub)(((ItemMarketPreBid.ui).value_02_Edit):GetEditText(), ",", ""))
  local itemCount = tonumber64((string.gsub)(((ItemMarketPreBid.ui).value_03_Edit):GetEditText(), ",", ""))
  local sumPrice = reservationPrice * itemCount
  ;
  ((ItemMarketPreBid.ui).sumPriceText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_SUMPRICE_SUM", "sumPrice", makeDotMoney(sumPrice)))
end

ItemMarketPreBid.Open = function(self, enchantItemKey, openType)
  -- function num : 0_10
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R3 in 'UnsetPending'

  (self.config).itemEnchantKey = enchantItemKey
  Panel_ItemMarket_PreBid:SetShow(true, true)
  ;
  ((self.ui).sumPriceText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_SUMPRICE_INIT"))
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.config).isOpen = true
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.config).openType = openType
  self:updateControl()
  self:Update()
end

ItemMarketPreBid.Close = function(self)
  -- function num : 0_11 , upvalues : penelOpenType
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  if penelOpenType.alarm == (self.config).openType then
    (self.config).buyingName = ""
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).isOpen = false
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).openType = 0
  Panel_ItemMarket_PreBid:SetShow(false, true)
end

HandleClicked_ItemMarketPreBid_Confirm = function()
  -- function num : 0_12 , upvalues : penelOpenType, ItemMarketPreBid
  if penelOpenType.regist == (ItemMarketPreBid.config).openType then
    local fromWhereType = (CppEnums.ItemWhereType).eInventory
    do
      if ((ItemMarketPreBid.ui).button_PayWarehouse):IsCheck() then
        fromWhereType = (CppEnums.ItemWhereType).eWarehouse
      end
      local itemEnchantKeyRaw = (ItemMarketPreBid.config).itemEnchantKey
      local reservationPrice = tonumber64((string.gsub)(((ItemMarketPreBid.ui).value_02_Edit):GetEditText(), ",", ""))
      local itemCount = ((ItemMarketPreBid.ui).value_03_Edit):GetEditText()
      local itemSumPrice = reservationPrice * tonumber64(itemCount)
      local doRegistItem = function()
    -- function num : 0_12_0 , upvalues : fromWhereType, itemEnchantKeyRaw, reservationPrice, itemCount
    ToClient_RequestReservationAtItemMarket(fromWhereType, itemEnchantKeyRaw, reservationPrice, itemCount)
  end

      local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_SUMPRICE_MESSAGE_MEMO", "itemSumPrice", makeDotMoney(itemSumPrice))
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = doRegistItem, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  else
    do
      if penelOpenType.manage == (ItemMarketPreBid.config).openType then
        local itemEnchantKeyRaw = (ItemMarketPreBid.config).itemEnchantKey
        local itemIndex = 0
        ToClient_RequestCancelMyReservationForItemMarket(itemEnchantKeyRaw, itemIndex)
        ItemMarketPreBid:Close()
      else
        do
          if penelOpenType.alarm == (ItemMarketPreBid.config).openType then
            ItemMarketPreBid:Close()
          end
        end
      end
    end
  end
end

HandleClicked_ItemMarketPreBid_Close = function()
  -- function num : 0_13 , upvalues : ItemMarketPreBid
  ItemMarketPreBid:Close()
end

FGlobal_ItemMarketPreBid_Open = function(enchantItemKey, openType)
  -- function num : 0_14 , upvalues : ItemMarketPreBid
  ItemMarketPreBid:Open(enchantItemKey, openType)
end

FGlobal_ItemMarketPreBid_Close = function()
  -- function num : 0_15 , upvalues : ItemMarketPreBid
  ItemMarketPreBid:Close()
end

FGlobal_ItemMarketPreBid_Confirm = function()
  -- function num : 0_16
  HandleClicked_ItemMarketPreBid_Confirm()
end

FGlobal_ItemMarketPreBid_Check_OpenType = function()
  -- function num : 0_17 , upvalues : ItemMarketPreBid
  return (ItemMarketPreBid.config).openType
end

FromClient_NotifySellByreservation = function(characterName, enchantItemKey)
  -- function num : 0_18 , upvalues : ItemMarketPreBid, penelOpenType
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  (ItemMarketPreBid.config).buyingName = characterName
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (ItemMarketPreBid.config).alarmEnchantKey = enchantItemKey
  ItemMarketPreBid:Open(enchantItemKey, penelOpenType.alarm)
end

ItemMarketPreBid_CheckRestoreFlush = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_19 , upvalues : ItemMarketPreBid, penelOpenType
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  if (ItemMarketPreBid.config).buyingName ~= "" then
    ItemMarketPreBid:Open((ItemMarketPreBid.config).alarmEnchantKey, penelOpenType.alarm)
  end
end

registerEvent("FromClient_RenderModeChangeState", "ItemMarketPreBid_CheckRestoreFlush")
ItemMarketPreBid.registEventHandler = function(self)
  -- function num : 0_20
  ((self.ui).btn_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketPreBid_Confirm()")
  ;
  ((self.ui).btn_Cancel):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketPreBid_Close()")
  ;
  ((self.ui).value_02_Edit):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketPreBid_InputMoney()")
  ;
  ((self.ui).value_03_Edit):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketPreBid_InputCount()")
end

ItemMarketPreBid.registMessageHandler = function(self)
  -- function num : 0_21
  registerEvent("FromClient_NotifySellByreservation", "FromClient_NotifySellByreservation")
end

ItemMarketPreBid:Init()
ItemMarketPreBid:registEventHandler()
ItemMarketPreBid:registMessageHandler()

