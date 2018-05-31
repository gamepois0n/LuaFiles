-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\skill\console\panel_window_skill_renew.luac 

-- params : ...
-- function num : 0
local Window_SkillInfo = {_renderMode, _needMantalString, _mantalString, _defaultDividerPosY, _remainSkillPoint; 
_ui = {
_body = {}
, 
_right = {}
, _static_BodyBg = (UI.getChildControl)(Panel_Window_Skill_Renew, "Static_BodyBg"), _static_RightBg = (UI.getChildControl)(Panel_Window_Skill_Renew, "Static_RightBg"), _static_IconEffect = (UI.getChildControl)(Panel_Window_Skill_Renew, "Static_Icon_Skill_Effect")}
, 
_config = {_title_Learn = 0, _title_Basic = 1, _title_Awaken = 2}
, 
_combatSkill = {}
, 
_awakenSkill = {}
, 
_fusionSkill = {}
, 
_combatTable = {_skillCount = 0, 
_skillTable = {}
}
, 
_awakenTable = {_skillCount = 0, 
_skillTable = {}
}
, 
_currentSkillListInfo = {}
, 
_currentSkillListUI = {}
, _currentSkillIndex = nil, _lastSelectedUI = nil, _currentTitle = 0, _isLDown = false, _isRDown = false, _movePosX = 0, _movePosY = 0, _currentTabIndex = 0}
Window_SkillInfo.GetFusionSkillFromCell = function(self, cellTable)
  -- function num : 0_0
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  local index = 0
  local skillIndex = 0
  local table = {}
  for row = 0, rows - 1 do
    for col = 0, cols - 1 do
      local cell = cellTable:atPointer(col, row)
      if cell:isSkillType() == true then
        local maxFusionSkill = ToClient_getFusionSkillListCount(index)
        for fusionIndex = 0, maxFusionSkill - 1 do
          local fusionSkillNo = ToClient_getFusionSkillNo(index, fusionIndex)
          local fusionMainNo = ToClient_getFusionMainSkillNo(index, fusionIndex)
          local fusionSubNo = ToClient_getFusionSubSkillNo(index, fusionIndex)
          table[skillIndex] = self:SetSkillInfo(fusionSkillNo)
          local skillTypeStaticWrapper = getSkillTypeStaticStatus(fusionMainNo)
          if skillTypeStaticWrapper == nil then
            return 
          end
          local skillLearndLevel = getLearnedSkillLevel(skillTypeStaticWrapper)
          -- DECOMPILER ERROR at PC56: Confused about usage of register: R26 in 'UnsetPending'

          ;
          (table[skillIndex])._learndLevelMainSkill = skillLearndLevel
          skillTypeStaticWrapper = getSkillTypeStaticStatus(fusionSubNo)
          if skillTypeStaticWrapper == nil then
            return 
          end
          skillLearndLevel = getLearnedSkillLevel(skillTypeStaticWrapper)
          -- DECOMPILER ERROR at PC69: Confused about usage of register: R26 in 'UnsetPending'

          ;
          (table[skillIndex])._learndLevelSubSkill = skillLearndLevel
          -- DECOMPILER ERROR at PC79: Confused about usage of register: R26 in 'UnsetPending'

          if (table[skillIndex])._learndLevelMainSkill == 1 and (table[skillIndex])._learndLevelSubSkill == 1 then
            (table[skillIndex])._learnable = true
          else
            -- DECOMPILER ERROR at PC82: Confused about usage of register: R26 in 'UnsetPending'

            ;
            (table[skillIndex])._learnable = false
          end
          skillIndex = skillIndex + 1
        end
        index = index + 1
      end
    end
  end
  return table
end

Window_SkillInfo.GetSkillFromCell = function(self, cellTable)
  -- function num : 0_1
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  local index = 0
  local table = {}
  for row = 0, rows - 1 do
    for col = 0, cols - 1 do
      local cell = cellTable:atPointer(col, row)
      local skillNo = cell._skillNo
      if cell:isSkillType() == true then
        table[index] = self:SetSkillInfo(skillNo)
        index = index + 1
      end
    end
  end
  return table
end

Window_SkillInfo.SetSkillInfo = function(self, skillNo)
  -- function num : 0_2
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
  if skillTypeStaticWrapper == nil then
    return 
  end
  local skillTypeStatic = skillTypeStaticWrapper:get()
  if skillTypeStatic == nil then
    return 
  end
  local skillLevelInfo = getSkillLevelInfo(skillNo)
  local skillLearndLevel = getLearnedSkillLevel(skillTypeStaticWrapper)
  local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
  if skillStaticWrapper == nil then
    return 
  end
  local skillStatic = skillStaticWrapper:get()
  if skillStatic == nil then
    return 
  end
  local skillInfo = {_name = skillTypeStaticWrapper:getName(), _learndLevel = skillLearndLevel, _learnable = skillLevelInfo._learnable, _usable = skillLevelInfo._usable, _command = skillTypeStaticWrapper:getCommand(), _iconPath = skillTypeStaticWrapper:getIconPath(), _moviePath = skillTypeStaticWrapper:getMoviePath(), _desc = skillTypeStaticWrapper:getDescription(), _buffDesc = skillStaticWrapper:getDescription(), _requireHp = skillStatic._requireHp, _requireMp = skillStatic._requireMp, _requireSp = skillStatic._requireSp, _reuseCycle = skillStatic._reuseCycle, _needCharacterLevel = skillStatic._needCharacterLevelForLearning, _needSkillPoint = skillStatic._needSkillPointForLearning, _key = skillStaticWrapper:getKey(), _no = skillNo, _isActive = skillTypeStaticWrapper:isActiveSkill(), _isPassive = skillTypeStaticWrapper:isPassiveSkill(), _isCommand = skillTypeStaticWrapper:isSkillCommandCheck(), _isLock = ToClient_isBlockSkillCommand(skillLevelInfo._skillKey), _isFusion = skillStaticWrapper:isFusionSkill(), _learndLevelMainSkill = 0, _learndLevelSubSkill = 0}
  return skillInfo
