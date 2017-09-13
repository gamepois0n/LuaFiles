-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_nodestableinfo.luac 

-- params : ...
-- function num : 0
Panel_NodeStableInfo:SetShow(false)
Panel_NodeStableInfo:SetDragEnable(false)
Panel_NodeStableInfo:ActiveMouseEventEffect(true)
Panel_NodeStableInfo:setGlassBackground(true)
local UI_color = Defines.Color
local isContentsStallionEnable = ToClient_IsContentsGroupOpen("243")
local isContentsNineTierEnable = ToClient_IsContentsGroupOpen("80")
local nodeStableInfo = {_Info_Title = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Title"), _Info_DefaultInfoTitle = (UI.getChildControl)(Panel_NodeStableInfo, "Info_DefaultInfoTitle"), _Info_DefaultInfoBG = (UI.getChildControl)(Panel_NodeStableInfo, "Info_DefaultInfoBG"), _Info_StatBG = (UI.getChildControl)(Panel_NodeStableInfo, "Info_StatBG"), _Info_Level_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Level_Text"), _Info_Def_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Def_Text"), _Info_HP_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_HP_Text"), _Info_Weight_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Weight_Text"), _Info_MP_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_MP_Text"), _Info_EXP_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_EXP_Text"), _Info_MaxMoveSpeed_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_MaxMoveSpeed_Text"), _Info_Acceleration_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Acceleration_Text"), _Info_CorneringSpeed_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_CorneringSpeed_Text"), _Info_BrakeSpeed_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_BrakeSpeed_Text"), _Info_StatLine = (UI.getChildControl)(Panel_NodeStableInfo, "Info_StatLine"), _Info_Life_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Life_Text"), _Info_DeadCount_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_DeadCount_Text"), _Info_MatingCount_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_MatingCount_Text"), _Info_Imprint_Text = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Imprint_Text"), _Info_HP_Gauge_Back = (UI.getChildControl)(Panel_NodeStableInfo, "Info_HP_Gauge_Back"), _Info_Weight_Gauge_Back = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Weight_Gauge_Back"), _Info_MP_Gauge_Back = (UI.getChildControl)(Panel_NodeStableInfo, "Info_MP_Gauge_Back"), _Info_EXP_Gauge_Back = (UI.getChildControl)(Panel_NodeStableInfo, "Info_EXP_Gauge_Back"), _Info_MaleIcon = (UI.getChildControl)(Panel_NodeStableInfo, "Info_MaleIcon"), _Info_FemaleIcon = (UI.getChildControl)(Panel_NodeStableInfo, "Info_FemaleIcon"), _Info_Grade_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Grade_Value"), _Info_Name_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Name_Value"), _Info_StallionIcon = (UI.getChildControl)(Panel_NodeStableInfo, "Info_iconStallion"), _Info_HP_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_HP_Value"), _Info_Weight_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Weight_Value"), _Info_MP_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_MP_Value"), _Info_EXP_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_EXP_Value"), _Info_HP_Gauge_Bar = (UI.getChildControl)(Panel_NodeStableInfo, "Info_HP_Gauge_Bar"), _Info_Weight_GaugeBar = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Weight_GaugeBar"), _Info_MP_Gauge_Bar = (UI.getChildControl)(Panel_NodeStableInfo, "Info_MP_Gauge_Bar"), _Info_EXP_Gauge_Bar = (UI.getChildControl)(Panel_NodeStableInfo, "Info_EXP_Gauge_Bar"), _Info_Level_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Level_Value"), _Info_Def_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Def_Value"), _Info_MaxMoveSpeed_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_MaxMoveSpeed_Value"), _Info_Acceleration_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Acceleration_Value"), _Info_CorneringSpeed_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_CorneringSpeed_Value"), _Info_BrakeSpeed_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_BrakeSpeed_Value"), _Info_Life_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Life_Value"), _Info_DeadCount_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_DeadCount_Value"), _Info_MatingCount_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_MatingCount_Value"), _Info_Imprint_Value = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Imprint_Value"), _Info_Button_Close = (UI.getChildControl)(Panel_NodeStableInfo, "Info_Button_Close"), 
_LinkConfig = {bgX = 6, bgY = 7, iconX = 7, iconY = 7, nameX = 9, nameY = 45, levelX = 9, levelY = 45, tearX = 9, tearY = 38, sexiconX = 7, sexiconY = 7, gapX = 59, count = 4}
, 
_SkillConfig = {expbgX = 6, expbgY = 10, expgaugeX = 8, expgaugeY = 12, iconX = 11, iconY = 15, nameX = 8, nameY = 49, expvalueX = 26, expvalueY = 33, gapX = 55, count = 4}
, _skillStartIdx = 0, _SkillTitle = (UI.getChildControl)(Panel_NodeStableInfo, "Skill_Title"), _SkillCountValue = (UI.getChildControl)(Panel_NodeStableInfo, "Skill_Count_Value"), _SkillBG = (UI.getChildControl)(Panel_NodeStableInfo, "Skill_BG"), _SkillPrevPage = (UI.getChildControl)(Panel_NodeStableInfo, "Skill_PrevPage"), _SkillPageValue = (UI.getChildControl)(Panel_NodeStableInfo, "Skill_Page_Value"), _SkillNextPage = (UI.getChildControl)(Panel_NodeStableInfo, "Skill_NextPage"), _startSlotIndex = 0, _learnSkillCount = 0, _nodeWaypointKey = 0, _nodeServantCount = 0, _nodeSelectslotNo = 0, _skillslot = (Array.new)(), _linkhorseslot = (Array.new)()}
nodeStableInfo.init = function(self)
  -- function num : 0_0
  for slotidx = 0, (self._SkillConfig).count - 1 do
    local skill = {}
    skill.panel = Panel_NodeStableInfo
    skill.slotNo = slotidx
    skill.expbg = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Skill_Learn_BG", self._SkillBG, "NodeStableInfo_SkillLearnBG_" .. slotidx)
    skill.expgauge = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Skill_Learn_Gauge", self._SkillBG, "NodeStableInfo_SkillLearnGauge_" .. slotidx)
    skill.icon = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Skill_Icon", self._SkillBG, "NodeStableInfo_SkillIcon_" .. slotidx)
    skill.expvalue = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Skill_Learn_Value", self._SkillBG, "NodeStableInfo_SkillExp_" .. slotidx)
    ;
    (skill.expbg):SetPosX((self._SkillConfig).expbgX + (self._SkillConfig).gapX * slotidx)
    ;
    (skill.expbg):SetPosY((self._SkillConfig).expbgY)
    ;
    (skill.expgauge):SetPosX((self._SkillConfig).expgaugeX + (self._SkillConfig).gapX * slotidx)
    ;
    (skill.expgauge):SetPosY((self._SkillConfig).expgaugeY)
    ;
    (skill.icon):SetPosX((self._SkillConfig).iconX + (self._SkillConfig).gapX * slotidx)
    ;
    (skill.icon):SetPosY((self._SkillConfig).iconY)
    ;
    (skill.expvalue):SetPosX((self._SkillConfig).expvalueX + (self._SkillConfig).gapX * slotidx)
    ;
    (skill.expvalue):SetPosY((self._SkillConfig).expvalueY)
    ;
    (skill.expbg):SetIgnore(true)
    ;
    (skill.expgauge):SetIgnore(true)
    ;
    (skill.expvalue):SetIgnore(true)
    -- DECOMPILER ERROR at PC119: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._skillslot)[slotidx] = skill
  end
  for linkidx = 0, (self._LinkConfig).count - 1 do
    local linkhorse = {}
    linkhorse.panel = Panel_NodeStableInfo
    linkhorse.slotNo = linkidx
    linkhorse.bg = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Horse_BG", self._SkillBG, "NodeStableInfo_HorseBG_" .. linkidx)
    linkhorse.icon = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Horse_Icon", self._SkillBG, "NodeStableInfo_HorseIcon_" .. linkidx)
    linkhorse.level = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Horse_Level_Value", self._SkillBG, "NodeStableInfo_HorseLevel_" .. linkidx)
    linkhorse.tear = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Horse_Tear_Value", self._SkillBG, "NodeStableInfo_HorseTear_" .. linkidx)
    linkhorse.male = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Horse_MaleIcon", self._SkillBG, "NodeStableInfo_HorseMaleIcon_" .. linkidx)
    linkhorse.female = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Horse_FemaleIcon", self._SkillBG, "NodeStableInfo_HorseFemaleIcon_" .. linkidx)
    linkhorse.name = (UI.createAndCopyBasePropertyControl)(Panel_NodeStableInfo, "Horse_Name_Value", self._SkillBG, "NodeStableInfo_HorseName_" .. linkidx)
    ;
    (linkhorse.bg):SetPosX((self._LinkConfig).bgX + (self._LinkConfig).gapX * linkidx)
    ;
    (linkhorse.bg):SetPosY((self._LinkConfig).bgY)
    ;
    (linkhorse.icon):SetPosX((self._LinkConfig).iconX + (self._LinkConfig).gapX * linkidx)
    ;
    (linkhorse.icon):SetPosY((self._LinkConfig).iconY)
    ;
    (linkhorse.level):SetPosX((self._LinkConfig).levelX + (self._LinkConfig).gapX * linkidx)
    ;
    (linkhorse.level):SetPosY((self._LinkConfig).levelY)
    ;
    (linkhorse.tear):SetPosX((self._LinkConfig).tearX + (self._LinkConfig).gapX * linkidx)
    ;
    (linkhorse.tear):SetPosY((self._LinkConfig).tearY)
    ;
    (linkhorse.male):SetPosX((self._LinkConfig).sexiconX + (self._LinkConfig).gapX * linkidx)
    ;
    (linkhorse.male):SetPosY((self._LinkConfig).sexiconY)
    ;
    (linkhorse.female):SetPosX((self._LinkConfig).sexiconX + (self._LinkConfig).gapX * linkidx)
    ;
    (linkhorse.female):SetPosY((self._LinkConfig).sexiconY)
    ;
    (linkhorse.name):SetPosX((self._LinkConfig).nameX + (self._LinkConfig).gapX * linkidx)
    ;
    (linkhorse.name):SetPosY((self._LinkConfig).nameY)
    -- DECOMPILER ERROR at PC300: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._linkhorseslot)[linkidx] = linkhorse
  end
