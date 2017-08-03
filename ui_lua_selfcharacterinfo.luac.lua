-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\characterinfo\ui_lua_selfcharacterinfo.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local UI_PD = CppEnums.Padding
Panel_Window_CharInfo_Status:SetShow(false)
Panel_Window_CharInfo_Status:setMaskingChild(true)
Panel_Window_CharInfo_Status:ActiveMouseEventEffect(true)
Panel_Window_CharInfo_Status:setGlassBackground(true)
Panel_Window_CharInfo_Status:SetDragEnable(true)
Panel_Window_CharInfo_Status:RegisterShowEventFunc(true, "CharInfoStatusShowAni()")
Panel_Window_CharInfo_Status:RegisterShowEventFunc(false, "CharInfoStatusHideAni()")
Panel_Window_CharInfo_BasicStatus:SetShow(false)
local isFamilyPoint = ToClient_IsContentsGroupOpen("212")
local profileOpen = ToClient_IsContentsGroupOpen("271")
local CharacterInfo = {_frameDefaultBG_Basic = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Static_BasicInfo"), _frameDefaultBG_Title = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Static_TitleInfo"), _frameDefaultBG_History = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Static_HistoryInfo"), _frameDefaultBG_Challenge = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Static_ChallengeInfo"), _frameDefaultBG_Profile = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Static_ProfileInfo"), BTN_Tab_Basic = (UI.getChildControl)(Panel_Window_CharInfo_Status, "RadioButton_Tab_CharacterInfo"), BTN_Tab_Title = (UI.getChildControl)(Panel_Window_CharInfo_Status, "RadioButton_Tab_CharacterTitle"), BTN_Tab_History = (UI.getChildControl)(Panel_Window_CharInfo_Status, "RadioButton_Tab_CharacterHistory"), BTN_Tab_Challenge = (UI.getChildControl)(Panel_Window_CharInfo_Status, "RadioButton_Tab_Challenge"), BTN_Tab_Profile = (UI.getChildControl)(Panel_Window_CharInfo_Status, "RadioButton_Tab_Profile"), txt_BaseInfo_Title = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Title_Base_Title"), txt_CharinfoDesc = (UI.getChildControl)(Panel_Window_CharInfo_Status, "StaticText_CharinfoDesc"), txt_TitleDesc = (UI.getChildControl)(Panel_Window_CharInfo_Status, "StaticText_TitleDesc"), txt_HistoryDesc = (UI.getChildControl)(Panel_Window_CharInfo_Status, "StaticText_HistoryDesc"), txt_ChallengeDesc = (UI.getChildControl)(Panel_Window_CharInfo_Status, "StaticText_ChallengeDesc"), _familyname = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_FamilyName_Value"), _charactername = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_CharacterName_Value"), _zodiac = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Zodiac_Value"), _tendency = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Tendency_Value"), _mental = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Mental_Value"), _contribution = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Contribution_Value"), _characterlevel = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_BattleLevel_Value"), _progress2_characterlevel = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_BattleLevel_Gauge"), _hpTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_HP_Title"), _hpvalue = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_HP_Value"), _progress2_hp = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_HP_Gauge"), _mpTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_MP_Title"), _mpvalue = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_MP_value"), _progress2_mp = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_MP_Gauge"), _weightTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Weight_Title"), _weightvalue = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Weight_Value"), _progress2_weightvalue_Money = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_Weight_Money"), _progress2_weightvalue_Equip = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_Weight_Equip"), _progress2_weightvalue_Inventory = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_Weight_Inventory"), _attackTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_AttackPower_Title"), _attack = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_AttackPower_Value"), _awakenAttackTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_AwakenAttackPower_Title"), _awakenAttack = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_AwakenAttackPower_Value"), _defenceTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Defence_Title"), _defence = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Defence_Value"), _staminaTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Stamina_Title"), _stamina = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Stamina_Value"), _stunTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_ResistStun_Title"), _downTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_ResistDown_Title"), _captureTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_ResistCapture_Title"), _knockBackTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_ResistKnockback_Title"), _stunPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_RegistStun_Percent"), _downPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_RegistDown_Percent"), _capturePercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_RegistCapture_Percent"), _knockBackPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_RegistKnockBack_Percent"), _gatherTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_GatheringLevel_Title"), _gather = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_GatheringLevel_Value"), _gatherPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_GatheringPercent_Value"), _progress2_gather = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_GatheringLevel_Gauge"), _manufactureTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_ManufactureLevel_Title"), _manufacture = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_ManufactureLevel_Value"), _manufacturePercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_ManufacturePercent_Value"), _progress2_manufacture = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_ManufactureLevel_Gauge"), _cookingTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_CookingLevel_Title"), _cooking = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_CookingLevel_Value"), _cookingPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_CookingPercent_Value"), _progress2_cooking = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_CookingLevel_Gauge"), _alchemyTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_AlchemyLevel_Title"), _alchemy = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_AlchemyLevel_Value"), _alchemyPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_AlchemyPercent_Value"), _progress2_alchemy = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_AlchemyLevel_Gauge"), _fishingTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_FishingLevel_Title"), _fishing = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_FishingLevel_Value"), _fishingPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_FishingPercent_Value"), _progress2_fishing = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_FishingLevel_Gauge"), _huntingTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_HuntingLevel_Title"), _hunting = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_HuntingLevel_Value"), _huntingPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_HuntingPercent_Value"), _progress2_hunting = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_HuntingLevel_Gauge"), _trainingTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_TrainingLevel_Title"), _training = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_TrainingLevel_Value"), _trainingPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_TrainingPercent_Value"), _progress2_training = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_TrainingLevel_Gauge"), _tradeTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Trade"), _trade = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Trade_Value"), _tradePercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_TradePercent_Value"), _progress2_trade = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_Trade"), _growthTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_GrowthLevel_Title"), _growth = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_GrowthLevel_Value"), _growthPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_GrowthPercent_Value"), _progress2_growth = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_GrowthLevel_Gauge"), _sailTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_SailLevel_Title"), _sail = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_SailLevel_Value"), _sailPercent = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_SailPercent_Value"), _progress2_sail = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_SailLevel_Gauge"), sailProgressBG = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Static_SailLevel_GaugeBG"), sailIcon = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Static_Icon_Sail"), attackspeed = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Potential_AttackSpeed_Title"), _asttackspeed = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Potential_AttackSpeed_Value"), castspeed = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Potential_CastingSpeed_Title"), _castspeed = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Potential_CastingSpeed_Value"), movespeed = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Potential_MoveSpeed_Title"), _movespeed = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Potential_MoveSpeed_Value"), critical = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Potential_Critical_Title"), _critical = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Potential_Critical_Value"), fishTime = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Poten_FishTime"), _fishTime = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_FishTime_Grade"), product = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Poten_Product"), _product = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Product_Grade"), dropChance = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Poten_DropChance"), _dropChance = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_DropChance_Grade"), _potentialSlot = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Static_PotentialSlot"), _potentialMinusSlot = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Static_PotentialMinusSlot"), _potentialSlotBG = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Static_PotentialSlotBG"), _title_stamina = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Fitness_Stamina_Title"), _title_strength = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Fitness_Strength_Title"), _title_health = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Fitness_Health_Title"), _progress2_stamina = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_Fitness_Stamina_Gauge"), _progress2_strength = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_Fitness_Strength_Gauge"), _progress2_health = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_Fitness_Health_Gauge"), _value_stamina = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Fitness_Stamina_Value"), _value_strength = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Fitness_Strength_Value"), _value_health = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Fitness_Health_Value"), _progress2_resiststun = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_ResistStun_Gauge"), _progress2_resistdown = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_ResistDown_Gauge"), _progress2_resistcapture = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_ResistCapture_Gauge"), _progress2_resistknockback = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Progress2_ResistKnockback_Gauge"), _hpRegen = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_HpRegen"), _mpRegen = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_MpRegen"), _weightTooltip = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Weight_Tooltip"), _potenHelp = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Poten_Help"), _buttonClose = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Button_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Button_Question"), checkPopUp = (UI.getChildControl)(Panel_Window_CharInfo_Status, "CheckButton_PopUp"), _selfTimer = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_SelfTimer"), _PcRoomTimer = (UI.getChildControl)(Panel_Window_CharInfo_Status, "StaticText_PCRoomTimer"), _todayPlayTime = (UI.getChildControl)(Panel_Window_CharInfo_Status, "StaticText_TodayPlayTime"), _selfTimerIcon = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Static_SelfTimerIcon"), _lifeTitle = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_CraftLevel_Title"), _ranker = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Button_Ranker"), _btnIntroduce = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Button_Introduce"), 
_introduce = {_bg = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Static_IntroduceBg"), _title = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_Title_Introduce"), _textBg = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Static_MultilineTextBg"), _editText = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "MultilineEdit_Introduce"), _btnSetIntro = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Button_SetIntroduce"), _btnResetIntro = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Button_ResetIntroduce"), _closeIntro = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "Button_CloseIntroduce")}
, familyPoints = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_FamilyPoint"), familyCombatPoints = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_FamilyCombatPoint"), familyLifePoints = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_FamilyLifePoint"), familyEtcPoints = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_FamilyEtcPoint"), familyLeftBracket = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_LeftBracket"), familyRightBracket = (UI.getChildControl)(Panel_Window_CharInfo_BasicStatus, "StaticText_RightBracket"), 
attackspeed_SlotBG = {}
, 
attackspeed_Slot = {}
, 
attackspeed_MinusSlot = {}
, 
castspeed_SlotBG = {}
, 
castspeed_Slot = {}
, 
castspeed_MinusSlot = {}
, 
movespeed_SlotBG = {}
, 
movespeed_Slot = {}
, 
movespeed_MinusSlot = {}
, 
critical_SlotBG = {}
, 
critical_Slot = {}
, 
critical_MinusSlot = {}
, 
fishTime_SlotBG = {}
, 
fishTime_Slot = {}
, 
fishTime_MinusSlot = {}
, 
product_SlotBG = {}
, 
product_Slot = {}
, 
product_MinusSlot = {}
, 
dropChance_SlotBG = {}
, 
dropChance_Slot = {}
, 
dropChance_MinusSlot = {}
}
;
(CharacterInfo._potenHelp):SetShow(false)
local potenTooltip = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_CharInfo_Status, "PotenTooltip")
CopyBaseProperty(CharacterInfo._potenHelp, potenTooltip)
potenTooltip:SetColor(UI_color.C_FFFFFFFF)
potenTooltip:SetAlpha(1)
potenTooltip:SetFontColor(UI_color.C_FFFFFFFF)
potenTooltip:SetShow(false)
potenTooltip:SetNotAbleMasking(true)
local potenCheck = false
local fitnessTooltip = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_CharInfo_Status, "FitnessTooltip")
CopyBaseProperty(CharacterInfo._potenHelp, fitnessTooltip)
fitnessTooltip:SetColor(UI_color.C_FFFFFFFF)
fitnessTooltip:SetAlpha(1)
fitnessTooltip:SetFontColor(UI_color.C_FFFFFFFF)
fitnessTooltip:SetAutoResize(true)
fitnessTooltip:SetTextMode((CppEnums.TextMode).eTextMode_None)
fitnessTooltip:SetShow(false)
fitnessTooltip:SetNotAbleMasking(true)
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
;
(CharacterInfo.checkPopUp):SetShow(isPopUpContentsEnable)
local currentPotencial = {[0] = "Attack_Speed", [1] = "Casting_Speed", [2] = "Move_Speed", [3] = "Critical_Rate", [4] = "Fishing_Rate", [5] = "Product_Rate", [6] = "Drop_Item_Rate"}
CharInfoStatusShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_Window_CharInfo_Status:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.12)
  aniInfo1.AxisX = Panel_Window_CharInfo_Status:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_CharInfo_Status:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_CharInfo_Status:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.12)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_CharInfo_Status:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_CharInfo_Status:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

CharInfoStatusHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo1 = Panel_Window_CharInfo_Status:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

FGlobal_CharInfoStatusShowAni = function()
  -- function num : 0_2
  CharInfoStatusShowAni()
end

