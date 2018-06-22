PaGlobal_ConsoleQuickMenu = {
  _inventoryData = {},
  _skillData = {},
  _functionTypeData = {},
  _ui = {
    _quickMenuPosition = {},
    _quickMenuPositionIcon = {},
    _staticTextIconName = UI.getChildControl(Panel_QuickMenu, "StaticText_SelectedButtonTitle"),
    _staticTextIconDesc = UI.getChildControl(Panel_QuickMenu, "StaticText_SelectedButtonDesc"),
    _centerDeco = UI.getChildControl(Panel_QuickMenu, "Static_CenterDeco"),
    _line = {},
    _rightMenuPanel = {}
  },
  _curGroup = 0,
  _center = {_x = 0, _y = 0},
  _isAnimating = false,
  _registMode = {
    _isStart = false,
    _stickPosition = __eQuickMenuStickPosition_Count,
    _index = -1
  },
  _textureIcon = {
    _center = {
      [0] = {
        _x1 = 623,
        _y1 = 399,
        _x2 = 933,
        _y2 = 709
      },
      [1] = {
        _x1 = 399,
        _y1 = 88,
        _x2 = 709,
        _y2 = 398
      },
      [2] = {
        _x1 = 1,
        _y1 = 399,
        _x2 = 311,
        _y2 = 709
      },
      [3] = {
        _x1 = 312,
        _y1 = 399,
        _x2 = 622,
        _y2 = 709
      }
    },
    _bottom = {
      [0] = {
        _x1 = 399,
        _y1 = 710,
        _x2 = 485,
        _y2 = 796
      },
      [1] = {
        _x1 = 399,
        _y1 = 797,
        _x2 = 485,
        _y2 = 883
      },
      [2] = {
        _x1 = 486,
        _y1 = 710,
        _x2 = 572,
        _y2 = 796
      },
      [3] = {
        _x1 = 486,
        _y1 = 797,
        _x2 = 572,
        _y2 = 883
      }
    }
  },
  _maxMenuTabType = 4
}
function PaGlobal_ConsoleQuickMenu:initializeUI()
  for ii = 0, __eQuickMenuStickPosition_Count do
    if __eQuickMenuStickPosition_QuickSlot == ii then
      break
    end
    self._ui._quickMenuPosition[ii] = UI.getChildControl(Panel_QuickMenu, "Button_Templete" .. tostring(ii))
    self._ui._quickMenuPositionIcon[ii] = UI.getChildControl(self._ui._quickMenuPosition[ii], "Static_Icon")
  end
  self._ui._center = UI.getChildControl(Panel_QuickMenu, "Static_CenterPoint")
  for ii = 0, __eQuickMenuStickPosition_Count do
    if __eQuickMenuStickPosition_QuickSlot == ii then
      break
    end
    self._ui._line[ii] = UI.getChildControl(self._ui._center, "Static_Line" .. ii)
    self._ui._line[ii]:SetShow(false)
  end
  self._ui._widget = {}
  for group = 0, __eQuickMenuDpadGroup_Count - 1 do
    local bg = UI.getChildControl(Panel_Widget_QuickMenu, "Static_Bg" .. tostring(group))
    self._ui._widget[group] = {}
    self._ui._widget[group]._pad = UI.getChildControl(bg, "Static_Pad")
    self._ui._widget[group]._slot = UI.getChildControl(bg, "Static_SlotBg")
    self._ui._widget[group]._selected = UI.getChildControl(bg, "Static_SelectedPad")
    self._ui._widget[group]._ring = UI.getChildControl(bg, "Static_Ring")
    self._ui._widget[group]._ringPosition = {}
    for position = 0, __eQuickMenuStickPosition_Count - 1 do
      if position == __eQuickMenuStickPosition_QuickSlot then
        break
      end
      self._ui._widget[group]._ringPosition[position] = UI.getChildControl(self._ui._widget[group]._ring, "Static_" .. tostring(position))
    end
  end
  self._ui._rightMenuPanel._stc_LeftBg = UI.getChildControl(Panel_QuickMenuCustom, "Static_LeftBg")
  self._ui._rightMenuPanel._txt_RingMenuDesc = UI.getChildControl(self._ui._rightMenuPanel._stc_LeftBg, "StaticText_RingMenuDesc")
  self._ui._rightMenuPanel._txt_RingMenuDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._rightMenuPanel._txt_RingMenuDesc:SetAutoResize(true)
  self._ui._rightMenuPanel._txt_RingMenuDesc:SetText(self._ui._rightMenuPanel._txt_RingMenuDesc:GetText())
  self._ui._rightMenuPanel._txt_QuickSlotDesc = UI.getChildControl(self._ui._rightMenuPanel._stc_LeftBg, "StaticText_QuickSlotDesc")
  self._ui._rightMenuPanel._txt_QuickSlotDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._rightMenuPanel._txt_QuickSlotDesc:SetAutoResize(true)
  self._ui._rightMenuPanel._txt_QuickSlotDesc:SetText(self._ui._rightMenuPanel._txt_QuickSlotDesc:GetText())
  self._ui._rightMenuPanel._txt_ChangeMenuDesc = UI.getChildControl(self._ui._rightMenuPanel._stc_LeftBg, "StaticText_ChangeMenuDesc")
  self._ui._rightMenuPanel._txt_ChangeMenuDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui._rightMenuPanel._txt_ChangeMenuDesc:SetAutoResize(true)
  self._ui._rightMenuPanel._txt_ChangeMenuDesc:SetText(self._ui._rightMenuPanel._txt_ChangeMenuDesc:GetText())
  self._ui._rightMenuPanel._stc_TabBg = UI.getChildControl(Panel_QuickMenuCustom, "Static_TabBg")
  self._ui._rightMenuPanel._btn_TabBtn = {}
  self._ui._rightMenuPanel._btn_TabBtn[__eQuickMenuDataType_Item] = UI.getChildControl(self._ui._rightMenuPanel._stc_TabBg, "RadioButton_Item")
  self._ui._rightMenuPanel._btn_TabBtn[__eQuickMenuDataType_Skill] = UI.getChildControl(self._ui._rightMenuPanel._stc_TabBg, "RadioButton_Skill")
  self._ui._rightMenuPanel._btn_TabBtn[__eQuickMenuDataType_Function] = UI.getChildControl(self._ui._rightMenuPanel._stc_TabBg, "RadioButton_Menu")
  self._ui._rightMenuPanel._btn_TabBtn[__eQuickMenuDataType_SocialAction] = UI.getChildControl(self._ui._rightMenuPanel._stc_TabBg, "RadioButton_Social")
