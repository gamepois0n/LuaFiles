-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\skill\panel_window_skill_event.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
LoadComplete_SkillWindow_Initialize = function()
  -- function num : 0_0
  PaGlobal_Skill:initialize()
  PaGlobal_AwakenSkill:initalize()
  Skill_RegistEventHandler()
end

SkillEvent_SkillWindow_ControlInitialize = function()
  -- function num : 0_1 , upvalues : UI_TM
  local self = PaGlobal_Skill
  if self.controlInitialize then
    return 
  end
  self:initTabControl_Combat()
  self:initTabControl_AwakeningWeapon()
  self:initTabControl_Combination()
  ;
  (((self.slotConfig).template).effect):SetShow(false)
  ;
  (((self.slotConfig).template).iconFG):SetShow(false)
  ;
  (((self.slotConfig).template).iconFGDisabled):SetShow(false)
  ;
  (((self.slotConfig).template).learnButton):SetShow(false)
  ;
  (((self.slotConfig).template).lockIcon):SetShow(false)
  ;
  ((self.radioButtons)[self.combatTabIndex]):SetCheck(true)
  ;
  ((self.radioButtons)[self.awakenTabIndex]):SetCheck(false)
  HandleMLUp_SkillWindow_UpdateData(self.combatTabIndex, false, true)
  ;
  (self._btn_MovieToolTipDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._btn_MovieToolTipDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SKILL_MOVIETOOLTIP"))
  self.controlInitialize = true
end

SkillEvent_SkillWindow_LearnQuest = function(skillNo)
  -- function num : 0_2
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
  if skillTypeStaticWrapper:isValidLocalizing() == false then
    return 
  end
  local self = PaGlobal_Skill
  audioPostEvent_SystemUi(0, 0)
  if (self.skillNoSlot)[skillNo] ~= nil then
    audioPostEvent_SystemUi(4, 2)
    ;
    (((self.skillNoSlot)[skillNo]).icon):AddEffect("UI_NewSkill01", false, 0, 0)
    ;
    (((self.skillNoSlot)[skillNo]).icon):AddEffect("fUI_NewSkill01", false, 0, 0)
  end
  UI_MAIN_checkSkillLearnable()
end

SkillEvent_SkillWindow_ClearSkill = function(skillPointType)
  -- function num : 0_3
  local strTemp1, strTemp2 = nil
  if skillPointType == 0 then
    strTemp1 = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SKILL_CLEAR_COMBAT_SKILL_TITLE")
    strTemp2 = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SKILL_CLEAR_COMBAT_SKILL_MESSAGE")
  else
    strTemp1 = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SKILL_CLEAR_PRODUCT_SKILL_TITLE")
    strTemp2 = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SKILL_CLEAR_PRODUCT_SKILL_MESSAGE")
  end
  local messageboxData = {title = strTemp1, content = strTemp2, functionYes = Skill_ClearSkill_ConfirmFromMessageBox, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

SkillEvent_SkillWindow_ClearSkillsByPoint = function()
  -- function num : 0_4
  HandleMLUp_SkillWindow_UpdateData()
end

HandleMLUp_SkillWindow_UpdateData = function(tabIndex, isLearnMode, doForce)
  -- function num : 0_5
  local self = PaGlobal_Skill
  if not tabIndex then
    tabIndex = self.lastTabIndex
  end
  self.tabIndex = tabIndex
  if not isLearnMode then
    isLearnMode = self.lastLearnMode
  end
  if not doForce then
    doForce = false
  end
  if not doForce and not Panel_Window_Skill:GetShow() then
    return 
  end
  self.lastTabIndex = tabIndex
  self.lastLearnMode = isLearnMode
  for index,frame in pairs(self.frames) do
    do
      if tabIndex == index then
        frame:SetShow(true)
        ;
        ((PaGlobal_Skill.radioButtons)[index]):SetCheck(true)
      else
        do
          frame:SetShow(false)
          ;
          ((PaGlobal_Skill.radioButtons)[index]):SetCheck(false)
          -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  self.learnableSlotsSortList = {}
  self.learnableSlotsSortListCount = 0
  local slots = (self.slots)[tabIndex]
  for skillNo,slot in pairs(slots) do
    (slot.iconMinus):SetShow(false)
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "HandleMLUp_SkillWindow_LearnButtonClick(" .. skillNo .. ")")
    ;
    (slot.icon):EraseAllEffect()
    local skillLevelInfo = getSkillLevelInfo(skillNo)
    if skillLevelInfo ~= nil then
      self.saved_isLearnMode = isLearnMode
      local resultAble = slot:setSkill(skillLevelInfo, isLearnMode)
      -- DECOMPILER ERROR at PC86: Confused about usage of register: R12 in 'UnsetPending'

      if resultAble == false then
        (self.learnableSlotsSortList)[self.learnableSlotsSortListCount] = skillNo
        self.learnableSlotsSortListCount = self.learnableSlotsSortListCount + 1
      end
      local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
      if skillLevelInfo._learnable == false and skillLevelInfo._usable and (skillTypeStaticWrapper:get())._isSettableQuickSlot then
        (slot.icon):addInputEvent("Mouse_PressMove", "HandleMLUp_SkillWindow_StartDrag(" .. skillNo .. ")")
        ;
        (slot.icon):SetEnableDragAndDrop(true)
      else
        ;
        (slot.icon):addInputEvent("Mouse_PressMove", "")
        ;
        (slot.icon):SetEnableDragAndDrop(false)
      end
      local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
      if skillStaticWrapper ~= nil then
        local changeTextureLockIcon = function(isBlockSkill)
    -- function num : 0_5_0 , upvalues : slot
    if isBlockSkill then
      (slot.lockIcon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 235, 247, 258, 275)
      ;
      ((slot.lockIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.lockIcon):setRenderTexture((slot.lockIcon):getBaseTexture())
      ;
      (slot.lockIcon):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 259, 247, 282, 275)
      ;
      ((slot.lockIcon):getOnTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.lockIcon):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 283, 247, 306, 275)
      ;
      ((slot.lockIcon):getClickTexture()):setUV(x1, y1, x2, y2)
    else
      do
        ;
        (slot.lockIcon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 235, 218, 258, 246)
        ;
        ((slot.lockIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (slot.lockIcon):setRenderTexture((slot.lockIcon):getBaseTexture())
        ;
        (slot.lockIcon):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 259, 218, 282, 246)
        ;
        ((slot.lockIcon):getOnTexture()):setUV(x1, y1, x2, y2)
        ;
        (slot.lockIcon):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 283, 218, 306, 246)
        ;
        ((slot.lockIcon):getClickTexture()):setUV(x1, y1, x2, y2)
      end
    end
  end

        local skillTypeStaticStatusWrapper = skillStaticWrapper:getSkillTypeStaticStatusWrapper()
        if skillLevelInfo._learnable == false and skillLevelInfo._usable and skillTypeStaticStatusWrapper:isSkillCommandCheck() then
          (slot.lockIcon):SetShow(true)
          local isBlockSkill = ToClient_isBlockSkillCommand(skillLevelInfo._skillKey)
          changeTextureLockIcon(isBlockSkill)
          ;
          (slot.lockIcon):addInputEvent("Mouse_LUp", "Request_SkillCommandLock(" .. skillNo .. ")")
          ;
          (slot.lockIcon):addInputEvent("Mouse_On", "SkillCommandTooltip(" .. skillNo .. ", " .. tabIndex .. ", true )")
          ;
          (slot.lockIcon):addInputEvent("Mouse_Out", "SkillCommandTooltip(" .. skillNo .. ", " .. tabIndex .. ", false )")
          if not isBlockSkill then
            (slot.lockIcon):SetShow(false)
          end
        else
          do
            do
              do
                ;
                (slot.lockIcon):SetShow(false)
                ;
                (slot.lockIcon):addInputEvent("Mouse_LUp", "")
                -- DECOMPILER ERROR at PC201: Confused about usage of register: R11 in 'UnsetPending'

                ;
                (self.skillNoSlot)[skillNo] = slot
                -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC203: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  self:UpdateLearnableSlots()
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    (self.staticRemainPoint):SetShow(false)
    ;
    (self.staticSkillLevel):SetShow(false)
    ;
    (self.progressSkillExp):SetShow(false)
  else
    ;
    (self.staticSkillLevel):SetShow(false)
    ;
    (self.progressSkillExp):SetShow(false)
    local skillPointInfo = getSkillPointInfo(0)
    if skillPointInfo ~= nil then
      (self.staticRemainPoint):SetText(tostring(skillPointInfo._remainPoint .. " / " .. skillPointInfo._acquirePoint))
      ;
      (self.staticRemainPoint):SetPosX((self.textSkillPoint):GetPosX() + (self.textSkillPoint):GetTextSizeX() + 10)
    end
  end
  do
    if self.isPartsSkillReset then
      self:SkillWindow_UpdateClearData()
    end
    ;
    (self.awakenDesc):SetShow(false)
    PaGlobal_Skill:addConsoleUIControl(tabIndex)
  end
