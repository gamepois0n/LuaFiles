-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\skill\panel_window_skill_cooltimeslot.luac 

-- params : ...
-- function num : 0
local UIMode = Defines.UIMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_SkillCoolTimeSlot:SetShow(false)
Panel_SkillCoolTimeSlot:ActiveMouseEventEffect(true)
Panel_SkillCoolTimeSlot:setGlassBackground(true)
Panel_SkillCoolTimeSlot:SetDragAll(true)
PaGlobal_Window_Skill_CoolTimeSlot = {_frameBG = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "Static_FrameBG"), _slide = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "VerticalScroll"), _slideBtn = nil, 
_copyUI = {_base_SkillBG = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "Static_C_SkillBG"), _base_SkillIcon = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "Static_C_SkillIcon"), _base_SkillName = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "StaticText_C_SkillName"), _base_ComboBox = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "Combobox_Sort")}
, 
_copyString = {_base_StringName = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "StaticText_C_SkillName")}
, 
_comboBoxString = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_NOT"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_6"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_7"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_8"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_9"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_SKILLCOLLTIMEQUICKSLOT_10")}
, 
_editSearch = {_editSearchText = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "EditSearchText"), _editSearchButton = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "BtnSearch")}
, _initButton = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "BtnInit"), _uiSettingButton = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "Button_UISetting"), _desc = (UI.getChildControl)(Panel_SkillCoolTimeSlot, "StaticText_BottomDesc"), _skillCoolTimeSlotList_MaxCount = 10, 
_uiData = {}
, _slideIndex = 0, _panel_SkillCoolTimeSlot_Value_elementCount = 1, 
_usableSkillTable = {}
, _usableSkillCount = 1}
-- DECOMPILER ERROR at PC181: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.setPosition = function(self)
  -- function num : 0_0
  Panel_SkillCoolTimeSlot:SetPosX(Panel_Window_Skill:GetPosX() + Panel_Window_Skill:GetSizeX() - 25)
  Panel_SkillCoolTimeSlot:SetPosY(getScreenSizeY() / 2 - Panel_SkillCoolTimeSlot:GetSizeY() / 2)
end

local sortSkillCoolTime = function(table1, table2)
  -- function num : 0_1
  local arg1 = table1._coolTimeIndex
  local arg2 = table2._coolTimeIndex
  if arg1 < 0 then
    arg1 = PaGlobal_Window_Skill_CoolTimeSlot._usableSkillCount
  end
  if arg2 < 0 then
    arg2 = PaGlobal_Window_Skill_CoolTimeSlot._usableSkillCount
  end
  if arg1 < arg2 or arg1 == arg2 and table1._insertNo < table2._insertNo then
    return true
  end
end

-- DECOMPILER ERROR at PC186: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.update = function(self)
  -- function num : 0_2 , upvalues : sortSkillCoolTime
  local self = PaGlobal_Window_Skill_CoolTimeSlot
  local skillInfo = {}
  for ii = 0, #skillInfo do
    skillInfo = {_skillNo = nil, _skillName = nil, _coolTimeIndex = nil, _insertNo = nil}
  end
  skillInfo = self:searchSkill_Setting()
  if self._panel_SkillCoolTimeSlot_Value_elementCount <= self._skillCoolTimeSlotList_MaxCount then
    (self._slide):SetShow(false)
  else
    ;
    (self._slide):SetShow(true)
  end
  ;
  (table.sort)(skillInfo, sortSkillCoolTime)
  for index = 1, self._skillCoolTimeSlotList_MaxCount do
    if self._slideIndex + index < self._panel_SkillCoolTimeSlot_Value_elementCount then
      local skillTypeStaticWrapper = getSkillTypeStaticStatus((skillInfo[self._slideIndex + index])._skillNo)
      if skillTypeStaticWrapper:isValidLocalizing() then
        ((self._uiData)[index]):SetData(skillTypeStaticWrapper, (skillInfo[self._slideIndex + index])._skillNo, (skillInfo[self._slideIndex + index])._skillName, index)
        ;
        (((self._uiData)[index])._IconBG):SetShow(true)
        ;
        (((self._uiData)[index])._skillIcon):SetShow(true)
        ;
        (((self._uiData)[index])._skillName):SetShow(true)
        ;
        (((self._uiData)[index])._ComboBox):SetShow(true)
        ;
        (((self._uiData)[index])._ComboBox):SetSelectItemIndex((skillInfo[self._slideIndex + index])._coolTimeIndex + 1)
      else
        ;
        (((self._uiData)[index])._IconBG):SetShow(false)
        ;
        (((self._uiData)[index])._skillIcon):SetShow(false)
        ;
        (((self._uiData)[index])._skillName):SetShow(false)
        ;
        (((self._uiData)[index])._ComboBox):SetShow(false)
      end
    else
      do
        do
          ;
          (((self._uiData)[index])._IconBG):SetShow(false)
          ;
          (((self._uiData)[index])._skillIcon):SetShow(false)
          ;
          (((self._uiData)[index])._skillName):SetShow(false)
          ;
          (((self._uiData)[index])._ComboBox):SetShow(false)
          -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC152: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (UIScroll.SetButtonSize)(self._slide, self._skillCoolTimeSlotList_MaxCount, self._panel_SkillCoolTimeSlot_Value_elementCount - 1)
