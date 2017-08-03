-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_workmanager_finance.luac 

-- params : ...
-- function num : 0
Panel_Finance_WorkManager:setMaskingChild(true)
Panel_Finance_WorkManager:setGlassBackground(true)
Panel_Finance_WorkManager:TEMP_UseUpdateListSwap(true)
Panel_Finance_WorkManager:ActiveMouseEventEffect(true)
local UI_TM = CppEnums.TextMode
local _position, _plantKey, wayPlant = nil, nil, nil
local _affiliatedTownKey = 0
local defalut_Control = {_title = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Title"), _btn_Close = (UI.getChildControl)(Panel_Finance_WorkManager, "Button_Win_Close"), _btn_Question = (UI.getChildControl)(Panel_Finance_WorkManager, "Button_Question"), _Button_DoWork = (UI.getChildControl)(Panel_Finance_WorkManager, "Button_doWork"), _Button_NoResource = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_NoResource"), 
_workInfo_Default = {_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_WorkInfo_Default_BG"), _Icon_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_WorkInfo_Default_Icon_BG"), _Icon = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_WorkInfo_Default_Icon"), _Type = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkInfo_Default_Type"), _Desc = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkInfo_Default_Desc")}
, 
_worker_List = {_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_WorkerList_BG"), _Title = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkerList_Title"), _Scroll = (UI.getChildControl)(Panel_Finance_WorkManager, "Scroll_WorkerList"), _No_Worker = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_NoWorker"), 
_Button = {}
, 
_Progress = {}
, 
_ActionPoint = {}
, 
_Template = {_Button = (UI.getChildControl)(Panel_Finance_WorkManager, "RadioButton_Worker"), _Progress = (UI.getChildControl)(Panel_Finance_WorkManager, "Progress2_Worker_ActionPoint"), _ActionPoint = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Worker_ActionPoint"), _rowMax = 11, _row_PosY_Gap = 2}
}
, 
_work_Info = {_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_WorkDetail_BG"), _Title = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkDetail_Title"), _Resource_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_WorkDetail_Resource_BG"), _Resource_Title = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkDetail_Resource_Title"), _Resource_Line_1 = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_WorkDetail_Resource_Line_1"), _Resource_Line_2 = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_WorkDetail_Resource_Line_2"), 
_Resource_Icon_BG = {}
, 
_Resource_Icon_Border = {}
, 
_Resource_Icon_Over = {}
, 
_Resource_Icon = {}
, 
_Resource_Count = {}
, 
_Template = {_Resource_Icon_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkDetail_Resource_Icon_BG"), _Resource_Icon_Border = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkDetail_Resource_Icon_Boder"), _Resource_Icon_Over = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkDetail_Resource_Icon_Over"), _Resource_Icon = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkDetail_Resource_Icon"), _Resource_Count = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_WorkDetail_Resource_Count"), _collumMax = 6, _collum_PosX_Gap = 2}
, _Time_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_Time_BG"), _Time_Value = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_Time_Value"), _Time_Line = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_Estimated_Time_Line"), _Work_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_Estimated_Work_BG"), _Work_Line_1 = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_Estimated_Work_Line_1"), _Work_Line_2 = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_Estimated_Work_Line_2"), _Work_Volume_Text = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_WorkVolum_Text"), _Work_Volume_Value = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_WorkVolum_Value"), _Work_Speed_Text = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_WorkSpeed_Text"), _Work_Speed_Value = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_WorkSpeed_Value"), _Move_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_Estimated_Move_BG"), _Move_Line_1 = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_Estimated_Move_Line_1"), _Move_Line_2 = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_Estimated_Move_Line_2"), _Move_Distance_Text = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_MoveDistance_Text"), _Move_Distance_Value = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_MoveDistance_Value"), _Move_Speed_Text = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_MoveSpeed_Text"), _Move_Speed_Value = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_MoveSpeed_Value"), _Luck_BG = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_Estimated_Luck_BG"), _Luck_Line = (UI.getChildControl)(Panel_Finance_WorkManager, "Static_Estimated_Luck_Line"), _Luck_Text = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_Luck_Text"), _Luck_Value = (UI.getChildControl)(Panel_Finance_WorkManager, "StaticText_Estimated_Luck_Value")}
}
;
(defalut_Control._btn_Question):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"HouseManageWork\" )")
;
(defalut_Control._btn_Question):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"HouseManageWork\", \"true\")")
;
(defalut_Control._btn_Question):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"HouseManageWork\", \"false\")")
defalut_Control.Init_Control = function(self)
  -- function num : 0_0 , upvalues : defalut_Control, UI_TM
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._workInfo_Default)._BG, (self._workInfo_Default)._Icon_BG)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._workInfo_Default)._BG, (self._workInfo_Default)._Icon)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._workInfo_Default)._BG, (self._workInfo_Default)._Type)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._workInfo_Default)._BG, (self._workInfo_Default)._Desc)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._worker_List)._BG, (self._worker_List)._Title)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._worker_List)._BG, (self._worker_List)._Scroll)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._worker_List)._BG, (self._worker_List)._No_Worker)
  FGlobal_Set_Table_Control(self._worker_List, "_Button", "_Button", true, false)
  FGlobal_Set_Table_Control(self._worker_List, "_Progress", "_Button", true, false)
  FGlobal_Set_Table_Control(self._worker_List, "_ActionPoint", "_Button", true, false)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Resource_BG)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Resource_Title)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Resource_Line_1)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Resource_Line_2)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Icon_BG", "_Resource_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Icon_Border", "_Resource_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Icon_Over", "_Resource_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Icon", "_Resource_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Count", "_Resource_Icon_BG", false, true)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Time_BG)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Time_Value)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Time_Line)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_BG)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_Line_1)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_Line_2)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_Volume_Text)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_Volume_Value)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_Speed_Text)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Work_Speed_Value)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_BG)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Line_1)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Line_2)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Distance_Text)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Distance_Value)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Speed_Text)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Move_Speed_Value)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Luck_BG)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Luck_Line)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Luck_Text)
  FGlobal_AddChild(Panel_Finance_WorkManager, (self._work_Info)._BG, (self._work_Info)._Luck_Value)
  ;
  ((defalut_Control._workInfo_Default)._Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
end

defalut_Control:Init_Control()
defalut_Control.Init_Function = function(self)
  -- function num : 0_1
  (self._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_Finance_WorkManager_Close()")
  ;
  (self._Button_DoWork):addInputEvent("Mouse_LUp", "HandleClick_Finance_doWork()")
  ;
  ((self._worker_List)._BG):addInputEvent("Mouse_UpScroll", "HandleScroll_Finance_Worker_List_UpDown(true)")
  ;
  ((self._worker_List)._BG):addInputEvent("Mouse_DownScroll", "HandleScroll_Finance_Worker_List_UpDown(false)")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_UpScroll", "HandleScroll_Finance_Worker_List_UpDown(true)")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_DownScroll", "HandleScroll_Finance_Worker_List_UpDown(false)")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_LDown", "HandleScroll_Finance_Worker_List_OnClick()")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_LUp", "HandleScroll_Finance_Worker_List_OnClick()")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_UpScroll", "HandleScroll_Finance_Worker_List_UpDown(true)")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_DownScroll", "HandleScroll_Finance_Worker_List_UpDown(false)")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LDown", "HandleScroll_Finance_Worker_List_OnClick()")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LUp", "HandleScroll_Finance_Worker_List_OnClick()")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LPress", "HandleScroll_Finance_Worker_List_OnClick()")
  for key,value in pairs((self._worker_List)._Button) do
    value:addInputEvent("Mouse_On", "HandleOn_Finance_Worker_List(" .. key .. ")")
    value:addInputEvent("Mouse_Out", "HandleOut_Finance_Worker_List()")
    value:addInputEvent("Mouse_UpScroll", "HandleScroll_Finance_Worker_List_UpDown(true)")
    value:addInputEvent("Mouse_DownScroll", "HandleScroll_Finance_Worker_List_UpDown(false)")
  end
  for key,value in pairs((self._work_Info)._Resource_Icon_Over) do
    value:addInputEvent("Mouse_On", "Item_Tooltip_Show_FinanceResource(" .. key .. ")")
    value:addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
  end
