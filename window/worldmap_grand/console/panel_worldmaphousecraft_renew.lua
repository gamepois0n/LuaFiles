local _panel = Panel_Worldmap_HouseCraft
local eHouseUseGroupType = CppEnums.eHouseUseType
local WorldMapHouseCraft = {
  _ui = {
    stc_BG = UI.getChildControl(_panel, "Static_BG_House"),
    txt_title = nil,
    stc_tipBG = nil,
    txt_tipIcon = nil,
    txt_tipDesc = nil,
    txt_selectTitle = nil,
    stc_typeBG = nil,
    frame_houseType = nil,
    stc_houseTypeContentBG = nil,
    rdo_houseTypeTemplate = nil,
    rdo_houseTypes = nil,
    stc_stars = nil,
    txt_detailTitle = nil,
    stc_line = nil,
    txt_descriptions = nil,
    stc_itemSlotBG = nil,
    stc_detailBG = nil,
    scroll_detailList = nil,
    itemSlots = {},
    txt_manage = nil,
    stc_manageBG = nil,
    txt_manageTitle = nil,
    stc_normalBG = nil,
    txt_normalNeedPoint = nil,
    txt_normalNeedPointVal = nil,
    txt_normalMyPoint = nil,
    txt_normalMyPointVal = nil,
    txt_normalTimeCost = nil,
    txt_normalTimeCostVal = nil,
    txt_normalSilverCost = nil,
    txt_normalSilverCostVal = nil,
    txt_normalMySilver = nil,
    txt_normalMySilverVal = nil,
    btn_upgradeOrChange = nil,
    stc_processingBG = nil,
    txt_processingTimeLeft = nil,
    txt_processingTimeLeftVal = nil,
    txt_processingProgress = nil,
    txt_processingProgressVal = nil,
    progress_bar = nil,
    txt_houseImage = nil,
    chk_buyOrSell = nil
  },
  _houseInfoSSWrapper = nil,
  _houseInfoSS = nil,
  _houseKey = nil,
  _isUsable = nil,
  _feature1 = nil,
  _feature2 = nil,
  _screenShotPath = nil,
  _isSalable = nil,
  _isPurchasable = nil,
  _needExplorePoint = nil,
  _isSet = nil,
  _receipeCount = nil,
  _houseName = nil,
  _needTime = nil,
  _selected = nil,
  _useTypeData = {},
  _isProcessing = nil,
  _rentedLevel = nil,
  _rentedUseType = nil,
  _isRentedHouse = nil,
  _starCountMax = 5,
  _houseTypeMax = 8,
  _listDefaultYGap = 37,
  _listStartY = 4,
  _detailListData = {},
  _detailListScrollAmount = 0,
  _detailListRowMax = 3,
  _receipeIconColumnMax = 6,
  _receipeIconCountMax = 18,
  _receipeIconDefaultGap = 50
}
local _slotOption = {createIcon = true, createBorder = true}
local _starUV = {
  full = {
    248,
    24,
    269,
    45
  },
  empty = {
    248,
    2,
    269,
    23
  }
}
function FromClient_luaLoadComplete_WorldMapHouseCraft()
  WorldMapHouseCraft:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_WorldMapHouseCraft")
