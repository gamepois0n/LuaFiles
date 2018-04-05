-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\equipment\panel_equiment_seteffecttooltip.luac 

-- params : ...
-- function num : 0
Panel_Equipment_SetEffectTooltip:SetShow(false, false)
Panel_Equipment_SetEffectTooltip:ActiveMouseEventEffect(true)
Panel_Equipment_SetEffectTooltip:setMaskingChild(true)
Panel_Equipment_SetEffectTooltip:setGlassBackground(true)
Panel_Equipment_SetEffectTooltip:RegisterShowEventFunc(true, "EquipmentEffectTooltip_ShowAni()")
Panel_Equipment_SetEffectTooltip:RegisterShowEventFunc(false, "EquipmentEffectTooltip_HideAni()")
PaGlobal_EquipmentTooltip = {
_ui = {_Title = (UI.getChildControl)(Panel_Equipment_SetEffectTooltip, "StaticText_Title"), _NoEffect = (UI.getChildControl)(Panel_Equipment_SetEffectTooltip, "StaticText_NoEffect"), _BaseGroupTitle = (UI.getChildControl)(Panel_Equipment_SetEffectTooltip, "StaticText_EffectGroupTitle"), _BasePartTitle = (UI.getChildControl)(Panel_Equipment_SetEffectTooltip, "StaticText_EffectPartTitle"), _BaseSetDesc = (UI.getChildControl)(Panel_Equipment_SetEffectTooltip, "StaticText_EffectDesc"), _Desc = (UI.getChildControl)(Panel_Equipment_SetEffectTooltip, "StaticText_Desc"), 
_GroupTitle = {}
, 
_PartTitle = {}
, 
_PartDesc = {}
, _usingGroupTitleCount = 0, _usingPartTitleCount = 0, _usingPartDescCount = 0}
, _maxSetEffectCount = 10, _isDetail = false, _panel = Panel_Equipment_SetEffectTooltip, 
_info = {}
}
EquipmentEffectTooltip_ShowAni = function()
  -- function num : 0_0
end

EquipmentEffectTooltip_HideAni = function()
  -- function num : 0_1
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.createAllGroupTitleUI = function(self)
  -- function num : 0_2
  for index = 0, self._maxSetEffectCount - 1 do
    local controlName = "GroupTitle_" .. index
    local control = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, self._panel, controlName)
    CopyBaseProperty((self._ui)._BaseGroupTitle, control)
    control:SetShow(false)
    ;
    (table.insert)((self._ui)._GroupTitle, control)
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.useGroupTitleUI = function(self)
  -- function num : 0_3
  if #(self._ui)._GroupTitle <= (self._ui)._usingGroupTitleCount then
    return 
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._usingGroupTitleCount = (self._ui)._usingGroupTitleCount + 1
  return ((self._ui)._GroupTitle)[(self._ui)._usingGroupTitleCount]
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.createPartTitleUI = function(self)
  -- function num : 0_4
  local control = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, self._panel, "PartTitle_" .. #(self._ui)._PartTitle)
  CopyBaseProperty((self._ui)._BasePartTitle, control)
  control:SetShow(false)
  control:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (table.insert)((self._ui)._PartTitle, control)
