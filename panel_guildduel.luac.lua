-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guildduel.luac 

-- params : ...
-- function num : 0
local CT2S = CppEnums.ClassType2String
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local IM = CppEnums.EProcessorInputMode
Panel_GuildDuel:SetShow(false)
local GuildDuel = {
ui = {_static_MainBG = (UI.getChildControl)(Panel_GuildDuel, "Static_BG"), _btn_Confirm = (UI.getChildControl)(Panel_GuildDuel, "Button_Confirm"), _btn_Cancel = (UI.getChildControl)(Panel_GuildDuel, "Button_Cancel"), _btn_Close = (UI.getChildControl)(Panel_GuildDuel, "Button_Win_Close"), _btn_Help = (UI.getChildControl)(Panel_GuildDuel, "Button_Help"), _static_GuildMarkBG = (UI.getChildControl)(Panel_GuildDuel, "Static_GuildMarkBG"), _static_GuildMark = (UI.getChildControl)(Panel_GuildDuel, "Static_GuildMark"), _txt_GuildName = (UI.getChildControl)(Panel_GuildDuel, "StaticText_GuildName"), _txt_GuildMaster = (UI.getChildControl)(Panel_GuildDuel, "StaticText_GuildMaster"), _static_NotifyBG = (UI.getChildControl)(Panel_GuildDuel, "Static_NotifyBG"), _txt_DuelNotify = (UI.getChildControl)(Panel_GuildDuel, "StaticText_Notify"), 
_radio_kill = {[0] = (UI.getChildControl)(Panel_GuildDuel, "RadioButton_KillCount_0"), [1] = (UI.getChildControl)(Panel_GuildDuel, "RadioButton_KillCount_1"), [2] = (UI.getChildControl)(Panel_GuildDuel, "RadioButton_KillCount_2")}
, 
_radio_betting = {[0] = (UI.getChildControl)(Panel_GuildDuel, "RadioButton_Betting_0"), [1] = (UI.getChildControl)(Panel_GuildDuel, "RadioButton_Betting_1"), [2] = (UI.getChildControl)(Panel_GuildDuel, "RadioButton_Betting_2"), [3] = (UI.getChildControl)(Panel_GuildDuel, "RadioButton_Betting_3"), [4] = (UI.getChildControl)(Panel_GuildDuel, "RadioButton_Betting_4")}
}
, 
config = {guildNo_s64 = toInt64(0, 0)}
, 
duelConditon = {
kill = {[0] = 5, [1] = 600, [2] = 1000}
, 
betting = {[0] = 30000, [1] = 6000000, [2] = 10000000, [3] = 50000000, [4] = 100000000}
}
}
;
((GuildDuel.ui)._txt_GuildMaster):SetShow(false)
GuildDuel.Init = function(self)
  -- function num : 0_0 , upvalues : GuildDuel, UI_TM
  for killIdx = 0, #(GuildDuel.ui)._radio_kill do
    local targetKill = ToClient_GetGuildDuelTargetKillListAt(killIdx)
    local killScore = makeDotMoney(toInt64(0, targetKill))
    ;
    (((GuildDuel.ui)._radio_kill)[killIdx]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDDUEL_VICTORYCOUNT", "killCount", killScore))
  end
  for bettingIdx = 0, #(GuildDuel.ui)._radio_betting do
    local betting = ToClient_GetGuildDuelBettingListAt(bettingIdx)
    local bettingMoney = makeDotMoney(toInt64(0, betting))
    ;
    (((GuildDuel.ui)._radio_betting)[bettingIdx]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDDUEL_BETTING_MONEY", "VictoryCount", bettingMoney))
  end
  ;
  ((self.ui)._txt_DuelNotify):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self.ui)._txt_DuelNotify):SetAutoResize(true)
  ;
  ((self.ui)._txt_DuelNotify):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDDUELNOTIFY"))
  ;
  ((self.ui)._static_NotifyBG):SetSize(((self.ui)._static_NotifyBG):GetSizeX(), ((self.ui)._txt_DuelNotify):GetTextSizeY() + 10)
  Panel_GuildDuel:SetSize(Panel_GuildDuel:GetSizeX(), ((self.ui)._static_MainBG):GetSizeY() + ((self.ui)._txt_DuelNotify):GetTextSizeY() + 130)
  ;
  ((self.ui)._btn_Confirm):ComputePos()
  ;
  ((self.ui)._btn_Cancel):ComputePos()
end

