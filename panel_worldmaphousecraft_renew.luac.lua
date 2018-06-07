-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap_grand\console\panel_worldmaphousecraft_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Worldmap_HouseCraft
local eHouseUseGroupType = CppEnums.eHouseUseType
local WorldMapHouseCraft = {
_ui = {stc_BG = (UI.getChildControl)(_panel, "Static_BG_House"), txt_title = nil, stc_tipBG = nil, txt_tipIcon = nil, txt_tipDesc = nil, txt_selectTitle = nil, stc_typeBG = nil, frame_houseType = nil, stc_houseTypeContentBG = nil, rdo_houseTypeTemplate = nil, rdo_houseTypes = nil, stc_stars = nil, txt_detailTitle = nil, stc_line = nil, txt_descriptions = nil, stc_itemSlotBG = nil, stc_detailBG = nil, scroll_detailList = nil, 
itemSlots = {}
, txt_manage = nil, stc_manageBG = nil, txt_manageTitle = nil, stc_normalBG = nil, txt_normalNeedPoint = nil, txt_normalNeedPointVal = nil, txt_normalMyPoint = nil, txt_normalMyPointVal = nil, txt_normalTimeCost = nil, txt_normalTimeCostVal = nil, txt_normalSilverCost = nil, txt_normalSilverCostVal = nil, txt_normalMySilver = nil, txt_normalMySilverVal = nil, btn_upgradeOrChange = nil, stc_processingBG = nil, txt_processingTimeLeft = nil, txt_processingTimeLeftVal = nil, txt_processingProgress = nil, txt_processingProgressVal = nil, progress_bar = nil, txt_houseImage = nil, chk_buyOrSell = nil}
, _houseInfoSSWrapper = nil, _houseInfoSS = nil, _houseKey = nil, _isUsable = nil, _feature1 = nil, _feature2 = nil, _screenShotPath = nil, _isSalable = nil, _isPurchasable = nil, _needExplorePoint = nil, _isSet = nil, _receipeCount = nil, _houseName = nil, _needTime = nil, _selected = nil, 
_useTypeData = {}
, _isProcessing = nil, _rentedLevel = nil, _rentedUseType = nil, _isRentedHouse = nil, _starCountMax = 5, _houseTypeMax = 8, _listDefaultYGap = 37, _listStartY = 4, 
_detailListData = {}
, _detailListScrollAmount = 0, _detailListRowMax = 3, _receipeIconColumnMax = 6, _receipeIconCountMax = 18, _receipeIconDefaultGap = 50}
local _slotOption = {createIcon = true, createBorder = true}
local _starUV = {
full = {248, 24, 269, 45}
, 
empty = {248, 2, 269, 23}
}
FromClient_luaLoadComplete_WorldMapHouseCraft = function()
  -- function num : 0_0 , upvalues : WorldMapHouseCraft
  WorldMapHouseCraft:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_WorldMapHouseCraft")
