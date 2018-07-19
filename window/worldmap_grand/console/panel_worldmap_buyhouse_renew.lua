local Window_WorldMap_BuyHouseInfo = {
  _ui = {
    _static_FilterBg = UI.getChildControl(Panel_Worldmap_HouseList, "Static_FilterBg"),
    _static_List2Bg = UI.getChildControl(Panel_Worldmap_HouseList, "Static_HouseListBg"),
    _purposeFilterList = {},
    _houseFilterList = {},
    _gradeFilterList = {},
    _gradeStar = {}
  },
  _houseFilterConfig = {
    _all = 0,
    _mine = 1,
    _buyPerpose = 2,
    _other = 3,
    _count = 4
  },
  _houseFilterStrConfig = {
    [0] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERRFILTER_ALL"),
    [1] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERFIILTER_MINE"),
    [2] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_USETYPEFILTER"),
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERFILTER_OTHER")
  },
  _purposeFilterTexture = "renewal/ui_icon/console_icon_worldmap_00.dds",
  _purposeFliterUVConfig = {
    [0] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [1] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [2] = {
      x1 = 1,
      y1 = 319,
      x2 = 28,
      y2 = 346
    },
    [3] = {
      x1 = 1,
      y1 = 347,
      x2 = 28,
      y2 = 374
    },
    [4] = {
      x1 = 225,
      y1 = 347,
      x2 = 252,
      y2 = 374
    },
    [5] = {
      x1 = 57,
      y1 = 347,
      x2 = 84,
      y2 = 374
    },
    [6] = {
      x1 = 197,
      y1 = 347,
      x2 = 224,
      y2 = 374
    },
    [7] = {
      x1 = 113,
      y1 = 347,
      x2 = 140,
      y2 = 374
    },
    [8] = {
      x1 = 225,
      y1 = 319,
      x2 = 252,
      y2 = 346
    },
    [9] = {
      x1 = 113,
      y1 = 319,
      x2 = 140,
      y2 = 346
    },
    [10] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [11] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [12] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [13] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [14] = {
      x1 = 141,
      y1 = 347,
      x2 = 168,
      y2 = 374
    },
    [15] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [16] = {
      x1 = 169,
      y1 = 347,
      x2 = 196,
      y2 = 374
    },
    [17] = {
      x1 = 281,
      y1 = 319,
      x2 = 308,
      y2 = 346
    },
    [18] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [19] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [20] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [21] = {
      x1 = 253,
      y1 = 319,
      x2 = 280,
      y2 = 346
    },
    [22] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    },
    [23] = {
      x1 = 29,
      y1 = 319,
      x2 = 56,
      y2 = 346
    }
  },
  _config = {_gradeCount = 5},
  _currentNodeInfo,
  _currentHouseFilterIndex = 0,
  _currentGradeFilterIndex = 0,
  _currentPurposeFilterIndex = 0,
  _currentPurposeFilterType = -1,
  _currnetHouseListIndex = 0,
  _houseListInfo = {}
}
function PaGlobalFunc_WorldMap_BuyHouse_SetCurrentNodeInfo(nodeInfo)
  local self = Window_WorldMap_BuyHouseInfo
  self._currentNodeInfo = nodeInfo
end
function Window_WorldMap_BuyHouseInfo:ClearPurposeFilter()
  for _, control in pairs(self._ui._purposeFilterList) do
    if nil ~= control then
      control._button:SetShow(false)
      UI.deleteControl(control._button)
      control._icon:SetShow(false)
      UI.deleteControl(control._icon)
    end
  end
  self._ui._purposeFilterList = {}
