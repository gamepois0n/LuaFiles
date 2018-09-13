local Window_SkillInfo = {
  _ui = {
    _body = {},
    _right = {},
    _static_BodyBg = UI.getChildControl(Panel_Window_Skill, "Static_BodyBg"),
    _static_RightBg = UI.getChildControl(Panel_Window_Skill, "Static_RightBg"),
    _static_IconEffect = UI.getChildControl(Panel_Window_Skill, "Static_Icon_Skill_Effect")
  },
  _config = {
    _title_Learn = 0,
    _title_Basic = 1,
    _title_Awaken = 2
  },
  _combatSkill = {},
  _awakenSkill = {},
  _fusionSkill = {},
  _combatTable = {
    _skillCount = 0,
    _skillTable = {}
  },
  _awakenTable = {
    _skillCount = 0,
    _skillTable = {}
  },
  _currentSkillListInfo = {},
  _currentSkillListUI = {},
  _currentSkillIndex = 0,
  _lastSelectedUI = nil,
  _currentTitle = 0,
  _renderMode,
  _isLDown = false,
  _isRDown = false,
  _movePosX = 0,
  _movePosY = 0,
  _needMantalString,
  _mantalString,
  _defaultDividerPosY,
  _currentTabIndex = 0,
  _remainSkillPoint,
  _selfPlayerLevel,
  _isDialog = false,
  _prevScrollIndex = 0
}
function Window_SkillInfo:GetFusionSkillFromCell(cellTable)
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  local index = 0
  local skillIndex = 0
  local table = {}
  for row = 0, rows - 1 do
    for col = 0, cols - 1 do
      local cell = cellTable:atPointer(col, row)
      if true == cell:isSkillType() then
        local maxFusionSkill = ToClient_getFusionSkillListCount(index)
        for fusionIndex = 0, maxFusionSkill - 1 do
          local fusionSkillNo = ToClient_getFusionSkillNo(index, fusionIndex)
          local fusionMainNo = ToClient_getFusionMainSkillNo(index, fusionIndex)
          local fusionSubNo = ToClient_getFusionSubSkillNo(index, fusionIndex)
          table[skillIndex] = self:SetSkillInfo(fusionSkillNo)
          local skillTypeStaticWrapper = getSkillTypeStaticStatus(fusionMainNo)
          if nil == skillTypeStaticWrapper then
            return
          end
          local skillLearndLevel = getLearnedSkillLevel(skillTypeStaticWrapper)
          table[skillIndex]._learndLevelMainSkill = skillLearndLevel
          skillTypeStaticWrapper = getSkillTypeStaticStatus(fusionSubNo)
          if nil == skillTypeStaticWrapper then
            return
          end
          skillLearndLevel = getLearnedSkillLevel(skillTypeStaticWrapper)
          table[skillIndex]._learndLevelSubSkill = skillLearndLevel
          if 1 == table[skillIndex]._learndLevelMainSkill and 1 == table[skillIndex]._learndLevelSubSkill then
            table[skillIndex]._learnable = true
          else
            table[skillIndex]._learnable = false
          end
          skillIndex = skillIndex + 1
        end
        index = index + 1
      end
    end
  end
  return table
end
function Window_SkillInfo:GetSkillFromCell(cellTable)
  local cols = cellTable:capacityX()
  local rows = cellTable:capacityY()
  local index = 0
  local table = {}
  for row = 0, rows - 1 do
    for col = 0, cols - 1 do
      local cell = cellTable:atPointer(col, row)
      local skillNo = cell._skillNo
      if true == cell:isSkillType() then
        local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
        if 90 ~= skillNo and true == skillTypeStaticWrapper:isValidLocalizing() then
          table[index] = self:SetSkillInfo(skillNo)
          index = index + 1
        end
      end
    end
  end
  return table
end
function Window_SkillInfo:SetSkillInfo(skillNo)
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
  if nil == skillTypeStaticWrapper then
    return
  end
  local skillTypeStatic = skillTypeStaticWrapper:get()
  if nil == skillTypeStatic then
    return
  end
  local skillLevelInfo = getSkillLevelInfo(skillNo)
  local skillLearndLevel = getLearnedSkillLevel(skillTypeStaticWrapper)
  local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
  if nil == skillStaticWrapper then
    return
  end
  local skillStatic = skillStaticWrapper:get()
  if nil == skillStatic then
    return
  end
  local havePrevActionHashKey = ToClient_LearnSkillCameraHavePrevActionHashKey(skillStatic)
  local skillInfo = {
    _name = skillTypeStaticWrapper:getName(),
    _learndLevel = skillLearndLevel,
    _learnable = skillLevelInfo._learnable,
    _usable = skillLevelInfo._usable,
    _command = skillTypeStaticWrapper:getCommand(),
    _iconPath = skillTypeStaticWrapper:getIconPath(),
    _moviePath = skillTypeStaticWrapper:getMoviePath(),
    _desc = skillTypeStaticWrapper:getDescription(),
    _buffDesc = skillStaticWrapper:getDescription(),
    _requireHp = skillStatic._requireHp,
    _requireMp = skillStatic._requireMp,
    _requireSp = skillStatic._requireSp,
    _reuseCycle = skillStatic._reuseCycle,
    _needCharacterLevel = skillStatic._needCharacterLevelForLearning,
    _needSkillPoint = skillStatic._needSkillPointForLearning,
    _key = skillStaticWrapper:getKey(),
    _no = skillNo,
    _isActive = skillTypeStaticWrapper:isActiveSkill(),
    _isPassive = skillTypeStaticWrapper:isPassiveSkill(),
    _isCommand = skillTypeStaticWrapper:isSkillCommandCheck(),
    _isLock = ToClient_isBlockSkillCommand(skillLevelInfo._skillKey),
    _isFusion = skillStaticWrapper:isFusionSkill(),
    _learndLevelMainSkill = 0,
    _learndLevelSubSkill = 0,
    _havePrevActionHashKey = havePrevActionHashKey
  }
  return skillInfo