end

-- DECOMPILER ERROR at PC190: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.skillCoolTimeSlot_MakeControl = function(self, index)
  -- function num : 0_3 , upvalues : UI_PUCT
  local ui = {}
  index = index - 1
  ui._IconBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_SkillCoolTimeSlot, "Static_SkillBG_" .. index)
  CopyBaseProperty((self._copyUI)._base_SkillBG, ui._IconBG)
  ;
  (ui._IconBG):SetShow(false)
  ;
  (ui._IconBG):SetIgnore(false)
  ;
  (ui._IconBG):SetPosY(92 + (index) * ((ui._IconBG):GetSizeY() + 3))
  ui._skillIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_SkillCoolTimeSlot, "Static_SkillIcon_" .. index)
  CopyBaseProperty((self._copyUI)._base_SkillIcon, ui._skillIcon)
  ;
  (ui._skillIcon):SetShow(false)
  ;
  (ui._skillIcon):SetPosY(94 + (index) * ((ui._IconBG):GetSizeY() + 3))
  ui._skillName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_SkillCoolTimeSlot, "StaticText_SkillName_" .. index)
  CopyBaseProperty((self._copyUI)._base_SkillName, ui._skillName)
  ;
  (ui._skillName):SetShow(false)
  ;
  (ui._skillName):SetIgnore(true)
  ;
  (ui._skillName):SetPosY(107 + (index) * ((ui._IconBG):GetSizeY() + 3))
  ui._ComboBox = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_COMBOBOX, Panel_SkillCoolTimeSlot, "Combobox_SkillCoolTimeQuickSlot_" .. index)
  CopyBaseProperty((self._copyUI)._base_ComboBox, ui._ComboBox)
  ;
  (ui._ComboBox):SetShow(false)
  ;
  (ui._ComboBox):SetPosY(97 + (index) * ((ui._IconBG):GetSizeY() + 3))
  for comboindex = 0, #self._comboBoxString do
    (ui._ComboBox):AddItem((self._comboBoxString)[comboindex])
  end
  ;
  (ui._ComboBox):SetSelectItemIndex(0)
  ui.SetData = function(self, skillTypeSSW, skillNo, skillName, index)
    -- function num : 0_3_0
    (self._skillIcon):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
    ;
    (self._skillName):SetText(skillName)
    ;
    (self._skillIcon):addInputEvent("Mouse_On", "PaGlobal_Window_Skill_CoolTimeSlot:skillCoolTimeSlot_OverEvent(" .. skillNo .. ",false, \"MainStatusSkill\")")
    ;
    (self._skillIcon):addInputEvent("Mouse_Out", "PaGlobal_Window_Skill_CoolTimeSlot:skillCoolTimeSlot_OverEventHide(" .. skillNo .. ",\"MainStatusSkill\")")
    Panel_SkillTooltip_SetPosition(skillNo, self._skillIcon, "MainStatusSkill")
    ;
    (self._ComboBox):addInputEvent("Mouse_LUp", "PaGlobal_Window_Skill_CoolTimeSlot:skillCoolTimeSlotComboBox_Show(" .. index .. " )")
    ;
    ((self._ComboBox):GetListControl()):addInputEvent("Mouse_LUp", "PaGlobal_Window_Skill_CoolTimeSlot:skillCoolTimeSlotComboBox_Set(" .. index .. ", " .. skillNo .. ")")
  end

  ;
  (ui._IconBG):addInputEvent("Mouse_UpScroll", "PaGlobal_Window_Skill_CoolTimeSlot:scrollUpdate( true )")
  ;
  (ui._IconBG):addInputEvent("Mouse_DownScroll", "PaGlobal_Window_Skill_CoolTimeSlot:scrollUpdate( false )")
  ;
  (ui._skillIcon):addInputEvent("Mouse_UpScroll", "PaGlobal_Window_Skill_CoolTimeSlot:scrollUpdate( true )")
  ;
  (ui._skillIcon):addInputEvent("Mouse_DownScroll", "PaGlobal_Window_Skill_CoolTimeSlot:scrollUpdate( false )")
  return ui