end
function Window_WorldMap_BuyHouseInfo:SetPurposeFilter()
  self._ui._purposeFilterList = {}
  local buttonControl = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_BUTTON, self._ui._static_PurposeBg, "button_Purpose_" .. 0)
  CopyBaseProperty(self._ui._purposeButtonTemplete, buttonControl)
  buttonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_BuyHouse_SelectPurposeFilter(-1)")
  local iconControl = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATICTEXT, buttonControl, "button_Purpose_" .. 0)
  CopyBaseProperty(self._ui._purposeIconTemplete, iconControl)
  iconControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERRFILTER_ALL"))
  buttonControl:SetPosY(buttonControl:GetPosY())
  buttonControl:SetShow(true)
  iconControl:SetShow(true)
  self._ui._purposeFilterList[0] = {}
  self._ui._purposeFilterList[0]._button = buttonControl
  self._ui._purposeFilterList[0]._icon = iconControl
  local count = ToClient_getTownReceipeList()
  for index = 1, count do
    local buttonControl = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_BUTTON, self._ui._static_PurposeBg, "button_Purpose_" .. index)
    CopyBaseProperty(self._ui._purposeButtonTemplete, buttonControl)
    buttonControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_BuyHouse_SelectPurposeFilter(" .. index .. ")")
    local iconControl = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATICTEXT, buttonControl, "button_Purpose_" .. index)
    CopyBaseProperty(self._ui._purposeIconTemplete, iconControl)
    iconControl:SetText(ToClient_getReceipeName(ToClient_getReceipeTypeByIndex(index - 1)))
    local houseType = ToClient_getGroupType(index - 1)
    iconControl:ChangeTextureInfoName(self._purposeFilterTexture)
    local x1, y1, x2, y2 = setTextureUV_Func(iconControl, self._purposeFliterUVConfig[houseType].x1, self._purposeFliterUVConfig[houseType].y1, self._purposeFliterUVConfig[houseType].x2, self._purposeFliterUVConfig[houseType].y2)
    iconControl:getBaseTexture():setUV(x1, y1, x2, y2)
    iconControl:setRenderTexture(iconControl:getBaseTexture())
    buttonControl:SetPosY(buttonControl:GetPosY() + buttonControl:GetSizeY() * index)
    buttonControl:SetShow(true)
    iconControl:SetShow(true)
    self._ui._purposeFilterList[index] = {}
    self._ui._purposeFilterList[index]._button = buttonControl
    self._ui._purposeFilterList[index]._icon = iconControl
  end
end
function PaGlobalFunc_WorldMap_BuyHouse_UpdateHouseList()
  local self = Window_WorldMap_BuyHouseInfo
  self:UpdateHouseList()
end
function Window_WorldMap_BuyHouseInfo:UpdateHouseList()
  self._currnetHouseListIndex = 0
  self._houseListInfo = {}
  self._ui._list2_HouseList:getElementManager():clearKey()
  self:SetFilterTitle()
  ToCleint_findHouseByFilter(self._currentHouseFilterIndex, self._currentPurposeFilterType, self._currentGradeFilterIndex + 1)
