local _panel = Panel_PersonalIcon_Left
local UI_BUFFTYPE = CppEnums.UserChargeType
local PersonalIcon = {
  _ui = {
    txt_BubbleAlert = UI.getChildControl(_panel, "StaticText_BubbleAlert"),
    txt_NoticePremium = UI.getChildControl(_panel, "StaticText_NoticePremium")
  },
  _iconType = {
    PCRoom = 0,
    RussiaMonthly = 1,
    Kamasylvia = 2,
    ValuePack = 3,
    GoldValuePack = 4,
    GuildWar = 5,
    Pearl = 6,
    EXP = 7,
    Drop = 8,
    Exchange = 9,
    Merv = 10,
    GoldenBell = 11,
    SkillChange = 12,
    AwakenChange = 13,
    BlackSpiritSkill = 14,
    MemoryofArtisan = 15,
    KamasylviaForRussia = 16,
    PremiumPackForRussia = 17,
    ArshaServerBuff = 18,
    BlackSpiritEXP = 19,
    count = 20
  },
  _isInit = false,
  _premiumPackageToolTipOnce = true,
  _iconControl = {},
  _iconStartPosX = 0,
  _iconGapPosX = 40,
  _saveWayPoint = nil,
  _localNodeName = nil,
  _localNodeInvestment = false,
  _currentNodeLv = 0,
  _defaultEventExp = 1000000
}
function PersonalIcon:InitControl()
  self._iconControl[self._iconType.PCRoom] = UI.getChildControl(_panel, "Static_PCRoom")
  self._iconControl[self._iconType.RussiaMonthly] = UI.getChildControl(_panel, "Static_RussiaMonthlyFee")
  self._iconControl[self._iconType.Kamasylvia] = UI.getChildControl(_panel, "Static_Kamasylvia")
  self._iconControl[self._iconType.ValuePack] = UI.getChildControl(_panel, "Static_ValuePack")
  self._iconControl[self._iconType.GoldValuePack] = UI.getChildControl(_panel, "Static_GoldValuePack")
  self._iconControl[self._iconType.GuildWar] = UI.getChildControl(_panel, "Static_GuildlWar")
  self._iconControl[self._iconType.Pearl] = UI.getChildControl(_panel, "Static_Pearl")
  self._iconControl[self._iconType.EXP] = UI.getChildControl(_panel, "Static_EXP")
  self._iconControl[self._iconType.Drop] = UI.getChildControl(_panel, "Static_Drop")
  self._iconControl[self._iconType.Exchange] = UI.getChildControl(_panel, "Static_Exchange")
  self._iconControl[self._iconType.Merv] = UI.getChildControl(_panel, "Static_Merv")
  self._iconControl[self._iconType.GoldenBell] = UI.getChildControl(_panel, "Static_GoldenBell")
  self._iconControl[self._iconType.SkillChange] = UI.getChildControl(_panel, "Static_SkillChange")
  self._iconControl[self._iconType.AwakenChange] = UI.getChildControl(_panel, "Static_SkillAwakenChange")
  self._iconControl[self._iconType.BlackSpiritSkill] = UI.getChildControl(_panel, "Static_BlackSpirit_Skill")
  self._iconControl[self._iconType.MemoryofArtisan] = UI.getChildControl(_panel, "Static_MemoryofArtisan")
  self._iconControl[self._iconType.KamasylviaForRussia] = UI.getChildControl(_panel, "Static_KamasylviaforRussia")
  self._iconControl[self._iconType.PremiumPackForRussia] = UI.getChildControl(_panel, "Static_PremiumPackforRussia")
  self._iconControl[self._iconType.ArshaServerBuff] = UI.getChildControl(_panel, "Static_ArshaBuff")
  self._iconControl[self._iconType.BlackSpiritEXP] = UI.getChildControl(_panel, "Static_BlackSpirit_EXP")
  self._ui.btn_AlertClose = UI.getChildControl(self._ui.txt_BubbleAlert, "Button_Close")
end
PersonalIcon:InitControl()
function PersonalIcon:init()
  self:registEventHandler()
  self:update()
  _panel:SetShow(true)
