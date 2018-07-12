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
function FromClient_UI_CharacterInfo_Basic_TendencyChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local tendency = self._playerGet:getTendency()
  self._ui._staticTextTendency_Value:SetText(tostring(tendency))
end
function FromClient_UI_CharacterInfo_Basic_MentalChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local mental = self._player:getWp()
  local maxMental = self._player:getMaxWp()
  self._ui._staticTextMental_Value:SetText(tostring(mental) .. " / " .. tostring(maxMental))
end
function FromClient_UI_CharacterInfo_Basic_ContributionChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local territoryKeyRaw = ToClient_getDefaultTerritoryKey()
  local contribution = ToClient_getExplorePointByTerritoryRaw(territoryKeyRaw)
  local remainContribution = contribution:getRemainedPoint()
  local aquiredContribution = contribution:getAquiredPoint()
  self._ui._staticTextContribution_Value:SetText(tostring(remainContribution) .. " / " .. tostring(aquiredContribution))
end
function FromClient_UI_CharacterInfo_Basic_LevelChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local ChaLevel = self._playerGet:getLevel()
  self._ui._staticClassSymbol:SetText("Lv " .. tostring(ChaLevel))
end
function FromClient_UI_CharacterInfo_Basic_HpChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local hp = self._playerGet:getHp()
  local maxHp = self._playerGet:getMaxHp()
  local hpRate = hp / maxHp * 100
  self._ui._staticStatus_Value[self._status._health]:SetText(tostring(hp) .. " / " .. tostring(maxHp))
  self._ui._progress2Status[self._status._health]:SetProgressRate(hpRate)
end
function FromClient_UI_CharacterInfo_Basic_MpChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local mp = self._playerGet:getMp()
  local maxMp = self._playerGet:getMaxMp()
  local MpRate = mp / maxMp * 100
  self._ui._staticStatus_Value[self._status._mental]:SetText(tostring(mp) .. " / " .. tostring(maxMp))
  self._ui._progress2Status[self._status._mental]:SetProgressRate(MpRate)