end
function PaGlobalFunc_Skill_LearnButton()
  local self = Window_SkillInfo
  local skillInfo = self._currentSkillListInfo[self._currentSkillIndex]
  if nil == skillInfo then
    return
  end
  if false == skillInfo._learnable then
    return
  end
  local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "GUILD_MESSAGEBOX_TITLE")
  local messageboxContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_SKILLSTUDY")
  local messageboxData = {
    title = messageboxTitle,
    content = messageboxContent,
    functionYes = PaGlobalFunc_Skill_LearnConfirm,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobalFunc_Skill_LearnConfirm()
  local self = Window_SkillInfo
  local skillInfo = self._currentSkillListInfo[self._currentSkillIndex]
  if nil == skillInfo then
    return
  end
  local isSuccess = skillWindow_DoLearn(skillInfo._no)
  if true == isSuccess then
    _AudioPostEvent_SystemUiForXBOX(4, 2)
  end
end
function PaGlobalFunc_Skill_ResetButton()
  local strTemp1 = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SKILL_CLEAR_COMBAT_SKILL_TITLE")
  local strTemp2 = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SKILL_CLEAR_COMBAT_SKILL_MESSAGE")
  local messageboxData = {
    title = strTemp1,
    content = strTemp2,
    functionYes = PaGlobalFunc_Skill_ResetConfirm,
    functionCancel = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobalFunc_Skill_ResetConfirm()
  local self = Window_SkillInfo
  skillWindow_ClearSkill()
  PaGlobalFunc_Skill_SelectTitle(self._currentTitle)
end
function PaGlobalFunc_Skill_SelectTitle(titleType)
  local self = Window_SkillInfo
  local tooltip = self._ui._right._staticText_Tooltip
  local learnSkill = self._ui._right._radioButton_LearnSkill
  local basicSkill = self._ui._right._radioButton_SkillBasic
  local awakenSkill = self._ui._right._radioButton_SkillAwaken
  self._currentTabIndex = titleType
  self:Clear()
  Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "")
  Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_Up_X, "")
  if self._config._title_Learn == titleType then
    tooltip:SetText(PAGetString(Defines.StringSheet_RESOURCE, "LUA_SKILL_TAB_LEARNABLE"))
    tooltip:SetPosX(learnSkill:GetPosX() + learnSkill:GetSizeX() / 2 - tooltip:GetSizeX() / 2)
    self._currentTitle = self._config._title_Learn
    self._ui._right._radioButton_learnSkillKey:SetShow(true)
    self._ui._right._radiobutton_ResetSkillKey:SetShow(false)
    self._ui._right._radioButton_SkillDemo:SetShow(false)
    learnSkill:SetCheck(true)
    self:SetLearnableSkillList()
  elseif self._config._title_Basic == titleType then
    tooltip:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SKILL_COMBAT"))
    tooltip:SetPosX(basicSkill:GetPosX() + basicSkill:GetSizeX() / 2 - tooltip:GetSizeX() / 2)
    self._currentTitle = self._config._title_Basic
    self._ui._right._radioButton_learnSkillKey:SetShow(false)
    self._ui._right._radiobutton_ResetSkillKey:SetShow(true)
    self._ui._right._staticText_LearnableEmpty:SetShow(false)
    self._ui._right._radioButton_SkillDemo:SetShow(true)
    Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_Skill_SkillAction()")
    Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_Skill_ResetButton()")
    basicSkill:SetCheck(true)
    self:SetSkillList(self._combatTable)
  elseif self._config._title_Awaken == titleType then
  else
    _PA_LOG("\236\157\180\237\152\184\236\132\156", "\237\131\128\236\157\180\237\139\128 \237\131\128\236\158\133\236\157\180 \236\158\152\235\170\187 \235\147\164\236\150\180\236\153\148\235\139\164.")
  end
end
function Window_SkillInfo:SetLearnableSkillList()
  local index = 0
  self._ui._right._list2_Skill:getElementManager():clearKey()
  for tableIndex = 0, #self._combatTable do
    local skillCount = self._combatTable[tableIndex]._skillCount
    local skillTable = self._combatTable[tableIndex]._skillTable
    if nil == skillTable then
      return
    end
    for skillIndex = 0, skillCount - 1 do
      local skillInfo = skillTable[skillIndex]
      if nil == skillInfo then
        return
      end
      if true == skillInfo._learnable then
        self._currentSkillListInfo[index] = skillInfo
        self._ui._right._list2_Skill:getElementManager():pushKey(toInt64(0, index))
        self._ui._right._list2_Skill:requestUpdateByKey(toInt64(0, index))
        index = index + 1
      end
    end
  end
  self._ui._right._staticText_LearnableEmpty:SetShow(0 == index)
  self._ui._right._radioButton_learnSkillKey:SetShow(0 ~= index)