end
function PersonalIcon:registEventHandler()
  for idx = 0, self._iconType.count - 1 do
    self._iconControl[idx]:addInputEvent("Mouse_On", "InputMO_PersonalIcon_ShowTooltip(true, " .. idx .. ")")
    self._iconControl[idx]:addInputEvent("Mouse_Out", "InputMO_PersonalIcon_ShowTooltip(false, " .. idx .. ")")
  end
  self._ui.btn_AlertClose:addInputEvent("Mouse_LUp", "InputMLUp_PersonalIcon_CloseAlert()")
  registerEvent("FromClient_UpdateCharge", "FromClient_PackageIconUpdate")
  registerEvent("FromClient_LoadCompleteMsg", "FromClient_PackageIconUpdate")
  registerEvent("FromClient_ResponseGoldenbellItemInfo", "FromClient_PersonalIcon_ResponseGoldenbellItemInfo")
  registerEvent("FromClient_ResponseChangeExpAndDropPercent", "FromClient_PersonalIcon_ResponseChangeExpAndDropPercent")
  registerEvent("FromClint_EventChangedExplorationNode", "FromClient_PersonalIcon_EventChangedExplorationNode")
  registerEvent("FromClint_EventUpdateExplorationNode", "FromClient_PersonalIcon_EventUpdateExplorationNode")
end
function PersonalIcon:update()
  local temporaryWrapper = getTemporaryInformationWrapper()
  local isPremiumPcRoom = temporaryWrapper:isPremiumPcRoom()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local player = selfPlayer:get()
  local starter = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local premium = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local pearl = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PearlPackage)
  local customize = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_CustomizationPackage)
  local dyeingPackage = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
  local russiaKamasilv = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_Kamasilve)
  local russiaPack3Time = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_RussiaPack3)
  local applyStarter = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local applyPremium = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local applyPearl = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PearlPackage)
  local applyCustomize = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_CustomizationPackage)
  local applyDyeingPackage = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
  local applyRussiaKamasilv = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_Kamasilve)
  local applySkillReset = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillChange)
  local applyAwakenSkillReset = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillAwakening)
  local applyRussiaPack3 = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_RussiaPack3)
  local blackSpiritTraining = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_BlackSpritTraining)
  local pcRoomUserHomeBuff = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PcRoomUserHomeBuff)
  local premiumValueBuff = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_PremiumValuePackageBuff)
  local blackSpiritSkillTraining = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_BlackSpritSkillTraining)
  local memoryOfMaestro = player:isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_GetItemDaily)
  local applyArshaBuff = ToClient_isAbleArshaItemDropBuffRate()
  PaGlobalFunc_PersonalIcon_CheckGoldenBell()
  if isServerFixedCharge() then
    self._iconControl[self._iconType.RussiaMonthly]:SetShow(true)
  else
    self._iconControl[self._iconType.RussiaMonthly]:SetShow(false)
  end
  if applyStarter then
    if starter > 0 then
      self._iconControl[self._iconType.Kamasylvia]:SetShow(true)
    else
      self._iconControl[self._iconType.Kamasylvia]:SetShow(false)
    end
  else
    self._iconControl[self._iconType.Kamasylvia]:SetShow(false)
  end
  if applyPremium then
    if premium > 0 then
      self._iconControl[self._iconType.ValuePack]:SetShow(true)
    else
      self._iconControl[self._iconType.ValuePack]:SetShow(false)
    end
  else
    self._iconControl[self._iconType.ValuePack]:SetShow(false)
  end
  if applyPearl then
    self._iconControl[self._iconType.Pearl]:SetShow(true)
  else
    self._iconControl[self._iconType.Pearl]:SetShow(false)
  end
  if applyCustomize then
    self._iconControl[self._iconType.Exchange]:SetShow(true)
  else
    self._iconControl[self._iconType.Exchange]:SetShow(false)
  end
  if applyDyeingPackage then
    self._iconControl[self._iconType.Merv]:SetShow(true)
  else
    self._iconControl[self._iconType.Merv]:SetShow(false)
  end
  if applyRussiaKamasilv then
    self._iconControl[self._iconType.KamasylviaForRussia]:SetShow(true)
  else
    self._iconControl[self._iconType.KamasylviaForRussia]:SetShow(false)
  end
  if applySkillReset then
    self._iconControl[self._iconType.SkillChange]:SetShow(true)
  else
    self._iconControl[self._iconType.SkillChange]:SetShow(false)
  end
  if applyAwakenSkillReset then
    self._iconControl[self._iconType.AwakenChange]:SetShow(true)
  else
    self._iconControl[self._iconType.AwakenChange]:SetShow(false)
  end
  if applyRussiaPack3 then
    self._iconControl[self._iconType.PremiumPackForRussia]:SetShow(true)
  else
    self._iconControl[self._iconType.PremiumPackForRussia]:SetShow(false)
  end
  if blackSpiritTraining then
    self._iconControl[self._iconType.BlackSpiritEXP]:SetShow(true)
  else
    self._iconControl[self._iconType.BlackSpiritEXP]:SetShow(false)
  end
  if blackSpiritSkillTraining then
    self._iconControl[self._iconType.BlackSpiritSkill]:SetShow(true)
  else
    self._iconControl[self._iconType.BlackSpiritSkill]:SetShow(false)
  end
  if memoryOfMaestro then
    self._iconControl[self._iconType.MemoryofArtisan]:SetShow(true)
  else
    self._iconControl[self._iconType.MemoryofArtisan]:SetShow(false)
  end
  if true == isPremiumPcRoom then
    if not isGameTypeRussia() and not isGameTypeEnglish() and not isGameTypeSA() and not isGameTypeKR2() and not isGameTypeTR() then
      self._iconControl[self._iconType.PCRoom]:SetShow(true)
    else
      self._iconControl[self._iconType.PCRoom]:SetShow(false)
    end
  else
    self._iconControl[self._iconType.PCRoom]:SetShow(false)
  end
  if premiumValueBuff then
    self._iconControl[self._iconType.GoldValuePack]:SetShow(true)
  else
    self._iconControl[self._iconType.GoldValuePack]:SetShow(false)
  end
  if applyArshaBuff then
    self._iconControl[self._iconType.ArshaServerBuff]:SetShow(true)
  else
    self._iconControl[self._iconType.ArshaServerBuff]:SetShow(false)
  end
  self:updatePos()
  self:calculateAlertBox(applyStarter, applyPremium, applyDyeingPackage, starter, premium, dyeingPackage, applyRussiaPack3, russiaPack3Time, applyRussiaKamasilv, russiaKamasilv)
