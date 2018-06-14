-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\menu\console\panel_quickmenusetting.luac 

-- params : ...
-- function num : 0
PaGlobal_ConsoleQuickMenuSetting = {
_inventoryData = {}
, 
_skillData = {}
, 
_functionTypeData = {}
, 
_socialActionData = {}
, 
_ui = {_list2Skill, _list2Menu, _frameItem, _list2SocialAction; 
_staticIcon = {}
, 
_staticTextName = {}
, 
_buttonPosition = {}
, 
_buttonPositionIcon = {}
, _rightBg = (UI.getChildControl)(Panel_QuickMenuCustom, "Static_RightBg"), 
_slots = {}
, _ringBg = (UI.getChildControl)(Panel_QuickMenuCustom_RightRing, "Static_RingBg"), _oneSlotBg = (UI.getChildControl)(Panel_QuickMenuCustom_RightRing, "Static_OneSlotBg"), _ringCrossHair = (UI.getChildControl)(Panel_QuickMenuCustom_RightRing, "Static_CrossHair"), _crossHairText = (UI.getChildControl)(Panel_QuickMenuCustom_RightRing, "StaticText_CrossText"), _registerModeBlackBg = (UI.getChildControl)(Panel_QuickMenuCustom_RightRing, "Static_BlackBg")}
, 
_registMode = {_isStart = false, _stickPosition = __eQuickMenuStickPosition_Count, _index = -1}
, _listMaxCount = 8, _curPosition = 1, _curPage = 1, _curGroup = __eQuickMenuDpadGroup_Count, _curCategory = 0, _startColumn = 0}
-- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.GoCategory = function(self, category)
  -- function num : 0_0
  ((self._ui)._list2Skill):SetShow(false)
  ;
  ((self._ui)._list2Menu):SetShow(false)
  ;
  ((self._ui)._bgItem):SetShow(false)
  ;
  ((self._ui)._list2SocialAction):SetShow(false)
  if __eQuickMenuDataType_Skill == category then
    ((self._ui)._list2Skill):SetShow(true)
  else
    if __eQuickMenuDataType_Item == category then
      ((self._ui)._bgItem):SetShow(true)
    else
      if __eQuickMenuDataType_Function == category then
        ((self._ui)._list2Menu):SetShow(true)
      else
        if __eQuickMenuDataType_SocialAction == category then
          ((self._ui)._list2SocialAction):SetShow(true)
        end
      end
    end
  end
  PaGlobal_ConsoleQuickMenuCustom_HighlightCategory(category)
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.initializeUI = function(self)
  -- function num : 0_1
  for ii = 0, __eQuickMenuStickPosition_Count - 1 do
    if __eQuickMenuStickPosition_QuickSlot == ii then
      break
    end
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._buttonPosition)[ii] = (UI.getChildControl)((self._ui)._ringBg, "Button_Templete" .. tostring(ii))
    ;
    (((self._ui)._buttonPosition)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:quitRegistQuickMenu( " .. ii .. ")")
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._buttonPositionIcon)[ii] = (UI.getChildControl)(((self._ui)._buttonPosition)[ii], "Static_Icon")
  end
  do
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._ui)._registerModeSelectItem = (UI.getChildControl)((self._ui)._ringBg, "StaticText_SelectMenu")
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._ui)._registerModeSelectItemIcon = (UI.getChildControl)((self._ui)._registerModeSelectItem, "Static_Icon")
    -- DECOMPILER ERROR at PC66: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._ui)._oneSlotButton = (UI.getChildControl)((self._ui)._oneSlotBg, "Button_OneSlot")
    ;
    ((self._ui)._oneSlotButton):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:quitRegistQuickMenu( " .. __eQuickMenuStickPosition_QuickSlot .. ")")
    ;
    ((self._ui)._oneSlotButton):SetShow(true)
    -- DECOMPILER ERROR at PC88: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._ui)._oneSlotIcon = (UI.getChildControl)((self._ui)._oneSlotButton, "Static_Icon")
    ;
    ((self._ui)._oneSlotIcon):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:quitRegistQuickMenu( " .. __eQuickMenuStickPosition_QuickSlot .. ")")
    -- DECOMPILER ERROR at PC104: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._ui)._changeSlot = (UI.getChildControl)(Panel_QuickMenuCustom_RightRing, "StaticText_ChangeSlot")
    ;
    ((self._ui)._changeSlot):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:changeMenuMode()")
    local tabBg = (UI.getChildControl)(Panel_QuickMenuCustom, "Static_TabBg")
    ;
    ((UI.getChildControl)(tabBg, "RadioButton_Skill")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:GoCategory(" .. __eQuickMenuDataType_Skill .. ")")
    ;
    ((UI.getChildControl)(tabBg, "RadioButton_Item")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:GoCategory(" .. __eQuickMenuDataType_Item .. ")")
    ;
    ((UI.getChildControl)(tabBg, "RadioButton_Menu")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:GoCategory(" .. __eQuickMenuDataType_Function .. ")")
    ;
    ((UI.getChildControl)(tabBg, "RadioButton_Social")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:GoCategory(" .. __eQuickMenuDataType_SocialAction .. ")")
    -- DECOMPILER ERROR at PC171: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._ui)._list2Skill = (UI.getChildControl)((self._ui)._rightBg, "List2_Skillt")
    -- DECOMPILER ERROR at PC179: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._ui)._list2Menu = (UI.getChildControl)((self._ui)._rightBg, "List2_Menu")
    -- DECOMPILER ERROR at PC187: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._ui)._bgItem = (UI.getChildControl)((self._ui)._rightBg, "Static_ItemMenuBg")
    -- DECOMPILER ERROR at PC195: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._ui)._scrollItem = (UI.getChildControl)((self._ui)._bgItem, "Scroll_Inventory")
    -- DECOMPILER ERROR at PC203: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._ui)._bgItemTemplate = (UI.getChildControl)((self._ui)._bgItem, "Static_ItemSlotBg_Template")
    -- DECOMPILER ERROR at PC211: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._ui)._list2SocialAction = (UI.getChildControl)((self._ui)._rightBg, "List2_SocialAction")
    ;
    ((self._ui)._list2Skill):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "QuickMenuSeting_List2Event_SKill")
    ;
    ((self._ui)._list2Menu):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "QuickMenuSeting_List2Event_Menu")
    ;
    ((self._ui)._list2SocialAction):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "QuickMenuSeting_List2Event_SocialAction")
    ;
    ((self._ui)._list2Skill):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
    ;
    ((self._ui)._list2Menu):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
    ;
    ((self._ui)._list2SocialAction):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
    local rowMax = 8
    local colMax = 9
    local row = 0
    local col = 0
    local offset = 54
    local bgs = {}
    for index = 1, rowMax * colMax do
      local bg = (UI.createAndCopyBasePropertyControl)((self._ui)._bgItem, "Static_ItemSlotBg_Template", (self._ui)._bgItem, "Item_" .. index)
      bg:SetPosX(row * offset)
      bg:SetPosY(col * offset)
      if row < rowMax - 1 then
        row = row + 1
      else
        row = 0
        col = col + 1
      end
      bgs[#bgs + 1] = bg
    end
    for index = 1, rowMax * colMax do
      local slot = {}
      local param = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createClassEquipBG = true, createEnduranceIcon = true, createCash = true}
      local item = (SlotItem.new)(slot, index, 0, bgs[index], param)
      item:createChild()
      ;
      (UIScroll.InputEventByControl)(bgs[index], "PaGlobal_ConsoleQuickMenuSetting_scrollInventory")
      ;
      (UIScroll.InputEventByControl)(item.icon, "PaGlobal_ConsoleQuickMenuSetting_scrollInventory")
      if index < colMax then
        (bgs[index]):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_UP, "PaGlobal_ConsoleQuickMenuSetting_scrollInventory(true)")
      else
        if colMax * (rowMax - 1) < index then
          (bgs[index]):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_DOWN, "PaGlobal_ConsoleQuickMenuSetting_scrollInventory(false)")
        end
      end
      -- DECOMPILER ERROR at PC347: Confused about usage of register: R15 in 'UnsetPending'

      ;
      ((self._ui)._slots)[index] = item
    end
  end
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.startRegistQuickMenu = function(self, type, index)
  -- function num : 0_2
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R3 in 'UnsetPending'

  (self._registMode)._isStart = true
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._registMode)._stickPosition = __eQuickMenuStickPosition_Count
  local data = nil
  if __eQuickMenuDataType_Item == type then
    data = (self._inventoryData)[index]
  else
    if __eQuickMenuDataType_Skill == type then
      data = (self._skillData)[index]
    else
      if __eQuickMenuDataType_Function == type then
        data = (self._functionTypeData)[index]
      else
        if __eQuickMenuDataType_SocialAction == type then
          data = (self._socialActionData)[index]
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._registMode)._settingData = data
  self:ShowBlackBg(true, data)
  if ToClient_isQuickMenuQuickMode(self._curGroup) == true then
    self:quitRegistQuickMenu(__eQuickMenuStickPosition_QuickSlot)
  end
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.ShowBlackBg = function(self, show, data)
  -- function num : 0_3
  ((self._ui)._registerModeBlackBg):SetShow(show)
  ;
  ((self._ui)._ringCrossHair):SetShow(not show)
  ;
  ((self._ui)._registerModeSelectItem):SetShow(show)
  if data ~= nil then
    local control = (self._ui)._registerModeSelectItemIcon
    if __eQuickMenuDataType_Skill == data._type then
      PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
    else
      if __eQuickMenuDataType_Item == data._type then
        PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
      else
        if __eQuickMenuDataType_Function == data._type then
          control:ChangeTextureInfoName((data._icon)._path)
          ;
          (control:getBaseTexture()):setUV(setTextureUV_Func(control, (data._icon)._x1, (data._icon)._y1, (data._icon)._x2, (data._icon)._y2))
          control:setRenderTexture(control:getBaseTexture())
        else
          if __eQuickMenuDataType_SocialAction == data._type then
            PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.SetSkillDataMonoTone = function(self, index)
  -- function num : 0_4
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.quitRegistQuickMenu = function(self, executePosition)
  -- function num : 0_5
  local registData = (self._registMode)._settingData
  self:clearRegistCustomSetting()
  self:ShowBlackBg(false)
  if executePosition == nil or __eQuickMenuStickPosition_Count == executePosition then
    return 
  end
  if registData == nil then
    self:registQuickMenu(registData, executePosition)
    PaGlobal_ConsoleQuickMenu:setWidget()
  end
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.clearRegistCustomSetting = function(self)
  -- function num : 0_6
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._registMode)._isStart = false
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._registMode)._stickPosition = __eQuickMenuStickPosition_Count
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._registMode)._settingData = nil
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.registQuickMenu = function(self, data, position)
  -- function num : 0_7
  if data == nil then
    return 
  end
  if __eQuickMenuDataType_Skill == data._type then
    self:registSkill(data, position)
  else
    if __eQuickMenuDataType_Item == data._type then
      self:registItem(data, position)
    else
      if __eQuickMenuDataType_Function == data._type then
        self:registFunctionType(data, position)
      else
        if __eQuickMenuDataType_SocialAction == data._type then
          self:registSocialAction(data, position)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.registItem = function(self, data, position)
  -- function num : 0_8
  if data == nil then
    return 
  end
  local rv = ToClient_registQuickMenuItem(self._curGroup, position, data._whereType, data._slotNo)
  if rv == true then
    self:updateIcon(data, position)
  end
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.registSkill = function(self, data, position)
  -- function num : 0_9
  if data == nil then
    return 
  end
  local rv = ToClient_registQuickMenuSkill(self._curGroup, position, data._skillKey)
  if rv == true then
    self:updateIcon(data, position)
  end
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.registFunctionType = function(self, data, position)
  -- function num : 0_10
  if data == nil then
    return 
  end
  local rv = ToClient_registQuickMenuFunctionType(self._curGroup, position, data._enumType)
  if rv == true then
    self:updateIcon(data, position)
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.registSocialAction = function(self, data, position)
  -- function num : 0_11
  if data == nil then
    return 
  end
  local rv = ToClient_registQuickMenuSocialAction(self._curGroup, position, data._socialKey)
  if rv == true then
    self:updateIcon(data, position)
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.updateIcon = function(self, data, position)
  -- function num : 0_12
  local control = nil
  if __eQuickMenuStickPosition_QuickSlot == position then
    control = (self._ui)._oneSlotIcon
  else
    control = ((self._ui)._buttonPositionIcon)[position]
  end
  if control == nil then
    return 
  end
  if __eQuickMenuDataType_Skill == data._type then
    PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
  else
    if __eQuickMenuDataType_Item == data._type then
      PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
    else
      if __eQuickMenuDataType_Function == data._type then
        control:ChangeTextureInfoName((data._icon)._path)
        ;
        (control:getBaseTexture()):setUV(setTextureUV_Func(control, (data._icon)._x1, (data._icon)._y1, (data._icon)._x2, (data._icon)._y2))
        control:setRenderTexture(control:getBaseTexture())
      else
        if __eQuickMenuDataType_SocialAction == data._type then
          PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setFunctionTypeData = function(self)
  -- function num : 0_13
  self._functionTypeData = {}
  if PaGlobal_ConsoleQuickMenu._functionTypeList == nil or (PaGlobal_ConsoleQuickMenu._functionTypeList)._icon == nil or ((PaGlobal_ConsoleQuickMenu._functionTypeList)._icon)[__eQuickMenuDataType_Function] == nil or (PaGlobal_ConsoleQuickMenu._functionTypeList)._name == nil or ((PaGlobal_ConsoleQuickMenu._functionTypeList)._name)[__eQuickMenuDataType_Function] == nil then
    return 
  end
  for index = 0, PaGlobal_ConsoleQuickMenu._functionTypeCount do
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R5 in 'UnsetPending'

    (self._functionTypeData)[#self._functionTypeData + 1] = {_type = __eQuickMenuDataType_Function, _enumType = index, _name = (((PaGlobal_ConsoleQuickMenu._functionTypeList)._name)[__eQuickMenuDataType_Function])[index], _icon = (((PaGlobal_ConsoleQuickMenu._functionTypeList)._icon)[__eQuickMenuDataType_Function])[index]}
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setInventoryData = function(self)
  -- function num : 0_14
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return nil
  end
  self._inventoryData = {}
  local useStartSlot = inventorySlotNoUserStart()
  local inventorysize = ToClient_InventoryGetSize((CppEnums.ItemWhereType).eInventory)
  for slotNo = useStartSlot, inventorysize - 1 do
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, slotNo)
    -- DECOMPILER ERROR at PC61: Confused about usage of register: R9 in 'UnsetPending'

    if itemWrapper ~= nil and itemWrapper:empty() == false and ToClient_isVaildItemRegistQuickMenu(itemWrapper:getStaticStatus()) == true then
      (self._inventoryData)[#self._inventoryData + 1] = {_type = __eQuickMenuDataType_Item, _whereType = (CppEnums.ItemWhereType).eInventory, _slotNo = slotNo, _name = (itemWrapper:getStaticStatus()):getName(), _icon = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
    end
  end
  inventorysize = ToClient_InventoryGetSize((CppEnums.ItemWhereType).eCashInventory)
  for slotNo = useStartSlot, inventorysize - 1 do
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, slotNo)
    -- DECOMPILER ERROR at PC115: Confused about usage of register: R9 in 'UnsetPending'

    if itemWrapper ~= nil and itemWrapper:empty() == false and ToClient_isVaildItemRegistQuickMenu(itemWrapper:getStaticStatus()) == true then
      (self._inventoryData)[#self._inventoryData + 1] = {_type = __eQuickMenuDataType_Item, _whereType = (CppEnums.ItemWhereType).eCashInventory, _slotNo = slotNo, _name = (itemWrapper:getStaticStatus()):getName(), _icon = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
    end
  end
end

-- DECOMPILER ERROR at PC123: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setSkillData = function(self)
  -- function num : 0_15
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local classType = selfPlayer:getClassType()
  if classType < 0 then
    return 
  end
  self._skillData = {}
  local cellTable = getCombatSkillTree(classType)
  if cellTable == nil then
    return 
  end
  self:setSkillCellTableData(cellTable)
end

-- DECOMPILER ERROR at PC126: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setSkillCellTableData = function(self, cellTable)
  -- function num : 0_16
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  for row = 0, rows - 1 do
    for col = 0, cols - 1 do
      local cell = cellTable:atPointer(col, row)
      local skillNo = cell._skillNo
      if cell:isSkillType() == true then
        local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
        local skillTypeStatic = skillTypeStaticWrapper:get()
        if skillTypeStaticWrapper ~= nil and skillTypeStaticWrapper:isValidLocalizing() == true and skillTypeStatic ~= nil and skillTypeStatic._isSettableQuickSlot == true then
          local skillLevelInfo = getSkillLevelInfo(skillNo)
          local skillLearndLevel = getLearnedSkillLevel(skillTypeStaticWrapper)
          -- DECOMPILER ERROR at PC68: Confused about usage of register: R18 in 'UnsetPending'

          if skillLevelInfo ~= nil and skillLevelInfo._usable == true then
            (self._skillData)[#self._skillData + 1] = {_type = __eQuickMenuDataType_Skill, _skillKey = (skillLevelInfo._skillKey):get(), _skillNo = skillNo, _name = skillTypeStaticWrapper:getName(), _icon = "Icon/" .. skillTypeStaticWrapper:getIconPath()}
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC129: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setSocialActionData = function(self)
  -- function num : 0_17
  self._socialActionData = {}
  for ii = 0, ToClient_getSocialActionInfoList() - 1 do
    local socialActionInfo = ToClient_getSocialActionInfoByIndex(ii)
    local sASS = socialActionInfo:getStaticStatus()
    local socialKey = sASS:getKey()
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._socialActionData)[#self._socialActionData + 1] = {_type = __eQuickMenuDataType_SocialAction, _socialKey = socialKey, _name = sASS:getName(), _icon = "Icon/" .. sASS:getIconPath()}
  end
end

-- DECOMPILER ERROR at PC132: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setSkillUi = function(self)
  -- function num : 0_18
  (((self._ui)._list2Skill):getElementManager()):clearKey()
  for index = 1, #self._skillData do
    (((self._ui)._list2Skill):getElementManager()):pushKey(toInt64(0, index))
  end
end

QuickMenuSeting_List2Event_SKill = function(content, key)
  -- function num : 0_19
  local id = Int64toInt32(key)
  local skillData = (PaGlobal_ConsoleQuickMenuSetting._skillData)[id]
  local radiobutton = (UI.getChildControl)(content, "RadioButton_SkillSlotBg")
  local bg = (UI.getChildControl)(content, "Static_SlotBg")
  local slot = (UI.getChildControl)(content, "Static_Slot")
  slot:ChangeTextureInfoName(skillData._icon)
  radiobutton:SetText(skillData._name)
  radiobutton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_Skill .. "," .. id .. "  )")
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setInventoryUi = function(self)
  -- function num : 0_20
  local rowMax = 8
  local colMax = 9
  local row = 0
  local col = 0
  local offset = 54
  for index = 1, rowMax * colMax do
    local dataIndex = index + self._startColumn * rowMax
    local data = (self._inventoryData)[dataIndex]
    local item = ((self._ui)._slots)[index]
    if data ~= nil then
      local itemWrapper = getInventoryItemByType(data._whereType, data._slotNo)
      if itemWrapper ~= nil and itemWrapper:empty() == false and ToClient_isVaildItemRegistQuickMenu(itemWrapper:getStaticStatus()) == true then
        item:setItem(itemWrapper, data._slotNo, false, false)
        ;
        (item.icon):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_Item .. "," .. dataIndex .. "  )")
      else
        item:clearItem()
      end
    else
      do
        do
          item:clearItem()
          -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

