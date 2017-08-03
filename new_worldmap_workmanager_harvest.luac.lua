-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_workmanager_harvest.luac 

-- params : ...
-- function num : 0
Panel_Harvest_WorkManager:setMaskingChild(true)
Panel_Harvest_WorkManager:setGlassBackground(true)
Panel_Harvest_WorkManager:TEMP_UseUpdateListSwap(true)
Panel_Harvest_WorkManager:ActiveMouseEventEffect(true)
local defalut_Control = {_title = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Title"), _btn_Close = (UI.getChildControl)(Panel_Harvest_WorkManager, "Button_Win_Close"), _btn_Question = (UI.getChildControl)(Panel_Harvest_WorkManager, "Button_Question"), _Button_DoWork = (UI.getChildControl)(Panel_Harvest_WorkManager, "Button_doWork"), 
_worker_List = {_BG = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_WorkerList_BG"), _Title = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_WorkerList_Title"), _Scroll = (UI.getChildControl)(Panel_Harvest_WorkManager, "Scroll_WorkerList"), _No_Worker = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_NoWorker"), 
_Button = {}
, 
_Progress = {}
, 
_ActionPoint = {}
, 
_RegionName = {}
, 
_Template = {_Button = (UI.getChildControl)(Panel_Harvest_WorkManager, "RadioButton_Worker"), _Progress = (UI.getChildControl)(Panel_Harvest_WorkManager, "Progress2_Worker_ActionPoint"), _ActionPoint = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Worker_ActionPoint"), _RegionName = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Worker_RegionName"), _rowMax = 10, _row_PosY_Gap = 2}
}
, 
_work_Info = {_BG = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_WorkInfo_BG"), _Title = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_WorkInfo_Title"), _Result_BG = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_WorkInfo_Result_BG"), _Result_Title = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_WorkInfo_Result_Title"), _Result_Icon_BG_1 = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_WorkInfo_Result_Icon_BG_1"), _Result_Icon_BG_2 = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_WorkInfo_Result_Icon_BG_2"), _Result_Icon = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_WorkInfo_Result_Icon"), _Result_Name = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_WorkInfo_Result_Name"), _Time_BG = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Estimated_Time_BG"), _Time_Value = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Estimated_Time_Value"), _Time_Count = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Estimated_Time_Count"), _Work_Count = (UI.getChildControl)(Panel_Harvest_WorkManager, "Button_Estimated_Work_Count"), _Move_BG = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_Estimated_Move_BG"), _Move_Line_1 = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_Estimated_Move_Line_1"), _Move_Distance_Text = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Estimated_MoveDistance_Text"), _Move_Distance_Value = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Estimated_MoveDistance_Value"), _Move_Speed_Text = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Estimated_MoveSpeed_Text"), _Move_Speed_Value = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Estimated_MoveSpeed_Value"), _Luck_BG = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_Estimated_Luck_BG"), _Luck_Text = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Estimated_Luck_Text"), _Luck_Value = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_Estimated_Luck_Value"), _Work_BG = (UI.getChildControl)(Panel_Harvest_WorkManager, "Static_WorkDesc_BG"), _Work_Volume_Text = (UI.getChildControl)(Panel_Harvest_WorkManager, "StaticText_WorkDesc_Text")}
}
;
(defalut_Control._btn_Question):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"HouseManageWork\" )")
;
(defalut_Control._btn_Question):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"HouseManageWork\", \"true\")")
;
(defalut_Control._btn_Question):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"HouseManageWork\", \"false\")")
defalut_Control.Init_Control = function(self)
  -- function num : 0_0
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._worker_List)._BG, (self._worker_List)._Title)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._worker_List)._BG, (self._worker_List)._Scroll)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._worker_List)._BG, (self._worker_List)._No_Worker)
  FGlobal_Set_Table_Control(self._worker_List, "_Button", "_Button", true, false)
  FGlobal_Set_Table_Control(self._worker_List, "_Progress", "_Button", true, false)
  FGlobal_Set_Table_Control(self._worker_List, "_ActionPoint", "_Button", true, false)
  FGlobal_Set_Table_Control(self._worker_List, "_RegionName", "_Button", true, false)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Title)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_BG)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Title)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Icon_BG_1)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Icon_BG_2)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Icon)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Name)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Time_BG)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Time_Value)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Time_Count)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_Count)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_BG)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Line_1)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Distance_Text)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Distance_Value)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Speed_Text)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Speed_Value)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Luck_BG)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Luck_Text)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Luck_Value)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_BG)
  FGlobal_AddChild(Panel_Harvest_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_Volume_Text)
