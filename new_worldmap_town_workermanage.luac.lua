-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_town_workermanage.luac 

-- params : ...
-- function num : 0
Panel_manageWorker:setMaskingChild(true)
Panel_manageWorker:setGlassBackground(true)
Panel_manageWorker:ActiveMouseEventEffect(true)
local UI_TYPE = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local UI_PP = CppEnums.PAUIMB_PRIORITY
local plantKey = nil
local Control_WorkerList = {}
local Control_RestoreItem = {}
local Worker_Table = {}
local RestoreItem_Table = {}
local WorkerTooltip_Index, ItemTooltip_Index = nil, nil
local waitingCancelIdx = -1
local waitingCancelWorkerNo = {}
eWorkerStateType = {waiting = 0, working = 1, transfer = 2}
local defaul_Control = {_Title = (UI.getChildControl)(Panel_manageWorker, "titlebar_manageWorker"), _List_BG = (UI.getChildControl)(Panel_manageWorker, "Static_WorkerList_BG"), _List_Scroll = (UI.getChildControl)(Panel_manageWorker, "WorkerList_ScrollBar"), _worker_BG = (UI.getChildControl)(Panel_manageWorker, "Static_workerBG"), _worker_CheckBox = (UI.getChildControl)(Panel_manageWorker, "button_workerList_checkBox"), _worker_Name = (UI.getChildControl)(Panel_manageWorker, "workerManage_workerName"), _worker_State = (UI.getChildControl)(Panel_manageWorker, "Button_workerState"), _worker_Move = (UI.getChildControl)(Panel_manageWorker, "Button_workerMove"), _worker_Redo = (UI.getChildControl)(Panel_manageWorker, "Button_React"), _worker_RestorePoint = (UI.getChildControl)(Panel_manageWorker, "Progress2_RestorePoint"), _worker_CurrentPoint = (UI.getChildControl)(Panel_manageWorker, "Progress2_CurrentPoint"), _List_Empty = (UI.getChildControl)(Panel_manageWorker, "StaticText_EmptySlot"), _buttonQuestion = (UI.getChildControl)(Panel_manageWorker, "Button_Question"), _closeButton = (UI.getChildControl)(Panel_manageWorker, "Button_Close"), _Item_BG = (UI.getChildControl)(Panel_manageWorker, "Static_Restore_Item_BG"), _Item_Slider = (UI.getChildControl)(Panel_manageWorker, "Slider_Restore_Item"), _Item_SliderBG = (UI.getChildControl)(Panel_manageWorker, "Static_Item_SliderBG"), _Btn_CloseItem = (UI.getChildControl)(Panel_manageWorker, "Button_Close_Item"), _Item_IconBG = (UI.getChildControl)(Panel_manageWorker, "Static_Restore_Item_Icone_BG"), _Item_Icone = (UI.getChildControl)(Panel_manageWorker, "Static_Restore_Item_Icone"), _Item_Count = (UI.getChildControl)(Panel_manageWorker, "StaticText_Item_Count"), _Item_RestoreValue = (UI.getChildControl)(Panel_manageWorker, "StaticText_Item_Restore_Value"), _Guide_Restore = (UI.getChildControl)(Panel_manageWorker, "StaticText_Guide_Restore"), _Slot_MaxCount = 5, _Slot_MinCount = 3, _Slot_GapY = 45, _Scroll_GapX = 7, _Item_MaxCount = 5, _Item_GapX = 49}
local btnControl = {_Fire = (UI.getChildControl)(Panel_manageWorker, "button_doWorkerFire")}
local scroll_Param = {_offsetIndex = 0, _offsetMax = 0, _slotMax = 0, _contentCount = 0}
local slider_Param = {_offsetIndex = 0, _offsetMax = 0, _slotMax = 0, _contentCount = 0}
local default_Size_Pos = {_Panel_SizeX = 0, _Panel_SizeY = 0, _Title_SizeX = 0, _List_BG_SpanX = 0, _List_BG_SpanY = 0, _List_BG_SizeY = 0, _Item_BG_SpanX = 0, _Item_BG_SpanY = 0}
default_Size_Pos.Init = function(self)
  -- function num : 0_0 , upvalues : defaul_Control
  self._Panel_SizeX = Panel_manageWorker:GetSizeX()
  self._Panel_SizeY = Panel_manageWorker:GetSizeY()
  self._Title_SizeX = (defaul_Control._Title):GetSizeX()
  self._List_BG_SpanX = ((defaul_Control._List_BG):GetSpanSize()).x
  self._List_BG_SpanY = ((defaul_Control._List_BG):GetSpanSize()).y
  self._List_BG_SizeY = (defaul_Control._List_BG):GetSizeY()
  self._Item_BG_SpanX = ((defaul_Control._Item_BG):GetSpanSize()).x
  self._Item_BG_SpanY = ((defaul_Control._Item_BG):GetSpanSize()).y
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

  defaul_Control._scroll_Button = (UI.getChildControl)(defaul_Control._List_Scroll, "Frame_ScrollBar_thumb")
  ;
  (defaul_Control._List_Scroll):ComputePos()
end

default_Size_Pos:Init()
defaul_Control.hide = function(self)
  -- function num : 0_1
  (self._worker_BG):SetShow(false)
  ;
  (self._worker_CheckBox):SetShow(false)
  ;
  (self._worker_Name):SetShow(false)
  ;
  (self._worker_State):SetShow(false)
  ;
  (self._worker_Move):SetShow(false)
  ;
  (self._worker_Redo):SetShow(false)
  ;
  (self._worker_RestorePoint):SetShow(false)
  ;
  (self._worker_CurrentPoint):SetShow(false)
  ;
  (self._List_Empty):SetShow(false)
  ;
  (self._Item_BG):SetShow(false)
  ;
  (self._Item_SliderBG):SetShow(false)
  ;
  (self._Btn_CloseItem):SetShow(false)
  ;
  (self._Item_IconBG):SetShow(false)
  ;
  (self._Item_Icone):SetShow(false)
  ;
  (self._Item_Count):SetShow(false)
  ;
  (self._Item_RestoreValue):SetShow(false)
end

WorldMapWindow_WaitWorkerFire = function()
  -- function num : 0_2 , upvalues : Worker_Table
  local _checked_Worker = {}
  for workerIndex,value in pairs(Worker_Table) do
    if value._isChecked == true then
      local index = #_checked_Worker + 1
      _checked_Worker[index] = value._WorkerNo
    end
  end
  for key,value in pairs(_checked_Worker) do
    local workerNo = value
    ToClient_requestDeleteMyWorker(workerNo)
  end
end

HandleClick_WorkerCheckBox = function(workerIndex, idx)
  -- function num : 0_3 , upvalues : Control_WorkerList, Worker_Table
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  if ((Control_WorkerList._worker_CheckBox)[idx]):IsCheck() and Worker_Table[workerIndex] ~= nil then
    (Worker_Table[workerIndex])._isChecked = true
  else
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

    if ((Control_WorkerList._worker_CheckBox)[idx]):IsCheck() == false and Worker_Table[workerIndex] ~= nil then
      (Worker_Table[workerIndex])._isChecked = false
    end
  end
end

