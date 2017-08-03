-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\skill\panel_window_skill_global.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local skillOldandNew = ToClient_IsContentsGroupOpen("920")
PaGlobal_Skill = {staticBottomBox; 
slotConfig = {createIcon = true, createEffect = true, createFG = true, createFGDisabled = true, createFG_Passive = true, createMinus = true, createLevel = true, createLearnButton = true, createTestimonial = true, createLockIcon = true, createMouseOver = true, 
template = {effect = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_Skill_Effect"), iconFG = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_FG"), iconFGDisabled = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_FG_DISABLE"), iconFG_Passive = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_BG"), iconMinus = (UI.getChildControl)(Panel_Window_Skill, "Static_Icon_Skill_EffectMinus"), learnButton = (UI.getChildControl)(Panel_Window_Skill, "Button_Skill_Point"), mouseOverButton = (UI.getChildControl)(Panel_Window_Skill, "Button_Skill_OverMouse"), testimonial = (UI.getChildControl)(Panel_Window_Skill, "Static_Skill_Effect"), lockIcon = (UI.getChildControl)(Panel_Window_Skill, "Static_SkillLockIcon")}
}
, 
config = {slotStartX = 6, slotStartY = 6, slotGapX = 42, slotGapY = 42, emptyGapX = 22, emptyGapY = 18}
, 
slots = {
{}
; 
[0] = {}
}
, learnableSlotShowMaxCount = 8, 
learnableSlots = {}
, learnableSlotCount = 0, 
learnableSlotsSortList = {}
, learnableSlotsSortListCount = 0, 
skillNoSlot = {}
, combatTabIndex = 0, awakenTabIndex = 1, awakenSkillTabIndex = 2, tabIndex = 0, lastTabIndex = 0, lastLearnMode = false, controlInitialize = false, 
radioButtons = {(UI.getChildControl)(Panel_Window_Skill, "RadioButton_Tab_Product"); [0] = (UI.getChildControl)(Panel_Window_Skill, "RadioButton_Tab_Combat")}
, staticRemainPoint = (UI.getChildControl)(Panel_Window_Skill, "Static_Text_RemainSkillPoint"), buttonClose = (UI.getChildControl)(Panel_Window_Skill, "Button_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_Skill, "Button_Question"), staticSkillLevel = (UI.getChildControl)(Panel_Window_Skill, "Static_Text_Skill_Level"), textSkillPoint = (UI.getChildControl)(Panel_Window_Skill, "Static_Text_SkillPoint"), progressSkillExp = (UI.getChildControl)(Panel_Window_Skill, "Progress2_SkillExpGage"), 
frames = {(UI.getChildControl)(Panel_Window_Skill, "Frame_Awaken"); [0] = (UI.getChildControl)(Panel_Window_Skill, "Frame_Combat")}
, 
template_guideLine = {
h = {[3] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_LT"), [4] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_CT"), [5] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_RT"), [6] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_LM"), [7] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_CM"), [8] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_RM"), [9] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_LB"), [10] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_CB"), [11] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_RB"), [12] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_HORI"), [13] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeH_VERTI")}
, 
v = {[3] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_LT"), [4] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_CT"), [5] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_RT"), [6] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_LM"), [7] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_CM"), [8] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_RM"), [9] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_LB"), [10] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_CB"), [11] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_RB"), [12] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_HORI"), [13] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeV_VERTI")}
, 
l = {[3] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_LT"), [4] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_CT"), [5] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_RT"), [6] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_LM"), [7] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_CM"), [8] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_RM"), [9] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_LB"), [10] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_CB"), [11] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_RB"), [12] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_HORI"), [13] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeL_VERTI")}
, 
s = {[3] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_LT"), [4] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_CT"), [5] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_RT"), [6] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_LM"), [7] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_CM"), [8] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_RM"), [9] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_LB"), [10] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_CB"), [11] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_RB"), [12] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_HORI"), [13] = (UI.getChildControl)(Panel_Window_Skill, "Static_TypeS_VERTI")}
}
, awakenDesc = (UI.getChildControl)(Panel_Window_Skill, "StaticText_AwakenWeaponDesc"), _btn_MovieToolTipBG = (UI.getChildControl)(Panel_Window_Skill, "Static_MovieBG"), _btn_MovieToolTipDesc = (UI.getChildControl)(Panel_Window_Skill, "StaticText_MovieToolTip"), _btn_MovieToolTip = (UI.getChildControl)(Panel_Window_Skill, "Button_MovieTooltip"), _btn_MovieToolTip2 = (UI.getChildControl)(Panel_Window_Skill, "Button_MovieTooltip_SpacialCombo"), learnedSkillList = (Array.new)(), isPartsSkillReset = false, saved_isLearnMode = true, scrollPos = 0, skillNoCache = 0, slotTypeCache = 0, tooltipcacheCount = 0, skillLevelBg = (UI.getChildControl)(Panel_Window_Skill, "Static_SkillLevel"), _txt_MentalTip = (UI.getChildControl)(Panel_Window_Skill, "StaticText_Mental_Tip"), _txt_ResourceSaveDesc = (UI.getChildControl)(Panel_Window_Skill, "StaticText_ResourceSaveDesc"), _btn_ResetAllSkill = (UI.getChildControl)(Panel_Window_Skill, "Button_ResetAllSkill"), _btn_CommandLock = (UI.getChildControl)(Panel_Window_Skill, "Button_SkillCommandLock"), _bottomBG = (UI.getChildControl)(Panel_Window_Skill, "Static_BottomBox"), _static_CombiSkill_BG = nil, _static_CombiSlotBG = nil, 
_slot_CombiSkill = {}
, 
_static_SlotBG = {}
, _emptyCombiSkillIndex = 0, _fusionSlotMaxCount = 0, _combinationSkillTitle = (UI.getChildControl)(Panel_Window_Skill, "StaticText_SlotTitle")}
;
(PaGlobal_Skill._btn_CommandLock):SetShow(false)
local beforSkillNo = -1
-- DECOMPILER ERROR at PC546: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.initialize = function(self)
  -- function num : 0_0 , upvalues : skillOldandNew, UI_TM
  if skillOldandNew then
    self._static_CombiSkill_BG = (UI.getChildControl)(Panel_Window_Skill, "Static_SlotBG")
  end
  Panel_Window_Skill:setMaskingChild(true)
  Panel_Window_Skill:ActiveMouseEventEffect(true)
  Panel_Window_Skill:setGlassBackground(true)
  ;
  (self._txt_ResourceSaveDesc):SetShow(false)
  ;
  (self._txt_MentalTip):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_MentalTip):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SKILL_MENTALTIP") .. "\n" .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SKILL_RESOURCESAVEDESC"))
  ;
  (self._txt_MentalTip):ComputePos()
  self:initControl()
  self:initSkillLearnableSlot()
