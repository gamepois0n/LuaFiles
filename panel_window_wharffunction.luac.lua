-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\wharf\panel_window_wharffunction.luac 

-- params : ...
-- function num : 0
Panel_Window_WharfFunction:SetShow(false, false)
Panel_Window_WharfFunction:setMaskingChild(true)
Panel_Window_WharfFunction:ActiveMouseEventEffect(true)
local UI_TM = CppEnums.TextMode
local _wharfBG = (UI.getChildControl)(Panel_Window_WharfFunction, "Static_WharfTitle")
_wharfBG:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local wharfFunction = {
_config = {}
, _buttonRegister = (UI.getChildControl)(Panel_Window_WharfFunction, "Button_Register"), _buttonExit = (UI.getChildControl)(Panel_Window_WharfFunction, "Button_Exit"), _descBG = (UI.getChildControl)(Panel_Window_WharfFunction, "StaticText_DescBg")}
wharfFunction.init = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  (self._descBG):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._descBG):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_DESC_GUILDWARF_SHIPSTOCKITEM"))
  local descTxtSizeX = (self._descBG):GetTextSizeX()
  ;
  (self._descBG):setPadding((CppEnums.Padding).ePadding_Left, 10)
  ;
  (self._descBG):setPadding((CppEnums.Padding).ePadding_Top, 10)
  ;
  (self._descBG):setPadding((CppEnums.Padding).ePadding_Right, 10)
  ;
  (self._descBG):setPadding((CppEnums.Padding).ePadding_Bottom, 10)
  ;
  (self._descBG):SetSize(descTxtSizeX + 20, (self._descBG):GetTextSizeY() + 20)
end

wharfFunction.registEventHandler = function(self)
  -- function num : 0_1
  (self._buttonRegister):addInputEvent("Mouse_LUp", "WharfFunction_Button_RegisterReady()")
  ;
  (self._buttonExit):addInputEvent("Mouse_LUp", "WharfFunction_Close()")
end

wharfFunction.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("onScreenResize", "WharfFunction_Resize")
  registerEvent("FromClient_ServantUpdate", "WharfFunction_RegisterAck")
end

WharfFunction_Resize = function()
  -- function num : 0_3 , upvalues : wharfFunction, _wharfBG
  local self = wharfFunction
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_Window_WharfFunction:SetSize(screenX, Panel_Window_WharfFunction:GetSizeY())
  _wharfBG:SetSize(screenX, Panel_Window_WharfFunction:GetSizeY())
  Panel_Window_WharfFunction:ComputePos()
  _wharfBG:ComputePos()
  ;
  (self._buttonRegister):ComputePos()
  ;
  (self._buttonExit):ComputePos()
  ;
  (self._descBG):ComputePos()
end

WharfFunction_Button_RegisterReady = function()
  -- function num : 0_4
  Inventory_SetFunctor(InvenFiler_Mapae, WharfFunction_Register, Servant_InventoryClose, nil)
  Inventory_ShowToggle()
  audioPostEvent_SystemUi(0, 0)
end

WharfFunction_Register = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_5
  WharfRegister_OpenByInventory(inventoryType, slotNo)
end

WharfFunction_RegisterAck = function()
  -- function num : 0_6 , upvalues : wharfFunction
  if GetUIMode() == (Defines.UIMode).eUIMode_Default then
    return 
  end
  if Panel_Window_WharfList:GetShow() == false then
    return 
  end
  Inventory_SetFunctor(nil)
  InventoryWindow_Close()
  WharfRegister_Close()
  local self = wharfFunction
  ;
  (self._buttonRegister):EraseAllEffect()
end

WharfFunction_Open = function()
  -- function num : 0_7 , upvalues : wharfFunction
  if Panel_Window_WharfFunction:GetShow() then
    return 
  end
  Servant_SceneOpen(Panel_Window_WharfFunction)
  WharfList_Open()
  local self = wharfFunction
  if stable_doHaveRegisterItem() then
    local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_WHARF_REGISTERITEM_MSG")
    local messageboxData = {title = messageboxTitle, content = messageboxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    ;
    (self._buttonRegister):EraseAllEffect()
    ;
    (self._buttonRegister):AddEffect("UI_ArrowMark01", true, 25, -38)
  else
    do
      ;
      (self._buttonRegister):EraseAllEffect()
    end
  end
end

WharfFunction_Close = function()
  -- function num : 0_8 , upvalues : wharfFunction
  audioPostEvent_SystemUi(0, 0)
  local self = wharfFunction
  ;
  (self._buttonRegister):EraseAllEffect()
  InventoryWindow_Close()
  WharfList_Close()
  if not Panel_Window_WharfFunction:GetShow() then
    return 
  end
  Servant_SceneClose(Panel_Window_WharfFunction)
end

wharfFunction:init()
wharfFunction:registEventHandler()
wharfFunction:registMessageHandler()
WharfFunction_Resize()

