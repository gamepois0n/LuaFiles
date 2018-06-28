local _panel = Panel_Window_CharacterInfo_Renew
local Class_BattleSpeed = CppEnums.ClassType_BattleSpeed
local UI_DefaultFaceTexture = CppEnums.ClassType_DefaultFaceTexture
local UI_classType = CppEnums.ClassType
local UI_ClassSymbol = CppEnums.ClassType_Symbol
local CharacterInfo = {
  _ui = {
    stc_TitleBg = UI.getChildControl(_panel, "Static_Title"),
    stc_TabGroup = UI.getChildControl(_panel, "Static_Tab_Group"),
    stc_CharacterInfoBg = UI.getChildControl(_panel, "Static_CharacterInfoBg"),
    stc_LifeInfoBg = UI.getChildControl(_panel, "Static_LifeInfoBg"),
    stc_TitleInfoBg = UI.getChildControl(_panel, "Static_TitleInfoBg"),
    stc_HistoryInfoBg = UI.getChildControl(_panel, "Static_HistoryInfoBg"),
    stc_ChallengeInfoBg = UI.getChildControl(_panel, "Static_ChallengeInfoBg"),
    stc_ProfileInfoBg = UI.getChildControl(_panel, "Static_ProfileInfoBg"),
    txt_toolTip = UI.getChildControl(_panel, "StaticText_ToolTip")
  },
  _potentialUIData = {
    limitPotentialLevel = 5,
    maxX = 280,
    posX = 260,
    posY = 96,
    gapY = 35,
    sizeY = 2
  },
  _fitness = {
    stamina = 0,
    strength = 1,
    health = 2
  },
  PANEL_TYPE = {
    UNDEFINED = 0,
    BASIC = 1,
    NAMED = 2,
    DAIRY = 3,
    TASK = 4,
    FOOTSTEP = 5,
    LIFE = 6
  },
  _currentPanelType = 0,
  _maxPanelTypeNumber = 6,
  POTENTIAL_TYPE = {
    MOVESPEED = 0,
    ATTACKSPEED = 1,
    CRITICALLEVEL = 2,
    FISHINGLEVEL = 3,
    GATHERLEVEL = 4,
    LUCKLEVEL = 5,
    TOTALCOUNT = 6
  },
  _tapName = {
    [1] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_BASICTAPNAME"),
    [2] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_TITLETAPNAME"),
    [3] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_HISTORYTABNAME"),
    [4] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_CHALLENGETABNAME"),
    [5] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_PROFILETABNAME"),
    [6] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFOTABNAME")
  }
}
function FromClient_luaLoadComplete_CharaterInfo_Init()
  CharacterInfo:init()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_CharaterInfo_Init")
