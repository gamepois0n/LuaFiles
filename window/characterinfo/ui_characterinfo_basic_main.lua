local UI_Class = CppEnums.ClassType
local BattleSpeed = CppEnums.BattleSpeedType
local Class_BattleSpeed = CppEnums.ClassType_BattleSpeed
local CombatType = CppEnums.CombatResourceType
local UI_Symbol = CppEnums.ClassType_Symbol
local UI_LifeType = CppEnums.LifeExperienceType
local UI_Control = CppEnums.PA_UI_CONTROL_TYPE
PaGlobal_CharacterInfoBasic = {
  _player = nil,
  _playerGet = nil,
  _craftTable = {},
  _sortCraftTable = {},
  _requestRank = false,
  _toolTipCount = 0,
  _fitness = {
    _stamina = 0,
    _strength = 1,
    _health = 2
  },
  _regist = {
    _sturn = 0,
    _down = 1,
    _capture = 2,
    _knockBack = 3
  },
  _familyPoint = {
    _family = 0,
    _combat = 1,
    _life = 2,
    _etc = 3
  },
  _potential = {
    _moveSpeed = 0,
    _attackSpeed = 1,
    _critical = 2,
    _fishTime = 3,
    _product = 4,
    _dropChance = 5
  },
  _status = {
    _health = 0,
    _mental = 1,
    _weight = 2
  },
  _ui = {
    _staticTextPlayerName_Value = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_PlayerName_Value"),
    _staticTextZodiac_Title = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Zodiac_Title"),
    _staticTextZodiac_Value = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Zodiac_Value"),
    _staticTextTendency_Title = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Tendency_Title"),
    _staticTextTendency_Value = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Tendency_Value"),
    _staticTextMental_Title = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Mental_Title"),
    _staticTextMental_Value = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Mental_Value"),
    _staticTextSkillPoint_Title = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Skill_Title"),
    _staticTextSkillPoint_Value = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Skill_Value"),
    _staticTextContribution_Title = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Contribution_Title"),
    _staticTextContribution_Value = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Contribution_Value"),
    _staticStatus_Title = {},
    _staticStatus_Value = {},
    _progress2Status = {},
    _progress2WeightMoney = nil,
    _progress2WeightEquip = nil,
    _staticTextAttack_Title = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_AttackPower_Title"),
    _staticTextAttack_Value = nil,
    _staticTextAwakenAttack_Title = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_AwakenAttackPower_Title"),
    _staticTextAwakenAttack_Value = nil,
    _staticTextDefence_Title = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Defence_Title"),
    _staticTextDefence_Value = nil,
    _staticTextStamina_Title = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Stamina_Title"),
    _staticTextStamina_Value = nil,
    battlePointValueAndIcon = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_BattlePoint"),
    _staticTextResist_Title = {},
    _staticTextResist_Percent = {},
    _progress2Resist = {},
    _staticClassSymbol = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_PlayerLevel_Value"),
    _staticTextPotential_Title = {},
    _staticTextPotential_Value = {},
    _staticPotencialGradeBg = {},
    _staticPotencialPlusGrade = {},
    _staticPotencialMinusGrade = {},
    _templetePotentialGradeBg = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Static_PotentialSlotBG"),
    _templetePotentialPlusGrade = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Static_PotentialSlot"),
    _templetePotentialMinusGrade = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Static_PotentialMinusSlot"),
    _staticTextFitness_Title = {},
    _staticTextFitness_Level = {},
    _progress2Fitness = {},
    _staticPlayTimeIcon = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Static_SelfTimerIcon"),
    _staticTextPlayTime = nil,
    _multilineEditIntroduce = nil,
    _buttonIntroduce = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Button_Introduce"),
    _staticIntroduceBG = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Static_IntroduceBg"),
    _staticIntroduceBG_Text = nil,
    _staticTextIntroduce_Title = nil,
    _multilineEdit = nil,
    _buttonSetIntroduce = nil,
    _buttonResetIntroduce = nil,
    _buttonCloseIntroduce = nil,
    _staticTextFamilyPoints = {},
    _buttonFacePhoto = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Button_FacePhoto"),
    _staticTextCharacterLevel = nil,
    _staticCharSlot = nil,
    _staticTextNormalStack = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_NormalStackOnPicture"),
    _lifeInfoBg = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Static_LifeBg"),
    _lifeInfo = {},
    _lifeRankButton = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Button_Ranker"),
    _radioBtnBattle = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "RadioButton_BattleInfo"),
    _radioBtnLife = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "RadioButton_LifeInfo")
  }
}
local setTierIcon = function(iconControl, textureName, iconIdx, leftX, topY, xCount, iconSize)
  iconControl:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Etc_04.dds")
  local x1, y1, x2, y2
  x1 = leftX + (iconSize + 1) * (iconIdx % xCount)
  y1 = topY + (iconSize + 1) * math.floor(iconIdx / xCount)
  x2 = x1 + iconSize
  y2 = y1 + iconSize
  x1, y1, x2, y2 = setTextureUV_Func(iconControl, x1, y1, x2, y2)
  iconControl:getBaseTexture():setUV(x1, y1, x2, y2)
  iconControl:setRenderTexture(iconControl:getBaseTexture())
