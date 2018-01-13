-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guildbattle_selectentry.luac 

-- params : ...
-- function num : 0
PaGlobal_GuildBattle_SelectEntry = {
_ui = {_btn_WinClose = (UI.getChildControl)(Panel_GuildBattle_EntryList, "Button_Win_Close"), _staticText_Title = (UI.getChildControl)(Panel_GuildBattle_EntryList, "StaticText_Title"), _static_TopBg = (UI.getChildControl)(Panel_GuildBattle_EntryList, "Static_TopBg"), _static_Bg = (UI.getChildControl)(Panel_GuildBattle_EntryList, "Static_Bg"), _static_BottomBg = (UI.getChildControl)(Panel_GuildBattle_EntryList, "Static_BottomBg")}
}
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

CreateListContent_GuildBattle_EntryMember = function(content, index)
  -- function num : 0_1 , upvalues : EnableControl
  if Int64toInt32(index) < 0 then
    return 
  end
  local memberIndex = Int64toInt32(index)
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local userNo = ToClient_GuildBattle_GetUserNoFromJoinedList(memberIndex)
  local memberInfo = myGuildListInfo:getMemberByUserNo(userNo)
  if memberInfo == nil then
    return 
  end
  local checkBtn_AsEntry = (UI.getChildControl)(content, "CheckButton_ItemSort")
  local static_ClassIcon = (UI.getChildControl)(content, "Static_ClassIcon")
  local staticText_Level = (UI.getChildControl)(content, "StaticText_Level")
  local staticText_Name = (UI.getChildControl)(content, "StaticText_CharacterName")
  local staticText_State = (UI.getChildControl)(content, "StaticText_State")
  local hideCheckBox = ToClient_GuildBattle_GetMaxEntryCount() > 1
  local joinedCount = ToClient_GuildBattle_GetMyGuildMemberJoinedCount()
  local maxEntryCount = ToClient_GuildBattle_GetMaxEntryCount()
  local shouldSelectAll = joinedCount <= maxEntryCount
  local classSymbomInfo = (CppEnums.ClassType_Symbol)[memberInfo:getClassType()]
  static_ClassIcon:ChangeTextureInfoName(classSymbomInfo[1])
  do
    local x1, y1, x2, y2 = setTextureUV_Func(static_ClassIcon, classSymbomInfo[2], classSymbomInfo[3], classSymbomInfo[4], classSymbomInfo[5])
    ;
    (static_ClassIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    static_ClassIcon:setRenderTexture(static_ClassIcon:getBaseTexture())
    staticText_Level:SetText(tostring(memberInfo:getLevel()))
    staticText_Name:SetText(memberInfo:getCharacterName())
    if shouldSelectAll == true then
      checkBtn_AsEntry:SetCheck(true)
    elseif ToClient_GuildBattle_IsMemberInEntryList(userNo) == true then
      checkBtn_AsEntry:SetShow(true)
      checkBtn_AsEntry:SetCheck(true)
      checkBtn_AsEntry:addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle_SelectEntry:ToggleEntryMember(" .. memberIndex .. ")")
    elseif hideCheckBox == true and ToClient_GuildBattle_IsEntryMemberComplete() == true then
      checkBtn_AsEntry:SetShow(false)
    else
      checkBtn_AsEntry:SetShow(true)
      checkBtn_AsEntry:SetCheck(false)
      checkBtn_AsEntry:addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle_SelectEntry:ToggleEntryMember(" .. memberIndex .. ")")
    end
    if shouldSelectAll == true then
      EnableControl(checkBtn_AsEntry, false)
      staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERSTATE_ALLFIGHT"))
    else
      staticText_State:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERSTATE_CANFIGHT"))
    end
    if ToClient_GuildBattle_IsWaitingEntrySelectResult() == true or ToClient_GuildBattle_IsEntryMemberConfirmed() == true then
      EnableControl(checkBtn_AsEntry, false)
    end
    -- DECOMPILER ERROR: 10 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildBattle_SelectEntry.Initialize = function(self)
  -- function num : 0_2
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
  ui._staticText_MemberCount = (UI.getChildControl)(ui._static_BottomBg, "StaticText_CurrentMemberCount")
  ui._staticText_EntryCount = (UI.getChildControl)(ui._static_BottomBg, "StaticText_EntryCount")
  ui._btn_ConfirmEntry = (UI.getChildControl)(ui._static_BottomBg, "Button_Confirm")
  ;
  (ui._btn_Reload):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle_SelectEntry:UpdateMemberInfo()")
  ;
  (ui._btn_ConfirmEntry):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle_SelectEntry:ConfirmEntryMember()")
  ;
  (ui._list_GuildMembers):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CreateListContent_GuildBattle_EntryMember")
  ;
  (ui._list_GuildMembers):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildBattle_SelectEntry.ConfirmEntryMember = function(self)
  -- function num : 0_3
  ToClient_GuildBattle_ConfirmEntryMember()
  self:UpdateMemberInfo()
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildBattle_SelectEntry.Show = function(self, isShow)
  -- function num : 0_4
  Panel_GuildBattle_EntryList:SetShow(isShow)
  if isShow == true then
    self:UpdateMemberInfo()
    self:UpdateRemainTime()
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildBattle_SelectEntry.IsShow = function(self)
  -- function num : 0_5
  return Panel_GuildBattle_EntryList:GetShow()
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildBattle_SelectEntry.UpdateMemberInfo = function(self)
  -- function num : 0_6
  local memberCountJoined = ToClient_GuildBattle_GetMyGuildMemberJoinedCount()
  local shouldSelectAll = memberCountJoined <= ToClient_GuildBattle_GetMaxEntryCount()
  do
    local memberListElementManager = ((self._ui)._list_GuildMembers):getElementManager()
    if shouldSelectAll == true then
      for i = 1, memberCountJoined do
        ToClient_GuildBattle_SetJoinedMemberAsEntry(i - 1)
      end
    end
    memberListElementManager:clearKey()
    for i = 1, memberCountJoined do
      memberListElementManager:pushKey(i - 1)
    end
    self:UpdateControlButton()
    self:UpdateMemberCountText()
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildBattle_SelectEntry.UpdateRemainTime = function(self)
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

-- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildBattle_SelectEntry.UpdateControlButton = function(self)
  -- function num : 0_8 , upvalues : EnableControl
  if ToClient_GuildBattle_IsEntryMemberConfirmed() == true then
    EnableControl((self._ui)._btn_ConfirmEntry, false)
  else
    if ToClient_GuildBattle_IsEntryMemberComplete() == true then
      EnableControl((self._ui)._btn_ConfirmEntry, true)
    else
      if ToClient_GuildBattle_IsWaitingEntrySelectResult() == true then
        EnableControl((self._ui)._btn_ConfirmEntry, false)
      else
        if ToClient_GuildBattle_GetMyGuildMemberJoinedCount() <= ToClient_GuildBattle_GetMaxEntryCount() and ToClient_GuildBattle_GetMyGuildMemberJoinedCount() == ToClient_GuildBattle_GetEntryCount() then
          EnableControl((self._ui)._btn_ConfirmEntry, true)
        else
          EnableControl((self._ui)._btn_ConfirmEntry, false)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildBattle_SelectEntry.ToggleEntryMember = function(self, index)
  -- function num : 0_9
  if ToClient_GuildBattle_GetMaxEntryCount() == 1 then
    ToClient_GuildBattle_ToggleEntryMember(index)
    self:UpdateMemberInfo()
  else
    local wasEntryComplete = ToClient_GuildBattle_IsEntryMemberComplete()
    ToClient_GuildBattle_ToggleEntryMember(index)
    if wasEntryComplete ~= ToClient_GuildBattle_IsEntryMemberComplete() then
      self:UpdateMemberInfo()
    else
      self:UpdateControlButton()
      self:UpdateMemberCountText()
    end
  end
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildBattle_SelectEntry.UpdateMemberCountText = function(self)
  -- function num : 0_10
  local joinedCount = ToClient_GuildBattle_GetMyGuildMemberJoinedCount()
  local entryCount = ToClient_GuildBattle_GetEntryCount()
  local maxEntryCount = ToClient_GuildBattle_GetMaxEntryCount()
  ;
  ((self._ui)._staticText_MemberCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_JOINEDMEMBER_COUNT", "count", tostring(joinedCount)))
  ;
  ((self._ui)._staticText_EntryCount):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_ENTRY_COUNT", "entryCount", tostring(entryCount), "maxEntryCount", tostring(maxEntryCount)))
end

FromClient_luaLoadComplete_GuildBattle_SelectEntry = function()
  -- function num : 0_11
  PaGlobal_GuildBattle_SelectEntry:Initialize()
end

FromClient_GuildBattle_SelectEntryResult = function(isSuccess)
  -- function num : 0_12
  if isSuccess == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SETENTRYFINISHED"))
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SETENTRYFAILED"))
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_GuildBattle_SelectEntry")
registerEvent("FromClient_selectEntryResult", "FromClient_GuildBattle_SelectEntryResult")

