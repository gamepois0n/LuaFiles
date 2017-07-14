-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\skill\panel_window_skill_combination.luac 

-- params : ...
-- function num : 0
Panel_SkillCombination:SetShow(false)
PaGlobal_SkillCombination = {
_ui = {_btn_Close = (UI.getChildControl)(Panel_SkillCombination, "Button_Close"), _list2 = (UI.getChildControl)(Panel_SkillCombination, "List2_SkillCombination")}
, 
_slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
_skillSlotConfig = {createIcon = true, createEffect = true, createFG = true, createFGDisabled = true, createFG_Passive = true, createMinus = true, createLevel = true, createLearnButton = true, createTestimonial = true, createLockIcon = true, createMouseOver = true, 
template = {effect = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_Skill_Effect"), iconFG = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_FG"), iconFGDisabled = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_FG_DISABLE"), iconFG_Passive = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_BG"), iconMinus = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_Skill_EffectMinus"), learnButton = (UI.getChildControl)(Panel_Window_Skill, "Button_Skill_Point"), mouseOverButton = (UI.getChildControl)(Panel_Window_Skill, "Button_Skill_OverMouse"), testimonial = (UI.getChildControl)(Panel_Window_Skill, "Static_Skill_Effect"), lockIcon = (UI.getChildControl)(Panel_Window_Skill, "Static_SkillLockIcon")}
}
, _maxCombiSkill = 10, 
_mainSlot = {}
, 
_subSlot = {}
, 
_fusionSlot = {}
, _isOpen = false}
-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.initalize = function(self)
  -- function num : 0_0
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_SkillCombination:close()")
  for _,control in pairs((self._skillSlotConfig).template) do
    control:SetShow(false)
  end
  ;
  ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "SkillCombinationListControlCreate")
  ;
  ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.setPosition = function(self)
  -- function num : 0_1
  Panel_SkillCombination:SetPosX(Panel_Window_Skill:GetPosX() + Panel_Window_Skill:GetSizeX() - 25)
  Panel_SkillCombination:SetPosY(Panel_Window_Skill:GetPosY() + 40)
end

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.open = function(self)
  -- function num : 0_2
  Panel_SkillCombination:SetShow(true)
  PaGlobal_SkillCombination:setPosition()
  PaGlobal_SkillCombination:update()
  self._isOpen = true
end

-- DECOMPILER ERROR at PC116: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.close = function(self)
  -- function num : 0_3
  if Panel_Window_Skill:GetShow() then
    Panel_SkillCombination:SetShow(false)
    Panel_EnableSkill:SetShow(true)
  else
    Panel_SkillCombination:SetShow(false)
  end
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.update = function(self)
  -- function num : 0_4
  if self._isOpen then
    return 
  end
  self._maxCombiSkill = 2
  for index = 0, self._maxCombiSkill - 1 do
    (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, index))
  end
end

-- DECOMPILER ERROR at PC122: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SkillCombination.combinationLearnSkill = function(self, index, mainSkillNo, subSkillNo, fusionSkillNo)
  -- function num : 0_5
  ToClient_requestLearnFusionSkill(fusionSkillNo, mainSkillNo, subSkillNo)
end

SkillCombinationListControlCreate = function(content, key)
  -- function num : 0_6
  local self = PaGlobal_SkillCombination
  local index = Int64toInt32(key)
  local mainSkillSlot = (UI.getChildControl)(content, "Static_MainSkillSlot")
  local subSkillSlot = (UI.getChildControl)(content, "Static_SubSkillSlot")
  local combiSkillSlot = (UI.getChildControl)(content, "Static_CombiSkillSlot")
  local btnLearnSkill = (UI.getChildControl)(content, "Button_Learn")
  local mainSkillNo = ToClient_getFusionMainSkillNo(index)
  local subSkillNo = ToClient_getFusionSubSkillNo(index)
  local fusionSkillNo = ToClient_getFusionSkillNo(index)
  local SetCombiSkill = function(skillNo, slot, parentSlot)
    -- function num : 0_6_0 , upvalues : self
    local skillWrapper = getSkillTypeStaticStatus(skillNo)
    if skillWrapper ~= nil and skillWrapper:isValidLocalizing() then
      local slot = {}
      local skillTypeStatic = skillWrapper:get()
      -- DECOMPILER ERROR at PC19: Confused about usage of register: R6 in 'UnsetPending'

      if skillTypeStatic:isActiveSkill() then
        (self._skillSlotConfig).createFG = skillTypeStatic._isSettableQuickSlot
        -- DECOMPILER ERROR at PC25: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self._skillSlotConfig).createFGDisabled = (self._skillSlotConfig).createFG
        -- DECOMPILER ERROR at PC32: Confused about usage of register: R6 in 'UnsetPending'

        ;
        (self._skillSlotConfig).createFG_Passive = not (self._skillSlotConfig).createFG
        ;
        (SlotSkill.new)(slot, skillNo, parentSlot, self._skillSlotConfig)
        if slot.icon ~= nil then
          (slot.icon):addInputEvent("Mouse_On", "HandleMOver_SkillWindow_ToolTipShow(" .. skillNo .. ",false, \"SkillBox\",true)")
          ;
          (slot.icon):addInputEvent("Mouse_Out", "HandleMOver_SkillWindow_ToolTipHide(" .. skillNo .. ",\"SkillBox\",true)")
          Panel_SkillTooltip_SetPosition(skillNo, slot.icon, "SkillBox")
        end
        slot:setSkillTypeStatic(skillWrapper)
      end
    end
  end

  SetCombiSkill(mainSkillNo, (self._mainSlot)[index], mainSkillSlot)
  SetCombiSkill(subSkillNo, (self._subSlot)[index], subSkillSlot)
  SetCombiSkill(fusionSkillNo, (self._fusionSlot)[index], combiSkillSlot)
  btnLearnSkill:addInputEvent("Mouse_LUp", "PaGlobal_SkillCombination:combinationLearnSkill(" .. index .. "," .. mainSkillNo .. "," .. subSkillNo .. "," .. fusionSkillNo .. ")")
end

PaGlobal_SkillCombination:initalize()

