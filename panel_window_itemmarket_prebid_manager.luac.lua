-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_prebid_manager.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
ItemMarketPreBidManager_ShowAni = function()
  -- function num : 0_0
  Panel_ItemMarket_PreBid_Manager:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_ItemMarket_PreBid_Manager, 0, 0.3)
end

ItemMarketPreBidManager_HideAni = function()
  -- function num : 0_1
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_ItemMarket_PreBid_Manager, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

Panel_ItemMarket_PreBid_Manager:RegisterShowEventFunc(true, "ItemMarketPreBidManager_ShowAni()")
Panel_ItemMarket_PreBid_Manager:RegisterShowEventFunc(false, "ItemMarketPreBidManager_HideAni()")
Panel_ItemMarket_PreBid_Manager:SetShow(false, false)
Panel_ItemMarket_PreBid_Manager:ActiveMouseEventEffect(true)
Panel_ItemMarket_PreBid_Manager:setGlassBackground(true)
local ItemMarketPreBid_Manager = {
ui = {btn_Close = (UI.getChildControl)(Panel_ItemMarket_PreBid_Manager, "Button_Close"), bg = (UI.getChildControl)(Panel_ItemMarket_PreBid_Manager, "Static_BG"), scroll = (UI.getChildControl)(Panel_ItemMarket_PreBid_Manager, "Scroll_ItemMarket_PreBid"), notify = (UI.getChildControl)(Panel_ItemMarket_PreBid_Manager, "StaticText_Notify"), notifyBG = (UI.getChildControl)(Panel_ItemMarket_PreBid_Manager, "Static_NotifyBG"), guideMsg = (UI.getChildControl)(Panel_ItemMarket_PreBid_Manager, "StaticText_UseGuide")}
, 
createUiPool = {}
, createUiSlotCount = 4, 
config = {itemEnchantKey = nil, isRespone = false, scrollStartIdx = 0, reservationsCount = 0, myTerritoryKeyRaw = 0}
, 
value = {invenMoney = toInt64(0, 0), wareHouseMoney = toInt64(0, 0), minInputMoney = toInt64(0, 0), panelDefaultSize = 0, notifyDefaultSize = 0}
}
-- DECOMPILER ERROR at PC108: Confused about usage of register: R4 in 'UnsetPending'