end

defalut_Control:Init_Control()
defalut_Control.Init_Function = function(self)
  -- function num : 0_1
  (self._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_Harvest_WorkManager_Close()")
  ;
  (self._Button_DoWork):addInputEvent("Mouse_LUp", "HandleClick_Harvest_doWork()")
  ;
  ((self._worker_List)._BG):addInputEvent("Mouse_UpScroll", "HandleScroll_Harvest_Worker_List_UpDown(true)")
  ;
  ((self._worker_List)._BG):addInputEvent("Mouse_DownScroll", "HandleScroll_Harvest_Worker_List_UpDown(false)")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_UpScroll", "HandleScroll_Harvest_Worker_List_UpDown(true)")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_DownScroll", "HandleScroll_Harvest_Worker_List_UpDown(false)")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_LDown", "HandleScroll_Harvest_Worker_List_OnClick()")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_LUp", "HandleScroll_Harvest_Worker_List_OnClick()")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_UpScroll", "HandleScroll_Harvest_Worker_List_UpDown(true)")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_DownScroll", "HandleScroll_Harvest_Worker_List_UpDown(false)")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LDown", "HandleScroll_Harvest_Worker_List_OnClick()")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LUp", "HandleScroll_Harvest_Worker_List_OnClick()")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LPress", "HandleScroll_Harvest_Worker_List_OnClick()")
  for key,value in pairs((self._worker_List)._Button) do
    value:addInputEvent("Mouse_On", "HandleOn_Harvest_Worker_List(" .. key .. ")")
    value:addInputEvent("Mouse_Out", "HandleOut_Harvest_Worker_List()")
    value:addInputEvent("Mouse_UpScroll", "HandleScroll_Harvest_Worker_List_UpDown(true)")
    value:addInputEvent("Mouse_DownScroll", "HandleScroll_Harvest_Worker_List_UpDown(false)")
  end
end

defalut_Control:Init_Function()
local Work_Info = {_workKey = nil, _workableType = nil, _workVolum = nil, _position = nil, _result_name = nil, _result_Icon = nil, _result_Key = nil, _workingCount = 1}
Work_Info._setData = function(self, index)
  -- function num : 0_2 , upvalues : Work_Info
  return Work_Info:_setDataByIndex(index)
end

Work_Info._setDataByIndex = function(self, index)
  -- function num : 0_3 , upvalues : Work_Info, defalut_Control
  local temporaryWrapper = getTemporaryInformationWrapper()
  local householdDataWithInstallationWrapper = temporaryWrapper:getSelfTentWrapperByIndex(index)
  if householdDataWithInstallationWrapper == nil then
    return 
  end
  local tentWrapper = temporaryWrapper:getSelfTentWrapperByIndex(index)
  local tentPosX = tentWrapper:getSelfTentPositionX()
  local tentPosY = tentWrapper:getSelfTentPositionY()
  local tentPosZ = tentWrapper:getSelfTentPositionZ()
  local _position = float3(tentPosX, tentPosY, tentPosZ)
  local characterStaticStatusWrapper = householdDataWithInstallationWrapper:getHouseholdCharacterStaticStatusWrapper()
  if characterStaticStatusWrapper ~= nil then
    local _workName = characterStaticStatusWrapper:getName()
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R11 in 'UnsetPending'

    Work_Info._result_Name = _workName
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R11 in 'UnsetPending'

    Work_Info._position = float3(_position.x, _position.y, _position.z)
    local itemSSW = characterStaticStatusWrapper:getItemEnchantStatcStaticWrapper()
    if itemSSW ~= nil then
      ((defalut_Control._work_Info)._Result_Icon):ChangeTextureInfoName("icon/" .. itemSSW:getIconPath())
      -- DECOMPILER ERROR at PC56: Confused about usage of register: R12 in 'UnsetPending'

      Work_Info._result_Key = ((itemSSW:get())._key):get()
      ;
      ((defalut_Control._work_Info)._Result_Icon_BG_2):addInputEvent("Mouse_On", "Item_Tooltip_Show_HarvestResult()")
      ;
      ((defalut_Control._work_Info)._Result_Icon_BG_2):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
    end
  end
  do
    local regionWrapper = ToClient_getRegionInfoWrapperByPosition(_position)
    ;
    (defalut_Control._title):SetText(regionWrapper:getAreaName())
  end