function WorldMapHouseCraft:initialize()
  self._ui.txt_title = UI.getChildControl(self._ui.stc_BG, "StaticText_Title")
  self._ui.stc_tipBG = UI.getChildControl(self._ui.stc_BG, "Static_Tip")
  self._ui.txt_tipIcon = UI.getChildControl(self._ui.stc_tipBG, "StaticText_Icon")
  self._ui.txt_tipDesc = UI.getChildControl(self._ui.stc_tipBG, "StaticText_Desc")
  self._ui.txt_tipDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_tipDesc:SetText(self._ui.txt_tipDesc:GetText())
  self._ui.txt_selectTitle = UI.getChildControl(self._ui.stc_BG, "txt_selectTitle")
  self._ui.stc_typeBG = UI.getChildControl(self._ui.stc_BG, "Static_Type")
  self._ui.frame_houseType = UI.getChildControl(self._ui.stc_typeBG, "Frame_HouseType")
  local frameContent = self._ui.frame_houseType:GetFrameContent()
  self._ui.stc_houseTypeContentBG = UI.getChildControl(frameContent, "Static_ContentBG")
  self._ui.rdo_houseTypes = {}
  for ii = 1, self._houseTypeMax do
    self._ui.rdo_houseTypes[ii] = UI.getChildControl(frameContent, "RadioButton_Content_" .. ii)
    self._ui.rdo_houseTypes[ii]:SetPosY(self._listStartY + (ii - 1) * self._listDefaultYGap)
    self._ui.rdo_houseTypes[ii]:addInputEvent("Mouse_LUp", "Input_WorldMapHouseCraft_SetUseType(" .. ii .. ")")
    self._ui.rdo_houseTypes[ii]:SetShow(false)
  end
  self._ui.stc_stars = {}
  for ii = 1, self._houseTypeMax do
    self._ui.stc_stars[ii] = {}
    for jj = 1, self._starCountMax do
      self._ui.stc_stars[ii][jj] = UI.getChildControl(self._ui.rdo_houseTypes[ii], "Static_Star_" .. jj)
    end
  end
  self._ui.frame_houseType:UpdateContentPos()
  self._ui.frame_houseType:UpdateContentScroll()
  self._ui.stc_houseTypeContentBG:SetSize(frameContent:GetSizeX(), frameContent:GetSizeY())
  self:initDetailList()
  self._ui.txt_manage = UI.getChildControl(self._ui.stc_BG, "StaticText_Manage")
  self._ui.stc_manageBG = UI.getChildControl(self._ui.stc_BG, "Static_Manage")
  self._ui.txt_manageTitle = UI.getChildControl(self._ui.stc_manageBG, "StaticText_Title")
  self._ui.stc_normalBG = UI.getChildControl(self._ui.stc_manageBG, "Static_Normal")
  self._ui.txt_normalNeedPoint = UI.getChildControl(self._ui.stc_normalBG, "StaticText_Need_Point")
  self._ui.txt_normalNeedPointVal = UI.getChildControl(self._ui.stc_normalBG, "StaticText_Need_Point_Val")
  self._ui.txt_normalMyPoint = UI.getChildControl(self._ui.stc_normalBG, "StaticText_My_Point")
  self._ui.txt_normalMyPointVal = UI.getChildControl(self._ui.stc_normalBG, "StaticText_My_Point_Val")
  self._ui.txt_normalTimeCost = UI.getChildControl(self._ui.stc_normalBG, "StaticText_Time")
  self._ui.txt_normalTimeCostVal = UI.getChildControl(self._ui.stc_normalBG, "StaticText_Time_Val")
  self._ui.txt_normalSilverCost = UI.getChildControl(self._ui.stc_normalBG, "StaticText_Cost")
  self._ui.txt_normalSilverCostVal = UI.getChildControl(self._ui.stc_normalBG, "StaticText_Cost_Val")
  self._ui.txt_normalMySilver = UI.getChildControl(self._ui.stc_normalBG, "StaticText_Silver")
  self._ui.txt_normalMySilverVal = UI.getChildControl(self._ui.stc_normalBG, "StaticText_Silver_Val")
  self._ui.btn_upgradeOrChange = UI.getChildControl(self._ui.stc_normalBG, "Button_UpgradeOrChange")
  self._ui.btn_upgradeOrChange:addInputEvent("Mouse_LUp", "Input_WorldMapHouseCraft_UpgradeOrChange()")
  self._ui.stc_processingBG = UI.getChildControl(self._ui.stc_manageBG, "Static_Progress")
  self._ui.txt_processingTimeLeft = UI.getChildControl(self._ui.stc_processingBG, "StaticText_Time_Left")
  self._ui.txt_processingTimeLeftVal = UI.getChildControl(self._ui.stc_processingBG, "StaticText_Time_Left_Val")
  self._ui.txt_processingProgress = UI.getChildControl(self._ui.stc_processingBG, "StaticText_Progress")
  self._ui.txt_processingProgressVal = UI.getChildControl(self._ui.stc_processingBG, "StaticText_Progress_Val")
  self._ui.progress_bar = UI.getChildControl(self._ui.stc_processingBG, "Progress2_Bar")
  self._ui.txt_houseImage = UI.getChildControl(self._ui.stc_manageBG, "StaticText_House_Image")
  self._ui.chk_buyOrSell = UI.getChildControl(self._ui.stc_manageBG, "Checkbox_Confirm")
end
function WorldMapHouseCraft:initDetailList()
  self._ui.txt_detailTitle = UI.getChildControl(self._ui.stc_typeBG, "StaticText_DetailTitle")
  self._ui.stc_line = UI.getChildControl(self._ui.stc_typeBG, "Static_Line")
  self._ui.stc_detailBG = UI.getChildControl(self._ui.stc_typeBG, "Static_DetailListBG")
  UIScroll.InputEventByControl(self._ui.stc_detailBG, "InputScroll_WorldMapHouseCraft_DetailList")
  self._ui.scroll_detailList = UI.getChildControl(self._ui.stc_typeBG, "Scroll_DetailList")
  UIScroll.InputEvent(self._ui.scroll_detailList, "InputScroll_WorldMapHouseCraft_DetailList")
  self._ui.txt_descriptions = {}
  local startX, startY = self._ui.stc_line:GetPosX(), self._ui.stc_line:GetPosY() + 25
  for ii = 1, self._detailListRowMax do
    self._ui.txt_descriptions[ii] = UI.createAndCopyBasePropertyControl(self._ui.stc_typeBG, "StaticText_DescTemplete", self._ui.stc_typeBG, "StaticText_DescTemplete_" .. ii)
    self._ui.txt_descriptions[ii]:SetPosX(startX)
    self._ui.txt_descriptions[ii]:SetPosY(startY + (ii - 1) * self._receipeIconDefaultGap)
    UIScroll.InputEventByControl(self._ui.txt_descriptions[ii], "InputScroll_WorldMapHouseCraft_DetailList")
  end
  self._ui.stc_itemSlotBG = {}
  for ii = 1, self._receipeIconCountMax do
    self._ui.stc_itemSlotBG[ii] = UI.createAndCopyBasePropertyControl(self._ui.stc_typeBG, "Static_ItemSlotBgTemplete", self._ui.stc_typeBG, "Static_ItemSlotBgTemplete" .. ii)
    self._ui.stc_itemSlotBG[ii]:SetPosX(startX + (ii - 1) % self._receipeIconColumnMax * self._receipeIconDefaultGap)
    self._ui.stc_itemSlotBG[ii]:SetPosY(startY - 12 + math.floor((ii - 1) / self._receipeIconColumnMax) * self._receipeIconDefaultGap)
    UIScroll.InputEventByControl(self._ui.stc_itemSlotBG[ii], "InputScroll_WorldMapHouseCraft_DetailList")
  end