Control_WorkerList.Init = function(self)
  -- function num : 0_4 , upvalues : defaul_Control, btnControl, UI_TYPE, default_Size_Pos, UI_TM
  (defaul_Control._List_BG):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, false)")
  ;
  (defaul_Control._List_BG):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, false)")
  ;
  (defaul_Control._List_Scroll):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, false)")
  ;
  (defaul_Control._List_Scroll):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, false)")
  ;
  (defaul_Control._List_Scroll):addInputEvent("Mouse_LDown", "Control_ScrollOnClick(false)")
  ;
  (defaul_Control._List_Scroll):addInputEvent("Mouse_LUp", "Control_ScrollOnClick(false)")
  ;
  (defaul_Control._scroll_Button):addInputEvent("Mouse_LPress", "Control_ScrollOnClick(false)")
  ;
  (defaul_Control._closeButton):addInputEvent("Mouse_LUp", "WorldMapWindow_CloseWaitWorkerManage()")
  ;
  (defaul_Control._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Worker\" )")
  ;
  (defaul_Control._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Worker\", \"true\")")
  ;
  (defaul_Control._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Worker\", \"false\")")
  ;
  (btnControl._Fire):addInputEvent("Mouse_LUp", "WorldMapWindow_WaitWorkerFire()")
  self._worker_BG = {}
  self._worker_CheckBox = {}
  self._worker_Name = {}
  self._worker_State = {}
  self._worker_Move = {}
  self._worker_Redo = {}
  self._List_Empty = {}
  self._worker_RestorePoint = {}
  self._worker_CurrentPoint = {}
  for idx = 0, defaul_Control._Slot_MaxCount - 1 do
    -- DECOMPILER ERROR at PC109: Confused about usage of register: R5 in 'UnsetPending'

    (self._worker_BG)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_STATIC, defaul_Control._List_BG, "Worker_BG_" .. tostring(idx))
    -- DECOMPILER ERROR at PC123: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._worker_RestorePoint)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_PROGRESS2, defaul_Control._List_BG, "Worker_RestorePoint_" .. tostring(idx))
    -- DECOMPILER ERROR at PC137: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._worker_CurrentPoint)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_PROGRESS2, defaul_Control._List_BG, "Worker_CurrentPoint_" .. tostring(idx))
    -- DECOMPILER ERROR at PC151: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._worker_CheckBox)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_CHECKBUTTON, defaul_Control._List_BG, "Worker_CheckBox_" .. tostring(idx))
    -- DECOMPILER ERROR at PC165: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._worker_Name)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_STATICTEXT, defaul_Control._List_BG, "Worker_Name_" .. tostring(idx))
    -- DECOMPILER ERROR at PC179: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._worker_State)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_BUTTON, defaul_Control._List_BG, "Worker_State_" .. tostring(idx))
    -- DECOMPILER ERROR at PC193: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._worker_Move)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_BUTTON, defaul_Control._List_BG, "Worker_Move" .. tostring(idx))
    -- DECOMPILER ERROR at PC207: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._worker_Redo)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_BUTTON, defaul_Control._List_BG, "Worker_ReDo_" .. tostring(idx))
    -- DECOMPILER ERROR at PC221: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._List_Empty)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_STATICTEXT, defaul_Control._List_BG, "Worker_Empty_" .. tostring(idx))
    CopyBaseProperty(defaul_Control._worker_BG, (self._worker_BG)[idx])
    CopyBaseProperty(defaul_Control._worker_CheckBox, (self._worker_CheckBox)[idx])
    CopyBaseProperty(defaul_Control._worker_Name, (self._worker_Name)[idx])
    CopyBaseProperty(defaul_Control._worker_State, (self._worker_State)[idx])
    CopyBaseProperty(defaul_Control._worker_Move, (self._worker_Move)[idx])
    CopyBaseProperty(defaul_Control._worker_Redo, (self._worker_Redo)[idx])
    CopyBaseProperty(defaul_Control._worker_RestorePoint, (self._worker_RestorePoint)[idx])
    CopyBaseProperty(defaul_Control._worker_CurrentPoint, (self._worker_CurrentPoint)[idx])
    CopyBaseProperty(defaul_Control._List_Empty, (self._List_Empty)[idx])
    ;
    ((self._worker_BG)[idx]):SetSpanSize((((self._worker_BG)[idx]):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, (((self._worker_BG)[idx]):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY + defaul_Control._Slot_GapY * idx)
    ;
    ((self._worker_CheckBox)[idx]):SetSpanSize((((self._worker_CheckBox)[idx]):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, (((self._worker_CheckBox)[idx]):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY + defaul_Control._Slot_GapY * idx)
    ;
    ((self._worker_Name)[idx]):SetSpanSize((((self._worker_Name)[idx]):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, (((self._worker_Name)[idx]):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY + defaul_Control._Slot_GapY * idx)
    ;
    ((self._worker_State)[idx]):SetSpanSize((((self._worker_State)[idx]):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, (((self._worker_State)[idx]):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY + defaul_Control._Slot_GapY * idx)
    ;
    ((self._worker_Move)[idx]):SetSpanSize((((self._worker_Move)[idx]):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, (((self._worker_Move)[idx]):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY + defaul_Control._Slot_GapY * idx)
    ;
    ((self._worker_Redo)[idx]):SetSpanSize((((self._worker_Redo)[idx]):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, (((self._worker_Redo)[idx]):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY + defaul_Control._Slot_GapY * idx)
    ;
    ((self._worker_RestorePoint)[idx]):SetSpanSize((((self._worker_RestorePoint)[idx]):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, (((self._worker_RestorePoint)[idx]):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY + defaul_Control._Slot_GapY * idx + 5)
    ;
    ((self._worker_CurrentPoint)[idx]):SetSpanSize((((self._worker_CurrentPoint)[idx]):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, (((self._worker_CurrentPoint)[idx]):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY + defaul_Control._Slot_GapY * idx + 5)
    ;
    ((self._List_Empty)[idx]):SetSpanSize((((self._List_Empty)[idx]):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, (((self._List_Empty)[idx]):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY + defaul_Control._Slot_GapY * idx)
    ;
    ((self._worker_BG)[idx]):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, false)")
    ;
    ((self._worker_BG)[idx]):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, false)")
    ;
    ((self._worker_State)[idx]):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, false)")
    ;
    ((self._worker_State)[idx]):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, false)")
    ;
    ((self._worker_Move)[idx]):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, false)")
    ;
    ((self._worker_Move)[idx]):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, false)")
    ;
    ((self._worker_Redo)[idx]):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, false)")
    ;
    ((self._worker_Redo)[idx]):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, false)")
    ;
    ((self._List_Empty)[idx]):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, false)")
    ;
    ((self._List_Empty)[idx]):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, false)")
    ;
    ((self._List_Empty)[idx]):addInputEvent("Mouse_Out", "HandleOut_WorkerTooltip(" .. idx .. ", false)")
  end
  ;
  (defaul_Control._Guide_Restore):SetShow(false)
  ;
  (defaul_Control._Guide_Restore):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (defaul_Control._Guide_Restore):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTOREGUIDE"))
end

Control_WorkerList:Init()
Control_RestoreItem.Init = function(self)
  -- function num : 0_5 , upvalues : UI_TYPE, defaul_Control, default_Size_Pos
  self._Item_BG = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_STATIC, defaul_Control._List_BG, "Item_SliderBG")
  CopyBaseProperty(defaul_Control._Item_BG, self._Item_BG)
  ;
  (self._Item_BG):SetSpanSize(((self._Item_BG):GetSpanSize()).x - default_Size_Pos._List_BG_SpanX, ((self._Item_BG):GetSpanSize()).y - default_Size_Pos._List_BG_SpanY)
  ;
  (self._Item_BG):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, true)")
  ;
  (self._Item_BG):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, true)")
  ;
  (self._Item_BG):AddChild(defaul_Control._Item_Slider)
  Panel_manageWorker:RemoveControl(defaul_Control._Item_Slider)
  self._Item_Slider = defaul_Control._Item_Slider
  self._Btn_CloseItem = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_BUTTON, self._Item_BG, "Btn_CloseItem")
  self._Item_SliderBG = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_STATIC, self._Item_BG, "Item_SliderBG")
  CopyBaseProperty(defaul_Control._Btn_CloseItem, self._Btn_CloseItem)
  CopyBaseProperty(defaul_Control._Item_SliderBG, self._Item_SliderBG)
  ;
  (self._Item_Slider):SetSpanSize(((self._Item_Slider):GetSpanSize()).x - default_Size_Pos._Item_BG_SpanX, ((self._Item_Slider):GetSpanSize()).y - default_Size_Pos._Item_BG_SpanY)
  ;
  (self._Item_SliderBG):SetSpanSize(((self._Item_SliderBG):GetSpanSize()).x - default_Size_Pos._Item_BG_SpanX, ((self._Item_SliderBG):GetSpanSize()).y - default_Size_Pos._Item_BG_SpanY)
  ;
  (self._Btn_CloseItem):SetSpanSize(((self._Btn_CloseItem):GetSpanSize()).x - default_Size_Pos._Item_BG_SpanX, ((self._Btn_CloseItem):GetSpanSize()).y - default_Size_Pos._Item_BG_SpanY)
  ;
  (self._Btn_CloseItem):addInputEvent("Mouse_LUp", "Control_RestoreItem_Reset()")
  self._Item_Slider_Button = (UI.getChildControl)(self._Item_Slider, "Slider_Restore_Item_Button")
  ;
  (self._Item_Slider):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, true)")
  ;
  (self._Item_Slider):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, true)")
  ;
  (self._Item_Slider_Button):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, true)")
  ;
  (self._Item_Slider_Button):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, true)")
  ;
  (self._Item_Slider):addInputEvent("Mouse_LDown", "Control_ScrollOnClick(true)")
  ;
  (self._Item_Slider):addInputEvent("Mouse_LUp", "Control_ScrollOnClick(true)")
  ;
  (self._Item_Slider_Button):addInputEvent("Mouse_LPress", "Control_ScrollOnClick(true)")
  self._Item_IconBG = {}
  self._Item_Icone = {}
  self._Item_Count = {}
  self._Item_RestoreValue = {}
  for idx = 0, defaul_Control._Item_MaxCount - 1 do
    -- DECOMPILER ERROR at PC203: Confused about usage of register: R5 in 'UnsetPending'

    (self._Item_IconBG)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_STATIC, self._Item_BG, "Item_Icon_BG_" .. tostring(idx))
    -- DECOMPILER ERROR at PC216: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._Item_Icone)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_STATIC, self._Item_BG, "Item_Icon_" .. tostring(idx))
    -- DECOMPILER ERROR at PC229: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._Item_Count)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_STATICTEXT, self._Item_BG, "Item_Count_" .. tostring(idx))
    -- DECOMPILER ERROR at PC242: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._Item_RestoreValue)[idx] = (UI.createControl)(UI_TYPE.PA_UI_CONTROL_STATICTEXT, self._Item_BG, "Item_RestoreValue_" .. tostring(idx))
    CopyBaseProperty(defaul_Control._Item_IconBG, (self._Item_IconBG)[idx])
    CopyBaseProperty(defaul_Control._Item_Icone, (self._Item_Icone)[idx])
    CopyBaseProperty(defaul_Control._Item_Count, (self._Item_Count)[idx])
    CopyBaseProperty(defaul_Control._Item_RestoreValue, (self._Item_RestoreValue)[idx])
    ;
    ((self._Item_IconBG)[idx]):SetSpanSize((((self._Item_IconBG)[idx]):GetSpanSize()).x - default_Size_Pos._Item_BG_SpanX + defaul_Control._Item_GapX * idx, (((self._Item_IconBG)[idx]):GetSpanSize()).y - default_Size_Pos._Item_BG_SpanY)
    ;
    ((self._Item_Icone)[idx]):SetSpanSize((((self._Item_Icone)[idx]):GetSpanSize()).x - default_Size_Pos._Item_BG_SpanX + defaul_Control._Item_GapX * idx, (((self._Item_Icone)[idx]):GetSpanSize()).y - default_Size_Pos._Item_BG_SpanY)
    ;
    ((self._Item_Count)[idx]):SetSpanSize((((self._Item_Count)[idx]):GetSpanSize()).x - default_Size_Pos._Item_BG_SpanX + defaul_Control._Item_GapX * idx, (((self._Item_Count)[idx]):GetSpanSize()).y - default_Size_Pos._Item_BG_SpanY)
    ;
    ((self._Item_RestoreValue)[idx]):SetSpanSize((((self._Item_RestoreValue)[idx]):GetSpanSize()).x - default_Size_Pos._Item_BG_SpanX + defaul_Control._Item_GapX * idx, (((self._Item_RestoreValue)[idx]):GetSpanSize()).y - default_Size_Pos._Item_BG_SpanY)
    ;
    ((self._Item_Icone)[idx]):addInputEvent("Mouse_RUp", "HandleClick_RestoreItem(" .. idx .. ")")
    ;
    ((self._Item_Icone)[idx]):addInputEvent("Mouse_On", "HandleOn_RestoreItemTooltip(" .. idx .. ")")
    ;
    ((self._Item_Icone)[idx]):addInputEvent("Mouse_Out", "HandleOut_RestoreItemTooltip(" .. idx .. ")")
    ;
    ((self._Item_Icone)[idx]):addInputEvent("Mouse_UpScroll", "Control_Scroll(true, true)")
    ;
    ((self._Item_Icone)[idx]):addInputEvent("Mouse_DownScroll", "Control_Scroll(false, true)")
  end
  self._saveIndex = nil
  ;
  (self._Item_BG):SetShow(false)
