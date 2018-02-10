-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guildbattle_control.luac 

-- params : ...
-- function num : 0
local isShowGuildBattleCam = true
PaGlobal_GuildBattle_Control = {_elapsedTime = 0}
local BattleModes = {Normal = 0, OneOne = 1, All = 2}
local BattleStates = {Idle = 0, Join = 1, SelectEntry = 2, SelectAttend = 3, Ready = 4, Fight = 5, End = 6, Teleport = 7}
local GuildBattleWinStates = {Win = 0, Lose = 1, Draw = 2}
local HideIfShowing = function(panel)
  -- function num : 0_0
  if panel:IsShow() == true then
    panel:Show(false)
  end
end

local ShowIfNotShowing = function(panel)
  -- function num : 0_1
  if panel:IsShow() ~= true then
    panel:Show(true)
  end
end

FGlobal_GuildBattle_IsOpen = function()
  -- function num : 0_2
  do return PaGlobal_GuildBattlePoint:IsShow() == true or PaGlobal_GuildBattle_SelectEntry:IsShow() == true or PaGlobal_GuildBattle_SelectAttend:IsShow() == true end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local UpdatePanelsVisibility = function()
  -- function num : 0_3 , upvalues : BattleStates, HideIfShowing, ShowIfNotShowing
  local isMaster = ToClient_GuildBattle_AmIMasterForThisBattle()
  local battleState = ToClient_GuildBattle_GetCurrentState()
  if BattleStates.Idle == battleState then
    HideIfShowing(PaGlobal_GuildBattlePoint)
    HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
    HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
  else
    if BattleStates.Join == battleState then
      if ToClient_getJoinGuildBattle() == true then
        ShowIfNotShowing(PaGlobal_GuildBattlePoint)
      else
        HideIfShowing(PaGlobal_GuildBattlePoint)
      end
      HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
      HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
    else
      if BattleStates.SelectEntry == battleState then
        ShowIfNotShowing(PaGlobal_GuildBattlePoint)
        if isMaster == true then
          ShowIfNotShowing(PaGlobal_GuildBattle_SelectEntry)
        end
        HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
      else
        if BattleStates.SelectAttend == battleState then
          ShowIfNotShowing(PaGlobal_GuildBattlePoint)
          HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
          if isMaster == true then
            ShowIfNotShowing(PaGlobal_GuildBattle_SelectAttend)
          end
        else
          if BattleStates.Ready == battleState then
            ShowIfNotShowing(PaGlobal_GuildBattlePoint)
            HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
            HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
          else
            if BattleStates.Fight == battleState then
              ShowIfNotShowing(PaGlobal_GuildBattlePoint)
              HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
              HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
            else
              if BattleStates.End == battleState then
                ShowIfNotShowing(PaGlobal_GuildBattlePoint)
                HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
                HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
              else
                if BattleStates.Teleport == battleState then
                  ShowIfNotShowing(PaGlobal_GuildBattlePoint)
                  HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
                  HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
                else
                  _PA_ASSERT(false, "새로�\180 BattleState�\128 추가�\156 듯합니다. 코드�\188 업데이트 해주세요.")
                end
              end
            end
          end
        end
      end
    end
  end
end

local ShowBattleStateChangeMessage = function(state)
  -- function num : 0_4 , upvalues : BattleStates
  local progressServer = ToClient_GuildBattle_GetMyGuildBattleServer()
  local curChannelData = getCurrentChannelServerData()
  if progressServer == 0 or progressServer ~= curChannelData._serverNo then
    return 
  end
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_USE_GUILDWINDOW"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
  if state ~= BattleStates.Idle or state == BattleStates.Join then
    msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_USE_GUILDWINDOW"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_MATCH_SUCCESS"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
  else
    if state == BattleStates.SelectEntry then
      msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_STARTSELECT_ENTRY"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
    else
      if state == BattleStates.SelectAttend then
        msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_STARTSELECT_ATTEND"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
      else
        if state == BattleStates.Ready then
          msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_READYSTATE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
          Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
        else
          if state == BattleStates.Fight then
            msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_FIGHTSTART"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
            Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
          else
            if state == BattleStates.End then
              local winnerGuildNo = ToClient_GuildBattle_GetWinGuildNo()
              if Int64toInt32(winnerGuildNo) == -1 then
                msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_MATCH_DONE_DRAW"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_END"), addMsg = ""}
                Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
              else
                local guildName = ToClient_guild_getGuildName(winnerGuildNo)
                msg = {main = tostring(guildName) .. " " .. tostring(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_WINNER")), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_END"), addMsg = ""}
                Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
              end
            else
            end
          end
        end
      end
    end
  end
  do
    -- DECOMPILER ERROR at PC223: Confused about usage of register: R4 in 'UnsetPending'

    if state == BattleStates.Teleport then
      self._CanCancel = false
    end
  end