CharacterInfo.Init = function(self)
  -- function num : 0_3 , upvalues : profileOpen, CharacterInfo, isFamilyPoint
  (self._frameDefaultBG_Basic):MoveChilds((self._frameDefaultBG_Basic):GetID(), Panel_Window_CharInfo_BasicStatus)
  ;
  (UI.deletePanel)(Panel_Window_CharInfo_BasicStatus:GetID())
  ;
  (self._frameDefaultBG_Title):MoveChilds((self._frameDefaultBG_Title):GetID(), Panel_Window_CharInfo_TitleInfo)
  ;
  (UI.deletePanel)(Panel_Window_CharInfo_TitleInfo:GetID())
  ;
  (self._frameDefaultBG_History):MoveChilds((self._frameDefaultBG_History):GetID(), Panel_Window_CharInfo_HistoryInfo)
  ;
  (UI.deletePanel)(Panel_Window_CharInfo_HistoryInfo:GetID())
  ;
  (self._frameDefaultBG_Challenge):MoveChilds((self._frameDefaultBG_Challenge):GetID(), Panel_Window_Challenge)
  ;
  (UI.deletePanel)(Panel_Window_Challenge:GetID())
  if profileOpen then
    (self._frameDefaultBG_Profile):MoveChilds((self._frameDefaultBG_Profile):GetID(), Panel_Window_Profile)
    ;
    (UI.deletePanel)(Panel_Window_Profile:GetID())
    ;
    (CharacterInfo.BTN_Tab_Profile):SetShow(true)
  else
    ;
    (CharacterInfo.BTN_Tab_Profile):SetShow(false)
  end
  ;
  (self._gatherTitle):SetIgnore(false)
  ;
  (self._manufactureTitle):SetIgnore(false)
  ;
  (self._cookingTitle):SetIgnore(false)
  ;
  (self._alchemyTitle):SetIgnore(false)
  ;
  (self._trainingTitle):SetIgnore(false)
  ;
  (self._tradeTitle):SetIgnore(false)
  ;
  (self._growthTitle):SetIgnore(false)
  ;
  (self._sailTitle):SetIgnore(false)
  ;
  (self._lifeTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_SUBTITLE_CRAFT"))
  ;
  (self._ranker):SetPosX((self._lifeTitle):GetTextSizeX() + 35, 438)
  ;
  (self._potentialSlotBG):SetSize(46, (self._potentialSlotBG):GetSizeY())
  ;
  (self._potentialSlot):SetSize(44, (self._potentialSlot):GetSizeY())
  for idx = 0, 6 do
    -- DECOMPILER ERROR at PC156: Confused about usage of register: R5 in 'UnsetPending'

    (self.attackspeed_SlotBG)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.attackspeed, "attackSpeed_SlotBG_" .. idx)
    CopyBaseProperty(self._potentialSlotBG, (self.attackspeed_SlotBG)[idx])
    ;
    ((self.attackspeed_SlotBG)[idx]):SetShow(false)
    if idx == 0 then
      ((self.attackspeed_SlotBG)[idx]):SetPosX(0)
    else
      ;
      ((self.attackspeed_SlotBG)[idx]):SetPosX(((self.attackspeed_SlotBG)[idx - 1]):GetPosX() + ((self.attackspeed_SlotBG)[idx - 1]):GetSizeX())
    end
    ;
    ((self.attackspeed_SlotBG)[idx]):SetPosY(21)
    -- DECOMPILER ERROR at PC206: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.attackspeed_Slot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.attackspeed, "attackSpeed_Slot_" .. idx)
    CopyBaseProperty(self._potentialSlot, (self.attackspeed_Slot)[idx])
    ;
    ((self.attackspeed_Slot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.attackspeed_Slot)[idx]):SetPosX(0)
    else
      ;
      ((self.attackspeed_Slot)[idx]):SetPosX(((self.attackspeed_Slot)[idx - 1]):GetPosX() + ((self.attackspeed_Slot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.attackspeed_Slot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC257: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.attackspeed_MinusSlot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.attackspeed, "attackSpeed_MinusSlot_" .. idx)
    CopyBaseProperty(self._potentialMinusSlot, (self.attackspeed_MinusSlot)[idx])
    ;
    ((self.attackspeed_MinusSlot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.attackspeed_MinusSlot)[idx]):SetPosX(0)
    else
      ;
      ((self.attackspeed_MinusSlot)[idx]):SetPosX(((self.attackspeed_MinusSlot)[idx - 1]):GetPosX() + ((self.attackspeed_MinusSlot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.attackspeed_MinusSlot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC308: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.castspeed_SlotBG)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.castspeed, "castspeed_SlotBG_" .. idx)
    CopyBaseProperty(self._potentialSlotBG, (self.castspeed_SlotBG)[idx])
    ;
    ((self.castspeed_SlotBG)[idx]):SetShow(false)
    if idx == 0 then
      ((self.castspeed_SlotBG)[idx]):SetPosX(0)
    else
      ;
      ((self.castspeed_SlotBG)[idx]):SetPosX(((self.castspeed_SlotBG)[idx - 1]):GetPosX() + ((self.castspeed_SlotBG)[idx - 1]):GetSizeX())
    end
    ;
    ((self.castspeed_SlotBG)[idx]):SetPosY(21)
    -- DECOMPILER ERROR at PC358: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.castspeed_Slot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.castspeed, "castspeed_Slot_" .. idx)
    CopyBaseProperty(self._potentialSlot, (self.castspeed_Slot)[idx])
    ;
    ((self.castspeed_Slot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.castspeed_Slot)[idx]):SetPosX(0)
    else
      ;
      ((self.castspeed_Slot)[idx]):SetPosX(((self.castspeed_Slot)[idx - 1]):GetPosX() + ((self.castspeed_Slot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.castspeed_Slot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC409: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.castspeed_MinusSlot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.castspeed, "castspeed_MinusSlot_" .. idx)
    CopyBaseProperty(self._potentialMinusSlot, (self.castspeed_MinusSlot)[idx])
    ;
    ((self.castspeed_MinusSlot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.castspeed_MinusSlot)[idx]):SetPosX(0)
    else
      ;
      ((self.castspeed_MinusSlot)[idx]):SetPosX(((self.castspeed_MinusSlot)[idx - 1]):GetPosX() + ((self.castspeed_MinusSlot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.castspeed_MinusSlot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC460: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.movespeed_SlotBG)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.movespeed, "movespeed_SlotBG_" .. idx)
    CopyBaseProperty(self._potentialSlotBG, (self.movespeed_SlotBG)[idx])
    ;
    ((self.movespeed_SlotBG)[idx]):SetShow(false)
    if idx == 0 then
      ((self.movespeed_SlotBG)[idx]):SetPosX(0)
    else
      ;
      ((self.movespeed_SlotBG)[idx]):SetPosX(((self.movespeed_SlotBG)[idx - 1]):GetPosX() + ((self.movespeed_SlotBG)[idx - 1]):GetSizeX())
    end
    ;
    ((self.movespeed_SlotBG)[idx]):SetPosY(21)
    -- DECOMPILER ERROR at PC510: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.movespeed_Slot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.movespeed, "movespeed_Slot_" .. idx)
    CopyBaseProperty(self._potentialSlot, (self.movespeed_Slot)[idx])
    ;
    ((self.movespeed_Slot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.movespeed_Slot)[idx]):SetPosX(0)
    else
      ;
      ((self.movespeed_Slot)[idx]):SetPosX(((self.movespeed_Slot)[idx - 1]):GetPosX() + ((self.movespeed_Slot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.movespeed_Slot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC561: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.movespeed_MinusSlot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.movespeed, "movespeed_MinusSlot_" .. idx)
    CopyBaseProperty(self._potentialMinusSlot, (self.movespeed_MinusSlot)[idx])
    ;
    ((self.movespeed_MinusSlot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.movespeed_MinusSlot)[idx]):SetPosX(0)
    else
      ;
      ((self.movespeed_MinusSlot)[idx]):SetPosX(((self.movespeed_MinusSlot)[idx - 1]):GetPosX() + ((self.movespeed_MinusSlot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.movespeed_MinusSlot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC612: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.critical_SlotBG)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.critical, "critical_SlotBG_" .. idx)
    CopyBaseProperty(self._potentialSlotBG, (self.critical_SlotBG)[idx])
    ;
    ((self.critical_SlotBG)[idx]):SetShow(false)
    if idx == 0 then
      ((self.critical_SlotBG)[idx]):SetPosX(0)
    else
      ;
      ((self.critical_SlotBG)[idx]):SetPosX(((self.critical_SlotBG)[idx - 1]):GetPosX() + ((self.critical_SlotBG)[idx - 1]):GetSizeX())
    end
    ;
    ((self.critical_SlotBG)[idx]):SetPosY(21)
    -- DECOMPILER ERROR at PC662: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.critical_Slot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.critical, "critical_Slot_" .. idx)
    CopyBaseProperty(self._potentialSlot, (self.critical_Slot)[idx])
    ;
    ((self.critical_Slot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.critical_Slot)[idx]):SetPosX(0)
    else
      ;
      ((self.critical_Slot)[idx]):SetPosX(((self.critical_Slot)[idx - 1]):GetPosX() + ((self.critical_Slot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.critical_Slot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC713: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.critical_MinusSlot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.critical, "critical_MinusSlot_" .. idx)
    CopyBaseProperty(self._potentialMinusSlot, (self.critical_MinusSlot)[idx])
    ;
    ((self.critical_MinusSlot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.critical_MinusSlot)[idx]):SetPosX(0)
    else
      ;
      ((self.critical_MinusSlot)[idx]):SetPosX(((self.critical_MinusSlot)[idx - 1]):GetPosX() + ((self.critical_MinusSlot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.critical_MinusSlot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC764: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.fishTime_SlotBG)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.fishTime, "fishTime_SlotBG_" .. idx)
    CopyBaseProperty(self._potentialSlotBG, (self.fishTime_SlotBG)[idx])
    ;
    ((self.fishTime_SlotBG)[idx]):SetShow(false)
    if idx == 0 then
      ((self.fishTime_SlotBG)[idx]):SetPosX(0)
    else
      ;
      ((self.fishTime_SlotBG)[idx]):SetPosX(((self.fishTime_SlotBG)[idx - 1]):GetPosX() + ((self.fishTime_SlotBG)[idx - 1]):GetSizeX())
    end
    ;
    ((self.fishTime_SlotBG)[idx]):SetPosY(21)
    -- DECOMPILER ERROR at PC814: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.fishTime_Slot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.fishTime, "fishTime_Slot_" .. idx)
    CopyBaseProperty(self._potentialSlot, (self.fishTime_Slot)[idx])
    ;
    ((self.fishTime_Slot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.fishTime_Slot)[idx]):SetPosX(0)
    else
      ;
      ((self.fishTime_Slot)[idx]):SetPosX(((self.fishTime_Slot)[idx - 1]):GetPosX() + ((self.fishTime_Slot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.fishTime_Slot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC865: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.fishTime_MinusSlot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.fishTime, "fishTime_MinusSlot_" .. idx)
    CopyBaseProperty(self._potentialMinusSlot, (self.fishTime_MinusSlot)[idx])
    ;
    ((self.fishTime_MinusSlot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.fishTime_MinusSlot)[idx]):SetPosX(0)
    else
      ;
      ((self.fishTime_MinusSlot)[idx]):SetPosX(((self.fishTime_MinusSlot)[idx - 1]):GetPosX() + ((self.fishTime_MinusSlot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.fishTime_MinusSlot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC916: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.product_SlotBG)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.product, "product_SlotBG_" .. idx)
    CopyBaseProperty(self._potentialSlotBG, (self.product_SlotBG)[idx])
    ;
    ((self.product_SlotBG)[idx]):SetShow(false)
    if idx == 0 then
      ((self.product_SlotBG)[idx]):SetPosX(0)
    else
      ;
      ((self.product_SlotBG)[idx]):SetPosX(((self.product_SlotBG)[idx - 1]):GetPosX() + ((self.product_SlotBG)[idx - 1]):GetSizeX())
    end
    ;
    ((self.product_SlotBG)[idx]):SetPosY(21)
    -- DECOMPILER ERROR at PC966: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.product_Slot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.product, "product_Slot_" .. idx)
    CopyBaseProperty(self._potentialSlot, (self.product_Slot)[idx])
    ;
    ((self.product_Slot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.product_Slot)[idx]):SetPosX(0)
    else
      ;
      ((self.product_Slot)[idx]):SetPosX(((self.product_Slot)[idx - 1]):GetPosX() + ((self.product_Slot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.product_Slot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC1017: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.product_MinusSlot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.product, "product_MinusSlot_" .. idx)
    CopyBaseProperty(self._potentialMinusSlot, (self.product_MinusSlot)[idx])
    ;
    ((self.product_MinusSlot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.product_MinusSlot)[idx]):SetPosX(0)
    else
      ;
      ((self.product_MinusSlot)[idx]):SetPosX(((self.product_MinusSlot)[idx - 1]):GetPosX() + ((self.product_MinusSlot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.product_MinusSlot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC1068: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.dropChance_SlotBG)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.dropChance, "dropChance_SlotBG_" .. idx)
    CopyBaseProperty(self._potentialSlotBG, (self.dropChance_SlotBG)[idx])
    ;
    ((self.dropChance_SlotBG)[idx]):SetShow(false)
    if idx == 0 then
      ((self.dropChance_SlotBG)[idx]):SetPosX(0)
    else
      ;
      ((self.dropChance_SlotBG)[idx]):SetPosX(((self.dropChance_SlotBG)[idx - 1]):GetPosX() + ((self.dropChance_SlotBG)[idx - 1]):GetSizeX())
    end
    ;
    ((self.dropChance_SlotBG)[idx]):SetPosY(21)
    -- DECOMPILER ERROR at PC1118: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.dropChance_Slot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.dropChance, "dropChance_Slot_" .. idx)
    CopyBaseProperty(self._potentialSlot, (self.dropChance_Slot)[idx])
    ;
    ((self.dropChance_Slot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.dropChance_Slot)[idx]):SetPosX(0)
    else
      ;
      ((self.dropChance_Slot)[idx]):SetPosX(((self.dropChance_Slot)[idx - 1]):GetPosX() + ((self.dropChance_Slot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.dropChance_Slot)[idx]):SetPosY(22)
    -- DECOMPILER ERROR at PC1169: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.dropChance_MinusSlot)[idx] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.dropChance, "dropChance_MinusSlot_" .. idx)
    CopyBaseProperty(self._potentialMinusSlot, (self.dropChance_MinusSlot)[idx])
    ;
    ((self.dropChance_MinusSlot)[idx]):SetShow(false)
    if idx == 0 then
      ((self.dropChance_MinusSlot)[idx]):SetPosX(0)
    else
      ;
      ((self.dropChance_MinusSlot)[idx]):SetPosX(((self.dropChance_MinusSlot)[idx - 1]):GetPosX() + ((self.dropChance_MinusSlot)[idx - 1]):GetSizeX() + 2)
    end
    ;
    ((self.dropChance_MinusSlot)[idx]):SetPosY(22)
  end
  if isFamilyPoint then
    (self.familyPoints):SetShow(true)
    ;
    (self.familyCombatPoints):SetShow(true)
    ;
    (self.familyLifePoints):SetShow(true)
    ;
    (self.familyEtcPoints):SetShow(true)
    ;
    (self.familyLeftBracket):SetShow(true)
    ;
    (self.familyRightBracket):SetShow(true)
  else
    ;
    (self.familyPoints):SetShow(false)
    ;
    (self.familyCombatPoints):SetShow(false)
    ;
    (self.familyLifePoints):SetShow(false)
    ;
    (self.familyEtcPoints):SetShow(false)
    ;
    (self.familyLeftBracket):SetShow(false)
    ;
    (self.familyRightBracket):SetShow(false)
  end
  if ToClient_IsContentsGroupOpen("83") then
    (self._sailTitle):SetShow(true)
    ;
    (self._sail):SetShow(true)
    ;
    (self._sailPercent):SetShow(true)
    ;
    (self._progress2_sail):SetShow(true)
    ;
    (self.sailProgressBG):SetShow(true)
    ;
    (self.sailIcon):SetShow(true)
  else
    ;
    (self._sailTitle):SetShow(false)
    ;
    (self._sail):SetShow(false)
    ;
    (self._sailPercent):SetShow(false)
    ;
    (self._progress2_sail):SetShow(false)
    ;
    (self.sailProgressBG):SetShow(false)
    ;
    (self.sailIcon):SetShow(false)
  end
  ;
  (CharacterInfo._PcRoomTimer):addInputEvent("Mouse_On", "CharacterInfo_SimpleTooltip( true, 0 )")
  ;
  (CharacterInfo._PcRoomTimer):addInputEvent("Mouse_Out", "CharacterInfo_SimpleTooltip()")
  ;
  (CharacterInfo._todayPlayTime):addInputEvent("Mouse_On", "CharacterInfo_SimpleTooltip( true, 1 )")
  ;
  (CharacterInfo._todayPlayTime):addInputEvent("Mouse_Out", "CharacterInfo_SimpleTooltip()")
  ConsoleGroupCreate_Panel_Window_CharInfo_Status()
end

ConsoleGroupCreate_Panel_Window_CharInfo_Status = function()
  -- function num : 0_4 , upvalues : CharacterInfo, profileOpen
  local self = CharacterInfo
  local group_0 = Panel_Window_CharInfo_Status:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  if profileOpen then
    group_0:addControl(0, 0, 5, 1, self.BTN_Tab_Basic)
    group_0:addControl(1, 0, 5, 1, self.BTN_Tab_Title)
    group_0:addControl(2, 0, 5, 1, self.BTN_Tab_History)
    group_0:addControl(3, 0, 5, 1, self.BTN_Tab_Challenge)
    group_0:addControl(4, 0, 5, 1, self.BTN_Tab_Profile)
  else
    group_0:addControl(0, 0, 4, 1, self.BTN_Tab_Basic)
    group_0:addControl(1, 0, 4, 1, self.BTN_Tab_Title)
    group_0:addControl(2, 0, 4, 1, self.BTN_Tab_History)
    group_0:addControl(3, 0, 4, 1, self.BTN_Tab_Challenge)
  end
end

FGlobal_CraftLevel_Replace = function(lev, lifeType)
  -- function num : 0_5
  if lev >= 1 and lev <= 10 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_1") .. lev
  else
    if lev >= 11 and lev <= 20 then
      lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_2") .. lev - 10
    else
      if lev >= 21 and lev <= 30 then
        lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_3") .. lev - 20
      else
        if lev >= 31 and lev <= 40 then
          lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_4") .. lev - 30
        else
          if lev >= 41 and lev <= 50 then
            lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_5") .. lev - 40
          else
            if lev >= 51 and lev <= 80 then
              lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_6") .. lev - 50
            else
              if lev >= 81 and lev <= 100 then
                lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_7") .. lev - 80
              end
            end
          end
        end
      end
    end
  end
  return lev
end

FGlobal_CraftLevelColor_Replace = function(lev)
  -- function num : 0_6 , upvalues : UI_color
  if lev >= 1 and lev <= 10 then
    levColor = UI_color.C_FFC4C4C4
  else
    if lev >= 11 and lev <= 20 then
      levColor = UI_color.C_FF76B24D
    else
      if lev >= 21 and lev <= 30 then
        levColor = UI_color.C_FF3B8BBE
      else
        if lev >= 31 and lev <= 40 then
          levColor = UI_color.C_FFEBC467
        else
          if lev >= 41 and lev <= 50 then
            levColor = UI_color.C_FFD04D47
          else
            if lev >= 51 and lev <= 80 then
              levColor = UI_color.C_FFB23BC7
            else
              if lev >= 81 and lev <= 100 then
                levColor = UI_color.C_FFC78045
              end
            end
          end
        end
      end
    end
  end
  return levColor
end

FGlobal_CraftType_ReplaceName = function(typeNo)
  -- function num : 0_7
  local typeName = nil
  if typeNo == 0 then
    typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_GATHER")
  else
    if typeNo == 1 then
      typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FISH")
    else
      if typeNo == 2 then
        typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_HUNT")
      else
        if typeNo == 3 then
          typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_COOK")
        else
          if typeNo == 4 then
            typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_ALCHEMY")
          else
            if typeNo == 5 then
              typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_MANUFACTURE")
            else
              if typeNo == 6 then
                typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_OBEDIENCE")
              else
                if typeNo == 7 then
                  typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_TRADE")
                else
                  if typeNo == 8 then
                    typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_GROWTH")
                  else
                    if typeNo == 9 then
                      typeName = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_SAIL")
                    else
                      typeName = "???"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  return typeName
end

SelfCharacterInfo_UpdateCharacterBasicInfo = function()
  -- function num : 0_8 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local UI_classType = CppEnums.ClassType
  local FamiName = player:getUserNickname()
  ;
  (CharacterInfo._familyname):SetText(tostring(FamiName))
  local ChaName = player:getOriginalName()
  ;
  (CharacterInfo._charactername):SetText(tostring(ChaName))
  if player:getZodiacSignOrderStaticStatusWrapper() ~= nil then
    local ZodiacName = (player:getZodiacSignOrderStaticStatusWrapper()):getZodiacName()
    ;
    (CharacterInfo._zodiac):SetText(tostring(ZodiacName))
  end
end

SelfCharacterInfo_UpdateAffiliatedTerritory = function()
  -- function num : 0_9 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  local affiliatedTerritoryKey = temporaryWrapper:getAffiliatedTerritoryKeyRaw()
  local territoryInfoWrapper = getTerritoryInfoWrapper(affiliatedTerritoryKey)
  local affiliatedterritoryName = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_AFFILIATEDTERRITORY")
  if territoryInfoWrapper ~= nil then
    affiliatedterritoryName = territoryInfoWrapper:getTerritoryName()
  end
  ;
  (CharacterInfo._affiliatedterritory):SetText(tostring(affiliatedterritoryName))
end

SelfCharacterInfo_UpdateWp = function()
  -- function num : 0_10 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local Wp = player:getWp()
  local maxWp = player:getMaxWp()
  ;
  (CharacterInfo._mental):SetText(tostring(Wp) .. " / " .. tostring(maxWp))
end

SelfCharacterInfo_UpdateExplorePoint = function()
  -- function num : 0_11 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local territoryKeyRaw = getDefaultTerritoryKey()
  local explorePoint = getExplorePointByTerritoryRaw(territoryKeyRaw)
  ;
  (CharacterInfo._contribution):SetText(tostring(explorePoint:getRemainedPoint()) .. " / " .. tostring(explorePoint:getAquiredPoint()))
end

SelfCharacterInfo_UpdateLevel = function()
  -- function num : 0_12 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local ChaLevel = playerGet:getLevel()
  ;
  (CharacterInfo._characterlevel):SetText(tostring(ChaLevel))
  local needExp = playerGet:getNeedExp_s64()
  local currentExp = playerGet:getExp_s64()
  local _const = Defines.s64_const
  local expRate = 0
  if _const.s64_10000 < needExp then
    expRate = Int64toInt32(currentExp / (needExp / _const.s64_100))
  else
    if _const.s64_0 ~= needExp then
      expRate = Int64toInt32(currentExp * _const.s64_100 / needExp)
    end
  end
  ;
  (CharacterInfo._progress2_characterlevel):SetProgressRate(expRate)
end

SelfCharacterInfo_UpdateFamilyPoints = function()
  -- function num : 0_13 , upvalues : CharacterInfo
  local self = CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local battleFP = playerGet:getBattleFamilyPoint()
  local lifeFP = playerGet:getLifeFamilyPoint()
  local etcFP = playerGet:getEtcFamilyPoint()
  local sumFP = battleFP + lifeFP + etcFP
  ;
  (self.familyPoints):SetText(tostring(sumFP))
  ;
  (self.familyCombatPoints):SetText(tostring(battleFP))
  ;
  (self.familyLifePoints):SetText(tostring(lifeFP))
  ;
  (self.familyEtcPoints):SetText(tostring(etcFP))
end

SelfCharacterInfo_UpdateMainStatus = function()
  -- function num : 0_14 , upvalues : CharacterInfo, profileOpen
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local UI_classType = CppEnums.ClassType
  local hp = playerGet:getHp()
  local maxHp = playerGet:getMaxHp()
  local hpRate = hp / maxHp * 100
  ;
  (CharacterInfo._hpvalue):SetText(makeDotMoney(hp) .. " / " .. makeDotMoney(maxHp))
  ;
  (CharacterInfo._progress2_hp):SetProgressRate(hpRate)
  if UI_classType.ClassType_Ranger == player:getClassType() then
    (CharacterInfo._mpTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_EP"))
    ;
    (CharacterInfo._progress2_mp):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(CharacterInfo._progress2_mp, 2, 71, 232, 76)
    ;
    ((CharacterInfo._progress2_mp):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (CharacterInfo._progress2_mp):setRenderTexture((CharacterInfo._progress2_mp):getBaseTexture())
  else
    do
      if UI_classType.ClassType_Warrior == player:getClassType() or UI_classType.ClassType_Giant == player:getClassType() or UI_classType.ClassType_BladeMaster == player:getClassType() or UI_classType.ClassType_BladeMasterWomen == player:getClassType() or UI_classType.ClassType_NinjaWomen == player:getClassType() or UI_classType.ClassType_NinjaMan == player:getClassType() or UI_classType.ClassType_Combattant == player:getClassType() or UI_classType.ClassType_CombattantWomen == player:getClassType() then
        (CharacterInfo._mpTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_FP"))
        ;
        (CharacterInfo._progress2_mp):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(CharacterInfo._progress2_mp, 2, 57, 232, 62)
        ;
        ((CharacterInfo._progress2_mp):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (CharacterInfo._progress2_mp):setRenderTexture((CharacterInfo._progress2_mp):getBaseTexture())
      else
        do
          if UI_classType.ClassType_Sorcerer == player:getClassType() or UI_classType.ClassType_Tamer == player:getClassType() or UI_classType.ClassType_Wizard == player:getClassType() or UI_classType.ClassType_WizardWomen == player:getClassType() then
            (CharacterInfo._mpTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MP"))
            ;
            (CharacterInfo._progress2_mp):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(CharacterInfo._progress2_mp, 2, 64, 232, 69)
            ;
            ((CharacterInfo._progress2_mp):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (CharacterInfo._progress2_mp):setRenderTexture((CharacterInfo._progress2_mp):getBaseTexture())
          else
            do
              if UI_classType.ClassType_Valkyrie == player:getClassType() then
                (CharacterInfo._mpTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_BP"))
                ;
                (CharacterInfo._progress2_mp):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(CharacterInfo._progress2_mp, 2, 250, 232, 255)
                ;
                ((CharacterInfo._progress2_mp):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (CharacterInfo._progress2_mp):setRenderTexture((CharacterInfo._progress2_mp):getBaseTexture())
              else
                do
                  if UI_classType.ClassType_DarkElf == player:getClassType() then
                    (CharacterInfo._mpTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_EP"))
                    ;
                    (CharacterInfo._progress2_mp):ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges_03.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(CharacterInfo._progress2_mp, 1, 1, 256, 10)
                    ;
                    ((CharacterInfo._progress2_mp):getBaseTexture()):setUV(x1, y1, x2, y2)
                    ;
                    (CharacterInfo._progress2_mp):setRenderTexture((CharacterInfo._progress2_mp):getBaseTexture())
                  end
                  do
                    local mp = playerGet:getMp()
                    local maxMp = playerGet:getMaxMp()
                    local MpRate = mp / maxMp * 100
                    ;
                    (CharacterInfo._mpvalue):SetText(makeDotMoney(mp) .. " / " .. makeDotMoney(maxMp))
                    ;
                    (CharacterInfo._progress2_mp):SetProgressRate(MpRate)
                    local totalPlayTime = ((Util.Time).timeFormatting_Minute)(Int64toInt32(ToClient_GetCharacterPlayTime()))
                    ;
                    (CharacterInfo._selfTimer):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONTRACT_TIME_BLACKSPIRIT") .. "<PAColor0xFFFFC730> " .. totalPlayTime .. "<PAOldColor> ")
                    ;
                    (CharacterInfo._selfTimer):SetSize((CharacterInfo._selfTimer):GetTextSizeX(), (CharacterInfo._selfTimer):GetSizeY())
                    ;
                    (CharacterInfo._selfTimer):ComputePos()
                    ;
                    (CharacterInfo._selfTimerIcon):SetPosX((CharacterInfo._selfTimer):GetPosX() - (CharacterInfo._selfTimerIcon):GetSizeX())
                    local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
                    local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
                    local userPlayTime = ((Util.Time).timeFormatting)(Int64toInt32(ToClient_GetUserPlayTimePerDay()))
                    ;
                    (CharacterInfo._todayPlayTime):SetShow(true)
                    ;
                    (CharacterInfo._PcRoomTimer):SetShow(false)
                    ;
                    (CharacterInfo._todayPlayTime):SetPosX(521)
                    ;
                    (CharacterInfo._todayPlayTime):SetPosY(58)
                    if isPremiumPcRoom and (isGameTypeKorea() or isGameTypeJapan()) then
                      (CharacterInfo._PcRoomTimer):SetShow(true)
                      ;
                      (CharacterInfo._PcRoomTimer):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_PCROOMTIME", "getPcRoomPlayTime", convertStringFromDatetime(ToClient_GetPcRoomPlayTime())))
                      ;
                      (CharacterInfo._todayPlayTime):SetText("<PAColor0xFFFFC730>" .. tostring(userPlayTime) .. "<PAOldColor>")
                    else
                      ;
                      (CharacterInfo._PcRoomTimer):SetShow(false)
                      ;
                      (CharacterInfo._todayPlayTime):SetText("<PAColor0xFFFFC730>" .. tostring(userPlayTime) .. "<PAOldColor>")
                    end
                    ;
                    (CharacterInfo._PcRoomTimer):SetPosX((CharacterInfo._todayPlayTime):GetPosX() + (CharacterInfo._todayPlayTime):GetTextSizeX() + 20)
                    ;
                    (CharacterInfo._PcRoomTimer):SetPosY(60)
                    if profileOpen then
                      (CharacterInfo._selfTimer):SetShow(false)
                      ;
                      (CharacterInfo._selfTimerIcon):SetShow(false)
                      ;
                      (CharacterInfo._PcRoomTimer):SetShow(false)
                      ;
                      (CharacterInfo._todayPlayTime):SetShow(false)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

;
(CharacterInfo._selfTimer):addInputEvent("Mouse_LUp", "HandleClicked_SelfTimer_BlackAnimation()")
HandleClicked_SelfTimer_BlackAnimation = function()
  -- function num : 0_15 , upvalues : CharacterInfo
  (CharacterInfo._selfTimerIcon):ResetVertexAni()
  ;
  (CharacterInfo._selfTimerIcon):SetVertexAniRun("Ani_Rotate_New", true)
end

SelfCharacterInfo_UpdateMainStatusRegen = function()
  -- function num : 0_16 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local UI_classType = CppEnums.ClassType
  ;
  (CharacterInfo._hpRegen):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_HPREGEN") .. " : " .. tostring(playerGet:getRegenHp()))
  ;
  (CharacterInfo._hpRegen):SetSize((CharacterInfo._hpRegen):GetTextSizeX() + 10, 30)
  if UI_classType.ClassType_Ranger == player:getClassType() or UI_classType.ClassType_DarkElf == player:getClassType() then
    (CharacterInfo._mpRegen):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_EPREGEN") .. " : " .. tostring(playerGet:getRegenMp()))
  else
    if UI_classType.ClassType_Sorcerer == player:getClassType() or UI_classType.ClassType_Tamer == player:getClassType() or UI_classType.ClassType_Wizard == player:getClassType() or UI_classType.ClassType_WizardWomen == player:getClassType() then
      (CharacterInfo._mpRegen):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MPREGEN") .. " : " .. tostring(playerGet:getRegenMp()))
    else
      if UI_classType.ClassType_Valkyrie == player:getClassType() then
        (CharacterInfo._mpRegen):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_BPREGEN") .. " : " .. tostring(playerGet:getRegenMp()))
      else
        if UI_classType.ClassType_Warrior == player:getClassType() or UI_classType.ClassType_Giant == player:getClassType() or UI_classType.ClassType_BladeMaster == player:getClassType() or UI_classType.ClassType_BladeMasterWomen == player:getClassType() or UI_classType.ClassType_NinjaWomen == player:getClassType() or UI_classType.ClassType_NinjaMan == player:getClassType() or UI_classType.ClassType_Combattant == player:getClassType() or UI_classType.ClassType_CombattantWomen == player:getClassType() then
          (CharacterInfo._mpRegen):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_FPREGEN") .. " : " .. tostring(playerGet:getRegenMp()))
        end
      end
    end
  end
  ;
  (CharacterInfo._mpRegen):SetSize((CharacterInfo._mpRegen):GetTextSizeX() + 10, 30)
end

SelfCharacterInfo_UpdateWeight = function()
  -- function num : 0_17 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local _const = Defines.s64_const
  local selfPlayer = player:get()
  local s64_moneyWeight = (selfPlayer:getInventory()):getMoneyWeight_s64()
  local s64_equipmentWeight = (selfPlayer:getEquipment()):getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local s64_allWeight_div = s64_allWeight / _const.s64_100
  local s64_maxWeight_div = s64_maxWeight / _const.s64_100
  local str_AllWeight = (string.format)("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local str_MaxWeight = (string.format)("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  if s64_allWeight_div <= s64_maxWeight_div then
    (CharacterInfo._progress2_weightvalue_Money):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_maxWeight_div))
    ;
    (CharacterInfo._progress2_weightvalue_Equip):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_maxWeight_div))
    ;
    (CharacterInfo._progress2_weightvalue_Inventory):SetProgressRate(Int64toInt32(s64_allWeight / s64_maxWeight_div))
  else
    ;
    (CharacterInfo._progress2_weightvalue_Money):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_allWeight_div))
    ;
    (CharacterInfo._progress2_weightvalue_Equip):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_allWeight_div))
    ;
    (CharacterInfo._progress2_weightvalue_Inventory):SetProgressRate(Int64toInt32(s64_allWeight / s64_allWeight_div))
  end
  ;
  (CharacterInfo._weightvalue):SetText(tostring(str_AllWeight) .. " / " .. tostring(str_MaxWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end

SelfCharacterInfo_UpdateAttackStat = function()
  -- function num : 0_18 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  updateAttackStat()
  local ChaAttack = getOffence()
  ;
  (CharacterInfo._attack):SetText(tostring(ChaAttack))
  local ChaAwakenAttack = getAwakenOffence()
  local isSetAwakenWeapon = getEquipmentItem((CppEnums.EquipSlotNo).awakenWeapon)
  if isSetAwakenWeapon ~= nil then
    (CharacterInfo._awakenAttackTitle):SetShow(true)
    ;
    (CharacterInfo._awakenAttack):SetShow(true)
    ;
    (CharacterInfo._awakenAttack):SetText(tostring(ChaAwakenAttack))
    ;
    (CharacterInfo._staminaTitle):SetSpanSize(550, 157)
    ;
    (CharacterInfo._stamina):SetSpanSize(655, 152)
  else
    ;
    (CharacterInfo._awakenAttackTitle):SetShow(false)
    ;
    (CharacterInfo._awakenAttack):SetShow(false)
    ;
    (CharacterInfo._staminaTitle):SetSpanSize(385, 182)
    ;
    (CharacterInfo._stamina):SetSpanSize(490, 177)
  end
  local ChaDefence = getDefence()
  ;
  (CharacterInfo._defence):SetText(tostring(ChaDefence))
end

SelfCharacterInfo_UpdateTendency = function()
  -- function num : 0_19 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local ChaTendency = playerGet:getTendency()
  ;
  (CharacterInfo._tendency):SetText(tostring(ChaTendency))
end

SelfCharacterInfo_UpdateStamina = function()
  -- function num : 0_20 , upvalues : CharacterInfo
  (CharacterInfo._stamina):SetText(makeDotMoney((((getSelfPlayer()):get()):getStamina()):getMaxSp()))
end

SelfCharacterInfo_UpdateCraftLevel = function()
  -- function num : 0_21 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local craftType = {gather = 0, fishing = 1, hunting = 2, cooking = 3, alchemy = 4, manufacture = 5, training = 6, trade = 7, growth = 8, sail = 9, levelText = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL")}
  local gatherLevel = playerGet:getLifeExperienceLevel(craftType.gather)
  local gatherCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.gather)
  local gatherMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.gather)
  local gatherExpRate = Int64toInt32(gatherCurrentExp * toInt64(0, 100) / gatherMaxExp)
  ;
  (CharacterInfo._gather):SetText(FGlobal_CraftLevel_Replace(gatherLevel, craftType.gather))
  ;
  (CharacterInfo._gather):SetFontColor(FGlobal_CraftLevelColor_Replace(gatherLevel))
  ;
  (CharacterInfo._progress2_gather):SetProgressRate(gatherExpRate)
  ;
  (CharacterInfo._gatherPercent):SetText(gatherExpRate .. "%")
  ;
  (CharacterInfo._gatherPercent):SetFontColor(FGlobal_CraftLevelColor_Replace(gatherLevel))
  local manufatureLevel = playerGet:getLifeExperienceLevel(craftType.manufacture)
  local manufatureCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.manufacture)
  local manufatureMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.manufacture)
  local manufatureExpRate = Int64toInt32(manufatureCurrentExp * toInt64(0, 100) / manufatureMaxExp)
  ;
  (CharacterInfo._manufacture):SetText(FGlobal_CraftLevel_Replace(manufatureLevel, craftType.manufacture))
  ;
  (CharacterInfo._manufacture):SetFontColor(FGlobal_CraftLevelColor_Replace(manufatureLevel))
  ;
  (CharacterInfo._progress2_manufacture):SetProgressRate(manufatureExpRate)
  ;
  (CharacterInfo._manufacturePercent):SetText(manufatureExpRate .. "%")
  ;
  (CharacterInfo._manufacturePercent):SetFontColor(FGlobal_CraftLevelColor_Replace(manufatureLevel))
  local cookingLevel = playerGet:getLifeExperienceLevel(craftType.cooking)
  local cookingCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.cooking)
  local cookingMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.cooking)
  local cookingExpRate = Int64toInt32(cookingCurrentExp * toInt64(0, 100) / cookingMaxExp)
  ;
  (CharacterInfo._cooking):SetText(FGlobal_CraftLevel_Replace(cookingLevel, craftType.cooking))
  ;
  (CharacterInfo._cooking):SetFontColor(FGlobal_CraftLevelColor_Replace(cookingLevel))
  ;
  (CharacterInfo._progress2_cooking):SetProgressRate(cookingExpRate)
  ;
  (CharacterInfo._cookingPercent):SetText(cookingExpRate .. "%")
  ;
  (CharacterInfo._cookingPercent):SetFontColor(FGlobal_CraftLevelColor_Replace(cookingLevel))
  local alchemyLevel = playerGet:getLifeExperienceLevel(craftType.alchemy)
  local alchemyCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.alchemy)
  local alchemyMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.alchemy)
  local alchemyExpRate = Int64toInt32(alchemyCurrentExp * toInt64(0, 100) / alchemyMaxExp)
  ;
  (CharacterInfo._alchemy):SetText(FGlobal_CraftLevel_Replace(alchemyLevel, craftType.alchemy))
  ;
  (CharacterInfo._alchemy):SetFontColor(FGlobal_CraftLevelColor_Replace(alchemyLevel))
  ;
  (CharacterInfo._progress2_alchemy):SetProgressRate(alchemyExpRate)
  ;
  (CharacterInfo._alchemyPercent):SetText(alchemyExpRate .. "%")
  ;
  (CharacterInfo._alchemyPercent):SetFontColor(FGlobal_CraftLevelColor_Replace(alchemyLevel))
  local fishingLevel = playerGet:getLifeExperienceLevel(craftType.fishing)
  local fishingCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.fishing)
  local fishingMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.fishing)
  local fishingExpRate = Int64toInt32(fishingCurrentExp * toInt64(0, 100) / fishingMaxExp)
  ;
  (CharacterInfo._fishing):SetText(FGlobal_CraftLevel_Replace(fishingLevel, craftType.fishing))
  ;
  (CharacterInfo._fishing):SetFontColor(FGlobal_CraftLevelColor_Replace(fishingLevel))
  ;
  (CharacterInfo._progress2_fishing):SetProgressRate(fishingExpRate)
  ;
  (CharacterInfo._fishingPercent):SetText(fishingExpRate .. "%")
  ;
  (CharacterInfo._fishingPercent):SetFontColor(FGlobal_CraftLevelColor_Replace(fishingLevel))
  local huntingLevel = playerGet:getLifeExperienceLevel(craftType.hunting)
  local huntingCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.hunting)
  local huntingMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.hunting)
  local huntingExpRate = Int64toInt32(huntingCurrentExp * toInt64(0, 100) / huntingMaxExp)
  ;
  (CharacterInfo._hunting):SetText(FGlobal_CraftLevel_Replace(huntingLevel, craftType.hunting))
  ;
  (CharacterInfo._hunting):SetFontColor(FGlobal_CraftLevelColor_Replace(huntingLevel))
  ;
  (CharacterInfo._progress2_hunting):SetProgressRate(huntingExpRate)
  ;
  (CharacterInfo._huntingPercent):SetText(huntingExpRate .. "%")
  ;
  (CharacterInfo._huntingPercent):SetFontColor(FGlobal_CraftLevelColor_Replace(huntingLevel))
  local trainingLevel = playerGet:getLifeExperienceLevel(craftType.training)
  local trainingCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.training)
  local trainingMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.training)
  local trainingExpRate = Int64toInt32(trainingCurrentExp * toInt64(0, 100) / trainingMaxExp)
  ;
  (CharacterInfo._training):SetText(FGlobal_CraftLevel_Replace(trainingLevel, craftType.training))
  ;
  (CharacterInfo._training):SetFontColor(FGlobal_CraftLevelColor_Replace(trainingLevel))
  ;
  (CharacterInfo._progress2_training):SetProgressRate(trainingExpRate)
  ;
  (CharacterInfo._trainingPercent):SetText(trainingExpRate .. "%")
  ;
  (CharacterInfo._trainingPercent):SetFontColor(FGlobal_CraftLevelColor_Replace(trainingLevel))
  local tradeLevel = playerGet:getLifeExperienceLevel(craftType.trade)
  local tradeCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.trade)
  local tradeMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.trade)
  local tradeExpRate = Int64toInt32(tradeCurrentExp * toInt64(0, 100) / tradeMaxExp)
  ;
  (CharacterInfo._trade):SetText(FGlobal_CraftLevel_Replace(tradeLevel, craftType.trade))
  ;
  (CharacterInfo._trade):SetFontColor(FGlobal_CraftLevelColor_Replace(tradeLevel))
  ;
  (CharacterInfo._progress2_trade):SetProgressRate(tradeExpRate)
  ;
  (CharacterInfo._tradePercent):SetText(tradeExpRate .. "%")
  ;
  (CharacterInfo._tradePercent):SetFontColor(FGlobal_CraftLevelColor_Replace(tradeLevel))
  local growthLevel = playerGet:getLifeExperienceLevel(craftType.growth)
  local growthCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.growth)
  local growthMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.growth)
  local growthExpRate = Int64toInt32(growthCurrentExp * toInt64(0, 100) / growthMaxExp)
  ;
  (CharacterInfo._growth):SetText(FGlobal_CraftLevel_Replace(growthLevel, craftType.growth))
  ;
  (CharacterInfo._growth):SetFontColor(FGlobal_CraftLevelColor_Replace(growthLevel))
  ;
  (CharacterInfo._progress2_growth):SetProgressRate(growthExpRate)
  ;
  (CharacterInfo._growthPercent):SetText(growthExpRate .. "%")
  ;
  (CharacterInfo._growthPercent):SetFontColor(FGlobal_CraftLevelColor_Replace(growthLevel))
  local sailLevel = playerGet:getLifeExperienceLevel(craftType.sail)
  local sailCurrentExp = playerGet:getCurrLifeExperiencePoint(craftType.sail)
  local sailMaxExp = playerGet:getDemandLifeExperiencePoint(craftType.sail)
  local sailExpRate = Int64toInt32(sailCurrentExp * toInt64(0, 100) / sailMaxExp)
  ;
  (CharacterInfo._sail):SetText(FGlobal_CraftLevel_Replace(sailLevel, craftType.sail))
  ;
  (CharacterInfo._sail):SetFontColor(FGlobal_CraftLevelColor_Replace(sailLevel))
  ;
  (CharacterInfo._progress2_sail):SetProgressRate(sailExpRate)
  ;
  (CharacterInfo._sailPercent):SetText(sailExpRate .. "%")
  ;
  (CharacterInfo._sailPercent):SetFontColor(FGlobal_CraftLevelColor_Replace(sailLevel))