end
function PaGlobal_CharacterInfoBasic:initialize()
  self._player = getSelfPlayer()
  self._playerGet = self._player:get()
  self:initializeControl()
  self._ui._multilineEditIntroduce:SetMaxEditLine(1)
  self._ui._multilineEditIntroduce:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  self._ui._multilineEdit:SetMaxEditLine(6)
  self._ui._multilineEdit:SetMaxInput(120)
  local classType = self._player:getClassType()
  if Class_BattleSpeed[classType] == BattleSpeed.SpeedType_Attack then
    self._ui._staticTextPotential_Title[self._potential._attackSpeed]:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_ATTACKSPEED"))
  else
    self._ui._staticTextPotential_Title[self._potential._attackSpeed]:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_CASTSPEED"))
  end
  local classSymbol = UI_Symbol[classType]
  self._ui._staticClassSymbol:ChangeTextureInfoName(classSymbol[1])
  local x1, y1, x2, y2 = setTextureUV_Func(self._ui._staticClassSymbol, classSymbol[2], classSymbol[3], classSymbol[4], classSymbol[5])
  self._ui._staticClassSymbol:getBaseTexture():setUV(x1, y1, x2, y2)
  self._ui._staticClassSymbol:setRenderTexture(self._ui._staticClassSymbol:getBaseTexture())
  local progressTexture = {
    [CombatType.CombatType_MP] = {
      "LUA_CHARACTERINFO_TEXT_MP",
      2,
      64,
      232,
      69
    },
    [CombatType.CombatType_FP] = {
      "LUA_CHARACTERINFO_TEXT_FP",
      2,
      57,
      232,
      62
    },
    [CombatType.CombatType_EP] = {
      "LUA_CHARACTERINFO_TEXT_EP",
      2,
      71,
      232,
      76
    },
    [CombatType.CombatType_BP] = {
      "LUA_SELFCHARACTERINFO_BP",
      2,
      250,
      232,
      255
    }
  }
  local x1, y1, x2, y2 = 0, 0, 0, 0
  if UI_Class.ClassType_DarkElf == classType then
    self._ui._staticStatus_Title[self._status._mental]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MP_DARKELF"))
    self._ui._progress2Status[self._status._mental]:ChangeTextureInfoNameAsync("new_ui_common_forlua/default/default_gauges_03.dds")
    x1, y1, x2, y2 = setTextureUV_Func(self._ui._progress2Status[self._status._mental], 1, 1, 255, 6)
  else
    local mentalType = self._player:getCombatResourceType()
    local Texture = progressTexture[mentalType]
    self._ui._staticStatus_Title[self._status._mental]:SetText(PAGetString(Defines.StringSheet_GAME, Texture[1]))
    self._ui._progress2Status[self._status._mental]:ChangeTextureInfoNameAsync("new_ui_common_forlua/default/Default_Gauges.dds")
    x1, y1, x2, y2 = setTextureUV_Func(self._ui._progress2Status[self._status._mental], Texture[2], Texture[3], Texture[4], Texture[5])
  end
  self._ui._progress2Status[self._status._mental]:getBaseTexture():setUV(x1, y1, x2, y2)
  self._ui._progress2Status[self._status._mental]:setRenderTexture(self._ui._progress2Status[self._status._mental]:getBaseTexture())
  Panel_Window_CharInfo_BasicStatus:SetChildIndex(self._ui._staticIntroduceBG, 1000)