end
function Window_WorldMap_BuyHouseInfo:InitControl()
  self._ui._static_HouseFilterBg = UI.getChildControl(self._ui._static_FilterBg, "Static_HouseFilterBg")
  self._ui._static_gradeBg = UI.getChildControl(self._ui._static_FilterBg, "Static_GradeBg")
  self._ui._static_PurposeBg = UI.getChildControl(self._ui._static_FilterBg, "Static_PurposeBg")
  self._ui._radioButton_HouseFilter = UI.getChildControl(self._ui._static_FilterBg, "RadioButton_HouseFilter")
  self._ui._radioButton_GradeFilter = UI.getChildControl(self._ui._static_FilterBg, "RadioButton_Grade")
  self._ui._gradeStar = {}
  for index = 0, self._config._gradeCount - 1 do
    self._ui._gradeStar[index] = UI.getChildControl(self._ui._radioButton_GradeFilter, "CheckButton_Star" .. index + 1)
  end
  self._ui._radioButton_PurposeFilter = UI.getChildControl(self._ui._static_FilterBg, "RadioButton_Purpose")
  self._ui._staticText_PurposeFilter = UI.getChildControl(self._ui._radioButton_PurposeFilter, "StaticText_Purpose")
  self._ui._purposeButtonTemplete = UI.getChildControl(self._ui._static_PurposeBg, "Button_Template")
  self._ui._purposeButtonTemplete:SetShow(false)
  self._ui._purposeIconTemplete = UI.getChildControl(self._ui._purposeButtonTemplete, "StaticText_Icon")
  self._ui._purposeIconTemplete:SetShow(false)
  self._ui._list2_HouseList = UI.getChildControl(self._ui._static_List2Bg, "List2_Title_List")
  self._ui._houseFilterList = {}
  for index = 0, self._houseFilterConfig._count - 1 do
    self._ui._houseFilterList[index] = {}
    self._ui._houseFilterList[index]._button = UI.getChildControl(self._ui._static_HouseFilterBg, "Button_" .. index + 1)
    self._ui._houseFilterList[index]._icon = UI.getChildControl(self._ui._houseFilterList[index]._button, "StaticText_Icon")
    self._ui._houseFilterList[index]._icon:SetText(self._houseFilterStrConfig[index])
  end
  self._ui._gradeFilterList = {}
  for index = 0, self._config._gradeCount - 1 do
    self._ui._gradeFilterList[index] = UI.getChildControl(self._ui._static_gradeBg, "Button_" .. index + 1)
  end
end
function Window_WorldMap_BuyHouseInfo:InitEvent()
  self._ui._radioButton_HouseFilter:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_BuyHouse_OpenFilter(0)")
  self._ui._radioButton_GradeFilter:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_BuyHouse_OpenFilter(1)")
  self._ui._radioButton_PurposeFilter:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_BuyHouse_OpenFilter(2)")
  for index = 0, self._houseFilterConfig._count - 1 do
    self._ui._houseFilterList[index]._button:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_BuyHouse_SelectHouseFilter(" .. index .. ")")
  end
  for index = 0, self._config._gradeCount - 1 do
    self._ui._gradeFilterList[index]:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_BuyHouse_SelectGradeFilter(" .. index .. ")")
  end
  self._ui._list2_HouseList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_WorldMap_BuyHouse_List2EventControlCreate")
  self._ui._list2_HouseList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
end
function Window_WorldMap_BuyHouseInfo:InitRegister()
  registerEvent("FromClient_SetTownMode", "PaGlobalFunc_FromClient_WorldMap_BuyHouse_HouseNaviShow")
  registerEvent("FromClient_HouseFilterOn", "PaGlobalFunc_FromClient_WorldMap_BuyHouse_HouseFilterOn")
  registerEvent("FromClient_RefreshHouseList", "PaGlobalFunc_FromClient_WorldMap_BuyHouse_RefreshHouseList")
end
function Window_WorldMap_BuyHouseInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function Window_WorldMap_BuyHouseInfo:SetFilterTitle()
  self._ui._radioButton_HouseFilter:SetText(self._houseFilterStrConfig[self._currentHouseFilterIndex])
  for index = 0, self._config._gradeCount - 1 do
    self._ui._gradeStar[index]:SetCheck(index <= self._currentGradeFilterIndex)
  end
  if 0 == self._currentPurposeFilterIndex then
    self._ui._staticText_PurposeFilter:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERRFILTER_ALL"))
  else
    self._ui._staticText_PurposeFilter:SetText(ToClient_getReceipeName(ToClient_getReceipeTypeByIndex(self._currentPurposeFilterIndex - 1)))
  end
end
function PaGlobalFunc_WorldMap_BuyHouse_SelectHouseFilter(index)
  local self = Window_WorldMap_BuyHouseInfo
  self._currentHouseFilterIndex = index
  self:UpdateHouseList()
end
function PaGlobalFunc_WorldMap_BuyHouse_SelectGradeFilter(gradeValue)
  local self = Window_WorldMap_BuyHouseInfo
  self._currentGradeFilterIndex = gradeValue
  self:UpdateHouseList()
