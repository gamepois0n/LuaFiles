-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_territorytooltip.luac 

-- params : ...
-- function num : 0
local const_lineGap = 5
local territoryName = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_Title")
local territoryInfoScetion = {territoryTitle = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_SiteInfoTItle"), territoryIcon = (UI.getChildControl)(Panel_Worldmap_Territory, "Static_SiteIcon"), cityName = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_CityName"), userRate = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_UserRate"), taxTitle = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_TaxRateInfoTitle"), taxTransfer = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_TransferTax"), sectionBG = (UI.getChildControl)(Panel_Worldmap_Territory, "Static_TerritoryInfoBG")}
local occupyGuildSection = {sectionTitle = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_OccupiersInfoTitle"), guildIcon = (UI.getChildControl)(Panel_Worldmap_Territory, "Static_GuildIcon"), guildIconBG = (UI.getChildControl)(Panel_Worldmap_Territory, "Static_GuildIconBG"), guildName = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_OccupationGuild"), guildOwner = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_OccupationOwner"), occupyDate = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_OccupationDate"), occupyWeek = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_OccupationWeek"), sectionBG = (UI.getChildControl)(Panel_Worldmap_Territory, "Static_OccupiersInfoBG")}
local commonInfoSection = {playerInfoTitle = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_PlayerInfoTitle"), playerPopular = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_Reputation"), warInfoTitle = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_OccupationInfoTitle"), warInfo = (UI.getChildControl)(Panel_Worldmap_Territory, "StaticText_WarInfo"), sectionBG = (UI.getChildControl)(Panel_Worldmap_Territory, "Static_InformationBG")}
territoryInfoScetion.SetShow = function(self, isShow)
  -- function num : 0_0
  (self.territoryTitle):SetShow(isShow)
  ;
  (self.territoryIcon):SetShow(isShow)
  ;
  (self.cityName):SetShow(isShow)
  ;
  (self.userRate):SetShow(isShow)
  ;
  (self.taxTitle):SetShow(isShow)
  ;
  (self.taxTransfer):SetShow(isShow)
  ;
  (self.sectionBG):SetShow(isShow)
end

territoryInfoScetion.SetInfo = function(self, territoryInfo, territoryKeyRaw)
  -- function num : 0_1
  local imagePath = ToClient_getTerritoryImageName(territoryInfo)
  ;
  (self.territoryIcon):ChangeTextureInfoName(imagePath)
  local siegeWrapper = ToClient_GetSiegeWrapper(territoryKeyRaw)
  if siegeWrapper ~= nil then
    (self.cityName):SetText(siegeWrapper:getRegionAreaName())
  end
  local affiliatedUserRate = ToClient_getAffiliatedUserRate(territoryInfo)
  local affiliatedUserRateStr = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_POPULATIONDENSITY")
  if affiliatedUserRate >= 0 and affiliatedUserRate <= 20 then
    affiliatedUserRateStr = affiliatedUserRateStr .. " <PAColor0xFFFF4C4C>" .. PAGetString(Defines.StringSheet_GAME, "LUA_LORDMENU_POPULATIONDENSITY_LACK") .. "<PAOldColor> (" .. (string.format)("%d", affiliatedUserRate) .. "%)"
  else
    if affiliatedUserRate > 20 and affiliatedUserRate <= 40 then
      affiliatedUserRateStr = affiliatedUserRateStr .. " <PAColor0xFFFF874C>" .. PAGetString(Defines.StringSheet_GAME, "LUA_LORDMENU_POPULATIONDENSITY_LOW") .. "<PAOldColor> (" .. (string.format)("%d", affiliatedUserRate) .. "%)"
    else
      if affiliatedUserRate > 40 and affiliatedUserRate <= 60 then
        affiliatedUserRateStr = affiliatedUserRateStr .. " <PAColor0xFFAEFF9B>" .. PAGetString(Defines.StringSheet_GAME, "LUA_LORDMENU_POPULATIONDENSITY_NORMAL") .. "<PAOldColor> (" .. (string.format)("%d", affiliatedUserRate) .. "%)"
      else
        if affiliatedUserRate > 60 and affiliatedUserRate <= 80 then
          affiliatedUserRateStr = affiliatedUserRateStr .. " <PAColor0xFF9B9BFF>" .. PAGetString(Defines.StringSheet_GAME, "LUA_LORDMENU_POPULATIONDENSITY_HIGH") .. "<PAOldColor> (" .. (string.format)("%d", affiliatedUserRate) .. "%)"
        else
          if affiliatedUserRate > 80 and affiliatedUserRate <= 100 then
            affiliatedUserRateStr = affiliatedUserRateStr .. " <PAColor0xFF8737FF>" .. PAGetString(Defines.StringSheet_GAME, "LUA_LORDMENU_POPULATIONDENSITY_EXPLOSION") .. "<PAOldColor> (" .. (string.format)("%d", affiliatedUserRate) .. "%)"
          end
        end
      end
    end
  end
  ;
  (self.userRate):SetText(affiliatedUserRateStr)
  ;
  (self.userRate):SetShow(false)
  local taxrate = siegeWrapper:getTaxRateForFortress((CppEnums.TaxType).eTaxTypeSellItemToItemMarket)
  siegeWrapper:getTaxRateForFortress((CppEnums.TaxType).eTaxTypeSellItemToItemMarket)
  ;
  (self.taxTransfer):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORY_LOCAL_TAX") .. " : " .. (string.format)("%d", taxrate) .. "%")
