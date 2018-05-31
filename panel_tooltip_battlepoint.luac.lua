-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\tooltip\panel_tooltip_battlepoint.luac 

-- params : ...
-- function num : 0
PaGlobal_Tooltip_BattlePoint = {
_ui = {_staticBG_TierTotal = (UI.getChildControl)(Panel_Tooltip_BattlePoint, "Static_TierTotal"), _staticBG_CurrentTier = (UI.getChildControl)(Panel_Tooltip_BattlePoint, "Static_CurrentTierBg"), _staticBG_BonusStat = (UI.getChildControl)(Panel_Tooltip_BattlePoint, "Static_BonusStatBg"), _staticText_Desc = (UI.getChildControl)(Panel_Tooltip_BattlePoint, "StaticText_Desc")}
, _panel = Panel_Tooltip_BattlePoint, _isDetail = false, _icon = nil}
local CT = CppEnums.ClassType
local awakenWeapon = {[CT.ClassType_Warrior] = ToClient_IsContentsGroupOpen("901"), [CT.ClassType_Ranger] = ToClient_IsContentsGroupOpen("902"), [CT.ClassType_Sorcerer] = ToClient_IsContentsGroupOpen("903"), [CT.ClassType_Giant] = ToClient_IsContentsGroupOpen("904"), [CT.ClassType_Tamer] = ToClient_IsContentsGroupOpen("905"), [CT.ClassType_BladeMaster] = ToClient_IsContentsGroupOpen("906"), [CT.ClassType_BladeMasterWomen] = ToClient_IsContentsGroupOpen("907"), [CT.ClassType_Valkyrie] = ToClient_IsContentsGroupOpen("908"), [CT.ClassType_Wizard] = ToClient_IsContentsGroupOpen("909"), [CT.ClassType_WizardWomen] = ToClient_IsContentsGroupOpen("910"), [CT.ClassType_NinjaMan] = ToClient_IsContentsGroupOpen("911"), [CT.ClassType_NinjaWomen] = ToClient_IsContentsGroupOpen("912"), [CT.ClassType_DarkElf] = ToClient_IsContentsGroupOpen("913"), [CT.ClassType_Combattant] = ToClient_IsContentsGroupOpen("914"), [CT.ClassType_CombattantWomen] = ToClient_IsContentsGroupOpen("918"), [CT.ClassType_Lahn] = ToClient_IsContentsGroupOpen("916"), [CT.ClassType_Orange] = ToClient_IsContentsGroupOpen("943")}
local classType = (getSelfPlayer()):getClassType()
local awakenWeaponContentsOpen = awakenWeapon[classType]
local alignCurrentTierBg = function(currentTierBg, targetControl)
  -- function num : 0_0
  currentTierBg:SetPosX(targetControl:GetPosX())
  local posY = (targetControl:GetSizeY() - currentTierBg:GetSizeY()) * 0.5
  currentTierBg:SetPosY(targetControl:GetPosY() + posY)
end

local setTierIcon = function(iconControl, textureName, iconIdx, leftX, topY, xCount, iconSize)
  -- function num : 0_1
  iconControl:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Etc_04.dds")
  iconControl:SetShow(true)
  local x1, y1, x2, y2 = nil, nil, nil, nil
  x1 = leftX + (iconSize + 1) * (iconIdx % xCount)
  y1 = topY + (iconSize + 1) * (math.floor)(iconIdx / xCount)
  x2 = x1 + iconSize
  y2 = y1 + iconSize
  x1 = setTextureUV_Func(iconControl, x1, y1, x2, y2)
  ;
  (iconControl:getBaseTexture()):setUV(x1, y1, x2, y2)
  iconControl:setRenderTexture(iconControl:getBaseTexture())
end