end
function PaGlobal_CharacterInfoBasic:initializeControl()
  for key, index in pairs(self._status) do
    self._ui._staticStatus_Title[index] = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Status_" .. index)
    self._ui._staticStatus_Value[index] = UI.getChildControl(self._ui._staticStatus_Title[index], "StaticText_Value")
    self._ui._progress2Status[index] = UI.getChildControl(self._ui._staticStatus_Title[index], "Progress2_Gauge")
  end
  self._ui._progress2WeightEquip = UI.getChildControl(self._ui._staticStatus_Title[self._status._weight], "Progress2_Gauge2")
  self._ui._progress2WeightMoney = UI.getChildControl(self._ui._staticStatus_Title[self._status._weight], "Progress2_Gauge3")
  self._ui._staticTextAttack_Value = UI.getChildControl(self._ui._staticTextAttack_Title, "StaticText_AttackPower_Value")
  self._ui._staticTextAwakenAttack_Value = UI.getChildControl(self._ui._staticTextAwakenAttack_Title, "StaticText_AwakenAttackPower_Value")
  self._ui._staticTextDefence_Value = UI.getChildControl(self._ui._staticTextDefence_Title, "StaticText_Defence_Value")
  self._ui._staticTextStamina_Value = UI.getChildControl(self._ui._staticTextStamina_Title, "StaticText_Stamina_Value")
  for key, index in pairs(self._regist) do
    self._ui._staticTextResist_Title[index] = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Resist_" .. index)
    self._ui._staticTextResist_Percent[index] = UI.getChildControl(self._ui._staticTextResist_Title[index], "StaticText_Percent")
    self._ui._progress2Resist[index] = UI.getChildControl(self._ui._staticTextResist_Title[index], "Progress2_Gauge")
    self._ui._staticTextResist_Title[index]:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  end
  self._ui._staticTextResist_Title[0]:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_STUNRESIST"))
  self._ui._staticTextResist_Title[1]:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_DOWNESIST"))
  self._ui._staticTextResist_Title[2]:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_CAPTURERESIST"))
  self._ui._staticTextResist_Title[3]:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_KNOCKBACKRESIST"))
  for key, index in pairs(self._potential) do
    self._ui._staticTextPotential_Title[index] = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Potential_" .. index)
    self._ui._staticTextPotential_Value[index] = UI.getChildControl(self._ui._staticTextPotential_Title[index], "StaticText_Value")
    self._ui._staticPotencialGradeBg[index] = {}
    self._ui._staticPotencialPlusGrade[index] = {}
    self._ui._staticPotencialMinusGrade[index] = {}
    for slotIndex = 0, 4 do
      self._ui._staticPotencialGradeBg[index][slotIndex] = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, self._ui._staticTextPotential_Title[index], "attackSpeed_SlotBG_" .. index .. "_" .. slotIndex)
      CopyBaseProperty(self._ui._templetePotentialGradeBg, self._ui._staticPotencialGradeBg[index][slotIndex])
      self._ui._staticPotencialGradeBg[index][slotIndex]:SetShow(true)
      self._ui._staticPotencialGradeBg[index][slotIndex]:SetPosX(1 + slotIndex * 60)
      self._ui._staticPotencialGradeBg[index][slotIndex]:SetPosY(22)
      self._ui._staticPotencialPlusGrade[index][slotIndex] = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, self._ui._staticTextPotential_Title[index], "attackSpeed_PlusSlot_" .. index .. "_" .. slotIndex)
      CopyBaseProperty(self._ui._templetePotentialPlusGrade, self._ui._staticPotencialPlusGrade[index][slotIndex])
      self._ui._staticPotencialPlusGrade[index][slotIndex]:SetShow(false)
      self._ui._staticPotencialPlusGrade[index][slotIndex]:SetPosX(2 + slotIndex * 60)
      self._ui._staticPotencialPlusGrade[index][slotIndex]:SetPosY(23)
      self._ui._staticPotencialMinusGrade[index][slotIndex] = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, self._ui._staticTextPotential_Title[index], "attackSpeed_MinusSlot_" .. index .. "_" .. slotIndex)
      CopyBaseProperty(self._ui._templetePotentialMinusGrade, self._ui._staticPotencialMinusGrade[index][slotIndex])
      self._ui._staticPotencialMinusGrade[index][slotIndex]:SetShow(false)
      self._ui._staticPotencialMinusGrade[index][slotIndex]:SetPosX(2 + slotIndex * 60)
      self._ui._staticPotencialMinusGrade[index][slotIndex]:SetPosY(23)
    end
  end
  for key, index in pairs(self._fitness) do
    self._ui._staticTextFitness_Title[index] = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Fitness_" .. index)
    self._ui._staticTextFitness_Level[index] = UI.getChildControl(self._ui._staticTextFitness_Title[index], "StaticText_Level")
    local staminaGaugeBG = UI.getChildControl(self._ui._staticTextFitness_Title[index], "Static_GaugeBG")
    self._ui._progress2Fitness[index] = UI.getChildControl(staminaGaugeBG, "Progress2_Gauge")
  end
  self._ui._staticTextPlayTime = UI.getChildControl(self._ui._staticPlayTimeIcon, "StaticText_SelfTimer")
  local EditLineBG = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_Introduce_TitleBG")
  self._ui._multilineEditIntroduce = UI.getChildControl(EditLineBG, "MultilineEdit_IntroduceLine")
  self._ui._staticIntroduceBG_Text = UI.getChildControl(self._ui._staticIntroduceBG, "Static_MultilineTextBg")
  self._ui._staticTextIntroduce_Title = UI.getChildControl(self._ui._staticIntroduceBG, "StaticText_Title_Introduce")
  self._ui._multilineEdit = UI.getChildControl(self._ui._staticIntroduceBG, "MultilineEdit_Introduce")
  self._ui._buttonSetIntroduce = UI.getChildControl(self._ui._staticIntroduceBG, "Button_SetIntroduce")
  self._ui._buttonResetIntroduce = UI.getChildControl(self._ui._staticIntroduceBG, "Button_ResetIntroduce")
  self._ui._buttonCloseIntroduce = UI.getChildControl(self._ui._staticIntroduceBG, "Button_CloseIntroduce")
  local staticFacePhotoBG = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "Static_CharSlot_BG")
  local staticSymbolBG = UI.getChildControl(staticFacePhotoBG, "Static_ClassSymbol_BG")
  self._ui._staticCharSlot = UI.getChildControl(staticFacePhotoBG, "Static_CharSlot")
  local staticFamily = UI.getChildControl(Panel_Window_CharInfo_BasicStatus, "StaticText_FamilyBG")
  for key, index in pairs(self._familyPoint) do
    self._ui._staticTextFamilyPoints[index] = UI.getChildControl(staticFamily, "StaticText_FamilyPoint_" .. index)
  end
  for index = 1, 10 do
    self._ui._lifeInfo[index] = {
      _bg = {},
      _title = {},
      _level = {},
      _percent = {},
      _progress = {}
    }
    self._ui._lifeInfo[index]._bg = UI.getChildControl(self._ui._lifeInfoBg, "Static_Craft_" .. index)
    self._ui._lifeInfo[index]._title = UI.getChildControl(self._ui._lifeInfo[index]._bg, "StaticText_Title")
    self._ui._lifeInfo[index]._level = UI.getChildControl(self._ui._lifeInfo[index]._bg, "StaticText_Level")
    self._ui._lifeInfo[index]._percent = UI.getChildControl(self._ui._lifeInfo[index]._bg, "StaticText_Percent")
    self._ui._lifeInfo[index]._progress = UI.getChildControl(self._ui._lifeInfo[index]._bg, "Progress2_Gauge")
    self._ui._lifeInfo[index]._title:SetIgnore(true)
    self._ui._lifeInfo[index]._progress:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:Life_MouseOverEvent(" .. index .. ",true)")
    self._ui._lifeInfo[index]._progress:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:Life_MouseOverEvent(" .. index .. ",false)")
  end
  local showDetailBtn_LifeInfo = UI.getChildControl(self._ui._lifeInfoBg, "Button_ShowDetail")
  showDetailBtn_LifeInfo:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfo:showWindow(" .. 5 .. ")")
  showDetailBtn_LifeInfo:SetShow(_ContentsGroup_EnhanceCollect)
  local viewType
  local currentInfoType = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.CharacterInfo)
  if 0 == currentInfoType then
    viewType = 0
  else
    viewType = 1
  end
  PaGlobal_CharacterInfoBasic:BaseInfoShow(0 == viewType)
  self._ui._radioBtnBattle:SetCheck(0 == viewType)
  self._ui._radioBtnLife:SetCheck(0 ~= viewType)
