-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_dialog_skillspecialize_renew.luac 

-- params : ...
-- function num : 0
local Panel_Dialog_SkillSpecialize_info = {_initialize = false, 
_ui = {static_Skill_Specialize1 = nil, staticText_Skill_Special_Title = nil, staticText_Skill_Awaken_Special_Title = nil, rbtn_ChangeSkill_Template = nil, static_Skill_Icon = nil, staticText_Skill = nil, staticText_Skill_Desc = nil, staticText_Skill_Effect = nil, staticText_Key_Guide = nil, button_ChangeEffect = nil, rbtn_ChangeNotyet_Template = nil, staticText_Level = nil, staticText_EnableSpecialize = nil, 
rbtn_List_ChangeSkill = {nil, nil, nil, nil, nil, nil}
, 
rbtn_List_ChangeNotyet = {nil, nil, nil, nil, nil, nil}
, 
rbtn_List = {nil, nil, nil, nil, nil, nil}
, staticText_Skill_Awaken_Special_Title = nil, static_Line = nil, static_Skill_Specialize2 = nil, static_Specialize_Img = nil, static_SelectedSkillIcon = nil, static_Content = nil, staticText_SkillBg = nil, staticText_NonSelect = nil, static_SkilllIcon = nil, staticText_SkillName = nil, staticText_SkillDesc = nil, staticText_EffectBg1 = nil, staticText_EffectBg2 = nil, list2_1_SelectSkill = nil, list2_2_SelectEffect1 = nil, static_BottomArea = nil, staticText_DoSpecialize = nil, staticText_Select = nil, staticText_Cancel = nil, btn_DoSpecialize = nil}
, 
_config = {isReinforceContentOpen = ToClient_IsContentsGroupOpen("203"), reinforceSkillCount = 3, reinforceSkillViewCount = 6}
, 
_value = {currentPage = 0, lastSpecializeIndex = nil, currentSpecializeIndex = nil, currnetReinforceIndex = nil, currentReinforceSkillNo = nil, currentStep = nil, currentSelectSkillIndex = nil, currentEffectIndex = nil, currentEffectIndex2 = nil}
, 
_pos = {page1StartPos1Y = 0, page1StartPos2Y = 0, page1SpaceY = 0, page2Pos1 = 0, page2Pos2 = 0, page2Pos3 = 0, page2Pos4 = 0, page2Pos5 = 0, page2SpaceY = 0}
, 
_enum = {eButtonStateAlready = 0, eButtonStateBase = 1, eButtonStateLock = 2, eStepBase = 0, eStepSelectSkill = 1, eStepSelectEffect1 = 2, eStepSelectEffect2 = 3}
, 
_text = {enableSp = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NORMAL_1"), enableAwakeSp = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_AWAKEN_1"), level = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV")}
, 
_fontcolor = {fontColor_NormalSkill = 4293640023, fontColor_AwakenSkill = 4280068804, fontColor_NormalLevel = 4293640023, fontColor_AwakenLevel = 4286636767, fontColor_Disable = 4287993237}
, 
_texture = {page1ButtonTexture = "Renewal/ETC/Console_ETC_Skill_00.dds", 
[1] = {x1 = 1, y1 = 153, x2 = 945, y2 = 227}
, 
[2] = {x1 = 1, y1 = 381, x2 = 945, y2 = 455}
}
, 
_skillList = {}
, 
_effectList = {}
}
local normalSkillreinforceableLv = {"52", "54"; [0] = "50"}
local awakenSkillreinforceableLv = {"58", "60"; [0] = "56"}
local result = {_awakenResult_BG = (UI.getChildControl)(Panel_SkillAwaken_ResultOption, "Static_AcquireBG"), _awakenTitle = (UI.getChildControl)(Panel_SkillAwaken_ResultOption, "StaticText_AwakenTitle"), _awakenOption = (UI.getChildControl)(Panel_SkillAwaken_ResultOption, "StaticText_AwakenOption")}
Panel_Dialog_SkillSpecialize_info.registerMessageHandler = function(self)
  -- function num : 0_0
end

Panel_Dialog_SkillSpecialize_info.registEventHandler = function(self)
  -- function num : 0_1
  Panel_Dialog_SkillSpecialize:RegisterShowEventFunc(true, "PaGlobalFunc_Dialog_SkillAwakenResult_ShowAni()")
  Panel_Dialog_SkillSpecialize:RegisterShowEventFunc(false, "PaGlobalFunc_Dialog_SkillAwakenResult_HideAni()")
  registerEvent("EventShowAwakenSkill", "FromClient_Dialog_SkillSpecialize_Show")
  registerEvent("FromClient_SuccessSkillAwaken", "FromClient_SuccessSkillSpecialize")
  registerEvent("FromClient_ChangeSkillAwakeningBitFlag", "FromClient_SuccessSkillSpecialize")
  registerEvent("FromClient_ChangeAwakenSkill", "FromClient_SuccessSkillSpecialize")
  Panel_Dialog_SkillSpecialize:RegisterUpdateFunc("SkillReinforceResult_Hide")
end

Panel_Dialog_SkillSpecialize_info.initialize = function(self)
  -- function num : 0_2
  self:childControl()
  self:registEventHandler()
  self:setDefaultPos()
  self:createControlPage1()
  self:setPosControlPage1()
end

Panel_Dialog_SkillSpecialize_info.initValue = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._value).currentPage = 0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).lastSpecializeIndex = nil
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).currentSpecializeIndex = nil
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).currnetReinforceIndex = nil
  self:initValuePage2()
end

Panel_Dialog_SkillSpecialize_info.initValuePage2 = function(self)
  -- function num : 0_4
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._value).currentReinforceSkillNo = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).currentReinforceSkillNo = nil
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).currentSelectSkillIndex = nil
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).currentEffectIndex = nil
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).currentEffectIndex2 = nil
end