end

defalut_Control:Init_Function()
local Work_Info = {_plantKey = nil, _workKey = nil, _workableType = nil, _workVolum = nil, _position = nil, _finance_Icon = nil, _finance_Type = nil, _finance_Des = nil, 
_resource = {}
, _isCraftable = false}
Work_Info._setData = function(self)
  -- function num : 0_2 , upvalues : _plantKey, _position, _affiliatedTownKey, Work_Info
  local workableCnt = ToClient_getPlantWorkableListCount(_plantKey)
  for index = 1, workableCnt do
    local _workKey = ToClient_getPlantWorkableItemExchangeKeyByIndex(_plantKey, index - 1)
    local _workName = ToClient_getPlantWorkableItemExchangeDescriptionByIndex(_plantKey, index - 1)
    local esSSW = ToClient_getPlantWorkableItemExchangeWrapperByIndex(_plantKey, index - 1)
    if esSSW:isSet() then
      local esSS = esSSW:get()
      local _workVolum = Int64toInt32(ToClient_getPlantCorpProductionApply(_plantKey, esSS._productTime)) / 1000
      local _workableType = esSS._productCategory
      local itemStatic = (esSS:getFirstDropGroup()):getItemStaticStatus()
      local _finance_Icon = "icon/" .. esSSW:getIcon()
      local _finance_Type = esSSW:getDescription()
      local _finance_Des = esSSW:getDetailDescription()
      self._plantKey = _plantKey
      self._workKey = _workKey
      self._workableType = _workableType
      self._workVolum = _workVolum
      self._position = float3(_position.x, _position.y, _position.z)
      self._finance_Icon = _finance_Icon
      self._finance_Type = _finance_Type
      self._finance_Des = _finance_Des
      self._isCraftable = true
      self._resource = {}
      local eSSCount = getExchangeSourceNeedItemList(esSS, true)
      for idx = 1, eSSCount do
        local _idx = idx - 1
        local itemStaticInfomationWrapper = getExchangeSourceNeedItemByIndex(_idx)
        local itemStaticWrapper = itemStaticInfomationWrapper:getStaticStatus()
        local itemStatic = itemStaticWrapper:get()
        local itemKey = itemStaticInfomationWrapper:getKey()
        local _gradeType = itemStaticWrapper:getGradeType()
        local resourceKey = itemStatic._key
        local itemIcon = "icon/" .. getItemIconPath(itemStatic)
        local needCount = Int64toInt32(itemStaticInfomationWrapper:getCount_s64())
        local haveCount = 0
        if _affiliatedTownKey ~= 0 then
          haveCount = Int64toInt32(warehouse_getItemCount(_affiliatedTownKey, itemKey))
        end
        -- DECOMPILER ERROR at PC114: Confused about usage of register: R31 in 'UnsetPending'

        ;
        (self._resource)[idx] = {_itemKey = itemKey, _resourceKey = resourceKey, _itemIcon = itemIcon, _needCount = needCount, _haveCount = haveCount, _gradeType = _gradeType}
        if haveCount < needCount then
          self._isCraftable = false
        end
      end
    end
  end
  Work_Info:_Update()
