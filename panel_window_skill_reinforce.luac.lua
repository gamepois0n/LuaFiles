-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\skill\panel_window_skill_reinforce.luac 

-- params : ...
-- function num : 0
local UI_BUFFTYPE = CppEnums.UserChargeType
Panel_SkillReinforce:SetShow(false, false)
Panel_SkillReinforce:ActiveMouseEventEffect(true)
Panel_SkillReinforce:setGlassBackground(true)
Panel_SkillReinforce:RegisterShowEventFunc(true, "Panel_SkillReinforce_ShowAni()")
Panel_SkillReinforce:RegisterShowEventFunc(false, "Panel_SkillReinforce_HideAni()")
Panel_SkillAwaken_ResultOption:SetShow(false, false)
Panel_SkillAwaken_ResultOption:RegisterShowEventFunc(true, "SkillAwakenResult_ShowAni()")
Panel_SkillAwaken_ResultOption:RegisterShowEventFunc(false, "SkillAwakenResult_HideAni()")
Panel_SkillReinforce_ShowAni = function()
  -- function num : 0_0
  Panel_SkillReinforce:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_SkillReinforce, 0, 0.3)
end

Panel_SkillReinforce_HideAni = function()
  -- function num : 0_1
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_SkillReinforce, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

SkillAwakenResult_ShowAni = function()
  -- function num : 0_2
  Panel_SkillAwaken_ResultOption:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_SkillAwaken_ResultOption, 0, 0.3)
  aniInfo:SetHideAtEnd(true)
end

SkillAwakenResult_HideAni = function()
  -- function num : 0_3
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_SkillAwaken_ResultOption, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