end

Request_SkillCommandLock = function(skillNo)
  -- function num : 0_6
  local skillLevelInfo = getSkillLevelInfo(skillNo)
  if skillLevelInfo ~= nil then
    local isBlockSkill = ToClient_isBlockSkillCommand(skillLevelInfo._skillKey)
    if isBlockSkill then
      ToClient_enableSkillCommand(skillLevelInfo._skillKey)
    else
      ToClient_blockSkillCommand(skillLevelInfo._skillKey)
    end
    local changeTextureLockIcon = function(isBlockSkill)
    -- function num : 0_6_0 , upvalues : skillNo
    local slot = (PaGlobal_Skill.skillNoSlot)[skillNo]
    if isBlockSkill then
      (slot.lockIcon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 235, 247, 258, 275)
      ;
      ((slot.lockIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.lockIcon):setRenderTexture((slot.lockIcon):getBaseTexture())
      ;
      (slot.lockIcon):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 259, 247, 282, 275)
      ;
      ((slot.lockIcon):getOnTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.lockIcon):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 283, 247, 306, 275)
      ;
      ((slot.lockIcon):getClickTexture()):setUV(x1, y1, x2, y2)
    else
      do
        ;
        (slot.lockIcon):ChangeTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 235, 218, 258, 246)
        ;
        ((slot.lockIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (slot.lockIcon):setRenderTexture((slot.lockIcon):getBaseTexture())
        ;
        (slot.lockIcon):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 259, 218, 282, 246)
        ;
        ((slot.lockIcon):getOnTexture()):setUV(x1, y1, x2, y2)
        ;
        (slot.lockIcon):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Skill/Skill_ui_03.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(slot.lockIcon, 283, 218, 306, 246)
        ;
        ((slot.lockIcon):getClickTexture()):setUV(x1, y1, x2, y2)
      end
    end
  end

    changeTextureLockIcon(not isBlockSkill)
    TooltipSimple_Hide()
  end
end

SkillCommandTooltip = function(skillNo, tabIndex, isShow)
  -- function num : 0_7
  if not isShow then
    local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
    local skillTypeStaticStatusWrapper = skillStaticWrapper:getSkillTypeStaticStatusWrapper()
    local skillLevelInfo = getSkillLevelInfo(skillNo)
    do
      do
        if skillLevelInfo._learnable == false and skillLevelInfo._usable and skillTypeStaticStatusWrapper:isSkillCommandCheck() then
          local isBlockSkill = ToClient_isBlockSkillCommand(skillLevelInfo._skillKey)
          if not isBlockSkill then
            (((PaGlobal_Skill.skillNoSlot)[skillNo]).lockIcon):SetShow(false)
          end
        end
        TooltipSimple_Hide()
        do return  end
        local skillLevelInfo = getSkillLevelInfo(skillNo)
        if skillLevelInfo ~= nil then
          local name, desc, uiControl = nil, nil, nil
          local isBlockSkill = ToClient_isBlockSkillCommand(skillLevelInfo._skillKey)
          if isBlockSkill then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_SKILL_COMMANDLOCK_TITLE")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_SKILL_COMMANDLOCK_DESC")
          else
            name = PAGetString(Defines.StringSheet_GAME, "LUA_SKILL_COMMANDUNLOCK_TITLE")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_SKILL_COMMANDUNLOCK_DESC")
          end
          uiControl = (((PaGlobal_Skill.slots)[tabIndex])[skillNo]).lockIcon
          TooltipSimple_Show(uiControl, name, desc)
        end
      end
    end
  end
