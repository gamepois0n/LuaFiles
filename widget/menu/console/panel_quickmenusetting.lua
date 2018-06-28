PaGlobal_ConsoleQuickMenuSetting = {
  _inventoryData = {},
  _skillData = {},
  _functionTypeData = {},
  _socialActionData = {},
  _ui = {
    _staticIcon = {},
    _staticTextName = {},
    _buttonPosition = {},
    _buttonPositionIcon = {},
    _rightBg = UI.getChildControl(Panel_QuickMenuCustom, "Static_RightBg"),
    _list2Skill,
    _list2Menu,
    _frameItem,
    _list2SocialAction,
    _slots = {},
    _ringBg = UI.getChildControl(Panel_QuickMenuCustom_RightRing, "Static_RingBg"),
    _oneSlotBg = UI.getChildControl(Panel_QuickMenuCustom_RightRing, "Static_OneSlotBg"),
    _ringCrossHair = UI.getChildControl(Panel_QuickMenuCustom_RightRing, "Static_CrossHair"),
    _crossHairText = UI.getChildControl(Panel_QuickMenuCustom_RightRing, "StaticText_CrossText"),
    _registerModeBlackBg = UI.getChildControl(Panel_QuickMenuCustom_RightRing, "Static_BlackBg")
  },
  _registMode = {
    _isStart = false,
    _stickPosition = __eQuickMenuStickPosition_Count,
    _index = -1
  },
  _listMaxCount = 8,
  _curPosition = 1,
  _curPage = 1,
  _curGroup = __eQuickMenuDpadGroup_Count,
  _curCategory = 0,
  _startColumn = 0
}
function PaGlobal_ConsoleQuickMenuSetting:GoCategory(category)
  self._ui._list2Skill:SetShow(false)
  self._ui._list2Menu:SetShow(false)
  self._ui._bgItem:SetShow(false)
  self._ui._list2SocialAction:SetShow(false)
  if __eQuickMenuDataType_Skill == category then
    self._ui._list2Skill:SetShow(true)
  elseif __eQuickMenuDataType_Item == category then
    self._ui._bgItem:SetShow(true)
  elseif __eQuickMenuDataType_Function == category then
    self._ui._list2Menu:SetShow(true)
  elseif __eQuickMenuDataType_SocialAction == category then
    self._ui._list2SocialAction:SetShow(true)
  end
  PaGlobal_ConsoleQuickMenuCustom_HighlightCategory(category)