end

PaGlobalFunc_Skill_LockButton = function()
  -- function num : 0_3 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  if (self._config)._title_Learn == self._currentTitle then
    return 
  end
  local skillInfo = (self._currentSkillListInfo)[self._currentSkillIndex]
  if skillInfo == nil then
    return 
  end
  if skillInfo._isCommand == false then
    return 
  end
  local skillLevelInfo = getSkillLevelInfo(skillInfo._no)
  if skillLevelInfo == nil then
    return 
  end
  local isBlockSkill = ToClient_isBlockSkillCommand(skillLevelInfo._skillKey)
  if isBlockSkill == true then
    ToClient_enableSkillCommand(skillLevelInfo._skillKey)
    skillInfo._isLock = false
  else
    ToClient_blockSkillCommand(skillLevelInfo._skillKey)
    skillInfo._isLock = true
  end
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._currentSkillListInfo)[self._currentSkillIndex] = skillInfo
  ;
  (((self._ui)._right)._list2_Skill):requestUpdateByKey(toInt64(0, self._currentSkillIndex))
end

PaGlobalFunc_Skill_LearnButton = function()
  -- function num : 0_4 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  local skillInfo = (self._currentSkillListInfo)[self._currentSkillIndex]
  if skillInfo == nil then
    return 
  end
  if skillInfo._learnable == false then
    return 
  end
  local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "GUILD_MESSAGEBOX_TITLE")
  local messageboxContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_SKILLSTUDY")
  local messageboxData = {title = messageboxTitle, content = messageboxContent, functionYes = PaGlobalFunc_Skill_LearnConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

PaGlobalFunc_Skill_LearnConfirm = function()
  -- function num : 0_5 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  local skillInfo = (self._currentSkillListInfo)[self._currentSkillIndex]
  if skillInfo == nil then
    return 
  end
  local isSuccess = skillWindow_DoLearn(skillInfo._no)
  if isSuccess == true then
    audioPostEvent_SystemUi(4, 2)
  end
end

PaGlobalFunc_Skill_ResetButton = function()
  -- function num : 0_6
  skillWindow_ClearSkill()
end

PaGlobalFunc_Skill_SelectTitle = function(titleType)
  -- function num : 0_7 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  local tooltip = ((self._ui)._right)._staticText_Tooltip
  local learnSkill = ((self._ui)._right)._radioButton_LearnSkill
  local basicSkill = ((self._ui)._right)._radioButton_SkillBasic
  local awakenSkill = ((self._ui)._right)._radioButton_SkillAwaken
  self:Clear()
  self:Update()
  if (self._config)._title_Learn == titleType then
    tooltip:SetText(PAGetString(Defines.StringSheet_RESOURCE, "LUA_SKILL_TAB_LEARNABLE"))
    tooltip:SetPosX(learnSkill:GetPosX() - learnSkill:GetSizeX() / 2)
    self._currentTitle = (self._config)._title_Learn
    learnSkill:SetCheck(true)
    self:SetLearnableSkillList()
  else
    if (self._config)._title_Basic == titleType then
      tooltip:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SKILL_COMBAT"))
      tooltip:SetPosX(basicSkill:GetPosX() - basicSkill:GetSizeX() / 2)
      self._currentTitle = (self._config)._title_Basic
      basicSkill:SetCheck(true)
      self:SetSkillList(self._combatTable)
    else
      if (self._config)._title_Awaken == titleType then
        tooltip:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SKILL_RELEASEWEAPONE"))
        tooltip:SetPosX(awakenSkill:GetPosX() - awakenSkill:GetSizeX() / 2)
        self._currentTitle = (self._config)._title_Awaken
        awakenSkill:SetCheck(true)
        self:SetSkillList(self._awakenTable)
      else
        _PA_LOG("이호�\156", "�\128이틀 �\128입이 잘못 들어왔다.")
      end
    end
  end
end

Window_SkillInfo.SetLearnableSkillList = function(self)
  -- function num : 0_8
  local index = 0
  for tableIndex = 0, #self._combatTable do
    local skillCount = ((self._combatTable)[tableIndex])._skillCount
    local skillTable = ((self._combatTable)[tableIndex])._skillTable
    if skillTable == nil then
      return 
    end
    for skillIndex = 0, skillCount - 1 do
      local skillInfo = skillTable[skillIndex]
      if skillInfo == nil then
        return 
      end
      -- DECOMPILER ERROR at PC27: Confused about usage of register: R13 in 'UnsetPending'

      if skillInfo._learnable == true then
        (self._currentSkillListInfo)[index] = skillInfo
        ;
        ((((self._ui)._right)._list2_Skill):getElementManager()):pushKey(toInt64(0, index))
        ;
        (((self._ui)._right)._list2_Skill):requestUpdateByKey(toInt64(0, index))
        index = index + 1
      end
    end
  end
  for tableIndex = 0, #self._awakenTable do
    local skillCount = ((self._awakenTable)[tableIndex])._skillCount
    local skillTable = ((self._awakenTable)[tableIndex])._skillTable
    if skillTable == nil then
      return 
    end
    for skillIndex = 0, skillCount - 1 do
      local skillInfo = skillTable[skillIndex]
      if skillInfo == nil then
        return 
      end
      -- DECOMPILER ERROR at PC77: Confused about usage of register: R13 in 'UnsetPending'

      if skillInfo._learnable == true then
        (self._currentSkillListInfo)[index] = skillInfo
        ;
        ((((self._ui)._right)._list2_Skill):getElementManager()):pushKey(toInt64(0, index))
        ;
        (((self._ui)._right)._list2_Skill):requestUpdateByKey(toInt64(0, index))
        index = index + 1
      end
    end
  end
end

Window_SkillInfo.SetSkillList = function(self, table)
  -- function num : 0_9
  local index = 0
  for tableIndex = 0, #table do
    local skillCount = (table[tableIndex])._skillCount
    local skillTable = (table[tableIndex])._skillTable
    if skillTable == nil then
      return 
    end
    for skillIndex = 0, skillCount - 1 do
      local skillInfo = skillTable[skillIndex]
      if skillInfo == nil then
        return 
      end
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R14 in 'UnsetPending'

      if skillIndex == 0 and skillInfo._learndLevel == 0 then
        (self._currentSkillListInfo)[index] = skillInfo
        ;
        ((((self._ui)._right)._list2_Skill):getElementManager()):pushKey(toInt64(0, index))
        ;
        (((self._ui)._right)._list2_Skill):requestUpdateByKey(toInt64(0, index))
        index = index + 1
      end
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R14 in 'UnsetPending'

      if skillInfo._learndLevel == 1 and skillInfo._usable == true then
        (self._currentSkillListInfo)[index] = skillInfo
        ;
        ((((self._ui)._right)._list2_Skill):getElementManager()):pushKey(toInt64(0, index))
        ;
        (((self._ui)._right)._list2_Skill):requestUpdateByKey(toInt64(0, index))
        index = index + 1
      end
    end
  end
end

PaGlobalFunc_Skill_List2EventControlCreate = function(list_content, key)
  -- function num : 0_10 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  local id = Int64toInt32(key)
  local skillInfo = (self._currentSkillListInfo)[id]
  if skillInfo == nil then
    ((((self._ui)._right)._list2_Skill):getElementManager()):removeKey(toInt64(0, id))
    return 
  end
  local uiInfo = {_radioButton_SkillBg = (UI.getChildControl)(list_content, "Radio_SkillBg"), _radioButton_LeftSkill = (UI.getChildControl)(list_content, "Radiobutton_LeftSkill"), _radioButton_RightSkill = (UI.getChildControl)(list_content, "Radiobutton_RightSkill"), _static_SelectedSkillBg = (UI.getChildControl)(list_content, "Static_SelectedSkillBg"), _static_SkillIcon = (UI.getChildControl)(list_content, "Static_Skill_Box2"), _staticText_Name = (UI.getChildControl)(list_content, "StaticText_Skill_Name"), _staticText_RequireLevel = (UI.getChildControl)(list_content, "StaticText_Skill_Require_Level"), _static_LockIcon = (UI.getChildControl)(list_content, "Static_Skill_Lock_Icon"), _progress2_ProgressBar = (UI.getChildControl)(list_content, "Progress2_1")}
  local rate = 100 * self._remainSkillPoint / skillInfo._needSkillPoint
  if skillInfo._learndLevel == 1 then
    rate = 100
  end
  ;
  (uiInfo._progress2_ProgressBar):SetProgressRate(rate)
  ;
  (uiInfo._static_SelectedSkillBg):SetShow(false)
  ;
  (uiInfo._static_SkillIcon):SetShow(true)
  ;
  (uiInfo._static_SkillIcon):ChangeTextureInfoName("icon/" .. skillInfo._iconPath)
  ;
  ((uiInfo._static_SkillIcon):getBaseTexture()):setUV(0, 0, 1, 1)
  ;
  (uiInfo._static_SkillIcon):setRenderTexture((uiInfo._static_SkillIcon):getBaseTexture())
  ;
  (uiInfo._staticText_Name):SetText(skillInfo._name)
  if skillInfo._isLock == true then
    (uiInfo._static_LockIcon):SetShow(true)
  else
    ;
    (uiInfo._static_LockIcon):SetShow(false)
  end
  local requireDesc = PAGetString(Defines.StringSheet_RESOURCE, "LUA_SKILL_LEARNED")
  if skillInfo._learndLevel == 0 then
    if skillInfo._needCharacterLevel == 0 then
      requireDesc = PAGetStringParam1(Defines.StringSheet_RESOURCE, "LUA_SKILL_LEARNCONDITION", "condition", PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_QuestGain"))
    else
      requireDesc = PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_SKILLLEARN_TXT_NEEDLV")
      requireDesc = requireDesc .. " " .. PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TooltipSkill_NeedLevel", "needLvLearning", skillInfo._needCharacterLevel) .. "\n"
      requireDesc = requireDesc .. PAGetStringParam1(Defines.StringSheet_RESOURCE, "LUA_SKILL_NEEDSP", "needSP", skillInfo._needSkillPoint)
    end
  end
  ;
  (uiInfo._staticText_RequireLevel):SetText(requireDesc)
  -- DECOMPILER ERROR at PC187: Confused about usage of register: R8 in 'UnsetPending'

  ;
  (self._currentSkillListUI)[id] = uiInfo
  if _ContentsGroup_isConsolePadControl == false then
    (uiInfo._radioButton_SkillBg):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SelectSkill(" .. id .. ")")
    ;
    (uiInfo._radioButton_SkillBg):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_LearnButton()")
  else
    ;
    (uiInfo._radioButton_SkillBg):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_LearnButton()")
    ;
    (uiInfo._radioButton_SkillBg):addInputEvent("Mouse_On", "PaGlobalFunc_Skill_SelectSkill(" .. id .. ")")
    list_content:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_Skill_SkillHandle(" .. id .. ",-1)")
    list_content:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_Skill_SkillHandle(" .. id .. ",1)")
  end
  if (self._config)._title_Learn == self._currentTitle then
    (uiInfo._radioButton_LeftSkill):SetShow(false)
    ;
    (uiInfo._radioButton_RightSkill):SetShow(false)
  else
    ;
    (uiInfo._radioButton_LeftSkill):SetShow(true)
    ;
    (uiInfo._radioButton_RightSkill):SetShow(true)
    ;
    (uiInfo._radioButton_LeftSkill):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SkillHandle(" .. id .. ",-1)")
    ;
    (uiInfo._radioButton_RightSkill):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SkillHandle(" .. id .. ",1)")
  end
end

PaGlobalFunc_Skill_SkillHandle = function(id, direction)
  -- function num : 0_11 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  local skillInfo = (self._currentSkillListInfo)[id]
  local findTableIndex = -1
  local findSkillIndex = -1
  if skillInfo == nil then
    return 
  end
  if (self._config)._title_Basic == self._currentTitle then
    for tableIndex = 0, #self._combatTable do
      local skillCount = ((self._combatTable)[tableIndex])._skillCount
      local skillTable = ((self._combatTable)[tableIndex])._skillTable
      if skillTable == nil then
        return 
      end
      for skillIndex = 0, skillCount - 1 do
        if skillTable[skillIndex] == skillInfo then
          findTableIndex = tableIndex
          findSkillIndex = skillIndex
          break
        end
      end
    end
  else
    do
      for tableIndex = 0, #self._awakenTable do
        local skillCount = ((self._awakenTable)[tableIndex])._skillCount
        local skillTable = ((self._awakenTable)[tableIndex])._skillTable
        if skillTable == nil then
          return 
        end
        for skillIndex = 0, skillCount - 1 do
          if skillTable[skillIndex] == skillInfo then
            findTableIndex = tableIndex
            findSkillIndex = skillIndex
            break
          end
        end
      end
      do
        if findTableIndex == -1 or findSkillIndex == -1 then
          return 
        end
        local newSkillInfo = nil
        if (self._config)._title_Basic == self._currentTitle then
          newSkillInfo = (((self._combatTable)[findTableIndex])._skillTable)[findSkillIndex + direction]
        else
          newSkillInfo = (((self._awakenTable)[findTableIndex])._skillTable)[findSkillIndex + direction]
        end
        if newSkillInfo == nil then
          return 
        end
        -- DECOMPILER ERROR at PC92: Confused about usage of register: R7 in 'UnsetPending'

        ;
        (self._currentSkillListInfo)[id] = newSkillInfo
        ;
        (((self._ui)._right)._list2_Skill):requestUpdateByKey(toInt64(0, id))
        PaGlobalFunc_Skill_SelectSkill(id)
      end
    end
  end
end

PaGlobalFunc_Skill_SelectSkill = function(id)
  -- function num : 0_12 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  local body = (self._ui)._body
  self:SkillDetailClear()
  local skillInfo = (self._currentSkillListInfo)[id]
  if skillInfo == nil then
    return 
  end
  local skillUI = (self._currentSkillListUI)[id]
  if skillUI == nil then
    return 
  end
  if self._lastSelectedUI ~= nil then
    ((self._lastSelectedUI)._static_SelectedSkillBg):SetShow(false)
  end
  ;
  (skillUI._static_SelectedSkillBg):SetShow(true)
  ;
  (body._static_Icon):SetShow(true)
  ;
  (body._static_IconBg):SetShow(true)
  ;
  (body._staticText_EffectTitle):SetShow(true)
  ;
  (body._static_Icon):ChangeTextureInfoName("Icon/" .. skillInfo._iconPath)
  ;
  ((body._static_Icon):getBaseTexture()):setUV(0, 0, 1, 1)
  ;
  (body._static_Icon):setRenderTexture((body._static_Icon):getBaseTexture())
  ;
  (body._staticText_Name):SetText(skillInfo._name)
  ;
  (body._staticText_Desc):SetText(skillInfo._desc)
  ;
  (body._staticText_Desc):SetPosY((((self._ui)._body)._staticText_Name):GetPosY() + (((self._ui)._body)._staticText_Name):GetSizeY())
  ;
  (body._staticText_EffectDesc):SetText(skillInfo._buffDesc)
  ;
  (body._staticText_EffectDesc):SetPosY((body._static_KeyGuide):GetPosY() - (body._staticText_EffectDesc):GetSizeY() + 30)
  ;
  (body._staticText_EffectTitle):SetPosY((body._staticText_EffectDesc):GetPosY() - (body._staticText_EffectTitle):GetSizeY() - 5)
  local needResource = ""
  if skillInfo._requireHp > 1 then
    needResource = needResource .. PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_SKILL_TXT_NEEDHP") .. " " .. skillInfo._requireHp .. "\n"
  end
  if skillInfo._requireMp > 1 then
    needResource = needResource .. self._needMantalString .. " " .. skillInfo._requireMp .. "\n"
  end
  if skillInfo._requireSp > 1 then
    needResource = needResource .. PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_SKILL_TXT_NEEDSP") .. " " .. skillInfo._requireSp .. "\n"
  end
  ;
  (body._staticText_NeedResource):SetText(needResource)
  ;
  (body._staticText_NeedResource):SetPosY((((self._ui)._body)._staticText_Desc):GetPosY() + (((self._ui)._body)._staticText_Desc):GetSizeY())
  local needResourcePosY = (body._staticText_NeedResource):GetPosY() + (body._staticText_NeedResource):GetSizeY()
  local dividerPosY = (body._static_Divider2):GetPosY()
  ;
  (body._static_Divider2):SetPosY((math.max)(needResourcePosY, dividerPosY))
  ;
  (body._staticText_Command):SetSize((body._staticText_Command):GetSizeX(), (body._static_Divider2):GetPosY() - (body._static_Divider1):GetPosY())
  ;
  (body._staticText_Command):SetPosY((body._static_Divider1):GetPosY())
  ;
  (body._staticText_Command):SetText(skillInfo._command)
  self._lastSelectedUI = skillUI
  self._currentSkillIndex = id
end

Window_SkillInfo.SkillDetailClear = function(self)
  -- function num : 0_13
  local body = (self._ui)._body
  ;
  (body._staticText_Name):SetText("")
  ;
  (body._staticText_Desc):SetText("")
  ;
  (body._staticText_EffectTitle):SetShow(false)
  ;
  (body._staticText_EffectDesc):SetText("")
  ;
  (body._staticText_NeedResource):SetText("")
  ;
  (body._staticText_Command):SetText("")
  ;
  (body._static_Icon):SetShow(false)
  ;
  (body._static_IconBg):SetShow(false)
  ;
  (body._static_Divider2):SetPosY(self._defaultDividerPosY)
end

Window_SkillInfo.UpdateSkillData = function(self)
  -- function num : 0_14
  local selfPlayerActorProxyWrapper = getSelfPlayer()
  if selfPlayerActorProxyWrapper == nil then
    return 
  end
  local classType = selfPlayerActorProxyWrapper:getClassType()
  if classType < 0 then
    return 
  end
  local cellTable = getCombatSkillTree(classType)
  if cellTable == nil then
    return 
  end
  self._combatSkill = self:GetSkillFromCell(cellTable)
  cellTable = nil
  cellTable = getAwakeningWeaponSkillTree(classType)
  if cellTable == nil then
    return 
  end
  self._awakenSkill = self:GetSkillFromCell(cellTable)
  cellTable = nil
  cellTable = getFusionSkillTree()
  if cellTable == nil then
    return 
  end
  self._fusionSkill = self:GetFusionSkillFromCell(cellTable)
  cellTable = nil
  for index = 0, #self._fusionSkill do
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R8 in 'UnsetPending'

    (self._combatSkill)[#self._combatSkill + 1] = (self._fusionSkill)[index]
  end
end

Window_SkillInfo.InitResisterEvent = function(self)
  -- function num : 0_15
  registerEvent("EventSkillWindowUpdate", "PaGlobalFunc_FromClient_Skill_WindowUpdate")
  registerEvent("onScreenResize", "PaGlobalFunc_Skill_Resize")
end

Window_SkillInfo.Initialize = function(self)
  -- function num : 0_16
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local characterActorProxyWrapper = getCharacterActor((selfPlayer:get()):getActorKeyRaw())
  if characterActorProxyWrapper == nil then
    return 
  end
  local mentalType = characterActorProxyWrapper:getCombatResourceType()
  if (CppEnums.CombatResourceType).CombatType_MP == mentalType then
    self._needMantalString = PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_NeedMP")
    self._mantalString = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MP")
  else
    if (CppEnums.CombatResourceType).CombatType_FP == mentalType then
      self._needMantalString = PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_NeedFP")
      self._mantalString = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_FP")
    else
      if (CppEnums.CombatResourceType).CombatType_EP == mentalType then
        self._needMantalString = PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_NeedEP")
        self._mantalString = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_EP")
      else
        if (CppEnums.CombatResourceType).CombatType_BP == mentalType then
          self._needMantalString = PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_NeedBP")
          self._mantalString = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_BP")
        end
      end
    end
  end
  self._renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_SkillWindow}, false)
  self:InitControl()
  self:InitEvent()
  self:InitResisterEvent()
  self:Update()
end

Window_SkillInfo.Clear = function(self)
  -- function num : 0_17
  self._combatSkill = {}
  self._awakenSkill = {}
  self._fusionSkill = {}
  self._combatTable = {}
  self._awakenTable = {}
  self._currentSkillListInfo = {}
  self._currentSkillListUI = {}
  self:SkillDetailClear()
  self._currentSkillIndex = nil
  ;
  ((((self._ui)._right)._list2_Skill):getElementManager()):clearKey()
  ;
  (((self._ui)._right)._radioButton_LearnSkill):SetCheck(false)
  ;
  (((self._ui)._right)._radioButton_SkillBasic):SetCheck(false)
  ;
  (((self._ui)._right)._radioButton_SkillAwaken):SetCheck(false)
end

Window_SkillInfo.Update = function(self)
  -- function num : 0_18
  self:UpdateStat()
  self:UpdateSkillData()
  self:UpdateSkillTable(self._combatSkill, self._combatTable)
  self:UpdateSkillTable(self._awakenSkill, self._awakenTable)
end

Window_SkillInfo.UpdateSkillTable = function(self, oldTable, newTable)
  -- function num : 0_19
  local index = 0
  local skillName = ""
  local oldSkillTable = {}
  local oldSkillIndex = 0
  local insertable = false
  local currentOldIndex = 0
  for skillIndex = 0, #oldTable do
    local skillInfo = oldTable[skillIndex]
    if skillInfo == nil then
      return 
    end
    skillName = (string.gsub)(skillInfo._name, "I", "")
    skillName = (string.gsub)(skillName, "V", "")
    skillName = (string.gsub)(skillName, "X", "")
    skillName = (string.gsub)(skillName, "�\185", "")
    skillName = (string.gsub)(skillName, ":", "")
    skillName = (string.gsub)(skillName, " ", "")
    currentOldIndex = #oldSkillTable
    for oldIndex = 0, #oldSkillTable do
      if oldSkillTable[oldIndex] == skillName then
        insertable = true
        currentOldIndex = oldIndex
        break
      end
    end
    do
      if insertable == true then
        local skillCount = (newTable[currentOldIndex])._skillCount
        -- DECOMPILER ERROR at PC74: Confused about usage of register: R15 in 'UnsetPending'

        ;
        ((newTable[currentOldIndex])._skillTable)[skillCount] = skillInfo
        -- DECOMPILER ERROR at PC77: Confused about usage of register: R15 in 'UnsetPending'

        ;
        (newTable[currentOldIndex])._skillCount = skillCount + 1
      else
        do
          do
            oldSkillTable[oldSkillIndex] = skillName
            oldSkillIndex = oldSkillIndex + 1
            newTable[index] = {_skillCount = 0, 
_skillTable = {}
}
            -- DECOMPILER ERROR at PC88: Confused about usage of register: R14 in 'UnsetPending'

            ;
            ((newTable[index])._skillTable)[0] = skillInfo
            -- DECOMPILER ERROR at PC90: Confused about usage of register: R14 in 'UnsetPending'

            ;
            (newTable[index])._skillCount = 1
            index = index + 1
            insertable = false
            -- DECOMPILER ERROR at PC93: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC93: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC93: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC93: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
  end
end

Window_SkillInfo.UpdateStat = function(self)
  -- function num : 0_20
  local selfPlayerActorProxy = (getSelfPlayer()):get()
  if selfPlayerActorProxy == nil then
    return 
  end
  local skillPointInfo = ToClient_getSkillPointInfo(0)
  if skillPointInfo == -1 then
    return 
  end
  self._remainSkillPoint = skillPointInfo._remainPoint
  local skillPoint = PAGetString(Defines.StringSheet_RESOURCE, "SKILL_TEXT_POINT") .. "  " .. tostring(skillPointInfo._remainPoint) .. " / " .. tostring(skillPointInfo._acquirePoint)
  local attackPoint = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BATTLEPOINT_ATTACKPOINT") .. "  " .. tostring(ToClient_getOffence())
  local awakenAttackPoint = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BATTLEPOINT_AWAKENATTACKPOINT") .. "  " .. tostring(ToClient_getAwakenOffence())
  local maxMp = self._mantalString .. "  " .. selfPlayerActorProxy:getMaxMp()
  ;
  (((self._ui)._body)._staticText_SkillPoint):SetText(skillPoint)
  ;
  (((self._ui)._body)._staticText_AttackPoint):SetText(attackPoint)
  ;
  (((self._ui)._body)._staticText_AwakenAttackPoint):SetText(awakenAttackPoint)
  ;
  (((self._ui)._body)._staticText_Mp):SetText(maxMp)
end

Window_SkillInfo.InitControl = function(self)
  -- function num : 0_21
  local body = (self._ui)._body
  local right = (self._ui)._right
  local ui = self._ui
  body._staticText_SkillPoint = (UI.getChildControl)(ui._static_BodyBg, "StaticText_SkillPoint")
  body._staticText_AttackPoint = (UI.getChildControl)(ui._static_BodyBg, "StaticText_AttackPoint")
  body._staticText_AwakenAttackPoint = (UI.getChildControl)(ui._static_BodyBg, "StaticText_AwakenAttackPoint")
  body._staticText_Mp = (UI.getChildControl)(ui._static_BodyBg, "StaticText_Mp")
  body._static_IconBg = (UI.getChildControl)(ui._static_BodyBg, "Static_SkillIconBg")
  body._static_Icon = (UI.getChildControl)((ui._body)._static_IconBg, "Static_SkillIcon")
  body._staticText_Name = (UI.getChildControl)(ui._static_BodyBg, "StaticText_SkillName")
  body._staticText_Desc = (UI.getChildControl)(ui._static_BodyBg, "StaticText_SkillDesc")
  ;
  (body._staticText_Desc):SetAutoResize(true)
  ;
  (body._staticText_Desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  body._staticText_NeedResource = (UI.getChildControl)(ui._static_BodyBg, "StaticText_NeedMp")
  ;
  (body._staticText_NeedResource):SetAutoResize(true)
  body._static_KeyGuide = (UI.getChildControl)(ui._static_BodyBg, "Static_Key_Guide")
  body._radioButton_Lock = (UI.getChildControl)(body._static_KeyGuide, "Radiobutton_Lock_Key")
  body._radioButton_SkillDemo = (UI.getChildControl)(body._static_KeyGuide, "Radiobutton_Demo_Key")
  body._staticText_EffectTitle = (UI.getChildControl)(ui._static_BodyBg, "StaticText_Skill_Effect_Title")
  body._staticText_EffectDesc = (UI.getChildControl)(ui._static_BodyBg, "StaticText_Skill_EffectDesc")
  ;
  (body._staticText_EffectDesc):SetAutoResize(true)
  body._static_Divider1 = (UI.getChildControl)(ui._static_BodyBg, "Static_Divider1")
  body._static_Divider2 = (UI.getChildControl)(ui._static_BodyBg, "Static_Divider2")
  self._defaultDividerPosY = (body._static_Divider2):GetPosY()
  body._staticText_Command = (UI.getChildControl)(ui._static_BodyBg, "StaticText_KeyGuide_Basic")
  body._static_CommandFirst = (UI.getChildControl)(ui._static_BodyBg, "Static_KeyGuide_Basic_First")
  body._static_CommandPlus = (UI.getChildControl)(ui._static_BodyBg, "Static_KeyGuide_Basic_Plus")
  body._static_CommandSecend = (UI.getChildControl)(ui._static_BodyBg, "Static_KeyGuide_Basic_Second")
  body._staticText_RideCommand = (UI.getChildControl)(ui._static_BodyBg, "StaticText_KeyGuide_Ride")
  body._static_RideCommandFirst = (UI.getChildControl)(ui._static_BodyBg, "Static_KeyGuide_Ride_First")
  body._static_RideCommandPlus = (UI.getChildControl)(ui._static_BodyBg, "Static_KeyGuide_Ride_Plus")
  body._static_RideCommandSecend = (UI.getChildControl)(ui._static_BodyBg, "Static_KeyGuide_Ride_Second")
  ;
  (body._static_CommandFirst):SetShow(false)
  ;
  (body._static_CommandPlus):SetShow(false)
  ;
  (body._static_CommandSecend):SetShow(false)
  ;
  (body._staticText_RideCommand):SetShow(false)
  ;
  (body._static_RideCommandFirst):SetShow(false)
  ;
  (body._static_RideCommandPlus):SetShow(false)
  ;
  (body._static_RideCommandSecend):SetShow(false)
  right._radioButton_LearnSkill = (UI.getChildControl)(ui._static_RightBg, "RadioButton_LearnSkill")
  right._radioButton_SkillBasic = (UI.getChildControl)(ui._static_RightBg, "RadioButton_SkillBasic")
  right._radioButton_SkillAwaken = (UI.getChildControl)(ui._static_RightBg, "RadioButton_SkillAwaken")
  right._staticText_Tooltip = (UI.getChildControl)(ui._static_RightBg, "StaticText_Tooltip")
  right._list2_Skill = (UI.getChildControl)(ui._static_RightBg, "List2_Skill")
  right._static_KeyGuide = (UI.getChildControl)(ui._static_RightBg, "Static_KeyGuide")
  right._radioButton_learnSkillKey = (UI.getChildControl)(right._static_KeyGuide, "Radiobutton_Learn_Skill_Key")
  right._radiobutton_ResetSkillKey = (UI.getChildControl)(right._static_KeyGuide, "Radiobutton_SkillPoint_Reset_Key")
  self._currentTabIndex = 0
end

Window_SkillInfo.InitEvent = function(self)
  -- function num : 0_22
  local right = (self._ui)._right
  local body = (self._ui)._body
  Panel_Window_Skill_Renew:RegisterUpdateFunc("PaGlobalFunc_Skill_UpdatePanelView")
  ;
  ((self._ui)._static_BodyBg):addInputEvent("Mouse_LDown", "PaGlobalFunc_Skill_SetPanelViewStart(true)")
  ;
  ((self._ui)._static_BodyBg):addInputEvent("Mouse_RDown", "PaGlobalFunc_Skill_SetPanelViewStart(false)")
  ;
  ((self._ui)._static_BodyBg):addInputEvent("Mouse_Out", "PaGlobalFunc_Skill_SetPanelViewEnd()")
  ;
  ((self._ui)._static_BodyBg):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SetPanelViewEnd(true)")
  ;
  ((self._ui)._static_BodyBg):addInputEvent("Mouse_RUp", "PaGlobalFunc_Skill_SetPanelViewEnd(false)")
  ;
  ((self._ui)._static_BodyBg):addInputEvent("Mouse_UpScroll", "PaGlobalFunc_Skill_SetCameraZoom(true)")
  ;
  ((self._ui)._static_BodyBg):addInputEvent("Mouse_DownScroll", "PaGlobalFunc_Skill_SetCameraZoom(false)")
  ;
  (right._radioButton_LearnSkill):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SelectTitle(" .. (self._config)._title_Learn .. ")")
  ;
  (right._radioButton_SkillBasic):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SelectTitle(" .. (self._config)._title_Basic .. ")")
  ;
  (right._radioButton_SkillAwaken):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SelectTitle(" .. (self._config)._title_Awaken .. ")")
  ;
  (right._radioButton_learnSkillKey):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_LearnButton()")
  ;
  (right._radiobutton_ResetSkillKey):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_ResetButton()")
  ;
  (right._list2_Skill):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_Skill_List2EventControlCreate")
  ;
  (right._list2_Skill):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (body._radioButton_Lock):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_LockButton()")
  ;
  (body._radioButton_SkillDemo):addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SkillAction()")
end

PaGlobalFunc_Skill_UpdatePanelView = function()
  -- function num : 0_23 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  if self._isLDown == false and self._isRDown == false then
    return 
  end
  local currentPosX = getMousePosX()
  local currentPosY = getMousePosY()
  if currentPosX == self._movePosX and currentPosY == self._movePosY then
    return 
  end
  local radianAngle = (self._movePosX - currentPosX) / (getScreenSizeX() / 10)
  local cameraPitch = (currentPosY - self._movePosY) / (getScreenSizeY() / 2)
  self._movePosX = currentPosX
  self._movePosY = currentPosY
  if self._isLDown == true then
    ToClient_LearnSkillCameraSetRotation(radianAngle * 30, cameraPitch * 90)
  end
  if self._isRDown == true then
    ToClient_LearnSkillCameraSetPosition(radianAngle * 0.8, -(cameraPitch * 2))
  end
end

PaGlobalFunc_Skill_SetPanelViewStart = function(isLButton)
  -- function num : 0_24 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  if isLButton == true then
    self._isLDown = true
  else
    self._isRDown = true
  end
  self._movePosX = getMousePosX()
  self._movePosY = getMousePosY()
end

PaGlobalFunc_Skill_SetPanelViewEnd = function(isLButton)
  -- function num : 0_25 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  if isLButton == nil then
    self._isLDown = false
    self._isRDown = false
  else
    if isLButton == true then
      self._isLDown = false
    else
      self._isRDown = false
    end
  end
end

PaGlobalFunc_Skill_SetCameraZoom = function(scrollValue)
  -- function num : 0_26
  local upValue = 35
  if scrollValue == true then
    upValue = -upValue
  end
  ToClient_LearnSkillCameraSetZoom(upValue)
end

PaGlobalFunc_Skill_SkillAction = function()
  -- function num : 0_27 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  if self._title_Learn == self._currentTitle then
    return 
  end
  local skillInfo = (self._currentSkillListInfo)[self._currentSkillIndex]
  if skillInfo == nil then
    return 
  end
  local skillStaticStatusWrapper = getSkillStaticStatus(skillInfo._no, 1)
  ToClient_LearnSkillCameraStartSkillAction(skillStaticStatusWrapper:get())
end

PaGlobalFunc_Skill_Open = function(isDialog)
  -- function num : 0_28 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  if isDialog == true then
    PaGlobalFunc_MainDialog_Hide()
  end
  if isDeadInWatchingMode() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYEOPENALERT_INDEAD"))
    return 
  end
  if ToClient_getJoinGuildBattle() == true then
    return 
  end
  ToClient_SaveUiInfo(false)
  if isFlushedUI() == true then
    return 
  end
  if ToClient_LearnSkillCameraIsShow() == true then
    return 
  end
  if ToClient_LearnSkillCameraIsShowable() == false then
    return 
  end
  if IsSelfPlayerWaitAction() == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_DYE"))
    return 
  end
  if selfPlayerIsInCompetitionArea() == true then
    return 
  end
  if Panel_Win_System:GetShow() == true then
    allClearMessageData()
  end
  Panel_Window_Skill_Renew:SetShow(true)
  ToClient_LearnSkillCameraShow()
  ToClient_LearnSkillCameraLoadCharcterAndCamera()
  SetUIMode((Defines.UIMode).eUIMode_SkillWindow)
  ;
  (self._renderMode):set()
  self:SkillDetailClear()
  self:Update()
  PaGlobalFunc_Skill_SelectTitle(self._currentTitle)
end

PaGlobalFunc_Skill_Close = function()
  -- function num : 0_29 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  if PaGlobalFunc_Skill_GetShow() == false then
    return 
  end
  if ToClient_LearnSkillCameraHide() == false then
    return 
  end
  SetUIMode((Defines.UIMode).eUIMode_Default)
  ;
  (self._renderMode):reset()
  Panel_Window_Skill_Renew:SetShow(false)
end

PaGlobalFunc_Skill_GetShow = function()
  -- function num : 0_30
  return Panel_Window_Skill_Renew:GetShow()
end

PaGlobalFunc_FromClient_Skill_luaLoadComplete = function()
  -- function num : 0_31 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  self:Initialize()
  self:Resize()
end

PaGlobalFunc_FromClient_Skill_WindowUpdate = function()
  -- function num : 0_32 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  self:Update()
  PaGlobalFunc_Skill_SelectTitle(self._currentTitle)
end

Panel_Window_Skill_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "Toggle_SkillTab_forPadEventFunc(-1)")
Panel_Window_Skill_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "Toggle_SkillTab_forPadEventFunc(1)")
Toggle_SkillTab_forPadEventFunc = function(value)
  -- function num : 0_33 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  self._currentTabIndex = self._currentTabIndex + value
  if self._currentTabIndex < 0 then
    self._currentTabIndex = 2
  else
    if self._currentTabIndex > 2 then
      self._currentTabIndex = 0
    end
  end
  if self._currentTabIndex == 0 then
    PaGlobalFunc_Skill_SelectTitle((self._config)._title_Learn)
  else
    if self._currentTabIndex == 1 then
      PaGlobalFunc_Skill_SelectTitle((self._config)._title_Basic)
    else
      if self._currentTabIndex == 2 then
        PaGlobalFunc_Skill_SelectTitle((self._config)._title_Awaken)
      end
    end
  end