;
(ItemMarketPreBid_Manager.ui).scrollBtn = (UI.getChildControl)((ItemMarketPreBid_Manager.ui).scroll, "Scroll_CtrlButton")
ItemMarketPreBid_Manager.Init = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  ((self.ui).notify):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self.ui).guideMsg):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self.ui).guideMsg):SetText(PAGetString(Defines.StringSheet_GAME, "GAME_ITEM_MARKET_GUIDEMSG"))
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.value).notifyDefaultSize = ((self.ui).notifyBG):GetSizeY()
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.value).panelDefaultSize = Panel_ItemMarket_PreBid_Manager:GetSizeY()
  for slotIdx = 0, self.createUiSlotCount - 1 do
    local tempSlot = {}
    tempSlot.slotBG = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "Static_SlotBG", (self.ui).bg, "Panel_ItemMarket_PreBid_Manager_ManageList_SlotBG_" .. R11_PC46)
    tempSlot.iconBG = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "Static_Slot_IconBG", tempSlot.slotBG, "Panel_ItemMarket_PreBid_Manager_ManageList_IconBG_" .. R11_PC46)
    -- DECOMPILER ERROR at PC65: Overwrote pending register: R11 in 'AssignReg'

    tempSlot.icon = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "Static_Slot_Icon", tempSlot.iconBG, "Panel_ItemMarket_PreBid_Manager_ManageList_Icon_" .. R11_PC46)
    -- DECOMPILER ERROR at PC75: Overwrote pending register: R11 in 'AssignReg'

    tempSlot.count = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "StaticText_Slot_Count", tempSlot.iconBG, "Panel_ItemMarket_PreBid_Manager_ManageList_Count_" .. R11_PC46)
    -- DECOMPILER ERROR at PC85: Overwrote pending register: R11 in 'AssignReg'

    tempSlot.level = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "StaticText_EnchantLevel", tempSlot.icon, "Panel_ItemMarket_PreBid_Manager_ManageList_Level_" .. R11_PC46)
    -- DECOMPILER ERROR at PC95: Overwrote pending register: R11 in 'AssignReg'

    tempSlot.border = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "Static_Slot_Border", tempSlot.iconBG, "Panel_ItemMarket_PreBid_Manager_ManageList_IconBorder_" .. R11_PC46)
    -- DECOMPILER ERROR at PC105: Overwrote pending register: R11 in 'AssignReg'

    tempSlot.name = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "StaticText_Slot_ItemName", tempSlot.slotBG, "Panel_ItemMarket_PreBid_Manager_ManageList_Name_" .. R11_PC46)
    -- DECOMPILER ERROR at PC115: Overwrote pending register: R11 in 'AssignReg'

    tempSlot.reservationPrice = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "StaticText_Slot_ReservationPrice", tempSlot.slotBG, "Panel_ItemMarket_PreBid_Manager_ManageList_ReservationPrice_" .. R11_PC46)
    -- DECOMPILER ERROR at PC125: Overwrote pending register: R11 in 'AssignReg'

    tempSlot.territory = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "StaticText_Slot_Territory", tempSlot.slotBG, "Panel_ItemMarket_PreBid_Manager_ManageList_territory_" .. R11_PC46)
    -- DECOMPILER ERROR at PC135: Overwrote pending register: R11 in 'AssignReg'

    tempSlot.cancelBtn = (UI.createAndCopyBasePropertyControl)(Panel_ItemMarket_PreBid_Manager, "Button_ReservationCancel", tempSlot.slotBG, "Panel_ItemMarket_PreBid_Manager_ManageList_ReservationCancel_" .. R11_PC46)
    ;
    (tempSlot.slotBG):SetSpanSize(0, slotIdx + (tempSlot.slotBG):GetSizeY() * slotIdx)
    ;
    (tempSlot.iconBG):SetPosX(5)
    ;
    (tempSlot.iconBG):SetPosY(12)
    ;
    (tempSlot.icon):SetPosX(0)
    ;
    (tempSlot.icon):SetPosY(0)
    ;
    (tempSlot.name):SetPosX((tempSlot.iconBG):GetPosX() + (tempSlot.iconBG):GetSizeX() + 8)
    ;
    (tempSlot.name):SetPosY((tempSlot.iconBG):GetPosY() - 5)
    ;
    (tempSlot.reservationPrice):SetPosX((tempSlot.iconBG):GetPosX() + (tempSlot.iconBG):GetSizeX() + 8)
    -- DECOMPILER ERROR at PC202: Overwrote pending register: R11 in 'AssignReg'

    ;
    (tempSlot.reservationPrice):SetPosY((tempSlot.iconBG):GetPosY() + ((tempSlot.name):GetPosY() + (tempSlot.name):GetSizeY() - 12))
    ;
    (tempSlot.territory):SetPosX((tempSlot.iconBG):GetPosX() + (tempSlot.iconBG):GetSizeX() + 8)
    -- DECOMPILER ERROR at PC228: Overwrote pending register: R11 in 'AssignReg'

    ;
    (tempSlot.territory):SetPosY((tempSlot.iconBG):GetPosY() + ((tempSlot.reservationPrice):GetPosY() + (tempSlot.reservationPrice):GetSizeY() - 15))
    ;
    (tempSlot.cancelBtn):SetPosX((tempSlot.slotBG):GetSizeX() - (tempSlot.cancelBtn):GetSizeX() - 5)
    ;
    (tempSlot.cancelBtn):SetPosY((tempSlot.slotBG):GetSizeY() / 2 - (tempSlot.cancelBtn):GetSizeY() / 2)
    -- DECOMPILER ERROR at PC258: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.createUiPool)[slotIdx] = tempSlot
  end
end

ItemMarketPreBid_Manager.updateControl = function(self)
  -- function num : 0_3
  Panel_ItemMarket_PreBid_Manager:ComputePos()
  ;
  ((self.ui).btn_Close):ComputePos()
end