end

-- DECOMPILER ERROR at PC550: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.initControl = function(self)
  -- function num : 0_1 , upvalues : UI_TM
  for _,control in pairs((self.slotConfig).template) do
    control:SetShow(false)
  end
  local _frame_Combat = (UI.getChildControl)(Panel_Window_Skill, "Frame_Combat")
  local _frame_scroll_Combat = (UI.getChildControl)(_frame_Combat, "Frame_1_Scroll")
  ;
  (PaGlobal_Skill._txt_ResourceSaveDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  local _btn_NewSkill = (UI.getChildControl)(Panel_Window_Skill, "Button_NewSkill")
  ;
  (self._btn_MovieToolTip2):SetMonoTone(true)
  local countryType = true
  if isGameTypeJapan() then
    (self._btn_MovieToolTipDesc):SetHorizonLeft()
    ;
    (self._btn_MovieToolTipDesc):SetSpanSize((self._btn_MovieToolTip):GetPosX() + 35, 49)
  end
  if (isGameTypeJapan() or isGameTypeEnglish()) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
    (self._btn_MovieToolTip):SetShow(false)
    ;
    (self._btn_MovieToolTipBG):SetShow(false)
    ;
    (self._btn_MovieToolTipDesc):SetShow(false)
  else
    ;
    (self._btn_MovieToolTip):SetShow(true)
    ;
    (self._btn_MovieToolTipBG):SetShow(true)
    ;
    (self._btn_MovieToolTipDesc):SetShow(true)
  end
  if isGameTypeKR2() then
    (self._btn_MovieToolTip):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC553: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.initCombiControl = function(self, cellTable, parent, container, isLearn)
  -- function num : 0_2
  self._static_CombiSlotBG = (UI.getChildControl)(self._static_CombiSkill_BG, "Static_Slot")
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  local startY = (self.config).slotStartY
  do
    local index = 0
    for row = 0, rows - 1 do
      local startX = (self.config).slotStartX
      local isSlotRow = row % 2 == 0
      if isSlotRow then
        do
          startY = startY + 8
          for col = 0, cols - 1 do
            local cell = cellTable:atPointer(col, row)
            local isSlotColumn = col % 2 == 0
            if isSlotColumn then
              startX = startX + (self.config).emptyGapX
            else
              startX = startX + (self.config).slotGapX
            end
            if cell:isSkillType() then
              local skillNo = ToClient_getFusionLearnSkillNo(index)
              local slotBG = {}
              if (self._static_SlotBG)[index] == nil then
                slotBG._base = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, parent, "combiSkillSlot_" .. index)
                CopyBaseProperty(self._static_CombiSlotBG, slotBG._base)
                ;
                (slotBG._base):SetPosX(startX - 4)
                ;
                (slotBG._base):SetShow(true)
                -- DECOMPILER ERROR at PC86: Confused about usage of register: R23 in 'UnsetPending'

                ;
                (self._static_SlotBG)[index] = slotBG
              end
              -- DECOMPILER ERROR at PC92: Confused about usage of register: R23 in 'UnsetPending'

              if skillNo == 0 or isLearn == false then
                (self.slotConfig).createFG = true
                -- DECOMPILER ERROR at PC96: Confused about usage of register: R23 in 'UnsetPending'

                ;
                (self.slotConfig).createFGDisabled = (self.slotConfig).createFG
                -- DECOMPILER ERROR at PC101: Confused about usage of register: R23 in 'UnsetPending'

                ;
                (self.slotConfig).createFG_Passive = not (self.slotConfig).createFG
                if isLearn == false then
                  (container[index]):clearSkill()
                  ;
                  ((container[index]).icon):ChangeTextureInfoName("")
                  ;
                  ((container[index]).icon):addInputEvent("Mouse_On", "")
                end
                local slot = {}
                if container[index] == nil then
                  (SlotSkill.new)(slot, index, parent, self.slotConfig)
                  slot:setPos(startX, startY)
                  if slot.learnButton ~= nil then
                    (slot.learnButton):SetIgnore(false)
                  end
                  if slot.icon ~= nil then
                    (slot.icon):addInputEvent("Mouse_LUp", "PaGlobal_Skill:HandleMLUp_CombiSkillWindow_LearnButtonClick()")
                  end
                  container[index] = slot
                end
                index = index + 1
              else
                local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
                if skillTypeStaticWrapper ~= nil and skillTypeStaticWrapper:isValidLocalizing() then
                  local skillTypeStatic = skillTypeStaticWrapper:get()
                  -- DECOMPILER ERROR at PC168: Confused about usage of register: R25 in 'UnsetPending'

                  if skillTypeStatic:isActiveSkill() then
                    (self.slotConfig).createFG = skillTypeStatic._isSettableQuickSlot
                    -- DECOMPILER ERROR at PC172: Confused about usage of register: R25 in 'UnsetPending'

                    ;
                    (self.slotConfig).createFGDisabled = (self.slotConfig).createFG
                    -- DECOMPILER ERROR at PC177: Confused about usage of register: R25 in 'UnsetPending'

                    ;
                    (self.slotConfig).createFG_Passive = not (self.slotConfig).createFG
                    do
                      do
                        local slot = {}
                        ;
                        (SlotSkill.new)(slot, skillNo, parent, self.slotConfig)
                        slot:setPos(startX, startY)
                        if slot.learnButton ~= nil then
                          (slot.learnButton):SetIgnore(true)
                        end
                        if slot.icon ~= nil then
                          (slot.icon):addInputEvent("Mouse_On", "HandleMOver_SkillWindow_ToolTipShow(" .. skillNo .. ",false, \"SkillBox\",true)")
                          ;
                          (slot.icon):addInputEvent("Mouse_Out", "HandleMOver_SkillWindow_ToolTipHide(" .. skillNo .. ",\"SkillBox\",true)")
                          ;
                          (slot.icon):addInputEvent("Mouse_PressMove", "HandleMLUp_SkillWindow_StartDrag(" .. skillNo .. ")")
                          ;
                          (slot.icon):addInputEvent("Mouse_RUp", "HandleMLUp_SkillWindow_ClearButtonClick(" .. skillNo .. ")")
                          ;
                          (slot.icon):SetEnableDragAndDrop(true)
                          Panel_SkillTooltip_SetPosition(skillNo, slot.icon, "SkillBox")
                        end
                        slot:setSkillTypeStatic(skillTypeStaticWrapper)
                        container[index] = slot
                        self._emptyCombiSkillIndex = index
                        index = index + 1
                        _PA_ASSERT("스킬트리", "skillTypeStaticStatus 매니져에 없는 스킬�\180 있습니다.")
                        -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                        -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC252: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
            end
          end
          -- DECOMPILER ERROR at PC253: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC253: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
    self._fusionSlotMaxCount = index
    PaGlobal_Skill:CombiSkill(isLearn)
    -- DECOMPILER ERROR: 17 unprocessed JMP targets
  end
