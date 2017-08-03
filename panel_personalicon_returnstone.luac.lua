-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_returnstone.luac 

-- params : ...
-- function num : 0
local _btn_ReturnStone = FGlobal_GetPersonalIconControl(7)
Click_ReturnStone = function()
  -- function num : 0_0
  local remainTime_s64 = ToClient_GetLeftReturnStoneTime()
  local remainTime = Int64toInt32(remainTime_s64)
  local returnPos3D = ToClient_GetPosUseReturnStone()
  local regionInfo = getRegionInfoByPosition(returnPos3D)
  if remainTime > 0 then
    if IsSelfPlayerWaitAction() then
      ToClient_RequestTeleportPosUseReturnStone()
    else
      Proc_ShowMessage_Ack("�\128�\176 상태에서�\140 이용�\160 �\152 있습니다.")
    end
  end
end

ReturnStone_ToolTip = function(isShow)
  -- function num : 0_1 , upvalues : _btn_ReturnStone
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local returnPos3D = ToClient_GetPosUseReturnStone()
  local regionInfo = getRegionInfoByPosition(returnPos3D)
  local regionName = ""
  if regionInfo ~= nil then
    regionName = regionInfo:getAreaName()
  end
  local returnTownRegionKey = ToClient_GetReturnStoneTownRegionKey()
  local usableTime64 = ToClient_GetLeftReturnStoneTime()
  local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_RETURNSTONE_DESC", "regionName", regionName, "remainTime", convertStringFromDatetime(usableTime64))
  local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_RETURNSTONE_NAME"), descStr, _btn_ReturnStone
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

Panel_ReturnStone_Open = function()
  -- function num : 0_2 , upvalues : _btn_ReturnStone
  local remainTime_s64 = ToClient_GetLeftReturnStoneTime()
  local remainTime = Int64toInt32(remainTime_s64)
  if remainTime > 0 then
    _btn_ReturnStone:SetShow(true)
    FGlobal_PersonalIcon_ButtonPosUpdate()
    _btn_ReturnStone:EraseAllEffect()
    _btn_ReturnStone:AddEffect("fUI_Buster_Call01", true, 0, 0)
  else
    Panel_ReturnStone_Close()
  end
end

Panel_ReturnStone_Close = function()
  -- function num : 0_3 , upvalues : _btn_ReturnStone
  if _btn_ReturnStone:GetShow() then
    _btn_ReturnStone:EraseAllEffect()
    _btn_ReturnStone:SetShow(false)
  end
end

local returnStoneCheck = function()
  -- function num : 0_4
  local leftTime = Int64toInt32(ToClient_GetLeftReturnStoneTime())
  if leftTime > 0 then
    Panel_ReturnStone_Open()
  else
    Panel_ReturnStone_Close()
  end
end

returnStoneCheck()
FromClient_ResponseUseReturnStone = function()
  -- function num : 0_5 , upvalues : _btn_ReturnStone
  local pos3D = ToClient_GetPosUseReturnStone()
  ToClient_DeleteNaviGuideByGroup(0)
  worldmapNavigatorStart(pos3D, NavigationGuideParam(), false, false)
  if not _btn_ReturnStone:GetShow() then
    Panel_ReturnStone_Open()
  end
  FGlobal_PersonalIcon_ButtonPosUpdate()
end

FGlobal_ReturnStoneCheck = function()
  -- function num : 0_6 , upvalues : _btn_ReturnStone, returnStoneCheck
  if _btn_ReturnStone:GetShow() then
    returnStoneCheck()
  end
end

registerEvent("FromClient_ResponseUseReturnStone", "FromClient_ResponseUseReturnStone")