end

local Worker_List = {
_data_Table = {}
, _rowMax = ((defalut_Control._worker_List)._Template)._rowMax, _contentRow = nil, _offsetIndex = nil, _offset_Max = nil, _selected_Worker = nil, _selected_Index = nil, _over_Index = nil}
local sortIndex = {}
local homeWayKey = {}
local sortDistanceValue = {}
local Worker_SortByRegionInfo = function()
  -- function num : 0_4 , upvalues : Worker_List, Work_Info, sortIndex, homeWayKey, sortDistanceValue
  local sortMethod = 0
  local waitingWorkerCount = 0
  local workerArray = (Array.new)()
  workerArray = getWaitWorkerFullList()
  for index = 1, #workerArray do
    local workerWrapperLua = getWorkerWrapper(workerArray[index], false)
    if workerWrapperLua ~= nil then
      if (CppEnums.NpcWorkingType).eNpcWorkingType_Count == workerWrapperLua:getWorkingType() and workerWrapperLua:getIsAuctionInsert() == false then
        waitingWorkerCount = waitingWorkerCount + 1
        local workerData = (Worker_List._data_Table)[waitingWorkerCount]
        local distance = ToClient_getCalculateMoveDistance(WorkerNo(workerData._workerNo), Work_Info._position) / 100
        local moveSpeed = workerData._moveSpeed
        local totalWorkTime = distance / moveSpeed * 2
        -- DECOMPILER ERROR at PC48: Confused about usage of register: R12 in 'UnsetPending'

        sortIndex[waitingWorkerCount] = Int64toInt32(totalWorkTime)
        -- DECOMPILER ERROR at PC54: Confused about usage of register: R12 in 'UnsetPending'

        homeWayKey[waitingWorkerCount] = ((Worker_List._data_Table)[waitingWorkerCount])._homeWaypoint
        -- DECOMPILER ERROR at PC56: Confused about usage of register: R12 in 'UnsetPending'

        sortDistanceValue[waitingWorkerCount] = distance
      else
        do
          do
            _PA_LOG("이문�\133", "index == " .. index .. " : 일하는중")
            -- DECOMPILER ERROR at PC65: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC65: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC65: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC65: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC65: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  if waitingWorkerCount == 0 then
    return 
  end
  local possibleWorkerCount = waitingWorkerCount
  for ii = 1, possibleWorkerCount do
    local temp = nil
    for i = possibleWorkerCount, 1, -1 do
      if i > 1 and sortIndex[i] < sortIndex[i - 1] then
        temp = (Worker_List._data_Table)[i]
        -- DECOMPILER ERROR at PC97: Confused about usage of register: R13 in 'UnsetPending'

        ;
        (Worker_List._data_Table)[i] = (Worker_List._data_Table)[i - 1]
        -- DECOMPILER ERROR at PC101: Confused about usage of register: R13 in 'UnsetPending'

        ;
        (Worker_List._data_Table)[i - 1] = temp
        temp = sortIndex[i]
        -- DECOMPILER ERROR at PC108: Confused about usage of register: R13 in 'UnsetPending'

        sortIndex[i] = sortIndex[i - 1]
        -- DECOMPILER ERROR at PC111: Confused about usage of register: R13 in 'UnsetPending'

        sortIndex[i - 1] = temp
        temp = sortDistanceValue[i]
        -- DECOMPILER ERROR at PC118: Confused about usage of register: R13 in 'UnsetPending'

        sortDistanceValue[i] = sortDistanceValue[i - 1]
        -- DECOMPILER ERROR at PC121: Confused about usage of register: R13 in 'UnsetPending'

        sortDistanceValue[i - 1] = temp
      end
    end
    if temp == nil then
      break
    end
  end
  do
    local temp = nil
    local workerDataSwap = function(index, sortCount)
    -- function num : 0_4_0 , upvalues : Worker_List, temp, sortDistanceValue
    if index ~= sortCount and ((Worker_List._data_Table)[index])._homeWaypoint ~= ((Worker_List._data_Table)[sortCount])._homeWaypoint then
      temp = (Worker_List._data_Table)[index]
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (Worker_List._data_Table)[index] = (Worker_List._data_Table)[sortCount]
      -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (Worker_List._data_Table)[sortCount] = temp
      temp = sortDistanceValue[index]
      -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

      sortDistanceValue[index] = sortDistanceValue[sortCount]
      -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

      sortDistanceValue[sortCount] = temp
    end
  end

    local sortByRegion = function(territoryKey)
    -- function num : 0_4_1 , upvalues : possibleWorkerCount, Worker_List, workerDataSwap, sortDistanceValue
    local sortTerritoryCount = 0
    local startValue = _sortCount + 1
    if possibleWorkerCount < startValue then
      return 
    end
    if territoryKey == 0 then
      for jj = startValue, possibleWorkerCount do
        if ((Worker_List._data_Table)[jj])._homeWaypoint > 0 and ((Worker_List._data_Table)[jj])._homeWaypoint <= 300 then
          if startValue ~= jj then
            workerDataSwap(jj, startValue + sortTerritoryCount)
          end
          _sortCount = _sortCount + 1
          sortTerritoryCount = sortTerritoryCount + 1
        end
      end
    else
      do
        if territoryKey == 1 then
          for jj = startValue, possibleWorkerCount do
            if ((Worker_List._data_Table)[jj])._homeWaypoint >= 301 and ((Worker_List._data_Table)[jj])._homeWaypoint <= 600 then
              if startValue ~= jj then
                workerDataSwap(jj, startValue + (sortTerritoryCount))
              end
              _sortCount = _sortCount + 1
              sortTerritoryCount = sortTerritoryCount + 1
            end
          end
        else
          do
            if territoryKey == 2 then
              for jj = startValue, possibleWorkerCount do
                if ((Worker_List._data_Table)[jj])._homeWaypoint >= 601 and ((Worker_List._data_Table)[jj])._homeWaypoint <= 1000 then
                  if startValue ~= jj then
                    workerDataSwap(jj, startValue + (sortTerritoryCount))
                  end
                  _sortCount = _sortCount + 1
                  sortTerritoryCount = sortTerritoryCount + 1
                end
              end
            else
              do
                if territoryKey == 3 then
                  for jj = startValue, possibleWorkerCount do
                    if ((Worker_List._data_Table)[jj])._homeWaypoint >= 1101 then
                      if startValue ~= jj then
                        workerDataSwap(jj, startValue + (sortTerritoryCount))
                      end
                      _sortCount = _sortCount + 1
                      sortTerritoryCount = sortTerritoryCount + 1
                    end
                  end
                end
                do
                  if sortTerritoryCount > 1 then
                    for ii = startValue + 1, startValue + (sortTerritoryCount) - 1 do
                      for jj = startValue + (sortTerritoryCount) - 1, startValue + 1, -1 do
                        if sortDistanceValue[jj] < sortDistanceValue[jj - 1] then
                          workerDataSwap(jj, jj - 1)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  end