end

FromClient_responseLearnFusionSkill = function(learnCombiSkillNo)
  -- function num : 0_3
  PaGlobal_Skill:combinationSkillLearn(learnCombiSkillNo)
end

FromClient_responseClearFusionSkill = function()
  -- function num : 0_4
  PaGlobal_Skill:initTabControl_Combination(false)
end

-- DECOMPILER ERROR at PC560: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.initTabControl = function(self, cellTable, parent, container)
  -- function num : 0_5
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  local startY = (self.config).slotStartY
  for row = 0, rows - 1 do
    local startX = (self.config).slotStartX
    local isSlotRow = row % 2 == 0
    if isSlotRow then
      startY = startY + (self.config).emptyGapY
    else
      startY = startY + (self.config).slotGapY
    end
    for col = 0, cols - 1 do
      local cell = cellTable:atPointer(col, row)
      local skillNo = cell._skillNo
      local isSlotColumn = col % 2 == 0
      if isSlotColumn then
        startX = startX + (self.config).emptyGapX
      else
        startX = startX + (self.config).slotGapX
      end
      if cell:isSkillType() then
        local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
        if skillTypeStaticWrapper ~= nil and skillTypeStaticWrapper:isValidLocalizing() then
          local skillTypeStatic = skillTypeStaticWrapper:get()
          -- DECOMPILER ERROR at PC70: Confused about usage of register: R22 in 'UnsetPending'

          if skillTypeStatic:isActiveSkill() then
            (self.slotConfig).createFG = skillTypeStatic._isSettableQuickSlot
            -- DECOMPILER ERROR at PC74: Confused about usage of register: R22 in 'UnsetPending'

            ;
            (self.slotConfig).createFGDisabled = (self.slotConfig).createFG
            -- DECOMPILER ERROR at PC79: Confused about usage of register: R22 in 'UnsetPending'

            ;
            (self.slotConfig).createFG_Passive = not (self.slotConfig).createFG
            do
              do
                local slot = {}
                ;
                (SlotSkill.new)(slot, skillNo, parent, self.slotConfig)
                slot:setPos(startX, startY)
                if slot.learnButton ~= nil then
                  (slot.learnButton):SetIgnore(true)
                end
                if slot.icon ~= nil then
                  (slot.icon):addInputEvent("Mouse_LUp", "HandleMLUp_SkillWindow_LearnButtonClick(" .. skillNo .. ")")
                  ;
                  (slot.icon):addInputEvent("Mouse_On", "HandleMOver_SkillWindow_ToolTipShow(" .. skillNo .. ",false, \"SkillBox\")")
                  ;
                  (slot.icon):addInputEvent("Mouse_Out", "HandleMOver_SkillWindow_ToolTipHide(" .. skillNo .. ",\"SkillBox\")")
                  Panel_SkillTooltip_SetPosition(skillNo, slot.icon, "SkillBox")
                end
                slot:setSkillTypeStatic(skillTypeStaticWrapper)
                container[skillNo] = slot
                _PA_ASSERT("스킬트리", "skillTypeStaticStatus 매니져에 없는 스킬�\180 있습니다.")
                if cell:isLineType() then
                  local template = self:getLineTemplate(isSlotColumn, isSlotRow, cell._cellType)
                  if template ~= nil then
                    local line = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, parent, "Static_Line_" .. col .. "_" .. row)
                    CopyBaseProperty(template, line)
                    line:SetPosX(startX)
                    line:SetPosY(startY)
                    line:SetIgnore(true)
                    line:SetShow(true)
                  end
                end
                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC180: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR: 12 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC563: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.HandleMLUp_CombiSkillWindow_LearnButtonClick = function(self)
  -- function num : 0_6
  Panel_EnableSkill:SetShow(false)
  PaGlobal_SkillCombination:open()