end

-- DECOMPILER ERROR at PC193: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.skillCoolTimeSlotComboBox_Show = function(self, index)
  -- function num : 0_4
  (((self._uiData)[index])._ComboBox):ToggleListbox()
  Panel_SkillCoolTimeSlot:SetChildIndex(((self._uiData)[index])._ComboBox, 9998)
end

-- DECOMPILER ERROR at PC196: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.skillCoolTimeSlotComboBox_Set = function(self, index, skillNo)
  -- function num : 0_5
  local slotNo = (((self._uiData)[index])._ComboBox):GetSelectIndex() - 1
  ;
  (((self._uiData)[index])._ComboBox):ToggleListbox()
  if slotNo >= 0 then
    ToClient_setSkillCoolTimeSlot(slotNo, skillNo)
  else
    ToClient_clearSkillCoolTimeSlot(skillNo)
  end
  PaGlobal_SkillCoolTimeQuickSlot:updateQuickSlot()
  self:update()
end

-- DECOMPILER ERROR at PC199: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.skillCoolTimeSlot_OverEvent = function(self, skillNo, isShowNextLevel, SlotType)
  -- function num : 0_6
  if skillNoCache == skillNo and slotTypeCache == SlotType then
    tooltipcacheCount = tooltipcacheCount + 1
  else
    skillNoCache = skillNo
    slotTypeCache = SlotType
    tooltipcacheCount = 1
  end
  Panel_SkillTooltip_Show(skillNo, false, SlotType)
end

-- DECOMPILER ERROR at PC202: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.skillCoolTimeSlot_OverEventHide = function(self, skillNo, SlotType)
  -- function num : 0_7
  if skillNoCache == skillNo and slotTypeCache == SlotType then
    tooltipcacheCount = tooltipcacheCount - 1
  else
    tooltipcacheCount = 0
  end
  if tooltipcacheCount <= 0 then
    Panel_SkillTooltip_Hide()
  end
end

local stringMatching = function(filterText, editSkillName)
  -- function num : 0_8
  return stringSearch(filterText, editSkillName)
end

-- DECOMPILER ERROR at PC207: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.searchSkill_Setting = function(self)
  -- function num : 0_9 , upvalues : stringMatching
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local filterText = ((self._editSearch)._editSearchText):GetEditText()
  local skillTable = {}
  local editSkillCount = 1
  local isPush = false
  for ii = 1, self._usableSkillCount - 1 do
    if filterText == nil or filterText:len() == 0 then
      isPush = true
    else
      if stringMatching(((self._usableSkillTable)[ii])._skillName, filterText) == true then
        isPush = true
      else
        isPush = false
      end
    end
    if isPush == true then
      local coolTimeIndex = ToClient_getSkillCoolTimeSlotIndex(((self._usableSkillTable)[ii])._skillNo)
      skillTable[editSkillCount] = {_skillNo = ((self._usableSkillTable)[ii])._skillNo, _skillName = ((self._usableSkillTable)[ii])._skillName, _coolTimeIndex = coolTimeIndex, _insertNo = ((self._usableSkillTable)[ii])._insertNo}
      editSkillCount = editSkillCount + 1
    end
  end
  return skillTable, editSkillCount
end

-- DECOMPILER ERROR at PC210: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.usableskillTableInit = function(self, nums)
  -- function num : 0_10
  self._usableSkillTable = {}
  for i = 1, nums do
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R6 in 'UnsetPending'

    (self._usableSkillTable)[i] = {_skillName = nil, _skillNo = nil, _insertNo = nil}
  end
end