PaGlobal_ConsoleQuickMenuSetting_scrollInventory = function(isUp)
  -- function num : 0_21
  local self = PaGlobal_ConsoleQuickMenuSetting
  local startIndex = (UIScroll.ScrollEvent)((self._ui)._scrollItem, isUp, 9, 192, 1 + self._startColumn * 8, 8)
  self._startColumn = (math.floor)(startIndex / 8)
  self:setInventoryUi()
end

-- DECOMPILER ERROR at PC142: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setFunctionTypeUi = function(self)
  -- function num : 0_22
  (((self._ui)._list2Menu):getElementManager()):clearKey()
  for index = 1, #self._functionTypeData do
    if index % 2 == 1 then
      (((self._ui)._list2Menu):getElementManager()):pushKey(toInt64(0, index))
    end
  end
end

QuickMenuSeting_List2Event_Menu = function(content, key)
  -- function num : 0_23
  local id = Int64toInt32(key)
  local leftFunctiondata = (PaGlobal_ConsoleQuickMenuSetting._functionTypeData)[id]
  local rightFunctiondata = (PaGlobal_ConsoleQuickMenuSetting._functionTypeData)[id + 1]
  local leftButton = (UI.getChildControl)(content, "Button_Left")
  local leftIcon = (UI.getChildControl)(content, "Static_LeftMenuIcon")
  local leftText = (UI.getChildControl)(content, "StaticText_LeftMenu")
  local leftLine = (UI.getChildControl)(content, "Static_LeftLine")
  local rightButton = (UI.getChildControl)(content, "Button_Right")
  local rightIcon = (UI.getChildControl)(content, "Static_RightMenuIcon")
  local rightText = (UI.getChildControl)(content, "StaticText_RightMenu")
  local rightLine = (UI.getChildControl)(content, "Static_RightLine")
  local leftOk = leftFunctiondata ~= nil
  do
    local rightOk = rightFunctiondata ~= nil
    leftButton:SetShow(leftOk)
    leftIcon:SetShow(leftOk)
    leftText:SetShow(leftOk)
    leftLine:SetShow(leftOk)
    rightButton:SetShow(rightOk)
    rightIcon:SetShow(rightOk)
    rightText:SetShow(rightOk)
    rightLine:SetShow(rightOk)
    if leftOk then
      leftText:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      leftText:SetAutoResize(true)
      leftText:SetText(leftFunctiondata._name)
      leftIcon:ChangeTextureInfoName((leftFunctiondata._icon)._path)
      ;
      (leftIcon:getBaseTexture()):setUV(setTextureUV_Func(leftIcon, (leftFunctiondata._icon)._x1, (leftFunctiondata._icon)._y1, (leftFunctiondata._icon)._x2, (leftFunctiondata._icon)._y2))
      leftIcon:setRenderTexture(leftIcon:getBaseTexture())
      leftButton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_Function .. "," .. id .. "  )")
    end
    if rightOk then
      rightText:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      rightText:SetAutoResize(true)
      rightText:SetText(rightFunctiondata._name)
      rightIcon:ChangeTextureInfoName((rightFunctiondata._icon)._path)
      ;
      (rightIcon:getBaseTexture()):setUV(setTextureUV_Func(rightIcon, (rightFunctiondata._icon)._x1, (rightFunctiondata._icon)._y1, (rightFunctiondata._icon)._x2, (rightFunctiondata._icon)._y2))
      rightIcon:setRenderTexture(rightIcon:getBaseTexture())
      rightButton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_Function .. "," .. tostring(id + 1) .. "  )")
    end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setSocialActionUi = function(self)
  -- function num : 0_24
  (((self._ui)._list2SocialAction):getElementManager()):clearKey()
  for index = 1, #self._socialActionData do
    if index % 2 == 1 then
      (((self._ui)._list2SocialAction):getElementManager()):pushKey(toInt64(0, index))
    end
  end