end
function FGlobal_ConsoleQuickMenu_Update(position)
  if __eQuickMenuStickPosition_QuickSlot == position then
    return
  end
  local quickMenuPosition = PaGlobal_ConsoleQuickMenu._ui._quickMenuPosition
  if position >= __eQuickMenuStickPosition_Count then
    for ii = 0, __eQuickMenuStickPosition_Count do
      if nil ~= quickMenuPosition[ii] then
        quickMenuPosition[ii]:SetMonoTone(false)
        quickMenuPosition[ii]:SetCheck(false)
      end
    end
  else
    for ii = 0, __eQuickMenuStickPosition_Count do
      if nil ~= quickMenuPosition[ii] then
        quickMenuPosition[ii]:SetMonoTone(true)
        quickMenuPosition[ii]:SetCheck(false)
      end
    end
    quickMenuPosition[position]:SetMonoTone(false)
    quickMenuPosition[position]:SetCheck(true)
  end
  PaGlobal_ConsoleQuickMenu:setButtonPos(position)
  local name = PaGlobal_ConsoleQuickMenu:GetCurrentQuickMenuName(PaGlobal_ConsoleQuickMenu._curGroup, position)
  PaGlobal_ConsoleQuickMenu._ui._staticTextIconName:SetText(name)
  PaGlobal_ConsoleQuickMenu._ui._staticTextIconDesc:SetText("")
end
function PaGlobal_ConsoleQuickMenuCustom_HighlightCategory(category)
  self = PaGlobal_ConsoleQuickMenu
  for ii = 0, self._maxMenuTabType - 1 do
    self._ui._rightMenuPanel._btn_TabBtn[ii]:SetFontColor(Defines.Color.C_FF888888)
  end
  self._ui._rightMenuPanel._btn_TabBtn[category]:SetFontColor(Defines.Color.C_FFEEEEEE)
