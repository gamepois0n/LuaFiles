local _panel = Panel_Widget_ServantIcon
local UI_VT = CppEnums.VehicleType
local UI_TM = CppEnums.TextMode
_panel:SetDragEnable(false)
_panel:setGlassBackground(true)
local ServantIcon = {
  _ui = {
    btn_IconTemplate = UI.getChildControl(_panel, "Button_ServantIcon_template"),
    stc_ProgressBg = UI.getChildControl(_panel, "Static_HorseProgressBg"),
    progress_Hp = UI.getChildControl(_panel, "CircularProgress_Hp"),
    progress_Stamina = UI.getChildControl(_panel, "CircularProgress_Stamina")
  },
  _iconType = {
    servant_Land = 0,
    servant_Water = 1,
    servant_Summon = 2,
    servant_Awake = 3,
    servant_Guild = 4,
    house = 5,
    worker = 6,
    harvest = 7,
    trade = 8,
    pet = 9,
    maid = 10,
    camp = 11,
    battle = 12,
    tag = 13,
    fairy = 14,
    count = 15
  },
  _iconTable = {},
  _startPosX = 0,
  _startPosY = 100,
  _gapX = 60,
  _hitEffect = nil,
  _less10Effect = nil,
  _servant_BeforHP = 0,
  _currentNaviType = nil,
  _isTaming = false,
  _tamingLastNotifyTime = 0,
  _tamingCurrentTime = 0,
  _hungryCheck = false,
  _workerListCount = nil
}
local _servantSimpleUIAlpha = 0.7
function ServantIcon:init()
  for iconIdx = 0, self._iconType.count - 1 do
    local icon = {}
    icon.btn = UI.createAndCopyBasePropertyControl(_panel, "Button_ServantIcon_template", _panel, "Button_Icon_" .. iconIdx)
    icon.btn:SetShow(false)
    if iconIdx <= self._iconType.servant_Awake then
      icon.progressBg = UI.createAndCopyBasePropertyControl(_panel, "Static_HorseProgressBg", _panel, "ProgressBg_" .. iconIdx)
      icon.progressHp = UI.createAndCopyBasePropertyControl(_panel, "CircularProgress_Hp", _panel, "ProgressHp_" .. iconIdx)
      icon.progressMp = UI.createAndCopyBasePropertyControl(_panel, "CircularProgress_Stamina", _panel, "ProgressStamina_" .. iconIdx)
      icon.progressBg:SetShow(false)
      icon.progressHp:SetShow(false)
      icon.progressMp:SetShow(false)
    end
    icon.btn:addInputEvent("Mouse_On", "PaGlobalFunc_ServantIcon_SimpleTooltip( true, " .. iconIdx .. " )")
    icon.btn:addInputEvent("Mouse_Out", "PaGlobalFunc_ServantIcon_SimpleTooltip( false )")
    icon.btn:addInputEvent("Mouse_LUp", "InputLUp_ServantIcon_LeftMouseFunction(" .. iconIdx .. ")")
    icon.btn:addInputEvent("Mouse_RUp", "InputRUp_ServantIcon_RightMouseFunction(" .. iconIdx .. ")")
    self._iconTable[iconIdx] = icon
  end
  self:registEventHandler()
  self:updateServantIcon()
  self:updateHouseIcon()
  for iconType = self._iconType.pet, self._iconType.count do
    self:updateOtherIcon(iconType)
  end
  self:updatePos()
  PaGlobalFunc_ServantIcon_OnResize()
end
function ServantIcon:registEventHandler()
  registerEvent("EventSelfServantUpdate", "PaGlobalFunc_ServantIcon_Update")
  registerEvent("EventSelfServantUpdateOnlyHp", "PaGlobalFunc_ServantIcon_UpdateHP")
  registerEvent("EventSelfServantUpdateOnlyMp", "PaGlobalFunc_ServantIcon_UpdateMP")
  registerEvent("FromClient_SummonChanged", "PaGlobalFunc_ServantIcon_Update")
  registerEvent("FromClient_SummonAddList", "PaGlobalFunc_ServantIcon_Update")
  registerEvent("FromClient_SummonDelList", "PaGlobalFunc_ServantIcon_Update")
  registerEvent("EventSelfServantClose", "PaGlobalFunc_ServantIcon_Update")
  registerEvent("FromClient_ServantTaming", "FromClient_ServantIcon_TamingSuccess")
  registerEvent("FromClient_ReceiveSetMyHouse", "FGlobal_MyHouseNavi_Update")
  registerEvent("FromClient_ReceiveReturnHouse", "FGlobal_MyHouseNavi_Update")
  registerEvent("FromClient_SetSelfTent", "FGlobal_MyHouseNavi_Update")
  registerEvent("FromClient_ResponseAuctionInfo", "FGlobal_MyHouseNavi_Update")
  registerEvent("WorldMap_WorkerDataUpdate", "FGlobal_MyHouseNavi_Update")
  registerEvent("FromClient_ChangeWorkerCount", "FromClient_ServantIcon_ChangeWorkerCount")
  registerEvent("FromClient_RefreshMaidList", "FGlobal_MaidIcon_SetPos")
  registerEvent("FromClient_Fairy_Update", "PaGlobalFunc_ServantIcon_FairyUpdate")
  registerEvent("EventSimpleUIEnable", "Servant_UpdateSimpleUI_Force_Out")
  registerEvent("EventSimpleUIDisable", "Servant_UpdateSimpleUI_Force_Over")
  registerEvent("onScreenResize", "PaGlobalFunc_ServantIcon_OnResize")
end
function ServantIcon:hideAllIcon()
  for _, icon in pairs(self._iconTable) do
    if nil ~= icon then
      icon.btn:SetShow(false)
      if nil ~= icon.progressBg then
        icon.progressBg:SetShow(false)
      end
      if nil ~= icon.progressHp then
        icon.progressHp:SetShow(false)
      end
      if nil ~= icon.progressMp then
        icon.progressMp:SetShow(false)
      end
    end
  end
