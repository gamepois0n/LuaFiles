-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dropitem\panel_window_dropitem.luac 

-- params : ...
-- function num : 0
Panel_Window_DropItem:SetShow(false)
PaGlobal_WorldDropItem = {
_ui = {_closeButton = (UI.getChildControl)(Panel_Window_DropItem, "Button_Win_Close"), _list2Region = (UI.getChildControl)(Panel_Window_DropItem, "List2_Region"), _frameDropItem = (UI.getChildControl)(Panel_Window_DropItem, "Frame_RegionDropItem"), _topDescBg = (UI.getChildControl)(Panel_Window_DropItem, "Static_TopArea"), _bottomDescBg = (UI.getChildControl)(Panel_Window_DropItem, "Static_DescBg"), _autoNaviButton = (UI.getChildControl)(Panel_Window_DropItem, "Button_Navi"), _frameContent = nil, 
_itemGroupUi = {[0] = nil, [1] = nil, [2] = nil, [3] = nil}
, _weaponSlotTempleteBg = nil, _armorSlotTempleteBg = nil, _accessorySlotTempleteBg = nil, _etcSlotTempleteBg = nil, 
_slotBg = {
[0] = {}
, 
[1] = {}
, 
[2] = {}
, 
[3] = {}
}
, 
_slot = {
[0] = {}
, 
[1] = {}
, 
[2] = {}
, 
[3] = {}
}
}
, 
_slotConfig = {createIcon = true, createBorder = true}
, _selectedRegionKey = nil, 
_itemKeyByType = {
[0] = {}
, 
[1] = {}
, 
[2] = {}
, 
[3] = {}
}
, _maxSlot = 30}
-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldDropItem.Init = function(self)
  -- function num : 0_0
  local control = self._ui
  control._selectedRegionName = (UI.getChildControl)(control._topDescBg, "StaticText_SelectedRegionName")
  control._needAp = (UI.getChildControl)(control._topDescBg, "StaticText_NeedAp")
  control._frameContent = (UI.getChildControl)(control._frameDropItem, "Frame_1_Content")
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (control._itemGroupUi)[0] = (UI.getChildControl)(control._frameContent, "Static_WeaponGroup")
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (control._title)[0] = (UI.getChildControl)((control._itemGroupUi)[0], "StaticText_WeaponTitle")
  control._weaponSlotTempleteBg = (UI.getChildControl)((control._itemGroupUi)[0], "Static_ItemSlotBg")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (control._itemGroupUi)[1] = (UI.getChildControl)(control._frameContent, "Static_ArmorGroup")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (control._title)[1] = (UI.getChildControl)((control._itemGroupUi)[1], "StaticText_ArmorTitle")
  control._armorSlotTempleteBg = (UI.getChildControl)((control._itemGroupUi)[1], "Static_ItemSlotBg")
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (control._itemGroupUi)[2] = (UI.getChildControl)(control._frameContent, "Static_AccessoryGroup")
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (control._title)[2] = (UI.getChildControl)((control._itemGroupUi)[2], "StaticText_AccessoryTitle")
  control._accessorySlotTempleteBg = (UI.getChildControl)((control._itemGroupUi)[2], "Static_ItemSlotBg")
  -- DECOMPILER ERROR at PC91: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (control._itemGroupUi)[3] = (UI.getChildControl)(control._frameContent, "Static_EtcGroup")
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (control._title)[3] = (UI.getChildControl)((control._itemGroupUi)[3], "StaticText_EtcTitle")
  control._etcSlotTempleteBg = (UI.getChildControl)((control._itemGroupUi)[3], "Static_ItemSlotBg")
  control._scroll = (UI.getChildControl)(control._frameDropItem, "Frame_1_VerticalScroll")
  ;
  (control._list2Region):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "DropItemRegion_ControlCreate")
  ;
  (control._list2Region):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  for index = 0, ToClient_RegionDropItem_GetRegionKeySize() - 1 do
    local regionKey_s64 = ToClient_RegionDropItem_GetRegionKeyByIndex(index)
    ;
    ((control._list2Region):getElementManager()):pushKey(regionKey_s64)
  end
  for index = 0, self._maxSlot - 1 do
    -- DECOMPILER ERROR at PC160: Confused about usage of register: R6 in 'UnsetPending'

    ((control._slotBg)[0])[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (control._itemGroupUi)[0], "DropItem_WeaponSlotBg_" .. index)
    CopyBaseProperty(control._weaponSlotTempleteBg, ((control._slotBg)[0])[index])
    ;
    (((control._slotBg)[0])[index]):SetPosX(20 + index % 6 * 55)
    ;
    (((control._slotBg)[0])[index]):SetPosY(35 + (math.floor)(index / 6) * 55)
    ;
    (((control._slotBg)[0])[index]):SetShow(false)
    -- DECOMPILER ERROR at PC195: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((control._slot)[0])[index] = {}
    ;
    (SlotItem.new)(((control._slot)[0])[index], "DropItem_WeaponSlot_" .. index, index, ((control._slotBg)[0])[index], self._slotConfig)
    ;
    (((control._slot)[0])[index]):createChild()
    ;
    ((((control._slot)[0])[index]).icon):addInputEvent("Mouse_On", "PaGlobal_WorldDropItem:ItemTooltip_Show(" .. 0 .. "," .. index .. ")")
    ;
    ((((control._slot)[0])[index]).icon):addInputEvent("Mouse_Out", "PaGlobal_WorldDropItem:ItemTooltip_Hide()")
    -- DECOMPILER ERROR at PC249: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((control._slotBg)[1])[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (control._itemGroupUi)[1], "DropItem_ArmorSlotBg_" .. index)
    CopyBaseProperty(control._weaponSlotTempleteBg, ((control._slotBg)[1])[index])
    ;
    (((control._slotBg)[1])[index]):SetPosX(20 + index % 6 * 55)
    ;
    (((control._slotBg)[1])[index]):SetPosY(35 + (math.floor)(index / 6) * 55)
    ;
    (((control._slotBg)[1])[index]):SetShow(false)
    -- DECOMPILER ERROR at PC284: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((control._slot)[1])[index] = {}
    ;
    (SlotItem.new)(((control._slot)[1])[index], "DropItem_ArmorSlot_" .. index, index, ((control._slotBg)[1])[index], self._slotConfig)
    ;
    (((control._slot)[1])[index]):createChild()
    ;
    ((((control._slot)[1])[index]).icon):addInputEvent("Mouse_On", "PaGlobal_WorldDropItem:ItemTooltip_Show(" .. 1 .. "," .. index .. ")")
    ;
    ((((control._slot)[1])[index]).icon):addInputEvent("Mouse_Out", "PaGlobal_WorldDropItem:ItemTooltip_Hide()")
    -- DECOMPILER ERROR at PC338: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((control._slotBg)[2])[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (control._itemGroupUi)[2], "DropItem_AccessorySlotBg_" .. index)
    CopyBaseProperty(control._weaponSlotTempleteBg, ((control._slotBg)[2])[index])
    ;
    (((control._slotBg)[2])[index]):SetPosX(20 + index % 6 * 55)
    ;
    (((control._slotBg)[2])[index]):SetPosY(35 + (math.floor)(index / 6) * 55)
    ;
    (((control._slotBg)[2])[index]):SetShow(false)
    -- DECOMPILER ERROR at PC373: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((control._slot)[2])[index] = {}
    ;
    (SlotItem.new)(((control._slot)[2])[index], "DropItem_AccessorySlot_" .. index, index, ((control._slotBg)[2])[index], self._slotConfig)
    ;
    (((control._slot)[2])[index]):createChild()
    ;
    ((((control._slot)[2])[index]).icon):addInputEvent("Mouse_On", "PaGlobal_WorldDropItem:ItemTooltip_Show(" .. 2 .. "," .. index .. ")")
    ;
    ((((control._slot)[2])[index]).icon):addInputEvent("Mouse_Out", "PaGlobal_WorldDropItem:ItemTooltip_Hide()")
    -- DECOMPILER ERROR at PC427: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((control._slotBg)[3])[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (control._itemGroupUi)[3], "DropItem_EtcSlotBg_" .. index)
    CopyBaseProperty(control._weaponSlotTempleteBg, ((control._slotBg)[3])[index])
    ;
    (((control._slotBg)[3])[index]):SetPosX(20 + index % 6 * 55)
    ;
    (((control._slotBg)[3])[index]):SetPosY(35 + (math.floor)(index / 6) * 55)
    ;
    (((control._slotBg)[3])[index]):SetShow(false)
    -- DECOMPILER ERROR at PC462: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((control._slot)[3])[index] = {}
    ;
    (SlotItem.new)(((control._slot)[3])[index], "DropItem_EtcSlot_" .. index, index, ((control._slotBg)[3])[index], self._slotConfig)
    ;
    (((control._slot)[3])[index]):createChild()
    ;
    ((((control._slot)[3])[index]).icon):addInputEvent("Mouse_On", "PaGlobal_WorldDropItem:ItemTooltip_Show(" .. 3 .. "," .. index .. ")")
    ;
    ((((control._slot)[3])[index]).icon):addInputEvent("Mouse_Out", "PaGlobal_WorldDropItem:ItemTooltip_Hide()")
  end
  ;
  (control._closeButton):addInputEvent("Mouse_LUp", "PaGlobal_WorldDropItem:Close()")
  ;
  (control._autoNaviButton):addInputEvent("Mouse_LUp", "PaGlobal_WorldDropItem:SetNavi()")