end
function PersonalIcon:updatePos()
  local currentPos = self._iconStartPosX
  for idx = 0, self._iconType.count - 1 do
    if nil ~= self._iconControl[idx] and true == self._iconControl[idx]:GetShow() then
      self._iconControl[idx]:SetPosX(currentPos)
      currentPos = currentPos + self._iconGapPosX
    end
  end
  local panelPosX = 100
  local panelPosY = 45
  if Panel_MainStatus_Remaster:GetShow() then
    panelPosX = PaGlobalFunc_MainStatus_GetPosX() + PaGlobalFunc_MainStatus_GetSizeX() + 25
    panelPosY = 5
  elseif Panel_SelfPlayerExpGage:GetShow() then
    panelPosX = 100
    panelPosY = 45
  else
    panelPosX = 10
    panelPosY = 5
  end
  _panel:SetPosXY(panelPosX, panelPosY)
end
function PersonalIcon:calculateAlertBox(applyStarter, applyPremium, applyDyeingPackage, starter, premium, dyeingPackage, applyRussiaPack3, russiaPack3Time, applyRussiaKamasilv, russiaKamasilv)
  local CheckToday = ToClient_getGameUIManagerWrapper():getLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.ValuePackage)
  if ToClient_GetToday() == CheckToday then
    return
  end
  local applyFlag = {
    applyStarter,
    applyPremium,
    applyDyeingPackage
  }
  local checkTime = {
    starter,
    premium,
    dyeingPackage
  }
  local controls = {
    self._iconControl[self._iconType.Kamasylvia],
    self._iconControl[self._iconType.ValuePack],
    self._iconControl[self._iconType.Pearl]
  }
  local msgKey = {
    "LUA_PERSONALICON_LEFT_STARTER",
    "LUA_PERSONALICON_LEFT_PREMIUM",
    "LUA_PERSONALICON_LEFT_PALLETE"
  }
  if isGameTypeRussia() then
    applyFlag = {
      applyStarter,
      applyPremium,
      applyDyeingPackage,
      applyRussiaPack3,
      applyRussiaKamasilv
    }
    checkTime = {
      starter,
      premium,
      dyeingPackage,
      russiaPack3Time,
      russiaKamasilv
    }
    controls = {
      self._iconControl[self._iconType.Kamasylvia],
      self._iconControl[self._iconType.ValuePack],
      self._iconControl[self._iconType.Pearl],
      self._iconControl[self._iconType.RussiaMonthly],
      self._iconControl[self._iconType.KamasylviaForRussia]
    }
    msgKey = {
      "LUA_PERSONALICON_LEFT_PREMIUM1_RUS",
      "LUA_PERSONALICON_LEFT_PREMIUM2_RUS",
      "LUA_PERSONALICON_LEFT_PALLETE",
      "LUA_PERSONALICON_LEFT_PREMIUM3_RUS",
      "LUA_PERSONALICON_LEFT_STARTER"
    }
  else
    msgKey = {
      "LUA_PERSONALICON_LEFT_STARTER",
      "LUA_PERSONALICON_LEFT_PREMIUM",
      "LUA_PERSONALICON_LEFT_PALLETE"
    }
  end
  local msgs = {}
  local posFlag = false
  for k, v in ipairs(applyFlag) do
    if true == v and checkTime[k] > 0 then
      local leftHour = math.ceil(checkTime[k] / 60 / 60)
      if leftHour <= 72 then
        if leftHour > 24 then
          local day = math.floor(leftHour / 24)
          leftHour = leftHour - day * 24
          msgs[k] = PAGetStringParam2(Defines.StringSheet_GAME, msgKey[k] .. 2, "leftDay", day, "leftHour", leftHour)
        else
          msgs[k] = PAGetStringParam1(Defines.StringSheet_GAME, msgKey[k], "leftHour", leftHour)
        end
        if false == posFlag then
          self._ui.txt_BubbleAlert:SetPosX(controls[k]:GetPosX())
          self._ui.txt_BubbleAlert:SetPosY(controls[k]:GetPosY() + controls[k]:GetSizeY() + 10)
          posFlag = true
        end
      end
    end
  end
  for k, v in ipairs(controls) do
    controls[k]:EraseAllEffect()
  end
  if true == posFlag and (true == self._premiumPackageToolTipOnce or true == self._ui.txt_BubbleAlert:GetShow()) then
    if nil ~= msgs then
      local message = "<PAColor0xffe7d583>" .. PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALICON_LEFT_ALERT_TITLE") .. "<PAOldColor>" .. "\n"
      for index, str in pairs(msgs) do
        message = message .. str .. "\n"
        controls[index]:AddEffect("fUI_PremiumPackage_01A", true, 0, 0)
      end
      self._ui.txt_BubbleAlert:SetText(string.sub(message, 1, string.len(message) - 1))
      self._ui.txt_BubbleAlert:SetSize(self._ui.txt_BubbleAlert:GetTextSizeX() + 18, self._ui.txt_BubbleAlert:GetTextSizeY() + 25)
      self._ui.txt_BubbleAlert:SetShow(true)
      self._ui.btn_AlertClose:ComputePos()
      self._premiumPackageToolTipOnce = false
    end
  else
    self._ui.txt_BubbleAlert:SetShow(false)
  end