end
function Window_SkillInfo:SetSkillList(table)
  local index = 0
  self._ui._right._list2_Skill:getElementManager():clearKey()
  local isNext = false
  for tableIndex = 0, #table do
    local skillCount = table[tableIndex]._skillCount
    local skillTable = table[tableIndex]._skillTable
    if nil == skillTable then
      return
    end
    isNext = false
    for skillIndex = 0, skillCount - 1 do
      local skillInfo = skillTable[skillIndex]
      if nil == skillInfo then
        return
      end
      if true == isNext then
        skillIndex = skillCount
      else
        if 0 == skillIndex and 0 == skillInfo._learndLevel then
          self._currentSkillListInfo[index] = skillInfo
          self._ui._right._list2_Skill:getElementManager():pushKey(toInt64(0, index))
          self._ui._right._list2_Skill:requestUpdateByKey(toInt64(0, index))
          index = index + 1
          isNext = true
        end
        if 1 == skillInfo._learndLevel and true == skillInfo._usable then
          self._currentSkillListInfo[index] = skillInfo
          self._ui._right._list2_Skill:getElementManager():pushKey(toInt64(0, index))
          self._ui._right._list2_Skill:requestUpdateByKey(toInt64(0, index))
          index = index + 1
          isNext = true
        end
      end
    end
  end
end
function PaGlobalFunc_Skill_List2EventControlCreate(list_content, key)
  local self = Window_SkillInfo
  local id = Int64toInt32(key)
  local skillInfo = self._currentSkillListInfo[id]
  if nil == skillInfo then
    self._ui._right._list2_Skill:getElementManager():removeKey(toInt64(0, id))
    return
  end
  local uiInfo = {
    _radioButton_SkillBg = UI.getChildControl(list_content, "Radio_SkillBg"),
    _radioButton_LeftSkill = UI.getChildControl(list_content, "Radiobutton_LeftSkill"),
    _radioButton_RightSkill = UI.getChildControl(list_content, "Radiobutton_RightSkill"),
    _static_SelectedSkillBg = UI.getChildControl(list_content, "Static_SelectedSkillBg"),
    _static_SkillIcon = UI.getChildControl(list_content, "Static_Skill_Box2"),
    _staticText_Name = UI.getChildControl(list_content, "StaticText_Skill_Name"),
    _staticText_RequireLevel = UI.getChildControl(list_content, "StaticText_Skill_Require_Level"),
    _static_LockIcon = UI.getChildControl(list_content, "Static_Skill_Lock_Icon"),
    _progress2_ProgressBar = UI.getChildControl(list_content, "Progress2_1")
  }
  local rate = 100 * self._remainSkillPoint / skillInfo._needSkillPoint
  if 1 == skillInfo._learndLevel then
    rate = 100
  end
  uiInfo._progress2_ProgressBar:SetProgressRate(rate)
  uiInfo._static_SelectedSkillBg:SetShow(self._currentSkillIndex == id)
  uiInfo._static_SkillIcon:SetShow(true)
  uiInfo._static_SkillIcon:ChangeTextureInfoName("icon/" .. skillInfo._iconPath)
  uiInfo._static_SkillIcon:getBaseTexture():setUV(0, 0, 1, 1)
  uiInfo._static_SkillIcon:setRenderTexture(uiInfo._static_SkillIcon:getBaseTexture())
  uiInfo._staticText_Name:SetText(skillInfo._name)
  local requireDesc = self:GetRequireDesc(uiInfo._static_SelectedSkillBg, uiInfo._staticText_RequireLevel, id)
  uiInfo._staticText_RequireLevel:SetText(requireDesc)
  self._currentSkillListUI[id] = uiInfo
  if self._config._title_Learn == self._currentTitle or self._currentSkillIndex ~= id then
    uiInfo._radioButton_LeftSkill:SetShow(false)
    uiInfo._radioButton_RightSkill:SetShow(false)
    uiInfo._radioButton_SkillBg:addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_LearnButton()")
  else
    uiInfo._radioButton_LeftSkill:SetShow(1 ~= self:FindSkillCount(skillInfo))
    uiInfo._radioButton_RightSkill:SetShow(1 ~= self:FindSkillCount(skillInfo))
    uiInfo._radioButton_SkillBg:addInputEvent("Mouse_LUp", "")
    if _ContentsGroup_isConsolePadControl then
      Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_DpadLeft, "PaGlobalFunc_Skill_SkillHandle(" .. tostring(id) .. ",-1)")
      Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_DpadRight, "PaGlobalFunc_Skill_SkillHandle(" .. tostring(id) .. ",1)")
    end
  end
  if _ContentsGroup_isConsolePadControl then
    uiInfo._radioButton_SkillBg:addInputEvent("Mouse_On", "PaGlobalFunc_Skill_SelectSkill(" .. id .. ")")
  end
