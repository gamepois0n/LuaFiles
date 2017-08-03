-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\enduarance\weight_main.luac 

-- params : ...
-- function num : 0
PaGlobalPlayerWeightList = {weight, weightText; panel = Panel_Endurance, repair_AutoNavi = (UI.getChildControl)(Panel_Endurance, "CheckButton_Repair_AutoNavi")}
-- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

PaGlobalPlayerWeightList.initialize = function(self)
  -- function num : 0_0
  self.weight = (UI.getChildControl)(self.panel, "StaticText_WeightOver")
  self.weightText = (UI.getChildControl)(self.panel, "StaticText_NoticeWeight")
  ;
  (self.weight):SetShow(false)
  ;
  (self.weightText):SetShow(false)
  ;
  (self.weight):addInputEvent("Mouse_On", "HandleMPcWeightOver( true )")
  ;
  (self.weight):addInputEvent("Mouse_Out", "HandleMPcWeightOver( false )")
end

HandleMPcWeightOver = function(isShow)
  -- function num : 0_1
  local self = PaGlobalPlayerWeightList
  if isShow == true then
    (self.weightText):SetShow(true)
    ;
    (self.weightText):SetPosX((self.weight):GetPosX() - (self.weightText):GetTextSizeX() - 25)
    ;
    (self.weightText):SetPosY((self.weight):GetPosY() - 4)
  else
    ;
    (self.weightText):SetShow(false)
  end
end

PaGlobalPlayerWeightList:initialize()