end
function PaGlobal_CharacterInfoBasic_ShowInfo(infoType)
  ToClient_getGameUIManagerWrapper():setLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.CharacterInfo, infoType, CppEnums.VariableStorageType.eVariableStorageType_User)
  PaGlobal_CharacterInfoBasic:BaseInfoShow(0 == infoType)
end
function PaGlobal_CharacterInfoBasic:BaseInfoShow(isBattleInfo)
  for key, index in pairs(self._potential) do
    self._ui._staticTextPotential_Title[index]:SetShow(isBattleInfo)
    self._ui._staticTextPotential_Value[index]:SetShow(isBattleInfo)
    for slotIndex = 0, 4 do
      self._ui._staticPotencialGradeBg[index][slotIndex]:SetShow(isBattleInfo)
      self._ui._staticPotencialPlusGrade[index][slotIndex]:SetShow(false)
      self._ui._staticPotencialMinusGrade[index][slotIndex]:SetShow(false)
    end
  end
  if isBattleInfo and nil ~= FromClient_UI_CharacterInfo_Basic_PotentialChanged then
    FromClient_UI_CharacterInfo_Basic_PotentialChanged()
  end
  self._ui._staticTextAttack_Title:SetShow(isBattleInfo)
  self._ui._staticTextAwakenAttack_Title:SetShow(isBattleInfo)
  self._ui._staticTextDefence_Title:SetShow(isBattleInfo)
  self._ui._staticTextStamina_Title:SetShow(isBattleInfo)
  self._ui.battlePointValueAndIcon:SetShow(isBattleInfo)
  self._ui._lifeInfoBg:SetShow(not isBattleInfo)
  if isBattleInfo and nil ~= FromClient_UI_CharacterInfo_Basic_AttackChanged then
    FromClient_UI_CharacterInfo_Basic_AttackChanged()
  end