end

SelfCharacterInfo_UpdatePotenGradeInfo = function()
  -- function num : 0_22 , upvalues : CharacterInfo, currentPotencial
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local potentialType = {move = 0, attack = 1, cast = 2, levelText = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_POTENLEVEL")}
  local currentAttackSpeedPoint = player:characterStatPointSpeed(potentialType.attack)
  local limitAttackSpeedPoint = player:characterStatPointLimitedSpeed(potentialType.attack)
  if limitAttackSpeedPoint < currentAttackSpeedPoint then
    currentAttackSpeedPoint = limitAttackSpeedPoint
  end
  local equipedAttackSpeedPoint = currentAttackSpeedPoint - 5
  local maxAttackSpeedPoint = limitAttackSpeedPoint - 5
  for Idx = 0, 6 do
    ((CharacterInfo.attackspeed_SlotBG)[Idx]):SetShow(false)
    ;
    ((CharacterInfo.attackspeed_Slot)[Idx]):SetShow(false)
    ;
    ((CharacterInfo.attackspeed_MinusSlot)[Idx]):SetShow(false)
  end
  for bg_Idx = 0, maxAttackSpeedPoint - 1 do
    ((CharacterInfo.attackspeed_SlotBG)[bg_Idx]):SetShow(true)
  end
  if equipedAttackSpeedPoint > 0 then
    for slot_Idx = 0, equipedAttackSpeedPoint - 1 do
      ((CharacterInfo.attackspeed_Slot)[slot_Idx]):SetShow(true)
    end
  else
    do
      local minus_equipedAttackSpeedPoint = -equipedAttackSpeedPoint
      for slot_Idx = 0, minus_equipedAttackSpeedPoint - 1 do
        ((CharacterInfo.attackspeed_MinusSlot)[slot_Idx]):SetShow(true)
      end
      do
        ;
        (CharacterInfo._asttackspeed):SetText(tostring(equipedAttackSpeedPoint) .. " " .. potentialType.levelText)
        -- DECOMPILER ERROR at PC99: Confused about usage of register: R7 in 'UnsetPending'

        currentPotencial[0] = equipedAttackSpeedPoint
        local currentCastingSpeedPoint = player:characterStatPointSpeed(potentialType.cast)
        local limitCastingSpeedPoint = player:characterStatPointLimitedSpeed(potentialType.cast)
        if limitCastingSpeedPoint < currentCastingSpeedPoint then
          currentCastingSpeedPoint = limitCastingSpeedPoint
        end
        local equipedCastingSpeedPoint = currentCastingSpeedPoint - 5
        local maxCastingSpeedPoint = limitCastingSpeedPoint - 5
        for Idx = 0, 6 do
          ((CharacterInfo.castspeed_SlotBG)[Idx]):SetShow(false)
          ;
          ((CharacterInfo.castspeed_Slot)[Idx]):SetShow(false)
          ;
          ((CharacterInfo.castspeed_MinusSlot)[Idx]):SetShow(false)
        end
        for bg_Idx = 0, maxCastingSpeedPoint - 1 do
          ((CharacterInfo.castspeed_SlotBG)[bg_Idx]):SetShow(true)
        end
        if equipedCastingSpeedPoint > 0 then
          for slot_Idx = 0, equipedCastingSpeedPoint - 1 do
            ((CharacterInfo.castspeed_Slot)[slot_Idx]):SetShow(true)
          end
        else
          do
            local minus_equipedCastingSpeedPoint = -equipedCastingSpeedPoint
            for slot_Idx = 0, minus_equipedCastingSpeedPoint - 1 do
              ((CharacterInfo.castspeed_MinusSlot)[slot_Idx]):SetShow(true)
            end
            do
              ;
              (CharacterInfo._castspeed):SetText(tostring(equipedCastingSpeedPoint) .. " " .. potentialType.levelText)
              -- DECOMPILER ERROR at PC182: Confused about usage of register: R11 in 'UnsetPending'

              currentPotencial[1] = equipedCastingSpeedPoint
              local currentMoveSpeedPoint = player:characterStatPointSpeed(potentialType.move)
              local limitMoveSpeedPoint = player:characterStatPointLimitedSpeed(potentialType.move)
              if limitMoveSpeedPoint < currentMoveSpeedPoint then
                currentMoveSpeedPoint = limitMoveSpeedPoint
              end
              local equipedMoveSpeedPoint = currentMoveSpeedPoint - 5
              local maxMoveSpeedPoint = limitMoveSpeedPoint - 5
              for Idx = 0, 6 do
                ((CharacterInfo.movespeed_SlotBG)[Idx]):SetShow(false)
                ;
                ((CharacterInfo.movespeed_Slot)[Idx]):SetShow(false)
                ;
                ((CharacterInfo.movespeed_MinusSlot)[Idx]):SetShow(false)
              end
              for bg_Idx = 0, maxMoveSpeedPoint - 1 do
                ((CharacterInfo.movespeed_SlotBG)[bg_Idx]):SetShow(true)
              end
              if equipedMoveSpeedPoint > 0 then
                for slot_Idx = 0, equipedMoveSpeedPoint - 1 do
                  ((CharacterInfo.movespeed_Slot)[slot_Idx]):SetShow(true)
                end
              else
                do
                  local minus_equipedMoveSpeedPoint = -equipedMoveSpeedPoint
                  for slot_Idx = 0, minus_equipedMoveSpeedPoint - 1 do
                    ((CharacterInfo.movespeed_MinusSlot)[slot_Idx]):SetShow(true)
                  end
                  do
                    ;
                    (CharacterInfo._movespeed):SetText(tostring(equipedMoveSpeedPoint) .. " " .. potentialType.levelText)
                    -- DECOMPILER ERROR at PC265: Confused about usage of register: R15 in 'UnsetPending'

                    currentPotencial[2] = equipedMoveSpeedPoint
                    local currentCriticalRatePoint = player:characterStatPointCritical()
                    local limitCriticalRatePoint = player:characterStatPointLimitedCritical()
                    if limitCriticalRatePoint < currentCriticalRatePoint then
                      currentCriticalRatePoint = limitCriticalRatePoint
                    end
                    local equipedCriticalRatePoint = currentCriticalRatePoint
                    local maxCriticalRatePoint = limitCriticalRatePoint
                    for Idx = 0, 6 do
                      ((CharacterInfo.critical_SlotBG)[Idx]):SetShow(false)
                      ;
                      ((CharacterInfo.critical_Slot)[Idx]):SetShow(false)
                      ;
                      ((CharacterInfo.critical_MinusSlot)[Idx]):SetShow(false)
                    end
                    for bg_Idx = 0, maxCriticalRatePoint - 1 do
                      ((CharacterInfo.critical_SlotBG)[bg_Idx]):SetShow(true)
                    end
                    if equipedCriticalRatePoint > 0 then
                      for slot_Idx = 0, equipedCriticalRatePoint - 1 do
                        ((CharacterInfo.critical_Slot)[slot_Idx]):SetShow(true)
                      end
                    else
                      do
                        local minus_equipedCriticalRatePoint = -equipedCriticalRatePoint
                        for slot_Idx = 0, minus_equipedCriticalRatePoint - 1 do
                          ((CharacterInfo.critical_MinusSlot)[slot_Idx]):SetShow(true)
                        end
                        do
                          ;
                          (CharacterInfo._critical):SetText(tostring(equipedCriticalRatePoint) .. " " .. potentialType.levelText)
                          -- DECOMPILER ERROR at PC346: Confused about usage of register: R19 in 'UnsetPending'

                          currentPotencial[3] = equipedCriticalRatePoint
                          local currentFishingRatePoint = player:getCharacterStatPointFishing()
                          local limitFishingRatePoint = player:getCharacterStatPointLimitedFishing()
                          if limitFishingRatePoint < currentFishingRatePoint then
                            currentFishingRatePoint = limitFishingRatePoint
                          end
                          local equipedFishingRatePoint = currentFishingRatePoint
                          local maxFishingRatePoint = limitFishingRatePoint
                          for Idx = 0, 6 do
                            ((CharacterInfo.fishTime_SlotBG)[Idx]):SetShow(false)
                            ;
                            ((CharacterInfo.fishTime_Slot)[Idx]):SetShow(false)
                            ;
                            ((CharacterInfo.fishTime_MinusSlot)[Idx]):SetShow(false)
                          end
                          for bg_Idx = 0, maxFishingRatePoint - 1 do
                            ((CharacterInfo.fishTime_SlotBG)[bg_Idx]):SetShow(true)
                          end
                          if equipedFishingRatePoint > 0 then
                            for slot_Idx = 0, equipedFishingRatePoint - 1 do
                              ((CharacterInfo.fishTime_Slot)[slot_Idx]):SetShow(true)
                            end
                          else
                            do
                              local minus_equipedFishingRatePoint = -equipedFishingRatePoint
                              for slot_Idx = 0, minus_equipedFishingRatePoint - 1 do
                                ((CharacterInfo.fishTime_MinusSlot)[slot_Idx]):SetShow(true)
                              end
                              do
                                ;
                                (CharacterInfo._fishTime):SetText(tostring(equipedFishingRatePoint) .. " " .. potentialType.levelText)
                                -- DECOMPILER ERROR at PC427: Confused about usage of register: R23 in 'UnsetPending'

                                currentPotencial[4] = equipedFishingRatePoint
                                local currentProductRatePoint = player:getCharacterStatPointCollection()
                                local limitProductRatePoint = player:getCharacterStatPointLimitedCollection()
                                if limitProductRatePoint < currentProductRatePoint then
                                  currentProductRatePoint = limitProductRatePoint
                                end
                                local equipedProductRatePoint = currentProductRatePoint
                                local maxProductRatePoint = limitProductRatePoint
                                for Idx = 0, 6 do
                                  ((CharacterInfo.product_SlotBG)[Idx]):SetShow(false)
                                  ;
                                  ((CharacterInfo.product_Slot)[Idx]):SetShow(false)
                                  ;
                                  ((CharacterInfo.product_MinusSlot)[Idx]):SetShow(false)
                                end
                                for bg_Idx = 0, maxProductRatePoint - 1 do
                                  ((CharacterInfo.product_SlotBG)[bg_Idx]):SetShow(true)
                                end
                                if equipedProductRatePoint > 0 then
                                  for slot_Idx = 0, equipedProductRatePoint - 1 do
                                    ((CharacterInfo.product_Slot)[slot_Idx]):SetShow(true)
                                  end
                                else
                                  do
                                    local minus_equipedProductRatePoint = -equipedProductRatePoint
                                    for slot_Idx = 0, minus_equipedProductRatePoint - 1 do
                                      ((CharacterInfo.product_MinusSlot)[slot_Idx]):SetShow(true)
                                    end
                                    do
                                      ;
                                      (CharacterInfo._product):SetText(tostring(equipedProductRatePoint) .. " " .. potentialType.levelText)
                                      -- DECOMPILER ERROR at PC508: Confused about usage of register: R27 in 'UnsetPending'

                                      currentPotencial[5] = equipedProductRatePoint
                                      local currentDropItemRatePoint = player:getCharacterStatPointDropItem()
                                      local limitDropItemRatePoint = player:getCharacterStatPointLimitedDropItem()
                                      if limitDropItemRatePoint < currentDropItemRatePoint then
                                        currentDropItemRatePoint = limitDropItemRatePoint
                                      end
                                      local equipedDropItemRatePoint = currentDropItemRatePoint
                                      local maxDropItemRatePoint = limitDropItemRatePoint
                                      for Idx = 0, 6 do
                                        ((CharacterInfo.dropChance_SlotBG)[Idx]):SetShow(false)
                                        ;
                                        ((CharacterInfo.dropChance_Slot)[Idx]):SetShow(false)
                                        ;
                                        ((CharacterInfo.dropChance_MinusSlot)[Idx]):SetShow(false)
                                      end
                                      for bg_Idx = 0, maxDropItemRatePoint - 1 do
                                        ((CharacterInfo.dropChance_SlotBG)[bg_Idx]):SetShow(true)
                                      end
                                      if equipedDropItemRatePoint > 0 then
                                        for slot_Idx = 0, equipedDropItemRatePoint - 1 do
                                          ((CharacterInfo.dropChance_Slot)[slot_Idx]):SetShow(true)
                                        end
                                      else
                                        do
                                          local minus_equipedDropItemRatePoint = -equipedDropItemRatePoint
                                          for slot_Idx = 0, minus_equipedDropItemRatePoint - 1 do
                                            ((CharacterInfo.dropChance_Slot)[slot_Idx]):SetShow(true)
                                          end
                                          do
                                            ;
                                            (CharacterInfo._dropChance):SetText(tostring(equipedDropItemRatePoint) .. " " .. potentialType.levelText)
                                            -- DECOMPILER ERROR at PC589: Confused about usage of register: R31 in 'UnsetPending'

                                            currentPotencial[6] = equipedDropItemRatePoint
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

CharacterInfoWindowUpdate = function()
  -- function num : 0_23
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local UI_classType = CppEnums.ClassType
  SelfCharacterInfo_UpdateCharacterBasicInfo()
  SelfCharacterInfo_UpdateTendency()
  SelfCharacterInfo_UpdateWp()
  SelfCharacterInfo_UpdateExplorePoint()
  SelfCharacterInfo_UpdateLevel()
  SelfCharacterInfo_UpdateMainStatus()
  SelfCharacterInfo_UpdateMainStatusRegen()
  SelfCharacterInfo_UpdateWeight()
  SelfCharacterInfo_UpdateAttackStat()
  SelfCharacterInfo_UpdateStamina()
  SelfCharacterInfo_UpdateFamilyPoints()
  SelfCharacterInfo_UpdateTolerance()
  SelfCharacterInfo_UpdateCraftLevel()
  SelfCharacterInfo_UpdatePotenGradeInfo()
end

CharacterInfo.SetConsolePadGroup = function(self, isShowIntroduce)
  -- function num : 0_24
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(1)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(2)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(3)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(4)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(5)
  local group_1 = Panel_Window_CharInfo_Status:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local group_2 = Panel_Window_CharInfo_Status:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local group_3 = Panel_Window_CharInfo_Status:addConsoleUIGroup(3, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local group_4 = Panel_Window_CharInfo_Status:addConsoleUIGroup(4, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local group_5 = Panel_Window_CharInfo_Status:addConsoleUIGroup(5, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  if isShowIntroduce then
    group_1:addControl(0, 0, 4, 1, (self._introduce)._editText)
    group_1:addControl(1, 0, 4, 1, (self._introduce)._btnSetIntro)
    group_1:addControl(2, 0, 4, 1, (self._introduce)._btnResetIntro)
    group_1:addControl(3, 0, 4, 1, (self._introduce)._closeIntro)
  else
    group_1:addControl(0, 0, 5, 1, self._btnIntroduce)
    group_1:addControl(1, 0, 5, 1, self.familyPoints)
    group_1:addControl(2, 0, 5, 1, self.familyCombatPoints)
    group_1:addControl(3, 0, 5, 1, self.familyLifePoints)
    group_1:addControl(4, 0, 5, 1, self.familyEtcPoints)
    group_1:addControl(5, 0, 5, 1, self._hpTitle)
    group_1:addControl(6, 0, 5, 1, self._mpTitle)
    group_1:addControl(7, 0, 5, 1, self._weightTitle)
    group_2:addControl(0, 0, 2, 7, self.attackspeed)
    group_2:addControl(1, 0, 2, 7, self._title_stamina)
    group_2:addControl(0, 1, 2, 7, self.castspeed)
    group_2:addControl(1, 1, 2, 7, self._title_strength)
    group_2:addControl(0, 2, 2, 7, self.movespeed)
    group_2:addControl(1, 2, 2, 7, self._title_health)
    group_2:addControl(0, 3, 2, 7, self.critical)
    group_2:addControl(1, 3, 2, 7, self._stunTitle)
    group_2:addControl(0, 4, 2, 7, self.fishTime)
    group_2:addControl(1, 4, 2, 7, self._downTitle)
    group_2:addControl(0, 5, 2, 7, self.product)
    group_2:addControl(1, 5, 2, 7, self._captureTitle)
    group_2:addControl(0, 6, 2, 7, self.dropChance)
    group_2:addControl(1, 6, 2, 7, self._knockBackTitle)
    group_3:addControl(0, 0, 11, 1, self._ranker)
    group_3:addControl(1, 0, 11, 1, self._gatherTitle)
    group_3:addControl(2, 0, 11, 1, self._manufactureTitle)
    group_3:addControl(3, 0, 11, 1, self._cookingTitle)
    group_3:addControl(4, 0, 11, 1, self._alchemyTitle)
    group_3:addControl(5, 0, 11, 1, self._trainingTitle)
    group_3:addControl(6, 0, 11, 1, self._fishingTitle)
    group_3:addControl(7, 0, 11, 1, self._huntingTitle)
    group_3:addControl(8, 0, 11, 1, self._tradeTitle)
    group_3:addControl(9, 0, 11, 1, self._growthTitle)
    group_3:addControl(10, 0, 11, 1, self._sailTitle)
  end
end

HandleClicked_CharacterInfo_Tab = function(index)
  -- function num : 0_25 , upvalues : CharacterInfo
  if index == nil then
    return 
  end
  IntroduceMyself_ShowToggle(false)
  local self = CharacterInfo
  ;
  (self._frameDefaultBG_Basic):SetShow(false)
  ;
  (self._frameDefaultBG_Title):SetShow(false)
  ;
  (self._frameDefaultBG_History):SetShow(false)
  ;
  (self._frameDefaultBG_Challenge):SetShow(false)
  ;
  (self._frameDefaultBG_Profile):SetShow(false)
  ;
  (CharacterInfo.BTN_Tab_Basic):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_Title):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_History):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_Challenge):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_Profile):SetCheck(false)
  if index == 0 then
    (self._frameDefaultBG_Basic):SetShow(true)
    ;
    (CharacterInfo.BTN_Tab_Basic):SetCheck(true)
    ;
    (CharacterInfo.BTN_Tab_Title):SetCheck(false)
    ;
    (CharacterInfo.BTN_Tab_History):SetCheck(false)
    ;
    (CharacterInfo.BTN_Tab_Challenge):SetCheck(false)
    ;
    (CharacterInfo.BTN_Tab_Profile):SetCheck(false)
    FromClientFitnessUp(0, 0, 0, 0)
    CharacterInfo:SetConsolePadGroup(isShowIntroduce)
  else
    if index == 1 then
      (self._frameDefaultBG_Title):SetShow(true)
      ;
      (CharacterInfo.BTN_Tab_Basic):SetCheck(false)
      ;
      (CharacterInfo.BTN_Tab_Title):SetCheck(true)
      ;
      (CharacterInfo.BTN_Tab_History):SetCheck(false)
      ;
      (CharacterInfo.BTN_Tab_Challenge):SetCheck(false)
      ;
      (CharacterInfo.BTN_Tab_Profile):SetCheck(false)
      TitleInfo_Open()
    else
      if index == 2 then
        (self._frameDefaultBG_History):SetShow(true)
        ;
        (CharacterInfo.BTN_Tab_Basic):SetCheck(false)
        ;
        (CharacterInfo.BTN_Tab_Title):SetCheck(false)
        ;
        (CharacterInfo.BTN_Tab_History):SetCheck(true)
        ;
        (CharacterInfo.BTN_Tab_Challenge):SetCheck(false)
        ;
        (CharacterInfo.BTN_Tab_Profile):SetCheck(false)
        MyHistory_DataUpdate()
      else
        if index == 3 then
          (self._frameDefaultBG_Challenge):SetShow(true)
          ;
          (CharacterInfo.BTN_Tab_Basic):SetCheck(false)
          ;
          (CharacterInfo.BTN_Tab_Title):SetCheck(false)
          ;
          (CharacterInfo.BTN_Tab_History):SetCheck(false)
          ;
          (CharacterInfo.BTN_Tab_Challenge):SetCheck(true)
          ;
          (CharacterInfo.BTN_Tab_Profile):SetCheck(false)
          Fglobal_Challenge_UpdateData()
        else
          if index == 4 then
            (self._frameDefaultBG_Profile):SetShow(true)
            ;
            (CharacterInfo.BTN_Tab_Basic):SetCheck(false)
            ;
            (CharacterInfo.BTN_Tab_Title):SetCheck(false)
            ;
            (CharacterInfo.BTN_Tab_History):SetCheck(false)
            ;
            (CharacterInfo.BTN_Tab_Challenge):SetCheck(false)
            ;
            (CharacterInfo.BTN_Tab_Profile):SetCheck(true)
            FGlobal_Profile_Update()
          end
        end
      end
    end
  end