end
function ServantIcon:hideServantIcon()
  for iconIdx = 0, self._iconType.servant_Guild do
    icon = self._iconTable[iconIdx]
    if nil ~= icon then
      icon.btn:SetShow(false)
      if nil ~= icon.progressBg then
        icon.progressBg:SetShow(false)
      end
      if nil ~= icon.progressHp then
        icon.progressHp:SetShow(false)
      end
      if nil ~= icon.progressMp then
        icon.progressMp:SetShow(false)
      end
    end
  end
end
function ServantIcon:hideHouseIcon()
  for iconIdx = self._iconType.house, self._iconType.count - 1 do
    icon = self._iconTable[iconIdx]
    if nil ~= icon then
      icon.btn:SetShow(false)
      if nil ~= icon.progressBg then
        icon.progressBg:SetShow(false)
      end
      if nil ~= icon.progressHp then
        icon.progressHp:SetShow(false)
      end
      if nil ~= icon.progressMp then
        icon.progressMp:SetShow(false)
      end
    end
  end
end
function ServantIcon:updateServantIcon()
  local temporaryWrapper = getTemporaryInformationWrapper()
  if nil == temporaryWrapper then
    return
  end
  if nil == self._iconTable[self._iconType.servant_Land] then
    return
  end
  self:hideServantIcon()
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Vehicle)
  if nil ~= landVehicleWrapper then
    local icon = self._iconTable[self._iconType.servant_Land]
    icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
    if CppEnums.VehicleType.Type_Horse == landVehicleWrapper:getVehicleType() then
      local x1, y1, x2, y2 = 0, 0, 0, 0
      local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
      local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
      local isRussiaPremiumPack = getSelfPlayer():get():isApplyChargeSkill(CppEnums.UserChargeType.eUserChargeType_RussiaPack3)
      if isPremiumPcRoom and (isGameTypeKorea() or isGameTypeJapan()) then
        if doHaveContentsItem(16, CppEnums.VehicleType.Type_Horse) then
          x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 1, 105, 52, 156)
          icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
        else
          x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 1, 1, 52, 52)
          icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
        end
      elseif isRussiaPremiumPack then
        if doHaveContentsItem(16, CppEnums.VehicleType.Type_Horse) then
          x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 1, 105, 52, 156)
          icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
        else
          x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 1, 1, 52, 52)
          icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
        end
      elseif doHaveContentsItem(16, CppEnums.VehicleType.Type_Horse) then
        x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 1, 105, 52, 156)
        icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      else
        x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 1, 1, 52, 52)
        icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      end
    elseif CppEnums.VehicleType.Type_Camel == landVehicleWrapper:getVehicleType() then
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 53, 105, 104, 156)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    elseif CppEnums.VehicleType.Type_Donkey == landVehicleWrapper:getVehicleType() then
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 157, 1, 208, 52)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    elseif CppEnums.VehicleType.Type_RidableBabyElephant == landVehicleWrapper:getVehicleType() then
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 261, 53, 312, 104)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    elseif CppEnums.VehicleType.Type_Carriage == landVehicleWrapper:getVehicleType() or CppEnums.VehicleType.Type_CowCarriage == landVehicleWrapper:getVehicleType() or CppEnums.VehicleType.Type_RepairableCarriage == landVehicleWrapper:getVehicleType() then
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 365, 1, 416, 52)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    else
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 0, 0, 1, 1)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    end
    icon.btn:setRenderTexture(icon.btn:getBaseTexture())
    icon.progressHp:SetProgressRate(landVehicleWrapper:getHp() / landVehicleWrapper:getMaxHp() * 50)
    icon.progressMp:SetProgressRate(landVehicleWrapper:getMp() / landVehicleWrapper:getMaxMp() * 50)
    icon.btn:SetShow(true)
    icon.progressBg:SetShow(true)
    icon.progressHp:SetShow(true)
    icon.progressMp:SetShow(true)
    icon.btn:ActiveMouseEventEffect(true)
    local servantInfo = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Vehicle)
    local regionInfo = getRegionInfoByPosition(servantInfo:getPosition())
    if false == regionInfo:get():isSafeZone() then
      self:servantHpChecker(landVehicleWrapper:getHp(), landVehicleWrapper:getMaxHp(), landVehicleWrapper:getVehicleType())
    end
    local selfProxy = getSelfPlayer():get()
    if nil == selfProxy then
      return
    end
    local actorKeyRaw = selfProxy:getRideVehicleActorKeyRaw()
    local unsealCacheData = getServantInfoFromActorKey(actorKeyRaw)
    if nil ~= unsealCacheData then
      HorseHP_OpenByInteraction()
      HorseMP_OpenByInteraction()
    end
  end
  local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Ship)
  if nil ~= seaVehicleWrapper and UI_VT.Type_SailingBoat ~= seaVehicleWrapper:getVehicleType() then
    local icon = self._iconTable[self._iconType.servant_Water]
    icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 53, 53, 104, 104)
    icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    icon.btn:setRenderTexture(icon.btn:getBaseTexture())
    icon.progressHp:SetProgressRate(seaVehicleWrapper:getHp() / seaVehicleWrapper:getMaxHp() * 50)
    icon.progressMp:SetProgressRate(seaVehicleWrapper:getMp() / seaVehicleWrapper:getMaxMp() * 50)
    icon.btn:SetShow(true)
    icon.progressBg:SetShow(true)
    icon.progressHp:SetShow(true)
    icon.progressMp:SetShow(true)
    icon.btn:ActiveMouseEventEffect(true)
    local selfProxy = getSelfPlayer():get()
    if nil == selfProxy then
      return
    end
    if selfProxy:doRideMyVehicle() then
      HorseHP_OpenByInteraction()
      HorseMP_OpenByInteraction()
    end
  end
  local summonCount = getSelfPlayer():getSummonListCount()
  for summon_idx = 0, summonCount - 1 do
    local summonInfo = getSelfPlayer():getSummonDataByIndex(summon_idx)
    local characterKey = summonInfo:getCharacterKey()
    if characterKey >= 60028 and characterKey <= 60037 or 60068 == characterKey then
      local summonWrapper = summonInfo:getActor()
      local hpRate = 0
      local mpRate = 0
      if nil == summonWrapper then
        hpRate = 50
        mpRate = 50
      else
        local hp = summonWrapper:get():getHp()
        local maxHp = summonWrapper:get():getMaxHp()
        local mp = summonWrapper:get():getMp()
        local maxMp = summonWrapper:get():getMaxMp()
        if maxHp == 0 then
          hpRate = 50
        else
          hpRate = hp / maxHp * 50
        end
        if maxMp == 0 then
          mpRate = 50
        else
          mpRate = mp / maxMp * 50
        end
      end
      local icon = self._iconTable[self._iconType.servant_Summon]
      icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 105, 1, 156, 52)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      icon.btn:setRenderTexture(icon.btn:getBaseTexture())
      icon.progressHp:SetProgressRate(hpRate)
      icon.progressMp:SetProgressRate(mpRate)
      icon.btn:SetShow(true)
      icon.progressBg:SetShow(true)
      icon.progressHp:SetShow(true)
      icon.progressMp:SetShow(true)
      icon.btn:ActiveMouseEventEffect(true)
      break
    elseif 60134 == characterKey or 60137 == characterKey or 60136 == characterKey or 60135 == characterKey then
      local summonWrapper = summonInfo:getActor()
      local hpRate = 0
      local mpRate = 0
      if nil == summonWrapper then
        hpRate = 50
        mpRate = 50
      else
        local hp = summonWrapper:get():getHp()
        local maxHp = summonWrapper:get():getMaxHp()
        local mp = summonWrapper:get():getMp()
        local maxMp = summonWrapper:get():getMaxMp()
        if maxHp == 0 then
          hpRate = 50
        else
          hpRate = hp / maxHp * 50
        end
        if maxMp == 0 then
          mpRate = 50
        else
          mpRate = mp / maxMp * 50
        end
      end
      local icon = self._iconTable[self._iconType.servant_Awake]
      icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 157, 53, 208, 104)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      icon.btn:setRenderTexture(icon.btn:getBaseTexture())
      icon.progressHp:SetProgressRate(hpRate)
      icon.progressMp:SetProgressRate(mpRate)
      icon.btn:SetShow(true)
      icon.progressBg:SetShow(true)
      icon.progressHp:SetShow(true)
      icon.progressMp:SetShow(true)
      icon.btn:ActiveMouseEventEffect(true)
      break
    end
  end
  local elephantCount = guildstable_getUnsealGuildServantCount()
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  for index = 0, elephantCount - 1 do
    local servantWrapper = guildStable_getUnsealGuildServantAt(index)
    local vehicleType = servantWrapper:getVehicleType()
    if UI_VT.Type_Elephant == vehicleType or UI_VT.Type_Train == vehicleType or UI_VT.Type_SailingBoat == vehicleType or UI_VT.Type_PersonalBattleShip == vehicleType or UI_VT.Type_CashPersonalBattleShip == vehicleType or UI_VT.Type_SiegeTower == vehicleType or UI_VT.Type_LargeSiegeTower == vehicleType then
      local icon = self._iconTable[self._iconType.servant_Guild]
      icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 105, 53, 156, 104)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      icon.btn:setRenderTexture(icon.btn:getBaseTexture())
      icon.btn:SetShow(true)
      break
    end
  end