end

Work_Info._Update = function(self)
  -- function num : 0_3 , upvalues : defalut_Control
  ((defalut_Control._workInfo_Default)._Icon):ChangeTextureInfoName(self._finance_Icon)
  ;
  ((defalut_Control._workInfo_Default)._Type):SetText(self._finance_Type)
  ;
  ((defalut_Control._workInfo_Default)._Desc):SetText(self._finance_Des)
  local _resource_SlotMax = ((defalut_Control._work_Info)._Template)._collumMax
  for idx = 1, _resource_SlotMax do
    local _data = (self._resource)[idx]
    if _data ~= nil then
      local gradeType = _data._gradeType
      if gradeType > 0 and gradeType <= #(UI.itemSlotConfig).borderTexture then
        (((defalut_Control._work_Info)._Resource_Icon_Border)[idx]):ChangeTextureInfoName((((UI.itemSlotConfig).borderTexture)[gradeType]).texture)
        local x1, y1, x2, y2 = setTextureUV_Func(((defalut_Control._work_Info)._Resource_Icon_Border)[idx], (((UI.itemSlotConfig).borderTexture)[gradeType]).x1, (((UI.itemSlotConfig).borderTexture)[gradeType]).y1, (((UI.itemSlotConfig).borderTexture)[gradeType]).x2, (((UI.itemSlotConfig).borderTexture)[gradeType]).y2)
        ;
        ((((defalut_Control._work_Info)._Resource_Icon_Border)[idx]):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((defalut_Control._work_Info)._Resource_Icon_Border)[idx]):setRenderTexture((((defalut_Control._work_Info)._Resource_Icon_Border)[idx]):getBaseTexture())
        ;
        (((defalut_Control._work_Info)._Resource_Icon_Border)[idx]):SetShow(true)
      else
        do
          ;
          (((defalut_Control._work_Info)._Resource_Icon_Border)[idx]):SetShow(false)
          ;
          (((defalut_Control._work_Info)._Resource_Icon)[idx]):ChangeTextureInfoName(_data._itemIcon)
          do
            do
              local resourceCount = tostring(_data._haveCount) .. "/" .. tostring(_data._needCount)
              if _data._haveCount < _data._needCount then
                resourceCount = "<PAColor0xFFDB2B2B>" .. resourceCount .. "<PAOldColor>"
              end
              ;
              (((defalut_Control._work_Info)._Resource_Count)[idx]):SetText(resourceCount)
              ;
              (((defalut_Control._work_Info)._Resource_Icon_BG)[idx]):SetShow(true)
              ;
              (((defalut_Control._work_Info)._Resource_Icon_Border)[idx]):SetShow(true)
              ;
              (((defalut_Control._work_Info)._Resource_Icon_Over)[idx]):SetShow(true)
              ;
              (((defalut_Control._work_Info)._Resource_Icon)[idx]):SetShow(true)
              ;
              (((defalut_Control._work_Info)._Resource_Count)[idx]):SetShow(true)
              if _data == nil then
                (((defalut_Control._work_Info)._Resource_Icon_BG)[idx]):SetShow(false)
                ;
                (((defalut_Control._work_Info)._Resource_Icon_Border)[idx]):SetShow(false)
                ;
                (((defalut_Control._work_Info)._Resource_Icon_Over)[idx]):SetShow(false)
                ;
                (((defalut_Control._work_Info)._Resource_Icon)[idx]):SetShow(false)
                ;
                (((defalut_Control._work_Info)._Resource_Count)[idx]):SetShow(false)
              end
              -- DECOMPILER ERROR at PC218: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC218: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC218: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC218: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC218: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC218: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  if self._isCraftable == true then
    (defalut_Control._Button_DoWork):SetShow(true)
    ;
    (defalut_Control._Button_NoResource):SetShow(false)
  else
    if self._isCraftable == false then
      (defalut_Control._Button_DoWork):SetShow(false)
      ;
      (defalut_Control._Button_NoResource):SetShow(true)
    end
  end
