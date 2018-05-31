-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\oneonone\panel_guild_oneononeaccept.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_OneOnOne_Accept = {
_ui = {_panel = Panel_Guild_OneOnOneAccept, _radio_RuleTitle = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "RadioButton_RuleTitle"), _radio_ResultTitle = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "RidioButton_ResultTitle"), _staticBG_RuleTitle = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "Static_RuleBg"), _staticBG_ResultTitle = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "Static_ResultBg"), _btnConfirm = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "Button_Confirm"), _btnCancel = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "Button_Cancel"), _staticText_LeftTime = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "StaticText_LeftTime"), _staticText_AttackGuildName = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "StaticText_GuildName"), _staticText_AcceptDesc = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "StaticText_OneOnOneDesc")}
}
local animationTime = 0.3
local currentTime = 0
FGlobal_Guild_OneOnOne_Accept_UpdatePerFrame = function(deltaTime)
  -- function num : 0_0 , upvalues : animationTime, currentTime
  if animationTime < currentTime then
    return 
  end
  currentTime = currentTime + deltaTime
  local ui = PaGlobal_Guild_OneOnOne_Accept._ui
  if (ui._radio_RuleTitle):IsChecked() then
    PaGlobal_UpdateRectClipOnArea_Animation(ui._controlList, 1, 2, animationTime, currentTime)
  else
    if (ui._radio_ResultTitle):IsChecked() then
      PaGlobal_UpdateRectClipOnArea_Animation(ui._controlList, 2, 1, animationTime, currentTime)
    end
  end
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_OneOnOne_Accept.Open = function(self)
  -- function num : 0_1
  local ui = self._ui
  Panel_Guild_OneOnOneAccept:SetShow(true)
  local attackTeamInfo = ToClient_GetGuildTeamBattleAttackTeam()
  if attackTeamInfo == nil then
    return 
  end
  ;
  (ui._staticText_AttackGuildName):SetText("[" .. attackTeamInfo:getTeamName() .. "]")
  if attackTeamInfo:isAlliance() == true then
    (ui._staticText_AcceptDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ACCEPTDESC_ALLIANCE"))
  else
    ;
    (ui._staticText_AcceptDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_ACCEPTDESC_GUILD"))
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_OneOnOne_Accept.Close = function(self)
  -- function num : 0_2
  Panel_Guild_OneOnOneAccept:SetShow(false)
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_OneOnOne_Accept.UpdateClock = function(self, remainSec)
  -- function num : 0_3
  ((self._ui)._staticText_LeftTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REMAINSEC", "sec", remainSec))
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_OneOnOne_Accept.Confirm = function(self)
  -- function num : 0_4
  local ui = self._ui
  local playerName1 = (ui._editPlayerName1):GetEditText()
  local playerName2 = (ui._editPlayerName2):GetEditText()
  ToClient_AcceptGuildTeamBattle(playerName1, playerName2)
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_OneOnOne_Accept.Reject = function(self)
  -- function num : 0_5
  ToClient_RejectGuildTeamBattle()
  Panel_Guild_OneOnOneAccept:SetShow(false)
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_OneOnOne_Accept.ClearAnimation = function(self, radioIndex)
  -- function num : 0_6 , upvalues : currentTime
  currentTime = 0
end

FromClient_Guild_OneOnOne_Accept_Initialize = function()
  -- function num : 0_7
  local ui = PaGlobal_Guild_OneOnOne_Accept._ui
  local staticMainBg = (UI.getChildControl)(Panel_Guild_OneOnOneAccept, "Static_MainBg")
  ui._editPlayerName1 = (UI.getChildControl)(staticMainBg, "Edit_User_Name")
  ui._editPlayerName2 = (UI.getChildControl)(staticMainBg, "Edit_User_Name_2")
  local staticTextRule = (UI.getChildControl)(ui._staticBG_RuleTitle, "StaticText_RuleDesc")
  staticTextRule:SetSize(staticTextRule:GetSizeX(), staticTextRule:GetTextSizeY() + 20)
  ;
  (ui._staticBG_RuleTitle):SetSize((ui._staticBG_RuleTitle):GetSizeX(), staticTextRule:GetSizeY())
  local staticTextResult = (UI.getChildControl)(ui._staticBG_ResultTitle, "StaticText_ResultDesc")
  staticTextResult:SetSize(staticTextResult:GetSizeX(), staticTextResult:GetTextSizeY() + 20)
  ;
  (ui._staticBG_ResultTitle):SetSize((ui._staticBG_ResultTitle):GetSizeX(), staticTextResult:GetSizeY())
  ui._controlList = {
{_desc = ui._staticBG_RuleTitle, _title = ui._radio_RuleTitle, _pos = 1}
, 
{_desc = ui._staticBG_ResultTitle, _title = ui._radio_ResultTitle, _pos = 0}
}
  ;
  (ui._btnConfirm):addInputEvent("Mouse_LUp", "PaGlobal_Guild_OneOnOne_Accept:Confirm()")
  ;
  (ui._btnCancel):addInputEvent("Mouse_LUp", "PaGlobal_Guild_OneOnOne_Accept:Reject()")
  ;
  (ui._radio_RuleTitle):addInputEvent("Mouse_LUp", "PaGlobal_Guild_OneOnOne_Accept:ClearAnimation(1)")
  ;
  (ui._radio_ResultTitle):addInputEvent("Mouse_LUp", "PaGlobal_Guild_OneOnOne_Accept:ClearAnimation(2)")
  ;
  (ui._radio_RuleTitle):SetCheck(true)
end

FromClient_GuildTeamBattle_AcceptOpen = function()
  -- function num : 0_8
  PaGlobal_Guild_OneOnOne_Accept:Open()
end

FGlobal_GuildTeamBattle_CloseAcceptPanel = function(attackGuildNo, defenceGuildNo)
  -- function num : 0_9
  PaGlobal_Guild_OneOnOne_Accept:Close()
end

FGlobal_Update_Guild_OneOnOneAcceptTime = function(state, remainSec)
  -- function num : 0_10
  if __eGuildTeamBattleState_Accepting ~= state then
    return 
  end
  PaGlobal_Guild_OneOnOne_Accept:UpdateClock(remainSec)
end

FGlobal_Close_GuildTeamBattleAcceptPanel = function()
  -- function num : 0_11
  PaGlobal_Guild_OneOnOne_Accept:Close()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDTEAMBATTLE_REJECT_DONE"))
end

registerEvent("FromClient_luaLoadComplete", "FromClient_Guild_OneOnOne_Accept_Initialize")
registerEvent("FromClient_GuildTeamBattle_AcceptOpen", "FromClient_GuildTeamBattle_AcceptOpen")
registerEvent("FromClient_GuildTeamBattle_AcceptDone", "FGlobal_GuildTeamBattle_CloseAcceptPanel")
registerEvent("FromClient_UpdateGuildTeamBattleTime", "FGlobal_Update_Guild_OneOnOneAcceptTime")
registerEvent("FromClient_GuildTeamBattle_RejectDone", "FGlobal_Close_GuildTeamBattleAcceptPanel")
Panel_Guild_OneOnOneAccept:RegisterUpdateFunc("FGlobal_Guild_OneOnOne_Accept_UpdatePerFrame")

