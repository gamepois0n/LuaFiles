Panel_Window_WorkerManager_Filter_Renew:SetShow(false)
Panel_Window_WorkerManager_Filter_Renew:ignorePadSnapMoveToOtherPanel()
local workerSortFilter = {
  _ui = {
    _button_No = UI.getChildControl(Panel_Window_WorkerManager_Filter_Renew, "Button_No"),
    _static_Filter = UI.getChildControl(Panel_Window_WorkerManager_Filter_Renew, "Static_Filter"),
    _static_BottomBg = UI.getChildControl(Panel_Window_WorkerManager_Filter_Renew, "Static_BottomBg")
  },
  _config = {
    _filterType = {_town = 0, _grade = 1},
    _postition = {
      _startX = 10,
      _startY = 10,
      _gabY = 45
    }
  },
  _selectedType = nil,
  _townFilter = nil,
  _gradeFilter = nil,
  _dataCount = 0
}
function workerSortFilter:initialize()
  self:initControl()
end
function workerSortFilter:initControl()
  local workerFilterUi = self._ui
  workerFilterUi._button_AreaFilter = UI.getChildControl(workerFilterUi._static_Filter, "Button_AreaFilter")
  workerFilterUi._button_GradelFilter = UI.getChildControl(workerFilterUi._static_Filter, "Button_GradelFilter")
  workerFilterUi._list2_1_SelectFilter = UI.getChildControl(workerFilterUi._static_Filter, "List2_1_SelectFilter")
  workerFilterUi._button_AreaFilter:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorkerManager_FilterSetData(" .. self._config._filterType._town .. ")")
  workerFilterUi._button_GradelFilter:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorkerManager_FilterSetData(" .. self._config._filterType._grade .. ")")
  workerFilterUi._list2_1_SelectFilter:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_WorkerManager_Filter_Create")
  workerFilterUi._list2_1_SelectFilter:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  Panel_Window_WorkerManager_Filter_Renew:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_WorkerManager_FilterConfirm()")
end
function workerSortFilter:setPosition(selectedType)
  local workerFilterUi = self._ui
  local workerConfig = self._config._postition
  workerFilterUi._button_AreaFilter:SetPosX(workerConfig._startX)
  workerFilterUi._button_AreaFilter:SetPosY(workerConfig._startY)
  if nil == selectedType then
    workerFilterUi._list2_1_SelectFilter:SetShow(false)
    workerFilterUi._button_GradelFilter:SetPosX(workerConfig._startX)
    workerFilterUi._button_GradelFilter:SetPosY(workerConfig._startY + workerConfig._gabY)
  elseif self._config._filterType._town == selectedType then
    workerFilterUi._list2_1_SelectFilter:SetShow(true)
    workerFilterUi._list2_1_SelectFilter:SetPosX(workerConfig._startX)
    workerFilterUi._list2_1_SelectFilter:SetPosY(workerConfig._startY + workerConfig._gabY)
    local posY = workerFilterUi._list2_1_SelectFilter:GetPosY()
    posY = posY + workerFilterUi._list2_1_SelectFilter:GetSizeY()
    workerFilterUi._button_GradelFilter:SetPosX(workerConfig._startX)
    workerFilterUi._button_GradelFilter:SetPosY(workerConfig._startY + posY)
  else
    workerFilterUi._button_GradelFilter:SetPosX(workerConfig._startX)
    workerFilterUi._button_GradelFilter:SetPosY(workerConfig._startY + workerConfig._gabY)
    workerFilterUi._list2_1_SelectFilter:SetShow(true)
    workerFilterUi._list2_1_SelectFilter:SetPosX(workerConfig._startX)
    workerFilterUi._list2_1_SelectFilter:SetPosY(workerConfig._startY + workerConfig._gabY * 2)
  end
end
function workerSortFilter:setList(selectedType)
  self._selectedType = selectedType
  self._ui._list2_1_SelectFilter:getElementManager():clearKey()
  self._dataCount = 0
  local contentsList
  if self._config._filterType._town == selectedType then
    contentsList = PaGlobalFunc_WorkerManager_GetTownList()
  elseif self._config._filterType._grade == selectedType then
    contentsList = PaGlobalFunc_WorkerManager_GetGradeList()
  end
  if nil == contentsList then
    return
  end
  for key, value in pairs(contentsList) do
    self._dataCount = self._dataCount + 1
    self._ui._list2_1_SelectFilter:getElementManager():pushKey(key)
  end