end

Control_RestoreItem:Init()
defaul_Control:hide()
Control_WorkerList.SetControl = function(self, waitWorkerCount, maxWorkerCount)
  -- function num : 0_6 , upvalues : defaul_Control, scroll_Param, default_Size_Pos, btnControl
  (defaul_Control._Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_MANAGE") .. " (" .. waitWorkerCount .. "/" .. maxWorkerCount .. ")")
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R3 in 'UnsetPending'

  scroll_Param._contentCount = maxWorkerCount
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R3 in 'UnsetPending'

  scroll_Param._offsetMax = maxWorkerCount - defaul_Control._Slot_MaxCount
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

  if scroll_Param._offsetMax < 0 then
    scroll_Param._offsetMax = 0
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R3 in 'UnsetPending'

    scroll_Param._slotMax = maxWorkerCount
  else
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R3 in 'UnsetPending'

    scroll_Param._slotMax = defaul_Control._Slot_MaxCount
  end
  local list_SizeY_Add = 0
  local panel_SizeX_Add = 0
  if defaul_Control._Slot_MaxCount < maxWorkerCount then
    list_SizeY_Add = defaul_Control._Slot_GapY * (defaul_Control._Slot_MaxCount - defaul_Control._Slot_MinCount) + 15
    panel_SizeX_Add = defaul_Control._Scroll_GapX
  else
    if maxWorkerCount == defaul_Control._Slot_MaxCount then
      list_SizeY_Add = defaul_Control._Slot_GapY * (defaul_Control._Slot_MaxCount - defaul_Control._Slot_MinCount) + 15
    else
      if maxWorkerCount < defaul_Control._Slot_MaxCount and defaul_Control._Slot_MinCount < maxWorkerCount then
        list_SizeY_Add = defaul_Control._Slot_GapY * (maxWorkerCount - defaul_Control._Slot_MinCount) + 15
      end
    end
  end
  Panel_manageWorker:SetSize(default_Size_Pos._Panel_SizeX + panel_SizeX_Add, default_Size_Pos._Panel_SizeY + (list_SizeY_Add))
  ;
  (defaul_Control._List_BG):SetSize((defaul_Control._List_BG):GetSizeX(), default_Size_Pos._List_BG_SizeY + (list_SizeY_Add))
  ;
  (defaul_Control._Title):SetSize(default_Size_Pos._Title_SizeX + panel_SizeX_Add, (defaul_Control._Title):GetSizeY())
  ;
  (defaul_Control._List_Scroll):SetSize((defaul_Control._List_Scroll):GetSizeX(), (defaul_Control._List_BG):GetSizeY())
  ;
  (btnControl._Fire):ComputePos()
  ;
  (defaul_Control._buttonQuestion):ComputePos()
  ;
  (defaul_Control._closeButton):ComputePos()
  Panel_manageWorker:ComputePos()
end

Control_RestoreItem_Reset = function()
  -- function num : 0_7 , upvalues : Control_RestoreItem, defaul_Control, btnControl, scroll_Param, Control_WorkerList
  (Control_RestoreItem._Item_BG):SetShow(false)
  ;
  (Control_RestoreItem._Item_Slider):SetShow(false)
  ;
  (defaul_Control._Guide_Restore):SetShow(false)
  ;
  (btnControl._Fire):SetShow(true)
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

  if scroll_Param._contentCount < scroll_Param._offsetIndex + scroll_Param._slotMax then
    scroll_Param._offsetIndex = scroll_Param._contentCount - scroll_Param._slotMax
  end
  Control_WorkerList:UpdateSlot(0, false)
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

  Control_RestoreItem._saveIndex = nil
end

Control_RestoreItem.InsertControl = function(self, idx, isRefresh)
  -- function num : 0_8 , upvalues : slider_Param, Worker_Table, Control_WorkerList, scroll_Param, defaul_Control, Control_RestoreItem, btnControl
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R3 in 'UnsetPending'

  if slider_Param._contentCount == 0 then
    (Worker_Table[idx])._State_Text = "<PAColor0xffc4bebe>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_WAIT") .. "<PAOldColor>"
    ;
    ((Control_WorkerList._worker_State)[idx]):SetText("<PAColor0xfffeff99>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE") .. "<PAOldColor>")
    if (self._Item_BG):GetShow() then
      Control_RestoreItem_Reset()
    else
      if isRefresh == false then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_NOITEM"))
      end
      HandleOut_RestoreItemTooltip(nil)
    end
    self._saveIndex = nil
    return 
  end
  self._saveIndex = idx
  if scroll_Param._slotMax - 1 < idx + 2 then
    local newPosition = (math.max)(defaul_Control._Slot_MinCount, scroll_Param._slotMax) - 3
    local adjust = idx - newPosition
    -- DECOMPILER ERROR at PC72: Confused about usage of register: R5 in 'UnsetPending'

    if isRefresh == false then
      scroll_Param._offsetIndex = scroll_Param._offsetIndex + adjust
    end
    idx = newPosition
    Control_WorkerList:UpdateSlot(idx + 1, true)
  else
    do
      if idx + 2 < scroll_Param._slotMax - 1 then
        Control_WorkerList:UpdateSlot(idx + 1, true)
      else
        Control_WorkerList:clear(idx + 1)
      end
      ;
      ((Control_WorkerList._worker_State)[idx]):SetText("<PAColor0xfffeff99>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE") .. "<PAOldColor>")
      -- DECOMPILER ERROR at PC110: Confused about usage of register: R3 in 'UnsetPending'

      Control_RestoreItem.Index = idx
      ;
      (self._Item_BG):SetSpanSize(((self._Item_BG):GetSpanSize()).x, (((Control_WorkerList._worker_BG)[idx + 1]):GetSpanSize()).y + 5)
      ;
      (self._Item_BG):SetShow(true)
      ;
      (defaul_Control._Guide_Restore):SetShow(true)
      ;
      (btnControl._Fire):SetShow(false)
      ;
      (defaul_Control._Guide_Restore):ComputePos()
      self:UpdateItemList()
    end
  end
