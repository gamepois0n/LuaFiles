local pearlShopCategory = {
  _init = false,
  _panel = Panel_Pearlshop_Category,
  _ui = {
    _mainCategoryGroupControl = nil,
    _mainCategoryControlList = {},
    _mainCategoryControlListSize = getCashMainCategorySize(),
    _subCategoryGroupControl = nil,
    _subCategoryControlList = {},
    _subCategoryControlListSize = 30,
    _pearlControl = nil
  },
  _mainCategoryGapY = 10,
  _selectedMainCategoryIndex = -1,
  _selectedSubCategoryIndex = -1,
  _promitionWeb = nil
}
function pearlShopCategory:initMainCategory()
  local group = UI.getChildControl(self._panel, "Static_MainMenuGroup")
  self._ui._mainCategoryGroupControl = group
  local template = UI.getChildControl(group, "Static_MainMenu")
  template:SetShow(false)
  for i = 0, self._ui._mainCategoryControlListSize - 1 do
    local control = UI.cloneControl(template, group, "Static_MainMenu" .. i)
    self._ui._mainCategoryControlList[i] = control
    control:SetPosY(template:GetPosY() + (template:GetSizeY() + self._mainCategoryGapY) * i)
    control:SetShow(true)
    local buttonControl = UI.getChildControl(control, "RadioButton_MainMenu_Category")
    buttonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopCategorySelectMainCategory(" .. i .. ")")
    buttonControl:addInputEvent("Mouse_On", "PaGlobalFunc_PearlShopCategoryFocusMainCategory(" .. i .. ")")
    local info = ToClient_GetMainCategoryStaticStatusWrapperByKeyRaw(i + 1)
    local title = getCashCategoryName(info:getNoRaw(), CppEnums.CashProductCategoryNo_Undefined)
    buttonControl:SetText(title)
  end
end
function pearlShopCategory:initSubCategory()
  local group = UI.getChildControl(self._panel, "Static_SubMenuGroup")
  self._ui._subCategoryGroupControl = group
  local template = UI.getChildControl(group, "Static_SubMenu")
  template:SetShow(false)
  for i = 0, self._ui._subCategoryControlListSize - 1 do
    local control = UI.cloneControl(template, group, "Static_SubMenu" .. i)
    self._ui._subCategoryControlList[i] = control
    control:SetPosY(template:GetPosY() + (template:GetSizeY() + self._mainCategoryGapY) * i)
    local buttonControl = UI.getChildControl(control, "RadioButton_SubMenu_Category")
    buttonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopCategorySelectSubCategory(" .. i .. ")")
    buttonControl:addInputEvent("Mouse_On", "PaGlobalFunc_PearlShopCategoryFocusSubCategory(" .. i .. ")")
  end
end
function pearlShopCategory:getPromotionUrl()
  if isServerFixedCharge() then
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_P2P")
  end
  if isGameTypeKorea() then
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL")
  elseif isGameTypeTaiwan() then
    if CppEnums.CountryType.TW_ALPHA == getGameServiceType() then
      return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TW_ALPHA")
    elseif CppEnums.CountryType.TW_REAL == getGameServiceType() then
      return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TW")
    end
  elseif isGameTypeKR2() then
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_KR2")
  elseif CppEnums.CountryType.SA_ALPHA == getGameServiceType() then
    return PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_SA_ALPHA", "lang", SALangType)
  elseif CppEnums.CountryType.SA_REAL == getGameServiceType() then
    return PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_SA", "lang", SALangType)
  elseif CppEnums.CountryType.TR_ALPHA == getGameServiceType() then
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TR_ALPHA")
  elseif CppEnums.CountryType.TR_REAL == getGameServiceType() then
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TR")
  elseif CppEnums.CountryType.TH_ALPHA == getGameServiceType() then
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TH_ALPHA")
  elseif CppEnums.CountryType.TH_REAL == getGameServiceType() then
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_TH")
  elseif CppEnums.CountryType.ID_ALPHA == getGameServiceType() then
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_ID_ALPHA")
  elseif CppEnums.CountryType.ID_REAL == getGameServiceType() then
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL_ID")
  else
    return PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_BUYORGIFT_URL_PROMOTIONURL")
  end