end

SelfCharacterInfo_UpdateTolerance = function()
  -- function num : 0_26 , upvalues : CharacterInfo
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local resistStunRate = player:getStunResistance()
  ;
  (CharacterInfo._progress2_resiststun):SetProgressRate((math.floor)(resistStunRate / 10000))
  ;
  (CharacterInfo._stunPercent):SetText((math.floor)(resistStunRate / 10000) .. "%")
  local resistDownRate = player:getKnockdownResistance()
  ;
  (CharacterInfo._progress2_resistdown):SetProgressRate((math.floor)(resistDownRate / 10000))
  ;
  (CharacterInfo._downPercent):SetText((math.floor)(resistDownRate / 10000) .. "%")
  local resistCaptureRate = player:getCatchResistance()
  ;
  (CharacterInfo._progress2_resistcapture):SetProgressRate((math.floor)(resistCaptureRate / 10000))
  ;
  (CharacterInfo._capturePercent):SetText((math.floor)(resistCaptureRate / 10000) .. "%")
  local resistKnockbackRate = player:getKnockbackResistance()
  ;
  (CharacterInfo._progress2_resistknockback):SetProgressRate((math.floor)(resistKnockbackRate / 10000))
  ;
  (CharacterInfo._knockBackPercent):SetText((math.floor)(resistKnockbackRate / 10000) .. "%")