end

local Worker_List = {
_data_Table = {}
, _rowMax = ((defalut_Control._worker_List)._Template)._rowMax, _contentRow = nil, _offsetIndex = nil, _offset_Max = nil, _selected_Worker = nil, _selected_Index = nil, _over_Index = nil}
local workingTime = {}
local homeWayKey = {}
local sortDistanceValue = {}
local Worker_SortByRegionInfo = function()
  -- function num : 0_4 , upvalues : _plantKey, Work_Info, Worker_List, workingTime, homeWayKey, sortDistanceValue
  local workIndex = 0
  local esSSW = ToClient_getPlantWorkableItemExchangeWrapperByIndex(_plantKey, workIndex)
  local esSS = esSSW:get()
  local sortMethod = 0
  local waitingWorkerCount = ToClient_getPlantWaitWorkerListCount(Work_Info._plantKey, Work_Info._workableType, Work_Info._workKey, sortMethod)
  if waitingWorkerCount == 0 then
    return 
  end
  local possibleWorkerIndex = 0
  for index = 1, waitingWorkerCount do
    local npcWaitingWorker = ToClient_getPlantWaitWorkerByIndex(Work_Info._plantKey, index - 1)
    local workerNoRaw = (npcWaitingWorker:getWorkerNo()):get_s64()
    local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
    if ToClient_isWaitWorker(npcWaitingWorker) == true and workerWrapperLua:getIsAuctionInsert() == false then
      possibleWorkerIndex = possibleWorkerIndex + 1
      local workVolume = Int64toInt32(ToClient_getPlantCorpProductionApply(Work_Info._plantKey, esSS._productTime)) / 1000
      local distance = ToClient_getCalculateMoveDistance(((Worker_List._data_Table)[possibleWorkerIndex])._workerNo, Work_Info._position) / 100
      local workSpeed = ((Worker_List._data_Table)[possibleWorkerIndex])._workSpeed
      local moveSpeed = ((Worker_List._data_Table)[possibleWorkerIndex])._moveSpeed
      local luck = ((Worker_List._data_Table)[possibleWorkerIndex])._luck
      local workBaseTime = ToClient_getNpcWorkingBaseTime() / 1000
      local totalWorkTime = (math.ceil)(workVolume / workSpeed) * workBaseTime + distance / moveSpeed * 2
      -- DECOMPILER ERROR at PC92: Confused about usage of register: R20 in 'UnsetPending'

      workingTime[possibleWorkerIndex] = Int64toInt32(totalWorkTime)
      -- DECOMPILER ERROR at PC98: Confused about usage of register: R20 in 'UnsetPending'

      homeWayKey[possibleWorkerIndex] = ((Worker_List._data_Table)[possibleWorkerIndex])._homeWaypoint
      -- DECOMPILER ERROR at PC100: Confused about usage of register: R20 in 'UnsetPending'

      sortDistanceValue[possibleWorkerIndex] = distance
    end
  end
  local possibleWorkerCount = possibleWorkerIndex
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

  for ii = 1, possibleWorkerCount do
    local temp = nil
    for i = possibleWorkerCount, 1, -1 do
      if i > 1 and workingTime[i] < workingTime[i - 1] then
        temp = (Worker_List._data_Table)[i]
        -- DECOMPILER ERROR at PC135: Confused about usage of register: R18 in 'UnsetPending'

        ;
        (Worker_List._data_Table)[i] = (Worker_List._data_Table)[i - 1]
        -- DECOMPILER ERROR at PC139: Confused about usage of register: R18 in 'UnsetPending'

        ;
        (Worker_List._data_Table)[i - 1] = temp
        temp = workingTime[i]
        -- DECOMPILER ERROR at PC146: Confused about usage of register: R18 in 'UnsetPending'

        workingTime[i] = workingTime[i - 1]
        -- DECOMPILER ERROR at PC149: Confused about usage of register: R18 in 'UnsetPending'

        workingTime[i - 1] = temp
        temp = sortDistanceValue[i]
        -- DECOMPILER ERROR at PC156: Confused about usage of register: R18 in 'UnsetPending'

        sortDistanceValue[i] = sortDistanceValue[i - 1]
        -- DECOMPILER ERROR at PC159: Confused about usage of register: R18 in 'UnsetPending'

        sortDistanceValue[i - 1] = temp
      end
    end
    if temp == nil then
      break
    end
  end
  do
    local territory = {}
    if FGlobal_WayPointKey_Return() > 0 and FGlobal_WayPointKey_Return() <= 300 then
      territory[0] = true
      territory[1] = false
      territory[2] = false
      territory[3] = false
    else
      if FGlobal_WayPointKey_Return() >= 301 and FGlobal_WayPointKey_Return() <= 600 then
        territory[0] = false
        territory[1] = true
        territory[2] = false
        territory[3] = false
      else
        if FGlobal_WayPointKey_Return() >= 601 and FGlobal_WayPointKey_Return() <= 1000 then
          territory[0] = false
          territory[1] = false
          territory[2] = true
          territory[3] = false
        else
          if FGlobal_WayPointKey_Return() >= 1101 then
            territory[0] = false
            territory[1] = false
            territory[2] = false
            territory[3] = true
          end
        end
      end
    end
    local _sortCount = 0
    for ii = _sortCount + 1, possibleWorkerCount do
      if ((Worker_List._data_Table)[ii])._homeWaypoint == FGlobal_WayPointKey_Return() then
        _sortCount = _sortCount + 1
        if ii ~= _sortCount then
          workerDataSwap(ii, _sortCount)
        end
      end
    end
    local sortByRegion = function(territoryKey)
    -- function num : 0_4_1 , upvalues : _sortCount, possibleWorkerCount, Worker_List, workerDataSwap, sortDistanceValue
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
                    for ii = 1, sortTerritoryCount - 1 do
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

    if possibleWorkerCount ~= _sortCount then
      if territory[0] == true then
        sortByRegion(0)
        sortByRegion(1)
        sortByRegion(2)
        sortByRegion(3)
      else
        if territory[1] == true then
          sortByRegion(1)
          sortByRegion(0)
          sortByRegion(2)
          sortByRegion(3)
        else
          if territory[2] == true then
            sortByRegion(2)
            sortByRegion(1)
            sortByRegion(0)
            sortByRegion(3)
          else
            if territory[3] == true then
              sortByRegion(3)
              sortByRegion(1)
              sortByRegion(0)
              sortByRegion(2)
            end
          end
        end
      end
    end
  end