end
function ServantIcon:updateOtherIcon(iconType)
  if true == PaGlobal_TutorialManager:isDoingTutorial() and 6 >= getSelfPlayer():get():getLevel() then
    return
  end
  local icon = self._iconTable[iconType]
  if nil == icon then
    return
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  if nil == temporaryWrapper then
    return
  end
  local isShow = false
  if iconType == self._iconType.pet then
    local unSealPetCount = ToClient_getPetUnsealedList()
    if 0 == unSealPetCount then
      FGlobal_PetHungryAlert(false)
    end
    local petCount = ToClient_getPetSealedList()
    local PcPetData = ToClient_getPetUnsealedDataByIndex(0)
    if 0 ~= petCount or nil ~= PcPetData then
      icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 53, 1, 104, 52)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      icon.btn:setRenderTexture(icon.btn:getBaseTexture())
      isShow = true
    end
  elseif iconType == self._iconType.maid then
    if 0 < getTotalMaidList() and getSelfPlayer():get():getLevel() >= 7 then
      icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 209, 1, 260, 52)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      icon.btn:setRenderTexture(icon.btn:getBaseTexture())
      local warehouseInMaid = checkMaid_WarehouseIn(true)
      local warehouseOutMaid = checkMaid_WarehouseOut(true)
      local marketMaid = checkMaid_SubmitMarket(true)
      icon.btn:EraseAllEffect()
      if warehouseInMaid or warehouseOutMaid or marketMaid then
        icon.btn:AddEffect("fUI_Maid_01A", false, 0, 0)
      else
        icon.btn:AddEffect("fUI_Maid_02A", false, 0, 0)
      end
      MaidList_SetScroll()
      isShow = true
    end
  elseif iconType == self._iconType.camp then
    if true == ToClient_isCampingReigsted() then
      icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 313, 1, 364, 52)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      icon.btn:setRenderTexture(icon.btn:getBaseTexture())
      isShow = true
    end
  elseif iconType == self._iconType.fairy then
    if true == _ContentsGroup_isFairy and 0 < ToClient_getFairyUnsealedList() + ToClient_getFairySealedList() then
      icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 313, 105, 364, 156)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      icon.btn:setRenderTexture(icon.btn:getBaseTexture())
      isShow = true
    end
  elseif iconType == self._iconType.battle then
    isPlaying = getSelfPlayer():isDefinedPvPMatch()
    if true == isPlaying then
      icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 209, 105, 260, 156)
      icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
      icon.btn:setRenderTexture(icon.btn:getBaseTexture())
      isShow = true
    end
  elseif iconType == self._iconType.tag and true == PaGlobalFunc_ServantIcon_CharacterTagCheckShow() then
    icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 313, 53, 364, 104)
    icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    icon.btn:setRenderTexture(icon.btn:getBaseTexture())
    if true == ToClient_IsContentsGroupOpen("330") then
      icon.btn:setButtonShortcutsWithEvent("Mouse_RUp", "PANEL_SIMPLESHORTCUT_CHARACTER_CHANGE")
    end
    isShow = true
  end
  icon.btn:SetShow(isShow)
  icon.btn:ActiveMouseEventEffect(isShow)
