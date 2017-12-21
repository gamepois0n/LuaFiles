-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guildbattle_selectattend.luac 

-- params : ...
-- function num : 0
PaGlobal_GuildBattle_SelectAttend = {
_ui = {_btn_WinClose = (UI.getChildControl)(Panel_GuildBattle_SelectMember, "Button_Win_Close"), _staticText_Title = (UI.getChildControl)(Panel_GuildBattle_SelectMember, "StaticText_Title"), _static_TopBg = (UI.getChildControl)(Panel_GuildBattle_SelectMember, "Static_TopBg"), _static_Bg = (UI.getChildControl)(Panel_GuildBattle_SelectMember, "Static_Bg"), _static_BottomBg = (UI.getChildControl)(Panel_GuildBattle_SelectMember, "Static_BottomBg")}
, _canSelectAttend = false}
local EnableControl = function(target, isEnable)
  -- function num : 0_0
  if isEnable == true then
    target:SetEnable(true)
    target:SetMonoTone(false)
    target:SetIgnore(false)
  else
    target:SetEnable(false)
    target:SetMonoTone(true)
    target:SetIgnore(true)
  end
end

local EnableText = function(targetText, isEnable)
  -- function num : 0_1
  if isEnable == true then
    targetText:SetFontAlpha(1)
  else
    targetText:SetFontAlpha(0.65)
  end
end