function CharacterInfo:init()
  self._ui.stc_LB = UI.getChildControl(self._ui.stc_TabGroup, "Static_LB")
  self._ui.stc_LB:addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterInfo_ShowLeftNextTab()")
  self._ui.stc_RB = UI.getChildControl(self._ui.stc_TabGroup, "Static_RB")
  self._ui.stc_RB:addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterInfo_ShowRightNextTab()")
  if true == _ContentsGroup_RenewUI then
    self._maxPanelTypeNumber = 4
    self._ui.radioButton = {
      [1] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Basic"),
      [2] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Named"),
      [3] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Dairy"),
      [4] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_FootStep")
    }
    for ii = 1, self._maxPanelTypeNumber do
      self._ui.radioButton[ii]:addInputEvent("Mouse_LUp", "InputMLUp_TapToOpenWindow(" .. ii .. ")")
      local radioButtonXAxis = self._ui.radioButton[1]:GetPosX()
      self._ui.radioButton[ii]:SetPosX(radioButtonXAxis + 165 * (ii - 1))
    end
    local taskTabControl = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Task")
    local lifeTabControl = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Life")
    taskTabControl:SetShow(false)
    lifeTabControl:SetShow(false)
  else
    self._maxPanelTypeNumber = 6
    self._ui.radioButton = {
      [1] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Basic"),
      [2] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Named"),
      [3] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Dairy"),
      [4] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Task"),
      [5] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_FootStep"),
      [6] = UI.getChildControl(self._ui.stc_TabGroup, "RadioButton_Life")
    }
    for ii = 1, self._maxPanelTypeNumber do
      self._ui.radioButton[ii]:addInputEvent("Mouse_LUp", "InputMLUp_TapToOpenWindow(" .. ii .. ")")
    end
  end
  self._ui.txt_CharacterName = UI.getChildControl(self._ui.stc_CharacterInfoBg, "StaticText_CharacterName")
  self._ui.stc_CharacterIcon = UI.getChildControl(self._ui.txt_CharacterName, "Static_Icon")
  self._ui.txt_Journey = UI.getChildControl(self._ui.stc_CharacterInfoBg, "StaticText_Journey")
  self._ui.stc_ProfileImageBg = UI.getChildControl(self._ui.stc_CharacterInfoBg, "Static_LeftBg")
  self._ui.stc_ProfileSlot = UI.getChildControl(self._ui.stc_ProfileImageBg, "Static_Profile_Image")
  self._ui.stc_TakePicBg = UI.getChildControl(self._ui.stc_ProfileSlot, "Static_Bg")
  self._ui.stc_TakePic = UI.getChildControl(self._ui.stc_ProfileSlot, "StaticText_Take_Pic")
  if true == _ContentsGroup_RenewUI then
    self._ui.stc_TakePicBg:SetShow(false)
    self._ui.stc_TakePic:SetShow(false)
  else
    self._ui.stc_TakePicBg:addInputEvent("Mouse_LUp", "InputMLUp_CharacterInfo_TakePicButton()")
  end
  self._ui.stc_FamilyInfoBg = UI.getChildControl(self._ui.stc_CharacterInfoBg, "Static_Fam_Info")
  self._ui.txt_FamilyPoint = UI.getChildControl(self._ui.stc_FamilyInfoBg, "StaticText_Fam_Point")
  self._ui.txt_BattlePoint = UI.getChildControl(self._ui.stc_FamilyInfoBg, "StaticText_Battle_Point")
  self._ui.txt_LifePoint = UI.getChildControl(self._ui.stc_FamilyInfoBg, "StaticText_Life_Point")
  self._ui.txt_SpecialPoint = UI.getChildControl(self._ui.stc_FamilyInfoBg, "StaticText_Special_Point")
  self._ui.txt_Introduce = UI.getChildControl(self._ui.stc_ProfileImageBg, "Edit_Introduce")
  self._ui.StaticText_IntroduceSave = UI.getChildControl(self._ui.stc_ProfileImageBg, "Static_IntroduceSave")
  self._ui.stc_StatInfoBg = UI.getChildControl(self._ui.stc_CharacterInfoBg, "Static_Stat_Basic")
  self._ui.txt_MentalTitle = UI.getChildControl(self._ui.stc_StatInfoBg, "StaticText_Mental")
  self._ui.txt_HealthPoint = UI.getChildControl(self._ui.stc_StatInfoBg, "StaticText_Health_Val")
  self._ui.txt_MentalPoint = UI.getChildControl(self._ui.stc_StatInfoBg, "StaticText_Mental_Val")
  self._ui.txt_WeightPoint = UI.getChildControl(self._ui.stc_StatInfoBg, "StaticText_Weight_Val")
  self._ui.progress_Health = UI.getChildControl(self._ui.stc_StatInfoBg, "Progress2_Health")
  self._ui.progress_Mental = UI.getChildControl(self._ui.stc_StatInfoBg, "Progress2_Mental")
  self._ui.progress_Weight = UI.getChildControl(self._ui.stc_StatInfoBg, "Progress2_Weight")
  self._ui.progress_Weight2 = UI.getChildControl(self._ui.stc_StatInfoBg, "Progress2_Weight2")
  self._ui.progress_Weight3 = UI.getChildControl(self._ui.stc_StatInfoBg, "Progress2_Weight3")
  self._ui.txt_Count = UI.getChildControl(self._ui.stc_StatInfoBg, "StaticText_Count")
  self._ui.stc_StatBattleInfoBg = UI.getChildControl(self._ui.stc_CharacterInfoBg, "Static_Stat_Battle")
  self._ui.txt_AtkPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Atk_Val")
  self._ui.txt_DefTxt = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Def")
  self._ui.txt_DefPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Def_Val")
  self._ui.txt_StaminaTxt = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Stamina")
  self._ui.txt_StaminaPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Stamina_Val")
  self._ui.txt_AwakenAtkTxt = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Atk_Awaken")
  self._ui.txt_AwakenAtkPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Atk_Awaken_Val")
  if true == _ContentsGroup_RenewUI then
    self._ui.txt_StaminaTxt:SetPosY(self._ui.txt_DefTxt:GetPosY())
    self._ui.txt_StaminaPoint:SetPosY(self._ui.txt_DefPoint:GetPosY())
    self._ui.txt_DefTxt:SetPosY(self._ui.txt_AwakenAtkTxt:GetPosY())
    self._ui.txt_DefPoint:SetPosY(self._ui.txt_AwakenAtkPoint:GetPosY())
    self._ui.txt_AwakenAtkTxt:SetShow(false)
    self._ui.txt_AwakenAtkPoint:SetShow(false)
  end
  self._ui.txt_SKillPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Skill_Point")
  self._ui.txt_AtkSpeedLevel = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Atk_Speed_Level")
  self._ui.txt_MoveSpeedLevel = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Move_Speed_Level")
  self._ui.txt_CriticalLevel = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Cri_Level")
  self._ui.txt_FishingLevel = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Fish_Level")
  self._ui.txt_GatherLevel = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Gather_Level")
  self._ui.txt_LuckLevel = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Luck_Level")
  self._ui.stc_Potential_BarBgTemplete = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "Static_Potential_GaugeBG")
  self._ui.stc_Potential_BarTemplete = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "Static_Potential_Gauge")
  self._ui.stc_BaseInfoBg = UI.getChildControl(self._ui.stc_CharacterInfoBg, "Static_BaseInfoBg")
  self._ui.txt_Style = UI.getChildControl(self._ui.stc_BaseInfoBg, "StaticText_Style")
  self._ui.txt_Enegy = UI.getChildControl(self._ui.stc_BaseInfoBg, "StaticText_Energy")
  self._ui.txt_Contribution = UI.getChildControl(self._ui.stc_BaseInfoBg, "StaticText_Contrib")
  self._ui.txt_Star = UI.getChildControl(self._ui.stc_BaseInfoBg, "StaticText_Star")
  self._ui.stc_StatPotentialInfoBg = UI.getChildControl(self._ui.stc_CharacterInfoBg, "Static_Potential")
  self._ui.txt_BreathInfo = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Breath")
  self._ui.txt_BreathLevel = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Breath_level")
  self._ui.progress_Breath = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "Progress2_Breath")
  self._ui.txt_PowerInfo = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Power")
  self._ui.txt_PowerLevel = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Power_level")
  self._ui.progress_Power = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "Progress2_Power")
  self._ui.txt_HealthInfo = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Health")
  self._ui.txt_HealthLevel = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Health_level")
  self._ui.progress_Health2 = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "Progress2_Health")
  self._ui.txt_StunPoint = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Stun_Reg_Val")
  self._ui.progress_Stun = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "Progress2_Stun")
  self._ui.txt_GrabPoint = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Grab_Reg_Val")
  self._ui.progress_Grab = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "Progress2_Grab")
  self._ui.txt_KnockDownPoint = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Down_Reg_Val")
  self._ui.progress_KnockDown = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "Progress2_KnockDown")
  self._ui.txt_KnockBackPoint = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "StaticText_Air_Reg_Val")
  self._ui.progress_KnockBack = UI.getChildControl(self._ui.stc_StatPotentialInfoBg, "Progress2_KnockBack")
  self._toolTipDefaultPosX = self._ui.txt_toolTip:GetPosX()
  self._ui.stc_ToolTipArrow = UI.getChildControl(self._ui.txt_toolTip, "Static_ToolTip_Arrow")
  self:mpTitle_Init()
  self:potentialGauge_Init()
  self:XB_Contorl_Init()
  _panel:RegisterUpdateFunc("CoolTimeCountdown_UpdatePerFrame")
  self:registMessageHandler()