end

HandleMLUp_SkillWindow_OpenForLearn = function()
  -- function num : 0_8
  local self = PaGlobal_Skill
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  self.saved_isLearnMode = true
  if not Panel_Window_Skill:IsShow() then
    (UIAni.fadeInSCRDialog_Down)(Panel_Window_Skill)
    Panel_Window_Skill:SetShow(true, IsAniUse())
    if screenSizeX <= 1400 then
      Panel_Window_Skill:SetPosX(screenSizeX / 2 - Panel_Window_Skill:GetSizeX() / 2 - 100)
    else
      Panel_Window_Skill:SetPosX(screenSizeX / 2 - Panel_Window_Skill:GetSizeX() / 2 - 150)
    end
    Panel_Window_Skill:SetPosY(screenSizeY / 2 - Panel_Window_Skill:GetSizeY() / 2)
    EnableSkillShowFunc()
    Panel_EnableSkill_SetPosition()
    self:OpenLearnAni1()
    self:OpenLearnAni2()
  end
  HandleMLUp_SkillWindow_UpdateData(self.tabIndex, true)
  local combatCheck = ((self.radioButtons)[self.combatTabIndex]):IsCheck()
  if combatCheck then
    ((self.radioButtons)[self.combatTabIndex]):SetCheck(true)
    ;
    ((self.radioButtons)[self.awakenTabIndex]):SetCheck(false)
    HandleMLUp_SkillWindow_UpdateData(self.combatTabIndex)
  else
    ;
    ((self.radioButtons)[self.combatTabIndex]):SetCheck(false)
    ;
    ((self.radioButtons)[self.awakenTabIndex]):SetCheck(true)
    HandleMLUp_SkillWindow_UpdateData(self.awakenTabIndex)
  end
  FGlobal_SetUrl_Tooltip_SkillForLearning()