Panel_Dialog_SkillSpecialize_info.childControl = function(self)
  -- function num : 0_5
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).static_Skill_Specialize1 = (UI.getChildControl)(Panel_Dialog_SkillSpecialize, "Static_Skill_Specialize1")
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Skill_Special_Title = (UI.getChildControl)((self._ui).static_Skill_Specialize1, "StaticText_Skill_Special_Title")
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Skill_Awaken_Special_Title = (UI.getChildControl)((self._ui).static_Skill_Specialize1, "StaticText_Skill_Awaken_Special_Title")
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).rbtn_ChangeSkill_Template = (UI.getChildControl)((self._ui).static_Skill_Specialize1, "Radiobutton_ChangeSkill_Template")
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Skill_Icon = (UI.getChildControl)((self._ui).rbtn_ChangeSkill_Template, "Static_Skill_Icon")
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Skill = (UI.getChildControl)((self._ui).rbtn_ChangeSkill_Template, "StaticText_Skill")
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Skill_Desc = (UI.getChildControl)((self._ui).rbtn_ChangeSkill_Template, "StaticText_Skill_Desc")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Skill_Effect = (UI.getChildControl)((self._ui).rbtn_ChangeSkill_Template, "StaticText_Skill_Effect")
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Key_Guide = (UI.getChildControl)((self._ui).rbtn_ChangeSkill_Template, "StaticText_Key_Guide")
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).button_ChangeEffect = (UI.getChildControl)((self._ui).rbtn_ChangeSkill_Template, "Button_ChangeEffect")
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).rbtn_ChangeNotyet_Template = (UI.getChildControl)((self._ui).static_Skill_Specialize1, "RadioButton_ChangeNotyet_Template")
  -- DECOMPILER ERROR at PC94: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Level = (UI.getChildControl)((self._ui).rbtn_ChangeNotyet_Template, "StaticText_Level")
  -- DECOMPILER ERROR at PC102: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_EnableSpecialize = (UI.getChildControl)((self._ui).rbtn_ChangeNotyet_Template, "StaticText_EnableSpecialize")
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Skill_Specialize2 = (UI.getChildControl)(Panel_Dialog_SkillSpecialize, "Static_Skill_Specialize2")
  -- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Specialize_Img = (UI.getChildControl)((self._ui).static_Skill_Specialize2, "Static_Specialize_Img")
  -- DECOMPILER ERROR at PC125: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_SelectedSkillIcon = (UI.getChildControl)((self._ui).static_Specialize_Img, "Static_SelectedSkillIcon")
  -- DECOMPILER ERROR at PC133: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Content = (UI.getChildControl)((self._ui).static_Skill_Specialize2, "Static_Content")
  -- DECOMPILER ERROR at PC141: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_SkillBg = (UI.getChildControl)((self._ui).static_Content, "StaticText_SkillBg")
  -- DECOMPILER ERROR at PC149: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_NonSelect = (UI.getChildControl)((self._ui).staticText_SkillBg, "StaticText_NonSelect")
  -- DECOMPILER ERROR at PC157: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_SkilllIcon = (UI.getChildControl)((self._ui).staticText_SkillBg, "Static_SkilllIcon")
  -- DECOMPILER ERROR at PC165: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_SkillName = (UI.getChildControl)((self._ui).staticText_SkillBg, "StaticText_SkillName")
  -- DECOMPILER ERROR at PC173: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_SkillDesc = (UI.getChildControl)((self._ui).staticText_SkillBg, "StaticText_SkillDesc")
  -- DECOMPILER ERROR at PC181: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_1_SelectSkill = (UI.getChildControl)((self._ui).static_Content, "List2_1_SelectSkill")
  ;
  ((self._ui).list2_1_SelectSkill):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_Dialog_SkillSpecialize_Page2SkillListCreate")
  ;
  ((self._ui).list2_1_SelectSkill):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  -- DECOMPILER ERROR at PC204: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_2_SelectEffect1 = (UI.getChildControl)((self._ui).static_Content, "List2_2_SelectEffect1")
  ;
  ((self._ui).list2_2_SelectEffect1):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_Dialog_SkillSpecialize_Page2EffectListCreate")
  ;
  ((self._ui).list2_2_SelectEffect1):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  -- DECOMPILER ERROR at PC227: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_EffectBg1 = (UI.getChildControl)((self._ui).static_Content, "StaticText_EffectBg1")
  -- DECOMPILER ERROR at PC235: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_EffectBg2 = (UI.getChildControl)((self._ui).static_Content, "StaticText_EffectBg2")
  -- DECOMPILER ERROR at PC242: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_BottomArea = (UI.getChildControl)(Panel_Dialog_SkillSpecialize, "Static_BottomArea")
  -- DECOMPILER ERROR at PC250: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_DoSpecialize = (UI.getChildControl)((self._ui).static_BottomArea, "StaticText_DoSpecialize")
  -- DECOMPILER ERROR at PC258: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Select = (UI.getChildControl)((self._ui).static_BottomArea, "StaticText_Select")
  -- DECOMPILER ERROR at PC266: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Cancel = (UI.getChildControl)((self._ui).static_BottomArea, "StaticText_Cancel")
end

Panel_Dialog_SkillSpecialize_info.setDefaultPos = function(self)
  -- function num : 0_6
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  (self._pos).page1StartPos1Y = ((self._ui).staticText_Skill_Special_Title):GetPosY() + ((self._ui).staticText_Skill_Special_Title):GetSizeY() + 10
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._pos).page1StartPos2Y = ((self._ui).staticText_Skill_Awaken_Special_Title):GetPosY() + ((self._ui).staticText_Skill_Awaken_Special_Title):GetSizeY() + 10
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._pos).page1SpaceY = ((self._ui).rbtn_ChangeSkill_Template):GetSizeY()
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._pos).page2SpaceY = ((self._ui).staticText_EffectBg1):GetSizeY()
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._pos).page2Pos1 = ((self._ui).staticText_SkillBg):GetPosY()
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._pos).page2Pos2 = (self._pos).page2Pos1 + (self._pos).page2SpaceY + 4
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._pos).page2Pos3 = (self._pos).page2Pos2 + (self._pos).page2SpaceY + 4
  -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._pos).page2Pos4 = (self._pos).page2Pos3 + (self._pos).page2SpaceY + 4
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._pos).page2Pos5 = ((self._ui).staticText_EffectBg1):GetPosY()
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._pos).page2Pos6 = ((self._ui).staticText_EffectBg2):GetPosY()
end

Panel_Dialog_SkillSpecialize_info.createControlPage1 = function(self)
  -- function num : 0_7
  for index = 0, (self._config).reinforceSkillViewCount - 1 do
    local rbtn_ChangeSkill = {}
    rbtn_ChangeSkill.state = (self._enum).eButtonStateAlready
    rbtn_ChangeSkill.reinforceIndex = nil
    rbtn_ChangeSkill.radiobutton = (UI.createAndCopyBasePropertyControl)((self._ui).static_Skill_Specialize1, "Radiobutton_ChangeSkill_Template", (self._ui).static_Skill_Specialize1, "Radiobutton_ChangeSkill_" .. index)
    rbtn_ChangeSkill.static_Icon = (UI.createAndCopyBasePropertyControl)((self._ui).rbtn_ChangeSkill_Template, "Static_Skill_Icon", rbtn_ChangeSkill.radiobutton, "Static_Skill_Icon_" .. index)
    rbtn_ChangeSkill.staticText_Skill = (UI.createAndCopyBasePropertyControl)((self._ui).rbtn_ChangeSkill_Template, "StaticText_Skill", rbtn_ChangeSkill.radiobutton, "StaticText_Skill_" .. index)
    rbtn_ChangeSkill.staticText_Skill_Desc = (UI.createAndCopyBasePropertyControl)((self._ui).rbtn_ChangeSkill_Template, "StaticText_Skill_Desc", rbtn_ChangeSkill.radiobutton, "StaticText_Skill_Desc_" .. index)
    rbtn_ChangeSkill.staticText_Skill_Effect = (UI.createAndCopyBasePropertyControl)((self._ui).rbtn_ChangeSkill_Template, "StaticText_Skill_Effect", rbtn_ChangeSkill.radiobutton, "StaticText_Skill_Effect_" .. index)
    rbtn_ChangeSkill.staticText_Key_Guide = (UI.createAndCopyBasePropertyControl)((self._ui).rbtn_ChangeSkill_Template, "StaticText_Key_Guide", rbtn_ChangeSkill.radiobutton, "StaticText_Key_Guide_" .. index)
    rbtn_ChangeSkill.button_ChangeEffect = (UI.createAndCopyBasePropertyControl)((self._ui).rbtn_ChangeSkill_Template, "Button_ChangeEffect", rbtn_ChangeSkill.radiobutton, "Button_ChangeEffect_" .. index)
    -- DECOMPILER ERROR at PC91: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui).rbtn_List_ChangeSkill)[index] = rbtn_ChangeSkill
  end
  for index = 0, (self._config).reinforceSkillViewCount - 1 do
    local rbtn_ChangeNotyet = {}
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R6 in 'UnsetPending'

    rbtn_ChangeSkill.state = (self._enum).eButtonStateBase
    -- DECOMPILER ERROR at PC105: Confused about usage of register: R6 in 'UnsetPending'

    rbtn_ChangeSkill.reinforceIndex = nil
    rbtn_ChangeNotyet.radiobutton = (UI.createAndCopyBasePropertyControl)((self._ui).static_Skill_Specialize1, "RadioButton_ChangeNotyet_Template", (self._ui).static_Skill_Specialize1, "RadioButton_ChangeNotyet_" .. index)
    rbtn_ChangeNotyet.staticText_Level = (UI.createAndCopyBasePropertyControl)((self._ui).rbtn_ChangeNotyet_Template, "StaticText_Level", rbtn_ChangeNotyet.radiobutton, "StaticText_Level_" .. index)
    rbtn_ChangeNotyet.staticText_EnableSpecialize = (UI.createAndCopyBasePropertyControl)((self._ui).rbtn_ChangeNotyet_Template, "StaticText_EnableSpecialize", rbtn_ChangeNotyet.radiobutton, "StaticText_EnableSpecialize_" .. index)
    -- DECOMPILER ERROR at PC142: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui).rbtn_List_ChangeNotyet)[index] = rbtn_ChangeNotyet
  end