end
function CharacterInfo:potentialGauge_Init()
  local _sizeX = math.floor(self._potentialUIData.maxX / self._potentialUIData.limitPotentialLevel)
  local _gapX = _sizeX + 3
  self._ui.stc_PotentialBarBg = {}
  self._ui.stc_PotentialBar = {}
  for ii = 1, self.POTENTIAL_TYPE.TOTALCOUNT do
    self._ui.stc_PotentialBarBg[ii] = {}
    self._ui.stc_PotentialBar[ii] = {}
    for jj = 1, self._potentialUIData.limitPotentialLevel do
      self._ui.stc_PotentialBarBg[ii][jj] = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, self._ui.stc_StatBattleInfoBg, "Static_Potential_BarBg" .. ii .. jj)
      CopyBaseProperty(self._ui.stc_Potential_BarBgTemplete, self._ui.stc_PotentialBarBg[ii][jj])
      self._ui.stc_PotentialBar[ii][jj] = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, self._ui.stc_PotentialBarBg[ii][jj], "Static_Potential_Bar" .. ii .. jj)
      CopyBaseProperty(self._ui.stc_Potential_BarTemplete, self._ui.stc_PotentialBar[ii][jj])
      self._ui.stc_PotentialBarBg[ii][jj]:SetSize(_sizeX, self._potentialUIData.sizeY)
      self._ui.stc_PotentialBarBg[ii][jj]:SetPosX(self._potentialUIData.posX + _gapX * (jj - 1))
      self._ui.stc_PotentialBarBg[ii][jj]:SetPosY(self._potentialUIData.posY + self._potentialUIData.gapY * (ii - 1))
      self._ui.stc_PotentialBar[ii][jj]:SetSize(_sizeX, self._potentialUIData.sizeY)
      self._ui.stc_PotentialBar[ii][jj]:SetShow(false)
    end
  end
  self._ui.stc_Potential_BarBgTemplete:SetShow(false)
  self._ui.stc_Potential_BarTemplete:SetShow(false)
end
function CharacterInfo:mpTitle_Init()
  self._player = getSelfPlayer()
  if UI_classType.ClassType_Ranger == self._player:getClassType() then
    self._ui.txt_MentalTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_EP"))
  elseif UI_classType.ClassType_Warrior == self._player:getClassType() or UI_classType.ClassType_Giant == self._player:getClassType() or UI_classType.ClassType_BladeMaster == self._player:getClassType() or UI_classType.ClassType_BladeMasterWomen == self._player:getClassType() or UI_classType.ClassType_NinjaWomen == self._player:getClassType() or UI_classType.ClassType_NinjaMan == self._player:getClassType() or UI_classType.ClassType_Combattant == self._player:getClassType() or UI_classType.ClassType_CombattantWomen == self._player:getClassType() then
    self._ui.txt_MentalTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_FP"))
  elseif UI_classType.ClassType_Sorcerer == self._player:getClassType() or UI_classType.ClassType_Tamer == self._player:getClassType() or UI_classType.ClassType_Wizard == self._player:getClassType() or UI_classType.ClassType_WizardWomen == self._player:getClassType() then
    self._ui.txt_MentalTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MP"))
  elseif UI_classType.ClassType_Valkyrie == self._player:getClassType() then
    self._ui.txt_MentalTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_BP"))
  elseif UI_classType.ClassType_DarkElf == self._player:getClassType() then
    self._ui.txt_MentalTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MP_DARKELF"))
  end