-- DECOMPILER ERROR at PC213: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.skillCoolTimeSlot_Setting = function(self)
  -- function num : 0_11
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local skillTable = {}
  local cellTable = {[0] = nil, [1] = nil}
  self:usableskillTableInit(self._usableSkillCount)
  local usableSkillCount = 1
  local classType = selfPlayer:getClassType()
  if classType >= 0 then
    cellTable[0] = getCombatSkillTree(classType)
    cellTable[1] = getAwakeningWeaponSkillTree(classType)
  else
    return 
  end
  for iii = 0, 1 do
    if cellTable[iii] == nil then
      return 
    end
    local cols = (cellTable[iii]):capacityX()
    local rows = (cellTable[iii]):capacityY()
    for row = 0, rows - 1 do
      for col = 0, cols - 1 do
        local cell = (cellTable[iii]):atPointer(col, row)
        local skillNo = cell._skillNo
        if cell:isSkillType() then
          local skillLevelInfo = getSkillLevelInfo(skillNo)
          local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
          local skillType = getSkillTypeStaticStatus(skillNo)
          -- DECOMPILER ERROR at PC91: Confused about usage of register: R25 in 'UnsetPending'

          if skillType:isValidLocalizing() == true and skillLevelInfo._learnable == false and skillLevelInfo._usable == true and (skillStaticWrapper:get())._reuseCycle > 0 then
            (self._usableSkillTable)[usableSkillCount] = {_skillName = skillStaticWrapper:getName(), _skillNo = skillNo, _insertNo = usableSkillCount}
            usableSkillCount = usableSkillCount + 1
          end
        end
      end
    end
  end
  do
    local isLearnFusionSkill = not ToClient_isLearnFusionSkillLevel() or ToClient_getFusionSkillListCount(0) ~= 0
    if isLearnFusionSkill == true then
      local cellTable2 = getFusionSkillTree()
      local cols = cellTable2:capacityX()
      local rows = cellTable2:capacityY()
      local index = 0
      for row = 0, rows - 1 do
        for col = 0, cols - 1 do
          local cell = cellTable2:atPointer(col, row)
          if cell:isSkillType() then
            local skillNo = ToClient_getFusionLearnSkillNo(index)
            index = index + 1
            if skillNo ~= 0 and ToClient_isLearnedSkill(skillNo) == true then
              local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
              local skillType = getSkillTypeStaticStatus(skillNo)
              -- DECOMPILER ERROR at PC161: Confused about usage of register: R23 in 'UnsetPending'

              if skillType:isValidLocalizing() == true then
                (self._usableSkillTable)[usableSkillCount] = {_skillName = skillStaticWrapper:getName(), _skillNo = skillNo, _insertNo = usableSkillCount}
                usableSkillCount = usableSkillCount + 1
              end
            end
          end
        end
      end
    end
    self._usableSkillCount = usableSkillCount
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC216: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.scrollUpdate = function(self, isUp)
  -- function num : 0_12
  local self = PaGlobal_Window_Skill_CoolTimeSlot
  self._slideIndex = (UIScroll.ScrollEvent)(self._slide, isUp, self._skillCoolTimeSlotList_MaxCount, self._panel_SkillCoolTimeSlot_Value_elementCount - 1, self._slideIndex, 1)
  self:update()
end

-- DECOMPILER ERROR at PC219: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.showFunc = function(self)
  -- function num : 0_13
  if Panel_Window_Skill:IsShow() == true then
    Panel_SkillCoolTimeSlot:SetShow(true, true)
    ;
    (self._slide):SetControlPos(0)
    self._slideIndex = 0
    self:skillCoolTimeSlot_Setting()
    ClearFocusEdit()
    self:setPosition()
  else
    Panel_SkillCoolTimeSlot:SetShow(false, true)
  end
  ;
  ((self._editSearch)._editSearchText):SetEditText("", false)
  self:update()
end

-- DECOMPILER ERROR at PC222: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.closeFunc = function(self)
  -- function num : 0_14
  Panel_SkillCoolTimeSlot:SetShow(false, true)
  ;
  ((self._editSearch)._editSearchText):SetEditText("", false)
end