end
function PaGlobalFunc_WorldMap_BuyHouse_SelectPurposeFilter(index)
  local self = Window_WorldMap_BuyHouseInfo
  self._currentPurposeFilterIndex = index
  self._currentPurposeFilterType = ToClient_getReceipeTypeByIndex(index - 1)
  self:UpdateHouseList()
end
function PaGlobalFunc_WorldMap_BuyHouse_OpenFilter(index)
  local self = Window_WorldMap_BuyHouseInfo
  self._ui._static_HouseFilterBg:SetShow(false)
  self._ui._static_gradeBg:SetShow(false)
  self._ui._static_PurposeBg:SetShow(false)
  if 0 == index then
    self._ui._static_HouseFilterBg:SetShow(true)
  elseif 1 == index then
    self._ui._static_gradeBg:SetShow(true)
  elseif 2 == index then
    self._ui._static_PurposeBg:SetShow(true)
  end
end
function PaGlobalFunc_FromClient_WorldMap_BuyHouse_HouseNaviShow(isShow)
  local self = Window_WorldMap_BuyHouseInfo
  self:ClearPurposeFilter()
  self:SetPurposeFilter()
end
function PaGlobalFunc_WorldMap_BuyHouse_HouseSort(w1, w2)
  if nil == w2 then
    return true
  end
  if w1._name < w2._name then
    return true
  end
end
function PaGlobalFunc_FromClient_WorldMap_BuyHouse_RefreshHouseList()
  local self = Window_WorldMap_BuyHouseInfo
  self._currnetHouseListIndex = 0
  self._houseListInfo = {}
  self._ui._list2_HouseList:getElementManager():clearKey()
end
function PaGlobalFunc_FromClient_WorldMap_BuyHouse_HouseFilterOn(houseBtn)
  local self = Window_WorldMap_BuyHouseInfo
  if false == PaGlobalFunc_WorldMap_BuyHouse_GetShow() then
    return
  end
  local houseInClientWrapper = houseBtn:FromClient_getStaticStatus()
  local houseInfoSS = houseInClientWrapper:get()
  local houseInfo = {
    _button = houseBtn,
    _houseInClientWrapper = houseInClientWrapper,
    _name = houseInClientWrapper:getName(),
    _houseKey = houseInClientWrapper:getHouseKey(),
    _screenShotPath = ToClient_getScreenShotPath(houseInfoSS, 0),
    _isSalable = houseInClientWrapper:isSalable(),
    _isPurchasable = houseInClientWrapper:isPurchasable(),
    _needExplorePoint = houseInClientWrapper:getNeedExplorePoint(),
    _isSet = houseInClientWrapper:isSet(),
    _receipeCount = houseInClientWrapper:getReceipeCount()
  }
  self._houseListInfo[self._currnetHouseListIndex] = houseInfo
  table.sort(self._houseListInfo, PaGlobalFunc_WorldMap_BuyHouse_HouseSort)
  self._ui._list2_HouseList:getElementManager():pushKey(toInt64(0, self._currnetHouseListIndex))
  self._ui._list2_HouseList:requestUpdateByKey(toInt64(0, self._currnetHouseListIndex))
  self._currnetHouseListIndex = self._currnetHouseListIndex + 1
end
function PaGlobalFunc_WorldMap_BuyHouse_SelectHouseList(index)
  local self = Window_WorldMap_BuyHouseInfo
  local houseInfo = self._houseListInfo[index]
  if nil == houseInfo then
    return
  end
  PaGlobalFunc_WorldMapHouseCraft_Open(houseInfo._button:FromClient_getStaticStatus())
