-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\righttopicons\panel_personalicon_dropitem.luac 

-- params : ...
-- function num : 0
Panel_Widget_DropItem:SetShow(false)
PaGlobal_DropItem = {
_ui = {_closeButton = (UI.getChildControl)(Panel_Widget_DropItem, "Button_Win_Close"), _regionTitle = (UI.getChildControl)(Panel_Widget_DropItem, "StaticText_RegionTitle"), _templeteSlotBg = (UI.getChildControl)(Panel_Widget_DropItem, "Static_ItemSlotBg"), _buttonDropItem = (UI.getChildControl)(Panel_Widget_DropItem, "Button_DropItemOpen"), 
_slotBg = {}
, 
_slot = {}
}
, 
_slotConfig = {createIcon = true, createBorder = true}
, _maxCount = 60, _currentRegionKey = nil}
-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DropItem.Init = function(self)
  -- function num : 0_0
  for index = 0, self._maxCount - 1 do
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._slotBg)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Widget_DropItem, "_DropItem_SlotBg_" .. index)
    CopyBaseProperty((self._ui)._templeteSlotBg, ((self._ui)._slotBg)[index])
    ;
    (((self._ui)._slotBg)[index]):SetShow(false)
    ;
    (((self._ui)._slotBg)[index]):SetPosX(((self._ui)._templeteSlotBg):GetPosX() + index % 6 * 50)
    ;
    (((self._ui)._slotBg)[index]):SetPosY(((self._ui)._templeteSlotBg):GetPosY() + (math.floor)(index / 6) * 50 + 5)
    local slot = {}
    ;
    (SlotItem.new)(slot, "DropItemSlot_" .. index, index, ((self._ui)._slotBg)[index], self._slotConfig)
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_On", "PaGlobal_DropItem:ItemTooltip_Show(" .. index .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "PaGlobal_DropItem:ItemTooltip_Hide()")
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui)._slot)[index] = slot
  end
  ;
  ((self._ui)._closeButton):addInputEvent("Mouse_LUp", "PaGlobal_DropItem:Close()")
  ;
  ((self._ui)._buttonDropItem):addInputEvent("Mouse_LUp", "PaGlobal_DropItem:OpenDropItemAll()")
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DropItem.Open = function(self)
  -- function num : 0_1
  Panel_Widget_DropItem:SetShow(true)
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DropItem.Close = function(self)
  -- function num : 0_2
  Panel_Widget_DropItem:SetShow(false)
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DropItem.OpenDropItemAll = function(self)
  -- function num : 0_3
  if self._currentRegionKey ~= nil then
    FGlobal_DropItemWindow_Open(self._currentRegionKey)
  end
end

FGlobal_DropItemOpen = function()
  -- function num : 0_4
  local self = PaGlobal_DropItem
  if Panel_Widget_DropItem:GetShow() then
    self:Close()
    return 
  end
  self:Update()
  self:Open()
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DropItem.Update = function(self)
  -- function num : 0_5
  local currentRegionKey = FGlobal_GetRegionKey_ByDropItem()
  local itemCount = ToClient_GetRegionDropItemSize(currentRegionKey)
  if itemCount > 0 then
    self._currentRegionKey = currentRegionKey
    for index = 0, self._maxCount - 1 do
      if index < itemCount then
        local itemSSW = ToClient_GetRegionDropItemWrapper(self._currentRegionKey, index)
        ;
        (((self._ui)._slot)[index]):setItemByStaticStatus(itemSSW)
        ;
        (((self._ui)._slotBg)[index]):SetShow(true)
      else
        do
          do
            ;
            (((self._ui)._slotBg)[index]):SetShow(false)
            -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    local sizeY = (math.floor)(itemCount / 6)
    Panel_Widget_DropItem:SetSize(Panel_Widget_DropItem:GetSizeX(), (((self._ui)._slotBg)[itemCount - 1]):GetPosY() + (((self._ui)._slotBg)[itemCount - 1]):GetSizeY() + 56)
    ;
    ((self._ui)._buttonDropItem):ComputePos()
  else
    do
      do return  end
      local regionWrapper = getRegionInfoWrapper(self._currentRegionKey)
      if regionWrapper == nil then
        return 
      end
      ;
      ((self._ui)._regionTitle):SetText(regionWrapper:getAreaName())
    end
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DropItem.ItemTooltip_Show = function(self, index)
  -- function num : 0_6
  local itemSSW = ToClient_GetRegionDropItemWrapper(self._currentRegionKey, index)
  if itemSSW ~= nil then
    Panel_Tooltip_Item_SetPosition(index, ((self._ui)._slot)[index], "dropItem")
    Panel_Tooltip_Item_Show(itemSSW, Panel_Widget_DropItem, true)
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_DropItem.ItemTooltip_Hide = function(self)
  -- function num : 0_7
  Panel_Tooltip_Item_hideTooltip()
end

PaGlobal_DropItem:Init()

