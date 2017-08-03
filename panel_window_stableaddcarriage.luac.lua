-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stableaddcarriage.luac 

-- params : ...
-- function num : 0
Panel_AddToCarriage:SetShow(false, false)
Panel_AddToCarriage:setMaskingChild(true)
Panel_AddToCarriage:ActiveMouseEventEffect(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local stableCarriage = {_staticIcon1 = (UI.getChildControl)(Panel_AddToCarriage, "Static_ServantIcon_1"), _staticIcon2 = (UI.getChildControl)(Panel_AddToCarriage, "Static_ServantIcon_2"), _staticInfo1 = (UI.getChildControl)(Panel_AddToCarriage, "StaticText_Info1"), _staticInfo2 = (UI.getChildControl)(Panel_AddToCarriage, "StaticText_Info2"), _staticNotify = (UI.getChildControl)(Panel_AddToCarriage, "StaticText_Notify"), _buttonAdd = (UI.getChildControl)(Panel_AddToCarriage, "Button_Add"), _buttonCancel = (UI.getChildControl)(Panel_AddToCarriage, "Button_Cancel"), _buttonClose = (UI.getChildControl)(Panel_AddToCarriage, "Button_Close"), _staticPrice = (UI.getChildControl)(Panel_AddToCarriage, "StaticText_Price"), _slotNo1 = nil, _slotNo2 = nil}
stableCarriage.init = function(self)
  -- function num : 0_0
  self._slotNo1 = nil
  self._slotNo2 = nil
  ;
  (self._staticInfo1):SetText("")
  ;
  (self._staticInfo2):SetText("")
  ;
  (self._staticIcon1):SetShow(false)
  ;
  (self._staticIcon2):SetShow(false)
  ;
  (self._staticNotify):SetShow(true)
  ;
  (self._staticNotify):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_LINK_DESC_1"))
  Panel_AddToCarriage:SetPosX((getScreenSizeX() - Panel_AddToCarriage:GetSizeX()) / 2)
  Panel_AddToCarriage:SetPosY((getScreenSizeY() - Panel_AddToCarriage:GetSizeY()) / 3)
end

stableCarriage.update = function(self)
  -- function num : 0_1
  (self._staticIcon1):SetShow(false)
  ;
  (self._staticIcon2):SetShow(false)
  ;
  (self._staticInfo1):SetShow(false)
  ;
  (self._staticInfo2):SetShow(false)
  do
    if self._slotNo1 ~= nil then
      local servantInfo1 = stable_getServant(self._slotNo1)
      if servantInfo1 ~= nil then
        (self._staticIcon1):ChangeTextureInfoName(servantInfo1:getIconPath1())
        ;
        (self._staticInfo1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. servantInfo1:getLevel() .. " " .. servantInfo1:getName())
        ;
        (self._staticInfo1):SetShow(true)
        ;
        (self._staticIcon1):SetShow(true)
      end
    end
    do
      if self._slotNo2 ~= nil then
        local servantInfo2 = stable_getServant(self._slotNo2)
        if servantInfo2 ~= nil then
          (self._staticIcon2):ChangeTextureInfoName(servantInfo2:getIconPath1())
          ;
          (self._staticInfo2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. servantInfo2:getLevel() .. " " .. servantInfo2:getName())
          ;
          (self._staticInfo2):SetShow(true)
          ;
          (self._staticIcon2):SetShow(true)
        end
      end
      if self._slotNo1 ~= nil or self._slotNo2 ~= nil then
        (self._staticNotify):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_LINK_DESC_1"))
      end
      if self._slotNo1 ~= nil and self._slotNo2 ~= nil then
        (self._staticNotify):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_LINK_DESC_2"))
      end
    end
  end
end

stableCarriage.registEventHandler = function(self)
  -- function num : 0_2
  (self._buttonAdd):addInputEvent("Mouse_LUp", "stableCarriage_Add()")
  ;
  (self._buttonCancel):addInputEvent("Mouse_LUp", "stableCarriage_Close()")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "stableCarriage_Close()")
  ;
  (self._staticIcon1):addInputEvent("Mouse_RUp", "stableCarriage_ClearSlot( 1 )")
  ;
  (self._staticIcon2):addInputEvent("Mouse_RUp", "stableCarriage_ClearSlot( 2 )")
end

stableCarriage.registMessageHandler = function(self)
  -- function num : 0_3
  registerEvent("onScreenResize", "stableCarriage_Resize")
end

stableCarriage_Add = function()
  -- function num : 0_4 , upvalues : stableCarriage
  local self = stableCarriage
  if self._slotNo1 == nil or self._slotNo2 == nil then
    return 
  end
  stable_link(self._slotNo2, self._slotNo1, true)
  stableCarriage_Close()
  FGlobal_StableList_Update()
  StableInfo_Close()
end

stableCarriage_ClearSlot = function(slotType)
  -- function num : 0_5 , upvalues : stableCarriage
  local self = stableCarriage
  if slotType == 1 then
    self._slotNo1 = nil
    ;
    (self._staticNotify):SetShow(true)
  else
    self._slotNo2 = nil
    ;
    (self._staticNotify):SetShow(true)
  end
  self:update()
end

stableCarriage_Set = function(slotNo, slotIndex)
  -- function num : 0_6 , upvalues : stableCarriage
  local self = stableCarriage
  local servantInfo = nil
  if slotIndex == nil then
    servantInfo = stable_getServant(slotNo)
  else
    servantInfo = stable_getServant(slotNo)
  end
  if servantInfo == nil then
    return 
  end
  local vehicleType = servantInfo:getVehicleType()
  if (CppEnums.VehicleType).Type_Carriage == vehicleType or (CppEnums.VehicleType).Type_RepairableCarriage == vehicleType then
    self._slotNo1 = slotNo
  else
    if (CppEnums.VehicleType).Type_Horse == vehicleType then
      self._slotNo2 = slotNo
    end
  end
  self:update()
end

stableCarriage_Open = function()
  -- function num : 0_7 , upvalues : stableCarriage
  if Panel_AddToCarriage:GetShow() then
    return 
  end
  if Panel_Window_StableMarket:GetShow() then
    StableMarket_Close()
  end
  if Panel_Window_StableMating:GetShow() then
    StableMating_Close()
  end
  if Panel_Window_StableMix:GetShow() then
    StableMix_Close()
  end
  local self = stableCarriage
  self:init()
  self:update()
  Panel_AddToCarriage:SetShow(true)
end

stableCarriage_Close = function()
  -- function num : 0_8 , upvalues : stableCarriage
  local self = stableCarriage
  if not Panel_AddToCarriage:GetShow() then
    return 
  end
  Panel_AddToCarriage:SetShow(false)
end

stableCarriage_Resize = function()
  -- function num : 0_9 , upvalues : stableCarriage
  local self = stableCarriage
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_AddToCarriage:ComputePos()
  ;
  (self._staticIcon1):ComputePos()
  ;
  (self._staticIcon2):ComputePos()
end

stableCarriage:init()
stableCarriage:registEventHandler()
stableCarriage:registMessageHandler()
stableCarriage_Resize()