end
function Window_SkillInfo:GetRequireDesc(selectControl, descControl, id)
  local skillInfo = self._currentSkillListInfo[id]
  local desc
  if nil == skillInfo then
    return
  end
  selectControl:SetColor(Defines.Color.C_FFEFEFEF)
  descControl:SetFontColor(Defines.Color.C_FFEFEFEF)
  if 1 == skillInfo._learndLevel then
    desc = PAGetString(Defines.StringSheet_RESOURCE, "LUA_SKILL_LEARNED")
    return desc
  elseif true == skillInfo._learnable then
    desc = PAGetString(Defines.StringSheet_RESOURCE, "LUA_SKILL_TAB_LEARNABLE")
    return desc
  end
  descControl:SetFontColor(Defines.Color.C_FF888888)
  selectControl:SetColor(Defines.Color.C_FF888888)
  if 0 == skillInfo._needCharacterLevel then
    desc = PAGetStringParam1(Defines.StringSheet_RESOURCE, "LUA_SKILL_LEARNCONDITION", "condition", PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_QuestGain"))
  elseif self._selfPlayerLevel < skillInfo._needCharacterLevel then
    desc = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ARSHA_LIMIT_LEVEL")
  elseif self._remainSkillPoint < skillInfo._needSkillPoint then
    desc = PAGetString(Defines.StringSheet_RESOURCE, "LUA_SKILL_SKILLPOINTLESS")
  else
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTINFO_NEEDSKILLTITLE")
  end
  return desc
end
function Window_SkillInfo:FindSkillCount(skillInfo)
  if self._config._title_Basic == self._currentTitle then
    for tableIndex = 0, #self._combatTable do
      local skillCount = self._combatTable[tableIndex]._skillCount
      local skillTable = self._combatTable[tableIndex]._skillTable
      if nil == skillTable then
        return
      end
      for skillIndex = 0, skillCount - 1 do
        if skillTable[skillIndex] == skillInfo then
          return skillCount
        end
      end
    end
  else
    for tableIndex = 0, #self._awakenTable do
      local skillCount = self._awakenTable[tableIndex]._skillCount
      local skillTable = self._awakenTable[tableIndex]._skillTable
      if nil == skillTable then
        return
      end
      for skillIndex = 0, skillCount - 1 do
        if skillTable[skillIndex] == skillInfo then
          return skillCount
        end
      end
    end
  end
  return 1
end
function PaGlobalFunc_Skill_SkillHandle(id, direction)
  local self = Window_SkillInfo
  local skillInfo = self._currentSkillListInfo[id]
  local findTableIndex = -1
  local findSkillIndex = -1
  if nil == skillInfo then
    return
  end
  if self._config._title_Basic == self._currentTitle then
    for tableIndex = 0, #self._combatTable do
      local skillCount = self._combatTable[tableIndex]._skillCount
      local skillTable = self._combatTable[tableIndex]._skillTable
      if nil == skillTable then
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
  end
  if -1 == findTableIndex or -1 == findSkillIndex then
    return
  end
  local newSkillInfo
  if self._config._title_Basic == self._currentTitle then
    newSkillInfo = self._combatTable[findTableIndex]._skillTable[findSkillIndex + direction]
  else
    newSkillInfo = self._awakenTable[findTableIndex]._skillTable[findSkillIndex + direction]
  end
  if nil == newSkillInfo then
    return
  end
  self._currentSkillListInfo[id] = newSkillInfo
  self._ui._right._list2_Skill:requestUpdateByKey(toInt64(0, id))
  PaGlobalFunc_Skill_SelectSkill(id)
end
function PaGlobalFunc_Skill_SelectSkill(id)
  local self = Window_SkillInfo
  local body = self._ui._body
  self:SkillDetailClear()
  local skillInfo = self._currentSkillListInfo[id]
  if nil == skillInfo then
    return
  end
  local skillUI = self._currentSkillListUI[id]
  if nil == skillUI then
    return
  end
  if nil ~= self._lastSelectedUI then
    self._lastSelectedUI._static_SelectedSkillBg:SetShow(false)
  end
  skillUI._static_SelectedSkillBg:SetShow(true)
  body._static_Icon:SetShow(true)
  body._static_IconBg:SetShow(true)
  body._staticText_EffectTitle:SetShow(true)
  body._static_Icon:ChangeTextureInfoName("Icon/" .. skillInfo._iconPath)
  body._static_Icon:getBaseTexture():setUV(0, 0, 1, 1)
  body._static_Icon:setRenderTexture(body._static_Icon:getBaseTexture())
  body._staticText_Name:SetText(skillInfo._name)
  body._staticText_Desc:SetText(skillInfo._desc)
  body._staticText_Desc:SetPosY(self._ui._body._staticText_Name:GetPosY() + self._ui._body._staticText_Name:GetSizeY())
  body._staticText_EffectDesc:SetText(skillInfo._buffDesc)
  body._staticText_EffectDesc:SetPosY(getScreenSizeY() - body._staticText_EffectDesc:GetSizeY() - 100)
  body._staticText_EffectTitle:SetPosY(body._staticText_EffectDesc:GetPosY() - body._staticText_EffectTitle:GetSizeY() - 5)
  local needResource = ""
  local haveResource = false
  if 1 < skillInfo._requireHp then
    needResource = needResource .. PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_SKILL_TXT_NEEDHP") .. " " .. skillInfo._requireHp .. "\n"
    haveResource = true
  end
  if 1 < skillInfo._requireMp then
    needResource = needResource .. self._needMantalString .. " " .. skillInfo._requireMp .. "\n"
    haveResource = true
  end
  if 1 < skillInfo._requireSp then
    needResource = needResource .. PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_SKILL_TXT_NEEDSP") .. " " .. skillInfo._requireSp .. "\n"
    haveResource = true
  end
  body._staticText_NeedResource:SetPosY(self._ui._body._staticText_Desc:GetPosY() + self._ui._body._staticText_Desc:GetSizeY())
  body._staticText_NeedResource:SetText(needResource)
  body._staticText_NeedResource:SetSize(body._staticText_NeedResource:GetSizeX(), body._staticText_NeedResource:GetTextSizeY())
  body._staticText_Command:SetSize(body._staticText_Command:GetSizeX(), body._static_Divider2:GetPosY() - body._static_Divider1:GetPosY())
  body._staticText_Command:SetPosX(self._ui._static_RightBg:GetPosX() - body._staticText_Command:GetSizeX() - 20)
  local dividerCenterSizeY = (body._static_Divider2:GetPosY() - body._static_Divider1:GetPosY()) / 2
  body._staticText_Command:SetText(skillInfo._command)
  local yGap = 0
  if body._staticText_Command:GetSizeY() >= 90 then
    yGap = (body._staticText_Command:GetTextSizeY() - 90) / 2
  end
  body._staticText_Command:SetPosY(body._static_Divider1:GetPosY() + dividerCenterSizeY - body._staticText_Command:GetSizeY() / 2 + yGap)
  local resourcePosY
  if true == haveResource then
    resourcePosY = body._staticText_NeedResource:GetPosY() + body._staticText_NeedResource:GetSizeY() + 10
  else
    resourcePosY = body._staticText_Desc:GetPosY() + body._staticText_Desc:GetSizeY() + 10
  end
  local commendPosY = body._staticText_Command:GetPosY() + body._staticText_Command:GetSizeY() + 10
  local needResourcePosY = math.max(resourcePosY, commendPosY)
  local dividerPosY = body._static_Divider2:GetPosY()
  body._static_Divider2:SetPosY(math.max(needResourcePosY, dividerPosY))
  self._lastSelectedUI = skillUI
  local prevIndex = self._currentSkillIndex
  self._currentSkillIndex = id
  if true == skillInfo._havePrevActionHashKey then
    self._ui._right._radioButton_SkillDemo:SetShow(true)
    Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_Skill_SkillAction()")
  else
    self._ui._right._radioButton_SkillDemo:SetShow(false)
    Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_Up_X, "")
  end
  self._ui._right._list2_Skill:requestUpdateByKey(toInt64(0, prevIndex))
  self._ui._right._list2_Skill:requestUpdateByKey(toInt64(0, id))
