-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\pvp\pvp_battle.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_Icon_Duel:SetShow(false)
Panel_Icon_Duel:ActiveMouseEventEffect(true)
PaGlobal_PvPBattle = {_uiButtonMatchIcon = (UI.getChildControl)(Panel_Icon_Duel, "Button_DuelIcon")}
;
(PaGlobal_PvPBattle._uiButtonMatchIcon):addInputEvent("Mouse_RUp", "PaGlobal_PvPBattle:cancelMatch()")
;
(PaGlobal_PvPBattle._uiButtonMatchIcon):addInputEvent("Mouse_On", "PaGlobal_PvPBattle:DuelFunc_ShowTooltip( true )")
;
(PaGlobal_PvPBattle._uiButtonMatchIcon):addInputEvent("Mouse_Out", "PaGlobal_PvPBattle:DuelFunc_ShowTooltip()")
;
(PaGlobal_PvPBattle._uiButtonMatchIcon):ActiveMouseEventEffect(true)
local requestPlayerList = {}
local refuseName = ""
local selfPlayer = getSelfPlayer()
local selfActorKeyRaw = (selfPlayer:getActorKey())
local isPlaying, isPartyMember, isPartyLeader = nil, nil, nil
-- DECOMPILER ERROR at PC56: Confused about usage of register: R11 in 'UnsetPending'

PaGlobal_PvPBattle.initialize = function(self)
  -- function num : 0_0
  registerEvent("FromClient_AskPvPBattle", "PvPBattle_AskPvPBattle")
  registerEvent("FromClient_ReceiveStartPvPBattle", "PvPBattle_ReceiveStart")
  registerEvent("FromClient_ReceiveEndPvPBattle", "PvPBattle_ReceiveEnd")
  registerEvent("FromClient_AskAcceptPvPBattle", "PvPBattle_AskAcceptPvPBattle")
  registerEvent("FromClient_AskPvPIntrusion", "PvPBattle_AskPvPIntrusion")
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R11 in 'UnsetPending'

PaGlobal_PvPBattle.setPosMatchIcon = function(self)
  -- function num : 0_1 , upvalues : isPlaying, selfPlayer
  if isFlushedUI() then
    return 
  end
  isPlaying = selfPlayer:isDefinedPvPMatch()
  if isPlaying then
    Panel_Icon_Duel:SetShow(true)
    local posX, posY = nil, nil
    if Panel_Icon_Maid:GetShow() then
      posX = Panel_Icon_Maid:GetPosX() + Panel_Icon_Maid:GetSizeX() - 3
      posY = Panel_Icon_Maid:GetPosY()
    else
      if Panel_Window_PetIcon:GetShow() then
        posX = Panel_Window_PetIcon:GetPosX() + Panel_Window_PetIcon:GetSizeX() - 3
        posY = Panel_Window_PetIcon:GetPosY()
      else
        if FGlobal_HouseIconCount() > 0 and Panel_MyHouseNavi:GetShow() then
          posX = Panel_MyHouseNavi:GetPosX() + 60 * FGlobal_HouseIconCount() - 3
          posY = Panel_MyHouseNavi:GetPosY()
        else
          if FGlobal_ServantIconCount() > 0 and Panel_Window_Servant:GetShow() then
            posX = Panel_Window_Servant:GetPosX() + 60 * FGlobal_ServantIconCount() - 3
            posY = Panel_Window_Servant:GetPosY()
          else
            posX = 0
            posY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
          end
        end
      end
    end
    Panel_Icon_Duel:SetPosX(posX)
    Panel_Icon_Duel:SetPosY(posY)
  else
    do
      Panel_Icon_Duel:SetShow(false)
      PaGlobal_Camp:setPos()
    end
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R11 in 'UnsetPending'

PaGlobal_PvPBattle.DuelFunc_ShowTooltip = function(self, isShow)
  -- function num : 0_2
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_ICON_DUEL_SHOWTOOLTIP_NAME")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_ICON_DUEL_SHOWTOOLTIP_DESC")
  TooltipSimple_Show(PaGlobal_PvPBattle._uiButtonMatchIcon, name, desc)
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R11 in 'UnsetPending'

PaGlobal_PvPBattle.duelInfo_Open = function(self)
  -- function num : 0_3
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R11 in 'UnsetPending'

PaGlobal_PvPBattle.notifyRequest = function(self, targetCharacterName)
  -- function num : 0_4
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PVPBATTLE_ACK_MSG_REQUEST", "characterName", targetCharacterName))
end