end
function PaGlobal_CharacterInfoBasic:update()
  local FamiName = self._player:getUserNickname()
  local ChaName = self._player:getOriginalName()
  self._ui._staticTextPlayerName_Value:SetText(tostring(ChaName) .. "(" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDLIST_FAMILYNAME", "name", tostring(FamiName)) .. ")")
  local ZodiacName = self._player:getZodiacSignOrderStaticStatusWrapper():getZodiacName()
  self._ui._staticTextZodiac_Value:SetText(tostring(ZodiacName))
  local totalPlayTime = Util.Time.timeFormatting_Minute(Int64toInt32(ToClient_GetCharacterPlayTime()))
  local playTimePosX = self._ui._staticTextPlayerName_Value:GetPosX() + self._ui._staticTextPlayerName_Value:GetTextSizeX() + 20
  if isGameTypeKorea() or isGameTypeJapan() or isGameTypeTaiwan() then
    if playTimePosX < self._ui._staticPlayTimeIcon:GetPosX() then
      self._ui._staticTextPlayTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONTRACT_TIME_BLACKSPIRIT") .. "<PAColor0xFFFFC730> " .. totalPlayTime .. "<PAOldColor> ")
      self._ui._staticTextPlayTime:SetSize(self._ui._staticTextPlayTime:GetTextSizeX(), self._ui._staticTextPlayTime:GetSizeY())
      self._ui._staticPlayTimeIcon:SetPosX(730 - (self._ui._staticPlayTimeIcon:GetSizeX() + self._ui._staticTextPlayTime:GetTextSizeX()))
    else
      self._ui._staticPlayTimeIcon:SetPosX(playTimePosX)
      self._ui._staticTextPlayTime:SetText("<PAColor0xFFFFC730> " .. totalPlayTime .. "<PAOldColor> ")
      self._ui._staticPlayTimeIcon:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:localTooltip(true)")
      self._ui._staticPlayTimeIcon:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:localTooltip(false)")
    end
  else
    self._ui._staticTextPlayTime:SetText("<PAColor0xFFFFC730> " .. totalPlayTime .. "<PAOldColor> ")
    self._ui._staticPlayTimeIcon:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:localTooltip(true)")
    self._ui._staticPlayTimeIcon:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:localTooltip(false)")
    self._ui._staticTextPlayTime:SetSize(self._ui._staticTextPlayTime:GetTextSizeX(), self._ui._staticTextPlayTime:GetSizeY())
    self._ui._staticPlayTimeIcon:SetPosX(730 - (self._ui._staticPlayTimeIcon:GetSizeX() + self._ui._staticTextPlayTime:GetTextSizeX()))
  end
  local msg = ToClient_GetUserIntroduction()
  local oneLineMsg = string.gsub(msg, "\n", " ")
  self._ui._multilineEditIntroduce:SetEditText(oneLineMsg)
  self:updateFacePhoto()
  FromClient_UI_CharacterInfo_Basic_TendencyChanged()
  FromClient_UI_CharacterInfo_Basic_MentalChanged()
  FromClient_UI_CharacterInfo_Basic_ContributionChanged()
  FromClient_UI_CharacterInfo_Basic_LevelChanged()
  FromClient_UI_CharacterInfo_Basic_HpChanged()
  FromClient_UI_CharacterInfo_Basic_MpChanged()
  FromClient_UI_CharacterInfo_Basic_WeightChanged()
  FromClient_UI_CharacterInfo_Basic_AttackChanged()
  FromClient_UI_CharacterInfo_Basic_StaminaChanged()
  FromClient_UI_CharacterInfo_Basic_SkillPointChanged()
  FromClient_UI_CharacterInfo_Basic_FamilyPointsChanged()
  FromClient_UI_CharacterInfo_Basic_ResistChanged()
  FromClient_UI_CharacterInfo_Basic_CraftLevelChanged()
  FromClient_UI_CharacterInfo_Basic_LifeLevelChangeNew()
  FromClient_UI_CharacterInfo_Basic_PotentialChanged()
  FromClient_UI_CharacterInfo_Basic_FitnessChanged(0, 0, 0, 0)
  FromClient_UI_CharacterInfo_Basic_NormalStackChanged()
  self:updatePlayerTotalStat()
