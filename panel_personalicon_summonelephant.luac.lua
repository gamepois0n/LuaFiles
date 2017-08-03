-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_summonelephant.luac 

-- params : ...
-- function num : 0
local _btn_SummonElephant = (FGlobal_GetPersonalIconControl(8))
local elephantActorKey = nil
SummonElephant = function()
  -- function num : 0_0 , upvalues : elephantActorKey
  if elephantActorKey == nil then
    return 
  end
  ToClient_RequestSummonElephantFromSiegeBuilding(elephantActorKey)
end

Panel_SummonElephant_Close = function()
  -- function num : 0_1 , upvalues : _btn_SummonElephant, elephantActorKey
  _btn_SummonElephant:SetShow(false)
  elephantActorKey = nil
  FGlobal_PersonalIcon_ButtonPosUpdate()
end

FromClient_ShowElephantBarn = function(actorKeyRaw)
  -- function num : 0_2 , upvalues : _btn_SummonElephant, elephantActorKey
  _btn_SummonElephant:SetShow(true)
  FGlobal_PersonalIcon_ButtonPosUpdate()
  elephantActorKey = actorKeyRaw
  FGlobal_PersonalIcon_ButtonPosUpdate()
end

FromClient_HideElephantBarn = function(actorKeyRaw)
  -- function num : 0_3
  Panel_SummonElephant_Close()
end

SummonElephant_Tooltip_ShowToggle = function(isShow)
  -- function num : 0_4 , upvalues : _btn_SummonElephant
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_SUMMONELEPHANT_TOOLTIP_TITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_SUMMONELEPHANT_TOOLTIP_DESC")
  TooltipSimple_Show(_btn_SummonElephant, name, desc)
end

registerEvent("FromClient_ShowElephantBarn", "FromClient_ShowElephantBarn")
registerEvent("FromClient_HideElephantBarn", "FromClient_HideElephantBarn")