end

Worker_Table_Set = function()
  -- function num : 0_9 , upvalues : Worker_Table, plantKey, Control_WorkerList
  Worker_Table = {}
  local plant = ToClient_getPlant(plantKey)
  if plant == nil or (CppEnums.PlantType).ePlantType_Town ~= plant:getType() then
    return 
  end
  local waitWorkerCount = ToClient_getPlantWaitWorkerListCount(plantKey, 0)
  local maxWorkerCount = ToClient_getTownWorkerMaxCapacity(plantKey)
  for workerIndex = 0, maxWorkerCount - 1 do
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R7 in 'UnsetPending'

    Worker_Table[workerIndex] = {}
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R7 in 'UnsetPending'

    if workerIndex < waitWorkerCount then
      (Worker_Table[workerIndex])._isEmpty = false
      local workerData = ToClient_getPlantWaitWorkerByIndex(plantKey, workerIndex)
      local workerStaticStatus = workerData:getWorkerStaticStatus()
      local checkData = workerData:getStaticSkillCheckData()
      local workerGrade = (((workerData:getWorkerStaticStatus()):getCharacterStaticStatus())._gradeType):get()
      checkData._diceCheckForceSuccess = true
      -- DECOMPILER ERROR at PC54: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (Worker_Table[workerIndex])._WorkerNo = workerData:getWorkerNo()
      -- DECOMPILER ERROR at PC75: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (Worker_Table[workerIndex])._Name = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. workerData:getLevel() .. " " .. ConvertFromGradeToColor(workerGrade, true) .. ToClient_getWorkerName(workerStaticStatus) .. "<PAOldColor>"
      -- DECOMPILER ERROR at PC79: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (Worker_Table[workerIndex])._MaxPoint = workerStaticStatus._actionPoint
      -- DECOMPILER ERROR at PC84: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (Worker_Table[workerIndex])._CurrentPoint = workerData:getActionPoint()
      -- DECOMPILER ERROR at PC90: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (Worker_Table[workerIndex])._recoveryActionPoint = workerData:getRecoveryActionPointWithSkill(checkData)
      -- DECOMPILER ERROR at PC93: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (Worker_Table[workerIndex])._Grade = workerGrade
      -- DECOMPILER ERROR at PC109: Confused about usage of register: R11 in 'UnsetPending'

      if isWaitWorker(workerData) == true then
        (Worker_Table[workerIndex])._State_Text = "<PAColor0xfffeff99>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE") .. "<PAOldColor>"
        -- DECOMPILER ERROR at PC114: Confused about usage of register: R11 in 'UnsetPending'

        ;
        (Worker_Table[workerIndex])._State = eWorkerStateType.waiting
      else
        -- DECOMPILER ERROR at PC128: Confused about usage of register: R11 in 'UnsetPending'

        if workerData == true then
          (Worker_Table[workerIndex])._State_Text = "<PAColor0xffff8400>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_TRANSFERING") .. "<PAOldColor>"
          -- DECOMPILER ERROR at PC133: Confused about usage of register: R11 in 'UnsetPending'

          ;
          (Worker_Table[workerIndex])._State = eWorkerStateType.transfer
        else
          -- DECOMPILER ERROR at PC145: Confused about usage of register: R11 in 'UnsetPending'

          ;
          (Worker_Table[workerIndex])._State_Text = "<PAColor0xffde3900>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_CANCELWORK") .. "<PAOldColor>"
          -- DECOMPILER ERROR at PC150: Confused about usage of register: R11 in 'UnsetPending'

          ;
          (Worker_Table[workerIndex])._State = eWorkerStateType.working
        end
      end
    else
      do
        do
          -- DECOMPILER ERROR at PC154: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (Worker_Table[workerIndex])._isEmpty = true
          -- DECOMPILER ERROR at PC155: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC155: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC155: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  Control_WorkerList:SetControl(waitWorkerCount, maxWorkerCount)
  Control_WorkerList:UpdateSlot(0, false)