end
function pearlShopCategory:initialize()
  if self._init then
    return
  end
  self._init = true
  self:initMainCategory()
  self:initSubCategory()
  local bottomControl = UI.getChildControl(self._panel, "Static_BottomBg")
  local pearlBgControl = UI.getChildControl(bottomControl, "Static_MoneyType2BG")
  self._ui._pearlControl = UI.getChildControl(pearlBgControl, "StaticText_MoneyType_Price1")
  local bannerControl = UI.getChildControl(self._panel, "Static_RightBannerBg")
  bannerControl:SetShow(false)
  self._panel:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_PearlShopCategoryRefresh()")
  registerEvent("FromClient_UpdateCashShop", "PaGlobalFunc_PearlShopCategoryUpdate")
  registerEvent("FromClient_UpdateCash", "PaGlobalFunc_PearlShopCategoryUpdate")
  registerEvent("FromClient_InventoryUpdate", "PaGlobalFunc_PearlShopCategoryUpdate")
end
function PaGlobalFunc_PearlShopCategoryCheckShow()
  return pearlShopCategory:checkShow()
end
function pearlShopCategory:checkShow()
  return self._panel:GetShow()
end
function PaGlobalFunc_PearlShopCategoryBack()
  pearlShopCategory:back()
end
function pearlShopCategory:back()
  self:close()
  InGameShop_Close()
end
function PaGlobalFunc_PearlShopCategoryFocusMainCategory(index)
  pearlShopCategory:focusMainCategory(index)
end
function pearlShopCategory:focusMainCategory(index)
  self._selectedMainCategoryIndex = index
  self._selectedSubCategoryIndex = -1
  self:update()
end
function PaGlobalFunc_PearlShopCategorySelectMainCategory(index)
  pearlShopCategory:selectMainCategory(index)
end
function pearlShopCategory:selectMainCategory(index)
  if not self:checkValidMainCategory(index) then
    return
  end
  if 0 < getCashMiddleCategorySize(index + 1) then
    return
  end
  self:gotoNextStep()
end
function pearlShopCategory:checkValidMainCategory(index)
  return index >= 0 and index < getCashMainCategorySize()
end
function PaGlobalFunc_PearlShopCategoryFocusSubCategory(index)
  pearlShopCategory:focusSubCategory(index)
end
function pearlShopCategory:focusSubCategory(index)
  self._selectedSubCategoryIndex = index
  self:update()
end
function PaGlobalFunc_PearlShopCategorySelectSubCategory(selectedIndex)
  pearlShopCategory:selectSubCategory(selectedIndex)
end
function pearlShopCategory:checkValidSubCategory(subCategoryIndex)
  if not self:checkValidMainCategory(self._selectedMainCategoryIndex) then
    return false
  end
  local mainCategoryInfo = ToClient_GetMainCategoryStaticStatusWrapperByKeyRaw(self._selectedMainCategoryIndex + 1)
  if not mainCategoryInfo then
    return false
  end
  return subCategoryIndex >= 0 and subCategoryIndex < getCashMiddleCategorySize(mainCategoryInfo:getNoRaw())
end
function pearlShopCategory:selectSubCategory(index)
  if not self:checkValidSubCategory(index) then
    return
  end
  self:gotoNextStep()
end
function pearlShopCategory:gotoNextStep()
  if not self:checkValidMainCategory(self._selectedMainCategoryIndex) then
    return
  end
  getIngameCashMall():setCurrentCategory(self._selectedMainCategoryIndex + 1)
  if self:checkValidSubCategory(self._selectedSubCategoryIndex) then
    getIngameCashMall():setCurrentSubTab(self._selectedSubCategoryIndex + 1)
  else
    getIngameCashMall():setCurrentSubTab(CppEnums.CashProductCategoryNo_Undefined)
  end
  if ToClient_isXBox() and 0 == self._selectedMainCategoryIndex then
    return ToClient_XboxShowStore()
  end
  PaGlobalFunc_PearlShopOpen()
  self:close()