end
function FromClient_UI_CharacterInfo_Basic_WeightChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local _const = Defines.s64_const
  local s64_moneyWeight = self._playerGet:getInventory():getMoneyWeight_s64()
  local s64_equipmentWeight = self._playerGet:getEquipment():getWeight_s64()
  local s64_allWeight = self._playerGet:getCurrentWeight_s64()
  local s64_maxWeight = self._playerGet:getPossessableWeight_s64()
  local s64_allWeight_div = s64_allWeight / _const.s64_100
  local s64_maxWeight_div = s64_maxWeight / _const.s64_100
  local str_AllWeight = string.format("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local str_MaxWeight = string.format("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  if s64_allWeight_div <= s64_maxWeight_div then
    self._ui._progress2WeightMoney:SetProgressRate(Int64toInt32(s64_moneyWeight / s64_maxWeight_div))
    self._ui._progress2WeightEquip:SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_maxWeight_div))
    self._ui._progress2Status[self._status._weight]:SetProgressRate(Int64toInt32(s64_allWeight / s64_maxWeight_div))
  else
    self._ui._progress2WeightMoney:SetProgressRate(Int64toInt32(s64_moneyWeight / s64_allWeight_div))
    self._ui._progress2WeightEquip:SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_allWeight_div))
    self._ui._progress2Status[self._status._weight]:SetProgressRate(Int64toInt32(s64_allWeight / s64_allWeight_div))
  end
  self._ui._staticStatus_Value[self._status._weight]:SetText(tostring(str_AllWeight) .. " / " .. tostring(str_MaxWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end
function FromClient_UI_CharacterInfo_Basic_AttackChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  ToClient_updateAttackStat()
  local chaAttack = ToClient_getOffence()
  self._ui._staticTextAttack_Value:SetText(tostring(chaAttack))
  local isShow = 0 == ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.CharacterInfo)
  local isSetAwakenWeapon = ToClient_getEquipmentItem(CppEnums.EquipSlotNo.awakenWeapon)
  if nil ~= isSetAwakenWeapon then
    local chaAwakenAttack = ToClient_getAwakenOffence()
    self._ui._staticTextAwakenAttack_Title:SetShow(isShow)
    self._ui._staticTextAwakenAttack_Value:SetText(tostring(chaAwakenAttack))
    self._ui._staticTextDefence_Title:SetSpanSize(207, 154)
    self._ui._staticTextStamina_Title:SetSpanSize(207, 180)
  else
    self._ui._staticTextAwakenAttack_Title:SetShow(false)
    self._ui._staticTextDefence_Title:SetSpanSize(207, 128)
    self._ui._staticTextStamina_Title:SetSpanSize(207, 154)
  end
  local chaDefence = ToClient_getDefence()
  self._ui._staticTextDefence_Value:SetText(tostring(chaDefence))
end
function FromClient_UI_CharacterInfo_Basic_StaminaChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local maxStamina = self._playerGet:getStamina():getMaxSp()
  self._ui._staticTextStamina_Value:SetText(tostring(maxStamina))
end
function FromClient_UI_CharacterInfo_Basic_SkillPointChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local skillPointInfo = ToClient_getSkillPointInfo(0)
  if nil ~= skillPointInfo then
    self._ui._staticTextSkillPoint_Value:SetText(tostring(skillPointInfo._remainPoint .. " / " .. skillPointInfo._acquirePoint))
  end
end
function FromClient_UI_CharacterInfo_Basic_FamilyPointsChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local battleFP = self._playerGet:getBattleFamilyPoint()
  local lifeFP = self._playerGet:getLifeFamilyPoint()
  local etcFP = self._playerGet:getEtcFamilyPoint()
  local sumFP = battleFP + lifeFP + etcFP
  self._ui._staticTextFamilyPoints[self._familyPoint._family]:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FAMILYPOINT_TITLE", "familyPoint", tostring(sumFP)))
  self._ui._staticTextFamilyPoints[self._familyPoint._combat]:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARINFO_BATTLEPOINT", "value", tostring(battleFP)))
  self._ui._staticTextFamilyPoints[self._familyPoint._life]:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARINFO_LIFEPOINT", "value", tostring(lifeFP)))
  self._ui._staticTextFamilyPoints[self._familyPoint._etc]:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARINFO_ETCPOINT", "value", tostring(etcFP)))
end
function FromClient_UI_CharacterInfo_Basic_ResistChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local data = {
    [self._regist._sturn] = self._player:getStunResistance(),
    [self._regist._down] = self._player:getKnockdownResistance(),
    [self._regist._capture] = self._player:getCatchResistance(),
    [self._regist._knockBack] = self._player:getKnockbackResistance()
  }
  for key, index in pairs(self._regist) do
    self._ui._progress2Resist[index]:SetProgressRate(math.floor(data[index] / 10000))
    self._ui._staticTextResist_Percent[index]:SetText(math.floor(data[index] / 10000) .. "%")
  end
end
function FromClient_UI_CharacterInfo_Basic_CraftLevelChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local self = PaGlobal_CharacterInfoBasic
  for index = 1, 10 do
    local craftType = index - 1
    if nil ~= self._ui._lifeInfo[index]._level then
      self._ui._lifeInfo[index]._level:SetText(FGlobal_UI_CharacterInfo_Basic_Global_CraftLevelReplace(self._playerGet:getLifeExperienceLevel(craftType)))
      self._ui._lifeInfo[index]._level:SetFontColor(FGlobal_UI_CharacterInfo_Basic_Global_CraftColorReplace(self._playerGet:getLifeExperienceLevel(craftType)))
      self._ui._lifeInfo[index]._title:SetText(UI_LifeString[craftType])
      local ExpRate = Int64toInt32(self._playerGet:getCurrLifeExperiencePoint(craftType) * toInt64(0, 100) / self._playerGet:getDemandLifeExperiencePoint(craftType))
      self._ui._lifeInfo[index]._progress:SetProgressRate(ExpRate)
      self._ui._lifeInfo[index]._percent:SetText(ExpRate .. "%")
    end
  end
end
function FromClient_UI_CharacterInfo_Basic_RankChanged()
  if self._requestRank == false then
    return
  end
  self._requestRank = false
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local bestRank = ToClient_GetLifeMyRank()
  if bestRank > 0 and bestRank < 31 then
    local bestTitle = UI_LifeString[self._sortCraftTable[1]._type] .. "( " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LIFERANKING_RANK", "listIdx", bestRank) .. " )"
    self._ui._staticTextCraft_Title[0]:SetText(bestTitle)
  end
