-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\panel_window_characterinfo_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_CharacterInfo_Renew
local Class_BattleSpeed = CppEnums.ClassType_BattleSpeed
local UI_DefaultFaceTexture = CppEnums.ClassType_DefaultFaceTexture
local UI_classType = CppEnums.ClassType
local UI_ClassSymbol = CppEnums.ClassType_Symbol
local CharacterInfo = {
_ui = {stc_TitleBg = (UI.getChildControl)(_panel, "Static_Title"), stc_TabGroup = (UI.getChildControl)(_panel, "Static_Tab_Group"), stc_CharacterInfoBg = (UI.getChildControl)(_panel, "Static_CharacterInfoBg"), stc_LifeInfoBg = (UI.getChildControl)(_panel, "Static_LifeInfoBg"), stc_TitleInfoBg = (UI.getChildControl)(_panel, "Static_TitleInfoBg"), stc_HistoryInfoBg = (UI.getChildControl)(_panel, "Static_HistoryInfoBg"), stc_ChallengeInfoBg = (UI.getChildControl)(_panel, "Static_ChallengeInfoBg"), stc_ProfileInfoBg = (UI.getChildControl)(_panel, "Static_ProfileInfoBg"), txt_toolTip = (UI.getChildControl)(_panel, "StaticText_ToolTip")}
, 
_potentialUIData = {limitPotentialLevel = 5, maxX = 280, posX = 260, posY = 96, gapY = 35, sizeY = 2}
, 
_fitness = {stamina = 0, strength = 1, health = 2}
, 
PANEL_TYPE = {UNDEFINED = 0, BASIC = 1, NAMED = 2, DAIRY = 3, TASK = 4, FOOTSTEP = 5, LIFE = 6}
, _currentPanelType = 0, _maxPanelTypeNumber = 6, 
POTENTIAL_TYPE = {MOVESPEED = 0, ATTACKSPEED = 1, CRITICALLEVEL = 2, FISHINGLEVEL = 3, GATHERLEVEL = 4, LUCKLEVEL = 5, TOTALCOUNT = 6}
, 
_tapName = {[1] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_BASICTAPNAME"), [2] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_TITLETAPNAME"), [3] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_HISTORYTABNAME"), [4] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_CHALLENGETABNAME"), [5] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_PROFILETABNAME"), [6] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFOTABNAME")}
}
FromClient_luaLoadComplete_CharaterInfo_Init = function()
  -- function num : 0_0 , upvalues : CharacterInfo
  CharacterInfo:init()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_CharaterInfo_Init")