end
function pearlShopCategory:getCurrentCategoryTitle()
  if self:checkValidSubCategory(self._selectedSubCategoryIndex) then
    return getCashCategoryName(self._selectedMainCategoryIndex + 1, self._selectedSubCategoryIndex + 1)
  end
  return getCashCategoryName(self._selectedMainCategoryIndex + 1, CppEnums.CashProductCategoryNo_Undefined)
end
function PaGlobalFunc_PearlShopCategoryGetCurrentCategoryTitle()
  return pearlShopCategory:getCurrentCategoryTitle()
end
function pearlShopCategory:updateMainCategory()
  for i = 0, self._ui._mainCategoryControlListSize - 1 do
    local control = self._ui._mainCategoryControlList[i]
    local selectControl = UI.getChildControl(control, "Static_SelectLine")
    local radioControl = UI.getChildControl(control, "RadioButton_MainMenu_Category")
    if i == self._selectedMainCategoryIndex then
      selectControl:SetShow(true)
      radioControl:SetFontColor(4293848814)
    else
      selectControl:SetShow(false)
      radioControl:SetFontColor(4287862695)
    end
  end
end
function pearlShopCategory:updateSubCategory()
  if not self:checkValidMainCategory(self._selectedMainCategoryIndex) then
    return
  end
  local mainInfo = ToClient_GetMainCategoryStaticStatusWrapperByKeyRaw(self._selectedMainCategoryIndex + 1)
  local subCategorySize = getCashMiddleCategorySize(mainInfo:getNoRaw())
  if subCategorySize > 0 then
    self._ui._subCategoryGroupControl:SetShow(true)
    for i = 0, self._ui._subCategoryControlListSize - 1 do
      local control = self._ui._subCategoryControlList[i]
      local showFlag = mainInfo and i < getCashMiddleCategorySize(mainInfo:getNoRaw())
      control:SetShow(showFlag)
      if showFlag then
        local buttonControl = UI.getChildControl(control, "RadioButton_SubMenu_Category")
        local title = getCashCategoryName(mainInfo:getNoRaw(), i + 1)
        buttonControl:SetText(title)
      end
    end
  else
    self._ui._subCategoryGroupControl:SetShow(false)
  end
end
function pearlShopCategory:update()
  if not self._init then
    return
  end
  self:updateMainCategory()
  self:updateSubCategory()
  self:updatePearl()
end
function PaGlobalFunc_PearlShopCategoryUpdate()
  return pearlShopCategory:update()
end
function pearlShopCategory:refresh()
  if ToClient_isXBox() then
    ToClient_CashShopResetCashFlag()
    cashShop_requestCash()
    return true
  end
  return false
end
function PaGlobalFunc_PearlShopCategoryRefresh()
  if pearlShopCategory:refresh() then
    return pearlShopCategory:update()
  end
end
function pearlShopCategory:updatePearl()
  local pearl = toInt64(0, 0)
  local pearlItem = getInventoryItemByType(CppEnums.ItemWhereType.eCashInventory, getPearlSlotNo())
  if pearlItem then
    pearl = pearlItem:get():getCount_s64()
  end
  self._ui._pearlControl:SetText(makeDotMoney(pearl))
end
function pearlShopCategory:open(initIndexFlag)
  if initIndexFlag then
    self._selectedMainCategoryIndex = 0
    self._selectedSubCategoryIndex = -1
  end
  if self:checkValidSubCategory(self._selectedSubCategoryIndex) then
    ToClient_padSnapSetTargetGroup(self._ui._subCategoryGroupControl)
  else
    ToClient_padSnapSetTargetGroup(self._ui._mainCategoryGroupControl)
  end
  getIngameCashMall():clearEquipViewList()
  getIngameCashMall():changeViewMyCharacter()
  getIngameCashMall():hide()
  getIngameCashMall():show()
  self:update()
  self._panel:SetShow(true)
end
function PaGlobalFunc_PearlShopCategoryOpen(initIndexFlag)
  pearlShopCategory:open(initIndexFlag)
end
function pearlShopCategory:close()
  self._panel:SetShow(false)
end
function PaGlobalFunc_PearlShopCategoryClose()
  pearlShopCategory:close()
end
function pearlShopCategory:changePlatformSpecKey()
end
function FromClient_PearlShopCategoryInit()
  pearlShopCategory:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_PearlShopCategoryInit")