WorldMapHouseCraft.initialize = function(self)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_title = (UI.getChildControl)((self._ui).stc_BG, "StaticText_Title")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_tipBG = (UI.getChildControl)((self._ui).stc_BG, "Static_Tip")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_tipIcon = (UI.getChildControl)((self._ui).stc_tipBG, "StaticText_Icon")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_tipDesc = (UI.getChildControl)((self._ui).stc_tipBG, "StaticText_Desc")
  ;
  ((self._ui).txt_tipDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_tipDesc):SetText(((self._ui).txt_tipDesc):GetText())
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_selectTitle = (UI.getChildControl)((self._ui).stc_BG, "txt_selectTitle")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_typeBG = (UI.getChildControl)((self._ui).stc_BG, "Static_Type")
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_houseType = (UI.getChildControl)((self._ui).stc_typeBG, "Frame_HouseType")
  local frameContent = ((self._ui).frame_houseType):GetFrameContent()
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_houseTypeContentBG = (UI.getChildControl)(frameContent, "Static_ContentBG")
  -- DECOMPILER ERROR at PC84: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).rdo_houseTypes = {}
  for ii = 1, self._houseTypeMax do
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R6 in 'UnsetPending'

    ((self._ui).rdo_houseTypes)[ii] = (UI.getChildControl)(frameContent, "RadioButton_Content_" .. ii)
    ;
    (((self._ui).rdo_houseTypes)[ii]):SetPosY(self._listStartY + (ii - 1) * self._listDefaultYGap)
    ;
    (((self._ui).rdo_houseTypes)[ii]):addInputEvent("Mouse_LUp", "Input_WorldMapHouseCraft_SetUseType(" .. ii .. ")")
    ;
    (((self._ui).rdo_houseTypes)[ii]):SetShow(false)
  end
  -- DECOMPILER ERROR at PC128: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_stars = {}
  for ii = 1, self._houseTypeMax do
    -- DECOMPILER ERROR at PC136: Confused about usage of register: R6 in 'UnsetPending'

    ((self._ui).stc_stars)[ii] = {}
    for jj = 1, self._starCountMax do
      -- DECOMPILER ERROR at PC153: Confused about usage of register: R10 in 'UnsetPending'

      (((self._ui).stc_stars)[ii])[jj] = (UI.getChildControl)(((self._ui).rdo_houseTypes)[ii], "Static_Star_" .. jj)
    end
  end
  ;
  ((self._ui).frame_houseType):UpdateContentPos()
  ;
  ((self._ui).frame_houseType):UpdateContentScroll()
  ;
  ((self._ui).stc_houseTypeContentBG):SetSize(frameContent:GetSizeX(), frameContent:GetSizeY())
  self:initDetailList()
  -- DECOMPILER ERROR at PC181: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_manage = (UI.getChildControl)((self._ui).stc_BG, "StaticText_Manage")
  -- DECOMPILER ERROR at PC189: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_manageBG = (UI.getChildControl)((self._ui).stc_BG, "Static_Manage")
  -- DECOMPILER ERROR at PC197: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_manageTitle = (UI.getChildControl)((self._ui).stc_manageBG, "StaticText_Title")
  -- DECOMPILER ERROR at PC205: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_normalBG = (UI.getChildControl)((self._ui).stc_manageBG, "Static_Normal")
  -- DECOMPILER ERROR at PC213: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalNeedPoint = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_Need_Point")
  -- DECOMPILER ERROR at PC221: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalNeedPointVal = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_Need_Point_Val")
  -- DECOMPILER ERROR at PC229: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalMyPoint = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_My_Point")
  -- DECOMPILER ERROR at PC237: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalMyPointVal = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_My_Point_Val")
  -- DECOMPILER ERROR at PC245: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalTimeCost = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_Time")
  -- DECOMPILER ERROR at PC253: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalTimeCostVal = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_Time_Val")
  -- DECOMPILER ERROR at PC261: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalSilverCost = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_Cost")
  -- DECOMPILER ERROR at PC269: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalSilverCostVal = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_Cost_Val")
  -- DECOMPILER ERROR at PC277: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalMySilver = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_Silver")
  -- DECOMPILER ERROR at PC285: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_normalMySilverVal = (UI.getChildControl)((self._ui).stc_normalBG, "StaticText_Silver_Val")
  -- DECOMPILER ERROR at PC293: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).btn_upgradeOrChange = (UI.getChildControl)((self._ui).stc_normalBG, "Button_UpgradeOrChange")
  ;
  ((self._ui).btn_upgradeOrChange):addInputEvent("Mouse_LUp", "Input_WorldMapHouseCraft_UpgradeOrChange()")
  -- DECOMPILER ERROR at PC307: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_processingBG = (UI.getChildControl)((self._ui).stc_manageBG, "Static_Progress")
  -- DECOMPILER ERROR at PC315: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_processingTimeLeft = (UI.getChildControl)((self._ui).stc_processingBG, "StaticText_Time_Left")
  -- DECOMPILER ERROR at PC323: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_processingTimeLeftVal = (UI.getChildControl)((self._ui).stc_processingBG, "StaticText_Time_Left_Val")
  -- DECOMPILER ERROR at PC331: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_processingProgress = (UI.getChildControl)((self._ui).stc_processingBG, "StaticText_Progress")
  -- DECOMPILER ERROR at PC339: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_processingProgressVal = (UI.getChildControl)((self._ui).stc_processingBG, "StaticText_Progress_Val")
  -- DECOMPILER ERROR at PC347: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).progress_bar = (UI.getChildControl)((self._ui).stc_processingBG, "Progress2_Bar")
  -- DECOMPILER ERROR at PC355: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_houseImage = (UI.getChildControl)((self._ui).stc_manageBG, "StaticText_House_Image")
  -- DECOMPILER ERROR at PC363: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).chk_buyOrSell = (UI.getChildControl)((self._ui).stc_manageBG, "Checkbox_Confirm")
end

WorldMapHouseCraft.initDetailList = function(self)
  -- function num : 0_2
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_detailTitle = (UI.getChildControl)((self._ui).stc_typeBG, "StaticText_DetailTitle")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_line = (UI.getChildControl)((self._ui).stc_typeBG, "Static_Line")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_detailBG = (UI.getChildControl)((self._ui).stc_typeBG, "Static_DetailListBG")
  ;
  (UIScroll.InputEventByControl)((self._ui).stc_detailBG, "InputScroll_WorldMapHouseCraft_DetailList")
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).scroll_detailList = (UI.getChildControl)((self._ui).stc_typeBG, "Scroll_DetailList")
  ;
  (UIScroll.InputEvent)((self._ui).scroll_detailList, "InputScroll_WorldMapHouseCraft_DetailList")
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_descriptions = {}
  local startX, startY = ((self._ui).stc_line):GetPosX(), ((self._ui).stc_line):GetPosY() + 25
  for ii = 1, self._detailListRowMax do
    -- DECOMPILER ERROR at PC73: Confused about usage of register: R7 in 'UnsetPending'

    ((self._ui).txt_descriptions)[ii] = (UI.createAndCopyBasePropertyControl)((self._ui).stc_typeBG, "StaticText_DescTemplete", (self._ui).stc_typeBG, "StaticText_DescTemplete_" .. ii)
    ;
    (((self._ui).txt_descriptions)[ii]):SetPosX(startX)
    ;
    (((self._ui).txt_descriptions)[ii]):SetPosY(startY + (ii - 1) * self._receipeIconDefaultGap)
    ;
    (UIScroll.InputEventByControl)(((self._ui).txt_descriptions)[ii], "InputScroll_WorldMapHouseCraft_DetailList")
  end
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).stc_itemSlotBG = {}
  for ii = 1, self._receipeIconCountMax do
    -- DECOMPILER ERROR at PC117: Confused about usage of register: R7 in 'UnsetPending'

    ((self._ui).stc_itemSlotBG)[ii] = (UI.createAndCopyBasePropertyControl)((self._ui).stc_typeBG, "Static_ItemSlotBgTemplete", (self._ui).stc_typeBG, "Static_ItemSlotBgTemplete" .. ii)
    ;
    (((self._ui).stc_itemSlotBG)[ii]):SetPosX(startX + (ii - 1) % self._receipeIconColumnMax * self._receipeIconDefaultGap)
    ;
    (((self._ui).stc_itemSlotBG)[ii]):SetPosY(startY - 12 + (math.floor)((ii - 1) / self._receipeIconColumnMax) * self._receipeIconDefaultGap)
    ;
    (UIScroll.InputEventByControl)(((self._ui).stc_itemSlotBG)[ii], "InputScroll_WorldMapHouseCraft_DetailList")
  end