end
function FromClient_UI_CharacterInfo_Basic_PotentialChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local levelText = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_POTENLEVEL")
  local classType = self._player:getClassType()
  local currentData = {
    [self._potential._moveSpeed] = self._player:characterStatPointSpeed(self._potential._moveSpeed),
    [self._potential._attackSpeed] = self._player:characterStatPointSpeed(self._potential._attackSpeed + Class_BattleSpeed[classType]),
    [self._potential._critical] = self._player:characterStatPointCritical(),
    [self._potential._fishTime] = self._player:getCharacterStatPointFishing(),
    [self._potential._product] = self._player:getCharacterStatPointCollection(),
    [self._potential._dropChance] = self._player:getCharacterStatPointDropItem()
  }
  local limitData = {
    [self._potential._moveSpeed] = self._player:characterStatPointLimitedSpeed(self._potential._moveSpeed),
    [self._potential._attackSpeed] = self._player:characterStatPointLimitedSpeed(self._potential._attackSpeed + Class_BattleSpeed[classType]),
    [self._potential._critical] = self._player:characterStatPointLimitedCritical(),
    [self._potential._fishTime] = self._player:getCharacterStatPointLimitedFishing(),
    [self._potential._product] = self._player:getCharacterStatPointLimitedCollection(),
    [self._potential._dropChance] = self._player:getCharacterStatPointLimitedDropItem()
  }
  for key, index in pairs(self._potential) do
    if limitData[index] < currentData[index] then
      currentData[index] = limitData[index]
    end
    if index < 2 then
      self._ui._staticTextPotential_Value[index]:SetText(tostring(currentData[index] - 5) .. " " .. levelText)
      for slotIndex = 0, 4 do
        self._ui._staticPotencialPlusGrade[index][slotIndex]:SetShow(slotIndex < currentData[index] - 5)
      end
    else
      self._ui._staticTextPotential_Value[index]:SetText(tostring(currentData[index]) .. " " .. levelText)
      for slotIndex = 0, 4 do
        self._ui._staticPotencialPlusGrade[index][slotIndex]:SetShow(slotIndex < currentData[index])
      end
    end
    if isGameTypeKorea() or isGameTypeTaiwan() then
      self._ui._staticTextPotential_Value[index]:SetShow(true)
    else
      self._ui._staticTextPotential_Value[index]:SetShow(false)
    end
  end
end
function FromClient_UI_CharacterInfo_Basic_FitnessChanged(addSp, addWeight, addHp, addMp)
  if addSp > 0 then
    FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, self._fitness._stamina)
  elseif addWeight > 0 then
    FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, self._fitness._strength)
  elseif addHp > 0 or addMp > 0 then
    FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, self._fitness._health)
  end
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local titleString = {
    [self._fitness._stamina] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE"),
    [self._fitness._strength] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE"),
    [self._fitness._health] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE")
  }
  if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
    titleString = {
      [self._fitness._stamina] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE"),
      [self._fitness._strength] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE"),
      [self._fitness._health] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE")
    }
  else
    titleString = {
      [self._fitness._stamina] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE_ONE"),
      [self._fitness._strength] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE_ONE"),
      [self._fitness._health] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE_ONE")
    }
  end
  for key, index in pairs(self._fitness) do
    local current = Int64toInt32(self._playerGet:getCurrFitnessExperiencePoint(index))
    local max = Int64toInt32(self._playerGet:getDemandFItnessExperiencePoint(index))
    local rate = current / max * 100
    local level = self._playerGet:getFitnessLevel(index)
    self._ui._progress2Fitness[index]:SetProgressRate(rate)
    self._ui._staticTextFitness_Level[index]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL") .. tostring(level))
    if index ~= self._fitness._strength then
      if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
        self._ui._staticTextFitness_Title[index]:SetText(titleString[index] .. tostring(ToClient_GetFitnessLevelStatus(index)))
      else
        self._ui._staticTextFitness_Title[index]:SetText(titleString[index])
      end
    elseif isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
      self._ui._staticTextFitness_Title[index]:SetText(titleString[index] .. tostring(ToClient_GetFitnessLevelStatus(index) / 10000))
    else
      self._ui._staticTextFitness_Title[index]:SetText(titleString[index])
    end
  end
