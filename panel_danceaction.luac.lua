-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dance\panel_danceaction.luac 

-- params : ...
-- function num : 0
local tmpDanceList = {"DANCE_T00_Step00_Ing_01", "DANCE_T00_Step00_Ing_01_M", "DANCE_T00_Step00_Ing_02", "DANCE_T00_Step00_Ing_02_M", "DANCE_T00_Step00_Ing_03", "DANCE_T00_Step00_Ing_03_M", "DANCE_T00_Step00_Ing_04_L", "DANCE_T00_Step00_Ing_04_R", "DANCE_T00_Step00_Ing_05", "DANCE_T00_Step00_Ing_05_M", "DANCE_T00_Step00_Ing_06_L", "DANCE_T00_Step00_Ing_06_R", "DANCE_T00_Step00_Start_00", "DANCE_T00_Step01_End_01_M", "DANCE_T00_Step01_End_02", "DANCE_T00_Step01_Ing_00", "DANCE_T00_Step01_Ing_01", "DANCE_T00_Step01_Ing_01_M", "DANCE_T00_Step01_Ing_02", "DANCE_T00_Step01_Ing_02_M", "DANCE_T00_Step01_Ing_03", "DANCE_T00_Step01_Ing_03_M", "DANCE_T00_Step01_Ing_04", "DANCE_T00_Step01_Ing_04_M", "DANCE_T00_Step01_Ing_05", "DANCE_T00_Step01_Ing_05_M", "DANCE_T00_Step01_Ing_06_L", "DANCE_T00_Step01_Ing_06_R", "DANCE_T00_Step01_Ing_07_L", "DANCE_T00_Step01_Ing_07_R", "DANCE_T00_Step01_Ing_08_L", "DANCE_T00_Step01_Ing_08_R", "DANCE_T00_Step01_Ing_09", "DANCE_T00_Step01_Ing_09_M", "DANCE_T00_Step01_Ing_10", "DANCE_T00_Step01_Ing_10_M", "DANCE_T00_Step01_Ing_11", "DANCE_T00_Step01_Ing_11_M", "DANCE_T00_Step01_Ing_12_L", "DANCE_T00_Step01_Ing_12_R", "DANCE_T00_Step01_Ing_13_L", "DANCE_T00_Step01_Ing_13_R", "DANCE_T00_Step01_Ing_14", "DANCE_T00_Step01_Ing_14_M"; [0] = "DANCE_T00_Step00_Ing_00"}
PaGlobal_DanceAction = {
_controller = {list2_DanceList = (UI.getChildControl)(Panel_DanceAction, "List2_SlotContainer")}
, slotCountPerLine = 5, _danceCount = 45, _selectIndex = -1}
-- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_DanceAction.Initialize = function(self)
  -- function num : 0_0
  self._selectIndex = -1
  local uiList2 = (PaGlobal_DanceAction._controller).list2_DanceList
  uiList2:registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PanelDanceAction_Ev_ControlCreate")
  uiList2:createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (uiList2:getElementManager()):clearKey()
  local pushKeycount = self._danceCount / self.slotCountPerLine
  for pushKeyIndex = 0, pushKeycount - 1 do
    (uiList2:getElementManager()):pushKey(pushKeyIndex)
  end
  local addButton = (UI.getChildControl)(Panel_DanceAction, "Button_Add")
  addButton:addInputEvent("Mouse_LUp", "PanelDanceAction_Add()")
end

PanelDanceAction_Ev_ControlCreate = function(control, key)
  -- function num : 0_1
  key = Int64toInt32(key)
  for i = 0, PaGlobal_DanceAction.slotCountPerLine - 1 do
    local relativePos = i + key * PaGlobal_DanceAction.slotCountPerLine
    local uiContent = (UI.getChildControl)(control, "Radiobutton_Slot_" .. tostring(i))
    uiContent:addInputEvent("Mouse_LUp", "PanelDanceAction_SlotEvent_MouseLUp(" .. relativePos .. ")")
    uiContent:SetShow(relativePos < PaGlobal_DanceAction._danceCount)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

PanelDanceAction_SlotEvent_MouseLUp = function(danceIndex)
  -- function num : 0_2 , upvalues : tmpDanceList
  Proc_ShowMessage_Ack("DANCE_IDX: " .. tostring(danceIndex))
  ;
  (getGameDanceEditor()):playDanceUnit(tmpDanceList[danceIndex])
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_DanceAction._selectIndex = danceIndex
end

PanelDanceAction_Add = function()
  -- function num : 0_3 , upvalues : tmpDanceList
  Proc_ShowMessage_Ack("SELECT_IDX: " .. tostring(PaGlobal_DanceEdit._selectIndex))
  local destPos = PaGlobal_DanceEdit._selectIndex
  if destPos ~= -1 then
    destPos = destPos + 1
  end
  ;
  (getGameDanceEditor()):addDanceUnit(destPos, tmpDanceList[PaGlobal_DanceAction._selectIndex])
  PaGlobal_DanceEdit:UpdateList()
end

PaGlobal_DanceAction:Initialize()