end
function WorldMapHouseCraft:registEvent()
end
function WorldMapHouseCraft:registMessageHandler()
  registerEvent("FromClient_ReceiveBuyHouse", "FromClient_WorldMapHouseCraft_ReceiveBuyHouse")
  registerEvent("WorldMap_WorkerDataUpdate", "FromClient_WorldMapHouseCraft_WorkerDataUpdate")
end
function PaGlobalFunc_WorldMapHouseCraft_IsShow()
  return _panel:GetShow()
end
function PaGlobalFunc_WorldMapHouseCraft_Open(houseInfoSSWrapper)
  WorldMapHouseCraft:open(houseInfoSSWrapper)
end
function WorldMapHouseCraft:open(houseInfoSSWrapper)
  _panel:SetShow(true)
  self._selected = nil
  self._ui.chk_buyOrSell:SetIgnore(false)
  self._ui.chk_buyOrSell:SetCheck(false)
  self:lateInit()
  self:update(houseInfoSSWrapper)
end
function WorldMapHouseCraft:lateInit()
end
function WorldMapHouseCraft:update(houseInfoSSWrapper)
  if true ~= _panel:GetShow() or nil == houseInfoSSWrapper then
    return
  end
  local houseInfoSS = houseInfoSSWrapper:get()
  self._houseKey = houseInfoSSWrapper:getHouseKey()
  self._screenShotPath = ToClient_getScreenShotPath(houseInfoSS, 0)
  self._isSalable = houseInfoSSWrapper:isSalable()
  self._isPurchasable = houseInfoSSWrapper:isPurchasable()
  self._needExplorePoint = houseInfoSSWrapper:getNeedExplorePoint()
  self._isSet = houseInfoSSWrapper:isSet()
  self._receipeCount = houseInfoSSWrapper:getReceipeCount()
  self._houseName = houseInfoSSWrapper:getName()
  self:updateTypeList(houseInfoSSWrapper)
  local rentHouse = ToClient_GetRentHouseWrapper(self._houseKey)
  if nil ~= rentHouse and true == rentHouse:isSet() then
    _PA_LOG("\235\176\149\235\178\148\236\164\128", "updateRentedHouse")
    self:updateRentedHouse(rentHouse, houseInfoSSWrapper)
  else
    _PA_LOG("\235\176\149\235\178\148\236\164\128", "updateEmptyHouse")
    self:updateEmptyHouse(houseInfoSSWrapper)
  end
  self:updateDetailList()
  self:updateBottomBox()
  self._ui.txt_title:SetText(self._houseName)
end
function WorldMapHouseCraft:updateTypeList(houseInfoSSWrapper)
  if nil == houseInfoSSWrapper then
    return
  end
  if false == houseInfoSSWrapper:isSet() then
    return
  end
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(self._houseKey)
  local frameContent = self._ui.frame_houseType:GetFrameContent()
  for ii = 1, self._houseTypeMax do
    if nil == self._ui.rdo_houseTypes[ii] then
      self._ui.rdo_houseTypes[ii] = UI.cloneControl(self._ui.rdo_houseTypeTemplate, frameContent, "RadioButton_HouseType_" .. ii)
    end
    if ii <= self._receipeCount then
      local houseInfoCraftWrapper = houseInfoSSWrapper:getHouseCraftWrapperByIndex(ii - 1)
      self._useTypeData[ii] = {}
      self._useTypeData[ii].receipeKey = houseInfoSSWrapper:getReceipeByIndex(ii - 1)
      self._useTypeData[ii].useType = houseInfoSSWrapper:getGroupTypeByIndex(ii - 1)
      self._useTypeData[ii].name = houseInfoCraftWrapper:getReciepeName()
      local txt_name = UI.getChildControl(self._ui.rdo_houseTypes[ii], "StaticText_Name")
      txt_name:SetText(self._useTypeData[ii].name)
      self._useTypeData[ii].maxLevel = houseInfoCraftWrapper:getLevel()
      for jj = 1, self._starCountMax do
        if jj <= self._useTypeData[ii].maxLevel then
          self._ui.stc_stars[ii][jj]:SetShow(true)
        else
          self._ui.stc_stars[ii][jj]:SetShow(false)
        end
      end
      self._ui.rdo_houseTypes[ii]:SetShow(true)
    else
      self._ui.rdo_houseTypes[ii]:SetShow(false)
    end
  end
  frameContent:SetSize(frameContent:GetSizeX(), self._receipeCount * self._listDefaultYGap + self._ui.rdo_houseTypes[1]:GetSizeY() + self._listStartY)
  self._ui.stc_houseTypeContentBG:SetSize(frameContent:GetSizeX(), frameContent:GetSizeY())
  local scroll = self._ui.frame_houseType:GetVScroll()
  if frameContent:GetSizeY() > self._ui.frame_houseType:GetSizeY() then
    scroll:SetShow(true)
  else
    scroll:SetShow(false)
  end