end

RestoreItem_Table_Set = function()
  -- function num : 0_10 , upvalues : RestoreItem_Table, slider_Param, defaul_Control
  local Cnt_RestoreItem = ToClient_getNpcRecoveryItemList()
  for idx = 0, Cnt_RestoreItem - 1 do
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R5 in 'UnsetPending'

    RestoreItem_Table[idx] = {}
    local NpcRecoveryItem = ToClient_getNpcRecoveryItemByIndex(idx)
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (RestoreItem_Table[idx])._slotNo = NpcRecoveryItem._slotNo
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (RestoreItem_Table[idx])._itemKey = NpcRecoveryItem._itemEnchantKey
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (RestoreItem_Table[idx])._itemCnt = NpcRecoveryItem._itemCount_s64
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (RestoreItem_Table[idx])._restore = NpcRecoveryItem._contentsEventParam1
    local itemStatic = NpcRecoveryItem:getItemStaticStatus()
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (RestoreItem_Table[idx])._itemIcon = "icon/" .. getItemIconPath(itemStatic)
  end
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

  slider_Param._offsetIndex = 0
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

  slider_Param._contentCount = Cnt_RestoreItem
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  slider_Param._offsetMax = Cnt_RestoreItem - defaul_Control._Item_MaxCount
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  if slider_Param._offsetMax < 0 then
    slider_Param._offsetMax = 0
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

    slider_Param._slotMax = Cnt_RestoreItem
  else
    -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

    slider_Param._slotMax = defaul_Control._Item_MaxCount
  end
end

Control_RestoreItem.clear = function(self)
  -- function num : 0_11 , upvalues : Control_RestoreItem
  for key,value in pairs(Control_RestoreItem._Item_IconBG) do
    value:SetShow(false)
  end
  for key,value in pairs(Control_RestoreItem._Item_Icone) do
    value:SetShow(false)
  end
  for key,value in pairs(Control_RestoreItem._Item_Count) do
    value:SetShow(false)
  end
  for key,value in pairs(Control_RestoreItem._Item_RestoreValue) do
    value:SetShow(false)
  end
end

UISlider_SetButtonSize = function(scroll, configSlotCount, contentsCount)
  -- function num : 0_12
  if configSlotCount < contentsCount then
    local size = configSlotCount / contentsCount
    ;
    (scroll:GetControlButton()):SetSize(scroll:GetSizeX() * size, (scroll:GetControlButton()):GetSizeY())
    scroll:SetShow(true)
  else
    do
      scroll:SetShow(false)
    end
  end
end

Control_RestoreItem.UpdateItemList = function(self)
  -- function num : 0_13 , upvalues : slider_Param, RestoreItem_Table, defaul_Control
  self:clear()
  for idx = 0, slider_Param._slotMax - 1 do
    local itemIndex = slider_Param._offsetIndex + idx
    ;
    ((self._Item_Icone)[idx]):ChangeTextureInfoName((RestoreItem_Table[itemIndex])._itemIcon)
    ;
    ((self._Item_Count)[idx]):SetText(tostring((RestoreItem_Table[itemIndex])._itemCnt))
    ;
    ((self._Item_RestoreValue)[idx]):SetText("+" .. tostring((RestoreItem_Table[itemIndex])._restore))
    ;
    ((self._Item_IconBG)[idx]):SetShow(true)
    ;
    ((self._Item_Icone)[idx]):SetShow(true)
    ;
    ((self._Item_Count)[idx]):SetShow(true)
    ;
    ((self._Item_RestoreValue)[idx]):SetShow(true)
  end
  UISlider_SetButtonSize(self._Item_Slider, defaul_Control._Item_MaxCount, slider_Param._contentCount)
  if (self._Item_Slider):GetShow() then
    (self._Item_SliderBG):SetShow(false)
  else
    ;
    (self._Item_SliderBG):SetShow(true)
  end
  local _offsetMax = slider_Param._offsetMax
  if _offsetMax == 0 then
    _offsetMax = 1
  end
  ;
  (self._Item_Slider):SetControlPos(slider_Param._offsetIndex / _offsetMax * 100)
end

Control_WorkerList.clear = function(self, idx)
  -- function num : 0_14
  for key,value in pairs(self._worker_BG) do
    if idx <= key then
      value:SetShow(false)
    end
  end
  for key,value in pairs(self._worker_CheckBox) do
    if idx <= key then
      value:SetShow(false)
      value:SetCheck(false)
    end
  end
  for key,value in pairs(self._worker_Name) do
    if idx <= key then
      value:SetShow(false)
    end
  end
  for key,value in pairs(self._worker_State) do
    if idx <= key then
      value:SetShow(false)
    end
  end
  for key,value in pairs(self._worker_Redo) do
    if idx <= key then
      value:SetShow(false)
    end
  end
  for key,value in pairs(self._worker_Move) do
    if idx <= key then
      value:SetShow(false)
    end
  end
  for key,value in pairs(self._List_Empty) do
    if idx <= key then
      value:SetShow(false)
    end
  end
  for key,value in pairs(self._worker_RestorePoint) do
    if idx <= key then
      value:SetShow(false)
    end
  end
  for key,value in pairs(self._worker_CurrentPoint) do
    if idx <= key then
      value:SetShow(false)
    end
  end
end