end
function Window_SkillInfo:SkillDetailClear()
  local body = self._ui._body
  body._staticText_Name:SetText("")
  body._staticText_Desc:SetText("")
  body._staticText_EffectTitle:SetShow(false)
  body._staticText_EffectDesc:SetText("")
  body._staticText_NeedResource:SetText("")
  body._staticText_Command:SetText("")
  body._static_Icon:SetShow(false)
  body._static_IconBg:SetShow(false)
  body._static_Divider2:SetPosY(self._defaultDividerPosY)
end
function Window_SkillInfo:UpdateSkillData()
  local selfPlayerActorProxyWrapper = getSelfPlayer()
  if nil == selfPlayerActorProxyWrapper then
    return
  end
  local classType = selfPlayerActorProxyWrapper:getClassType()
  if classType < 0 then
    return
  end
  local cellTable = getCombatSkillTree(classType)
  if nil == cellTable then
    return
  end
  self._combatSkill = {}
  self._combatSkill = self:GetSkillFromCell(cellTable)
  cellTable = nil
  cellTable = getAwakeningWeaponSkillTree(classType)
  if nil == cellTable then
    return
  end
  self._awakenSkill = {}
  self._awakenSkill = self:GetSkillFromCell(cellTable)
  cellTable = nil
  cellTable = getFusionSkillTree()
  if nil == cellTable then
    return
  end
  self._fusionSkill = {}
  self._fusionSkill = self:GetFusionSkillFromCell(cellTable)
  cellTable = nil
  for index = 0, #self._fusionSkill do
    self._combatSkill[#self._combatSkill + 1] = self._fusionSkill[index]
  end
end
function Window_SkillInfo:InitResisterEvent()
  registerEvent("progressEventCancelByAttacked", "PaGlobalFunc_FromClient_Skill_CancelByAttacked")
  registerEvent("EventSelfPlayerPreDead", "PaGlobalFunc_FromClient_Skill_HideByDead")
  registerEvent("EventSkillWindowUpdate", "PaGlobalFunc_FromClient_Skill_WindowUpdate")
  registerEvent("EventSkillWindowClearSkillAll", "PaGlobalFunc_FromClient_Skill_WindowUpdate")
  registerEvent("onScreenResize", "PaGlobalFunc_Skill_Resize")
end
function PaGlobalFunc_FromClient_Skill_CancelByAttacked()
  local self = Window_SkillInfo
  if false == PaGlobalFunc_Skill_GetShow() then
    return
  end
  PaGlobalFunc_Skill_Close()
end
function PaGlobalFunc_FromClient_Skill_HideByDead()
  local self = Window_SkillInfo
  if false == PaGlobalFunc_Skill_GetShow() then
    return
  end
  PaGlobalFunc_Skill_Close()
end
function Window_SkillInfo:Initialize()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local characterActorProxyWrapper = getCharacterActor(selfPlayer:get():getActorKeyRaw())
  if nil == characterActorProxyWrapper then
    return
  end
  local mentalType = characterActorProxyWrapper:getCombatResourceType()
  if CppEnums.CombatResourceType.CombatType_MP == mentalType then
    self._needMantalString = PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_NeedMP")
    self._mantalString = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_MP")
  elseif CppEnums.CombatResourceType.CombatType_FP == mentalType then
    self._needMantalString = PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_NeedFP")
    self._mantalString = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_FP")
  elseif CppEnums.CombatResourceType.CombatType_EP == mentalType then
    self._needMantalString = PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_NeedEP")
    self._mantalString = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_EP")
  elseif CppEnums.CombatResourceType.CombatType_BP == mentalType then
    self._needMantalString = PAGetString(Defines.StringSheet_GAME, "Lua_TooltipSkill_NeedBP")
    self._mantalString = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_BP")
  end
  self._renderMode = RenderModeWrapper.new(100, {
    Defines.RenderMode.eRenderMode_SkillWindow
  }, false)
  self._renderMode:setPrefunctor(self._renderMode, PaGlobalFunc_Skill_PreRenderMode)
  self._renderMode:setClosefunctor(self._renderMode, PaGlobalFunc_Skill_CloseRenderMode)
  self:InitControl()
  self:InitEvent()
  self:InitResisterEvent()
end
function PaGlobalFunc_Skill_PreRenderMode()
end
function PaGlobalFunc_Skill_CloseRenderMode()
  local self = Window_SkillInfo
  PaGlobalFunc_Skill_Close()
end
function Window_SkillInfo:Clear()
  self._currentSkillListInfo = {}
  self._currentSkillListUI = {}
  self:SkillDetailClear()
  self._currentSkillIndex = 0
  self._ui._right._radioButton_LearnSkill:SetCheck(false)
  self._ui._right._radioButton_SkillBasic:SetCheck(false)
  self._ui._right._radioButton_SkillAwaken:SetCheck(false)
end
function Window_SkillInfo:Update()
  self:UpdateStat()
  self:UpdateSkillData()
  self._combatTable = {}
  self._awakenTable = {}
  self:UpdateSkillTable(self._combatSkill, self._combatTable)
  self:UpdateSkillTable(self._awakenSkill, self._awakenTable)
end
function Window_SkillInfo:UpdateSkillTable(oldTable, newTable)
  local index = 0
  local skillName = ""
  local oldSkillTable = {}
  local oldSkillIndex = 0
  local insertable = false
  local currentOldIndex = 0
  for skillIndex = 0, #oldTable do
    local skillInfo = oldTable[skillIndex]
    if nil == skillInfo then
      return
    end
    skillName = string.gsub(skillInfo._name, "I", "")
    skillName = string.gsub(skillName, "V", "")
    skillName = string.gsub(skillName, "X", "")
    skillName = string.gsub(skillName, ":", "")
    skillName = string.gsub(skillName, " ", "")
    currentOldIndex = #oldSkillTable
    for oldIndex = 0, #oldSkillTable do
      if oldSkillTable[oldIndex] == skillName then
        insertable = true
        currentOldIndex = oldIndex
        break
      end
    end
    if true == insertable then
      local skillCount = newTable[currentOldIndex]._skillCount
      newTable[currentOldIndex]._skillTable[skillCount] = skillInfo
      newTable[currentOldIndex]._skillCount = skillCount + 1
    else
      oldSkillTable[oldSkillIndex] = skillName
      oldSkillIndex = oldSkillIndex + 1
      newTable[index] = {
        _skillCount = 0,
        _skillTable = {}
      }
      newTable[index]._skillTable[0] = skillInfo
      newTable[index]._skillCount = 1
      index = index + 1
    end
    insertable = false
  end
end
function Window_SkillInfo:UpdateStat()
  local selfPlayerActorProxy = getSelfPlayer():get()
  if nil == selfPlayerActorProxy then
    return
  end
  local skillPointInfo = ToClient_getSkillPointInfo(0)
  if -1 == skillPointInfo then
    return
  end
  self._selfPlayerLevel = selfPlayerActorProxy:getLevel()
  self._remainSkillPoint = skillPointInfo._remainPoint
  local skillPoint = PAGetString(Defines.StringSheet_RESOURCE, "SKILL_TEXT_POINT") .. "  " .. tostring(skillPointInfo._remainPoint) .. " / " .. tostring(skillPointInfo._acquirePoint)
  local attackPoint = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BATTLEPOINT_ATTACKPOINT") .. "  " .. tostring(ToClient_getOffence())
  local awakenAttackPoint = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_BATTLEPOINT_AWAKENATTACKPOINT") .. "  " .. tostring(ToClient_getAwakenOffence())
  local maxMp = self._mantalString .. "  " .. selfPlayerActorProxy:getMaxMp()
  self._ui._body._staticText_SkillPoint:SetText(skillPoint)
  self._ui._body._staticText_AttackPoint:SetText(attackPoint)
  self._ui._body._staticText_AwakenAttackPoint:SetText(awakenAttackPoint)
  self._ui._body._staticText_Mp:SetText(maxMp)
end
function Window_SkillInfo:InitControl()
  local body = self._ui._body
  local right = self._ui._right
  local ui = self._ui
  body._staticText_SkillPoint = UI.getChildControl(ui._static_BodyBg, "StaticText_SkillPoint")
  body._staticText_AttackPoint = UI.getChildControl(ui._static_BodyBg, "StaticText_AttackPoint")
  body._staticText_AwakenAttackPoint = UI.getChildControl(ui._static_BodyBg, "StaticText_AwakenAttackPoint")
  body._staticText_Mp = UI.getChildControl(ui._static_BodyBg, "StaticText_Mp")
  body._static_IconBg = UI.getChildControl(ui._static_BodyBg, "Static_SkillIconBg")
  body._static_Icon = UI.getChildControl(ui._body._static_IconBg, "Static_SkillIcon")
  body._staticText_Name = UI.getChildControl(ui._static_BodyBg, "StaticText_SkillName")
  body._staticText_Desc = UI.getChildControl(ui._static_BodyBg, "StaticText_SkillDesc")
  body._staticText_Desc:SetAutoResize(true)
  body._staticText_Desc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  body._staticText_NeedResource = UI.getChildControl(ui._static_BodyBg, "StaticText_NeedMp")
  body._staticText_NeedResource:SetAutoResize(true)
  body._staticText_EffectTitle = UI.getChildControl(ui._static_BodyBg, "StaticText_Skill_Effect_Title")
  body._staticText_EffectDesc = UI.getChildControl(ui._static_BodyBg, "StaticText_Skill_EffectDesc")
  body._staticText_EffectDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  body._staticText_EffectDesc:SetAutoResize(true)
  body._static_Divider1 = UI.getChildControl(ui._static_BodyBg, "Static_Divider1")
  body._static_Divider2 = UI.getChildControl(ui._static_BodyBg, "Static_Divider2")
  self._defaultDividerPosY = body._static_Divider2:GetPosY()
  body._staticText_Command = UI.getChildControl(ui._static_BodyBg, "StaticText_KeyGuide_Basic")
  body._staticText_Command:SetAutoResize(true)
  body._staticText_Command:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  body._static_CommandFirst = UI.getChildControl(ui._static_BodyBg, "Static_KeyGuide_Basic_First")
  body._static_CommandPlus = UI.getChildControl(ui._static_BodyBg, "Static_KeyGuide_Basic_Plus")
  body._static_CommandSecend = UI.getChildControl(ui._static_BodyBg, "Static_KeyGuide_Basic_Second")
  body._staticText_RideCommand = UI.getChildControl(ui._static_BodyBg, "StaticText_KeyGuide_Ride")
  body._static_RideCommandFirst = UI.getChildControl(ui._static_BodyBg, "Static_KeyGuide_Ride_First")
  body._static_RideCommandPlus = UI.getChildControl(ui._static_BodyBg, "Static_KeyGuide_Ride_Plus")
  body._static_RideCommandSecend = UI.getChildControl(ui._static_BodyBg, "Static_KeyGuide_Ride_Second")
  body._static_CommandFirst:SetShow(false)
  body._static_CommandPlus:SetShow(false)
  body._static_CommandSecend:SetShow(false)
  body._staticText_RideCommand:SetShow(false)
  body._static_RideCommandFirst:SetShow(false)
  body._static_RideCommandPlus:SetShow(false)
  body._static_RideCommandSecend:SetShow(false)
  right._staticText_LearnableEmpty = UI.getChildControl(ui._static_RightBg, "StaticText_LearnableEmpty")
  right._staticText_LearnableEmpty:SetShow(false)
  right._radioButton_LearnSkill = UI.getChildControl(ui._static_RightBg, "RadioButton_LearnSkill")
  right._radioButton_SkillBasic = UI.getChildControl(ui._static_RightBg, "RadioButton_SkillBasic")
  right._radioButton_SkillAwaken = UI.getChildControl(ui._static_RightBg, "RadioButton_SkillAwaken")
  right._staticText_Tooltip = UI.getChildControl(ui._static_RightBg, "StaticText_Tooltip")
  right._list2_Skill = UI.getChildControl(ui._static_RightBg, "List2_Skill")
  right._static_KeyGuide = UI.getChildControl(ui._static_RightBg, "Static_KeyGuide")
  right._radioButton_learnSkillKey = UI.getChildControl(right._static_KeyGuide, "Radiobutton_Learn_Skill_Key")
  right._radiobutton_ResetSkillKey = UI.getChildControl(right._static_KeyGuide, "Radiobutton_SkillPoint_Reset_Key")
  right._radioButton_SkillDemo = UI.getChildControl(right._static_KeyGuide, "Radiobutton_Demo_Key")
  right._radioButton_Close = UI.getChildControl(right._static_KeyGuide, "Radiobutton_SkillPoint_Close_Key")
end
function Window_SkillInfo:InitEvent()
  local right = self._ui._right
  local body = self._ui._body
  self._ui._static_BodyBg:addInputEvent("Mouse_LDown", "PaGlobalFunc_Skill_SetPanelViewStart(true)")
  self._ui._static_BodyBg:addInputEvent("Mouse_RDown", "PaGlobalFunc_Skill_SetPanelViewStart(false)")
  self._ui._static_BodyBg:addInputEvent("Mouse_Out", "PaGlobalFunc_Skill_SetPanelViewEnd()")
  self._ui._static_BodyBg:addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SetPanelViewEnd(true)")
  self._ui._static_BodyBg:addInputEvent("Mouse_RUp", "PaGlobalFunc_Skill_SetPanelViewEnd(false)")
  self._ui._static_BodyBg:addInputEvent("Mouse_UpScroll", "PaGlobalFunc_Skill_SetCameraZoom(true)")
  self._ui._static_BodyBg:addInputEvent("Mouse_DownScroll", "PaGlobalFunc_Skill_SetCameraZoom(false)")
  right._radioButton_LearnSkill:addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SelectTitle(" .. self._config._title_Learn .. ")")
  right._radioButton_SkillBasic:addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SelectTitle(" .. self._config._title_Basic .. ")")
  right._radioButton_SkillAwaken:addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SelectTitle(" .. self._config._title_Awaken .. ")")
  right._radioButton_learnSkillKey:addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_LearnButton()")
  right._radiobutton_ResetSkillKey:addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_ResetButton()")
  right._list2_Skill:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_Skill_List2EventControlCreate")
  right._list2_Skill:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  right._radioButton_Close:addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_Close()")
  right._radioButton_SkillDemo:addInputEvent("Mouse_LUp", "PaGlobalFunc_Skill_SkillAction()")
  Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_LB, "Toggle_SkillTab_forPadEventFunc(-1)")
  Panel_Window_Skill:registerPadEvent(__eConsoleUIPadEvent_RB, "Toggle_SkillTab_forPadEventFunc(1)")