end
function PaGlobal_ConsoleQuickMenuSetting:initializeUI()
  for ii = 0, __eQuickMenuStickPosition_Count - 1 do
    if __eQuickMenuStickPosition_QuickSlot == ii then
      break
    end
    self._ui._buttonPosition[ii] = UI.getChildControl(self._ui._ringBg, "Button_Templete" .. tostring(ii))
    self._ui._buttonPosition[ii]:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:quitRegistQuickMenu( " .. ii .. ")")
    self._ui._buttonPositionIcon[ii] = UI.getChildControl(self._ui._buttonPosition[ii], "Static_Icon")
  end
  self._ui._registerModeSelectItem = UI.getChildControl(self._ui._ringBg, "StaticText_SelectMenu")
  self._ui._registerModeSelectItemIcon = UI.getChildControl(self._ui._registerModeSelectItem, "Static_Icon")
  self._ui._oneSlotButton = UI.getChildControl(self._ui._oneSlotBg, "Button_OneSlot")
  self._ui._oneSlotButton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:quitRegistQuickMenu( " .. __eQuickMenuStickPosition_QuickSlot .. ")")
  self._ui._oneSlotButton:SetShow(true)
  self._ui._oneSlotIcon = UI.getChildControl(self._ui._oneSlotButton, "Static_Icon")
  self._ui._oneSlotIcon:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:quitRegistQuickMenu( " .. __eQuickMenuStickPosition_QuickSlot .. ")")
  self._ui._changeSlot = UI.getChildControl(Panel_QuickMenuCustom_RightRing, "StaticText_ChangeSlot")
  self._ui._changeSlot:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:changeMenuMode()")
  local tabBg = UI.getChildControl(Panel_QuickMenuCustom, "Static_TabBg")
  UI.getChildControl(tabBg, "RadioButton_Skill"):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:GoCategory(" .. __eQuickMenuDataType_Skill .. ")")
  UI.getChildControl(tabBg, "RadioButton_Item"):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:GoCategory(" .. __eQuickMenuDataType_Item .. ")")
  UI.getChildControl(tabBg, "RadioButton_Menu"):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:GoCategory(" .. __eQuickMenuDataType_Function .. ")")
  UI.getChildControl(tabBg, "RadioButton_Social"):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:GoCategory(" .. __eQuickMenuDataType_SocialAction .. ")")
  self._ui._list2Skill = UI.getChildControl(self._ui._rightBg, "List2_Skillt")
  self._ui._list2Menu = UI.getChildControl(self._ui._rightBg, "List2_Menu")
  self._ui._bgItem = UI.getChildControl(self._ui._rightBg, "Static_ItemMenuBg")
  self._ui._scrollItem = UI.getChildControl(self._ui._bgItem, "Scroll_Inventory")
  self._ui._bgItemTemplate = UI.getChildControl(self._ui._bgItem, "Static_ItemSlotBg_Template")
  self._ui._list2SocialAction = UI.getChildControl(self._ui._rightBg, "List2_SocialAction")
  self._ui._list2Skill:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "QuickMenuSeting_List2Event_SKill")
  self._ui._list2Menu:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "QuickMenuSeting_List2Event_Menu")
  self._ui._list2SocialAction:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "QuickMenuSeting_List2Event_SocialAction")
  self._ui._list2Skill:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui._list2Menu:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui._list2SocialAction:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  local rowMax = 8
  local colMax = 9
  local row = 0
  local col = 0
  local offset = 54
  local bgs = {}
  for index = 1, rowMax * colMax do
    local bg = UI.createAndCopyBasePropertyControl(self._ui._bgItem, "Static_ItemSlotBg_Template", self._ui._bgItem, "Item_" .. index)
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
    local param = {
      createIcon = true,
      createBorder = true,
      createCount = true,
      createEnchant = true,
      createClassEquipBG = true,
      createEnduranceIcon = true,
      createCash = true
    }
    local item = SlotItem.new(slot, index, 0, bgs[index], param)
    item:createChild()
    UIScroll.InputEventByControl(bgs[index], "PaGlobal_ConsoleQuickMenuSetting_scrollInventory")
    UIScroll.InputEventByControl(item.icon, "PaGlobal_ConsoleQuickMenuSetting_scrollInventory")
    if index < colMax then
      bgs[index]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_UP, "PaGlobal_ConsoleQuickMenuSetting_scrollInventory(true)")
    elseif index > colMax * (rowMax - 1) then
      bgs[index]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_DOWN, "PaGlobal_ConsoleQuickMenuSetting_scrollInventory(false)")
    end
    self._ui._slots[index] = item
  end
end
function PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(type, index)
  self._registMode._isStart = true
  self._registMode._stickPosition = __eQuickMenuStickPosition_Count
  local data
  if __eQuickMenuDataType_Item == type then
    data = self._inventoryData[index]
  elseif __eQuickMenuDataType_Skill == type then
    data = self._skillData[index]
  elseif __eQuickMenuDataType_Function == type then
    data = self._functionTypeData[index]
  elseif __eQuickMenuDataType_SocialAction == type then
    data = self._socialActionData[index]
  end
  self._registMode._settingData = data
  self:ShowBlackBg(true, data)
  if true == ToClient_isQuickMenuQuickMode(self._curGroup) then
    self:quitRegistQuickMenu(__eQuickMenuStickPosition_QuickSlot)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:ShowBlackBg(show, data)
  self._ui._registerModeBlackBg:SetShow(show)
  self._ui._ringCrossHair:SetShow(not show)
  self._ui._registerModeSelectItem:SetShow(show)
  if nil ~= data then
    local control = self._ui._registerModeSelectItemIcon
    if __eQuickMenuDataType_Skill == data._type then
      PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
    elseif __eQuickMenuDataType_Item == data._type then
      PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
    elseif __eQuickMenuDataType_Function == data._type then
      control:ChangeTextureInfoName(data._icon._path)
      control:getBaseTexture():setUV(setTextureUV_Func(control, data._icon._x1, data._icon._y1, data._icon._x2, data._icon._y2))
      control:setRenderTexture(control:getBaseTexture())
    elseif __eQuickMenuDataType_SocialAction == data._type then
      PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
    end
  end