Control_WorkerList.UpdateSlot = function(self, _Index, isAdjust)
  -- function num : 0_15 , upvalues : scroll_Param, Worker_Table, waitingCancelWorkerNo, plantKey, defaul_Control
  local adjust = 0
  if isAdjust then
    adjust = 2
  end
  self:clear(0)
  local _blank_Count = 0
  local workerIndex = scroll_Param._offsetIndex
  for idx = 0, scroll_Param._slotMax - 1 do
    if Worker_Table[workerIndex] ~= nil and (isAdjust ~= true or idx < _Index or _Index + adjust <= idx) then
      if (Worker_Table[workerIndex])._isEmpty == false then
        local progressRate = (Worker_Table[workerIndex])._CurrentPoint / (Worker_Table[workerIndex])._MaxPoint * 100
        ;
        ((self._worker_BG)[idx]):SetShow(true)
        ;
        ((self._worker_CheckBox)[idx]):SetShow(true)
        ;
        ((self._worker_Name)[idx]):SetShow(true)
        ;
        ((self._worker_RestorePoint)[idx]):SetProgressRate(progressRate)
        ;
        ((self._worker_RestorePoint)[idx]):SetShow(true)
        ;
        ((self._worker_CurrentPoint)[idx]):SetProgressRate(progressRate)
        ;
        ((self._worker_CurrentPoint)[idx]):SetShow(true)
        ;
        ((self._worker_State)[idx]):SetShow(true)
        local workStringNo = tostring(((Worker_Table[workerIndex])._WorkerNo):get_s64())
        local workerName = (Worker_Table[workerIndex])._Name
        if (Worker_Table[workerIndex])._State == eWorkerStateType.working then
          workerName = "[작업중] " .. workerName
        else
          workerName = "[�\128기중] " .. workerName
        end
        ;
        ((self._worker_Name)[idx]):SetText(workerName)
        ;
        ((self._worker_State)[idx]):addInputEvent("Mouse_On", "HandleOn_WorkerTooltip(" .. idx .. ")")
        ;
        ((self._worker_State)[idx]):addInputEvent("Mouse_Out", "HandleOut_WorkerTooltip(" .. idx .. ", false)")
        ;
        ((self._worker_BG)[idx]):addInputEvent("Mouse_On", "HandleOn_WorkerTooltip(" .. idx .. ")")
        ;
        ((self._worker_BG)[idx]):addInputEvent("Mouse_Out", "HandleOut_WorkerTooltip(" .. idx .. ", false)")
        if waitingCancelWorkerNo[workStringNo] == true then
          if (Worker_Table[workerIndex])._State == eWorkerStateType.working then
            ((self._worker_State)[idx]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_TOWN_WORKERMANAGE_CANCELRESERVE"))
            ;
            ((self._worker_State)[idx]):SetEnable(false)
            ;
            ((self._worker_State)[idx]):SetMonoTone(true)
            ;
            ((self._worker_Move)[idx]):SetShow(true)
            ;
            ((self._worker_Move)[idx]):addInputEvent("Mouse_LUp", "HandleLClick_WorkerMove_Button(" .. workerIndex .. ", " .. idx .. ")")
          else
            -- DECOMPILER ERROR at PC193: Confused about usage of register: R13 in 'UnsetPending'

            waitingCancelWorkerNo[workStringNo] = nil
            ;
            ((self._worker_State)[idx]):SetText("<PAColor0xfffeff99>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE") .. "<PAOldColor>")
            ;
            ((self._worker_State)[idx]):SetEnable(true)
            ;
            ((self._worker_State)[idx]):SetMonoTone(false)
            ;
            ((self._worker_Move)[idx]):SetShow(false)
          end
        else
          if (Worker_Table[workerIndex])._State == eWorkerStateType.working then
            ((self._worker_State)[idx]):SetText("<PAColor0xffde3900>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_CANCELWORK") .. "<PAOldColor>")
          else
            ;
            ((self._worker_State)[idx]):SetText("<PAColor0xfffeff99>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE") .. "<PAOldColor>")
          end
          ;
          ((self._worker_State)[idx]):SetEnable(true)
          ;
          ((self._worker_State)[idx]):SetMonoTone(false)
          local workingWorker = ToClient_getPlantWorkingWorkerByWorkerNo((Worker_Table[workerIndex])._WorkerNo)
          if (workingWorker ~= nil and workingWorker._type == 0) or (Worker_Table[workerIndex])._State == eWorkerStateType.working then
            ((self._worker_Move)[idx]):SetShow(true)
            ;
            ((self._worker_Move)[idx]):addInputEvent("Mouse_LUp", "HandleLClick_WorkerMove_Button(" .. workerIndex .. ", " .. idx .. ")")
          end
        end
        do
          ;
          ((self._worker_State)[idx]):addInputEvent("Mouse_LUp", "HandleLClick_WorkerState_Button(" .. workerIndex .. ", " .. idx .. ")")
          ;
          ((self._worker_CheckBox)[idx]):addInputEvent("Mouse_LUp", "HandleClick_WorkerCheckBox(" .. workerIndex .. ", " .. idx .. ")")
          if (Worker_Table[workerIndex])._State == eWorkerStateType.waiting then
            local workerData = ToClient_getPlantWaitWorkerByIndex(plantKey, workerIndex)
            local _homeWaypoint = plantKey:getWaypointKey()
            if workerData ~= nil then
              local workerNo = (workerData:getWorkerNo()):get_s64()
              for key,value in pairs(workedWorker) do
                if workerNo == key then
                  ((self._worker_Redo)[idx]):SetShow(true)
                  ;
                  ((self._worker_Redo)[idx]):addInputEvent("Mouse_LUp", "HandleClick_ReDoWork(" .. workerIndex .. ")")
                  break
                end
              end
            end
          end
          do
            local _workerData = ToClient_getPlantWaitWorkerByIndex(plantKey, workerIndex)
            if _workerData ~= nil then
              local _workerNo = (_workerData:getWorkerNo()):get_s64()
              local _leftWorkCount = ToClient_getNpcWorkerWorkingCount(_workerNo)
              if _leftWorkCount > 0 then
                ((self._worker_Name)[idx]):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLDMAP_TOWN_WORKERMANAGE_LEFTWORKCOUNT", "workerName", workerName, "_leftWorkCount", _leftWorkCount))
              end
            end
            do
              do
                do
                  if (Worker_Table[workerIndex])._isChecked == true then
                    ((self._worker_CheckBox)[idx]):SetCheck(true)
                  else
                    ;
                    ((self._worker_CheckBox)[idx]):SetCheck(false)
                  end
                  ;
                  ((self._worker_BG)[idx]):SetShow(false)
                  ;
                  ((self._List_Empty)[idx]):SetShow(true)
                  workerIndex = workerIndex + 1
                  ;
                  ((self._worker_BG)[idx]):SetShow(false)
                  ;
                  ((self._worker_CheckBox)[idx]):SetShow(false)
                  ;
                  ((self._worker_Name)[idx]):SetShow(false)
                  ;
                  ((self._worker_RestorePoint)[idx]):SetShow(false)
                  ;
                  ((self._worker_CurrentPoint)[idx]):SetShow(false)
                  ;
                  ((self._worker_State)[idx]):SetShow(false)
                  ;
                  ((self._worker_Move)[idx]):SetShow(false)
                  ;
                  ((self._worker_Redo)[idx]):SetShow(false)
                  _blank_Count = _blank_Count + 1
                  -- DECOMPILER ERROR at PC460: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC460: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC460: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC460: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC460: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC460: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC460: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC460: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  ;
  (UIScroll.SetButtonSize)(defaul_Control._List_Scroll, scroll_Param._slotMax, scroll_Param._contentCount + (_blank_Count))
  local _offsetMax = scroll_Param._offsetMax
  if _offsetMax == 0 then
    _offsetMax = 1
  end
  local _offsetIndex = scroll_Param._offsetIndex
  if _offsetMax < _offsetIndex then
    _offsetIndex = _offsetMax
  end
  ;
  (defaul_Control._List_Scroll):SetControlPos(_offsetIndex / _offsetMax)