end

QuickMenuSeting_List2Event_SocialAction = function(content, key)
  -- function num : 0_25
  local id = Int64toInt32(key)
  local leftData = (PaGlobal_ConsoleQuickMenuSetting._socialActionData)[id]
  local rightData = (PaGlobal_ConsoleQuickMenuSetting._socialActionData)[id + 1]
  local leftButton = (UI.getChildControl)(content, "Button_Left")
  local leftIcon = (UI.getChildControl)(content, "Static_LeftMenuIcon")
  local leftText = (UI.getChildControl)(content, "StaticText_LeftMenu")
  local leftLine = (UI.getChildControl)(content, "Static_LeftLine")
  local rightButton = (UI.getChildControl)(content, "Button_Right")
  local rightIcon = (UI.getChildControl)(content, "Static_RightMenuIcon")
  local rightText = (UI.getChildControl)(content, "StaticText_RightMenu")
  local rightLine = (UI.getChildControl)(content, "Static_RightLine")
  local leftOk = leftData ~= nil
  do
    local rightOk = rightData ~= nil
    leftButton:SetShow(leftOk)
    leftIcon:SetShow(leftOk)
    leftText:SetShow(leftOk)
    leftLine:SetShow(leftOk)
    rightButton:SetShow(rightOk)
    rightIcon:SetShow(rightOk)
    rightText:SetShow(rightOk)
    rightLine:SetShow(rightOk)
    if leftOk then
      leftText:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      leftText:SetAutoResize(true)
      leftText:SetText(leftData._name)
      leftIcon:ChangeTextureInfoName(leftData._icon)
      leftButton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_SocialAction .. "," .. id .. "  )")
    end
    if rightOk then
      rightText:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      rightText:SetAutoResize(true)
      rightText:SetText(leftData._name)
      rightIcon:ChangeTextureInfoName(rightData._icon)
      rightButton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_SocialAction .. "," .. tostring(id + 1) .. "  )")
    end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.UpdateData = function(self)
  -- function num : 0_26
  self:setSkillData()
  self:setInventoryData()
  self:setFunctionTypeData()
  self:setSocialActionData()