end
function PaGlobal_ConsoleQuickMenuSetting:SetSkillDataMonoTone(index)
end
function PaGlobal_ConsoleQuickMenuSetting:quitRegistQuickMenu(executePosition)
  local registData = self._registMode._settingData
  self:clearRegistCustomSetting()
  self:ShowBlackBg(false)
  if nil == executePosition or __eQuickMenuStickPosition_Count == executePosition then
    return
  end
  if nil == registData then
  end
  self:registQuickMenu(registData, executePosition)
  PaGlobal_ConsoleQuickMenu:setWidget()
end
function PaGlobal_ConsoleQuickMenuSetting:clearRegistCustomSetting()
  self._registMode._isStart = false
  self._registMode._stickPosition = __eQuickMenuStickPosition_Count
  self._registMode._settingData = nil
end
function PaGlobal_ConsoleQuickMenuSetting:registQuickMenu(data, position)
  if nil == data then
    return
  end
  if __eQuickMenuDataType_Skill == data._type then
    self:registSkill(data, position)
  elseif __eQuickMenuDataType_Item == data._type then
    self:registItem(data, position)
  elseif __eQuickMenuDataType_Function == data._type then
    self:registFunctionType(data, position)
  elseif __eQuickMenuDataType_SocialAction == data._type then
    self:registSocialAction(data, position)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:registItem(data, position)
  if nil == data then
    return
  end
  local rv = ToClient_registQuickMenuItem(self._curGroup, position, data._whereType, data._slotNo)
  if true == rv then
    self:updateIcon(data, position)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:registSkill(data, position)
  if nil == data then
    return
  end
  local rv = ToClient_registQuickMenuSkill(self._curGroup, position, data._skillKey)
  if true == rv then
    self:updateIcon(data, position)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:registFunctionType(data, position)
  if nil == data then
    return
  end
  local rv = ToClient_registQuickMenuFunctionType(self._curGroup, position, data._enumType)
  if true == rv then
    self:updateIcon(data, position)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:registSocialAction(data, position)
  if nil == data then
    return
  end
  local rv = ToClient_registQuickMenuSocialAction(self._curGroup, position, data._socialKey)
  if true == rv then
    self:updateIcon(data, position)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:updateIcon(data, position)
  local control
  if __eQuickMenuStickPosition_QuickSlot == position then
    control = self._ui._oneSlotIcon
  else
    control = self._ui._buttonPositionIcon[position]
  end
  if nil == control then
    return
  end
  if __eQuickMenuDataType_Skill == data._type then
    PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
  elseif __eQuickMenuDataType_Item == data._type then
    PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
  elseif __eQuickMenuDataType_Function == data._type then
    control:ChangeTextureInfoName(data._icon._path)
    control:getBaseTexture():setUV(setTextureUV_Func(control, data._icon._x1, data._icon._y1, data._icon._x2, data._icon._y2))
    control:setRenderTexture(control:getBaseTexture())
  elseif __eQuickMenuDataType_SocialAction == data._type then
    PaGlobal_ConsoleQuickMenu:setIcon(control, data._icon)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:setFunctionTypeData()
  self._functionTypeData = {}
  if nil == PaGlobal_ConsoleQuickMenu._functionTypeList or nil == PaGlobal_ConsoleQuickMenu._functionTypeList._icon or nil == PaGlobal_ConsoleQuickMenu._functionTypeList._icon[__eQuickMenuDataType_Function] or nil == PaGlobal_ConsoleQuickMenu._functionTypeList._name or nil == PaGlobal_ConsoleQuickMenu._functionTypeList._name[__eQuickMenuDataType_Function] then
    return
  end
  for index = 0, PaGlobal_ConsoleQuickMenu._functionTypeCount do
    self._functionTypeData[#self._functionTypeData + 1] = {
      _type = __eQuickMenuDataType_Function,
      _enumType = index,
      _name = PaGlobal_ConsoleQuickMenu._functionTypeList._name[__eQuickMenuDataType_Function][index],
      _icon = PaGlobal_ConsoleQuickMenu._functionTypeList._icon[__eQuickMenuDataType_Function][index]
    }
  end
