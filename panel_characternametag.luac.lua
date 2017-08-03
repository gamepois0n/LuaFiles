-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\characternametag\panel_characternametag.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_AV = CppEnums.PA_UI_ALIGNVERTICAL
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_classType = CppEnums.ClassType
local ActorProxyType = {isActorProxy = 0, isCharacter = 1, isPlayer = 2, isSelfPlayer = 3, isOtherPlayer = 4, isAlterego = 5, isMonster = 6, isNpc = 7, isDeadBody = 8, isVehicle = 9, isGate = 10, isHouseHold = 11, isInstallationActor = 12, isCollect = 13, isInstanceObject = 14}
local actorProxyBufferSize = {[ActorProxyType.isSelfPlayer] = 1, [ActorProxyType.isOtherPlayer] = 300, [ActorProxyType.isMonster] = 150, [ActorProxyType.isNpc] = 100, [ActorProxyType.isVehicle] = 50, [ActorProxyType.isHouseHold] = 30, [ActorProxyType.isInstallationActor] = 25, [ActorProxyType.isInstanceObject] = 50}
local actorProxyCapacitySize = {[ActorProxyType.isSelfPlayer] = 1, [ActorProxyType.isOtherPlayer] = 50, [ActorProxyType.isMonster] = 25, [ActorProxyType.isNpc] = 25, [ActorProxyType.isVehicle] = 20, [ActorProxyType.isHouseHold] = 5, [ActorProxyType.isInstallationActor] = 2, [ActorProxyType.isInstanceObject] = 4}
local basePanel = {[ActorProxyType.isSelfPlayer] = Panel_Copy_SelfPlayer, [ActorProxyType.isOtherPlayer] = Panel_Copy_OtherPlayer, [ActorProxyType.isMonster] = Panel_Copy_Monster, [ActorProxyType.isNpc] = Panel_Copy_Npc, [ActorProxyType.isVehicle] = Panel_Copy_Vehicle, [ActorProxyType.isHouseHold] = Panel_Copy_HouseHold, [ActorProxyType.isInstallationActor] = Panel_Copy_Installation, [ActorProxyType.isInstanceObject] = Panel_Copy_Installation}
local lifeContentCount = 14
if ToClient_IsConferenceMode() then
  lifeContentCount = 0
else
  lifeContentCount = 14
end
local lifeContent = {gathering = 0, fishing = 1, hunting = 2, cook = 3, alchemy = 4, manufacture = 5, horse = 6, trade = 7, growth = 8, sail = 9, combat = 10, money = 11, battleField = 12, match = 13}
local lifeRankSetTexture = {}
for i = 0, lifeContentCount - 1 do
  lifeRankSetTexture[i] = {}
end
if lifeContentCount > 0 then
  for index = 0, lifeContentCount - 1 do
    for rankIndex = 1, 5 do
      -- DECOMPILER ERROR at PC137: Confused about usage of register: R22 in 'UnsetPending'

      (lifeRankSetTexture[index])[rankIndex] = {x1, y1, x2, y2}
      -- DECOMPILER ERROR at PC142: Confused about usage of register: R22 in 'UnsetPending'

      ;
      ((lifeRankSetTexture[index])[rankIndex]).x1 = 2 + index * 38
      -- DECOMPILER ERROR at PC148: Confused about usage of register: R22 in 'UnsetPending'

      ;
      ((lifeRankSetTexture[index])[rankIndex]).y1 = 2 + (rankIndex - 1) * 34
      -- DECOMPILER ERROR at PC153: Confused about usage of register: R22 in 'UnsetPending'

      ;
      ((lifeRankSetTexture[index])[rankIndex]).x2 = 39 + index * 38
      -- DECOMPILER ERROR at PC159: Confused about usage of register: R22 in 'UnsetPending'

      ;
      ((lifeRankSetTexture[index])[rankIndex]).y2 = 35 + (rankIndex - 1) * 34
    end
  end
end
do
  local init = function()
  -- function num : 0_0 , upvalues : ActorProxyType, basePanel, actorProxyBufferSize, actorProxyCapacitySize
  for _,value in pairs(ActorProxyType) do
    if basePanel[value] then
      ToClient_SetNameTagPanel(value, basePanel[value])
      if actorProxyBufferSize[value] ~= nil and actorProxyCapacitySize[value] ~= nil then
        ToClient_InitializeOverHeadPanelPool(value, actorProxyBufferSize[value], actorProxyCapacitySize[value])
      end
    end
  end
end

  init()
  local getControlProperty = function(panel, index)
  -- function num : 0_1
  if index == (CppEnums.SpawnType).eSpawnType_SkillTrainer then
    return (UI.getChildControl)(panel, "Static_Skill")
  else
    if index == (CppEnums.SpawnType).eSpawnType_ShopMerchant then
      return (UI.getChildControl)(panel, "Static_Store")
    else
      if index == (CppEnums.SpawnType).eSpawnType_Potion then
        return (UI.getChildControl)(panel, "Static_Store")
      else
        if index == (CppEnums.SpawnType).eSpawnType_Weapon then
          return (UI.getChildControl)(panel, "Static_Store")
        else
          if index == (CppEnums.SpawnType).eSpawnType_Jewel then
            return (UI.getChildControl)(panel, "Static_Store")
          else
            if index == (CppEnums.SpawnType).eSpawnType_Furniture then
              return (UI.getChildControl)(panel, "Static_Store")
            else
              if index == (CppEnums.SpawnType).eSpawnType_Collect then
                return (UI.getChildControl)(panel, "Static_Store")
              else
                if index == (CppEnums.SpawnType).eSpawnType_Fish then
                  return (UI.getChildControl)(panel, "Static_Store")
                else
                  if index == (CppEnums.SpawnType).eSpawnType_Worker then
                    return (UI.getChildControl)(panel, "Static_Store")
                  else
                    if index == (CppEnums.SpawnType).eSpawnType_Alchemy then
                      return (UI.getChildControl)(panel, "Static_Store")
                    else
                      if index == (CppEnums.SpawnType).eSpawnType_Stable then
                        return (UI.getChildControl)(panel, "Static_Stable")
                      else
                        if index == (CppEnums.SpawnType).eSpawnType_WareHouse then
                          return (UI.getChildControl)(panel, "Static_WareHouse")
                        else
                          if index == (CppEnums.SpawnType).eSpawnType_auction then
                            return (UI.getChildControl)(panel, "Static_Auction")
                          else
                            if index == (CppEnums.SpawnType).eSpawnType_inn then
                              return (UI.getChildControl)(panel, "Static_Inn")
                            else
                              if index == (CppEnums.SpawnType).eSpawnType_guild then
                                return (UI.getChildControl)(panel, "Static_Guild")
                              else
                                if index == (CppEnums.SpawnType).eSpawnType_intimacy then
                                  return (UI.getChildControl)(panel, "Static_Intimacy")
                                else
                                  return nil
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
      end
    end
  end
end

  local sortCenterX = function(insertedArray)
  -- function num : 0_2
  local size = {}
  local fullSize = 0
  local scaleBuffer = nil
  for key,value in pairs(insertedArray) do
    if value:GetShow() then
      scaleBuffer = value:GetScale()
      value:SetScale(1, 1)
      local aSize = value:GetSizeX()
      size[key] = aSize
      fullSize = fullSize + aSize
    end
  end
  local leftSize = -(fullSize) / 2
  for key,value in pairs(insertedArray) do
    if value:GetShow() then
      leftSize = leftSize + size[key] / 2
      value:SetSpanSize(leftSize, (value:GetSpanSize()).y)
      value:SetScale(scaleBuffer.x, scaleBuffer.y)
      leftSize = leftSize + size[key] / 2
    end
  end
end

  local guildMarkInit = function(guildMark)
  -- function num : 0_3
  guildMark:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(guildMark, 183, 1, 188, 6)
  ;
  (guildMark:getBaseTexture()):setUV(x1, y1, x2, y2)
  guildMark:setRenderTexture(guildMark:getBaseTexture())
end

  local monsterLevelNameColor = {4287993237, 4285643008, 4287816466, 4290966896, 4292540333, 4294967295, 4294954702, 4294943137, 4294927717, 4294901760, 4287579626}
  local monsterLevelNameColorText = {"FF959595", "FF71B900", "FF92E312", "FFC2F570", "FFDAF7AD", "FFFFFFFF", "FFFFCECE", "FFFFA1A1", "FFFF6565", "FFFF0000", "FF8F45EA"}
  local playerlevelColor = {"FFC8FFC8", "FFC8FFC8", "FFFFFFFF", "FFFFE8BB", "FFFFC960", "FFFFAD10", "FFFF8A00", "FFFF6C00", "FFFF4E00", "FFE10000"}
  local getColorBySelfPlayerLevel = function(level)
  -- function num : 0_4 , upvalues : playerlevelColor
  if level < 0 then
    return playerlevelColor[1]
  else
    if level >= 100 then
      return playerlevelColor[10]
    else
      return playerlevelColor[(math.floor)(level / 10) + 1]
    end
  end
end

  local getColorByMonsterLevel = function(playerLevel, monsterLevel)
  -- function num : 0_5 , upvalues : monsterLevelNameColorText
  local levelDiff = monsterLevel - playerLevel + 6
  levelDiff = (math.max)(levelDiff, 1)
  levelDiff = (math.min)(levelDiff, 11)
  return monsterLevelNameColorText[levelDiff]
end

  local setMonsterNameColor = function(playerLevel, monsterLevel, nameStatic, isDarkSpiritMonster)
  -- function num : 0_6 , upvalues : monsterLevelNameColor
  if isDarkSpiritMonster then
    nameStatic:SetFontColor((Defines.Color).C_FF6A0000)
    return 
  end
  local levelDiff = monsterLevel - playerLevel + 6
  levelDiff = (math.max)(levelDiff, 1)
  levelDiff = (math.min)(levelDiff, 11)
  nameStatic:SetFontColor(monsterLevelNameColor[levelDiff])
end

  local hideTimeType = {overHeadUI = 0, preemptiveStrike = 1, bubbleBox = 2, murdererEnd = 3}
  local myMilitiaTeamNo = function()
  -- function num : 0_7
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return -1
  end
  local selfProxy = selfPlayer:get()
  local myTeamNo = selfProxy:getVolunteerTeamNoForLua()
  if myTeamNo >= 1000 then
    return 1
  else
    if myTeamNo >= 100 then
      return 0
    else
      return -1
    end
  end
