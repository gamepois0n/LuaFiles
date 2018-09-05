local _panel = Panel_MainStatus_Remaster
local _dangerPanel = Panel_Danger
local MainStatus = {
  _ui = {
    stc_ExpBG = UI.getChildControl(_panel, "Static_ExpBG"),
    progress_Exp = UI.getChildControl(_panel, "CircularProgress_EXP"),
    btn_PVP = UI.getChildControl(_panel, "CheckButton_PvP"),
    stc_HPBG = UI.getChildControl(_panel, "Static_HPBG"),
    progress_HPLater = UI.getChildControl(_panel, "Progress2_HP_Later"),
    progress_HP = UI.getChildControl(_panel, "Progress2_HP"),
    hpValue = UI.getChildControl(_panel, "StaticText_HpValue"),
    stc_MPBG = UI.getChildControl(_panel, "Static_MPBG"),
    progress_MPLater = UI.getChildControl(_panel, "Progress2_MP_Later"),
    progress_MP = UI.getChildControl(_panel, "Progress2_MP"),
    mpValue = UI.getChildControl(_panel, "StaticText_MpValue"),
    stc_RageBG = UI.getChildControl(_panel, "Static_RageBG"),
    progress_Rage = UI.getChildControl(_panel, "Progress2_Rage"),
    txt_RageValue = UI.getChildControl(_panel, "StaticText_RageValue"),
    stc_RageLock = UI.getChildControl(_panel, "Static_BlackSpiritLock"),
    txt_SkillPoint = UI.getChildControl(_panel, "StaticText_SkillPoint"),
    txt_EnergyPoint = UI.getChildControl(_panel, "StaticText_EnergyPoint"),
    txt_ContributePoint = UI.getChildControl(_panel, "StaticText_ContributePoint"),
    stc_ClassType0 = UI.getChildControl(_panel, "Static_ClassResourceType0"),
    stc_ClassType1 = UI.getChildControl(_panel, "Static_ClassResourceType1"),
    stc_HPAlert = UI.getChildControl(_dangerPanel, "Static_Alert")
  },
  _statusTooltipType = {
    skill = 0,
    energy = 1,
    contribute = 2,
    resource0 = 3,
    resource1 = 4,
    blackSpirit = 5,
    pvp = 6
  },
  _contributeUsePoint = {
    [0] = PAGetString(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_1"),
    [1] = PAGetString(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_2"),
    [2] = PAGetString(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_3")
  },
  _lastLevel = 0,
  _isSixteenLV = false,
  _lastSkillPoint = -1,
  _lastExplorePoint = 0,
  _lastRemainExplorePoint = 0,
  _lastContRate = 0,
  _isFirstExplore = false,
  _lastWP = -1,
  _prevHpAlertTime = 0,
  _prevHP = 0,
  _prevMaxHP = 0,
  _alertHpValue = 40,
  _strongMonsterAlert = false,
  _prevMP = 0,
  _prevMaxMP = 0,
  _isPvPOn = true,
  _maxType0Count = 3,
  _maxType1Count = 3,
  _resourceType0 = {},
  _resourceType1 = {},
  _classResourceShowCheck = {
    [1] = false,
    [2] = false,
    [3] = false
  }
}
function MainStatus:init()
  self._ui.txt_LV = UI.getChildControl(self._ui.stc_ExpBG, "StaticText_Lv")
  self._ui.txt_EXP = UI.getChildControl(self._ui.stc_ExpBG, "StaticText_EXP")
  for idx = 1, self._maxType0Count do
    local bg = UI.getChildControl(self._ui.stc_ClassType0, "Static_Bg" .. idx)
    local element = UI.getChildControl(self._ui.stc_ClassType0, "Static_Element" .. idx)
    self._resourceType0[idx] = {}
    self._resourceType0[idx].bg = bg
    self._resourceType0[idx].element = element
  end
  self._ui.txt_ResourceCount = UI.getChildControl(self._ui.stc_ClassType0, "StaticText_Count")
  for idx = 1, self._maxType1Count do
    local type1bg = UI.getChildControl(self._ui.stc_ClassType1, "Static_Bg" .. idx)
    local type1element = UI.getChildControl(self._ui.stc_ClassType1, "Static_Element" .. idx)
    self._resourceType1[idx] = {}
    self._resourceType1[idx].bg = type1bg
    self._resourceType1[idx].element = type1element
  end
  self:addStatusEffect()
  self:setMPBarTexture()
  self:registEventHandler()
  self:updateAll()
  PaGlobalFunc_MainStatus_SetShow(true)
end
function MainStatus:registEventHandler()
  self._ui.btn_PVP:addInputEvent("Mouse_LUp", "requestTogglePvP()")
  self._ui.btn_PVP:addInputEvent("Mouse_On", "InputMO_MainStatus_TooltipShow(true, " .. self._statusTooltipType.pvp .. ")")
  self._ui.btn_PVP:addInputEvent("Mouse_Out", "InputMO_MainStatus_TooltipShow(false)")
  self._ui.stc_RageBG:addInputEvent("Mouse_LUp", "requestBlackSpritSkill()")
  self._ui.stc_RageBG:addInputEvent("Mouse_On", "InputMO_MainStatus_TooltipShow(true, " .. self._statusTooltipType.blackSpirit .. ")")
  self._ui.stc_RageBG:addInputEvent("Mouse_Out", "InputMO_MainStatus_TooltipShow(false)")
  self._ui.stc_ClassType0:addInputEvent("Mouse_On", "InputMO_MainStatus_TooltipShow(true, " .. self._statusTooltipType.resource0 .. ")")
  self._ui.stc_ClassType0:addInputEvent("Mouse_Out", "InputMO_MainStatus_TooltipShow(false)")
  self._ui.stc_ClassType1:addInputEvent("Mouse_On", "InputMO_MainStatus_TooltipShow(true, " .. self._statusTooltipType.resource1 .. ")")
  self._ui.stc_ClassType1:addInputEvent("Mouse_Out", "InputMO_MainStatus_TooltipShow(false)")
  self._ui.txt_SkillPoint:addInputEvent("Mouse_On", "InputMO_MainStatus_TooltipShow(true, " .. self._statusTooltipType.skill .. ")")
  self._ui.txt_SkillPoint:addInputEvent("Mouse_Out", "InputMO_MainStatus_TooltipShow(false)")
  self._ui.txt_EnergyPoint:addInputEvent("Mouse_On", "InputMO_MainStatus_TooltipShow(true, " .. self._statusTooltipType.energy .. ")")
  self._ui.txt_EnergyPoint:addInputEvent("Mouse_Out", "InputMO_MainStatus_TooltipShow(false)")
  self._ui.txt_ContributePoint:addInputEvent("Mouse_On", "InputMO_MainStatus_TooltipShow(true, " .. self._statusTooltipType.contribute .. ")")
  self._ui.txt_ContributePoint:addInputEvent("Mouse_Out", "InputMO_MainStatus_TooltipShow(false)")
  registerEvent("EventCharacterInfoUpdate", "PaGlobalFunc_MainStatus_UpdateAll")
  registerEvent("FromClient_SelfPlayerHpChanged", "PaGlobalFunc_MainStatus_UpdateHP")
  registerEvent("FromClient_SelfPlayerMpChanged", "PaGlobalFunc_MainStatus_UpdateMP")
  registerEvent("FromClient_SelfPlayerExpChanged", "PaGlobalFunc_MainStatus_UpdateEXP")
  registerEvent("EventSelfPlayerLevelUp", "PaGlobalFunc_MainStatus_UpdateLV")
  registerEvent("FromClient_SelfPlayerCombatSkillPointChanged", "PaGlobalFunc_MainStatus_UpdateEXP")
  registerEvent("subResourceChanged", "PaGlobalFunc_MainStatus_UpdateResource")
  registerEvent("FromClient_WpChanged", "PaGlobalFunc_MainStatus_UpdateEnergy")
  registerEvent("FromClient_UpdateExplorePoint", "PaGlobalFunc_MainStatus_UpdateContribute")
  registerEvent("FromClient_UpdateAdrenalin", "PaGlobalFunc_MainStatus_UpdateRage")
  registerEvent("FromClient_ChangeAdrenalinMode", "PaGlobalFunc_MainStatus_UpdateRage")
  registerEvent("FromClient_UseableBlackSpritSkill", "FromClient_MainStatus_BlackSpiritLock")
  registerEvent("FromClient_RenderModeChangeState", "FromClient_MainStatus_CheckHpAlertPostEvent")
  registerEvent("EventPvPModeChanged", "PaGlobalFunc_MainStatus_PVPModeChange")
  registerEvent("EventPlayerPvPAbleChanged", "PaGlobalFunc_MainStatus_PVPAbleChange")
  registerEvent("onScreenResize", "FromClient_MainStatus_OnResize")
end
function MainStatus:addStatusEffect()
  self._ui.progress_HP:EraseAllEffect()
  self._ui.progress_Rage:EraseAllEffect()
  self._ui.stc_RageBG:EraseAllEffect()
  self._ui.progress_HP:AddEffect("UI_Hp_Bar01A", true, 0, 0)
  self._ui.progress_HP:AddEffect("UI_Hp_Bar01B", true, 0, 0)
  self._ui.progress_HP:AddEffect("UI_Hp_Bar02A", true, 0, 0)
  self._ui.progress_HP:AddEffect("UI_Hp_Bar02B", true, 0, 0)
  self._ui.progress_HP:AddEffect("fUI_Hp_Bar01", true, 0, 0)
  self._ui.progress_Rage:AddEffect("UI_Rage_Bar01A", true, 0, 0)
  self._ui.progress_Rage:AddEffect("UI_Rage_Bar02A", true, 0, 0)
  self._ui.progress_Rage:AddEffect("UI_Rage_Bar02B", true, 0, 0)
  self._ui.progress_Rage:AddEffect("fUI_Rage_Bar01", true, 0, 0)
  self._ui.stc_RageBG:AddEffect("fN_DarkSpirit_Gage_01A", true, -107, 0)
end
function MainStatus:setMPBarTexture()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local classType = selfPlayer:getClassType()
  self._ui.progress_MP:EraseAllEffect()
  self._ui.progress_MP:ChangeTextureInfoName("Renewal/Progress/Console_Progressbar_03.dds")
  self._ui.progress_MPLater:ChangeTextureInfoName("Renewal/Progress/Console_Progressbar_03.dds")
  if classType == CppEnums.ClassType.ClassType_Warrior or classType == CppEnums.ClassType.ClassType_Giant or classType == CppEnums.ClassType.ClassType_Lahn or classType == CppEnums.ClassType.ClassType_Combattant or classType == CppEnums.ClassType.ClassType_CombattantWomen or classType == CppEnums.ClassType.ClassType_BladeMaster or classType == CppEnums.ClassType.ClassType_BladeMasterWomen or classType == CppEnums.ClassType.ClassType_NinjaWomen or classType == CppEnums.ClassType.ClassType_Kunoichi or classType == CppEnums.ClassType.ClassType_NinjaMan then
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MP, 5, 452, 161, 476)
    self._ui.progress_MP:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MP:setRenderTexture(self._ui.progress_MP:getBaseTexture())
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MPLater, 169, 477, 325, 501)
    self._ui.progress_MPLater:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MPLater:setRenderTexture(self._ui.progress_MPLater:getBaseTexture())
    self._ui.progress_MP:AddEffect("UI_Mp_Bar01A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_Bar01B", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_Bar02A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_Bar02B", true, 0, 0)
    self._ui.progress_MP:AddEffect("fUI_Mp_Bar01", true, 0, 0)
  elseif classType == CppEnums.ClassType.ClassType_Sorcerer or classType == CppEnums.ClassType.ClassType_WizardWomen or classType == CppEnums.ClassType.ClassType_Wizard or classType == CppEnums.ClassType.ClassType_Tamer then
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MP, 5, 377, 161, 401)
    self._ui.progress_MP:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MP:setRenderTexture(self._ui.progress_MP:getBaseTexture())
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MPLater, 169, 377, 325, 401)
    self._ui.progress_MPLater:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MPLater:setRenderTexture(self._ui.progress_MPLater:getBaseTexture())
    self._ui.progress_MP:AddEffect("UI_Mp_B_Bar01A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_B_Bar01B", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_B_Bar02A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_B_Bar02B", true, 0, 0)
    self._ui.progress_MP:AddEffect("fUI_Mp_B_Bar01", true, 0, 0)
  elseif classType == CppEnums.ClassType.ClassType_Ranger then
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MP, 5, 402, 161, 426)
    self._ui.progress_MP:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MP:setRenderTexture(self._ui.progress_MP:getBaseTexture())
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MPLater, 169, 402, 325, 426)
    self._ui.progress_MPLater:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MPLater:setRenderTexture(self._ui.progress_MPLater:getBaseTexture())
    self._ui.progress_MP:AddEffect("UI_Mp_G_Bar01A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_G_Bar01B", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_G_Bar02A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_G_Bar02B", true, 0, 0)
    self._ui.progress_MP:AddEffect("fUI_Mp_G_Bar01", true, 0, 0)
  elseif classType == CppEnums.ClassType.ClassType_Valkyrie then
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MP, 5, 477, 161, 501)
    self._ui.progress_MP:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MP:setRenderTexture(self._ui.progress_MP:getBaseTexture())
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MPLater, 169, 477, 325, 501)
    self._ui.progress_MPLater:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MPLater:setRenderTexture(self._ui.progress_MPLater:getBaseTexture())
    self._ui.progress_MP:AddEffect("UI_Mp_W_Bar01A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_W_Bar01B", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_W_Bar02A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_W_Bar02B", true, 0, 0)
    self._ui.progress_MP:AddEffect("fUI_Mp_W_Bar01", true, 0, 0)
  elseif classType == CppEnums.ClassType.ClassType_DarkElf then
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MP, 5, 427, 161, 451)
    self._ui.progress_MP:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MP:setRenderTexture(self._ui.progress_MP:getBaseTexture())
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.progress_MPLater, 169, 427, 325, 451)
    self._ui.progress_MPLater:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.progress_MPLater:setRenderTexture(self._ui.progress_MPLater:getBaseTexture())
    self._ui.progress_MP:AddEffect("UI_Mp_P_Bar01A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_P_Bar01B", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_P_Bar02A", true, 0, 0)
    self._ui.progress_MP:AddEffect("UI_Mp_P_Bar02B", true, 0, 0)
    self._ui.progress_MP:AddEffect("fUI_Mp_P_Bar01", true, 0, 0)
  end
end
function MainStatus:updateAll()
  self:updateLV()
  self:updateEXP()
  self:updateHP()
  self:updateMP()
  self:updateRage()
  self:updateResource()
  self:updateSkillPoint()
  self:updateContribute()
  self:updateEnergy()
  self:updatePvP()
end
function MainStatus:updateLV()
  local player = getSelfPlayer()
  if nil == player then
    return
  end
  self._ui.txt_LV:SetText(tostring(player:get():getLevel()))
  if self._lastLevel < player:get():getLevel() and 0 ~= self._lastLevel then
    self._ui.txt_LV:EraseAllEffect()
    self._ui.txt_LV:AddEffect("fUI_NewSkill01", false, 0, 0)
    self._ui.txt_LV:AddEffect("UI_NewSkill01", false, 0, 0)
  end
  local inMyLevel = player:get():getLevel()
  if 16 == inMyLevel and false == self._isSixteenLV then
    self._isSixteenLV = true
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "PANEL_SELFPLAYEREXPGAGE_LEVEL_WEATHERCHECK"))
  end
  self._lastLevel = player:get():getLevel()