end
function PaGlobal_ConsoleQuickMenuSetting:setInventoryData()
  local selfPlayerWrapper = getSelfPlayer()
  if nil == selfPlayerWrapper then
    return nil
  end
  self._inventoryData = {}
  local useStartSlot = inventorySlotNoUserStart()
  local inventorysize = ToClient_InventoryGetSize(CppEnums.ItemWhereType.eInventory)
  for slotNo = useStartSlot, inventorysize - 1 do
    local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, slotNo)
    if nil ~= itemWrapper and false == itemWrapper:empty() and true == ToClient_isVaildItemRegistQuickMenu(itemWrapper:getStaticStatus()) then
      self._inventoryData[#self._inventoryData + 1] = {
        _type = __eQuickMenuDataType_Item,
        _whereType = CppEnums.ItemWhereType.eInventory,
        _slotNo = slotNo,
        _name = itemWrapper:getStaticStatus():getName(),
        _icon = "Icon/" .. itemWrapper:getStaticStatus():getIconPath()
      }
    end
  end
  inventorysize = ToClient_InventoryGetSize(CppEnums.ItemWhereType.eCashInventory)
  for slotNo = useStartSlot, inventorysize - 1 do
    local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eCashInventory, slotNo)
    if nil ~= itemWrapper and false == itemWrapper:empty() and true == ToClient_isVaildItemRegistQuickMenu(itemWrapper:getStaticStatus()) then
      self._inventoryData[#self._inventoryData + 1] = {
        _type = __eQuickMenuDataType_Item,
        _whereType = CppEnums.ItemWhereType.eCashInventory,
        _slotNo = slotNo,
        _name = itemWrapper:getStaticStatus():getName(),
        _icon = "Icon/" .. itemWrapper:getStaticStatus():getIconPath()
      }
    end
  end
end
function PaGlobal_ConsoleQuickMenuSetting:setSkillData()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local classType = selfPlayer:getClassType()
  if classType < 0 then
    return
  end
  self._skillData = {}
  local cellTable = getCombatSkillTree(classType)
  if nil == cellTable then
    return
  end
  self:setSkillCellTableData(cellTable)
end
function PaGlobal_ConsoleQuickMenuSetting:setSkillCellTableData(cellTable)
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  for row = 0, rows - 1 do
    for col = 0, cols - 1 do
      local cell = cellTable:atPointer(col, row)
      local skillNo = cell._skillNo
      if true == cell:isSkillType() then
        local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
        local skillTypeStatic = skillTypeStaticWrapper:get()
        if nil ~= skillTypeStaticWrapper and true == skillTypeStaticWrapper:isValidLocalizing() and nil ~= skillTypeStatic and true == skillTypeStatic._isSettableQuickSlot then
          local skillLevelInfo = getSkillLevelInfo(skillNo)
          local skillLearndLevel = getLearnedSkillLevel(skillTypeStaticWrapper)
          if nil ~= skillLevelInfo and true == skillLevelInfo._usable then
            self._skillData[#self._skillData + 1] = {
              _type = __eQuickMenuDataType_Skill,
              _skillKey = skillLevelInfo._skillKey:get(),
              _skillNo = skillNo,
              _name = skillTypeStaticWrapper:getName(),
              _icon = "Icon/" .. skillTypeStaticWrapper:getIconPath()
            }
          end
        end
      end
    end
  end
end
function PaGlobal_ConsoleQuickMenuSetting:setSocialActionData()
  self._socialActionData = {}
  for ii = 0, ToClient_getSocialActionInfoList() - 1 do
    local socialActionInfo = ToClient_getSocialActionInfoByIndex(ii)
    local sASS = socialActionInfo:getStaticStatus()
    local socialKey = sASS:getKey()
    self._socialActionData[#self._socialActionData + 1] = {
      _type = __eQuickMenuDataType_SocialAction,
      _socialKey = socialKey,
      _name = sASS:getName(),
      _icon = "Icon/" .. sASS:getIconPath()
    }
  end
end
function PaGlobal_ConsoleQuickMenuSetting:setSkillUi()
  self._ui._list2Skill:getElementManager():clearKey()
  for index = 1, #self._skillData do
    self._ui._list2Skill:getElementManager():pushKey(toInt64(0, index))
  end
end
function QuickMenuSeting_List2Event_SKill(content, key)
  local id = Int64toInt32(key)
  local skillData = PaGlobal_ConsoleQuickMenuSetting._skillData[id]
  local radiobutton = UI.getChildControl(content, "RadioButton_SkillSlotBg")
  local bg = UI.getChildControl(content, "Static_SlotBg")
  local slot = UI.getChildControl(content, "Static_Slot")
  slot:ChangeTextureInfoName(skillData._icon)
  radiobutton:SetText(skillData._name)
  radiobutton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_Skill .. "," .. id .. "  )")
