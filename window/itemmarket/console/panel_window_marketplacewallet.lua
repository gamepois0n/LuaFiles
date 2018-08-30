local _panel = Panel_Window_MarketPlaceWallet
local MarketWallet = {
  _ui = {
    stc_TopBg = UI.getChildControl(_panel, "Static_TopBg"),
    stc_LeftBg = UI.getChildControl(_panel, "Static_LeftBg"),
    stc_RightBg = UI.getChildControl(_panel, "Static_RightBg"),
    stc_LeftFocusBg = UI.getChildControl(_panel, "Static_LeftFocusBg"),
    stc_RightFocusBg = UI.getChildControl(_panel, "Static_RightFocusBg"),
    stc_BottomBg = UI.getChildControl(_panel, "Static_BottomBg")
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCooltime = true,
    createExpiration = true,
    createExpirationBG = true,
    createExpiration2h = true,
    createClassEquipBG = true,
    createEnduranceIcon = true,
    createCash = true,
    createBagIcon = true,
    createEnduranceIcon = true,
    createCheckBox = true
  },
  _config = {
    slotCount = 72,
    slotCols = 8,
    slotRows = 0,
    slotStartX = 0,
    slotStartY = 0,
    slotGapX = 53,
    slotGapY = 53
  },
  _slotInvenBgData = {},
  _slotInvenItemData = {},
  _slotWalletBgData = {},
  _slotWalletItemData = {},
  _startInvenSlotIndex = 0
}
function MarketWallet:init()
  self._ui.stc_LeftNormalBG = UI.getChildControl(self._ui.stc_LeftBg, "Static_NormalBg")
  self._ui.stc_LeftBGFocus = UI.getChildControl(self._ui.stc_LeftBg, "Static_LeftFocus")
  self._ui.stc_LeftAConsoleUI = UI.getChildControl(self._ui.stc_LeftBg, "Button_A_ConsoleUI")
  self._ui.stc_LeftSlotFocus = UI.getChildControl(self._ui.stc_LeftBg, "Static_ItemSlotFocus")
  self._ui.stc_LeftSlotBG = UI.getChildControl(self._ui.stc_LeftBg, "Static_SlotBg")
  self._ui.stc_RightNormalBG = UI.getChildControl(self._ui.stc_RightBg, "Static_NormalBg")
  self._ui.stc_RightBGFocus = UI.getChildControl(self._ui.stc_RightBg, "Static_RightFocus")
  self._ui.stc_RightAConsoleUI = UI.getChildControl(self._ui.stc_RightBg, "Button_A_ConsoleUI")
  self._ui.stc_RightSlotFocus = UI.getChildControl(self._ui.stc_RightBg, "Static_ItemSlotFocus")
  self._ui.stc_RightSlotBG = UI.getChildControl(self._ui.stc_RightBg, "Static_SlotBg")
  self._ui.txt_InvenMoney = UI.getChildControl(self._ui.stc_RightBg, "StaticText_MoneyValue")
  self._ui.scroll_RightSlot = UI.getChildControl(self._ui.stc_RightBg, "Scroll_RightSlot")
  self._ui.btn_BConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "Button_B_ConsoleUI")
  self._ui.txt_MoneyValue = UI.getChildControl(self._ui.stc_LeftBg, "StaticText_MoneyValue")
  self._ui.txt_Weight = UI.getChildControl(self._ui.stc_LeftBg, "StaticText_Weight")
  self._ui.txt_Count = UI.getChildControl(self._ui.stc_LeftBg, "StaticText_Count")
  self._config.slotRows = self._config.slotCount / self._config.slotCols
  self._maxSlotRow = math.floor((self._config.slotCount - 1) / self._config.slotCols)
  for slotIdx = 0, self._config.slotCount - 1 do
    local slot = {}
    slot.base = UI.createAndCopyBasePropertyControl(self._ui.stc_RightSlotBG, "Static_ItemSlotBg_Template", self._ui.stc_RightSlotBG, "MarketWallet_Inventory_EmptySlot_" .. slotIdx)
    slot.lock = UI.createAndCopyBasePropertyControl(self._ui.stc_RightSlotBG, "Static_ItemSlotBg_LockIcon", self._ui.stc_RightSlotBG, "MarketWallet_Inventory_LockSlot_" .. slotIdx)
    local row = math.floor(slotIdx / self._config.slotCols)
    local column = slotIdx % self._config.slotCols
    local lockGapX = slot.base:GetSizeX() / 2 - slot.lock:GetSizeX() / 2
    local lockGapY = slot.base:GetSizeY() / 2 - slot.lock:GetSizeY() / 2
    slot.base:SetPosX(self._config.slotStartX + self._config.slotGapX * column)
    slot.base:SetPosY(self._config.slotStartY + self._config.slotGapY * row)
    slot.lock:SetPosXY(slot.base:GetPosX() + lockGapX, slot.base:GetPosY() + lockGapY)
    slot.base:SetShow(true)
    slot.lock:SetShow(false)
    if true == ToClient_isXBox() then
      if 0 == row then
        slot.base:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "")
      elseif self._maxSlotRow == row then
        slot.base:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "")
      end
    end
    UIScroll.InputEventByControl(slot.base, "PaGlobalFunc_MarketWallet_Scroll")
    self._slotInvenBgData[slotIdx] = slot
  end
  for slotIdx = 0, self._config.slotCount - 1 do
    local slot = {}
    slot.base = UI.createAndCopyBasePropertyControl(self._ui.stc_LeftSlotBG, "Static_ItemSlotBg_Template", self._ui.stc_LeftSlotBG, "MarketWallet_Wallet_EmptySlot_" .. slotIdx)
    slot.lock = UI.createAndCopyBasePropertyControl(self._ui.stc_LeftSlotBG, "Static_ItemSlotBg_LockIcon", self._ui.stc_LeftSlotBG, "MarketWallet_Wallet_LockSlot_" .. slotIdx)
    local row = math.floor(slotIdx / self._config.slotCols)
    local column = slotIdx % self._config.slotCols
    local lockGapX = slot.base:GetSizeX() / 2 - slot.lock:GetSizeX() / 2
    local lockGapY = slot.base:GetSizeY() / 2 - slot.lock:GetSizeY() / 2
    slot.base:SetPosX(self._config.slotStartX + self._config.slotGapX * column)
    slot.base:SetPosY(self._config.slotStartY + self._config.slotGapY * row)
    slot.lock:SetPosXY(slot.base:GetPosX() + lockGapX, slot.base:GetPosY() + lockGapY)
    slot.base:SetShow(true)
    slot.lock:SetShow(false)
    if true == ToClient_isXBox() then
      if 0 == row then
        slot.base:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "")
      elseif self._maxSlotRow == row then
        slot.base:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "")
      end
    end
    UIScroll.InputEventByControl(slot.base, "PaGlobalFunc_MarketWallet_Scroll")
    self._slotWalletBgData[slotIdx] = slot
  end
  for slotIdx = 0, self._config.slotCount - 1 do
    local slot = {}
    SlotItem.new(slot, "InventoryItem_" .. slotIdx, slotIdx, self._ui.stc_RightSlotBG, self._slotConfig)
    slot:createChild()
    local row = math.floor(slotIdx / self._config.slotCols)
    local column = slotIdx % self._config.slotCols
    slot.icon:SetPosX(self._config.slotStartX + self._config.slotGapX * column + 2)
    slot.icon:SetPosY(self._config.slotStartY + self._config.slotGapY * row + 2)
    slot.icon:SetEnableDragAndDrop(false)
    slot.icon:SetAutoDisableTime(0.5)
    if true == ToClient_isXBox() then
      if 0 == row then
        slot.icon:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "")
      elseif self._maxSlotRow == row then
        slot.icon:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "")
      end
    end
    UIScroll.InputEventByControl(slot.icon, "PaGlobalFunc_MarketWallet_Scroll")
    self._slotInvenItemData[slotIdx] = slot
  end
  for slotIdx = 0, self._config.slotCount - 1 do
    local slot = {}
    SlotItem.new(slot, "WalletItem_" .. slotIdx, slotIdx, self._ui.stc_LeftSlotBG, self._slotConfig)
    slot:createChild()
    local row = math.floor(slotIdx / self._config.slotCols)
    local column = slotIdx % self._config.slotCols
    slot.icon:SetPosX(self._config.slotStartX + self._config.slotGapX * column + 2)
    slot.icon:SetPosY(self._config.slotStartY + self._config.slotGapY * row + 2)
    slot.icon:SetEnableDragAndDrop(false)
    slot.icon:SetAutoDisableTime(0.5)
    if true == ToClient_isXBox() then
      if 0 == row then
        slot.icon:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "")
      elseif self._maxSlotRow == row then
        slot.icon:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "")
      end
    end
    UIScroll.InputEventByControl(slot.icon, "PaGlobalFunc_MarketWallet_Scroll")
    self._slotWalletItemData[slotIdx] = slot
  end
  self:registEvent()