CharacterInfo.init = function(self)
  -- function num : 0_1 , upvalues : _panel
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).stc_LB = (UI.getChildControl)((self._ui).stc_TabGroup, "Static_LB")
  ;
  ((self._ui).stc_LB):addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterInfo_ShowLeftNextTab()")
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_RB = (UI.getChildControl)((self._ui).stc_TabGroup, "Static_RB")
  ;
  ((self._ui).stc_RB):addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterInfo_ShowRightNextTab()")
  if _ContentsGroup_RenewUI == true then
    self._maxPanelTypeNumber = 4
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._ui).radioButton = {[1] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Basic"), [2] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Named"), [3] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Dairy"), [4] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_FootStep")}
    for ii = 1, self._maxPanelTypeNumber do
      (((self._ui).radioButton)[ii]):addInputEvent("Mouse_LUp", "InputMLUp_TapToOpenWindow(" .. ii .. ")")
      local radioButtonXAxis = (((self._ui).radioButton)[1]):GetPosX()
      ;
      (((self._ui).radioButton)[ii]):SetPosX(radioButtonXAxis + 165 * (ii - 1))
    end
    local taskTabControl = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Task")
    local lifeTabControl = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Life")
    taskTabControl:SetShow(false)
    lifeTabControl:SetShow(false)
  else
    do
      self._maxPanelTypeNumber = 6
      -- DECOMPILER ERROR at PC155: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (self._ui).radioButton = {[1] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Basic"), [2] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Named"), [3] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Dairy"), [4] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Task"), [5] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_FootStep"), [6] = (UI.getChildControl)((self._ui).stc_TabGroup, "RadioButton_Life")}
      for ii = 1, self._maxPanelTypeNumber do
        (((self._ui).radioButton)[ii]):addInputEvent("Mouse_LUp", "InputMLUp_TapToOpenWindow(" .. ii .. ")")
      end
      do
        -- DECOMPILER ERROR at PC178: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_CharacterName = (UI.getChildControl)((self._ui).stc_CharacterInfoBg, "StaticText_CharacterName")
        -- DECOMPILER ERROR at PC186: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_CharacterIcon = (UI.getChildControl)((self._ui).txt_CharacterName, "Static_Icon")
        -- DECOMPILER ERROR at PC194: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_Journey = (UI.getChildControl)((self._ui).stc_CharacterInfoBg, "StaticText_Journey")
        -- DECOMPILER ERROR at PC202: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_ProfileImageBg = (UI.getChildControl)((self._ui).stc_CharacterInfoBg, "Static_LeftBg")
        -- DECOMPILER ERROR at PC210: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_ProfileSlot = (UI.getChildControl)((self._ui).stc_ProfileImageBg, "Static_Profile_Image")
        -- DECOMPILER ERROR at PC218: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_TakePicBg = (UI.getChildControl)((self._ui).stc_ProfileSlot, "Static_Bg")
        -- DECOMPILER ERROR at PC226: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_TakePic = (UI.getChildControl)((self._ui).stc_ProfileSlot, "StaticText_Take_Pic")
        if _ContentsGroup_RenewUI == true then
          ((self._ui).stc_TakePicBg):SetShow(false)
          ;
          ((self._ui).stc_TakePic):SetShow(false)
        else
          ;
          ((self._ui).stc_TakePicBg):addInputEvent("Mouse_LUp", "InputMLUp_CharacterInfo_TakePicButton()")
        end
        -- DECOMPILER ERROR at PC254: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_FamilyInfoBg = (UI.getChildControl)((self._ui).stc_CharacterInfoBg, "Static_Fam_Info")
        -- DECOMPILER ERROR at PC262: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_FamilyPoint = (UI.getChildControl)((self._ui).stc_FamilyInfoBg, "StaticText_Fam_Point")
        -- DECOMPILER ERROR at PC270: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_BattlePoint = (UI.getChildControl)((self._ui).stc_FamilyInfoBg, "StaticText_Battle_Point")
        -- DECOMPILER ERROR at PC278: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_LifePoint = (UI.getChildControl)((self._ui).stc_FamilyInfoBg, "StaticText_Life_Point")
        -- DECOMPILER ERROR at PC286: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_SpecialPoint = (UI.getChildControl)((self._ui).stc_FamilyInfoBg, "StaticText_Special_Point")
        -- DECOMPILER ERROR at PC294: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_Introduce = (UI.getChildControl)((self._ui).stc_ProfileImageBg, "Edit_Introduce")
        -- DECOMPILER ERROR at PC302: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).StaticText_IntroduceSave = (UI.getChildControl)((self._ui).stc_ProfileImageBg, "Static_IntroduceSave")
        -- DECOMPILER ERROR at PC310: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_StatInfoBg = (UI.getChildControl)((self._ui).stc_CharacterInfoBg, "Static_Stat_Basic")
        -- DECOMPILER ERROR at PC318: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_MentalTitle = (UI.getChildControl)((self._ui).stc_StatInfoBg, "StaticText_Mental")
        -- DECOMPILER ERROR at PC326: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_HealthPoint = (UI.getChildControl)((self._ui).stc_StatInfoBg, "StaticText_Health_Val")
        -- DECOMPILER ERROR at PC334: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_MentalPoint = (UI.getChildControl)((self._ui).stc_StatInfoBg, "StaticText_Mental_Val")
        -- DECOMPILER ERROR at PC342: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_WeightPoint = (UI.getChildControl)((self._ui).stc_StatInfoBg, "StaticText_Weight_Val")
        -- DECOMPILER ERROR at PC350: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Health = (UI.getChildControl)((self._ui).stc_StatInfoBg, "Progress2_Health")
        -- DECOMPILER ERROR at PC358: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Mental = (UI.getChildControl)((self._ui).stc_StatInfoBg, "Progress2_Mental")
        -- DECOMPILER ERROR at PC366: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Weight = (UI.getChildControl)((self._ui).stc_StatInfoBg, "Progress2_Weight")
        -- DECOMPILER ERROR at PC374: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Weight2 = (UI.getChildControl)((self._ui).stc_StatInfoBg, "Progress2_Weight2")
        -- DECOMPILER ERROR at PC382: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Weight3 = (UI.getChildControl)((self._ui).stc_StatInfoBg, "Progress2_Weight3")
        -- DECOMPILER ERROR at PC390: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_Count = (UI.getChildControl)((self._ui).stc_StatInfoBg, "StaticText_Count")
        -- DECOMPILER ERROR at PC398: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_StatBattleInfoBg = (UI.getChildControl)((self._ui).stc_CharacterInfoBg, "Static_Stat_Battle")
        -- DECOMPILER ERROR at PC406: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_AtkPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Atk_Val")
        -- DECOMPILER ERROR at PC414: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_AwakenAtkPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Atk_Awaken_Val")
        -- DECOMPILER ERROR at PC422: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_DefPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Def_Val")
        -- DECOMPILER ERROR at PC430: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_StaminaPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Stamina_Val")
        -- DECOMPILER ERROR at PC438: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_SKillPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Skill_Point")
        -- DECOMPILER ERROR at PC446: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_AtkSpeedLevel = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Atk_Speed_Level")
        -- DECOMPILER ERROR at PC454: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_MoveSpeedLevel = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Move_Speed_Level")
        -- DECOMPILER ERROR at PC462: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_CriticalLevel = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Cri_Level")
        -- DECOMPILER ERROR at PC470: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_FishingLevel = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Fish_Level")
        -- DECOMPILER ERROR at PC478: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_GatherLevel = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Gather_Level")
        -- DECOMPILER ERROR at PC486: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_LuckLevel = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Luck_Level")
        -- DECOMPILER ERROR at PC494: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_Potential_BarBgTemplete = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "Static_Potential_GaugeBG")
        -- DECOMPILER ERROR at PC502: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_Potential_BarTemplete = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "Static_Potential_Gauge")
        -- DECOMPILER ERROR at PC510: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_BaseInfoBg = (UI.getChildControl)((self._ui).stc_CharacterInfoBg, "Static_BaseInfoBg")
        -- DECOMPILER ERROR at PC518: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_Style = (UI.getChildControl)((self._ui).stc_BaseInfoBg, "StaticText_Style")
        -- DECOMPILER ERROR at PC526: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_Enegy = (UI.getChildControl)((self._ui).stc_BaseInfoBg, "StaticText_Energy")
        -- DECOMPILER ERROR at PC534: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_Contribution = (UI.getChildControl)((self._ui).stc_BaseInfoBg, "StaticText_Contrib")
        -- DECOMPILER ERROR at PC542: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_Star = (UI.getChildControl)((self._ui).stc_BaseInfoBg, "StaticText_Star")
        -- DECOMPILER ERROR at PC550: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).stc_StatPotentialInfoBg = (UI.getChildControl)((self._ui).stc_CharacterInfoBg, "Static_Potential")
        -- DECOMPILER ERROR at PC558: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_BreathInfo = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Breath")
        -- DECOMPILER ERROR at PC566: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_BreathLevel = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Breath_level")
        -- DECOMPILER ERROR at PC574: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Breath = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "Progress2_Breath")
        -- DECOMPILER ERROR at PC582: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_PowerInfo = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Power")
        -- DECOMPILER ERROR at PC590: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_PowerLevel = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Power_level")
        -- DECOMPILER ERROR at PC598: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Power = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "Progress2_Power")
        -- DECOMPILER ERROR at PC606: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_HealthInfo = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Health")
        -- DECOMPILER ERROR at PC614: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_HealthLevel = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Health_level")
        -- DECOMPILER ERROR at PC622: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Health2 = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "Progress2_Health")
        -- DECOMPILER ERROR at PC630: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_StunPoint = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Stun_Reg_Val")
        -- DECOMPILER ERROR at PC638: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Stun = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "Progress2_Stun")
        -- DECOMPILER ERROR at PC646: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_GrabPoint = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Grab_Reg_Val")
        -- DECOMPILER ERROR at PC654: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_Grab = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "Progress2_Grab")
        -- DECOMPILER ERROR at PC662: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_KnockDownPoint = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Down_Reg_Val")
        -- DECOMPILER ERROR at PC670: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_KnockDown = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "Progress2_KnockDown")
        -- DECOMPILER ERROR at PC678: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).txt_KnockBackPoint = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "StaticText_Air_Reg_Val")
        -- DECOMPILER ERROR at PC686: Confused about usage of register: R1 in 'UnsetPending'

        ;
        (self._ui).progress_KnockBack = (UI.getChildControl)((self._ui).stc_StatPotentialInfoBg, "Progress2_KnockBack")
        self._toolTipDefaultPosX = ((self._ui).txt_toolTip):GetPosX()
        self:mpTitle_Init()
        self:potentialGauge_Init()
        self:XB_Contorl_Init()
        _panel:RegisterUpdateFunc("CoolTimeCountdown_UpdatePerFrame")
        self:registMessageHandler()
      end
    end
  end
