-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_window_guildbattle.luac 

-- params : ...
-- function num : 0
Panel_Window_GuildBattle:SetShow(false)
Panel_Window_GuildBattle:setGlassBackground(true)
Panel_Window_GuildBattle:ActiveMouseEventEffect(true)
PaGlobal_GuildBattle = {
_ui = {_guildBattleBG = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_GuildBattleBG"), _backgroundMainBG = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_TopBack"), _btn_Reservation = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Reservation"), _btn_Cancle = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_ReservationCancel"), _btn_Join = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Join"), _btn_UnJoin = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_UnJoin"), _btn_Start = (UI.getChildControl)(Panel_Window_GuildBattle, "Button_Start"), _txt_progress = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_Text_Progress"), _txt_progressGlow = (UI.getChildControl)(Panel_Window_GuildBattle, "StaticText_ProgressGlow"), _notJoinText = (UI.getChildControl)(Panel_Window_GuildBattle, "StaticText_NoGuild"), 
_joinBothGuild = {}
, 
_joinProgressTimer = {}
, _midBattleMark = (UI.getChildControl)(Panel_Window_GuildBattle, "Static_CenterMark"), _txt_BottomDesc = (UI.getChildControl)(Panel_Window_GuildBattle, "StaticText_BottomDesc"), 
_guildAinfo = {}
, _edit_PriceInput = (UI.getChildControl)(Panel_Window_GuildBattle, "Edit_PriceInput")}
, _battingPrice = 0, _CanCancel = true}
-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

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
  bothjoined._guildBNameMark = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildNameRight")
  bothjoined._guildBMaster = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildMasterNameValueRight")
  bothjoined._guildBranking = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildRankValueRight")
  bothjoined._guildBrating = (UI.getChildControl)(bothjoined._bg, "StaticText_WaitBothGuildPointValueRight")
  bothjoined._CompleteBG = (UI.getChildControl)(bothjoined._bg, "Static_JoinCompleteBothGuildCenterBG")
  -- DECOMPILER ERROR at PC122: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui)._joinBothGuild = bothjoined
  ;
  ((self._ui)._txt_BottomDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._txt_BottomDesc):setPadding((CppEnums.Padding).ePadding_Left, 10)
  ;
  ((self._ui)._txt_BottomDesc):setPadding((CppEnums.Padding).ePadding_Right, 10)
  ;
  ((self._ui)._txt_BottomDesc):setPadding((CppEnums.Padding).ePadding_Top, 10)
  ;
  ((self._ui)._txt_BottomDesc):setPadding((CppEnums.Padding).ePadding_Bottom, 10)
  ;
  ((self._ui)._txt_BottomDesc):SetText("길드 결전�\128 <PAColor0xFF00C0D7>현재 서버 기준<PAOldColor>으로 예약되며 길드 <PAColor0xFF00C0D7>�\128�\165, �\128�\128장이 예약<PAOldColor>�\160 �\152 있습니다.\n길드 결전 화면에서 <PAColor0xFF00C0D7>경기장으�\156 입장<PAOldColor>하여 진행�\160 �\152 있습니다.\n<PAColor0xFF00C0D7>1경기 �\185 5�\132<PAOldColor>간의 전투 시간�\180 주어�\128�\176, <PAColor0xFF00C0D7>3�\160 2승제<PAOldColor>�\156 진행됩니�\164.\n1경기�\128 종료되면 <PAColor0xFF00C0D7>2분간�\152 �\128비시�\132<PAOldColor>�\180 주어�\128�\176, �\180 시간에는 길드원의 <PAColor0xFF00C0D7>입장 �\143 �\128활이 �\128�\165<PAOldColor>합니�\164.")
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
  ((self._ui)._backgroundMainBG):SetSize(710, 413)
  self:turnOffAllControl()
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetProgressServer = function(self, cancel)
  -- function num : 0_1
  local progressServer = ToClient_getMyGuildBattleServer()
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
      if cancel then
        return 
      end
    end
    self._CanCancel = true
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE")
    local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
    if isReserve then
      msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RESERVE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
    else
      if cancel then
        msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_CANCEL"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
      else
        msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_END"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
      end
    end
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
  end
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC113: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.GetGuildMark = function(self, guildNo, mark)
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