end
function MarketWallet:registEvent()
  self._ui.stc_LeftNormalBG:addInputEvent("Mouse_On", "InputMO_MarketWallet_ShowFocus(true)")
  self._ui.stc_RightNormalBG:addInputEvent("Mouse_On", "InputMO_MarketWallet_ShowFocus(false)")
  self._ui.btn_BConsoleUI:addInputEvent("Mouse_LUp", "PaGlobalFunc_MarketWallet_Close()")
  registerEvent("FromClient_requestMyWalletList", "FromClient_MarketPlace_RequestMyWalletList")
end
function MarketWallet:open()
  self:updateInventory()
  ToClient_requestMyWalletList()
  self._ui.scroll_RightSlot:SetControlTop()
  _panel:SetShow(true)
end
function MarketWallet:close()
  _panel:SetShow(false)
end
function MarketWallet:updateInventory()
  local invenUseSize = getSelfPlayer():get():getInventorySlotCount(false)
  local useStartSlot = __eTInventorySlotNoUseStart
  local inventory = Inventory_GetCurrentInventory()
  local invenMaxSize = inventory:sizeXXX()
  local slotNoList = Array.new()
  slotNoList:fill(useStartSlot, invenMaxSize - 1)
  local invenCapacity = invenUseSize - useStartSlot
  for slotIdx = 0, self._config.slotCount - 1 do
    local slot = self._slotInvenItemData[slotIdx]
    local slotBg = self._slotInvenBgData[slotIdx]
    local slotNo = slotNoList[slotIdx + 1 + self._startInvenSlotIndex]
    slot:clearItem()
    slot.slotNo = slotNo
    slot.icon:EraseAllEffect()
    slot.icon:addInputEvent("Mouse_On", "")
    slot.icon:addInputEvent("Mouse_Out", "")
    if invenCapacity > slotIdx + self._startInvenSlotIndex then
      local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, slotNo)
      if nil ~= itemWrapper then
        slot:setItem(itemWrapper, slotNo)
        slot.isEmpty = false
        local isFiltered = self:marketFilter(slotNo, itemWrapper, CppEnums.ItemWhereType.eInventory)
        slot.icon:SetEnable(not isFiltered)
        slot.icon:SetMonoTone(isFiltered)
        slot.icon:SetIgnore(isFiltered)
        if true == isFiltered then
          slot.icon:SetAlpha(0.5)
          InputMO_MarketWallet_HideSlotFocus()
        else
          slot.icon:addInputEvent("Mouse_On", "InputMO_MarketWallet_ShowSlotFocus(" .. slotIdx .. ", false)")
          slot.icon:addInputEvent("Mouse_Out", "InputMO_MarketWallet_HideSlotFocus()")
          slot.icon:addInputEvent("Mouse_RUp", "InputMRUp_MarketWallet_MoveInvenToWallet(" .. slotNo .. ")")
          slot.icon:SetAlpha(1)
        end
        local isSoulCollector = itemWrapper:isSoulCollector()
        local isCurrentSoulCount = itemWrapper:getSoulCollectorCount()
        local isMaxSoulCount = itemWrapper:getSoulCollectorMaxCount()
        local itemIconPath = itemWrapper:getStaticStatus():getIconPath()
        if isSoulCollector then
          slot.icon:ChangeTextureInfoName("icon/" .. itemIconPath)
          if 0 == isCurrentSoulCount then
            slot.icon:ChangeTextureInfoName("icon/" .. itemIconPath)
          end
          if isCurrentSoulCount > 0 then
            slot.icon:ChangeTextureInfoName("New_UI_Common_forLua/ExceptionIcon/00040351_1.dds")
          end
          if isCurrentSoulCount == isMaxSoulCount then
            slot.icon:ChangeTextureInfoName("New_UI_Common_forLua/ExceptionIcon/00040351_2.dds")
          end
          local x1, y1, x2, y2 = setTextureUV_Func(slot.icon, 0, 0, 42, 42)
          slot.icon:getBaseTexture():setUV(x1, y1, x2, y2)
          slot.icon:setRenderTexture(slot.icon:getBaseTexture())
        end
      end
      slotBg.lock:SetShow(false)
    else
      InputMO_MarketWallet_HideSlotFocus()
      slotBg.lock:SetShow(true)
    end
  end
  local money = Defines.s64_const.s64_0
  local moneyItemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, getMoneySlotNo())
  if nil ~= moneyItemWrapper then
    money = moneyItemWrapper:get():getCount_s64()
  end
  self._ui.txt_InvenMoney:SetText(makeDotMoney(money))
  UIScroll.SetButtonSize(self._ui.scroll_RightSlot, self._config.slotCount, invenMaxSize - useStartSlot)
