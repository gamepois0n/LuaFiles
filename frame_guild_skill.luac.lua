-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\frame_guild_skill.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local defaultFrameBG_Skill = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_SkillBG")
local _frame_GuildSkill = (UI.getChildControl)(Panel_Guild_Skill, "Frame_GuildSkill")
local _staticText_GuildPoint_Value = (UI.getChildControl)(Panel_Guild_Skill, "StaticText_Point_Value")
local _staticText_GuildPoint_Percent = (UI.getChildControl)(Panel_Guild_Skill, "StaticText_Point_Percent")
local isContentsEnable = ToClient_IsContentsGroupOpen("36")
local GuildSkill = {
slotConfig = {createIcon = true, createEffect = true, createFG = true, createFGDisabled = true, createFG_Passive = true, createLevel = true, createLearnButton = true, 
template = {effect = (UI.getChildControl)(Panel_Guild_Skill, "Static_Icon_Skill_Effect"), iconFG = (UI.getChildControl)(Panel_Guild_Skill, "Static_Icon_FG"), iconFGDisabled = (UI.getChildControl)(Panel_Guild_Skill, "Static_Icon_FG_DISABLE"), iconFG_Passive = (UI.getChildControl)(Panel_Guild_Skill, "Static_Icon_BG"), learnButton = (UI.getChildControl)(Panel_Guild_Skill, "Button_Skill_Point")}
}
, 
config = {slotStartX = 6, slotStartY = 6, slotGapX = 42, slotGapY = 42, emptyGapX = 22, emptyGapY = 18}
, 
slots = {}
, 
skillNoSlot = {}
, lastTabIndex = 0, lastLearnMode = false, controlInitialize = false, 
template_guideLine = {
h = {[3] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_LT"), [4] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_CT"), [5] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_RT"), [6] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_LM"), [7] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_CM"), [8] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_RM"), [9] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_LB"), [10] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_CB"), [11] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_RB"), [12] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_HORI"), [13] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeH_VERTI")}
, 
v = {[3] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_LT"), [4] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_CT"), [5] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_RT"), [6] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_LM"), [7] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_CM"), [8] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_RM"), [9] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_LB"), [10] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_CB"), [11] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_RB"), [12] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_HORI"), [13] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeV_VERTI")}
, 
l = {[3] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_LT"), [4] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_CT"), [5] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_RT"), [6] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_LM"), [7] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_CM"), [8] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_RM"), [9] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_LB"), [10] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_CB"), [11] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_RB"), [12] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_HORI"), [13] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeL_VERTI")}
, 
s = {[3] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_LT"), [4] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_CT"), [5] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_RT"), [6] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_LM"), [7] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_CM"), [8] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_RM"), [9] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_LB"), [10] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_CB"), [11] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_RB"), [12] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_HORI"), [13] = (UI.getChildControl)(Panel_Guild_Skill, "Static_TypeS_VERTI")}
}
, template_arrow_to_left = (UI.getChildControl)(Panel_Guild_Skill, "Static_Arrow_HORI_LEFT"), template_arrow_to_right = (UI.getChildControl)(Panel_Guild_Skill, "Static_Arrow_HORI_RIGHT"), template_arrow_to_top = (UI.getChildControl)(Panel_Guild_Skill, "Static_Arrow_VERTI_TOP"), template_arrow_to_bottom = (UI.getChildControl)(Panel_Guild_Skill, "Static_Arrow_VERTI_BOTTOM"), _progressSkillPoint = (UI.getChildControl)(Panel_Guild_Skill, "Progress2_SkillPointExp")}
GuildSkillFrame_Init = function()
  -- function num : 0_0 , upvalues : defaultFrameBG_Skill, GuildSkill, _frame_GuildSkill
  defaultFrameBG_Skill:MoveChilds(defaultFrameBG_Skill:GetID(), Panel_Guild_Skill)
  ;
  (UI.deletePanel)(Panel_Guild_Skill:GetID())
  Panel_Guild_Skill = nil
  for _,control in pairs((GuildSkill.slotConfig).template) do
    control:SetShow(false)
  end
  _frame_GuildSkill:addInputEvent("Mouse_UpScroll", "GuildSkillFrame_ScrollEvent(true)")
  _frame_GuildSkill:addInputEvent("Mouse_DownScroll", "GuildSkillFrame_ScrollEvent(true)")
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

  GuildSkill.slots = {}
  local cellTable = getGuildSkillTree()
  GuildSkillFrame_InitSkillTreeControl(cellTable, _frame_GuildSkill:GetFrameContent(), GuildSkill.slots)
  _frame_GuildSkill:UpdateContentScroll()
end

GuildSkillFrame_GetLineTemplate = function(isSlotColumn, isSlotRow, lineType)
  -- function num : 0_1 , upvalues : GuildSkill
  local lineDef = nil
  if isSlotColumn and isSlotRow then
    lineDef = (GuildSkill.template_guideLine).l
  else
    if not isSlotColumn and isSlotRow then
      lineDef = (GuildSkill.template_guideLine).v
    else
      if isSlotColumn and not isSlotRow then
        lineDef = (GuildSkill.template_guideLine).h
      else
        lineDef = (GuildSkill.template_guideLine).s
      end
    end
  end
  return lineDef[lineType]
