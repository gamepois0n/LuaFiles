local pearlShopCategory = {
  _init = false,
  _panel = Panel_Pearlshop_Category,
  _mainCategoryControlList = {},
  _mainCategoryControlListSize = 0,
  _subCategoryControlList = {},
  _subCategoryControlListSize = 0,
  _subCategoryPreDefinedSize = 30,
  _selectedMainCategoryIndex = -1,
  _selectedSubCategoryIndex = -1
}
function pearlShopCategory:initialize()
  _PA_LOG("cylee", "pearlShopCategory:initialize()")
  if self._init then
    return
  end
  self._init = true
  local mainCategoryControlTemplate = UI.getChildControl(self._panel, "Static_MainMenu")
  mainCategoryControlTemplate:SetShow(false)
  for i = 0, getCashMainCategorySize() - 1 do
    local info = ToClient_GetMainCategoryStaticStatusWrapperByKeyRaw(i + 1)
    local control = UI.cloneControl(mainCategoryControlTemplate, self._panel, "Static_MainMenu" .. i)
    self._mainCategoryControlList[i] = control
    self._mainCategoryControlListSize = self._mainCategoryControlListSize + 1
    control:SetPosY(mainCategoryControlTemplate:GetPosY() + mainCategoryControlTemplate:GetSizeY() * i + 200)
    control:SetShow(true)
    local buttonControl = UI.getChildControl(control, "RadioButton_MainMenu_Category")
    buttonControl:SetText(getCashCategoryName(info:getNoRaw(), CppEnums.CashProductCategoryNo_Undefined))
    buttonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopCategorySelectMainCategory(" .. i .. ")")
  end
  local subCategoryControlTemplate = UI.getChildControl(self._panel, "Static_SubMenu")
  subCategoryControlTemplate:SetShow(false)
  for i = 0, self._subCategoryPreDefinedSize do
    local control = UI.cloneControl(subCategoryControlTemplate, self._panel, "Static_SubMenu" .. i)
    self._subCategoryControlList[i] = control
    self._subCategoryControlListSize = self._subCategoryControlListSize + 1
    control:SetPosY(subCategoryControlTemplate:GetPosY() + subCategoryControlTemplate:GetSizeY() * i + 200)
    local buttonControl = UI.getChildControl(control, "RadioButton_SubMenu_Category")
    buttonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_PearlShopCategorySelectSubCategory(" .. i .. ")")
  end
end
function PaGlobalFunc_PearlShopCategorySelectMainCategory(selectedIndex)
  _PA_LOG("cylee", "PaGlobalFunc_PearlShopCategorySelectMainCategory() selectedIndex:" .. tostring(selectedIndex))
  pearlShopCategory:selectMainCategory(selectedIndex)
end
function pearlShopCategory:selectMainCategory(selectedIndex)
  _PA_LOG("cylee", "pearlShopCategory:selectMainCategory() selectedIndex:" .. tostring(selectedIndex))
  if self:checkValidMainCategory(selectedIndex) then
    self._selectedMainCategoryIndex = selectedIndex
    self:update()
  end
end
function pearlShopCategory:checkValidMainCategory(mainCategoryIndex)
  return mainCategoryIndex >= 0 and mainCategoryIndex < getCashMainCategorySize()
end
function PaGlobalFunc_PearlShopCategorySelectSubCategory(selectedIndex)
  _PA_LOG("cylee", "PaGlobalFunc_PearlShopCategorySelectSubCategory() selectedIndex:" .. tostring(selectedIndex))
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
function pearlShopCategory:selectSubCategory(selectedIndex)
  _PA_LOG("cylee", "pearlShopCategory:selectSubCategory() selectedIndex:" .. tostring(selectedIndex))
  if self:checkValidSubCategory(selectedIndex) then
    self._selectedSubCategoryIndex = selectedIndex
    getIngameCashMall():setCurrentCategory(self._selectedMainCategoryIndex + 1)
    getIngameCashMall():setCurrentSubTab(self._selectedSubCategoryIndex + 1)
    self:close()
    PaGlobalFunc_PearlShopOpen()
  end
end
function pearlShopCategory:update()
  _PA_LOG("cylee", "pearlShopCategory:update()")
  for i = 0, self._mainCategoryControlListSize - 1 do
    local mainCategoryControl = self._mainCategoryControlList[i]
    local selectControl = UI.getChildControl(mainCategoryControl, "Static_SelectLine")
    local radioControl = UI.getChildControl(mainCategoryControl, "RadioButton_MainMenu_Category")
    if i == self._selectedMainCategoryIndex then
      selectControl:SetShow(true)
      radioControl:SetFontColor(4293848814)
    else
      selectControl:SetShow(false)
      radioControl:SetFontColor(4287862695)
    end
  end
  local mainCategoryInfo = ToClient_GetMainCategoryStaticStatusWrapperByKeyRaw(self._selectedMainCategoryIndex + 1)
  for i = 0, self._subCategoryControlListSize - 1 do
    local subCategoryControl = self._subCategoryControlList[i]
    if mainCategoryInfo and i < getCashMiddleCategorySize(mainCategoryInfo:getNoRaw()) then
      local buttonControl = UI.getChildControl(subCategoryControl, "RadioButton_SubMenu_Category")
      local subCategoryTitle = getCashCategoryName(mainCategoryInfo:getNoRaw(), i + 1)
      buttonControl:SetText(subCategoryTitle)
      subCategoryControl:SetShow(true)
    else
      subCategoryControl:SetShow(false)
    end
  end
end
function pearlShopCategory:open()
  _PA_LOG("cylee", "pearlShopCategory:open()")
  self._selectedMainCategoryIndex = 0
  self._selectedSubCategoryIndex = -1
  self:update()
  self._panel:SetShow(true)
end
function PaGlobalFunc_PearlShopCategoryOpen()
  _PA_LOG("cylee", "PaGlobalFunc_PearlShopCategoryOpen()")
  pearlShopCategory:open()
end
function pearlShopCategory:close()
  _PA_LOG("cylee", "pearlShopCategory:close()")
  self._panel:SetShow(false)
end
function PaGlobalFunc_PearlShopCategoryClose()
  _PA_LOG("cylee", "PaGlobalFunc_PearlShopCategoryClose()")
  self._panel:SetShow(false)
end
function pearlShopCategory:changePlatformSpecKey()
  _PA_LOG("cylee", "pearlShopCategory:changePlatformSpecKey()")
end
function FromClient_PearlShopCategoryInit()
  _PA_LOG("cylee", "FromClient_PearlShopCategoryInit()")
  pearlShopCategory:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_PearlShopCategoryInit")