end

local workerIndex_CancelWork = nil
WorkerManage_CancelWork = function(workerIndex)
  -- function num : 0_16 , upvalues : workerIndex_CancelWork, Worker_Table, UI_PP
  workerIndex_CancelWork = workerIndex
  local _workerNo = ((Worker_Table[workerIndex])._WorkerNo):get_s64()
  local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(_workerNo)
  local _leftWorkCount = ToClient_getNpcWorkerWorkingCount(_workerNo)
  if _leftWorkCount < 1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_HOUSECONTROL_ONLYONEWORK"))
    return 
  else
    local workName = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_TOWN_WORKERMANAGE_PORTRESS")
    if esSSW ~= nil then
      workName = esSSW:getDescription()
    end
    local cancelWorkContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_TOWN_WORKERMANAGE_CONFIRM_WORKCANCEL", "workName", workName)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WORKINGPROGRESS_CANCELWORK_TITLE"), content = cancelWorkContent, functionYes = WorkerManage_CancelWork_Continue, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData, "top")
  end
end

WorkerManage_CancelWork_Continue = function()
  -- function num : 0_17 , upvalues : Worker_Table, workerIndex_CancelWork
  local _workerNo = (Worker_Table[workerIndex_CancelWork])._WorkerNo
  ToClient_requestCancelNextWorking(_workerNo)
end

HandleLClick_WorkerState_Button = function(workerIndex, idx)
  -- function num : 0_18 , upvalues : Worker_Table, Control_RestoreItem, waitingCancelWorkerNo
  if (Worker_Table[workerIndex])._State == eWorkerStateType.waiting then
    RestoreItem_Table_Set()
    Control_RestoreItem:InsertControl(idx, false)
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

    Control_RestoreItem.workerIndex = workerIndex
  else
    if (Worker_Table[workerIndex])._State == eWorkerStateType.working then
      local workStringNo = tostring(((Worker_Table[workerIndex])._WorkerNo):get_s64())
      -- DECOMPILER ERROR at PC32: Confused about usage of register: R3 in 'UnsetPending'

      waitingCancelWorkerNo[workStringNo] = true
      WorkerManage_CancelWork(workerIndex)
    else
    end
  end
  do
    if (Worker_Table[workerIndex])._State == eWorkerStateType.transfer then
      HandleOut_WorkerTooltip(idx, true)
    end
  end
end

HandleLClick_WorkerMove_Button = function(workerIndex, idx)
  -- function num : 0_19 , upvalues : plantKey
  local workerData = ToClient_getPlantWaitWorkerByIndex(plantKey, workerIndex)
  local workerStaticStatus = workerData:getWorkerStaticStatus()
  if ToClient_isWaitWorker(workerData) == false then
    FGlobal_WorldMapWindowEscape()
    ToClient_setTownModeByWorkNo(workerData:getWorkerNo())
  end
end

HandleOn_WorkerState_Button = function(workerIndex, idx)
  -- function num : 0_20 , upvalues : Worker_Table, Control_WorkerList
  if Panel_Worker_Tooltip:GetShow() == false then
    HandleOn_WorkerTooltip(idx)
  end
  if (Worker_Table[workerIndex])._State == eWorkerStateType.waiting then
    ((Control_WorkerList._worker_State)[idx]):SetText("<PAColor0xfffeff99>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE") .. "<PAOldColor>")
  else
    if (Worker_Table[workerIndex])._State == eWorkerStateType.working then
      ((Control_WorkerList._worker_State)[idx]):SetText("<PAColor0xffde3900>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_CANCELWORK") .. "<PAOldColor>")
    else
    end
  end
  if (Worker_Table[workerIndex])._State == eWorkerStateType.transfer then
  end
end

HandleOut_WorkerState_Button = function(workerIndex, idx)
  -- function num : 0_21 , upvalues : Control_WorkerList, Worker_Table, Control_RestoreItem
  if (UI.isInPositionForLua)((Control_WorkerList._worker_BG)[idx], getMousePosX(), getMousePosY()) == true then
    return 
  end
  if Panel_Worker_Tooltip:GetShow() then
    HandleOut_WorkerTooltip(idx, false)
  end
  if Worker_Table[workerIndex] == nil then
    return 
  end
  if (Worker_Table[workerIndex])._State == eWorkerStateType.waiting or (Worker_Table[workerIndex])._State == eWorkerStateType.working then
    if Control_RestoreItem._saveIndex == idx then
      return 
    end
    local state = ""
    if (Worker_Table[workerIndex])._State == eWorkerStateType.waiting then
      state = "<PAColor0xfffeff99>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE") .. "<PAOldColor>"
    else
      state = "<PAColor0xffde3900>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_CANCELWORK") .. "<PAOldColor>"
    end
    ;
    ((Control_WorkerList._worker_State)[idx]):SetText(state)
  else
  end
  do
    if (Worker_Table[workerIndex])._State == eWorkerStateType.transfer then
    end
  end
end

Control_Scroll = function(isUp, isSlider)
  -- function num : 0_22 , upvalues : Control_RestoreItem, scroll_Param, slider_Param, Control_WorkerList, WorkerTooltip_Index, ItemTooltip_Index
  if (Control_RestoreItem._Item_BG):GetShow() and isSlider == false then
    Control_RestoreItem_Reset()
  end
  local self = scroll_Param
  if isSlider == true then
    self = slider_Param
  end
  if self._offsetIndex == 0 and self._offsetMax == 0 then
    return 
  end
  local save_offset = self._offsetIndex
  if isUp == true then
    self._offsetIndex = self._offsetIndex - 1
    if self._offsetIndex < 0 then
      self._offsetIndex = 0
    end
  else
    self._offsetIndex = self._offsetIndex + 1
    if self._offsetMax < self._offsetIndex then
      self._offsetIndex = self._offsetMax
    end
  end
  if save_offset ~= self._offsetIndex then
    if isSlider == false then
      Control_WorkerList:UpdateSlot(0, false)
      if WorkerTooltip_Index ~= nil and Panel_Worker_Tooltip:GetShow() then
        HandleOn_WorkerTooltip(WorkerTooltip_Index)
      end
    else
      if isSlider == true then
        Control_RestoreItem:UpdateItemList()
        if ItemTooltip_Index ~= nil and Panel_Tooltip_Item:GetShow() then
          HandleOn_RestoreItemTooltip(ItemTooltip_Index)
        end
      end
    end
  end
end

