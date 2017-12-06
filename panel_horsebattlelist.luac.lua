-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\horsebattle\panel_horsebattlelist.luac 

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
  _PA_LOG("GG", "들어옵니�\140??")
  local checkBox = (UI.getChildControl)(content, "CheckButton_MebmerCheck")
  local index = Int64toInt32(key)
  local name = (sortByMemberLevel[index])._name
  local level = (sortByMemberLevel[index])._level
  _PA_LOG("GG", "이름" .. tostring(name))
  if level == 0 then
    checkBox:SetText("<PAColor0xffc4bebe>" .. "Lv." .. level .. "    " .. name .. "<PAOldColor>")
  else
    checkBox:SetText("<PAColor0xffffffff>" .. "Lv." .. level .. "    " .. name .. "<PAOldColor>")
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
      if playerUserNo == 0 then
        playerUserNo = guildMember:getUserNo()
      else
        otherPlayerNo = guildMember:getUserNo()
      end
    end
  end
  if checkCount == 2 then
    if playerUserNo ~= 0 and otherPlayerNo ~= 0 then
      FromClient_GuildTeamBattleRequest(playerUserNo, otherPlayerNo)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_NOTMATCH_1"))
    end
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_NOTMATCH_2"))
  end
end

FGlobal_Panel_HorseBattleList_Start = function(guildName, enemyGuildName)
  -- function num : 0_8
  Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_START", "guildName", guildName, "enemyGuildName", enemyGuildName))
end

FGlobal_Panel_HorseBattleList_Win = function(guildName)
  -- function num : 0_9
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_WIN", "guildName", guildName))
end

FGlobal_Panel_HorseBattleList_Lose = function(guildName)
  -- function num : 0_10
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_LOSE", "guildName", guildName))
end

FGlobal_Panel_HorseBattleList_Draw = function(guildName)
  -- function num : 0_11
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILETEAMBATTLE_DRAW", "guildName", guildName))
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
  registerEvent("FromClient_GuildTeamBattleStart", "FGlobal_Panel_HorseBattleList_Start")
  registerEvent("FromClient_GuildTeamBattleWin", "FGlobal_Panel_HorseBattleList_Win")
  registerEvent("FromClient_GuildTeamBattleLose", "FGlobal_Panel_HorseBattleList_Lose")
end

PaGlobal_HorseBattleList:registEventHandler()
PaGlobal_HorseBattleList:HorseBattleList_Initialize()