end
function PaGlobalFunc_PersonalIcon_Update()
  local self = PersonalIcon
  self:update()
end
function PackageIconPosition()
  local self = PersonalIcon
  self:updatePos()
end
function PaGlobalFunc_PersonalIcon_Init()
  local self = PersonalIcon
  self:init()
end
function FromClient_PackageIconUpdate()
  PaGlobalFunc_PersonalIcon_Update()
end
function InputMO_PersonalIcon_ShowTooltip(isShow, iconType)
  local self = PersonalIcon
  if false == isShow then
    TooltipSimple_Hide()
    return
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local name = ""
  local desc = ""
  local uiControl
  local leftTime = 0
  local player = selfPlayer:get()
  local curChannelData = getCurrentChannelServerData()
  local goldenBellTime_s64 = player:getGoldenbellExpirationTime_s64()
  local goldenBellTime = convertStringFromDatetime(goldenBellTime_s64)
  local goldenBellPercent = player:getGoldenbellPercent()
  local goldenBellPercentString = tostring(math.floor(goldenBellPercent / 10000))
  local goldenBellCharacterName = player:getGoldenbellItemOwnerCharacterName()
  local goldenBellGuildName = player:getGoldenbellItemOwnerGuildName()
  local remainRewardCount = ToClient_GetChallengeRewardInfoCount()
  local starter = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_StarterPackage)
  local premium = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PremiumPackage)
  local pearl = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PearlPackage)
  local customize = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_CustomizationPackage)
  local dyeingPackage = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
  local russiaKamasilv = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_Kamasilve)
  local skillResetTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillChange)
  local awakenSkillResetTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_UnlimitedSkillAwakening)
  local russiaPack3Time = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_RussiaPack3)
  local trainingTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_BlackSpritTraining)
  local skilltrainingTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_BlackSpritSkillTraining)
  local pcRoomHomeTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PcRoomUserHomeBuff)
  local premiumValueTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_PremiumValuePackageBuff)
  local memoryOfMaestroTime = player:getUserChargeTime(UI_BUFFTYPE.eUserChargeType_GetItemDaily)
  local expEventPercent = getEventExpPercentByWorldNo(curChannelData._worldNo, curChannelData._serverNo)
  local expEventPercentShow = 0
  if expEventPercent > self._defaultEventExp then
    expEventPercentShow = math.floor(expEventPercent / 10000 - 100)
  end
  local expVehiclePercent = lobby_getEventVehicleExpPercentByWorldNo(curChannelData._worldNo, curChannelData._serverNo)
  local expEventVehiclePercentShow = 0
  if expVehiclePercent > self._defaultEventExp then
    expEventVehiclePercentShow = math.floor(expVehiclePercent / 10000 - 100)
  end
  local expNodePercent = self._currentNodeLv * ToClient_getNodeIncreaseItemDropPercent() / 10000
  if iconType == self._iconType.PCRoom then
    if isGameTypeEnglish() then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_TITLE_NA")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_DESC_NA")
    elseif isBlackSpiritEnable then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_DESC")
    else
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PCROOM_DESC_NONEBLACKSPIRIT")
    end
    uiControl = self._iconControl[self._iconType.PCRoom]
  elseif iconType == self._iconType.Kamasylvia then
    leftTime = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TIME", "getStarterPackageTime", convertStringFromDatetime(toInt64(0, starter)))
    if isGameTypeRussia() then
      if isServerFixedCharge() then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TITLE_RUS")
        desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_DESC_RUS")
      else
        local s64_dayCycle = toInt64(0, 86400)
        local s64_day = toInt64(0, starter) / s64_dayCycle
        if s64_day < toInt64(0, 3650) then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TITLE_RUS")
          desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_DESC_RUS")
        else
          name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TITLE_RUS")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_DESC_RUS_FOR_INFINITY")
        end
      end
    else
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TITLE")
      desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_DESC")
    end
    uiControl = self._iconControl[self._iconType.Kamasylvia]
  elseif iconType == self._iconType.ValuePack then
    leftTime = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_AILINBUFF_TIME", "getPremiumPackageTime", convertStringFromDatetime(toInt64(0, premium)))
    if isGameTypeJapan() then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE")
      desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_JP")
    elseif isGameTypeRussia() then
      if isServerFixedCharge() then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_RUS")
        desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_RUS")
      else
        local s64_dayCycle = toInt64(0, 86400)
        local s64_day = toInt64(0, premium) / s64_dayCycle
        if s64_day < toInt64(0, 3650) then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_RUS")
          desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_RUS")
        else
          name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_RUS")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_RUS_FOR_INFINITY")
        end
      end
    elseif isGameTypeTaiwan() then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_TW")
      desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_TW")
    elseif isGameTypeSA() then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_SA")
      desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_SA")
    elseif isGameTypeKR2() then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_KR2")
      desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_KR2")
    elseif isGameTypeTR() then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_TR")
      desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_TR")
    elseif isGameTypeTH() then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_TH")
      desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_TH")
    elseif isGameTypeID() then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE_ID")
      desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC_ID")
    else
      name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_TITLE")
      desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EILEENBUFF_DESC")
    end
    uiControl = self._iconControl[self._iconType.ValuePack]
  elseif iconType == self._iconType.Pearl then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PEARLBUFF_TITLE")
    leftTime = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_LIGHTPEARLBUFF_TIME", "getPearlPackageTime", convertStringFromDatetime(toInt64(0, pearl)))
    desc = leftTime .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PEARLBUFF_DESC")
    uiControl = self._iconControl[self._iconType.Pearl]
  elseif iconType == self._iconType.GuildWar and true == self._localNodeInvestment then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NODELVBUFF_TITLE")
    if expNodePercent > 0 then
      desc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NODELVBUFF_DESC_WITH_BUFF", "nodeName", self._localNodeName, "percent", tostring(expNodePercent))
    else
      desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NODELVBUFF_DESC", "nodeName", self._localNodeName)
    end
    uiControl = self._iconControl[self._iconType.GuildWar]
  elseif iconType == self._iconType.GuildWar and false == self._localNodeInvestment then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NODELVBUFF_TITLE")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_NOTNODELVBUFF_DESC", "localNodeName", self._localNodeName)
    uiControl = self._iconControl[self._iconType.GuildWar]
  elseif iconType == self._iconType.EXP then
    local expDesc = getBattleExpTooltipText(curChannelData)
    if "" == expDesc then
      local battleExp = curChannelData:getBattleExp()
      if battleExp > CppDefine.e100Percent then
        if "" ~= expDesc then
          expDesc = expDesc .. "\n"
        end
        expDesc = expDesc .. PAGetStringParam1(Defines.StringSheet_GAME, "EVENT_SYSTEM_ADD_EXP", "percent", tostring((battleExp - CppDefine.e100Percent) / CppDefine.e1Percent))
      end
      local skillExp = curChannelData:getSkillExp()
      if skillExp > CppDefine.e100Percent then
        if "" ~= expDesc then
          expDesc = expDesc .. "\n"
        end
        expDesc = expDesc .. PAGetStringParam1(Defines.StringSheet_GAME, "EVENT_SYSTEM_ADD_SKILL_EXP", "percent", tostring((skillExp - CppDefine.e100Percent) / CppDefine.e1Percent))
      end
      local vehicleExp = curChannelData:getVehicleExp()
      if vehicleExp > CppDefine.e100Percent then
        if "" ~= expDesc then
          expDesc = expDesc .. "\n"
        end
        expDesc = expDesc .. PAGetStringParam1(Defines.StringSheet_GAME, "EVENT_SYSTEM_ADD_VEHICLE_EXP", "percent", tostring((vehicleExp - CppDefine.e100Percent) / CppDefine.e1Percent))
      end
      for lifeIndex = 0, CppEnums.LifeExperienceType.Type_Count - 1 do
        local lifeExp = curChannelData:getLifeExp(lifeIndex)
        if lifeExp > CppDefine.e100Percent then
          if "" ~= expDesc then
            expDesc = expDesc .. "\n"
          end
          expDesc = expDesc .. PAGetStringParam2(Defines.StringSheet_GAME, "EVENT_SYSTEM_ADD_LIFE_EXP", "type", CppEnums.LifeExperienceString[lifeIndex], "percent", tostring((lifeExp - CppDefine.e100Percent) / CppDefine.e1Percent))
        end
      end
    end
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_EXPBUFF")
    if "" ~= expDesc then
      desc = "<PAColor0xFF66CC33>" .. expDesc .. "<PAOldColor>"
    else
      desc = ""
    end
    uiControl = self._iconControl[self._iconType.EXP]
  elseif iconType == self._iconType.Drop then
    local expDesc = getBattleExpTooltipText(curChannelData)
    if "" == expDesc then
      local addRate = curChannelData:getItemDrop()
      if addRate > CppDefine.e100Percent then
        expDesc = PAGetStringParam1(Defines.StringSheet_GAME, "EVENT_SYSTEM_ADD_DROP_ITEM_RATE", "percent", tostring((addRate - CppDefine.e100Percent) / CppDefine.e1Percent))
      end
    end
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_DROPBUFF")
    if "" ~= expDesc then
      desc = "<PAColor0xFF66CC33>" .. expDesc .. "<PAOldColor>"
    else
      desc = ""
    end
    uiControl = self._iconControl[self._iconType.Drop]
  elseif iconType == self._iconType.Exchange then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFCHARACTER_BUFF_TOOLTIP_NAME")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CASH_CUSTOMIZATION_BUFFTOOLTIP_DESC", "customizationPackageTime", convertStringFromDatetime(toInt64(0, customize)))
    uiControl = self._iconControl[self._iconType.Exchange]
  elseif iconType == self._iconType.Merv then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAUGE_DYEINGPACKEAGE_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAUGE_DYEINGPACKEAGE_DESC") .. convertStringFromDatetime(toInt64(0, dyeingPackage))
    uiControl = self._iconControl[self._iconType.Merv]
  elseif iconType == self._iconType.KamasylviaForRussia then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_YAZBUFF_DESC") .. "\n" .. convertStringFromDatetime(toInt64(0, russiaKamasilv))
    uiControl = self._iconControl[self._iconType.KamasylviaForRussia]
  elseif iconType == self._iconType.RussiaMonthly then
    local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
    local fixedChargeTime = temporaryPCRoomWrapper:getFixedChargeTime()
    local leftTime = calculateDayFromDateDay(toInt64(0, fixedChargeTime))
    if leftTime < toInt64(0, 365) then
      desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PRIMIUMSERVER_DESC", "leftTime", convertStringFromDatetime(toInt64(0, temporaryPCRoomWrapper:getFixedChargeTime())))
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PRIMIUMSERVER_DESC_RU_FOR_INFINITY")
    end
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PRIMIUMSERVER_TITLE")
    uiControl = self._iconControl[self._iconType.RussiaMonthly]
  elseif iconType == self._iconType.GoldenBell then
    local curChannelData = getCurrentChannelServerData()
    local channelName = getChannelName(curChannelData._worldNo, curChannelData._serverNo)
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_TOOLTIP_NAME")
    if nil == goldenBellGuildName or "" == goldenBellGuildName or " " == goldenBellGuildName then
      desc = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_TOOLTIP_DESC_NOGUILD", "channelName", channelName, "name", goldenBellCharacterName, "percent", goldenBellPercentString) .. " <PAColor0xFFF26A6A>" .. goldenBellTime .. "<PAOldColor>"
    else
      desc = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_TOOLTIP_DESC_GUILD", "channelName", channelName, "guildName", goldenBellGuildName, "name", goldenBellCharacterName, "percent", goldenBellPercentString) .. " <PAColor0xFFF26A6A>" .. goldenBellTime .. "<PAOldColor>"
    end
    uiControl = self._iconControl[self._iconType.GoldenBell]
  elseif iconType == self._iconType.SkillChange then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_SKILLRESET_TOOLTIP_NAME")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_SKILLRESET_TOOLTIP_DESC", "skillResetTime", convertStringFromDatetime(toInt64(0, skillResetTime)))
    uiControl = self._iconControl[self._iconType.SkillChange]
  elseif iconType == self._iconType.AwakenChange then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_AWAKENSKILL_TOOLTIP_NAME")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_AWAKENSKILL_TOOLTIP_DESC", "awakenSkillResetTime", convertStringFromDatetime(toInt64(0, awakenSkillResetTime)))
    uiControl = self._iconControl[self._iconType.AwakenChange]
  elseif iconType == self._iconType.PremiumPackForRussia then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_RUSSIAPACK3_TOOLTIP_NAME")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_RUSSIAPACK3_TOOLTIP_DESC", "russiaPack3Time", convertStringFromDatetime(toInt64(0, russiaPack3Time)))
    uiControl = self._iconControl[self._iconType.PremiumPackForRussia]
  elseif iconType == self._iconType.BlackSpiritEXP then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_BLACKSPIRITTRAINING_TOOLTIP_NAME")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_BLACKSPIRITTRAINING_TOOLTIP_DESC", "trainingTime", convertStringFromDatetime(toInt64(0, trainingTime)))
    uiControl = self._iconControl[self._iconType.BlackSpiritEXP]
  elseif iconType == self._iconType.GoldValuePack then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PREMIUMVALUE_TITLE")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_PREMIUMVALUE_DESC", "time", convertStringFromDatetime(toInt64(0, premiumValueTime)))
    uiControl = self._iconControl[self._iconType.GoldValuePack]
  elseif iconType == self._iconType.BlackSpiritSkill then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_BLACKSPIRITSKILLTRAINING_TOOLTIP_NAME")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_BLACKSPIRITSKILLTRAINING_TOOLTIP_DESC", "skilltrainingTime", convertStringFromDatetime(toInt64(0, skilltrainingTime)))
    uiControl = self._iconControl[self._iconType.BlackSpiritSkill]
  elseif iconType == self._iconType.MemoryofArtisan then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAUGE_MAESTROTITLE")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAUGE_MAESTRODESC", "time", convertStringFromDatetime(toInt64(0, memoryOfMaestroTime)))
    uiControl = self._iconControl[self._iconType.MemoryofArtisan]
  elseif iconType == self._iconType.ArshaServerBuff then
    local arshaItemDropBuffRate = ToClient_getArshaItemDropBuffRate() / 10000
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ARSHA_ITEMDROPBUFF_NAME")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_ITEMDROPBUFF_DESC", "dropRate", arshaItemDropBuffRate)
    uiControl = self._iconControl[self._iconType.ArshaServerBuff]
  end
  if nil == uiControl then
    TooltipSimple_Hide()
    return
  end
  if true == isShow then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end