end

-- DECOMPILER ERROR at PC566: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.addConsoleUIControl = function(self, tabIndex)
  -- function num : 0_7
  local selfProxy = getSelfPlayer()
  if selfProxy == nil then
    return 
  end
  local classType = (selfProxy:getClassType())
  local cellTable = nil
  if self.combatTabIndex == tabIndex then
    cellTable = getCombatSkillTree(classType)
  else
    if self.awakenTabIndex == tabIndex then
      cellTable = getAwakeningWeaponSkillTree(classType)
    else
      return 
    end
  end
  Panel_Window_Skill:deleteConsoleUIGroup(1)
  local group_1 = Panel_Window_Skill:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_SKILLTREE)
  group_1:setConsoleKeyEventForLUA("SkillWindow_ScrollUpEvent", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_UP)
  group_1:setConsoleKeyEventForLUA("SkillWindow_ScrollDownEvent", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_DOWN)
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  local beforeRow = -1
  local count = 0
  for row = 0, rows - 1 do
    local columCount = 0
    for col = 0, cols - 1 do
      local cell = cellTable:atPointer(col, row)
      local skillNo = cell._skillNo
      if cell:isSkillType() then
        local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
        if skillTypeStaticWrapper ~= nil and skillTypeStaticWrapper:isValidLocalizing() then
          if row ~= beforeRow then
            beforeRow = row
            count = count + 1
          end
          if (((self.slots)[tabIndex])[skillNo]).icon ~= nil then
            group_1:addControl(columCount, count - 1, cols, rows, (((self.slots)[tabIndex])[skillNo]).icon)
          end
          columCount = columCount + 1
        end
      end
    end
  end
  beforeRowCount = count