end

GuildSkillFrame_InitSkillTreeControl = function(cellTable, parent, container)
  -- function num : 0_2 , upvalues : GuildSkill
  local self = GuildSkill
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  local startY = (GuildSkill.config).slotStartY
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
        local skillTypeStatic = skillTypeStaticWrapper:get()
        -- DECOMPILER ERROR at PC66: Confused about usage of register: R22 in 'UnsetPending'

        if skillTypeStatic:isActiveSkill() then
          (self.slotConfig).createFG = skillTypeStatic._isSettableQuickSlot
          -- DECOMPILER ERROR at PC70: Confused about usage of register: R22 in 'UnsetPending'

          ;
          (self.slotConfig).createFGDisabled = (self.slotConfig).createFG
          -- DECOMPILER ERROR at PC75: Confused about usage of register: R22 in 'UnsetPending'

          ;
          (self.slotConfig).createFG_Passive = not (self.slotConfig).createFG
          do
            local slot = {}
            ;
            (SlotSkill.new)(slot, skillNo, parent, self.slotConfig)
            slot:setPos(startX, startY)
            if slot.learnButton ~= nil then
              (slot.learnButton):SetIgnore(true)
            end
            if slot.icon ~= nil then
              (slot.icon):addInputEvent("Mouse_LUp", "GuildSkillFrame_LearnButtonClick(" .. skillNo .. ")")
              ;
              (slot.icon):addInputEvent("Mouse_On", "GuildSkillFrame_OverEvent(" .. skillNo .. ",false, \"GuildSkillBox\")")
              ;
              (slot.icon):addInputEvent("Mouse_Out", "GuildSkillFrame_OverEventHide(" .. skillNo .. ",\"GuildSkillBox\")")
              Panel_SkillTooltip_SetPosition(skillNo, slot.icon, "GuildSkillBox")
            end
            slot:setSkillTypeStatic(skillTypeStaticWrapper)
            container[skillNo] = slot
            if cell:isLineType() then
              local template = GuildSkillFrame_GetLineTemplate(isSlotColumn, isSlotRow, cell._cellType)
              if template ~= nil then
                local line = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, parent, "Static_Line_" .. col .. "_" .. row)
                CopyBaseProperty(template, line)
                line:SetPosX(startX)
                line:SetPosY(startY)
                line:SetIgnore(true)
                line:SetShow(true)
              end
            end
            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC171: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  -- DECOMPILER ERROR: 11 unprocessed JMP targets
end

GuildSkillFrame_Show = function()
  -- function num : 0_3 , upvalues : defaultFrameBG_Skill, _frame_GuildSkill
  defaultFrameBG_Skill:SetShow(true)
  local vScroll = _frame_GuildSkill:GetVScroll()
  vScroll:SetControlPos(0)
  _frame_GuildSkill:UpdateContentPos()
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  GuildSkillFrame_UpdateData(isGuildMaster)
end

GuildSkillFrame_Hide = function()
  -- function num : 0_4 , upvalues : defaultFrameBG_Skill, GuildSkill
  if defaultFrameBG_Skill:GetShow() == true then
    defaultFrameBG_Skill:SetShow(false)
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

    GuildSkill.lastLearnMode = false
    Panel_SkillTooltip_Hide()
  end
end

GuildSkillFrame_Update = function()
  -- function num : 0_5 , upvalues : defaultFrameBG_Skill, _frame_GuildSkill
  if defaultFrameBG_Skill:GetShow() == false then
    return 
  end
  _frame_GuildSkill:UpdateContentPos()
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  GuildSkillFrame_UpdateData(isGuildMaster)
  _frame_GuildSkill:UpdateContentScroll()
end

GuildSkillFrame_UpdateData = function(isLearnMode, doForce)
  -- function num : 0_6 , upvalues : GuildSkill, _staticText_GuildPoint_Value, _staticText_GuildPoint_Percent
  local self = GuildSkill
  local skillPointInfo = getSkillPointInfo(3)
  local skillPointPercent = (string.format)("%.0f", skillPointInfo._currentExp / skillPointInfo._nextLevelExp * 100)
  _staticText_GuildPoint_Value:SetText(tostring(skillPointInfo._remainPoint))
  if tonumber(skillPointPercent) > 100 then
    skillPointPercent = 100
  end
  _staticText_GuildPoint_Percent:SetText("( " .. skillPointPercent .. "% )")
  _staticText_GuildPoint_Percent:SetPosX(_staticText_GuildPoint_Value:GetPosX() + _staticText_GuildPoint_Value:GetSizeX() + 10)
  self.lastLearnMode = isLearnMode
  ;
  (GuildSkill._progressSkillPoint):SetProgressRate(skillPointInfo._currentExp / skillPointInfo._nextLevelExp * 100)
  local slots = self.slots
  for skillNo,slot in pairs(slots) do
    local skillLevelInfo = getSkillLevelInfo(skillNo)
    if skillLevelInfo ~= nil then
      local resultAble = slot:setSkill(skillLevelInfo, skillLevelInfo._learnable)
      local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
      if not skillLevelInfo._learnable and skillLevelInfo._usable and (skillTypeStaticWrapper:get()):isActiveSkill() then
        (slot.icon):addInputEvent("Mouse_RUp", "GuildSkillFrame_Use(" .. skillNo .. ")")
      else
        ;
        (slot.icon):addInputEvent("Mouse_PressMove", "")
      end
      if skillTypeStaticWrapper:isValidLocalizing() then
        (slot.icon):SetShow(true)
        ;
        (slot.icon):SetIgnore(false)
        ;
        (slot.icon):SetMonoTone(false)
      else
        ;
        (slot.icon):SetShow(false)
        ;
        (slot.icon):SetIgnore(true)
        ;
        (slot.icon):SetMonoTone(true)
      end
    end
    do
      do
        -- DECOMPILER ERROR at PC124: Confused about usage of register: R12 in 'UnsetPending'

        ;
        (self.skillNoSlot)[skillNo] = slot
        -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