end

-- DECOMPILER ERROR at PC155: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.UpdateUi = function(self)
  -- function num : 0_27
  self:setSkillUi()
  self:setInventoryUi()
  self:setFunctionTypeUi()
  self:setSocialActionUi()
end

FromClient_ConsoleQuickMenu_OpenCustomPage = function(currentSettingGroup)
  -- function num : 0_28
  if currentSettingGroup < 0 or __eQuickMenuDpadGroup_Count <= currentSettingGroup then
    return 
  end
  local self = PaGlobal_ConsoleQuickMenuSetting
  FromClient_ConsoleQuickMenu_Close()
  Panel_QuickMenuCustom:SetShow(true)
  self:UpdateData()
  self:UpdateUi()
  self._curGroup = currentSettingGroup
  Panel_QuickMenuCustom_RightRing:SetShow(true)
  self:SetUICusttomSettingCurrentGroup(currentSettingGroup)
  self:setMenuMode(currentSettingGroup)
  self:rotateDpadCrossHair(currentSettingGroup)
  PaGlobal_ConsoleQuickMenuSetting:ShowBlackBg(false)
end

-- DECOMPILER ERROR at PC160: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.rotateDpadCrossHair = function(self, group)
  -- function num : 0_29
  local control = (PaGlobal_ConsoleQuickMenuSetting._ui)._ringCrossHair
  if group == 0 then
    control:SetRotate(0)
  else
    if group == 1 then
      control:SetRotate(math.pi)
    else
      if group == 2 then
        control:SetRotate(math.pi + math.pi * 0.5)
      else
        if group == 3 then
          control:SetRotate(math.pi * 0.5)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC163: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.SetUICusttomSettingCurrentGroup = function(self, group)
  -- function num : 0_30
  local groupInfo = PaGlobal_ConsoleQuickMenu:GetCurrentGroupInfo(group)
  for position,info in ipairs(groupInfo) do
    local control = ((self._ui)._buttonPositionIcon)[position - 1]
    if control == nil then
      return 
    end
    PaGlobal_ConsoleQuickMenu:setIcon(control, info._icon, info._uv)
  end
  local quickSlot = ToClient_getAtQuickMenu(group, __eQuickMenuStickPosition_QuickSlot)
  local quickSlotInfo = PaGlobal_ConsoleQuickMenu:GetPositionInfo(quickSlot)
  PaGlobal_ConsoleQuickMenu:setIcon((self._ui)._oneSlotIcon, quickSlotInfo._icon, quickSlotInfo._uv)