end
function InputMLUp_TapToOpenWindow(index)
  local self = CharacterInfo
  Panel_Tooltip_Item_hideTooltip()
  self._currentPanelType = index
  local panelDisplay = {}
  if true == _ContentsGroup_RenewUI then
    panelDisplay = {
      [1] = self._ui.stc_CharacterInfoBg,
      [2] = self._ui.stc_TitleInfoBg,
      [3] = self._ui.stc_HistoryInfoBg,
      [4] = self._ui.stc_ProfileInfoBg
    }
    self._tapName[4] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_PROFILETABNAME")
  else
    panelDisplay = {
      [1] = self._ui.stc_CharacterInfoBg,
      [2] = self._ui.stc_TitleInfoBg,
      [3] = self._ui.stc_HistoryInfoBg,
      [4] = self._ui.stc_ChallengeInfoBg,
      [5] = self._ui.stc_ProfileInfoBg,
      [6] = self._ui.stc_LifeInfoBg
    }
  end
  for ii = 1, self._maxPanelTypeNumber do
    panelDisplay[ii]:SetShow(false)
    self._ui.radioButton[ii]:SetCheck(false)
  end
  panelDisplay[index]:SetShow(true)
  self._ui.radioButton[index]:SetCheck(true)
  local radioButtonXAxis = self._ui.radioButton[index]:GetPosX()
  self._ui.txt_toolTip:SetText(self._tapName[index])
  self._ui.txt_toolTip:SetPosX(radioButtonXAxis - 20)
  local toolTipLen = string.len(self._ui.txt_toolTip:GetText())
  if toolTipLen > 9 then
    self._ui.txt_toolTip:SetSize(10 * toolTipLen, 30)
    self._ui.txt_toolTip:SetPosX(self._ui.txt_toolTip:GetPosX() - (toolTipLen - 9) * 5)
  else
    self._ui.txt_toolTip:SetSize(90, 30)
  end
  self._ui.stc_ToolTipArrow:ComputePos()
  if 1 == index then
    self:update()
  elseif 2 == index then
    InputMLUp_CharacterTitleInfo_TapToOpen(0)
  elseif 3 == index then
    PaGlobalFunc_CharacterHistoryInfo_Open()
  elseif 4 == index then
    if true == _ContentsGroup_RenewUI then
      InputMLUp_CharacterChallengeInfo_TapToOpen(0)
    else
      InputMLUp_CharacterProfileInfo_TapToOpen(0)
    end
  elseif 5 == index and false == _ContentsGroup_RenewUI then
    InputMLUp_CharacterProfileInfo_TapToOpen(0)
  elseif 6 == index and false == _ContentsGroup_RenewUI then
    PaGlobalFunc_CharacterLifeInfo_Update()
  end
end
function CharacterInfo:update()
  self._player = getSelfPlayer()
  self._playerGet = self._player:get()
  FromClient_CharacterInfo_Basic_LevelChanged()
  local _totalPlayTime = Util.Time.timeFormatting_Minute(Int64toInt32(ToClient_GetCharacterPlayTime()))
  self._ui.txt_Journey:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONTRACT_TIME_BLACKSPIRIT") .. "<PAColor0xFFFFC730> " .. _totalPlayTime .. "<PAOldColor> ")
  local classType = self._player:getClassType()
  local classSymbol = UI_ClassSymbol[classType]
  self._ui.stc_CharacterIcon:ChangeTextureInfoName(classSymbol[1])
  local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_CharacterIcon, classSymbol[2], classSymbol[3], classSymbol[4], classSymbol[5])
  self._ui.stc_CharacterIcon:getBaseTexture():setUV(x1, y1, x2, y2)
  self._ui.stc_CharacterIcon:setRenderTexture(self._ui.stc_CharacterIcon:getBaseTexture())
  local totalPlayTime = Util.Time.timeFormatting_Minute(Int64toInt32(ToClient_GetCharacterPlayTime()))
  self._ui.txt_Journey:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONTRACT_TIME_BLACKSPIRIT") .. "<PAColor0xFFFFC730> " .. totalPlayTime .. "<PAOldColor> ")
  self._ui.txt_Journey:SetSize(self._ui.txt_Journey:GetTextSizeX(), self._ui.txt_Journey:GetSizeY())
  local battleFP = self._playerGet:getBattleFamilyPoint()
  local lifeFP = self._playerGet:getLifeFamilyPoint()
  local etcFP = self._playerGet:getEtcFamilyPoint()
  local sumFP = battleFP + lifeFP + etcFP
  self._ui.txt_FamilyPoint:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_SUM_TOOLTIP_TITLE") .. " " .. tostring(sumFP))
  self._ui.txt_BattlePoint:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_COMBAT_TOOLTIP_TITLE") .. " " .. tostring(battleFP))
  self._ui.txt_LifePoint:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_LIFE_TOOLTIP_TITLE") .. " " .. tostring(lifeFP))
  self._ui.txt_SpecialPoint:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_ETC_TOOLTIP_TITLE") .. " " .. tostring(etcFP))
  local msg = ToClient_GetUserIntroduction()
  local oneLineMsg = string.gsub(msg, "\n", " ")
  self._ui.txt_Introduce:SetEditText(oneLineMsg)
  self._ui.txt_Introduce:SetEditText(self._ui.txt_Introduce:GetEditText(), true)
  self._ui.txt_Introduce:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_Introduce:SetMaxEditLine(2)
  self._ui.txt_Introduce:addInputEvent("Mouse_LUp", "InputMLUp_CharacterInfo_Edit_Introduce()")
  self:updateFacePhoto()
  FromClient_CharacterInfo_Basic_HpChanged()
  FromClient_CharacterInfo_Basic_MpChanged()
  FromClient_CharacterInfo_Basic_WeightChanged()
  local _defaultCount = self._playerGet:getEnchantFailCount()
  local _valksCount = self._playerGet:getEnchantValuePackCount()
  self._ui.txt_Count:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NPC_DIALOG_TUTORIALSTARTBUTTON_2") .. " " .. _defaultCount + _valksCount)
  FromClient_CharacterInfo_Basic_AttackChanged()
  FromClient_CharacterInfo_Basic_StaminaChanged()
  FromClient_CharacterInfo_Basic_SkillPointChanged()
  FromClient_CharacterInfo_Basic_PotentialChanged()
  FromClient_CharacterInfo_Basic_TendencyChanged()
  FromClient_CharacterInfo_Basic_MentalChanged()
  FromClient_CharacterInfo_Basic_ContributionChanged()
  local _zodiacName = self._player:getZodiacSignOrderStaticStatusWrapper():getZodiacName()
  self._ui.txt_Star:SetText(tostring(_zodiacName))
  FromClient_CharacterInfo_Basic_FitnessChanged(0, 0, 0, 0)
  FromClient_CharacterInfo_Basic_ResistChanged()