end

Worker_List._setData = function(self)
  -- function num : 0_5 , upvalues : defalut_Control, Worker_SortByRegionInfo
  local sortMethod = 0
  local workerArray = (Array.new)()
  workerArray = getWaitWorkerFullList()
  self._data_Table = {}
  local _idx = 0
  for index = 1, #workerArray do
    local workerWrapper = getWorkerWrapper(workerArray[index], false)
    if workerWrapper ~= nil then
      if (CppEnums.NpcWorkingType).eNpcWorkingType_Count == workerWrapper:getWorkingType() and not workerWrapper:getIsAuctionInsert() then
        _idx = _idx + 1
        -- DECOMPILER ERROR at PC38: Confused about usage of register: R9 in 'UnsetPending'

        if (self._data_Table)[_idx] == nil then
          (self._data_Table)[_idx] = {}
        end
        local workerNo = workerArray[index]
        local moveSpeed = workerWrapper:getMoveSpeedWithSkill((CppEnums.NpcWorkingType).eNpcWorkingType_HarvestWorking, (CppEnums.eHouseUseType).count, 0) / 100
        local luck = workerWrapper:getLuckWithSkill((CppEnums.NpcWorkingType).eNpcWorkingType_HarvestWorking, (CppEnums.eHouseUseType).count, 0)
        local maxPoint = workerWrapper:getMaxActionPoint()
        local currentPoint = workerWrapper:getActionPoint()
        local homeWaypoint = workerWrapper:getHomeWaypoint()
        local regionInfo = ToClient_getRegionInfoWrapperByWaypoint(homeWaypoint)
        local workerGrade = workerWrapper:getGrade()
        local name = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. workerWrapper:getLevel() .. " " .. workerWrapper:getName()
        local regionName = "(<PAColor0xff868686>" .. regionInfo:getAreaName() .. "<PAOldColor>)"
        -- DECOMPILER ERROR at PC99: Confused about usage of register: R19 in 'UnsetPending'

        ;
        (self._data_Table)[_idx] = {_workerNo = workerNo, _name = name, _regionName = regionName, _moveSpeed = moveSpeed, _luck = luck / 10000, _maxPoint = maxPoint, _currentPoint = currentPoint, _homeWaypoint = homeWaypoint, _workerGrade = workerGrade}
      else
        do
          do
            _PA_LOG("이문�\133", "index == " .. index .. " : 일하는중")
            -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  local _offset_Max = _idx - self._rowMax
  if _offset_Max < 0 then
    _offset_Max = 0
  end
  self._offset_Max = _offset_Max
  self._offsetIndex = 0
  self._contentRow = _idx
  ;
  (UIScroll.SetButtonSize)((defalut_Control._worker_List)._Scroll, self._rowMax, self._contentRow)
  Worker_SortByRegionInfo()