end
function MarketWallet:updateWallet()
  local currentWeight = getWorldMarketCurrentWeight()
  local maxWeight = getWorldMarketMaxWeight()
  local silverInfo = getWorldMarketSilverInfo()
  if 0 ~= currentWeight then
    currentWeight = currentWeight / 100
  end
  if 0 ~= maxWeight then
    maxWeight = maxWeight / 100
  end
  self._ui.txt_MoneyValue:SetText(tostring(silverInfo:getItemCount()))
  self._ui.txt_Weight:SetText(tostring(currentWeight .. "/" .. maxWeight .. "LT"))
  local slotNoList = Array.new()
  local walletItemCount = getWorldMarketMyWalletListCount()
  self._ui.txt_Count:SetText(tostring(walletItemCount))
  slotNoList:fill(0, self._config.slotCount - 1)
  for slotIdx = 0, self._config.slotCount - 1 do
    local slot = self._slotWalletItemData[slotIdx]
    local slotBg = self._slotWalletBgData[slotIdx]
    local slotNo = slotNoList[slotIdx + 1 + self._startInvenSlotIndex]
    slot:clearItem()
    slot.slotNo = slotNo
    slot.icon:EraseAllEffect()
    slot.icon:addInputEvent("Mouse_On", "")
    slot.icon:addInputEvent("Mouse_Out", "")
    if walletItemCount > slotIdx then
      local itemMyWalletInfo = getWorldMarketMyWalletListByIdx(slotIdx)
      local itemWrapper = itemMyWalletInfo:getItemEnchantStaticStatusWrapper()
      if nil ~= itemWrapper then
        local s64_inventoryItemCount
        slot:setItemByStaticStatus(itemWrapper, itemMyWalletInfo:getItemCount(), -1, false, nil, false, 0, 0, nil)
        slot.isEmpty = false
        slot.icon:addInputEvent("Mouse_On", "InputMO_MarketWallet_ShowSlotFocus(" .. slotIdx .. ", true)")
        slot.icon:addInputEvent("Mouse_Out", "InputMO_MarketWallet_HideSlotFocus()")
        slot.icon:addInputEvent("Mouse_RUp", "InputMRUp_MarketWallet_MoveWalletToInven(" .. slotIdx .. ")")
        slot.icon:SetAlpha(1)
      end
    end
    slotBg.lock:SetShow(false)
  end
  UIScroll.SetButtonSize(self._ui.scroll_RightSlot, self._config.slotCount, self._config.slotCount)