end
function FromClient_CharacterInfo_Basic_LevelChanged()
  local self = CharacterInfo
  local _playerLevel = self._player:get():getLevel()
  local _famiName = self._player:getUserNickname()
  local _charName = self._player:getOriginalName()
  self._ui.txt_CharacterName:SetText("LV." .. _playerLevel .. " " .. tostring(_charName) .. "(" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDLIST_FAMILYNAME", "name", tostring(_famiName)) .. ")")
end
function PaGlobalFunc_CharacterLifeInfo_ClearFocus()
  local self = CharacterInfo
  self._ui.txt_Introduce:SetEditText(self._ui.txt_Introduce:GetEditText(), true)
  ToClient_RequestSetUserIntroduction(self._ui.txt_Introduce:GetText())
  ClearFocusEdit()
  self._ui.txt_Introduce:addInputEvent("Mouse_LUp", "InputMLUp_CharacterInfo_Edit_Introduce()")
  self._ui.stc_CharacterInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "InputMLUp_CharacterInfo_Edit_Introduce()")
end
function InputMLUp_CharacterInfo_Edit_Introduce()
  local self = CharacterInfo
  ClearFocusEdit()
  SetFocusEdit(self._ui.txt_Introduce)
  self._ui.txt_Introduce:SetMaxEditLine(2)
  self._ui.txt_Introduce:SetMaxInput(120)
  self._ui.txt_Introduce:SetEditText(self._ui.txt_Introduce:GetEditText(), true)
  self._ui.txt_Introduce:addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterLifeInfo_ClearFocus()")
  self._ui.stc_CharacterInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobalFunc_CharacterLifeInfo_ClearFocus()")
end
function PaGlobalFunc_CharacterInfo_UpdateFacePhoto()
  local self = CharacterInfo
  CharacterInfo:updateFacePhoto()
end
function CharacterInfo:updateFacePhoto()
  local classType = self._player:getClassType()
  local TextureName = ToClient_GetCharacterFaceTexturePath(self._player:getCharacterNo_64())
  local isCaptureExist = self._ui.stc_ProfileSlot:ChangeTextureInfoNameNotDDS(TextureName, classType, true)
  if isCaptureExist == true then
    self._ui.stc_ProfileSlot:getBaseTexture():setUV(0, 0, 1, 1)
  else
    local DefaultFace = UI_DefaultFaceTexture[classType]
    self._ui.stc_ProfileSlot:ChangeTextureInfoName(DefaultFace[1])
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_ProfileSlot, DefaultFace[2], DefaultFace[3], DefaultFace[4], DefaultFace[5])
    self._ui.stc_ProfileSlot:getBaseTexture():setUV(x1, y1, x2, y2)
  end
  self._ui.stc_ProfileSlot:setRenderTexture(self._ui.stc_ProfileSlot:getBaseTexture())
end
function InputMLUp_CharacterInfo_TakePicButton()
  FGlobal_InGameCustomize_SetCharacterInfo(true)
  IngameCustomize_Show()
end
function FromClient_CharacterInfo_Basic_HpChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  local _hp = self._playerGet:getHp()
  local _maxHp = self._playerGet:getMaxHp()
  local _hpRate = _hp / _maxHp * 100
  self._ui.txt_HealthPoint:SetText(tostring(_hp) .. " / " .. tostring(_maxHp))
  self._ui.progress_Health:SetProgressRate(_hpRate)
end
function FromClient_CharacterInfo_Basic_MpChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  local _mp = self._playerGet:getMp()
  local _maxMp = self._playerGet:getMaxMp()
  local _mpRate = _mp / _maxMp * 100
  self._ui.txt_MentalPoint:SetText(tostring(_mp) .. " / " .. tostring(_maxMp))
  self._ui.progress_Mental:SetProgressRate(_mpRate)