end

HandleMLUp_SkillWindow_Close = function(isManualClick)
  -- function num : 0_9
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  if Panel_Window_Skill:IsShow() then
    PaGlobal_Skill.isPartsSkillReset = false
    local self = PaGlobal_Skill
    self.lastLearnMode = true
    self.saved_isLearnMode = true
    Panel_SkillTooltip_Hide()
    UIMain_SkillPointUpdateRemove()
    Panel_Window_Skill:SetShow(false, true)
    EnableSkillShowFunc()
    PaGlobal_SkillCombination:close()
    Panel_Scroll:SetShow(false, false)
    if Panel_EnableSkill:IsShow() then
      EnableSkillShowFunc()
    end
  end
  do
    for _,value in pairs(PaGlobal_Skill.skillNoSlot) do
      (value.icon):EraseAllEffect()
    end
    HelpMessageQuestion_Out()
    local vScroll = ((PaGlobal_Skill.frames)[0]):GetVScroll()
    -- DECOMPILER ERROR at PC56: Confused about usage of register: R2 in 'UnsetPending'

    PaGlobal_Skill.scrollPos = vScroll:GetControlPos()
    FGlobal_ResetUrl_Tooltip_SkillForLearning()
    TooltipSimple_Hide()
  end
end

HandleMOver_SkillWindow_ToolTipHide = function(skillNo, SlotType, isFusion)
  -- function num : 0_10
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  if PaGlobal_Skill.skillNoCache == skillNo and PaGlobal_Skill.slotTypeCache == SlotType then
    PaGlobal_Skill.tooltipcacheCount = PaGlobal_Skill.tooltipcacheCount - 1
  else
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R3 in 'UnsetPending'

    PaGlobal_Skill.tooltipcacheCount = 0
  end
  if PaGlobal_Skill.tooltipcacheCount <= 0 then
    Panel_SkillTooltip_Hide()
  end
  for _,value in pairs(PaGlobal_Skill.skillNoSlot) do
    (value.iconMinus):SetShow(false)
  end
  if not Panel_Tooltip_SimpleText:GetShow() then
    local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
    local skillTypeStaticStatusWrapper = skillStaticWrapper:getSkillTypeStaticStatusWrapper()
    local skillLevelInfo = getSkillLevelInfo(skillNo)
    if skillLevelInfo._learnable == false and skillLevelInfo._usable and skillTypeStaticStatusWrapper:isSkillCommandCheck() and isFusion == false then
      local isBlockSkill = ToClient_isBlockSkillCommand(skillLevelInfo._skillKey)
      if not isBlockSkill then
        (((PaGlobal_Skill.skillNoSlot)[skillNo]).lockIcon):SetShow(false)
      end
    end
  end
