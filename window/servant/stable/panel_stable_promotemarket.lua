local ServantRentPromoteMarket = {
  _init = false,
  _panel = Panel_Stable_PromoteMarket,
  _isFromNpcFlag = true,
  _slotTable = {},
  _slotCount = 4,
  _showAllListFlag = true,
  _useInventoryMoneyFlag = false,
  _ui = {}
}
local Slot = {}
Slot.__index = Slot
function Slot.new(index, control)
  _PA_LOG("cylee", "Slot.new() index:" .. index .. ", control:" .. tostring(control))
  local slot = {}
  setmetatable(slot, Slot)
  slot._index = index
  slot._control = control
  slot._ui = {
    icon = UI.getChildControl(control, "Static_Icon"),
    cancelButton = UI.getChildControl(control, "Button_Cancel"),
    buyButton = UI.getChildControl(control, "Button_Buy"),
    receiveButton = UI.getChildControl(control, "Button_Receive"),
    baseInfo = UI.getChildControl(control, "StaticText_BaseInfo"),
    skillInfo = UI.getChildControl(control, "StaticText_HaveSkill")
  }
  return slot
end
function Slot:clearXXX()
  _PA_LOG("cylee", "Slot:clearXXX()")
end
function Slot:show(info)
  _PA_LOG("cylee", "Slot:show() info:" .. tostring(info))
  local showFlag = nil ~= info
  self._control:SetShow(showFlag)
  if showFlag then
    self._ui.icon:ChangeTextureInfoName(info:getIconPath1())
    self._ui.baseInfo:SetText(info:getName())
    self._ui.icon:SetShow(true)
    self._ui.baseInfo:SetShow(true)
    self._ui.skillInfo:SetShow(false)
    self._ui.buyButton:SetShow(false)
    self._ui.receiveButton:SetShow(false)
    self._ui.cancelButton:SetShow(false)
  end
end
function ServantRentPromoteMarket:initialize()
  _PA_LOG("cylee", "ServantRentPromoteMarket:initialize()")
  if self._init then
    return
  end
  self._init = true
  local closeButton = UI.getChildControl(self._panel, "Button_Close")
  closeButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ServantRentPromoteMarketClose()")
  local menuGroup = UI.getChildControl(self._panel, "Static_MenuBtnBG")
  local showAllListRadioButton = UI.getChildControl(menuGroup, "RadioButton_List")
  local showMyListRadioButton = UI.getChildControl(menuGroup, "RadioButton_ListMy")
  showAllListRadioButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ServantRentPromoteMarketShowAllList(true)")
  showMyListRadioButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ServantRentPromoteMarketShowAllList(false)")
  local refreshButton = UI.getChildControl(menuGroup, "RadioButton_Reload")
  refreshButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ServantRentPromoteMarketRefresh()")
  local useInventoryMoneyRadioButton = UI.getChildControl(self._panel, "RadioButton_Icon_Money")
  local useWarehouseMoneyRadioButton = UI.getChildControl(self._panel, "RadioButton_Icon_Money2")
  useInventoryMoneyRadioButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ServantRentPromoteMarketUseInventoryMoney(true)")
  useWarehouseMoneyRadioButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ServantRentPromoteMarketUseInventoryMoney(false)")
  local inventoryMoney = UI.getChildControl(self._panel, "Static_Text_Money")
  local warehouseMoney = UI.getChildControl(self._panel, "Static_Text_Money2")
  local prevButton = UI.getChildControl(self._panel, "Button_Prev")
  local nextButton = UI.getChildControl(self._panel, "Button_Next")
  prevButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ServantRentPromoteMarketPageDown()")
  nextButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ServantRentPromoteMarketPageUp()")
  local page = UI.getChildControl(self._panel, "Static_PageNo")
  local slotTemplate = UI.getChildControl(self._panel, "Static_Slot")
  slotTemplate:SetShow(false)
  for i = 1, self._slotCount do
    local control = UI.cloneControl(slotTemplate, self._panel, "Static_Slot" .. i)
    control:SetPosY(slotTemplate:GetPosY() + slotTemplate:GetSizeY() * (i - 1))
    local slot = Slot.new(i, control)
    table.insert(self._slotTable, slot)
  end
  self._ui.showAllListRadioButton = showAllListRadioButton
  self._ui.showMyListRadioButton = showMyListRadioButton
  self._ui.useInventoryMoneyRadioButton = useInventoryMoneyRadioButton
  self._ui.useWarehouseMoneyRadioButton = useWarehouseMoneyRadioButton
  self._ui.inventoryMoney = inventoryMoney
  self._ui.warehouseMoney = warehouseMoney
  self._ui.prevButton = prevButton
  self._ui.nextButton = nextButton
  self._ui.page = page
  registerEvent("FromClient_AuctionServantList", "PaGlobalFunc_ServantRentPromoteMarketUpdate")
  registerEvent("FromClient_InventoryUpdate", "PaGlobalFunc_ServantRentPromoteMarketUpdate")
  registerEvent("EventWarehouseUpdate", "PaGlobalFunc_ServantRentPromoteMarketUpdate")
end
function PaGlobalFunc_ServantRentPromoteMarketInit()
  return ServantRentPromoteMarket:initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_ServantRentPromoteMarketInit")
function ServantRentPromoteMarket:ShowAllList(flag)
  _PA_LOG("cylee", "ServantRentPromoteMarket:ShowAllList() flag:" .. tostring(flag))
  self._showAllListFlag = true or flag
  return true