end

local fitness = {stamina = 0, strength = 1, health = 2}
local staminaLevel = 1
local strengthLevel = 1
local healthLevel = 1
if nil ~= getSelfPlayer() then
  staminaLevel = ((getSelfPlayer()):get()):getFitnessLevel(fitness.stamina)
  strengthLevel = ((getSelfPlayer()):get()):getFitnessLevel(fitness.strength)
  healthLevel = ((getSelfPlayer()):get()):getFitnessLevel(fitness.health)
end
FromClientFitnessUp = function(addSp, addWeight, addHp, addMp)
  -- function num : 0_27 , upvalues : fitness, CharacterInfo, staminaLevel, strengthLevel, healthLevel
  local selfPlayerGet = (getSelfPlayer()):get()
  local currStamina = Int64toInt32(selfPlayerGet:getCurrFitnessExperiencePoint(fitness.stamina))
  local maxStamina = Int64toInt32(selfPlayerGet:getDemandFItnessExperiencePoint(fitness.stamina))
  local staminaRate = currStamina / maxStamina * 100
  local currStaminaLv = selfPlayerGet:getFitnessLevel(fitness.stamina)
  ;
  (CharacterInfo._progress2_stamina):SetProgressRate(staminaRate)
  ;
  (CharacterInfo._value_stamina):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL") .. tostring(currStaminaLv))
  local currStrength = Int64toInt32(selfPlayerGet:getCurrFitnessExperiencePoint(fitness.strength))
  local maxStrength = Int64toInt32(selfPlayerGet:getDemandFItnessExperiencePoint(fitness.strength))
  local strengthRate = currStrength / maxStrength * 100
  local currStrengthLv = selfPlayerGet:getFitnessLevel(fitness.strength)
  ;
  (CharacterInfo._progress2_strength):SetProgressRate(strengthRate)
  ;
  (CharacterInfo._value_strength):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL") .. tostring(currStrengthLv))
  local currHealth = Int64toInt32(selfPlayerGet:getCurrFitnessExperiencePoint(fitness.health))
  local maxHealth = Int64toInt32(selfPlayerGet:getDemandFItnessExperiencePoint(fitness.health))
  local healthRate = currHealth / maxHealth * 100
  local currHealthLv = selfPlayerGet:getFitnessLevel(fitness.health)
  ;
  (CharacterInfo._progress2_health):SetProgressRate(healthRate)
  ;
  (CharacterInfo._value_health):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL") .. tostring(currHealthLv))
  if staminaLevel < currStaminaLv then
    FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, fitness.stamina)
    staminaLevel = currStaminaLv
    SelfCharacterInfo_UpdateStamina()
  else
    if strengthLevel < currStrengthLv then
      FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, fitness.strength)
      strengthLevel = currStrengthLv
      SelfCharacterInfo_UpdateWeight()
    else
      if healthLevel < currHealthLv then
        FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, fitness.health)
        healthLevel = currHealthLv
        SelfCharacterInfo_UpdateMainStatus()
        Panel_MainStatus_User_Bar_CharacterInfoWindowUpdate()
      end
    end
  end