end
function MainStatus:updateEXP()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local player = selfPlayer:get()
  local s64_needExp = player:getNeedExp_s64()
  local s64_exp = player:getExp_s64()
  local _const = Defines.s64_const
  local rate = 0
  local rateDisplay = 0
  if s64_needExp > _const.s64_10000 then
    rate = Int64toInt32(s64_exp * Defines.s64_const.s64_1000 * Defines.s64_const.s64_100 / s64_needExp)
  elseif _const.s64_0 ~= s64_needExp then
    rate = Int64toInt32(s64_exp * Defines.s64_const.s64_1000 * Defines.s64_const.s64_100 / s64_needExp)
  end
  local real_rate = rate / 1000
  if 100 == real_rate then
    rateDisplay = "100.000%"
  elseif 0 == real_rate then
    rateDisplay = "0.000%"
  elseif real_rate == real_rate - real_rate % 1 then
    rateDisplay = real_rate .. ".000%"
  elseif real_rate == real_rate - real_rate % 0.1 then
    rateDisplay = real_rate .. "00%"
  elseif real_rate == real_rate - real_rate % 0.01 then
    rateDisplay = real_rate .. "0%"
  else
    rateDisplay = real_rate .. "%"
  end
  self._ui.progress_Exp:SetProgressRate(real_rate)
  self._ui.stc_ExpBG:AddEffect("UI_Exp_Bar01", false, 3.1, -1)
  self._ui.txt_EXP:ComputePos()
  self._ui.txt_EXP:SetText(string.format("%.3f", real_rate) .. "%")
  local MaxLevQuestInfo = questList_isClearQuest(677, 1)
  if 49 == player:getLevel() and rate >= 99 and false == MaxLevQuestInfo then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_50UP"))
  end
