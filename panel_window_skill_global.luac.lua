-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\skill\panel_window_skill_global.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
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
, awakenDesc = (UI.getChildControl)(Panel_Window_Skill, "StaticText_AwakenWeaponDesc"), _btn_MovieToolTipBG = (UI.getChildControl)(Panel_Window_Skill, "Static_MovieBG"), _btn_MovieToolTipDesc = (UI.getChildControl)(Panel_Window_Skill, "StaticText_MovieToolTip"), _btn_MovieToolTip = (UI.getChildControl)(Panel_Window_Skill, "Button_MovieTooltip"), _btn_MovieToolTip2 = (UI.getChildControl)(Panel_Window_Skill, "Button_MovieTooltip_SpacialCombo"), learnedSkillList = (Array.new)(), isPartsSkillReset = false, saved_isLearnMode = true, scrollPos = 0, skillNoCache = 0, slotTypeCache = 0, tooltipcacheCount = 0, skillLevelBg = (UI.getChildControl)(Panel_Window_Skill, "Static_SkillLevel"), _txt_MentalTip = (UI.getChildControl)(Panel_Window_Skill, "StaticText_Mental_Tip"), _txt_ResourceSaveDesc = (UI.getChildControl)(Panel_Window_Skill, "StaticText_ResourceSaveDesc"), _btn_ResetAllSkill = (UI.getChildControl)(Panel_Window_Skill, "Button_ResetAllSkill"), _btn_CommandLock = (UI.getChildControl)(Panel_Window_Skill, "Button_SkillCommandLock"), _bottomBG = (UI.getChildControl)(Panel_Window_Skill, "Static_BottomBox")}
;
(PaGlobal_Skill._btn_CommandLock):SetShow(false)
local beforSkillNo = -1
-- DECOMPILER ERROR at PC528: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.initialize = function(self)
  -- function num : 0_0 , upvalues : UI_TM
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
  if (self._txt_MentalTip):GetTextSizeY() > 75 then
    Panel_Window_Skill:SetSize(Panel_Window_Skill:GetSizeX(), 670)
    ;
    (self._bottomBG):SetSize((self._bottomBG):GetSizeX(), 95)
    ;
    (self._btn_MovieToolTipBG):SetSize((self._btn_MovieToolTipBG):GetSizeX(), 85)
  else
    Panel_Window_Skill:SetSize(Panel_Window_Skill:GetSizeX(), 650)
    ;
    (self._bottomBG):SetSize((self._bottomBG):GetSizeX(), 75)
    ;
    (self._btn_MovieToolTipBG):SetSize((self._btn_MovieToolTipBG):GetSizeX(), 65)
  end
  self:initControl()
  self:initSkillLearnableSlot()
end

-- DECOMPILER ERROR at PC532: Confused about usage of register: R2 in 'UnsetPending'

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
end

-- DECOMPILER ERROR at PC535: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.initTabControl = function(self, cellTable, parent, container)
  -- function num : 0_2
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

-- DECOMPILER ERROR at PC538: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.initTabControl_Combat = function(self)
  -- function num : 0_3
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

-- DECOMPILER ERROR at PC541: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.initTabControl_AwakeningWeapon = function(self)
  -- function num : 0_4
  local targetFrame = (self.frames)[self.awakenTabIndex]
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.slots)[self.awakenTabIndex] = {}
  local classType = (getSelfPlayer()):getClassType()
  do
    if classType >= 0 then
      local cellTable = getAwakeningWeaponSkillTree(classType)
      self:initTabControl(cellTable, targetFrame:GetFrameContent(), (self.slots)[self.awakenTabIndex])
    end
    targetFrame:UpdateContentScroll()
  end
end

-- DECOMPILER ERROR at PC544: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.initSkillLearnableSlot = function(self)
  -- function num : 0_5
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

-- DECOMPILER ERROR at PC547: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.getLineTemplate = function(self, isSlotColumn, isSlotRow, lineType)
  -- function num : 0_6
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

-- DECOMPILER ERROR at PC550: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.Skill_ScrollMove = function(self, moveDirection)
  -- function num : 0_7
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

-- DECOMPILER ERROR at PC553: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.SkillCalcPosYByRow = function(self, row)
  -- function num : 0_8
  if row % 2 == 0 then
    return row / 2 * ((self.config).slotGapY + (self.config).emptyGapY) + (self.config).emptyGapY + (self.config).slotStartY
  else
    return (row + 1) / 2 * ((self.config).slotGapY + (self.config).emptyGapY) + (self.config).slotStartY
  end
end

-- DECOMPILER ERROR at PC556: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.SkillCalcPosYByColumn = function(self, col)
  -- function num : 0_9
  if col % 2 == 0 then
    return col / 2 * ((self.config).slotGapX + (self.config).emptyGapX) + (self.config).emptyGapX + (self.config).slotStartX
  else
    return (col + 1) / 2 * ((self.config).slotGapX + (self.config).emptyGapX) + (self.config).slotStartX
  end
end

-- DECOMPILER ERROR at PC559: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.Skill_WindowPosSet = function(self, pos)
  -- function num : 0_10
  local vScroll = ((PaGlobal_Skill.frames)[0]):GetVScroll()
  local contentUseSize = (((PaGlobal_Skill.frames)[0]):GetFrameContent()):GetSizeY() - ((PaGlobal_Skill.frames)[0]):GetSizeY()
  local posPercents = (pos - ((PaGlobal_Skill.frames)[0]):GetSizeY() / 2) / contentUseSize
  vScroll:SetControlPos((math.max)((math.min)(posPercents, 1), 0))
  ;
  ((PaGlobal_Skill.frames)[0]):UpdateContentPos()
end

-- DECOMPILER ERROR at PC563: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.SkillWindowEffect = function(self, row, col, skillNo, isOn)
  -- function num : 0_11 , upvalues : beforSkillNo
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
        _PA_LOG("정태�\164", "self.combatTabIndex : " .. tostring(self.combatTabIndex))
        _PA_LOG("정태�\164", "skillNo : " .. tostring(skillNo))
        ;
        ((((self.slots)[self.combatTabIndex])[skillNo]).mouseOverButton):EraseAllEffect()
        ;
        ((((self.slots)[self.combatTabIndex])[skillNo]).mouseOverButton):SetShow(true)
      end
    end
    beforSkillNo = skillNo
  end
end

-- DECOMPILER ERROR at PC566: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.SkillWindow_UpdateClearData = function(self)
  -- function num : 0_12
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

-- DECOMPILER ERROR at PC569: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.SkillWindow_PlayerLearnableSkill = function(self)
  -- function num : 0_13
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

-- DECOMPILER ERROR at PC572: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.SkillWindow_LearnButtonClick = function(self, skillNo)
  -- function num : 0_14
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

-- DECOMPILER ERROR at PC575: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.UpdateLearnableSlots = function(self)
  -- function num : 0_15
  self:ClearLearnableSlots()
end

-- DECOMPILER ERROR at PC578: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.ClearLearnableSlots = function(self)
  -- function num : 0_16
  for index,skillSlot in pairs(self.learnableSlots) do
    (skillSlot.icon):SetShow(false)
    skillSlot:clearSkill()
  end
  self.learnableSlotCount = 0
end

-- DECOMPILER ERROR at PC581: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Skill.SkillWindow_Show = function(self)
  -- function num : 0_17
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
end