ItemMarketPreBid_Manager.UpdateSlot = function(self, dataIdx, uiIdx)
  -- function num : 0_4 , upvalues : UI_color
  local tempWrapper = ToClient_GetItemMarketMyReservationByIndex(dataIdx)
  if tempWrapper == nil then
    return 
  end
  local itemEnchantKey = (tempWrapper:getItemEnchantKey()):get()
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  local territoryKey = tempWrapper:getTerritoryKey()
  local reservePrice = tempWrapper:getReservePrice()
  local ranking = tempWrapper:getRanking()
  local leftCount = tempWrapper:getLeftCount()
  local itemName = itemSSW:getName()
  local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
  local iconPath = itemSSW:getIconPath()
  local isCash = (itemSSW:get()):isCash()
  local isRegistHere = (self.config).myTerritoryKeyRaw == territoryKey
  local territoryInfoWrapper = getTerritoryInfoWrapper(territoryKey)
  if territoryInfoWrapper ~= nil then
    territoryName = territoryInfoWrapper:getTerritoryName()
  end
  local ui = (self.createUiPool)[uiIdx]
  ;
  (ui.slotBG):SetShow(true)
  do
    local nameColorGrade = itemSSW:getGradeType()
    if nameColorGrade == 0 then
      (ui.name):SetFontColor(UI_color.C_FFFFFFFF)
    elseif nameColorGrade == 1 then
      (ui.name):SetFontColor(4284350320)
    elseif nameColorGrade == 2 then
      (ui.name):SetFontColor(4283144191)
    elseif nameColorGrade == 3 then
      (ui.name):SetFontColor(4294953010)
    elseif nameColorGrade == 4 then
      (ui.name):SetFontColor(4294929408)
    else
      (ui.name):SetFontColor(UI_color.C_FFFFFFFF)
    end
    ;
    (ui.name):SetText(itemName)
    ;
    (ui.count):SetText(tostring(leftCount))
    if enchantLevel > 0 then
      (ui.level):SetShow(true)
    else
      (ui.level):SetShow(false)
    end
    if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
      if enchantLevel == 1 then
        (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
      elseif enchantLevel == 2 then
        (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
      elseif enchantLevel == 3 then
        (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
      elseif enchantLevel == 4 then
        (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
      elseif enchantLevel == 5 then
        (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
      end
    elseif enchantLevel > 0 and enchantLevel < 16 then
      (ui.level):SetText("+" .. tostring(enchantLevel))
    elseif enchantLevel == 16 then
      (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
    elseif enchantLevel == 17 then
      (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
    elseif enchantLevel == 18 then
      (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
    elseif enchantLevel == 19 then
      (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
    elseif enchantLevel == 20 then
      (ui.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
    end
    ;
    (ui.icon):ChangeTextureInfoName("Icon/" .. iconPath)
    ;
    (ui.reservationPrice):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_RESERVATION_PRICE", "price", makeDotMoney(reservePrice)))
    ;
    (ui.territory):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_RESERVATION_TERRITORY", "territoryName", territoryName))
    ;
    (ui.cancelBtn):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketPreBid_Manager_ReservationCancel( " .. dataIdx .. " )")
    ;
    (ui.cancelBtn):SetIgnore(not isRegistHere)
    ;
    (ui.cancelBtn):SetMonoTone(not isRegistHere)
    -- DECOMPILER ERROR: 21 unprocessed JMP targets
  end
end

ItemMarketPreBid_Manager.Update = function(self)
  -- function num : 0_5 , upvalues : ItemMarketPreBid_Manager
  for uiIdx = 0, self.createUiSlotCount - 1 do
    local ui = (self.createUiPool)[uiIdx]
    ;
    (ui.slotBG):SetShow(false)
    ;
    (ui.cancelBtn):addInputEvent("Mouse_LUp", "")
  end
  local territoryName = ""
  local territoryInfoWrapper = getTerritoryInfoWrapper((self.config).myTerritoryKeyRaw)
  if territoryInfoWrapper ~= nil then
    territoryName = territoryInfoWrapper:getTerritoryName()
  end
  ;
  ((self.ui).notify):SetShow(true)
  ;
  ((self.ui).notify):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_MANAGER_NOTIFY", "territoryName", territoryName))
  local notifyGap = ((self.ui).notify):GetTextSizeY() - (self.value).notifyDefaultSize + 15
  ;
  ((self.ui).notifyBG):SetSize(((self.ui).notifyBG):GetSizeX(), (self.value).notifyDefaultSize + notifyGap)
  ;
  ((self.ui).notify):SetSize(((self.ui).notifyBG):GetSizeX() - 10, ((self.ui).notifyBG):GetSizeY() - 10)
  Panel_ItemMarket_PreBid_Manager:SetSize(Panel_ItemMarket_PreBid_Manager:GetSizeX(), (self.value).panelDefaultSize + notifyGap)
  self:updateControl()
  ;
  ((self.ui).guideMsg):SetShow(false)
  ;
  ((self.ui).scroll):SetShow(false)
  -- DECOMPILER ERROR at PC100: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self.config).reservationsCount = ToClient_GetItemMarketMyReservationsCount()
  if (self.config).reservationsCount <= 0 then
    ((self.ui).guideMsg):SetShow(true)
    return 
  end
  local uiIdx = 0
  for itemIdx = (self.config).scrollStartIdx, (self.config).reservationsCount - 1 do
    if self.createUiSlotCount - 1 < uiIdx then
      break
    end
    local tempWrapper = ToClient_GetItemMarketMyReservationByIndex(itemIdx)
    if tempWrapper == nil then
      ItemMarketPreBid_Manager:Close()
      return 
    end
    ItemMarketPreBid_Manager:UpdateSlot(itemIdx, uiIdx)
    uiIdx = uiIdx + 1
  end
  do
    ;
    (UIScroll.SetButtonSize)((self.ui).scroll, self.createUiSlotCount, (self.config).reservationsCount)
  end
end

ItemMarketPreBid_Manager.Open = function(self)
  -- function num : 0_6
  if not (self.config).isRespone then
    ToClient_RequestItemMarketReservations()
    return 
  else
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self.config).reservationsCount = ToClient_GetItemMarketMyReservationsCount()
    local RegionInfoWrapper = ToClient_getRegionInfoWrapperByPosition(((getSelfPlayer()):get()):getPosition())
    local TerritoryKeyRaw = RegionInfoWrapper:getTerritoryKeyRaw()
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self.config).myTerritoryKeyRaw = TerritoryKeyRaw
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R3 in 'UnsetPending'

    if (self.config).reservationsCount > 0 then
      (self.config).isRespone = false
      Panel_ItemMarket_PreBid_Manager:SetShow(true, true)
      ;
      ((self.ui).scroll):SetControlTop()
      self:updateControl()
      self:Update()
    end
  end
end

ItemMarketPreBid_Manager.Close = function(self)
  -- function num : 0_7
  Panel_ItemMarket_PreBid_Manager:SetShow(false, true)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).isRespone = false
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).scrollStartIdx = 0
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).reservationsCount = 0
end

HandleClicked_ItemMarketPreBid_Manager_ReservationCancel = function(dataIdx)
  -- function num : 0_8 , upvalues : ItemMarketPreBid_Manager
  local tempWrapper = ToClient_GetItemMarketMyReservationByIndex(dataIdx)
  if tempWrapper ~= nil then
    local itemEnchantKeyRaw = (tempWrapper:getItemEnchantKey()):get()
    do
      if itemEnchantKeyRaw ~= nil then
        local doCancel = function()
    -- function num : 0_8_0 , upvalues : itemEnchantKeyRaw, dataIdx, ItemMarketPreBid_Manager
    ToClient_RequestCancelMyReservationForItemMarket(itemEnchantKeyRaw, dataIdx)
    ItemMarketPreBid_Manager:Update()
  end

        local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKeyRaw))
        local itemName = itemSSW:getName()
        local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_PREBID_RESERVATION_CANCEL", "itemName", itemName)
        do
          local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = doCancel, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageBoxData)
          -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

HandleClicked_ItemMarketPreBid_Manager_Close = function()
  -- function num : 0_9 , upvalues : ItemMarketPreBid_Manager
  ItemMarketPreBid_Manager:Close()
end

HandleClicked_ItemMarketPreBid_Manager_ScrollPress = function()
  -- function num : 0_10 , upvalues : ItemMarketPreBid_Manager
  local config = ItemMarketPreBid_Manager.config
  local scrollPos = ((ItemMarketPreBid_Manager.ui).scroll):GetControlPos()
  local resultCount = (ItemMarketPreBid_Manager.config).reservationsCount
  local maxViewCount = ItemMarketPreBid_Manager.createUiSlotCount
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (ItemMarketPreBid_Manager.config).scrollStartIdx = (math.ceil)((resultCount - maxViewCount) * scrollPos)
  ItemMarketPreBid_Manager:Update()
end

ItemMarketPreBid_Manager_Scroll = function(isUp)
  -- function num : 0_11 , upvalues : ItemMarketPreBid_Manager
  local scroll = (ItemMarketPreBid_Manager.ui).scroll
  local slotCount = ItemMarketPreBid_Manager.createUiSlotCount
  local resultCount = (ItemMarketPreBid_Manager.config).reservationsCount
  local startIdx = (ItemMarketPreBid_Manager.config).scrollStartIdx
  startIdx = (UIScroll.ScrollEvent)(scroll, isUp, slotCount, resultCount, startIdx, 1)
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (ItemMarketPreBid_Manager.config).scrollStartIdx = startIdx
  ItemMarketPreBid_Manager:Update()
end

FGlobal_ItemMarketPreBid_Manager_Open = function()
  -- function num : 0_12 , upvalues : ItemMarketPreBid_Manager
  if Panel_Window_ItemMarket:GetShow() then
    FGolbal_ItemMarketNew_Close()
  end
  if Panel_Window_ItemMarket_ItemSet:GetShow() then
    FGlobal_ItemMarketItemSet_Close()
  end
  if Panel_Window_ItemMarket_BuyConfirm:GetShow() then
    FGlobal_ItemMarket_BuyConfirm_Close()
  end
  if Panel_ItemMarket_AlarmList:GetShow() then
    FGlobal_ItemMarketAlarmList_Close()
  end
  if Panel_Window_ItemMarket_RegistItem:GetShow() then
    FGlobal_ItemMarketRegistItem_Close()
  end
  ItemMarketPreBid_Manager:Open()
end

FGlobal_ItemMarketPreBid_Manager_Close = function()
  -- function num : 0_13 , upvalues : ItemMarketPreBid_Manager
  ItemMarketPreBid_Manager:Close()
end

FGlobal_ItemMarketPreBid_Manager_Update = function()
  -- function num : 0_14 , upvalues : ItemMarketPreBid_Manager
  ItemMarketPreBid_Manager:Update()
end

FromClient_responseMyItemMarketReservationInfo = function()
  -- function num : 0_15 , upvalues : ItemMarketPreBid_Manager
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

  (ItemMarketPreBid_Manager.config).isRespone = true
  ItemMarketPreBid_Manager:Open()
end

ItemMarketPreBid_Manager.registEventHandler = function(self)
  -- function num : 0_16
  ((self.ui).bg):addInputEvent("Mouse_UpScroll", "ItemMarketPreBid_Manager_Scroll( true )")
  ;
  ((self.ui).bg):addInputEvent("Mouse_DownScroll", "ItemMarketPreBid_Manager_Scroll( false )")
  ;
  ((self.ui).scroll):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketPreBid_Manager_ScrollPress()")
  ;
  ((self.ui).scrollBtn):addInputEvent("Mouse_LPress", "HandleClicked_ItemMarketPreBid_Manager_ScrollPress()")
  ;
  ((self.ui).btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketPreBid_Manager_Close()")
end

ItemMarketPreBid_Manager.registMessageHandler = function(self)
  -- function num : 0_17
  registerEvent("FromClient_responseMyItemMarketReservationInfo", "FromClient_responseMyItemMarketReservationInfo")
end

ItemMarketPreBid_Manager:Init()
ItemMarketPreBid_Manager:registEventHandler()
ItemMarketPreBid_Manager:registMessageHandler()