end

SkillWindow_ScrollUpEvent = function()
  -- function num : 0_8
  PaGlobal_Skill:Skill_ScrollMove("up")
end

SkillWindow_ScrollDownEvent = function()
  -- function num : 0_9
  PaGlobal_Skill:Skill_ScrollMove("down")
end

-- DECOMPILER ERROR at PC573: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.initTabControl_Combat = function(self)
  -- function num : 0_10
  local targetFrame = (self.frames)[self.combatTabIndex]
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.slots)[self.combatTabIndex] = {}
  local classType = (getSelfPlayer()):getClassType()
  do
    if classType >= 0 then
      local cellTable = getCombatSkillTree(classType)
      self:initTabControl(cellTable, targetFrame:GetFrameContent(), (self.slots)[self.combatTabIndex])
    end
    targetFrame:UpdateContentScroll()
  end
end

-- DECOMPILER ERROR at PC576: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.initTabControl_AwakeningWeapon = function(self)
  -- function num : 0_11
  local targetFrame = (self.frames)[self.awakenTabIndex]
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.slots)[self.awakenTabIndex] = {}
  local classType = (getSelfPlayer()):getClassType()
  do
    if classType >= 0 then
      local cellTable = getAwakeningWeaponSkillTree(classType)
      if cellTable == nil then
        return 
      end
      self:initTabControl(cellTable, targetFrame:GetFrameContent(), (self.slots)[self.awakenTabIndex])
    end
    targetFrame:UpdateContentScroll()
  end
end

-- DECOMPILER ERROR at PC580: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.initTabControl_Combination = function(self, isLearn)
  -- function num : 0_12 , upvalues : skillOldandNew
  if skillOldandNew == false then
    return 
  end
  local isPossible = PaGlobal_Skill:OnOffCombinationTab()
  if isPossible == false then
    return 
  end
  local cellTable = getFusionSkillTree()
  self:initCombiControl(cellTable, self._static_CombiSkill_BG, self._slot_CombiSkill, isLearn)
end

-- DECOMPILER ERROR at PC583: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.OnOffCombinationTab = function(self)
  -- function num : 0_13
  local isLearnFusionSkill = ToClient_isLearnFusionSkillLevel()
  local originFullSizeY = 755
  local titleSize = (self._combinationSkillTitle):GetSizeY()
  local combinationSkillBG = (self._static_CombiSkill_BG):GetSizeY()
  if isLearnFusionSkill == true then
    (self._combinationSkillTitle):SetShow(true)
    ;
    (self._static_CombiSkill_BG):SetShow(true)
    Panel_Window_Skill:SetSize(Panel_Window_Skill:GetSizeX(), originFullSizeY)
  else
    if isLearnFusionSkill == false then
      (self._combinationSkillTitle):SetShow(false)
      ;
      (self._static_CombiSkill_BG):SetShow(false)
      Panel_Window_Skill:SetSize(Panel_Window_Skill:GetSizeX(), originFullSizeY - (titleSize + combinationSkillBG))
    end
  end
  Panel_Window_Skill:ComputePos()
  ;
  (self._txt_MentalTip):ComputePos()
  ;
  (self._bottomBG):ComputePos()
  ;
  (self._btn_MovieToolTipBG):ComputePos()
  ;
  (self._btn_MovieToolTipDesc):ComputePos()
  ;
  (self._btn_MovieToolTip):ComputePos()
  return isLearnFusionSkill
end