function FromClient_PersonalIcon_ResponseGoldenbellItemInfo(goldenbellPercent, goldenbellExpirationTime_s64, goldenbellOwnerCharacterName, goldenbellOwnerGuildName)
  local self = PersonalIcon
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  self._iconControl[self._iconType.GoldenBell]:SetShow(false)
  if goldenbellExpirationTime_s64 <= toInt64(0, 0) then
    self._iconControl[self._iconType.GoldenBell]:SetShow(false)
    self:updatePos()
    return
  else
    self._iconControl[self._iconType.GoldenBell]:SetShow(true)
  end
  local curChannelData = getCurrentChannelServerData()
  local channelName = getChannelName(curChannelData._worldNo, curChannelData._serverNo)
  local goldenBellPercentString = tostring(math.floor(goldenbellPercent / 10000))
  local msg = {
    main = "",
    sub = "",
    addMsg = ""
  }
  if "" == goldenbellOwnerGuildName then
    msg = {
      main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_NAK_MAIN_NOGUILD", "name", goldenbellOwnerCharacterName),
      sub = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_NAK_SUB_NOGUILD", "channelName", channelName, "percent", goldenBellPercentString),
      addMsg = ""
    }
  else
    msg = {
      main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_NAK_MAIN_GUILD", "guildName", goldenbellOwnerGuildName, "name", goldenbellOwnerCharacterName),
      sub = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_GOLDENBELL_NAK_MAIN_SUB", "channelName", channelName, "percent", goldenBellPercentString),
      addMsg = ""
    }
  end
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 10, 54)
  self:updatePos()