end
function ServantIcon:updateHouseIcon()
  if true == PaGlobal_TutorialManager:isDoingTutorial() then
    return
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  if nil == temporaryWrapper then
    return
  end
  if nil == self._iconTable[self._iconType.house] then
    return
  end
  self._iconTable[self._iconType.house].btn:SetShow(false)
  self._iconTable[self._iconType.harvest].btn:SetShow(false)
  self._iconTable[self._iconType.worker].btn:SetShow(false)
  self._iconTable[self._iconType.trade].btn:SetShow(false)
  local isHaveDwelling = ToClient_IsHaveDwelling()
  if isHaveDwelling == true then
    local icon = self._iconTable[self._iconType.house]
    icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 209, 53, 260, 104)
    icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    icon.btn:setRenderTexture(icon.btn:getBaseTexture())
    icon.btn:SetShow(true)
    icon.btn:ActiveMouseEventEffect(true)
  end
  local tentCheck = temporaryWrapper:isSelfTent()
  if true == tentCheck then
    local icon = self._iconTable[self._iconType.harvest]
    icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 105, 105, 156, 156)
    icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    icon.btn:setRenderTexture(icon.btn:getBaseTexture())
    icon.btn:SetShow(true)
    icon.btn:ActiveMouseEventEffect(true)
  end
  local isNpcWorkerCount = 0
  if nil ~= self._workerListCount then
    isNpcWorkerCount = self._workerListCount
    self._workerListCount = nil
  else
    isNpcWorkerCount = ToClient_getMyNpcWorkerCount()
  end
  if isNpcWorkerCount > 0 then
    local icon = self._iconTable[self._iconType.worker]
    icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 157, 105, 208, 156)
    icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    icon.btn:setRenderTexture(icon.btn:getBaseTexture())
    icon.btn:SetShow(true)
    icon.btn:ActiveMouseEventEffect(true)
  end
  if isHaveTerritoryTradeAuthority(0) or isHaveTerritoryTradeAuthority(1) or isHaveTerritoryTradeAuthority(2) or isHaveTerritoryTradeAuthority(3) then
    local icon = self._iconTable[self._iconType.trade]
    icon.btn:ChangeTextureInfoName("Renewal/Button/Console_Btn_Main.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(icon.btn, 261, 1, 312, 52)
    icon.btn:getBaseTexture():setUV(x1, y1, x2, y2)
    icon.btn:setRenderTexture(icon.btn:getBaseTexture())
    icon.btn:SetShow(true)
    icon.btn:ActiveMouseEventEffect(true)
  end
end
function ServantIcon:updatePos()
  local currentXgap = self._startPosX
  for iconIdx = 0, self._iconType.count - 1 do
    if nil ~= self._iconTable[iconIdx] and true == self._iconTable[iconIdx].btn:GetShow() then
      self._iconTable[iconIdx].btn:SetPosX(currentXgap)
      if nil ~= self._iconTable[iconIdx].progressBg then
        self._iconTable[iconIdx].progressBg:SetPosX(currentXgap)
      end
      if nil ~= self._iconTable[iconIdx].progressHp then
        self._iconTable[iconIdx].progressHp:SetPosX(currentXgap)
      end
      if nil ~= self._iconTable[iconIdx].progressMp then
        self._iconTable[iconIdx].progressMp:SetPosX(currentXgap)
      end
      currentXgap = currentXgap + self._gapX
    end
  end
end
function ServantIcon:updateServantHP()
  local temporaryWrapper = getTemporaryInformationWrapper()
  if nil == temporaryWrapper then
    return
  end
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Vehicle)
  if nil ~= landVehicleWrapper and true == self._iconTable[self._iconType.servant_Land].btn:GetShow() then
    self._iconTable[self._iconType.servant_Land].progressHp:SetProgressRate(landVehicleWrapper:getHp() / landVehicleWrapper:getMaxHp() * 50)
    local servantInfo = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Vehicle)
    local regionInfo = getRegionInfoByPosition(servantInfo:getPosition())
    if false == regionInfo:get():isSafeZone() then
      self:servantHpChecker(landVehicleWrapper:getHp(), landVehicleWrapper:getMaxHp(), landVehicleWrapper:getVehicleType())
    end
  end
  local seaVehileWrapper = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Ship)
  if nil ~= seaVehicleWrapper then
    self._iconTable[self._iconType.servant_Water].progressHp:SetProgressRate(seaVehicleWrapper:getHp() / seaVehicleWrapper:getMaxHp() * 50)
  end
  local summonCount = getSelfPlayer():getSummonListCount()
  for summon_idx = 0, summonCount - 1 do
    local summonInfo = getSelfPlayer():getSummonDataByIndex(summon_idx)
    local characterKey = summonInfo:getCharacterKey()
    local slotNo = -1
    if characterKey >= 60028 and characterKey <= 60037 or characterKey == 60068 then
      slotNo = self._iconType.servant_Summon
    elseif 60134 == characterKey or 60137 == characterKey or 60136 == characterKey or 60135 == characterKey then
      slotNo = self._iconType.servant_Awake
    end
    if -1 ~= slotNo then
      local summonWrapper = summonInfo:getActor()
      if nil ~= summonWrapper then
        local hpRate = 50
        local hp = summonWrapper:get():getHp()
        local maxHp = summonWrapper:get():getMaxHp()
        if maxHp == 0 then
          hpRate = 50
        else
          hpRate = hp / maxHp * 50
        end
        self._iconTable[slotNo].progressHp:SetProgressRate(hpRate)
      end
    end
  end
