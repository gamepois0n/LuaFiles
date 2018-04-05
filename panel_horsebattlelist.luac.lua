-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\horsebattle\panel_horsebattlelist.luac 

-- params : ...
-- function num : 0
Panel_HorseBattleList:SetShow(false)
PaGlobal_HorseBattleList = {
_ui = {_list2 = (UI.getChildControl)(Panel_HorseBattleList, "HorseBattleList"), _btn_Confirm = (UI.getChildControl)(Panel_HorseBattleList, "Button_Confirm"), _btn_Close = (UI.getChildControl)(Panel_HorseBattleList, "Button_Close")}
, _listIndex = 0}
local checkList = {}
local sortByMemberLevel = {}
-- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_HorseBattleList.HorseBattleList_Initialize = function(self)
  -- function num : 0_0
  local minSize = float2()
  minSize.x = 100
  minSize.y = 50
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  ;
  ((self._ui)._list2):setMinScrollBtnSize(minSize)
end

HorseBattleList_ControlCreate = function(content, key)
  -- function num : 0_1
  PaGlobal_HorseBattleList:HorseBattleList_ControlCreate(content, key)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_HorseBattleList.HorseBattleList_ControlCreate = function(self, content, key)
  -- function num : 0_2 , upvalues : sortByMemberLevel, checkList
  local checkBox = (UI.getChildControl)(content, "CheckButton_MebmerCheck")
  local index = Int64toInt32(key)
  local name = (sortByMemberLevel[index])._name
  local level = (sortByMemberLevel[index])._level
  if level == 0 then
    checkBox:SetText("<PAColor0xffc4bebe>" .. "Lv." .. level .. "    " .. name .. "<PAOldColor>")
    checkBox:SetIgnore(true)
  else
    checkBox:SetText("<PAColor0xffffffff>" .. "Lv." .. level .. "    " .. name .. "<PAOldColor>")
    checkBox:SetIgnore(false)
  end
  checkBox:SetShow(true)
  checkBox:SetCheck(checkList[index])
  checkBox:addInputEvent("Mouse_LUp", "PaGlobal_HorseBattleList:HorseBattleList_Update( " .. index .. ")")
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_HorseBattleList.HorseBattleList_Update = function(self, index)
  -- function num : 0_3 , upvalues : checkList
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  checkList[index] = not checkList[index]
end

FGlobal_Panel_HorseBattleList_Sort = function(memberMaxCount)
  -- function num : 0_4 , upvalues : sortByMemberLevel
  for memberCount = 0, memberMaxCount - 1 do
    local guildMember = (ToClient_GetMyGuildInfoWrapper()):getMember(memberCount)
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R6 in 'UnsetPending'

    sortByMemberLevel[memberCount] = {_name = guildMember:getName(), _level = guildMember:getLevel(), _index = memberCount}
  end
  local temp = nil
  for memberCount = 0, memberMaxCount - 2 do
    for sortCount = memberCount, memberMaxCount - 1 do
      if (sortByMemberLevel[memberCount])._level < (sortByMemberLevel[sortCount])._level then
        temp = sortByMemberLevel[memberCount]
        -- DECOMPILER ERROR at PC42: Confused about usage of register: R10 in 'UnsetPending'

        sortByMemberLevel[memberCount] = sortByMemberLevel[sortCount]
        -- DECOMPILER ERROR at PC44: Confused about usage of register: R10 in 'UnsetPending'

        sortByMemberLevel[sortCount] = temp
      end
    end
  end
end

FGlobal_Panel_HorseBattleList_Open = function()
  -- function num : 0_5 , upvalues : checkList
  local self = PaGlobal_HorseBattleList
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  Panel_HorseBattleList:SetShow(true)
  self._listIndex = 0
  local memberMaxCount = (ToClient_GetMyGuildInfoWrapper()):getMemberCount()
  FGlobal_Panel_HorseBattleList_Sort(memberMaxCount)
  for memberCount = 0, memberMaxCount - 1 do
    (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, memberCount))
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R6 in 'UnsetPending'

    checkList[memberCount] = false
  end
end

FGlobal_Panel_HorseBattleList_Close = function()
  -- function num : 0_6
  checkSize = 0
  firstCheckIndex = -1
  secondCheckIndex = -1
  local self = PaGlobal_HorseBattleList
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  Panel_HorseBattleList:SetShow(false)
end

FGlobal_Panel_HorseBattleList_Confirm = function()
  -- function num : 0_7 , upvalues : checkList, sortByMemberLevel
  local self = PaGlobal_HorseBattleList
  local playerUserNo = 0
  local otherPlayerNo = 0
  local checkCount = 0
  local memberMaxCount = (ToClient_GetMyGuildInfoWrapper()):getMemberCount()
  for listCount = 0, memberMaxCount - 1 do
    if checkList[listCount] == true then
      checkCount = checkCount + 1
      local guildMember = (ToClient_GetMyGuildInfoWrapper()):getMember((sortByMemberLevel[listCount])._index)
      if guildMember ~= nil then
        if playerUserNo == 0 then
          playerUserNo = guildMember:getUserNo()
        else
          otherPlayerNo = guildMember:getUserNo()
        end
      end
    end
  end
  if checkCount == 2 then
    FromClient_GuildTeamBattleRequest(playerUserNo, otherPlayerNo)
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_NOTMATCH_2"))
  end
end

FGlobal_Panel_NotifyGuildTeamBattle = function(msgType, guildName, targetGuildName)
  -- function num : 0_8
  if msgType == 0 then
    Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_START", "guildName", guildName, "targetGuildName", targetGuildName))
  else
    if msgType == 1 then
      Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_WIN", "guildName", guildName, "targetGuildName", targetGuildName))
    else
      if msgType == 2 then
        Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_DRAW", "guildName", guildName, "targetGuildName", targetGuildName))
      else
        if msgType == 3 then
          Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_NOTMATCH_3", "guildName", guildName, "targetGuildName", targetGuildName))
        end
      end
    end
  end
end

FGlobal_Panel_NotifyGuildTeamBattleJoin = function()
  -- function num : 0_9
  Panel_HorseBattleList:SetShow(false)
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_JOIN"))
end

FGlobal_Panel_NotifyGuildTeamBattleNotMatch = function()
  -- function num : 0_10
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_NOTMATCH_1"))
end

FGlobal_Panel_NotifyGuildTeamBattleNotMatch = function()
  -- function num : 0_11
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_NOTMATCH_1"))
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_HorseBattleList.registEventHandler = function(self)
  -- function num : 0_12
  ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "HorseBattleList_ControlCreate")
  ;
  ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_Panel_HorseBattleList_Close()")
  ;
  ((self._ui)._btn_Confirm):addInputEvent("Mouse_LUp", "FGlobal_Panel_HorseBattleList_Confirm()")
  registerEvent("FromClient_OpenGuildTeamBattleMemberList", "FGlobal_Panel_HorseBattleList_Open")
  registerEvent("FromClient_NotifyGuildTeamBattle", "FGlobal_Panel_NotifyGuildTeamBattle")
  registerEvent("FromClient_NotifyGuildTeamBattleJoin", "FGlobal_Panel_NotifyGuildTeamBattleJoin")
  registerEvent("FromClient_NotifyGuildTeamBattleNotMatch", "FGlobal_Panel_NotifyGuildTeamBattleNotMatch")
  registerEvent("FromClient_NotifyGuildTeamBattleUnqualified", "FGlobal_Panel_NotifyGuildTeamBattleUnqualified")
end

PaGlobal_HorseBattleList:registEventHandler()
PaGlobal_HorseBattleList:HorseBattleList_Initialize()