end

CharInfo_MouseOverEvent = function(sourceType, isOn)
  -- function num : 0_28 , upvalues : CharacterInfo
  if isOn == true then
    if sourceType == 0 then
      registTooltipControl(CharacterInfo._hpRegen, Panel_Window_CharInfo_BasicStatus)
      ;
      (CharacterInfo._hpRegen):SetSize((CharacterInfo._hpRegen):GetTextSizeX() + 20, (CharacterInfo._hpRegen):GetSizeY())
      ;
      (CharacterInfo._hpRegen):SetShow(true)
    else
      if sourceType == 1 then
        registTooltipControl(CharacterInfo._mpRegen, Panel_Window_CharInfo_BasicStatus)
        ;
        (CharacterInfo._mpRegen):SetSize((CharacterInfo._mpRegen):GetTextSizeX() + 20, (CharacterInfo._mpRegen):GetSizeY())
        ;
        (CharacterInfo._mpRegen):SetShow(true)
      else
        if sourceType == 2 then
          registTooltipControl(CharacterInfo._weightTooltip, Panel_Window_CharInfo_BasicStatus)
          ;
          (CharacterInfo._weightTooltip):SetSize((CharacterInfo._weightTooltip):GetTextSizeX() + 20, (CharacterInfo._weightTooltip):GetSizeY())
          ;
          (CharacterInfo._weightTooltip):SetShow(true)
        end
      end
    end
  else
    ;
    (CharacterInfo._hpRegen):SetShow(false)
    ;
    (CharacterInfo._mpRegen):SetShow(false)
    ;
    (CharacterInfo._weightTooltip):SetShow(false)
  end
end

Fitness_MouseOverEvent = function(_type)
  -- function num : 0_29 , upvalues : fitnessTooltip, fitness, CharacterInfo
  if _type == nil then
    fitnessTooltip:SetShow(false)
    return 
  end
  local posX = 0
  local posY = 0
  local msg = ""
  if fitness.stamina == _type then
    posX = ((CharacterInfo._title_stamina):GetSpanSize()).x + 70
    posY = ((CharacterInfo._title_stamina):GetSpanSize()).y + 80
    msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FITNESS_STAMINA_MSG", "type", tostring(ToClient_GetFitnessLevelStatus(_type)))
  else
    if fitness.strength == _type then
      posX = ((CharacterInfo._title_strength):GetSpanSize()).x + 70
      posY = ((CharacterInfo._title_strength):GetSpanSize()).y + 80
      msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FITNESS_STRENGTH_MSG", "type", tostring(ToClient_GetFitnessLevelStatus(_type) / 10000))
    else
      if fitness.health == _type then
        posX = ((CharacterInfo._title_health):GetSpanSize()).x + 70
        posY = ((CharacterInfo._title_health):GetSpanSize()).y + 80
        msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_FITNESS_HEALTH_MSG", "type", tostring(ToClient_GetFitnessLevelStatus(_type)))
      else
        return 
      end
    end
  end
  fitnessTooltip:SetPosX(posX)
  fitnessTooltip:SetPosY(posY)
  fitnessTooltip:SetText(msg)
  fitnessTooltip:SetSize(fitnessTooltip:GetTextSizeX() + 20, fitnessTooltip:GetSizeY())
  registTooltipControl(fitnessTooltip, Panel_Window_CharInfo_BasicStatus)
  fitnessTooltip:SetShow(true)
end

Poten_MouseOverEvent = function(sourceType, isOn)
  -- function num : 0_30 , upvalues : potenTooltip, CharacterInfo, UI_PD
  if isOn == true then
    if sourceType == 0 then
      potenTooltip:SetPosX(((CharacterInfo.attackspeed):GetSpanSize()).x + 70)
      potenTooltip:SetPosY(((CharacterInfo.attackspeed):GetSpanSize()).y + 40)
      potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_DESC_0"))
    else
      if sourceType == 1 then
        potenTooltip:SetPosX(((CharacterInfo.castspeed):GetSpanSize()).x + 70)
        potenTooltip:SetPosY(((CharacterInfo.castspeed):GetSpanSize()).y + 40)
        potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_DESC_1"))
      else
        if sourceType == 2 then
          potenTooltip:SetPosX(((CharacterInfo.movespeed):GetSpanSize()).x + 70)
          potenTooltip:SetPosY(((CharacterInfo.movespeed):GetSpanSize()).y + 40)
          potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_DESC_2"))
        else
          if sourceType == 3 then
            potenTooltip:SetPosX(((CharacterInfo.critical):GetSpanSize()).x + 70)
            potenTooltip:SetPosY(((CharacterInfo.critical):GetSpanSize()).y + 40)
            potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_DESC_3"))
          else
            if sourceType == 4 then
              potenTooltip:SetPosX(((CharacterInfo.fishTime):GetSpanSize()).x + 70)
              potenTooltip:SetPosY(((CharacterInfo.fishTime):GetSpanSize()).y + 40)
              potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_DESC_4"))
            else
              if sourceType == 5 then
                potenTooltip:SetPosX(((CharacterInfo.product):GetSpanSize()).x + 70)
                potenTooltip:SetPosY(((CharacterInfo.product):GetSpanSize()).y + 40)
                potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_DESC_5"))
              else
                if sourceType == 6 then
                  potenTooltip:SetPosX(((CharacterInfo.dropChance):GetSpanSize()).x + 70)
                  potenTooltip:SetPosY(((CharacterInfo.dropChance):GetSpanSize()).y + 40)
                  potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_DESC_6"))
                end
              end
            end
          end
        end
      end
    end
    registTooltipControl(potenTooltip, Panel_Window_CharInfo_BasicStatus)
    potenTooltip:SetShow(true)
    potenTooltip:SetSize(potenTooltip:GetTextSizeX() + 20, potenTooltip:GetTextSizeY() + 5)
    potenTooltip:setPadding(UI_PD.ePadding_Left, 5)
    potenTooltip:setPadding(UI_PD.ePadding_Top, 5)
    potenTooltip:setPadding(UI_PD.ePadding_Right, 5)
    potenTooltip:setPadding(UI_PD.ePadding_Bottom, 5)
  else
    potenTooltip:SetShow(false)
  end
end