end
function PaGlobalFunc_WorldMap_BuyHouse_List2EventControlCreate(list_content, key)
  local self = Window_WorldMap_BuyHouseInfo
  local id = Int64toInt32(key)
  local houseInfo = self._houseListInfo[id]
  if nil == houseInfo then
    return
  end
  local staticText_Name = UI.getChildControl(list_content, "StaticText_BoughtHouseAdress")
  local button = UI.getChildControl(list_content, "Button_HouseList")
  local icon = UI.getChildControl(list_content, "Static_HouseTypeIcon")
  local staticText_grade = UI.getChildControl(list_content, "StaticText_Grade")
  button:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_BuyHouse_SelectHouseList(" .. id .. ")")
  staticText_Name:SetText(houseInfo._name)
  local rentHouse = ToClient_GetRentHouseWrapper(houseInfo._houseKey)
  local houseType = 0
  if nil ~= rentHouse and true == rentHouse:isSet() then
    houseType = rentHouse:getHouseUseType()
    local houseInfoSSWrapper = houseInfo._houseInClientWrapper
    local maxLevel = rentHouse:getMaxLevel()
    local currentLevel = rentHouse:getLevel()
    staticText_grade:SetText(currentLevel .. " / " .. maxLevel)
    icon:ChangeTextureInfoName(self._purposeFilterTexture)
    local x1, y1, x2, y2 = setTextureUV_Func(icon, self._purposeFliterUVConfig[houseType].x1, self._purposeFliterUVConfig[houseType].y1, self._purposeFliterUVConfig[houseType].x2, self._purposeFliterUVConfig[houseType].y2)
    icon:getBaseTexture():setUV(x1, y1, x2, y2)
    icon:setRenderTexture(icon:getBaseTexture())
    icon:SetShow(true)
    staticText_grade:SetShow(true)
  else
    icon:SetShow(false)
    staticText_grade:SetShow(false)
  end
end
function PaGlobalFunc_WorldMap_BuyHouse_GetShow()
  return Panel_Worldmap_HouseList:GetShow()
end
function PaGlobalFunc_WorldMap_BuyHouse_SetShow(isShow, isAni)
  Panel_Worldmap_HouseList:SetShow(isShow, isAni)
end
function PaGlobalFunc_WorldMap_BuyHouse_Open()
  local self = Window_WorldMap_BuyHouseInfo
  if true == PaGlobalFunc_WorldMap_BuyHouse_GetShow() then
    return
  end
  PaGlobalFunc_WorldMap_TopMenu_Close()
  PaGlobalFunc_WorldMap_BottomMenu_Close()
  PaGlobalFunc_WorldMap_RightMenu_Close()
  PaGlobalFunc_WorldMap_BuyHouse_SetShow(true, false)
  self._currentHouseFilterIndex = 0
  self._currentPurposeFilterType = -1
  self._currentGradeFilterIndex = 0
  self:UpdateHouseList()
end
function PaGlobalFunc_WorldMap_BuyHouse_Close()
  local self = Window_WorldMap_BuyHouseInfo
  if false == PaGlobalFunc_WorldMap_BuyHouse_GetShow() then
    return
  end
  if true == PaGlobalFunc_WorldMapHouseCraft_IsShow() then
    PaGlobalFunc_WorldMapHouseCraft_Close()
    return
  end
  if true == self._ui._static_HouseFilterBg:GetShow() then
    self._ui._static_HouseFilterBg:SetShow(false)
    return
  end
  if true == self._ui._static_gradeBg:GetShow() then
    self._ui._static_gradeBg:SetShow(false)
    return
  end
  if true == self._ui._static_PurposeBg:GetShow() then
    self._ui._static_PurposeBg:SetShow(false)
    return
  end
  PaGlobalFunc_WorldMap_TopMenu_Open()
  PaGlobalFunc_WorldMap_BottomMenu_Open()
  PaGlobalFunc_WorldMap_RingMenu_Open()
  PaGlobalFunc_WorldMap_BuyHouse_SetShow(false, false)
end
function PaGlobalFunc_FromClient_WorldMap_BuyHouse_luaLoadComplete()
  local self = Window_WorldMap_BuyHouseInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_WorldMap_BuyHouse_luaLoadComplete")
