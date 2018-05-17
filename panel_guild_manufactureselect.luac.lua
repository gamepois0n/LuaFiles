-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_manufactureselect.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_ManufactureSelect = {
_ui = {_closeButton = (UI.getChildControl)(Panel_Guild_ManufactureSelect, "Button_Close"), _staticBG = (UI.getChildControl)(Panel_Guild_ManufactureSelect, "Static_BG"), _baseSlot = (UI.getChildControl)(Panel_Guild_ManufactureSelect, "Static_Slot"), _baseCategory = (UI.getChildControl)(Panel_Guild_ManufactureSelect, "StaticText_CategoryName")}
, 
_config = {_col = 6, _startPosX = 10, _startPosY = 24, _gapX = 60, _gapY = 60}
, 
_slotConfig = {createIcon = true, createBorder = true, createEnchant = true}
, 
_categoryList = {[0] = "등록�\157", [1] = "탑승�\188 장비", [2] = "탑승�\188 향상 재료"}
, _category = (Array.new)(), _itemEnchantKey = (Array.new)(), _index = -1}
-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.initialize = function(self)
  -- function num : 0_0
  for ii = 0, #self._categoryList do
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R5 in 'UnsetPending'

    (self._category)[ii] = {_title = nil, _slot = (Array.new)(), _slotCount = 0}
    local title = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, (self._ui)._staticBG, "CategoryTitle_" .. ii)
    CopyBaseProperty((self._ui)._baseCategory, title)
    title:SetText((self._categoryList)[ii])
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._category)[ii])._title = title
  end
  local productEnchantKeyList = ToClient_Guild_Manufacture_ProductItemEnchantKeyList()
  if productEnchantKeyList == nil then
    return 
  end
  for ii = 0, #productEnchantKeyList do
    local itemEnchantKey = productEnchantKeyList[ii]
    local manufactureStatic = ToClient_GetGuildManufactureStaticStatusWrapper(itemEnchantKey)
    if manufactureStatic ~= nil then
      local slot = {}
      slot.bg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (self._ui)._staticBG, "ProductItemBG_" .. ii)
      CopyBaseProperty((self._ui)._baseSlot, slot.bg)
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
      local itemWrapper = getItemEnchantStaticStatus(itemEnchantKey)
      slot:setItemByStaticStatus(itemWrapper)
      -- DECOMPILER ERROR at PC123: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (self._itemEnchantKey)[ii] = itemEnchantKey
      local categoryNo = manufactureStatic:getCategoryNo()
      local slotCount = ((self._category)[categoryNo])._slotCount
      -- DECOMPILER ERROR at PC132: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (((self._category)[categoryNo])._slot)[slotCount] = slot
      -- DECOMPILER ERROR at PC136: Confused about usage of register: R12 in 'UnsetPending'

      ;
      ((self._category)[categoryNo])._slotCount = slotCount + 1
    end
  end
  local startPosX = (self._config)._startPosX
  local startPosY = (self._config)._startPosY
  for ii = 0, #self._categoryList do
    (((self._category)[ii])._title):SetPosX(0)
    ;
    (((self._category)[ii])._title):SetPosY(startPosY - 22)
    ;
    (((self._category)[ii])._title):SetShow(true)
    local col = 0
    local row = 0
    for jj = 0, ((self._category)[ii])._slotCount - 1 do
      local slot = (((self._category)[ii])._slot)[jj]
      if slot ~= nil then
        row = (math.floor)(jj / (self._config)._col)
        col = jj % (self._config)._col
        ;
        (slot.bg):SetPosX((self._config)._startPosX + (self._config)._gapX * (col))
        ;
        (slot.bg):SetPosY(startPosY + (self._config)._gapY * row)
        ;
        (slot.bg):SetShow(true)
      end
    end
    startPosY = startPosY + (self._config)._gapY * (row + 2)
  end
  deleteControl((self._ui)._baseSlot)
  -- DECOMPILER ERROR at PC222: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._baseSlot = nil
  deleteControl((self._ui)._baseCategory)
  -- DECOMPILER ERROR at PC228: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._baseCategory = nil
  ;
  ((self._ui)._closeButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_ManufactureSelect:close()")
  local width = 410
  local height = startPosY + 20
  ;
  ((self._ui)._staticBG):SetSize(width - 28, height - 80)
  Panel_Guild_ManufactureSelect:SetSize(width, height)
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.open = function(self, index)
  -- function num : 0_1
  if Panel_Guild_ManufactureSelect:IsShow() == true then
    Proc_ShowMessage_Ack("[길드 �\128공] 선택창이 이미 열려 있습니다.")
    return 
  end
  self._index = index
  Panel_Guild_ManufactureSelect:SetShow(true)
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.close = function(self)
  -- function num : 0_2
  self._index = -1
  self:itemTooltip_Hide()
  Panel_Guild_ManufactureSelect:SetShow(false)
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.select = function(self, index)
  -- function num : 0_3
  PaGlobal_Guild_Manufacture:setProductItem(self._index, (self._itemEnchantKey)[index])
  self:close()
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.itemTooltip_Show = function(self, index)
  -- function num : 0_4
  local itemStatic = getItemEnchantStaticStatus((self._itemEnchantKey)[index])
  if itemStatic ~= nil then
    Panel_Tooltip_Item_SetPosition(index, (self._ui)._staticBG, "guildManufactureProductItemSelect")
    Panel_Tooltip_Item_Show(itemStatic, Panel_Guild_ManufactureSelect, true)
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_ManufactureSelect.itemTooltip_Hide = function(self)
  -- function num : 0_5
  Panel_Tooltip_Item_hideTooltip()
end

PaGlobal_Guild_ManufactureSelect:initialize()