end

Worker_List._setData = function(self)
  -- function num : 0_5 , upvalues : Work_Info, defalut_Control, Worker_SortByRegionInfo
  local sortMethod = 0
  local waitingWorkerCount = ToClient_getPlantWaitWorkerListCount(Work_Info._plantKey, Work_Info._workableType, Work_Info._workKey, sortMethod)
  if waitingWorkerCount <= 0 then
    (defalut_Control._Button_NoResource):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_RENTHOUSE_WORKMANAGER_WORKERLIST_NOWORKER"))
  else
    ;
    (defalut_Control._Button_NoResource):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_RENTHOUSE_WORKMANAGER_BTN_DISABLEWORK"))
  end
  self._data_Table = {}
  local _idx = 0
  for Index = 1, waitingWorkerCount do
    local npcWaitingWorker = ToClient_getPlantWaitWorkerByIndex(Work_Info._plantKey, Index - 1)
    local workerNoRaw = (npcWaitingWorker:getWorkerNo()):get_s64()
    local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
    if ToClient_isWaitWorker(npcWaitingWorker) == true and workerWrapperLua:getIsAuctionInsert() == false then
      _idx = _idx + 1
      -- DECOMPILER ERROR at PC67: Confused about usage of register: R11 in 'UnsetPending'

      if (self._data_Table)[_idx] == nil then
        (self._data_Table)[_idx] = {}
      end
      local checkData = npcWaitingWorker:getStaticSkillCheckData()
      checkData:set((CppEnums.NpcWorkingType).eNpcWorkingType_PlantZone, houseUseType, (Work_Info._plantKey):getWaypointKey())
      checkData._diceCheckForceSuccess = true
      local firstWorkerNo = npcWaitingWorker:getWorkerNo()
      local workerNoChar = firstWorkerNo:get_s64()
      local npcWaitingWorkerSS = npcWaitingWorker:getWorkerStaticStatus()
      local workerNo = WorkerNo(workerNoChar)
      local houseUseType = (CppEnums.eHouseUseType).Count
      local workSpeed = npcWaitingWorker:getWorkEfficienceWithSkill(checkData, 2)
      local moveSpeed = npcWaitingWorker:getMoveSpeedWithSkill(checkData) / 100
      local luck = npcWaitingWorker:getLuckWithSkill(checkData)
      local maxPoint = npcWaitingWorkerSS._actionPoint
      local currentPoint = npcWaitingWorker:getActionPoint()
      local workerRegionWrapper = ToClient_getRegionInfoWrapper(npcWaitingWorker)
      local name = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. npcWaitingWorker:getLevel() .. " " .. getWorkerName(npcWaitingWorkerSS) .. "(<PAColor0xff868686>" .. workerRegionWrapper:getAreaName() .. "<PAOldColor>)"
      local homeWaypoint = npcWaitingWorker:getHomeWaypoint()
      local workerGrade = ((npcWaitingWorkerSS:getCharacterStaticStatus())._gradeType):get()
      -- DECOMPILER ERROR at PC152: Confused about usage of register: R26 in 'UnsetPending'

      ;
      (self._data_Table)[_idx] = {_workerNo = workerNo, _workerNo_s64 = workerNoChar, _workerNoChar = Int64toInt32(workerNoChar), _name = name, _workSpeed = workSpeed / 1000000, _moveSpeed = moveSpeed, _luck = luck / 10000, _maxPoint = maxPoint, _currentPoint = currentPoint, _homeWaypoint = homeWaypoint, _workerGrade = workerGrade}
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
  for index = 1, self._rowMax do
    local _dataIndex = self._offsetIndex + index
    local data = (self._data_Table)[_dataIndex]
    if data == nil then
      break
    end
    local name = data._name
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
    (((defalut_Control._worker_List)._Button)[index]):addInputEvent("Mouse_LUp", "Finance_Worker_List_Select(" .. index .. ")")
    ;
    (((defalut_Control._worker_List)._ActionPoint)[index]):SetText(actionPoint)
    ;
    (((defalut_Control._worker_List)._Progress)[index]):SetProgressRate(preogressRate)
    ;
    (((defalut_Control._worker_List)._Button)[index]):SetShow(true)
    ;
    (((defalut_Control._worker_List)._Progress)[index]):SetShow(true)
    if Worker_List._selected_WorkerKey == data._workerNoChar then
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
    HandleOn_Finance_Worker_List_Refresh()
  end
