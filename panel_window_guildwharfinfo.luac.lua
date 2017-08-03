-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\guildwharf\panel_window_guildwharfinfo.luac 

-- params : ...
-- function num : 0
Panel_Window_GuildWharfInfo:SetShow(false, false)
Panel_Window_GuildWharfInfo:setMaskingChild(true)
Panel_Window_GuildWharfInfo:ActiveMouseEventEffect(true)
Panel_Window_GuildWharfInfo:SetDragEnable(true)
Panel_Window_GuildWharfInfo:RegisterShowEventFunc(true, "GuildWharfInfoShowAni()")
Panel_Window_GuildWharfInfo:RegisterShowEventFunc(false, "GuildWharfInfoHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
GuildWharfInfoShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_GuildWharfInfo:SetShow(true, false)
  ;
  (UIAni.fadeInSCR_Right)(Panel_Window_GuildWharfInfo)
  local aniInfo3 = Panel_Window_GuildWharfInfo:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = false
end

GuildWharfInfoHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_GuildWharfInfo:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_GuildWharfInfo:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local guildWharfInfo = {_staticName = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "StaticText_Name"), _staticText_GaugeBar_Hp = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "HP_GaugeBar"), _staticText_GaugeBar_Mp = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "MP_GaugeBar"), _staticText_GaugeBar_Weight = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "Weight_GaugeBar"), _staticText_Hp = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "HP_Value"), _staticText_Mp = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "MP_Value"), _staticText_Weight = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "Weight_Value"), _staticText_MoveSpeed = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "MaxMoveSpeedValue"), _staticText_Acceleration = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "AccelerationValue"), _staticText_Cornering = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "CorneringSpeedValue"), _staticText_BrakeSpeed = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "BrakeSpeedValue"), _deadCount = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "StaticText_DeadCount"), _deadCountValue = (UI.getChildControl)(Panel_Window_GuildWharfInfo, "StaticText_DeadCountValue")}
guildWharfInfo.init = function(self)
  -- function num : 0_2
end

guildWharfInfo.update = function(self)
  -- function num : 0_3
  local servantInfo = guildStable_getServant(GuildWharfList_SelectSlotNo())
  if servantInfo == nil then
    GuildWharfInfo_Close()
    return 
  end
  local Weight = servantInfo:getInventoryWeight_s64()
  local MaxWeight = servantInfo:getMaxWeight_s64() / (Defines.s64_const).s64_10000
  local GuageWeight = Int64toInt32(Weight)
  local GuageMaxWeight = Int64toInt32(MaxWeight)
  ;
  (self._staticName):SetText(servantInfo:getName())
  ;
  (self._staticText_GaugeBar_Hp):SetSize(2.5 * (servantInfo:getHp() / servantInfo:getMaxHp() * 100), 6)
  ;
  (self._staticText_GaugeBar_Mp):SetSize(2.5 * (servantInfo:getMp() / servantInfo:getMaxMp() * 100), 6)
  ;
  (self._staticText_GaugeBar_Weight):SetSize(2.5 * (GuageWeight / GuageMaxWeight * 100), 6)
  ;
  (self._staticText_Hp):SetText(makeDotMoney(servantInfo:getHp()) .. " / " .. makeDotMoney(servantInfo:getMaxHp()))
  ;
  (self._staticText_Mp):SetText(makeDotMoney(servantInfo:getMp()) .. " / " .. makeDotMoney(servantInfo:getMaxMp()))
  ;
  (self._staticText_Weight):SetText(makeDotMoney(Weight) .. " / " .. makeDotMoney(MaxWeight))
  ;
  (self._staticText_MoveSpeed):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_MaxMoveSpeed) / 10000) .. "%")
  ;
  (self._staticText_Acceleration):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_Acceleration) / 10000) .. "%")
  ;
  (self._staticText_Cornering):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_CorneringSpeed) / 10000) .. "%")
  ;
  (self._staticText_BrakeSpeed):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_BrakeSpeed) / 10000) .. "%")
  local deadCount = servantInfo:getDeadCount() * 10 .. "%"
  ;
  (self._deadCountValue):SetText(deadCount)
end

guildWharfInfo.registEventHandler = function(self)
  -- function num : 0_4
end

guildWharfInfo.registMessageHandler = function(self)
  -- function num : 0_5
  registerEvent("onScreenResize", "GuildWharfInfo_Resize")
end

GuildWharfInfo_Resize = function()
  -- function num : 0_6
  Panel_Window_GuildWharfInfo:SetSpanSize(20, 30)
  Panel_Window_GuildWharfInfo:ComputePos()
end

GuildWharfInfo_Open = function()
  -- function num : 0_7 , upvalues : guildWharfInfo
  Panel_Window_GuildWharfInfo:SetShow(true)
  local self = guildWharfInfo
  self:update()
end

GuildWharfInfo_Close = function()
  -- function num : 0_8
  if not Panel_Window_GuildWharfInfo:GetShow() then
    return 
  end
  Panel_Window_GuildWharfInfo:SetShow(false)
end

guildWharfInfo:init()
guildWharfInfo:registEventHandler()
guildWharfInfo:registMessageHandler()
GuildWharfInfo_Resize()

