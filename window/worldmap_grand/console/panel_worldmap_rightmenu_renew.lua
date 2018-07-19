local Window_WorldMap_RightMenuInfo = {
  _ui = {
    _button_BuyHouse = UI.getChildControl(Panel_Worldmap_RightMenu, "Button_BuyHouse"),
    _button_Stable = UI.getChildControl(Panel_Worldmap_RightMenu, "Button_Stable"),
    _button_WareHouse = UI.getChildControl(Panel_Worldmap_RightMenu, "Button_WareHouse"),
    _button_Delivery = UI.getChildControl(Panel_Worldmap_RightMenu, "Button_Delivery")
  },
  _currentNodeInfo = nil
}
function PaGlobalFunc_WorldMap_RightMenu_SetCurrentNodeInfo(nodeInfo)
  local self = Window_WorldMap_RightMenuInfo
  self._currentNodeInfo = nodeInfo
end
function Window_WorldMap_RightMenuInfo:InitControl()
end
function PaGlobalFunc_WorldMap_RightMenu_OpenBuyHouse()
  local self = Window_WorldMap_RightMenuInfo
  PaGlobalFunc_WorldMap_BuyHouse_SetCurrentNodeInfo(self._currentNodeInfo)
  PaGlobalFunc_WorldMap_BuyHouse_Open()
end
function PaGlobalFunc_WorldMap_RightMenu_OpenStable()
  local self = Window_WorldMap_RightMenuInfo
  if false == PaGlobalFunc_WorldMap_Stable_GetShow() then
    if nil ~= self._currentNodeInfo then
      PaGlobalFunc_WorldMap_Stable_SetCurrentNodeInfo(self._currentNodeInfo)
      PaGlobalFunc_WorldMap_Stable_Open()
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_GRAND_WRONG_STABLE"))
      return
    end
  end
end
function PaGlobalFunc_WorldMap_RightMenu_OpenWareHouse()
  local self = Window_WorldMap_RightMenuInfo
  if Panel_Window_Warehouse:GetShow() then
    Warehouse_Close()
  elseif nil ~= self._currentNodeInfo then
    local waypointKey = self._currentNodeInfo:getPlantKey():getWaypointKey()
    Warehouse_OpenPanelFromWorldmap(waypointKey, CppEnums.WarehoouseFromType.eWarehoouseFromType_Worldmap)
    PaGlobalFunc_WorldMap_TopMenu_Close()
    PaGlobalFunc_WorldMap_BottomMenu_Close()
    PaGlobalFunc_WorldMap_RightMenu_Close()
  end
end
function PaGlobalFunc_WorldMap_RightMenu_OpenDelivery()
  local self = Window_WorldMap_RightMenuInfo
  if Panel_Window_Warehouse:GetShow() then
    Warehouse_Close()
  elseif nil ~= self._currentNodeInfo then
    local waypointKey = self._currentNodeInfo:getPlantKey():getWaypointKey()
    Warehouse_OpenPanelFromWorldmap(waypointKey, CppEnums.WarehoouseFromType.eWarehoouseFromType_Worldmap)
    PaGlobalFunc_PanelDelivery_OpenDeliveryTab()
    PaGlobalFunc_WorldMap_TopMenu_Close()
    PaGlobalFunc_WorldMap_BottomMenu_Close()
    PaGlobalFunc_WorldMap_RightMenu_Close()
  end
end
function Window_WorldMap_RightMenuInfo:InitEvent()
  self._ui._button_BuyHouse:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_RightMenu_OpenBuyHouse()")
  self._ui._button_Stable:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_RightMenu_OpenStable()")
  self._ui._button_WareHouse:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_RightMenu_OpenWareHouse()")
  self._ui._button_Delivery:addInputEvent("Mouse_LUp", "PaGlobalFunc_WorldMap_RightMenu_OpenDelivery()")
end
function Window_WorldMap_RightMenuInfo:InitRegister()
end
function Window_WorldMap_RightMenuInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_WorldMap_RightMenu_Toggle()
  if true == PaGlobalFunc_WorldMap_RightMenu_GetShow() then
    PaGlobalFunc_WorldMap_RingMenu_Open()
    PaGlobalFunc_WorldMap_RightMenu_Close()
  else
    PaGlobalFunc_WorldMap_RingMenu_Close()
    PaGlobalFunc_WorldMap_RightMenu_Open()
  end
end
function PaGlobalFunc_WorldMap_RightMenu_GetShow()
  return Panel_Worldmap_RightMenu:GetShow()
end
function PaGlobalFunc_WorldMap_RightMenu_SetShow(isShow, isAni)
  Panel_Worldmap_RightMenu:SetShow(isShow, isAni)
end
function PaGlobalFunc_WorldMap_RightMenu_Open()
  local self = Window_WorldMap_RightMenuInfo
  if true == PaGlobalFunc_WorldMap_RightMenu_GetShow() then
    return
  end
  PaGlobalFunc_WorldMap_RightMenu_SetShow(true, false)
end
function PaGlobalFunc_WorldMap_RightMenu_Close()
  if false == PaGlobalFunc_WorldMap_RightMenu_GetShow() then
    return
  end
  PaGlobalFunc_WorldMap_RightMenu_SetShow(false, false)
end
function PaGlobalFunc_FromClient_WorldMap_RightMenu_luaLoadComplete()
  local self = Window_WorldMap_RightMenuInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_WorldMap_RightMenu_luaLoadComplete")