end
function FromClient_CharacterInfo_Basic_WeightChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
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
    self._ui.progress_Weight = UI.getChildControl(self._ui.stc_StatInfoBg, "Progress2_Weight")
    self._ui.progress_Weight3:SetProgressRate(Int64toInt32(s64_moneyWeight / s64_maxWeight_div))
    self._ui.progress_Weight2:SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_maxWeight_div))
    self._ui.progress_Weight:SetProgressRate(Int64toInt32(s64_allWeight / s64_maxWeight_div))
  else
    self._ui.progress_Weight3:SetProgressRate(Int64toInt32(s64_moneyWeight / s64_allWeight_div))
    self._ui.progress_Weight2:SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_allWeight_div))
    self._ui.progress_Weight:SetProgressRate(Int64toInt32(s64_allWeight / s64_allWeight_div))
  end
  self._ui.txt_WeightPoint:SetText(tostring(str_AllWeight) .. " / " .. tostring(str_MaxWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end
function FromClient_CharacterInfo_Basic_AttackChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  ToClient_updateAttackStat()
  local _charAttack = ToClient_getOffence()
  self._ui.txt_AtkPoint:SetText(tostring(_charAttack))
  local _charAwakenAttack = ToClient_getAwakenOffence()
  self._ui.txt_AwakenAtkPoint:SetText(tostring(_charAwakenAttack))
  local _charDefence = ToClient_getDefence()
  self._ui.txt_DefPoint:SetText(tostring(_charDefence))
  self._ui.stc_StatBattleInfoBg = UI.getChildControl(self._ui.stc_CharacterInfoBg, "Static_Stat_Battle")
  self._ui.txt_AtkPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Atk_Val")
  self._ui.txt_AwakenAtkPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Atk_Awaken_Val")
  self._ui.txt_DefPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Def_Val")
  self._ui.txt_StaminaPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Stamina_Val")
  self._ui.txt_SKillPoint = UI.getChildControl(self._ui.stc_StatBattleInfoBg, "StaticText_Skill_Point")
end
function FromClient_CharacterInfo_Basic_SkillPointChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  local _skillPointInfo = ToClient_getSkillPointInfo(0)
  if nil ~= _skillPointInfo then
    self._ui.txt_SKillPoint:SetText(PAGetString(Defines.StringSheet_RESOURCE, "SKILL_TEXT_POINT") .. " " .. tostring(_skillPointInfo._remainPoint .. " / " .. _skillPointInfo._acquirePoint))
  end
end
function FromClient_CharacterInfo_Basic_StaminaChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  local _maxStamina = self._playerGet:getStamina():getMaxSp()
  self._ui.txt_StaminaPoint:SetText(tostring(_maxStamina))
end
function FromClient_CharacterInfo_Basic_PotentialChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  local levelText = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_POTENLEVEL")
  local classType = self._player:getClassType()
  local _txt_PotentialDisplay = {
    [1] = self._ui.txt_AtkSpeedLevel,
    [2] = self._ui.txt_MoveSpeedLevel,
    [3] = self._ui.txt_CriticalLevel,
    [4] = self._ui.txt_FishingLevel,
    [5] = self._ui.txt_GatherLevel,
    [6] = self._ui.txt_LuckLevel
  }
  local _potentialData = {
    [1] = self._player:characterStatPointSpeed(self.POTENTIAL_TYPE.ATTACKSPEED + Class_BattleSpeed[classType]) - 5,
    [2] = self._player:characterStatPointSpeed(self.POTENTIAL_TYPE.MOVESPEED) - 5,
    [3] = self._player:characterStatPointCritical(),
    [4] = self._player:getCharacterStatPointFishing(),
    [5] = self._player:getCharacterStatPointCollection(),
    [6] = self._player:getCharacterStatPointDropItem()
  }
  for ii = 1, self.POTENTIAL_TYPE.TOTALCOUNT do
    if self._potentialUIData.limitPotentialLevel <= _potentialData[ii] then
      _potentialData[ii] = self._potentialUIData.limitPotentialLevel
    end
    _txt_PotentialDisplay[ii]:SetText(_potentialData[ii] .. " " .. levelText)
    for jj = 1, self._potentialUIData.limitPotentialLevel do
      if jj <= _potentialData[ii] then
        self._ui.stc_PotentialBar[ii][jj]:SetShow(true)
      else
        self._ui.stc_PotentialBar[ii][jj]:SetShow(false)
      end
    end
  end
end
function FromClient_CharacterInfo_Basic_TendencyChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  local _style = self._playerGet:getTendency()
  self._ui.txt_Style:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_TENDENCY") .. " " .. tostring(_style))
end
function FromClient_CharacterInfo_Basic_MentalChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  local _mental = self._player:getWp()
  local _maxMental = self._player:getMaxWp()
  self._ui.txt_Enegy:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_MENTAL") .. " " .. tostring(_mental) .. " / " .. tostring(_maxMental))
end
function FromClient_CharacterInfo_Basic_ContributionChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  local _territoryKeyRaw = ToClient_getDefaultTerritoryKey()
  local _contribution = ToClient_getExplorePointByTerritoryRaw(_territoryKeyRaw)
  local _remainContribution = _contribution:getRemainedPoint()
  local _aquiredContribution = _contribution:getAquiredPoint()
  self._ui.txt_Contribution:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_CONTRIBUTION") .. " " .. tostring(_remainContribution) .. " / " .. tostring(_aquiredContribution))
end
function FromClient_CharacterInfo_Basic_FitnessChanged(addSp, addWeight, addHp, addMp)
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  if addSp > 0 then
    FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, self._fitness.stamina)
  elseif addWeight > 0 then
    FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, self._fitness.strength)
  elseif addHp > 0 or addMp > 0 then
    FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, self._fitness.health)
  end
  local _txt_FitnessDisplay = {
    [1] = self._ui.txt_BreathInfo,
    [2] = self._ui.txt_PowerInfo,
    [3] = self._ui.txt_HealthInfo
  }
  local _txt_FitnessLevelDisplay = {
    [1] = self._ui.txt_BreathLevel,
    [2] = self._ui.txt_PowerLevel,
    [3] = self._ui.txt_HealthLevel
  }
  local _progressFitnessDisplay = {
    [1] = self._ui.progress_Breath,
    [2] = self._ui.progress_Power,
    [3] = self._ui.progress_Health2
  }
  local _titleString = {}
  if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
    _titleString = {
      [1] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE"),
      [2] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE"),
      [3] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE")
    }
  else
    _titleString = {
      [1] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE_ONE"),
      [2] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE_ONE"),
      [3] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE_ONE")
    }
  end
  for ii = 1, 3 do
    local current = Int64toInt32(self._playerGet:getCurrFitnessExperiencePoint(ii - 1))
    local max = Int64toInt32(self._playerGet:getDemandFItnessExperiencePoint(ii - 1))
    local rate = current / max * 100
    local level = self._playerGet:getFitnessLevel(ii - 1)
    _progressFitnessDisplay[ii]:SetProgressRate(rate)
    _txt_FitnessLevelDisplay[ii]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL") .. tostring(level))
    _txt_FitnessDisplay[ii]:SetText(_titleString[ii] .. " " .. tostring(ToClient_GetFitnessLevelStatus(ii - 1)))
    if ii ~= self._fitness.strength then
      if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
        _txt_FitnessDisplay[ii]:SetText(_titleString[ii] .. " " .. tostring(ToClient_GetFitnessLevelStatus(ii - 1)))
      else
        _txt_FitnessDisplay[ii]:SetText(_titleString[ii])
      end
    elseif isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
      _txt_FitnessDisplay[ii]:SetText(_titleString[ii] .. " " .. tostring(ToClient_GetFitnessLevelStatus(ii - 1) / 10000))
    else
      _txt_FitnessDisplay[ii]:SetText(_titleString[ii])
    end
  end
