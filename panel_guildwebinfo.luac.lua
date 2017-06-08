-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guildwebinfo.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local GST = CppEnums.GameServiceType
Panel_GuildWebInfo:SetShow(false)
Panel_GuildWebInfo:setGlassBackground(true)
Panel_GuildWebInfo:ActiveMouseEventEffect(true)
Panel_GuildWebInfo:RegisterShowEventFunc(true, "Panel_GuildWebInfo_ShowAni()")
Panel_GuildWebInfo:RegisterShowEventFunc(false, "Panel_GuildWebInfo_HideAni()")
local isBeforeShow = false
local eCountryType = CppEnums.CountryType
local gameServiceType = getGameServiceType()
local isNaver = (CppEnums.MembershipType).naver == getMembershipType()
local isContentsGuildInfo = ToClient_IsContentsGroupOpen("206")
Panel_GuildWebInfo_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_GuildWebInfo)
  local aniInfo1 = Panel_GuildWebInfo:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_GuildWebInfo:GetSizeX() / 2
  aniInfo1.AxisY = Panel_GuildWebInfo:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_GuildWebInfo:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_GuildWebInfo:GetSizeX() / 2
  aniInfo2.AxisY = Panel_GuildWebInfo:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_GuildWebInfo_HideAni = function()
  -- function num : 0_1
  Panel_GuildWebInfo:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_GuildWebInfo, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = (UI.getChildControl)(Panel_GuildWebInfo, "Button_Close")
local _btnHelp = ((UI.getChildControl)(Panel_GuildWebInfo, "Button_Question"))
local _Web = nil
local isShowGuildWebInfo = false
do
  local webSizeY = 630
  Panel_GuildWebInfo_Initialize = function()
  -- function num : 0_2 , upvalues : _Web, webSizeY
  _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_GuildWebInfo, "WebControl_GuildWebInfo_WebLink")
  _Web:SetShow(true)
  _Web:SetPosX(43)
  _Web:SetPosY(63)
  _Web:SetSize(870, webSizeY)
  _Web:ResetUrl()
  registerEvent("FromClient_GuildWebInfoByName", "FGlobal_GuildWebInfoByName_Open")