end
function WorldMapHouseCraft:updateRentedHouse(rentHouse, houseInfoStaticStatusWrapper)
  self._rentedLevel = rentHouse:getLevel()
  self._rentedUseType = rentHouse:getHouseUseType()
  self._isRentedHouse = true
  self._ui.txt_normalTimeCost:SetShow(false)
  self._ui.chk_buyOrSell:SetMonoTone(false)
  self._ui.chk_buyOrSell:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_RENEW_RETURN"))
  self._ui.txt_normalNeedPoint:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_WITHDRAWEXPLORE"))
  self._ui.btn_upgradeOrChange:SetShow(true)
  local rentedIndex
  for ii = 1, #self._useTypeData do
    if self._rentedUseType == self._useTypeData[ii].receipeKey then
      rentedIndex = ii
      if nil == self._selected then
        Input_WorldMapHouseCraft_SetUseType(ii)
        break
      end
    end
  end
  local stc_stars = {}
  for ii = 1, self._starCountMax do
    stc_stars[ii] = UI.getChildControl(self._ui.rdo_houseTypes[rentedIndex], "Static_Star_" .. ii)
    if ii <= self._rentedLevel then
      local x1, y1, x2, y2 = setTextureUV_Func(stc_stars[ii], _starUV.full[1], _starUV.full[2], _starUV.full[3], _starUV.full[4])
      stc_stars[ii]:getBaseTexture():setUV(x1, y1, x2, y2)
      stc_stars[ii]:setRenderTexture(stc_stars[ii]:getBaseTexture())
    else
      local x1, y1, x2, y2 = setTextureUV_Func(stc_stars[ii], _starUV.empty[1], _starUV.empty[2], _starUV.empty[3], _starUV.empty[4])
      stc_stars[ii]:getBaseTexture():setUV(x1, y1, x2, y2)
      stc_stars[ii]:setRenderTexture(stc_stars[ii]:getBaseTexture())
    end
  end
end
function WorldMapHouseCraft:updateEmptyHouse(houseInfoSSWrapper)
  self._rentedUseType = -1
  self._rentedLevel = 0
  self._rentedUseType = eHouseUseGroupType.Count
  self._isRentedHouse = false
  if nil == self._selected then
    Input_WorldMapHouseCraft_SetUseType(1)
  end
  self._ui.btn_upgradeOrChange:SetShow(false)
  self._ui.txt_normalTimeCost:SetShow(true)
  self._ui.chk_buyOrSell:SetMonoTone(false)
  self._ui.chk_buyOrSell:SetIgnore(false)
  local isPurchasable = houseInfoSSWrapper:isPurchasable(self._useTypeData[self._selected].receipeKey)
  if isPurchasable and self._needExplorePoint <= ToClient_RequestGetMyExploredPoint() then
    self._ui.chk_buyOrSell:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_RENEW_RENT"))
    self._ui.chk_buyOrSell:addInputEvent("Mouse_LUp", "Input_WorldMapHouseCraft_Buy()")
  elseif isPurchasable and self._needExplorePoint > ToClient_RequestGetMyExploredPoint() then
    self._ui.chk_buyOrSell:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_HOUSECONTROL_BTN_LOWPOINT"))
    self._ui.chk_buyOrSell:SetMonoTone(true)
    self._ui.chk_buyOrSell:SetIgnore(true)
  else
    self._ui.chk_buyOrSell:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_HOUSECONTROL_BTN_CANTBUY"))
    self._ui.chk_buyOrSell:addInputEvent("Mouse_LUp", "Input_WorldMapHouseCraft_SeePrevHouse()")
  end
  local stc_stars = {}
  for ii = 1, #self._ui.rdo_houseTypes do
    for jj = 1, self._starCountMax do
      stc_stars[jj] = UI.getChildControl(self._ui.rdo_houseTypes[ii], "Static_Star_" .. jj)
      local x1, y1, x2, y2 = setTextureUV_Func(stc_stars[jj], _starUV.empty[1], _starUV.empty[2], _starUV.empty[3], _starUV.empty[4])
      stc_stars[jj]:getBaseTexture():setUV(x1, y1, x2, y2)
      stc_stars[jj]:setRenderTexture(stc_stars[jj]:getBaseTexture())
    end
  end