end

FGlobal_GuildBattle_UpdatePerFrame = function(deltaTime)
  -- function num : 0_5 , upvalues : UpdatePanelsVisibility
  if ToClient_GuildBattle_IsInGuildBattle == nil or PaGlobal_GuildBattle_SelectEntry == nil or PaGlobal_GuildBattle_SelectAttend == nil or PaGlobal_GuildBattlePoint == nil or PaGlobal_GuildBattle_Control == nil or PaGlobal_GuildBattle == nil then
    return 
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_GuildBattle_Control._elapsedTime = PaGlobal_GuildBattle_Control._elapsedTime + deltaTime
  if PaGlobal_GuildBattle_Control._elapsedTime >= 0.2 then
    ToClient_GuildBattle_UpdateTimerPerFrame()
    if ToClient_getJoinGuildBattle() == true then
      UpdatePanelsVisibility()
      if PaGlobal_GuildBattle_SelectEntry:IsShow() == true then
        PaGlobal_GuildBattle_SelectEntry:UpdateRemainTime()
      end
      if PaGlobal_GuildBattle_SelectAttend:IsShow() == true then
        PaGlobal_GuildBattle_SelectAttend:UpdateRemainTime()
      end
      if PaGlobal_GuildBattlePoint:IsShow() == true then
        PaGlobal_GuildBattlePoint:UpdateRemainTime()
      end
    end
    if PaGlobal_GuildBattle:IsShow() == true then
      PaGlobal_GuildBattle:UpdateRemainTime()
    end
    -- DECOMPILER ERROR at PC72: Confused about usage of register: R1 in 'UnsetPending'

    PaGlobal_GuildBattle_Control._elapsedTime = PaGlobal_GuildBattle_Control._elapsedTime - 0.2
  end
end

FromClient_GuildBattle_Control_Initialize = function()
  -- function num : 0_6 , upvalues : HideIfShowing
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_GuildBattle_Control._elapsedTime = 0
  HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
  HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
  HideIfShowing(PaGlobal_GuildBattlePoint)
end

FromClient_GuildBattle_GuildBattleTimerEnd = function()
  -- function num : 0_7
end

FromClient_GuildBattle_FightEnd = function(winState)
  -- function num : 0_8 , upvalues : GuildBattleWinStates
  if winState == GuildBattleWinStates.Win then
    msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_WINFIGHT"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
  else
    if winState == GuildBattleWinStates.Lose then
      msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_LOSEFIGHT"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
    else
      if winState == GuildBattleWinStates.Draw then
        msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_DRAWFIGHT"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
      else
        _PA_ASSERT(false, "새로�\180 WinState�\128 생겼습니�\140? winState=" .. winState)
      end
    end
  end
end

FromClient_GuildBattle_OnUpdateBattleInfo = function()
  -- function num : 0_9
  if PaGlobal_GuildBattle_SelectEntry:IsShow() == true then
    PaGlobal_GuildBattle_SelectEntry:UpdateMemberInfo()
  end
  if PaGlobal_GuildBattle_SelectAttend:IsShow() == true then
    PaGlobal_GuildBattle_SelectAttend:UpdateMemberInfo()
  end
  if PaGlobal_GuildBattlePoint:IsShow() == true then
    PaGlobal_GuildBattlePoint:UpdateRoundAndScore()
  end
  if PaGlobal_GuildBattle:IsShow() == true then
    PaGlobal_GuildBattle:UpdateGuildBattleInfo()
  end
end