end
function MainStatus:updateHP()
  local player = getSelfPlayer():get()
  local regionKeyRaw = getSelfPlayer():getRegionKeyRaw()
  local regionWrapper = getRegionInfoWrapper(regionKeyRaw)
  local isArenaZone = regionWrapper:get():isArenaZone()
  if nil == player then
    return
  end
  local hp = math.floor(player:getHp())
  local maxHp = math.floor(player:getMaxHp())
  local percentHp = math.floor(hp / maxHp * 100)
  self._percentHP = percentHp
  self:checkHpAlertPostEvent()
  if percentHp < 20 and hp < self._prevHP and self._prevHpAlertTime + 20 <= FGlobal_getLuaLoadTime() and not isArenaZone then
    local sendMsg = {
      main = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_HP_WARNING"),
      sub = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_HP_WARNING_SUB"),
      addMsg = ""
    }
    Proc_ShowMessage_Ack_For_RewardSelect(sendMsg, 3, 24)
    self._prevHpAlertTime = FGlobal_getLuaLoadTime()
  end
  local effectSizeX = 185
  local effectPosX = 0
  local baseX = self._ui.stc_HPBG:GetSizeX()
  if 0 ~= maxHp and hp ~= self._prevHP or maxHp ~= self._prevMaxHP then
    self._ui.progress_HP:SetProgressRate(hp / maxHp * 100)
    self._ui.progress_HPLater:SetProgressRate(hp / maxHp * 100)
    self._prevHP = hp
    self._prevMaxHP = maxHp
    self:checkHpAlert(hp, maxHp, false)
  end
  self._ui.hpValue:SetText(hp .. " / " .. maxHp)