end

Panel_Dialog_SkillSpecialize_info.setPosControlPage1 = function(self)
  -- function num : 0_8
  for index = 0, (self._config).reinforceSkillViewCount - 1 do
    if index < (self._config).reinforceSkillCount then
      ((((self._ui).rbtn_List_ChangeSkill)[index]).radiobutton):SetPosY((self._pos).page1StartPos1Y + index * (self._pos).page1SpaceY)
      ;
      ((((self._ui).rbtn_List_ChangeNotyet)[index]).radiobutton):SetPosY((self._pos).page1StartPos1Y + index * (self._pos).page1SpaceY)
    else
      ;
      ((((self._ui).rbtn_List_ChangeSkill)[index]).radiobutton):SetPosY((self._pos).page1StartPos2Y + (index - (self._config).reinforceSkillCount) * (self._pos).page1SpaceY)
      ;
      ((((self._ui).rbtn_List_ChangeNotyet)[index]).radiobutton):SetPosY((self._pos).page1StartPos2Y + (index - (self._config).reinforceSkillCount) * (self._pos).page1SpaceY)
    end
  end
end

Panel_Dialog_SkillSpecialize_info.open = function(self, showAni)
  -- function num : 0_9
  if showAni == nil then
    Panel_Dialog_SkillSpecialize:SetShow(true, true)
    return 
  else
    Panel_Dialog_SkillSpecialize:SetShow(true, showAni)
  end
end

Panel_Dialog_SkillSpecialize_info.close = function(self, showAni)
  -- function num : 0_10
  if showAni == nil then
    Panel_Dialog_SkillSpecialize:SetShow(false, true)
    return 
  else
    Panel_Dialog_SkillSpecialize:SetShow(false, showAni)
  end
end

Panel_Dialog_SkillSpecialize_info.resize = function(self)
  -- function num : 0_11
  Panel_Dialog_SkillSpecialize:ComputePos()
end

Panel_Dialog_SkillSpecialize_info.preOpen = function(self)
  -- function num : 0_12
  self:initValue()
  self:resize()
end

Panel_Dialog_SkillSpecialize_info.setContent = function(self)
  -- function num : 0_13
  if (self._value).currentPage == 0 then
    self:clearContentPage1()
    self:setContentPage1()
  else
    self:clearContentPage2()
    self:setContentPage2((self._value).currentStep)
  end
  self:showPage()
end

Panel_Dialog_SkillSpecialize_info.showPage = function(self)
  -- function num : 0_14
  local currentPage = (self._value).currentPage
  if currentPage == 0 then
    ((self._ui).static_Skill_Specialize1):SetShow(true)
    ;
    ((self._ui).static_Skill_Specialize2):SetShow(false)
  else
    ;
    ((self._ui).static_Skill_Specialize1):SetShow(false)
    ;
    ((self._ui).static_Skill_Specialize2):SetShow(true)
  end
end

Panel_Dialog_SkillSpecialize_info.clearContentPage1 = function(self)
  -- function num : 0_15
  for index = 0, (self._config).reinforceSkillViewCount - 1 do
    ((((self._ui).rbtn_List_ChangeSkill)[index]).radiobutton):SetShow(false)
    ;
    ((((self._ui).rbtn_List_ChangeSkill)[index]).radiobutton):SetCheck(false)
    ;
    ((((self._ui).rbtn_List_ChangeSkill)[index]).button_ChangeEffect):SetShow(false)
    ;
    ((((self._ui).rbtn_List_ChangeSkill)[index]).staticText_Key_Guide):SetShow(false)
    ;
    ((((self._ui).rbtn_List_ChangeNotyet)[index]).radiobutton):SetShow(false)
    ;
    ((((self._ui).rbtn_List_ChangeNotyet)[index]).radiobutton):SetCheck(false)
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (((self._ui).rbtn_List_ChangeSkill)[index]).reinforceIndex = nil
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (((self._ui).rbtn_List_ChangeNotyet)[index]).reinforceIndex = nil
  end
  self:initValue()
end