end

CharacterInfo.potentialGauge_Init = function(self)
  -- function num : 0_2
  local _sizeX = (math.floor)((self._potentialUIData).maxX / (self._potentialUIData).limitPotentialLevel)
  local _gapX = _sizeX + 3
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).stc_PotentialBarBg = {}
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).stc_PotentialBar = {}
  for ii = 1, (self.POTENTIAL_TYPE).TOTALCOUNT do
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R7 in 'UnsetPending'

    ((self._ui).stc_PotentialBarBg)[ii] = {}
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._ui).stc_PotentialBar)[ii] = {}
    for jj = 1, (self._potentialUIData).limitPotentialLevel do
      -- DECOMPILER ERROR at PC48: Confused about usage of register: R11 in 'UnsetPending'

      (((self._ui).stc_PotentialBarBg)[ii])[jj] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (self._ui).stc_StatBattleInfoBg, "Static_Potential_BarBg" .. ii .. jj)
      CopyBaseProperty((self._ui).stc_Potential_BarBgTemplete, (((self._ui).stc_PotentialBarBg)[ii])[jj])
      -- DECOMPILER ERROR at PC74: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (((self._ui).stc_PotentialBar)[ii])[jj] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, (((self._ui).stc_PotentialBarBg)[ii])[jj], "Static_Potential_Bar" .. ii .. jj)
      CopyBaseProperty((self._ui).stc_Potential_BarTemplete, (((self._ui).stc_PotentialBar)[ii])[jj])
      ;
      ((((self._ui).stc_PotentialBarBg)[ii])[jj]):SetSize(_sizeX, (self._potentialUIData).sizeY)
      ;
      ((((self._ui).stc_PotentialBarBg)[ii])[jj]):SetPosX((self._potentialUIData).posX + _gapX * (jj - 1))
      ;
      ((((self._ui).stc_PotentialBarBg)[ii])[jj]):SetPosY((self._potentialUIData).posY + (self._potentialUIData).gapY * (ii - 1))
      ;
      ((((self._ui).stc_PotentialBar)[ii])[jj]):SetSize(_sizeX, (self._potentialUIData).sizeY)
      ;
      ((((self._ui).stc_PotentialBar)[ii])[jj]):SetShow(false)
    end
  end
  ;
  ((self._ui).stc_Potential_BarBgTemplete):SetShow(false)
  ;
  ((self._ui).stc_Potential_BarTemplete):SetShow(false)
end

