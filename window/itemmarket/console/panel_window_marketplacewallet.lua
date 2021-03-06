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
  _startInvenSlotIndex = 0,
  _isAblePearlProduct = false,
  _moneySlot = 0
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
  self._ui.btn_RegisterMoney = UI.getChildControl(self._ui.stc_RightBg, "Static_MoneyIcon")
  self._ui.txt_InvenWeight = UI.getChildControl(self._ui.stc_RightBg, "StaticText_Weight")
  self._ui.txt_WareHouseMoney = UI.getChildControl(self._ui.stc_RightBg, "StaticText_WareHouseMoneyValue")
  self._ui.btn_WareHouseRegisterMoney = UI.getChildControl(self._ui.stc_RightBg, "Static_WareHouseMoneyIcon")
  self._ui.btn_Radio_Inventory = UI.getChildControl(self._ui.stc_RightBg, "RadioButton_Icon_Money")
  self._ui.btn_Radio_WareHouse = UI.getChildControl(self._ui.stc_RightBg, "RadioButton_Icon_Money2")
  self._ui.btn_Radio_Inventory:SetCheck(true)
  self._ui.btn_Radio_WareHouse:SetCheck(false)
  self._ui.btn_BConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "Button_B_ConsoleUI")
  self._ui.txt_MoneyValue = UI.getChildControl(self._ui.stc_LeftBg, "StaticText_MoneyValue")
  self._ui.txt_Weight = UI.getChildControl(self._ui.stc_LeftBg, "StaticText_Weight")
  self._ui.txt_Count = UI.getChildControl(self._ui.stc_LeftBg, "StaticText_Count")
  self._ui.btn_WithdrawMoney = UI.getChildControl(self._ui.stc_LeftBg, "Static_MoneyIcon")
  self._isAblePearlProduct = requestCanRegisterPearlItemOnMarket()
  self._moneySlot = getMoneySlotNo()
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
    if true == ToClient_isXBox() or true == ToClient_isPS4() then
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
    if true == ToClient_isXBox() or true == ToClient_isPS4() then
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
    if true == ToClient_isXBox() or true == ToClient_isPS4() then
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
    if true == ToClient_isXBox() or true == ToClient_isPS4() then
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
  self._ui.btn_RegisterMoney:addInputEvent("Mouse_RUp", "InputMRUp_MarketWallet_RegisterMoney()")
  self._ui.btn_WareHouseRegisterMoney:addInputEvent("Mouse_RUp", "InputMRUp_MarketWallet_RegisterMoney()")
  self._ui.btn_WithdrawMoney:addInputEvent("Mouse_RUp", "InputMRUp_MarketWallet_WithdrawMoney()")
  registerEvent("FromClient_requestMyWalletList", "FromClient_MarketPlace_RequestMyWalletList")
  registerEvent("FromClient_requestPush", "FromClient_MarketPlace_RequestPush")
  registerEvent("FromClient_requestPop", "FromClient_MarketPlace_RequestPop")
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
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local invenUseSize = selfPlayer:getInventorySlotCount(false)
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
  local moneyItemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, self._moneySlot)
  if nil ~= moneyItemWrapper then
    money = moneyItemWrapper:get():getCount_s64()
  end
  self._ui.txt_InvenMoney:SetText(makeDotMoney(money))
  self._ui.txt_WareHouseMoney:SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
  local _const = Defines.s64_const
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local s64_allWeight_div = s64_allWeight / _const.s64_100
  local s64_maxWeight_div = s64_maxWeight / _const.s64_100
  local str_AllWeight = string.format("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local str_MaxWeight = string.format("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  self._ui.txt_InvenWeight:SetText(str_AllWeight .. " / " .. str_MaxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  UIScroll.SetButtonSize(self._ui.scroll_RightSlot, self._config.slotCount, invenMaxSize - useStartSlot)
end
function MarketWallet:updateWallet()
  local currentWeight = getWorldMarketCurrentWeight()
  local maxWeight = getWorldMarketMaxWeight()
  local silverInfo = getWorldMarketSilverInfo()
  local _const = Defines.s64_const
  local s64_allWeight = toInt64(0, currentWeight)
  local s64_maxWeight = toInt64(0, maxWeight)
  local s64_allWeight_div = s64_allWeight / _const.s64_100
  local s64_maxWeight_div = s64_maxWeight / _const.s64_100
  local str_AllWeight = string.format("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local str_MaxWeight = string.format("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  self._ui.txt_MoneyValue:SetText(makeDotMoney(silverInfo:getItemCount()))
  self._ui.txt_Weight:SetText(str_AllWeight .. " / " .. str_MaxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
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
        slot:setItemByStaticStatus(itemWrapper, itemMyWalletInfo:getItemCount(), -1, false, nil, false, 0, 0, nil, true)
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
    if false == isAble and false == self._isAblePearlProduct then
      isAble = false
    else
      isAble = isAble and self._isAblePearlProduct
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
function InputMRUp_MarketWallet_RegisterMoney()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  local money = Defines.s64_const.s64_0
  if self._ui.btn_Radio_Inventory:IsCheck() then
    local moneyItemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, self._moneySlot)
    if nil ~= moneyItemWrapper then
      money = moneyItemWrapper:get():getCount_s64()
    end
  else
    money = warehouse_moneyFromNpcShop_s64()
  end
  Panel_NumberPad_Show(true, money, self._moneySlot, InputMRUp_MarketWallet_Register)
end
function InputMRUp_MarketWallet_WithdrawMoney()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  local itemMysilverInfo = getWorldMarketSilverInfo()
  local itemCount = itemMysilverInfo:getItemCount()
  local itemEnchantKey = itemMysilverInfo:getEnchantKey()
  Panel_NumberPad_Show(true, itemCount, itemEnchantKey, InputMRUp_MarketWallet_Withdraw)
end
function InputMRUp_MarketWallet_MoveInvenToWallet(slotNo)
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  local itemCount = Defines.s64_const.s64_0
  local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, slotNo)
  if nil ~= itemWrapper then
    local isStackable = itemWrapper:getStaticStatus():isStackable()
    if false == isStackable then
      InputMRUp_MarketWallet_Register(1, slotNo)
      return
    else
      itemCount = itemWrapper:get():getCount_s64()
    end
  end
  Panel_NumberPad_Show(true, itemCount, slotNo, InputMRUp_MarketWallet_Register)
end
function InputMRUp_MarketWallet_MoveWalletToInven(slotIdx)
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  local itemMyWalletInfo = getWorldMarketMyWalletListByIdx(slotIdx)
  local itemCount = 0
  local itemEnchantKey = itemMyWalletInfo:getEnchantKey()
  local itemSSW = itemMyWalletInfo:getItemEnchantStaticStatusWrapper()
  if nil ~= itemSSW then
    local isStackable = itemSSW:isStackable()
    if false == isStackable then
      InputMRUp_MarketWallet_Withdraw(1, itemEnchantKey)
      return
    else
      itemCount = itemMyWalletInfo:getItemCount()
    end
  end
  Panel_NumberPad_Show(true, itemCount, itemEnchantKey, InputMRUp_MarketWallet_Withdraw)
end
function InputMRUp_MarketWallet_Register(inputNumber, slotNo)
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  local fromWhereType = CppEnums.ItemWhereType.eInventory
  if self._ui.btn_Radio_WareHouse:IsCheck() and slotNo == self._moneySlot then
    fromWhereType = CppEnums.ItemWhereType.eWarehouse
  end
  requestMoveItemInventoryToWallet(fromWhereType, slotNo, inputNumber, FGlobal_ItemMarket_IsOpenByMaid())
end
function InputMRUp_MarketWallet_Withdraw(inputNumber, itemEnchantKey)
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  local fromWhereType = CppEnums.ItemWhereType.eInventory
  if self._ui.btn_Radio_WareHouse:IsCheck() then
    fromWhereType = CppEnums.ItemWhereType.eWarehouse
  end
  requestMoveItemWalletToInventory(itemEnchantKey, inputNumber, fromWhereType)
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
  PaGlobalFunc_MarketPlace_UpdateWalletList()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self:updateWallet()
end
function FromClient_MarketPlace_RequestPush()
  PaGlobalFunc_MarketPlace_UpdateWalletInfo()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self:updateWallet()
  self:updateInventory()
  local msg = "\237\134\181\237\149\169\234\177\176\235\158\152\236\134\140\236\151\144 \236\149\132\236\157\180\237\133\156 \235\147\177\235\161\157\236\157\132 \236\153\132\235\163\140\237\150\136\236\138\181\235\139\136\235\139\164."
  Proc_ShowMessage_Ack(msg)
end
function FromClient_MarketPlace_RequestPop()
  PaGlobalFunc_MarketPlace_UpdateWalletInfo()
  local self = MarketWallet
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : MarketWallet")
    return
  end
  self:updateWallet()
  self:updateInventory()
  local msg = "\236\157\184\235\178\164\237\134\160\235\166\172\235\161\156 \236\149\132\236\157\180\237\133\156 \237\154\140\236\136\152\235\165\188 \236\153\132\235\163\140\237\150\136\236\138\181\235\139\136\235\139\164."
  Proc_ShowMessage_Ack(msg)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_MarketWallet_Init")