end
function ServantIcon:updateServantMP()
  local temporaryWrapper = getTemporaryInformationWrapper()
  if nil == temporaryWrapper then
    return
  end
  local landVehicleWrapper = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Vehicle)
  if nil ~= landVehicleWrapper and true == self._iconTable[self._iconType.servant_Land].btn:GetShow() then
    self._iconTable[self._iconType.servant_Land].progressMp:SetProgressRate(landVehicleWrapper:getMp() / landVehicleWrapper:getMaxMp() * 50)
  end
  local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Ship)
  if nil ~= seaVehicleWrapper then
    self._iconTable[self._iconType.servant_Water].progressMp:SetProgressRate(seaVehicleWrapper:getMp() / seaVehicleWrapper:getMaxMp() * 50)
  end
  local summonCount = getSelfPlayer():getSummonListCount()
  for summon_idx = 0, summonCount - 1 do
    local summonInfo = getSelfPlayer():getSummonDataByIndex(summon_idx)
    local characterKey = summonInfo:getCharacterKey()
    local slotNo = -1
    if characterKey >= 60028 and characterKey <= 60037 or characterKey == 60068 then
      slotNo = self._iconType.servant_Summon
    elseif 60134 == characterKey or 60137 == characterKey or 60136 == characterKey or 60135 == characterKey then
      slotNo = self._iconType.servant_Awake
    end
    if -1 ~= slotNo then
      local summonWrapper = summonInfo:getActor()
      if nil ~= summonWrapper then
        local mpRate = 50
        local mp = summonWrapper:get():getMp()
        local maxMp = summonWrapper:get():getMaxMp()
        if maxMp == 0 then
          mpRate = 50
        else
          mpRate = mp / maxMp * 50
        end
        self._iconTable[slotNo].progressMp:SetProgressRate(mpRate)
      end
    end
  end
end
function ServantIcon:servantHpChecker(currentHp, currentMaxHp, vehicleType)
  local isNowEquipCheck = IsNowEquipCheck()
  local currentHp = currentHp
  local remainHp = currentHp / currentMaxHp * 100
  local servantIcon = self._iconTable[self._iconType.servant_Land]
  if currentHp < self._servant_BeforHP and nil ~= self._servant_BeforHP and isNowEquipCheck == false then
    if nil ~= self._hitEffect then
      servantIcon.btn:EraseEffect(self._hitEffect)
    end
    self._hitEffect = servantIcon.btn:AddEffect("fUI_Alarm_HorseAttack04", false, -0.1, -0.15)
    local sendMsg = {
      main = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_SERVANT_ATTACK"),
      sub = "",
      addMsg = ""
    }
    Proc_ShowMessage_Ack_For_RewardSelect(sendMsg, 2, 25)
  end
  self._servant_BeforHP = currentHp
  if nil ~= self._less10Effect then
    servantIcon.btn:EraseEffect(self._less10Effect)
  end
  local effectName
  if remainHp <= 10 then
    if 0 == vehicleType then
      effectName = "fUI_Alarm_HorseAttack05"
    elseif 2 == vehicleType then
      effectName = "fUI_Alarm_CamelAttack01"
    elseif 3 == vehicleType then
      effectName = "fUI_Alarm_DonkeyAttack01"
    elseif 4 == vehicleType then
      effectName = "fUI_Alarm_ElephantAttack01"
    elseif 9 == vehicleType then
      effectName = "fUI_Alarm_HorseAttack05"
    else
      effectName = "fUI_Alarm_HorseAttack05"
    end
    if nil ~= effectName then
      self._less10Effect = servantIcon.btn:AddEffect(effectName, false, -0.1, -0.15)
    end
  end
end
function PaGlobalFunc_ServantIcon_Init()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:init()
end
function PaGlobalFunc_ServantIcon_Update()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:updateServantIcon()
  self:updatePos()
end
function FGlobal_Window_Servant_Update()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:updateServantIcon()
  self:updatePos()
end
function Panel_Window_Servant_Update()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:updateServantIcon()
  self:updatePos()
end
function PaGlobalFunc_ServantIcon_UpdatePos()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:updatePos()
end
function PaGlobalFunc_ServantIcon_UpdateHP()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:updateServantHP()
end
function PaGlobalFunc_ServantIcon_UpdateMP()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:updateServantMP()
end
function Panel_MyHouseNavi_Update(init, listCount)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  if nil == init then
    return
  end
  self._workerListCount = listCount
  self:updateHouseIcon()
  self:updatePos()
end
function FGlobal_MyHouseNavi_Update()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:updateHouseIcon()
  self:updatePos()
end
function PaGlobal_Fairy_SetPosIcon()
  PaGlobalFunc_ServantIcon_FairyUpdate()
end
function PaGlobalFunc_ServantIcon_FairyUpdate()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:updateOtherIcon(self._iconType.fairy)
  self:updatePos()
end
function reset_ServantHP(BeforHP)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self._servant_BeforHP = BeforHP
end
function FGlobal_PetHungryAlert(petHungryCheck)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  local icon = self._iconTable[self._iconType.pet]
  if nil == icon then
    return
  end
  icon.btn:EraseAllEffect()
  if petHungryCheck and 0 < ToClient_getPetUnsealedList() then
    icon.btn:AddEffect("fUI_Pet_01A", true, 0, -1)
  end
  self._hungryCheck = petHungryCheck
end
function PaGlobalFunc_ServantIcon_UpdateOtherIcon(iconType)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self:updateOtherIcon(iconType)
  self:updatePos()