Panel_Dialog_SkillSpecialize_info.setContentPage1 = function(self)
  -- function num : 0_16 , upvalues : normalSkillreinforceableLv, awakenSkillreinforceableLv
  local selfPlayLevel = ((getSelfPlayer()):get()):getLevel()
  local reinforcableSkillCount = 0
  if selfPlayLevel < 50 then
    reinforcableSkillCount = 0
  else
    if selfPlayLevel < 52 then
      reinforcableSkillCount = 1
    else
      if selfPlayLevel < 54 then
        reinforcableSkillCount = 2
      else
        if selfPlayLevel < 56 then
          reinforcableSkillCount = 3
        else
          if selfPlayLevel < 58 then
            reinforcableSkillCount = 4
          else
            if selfPlayLevel < 60 then
              reinforcableSkillCount = 5
            else
              reinforcableSkillCount = 6
            end
          end
        end
      end
    end
  end
  local normalSkill_ReinforceCount = ToClient_GetSkillAwakeningCount()
  local awakenSkill_ReinforceCount = ToClient_GetWeaponSkillAwakeningCount()
  local reinforcedSkillcount = ToClient_GetReAwakeningListCount()
  local totalReinforceCount = 0
  local currnetReinforceCount = 0
  for index = 0, (self._config).reinforceSkillCount - 1 do
    local control = nil
    if index < normalSkill_ReinforceCount then
      control = ((self._ui).rbtn_List_ChangeSkill)[index]
      control.state = (self._enum).eButtonStateAlready
      self:setSkillButtonData(index, control)
      currnetReinforceCount = currnetReinforceCount + 1
      totalReinforceCount = totalReinforceCount + 1
    else
      control = ((self._ui).rbtn_List_ChangeNotyet)[index]
      ;
      (control.staticText_Level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. normalSkillreinforceableLv[index])
      if totalReinforceCount == reinforcableSkillCount then
        control.state = (self._enum).eButtonStateLock
        ;
        (control.radiobutton):SetEnable(false)
        ;
        (control.staticText_EnableSpecialize):SetShow(false)
        self:changeTexturePage1Button(control.radiobutton, (self._enum).eButtonStateLock)
      else
        control.state = (self._enum).eButtonStateBase
        ;
        (control.radiobutton):SetEnable(true)
        ;
        (control.staticText_EnableSpecialize):SetShow(true)
        ;
        (control.staticText_EnableSpecialize):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NORMAL_1"))
        self:changeTexturePage1Button(control.radiobutton, (self._enum).eButtonStateBase)
        totalReinforceCount = totalReinforceCount + 1
      end
    end
    -- DECOMPILER ERROR at PC123: Confused about usage of register: R13 in 'UnsetPending'

    ;
    ((self._ui).rbtn_List)[index] = control
    ;
    ((((self._ui).rbtn_List)[index]).radiobutton):SetShow(true)
    ;
    ((((self._ui).rbtn_List)[index]).radiobutton):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_Page1_ClickSkillButton(" .. index .. ")")
  end
  for index = (self._config).reinforceSkillCount, (self._config).reinforceSkillViewCount - 1 do
    local control = nil
    if index - 3 < awakenSkill_ReinforceCount then
      control = ((self._ui).rbtn_List_ChangeSkill)[index]
      control.state = (self._enum).eButtonStateAlready
      self:setSkillButtonData(index, control)
      currnetReinforceCount = currnetReinforceCount + 1
      totalReinforceCount = totalReinforceCount + 1
    else
      control = ((self._ui).rbtn_List_ChangeNotyet)[index]
      ;
      (control.staticText_Level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. awakenSkillreinforceableLv[index - 3])
      if totalReinforceCount == reinforcableSkillCount then
        control.state = (self._enum).eButtonStateLock
        ;
        (control.radiobutton):SetEnable(false)
        ;
        (control.staticText_EnableSpecialize):SetShow(false)
        self:changeTexturePage1Button(control.radiobutton, (self._enum).eButtonStateLock)
      else
        control.state = (self._enum).eButtonStateBase
        ;
        (control.radiobutton):SetEnable(true)
        ;
        (control.staticText_EnableSpecialize):SetShow(true)
        ;
        (control.staticText_EnableSpecialize):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_AWAKEN_1"))
        self:changeTexturePage1Button(control.radiobutton, (self._enum).eButtonStateBase)
        totalReinforceCount = totalReinforceCount + 1
      end
    end
    -- DECOMPILER ERROR at PC229: Confused about usage of register: R13 in 'UnsetPending'

    ;
    ((self._ui).rbtn_List)[index] = control
    ;
    ((((self._ui).rbtn_List)[index]).radiobutton):SetShow(true)
    ;
    ((((self._ui).rbtn_List)[index]).radiobutton):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_Page1_ClickSkillButton(" .. index .. ")")
  end
  ;
  ((self._ui).staticText_DoSpecialize):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_ChangeSkill()")
  ;
  ((self._ui).staticText_Select):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_ChangeEffect()")
  ;
  ((self._ui).staticText_Cancel):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_Exit()")
  if (self._value).currentSpecializeIndex ~= nil then
    PaGlobalFunc_Dialog_SkillSpecialize_Page1_ClickSkillButton((self._value).currentSpecializeIndex)
  end
end

Panel_Dialog_SkillSpecialize_info.setSkillButtonData = function(self, buttonIndex, control)
  -- function num : 0_17
  local _type = self:getSkillAwakeningType(buttonIndex)
  if control == nil then
    return 
  end
  local thisIndex = buttonIndex - _type * 3
  local normalSkill_ReinforceIndex = 0
  local awakenSkill_ReinforceIndex = 0
  local reinforceIndex = 0
  local reinforcedSkillcount = ToClient_GetReAwakeningListCount()
  for index = 0, reinforcedSkillcount - 1 do
    local skillSSW = ToClient_GetReAwakeningListAt(index)
    if skillSSW ~= nil then
      if skillSSW:getSkillAwakeningType() == 0 then
        if _type == 0 and thisIndex == normalSkill_ReinforceIndex then
          reinforceIndex = index
        end
        normalSkill_ReinforceIndex = normalSkill_ReinforceIndex + 1
      else
        if _type == 1 and thisIndex == awakenSkill_ReinforceIndex then
          reinforceIndex = index
        end
        awakenSkill_ReinforceIndex = awakenSkill_ReinforceIndex + 1
      end
    end
  end
  local skillSSW = ToClient_GetReAwakeningListAt(reinforceIndex)
  if skillSSW == nil then
    return 
  end
  control.reinforceIndex = reinforceIndex
  local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
  ;
  (control.staticText_Skill):SetText(skillSSW:getName())
  ;
  (control.staticText_Skill_Desc):SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
  ;
  (control.staticText_Skill_Desc):setLineCountByLimitAutoWrap(2)
  ;
  (control.staticText_Skill_Desc):SetText(skillTypeSSW:getDescription())
  local skillNo = skillSSW:getSkillNo()
  local optionCount = ToClient_GetAwakeningAbilityCount(skillNo)
  local skillEffectText = ""
  for index = 0, optionCount - 1 do
    local optionIndex = ToClient_GetAwakeningAbilityIndex(skillNo, index)
    skillEffectText = skillEffectText .. skillSSW:getSkillAwakenDescription(optionIndex)
    if index ~= optionCount - 1 then
      skillEffectText = skillEffectText .. "\n"
    end
  end
  ;
  (control.staticText_Skill_Effect):SetText(skillEffectText)
  ;
  (control.static_Icon):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
  local x1, y1, x2, y2 = setTextureUV_Func(control.static_Icon, 0, 0, 44, 44)
  ;
  ((control.static_Icon):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (control.static_Icon):setRenderTexture((control.static_Icon):getBaseTexture())
end

Panel_Dialog_SkillSpecialize_info.clearContentPage2 = function(self)
  -- function num : 0_18
  self:initValuePage2()
end

Panel_Dialog_SkillSpecialize_info.setContentPage2 = function(self, step)
  -- function num : 0_19
  if (self._value).currentReinforceSkillNo == nil then
    local ReinforceIndex = (((self._ui).rbtn_List)[(self._value).currentSpecializeIndex]).reinforceIndex
    local skillSSW = ToClient_GetReAwakeningListAt(ReinforceIndex)
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R4 in 'UnsetPending'

    if skillSSW ~= nil then
      (self._value).currentReinforceSkillNo = skillSSW:getSkillNo()
    end
  end
  do
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._value).currentStep = step
    if (self._value).currentStep == (self._enum).eStepBase then
      self:setPage2_0Step()
    else
      if (self._value).currentStep == (self._enum).eStepSelectSkill then
        self:setPage2_1Step((self._value).currentReinforceSkillNo)
      else
        if (self._value).currentStep == (self._enum).eStepSelectEffect1 then
          self:setPage2_2Step((self._value).currentReinforceSkillNo)
        else
          if (self._value).currentStep == (self._enum).eStepSelectEffect2 then
            self:setPage2_3Step((self._value).currentReinforceSkillNo)
          end
        end
      end
    end
    ;
    ((self._ui).staticText_DoSpecialize):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_Doit()")
    ;
    ((self._ui).staticText_Select):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_GoNextStepPage2()")
    ;
    ((self._ui).staticText_Cancel):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_GoBackStepPage2()")
  end