end
function FromClient_CharacterInfo_Basic_ResistChanged()
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return
  end
  local _data = {
    sturn = self._player:getStunResistance(),
    grab = self._player:getCatchResistance(),
    knockDown = self._player:getKnockdownResistance(),
    knockBack = self._player:getKnockbackResistance()
  }
  local _dataDisplay = {
    [1] = _data.sturn,
    [2] = _data.grab,
    [3] = _data.knockDown,
    [4] = _data.knockBack
  }
  local _registTextDisplay = {
    [1] = self._ui.txt_StunPoint,
    [2] = self._ui.txt_GrabPoint,
    [3] = self._ui.txt_KnockDownPoint,
    [4] = self._ui.txt_KnockBackPoint
  }
  local _registProgressDisplay = {
    [1] = self._ui.progress_Stun,
    [2] = self._ui.progress_Grab,
    [3] = self._ui.progress_KnockDown,
    [4] = self._ui.progress_KnockBack
  }
  for ii = 1, 4 do
    _registProgressDisplay[ii]:SetProgressRate(math.floor(_dataDisplay[ii] / 10000))
    _registTextDisplay[ii]:SetText(math.floor(_dataDisplay[ii] / 10000) .. "%")
  end
end
function CharacterInfo:registMessageHandler()
  registerEvent("FromClient_SelfPlayerTendencyChanged", "FromClient_CharacterInfo_Basic_TendencyChanged")
  registerEvent("FromClient_WpChanged", "FromClient_CharacterInfo_Basic_MentalChanged")
  registerEvent("FromClient_UpdateExplorePoint", "FromClient_CharacterInfo_Basic_ContributionChanged")
  registerEvent("FromClient_SelfPlayerExpChanged", "FromClient_CharacterInfo_Basic_LevelChanged")
  registerEvent("EventSelfPlayerLevelUp", "FromClient_CharacterInfo_Basic_LevelChanged")
  registerEvent("FromClient_SelfPlayerHpChanged", "FromClient_CharacterInfo_Basic_HpChanged")
  registerEvent("FromClient_SelfPlayerMpChanged", "FromClient_CharacterInfo_Basic_MpChanged")
  registerEvent("FromClient_InventoryUpdate", "FromClient_CharacterInfo_Basic_WeightChanged")
  registerEvent("FromClient_WeightChanged", "FromClient_CharacterInfo_WeightChanged")
  registerEvent("EventEquipmentUpdate", "FromClient_CharacterInfo_Basic_AttackChanged")
  registerEvent("EventStaminaUpdate", "FromClient_CharacterInfo_Basic_StaminaChanged")
  registerEvent("FromClient_SelfPlayerCombatSkillPointChanged", "FromClient_CharacterInfo_Basic_SkillPointChanged")
  registerEvent("FromClient_UpdateTolerance", "FromClient_CharacterInfo_Basic_ResistChanged")
  registerEvent("FromClient_UpdateSelfPlayerLifeExp", "FromClient_UI_CharacterInfo_Basic_CraftLevelChanged")
  registerEvent("FromClient_UpdateSelfPlayerStatPoint", "FromClient_CharacterInfo_Basic_PotentialChanged")
  registerEvent("FromClientFitnessUp", "FromClient_CharacterInfo_Basic_FitnessChanged")
  registerEvent("FromClient_ShowLifeRank", "FromClient_UI_CharacterInfo_Basic_RankChanged")
  registerEvent("onScreenResize", "FromClient_UI_CharacterInfo_Basic_ScreenResize")
  registerEvent("FromClient_PlayerTotalStat_Changed", "FromClient_CharacterInfo_PlayerTotalStat_Changed")
  _panel:RegisterShowEventFunc(true, "PaGlobalFunc_CharacterInfo_ShowAni()")
  _panel:RegisterShowEventFunc(false, "PaGlobalFunc_CharacterInfo_HideAni()")