FromClient_GuildBattle_OnChangeBattleState = function()
  -- function num : 0_10 , upvalues : ShowBattleStateChangeMessage, UpdatePanelsVisibility
  local battleState = ToClient_GuildBattle_GetCurrentState()
  if ToClient_getJoinGuildBattle() == true then
    ShowBattleStateChangeMessage(battleState)
    UpdatePanelsVisibility()
    if PaGlobal_GuildBattle_SelectEntry:IsShow() == true then
      PaGlobal_GuildBattle_SelectEntry:UpdateMemberInfo()
      PaGlobal_GuildBattle_SelectEntry:UpdateRemainTime()
    end
    if PaGlobal_GuildBattle_SelectAttend:IsShow() == true then
      PaGlobal_GuildBattle_SelectAttend:UpdateMemberInfo()
      PaGlobal_GuildBattle_SelectAttend:UpdateRemainTime()
    end
    if PaGlobal_GuildBattlePoint:IsShow() == true then
      PaGlobal_GuildBattlePoint:UpdateRoundAndScore()
      PaGlobal_GuildBattlePoint:UpdateRemainTime()
    end
  end
  if PaGlobal_GuildBattle:IsShow() == true then
    PaGlobal_GuildBattle:UpdateGuildBattleInfo()
  end
end

FromClient_GuildBattle_UnjoinBattle = function()
  -- function num : 0_11 , upvalues : HideIfShowing
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_GuildBattle_Control._elapsedTime = 0
  HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
  HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
  HideIfShowing(PaGlobal_GuildBattlePoint)
end

FromClient_GuildBattle_OurMemberJoined_GuildBattleControl = function(userNo)
  -- function num : 0_12
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  if guildWrapper == nil then
    return 
  end
  local memberInfo = guildWrapper:getMemberByUserNo(userNo)
  if memberInfo == nil then
    return 
  end
  local userName = ""
  if memberInfo:isOnline() == true then
    userName = memberInfo:getCharacterName()
  else
    userName = memberInfo:getName()
  end
  msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERJOINED", "characterName", userName), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 78)
end

FromClient_GuildBattle_OurMemberUnjoined_GuildBattleControl = function(userNo)
  -- function num : 0_13
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  if guildWrapper == nil then
    return 
  end
  local memberInfo = guildWrapper:getMemberByUserNo(userNo)
  if memberInfo == nil then
    return 
  end
  local userName = ""
  if memberInfo:isOnline() == true then
    userName = memberInfo:getCharacterName()
  else
    userName = memberInfo:getName()
  end
  msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERUNJOINED", "characterName", userName), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 78)
  if PaGlobal_GuildBattle_SelectEntry:IsShow() == true then
    PaGlobal_GuildBattle_SelectEntry:UpdateMemberInfo()
  end
  if PaGlobal_GuildBattle_SelectAttend:IsShow() == true then
    PaGlobal_GuildBattle_SelectAttend:UpdateMemberInfo()
  end
end

FromClient_GuildBattle_SomeOneKilledSomeOne_GuildBattleControl = function(attackerName, peerName, attackerTeamNo, peerTeamNo)
  -- function num : 0_14
  local attackerGuildInfo = ToClient_GuildBattle_GetCurrentServerGuildBattleInfo(attackerTeamNo)
  local peerGuildInfo = ToClient_GuildBattle_GetCurrentServerGuildBattleInfo(peerTeamNo)
  if attackerGuildInfo == nil or peerGuildInfo == nil then
    return 
  end
  msg = {main = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SOMEONEKILLEDSOMEONE", "attackerName", attackerName, "attackGuildName", attackerGuildInfo:getName(), "peerName", peerName, "peerGuildName", peerGuildInfo:getName()), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 4.5, 78)
end

FromClient_GuildBattle_AttendPlayer_GuildBattleControl = function()
  -- function num : 0_15
  msg = {main = "참가자로 선택되었습니�\164.", sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 78)
end

local GuildWatchMode = {UI_BG = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "Static_CommandBG"), UI_KeyQ = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Key_Q"), UI_KeyE = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Key_E"), UI_KeyR = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Key_R"), UI_TextSmall = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Small"), UI_TextBig = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Big"), UI_TextExit = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Exit"), UI_TextDesc = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_CameraSpeedLow"), UI_ShowButton = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "Button_ShowCommand")}
HandleClick_WatchShowToggle = function()
  -- function num : 0_16 , upvalues : GuildWatchMode
  if (GuildWatchMode.UI_BG):GetShow() == true then
    GuildWatchMode_SetControlShow(false)
  else
    GuildWatchMode_SetControlShow(true)
  end
end