end

Panel_Dialog_SkillSpecialize_info.setPage2_0Step = function(self, skillNo)
  -- function num : 0_20
  self:setPage2SelectedSkill(skillNo)
  ;
  ((self._ui).list2_1_SelectSkill):SetShow(true)
  ;
  ((self._ui).list2_2_SelectEffect1):SetShow(false)
  ;
  ((self._ui).list2_1_SelectSkill):SetPosY((self._pos).page2Pos2)
  ;
  (((self._ui).list2_1_SelectSkill):getElementManager()):clearKey()
  for k in pairs(self._skillList) do
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R6 in 'UnsetPending'

    (self._skillList)[k] = nil
  end
  local _type = self:getSkillAwakeningType((self._value).currentSpecializeIndex)
  local count = PaGlobalFunc_Dialog_SkillSpecialize_Reinforcable_SkillCount(_type)
  if count == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NOSKILL"))
  end
  for key = 0, count - 1 do
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R8 in 'UnsetPending'

    (self._skillList)[key] = key
    ;
    (((self._ui).list2_1_SelectSkill):getElementManager()):pushKey(toInt64(0, (self._skillList)[key]))
    ;
    ((self._ui).list2_1_SelectSkill):requestUpdateByKey(toInt64(0, (self._skillList)[key]))
  end
  local text = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTOPTION")
  ;
  ((self._ui).staticText_EffectBg1):SetText(text)
  ;
  ((self._ui).staticText_EffectBg2):SetText(text)
  ;
  ((self._ui).staticText_EffectBg1):SetPosY((self._pos).page2Pos5)
  ;
  ((self._ui).staticText_EffectBg2):SetPosY((self._pos).page2Pos6)
end

Panel_Dialog_SkillSpecialize_info.setPage2_1Step = function(self, skillNo)
  -- function num : 0_21
  self:setPage2SelectedSkill(skillNo)
  ;
  ((self._ui).list2_1_SelectSkill):SetShow(false)
  ;
  ((self._ui).list2_2_SelectEffect1):SetShow(true)
  ;
  ((self._ui).list2_2_SelectEffect1):SetPosY((self._pos).page2Pos3)
  local text = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTOPTION")
  ;
  ((self._ui).staticText_EffectBg1):SetText(text)
  ;
  ((self._ui).staticText_EffectBg2):SetText(text)
  ;
  ((self._ui).staticText_EffectBg1):SetPosY((self._pos).page2Pos2)
  ;
  ((self._ui).staticText_EffectBg2):SetPosY((self._pos).page2Pos6)
  ;
  (((self._ui).list2_2_SelectEffect1):getElementManager()):clearKey()
  for k in pairs(self._effectList) do
    -- DECOMPILER ERROR at PC57: Confused about usage of register: R7 in 'UnsetPending'

    (self._effectList)[k] = nil
  end
  local skillSSW = getSkillStaticStatus((self._value).currentReinforceSkillNo, 1)
  local activeSkillSS = skillSSW:getActiveSkillStatus()
  if activeSkillSS ~= nil then
    local optionCount = activeSkillSS:getSkillAwakenInfoCount()
    for key = 0, optionCount - 1 do
      -- DECOMPILER ERROR at PC76: Confused about usage of register: R10 in 'UnsetPending'

      (self._effectList)[key] = key
      ;
      (((self._ui).list2_2_SelectEffect1):getElementManager()):pushKey(toInt64(0, (self._effectList)[key]))
      ;
      ((self._ui).list2_2_SelectEffect1):requestUpdateByKey(toInt64(0, (self._effectList)[key]))
    end
  end
end

Panel_Dialog_SkillSpecialize_info.setPage2_2Step = function(self, skillNo)
  -- function num : 0_22
  self:setPage2SelectedSkill(skillNo)
  ;
  ((self._ui).list2_1_SelectSkill):SetShow(false)
  ;
  ((self._ui).list2_2_SelectEffect1):SetShow(true)
  ;
  ((self._ui).list2_2_SelectEffect1):SetPosY((self._pos).page2Pos4)
  local text = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTOPTION")
  ;
  ((self._ui).staticText_EffectBg2):SetText(text)
  ;
  ((self._ui).staticText_EffectBg1):SetPosY((self._pos).page2Pos2)
  ;
  ((self._ui).staticText_EffectBg2):SetPosY((self._pos).page2Pos3)
  ;
  (((self._ui).list2_2_SelectEffect1):getElementManager()):clearKey()
  for k in pairs(self._effectList) do
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R7 in 'UnsetPending'

    (self._effectList)[k] = nil
  end
  local skillSSW = getSkillStaticStatus((self._value).currentReinforceSkillNo, 1)
  local activeSkillSS = skillSSW:getActiveSkillStatus()
  if activeSkillSS ~= nil then
    local optionCount = activeSkillSS:getSkillAwakenInfoCount()
    for key = 0, optionCount - 1 do
      -- DECOMPILER ERROR at PC79: Confused about usage of register: R10 in 'UnsetPending'

      if (self._value).currentEffectIndex ~= nil and (self._value).currentEffectIndex ~= key then
        (self._effectList)[key] = key
        ;
        (((self._ui).list2_2_SelectEffect1):getElementManager()):pushKey(toInt64(0, (self._effectList)[key]))
        ;
        ((self._ui).list2_2_SelectEffect1):requestUpdateByKey(toInt64(0, (self._effectList)[key]))
      end
    end
  end
  do
    ;
    ((self._ui).staticText_EffectBg1):SetText(tostring(activeSkillSS:getSkillAwakenDescription((self._value).currentEffectIndex)))
  end
end

Panel_Dialog_SkillSpecialize_info.setPage2_3Step = function(self, skillNo)
  -- function num : 0_23
  self:setPage2SelectedSkill(skillNo)
  ;
  ((self._ui).list2_1_SelectSkill):SetShow(false)
  ;
  ((self._ui).list2_2_SelectEffect1):SetShow(false)
  ;
  ((self._ui).staticText_EffectBg1):SetPosY((self._pos).page2Pos2)
  ;
  ((self._ui).staticText_EffectBg2):SetPosY((self._pos).page2Pos3)
  local skillSSW = getSkillStaticStatus((self._value).currentReinforceSkillNo, 1)
  local activeSkillSS = skillSSW:getActiveSkillStatus()
  ;
  ((self._ui).staticText_EffectBg1):SetText(tostring(activeSkillSS:getSkillAwakenDescription((self._value).currentEffectIndex)))
  ;
  ((self._ui).staticText_EffectBg2):SetText(tostring(activeSkillSS:getSkillAwakenDescription((self._value).currentEffectIndex2)))