end
function PaGlobalFunc_Window_CharacterInfo_Open()
  CharacterInfo:open()
end
function CharacterInfo:open()
  _panel:SetShow(true, true)
  self:update()
  InputMLUp_TapToOpenWindow(1)
end
function PaGlobalFunc_Window_CharacterInfo_Close()
  CharacterInfo:close()
end
function PaGlobalFunc_Window_CharacterInfo_GetShow()
  Panel_Window_CharacterInfo_Renew:GetShow()
end
function PaGlobalFunc_Window_CharacterInfo_SaveUserIntroduction()
  if nil == CharacterInfo then
    return
  end
  self = CharacterInfo
  ToClient_RequestSetUserIntroduction(self._ui.txt_Introduce:GetText())
end
function CharacterInfo:close()
  audioPostEvent_SystemUi(1, 1)
  Panel_Window_CharacterInfo_Renew:SetShow(false, false)
  UI.ClearFocusEdit()
  Panel_Window_CharacterInfo_Renew:CloseUISubApp()
  HelpMessageQuestion_Out()
  Panel_Tooltip_Item_hideTooltip()
end
function PaGlobalFunc_CharacterInfo_CheckIntroduceUiEdit(targetUI)
  local self = CharacterInfo
  return nil ~= targetUI and targetUI:GetKey() == self._ui.txt_Introduce:GetKey()
end
function PaGlobalFunc_CharacterInfo_ShowRightNextTab()
  local self = CharacterInfo
  self:ShowNextTab(false)
end
function PaGlobalFunc_CharacterInfo_ShowLeftNextTab()
  local self = CharacterInfo
  self:ShowNextTab(true)
end
function CharacterInfo:ShowNextTab(isLeft)
  if true == isLeft then
    if 1 < self._currentPanelType then
      self._currentPanelType = self._currentPanelType - 1
    else
      self._currentPanelType = self._maxPanelTypeNumber
    end
    InputMLUp_TapToOpenWindow(self._currentPanelType)
  else
    if self._currentPanelType < self._maxPanelTypeNumber then
      self._currentPanelType = self._currentPanelType + 1
    else
      self._currentPanelType = 1
    end
    InputMLUp_TapToOpenWindow(self._currentPanelType)
  end
end
function PaGlobalFunc_CharacterInfo_ShowAni()
end
function PaGlobalFunc_CharacterInfo_HideAni()
end
function PaGlobalFunc_CharacterInfoTab_PadControl(index)
  local self = CharacterInfo
  _PA_LOG("\236\155\144\236\132\160", "PaGlobalFunc_CharacterInfoTab_PadControl" .. index)
  if 0 == index then
    self:ShowNextTab(true)
  else
    self:ShowNextTab(false)
  end
end
function CharacterInfo:XB_Contorl_Init()
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "PaGlobalFunc_CharacterInfoTab_PadControl(0)")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "PaGlobalFunc_CharacterInfoTab_PadControl(1)")
  self._ui.stc_CharacterInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "InputMLUp_CharacterInfo_Edit_Introduce()")
  self._ui.stc_TitleInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "PaGlobalFunc_CharacterTitleInfoTab_PadControl(0)")
  self._ui.stc_TitleInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "PaGlobalFunc_CharacterTitleInfoTab_PadControl(1)")
  self._ui.stc_HistoryInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "InputMLUp_CharacterHistoryInfo_DecreaseMonth()")
  self._ui.stc_HistoryInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "InputMLUp_CharacterHistoryInfo_IncreaseMonth()")
  self._ui.stc_ChallengeInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "PaGlobalFunc_CharacterChallengeInfoTab_PadControl(0)")
  self._ui.stc_ChallengeInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "PaGlobalFunc_CharacterChallengeInfoTab_PadControl(1)")
  self._ui.stc_ProfileInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "PaGlobalFunc_CharacterProfileInfoTab_PadControl(0)")
  self._ui.stc_ProfileInfoBg:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "PaGlobalFunc_CharacterProfileInfoTab_PadControl(1)")
end