end
function MainStatus:checkHpAlertPostEvent()
  if Defines.UIMode.eUIMode_Default ~= GetUIMode() then
    return
  end
  if self._alertHpValue < self._percentHP then
    self._ui.stc_HPAlert:SetShow(false)
    _dangerPanel:SetShow(false)
  else
    self._ui.stc_HPAlert:SetShow(true)
    _dangerPanel:SetShow(true)
    _dangerPanel:SetPosX(0)
    self._ui.stc_HPAlert:SetSize(getScreenSizeX(), getScreenSizeY())
  end
end
function MainStatus:checkHpAlert(hp, maxHp, isLevelUp)
  local isUpdate = Defines.UIMode.eUIMode_Default == GetUIMode()
  if false == isUpdate then
    self._ui.stc_HPAlert:SetShow(false)
    return
  end
  if false == isLevelUp then
    return
  end
  local totalHp = hp / maxHp * 100
  if totalHp >= 40 and false == self._strongMonsterAlert then
    _dangerPanel:SetShow(false, false)
    self._ui.stc_HPAlert:SetAlpha(0)
  end
  if totalHp <= 39 and totalHp >= 20 then
    if false == _dangerPanel:GetShow() then
      _dangerPanel:SetShow(true, false)
      self._ui.stc_HPAlert:SetAlpha(1)
    end
    if false == self._ui.stc_HPAlert:GetShow() then
      self._ui.stc_HPAlert:SetShow(true)
    end
    self._ui.stc_HPAlert:SetVertexAniRun("Ani_Color_Danger0", true)
  end
  if totalHp <= 19 and totalHp >= 0 then
    if false == _dangerPanel:GetShow() then
      _dangerPanel:SetShow(true, false)
      self._ui.stc_HPAlert:SetAlpha(1)
    end
    if false == self._ui.stc_HPAlert:GetShow() then
      self._ui.stc_HPAlert:SetShow(true)
    end
    self._ui.stc_HPAlert:SetVertexAniRun("Ani_Color_Danger1", true)
  end