end

Worker_List._updateSlot = function(self)
  -- function num : 0_6 , upvalues : defalut_Control, Worker_List
  FGlobal_Clear_Control((defalut_Control._worker_List)._Button)
  FGlobal_Clear_Control((defalut_Control._worker_List)._ActionPoint)
  FGlobal_Clear_Control((defalut_Control._worker_List)._Progress)
  FGlobal_Clear_Control((defalut_Control._worker_List)._RegionName)
  for index = 1, self._rowMax do
    local _dataIndex = self._offsetIndex + index
    local data = (self._data_Table)[_dataIndex]
    if data == nil then
      break
    end
    local name = data._name
    local regionName = data._regionName
    local actionPoint = tostring(data._currentPoint) .. "/" .. tostring(data._maxPoint)
    local preogressRate = (math.floor)(data._currentPoint / data._maxPoint * 100)
    local workerGrade = data._workerGrade
    ;
    (((defalut_Control._worker_List)._Button)[index]):SetFontColor(ConvertFromGradeToColor(workerGrade))
    ;
    (((defalut_Control._worker_List)._Button)[index]):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
    ;
    (((defalut_Control._worker_List)._Button)[index]):SetText(name)
    ;
    (((defalut_Control._worker_List)._RegionName)[index]):SetText(regionName)
    ;
    (((defalut_Control._worker_List)._Button)[index]):addInputEvent("Mouse_LUp", "Harvest_Worker_List_Select(" .. index .. ")")
    ;
    (((defalut_Control._worker_List)._ActionPoint)[index]):SetText(actionPoint)
    ;
    (((defalut_Control._worker_List)._Progress)[index]):SetProgressRate(preogressRate)
    ;
    (((defalut_Control._worker_List)._Button)[index]):SetShow(true)
    ;
    (((defalut_Control._worker_List)._ActionPoint)[index]):SetShow(true)
    ;
    (((defalut_Control._worker_List)._Progress)[index]):SetShow(true)
    ;
    (((defalut_Control._worker_List)._RegionName)[index]):SetShow(true)
    if Worker_List._selected_WorkerKey == data._workerNo then
      (((defalut_Control._worker_List)._Button)[index]):SetCheck(true)
      ;
      (((defalut_Control._worker_List)._ActionPoint)[index]):SetShow(true)
    else
      ;
      (((defalut_Control._worker_List)._Button)[index]):SetCheck(false)
      ;
      (((defalut_Control._worker_List)._ActionPoint)[index]):SetShow(false)
    end
  end
  do
    ;
    ((defalut_Control._worker_List)._Scroll):SetControlPos(self._offsetIndex / self._offset_Max)
    HandleOn_Harvest_Worker_List_Refresh()
  end