end

DropItemRegion_ControlCreate = function(content, key)
  -- function num : 0_1
  local regionButton = (UI.getChildControl)(content, "RadioButton_RegionName")
  local focusEffect = (UI.getChildControl)(content, "Static_Focus")
  local self = PaGlobal_WorldDropItem
  local regionKey = Int64toInt32(key)
  if self._selectedRegionKey == regionKey then
    focusEffect:SetShow(true)
    regionButton:SetFontColor((Defines.Color).C_FFFFEEA0)
  else
    focusEffect:SetShow(false)
    regionButton:SetFontColor((Defines.Color).C_FFC4BEBE)
  end
  local regionInfo = getRegionInfoWrapper(regionKey)
  do
    if regionInfo ~= nil then
      local regionName = regionInfo:getAreaName()
      regionButton:SetText(regionName)
      focusEffect:SetShow(regionKey == self._selectedRegionKey)
      regionButton:addInputEvent("Mouse_LUp", "PaGlobal_WorldDropItem:HandleClicked_Region(" .. regionKey .. ")")
    end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldDropItem.HandleClicked_Region = function(self, regionKey)
  -- function num : 0_2
  local prevSelectRegionkey = self._selectedRegionKey
  self._selectedRegionKey = regionKey
  ;
  ((self._ui)._list2Region):requestUpdateByKey(toInt64(0, regionKey))
  if prevSelectRegionkey ~= nil then
    ((self._ui)._list2Region):requestUpdateByKey(toInt64(0, prevSelectRegionkey))
  end
  PaGlobal_WorldDropItem:SetDropItem(regionKey)
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldDropItem.SetDropItem = function(self, regionKey)
  -- function num : 0_3
  local regionInfo = getRegionInfoWrapper(regionKey)
  ;
  ((self._ui)._selectedRegionName):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DROPITEM_SELECTEDAREA", "areaName", regionInfo:getAreaName()))
  local needAttackPoint = ToClient_RegionDropItem_GetNeedAttackPoint(regionKey)
  if needAttackPoint ~= nil then
    ((self._ui)._needAp):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DROPITEM_ATTACKPOINT_TEXT", "apCount", tostring(needAttackPoint)))
  end
  local itemCount = ToClient_GetRegionDropItemSize(regionKey)
  if itemCount > 0 then
    for iIndex = 0, 3 do
      -- DECOMPILER ERROR at PC44: Confused about usage of register: R9 in 'UnsetPending'

      (self._itemKeyByType)[iIndex] = {}
    end
    for index = 0, itemCount - 1 do
      local itemSSW = ToClient_GetRegionDropItemWrapper(regionKey, index)
      local itemKey = ((itemSSW:get())._key):get()
      if itemSSW:isEquipable() then
        if (itemSSW:get()):isWeapon() or (itemSSW:get()):isSubWeapon() or (itemSSW:get()):isAwakenWeapon() then
          (table.insert)((self._itemKeyByType)[0], itemKey)
        else
          if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
            (table.insert)((self._itemKeyByType)[2], itemKey)
          else
            ;
            (table.insert)((self._itemKeyByType)[1], itemKey)
          end
        end
      else
        ;
        (table.insert)((self._itemKeyByType)[3], itemKey)
      end
    end
  end
  do
    self:Slot_Init()
    local control = self._ui
    local nextPosY = 0
    for index = 0, 3 do
      if #(self._itemKeyByType)[index] > 0 then
        ((control._itemGroupUi)[index]):SetShow(true)
        ;
        ((control._itemGroupUi)[index]):SetPosY(nextPosY)
        local posY = 0
        for sIndex = 1, #(self._itemKeyByType)[index] do
          (((control._slotBg)[index])[sIndex - 1]):SetShow(true)
          local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(((self._itemKeyByType)[index])[sIndex]))
          ;
          (((control._slot)[index])[sIndex - 1]):setItemByStaticStatus(itemSSW)
        end
        nextPosY = nextPosY + (((control._slotBg)[index])[#(self._itemKeyByType)[index] - 1]):GetPosY() + 50
      else
        do
          do
            ;
            ((control._itemGroupUi)[index]):SetShow(false)
            -- DECOMPILER ERROR at PC185: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC185: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC185: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    do
      local contentSize = (math.max)(330, nextPosY)
      ;
      (control._frameContent):SetSize((control._frameContent):GetSizeX(), contentSize)
      ;
      (control._scroll):SetShow(contentSize > 330)
      ;
      (control._scroll):SetInterval(contentSize / 100 * 1.2)
      ;
      ((control._scroll):GetControlButton()):SetSize(((control._scroll):GetControlButton()):GetSizeX(), (math.min)(325, 325 / contentSize * 250))
      ;
      (control._frameDropItem):UpdateContentScroll()
      ;
      (control._scroll):SetControlTop()
      ;
      (control._frameDropItem):UpdateContentPos()
      -- DECOMPILER ERROR: 1 unprocessed JMP targets
    end
  end
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldDropItem.Slot_Init = function(self)
  -- function num : 0_4
  local control = self._ui
  for tIndex = 0, 3 do
    for index = 0, self._maxSlot - 1 do
      (((control._slotBg)[tIndex])[index]):SetShow(false)
    end
  end
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldDropItem.SetNavi = function(self)
  -- function num : 0_5
  if self._selectedRegionKey == nil then
    return 
  end
  local regionInfo = getRegionInfoWrapper(self._selectedRegionKey)
  if regionInfo:hasBaseWaypoint() then
    local pos3D = regionInfo:getPosition()
    ToClient_DeleteNaviGuideByGroup(0)
    ToClient_WorldMapNaviStart(pos3D, NavigationGuideParam(), false, false)
  else
    do
      if self._selectedRegionKey == 249 then
        local pos3D = float3(-337181.94, 10127, -248922)
        ToClient_DeleteNaviGuideByGroup(0)
        ToClient_WorldMapNaviStart(pos3D, NavigationGuideParam(), false, false)
      else
        do
          if self._selectedRegionKey == 688 or self._selectedRegionKey == 689 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DROPITEM_DESERTALERT"))
          end
          _PA_LOG("cylee", "PaGlobal_WorldDropItem:SetNavi() region not has base way point! region:" .. tostring(self._selectedRegionKey))
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldDropItem.ItemTooltip_Show = function(self, itemType, index)
  -- function num : 0_6
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(((self._itemKeyByType)[itemType])[index + 1]))
  if itemSSW ~= nil then
    Panel_Tooltip_Item_SetPosition(index, ((self._ui)._slot)[index], "dropItem")
    Panel_Tooltip_Item_Show(itemSSW, Panel_Window_DropItem, true)
  end
end

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldDropItem.ItemTooltip_Hide = function(self)
  -- function num : 0_7
  Panel_Tooltip_Item_hideTooltip()
end

-- DECOMPILER ERROR at PC116: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldDropItem.Open = function(self)
  -- function num : 0_8
  Panel_Window_DropItem:SetShow(true)
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_WorldDropItem.Close = function(self)
  -- function num : 0_9
  Panel_Window_DropItem:SetShow(false)
end

FGlobal_DropItemWindow_Open = function(regionKey)
  -- function num : 0_10
  local self = PaGlobal_WorldDropItem
  self:Open()
  if regionKey == nil then
    regionKey = Int64toInt32(ToClient_RegionDropItem_GetRegionKeyByIndex(0))
  end
  self:HandleClicked_Region(regionKey)
end

PaGlobal_WorldDropItem:Init()

