-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dance\panel_danceedit.luac 

-- params : ...
-- function num : 0
PaGlobal_DanceEdit = {
_controller = {_list2_DanceList = (UI.getChildControl)(Panel_DanceEdit, "List2_SlotContainer")}
, slotCountPerLine = 4, _selectIndex = -1}
-- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DanceEdit.getSelectIndex = function(self)
  -- function num : 0_0
  return self._selectIndex
end

-- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DanceEdit.Initialize = function(self)
  -- function num : 0_1
  self._selectIndex = -1
  PaGlobal_DanceEdit:UpdateList()
  local uiStatic, uiSaveButton, uiResetButton = (UI.getChildControl)(Panel_DanceEdit, "Static_PlayVideo"), (UI.getChildControl)(Panel_DanceEdit, "Button_Save"), (UI.getChildControl)(Panel_DanceEdit, "Button_Reset")
  local uiPlayButton = (UI.getChildControl)(uiStatic, "Button_Play")
  uiPlayButton:addInputEvent("Mouse_LUp", "PanelDanceEdit_Event_PlayDance()")
  uiSaveButton:addInputEvent("Mouse_LUp", "PanelDanceEdit_Event_SaveDance()")
  uiResetButton:addInputEvent("Mouse_LUp", "PanelDanceEdit_Event_ResetDance()")
end

PanelDanceEdit_Event_PlayDance = function()
  -- function num : 0_2
  (getGameDanceEditor()):playDance()
end

PanelDanceEdit_Event_SaveDance = function()
  -- function num : 0_3
  (getGameDanceEditor()):saveDance()
end

PanelDanceEdit_Event_ResetDance = function()
  -- function num : 0_4
  (getGameDanceEditor()):clearDance()
end

PanelDanceEdit_Ev_ControlCreate = function(control, key)
  -- function num : 0_5
  local danceSize = (getGameDanceEditor()):getDanceSize()
  key = Int64toInt32(key)
  for i = 0, PaGlobal_DanceEdit.slotCountPerLine - 1 do
    local relativePos = i + key * PaGlobal_DanceEdit.slotCountPerLine
    local uiContent = (UI.getChildControl)(control, "Static_SlotBg_" .. tostring(i))
    uiContent:SetShow(relativePos < danceSize)
    uiContent:addInputEvent("Mouse_LUp", "PanelDanceEdit_SlotEvent_MouseLUp(" .. relativePos .. ")")
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

PanelDanceEdit_SlotEvent_MouseLUp = function(danceIndex)
  -- function num : 0_6
  Proc_ShowMessage_Ack("DANCE_IDX: " .. tostring(danceIndex))
  local lstControl = (PaGlobal_DanceEdit._controller)._list2_DanceList
  local slotIndex = PaGlobal_DanceEdit._selectIndex % PaGlobal_DanceEdit.slotCountPerLine
  local content, selectControl = {}, {}
  -- DECOMPILER ERROR at PC18: Overwrote pending register: R5 in 'AssignReg'

  ;
  ({}):HideSelect()
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R5 in 'UnsetPending'

  if danceIndex ~= -1 then
    PaGlobal_DanceEdit._selectIndex = danceIndex
    slotIndex = danceIndex % PaGlobal_DanceEdit.slotCountPerLine
    content = lstControl:GetContentByKey(danceIndex / PaGlobal_DanceEdit.slotCountPerLine)
    selectControl = (UI.getChildControl)(content, "Static_Select_" .. tostring(slotIndex))
    selectControl:SetShow(true)
    local deleteButton = (UI.getChildControl)(selectControl, "Button_Remove")
    local speedUpButton = (UI.getChildControl)(selectControl, "Button_SpeedUp")
    local speedDwbutton = (UI.getChildControl)(selectControl, "Button_SpeedDown")
    deleteButton:addInputEvent("Mouse_LUp", "PanelDanceEdit_SlotEvent_DeleteLUp(" .. danceIndex .. ")")
    speedUpButton:addInputEvent("Mouse_LUp", "PanelDanceEdit_SlotEvent_SpeedUpLUp(" .. danceIndex .. ")")
    speedDwbutton:addInputEvent("Mouse_LUp", "PanelDanceEdit_SlotEvent_SpeedDwLUp(" .. danceIndex .. ")")
    local danceInfo = (getGameDanceEditor()):getDanceInfo()
    if danceInfo[danceIndex] == nil then
      _PA_LOG("�\128규보", "danceInfo[danceIndex] == nil  " .. danceIndex)
    end
    PanelDanceEdit_Slot_SpeedUpdate(danceIndex, (danceInfo[danceIndex]).speed)
  end
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DanceEdit.HideSelect = function(self)
  -- function num : 0_7
  if PaGlobal_DanceEdit._selectIndex == -1 then
    return 
  end
  local lstControl = (PaGlobal_DanceEdit._controller)._list2_DanceList
  local slotIndex = PaGlobal_DanceEdit._selectIndex % self.slotCountPerLine
  local content, selectControl = {}, {}
  -- DECOMPILER ERROR at PC15: Overwrote pending register: R5 in 'AssignReg'

  content = ({})(lstControl, PaGlobal_DanceEdit._selectIndex / self.slotCountPerLine)
  selectControl = (UI.getChildControl)(content, "Static_Select_" .. tostring(slotIndex))
  selectControl:SetShow(false)