end
function PaGlobalFunc_Skill_UpdatePanelView()
  local self = Window_SkillInfo
  if false == self._isLDown and false == self._isRDown then
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
  if true == self._isLDown then
    ToClient_LearnSkillCameraSetRotation(radianAngle * 30, cameraPitch * 90)
  end
  if true == self._isRDown then
    ToClient_LearnSkillCameraSetPosition(radianAngle * 0.8, -(cameraPitch * 2))
  end
end
function PaGlobalFunc_Skill_SetPanelViewStart(isLButton)
  local self = Window_SkillInfo
  if true == isLButton then
    self._isLDown = true
  else
    self._isRDown = true
  end
  self._movePosX = getMousePosX()
  self._movePosY = getMousePosY()
end
function PaGlobalFunc_Skill_SetPanelViewEnd(isLButton)
  local self = Window_SkillInfo
  if nil == isLButton then
    self._isLDown = false
    self._isRDown = false
  elseif true == isLButton then
    self._isLDown = false
  else
    self._isRDown = false
  end
end
function PaGlobalFunc_Skill_SetCameraZoom(scrollValue)
  local upValue = 35
  if true == scrollValue then
    upValue = -upValue
  end
  ToClient_LearnSkillCameraSetZoom(upValue)
end
function PaGlobalFunc_Skill_SkillAction()
  local self = Window_SkillInfo
  if self._title_Learn == self._currentTitle then
    return
  end
  local skillInfo = self._currentSkillListInfo[self._currentSkillIndex]
  if nil == skillInfo then
    return
  end
  local skillStaticStatusWrapper = getSkillStaticStatus(skillInfo._no, 1)
  ToClient_LearnSkillCameraStartSkillAction(skillStaticStatusWrapper:get())