end

  Panel_GuildWebInfo_Initialize()
  FGlobal_GuildWebInfo_Open = function(listIdx)
  -- function num : 0_3 , upvalues : isContentsGuildInfo, isNaver, GST, gameServiceType, _Web, webSizeY
  if not isContentsGuildInfo then
    return 
  end
  local guildRanker = ToClient_GetGuildRankingInfoAt(listIdx)
  local GuildNo_str = tostring(guildRanker:getGuildNo_s64())
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  audioPostEvent_SystemUi(13, 6)
  local curChannelData = getCurrentChannelServerData()
  local serverNo = curChannelData._worldNo
  local url = ""
  local userNo = (selfPlayer:get()):getUserNo()
  local cryptKey = (selfPlayer:get()):getWebAuthenticKeyCryptString()
  local playerLevel = (selfPlayer:get()):getLevel()
  local characterNo_64 = selfPlayer:getCharacterNo_64()
  local characterName = selfPlayer:getOriginalName()
  local userNickName = selfPlayer:getUserNickname()
  local classType = selfPlayer:getClassType()
  local selfPlayerGuildNo_64 = tostring(selfPlayer:getGuildNo_s64())
  local isGuildMaster = false
  if selfPlayerGuildNo_64 == GuildNo_str and not (selfPlayer:get()):isGuildMaster() then
    isGuildMaster = (selfPlayer:get()):isGuildSubMaster()
  end
  local isGameMaster = ToClient_SelfPlayerIsGM()
  local guildName = guildRanker:getGuildName()
  local guildMasterName = guildRanker:getGuildMasterNickName()
  local guildPoint = guildRanker._guildAquiredPoint
  local guildRegDate = tostring(guildRanker:getGuildCreatedDate())
  local guildArea1 = ""
  local territoryKey = ""
  local territoryWarName = ""
  local territoryKeyParam = ""
  if guildRanker:getTerritoryCount() > 0 then
    for idx = 0, guildRanker:getTerritoryCount() - 1 do
      territoryKey = guildRanker:getTerritoryKeyAt(idx)
      local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(territoryKey)
      if territoryInfoWrapper ~= nil then
        guildArea1 = territoryInfoWrapper:getTerritoryName()
        local territoryComma = ","
        if territoryWarName == "" then
          territoryComma = ""
        end
        local territoryKeyParamComma = ","
        if territoryKeyParam == "" then
          territoryKeyParamComma = ""
        end
        territoryWarName = territoryWarName .. territoryComma .. guildArea1
        territoryKeyParam = territoryKeyParam .. territoryKeyParamComma .. territoryKey
      end
    end
  end
  do
    local guildArea2 = ""
    local regionKey = ""
    local siegeWarName = ""
    local regionKeyParam = ""
    if guildRanker:getSiegeCount() > 0 then
      for idx = 0, guildRanker:getSiegeCount() - 1 do
        regionKey = guildRanker:getSiegeKeyAt(idx)
        local regionInfoWrapper = getRegionInfoWrapper(regionKey)
        if regionInfoWrapper ~= nil then
          guildArea2 = regionInfoWrapper:getAreaName()
          local siegeComma = ","
          if siegeWarName == "" then
            siegeComma = ""
          end
          local regionKeyComma = ","
          if regionKeyParam == "" then
            regionKeyComma = ""
          end
          siegeWarName = siegeWarName .. siegeComma .. guildArea2
          regionKeyParam = regionKeyParam .. regionKeyComma .. regionKey
        end
      end
    end
    do
      local guildCount = guildRanker._guildMemberCount
      if isNaver == true then
        Proc_ShowMessage_Ack("�\128비중입니�\164.")
        return 
      end
      local temporaryWrapper = getTemporaryInformationWrapper()
      local worldNo = temporaryWrapper:getSelectedWorldServerNo()
      if GST.eGameServiceType_NONE == gameServiceType or GST.eGameServiceType_DEV == gameServiceType then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_DEV")
      else
        if GST.eGameServiceType_KOR_ALPHA == gameServiceType or GST.eGameServiceType_KOR_TEST == gameServiceType then
          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_ALPHA")
        else
          if GST.eGameServiceType_KOR_REAL == gameServiceType then
            url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_REAL")
          else
            if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
              if getServiceNationType() == 0 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_ALPHA_NA", "port", worldNo)
              else
                if getServiceNationType() == 1 then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_ALPHA_EU", "port", worldNo)
                end
              end
            else
              if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
                if getServiceNationType() == 0 then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_REAL_NA", "port", worldNo)
                else
                  if getServiceNationType() == 1 then
                    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_REAL_EU", "port", worldNo)
                  end
                end
              else
                if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_JP_ALPHA")
                else
                  if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                    url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_JP_REAL")
                  else
                    if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_ALPHA")
                    else
                      if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                        if isServerFixedCharge() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_REAL_P2P")
                        else
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_REAL_F2P")
                        end
                      else
                        if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_TW_ALPHA")
                        else
                          if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_TW_REAL")
                          else
                            if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                              url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_SA_ALPHA")
                            else
                              if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                                url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_SA_REAL")
                              else
                                return 
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      url = url .. "?guildNo=" .. GuildNo_str
      url = url .. "&certKey=" .. tostring(cryptKey)
      url = url .. "&userNo=" .. tostring(userNo)
      url = url .. "&level=" .. tostring(playerLevel)
      url = url .. "&characterNo=" .. tostring(characterNo_64)
      url = url .. "&characterName=" .. tostring(characterName)
      url = url .. "&userNickname=" .. tostring(userNickName)
      url = url .. "&classType=" .. tostring(classType)
      url = url .. "&isGM=" .. tostring(isGameMaster)
      url = url .. "&isMaster=" .. tostring(isGuildMaster)
      url = url .. "&guildName=" .. tostring(guildName)
      url = url .. "&guildMasterName=" .. tostring(guildMasterName)
      url = url .. "&guildPoint=" .. tostring(guildPoint)
      url = url .. "&guildRegdate=" .. guildRegDate
      url = url .. "&guildArea1=" .. tostring(territoryWarName)
      url = url .. "&territoryKey=" .. tostring(territoryKeyParam)
      url = url .. "&guildArea2=" .. tostring(siegeWarName)
      url = url .. "&regionKey=" .. tostring(regionKeyParam)
      url = url .. "&guildCount=" .. tostring(guildCount)
      FGlobal_SetCandidate()
      _Web:SetSize(870, webSizeY)
      _Web:SetUrl(870, webSizeY, url, false, true)
      _Web:SetIME(true)
      Panel_GuildWebInfo:SetPosX(getScreenSizeX() / 2 - Panel_GuildWebInfo:GetSizeX() / 2)
      Panel_GuildWebInfo:SetPosY(getScreenSizeY() / 2 - Panel_GuildWebInfo:GetSizeY() / 2)
      Panel_GuildWebInfo:SetShow(true, true)
    end
  end
