-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\steam\panel_window_steam.luac 

-- params : ...
-- function num : 0
local UI_SERVICE_RESOURCE = CppEnums.ServiceResourceType
PaGlobal_Steam_Redemption = function()
  -- function num : 0_0 , upvalues : UI_SERVICE_RESOURCE
  local url = nil
  local langType = "EN"
  if UI_SERVICE_RESOURCE.eServiceResourceType_EN == getGameServiceResType() then
    langType = "EN"
  else
    if UI_SERVICE_RESOURCE.eServiceResourceType_FR == getGameServiceResType() then
      langType = "FR"
    else
      if UI_SERVICE_RESOURCE.eServiceResourceType_DE == getGameServiceResType() then
        langType = "DE"
      end
    end
  end
  if isSteamClient() and not isSteamInGameOverlayEnabled() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_STEAM_ALERT")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    if isSteamClient() then
      ToClient_requestRedeemAuthSessionTicket()
      local ticket = getSteamAuthSessionTicket()
      url = "https://www.blackdesertonline.com/steam/UserInfo.html?appId=582660&steamTicket=" .. ticket .. "&lang=" .. langType
      steamOverlayToWebPage(url)
      return 
    else
      do
        url = "https://www.blackdesertonline.com/myinfo/"
        ToClient_OpenChargeWebPage(url, false)
        do return  end
      end
    end
  end
end

FromClient_SteamRedeemAuthTicketReady = function()
  -- function num : 0_1 , upvalues : UI_SERVICE_RESOURCE
  local url = nil
  local langType = "EN"
  if UI_SERVICE_RESOURCE.eServiceResourceType_EN == getGameServiceResType() then
    langType = "EN"
  else
    if UI_SERVICE_RESOURCE.eServiceResourceType_FR == getGameServiceResType() then
      langType = "FR"
    else
      if UI_SERVICE_RESOURCE.eServiceResourceType_DE == getGameServiceResType() then
        langType = "DE"
      end
    end
  end
  local ticket = getSteamAuthSessionTicket()
  url = "https://www.blackdesertonline.com/steam/UserInfo.html?appId=582660&steamTicket=" .. ticket .. "&lang=" .. langType
  steamOverlayToWebPage(url)
end

registerEvent("FromClient_SteamRedeemAuthTicketReady", "FromClient_SteamRedeemAuthTicketReady")