end

WorldMapHouseCraft.registEvent = function(self)
  -- function num : 0_3
end

WorldMapHouseCraft.registMessageHandler = function(self)
  -- function num : 0_4
  registerEvent("FromClient_ReceiveBuyHouse", "FromClient_WorldMapHouseCraft_ReceiveBuyHouse")
  registerEvent("WorldMap_WorkerDataUpdate", "FromClient_WorldMapHouseCraft_WorkerDataUpdate")
end

PaGlobalFunc_WorldMapHouseCraft_IsShow = function()
  -- function num : 0_5 , upvalues : _panel
  return _panel:GetShow()
end

PaGlobalFunc_WorldMapHouseCraft_Open = function(houseInfoSSWrapper)
  -- function num : 0_6 , upvalues : WorldMapHouseCraft
  WorldMapHouseCraft:open(houseInfoSSWrapper)
end

WorldMapHouseCraft.open = function(self, houseInfoSSWrapper)
  -- function num : 0_7 , upvalues : _panel
  _panel:SetShow(true)
  self._selected = nil
  ;
  ((self._ui).chk_buyOrSell):SetIgnore(false)
  ;
  ((self._ui).chk_buyOrSell):SetCheck(false)
  self:lateInit()
  self:update(houseInfoSSWrapper)
end

WorldMapHouseCraft.lateInit = function(self)
  -- function num : 0_8
end

WorldMapHouseCraft.update = function(self, houseInfoSSWrapper)
  -- function num : 0_9 , upvalues : _panel
  if _panel:GetShow() ~= true or houseInfoSSWrapper == nil then
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
  if rentHouse ~= nil and rentHouse:isSet() == true then
    _PA_LOG("박범�\128", "updateRentedHouse")
    self:updateRentedHouse(rentHouse, houseInfoSSWrapper)
  else
    _PA_LOG("박범�\128", "updateEmptyHouse")
    self:updateEmptyHouse(houseInfoSSWrapper)
  end
  self:updateDetailList()
  self:updateBottomBox()
  ;
  ((self._ui).txt_title):SetText(self._houseName)
end

WorldMapHouseCraft.updateTypeList = function(self, houseInfoSSWrapper)
  -- function num : 0_10
  if houseInfoSSWrapper == nil then
    return 
  end
  if houseInfoSSWrapper:isSet() == false then
    return 
  end
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(self._houseKey)
  local frameContent = ((self._ui).frame_houseType):GetFrameContent()
  for ii = 1, self._houseTypeMax do
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R8 in 'UnsetPending'

    if ((self._ui).rdo_houseTypes)[ii] == nil then
      ((self._ui).rdo_houseTypes)[ii] = (UI.cloneControl)((self._ui).rdo_houseTypeTemplate, frameContent, "RadioButton_HouseType_" .. ii)
    end
    if ii <= self._receipeCount then
      local houseInfoCraftWrapper = houseInfoSSWrapper:getHouseCraftWrapperByIndex(ii - 1)
      -- DECOMPILER ERROR at PC44: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (self._useTypeData)[ii] = {}
      -- DECOMPILER ERROR at PC50: Confused about usage of register: R9 in 'UnsetPending'

      ;
      ((self._useTypeData)[ii]).receipeKey = houseInfoSSWrapper:getReceipeByIndex(ii - 1)
      -- DECOMPILER ERROR at PC56: Confused about usage of register: R9 in 'UnsetPending'

      ;
      ((self._useTypeData)[ii]).useType = houseInfoSSWrapper:getGroupTypeByIndex(ii - 1)
      -- DECOMPILER ERROR at PC61: Confused about usage of register: R9 in 'UnsetPending'

      ;
      ((self._useTypeData)[ii]).name = houseInfoCraftWrapper:getReciepeName()
      local txt_name = (UI.getChildControl)(((self._ui).rdo_houseTypes)[ii], "StaticText_Name")
      txt_name:SetText(((self._useTypeData)[ii]).name)
      -- DECOMPILER ERROR at PC78: Confused about usage of register: R10 in 'UnsetPending'

      ;
      ((self._useTypeData)[ii]).maxLevel = houseInfoCraftWrapper:getLevel()
      for jj = 1, self._starCountMax do
        if jj <= ((self._useTypeData)[ii]).maxLevel then
          ((((self._ui).stc_stars)[ii])[jj]):SetShow(true)
        else
          ;
          ((((self._ui).stc_stars)[ii])[jj]):SetShow(false)
        end
      end
      ;
      (((self._ui).rdo_houseTypes)[ii]):SetShow(true)
    else
      do
        do
          ;
          (((self._ui).rdo_houseTypes)[ii]):SetShow(false)
          -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  frameContent:SetSize(frameContent:GetSizeX(), self._receipeCount * self._listDefaultYGap + (((self._ui).rdo_houseTypes)[1]):GetSizeY() + self._listStartY)
  ;
  ((self._ui).stc_houseTypeContentBG):SetSize(frameContent:GetSizeX(), frameContent:GetSizeY())
  local scroll = ((self._ui).frame_houseType):GetVScroll()
  if ((self._ui).frame_houseType):GetSizeY() < frameContent:GetSizeY() then
    scroll:SetShow(true)
  else
    scroll:SetShow(false)
  end
