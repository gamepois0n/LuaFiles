-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\ui_characterinfo_basic_control.luac 

-- params : ...
-- function num : 0
local UI_Class = CppEnums.ClassType
local CombatType = CppEnums.CombatResourceType
local BattleSpeed = CppEnums.BattleSpeedType
local Class_BattleSpeed = CppEnums.ClassType_BattleSpeed
local UI_DefaultFaceTexture = CppEnums.ClassType_DefaultFaceTexture
local IM = CppEnums.EProcessorInputMode
local UI_LifeType = CppEnums.LifeExperienceType
local UI_LifeToolTip = CppEnums.LifeExperienceTooltip
local UI_LifeString = CppEnums.LifeExperienceString
local self = PaGlobal_CharacterInfoBasic
FromClient_UI_CharacterInfo_Basic_TendencyChanged = function()
  -- function num : 0_0 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local tendency = (self._playerGet):getTendency()
  ;
  ((self._ui)._staticTextTendency_Value):SetText(tostring(tendency))
end

FromClient_UI_CharacterInfo_Basic_MentalChanged = function()
  -- function num : 0_1 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local mental = (self._player):getWp()
  local maxMental = (self._player):getMaxWp()
  ;
  ((self._ui)._staticTextMental_Value):SetText(tostring(mental) .. " / " .. tostring(maxMental))
end

FromClient_UI_CharacterInfo_Basic_ContributionChanged = function()
  -- function num : 0_2 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local territoryKeyRaw = ToClient_getDefaultTerritoryKey()
  local contribution = ToClient_getExplorePointByTerritoryRaw(territoryKeyRaw)
  local remainContribution = contribution:getRemainedPoint()
  local aquiredContribution = contribution:getAquiredPoint()
  ;
  ((self._ui)._staticTextContribution_Value):SetText(tostring(remainContribution) .. " / " .. tostring(aquiredContribution))
end

FromClient_UI_CharacterInfo_Basic_LevelChanged = function()
  -- function num : 0_3 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local ChaLevel = (self._playerGet):getLevel()
  ;
  ((self._ui)._staticClassSymbol):SetText("Lv " .. tostring(ChaLevel))
end

FromClient_UI_CharacterInfo_Basic_HpChanged = function()
  -- function num : 0_4 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local hp = (self._playerGet):getHp()
  local maxHp = (self._playerGet):getMaxHp()
  local hpRate = hp / maxHp * 100
  ;
  (((self._ui)._staticStatus_Value)[(self._status)._health]):SetText(tostring(hp) .. " / " .. tostring(maxHp))
  ;
  (((self._ui)._progress2Status)[(self._status)._health]):SetProgressRate(hpRate)
end

FromClient_UI_CharacterInfo_Basic_MpChanged = function()
  -- function num : 0_5 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local mp = (self._playerGet):getMp()
  local maxMp = (self._playerGet):getMaxMp()
  local MpRate = mp / maxMp * 100
  ;
  (((self._ui)._staticStatus_Value)[(self._status)._mental]):SetText(tostring(mp) .. " / " .. tostring(maxMp))
  ;
  (((self._ui)._progress2Status)[(self._status)._mental]):SetProgressRate(MpRate)
end

