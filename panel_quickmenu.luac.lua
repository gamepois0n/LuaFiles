-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\menu\console\panel_quickmenu.luac 

-- params : ...
-- function num : 0
PaGlobal_ConsoleQuickMenu = {
_inventoryData = {}
, 
_skillData = {}
, 
_functionTypeData = {}
, 
_ui = {
_staticIcon = {}
, 
_staticTextName = {}
, 
_buttonPosition = {}
, 
_buttonPositionIcon = {}
, 
_quickMenuPosition = {}
, 
_quickMenuPositionIcon = {}
, _staticTextIconName = (UI.getChildControl)(Panel_QuickMenu, "StaticText_SelectedButtonTitle"), _staticTextIconDesc = (UI.getChildControl)(Panel_QuickMenu, "StaticText_SelectedButtonDesc"), _centerDeco = (UI.getChildControl)(Panel_QuickMenu, "Static_CenterDeco"), 
_line = {}
, _customCrossDeco = (UI.getChildControl)(Panel_QuickMenuCustom, "Static_CrossIcon")}
, _listMaxCount = 8, _curPage = 1, _curGroup = 0, _curPosition = 1, _curCategory = 0, 
_center = {_x = 0, _y = 0}
, _isAnimating = false, 
_icon = {
_center = {
[0] = {_x1 = 623, _y1 = 399, _x2 = 933, _y2 = 709}
, 
[1] = {_x1 = 399, _y1 = 88, _x2 = 709, _y2 = 398}
, 
[2] = {_x1 = 1, _y1 = 399, _x2 = 311, _y2 = 709}
, 
[3] = {_x1 = 312, _y1 = 399, _x2 = 622, _y2 = 709}
}
, 
_bottom = {
[0] = {_x1 = 399, _y1 = 710, _x2 = 485, _y2 = 796}
, 
[1] = {_x1 = 399, _y1 = 797, _x2 = 485, _y2 = 883}
, 
[2] = {_x1 = 486, _y1 = 710, _x2 = 572, _y2 = 796}
, 
[3] = {_x1 = 486, _y1 = 797, _x2 = 572, _y2 = 883}
}
}
}
-- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.initializeUI = function(self)
  -- function num : 0_0
  local rightBg = (UI.getChildControl)(Panel_QuickMenuCustom, "Static_RightBg")
  local leftBg = (UI.getChildControl)(Panel_QuickMenuCustom, "Static_LeftBg")
  local listBg = (UI.getChildControl)(rightBg, "Static_Menu")
  for ii = 1, self._listMaxCount do
    local bg = (UI.getChildControl)(listBg, "Static_MenuSlotBg" .. tostring(ii - 1))
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R9 in 'UnsetPending'

    ;
    ((self._ui)._staticIcon)[ii] = (UI.getChildControl)(bg, "Static_MenuSlotIcon")
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R9 in 'UnsetPending'

    ;
    ((self._ui)._staticTextName)[ii] = (UI.getChildControl)(bg, "StaticText_MenuName")
    ;
    (((self._ui)._staticIcon)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenu:registQuickMenu( " .. ii .. ")")
  end
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._customCenterDeco = (UI.getChildControl)(leftBg, "Static_CenterDeco")
  for ii = 1, __eQuickMenuPosition_Count do
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R8 in 'UnsetPending'

    ((self._ui)._buttonPosition)[ii] = (UI.getChildControl)(leftBg, "Button_Templete" .. tostring(ii - 1))
    ;
    (((self._ui)._buttonPosition)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenu:setPosition( " .. ii .. ")")
    -- DECOMPILER ERROR at PC97: Confused about usage of register: R8 in 'UnsetPending'

    ;
    ((self._ui)._buttonPositionIcon)[ii] = (UI.getChildControl)(((self._ui)._buttonPosition)[ii], "Static_Icon")
  end
  for ii = 1, __eQuickMenuPosition_Count do
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R8 in 'UnsetPending'

    ((self._ui)._quickMenuPosition)[ii] = (UI.getChildControl)(Panel_QuickMenu, "Button_Templete" .. tostring(ii - 1))
    -- DECOMPILER ERROR at PC124: Confused about usage of register: R8 in 'UnsetPending'

    ;
    ((self._ui)._quickMenuPositionIcon)[ii] = (UI.getChildControl)(((self._ui)._quickMenuPosition)[ii], "Static_Icon")
  end
  -- DECOMPILER ERROR at PC132: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._center = (UI.getChildControl)(Panel_QuickMenu, "Static_CenterPoint")
  for ii = 1, __eQuickMenuPosition_Count do
    -- DECOMPILER ERROR at PC147: Confused about usage of register: R8 in 'UnsetPending'

    ((self._ui)._line)[ii] = (UI.getChildControl)((self._ui)._center, "Static_Line" .. ii - 1)
    ;
    (((self._ui)._line)[ii]):SetShow(false)
  end
  ;
  ((UI.getChildControl)(Panel_QuickMenuCustom, "RadioButton_Skill")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenu:CustomSettingSetCategory( " .. __eQuickMenuDataType_Skill .. ")")
  ;
  ((UI.getChildControl)(Panel_QuickMenuCustom, "RadioButton_Item")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenu:CustomSettingSetCategory( " .. __eQuickMenuDataType_Item .. " )")
  ;
  ((UI.getChildControl)(Panel_QuickMenuCustom, "RadioButton_Menu")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenu:CustomSettingSetCategory( " .. __eQuickMenuDataType_Function .. " )")
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.registQuickMenu = function(self, index)
  -- function num : 0_1
  if __eQuickMenuDataType_Skill == self._curCategory then
    self:registSkill(index)
  else
    if __eQuickMenuDataType_Item == self._curCategory then
      self:registItem(index)
    else
      if __eQuickMenuDataType_Function == self._curCategory then
        self:registFunctionType(index)
      end
    end
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.registItem = function(self, index)
  -- function num : 0_2
  if (self._inventoryData)[self._listMaxCount * (self._curPage - 1) + index] == nil then
    return 
  end
  local rv = ToClient_registQuickMenuItem(self._curGroup, self._curPosition - 1, (CppEnums.ItemWhereType).eInventory, ((self._inventoryData)[self._listMaxCount * (self._curPage - 1) + index])._slotNo)
  if rv == true then
    local control = ((PaGlobal_ConsoleQuickMenu._ui)._buttonPositionIcon)[self._curPosition]
    control:ChangeTextureInfoName(((self._inventoryData)[self._listMaxCount * (self._curPage - 1) + index])._icon)
    ;
    (control:getBaseTexture()):setUV(0, 0, 1, 1)
    control:setRenderTexture(control:getBaseTexture())
  end
end

-- DECOMPILER ERROR at PC123: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.registSkill = function(self, index)
  -- function num : 0_3
  if (self._skillData)[self._listMaxCount * (self._curPage - 1) + index] == nil then
    return 
  end
  local rv = ToClient_registQuickMenuSkill(self._curGroup, self._curPosition - 1, ((self._skillData)[self._listMaxCount * (self._curPage - 1) + index])._skillKey)
  if rv == true then
    local control = ((PaGlobal_ConsoleQuickMenu._ui)._buttonPositionIcon)[self._curPosition]
    control:ChangeTextureInfoName(((self._skillData)[self._listMaxCount * (self._curPage - 1) + index])._icon)
    ;
    (control:getBaseTexture()):setUV(0, 0, 1, 1)
    control:setRenderTexture(control:getBaseTexture())
  end
end

-- DECOMPILER ERROR at PC126: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.registFunctionType = function(self, index)
  -- function num : 0_4
  if (self._functionTypeData)[self._listMaxCount * (self._curPage - 1) + index] == nil then
    return 
  end
  local rv = ToClient_registQuickMenuFunctionType(self._curGroup, self._curPosition - 1, ((self._functionTypeData)[self._listMaxCount * (self._curPage - 1) + index])._enumType)
  if rv == true then
    local data = (self._functionTypeData)[self._listMaxCount * (self._curPage - 1) + index]
    local control = ((PaGlobal_ConsoleQuickMenu._ui)._buttonPositionIcon)[self._curPosition]
    control:ChangeTextureInfoName((data._icon)._path)
    ;
    (control:getBaseTexture()):setUV(setTextureUV_Func(control, (data._icon)._x1, (data._icon)._y1, (data._icon)._x2, (data._icon)._y2))
    control:setRenderTexture(control:getBaseTexture())
  end
end

-- DECOMPILER ERROR at PC129: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.CustomSettingSetCategory = function(self, category)
  -- function num : 0_5
  self._curPage = 1
  self._curCategory = category
  self:CustomSettingUpdateCurrentPage()
end

-- DECOMPILER ERROR at PC132: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.CustomSettingNextPage = function(self)
  -- function num : 0_6
  -- DECOMPILER ERROR at PC12: Unhandled construct in 'MakeBoolean' P1

  if __eQuickMenuDataType_Skill == category and #self._skillData < self._listMaxCount * (self._curPage + 1) then
    return 
  end
  -- DECOMPILER ERROR at PC26: Unhandled construct in 'MakeBoolean' P1

  if __eQuickMenuDataType_Item == category and #self._invetoryData < self._listMaxCount * (self._curPage + 1) then
    return 
  end
  if __eQuickMenuDataType_Function == category and #self._functionTypeData < self._listMaxCount * (self._curPage + 1) then
    return 
  end
  self._curPage = self._curPage + 1
  self:CustomSettingUpdateCurrentPage()
end

-- DECOMPILER ERROR at PC135: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.CustomSettingPrevPage = function(self)
  -- function num : 0_7
  if self._curPage > 1 then
    self._curPage = self._curPage - 1
  end
  self:CustomSettingUpdateCurrentPage()
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.CustomSettingUpdateCurrentPage = function(self)
  -- function num : 0_8
  for ii = 1, self._listMaxCount do
    local convertIndex = self._listMaxCount * (self._curPage - 1) + ii
    local data = nil
    -- DECOMPILER ERROR at PC19: Unhandled construct in 'MakeBoolean' P1

    if __eQuickMenuDataType_Skill == self._curCategory and convertIndex <= #self._skillData then
      data = (self._skillData)[convertIndex]
    end
    -- DECOMPILER ERROR at PC31: Unhandled construct in 'MakeBoolean' P1

    if __eQuickMenuDataType_Item == self._curCategory and convertIndex <= #self._inventoryData then
      data = (self._inventoryData)[convertIndex]
    end
    if __eQuickMenuDataType_Function == self._curCategory and convertIndex <= #self._functionTypeData then
      data = (self._functionTypeData)[convertIndex]
    end
    if data ~= nil and data._icon ~= nil and data._name ~= nil then
      local control = ((self._ui)._staticIcon)[ii]
      if __eQuickMenuDataType_Function == self._curCategory then
        control:ChangeTextureInfoName((data._icon)._path)
        ;
        (control:getBaseTexture()):setUV(setTextureUV_Func(control, (data._icon)._x1, (data._icon)._y1, (data._icon)._x2, (data._icon)._y2))
        control:setRenderTexture(control:getBaseTexture())
      else
        control:ChangeTextureInfoName(data._icon)
        ;
        (control:getBaseTexture()):setUV(0, 0, 1, 1)
        control:setRenderTexture(control:getBaseTexture())
      end
      ;
      (((self._ui)._staticTextName)[ii]):SetText(data._name)
    end
  end
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.CustomSettingDataUpdate = function(self)
  -- function num : 0_9
  self:getInventToryData()
  self:getSkillData()
  self:getFunctionTypeData()
  for index,value in ipairs(self._inventoryData) do
    _PA_LOG("후진", "inventory: " .. value._whereType .. ", slotNo: " .. value._slotNo .. " name : " .. value._name .. " icon: " .. value._icon)
  end
  for index,value in ipairs(self._skillData) do
    _PA_LOG("후진", "_skillKey: " .. value._skillKey .. ", _skillNo: " .. value._skillNo .. " name : " .. value._name .. " icon: " .. value._icon)
  end
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.getFunctionTypeData = function(self)
  -- function num : 0_10
  self._functionTypeData = {}
  if self._functionTypeList == nil or (self._functionTypeList)._icon == nil or (self._functionTypeList)._name == nil then
    return 
  end
  for index = 0, __eQuickMenuFunctionType_Undefined do
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R5 in 'UnsetPending'

    (self._functionTypeData)[#self._functionTypeData + 1] = {_enumType = index, _name = ((self._functionTypeList)._name)[index], _icon = ((self._functionTypeList)._icon)[index]}
  end
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.getInventToryData = function(self)
  -- function num : 0_11
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return nil
  end
  self._inventoryData = {}
  local useStartSlot = inventorySlotNoUserStart()
  local inventorysize = ToClient_InventoryGetSize((CppEnums.ItemWhereType).eInventory)
  for slotNo = useStartSlot, inventorysize - 1 do
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, slotNo)
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R9 in 'UnsetPending'

    if itemWrapper ~= nil and itemWrapper:empty() == false and ToClient_isVaildItemRegistQuickMenu(itemWrapper:getStaticStatus()) == true then
      (self._inventoryData)[#self._inventoryData + 1] = {_whereType = (CppEnums.ItemWhereType).eInventory, _slotNo = slotNo, _name = (itemWrapper:getStaticStatus()):getName(), _icon = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
    end
  end
  inventorysize = ToClient_InventoryGetSize((CppEnums.ItemWhereType).eCashInventory)
  for slotNo = useStartSlot, inventorysize - 1 do
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, slotNo)
    -- DECOMPILER ERROR at PC111: Confused about usage of register: R9 in 'UnsetPending'

    if itemWrapper ~= nil and itemWrapper:empty() == false and ToClient_isVaildItemRegistQuickMenu(itemWrapper:getStaticStatus()) == true then
      (self._inventoryData)[#self._inventoryData + 1] = {_whereType = (CppEnums.ItemWhereType).eCashInventory, _slotNo = slotNo, _name = (itemWrapper:getStaticStatus()):getName(), _icon = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
    end
  end
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.getSkillData = function(self)
  -- function num : 0_12
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
  self:getSkillCellTableData(cellTable)
  cellTable = getAwakeningWeaponSkillTree(classType)
  if cellTable == nil then
    return 
  end
  self:getSkillCellTableData(cellTable)
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.getSkillCellTableData = function(self, cellTable)
  -- function num : 0_13
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
          -- DECOMPILER ERROR at PC66: Confused about usage of register: R18 in 'UnsetPending'

          if skillLevelInfo ~= nil and skillLevelInfo._usable == true then
            (self._skillData)[#self._skillData + 1] = {_skillKey = (skillLevelInfo._skillKey):get(), _skillNo = skillNo, _name = skillTypeStaticWrapper:getName(), _icon = "Icon/" .. skillTypeStaticWrapper:getIconPath()}
          end
        end
      end
    end
  end
end

FGlobal_ConsoleQuickMenu_Update = function(position)
  -- function num : 0_14
  if __eQuickMenuPosition_Count <= position then
    for ii = 1, __eQuickMenuPosition_Count do
      (((PaGlobal_ConsoleQuickMenu._ui)._quickMenuPosition)[ii]):SetMonoTone(false)
      ;
      (((PaGlobal_ConsoleQuickMenu._ui)._quickMenuPosition)[ii]):SetCheck(false)
    end
  else
    do
      for ii = 1, __eQuickMenuPosition_Count do
        (((PaGlobal_ConsoleQuickMenu._ui)._quickMenuPosition)[ii]):SetMonoTone(true)
        ;
        (((PaGlobal_ConsoleQuickMenu._ui)._quickMenuPosition)[ii]):SetCheck(false)
      end
      ;
      (((PaGlobal_ConsoleQuickMenu._ui)._quickMenuPosition)[position + 1]):SetMonoTone(false)
      ;
      (((PaGlobal_ConsoleQuickMenu._ui)._quickMenuPosition)[position + 1]):SetCheck(true)
      PaGlobal_ConsoleQuickMenu:setButtonPos(position + 1)
      local name = PaGlobal_ConsoleQuickMenu:GetCurrentQuickMenuName(PaGlobal_ConsoleQuickMenu._curGroup, position)
      ;
      ((PaGlobal_ConsoleQuickMenu._ui)._staticTextIconName):SetText(name)
      ;
      ((PaGlobal_ConsoleQuickMenu._ui)._staticTextIconDesc):SetText("")
    end
  end
end

-- DECOMPILER ERROR at PC158: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.setButtonPos = function(self, selectedIndex)
  -- function num : 0_15
  if self._isAnimating then
    return 
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._center).x = ((self._ui)._center):GetPosX()
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._center).y = ((self._ui)._center):GetPosY()
  local angle = 2 * math.pi / 8 * 5
  local angleOffset = 2 * math.pi / 8
  for index = 1, 8 do
    angle = angle + angleOffset
    if selectedIndex == index then
      local x = 205 * (math.cos)(angle)
      local y = 205 * (math.sin)(angle)
      ;
      (((self._ui)._quickMenuPosition)[index]):SetPosX((self._center).x + x - 47)
      ;
      (((self._ui)._quickMenuPosition)[index]):SetPosY((self._center).y + y - 47)
      ;
      (((self._ui)._line)[index]):SetShow(false)
    else
      do
        local x = 185 * (math.cos)(angle)
        do
          local y = 185 * (math.sin)(angle)
          ;
          (((self._ui)._quickMenuPosition)[index]):SetPosX((self._center).x + x - 47)
          ;
          (((self._ui)._quickMenuPosition)[index]):SetPosY((self._center).y + y - 47)
          ;
          (((self._ui)._line)[index]):SetShow(false)
          -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC101: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC161: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.moveButtonAni = function(self, currentPosition)
  -- function num : 0_16
  if currentPosition == nil or currentPosition < 0 or __eQuickMenuPosition_Count <= currentPosition then
    return 
  end
  local control = ((self._ui)._quickMenuPosition)[currentPosition + 1]
  local buttonMoveAni = control:addMoveAnimation(0, 0.1, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  buttonMoveAni:SetStartPosition(control:GetPosX(), control:GetPosY())
  buttonMoveAni:SetEndPosition((self._center).x - 47, (self._center).y - 47)
  buttonMoveAni.IsChangeChild = true
  control:CalcUIAniPos(buttonMoveAni)
  buttonMoveAni:SetDisableWhileAni(true)
  for index,value in pairs((self._ui)._line) do
    value:SetShow(false)
  end
  self._isAnimating = true
end

-- DECOMPILER ERROR at PC164: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.clearButtonAni = function(self)
  -- function num : 0_17
  for index,value in pairs((self._ui)._quickMenuPosition) do
    value:ResetAndClearVertexAni()
  end
end

QuickMenu_ShowAni = function()
  -- function num : 0_18
  (UIAni.AlphaAnimation)(1, Panel_QuickMenu, 0, 0.1)
  local aniInfo1 = Panel_QuickMenu:addScaleAnimation(0, 0.1, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.9)
  aniInfo1:SetEndScale(1)
  aniInfo1.AxisX = Panel_QuickMenu:GetSizeX() / 2
  aniInfo1.AxisY = Panel_QuickMenu:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
end

QuickMenu_HideAni = function()
  -- function num : 0_19
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_QuickMenu, 0.1, 0.2)
  aniInfo:SetHideAtEnd(true)
end

FGlobal_ConsoleQuickMenu_IsShow = function()
  -- function num : 0_20
  return Panel_QuickMenu:GetShow()
end

FGlobal_ConsoleQuickMenuCustom_IsShow = function()
  -- function num : 0_21
  return Panel_QuickMenuCustom:GetShow()
end

FGlobal_ConsoleQuickMenu_Open = function(currentGroup)
  -- function num : 0_22
  if currentGroup < 0 or __eQuickMenuGroup_Count <= currentGroup then
    return 
  end
  if Panel_QuickMenuCustom:GetShow() == true then
    return 
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_ConsoleQuickMenu._isAnimating = false
  PaGlobal_ConsoleQuickMenu:clearButtonAni()
  Panel_QuickMenu:SetShow(true, true)
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_ConsoleQuickMenu._curGroup = currentGroup
  PaGlobal_ConsoleQuickMenu:SetUICurrentGroup(currentGroup)
  PaGlobal_ConsoleQuickMenu:setButtonPos(__eQuickMenuPosition_Count + 1)
  PaGlobal_ConsoleQuickMenu:CrossTextureChange(currentGroup)
end

FromClient_ConsoleQuickMenu_Quit = function(currentPosition)
  -- function num : 0_23
  PaGlobal_ConsoleQuickMenu:moveButtonAni(currentPosition)
  Panel_QuickMenu:SetShow(false, true)
end

FromClient_ConsoleQuickMenu_OpenCustomPage = function(currentGroup)
  -- function num : 0_24
  if currentGroup < 0 or __eQuickMenuGroup_Count <= currentGroup then
    return 
  end
  FromClient_ConsoleQuickMenu_Quit()
  Panel_QuickMenuCustom:SetShow(true)
  PaGlobal_ConsoleQuickMenu:CustomSettingDataUpdate()
  PaGlobal_ConsoleQuickMenu:CustomSettingUpdateCurrentPage()
  PaGlobal_ConsoleQuickMenu:SetUICusttomSettingCurrentGroup(currentGroup)
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_ConsoleQuickMenu._curPosition = 1
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_ConsoleQuickMenu._curGroup = currentGroup
  PaGlobal_ConsoleQuickMenu:CustomCrossTextureChange(currentGroup)
end

-- DECOMPILER ERROR at PC181: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.SetUICurrentGroup = function(self, group)
  -- function num : 0_25
  local groupInfo = self:GetCurrentGroupInfo(group)
  for position,info in ipairs(groupInfo) do
    if ((self._ui)._quickMenuPositionIcon)[position] == nil then
      _PA_LOG("후진", " ??? " .. position)
      return 
    end
    local control = ((self._ui)._quickMenuPositionIcon)[position]
    control:ChangeTextureInfoName(info._icon)
    if info._uv ~= nil then
      (control:getBaseTexture()):setUV(setTextureUV_Func(control, (info._uv)._x1, (info._uv)._y1, (info._uv)._x2, (info._uv)._y2))
    else
      ;
      (control:getBaseTexture()):setUV(0, 0, 1, 1)
    end
    control:setRenderTexture(control:getBaseTexture())
  end
end

-- DECOMPILER ERROR at PC184: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.SetUICusttomSettingCurrentGroup = function(self, group)
  -- function num : 0_26
  local groupInfo = self:GetCurrentGroupInfo(group)
  for position,info in ipairs(groupInfo) do
    if ((self._ui)._buttonPositionIcon)[position] == nil then
      _PA_LOG("후진", " ??? " .. position)
      return 
    end
    local control = ((self._ui)._buttonPositionIcon)[position]
    control:ChangeTextureInfoName(info._icon)
    if info._uv ~= nil then
      (control:getBaseTexture()):setUV(setTextureUV_Func(control, (info._uv)._x1, (info._uv)._y1, (info._uv)._x2, (info._uv)._y2))
    else
      ;
      (control:getBaseTexture()):setUV(0, 0, 1, 1)
    end
    control:setRenderTexture(control:getBaseTexture())
  end
end

-- DECOMPILER ERROR at PC187: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.GetCurrentGroupInfo = function(self, group)
  -- function num : 0_27
  if group < 0 or __eQuickMenuGroup_Count <= group then
    return 
  end
  local table = {}
  for position = 0, __eQuickMenuPosition_Count - 1 do
    local quickMenu = ToClient_getAtQuickMenu(group, position)
    if quickMenu == nil then
      return 
    end
    local name = ""
    local icon = ""
    local uv = nil
    if __eQuickMenuDataType_Skill == quickMenu._type then
      local skillTypeStaticWrapper = getSkillTypeStaticStatus((quickMenu._skillKey):getSkillNo())
      if skillTypeStaticWrapper ~= nil then
        name = skillTypeStaticWrapper:getName()
        icon = "Icon/" .. skillTypeStaticWrapper:getIconPath()
      end
    else
      do
        if __eQuickMenuDataType_Item == quickMenu._type then
          local itemStaticStatusWrapper = getItemEnchantStaticStatus(quickMenu._itemKey)
          if itemStaticStatusWrapper ~= nil then
            name = itemStaticStatusWrapper:getName()
            icon = "Icon/" .. itemStaticStatusWrapper:getIconPath()
          end
        else
          do
            if __eQuickMenuDataType_Function == quickMenu._type then
              name = ((self._functionTypeList)._name)[quickMenu._functionType]
              icon = (((self._functionTypeList)._icon)[quickMenu._functionType])._path
              local iconUV = ((self._functionTypeList)._icon)[quickMenu._functionType]
              uv = {_x1 = iconUV._x1, _y1 = iconUV._y1, _x2 = iconUV._x2, _y2 = iconUV._y2}
            end
            do
              do
                table[#table + 1] = {_name = name, _icon = icon, _uv = uv}
                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC92: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  return table
end

-- DECOMPILER ERROR at PC190: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.GetCurrentQuickMenuName = function(self, group, position)
  -- function num : 0_28
  if group < 0 or __eQuickMenuGroup_Count <= group then
    return ""
  end
  local table = {}
  local quickMenu = ToClient_getAtQuickMenu(group, position)
  if quickMenu == nil then
    return ""
  end
  local name = ""
  if __eQuickMenuDataType_Skill == quickMenu._type then
    local skillTypeStaticWrapper = getSkillTypeStaticStatus((quickMenu._skillKey):getSkillNo())
    if skillTypeStaticWrapper ~= nil then
      name = skillTypeStaticWrapper:getName()
    end
  else
    do
      if __eQuickMenuDataType_Item == quickMenu._type then
        local itemStaticStatusWrapper = getItemEnchantStaticStatus(quickMenu._itemKey)
        if itemStaticStatusWrapper ~= nil then
          name = itemStaticStatusWrapper:getName()
        end
      else
        do
          if __eQuickMenuDataType_Function == quickMenu._type then
            name = ((self._functionTypeList)._name)[quickMenu._functionType]
          end
          return name
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC193: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.CrossTextureChange = function(self, currentGroup)
  -- function num : 0_29
  local bottomControl = (self._ui)._staticTextIconName
  local iconPathData1 = ((self._icon)._bottom)[currentGroup]
  bottomControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  ;
  (bottomControl:getBaseTexture()):setUV(setTextureUV_Func(bottomControl, iconPathData1._x1, iconPathData1._y1, iconPathData1._x2, iconPathData1._y2))
  bottomControl:setRenderTexture(bottomControl:getBaseTexture())
  local centerControl = (self._ui)._centerDeco
  local iconPathData2 = ((self._icon)._center)[currentGroup]
  centerControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  ;
  (centerControl:getBaseTexture()):setUV(setTextureUV_Func(centerControl, iconPathData2._x1, iconPathData2._y1, iconPathData2._x2, iconPathData2._y2))
  centerControl:setRenderTexture(centerControl:getBaseTexture())
end

-- DECOMPILER ERROR at PC196: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.CustomCrossTextureChange = function(self, currentGroup)
  -- function num : 0_30
  local crossControl = (self._ui)._customCrossDeco
  local iconPathData1 = ((self._icon)._bottom)[currentGroup]
  crossControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  ;
  (crossControl:getBaseTexture()):setUV(setTextureUV_Func(crossControl, iconPathData1._x1, iconPathData1._y1, iconPathData1._x2, iconPathData1._y2))
  crossControl:setRenderTexture(crossControl:getBaseTexture())
  local centerControl = (self._ui)._customCenterDeco
  local iconPathData2 = ((self._icon)._center)[currentGroup]
  centerControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  ;
  (centerControl:getBaseTexture()):setUV(setTextureUV_Func(centerControl, iconPathData2._x1, iconPathData2._y1, iconPathData2._x2, iconPathData2._y2))
  centerControl:setRenderTexture(centerControl:getBaseTexture())
end

FromClient_ConsoleQuickMenu_luaLoadComplete = function()
  -- function num : 0_31
  PaGlobal_ConsoleQuickMenu:initializeUI()
  PaGlobal_ConsoleQuickMenu:setDefaultSetting()
end

-- DECOMPILER ERROR at PC201: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.setPosition = function(self, index)
  -- function num : 0_32
  self._curPosition = index
end

FromClient_ConsoleQuickMenu_Open = function(group)
  -- function num : 0_33
  FGlobal_ConsoleQuickMenu_Open(group)
end

registerEvent("FromClient_luaLoadComplete", "FromClient_ConsoleQuickMenu_luaLoadComplete")
registerEvent("FromClient_ConsoleQuickMenu_Quit", "FromClient_ConsoleQuickMenu_Quit")
registerEvent("FromClient_ConsoleQuickMenu_OpenCustomPage", "FromClient_ConsoleQuickMenu_OpenCustomPage")
registerEvent("FromClient_ConsoleQuickMenu_Open", "FromClient_ConsoleQuickMenu_Open")
Panel_QuickMenu:RegisterShowEventFunc(true, "QuickMenu_ShowAni()")
Panel_QuickMenu:RegisterShowEventFunc(false, "QuickMenu_HideAni()")
ConsoleQuickMenu_UpdatePage = function()
  -- function num : 0_34
  if isPadUp(__eJoyPadInputType_RightTrigger) then
    PaGlobal_ConsoleQuickMenu:CustomSettingNextPage()
  end
  if isPadUp(__eJoyPadInputType_LeftTrigger) then
    PaGlobal_ConsoleQuickMenu:CustomSettingPrevPage()
  end
  if isPadUp(__eJoyPadInputType_X) then
    Panel_QuickMenuCustom:SetShow(false)
  end
end

Panel_QuickMenuCustom:RegisterUpdateFunc("ConsoleQuickMenu_UpdatePage")
-- DECOMPILER ERROR at PC238: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.setDefaultSetting = function(self)
  -- function num : 0_35
  ToClient_registQuickMenuFunctionType(3, 0, __eQuickMenuFunctionType_Inventory)
  ToClient_registQuickMenuFunctionType(3, 1, __eQuickMenuFunctionType_BlackSpirit)
  ToClient_registQuickMenuFunctionType(3, 2, __eQuickMenuFunctionType_WorldMap)
  ToClient_registQuickMenuFunctionType(3, 3, __eQuickMenuFunctionType_Skill)
  ToClient_registQuickMenuFunctionType(3, 4, __eQuickMenuFunctionType_Mail)
  ToClient_registQuickMenuFunctionType(3, 5, __eQuickMenuFunctionType_CharacterChallange)
  ToClient_registQuickMenuFunctionType(3, 6, __eQuickMenuFunctionType_ItemMarket)
  ToClient_registQuickMenuFunctionType(3, 7, __eQuickMenuFunctionType_Quest)
  ToClient_registQuickMenuFunctionType(2, 0, __eQuickMenuFunctionType_ServantCall)
  ToClient_registQuickMenuFunctionType(2, 1, __eQuickMenuFunctionType_ServantNavi)
  ToClient_registQuickMenuFunctionType(2, 2, __eQuickMenuFunctionType_PetList)
  ToClient_registQuickMenuFunctionType(2, 3, __eQuickMenuFunctionType_NpcFind)
  ToClient_registQuickMenuFunctionType(2, 4, __eQuickMenuFunctionType_MovieGuide)
  ToClient_registQuickMenuFunctionType(2, 5, __eQuickMenuFunctionType_VillageSiegeArea)
  ToClient_registQuickMenuFunctionType(2, 6, __eQuickMenuFunctionType_Pvp)
  ToClient_registQuickMenuFunctionType(2, 7, __eQuickMenuFunctionType_HouseList)
end