end
function FGlobal_MaidIcon_SetPos(resetScroll)
  PaGlobalFunc_ServantIcon_UpdateMaidIcon(resetScroll)
end
function PaGlobalFunc_ServantIcon_UpdateMaidIcon(resetScroll)
  PaGlobalFunc_ServantIcon_UpdateOtherIcon(10)
  MaidList_SetScroll()
  if true == resetScroll and Panel_Window_MaidList:GetShow() then
    PaGlobalFunc_IconMaid_ResetScroll()
  end
end
function Servant_Call(idx)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  if 0 == idx then
    InputLUp_ServantIcon_LeftMouseFunction(self._iconType.servant_Land)
  else
    _PA_LOG("\236\162\133\237\152\132", "\236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\157\128 idx \236\158\133\235\139\136\235\139\164! : Servant_Call(" .. idx .. ")")
  end
end
function Servant_Navi(idx)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  if 0 == idx then
    InputRUp_ServantIcon_RightMouseFunction(self._iconType.servant_Land)
  elseif 1 == idx then
    InputRUp_ServantIcon_RightMouseFunction(self._iconType.servant_Water)
  end
end
function FGlobal_PetListNew_NoPet()
  PaGlobalFunc_ServantIcon_UpdateOtherIcon(9)
end
function Panel_Window_Servant_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_ServantIcon_CharacterTagCheckShow()
  if false == ToClient_IsContentsGroupOpen("330") then
    return false
  end
  local size = getCharacterDataCount()
  local isAlreadyTaging = 0
  local hasAwakenCharacter = false
  local returnBool = false
  local player = getSelfPlayer()
  if nil == player then
    return
  end
  local curLevel = player:get():getLevel()
  for ii = 0, size - 1 do
    local characterData = getCharacterDataByIndex(ii)
    if nil ~= characterData then
      local duelChar_No_s32 = Int64toInt32(characterData._duelCharacterNo)
      local char_Level = characterData._level
      if char_Level > 55 then
        hasAwakenCharacter = true
      end
      if char_Level > 1 and -1 ~= duelChar_No_s32 then
        isAlreadyTaging = isAlreadyTaging + 1
      end
    end
  end
  if isAlreadyTaging > 1 or hasAwakenCharacter == true or curLevel > 55 then
    returnBool = true
  end
  return returnBool
end
function PaGlobalFunc_ServantIcon_SimpleTooltip(isShow, tipType)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  if tipType == nil then
    return TooltipSimple_Hide()
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  if temporaryWrapper == nil then
    return TooltipSimple_Hide()
  end
  local uiControl = self._iconTable[tipType].btn
  local name = ""
  local desc = ""
  if tipType == self._iconType.servant_Land or tipType == self._iconType.servant_Water then
    local vehicleWrapper = temporaryWrapper:getUnsealVehicle(tipType)
    if vehicleWrapper == nil then
      return TooltipSimple_Hide()
    end
    local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
    local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
    local targetType = vehicleWrapper:getVehicleType()
    if UI_VT.Type_Horse == targetType or UI_VT.Type_Camel == targetType or UI_VT.Type_Donkey == targetType or UI_VT.Type_Elephant == targetType or UI_VT.Type_Carriage == targetType or UI_VT.Type_CowCarriage == targetType or UI_VT.Type_RidableBabyElephant == targetType or UI_VT.Type_RepairableCarriage == targetType then
      if isPremiumPcRoom and UI_VT.Type_Horse == targetType then
        if doHaveContentsItem(16, UI_VT.Type_Horse) then
          ServantDesc = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SERVANT_ICONHELP")
        else
          ServantDesc = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SERVANT_ICONHELP_FORPCROOM")
        end
      else
        ServantDesc = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SERVANT_ICONHELP")
      end
    else
      ServantDesc = PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_SHIP_ICONHELP")
    end
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_SERVANT")
    desc = ServantDesc
  elseif tipType == self._iconType.house then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_SELFHOUSE_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_SELFHOUSE_DESC")
  elseif tipType == self._iconType.harvest then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TENT_NAME")
    if isharvestManagement then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TENT_DESC")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TENT_DESC_2")
    end
  elseif tipType == self._iconType.worker then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_WORKER_TOOLTIP_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_WORKER_TOOLTIP_DESC")
  elseif tipType == self._iconType.trade then
    local territoryName = {
      [0] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_0")),
      [1] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_1")),
      [2] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_2")),
      [3] = tostring(PAGetString(Defines.StringSheet_GAME, "LUA_TERRITORYAUTHORITY_KEY_3"))
    }
    name = PAGetString(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TERRITORYAUTH_NAME")
    desc = ""
    for territoryIndex = 0, 3 do
      if true == isHaveTerritoryTradeAuthority(territoryIndex) then
        if "" == desc then
          desc = territoryName[territoryIndex]
        else
          desc = desc .. " / " .. territoryName[territoryIndex]
        end
      end
    end
    if "" ~= desc then
      desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MYHOUSENAVI_TOOLTIP_TERRITORYAUTH_DESC", "desc", desc)
    end
  elseif tipType == self._iconType.pet then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_PETLIST_NAME")
    if 0 == ToClient_getPetUnsealedList() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_WAITPET_DESC")
    else
      if Panel_Window_PetControl:GetShow() then
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_ICONHIDE_DESC")
      else
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_ICONSHOW_DESC")
      end
      if true == self._hungryCheck then
        desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETCONTROL_BUTTONTOOLTIP_PETHUNGRY_DESC", "desc", desc)
      end
    end
  elseif tipType == self._iconType.maid then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_NAME")
    desc = ""
    local warehouseInMaid = checkMaid_WarehouseIn(true)
    local warehouseOutMaid = checkMaid_WarehouseOut(true)
    local marketMaid = checkMaid_SubmitMarket(true)
    if warehouseInMaid or warehouseOutMaid then
      desc = "<" .. PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_WAREHOUSE") .. ">"
    end
    if marketMaid then
      if "" == desc then
        desc = "<" .. PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_MARKET") .. ">"
      else
        desc = desc .. ", <" .. PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_MARKET") .. ">"
      end
    end
    local maidCount = getTotalMaidList()
    local cooltimeText = ""
    local maidAffiliatedTownName = ""
    local areaName = {}
    local sameAreaCoolTime = {}
    local oneMinute = 60
    local mIndex = 0
    local usableMaidCount = 0
    if "" == desc then
      desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_2", "maidCount", maidCount)
    else
      desc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_3", "desc", desc, "maidCount", maidCount)
    end
    if "" ~= maidAffiliatedTownName then
      desc = desc .. "\n" .. maidAffiliatedTownName
    end
    if not warehouseInMaid and not warehouseOutMaid and "" ~= cooltimeText then
      desc = desc .. "\n" .. cooltimeText
    end
    local hotkeyDesc = PAGetString(Defines.StringSheet_GAME, "LUA_MAIDLIST_TOOLTIP_DESC_4")
    desc = desc .. "\n" .. hotkeyDesc
  elseif tipType == self._iconType.battle then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_ICON_DUEL_SHOWTOOLTIP_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_ICON_DUEL_SHOWTOOLTIP_DESC")
  elseif tipType == self._iconType.camp then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_TOOLTIP_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_TOOLTIP_DESC")
  elseif tipType == self._iconType.fairy then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYICON_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_FAIRYICON_DESC")
  elseif tipType == self._iconType.tag then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_TAG")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_TAGCHAR_ICON_TOOLTIP_DESC")
  else
    TooltipSimple_Hide()
    return
  end
  if true == isShow then
    TooltipSimple_Show(uiControl, name, desc)
    if getEnableSimpleUI() then
      PaGlobalFunc_ServantIcon_UpdateSimpleUI(true)
    end
  else
    TooltipSimple_Hide()
    if getEnableSimpleUI() then
      PaGlobalFunc_ServantIcon_UpdateSimpleUI(false)
    end
  end