end
function PaGlobal_CharacterInfoBasic:localTooltip(isOn)
  if true == isOn then
    local totalPlayTime = Util.Time.timeFormatting_Minute(Int64toInt32(ToClient_GetCharacterPlayTime()))
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_CONTRACT_TIME_BLACKSPIRIT") .. " " .. totalPlayTime
    local control = self._ui._staticPlayTimeIcon
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end
function PaGlobal_CharacterInfoBasic:registEventHandler()
  for key, index in pairs(self._potential) do
    self._ui._staticTextPotential_Title[index]:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:handleMouseOver_Potential(true, " .. index .. ")")
    self._ui._staticTextPotential_Title[index]:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:handleMouseOver_Potential(false)")
  end
  for key, index in pairs(self._fitness) do
    self._ui._staticTextFitness_Title[index]:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:handleMouseOver_Fitness(true, " .. index .. ")")
    self._ui._staticTextFitness_Title[index]:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:handleMouseOver_Fitness(false)")
  end
  for key, index in pairs(self._regist) do
    self._ui._staticTextResist_Title[index]:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:handleMouseOver_Regist(true, " .. index .. ")")
    self._ui._staticTextResist_Title[index]:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:handleMouseOver_Regist(false)")
  end
  for key, index in pairs(self._status) do
    self._ui._staticStatus_Title[index]:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:handleMouseOver_CharInfomation(true, " .. index .. ")")
    self._ui._staticStatus_Title[index]:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:handleMouseOver_CharInfomation(false)")
  end
  for key, index in pairs(self._familyPoint) do
    self._ui._staticTextFamilyPoints[index]:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:handleMouseOver_FamilyPoints(true, " .. index .. ")")
    self._ui._staticTextFamilyPoints[index]:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:handleMouseOver_FamilyPoints(false)")
  end
  self._ui._lifeRankButton:addInputEvent("Mouse_LUp", "FGlobal_LifeRanking_Open()")
  self._ui._buttonIntroduce:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoBasic:showIntroduce(true)")
  self._ui._buttonCloseIntroduce:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoBasic:showIntroduce(false)")
  self._ui._multilineEdit:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoBasic:handleClicked_Introduce()")
  self._ui._buttonSetIntroduce:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoBasic:handleClicked_SetIntroduce()")
  self._ui._buttonResetIntroduce:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoBasic:handleClicked_ResetIntroduce()")
  self._ui._buttonFacePhoto:addInputEvent("Mouse_On", "PaGlobal_CharacterInfoBasic:handleMouseOver_FacePhotoButton(true)")
  self._ui._buttonFacePhoto:addInputEvent("Mouse_Out", "PaGlobal_CharacterInfoBasic:handleMouseOver_FacePhotoButton(false)")
  self._ui._buttonFacePhoto:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoBasic:handleClicked_FacePhotoButton()")
  self._ui._radioBtnBattle:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoBasic_ShowInfo(" .. 0 .. ")")
  self._ui._radioBtnLife:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoBasic_ShowInfo(" .. 1 .. ")")