GuildDuel.registEventHandler = function(self)
  -- function num : 0_1
  ((self.ui)._btn_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_GuildDuel_Confirm()")
  ;
  ((self.ui)._btn_Cancel):addInputEvent("Mouse_LUp", "HandleClicked_GuildDuel_Cancel()")
  ;
  ((self.ui)._btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_GuildDuel_Cancel()")
  ;
  ((self.ui)._btn_Help):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelGuild\" )")
end

GuildDuel.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("FromClient_RequestGuildDuel", "FromClient_RequestGuildDuel")
end

GuildDuel.Update = function(self)
  -- function num : 0_3
  local GuildWarInfoWrapper = ToClient_GetWarringGuildInfoByGuildNo((self.config).guildNo_s64)
  if GuildWarInfoWrapper ~= nil then
    local isSet = false
    if GuildWarInfoWrapper:isExist() then
      isSet = setGuildTextureByGuildNo((self.config).guildNo_s64, (self.ui)._static_GuildMark)
    end
    if isSet == false then
      ((self.ui)._static_GuildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
      local x1, y1, x2, y2 = setTextureUV_Func((self.ui)._static_GuildMark, 183, 1, 188, 6)
      ;
      (((self.ui)._static_GuildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      ((self.ui)._static_GuildMark):setRenderTexture(((self.ui)._static_GuildMark):getBaseTexture())
    else
      do
        do
          ;
          (((self.ui)._static_GuildMark):getBaseTexture()):setUV(0, 0, 1, 1)
          ;
          ((self.ui)._static_GuildMark):setRenderTexture(((self.ui)._static_GuildMark):getBaseTexture())
          ;
          ((self.ui)._txt_GuildName):SetText(GuildWarInfoWrapper:getGuildName())
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_NPCSHOP_GUILD1"))
        end
      end
    end
  end
end

FGlobal_GuildDuel_Open = function(guildNo_s64)
  -- function num : 0_4 , upvalues : GuildDuel
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (GuildDuel.config).guildNo_s64 = guildNo_s64
  Panel_GuildDuel:SetShow(true)
  GuildDuel:Update()
end

FGlobal_GuildDuel_Close = function()
  -- function num : 0_5 , upvalues : GuildDuel
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  (GuildDuel.config).guildNo_s64 = toInt64(0, 0)
  Panel_GuildDuel:SetShow(false)
end

HandleClicked_GuildDuel_Confirm = function()
  -- function num : 0_6 , upvalues : GuildDuel
  local selected_KillNo = nil
  local selected_Kill = false
  for killIdx = 0, #(GuildDuel.ui)._radio_kill do
    if (((GuildDuel.ui)._radio_kill)[killIdx]):IsCheck() then
      selected_KillNo = killIdx
      selected_Kill = true
      break
    end
  end
  do
    local selected_BettingNo = nil
    local selected_Betting = false
    for bettingIdx = 0, #(GuildDuel.ui)._radio_betting do
      if (((GuildDuel.ui)._radio_betting)[bettingIdx]):IsCheck() then
        selected_BettingNo = bettingIdx
        selected_Betting = true
        break
      end
    end
    do
      if selected_Kill == false or selected_Betting == false then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDDUEL_MUSTBE_SELECT"))
        return 
      end
      ToClient_RequestDeclareGuildDuel((GuildDuel.config).guildNo_s64, ToClient_GetGuildDuelTargetKillListAt(selected_KillNo), ToClient_GetGuildDuelBettingListAt(selected_BettingNo))
      HandleClicked_GuildDuel_Cancel()
    end
  end
end

HandleClicked_GuildDuel_Cancel = function()
  -- function num : 0_7 , upvalues : GuildDuel
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  (GuildDuel.config).guildNo_s64 = toInt64(0, 0)
  Panel_GuildDuel:SetShow(false)
end

local duelTargetUserNo = 0
local duelTargetGuildNo = 0
local duelTargetKill = 0
local duelBet = 0
FromClient_RequestGuildDuel = function(userNo, guildNo, guildName, targetKill, bet)
  -- function num : 0_8 , upvalues : duelTargetUserNo, duelTargetGuildNo, duelTargetKill, duelBet
  if (MessageBox.isPopUp)() and targetGuildNo == guildNo then
    return 
  end
  duelTargetUserNo = userNo
  duelTargetGuildNo = guildNo
  duelTargetKill = targetKill
  duelBet = bet
  local messageBoxMemo = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_DECLAREDUEL", "guildName", guildName, "killCount", makeDotMoney(targetKill), "bettingCount", makeDotMoney(bet))
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = FGlobal_AcceptGuildDuel, functionNo = FGlobal_RefuseGuildDuel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_AcceptGuildDuel = function()
  -- function num : 0_9 , upvalues : duelTargetGuildNo, duelTargetKill, duelBet, duelTargetUserNo
  ToClient_RequestAcceptGuildDuel(duelTargetGuildNo, duelTargetKill, duelBet)
  duelTargetUserNo = 0
  duelTargetGuildNo = 0
end

FGlobal_RefuseGuildDuel = function()
  -- function num : 0_10 , upvalues : duelTargetUserNo, duelTargetGuildNo
  ToClient_RequestRefuseGuildDuel(duelTargetUserNo, duelTargetGuildNo)
  duelTargetUserNo = 0
  duelTargetGuildNo = 0
end

GuildDuel:Init()
GuildDuel:registEventHandler()
GuildDuel:registMessageHandler()