end
function PaGlobalFunc_ServantRentPromoteMarketShowAllList(flag)
  if ServantRentPromoteMarket:ShowAllList(flag) then
    return ServantRentPromoteMarket:update()
  end
end
function ServantRentPromoteMarket:refresh()
  _PA_LOG("cylee", "ServantRentPromoteMarket:refresh()")
  RequestActionReloadPage(0, self._isFromNpc)
end
function PaGlobalFunc_ServantRentPromoteMarketRefresh()
  if ServantRentPromoteMarket:refresh() then
    return ServantRentPromoteMarket:update()
  end
end
function ServantRentPromoteMarket:useInventoryMoney(flag)
  _PA_LOG("cylee", "ServantRentPromoteMarket:useInventoryMoney() flag:" .. tostring(flag))
  self._useInventoryMoneyFlag = flag
  return true
end
function PaGlobalFunc_ServantRentPromoteMarketUseInventoryMoney(flag)
  if ServantRentPromoteMarket:useInventoryMoney(flag) then
    return ServantRentPromoteMarket:update()
  end
end
function ServantRentPromoteMarket:checkShow()
  return self._panel:GetShow()
end
function PaGlobalFunc_ServantRentPromoteMarketCheckShow()
  return ServantRentPromoteMarket:checkShow()
end
function ServantRentPromoteMarket:open()
  _PA_LOG("cylee", "ServantRentPromoteMarket:open()")
  if self:checkShow() then
    return false
  end
  StableMating_Close()
  StableMix_Close()
  warehouse_requestInfoFromNpc()
  local isFromNpcFlag = not ToClient_WorldMapIsShow()
  requestServantRentList(isFromNpcFlag)
  self._isFromNpcFlag = isFromNpcFlag
  self._panel:SetPosX(getScreenSizeX() / 2 - self._panel:GetSizeX() / 2)
  self._panel:SetPosY(getScreenSizeY() / 2 - self._panel:GetSizeY() / 2 - 20)
  self._panel:SetShow(true)
  return true
end
function PaGlobalFunc_ServantRentPromoteMarketOpen()
  if ServantRentPromoteMarket:open() then
    ServantRentPromoteMarket:update()
  end
end
function ServantRentPromoteMarket:initPage()
  _PA_LOG("cylee", "ServantRentPromoteMarket:initPage()")
  RequestActionReloadPage(0, self._isFromNpc)
end
function PaGlobalFunc_ServantRentPromoteMarketPageDown()
  return ServantRentPromoteMarket:initPage()
end
function ServantRentPromoteMarket:pageDown()
  _PA_LOG("cylee", "ServantRentPromoteMarket:pageDown()")
  RequestAuctionPrevPage(0, self._isFromNpc)
end
function PaGlobalFunc_ServantRentPromoteMarketPageDown()
  return ServantRentPromoteMarket:pageDown()
end
function ServantRentPromoteMarket:pageUp()
  _PA_LOG("cylee", "ServantRentPromoteMarket:pageUp()")
  RequestAuctionNextPage(0, self._isFromNpc)
end
function PaGlobalFunc_ServantRentPromoteMarketPageUp()
  return ServantRentPromoteMarket:pageUp()
end
function ServantRentPromoteMarket:update()
  _PA_LOG("cylee", "ServantRentPromoteMarket:update()")
  if not self._init or not self:checkShow() then
    return
  end
  self._ui.showAllListRadioButton:SetCheck(self._showAllListFlag)
  self._ui.showMyListRadioButton:SetCheck(not self._showAllListFlag)
  _PA_LOG("cylee", "ServantRentPromoteMarket:update() showAllListFlag:" .. tostring(self._showAllListFlag))
  self._ui.inventoryMoney:SetText(makeDotMoney(getSelfPlayer():get():getInventory():getMoney_s64()))
  local warehouseMoney = warehouse_moneyFromNpcShop_s64()
  self._ui.warehouseMoney:SetText(makeDotMoney(warehouseMoney))
  local warehouseMoneyEnabledFlag = warehouseMoney > Defines.s64_const.s64_0
  if not warehouseMoneyEnabledFlag then
    self._useInventoryMoneyFlag = true
  end
  self._ui.useInventoryMoneyRadioButton:SetCheck(self._useInventoryMoneyFlag)
  self._ui.useWarehouseMoneyRadioButton:SetCheck(not self._useInventoryMoneyFlag)
  local auctionInfo = RequestGetAuctionInfo()
  _PA_LOG("cylee", "ServantRentPromoteMarket:update() listCount:" .. auctionInfo:getServantAuctionListCount())
  local curPage = auctionInfo:getCurrentPage() + 1
  local minPage = 1
  local maxPage = math.ceil(auctionInfo:getServantAuctionListCount() / self._slotCount)
  self._ui.prevButton:SetEnable(curPage > minPage)
  self._ui.nextButton:SetEnable(curPage < maxPage)
  self._ui.page:SetText(curPage)
  for i = 1, table.getn(self._slotTable) do
    local slot = self._slotTable[i]
    if slot then
      local info = auctionInfo:getServantAuctionListAt(auctionInfo:getCurrentPage() * self._slotCount + (i - 1))
      slot:show(info)
    end
  end
end
function PaGlobalFunc_ServantRentPromoteMarketUpdate()
  return ServantRentPromoteMarket:update()
end
function ServantRentPromoteMarket:close()
  _PA_LOG("cylee", "ServantRentPromoteMarket:close()")
  if self:checkShow() then
    self._panel:SetShow(false)
  end
end
function PaGlobalFunc_ServantRentPromoteMarketClose()
  return ServantRentPromoteMarket:close()
end
