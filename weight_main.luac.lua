-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\enduarance\weight_main.luac 

-- params : ...
-- function num : 0
PaGlobalPlayerWeightList = {panel = Panel_Endurance, weight = (UI.getChildControl)(Panel_Endurance, "StaticText_WeightOver"), weightText = (UI.getChildControl)(Panel_Endurance, "StaticText_NoticeWeight"), repair_AutoNavi = (UI.getChildControl)(Panel_Endurance, "CheckButton_Repair_AutoNavi")}
-- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

PaGlobalPlayerWeightList.initialize = function(self)
  -- function num : 0_0
  (self.weight):SetShow(false)
  ;
  (self.weightText):SetShow(false)
  ;
  (self.weightText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHT_MAIN_DEFAULT_VISUAL"))
  ;
  (self.weightText):SetPosX((self.weight):GetPosX() - (self.weightText):GetTextSizeX() - 25)
  ;
  (self.weightText):SetPosY((self.weight):GetPosY() - 4)
  ;
  (self.weight):addInputEvent("Mouse_On", "PaGlobalPlayerWeightList_MouseOver(true)")
  ;
  (self.weight):addInputEvent("Mouse_Out", "PaGlobalPlayerWeightList_MouseOver(false)")
  ;
  (self.weight):addInputEvent("Mouse_LUp", "PaGlobal_EasyBuy:Open( 3, 1 )")
end

PaGlobalPlayerWeightList_MouseOver = function(isShow)
  -- function num : 0_1
  local self = PaGlobalPlayerWeightList
  if isShow == true then
    (self.weightText):SetShow(true)
    ;
    (self.weightText):SetPosX((self.weight):GetPosX() - (self.weightText):GetTextSizeX() - 25)
    ;
    (self.weightText):SetPosY((self.weight):GetPosY() - 4)
    ;
    (self.weightText):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_ENDURANCE_STCTXT_NOTICEWEIGHT") .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_WEIGHTHELP_4"))
  else
    ;
    (self.weightText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WEIGHT_MAIN_DEFAULT_VISUAL"))
    ;
    (self.weightText):SetShow(true)
  end
end

PcEnduranceToggle = function()
  -- function num : 0_2
  local self = PaGlobalPlayerWeightList
  return (self.weight):GetShow()
end

PaGlobalPlayerWeightList:initialize()