CharacterInfo.mpTitle_Init = function(self)
  -- function num : 0_3 , upvalues : UI_classType
  self._player = getSelfPlayer()
  if UI_classType.ClassType_Ranger == (self._player):getClassType() then
    ((self._ui).txt_MentalTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_EP"))
  else
    if UI_classType.ClassType_Warrior == (self._player):getClassType() or UI_classType.ClassType_Giant == (self._player):getClassType() or UI_classType.ClassType_BladeMaster == (self._player):getClassType() or UI_classType.ClassType_BladeMasterWomen == (self._player):getClassType() or UI_classType.ClassType_NinjaWomen == (self._player):getClassType() or UI_classType.ClassType_NinjaMan == (self._player):getClassType() or UI_classType.ClassType_Combattant == (self._player):getClassType() or UI_classType.ClassType_CombattantWomen == (self._player):getClassType() then
      ((self._ui).txt_MentalTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_FP"))
    else
      if UI_classType.ClassType_Sorcerer == (self._player):getClassType() or UI_classType.ClassType_Tamer == (self._player):getClassType() or UI_classType.ClassType_Wizard == (self._player):getClassType() or UI_classType.ClassType_WizardWomen == (self._player):getClassType() then
        ((self._ui).txt_MentalTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MP"))
      else
        if UI_classType.ClassType_Valkyrie == (self._player):getClassType() then
          ((self._ui).txt_MentalTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_BP"))
        else
          if UI_classType.ClassType_DarkElf == (self._player):getClassType() then
            ((self._ui).txt_MentalTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MP_DARKELF"))
          end
        end
      end
    end
  end
end

InputMLUp_TapToOpenWindow = function(index)
  -- function num : 0_4 , upvalues : CharacterInfo
  local self = CharacterInfo
  Panel_Tooltip_Item_hideTooltip()
  self._currentPanelType = index
  local panelDisplay = {}
  if _ContentsGroup_RenewUI == true then
    panelDisplay = {[1] = (self._ui).stc_CharacterInfoBg, [2] = (self._ui).stc_TitleInfoBg, [3] = (self._ui).stc_HistoryInfoBg, [4] = (self._ui).stc_ProfileInfoBg}
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self._tapName)[4] = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_PROFILETABNAME")
  else
    panelDisplay = {[1] = (self._ui).stc_CharacterInfoBg, [2] = (self._ui).stc_TitleInfoBg, [3] = (self._ui).stc_HistoryInfoBg, [4] = (self._ui).stc_ChallengeInfoBg, [5] = (self._ui).stc_ProfileInfoBg, [6] = (self._ui).stc_LifeInfoBg}
  end
  for ii = 1, self._maxPanelTypeNumber do
    (panelDisplay[ii]):SetShow(false)
    ;
    (((self._ui).radioButton)[ii]):SetCheck(false)
  end
  ;
  (panelDisplay[index]):SetShow(true)
  ;
  (((self._ui).radioButton)[index]):SetCheck(true)
  local radioButtonXAxis = (((self._ui).radioButton)[index]):GetPosX()
  ;
  ((self._ui).txt_toolTip):SetText((self._tapName)[index])
  ;
  ((self._ui).txt_toolTip):SetPosX(radioButtonXAxis - 20)
  if index == 1 then
    self:update()
  else
    if index == 2 then
      InputMLUp_CharacterTitleInfo_TapToOpen(0)
    else
      if index == 3 then
        PaGlobalFunc_CharacterHistoryInfo_Open()
      else
        if index == 4 then
          if _ContentsGroup_RenewUI == true then
            InputMLUp_CharacterChallengeInfo_TapToOpen(0)
          else
            InputMLUp_CharacterProfileInfo_TapToOpen(0)
          end
        else
          if index == 5 and _ContentsGroup_RenewUI == false then
            InputMLUp_CharacterProfileInfo_TapToOpen(0)
          else
            if index == 6 and _ContentsGroup_RenewUI == false then
              PaGlobalFunc_CharacterLifeInfo_Update()
            end
          end
        end
      end
    end
  end
end

CharacterInfo.update = function(self)
  -- function num : 0_5 , upvalues : UI_ClassSymbol
  self._player = getSelfPlayer()
  self._playerGet = (self._player):get()
  FromClient_CharacterInfo_Basic_LevelChanged()
  local _totalPlayTime = ((Util.Time).timeFormatting_Minute)(Int64toInt32(ToClient_GetCharacterPlayTime()))
  ;
  ((self._ui).txt_Journey):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONTRACT_TIME_BLACKSPIRIT") .. "<PAColor0xFFFFC730> " .. _totalPlayTime .. "<PAOldColor> ")
  local classType = (self._player):getClassType()
  local classSymbol = UI_ClassSymbol[classType]
  ;
  ((self._ui).stc_CharacterIcon):ChangeTextureInfoName(classSymbol[1])
  local x1, y1, x2, y2 = setTextureUV_Func((self._ui).stc_CharacterIcon, classSymbol[2], classSymbol[3], classSymbol[4], classSymbol[5])
  ;
  (((self._ui).stc_CharacterIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  ((self._ui).stc_CharacterIcon):setRenderTexture(((self._ui).stc_CharacterIcon):getBaseTexture())
  local totalPlayTime = ((Util.Time).timeFormatting_Minute)(Int64toInt32(ToClient_GetCharacterPlayTime()))
  ;
  ((self._ui).txt_Journey):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONTRACT_TIME_BLACKSPIRIT") .. "<PAColor0xFFFFC730> " .. totalPlayTime .. "<PAOldColor> ")
  ;
  ((self._ui).txt_Journey):SetSize(((self._ui).txt_Journey):GetTextSizeX(), ((self._ui).txt_Journey):GetSizeY())
  local battleFP = (self._playerGet):getBattleFamilyPoint()
  local lifeFP = (self._playerGet):getLifeFamilyPoint()
  local etcFP = (self._playerGet):getEtcFamilyPoint()
  local sumFP = battleFP + lifeFP + etcFP
  ;
  ((self._ui).txt_FamilyPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_SUM_TOOLTIP_TITLE") .. " " .. tostring(sumFP))
  ;
  ((self._ui).txt_BattlePoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_COMBAT_TOOLTIP_TITLE") .. " " .. tostring(battleFP))
  ;
  ((self._ui).txt_LifePoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_LIFE_TOOLTIP_TITLE") .. " " .. tostring(lifeFP))
  ;
  ((self._ui).txt_SpecialPoint):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FAMILYPOINTS_ETC_TOOLTIP_TITLE") .. " " .. tostring(etcFP))
  local msg = ToClient_GetUserIntroduction()
  local oneLineMsg = (string.gsub)(msg, "\n", " ")
  ;
  ((self._ui).txt_Introduce):SetEditText(oneLineMsg)
  ;
  ((self._ui).txt_Introduce):SetEditText(((self._ui).txt_Introduce):GetEditText(), true)
  ;
  ((self._ui).txt_Introduce):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_Introduce):SetMaxEditLine(2)
  ;
  ((self._ui).txt_Introduce):addInputEvent("Mouse_LUp", "InputMLUp_CharacterInfo_Edit_Introduce()")
  self:updateFacePhoto()
  FromClient_CharacterInfo_Basic_HpChanged()
  FromClient_CharacterInfo_Basic_MpChanged()
  FromClient_CharacterInfo_Basic_WeightChanged()
  local _defaultCount = (self._playerGet):getEnchantFailCount()
  local _valksCount = (self._playerGet):getEnchantValuePackCount()
  ;
  ((self._ui).txt_Count):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NPC_DIALOG_TUTORIALSTARTBUTTON_2") .. " " .. _defaultCount + _valksCount)
  FromClient_CharacterInfo_Basic_AttackChanged()
  FromClient_CharacterInfo_Basic_StaminaChanged()
  FromClient_CharacterInfo_Basic_SkillPointChanged()
  FromClient_CharacterInfo_Basic_PotentialChanged()
  FromClient_CharacterInfo_Basic_TendencyChanged()
  FromClient_CharacterInfo_Basic_MentalChanged()
  FromClient_CharacterInfo_Basic_ContributionChanged()
  local _zodiacName = ((self._player):getZodiacSignOrderStaticStatusWrapper()):getZodiacName()
  ;
  ((self._ui).txt_Star):SetText(tostring(_zodiacName))
  FromClient_CharacterInfo_Basic_FitnessChanged(0, 0, 0, 0)
  FromClient_CharacterInfo_Basic_ResistChanged()
end

FromClient_CharacterInfo_Basic_LevelChanged = function()
  -- function num : 0_6 , upvalues : CharacterInfo
  local self = CharacterInfo
  local _playerLevel = ((self._player):get()):getLevel()
  local _famiName = (self._player):getUserNickname()
  local _charName = (self._player):getOriginalName()
  ;
  ((self._ui).txt_CharacterName):SetText("LV." .. _playerLevel .. " " .. tostring(_charName) .. "(" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDLIST_FAMILYNAME", "name", tostring(_famiName)) .. ")")
end

PaGlobalFunc_CharacterLifeInfo_ClearFocus = function()
  -- function num : 0_7 , upvalues : CharacterInfo
  local self = CharacterInfo
  ;
  ((self._ui).txt_Introduce):SetEditText(((self._ui).txt_Introduce):GetEditText(), true)
  ToClient_RequestSetUserIntroduction(((self._ui).txt_Introduce):GetText())
  ClearFocusEdit()
  ;
  ((self._ui).txt_Introduce):addInputEvent("Mouse_LUp", "InputMLUp_CharacterInfo_Edit_Introduce()")
  ;
  ((self._ui).stc_CharacterInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "InputMLUp_CharacterInfo_Edit_Introduce()")
end

InputMLUp_CharacterInfo_Edit_Introduce = function()
  -- function num : 0_8 , upvalues : CharacterInfo
  local self = CharacterInfo
  ClearFocusEdit()
  SetFocusEdit((self._ui).txt_Introduce)
  ;
  ((self._ui).txt_Introduce):SetMaxEditLine(2)
  ;
  ((self._ui).txt_Introduce):SetMaxInput(120)
  ;
  ((self._ui).txt_Introduce):SetEditText(((self._ui).txt_Introduce):GetEditText(), true)
  ;
  ((self._ui).txt_Introduce):addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterLifeInfo_ClearFocus()")
  ;
  ((self._ui).stc_CharacterInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobalFunc_CharacterLifeInfo_ClearFocus()")
end

PaGlobalFunc_CharacterInfo_UpdateFacePhoto = function()
  -- function num : 0_9 , upvalues : CharacterInfo
  local self = CharacterInfo
  CharacterInfo:updateFacePhoto()
end

CharacterInfo.updateFacePhoto = function(self)
  -- function num : 0_10 , upvalues : UI_DefaultFaceTexture
  local classType = (self._player):getClassType()
  local TextureName = ToClient_GetCharacterFaceTexturePath((self._player):getCharacterNo_64())
  local isCaptureExist = ((self._ui).stc_ProfileSlot):ChangeTextureInfoNameNotDDS(TextureName, classType, true)
  if isCaptureExist == true then
    (((self._ui).stc_ProfileSlot):getBaseTexture()):setUV(0, 0, 1, 1)
  else
    local DefaultFace = UI_DefaultFaceTexture[classType]
    ;
    ((self._ui).stc_ProfileSlot):ChangeTextureInfoName(DefaultFace[1])
    local x1, y1, x2, y2 = setTextureUV_Func((self._ui).stc_ProfileSlot, DefaultFace[2], DefaultFace[3], DefaultFace[4], DefaultFace[5])
    ;
    (((self._ui).stc_ProfileSlot):getBaseTexture()):setUV(x1, y1, x2, y2)
  end
  do
    ;
    ((self._ui).stc_ProfileSlot):setRenderTexture(((self._ui).stc_ProfileSlot):getBaseTexture())
  end
end

InputMLUp_CharacterInfo_TakePicButton = function()
  -- function num : 0_11
  FGlobal_InGameCustomize_SetCharacterInfo(true)
  IngameCustomize_Show()
end

FromClient_CharacterInfo_Basic_HpChanged = function()
  -- function num : 0_12 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  local _hp = (self._playerGet):getHp()
  local _maxHp = (self._playerGet):getMaxHp()
  local _hpRate = _hp / _maxHp * 100
  ;
  ((self._ui).txt_HealthPoint):SetText(tostring(_hp) .. " / " .. tostring(_maxHp))
  ;
  ((self._ui).progress_Health):SetProgressRate(_hpRate)
end

FromClient_CharacterInfo_Basic_MpChanged = function()
  -- function num : 0_13 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  local _mp = (self._playerGet):getMp()
  local _maxMp = (self._playerGet):getMaxMp()
  local _mpRate = _mp / _maxMp * 100
  ;
  ((self._ui).txt_MentalPoint):SetText(tostring(_mp) .. " / " .. tostring(_maxMp))
  ;
  ((self._ui).progress_Mental):SetProgressRate(_mpRate)
end

FromClient_CharacterInfo_Basic_WeightChanged = function()
  -- function num : 0_14 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
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
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R10 in 'UnsetPending'

  if s64_allWeight_div <= s64_maxWeight_div then
    (self._ui).progress_Weight = (UI.getChildControl)((self._ui).stc_StatInfoBg, "Progress2_Weight")
    ;
    ((self._ui).progress_Weight3):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_maxWeight_div))
    ;
    ((self._ui).progress_Weight2):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_maxWeight_div))
    ;
    ((self._ui).progress_Weight):SetProgressRate(Int64toInt32(s64_allWeight / s64_maxWeight_div))
  else
    ;
    ((self._ui).progress_Weight3):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_allWeight_div))
    ;
    ((self._ui).progress_Weight2):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_allWeight_div))
    ;
    ((self._ui).progress_Weight):SetProgressRate(Int64toInt32(s64_allWeight / s64_allWeight_div))
  end
  ;
  ((self._ui).txt_WeightPoint):SetText(tostring(str_AllWeight) .. " / " .. tostring(str_MaxWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end

FromClient_CharacterInfo_Basic_AttackChanged = function()
  -- function num : 0_15 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  ToClient_updateAttackStat()
  local _charAttack = ToClient_getOffence()
  ;
  ((self._ui).txt_AtkPoint):SetText(tostring(_charAttack))
  local _charAwakenAttack = ToClient_getAwakenOffence()
  ;
  ((self._ui).txt_AwakenAtkPoint):SetText(tostring(_charAwakenAttack))
  local _charDefence = ToClient_getDefence()
  ;
  ((self._ui).txt_DefPoint):SetText(tostring(_charDefence))
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).stc_StatBattleInfoBg = (UI.getChildControl)((self._ui).stc_CharacterInfoBg, "Static_Stat_Battle")
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).txt_AtkPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Atk_Val")
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).txt_AwakenAtkPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Atk_Awaken_Val")
  -- DECOMPILER ERROR at PC67: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).txt_DefPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Def_Val")
  -- DECOMPILER ERROR at PC75: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).txt_StaminaPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Stamina_Val")
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).txt_SKillPoint = (UI.getChildControl)((self._ui).stc_StatBattleInfoBg, "StaticText_Skill_Point")
end