end

Finance_Worker_List_Select = function(index)
  -- function num : 0_7 , upvalues : Worker_List, _affiliatedTownKey, defalut_Control
  local selectedIndex = Worker_List._offsetIndex + index
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  if (Worker_List._data_Table)[selectedIndex] ~= nil then
    Worker_List._selected_Worker = ((Worker_List._data_Table)[selectedIndex])._workerNo
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

    Worker_List._selected_WorkerKey = ((Worker_List._data_Table)[selectedIndex])._workerNoChar
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

    Worker_List._selected_Index = selectedIndex
    _affiliatedTownKey = ((Worker_List._data_Table)[selectedIndex])._homeWaypoint
    warehouse_requestInfo(_affiliatedTownKey)
    FGlobal_Finance_WorkManager_Refresh()
    ;
    ((defalut_Control._worker_List)._No_Worker):SetShow(false)
  else
    ;
    ((defalut_Control._worker_List)._No_Worker):SetShow(true)
  end
  Worker_List:_updateSlot()
  Finance_Work_Info_Update()
end

HandleOn_Finance_Worker_List = function(index)
  -- function num : 0_8 , upvalues : Worker_List, defalut_Control
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  Worker_List._over_Index = index
  ;
  (((defalut_Control._worker_List)._ActionPoint)[index]):SetShow(true)
  Finance_Work_Info_Update(true)
  local self = Worker_List
  local workerIndex = self._offsetIndex + index
  local npcWaitingWorker = ToClient_getNpcWorkerByWorkerNo(((Worker_List._data_Table)[workerIndex])._workerNo_s64)
  if npcWaitingWorker ~= nil then
    local uiBase = ((defalut_Control._worker_List)._Button)[index]
    FGlobal_ShowWorkerTooltipByWorkerNoRaw(((Worker_List._data_Table)[workerIndex])._workerNo_s64, uiBase, false)
  end