end
function WorldMapHouseCraft:updateDetailList()
  self:updateDetailData()
  for ii = 1, #self._ui.txt_descriptions do
    self._ui.txt_descriptions[ii]:SetShow(false)
  end
  for ii = 1, #self._ui.stc_itemSlotBG do
    self._ui.stc_itemSlotBG[ii]:SetShow(false)
  end
  local data = self._detailListData
  for ii = 1, self._detailListRowMax do
    local index = ii + self._detailListScrollAmount
    if nil ~= data[index] then
      if nil ~= data[index].desc then
        self._ui.txt_descriptions[ii]:SetShow(true)
        self._ui.txt_descriptions[ii]:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
        self._ui.txt_descriptions[ii]:SetText(data[index].desc)
        for jj = 1, self._receipeIconColumnMax do
          self._ui.stc_itemSlotBG[jj + (ii - 1) * self._receipeIconColumnMax]:SetShow(false)
        end
      elseif nil ~= data[index].itemIndexList then
        for jj = 1, self._receipeIconColumnMax do
          local slotIndex = jj + (ii - 1) * self._receipeIconColumnMax
          local slotBG = self._ui.stc_itemSlotBG[slotIndex]
          if nil ~= data[index].itemIndexList[jj] then
            slotBG:SetShow(true)
            local esSSW = ToClient_getHouseDataWorkableItemExchangeByIndex(data[index].itemIndexList[jj])
            if esSSW:isSet() then
              local esSS = esSSW:get()
              local workIcon = "icon/" .. esSSW:getIcon()
              local itemStatic = esSS:getFirstDropGroup():getItemStaticStatus()
              local itemKey = esSS:getFirstDropGroup()._itemKey
              local staticStatusWrapper = getItemEnchantStaticStatus(itemKey)
              if nil ~= staticStatusWrapper then
                if nil == self._ui.itemSlots[slotIndex] then
                  self._ui.itemSlots[slotIndex] = {}
                  local slot = self._ui.itemSlots[slotIndex]
                  SlotItem.new(slot, "DetailSlot_" .. slotIndex, slotIndex, slotBG, _slotOption)
                  slot:createChild()
                  UIScroll.InputEventByControl(slot.icon, "InputScroll_WorldMapHouseCraft_DetailList")
                end
                self._ui.itemSlots[slotIndex]:setItemByStaticStatus(staticStatusWrapper)
              end
            end
          else
            slotBG:SetShow(false)
          end
        end
      end
    end
  end
  if #data <= self._detailListRowMax then
    self._ui.scroll_detailList:SetShow(false)
  else
    self._ui.scroll_detailList:SetShow(true)
  end
end
function WorldMapHouseCraft:updateDetailData()
  local houseInfoSSW = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  local houseInfoCraftWrapper = houseInfoSSW:getHouseCraftWrapperByIndex(self._selected - 1)
  local maxLevel = houseInfoCraftWrapper:getLevel()
  local receipeKey = houseInfoSSW:getReceipeByIndex(self._selected - 1)
  local houseUseType = houseInfoSSW:getGroupTypeByIndex(self._selected - 1)
  local workCount = ToClient_getHouseWorkableListByData(self._houseKey, receipeKey, maxLevel)
  self._detailListData = {}
  local data = self._detailListData
  if workCount < 1 then
    data.isCraft = false
    local rowNum = 1
    for ii = 1, maxLevel do
      data[ii] = {}
      data[ii].desc = ii .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSEWORKLIST_HOUSE_LEVEL")
      if eHouseUseGroupType.Lodging == houseUseType then
        local workerCount = houseInfoSSW:getWorkerCount(ii)
        data[ii].desc = data[ii].desc .. " : " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_LODGING2", "workerCount", workerCount)
      elseif eHouseUseGroupType.Depot == houseUseType then
        local extendWarehouseCount = houseInfoSSW:getExtendWarehouseCount(ii)
        data[ii].desc = data[ii].desc .. " : " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_DEPOT2", "extendWarehouseCount", extendWarehouseCount)
      elseif eHouseUseGroupType.Ranch == houseUseType then
        local extendStableCount = houseInfoSSW:getExtendStableCount(ii)
        data[ii].desc = data[ii].desc .. " : " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_RANCH2", "extendStableCount", extendStableCount)
      else
        data[1].desc = ""
        data[2] = {}
        data[2].desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_HELP_MYHOUSE")
        data[3] = {}
        data[3].desc = ""
        return
      end
    end
  else
    data.isCraft = true
    local levelTitleRow = 1
    local itemSlotRow = 1
    local itemIndexFromZero = 0
    local itemCountInLevel = {}
    for ii = 1, maxLevel do
      if nil == data[levelTitleRow] then
        data[levelTitleRow] = {}
      end
      data[levelTitleRow].desc = ii .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSEWORKLIST_HOUSE_LEVEL")
      itemCountInLevel[ii] = ToClient_getHouseWorkableListByDataOnlySize(receipeKey, ii, ii)
      local itemRowAmountInLevel = math.ceil(itemCountInLevel[ii] / self._receipeIconColumnMax) + 1
      itemSlotRow = levelTitleRow + 1
      levelTitleRow = levelTitleRow + itemRowAmountInLevel
      for jj = 1, itemCountInLevel[ii] do
        if nil == data[itemSlotRow] then
          data[itemSlotRow] = {}
        end
        if nil == data[itemSlotRow].itemIndexList then
          data[itemSlotRow].itemIndexList = {}
        end
        data[itemSlotRow].itemIndexList[jj % self._receipeIconColumnMax] = itemIndexFromZero
        itemIndexFromZero = itemIndexFromZero + 1
        if 0 == jj % self._receipeIconColumnMax then
          itemSlotRow = itemSlotRow + 1
        end
      end
    end
  end