FromClient_CharacterInfo_Basic_SkillPointChanged = function()
  -- function num : 0_16 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  local _skillPointInfo = ToClient_getSkillPointInfo(0)
  if _skillPointInfo ~= nil then
    ((self._ui).txt_SKillPoint):SetText(PAGetString(Defines.StringSheet_RESOURCE, "SKILL_TEXT_POINT") .. " " .. tostring(_skillPointInfo._remainPoint .. " / " .. _skillPointInfo._acquirePoint))
  end
end

FromClient_CharacterInfo_Basic_StaminaChanged = function()
  -- function num : 0_17 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  local _maxStamina = ((self._playerGet):getStamina()):getMaxSp()
  ;
  ((self._ui).txt_StaminaPoint):SetText(tostring(_maxStamina))
end

FromClient_CharacterInfo_Basic_PotentialChanged = function()
  -- function num : 0_18 , upvalues : CharacterInfo, _panel, Class_BattleSpeed
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  local levelText = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_POTENLEVEL")
  local classType = (self._player):getClassType()
  local _txt_PotentialDisplay = {[1] = (self._ui).txt_AtkSpeedLevel, [2] = (self._ui).txt_MoveSpeedLevel, [3] = (self._ui).txt_CriticalLevel, [4] = (self._ui).txt_FishingLevel, [5] = (self._ui).txt_GatherLevel, [6] = (self._ui).txt_LuckLevel}
  local _potentialData = {[1] = (self._player):characterStatPointSpeed((self.POTENTIAL_TYPE).ATTACKSPEED + Class_BattleSpeed[classType]) - 5, [2] = (self._player):characterStatPointSpeed((self.POTENTIAL_TYPE).MOVESPEED) - 5, [3] = (self._player):characterStatPointCritical(), [4] = (self._player):getCharacterStatPointFishing(), [5] = (self._player):getCharacterStatPointCollection(), [6] = (self._player):getCharacterStatPointDropItem()}
  for ii = 1, (self.POTENTIAL_TYPE).TOTALCOUNT do
    if (self._potentialUIData).limitPotentialLevel <= _potentialData[ii] then
      _potentialData[ii] = (self._potentialUIData).limitPotentialLevel
    end
    ;
    (_txt_PotentialDisplay[ii]):SetText(_potentialData[ii] .. " " .. levelText)
    for jj = 1, (self._potentialUIData).limitPotentialLevel do
      if jj <= _potentialData[ii] then
        ((((self._ui).stc_PotentialBar)[ii])[jj]):SetShow(true)
      else
        ;
        ((((self._ui).stc_PotentialBar)[ii])[jj]):SetShow(false)
      end
    end
  end
