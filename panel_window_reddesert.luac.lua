-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\mercenary\panel_window_reddesert.luac 

-- params : ...
-- function num : 0
local isDev = isGameServiceTypeDev()
Panel_Window_RedDesert:SetShow(false)
PaGlobal_RedDesert = {
_ui = {_static_Balenos = (UI.getChildControl)(Panel_Window_RedDesert, "Static_CapheonBg"), _static_Serendia = (UI.getChildControl)(Panel_Window_RedDesert, "Static_MediaBg"), _static_Calpheon = (UI.getChildControl)(Panel_Window_RedDesert, "Static_ValenciaBg"), _btn_selectBalenos = nil, _btn_selectSerendia = nil, _btn_selectCalpheon = nil}
}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RedDesert.initialize = function(self)
  -- function num : 0_0 , upvalues : isDev
  local isSelect = ToClient_IsSelectableTerritory()
  if isSelect == true and isDev == true then
    PaGlobal_RedDesert:open()
  else
    PaGlobal_RedDesert:close()
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._btn_selectBalenos = (UI.getChildControl)((self._ui)._static_Balenos, "Button_Attack")
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._btn_selectSerendia = (UI.getChildControl)((self._ui)._static_Serendia, "Button_Attack")
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._btn_selectCalpheon = (UI.getChildControl)((self._ui)._static_Calpheon, "Button_Attack")
  ;
  ((self._ui)._btn_selectBalenos):addInputEvent("Mouse_LUp", "PaGlobal_RedDesert:selectTerritory( " .. 0 .. " )")
  ;
  ((self._ui)._btn_selectSerendia):addInputEvent("Mouse_LUp", "PaGlobal_RedDesert:selectTerritory( " .. 1 .. " )")
  ;
  ((self._ui)._btn_selectCalpheon):addInputEvent("Mouse_LUp", "PaGlobal_RedDesert:selectTerritory( " .. 2 .. " )")
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RedDesert.open = function(self)
  -- function num : 0_1
  Panel_Window_RedDesert:SetShow(true)
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RedDesert.close = function(self)
  -- function num : 0_2
  Panel_Window_RedDesert:SetShow(false)
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_RedDesert.selectTerritory = function(self, index)
  -- function num : 0_3
  ToClient_requestSelectRealm(index)
  _PA_LOG("임승�\177", "영지선택 :" .. tostring(index))
end

FromClient_UpdateDDTerritoryKey = function(index)
  -- function num : 0_4
  _PA_LOG("임승�\177", "영지선택�\132 :::" .. tostring(index))
  PaGlobal_RedDesert:close()
end

registerEvent("FromClient_UpdateDDTerritoryKey", "FromClient_UpdateDDTerritoryKey")
PaGlobal_RedDesert:initialize()