end
function MarketWallet:marketFilter(slotNo, itemWrapper, invenWhereType)
  if nil == itemWrapper then
    return true
  end
  local isAble = requestIsRegisterItemForItemMarket(itemWrapper:get():getKey())
  local itemBindType = itemWrapper:getStaticStatus():get()._vestedType:getItemKey()
  local isVested = itemWrapper:get():isVested()
  local isPersonalTrade = itemWrapper:getStaticStatus():isPersonalTrade()
  if isUsePcExchangeInLocalizingValue() then
    local isFilter = isVested and isPersonalTrade
    if isFilter then
      return isFilter
    end
  end
  if true == isAble then
    if ToClient_Inventory_CheckItemLock(slotNo, invenWhereType) then
      isAble = false
    else
      isAble = true
    end
  end
  if 2 == itemBindType then
    if true ~= itemWrapper:get():isVested() and isAble then
      isAble = true
    else
      isAble = false
    end
  end
  if itemWrapper:isCash() then
    if false == isAble and false == ItemMarketRegistItem._isAblePearlProduct then
      isAble = false
    else
      isAble = isAble and ItemMarketRegistItem._isAblePearlProduct
    end
  end
  return not isAble
end
function PaGlobalFunc_MarketWallet_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_MarketWallet_Init()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self:init()
end
function PaGlobalFunc_MarketWallet_Open()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self:open()
end
function PaGlobalFunc_MarketWallet_ForceClose()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self:close()
end
function PaGlobalFunc_MarketWallet_Close()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self:close()
  PaGlobalFunc_MarketPlace_OpenFromDialog()
