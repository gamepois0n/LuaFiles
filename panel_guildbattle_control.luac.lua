-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guildbattle_control.luac 

-- params : ...
-- function num : 0
local isShowGuildBattleCam = true
PaGlobal_GuildBattle_Control = {_elapsedTime = 0}
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
  -- function num : 0_3 , upvalues : HideIfShowing, ShowIfNotShowing
  local isMaster = ToClient_GuildBattle_AmIMasterForThisBattle()
  local battleState = ToClient_GuildBattle_GetCurrentState()
  if __eGuildBattleState_Idle == battleState then
    HideIfShowing(PaGlobal_GuildBattlePoint)
    HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
    HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
    ShowIfNotShowing(PaGlobal_GuildBattle_JoinMember)
  else
    if __eGuildBattleState_Join == battleState then
      if ToClient_getJoinGuildBattle() == true then
        ShowIfNotShowing(PaGlobal_GuildBattlePoint)
      else
        HideIfShowing(PaGlobal_GuildBattlePoint)
      end
      HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
      HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
      HideIfShowing(PaGlobal_GuildBattle_JoinMember)
    else
      if __eGuildBattleState_SelectEntry == battleState then
        ShowIfNotShowing(PaGlobal_GuildBattlePoint)
        if ToClient_isPersonalBattle() == false then
          ShowIfNotShowing(PaGlobal_GuildBattle_SelectEntry)
        end
        HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
        HideIfShowing(PaGlobal_GuildBattle_JoinMember)
      else
        if __eGuildBattleState_SelectAttend == battleState then
          ShowIfNotShowing(PaGlobal_GuildBattlePoint)
          HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
          if isMaster == true or ToClient_isPersonalBattle() == true then
            ShowIfNotShowing(PaGlobal_GuildBattle_SelectAttend)
          end
          HideIfShowing(PaGlobal_GuildBattle_JoinMember)
        else
          if __eGuildBattleState_Ready == battleState then
            ShowIfNotShowing(PaGlobal_GuildBattlePoint)
            HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
            HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
            HideIfShowing(PaGlobal_GuildBattle_JoinMember)
          else
            if __eGuildBattleState_Fight == battleState then
              ShowIfNotShowing(PaGlobal_GuildBattlePoint)
              HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
              HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
              HideIfShowing(PaGlobal_GuildBattle_JoinMember)
            else
              if __eGuildBattleState_End == battleState then
                ShowIfNotShowing(PaGlobal_GuildBattlePoint)
                HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
                HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
                HideIfShowing(PaGlobal_GuildBattle_JoinMember)
              else
                if __eGuildBattleState_Teleport == battleState then
                  ShowIfNotShowing(PaGlobal_GuildBattlePoint)
                  HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
                  HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
                  HideIfShowing(PaGlobal_GuildBattle_JoinMember)
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
  -- function num : 0_4
  if ToClient_isPersonalBattle() == false then
    local progressServer = ToClient_GuildBattle_GetMyGuildBattleServer()
    local curChannelData = getCurrentChannelServerData()
    if progressServer == 0 or progressServer ~= curChannelData._serverNo then
      return 
    end
  end
  do
    local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_USE_GUILDWINDOW"), sub = PaGlobal_GuildBattle:GetTitle(), addMsg = ""}
    if state == __eGuildBattleState_Idle then
      return 
    else
      if state == __eGuildBattleState_Join then
        msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_USE_GUILDWINDOW")
        msg.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_MATCH_SUCCESS")
      else
        if state == __eGuildBattleState_SelectEntry then
          if ToClient_isPersonalBattle() == true then
            return 
          else
            msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_STARTSELECT_ENTRY")
          end
        else
          if state == __eGuildBattleState_SelectAttend then
            if ToClient_isPersonalBattle() == true then
              msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_STARTSELECT_ATTEND")
            else
              msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_STARTSELECT_ATTEND")
            end
          else
            if state == __eGuildBattleState_Ready then
              if ToClient_isPersonalBattle() == true then
                msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_READYSTATE")
              else
                msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_READYSTATE")
              end
            else
              if state == __eGuildBattleState_Fight then
                if ToClient_isPersonalBattle() == true then
                  msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_FIGHTSTART")
                else
                  msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_FIGHTSTART")
                end
              else
                if state == __eGuildBattleState_End then
                  local winnerGuildNo = ToClient_GuildBattle_GetWinGuildNo()
                  if ToClient_isPersonalBattle() == true then
                    msg.sub = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_END")
                  else
                    msg.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_END")
                  end
                  if Int64toInt32(winnerGuildNo) == -1 then
                    msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_MATCH_DONE_DRAW")
                  else
                    if ToClient_isPersonalBattle() == true then
                      local battleResultReason = ToClient_GuildBattle_GetBattleResultReason()
                      if ToClient_isPersonalBattleWin() == true then
                        if __eGuildBattleResultReason_NoMaster == battleResultReason then
                          msg.sub = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_OTHERTEAM_MASTER_OUT")
                        else
                          if __eGuildBattleResultReason_TooManyPlayerOut == battleResultReason then
                            msg.sub = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_OTHERTEAM_MANYPLAYER_OUT")
                          end
                        end
                        msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_WIN")
                      else
                        if __eGuildBattleResultReason_NoMaster == battleResultReason then
                          msg.sub = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_MYTEAM_MASTER_OUT")
                        else
                          if __eGuildBattleResultReason_TooManyPlayerOut == battleResultReason then
                            msg.sub = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_MYTEAM_MANYPLAYER_OUT")
                          end
                        end
                        msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_LOSE")
                      end
                    else
                      do
                        do
                          local guildName = ToClient_guild_getGuildName(winnerGuildNo)
                          msg.main = tostring(guildName) .. " " .. tostring(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_WINNER"))
                          if state == __eGuildBattleState_Teleport then
                            return 
                          else
                            -- DECOMPILER ERROR at PC245: Confused about usage of register: R2 in 'UnsetPending'

                            self._CanCancel = false
                            return 
                          end
                          Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78, false)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
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