-- DECOMPILER ERROR at PC129: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_Tooltip_BattlePoint.initWithIcon = function(self, icon)
  -- function num : 0_2
  if not icon then
    return false
  end
  icon:addInputEvent("Mouse_On", "PaGlobal_Tooltip_BattlePoint:show(true)")
  icon:addInputEvent("Mouse_Out", "PaGlobal_Tooltip_BattlePoint:show(false)")
  icon:addInputEvent("Mouse_LUp", "PaGlobal_Tooltip_BattlePoint:toggleDetail()")
  self._icon = icon
  return true
end

-- DECOMPILER ERROR at PC132: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_Tooltip_BattlePoint.SetPos = function(self)
  -- function num : 0_3
  if _ContentsGroup_RenewUI == true then
    return 
  end
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

-- DECOMPILER ERROR at PC135: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_Tooltip_BattlePoint.updateUIPos = function(self)
  -- function num : 0_4
  if self._isDetail then
    ((self._ui)._staticBG_TierTotal):SetShow(true)
    ;
    ((self._ui)._staticBG_CurrentTier):SetShow(true)
    ;
    ((self._ui)._staticBG_BonusStat):SetShow(true)
    ;
    ((self._ui)._staticText_Desc):SetShow(false)
    ;
    (self._icon):addInputEvent("Mouse_Out", "PaGlobal_Tooltip_BattlePoint:show(true)")
  else
    ;
    ((self._ui)._staticBG_TierTotal):SetShow(false)
    ;
    ((self._ui)._staticBG_CurrentTier):SetShow(true)
    ;
    ((self._ui)._staticBG_BonusStat):SetShow(true)
    ;
    ((self._ui)._staticText_Desc):SetShow(true)
    ;
    (self._icon):addInputEvent("Mouse_Out", "PaGlobal_Tooltip_BattlePoint:show(false)")
  end
  local posY = 40
  local sizeY = 0
  if ((self._ui)._staticBG_TierTotal):GetShow() == true then
    ((self._ui)._staticBG_TierTotal):SetPosY(posY)
    sizeY = ((self._ui)._staticBG_TierTotal):GetSizeY()
    posY = posY + sizeY + 10
  end
  if ((self._ui)._staticBG_CurrentTier):GetShow() == true then
    ((self._ui)._staticBG_CurrentTier):SetPosY(posY)
    sizeY = ((self._ui)._staticBG_CurrentTier):GetSizeY()
    posY = posY + sizeY + 5
  end
  if ((self._ui)._staticBG_BonusStat):GetShow() == true then
    ((self._ui)._staticBG_BonusStat):SetPosY(posY)
    sizeY = ((self._ui)._staticBG_BonusStat):GetSizeY()
    posY = posY + sizeY + 5
  end
  if ((self._ui)._staticText_Desc):GetShow() == true then
    ((self._ui)._staticText_Desc):SetPosY(posY)
    sizeY = ((self._ui)._staticText_Desc):GetSizeY()
    posY = posY + sizeY
  end
  ;
  (self._panel):SetSize((self._panel):GetSizeX(), posY + 10)
  self:SetPos()
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_Tooltip_BattlePoint.updateData = function(self)
  -- function num : 0_5
  local ui = PaGlobal_Tooltip_BattlePoint._ui
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local totalStat = (math.floor)((selfPlayer:get()):getTotalStatValue())
  local offenceValue = ToClient_getOffence()
  local defenceValue = ToClient_getDefence()
  local awakenOffenceValue = ToClient_getAwakenOffence()
  local addedOffence = ToClient_GetAddedOffenceFromStat(totalStat) + ToClient_GetDDBonus(offenceValue)
  local addedAwakenOffence = ToClient_GetAddedOffenceFromStat(totalStat) + ToClient_GetDDBonus(awakenOffenceValue)
  local addedDefenceRate = (math.floor)(ToClient_GetAddedDefenceRateFromDefencePoint(defenceValue) / 10000)
  local addedDefence = ToClient_GetAddedDefenceFromStat(totalStat)
  local isSetAwakenWeapon = ToClient_getEquipmentItem((CppEnums.EquipSlotNo).awakenWeapon)
  if isSetAwakenWeapon == nil then
    addedAwakenOffence = 0
  end
  ;
  (ui._staticText_AttackValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ADDED_OFFENCE_VALUE", "value", addedOffence))
  ;
  (ui._staticText_AwakenAttackValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ADDED_AWAKENOFFENCE_VALUE", "value", addedAwakenOffence))
  ;
  (ui._staticText_ReduceRateValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ADDED_DEFENCERATE_VALUE", "value", addedDefenceRate))
  ;
  (ui._staticText_DefenceValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ADDED_DEFENCE_VALUE", "value", addedDefence))
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_Tooltip_BattlePoint.show = function(self, showFlag)
  -- function num : 0_6
  if (self._panel):GetShow() == showFlag then
    return false
  end
  ;
  (self._panel):SetShow(showFlag, showFlag)
  if showFlag then
    self._isDetail = false
    self:updateUIPos()
    self:updateData()
    self:updateCurrnetTier()
  end
  return true
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_Tooltip_BattlePoint.toggleDetail = function(self)
  -- function num : 0_7
  audioPostEvent_SystemUi(0, 0)
  self._isDetail = not self._isDetail
  self:updateUIPos()
  self:updateData()
  self:updateCurrnetTier()
end

Fglobal_Init_Tooltip_BattlePoint = function()
  -- function num : 0_8 , upvalues : awakenWeaponContentsOpen
  local ui = PaGlobal_Tooltip_BattlePoint._ui
  Panel_Tooltip_BattlePoint:SetShow(false, false)
  local highTierTitle = {"StaticText_IconTitle1", "StaticText_IconTitle2", "StaticText_IconTitle3"}
  ui._highTierTitles = {}
  for idx,ctrlName in ipairs(highTierTitle) do
    local control = (UI.getChildControl)(ui._staticBG_TierTotal, ctrlName)
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R8 in 'UnsetPending'

    if control ~= nil then
      (ui._highTierTitles)[idx] = control
    end
  end
  local highTierDesc = {"StaticText_DescTitle1", "StaticText_DescTitle2", "StaticText_DescTitle3"}
  local max = 0
  local min = 0
  ui._highTierDesces = {}
  for idx,ctrlName in ipairs(highTierDesc) do
    local control = (UI.getChildControl)(ui._staticBG_TierTotal, ctrlName)
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R11 in 'UnsetPending'

    if control ~= nil then
      (ui._highTierDesces)[idx] = control
      min = ToClient_GetMinTotalStatByHighTier(idx)
      local txtStatRange = ""
      if idx == 1 then
        txtStatRange = PAGetStringParam1(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER1", "minStat", min)
      else
        max = ToClient_GetMinTotalStatByHighTier(idx - 1) - 1
        txtStatRange = PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER", "minStat", min, "maxStat", max)
      end
      control:SetText(txtStatRange)
    end
  end
  local tierTitle = {"StaticText_IconTier1", "StaticText_IconTier2", "StaticText_IconTier3", "StaticText_IconTier4", "StaticText_IconTier5", "StaticText_IconTier6", "StaticText_IconTier7", "StaticText_IconTier8"}
  ui._tierTitles = {}
  for idx,ctrlName in ipairs(tierTitle) do
    local control = (UI.getChildControl)(ui._staticBG_TierTotal, ctrlName)
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R12 in 'UnsetPending'

    if control ~= nil then
      (ui._tierTitles)[idx] = control
    end
  end
  local tierDesc = {"StaticText_DescTier1", "StaticText_DescTier2", "StaticText_DescTier3", "StaticText_DescTier4", "StaticText_DescTier5", "StaticText_DescTier6", "StaticText_DescTier7", "StaticText_DescTier8"}
  ui._tierDesces = {}
  local tierRangeText = ""
  for idx,ctrlName in ipairs(tierDesc) do
    local control = (UI.getChildControl)(ui._staticBG_TierTotal, ctrlName)
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R14 in 'UnsetPending'

    if control ~= nil then
      (ui._tierDesces)[idx] = control
      min = ToClient_GetMinTotalStatByTier(idx)
      if _ContentsGroup_StatTierIcon == true then
        if idx == 1 then
          max = ToClient_GetMinTotalStatByHighTier(ToClient_GetHighTierCount()) - 1
        else
          max = ToClient_GetMinTotalStatByTier(idx - 1) - 1
        end
        tierRangeText = PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER", "minStat", min, "maxStat", max)
      else
        if idx == 1 then
          tierRangeText = PAGetStringParam1(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER1", "minStat", min)
        else
          max = ToClient_GetMinTotalStatByTier(idx - 1) - 1
          tierRangeText = PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER", "minStat", min, "maxStat", max)
        end
      end
      control:SetText(tierRangeText)
    end
  end
  ui._currentGradeBg = (UI.getChildControl)(ui._staticBG_TierTotal, "Static_CurrentGradeBg")
  ;
  (ui._staticBG_TierTotal):SetSize((ui._staticBG_TierTotal):GetSizeX(), (ui._staticBG_TierTotal):GetSizeY() - 50)
  ui._staticIcon_CurrentTier = (UI.getChildControl)(ui._staticBG_CurrentTier, "StaticText_IconTitle")
  ui._staticText_CurrentTier = (UI.getChildControl)(ui._staticBG_CurrentTier, "StaticText_DescTitle")
  ui._staticText_AttackValue = (UI.getChildControl)(ui._staticBG_BonusStat, "StaticText_AttackValue")
  ui._staticText_AwakenAttackValue = (UI.getChildControl)(ui._staticBG_BonusStat, "StaticText_AwakenAttackValue")
  ui._staticText_ReduceRateValue = (UI.getChildControl)(ui._staticBG_BonusStat, "StaticText_ReduceValue")
  ui._staticText_DefenceValue = (UI.getChildControl)(ui._staticBG_BonusStat, "StaticText_DefenceValue")
  ui._staticText_AwakenAttackTitle = (UI.getChildControl)(ui._staticBG_BonusStat, "StaticText_AwakenAttackTitle")
  ui._staticText_ReduceTitle = (UI.getChildControl)(ui._staticBG_BonusStat, "StaticText_ReduceTitle")
  ui._staticText_DefenceTitle = (UI.getChildControl)(ui._staticBG_BonusStat, "StaticText_DefenceTitle")
  if _ContentsGroup_StatTierIcon == false then
    for _,control in ipairs(ui._highTierTitles) do
      control:SetShow(false)
    end
    for _,control in ipairs(ui._highTierDesces) do
      control:SetShow(false)
    end
    for _,control in ipairs(ui._tierTitles) do
      control:SetPosY(control:GetPosY() - 80)
    end
    for _,control in ipairs(ui._tierDesces) do
      control:SetPosY(control:GetPosY() - 80)
    end
    ;
    (ui._staticBG_TierTotal):SetSize((ui._staticBG_TierTotal):GetSizeX(), (ui._staticBG_TierTotal):GetSizeY() - 80)
  end
  if awakenWeaponContentsOpen == false then
    (ui._staticText_AwakenAttackTitle):SetShow(false)
    ;
    (ui._staticText_AwakenAttackValue):SetShow(false)
    ;
    (ui._staticText_ReduceTitle):SetPosY((ui._staticText_ReduceTitle):GetPosY() - 20)
    ;
    (ui._staticText_ReduceRateValue):SetPosY((ui._staticText_ReduceRateValue):GetPosY() - 20)
    ;
    (ui._staticText_DefenceTitle):SetPosY((ui._staticText_DefenceTitle):GetPosY() - 20)
    ;
    (ui._staticText_DefenceValue):SetPosY((ui._staticText_DefenceValue):GetPosY() - 20)
  end
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_Tooltip_BattlePoint.updateCurrnetTier = function(self)
  -- function num : 0_9 , upvalues : setTierIcon, alignCurrentTierBg
  local selfPlayer = getSelfPlayer()
  local tierRangeText = ""
  if selfPlayer == nil then
    return 
  end
  local totalStatValue = (math.floor)(selfPlayer:getTotalStatValue())
  do
    if _ContentsGroup_StatTierIcon == true then
      local highTier = ToClient_GetHighTierByTotalStat(totalStatValue)
      if highTier >= 1 and highTier <= ToClient_GetHighTierCount() then
        self:updateCurrentHighTier(highTier, totalStatValue)
        return 
      end
    end
    local tier = ToClient_GetTier(totalStatValue)
    local tierName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSTAT_TIERNAME_" .. tier, "totalStat", totalStatValue)
    ;
    ((self._ui)._staticIcon_CurrentTier):SetText(tierName)
    setTierIcon((self._ui)._staticIcon_CurrentTier, "new_ui_common_forlua/default/Default_Etc_04.dds", 8 - tier, 354, 99, 4, 24)
    local min = ToClient_GetMinTotalStatByTier(tier)
    local max = 0
    if _ContentsGroup_StatTierIcon == true then
      if tier == 1 then
        max = ToClient_GetMinTotalStatByHighTier(ToClient_GetHighTierCount()) - 1
      else
        max = ToClient_GetMinTotalStatByTier(tier - 1) - 1
      end
      tierRangeText = PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER", "minStat", min, "maxStat", max)
    else
      if tier == 1 then
        tierRangeText = PAGetStringParam1(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER1", "minStat", min)
      else
        max = ToClient_GetMinTotalStatByTier(tier - 1) - 1
        tierRangeText = PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER", "minStat", min, "maxStat", max)
      end
    end
    ;
    ((self._ui)._staticText_CurrentTier):SetText(tierRangeText)
    alignCurrentTierBg((self._ui)._currentGradeBg, ((self._ui)._tierTitles)[tier])
  end
end

-- DECOMPILER ERROR at PC157: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_Tooltip_BattlePoint.updateCurrentHighTier = function(self, highTier, totalStatValue)
  -- function num : 0_10 , upvalues : setTierIcon, alignCurrentTierBg
  local tierName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSTAT_HIGHTIERNAME_" .. highTier, "totalStat", totalStatValue)
  ;
  ((self._ui)._staticIcon_CurrentTier):SetText(tierName)
  setTierIcon((self._ui)._staticIcon_CurrentTier, "new_ui_common_forlua/default/Default_Etc_04.dds", 3 - highTier, 225, 142, 3, 42)
  local tierRangeText = ""
  local min = ToClient_GetMinTotalStatByHighTier(highTier)
  if highTier == 1 then
    tierRangeText = PAGetStringParam1(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER1", "minStat", min)
  else
    local max = ToClient_GetMinTotalStatByHighTier(highTier - 1) - 1
    tierRangeText = PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_BATTLEPOINT_TIER", "minStat", min, "maxStat", max)
  end
  do
    ;
    ((self._ui)._staticText_CurrentTier):SetText(tierRangeText)
    alignCurrentTierBg((self._ui)._currentGradeBg, ((self._ui)._highTierTitles)[highTier])
  end
end

FGlobal_EquipmentUpdate = function()
  -- function num : 0_11
  PaGlobal_Tooltip_BattlePoint:updateCurrnetTier()
  PaGlobal_Tooltip_BattlePoint:updateData()
end

registerEvent("FromClient_luaLoadComplete", "Fglobal_Init_Tooltip_BattlePoint")
registerEvent("EventEquipmentUpdate", "FGlobal_EquipmentUpdate")