end
function FromClient_CharacterInfo_PlayerTotalStat_Changed(actorKey, totalStatValue)
  if false == Panel_Window_CharInfo_Status:GetShow() then
    return
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local playerActorProxyWrapper = getPlayerActor(actorKey)
  if nil == playerActorProxyWrapper then
    return
  end
  if playerActorProxyWrapper:getActorKey() ~= selfPlayer:getActorKey() then
    return
  end
  local totalStatValue = math.floor(totalStatValue)
  local tier = ToClient_GetTier(totalStatValue) - 1
  PaGlobal_CharacterInfoBasic:changedBattlePoint(totalStatValue)
end
function PaGlobal_CharacterInfoBasic:changedBattlePoint(battlePoint)
  if false == Panel_Window_CharInfo_Status:GetShow() then
    return
  end
  local highTier = ToClient_GetHighTierByTotalStat(battlePoint)
  if true == _ContentsGroup_StatTierIcon and highTier >= 1 and highTier <= ToClient_GetHighTierCount() then
    local tierName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSTAT_HIGHTIERNAME_" .. highTier, "totalStat", battlePoint)
    self._ui.battlePointValueAndIcon:SetText(tierName)
    setTierIcon(self._ui.battlePointValueAndIcon, "new_ui_common_forlua/default/Default_Etc_04.dds", 3 - highTier, 225, 142, 3, 42)
  else
    local tier = ToClient_GetTier(battlePoint)
    local tierName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOTALSTAT_TIERNAME_" .. tier, "totalStat", battlePoint)
    self._ui.battlePointValueAndIcon:SetText(tierName)
    setTierIcon(self._ui.battlePointValueAndIcon, "new_ui_common_forlua/default/Default_Etc_04.dds", 8 - tier, 354, 99, 4, 24)
  end