end

HandleMOver_SkillWindow_ToolTipShow = function(skillNo, isShowNextLevel, SlotType, isFusion)
  -- function num : 0_11
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R4 in 'UnsetPending'

  if PaGlobal_Skill.skillNoCache == skillNo and PaGlobal_Skill.slotTypeCache == SlotType then
    PaGlobal_Skill.tooltipcacheCount = PaGlobal_Skill.tooltipcacheCount + 1
  else
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

    PaGlobal_Skill.skillNoCache = skillNo
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R4 in 'UnsetPending'

    PaGlobal_Skill.slotTypeCache = SlotType
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R4 in 'UnsetPending'

    PaGlobal_Skill.tooltipcacheCount = 1
  end
  Panel_SkillTooltip_Show(skillNo, false, SlotType)
  if isFusion == false then
    (((PaGlobal_Skill.skillNoSlot)[skillNo]).icon):EraseAllEffect()
  end
  do
    if SlotType == "SkillBoxBottom" then
      local selectedSlot = (UI.getChildControl)(((PaGlobal_Skill.frames)[0]):GetFrameContent(), "StaticSkill_" .. skillNo)
      PaGlobal_Skill:Skill_WindowPosSet(selectedSlot:GetPosY())
    end
    local skillLevelInfo = getSkillLevelInfo(skillNo)
    if skillLevelInfo == nil then
      return 
    end
    if isFusion then
      return 
    end
    if skillLevelInfo._usable then
      local isNewSkillBtn = (((PaGlobal_Skill.radioButtons)[PaGlobal_Skill.awakenTabIndex]):IsCheck())
      local slots = nil
      if isNewSkillBtn then
        slots = (PaGlobal_Skill.slots)[PaGlobal_Skill.awakenTabIndex]
      else
        slots = (PaGlobal_Skill.slots)[PaGlobal_Skill.combatTabIndex]
      end
      local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
      if skillStaticWrapper == nil then
        return 
      end
      if not skillStaticWrapper:isAutoLearnSkillByLevel() and not skillStaticWrapper:isLearnSkillByItem() and skillStaticWrapper:isLastSkill() then
        ((slots[skillNo]).iconMinus):SetShow(true)
        ;
        ((slots[skillNo]).icon):addInputEvent("Mouse_RUp", "HandleMLUp_SkillWindow_ClearButtonClick(" .. skillNo .. ")")
        Panel_SkillTooltip_Show(skillNo, false, SlotType, nil, true)
      end
    end
    do
      local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
      local skillTypeStaticStatusWrapper = skillStaticWrapper:getSkillTypeStaticStatusWrapper()
      if skillLevelInfo._learnable == false and skillLevelInfo._usable and skillTypeStaticStatusWrapper:isSkillCommandCheck() then
        (((PaGlobal_Skill.skillNoSlot)[skillNo]).lockIcon):SetShow(true)
      end
    end
  end