end

HandleOut_Finance_Worker_List = function()
  -- function num : 0_9 , upvalues : Worker_List
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  Worker_List._over_Index = nil
  Worker_List:_updateSlot()
  Finance_Work_Info_Update()
  FGlobal_HideWorkerTooltip()
end

HandleOn_Finance_Worker_List_Refresh = function()
  -- function num : 0_10 , upvalues : Worker_List
  if Worker_List._over_Index ~= nil then
    HandleOn_Finance_Worker_List(Worker_List._over_Index)
  end
end

Finance_Work_Info_Update = function(isWorkerOver)
  -- function num : 0_11 , upvalues : Work_Info, defalut_Control, Worker_List
  local workVolume = Work_Info._workVolum
  ;
  ((defalut_Control._work_Info)._Work_Volume_Value):SetText((string.format)("%.2f", workVolume))
  local workerIndex = Worker_List._selected_Index
  if isWorkerOver == true then
    workerIndex = Worker_List._offsetIndex + Worker_List._over_Index
  end
  if (Worker_List._data_Table)[workerIndex] ~= nil then
    local distance = ToClient_getCalculateMoveDistance(((Worker_List._data_Table)[workerIndex])._workerNo, Work_Info._position) / 100
    local workSpeed = ((Worker_List._data_Table)[workerIndex])._workSpeed
    local moveSpeed = ((Worker_List._data_Table)[workerIndex])._moveSpeed
    local luck = ((Worker_List._data_Table)[workerIndex])._luck
    ;
    ((defalut_Control._work_Info)._Move_Distance_Value):SetText((string.format)("%.0f", distance))
    ;
    ((defalut_Control._work_Info)._Work_Speed_Value):SetText((string.format)("%.2f", workSpeed))
    ;
    ((defalut_Control._work_Info)._Move_Speed_Value):SetText((string.format)("%.2f", moveSpeed))
    ;
    ((defalut_Control._work_Info)._Luck_Value):SetText((string.format)("%.2f", luck))
    local workBaseTime = ToClient_getNpcWorkingBaseTime() / 1000
    local totalWorkTime = (math.ceil)(workVolume / workSpeed) * workBaseTime + distance / moveSpeed * 2
    ;
    ((defalut_Control._work_Info)._Time_Value):SetText(((Util.Time).timeFormatting)((math.floor)(totalWorkTime)))
  else
    do
      ;
      ((defalut_Control._work_Info)._Move_Distance_Value):SetText("--")
      ;
      ((defalut_Control._work_Info)._Work_Speed_Value):SetText("--")
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

HandleScroll_Finance_Worker_List_UpDown = function(isUp)
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

