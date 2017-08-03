-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_summonparty.luac 

-- params : ...
-- function num : 0
local _btn_SummonParty = FGlobal_GetPersonalIconControl(9)
Click_SummonParty = function()
  -- function num : 0_0
  local remainTime_s64 = ToClient_GetLeftUsableTeleportCompassTime()
  local remainTime = Int64toInt32(remainTime_s64)
  if remainTime > 0 then
    if IsSelfPlayerWaitAction() then
      ToClient_RequestTeleportPosUseCompass()
    else
      Proc_ShowMessage_Ack("�\128�\176 상태에서�\140 이용�\160 �\152 있습니다.")
    end
  end
end

local partyName = ""
SummonParty_ToolTip = function(isShow)
  -- function num : 0_1 , upvalues : partyName, _btn_SummonParty
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
  local playerActorKey = (getSelfPlayer()):getActorKey()
  local descStr = ""
  local usableTime64 = ToClient_GetLeftUsableTeleportCompassTime()
  if partyActorKey == playerActorKey then
    descStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPASS_DESC_1", "remainTime", convertStringFromDatetime(usableTime64))
  else
    descStr = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_COMPASS_DESC_2", "partyName", partyName, "partyName1", partyName, "remainTime", convertStringFromDatetime(usableTime64))
  end
  local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_COMPASS_NAME"), descStr, _btn_SummonParty
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

Panel_SummonParty_Open = function()
  -- function num : 0_2 , upvalues : _btn_SummonParty
  local remainTime_s64 = ToClient_GetLeftUsableTeleportCompassTime()
  local remainTime = Int64toInt32(remainTime_s64)
  local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
  local playerActorKey = (getSelfPlayer()):getActorKey()
  if partyActorKey ~= playerActorKey then
    if remainTime > 0 then
      FGlobal_PersonalIcon_ButtonPosUpdate()
      _btn_SummonParty:SetShow(true)
      _btn_SummonParty:EraseAllEffect()
      _btn_SummonParty:AddEffect("fUI_Buster_Call01", true, 0, 0)
    else
      Panel_SummonParty_Close()
    end
  end
end

Panel_SummonParty_Close = function()
  -- function num : 0_3 , upvalues : _btn_SummonParty
  if _btn_SummonParty:GetShow() then
    _btn_SummonParty:EraseAllEffect()
    _btn_SummonParty:SetShow(false)
  end
end

local summonPartyCheck = function()
  -- function num : 0_4
  local leftTime = Int64toInt32(ToClient_GetLeftUsableTeleportCompassTime())
  if leftTime > 0 then
    local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
    local playerActorKey = (getSelfPlayer()):getActorKey()
    if partyActorKey ~= playerActorKey then
      if RequestParty_getPartyMemberCount() > 0 then
        Panel_SummonParty_Open()
      else
        Panel_SummonParty_Close()
      end
    else
      Panel_SummonParty_Close()
    end
  else
    do
      Panel_SummonParty_Close()
    end
  end
end

summonPartyCheck()
FGlobal_SummonPartyCheck = function()
  -- function num : 0_5 , upvalues : summonPartyCheck
  summonPartyCheck()
end

FromClient_ResponseUseCompass = function()
  -- function num : 0_6 , upvalues : partyName
  Panel_SummonParty_Open()
  partyName = ""
  partyName = ToClient_GetCharacterNameUseCompass()
  local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
  local playerActorKey = (getSelfPlayer()):getActorKey()
  local msg = ""
  if partyActorKey == playerActorKey then
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_COMPASS_MESSAGE_1")
  else
    msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPASS_MESSAGE_2", "partyName", partyName)
  end
  Proc_ShowMessage_Ack(msg)
  FGlobal_PersonalIcon_ButtonPosUpdate()
end

registerEvent("FromClient_ResponseUseCompass", "FromClient_ResponseUseCompass")

