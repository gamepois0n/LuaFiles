-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\characternametag\panel_navigation.luac 

-- params : ...
-- function num : 0
Panel_Copy_NaviPath:SetPosX(-1000)
Panel_Copy_NaviPath:SetPosY(-1000)
FromClient_CreateNavigationPanel = function(targetPanel, index)
  -- function num : 0_0
  local meterControl = (UI.getChildControl)(targetPanel, "StaticText_Meter")
  local naviButton = (UI.getChildControl)(targetPanel, "Checkbox_NaviBtn")
  meterControl:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  meterControl:SetShow(true)
  naviButton:addInputEvent("Mouse_LUp", "NavigationControlClick(" .. tostring(index) .. ")")
  naviButton:SetShow(true)
end

NavigationControlClick = function(index)
  -- function num : 0_1
  local selfPlayer = (getSelfPlayer()):get()
  if selfPlayer:getNavigationMovePathIndex() == index then
    selfPlayer:setNavigationMovePath(-1)
    selfPlayer:checkNaviPathUI(-1)
  else
    if ToClient_GetNaviGuideGroupNo(index) ~= 0 then
      ToClient_DeleteNaviGuideByGroup(0)
    end
    selfPlayer:setNavigationMovePath(index)
    selfPlayer:checkNaviPathUI(index)
  end
end

ToClient_SetBubbleNaviPath(Panel_Copy_NaviPath)
ToClient_InitializeNaviPath()
registerEvent("FromClient_CreateNavigationPanel", "FromClient_CreateNavigationPanel")