end
function PaGlobalFunc_PersonalIcon_CheckGoldenBell()
  local self = PersonalIcon
  local player = getSelfPlayer():get()
  local goldenBellTime_s64 = player:getGoldenbellExpirationTime_s64()
  if goldenBellTime_s64 <= toInt64(0, 0) then
    self._iconControl[self._iconType.GoldenBell]:SetShow(false)
    self:updatePos()
    return
  else
    self._iconControl[self._iconType.GoldenBell]:SetShow(true)
  end
end
function FromClient_PersonalIcon_ResponseChangeExpAndDropPercent()
  local self = PersonalIcon
  local curChannelData = getCurrentChannelServerData()
  local expEventShow = IsWorldServerEventTypeByWorldNo(curChannelData._worldNo, curChannelData._serverNo, 0)
  local dropEventShow = IsWorldServerEventTypeByWorldNo(curChannelData._worldNo, curChannelData._serverNo, 1)
  if expEventShow then
    self._iconControl[self._iconType.EXP]:SetShow(true)
  else
    self._iconControl[self._iconType.EXP]:SetShow(false)
  end
  if dropEventShow then
    self._iconControl[self._iconType.Drop]:SetShow(true)
  else
    self._iconControl[self._iconType.Drop]:SetShow(false)
  end
  self:updatePos()