end

Panel_Dialog_SkillSpecialize_info.goPage1 = function(self)
  -- function num : 0_24
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (self._value).currentPage = 0
  self:initValuePage2()
  self:setContent()
end

Panel_Dialog_SkillSpecialize_info.setPage2SelectedSkill = function(self, skillNo)
  -- function num : 0_25
  if skillNo == nil then
    ((self._ui).staticText_NonSelect):SetShow(true)
    ;
    ((self._ui).staticText_NonSelect):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSKILL_2"))
    ;
    ((self._ui).static_SelectedSkillIcon):SetShow(false)
    ;
    ((self._ui).static_SkilllIcon):SetShow(false)
    ;
    ((self._ui).staticText_SkillName):SetShow(false)
    ;
    ((self._ui).staticText_SkillDesc):SetShow(false)
  else
    ;
    ((self._ui).static_SkilllIcon):SetShow(true)
    ;
    ((self._ui).static_SelectedSkillIcon):SetShow(true)
    ;
    ((self._ui).staticText_SkillName):SetShow(true)
    ;
    ((self._ui).staticText_SkillDesc):SetShow(true)
    ;
    ((self._ui).staticText_NonSelect):SetShow(false)
    local skillSSW = getSkillStaticStatus(skillNo, 1)
    if skillSSW == nil then
      return 
    end
    local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
    ;
    ((self._ui).staticText_SkillName):SetText(skillSSW:getName())
    ;
    ((self._ui).staticText_SkillDesc):SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
    ;
    ((self._ui).staticText_SkillDesc):setLineCountByLimitAutoWrap(1)
    ;
    ((self._ui).staticText_SkillDesc):SetText(skillTypeSSW:getDescription())
    ;
    ((self._ui).static_SkilllIcon):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
    local x1, y1, x2, y2 = setTextureUV_Func((self._ui).static_SkilllIcon, 0, 0, 44, 44)
    ;
    (((self._ui).static_SkilllIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    ((self._ui).static_SkilllIcon):setRenderTexture(((self._ui).static_SkilllIcon):getBaseTexture())
    Panel_SkillTooltip_SetPosition(skillNo, (self._ui).static_SelectedSkillIcon, "SkillAwaken")
    ;
    ((self._ui).static_SelectedSkillIcon):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
    local x1, y1, x2, y2 = setTextureUV_Func((self._ui).static_SelectedSkillIcon, 0, 0, 44, 44)
    ;
    (((self._ui).static_SelectedSkillIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    ((self._ui).static_SelectedSkillIcon):setRenderTexture(((self._ui).static_SelectedSkillIcon):getBaseTexture())
    ;
    ((self._ui).static_SelectedSkillIcon):addInputEvent("Mouse_On", "Panel_SkillTooltip_Show(" .. skillNo .. ", false, \"SkillAwaken\")")
    ;
    ((self._ui).static_SelectedSkillIcon):addInputEvent("Mouse_Out", "Panel_SkillTooltip_Hide()")
  end
end

Panel_Dialog_SkillSpecialize_info.goPage2 = function(self, step)
  -- function num : 0_26
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  if step == nil then
    (self._value).currentStep = (self._enum).eStepBase
  else
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

    if step <= (self._enum).eStepSelectEffect2 and (self._enum).eStepBase <= step then
      (self._value).currentStep = step
    end
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).currentPage = 1
  self:setContent()
end

Panel_Dialog_SkillSpecialize_info.changeTexturePage1Button = function(self, button, _type)
  -- function num : 0_27
  local IconType = (self._texture)[_type]
  button:ChangeTextureInfoName((self._texture).page1ButtonTexture)
  local x1, y1, x2, y2 = setTextureUV_Func(button, IconType.x1, IconType.y1, IconType.x2, IconType.y2)
  ;
  (button:getBaseTexture()):setUV(x1, y1, x2, y2)
  button:setRenderTexture(button:getBaseTexture())
end

Panel_Dialog_SkillSpecialize_info.getSkillAwakeningType = function(self, buttonIndex)
  -- function num : 0_28
  local _type = 0
  if buttonIndex >= 3 then
    _type = 1
  end
  return _type
end

PaGlobalFunc_Dialog_SkillAwakenResult_ShowAni = function()
  -- function num : 0_29
  Panel_Dialog_SkillSpecialize:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Dialog_SkillSpecialize, 0, 0.3)
end

PaGlobalFunc_Dialog_SkillAwakenResult_HideAni = function()
  -- function num : 0_30
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_Dialog_SkillSpecialize, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

PaGlobalFunc_Dialog_SkillSpecialize_Open = function(showAni)
  -- function num : 0_31
end

PaGlobalFunc_Dialog_SkillSpecialize_Close = function(showAni)
  -- function num : 0_32
  Panel_Dialog_SkillSpecialize:SetShow(false, showAni)
end

PaGlobalFunc_Dialog_SkillSpecialize_GetShow = function()
  -- function num : 0_33
  return Panel_Dialog_SkillSpecialize:GetShow()
end

PaGlobalFunc_Dialog_SkillSpecialize_Exit = function()
  -- function num : 0_34
  if PaGlobalFunc_Dialog_SkillSpecialize_GetShow() == true then
    PaGlobalFunc_Dialog_SkillSpecialize_Close(true)
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_Page1_ClickSkillButton = function(buttonIndex)
  -- function num : 0_35 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  if (self._value).currentSpecializeIndex == buttonIndex then
    return 
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).lastSpecializeIndex = (self._value).currentSpecializeIndex
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).currentSpecializeIndex = buttonIndex
  if (self._value).lastSpecializeIndex ~= nil then
    ((((self._ui).rbtn_List)[(self._value).lastSpecializeIndex]).radiobutton):SetCheck(false)
  end
  if (self._value).currentSpecializeIndex ~= nil then
    ((((self._ui).rbtn_List)[(self._value).currentSpecializeIndex]).radiobutton):SetCheck(true)
  end
  if (self._enum).eButtonStateAlready == (((self._ui).rbtn_List)[(self._value).currentSpecializeIndex]).state then
    ((((self._ui).rbtn_List)[(self._value).currentSpecializeIndex]).staticText_Key_Guide):SetShow(true)
  end
  if (self._value).lastSpecializeIndex ~= nil and (((self._ui).rbtn_List)[(self._value).lastSpecializeIndex]).staticText_Key_Guide ~= nil then
    ((((self._ui).rbtn_List)[(self._value).lastSpecializeIndex]).staticText_Key_Guide):SetShow(false)
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_ChangeSkill = function()
  -- function num : 0_36 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  if (self._value).currentSpecializeIndex == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NOSKILL"))
    return 
  end
  local control = ((self._ui).rbtn_List)[(self._value).currentSpecializeIndex]
  if control.reinforceIndex ~= nil then
    local skillSSW = ToClient_GetReAwakeningListAt(control.reinforceIndex)
    local skillNo = skillSSW:getSkillNo()
    if skillNo ~= nil then
      local selfPlayer = getSelfPlayer()
      if selfPlayer == nil then
        return 
      end
      local applyAwakenSkillReset = (selfPlayer:get()):isApplyChargeSkill((CppEnums.UserChargeType).eUserChargeType_UnlimitedSkillAwakening)
      local inventory = (selfPlayer:get()):getInventory()
      local hasMemoryFlag = inventory:getItemCount_s64(ItemEnchantKey(44195, 0))
      if toInt64(0, 0) == hasMemoryFlag and not applyAwakenSkillReset then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SKILL_REINFORCE_NEEDITEM"))
        return 
      end
    end
    do
      do
        -- DECOMPILER ERROR at PC68: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (self._value).currnetReinforceIndex = control.reinforceIndex
        local _type = self:getSkillAwakeningType((self._value).currentSpecializeIndex)
        local reinforcableCount = ToClient_GetAwakeningListCount()
        local count = 0
        for index = 0, reinforcableCount - 1 do
          local skillSSW = ToClient_GetAwakeningListAt(index)
          if _type == skillSSW:getSkillAwakeningType() then
            count = count + 1
          end
        end
        if count ~= 0 then
          self:goPage2()
        else
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NOSKILL"))
          return 
        end
      end
    end
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_ChangeEffect = function()
  -- function num : 0_37 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  if (self._value).currentSpecializeIndex == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NOSKILL"))
    return 
  end
  local control = ((self._ui).rbtn_List)[(self._value).currentSpecializeIndex]
  if control.reinforceIndex ~= nil then
    local skillSSW = ToClient_GetReAwakeningListAt(control.reinforceIndex)
    if skillSSW == nil then
      return 
    end
    local skillNo = skillSSW:getSkillNo()
    if skillNo ~= nil then
      local selfPlayer = getSelfPlayer()
      if selfPlayer == nil then
        return 
      end
      local applyAwakenSkillReset = (selfPlayer:get()):isApplyChargeSkill((CppEnums.UserChargeType).eUserChargeType_UnlimitedSkillAwakening)
      local inventory = (selfPlayer:get()):getInventory()
      local hasMemoryFlag = inventory:getItemCount_s64(ItemEnchantKey(44195, 0))
      if toInt64(0, 0) == hasMemoryFlag and not applyAwakenSkillReset then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SKILL_REINFORCE_NEEDITEM"))
        return 
      end
      local SkillSSW = getSkillStaticStatus(skillNo, 1)
      if SkillSSW == nil then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NOINFO"))
        return 
      end
      local ActiveSkillWrapper = SkillSSW:getActiveSkillStatus()
      if ActiveSkillWrapper == nil then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_ALERT"))
        return 
      end
    end
    do
      -- DECOMPILER ERROR at PC97: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (self._value).currnetReinforceIndex = control.reinforceIndex
      self:goPage2((self._enum).eStepSelectSkill)
    end
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_Page2SkillListCreate = function(list_content, key)
  -- function num : 0_38 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  local _key = Int64toInt32(key)
  local radioButton_Skill = (UI.getChildControl)(list_content, "RadioButton_Skill_Template")
  local static_SkilllIcon = (UI.getChildControl)(radioButton_Skill, "Static_SkilllIcon_Template")
  local staticText_SkillName = (UI.getChildControl)(radioButton_Skill, "StaticText_SkillName_Template")
  local staticText_SkillDesc = (UI.getChildControl)(radioButton_Skill, "StaticText_SkillDesc_Template")
  radioButton_Skill:SetCheck(_key == (self._value).currentSelectSkillIndex)
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() == 0 then
    staticText_SkillDesc:SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
    staticText_SkillDesc:setLineCountByLimitAutoWrap(2)
  else
    staticText_SkillDesc:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
    staticText_SkillDesc:setLineCountByLimitAutoWrap(1)
  end
  local _type = self:getSkillAwakeningType((self._value).currentSpecializeIndex)
  local reinforcableCount = ToClient_GetAwakeningListCount()
  do
    local count = 0
    for index = 0, reinforcableCount - 1 do
      local skillSSW = ToClient_GetAwakeningListAt(index)
      if _type == skillSSW:getSkillAwakeningType() then
        do
          do
            if count == _key then
              local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
              skillNo = skillSSW:getSkillNo()
              staticText_SkillName:SetText(tostring(skillSSW:getName()))
              staticText_SkillDesc:SetText(tostring(skillTypeSSW:getDescription()))
              static_SkilllIcon:ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
              Panel_SkillTooltip_SetPosition(skillNo, static_SkilllIcon, "SkillAwaken")
              static_SkilllIcon:addInputEvent("Mouse_On", "Panel_SkillTooltip_Show(" .. skillNo .. ", false, \"SkillAwaken\")")
              static_SkilllIcon:addInputEvent("Mouse_Out", "Panel_SkillTooltip_Hide()")
              radioButton_Skill:addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_SelectSkill(" .. skillNo .. ", " .. index .. ")")
              break
            end
            count = count + 1
            -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_Page2EffectListCreate = function(list_content, key)
  -- function num : 0_39 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  local _key = Int64toInt32(key)
  local radioButton_Effect = (UI.getChildControl)(list_content, "RadioButton_Effect1_Template")
  if _key ~= (self._value).currentEffectIndex then
    radioButton_Effect:SetCheck((self._value).currentStep ~= (self._enum).eStepSelectSkill)
    if _key ~= (self._value).currentEffectIndex2 then
      radioButton_Effect:SetCheck((self._value).currentStep ~= (self._enum).eStepSelectEffect1)
      local skillSSW = getSkillStaticStatus((self._value).currentReinforceSkillNo, 1)
      local activeSkillSS = skillSSW:getActiveSkillStatus()
      radioButton_Effect:SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
      if activeSkillSS ~= nil then
        local optionCount = activeSkillSS:getSkillAwakenInfoCount()
        local count = 0
        local _key = Int64toInt32(key)
        for index = 0, optionCount - 1 do
          if index == _key then
            radioButton_Effect:SetText(tostring(activeSkillSS:getSkillAwakenDescription(index)))
            radioButton_Effect:addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_SkillSpecialize_SelectEffect(" .. index .. ")")
          end
        end
      end
      -- DECOMPILER ERROR: 6 unprocessed JMP targets
    end
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_SelectSkill = function(skillNo, index)
  -- function num : 0_40 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  if (self._value).currentStep ~= (self._enum).eStepBase then
    return 
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).currentSelectSkillIndex = index
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).currentReinforceSkillNo = skillNo
  self:setPage2SelectedSkill(skillNo)