end

  FGlobal_GuildWebInfoForGuildRank_Open = function(guildNo_string)
  -- function num : 0_4 , upvalues : isContentsGuildInfo, GST, gameServiceType, _Web, webSizeY
  if not isContentsGuildInfo then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  audioPostEvent_SystemUi(13, 6)
  local url = ""
  local userNo = (selfPlayer:get()):getUserNo()
  local cryptKey = (selfPlayer:get()):getWebAuthenticKeyCryptString()
  local playerLevel = (selfPlayer:get()):getLevel()
  local classType = selfPlayer:getClassType()
  local selfPlayerGuildNo_64 = tostring(selfPlayer:getGuildNo_s64())
  local isGuildMaster = false
  if selfPlayerGuildNo_64 == guildNo_string and not (selfPlayer:get()):isGuildMaster() then
    isGuildMaster = (selfPlayer:get()):isGuildSubMaster()
  end
  local isGameMaster = ToClient_SelfPlayerIsGM()
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  if GST.eGameServiceType_NONE == gameServiceType or GST.eGameServiceType_DEV == gameServiceType then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_DEV")
  else
    if GST.eGameServiceType_KOR_ALPHA == gameServiceType or GST.eGameServiceType_KOR_TEST == gameServiceType then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_ALPHA")
    else
      if GST.eGameServiceType_KOR_REAL == gameServiceType then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_REAL")
      else
        if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
          if getServiceNationType() == 0 then
            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_ALPHA_NA", "port", worldNo)
          else
            if getServiceNationType() == 1 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_ALPHA_EU", "port", worldNo)
            end
          end
        else
          if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_REAL_NA", "port", worldNo)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_REAL_EU", "port", worldNo)
              end
            end
          else
            if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
              url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_JP_ALPHA")
            else
              if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_JP_REAL")
              else
                if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_ALPHA")
                else
                  if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                    if isServerFixedCharge() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_REAL_P2P")
                    else
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_REAL_F2P")
                    end
                  else
                    if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_TW_ALPHA")
                    else
                      if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_TW_REAL")
                      else
                        return 
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  url = url .. "?guildNo=" .. guildNo_string
  url = url .. "&certKey=" .. tostring(cryptKey)
  url = url .. "&level=" .. tostring(playerLevel)
  url = url .. "&classType=" .. tostring(classType)
  url = url .. "&isGM=" .. tostring(isGameMaster)
  url = url .. "&isMaster=" .. tostring(isGuildMaster)
  url = url .. "&userNo=" .. tostring(userNo)
  FGlobal_SetCandidate()
  _Web:SetSize(870, webSizeY)
  _Web:SetUrl(870, webSizeY, url, false, true)
  _Web:SetIME(true)
  Panel_GuildWebInfo:SetPosX(getScreenSizeX() / 2 - Panel_GuildWebInfo:GetSizeX() / 2)
  Panel_GuildWebInfo:SetPosY(getScreenSizeY() / 2 - Panel_GuildWebInfo:GetSizeY() / 2)
  Panel_GuildWebInfo:SetShow(true, true)