end
function PaGlobalFunc_Skill_Open(isDialog)
  local self = Window_SkillInfo
  if true == PaGlobalFunc_Skill_GetShow() then
    return
  end
  if nil == isDialog then
    self._isDialog = false
  else
    self._isDialog = isDialog
  end
  if true == isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLOPENALERT_INDEAD"))
    return
  end
  if true == ToClient_getJoinGuildBattle() then
    return
  end
  ToClient_SaveUiInfo(false)
  if true == ToClient_LearnSkillCameraIsShow() then
    return
  end
  if false == ToClient_LearnSkillCameraIsShowable() then
    return
  end
  if false == IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLOPENALERT_INDEAD"))
    return
  end
  if true == selfPlayerIsInCompetitionArea() then
    return
  end
  if true == ToClient_SniperGame_IsPlaying() then
    return
  end
  if true == Panel_Win_System:GetShow() then
    allClearMessageData()
  end
  Panel_Window_Skill:SetShow(true)
  ToClient_LearnSkillCameraShow()
  ToClient_LearnSkillCameraLoadCharcterAndCamera()
  SetUIMode(Defines.UIMode.eUIMode_SkillWindow)
  self._renderMode:set()
  self:SkillDetailClear()
  self:Update()
  ToClient_LearnSkillCameraSetRotation(-0.5, 0)
  ToClient_LearnSkillCameraSetPosition(2.5, -20)
  PaGlobalFunc_Skill_SelectTitle(self._currentTitle)
  ToClient_AudioPostEvent_UIAudioStateEvent("UISTATE_OPEN_SKILL")
