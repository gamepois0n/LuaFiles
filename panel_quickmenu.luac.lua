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
_quickMenuPosition = {}
, 
_quickMenuPositionIcon = {}
, _staticTextIconName = (UI.getChildControl)(Panel_QuickMenu, "StaticText_SelectedButtonTitle"), _staticTextIconDesc = (UI.getChildControl)(Panel_QuickMenu, "StaticText_SelectedButtonDesc"), _centerDeco = (UI.getChildControl)(Panel_QuickMenu, "Static_CenterDeco"), 
_line = {}
}
, _curGroup = 0, 
_center = {_x = 0, _y = 0}
, _isAnimating = false, 
_registMode = {_isStart = false, _stickPosition = __eQuickMenuStickPosition_Count, _index = -1}
, 
_textureIcon = {
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
-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.initializeUI = function(self)
  -- function num : 0_0
  for ii = 1, __eQuickMenuStickPosition_Count do
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._quickMenuPosition)[ii] = (UI.getChildControl)(Panel_QuickMenu, "Button_Templete" .. tostring(ii - 1))
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui)._quickMenuPositionIcon)[ii] = (UI.getChildControl)(((self._ui)._quickMenuPosition)[ii], "Static_Icon")
  end
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._center = (UI.getChildControl)(Panel_QuickMenu, "Static_CenterPoint")
  for ii = 1, __eQuickMenuStickPosition_Count do
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._line)[ii] = (UI.getChildControl)((self._ui)._center, "Static_Line" .. ii - 1)
    ;
    (((self._ui)._line)[ii]):SetShow(false)
  end
end

FGlobal_ConsoleQuickMenu_Update = function(position)
  -- function num : 0_1
  if __eQuickMenuStickPosition_Count <= position then
    for ii = 1, __eQuickMenuStickPosition_Count do
      (((PaGlobal_ConsoleQuickMenu._ui)._quickMenuPosition)[ii]):SetMonoTone(false)
      ;
      (((PaGlobal_ConsoleQuickMenu._ui)._quickMenuPosition)[ii]):SetCheck(false)
    end
  else
    do
      for ii = 1, __eQuickMenuStickPosition_Count do
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

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.setButtonPos = function(self, selectedIndex)
  -- function num : 0_2
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

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.moveButtonAni = function(self, currentPosition)
  -- function num : 0_3
  if currentPosition == nil or currentPosition < 0 or __eQuickMenuStickPosition_Count <= currentPosition then
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

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.clearButtonAni = function(self)
  -- function num : 0_4
  for index,value in pairs((self._ui)._quickMenuPosition) do
    value:ResetAndClearVertexAni()
  end
end

QuickMenu_ShowAni = function()
  -- function num : 0_5
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
  -- function num : 0_6
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_QuickMenu, 0.1, 0.2)
  aniInfo:SetHideAtEnd(true)
end

FGlobal_ConsoleQuickMenu_IsShow = function()
  -- function num : 0_7
  return Panel_QuickMenu:GetShow()
end

FGlobal_ConsoleQuickMenuCustom_IsShow = function()
  -- function num : 0_8
  return Panel_QuickMenuCustom:GetShow()
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.Open = function(self, currentGroup)
  -- function num : 0_9
  if currentGroup < 0 or __eQuickMenuDpadGroup_Count <= currentGroup then
    return 
  end
  if Panel_QuickMenuCustom:GetShow() == true then
    return 
  end
  self._curGroup = currentGroup
  self:SetUICurrentGroup(currentGroup)
  self._isAnimating = false
  PaGlobal_ConsoleQuickMenu:clearButtonAni()
  self:setButtonPos(__eQuickMenuStickPosition_Count + 1)
  self:CrossTextureChange(currentGroup)
  Panel_QuickMenu:SetShow(true, true)
end

FromClient_ConsoleQuickMenu_Close = function(currentPosition)
  -- function num : 0_10
  PaGlobal_ConsoleQuickMenu:moveButtonAni(currentPosition)
  Panel_QuickMenu:SetShow(false, false)
end

-- DECOMPILER ERROR at PC129: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.SetUICurrentGroup = function(self, group)
  -- function num : 0_11
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

-- DECOMPILER ERROR at PC132: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.GetCurrentGroupInfo = function(self, group)
  -- function num : 0_12
  if group < 0 or __eQuickMenuDpadGroup_Count <= group then
    return 
  end
  local table = {}
  for position = 0, __eQuickMenuStickPosition_Count - 1 do
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
              name = (((self._functionTypeList)._name)[__eQuickMenuDataType_Function])[quickMenu._functionType]
              icon = ((((self._functionTypeList)._icon)[__eQuickMenuDataType_Function])[quickMenu._functionType])._path
              local iconUV = (((self._functionTypeList)._icon)[__eQuickMenuDataType_Function])[quickMenu._functionType]
              uv = {_x1 = iconUV._x1, _y1 = iconUV._y1, _x2 = iconUV._x2, _y2 = iconUV._y2}
            else
              do
                if __eQuickMenuDataType_SocialAction == quickMenu._type then
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
                do
                  do
                    table[#table + 1] = {_name = name, _icon = icon, _uv = uv}
                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC128: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return table
end

-- DECOMPILER ERROR at PC135: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.GetCurrentQuickMenuName = function(self, group, position)
  -- function num : 0_13
  if group < 0 or __eQuickMenuDpadGroup_Count <= group then
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
            name = (((self._functionTypeList)._name)[__eQuickMenuDataType_Function])[quickMenu._functionType]
          end
          return name
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.CrossTextureChange = function(self, currentGroup)
  -- function num : 0_14
  local bottomControl = (self._ui)._staticTextIconName
  local iconPathData1 = ((self._textureIcon)._bottom)[currentGroup]
  bottomControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  ;
  (bottomControl:getBaseTexture()):setUV(setTextureUV_Func(bottomControl, iconPathData1._x1, iconPathData1._y1, iconPathData1._x2, iconPathData1._y2))
  bottomControl:setRenderTexture(bottomControl:getBaseTexture())
  local centerControl = (self._ui)._centerDeco
  local iconPathData2 = ((self._textureIcon)._center)[currentGroup]
  centerControl:ChangeTextureInfoName("Renewal/Function/Console_Function_RingMenu.dds")
  ;
  (centerControl:getBaseTexture()):setUV(setTextureUV_Func(centerControl, iconPathData2._x1, iconPathData2._y1, iconPathData2._x2, iconPathData2._y2))
  centerControl:setRenderTexture(centerControl:getBaseTexture())
end

FromClient_ConsoleQuickMenu_luaLoadComplete = function()
  -- function num : 0_15
  PaGlobal_ConsoleQuickMenu:initializeUI()
  PaGlobal_ConsoleQuickMenuSetting:initializeUI()
  PaGlobal_ConsoleQuickMenu:setDefaultSetting()
end

FromClient_ConsoleQuickMenu_Open = function(group)
  -- function num : 0_16
  do return  end
  PaGlobal_ConsoleQuickMenu:Open(group)
end

FromClient_ConsoleQuickMenu_Execute = function()
  -- function num : 0_17
end

FromClient_ConsoleQuickMenu_Selecting = function()
  -- function num : 0_18
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleQuickMenu.setDefaultSetting = function(self)
  -- function num : 0_19
  for ii = 0, ToClient_getSocialActionInfoList() - 1 do
    local socialActionInfo = ToClient_getSocialActionInfoByIndex(ii)
    local sASS = socialActionInfo:getStaticStatus()
    local socialKey = sASS:getKey()
  end
  if (ii >= 32 or ii < 64) then
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

