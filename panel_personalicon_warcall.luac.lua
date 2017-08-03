-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_warcall.luac 

-- params : ...
-- function num : 0
local _btn_WarCall = FGlobal_GetPersonalIconControl(10)
local _isVolunteer = false
WarCall_ToolTip = function(isShow)
  -- function num : 0_0 , upvalues : _isVolunteer, _btn_WarCall
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local regionInfoWrapper = ToClient_getRegionInfoWrapperByPosition(ToClient_GetTeleportToSiegeTentPos())
  if regionInfoWrapper == nil then
    return 
  end
  local areaName = regionInfoWrapper:getAreaName()
  local usableTime64 = ToClient_GetTeleportToSiegeTentTime()
  local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
  if _isVolunteer then
    descStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC2", "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
  else
    descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
  end
  local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_WARCALL_TOOLTIP_NAME"), descStr, _btn_WarCall
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

Click_WarCall = function()
  -- function num : 0_1
  ToClient_RequestTeleportToSiegeTentCall()
  TooltipSimple_Hide()
end

Response_GuildWarCall = function(sendType, isVolunteer)
  -- function num : 0_2 , upvalues : _isVolunteer
  _isVolunteer = isVolunteer
  if sendType == 0 then
    Panel_WarCall_Open()
    luaTimer_AddEvent(Panel_WarCall_Close, 600000, false, 0)
  else
    Panel_WarCall_Close()
  end
  FGlobal_PersonalIcon_ButtonPosUpdate()
end

Panel_WarCall_Open = function()
  -- function num : 0_3 , upvalues : _btn_WarCall
  _btn_WarCall:SetShow(true)
  FGlobal_PersonalIcon_ButtonPosUpdate()
end

Panel_WarCall_Close = function()
  -- function num : 0_4 , upvalues : _btn_WarCall
  if _btn_WarCall:GetShow() then
    _btn_WarCall:SetShow(false)
  end
end

FGlobal_WarCallCheck = function()
  -- function num : 0_5
  local leftTime = Int64toInt32(getLeftSecond_TTime64(ToClient_GetTeleportToSiegeTentTime()))
  if leftTime > 0 then
    Panel_WarCall_Open()
  else
    Panel_WarCall_Close()
  end
end

FGlobal_WarCallCheck()
registerEvent("FromClient_ResponseTeleportToSiegeTent", "Response_GuildWarCall")