end
function PaGlobal_ConsoleQuickMenuSetting:setInventoryUi()
  local rowMax = 8
  local colMax = 9
  local row = 0
  local col = 0
  local offset = 54
  for index = 1, rowMax * colMax do
    local dataIndex = index + self._startColumn * rowMax
    local data = self._inventoryData[dataIndex]
    local item = self._ui._slots[index]
    if nil ~= data then
      local itemWrapper = getInventoryItemByType(data._whereType, data._slotNo)
      if nil ~= itemWrapper and false == itemWrapper:empty() and true == ToClient_isVaildItemRegistQuickMenu(itemWrapper:getStaticStatus()) then
        item:setItem(itemWrapper, data._slotNo, false, false)
        item.icon:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_Item .. "," .. dataIndex .. "  )")
      else
        item:clearItem()
      end
    else
      item:clearItem()
    end
  end
end
function PaGlobal_ConsoleQuickMenuSetting_scrollInventory(isUp)
  local self = PaGlobal_ConsoleQuickMenuSetting
  local startIndex = UIScroll.ScrollEvent(self._ui._scrollItem, isUp, 9, 192, 1 + self._startColumn * 8, 8)
  self._startColumn = math.floor(startIndex / 8)
  self:setInventoryUi()
end
function PaGlobal_ConsoleQuickMenuSetting:setFunctionTypeUi()
  self._ui._list2Menu:getElementManager():clearKey()
  for index = 1, #self._functionTypeData do
    if 1 == index % 2 then
      self._ui._list2Menu:getElementManager():pushKey(toInt64(0, index))
    end
  end
end
function QuickMenuSeting_List2Event_Menu(content, key)
  local id = Int64toInt32(key)
  local leftFunctiondata = PaGlobal_ConsoleQuickMenuSetting._functionTypeData[id]
  local rightFunctiondata = PaGlobal_ConsoleQuickMenuSetting._functionTypeData[id + 1]
  local leftButton = UI.getChildControl(content, "Button_Left")
  local leftIcon = UI.getChildControl(content, "Static_LeftMenuIcon")
  local leftText = UI.getChildControl(content, "StaticText_LeftMenu")
  local leftLine = UI.getChildControl(content, "Static_LeftLine")
  local rightButton = UI.getChildControl(content, "Button_Right")
  local rightIcon = UI.getChildControl(content, "Static_RightMenuIcon")
  local rightText = UI.getChildControl(content, "StaticText_RightMenu")
  local rightLine = UI.getChildControl(content, "Static_RightLine")
  local leftOk = nil ~= leftFunctiondata
  local rightOk = nil ~= rightFunctiondata
  leftButton:SetShow(leftOk)
  leftIcon:SetShow(leftOk)
  leftText:SetShow(leftOk)
  leftLine:SetShow(leftOk)
  rightButton:SetShow(rightOk)
  rightIcon:SetShow(rightOk)
  rightText:SetShow(rightOk)
  rightLine:SetShow(rightOk)
  if leftOk then
    leftText:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    leftText:SetAutoResize(true)
    leftText:SetText(leftFunctiondata._name)
    leftIcon:ChangeTextureInfoName(leftFunctiondata._icon._path)
    leftIcon:getBaseTexture():setUV(setTextureUV_Func(leftIcon, leftFunctiondata._icon._x1, leftFunctiondata._icon._y1, leftFunctiondata._icon._x2, leftFunctiondata._icon._y2))
    leftIcon:setRenderTexture(leftIcon:getBaseTexture())
    leftButton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_Function .. "," .. id .. "  )")
  end
  if rightOk then
    rightText:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    rightText:SetAutoResize(true)
    rightText:SetText(rightFunctiondata._name)
    rightIcon:ChangeTextureInfoName(rightFunctiondata._icon._path)
    rightIcon:getBaseTexture():setUV(setTextureUV_Func(rightIcon, rightFunctiondata._icon._x1, rightFunctiondata._icon._y1, rightFunctiondata._icon._x2, rightFunctiondata._icon._y2))
    rightIcon:setRenderTexture(rightIcon:getBaseTexture())
    rightButton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_Function .. "," .. tostring(id + 1) .. "  )")
  end
end
function PaGlobal_ConsoleQuickMenuSetting:setSocialActionUi()
  self._ui._list2SocialAction:getElementManager():clearKey()
  for index = 1, #self._socialActionData do
    if 1 == index % 2 then
      self._ui._list2SocialAction:getElementManager():pushKey(toInt64(0, index))
    end
  end