end
function WorldMapHouseCraft:updateBottomBox()
  local workingcnt = getWorkingListAtRentHouse(self._houseKey)
  local isUsable = ToClient_IsUsable(self._houseKey)
  _PA_LOG("\235\176\149\235\178\148\236\164\128", "updateBottomBox, workingcnt : " .. workingcnt)
  _PA_LOG("\235\176\149\235\178\148\236\164\128", "updateBottomBox, isUsable : " .. tostring(isUsable))
  if true == self._isRentedHouse then
  else
  end
  self:updateBottomAsNormalState()
end
function WorldMapHouseCraft:updateBottomAsNormalState()
  local houseInfoSSW = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(self._houseKey)
  local isMyHouse = ToClient_IsMyHouse(self._houseKey)
  local isMaxLevel = false
  local isUsable = ToClient_IsUsable(self._houseKey)
  local currentUseType = self._useTypeData[self._selected].useType
  local houseUseType, nextRentHouseLevel
  if nil ~= rentHouseWrapper and rentHouseWrapper:isSet() then
    local nextRentHouseLevel = rentHouseWrapper:getLevel()
    if false == isMaxLevel then
      nextRentHouseLevel = nextRentHouseLevel + 1
    end
  end
  local itemKey = {}
  local itemName = {}
  local itemCount = {}
  local listCount = 0
  if nil ~= nextRentHouseLevel then
    listCount = houseInfoSSW:getNeedItemListCount(currentUseType, nextRentHouseLevel)
  end
  for index = 0, listCount - 1 do
    itemKey[index] = houseInfoSSW:getNeedItemListItemKey(currentUseType, nextRentHouseLevel, index)
    itemName[index] = getItemEnchantStaticStatus(itemKey[index]):getName()
    itemCount[index] = Int64toInt32(houseInfoSSW:getNeedItemListItemCount(currentUseType, nextRentHouseLevel, index))
  end
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local inventory = selfPlayer:getInventory()
  local myMoney = Int64toInt32(inventory:getMoney_s64())
  local myMoneyDot = makeDotMoney(myMoney)
  self._ui.txt_normalMySilverVal:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_HAVEMONEY", "myMoney", myMoneyDot))
  if nil ~= nextRentHouseLevel and nil ~= itemCount[0] and nil ~= itemName[0] then
    if currentUseType == houseUseType and true == isMaxLevel and true == isUsable then
      self._ui.txt_normalSilverCostVal:SetText("--")
    else
      local needMoney = itemCount[0]
      if myMoney < needMoney then
        needMoney = "<PAColor0xFFDB2B2B>" .. makeDotMoney(needMoney) .. " " .. itemName[0] .. "<PAOldColor>"
      else
        needMoney = makeDotMoney(needMoney) .. " " .. itemName[0]
      end
      self._ui.txt_normalSilverCostVal:SetText(needMoney)
    end
  else
    self._ui.txt_normalSilverCostVal:SetText("--")
  end
  self._needTime = -1
  local needTime = "--"
  if nil ~= nextRentHouseLevel and currentUseType ~= houseUseType and false == isMaxLevel and false == isUsable then
    self._needTime = houseInfoSSW:getTransperTime(currentUseType, nextRentHouseLevel, nextRentHouseLevel)
  else
    self._needTime = 0
  end
  if 0 ~= self._needTime then
    needTime = Util.Time.timeFormatting(self._needTime)
  end
  self._ui.txt_normalTimeCostVal:SetText(needTime)
  self._ui.txt_normalNeedPointVal:SetText(self._needExplorePoint)
  self._ui.txt_normalMyPointVal:SetText(ToClient_RequestGetMyExploredPoint())
  self:updateBottomButtons()