end
function FromClient_UI_CharacterInfo_Basic_NormalStackChanged()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local defaultCount = self._playerGet:getEnchantFailCount()
  local valksCount = self._playerGet:getEnchantValuePackCount()
  if ToClient_IsReceivedEnchantFailCount() then
    self._ui._staticTextNormalStack:SetText(defaultCount + valksCount)
  else
    self._ui._staticTextNormalStack:SetText("-")
  end
  self._ui._staticTextNormalStack:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:handleMouseOver_NormalStack( " .. defaultCount .. "," .. valksCount .. ", true )")
  self._ui._staticTextNormalStack:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:handleMouseOver_NormalStack( " .. defaultCount .. "," .. valksCount .. ", false )")
end
function FromClient_UI_CharacterInfo_Basic_ScreenResize()
  Panel_Window_CharInfo_Status:SetPosX(5)
  Panel_Window_CharInfo_Status:SetPosY(getScreenSizeY() / 2 - Panel_Window_CharInfo_Status:GetSizeY() / 2)
end
function PaGlobal_CharacterInfoBasic:handleClicked_FacePhotoButton()
  self:handleMouseOver_FacePhotoButton(false)
  FGlobal_InGameCustomize_SetCharacterInfo(true)
  IngameCustomize_Show()
end
function PaGlobal_CharacterInfoBasic:handleClicked_Introduce()
  SetFocusEdit(self._ui._multilineEdit)
  self._ui._multilineEdit:SetEditText(self._ui._multilineEdit:GetEditText(), true)
end
function PaGlobal_CharacterInfoBasic:handleClicked_SetIntroduce()
  local msg = self._ui._multilineEdit:GetEditText()
  ToClient_RequestSetUserIntroduction(msg)
  local oneLineMsg = string.gsub(msg, "\n", " ")
  self._ui._multilineEditIntroduce:SetEditText(oneLineMsg)
  ClearFocusEdit()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_MYINTRODUCE_REGIST"))
  self:showIntroduce(false)
end
function PaGlobal_CharacterInfoBasic:handleClicked_ResetIntroduce()
  local msg = ""
  self._ui._multilineEdit:SetEditText(msg)
  ToClient_RequestSetUserIntroduction(msg)
  local oneLineMsg = string.gsub(msg, "\n", " ")
  self._ui._multilineEditIntroduce:SetEditText(oneLineMsg)
  ClearFocusEdit()
