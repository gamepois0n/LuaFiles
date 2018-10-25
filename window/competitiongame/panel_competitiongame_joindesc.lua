local UI_TM = CppEnums.TextMode
local UI_VT = CppEnums.VillageSiegeType
local isContentsArsha = ToClient_IsContentsGroupOpen("227")
local isCanDoReservation = ToClient_IsCanDoReservationArsha()
local reservationSlotArr = {}
Panel_CompetitionGame_JoinDesc:SetShow(false)
local competitionGameJoinDesc = {
  btn_CloseX = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "Button_Close"),
  descBG = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "Static_AllBG"),
  btn_Join = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "Button_Join"),
  btn_ObserverJoin = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "Button_ObserverJoin"),
  btn_Refresh = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "Button_Refresh"),
  frame_Desc = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "Frame_Desc")
}
local reservationSlot = {
  _slot_BG = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "Static_DayControlBg"),
  _slot_txt_DayOfWeek = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "StaticText_DayOfWeek"),
  _slot_txt_Date = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "StaticText_Date"),
  _slot_txt_GuildName = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "StaticText_ReserveGuildName"),
  _slot_btn_Reserve = UI.getChildControl(Panel_CompetitionGame_JoinDesc, "Button_Reserve")
}
local dayOfWeekString = {
  [UI_VT.eVillageSiegeType_Sunday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_SUNDAY"),
  [UI_VT.eVillageSiegeType_Monday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_MONDAY"),
  [UI_VT.eVillageSiegeType_Tuesday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_TUESDAY"),
  [UI_VT.eVillageSiegeType_Wednesday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_WEDNESDAY"),
  [UI_VT.eVillageSiegeType_Thursday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_THURSDAY"),
  [UI_VT.eVillageSiegeType_Friday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_FRIDAY"),
  [UI_VT.eVillageSiegeType_Saturday] = PAGetString(Defines.StringSheet_GAME, "LUA_DAYOFWEEK_SATURDAY")
}
function Panel_CompetitionGame_JoinDesc_Init()
  local self = competitionGameJoinDesc
  self.frame_content = UI.getChildControl(self.frame_Desc, "Frame_1_Content")
  self.frame_Scroll = UI.getChildControl(self.frame_Desc, "Frame_1_VerticalScroll")
  self.txt_Desc = UI.getChildControl(self.frame_content, "StaticText_Desc")
  self.txt_Desc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  self.txt_Desc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_ESCMENUDESC"))
  self.frame_content:SetSize(self.frame_content:GetSizeX(), self.txt_Desc:GetTextSizeY() + 10)
  local resizeTextY = self.txt_Desc:GetTextSizeY() + self.btn_Join:GetSizeY()
  for Index = 0, 6 do
    reservationSlotArr[Index] = {}
    local temp = {}
    temp._slot_BG = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, Panel_CompetitionGame_JoinDesc, "CompetitionReservation_SlotBg_" .. Index)
    CopyBaseProperty(reservationSlot._slot_BG, temp._slot_BG)
    temp._slot_BG:SetPosY(98 + (reservationSlot._slot_BG:GetSizeY() + 5) * Index)
    temp._slot_txt_DayOfWeek = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATICTEXT, temp._slot_BG, "CompetitionReservation_SlotDayOfWeek_" .. Index)
    CopyBaseProperty(reservationSlot._slot_txt_DayOfWeek, temp._slot_txt_DayOfWeek)
    temp._slot_txt_DayOfWeek:SetText("")
    temp._slot_txt_DayOfWeek:SetPosX(50)
    temp._slot_txt_DayOfWeek:SetPosY(10)
    temp._slot_txt_Date = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATICTEXT, temp._slot_BG, "CompetitionReservation_SlotDate_" .. Index)
    CopyBaseProperty(reservationSlot._slot_txt_Date, temp._slot_txt_Date)
    temp._slot_txt_Date:SetText("")
    temp._slot_txt_Date:SetPosX(130)
    temp._slot_txt_Date:SetPosY(10)
    temp._slot_txt_GuildName = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATICTEXT, temp._slot_BG, "CompetitionReservation_SlotGuildName_" .. Index)
    CopyBaseProperty(reservationSlot._slot_txt_GuildName, temp._slot_txt_GuildName)
    temp._slot_txt_GuildName:SetText("")
    temp._slot_txt_GuildName:SetPosX(250)
    temp._slot_txt_GuildName:SetPosY(10)
    temp._slot_btn_Reserve = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_BUTTON, temp._slot_BG, "CompetitionReservation_SlotReserveBtn_" .. Index)
    CopyBaseProperty(reservationSlot._slot_btn_Reserve, temp._slot_btn_Reserve)
    temp._slot_btn_Reserve:SetPosX(490)
    temp._slot_btn_Reserve:SetPosY(5)
    temp._slot_btn_Reserve:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
    reservationSlotArr[Index] = temp
  end
  for _, control in pairs(reservationSlot) do
    control:SetShow(false)
  end
  self.btn_Join:ComputePos()
  self.btn_ObserverJoin:ComputePos()
  self.btn_Refresh:ComputePos()
  self:registEventHandler()
end
function competitionGameJoinDesc:registEventHandler()
  local self = competitionGameJoinDesc
  self.btn_CloseX:addInputEvent("Mouse_LUp", "PaGlobalFunc_CompetitionGame_JoinDesc_Close()")
  self.btn_Refresh:addInputEvent("Mouse_LUp", "FGlobal_RefreshReservationInfo()")
  for index = 0, #reservationSlotArr do
    if reservationSlotArr[index] ~= nil then
      local value = index
      reservationSlotArr[index]._slot_btn_Reserve:addInputEvent("Mouse_LUp", "FGlobal_Panel_CompetitionGame_ReservationArsha(" .. value .. ")")
    else
      _PA_LOG("\236\160\149\237\131\156\234\179\164", "\236\151\172\234\184\176\235\165\188 \235\147\164\236\150\180\236\152\164\235\169\180 \236\149\136\235\144\156\235\139\164!!!!!! \236\189\148\235\147\156 \234\178\128\236\166\157\237\149\180\236\163\188\236\132\184\236\154\148!")
    end
  end
  registerEvent("FromClient_ChangeReservationInfo", "FromClient_CompetitionJoin_HandleChangeReservationInfo")
  registerEvent("FromClient_RequestTransferHost", "FromClient_CompetitionJoin_RequestTransferHost")
  registerEvent("FromClient_ChangedHost", "FromClient_CompetitionJoin_ChangedHost")
  registerEvent("FromClient_ChangeAssistant", "FromClient_CompetitionJoin_ChangeAssistant")
end
function PaGlobalFunc_CompetitionGame_JoinDesc_Open()
  local self = competitionGameJoinDesc
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  local isGuildLeader = isGuildMaster or isGuildSubMaster
  audioPostEvent_SystemUi(1, 18)
  _AudioPostEvent_SystemUiForXBOX(1, 18)
  Panel_CompetitionGame_JoinDesc:SetShow(true)
  if true == isContentsArsha and true == isCanDoReservation then
    FGlobal_RefreshReservationInfo()
  end
end
function FGlobal_RefreshReservationInfo()
  ToClient_RequestArshaReservationList()
end
function PaGlobalFunc_CompetitionGame_JoinDesc_Close()
  local self = competitionGameJoinDesc
  audioPostEvent_SystemUi(1, 17)
  _AudioPostEvent_SystemUiForXBOX(1, 17)
  Panel_CompetitionGame_JoinDesc:SetShow(false)
end
function FGlobal_Panel_CompetitionGame_JoinDesc_Join(isObserver)
  local selfProxy = getSelfPlayer():get()
  local inventory = selfProxy:getInventory()
  local hasItem = inventory:getItemCount_s64(ItemEnchantKey(65012, 0))
  if toInt64(0, 0) == hasItem then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_JOINDESC_HASITEM"))
    return
  end
  if ToClient_IsCompetitionHost() then
    CompetitionGame_HostIntoCompetition()
  else
    if ExpirationItemCheck(ItemEnchantKey(65012, 0)) then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_JOINDESC_HASITEM"))
      return
    end
    ToClient_RequestJoinCompetition(isObserver)
  end
end
function Panel_CompetitionGame_JoinDesc_Event()
  local self = competitionGameJoinDesc
  self.btn_Join:addInputEvent("Mouse_LUp", "FGlobal_Panel_CompetitionGame_JoinDesc_Join(false)")
  self.btn_ObserverJoin:addInputEvent("Mouse_LUp", "FGlobal_Panel_CompetitionGame_JoinDesc_Join(true)")
  self.btn_CloseX:addInputEvent("Mouse_LUp", "PaGlobalFunc_CompetitionGame_JoinDesc_Close()")
end
function FromClient_CompetitionJoin_HandleChangeReservationInfo(dayIndex, dayValue, dayOfWeekValue, reservationGuildName, guildNo, isReservation)
  local self = competitionGameJoinDesc
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  local userGuildNo
  local isMyGuild = false
  local btnText = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_RESERVATION")
  local Index = dayIndex
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  local isGuildLeader = isGuildMaster or isGuildSubMaster
  if nil ~= myGuildInfo then
    userGuildNo = myGuildInfo:getGuildNo_s64()
    isMyGuild = userGuildNo == guildNo
  end
  if Index < 0 or Index >= 7 then
    return
  end
  if isMyGuild then
    btnText = PAGetString(Defines.StringSheet_GAME, "Lua_KeyCustom_Ui_17")
  end
  reservationSlotArr[Index]._slot_txt_Date:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_DAY", "day", tostring(dayValue)))
  reservationSlotArr[Index]._slot_txt_DayOfWeek:SetText(dayOfWeekString[dayOfWeekValue])
  reservationSlotArr[Index]._slot_btn_Reserve:SetText(btnText)
  reservationSlotArr[Index]._slot_btn_Reserve:SetShow(true)
  if nil == myGuildInfo or false == isGuildMaster then
    reservationSlotArr[Index]._slot_btn_Reserve:SetShow(false)
  end
  if true == isReservation then
    reservationSlotArr[Index]._slot_txt_GuildName:SetText(reservationGuildName)
  else
    reservationSlotArr[Index]._slot_txt_GuildName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CANDORESERVATIONARSHA"))
  end
end
function FromClient_CompetitionJoin_RequestTransferHost(hostCharacterName, userNo)
  local self = competitionGameJoinDesc
  local function transferHost()
    ToClient_RequestAcceptTransferHost(userNo, true)
  end
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_TRANSFER_HOST_TO_OTHERGUILDMASTER", "characterName", hostCharacterName)
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
    content = messageBoxMemo,
    functionYes = transferHost,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function FromClient_CompetitionJoin_ChangedHost(isHostMyself)
  if true == isHostMyself then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GET_ARSHAHOST"))
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RELEASE_ARSHAHOST_DESC"))
    FGlobal_ArshaPvP_Close()
  end
end
function FromClient_CompetitionJoin_ChangeAssistant(isAssistant)
  if true == isAssistant then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_SET_TO_ASSISTANT"))
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_RELEASE_FROM_ASSISTANT"))
  end
end
function FGlobal_Panel_CompetitionGame_ReservationArsha(reservationIndex, isReservation)
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  local isGuildLeader = isGuildMaster or isGuildSubMaster
  local reservationInfo = ToClient_GetArshaReservationInfoAt(reservationIndex)
  local reservationPrice = Int64toInt32(ToClient_GetReservationPrice())
  local messageBoxMemo = ""
  local reservationGuildNo = reservationInfo:getGuildNo()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  local userGuildNo
  if nil ~= myGuildInfo then
    userGuildNo = myGuildInfo:getGuildNo_s64()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NO_GUILD"))
    return
  end
  if toInt64(0, 0) ~= reservationGuildNo and userGuildNo ~= reservationGuildNo then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoAlreadyReservationDay"))
    return
  end
  if false == isGuildMaster then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoCanDoOnlyGuildMaster"))
    return
  end
  local function requestReservation()
    ToClient_RequestCompetitionReservation(reservationIndex, isReservation)
  end
  if nil ~= reservationInfo and toInt64(0, 0) == reservationGuildNo then
    messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_DO_RESERVATION", "reservationPrice", reservationPrice)
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_CANCEL_RESERVATION")
  end
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
    content = messageBoxMemo,
    functionYes = requestReservation,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
Panel_CompetitionGame_JoinDesc_Init()
Panel_CompetitionGame_JoinDesc_Event()