end

occupyGuildSection.SetShow = function(self, isShow)
  -- function num : 0_2
  (self.sectionTitle):SetShow(isShow)
  ;
  (self.guildIcon):SetShow(isShow)
  ;
  (self.guildIconBG):SetShow(isShow)
  ;
  (self.guildName):SetShow(isShow)
  ;
  (self.guildOwner):SetShow(isShow)
  ;
  (self.occupyDate):SetShow(isShow)
  ;
  (self.occupyWeek):SetShow(isShow)
  ;
  (self.sectionBG):SetShow(isShow)
end

occupyGuildSection.SetInfo = function(self, territoryInfo, territoryKeyRaw)
  -- function num : 0_3
  local siegeWrapper = ToClient_GetSiegeWrapper(territoryKeyRaw)
  local occupyWeekValue = ToClient_GetAccumulatedOccupiedCountByWeek(territoryKeyRaw)
  local isSet = ToClient_setGuildTexture(territoryInfo, self.guildIcon)
  if isSet then
    (self.guildIcon):SetAlpha(1)
  else
    ;
    (self.guildIcon):ChangeTextureInfoName("New_UI_Common_forLua/Default/BlankGuildMark.dds")
    ;
    (self.guildIcon):SetAlpha(0)
  end
  ;
  (self.guildName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_GUILD") .. " : " .. siegeWrapper:getGuildName())
  ;
  (self.guildOwner):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_MASTER") .. " : " .. siegeWrapper:getGuildMasterName())
  local paDate = siegeWrapper:getOccupyingDate()
  local year = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_YEAR", "year", tostring(paDate:GetYear()))
  local month = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_MONTH", "month", tostring(paDate:GetMonth()))
  local day = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_DAY", "day", tostring(paDate:GetDay()))
  local hour = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_HOUR", "hour", tostring(paDate:GetHour()))
  ;
  (self.occupyDate):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_TIME") .. " : " .. year .. month .. day .. hour)
  if occupyWeekValue ~= -1 then
    (self.occupyWeek):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_TERRITORYTOOLTIP_WEEK_HAVE", "value", occupyWeekValue + 1))
  else
    ;
    (self.occupyWeek):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_TERRITORYTOOLTIP_WEEK"))
  end
end

commonInfoSection.SetShow = function(self, isShow)
  -- function num : 0_4
  (self.playerInfoTitle):SetShow(isShow)
  ;
  (self.playerPopular):SetShow(isShow)
  ;
  (self.warInfoTitle):SetShow(isShow)
  ;
  (self.warInfo):SetShow(isShow)
  ;
  (self.sectionBG):SetShow(isShow)
end

commonInfoSection.SetInfo = function(self, territoryInfo, territoryKeyRaw)
  -- function num : 0_5
  local supportPoint = ToClient_getRemainSurportPointByTerritory(territoryInfo)
  local supportExpRate = ToClient_getCurrentExpRate(territoryInfo)
  if supportPoint == 0 then
    supportPointText = "<PAColor0xAAFFBB88>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_ROOKIE") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_ADVENTURER") .. "<PAOldColor>"
  else
    if supportPoint == 1 then
      supportPointText = "<PAColor0xAAFFBB88>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_STRANGE") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_ADVENTURER") .. "<PAOldColor>"
    else
      if supportPoint == 2 then
        supportPointText = "<PAColor0xAAFFBB88>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_CLOSE") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_ADVENTURER") .. "<PAOldColor>"
      else
        if supportPoint == 3 then
          supportPointText = "<PAColor0xAAFFBB88>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_RELIABLE") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_ADVENTURER") .. "<PAOldColor>"
        else
          if supportPoint >= 4 then
            supportPointText = "<PAColor0xAAFFBB88>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_FAMOUS") .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_ADVENTURER") .. "<PAOldColor>"
          end
        end
      end
    end
  end
  ;
  (self.playerPopular):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_FAME") .. " : " .. supportPointText)
  local isWar = isSiegeBeing(territoryKeyRaw)
  local joinGuildCount = getCompleteKingOrLordTentCount(territoryKeyRaw)
  if isWar then
    (self.warInfo):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WOLRDMAP_TERRITORYTOOLTIP_TEXT_GUILDWAR", "joinGuildCount", joinGuildCount))
  else
    ;
    (self.warInfo):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_TERRITORYTOOLTIP_JOINGUILDCOUNT", "joinGuildCount", joinGuildCount))
  end
  local siegeWrapper = ToClient_GetSiegeWrapper(territoryKeyRaw)
  if siegeWrapper ~= nil and siegeWrapper:doOccupantExist() then
    (self.sectionBG):SetSpanSize(0, 400)
    ;
    (self.playerInfoTitle):SetSpanSize(0, 410)
    ;
    (self.playerPopular):SetSpanSize(30, 440)
    ;
    (self.warInfoTitle):SetSpanSize(0, 480)
    ;
    (self.warInfo):SetSpanSize(30, 510)
  else
    ;
    (self.sectionBG):SetSpanSize(0, 240)
    ;
    (self.playerInfoTitle):SetSpanSize(0, 250)
    ;
    (self.playerPopular):SetSpanSize(30, 280)
    ;
    (self.warInfoTitle):SetSpanSize(0, 320)
    ;
    (self.warInfo):SetSpanSize(30, 350)
  end