end
function PaGlobal_ConsoleQuickMenu:setButtonPos(selectedIndex)
  if self._isAnimating then
    return
  end
  self._center.x = self._ui._center:GetPosX()
  self._center.y = self._ui._center:GetPosY()
  local angle = 2 * math.pi / 8 * 5
  local angleOffset = 2 * math.pi / 8
  for index = 0, 7 do
    angle = angle + angleOffset
    if selectedIndex == index then
      local x = 205 * math.cos(angle)
      local y = 205 * math.sin(angle)
      self._ui._quickMenuPosition[index]:SetPosX(self._center.x + x - 47)
      self._ui._quickMenuPosition[index]:SetPosY(self._center.y + y - 47)
      self._ui._line[index]:SetShow(false)
    else
      local x = 185 * math.cos(angle)
      local y = 185 * math.sin(angle)
      self._ui._quickMenuPosition[index]:SetPosX(self._center.x + x - 47)
      self._ui._quickMenuPosition[index]:SetPosY(self._center.y + y - 47)
      self._ui._line[index]:SetShow(false)
    end
  end
end
function PaGlobal_ConsoleQuickMenu:moveButtonAni(currentPosition)
  if __eQuickMenuStickPosition_QuickSlot == currentPosition then
    return
  end
  if nil == currentPosition or currentPosition < 0 or currentPosition >= __eQuickMenuStickPosition_Count or __eQuickMenuStickPosition_QuickSlot == currentPosition then
    return
  end
  local control = self._ui._quickMenuPosition[currentPosition]
  local buttonMoveAni = control:addMoveAnimation(0, 0.1, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  buttonMoveAni:SetStartPosition(control:GetPosX(), control:GetPosY())
  buttonMoveAni:SetEndPosition(self._center.x - 47, self._center.y - 47)
  buttonMoveAni.IsChangeChild = true
  control:CalcUIAniPos(buttonMoveAni)
  buttonMoveAni:SetDisableWhileAni(true)
  for index, value in pairs(self._ui._line) do
    value:SetShow(false)
  end
  self._isAnimating = true
end
function PaGlobal_ConsoleQuickMenu:clearButtonAni()
  for index, value in pairs(self._ui._quickMenuPosition) do
    value:ResetAndClearVertexAni()
  end
end
function QuickMenu_ShowAni()
  UIAni.AlphaAnimation(1, Panel_QuickMenu, 0, 0.1)
  local aniInfo1 = Panel_QuickMenu:addScaleAnimation(0, 0.1, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.9)
  aniInfo1:SetEndScale(1)
  aniInfo1.AxisX = Panel_QuickMenu:GetSizeX() / 2
  aniInfo1.AxisY = Panel_QuickMenu:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
end
function QuickMenu_HideAni()
  local aniInfo = UIAni.AlphaAnimation(0, Panel_QuickMenu, 0.1, 0.2)
  aniInfo:SetHideAtEnd(true)
end
function FGlobal_ConsoleQuickMenu_IsShow()
  return Panel_QuickMenu:GetShow()
end
function FGlobal_ConsoleQuickMenuCustom_IsShow()
  return Panel_QuickMenuCustom:GetShow()
end
function PaGlobal_ConsoleQuickMenu:Open(currentGroup)
  if currentGroup < 0 or currentGroup >= __eQuickMenuDpadGroup_Count then
    return
  end
  if true == Panel_QuickMenuCustom:GetShow() then
    return
  end
  self._curGroup = currentGroup
  self:SetUICurrentGroup(currentGroup)
  self._isAnimating = false
  PaGlobal_ConsoleQuickMenu:clearButtonAni()
  self:setButtonPos(__eQuickMenuStickPosition_Count)
  self:CrossTextureChange(currentGroup)
  Panel_QuickMenu:SetShow(true, true)
end
function FromClient_ConsoleQuickMenu_Close(currentPosition)
  PaGlobal_ConsoleQuickMenu:moveButtonAni(currentPosition)
  Panel_QuickMenu:SetShow(false, false)
end
function PaGlobal_ConsoleQuickMenu:SetUICurrentGroup(group)
  local groupInfo = self:GetCurrentGroupInfo(group)
  for position, info in ipairs(groupInfo) do
    if nil == self._ui._quickMenuPositionIcon[position - 1] then
      return
    end
    local control = self._ui._quickMenuPositionIcon[position - 1]
    control:ChangeTextureInfoName(info._icon)
    if nil ~= info._uv then
      control:getBaseTexture():setUV(setTextureUV_Func(control, info._uv._x1, info._uv._y1, info._uv._x2, info._uv._y2))
    else
      control:getBaseTexture():setUV(0, 0, 1, 1)
    end
    control:setRenderTexture(control:getBaseTexture())
  end
end
function PaGlobal_ConsoleQuickMenu:GetPositionInfo(quickMenu)
  local name = ""
  local icon = ""
  local uv
  if __eQuickMenuDataType_Skill == quickMenu._type then
    local skillTypeStaticWrapper = getSkillTypeStaticStatus(quickMenu._skillKey:getSkillNo())
    if nil ~= skillTypeStaticWrapper then
      name = skillTypeStaticWrapper:getName()
      icon = "Icon/" .. skillTypeStaticWrapper:getIconPath()
    end
  elseif __eQuickMenuDataType_Item == quickMenu._type then
    local itemStaticStatusWrapper = getItemEnchantStaticStatus(quickMenu._itemKey)
    if nil ~= itemStaticStatusWrapper then
      name = itemStaticStatusWrapper:getName()
      icon = "Icon/" .. itemStaticStatusWrapper:getIconPath()
    end
  elseif __eQuickMenuDataType_Function == quickMenu._type then
    name = self._functionTypeList._name[__eQuickMenuDataType_Function][quickMenu._functionType]
    _PA_LOG("\237\155\132\236\167\132", " quickMenu._functionType " .. quickMenu._functionType)
    icon = self._functionTypeList._icon[__eQuickMenuDataType_Function][quickMenu._functionType]._path
    local iconUV = self._functionTypeList._icon[__eQuickMenuDataType_Function][quickMenu._functionType]
    uv = {
      _x1 = iconUV._x1,
      _y1 = iconUV._y1,
      _x2 = iconUV._x2,
      _y2 = iconUV._y2
    }
  elseif __eQuickMenuDataType_SocialAction == quickMenu._type then
    for ii = 0, ToClient_getSocialActionInfoList() - 1 do
      local socialActionInfo = ToClient_getSocialActionInfoByIndex(ii)
      local sASS = socialActionInfo:getStaticStatus()
      local socialKey = sASS:getKey()
      if socialKey == quickMenu._socialActionKey then
        name = sASS:getName()
        icon = "Icon/" .. sASS:getIconPath()
        break
      end
    end
  end
  return {
    _name = name,
    _icon = icon,
    _uv = uv,
    _type = quickMenu._type
  }
end
function PaGlobal_ConsoleQuickMenu:GetCurrentGroupInfo(group)
  if group < 0 or group >= __eQuickMenuDpadGroup_Count then
    return
  end
  local table = {}
  for position = 0, __eQuickMenuStickPosition_Count - 1 do
    if __eQuickMenuStickPosition_QuickSlot == position then
      break
    end
    local quickMenu = ToClient_getAtQuickMenu(group, position)
    if nil == quickMenu then
      return
    end
    table[#table + 1] = self:GetPositionInfo(quickMenu)
  end
  return table
end
function PaGlobal_ConsoleQuickMenu:GetCurrentQuickMenuName(group, position)
  if group < 0 or group >= __eQuickMenuDpadGroup_Count then
    return ""
  end
  local table = {}
  local quickMenu = ToClient_getAtQuickMenu(group, position)
  if nil == quickMenu then
    return ""
  end
  local name = ""
  if __eQuickMenuDataType_Skill == quickMenu._type then
    local skillTypeStaticWrapper = getSkillTypeStaticStatus(quickMenu._skillKey:getSkillNo())
    if nil ~= skillTypeStaticWrapper then
      name = skillTypeStaticWrapper:getName()
    end
  elseif __eQuickMenuDataType_Item == quickMenu._type then
    local itemStaticStatusWrapper = getItemEnchantStaticStatus(quickMenu._itemKey)
    if nil ~= itemStaticStatusWrapper then
      name = itemStaticStatusWrapper:getName()
    end
  elseif __eQuickMenuDataType_Function == quickMenu._type then
    name = self._functionTypeList._name[__eQuickMenuDataType_Function][quickMenu._functionType]
  end
  return name
end
function PaGlobal_ConsoleQuickMenu:setIcon(control, icon, uv)
  if nil == control then
    return
  end
  control:ChangeTextureInfoName(icon)
  if nil ~= uv then
    control:getBaseTexture():setUV(setTextureUV_Func(control, uv._x1, uv._y1, uv._x2, uv._y2))
  else
    control:getBaseTexture():setUV(0, 0, 1, 1)
  end
  control:setRenderTexture(control:getBaseTexture())
end
function PaGlobal_ConsoleQuickMenu:CrossTextureChange(currentGroup)
  local bottomControl = self._ui._staticTextIconName
  local iconPathData1 = self._textureIcon._bottom[currentGroup]
  bottomControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  bottomControl:getBaseTexture():setUV(setTextureUV_Func(bottomControl, iconPathData1._x1, iconPathData1._y1, iconPathData1._x2, iconPathData1._y2))
  bottomControl:setRenderTexture(bottomControl:getBaseTexture())
  local centerControl = self._ui._centerDeco
  local iconPathData2 = self._textureIcon._center[currentGroup]
  centerControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  centerControl:getBaseTexture():setUV(setTextureUV_Func(centerControl, iconPathData2._x1, iconPathData2._y1, iconPathData2._x2, iconPathData2._y2))
  centerControl:setRenderTexture(centerControl:getBaseTexture())
end
function PaGlobal_ConsoleQuickMenu:setWidget()
  for group = 0, __eQuickMenuDpadGroup_Count - 1 do
    local widget = self._ui._widget[group]
    if ToClient_isQuickMenuQuickMode(group) then
      widget._ring:SetShow(false)
      widget._slot:SetShow(true)
    else
      widget._ring:SetShow(true)
      widget._slot:SetShow(false)
    end
  end
  for group = 0, __eQuickMenuDpadGroup_Count - 1 do
    local widget = self._ui._widget[group]
    if ToClient_isQuickMenuQuickMode(group) then
      widget._ring:SetShow(false)
      widget._slot:SetShow(true)
      local quickSlot = ToClient_getAtQuickMenu(group, __eQuickMenuStickPosition_QuickSlot)
      local quickSlotInfo = self:GetPositionInfo(quickSlot)
      self:setIcon(widget._slot, quickSlotInfo._icon, quickSlotInfo._uv)
    else
      local groupInfo = self:GetCurrentGroupInfo(group)
      for index, info in ipairs(groupInfo) do
        widget._ringPosition[index - 1]:SetShow(__eQuickMenuDataType_Empty ~= info._type)
      end
    end
  end
end
function FromClient_ConsoleQuickMenu_luaLoadComplete()
  PaGlobal_ConsoleQuickMenu:initializeUI()
  PaGlobal_ConsoleQuickMenu:setDefaultSetting()
  PaGlobal_ConsoleQuickMenu:setWidget()
  Panel_Widget_QuickMenu:SetShow(true)
end
function FromClient_ConsoleQuickMenu_Open(group)
  PaGlobal_ConsoleQuickMenu:Open(group)
end
function FromClient_ConsoleQuickMenu_Execute(position)
end
function FromClient_ConsoleQuickMenu_Selecting(group, position)
  if position == __eQuickMenuStickPosition_QuickSlot then
    return
  end
  if __eQuickMenuStickPosition_Count == position then
    for ii = 0, __eQuickMenuStickPosition_Count do
      local control = PaGlobal_ConsoleQuickMenu._ui._quickMenuPosition[ii]
      if control == nil then
        break
      end
      control:SetMonoTone(false)
      control:SetCheck(false)
    end
  else
    for ii = 0, __eQuickMenuStickPosition_Count do
      local control = PaGlobal_ConsoleQuickMenu._ui._quickMenuPosition[ii]
      if control == nil then
        break
      end
      control:SetMonoTone(true)
      control:SetCheck(false)
    end
    PaGlobal_ConsoleQuickMenu._ui._quickMenuPosition[position]:SetMonoTone(false)
    PaGlobal_ConsoleQuickMenu._ui._quickMenuPosition[position]:SetCheck(true)
  end
end
Panel_QuickMenu:RegisterShowEventFunc(true, "QuickMenu_ShowAni()")
Panel_QuickMenu:RegisterShowEventFunc(false, "QuickMenu_HideAni()")
registerEvent("FromClient_luaLoadComplete", "FromClient_ConsoleQuickMenu_luaLoadComplete")
registerEvent("FromClient_ConsoleQuickMenu_OpenCustomPage", "FromClient_ConsoleQuickMenu_OpenCustomPage")
registerEvent("FromClient_ConsoleQuickMenu_Open", "FromClient_ConsoleQuickMenu_Open")
registerEvent("FromClient_ConsoleQuickMenu_Close", "FromClient_ConsoleQuickMenu_Close")
registerEvent("FromClient_ConsoleQuickMenu_Execute", "FromClient_ConsoleQuickMenu_Execute")
registerEvent("FromClient_ConsoleQuickMenu_Selecting", "FromClient_ConsoleQuickMenu_Selecting")