end

PaGlobalFunc_Dialog_SkillSpecialize_SelectEffect = function(index)
  -- function num : 0_41 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  if (self._value).currentStep == (self._enum).eStepSelectSkill then
    (self._value).currentEffectIndex = index
  else
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

    if (self._value).currentStep == (self._enum).eStepSelectEffect1 then
      (self._value).currentEffectIndex2 = index
    end
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_GoNextStepPage2 = function()
  -- function num : 0_42 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  local nextStep = nil
  if (self._value).currentStep == (self._enum).eStepBase then
    if (self._value).currentReinforceSkillNo == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSKILL"))
      return 
    end
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._value).currentStep = (self._enum).eStepSelectSkill
    self:setContentPage2((self._value).currentStep)
    return 
  end
  if (self._value).currentStep == (self._enum).eStepSelectSkill then
    if (self._value).currentEffectIndex == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTFIRSTOPTION"))
      return 
    end
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._value).currentStep = (self._enum).eStepSelectEffect1
    self:setContentPage2((self._value).currentStep)
    return 
  end
  if (self._value).currentStep == (self._enum).eStepSelectEffect1 then
    if (self._value).currentEffectIndex == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSECONDOPTION"))
      return 
    end
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._value).currentStep = (self._enum).eStepSelectEffect2
    self:setContentPage2((self._value).currentStep)
    return 
  end
  if (self._value).currentStep == (self._enum).eStepSelectEffect2 then
    PaGlobalFunc_Dialog_SkillSpecialize_Doit()
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_GoBackStepPage2 = function()
  -- function num : 0_43 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  if (self._value).currentStep == (self._enum).eStepBase then
    self:initValuePage2()
    self:goPage1()
    return 
  end
  if (self._value).currentStep == (self._enum).eStepSelectSkill then
    if (self._value).currentSelectSkillIndex == nil then
      self:initValuePage2()
      self:goPage1()
      return 
    end
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._value).currentSelectSkillIndex = nil
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._value).currentReinforceSkillNo = nil
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._value).currentStep = (self._enum).eStepBase
    self:setContentPage2((self._value).currentStep)
    return 
  end
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  if (self._value).currentStep == (self._enum).eStepSelectEffect1 then
    (self._value).currentEffectIndex = nil
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._value).currentStep = (self._enum).eStepSelectSkill
    self:setContentPage2((self._value).currentStep)
    return 
  end
  -- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

  if (self._value).currentStep == (self._enum).eStepSelectEffect2 then
    (self._value).currentEffectIndex2 = nil
    -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._value).currentStep = (self._enum).eStepSelectEffect1
    self:setContentPage2((self._value).currentStep)
    return 
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_Doit = function()
  -- function num : 0_44 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  local branch = nil
  if (self._value).currnetReinforceIndex == nil then
    if (self._value).currentSelectSkillIndex == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSKILL"))
      return 
    end
    if (self._value).currentEffectIndex == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTFIRSTOPTION"))
      return 
    end
    if (self._value).currentEffectIndex2 == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSECONDOPTION"))
      return 
    end
    ToClient_RequestSkillAwakening((self._value).currentSelectSkillIndex, (self._value).currentEffectIndex, (self._value).currentEffectIndex2)
  else
    if (self._value).currentSelectSkillIndex == nil then
      if (self._value).currentEffectIndex == nil then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTFIRSTOPTION"))
        return 
      end
      if (self._value).currentEffectIndex2 == nil then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSECONDOPTION"))
        return 
      end
      ToClient_RequestChangeAwakeningBitFlag((self._value).currnetReinforceIndex, (self._value).currentEffectIndex, (self._value).currentEffectIndex2)
    else
      if (self._value).currentEffectIndex == nil then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTFIRSTOPTION"))
        return 
      end
      if (self._value).currentEffectIndex2 == nil then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSECONDOPTION"))
        return 
      end
      ToClient_RequestChangeAwakeningSkill((self._value).currnetReinforceIndex, (self._value).currentSelectSkillIndex, (self._value).currentEffectIndex, (self._value).currentEffectIndex2)
    end
  end