end
function MainStatus:updateMP()
  local player = getSelfPlayer():get()
  local mp = player:getMp()
  local maxMp = player:getMaxMp()
  local effectSizeX = 185
  local effectPosX = 0
  if 0 ~= maxMp and (mp ~= self._prevMP or maxMp ~= self._prevMaxMP) then
    self._ui.progress_MP:SetProgressRate(mp / maxMp * 100)
    self._ui.progress_MPLater:SetProgressRate(mp / maxMp * 100)
    self._prevMP = mp
    self._prevMaxMP = maxMp
    effectPosX = self._ui.stc_MPBG:GetSizeX() * mp / maxMp - effectSizeX
  end
  self._ui.mpValue:SetText(mp .. " / " .. maxMp)
  FGlobal_SettingMpBarTemp()
end
function MainStatus:updateRage()
  local selfPlayer = getSelfPlayer()
  local adrenallin = selfPlayer:getAdrenalin()
  adrenallin = adrenallin / 10
  adrenallin = math.floor(adrenallin) / 10
  adrenallin = string.format("%.1f", adrenallin)
  self._ui.progress_Rage:SetProgressRate(adrenallin)
  self._ui.txt_RageValue:SetText(tostring(adrenallin) .. " %")
  self._ui.txt_RageValue:useGlowFont(true, "BaseFont_Glow", 4284572001)
  local isAdrenalin = selfPlayer:isEnableAdrenalin()
  self._ui.stc_RageBG:SetShow(isAdrenalin and not isRecordMode)
  self._ui.progress_Rage:SetShow(isAdrenalin and not isRecordMode)
  self._ui.txt_RageValue:SetShow(isAdrenalin and not isRecordMode)
  local isUseRage = getSelfPlayer():isUseableBlackSpritSkill()
  self._ui.stc_RageLock:SetShow(isAdrenalin and not isUseRage)
end
function MainStatus:updateResource()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  self._ui.stc_ClassType0:SetShow(false)
  self._ui.stc_ClassType1:SetShow(false)
  local classType = selfPlayer:getClassType()
  if CppEnums.ClassType.ClassType_Sorcerer == classType then
    self._ui.stc_ClassType0:SetShow(true)
    local resourceCount = selfPlayer:get():getSubResourcePoint()
    local showCount = math.floor(resourceCount / 10)
    for idx = 1, self._maxType0Count do
      self._resourceType0[idx].element:SetShow(idx <= showCount)
      if not self._classResourceShowCheck[idx] and idx <= showCount then
        self._resourceType0[idx].element:EraseAllEffect()
        self._resourceType0[idx].element:AddEffect("UI_Button_Hide", false, 0, 0)
      end
      self._classResourceShowCheck[idx] = idx <= showCount
    end
    self._ui.txt_ResourceCount:SetText(resourceCount)
    self._ui.txt_ResourceCount:useGlowFont(true, "BaseFont_12_Glow", 4278190080)
    self._ui.txt_ResourceCount:SetShow(true)
  elseif CppEnums.ClassType.ClassType_Combattant == classType or CppEnums.ClassType.ClassType_CombattantWomen == classType then
    self._ui.stc_ClassType1:SetShow(true)
    local resourceCount = selfPlayer:get():getSubResourcePoint()
    local showCount = math.floor(resourceCount / 10)
    for idx = 1, self._maxType1Count do
      self._resourceType1[idx].element:SetShow(idx <= showCount)
      if not self._classResourceShowCheck[idx] and idx <= showCount then
        self._resourceType1[idx].element:EraseAllEffect()
        self._resourceType1[idx].element:AddEffect("fUI_PCM_Energy_01A", false, 0, 0)
      end
      self._classResourceShowCheck[idx] = idx <= showCount
    end
  end
end
function MainStatus:updateSkillPoint()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local player = selfPlayer:get()
  local skillExpRate = 0
  local skillPointNeedExp
  skillPointNeedExp = player:getSkillPointNeedExperience()
  if 0 ~= skillPointNeedExp then
    skillExpRate = player:getSkillPointExperience() / skillPointNeedExp
  end
  if self._lastSkillPoint < player:getRemainSkillPoint() and -1 ~= self._lastSkillPoint then
    audioPostEvent_SystemUi(3, 7)
    ToClient_getGameUIManagerWrapper():setLuaCacheDataListBool(CppEnums.GlobalUIOptionType.SkillIconCheck, true, CppEnums.VariableStorageType.eVariableStorageType_User)
    self._ui.txt_SkillPoint:EraseAllEffect()
    self._ui.txt_SkillPoint:AddEffect("UI_LevelUP_Skill", false, -28, 1)
    self._ui.txt_SkillPoint:AddEffect("fUI_LevelUP_Skill02", false, -28, 1)
  end
  local skillPoint = tostring(player:getRemainSkillPoint())
  skillExpRate = skillExpRate * 100
  local skillPointExp = string.format("%.1f", skillExpRate)
  self._ui.txt_SkillPoint:SetText(skillPoint .. " (" .. skillPointExp .. "%)")
  self._ui.txt_SkillPoint:SetFontColor(4294899677)
  self._ui.txt_SkillPoint:useGlowFont(true, "BaseFont_Glow", 4284572001)
  self._lastSkillPoint = player:getRemainSkillPoint()
  if false == _ContentsGroup_RenewUI_Skill then
    enableSkill_UpdateData()
  end