end
function PaGlobal_CharacterInfoBasic:handleMouseOver_FacePhotoButton(isShow)
  if self:checkToolTip(isShow) == false then
    return
  end
  local control, name, desc
  name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_FACEPHOTO_TOOLTIP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_FACEPHOTO_TOOLTIP_DESC")
  control = self._ui._buttonFacePhoto
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_CharacterInfoBasic:handleMouseOver_FamilyPoints(isShow, tipType)
  if self:checkToolTip(isShow) == false then
    return
  end
  local string = {
    [self._familyPoint._family] = {
      "LUA_FAMILYPOINTS_SUM_TOOLTIP_TITLE",
      "LUA_FAMILYPOINTS_SUM_TOOLTIP_DESC"
    },
    [self._familyPoint._combat] = {
      "LUA_FAMILYPOINTS_COMBAT_TOOLTIP_TITLE",
      "LUA_FAMILYPOINTS_COMBAT_TOOLTIP_DESC"
    },
    [self._familyPoint._life] = {
      "LUA_FAMILYPOINTS_LIFE_TOOLTIP_TITLE",
      "LUA_FAMILYPOINTS_LIFE_TOOLTIP_DESC"
    },
    [self._familyPoint._etc] = {
      "LUA_FAMILYPOINTS_ETC_TOOLTIP_TITLE",
      "LUA_FAMILYPOINTS_ETC_TOOLTIP_DESC"
    }
  }
  local name = PAGetString(Defines.StringSheet_GAME, string[tipType][1])
  local desc = PAGetString(Defines.StringSheet_GAME, string[tipType][2])
  local control = self._ui._staticTextFamilyPoints[tipType]
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_CharacterInfoBasic:handleMouseOver_NormalStack(defaultCount, valksCount, isShow)
  if self:checkToolTip(isShow) == false then
    return
  end
  local control, name, desc, isValksItemCheck
  local isValksItem = ToClient_IsContentsGroupOpen("47")
  if isValksItem == false then
    isValksItemCheck = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_ENCHANTCOUNT_TOOLTIP_ADDCOUNT_NONE", "defaultCount", tostring(defaultCount))
  else
    isValksItemCheck = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GAMEEXIT_ENCHANTCOUNT_TOOLTIP", "defaultCount", tostring(defaultCount), "valksCount", tostring(valksCount))
  end
  name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_NORMALSTACK_TOOLTIP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_NORMALSTACK_TOOLTIP_DESC") .. isValksItemCheck
  control = self._ui._staticTextNormalStack
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_CharacterInfoBasic:handleMouseOver_Regist(isShow, tipType)
  if self:checkToolTip(isShow) == false then
    return
  end
  local string = {
    [self._regist._sturn] = {
      "LUA_CHARACTERINFO_TXT_REGIST_STUN_TOOLTIP_NAME",
      "LUA_CHARACTERINFO_TXT_REGIST_STUN_TOOLTIP_DESC"
    },
    [self._regist._down] = {
      "LUA_CHARACTERINFO_TXT_REGIST_DOWN_TOOLTIP_NAME",
      "LUA_CHARACTERINFO_TXT_REGIST_DOWN_TOOLTIP_DESC"
    },
    [self._regist._capture] = {
      "LUA_CHARACTERINFO_TXT_REGIST_CAPTURE_TOOLTIP_NAME",
      "LUA_CHARACTERINFO_TXT_REGIST_CAPTURE_TOOLTIP_DESC"
    },
    [self._regist._knockBack] = {
      "LUA_CHARACTERINFO_TXT_REGIST_KNOCKBACK_TOOLTIP_NAME",
      "LUA_CHARACTERINFO_TXT_REGIST_KNOCKBACK_TOOLTIP_DESC"
    }
  }
  local control, name, desc
  name = PAGetString(Defines.StringSheet_GAME, string[tipType][1])
  desc = PAGetString(Defines.StringSheet_GAME, string[tipType][2])
  control = self._ui._staticTextResist_Title[tipType]
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_CharacterInfoBasic:handleMouseOver_Fitness(isShow, _tipType)
  if self:checkToolTip(isShow) == false then
    return
  end
  local control, name, desc
  if self._fitness._stamina == _tipType then
    control = self._ui._staticTextFitness_Title[self._fitness._stamina]
    name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FITNESS_STAMINA_MSG", "type", tostring(ToClient_GetFitnessLevelStatus(_tipType)))
  elseif self._fitness._strength == _tipType then
    control = self._ui._staticTextFitness_Title[self._fitness._strength]
    name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FITNESS_STRENGTH_MSG", "type", tostring(ToClient_GetFitnessLevelStatus(_tipType) / 10000))
  elseif self._fitness._health == _tipType then
    control = self._ui._staticTextFitness_Title[self._fitness._health]
    name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FITNESS_HEALTH_MSG", "type", tostring(ToClient_GetFitnessLevelStatus(_tipType)))
  else
    return
  end
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_CharacterInfoBasic:handleMouseOver_Potential(isShow, _tipType)
  if self:checkToolTip(isShow) == false then
    return
  end
  local classType = self._player:getClassType()
  local string = {
    [self._potential._attackSpeed] = "LUA_CHARACTERINFO_TXT_DESC_" .. Class_BattleSpeed[classType],
    [self._potential._moveSpeed] = "LUA_CHARACTERINFO_TXT_DESC_2",
    [self._potential._critical] = "LUA_CHARACTERINFO_TXT_DESC_3",
    [self._potential._fishTime] = "LUA_CHARACTERINFO_TXT_DESC_4",
    [self._potential._product] = "LUA_CHARACTERINFO_TXT_DESC_5",
    [self._potential._dropChance] = "LUA_CHARACTERINFO_TXT_DESC_6"
  }
  local control, name, desc
  control = self._ui._staticTextPotential_Title[_tipType]
  name = PAGetString(Defines.StringSheet_GAME, string[_tipType])
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_CharacterInfoBasic:handleMouseOver_CharInfomation(isShow, _tipType)
  if self:checkToolTip(isShow) == false then
    return
  end
  local control, name, desc
  control = self._ui._staticStatus_Title[_tipType]
  if self._status._health == _tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_HPREGEN") .. " : " .. tostring(self._playerGet:getRegenHp())
  elseif self._status._mental == _tipType then
    local mentalType = self._player:getCombatResourceType()
    if CombatType.CombatType_MP == mentalType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MPREGEN") .. " : " .. tostring(self._playerGet:getRegenMp())
    elseif CombatType.CombatType_FP == mentalType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_FPREGEN") .. " : " .. tostring(self._playerGet:getRegenMp())
    elseif CombatType.CombatType_EP == mentalType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_EPREGEN") .. " : " .. tostring(self._playerGet:getRegenMp())
    elseif CombatType.CombatType_BP == mentalType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_BPREGEN") .. " : " .. tostring(self._playerGet:getRegenMp())
    end
  elseif self._status._weight == _tipType then
    name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_WEIGHT_TOOLTIP")
  end
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_CharacterInfoBasic:handleMouseOver_Craft(isShow, _slotNo)
  if self:checkToolTip(isShow) == false then
    return
  end
  if 0 == _slotNo then
    return
  end
  local tableNo = _slotNo + 1
  local control, name, desc
  local expRate = self._craftTable[_slotNo]._exp * toInt64(0, 100) / self._craftTable[_slotNo]._maxExp
  name = UI_LifeString[self._craftTable[_slotNo]._type]
  desc = UI_LifeToolTip[self._craftTable[_slotNo]._type] .. [[

<PAColor0xFFFFF3AF>]] .. PAGetString(Defines.StringSheet_RESOURCE, "SERVANT_INFO_TEXT_EXP") .. " : " .. tostring(expRate) .. "%<PAOldColor>"
  control = self._ui._staticTextCraft_Title[_slotNo]
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_CharacterInfoBasic:handleMouseOver_Tooltip(isShow, tipType, controlIndex)
  if not isShow then
    TooltipSimple_Hide()
    return
  end
  if nil == tipType then
    TooltipSimple_Hide()
    return
  end
  if nil == controlIndex then
    TooltipSimple_Hide()
    return
  end
  local name, desc, control
  name = UI_LifeString[tipType]
  control = self._ui._staticCraftIcon[controlIndex]
  TooltipSimple_Show(control, name, desc)