end

FromClient_TerritoryUICreate = function(territoryUI)
  -- function num : 0_6
  local territoryInfo = territoryUI:FromClient_getTerritoryInfo()
  local guildMark = territoryUI:FromClient_getGuildMark()
  guildMark:SetSize(32, 32)
  guildMark:SetSpanSize(0, 118)
  guildMark:SetHorizonCenter()
  guildMark:SetVerticalTop()
  guildMark:SetIgnore(true)
  guildMark:SetShow(false)
  guildMark:SetTexturePreload(false)
  local isSet = ToClient_setGuildTexture(territoryInfo, guildMark)
  if isSet == false then
    guildMark:ChangeTextureInfoName("New_UI_Common_forLua/Default/BlankGuildMark.dds")
    guildMark:SetTexturePreload(false)
    guildMark:SetAlpha(0)
  else
    guildMark:SetAlpha(1)
  end
end

FromClient_updateGuildmark = function(territoryUI)
  -- function num : 0_7
  local territoryInfo = territoryUI:FromClient_getTerritoryInfo()
  local guildMark = territoryUI:FromClient_getGuildMark()
  local isSet = ToClient_setGuildTexture(territoryInfo, guildMark)
  if isSet == false then
    guildMark:ChangeTextureInfoName("New_UI_Common_forLua/Default/BlankGuildMark.dds")
    guildMark:SetTexturePreload(false)
    guildMark:SetAlpha(0)
  else
    guildMark:SetAlpha(1)
  end
end

FromClient_OnTerritoryTooltipShow = function(territoryUI, territoryInfo, territoryKeyRaw)
  -- function num : 0_8 , upvalues : territoryName, territoryInfoScetion, const_lineGap, occupyGuildSection, commonInfoSection
  if territoryInfo == nil then
    return 
  end
  panelHeight = 0
  Panel_Worldmap_Territory:SetShow(true)
  local siegeWrapper = ToClient_GetSiegeWrapper(territoryKeyRaw)
  territoryName:SetText(ToClient_getTerritoryName(territoryInfo))
  territoryInfoScetion:SetShow(true)
  territoryInfoScetion:SetInfo(territoryInfo, territoryKeyRaw)
  local panelHeight = (territoryInfoScetion.sectionBG):GetSizeY() + const_lineGap
  if siegeWrapper ~= nil and siegeWrapper:doOccupantExist() then
    occupyGuildSection:SetShow(true)
    occupyGuildSection:SetInfo(territoryInfo, territoryKeyRaw)
    panelHeight = panelHeight + (occupyGuildSection.sectionBG):GetSizeY() + const_lineGap
  else
    occupyGuildSection:SetShow(false)
  end
  commonInfoSection:SetShow(true)
  commonInfoSection:SetInfo(territoryInfo, territoryKeyRaw)
  Panel_Worldmap_Territory:SetSize(Panel_Worldmap_Territory:GetSizeX(), (commonInfoSection.sectionBG):GetPosY() + (commonInfoSection.sectionBG):GetSizeY() + 20)
  local posX = territoryUI:GetPosX()
  local posY = territoryUI:GetPosY()
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  if posX / screenSizeX > 0.5 then
    posX = posX - Panel_Worldmap_Territory:GetSizeX()
  else
    posX = posX + territoryUI:GetSizeX()
  end
  if posY / screenSizeY > 0.5 then
    posY = posY - Panel_Worldmap_Territory:GetSizeY()
  end
  Panel_Worldmap_Territory:SetPosX(posX)
  Panel_Worldmap_Territory:SetPosY(posY)
end

FromClient_OnTerritoryTooltipHide = function()
  -- function num : 0_9
  Panel_Worldmap_Territory:SetShow(false)
end

registerEvent("FromClient_WorldMapTerritoryNodeCreate", "FromClient_TerritoryUICreate")
registerEvent("FromClient_WorldMapTerritoryNodeGuildMarkUpdate", "FromClient_updateGuildmark")
registerEvent("FromClient_TerritoryTooltipShow", "FromClient_OnTerritoryTooltipShow")
registerEvent("FromClient_TerritoryTooltipHide", "FromClient_OnTerritoryTooltipHide")