Control_ScrollOnClick = function(isSlider)
  -- function num : 0_23 , upvalues : Control_RestoreItem, defaul_Control, scroll_Param, slider_Param, Control_WorkerList
  if (Control_RestoreItem._Item_BG):GetShow() and isSlider == false then
    Control_RestoreItem_Reset()
  end
  local _scrollSize = (defaul_Control._List_Scroll):GetSizeY()
  local _buttonSize = (defaul_Control._scroll_Button):GetSizeY()
  local _buttonPos = (defaul_Control._scroll_Button):GetPosY()
  local self = scroll_Param
  if isSlider == true then
    _scrollSize = (Control_RestoreItem._Item_Slider):GetSizeX()
    _buttonSize = (Control_RestoreItem._Item_Slider_Button):GetSizeX()
    _buttonPos = (Control_RestoreItem._Item_Slider_Button):GetPosX()
    self = slider_Param
  end
  local namnunSize = _scrollSize - _buttonSize
  local namnunPercents = _buttonPos / namnunSize
  if namnunPercents > 1 then
    namnunPercents = 1
  end
  self._offsetIndex = (math.floor)(namnunPercents * self._offsetMax)
  if isSlider == false then
    Control_WorkerList:UpdateSlot(0, false)
  else
    if isSlider == true then
      Control_RestoreItem:UpdateItemList()
    end
  end
end

WorldMapWindow_OpenWaitWorkerManageByPlantKey = function(aPlantKey)
  -- function num : 0_24 , upvalues : plantKey, scroll_Param
  plantKey = aPlantKey
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  scroll_Param._offsetIndex = 0
  Control_RestoreItem_Reset()
  Worker_Table_Set()
end

WorldMapWindow_OpenWaitWorkerManage = function(node)
  -- function num : 0_25
  WorldMapWindow_OpenWaitWorkerManageByPlantKey(node:getPlantKey())
end

WorldMapWindow_WorkerManage_Refresh = function()
  -- function num : 0_26 , upvalues : plantKey, Control_RestoreItem, ItemTooltip_Index
  if ToClient_WorldMapIsShow() == false or plantKey == nil then
    return 
  end
  local saveIndex = nil
  if (Control_RestoreItem._Item_BG):GetShow() then
    saveIndex = Control_RestoreItem._saveIndex
  end
  FGlobal_InitWorkerTooltip()
  Worker_Table_Set()
  if saveIndex ~= nil then
    RestoreItem_Table_Set()
    Control_RestoreItem:InsertControl(saveIndex, true)
  end
  if ItemTooltip_Index ~= nil then
    HandleOn_RestoreItemTooltip(ItemTooltip_Index)
  end
end

WorldMapWindow_CloseWaitWorkerManage = function()
  -- function num : 0_27 , upvalues : plantKey
  Panel_manageWorker:SetShow(false)
  plantKey = nil
  Control_RestoreItem_Reset()
  FGlobal_InitWorkerTooltip()
end

HandleOn_WorkerTooltip = function(idx)
  -- function num : 0_28 , upvalues : Control_RestoreItem, scroll_Param, Control_WorkerList, Worker_Table, plantKey, WorkerTooltip_Index
  local adjust = 0
  if (Control_RestoreItem._Item_BG):GetShow() and Control_RestoreItem._saveIndex < idx then
    adjust = 2
  end
  local workerIndex = scroll_Param._offsetIndex + idx - adjust
  local uiBase = (Control_WorkerList._worker_BG)[idx]
  if Worker_Table[workerIndex] == nil then
    return 
  end
  if (Worker_Table[workerIndex])._isEmpty == true then
    HandleOut_WorkerTooltip(idx, true)
  else
    HandleOnWorkerTooltip(ToClient_getPlantWaitWorkerByIndex(plantKey, workerIndex), uiBase)
    WorkerTooltip_Index = idx
  end
end

HandleOut_WorkerTooltip = function(idx, isReset)
  -- function num : 0_29 , upvalues : WorkerTooltip_Index, Control_WorkerList
  local MousePosX = getMousePosX()
  local MousePosY = getMousePosY()
  if WorkerTooltip_Index == idx then
    local uiBase = (Control_WorkerList._worker_BG)[idx]
    local checkX = MousePosX - uiBase:GetParentPosX()
    local checkY = MousePosY - uiBase:GetParentPosY()
    if checkX > 0 and checkY > 0 and checkX < uiBase:GetSizeX() and checkY < uiBase:GetSizeY() and isReset == false then
      return 
    end
    HandleOutWorkerTooltip(uiBase)
    WorkerTooltip_Index = nil
  end
end

HandleOn_RestoreItemTooltip = function(idx)
  -- function num : 0_30 , upvalues : slider_Param, RestoreItem_Table, Control_RestoreItem, ItemTooltip_Index, Worker_Table, Control_WorkerList
  local itemIndex = slider_Param._offsetIndex + idx
  local staticStatusKey = (RestoreItem_Table[itemIndex])._itemKey
  local staticStatusWrapper = getItemEnchantStaticStatus(staticStatusKey)
  local uiBase = (Control_RestoreItem._Item_IconBG)[idx]
  Panel_Tooltip_Item_Show(staticStatusWrapper, uiBase, true, false)
  ItemTooltip_Index = idx
  local itemIndex = slider_Param._offsetIndex + idx
  local workerIndex = Control_RestoreItem.workerIndex
  local index = Control_RestoreItem.Index
  local restorePoint = (RestoreItem_Table[itemIndex])._restore
  local progressRate = ((Worker_Table[workerIndex])._CurrentPoint + restorePoint + (Worker_Table[workerIndex])._recoveryActionPoint) / (Worker_Table[workerIndex])._MaxPoint * 100
  ;
  ((Control_WorkerList._worker_RestorePoint)[index]):SetProgressRate(progressRate)
end

HandleOut_RestoreItemTooltip = function(idx)
  -- function num : 0_31 , upvalues : Control_WorkerList, ItemTooltip_Index, Control_RestoreItem, Worker_Table
  if idx == nil then
    Panel_Tooltip_Item_hideTooltip()
    for key,value in pairs(Control_WorkerList._worker_RestorePoint) do
      value:SetProgressRate(0)
    end
    ItemTooltip_Index = nil
  else
    if ItemTooltip_Index == idx then
      Panel_Tooltip_Item_hideTooltip()
      local workerIndex = Control_RestoreItem.workerIndex
      local index = Control_RestoreItem.Index
      local progressRate = (Worker_Table[workerIndex])._CurrentPoint / (Worker_Table[workerIndex])._MaxPoint * 100
      ;
      ((Control_WorkerList._worker_RestorePoint)[index]):SetProgressRate(progressRate)
      ItemTooltip_Index = nil
    end
  end
end

HandleClick_RestoreItem = function(idx)
  -- function num : 0_32 , upvalues : slider_Param, Control_RestoreItem, Worker_Table, RestoreItem_Table
  local index = slider_Param._offsetIndex + idx
  local workerIndex = Control_RestoreItem.workerIndex
  local workerNo = (Worker_Table[workerIndex])._WorkerNo
  local slotNo = (RestoreItem_Table[index])._slotNo
  if (Worker_Table[workerIndex])._MaxPoint == (Worker_Table[workerIndex])._CurrentPoint then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_TOWN_WORKER_RESTORE_MAX"))
    return 
  end
  requestRecoveryWorker(workerNo, slotNo, 1)
end