end

Harvest_Worker_List_Select = function(index)
  -- function num : 0_7 , upvalues : Worker_List, defalut_Control, Work_Info
  local selectedIndex = Worker_List._offsetIndex + index
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  if (Worker_List._data_Table)[selectedIndex] ~= nil then
    Worker_List._selected_Worker = ((Worker_List._data_Table)[selectedIndex])._workerNo
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

    Worker_List._selected_WorkerKey = ((Worker_List._data_Table)[selectedIndex])._workerNo
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

    Worker_List._selected_Index = selectedIndex
    ;
    ((defalut_Control._worker_List)._No_Worker):SetShow(false)
  else
    ;
    ((defalut_Control._worker_List)._No_Worker):SetShow(true)
  end
  if (Worker_List._data_Table)[selectedIndex] == nil then
    ((defalut_Control._work_Info)._Time_Count):SetShow(false)
    ;
    ((defalut_Control._work_Info)._Work_Count):SetShow(false)
  else
    if ((Worker_List._data_Table)[selectedIndex])._currentPoint > 0 then
      ((defalut_Control._work_Info)._Time_Count):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_BUILDING_ONCE"))
      ;
      ((defalut_Control._work_Info)._Time_Count):SetShow(false)
      ;
      ((defalut_Control._work_Info)._Work_Count):SetShow(false)
    else
      ;
      ((defalut_Control._work_Info)._Time_Count):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_BUILDING_ONCE"))
      ;
      ((defalut_Control._work_Info)._Time_Count):SetShow(false)
      ;
      ((defalut_Control._work_Info)._Work_Count):SetShow(false)
    end
  end
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R2 in 'UnsetPending'

  Work_Info._workingCount = 1
  ;
  ((defalut_Control._work_Info)._Time_Count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_BUILDING_DEFAULT", "getWorkingCount", Work_Info._workingCount))
  Worker_List:_updateSlot()
  Harvest_Work_Info_Update()
end

HandleOn_Harvest_Worker_List = function(index)
  -- function num : 0_8 , upvalues : Worker_List, defalut_Control
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  Worker_List._over_Index = index
  ;
  (((defalut_Control._worker_List)._ActionPoint)[index]):SetShow(true)
  Harvest_Work_Info_Update(true)
  local self = Worker_List
  local workerIndex = self._offsetIndex + index
  local workerArray = (Array.new)()
  workerArray = getWaitWorkerFullList()
  local workerWrapper = getWorkerWrapper(workerArray[workerIndex], false)
  if workerWrapper ~= nil then
    local uiBase = ((defalut_Control._worker_List)._Button)[index]
    FGlobal_ShowWorkerTooltipByWorkerNoRaw(((Worker_List._data_Table)[workerIndex])._workerNo, uiBase)
  end
end

HandleOut_Harvest_Worker_List = function()
  -- function num : 0_9 , upvalues : Worker_List
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  Worker_List._over_Index = nil
  Worker_List:_updateSlot()
  Harvest_Work_Info_Update()
  FGlobal_HideWorkerTooltip()
end

HandleOn_Harvest_Worker_List_Refresh = function()
  -- function num : 0_10 , upvalues : Worker_List
  if Worker_List._over_Index ~= nil then
    HandleOn_Harvest_Worker_List(Worker_List._over_Index)
  end
end

Harvest_Work_Info_Update = function(isWorkerOver)
  -- function num : 0_11 , upvalues : Work_Info, defalut_Control, Worker_List
  local name = Work_Info._result_Name
  ;
  ((defalut_Control._work_Info)._Result_Name):SetText(name)
  local workerIndex = Worker_List._selected_Index
  if isWorkerOver ~= nil and isWorkerOver == true then
    workerIndex = Worker_List._offsetIndex + Worker_List._over_Index
  end
  local workerData = (Worker_List._data_Table)[workerIndex]
  if workerData ~= nil then
    local distance = ToClient_getCalculateMoveDistance(WorkerNo(workerData._workerNo), Work_Info._position) / 100
    local workSpeed = workerData._workSpeed
    local moveSpeed = workerData._moveSpeed
    local luck = workerData._luck
    ;
    ((defalut_Control._work_Info)._Move_Distance_Value):SetText(": " .. (string.format)("%.0f", distance))
    ;
    ((defalut_Control._work_Info)._Move_Speed_Value):SetText(": " .. (string.format)("%.2f", moveSpeed))
    ;
    ((defalut_Control._work_Info)._Luck_Value):SetText(": " .. (string.format)("%.2f", luck))
    local totalWorkTime = distance / moveSpeed * 2
    ;
    ((defalut_Control._work_Info)._Time_Value):SetText(((Util.Time).timeFormatting)((math.floor)(totalWorkTime)))
  else
    do
      ;
      ((defalut_Control._work_Info)._Move_Distance_Value):SetText("--")
      ;
      ((defalut_Control._work_Info)._Move_Speed_Value):SetText("--")
      ;
      ((defalut_Control._work_Info)._Luck_Value):SetText("--")
      ;
      ((defalut_Control._work_Info)._Time_Value):SetText("--")
    end
  end
end

local Scroll_UpDown = function(isUp, _target)
  -- function num : 0_12
  if isUp == false then
    _target._offsetIndex = (math.min)(_target._offset_Max, _target._offsetIndex + 1)
  else
    _target._offsetIndex = (math.max)(0, _target._offsetIndex - 1)
  end
  _target:_updateSlot()
end

HandleScroll_Harvest_Worker_List_UpDown = function(isUp)
  -- function num : 0_13 , upvalues : Scroll_UpDown, Worker_List
  Scroll_UpDown(isUp, Worker_List)
end

local ScrollOnClick = function(_target, _scroll)
  -- function num : 0_14
  local _scroll_Button = _scroll:GetControlButton()
  local _scroll_Blank = _scroll:GetSizeY() - _scroll_Button:GetSizeY()
  local _scroll_Percent = _scroll_Button:GetPosY() / _scroll_Blank
  _target._offsetIndex = (math.floor)(_scroll_Percent * _target._offset_Max)
  _target:_updateSlot()
end

HandleScroll_Harvest_Worker_List_OnClick = function()
  -- function num : 0_15 , upvalues : ScrollOnClick, Worker_List, defalut_Control
  ScrollOnClick(Worker_List, (defalut_Control._worker_List)._Scroll)
end

Item_Tooltip_Show_HarvestResult = function()
  -- function num : 0_16 , upvalues : Work_Info, defalut_Control
  local staticStatusKey = Work_Info._result_Key
  local uiBase = (defalut_Control._work_Info)._Result_Icon_BG_2
  if staticStatusKey == nil or uiBase == nil then
    return 
  end
  local staticStatusWrapper = getItemEnchantStaticStatus(ItemEnchantKey(staticStatusKey))
  Panel_Tooltip_Item_Show(staticStatusWrapper, uiBase, true, false)
end

local _index = nil
FGlobal_Harvest_WorkManager_Open = function(index)
  -- function num : 0_17 , upvalues : Worker_List, Work_Info, _index
  local temporaryWrapper = getTemporaryInformationWrapper()
  local householdDataWithInstallationWrapper = temporaryWrapper:getSelfTentWrapperByIndex(index)
  if householdDataWithInstallationWrapper == nil then
    return 
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R3 in 'UnsetPending'

  Worker_List._selected_Worker = nil
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R3 in 'UnsetPending'

  Worker_List._selected_WorkerKey = nil
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R3 in 'UnsetPending'

  Worker_List._selected_Index = nil
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R3 in 'UnsetPending'

  Worker_List._over_Index = nil
  Work_Info:_setData(index)
  Worker_List:_setData()
  Worker_List:_updateSlot()
  Harvest_Worker_List_Select(1)
  Panel_Harvest_WorkManager:SetShow(true)
  _index = index
  if Panel_HarvestList:GetShow() then
    Panel_Harvest_WorkManager:SetPosX(getScreenSizeX() / 2 - Panel_Harvest_WorkManager:GetSizeX() / 2)
    Panel_Harvest_WorkManager:SetPosY(getScreenSizeY() / 2 - Panel_Harvest_WorkManager:GetSizeY() / 2)
  else
    Panel_Harvest_WorkManager:SetPosX(getScreenSizeX() / 2 - Panel_Harvest_WorkManager:GetSizeX() / 2)
    Panel_Harvest_WorkManager:SetPosY(getScreenSizeY() / 2 - Panel_Harvest_WorkManager:GetSizeY() / 2)
  end
end

FGlobal_Harvest_WorkManager_Close = function()
  -- function num : 0_18
  if ToClient_WorldMapIsShow() then
    FGlobal_WorldMapWindowEscape()
  else
    Panel_Harvest_WorkManager:SetShow(false)
  end
end

FGlobal_Harvest_WorkManager_Reset_Pos = function()
  -- function num : 0_19
  local PosX = (getScreenSizeX() - Panel_Harvest_WorkManager:GetSizeX()) / 2
  local PosY = (getScreenSizeY() - Panel_Harvest_WorkManager:GetSizeY()) / 2
  Panel_Harvest_WorkManager:SetPosX(PosX)
  Panel_Harvest_WorkManager:SetPosY(PosY)
end

HandleClick_Harvest_doWork = function()
  -- function num : 0_20 , upvalues : Worker_List, Work_Info, _index
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return 
  end
  if Worker_List._selected_Worker == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_RentHouseNoWorkingByWorkerNotSelect"))
    return 
  end
  local workingCount = Work_Info._workingCount
  local temporaryWrapper = getTemporaryInformationWrapper()
  local householdDataWithInstallationWrapper = temporaryWrapper:getSelfTentWrapperByIndex(_index)
  if householdDataWithInstallationWrapper == nil then
    return 
  end
  if ((Worker_List._data_Table)[Worker_List._selected_Index])._currentPoint < 2 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_HARVEST_MESSAGE_NEEDACTIONPOINT"))
    return 
  end
  local houseHoldNo = householdDataWithInstallationWrapper:getHouseholdNo()
  ToClient_requestStartHarvestWorking(houseHoldNo, WorkerNo(Worker_List._selected_Worker))
  Panel_Harvest_WorkManager:SetShow(false)
end

FromClient_Harvest_StopWork = function()
  -- function num : 0_21 , upvalues : Worker_List
  if Panel_Harvest_WorkManager:GetShow() then
    Worker_List:_setData()
    Worker_List:_updateSlot()
    if Worker_List._selected_Index == nil then
      Harvest_Worker_List_Select(1)
    end
  end
end

LimitWorkableCount_Harvest = function()
  -- function num : 0_22 , upvalues : Worker_List
  local workerActionPoint = ((Worker_List._data_Table)[Worker_List._selected_Index])._currentPoint
  return workerActionPoint
end

local set_Workable_Count = function(inputNumber)
  -- function num : 0_23 , upvalues : Work_Info, defalut_Control
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  Work_Info._workingCount = Int64toInt32(inputNumber)
  ;
  ((defalut_Control._work_Info)._Time_Count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_BUILDING_DEFAULT", "getWorkingCount", Work_Info._workingCount))
end

HandleClicked_WorkCount_Harvest = function()
  -- function num : 0_24 , upvalues : set_Workable_Count
  local s64_MaxWorkableCount = toInt64(0, LimitWorkableCount_Harvest())
  if s64_MaxWorkableCount <= toInt64(0, 0) then
    _PA_LOG("이문�\133", "일꾼�\180 작업�\160 �\152 없습니다.")
  else
    Panel_NumberPad_Show(true, s64_MaxWorkableCount, 0, set_Workable_Count, false)
  end
end

WorldMap_WorkerDataUpdateByHarvestWorking = function(workerNoRaw)
  -- function num : 0_25
  FGlobal_HarvestList_Update()
end

registerEvent("WorldMap_StopWorkerWorking", "FromClient_Harvest_StopWork")
registerEvent("WorldMap_WorkerDataUpdateByHarvestWorking", "WorldMap_WorkerDataUpdateByHarvestWorking")