FromClient_GuildBattle_Emergency_Ringout = function(count)
  -- function num : 0_8
  msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_EMERGENCY_RINGOUT", "count", count), sub = PaGlobal_GuildBattle:GetTitle(), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78, false)
end

FromClient_GuildBattle_FightEnd = function(winState, isRingOut)
  -- function num : 0_9
  msg = {main = "", sub = PaGlobal_GuildBattle:GetTitle(), addMsg = ""}
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

  if winState == __eGuildBattleWinState_Win then
    if isRingOut == true then
      msg.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RINGOUT_WIN")
    end
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

    msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_WINFIGHT")
  else
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

    if winState == __eGuildBattleWinState_Lose then
      if isRingOut == true then
        msg.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RINGOUT_LOSE")
      end
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

      msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_LOSEFIGHT")
    else
      -- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

      if winState == __eGuildBattleWinState_Draw then
        msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_DRAWFIGHT")
      else
        _PA_ASSERT(false, "새로�\180 WinState�\128 생겼습니�\140? winState=" .. winState)
        return 
      end
    end
  end
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78, false)
  PaGlobal_GuildBattlePoint:clearAttendName()
end

FromClient_GuildBattle_OnUpdateBattleInfo = function()
  -- function num : 0_10
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
  -- function num : 0_11 , upvalues : ShowBattleStateChangeMessage, UpdatePanelsVisibility
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
  -- function num : 0_12 , upvalues : HideIfShowing
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_GuildBattle_Control._elapsedTime = 0
  HideIfShowing(PaGlobal_GuildBattle_SelectEntry)
  HideIfShowing(PaGlobal_GuildBattle_SelectAttend)
  HideIfShowing(PaGlobal_GuildBattlePoint)
end

FromClient_GuildBattle_OurMemberJoined_GuildBattleControl = function(userNo)
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
  msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERJOINED", "characterName", userName), sub = PaGlobal_GuildBattle:GetTitle(), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 78, false)
end