end
function PaGlobal_CharacterInfoBasic:showWindow()
  self:showIntroduce(false)
  self:update()
end
function PaGlobal_CharacterInfoBasic:hideWindow()
  TooltipSimple_Hide()
  self._toolTipCount = 0
end
function PaGlobal_CharacterInfoBasic:showIntroduce(isShow)
  self._ui._staticIntroduceBG:SetShow(isShow)
  if not isShow then
    UI.ClearFocusEdit()
    return
  end
  local msg = ToClient_GetUserIntroduction()
  self._ui._multilineEdit:SetEditText(msg)
end
function PaGlobal_CharacterInfoBasic:checkToolTip(isShow)
  if false == isShow then
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
function PaGlobal_CharacterInfoBasic:updateFacePhoto()
  local classType = self._player:getClassType()
  local TextureName = ToClient_GetCharacterFaceTexturePath(self._player:getCharacterNo_64())
  local isCaptureExist = self._ui._staticCharSlot:ChangeTextureInfoNameNotDDS(TextureName, classType, true)
  if isCaptureExist == true then
    self._ui._staticCharSlot:getBaseTexture():setUV(0, 0, 1, 1)
  else
    local DefaultFace = UI_DefaultFaceTexture[classType]
    self._ui._staticCharSlot:ChangeTextureInfoName(DefaultFace[1])
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui._staticCharSlot, DefaultFace[2], DefaultFace[3], DefaultFace[4], DefaultFace[5])
    self._ui._staticCharSlot:getBaseTexture():setUV(x1, y1, x2, y2)
  end
  self._ui._staticCharSlot:setRenderTexture(self._ui._staticCharSlot:getBaseTexture())