-- DECOMPILER ERROR at PC116: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.UpdateGuildBattleInfo = function(self)
  -- function num : 0_4
  local guildA = ToClient_getCurrentServerGuildBattleInfo(0)
  local guildB = ToClient_getCurrentServerGuildBattleInfo(1)
  local betting = ToClient_guildBattleBetting()
  if not ((getSelfPlayer()):get()):isGuildMaster() then
    local isMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  end
  local MyGuildServer = ToClient_getMyGuildBattleServer()
  local curChannelData = getCurrentChannelServerData()
  local isCurrentGuildServer = false
  local guildCount = 2
  local attendGuild = -1
  local joinNow = ToClient_getJoinGuildBattle()
  local battleState = ToClient_getGuildBattleState()
  self:turnOffAllControl()
  if MyGuildServer ~= 0 and MyGuildServer ~= curChannelData._serverNo then
    return 
  else
    if MyGuildServer == curChannelData._serverNo then
      isCurrentGuildServer = true
    end
  end
  if guildA ~= nil then
    local name = guildA:getName()
    local rating = guildA:getRating()
    local ranking = guildA:getRanking()
    local master = guildA:getMaster()
    local guildNo = guildA:getNo()
    self:GetGuildMark(guildNo, ((self._ui)._guildAinfo)._name)
    ;
    (((self._ui)._guildAinfo)._name):SetText(name)
    ;
    (((self._ui)._guildAinfo)._master):SetText(master)
    ;
    (((self._ui)._guildAinfo)._ranking):SetText(tostring(ranking) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RANKING"))
    ;
    (((self._ui)._guildAinfo)._rating):SetText(tostring(rating) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_POINT"))
    self:GetGuildMark(guildNo, ((self._ui)._joinBothGuild)._guildANameMark)
    ;
    (((self._ui)._joinBothGuild)._guildANameMark):SetText(name)
    ;
    (((self._ui)._joinBothGuild)._guildAMaster):SetText(master)
    ;
    (((self._ui)._joinBothGuild)._guildAranking):SetText(tostring(ranking) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RANKING"))
    ;
    (((self._ui)._joinBothGuild)._guildArating):SetText(tostring(rating) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_POINT"))
    attendGuild = 0
  else
    do
      guildCount = guildCount - 1
      if guildB ~= nil then
        local name = guildB:getName()
        local rating = guildB:getRating()
        local ranking = guildB:getRanking()
        local master = guildB:getMaster()
        local guildNo = guildB:getNo()
        self:GetGuildMark(guildNo, ((self._ui)._guildAinfo)._name)
        ;
        (((self._ui)._guildAinfo)._name):SetText(name)
        ;
        (((self._ui)._guildAinfo)._master):SetText(master)
        ;
        (((self._ui)._guildAinfo)._ranking):SetText(tostring(ranking) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RANKING"))
        ;
        (((self._ui)._guildAinfo)._rating):SetText(tostring(rating) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_POINT"))
        self:GetGuildMark(guildNo, ((self._ui)._joinBothGuild)._guildBNameMark)
        ;
        (((self._ui)._joinBothGuild)._guildBNameMark):SetText(name)
        ;
        (((self._ui)._joinBothGuild)._guildBMaster):SetText(master)
        ;
        (((self._ui)._joinBothGuild)._guildBranking):SetText(tostring(ranking) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RANKING"))
        ;
        (((self._ui)._joinBothGuild)._guildBrating):SetText(tostring(rating) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_POINT"))
        attendGuild = 1
      else
        do
          guildCount = guildCount - 1
          ;
          ((self._ui)._txt_BottomDesc):SetShow(true)
          ;
          ((self._ui)._backgroundMainBG):SetSize(710, 413)
          ;
          ((self._ui)._btn_Reservation):SetSpanSize(0, 250)
          if guildCount == 0 then
            ((self._ui)._notJoinText):SetShow(true)
            if isMaster then
              ((self._ui)._btn_Reservation):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_RESERVE_BUTTON"))
              ;
              ((self._ui)._btn_Reservation):SetShow(true)
            end
          else
            if guildCount == 1 then
              (((self._ui)._guildAinfo)._bg):SetShow(true)
              ;
              ((self._ui)._btn_Reservation):SetSpanSize(0, 85)
              ;
              ((self._ui)._txt_BottomDesc):SetShow(false)
              ;
              ((self._ui)._backgroundMainBG):SetSize(710, 580)
              if isMaster then
                if isCurrentGuildServer then
                  ((self._ui)._btn_Cancle):SetShow(true)
                  if ((self._ui)._btn_Join):GetShow() then
                    ((self._ui)._btn_Cancle):SetSpanSize(100, 85)
                  else
                    ;
                    ((self._ui)._btn_Cancle):SetSpanSize(0, 85)
                  end
                else
                  ;
                  ((self._ui)._btn_Reservation):SetShow(true)
                end
              end
            else
              ;
              (((self._ui)._joinBothGuild)._bg):SetShow(true)
              ;
              ((self._ui)._btn_Reservation):SetSpanSize(0, 85)
              ;
              (((self._ui)._joinBothGuild)._CompleteBG):SetShow(true)
              ;
              ((self._ui)._txt_BottomDesc):SetShow(false)
              ;
              ((self._ui)._backgroundMainBG):SetSize(710, 580)
              if isCurrentGuildServer then
                ((self._ui)._txt_progress):SetShow(true)
                ;
                ((self._ui)._txt_progressGlow):SetShow(true)
                ;
                ((self._ui)._txt_progress):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_MATCHING"))
                ;
                ((self._ui)._txt_progressGlow):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_MATCHING"))
                ;
                ((self._ui)._btn_Join):SetShow(true)
                if isMaster then
                  if ((self._ui)._btn_Join):GetShow() then
                    ((self._ui)._btn_Cancle):SetSpanSize(100, 85)
                  else
                    ;
                    ((self._ui)._btn_Cancle):SetSpanSize(0, 85)
                  end
                  ;
                  ((self._ui)._btn_Cancle):SetShow(true)
                else
                  ;
                  ((self._ui)._btn_Join):SetSpanSize(0, 85)
                end
                if battleState == 1 then
                  (((self._ui)._joinProgressTimer)._bg):SetShow(true)
                  ;
                  (((self._ui)._joinBothGuild)._CompleteBG):SetShow(false)
                end
              end
            end
          end
          if joinNow then
            ((self._ui)._btn_Join):SetShow(false)
            ;
            ((self._ui)._btn_UnJoin):SetShow(true)
            if ((self._ui)._btn_Start):GetShow() then
              ((self._ui)._btn_Start):SetSpanSize(-100, 85)
              ;
              ((self._ui)._btn_UnJoin):SetSpanSize(100, 85)
            else
              ;
              ((self._ui)._btn_UnJoin):SetSpanSize(0, 85)
            end
            ;
            ((self._ui)._btn_Cancle):SetShow(false)
          end
          if joinNow and battleState == 1 then
            (((self._ui)._joinBothGuild)._CompleteBG):SetShow(false)
            ;
            (((self._ui)._joinProgressTimer)._bg):SetShow(true)
            ;
            ((self._ui)._txt_progress):SetShow(true)
            ;
            ((self._ui)._txt_progressGlow):SetShow(true)
            ;
            ((self._ui)._txt_progress):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_STARTSOON"))
            ;
            ((self._ui)._txt_progressGlow):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_STARTSOON"))
            if isMaster then
              ((self._ui)._btn_Start):SetShow(true)
            end
          else
          end
          if (joinNow and battleState ~= 2) or not self._CanCancel then
            ((self._ui)._btn_Cancle):SetShow(false)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.changeState = function(self, guild)
  -- function num : 0_5
  local progressServer = ToClient_getMyGuildBattleServer()
  local curChannelData = getCurrentChannelServerData()
  if progressServer == 0 or progressServer ~= curChannelData._serverNo then
    return 
  end
  local state = ToClient_getGuildBattleState()
  local guildName = ""
  if guild ~= nil then
    guildName = ToClient_guild_getGuildName(guild)
  end
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_USE_GUILDWINDOW"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
  if guildName ~= "" then
    msg = {main = tostring(guildName) .. tostring(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_WINNER")), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_END"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 80)
  else
    if state == 1 then
      msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_READYSTATE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
    else
      if state == 2 then
        msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_FIGHTSTATE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE"), addMsg = ""}
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 79)
        self._CanCancel = false
      end
    end
  end
  self:UpdateGuildBattleInfo()
end

-- DECOMPILER ERROR at PC122: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.notifyJoinGuildBattle = function(self)
  -- function num : 0_6
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_USE_GUILDWINDOW"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_SET_BATTLE"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 6, 78)
end

-- DECOMPILER ERROR at PC125: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.guildBattleTimer = function(self, time, percent)
  -- function num : 0_7
  local min = (math.floor)(time / 60)
  local sec = time % 60
  if time <= 0 then
    min = 0
    sec = 0
  end
  ;
  (((self._ui)._joinProgressTimer)._timeText):SetText(tostring(min) .. tostring(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_MINUTE")) .. tostring(sec) .. tostring(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND")))
  ;
  (((self._ui)._joinProgressTimer)._progressBar):SetProgressRate(percent / 10000)
end

-- DECOMPILER ERROR at PC128: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Open = function(self)
  -- function num : 0_8
  ToClient_GuildBattleInfoUpdate()
  ;
  ((self._ui)._guildBattleBG):SetShow(true)
end

FGlobal_GuildBattle_Open = function()
  -- function num : 0_9
  PaGlobal_GuildBattle:Open()
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Close = function(self)
  -- function num : 0_10
  ((self._ui)._guildBattleBG):SetShow(false)
end

FGlobal_GuildBattle_Close = function()
  -- function num : 0_11
  PaGlobal_GuildBattle:Close()
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Reservation = function(self)
  -- function num : 0_12
  ToClient_ReserveGuildBattle(self._battingPrice)
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Reservation_Cancel = function(self)
  -- function num : 0_13
  ToClient_CancelGuildBattle()
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Join = function(self)
  -- function num : 0_14
  ToClient_JoinGuildBattle()
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.UnJoin = function(self)
  -- function num : 0_15
  ToClient_UnjoinGuildBattle()
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.Start = function(self)
  -- function num : 0_16
  ToClient_startGuildBattle()
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.SetPrice = function(self)
  -- function num : 0_17
  local setEditText = function(inputNumber)
    -- function num : 0_17_0 , upvalues : self
    ((self._ui)._edit_PriceInput):SetText(makeDotMoney(inputNumber))
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

    self._battingPrice = Int64toInt32(inputNumber)
  end

  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  local getGuildMoney = myGuildInfo:getGuildBusinessFunds_s64()
  Panel_NumberPad_Show(true, getGuildMoney, 0, setEditText)
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_GuildBattle.registMessageHandler = function(self)
  -- function num : 0_18
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
  -- function num : 0_19
  PaGlobal_GuildBattle:SetProgressServer(cancel)
  ToClient_GuildBattleInfoUpdate()
end

FromClient_responseRequestGuildBattleInfo = function()
  -- function num : 0_20
  PaGlobal_GuildBattle:UpdateGuildBattleInfo()
end

FromClient_guildBattleStateChange = function(winner)
  -- function num : 0_21
  PaGlobal_GuildBattle:changeState(winner)
end

FromClient_notifyGuildBattleJoin = function()
  -- function num : 0_22
  PaGlobal_GuildBattle:notifyJoinGuildBattle()
end

FromClient_guildBattleTimer = function(time, percent)
  -- function num : 0_23
  PaGlobal_GuildBattle:guildBattleTimer(time, percent)
end

registerEvent("FromClient_notifyGuildBattleJoin", "FromClient_notifyGuildBattleJoin")
registerEvent("FromClient_guildBattleStateChange", "FromClient_guildBattleStateChange")
registerEvent("FromClient_responseRequestGuildBattleInfo", "FromClient_responseRequestGuildBattleInfo")
registerEvent("FromClient_ReserveGuildBattleSuccess", "FromClient_ReserveGuildBattleSuccess")
registerEvent("FromClient_guildBattleTimer", "FromClient_guildBattleTimer")
PaGlobal_GuildBattle:registMessageHandler()
PaGlobal_GuildBattle:Initialize()