end

HandleMLUp_SkillWindow_LearnButtonClick = function(skillNo)
  -- function num : 0_12
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
  if skillTypeStaticWrapper == nil then
    return 
  end
  local skillLevelInfo = getSkillLevelInfo(skillNo)
  if skillLevelInfo == nil then
    return 
  end
  if skillLevelInfo._learnable == false then
    return 
  end
  local DolearnSkill = function()
    -- function num : 0_12_0 , upvalues : skillNo
    PaGlobal_Skill:SkillWindow_LearnButtonClick(skillNo)
    EnableSkillWindow_EffectOff()
  end

  local skillType = skillTypeStaticWrapper:requiredEquipType()
  if skillType == 55 then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SKILL_SKILLTYPE_MEMO1")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = DolearnSkill, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      if skillType == 56 then
        local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SKILL_SKILLTYPE_MEMO2")
        local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = DolearnSkill, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData)
      else
        do
          DolearnSkill()
        end
      end
    end
  end
end

HandleMLUp_SkillWindow_ClearButtonClick = function(skillNo)
  -- function num : 0_13
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local partlySkillReset = function()
    -- function num : 0_13_0 , upvalues : skillNo
    ToClient_RequestClearSkillPartly(skillNo)
    -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

    PaGlobal_Skill.isPartsSkillReset = false
  end

  partlySkillReset()
end

HandleMLUp_SkillWindow_StartDrag = function(skillNo)
  -- function num : 0_14
  if (Defines.UIMode).eUIMode_NpcDialog == GetUIMode() then
    return 
  end
  local skillLevelInfo = getSkillLevelInfo(skillNo)
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
  if skillLevelInfo ~= nil and skillTypeStaticWrapper ~= nil then
    DragManager:setDragInfo(Panel_Window_Skill, nil, (skillLevelInfo._skillKey):get(), "Icon/" .. skillTypeStaticWrapper:getIconPath(), Skill_GroundClick, nil)
  end
end

HandleMScroll_SkillWindow_ScrollEvent = function(isShow)
  -- function num : 0_15
  local vScroll = ((PaGlobal_Skill.frames)[0]):GetVScroll()
  if isShow then
    (UIScrollButton.ScrollButtonEvent)(false, Panel_Window_Skill, (PaGlobal_Skill.frames)[0], vScroll)
  end
end

Skill_GroundClick = function(whereType, skillKey)
  -- function num : 0_16
  if isUseNewQuickSlot() then
    FGlobal_SetNewQuickSlot_BySkillGroundClick(skillKey)
  end
end

Skill_ClearSkill_ConfirmFromMessageBox = function()
  -- function num : 0_17
  skillWindow_ClearSkill()
  if ((PaGlobal_Skill.radioButtons)[PaGlobal_Skill.combatTabIndex]):IsCheck() then
    HandleMLUp_SkillWindow_UpdateData(PaGlobal_Skill.combatTabIndex)
  else
    HandleMLUp_SkillWindow_UpdateData(PaGlobal_Skill.awakenTabIndex)
  end
end