end

  local settingName = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_8 , upvalues : myMilitiaTeamNo
  local nameTag = nil
  local actorProxy = actorProxyWrapper:get()
  if actorProxy == nil then
    return 
  end
  if actorProxy:isKingOrLordTent() then
    nameTag = (UI.getChildControl)(targetPanel, "KingsCharacterName")
  else
    if actorProxy:isLargeHpBarCharacter() then
      return 
    else
      nameTag = (UI.getChildControl)(targetPanel, "CharacterName")
    end
  end
  if nameTag == nil then
    return 
  end
  local characterActorProxyWrapper = getCharacterActor(actorKeyRaw)
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  local isShowForAlli = false
  if actorProxy:isPlayer() and (playerActorProxyWrapper:get()):isHideCharacterName() == true and (playerActorProxyWrapper:get()):isShowNameWhenCamouflage() == true and (getSelfPlayer()):getActorKey() ~= playerActorProxyWrapper:getActorKey() then
    isShowForAlli = true
  end
  -- DECOMPILER ERROR at PC89: Unhandled construct in 'MakeBoolean' P3

  if (actorProxy:isPlayer() and (characterActorProxyWrapper:get()):isClientAI()) or not actorProxy:isHiddenName() or actorProxy:isVehicle() ~= false or isShowForAlli == true then
    nameTag:SetShow(false)
    return 
  end
  if actorProxy:isPlayer() then
    local militiaIcon = (UI.getChildControl)(targetPanel, "Static_MilitiaIcon")
    local militiaTeamNo = actorProxy:getVolunteerTeamNoForLua()
    -- DECOMPILER ERROR at PC110: Unhandled construct in 'MakeBoolean' P1

    if militiaTeamNo >= 1000 and playerActorProxyWrapper ~= nil then
      local isMilitia = (playerActorProxyWrapper:get()):isVolunteer()
      if isMilitia then
        militiaIcon:SetShow(true)
        militiaIcon:ChangeTextureInfoName("New_UI_Common_forLua/Window/PvP/Militia_01.dds")
        if myMilitiaTeamNo() == 0 then
          local x1, y1, x2, y2 = setTextureUV_Func(militiaIcon, 160, 193, 195, 235)
          ;
          (militiaIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
        else
          do
            do
              do
                local x1, y1, x2, y2 = setTextureUV_Func(militiaIcon, 88, 193, 123, 235)
                ;
                (militiaIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
                militiaIcon:setRenderTexture(militiaIcon:getBaseTexture())
                nameTag:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERNAMETAG_MILITIADEFFENCE"))
                nameTag:SetShow(true)
                do return  end
                -- DECOMPILER ERROR at PC177: Unhandled construct in 'MakeBoolean' P1

                if militiaTeamNo >= 100 and playerActorProxyWrapper ~= nil then
                  local isMilitia = (playerActorProxyWrapper:get()):isVolunteer()
                  if isMilitia then
                    militiaIcon:SetShow(true)
                    militiaIcon:ChangeTextureInfoName("New_UI_Common_forLua/Window/PvP/Militia_01.dds")
                    if myMilitiaTeamNo() == 0 then
                      local x1, y1, x2, y2 = setTextureUV_Func(militiaIcon, 196, 193, 231, 235)
                      ;
                      (militiaIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
                    else
                      do
                        do
                          do
                            do
                              local x1, y1, x2, y2 = setTextureUV_Func(militiaIcon, 124, 193, 159, 235)
                              ;
                              (militiaIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
                              militiaIcon:setRenderTexture(militiaIcon:getBaseTexture())
                              nameTag:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERNAMETAG_MILITIAATTACK"))
                              nameTag:SetShow(true)
                              do return  end
                              militiaIcon:SetShow(false)
                              if actorProxy:isHouseHold() then
                                local houseActorWarpper = getHouseHoldActor(actorKeyRaw)
                                local isMine = (houseActorWarpper:get()):isOwnedBySelfPlayer()
                                local isMyGuild = (houseActorWarpper:get()):isOwnedBySelfPlayerGuild()
                                local isPersonalTent = (houseActorWarpper:get()):isPersonalTent()
                                local isSiegeTent = (houseActorWarpper:get()):isKingOrLordTent()
                                if isMine and isPersonalTent then
                                  local tentWrapper = (getTemporaryInformationWrapper()):getSelfTentWrapperByActorKeyRaw(actorKeyRaw)
                                  if tentWrapper ~= nil then
                                    local expireTime = tentWrapper:getSelfTentExpiredTime_s64()
                                    local lefttimeText = convertStringFromDatetime(getLeftSecond_TTime64(expireTime))
                                    textName = getHouseHoldName(actorProxy)
                                    targetPanel:Set3DRotationY(actorProxy:getRotation())
                                  end
                                else
                                  do
                                    if isMyGuild and isSiegeTent then
                                      local expireTime = (houseActorWarpper:get()):getExpiredTime()
                                      local lefttimeText = convertStringFromDatetime(getLeftSecond_TTime64(expireTime))
                                      local builddingInfo = ToClient_getBuildingInfo(actorKeyRaw)
                                      local buildProgress = builddingInfo:getBuildingProgress()
                                      textName = getHouseHoldName(actorProxy)
                                      targetPanel:Set3DRotationY(actorProxy:getRotation())
                                    else
                                      do
                                        do
                                          textName = getHouseHoldName(actorProxy)
                                          targetPanel:Set3DRotationY(actorProxy:getRotation())
                                          if actorProxy:isInstallationActor() then
                                            textName = actorProxy:getStaticStatusName()
                                            local installationActorWrapper = getInstallationActor(actorKeyRaw)
                                            if toInt64(0, 0) ~= installationActorWrapper:getOwnerHouseholdNo_s64() and installationActorWrapper:isHavestInstallation() then
                                              local rate = installationActorWrapper:getHarvestTotalGrowRate() * 100
                                              if rate < 0 then
                                                rate = 0
                                              end
                                              textName = (installationActorWrapper:get()):getStaticStatusName() .. " - (<PAColor0xFFffd429>" .. tostring((math.floor)(rate)) .. "%<PAOldColor>)"
                                            end
                                          else
                                            do
                                              if isNpcWorker(actorProxy) then
                                                textName = getNpcWorkerOwnerName(actorProxy)
                                              else
                                                if actorProxy:isSelfPlayer() then
                                                  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
                                                  if (playerActorProxyWrapper:get()):isFlashBanged() == false and (playerActorProxyWrapper:get()):isHideCharacterName() == false and (playerActorProxyWrapper:get()):isEquipCamouflage() == true and playerActorProxyWrapper:getGuildNo_s64() == (getSelfPlayer()):getGuildNo_s64() then
                                                    nameTag:SetMonoTone(true)
                                                  else
                                                    if (playerActorProxyWrapper:get()):isFlashBanged() == false and (playerActorProxyWrapper:get()):isConcealCharacter() == true then
                                                      nameTag:SetMonoTone(true)
                                                    else
                                                      nameTag:SetMonoTone(false)
                                                    end
                                                  end
                                                  local level = (playerActorProxyWrapper:get()):getLevel()
                                                  textName = playerActorProxyWrapper:getName()
                                                else
                                                  do
                                                    if actorProxy:isPlayer() then
                                                      local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
                                                      if (playerActorProxyWrapper:get()):isFlashBanged() == false and (playerActorProxyWrapper:get()):isHideCharacterName() == false and (playerActorProxyWrapper:get()):isEquipCamouflage() == true and playerActorProxyWrapper:getGuildNo_s64() == (getSelfPlayer()):getGuildNo_s64() then
                                                        nameTag:SetMonoTone(true)
                                                      else
                                                        if (playerActorProxyWrapper:get()):isFlashBanged() == false and (playerActorProxyWrapper:get()):isConcealCharacter() == true then
                                                          nameTag:SetMonoTone(true)
                                                        else
                                                          nameTag:SetMonoTone(false)
                                                        end
                                                      end
                                                      local level = (playerActorProxyWrapper:get()):getLevel()
                                                      local selfPlayerLevel = ((getSelfPlayer()):get()):getLevel()
                                                      textName = actorProxyWrapper:getName()
                                                    else
                                                      do
                                                        if actorProxy:isInstanceObject() then
                                                          if ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isTrap() then
                                                            nameTag:SetShow(false)
                                                            return 
                                                          end
                                                          textName = actorProxyWrapper:getName()
                                                        else
                                                          if actorProxy:isNpc() then
                                                            textName = actorProxyWrapper:getName()
                                                            local isFusionCore = (actorProxy:getCharacterStaticStatus()):isFusionCore()
                                                            if isFusionCore == true then
                                                              local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
                                                              if npcActorProxyWrapper:getTeamNo_s64() == (getSelfPlayer()):getTeamNo_s64() then
                                                                textName = textName
                                                              else
                                                                textName = ""
                                                              end
                                                            end
                                                          else
                                                            do
                                                              textName = actorProxyWrapper:getName()
                                                              nameTag:SetText(textName)
                                                              nameTag:SetShow(true)
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
        end
      end
    end
  end
end

  local settingAlias = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_9
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  if playerActorProxyWrapper == nil then
    return 
  end
  local aliasInfo = (UI.getChildControl)(targetPanel, "CharacterAlias")
  if aliasInfo == nil then
    return 
  end
  local actorProxy = playerActorProxyWrapper:get()
  if actorProxy == nil then
    return 
  end
  if actorProxy:isPlayer() then
    local militiaTeamNo = actorProxy:getVolunteerTeamNoForLua()
    local isMilitia = actorProxy:isVolunteer()
    if militiaTeamNo > 0 and isMilitia == true then
      aliasInfo:SetShow(false)
      return 
    end
  end
  do
    if actorProxy:isPlayer() then
      if playerActorProxyWrapper:checkToTitleKey() then
        aliasInfo:SetText(playerActorProxyWrapper:getTitleName())
        if (playerActorProxyWrapper:get()):isFlashBanged() == false and (playerActorProxyWrapper:get()):isHideCharacterName() == false and (playerActorProxyWrapper:get()):isEquipCamouflage() == true and playerActorProxyWrapper:getGuildNo_s64() == (getSelfPlayer()):getGuildNo_s64() then
          aliasInfo:SetMonoTone(true)
        else
          if (playerActorProxyWrapper:get()):isFlashBanged() == false and (playerActorProxyWrapper:get()):isConcealCharacter() == true then
            aliasInfo:SetMonoTone(true)
          else
            aliasInfo:SetMonoTone(false)
          end
        end
        local isShowForAlli = false
        if actorProxy:isHideCharacterName() == true and actorProxy:isShowNameWhenCamouflage() == true and (getSelfPlayer()):getActorKey() ~= playerActorProxyWrapper:getActorKey() then
          isShowForAlli = true
        end
        if (actorProxy:isHideCharacterName() and actorProxy:isFlashBanged() == false) or isShowForAlli == true then
          aliasInfo:SetShow(false)
        else
          local titleColor = 4282695908
          if playerActorProxyWrapper:isExistTitleColor() then
            titleColor = playerActorProxyWrapper:getTitleColorValue()
          end
          aliasInfo:SetShow(true)
          aliasInfo:SetFontColor(titleColor)
          aliasInfo:useGlowFont(true, "BaseFont_10_Glow", 4278456421)
        end
      else
        do
          aliasInfo:SetShow(false)
          aliasInfo:SetShow(false)
        end
      end
    end
  end
end

  local settingTitle = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_10
  local actorProxy = actorProxyWrapper:get()
  if actorProxy:isPlayer() == false and actorProxy:isMonster() == false and actorProxy:isNpc() == false then
    return 
  end
  local nickName = (UI.getChildControl)(targetPanel, "CharacterTitle")
  if nickName == nil then
    return 
  end
  nickName:SetShow(false)
  if actorProxy:isPlayer() then
    local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
    if playerActorProxyWrapper == nil then
      return 
    end
    local militiaTeamNo = actorProxy:getVolunteerTeamNoForLua()
    local isMilitia = (playerActorProxyWrapper:get()):isVolunteer()
    if militiaTeamNo > 0 and isMilitia == true then
      nickName:SetShow(false)
      return 
    end
    if (playerActorProxyWrapper:get()):isFlashBanged() == false and (playerActorProxyWrapper:get()):isHideCharacterName() == false and (playerActorProxyWrapper:get()):isEquipCamouflage() == true and playerActorProxyWrapper:getGuildNo_s64() == (getSelfPlayer()):getGuildNo_s64() then
      nickName:SetMonoTone(true)
    else
      if (playerActorProxyWrapper:get()):isFlashBanged() == false and (playerActorProxyWrapper:get()):isConcealCharacter() == true then
        nickName:SetMonoTone(true)
      else
        nickName:SetMonoTone(false)
      end
    end
    local isShowForAlli = false
    if (playerActorProxyWrapper:get()):isHideCharacterName() == true and (playerActorProxyWrapper:get()):isShowNameWhenCamouflage() == true and (getSelfPlayer()):getActorKey() ~= playerActorProxyWrapper:getActorKey() then
      isShowForAlli = true
    end
    if ((playerActorProxyWrapper:get()):isHideCharacterName() and (playerActorProxyWrapper:get()):isFlashBanged() == false) or isShowForAlli == true then
      return 
    end
    local vectorC = {x, y, z, w}
    vectorC = playerActorProxyWrapper:getAllyPlayerColor()
    local allyColor = 4278190080 + (math.floor)(16711680 * vectorC.x) + (math.floor)(65280 * vectorC.y) + (math.floor)(255 * vectorC.z)
    if (string.len)(playerActorProxyWrapper:getUserNickname()) > 0 then
      if vectorC.w > 0 then
        nickName:SetFontColor(4293914607)
        nickName:useGlowFont(false)
        nickName:useGlowFont(true, "BaseFont_10_Glow", allyColor)
      else
        nickName:SetFontColor(4293914607)
        nickName:useGlowFont(false)
        nickName:useGlowFont(true, "BaseFont_10_Glow", 4278190080)
      end
      nickName:SetText(playerActorProxyWrapper:getUserNickname())
      nickName:SetShow(true)
    end
  else
    do
      if (string.len)(actorProxyWrapper:getCharacterTitle()) > 0 then
        nickName:SetText(actorProxyWrapper:getCharacterTitle())
        nickName:SetSpanSize(0, 20)
        nickName:SetShow(true)
        nickName:useGlowFont(false)
      end
    end
  end
end

  local settingFirstTalk = function(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  -- function num : 0_11
  local firstTalk = (UI.getChildControl)(targetPanel, "Static_FirstTalk")
  if firstTalk == nil then
    return 
  end
  local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
  if npcActorProxyWrapper == nil then
    return 
  end
  firstTalk:SetShow((npcActorProxyWrapper:get()):getFirstTalkable())
  insertedArray:push_back(firstTalk)
end

  local settingImportantTalk = function(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  -- function num : 0_12
  local importantTalk = (UI.getChildControl)(targetPanel, "Static_ImportantTalk")
  if importantTalk == nil then
    return 
  end
  local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
  if npcActorProxyWrapper == nil then
    return 
  end
  local isShow = (npcActorProxyWrapper:get()):getImportantTalk()
  importantTalk:SetShow(isShow)
  if isShow then
    insertedArray:push_back(importantTalk)
  end
end

  local settingOtherHeadIcon = function(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  -- function num : 0_13 , upvalues : getControlProperty
  local characterKeyRaw = actorProxyWrapper:getCharacterKeyRaw()
  local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
  if npcActorProxyWrapper == nil then
    return 
  end
  local npcData = getNpcInfoByCharacterKeyRaw(characterKeyRaw, (npcActorProxyWrapper:get()):getDialogIndex())
  if npcData ~= nil then
    for index = 0, (CppEnums.SpawnType).eSpawnType_Count - 1 do
      local aControl = getControlProperty(targetPanel, index)
      local isOn = npcData:hasSpawnType(index)
      if aControl ~= nil then
        aControl:SetShow(false)
        if isOn then
          aControl:SetShow(true)
          insertedArray:push_back(aControl)
        end
      end
    end
  end
end

  local guildTendencyColor = function(tendency)
  -- function num : 0_14
  local r, g, b = 0, 0, 0
  local upValue = 300000
  local downValue = -1000000
  if tendency > 0 then
    local percents = tendency / upValue
    r = (math.floor)(255 - 255 * percents)
    g = (math.floor)(255 - 171 * percents)
    b = 255
  else
    do
      do
        local percents = tendency / downValue
        r = 255
        g = (math.floor)(255 - 255 * percents)
        b = (math.floor)(255 - 255 * percents)
        local sumColorValue = 4278190080 + 65536 * r + 256 * g + b
        return sumColorValue
      end
    end
  end
end

  local nameTendencyColor = function(tendency)
  -- function num : 0_15
  local r, g, b = 0, 0, 0
  local upValue = 300000
  local downValue = -1000000
  if tendency > 0 then
    local percents = tendency / upValue
    r = (math.floor)(203 - 203 * percents)
    g = (math.floor)(203 - 203 * percents)
    b = (math.floor)(203 + 52 * percents)
  else
    do
      do
        local percents = tendency / downValue
        r = (math.floor)(203 + 52 * percents)
        g = (math.floor)(203 - 203 * percents)
        b = (math.floor)(203 - 203 * percents)
        local sumColorValue = 4278190080 + 65536 * r + 256 * g + b
        return sumColorValue
      end
    end
  end
end

  local settingGuildInfo = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_16 , upvalues : guildMarkInit
  if targetPanel == nil then
    return 
  end
  if (actorProxyWrapper:get()):isPlayer() == false then
    return 
  end
  local guildName = (UI.getChildControl)(targetPanel, "CharacterGuild")
  local guildMark = (UI.getChildControl)(targetPanel, "Static_GuildMark")
  local guildOccupyIcon = (UI.getChildControl)(targetPanel, "Static_Icon_GuildMaster")
  local guildBack = (UI.getChildControl)(targetPanel, "Static_GuildBackGround")
  if guildName == nil or guildMark == nil or guildOccupyIcon == nil or guildBack == nil then
    return 
  end
  guildOccupyIcon:SetIgnore(true)
  guildOccupyIcon:SetShow(false)
  local guildSpan = guildMark:GetSpanSize()
  guildOccupyIcon:SetSpanSize(guildSpan.x - guildOccupyIcon:GetSizeX() / 2, 40)
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  if playerActorProxyWrapper == nil then
    return 
  end
  local playerActorProxy = playerActorProxyWrapper:get()
  if playerActorProxy == nil then
    return 
  end
  local actorProxy = actorProxyWrapper:get()
  if actorProxy == nil then
    return 
  end
  if actorProxy:isPlayer() then
    local militiaTeamNo = actorProxy:getVolunteerTeamNoForLua()
    local isMilitia = playerActorProxy:isVolunteer()
    if militiaTeamNo > 0 and isMilitia == true then
      guildName:SetShow(false)
      guildMark:SetShow(false)
      guildBack:SetShow(false)
      return 
    end
  end
  do
    local hasGuild = playerActorProxy:isGuildMember() and (playerActorProxy:isHideGuildName() ~= false and playerActorProxy:isFlashBanged())
    if playerActorProxy:isFlashBanged() == false and playerActorProxy:isHideCharacterName() == false and playerActorProxy:isEquipCamouflage() == true and playerActorProxyWrapper:getGuildNo_s64() == (getSelfPlayer()):getGuildNo_s64() then
      guildName:SetMonoTone(true)
      guildMark:SetMonoTone(true)
      guildBack:SetMonoTone(true)
    elseif playerActorProxy:isFlashBanged() == false and playerActorProxy:isConcealCharacter() == true then
      guildName:SetMonoTone(true)
      guildMark:SetMonoTone(true)
      guildBack:SetMonoTone(true)
    else
      guildName:SetMonoTone(false)
      guildMark:SetMonoTone(false)
      guildBack:SetMonoTone(false)
    end
    do
      local isShowForAlli = false
      if (playerActorProxyWrapper:get()):isHideCharacterName() == true and (playerActorProxyWrapper:get()):isShowNameWhenCamouflage() == true and (getSelfPlayer()):getActorKey() ~= playerActorProxyWrapper:getActorKey() then
        isShowForAlli = true
      end
      if hasGuild == false or isShowForAlli == true then
        guildName:SetShow(false)
        guildMark:SetShow(false)
        guildBack:SetShow(false)
        return 
      else
        guildName:SetShow(hasGuild)
        guildMark:SetShow(hasGuild)
        guildBack:SetShow(hasGuild)
      end
      if hasGuild then
        local guildNameText = playerActorProxyWrapper:getGuildName()
        guildName:useGlowFont(false)
        guildName:SetFontColor(4293914607)
        guildName:useGlowFont(true, "BaseFont_10_Glow", 4279004349)
        local guildGrade = ToClient_getGuildGrade(playerActorProxyWrapper:getGuildNo_s64())
        local isbadGuildName = playerActorProxyWrapper:isBadNameFlag(playerActorProxyWrapper:getGuildNo_s64())
        if (CppEnums.GuildGrade).GuildGrade_Clan == guildGrade then
          guildMark:SetShow(false)
          guildBack:SetShow(false)
        end
        if isbadGuildName == false then
          guildName:SetText("<" .. guildNameText .. ">")
        else
          guildName:SetText("<" .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_IMPROPERGUILDNAME") .. ">")
        end
        local hasOccupyTerritory = playerActorProxy:isOccupyTerritory()
        if hasOccupyTerritory then
          guildOccupyIcon:SetShow(true)
          guildOccupyIcon:SetMonoTone(false)
        else
          local hasSiege = ToClient_hasOccupyingMajorSiege(playerActorProxyWrapper:getGuildNo_s64())
          if hasSiege == true then
            guildOccupyIcon:SetShow(true)
            guildOccupyIcon:SetMonoTone(true)
          else
            guildOccupyIcon:SetShow(false)
            guildOccupyIcon:SetMonoTone(false)
          end
        end
        local isSet = setGuildTexture(actorKeyRaw, guildMark)
        if isSet == false then
          guildMarkInit(guildMark)
        else
          (guildMark:getBaseTexture()):setUV(0, 0, 1, 1)
          guildMark:setRenderTexture(guildMark:getBaseTexture())
        end
        if playerActorProxy:isGuildAllianceChair() then
          guildBack:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Etc_00.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(guildBack, 1, 1, 43, 43)
          ;
          (guildBack:getBaseTexture()):setUV(x1, y1, x2, y2)
          guildBack:setRenderTexture(guildBack:getBaseTexture())
        elseif playerActorProxy:isGuildMaster() then
          guildBack:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Etc_00.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(guildBack, 87, 1, 129, 43)
          ;
          (guildBack:getBaseTexture()):setUV(x1, y1, x2, y2)
          guildBack:setRenderTexture(guildBack:getBaseTexture())
        elseif playerActorProxy:isGuildSubMaster() then
          guildBack:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Etc_00.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(guildBack, 44, 1, 86, 43)
          ;
          (guildBack:getBaseTexture()):setUV(x1, y1, x2, y2)
          guildBack:setRenderTexture(guildBack:getBaseTexture())
        else
          guildBack:ChangeTextureInfoName("")
        end
      else
        guildOccupyIcon:SetShow(false)
        guildMarkInit(guildMark)
      end
      -- DECOMPILER ERROR: 22 unprocessed JMP targets
    end
  end
end

  local settingMonsterName = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_17 , upvalues : setMonsterNameColor
  local nameTag = (UI.getChildControl)(targetPanel, "CharacterName")
  if nameTag == nil then
    return 
  end
  local monsterActorProxyWrapper = getMonsterActor(actorKeyRaw)
  if monsterActorProxyWrapper == nil then
    return 
  end
  local monsterLevel = ((monsterActorProxyWrapper:get()):getCharacterStaticStatus()).level
  local selfPlayerLevel = ((getSelfPlayer()):get()):getLevel()
  setMonsterNameColor(selfPlayerLevel, monsterLevel, nameTag, (monsterActorProxyWrapper:get()):isDarkSpiritMonster())
end

  local settingLifeRankIcon = function(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  -- function num : 0_18 , upvalues : lifeContentCount, lifeContent, lifeRankSetTexture, sortCenterX
  if (actorProxyWrapper:get()):isPlayer() == false then
    return 
  end
  if lifeContentCount <= 0 then
    return 
  end
  if ToClient_GetMyTeamNoLocalWar() > 0 or ToClient_IsMyselfInEntryUser() == true then
    return 
  end
  local lifeRankIcon = {}
  for i = 0, lifeContentCount - 1 do
    lifeRankIcon[i] = nil
    lifeRankIcon[i] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_" .. i)
    if lifeRankIcon[i] == nil then
      return 
    end
    ;
    (lifeRankIcon[i]):SetShow(false)
  end
  local iconSizeX = (lifeRankIcon[0]):GetSizeX()
  local iconGap = 5
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  if playerActorProxyWrapper == nil then
    return 
  end
  local playerActorProxy = playerActorProxyWrapper:get()
  if playerActorProxy == nil then
    return 
  end
  local actorProxy = actorProxyWrapper:get()
  if actorProxy == nil then
    return 
  end
  if actorProxy:isPlayer() then
    local militiaTeamNo = actorProxy:getVolunteerTeamNoForLua()
    local isMilitia = playerActorProxy:isVolunteer()
    if militiaTeamNo > 0 and isMilitia == true then
      return 
    end
  end
  do
    local hasContentRank = 0
    for lifeContentIndex = 0, lifeContent.sail do
      local hasRank = (FromClient_GetTopRankListForNameTag()):hasRank(lifeContentIndex, actorKeyRaw)
      local rankNumer = 0
      if FGlobal_LifeRanking_CheckEnAble(lifeContentIndex) and hasRank == true and lifeContentIndex < 10 then
        local rankNumer = (FromClient_GetTopRankListForNameTag()):getRank(lifeContentIndex, actorKeyRaw) + 1
        -- DECOMPILER ERROR at PC108: Confused about usage of register: R18 in 'UnsetPending'

        ;
        (lifeContent[lifeContentIndex])[rankNumer] = rankNumer
        ;
        (lifeRankIcon[lifeContentIndex]):ChangeTextureInfoName("new_ui_common_forlua/default/RankingIcon_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(lifeRankIcon[lifeContentIndex], ((lifeRankSetTexture[lifeContentIndex])[rankNumer]).x1, ((lifeRankSetTexture[lifeContentIndex])[rankNumer]).y1, ((lifeRankSetTexture[lifeContentIndex])[rankNumer]).x2, ((lifeRankSetTexture[lifeContentIndex])[rankNumer]).y2)
        ;
        ((lifeRankIcon[lifeContentIndex]):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (lifeRankIcon[lifeContentIndex]):setRenderTexture((lifeRankIcon[lifeContentIndex]):getBaseTexture())
        if playerActorProxy:isFlashBanged() == false and playerActorProxy:isHideCharacterName() == false and playerActorProxy:isEquipCamouflage() == true and playerActorProxyWrapper:getGuildNo_s64() == (getSelfPlayer()):getGuildNo_s64() then
          (lifeRankIcon[lifeContentIndex]):SetMonoTone(true)
        else
          if playerActorProxy:isFlashBanged() == false and playerActorProxy:isConcealCharacter() == true then
            (lifeRankIcon[lifeContentIndex]):SetMonoTone(true)
          else
            ;
            (lifeRankIcon[lifeContentIndex]):SetMonoTone(false)
          end
        end
        local isShowForAlli = false
        if playerActorProxy:isHideCharacterName() == true and playerActorProxy:isShowNameWhenCamouflage() == true and (getSelfPlayer()):getActorKey() ~= playerActorProxyWrapper:getActorKey() then
          isShowForAlli = true
        end
        if (playerActorProxy:isPlayer() and playerActorProxy:isHideCharacterName() and playerActorProxy:isFlashBanged() == false) or isShowForAlli == true then
          (lifeRankIcon[lifeContentIndex]):SetShow(false)
        else
          ;
          (lifeRankIcon[lifeContentIndex]):SetShow(true)
        end
        insertedArray:push_back(lifeRankIcon[lifeContentIndex])
      end
    end
    local rankerType = 0
    for lifeContentIndex = lifeContent.combat, lifeContent.battleField do
      hasContentRank = (FromClient_GetTopRankListForNameTag()):hasContentsRank(rankerType, actorKeyRaw)
      if FGlobal_LifeRanking_CheckEnAble(lifeContentIndex) and hasContentRank == true and lifeContentIndex >= 10 then
        local rankNumer = (FromClient_GetTopRankListForNameTag()):getContentsRank(rankerType, actorKeyRaw) + 1
        -- DECOMPILER ERROR at PC266: Confused about usage of register: R17 in 'UnsetPending'

        ;
        (lifeContent[lifeContentIndex])[rankNumer] = rankNumer
        ;
        (lifeRankIcon[lifeContentIndex]):ChangeTextureInfoName("new_ui_common_forlua/default/RankingIcon_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(lifeRankIcon[lifeContentIndex], ((lifeRankSetTexture[lifeContentIndex])[rankNumer]).x1, ((lifeRankSetTexture[lifeContentIndex])[rankNumer]).y1, ((lifeRankSetTexture[lifeContentIndex])[rankNumer]).x2, ((lifeRankSetTexture[lifeContentIndex])[rankNumer]).y2)
        ;
        ((lifeRankIcon[lifeContentIndex]):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (lifeRankIcon[lifeContentIndex]):setRenderTexture((lifeRankIcon[lifeContentIndex]):getBaseTexture())
        if playerActorProxy:isFlashBanged() == false and playerActorProxy:isHideCharacterName() == false and playerActorProxy:isEquipCamouflage() == true and playerActorProxyWrapper:getGuildNo_s64() == (getSelfPlayer()):getGuildNo_s64() then
          (lifeRankIcon[lifeContentIndex]):SetMonoTone(true)
        else
          if playerActorProxy:isFlashBanged() == false and playerActorProxy:isConcealCharacter() == true then
            (lifeRankIcon[lifeContentIndex]):SetMonoTone(true)
          else
            ;
            (lifeRankIcon[lifeContentIndex]):SetMonoTone(false)
          end
        end
        local isShowForAlli = false
        if playerActorProxy:isHideCharacterName() == true and playerActorProxy:isShowNameWhenCamouflage() == true and (getSelfPlayer()):getActorKey() ~= playerActorProxyWrapper:getActorKey() then
          isShowForAlli = true
        end
        if (playerActorProxy:isPlayer() and playerActorProxy:isHideCharacterName() and playerActorProxy:isFlashBanged() == false) or isShowForAlli == true then
          (lifeRankIcon[lifeContentIndex]):SetShow(false)
        else
          ;
          (lifeRankIcon[lifeContentIndex]):SetShow(true)
        end
        insertedArray:push_back(lifeRankIcon[lifeContentIndex])
      end
      do
        do
          rankerType = rankerType + 1
          -- DECOMPILER ERROR at PC392: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
    local matchType = 0
    local hasMatchRank = 0
    local isEnableContentsPvP = ToClient_IsContentsGroupOpen("38")
    hasMatchRank = (FromClient_GetTopRankListForNameTag()):hasMatchRank(matchType, actorKeyRaw)
    if hasMatchRank == true and isEnableContentsPvP then
      local rankNumer = (FromClient_GetTopRankListForNameTag()):getMatchRank(matchType, actorKeyRaw) + 1
      -- DECOMPILER ERROR at PC420: Confused about usage of register: R16 in 'UnsetPending'

      ;
      (lifeContent[lifeContent.match])[rankNumer] = rankNumer
      ;
      (lifeRankIcon[lifeContent.match]):ChangeTextureInfoName("new_ui_common_forlua/default/RankingIcon_00.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(lifeRankIcon[lifeContent.match], ((lifeRankSetTexture[lifeContent.match])[rankNumer]).x1, ((lifeRankSetTexture[lifeContent.match])[rankNumer]).y1, ((lifeRankSetTexture[lifeContent.match])[rankNumer]).x2, ((lifeRankSetTexture[lifeContent.match])[rankNumer]).y2)
      ;
      ((lifeRankIcon[lifeContent.match]):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (lifeRankIcon[lifeContent.match]):setRenderTexture((lifeRankIcon[lifeContent.match]):getBaseTexture())
      if playerActorProxy:isFlashBanged() == false and playerActorProxy:isHideCharacterName() == false and playerActorProxy:isEquipCamouflage() == true and playerActorProxyWrapper:getGuildNo_s64() == (getSelfPlayer()):getGuildNo_s64() then
        (lifeRankIcon[lifeContent.match]):SetMonoTone(true)
      else
        if playerActorProxy:isFlashBanged() == false and playerActorProxy:isConcealCharacter() == true then
          (lifeRankIcon[lifeContent.match]):SetMonoTone(true)
        else
          ;
          (lifeRankIcon[lifeContent.match]):SetMonoTone(false)
        end
      end
      local isShowForAlli = false
      if playerActorProxy:isHideCharacterName() == true and playerActorProxy:isShowNameWhenCamouflage() == true and (getSelfPlayer()):getActorKey() ~= playerActorProxyWrapper:getActorKey() then
        isShowForAlli = true
      end
      if (playerActorProxy:isPlayer() and playerActorProxy:isHideCharacterName() and playerActorProxy:isFlashBanged() == false) or isShowForAlli == true then
        (lifeRankIcon[lifeContent.match]):SetShow(false)
      else
        ;
        (lifeRankIcon[lifeContent.match]):SetShow(true)
      end
      insertedArray:push_back(lifeRankIcon[lifeContent.match])
    end
    do
      local spanSizeY = 40
      do
        local hasGuild = playerActorProxy:isGuildMember() and (playerActorProxy:isHideGuildName() ~= false and playerActorProxy:isFlashBanged())
        if hasGuild then
          spanSizeY = spanSizeY + 20
        end
        if playerActorProxy:isPlayer() and playerActorProxyWrapper:checkToTitleKey() then
          spanSizeY = spanSizeY + 20
        end
        sortCenterX(insertedArray)
        -- DECOMPILER ERROR: 4 unprocessed JMP targets
      end
    end
  end
end

  local settingPlayerName = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_19 , upvalues : nameTendencyColor
  local nameTag = (UI.getChildControl)(targetPanel, "CharacterName")
  if nameTag == nil then
    return 
  end
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  if playerActorProxyWrapper == nil then
    return 
  end
  local playerActorProxy = playerActorProxyWrapper:get()
  local playerTendency = playerActorProxy:getTendency()
  if playerActorProxy:isPvpEnable() then
    nameTag:useGlowFont(false)
    nameTag:SetFontColor(4293914607)
    nameTag:useGlowFont(true, "BaseFont_10_Glow", nameTendencyColor(playerTendency))
  else
    nameTag:useGlowFont(false)
    nameTag:SetFontColor(4294574047)
    nameTag:useGlowFont(true, "BaseFont_10_Glow", 4283917312)
  end
end

  isShowInstallationEnduranceType = function(installationType)
  -- function num : 0_20
  if installationType == (CppEnums.InstallationType).eType_Mortar or installationType == (CppEnums.InstallationType).eType_Anvil or installationType == (CppEnums.InstallationType).eType_Stump or installationType == (CppEnums.InstallationType).eType_FireBowl or installationType == (CppEnums.InstallationType).eType_Buff or installationType == (CppEnums.InstallationType).eType_Alchemy or installationType == (CppEnums.InstallationType).eType_Havest or installationType == (CppEnums.InstallationType).eType_Bookcase or installationType == (CppEnums.InstallationType).eType_Cooking or installationType == (CppEnums.InstallationType).eType_Bed or installationType == (CppEnums.InstallationType).eType_LivestockHarvest then
    return true
  else
    return false
  end
end

  local isFourty = false
  local isTwenty = false
  local furnitureCheck = false
  ShowUseTab_Func = function()
  -- function num : 0_21
  if getSelfPlayer() == nil then
    return 
  end
  local targetPanel = ((getSelfPlayer()):get()):getUIPanel()
  if targetPanel == nil then
    return 
  end
  local useTab = (UI.getChildControl)(targetPanel, "StaticText_UseTab")
  if IsChecked_WeaponOut == true then
    useTab:SetShow(true)
  else
    useTab:SetShow(false)
  end
end

  HideUseTab_Func = function()
  -- function num : 0_22
  local targetPanel = ((getSelfPlayer()):get()):getUIPanel()
  if targetPanel == nil then
    return 
  end
  local useTab = (UI.getChildControl)(targetPanel, "StaticText_UseTab")
  useTab:SetShow(false)
end

  FGlobal_ShowUseLantern = function(param)
  -- function num : 0_23
  local targetPanel = ((getSelfPlayer()):get()):getUIPanel()
  if targetPanel == nil then
    return 
  end
  local useLantern = (UI.getChildControl)(targetPanel, "StaticText_UseLantern")
  if param == true then
    useLantern:SetShow(true)
  else
    useLantern:SetShow(false)
  end
end

  local settingHpBarInitState = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_24
  local actorProxy = actorProxyWrapper:get()
  if actorProxy == nil then
    return 
  end
  local hpBack, hpLater, hpMain = nil, nil, nil
  if actorProxy:isKingOrLordTent() then
    hpBack = (UI.getChildControl)(targetPanel, "KingOrLordTentProgressBack")
    hpLater = (UI.getChildControl)(targetPanel, "KingOrLordTentProgress2_HpLater")
    hpMain = (UI.getChildControl)(targetPanel, "KingOrLordTentHPGageProgress")
  else
    if actorProxy:isLargeHpBarCharacter() then
      hpBack = (UI.getChildControl)(targetPanel, "KingOrLordTentProgressBack")
      hpLater = (UI.getChildControl)(targetPanel, "KingOrLordTentProgress2_HpLater")
      hpMain = (UI.getChildControl)(targetPanel, "KingOrLordTentHPGageProgress")
    else
      hpBack = (UI.getChildControl)(targetPanel, "ProgressBack")
      hpLater = (UI.getChildControl)(targetPanel, "Progress2_HpLater")
      hpMain = (UI.getChildControl)(targetPanel, "CharacterHPGageProgress")
    end
  end
  local characterStaticStatus = actorProxy:getCharacterStaticStatus()
  if hpBack == nil or hpLater == nil or hpMain == nil or characterStaticStatus == nil then
    return 
  end
  hpMain:ResetVertexAni(true)
  hpLater:ResetVertexAni(true)
  hpMain:SetAlpha(1)
  hpLater:SetAlpha(1)
  if actorProxy:isSelfPlayer() then
    local hpAlert = (UI.getChildControl)(targetPanel, "Static_nameTagGaugeAlert")
    local usePotion = (UI.getChildControl)(targetPanel, "StaticText_UsePotion")
    hpAlert:ResetVertexAni(true)
    hpAlert:SetAlpha(1)
    usePotion:SetShow(false)
  end
end

  local settingHpBar = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_25 , upvalues : furnitureCheck, hideTimeType
  local actorProxy = actorProxyWrapper:get()
  if actorProxy == nil then
    return 
  end
  if actorProxy:isInstallationActor() or actorProxy:isMonster() or actorProxy:isSelfPlayer() or actorProxy:isPlayer() or actorProxy:isNpc() or actorProxy:isHouseHold() or actorProxy:isVehicle() or actorProxy:isInstanceObject() == false then
    return 
  end
  local isColorBlindMode = ((ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode))
  local hpBack, hpLater, hpMain = nil, nil, nil
  if actorProxy:isKingOrLordTent() then
    hpBack = (UI.getChildControl)(targetPanel, "KingOrLordTentProgressBack")
    hpLater = (UI.getChildControl)(targetPanel, "KingOrLordTentProgress2_HpLater")
    hpMain = (UI.getChildControl)(targetPanel, "KingOrLordTentHPGageProgress")
  else
    if actorProxy:isLargeHpBarCharacter() then
      hpBack = (UI.getChildControl)(targetPanel, "KingOrLordTentProgressBack")
      hpLater = (UI.getChildControl)(targetPanel, "KingOrLordTentProgress2_HpLater")
      hpMain = (UI.getChildControl)(targetPanel, "KingOrLordTentHPGageProgress")
    else
      hpBack = (UI.getChildControl)(targetPanel, "ProgressBack")
      hpLater = (UI.getChildControl)(targetPanel, "Progress2_HpLater")
      hpMain = (UI.getChildControl)(targetPanel, "CharacterHPGageProgress")
    end
  end
  local characterStaticStatus = actorProxy:getCharacterStaticStatus()
  if hpBack == nil or hpLater == nil or hpMain == nil or characterStaticStatus == nil then
    return 
  end
  if characterStaticStatus._isHiddenHp and not actorProxy:isInstallationActor() then
    hpBack:SetShow(false)
    hpLater:SetShow(false)
    hpMain:SetShow(false)
    return 
  end
  if actorProxy:isInstallationActor() then
    local installationActorWrapper = getInstallationActor(actorKeyRaw)
    hpBack:SetShow(false)
    hpLater:SetShow(false)
    hpMain:SetShow(false)
    if Panel_Housing:IsShow() then
      return 
    end
    local installationType = ((installationActorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):getInstallationType()
    if isShowInstallationEnduranceType(installationType) == false then
      return 
    end
    if toInt64(0, 0) ~= installationActorWrapper:getOwnerHouseholdNo_s64() then
      if installationActorWrapper:isHavestInstallation() then
        local prevRate = hpMain:GetProgressRate()
        local rate = installationActorWrapper:getHarvestTotalGrowRate()
        if rate > 1 then
          rate = 1
        else
          if rate < 0 then
            rate = 0
          end
        end
        rate = rate * 100
        local progressingInfo = (installationActorWrapper:get()):getInstallationProgressingInfo()
        local isWarning = false
        if progressingInfo ~= nil and not progressingInfo:getNeedLop() then
          isWarning = progressingInfo:getNeedPestControl()
        end
        hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges.dds")
        local x1, y1, x2, y2 = nil, nil, nil, nil
        if isWarning then
          x1 = setTextureUV_Func(hpMain, 206, 112, 255, 115)
        else
          -- DECOMPILER ERROR at PC235: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC236: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC237: Overwrote pending register: R16 in 'AssignReg'

          x1 = setTextureUV_Func(hpMain, 206, 96, 255, 99)
        end
        ;
        (hpMain:getBaseTexture()):setUV(x1, y1, x2, y2)
        hpMain:setRenderTexture(hpMain:getBaseTexture())
        hpMain:SetProgressRate(rate)
        hpLater:SetProgressRate(rate)
        hpMain:SetCurrentProgressRate(rate)
        hpLater:SetCurrentProgressRate(rate)
        hpBack:SetShow(true)
        hpLater:SetShow(true)
        hpMain:SetShow(true)
      else
        do
          local curEndurance = installationActorWrapper:getEndurance()
          local maxEndurance = installationActorWrapper:getMaxEndurance()
          local prevRate = hpMain:GetProgressRate()
          do
            local rate = curEndurance / maxEndurance * 100
            -- DECOMPILER ERROR at PC283: Overwrote pending register: R16 in 'AssignReg'

            -- DECOMPILER ERROR at PC284: Overwrote pending register: R17 in 'AssignReg'

            if rate < prevRate then
              hpMain:SetVertexAniRun(x2, true)
              hpLater:SetVertexAniRun("Ani_Color_Damage_White", true)
            else
              if prevRate < rate then
                hpMain:ResetVertexAni(true)
                hpLater:ResetVertexAni(true)
                hpMain:SetAlpha(1)
                hpLater:SetAlpha(1)
              end
            end
            hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges.dds")
            if rate < 5 then
              x1 = setTextureUV_Func(hpMain, 206, 112, 255, 115)
            else
              x1 = setTextureUV_Func(hpMain, 206, 96, 255, 99)
            end
            hpMain:SetProgressRate(rate)
            hpLater:SetProgressRate(rate)
            if housing_isInstallMode() or furnitureCheck == true then
              hpBack:SetShow(true)
              hpLater:SetShow(true)
              hpMain:SetShow(true)
            else
              hpBack:SetShow(false)
              hpLater:SetShow(false)
              hpMain:SetShow(false)
            end
            if actorProxy:isLargeHpBarCharacter() then
              local prevRate = hpMain:GetProgressRate()
              local hpRate = actorProxy:getHp() * 100 / actorProxy:getMaxHp()
              if hpLater:GetCurrentProgressRate() < hpMain:GetCurrentProgressRate() then
                hpLater:SetCurrentProgressRate(hpMain:GetCurrentProgressRate())
                hpMain:SetCurrentProgressRate(hpMain:GetCurrentProgressRate())
              end
              if hpRate < prevRate then
                hpMain:SetVertexAniRun("Ani_Color_Damage_0", true)
                hpLater:SetVertexAniRun("Ani_Color_Damage_White", true)
              else
                if prevRate < hpRate then
                  hpMain:ResetVertexAni(true)
                  hpLater:ResetVertexAni(true)
                  hpMain:SetAlpha(1)
                  hpLater:SetAlpha(1)
                end
              end
              hpMain:SetProgressRate(hpRate)
              hpLater:SetProgressRate(hpRate)
              hpBack:SetShow(true)
              hpLater:SetShow(true)
              hpMain:SetShow(true)
            else
              do
                if actorProxy:isMonster() then
                  local prevRate = hpMain:GetProgressRate()
                  local hpRate = actorProxy:getHp() * 100 / actorProxy:getMaxHp()
                  local characterActorProxyWrapper = getCharacterActor(actorKeyRaw)
                  hpBack:SetShow(true)
                  hpLater:SetShow(true)
                  hpMain:SetShow(true)
                  if checkActiveCondition(characterActorProxyWrapper:getCharacterKey()) == true then
                    hpMain:SetProgressRate(hpRate)
                    hpLater:SetProgressRate(hpRate)
                    if hpRate < prevRate then
                      hpMain:SetVertexAniRun("Ani_Color_Damage_0", true)
                      hpLater:SetVertexAniRun("Ani_Color_Damage_White", true)
                    else
                      if prevRate < hpRate then
                        if hpLater:GetCurrentProgressRate() < hpMain:GetCurrentProgressRate() then
                          hpLater:SetCurrentProgressRate(hpMain:GetCurrentProgressRate())
                        end
                        hpMain:ResetVertexAni(true)
                        hpLater:ResetVertexAni(true)
                        hpMain:SetAlpha(1)
                        hpLater:SetAlpha(1)
                      end
                    end
                    hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(hpMain, 206, 96, 255, 99)
                    ;
                    (hpMain:getBaseTexture()):setUV(x1, y1, x2, y2)
                    hpMain:setRenderTexture(hpMain:getBaseTexture())
                  else
                    do
                      do
                        local x1, y1, x2, y2 = nil, nil, nil, nil
                        hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges.dds")
                        if hpRate > 75 then
                          x1 = setTextureUV_Func(hpMain, 206, 96, 255, 99)
                        else
                          -- DECOMPILER ERROR at PC555: Overwrote pending register: R15 in 'AssignReg'

                          -- DECOMPILER ERROR at PC556: Overwrote pending register: R14 in 'AssignReg'

                          -- DECOMPILER ERROR at PC557: Overwrote pending register: R13 in 'AssignReg'

                          if hpRate > 50 then
                            x1 = setTextureUV_Func(hpMain, 206, 100, 255, 103)
                          else
                            -- DECOMPILER ERROR at PC569: Overwrote pending register: R15 in 'AssignReg'

                            -- DECOMPILER ERROR at PC570: Overwrote pending register: R14 in 'AssignReg'

                            -- DECOMPILER ERROR at PC571: Overwrote pending register: R13 in 'AssignReg'

                            if hpRate > 25 then
                              x1 = setTextureUV_Func(hpMain, 206, 104, 255, 107)
                            else
                              -- DECOMPILER ERROR at PC583: Overwrote pending register: R15 in 'AssignReg'

                              -- DECOMPILER ERROR at PC584: Overwrote pending register: R14 in 'AssignReg'

                              -- DECOMPILER ERROR at PC585: Overwrote pending register: R13 in 'AssignReg'

                              if hpRate > 10 then
                                x1 = setTextureUV_Func(hpMain, 206, 108, 255, 111)
                              else
                                -- DECOMPILER ERROR at PC597: Overwrote pending register: R15 in 'AssignReg'

                                -- DECOMPILER ERROR at PC598: Overwrote pending register: R14 in 'AssignReg'

                                -- DECOMPILER ERROR at PC599: Overwrote pending register: R13 in 'AssignReg'

                                if hpRate > 5 then
                                  x1 = setTextureUV_Func(hpMain, 206, 112, 255, 115)
                                else
                                  -- DECOMPILER ERROR at PC609: Overwrote pending register: R15 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC610: Overwrote pending register: R14 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC611: Overwrote pending register: R13 in 'AssignReg'

                                  x1 = setTextureUV_Func(hpMain, 206, 112, 255, 115)
                                end
                              end
                            end
                          end
                        end
                        ;
                        (hpMain:getBaseTexture()):setUV(x1, y1, x2, y2)
                        hpMain:setRenderTexture(hpMain:getBaseTexture())
                        hpMain:SetProgressRate(100)
                        hpLater:SetProgressRate(100)
                        hpMain:SetCurrentProgressRate(100)
                        hpLater:SetCurrentProgressRate(100)
                        if actorProxy:isSelfPlayer() then
                          local hpAlert = (UI.getChildControl)(targetPanel, "Static_nameTagGaugeAlert")
                          local usePotion = (UI.getChildControl)(targetPanel, "StaticText_UsePotion")
                          hpBack:SetShow(true)
                          hpLater:SetShow(true)
                          hpMain:SetShow(true)
                          -- DECOMPILER ERROR at PC661: Overwrote pending register: R14 in 'AssignReg'

                          local x1, y1, x2, y2 = nil, nil, nil, x2
                          -- DECOMPILER ERROR at PC662: Overwrote pending register: R15 in 'AssignReg'

                          if y2() > 0 then
                            hpMain:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Gauges.dds")
                            x1 = setTextureUV_Func(hpMain, 1, 63, 233, 69)
                          else
                            if isColorBlindMode == 0 then
                              hpMain:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Gauges.dds")
                              -- DECOMPILER ERROR at PC693: Overwrote pending register: R14 in 'AssignReg'

                              -- DECOMPILER ERROR at PC694: Overwrote pending register: R13 in 'AssignReg'

                              -- DECOMPILER ERROR at PC695: Overwrote pending register: R12 in 'AssignReg'

                              x1 = setTextureUV_Func(hpMain, 206, 96, 255, 99)
                            else
                              if isColorBlindMode == 1 then
                                hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                -- DECOMPILER ERROR at PC710: Overwrote pending register: R14 in 'AssignReg'

                                -- DECOMPILER ERROR at PC711: Overwrote pending register: R13 in 'AssignReg'

                                -- DECOMPILER ERROR at PC712: Overwrote pending register: R12 in 'AssignReg'

                                x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                              else
                                if isColorBlindMode == 2 then
                                  hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                  -- DECOMPILER ERROR at PC727: Overwrote pending register: R14 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC728: Overwrote pending register: R13 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC729: Overwrote pending register: R12 in 'AssignReg'

                                  x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                                end
                              end
                            end
                          end
                          ;
                          (hpMain:getBaseTexture()):setUV(x1, y1, x2, y2)
                          local selfPlayerLevel = ((getSelfPlayer()):get()):getLevel()
                          local prevRate = hpMain:GetProgressRate()
                          local hpRate = actorProxy:getHp() * 100 / actorProxy:getMaxHp()
                          if hpRate < prevRate then
                            hpMain:SetVertexAniRun("Ani_Color_Damage_0", true)
                            hpLater:SetVertexAniRun("Ani_Color_Damage_White", true)
                          else
                            if prevRate < hpRate then
                              hpMain:ResetVertexAni(true)
                              hpLater:ResetVertexAni(true)
                              hpMain:SetAlpha(1)
                              hpLater:SetAlpha(1)
                            end
                          end
                          hpMain:SetProgressRate(hpRate)
                          hpLater:SetProgressRate(hpRate)
                          hpAlert:ResetVertexAni(true)
                          local x1, y1, x2, y2 = nil, nil, nil, nil
                          if hpRate >= 40 then
                            if isColorBlindMode == 0 then
                              hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges.dds")
                              x1 = setTextureUV_Func(hpMain, 206, 112, 255, 115)
                            else
                              if isColorBlindMode == 1 then
                                hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                -- DECOMPILER ERROR at PC819: Overwrote pending register: R21 in 'AssignReg'

                                -- DECOMPILER ERROR at PC820: Overwrote pending register: R20 in 'AssignReg'

                                -- DECOMPILER ERROR at PC821: Overwrote pending register: R19 in 'AssignReg'

                                x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                              else
                                if isColorBlindMode == 2 then
                                  hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                  -- DECOMPILER ERROR at PC836: Overwrote pending register: R21 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC837: Overwrote pending register: R20 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC838: Overwrote pending register: R19 in 'AssignReg'

                                  x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                                end
                              end
                            end
                            ;
                            (hpMain:getBaseTexture()):setUV(x1, y1, x2, y2)
                            usePotion:SetShow(false)
                            hpMain:ResetVertexAni(true)
                            hpMain:SetAlpha(1)
                            hpAlert:SetShow(false)
                          else
                            if hpRate >= 20 then
                              if isColorBlindMode == 0 then
                                hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges.dds")
                                -- DECOMPILER ERROR at PC875: Overwrote pending register: R21 in 'AssignReg'

                                -- DECOMPILER ERROR at PC876: Overwrote pending register: R20 in 'AssignReg'

                                -- DECOMPILER ERROR at PC877: Overwrote pending register: R19 in 'AssignReg'

                                x1 = setTextureUV_Func(hpMain, 206, 112, 255, 115)
                              else
                                if isColorBlindMode == 1 then
                                  hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                  -- DECOMPILER ERROR at PC892: Overwrote pending register: R21 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC893: Overwrote pending register: R20 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC894: Overwrote pending register: R19 in 'AssignReg'

                                  x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                                else
                                  if isColorBlindMode == 2 then
                                    hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                    -- DECOMPILER ERROR at PC909: Overwrote pending register: R21 in 'AssignReg'

                                    -- DECOMPILER ERROR at PC910: Overwrote pending register: R20 in 'AssignReg'

                                    -- DECOMPILER ERROR at PC911: Overwrote pending register: R19 in 'AssignReg'

                                    x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                                  end
                                end
                              end
                              ;
                              (hpMain:getBaseTexture()):setUV(x1, y1, x2, y2)
                              if selfPlayerLevel <= 15 then
                                usePotion:SetShow(true)
                              end
                              hpMain:SetVertexAniRun("Ani_Color_Damage_40", true)
                              hpAlert:SetShow(true)
                              hpAlert:SetVertexAniRun("Ani_Color_nameTagAlertGauge0", true)
                            else
                              if isColorBlindMode == 0 then
                                hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges.dds")
                                -- DECOMPILER ERROR at PC950: Overwrote pending register: R21 in 'AssignReg'

                                -- DECOMPILER ERROR at PC951: Overwrote pending register: R20 in 'AssignReg'

                                -- DECOMPILER ERROR at PC952: Overwrote pending register: R19 in 'AssignReg'

                                x1 = setTextureUV_Func(hpMain, 206, 112, 255, 115)
                              else
                                if isColorBlindMode == 1 then
                                  hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                  -- DECOMPILER ERROR at PC967: Overwrote pending register: R21 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC968: Overwrote pending register: R20 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC969: Overwrote pending register: R19 in 'AssignReg'

                                  x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                                else
                                  if isColorBlindMode == 2 then
                                    hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                    -- DECOMPILER ERROR at PC984: Overwrote pending register: R21 in 'AssignReg'

                                    -- DECOMPILER ERROR at PC985: Overwrote pending register: R20 in 'AssignReg'

                                    -- DECOMPILER ERROR at PC986: Overwrote pending register: R19 in 'AssignReg'

                                    x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                                  end
                                end
                              end
                              ;
                              (hpMain:getBaseTexture()):setUV(x1, y1, x2, y2)
                              if selfPlayerLevel <= 15 then
                                usePotion:SetShow(true)
                              end
                              hpMain:SetVertexAniRun("Ani_Color_Damage_20", true)
                              hpAlert:SetShow(true)
                              hpAlert:SetVertexAniRun("Ani_Color_nameTagAlertGauge1", true)
                            end
                          end
                          hpMain:setRenderTexture(hpMain:getBaseTexture())
                        else
                          do
                            if actorProxy:isPlayer() then
                              local prevRate = hpMain:GetProgressRate()
                              local isParty = Requestparty_isPartyPlayer(actorKeyRaw)
                              -- DECOMPILER ERROR at PC1027: Overwrote pending register: R12 in 'AssignReg'

                              local playerActorProxyWrapper = getPlayerActor(y1)
                              -- DECOMPILER ERROR at PC1029: Overwrote pending register: R13 in 'AssignReg'

                              if not (playerActorProxyWrapper:get()):isArenaAreaRegion() and not (playerActorProxyWrapper:get()):isArenaZoneRegion() then
                                local isArenaAreaOrZone = (playerActorProxyWrapper:get()):isCompetitionDefined()
                              end
                              -- DECOMPILER ERROR at PC1045: Overwrote pending register: R14 in 'AssignReg'

                              local hpRate = actorProxy:getHp() * 100 / actorProxy:getMaxHp()
                              if hpRate < prevRate then
                                hpMain:SetVertexAniRun("Ani_Color_Damage_0", true)
                                hpLater:SetVertexAniRun("Ani_Color_Damage_White", true)
                              else
                                if prevRate < hpRate then
                                  hpMain:ResetVertexAni(true)
                                  hpLater:ResetVertexAni(true)
                                  hpMain:SetAlpha(1)
                                  hpLater:SetAlpha(1)
                                end
                              end
                              hpMain:SetProgressRate(hpRate)
                              hpLater:SetProgressRate(hpRate)
                              local isShow = (actorProxy:isHideTimeOver(hideTimeType.overHeadUI) == false or not isParty) and isArenaAreaOrZone
                              hpMain:SetShow(true)
                              hpBack:SetShow(isShow)
                              hpLater:SetShow(isShow)
                              hpMain:SetShow(isShow)
                              local x1, y1, x2, y2 = nil, nil, nil, nil
                              -- DECOMPILER ERROR at PC1109: Overwrote pending register: R20 in 'AssignReg'

                              -- DECOMPILER ERROR at PC1109: Overwrote pending register: R19 in 'AssignReg'

                              -- DECOMPILER ERROR at PC1110: Overwrote pending register: R21 in 'AssignReg'

                              if isParty then
                                y1(x2, y2)
                                x1 = setTextureUV_Func(hpMain, 1, 63, 233, 69)
                              else
                                if isColorBlindMode == 0 then
                                  hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/default_gauges.dds")
                                  -- DECOMPILER ERROR at PC1136: Overwrote pending register: R18 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC1137: Overwrote pending register: R17 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC1138: Overwrote pending register: R16 in 'AssignReg'

                                  x1 = setTextureUV_Func(hpMain, 206, 112, 255, 115)
                                elseif isColorBlindMode == 1 then
                                  hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                  -- DECOMPILER ERROR at PC1153: Overwrote pending register: R18 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC1154: Overwrote pending register: R17 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC1155: Overwrote pending register: R16 in 'AssignReg'

                                  x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                                elseif isColorBlindMode == 2 then
                                  hpMain:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
                                  -- DECOMPILER ERROR at PC1170: Overwrote pending register: R18 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC1171: Overwrote pending register: R17 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC1172: Overwrote pending register: R16 in 'AssignReg'

                                  x1 = setTextureUV_Func(hpMain, 1, 247, 255, 250)
                                end
                                ;
                                (hpMain:getBaseTexture()):setUV(x1, y1, x2, y2)
                              end
                              ;
                              (hpMain:getBaseTexture()):setUV(x1, y1, x2, y2)
                              hpMain:setRenderTexture(hpMain:getBaseTexture())
                            elseif actorProxy:isNpc() then
                              local isShow = false
                              local isFusionCore = (actorProxy:getCharacterStaticStatus()):isFusionCore()
                              do
                                do
                                  if isFusionCore == true then
                                    local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
                                    if npcActorProxyWrapper:getTeamNo_s64() == (getSelfPlayer()):getTeamNo_s64() then
                                      isShow = true
                                    end
                                  end
                                  if isShow then
                                    local hpRate = actorProxy:getHp() * 100 / actorProxy:getMaxHp()
                                    local prevRate = hpMain:GetProgressRate()
                                    if hpRate < prevRate then
                                      hpMain:SetVertexAniRun("Ani_Color_Damage_0", true)
                                      hpLater:SetVertexAniRun("Ani_Color_Damage_White", true)
                                    elseif prevRate < hpRate then
                                      hpMain:ResetVertexAni(true)
                                      hpLater:ResetVertexAni(true)
                                      hpMain:SetAlpha(1)
                                      hpLater:SetAlpha(1)
                                    end
                                    hpMain:SetProgressRate(hpRate)
                                    hpLater:SetProgressRate(hpRate)
                                  end
                                  hpBack:SetShow(isShow)
                                  hpLater:SetShow(isShow)
                                  hpMain:SetShow(isShow)
                                  if actorProxy:isHouseHold() then
                                    houseHoldActorWrapper = getHouseHoldActor(actorKeyRaw)
                                    if houseHoldActorWrapper == nil then
                                      return 
                                    end
                                    if ((houseHoldActorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isBarricade() or ((houseHoldActorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isKingOrLordTent() or ((houseHoldActorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isAdvancedBase() == false then
                                      return 
                                    end
                                    local prevRate = hpMain:GetProgressRate()
                                    local hpRate = actorProxy:getHp() * 100 / actorProxy:getMaxHp()
                                    if hpLater:GetCurrentProgressRate() < hpMain:GetCurrentProgressRate() then
                                      hpLater:SetCurrentProgressRate(hpMain:GetCurrentProgressRate())
                                      hpMain:SetCurrentProgressRate(hpMain:GetCurrentProgressRate())
                                    end
                                    if hpRate < prevRate then
                                      hpMain:SetVertexAniRun("Ani_Color_Damage_0", true)
                                      hpLater:SetVertexAniRun("Ani_Color_Damage_White", true)
                                    elseif prevRate < hpRate then
                                      hpMain:ResetVertexAni(true)
                                      hpLater:ResetVertexAni(true)
                                      hpMain:SetAlpha(1)
                                      hpLater:SetAlpha(1)
                                    end
                                    hpMain:SetProgressRate(hpRate)
                                    hpLater:SetProgressRate(hpRate)
                                    hpBack:SetShow(true)
                                    hpLater:SetShow(true)
                                    hpMain:SetShow(true)
                                  elseif actorProxy:isInstanceObject() then
                                    if ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isBarricade() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isHealingTower() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isObservatory() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isElephantBarn() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isRepairingTower() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isMineFactory() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isBombFactory() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isDistributor() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isSiegeTower() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isLargeSiegeTower() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isDefenceTower() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isSiegeTower() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isLargeSiegeTower() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isAdvancedBaseTower() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isTankFactory() or ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isSavageDefenceObject() then
                                      local prevRate = hpMain:GetProgressRate()
                                      local hpRate = actorProxy:getHp() * 100 / actorProxy:getMaxHp()
                                      hpMain:SetProgressRate(hpRate)
                                      hpLater:SetProgressRate(hpRate)
                                      if hpRate < prevRate then
                                        hpMain:SetVertexAniRun("Ani_Color_Damage_0", true)
                                        hpLater:SetVertexAniRun("Ani_Color_Damage_White", true)
                                      elseif prevRate < hpRate then
                                        if hpLater:GetCurrentProgressRate() < hpMain:GetCurrentProgressRate() then
                                          hpLater:SetCurrentProgressRate(hpMain:GetCurrentProgressRate())
                                        end
                                        hpMain:ResetVertexAni(true)
                                        hpLater:ResetVertexAni(true)
                                        hpMain:SetAlpha(1)
                                        hpLater:SetAlpha(1)
                                      end
                                      hpBack:SetShow(true)
                                      hpLater:SetShow(true)
                                      hpMain:SetShow(true)
                                    elseif ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isTrap() then
                                      hpBack:SetShow(false)
                                      hpLater:SetShow(false)
                                      hpMain:SetShow(false)
                                    end
                                  elseif actorProxy:isVehicle() then
                                    local vehicleActorWrapper = getVehicleActorByProxy(actorProxy)
                                    if vehicleActorWrapper ~= nil and ((CppEnums.VehicleType).Type_ThrowStone == (vehicleActorWrapper:get()):getVehicleType() or (CppEnums.VehicleType).Type_ThrowFire == (vehicleActorWrapper:get()):getVehicleType() or (CppEnums.VehicleType).Type_WoodenFence == (vehicleActorWrapper:get()):getVehicleType()) then
                                      _PA_LOG("LUA", "name show : " .. tostring(actorProxyWrapper:getName()))
                                      local prevRate = hpMain:GetProgressRate()
                                      local hpRate = actorProxy:getHp() * 100 / actorProxy:getMaxHp()
                                      hpMain:SetProgressRate(hpRate)
                                      hpLater:SetProgressRate(hpRate)
                                      if hpRate < prevRate then
                                        hpMain:SetVertexAniRun("Ani_Color_Damage_0", true)
                                        hpLater:SetVertexAniRun("Ani_Color_Damage_White", true)
                                      elseif prevRate < hpRate then
                                        if hpLater:GetCurrentProgressRate() < hpMain:GetCurrentProgressRate() then
                                          hpLater:SetCurrentProgressRate(hpMain:GetCurrentProgressRate())
                                        end
                                        hpMain:ResetVertexAni(true)
                                        hpLater:ResetVertexAni(true)
                                        hpMain:SetAlpha(1)
                                        hpLater:SetAlpha(1)
                                      end
                                      hpBack:SetShow(true)
                                      hpLater:SetShow(true)
                                      hpMain:SetShow(true)
                                    else
                                      _PA_LOG("LUA", "name hide : " .. tostring(actorProxyWrapper:getName()))
                                      hpBack:SetShow(false)
                                      hpLater:SetShow(false)
                                      hpMain:SetShow(false)
                                    end
                                  end
                                  -- DECOMPILER ERROR: 32 unprocessed JMP targets
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
      end
    end
  end
end

  local settingMpBar = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_26 , upvalues : UI_classType
  local actorProxy = actorProxyWrapper:get()
  if actorProxy == nil then
    return 
  end
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  local mpBack = (UI.getChildControl)(targetPanel, "ProgressBack_ManaResource")
  local mpMain = (UI.getChildControl)(targetPanel, "Character_ManaResource")
  if mpBack == nil or mpMain == nil then
    return 
  end
  local instanceObject = (actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()
  if actorProxy:isSelfPlayer() then
    local playerWrapper = getSelfPlayer()
    local mp = (playerWrapper:get()):getMp()
    local maxMp = (playerWrapper:get()):getMaxMp()
    local mpRate = mp * 100 / maxMp
    mpMain:SetProgressRate(mpRate)
    mpMain:SetCurrentProgressRate(mpRate)
    local isEP_Character = UI_classType.ClassType_Ranger == playerWrapper:getClassType()
    local isFP_Character = UI_classType.ClassType_Warrior == playerWrapper:getClassType() or UI_classType.ClassType_Giant == playerWrapper:getClassType() or UI_classType.ClassType_BladeMaster == playerWrapper:getClassType() or UI_classType.ClassType_BladeMasterWomen == playerWrapper:getClassType() or UI_classType.ClassType_NinjaWomen == playerWrapper:getClassType() or UI_classType.ClassType_NinjaMan == playerWrapper:getClassType() or UI_classType.ClassType_Combattant == playerWrapper:getClassType() or UI_classType.ClassType_CombattantWomen == playerWrapper:getClassType()
    local isBP_Character = UI_classType.ClassType_Valkyrie == playerWrapper:getClassType()
    local isOnlyDarkelf = UI_classType.ClassType_DarkElf == playerWrapper:getClassType()
    local isMP_Character = (not isEP_Character and not isFP_Character and not isBP_Character and not isOnlyDarkelf)
    if isEP_Character then
      if isColorBlindMode == 0 then
        mpMain:SetColor((Defines.Color).C_FFA3EF00)
      elseif isColorBlindMode == 1 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      elseif isColorBlindMode == 2 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      end
    elseif isFP_Character then
      if isColorBlindMode == 0 then
        mpMain:SetColor((Defines.Color).C_FFFFCE22)
      elseif isColorBlindMode == 1 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      elseif isColorBlindMode == 2 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      end
    elseif isBP_Character then
      if isColorBlindMode == 0 then
        mpMain:SetColor((Defines.Color).C_FFFFCE22)
      elseif isColorBlindMode == 1 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      elseif isColorBlindMode == 2 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      end
    elseif isOnlyDarkelf then
      if isColorBlindMode == 0 then
        mpMain:SetColor((Defines.Color).C_FF505DEC)
      elseif isColorBlindMode == 1 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      elseif isColorBlindMode == 2 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      end
    elseif isMP_Character then
      if isColorBlindMode == 0 then
        mpMain:SetColor((Defines.Color).C_FF00A1FF)
      elseif isColorBlindMode == 1 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      elseif isColorBlindMode == 2 then
        mpMain:SetColor((Defines.Color).C_FFEE9900)
      end
    end
    mpBack:SetShow(true)
    mpMain:SetShow(true)
  elseif actorProxy:isInstanceObject() then
    if instanceObject:isBarricade() or instanceObject:isHealingTower() or instanceObject:isObservatory() or instanceObject:isElephantBarn() or instanceObject:isRepairingTower() or instanceObject:isMineFactory() or instanceObject:isBombFactory() or instanceObject:isDistributor() or instanceObject:isSiegeTower() or instanceObject:isLargeSiegeTower() or instanceObject:isDefenceTower() or instanceObject:isAdvancedBaseTower() or instanceObject:isTankFactory() or instanceObject:isSavageDefenceObject() then
      local isShowMp = false
      local instanceObjectActorWrapper = getInstanceObjectActor(actorKeyRaw)
      do
        do
          do
            if instanceObjectActorWrapper ~= nil then
              local objectSS = (instanceObjectActorWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()
              if instanceObjectActorWrapper:isActionType_BuildingStart() then
                isShowMp = true
              elseif objectSS:isElephantBarn() or objectSS:isObservatory() or objectSS:isSiegeTower() or objectSS:isLargeSiegeTower() or objectSS:isAdvancedBaseTower() or objectSS:isTankFactory() then
                isShowMp = true
              end
            end
            if isShowMp == true then
              local mp = (actorProxyWrapper:get()):getMp()
              local maxMp = (actorProxyWrapper:get()):getMaxMp()
              _PA_LOG("유흥�\160", "settingMpBar " .. tostring(mp) .. "/" .. tostring(maxMp))
              local mpRate = mp * 100 / maxMp
              mpMain:SetProgressRate(mpRate)
              mpMain:SetCurrentProgressRate(mpRate)
              mpMain:SetColor((Defines.Color).C_FFA3EF00)
              mpBack:SetShow(true)
              mpMain:SetShow(true)
            else
              mpBack:SetShow(false)
              mpMain:SetShow(false)
            end
            mpBack:SetShow(false)
            mpMain:SetShow(false)
            if actorProxy:isVehicle() then
              if (actorProxy:getCharacterStaticStatus()):isSiegeBastille() or (actorProxy:getCharacterStaticStatus()):isSiegeFrameTower() or (actorProxy:getCharacterStaticStatus()):isWoodenFence() then
                local isShowMp = true
                local vehicleActorWrapper = getVehicleActorByProxy(actorProxy)
                if vehicleActorWrapper ~= nil then
                  if vehicleActorWrapper:isActionType_BuildingStart() then
                    isShowMp = true
                  else
                    isShowMp = false
                  end
                end
                if isShowMp == true then
                  local mp = (actorProxyWrapper:get()):getMp()
                  local maxMp = (actorProxyWrapper:get()):getMaxMp()
                  _PA_LOG("유흥�\160", "settingMpBar " .. tostring(mp) .. "/" .. tostring(maxMp))
                  local mpRate = mp * 100 / maxMp
                  mpMain:SetProgressRate(mpRate)
                  mpMain:SetCurrentProgressRate(mpRate)
                  mpMain:SetColor((Defines.Color).C_FFA3EF00)
                  mpBack:SetShow(true)
                  mpMain:SetShow(true)
                else
                  mpBack:SetShow(false)
                  mpMain:SetShow(false)
                end
              else
                mpBack:SetShow(false)
                mpMain:SetShow(false)
              end
            else
              mpBack:SetShow(false)
              mpMain:SetShow(false)
            end
            -- DECOMPILER ERROR: 36 unprocessed JMP targets
          end
        end
      end
    end
  end
end

  local settingLocalWarCombatPoint = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_27 , upvalues : UI_color, settingLifeRankIcon
  if actorProxyWrapper == nil then
    return 
  end
  local actorProxy = actorProxyWrapper:get()
  if actorProxy == nil then
    return 
  end
  if actorProxy:isPlayer() == false then
    return 
  end
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  if playerActorProxyWrapper == nil then
    return 
  end
  local playerActorProxy = playerActorProxyWrapper:get()
  if playerActorProxy == nil then
    return 
  end
  local txt_WarPoint = (UI.getChildControl)(targetPanel, "CharacterWarPoint")
  local lifeIcon = {[0] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_0"), [1] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_1"), [2] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_2"), [3] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_3"), [4] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_4"), [5] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_5"), [6] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_6"), [7] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_7"), [8] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_8"), [9] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_9"), [10] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_10"), [11] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_11"), [12] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_12"), [13] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_13")}
  local competitionTeamNo = playerActorProxyWrapper:getCompetitionTeamNo()
  local warCombatPoint = playerActorProxyWrapper:getLocalWarCombatPoint()
  if warCombatPoint > 0 then
    local hasTitle = false
    if playerActorProxyWrapper:checkToTitleKey() then
      if playerActorProxy:isHideCharacterName() and playerActorProxy:isFlashBanged() == false then
        hasTitle = false
      else
        hasTitle = true
      end
    else
      hasTitle = false
    end
    local hasGuild = playerActorProxy:isGuildMember() and (playerActorProxy:isHideGuildName() ~= false and playerActorProxy:isFlashBanged())
    local warPointPos = 0
    if hasTitle == true and hasGuild == true then
      warPointPos = 80
    elseif hasTitle ~= hasGuild then
      warPointPos = 60
    else
      warPointPos = 40
    end
    local nameColor = nil
    if warCombatPoint < 50 then
      nameColor = UI_color.C_FFA1A1A1
    elseif warCombatPoint < 100 then
      nameColor = UI_color.C_FFFFFFFF
    elseif warCombatPoint < 150 then
      nameColor = UI_color.C_FFFFE050
    elseif warCombatPoint < 200 then
      nameColor = UI_color.C_FF75FF50
    elseif warCombatPoint < 250 then
      nameColor = UI_color.C_FF00FFD8
    elseif warCombatPoint < 300 then
      nameColor = UI_color.C_FFFF00D8
    elseif warCombatPoint < 350 then
      nameColor = UI_color.C_FFFF7200
    else
      nameColor = UI_color.C_FFFF0000
    end
    local scaleBuffer = txt_WarPoint:GetScale()
    txt_WarPoint:SetScale(1, 1)
    txt_WarPoint:SetFontColor(nameColor)
    txt_WarPoint:SetText("+" .. warCombatPoint)
    txt_WarPoint:SetShow(true)
    txt_WarPoint:SetSpanSize((txt_WarPoint:GetSpanSize()).x, warPointPos)
    txt_WarPoint:SetScale(scaleBuffer.x, scaleBuffer.y)
    txt_WarPoint:ComputePos()
    for idx = 0, 13 do
      (lifeIcon[idx]):SetShow(false)
    end
  elseif competitionTeamNo >= 0 then
    local hasTitle = false
    if playerActorProxyWrapper:checkToTitleKey() then
      if playerActorProxy:isHideCharacterName() and playerActorProxy:isFlashBanged() == false then
        hasTitle = false
      else
        hasTitle = true
      end
    else
      hasTitle = false
    end
    local hasGuild = playerActorProxy:isGuildMember() and (playerActorProxy:isHideGuildName() ~= false and playerActorProxy:isFlashBanged())
    local warPointPos = 0
    if hasTitle == true and hasGuild == true then
      warPointPos = 80
    elseif hasTitle ~= hasGuild then
      warPointPos = 60
    else
      warPointPos = 40
    end
    local nameColor = FGlobal_TeamColorList(competitionTeamNo - 1)
    local scaleBuffer = txt_WarPoint:GetScale()
    txt_WarPoint:SetScale(1, 1)
    txt_WarPoint:SetFontColor(nameColor)
    txt_WarPoint:SetShow(true)
    txt_WarPoint:SetSpanSize((txt_WarPoint:GetSpanSize()).x, warPointPos)
    txt_WarPoint:SetScale(scaleBuffer.x, scaleBuffer.y)
    txt_WarPoint:ComputePos()
    txt_WarPoint:SetText("")
    if ToClient_CompetitionMatchType() == 0 and competitionTeamNo ~= 0 then
      local teamA_Info = ToClient_GetTeamListAt(0)
      local teamB_Info = ToClient_GetTeamListAt(1)
      local teamA_Name = ""
      local teamB_Name = ""
      if teamA_Info ~= nil and teamB_Info ~= nil then
        teamA_Name = teamA_Info:getTeamName()
        teamB_Name = teamB_Info:getTeamName()
      end
      if teamA_Name ~= "" and teamB_Name ~= "" then
        if competitionTeamNo == 1 then
          txt_WarPoint:SetText("[ " .. teamA_Name .. " ]")
        elseif competitionTeamNo == 2 then
          txt_WarPoint:SetText("[ " .. teamB_Name .. " ]")
        end
      elseif competitionTeamNo == 1 then
        txt_WarPoint:SetText("[ " .. PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_A_TEAM") .. " ]")
      elseif competitionTeamNo == 2 then
        txt_WarPoint:SetText("[ " .. PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_B_TEAM") .. " ]")
      end
    elseif ToClient_CompetitionMatchType() == 1 and competitionTeamNo ~= 0 then
      local leaderInfo = ToClient_GetTeamLeaderInfo(competitionTeamNo)
      if leaderInfo ~= nil then
        txt_WarPoint:SetText("[ " .. leaderInfo:getCharacterName() .. " ]")
      end
    end
    for idx = 0, 13 do
      (lifeIcon[idx]):SetShow(false)
    end
  else
    txt_WarPoint:SetText(0)
    txt_WarPoint:SetShow(false)
    local insertedArray = (Array.new)()
    settingLifeRankIcon(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  end
  -- DECOMPILER ERROR: 30 unprocessed JMP targets
end

  FGlobal_SettingMpBarTemp = function()
  -- function num : 0_28 , upvalues : settingMpBar
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if (selfPlayer:get()):getUIPanel() == nil then
    return 
  end
  settingMpBar((selfPlayer:get()):getActorKeyRaw(), (selfPlayer:get()):getUIPanel(), selfPlayer)
end

  local settingStun = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_29
  local stunBack = (UI.getChildControl)(targetPanel, "ProgressBack_Stun")
  local stunProgress = (UI.getChildControl)(targetPanel, "CharacterStunGageProgress")
  if stunBack == nil or stunProgress == nil then
    return 
  end
  local characterActorProxyWrapper = getCharacterActor(actorKeyRaw)
  if characterActorProxyWrapper == nil then
    return 
  end
  local characterActorProxy = characterActorProxyWrapper:get()
  if characterActorProxy:hasStun() then
    local stun = characterActorProxy:getStun()
    local maxStun = characterActorProxy:getMaxStun()
    if stun ~= 0 then
      stunProgress:SetProgressRate(stun / maxStun * 100)
      stunBack:SetShow(true)
      stunProgress:SetShow(true)
    else
      stunBack:SetShow(false)
      stunProgress:SetShow(false)
    end
  else
    do
      stunBack:SetShow(false)
      stunProgress:SetShow(false)
    end
  end
end

  local settingGuildMarkAndPreemptiveStrike = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_30
  if targetPanel == nil then
    return 
  end
  if (actorProxyWrapper:get()):isPlayer() == false then
    return 
  end
  if (actorProxyWrapper:get()):isPetProxy() or (actorProxyWrapper:get()):isHouseHold() then
    return 
  end
  local preemptiveStrikeBeing = (UI.getChildControl)(targetPanel, "Static_PreemptiveStrikeBeing")
  local murdererMark = (UI.getChildControl)(targetPanel, "Static_MurdererMark")
  local guildBack = (UI.getChildControl)(targetPanel, "Static_GuildBackGround")
  local guildMark = (UI.getChildControl)(targetPanel, "Static_GuildMark")
  local guildMaster = (UI.getChildControl)(targetPanel, "Static_Icon_GuildMaster")
  local guildName = (UI.getChildControl)(targetPanel, "CharacterGuild")
  local nameTag = (UI.getChildControl)(targetPanel, "CharacterName")
  local title = (UI.getChildControl)(targetPanel, "CharacterTitle")
  local alias = (UI.getChildControl)(targetPanel, "CharacterAlias")
  if guildName == nil or guildBack == nil or guildMark == nil or nameTag == nil or title == nil or preemptiveStrikeBeing == nil or murdererMark == nil or actorProxyWrapper == nil or alias == nil then
    return 
  end
  local scaleBuffer = guildMark:GetScale()
  preemptiveStrikeBeing:SetScale(1, 1)
  murdererMark:SetScale(1, 1)
  guildMark:SetScale(1, 1)
  guildBack:SetScale(1, 1)
  guildMaster:SetScale(1, 1)
  guildName:SetScale(1, 1)
  nameTag:SetScale(1, 1)
  title:SetScale(1, 1)
  alias:SetScale(1, 1)
  local widthMax = guildName:GetTextSizeX()
  widthMax = (math.max)(widthMax, nameTag:GetTextSizeX())
  widthMax = (math.max)(widthMax, title:GetTextSizeX())
  if alias:GetShow() then
    widthMax = (math.max)(widthMax, alias:GetTextSizeX())
  end
  local sizeMax = (math.max)(guildMark:GetSizeX(), guildBack:GetSizeX()) / 2
  guildMark:SetSpanSize(-widthMax / 2 - sizeMax, (guildMark:GetSpanSize()).y)
  guildBack:SetSpanSize(-widthMax / 2 - sizeMax, (guildBack:GetSpanSize()).y)
  guildMaster:SetSpanSize(-widthMax / 2 - sizeMax, (guildMaster:GetSpanSize()).y)
  preemptiveStrikeBeing:SetSpanSize(widthMax / 2 + preemptiveStrikeBeing:GetSizeX() / 2 + 5, (preemptiveStrikeBeing:GetSpanSize()).y)
  local actorProxyWrapper = getActor(actorKeyRaw)
  local name = actorProxyWrapper:getName()
  if preemptiveStrikeBeing:GetShow() then
    if name ~= "" then
      murdererMark:SetSpanSize(widthMax / 2 + murdererMark:GetSizeX() + preemptiveStrikeBeing:GetSizeX() / 2 - 10, (murdererMark:GetSpanSize()).y)
    else
      murdererMark:SetSpanSize(widthMax / 2 - murdererMark:GetSizeX() / 2, (murdererMark:GetSpanSize()).y)
    end
  else
    if name ~= "" then
      murdererMark:SetSpanSize(widthMax / 2 + murdererMark:GetSizeX() / 2 + 5, (murdererMark:GetSpanSize()).y)
    else
      murdererMark:SetSpanSize(widthMax / 2 - murdererMark:GetSizeX(), (murdererMark:GetSpanSize()).y)
    end
  end
  preemptiveStrikeBeing:SetScale(scaleBuffer.x, scaleBuffer.y)
  murdererMark:SetScale(scaleBuffer.x, scaleBuffer.y)
  guildMark:SetScale(scaleBuffer.x, scaleBuffer.y)
  guildBack:SetScale(scaleBuffer.x, scaleBuffer.y)
  guildMaster:SetScale(scaleBuffer.x, scaleBuffer.y)
  guildName:SetScale(scaleBuffer.x, scaleBuffer.y)
  nameTag:SetScale(scaleBuffer.x, scaleBuffer.y)
  title:SetScale(scaleBuffer.x, scaleBuffer.y)
  alias:SetScale(scaleBuffer.x, scaleBuffer.y)
end

  local pvpIconTexture = {
[0] = {x1 = 4, y1 = 426, x2 = 36, y2 = 458}
, 
[1] = {x1 = 37, y1 = 426, x2 = 69, y2 = 458}
, 
[2] = {x1 = 70, y1 = 426, x2 = 102, y2 = 458}
, 
[3] = {x1 = 103, y1 = 426, x2 = 135, y2 = 458}
}
  local preemptiveIconTexture = {
[0] = {x1 = 4, y1 = 391, x2 = 36, y2 = 423}
, 
[1] = {x1 = 37, y1 = 391, x2 = 69, y2 = 423}
, 
[2] = {x1 = 70, y1 = 391, x2 = 102, y2 = 423}
, 
[3] = {x1 = 103, y1 = 391, x2 = 135, y2 = 423}
}
  local settingPreemptiveStrike = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_31 , upvalues : hideTimeType, preemptiveIconTexture, pvpIconTexture, settingGuildMarkAndPreemptiveStrike
  local preemptiveStrikeBeing = (UI.getChildControl)(targetPanel, "Static_PreemptiveStrikeBeing")
  if preemptiveStrikeBeing == nil then
    return 
  end
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  if playerActorProxyWrapper == nil then
    return 
  end
  local playerActorProxy = playerActorProxyWrapper:get()
  local isPvpModeOn = playerActorProxy:isPvPMode()
  -- DECOMPILER ERROR at PC29: Unhandled construct in 'MakeBoolean' P3

  local isShowPvpIcon = (playerActorProxy:isPreemptiveStrikeBeing() and playerActorProxy:isHideTimeOver(hideTimeType.preemptiveStrike) == false)
  preemptiveStrikeBeing:SetShow(isShowPvpIcon)
  do
    local tendencyColor = PvpIconColorByTendency(actorKeyRaw)
    if playerActorProxy:isPreemptiveStrikeBeing() and playerActorProxy:isHideTimeOver(hideTimeType.preemptiveStrike) == false then
      preemptiveStrikeBeing:ChangeTextureInfoName("New_UI_Common_ForLua/Default/Default_Buttons_02.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(preemptiveStrikeBeing, (preemptiveIconTexture[tendencyColor]).x1, (preemptiveIconTexture[tendencyColor]).y1, (preemptiveIconTexture[tendencyColor]).x2, (preemptiveIconTexture[tendencyColor]).y2)
      ;
      (preemptiveStrikeBeing:getBaseTexture()):setUV(x1, y1, x2, y2)
      preemptiveStrikeBeing:setRenderTexture(preemptiveStrikeBeing:getBaseTexture())
    else
      preemptiveStrikeBeing:ChangeTextureInfoName("New_UI_Common_ForLua/Default/Default_Buttons_02.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(preemptiveStrikeBeing, (pvpIconTexture[tendencyColor]).x1, (pvpIconTexture[tendencyColor]).y1, (pvpIconTexture[tendencyColor]).x2, (pvpIconTexture[tendencyColor]).y2)
      ;
      (preemptiveStrikeBeing:getBaseTexture()):setUV(x1, y1, x2, y2)
      preemptiveStrikeBeing:setRenderTexture(preemptiveStrikeBeing:getBaseTexture())
    end
    settingGuildMarkAndPreemptiveStrike(actorKeyRaw, targetPanel, actorProxyWrapper)
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

  PvpIconColorByTendency = function(actorKeyRaw)
  -- function num : 0_32
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  if playerActorProxyWrapper == nil then
    return 
  end
  local playerActorProxy = playerActorProxyWrapper:get()
  local tendency = playerActorProxy:getTendency()
  if tendency >= 150000 then
    tendencyColor = 0
  else
    if tendency >= 0 and tendency < 150000 then
      tendencyColor = 1
    else
      if tendency >= -5000 and tendency < 0 then
        tendencyColor = 2
      else
        tendencyColor = 3
      end
    end
  end
  return tendencyColor
end

  local settingMurderer = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_33 , upvalues : hideTimeType, settingGuildMarkAndPreemptiveStrike
  local murdererMark = (UI.getChildControl)(targetPanel, "Static_MurdererMark")
  if murdererMark == nil then
    return 
  end
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  if playerActorProxyWrapper == nil then
    return 
  end
  do
    local playerActorProxy = playerActorProxyWrapper:get()
    murdererMark:SetShow(not playerActorProxy:isMurdererStateBeing() or playerActorProxy:isHideTimeOver(hideTimeType.murdererEnd) == false)
    settingGuildMarkAndPreemptiveStrike(actorKeyRaw, targetPanel, actorProxyWrapper)
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

  local settingGuildTextForAlias = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_34 , upvalues : lifeContentCount
  if targetPanel == nil then
    return 
  end
  local playerActorProxyWrapper = getPlayerActor(actorKeyRaw)
  local guildName = (UI.getChildControl)(targetPanel, "CharacterGuild")
  local alias = (UI.getChildControl)(targetPanel, "CharacterAlias")
  local lifeRankIcon = {}
  local actorProxy = actorProxyWrapper:get()
  if actorProxy:isPlayer() then
    for i = 0, lifeContentCount - 1 do
      lifeRankIcon[i] = (UI.getChildControl)(targetPanel, "Static_LifeRankIcon_" .. i)
      if lifeRankIcon[i] == nil then
        return 
      end
    end
  end
  do
    if guildName == nil or alias == nil or playerActorProxyWrapper == nil then
      return 
    end
    for i = 0, lifeContentCount - 1 do
      if lifeRankIcon[i] == nil then
        return 
      end
    end
    local scaleBuffer = alias:GetScale()
    guildName:SetScale(1, 1)
    alias:SetScale(1, 1)
    for i = 0, lifeContentCount - 1 do
      (lifeRankIcon[i]):SetScale(1, 1)
    end
    local spanY = (alias:GetSpanSize()).y
    if playerActorProxyWrapper:checkToTitleKey() then
      spanY = spanY + alias:GetSizeY()
    end
    guildName:SetSpanSize((guildName:GetSpanSize()).x, spanY)
    if (playerActorProxyWrapper:get()):isGuildMember() and ((playerActorProxyWrapper:get()):isHideGuildName() == false or (playerActorProxyWrapper:get()):isFlashBanged()) then
      spanY = spanY + guildName:GetSizeY()
    end
    for i = 0, lifeContentCount - 1 do
      (lifeRankIcon[i]):SetSpanSize(((lifeRankIcon[i]):GetSpanSize()).x, spanY)
    end
    guildName:SetScale(scaleBuffer.x, scaleBuffer.y)
    alias:SetScale(scaleBuffer.x, scaleBuffer.y)
    for i = 0, lifeContentCount - 1 do
      (lifeRankIcon[i]):SetScale(scaleBuffer.x, scaleBuffer.y)
    end
  end
end

  local settingQuestMark = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_35
  local questMark = (UI.getChildControl)(targetPanel, "Static_Quest_Mark")
  if questMark == nil then
    return 
  end
  if isQuestMonsterByKey(actorKeyRaw) then
    questMark:SetShow(true)
  else
    questMark:SetShow(false)
  end
end

  local settingQuestMarkForce = function(isShow, targetPanel, actorProxyWrapper)
  -- function num : 0_36
  local questMark = (UI.getChildControl)(targetPanel, "Static_Quest_Mark")
  if questMark == nil then
    return 
  end
  questMark:SetShow(isShow)
end

  questIconOverTooltip = function(show, actorKeyRaw)
  -- function num : 0_37
  local actorProxyWrapper = getActor(actorKeyRaw)
  local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
  local panel = (actorProxyWrapper:get()):getUIPanel()
  local questStaticStatusWrapper = npcActorProxyWrapper:getQuestStatisStatusWrapper()
  if questStaticStatusWrapper == nil then
    return 
  end
  local questTitle = questStaticStatusWrapper:getTitle()
  local questTitleTooltip = (UI.getChildControl)(panel, "StaticText_QuestTooltip")
  local questIcon = (UI.getChildControl)(panel, "Static_QuestIcon")
  if show == true then
    local prevScale = questIcon:GetScale()
    questTitleTooltip:SetScale(1, 1)
    questTitleTooltip:SetShow(true)
    questTitleTooltip:SetText(questTitle)
    questTitleTooltip:SetSize(questTitleTooltip:GetTextSizeX() + 20, questTitleTooltip:GetSizeY())
    questTitleTooltip:SetSpanSize((questIcon:GetSpanSize()).x, (questTitleTooltip:GetSpanSize()).y - 20)
    questTitleTooltip:SetAlpha(1)
    questTitleTooltip:SetFontAlpha(1)
  else
    do
      questTitleTooltip:SetShow(false)
    end
  end
end

  local currentTypeChangeCheck = {}
  local settingQuestUI = function(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  -- function num : 0_38 , upvalues : currentTypeChangeCheck
  local questIcon = (UI.getChildControl)(targetPanel, "Static_QuestIcon")
  local questBorder = (UI.getChildControl)(targetPanel, "Static_QuestIconBorder")
  local questClear = (UI.getChildControl)(targetPanel, "Static_QuestClear")
  local lookAtMe = (UI.getChildControl)(targetPanel, "Static_LookAtMe")
  local lookAtMe2 = (UI.getChildControl)(targetPanel, "Static_LookAtMe2")
  local questType = (UI.getChildControl)(targetPanel, "Static_QuestType")
  local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
  if questIcon == nil or questBorder == nil or questClear == nil or lookAtMe == nil or lookAtMe2 == nil or npcActorProxyWrapper == nil then
    return 
  end
  local questStaticStatusWrapper = npcActorProxyWrapper:getQuestStatisStatusWrapper()
  if questStaticStatusWrapper == nil then
    questIcon:SetShow(false)
    questBorder:SetShow(false)
    questClear:SetShow(false)
    lookAtMe:SetShow(false)
    lookAtMe2:SetShow(false)
    questType:SetShow(false)
    return 
  end
  local currentType = (npcActorProxyWrapper:get()):getOverHeadQuestInfoType()
  local isShow = currentType ~= 0
  local currentquestType = questStaticStatusWrapper:getQuestType()
  questIcon:addInputEvent("Mouse_On", "questIconOverTooltip( true,\t" .. actorKeyRaw .. " )")
  questIcon:addInputEvent("Mouse_Out", "questIconOverTooltip( false,\t" .. actorKeyRaw .. " )")
  questIcon:ChangeTextureInfoName(questStaticStatusWrapper:getIconPath())
  questIcon:SetAlpha(1)
  questBorder:SetAlpha(1)
  questClear:SetAlpha(1)
  lookAtMe:SetAlpha(1)
  lookAtMe2:SetAlpha(1)
  questType:SetAlpha(1)
  questIcon:SetAlphaIgnore(true)
  questBorder:SetAlphaIgnore(true)
  questClear:SetAlphaIgnore(true)
  lookAtMe:SetAlphaIgnore(true)
  lookAtMe2:SetAlphaIgnore(true)
  questType:SetAlphaIgnore(true)
  questIcon:SetScaleMinimum(0.5)
  questBorder:SetScaleMinimum(0.5)
  questClear:SetScaleMinimum(0.5)
  lookAtMe:SetScaleMinimum(0.5)
  lookAtMe2:SetScaleMinimum(0.5)
  questType:SetScaleMinimum(0.5)
  questIcon:SetShow(isShow)
  questBorder:SetShow(isShow)
  questClear:SetShow(currentType == 3)
  lookAtMe:SetShow(isShow)
  lookAtMe2:SetShow(isShow)
  questType:SetShow(isShow)
  if isShow then
    local prevAlpha = questBorder:GetAlpha()
    questType:SetShow(false)
    if currentType == 3 then
      questBorder:SetColor((Defines.Color).C_FFFF0000)
      lookAtMe:SetShow(true)
      lookAtMe:SetColor((Defines.Color).C_FFF26A6A)
      lookAtMe2:SetShow(true)
      lookAtMe2:SetColor((Defines.Color).C_FFF26A6A)
      if Panel_Interaction:GetShow() and currentTypeChangeCheck[actorKeyRaw] ~= true then
        Interaction_Close()
      end
      -- DECOMPILER ERROR at PC214: Confused about usage of register: R16 in 'UnsetPending'

      currentTypeChangeCheck[actorKeyRaw] = true
    elseif currentType == 2 then
      questBorder:SetColor((Defines.Color).C_FF008AFF)
      lookAtMe:SetShow(true)
      lookAtMe:SetColor((Defines.Color).C_FF6DC6FF)
      lookAtMe2:SetShow(true)
      lookAtMe2:SetColor((Defines.Color).C_FF6DC6FF)
      -- DECOMPILER ERROR at PC240: Confused about usage of register: R16 in 'UnsetPending'

      currentTypeChangeCheck[actorKeyRaw] = false
    elseif currentType == 1 then
      questBorder:SetColor((Defines.Color).C_FFFFCE22)
      lookAtMe:SetShow(true)
      lookAtMe:SetColor((Defines.Color).C_FFFFEEA0)
      lookAtMe2:SetShow(true)
      lookAtMe2:SetColor((Defines.Color).C_FFFFEEA0)
      -- DECOMPILER ERROR at PC266: Confused about usage of register: R16 in 'UnsetPending'

      currentTypeChangeCheck[actorKeyRaw] = false
    end
    questBorder:SetAlpha(prevAlpha)
    local aControl = {questIcon = questIcon, questBorder = questBorder, questClear = questClear, lookAtMe = lookAtMe, lookAtMe2 = lookAtMe2, questType = questType, GetSizeX = function()
    -- function num : 0_38_0 , upvalues : questBorder
    return questBorder:GetSizeX()
  end
, SetScale = function(self, x, y)
    -- function num : 0_38_1 , upvalues : questBorder, questIcon, questClear, lookAtMe, lookAtMe2, questType
    questBorder:SetScale(x, y)
    questIcon:SetScale(x, y)
    questClear:SetScale(x, y)
    lookAtMe:SetScale(x, y)
    lookAtMe2:SetScale(x, y)
    questType:SetScale(x, y)
  end
, SetSpanSize = function(self, x, y)
    -- function num : 0_38_2 , upvalues : questBorder, questIcon, questClear, lookAtMe, lookAtMe2, questType
    questBorder:SetSpanSize(x, y)
    questIcon:SetSpanSize(x, y + 8)
    questClear:SetSpanSize(x, y + 10)
    lookAtMe:SetSpanSize(x, y + 4)
    lookAtMe2:SetSpanSize(x, y)
    questType:SetSpanSize(x, y + 40)
  end
, GetSpanSize = function()
    -- function num : 0_38_3 , upvalues : questBorder
    return questBorder:GetSpanSize()
  end
, GetScale = function()
    -- function num : 0_38_4 , upvalues : questBorder
    return questBorder:GetScale()
  end
, GetShow = function()
    -- function num : 0_38_5 , upvalues : questBorder
    return questBorder:GetShow()
  end
}
    if currentquestType == 5 then
      questBorder:SetColor((Defines.Color).C_FF88DF00)
      lookAtMe:SetShow(true)
      lookAtMe:SetColor((Defines.Color).C_FF88DF00)
      lookAtMe2:SetShow(true)
      lookAtMe2:SetColor((Defines.Color).C_FF88DF00)
      questType:SetShow(true)
      if currentType == 2 then
        questBorder:SetColor((Defines.Color).C_FF008AFF)
        lookAtMe:SetShow(true)
        lookAtMe:SetColor((Defines.Color).C_FF88DF00)
        lookAtMe2:SetShow(true)
        lookAtMe2:SetColor((Defines.Color).C_FF88DF00)
      end
    end
    insertedArray:push_back(aControl)
  end
  -- DECOMPILER ERROR: 8 unprocessed JMP targets
end

  local settingBillBoardMode = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_39
  houseHoldActorWrapper = getHouseHoldActor(actorKeyRaw)
  if houseHoldActorWrapper ~= nil and (houseHoldActorWrapper:get()):isTent() == false and ((houseHoldActorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isBarricade() == false then
    targetPanel:Set3DRenderType(2)
    targetPanel:Set3DOffsetZ(40)
  end
end

  local settingBubbleBox = function(actorKeyRaw, targetPanel, actorProxyWrapper, message)
  -- function num : 0_40 , upvalues : hideTimeType
  local targetStatic = (UI.getChildControl)(targetPanel, "StaticText_BubbleBox")
  local targetStaticBG = (UI.getChildControl)(targetPanel, "Static_BubbleBox")
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R6 in 'UnsetPending'

  bubbleBox.lastShowDeltaTime = 0
  targetStatic:SetScale(1, 1)
  targetStaticBG:SetScale(1, 1)
  targetStatic:SetSize(210, 10)
  targetStatic:SetText(message)
  local sizeY = targetStatic:GetSizeY() + 40
  local sizeY = targetStatic:GetSizeY() + 40
  if targetStatic:GetTextSizeX() > 210 then
    targetStatic:SetSize(targetStatic:GetSizeX(), sizeY)
    targetStaticBG:SetSize(targetStatic:GetSizeX() + 18, sizeY)
    targetStatic:SetSpanSize((targetStaticBG:GetSpanSize()).x - 10, (targetStaticBG:GetSpanSize()).y)
  else
    targetStatic:SetSize(targetStatic:GetTextSizeX(), sizeY)
    targetStaticBG:SetSize(targetStatic:GetTextSizeX() + 27, sizeY)
    targetStatic:SetSpanSize((targetStaticBG:GetSpanSize()).x - 10, (targetStaticBG:GetSpanSize()).y)
  end
  local time = nil
  if #message < 5 then
    time = 2.22
  else
    if #message < 10 then
      time = 2.72
    else
      if #message < 15 then
        time = 3.22
      else
        if #message < 20 then
          time = 3.72
        else
          if #message < 25 then
            time = 4.22
          else
            if #message < 30 then
              time = 4.72
            else
              time = 5.22
            end
          end
        end
      end
    end
  end
  ActorInsertShowTime(actorKeyRaw, hideTimeType.bubbleBox, time * 1000)
end

  local settingBubbleBoxShow = function(actorKeyRaw, targetPanel, actorProxyWrapper, isShow)
  -- function num : 0_41
  local targetStatic = (UI.getChildControl)(targetPanel, "StaticText_BubbleBox")
  local targetStaticBG = (UI.getChildControl)(targetPanel, "Static_BubbleBox")
  targetStatic:SetShow(isShow)
  targetStaticBG:SetShow(isShow)
end

  local settingWaitCommentLaunch = function(isShow)
  -- function num : 0_42
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local panel = selfPlayer:getWaitCommentPanel()
  if panel == nil then
    return 
  end
  local targetBoard = (UI.getChildControl)(panel, "Static_Board")
  local targetPaper = (UI.getChildControl)(panel, "Static_Paper")
  local targetEditComment = (UI.getChildControl)(panel, "Edit_Txt")
  local targetPin_1 = (UI.getChildControl)(panel, "Static_Pin_1")
  local targetPin_2 = (UI.getChildControl)(panel, "Static_Pin_2")
  local targetPin_3 = (UI.getChildControl)(panel, "Static_Pin_3")
  local targetPin_4 = (UI.getChildControl)(panel, "Static_Pin_4")
  local targetRoll_L = (UI.getChildControl)(panel, "Static_Roll_L")
  local targetRoll_R = (UI.getChildControl)(panel, "Static_Roll_R")
  local targetPlayerID = (UI.getChildControl)(panel, "StaticText_ID")
  if isShow then
    local scaleBuffer = targetBoard:GetScale()
    targetBoard:SetScale(1, 1)
    targetEditComment:SetScale(1, 1)
    targetPaper:SetScale(1, 1)
    targetBoard:SetSize(100, 110)
    targetEditComment:SetSize(45, 56)
    targetPaper:SetSize(75, 56)
    targetBoard:SetScale(scaleBuffer.x, scaleBuffer.y)
    targetEditComment:SetScale(scaleBuffer.x, scaleBuffer.y)
    targetPaper:SetScale(scaleBuffer.x, scaleBuffer.y)
    local paperSizeX = targetPaper:GetSizeX()
    local paperPosX = targetPaper:GetPosX()
    targetEditComment:SetEditText("", false)
    targetEditComment:SetMaxInput(20)
    targetRoll_L:SetShow(true)
    targetRoll_R:SetShow(true)
    targetPaper:SetShow(true)
    targetEditComment:SetShow(true)
    targetPaper:SetIgnore(false)
    targetRoll_L:SetSpanSize(-paperSizeX / 2, (targetRoll_L:GetSpanSize()).y)
    targetRoll_R:SetSpanSize(paperSizeX / 2, (targetRoll_R:GetSpanSize()).y)
    targetPaper:addInputEvent("Mouse_LUp", "settingWaitCommentReady()")
  else
    do
      targetRoll_L:SetShow(false)
      targetRoll_R:SetShow(false)
      targetPaper:SetShow(false)
      targetEditComment:SetShow(false)
      targetBoard:SetShow(false)
      targetPlayerID:SetShow(false)
      targetPin_1:SetShow(false)
      targetPin_2:SetShow(false)
      targetPin_3:SetShow(false)
      targetPin_4:SetShow(false)
      targetEditComment:SetIgnore(true)
    end
  end
end

  settingWaitCommentReady = function()
  -- function num : 0_43
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local panel = selfPlayer:getWaitCommentPanel()
  if panel == nil then
    return 
  end
  local targetBoard = (UI.getChildControl)(panel, "Static_Board")
  local targetPaper = (UI.getChildControl)(panel, "Static_Paper")
  local targetEditComment = (UI.getChildControl)(panel, "Edit_Txt")
  local targetPin_1 = (UI.getChildControl)(panel, "Static_Pin_1")
  local targetPin_2 = (UI.getChildControl)(panel, "Static_Pin_2")
  local targetPin_3 = (UI.getChildControl)(panel, "Static_Pin_3")
  local targetPin_4 = (UI.getChildControl)(panel, "Static_Pin_4")
  local targetRoll_L = (UI.getChildControl)(panel, "Static_Roll_L")
  local targetRoll_R = (UI.getChildControl)(panel, "Static_Roll_R")
  local targetPlayerID = (UI.getChildControl)(panel, "StaticText_ID")
  local scaleBuffer = targetEditComment:GetScale()
  targetEditComment:SetScale(1, 1)
  targetPaper:SetScale(1, 1)
  targetEditComment:SetSize(256, 56)
  targetPaper:SetSize(281, 56)
  targetEditComment:SetScale(scaleBuffer.x, scaleBuffer.y)
  targetPaper:SetScale(scaleBuffer.x, scaleBuffer.y)
  targetEditComment:ComputePos()
  targetPaper:ComputePos()
  local paperSizeX = targetPaper:GetSizeX()
  local paperPosX = targetPaper:GetPosX()
  targetRoll_L:SetSpanSize(-paperSizeX / 2, (targetRoll_L:GetSpanSize()).y)
  targetRoll_R:SetSpanSize(paperSizeX / 2, (targetRoll_R:GetSpanSize()).y)
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
  SetFocusEdit(targetEditComment)
  targetBoard:SetShow(false)
  targetPaper:SetShow(true)
  targetEditComment:SetShow(true)
  targetRoll_L:SetShow(true)
  targetRoll_R:SetShow(true)
  targetPlayerID:SetShow(false)
  targetPin_1:SetShow(false)
  targetPin_2:SetShow(false)
  targetPin_3:SetShow(false)
  targetPin_4:SetShow(false)
end

  settingWaitCommentConfirmReload = function()
  -- function num : 0_44
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  if selfPlayer:isShowWaitComment() == false then
    return 
  end
  local panel = selfPlayer:getWaitCommentPanel()
  if panel == nil then
    return 
  end
  local targetEditComment = (UI.getChildControl)(panel, "Edit_Txt")
  targetEditComment:SetEditText(selfPlayer:getWaitComment(), true)
  settingWaitCommentConfirm()
end

  settingWaitCommentConfirm = function()
  -- function num : 0_45
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
  ClearFocusEdit()
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local panel = selfPlayer:getWaitCommentPanel()
  if panel == nil then
    return 
  end
  local targetBoard = (UI.getChildControl)(panel, "Static_Board")
  local targetPaper = (UI.getChildControl)(panel, "Static_Paper")
  local targetEditComment = (UI.getChildControl)(panel, "Edit_Txt")
  local targetPin_1 = (UI.getChildControl)(panel, "Static_Pin_1")
  local targetPin_2 = (UI.getChildControl)(panel, "Static_Pin_2")
  local targetPin_3 = (UI.getChildControl)(panel, "Static_Pin_3")
  local targetPin_4 = (UI.getChildControl)(panel, "Static_Pin_4")
  local targetRoll_L = (UI.getChildControl)(panel, "Static_Roll_L")
  local targetRoll_R = (UI.getChildControl)(panel, "Static_Roll_R")
  local targetPlayerID = (UI.getChildControl)(panel, "StaticText_ID")
  targetPlayerID:SetText("[" .. selfPlayerWrapper:getName() .. "]")
  targetBoard:SetShow(true)
  targetPlayerID:SetShow(true)
  targetPin_1:SetShow(true)
  targetPin_2:SetShow(true)
  targetPin_3:SetShow(true)
  targetPin_4:SetShow(true)
  targetEditComment:SetShow(true)
  targetPin_1:AddEffect("fUI_Repair01", false, 0, 0)
  targetPin_2:AddEffect("fUI_Repair01", false, 0, 0)
  targetPin_3:AddEffect("fUI_Repair01", false, 0, 0)
  targetPin_4:AddEffect("fUI_Repair01", false, 0, 0)
  targetRoll_L:SetShow(false)
  targetRoll_R:SetShow(false)
  targetEditComment:SetIgnore(true)
  targetPaper:SetIgnore(false)
  updateWaitComment(targetEditComment:GetEditText())
  targetEditComment:SetEditText(chatting_filteredText(targetEditComment:GetEditText()), true)
  local sizeY = targetEditComment:GetSizeY()
  local scaleBuffer = targetEditComment:GetScale()
  targetEditComment:SetScale(1, 1)
  targetPaper:SetScale(1, 1)
  targetBoard:SetScale(1, 1)
  targetPlayerID:SetScale(1, 1)
  if targetEditComment:GetTextSizeX() > 256 then
    targetBoard:SetSize(targetEditComment:GetSizeX() + 50, sizeY + 65)
    targetPaper:SetSize(targetEditComment:GetSizeX() + 25, sizeY + 10)
  else
    targetEditComment:SetSize(targetEditComment:GetTextSizeX(), targetEditComment:GetSizeY())
    targetPaper:SetSize(targetEditComment:GetTextSizeX() + 25, targetPaper:GetSizeY())
    targetBoard:SetSize(targetEditComment:GetTextSizeX() + 60, targetBoard:GetSizeY())
  end
  targetPlayerID:SetSize(targetPaper:GetSizeX(), targetPlayerID:GetSizeY())
  targetBoard:SetScale(scaleBuffer.x, scaleBuffer.y)
  targetPaper:SetScale(scaleBuffer.x, scaleBuffer.y)
  targetEditComment:SetScale(scaleBuffer.x, scaleBuffer.y)
  targetPlayerID:SetScale(scaleBuffer.x, scaleBuffer.y)
  targetBoard:ComputePos()
  targetPaper:ComputePos()
  targetEditComment:ComputePos()
  targetPlayerID:ComputePos()
  targetPin_1:SetSpanSize(targetPaper:GetPosX() + 5, (targetPin_1:GetSpanSize()).y)
  targetPin_2:SetSpanSize(targetPaper:GetPosX() + targetPaper:GetSizeX() - 15, (targetPin_2:GetSpanSize()).y)
  targetPin_3:SetSpanSize(targetPaper:GetPosX() + 5, (targetPin_3:GetSpanSize()).y)
  targetPin_4:SetSpanSize(targetPaper:GetPosX() + targetPaper:GetSizeX() - 15, (targetPin_4:GetSpanSize()).y)
end

  WaitComment_CheckCurrentUiEdit = function(targetUI)
  -- function num : 0_46
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return false
  end
  local selfPlayer = selfPlayerWrapper:get()
  local panel = selfPlayer:getWaitCommentPanel()
  if panel == nil then
    return false
  end
  do
    local targetEditComment = (UI.getChildControl)(panel, "Edit_Txt")
    do return targetUI ~= nil and targetUI:GetKey() == targetEditComment:GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

  local settingWaitComment = function(actorKeyRaw, panel, actorProxyWrapper, isShow, isforce)
  -- function num : 0_47
  local selfPlayer = getSelfPlayer()
  local selfActorKeyRaw = selfPlayer:getActorKey()
  if actorKeyRaw == selfActorKeyRaw and isforce ~= true then
    return 
  end
  local targetPanel = panel
  if (actorProxyWrapper:get()):isSelfPlayer() then
    targetPanel = ((getSelfPlayer()):get()):getWaitCommentPanel()
  end
  local playerActorProxy = getPlayerActor(actorKeyRaw)
  if playerActorProxy == nil then
    return 
  end
  local message = (playerActorProxy:get()):getWaitComment()
  local targetBoard = (UI.getChildControl)(targetPanel, "Static_Board")
  local targetPaper = (UI.getChildControl)(targetPanel, "Static_Paper")
  local targetEditComment = (UI.getChildControl)(targetPanel, "Edit_Txt")
  local targetPin_1 = (UI.getChildControl)(targetPanel, "Static_Pin_1")
  local targetPin_2 = (UI.getChildControl)(targetPanel, "Static_Pin_2")
  local targetPin_3 = (UI.getChildControl)(targetPanel, "Static_Pin_3")
  local targetPin_4 = (UI.getChildControl)(targetPanel, "Static_Pin_4")
  local targetPlayerID = (UI.getChildControl)(targetPanel, "StaticText_ID")
  if isShow and message ~= nil and message ~= "" then
    targetBoard:SetShow(true)
    targetPaper:SetShow(true)
    targetEditComment:SetShow(true)
    targetPin_1:SetShow(true)
    targetPin_2:SetShow(true)
    targetPin_3:SetShow(true)
    targetPin_4:SetShow(true)
    targetPlayerID:SetShow(true)
    local scaleBuffer = targetEditComment:GetScale()
    targetEditComment:SetScale(1, 1)
    targetBoard:SetScale(1, 1)
    targetPaper:SetScale(1, 1)
    targetPlayerID:SetScale(1, 1)
    targetEditComment:SetSize(256, 56)
    targetPlayerID:SetText("[" .. playerActorProxy:getName() .. "]")
    targetEditComment:SetText(message)
    local sizeY = targetEditComment:GetSizeY()
    targetEditComment:SetSize(targetEditComment:GetTextSizeX(), targetEditComment:GetSizeY())
    targetBoard:SetSize(targetEditComment:GetTextSizeX() + 60, targetBoard:GetSizeY())
    targetPaper:SetSize(targetEditComment:GetTextSizeX() + 25, targetPaper:GetSizeY())
    targetPlayerID:SetSize(targetPaper:GetSizeX(), targetPlayerID:GetSizeY())
    targetEditComment:SetScale(scaleBuffer.x, scaleBuffer.y)
    targetBoard:SetScale(scaleBuffer.x, scaleBuffer.y)
    targetPaper:SetScale(scaleBuffer.x, scaleBuffer.y)
    targetPlayerID:SetScale(scaleBuffer.x, scaleBuffer.y)
    targetBoard:ComputePos()
    targetPaper:ComputePos()
    targetEditComment:ComputePos()
    targetPlayerID:ComputePos()
    targetPin_1:SetSpanSize(-targetEditComment:GetTextSizeX() / 2, 40)
    targetPin_2:SetSpanSize(targetEditComment:GetTextSizeX() / 2, 40)
    targetPin_3:SetSpanSize(targetEditComment:GetTextSizeX() / 2, 5)
    targetPin_4:SetSpanSize(-targetEditComment:GetTextSizeX() / 2, 5)
  else
    do
      targetBoard:SetShow(false)
      targetPaper:SetShow(false)
      targetEditComment:SetShow(false)
      targetPin_1:SetShow(false)
      targetPin_2:SetShow(false)
      targetPin_3:SetShow(false)
      targetPin_4:SetShow(false)
      targetPlayerID:SetShow(false)
    end
  end
end

  local settingSelfPlayerNameHelpText = function(actorKeyRaw, panel, actorProxyWrapper)
  -- function num : 0_48
end

  local furnitureActorKeyRaw = nil
  Furniture_Check = function(actorKeyRaw)
  -- function num : 0_49 , upvalues : furnitureActorKeyRaw, furnitureCheck, settingHpBar
  local actorProxyWrapper = getActor(actorKeyRaw)
  local actorProxy = actorProxyWrapper:get()
  local characterStaticStatus = actorProxy:getCharacterStaticStatus()
  furnitureActorKeyRaw = actorKeyRaw
  if actorProxy == nil or characterStaticStatus == nil or actorKeyRaw == nil then
    return 
  end
  if actorProxy:isInstallationActor() then
    local installationActorWrapper = getInstallationActor(furnitureActorKeyRaw)
    if Panel_Housing:IsShow() then
      return 
    end
    local installationType = ((installationActorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):getInstallationType()
    if isShowInstallationEnduranceType(installationType) == false then
      return 
    end
  end
  if toInt64(0, 0) ~= installationActorWrapper:getOwnerHouseholdNo_s64() then
    if installationActorWrapper:isHavestInstallation() then
      do
        furnitureCheck = true
        local panel = (actorProxyWrapper:get()):getUIPanel()
        if panel == nil then
          return 
        end
        settingHpBar(actorKeyRaw, panel, actorProxyWrapper)
      end
    end
  end
end

  Funiture_Endurance_Hide = function()
  -- function num : 0_50 , upvalues : furnitureCheck, furnitureActorKeyRaw, settingHpBar
  if furnitureCheck == true and furnitureActorKeyRaw ~= nil then
    local actorProxyWrapper = getActor(furnitureActorKeyRaw)
    if actorProxyWrapper ~= nil then
      local actorProxy = actorProxyWrapper:get()
      if actorProxy ~= nil then
        local panel = actorProxy:getUIPanel()
        if panel == nil then
          return 
        end
        furnitureCheck = false
        settingHpBar(furnitureActorKeyRaw, panel, actorProxyWrapper)
      else
        do
          do
            do
              _PA_LOG("LUA", "called function Funiture_Endurance_Hide() / actorProxyWrapper:get()에서 nullpointer�\128 온다!!!!")
              do return  end
              _PA_LOG("LUA", "called function Funiture_Endurance_Hide() / getActor( furnitureActorKeyRaw )에서 nullpointer�\128 온다!!!!")
              do return  end
              furnitureActorKeyRaw = nil
            end
          end
        end
      end
    end
  end
end

  local TypeByLoadData = {[ActorProxyType.isActorProxy] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_51 , upvalues : settingName
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isCharacter] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_52 , upvalues : settingName
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isPlayer] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_53 , upvalues : settingName, settingPlayerName, settingTitle, settingGuildInfo, settingLifeRankIcon, settingHpBarInitState, settingHpBar, settingPreemptiveStrike, settingStun, settingGuildTextForAlias, settingLocalWarCombatPoint, settingMurderer, settingGuildMarkAndPreemptiveStrike
  local insertedArray = (Array.new)()
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingPlayerName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingTitle(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingGuildInfo(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingLifeRankIcon(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  settingHpBarInitState(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingPreemptiveStrike(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingStun(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingGuildTextForAlias(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingLocalWarCombatPoint(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingMurderer(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isSelfPlayer] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_54 , upvalues : settingName, settingPlayerName, settingAlias, settingTitle, settingGuildInfo, settingLifeRankIcon, settingHpBarInitState, settingHpBar, settingPreemptiveStrike, settingStun, settingSelfPlayerNameHelpText, settingGuildTextForAlias, settingLocalWarCombatPoint, settingMurderer, settingGuildMarkAndPreemptiveStrike
  local insertedArray = (Array.new)()
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingPlayerName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingAlias(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingTitle(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingGuildInfo(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingLifeRankIcon(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  settingHpBarInitState(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingPreemptiveStrike(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingStun(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingSelfPlayerNameHelpText(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingWaitCommentConfirmReload()
  settingGuildTextForAlias(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingLocalWarCombatPoint(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingMurderer(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isOtherPlayer] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_55 , upvalues : settingName, settingPlayerName, settingAlias, settingTitle, settingGuildInfo, settingLifeRankIcon, settingHpBarInitState, settingHpBar, settingPreemptiveStrike, settingStun, settingWaitComment, settingGuildTextForAlias, settingLocalWarCombatPoint, settingMurderer, settingGuildMarkAndPreemptiveStrike
  local insertedArray = (Array.new)()
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingPlayerName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingAlias(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingTitle(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingGuildInfo(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingLifeRankIcon(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  settingHpBarInitState(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingPreemptiveStrike(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingStun(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingWaitComment(actorKeyRaw, targetPanel, actorProxyWrapper, true)
  settingGuildTextForAlias(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingLocalWarCombatPoint(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingMurderer(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isAlterego] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_56 , upvalues : settingName
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isMonster] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_57 , upvalues : settingName, settingMonsterName, settingTitle, settingHpBarInitState, settingHpBar, settingQuestMark, settingStun
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingMonsterName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingTitle(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBarInitState(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingQuestMark(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingStun(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isNpc] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_58 , upvalues : settingName, settingTitle, settingHpBarInitState, settingHpBar, settingQuestMark, settingQuestUI, settingFirstTalk, settingImportantTalk, settingOtherHeadIcon, sortCenterX
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingTitle(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBarInitState(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingQuestMark(actorKeyRaw, targetPanel, actorProxyWrapper)
  local insertedArray = (Array.new)()
  settingQuestUI(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  settingFirstTalk(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  settingImportantTalk(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  settingOtherHeadIcon(actorKeyRaw, targetPanel, actorProxyWrapper, insertedArray)
  sortCenterX(insertedArray)
end
, [ActorProxyType.isDeadBody] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_59
end
, [ActorProxyType.isVehicle] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_60 , upvalues : settingName, settingQuestMark, settingHpBarInitState, settingHpBar, settingMpBar
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingQuestMark(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBarInitState(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingMpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isGate] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_61
end
, [ActorProxyType.isHouseHold] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_62 , upvalues : settingName, settingHpBarInitState, settingHpBar, settingBillBoardMode
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBarInitState(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingBillBoardMode(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isInstallationActor] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_63 , upvalues : settingName, settingHpBarInitState, settingHpBar
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBarInitState(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
end
, [ActorProxyType.isCollect] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_64
end
, [ActorProxyType.isInstanceObject] = function(actorKeyRaw, targetPanel, actorProxyWrapper)
  -- function num : 0_65 , upvalues : settingName, settingHpBarInitState, settingHpBar, settingMpBar
  settingName(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBarInitState(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingMpBar(actorKeyRaw, targetPanel, actorProxyWrapper)
end
}
  EventActorCreated_NameTag = function(actorKeyRaw, targetPanel, actorProxyType, actorProxyWrapper)
  -- function num : 0_66 , upvalues : TypeByLoadData
  if TypeByLoadData[actorProxyType] ~= nil then
    (TypeByLoadData[actorProxyType])(actorKeyRaw, targetPanel, actorProxyWrapper)
  end
end

  FromClient_ChangeTopRankUser = function(actorKeyRaw)
  -- function num : 0_67 , upvalues : settingLifeRankIcon, settingGuildTextForAlias
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  local insertedArray = (Array.new)()
  settingLifeRankIcon(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingGuildTextForAlias(actorKeyRaw, panel, actorProxyWrapper)
end

  FromClient_NameTag_TendencyChanged = function(actorKeyRaw, tendencyValue)
  -- function num : 0_68 , upvalues : settingPlayerName, settingGuildMarkAndPreemptiveStrike, settingPreemptiveStrike
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingPlayerName(actorKeyRaw, panel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
  settingPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
end

  EventActorFirsttalk = function(actorKeyRaw, isFirsttalkOn)
  -- function num : 0_69 , upvalues : settingQuestUI, settingFirstTalk, settingImportantTalk, settingOtherHeadIcon, sortCenterX
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  local insertedArray = (Array.new)()
  settingQuestUI(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingFirstTalk(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingImportantTalk(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingOtherHeadIcon(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  sortCenterX(insertedArray)
end

  EventActorImportantTalk = function(actorKeyRaw, isImportantTalk)
  -- function num : 0_70 , upvalues : settingQuestUI, settingFirstTalk, settingImportantTalk, settingOtherHeadIcon, sortCenterX
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  local insertedArray = (Array.new)()
  settingQuestUI(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingFirstTalk(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingImportantTalk(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingOtherHeadIcon(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  sortCenterX(insertedArray)
end

  EventActorChangeGuildInfo = function(actorKeyRaw, guildName)
  -- function num : 0_71 , upvalues : settingGuildInfo, settingGuildMarkAndPreemptiveStrike, settingLifeRankIcon, settingGuildTextForAlias, settingLocalWarCombatPoint
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  local insertedArray = (Array.new)()
  settingGuildInfo(actorKeyRaw, panel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
  settingLifeRankIcon(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingGuildTextForAlias(actorKeyRaw, panel, actorProxyWrapper)
  settingLocalWarCombatPoint(actorKeyRaw, panel, actorProxyWrapper)
end

  FromClient_EventActorUpdateTitleKey = function(actorKeyRaw)
  -- function num : 0_72 , upvalues : settingAlias, settingGuildMarkAndPreemptiveStrike, settingLifeRankIcon, settingGuildTextForAlias, settingLocalWarCombatPoint
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  local insertedArray = (Array.new)()
  settingAlias(actorKeyRaw, panel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
  settingLifeRankIcon(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingGuildTextForAlias(actorKeyRaw, panel, actorProxyWrapper)
  settingLocalWarCombatPoint(actorKeyRaw, panel, actorProxyWrapper)
end

  FromClient_EventActorChangeGuildInfo_HaveLand = function(actorProxyWrapper, Panel, isoccupyTerritory)
  -- function num : 0_73 , upvalues : settingGuildInfo, settingGuildMarkAndPreemptiveStrike
  local targetPanel = Panel
  if actorProxyWrapper == nil or isoccupyTerritory == nil then
    return 
  end
  local actorKeyRaw = (actorProxyWrapper:get()):getActorKeyRaw()
  settingGuildInfo(actorKeyRaw, targetPanel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, targetPanel, actorProxyWrapper)
end

  EventActorPvpModeChange = function(actorKeyRaw)
  -- function num : 0_74 , upvalues : settingPreemptiveStrike
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  if (actorProxyWrapper:get()):isPlayer() then
    settingPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
  end
end

  EventActorChangeLevel = function(actorKeyRaw)
  -- function num : 0_75 , upvalues : settingMonsterName, settingPlayerName
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  if (actorProxyWrapper:get()):isMonster() then
    settingMonsterName(actorKeyRaw, panel, actorProxyWrapper)
  else
    if (actorProxyWrapper:get()):isPlayer() then
      settingPlayerName(actorKeyRaw, panel, actorProxyWrapper)
    end
  end
end

  EventActorHpChanged = function(actorKeyRaw, hp, maxHp)
  -- function num : 0_76 , upvalues : settingHpBar
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingHpBar(actorKeyRaw, panel, actorProxyWrapper)
end

  EventChangeCharacterName = function(actorKeyRaw, characterName)
  -- function num : 0_77 , upvalues : settingName, settingAlias, settingGuildMarkAndPreemptiveStrike, settingLifeRankIcon, settingPlayerName, settingLocalWarCombatPoint
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  local insertedArray = (Array.new)()
  settingName(actorKeyRaw, panel, actorProxyWrapper)
  settingAlias(actorKeyRaw, panel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
  settingLifeRankIcon(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  if (actorProxyWrapper:get()):isPlayer() then
    settingPlayerName(actorKeyRaw, panel, actorProxyWrapper)
    settingLocalWarCombatPoint(actorKeyRaw, panel, actorProxyWrapper)
  end
end

  FGlobal_ReSet_SiegeBuildingName = function(actorKeyRaw)
  -- function num : 0_78 , upvalues : settingName
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingName(actorKeyRaw, panel, actorProxyWrapper)
end

  insertPartyMemberGage = function(actorKeyRaw)
  -- function num : 0_79 , upvalues : settingHpBar
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingHpBar(actorKeyRaw, panel, actorProxyWrapper)
  if (getSelfPlayer()):getActorKey() ~= actorKeyRaw then
    local textName = actorProxyWrapper:getName()
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERNAMETAG_PARTY_ACK", "textName", textName))
  end
end

  removePartyMemberGage = function(actorKeyRaw)
  -- function num : 0_80 , upvalues : settingHpBar
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingHpBar(actorKeyRaw, panel, actorProxyWrapper)
end

  EventActorAddDamage = function(actorKeyRaw, variedPoint, attackResult_IntValue, additionalDamageType, position)
  -- function num : 0_81 , upvalues : hideTimeType
  if attackResult_IntValue == 0 or attackResult_IntValue == 1 or attackResult_IntValue == 2 or attackResult_IntValue == 3 or attackResult_IntValue == 4 or attackResult_IntValue == 5 then
    ActorInsertShowTime(actorKeyRaw, hideTimeType.overHeadUI, 0)
  end
end

  EventShowProgressBar = function(actorKeyRaw, aHideTimeType)
  -- function num : 0_82 , upvalues : hideTimeType, settingPreemptiveStrike, settingHpBar, settingBubbleBoxShow, settingMurderer
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  if hideTimeType.preemptiveStrike == aHideTimeType then
    local panel = (actorProxyWrapper:get()):getUIPanel()
    if panel == nil then
      return 
    end
    settingPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
  else
    do
      if hideTimeType.overHeadUI == aHideTimeType then
        local panel = (actorProxyWrapper:get()):getUIPanel()
        if panel == nil then
          return 
        end
        settingHpBar(actorKeyRaw, panel, actorProxyWrapper)
      else
        do
          if hideTimeType.bubbleBox == aHideTimeType then
            local panel = (actorProxyWrapper:get()):getBubbleBoxUIPanel()
            if panel == nil then
              return 
            end
            settingBubbleBoxShow(actorKeyRaw, panel, actorProxyWrapper, true)
          else
            do
              if hideTimeType.murdererEnd == aHideTimeType then
                local panel = (actorProxyWrapper:get()):getUIPanel()
                if panel == nil then
                  return 
                end
                settingMurderer(actorKeyRaw, panel, actorProxyWrapper, true)
              end
            end
          end
        end
      end
    end
  end
end

  EventHideProgressBar = function(actorKeyRaw, aHideTimeType)
  -- function num : 0_83 , upvalues : hideTimeType, settingPreemptiveStrike, settingHpBar, settingBubbleBoxShow, settingMurderer
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  if hideTimeType.preemptiveStrike == aHideTimeType then
    local panel = (actorProxyWrapper:get()):getUIPanel()
    if panel == nil then
      return 
    end
    settingPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
  else
    do
      if hideTimeType.overHeadUI == aHideTimeType then
        local panel = (actorProxyWrapper:get()):getUIPanel()
        if panel == nil then
          return 
        end
        settingHpBar(actorKeyRaw, panel, actorProxyWrapper)
      else
        do
          if hideTimeType.bubbleBox == aHideTimeType then
            local panel = (actorProxyWrapper:get()):getBubbleBoxUIPanel()
            if panel == nil then
              return 
            end
            settingBubbleBoxShow(actorKeyRaw, panel, actorProxyWrapper, false)
          else
            do
              if hideTimeType.murdererEnd == aHideTimeType then
                local panel = (actorProxyWrapper:get()):getUIPanel()
                if panel == nil then
                  return 
                end
                settingMurderer(actorKeyRaw, panel, actorProxyWrapper, true)
              end
            end
          end
        end
      end
    end
  end
end

  update_Changed_StunGage = function(actorKeyRaw, curStun, maxStun)
  -- function num : 0_84 , upvalues : settingStun
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local actorProxy = actorProxyWrapper:get()
  if actorProxy:isMonster() or actorProxy:isPlayer() == false then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingStun(actorKeyRaw, panel, actorProxyWrapper)
end

  EventActor_QuestUpdateInserted = function(actorKeyRaw)
  -- function num : 0_85 , upvalues : settingQuestMarkForce
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingQuestMarkForce(true, panel, actorProxyWrapper)
end

  EventActor_QuestUpdateDeleted = function(actorKeyRaw)
  -- function num : 0_86 , upvalues : settingQuestMarkForce
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingQuestMarkForce(false, panel, actorProxyWrapper)
end

  FromClient_preemptiveStrikeTimeChanged = function(targetActorKeyRaw)
  -- function num : 0_87 , upvalues : hideTimeType
  ActorInsertShowTime(attackerActorKey, hideTimeType.preemptiveStrike, 0)
end

  EventActor_QuestUI_UpdateData = function(actorKeyRaw, currentType, iconPath)
  -- function num : 0_88 , upvalues : settingQuestUI, settingFirstTalk, settingImportantTalk, settingOtherHeadIcon, sortCenterX
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  local insertedArray = (Array.new)()
  settingQuestUI(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingFirstTalk(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingImportantTalk(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingOtherHeadIcon(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  sortCenterX(insertedArray)
end

  EventActor_EnduranceUpdate = function(actorKeyRaw)
  -- function num : 0_89 , upvalues : settingName, settingHpBar
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingName(actorKeyRaw, panel, actorProxyWrapper)
  settingHpBar(actorKeyRaw, panel, actorProxyWrapper)
end

  EventActor_HouseHoldNearestDoorChanged = function(actorKeyRaw)
  -- function num : 0_90 , upvalues : settingName
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingName(actorKeyRaw, panel, actorProxyWrapper)
end

  EventActor_OnChatMessageUpdate = function()
  -- function num : 0_91 , upvalues : settingBubbleBox
  local msg = nil
  local totalSize = getNewChatMessageCount()
  for index = 0, totalSize - 1 do
    msg = getNewChatMessage(index)
    if msg ~= nil and (CppEnums.ChatType).System ~= msg.chatType and (msg.isSameChannel or (CppEnums.ChatType).Client == msg.chatType) then
      local actorProxyWrapper = getActor(msg._actorKeyRaw)
      if actorProxyWrapper ~= nil then
        local panel = (actorProxyWrapper:get()):getBubbleBoxUIPanel()
        if panel ~= nil then
          settingBubbleBox(msg._actorKeyRaw, panel, actorProxyWrapper, msg:getContent())
        end
      end
    end
  end
end

  EventSelfPlayerWaitCommentLaunch = function()
  -- function num : 0_92 , upvalues : settingWaitCommentLaunch
  if ((getSelfPlayer()):get()):getWaitCommentPanel() == nil then
    return 
  end
  settingWaitCommentLaunch(true)
  ;
  ((getSelfPlayer()):get()):showWaitComment()
end

  EventSelfPlayerWaitCommentClose = function()
  -- function num : 0_93 , upvalues : settingWaitCommentLaunch
  if ((getSelfPlayer()):get()):getWaitCommentPanel() == nil then
    return 
  end
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
  ClearFocusEdit()
  settingWaitCommentLaunch(false)
  ;
  ((getSelfPlayer()):get()):hideWaitComment()
end

  EventOtherPlayerWaitCommentUpdate = function(actorKeyRaw)
  -- function num : 0_94 , upvalues : settingWaitComment
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingWaitComment(actorKeyRaw, panel, actorProxyWrapper, true)
end

  EventOtherPlayerWaitCommentClose = function(actorKeyRaw)
  -- function num : 0_95 , upvalues : settingWaitComment
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingWaitComment(actorKeyRaw, panel, actorProxyWrapper, false)
end

  FromClient_OverHeadUIShowChanged = function(actorKeyRaw, panel, actorProxyWrapper, isShow)
  -- function num : 0_96
end

  FromClient_GuildMemberGradeChanged = function(actorKeyRaw, panel, actorProxyWrapper, guildGrade)
  -- function num : 0_97 , upvalues : settingGuildInfo, settingGuildMarkAndPreemptiveStrike
  settingGuildInfo(actorKeyRaw, panel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
end

  EventPlayerNicknameUpdate = function(actorKeyRaw)
  -- function num : 0_98 , upvalues : settingTitle
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingTitle(actorKeyRaw, panel, actorProxyWrapper)
end

  FromClient_NameTag_SelfPlayerLevelUp = function()
  -- function num : 0_99 , upvalues : settingName
  local actorProxyWrapper = getSelfPlayer()
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingName(actorProxyWrapper:getActorKey(), panel, actorProxyWrapper)
end

  FromClient_ActorInformationChanged = function(actorKeyRaw, panel, actorProxyWrapper)
  -- function num : 0_100 , upvalues : settingName
  if panel == nil then
    return 
  end
  if actorProxyWrapper == nil then
    return 
  end
  settingName(actorKeyRaw, panel, actorProxyWrapper)
end

  FromClient_NotifyChangeGuildTendency = function(actorKeyRaw, panel, actorProxyWrapper)
  -- function num : 0_101 , upvalues : settingGuildInfo
  if panel == nil then
    return 
  end
  if actorProxyWrapper == nil then
    return 
  end
  settingGuildInfo(actorKeyRaw, panel, actorProxyWrapper)
end

  FromClient_ChangeArenaAreaAndZoneState = function(actorProxyWrapper, panel, isStateOn)
  -- function num : 0_102 , upvalues : settingHpBar
  if actorProxyWrapper == nil or isStateOn == nil or panel == nil then
    return 
  end
  local actorKeyRaw = (actorProxyWrapper:get()):getActorKeyRaw()
  settingHpBar(actorKeyRaw, panel, actorProxyWrapper)
end

  FromClient_InstallationInfoWarningNameTag = function(warningType, tentPosition, characterSSW, progressingInfo, actorWrapper, addtionalValue1)
  -- function num : 0_103 , upvalues : settingHpBar
  if actorWrapper == nil then
    return 
  end
  local actorKeyRaw = (actorWrapper:get()):getActorKeyRaw()
  local panel = (actorWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingHpBar(actorKeyRaw, panel, actorWrapper)
end

  FromClient_LocalWarCombatPoint = function(actorkeyRaw)
  -- function num : 0_104 , upvalues : settingLocalWarCombatPoint
  if actorkeyRaw == nil then
    return 
  end
  local playerActorWrapper = getPlayerActor(actorkeyRaw)
  if playerActorWrapper == nil then
    return 
  end
  local panel = (playerActorWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingLocalWarCombatPoint(actorkeyRaw, panel, playerActorWrapper)
end

  FromClient_EntryTeamChanged = function(actorkeyRaw)
  -- function num : 0_105 , upvalues : settingLocalWarCombatPoint
  if actorkeyRaw == nil then
    return 
  end
  local playerActorWrapper = getPlayerActor(actorkeyRaw)
  if playerActorWrapper == nil then
    return 
  end
  local panel = (playerActorWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  settingLocalWarCombatPoint(actorkeyRaw, panel, playerActorWrapper)
end

  FromClient_ObjectInstanceMpChanged = function(actorKeyRaw, panel)
  -- function num : 0_106 , upvalues : settingMpBar
  if actorKeyRaw == nil then
    return 
  end
  local actorWrapper = getActor(actorKeyRaw)
  if actorWrapper == nil then
    return 
  end
  if panel == nil then
    return 
  end
  settingMpBar(actorKeyRaw, panel, actorWrapper)
end

  FromClient_FlashBangStateChanged = function(actorKeyRaw, isFlashBangOn)
  -- function num : 0_107 , upvalues : settingName, settingAlias, settingGuildInfo, settingGuildMarkAndPreemptiveStrike, settingLifeRankIcon, settingPlayerName, settingLocalWarCombatPoint, settingTitle
  if actorKeyRaw == nil then
    return 
  end
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  local insertedArray = (Array.new)()
  settingName(actorKeyRaw, panel, actorProxyWrapper)
  settingAlias(actorKeyRaw, panel, actorProxyWrapper)
  settingGuildInfo(actorKeyRaw, panel, actorProxyWrapper)
  settingGuildMarkAndPreemptiveStrike(actorKeyRaw, panel, actorProxyWrapper)
  settingLifeRankIcon(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  if (actorProxyWrapper:get()):isPlayer() then
    settingPlayerName(actorKeyRaw, panel, actorProxyWrapper)
    settingLocalWarCombatPoint(actorKeyRaw, panel, actorProxyWrapper)
  end
  settingTitle(actorKeyRaw, panel, actorProxyWrapper)
end

  FromClient_ChangeMilitiaNameTag = function(actorKeyRaw)
  -- function num : 0_108 , upvalues : settingName, settingAlias, settingTitle, settingLifeRankIcon, settingGuildInfo
  if actorKeyRaw == nil then
    return 
  end
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local panel = (actorProxyWrapper:get()):getUIPanel()
  if panel == nil then
    return 
  end
  local insertedArray = (Array.new)()
  settingName(actorKeyRaw, panel, actorProxyWrapper)
  settingAlias(actorKeyRaw, panel, actorProxyWrapper)
  settingTitle(actorKeyRaw, panel, actorProxyWrapper)
  settingLifeRankIcon(actorKeyRaw, panel, actorProxyWrapper, insertedArray)
  settingGuildInfo(actorKeyRaw, panel, actorProxyWrapper)
end

  registerEvent("EventActorCreated", "EventActorCreated_NameTag")
  registerEvent("FromClient_TendencyChanged", "FromClient_NameTag_TendencyChanged")
  registerEvent("EventFirstTalk", "EventActorFirsttalk")
  registerEvent("EventImportantTalk", "EventActorImportantTalk")
  registerEvent("EventChangeGuildInfo", "EventActorChangeGuildInfo")
  registerEvent("EventMonsterLevelColorChanged", "EventActorChangeLevel")
  registerEvent("EventPlayerPvPAbleChanged", "EventActorChangeLevel")
  registerEvent("hpChanged", "EventActorHpChanged")
  registerEvent("EventChangeCharacterName", "EventChangeCharacterName")
  registerEvent("ResponseParty_insert", "insertPartyMemberGage")
  registerEvent("ResponseParty_RemovePatyNameTag", "removePartyMemberGage")
  registerEvent("addDamage", "EventActorAddDamage")
  registerEvent("EventShowProgressBar", "EventShowProgressBar")
  registerEvent("EventHideProgressBar", "EventHideProgressBar")
  registerEvent("stunChanged", "update_Changed_StunGage")
  registerEvent("EventQuestTargetActorInserted", "EventActor_QuestUpdateInserted")
  registerEvent("EventQuestTargetActorDeleted", "EventActor_QuestUpdateDeleted")
  registerEvent("FromClient_preemptiveStrikeTimeChanged", "FromClient_preemptiveStrikeTimeChanged")
  registerEvent("EventQuestUpdate", "EventActor_QuestUI_UpdateData")
  registerEvent("EventHousingUpdateInstallationEndurance", "EventActor_EnduranceUpdate")
  registerEvent("EventHouseHoldNearestDoorChanged", "EventActor_HouseHoldNearestDoorChanged")
  registerEvent("EventChattingMessageUpdate", "EventActor_OnChatMessageUpdate")
  registerEvent("EventSelfPlayerWaitCommentUpdate", "EventSelfPlayerWaitCommentLaunch")
  registerEvent("EventSelfPlayerWaitCommentClose", "EventSelfPlayerWaitCommentClose")
  registerEvent("EventOtherPlayerWaitCommentUpdate", "EventOtherPlayerWaitCommentUpdate")
  registerEvent("EventOtherPlayerWaitCommentClose", "EventOtherPlayerWaitCommentClose")
  registerEvent("FromClient_GuildMemberGradeChanged", "FromClient_GuildMemberGradeChanged")
  registerEvent("EventPlayerNicknameUpdate", "EventPlayerNicknameUpdate")
  registerEvent("EventSelfPlayerLevelUp", "FromClient_NameTag_SelfPlayerLevelUp")
  registerEvent("FromClient_ActorInformationChanged", "FromClient_ActorInformationChanged")
  registerEvent("FromClient_NotifyChangeGuildTendency", "FromClient_NotifyChangeGuildTendency")
  registerEvent("FromClient_ChangeOccupyTerritoryState", "FromClient_EventActorChangeGuildInfo_HaveLand")
  registerEvent("FromClient_ChangeArenaAreaRegion", "FromClient_ChangeArenaAreaAndZoneState")
  registerEvent("FromClient_ChangeArenaZoneRegion", "FromClient_ChangeArenaAreaAndZoneState")
  registerEvent("FromClient_InstallationInfoWarning", "FromClient_InstallationInfoWarningNameTag")
  registerEvent("FromClient_ChangeTopRankUser", "FromClient_ChangeTopRankUser")
  registerEvent("FromClient_EventActorUpdateTitleKey", "FromClient_EventActorUpdateTitleKey")
  registerEvent("FromClient_LocalWarCombatPoint", "FromClient_LocalWarCombatPoint")
  registerEvent("FromClient_EntryTeamChanged", "FromClient_EntryTeamChanged")
  registerEvent("FromClient_FlashBangStateChanged", "FromClient_FlashBangStateChanged")
  registerEvent("EventPvPModeChanged", "EventActorPvpModeChange")
  registerEvent("FromClient_ObjectInstanceMpChanged", "FromClient_ObjectInstanceMpChanged")
  registerEvent("FromClient_ChangeVolunteerNameTag", "FromClient_ChangeMilitiaNameTag")
end