FromClient_UI_CharacterInfo_Basic_WeightChanged = function()
  -- function num : 0_6 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local _const = Defines.s64_const
  local s64_moneyWeight = ((self._playerGet):getInventory()):getMoneyWeight_s64()
  local s64_equipmentWeight = ((self._playerGet):getEquipment()):getWeight_s64()
  local s64_allWeight = (self._playerGet):getCurrentWeight_s64()
  local s64_maxWeight = (self._playerGet):getPossessableWeight_s64()
  local s64_allWeight_div = s64_allWeight / _const.s64_100
  local s64_maxWeight_div = s64_maxWeight / _const.s64_100
  local str_AllWeight = (string.format)("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local str_MaxWeight = (string.format)("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  if s64_allWeight_div <= s64_maxWeight_div then
    ((self._ui)._progress2WeightMoney):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_maxWeight_div))
    ;
    ((self._ui)._progress2WeightEquip):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_maxWeight_div))
    ;
    (((self._ui)._progress2Status)[(self._status)._weight]):SetProgressRate(Int64toInt32(s64_allWeight / s64_maxWeight_div))
  else
    ;
    ((self._ui)._progress2WeightMoney):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_allWeight_div))
    ;
    ((self._ui)._progress2WeightEquip):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_allWeight_div))
    ;
    (((self._ui)._progress2Status)[(self._status)._weight]):SetProgressRate(Int64toInt32(s64_allWeight / s64_allWeight_div))
  end
  ;
  (((self._ui)._staticStatus_Value)[(self._status)._weight]):SetText(tostring(str_AllWeight) .. " / " .. tostring(str_MaxWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end

FromClient_UI_CharacterInfo_Basic_AttackChanged = function()
  -- function num : 0_7 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  ToClient_updateAttackStat()
  local chaAttack = ToClient_getOffence()
  ;
  ((self._ui)._staticTextAttack_Value):SetText(tostring(chaAttack))
  local isSetAwakenWeapon = ToClient_getEquipmentItem((CppEnums.EquipSlotNo).awakenWeapon)
  if isSetAwakenWeapon ~= nil then
    local chaAwakenAttack = ToClient_getAwakenOffence()
    ;
    ((self._ui)._staticTextAwakenAttack_Title):SetShow(true)
    ;
    ((self._ui)._staticTextAwakenAttack_Value):SetText(tostring(chaAwakenAttack))
    ;
    ((self._ui)._staticTextDefence_Title):SetSpanSize(385, 395)
    ;
    ((self._ui)._staticTextStamina_Title):SetSpanSize(385, 419)
    ;
    ((self._ui)._staticTextZodiac_Title):SetSpanSize(385, 515)
    ;
    ((self._ui)._staticTextZodiac_Value):SetSpanSize(611, 515)
    ;
    ((self._ui)._staticTextTendency_Title):SetSpanSize(385, 540)
    ;
    ((self._ui)._staticTextTendency_Value):SetSpanSize(611, 540)
    ;
    ((self._ui)._staticTextMental_Title):SetSpanSize(385, 443)
    ;
    ((self._ui)._staticTextMental_Value):SetSpanSize(611, 443)
    ;
    ((self._ui)._staticTextSkillPoint_Title):SetSpanSize(385, 491)
    ;
    ((self._ui)._staticTextSkillPoint_Value):SetSpanSize(611, 491)
    ;
    ((self._ui)._staticTextContribution_Title):SetSpanSize(385, 467)
    ;
    ((self._ui)._staticTextContribution_Value):SetSpanSize(611, 467)
  else
    do
      ;
      ((self._ui)._staticTextAwakenAttack_Title):SetShow(false)
      ;
      ((self._ui)._staticTextDefence_Title):SetSpanSize(385, 371)
      ;
      ((self._ui)._staticTextStamina_Title):SetSpanSize(385, 395)
      ;
      ((self._ui)._staticTextZodiac_Title):SetSpanSize(385, 491)
      ;
      ((self._ui)._staticTextZodiac_Value):SetSpanSize(611, 491)
      ;
      ((self._ui)._staticTextTendency_Title):SetSpanSize(385, 515)
      ;
      ((self._ui)._staticTextTendency_Value):SetSpanSize(611, 515)
      ;
      ((self._ui)._staticTextMental_Title):SetSpanSize(385, 419)
      ;
      ((self._ui)._staticTextMental_Value):SetSpanSize(611, 419)
      ;
      ((self._ui)._staticTextSkillPoint_Title):SetSpanSize(385, 467)
      ;
      ((self._ui)._staticTextSkillPoint_Value):SetSpanSize(611, 467)
      ;
      ((self._ui)._staticTextContribution_Title):SetSpanSize(385, 443)
      ;
      ((self._ui)._staticTextContribution_Value):SetSpanSize(611, 443)
      local chaDefence = ToClient_getDefence()
      ;
      ((self._ui)._staticTextDefence_Value):SetText(tostring(chaDefence))
    end
  end
end

FromClient_UI_CharacterInfo_Basic_StaminaChanged = function()
  -- function num : 0_8 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local maxStamina = ((self._playerGet):getStamina()):getMaxSp()
  ;
  ((self._ui)._staticTextStamina_Value):SetText(tostring(maxStamina))
end

FromClient_UI_CharacterInfo_Basic_SkillPointChanged = function()
  -- function num : 0_9 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local skillPointInfo = ToClient_getSkillPointInfo(0)
  if skillPointInfo ~= nil then
    ((self._ui)._staticTextSkillPoint_Value):SetText(tostring(skillPointInfo._remainPoint .. " / " .. skillPointInfo._acquirePoint))
  end
end

FromClient_UI_CharacterInfo_Basic_FamilyPointsChanged = function()
  -- function num : 0_10 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local battleFP = (self._playerGet):getBattleFamilyPoint()
  local lifeFP = (self._playerGet):getLifeFamilyPoint()
  local etcFP = (self._playerGet):getEtcFamilyPoint()
  local sumFP = battleFP + lifeFP + etcFP
  ;
  (((self._ui)._staticTextFamilyPoints)[(self._familyPoint)._family]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FAMILYPOINT_TITLE", "familyPoint", tostring(sumFP)))
  ;
  (((self._ui)._staticTextFamilyPoints)[(self._familyPoint)._combat]):SetText(tostring(battleFP))
  ;
  (((self._ui)._staticTextFamilyPoints)[(self._familyPoint)._life]):SetText(tostring(lifeFP))
  ;
  (((self._ui)._staticTextFamilyPoints)[(self._familyPoint)._etc]):SetText(tostring(etcFP))
end

FromClient_UI_CharacterInfo_Basic_ResistChanged = function()
  -- function num : 0_11 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local data = {[(self._regist)._sturn] = (self._player):getStunResistance(), [(self._regist)._down] = (self._player):getKnockdownResistance(), [(self._regist)._capture] = (self._player):getCatchResistance(), [(self._regist)._knockBack] = (self._player):getKnockbackResistance()}
  for key,index in pairs(self._regist) do
    (((self._ui)._progress2Resist)[index]):SetProgressRate((math.floor)(data[index] / 10000))
    ;
    (((self._ui)._staticTextResist_Percent)[index]):SetText((math.floor)(data[index] / 10000) .. "%")
  end
end

FromClient_UI_CharacterInfo_Basic_CraftLevelChanged = function()
  -- function num : 0_12 , upvalues : UI_LifeType, self, UI_LifeString
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local LifeIcon = {
[UI_LifeType.gather] = {"new_ui_common_forlua/default/default_etc_04.dds", 116, 1, 137, 22}
, 
[UI_LifeType.fishing] = {"new_ui_common_forlua/default/default_etc_04.dds", 116, 23, 137, 44}
, 
[UI_LifeType.hunting] = {"new_ui_common_forlua/default/default_etc_04.dds", 116, 45, 137, 66}
, 
[UI_LifeType.cooking] = {"new_ui_common_forlua/default/default_etc_04.dds", 116, 67, 137, 88}
, 
[UI_LifeType.alchemy] = {"new_ui_common_forlua/default/default_etc_04.dds", 138, 1, 159, 22}
, 
[UI_LifeType.manufacture] = {"new_ui_common_forlua/default/default_etc_04.dds", 138, 23, 159, 44}
, 
[UI_LifeType.training] = {"new_ui_common_forlua/default/default_etc_04.dds", 138, 45, 159, 66}
, 
[UI_LifeType.trade] = {"new_ui_common_forlua/default/default_etc_04.dds", 138, 67, 159, 88}
, 
[UI_LifeType.growth] = {"new_ui_common_forlua/default/default_etc_04.dds", 160, 1, 181, 22}
}
  local isSailOpen = ToClient_IsContentsGroupOpen("83")
  if isSailOpen then
    LifeIcon[UI_LifeType.sail] = {"new_ui_common_forlua/default/default_etc_04.dds", 160, 23, 181, 44}
  end
  for index = 0, #LifeIcon + 1 do
    local tableIdx = index + 1
    -- DECOMPILER ERROR at PC121: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._craftTable)[tableIdx])._type = index
    -- DECOMPILER ERROR at PC133: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._craftTable)[tableIdx])._level = (self._playerGet):getLifeExperienceLevel(((self._craftTable)[tableIdx])._type)
    -- DECOMPILER ERROR at PC145: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._craftTable)[tableIdx])._exp = (self._playerGet):getCurrLifeExperiencePoint(((self._craftTable)[tableIdx])._type)
    -- DECOMPILER ERROR at PC157: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._craftTable)[tableIdx])._maxExp = (self._playerGet):getDemandLifeExperiencePoint(((self._craftTable)[tableIdx])._type)
    -- DECOMPILER ERROR at PC163: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._sortCraftTable)[tableIdx] = (self._craftTable)[tableIdx]
    ;
    (((self._ui)._staticCraftIcon)[index]):SetShow(true)
  end
  ;
  (table.sort)(self._sortCraftTable, function(a, b)
    -- function num : 0_12_0
    do return b._level < a._level or (a._level == b._level and b._exp < a._exp) end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
)
  for index = 0, #LifeIcon do
    local tableIdx = index + 1
    local crafType = ((self._craftTable)[tableIdx])._type
    ;
    (((self._ui)._staticCraftIcon)[tableIdx]):ChangeTextureInfoName((LifeIcon[crafType])[1])
    local x1, y1, x2, y2 = setTextureUV_Func(((self._ui)._staticCraftIcon)[tableIdx], (LifeIcon[crafType])[2], (LifeIcon[crafType])[3], (LifeIcon[crafType])[4], (LifeIcon[crafType])[5])
    ;
    ((((self._ui)._staticCraftIcon)[tableIdx]):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (((self._ui)._staticCraftIcon)[tableIdx]):setRenderTexture((((self._ui)._staticCraftIcon)[tableIdx]):getBaseTexture())
    ;
    (((self._ui)._staticCraftIcon)[tableIdx]):SetSize(21, 21)
    ;
    (((self._ui)._staticCraftIcon)[tableIdx]):addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:handleMouseOver_Tooltip(true, " .. crafType .. ", " .. tableIdx .. ")")
    ;
    (((self._ui)._staticCraftIcon)[tableIdx]):addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:handleMouseOver_Tooltip(false)")
    ;
    (((self._ui)._staticTextCraft_Title)[tableIdx]):SetText("")
    ;
    (((self._ui)._staticTextCraft_Level)[tableIdx]):SetText(FGlobal_UI_CharacterInfo_Basic_Global_CraftLevelReplace(((self._craftTable)[tableIdx])._level))
    ;
    (((self._ui)._staticTextCraft_Level)[tableIdx]):SetFontColor(FGlobal_UI_CharacterInfo_Basic_Global_CraftColorReplace(((self._craftTable)[tableIdx])._level))
    ;
    (((self._ui)._progress2Craft)[tableIdx]):SetSize(120, 3)
    ;
    (((self._ui)._progress2Craft)[tableIdx]):SetSpanSize(30, 15)
    ;
    (((self._ui)._progress2CraftBG)[tableIdx]):SetSize(120, 3)
    ;
    (((self._ui)._progress2CraftBG)[tableIdx]):SetSpanSize(30, 15)
    if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
      (((self._ui)._staticTextCraft_Title)[tableIdx]):SetText(UI_LifeString[crafType])
      ;
      (((self._ui)._staticCraftIcon)[tableIdx]):SetSize(10, 10)
      ;
      (((self._ui)._progress2Craft)[tableIdx]):SetSize(150, 3)
      ;
      (((self._ui)._progress2CraftBG)[tableIdx]):SetSize(150, 3)
      ;
      (((self._ui)._progress2CraftBG)[tableIdx]):SetSpanSize(0, 15)
      ;
      (((self._ui)._progress2Craft)[tableIdx]):SetSpanSize(0, 15)
      ;
      (((self._ui)._staticCraftIcon)[tableIdx]):addInputEvent("Mouse_On", "")
      ;
      (((self._ui)._staticCraftIcon)[tableIdx]):addInputEvent("Mouse_Out", "")
    end
    local ExpRate = Int64toInt32(((self._craftTable)[tableIdx])._exp * toInt64(0, 100) / ((self._craftTable)[tableIdx])._maxExp)
    ;
    (((self._ui)._progress2Craft)[tableIdx]):SetProgressRate(ExpRate)
    ;
    (((self._ui)._staticTextCraft_Percent)[tableIdx]):SetText(ExpRate .. "%")
    ;
    (((self._ui)._staticTextCraft_Percent)[tableIdx]):SetFontColor(FGlobal_UI_CharacterInfo_Basic_Global_CraftColorReplace(((self._craftTable)[tableIdx])._level))
    if not isGameTypeKorea() and not isGameTypeTaiwan() then
      (((self._ui)._staticTextCraft_Level)[tableIdx]):SetSpanSize(80, -3)
      ;
      (((self._ui)._staticTextCraft_Percent)[tableIdx]):SetShow(false)
    end
  end
  local crafType = ((self._sortCraftTable)[1])._type
  ;
  (((self._ui)._staticCraftIcon)[0]):ChangeTextureInfoName((LifeIcon[crafType])[1])
  local x1, y1, x2, y2 = setTextureUV_Func(((self._ui)._staticCraftIcon)[0], (LifeIcon[crafType])[2], (LifeIcon[crafType])[3], (LifeIcon[crafType])[4], (LifeIcon[crafType])[5])
  ;
  ((((self._ui)._staticCraftIcon)[0]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (((self._ui)._staticCraftIcon)[0]):setRenderTexture((((self._ui)._staticCraftIcon)[0]):getBaseTexture())
  ;
  (((self._ui)._staticTextCraft_Title)[0]):SetText(UI_LifeString[crafType])
  ;
  (((self._ui)._staticTextCraft_Level)[0]):SetText(FGlobal_UI_CharacterInfo_Basic_Global_CraftLevelReplace(((self._sortCraftTable)[1])._level))
  ;
  (((self._ui)._staticTextCraft_Level)[0]):SetFontColor(FGlobal_UI_CharacterInfo_Basic_Global_CraftColorReplace(((self._sortCraftTable)[1])._level))
  local ExpRate = Int64toInt32(((self._sortCraftTable)[1])._exp * toInt64(0, 100) / ((self._sortCraftTable)[1])._maxExp)
  ;
  (((self._ui)._progress2Craft)[0]):SetProgressRate(ExpRate)
  ;
  (((self._ui)._staticTextCraft_Percent)[0]):SetText(ExpRate .. "%")
  ;
  (((self._ui)._staticTextCraft_Percent)[0]):SetFontColor(FGlobal_UI_CharacterInfo_Basic_Global_CraftColorReplace(((self._sortCraftTable)[1])._level))
  -- DECOMPILER ERROR at PC596: Confused about usage of register: R8 in 'UnsetPending'

  self._requestRank = true
end

FromClient_UI_CharacterInfo_Basic_RankChanged = function()
  -- function num : 0_13 , upvalues : self, UI_LifeString
  if self._requestRank == false then
    return 
  end
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  self._requestRank = false
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local bestRank = ToClient_GetLifeMyRank()
  if bestRank > 0 and bestRank < 31 then
    local bestTitle = UI_LifeString[((self._sortCraftTable)[1])._type] .. "( " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LIFERANKING_RANK", "listIdx", bestRank) .. " )"
    ;
    (((self._ui)._staticTextCraft_Title)[0]):SetText(bestTitle)
  end
end

FromClient_UI_CharacterInfo_Basic_PotentialChanged = function()
  -- function num : 0_14 , upvalues : self, Class_BattleSpeed
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local levelText = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_POTENLEVEL")
  local classType = (self._player):getClassType()
  local currentData = {[(self._potential)._moveSpeed] = (self._player):characterStatPointSpeed((self._potential)._moveSpeed), [(self._potential)._attackSpeed] = (self._player):characterStatPointSpeed((self._potential)._attackSpeed + Class_BattleSpeed[classType]), [(self._potential)._critical] = (self._player):characterStatPointCritical(), [(self._potential)._fishTime] = (self._player):getCharacterStatPointFishing(), [(self._potential)._product] = (self._player):getCharacterStatPointCollection(), [(self._potential)._dropChance] = (self._player):getCharacterStatPointDropItem()}
  local limitData = {[(self._potential)._moveSpeed] = (self._player):characterStatPointLimitedSpeed((self._potential)._moveSpeed), [(self._potential)._attackSpeed] = (self._player):characterStatPointLimitedSpeed((self._potential)._attackSpeed + Class_BattleSpeed[classType]), [(self._potential)._critical] = (self._player):characterStatPointLimitedCritical(), [(self._potential)._fishTime] = (self._player):getCharacterStatPointLimitedFishing(), [(self._potential)._product] = (self._player):getCharacterStatPointLimitedCollection(), [(self._potential)._dropChance] = (self._player):getCharacterStatPointLimitedDropItem()}
  for key,index in pairs(self._potential) do
    if limitData[index] < currentData[index] then
      currentData[index] = limitData[index]
    end
    if index < 2 then
      (((self._ui)._staticTextPotential_Value)[index]):SetText(tostring(currentData[index] - 5) .. " " .. levelText)
      for slotIndex = 0, 4 do
        ((((self._ui)._staticPotencialPlusGrade)[index])[slotIndex]):SetShow(slotIndex < currentData[index] - 5)
      end
    else
      (((self._ui)._staticTextPotential_Value)[index]):SetText(tostring(currentData[index]) .. " " .. levelText)
      for slotIndex = 0, 4 do
        ((((self._ui)._staticPotencialPlusGrade)[index])[slotIndex]):SetShow(slotIndex < currentData[index])
      end
    end
    if isGameTypeKorea() or isGameTypeTaiwan() then
      (((self._ui)._staticTextPotential_Value)[index]):SetShow(true)
    else
      (((self._ui)._staticTextPotential_Value)[index]):SetShow(false)
    end
  end
  -- DECOMPILER ERROR: 7 unprocessed JMP targets
end

FromClient_UI_CharacterInfo_Basic_FitnessChanged = function(addSp, addWeight, addHp, addMp)
  -- function num : 0_15 , upvalues : self
  if addSp > 0 then
    FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, (self._fitness)._stamina)
  else
    if addWeight > 0 then
      FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, (self._fitness)._strength)
    else
      if addHp > 0 or addMp > 0 then
        FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, (self._fitness)._health)
      end
    end
  end
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local titleString = {[(self._fitness)._stamina] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE"), [(self._fitness)._strength] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE"), [(self._fitness)._health] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE")}
  if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
    titleString = {[(self._fitness)._stamina] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE"), [(self._fitness)._strength] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE"), [(self._fitness)._health] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE")}
  else
    titleString = {[(self._fitness)._stamina] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE_ONE"), [(self._fitness)._strength] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE_ONE"), [(self._fitness)._health] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE_ONE")}
  end
  for key,index in pairs(self._fitness) do
    local current = Int64toInt32((self._playerGet):getCurrFitnessExperiencePoint(index))
    local max = Int64toInt32((self._playerGet):getDemandFItnessExperiencePoint(index))
    local rate = current / max * 100
    local level = (self._playerGet):getFitnessLevel(index)
    ;
    (((self._ui)._progress2Fitness)[index]):SetProgressRate(rate)
    ;
    (((self._ui)._staticTextFitness_Level)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL") .. tostring(level))
    if index ~= (self._fitness)._strength then
      if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
        (((self._ui)._staticTextFitness_Title)[index]):SetText(titleString[index] .. tostring(ToClient_GetFitnessLevelStatus(index)))
      else
        ;
        (((self._ui)._staticTextFitness_Title)[index]):SetText(titleString[index])
      end
    else
      if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
        (((self._ui)._staticTextFitness_Title)[index]):SetText(titleString[index] .. tostring(ToClient_GetFitnessLevelStatus(index) / 10000))
      else
        ;
        (((self._ui)._staticTextFitness_Title)[index]):SetText(titleString[index])
      end
    end
  end
end

FromClient_UI_CharacterInfo_Basic_NormalStackChanged = function()
  -- function num : 0_16 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  local defaultCount = (self._playerGet):getEnchantFailCount()
  local valksCount = (self._playerGet):getEnchantValuePackCount()
  if ToClient_IsReceivedEnchantFailCount() then
    ((self._ui)._staticTextNormalStack):SetText(defaultCount + valksCount)
  else
    ;
    ((self._ui)._staticTextNormalStack):SetText("-")
  end
  ;
  ((self._ui)._staticTextNormalStack):addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:handleMouseOver_NormalStack( " .. defaultCount .. "," .. valksCount .. ", true )")
  ;
  ((self._ui)._staticTextNormalStack):addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:handleMouseOver_NormalStack( " .. defaultCount .. "," .. valksCount .. ", false )")
end

FromClient_UI_CharacterInfo_Basic_ScreenResize = function()
  -- function num : 0_17
  Panel_Window_CharInfo_Status:SetPosX(5)
  Panel_Window_CharInfo_Status:SetPosY(getScreenSizeY() / 2 - Panel_Window_CharInfo_Status:GetSizeY() / 2)
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleClicked_FacePhotoButton = function(self)
  -- function num : 0_18
  self:handleMouseOver_FacePhotoButton(false)
  FGlobal_InGameCustomize_SetCharacterInfo(true)
  IngameCustomize_Show()
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleClicked_Introduce = function(self)
  -- function num : 0_19
  SetFocusEdit((self._ui)._multilineEdit)
  ;
  ((self._ui)._multilineEdit):SetEditText(((self._ui)._multilineEdit):GetEditText(), true)
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleClicked_SetIntroduce = function(self)
  -- function num : 0_20
  local msg = ((self._ui)._multilineEdit):GetEditText()
  ToClient_RequestSetUserIntroduction(msg)
  local oneLineMsg = (string.gsub)(msg, "\n", " ")
  ;
  ((self._ui)._multilineEditIntroduce):SetEditText(oneLineMsg)
  ClearFocusEdit()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_MYINTRODUCE_REGIST"))
  self:showIntroduce(false)
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleClicked_ResetIntroduce = function(self)
  -- function num : 0_21
  local msg = ""
  ;
  ((self._ui)._multilineEdit):SetEditText(msg)
  ToClient_RequestSetUserIntroduction(msg)
  local oneLineMsg = (string.gsub)(msg, "\n", " ")
  ;
  ((self._ui)._multilineEditIntroduce):SetEditText(oneLineMsg)
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleMouseOver_FacePhotoButton = function(self, isShow)
  -- function num : 0_22
  if self:checkToolTip(isShow) == false then
    return 
  end
  local control, name, desc = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_FACEPHOTO_TOOLTIP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_FACEPHOTO_TOOLTIP_DESC")
  control = (self._ui)._buttonFacePhoto
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleMouseOver_FamilyPoints = function(self, isShow, tipType)
  -- function num : 0_23
  if self:checkToolTip(isShow) == false then
    return 
  end
  local string = {
[(self._familyPoint)._family] = {"LUA_FAMILYPOINTS_SUM_TOOLTIP_TITLE", "LUA_FAMILYPOINTS_SUM_TOOLTIP_DESC"}
, 
[(self._familyPoint)._combat] = {"LUA_FAMILYPOINTS_COMBAT_TOOLTIP_TITLE", "LUA_FAMILYPOINTS_COMBAT_TOOLTIP_DESC"}
, 
[(self._familyPoint)._life] = {"LUA_FAMILYPOINTS_LIFE_TOOLTIP_TITLE", "LUA_FAMILYPOINTS_LIFE_TOOLTIP_DESC"}
, 
[(self._familyPoint)._etc] = {"LUA_FAMILYPOINTS_ETC_TOOLTIP_TITLE", "LUA_FAMILYPOINTS_ETC_TOOLTIP_DESC"}
}
  local name = PAGetString(Defines.StringSheet_GAME, (string[tipType])[1])
  local desc = PAGetString(Defines.StringSheet_GAME, (string[tipType])[2])
  local control = ((self._ui)._staticTextFamilyPoints)[tipType]
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleMouseOver_NormalStack = function(self, defaultCount, valksCount, isShow)
  -- function num : 0_24
  if self:checkToolTip(isShow) == false then
    return 
  end
  local control, name, desc, isValksItemCheck = nil, nil, nil, nil
  local isValksItem = ToClient_IsContentsGroupOpen("47")
  if isValksItem == false then
    isValksItemCheck = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_ENCHANTCOUNT_TOOLTIP_ADDCOUNT_NONE", "defaultCount", tostring(defaultCount))
  else
    isValksItemCheck = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GAMEEXIT_ENCHANTCOUNT_TOOLTIP", "defaultCount", tostring(defaultCount), "valksCount", tostring(valksCount))
  end
  name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_NORMALSTACK_TOOLTIP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_NORMALSTACK_TOOLTIP_DESC") .. isValksItemCheck
  control = (self._ui)._staticTextNormalStack
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleMouseOver_Regist = function(self, isShow, tipType)
  -- function num : 0_25
  if self:checkToolTip(isShow) == false then
    return 
  end
  local string = {
[(self._regist)._sturn] = {"LUA_CHARACTERINFO_TXT_REGIST_STUN_TOOLTIP_NAME", "LUA_CHARACTERINFO_TXT_REGIST_STUN_TOOLTIP_DESC"}
, 
[(self._regist)._down] = {"LUA_CHARACTERINFO_TXT_REGIST_DOWN_TOOLTIP_NAME", "LUA_CHARACTERINFO_TXT_REGIST_DOWN_TOOLTIP_DESC"}
, 
[(self._regist)._capture] = {"LUA_CHARACTERINFO_TXT_REGIST_CAPTURE_TOOLTIP_NAME", "LUA_CHARACTERINFO_TXT_REGIST_CAPTURE_TOOLTIP_DESC"}
, 
[(self._regist)._knockBack] = {"LUA_CHARACTERINFO_TXT_REGIST_KNOCKBACK_TOOLTIP_NAME", "LUA_CHARACTERINFO_TXT_REGIST_KNOCKBACK_TOOLTIP_DESC"}
}
  local control, name, desc = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, (string[tipType])[1])
  desc = PAGetString(Defines.StringSheet_GAME, (string[tipType])[2])
  control = ((self._ui)._staticTextResist_Title)[tipType]
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleMouseOver_Fitness = function(self, isShow, _tipType)
  -- function num : 0_26
  if self:checkToolTip(isShow) == false then
    return 
  end
  local control, name, desc = nil, nil, nil
  if (self._fitness)._stamina == _tipType then
    control = ((self._ui)._staticTextFitness_Title)[(self._fitness)._stamina]
    name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FITNESS_STAMINA_MSG", "type", tostring(ToClient_GetFitnessLevelStatus(_tipType)))
  else
    if (self._fitness)._strength == _tipType then
      control = ((self._ui)._staticTextFitness_Title)[(self._fitness)._strength]
      name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FITNESS_STRENGTH_MSG", "type", tostring(ToClient_GetFitnessLevelStatus(_tipType) / 10000))
    else
      if (self._fitness)._health == _tipType then
        control = ((self._ui)._staticTextFitness_Title)[(self._fitness)._health]
        name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FITNESS_HEALTH_MSG", "type", tostring(ToClient_GetFitnessLevelStatus(_tipType)))
      else
        return 
      end
    end
  end
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleMouseOver_Potential = function(self, isShow, _tipType)
  -- function num : 0_27 , upvalues : Class_BattleSpeed
  if self:checkToolTip(isShow) == false then
    return 
  end
  local classType = (self._player):getClassType()
  local string = {[(self._potential)._attackSpeed] = "LUA_CHARACTERINFO_TXT_DESC_" .. Class_BattleSpeed[classType], [(self._potential)._moveSpeed] = "LUA_CHARACTERINFO_TXT_DESC_2", [(self._potential)._critical] = "LUA_CHARACTERINFO_TXT_DESC_3", [(self._potential)._fishTime] = "LUA_CHARACTERINFO_TXT_DESC_4", [(self._potential)._product] = "LUA_CHARACTERINFO_TXT_DESC_5", [(self._potential)._dropChance] = "LUA_CHARACTERINFO_TXT_DESC_6"}
  local control, name, desc = nil, nil, nil
  control = ((self._ui)._staticTextPotential_Title)[_tipType]
  name = PAGetString(Defines.StringSheet_GAME, string[_tipType])
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleMouseOver_CharInfomation = function(self, isShow, _tipType)
  -- function num : 0_28 , upvalues : CombatType
  if self:checkToolTip(isShow) == false then
    return 
  end
  local control, name, desc = nil, nil, nil
  control = ((self._ui)._staticStatus_Title)[_tipType]
  if (self._status)._health == _tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_HPREGEN") .. " : " .. tostring((self._playerGet):getRegenHp())
  else
    if (self._status)._mental == _tipType then
      local mentalType = (self._player):getCombatResourceType()
      if CombatType.CombatType_MP == mentalType then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MPREGEN") .. " : " .. tostring((self._playerGet):getRegenMp())
      else
        if CombatType.CombatType_FP == mentalType then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_FPREGEN") .. " : " .. tostring((self._playerGet):getRegenMp())
        else
          if CombatType.CombatType_EP == mentalType then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_EPREGEN") .. " : " .. tostring((self._playerGet):getRegenMp())
          else
            if CombatType.CombatType_BP == mentalType then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_BPREGEN") .. " : " .. tostring((self._playerGet):getRegenMp())
            end
          end
        end
      end
    else
      do
        if (self._status)._weight == _tipType then
          name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_WEIGHT_TOOLTIP")
        end
        TooltipSimple_Show(control, name, desc)
      end
    end
  end
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleMouseOver_Craft = function(self, isShow, _slotNo)
  -- function num : 0_29 , upvalues : UI_LifeString, UI_LifeToolTip
  if self:checkToolTip(isShow) == false then
    return 
  end
  if _slotNo == 0 then
    return 
  end
  local tableNo = _slotNo + 1
  local control, name, desc = nil, nil, nil
  local expRate = ((self._craftTable)[_slotNo])._exp * toInt64(0, 100) / ((self._craftTable)[_slotNo])._maxExp
  name = UI_LifeString[((self._craftTable)[_slotNo])._type]
  desc = UI_LifeToolTip[((self._craftTable)[_slotNo])._type] .. "\n<PAColor0xFFFFF3AF>" .. PAGetString(Defines.StringSheet_RESOURCE, "SERVANT_INFO_TEXT_EXP") .. " : " .. tostring(expRate) .. "%<PAOldColor>"
  control = ((self._ui)._staticTextCraft_Title)[_slotNo]
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.handleMouseOver_Tooltip = function(self, isShow, tipType, controlIndex)
  -- function num : 0_30 , upvalues : UI_LifeString
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  if tipType == nil then
    TooltipSimple_Hide()
    return 
  end
  if controlIndex == nil then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  name = UI_LifeString[tipType]
  control = ((self._ui)._staticCraftIcon)[controlIndex]
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC122: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.showWindow = function(self)
  -- function num : 0_31
  self:showIntroduce(false)
  self:update()