end
function PaGlobal_CharacterInfoBasic:updatePlayerTotalStat()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local totalStatValue = math.floor(selfPlayer:getTotalStatValue())
  self:changedBattlePoint(totalStatValue)
end
function PaGlobal_CharacterInfoBasic:Life_MouseOverEvent(sourceType, isOn)
  if true == isOn then
    local name, desc, control
    if 1 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE0")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_1")
    elseif 2 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE1")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_5")
    elseif 3 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE2")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_6")
    elseif 4 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE3")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_2")
    elseif 5 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE4")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_2")
    elseif 6 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE5")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_2")
    elseif 7 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE6")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_3")
    elseif 8 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE7")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_4")
    elseif 9 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE8")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_7")
    elseif 10 == sourceType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_LIFE9")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_8")
    end
    control = self._ui._lifeInfo[sourceType]._progress
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end
function PaGlobal_CharacterInfoBasic:registMessageHandler()
  registerEvent("FromClient_SelfPlayerTendencyChanged", "FromClient_UI_CharacterInfo_Basic_TendencyChanged")
  registerEvent("FromClient_WpChanged", "FromClient_UI_CharacterInfo_Basic_MentalChanged")
  registerEvent("FromClient_UpdateExplorePoint", "FromClient_UI_CharacterInfo_Basic_ContributionChanged")
  registerEvent("FromClient_SelfPlayerExpChanged", "FromClient_UI_CharacterInfo_Basic_LevelChanged")
  registerEvent("EventSelfPlayerLevelUp", "FromClient_UI_CharacterInfo_Basic_LevelChanged")
  registerEvent("FromClient_SelfPlayerHpChanged", "FromClient_UI_CharacterInfo_Basic_HpChanged")
  registerEvent("FromClient_SelfPlayerMpChanged", "FromClient_UI_CharacterInfo_Basic_MpChanged")
  registerEvent("FromClient_InventoryUpdate", "FromClient_UI_CharacterInfo_Basic_WeightChanged")
  registerEvent("FromClient_WeightChanged", "FromClient_UI_CharacterInfo_Basic_WeightChanged")
  registerEvent("EventEquipmentUpdate", "FromClient_UI_CharacterInfo_Basic_AttackChanged")
  registerEvent("EventStaminaUpdate", "FromClient_UI_CharacterInfo_Basic_StaminaChanged")
  registerEvent("FromClient_SelfPlayerCombatSkillPointChanged", "FromClient_UI_CharacterInfo_Basic_SkillPointChanged")
  registerEvent("FromClient_UpdateTolerance", "FromClient_UI_CharacterInfo_Basic_ResistChanged")
  registerEvent("FromClient_UpdateSelfPlayerLifeExp", "FromClient_UI_CharacterInfo_Basic_LifeLevelChangeNew")
  registerEvent("FromClient_UpdateSelfPlayerStatPoint", "FromClient_UI_CharacterInfo_Basic_PotentialChanged")
  registerEvent("FromClientFitnessUp", "FromClient_UI_CharacterInfo_Basic_FitnessChanged")
  registerEvent("FromClient_ShowLifeRank", "FromClient_UI_CharacterInfo_Basic_RankChanged")
  registerEvent("onScreenResize", "FromClient_UI_CharacterInfo_Basic_ScreenResize")
  registerEvent("FromClient_PlayerTotalStat_Changed", "FromClient_CharacterInfo_PlayerTotalStat_Changed")
end
PaGlobal_CharacterInfoBasic:initialize()
PaGlobal_CharacterInfoBasic:registEventHandler()
PaGlobal_CharacterInfoBasic:registMessageHandler()