end
function PaGlobalFunc_ServantIcon_UpdateSimpleUI(isOver)
  _servantSimpleUIAlpha = 0.7
  if isOver then
    _servantSimpleUIAlpha = 1
  end
end
function Servant_UpdateSimpleUI_Force_Out()
  PaGlobalFunc_ServantIcon_UpdateSimpleUI(false)
end
function Servant_UpdateSimpleUI_Force_Over()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  PaGlobalFunc_ServantIcon_UpdateSimpleUI(true)
  for _, icon in pairs(self._iconTable) do
    if nil ~= icon and true == icon.btn:GetShow() then
      icon.btn:SetAlpha(1)
      if nil ~= icon.progressBg then
        icon.progressBg:SetAlpha(1)
      end
      if nil ~= icon.progressHp then
        icon.progressHp:SetAlpha(1)
      end
      if nil ~= icon.progressMp then
        icon.progressMp:SetAlpha(1)
      end
    end
  end
end
function FGlobal_ServantIcon_IsNearMonster_Effect(_addEffect)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  if self._iconTable[self._iconType.servant_Land].btn:GetShow() then
    if true == _addEffect then
      self._iconTable[self._iconType.servant_Land].btn:EraseAllEffect()
      self._iconTable[self._iconType.servant_Land].btn:AddEffect("fUI_Alarm_HorseAttack04", false, 0, 0)
    else
      self._iconTable[self._iconType.servant_Land].btn:EraseAllEffect()
    end
  end
end
function PaGlobalFunc_ServantIcon_SimpleUIUpdatePerFrame(deltaTime)
end
function InputLUp_ServantIcon_LeftMouseFunction(index)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  if Panel_UIControl:GetShow() then
    return
  end
  if index == self._iconType.servant_Land then
    local temporaryWrapper = getTemporaryInformationWrapper()
    local servantInfo = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Vehicle)
    if nil == servantInfo then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_STABLELIST_NOT_UNSEAL_SERVANT"))
      return
    end
    servant_callServant()
  elseif index == self._iconType.servant_Water then
    ToClient_AutoRideOnShip()
  elseif index == self._iconType.servant_Guild then
    FGlobal_GuildServantList_Open()
  elseif index == self._iconType.house then
    FGlobal_HousingList_Open()
  elseif index == self._iconType.worker then
    FGlobal_WorkerManger_ShowToggle()
  elseif index == self._iconType.harvest then
    if Panel_HarvestList:GetShow() then
      HarvestList_Close()
      return
    end
    FGlobal_HarvestList_Open()
  elseif index == self._iconType.pet then
    FGlobal_PetListNew_Toggle()
  elseif index == self._iconType.maid then
    MaidList_Open()
  elseif index == self._iconType.camp then
    PaGlobal_Camp:open()
  elseif index == self._iconType.fairy then
    PaGlobal_FairyInfo_Open(false)
  elseif index == self._iconType.tag then
    PaGlobal_CharacterTag_Open()
  end