FromClient_GuildBattle_OurMemberUnjoined_GuildBattleControl = function(userNo, isMyTeamMasterOut)
  -- function num : 0_14
  local userName = ""
  if ToClient_isPersonalBattle() == false then
    local guildWrapper = ToClient_GetMyGuildInfoWrapper()
    if guildWrapper == nil then
      return 
    end
    local memberInfo = guildWrapper:getMemberByUserNo(userNo)
    if memberInfo == nil then
      return 
    end
    if memberInfo:isOnline() == true then
      userName = memberInfo:getCharacterName()
    else
      userName = memberInfo:getName()
    end
  else
    do
      do
        local memberInfo = Toclient_getPersonalBattleMemberInfo(userNo)
        if memberInfo == nil then
          return 
        end
        userName = memberInfo:getCharacterName()
        msg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PLAYERUNJOINED", "characterName", userName), sub = PaGlobal_GuildBattle:GetTitle(), addMsg = ""}
        -- DECOMPILER ERROR at PC66: Confused about usage of register: R3 in 'UnsetPending'

        if ToClient_isPersonalBattle() == true and isMyTeamMasterOut == true then
          msg.main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_MASTERUNJOINED", "characterName", userName)
        end
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 78, false)
        if PaGlobal_GuildBattle_SelectEntry:IsShow() == true then
          PaGlobal_GuildBattle_SelectEntry:UpdateMemberInfo()
        end
        if PaGlobal_GuildBattle_SelectAttend:IsShow() == true then
          PaGlobal_GuildBattle_SelectAttend:UpdateMemberInfo()
        end
      end
    end
  end
end

FromClient_GuildBattle_SomeOneKilledSomeOne_ForWaitingState = function(attackerName, peerName)
  -- function num : 0_15
  msg = {main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_COMPETITION_USERDEAD_ATTACKED", "attackerName", attackerName, "deadUserName", peerName), sub = PaGlobal_GuildBattle:GetTitle(), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 4.5, 78, false)
end

FromClient_GuildBattle_SomeOneKilledSomeOne_GuildBattleControl = function(attackerName, peerName, attackerTeamNo, peerTeamNo)
  -- function num : 0_16
  local attackerGuildInfo = ToClient_GuildBattle_GetCurrentServerGuildBattleInfo(attackerTeamNo)
  local peerGuildInfo = ToClient_GuildBattle_GetCurrentServerGuildBattleInfo(peerTeamNo)
  if attackerGuildInfo == nil or peerGuildInfo == nil then
    return 
  end
  if ToClient_isPersonalBattle() == true then
    if attackerTeamNo == 0 then
      attackerguildName = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_BELONG_1")
      peerguildName = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_BELONG_2")
    else
      attackerguildName = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_BELONG_2")
      peerguildName = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_BELONG_1")
    end
  else
    attackerguildName = attackerGuildInfo:getName()
    peerguildName = peerGuildInfo:getName()
  end
  msg = {main = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SOMEONEKILLEDSOMEONE", "attackerName", attackerName, "attackGuildName", attackerguildName, "peerName", peerName, "peerGuildName", peerguildName), sub = PaGlobal_GuildBattle:GetTitle(), addMsg = ""}
  -- DECOMPILER ERROR at PC88: Confused about usage of register: R6 in 'UnsetPending'

  if ToClient_isPersonalBattle() == true then
    msg.main = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_SOMEONEKILLEDSOMEONE", "attackerName", attackerName, "attackGuildName", attackerguildName, "peerName", peerName, "peerGuildName", peerguildName)
  end
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 4.5, 78, false)
end

FromClient_GuildBattle_AttendPlayer_GuildBattleControl = function()
  -- function num : 0_17
  msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SELECTED_PARTICIPANT"), sub = PaGlobal_GuildBattle:GetTitle(), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 78, false)
end

local GuildWatchMode = {UI_BG = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "Static_CommandBG"), UI_KeyQ = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Key_Q"), UI_KeyE = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Key_E"), UI_KeyR = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Key_R"), UI_TextSmall = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Small"), UI_TextBig = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Big"), UI_TextExit = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_Exit"), UI_TextDesc = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "StaticText_CameraSpeedLow"), UI_ShowButton = (UI.getChildControl)(Panel_GuildBattleWatchingMode, "Button_ShowCommand")}
HandleClick_WatchShowToggle = function()
  -- function num : 0_18 , upvalues : GuildWatchMode
  if (GuildWatchMode.UI_BG):GetShow() == true then
    GuildWatchMode_SetControlShow(false)
  else
    GuildWatchMode_SetControlShow(true)
  end