end

PaGlobalFunc_Dialog_SkillSpecialize_Reinforcable_SkillCount = function(_type)
  -- function num : 0_45
  local reinforcableCount = ToClient_GetAwakeningListCount()
  if reinforcableCount > 0 then
    local count = 0
    for index = 0, reinforcableCount - 1 do
      local skillSSW = ToClient_GetAwakeningListAt(index)
      if _type == skillSSW:getSkillAwakeningType() then
        count = count + 1
      end
    end
    return count
  else
    do
      do return reinforcableCount end
    end
  end
end

FromClient_Init_Dialog_SkillSpecialize = function()
  -- function num : 0_46 , upvalues : Panel_Dialog_SkillSpecialize_info
  local self = Panel_Dialog_SkillSpecialize_info
  self:initialize()
  self:resize()
end

FromClient_Dialog_SkillSpecialize_Show = function()
  -- function num : 0_47 , upvalues : Panel_Dialog_SkillSpecialize_info
  if not ToClient_IsContentsGroupOpen("203") then
    return 
  end
  local self = Panel_Dialog_SkillSpecialize_info
  self:preOpen()
  self:setContent()
  self:open(true)
end

FromClient_SuccessSkillSpecialize = function(skillNo, level)
  -- function num : 0_48 , upvalues : result
  if not ToClient_IsContentsGroupOpen("203") then
    return 
  end
  Panel_SkillAwaken_ResultOption:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_SkillAwaken_ResultOption:SetPosX(0)
  Panel_SkillAwaken_ResultOption:SetPosY(20)
  local skillStatic = (getSkillStaticStatus(skillNo, 1))
  local activeSkillSS = nil
  if skillStatic:isActiveSkillHas() then
    activeSkillSS = getActiveSkillStatus(skillStatic)
    if activeSkillSS == nil then
      Panel_SkillAwaken_ResultOption:SetShow(false, false)
    else
      local awakeInfo = ""
      local awakeningDataCount = activeSkillSS:getSkillAwakenInfoCount() - 1
      for index = 0, awakeningDataCount do
        local skillInfo = activeSkillSS:getSkillAwakenInfo(index)
        if skillInfo ~= "" then
          awakeInfo = awakeInfo .. "\n" .. skillInfo
        end
      end
      Panel_SkillAwaken_ResultOption:SetShow(true, true)
      Panel_SkillAwaken_ResultOption:SetAlpha(0)
      ;
      (UIAni.AlphaAnimation)(1, Panel_SkillAwaken_ResultOption, 0, 0.3)
      ;
      (result._awakenOption):SetText("<PAColor0xffdadada>" .. tostring(awakeInfo) .. "<PAOldColor>")
      ;
      (result._awakenResult_BG):SetPosX(0)
      ;
      (result._awakenTitle):ComputePos()
      ;
      (result._awakenOption):ComputePos()
      acquireSizeY = (result._awakenTitle):GetSizeY() + (result._awakenOption):GetTextSizeY() + 85
      ;
      (result._awakenResult_BG):SetSize(getScreenSizeX(), acquireSizeY)
    end
  end
  do
    FromClient_Dialog_SkillSpecialize_Show()
  end
end

local isResultHideTime = 0
SkillReinforceResult_Hide = function(deltaTime)
  -- function num : 0_49 , upvalues : isResultHideTime
  isResultHideTime = isResultHideTime + deltaTime
  if isResultHideTime > 5 then
    Panel_SkillAwaken_ResultOption:SetShow(false, true)
    isResultHideTime = 0
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_Init_Dialog_SkillSpecialize")