end
function MainStatus:updateContribute()
  local territoryKeyRaw = ToClient_getDefaultTerritoryKey()
  local explorePoint = ToClient_getExplorePointByTerritoryRaw(territoryKeyRaw)
  if nil == explorePoint then
    self._ui.txt_ContributePoint:SetText("")
    return
  end
  local s64_exploreRequireExp = getRequireExperienceToExplorePointByTerritory_s64(territoryKeyRaw)
  local cont_expRate = Int64toInt32(explorePoint:getExperience_s64()) / Int64toInt32(getRequireExplorationExperience_s64())
  local nowRemainExpPoint = tostring(explorePoint:getRemainedPoint())
  local nowExpPoint = tostring(explorePoint:getAquiredPoint())
  if true == isGameServiceTypeDev() then
    self._ui.txt_ContributePoint:SetText(tostring(explorePoint:getRemainedPoint()) .. " / " .. tostring(explorePoint:getAquiredPoint()) .. " (" .. Int64toInt32(explorePoint:getExperience_s64()) .. " / " .. Int64toInt32(getRequireExplorationExperience_s64()) .. ")")
  else
    self._ui.txt_ContributePoint:SetText(tostring(explorePoint:getRemainedPoint()) .. " / " .. tostring(explorePoint:getAquiredPoint()))
  end
  if self._isFirstExplore == false then
    self._lastRemainExplorePoint = 0
    self._lastExplorePoint = 0
    self._isFirstExplore = true
    nowRemainExpPoint = 0
    nowExpPoint = 0
  end
  if self._lastContRate ~= cont_expRate then
    self._ui.txt_ContributePoint:SetNotAbleMasking(true)
    self._ui.txt_ContributePoint:EraseAllEffect()
    self._ui.txt_ContributePoint:AddEffect("fUI_Repair01", false, 0, 0)
  end
  if self._lastRemainExplorePoint ~= nowRemainExpPoint and self._isFirstExplore == true then
    audioPostEvent_SystemUi(3, 7)
    self._ui.txt_ContributePoint:EraseAllEffect()
    self._ui.txt_ContributePoint:AddEffect("UI_LevelUP_Skill", false, 0, 1)
  end
  if self._lastExplorePoint ~= nowExpPoint and self._isFirstExplore == true then
    audioPostEvent_SystemUi(3, 7)
    self._ui.txt_ContributePoint:EraseAllEffect()
    self._ui.txt_ContributePoint:AddEffect("UI_LevelUP_Skill", false, 0, 0)
  end
  self._ui.txt_ContributePoint:SetFontColor(4294899677)
  self._ui.txt_ContributePoint:useGlowFont(true, "BaseFont_Glow", 4284572001)
  self._lastContRate = cont_expRate
  self._lastRemainExplorePoint = tostring(explorePoint:getRemainedPoint())
  self._lastExplorePoint = tostring(explorePoint:getAquiredPoint())
end
function MainStatus:updateEnergy()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local Wp = selfPlayer:getWp()
  local maxWp = selfPlayer:getMaxWp()
  local wpSetProgress = 0
  if 0 ~= maxWp then
    wpSetProgress = Wp / maxWp * 100
  end
  if Wp > self._lastWP and -1 ~= self._lastWP then
    audioPostEvent_SystemUi(3, 13)
    self._ui.txt_EnergyPoint:EraseAllEffect()
    self._ui.txt_EnergyPoint:AddEffect("UI_LevelUP_Skill", false, -43, 1)
    self._ui.txt_EnergyPoint:AddEffect("fUI_LevelUP_Skill02", false, -43, 1)
  end
  self._ui.txt_EnergyPoint:SetText(tostring(Wp) .. " / " .. maxWp)
  self._ui.txt_EnergyPoint:SetEnableArea(0, 0, self._ui.txt_EnergyPoint:GetTextSizeX(), self._ui.txt_EnergyPoint:GetSizeY())
  self._ui.txt_EnergyPoint:SetFontColor(4294899677)
  self._ui.txt_EnergyPoint:useGlowFont(true, "BaseFont_Glow", 4284572001)
  self._lastWP = Wp
end
function MainStatus:updatePvP()
  if false == isPvpEnable() then
    self._ui.btn_PVP:SetShow(false)
    return
  end
  self._ui.btn_PVP:SetShow(true)
  if true == getPvPMode() and false == self._ui.btn_PVP:IsCheck() then
    self._ui.btn_PVP:EraseAllEffect()
    self._ui.btn_PVP:AddEffect("fUI_SkillButton02", true, 0, 0)
    self._ui.btn_PVP:AddEffect("fUI_PvPButtonLoop", true, 0, 0)
    self._ui.btn_PVP:SetCheck(true)
    self._isPvPOn = true
  elseif false == getPvPMode() and true == self._ui.btn_PVP:IsCheck() then
    self._ui.btn_PVP:EraseAllEffect()
    self._ui.btn_PVP:SetCheck(false)
    self._isPvPOn = false
  end