end
function WorldMapHouseCraft:updateBottomButtons()
  local selectedUseType = self._useTypeData[self._selected].useType
  local houseInfoSSW = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  local houseInfoCraftWrapper = houseInfoSSW:getHouseCraftWrapperByIndex(self._selected - 1)
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(self._houseKey)
  local isMaxLevel
  self._isUsable = ToClient_IsUsable(self._houseKey)
  if nil ~= rentHouseWrapper then
    isMaxLevel = rentHouseWrapper:isMaxLevel()
  end
  if nil ~= houseInfoCraftWrapper and selectedUseType ~= self._rentedUseType then
    self._ui.btn_upgradeOrChange:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_1") .. " : " .. houseInfoCraftWrapper:getReciepeName())
    self._ui.btn_upgradeOrChange:EraseAllEffect()
    self._ui.btn_upgradeOrChange:AddEffect("UI_ButtonLineRight_WhiteLong", false, -10, -3)
    self._ui.btn_upgradeOrChange:SetMonoTone(false)
  elseif true == self._isUsable and false == isMaxLevel and eHouseUseGroupType.Empty ~= self._currentUseType then
    self._ui.btn_upgradeOrChange:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_GRADEUP_TITLE") .. " : " .. houseInfoCraftWrapper:getReciepeName())
    self._ui.btn_upgradeOrChange:EraseAllEffect()
    self._ui.btn_upgradeOrChange:AddEffect("UI_ButtonLineRight_WhiteLong", false, -10, -3)
    self._ui.btn_upgradeOrChange:SetMonoTone(false)
  elseif true == self._isUsable and true == isMaxLevel then
    self._ui.btn_upgradeOrChange:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BTN_MAXLEVEL_1"))
    self._ui.btn_upgradeOrChange:SetMonoTone(true)
  else
    self._ui.btn_upgradeOrChange:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BTN_MAXLEVEL_2"))
    self._ui.btn_upgradeOrChange:SetMonoTone(true)
  end
end
function Input_WorldMapHouseCraft_Buy()
  local self = WorldMapHouseCraft
  if nil == self._selected then
    return
  end
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return
  end
  if not self._houseKey then
    return
  end
  local SSW = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  if false == SSW:isSet() then
    return
  end
  local nextRentHouseLevel = 1
  local receipeKey = self._useTypeData[self._selected].receipeKey
  local realIndex = SSW:getIndexByReceipeKey()
  local houseInfoCraftWrapper = SSW:getHouseCraftWrapperByIndex(realIndex)
  local listCount = SSW:getNeedItemListCount(receipeKey, nextRentHouseLevel)
  local needTime_sec = SSW:getTransperTime(receipeKey, nextRentHouseLevel, nextRentHouseLevel)
  local needExplorePoint = SSW:getNeedExplorePoint()
  local needTime = Util.Time.timeFormatting(needTime_sec)
  local houseName = self._houseName
  local useTypeName = houseInfoCraftWrapper:getReciepeName()
  local itemExplain = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDPOINT", "needPoint", needExplorePoint) .. "\n"
  for index = 0, listCount - 1 do
    local itemKey = SSW:getNeedItemListItemKey(receipeKey, nextRentHouseLevel, index)
    local itemName = getItemEnchantStaticStatus(itemKey):getName()
    local itemCount = SSW:getNeedItemListItemCount(receipeKey, nextRentHouseLevel, index)
    local needCost = makeDotMoney(Int64toInt32(itemCount)) .. " " .. itemName
    itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDCOST", "needCost", needCost) .. "\n"
  end
  itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDTIME", "needTime", needTime)
  itemExplain = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BUYHOUSE_CONTENT", "houseName", houseName, "useTypeName", useTypeName) .. [[


]] .. itemExplain
  local function buyConfirmed()
    ToClient_RequestBuyHouse(self._houseKey, receipeKey, 1)
    PaGlobal_TutorialManager:handleClickedHouseControlBuyHouseContinue()
  end
  local messageboxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BUYHOUSE_TITLE"),
    content = itemExplain,
    functionYes = buyConfirmed,
    functionCancel = MessageBox_Empty_function
  }
  MessageBox.showMessageBox(messageboxData, "top")
  self._ui.chk_buyOrSell:SetIgnore(true)
  self._ui.stc_normalBG:SetShow(false)
  self._ui.stc_processingBG:SetShow(true)
end
function Input_WorldMapHouseCraft_SeePrevHouse()
end
function Input_WorldMapHouseCraft_SetUseType(index)
  local self = WorldMapHouseCraft
  local houseInfoSSW = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  if false == houseInfoSSW:isSet() then
    return
  end
  self._selected = index
  for ii = 1, #self._ui.rdo_houseTypes do
    self._ui.rdo_houseTypes[ii]:SetCheck(false)
  end
  self._ui.rdo_houseTypes[index]:SetCheck(true)
  self._detailListScrollAmount = 0
  self._ui.scroll_detailList:SetControlTop()
  self:updateDetailList()
  self:updateBottomBox()