end

WorldMapHouseCraft.updateRentedHouse = function(self, rentHouse, houseInfoStaticStatusWrapper)
  -- function num : 0_11 , upvalues : _starUV
  self._rentedLevel = rentHouse:getLevel()
  self._rentedUseType = rentHouse:getHouseUseType()
  self._isRentedHouse = true
  ;
  ((self._ui).txt_normalTimeCost):SetShow(false)
  ;
  ((self._ui).chk_buyOrSell):SetMonoTone(false)
  ;
  ((self._ui).chk_buyOrSell):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_RENEW_RETURN"))
  ;
  ((self._ui).txt_normalNeedPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_WITHDRAWEXPLORE"))
  ;
  ((self._ui).btn_upgradeOrChange):SetShow(true)
  local rentedIndex = nil
  for ii = 1, #self._useTypeData do
    if self._rentedUseType == ((self._useTypeData)[ii]).receipeKey then
      rentedIndex = ii
      if self._selected == nil then
        Input_WorldMapHouseCraft_SetUseType(ii)
        break
      end
    end
  end
  do
    local stc_stars = {}
    for ii = 1, self._starCountMax do
      stc_stars[ii] = (UI.getChildControl)(((self._ui).rdo_houseTypes)[rentedIndex], "Static_Star_" .. ii)
      if ii <= self._rentedLevel then
        local x1, y1, x2, y2 = setTextureUV_Func(stc_stars[ii], (_starUV.full)[1], (_starUV.full)[2], (_starUV.full)[3], (_starUV.full)[4])
        ;
        ((stc_stars[ii]):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (stc_stars[ii]):setRenderTexture((stc_stars[ii]):getBaseTexture())
      else
        do
          do
            local x1, y1, x2, y2 = setTextureUV_Func(stc_stars[ii], (_starUV.empty)[1], (_starUV.empty)[2], (_starUV.empty)[3], (_starUV.empty)[4])
            ;
            ((stc_stars[ii]):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (stc_stars[ii]):setRenderTexture((stc_stars[ii]):getBaseTexture())
            -- DECOMPILER ERROR at PC140: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC140: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC140: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end

WorldMapHouseCraft.updateEmptyHouse = function(self, houseInfoSSWrapper)
  -- function num : 0_12 , upvalues : eHouseUseGroupType, _starUV
  self._rentedUseType = -1
  self._rentedLevel = 0
  self._rentedUseType = eHouseUseGroupType.Count
  self._isRentedHouse = false
  if self._selected == nil then
    Input_WorldMapHouseCraft_SetUseType(1)
  end
  ;
  ((self._ui).btn_upgradeOrChange):SetShow(false)
  ;
  ((self._ui).txt_normalTimeCost):SetShow(true)
  ;
  ((self._ui).chk_buyOrSell):SetMonoTone(false)
  ;
  ((self._ui).chk_buyOrSell):SetIgnore(false)
  local isPurchasable = houseInfoSSWrapper:isPurchasable(((self._useTypeData)[self._selected]).receipeKey)
  if isPurchasable and self._needExplorePoint <= ToClient_RequestGetMyExploredPoint() then
    ((self._ui).chk_buyOrSell):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_RENEW_RENT"))
    ;
    ((self._ui).chk_buyOrSell):addInputEvent("Mouse_LUp", "Input_WorldMapHouseCraft_Buy()")
  else
    if isPurchasable and ToClient_RequestGetMyExploredPoint() < self._needExplorePoint then
      ((self._ui).chk_buyOrSell):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_HOUSECONTROL_BTN_LOWPOINT"))
      ;
      ((self._ui).chk_buyOrSell):SetMonoTone(true)
      ;
      ((self._ui).chk_buyOrSell):SetIgnore(true)
    else
      ;
      ((self._ui).chk_buyOrSell):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_HOUSECONTROL_BTN_CANTBUY"))
      ;
      ((self._ui).chk_buyOrSell):addInputEvent("Mouse_LUp", "Input_WorldMapHouseCraft_SeePrevHouse()")
    end
  end
  local stc_stars = {}
  for ii = 1, #(self._ui).rdo_houseTypes do
    for jj = 1, self._starCountMax do
      stc_stars[jj] = (UI.getChildControl)(((self._ui).rdo_houseTypes)[ii], "Static_Star_" .. jj)
      local x1, y1, x2, y2 = setTextureUV_Func(stc_stars[jj], (_starUV.empty)[1], (_starUV.empty)[2], (_starUV.empty)[3], (_starUV.empty)[4])
      ;
      ((stc_stars[jj]):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (stc_stars[jj]):setRenderTexture((stc_stars[jj]):getBaseTexture())
    end
  end
end

WorldMapHouseCraft.updateDetailList = function(self)
  -- function num : 0_13 , upvalues : _slotOption
  self:updateDetailData()
  for ii = 1, #(self._ui).txt_descriptions do
    (((self._ui).txt_descriptions)[ii]):SetShow(false)
  end
  for ii = 1, #(self._ui).stc_itemSlotBG do
    (((self._ui).stc_itemSlotBG)[ii]):SetShow(false)
  end
  local data = self._detailListData
  for ii = 1, self._detailListRowMax do
    local index = ii + self._detailListScrollAmount
    if data[index] ~= nil then
      if (data[index]).desc ~= nil then
        (((self._ui).txt_descriptions)[ii]):SetShow(true)
        ;
        (((self._ui).txt_descriptions)[ii]):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
        ;
        (((self._ui).txt_descriptions)[ii]):SetText((data[index]).desc)
        for jj = 1, self._receipeIconColumnMax do
          (((self._ui).stc_itemSlotBG)[jj + (ii - 1) * self._receipeIconColumnMax]):SetShow(false)
        end
      else
        do
          do
            if (data[index]).itemIndexList ~= nil then
              for jj = 1, self._receipeIconColumnMax do
                local slotIndex = jj + (ii - 1) * self._receipeIconColumnMax
                local slotBG = ((self._ui).stc_itemSlotBG)[slotIndex]
                if ((data[index]).itemIndexList)[jj] ~= nil then
                  slotBG:SetShow(true)
                  local esSSW = ToClient_getHouseDataWorkableItemExchangeByIndex(((data[index]).itemIndexList)[jj])
                  if esSSW:isSet() then
                    local esSS = esSSW:get()
                    local workIcon = "icon/" .. esSSW:getIcon()
                    local itemStatic = (esSS:getFirstDropGroup()):getItemStaticStatus()
                    local itemKey = (esSS:getFirstDropGroup())._itemKey
                    local staticStatusWrapper = getItemEnchantStaticStatus(itemKey)
                    -- DECOMPILER ERROR at PC137: Confused about usage of register: R19 in 'UnsetPending'

                    if staticStatusWrapper ~= nil then
                      if ((self._ui).itemSlots)[slotIndex] == nil then
                        ((self._ui).itemSlots)[slotIndex] = {}
                        local slot = ((self._ui).itemSlots)[slotIndex]
                        ;
                        (SlotItem.new)(slot, "DetailSlot_" .. slotIndex, slotIndex, slotBG, _slotOption)
                        slot:createChild()
                        ;
                        (UIScroll.InputEventByControl)(slot.icon, "InputScroll_WorldMapHouseCraft_DetailList")
                      end
                      do
                        do
                          do
                            ;
                            (((self._ui).itemSlots)[slotIndex]):setItemByStaticStatus(staticStatusWrapper)
                            slotBG:SetShow(false)
                            -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC168: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                    end
                  end
                end
              end
            end
            -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  if #data <= self._detailListRowMax then
    ((self._ui).scroll_detailList):SetShow(false)
  else
    ;
    ((self._ui).scroll_detailList):SetShow(true)
  end
end

WorldMapHouseCraft.updateDetailData = function(self)
  -- function num : 0_14 , upvalues : eHouseUseGroupType
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
      -- DECOMPILER ERROR at PC44: Confused about usage of register: R13 in 'UnsetPending'

      ;
      (data[ii]).desc = ii .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSEWORKLIST_HOUSE_LEVEL")
      if eHouseUseGroupType.Lodging == houseUseType then
        local workerCount = houseInfoSSW:getWorkerCount(ii)
        -- DECOMPILER ERROR at PC64: Confused about usage of register: R14 in 'UnsetPending'

        ;
        (data[ii]).desc = (data[ii]).desc .. " : " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_LODGING2", "workerCount", workerCount)
      else
        do
          if eHouseUseGroupType.Depot == houseUseType then
            local extendWarehouseCount = houseInfoSSW:getExtendWarehouseCount(ii)
            -- DECOMPILER ERROR at PC85: Confused about usage of register: R14 in 'UnsetPending'

            ;
            (data[ii]).desc = (data[ii]).desc .. " : " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_DEPOT2", "extendWarehouseCount", extendWarehouseCount)
          else
            do
              if eHouseUseGroupType.Ranch == houseUseType then
                local extendStableCount = houseInfoSSW:getExtendStableCount(ii)
                -- DECOMPILER ERROR at PC106: Confused about usage of register: R14 in 'UnsetPending'

                ;
                (data[ii]).desc = (data[ii]).desc .. " : " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_RANCH2", "extendStableCount", extendStableCount)
              else
                do
                  do
                    -- DECOMPILER ERROR at PC109: Confused about usage of register: R13 in 'UnsetPending'

                    ;
                    (data[1]).desc = ""
                    data[2] = {}
                    -- DECOMPILER ERROR at PC118: Confused about usage of register: R13 in 'UnsetPending'

                    ;
                    (data[2]).desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_HELP_MYHOUSE")
                    data[3] = {}
                    -- DECOMPILER ERROR at PC122: Confused about usage of register: R13 in 'UnsetPending'

                    ;
                    (data[3]).desc = ""
                    do return  end
                    -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
    end
  else
    do
      data.isCraft = true
      local levelTitleRow = 1
      local itemSlotRow = 1
      local itemIndexFromZero = 0
      local itemCountInLevel = {}
      for ii = 1, maxLevel do
        if data[levelTitleRow] == nil then
          data[levelTitleRow] = {}
        end
        -- DECOMPILER ERROR at PC149: Confused about usage of register: R16 in 'UnsetPending'

        ;
        (data[levelTitleRow]).desc = ii .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSEWORKLIST_HOUSE_LEVEL")
        itemCountInLevel[ii] = ToClient_getHouseWorkableListByDataOnlySize(receipeKey, ii, ii)
        local itemRowAmountInLevel = (math.ceil)(itemCountInLevel[ii] / self._receipeIconColumnMax) + 1
        itemSlotRow = levelTitleRow + 1
        levelTitleRow = levelTitleRow + itemRowAmountInLevel
        for jj = 1, itemCountInLevel[ii] do
          if data[itemSlotRow] == nil then
            data[itemSlotRow] = {}
          end
          -- DECOMPILER ERROR at PC180: Confused about usage of register: R21 in 'UnsetPending'

          if (data[itemSlotRow]).itemIndexList == nil then
            (data[itemSlotRow]).itemIndexList = {}
          end
          -- DECOMPILER ERROR at PC185: Confused about usage of register: R21 in 'UnsetPending'

          ;
          ((data[itemSlotRow]).itemIndexList)[jj % self._receipeIconColumnMax] = itemIndexFromZero
          itemIndexFromZero = itemIndexFromZero + 1
          if jj % self._receipeIconColumnMax == 0 then
            itemSlotRow = itemSlotRow + 1
          end
        end
      end
    end
  end
end

WorldMapHouseCraft.updateBottomBox = function(self)
  -- function num : 0_15
  local workingcnt = getWorkingListAtRentHouse(self._houseKey)
  local isUsable = ToClient_IsUsable(self._houseKey)
  _PA_LOG("박범�\128", "updateBottomBox, workingcnt : " .. workingcnt)
  _PA_LOG("박범�\128", "updateBottomBox, isUsable : " .. tostring(isUsable))
  if self._isRentedHouse == true then
    self:updateBottomAsNormalState()
  end
end

WorldMapHouseCraft.updateBottomAsNormalState = function(self)
  -- function num : 0_16
  local houseInfoSSW = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(self._houseKey)
  local isMyHouse = ToClient_IsMyHouse(self._houseKey)
  local isMaxLevel = false
  local isUsable = ToClient_IsUsable(self._houseKey)
  local currentUseType = ((self._useTypeData)[self._selected]).useType
  local houseUseType, nextRentHouseLevel = nil, nil
  do
    if rentHouseWrapper ~= nil and rentHouseWrapper:isSet() then
      local nextRentHouseLevel = rentHouseWrapper:getLevel()
      if isMaxLevel == false then
        nextRentHouseLevel = nextRentHouseLevel + 1
      end
    end
    local itemKey = {}
    local itemName = {}
    local itemCount = {}
    local listCount = 0
    if nextRentHouseLevel ~= nil then
      listCount = houseInfoSSW:getNeedItemListCount(currentUseType, nextRentHouseLevel)
    end
    for index = 0, listCount - 1 do
      itemKey[index] = houseInfoSSW:getNeedItemListItemKey(currentUseType, nextRentHouseLevel, index)
      itemName[index] = (getItemEnchantStaticStatus(itemKey[index])):getName()
      itemCount[index] = Int64toInt32(houseInfoSSW:getNeedItemListItemCount(currentUseType, nextRentHouseLevel, index))
    end
    local selfPlayerWrapper = getSelfPlayer()
    local selfPlayer = selfPlayerWrapper:get()
    local inventory = selfPlayer:getInventory()
    local myMoney = Int64toInt32(inventory:getMoney_s64())
    local myMoneyDot = makeDotMoney(myMoney)
    ;
    ((self._ui).txt_normalMySilverVal):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_HAVEMONEY", "myMoney", myMoneyDot))
    if nextRentHouseLevel ~= nil and itemCount[0] ~= nil and itemName[0] ~= nil then
      if currentUseType == houseUseType and isMaxLevel == true and isUsable == true then
        ((self._ui).txt_normalSilverCostVal):SetText("--")
      else
        local needMoney = itemCount[0]
        if myMoney < needMoney then
          needMoney = "<PAColor0xFFDB2B2B>" .. makeDotMoney(needMoney) .. " " .. itemName[0] .. "<PAOldColor>"
        else
          needMoney = makeDotMoney(needMoney) .. " " .. itemName[0]
        end
        ;
        ((self._ui).txt_normalSilverCostVal):SetText(needMoney)
      end
    else
      do
        ;
        ((self._ui).txt_normalSilverCostVal):SetText("--")
        self._needTime = -1
        local needTime = "--"
        if nextRentHouseLevel ~= nil and currentUseType ~= houseUseType and isMaxLevel == false and isUsable == false then
          self._needTime = houseInfoSSW:getTransperTime(currentUseType, nextRentHouseLevel, nextRentHouseLevel)
        else
          self._needTime = 0
        end
        if self._needTime ~= 0 then
          needTime = ((Util.Time).timeFormatting)(self._needTime)
        end
        ;
        ((self._ui).txt_normalTimeCostVal):SetText(needTime)
        ;
        ((self._ui).txt_normalNeedPointVal):SetText(self._needExplorePoint)
        ;
        ((self._ui).txt_normalMyPointVal):SetText(ToClient_RequestGetMyExploredPoint())
        self:updateBottomButtons()
      end
    end
  end
end

WorldMapHouseCraft.updateBottomButtons = function(self)
  -- function num : 0_17 , upvalues : eHouseUseGroupType
  local selectedUseType = ((self._useTypeData)[self._selected]).useType
  local houseInfoSSW = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  local houseInfoCraftWrapper = houseInfoSSW:getHouseCraftWrapperByIndex(self._selected - 1)
  local rentHouseWrapper = (ToClient_GetRentHouseWrapper(self._houseKey))
  local isMaxLevel = nil
  self._isUsable = ToClient_IsUsable(self._houseKey)
  if rentHouseWrapper ~= nil then
    isMaxLevel = rentHouseWrapper:isMaxLevel()
  end
  if houseInfoCraftWrapper ~= nil and selectedUseType ~= self._rentedUseType then
    ((self._ui).btn_upgradeOrChange):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_1") .. " : " .. houseInfoCraftWrapper:getReciepeName())
    ;
    ((self._ui).btn_upgradeOrChange):EraseAllEffect()
    ;
    ((self._ui).btn_upgradeOrChange):AddEffect("UI_ButtonLineRight_WhiteLong", false, -10, -3)
    ;
    ((self._ui).btn_upgradeOrChange):SetMonoTone(false)
  else
    if self._isUsable == true and isMaxLevel == false and eHouseUseGroupType.Empty ~= self._currentUseType then
      ((self._ui).btn_upgradeOrChange):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_GRADEUP_TITLE") .. " : " .. houseInfoCraftWrapper:getReciepeName())
      ;
      ((self._ui).btn_upgradeOrChange):EraseAllEffect()
      ;
      ((self._ui).btn_upgradeOrChange):AddEffect("UI_ButtonLineRight_WhiteLong", false, -10, -3)
      ;
      ((self._ui).btn_upgradeOrChange):SetMonoTone(false)
    else
      if self._isUsable == true and isMaxLevel == true then
        ((self._ui).btn_upgradeOrChange):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BTN_MAXLEVEL_1"))
        ;
        ((self._ui).btn_upgradeOrChange):SetMonoTone(true)
      else
        ;
        ((self._ui).btn_upgradeOrChange):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BTN_MAXLEVEL_2"))
        ;
        ((self._ui).btn_upgradeOrChange):SetMonoTone(true)
      end
    end
  end
end

Input_WorldMapHouseCraft_Buy = function()
  -- function num : 0_18 , upvalues : WorldMapHouseCraft
  local self = WorldMapHouseCraft
  if self._selected == nil then
    return 
  end
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return 
  end
  if not self._houseKey then
    return 
  end
  local SSW = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  if SSW:isSet() == false then
    return 
  end
  local nextRentHouseLevel = 1
  local receipeKey = ((self._useTypeData)[self._selected]).receipeKey
  local realIndex = SSW:getIndexByReceipeKey()
  local houseInfoCraftWrapper = SSW:getHouseCraftWrapperByIndex(realIndex)
  local listCount = SSW:getNeedItemListCount(receipeKey, nextRentHouseLevel)
  local needTime_sec = SSW:getTransperTime(receipeKey, nextRentHouseLevel, nextRentHouseLevel)
  local needExplorePoint = SSW:getNeedExplorePoint()
  local needTime = ((Util.Time).timeFormatting)(needTime_sec)
  local houseName = self._houseName
  local useTypeName = houseInfoCraftWrapper:getReciepeName()
  local itemExplain = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDPOINT", "needPoint", needExplorePoint) .. "\n"
  for index = 0, listCount - 1 do
    local itemKey = SSW:getNeedItemListItemKey(receipeKey, nextRentHouseLevel, index)
    local itemName = (getItemEnchantStaticStatus(itemKey)):getName()
    local itemCount = SSW:getNeedItemListItemCount(receipeKey, nextRentHouseLevel, index)
    local needCost = makeDotMoney(Int64toInt32(itemCount)) .. " " .. itemName
    itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDCOST", "needCost", needCost) .. "\n"
  end
  itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDTIME", "needTime", needTime)
  itemExplain = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BUYHOUSE_CONTENT", "houseName", houseName, "useTypeName", useTypeName) .. "\n\n" .. itemExplain
  local buyConfirmed = function()
    -- function num : 0_18_0 , upvalues : self, receipeKey
    ToClient_RequestBuyHouse(self._houseKey, receipeKey, 1)
    PaGlobal_TutorialManager:handleClickedHouseControlBuyHouseContinue()
  end

  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BUYHOUSE_TITLE"), content = itemExplain, functionYes = buyConfirmed, functionCancel = MessageBox_Empty_function}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
  ;
  ((self._ui).chk_buyOrSell):SetIgnore(true)
  ;
  ((self._ui).stc_normalBG):SetShow(false)
  ;
  ((self._ui).stc_processingBG):SetShow(true)
end

Input_WorldMapHouseCraft_SeePrevHouse = function()
  -- function num : 0_19
end

Input_WorldMapHouseCraft_SetUseType = function(index)
  -- function num : 0_20 , upvalues : WorldMapHouseCraft
  local self = WorldMapHouseCraft
  local houseInfoSSW = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  if houseInfoSSW:isSet() == false then
    return 
  end
  self._selected = index
  for ii = 1, #(self._ui).rdo_houseTypes do
    (((self._ui).rdo_houseTypes)[ii]):SetCheck(false)
  end
  ;
  (((self._ui).rdo_houseTypes)[index]):SetCheck(true)
  self._detailListScrollAmount = 0
  ;
  ((self._ui).scroll_detailList):SetControlTop()
  self:updateDetailList()
  self:updateBottomBox()
end

InputScroll_WorldMapHouseCraft_DetailList = function(isUp)
  -- function num : 0_21 , upvalues : WorldMapHouseCraft
  local self = WorldMapHouseCraft
  local prevScrollAmount = self._detailListScrollAmount
  self._detailListScrollAmount = (UIScroll.ScrollEvent)((self._ui).scroll_detailList, isUp, self._detailListRowMax, #self._detailListData, self._detailListScrollAmount, 1)
  if prevScrollAmount ~= self._detailListScrollAmount then
    self:updateDetailList()
  end
end

Input_WorldMapHouseCraft_UpgradeOrChange = function()
  -- function num : 0_22 , upvalues : eHouseUseGroupType
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(self._houseKey)
  local houseInfoStaticStatusWrapper = rentHouseWrapper:getStaticStatus()
  local rentedReceipeKey = rentHouseWrapper:getType()
  local nextRentHouseLevel = 1
  local selectedUseType = ((self._useTypeData)[self._selected]).useType
  if selectedUseType == rentedReceipeKey and eHouseUseGroupType.Count ~= self._currentGroupType then
    nextRentHouseLevel = rentHouseWrapper:getLevel() + 1
  end
  local houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(self._selected - 1)
  local targetUseTypeName = houseInfoCraftWrapper:getReciepeName()
  houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(rentedReceipeKey)
  local currentUseTypeName = houseInfoCraftWrapper:getReciepeName()
  local rentHouseLevel = rentHouseWrapper:getLevel()
  local listCount = houseInfoStaticStatusWrapper:getNeedItemListCount(selectedUseType, nextRentHouseLevel)
  local needTime = ((Util.Time).timeFormatting)(houseInfoStaticStatusWrapper:getTransperTime(selectedUseType, nextRentHouseLevel, nextRentHouseLevel))
  local itemExplain = ""
  for index = 0, listCount - 1 do
    local itemKey = houseInfoStaticStatusWrapper:getNeedItemListItemKey(selectedUseType, nextRentHouseLevel, index)
    local itemName = (getItemEnchantStaticStatus(itemKey)):getName()
    local itemCount = houseInfoStaticStatusWrapper:getNeedItemListItemCount(selectedUseType, nextRentHouseLevel, index)
    Panel_HouseControl_Value_HouseKey = selectedUseType
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R19 in 'UnsetPending'

    ;
    (self._itemCheck)[index] = false
    for invenIndex = 0, inventory_getSize() - 1 do
      -- DECOMPILER ERROR at PC113: Confused about usage of register: R23 in 'UnsetPending'

      if getInventoryItem(invenIndex) ~= nil and itemKey:getItemKey() == (((getInventoryItem(invenIndex)):get()):getKey()):getItemKey() and itemCount <= ((getInventoryItem(invenIndex)):get()):getCount_s64() then
        (self._itemCheck)[index] = true
      end
    end
    local needCost = Int64toInt32(itemCount) .. " " .. itemName
    itemExplain = itemExplain .. itemName .. " " .. Int64toInt32(itemCount) .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_COUNT") .. "\n"
  end
  itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDTIME", "needTime", needTime)
  local workingcnt = ToClient_getHouseWorkingWorkerList(houseInfoStaticStatusWrapper:get())
  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_1")
  if ToClient_IsUsable(self._houseKey) == false then
    itemExplain = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_1", "currentTypeName", currentUseTypeName, "targetTypeName", targetUseTypeName) .. "\n\n" .. itemExplain
  else
    if workingcnt > 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_2"))
      return 
    else
      if targetUseTypeName == currentUseTypeName then
        itemExplain = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_4", "currentTypeName", currentUseTypeName, "rentHouseLevel", rentHouseLevel, "nextLevel", rentHouseLevel + 1) .. "\n\n" .. itemExplain
        _title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_2")
      else
        itemExplain = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_3", "currentTypeName", currentUseTypeName, "targetTypeName", targetUseTypeName) .. "\n\n" .. itemExplain
      end
    end
  end
  local messageboxData = {title = _title, content = itemExplain, functionYes = handleClickedHouseControlChangeStateHouseContinue, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
end

FromClient_WorldMapHouseCraft_ReceiveBuyHouse = function(houseInfoSSWrapper)
  -- function num : 0_23 , upvalues : WorldMapHouseCraft
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

FromClient_WorldMapHouseCraft_WorkerDataUpdate = function()
  -- function num : 0_24
  HouseProgressSection_Init()
  currentWorkCountCheck = false
  HouseProgressSection_Update()
end


