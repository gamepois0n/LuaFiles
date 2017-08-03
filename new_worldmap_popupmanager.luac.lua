-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_popupmanager.luac 

-- params : ...
-- function num : 0
WorldMapMode = {WORLDMAP_EXPLORATION = 0, WORLDMAP_TOWN = 1, WORLDMAP_WORKING = 2}
WorldMapPopupManager = {_currentMode = -1, 
_scenePopupArray = {}
, 
_scenePopupFunctionList = {}
, 
_backtown = {}
}
local emptyFunctionList = {}
emptyFunctionList.beforePop = function(self)
  -- function num : 0_0
end

emptyFunctionList.afterPop = function(self)
  -- function num : 0_1
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

WorldMapPopupManager.increaseLayer = function(self, isAdd, functionList)
  -- function num : 0_2 , upvalues : emptyFunctionList
  local beforeMode = self._currentMode
  self._currentMode = beforeMode + 1
  if beforeMode < 0 then
    return 
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R4 in 'UnsetPending'

  if functionList ~= nil then
    (self._scenePopupFunctionList)[self._currentMode] = functionList
  else
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._scenePopupFunctionList)[self._currentMode] = emptyFunctionList
  end
  local popArray = (self._scenePopupArray)[beforeMode]
  if isAdd == true then
    return 
  end
  if popArray:length() ~= 0 then
    for key,value in pairs(popArray) do
      if (value._panel):IsUISubApp() == false then
        (value._panel):SetShow(false)
      end
    end
  end
end

-- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

WorldMapPopupManager.push = function(self, panel, isShow, openFunc, closeFunc)
  -- function num : 0_3
  local mode = self._currentMode
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R6 in 'UnsetPending'

  if (self._scenePopupArray)[mode] == nil then
    (self._scenePopupArray)[mode] = (Array.new)()
  end
  local popArray = (self._scenePopupArray)[mode]
  for key,value in pairs(popArray) do
    if panel == value then
      return 
    end
  end
  do
    if panel == Panel_HouseControl or panel == Panel_RentHouse_WorkManager or panel == Panel_LargeCraft_WorkManager or panel == Panel_Window_Warehouse then
      panel:SetShow(isShow, true)
    else
      panel:SetShow(isShow)
    end
    local item = {_panel = panel, _show = isShow, _openFunc = openFunc, _cloSefunc = closeFunc}
    ;
    ((self._scenePopupArray)[self._currentMode]):push_back(item)
  end
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

WorldMapPopupManager.popPanel = function(self)
  -- function num : 0_4
  local value = ((self._scenePopupArray)[self._currentMode]):pop_back()
  if (value._panel):IsUISubApp() == false then
    (value._panel):SetShow(false)
  end
  if value._cloSefunc ~= nil then
    (value._cloSefunc)()
  end
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

WorldMapPopupManager.pop = function(self)
  -- function num : 0_5 , upvalues : emptyFunctionList
  if self._currentMode < 0 then
    return false
  end
  local mode = self._currentMode
  if (self._scenePopupArray)[mode] == nil then
    self._currentMode = self._currentMode - 1
  end
  local popArray = (self._scenePopupArray)[mode]
  if (self._scenePopupFunctionList)[mode] ~= nil and ((self._scenePopupFunctionList)[mode]).beforePop ~= nil then
    ((self._scenePopupFunctionList)[mode]):beforePop()
  end
  local postWareHouseOn = false
  local check_Panel = nil
  if popArray:length() ~= 0 then
    for key,value in pairs(popArray) do
      check_Panel = value._panel
      -- DECOMPILER ERROR at PC64: Unhandled construct in 'MakeBoolean' P1

      if (value._panel == Panel_HouseControl or value._panel == Panel_RentHouse_WorkManager or value._panel == Panel_LargeCraft_WorkManager or value._panel == Panel_Window_Warehouse) and (value._panel):IsUISubApp() == false then
        (value._panel):SetShow(false, true)
      end
      if (value._panel):IsUISubApp() == false then
        (value._panel):SetShow(false)
      end
      if value._cloSefunc ~= nil then
        (value._cloSefunc)()
      end
      if value._panel == Panel_HouseControl then
        clear_HouseSelectedAni_byHouse()
        PaGlobal_TutorialManager:handleCloseHouseControl()
      else
        if value._panel == Panel_House_SellBuy_Condition then
          clear_HouseSelectedAni_bySellBuy()
        else
          if value._panel == Worldmap_Grand_GuildHouseControl then
            postWareHouseOn = true
          end
        end
      end
    end
  end
  do
    FGlobal_ClearWorldmapIconTooltip()
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._scenePopupArray)[mode] = (Array.new)()
    -- DECOMPILER ERROR at PC113: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._scenePopupFunctionList)[mode] = emptyFunctionList
    self._currentMode = self._currentMode - 1
    if self._currentMode >= 0 then
      if (self._scenePopupFunctionList)[self._currentMode] ~= nil and ((self._scenePopupFunctionList)[self._currentMode]).afterPop ~= nil then
        ((self._scenePopupFunctionList)[self._currentMode]):afterPop()
      end
      popArray = (self._scenePopupArray)[self._currentMode]
      for key,value in pairs(popArray) do
        -- DECOMPILER ERROR at PC168: Unhandled construct in 'MakeBoolean' P1

        if (value._panel == Panel_HouseControl or value._panel == Panel_RentHouse_WorkManager or value._panel == Panel_LargeCraft_WorkManager or value._panel == Panel_Window_Warehouse) and (value._panel):IsUISubApp() == false then
          (value._panel):SetShow(value._show, true)
        end
        if (value._panel):IsUISubApp() == false then
          (value._panel):SetShow(value._show)
        end
        if value._show == false and value._cloSefunc ~= nil then
          (value._cloSefunc)()
        else
          if value._show == true and value._openFunc ~= nil then
            (value._openFunc)()
          end
        end
        if value._panel == Panel_HouseControl then
          show_HouseSelectedAni_byHouse()
          if check_Panel == Panel_LargeCraft_WorkManager then
            HouseProgressSection_Set(eWorkType.largeCraft)
            FGlobal_Set_HousePanelPos(check_Panel)
          else
            if check_Panel == Panel_RentHouse_WorkManager then
              FGlobal_Set_HousePanelPos(check_Panel)
            end
          end
        else
          if value._panel == Panel_Window_Warehouse then
            FromClient_WarehouseUpdate()
          end
        end
      end
    end
    do
      Panel_Tooltip_Item_hideTooltip()
      FGlobal_InitWorkerTooltip()
      FGlobal_Hide_Tooltip_Work(workIndex, true)
      if postWareHouseOn then
        FGlobal_LoadWorldMap_WarehouseOpen()
      end
      return true
    end
  end
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

WorldMapPopupManager.clear = function(self)
  -- function num : 0_6
  if self._currentMode < 0 then
    return 
  end
  for mode = 0, self._currentMode do
    local popArray = (self._scenePopupArray)[mode]
    for key,value in pairs(popArray) do
      if (value._panel):IsUISubApp() == false then
        (value._panel):SetShow(false)
      end
    end
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._scenePopupArray)[mode] = (Array.new)()
  end
  self._currentMode = -1
end