end

nodeStableInfo.update = function(self)
  -- function num : 0_1 , upvalues : isContentsStallionEnable
  local servantInfo = stable_getServantFromWaypointKey(self._nodeWaypointKey, self._nodeSelectslotNo)
  if servantInfo == nil then
    return 
  end
  ;
  (self._SkillTitle):SetShow(true)
  ;
  (self._SkillCountValue):SetShow(true)
  ;
  (self._SkillBG):SetShow(true)
  ;
  (self._Info_StallionIcon):SetShow(false)
  ;
  (self._Info_Grade_Value):SetShow(false)
  Panel_NodeStableInfo:SetSize(Panel_NodeStableInfo:GetSizeX(), 415)
  if (CppEnums.VehicleType).Type_Horse == servantInfo:getVehicleType() or (CppEnums.VehicleType).Type_RidableBabyElephant == servantInfo:getVehicleType() then
    (self._SkillTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODESTABLEINFO_SKILL"))
    ;
    (self._Info_Grade_Value):SetShow(true)
    if servantInfo:getTier() == 9 and isContentsStallionEnable then
      (self._Info_Grade_Value):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_TEXT_TIER9"))
      ;
      (self._Info_StallionIcon):SetShow(false)
    else
      ;
      (self._Info_Grade_Value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", servantInfo:getTier()))
      if isContentsStallionEnable then
        (self._Info_StallionIcon):SetShow(true)
        if servantInfo:isStallion() == true then
          (self._Info_StallionIcon):SetMonoTone(false)
        else
          ;
          (self._Info_StallionIcon):SetMonoTone(true)
        end
      end
    end
  end
  ;
  (self._Info_Name_Value):SetText(servantInfo:getName())
  ;
  (self._Info_Level_Value):SetText(tostring(servantInfo:getLevel()))
  ;
  (self._Info_DeadCount_Value):SetText(servantInfo:getDeadCount())
  ;
  (self._Info_MatingCount_Value):SetText(servantInfo:getMatingCount())
  ;
  (self._Info_MaxMoveSpeed_Value):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_MaxMoveSpeed) / 10000) .. "%")
  ;
  (self._Info_Acceleration_Value):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_Acceleration) / 10000) .. "%")
  ;
  (self._Info_CorneringSpeed_Value):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_CorneringSpeed) / 10000) .. "%")
  ;
  (self._Info_BrakeSpeed_Value):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_BrakeSpeed) / 10000) .. "%")
  ;
  (self._Info_MaleIcon):SetShow(false)
  ;
  (self._Info_FemaleIcon):SetShow(false)
  if servantInfo:doMating() then
    if servantInfo:isMale() then
      (self._Info_MaleIcon):SetShow(true)
    else
      ;
      (self._Info_FemaleIcon):SetShow(true)
    end
  end
  if servantInfo:isPeriodLimit() then
    (self._Info_Life_Value):SetText(convertStringFromDatetime(servantInfo:getExpiredTime()))
  else
    ;
    (self._Info_Life_Value):SetText(PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_LIFEVALUE"))
  end
  ;
  (self._Info_Imprint_Value):SetShow(false)
  if servantInfo:isImprint() then
    (self._Info_Imprint_Text):SetShow(true)
    ;
    (self._Info_Imprint_Value):SetShow(true)
    ;
    (self._Info_Imprint_Value):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_ISIMPRINTING"))
  else
    if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Horse or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Camel or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Donkey or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Elephant then
      (self._Info_Imprint_Text):SetShow(true)
      ;
      (self._Info_Imprint_Value):SetShow(true)
      ;
      (self._Info_Imprint_Value):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_ISIMPRINTPOSSIBLE"))
    end
  end
  if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Camel or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Donkey or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Elephant then
    (self._Info_MaleIcon):SetShow(false)
    ;
    (self._Info_FemaleIcon):SetShow(false)
  end
  local max_weight_s64 = servantInfo:getMaxWeight_s64() / (Defines.s64_const).s64_10000
  local max_weight = Int64toInt32(max_weight_s64)
  local total_weight_s64 = (servantInfo:getInventoryWeight_s64() + servantInfo:getEquipWeight_s64()) / (Defines.s64_const).s64_10000
  local total_weight = Int64toInt32(total_weight_s64)
  local weightPercent = total_weight / max_weight * 100
  local weightValue = ""
  if max_weight < total_weight then
    weightPercent = 100
  end
  weightValue = makeDotMoney(total_weight_s64) .. " / " .. makeDotMoney(max_weight_s64)
  ;
  (self._Info_Weight_GaugeBar):SetSize((self._Info_Weight_Gauge_Back):GetSizeX() * weightPercent / 100, 4)
  ;
  (self._Info_HP_Gauge_Bar):SetSize(((self._Info_HP_Gauge_Back):GetSizeX() - 10) / 100 * (servantInfo:getHp() / servantInfo:getMaxHp() * 100), 4)
  ;
  (self._Info_MP_Gauge_Bar):SetSize(((self._Info_MP_Gauge_Back):GetSizeX() - 10) / 100 * (servantInfo:getMp() / servantInfo:getMaxMp() * 100), 4)
  ;
  (self._Info_EXP_Gauge_Bar):SetSize(((self._Info_EXP_Gauge_Back):GetSizeX() - 10) * Int64toInt32(servantInfo:getExp_s64()) / Int64toInt32(servantInfo:getNeedExp_s64()), 4)
  ;
  (self._Info_HP_Value):SetText(makeDotMoney(servantInfo:getHp()) .. " / " .. makeDotMoney(servantInfo:getMaxHp()))
  ;
  (self._Info_Weight_Value):SetText(makeDotMoney(max_weight_s64))
  ;
  (self._Info_MP_Value):SetText(makeDotMoney(servantInfo:getMp()) .. " / " .. makeDotMoney(servantInfo:getMaxMp()))
  ;
  (self._Info_EXP_Value):SetText(makeDotMoney(servantInfo:getExp_s64()) .. " / " .. makeDotMoney(servantInfo:getNeedExp_s64()))
  for ii = 0, (self._SkillConfig).count - 1 do
    (((self._skillslot)[ii]).expbg):SetShow(false)
    ;
    (((self._skillslot)[ii]).icon):SetShow(false)
    ;
    (((self._skillslot)[ii]).expgauge):SetShow(false)
    ;
    (((self._skillslot)[ii]).expvalue):SetShow(false)
    ;
    (((self._skillslot)[ii]).icon):addInputEvent("Mouse_On", "")
    ;
    (((self._skillslot)[ii]).icon):addInputEvent("Mouse_Out", "")
    ;
    (((self._skillslot)[ii]).icon):setTooltipEventRegistFunc("")
  end
  local learnSkillCount = servantInfo:getSkillCount()
  local skillTempWrapper = (Array.new)()
  for idx = 1, learnSkillCount - 1 do
    local skillWrapper = servantInfo:getSkill(idx)
    if skillWrapper ~= nil then
      skillTempWrapper:push_back(idx)
    end
  end
  self._learnSkillCount = skillTempWrapper:length()
  local control_Idx = 0
  for skill_idx,skillReal_Idx in pairs(skillTempWrapper) do
    if (self._SkillConfig).count <= control_Idx then
      break
    end
    ;
    (self._SkillCountValue):SetText("( " .. self._learnSkillCount .. " )")
    ;
    (self._SkillCountValue):SetShow(true)
    if self._startSlotIndex < skill_idx then
      local skillWrapper = servantInfo:getSkill(skillReal_Idx)
      local expTxt = tonumber((string.format)("%.0f", servantInfo:getSkillExp(skillReal_Idx) / ((skillWrapper:get())._maxExp / 100)))
      if expTxt >= 100 then
        expTxt = 100
      end
      ;
      (((self._skillslot)[control_Idx]).icon):ChangeTextureInfoName("Icon/" .. skillWrapper:getIconPath())
      ;
      (((self._skillslot)[control_Idx]).expgauge):SetProgressRate(servantInfo:getSkillExp(skillReal_Idx) / ((skillWrapper:get())._maxExp / 100))
      ;
      (((self._skillslot)[control_Idx]).expvalue):SetText(expTxt .. "%")
      ;
      (((self._skillslot)[control_Idx]).expbg):SetShow(true)
      ;
      (((self._skillslot)[control_Idx]).icon):SetShow(true)
      ;
      (((self._skillslot)[control_Idx]).expgauge):SetShow(true)
      ;
      (((self._skillslot)[control_Idx]).expvalue):SetShow(true)
      ;
      (((self._skillslot)[control_Idx]).icon):addInputEvent("Mouse_On", "HandleClicked_WorldMap_NodeStableInfo_SkillToolTip( true, " .. control_Idx .. ", " .. skillReal_Idx .. " )")
      ;
      (((self._skillslot)[control_Idx]).icon):addInputEvent("Mouse_Out", "HandleClicked_WorldMap_NodeStableInfo_SkillToolTip( false, " .. control_Idx .. ", " .. skillReal_Idx .. " )")
      ;
      (((self._skillslot)[control_Idx]).icon):setTooltipEventRegistFunc("HandleClicked_WorldMap_NodeStableInfo_SkillToolTip( true, " .. control_Idx .. ", " .. skillReal_Idx .. " )")
      control_Idx = control_Idx + 1
    end
  end
  do
    if (self._SkillConfig).count < skillTempWrapper:length() then
      (self._SkillPageValue):SetText((string.format)("%.0f", self._startSlotIndex / (self._SkillConfig).count) + 1)
      ;
      (self._SkillPrevPage):addInputEvent("Mouse_LUp", "nodeStableInfo_ScrollEvent(true)")
      ;
      (self._SkillNextPage):addInputEvent("Mouse_LUp", "nodeStableInfo_ScrollEvent(false)")
      ;
      (self._SkillPageValue):SetShow(true)
      ;
      (self._SkillPrevPage):SetShow(true)
      ;
      (self._SkillNextPage):SetShow(true)
    else
      ;
      (self._SkillPageValue):SetShow(false)
      ;
      (self._SkillPrevPage):SetShow(false)
      ;
      (self._SkillNextPage):SetShow(false)
    end
    for linkedii = 0, (self._LinkConfig).count - 1 do
      (((self._linkhorseslot)[linkedii]).bg):SetShow(false)
      ;
      (((self._linkhorseslot)[linkedii]).icon):SetShow(false)
      ;
      (((self._linkhorseslot)[linkedii]).level):SetShow(false)
      ;
      (((self._linkhorseslot)[linkedii]).tear):SetShow(false)
      ;
      (((self._linkhorseslot)[linkedii]).male):SetShow(false)
      ;
      (((self._linkhorseslot)[linkedii]).female):SetShow(false)
      ;
      (((self._linkhorseslot)[linkedii]).name):SetShow(false)
    end
    if not servantInfo:doHaveVehicleSkill() and servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Carriage then
      (self._SkillTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODESTABLEINFO_LINKHORSE"))
      ;
      (self._SkillCountValue):SetShow(false)
      for ii = 0, (self._SkillConfig).count - 1 do
        (((self._skillslot)[ii]).expbg):SetShow(false)
        ;
        (((self._skillslot)[ii]).icon):SetShow(false)
        ;
        (((self._skillslot)[ii]).expgauge):SetShow(false)
        ;
        (((self._skillslot)[ii]).expvalue):SetShow(false)
      end
      local currentlinkcount = servantInfo:getCurrentLinkCount()
      local maxlinkcount = servantInfo:getLinkCount()
      for linkedidx = 0, maxlinkcount - 1 do
        local sInfo = stable_getServantFromOwnerServant(servantInfo:getServantNo(), linkedidx)
        if sInfo ~= nil then
          local linkedHorse = (self._linkhorseslot)[linkedidx]
          ;
          (linkedHorse.icon):ChangeTextureInfoName(sInfo:getIconPath1())
          ;
          (linkedHorse.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. tostring(sInfo:getLevel()))
          ;
          (linkedHorse.tear):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", sInfo:getTier()))
          ;
          (linkedHorse.bg):SetShow(true)
          ;
          (linkedHorse.icon):SetShow(true)
          ;
          (linkedHorse.level):SetShow(true)
          ;
          (linkedHorse.tear):SetShow(true)
          if sInfo:isMale() then
            (linkedHorse.male):SetShow(true)
          else
            ;
            (linkedHorse.female):SetShow(true)
          end
        end
      end
    end
    do
      if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Donkey then
        (self._SkillTitle):SetShow(false)
        ;
        (self._SkillCountValue):SetShow(false)
        ;
        (self._SkillBG):SetShow(false)
        Panel_NodeStableInfo:SetSize(Panel_NodeStableInfo:GetSizeX(), 315)
      end
    end
  end
end

HandleClicked_WorldMap_NodeStableInfo_SkillToolTip = function(isShow, uiIdx, skillIdx)
  -- function num : 0_2 , upvalues : nodeStableInfo
  local servantInfo = stable_getServantFromWaypointKey(nodeStableInfo._nodeWaypointKey, nodeStableInfo._nodeSelectslotNo)
  local control = ((nodeStableInfo._skillslot)[uiIdx]).icon
  local name = (servantInfo:getSkill(skillIdx)):getName()
  if isShow then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, nil)
  else
    TooltipSimple_Hide()
  end
end

nodeStableInfo_ScrollEvent = function(isUp)
  -- function num : 0_3 , upvalues : nodeStableInfo
  local maxSlotNo = nodeStableInfo._learnSkillCount - (nodeStableInfo._SkillConfig).count
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC19: Unhandled construct in 'MakeBoolean' P1

  if isUp and nodeStableInfo._startSlotIndex > 0 then
    nodeStableInfo._startSlotIndex = nodeStableInfo._startSlotIndex - (nodeStableInfo._SkillConfig).count
  end
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

  if nodeStableInfo._startSlotIndex < maxSlotNo then
    nodeStableInfo._startSlotIndex = nodeStableInfo._startSlotIndex + (nodeStableInfo._SkillConfig).count
  end
  nodeStableInfo:update()
end

nodeStableInfo_Open = function(nodeWayPoint, slotNo)
  -- function num : 0_4 , upvalues : nodeStableInfo
  if nodeWayPoint == nil then
    return 
  end
  if not Panel_NodeStableInfo:GetShow() then
    WorldMapPopupManager:push(Panel_NodeStableInfo, true)
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

  nodeStableInfo._startSlotIndex = 0
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  nodeStableInfo._nodeWaypointKey = nodeWayPoint
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

  nodeStableInfo._nodeSelectslotNo = slotNo
  nodeStableInfo:update()
end

nodeStableInfo_Close = function()
  -- function num : 0_5
  if not Panel_NodeStableInfo:GetShow() then
    return 
  end
  Panel_NodeStableInfo:SetShow(false)
end

nodeStableInfo.registEventHandler = function(self)
  -- function num : 0_6
  (self._Info_Button_Close):addInputEvent("Mouse_LUp", "nodeStableInfo_Close()")
end

nodeStableInfo:init()
nodeStableInfo:registEventHandler()