Skill_RegistEventHandler = function()
  -- function num : 0_18
  local vScroll = ((PaGlobal_Skill.frames)[0]):GetVScroll()
  vScroll:addInputEvent("Mouse_LDown", "HandleMScroll_SkillWindow_ScrollEvent(true)")
  ;
  (PaGlobal_Skill.buttonClose):addInputEvent("Mouse_LUp", "HandleMLUp_SkillWindow_Close( true )")
  ;
  (PaGlobal_Skill._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowSkill\" )")
  ;
  (PaGlobal_Skill._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelWindowSkill\", \"true\")")
  ;
  (PaGlobal_Skill._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelWindowSkill\", \"false\")")
  ;
  ((PaGlobal_Skill.frames)[0]):addInputEvent("Mouse_UpScroll", "HandleMScroll_SkillWindow_ScrollEvent(true)")
  ;
  ((PaGlobal_Skill.frames)[0]):addInputEvent("Mouse_DownScroll", "HandleMScroll_SkillWindow_ScrollEvent(true)")
  ;
  ((PaGlobal_Skill.frames)[0]):addInputEvent("Mouse_On", "HandleMScroll_SkillWindow_ScrollEvent(true)")
  ;
  ((PaGlobal_Skill.frames)[0]):addInputEvent("Mouse_Out", "HandleMScroll_SkillWindow_ScrollEvent(false)")
  ;
  (PaGlobal_Skill._btn_MovieToolTip):addInputEvent("Mouse_LUp", "Panel_Window_SkillGuide_ShowToggle()")
  ;
  (PaGlobal_Skill._btn_MovieToolTip2):addInputEvent("Mouse_LUp", "Panel_Window_SkillGuide_ShowToggle()")
  ;
  ((PaGlobal_Skill.radioButtons)[PaGlobal_Skill.combatTabIndex]):addInputEvent("Mouse_LUp", "HandleMLUp_SkillWindow_UpdateData(" .. PaGlobal_Skill.combatTabIndex .. ")")
  ;
  ((PaGlobal_Skill.radioButtons)[PaGlobal_Skill.awakenTabIndex]):addInputEvent("Mouse_LUp", "HandleMLUp_SkillWindow_UpdateData(" .. PaGlobal_Skill.awakenTabIndex .. ")")
  Panel_Window_Skill:RegisterShowEventFunc(true, "Skill_ShowAni()")
  Panel_Window_Skill:RegisterShowEventFunc(false, "Skill_HideAni()")
  ;
  (PaGlobal_Skill._btn_ResetAllSkill):addInputEvent("Mouse_LUp", "SkillEvent_SkillWindow_ClearSkill(" .. 0 .. ")")
  ;
  (PaGlobal_Skill._btn_ResetAllSkill):addInputEvent("Mouse_On", "SkillEvent_ResetTooltip( true )")
  ;
  (PaGlobal_Skill._btn_ResetAllSkill):addInputEvent("Mouse_Out", "SkillEvent_ResetTooltip()")
end

SkillEvent_ResetTooltip = function(isShow)
  -- function num : 0_19
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local uiControl = PaGlobal_Skill._btn_ResetAllSkill
  local name = ""
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_SKILL_RESETBUTTON_TOOLTIPDESC")
  TooltipSimple_Show(uiControl, name, desc)
end

SkillEvent_SkillWindow_ClearSkillMessage = function()
  -- function num : 0_20
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILL_RESETSUCCESS"))
  HandleMLUp_SkillWindow_UpdateData()
end

Skill_RegistMessageHandler = function()
  -- function num : 0_21
  registerEvent("FromClient_luaLoadComplete", "LoadComplete_SkillWindow_Initialize")
  registerEvent("EventSkillWindowInit", "SkillEvent_SkillWindow_ControlInitialize")
  registerEvent("EventlearnedSkill", "SkillEvent_SkillWindow_LearnQuest")
  registerEvent("EventSkillWindowClearSkill", "SkillEvent_SkillWindow_ClearSkill")
  registerEvent("EventSkillWindowClearSkillByPoint", "HandleMLUp_SkillWindow_UpdateData")
  registerEvent("EventSkillWindowClearSkillAll", "SkillEvent_SkillWindow_ClearSkillMessage")
  registerEvent("EventSkillWindowUpdate", "HandleMLUp_SkillWindow_UpdateData")
  registerEvent("EventSkillWindowShowForLearn", "HandleMLUp_SkillWindow_OpenForLearn")
  registerEvent("FromClient_SkillWindowClose", "HandleMLUp_SkillWindow_UpdateData")
end

Skill_RegistMessageHandler()