-- DECOMPILER ERROR at PC586: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.combinationSkillLearn = function(self, learnSkillNo)
  -- function num : 0_14
  local learnSkillCount = ToClient_getLearnFusionSkillCount()
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(learnSkillNo)
  if skillTypeStaticWrapper == nil then
    return 
  end
  if skillTypeStaticWrapper:isValidLocalizing() then
    local skillTypeStatic = skillTypeStaticWrapper:get()
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R5 in 'UnsetPending'

    if skillTypeStatic:isActiveSkill() then
      (self.slotConfig).createFG = skillTypeStatic._isSettableQuickSlot
      -- DECOMPILER ERROR at PC24: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (self.slotConfig).createFGDisabled = (self.slotConfig).createFG
      -- DECOMPILER ERROR at PC29: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (self.slotConfig).createFG_Passive = not (self.slotConfig).createFG
      ;
      ((self._slot_CombiSkill)[learnSkillCount - 1]):setSkillTypeStatic(skillTypeStaticWrapper)
      if ((self._slot_CombiSkill)[learnSkillCount - 1]).learnButton ~= nil then
        (((self._slot_CombiSkill)[learnSkillCount - 1]).learnButton):SetShow(false)
        ;
        (((self._slot_CombiSkill)[learnSkillCount - 1]).learnButton):SetIgnore(false)
      end
      if ((self._slot_CombiSkill)[learnSkillCount - 1]).icon ~= nil then
        (((self._slot_CombiSkill)[learnSkillCount - 1]).icon):addInputEvent("Mouse_On", "HandleMOver_SkillWindow_ToolTipShow(" .. learnSkillNo .. ",false, \"SkillBox\",true)")
        ;
        (((self._slot_CombiSkill)[learnSkillCount - 1]).icon):addInputEvent("Mouse_Out", "HandleMOver_SkillWindow_ToolTipHide(" .. learnSkillNo .. ",\"SkillBox\",true)")
        ;
        (((self._slot_CombiSkill)[learnSkillCount - 1]).icon):addInputEvent("Mouse_PressMove", "HandleMLUp_SkillWindow_StartDrag(" .. learnSkillNo .. ")")
        ;
        (((self._slot_CombiSkill)[learnSkillCount - 1]).icon):addInputEvent("Mouse_RUp", "HandleMLUp_SkillWindow_ClearButtonClick(" .. learnSkillNo .. ")")
        ;
        (((self._slot_CombiSkill)[learnSkillCount - 1]).icon):SetEnableDragAndDrop(true)
        Panel_SkillTooltip_SetPosition(learnSkillNo, ((self._slot_CombiSkill)[learnSkillCount - 1]).icon, "SkillBox")
      end
    end
  end
end

-- DECOMPILER ERROR at PC590: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.CombiSkill = function(self, isLearn)
  -- function num : 0_15 , upvalues : skillOldandNew
  if skillOldandNew == false and isLearn == false then
    return 
  end
  local learnSkillCount = ToClient_getLearnFusionSkillCount()
  for index = 0, self._emptyCombiSkillIndex do
    (((self._slot_CombiSkill)[index]).learnButton):SetShow(false)
    ;
    (((self._slot_CombiSkill)[index]).icon):EraseAllEffect()
    ;
    (((self._slot_CombiSkill)[index]).icon):AddEffect("UI_NewSkill01", false, 0, 0)
    ;
    (((self._slot_CombiSkill)[index]).icon):AddEffect("fUI_NewSkill01", false, 0, 0)
  end
  for index = learnSkillCount, self._fusionSlotMaxCount - 1 do
    (((self._slot_CombiSkill)[index]).learnButton):SetShow(true)
    ;
    (((self._slot_CombiSkill)[index]).learnButton):SetIgnore(true)
  end
end

-- DECOMPILER ERROR at PC593: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.initSkillLearnableSlot = function(self)
  -- function num : 0_16
  self.staticBottomBox = (UI.getChildControl)(Panel_Window_Skill, "Static_BottomBox")
  for index = 0, self.learnableSlotShowMaxCount - 1 do
    local slot = {}
    ;
    (SlotSkill.new)(slot, "Learnable_" .. index, self.staticBottomBox, self.slotConfig)
    if slot.learnButton ~= nil then
      (slot.learnButton):SetIgnore(true)
    end
    if slot.icon ~= nil then
      slot:clearSkill()
    end
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.learnableSlots)[index] = slot
  end
end

-- DECOMPILER ERROR at PC596: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.getLineTemplate = function(self, isSlotColumn, isSlotRow, lineType)
  -- function num : 0_17
  local lineDef = nil
  if isSlotColumn and isSlotRow then
    lineDef = (self.template_guideLine).l
  else
    if not isSlotColumn and isSlotRow then
      lineDef = (self.template_guideLine).v
    else
      if isSlotColumn and not isSlotRow then
        lineDef = (self.template_guideLine).h
      else
        lineDef = (self.template_guideLine).s
      end
    end
  end
  return lineDef[lineType]
end

-- DECOMPILER ERROR at PC599: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.Skill_ScrollMove = function(self, moveDirection)
  -- function num : 0_18
  if moveDirection == "up" then
    (((self.frames)[0]):GetVScroll()):SetCtrlPosByInterval(-1)
  else
    if moveDirection == "down" then
      (((self.frames)[0]):GetVScroll()):SetCtrlPosByInterval(1)
    end
  end
  ;
  ((self.frames)[0]):UpdateContentPos()
  HandleMScroll_SkillWindow_ScrollEvent(true)
end

-- DECOMPILER ERROR at PC602: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.SkillCalcPosYByRow = function(self, row)
  -- function num : 0_19
  if row % 2 == 0 then
    return row / 2 * ((self.config).slotGapY + (self.config).emptyGapY) + (self.config).emptyGapY + (self.config).slotStartY
  else
    return (row + 1) / 2 * ((self.config).slotGapY + (self.config).emptyGapY) + (self.config).slotStartY
  end
