-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\competitiongame\panel_competitiongame_guildreservation.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_VT = CppEnums.VillageSiegeType
local reservationSlotArr = {}
local isContentsArsha = ToClient_IsContentsGroupOpen("227")
local isCanDoReservation = ToClient_IsCanDoReservationArsha()
Panel_CompetitionGame_GuildReservation:SetShow(false)
local competitionGuildReservation = {_txt_Title = (UI.getChildControl)(Panel_CompetitionGame_GuildReservation, "StaticText_Title"), _btn_CloseX = (UI.getChildControl)(Panel_CompetitionGame_GuildReservation, "Button_Close"), _btn_Question = (UI.getChildControl)(Panel_CompetitionGame_GuildReservation, "Button_Question"), _btn_Refresh = (UI.getChildControl)(Panel_CompetitionGame_GuildReservation, "Button_Refresh")}
local reservationSlot = {_slot_BG = (UI.getChildControl)(Panel_CompetitionGame_GuildReservation, "Static_DayControlBg"), _slot_txt_DayOfWeek = (UI.getChildControl)(Panel_CompetitionGame_GuildReservation, "StaticText_DayOfWeek"), _slot_txt_Date = (UI.getChildControl)(Panel_CompetitionGame_GuildReservation, "StaticText_Date"), _slot_txt_GuildName = (UI.getChildControl)(Panel_CompetitionGame_GuildReservation, "StaticText_ReserveGuildName"), _slot_btn_Reserve = (UI.getChildControl)(Panel_CompetitionGame_GuildReservation, "Button_Reserve")}
local dayOfWeekString = {[UI_VT.eVillageSiegeType_Sunday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_SUNDAY"), [UI_VT.eVillageSiegeType_Monday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_MONDAY"), [UI_VT.eVillageSiegeType_Tuesday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_TUESDAY"), [UI_VT.eVillageSiegeType_Wednesday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_WEDNESDAY"), [UI_VT.eVillageSiegeType_Thursday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_THURSDAY"), [UI_VT.eVillageSiegeType_Friday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_FRIDAY"), [UI_VT.eVillageSiegeType_Saturday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_SATURDAY")}
Panel_CompetitionGame_GuildReservation_Init = function()
  -- function num : 0_0 , upvalues : competitionGuildReservation, reservationSlotArr, reservationSlot
  local self = competitionGuildReservation
  for Index = 0, 6 do
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R5 in 'UnsetPending'

    reservationSlotArr[Index] = {}
    local temp = {}
    temp._slot_BG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CompetitionGame_GuildReservation, "CompetitionReservation_SlotBg_" .. Index)
    CopyBaseProperty(reservationSlot._slot_BG, temp._slot_BG)
    ;
    (temp._slot_BG):SetPosY(47 + ((reservationSlot._slot_BG):GetSizeY() + 5) * Index)
    temp._slot_txt_DayOfWeek = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._slot_BG, "CompetitionReservation_SlotDayOfWeek_" .. Index)
    CopyBaseProperty(reservationSlot._slot_txt_DayOfWeek, temp._slot_txt_DayOfWeek)
    ;
    (temp._slot_txt_DayOfWeek):SetText("")
    ;
    (temp._slot_txt_DayOfWeek):SetPosX(10)
    ;
    (temp._slot_txt_DayOfWeek):SetPosY(6)
    temp._slot_txt_Date = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._slot_BG, "CompetitionReservation_SlotDate_" .. Index)
    CopyBaseProperty(reservationSlot._slot_txt_Date, temp._slot_txt_Date)
    ;
    (temp._slot_txt_Date):SetPosX(26)
    ;
    (temp._slot_txt_Date):SetPosY(8)
    temp._slot_txt_GuildName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._slot_BG, "CompetitionReservation_SlotGuildName_" .. Index)
    CopyBaseProperty(reservationSlot._slot_txt_GuildName, temp._slot_txt_GuildName)
    ;
    (temp._slot_txt_GuildName):SetPosX(90)
    ;
    (temp._slot_txt_GuildName):SetPosY(8)
    temp._slot_btn_Reserve = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, temp._slot_BG, "CompetitionReservation_SlotReserveBtn_" .. Index)
    CopyBaseProperty(reservationSlot._slot_btn_Reserve, temp._slot_btn_Reserve)
    ;
    (temp._slot_btn_Reserve):SetPosX(325)
    ;
    (temp._slot_btn_Reserve):SetPosY(4)
    -- DECOMPILER ERROR at PC136: Confused about usage of register: R6 in 'UnsetPending'

    reservationSlotArr[Index] = temp
  end
  for _,control in pairs(reservationSlot) do
    control:SetShow(false)
  end
  ;
  (self._txt_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_RESERVATION_ARSHA_TITLE"))
  ;
  (self._btn_Refresh):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_WINDOW_DELIVERY_INFORMATION_BTN_REFRESH"))
end

FGlobal_Panel_CompetitionGame_GuildReservation_Open = function()
  -- function num : 0_1 , upvalues : isContentsArsha, isCanDoReservation, competitionGuildReservation
  if isContentsArsha == false or isCanDoReservation == false then
    return 
  end
  local self = competitionGuildReservation
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  local isGuildLeader = isGuildMaster or isGuildSubMaster
  FGlobal_RefreshReservationInfo()
  Panel_CompetitionGame_GuildReservation:SetShow(true)
end

FGlobal_Panel_CompetitionGame_GuildReservation_Close = function()
  -- function num : 0_2 , upvalues : competitionGuildReservation
  local self = competitionGuildReservation
  Panel_CompetitionGame_GuildReservation:SetShow(false)
end

FGlobal_Panel_CompetitionGame_ReservationArsha = function(reservationIndex, isReservation)
  -- function num : 0_3
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  local isGuildLeader = isGuildMaster or isGuildSubMaster
  local reservationInfo = ToClient_GetArshaReservationInfoAt(reservationIndex)
  local reservationPrice = Int64toInt32(ToClient_GetReservationPrice())
  local messageBoxMemo = ""
  local reservationGuildNo = reservationInfo:getGuildNo()
  local myGuildInfo = (ToClient_GetMyGuildInfoWrapper())
  local userGuildNo = nil
  if myGuildInfo ~= nil then
    userGuildNo = myGuildInfo:getGuildNo_s64()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NO_GUILD"))
    return 
  end
  if toInt64(0, 0) ~= reservationGuildNo and userGuildNo ~= reservationGuildNo then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoAlreadyReservationDay"))
    return 
  end
  if isGuildMaster == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoCanDoOnlyGuildMaster"))
    return 
  end
  local requestReservation = function()
    -- function num : 0_3_0 , upvalues : reservationIndex, isReservation
    ToClient_RequestCompetitionReservation(reservationIndex, isReservation)
  end

  if reservationInfo ~= nil and toInt64(0, 0) == reservationGuildNo then
    messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_DO_RESERVATION", "reservationPrice", reservationPrice)
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_CANCEL_RESERVATION")
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = requestReservation, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_RefreshReservationInfo = function()
  -- function num : 0_4
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  _PA_LOG("LUA_COMPETITION", "ToClient_RequestArshaReservationList 호출")
  ToClient_RequestArshaReservationList()
end

HandleChangeReservationInfo = function(dayIndex, dayValue, dayOfWeekValue, reservationGuildName, guildNo, isReservation)
  -- function num : 0_5 , upvalues : competitionGuildReservation, reservationSlotArr, dayOfWeekString
  local self = competitionGuildReservation
  local myGuildInfo = (ToClient_GetMyGuildInfoWrapper())
  local userGuildNo = nil
  local isMyGuild = false
  local btnText = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_RESERVATION")
  local Index = dayIndex
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  do
    local isGuildLeader = isGuildMaster or isGuildSubMaster
    if myGuildInfo ~= nil then
      userGuildNo = myGuildInfo:getGuildNo_s64()
      isMyGuild = userGuildNo == guildNo
    end
    if Index < 0 or Index >= 7 then
      return 
    end
    if isMyGuild then
      btnText = PAGetString(Defines.StringSheet_GAME, "Lua_KeyCustom_Ui_17")
    end
    ;
    ((reservationSlotArr[Index])._slot_txt_Date):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_DAY", "day", tostring(dayValue)))
    ;
    ((reservationSlotArr[Index])._slot_txt_DayOfWeek):SetText(dayOfWeekString[dayOfWeekValue])
    ;
    ((reservationSlotArr[Index])._slot_btn_Reserve):SetText(btnText)
    ;
    ((reservationSlotArr[Index])._slot_btn_Reserve):SetShow(true)
    if myGuildInfo == nil or isGuildMaster == false then
      ((reservationSlotArr[Index])._slot_btn_Reserve):SetShow(false)
    end
    if isReservation == true then
      ((reservationSlotArr[Index])._slot_txt_GuildName):SetText(reservationGuildName)
    else
      ((reservationSlotArr[Index])._slot_txt_GuildName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CANDORESERVATIONARSHA"))
    end
    -- DECOMPILER ERROR: 9 unprocessed JMP targets
  end
end

FromClient_RequestTransferHost = function(hostCharacterName, userNo)
  -- function num : 0_6 , upvalues : competitionGuildReservation
  local self = competitionGuildReservation
  local transferHost = function()
    -- function num : 0_6_0 , upvalues : userNo
    ToClient_RequestAcceptTransferHost(userNo, true)
  end

  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_TRANSFER_HOST_TO_OTHERGUILDMASTER", "characterName", hostCharacterName)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = transferHost, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FromClient_ChangedHost = function(isHostMyself)
  -- function num : 0_7
  if isHostMyself == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GET_ARSHAHOST"))
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RELEASE_ARSHAHOST_DESC"))
    FGlobal_ArshaPvP_Close()
  end
end

FromClient_ChangeAssistant = function(isAssistant)
  -- function num : 0_8
  if isAssistant == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_SET_TO_ASSISTANT"))
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_RELEASE_FROM_ASSISTANT"))
  end
end

Panel_CompetitionGame_GuildReservation_Event = function()
  -- function num : 0_9 , upvalues : competitionGuildReservation, reservationSlotArr
  local self = competitionGuildReservation
  ;
  (self._btn_CloseX):addInputEvent("Mouse_LUp", "FGlobal_Panel_CompetitionGame_GuildReservation_Close()")
  ;
  (self._btn_Refresh):addInputEvent("Mouse_LUp", "FGlobal_RefreshReservationInfo()")
  for index = 0, #reservationSlotArr do
    if reservationSlotArr[index] ~= nil then
      local value = index
      _PA_LOG("COMPETITION_LUA", "RESERVATION_ARSHA_VALUE" .. tostring(value))
      ;
      ((reservationSlotArr[index])._slot_btn_Reserve):addInputEvent("Mouse_LUp", "FGlobal_Panel_CompetitionGame_ReservationArsha(" .. value .. ")")
    else
      do
        do
          _PA_LOG("COMPETITION_LUA", "RESERVATION_ARSHA" .. tostring(index))
          -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC48: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  registerEvent("FromClient_ChangeReservationInfo", "HandleChangeReservationInfo")
  registerEvent("FromClient_RequestTransferHost", "FromClient_RequestTransferHost")
  registerEvent("FromClient_ChangedHost", "FromClient_ChangedHost")
  registerEvent("FromClient_ChangeAssistant", "FromClient_ChangeAssistant")
end

Panel_CompetitionGame_GuildReservation_Init()
Panel_CompetitionGame_GuildReservation_Event()