local UI_TM = CppEnums.TextMode
local skillReinforce = {_currentSkillNo, _currentSkillIndex, _currentOptionIndex, _currentOptionIndex2, _haveOptionIndex, _beforeSkillIndex; btnClose = (UI.getChildControl)(Panel_SkillReinforce, "Button_Close"), btnQuestion = (UI.getChildControl)(Panel_SkillReinforce, "Button_Question"), skillListTitle = (UI.getChildControl)(Panel_SkillReinforce, "StaticText_SkillList_Title"), skillListBg = (UI.getChildControl)(Panel_SkillReinforce, "Static_SkillList_Bg"), skillListBlueBg = (UI.getChildControl)(Panel_SkillReinforce, "Static_SkillList_BlueBG"), skillListSlot = (UI.getChildControl)(Panel_SkillReinforce, "Static_SkillList_Icon"), skillListName = (UI.getChildControl)(Panel_SkillReinforce, "StaticText_SkillList_Name"), skillListDesc = (UI.getChildControl)(Panel_SkillReinforce, "StaticText_SkillList_Desc"), skillList_Default = (UI.getChildControl)(Panel_SkillReinforce, "StaticText_SkillListDesc"), btnSkillListShow = (UI.getChildControl)(Panel_SkillReinforce, "Static_SkillListShow"), optionListTitle = (UI.getChildControl)(Panel_SkillReinforce, "StaticText_OptionListTitle"), optionListBg = (UI.getChildControl)(Panel_SkillReinforce, "Static_OptionList_Bg"), optionListBlueBg = (UI.getChildControl)(Panel_SkillReinforce, "Static_OptionList_BlueBg"), optionListDesc = (UI.getChildControl)(Panel_SkillReinforce, "StaticText_OptionList_Desc"), btnOptionListShow = (UI.getChildControl)(Panel_SkillReinforce, "Static_OptionListShow1"), optionListBg2 = (UI.getChildControl)(Panel_SkillReinforce, "Static_OptionList_Bg2"), optionListBlueBg2 = (UI.getChildControl)(Panel_SkillReinforce, "Static_OptionList_BlueBg2"), optionListDesc2 = (UI.getChildControl)(Panel_SkillReinforce, "StaticText_OptionList_Desc2"), btnOptionListShow2 = (UI.getChildControl)(Panel_SkillReinforce, "Static_OptionListShow2"), effectCircleBg = (UI.getChildControl)(Panel_SkillReinforce, "Static_Circle_Bg"), effectCircle = (UI.getChildControl)(Panel_SkillReinforce, "Static_Circle"), effectCircleEffect = (UI.getChildControl)(Panel_SkillReinforce, "Static_CircleEff"), effectProgress = (UI.getChildControl)(Panel_SkillReinforce, "CircularProgress_Awk"), effectSkillIconBg = (UI.getChildControl)(Panel_SkillReinforce, "Static_SkillIcon_BG"), effectSkillIconSlot = (UI.getChildControl)(Panel_SkillReinforce, "Static_SkillIcon"), effectSkillIconOff = (UI.getChildControl)(Panel_SkillReinforce, "Static_SkillIcon_Off"), effectSkillIconOn = (UI.getChildControl)(Panel_SkillReinforce, "Static_SkillIcon_On"), btnReinforce = (UI.getChildControl)(Panel_SkillReinforce, "Button_Reinforce"), list2_SkillList = (UI.getChildControl)(Panel_SkillReinforce, "List2_SkillList"), list2_OptionList = (UI.getChildControl)(Panel_SkillReinforce, "List2_OptionList"), list2_OptionList2 = (UI.getChildControl)(Panel_SkillReinforce, "List2_OptionList2"), btnQuestion = (UI.getChildControl)(Panel_SkillReinforce, "Button_Question")}
;
(skillReinforce.btnQuestion):SetShow(false)
;
(skillReinforce.btnQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelSkillAwaken\" )")
;
(skillReinforce.btnQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelSkillAwaken\", \"true\")")
;
(skillReinforce.btnQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelSkillAwaken\", \"false\")")
local result = {_awakenResult_BG = (UI.getChildControl)(Panel_SkillAwaken_ResultOption, "Static_AcquireBG"), _awakenTitle = (UI.getChildControl)(Panel_SkillAwaken_ResultOption, "StaticText_AwakenTitle"), _awakenOption = (UI.getChildControl)(Panel_SkillAwaken_ResultOption, "StaticText_AwakenOption")}
local isStartAwaken = false
local isEndCircular = false
local currentTimer = 0
local currentRate = 0
local _endCircular = 100
local endTime = 2
local tmpValue = _endCircular / endTime
local isCompleteCircular = false
skillReinforce.Init = function(self)
  -- function num : 0_4 , upvalues : UI_TM
  (self.list2_SkillList):SetShow(false)
  ;
  (self.list2_OptionList):SetShow(false)
  ;
  (self.list2_OptionList2):SetShow(false)
  ;
  (self.skillListBlueBg):SetShow(false)
  ;
  (self.optionListBlueBg):SetShow(false)
  ;
  (self.optionListBlueBg2):SetShow(false)
  ;
  (self.btnClose):addInputEvent("Mouse_LUp", "Panel_SkillReinforce_Close()")
  ;
  (self.skillListBg):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
  ;
  (self.skillListSlot):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
  ;
  (self.optionListBg):addInputEvent("Mouse_LUp", "SkillReinforce_OptionList_Show()")
  ;
  (self.btnOptionListShow):addInputEvent("Mouse_LUp", "SkillReinforce_OptionList_Show()")
  ;
  (self.optionListBg2):addInputEvent("Mouse_LUp", "SkillReinforce_OptionList2_Show()")
  ;
  (self.btnOptionListShow2):addInputEvent("Mouse_LUp", "SkillReinforce_OptionList2_Show()")
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() == 0 then
    (self.skillListDesc):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
    ;
    (self.skillListDesc):setLineCountByLimitAutoWrap(2)
  else
    ;
    (self.skillListDesc):SetTextMode(UI_TM.eTextMode_LimitText)
    ;
    (self.skillListDesc):setLineCountByLimitAutoWrap(1)
  end
  ;
  (self.list2_SkillList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "SkillListControlCreate")
  ;
  (self.list2_SkillList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.list2_OptionList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "OptionListControlCreate")
  ;
  (self.list2_OptionList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.list2_OptionList2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "OptionListControlCreate2")
  ;
  (self.list2_OptionList2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.skillList_Default):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSKILL_2"))
end