end

-- DECOMPILER ERROR at PC605: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.SkillCalcPosYByColumn = function(self, col)
  -- function num : 0_20
  if col % 2 == 0 then
    return col / 2 * ((self.config).slotGapX + (self.config).emptyGapX) + (self.config).emptyGapX + (self.config).slotStartX
  else
    return (col + 1) / 2 * ((self.config).slotGapX + (self.config).emptyGapX) + (self.config).slotStartX
  end
end

-- DECOMPILER ERROR at PC608: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.Skill_WindowPosSet = function(self, pos)
  -- function num : 0_21
  local vScroll = ((PaGlobal_Skill.frames)[0]):GetVScroll()
  local contentUseSize = (((PaGlobal_Skill.frames)[0]):GetFrameContent()):GetSizeY() - ((PaGlobal_Skill.frames)[0]):GetSizeY()
  local posPercents = (pos - ((PaGlobal_Skill.frames)[0]):GetSizeY() / 2) / contentUseSize
  vScroll:SetControlPos((math.max)((math.min)(posPercents, 1), 0))
  ;
  ((PaGlobal_Skill.frames)[0]):UpdateContentPos()
end

-- DECOMPILER ERROR at PC612: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.SkillWindowEffect = function(self, row, col, skillNo, isOn)
  -- function num : 0_22 , upvalues : beforSkillNo
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
  do
    if skillTypeStaticWrapper:isValidLocalizing() then
      local posX, posY = self:SkillCalcPosYByColumn(col), self:SkillCalcPosYByRow(row)
      self:Skill_WindowPosSet(posY)
      if beforSkillNo ~= -1 then
        ((((self.slots)[self.combatTabIndex])[beforSkillNo]).mouseOverButton):EraseAllEffect()
        ;
        ((((self.slots)[self.combatTabIndex])[beforSkillNo]).mouseOverButton):SetShow(false)
      end
      if isOn == true then
        ((((self.slots)[self.combatTabIndex])[skillNo]).mouseOverButton):EraseAllEffect()
        ;
        ((((self.slots)[self.combatTabIndex])[skillNo]).mouseOverButton):SetShow(true)
      end
    end
    beforSkillNo = skillNo
  end
end

-- DECOMPILER ERROR at PC615: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.SkillWindow_UpdateClearData = function(self)
  -- function num : 0_23
  self.isPartsSkillReset = true
  local isNewSkillBtn = ((self.radioButtons)[self.awakenTabIndex]):IsCheck()
  local isOldSkillBtn = (((self.radioButtons)[self.combatTabIndex]):IsCheck())
  local slots = nil
  if isNewSkillBtn then
    slots = (self.slots)[self.awakenTabIndex]
  else
    slots = (self.slots)[self.combatTabIndex]
  end
  if slots == nil then
    return 
  end
  for skillNo,slot in pairs(slots) do
    slot:clearSkill()
    ;
    (slot.icon):SetAlpha(1)
    slot.skillNo = skillNo
    local isFGDisable = true
    if slot.iconFGDisabled ~= nil then
      (slot.iconFGDisabled):SetShow(true)
    end
    if slot.iconFG_Passive ~= nil then
      isFGDisable = false
      ;
      (slot.iconFG_Passive):SetShow(true)
    end
    local skillLevelInfo = getSkillLevelInfo(skillNo)
    if skillLevelInfo == nil then
      return 
    end
    if skillLevelInfo._usable then
      local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
      if skillStaticWrapper == nil then
        return 
      end
      if not skillStaticWrapper:isAutoLearnSkillByLevel() and not skillStaticWrapper:isLearnSkillByItem() and skillStaticWrapper:isLastSkill() then
        (slot.iconMinus):SetShow(true)
        ;
        (slot.icon):addInputEvent("Mouse_LUp", "HandleMLUp_SkillWindow_ClearButtonClick(" .. skillNo .. ")")
        if isFGDisable then
          (slot.iconFGDisabled):SetShow(false)
        else
          ;
          (slot.iconFG_Passive):SetShow(false)
        end
      end
    end
  end
  local skillPointInfo = getSkillPointInfo(self.combatTabIndex)
  if skillPointInfo ~= nil then
    (self.staticRemainPoint):SetText(tostring(skillPointInfo._remainPoint .. " / " .. skillPointInfo._acquirePoint))
  end
end