PvPBattle_AskPvPIntrusion = function(targetNmae)
  -- function num : 0_5
  local secondYesButton = function()
    -- function num : 0_5_0
    ToClient_PvPIntrusionSelectTeam(true)
  end

  local secondNoButton = function()
    -- function num : 0_5_1
    ToClient_PvPIntrusionSelectTeam(false)
  end

  local askYesButton = function()
    -- function num : 0_5_2 , upvalues : targetNmae, secondYesButton, secondNoButton
    local secmessageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PVPBATTLE_TEAMSEL_MESSAGEBOX_MEMO", "characterName", targetNmae)
    local secmessageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_REQUEST_MESSAGEBOX_TITLE"), content = secmessageBoxMemo, functionYes = secondYesButton, functionNo = secondNoButton, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(secmessageBoxData)
  end

  local askNoButton = function()
    -- function num : 0_5_3
  end

  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PVPBATTLE_INSTRUSION_MESSAGEBOX_MEMO", "characterName", targetNmae)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_REQUEST_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = askYesButton, functionNo = askNoButton, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PvPBattle_AskPvPBattle = function(requesterName, fromInstrusion, wantTeam)
  -- function num : 0_6 , upvalues : requestPlayerList, refuseName
  for ii = 0, #requestPlayerList do
    if requesterName == requestPlayerList[ii] then
      return 
    end
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R3 in 'UnsetPending'

  requestPlayerList[#requestPlayerList] = requesterName
  refuseName = requesterName
  local askYesButton = function()
    -- function num : 0_6_0 , upvalues : wantTeam, requestPlayerList
    ToClient_AcceptPvPBattle(true, wantTeam)
    requestPlayerList = {}
  end

  local askNoButton = function()
    -- function num : 0_6_1 , upvalues : requestPlayerList, refuseName
    ToClient_AcceptPvPBattle(false)
    for ii = 0, #requestPlayerList do
      -- DECOMPILER ERROR at PC14: Confused about usage of register: R4 in 'UnsetPending'

      if refuseName == requestPlayerList[ii] then
        requestPlayerList[ii] = ""
      end
    end
  end

  if fromInstrusion == true then
    local teammessageBoxMemo = nil
    if wantTeam == true then
      teammessageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PVPBATTLE_WANTTEAM_MESSAGEBOX_MEMO", "characterName", requesterName)
    else
      teammessageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PVPBATTLE_NOTWANTTEAM_MESSAGEBOX_MEMO", "characterName", requesterName)
    end
    local teammessageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_REQUEST_MESSAGEBOX_TITLE"), content = teammessageBoxMemo, functionYes = askYesButton, functionNo = askNoButton, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(teammessageBoxData)
  else
    do
      local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PVPBATTLE_REQUEST_MESSAGEBOX_MEMO", "characterName", requesterName)
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_REQUEST_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = askYesButton, functionNo = askNoButton, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  end
end

PvPBattle_AskAcceptPvPBattle = function(isAutoCancle)
  -- function num : 0_7
  local messageBoxMemo = nil
  if isAutoCancle then
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_NOTIFY_PVP_REFUSE")
  else
    messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_NOTIFY_PVP_CANCLE")
  end
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_REQUEST_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R11 in 'UnsetPending'

PaGlobal_PvPBattle.cancelMatch = function(self)
  -- function num : 0_8 , upvalues : isPartyMember, selfPlayer, selfActorKeyRaw, isPartyLeader
  isPartyMember = selfPlayer:isPartyMemberActorKey(selfActorKeyRaw)
  isPartyLeader = selfPlayer:isPartyLeader(selfActorKeyRaw)
  if isPartyMember == true and isPartyLeader == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_ACK_MSG_CANCELLEADERONLY"))
    return 
  end
  local cancelYesButton = function()
    -- function num : 0_8_0
    ToClient_CancelPvpBattle()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_CANCEL_MESSAGEBOX_MEMO")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_CANCEL_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = cancelYesButton, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

PvPBattle_ReceiveStart = function(matchType, roundId, isFight)
  -- function num : 0_9 , upvalues : isPlaying
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_ACK_MSG_START"))
  isPlaying = true
  PaGlobal_PvPBattle:setPosMatchIcon()
end

PvPBattle_ReceiveEnd = function(matchType, roundId, isFight)
  -- function num : 0_10 , upvalues : isPlaying
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_ACK_MSG_END"))
  isPlaying = false
  PaGlobal_PvPBattle:setPosMatchIcon()
end

PaGlobal_PvPBattle:initialize()