end
function QuickMenuSeting_List2Event_SocialAction(content, key)
  local id = Int64toInt32(key)
  local leftData = PaGlobal_ConsoleQuickMenuSetting._socialActionData[id]
  local rightData = PaGlobal_ConsoleQuickMenuSetting._socialActionData[id + 1]
  local leftButton = UI.getChildControl(content, "Button_Left")
  local leftIcon = UI.getChildControl(content, "Static_LeftMenuIcon")
  local leftText = UI.getChildControl(content, "StaticText_LeftMenu")
  local leftLine = UI.getChildControl(content, "Static_LeftLine")
  local rightButton = UI.getChildControl(content, "Button_Right")
  local rightIcon = UI.getChildControl(content, "Static_RightMenuIcon")
  local rightText = UI.getChildControl(content, "StaticText_RightMenu")
  local rightLine = UI.getChildControl(content, "Static_RightLine")
  local leftOk = nil ~= leftData
  local rightOk = nil ~= rightData
  leftButton:SetShow(leftOk)
  leftIcon:SetShow(leftOk)
  leftText:SetShow(leftOk)
  leftLine:SetShow(leftOk)
  rightButton:SetShow(rightOk)
  rightIcon:SetShow(rightOk)
  rightText:SetShow(rightOk)
  rightLine:SetShow(rightOk)
  if leftOk then
    leftText:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    leftText:SetAutoResize(true)
    leftText:SetText(leftData._name)
    leftIcon:ChangeTextureInfoName(leftData._icon)
    leftButton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_SocialAction .. "," .. id .. "  )")
  end
  if rightOk then
    rightText:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    rightText:SetAutoResize(true)
    rightText:SetText(leftData._name)
    rightIcon:ChangeTextureInfoName(rightData._icon)
    rightButton:addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu(" .. __eQuickMenuDataType_SocialAction .. "," .. tostring(id + 1) .. "  )")
  end
end
function PaGlobal_ConsoleQuickMenuSetting:UpdateData()
  self:setSkillData()
  self:setInventoryData()
  self:setFunctionTypeData()
  self:setSocialActionData()
end
function PaGlobal_ConsoleQuickMenuSetting:UpdateUi()
  self:setSkillUi()
  self:setInventoryUi()
  self:setFunctionTypeUi()
  self:setSocialActionUi()
end
function FromClient_ConsoleQuickMenu_OpenCustomPage(currentSettingGroup)
  if currentSettingGroup < 0 or currentSettingGroup >= __eQuickMenuDpadGroup_Count then
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
function PaGlobal_ConsoleQuickMenuSetting:rotateDpadCrossHair(group)
  local control = PaGlobal_ConsoleQuickMenuSetting._ui._ringCrossHair
  if group == 0 then
    control:SetRotate(0)
  elseif group == 1 then
    control:SetRotate(math.pi)
  elseif group == 2 then
    control:SetRotate(math.pi + math.pi * 0.5)
  elseif group == 3 then
    control:SetRotate(math.pi * 0.5)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:SetUICusttomSettingCurrentGroup(group)
  local groupInfo = PaGlobal_ConsoleQuickMenu:GetCurrentGroupInfo(group)
  for position, info in ipairs(groupInfo) do
    local control = self._ui._buttonPositionIcon[position - 1]
    if nil == control then
      return
    end
    PaGlobal_ConsoleQuickMenu:setIcon(control, info._icon, info._uv)
  end
  local quickSlot = ToClient_getAtQuickMenu(group, __eQuickMenuStickPosition_QuickSlot)
  local quickSlotInfo = PaGlobal_ConsoleQuickMenu:GetPositionInfo(quickSlot)
  PaGlobal_ConsoleQuickMenu:setIcon(self._ui._oneSlotIcon, quickSlotInfo._icon, quickSlotInfo._uv)
end
function FGlobal_ConsoleQuickMenuSetting_RegistMode()
  local self = PaGlobal_ConsoleQuickMenuSetting
  local registPosition = ToClient_checkQuickMenuCurrentPosition()
  if __eQuickMenuStickPosition_Count == registPosition then
    if __eQuickMenuStickPosition_Count ~= self._registMode._stickPosition then
      self:quitRegistQuickMenu(self._registMode._stickPosition)
    end
  else
    self._registMode._stickPosition = registPosition
  end
  PaGlobal_ConsoleQuickMenuSetting:updatePosition(registPosition)