end
PaGlobal_Char_LifeInfo = {
  _lifeInfo = {},
  _lifeType_Panel_Name = {
    [__ePlayerLifeStatType_Collecting] = "Static_Bg_Gathering",
    [__ePlayerLifeStatType_Fishing] = "Static_Bg_Fishing",
    [__ePlayerLifeStatType_Hunting] = "Static_Bg_Hunting",
    [__ePlayerLifeStatType_Cooking] = "Static_Bg_Cook",
    [__ePlayerLifeStatType_Alchemy] = "Static_Bg_Alchemy",
    [__ePlayerLifeStatType_Manufacture] = "Static_Bg_Manufacture",
    [__ePlayerLifeStatType_Training] = "Static_Bg_TrainingHorse",
    [__ePlayerLifeStatType_Trade] = "Static_Bg_Trade",
    [__ePlayerLifeStatType_Harvest] = "Static_Bg_Gardening",
    [__ePlayerLifeStatType_Sail] = "Static_Bg_Sailing"
  },
  _lifeSubTypeCount = {
    [__ePlayerLifeStatType_Collecting] = __eCollectingStatType_Count,
    [__ePlayerLifeStatType_Fishing] = __eFishingStatType_Count,
    [__ePlayerLifeStatType_Hunting] = __eHuntingStatType_Count,
    [__ePlayerLifeStatType_Cooking] = __eCookingStatType_Count,
    [__ePlayerLifeStatType_Alchemy] = __eAlchemyStatType_Count,
    [__ePlayerLifeStatType_Manufacture] = __eManufacturingStatType_Count,
    [__ePlayerLifeStatType_Training] = __eTrainingStatType_Count,
    [__ePlayerLifeStatType_Trade] = __eTradeStatType_Count,
    [__ePlayerLifeStatType_Harvest] = __eFarmingStatType_Count,
    [__ePlayerLifeStatType_Sail] = __eSailStatType_Count
  }
}
function PaGlobal_Char_LifeInfo:Init()
  for key, value in pairs(self._lifeType_Panel_Name) do
    self._lifeInfo[key] = {}
    self._lifeInfo[key]._ui = {}
    self._lifeInfo[key]._ui._subCategoryTitle = {}
    self._lifeInfo[key]._ui._subCategoryPoint = {}
    self._lifeInfo[key]._ui._parent = UI.getChildControl(Panel_Window_CharInfo_LifeInfo, value)
    self._lifeInfo[key]._ui._commonPoint = UI.getChildControl(self._lifeInfo[key]._ui._parent, "StaticText_LifePoint")
    self._lifeInfo[key]._ui._progressBar = UI.getChildControl(self._lifeInfo[key]._ui._parent, "Progress2_Exp")
    self._lifeInfo[key]._ui._expText = UI.getChildControl(self._lifeInfo[key]._ui._parent, "StaticText_Percent")
    self._lifeInfo[key]._ui._levelText = UI.getChildControl(self._lifeInfo[key]._ui._parent, "StaticText_Level")
    self._lifeInfo[key]._ui._progressBG = UI.getChildControl(self._lifeInfo[key]._ui._parent, "Static_ProgressBg")
    local count = self._lifeSubTypeCount[key] - 1
    if __ePlayerLifeStatType_Collecting == key then
      count = self._lifeSubTypeCount[key]
    end
    for ii = 1, count do
      if nil == self._lifeInfo[key] then
      else
        local titleControlName = "StaticText_SubCetegoryTitle" .. tostring(ii)
        local pointControlName = "StaticText_SubCategoryValue" .. tostring(ii)
        self._lifeInfo[key]._ui._subCategoryTitle[ii] = UI.getChildControl(self._lifeInfo[key]._ui._parent, titleControlName)
        self._lifeInfo[key]._ui._subCategoryPoint[ii] = UI.getChildControl(self._lifeInfo[key]._ui._parent, pointControlName)
      end
    end
    self._lifeInfo[key]._ui._progressBG:addInputEvent("Mouse_On", "PaGlobal_Char_LifeInfo:Life_MouseOverEvent(" .. key .. ",true)")
    self._lifeInfo[key]._ui._progressBG:addInputEvent("Mouse_Out", "PaGlobal_Char_LifeInfo:Life_MouseOverEvent(" .. key .. ",false)")
  end