end

FromClient_CharacterInfo_Basic_TendencyChanged = function()
  -- function num : 0_19 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  local _style = (self._playerGet):getTendency()
  ;
  ((self._ui).txt_Style):SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_TENDENCY") .. " " .. tostring(_style))
end

FromClient_CharacterInfo_Basic_MentalChanged = function()
  -- function num : 0_20 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  local _mental = (self._player):getWp()
  local _maxMental = (self._player):getMaxWp()
  ;
  ((self._ui).txt_Enegy):SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_MENTAL") .. " " .. tostring(_mental) .. " / " .. tostring(_maxMental))
end

FromClient_CharacterInfo_Basic_ContributionChanged = function()
  -- function num : 0_21 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  local _territoryKeyRaw = ToClient_getDefaultTerritoryKey()
  local _contribution = ToClient_getExplorePointByTerritoryRaw(_territoryKeyRaw)
  local _remainContribution = _contribution:getRemainedPoint()
  local _aquiredContribution = _contribution:getAquiredPoint()
  ;
  ((self._ui).txt_Contribution):SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_CONTRIBUTION") .. " " .. tostring(_remainContribution) .. " / " .. tostring(_aquiredContribution))
end

FromClient_CharacterInfo_Basic_FitnessChanged = function(addSp, addWeight, addHp, addMp)
  -- function num : 0_22 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  if addSp > 0 then
    FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, (self._fitness).stamina)
  else
    if addWeight > 0 then
      FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, (self._fitness).strength)
    else
      if addHp > 0 or addMp > 0 then
        FGlobal_FitnessLevelUp(addSp, addWeight, addHp, addMp, (self._fitness).health)
      end
    end
  end
  local _txt_FitnessDisplay = {[1] = (self._ui).txt_BreathInfo, [2] = (self._ui).txt_PowerInfo, [3] = (self._ui).txt_HealthInfo}
  local _txt_FitnessLevelDisplay = {[1] = (self._ui).txt_BreathLevel, [2] = (self._ui).txt_PowerLevel, [3] = (self._ui).txt_HealthLevel}
  local _progressFitnessDisplay = {[1] = (self._ui).progress_Breath, [2] = (self._ui).progress_Power, [3] = (self._ui).progress_Health2}
  local _titleString = {}
  if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
    _titleString = {[1] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE")}
  else
    _titleString = {[1] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE_ONE"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE_ONE"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE_ONE")}
  end
  for ii = 1, 3 do
    local current = Int64toInt32((self._playerGet):getCurrFitnessExperiencePoint(ii - 1))
    local max = Int64toInt32((self._playerGet):getDemandFItnessExperiencePoint(ii - 1))
    local rate = current / max * 100
    local level = (self._playerGet):getFitnessLevel(ii - 1)
    ;
    (_progressFitnessDisplay[ii]):SetProgressRate(rate)
    ;
    (_txt_FitnessLevelDisplay[ii]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL") .. tostring(level))
    ;
    (_txt_FitnessDisplay[ii]):SetText(_titleString[ii] .. " " .. tostring(ToClient_GetFitnessLevelStatus(ii - 1)))
    if ii ~= (self._fitness).strength then
      if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
        (_txt_FitnessDisplay[ii]):SetText(_titleString[ii] .. " " .. tostring(ToClient_GetFitnessLevelStatus(ii - 1)))
      else
        ;
        (_txt_FitnessDisplay[ii]):SetText(_titleString[ii])
      end
    else
      if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() then
        (_txt_FitnessDisplay[ii]):SetText(_titleString[ii] .. " " .. tostring(ToClient_GetFitnessLevelStatus(ii - 1) / 10000))
      else
        ;
        (_txt_FitnessDisplay[ii]):SetText(_titleString[ii])
      end
    end
  end
end

FromClient_CharacterInfo_Basic_ResistChanged = function()
  -- function num : 0_23 , upvalues : CharacterInfo, _panel
  local self = CharacterInfo
  if _panel:IsShow() == false then
    return 
  end
  local _data = {sturn = (self._player):getStunResistance(), grab = (self._player):getCatchResistance(), knockDown = (self._player):getKnockdownResistance(), knockBack = (self._player):getKnockbackResistance()}
  local _dataDisplay = {[1] = _data.sturn, [2] = _data.grab, [3] = _data.knockDown, [4] = _data.knockBack}
  local _registTextDisplay = {[1] = (self._ui).txt_StunPoint, [2] = (self._ui).txt_GrabPoint, [3] = (self._ui).txt_KnockDownPoint, [4] = (self._ui).txt_KnockBackPoint}
  local _registProgressDisplay = {[1] = (self._ui).progress_Stun, [2] = (self._ui).progress_Grab, [3] = (self._ui).progress_KnockDown, [4] = (self._ui).progress_KnockBack}
  for ii = 1, 4 do
    (_registProgressDisplay[ii]):SetProgressRate((math.floor)(_dataDisplay[ii] / 10000))
    ;
    (_registTextDisplay[ii]):SetText((math.floor)(_dataDisplay[ii] / 10000) .. "%")
  end
end

CharacterInfo.registMessageHandler = function(self)
  -- function num : 0_24 , upvalues : _panel
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

PaGlobalFunc_Window_CharacterInfo_Open = function()
  -- function num : 0_25 , upvalues : CharacterInfo
  CharacterInfo:open()
end

CharacterInfo.open = function(self)
  -- function num : 0_26 , upvalues : _panel
  _panel:SetShow(true, true)
  self:update()
  InputMLUp_TapToOpenWindow(1)
end

PaGlobalFunc_Window_CharacterInfo_Close = function()
  -- function num : 0_27 , upvalues : CharacterInfo
  CharacterInfo:close()
end

PaGlobalFunc_Window_CharacterInfo_GetShow = function()
  -- function num : 0_28
  Panel_Window_CharacterInfo_Renew:GetShow()
end

PaGlobalFunc_Window_CharacterInfo_SaveUserIntroduction = function()
  -- function num : 0_29 , upvalues : CharacterInfo
  if CharacterInfo == nil then
    return 
  end
  self = CharacterInfo
  ToClient_RequestSetUserIntroduction(((self._ui).txt_Introduce):GetText())
end

CharacterInfo.close = function(self)
  -- function num : 0_30
  audioPostEvent_SystemUi(1, 1)
  Panel_Window_CharacterInfo_Renew:SetShow(false, false)
  ;
  (UI.ClearFocusEdit)()
  Panel_Window_CharacterInfo_Renew:CloseUISubApp()
  HelpMessageQuestion_Out()
  Panel_Tooltip_Item_hideTooltip()
end

PaGlobalFunc_CharacterInfo_CheckIntroduceUiEdit = function(targetUI)
  -- function num : 0_31 , upvalues : CharacterInfo
  do
    local self = CharacterInfo
    do return targetUI ~= nil and targetUI:GetKey() == ((self._ui).txt_Introduce):GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

PaGlobalFunc_CharacterInfo_ShowRightNextTab = function()
  -- function num : 0_32 , upvalues : CharacterInfo
  local self = CharacterInfo
  self:ShowNextTab(false)
end

PaGlobalFunc_CharacterInfo_ShowLeftNextTab = function()
  -- function num : 0_33 , upvalues : CharacterInfo
  local self = CharacterInfo
  self:ShowNextTab(true)
end

CharacterInfo.ShowNextTab = function(self, isLeft)
  -- function num : 0_34
  if isLeft == true then
    if self._currentPanelType > 1 then
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

PaGlobalFunc_CharacterInfo_ShowAni = function()
  -- function num : 0_35
end

PaGlobalFunc_CharacterInfo_HideAni = function()
  -- function num : 0_36
end

PaGlobalFunc_CharacterInfoTab_PadControl = function(index)
  -- function num : 0_37 , upvalues : CharacterInfo
  local self = CharacterInfo
  _PA_LOG("원선", "PaGlobalFunc_CharacterInfoTab_PadControl" .. index)
  if index == 0 then
    self:ShowNextTab(true)
  else
    self:ShowNextTab(false)
  end
end

CharacterInfo.XB_Contorl_Init = function(self)
  -- function num : 0_38 , upvalues : _panel
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "PaGlobalFunc_CharacterInfoTab_PadControl(0)")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "PaGlobalFunc_CharacterInfoTab_PadControl(1)")
  ;
  ((self._ui).stc_CharacterInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "InputMLUp_CharacterInfo_Edit_Introduce()")
  ;
  ((self._ui).stc_TitleInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "PaGlobalFunc_CharacterTitleInfoTab_PadControl(0)")
  ;
  ((self._ui).stc_TitleInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "PaGlobalFunc_CharacterTitleInfoTab_PadControl(1)")
  ;
  ((self._ui).stc_HistoryInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "InputMLUp_CharacterHistoryInfo_DecreaseMonth()")
  ;
  ((self._ui).stc_HistoryInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "InputMLUp_CharacterHistoryInfo_IncreaseMonth()")
  ;
  ((self._ui).stc_ChallengeInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "PaGlobalFunc_CharacterChallengeInfoTab_PadControl(0)")
  ;
  ((self._ui).stc_ChallengeInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "PaGlobalFunc_CharacterChallengeInfoTab_PadControl(1)")
  ;
  ((self._ui).stc_ProfileInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "PaGlobalFunc_CharacterProfileInfoTab_PadControl(0)")
  ;
  ((self._ui).stc_ProfileInfoBg):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "PaGlobalFunc_CharacterProfileInfoTab_PadControl(1)")
end


