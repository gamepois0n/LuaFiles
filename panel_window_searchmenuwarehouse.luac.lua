-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\warehouse\panel_window_searchmenuwarehouse.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
PaGlobal_SearchMenuWarehouse = {
_ui = {part_SearchMenuWarehouse = (UI.getChildControl)(Panel_Window_Warehouse, "Static_SelectWarehouse")}
, 
_warehouseInfo = {_territoryCount = 0, 
_territoryGroup = {}
}
, 
_territoryNameInfo = {}
, _currentTerritoryKey = -1, _maxTerritoryKeyCount = 10, _separatorNumber = 100, _selectWaypointKey = -1}
-- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SearchMenuWarehouse.registMessageHandler = function(self)
  -- function num : 0_0
  registerEvent("EventWarehouseUpdate", "PaGlobal_SearchMenuWarehouse_UpdateWarehouse")
end

PaGlobal_SearchMenuWarehouse_UpdateWarehouse = function(waypointKey)
  -- function num : 0_1
  local self = PaGlobal_SearchMenuWarehouse
  ;
  ((self._ui)._list2):requestUpdateByKey(toInt64(0, waypointKey + self._separatorNumber))
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SearchMenuWarehouse.Init = function(self)
  -- function num : 0_2
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).list_Title = (UI.getChildControl)((self._ui).part_SearchMenuWarehouse, "List_Title")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_MyWarehouse = (UI.getChildControl)((self._ui).part_SearchMenuWarehouse, "RadioButton_Tab_MyWarehouse")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list_KeyWord = (UI.getChildControl)((self._ui).part_SearchMenuWarehouse, "List_KeyWord")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._list2 = (UI.getChildControl)((self._ui).part_SearchMenuWarehouse, "List2_Warehouse")
  ;
  ((self._ui)._list2):changeAnimationSpeed(10)
  ;
  ((self._ui)._list2):setMinScrollBtnSize(float2(10, 50))
  ;
  ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobal_SearchMenuWarehouse_UpdateList")
  ;
  ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui).list_KeyWord):SetShow(false)
  ;
  ((self._ui).btn_MyWarehouse):addInputEvent("Mouse_LUp", "PaGlobal_SearchMenuWarehouse:ClickCurrentTownsWareHouse()")
  self._selectIndex = -1
  ;
  ((self._ui).btn_MyWarehouse):SetCheck(true)
  ;
  ((self._ui).part_SearchMenuWarehouse):SetShow(false)
end

PaGlobal_SearchMenuWarehouse_UpdateList = function(contents, key)
  -- function num : 0_3
  local self = PaGlobal_SearchMenuWarehouse
  local idx = Int64toInt32(key)
  local radioButton = (UI.getChildControl)(contents, "RadioButton_Territory")
  local warehouseName = (UI.getChildControl)(contents, "RadioButton_WarehouseName")
  local count = (UI.getChildControl)(contents, "StaticText_Count")
  radioButton:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  warehouseName:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  radioButton:SetPosX(5)
  warehouseName:SetPosX(15)
  warehouseName:SetShow(false)
  count:SetShow(false)
  if idx < self._separatorNumber then
    local territoryName = (self._territoryNameInfo)[idx]
    local territoryWarehouseCount = (((self._warehouseInfo)._territoryGroup)[idx])._count
    radioButton:SetText(territoryName .. "(" .. territoryWarehouseCount .. ")")
    radioButton:addInputEvent("Mouse_LUp", "FGlobal_SearchMenuWarehouse_TerritoryOpen(" .. idx .. ")")
    radioButton:SetShow(true)
    warehouseName:SetShow(false)
    count:SetShow(false)
    radioButton:SetCheck(idx == self._selectIndex)
  else
    radioButton:SetShow(false)
    warehouseName:SetShow(true)
    local waypointKey = idx - self._separatorNumber
    if waypointKey == self._selectWaypointKey then
      warehouseName:SetFontColor((Defines.Color).C_FFACE400)
      warehouseName:SetCheck(true)
    else
      warehouseName:SetFontColor((Defines.Color).C_FFC4BEBE)
      warehouseName:SetCheck(false)
    end
    local regionInfoWrapper = ToClient_getRegionInfoWrapperByWaypoint(waypointKey)
    warehouseName:SetText(regionInfoWrapper:getAreaName())
    local warehouseWrapper = warehouse_get(waypointKey)
    if warehouseWrapper == nil then
      return 
    end
    local itemCount = warehouseWrapper:getSize()
    local useMaxCount = warehouseWrapper:getUseMaxCount()
    count:SetText("(" .. itemCount .. "/" .. useMaxCount - 1 .. ")")
    count:SetShow(true)
    warehouseName:addInputEvent("Mouse_LUp", "PaGlobal_SearchMenuWarehouse:ClickOtherTownsWareHouse(" .. waypointKey .. ")")
  end
  -- DECOMPILER ERROR: 6 unprocessed JMP targets
end