end
function InputMO_MarketWallet_ShowFocus(isLeft)
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self._ui.stc_RightFocusBg:SetShow(not isLeft)
  self._ui.stc_RightBGFocus:SetShow(not isLeft)
  self._ui.stc_RightAConsoleUI:SetShow(not isLeft)
  self._ui.stc_LeftFocusBg:SetShow(isLeft)
  self._ui.stc_LeftBGFocus:SetShow(isLeft)
  self._ui.stc_LeftAConsoleUI:SetShow(isLeft)
end
function InputMO_MarketWallet_ShowSlotFocus(slotIdx, isLeft)
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  if true == isLeft then
    slotBg = self._slotWalletBgData[slotIdx].base
    self._ui.stc_LeftSlotFocus:SetPosXY(self._ui.stc_LeftSlotBG:GetPosX() + slotBg:GetPosX(), self._ui.stc_LeftSlotBG:GetPosY() + slotBg:GetPosY())
    self._ui.stc_LeftSlotFocus:SetShow(true)
  elseif false == isLeft then
    slotBg = self._slotInvenBgData[slotIdx].base
    self._ui.stc_RightSlotFocus:SetPosXY(self._ui.stc_RightSlotBG:GetPosX() + slotBg:GetPosX(), self._ui.stc_RightSlotBG:GetPosY() + slotBg:GetPosY())
    self._ui.stc_RightSlotFocus:SetShow(true)
  end
end
function InputMRUp_MarketWallet_MoveInvenToWallet(slotNo)
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  requestMoveItemInventoryToWallet(CppEnums.ItemWhereType.eInventory, slotNo, 1, FGlobal_ItemMarket_IsOpenByMaid())
end
function InputMRUp_MarketWallet_MoveWalletToInven(slotIdx)
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  local itemMyWalletInfo = getWorldMarketMyWalletListByIdx(slotIdx)
  requestMoveItemWalletToInventory(itemMyWalletInfo:getEnchantKey())
end
function InputMO_MarketWallet_HideSlotFocus()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self._ui.stc_RightSlotFocus:SetShow(false)
  self._ui.stc_LeftSlotFocus:SetShow(false)
end
function PaGlobalFunc_MarketWallet_Scroll(isUp)
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  local useStartSlot = __eTInventorySlotNoUseStart
  local inventory = Inventory_GetCurrentInventory()
  local maxSize = inventory:sizeXXX() - useStartSlot
  self._startInvenSlotIndex = UIScroll.ScrollEvent(self._ui.scroll_RightSlot, isUp, self._config.slotRows, maxSize, self._startInvenSlotIndex, self._config.slotCols)
  self:updateInventory()
end
function FromClient_MarketPlace_RequestMyWalletList()
  PaGlobalFunc_MarketPlace_UpdateWalletInfo()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self:updateWallet()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_MarketWallet_Init")