end
function PaGlobal_ConsoleQuickMenuSetting:updatePosition(registPosition)
  if __eQuickMenuStickPosition_Count == registPosition then
    if __eQuickMenuStickPosition_Count ~= self._registMode._stickPosition then
      self:quitRegistQuickMenu(self._registMode._stickPosition)
    end
    for _, control in pairs(self._ui._buttonPosition) do
      control:SetMonoTone(false)
      control:SetCheck(false)
    end
  else
    for _, control in pairs(self._ui._buttonPosition) do
      control:SetMonoTone(true)
      control:SetCheck(false)
    end
    self._ui._buttonPosition[registPosition]:SetMonoTone(false)
    self._ui._buttonPosition[registPosition]:SetCheck(true)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:setMenuMode(group)
  if true == ToClient_isQuickMenuQuickMode(group) then
    self._ui._ringBg:SetShow(false)
    self._ui._oneSlotBg:SetShow(true)
  else
    self._ui._ringBg:SetShow(true)
    self._ui._oneSlotBg:SetShow(false)
  end
end
function PaGlobal_ConsoleQuickMenuSetting:changeMenuMode()
  if true == ToClient_isQuickMenuQuickMode(self._curGroup) then
    ToClient_changeQuickMenuMode(self._curGroup, false)
  else
    ToClient_changeQuickMenuMode(self._curGroup, true)
  end
  self:setMenuMode(self._curGroup)
  PaGlobal_ConsoleQuickMenu:setWidget()
end
function FromClient_ConsoleQuickMenuSetting_luaLoadComplete()
  PaGlobal_ConsoleQuickMenuSetting:initializeUI()
  PaGlobal_ConsoleQuickMenuSetting:GoCategory(__eQuickMenuDataType_Item)
end
function FGlobal_ConsoleQuickMenu_PerFrame()
  if true == PaGlobal_ConsoleQuickMenuSetting._registMode._isStart then
    FGlobal_ConsoleQuickMenuSetting_RegistMode()
  else
  end
end
function FGlobal_ConsoleQuickMenu_ChangeDpadGroup(left)
  local changeGroup = PaGlobal_ConsoleQuickMenuSetting._curGroup
  if left == false then
    changeGroup = (PaGlobal_ConsoleQuickMenuSetting._curGroup + 1) % __eQuickMenuDpadGroup_Count
  else
    changeGroup = (PaGlobal_ConsoleQuickMenuSetting._curGroup - 1) % __eQuickMenuDpadGroup_Count
  end
  FromClient_ConsoleQuickMenu_OpenCustomPage(changeGroup)
end
function Toggle_QuickMenuSetting_forPadEventFunc(left)
  if true == left then
    PaGlobal_ConsoleQuickMenuSetting._curCategory = PaGlobal_ConsoleQuickMenuSetting._curCategory - 1
  else
    PaGlobal_ConsoleQuickMenuSetting._curCategory = PaGlobal_ConsoleQuickMenuSetting._curCategory + 1
  end
  PaGlobal_ConsoleQuickMenuSetting._curCategory = PaGlobal_ConsoleQuickMenuSetting._curCategory % 4
  PaGlobal_ConsoleQuickMenuSetting:GoCategory(PaGlobal_ConsoleQuickMenuSetting._curCategory)
end
function PaGlobal_QuickMenuSetting_GetShow()
  return Panel_QuickMenuCustom:GetShow()
end
Panel_QuickMenuCustom:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "FGlobal_ConsoleQuickMenu_ChangeDpadGroup(false)")
Panel_QuickMenuCustom:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "Toggle_QuickMenuSetting_forPadEventFunc(true)")
Panel_QuickMenuCustom:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "Toggle_QuickMenuSetting_forPadEventFunc(false)")
Panel_QuickMenuCustom:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobal_ConsoleQuickMenuSetting:changeMenuMode()")
Panel_QuickMenuCustom:RegisterUpdateFunc("FGlobal_ConsoleQuickMenu_PerFrame")
registerEvent("FromClient_luaLoadComplete", "FromClient_ConsoleQuickMenuSetting_luaLoadComplete")
registerEvent("FromClient_ConsoleQuickMenu_OpenCustomPage", "FromClient_ConsoleQuickMenu_OpenCustomPage")
