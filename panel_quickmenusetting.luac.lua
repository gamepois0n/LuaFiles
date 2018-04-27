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
_ui = {
_staticIcon = {}
, 
_staticTextName = {}
, 
_buttonPosition = {}
, 
_buttonPositionIcon = {}
, _customCrossDeco = (UI.getChildControl)(Panel_QuickMenuCustom, "Static_CrossIcon")}
, 
_registMode = {_isStart = false, _stickPosition = __eQuickMenuStickPosition_Count, _index = -1}
, _listMaxCount = 8, _curState = __eQuickMenuState_Count, _curPosition = 1, _curPage = 1, _curGroup = __eQuickMenuDpadGroup_Count, _curCategory = 0}
-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.initializeUI = function(self)
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
    (((self._ui)._staticIcon)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:startRegistQuickMenu( " .. ii .. ")")
  end
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._customCenterDeco = (UI.getChildControl)(leftBg, "Static_CenterDeco")
  for ii = 1, __eQuickMenuStickPosition_Count do
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R8 in 'UnsetPending'

    ((self._ui)._buttonPosition)[ii] = (UI.getChildControl)(leftBg, "Button_Templete" .. tostring(ii - 1))
    ;
    (((self._ui)._buttonPosition)[ii]):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:setPosition( " .. ii .. ")")
    -- DECOMPILER ERROR at PC97: Confused about usage of register: R8 in 'UnsetPending'

    ;
    ((self._ui)._buttonPositionIcon)[ii] = (UI.getChildControl)(((self._ui)._buttonPosition)[ii], "Static_Icon")
  end
  ;
  ((UI.getChildControl)(Panel_QuickMenuCustom, "RadioButton_Skill")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:CustomSettingSetCategory( " .. __eQuickMenuDataType_Skill .. ")")
  ;
  ((UI.getChildControl)(Panel_QuickMenuCustom, "RadioButton_Item")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:CustomSettingSetCategory( " .. __eQuickMenuDataType_Item .. " )")
  ;
  ((UI.getChildControl)(Panel_QuickMenuCustom, "RadioButton_Menu")):addInputEvent("Mouse_LUp", "PaGlobal_ConsoleQuickMenuSetting:CustomSettingSetCategory( " .. __eQuickMenuDataType_Function .. " )")
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.startRegistQuickMenu = function(self, index)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  (self._registMode)._isStart = true
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._registMode)._stickPosition = __eQuickMenuStickPosition_Count
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._registMode)._index = index
  for ii = 1, self._listMaxCount do
    (((self._ui)._staticIcon)[ii]):SetMonoTone(true)
    ;
    (((self._ui)._staticTextName)[ii]):SetMonoTone(true)
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.quitRegistQuickMenu = function(self, executePosition)
  -- function num : 0_2
  local exeucteIndex = (self._registMode)._index
  self:clearRegistCustomSetting()
  if executePosition == nil or __eQuickMenuStickPosition_Count == executePosition then
    return 
  end
  self:registQuickMenu(exeucteIndex, executePosition)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.clearRegistCustomSetting = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._registMode)._isStart = false
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._registMode)._stickPosition = __eQuickMenuStickPosition_Count
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._registMode)._index = -1
  for ii = 1, self._listMaxCount do
    (((self._ui)._staticIcon)[ii]):SetMonoTone(false)
    ;
    (((self._ui)._staticTextName)[ii]):SetMonoTone(false)
  end
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.registQuickMenu = function(self, index, position)
  -- function num : 0_4
  local realIndex = self._listMaxCount * (self._curPage - 1) + index
  if __eQuickMenuDataType_Skill == self._curCategory then
    self:registSkill(realIndex, position)
  else
    if __eQuickMenuDataType_Item == self._curCategory then
      self:registItem(realIndex, position)
    else
      if __eQuickMenuDataType_Function == self._curCategory then
        self:registFunctionType(realIndex, position)
      end
    end
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.registItem = function(self, index, position)
  -- function num : 0_5
  if (self._inventoryData)[index] == nil then
    return 
  end
  local rv = ToClient_registQuickMenuItem(self._curState, self._curGroup, position, (CppEnums.ItemWhereType).eInventory, ((self._inventoryData)[index])._slotNo)
  if rv == true then
    local control = ((self._ui)._buttonPositionIcon)[position + 1]
    control:ChangeTextureInfoName(((self._inventoryData)[index])._icon)
    ;
    (control:getBaseTexture()):setUV(0, 0, 1, 1)
    control:setRenderTexture(control:getBaseTexture())
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.registSkill = function(self, index, position)
  -- function num : 0_6
  if (self._skillData)[index] == nil then
    return 
  end
  local rv = ToClient_registQuickMenuSkill(self._curState, self._curGroup, position, ((self._skillData)[index])._skillKey)
  if rv == true then
    local control = ((self._ui)._buttonPositionIcon)[position + 1]
    control:ChangeTextureInfoName(((self._skillData)[index])._icon)
    ;
    (control:getBaseTexture()):setUV(0, 0, 1, 1)
    control:setRenderTexture(control:getBaseTexture())
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.registFunctionType = function(self, index, position)
  -- function num : 0_7
  if (self._functionTypeData)[index] == nil then
    return 
  end
  local rv = ToClient_registQuickMenuFunctionType(self._curState, self._curGroup, position, ((self._functionTypeData)[index])._enumType)
  if rv == true then
    local data = (self._functionTypeData)[index]
    local control = ((self._ui)._buttonPositionIcon)[position + 1]
    control:ChangeTextureInfoName((data._icon)._path)
    ;
    (control:getBaseTexture()):setUV(setTextureUV_Func(control, (data._icon)._x1, (data._icon)._y1, (data._icon)._x2, (data._icon)._y2))
    control:setRenderTexture(control:getBaseTexture())
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.CustomSettingSetCategory = function(self, category)
  -- function num : 0_8
  self._curPage = 1
  self._curCategory = category
  self:CustomSettingUpdateCurrentPage()
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.CustomSettingNextPage = function(self)
  -- function num : 0_9
  -- DECOMPILER ERROR at PC11: Unhandled construct in 'MakeBoolean' P1

  if __eQuickMenuDataType_Skill == self._curCategory and #self._skillData < self._listMaxCount * self._curPage then
    return 
  end
  -- DECOMPILER ERROR at PC24: Unhandled construct in 'MakeBoolean' P1

  if __eQuickMenuDataType_Item == self._curCategory and #self._inventoryData < self._listMaxCount * self._curPage then
    return 
  end
  if __eQuickMenuDataType_Function == self._curCategory and #self._functionTypeData < self._listMaxCount * self._curPage then
    return 
  end
  self._curPage = self._curPage + 1
  self:CustomSettingUpdateCurrentPage()
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.CustomSettingPrevPage = function(self)
  -- function num : 0_10
  if self._curPage > 1 then
    self._curPage = self._curPage - 1
  end
  self:CustomSettingUpdateCurrentPage()
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.CustomSettingUpdateCurrentPage = function(self)
  -- function num : 0_11
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
    else
      do
        do
          local control = ((self._ui)._staticIcon)[ii]
          control:ChangeTextureInfoName("")
          ;
          (((self._ui)._staticTextName)[ii]):SetText("없음.")
          -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC118: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.CustomSettingDataUpdate = function(self)
  -- function num : 0_12
  self:getInventToryData()
  self:getSkillData()
  self:getFunctionTypeData()
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.getFunctionTypeData = function(self)
  -- function num : 0_13
  self._functionTypeData = {}
  if self._functionTypeList == nil or (self._functionTypeList)._icon == nil or ((self._functionTypeList)._icon)[__eQuickMenuDataType_Function] == nil or (self._functionTypeList)._name == nil or ((self._functionTypeList)._name)[__eQuickMenuDataType_Function] == nil then
    return 
  end
  for index = 0, __eQuickMenuFunctionType_Undefined do
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R5 in 'UnsetPending'

    (self._functionTypeData)[#self._functionTypeData + 1] = {_enumType = index, _name = (((self._functionTypeList)._name)[__eQuickMenuDataType_Function])[index], _icon = (((self._functionTypeList)._icon)[__eQuickMenuDataType_Function])[index]}
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.getInventToryData = function(self)
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

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.getSkillData = function(self)
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
  self:getSkillCellTableData(cellTable)
  cellTable = getAwakeningWeaponSkillTree(classType)
  if cellTable == nil then
    return 
  end
  self:getSkillCellTableData(cellTable)
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.getSkillCellTableData = function(self, cellTable)
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
          -- DECOMPILER ERROR at PC66: Confused about usage of register: R18 in 'UnsetPending'

          if skillLevelInfo ~= nil and skillLevelInfo._usable == true then
            (self._skillData)[#self._skillData + 1] = {_skillKey = (skillLevelInfo._skillKey):get(), _skillNo = skillNo, _name = skillTypeStaticWrapper:getName(), _icon = "Icon/" .. skillTypeStaticWrapper:getIconPath()}
          end
        end
      end
    end
  end
end

FGlobal_ConsoleQuickMenuCustomSetting_Update = function(position)
  -- function num : 0_17
  if __eQuickMenuStickPosition_Count <= position then
    for ii = 1, __eQuickMenuStickPosition_Count do
      (((PaGlobal_ConsoleQuickMenuSetting._ui)._buttonPosition)[ii]):SetMonoTone(false)
      ;
      (((PaGlobal_ConsoleQuickMenuSetting._ui)._buttonPosition)[ii]):SetCheck(false)
    end
  else
    do
      for ii = 1, __eQuickMenuStickPosition_Count do
        (((PaGlobal_ConsoleQuickMenuSetting._ui)._buttonPosition)[ii]):SetMonoTone(true)
        ;
        (((PaGlobal_ConsoleQuickMenuSetting._ui)._buttonPosition)[ii]):SetCheck(false)
      end
      ;
      (((PaGlobal_ConsoleQuickMenuSetting._ui)._buttonPosition)[position + 1]):SetMonoTone(false)
      ;
      (((PaGlobal_ConsoleQuickMenuSetting._ui)._buttonPosition)[position + 1]):SetCheck(true)
    end
  end
end

FGlobal_ConsoleQuickMenuCustom_IsShow = function()
  -- function num : 0_18
  return Panel_QuickMenuCustom:GetShow()
end

FromClient_ConsoleQuickMenu_OpenCustomPage = function(currentSettingState, currentSettingGroup, isUpdate)
  -- function num : 0_19
  if currentSettingGroup < 0 or __eQuickMenuDpadGroup_Count <= currentSettingGroup then
    return 
  end
  FromClient_ConsoleQuickMenu_Quit()
  Panel_QuickMenuCustom:SetShow(true)
  local self = PaGlobal_ConsoleQuickMenuSetting
  self:CustomSettingDataUpdate()
  self:CustomSettingUpdateCurrentPage()
  self._curPosition = 1
  self._curGroup = currentSettingGroup
  self._curState = currentSettingState
  self:CustomCrossTextureChange(currentSettingGroup)
  if isUpdate == nil then
    self:clearRegistCustomSetting()
  end
  self:SetUICusttomSettingCurrentGroup(currentSettingState, currentSettingGroup)
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.SetUICusttomSettingCurrentGroup = function(self, state, group)
  -- function num : 0_20
  local groupInfo = PaGlobal_ConsoleQuickMenu:GetCurrentGroupInfo(state, group)
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

-- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.CustomCrossTextureChange = function(self, currentGroup)
  -- function num : 0_21
  local crossControl = (self._ui)._customCrossDeco
  local iconPathData1 = ((PaGlobal_ConsoleQuickMenu._textureIcon)._bottom)[currentGroup]
  crossControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  ;
  (crossControl:getBaseTexture()):setUV(setTextureUV_Func(crossControl, iconPathData1._x1, iconPathData1._y1, iconPathData1._x2, iconPathData1._y2))
  crossControl:setRenderTexture(crossControl:getBaseTexture())
  local centerControl = (self._ui)._customCenterDeco
  local iconPathData2 = ((PaGlobal_ConsoleQuickMenu._textureIcon)._center)[currentGroup]
  centerControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  ;
  (centerControl:getBaseTexture()):setUV(setTextureUV_Func(centerControl, iconPathData2._x1, iconPathData2._y1, iconPathData2._x2, iconPathData2._y2))
  centerControl:setRenderTexture(centerControl:getBaseTexture())
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenuSetting.setPosition = function(self, index)
  -- function num : 0_22
  self._curPosition = index
end

FGlobal_ConsoleQuickMenuSetting_UpdatePage = function()
  -- function num : 0_23
  if isPadUp(__eJoyPadInputType_RightTrigger) then
    PaGlobal_ConsoleQuickMenuSetting:CustomSettingNextPage()
  end
  if isPadUp(__eJoyPadInputType_LeftTrigger) then
    PaGlobal_ConsoleQuickMenuSetting:CustomSettingPrevPage()
  end
  if isPadUp(__eJoyPadInputType_X) then
    Panel_QuickMenuCustom:SetShow(false)
  end
end

FGlobal_ConsoleQuickMenuSetting_RegistMode = function()
  -- function num : 0_24
  local self = PaGlobal_ConsoleQuickMenuSetting
  local changeGroup = ToClient_checkQuickMenuCurrentGroup()
  local registPosition = ToClient_checkQuickMenuCurrentPosition()
  -- DECOMPILER ERROR at PC16: Unhandled construct in 'MakeBoolean' P1

  if __eQuickMenuStickPosition_Count == registPosition and __eQuickMenuStickPosition_Count ~= (self._registMode)._stickPosition then
    self:quitRegistQuickMenu((self._registMode)._stickPosition)
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._registMode)._stickPosition = registPosition
  FGlobal_ConsoleQuickMenuCustomSetting_Update(registPosition)
  FromClient_ConsoleQuickMenu_OpenCustomPage(self._curState, changeGroup)
  if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_Dash) then
    local state = ToClient_getNextPageQuickMenuSetting()
    FromClient_ConsoleQuickMenu_OpenCustomPage(state, self._curGroup)
  end
end

Panel_QuickMenuCustom:RegisterUpdateFunc("FGlobal_ConsoleQuickMenuSetting_UpdatePage")
registerEvent("FromClient_ConsoleQuickMenu_OpenCustomPage", "FromClient_ConsoleQuickMenu_OpenCustomPage")