GuildWatchMode_SetControlShow = function(isShow)
  -- function num : 0_17 , upvalues : GuildWatchMode
  (GuildWatchMode.UI_BG):SetShow(isShow)
  ;
  (GuildWatchMode.UI_KeyQ):SetShow(isShow)
  ;
  (GuildWatchMode.UI_KeyE):SetShow(isShow)
  ;
  (GuildWatchMode.UI_KeyR):SetShow(isShow)
  ;
  (GuildWatchMode.UI_TextSmall):SetShow(isShow)
  ;
  (GuildWatchMode.UI_TextBig):SetShow(isShow)
  ;
  (GuildWatchMode.UI_TextExit):SetShow(isShow)
  ;
  (GuildWatchMode.UI_TextDesc):SetShow(isShow)
  if isShow == false then
    Panel_GuildBattleWatchingMode:SetPosY(Panel_GuildBattleWatchingMode:GetPosY() + 200)
  else
    Panel_GuildBattleWatchingMode:SetPosY(Panel_GuildBattleWatchingMode:GetPosY() - 200)
  end
end

WatchingPanel_SetPosition = function()
  -- function num : 0_18
  local ScrX = getScreenSizeX()
  local ScrY = getScreenSizeY()
  Panel_GuildBattleWatchingMode:SetSize(200, 320)
  Panel_GuildBattleWatchingMode:SetPosY(ScrY * 3 / 4)
  Panel_GuildBattleWatchingMode:ComputePos()
end

FromClient_NotifyGuildTeamBattleShowWatchPanel = function(isShow)
  -- function num : 0_19 , upvalues : isShowGuildBattleCam, GuildWatchMode
  if isShowGuildBattleCam == false then
    ToClient_CanOpenGuildBattleCam(false)
    return 
  end
  WatchingPanel_SetPosition()
  ;
  (GuildWatchMode.UI_BG):SetShow(isShow)
  ;
  (GuildWatchMode.UI_KeyQ):SetShow(isShow)
  ;
  (GuildWatchMode.UI_KeyE):SetShow(isShow)
  ;
  (GuildWatchMode.UI_KeyR):SetShow(isShow)
  ;
  (GuildWatchMode.UI_TextSmall):SetShow(isShow)
  ;
  (GuildWatchMode.UI_TextBig):SetShow(isShow)
  ;
  (GuildWatchMode.UI_TextExit):SetShow(isShow)
  ;
  (GuildWatchMode.UI_TextDesc):SetShow(isShow)
  ;
  (GuildWatchMode.UI_ShowButton):SetCheck(isShow)
  Panel_GuildBattleWatchingMode:SetShow(isShow)
  ToClient_CanOpenGuildBattleCam(isShow)
end

FromClient_NotifyGuildBattleCameraMessage = function()
  -- function num : 0_20
  return 
end

Panel_GuildBattleWatchingMode:SetShow(false)
;
(GuildWatchMode.UI_ShowButton):addInputEvent("Mouse_LUp", "HandleClick_WatchShowToggle()")
;
(GuildWatchMode.UI_ShowButton):SetCheck(true)
registerEvent("FromClient_luaLoadComplete", "FromClient_GuildBattle_Control_Initialize")
registerEvent("FromClient_GuildBattle_FightEnd", "FromClient_GuildBattle_FightEnd")
registerEvent("FromClient_guildBattleTimer", "FromClient_GuildBattle_GuildBattleTimerEnd")
registerEvent("FromClient_responseRequestGuildBattleInfo", "FromClient_GuildBattle_OnUpdateBattleInfo")
registerEvent("FromClient_GuildBattle_StateChanged", "FromClient_GuildBattle_OnChangeBattleState")
registerEvent("FromClient_unjoinGuildBattle", "FromClient_GuildBattle_UnjoinBattle")
registerEvent("FromClient_GuildBattle_OurMemberJoined", "FromClient_GuildBattle_OurMemberJoined_GuildBattleControl")
registerEvent("FromClient_GuildBattle_OurMemberUnjoined", "FromClient_GuildBattle_OurMemberUnjoined_GuildBattleControl")
registerEvent("FromClient_GuildBattle_SomeOneKilledSomeOne", "FromClient_GuildBattle_SomeOneKilledSomeOne_GuildBattleControl")
registerEvent("FromClient_GuildBattle_AttendPlayer", "FromClient_GuildBattle_AttendPlayer_GuildBattleControl")
registerEvent("FromClient_NotifyGuildTeamBattleShowWatchPanel", "FromClient_NotifyGuildTeamBattleShowWatchPanel")
registerEvent("FromClient_NotifyGuildBattleCameraMessage", "FromClient_NotifyGuildBattleCameraMessage")

