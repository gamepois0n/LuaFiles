-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\skill\panel_window_skill_combination.luac 

-- params : ...
-- function num : 0
Panel_SkillCombination:SetShow(false)
PaGlobal_isSkillCombinationContentsOpen = ToClient_IsContentsGroupOpen("920")
PaGlobal_SkillCombination = {
_ui = {_btn_Close = (UI.getChildControl)(Panel_SkillCombination, "Button_Close"), _list2 = (UI.getChildControl)(Panel_SkillCombination, "List2_SkillCombination"), _staticTextDesc = (UI.getChildControl)(Panel_SkillCombination, "StaticText_Bottom_Bg")}
, 
_slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
_skillSlotConfig = {createIcon = true, createEffect = true, createFG = true, createFGDisabled = true, createFG_Passive = true, createMinus = true, createLevel = true, createLearnButton = true, createTestimonial = true, createLockIcon = true, createMouseOver = true, 
template = {effect = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_Skill_Effect"), iconFG = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_FG"), iconFGDisabled = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_FG_DISABLE"), iconFG_Passive = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_BG"), iconMinus = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_Skill_EffectMinus"), learnButton = (UI.getChildControl)(Panel_Window_Skill, "Button_Skill_Point"), mouseOverButton = (UI.getChildControl)(Panel_Window_Skill, "Button_Skill_OverMouse"), testimonial = (UI.getChildControl)(Panel_Window_Skill, "Static_Skill_Effect"), lockIcon = (UI.getChildControl)(Panel_Window_Skill, "Static_SkillLockIcon")}
}
, _skillNoCache = 0, _slotTypeCache = 0, _tooltipcacheCount = 0, _maxCombiSkill = 10, 
_mainSlot = {
[0] = {}
, 
[1] = {}
}
, 
_subSlot = {
[0] = {}
, 
[1] = {}
}
, 
_fusionSlot = {
[0] = {}
, 
[1] = {}
}
, _isFirstOpen = false, 
_learnButton = {
[0] = {}
, 
[1] = {}
}
}
-- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.initalize = function(self)
  -- function num : 0_0
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_SkillCombination:close()")
  for _,control in pairs((self._skillSlotConfig).template) do
    control:SetShow(false)
  end
  ;
  ((self._ui)._staticTextDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._staticTextDesc):SetText("-56레벨�\180 되면 기술 조합 �\173(신규)�\180 활성�\148 되며 기술 조합�\132 사용�\160 �\152 있다.\n-조합�\156 기술�\128 메인 기술�\152 커맨드를 유지�\160 �\152 있다.\n-조합�\156 기술�\132 기술잠금�\132 하게되면 기존�\152 기술�\180 발동된다.")
  do
    if ((self._ui)._staticTextDesc):GetSizeY() < ((self._ui)._staticTextDesc):GetTextSizeY() + 20 then
      local sizeY = ((self._ui)._staticTextDesc):GetTextSizeY() + 20 - ((self._ui)._staticTextDesc):GetSizeY()
      ;
      ((self._ui)._staticTextDesc):SetSize(((self._ui)._staticTextDesc):GetSizeX(), ((self._ui)._staticTextDesc):GetSizeY() + sizeY)
      Panel_SkillCombination:SetSize(Panel_SkillCombination:GetSizeX(), Panel_SkillCombination:GetSizeY() + sizeY)
    end
    ;
    ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "SkillCombinationListControlCreate")
    ;
    ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  end
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.initalizeList = function(self)
  -- function num : 0_1
  if self._isFirstOpen then
    return 
  end
  self._maxCombiSkill = ToClient_getFusionSkillListCount()
  for index = 0, self._maxCombiSkill - 1 do
    (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, index))
  end
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.setPosition = function(self)
  -- function num : 0_2
  Panel_SkillCombination:SetPosX(Panel_Window_Skill:GetPosX() + Panel_Window_Skill:GetSizeX() - 25)
  Panel_SkillCombination:SetPosY(Panel_Window_Skill:GetPosY() + 40)
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.open = function(self)
  -- function num : 0_3
  Panel_SkillCombination:SetShow(true)
  PaGlobal_SkillCombination:setPosition()
  PaGlobal_SkillCombination:initalizeList()
  self._isFirstOpen = true
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.close = function(self)
  -- function num : 0_4
  if Panel_Window_Skill:GetShow() then
    Panel_SkillCombination:SetShow(false)
    Panel_EnableSkill:SetShow(true)
  else
    Panel_SkillCombination:SetShow(false)
  end
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.update = function(self)
  -- function num : 0_5
  if self._isFirstOpen == false or PaGlobal_isSkillCombinationContentsOpen == false then
    return 
  end
  self._maxCombiSkill = ToClient_getFusionSkillListCount()
  for index = 0, self._maxCombiSkill - 1 do
    local mainSkillNo = ToClient_getFusionMainSkillNo(index)
    local subSkillNo = ToClient_getFusionSubSkillNo(index)
    local fusionSkillNo = ToClient_getFusionSkillNo(index)
    PaGlobal_SkillCombination:UpdateCombiSkill(mainSkillNo, (self._mainSlot)[index], true)
    PaGlobal_SkillCombination:UpdateCombiSkill(subSkillNo, (self._subSlot)[index], true)
    PaGlobal_SkillCombination:UpdateCombiSkill(fusionSkillNo, (self._fusionSlot)[index], false)
    if ToClient_isLearnedSkill(fusionSkillNo) == true then
      ((self._learnButton)[index]):SetIgnore(true)
      ;
      ((self._learnButton)[index]):SetMonoTone(true)
    else
      ;
      ((self._learnButton)[index]):SetIgnore(false)
      ;
      ((self._learnButton)[index]):SetMonoTone(false)
    end
  end
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.UpdateCombiSkill = function(self, skillNo, slot, checkMonoTone)
  -- function num : 0_6
  if checkMonoTone == true then
    if ToClient_isLearnedSkill(skillNo) == false then
      (slot.icon):SetMonoTone(true)
    else
      ;
      (slot.icon):SetMonoTone(false)
    end
  end
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.combinationLearnSkill = function(self, index, mainSkillNo, subSkillNo, fusionSkillNo)
  -- function num : 0_7
  ToClient_requestLearnFusionSkill(fusionSkillNo, mainSkillNo, subSkillNo)
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.tooltipHide = function(self, skillNo, SlotType)
  -- function num : 0_8
  if self._skillNoCache == skillNo and self._slotTypeCache == SlotType then
    self._tooltipcacheCount = self._tooltipcacheCount - 1
  else
    self._tooltipcacheCount = 0
  end
  if self._tooltipcacheCount <= 0 then
    Panel_SkillTooltip_Hide()
  end
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.tooltipShow = function(self, skillNo, isShowNextLevel, SlotType)
  -- function num : 0_9
  if self._skillNoCache == skillNo and self._slotTypeCache == SlotType then
    self._tooltipcacheCount = self._tooltipcacheCount + 1
  else
    self._skillNoCache = skillNo
    self._slotTypeCache = SlotType
    self._tooltipcacheCount = 1
  end
  Panel_SkillTooltip_Show(skillNo, false, SlotType)
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.SetCombiSkill = function(self, skillNo, selfSlot, parentSlot, checkMonoTone, index)
  -- function num : 0_10
  local skillWrapper = getSkillTypeStaticStatus(skillNo)
  if skillWrapper ~= nil and skillWrapper:isValidLocalizing() then
    local skillTypeStatic = skillWrapper:get()
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R8 in 'UnsetPending'

    if skillTypeStatic:isActiveSkill() then
      (self._skillSlotConfig).createFG = skillTypeStatic._isSettableQuickSlot
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (self._skillSlotConfig).createFGDisabled = (self._skillSlotConfig).createFG
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (self._skillSlotConfig).createFG_Passive = not (self._skillSlotConfig).createFG
      ;
      (SlotSkill.new)(selfSlot, skillNo, parentSlot, self._skillSlotConfig)
      if selfSlot.icon ~= nil then
        (selfSlot.icon):addInputEvent("Mouse_On", "PaGlobal_SkillCombination:tooltipShow(" .. skillNo .. ",false, \"CombiSkill\")")
        ;
        (selfSlot.icon):addInputEvent("Mouse_Out", "PaGlobal_SkillCombination:tooltipHide(" .. skillNo .. ",\"CombiSkill\")")
        if checkMonoTone == true and ToClient_isLearnedSkill(skillNo) == false then
          (selfSlot.icon):SetMonoTone(true)
        end
        Panel_SkillTooltip_SetPosition(skillNo, selfSlot.icon, "CombiSkill")
      end
      selfSlot:setSkillTypeStatic(skillWrapper)
    end
  end
