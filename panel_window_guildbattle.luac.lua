-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_window_guildbattle.luac 

-- params : ...
-- function num : 0
PaGlobal_GuildBattle = {
_ui = {_guildBattleBG = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_GuildBattleBG"), _backgroundMainBG = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_TopBack"), _btn_Reservation = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Reservation"), _btn_Cancle = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_ReservationCancel"), _btn_Join = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Join"), _btn_UnJoin = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_UnJoin"), _btn_Start = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Start"), _txt_progress = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_Text_Progress"), _txt_progressGlow = (UI.getChildControl)(Panel_Window_GuildBattle, "StaticText_ProgressGlow"), _notJoinText = (UI.getChildControl)(Panel_Window_GuildBattle, "StaticText_NoGuild"), 
_joinBothGuild = {}
, 
_joinProgressTimer = {}
, _midBattleMark = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_CenterMark"), _txt_BottomDesc = (UI.getChildControl)(Panel_Window_GuildBattle, "StaticText_BottomDesc"), 
_guildAinfo = {}
, _edit_PriceInput = (UI.getChildControl)(Panel_Window_GuildBattle, "Edit_PriceInput")}
, _battingPrice = 0, _CanCancel = true, _cancelAnotherGuild = false}
-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Initialize = function(self)
  -- function num : 0_0
  local ainfo = {}
  ainfo._bg = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_WaitGuild")
  ainfo._master = (UI.getChildControl)(ainfo._bg, "StaticText_GuildMasterValue")
  ainfo._ranking = (UI.getChildControl)(ainfo._bg, "StaticText_GuildRankValue")
  ainfo._rating = (UI.getChildControl)(ainfo._bg, "StaticText_GuildPointValue")
  ainfo._name = (UI.getChildControl)(ainfo._bg, "StaticText_GuildName")
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui)._guildAinfo = ainfo
  local joinProgress = {}
  joinProgress._bg = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_JoinWaitProgress")
  joinProgress._timeText = (UI.getChildControl)(joinProgress._bg, "MultilineText_JoinWaitBG")
  joinProgress._progressBar = (UI.getChildControl)(joinProgress._bg, "CircularProgress_JoinWait")
  joinProgress._stateText = (UI.getChildControl)(joinProgress._bg, "StaticText_TimeTitle")
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._joinProgressTimer = joinProgress
  local bothjoined = {}
  bothjoined._bg = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_JoinWaitBothGuild")
  bothjoined._guildANameMark = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildNameLeft")
  bothjoined._guildAMaster = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildMasterNameValueLeft")
  bothjoined._guildAranking = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildRankValueLeft")
  bothjoined._guildArating = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildPointValueLeft")
  bothjoined._guildAScore = (UI.getChildControl)(bothjoined._bg, "StaticText_ScoreLeft")
  bothjoined._guildBNameMark = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildNameRight")
  bothjoined._guildBMaster = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildMasterNameValueRight")
  bothjoined._guildBranking = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildRankValueRight")
  bothjoined._guildBrating = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildPointValueRight")
  bothjoined._guildBScore = (UI.getChildControl)(bothjoined._bg, "StaticText_ScoreRight")
  bothjoined._CompleteBG = (UI.getChildControl)(bothjoined._bg, "Static_JoinCompleteBothGuildCenterBG")
  -- DECOMPILER ERROR at PC134: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._joinBothGuild = bothjoined
  ;
  ((self._ui)._txt_BottomDesc):setPadding((CppEnums.Padding).ePadding_Left, 10)
  ;
  ((self._ui)._txt_BottomDesc):setPadding((CppEnums.Padding).ePadding_Right, 10)
  ;
  ((self._ui)._txt_BottomDesc):setPadding((CppEnums.Padding).ePadding_Top, 10)
  ;
  ((self._ui)._txt_BottomDesc):setPadding((CppEnums.Padding).ePadding_Bottom, 10)
  ;
  ((self._ui)._txt_BottomDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._txt_BottomDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BOTTOMDESC"))
  ;
  ((self._ui)._txt_BottomDesc):SetSize(((self._ui)._txt_BottomDesc):GetSizeX(), ((self._ui)._txt_BottomDesc):GetTextSizeY() + 20)
  ;
  ((self._ui)._edit_PriceInput):SetNumberMode(true)
  ;
  ((self._ui)._edit_PriceInput):SetPosY(200)
  ;
  ((self._ui)._edit_PriceInput):SetShow(false)
  ;
  ((self._ui)._guildBattleBG):MoveChilds(((self._ui)._guildBattleBG):GetID(), Panel_Window_GuildBattle)
  ;
  (UI.deletePanel)(Panel_Window_GuildBattle:GetID())
  Panel_Window_GuildBattle = nil
  ;
  ((self._ui)._backgroundMainBG):SetSize(710, 570 - ((self._ui)._txt_BottomDesc):GetTextSizeY())
  self:turnOffAllControl()
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetProgressServer = function(self, cancel)
  -- function num : 0_1
  local progressServer = ToClient_GuildBattle_GetMyGuildBattleServer()
  local channelName = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_NOTDOING")
  local isReserve = false
  do
    if progressServer ~= 0 then
      local curChannelData = getCurrentChannelServerData()
      if curChannelData ~= nil then
        channelName = getChannelName(curChannelData._worldNo, progressServer)
        isReserve = true
        if progressServer ~= curChannelData._serverNo then
          return 
        end
      end
      if cancel == true then
        return 
      end
    end
    self._CanCancel = true
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE")
    local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
    if isReserve == true then
      msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RESERVE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
    else
      if cancel == true then
        msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_CANCEL"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
      else
        msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_END"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
      end
    end
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
    ;
    ((self._ui)._txt_progress):SetText(channelName)
  end
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.turnOffAllControl = function(self)
  -- function num : 0_2
  ((self._ui)._btn_Reservation):SetShow(false)
  ;
  ((self._ui)._btn_Cancle):SetShow(false)
  ;
  ((self._ui)._btn_Join):SetShow(false)
  ;
  ((self._ui)._btn_UnJoin):SetShow(false)
  ;
  ((self._ui)._btn_Start):SetShow(false)
  ;
  (((self._ui)._joinProgressTimer)._bg):SetShow(false)
  ;
  ((self._ui)._midBattleMark):SetShow(false)
  ;
  ((self._ui)._txt_progress):SetShow(false)
  ;
  ((self._ui)._txt_progressGlow):SetShow(false)
  ;
  ((self._ui)._notJoinText):SetShow(false)
  ;
  (((self._ui)._guildAinfo)._bg):SetShow(false)
  ;
  (((self._ui)._joinBothGuild)._bg):SetShow(false)
  ;
  ((self._ui)._txt_BottomDesc):SetShow(false)
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetGuildMark = function(self, guildNo, mark)
  -- function num : 0_3
  local isSet = setGuildTextureByGuildNo(guildNo, mark)
  if isSet == false then
    mark:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(mark, 183, 1, 188, 6)
    ;
    (mark:getBaseTexture()):setUV(x1, y1, x2, y2)
    mark:setRenderTexture(mark:getBaseTexture())
  else
    do
      ;
      (mark:getBaseTexture()):setUV(0, 0, 1, 1)
      mark:setRenderTexture(mark:getBaseTexture())
    end
  end
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetGuildInfoOneReserved = function(self, guildBattleInfo)
  -- function num : 0_4
  self:SetGuildMark(guildBattleInfo:getNo(), ((self._ui)._guildAinfo)._name)
  ;
  (((self._ui)._guildAinfo)._name):SetText(guildBattleInfo:getName())
  ;
  (((self._ui)._guildAinfo)._master):SetText(guildBattleInfo:getMaster())
  ;
  (((self._ui)._guildAinfo)._ranking):SetText(tostring(guildBattleInfo:getRanking()) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RANKING"))
  ;
  (((self._ui)._guildAinfo)._rating):SetText(tostring(guildBattleInfo:getRating()) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_POINT"))
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetGuildInfoBothReserved = function(self, index, guildBattleInfo)
  -- function num : 0_5
  if index == 0 then
    self:SetGuildMark(guildBattleInfo:getNo(), ((self._ui)._joinBothGuild)._guildANameMark)
    ;
    (((self._ui)._joinBothGuild)._guildANameMark):SetText(guildBattleInfo:getName())
    ;
    (((self._ui)._joinBothGuild)._guildAMaster):SetText(guildBattleInfo:getMaster())
    ;
    (((self._ui)._joinBothGuild)._guildAranking):SetText(tostring(guildBattleInfo:getRanking()) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RANKING"))
    ;
    (((self._ui)._joinBothGuild)._guildArating):SetText(tostring(guildBattleInfo:getRating()) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_POINT"))
    ;
    (((self._ui)._joinBothGuild)._guildAScore):SetText(tostring(guildBattleInfo:winPoint()))
  else
    self:SetGuildMark(guildBattleInfo:getNo(), ((self._ui)._joinBothGuild)._guildBNameMark)
    ;
    (((self._ui)._joinBothGuild)._guildBNameMark):SetText(guildBattleInfo:getName())
    ;
    (((self._ui)._joinBothGuild)._guildBMaster):SetText(guildBattleInfo:getMaster())
    ;
    (((self._ui)._joinBothGuild)._guildBranking):SetText(tostring(guildBattleInfo:getRanking()) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RANKING"))
    ;
    (((self._ui)._joinBothGuild)._guildBrating):SetText(tostring(guildBattleInfo:getRating()) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_POINT"))
    ;
    (((self._ui)._joinBothGuild)._guildBScore):SetText(tostring(guildBattleInfo:winPoint()))
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.UpdateGuildBattleInfo = function(self)
  -- function num : 0_6
  local guildA = ToClient_GuildBattle_GetCurrentServerGuildBattleInfo(0)
  local guildB = ToClient_GuildBattle_GetCurrentServerGuildBattleInfo(1)
  if not ((getSelfPlayer()):get()):isGuildMaster() then
    local amIGuildMasterOrSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  end
  local amIMaster = ToClient_GuildBattle_AmIMasterForThisBattle()
  local MyGuildServer = ToClient_GuildBattle_GetMyGuildBattleServer()
  local curChannelData = getCurrentChannelServerData()
  local isCurrentGuildServer = false
  local guildCount = 2
  local attendGuild = -1
  local didIJoinGuildBattle = ToClient_getJoinGuildBattle()
  local battleState = ToClient_GuildBattle_GetCurrentState()
  local battleMode = ToClient_GuildBattle_GetCurrentMode()
  self:turnOffAllControl()
  if MyGuildServer ~= 0 and MyGuildServer ~= curChannelData._serverNo then
    local channelName = getChannelName(curChannelData._worldNo, MyGuildServer)
    ;
    ((self._ui)._notJoinText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_ANOTHERSERVER", "server", channelName))
    ;
    ((self._ui)._notJoinText):SetShow(true)
    ;
    ((self._ui)._txt_BottomDesc):SetShow(true)
    return 
  else
    do
      if MyGuildServer == curChannelData._serverNo then
        isCurrentGuildServer = true
      end
      if guildA == nil then
        guildCount = guildCount - 1
      end
      if guildB == nil then
        guildCount = guildCount - 1
      end
      if guildCount == 0 then
        ((self._ui)._txt_BottomDesc):SetShow(true)
        ;
        ((self._ui)._backgroundMainBG):SetSize(710, 550 - ((self._ui)._txt_BottomDesc):GetTextSizeY())
        ;
        ((self._ui)._notJoinText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_NOGUILD"))
        ;
        ((self._ui)._notJoinText):SetShow(true)
        if amIGuildMasterOrSubMaster == true then
          ((self._ui)._btn_Reservation):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RESERVE_BUTTON"))
          ;
          ((self._ui)._btn_Reservation):SetShow(true)
          ;
          ((self._ui)._btn_Reservation):SetSpanSize(0, 250)
        end
      else
        if guildCount == 1 then
          if guildA ~= nil then
            self:SetGuildInfoOneReserved(guildA)
          else
            self:SetGuildInfoOneReserved(guildB)
          end
          ;
          (((self._ui)._guildAinfo)._bg):SetShow(true)
          ;
          ((self._ui)._backgroundMainBG):SetSize(710, 580)
          -- DECOMPILER ERROR at PC164: Unhandled construct in 'MakeBoolean' P1

          if isCurrentGuildServer == true and amIGuildMasterOrSubMaster == true then
            ((self._ui)._btn_Cancle):SetShow(true)
            ;
            ((self._ui)._btn_Cancle):SetSpanSize(0, 85)
          end
          if amIGuildMasterOrSubMaster == true then
            ((self._ui)._btn_Reservation):SetShow(true)
            ;
            ((self._ui)._btn_Reservation):SetSpanSize(0, 85)
          end
        else
          self:SetGuildInfoBothReserved(0, guildA)
          self:SetGuildInfoBothReserved(1, guildB)
          ;
          (((self._ui)._joinBothGuild)._bg):SetShow(true)
          ;
          (((self._ui)._joinBothGuild)._CompleteBG):SetShow(true)
          ;
          ((self._ui)._backgroundMainBG):SetSize(710, 580)
          ;
          ((self._ui)._txt_progress):SetShow(true)
          ;
          ((self._ui)._txt_progress):useGlowFont(true, "BaseFont_10_Glow", 4279004349)
          ;
          ((self._ui)._txt_progress):SetShow(true)
          if __eGuildBattleState_Idle == battleState then
            ((self._ui)._txt_progress):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_MATCHING"))
          else
            if __eGuildBattleState_Join == battleState then
              ((self._ui)._txt_progress):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLESTATE_JOIN"))
            else
              if __eGuildBattleState_End == battleState then
                ((self._ui)._txt_progress):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLESTATE_END"))
              else
                if __eGuildBattleGameMode_Normal == battleMode then
                  ((self._ui)._txt_progress):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLEMODE_NORMAL") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_ONGOING"))
                else
                  if __eGuildBattleGameMode_OneOne == battleMode then
                    ((self._ui)._txt_progress):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLEMODE_ONEONE") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_ONGOING"))
                  else
                    if __eGuildBattleGameMode_All == battleMode then
                      ((self._ui)._txt_progress):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_BATTLEMODE_ALL") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_ONGOING"))
                    end
                  end
                end
              end
            end
          end
          if isCurrentGuildServer == true and __eGuildBattleState_Join == battleState then
            (((self._ui)._joinBothGuild)._CompleteBG):SetShow(false)
            ;
            (((self._ui)._joinProgressTimer)._bg):SetShow(true)
            if amIGuildMasterOrSubMaster == true then
              if amIMaster == true then
                if didIJoinGuildBattle == true then
                  ((self._ui)._btn_Start):SetShow(true)
                  ;
                  ((self._ui)._btn_UnJoin):SetShow(true)
                  ;
                  ((self._ui)._btn_Start):SetSpanSize(-100, 85)
                  ;
                  ((self._ui)._btn_UnJoin):SetSpanSize(100, 85)
                else
                  ;
                  ((self._ui)._btn_Join):SetShow(true)
                  ;
                  ((self._ui)._btn_Cancle):SetShow(true)
                  ;
                  ((self._ui)._btn_Join):SetSpanSize(-100, 85)
                  ;
                  ((self._ui)._btn_Cancle):SetSpanSize(100, 85)
                end
              else
                if didIJoinGuildBattle == true then
                  ((self._ui)._btn_UnJoin):SetShow(true)
                  ;
                  ((self._ui)._btn_UnJoin):SetSpanSize(0, 85)
                else
                  ;
                  ((self._ui)._btn_Join):SetShow(true)
                  ;
                  ((self._ui)._btn_Cancle):SetShow(true)
                  ;
                  ((self._ui)._btn_Join):SetSpanSize(-100, 85)
                  ;
                  ((self._ui)._btn_Cancle):SetSpanSize(100, 85)
                end
              end
            else
              if didIJoinGuildBattle == true then
                ((self._ui)._btn_UnJoin):SetShow(true)
                ;
                ((self._ui)._btn_UnJoin):SetSpanSize(0, 85)
              else
                ;
                ((self._ui)._btn_Join):SetShow(true)
                ;
                ((self._ui)._btn_Join):SetSpanSize(0, 85)
              end
            end
          end
          if didIJoinGuildBattle == false and battleState ~= __eGuildBattleState_Idle and battleState ~= __eGuildBattleState_Join then
            ((self._ui)._txt_progress):SetText(PaGlobal_GuildBattle:GetTitle() .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_ONGOING"))
          end
        end
      end
      if self._CanCancel == false then
        ((self._ui)._btn_Cancle):SetShow(false)
      end
    end
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.isOneOneMode = function(self)
  -- function num : 0_7
  do
    local gamemode = ToClient_GuildBattle_GetCurrentMode()
    do return __eGuildBattleGameMode_OneOne == gamemode end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.notifyJoinGuildBattle = function(self)
  -- function num : 0_8
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_USE_GUILDWINDOW"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SET_BATTLE"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
  ToClient_GuildBattle_UpdateGuildBattleInfo()
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.ModeChangeRequest = function(self, mode)
  -- function num : 0_9
end

-- DECOMPILER ERROR at PC123: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Open = function(self)
  -- function num : 0_10
  ToClient_GuildBattle_UpdateGuildBattleInfo()
  ;
  ((self._ui)._guildBattleBG):SetShow(true)
end

FGlobal_GuildBattle_Open = function()
  -- function num : 0_11
  PaGlobal_GuildBattle:Open()
end

-- DECOMPILER ERROR at PC128: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Close = function(self)
  -- function num : 0_12
  ((self._ui)._guildBattleBG):SetShow(false)
end

FGlobal_GuildBattle_Close = function()
  -- function num : 0_13
  PaGlobal_GuildBattle:Close()
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.IsShow = function(self)
  -- function num : 0_14
  return ((self._ui)._guildBattleBG):GetShow()
end

FGlobal_GuildBattle_IsOpen = function()
  -- function num : 0_15
  return PaGlobal_GuildBattle:IsShow()
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.UpdateRemainTime = function(self)
  -- function num : 0_16
  local remainTime = ToClient_GuildBattle_GetRemainTime()
  local remainTimeOriginal = ToClient_GuildBattle_GetRemainTimeOriginal()
  if remainTime < 0 then
    remainTime = 0
  end
  local min = (math.floor)(remainTime / 60)
  local sec = (math.floor)(remainTime % 60)
  ;
  (((self._ui)._joinProgressTimer)._timeText):SetText(tostring(min) .. tostring(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE")) .. tostring(sec) .. tostring(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")))
  ;
  (((self._ui)._joinProgressTimer)._progressBar):SetProgressRate(remainTime * 100 / remainTimeOriginal)
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Reservation = function(self)
  -- function num : 0_17
  ToClient_GuildBattle_ReserveGuildBattle(self._battingPrice)
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Reservation_Cancel = function(self)
  -- function num : 0_18
  ToClient_GuildBattle_CancelGuildBattle()
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Join = function(self)
  -- function num : 0_19
  if ToClient_isPersonalBattle() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_CANNOT_GUILDBATTLE_SERVER"))
    return 
  end
  ToClient_GuildBattle_JoinGuildBattle()
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.UnJoin = function(self)
  -- function num : 0_20
  ToClient_GuildBattle_UnjoinGuildBattle()
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Start = function(self)
  -- function num : 0_21
  ToClient_GuildBattle_StartGuildBattle()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_WE_ARE_READY_SHORT"))
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.UseFreeCam = function(self)
  -- function num : 0_22
  ToClient_GuildBattle_SetFreeCamMode()
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetPrice = function(self)
  -- function num : 0_23
  local setEditText = function(inputNumber)
    -- function num : 0_23_0 , upvalues : self
    ((self._ui)._edit_PriceInput):SetText(makeDotMoney(inputNumber))
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

    self._battingPrice = Int64toInt32(inputNumber)
  end

  local myGuildInfo = ToClient_GuildBattle_GetMyGuildInfoWrapper()
  local getGuildMoney = myGuildInfo:getGuildBusinessFunds_s64()
  Panel_NumberPad_Show(true, getGuildMoney, 0, setEditText)
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.GetTitle = function(self)
  -- function num : 0_24
  if ToClient_isPersonalBattle() == true then
    return PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE")
  else
    return PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE")
  end
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.registMessageHandler = function(self)
  -- function num : 0_25
  ((self._ui)._btn_Reservation):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:Reservation()")
  ;
  ((self._ui)._btn_Cancle):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:Reservation_Cancel()")
  ;
  ((self._ui)._btn_Join):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:Join()")
  ;
  ((self._ui)._btn_UnJoin):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:UnJoin()")
  ;
  ((self._ui)._btn_Start):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:Start()")
  ;
  ((self._ui)._edit_PriceInput):addInputEvent("Mouse_LUp", "PaGlobal_GuildBattle:SetPrice()")
end

FromClient_ReserveGuildBattleSuccess = function(cancel)
  -- function num : 0_26
  PaGlobal_GuildBattle:SetProgressServer(cancel)
  ToClient_GuildBattle_UpdateGuildBattleInfo()
end

FromClient_responseRequestGuildBattleInfo = function()
  -- function num : 0_27
  PaGlobal_GuildBattle:UpdateGuildBattleInfo()
end

FromClient_notifyGuildBattleJoin = function()
  -- function num : 0_28
  PaGlobal_GuildBattle:notifyJoinGuildBattle()
end

FromClient_guildBattleModeChangeRequest = function(mode)
  -- function num : 0_29
  PaGlobal_GuildBattle:ModeChangeRequest(mode)
end

FromClient_cancelAnotherGuild = function(cancel)
  -- function num : 0_30
  if cancel == true then
    ToClient_GuildBattle_UpdateGuildBattleInfo()
  end
end

FromClient_luaLoadComplete_GuildBattleWindow = function()
  -- function num : 0_31
  Panel_Window_GuildBattle:SetShow(false)
  Panel_Window_GuildBattle:setGlassBackground(true)
  Panel_Window_GuildBattle:ActiveMouseEventEffect(true)
  PaGlobal_GuildBattle:registMessageHandler()
  PaGlobal_GuildBattle:Initialize()
  ToClient_GuildBattle_UpdateGuildBattleInfo()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_GuildBattleWindow")
registerEvent("FromClient_notifyGuildBattleJoin", "FromClient_notifyGuildBattleJoin")
registerEvent("FromClient_responseRequestGuildBattleInfo", "FromClient_responseRequestGuildBattleInfo")
registerEvent("FromClient_ReserveGuildBattleSuccess", "FromClient_ReserveGuildBattleSuccess")
registerEvent("FromClient_guildBattleModeChangeRequest", "FromClient_guildBattleModeChangeRequest")
registerEvent("FromClient_cancelAnotherGuild", "FromClient_cancelAnotherGuild")
guildbattleStop = function(isstop)
  -- function num : 0_32
  ToClient_GuildBattle_RequestGuildBattleStop(isstop)
end