end

  FGlobal_GuildWebInfoByName_Open = function()
  -- function num : 0_5 , upvalues : isContentsGuildInfo, isNaver, GST, gameServiceType, _Web, webSizeY
  if not isContentsGuildInfo then
    return 
  end
  local guildWebInfo = ToClient_GetGuildWebInfo()
  local GuildNo_str = tostring(guildWebInfo:getGuildNo())
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  audioPostEvent_SystemUi(13, 6)
  local curChannelData = getCurrentChannelServerData()
  local serverNo = curChannelData._worldNo
  local url = ""
  local userNo = (selfPlayer:get()):getUserNo()
  local cryptKey = (selfPlayer:get()):getWebAuthenticKeyCryptString()
  local playerLevel = (selfPlayer:get()):getLevel()
  local characterNo_64 = selfPlayer:getCharacterNo_64()
  local characterName = selfPlayer:getOriginalName()
  local classType = selfPlayer:getClassType()
  local selfPlayerGuildNo_64 = tostring(selfPlayer:getGuildNo_s64())
  local isGuildMaster = false
  if selfPlayerGuildNo_64 == GuildNo_str and not (selfPlayer:get()):isGuildMaster() then
    isGuildMaster = (selfPlayer:get()):isGuildSubMaster()
  end
  local isGameMaster = ToClient_SelfPlayerIsGM()
  local guildNo = guildWebInfo:getGuildNo()
  local guildName = guildWebInfo:getGuildName()
  local guildMasterName = guildWebInfo:getGuildMasterNickName()
  local guildPoint = guildWebInfo:getGuildPoint()
  local guildRegDate = tostring(guildWebInfo:getGuildCreatedDate())
  local guildMemberCount = guildWebInfo:getGuildMemberCount()
  local guildRanking = guildWebInfo:getGuildRanking()
  local guildArea1 = ""
  local territoryKey = ""
  local territoryWarName = ""
  local territoryKeyParam = ""
  if guildWebInfo:getTerritoryCount() > 0 then
    for idx = 0, guildWebInfo:getTerritoryCount() - 1 do
      territoryKey = guildWebInfo:getTerritoryKeyAt(idx)
      local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(territoryKey)
      if territoryInfoWrapper ~= nil then
        guildArea1 = territoryInfoWrapper:getTerritoryName()
        local territoryComma = ","
        if territoryWarName == "" then
          territoryComma = ""
        end
        local territoryKeyParamComma = ","
        if territoryKeyParam == "" then
          territoryKeyParamComma = ""
        end
        territoryWarName = territoryWarName .. territoryComma .. guildArea1
        territoryKeyParam = territoryKeyParam .. territoryKeyParamComma .. territoryKey
      end
    end
  end
  do
    local guildArea2 = ""
    local regionKey = ""
    local siegeWarName = ""
    local regionKeyParam = ""
    if guildWebInfo:getRegionCount() > 0 then
      for idx = 0, guildWebInfo:getRegionCount() - 1 do
        regionKey = guildWebInfo:getRegionKeyAt(idx)
        local regionInfoWrapper = getRegionInfoWrapper(regionKey)
        if regionInfoWrapper ~= nil then
          guildArea2 = regionInfoWrapper:getAreaName()
          local siegeComma = ","
          if siegeWarName == "" then
            siegeComma = ""
          end
          local regionKeyComma = ","
          if regionKeyParam == "" then
            regionKeyComma = ""
          end
          siegeWarName = siegeWarName .. siegeComma .. guildArea2
          regionKeyParam = regionKeyParam .. regionKeyComma .. regionKey
        end
      end
    end
    do
      local guildCount = guildWebInfo:getGuildMemberCount()
      if isNaver == true then
        Proc_ShowMessage_Ack("�\128비중입니�\164.")
        return 
      end
      local temporaryWrapper = getTemporaryInformationWrapper()
      local worldNo = temporaryWrapper:getSelectedWorldServerNo()
      if GST.eGameServiceType_NONE == gameServiceType or GST.eGameServiceType_DEV == gameServiceType then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_DEV")
      else
        if GST.eGameServiceType_KOR_ALPHA == gameServiceType or GST.eGameServiceType_KOR_TEST == gameServiceType then
          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_ALPHA")
        else
          if GST.eGameServiceType_KOR_REAL == gameServiceType then
            url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_REAL")
          else
            if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
              if getServiceNationType() == 0 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_ALPHA_NA", "port", worldNo)
              else
                if getServiceNationType() == 1 then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_ALPHA_EU", "port", worldNo)
                end
              end
            else
              if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
                if getServiceNationType() == 0 then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_REAL_NA", "port", worldNo)
                else
                  if getServiceNationType() == 1 then
                    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_REAL_EU", "port", worldNo)
                  end
                end
              else
                if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_JP_ALPHA")
                else
                  if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                    url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_JP_REAL")
                  else
                    if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_ALPHA")
                    else
                      if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                        if isServerFixedCharge() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_REAL_P2P")
                        else
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_REAL_F2P")
                        end
                      else
                        if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_TW_ALPHA")
                        else
                          if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_TW_REAL")
                          else
                            return 
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      url = url .. "?guildNo=" .. GuildNo_str
      url = url .. "&certKey=" .. tostring(cryptKey)
      url = url .. "&userNo=" .. tostring(userNo)
      url = url .. "&level=" .. tostring(playerLevel)
      url = url .. "&characterNo=" .. tostring(characterNo_64)
      url = url .. "&characterName=" .. tostring(characterName)
      url = url .. "&userNickname=" .. tostring(userNickName)
      url = url .. "&classType=" .. tostring(classType)
      url = url .. "&isGM=" .. tostring(isGameMaster)
      url = url .. "&isMaster=" .. tostring(isGuildMaster)
      url = url .. "&guildName=" .. tostring(guildName)
      url = url .. "&guildMasterName=" .. tostring(guildMasterName)
      url = url .. "&guildPoint=" .. tostring(guildPoint)
      url = url .. "&guildRegdate=" .. guildRegDate
      url = url .. "&guildArea1=" .. tostring(territoryWarName)
      url = url .. "&territoryKey=" .. tostring(territoryKeyParam)
      url = url .. "&guildArea2=" .. tostring(siegeWarName)
      url = url .. "&regionKey=" .. tostring(regionKeyParam)
      url = url .. "&guildCount=" .. tostring(guildCount)
      FGlobal_SetCandidate()
      _Web:SetSize(870, webSizeY)
      _Web:SetUrl(870, webSizeY, url, false, true)
      _Web:SetIME(true)
      Panel_GuildWebInfo:SetPosX(getScreenSizeX() / 2 - Panel_GuildWebInfo:GetSizeX() / 2)
      Panel_GuildWebInfo:SetPosY(getScreenSizeY() / 2 - Panel_GuildWebInfo:GetSizeY() / 2)
      Panel_GuildWebInfo:SetShow(true, true)
    end
  end