-- DECOMPILER ERROR at PC618: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.SkillWindow_PlayerLearnableSkill = function(self)
  -- function num : 0_24
  local slots = (self.slots)[self.combatTabIndex]
  for skillNo,slot in pairs(slots) do
    local skillLevelInfo = getSkillLevelInfo(skillNo)
    if skillLevelInfo ~= nil and skillLevelInfo._learnable and skillLevelInfo._isLearnByQuest == false then
      return true
    end
    do return false end
  end
  return false
end

-- DECOMPILER ERROR at PC621: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.SkillWindow_LearnButtonClick = function(self, skillNo)
  -- function num : 0_25
  if self.saved_isLearnMode == false then
    return 
  end
  local skillLevelInfo = getSkillLevelInfo(skillNo)
  if skillLevelInfo == nil then
    return 
  end
  if skillLevelInfo._learnable == false then
    return 
  end
  local isSuccess = skillWindow_DoLearn(skillNo)
  audioPostEvent_SystemUi(0, 0)
  if isSuccess then
    audioPostEvent_SystemUi(4, 2)
    ;
    (((self.skillNoSlot)[skillNo]).icon):AddEffect("UI_NewSkill01", false, 0, 0)
    ;
    (((self.skillNoSlot)[skillNo]).icon):AddEffect("fUI_NewSkill01", false, 0, 0)
    ;
    (self.learnedSkillList):push_back(skillNo)
  end
  if ((self.skillNoSlot)[skillNo]).icon == nil then
    return 
  end
  UI_MAIN_checkSkillLearnable()
  if isSkillLearnTutorialClick_check() then
    HandleMLUp_SkillWindow_Close()
  end
end

-- DECOMPILER ERROR at PC624: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.UpdateLearnableSlots = function(self)
  -- function num : 0_26
  self:ClearLearnableSlots()
end

-- DECOMPILER ERROR at PC627: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.ClearLearnableSlots = function(self)
  -- function num : 0_27
  for index,skillSlot in pairs(self.learnableSlots) do
    (skillSlot.icon):SetShow(false)
  end
  self.learnableSlotCount = 0
end

-- DECOMPILER ERROR at PC630: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Skill.SkillWindow_Show = function(self)
  -- function num : 0_28
  HandleMLUp_SkillWindow_OpenForLearn()
  local vScroll = ((self.frames)[0]):GetVScroll()
  vScroll:SetControlPos(self.scrollPos)
  ;
  ((self.frames)[0]):UpdateContentPos()
  HandleMLUp_SkillWindow_UpdateData()
  for index = 1, #self.learnedSkillList do
    local skillNo = (self.learnedSkillList)[index]
    ;
    (((self.skillNoSlot)[skillNo]).icon):AddEffect("UI_NewSkill01", false, 0, 0)
    ;
    (((self.skillNoSlot)[skillNo]).icon):AddEffect("fUI_NewSkill01", false, 0, 0)
  end
  self.learnedSkillList = (Array.new)()
  local classType = (getSelfPlayer()):getClassType()
  if PaGlobal_AwakenSkill.isAwakenWeaponContentsOpen then
    ((self.radioButtons)[self.awakenTabIndex]):SetMonoTone(false)
    ;
    ((self.radioButtons)[self.awakenTabIndex]):SetEnable(true)
  else
    ;
    ((self.radioButtons)[self.awakenTabIndex]):SetMonoTone(true)
    ;
    ((self.radioButtons)[self.awakenTabIndex]):SetEnable(false)
  end
  ConsoleGroupCreate_Panel_Window_Skill()
end

ConsoleGroupCreate_Panel_Window_Skill = function()
  -- function num : 0_29
  Panel_Window_Skill:deleteConsoleUIGroup(0)
  local group_0 = Panel_Window_Skill:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  if PaGlobal_AwakenSkill.isAwakenWeaponContentsOpen then
    group_0:addControl(0, 0, 3, 1, (PaGlobal_Skill.radioButtons)[PaGlobal_Skill.combatTabIndex])
    group_0:addControl(1, 0, 3, 1, (PaGlobal_Skill.radioButtons)[PaGlobal_Skill.awakenTabIndex])
    group_0:addControl(2, 0, 3, 1, PaGlobal_Skill._btn_ResetAllSkill)
  else
    group_0:addControl(0, 0, 2, 1, (PaGlobal_Skill.radioButtons)[PaGlobal_Skill.combatTabIndex])
    group_0:addControl(1, 0, 2, 1, PaGlobal_Skill._btn_ResetAllSkill)
  end
end

FromClient_OnOffCombinationTab = function()
  -- function num : 0_30
  PaGlobal_Skill:initTabControl_Combination(true)
end

registerEvent("FromClient_responseLearnFusionSkill", "FromClient_responseLearnFusionSkill")
registerEvent("FromClient_responseClearFusionSkill", "FromClient_responseClearFusionSkill")
registerEvent("EventSelfPlayerLevelUp", "FromClient_OnOffCombinationTab")