end

FGlobal_ConsoleQuickMenuSetting_RegistMode = function()
  -- function num : 0_31
  local self = PaGlobal_ConsoleQuickMenuSetting
  local registPosition = ToClient_checkQuickMenuCurrentPosition()
  -- DECOMPILER ERROR at PC14: Unhandled construct in 'MakeBoolean' P1

  if __eQuickMenuStickPosition_Count == registPosition and __eQuickMenuStickPosition_Count ~= (self._registMode)._stickPosition then
    self:quitRegistQuickMenu((self._registMode)._stickPosition)
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._registMode)._stickPosition = registPosition
  PaGlobal_ConsoleQuickMenuSetting:updatePosition(registPosition)
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.updatePosition = function(self, registPosition)
  -- function num : 0_32
  if __eQuickMenuStickPosition_Count == registPosition then
    if __eQuickMenuStickPosition_Count ~= (self._registMode)._stickPosition then
      self:quitRegistQuickMenu((self._registMode)._stickPosition)
    end
    for _,control in pairs((self._ui)._buttonPosition) do
      control:SetMonoTone(false)
      control:SetCheck(false)
    end
  else
    do
      for _,control in pairs((self._ui)._buttonPosition) do
        control:SetMonoTone(true)
        control:SetCheck(false)
      end
      ;
      (((self._ui)._buttonPosition)[registPosition]):SetMonoTone(false)
      ;
      (((self._ui)._buttonPosition)[registPosition]):SetCheck(true)
    end
  end
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setMenuMode = function(self, group)
  -- function num : 0_33
  if ToClient_isQuickMenuQuickMode(group) == true then
    ((self._ui)._ringBg):SetShow(false)
    ;
    ((self._ui)._oneSlotBg):SetShow(true)
  else
    ;
    ((self._ui)._ringBg):SetShow(true)
    ;
    ((self._ui)._oneSlotBg):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC174: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.changeMenuMode = function(self)
  -- function num : 0_34
  if ToClient_isQuickMenuQuickMode(self._curGroup) == true then
    ToClient_changeQuickMenuMode(self._curGroup, false)
  else
    ToClient_changeQuickMenuMode(self._curGroup, true)
  end
  self:setMenuMode(self._curGroup)
  PaGlobal_ConsoleQuickMenu:setWidget()