end

Window_SkillInfo.Resize = function(self)
  -- function num : 0_34
  local body = (self._ui)._body
  local right = (self._ui)._right
  Panel_Window_Skill_Renew:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_Window_Skill_Renew:SetPosX(0)
  Panel_Window_Skill_Renew:SetPosY(0)
  ;
  ((self._ui)._static_RightBg):ComputePos()
  ;
  ((self._ui)._static_BodyBg):SetSize(((self._ui)._static_BodyBg):GetSizeX(), Panel_Window_Skill_Renew:GetSizeY())
  ;
  ((self._ui)._static_RightBg):SetSize(((self._ui)._static_RightBg):GetSizeX(), Panel_Window_Skill_Renew:GetSizeY())
  ;
  (right._list2_Skill):SetSize((right._list2_Skill):GetSizeX(), (right._static_KeyGuide):GetPosY() - (right._list2_Skill):GetPosY() - 20)
  ;
  (body._staticText_Command):SetPosX(((self._ui)._static_RightBg):GetPosX() - (body._staticText_Command):GetSizeX() - 20)
  ;
  (body._static_KeyGuide):ComputePos()
  ;
  (right._static_KeyGuide):ComputePos()
end

PaGlobalFunc_Skill_GetEffectControl = function()
  -- function num : 0_35 , upvalues : Window_SkillInfo
  local self = Window_SkillInfo
  return (self._ui)._static_IconEffect
end

PaGlobalFunc_Skill_GetPanel = function()
  -- function num : 0_36
  return Panel_Window_Skill_Renew
end

PaGlobalFunc_Skill_Resize = function()
  -- function num : 0_37 , upvalues : Window_SkillInfo
  Window_SkillInfo:Resize()
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_Skill_luaLoadComplete")