FGlobal_SearchMenuWarehouse_TerritoryOpen = function(territoryKey, isFirstOpen)
  -- function num : 0_4
  local self = PaGlobal_SearchMenuWarehouse
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  for index = 0, self._maxTerritoryKeyCount - 1 do
    if ((self._warehouseInfo)._territoryGroup)[index] ~= nil then
      (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, index))
      if index == territoryKey then
        if self._selectIndex == territoryKey then
          self._selectIndex = -2
        else
          local maxTerritoryWarehouseCount = (((self._warehouseInfo)._territoryGroup)[index])._count
          for wIndex = 1, maxTerritoryWarehouseCount do
            warehouse_requestInfo((((self._warehouseInfo)._territoryGroup)[index])[wIndex])
            local waypointKey = (((self._warehouseInfo)._territoryGroup)[index])[wIndex] + self._separatorNumber
            ;
            (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, waypointKey))
          end
          self._selectIndex = territoryKey
        end
      end
    end
  end
  do
    if isFirstOpen then
      local currentWaypointKey = getCurrentWaypointKey()
      self._selectWaypointKey = currentWaypointKey
      PaGlobal_SearchMenuWarehouse:ClickOtherTownsWareHouse(currentWaypointKey)
      return 
    end
    if self._selectIndex >= 0 then
      self._selectWaypointKey = (((self._warehouseInfo)._territoryGroup)[self._selectIndex])[1]
      PaGlobal_SearchMenuWarehouse:ClickOtherTownsWareHouse(self._selectWaypointKey)
    end
  end
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SearchMenuWarehouse.ClickOtherTownsWareHouse = function(self, waypointKey)
  -- function num : 0_5
  local isCurrentTownsWarehouse = waypointKey == getCurrentWaypointKey()
  if isCurrentTownsWarehouse then
    Warehouse_OpenPanelFromDialog()
  else
    Warehouse_OpenPanelFromWorldmap(waypointKey, (CppEnums.WarehoouseFromType).eWarehoouseFromType_Worldmap)
    Panel_Window_Inventory:SetShow(false)
  end
  do
    local beforeWaypointKey = self._selectWaypointKey
    self._selectWaypointKey = waypointKey
    if beforeWaypointKey > 0 then
      ((self._ui)._list2):requestUpdateByKey(toInt64(0, beforeWaypointKey + self._separatorNumber))
    end
    ;
    ((self._ui)._list2):requestUpdateByKey(toInt64(0, waypointKey + self._separatorNumber))
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SearchMenuWarehouse.ClickCurrentTownsWareHouse = function(self)
  -- function num : 0_6
  self._selectIndex = -1
  self._selectWaypointKey = -1
  Warehouse_OpenPanelFromDialog()
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SearchMenuWarehouse.Open = function(self)
  -- function num : 0_7
  if ((self._ui).part_SearchMenuWarehouse):GetShow() == true or not _ContentsGroup_isAllWarehouse then
    return 
  end
  ;
  ((self._ui).part_SearchMenuWarehouse):SetShow(true)
  local warehouseCount = ToClient_FindWareHouse(getCurrentWaypointKey())
  if warehouseCount == 0 then
    return 
  end
  local currentWaypointKey = getCurrentWaypointKey()
  local currnetRegionInfoWrapper = ToClient_getRegionInfoWrapperByWaypoint(currentWaypointKey)
  local currentTerritoryKey = currnetRegionInfoWrapper:getTerritoryKeyRaw()
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._warehouseInfo)._territoryCount = 0
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._warehouseInfo)._territoryGroup = {}
  for index = 0, warehouseCount - 1 do
    local waypointKey = ToClient_getWareHouseWaypointKey(index)
    local regionInfoWrapper = ToClient_getRegionInfoWrapperByWaypoint(waypointKey)
    local territoryKey = regionInfoWrapper:getTerritoryKeyRaw()
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R12 in 'UnsetPending'

    if ((self._warehouseInfo)._territoryGroup)[territoryKey] == nil then
      (self._warehouseInfo)._territoryCount = (self._warehouseInfo)._territoryCount + 1
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R12 in 'UnsetPending'

      ;
      ((self._warehouseInfo)._territoryGroup)[territoryKey] = {}
      -- DECOMPILER ERROR at PC63: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (((self._warehouseInfo)._territoryGroup)[territoryKey])._count = 1
      -- DECOMPILER ERROR at PC67: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (((self._warehouseInfo)._territoryGroup)[territoryKey])[1] = waypointKey
      -- DECOMPILER ERROR at PC71: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (self._territoryNameInfo)[territoryKey] = regionInfoWrapper:getTerritoryName()
    else
      -- DECOMPILER ERROR at PC81: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (((self._warehouseInfo)._territoryGroup)[territoryKey])._count = (((self._warehouseInfo)._territoryGroup)[territoryKey])._count + 1
      -- DECOMPILER ERROR at PC89: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (((self._warehouseInfo)._territoryGroup)[territoryKey])[(((self._warehouseInfo)._territoryGroup)[territoryKey])._count] = waypointKey
    end
  end
  self._selectIndex = -1
  self._selectWaypointKey = -1
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  for index = 0, self._maxTerritoryKeyCount - 1 do
    if ((self._warehouseInfo)._territoryGroup)[index] ~= nil then
      (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, index))
    end
  end
  FGlobal_SearchMenuWarehouse_TerritoryOpen(currentTerritoryKey, true)
  ;
  ((self._ui).btn_MyWarehouse):SetCheck(true)
  ;
  ((self._ui).part_SearchMenuWarehouse):ComputePos()
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SearchMenuWarehouse.Close = function(self)
  -- function num : 0_8
  if ((self._ui).part_SearchMenuWarehouse):GetShow() == false then
    return 
  end
  ;
  ((self._ui).part_SearchMenuWarehouse):SetShow(false)
end

FGlobal_WarehouseTownListCheck = function()
  -- function num : 0_9
  if ToClient_WorldMapIsShow() then
    return 
  end
  local self = PaGlobal_SearchMenuWarehouse
  if Panel_Window_Delivery_Information:GetShow() or Panel_Window_Delivery_Request:GetShow() or not _ContentsGroup_isAllWarehouse then
    ((self._ui).part_SearchMenuWarehouse):SetShow(false)
  else
    ;
    ((self._ui).part_SearchMenuWarehouse):SetShow(true)
  end
end

PaGlobal_SearchMenuWarehouse:Init()
PaGlobal_SearchMenuWarehouse:registMessageHandler()