end
function MainStatus:setPVP(where, actorKeyRaw)
  if nil ~= actorKeyRaw then
    local actorProxyWrapper = getActor(actorKeyRaw)
    if nil == actorProxyWrapper then
      return
    end
    if false == actorProxyWrapper:get():isSelfPlayer() then
      return
    end
  end
  if false == ToClient_getGameUIManagerWrapper():getLuaCacheDataListBool(CppEnums.GlobalUIOptionType.SwapRemasterUISetting) then
    return
  end
  if true == isPvpEnable() then
    self:showPVPBtn(true)
    if true == getPvPMode() then
      audioPostEvent_SystemUi(0, 9)
      audioPostEvent_SystemUi(9, 0)
      self._ui.btn_PVP:SetCheck(true)
      self._ui.btn_PVP:EraseAllEffect()
      self._ui.btn_PVP:AddEffect("fUI_SkillButton02", true, 0, 0)
      self._ui.btn_PVP:AddEffect("fUI_PvPButtonLoop", true, 0, 0)
      if nil == where then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PVP_BUTTON_ON"))
      end
      self._isPvPOn = true
    elseif true == self._isPvPOn then
      audioPostEvent_SystemUi(0, 11)
      self._ui.btn_PVP:SetCheck(false)
      self._ui.btn_PVP:EraseAllEffect()
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PVP_BUTTON_OFF"))
      self._isPvPOn = false
    else
      self._ui.btn_PVP:SetCheck(false)
    end
  else
    self:showPVPBtn(false)
  end
end
function MainStatus:showPVPBtn(isShow)
  if false == ToClient_isAdultUser() then
    self._ui.btn_PVP:SetShow(false)
    return
  end
  if self._ui.btn_PVP:GetShow() == isShow then
    return
  end
  self._ui.btn_PVP:SetShow(isShow)
end
function MainStatus:blackSpiritLock()
  if false == ToClient_getGameUIManagerWrapper():getLuaCacheDataListBool(CppEnums.GlobalUIOptionType.SwapRemasterUISetting) then
    return
  end
  if false == getSelfPlayer():isEnableAdrenalin() then
    self._ui.stc_RageLock:SetShow(false)
  else
    local isUseRage = getSelfPlayer():isUseableBlackSpritSkill()
    if true == isUseRage then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_USEABLE_BLACKSPRITSKILL"), 5)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NOTUSEABLE_BLACKSPRITSKILL"), 5)
    end
    self._ui.stc_RageLock:SetShow(not isUseRage)
  end
end
function PaGlobalFunc_MainStatus_UpdateAll()
  local self = MainStatus
  self:updateAll()
end
function PaGlobalFunc_MainStatus_UpdateLV()
  local self = MainStatus
  self:updateLV()
  self:checkHpAlertPostEvent()
end
function PaGlobalFunc_MainStatus_CheckHpAlertPostEvent()
  local self = MainStatus
  self:checkHpAlertPostEvent()
end
function PaGlobalFunc_MainStatus_UpdateEXP()
  local self = MainStatus
  self:updateEXP()
  self:updateSkillPoint()
end
function PaGlobalFunc_MainStatus_UpdateHP()
  local self = MainStatus
  self:updateHP()
end
function PaGlobalFunc_MainStatus_UpdateMP()
  local self = MainStatus
  self:updateMP()
end
function PaGlobalFunc_MainStatus_UpdateRage()
  local self = MainStatus
  self:updateRage()
end
function PaGlobalFunc_MainStatus_UpdateResource()
  local self = MainStatus
  self:updateResource()
end
function PaGlobalFunc_MainStatus_UpdateContribute()
  local self = MainStatus
  self:updateContribute()
end
function PaGlobalFunc_MainStatus_UpdateEnergy()
  local self = MainStatus
  self:updateEnergy()
end
function PaGlobalFunc_MainStatus_PVPModeChange(actorKeyRaw)
  local self = MainStatus
  if nil ~= actorKeyRaw then
    self:setPVP(nil, actorKeyRaw)
  end
end
function PaGlobalFunc_MainStatus_PVPAbleChange(actorKeyRaw)
  local self = MainStatus
  local selfWrapper = getSelfPlayer()
  if nil == selfWrapper then
    return
  end
  if selfWrapper:getActorKey() == actorKeyRaw then
    self:setPVP(selfWrapper)
  end
end
function PaGlobalFunc_MainStatus_Init()
  local self = MainStatus
  self:init()
end
function PaGlobalFunc_MainStatus_DangerAlertShow(isShow)
  local self = MainStatus
  if false == isShow then
    _dangerPanel:SetShow(false, false)
    self._strongMonsterAlert = false
    return
  end
  self._strongMonsterAlert = true
  if true ~= _dangerPanel:GetShow() then
    _dangerPanel:SetShow(true, false)
    self._ui.stc_HPAlert:SetAlpha(1)
  end
  if false == self._ui.stc_HPAlert:GetShow() then
    self._ui.stc_HPAlert:SetShow(true)
  end
  self._ui.stc_HPAlert:SetVertexAniRun("Ani_Color_Danger1", true)
end
function PaGlobalFunc_MainStatus_GetPosY()
  return _panel:GetPosY()
end
function PaGlobalFunc_MainStatus_GetPosX()
  return _panel:GetPosX()