end
function InputRUp_ServantIcon_RightMouseFunction(index)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  if Panel_UIControl:GetShow() then
    return
  end
  local temporaryWrapper = getTemporaryInformationWrapper()
  if nil == temporaryWrapper then
    return
  end
  if self._iconType.servant_Water == index then
    ToClient_DeleteNaviGuideByGroup(0)
    if index == self._currentNaviType then
      self._currentNaviType = nil
      return
    end
    local seaVehicleWrapper = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Ship)
    if nil == seaVehicleWrapper then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_STABLELIST_NOT_UNSEAL_SERVANT"))
      return
    end
    local position = float3(seaVehicleWrapper:getPositionX(), seaVehicleWrapper:getPositionY(), seaVehicleWrapper:getPositionZ())
    worldmapNavigatorStart(position, NavigationGuideParam(), false, true, true)
    audioPostEvent_SystemUi(0, 14)
    temporaryWrapper:refreshUnsealVehicle(seaVehicleWrapper, true)
    self._currentNaviType = index
  elseif self._iconType.servant_Land == index then
    ToClient_DeleteNaviGuideByGroup(0)
    if index == self._currentNaviType then
      self._currentNaviType = nil
      return
    end
    local servantInfo = temporaryWrapper:getUnsealVehicle(CppEnums.ServantType.Type_Vehicle)
    if nil == servantInfo then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_STABLELIST_NOT_UNSEAL_SERVANT"))
      return
    end
    local position = float3(servantInfo:getPositionX(), servantInfo:getPositionY(), servantInfo:getPositionZ())
    worldmapNavigatorStart(position, NavigationGuideParam(), false, true, true)
    audioPostEvent_SystemUi(0, 14)
    temporaryWrapper:refreshUnsealVehicle(servantInfo, true)
    self._currentNaviType = index
  elseif self._iconType.harvest == index then
    ToClient_DeleteNaviGuideByGroup(0)
    if index == self._currentNaviType then
      self._currentNaviType = nil
      return
    end
    local navigationGuideParam = NavigationGuideParam()
    navigationGuideParam._isAutoErase = true
    local myTentCount = temporaryWrapper:getSelfTentCount()
    for textIdx = 0, myTentCount - 1 do
      local tentWrapper = temporaryWrapper:getSelfTentWrapperByIndex(textIdx)
      local tentPosX = tentWrapper:getSelfTentPositionX()
      local tentPosY = tentWrapper:getSelfTentPositionY()
      local tentPosZ = tentWrapper:getSelfTentPositionZ()
      local tentPos = float3(tentPosX, tentPosY, tentPosZ)
      worldmapNavigatorStart(tentPos, navigationGuideParam, false, false, true)
    end
    audioPostEvent_SystemUi(0, 14)
    self._currentNaviType = index
  elseif self._iconType.pet == index then
    Panel_Window_PetControl_ShowToggle()
  elseif self._iconType.battle == index then
    PaGlobal_PvPBattle:cancelMatch()
  elseif self._iconType.camp == index then
    PaGlobal_Camp:navi()
  elseif self._iconType.tag == index then
    PaGlobal_TagCharacter_Change()
  end
end
function FromClient_ServantIcon_TamingSuccess(isTaming)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self._isTaming = isTaming
  if true == isTaming then
    ServantIcon_TamingNotify()
    Panel_FrameLoop_Widget:SetShow(true)
  else
    ServantIcon_TamingServant_Registed()
  end
end
function FromClient_ServantIcon_ChangeWorkerCount(isInitialize, listCount)
  Panel_MyHouseNavi_Update(isInitialize, listCount)
end
function ServantIcon_TamingNotify()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TAMING_NOTIFY"))
end
function ServantIcon_TamingServant_Registed()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  self._isTaming = false
  Panel_FrameLoop_Widget:SetShow(false)
end
function PaGlobalFunc_ServantIcon_OnResize()
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  if _panel:GetRelativePosX() == -1 and _panel:GetRelativePosY() == -1 then
    local initPosX = 10
    local initPosY = PaGlobalFunc_MainStatus_GetPosY() + PaGlobalFunc_MainStatus_GetSizeY() - 50
    if false == changePositionBySever(_panel, CppEnums.PAGameUIType.PAGameUIPanel_ServantIcon, true, true, false) then
      _panel:SetPosX(initPosX)
      _panel:SetPosY(initPosY)
    end
    FGlobal_InitPanelRelativePos(_panel, initPosX, initPosY)
  elseif _panel:GetRelativePosX() == 0 and _panel:GetRelativePosY() == 0 then
    _panel:SetPosX(10)
    _panel:SetPosY(PaGlobalFunc_MainStatus_GetPosY() + PaGlobalFunc_MainStatus_GetSizeY() - 50)
  else
    _panel:SetPosX(getScreenSizeX() * _panel:GetRelativePosX() - _panel:GetSizeX() / 2)
    _panel:SetPosY(getScreenSizeY() * _panel:GetRelativePosY() - _panel:GetSizeY() / 2)
  end
  if 0 < ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_ServantIcon, 0, CppEnums.PanelSaveType.PanelSaveType_IsSaved) then
    _panel:SetShow(ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_ServantIcon, 0, CppEnums.PanelSaveType.PanelSaveType_IsShow))
  end
  _panel:SetShow(_ContentsGroup_RemasterUI_Main)
  FGlobal_PanelRepostionbyScreenOut(_panel)
  self:updatePos()
end
function PaGlobalFunc_ServantIcon_TamingServantTime(DeltaTime)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  if not self._tamingSuccess then
    return
  end
  self._tamingCurrentTime = self._tamingCurrentTime + DeltaTime
  if self._tamingCurrentTime < self._tamingLastNotifyTime + 20 then
    ServantIcon_TamingNotify()
    self._tamingLastNotifyTime = currentTime
  end
end
function PaGlobalFunc_ServantIcon_GetIconPosX(iconType)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  return _panel:GetPosX() + self._iconTable[iconType].btn:GetPosX()
end
function PaGlobalFunc_ServantIcon_GetIconPosY(iconType)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  return _panel:GetPosY() + self._iconTable[iconType].btn:GetPosY()
end
function PaGlobalFunc_ServantIcon_GetIconSizeX(iconType)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  return self._iconTable[iconType].btn:GetSizeX()
end
function PaGlobalFunc_ServantIcon_GetIconSizeY(iconType)
  local self = ServantIcon
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : ServantIcon")
    return
  end
  return self._iconTable[iconType].btn:GetSizeY()
end
Panel_FrameLoop_Widget:RegisterUpdateFunc("PaGlobalFunc_ServantIcon_TamingServantTime")
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_ServantIcon_Init")
function FGlobal_Window_Servant_ColorBlindUpdate()
end
function FGlobal_RaceInfo_Hide()
end
function HouseNaviBasicInitPosition()
end