end

GuildSkillFrame_LearnButtonClick = function(skillNo)
  -- function num : 0_7 , upvalues : GuildSkill
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  if isGuildMaster == false then
    return 
  end
  local accumulateTax_s32 = Int64toInt32(myGuildInfo:getAccumulateTax())
  local accumulateCost_s32 = Int64toInt32(myGuildInfo:getAccumulateGuildHouseCost())
  if accumulateTax_s32 > 0 or accumulateCost_s32 > 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_TAXFIRST"))
    return 
  end
  local skillLevelInfo = getSkillLevelInfo(skillNo)
  if skillLevelInfo == nil then
    return 
  end
  if skillLevelInfo._learnable == false then
    return 
  end
  local doLearnGuildSkill = function()
    -- function num : 0_7_0 , upvalues : GuildSkill, skillNo
    local self = GuildSkill
    local isSuccess = ToClient_RequestLearnGuildSkill(skillNo)
    audioPostEvent_SystemUi(0, 0)
    if isSuccess then
      (((self.skillNoSlot)[skillNo]).icon):AddEffect("UI_NewSkill01", false, 0, 0)
      ;
      (((self.skillNoSlot)[skillNo]).icon):AddEffect("fUI_NewSkill01", false, 0, 0)
    end
    return 
  end

  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_SKILLSTUDY")
  local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = doLearnGuildSkill, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData, "middle")
end

GuildSkillFrame_Use = function(skillNo)
  -- function num : 0_8
  ToClient_RequestUseGuildSkill(skillNo)
end

GuildSkillFrame_StartDrag = function(skillNo)
  -- function num : 0_9
  local skillLevelInfo = getSkillLevelInfo(skillNo)
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
  if skillLevelInfo ~= nil and skillTypeStaticWrapper ~= nil then
    DragManager:setDragInfo(Panel_Window_Guild, nil, (skillLevelInfo._skillKey):get(), "Icon/" .. skillTypeStaticWrapper:getIconPath(), Skill_GroundClick, nil)
  end
end

GuildSkillFrame_GroundClick = function()
  -- function num : 0_10
end

local skillNoCache = 0
local slotTypeCache = 0
local tooltipcacheCount = 0
GuildSkillFrame_OverEventHide = function(skillNo, SlotType)
  -- function num : 0_11 , upvalues : skillNoCache, slotTypeCache, tooltipcacheCount
  if skillNoCache == skillNo and slotTypeCache == SlotType then
    tooltipcacheCount = tooltipcacheCount - 1
  else
    tooltipcacheCount = 0
  end
  if tooltipcacheCount <= 0 then
    Panel_SkillTooltip_Hide()
  end
end

GuildSkillFrame_OverEvent = function(skillNo, isShowNextLevel, SlotType)
  -- function num : 0_12 , upvalues : skillNoCache, slotTypeCache, tooltipcacheCount, GuildSkill, _frame_GuildSkill
  if skillNoCache == skillNo and slotTypeCache == SlotType then
    tooltipcacheCount = tooltipcacheCount + 1
  else
    skillNoCache = skillNo
    slotTypeCache = SlotType
    tooltipcacheCount = 1
  end
  Panel_SkillTooltip_Show(skillNo, false, SlotType)
  ;
  (((GuildSkill.skillNoSlot)[skillNo]).icon):EraseAllEffect()
  if SlotType == "SkillBoxBottom" then
    local selectedSlot = (UI.getChildControl)(_frame_GuildSkill:GetFrameContent(), "StaticSkill_" .. skillNo)
    local vScroll = _frame_GuildSkill:GetVScroll()
    vScroll:SetControlPos(selectedSlot:GetPosY() / ((_frame_GuildSkill:GetFrameContent()):GetSizeY() - (vScroll:GetControlButton()):GetSizeY()))
    _frame_GuildSkill:UpdateContentPos()
  end
end

GuildSkillFrame_ScrollEvent = function(isShow)
  -- function num : 0_13 , upvalues : _frame_GuildSkill
  do
    local vScroll = _frame_GuildSkill:GetVScroll()
    if isShow then
    end
  end
end