end

  FGlobal_GuildWebInfoFromGuildMain_Open = function()
  -- function num : 0_6 , upvalues : isContentsGuildInfo, isNaver, GST, gameServiceType, _Web, webSizeY
  if not isContentsGuildInfo then
    return 
  end
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local GuildNo_str = tostring(myGuildInfo:getGuildNo_s64())
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  audioPostEvent_SystemUi(13, 6)
  local curChannelData = getCurrentChannelServerData()
  local serverNo = curChannelData._worldNo
  local url = ""
  local userNo = (selfPlayer:get()):getUserNo()
  local cryptKey = (selfPlayer:get()):getWebAuthenticKeyCryptString()
  local playerLevel = (selfPlayer:get()):getLevel()
  local characterNo_64 = selfPlayer:getCharacterNo_64()
  local characterName = selfPlayer:getOriginalName()
  local userNickName = selfPlayer:getUserNickname()
  local classType = selfPlayer:getClassType()
  local selfPlayerGuildNo_64 = tostring(selfPlayer:getGuildNo_s64())
  local isGuildMaster = false
  if selfPlayerGuildNo_64 == GuildNo_str and not (selfPlayer:get()):isGuildMaster() then
    isGuildMaster = (selfPlayer:get()):isGuildSubMaster()
  end
  local isGameMaster = ToClient_SelfPlayerIsGM()
  local guildName = myGuildInfo:getName()
  local guildMasterName = myGuildInfo:getGuildMasterName()
  local guildPoint = myGuildInfo:getAquiredSkillPoint()
  local guildRegDate = tostring(myGuildInfo:getGuildCreatedDate())
  local guildArea1 = ""
  local territoryKey = ""
  local territoryWarName = ""
  local territoryKeyParam = ""
  if myGuildInfo:getTerritoryCount() > 0 then
    for idx = 0, myGuildInfo:getTerritoryCount() - 1 do
      territoryKey = myGuildInfo:getTerritoryKeyAt(idx)
      local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(territoryKey)
      if territoryInfoWrapper ~= nil then
        guildArea1 = territoryInfoWrapper:getTerritoryName()
        local territoryComma = ","
        if territoryWarName == "" then
          territoryComma = ""
        end
        local territoryKeyParamComma = ","
        if territoryKeyParam == "" then
          territoryKeyParamComma = ""
        end
        territoryWarName = territoryWarName .. territoryComma .. guildArea1
        territoryKeyParam = territoryKeyParam .. territoryKeyParamComma .. territoryKey
      end
    end
  end
  do
    local guildArea2 = ""
    local regionKey = ""
    local siegeWarName = ""
    local regionKeyParam = ""
    if myGuildInfo:getSiegeCount() > 0 then
      for idx = 0, myGuildInfo:getSiegeCount() - 1 do
        regionKey = myGuildInfo:getSiegeKeyAt(idx)
        local regionInfoWrapper = getRegionInfoWrapper(regionKey)
        if regionInfoWrapper ~= nil then
          guildArea2 = regionInfoWrapper:getAreaName()
          local siegeComma = ","
          if siegeWarName == "" then
            siegeComma = ""
          end
          local regionKeyComma = ","
          if regionKeyParam == "" then
            regionKeyComma = ""
          end
          siegeWarName = siegeWarName .. siegeComma .. guildArea2
          regionKeyParam = regionKeyParam .. regionKeyComma .. regionKey
        end
      end
    end
    do
      local guildCount = myGuildInfo:getMemberCount()
      if isNaver == true then
        Proc_ShowMessage_Ack("�\128비중입니�\164.")
        return 
      end
      local temporaryWrapper = getTemporaryInformationWrapper()
      local worldNo = temporaryWrapper:getSelectedWorldServerNo()
      if GST.eGameServiceType_NONE == gameServiceType or GST.eGameServiceType_DEV == gameServiceType then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_DEV")
      else
        if GST.eGameServiceType_KOR_ALPHA == gameServiceType or GST.eGameServiceType_KOR_TEST == gameServiceType then
          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_ALPHA")
        else
          if GST.eGameServiceType_KOR_REAL == gameServiceType then
            url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_KOR_REAL")
          else
            if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
              if getServiceNationType() == 0 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_ALPHA_NA", "port", worldNo)
              else
                if getServiceNationType() == 1 then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_ALPHA_EU", "port", worldNo)
                end
              end
            else
              if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
                if getServiceNationType() == 0 then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_REAL_NA", "port", worldNo)
                else
                  if getServiceNationType() == 1 then
                    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_NA_REAL_EU", "port", worldNo)
                  end
                end
              else
                if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_JP_ALPHA")
                else
                  if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                    url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_JP_REAL")
                  else
                    if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_ALPHA")
                    else
                      if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                        if isServerFixedCharge() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_REAL_P2P")
                        else
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_RUS_REAL_F2P")
                        end
                      else
                        if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_TW_ALPHA")
                        else
                          if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWEBINFO_URL_TW_REAL")
                          else
                            return 
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      url = url .. "?guildNo=" .. GuildNo_str
      url = url .. "&certKey=" .. tostring(cryptKey)
      url = url .. "&userNo=" .. tostring(userNo)
      url = url .. "&level=" .. tostring(playerLevel)
      url = url .. "&characterNo=" .. tostring(characterNo_64)
      url = url .. "&characterName=" .. tostring(characterName)
      url = url .. "&userNickname=" .. tostring(userNickName)
      url = url .. "&classType=" .. tostring(classType)
      url = url .. "&isGM=" .. tostring(isGameMaster)
      url = url .. "&isMaster=" .. tostring(isGuildMaster)
      url = url .. "&guildName=" .. tostring(guildName)
      url = url .. "&guildMasterName=" .. tostring(guildMasterName)
      url = url .. "&guildPoint=" .. tostring(guildPoint)
      url = url .. "&guildRegdate=" .. guildRegDate
      url = url .. "&guildArea1=" .. tostring(territoryWarName)
      url = url .. "&territoryKey=" .. tostring(territoryKeyParam)
      url = url .. "&guildArea2=" .. tostring(siegeWarName)
      url = url .. "&regionKey=" .. tostring(regionKeyParam)
      url = url .. "&guildCount=" .. tostring(guildCount)
      FGlobal_SetCandidate()
      _Web:SetSize(870, webSizeY)
      _Web:SetUrl(870, webSizeY, url, false, true)
      _Web:SetIME(true)
      Panel_GuildWebInfo:SetPosX(getScreenSizeX() / 2 - Panel_GuildWebInfo:GetSizeX() / 2)
      Panel_GuildWebInfo:SetPosY(getScreenSizeY() / 2 - Panel_GuildWebInfo:GetSizeY() / 2)
      Panel_GuildWebInfo:SetShow(true, true)
    end
  end
end

  GuildWebInfo_Close = function()
  -- function num : 0_7 , upvalues : _Web, IM
  FGlobal_ClearCandidate()
  _Web:ResetUrl()
  ClearFocusEdit()
  audioPostEvent_SystemUi(13, 5)
  Panel_GuildWebInfo:SetShow(false, false)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

  FGlobal_GuildWebInfoClose = function()
  -- function num : 0_8
  GuildWebInfo_Close()
end

  HandleClicked_GuildWebInfo_Close = function()
  -- function num : 0_9
  GuildWebInfo_Close()
end

  _btn_Close:addInputEvent("Mouse_LUp", "HandleClicked_GuildWebInfo_Close()")
  _btnHelp:SetShow(false)
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