end
function InputScroll_WorldMapHouseCraft_DetailList(isUp)
  local self = WorldMapHouseCraft
  local prevScrollAmount = self._detailListScrollAmount
  self._detailListScrollAmount = UIScroll.ScrollEvent(self._ui.scroll_detailList, isUp, self._detailListRowMax, #self._detailListData, self._detailListScrollAmount, 1)
  if prevScrollAmount ~= self._detailListScrollAmount then
    self:updateDetailList()
  end
end
function Input_WorldMapHouseCraft_UpgradeOrChange()
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(self._houseKey)
  local houseInfoStaticStatusWrapper = rentHouseWrapper:getStaticStatus()
  local rentedReceipeKey = rentHouseWrapper:getType()
  local nextRentHouseLevel = 1
  local selectedUseType = self._useTypeData[self._selected].useType
  if selectedUseType == rentedReceipeKey and eHouseUseGroupType.Count ~= self._currentGroupType then
    nextRentHouseLevel = rentHouseWrapper:getLevel() + 1
  end
  local houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(self._selected - 1)
  local targetUseTypeName = houseInfoCraftWrapper:getReciepeName()
  houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(rentedReceipeKey)
  local currentUseTypeName = houseInfoCraftWrapper:getReciepeName()
  local rentHouseLevel = rentHouseWrapper:getLevel()
  local listCount = houseInfoStaticStatusWrapper:getNeedItemListCount(selectedUseType, nextRentHouseLevel)
  local needTime = Util.Time.timeFormatting(houseInfoStaticStatusWrapper:getTransperTime(selectedUseType, nextRentHouseLevel, nextRentHouseLevel))
  local itemExplain = ""
  for index = 0, listCount - 1 do
    local itemKey = houseInfoStaticStatusWrapper:getNeedItemListItemKey(selectedUseType, nextRentHouseLevel, index)
    local itemName = getItemEnchantStaticStatus(itemKey):getName()
    local itemCount = houseInfoStaticStatusWrapper:getNeedItemListItemCount(selectedUseType, nextRentHouseLevel, index)
    Panel_HouseControl_Value_HouseKey = selectedUseType
    self._itemCheck[index] = false
    for invenIndex = 0, inventory_getSize() - 1 do
      if nil ~= getInventoryItem(invenIndex) and itemKey:getItemKey() == getInventoryItem(invenIndex):get():getKey():getItemKey() and itemCount <= getInventoryItem(invenIndex):get():getCount_s64() then
        self._itemCheck[index] = true
      end
    end
    local needCost = Int64toInt32(itemCount) .. " " .. itemName
    itemExplain = itemExplain .. itemName .. " " .. Int64toInt32(itemCount) .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_COUNT") .. "\n"
  end
  itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDTIME", "needTime", needTime)
  local workingcnt = ToClient_getHouseWorkingWorkerList(houseInfoStaticStatusWrapper:get())
  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_1")
  if false == ToClient_IsUsable(self._houseKey) then
    itemExplain = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_1", "currentTypeName", currentUseTypeName, "targetTypeName", targetUseTypeName) .. [[


]] .. itemExplain
  elseif workingcnt > 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_2"))
    return
  elseif targetUseTypeName == currentUseTypeName then
    itemExplain = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_4", "currentTypeName", currentUseTypeName, "rentHouseLevel", rentHouseLevel, "nextLevel", rentHouseLevel + 1) .. [[


]] .. itemExplain
    _title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_2")
  else
    itemExplain = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_3", "currentTypeName", currentUseTypeName, "targetTypeName", targetUseTypeName) .. [[


]] .. itemExplain
  end
  local messageboxData = {
    title = _title,
    content = itemExplain,
    functionYes = handleClickedHouseControlChangeStateHouseContinue,
    functionCancel = MessageBox_Empty_function,
    priority = UI_PP.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData, "top")
end
function FromClient_WorldMapHouseCraft_ReceiveBuyHouse(houseInfoSSWrapper)
  local self = WorldMapHouseCraft
  Refresh_HouseIcon_Texture(houseInfoSSWrapper)
  local NextHouseCount = houseInfoSSWrapper:getNextHouseCount()
  for idx = 0, NextHouseCount - 1 do
    local NextHouseInfoStaticStatusWrapper = houseInfoSSWrapper:getNextHouseInfoStaticStatusWrapper(idx)
    Refresh_HouseIcon_Texture(NextHouseInfoStaticStatusWrapper)
  end
  self:update(houseInfoSSWrapper)
  PaGlobalFunc_WorldMapNodeInfo_UpdateExplorePoint()
end
function FromClient_WorldMapHouseCraft_WorkerDataUpdate()
  HouseProgressSection_Init()
  currentWorkCountCheck = false
  HouseProgressSection_Update()
end
