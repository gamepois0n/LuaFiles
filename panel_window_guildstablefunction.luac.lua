-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\guildstable\panel_window_guildstablefunction.luac 

-- params : ...
-- function num : 0
Panel_Window_GuildStableFunction:SetShow(false, false)
Panel_Window_GuildStableFunction:setMaskingChild(true)
Panel_Window_GuildStableFunction:ActiveMouseEventEffect(true)
Panel_Window_GuildStableFunction:RegisterShowEventFunc(true, "")
Panel_Window_GuildStableFunction:RegisterShowEventFunc(false, "")
local _stableBG = (UI.getChildControl)(Panel_Window_GuildStableFunction, "Static_StableTitle")
_stableBG:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local guildStableFunction = {
config = {}
, _buttonRegister = (UI.getChildControl)(Panel_Window_GuildStableFunction, "Button_RegisterByItem"), _textRegist = (UI.getChildControl)(Panel_Window_GuildStableFunction, "StaticText_Purpose"), _buttonExit = (UI.getChildControl)(Panel_Window_GuildStableFunction, "Button_Exit"), _funcBtnCount = 0, 
_funcBtnRePos = {}
}
guildStableFunction.init = function(self)
  -- function num : 0_0 , upvalues : guildStableFunction
  (guildStableFunction._textRegist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEFUNCTION_TEXTREGIST"))
  ;
  (guildStableFunction._textRegist):SetShow(false)
end

guildStableFunction.registEventHandler = function(self)
  -- function num : 0_1
  (self._buttonRegister):addInputEvent("Mouse_LUp", "GuildStableFunction_Button_RegisterReady()")
  ;
  (self._buttonExit):addInputEvent("Mouse_LUp", "GuildStableFunction_Close()")
end

guildStableFunction.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("onScreenResize", "GuildStableFunction_Resize")
  registerEvent("FromClient_ServantUpdate", "GuildStableFunction_RegisterAck")
end

GuildStableFunction_Resize = function()
  -- function num : 0_3 , upvalues : guildStableFunction, _stableBG
  local self = guildStableFunction
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_Window_GuildStableFunction:SetSize(screenX, Panel_Window_GuildStableFunction:GetSizeY())
  _stableBG:SetSize(screenX, Panel_Window_GuildStableFunction:GetSizeY())
  Panel_Window_GuildStableFunction:ComputePos()
  _stableBG:ComputePos()
  ;
  (self._buttonRegister):ComputePos()
  ;
  (self._buttonExit):ComputePos()
  ;
  (self._textRegist):ComputePos()
  ;
  (self._textRegist):SetSpanSize(0, -screenY * 3 / 4)
end

GuildStableFunction_Button_RegisterReady = function(slotNo)
  -- function num : 0_4
  Inventory_SetFunctor(InvenFiler_Mapae, GuildStableFunction_Button_Register, Servant_InventoryClose, nil)
  Inventory_ShowToggle()
  audioPostEvent_SystemUi(0, 0)
end

GuildStableFunction_Button_Register = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_5
  GuildStableRegister_OpenByInventory(inventoryType, slotNo)
end

GuildStableFunction_RegisterAck = function()
  -- function num : 0_6 , upvalues : guildStableFunction
  if GetUIMode() == (Defines.UIMode).eUIMode_Default then
    return 
  end
  if Panel_Window_GuildStable_List:GetShow() == false then
    return 
  end
  Inventory_SetFunctor(nil)
  InventoryWindow_Close()
  local self = guildStableFunction
  ;
  (self._buttonRegister):EraseAllEffect()
end

GuildStableFunction_Open = function()
  -- function num : 0_7 , upvalues : guildStableFunction
  local self = guildStableFunction
  guildstable_listGuildServant()
  Servant_SceneOpen(Panel_Window_GuildStableFunction)
  GuildStableList_Open()
  GuildStablefuncButtonRePosition()
  FGlobal_NeedGuildStableRegistItem_Print()
end

GuildStablefuncButtonRePosition = function()
  -- function num : 0_8 , upvalues : guildStableFunction
  local self = guildStableFunction
  self._funcBtnRePos = {}
  self._funcBtnCount = 0
  if stable_doHaveRegisterItem() then
    local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STABEL_REGISTERITEM_MSG")
    local messageboxData = {title = messageboxTitle, content = messageboxMemo, functionApply = FGlobal_NeedStableRegistItem_Print, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
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
      -- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (self._funcBtnRePos)[self._funcBtnCount] = self._buttonRegister
      self._funcBtnCount = self._funcBtnCount + 1
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (self._funcBtnRePos)[self._funcBtnCount] = self._buttonExit
      self._funcBtnCount = self._funcBtnCount + 1
      local gapX = 16
      local startPosX = getScreenSizeX() / 2 - ((guildStableFunction._buttonExit):GetSizeX() / 2 * self._funcBtnCount + (self._funcBtnCount - 1) * gapX)
      for index = 0, self._funcBtnCount - 1 do
        ((self._funcBtnRePos)[index]):SetPosX(startPosX + index * ((guildStableFunction._buttonExit):GetSizeX() + gapX))
      end
    end
  end
end

FGlobal_NeedGuildStableRegistItem_Print = function()
  -- function num : 0_9 , upvalues : guildStableFunction
  local self = guildStableFunction
  if stable_doHaveRegisterItem() then
    (self._textRegist):SetShow(true)
  else
    ;
    (self._textRegist):SetShow(false)
  end
end

GuildStableFunction_Close = function()
  -- function num : 0_10 , upvalues : guildStableFunction
  audioPostEvent_SystemUi(0, 0)
  local self = guildStableFunction
  ;
  (self._buttonRegister):EraseAllEffect()
  InventoryWindow_Close()
  GuildStableList_Close()
  if not Panel_Window_GuildStableFunction:GetShow() then
    return 
  end
  Servant_SceneClose(Panel_Window_GuildStableFunction)
  Dialog_updateButtons(true)
end

guildStableFunction:init()
guildStableFunction:registEventHandler()
guildStableFunction:registMessageHandler()
GuildStableFunction_Resize()