end

SkillCombinationListControlCreate = function(content, key)
  -- function num : 0_11
  local self = PaGlobal_SkillCombination
  local index = Int64toInt32(key)
  local mainSkillSlot = (UI.getChildControl)(content, "Static_MainSkillSlot")
  local subSkillSlot = (UI.getChildControl)(content, "Static_SubSkillSlot")
  local combiSkillSlot = (UI.getChildControl)(content, "Static_CombiSkillSlot")
  local btnLearnSkill = (UI.getChildControl)(content, "Button_Learn")
  local mainSkillNo = ToClient_getFusionMainSkillNo(index)
  local subSkillNo = ToClient_getFusionSubSkillNo(index)
  local fusionSkillNo = ToClient_getFusionSkillNo(index)
  PaGlobal_SkillCombination:SetCombiSkill(mainSkillNo, (self._mainSlot)[index], mainSkillSlot, true, index)
  PaGlobal_SkillCombination:SetCombiSkill(subSkillNo, (self._subSlot)[index], subSkillSlot, true, index)
  PaGlobal_SkillCombination:SetCombiSkill(fusionSkillNo, (self._fusionSlot)[index], combiSkillSlot, false, index)
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R11 in 'UnsetPending'

  ;
  (self._learnButton)[index] = btnLearnSkill
  btnLearnSkill:addInputEvent("Mouse_LUp", "PaGlobal_SkillCombination:combinationLearnSkill(" .. index .. "," .. mainSkillNo .. "," .. subSkillNo .. "," .. fusionSkillNo .. ")")
  if ToClient_isLearnedSkill(fusionSkillNo) == true then
    ((self._learnButton)[index]):SetIgnore(true)
    ;
    ((self._learnButton)[index]):SetMonoTone(true)
  end
end

PaGlobal_SkillCombination:initalize()