end
function FromClient_UI_CharacterInfo_Basic_LifeLevelChangeNew()
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return
  end
  local self = PaGlobal_Char_LifeInfo
  local isSailOpen = ToClient_IsContentsGroupOpen("83")
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  for key, value in pairs(self._lifeType_Panel_Name) do
    local currentLevel = selfPlayer:get():getLifeExperienceLevel(key)
    local currentExp = selfPlayer:get():getCurrLifeExperiencePoint(key)
    local needExp = selfPlayer:get():getDemandLifeExperiencePoint(key)
    local currentExpRate = Int64toInt32(currentExp * toInt64(0, 100) / needExp)
    local currentExpRateString = string.format("%.1f", currentExpRate)
    self._lifeInfo[key]._ui._levelText:SetText(FGlobal_UI_CharacterInfo_Basic_Global_CraftLevelReplace(currentLevel))
    self._lifeInfo[key]._ui._levelText:SetFontColor(FGlobal_UI_CharacterInfo_Basic_Global_CraftColorReplace(currentLevel))
    self._lifeInfo[key]._ui._progressBar:SetProgressRate(currentExpRate)
    self._lifeInfo[key]._ui._expText:SetText(currentExpRateString .. "%")
    local commonPoint = ToClient_GetCommonLifeStat(key)
    local commonPointString = PAGetString(Defines.StringSheet_GAME, "LUA_CHARINFO_COMMONLIFESTAT") .. " " .. tostring(commonPoint)
    self._lifeInfo[key]._ui._commonPoint:SetText(commonPointString)
    for ii = 1, self._lifeSubTypeCount[key] - 1 do
      if nil ~= self._lifeInfo[key]._ui._subCategoryPoint[ii] then
        local subPoint = selfPlayer:get():getLifeStat(key, ii)
        self._lifeInfo[key]._ui._subCategoryPoint[ii]:SetText(tostring(subPoint))
        self._lifeInfo[key]._ui._subCategoryTitle[ii]:addInputEvent("Mouse_On", "PaGlobal_Char_LifeInfo:LifePower_MouseOverEvent(true," .. key .. "," .. ii .. ")")
        self._lifeInfo[key]._ui._subCategoryTitle[ii]:addInputEvent("Mouse_Out", "PaGlobal_Char_LifeInfo:LifePower_MouseOverEvent(false," .. key .. "," .. ii .. ")")
      end
    end
    if __ePlayerLifeStatType_Collecting == key then
      self._lifeInfo[key]._ui._subCategoryPoint[self._lifeSubTypeCount[key]]:SetText(commonPoint)
    end
  end
end
function PaGlobal_Char_LifeInfo:Life_MouseOverEvent(sourceType, isOn)
  if true == isOn then
    local name, desc, control
    if 0 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE0")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_1")
    elseif 1 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE1")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_5")
    elseif 2 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE2")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_6")
    elseif 3 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE3")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_2")
    elseif 4 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE4")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_2")
    elseif 5 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE5")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_2")
    elseif 6 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE6")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_3")
    elseif 7 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE7")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_4")
    elseif 8 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE8")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_7")
    elseif 9 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE9")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_8")
    end
    control = self._lifeInfo[sourceType]._ui._progressBG
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end
function PaGlobal_Char_LifeInfo:LifePower_MouseOverEvent(isShow, mainType, subType)
  if false == isShow then
    TooltipSimple_Hide()
  else
    local name, desc, control
    if __ePlayerLifeStatType_Manufacture == mainType then
      local countRate = ToClient_getManufacturingStatCountRate(subType)
      name = self._lifeInfo[mainType]._ui._subCategoryTitle[subType]:GetText()
      desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MANUFACTURING_POWER_TOOLTIP_DESC", "data2", tostring(countRate))
    end
    control = self._lifeInfo[mainType]._ui._subCategoryTitle[subType]
    TooltipSimple_Show(control, name, desc)
  end
end
PaGlobal_Char_LifeInfo:Init()