Craft_MouseOverEvent = function(sourceType, isOn)
  -- function num : 0_31 , upvalues : potenTooltip, CharacterInfo, UI_PD
  if isOn == true then
    if sourceType == 0 then
      potenTooltip:SetPosX((CharacterInfo._gatherTitle):GetPosX() + 40)
      potenTooltip:SetPosY((CharacterInfo._gatherTitle):GetPosY() + 30)
      potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_1"))
    else
      if sourceType == 1 then
        potenTooltip:SetPosX((CharacterInfo._manufactureTitle):GetPosX() + 40)
        potenTooltip:SetPosY((CharacterInfo._manufactureTitle):GetPosY() + 30)
        potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_2"))
      else
        if sourceType == 2 then
          potenTooltip:SetPosX((CharacterInfo._cookingTitle):GetPosX() + 40)
          potenTooltip:SetPosY((CharacterInfo._cookingTitle):GetPosY() + 30)
          potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_2"))
        else
          if sourceType == 3 then
            potenTooltip:SetPosX((CharacterInfo._alchemyTitle):GetPosX() + 40)
            potenTooltip:SetPosY((CharacterInfo._alchemyTitle):GetPosY() + 30)
            potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_2"))
          else
            if sourceType == 4 then
              potenTooltip:SetPosX((CharacterInfo._trainingTitle):GetPosX() + 40)
              potenTooltip:SetPosY((CharacterInfo._trainingTitle):GetPosY() + 30)
              potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_3"))
            else
              if sourceType == 5 then
                potenTooltip:SetPosX((CharacterInfo._tradeTitle):GetPosX() + 40)
                potenTooltip:SetPosY((CharacterInfo._tradeTitle):GetPosY() + 30)
                potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_4"))
              else
                if sourceType == 6 then
                  potenTooltip:SetPosX((CharacterInfo._fishingTitle):GetPosX() + 40)
                  potenTooltip:SetPosY((CharacterInfo._fishingTitle):GetPosY() + 30)
                  potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_5"))
                else
                  if sourceType == 7 then
                    potenTooltip:SetPosX((CharacterInfo._huntingTitle):GetPosX() + 40)
                    potenTooltip:SetPosY((CharacterInfo._huntingTitle):GetPosY() + 30)
                    potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_6"))
                  else
                    if sourceType == 8 then
                      potenTooltip:SetPosX((CharacterInfo._growthTitle):GetPosX() + 40)
                      potenTooltip:SetPosY((CharacterInfo._growthTitle):GetPosY() + 30)
                      potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_7"))
                    else
                      if sourceType == 9 then
                        potenTooltip:SetPosX((CharacterInfo._sailTitle):GetPosX() + 40)
                        potenTooltip:SetPosY((CharacterInfo._sailTitle):GetPosY() + 30)
                        potenTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFT_DESC_8"))
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    registTooltipControl(potenTooltip, Panel_Window_CharInfo_BasicStatus)
    potenTooltip:SetShow(true)
    potenTooltip:SetSize(potenTooltip:GetTextSizeX() + 20, potenTooltip:GetTextSizeY() + 5)
    potenTooltip:setPadding(UI_PD.ePadding_Left, 5)
    potenTooltip:setPadding(UI_PD.ePadding_Top, 5)
    potenTooltip:setPadding(UI_PD.ePadding_Right, 5)
    potenTooltip:setPadding(UI_PD.ePadding_Bottom, 5)
  else
    potenTooltip:SetShow(false)
  end
end

Regist_MouseOverEvent = function(tipType, isShow)
  -- function num : 0_32 , upvalues : CharacterInfo
  local name, desc, control = nil, nil, nil
  local self = CharacterInfo
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_REGIST_STUN_TOOLTIP_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_REGIST_STUN_TOOLTIP_DESC")
    control = self._stunTitle
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_REGIST_DOWN_TOOLTIP_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_REGIST_DOWN_TOOLTIP_DESC")
      control = self._downTitle
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_REGIST_CAPTURE_TOOLTIP_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_REGIST_CAPTURE_TOOLTIP_DESC")
        control = self._captureTitle
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_REGIST_KNOCKBACK_TOOLTIP_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TXT_REGIST_KNOCKBACK_TOOLTIP_DESC")
          control = self._knockBackTitle
        end
      end
    end
  end
  if isShow == true then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

local initProgress = function()
  -- function num : 0_33 , upvalues : CharacterInfo
  (CharacterInfo._progress2_characterlevel):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_hp):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_mp):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_weightvalue_Money):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_weightvalue_Equip):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_weightvalue_Inventory):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_gather):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_manufacture):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_cooking):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_alchemy):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_resiststun):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_resistdown):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_resistcapture):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_resistknockback):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_stamina):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_strength):SetProgressRate(0)
  ;
  (CharacterInfo._progress2_health):SetProgressRate(0)
end

CharacterInfoWindow_Show = function()
  -- function num : 0_34 , upvalues : CharacterInfo
  Panel_Window_CharInfo_Status:SetShow(true, true)
  CharacterInfoWindowUpdate()
  HandleClicked_CharacterInfo_Tab(0)
  ;
  (CharacterInfo.BTN_Tab_Basic):SetCheck(true)
  ;
  (CharacterInfo.BTN_Tab_Title):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_History):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_Challenge):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_Profile):SetCheck(false)
  FromClientFitnessUp(0, 0, 0, 0)
  local msg = ToClient_GetUserIntroduction()
  if msg == nil or msg == "" then
    (CharacterInfo._btnIntroduce):SetPosX((CharacterInfo.txt_BaseInfo_Title):GetTextSizeX() + 30)
  end
end

CharacterInfoWindow_Hide = function()
  -- function num : 0_35 , upvalues : CharacterInfo, initProgress, IM
  if (CharacterInfo._frameDefaultBG_Challenge):GetShow() then
    CharacterInfoWindowUpdate()
    HandleClicked_CharacterInfo_Tab(0)
    FromClientFitnessUp(0, 0, 0, 0)
    ;
    (CharacterInfo.BTN_Tab_Basic):SetCheck(true)
    ;
    (CharacterInfo.BTN_Tab_Title):SetCheck(false)
    ;
    (CharacterInfo.BTN_Tab_History):SetCheck(false)
    ;
    (CharacterInfo.BTN_Tab_Challenge):SetCheck(false)
    ;
    (CharacterInfo.BTN_Tab_Profile):SetCheck(false)
    Panel_Window_CharInfo_Status:SetShow(false, false)
    initProgress()
    HelpMessageQuestion_Out()
  else
    Panel_Window_CharInfo_Status:SetShow(false, false)
    initProgress()
    HelpMessageQuestion_Out()
  end
  if AllowChangeInputMode() then
    ClearFocusEdit()
    if check_ShowWindow() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
  Panel_Window_CharInfo_Status:CloseUISubApp()
  ;
  (CharacterInfo.checkPopUp):SetCheck(false)
  Panel_Tooltip_Item_hideTooltip()
end

HandleClicked_CharacterInfo_PopUp = function()
  -- function num : 0_36 , upvalues : CharacterInfo
  if (CharacterInfo.checkPopUp):IsCheck() then
    Panel_Window_CharInfo_Status:OpenUISubApp()
  else
    Panel_Window_CharInfo_Status:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

FGlobal_Challenge_Show = function()
  -- function num : 0_37 , upvalues : CharacterInfo
  Panel_Window_CharInfo_Status:SetShow(true, true)
  HandleClicked_CharacterInfo_Tab(3)
  FGlobal_TapButton_Complete()
  ;
  (CharacterInfo.BTN_Tab_Basic):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_Title):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_History):SetCheck(false)
  ;
  (CharacterInfo.BTN_Tab_Challenge):SetCheck(true)
  ;
  (CharacterInfo.BTN_Tab_Profile):SetCheck(false)
end

FGlobal_Challenge_Hide = function()
  -- function num : 0_38 , upvalues : CharacterInfo, IM
  if (CharacterInfo._frameDefaultBG_Basic):GetShow() then
    HandleClicked_CharacterInfo_Tab(3)
    ;
    (CharacterInfo.BTN_Tab_Basic):SetCheck(false)
    ;
    (CharacterInfo.BTN_Tab_Title):SetCheck(false)
    ;
    (CharacterInfo.BTN_Tab_History):SetCheck(false)
    ;
    (CharacterInfo.BTN_Tab_Challenge):SetCheck(true)
    ;
    (CharacterInfo.BTN_Tab_Profile):SetCheck(false)
  else
    Panel_Window_CharInfo_Status:SetShow(false, false)
    Panel_Tooltip_Item_hideTooltip()
  end
  if AllowChangeInputMode() then
    ClearFocusEdit()
    if check_ShowWindow() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

CharacterInfoWindow_ShowToggle = function()
  -- function num : 0_39
  if Panel_Window_CharInfo_Status:GetShow() then
    CharacterInfoWindow_Hide()
    audioPostEvent_SystemUi(1, 0)
    CraftLevInfo_Show()
  else
    CharacterInfoWindow_Show()
    audioPostEvent_SystemUi(1, 1)
    CraftLevInfo_Hide()
  end
end

MyIntroduce_Init = function()
  -- function num : 0_40 , upvalues : CharacterInfo
  local self = CharacterInfo._introduce
  ;
  (self._editText):SetMaxEditLine(6)
  ;
  (self._editText):SetMaxInput(120)
  ;
  (self._closeIntro):addInputEvent("Mouse_LUp", "IntroduceMyself_ShowToggle(false)")
  ;
  (self._editText):addInputEvent("Mouse_LUp", "HandleClicked_IntroduceMyself()")
  ;
  (self._btnSetIntro):addInputEvent("Mouse_LUp", "HandleClicked_SetIntroduce()")
  ;
  (self._btnResetIntro):addInputEvent("Mouse_LUp", "HandleClicked_ResetIntroduce()")
end

IntroduceMyself_ShowToggle = function(isShow)
  -- function num : 0_41 , upvalues : CharacterInfo
  local self = CharacterInfo._introduce
  if isShow == nil then
    isShow = true
  end
  if (self._bg):GetShow() then
    isShow = false
  end
  for _,control in pairs(self) do
    control:SetShow(isShow)
  end
  if not isShow then
    FGlobal_MyIntroduceClearFocusEdit()
  end
  local msg = ToClient_GetUserIntroduction()
  ;
  ((CharacterInfo._introduce)._editText):SetEditText(msg)
  CharacterInfo:SetConsolePadGroup(isShow)
end

HandleClicked_IntroduceMyself = function()
  -- function num : 0_42 , upvalues : CharacterInfo, IM
  local self = CharacterInfo._introduce
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetFocusEdit(self._editText)
  ;
  (self._editText):SetEditText((self._editText):GetEditText(), true)
end

HandleClicked_SetIntroduce = function()
  -- function num : 0_43 , upvalues : CharacterInfo
  local self = CharacterInfo._introduce
  local msg = (self._editText):GetEditText()
  ToClient_RequestSetUserIntroduction(msg)
  ClearFocusEdit()
  IntroduceMyself_ShowToggle(false)
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_MYINTRODUCE_REGIST"))
  ;
  (CharacterInfo._btnIntroduce):EraseAllEffect()
  if msg == nil or nil == "" then
    (CharacterInfo._btnIntroduce):AddEffect("fUI_SelfCharacterInfo_01A", true, 0, 0)
  end
end

HandleClicked_ResetIntroduce = function()
  -- function num : 0_44 , upvalues : CharacterInfo
  local self = CharacterInfo._introduce
  local msg = ""
  ;
  (self._editText):SetEditText(msg)
  ToClient_RequestSetUserIntroduction(msg)
  ClearFocusEdit()
  ;
  (CharacterInfo._btnIntroduce):EraseAllEffect()
  ;
  (CharacterInfo._btnIntroduce):AddEffect("fUI_SelfCharacterInfo_01A", true, 0, 0)
end

FGlobal_MyIntroduceClearFocusEdit = function()
  -- function num : 0_45 , upvalues : IM
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWindow)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

FGlobal_CheckMyIntroduceUiEdit = function(targetUI)
  -- function num : 0_46 , upvalues : CharacterInfo
  do return targetUI ~= nil and targetUI:GetKey() == ((CharacterInfo._introduce)._editText):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FamilyPoints_SimpleTooltip = function(isShow, tipType)
  -- function num : 0_47 , upvalues : CharacterInfo
  local self = CharacterInfo
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_SUM_TOOLTIP_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_SUM_TOOLTIP_DESC")
    control = self.familyPoints
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_COMBAT_TOOLTIP_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_COMBAT_TOOLTIP_DESC")
      control = self.familyCombatPoints
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_LIFE_TOOLTIP_TITLE")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_LIFE_TOOLTIP_DESC")
        control = self.familyLifePoints
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_ETC_TOOLTIP_TITLE")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_ETC_TOOLTIP_DESC")
          control = self.familyEtcPoints
        end
      end
    end
  end
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