end

FromClient_ConsoleQuickMenuSetting_luaLoadComplete = function()
  -- function num : 0_35
  PaGlobal_ConsoleQuickMenuSetting:initializeUI()
  PaGlobal_ConsoleQuickMenuSetting:GoCategory(__eQuickMenuDataType_Item)
end

FGlobal_ConsoleQuickMenu_PerFrame = function()
  -- function num : 0_36
  if (PaGlobal_ConsoleQuickMenuSetting._registMode)._isStart == true then
    FGlobal_ConsoleQuickMenuSetting_RegistMode()
  end
end

FGlobal_ConsoleQuickMenu_ChangeDpadGroup = function(left)
  -- function num : 0_37
  local changeGroup = PaGlobal_ConsoleQuickMenuSetting._curGroup
  if left == false then
    changeGroup = (PaGlobal_ConsoleQuickMenuSetting._curGroup + 1) % __eQuickMenuDpadGroup_Count
  else
    changeGroup = (PaGlobal_ConsoleQuickMenuSetting._curGroup - 1) % __eQuickMenuDpadGroup_Count
  end
  FromClient_ConsoleQuickMenu_OpenCustomPage(changeGroup)
end

Toggle_QuickMenuSetting_forPadEventFunc = function(left)
  -- function num : 0_38
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  if left == true then
    PaGlobal_ConsoleQuickMenuSetting._curCategory = PaGlobal_ConsoleQuickMenuSetting._curCategory - 1
  else
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

    PaGlobal_ConsoleQuickMenuSetting._curCategory = PaGlobal_ConsoleQuickMenuSetting._curCategory + 1
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_ConsoleQuickMenuSetting._curCategory = PaGlobal_ConsoleQuickMenuSetting._curCategory % 4
  PaGlobal_ConsoleQuickMenuSetting:GoCategory(PaGlobal_ConsoleQuickMenuSetting._curCategory)
end

Panel_QuickMenuCustom:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "FGlobal_ConsoleQuickMenu_ChangeDpadGroup(false)")
Panel_QuickMenuCustom:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "Toggle_QuickMenuSetting_forPadEventFunc(true)")
Panel_QuickMenuCustom:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "Toggle_QuickMenuSetting_forPadEventFunc(false)")
Panel_QuickMenuCustom:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobal_ConsoleQuickMenuSetting:changeMenuMode()")
Panel_QuickMenuCustom:RegisterUpdateFunc("FGlobal_ConsoleQuickMenu_PerFrame")
registerEvent("FromClient_luaLoadComplete", "FromClient_ConsoleQuickMenuSetting_luaLoadComplete")
registerEvent("FromClient_ConsoleQuickMenu_OpenCustomPage", "FromClient_ConsoleQuickMenu_OpenCustomPage")