end

PanelDanceEdit_SlotEvent_DeleteLUp = function(danceIndex)
  -- function num : 0_8
  Proc_ShowMessage_Ack("DELETE_IDX: " .. tostring(danceIndex))
  ;
  (getGameDanceEditor()):delDanceUnit(danceIndex)
  PaGlobal_DanceEdit:HideSelect()
  PaGlobal_DanceEdit:UpdateList()
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  self._selectIndex = -1
end

PanelDanceEdit_SlotEvent_SpeedUpLUp = function(danceIndex)
  -- function num : 0_9
  local danceInfo = (getGameDanceEditor()):getDanceInfo()
  local changeSpeed = (danceInfo[danceIndex]).speed + 0.1
  ;
  (getGameDanceEditor()):editDanceUnit(danceIndex, changeSpeed)
  PanelDanceEdit_Slot_SpeedUpdate(danceIndex, changeSpeed)
end

PanelDanceEdit_SlotEvent_SpeedDwLUp = function(danceIndex)
  -- function num : 0_10
  local danceInfo = (getGameDanceEditor()):getDanceInfo()
  local changeSpeed = (danceInfo[danceIndex]).speed - 0.1
  ;
  (getGameDanceEditor()):editDanceUnit(danceIndex, changeSpeed)
  PanelDanceEdit_Slot_SpeedUpdate(danceIndex, changeSpeed)
end

PanelDanceEdit_Slot_SpeedUpdate = function(danceIndex, speed)
  -- function num : 0_11
  local slotIndex = danceIndex % PaGlobal_DanceEdit.slotCountPerLine
  local content = ((PaGlobal_DanceEdit._controller)._list2_DanceList):GetContentByKey(danceIndex / PaGlobal_DanceEdit.slotCountPerLine)
  local selectControl = (UI.getChildControl)(content, "Static_Select_" .. tostring(slotIndex))
  local speedText = (UI.getChildControl)(selectControl, "StaticText_Speed")
  speedText:SetText("X " .. (string.format)("%.1f", speed))
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DanceEdit.UpdateList = function(self)
  -- function num : 0_12
  local uiList2 = (PaGlobal_DanceEdit._controller)._list2_DanceList
  uiList2:registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PanelDanceEdit_Ev_ControlCreate")
  uiList2:createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (uiList2:getElementManager()):clearKey()
  local danceSize = (getGameDanceEditor()):getDanceSize()
  local pushKeycount = danceSize / self.slotCountPerLine
  if danceSize % self.slotCountPerLine ~= 0 then
    pushKeycount = pushKeycount + 1
  end
  for pushKeyIndex = 0, pushKeycount do
    (uiList2:getElementManager()):pushKey(pushKeyIndex)
  end
end

PaGlobal_DanceEdit:Initialize()

