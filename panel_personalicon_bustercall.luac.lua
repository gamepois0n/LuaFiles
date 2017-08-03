-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_bustercall.luac 

-- params : ...
-- function num : 0
local _btn_BusterCall = FGlobal_GetPersonalIconControl(6)
BusterCall_ToolTip = function(isShow)
  -- function num : 0_0 , upvalues : _btn_BusterCall
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local regionInfoWrapper = ToClient_getRegionInfoWrapperByPosition(ToClient_GetGuildBustCallPos())
  if regionInfoWrapper == nil then
    return 
  end
  local areaName = regionInfoWrapper:getAreaName()
  local usableTime64 = ToClient_GetGuildBustCallTime()
  local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
  local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_NAME"), descStr, _btn_BusterCall
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

Click_BusterCall = function()
  -- function num : 0_1
  ToClient_RequestTeleportGuildBustCall()
  TooltipSimple_Hide()
end

Response_GuildBusterCall = function(sendType)
  -- function num : 0_2
  if sendType == 0 then
    Panel_BusterCall_Open()
    luaTimer_AddEvent(Panel_BusterCall_Close, 600000, false, 0)
  else
    Panel_BusterCall_Close()
  end
  FGlobal_PersonalIcon_ButtonPosUpdate()
end

Panel_BusterCall_Open = function()
  -- function num : 0_3 , upvalues : _btn_BusterCall
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  if isGuildMaster == true then
    Panel_BusterCall_Close()
    return 
  end
  _btn_BusterCall:SetShow(true)
  FGlobal_PersonalIcon_ButtonPosUpdate()
  _btn_BusterCall:EraseAllEffect()
  _btn_BusterCall:AddEffect("fUI_Buster_Call01", true, 0, 0)
end

Panel_BusterCall_Close = function()
  -- function num : 0_4 , upvalues : _btn_BusterCall
  if _btn_BusterCall:GetShow() then
    _btn_BusterCall:EraseAllEffect()
    _btn_BusterCall:SetShow(false)
  end
end

FGlobal_BusterCallCheck = function()
  -- function num : 0_5
  local leftTime = Int64toInt32(getLeftSecond_TTime64(ToClient_GetGuildBustCallTime()))
  if leftTime > 0 then
    Panel_BusterCall_Open()
  else
    Panel_BusterCall_Close()
  end
end

FGlobal_BusterCallCheck()
registerEvent("FromClient_ResponseBustCall", "Response_GuildBusterCall")