end

-- DECOMPILER ERROR at PC125: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.hideWindow = function(self)
  -- function num : 0_32
  TooltipSimple_Hide()
  self._toolTipCount = 0
end

-- DECOMPILER ERROR at PC128: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.showIntroduce = function(self, isShow)
  -- function num : 0_33
  ((self._ui)._staticIntroduceBG):SetShow(isShow)
  if not isShow then
    (UI.ClearFocusEdit)()
    return 
  end
  local msg = ToClient_GetUserIntroduction()
  ;
  ((self._ui)._multilineEdit):SetEditText(msg)
end

-- DECOMPILER ERROR at PC131: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.checkToolTip = function(self, isShow)
  -- function num : 0_34
  if isShow == false then
    self._toolTipCount = self._toolTipCount - 1
    if self._toolTipCount < 1 then
      self._toolTipCount = 0
      TooltipSimple_Hide()
    end
    return false
  else
    self._toolTipCount = self._toolTipCount + 1
    return true
  end
end

-- DECOMPILER ERROR at PC135: Confused about usage of register: R10 in 'UnsetPending'

PaGlobal_CharacterInfoBasic.updateFacePhoto = function(self)
  -- function num : 0_35 , upvalues : UI_DefaultFaceTexture
  local classType = (self._player):getClassType()
  local TextureName = ToClient_GetCharacterFaceTexturePath((self._player):getCharacterNo_64())
  local isCaptureExist = ((self._ui)._staticCharSlot):ChangeTextureInfoNameNotDDS(TextureName, classType, true)
  if isCaptureExist == true then
    (((self._ui)._staticCharSlot):getBaseTexture()):setUV(0, 0, 1, 1)
  else
    local DefaultFace = UI_DefaultFaceTexture[classType]
    ;
    ((self._ui)._staticCharSlot):ChangeTextureInfoName(DefaultFace[1])
    local x1, y1, x2, y2 = setTextureUV_Func((self._ui)._staticCharSlot, DefaultFace[2], DefaultFace[3], DefaultFace[4], DefaultFace[5])
    ;
    (((self._ui)._staticCharSlot):getBaseTexture()):setUV(x1, y1, x2, y2)
  end
  do
    ;
    ((self._ui)._staticCharSlot):setRenderTexture(((self._ui)._staticCharSlot):getBaseTexture())
  end
end