local _type = -1
skillReinforce.update = function(self, skillType, skillNo, optionIndex, reinforceSkillIndex, skillIndex)
  -- function num : 0_5 , upvalues : _type
  local reinforcableCount = (ToClient_GetAwakeningListCount())
  local skillSSW, skillTypeSSW = nil, nil
  if skillIndex == nil then
    if skillNo == nil then
      (self.skillListName):SetShow(false)
      ;
      (self.skillListDesc):SetShow(false)
      ;
      (self.skillListSlot):SetShow(false)
      ;
      (self.skillList_Default):SetShow(true)
      ;
      (self.btnSkillListShow):SetShow(true)
      ;
      (self.btnSkillListShow):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
      ;
      (self.skillListBg):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
      ;
      (self.skillListSlot):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
    else
      skillSSW = getSkillStaticStatus(skillNo, 1)
      skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
      ;
      (self.skillListBg):addInputEvent("Mouse_LUp", "")
      ;
      (self.skillListSlot):addInputEvent("Mouse_LUp", "")
      skillReinforce_SetSkill(skillNo)
      ;
      (self.skillList_Default):SetShow(false)
      ;
      (self.btnSkillListShow):SetShow(false)
      ;
      (self.skillListName):SetShow(true)
      ;
      (self.skillListDesc):SetShow(true)
      ;
      (self.skillListSlot):SetShow(true)
      ;
      (self.skillListName):SetText(tostring(skillSSW:getName()))
      ;
      (self.skillListDesc):SetText(tostring(skillTypeSSW:getDescription()))
      ;
      (self.skillListSlot):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
      Panel_SkillTooltip_SetPosition(skillNo, self.skillListSlot, "SkillAwaken")
      ;
      (self.skillListSlot):addInputEvent("Mouse_On", "Panel_SkillTooltip_Show(" .. skillNo .. ", false, \"SkillAwaken\")")
      ;
      (self.skillListSlot):addInputEvent("Mouse_Out", "Panel_SkillTooltip_Hide()")
    end
  else
    ;
    (self.skillListName):SetShow(false)
    ;
    (self.skillListDesc):SetShow(false)
    ;
    (self.skillListSlot):SetShow(false)
    ;
    (self.skillList_Default):SetShow(true)
    ;
    (self.btnSkillListShow):SetShow(true)
    ;
    (self.btnSkillListShow):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
    ;
    (self.skillListBg):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
    ;
    (self.skillListSlot):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
    ;
    (self.skillListBg):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
    ;
    (self.skillListSlot):addInputEvent("Mouse_LUp", "SkillReinforce_SkillList_Show()")
  end
  if reinforceSkillIndex ~= nil then
    self._currentSkillIndex = reinforceSkillIndex
    ;
    (self.btnReinforce):addInputEvent("Mouse_LUp", "SkillReinforce_Do( true )")
  else
    ;
    (self.btnReinforce):addInputEvent("Mouse_LUp", "SkillReinforce_Do()")
  end
  _type = skillType
  _haveOptionIndex = optionIndex
  self._beforeSkillIndex = skillIndex
  ;
  (self.optionListDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTOPTION"))
  ;
  (self.optionListDesc2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTOPTION"))
  ;
  (self.btnOptionListShow):SetShow(true)
  ;
  (self.btnOptionListShow2):SetShow(true)
end

SkillReinforce_SkillList_Show = function()
  -- function num : 0_6 , upvalues : skillReinforce, _type
  local self = skillReinforce
  ;
  (self.list2_SkillList):SetShow(true)
  ;
  ((self.list2_SkillList):getElementManager()):clearKey()
  ;
  (self.list2_OptionList):SetShow(false)
  ;
  (self.list2_OptionList2):SetShow(false)
  local count = Reinforcable_SkillCount(_type)
  if count == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NOSKILL"))
    return 
  end
  for key = 0, count - 1 do
    ((self.list2_SkillList):getElementManager()):pushKey(toInt64(0, key))
  end
end

SkillListControlCreate = function(content, key)
  -- function num : 0_7 , upvalues : UI_TM, skillReinforce, _type
  local skillListBg = (UI.getChildControl)(content, "List2_SkillList_Bg")
  local skillListIcon = (UI.getChildControl)(content, "List2_SkillList_Icon")
  local skillListName = (UI.getChildControl)(content, "List2_SkillList_Name")
  local skillListDesc = (UI.getChildControl)(content, "List2_SkillList_Desc")
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() == 0 then
    skillListDesc:SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
    skillListDesc:setLineCountByLimitAutoWrap(2)
  else
    skillListDesc:SetTextMode(UI_TM.eTextMode_LimitText)
    skillListDesc:setLineCountByLimitAutoWrap(1)
  end
  local self = skillReinforce
  local _key = Int64toInt32(key)
  local reinforcableCount = ToClient_GetAwakeningListCount()
  local count = 0
  for index = 0, reinforcableCount - 1 do
    local skillSSW = ToClient_GetAwakeningListAt(index)
    if _type == skillSSW:getSkillAwakeningType() then
      do
        do
          if count == _key then
            local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
            skillNo = skillSSW:getSkillNo()
            skillListName:SetText(tostring(skillSSW:getName()))
            skillListDesc:SetText(tostring(skillTypeSSW:getDescription()))
            skillListIcon:ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
            Panel_SkillTooltip_SetPosition(skillNo, skillListIcon, "SkillAwaken")
            skillListIcon:addInputEvent("Mouse_On", "Panel_SkillTooltip_Show(" .. skillNo .. ", false, \"SkillAwaken\")")
            skillListIcon:addInputEvent("Mouse_Out", "Panel_SkillTooltip_Hide()")
            skillListIcon:addInputEvent("Mouse_LUp", "skillReinforce_SetSkill(" .. skillNo .. ", " .. index .. ")")
            skillListBg:addInputEvent("Mouse_LUp", "skillReinforce_SetSkill(" .. skillNo .. ", " .. index .. ")")
            break
          end
          count = count + 1
          -- DECOMPILER ERROR at PC121: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC121: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC121: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

skillReinforce_SetSkill = function(skillNo, index)
  -- function num : 0_8 , upvalues : skillReinforce
  local self = skillReinforce
  ;
  (self.skillList_Default):SetShow(false)
  ;
  (self.btnSkillListShow):SetShow(false)
  ;
  (self.skillListName):SetShow(true)
  ;
  (self.skillListDesc):SetShow(true)
  ;
  (self.skillListSlot):SetShow(true)
  local skillSSW = getSkillStaticStatus(skillNo, 1)
  local skillTypeSSW = skillSSW:getSkillTypeStaticStatusWrapper()
  ;
  (self.skillListName):SetText(tostring(skillSSW:getName()))
  ;
  (self.skillListDesc):SetText(tostring(skillTypeSSW:getDescription()))
  ;
  (self.skillListSlot):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
  Panel_SkillTooltip_SetPosition(skillNo, self.skillListSlot, "SkillAwaken")
  ;
  (self.skillListSlot):addInputEvent("Mouse_On", "Panel_SkillTooltip_Show(" .. skillNo .. ", false, \"SkillAwaken\")")
  ;
  (self.skillListSlot):addInputEvent("Mouse_Out", "Panel_SkillTooltip_Hide()")
  self._currentSkillNo = skillNo
  ;
  ((self.list2_SkillList):getElementManager()):clearKey()
  ;
  (self.list2_SkillList):SetShow(false)
  ;
  (self.skillListBlueBg):SetShow(true)
  if index ~= nil then
    self._currentSkillIndex = index
  end
  ;
  (self.effectSkillIconSlot):SetIgnore(false)
  ;
  (self.effectSkillIconSlot):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
  Panel_SkillTooltip_SetPosition(skillNo, self.effectSkillIconSlot, "SkillAwakenSet")
  ;
  (self.effectSkillIconSlot):addInputEvent("Mouse_On", "Panel_SkillTooltip_Show(" .. skillNo .. ", false, \"SkillAwakenSet\")")
  ;
  (self.effectSkillIconSlot):addInputEvent("Mouse_Out", "Panel_SkillTooltip_Hide()")
  Panel_SkillTooltip_Hide()
  self._currentOptionIndex = nil
  self._currentOptionIndex2 = nil
  ;
  (self.btnOptionListShow):SetShow(true)
  ;
  (self.btnOptionListShow2):SetShow(true)
  ;
  (self.optionListBlueBg):SetShow(false)
  ;
  (self.optionListBlueBg2):SetShow(false)
  ;
  (self.optionListDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTOPTION"))
  ;
  (self.optionListDesc2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTOPTION"))
end

SkillReinforce_OptionList_Show = function()
  -- function num : 0_9 , upvalues : skillReinforce
  local self = skillReinforce
  if self._currentSkillNo == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSKILL_2"))
    return 
  end
  local skillSSW = getSkillStaticStatus(self._currentSkillNo, 1)
  local activeSkillSS = skillSSW:getActiveSkillStatus()
  if activeSkillSS ~= nil then
    local optionCount = activeSkillSS:getSkillAwakenInfoCount()
    local count = 0
    ;
    ((self.list2_OptionList):getElementManager()):clearKey()
    for index = 0, optionCount - 1 do
      if self._currentOptionIndex2 ~= index then
        ((self.list2_OptionList):getElementManager()):pushKey(toInt64(0, index))
      end
    end
    ;
    (self.list2_SkillList):SetShow(false)
    ;
    (self.list2_OptionList):SetShow(true)
    ;
    (self.list2_OptionList2):SetShow(false)
  end
end

OptionListControlCreate = function(content, key)
  -- function num : 0_10 , upvalues : skillReinforce
  local optionListBg = (UI.getChildControl)(content, "List2_OptionList_Bg")
  local optionListDesc = (UI.getChildControl)(content, "List2_OptionList_Desc")
  local self = skillReinforce
  local skillSSW = getSkillStaticStatus(self._currentSkillNo, 1)
  local activeSkillSS = skillSSW:getActiveSkillStatus()
  if activeSkillSS ~= nil then
    local optionCount = activeSkillSS:getSkillAwakenInfoCount()
    local count = 0
    local _key = Int64toInt32(key)
    for index = 0, optionCount - 1 do
      -- DECOMPILER ERROR at PC40: Unhandled construct in 'MakeBoolean' P1

      if self._currentOptionIndex2 == nil and index == _key then
        optionListDesc:SetText(tostring(activeSkillSS:getSkillAwakenDescription(index)))
        optionListBg:addInputEvent("Mouse_LUp", "skillReinforce_OptionSet(" .. index .. ")")
      end
      if index == _key and self._currentOptionIndex2 ~= _key then
        optionListDesc:SetText(tostring(activeSkillSS:getSkillAwakenDescription(index)))
        optionListBg:addInputEvent("Mouse_LUp", "skillReinforce_OptionSet(" .. index .. ")")
      end
    end
  end
end

skillReinforce_OptionSet = function(index)
  -- function num : 0_11 , upvalues : skillReinforce
  local self = skillReinforce
  ;
  (self.btnOptionListShow):SetShow(false)
  ;
  (self.optionListBlueBg):SetShow(true)
  ;
  (self.list2_OptionList):SetShow(false)
  ;
  ((self.list2_OptionList):getElementManager()):clearKey()
  self._currentOptionIndex = index
  local skillSSW = getSkillStaticStatus(self._currentSkillNo, 1)
  local activeSkillSS = skillSSW:getActiveSkillStatus()
  ;
  (self.optionListDesc):SetText(tostring(activeSkillSS:getSkillAwakenDescription(index)))
  activeSkillSS:getSkillAwakenDescription(index)
  Panel_SkillTooltip_Hide()
end

SkillReinforce_OptionList2_Show = function()
  -- function num : 0_12 , upvalues : skillReinforce
  local self = skillReinforce
  if self._currentSkillNo == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSKILL_2"))
    return 
  end
  if self._currentOptionIndex == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTFIRSTOPTION"))
    return 
  end
  local skillSSW = getSkillStaticStatus(self._currentSkillNo, 1)
  local activeSkillSS = skillSSW:getActiveSkillStatus()
  if activeSkillSS ~= nil then
    local optionCount = activeSkillSS:getSkillAwakenInfoCount()
    local count = 0
    ;
    ((self.list2_OptionList2):getElementManager()):clearKey()
    for index = 0, optionCount - 1 do
      if self._currentOptionIndex ~= index then
        ((self.list2_OptionList2):getElementManager()):pushKey(toInt64(0, index))
      end
    end
    ;
    (self.list2_SkillList):SetShow(false)
    ;
    (self.list2_OptionList):SetShow(false)
    ;
    (self.list2_OptionList2):SetShow(true)
  end
end

OptionListControlCreate2 = function(content, key)
  -- function num : 0_13 , upvalues : skillReinforce
  local optionListBg = (UI.getChildControl)(content, "List2_OptionList_Bg")
  local optionListDesc = (UI.getChildControl)(content, "List2_OptionList_Desc")
  local self = skillReinforce
  local skillSSW = getSkillStaticStatus(self._currentSkillNo, 1)
  local activeSkillSS = skillSSW:getActiveSkillStatus()
  if activeSkillSS ~= nil then
    local optionCount = activeSkillSS:getSkillAwakenInfoCount()
    local count = 0
    local _key = Int64toInt32(key)
    for index = 0, optionCount - 1 do
      if self._currentOptionIndex ~= index and index == _key then
        optionListDesc:SetText(tostring(activeSkillSS:getSkillAwakenDescription(index)))
        optionListBg:addInputEvent("Mouse_LUp", "skillReinforce_OptionSet2(" .. index .. ")")
        break
      end
      count = count + 1
    end
  end
end

skillReinforce_OptionSet2 = function(index)
  -- function num : 0_14 , upvalues : skillReinforce
  local self = skillReinforce
  ;
  (self.btnOptionListShow2):SetShow(false)
  ;
  (self.optionListBlueBg2):SetShow(true)
  ;
  (self.list2_OptionList2):SetShow(false)
  ;
  ((self.list2_OptionList2):getElementManager()):clearKey()
  self._currentOptionIndex2 = index
  local skillSSW = getSkillStaticStatus(self._currentSkillNo, 1)
  local activeSkillSS = skillSSW:getActiveSkillStatus()
  ;
  (self.optionListDesc2):SetText(tostring(activeSkillSS:getSkillAwakenDescription(index)))
  activeSkillSS:getSkillAwakenDescription(index)
  Panel_SkillTooltip_Hide()
end

local _isAddOption = false
SkillReinforce_Do = function(isAddOption)
  -- function num : 0_15 , upvalues : skillReinforce, _isAddOption
  if skillReinforce._currentSkillIndex == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSKILL"))
    return 
  end
  if skillReinforce._currentOptionIndex == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTFIRSTOPTION"))
    return 
  end
  if skillReinforce._currentOptionIndex2 == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_SELECTSECONDOPTION"))
    return 
  end
  _isAddOption = isAddOption
  animateSkillReinforceEffect()
end

SkillReinforce_Doit = function()
  -- function num : 0_16 , upvalues : _isAddOption, skillReinforce
  local haveOptionIndex = -1
  local skillSSW = nil
  if _isAddOption then
    skillSSW = ToClient_GetReAwakeningListAt(skillReinforce._currentSkillIndex)
  else
    skillSSW = ToClient_GetAwakeningListAt(skillReinforce._currentSkillIndex)
  end
  local skillNo = skillSSW:getSkillNo()
  local currentSkillOptionCount = ToClient_GetAwakeningAbilityCount(skillNo)
  if currentSkillOptionCount > 0 then
    haveOptionIndex = ToClient_GetAwakeningAbilityIndex(skillNo, 0)
  end
  if skillReinforce._beforeSkillIndex == nil then
    if _isAddOption then
      ToClient_RequestChangeAwakeningBitFlag(skillReinforce._currentSkillIndex, skillReinforce._currentOptionIndex, skillReinforce._currentOptionIndex2)
    else
      ToClient_RequestSkillAwakening(skillReinforce._currentSkillIndex, skillReinforce._currentOptionIndex, skillReinforce._currentOptionIndex2)
    end
  else
    ToClient_RequestChangeAwakeningSkill(skillReinforce._beforeSkillIndex, skillReinforce._currentSkillIndex, skillReinforce._currentOptionIndex, skillReinforce._currentOptionIndex2)
  end
  Panel_SkillReinforce_Close()
end

Panel_SkillReinforce_Show = function(skillType, skillNo, skillIndex)
  -- function num : 0_17 , upvalues : UI_BUFFTYPE, skillReinforce
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local applyAwakenSkillReset = (selfPlayer:get()):isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillAwakening)
  local inventory = (selfPlayer:get()):getInventory()
  local hasMemoryFlag = inventory:getItemCount_s64(ItemEnchantKey(44195, 0))
  if Reinforcable_SkillCount(skillType) == 0 and skillNo == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NOSKILL"))
    return 
  end
  if skillNo ~= nil then
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
    ;
    (skillReinforce.effectSkillIconSlot):ChangeTextureInfoName("")
    ;
    (skillReinforce.effectSkillIconSlot):addInputEvent("Mouse_On", "Panel_SkillTooltip_Hide()")
    ;
    (skillReinforce.effectSkillIconSlot):addInputEvent("Mouse_Out", "Panel_SkillTooltip_Hide()")
    Panel_SkillReinforce_Open()
    skillReinforce:update(skillType, skillNo, nil, skillIndex)
  end
end

Panel_SkillReinforce_Change = function(skillType, skillNo, skillIndex)
  -- function num : 0_18 , upvalues : UI_BUFFTYPE, skillReinforce
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local applyAwakenSkillReset = (selfPlayer:get()):isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillAwakening)
  local inventory = (selfPlayer:get()):getInventory()
  local hasMemoryFlag = inventory:getItemCount_s64(ItemEnchantKey(44195, 0))
  if toInt64(0, 0) == hasMemoryFlag and not applyAwakenSkillReset then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SKILL_REINFORCE_NEEDITEM"))
    return 
  end
  if Reinforcable_SkillCount(skillType) == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREINFORCE_NOSKILL"))
    return 
  end
  ;
  (skillReinforce.effectSkillIconSlot):ChangeTextureInfoName("")
  ;
  (skillReinforce.effectSkillIconSlot):addInputEvent("Mouse_On", "Panel_SkillTooltip_Hide()")
  ;
  (skillReinforce.effectSkillIconSlot):addInputEvent("Mouse_Out", "Panel_SkillTooltip_Hide()")
  Panel_SkillReinforce_Open()
  skillReinforce:update(skillType, skillNo, nil, nil, skillIndex)
end

Panel_SkillReinforce_Open = function()
  -- function num : 0_19 , upvalues : skillReinforce, _isAddOption, currentTimer, currentRate, isStartAwaken
  Panel_Window_ReinforceSkill_Close()
  Panel_SkillReinforce:SetShow(true, true)
  ;
  (skillReinforce.list2_SkillList):SetShow(false)
  ;
  (skillReinforce.list2_OptionList):SetShow(false)
  ;
  (skillReinforce.list2_OptionList2):SetShow(false)
  ;
  (skillReinforce.skillListBlueBg):SetShow(false)
  ;
  (skillReinforce.optionListBlueBg):SetShow(false)
  ;
  (skillReinforce.optionListBlueBg2):SetShow(false)
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

  skillReinforce._currentSkillNo = nil
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

  skillReinforce._currentSkillIndex = nil
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

  skillReinforce._currentOptionIndex = nil
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

  skillReinforce._currentOptionIndex2 = nil
  _isAddOption = false
  ;
  (skillReinforce.btnReinforce):SetIgnore(false)
  ;
  (skillReinforce.btnReinforce):SetMonoTone(false)
  ;
  (skillReinforce.effectProgress):EraseAllEffect()
  ;
  (skillReinforce.effectSkillIconSlot):EraseAllEffect()
  ;
  (skillReinforce.effectProgress):SetProgressRate(0)
  currentTimer = 0
  currentRate = 0
  isStartAwaken = false
  TooltipSimple_Hide()
end

Panel_SkillReinforce_Close = function()
  -- function num : 0_20
  Panel_SkillReinforce:SetShow(false, true)
  Panel_SkillTooltip_Hide()
  TooltipSimple_Hide()
end

FromClient_SuccessSkillReinforce = function(skillNo, level)
  -- function num : 0_21 , upvalues : result
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
    ReqeustDialog_retryTalk()
  end
end

Reinforcable_SkillCount = function(_type)
  -- function num : 0_22
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

animateSkillReinforceEffect = function()
  -- function num : 0_23 , upvalues : currentTimer, isStartAwaken, skillReinforce
  audioPostEvent_SystemUi(3, 10)
  currentTimer = 0
  isStartAwaken = true
  ;
  (skillReinforce.effectSkillIconSlot):SetIgnore(true)
  ;
  (skillReinforce.btnReinforce):EraseAllEffect()
  ;
  (skillReinforce.btnReinforce):SetAlpha(0.85)
  ;
  (skillReinforce.btnReinforce):SetFontAlpha(0.85)
  ;
  (skillReinforce.btnReinforce):SetIgnore(true)
  ;
  (skillReinforce.btnReinforce):SetMonoTone(true)
  ;
  (skillReinforce.effectProgress):AddEffect("UI_ItemInstall_ProduceRing", true, 0, 0)
  ;
  (skillReinforce.effectSkillIconSlot):AddEffect("UI_SkillAwakening01", false, 0, 0)
  ;
  (skillReinforce.effectProgress):SetShow(true)
end

SkillReinforce_EffectGo = function(deltaTime)
  -- function num : 0_24 , upvalues : isStartAwaken, currentTimer, isCompleteCircular, currentRate, tmpValue, skillReinforce, isEndCircular, _endCircular
  if isStartAwaken == true and currentTimer < 3 and isCompleteCircular == false then
    currentTimer = currentTimer + deltaTime
    currentRate = currentRate + tmpValue * deltaTime
    ;
    (skillReinforce.effectProgress):SetProgressRate(currentRate)
    if currentRate >= 100 then
      (skillReinforce.effectProgress):EraseAllEffect()
      ;
      (skillReinforce.effectSkillIconSlot):EraseAllEffect()
      ;
      (skillReinforce.effectProgress):AddEffect("UI_ItemInstall_BigRing", true, 0, 0)
      ;
      (skillReinforce.effectSkillIconSlot):AddEffect("UI_ItemInstall_Gold", true, 0, 0)
      ;
      (skillReinforce.effectSkillIconSlot):AddEffect("UI_SkillAwakeningShield", false, 0, 0)
      ;
      (skillReinforce.effectSkillIconSlot):AddEffect("fUI_SkillButton02", false, 0, 0)
      ;
      (skillReinforce.effectSkillIconSlot):AddEffect("fUI_NewSkill01", false, 0, 0)
      ;
      (skillReinforce.effectSkillIconSlot):AddEffect("UI_SkillAwakeningFinal", false, 0, 0)
      ;
      (skillReinforce.effectSkillIconSlot):AddEffect("fUI_SkillAwakenBoom", false, 0, 0)
      currentTimer = 0
      isCompleteCircular = true
    end
  end
  if isCompleteCircular == true then
    currentTimer = currentTimer + deltaTime
    if currentTimer > 2 then
      isStartAwaken = false
      isEndCircular = true
      isCompleteCircular = false
      _endCircular = 100
      currentTimer = 0
      currentRate = 0
      deltaTime = 0
      ;
      (skillReinforce.effectSkillIconSlot):SetIgnore(false)
      SkillReinforce_Doit()
    end
  end
end

local isResultHideTime = 0
SkillReinforceResult_Hide = function(deltaTime)
  -- function num : 0_25 , upvalues : isResultHideTime
  isResultHideTime = isResultHideTime + deltaTime
  if isResultHideTime > 5 then
    Panel_SkillAwaken_ResultOption:SetShow(false, true)
    isResultHideTime = 0
  end
end

SkillReinforce_DoInit = function()
  -- function num : 0_26 , upvalues : skillReinforce
  skillReinforce:Init()
end

registerEvent("FromClient_luaLoadComplete", "SkillReinforce_DoInit")
registerEvent("FromClient_SuccessSkillAwaken", "FromClient_SuccessSkillReinforce")
registerEvent("FromClient_ChangeSkillAwakeningBitFlag", "FromClient_SuccessSkillReinforce")
registerEvent("FromClient_ChangeAwakenSkill", "FromClient_SuccessSkillReinforce")
Panel_SkillReinforce:RegisterUpdateFunc("SkillReinforce_EffectGo")
Panel_SkillAwaken_ResultOption:RegisterUpdateFunc("SkillReinforceResult_Hide")