HandleScroll_Finance_Worker_List_OnClick = function()
  -- function num : 0_15 , upvalues : ScrollOnClick, Worker_List, defalut_Control
  ScrollOnClick(Worker_List, (defalut_Control._worker_List)._Scroll)
end

Item_Tooltip_Show_FinanceResource = function(idx)
  -- function num : 0_16 , upvalues : Work_Info, defalut_Control
  local staticStatusKey = ((Work_Info._resource)[idx])._resourceKey
  local uiBase = ((defalut_Control._work_Info)._Resource_Icon_Border)[idx]
  if staticStatusKey == nil or uiBase == nil then
    return 
  end
  local staticStatusWrapper = getItemEnchantStaticStatus(staticStatusKey)
  Panel_Tooltip_Item_Show(staticStatusWrapper, uiBase, true, false)
end

FGlobal_Finance_WorkManager_Open = function(node)
  -- function num : 0_17 , upvalues : Worker_List, _plantKey, _position, wayPlant, Work_Info, defalut_Control
  WorldMapPopupManager:push(Panel_Finance_WorkManager, true)
  if node == nil then
    return 
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  Worker_List._selected_Worker = nil
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  Worker_List._selected_WorkerKey = nil
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  Worker_List._selected_Index = nil
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  Worker_List._over_Index = nil
  _plantKey = node:getPlantKey()
  _position = (getPlant(_plantKey)):getPositionInGame()
  wayPlant = ToClient_getPlant(_plantKey)
  Work_Info:_setData()
  Worker_List:_setData()
  Worker_List:_updateSlot()
  Finance_Worker_List_Select(1)
  local nodeName = getExploreNodeName(node:getStaticStatus())
  ;
  (defalut_Control._title):SetText(nodeName)
end

FGlobal_Finance_WorkManager_Close = function()
  -- function num : 0_18
  FGlobal_WorldMapWindowEscape()
end

FGlobal_Finance_WorkManager_Reset_Pos = function()
  -- function num : 0_19
  local PosX = (getScreenSizeX() - Panel_Finance_WorkManager:GetSizeX()) / 2
  local PosY = (getScreenSizeY() - Panel_Finance_WorkManager:GetSizeY()) / 2
  Panel_Finance_WorkManager:SetPosX(PosX)
  Panel_Finance_WorkManager:SetPosY(PosY)
end

HandleClick_Finance_doWork = function()
  -- function num : 0_20 , upvalues : Worker_List, Work_Info, _affiliatedTownKey
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return 
  end
  if Worker_List._selected_Worker == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_RentHouseNoWorkingByWorkerNotSelect"))
    return 
  end
  local workingCount = 1
  local doWorkNow = ToClient_requestStartPlantWorkingToNpcWorker(Worker_List._selected_Worker, Work_Info._plantKey, Work_Info._workKey, workingCount)
  FGlobal_RedoWork(4, nil, Worker_List._selected_Worker, Work_Info._plantKey, Work_Info._workKey, nil, workingCount, nil, nil, _affiliatedTownKey)
  if doWorkNow then
    Panel_Finance_WorkManager:SetShow(false)
    FGlobal_ShowWorkingProgress(FGlobal_SelectedNode(), 1)
  end
end

FromClient_Finance_StopWork = function()
  -- function num : 0_21 , upvalues : Worker_List
  if Panel_Finance_WorkManager:GetShow() then
    Worker_List:_setData()
    Worker_List:_updateSlot()
    if Worker_List._selected_Index == nil then
      Finance_Worker_List_Select(1)
    end
  end
end

FGlobal_Finance_WorkManager_Refresh = function()
  -- function num : 0_22 , upvalues : Work_Info, Worker_List
  Work_Info:_setData()
  Worker_List:_setData()
  Work_Info:_Update()
  Worker_List:_updateSlot()
  Finance_Work_Info_Update()
end

FromClient_WareHouse_Update_ForFinance = function(affiliatedTownKey)
  -- function num : 0_23 , upvalues : _affiliatedTownKey
  if affiliatedTownKey == _affiliatedTownKey and Panel_Finance_WorkManager:GetShow() == true then
    FGlobal_Finance_WorkManager_Refresh()
  end
end

registerEvent("EventWarehouseUpdate", "FromClient_WareHouse_Update_ForFinance")
registerEvent("WorldMap_StopWorkerWorking", "FromClient_Finance_StopWork")

