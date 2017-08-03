-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\guildwharf\panel_window_guildwharffunction.luac 

-- params : ...
-- function num : 0
Panel_Window_GuildWharfFunction:SetShow(false, false)
Panel_Window_GuildWharfFunction:setMaskingChild(true)
Panel_Window_GuildWharfFunction:ActiveMouseEventEffect(true)
local _wharfBG = (UI.getChildControl)(Panel_Window_GuildWharfFunction, "Static_WharfTitle")
_wharfBG:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local guildWharfFunction = {
_config = {}
, _buttonRegister = (UI.getChildControl)(Panel_Window_GuildWharfFunction, "Button_Register"), _buttonExit = (UI.getChildControl)(Panel_Window_GuildWharfFunction, "Button_Exit")}
guildWharfFunction.init = function(self)
  -- function num : 0_0
end

guildWharfFunction.registEventHandler = function(self)
  -- function num : 0_1
  (self._buttonRegister):addInputEvent("Mouse_LUp", "GuildWharfFunction_Button_RegisterReady()")
  ;
  (self._buttonExit):addInputEvent("Mouse_LUp", "GuildWharfFunction_Close()")
end

guildWharfFunction.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("onScreenResize", "GuildWharfFunction_Resize")
  registerEvent("FromClient_ServantUpdate", "GuildWharfFunction_RegisterAck")
end

GuildWharfFunction_Resize = function()
  -- function num : 0_3 , upvalues : guildWharfFunction, _wharfBG
  local self = guildWharfFunction
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_Window_GuildWharfFunction:SetSize(screenX, Panel_Window_GuildWharfFunction:GetSizeY())
  _wharfBG:SetSize(screenX, Panel_Window_GuildWharfFunction:GetSizeY())
  Panel_Window_GuildWharfFunction:ComputePos()
  _wharfBG:ComputePos()
  ;
  (self._buttonRegister):ComputePos()
  ;
  (self._buttonExit):ComputePos()
end

GuildWharfFunction_Button_RegisterReady = function()
  -- function num : 0_4 , upvalues : guildWharfFunction
  Inventory_SetFunctor(InvenFiler_Mapae, GuildWharfFunction_Register, Servant_InventoryClose, nil)
  Inventory_ShowToggle()
  audioPostEvent_SystemUi(0, 0)
  ;
  (guildWharfFunction._buttonRegister):EraseAllEffect()
end

GuildWharfFunction_Register = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_5
  GuildWharfRegister_OpenByInventory(inventoryType, slotNo)
end

GuildWharfFunction_RegisterAck = function()
  -- function num : 0_6 , upvalues : guildWharfFunction
  if GetUIMode() == (Defines.UIMode).eUIMode_Default then
    return 
  end
  if Panel_Window_GuildWharf_List:GetShow() == false then
    return 
  end
  Inventory_SetFunctor(nil)
  InventoryWindow_Close()
  GuildWharfRegister_Close()
  local self = guildWharfFunction
end

GuildWharfFunction_Open = function()
  -- function num : 0_7 , upvalues : guildWharfFunction
  if Panel_Window_GuildWharfFunction:GetShow() then
    return 
  end
  guildstable_listGuildServant()
  Servant_SceneOpen(Panel_Window_GuildWharfFunction)
  GuildWharfList_Open()
  local self = guildWharfFunction
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

GuildWharfFunction_Close = function()
  -- function num : 0_8 , upvalues : guildWharfFunction
  audioPostEvent_SystemUi(0, 0)
  local self = guildWharfFunction
  ;
  (self._buttonRegister):EraseAllEffect()
  InventoryWindow_Close()
  GuildWharfList_Close()
  if not Panel_Window_GuildWharfFunction:GetShow() then
    return 
  end
  Servant_SceneClose(Panel_Window_GuildWharfFunction)
end

guildWharfFunction:init()
guildWharfFunction:registEventHandler()
guildWharfFunction:registMessageHandler()
WharfFunction_Resize()