end
function PaGlobalFunc_MainStatus_GetSizeY()
  return _panel:GetSizeY()
end
function PaGlobalFunc_MainStatus_GetSizeX()
  return _panel:GetSizeX()
end
function InputMO_MainStatus_TooltipShow(isShow, tooltipType)
  local self = MainStatus
  local name = ""
  local desc = ""
  local uiControl
  if tooltipType == self._statusTooltipType.blackSpirit then
    local count = ToClient_GetApRegenAmount()
    local countString = string.format("%.2f", count / 100)
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ADRENALLIN_TOOLTIP_TITLE")
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ADRENALLIN_TOOLTIP_DESC", "count", tostring(countString))
    uiControl = self._ui.progress_Rage
  elseif tooltipType == self._statusTooltipType.resource0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_PHANTOMCOUNT_MESSAGE")
    uiControl = self._ui.stc_ClassType0
  elseif tooltipType == self._statusTooltipType.resource1 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_FIGHTER")
    uiControl = self._ui.stc_ClassType1
  elseif tooltipType == self._statusTooltipType.skill then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_MAINSTATUS_SKILLPOINTICON_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_MAINSTATUS_SKILLPOINTICON_DESC")
    uiControl = self._ui.txt_SkillPoint
  elseif tooltipType == self._statusTooltipType.energy then
    name = PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_MENTAL")
    desc = PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_DESC_WP")
    uiControl = self._ui.txt_EnergyPoint
  elseif tooltipType == self._statusTooltipType.contribute then
    local _contributeBubbleText = ""
    for i = 0, 2 do
      if 0 < ToClient_UsedExplorePoint(i) then
        if "" == _contributeBubbleText then
          _contributeBubbleText = self._contributeUsePoint[i] .. " " .. ToClient_UsedExplorePoint(i)
        else
          _contributeBubbleText = _contributeBubbleText .. " | " .. self._contributeUsePoint[i] .. " " .. ToClient_UsedExplorePoint(i)
        end
      end
    end
    if "" == _contributeBubbleText then
      _contributeBubbleText = PAGetString(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_4")
    else
      _contributeBubbleText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_5", "_contributeBubbleText", _contributeBubbleText)
    end
    name = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_CONTRIBUTIVENESS")
    desc = PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_DESC_EXPLORE") .. "\n" .. _contributeBubbleText
    uiControl = self._ui.txt_ContributePoint
  elseif tooltipType == self._statusTooltipType.pvp then
    name = PAGetString(Defines.StringSheet_RESOURCE, "PVP_TXT_ACTIVATE")
    desc = ""
    uiControl = self._ui.btn_PVP
  end
  if true == isShow then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end
function FromClient_MainStatus_CheckHpAlertPostEvent(prevRenderModeList, nextRenderModeList)
  local self = MainStatus
  local currentRenderMode = {
    Defines.RenderMode.eRenderMode_Default,
    Defines.RenderMode.eRenderMode_WorldMap
  }
  if CheckRenderModebyGameMode(nextRenderModeList) or CheckRenderMode(prevRenderModeList, currentRenderMode) then
    self:updateHP()
    self:updateMP()
  end
  PaGlobalFunc_MainStatus_SetShow(true)
end
function FromClient_MainStatus_OnResize()
  local self = MainStatus
  _dangerPanel:SetPosX(0)
  self._ui.stc_HPAlert:SetSize(getScreenSizeX(), getScreenSizeY())
  _panel:ComputePos()
  FGlobal_PanelRepostionbyScreenOut(_panel)
  self:addStatusEffect()
  self:setMPBarTexture()
  PaGlobalFunc_MainStatus_SetShow(true)
end
function PaGlobalFunc_MainStatus_SetShow(isShow, isAni)
  local self = MainStatus
  local isGetUIInfo = false
  if true == PaGlobalFunc_IsRemasterUIOption() and isShow then
    isGetUIInfo = true
  end
  if true == isShow then
    if 0 < ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_MainStatusRemaster, 0, CppEnums.PanelSaveType.PanelSaveType_IsShow) then
      isGetUIInfo = true
    elseif ToClient_GetUiInfo(CppEnums.PAGameUIType.PAGameUIPanel_MainStatusRemaster, 0, CppEnums.PanelSaveType.PanelSaveType_IsShow) > -1 then
      isGetUIInfo = false
    else
      isGetUIInfo = true
    end
  end
  if nil == isAni then
    _panel:SetShow(isGetUIInfo)
  else
    _panel:SetShow(isGetUIInfo, isAni)
  end
  self:updateAll()
end
function FromClient_MainStatus_BlackSpiritLock()
  local self = MainStatus
  self:blackSpiritLock()
end
function PaGlobalFunc_MainStatus_ImmediatelyResurrection(resurrFunc)
  local self = MainStatus
  self._prevHp = resurrFunc
end
function PaGlobalFunc_MainStatus_CharacterInfoWindowUpdate()
  local self = MainStatus
  self:updateHP()
  self:updateMP()
end
function PaGlobalFunc_MainStatus_ShowPVPButton(isShow)
  local self = MainStatus
  self:showPVPBtn(isShow)
end
function PaGlobalFunc_MainStatus_ShowFromTutorial()
  _panel:SetShow(true)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_MainStatus_Init")
