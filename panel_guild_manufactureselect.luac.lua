-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_manufactureselect.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_ManufactureSelect = {
_ui = {_closeButton = (UI.getChildControl)(Panel_Guild_ManufactureSelect, "Button_Close"), _staticBG = (UI.getChildControl)(Panel_Guild_ManufactureSelect, "Static_BG"), _baseSlot = (UI.getChildControl)(Panel_Guild_ManufactureSelect, "Static_Slot")}
, 
_config = {_col = 6, _startPosX = 10, _startPosY = 10, _gapX = 60, _gapY = 60}
, 
_slotConfig = {createIcon = true, createBorder = true, createEnchant = true}
, _slot = (Array.new)(), _index = -1}
-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.initialize = function(self)
  -- function num : 0_0
  local productItemList = ToClient_Guild_Manufacture_ProductList()
  if productItemList == nil then
    return 
  end
  local col = 0
  local row = 0
  for ii = 0, #productItemList do
    local slot = {}
    slot.bg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (self._ui)._staticBG, "ProductItemBG_" .. ii)
    CopyBaseProperty((self._ui)._baseSlot, slot.bg)
    row = (math.floor)(ii / (self._config)._col)
    col = ii % (self._config)._col
    ;
    (slot.bg):SetPosX((self._config)._startPosX + (self._config)._gapX * (col))
    ;
    (slot.bg):SetPosY((self._config)._startPosY + (self._config)._gapY * row)
    ;
    (slot.bg):SetShow(true)
    ;
    (SlotItem.new)(slot, "ProductItemIcon_" .. ii, ii, slot.bg, self._slotConfig)
    slot:createChild()
    ;
    (slot.icon):SetPosX(4)
    ;
    (slot.icon):SetPosY(4)
    ;
    (slot.icon):SetShow(true)
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "PaGlobal_Guild_ManufactureSelect:select(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "PaGlobal_Guild_ManufactureSelect:itemTooltip_Show(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "PaGlobal_Guild_ManufactureSelect:itemTooltip_Hide()")
    local itemEnchantKey = productItemList[ii]
    local itemWrapper = getItemEnchantStaticStatus(itemEnchantKey)
    slot:setItemByStaticStatus(itemWrapper)
    slot.itemEnchantKey = itemEnchantKey
    -- DECOMPILER ERROR at PC115: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._slot)[ii] = slot
  end
  deleteControl((self._ui)._baseSlot)
  -- DECOMPILER ERROR at PC122: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._baseSlot = nil
  ;
  ((self._ui)._closeButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_ManufactureSelect:close()")
  local width = 410
  local height = (row + 1) * (self._config)._gapY + 90
  ;
  ((self._ui)._staticBG):SetSize(width - 28, height - 80)
  Panel_Guild_ManufactureSelect:SetSize(width, height)
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.open = function(self, index)
  -- function num : 0_1
  if Panel_Guild_ManufactureSelect:IsShow() == true then
    Proc_ShowMessage_Ack("[길드 �\128공] 선택창이 이미 열려 있습니다.")
    return 
  end
  self._index = index
  Panel_Guild_ManufactureSelect:SetShow(true)
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.close = function(self)
  -- function num : 0_2
  self._index = -1
  self:itemTooltip_Hide()
  Panel_Guild_ManufactureSelect:SetShow(false)
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.select = function(self, index)
  -- function num : 0_3
  PaGlobal_Guild_Manufacture:setProductItem(self._index, ((self._slot)[index]).itemEnchantKey)
  self:close()
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.itemTooltip_Show = function(self, index)
  -- function num : 0_4
  local slot = (self._slot)[index]
  if slot.itemEnchantKey == nil then
    return 
  end
  local itemStatic = getItemEnchantStaticStatus(slot.itemEnchantKey)
  if itemStatic ~= nil then
    Panel_Tooltip_Item_SetPosition(index, (self._ui)._staticBG, "guildManufactureProductItemSelect")
    Panel_Tooltip_Item_Show(itemStatic, Panel_Guild_ManufactureSelect, true)
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.itemTooltip_Hide = function(self)
  -- function num : 0_5
  Panel_Tooltip_Item_hideTooltip()
end

PaGlobal_Guild_ManufactureSelect:initialize()