-- DECOMPILER ERROR at PC225: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.init = function(self)
  -- function num : 0_15
  self._slideBtn = (UI.getChildControl)(self._slide, "VerticalScroll_CtrlButton")
  for index = 1, self._skillCoolTimeSlotList_MaxCount do
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R5 in 'UnsetPending'

    (self._uiData)[index] = self:skillCoolTimeSlot_MakeControl(index)
  end
  if isGameTypeKorea() then
    ((self._editSearch)._editSearchText):SetMaxInput(20)
  else
    ;
    ((self._editSearch)._editSearchText):SetMaxInput(40)
  end
  ;
  ((self._editSearch)._editSearchText):SetShow(true)
  ;
  ((self._editSearch)._editSearchButton):SetShow(true)
  Panel_SkillCoolTimeSlot:RemoveControl((self._copyUI)._base_SkillBG)
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._copyUI)._base_SkillBG = nil
  Panel_SkillCoolTimeSlot:RemoveControl((self._copyUI)._base_SkillIcon)
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._copyUI)._base_SkillIcon = nil
  Panel_SkillCoolTimeSlot:RemoveControl((self._copyUI)._base_SkillName)
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._copyUI)._base_SkillName = nil
  Panel_SkillCoolTimeSlot:RemoveControl((self._copyUI)._base_ComboBox)
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._copyUI)._base_ComboBox = nil
  ;
  (UIScroll.InputEvent)(self._slide, "PaGlobal_Window_Skill_CoolTimeSlot:scrollUpdate")
  ;
  ((self._editSearch)._editSearchButton):addInputEvent("Mouse_LUp", "PaGlobal_Window_Skill_CoolTimeSlot:searchbuttonClick()")
  ;
  ((self._editSearch)._editSearchText):addInputEvent("Mouse_LDown", "PaGlobal_Window_Skill_CoolTimeSlot:searchText_Click()")
  ;
  ((self._editSearch)._editSearchText):addInputEvent("Mouse_LUp", "PaGlobal_Window_Skill_CoolTimeSlot:searchText_Click()")
  ;
  ((self._editSearch)._editSearchText):RegistReturnKeyEvent("PaGlobal_Window_Skill_CoolTimeSlot:searchbuttonClick()")
  ;
  (self._frameBG):addInputEvent("Mouse_UpScroll", "PaGlobal_Window_Skill_CoolTimeSlot:scrollUpdate( true )")
  ;
  (self._frameBG):addInputEvent("Mouse_DownScroll", "PaGlobal_Window_Skill_CoolTimeSlot:scrollUpdate( false )")
  ;
  (self._initButton):addInputEvent("Mouse_LUp", "PaGlobal_Window_Skill_CoolTimeSlot:allSkillClear()")
  ;
  (self._uiSettingButton):addInputEvent("Mouse_LUp", "FGlobal_UiSet_Open(false)")
  self:bottomDesc_Setting()
  self:skillCoolTimeSlot_Setting()
  self:update()
end

-- DECOMPILER ERROR at PC228: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.bottomDesc_Setting = function(self)
  -- function num : 0_16
  (self._desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._desc):SetText((self._desc):GetText())
end

-- DECOMPILER ERROR at PC231: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.searchbuttonClick = function(self)
  -- function num : 0_17
  local self = PaGlobal_Window_Skill_CoolTimeSlot
  if CheckChattingInput() == false then
    ClearFocusEdit()
  end
  self._slideIndex = 0
  self:update()
end

-- DECOMPILER ERROR at PC234: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.searchText_Click = function(self)
  -- function num : 0_18
  SetFocusEdit((self._editSearch)._editSearchText)
  ;
  ((self._editSearch)._editSearchText):SetEditText("", false)
end

-- DECOMPILER ERROR at PC237: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.allSkillClear = function(self)
  -- function num : 0_19
  ToClient_allClearSkillCoolTimeSlot()
  ;
  ((self._editSearch)._editSearchText):SetEditText("", false)
  self:update()
  PaGlobal_SkillCoolTimeQuickSlot:updateQuickSlot()
end

-- DECOMPILER ERROR at PC240: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.skillUpdate = function(self)
  -- function num : 0_20
  ((self._editSearch)._editSearchText):SetEditText("", false)
  self:skillCoolTimeSlot_Setting()
  self:update()
  PaGlobal_SkillCoolTimeQuickSlot:updateQuickSlot()
end

FromClient_SkillCoolTimeSlotUpdate = function()
  -- function num : 0_21
  PaGlobal_Window_Skill_CoolTimeSlot:skillUpdate()
end

-- DECOMPILER ERROR at PC245: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_Window_Skill_CoolTimeSlot.registMessageHandler = function(self)
  -- function num : 0_22
  registerEvent("FromClient_SkillCoolTimeSlotUpdate", "FromClient_SkillCoolTimeSlotUpdate")
end

PaGlobal_Window_Skill_CoolTimeSlot:init()
PaGlobal_Window_Skill_CoolTimeSlot:registMessageHandler()