end
function PaGlobalFunc_Skill_Close()
  local self = Window_SkillInfo
  if false == PaGlobalFunc_Skill_GetShow() then
    return
  end
  self._currentTabIndex = 0
  if false == ToClient_LearnSkillCameraHide() then
    return
  end
  self._renderMode:reset()
  Panel_Window_Skill:SetShow(false)
  if true == self._isDialog then
    PaGlobalFunc_MainDialog_ReOpen()
  else
    SetUIMode(Defines.UIMode.eUIMode_Default)
  end
  ToClient_AudioPostEvent_UIAudioStateEvent("UISTATE_CLOSE_DEFAULT")
end
function PaGlobalFunc_Skill_GetShow()
  return Panel_Window_Skill:GetShow()
end
function PaGlobalFunc_FromClient_Skill_luaLoadComplete()
  local self = Window_SkillInfo
  self:Initialize()
  self:Resize()
end
function PaGlobalFunc_FromClient_Skill_WindowUpdate()
  local self = Window_SkillInfo
  self._prevScrollIndex = self._ui._right._list2_Skill:getCurrenttoIndex()
  self:Update()
  PaGlobalFunc_Skill_SelectTitle(self._currentTitle)
  self._ui._right._list2_Skill:moveIndex(self._prevScrollIndex)
end
function Toggle_SkillTab_forPadEventFunc(value)
  local self = Window_SkillInfo
  self._currentTabIndex = self._currentTabIndex + value
  _AudioPostEvent_SystemUiForXBOX(51, 6)
  if self._currentTabIndex < 0 then
    self._currentTabIndex = 1
  elseif self._currentTabIndex > 1 then
    self._currentTabIndex = 0
  end
  if 0 == self._currentTabIndex then
    PaGlobalFunc_Skill_SelectTitle(self._config._title_Learn)
  elseif 1 == self._currentTabIndex then
    PaGlobalFunc_Skill_SelectTitle(self._config._title_Basic)
  elseif 2 == self._currentTabIndex then
  end
  ToClient_padSnapResetControl()
end
function Window_SkillInfo:Resize()
end
function PaGlobalFunc_Skill_GetEffectControl()
  local self = Window_SkillInfo
  return self._ui._static_IconEffect
end
function PaGlobalFunc_Skill_GetPanel()
  return Panel_Window_Skill
end
function PaGlobalFunc_Skill_Resize()
  Window_SkillInfo:Resize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_Skill_luaLoadComplete")