end
function workerSortFilter:listCreate(contorl, key)
  local template = UI.getChildControl(contorl, "RadioButton_Templete")
  local keyGuide = UI.getChildControl(contorl, "StaticText_A_ConsoleUI")
  template:addInputEvent("Mouse_On", "PaGlobalFunc_WorkerManager_KeyGuideOn(" .. tostring(key) .. ")")
  template:addInputEvent("Mouse_Out", "PaGlobalFunc_WorkerManager_KeyGuideOut(" .. tostring(key) .. ")")
  template:SetCheck(false)
  keyGuide:SetShow(false)
  local index = tonumber(tostring(key))
  local contentsList
  if self._config._filterType._town == self._selectedType then
    contentsList = PaGlobalFunc_WorkerManager_GetTownList()
  elseif self._config._filterType._grade == self._selectedType then
    contentsList = PaGlobalFunc_WorkerManager_GetGradeList()
  end
  if nil == contentsList then
    return
  end
  if self._config._filterType._town == self._selectedType then
    if self._townFilter == contentsList[index] then
      template:SetCheck(true)
    end
    template:SetText(contentsList[index])
    template:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorkerManager_SelectTownFilter(\"" .. tostring(contentsList[index]) .. "\")")
  elseif self._config._filterType._grade == self._selectedType then
    if self._gradeFilter == contentsList[index] then
      template:SetCheck(true)
    end
    template:SetText(contentsList[index])
    template:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorkerManager_SelectGradeFilter(\"" .. tostring(contentsList[index]) .. "\")")
  end
end
function workerSortFilter:keyGuideControl(key, isOn)
  local content = self._ui._list2_1_SelectFilter:GetContentByKey(key)
  if nil == content then
    return
  end
  local keyGuide = UI.getChildControl(content, "StaticText_A_ConsoleUI")
  keyGuide:SetShow(isOn)
end
function PaGlobalFunc_WorkerManager_KeyGuideOn(key)
  workerSortFilter:keyGuideControl(key, true)
end
function PaGlobalFunc_WorkerManager_KeyGuideOut(key)
  workerSortFilter:keyGuideControl(key, false)
end
function PaGlobalFunc_WorkerManager_SelectTownFilter(townKey)
  workerSortFilter._townFilter = townKey
end
function PaGlobalFunc_WorkerManager_SelectGradeFilter(gradeKey)
  workerSortFilter._gradeFilter = gradeKey
end
function PaGlobalFunc_WorkerManager_Filter_Create(control, key)
  workerSortFilter:listCreate(control, key)
end
function PaGlobalFunc_WorkerManager_FilterSetData(selectedType)
  workerSortFilter:setList(selectedType)
  workerSortFilter:setPosition(selectedType)
end
function workerSortFilter:open()
  self._selectedType = nil
  self._gradeFilter = PaGlobalFunc_WorkerManager_GetGradeFilter()
  self._townFilter = PaGlobalFunc_WorkerManager_GetTownFilter()
  if true == Panel_Window_WorkerManager_Filter_Renew:GetShow() then
    return
  end
  Panel_Window_WorkerManager_Filter_Renew:SetShow(true)
  self:setPosition()
end
function PaGlobalFunc_WorkerManager_Filter_Open()
  workerSortFilter:open()
end
function workerSortFilter:close()
  if false == Panel_Window_WorkerManager_Filter_Renew:GetShow() then
    return
  end
  Panel_Window_WorkerManager_Filter_Renew:SetShow(false)
end
function PaGlobalFunc_WorkerManager_Filter_Close()
  workerSortFilter:close()
end
function workerSortFilter:update()
end
function workerSortFilter:confirm()
  PaGlobalFunc_WorkerManager_SetFilter(self._townFilter, self._gradeFilter)
  workerSortFilter:close()
end
function PaGlobalFunc_WorkerManager_FilterConfirm()
  workerSortFilter:confirm()
end
function PaGlobalFunc_WorkerManager_FilterlistCreat()
  workerSortFilter:listCreat()
end
function FromClient_luaLoadComplete_WorkerManager_SortFilter()
  workerSortFilter:initialize()
end
function workerSortFilter:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_WorkerManager_SortFilter")
end
workerSortFilter:registEventHandler()