CharacterInfo.registEventHandler = function(self)
  -- function num : 0_48
  (self._hpTitle):addInputEvent("Mouse_On", "CharInfo_MouseOverEvent( 0, true )")
  ;
  (self._hpTitle):addInputEvent("Mouse_Out", "CharInfo_MouseOverEvent( 0, false )")
  ;
  (self._mpTitle):addInputEvent("Mouse_On", "CharInfo_MouseOverEvent( 1, true )")
  ;
  (self._mpTitle):addInputEvent("Mouse_Out", "CharInfo_MouseOverEvent( 1, false )")
  ;
  (self._weightTitle):addInputEvent("Mouse_On", "CharInfo_MouseOverEvent( 2, true )")
  ;
  (self._weightTitle):addInputEvent("Mouse_Out", "CharInfo_MouseOverEvent( 2, false )")
  ;
  (self.attackspeed):addInputEvent("Mouse_On", "Poten_MouseOverEvent( 0, true )")
  ;
  (self.attackspeed):addInputEvent("Mouse_Out", "Poten_MouseOverEvent( 0, false )")
  ;
  (self.castspeed):addInputEvent("Mouse_On", "Poten_MouseOverEvent( 1, true )")
  ;
  (self.castspeed):addInputEvent("Mouse_Out", "Poten_MouseOverEvent( 1, false )")
  ;
  (self.movespeed):addInputEvent("Mouse_On", "Poten_MouseOverEvent( 2, true )")
  ;
  (self.movespeed):addInputEvent("Mouse_Out", "Poten_MouseOverEvent( 2, false )")
  ;
  (self.critical):addInputEvent("Mouse_On", "Poten_MouseOverEvent( 3, true )")
  ;
  (self.critical):addInputEvent("Mouse_Out", "Poten_MouseOverEvent( 3, false )")
  ;
  (self.fishTime):addInputEvent("Mouse_On", "Poten_MouseOverEvent( 4, true )")
  ;
  (self.fishTime):addInputEvent("Mouse_Out", "Poten_MouseOverEvent( 4, false )")
  ;
  (self.product):addInputEvent("Mouse_On", "Poten_MouseOverEvent( 5, true )")
  ;
  (self.product):addInputEvent("Mouse_Out", "Poten_MouseOverEvent( 5, false )")
  ;
  (self.dropChance):addInputEvent("Mouse_On", "Poten_MouseOverEvent( 6, true )")
  ;
  (self.dropChance):addInputEvent("Mouse_Out", "Poten_MouseOverEvent( 6, false )")
  ;
  (self._gatherTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 0, true )")
  ;
  (self._gatherTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 0, false )")
  ;
  (self._manufactureTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 1, true )")
  ;
  (self._manufactureTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 1, false )")
  ;
  (self._cookingTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 2, true )")
  ;
  (self._cookingTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 2, false )")
  ;
  (self._alchemyTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 3, true )")
  ;
  (self._alchemyTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 3, false )")
  ;
  (self._trainingTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 4, true )")
  ;
  (self._trainingTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 4, false )")
  ;
  (self._tradeTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 5, true )")
  ;
  (self._tradeTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 5, false )")
  ;
  (self._fishingTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 6, true )")
  ;
  (self._fishingTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 6, false )")
  ;
  (self._huntingTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 7, true )")
  ;
  (self._huntingTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 7, false )")
  ;
  (self._growthTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 8, true )")
  ;
  (self._growthTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 8, false )")
  ;
  (self._sailTitle):addInputEvent("Mouse_On", "Craft_MouseOverEvent( 9, true )")
  ;
  (self._sailTitle):addInputEvent("Mouse_Out", "Craft_MouseOverEvent( 9, false )")
  ;
  (self._stunTitle):addInputEvent("Mouse_On", "Regist_MouseOverEvent( 0, true)")
  ;
  (self._stunTitle):addInputEvent("Mouse_Out", "Regist_MouseOverEvent( false)")
  ;
  (self._downTitle):addInputEvent("Mouse_On", "Regist_MouseOverEvent( 1, true)")
  ;
  (self._downTitle):addInputEvent("Mouse_Out", "Regist_MouseOverEvent( false)")
  ;
  (self._captureTitle):addInputEvent("Mouse_On", "Regist_MouseOverEvent( 2, true)")
  ;
  (self._captureTitle):addInputEvent("Mouse_Out", "Regist_MouseOverEvent( false)")
  ;
  (self._knockBackTitle):addInputEvent("Mouse_On", "Regist_MouseOverEvent( 3, true)")
  ;
  (self._knockBackTitle):addInputEvent("Mouse_Out", "Regist_MouseOverEvent( false)")
  ;
  (self._hpTitle):setTooltipEventRegistFunc("CharInfo_MouseOverEvent( 0, true )")
  ;
  (self._mpTitle):setTooltipEventRegistFunc("CharInfo_MouseOverEvent( 1, true )")
  ;
  (self._weightTitle):setTooltipEventRegistFunc("CharInfo_MouseOverEvent( 2, true )")
  ;
  (self.attackspeed):setTooltipEventRegistFunc("Poten_MouseOverEvent( 0, true )")
  ;
  (self.castspeed):setTooltipEventRegistFunc("Poten_MouseOverEvent( 1, true )")
  ;
  (self.movespeed):setTooltipEventRegistFunc("Poten_MouseOverEvent( 2, true )")
  ;
  (self.critical):setTooltipEventRegistFunc("Poten_MouseOverEvent( 3, true )")
  ;
  (self.fishTime):setTooltipEventRegistFunc("Poten_MouseOverEvent( 4, true )")
  ;
  (self.product):setTooltipEventRegistFunc("Poten_MouseOverEvent( 5, true )")
  ;
  (self.dropChance):setTooltipEventRegistFunc("Poten_MouseOverEvent( 6, true )")
  ;
  (self._gatherTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 0, true )")
  ;
  (self._manufactureTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 1, true )")
  ;
  (self._cookingTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 2, true )")
  ;
  (self._alchemyTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 3, true )")
  ;
  (self._trainingTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 4, true )")
  ;
  (self._tradeTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 5, true )")
  ;
  (self._fishingTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 6, true )")
  ;
  (self._huntingTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 7, true )")
  ;
  (self._growthTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 8, true )")
  ;
  (self._sailTitle):setTooltipEventRegistFunc("Craft_MouseOverEvent( 9, true )")
  ;
  (self._stunTitle):setTooltipEventRegistFunc(" Regist_MouseOverEvent( 0, true) ")
  ;
  (self._downTitle):setTooltipEventRegistFunc(" Regist_MouseOverEvent( 1, true) ")
  ;
  (self._captureTitle):setTooltipEventRegistFunc(" Regist_MouseOverEvent( 2, true) ")
  ;
  (self._knockBackTitle):setTooltipEventRegistFunc(" Regist_MouseOverEvent( 3, true) ")
  ;
  (self.BTN_Tab_Basic):addInputEvent("Mouse_LUp", "HandleClicked_CharacterInfo_Tab(" .. 0 .. ")")
  ;
  (self.BTN_Tab_Title):addInputEvent("Mouse_LUp", "HandleClicked_CharacterInfo_Tab(" .. 1 .. ")")
  ;
  (self.BTN_Tab_History):addInputEvent("Mouse_LUp", "HandleClicked_CharacterInfo_Tab(" .. 2 .. ")")
  ;
  (self.BTN_Tab_Challenge):addInputEvent("Mouse_LUp", "HandleClicked_CharacterInfo_Tab(" .. 3 .. ")")
  ;
  (self.BTN_Tab_Profile):addInputEvent("Mouse_LUp", "HandleClicked_CharacterInfo_Tab(" .. 4 .. ")")
  ;
  (self._btnIntroduce):addInputEvent("Mouse_LUp", "IntroduceMyself_ShowToggle()")
  ;
  (self._ranker):addInputEvent("Mouse_LUp", "FGlobal_LifeRanking_Open()")
  ;
  (self._title_stamina):addInputEvent("Mouse_On", "Fitness_MouseOverEvent(" .. 0 .. ")")
  ;
  (self._title_stamina):addInputEvent("Mouse_Out", "Fitness_MouseOverEvent()")
  ;
  (self._title_strength):addInputEvent("Mouse_On", "Fitness_MouseOverEvent(" .. 1 .. ")")
  ;
  (self._title_strength):addInputEvent("Mouse_Out", "Fitness_MouseOverEvent()")
  ;
  (self._title_health):addInputEvent("Mouse_On", "Fitness_MouseOverEvent(" .. 2 .. ")")
  ;
  (self._title_health):addInputEvent("Mouse_Out", "Fitness_MouseOverEvent()")
  ;
  (self._title_stamina):setTooltipEventRegistFunc("Fitness_MouseOverEvent(" .. 0 .. ")")
  ;
  (self._title_strength):setTooltipEventRegistFunc("Fitness_MouseOverEvent(" .. 1 .. ")")
  ;
  (self._title_health):setTooltipEventRegistFunc("Fitness_MouseOverEvent(" .. 2 .. ")")
  ;
  (self.familyPoints):addInputEvent("Mouse_On", "FamilyPoints_SimpleTooltip(true,\t0)")
  ;
  (self.familyPoints):addInputEvent("Mouse_Out", "FamilyPoints_SimpleTooltip(false,\t0)")
  ;
  (self.familyCombatPoints):addInputEvent("Mouse_On", "FamilyPoints_SimpleTooltip(true,\t1)")
  ;
  (self.familyCombatPoints):addInputEvent("Mouse_Out", "FamilyPoints_SimpleTooltip(false,\t1)")
  ;
  (self.familyLifePoints):addInputEvent("Mouse_On", "FamilyPoints_SimpleTooltip(true,\t2)")
  ;
  (self.familyLifePoints):addInputEvent("Mouse_Out", "FamilyPoints_SimpleTooltip(false,\t2)")
  ;
  (self.familyEtcPoints):addInputEvent("Mouse_On", "FamilyPoints_SimpleTooltip(true,\t3)")
  ;
  (self.familyEtcPoints):addInputEvent("Mouse_Out", "FamilyPoints_SimpleTooltip(false,\t3)")
  ;
  (self.checkPopUp):addInputEvent("Mouse_LUp", "HandleClicked_CharacterInfo_PopUp()")
  ;
  (self.checkPopUp):addInputEvent("Mouse_On", "CharacterInfo_PopUp_ShowIconToolTip( true )")
  ;
  (self.checkPopUp):addInputEvent("Mouse_Out", "CharacterInfo_PopUp_ShowIconToolTip( false )")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "CharacterInfoWindow_Hide()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"SelfCharacterInfo\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"SelfCharacterInfo\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"SelfCharacterInfo\", \"false\")")
end

HandleMouseEvent_TabButtonDesc = function(descType, isOn)
  -- function num : 0_49 , upvalues : CharacterInfo
  if descType == 0 and isOn == true then
    (CharacterInfo.txt_CharinfoDesc):SetAlpha(0)
    ;
    (CharacterInfo.txt_CharinfoDesc):SetFontAlpha(0)
    ;
    (CharacterInfo.txt_CharinfoDesc):ResetVertexAni()
    local AniInfo = (UIAni.AlphaAnimation)(1, CharacterInfo.txt_CharinfoDesc, 0, 0.15)
    ;
    (CharacterInfo.txt_CharinfoDesc):SetShow(true)
  else
    do
      if descType == 1 and isOn == true then
        (CharacterInfo.txt_TitleDesc):SetAlpha(0)
        ;
        (CharacterInfo.txt_TitleDesc):SetFontAlpha(0)
        ;
        (CharacterInfo.txt_TitleDesc):ResetVertexAni()
        local AniInfo = (UIAni.AlphaAnimation)(1, CharacterInfo.txt_TitleDesc, 0, 0.15)
        ;
        (CharacterInfo.txt_TitleDesc):SetShow(true)
      else
        do
          if descType == 2 and isOn == true then
            (CharacterInfo.txt_HistoryDesc):SetAlpha(0)
            ;
            (CharacterInfo.txt_HistoryDesc):SetFontAlpha(0)
            ;
            (CharacterInfo.txt_HistoryDesc):ResetVertexAni()
            local AniInfo = (UIAni.AlphaAnimation)(1, CharacterInfo.txt_HistoryDesc, 0, 0.15)
            ;
            (CharacterInfo.txt_HistoryDesc):SetShow(true)
          else
            do
              if descType == 3 and isOn == true then
                (CharacterInfo.txt_ChallengeDesc):SetAlpha(0)
                ;
                (CharacterInfo.txt_ChallengeDesc):SetFontAlpha(0)
                ;
                (CharacterInfo.txt_ChallengeDesc):ResetVertexAni()
                local AniInfo = (UIAni.AlphaAnimation)(1, CharacterInfo.txt_ChallengeDesc, 0, 0.15)
                ;
                (CharacterInfo.txt_ChallengeDesc):SetShow(true)
              end
              do
                if descType == 0 and isOn == false then
                  (CharacterInfo.txt_CharinfoDesc):ResetVertexAni()
                  local AniInfo = (UIAni.AlphaAnimation)(0, CharacterInfo.txt_CharinfoDesc, 0, 0.1)
                  AniInfo:SetHideAtEnd(true)
                else
                  do
                    if descType == 1 and isOn == false then
                      (CharacterInfo.txt_TitleDesc):ResetVertexAni()
                      local AniInfo1 = (UIAni.AlphaAnimation)(0, CharacterInfo.txt_TitleDesc, 0, 0.1)
                      AniInfo1:SetHideAtEnd(true)
                    else
                      do
                        if descType == 2 and isOn == false then
                          (CharacterInfo.txt_HistoryDesc):ResetVertexAni()
                          local AniInfo2 = (UIAni.AlphaAnimation)(0, CharacterInfo.txt_HistoryDesc, 0, 0.1)
                          AniInfo2:SetHideAtEnd(true)
                        else
                          do
                            if descType == 3 and isOn == false then
                              (CharacterInfo.txt_ChallengeDesc):ResetVertexAni()
                              local AniInfo3 = (UIAni.AlphaAnimation)(0, CharacterInfo.txt_ChallengeDesc, 0, 0.1)
                              AniInfo3:SetHideAtEnd(true)
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

FGlobal_MaxWeightChanged = function()
  -- function num : 0_50
  SelfCharacterInfo_UpdateWeight()
end

CharacterInfo_SimpleTooltip = function(isShow, tipType)
  -- function num : 0_51 , upvalues : CharacterInfo
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_PCROOMPLAYTIME")
    control = CharacterInfo._PcRoomTimer
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TODAYJOINTIME")
      control = CharacterInfo._todayPlayTime
    end
  end
  TooltipSimple_Show(control, name, desc)
end

CharacterInfo.registMessageHandler = function(self)
  -- function num : 0_52
  registerEvent("FromClient_SelfPlayerHpChanged", "SelfCharacterInfo_UpdateMainStatus")
  registerEvent("FromClient_SelfPlayerMpChanged", "SelfCharacterInfo_UpdateMainStatus")
  registerEvent("FromClient_SelfPlayerMainStatusRegenChanged", "SelfCharacterInfo_UpdateMainStatusRegen")
  registerEvent("FromClient_WpChanged", "SelfCharacterInfo_UpdateWp")
  registerEvent("FromClient_UpdateExplorePoint", "SelfCharacterInfo_UpdateExplorePoint")
  registerEvent("FromClient_SelfPlayerExpChanged", "SelfCharacterInfo_UpdateLevel")
  registerEvent("EventSelfPlayerLevelUp", "SelfCharacterInfo_UpdateLevel")
  registerEvent("FromClient_InventoryUpdate", "SelfCharacterInfo_UpdateWeight")
  registerEvent("FromClient_WeightChanged", "SelfCharacterInfo_UpdateWeight")
  registerEvent("EventEquipmentUpdate", "SelfCharacterInfo_UpdateAttackStat")
  registerEvent("FromClient_SelfPlayerTendencyChanged", "SelfCharacterInfo_UpdateTendency")
  registerEvent("FromClient_UpdateSelfPlayerStatPoint", "SelfCharacterInfo_UpdatePotenGradeInfo")
  registerEvent("FromClientFitnessUp", "FromClientFitnessUp")
  registerEvent("FromClient_UpdateSelfPlayerLifeExp", "SelfCharacterInfo_UpdateCraftLevel")
  registerEvent("FromClient_UpdateTolerance", "SelfCharacterInfo_UpdateTolerance")
  registerEvent("EventStaminaUpdate", "SelfCharacterInfo_UpdateStamina")
  registerEvent("onScreenResize", "CharacterInfo_onScreenResize")
end

CharacterInfo_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_53 , upvalues : CharacterInfo
  if isShow then
    local self = CharacterInfo
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if (self.checkPopUp):IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(self.checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

CharacterInfo:Init()
CharacterInfoWindowUpdate()
CharacterInfo:registEventHandler()
CharacterInfo:registMessageHandler()
MyIntroduce_Init()
CharacterInfo_onScreenResize = function()
  -- function num : 0_54
  Panel_Window_CharInfo_Status:SetPosX(5)
  Panel_Window_CharInfo_Status:SetPosY(getScreenSizeY() / 2 - Panel_Window_CharInfo_Status:GetSizeY() / 2)
end