end

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.usePartTitleUI = function(self)
  -- function num : 0_5
  if #(self._ui)._PartTitle <= (self._ui)._usingPartTitleCount then
    self:createPartTitleUI()
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._usingPartTitleCount = (self._ui)._usingPartTitleCount + 1
  return ((self._ui)._PartTitle)[(self._ui)._usingPartTitleCount]
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.createPartDescUI = function(self)
  -- function num : 0_6
  local control = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, self._panel, "PartDesc_" .. #(self._ui)._PartDesc)
  CopyBaseProperty((self._ui)._BaseSetDesc, control)
  control:SetShow(false)
  control:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (table.insert)((self._ui)._PartDesc, control)
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.usePartDescUI = function(self)
  -- function num : 0_7
  if #(self._ui)._PartDesc <= (self._ui)._usingPartDescCount then
    self:createPartDescUI()
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._usingPartDescCount = (self._ui)._usingPartDescCount + 1
  return ((self._ui)._PartDesc)[(self._ui)._usingPartDescCount]
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.SetPos = function(self)
  -- function num : 0_8
  local posX = Panel_Equipment:GetPosX() - (self._panel):GetSizeX()
  if posX < 0 then
    posX = Panel_Equipment:GetPosX() + Panel_Equipment:GetSizeX()
  end
  local posY = Panel_Equipment:GetPosY() + Panel_Equipment:GetSizeY() - (self._panel):GetSizeY() - 10
  if posY < 0 then
    posY = 0
  else
    if getScreenSizeY() < posY + (self._panel):GetSizeY() then
      posY = getScreenSizeY() - (self._panel):GetSizeY()
    end
  end
  ;
  (self._panel):SetPosX(posX)
  ;
  (self._panel):SetPosY(posY)
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.initWithIcon = function(self, icon)
  -- function num : 0_9
  if not icon then
    return false
  end
  icon:addInputEvent("Mouse_On", "PaGlobal_EquipmentTooltip:show(true)")
  icon:addInputEvent("Mouse_Out", "PaGlobal_EquipmentTooltip:show(false)")
  icon:addInputEvent("Mouse_LUp", "PaGlobal_EquipmentTooltip:toggleDetail()")
  return true
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.show = function(self, showFlag)
  -- function num : 0_10
  if (self._panel):GetShow() == showFlag then
    return false
  end
  ;
  (self._panel):SetShow(showFlag, showFlag)
  if showFlag then
    self._isDetail = false
    self:updateInfo()
    self:updateUI()
  end
  return true
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.updateInfo = function(self)
  -- function num : 0_11
  self._info = {}
  local sortedInfoList = ToClient_GetSkillPieceInfo()
  if not sortedInfoList then
    return false
  end
  _getInfoBySkillNo = function(skillNo)
    -- function num : 0_11_0 , upvalues : self
    for _,info in ipairs(self._info) do
      if info.skillNo == skillNo then
        return info
      end
    end
  end

  for i = 0, #sortedInfoList do
    local skillNo = (sortedInfoList[i]):getSkillNo()
    local info = _getInfoBySkillNo(skillNo)
    if not info then
      (table.insert)(self._info, {skillNo = skillNo, groupTitle = (sortedInfoList[i]):getGroupTitle(), 
pointInfo = {}
, appliedPoint = 0})
      info = _getInfoBySkillNo(skillNo)
    end
    local isApplied = (sortedInfoList[i]):getApply()
    local point = (sortedInfoList[i]):getPoint()
    ;
    (table.insert)(info.pointInfo, {point = point, descTitle = (sortedInfoList[i]):getDescTitle(), desc = (sortedInfoList[i]):getDesc(), isApplied = isApplied})
    if isApplied and info.appliedPoint < point then
      info.appliedPoint = point
    end
  end
  return true
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.initUI = function(self)
  -- function num : 0_12
  _hideAll = function(uiTable)
    -- function num : 0_12_0
    for _,control in ipairs(uiTable) do
      control:SetShow(false)
    end
  end

  _hideAll((self._ui)._GroupTitle)
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._usingGroupTitleCount = 0
  _hideAll((self._ui)._PartTitle)
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._usingPartTitleCount = 0
  _hideAll((self._ui)._PartDesc)
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._usingPartDescCount = 0
  ;
  ((self._ui)._NoEffect):SetShow(false)
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.updateInfoUI = function(self)
  -- function num : 0_13
  local prevControl = nil
  for _,skillInfo in ipairs(self._info) do
    if skillInfo.appliedPoint > 0 or self._isDetail then
      local groupTitle = self:useGroupTitleUI()
      groupTitle:SetText(skillInfo.groupTitle)
      groupTitle:SetShow(true)
      if prevControl then
        groupTitle:SetPosY(prevControl:GetPosY() + prevControl:GetTextSizeY() + 15)
      else
        groupTitle:SetPosY(35)
      end
      prevControl = groupTitle
      local reservedpartTitlePrevControl = prevControl
      for _,pointInfo in ipairs(skillInfo.pointInfo) do
        if (skillInfo.appliedPoint <= pointInfo.point and pointInfo.isApplied) or self._isDetail then
          local partTitle = self:usePartTitleUI()
          partTitle:SetText(pointInfo.descTitle)
          local partTitlePrevControl = nil
          if self._isDetail then
            partTitlePrevControl = prevControl
          else
            partTitlePrevControl = reservedpartTitlePrevControl
          end
          partTitle:SetPosY(partTitlePrevControl:GetPosY() + partTitlePrevControl:GetTextSizeY() + 7)
          partTitle:SetShow(true)
        end
        do
          do
            if pointInfo.isApplied or self._isDetail then
              local partDesc = self:usePartDescUI()
              if pointInfo.isApplied then
                partDesc:SetFontColor((Defines.Color).C_FF96D4FC)
              else
                partDesc:SetFontColor((Defines.Color).C_FFC4BEBE)
              end
              partDesc:SetText(pointInfo.desc)
              partDesc:SetPosY(prevControl:GetPosY() + prevControl:GetTextSizeY() + 7)
              partDesc:SetShow(true)
              prevControl = partDesc
            end
            -- DECOMPILER ERROR at PC108: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
  end
  return prevControl
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.updateUI = function(self)
  -- function num : 0_14
  _PA_LOG("cylee", "updateUI()")
  self:initUI()
  local prevControl = self:updateInfoUI()
  if prevControl then
    local sizeY = prevControl:GetPosY() + prevControl:GetTextSizeY() + 15 + ((self._ui)._Desc):GetTextSizeY()
    ;
    (self._panel):SetSize((self._panel):GetSizeX(), sizeY)
  else
    do
      ;
      ((self._ui)._NoEffect):SetShow(true)
      ;
      (self._panel):SetSize((self._panel):GetSizeX(), 200)
      ;
      ((self._ui)._Desc):SetShow(true)
      if not prevControl or self._isDetail then
        ((self._ui)._Title):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_EQUIPMENT_SETEFFECTDETAIL_TITLE"))
      else
        ;
        ((self._ui)._Title):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_EQUIPMENT_SETEFFECT_TITLE"))
      end
      ;
      ((self._ui)._Desc):ComputePos()
      self:SetPos()
    end
  end
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_EquipmentTooltip.toggleDetail = function(self)
  -- function num : 0_15
  self._isDetail = not self._isDetail
  self:updateUI()
end

FGlobal_EquipmentTooltip_Init = function()
  -- function num : 0_16
  self = PaGlobal_EquipmentTooltip
  self:createAllGroupTitleUI()
  ;
  ((self._ui)._NoEffect):SetShow(false)
  ;
  ((self._ui)._BaseGroupTitle):SetShow(false)
  ;
  ((self._ui)._BasePartTitle):SetShow(false)
  ;
  ((self._ui)._BaseSetDesc):SetShow(false)
  ;
  ((self._ui)._Desc):SetShow(false)
  ;
  ((self._ui)._Desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._Desc):SetText(((self._ui)._Desc):GetText())
end

registerEvent("FromClient_luaLoadComplete", "FGlobal_EquipmentTooltip_Init()")

