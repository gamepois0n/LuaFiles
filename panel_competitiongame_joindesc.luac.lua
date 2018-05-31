-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\competitiongame\panel_competitiongame_joindesc.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local isContentsArsha = ToClient_IsContentsGroupOpen("227")
local isCanDoReservation = ToClient_IsCanDoReservationArsha()
Panel_CompetitionGame_JoinDesc:SetShow(false)
local competitionGameJoinDesc = {btn_CloseX = (UI.getChildControl)(Panel_CompetitionGame_JoinDesc, "Button_Close"), descBG = (UI.getChildControl)(Panel_CompetitionGame_JoinDesc, "Static_AllBG"), btn_Join = (UI.getChildControl)(Panel_CompetitionGame_JoinDesc, "Button_Join"), btn_ObserverJoin = (UI.getChildControl)(Panel_CompetitionGame_JoinDesc, "Button_ObserverJoin"), txt_Desc = (UI.getChildControl)(Panel_CompetitionGame_JoinDesc, "StaticText_Desc")}
Panel_CompetitionGame_JoinDesc_Init = function()
  -- function num : 0_0 , upvalues : competitionGameJoinDesc, UI_TM
  local self = competitionGameJoinDesc
  ;
  (self.txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.txt_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONGAME_ESCMENUDESC"))
  local resizeTextY = (self.txt_Desc):GetTextSizeY() + (self.btn_Join):GetSizeY()
  Panel_CompetitionGame_JoinDesc:SetSize(Panel_CompetitionGame_JoinDesc:GetSizeX(), resizeTextY + 110)
  ;
  (self.descBG):SetSize((self.descBG):GetSizeX(), resizeTextY + 5)
  ;
  (self.btn_Join):ComputePos()
  ;
  (self.btn_ObserverJoin):ComputePos()
end

FGlobal_Panel_CompetitionGame_JoinDesc_Open = function()
  -- function num : 0_1 , upvalues : competitionGameJoinDesc, isContentsArsha, isCanDoReservation
  local self = competitionGameJoinDesc
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  local isGuildLeader = isGuildMaster or isGuildSubMaster
  audioPostEvent_SystemUi(1, 18)
  Panel_CompetitionGame_JoinDesc:SetShow(true)
  if isContentsArsha == true and isCanDoReservation == true then
    FGlobal_Panel_CompetitionGame_GuildReservation_Open()
  end
end

FGlobal_Panel_CompetitionGame_JoinDesc_Close = function()
  -- function num : 0_2 , upvalues : competitionGameJoinDesc
  local self = competitionGameJoinDesc
  audioPostEvent_SystemUi(1, 17)
  Panel_CompetitionGame_JoinDesc:SetShow(false)
end

FGlobal_Panel_CompetitionGame_JoinDesc_Join = function(isObserver)
  -- function num : 0_3
  local selfProxy = (getSelfPlayer()):get()
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

Panel_CompetitionGame_JoinDesc_Event = function()
  -- function num : 0_4 , upvalues : competitionGameJoinDesc
  local self = competitionGameJoinDesc
  ;
  (self.btn_Join):addInputEvent("Mouse_LUp", "FGlobal_Panel_CompetitionGame_JoinDesc_Join(false)")
  ;
  (self.btn_ObserverJoin):addInputEvent("Mouse_LUp", "FGlobal_Panel_CompetitionGame_JoinDesc_Join(true)")
  ;
  (self.btn_CloseX):addInputEvent("Mouse_LUp", "FGlobal_Panel_CompetitionGame_JoinDesc_Close()")
end

Panel_CompetitionGame_JoinDesc_Init()
Panel_CompetitionGame_JoinDesc_Event()