end

PaGlobal_GuildBattle_WatchModeStringSetting = function()
  -- function num : 0_19 , upvalues : GuildWatchMode
  if ToClient_isPersonalBattle() == true then
    (GuildWatchMode.UI_TextSmall):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_WATCHING_START"))
    ;
    (GuildWatchMode.UI_TextBig):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_WATCHING_FIND_NEXT"))
    ;
    (GuildWatchMode.UI_TextDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_WATCHING_DESC"))
  else
    ;
    (GuildWatchMode.UI_TextSmall):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_WATCHING_START"))
    ;
    (GuildWatchMode.UI_TextBig):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_WATCHING_FIND_NEXT"))
    ;
    (GuildWatchMode.UI_TextDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_WATCHING_DESC"))
  end
  local yPos = (GuildWatchMode.UI_KeyE):GetPosY()
  if __eGuildBattleMode_OneOne ~= ToClient_GuildBattle_GetCurrentMode() then
    (GuildWatchMode.UI_KeyE):SetShow(true)
    ;
    (GuildWatchMode.UI_TextBig):SetShow(true)
    ;
    (GuildWatchMode.UI_KeyR):SetPosY(yPos + 30)
    ;
    (GuildWatchMode.UI_TextExit):SetPosY(yPos + 32)
  else
    ;
    (GuildWatchMode.UI_KeyE):SetShow(false)
    ;
    (GuildWatchMode.UI_TextBig):SetShow(false)
    ;
    (GuildWatchMode.UI_TextSmall):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WATCHING_START"))
    ;
    (GuildWatchMode.UI_TextSmall):SetPosY(yPos - 47)
    ;
    (GuildWatchMode.UI_TextBig):SetText("")
    ;
    (GuildWatchMode.UI_KeyR):SetPosY(yPos)
    ;
    (GuildWatchMode.UI_TextExit):SetPosY(yPos + 2)
  end
end

GuildWatchMode_SetControlShow = function(isShow)
  -- function num : 0_20 , upvalues : GuildWatchMode
  PaGlobal_GuildBattle_WatchModeStringSetting()
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
  if isShow == false then
    Panel_GuildBattleWatchingMode:SetPosY(Panel_GuildBattleWatchingMode:GetPosY() + 200)
  else
    Panel_GuildBattleWatchingMode:SetPosY(Panel_GuildBattleWatchingMode:GetPosY() - 200)
  end
end

WatchingPanel_SetPosition = function()
  -- function num : 0_21
  local ScrX = getScreenSizeX()
  local ScrY = getScreenSizeY()
  Panel_GuildBattleWatchingMode:SetSize(200, 320)
  Panel_GuildBattleWatchingMode:SetPosY(ScrY * 3 / 4)
  Panel_GuildBattleWatchingMode:ComputePos()
end

FromClient_NotifyGuildTeamBattleShowWatchPanel = function(isShow)
  -- function num : 0_22 , upvalues : isShowGuildBattleCam, GuildWatchMode
  if isShowGuildBattleCam == false then
    ToClient_CanOpenGuildBattleCam(false)
    return 
  end
  WatchingPanel_SetPosition()
  PaGlobal_GuildBattle_WatchModeStringSetting()
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
  -- function num : 0_23
  return 
end

FromClient_FightTimeLeftMessage = function(fightTime)
  -- function num : 0_24
  local min = (math.floor)(fightTime / 60)
  local sec = (math.floor)(fightTime % 60)
  local msg = {main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_FIGHT_TIMELEFT", "min", tostring(min), "sec", tostring(sec)), sub = PaGlobal_GuildBattle:GetTitle(), addMsg = ""}
  if sec == 0 then
    msg.main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_FIGHT_TIMELEFT_MIN", "min", tostring(min))
  end
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 78, false)
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
registerEvent("FromClient_FightTimeLeftMessage", "FromClient_FightTimeLeftMessage")
registerEvent("FromClient_GuildBattle_Emergency_Ringout", "FromClient_GuildBattle_Emergency_Ringout")
registerEvent("FromClient_GuildBattle_SomeOneKilledSomeOne_ForWaitingState", "FromClient_GuildBattle_SomeOneKilledSomeOne_ForWaitingState")