CreateListContent_GuildBattle_AttendMember = function(content, index)
  -- function num : 0_2 , upvalues : EnableControl, EnableText
  local memberIndex = Int64toInt32(index)
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local userNo = ToClient_GuildBattle_GetUserNoFromEntryList(memberIndex)
  local memberInfo = myGuildListInfo:getMemberByUserNo(userNo)
  if memberInfo == nil then
    return 
  end
  local checkBtn_AsAttend = (UI.getChildControl)(content, "CheckButton_ItemSort")
  local static_ClassIcon = (UI.getChildControl)(content, "Static_ClassIcon")
  local staticText_Level = (UI.getChildControl)(content, "StaticText_Level")
  local staticText_Name = (UI.getChildControl)(content, "StaticText_CharacterName")
  local staticText_State = (UI.getChildControl)(content, "StaticText_State")
  local hideCheckBox = ToClient_GuildBattle_GetMaxAttendCount() > 1
  local isEnableText = true
  if PaGlobal_GuildBattle_SelectAttend._canSelectAttend == true then
    if ToClient_GuildBattle_IsMemberInDeadList(userNo) == true then
      staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERSTATE_DEAD"))
      checkBtn_AsAttend:SetShow(false)
      EnableControl(staticText_Name, false)
      EnableControl(staticText_Level, false)
      isEnableText = false
    else
      if ToClient_GuildBattle_IsMemberInAttendList(userNo) == true then
        checkBtn_AsAttend:SetEnable(true)
        checkBtn_AsAttend:SetShow(true)
        checkBtn_AsAttend:SetCheck(ToClient_GuildBattle_IsMemberInAttendList(userNo))
        checkBtn_AsAttend:addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle_SelectAttend:ToggleAttendMember(" .. memberIndex .. ")")
      elseif hideCheckBox == true and ToClient_GuildBattle_IsAttendMemberComplete() == true then
        checkBtn_AsAttend:SetShow(false)
      else
        checkBtn_AsAttend:SetEnable(true)
        checkBtn_AsAttend:SetShow(true)
        checkBtn_AsAttend:SetCheck(ToClient_GuildBattle_IsMemberInAttendList(userNo))
        checkBtn_AsAttend:addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle_SelectAttend:ToggleAttendMember(" .. memberIndex .. ")")
      end
      staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERSTATE_CANFIGHT"))
    end
  elseif ToClient_GuildBattle_IsMemberInAttendList(userNo) == true then
    EnableControl(checkBtn_AsAttend, false)
    checkBtn_AsAttend:SetShow(true)
    checkBtn_AsAttend:SetCheck(true)
    staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERSTATE_FIGHTING"))
  elseif ToClient_GuildBattle_IsMemberInDeadList(userNo) == true then
    staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERSTATE_DEAD"))
    checkBtn_AsAttend:SetShow(false)
    EnableControl(staticText_Name, false)
    EnableControl(staticText_Level, false)
    isEnableText = false
  else
    staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERSTATE_WAITING"))
    checkBtn_AsAttend:SetShow(false)
    EnableControl(staticText_Name, false)
    EnableControl(staticText_Level, false)
    isEnableText = false
  end
  local classSymbomInfo = (CppEnums.ClassType_Symbol)[memberInfo:getClassType()]
  static_ClassIcon:ChangeTextureInfoName(classSymbomInfo[1])
  do
    local x1, y1, x2, y2 = setTextureUV_Func(static_ClassIcon, classSymbomInfo[2], classSymbomInfo[3], classSymbomInfo[4], classSymbomInfo[5])
    ;
    (static_ClassIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    static_ClassIcon:setRenderTexture(static_ClassIcon:getBaseTexture())
    staticText_Level:SetText(tostring(memberInfo:getLevel()))
    EnableText(staticText_Level, isEnableText)
    staticText_Name:SetText(memberInfo:getCharacterName())
    EnableText(staticText_Name, isEnableText)
    -- DECOMPILER ERROR: 9 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattle_SelectAttend.Initialize = function(self)
  -- function num : 0_3
  local ui = self._ui
  ui._staticText_LeftTime = (UI.getChildControl)(ui._static_TopBg, "StaticText_LeftTime")
  ui._btn_Reload = (UI.getChildControl)(ui._static_TopBg, "Button_Reload")
  ui._staticText_Line = (UI.getChildControl)(ui._static_Bg, "StaticText_Line")
  ui._staticText_CheckTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_CheckTitle")
  ui._staticText_ClassTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_ClassTitle")
  ui._staticText_LevelTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_LevelTitle")
  ui._staticText_NameTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_NameTitle")
  ui._staticText_StateTitle = (UI.getChildControl)(ui._static_Bg, "StaticText_StateTitle")
  ui._list_GuildMembers = (UI.getChildControl)(ui._static_Bg, "List2_Member")
  ui._btn_ConfirmAttend = (UI.getChildControl)(ui._static_BottomBg, "Button_Adjust")
  ui._staticText_AttendCount = (UI.getChildControl)(ui._static_BottomBg, "StaticText_AttendCount")
  ;
  (ui._btn_ConfirmAttend):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle_SelectAttend:ConfirmAttendMember()")
  ;
  (ui._btn_Reload):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle_SelectAttend:UpdateMemberInfo()")
  ;
  (ui._list_GuildMembers):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CreateListContent_GuildBattle_AttendMember")
  ;
  (ui._list_GuildMembers):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattle_SelectAttend.Show = function(self, isShow)
  -- function num : 0_4
  Panel_GuildBattle_SelectMember:SetShow(isShow)
  if isShow == true then
    self:UpdateMemberInfo()
    self:UpdateRemainTime()
    if ToClient_GuildBattle_IsAttendMemberComplete() == false then
      self._canSelectAttend = true
    else
      self._canSelectAttend = false
    end
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattle_SelectAttend.IsShow = function(self)
  -- function num : 0_5
  return Panel_GuildBattle_SelectMember:GetShow()
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattle_SelectAttend.UpdateMemberInfo = function(self)
  -- function num : 0_6
  local ui = self._ui
  local entryCount = ToClient_GuildBattle_GetEntryCount()
  local memberListElementManager = (ui._list_GuildMembers):getElementManager()
  memberListElementManager:clearKey()
  for i = 1, entryCount do
    memberListElementManager:pushKey(i - 1)
  end
  self:UpdateConfirmButton()
  self:UpdateMemberCountText()
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattle_SelectAttend.UpdateRemainTime = function(self)
  -- function num : 0_7
  local remainTime = ToClient_GuildBattle_GetRemainTime()
  if remainTime < 0 then
    remainTime = 0
  end
  local min = (math.floor)(remainTime / 60)
  local sec = (math.floor)(remainTime % 60)
  if min > 0 then
    ((self._ui)._staticText_LeftTime):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_TIMELIMIT_MMSS", "min", tostring(min), "sec", tostring(sec)))
  else
    ;
    ((self._ui)._staticText_LeftTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_TIMELIMIT_SS", "sec", tostring(sec)))
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattle_SelectAttend.ToggleAttendMember = function(self, index)
  -- function num : 0_8
  if ToClient_GuildBattle_GetMaxAttendCount() == 1 then
    ToClient_GuildBattle_ToggleAttendMember(index)
    self:UpdateMemberInfo()
  else
    local wasAttendComplete = ToClient_GuildBattle_IsAttendMemberComplete()
    ToClient_GuildBattle_ToggleAttendMember(index)
    if wasAttendComplete ~= ToClient_GuildBattle_IsAttendMemberComplete() then
      self:UpdateMemberInfo()
    end
  end
  do
    self:UpdateConfirmButton()
    self:UpdateMemberCountText()
  end
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattle_SelectAttend.UpdateMemberCountText = function(self)
  -- function num : 0_9
  local attendCount = ToClient_GuildBattle_GetAttendCount()
  local maxAttendCount = ToClient_GuildBattle_GetMaxAttendCount()
  ;
  ((self._ui)._staticText_AttendCount):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_ATTEND_COUNT", "attendCount", tostring(attendCount), "maxAttendCount", tostring(maxAttendCount)))
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattle_SelectAttend.UpdateConfirmButton = function(self)
  -- function num : 0_10 , upvalues : EnableControl
  if ToClient_GuildBattle_IsAttendMemberComplete() == true and self._canSelectAttend == true then
    EnableControl((self._ui)._btn_ConfirmAttend, true)
  else
    EnableControl((self._ui)._btn_ConfirmAttend, false)
  end
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_GuildBattle_SelectAttend.ConfirmAttendMember = function(self)
  -- function num : 0_11
  ToClient_GuildBattle_ConfirmAttendMember()
end

FromClient_luaLoadComplete_GuildBattle_SelectAttend = function()
  -- function num : 0_12
  PaGlobal_GuildBattle_SelectAttend:Initialize()
end

FromClient_GuildBattle_SelectAttendFailed = function()
  -- function num : 0_13
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_GuildBattle_SelectAttend")
registerEvent("FromClient_selectAttendFailed", "FromClient_GuildBattle_SelectAttendFailed")