end
function FromClient_PersonalIcon_EventChangedExplorationNode(wayPointKey)
  PaGlobalFunc_PersonalIcon_UpdateExplorationNode(wayPointKey)
end
function FromClient_PersonalIcon_EventUpdateExplorationNode(wayPointKey)
  local self = PersonalIcon
  if self._saveWayPoint == wayPointKey then
    PaGlobalFunc_PersonalIcon_UpdateExplorationNode(wayPointKey)
  end
end
function PaGlobalFunc_PersonalIcon_UpdateExplorationNode(wayPointKey)
  local self = PersonalIcon
  local nodeLv = ToClient_GetNodeLevel(wayPointKey)
  local nodeName = ToClient_GetNodeNameByWaypointKey(wayPointKey)
  local nodeExp = ToClient_GetNodeExperience_s64(wayPointKey)
  self._localNodeName = nodeName
  self._saveWayPoint = wayPointKey
  self._iconControl[self._iconType.GuildWar]:SetShow(true)
  if nodeLv > 0 and nodeExp >= toInt64(0, 0) then
    self._localNodeInvestment = true
    self._currentNodeLv = nodeLv
    local x1, y1, x2, y2 = setTextureUV_Func(self._iconControl[self._iconType.GuildWar], 1, 42, 41, 82)
    self._iconControl[self._iconType.GuildWar]:getBaseTexture():setUV(x1, y1, x2, y2)
    self._iconControl[self._iconType.GuildWar]:setRenderTexture(self._iconControl[self._iconType.GuildWar]:getBaseTexture())
  else
    self._localNodeInvestment = false
    self._currentNodeLv = 0
    local x1, y1, x2, y2 = setTextureUV_Func(self._iconControl[self._iconType.GuildWar], 83, 165, 123, 205)
    self._iconControl[self._iconType.GuildWar]:getBaseTexture():setUV(x1, y1, x2, y2)
    self._iconControl[self._iconType.GuildWar]:setRenderTexture(self._iconControl[self._iconType.GuildWar]:getBaseTexture())
  end
  self:updatePos()
end
function InputMLUp_PersonalIcon_CloseAlert()
  local self = PersonalIcon
  self._iconControl[self._iconType.Kamasylvia]:EraseAllEffect()
  self._iconControl[self._iconType.ValuePack]:EraseAllEffect()
  self._iconControl[self._iconType.Pearl]:EraseAllEffect()
  self._iconControl[self._iconType.RussiaMonthly]:EraseAllEffect()
  self._iconControl[self._iconType.KamasylviaForRussia]:EraseAllEffect()
  ToClient_getGameUIManagerWrapper():setLuaCacheDataListNumber(CppEnums.GlobalUIOptionType.ValuePackage, ToClient_GetToday(), CppEnums.VariableStorageType.eVariableStorageType_User)
  self._ui.txt_BubbleAlert:SetShow(false)
end
function PearlShop_Open()
  InGameShop_Open()
end
function FGlobal_PackageIconUpdate()
  FromClient_PackageIconUpdate()
  FromClient_PersonalIcon_ResponseChangeExpAndDropPercent()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_PersonalIcon_Init")
function PaGlobal_SelfPlayer_Expgage()
end
function Panel_SelfPlayer_EnableSkillCheck_Close()
end
