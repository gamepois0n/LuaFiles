-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\mainstatus\console\panel_widget_mainstatus_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_SelfPlayerExpGage
_panel:SetShow(true)
local MainStatusInfo = {
_ui = {stc_expBG = (UI.getChildControl)(_panel, "Static_ExpBG"), txt_lv = nil, txt_exp = nil, cirProgress_exp = (UI.getChildControl)(_panel, "CircularProgress_EXP"), chk_pvp = (UI.getChildControl)(_panel, "CheckButton_PvP"), stc_hpBG = (UI.getChildControl)(_panel, "Static_HPBG"), progress_HP = (UI.getChildControl)(_panel, "Progress2_HP"), stc_hpBG = (UI.getChildControl)(_panel, "Static_MPBG"), progress_MP = (UI.getChildControl)(_panel, "Progress2_MP"), stc_hpBG = (UI.getChildControl)(_panel, "Static_RageBG"), progress_rage = (UI.getChildControl)(_panel, "Progress2_Rage"), stc_resourceType0 = (UI.getChildControl)(_panel, "Static_ClassResourceType0"), 
stc_resource0Elements = {}
, txt_resourceNum = nil, stc_resourceType1 = (UI.getChildControl)(_panel, "Static_ClassResourceType1"), 
stc_resource1Elements = {}
, txt_skillPoint = (UI.getChildControl)(_panel, "StaticText_SkillPoint"), txt_energyPoint = (UI.getChildControl)(_panel, "StaticText_EnergyPoint"), txt_contributePoint = (UI.getChildControl)(_panel, "StaticText_ContributePoint")}
, _resource0ElementCount = 3, _resource1ElementCount = 3, _resourceCount = 0, _lastEXP = -1, _lastSkillPoint = -1, _lastSkillExp = 0, _lastWP = -1, _lastContributePoint = 0, _lastContRate = 0, _lastRemainExplorePoint = 0, _lastExplorePoint = 0, _isFirstExplore = false, _prevHpAlertTime = 0, _prevHP = -1, _prevHp = 0, _prevMaxHP = -1, _prevMP = -1, _prevMaxMP = -1, _simpleUIFadeRate = 1, _percentHP = 0, _alertHpValue = 40, _hpMsgValue = 20, _msgSendSec = 20, _simpleUIFadeRate = 1, _burnEffectStartTime = 0, _burnEffectDuringTime = 10, _burnEffectKey = 0, _isLoad = false, _burnEffectOn = false}
local _mpBarUV = {
[(CppEnums.ClassType).ClassType_Warrior] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_Giant] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_Ranger] = {1, 307, 288, 328}
, 
[(CppEnums.ClassType).ClassType_Sorcerer] = {1, 285, 288, 306}
, 
[(CppEnums.ClassType).ClassType_WizardWomen] = {1, 285, 288, 306}
, 
[(CppEnums.ClassType).ClassType_Wizard] = {1, 285, 288, 306}
, 
[(CppEnums.ClassType).ClassType_Valkyrie] = {1, 373, 288, 394}
, 
[(CppEnums.ClassType).ClassType_Tamer] = {1, 285, 288, 306}
, 
[(CppEnums.ClassType).ClassType_Lahn] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_Combattant] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_CombattantWomen] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_BladeMaster] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_BladeMasterWomen] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_NinjaWomen] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_Kunoichi] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_NinjaMan] = {1, 329, 288, 350}
, 
[(CppEnums.ClassType).ClassType_DarkElf] = {1, 351, 288, 372}
}
FromClient_luaLoadComplete_MainStatusInfo_Init = function()
  -- function num : 0_0 , upvalues : MainStatusInfo
  MainStatusInfo:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_MainStatusInfo_Init")
MainStatusInfo.initialize = function(self)
  -- function num : 0_1 , upvalues : _mpBarUV
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_lv = (UI.getChildControl)((self._ui).stc_expBG, "StaticText_Lv")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_exp = (UI.getChildControl)((self._ui).stc_expBG, "StaticText_EXP")
  for ii = 1, self._resource0ElementCount do
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).stc_resource0Elements)[ii] = (UI.getChildControl)((self._ui).stc_resourceType0, "Static_Element" .. ii)
  end
  for ii = 1, self._resource1ElementCount do
    -- DECOMPILER ERROR at PC46: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).stc_resource1Elements)[ii] = (UI.getChildControl)((self._ui).stc_resourceType1, "Static_Element" .. ii)
  end
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_resourceNum = (UI.getChildControl)((self._ui).stc_resourceType0, "StaticText_Count")
  self:registEventHandler()
  self:registMessageHandler()
  local playerWrapper = getSelfPlayer()
  local classType = playerWrapper:getClassType()
  local x1, y1, x2, y2 = setTextureUV_Func((self._ui).progress_MP, (_mpBarUV[classType])[1], (_mpBarUV[classType])[2], (_mpBarUV[classType])[3], (_mpBarUV[classType])[4])
  ;
  (((self._ui).progress_MP):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  ((self._ui).progress_MP):setRenderTexture(((self._ui).progress_MP):getBaseTexture())
  Panel_UIMain:SetShow(false)
end

MainStatusInfo.registEventHandler = function(self)
  -- function num : 0_2
  ((self._ui).chk_pvp):addInputEvent("Mouse_LUp", "requestTogglePvP()")
  ;
  ((self._ui).stc_resourceType0):addInputEvent("Mouse_On", "PhantomCount_HelpComment(true)")
  ;
  ((self._ui).stc_resourceType0):addInputEvent("Mouse_Out", "PhantomCount_HelpComment(false)")
  ;
  ((self._ui).stc_resourceType1):addInputEvent("Mouse_On", "FighterIcon_HelpComment(true)")
  ;
  ((self._ui).stc_resourceType1):addInputEvent("Mouse_Out", "FighterIcon_HelpComment(false)")
end

MainStatusInfo.registMessageHandler = function(self)
  -- function num : 0_3
  registerEvent("EventCharacterInfoUpdate", "PaGlobalFunc_MainStatusInfo_Update")
  registerEvent("FromClient_SelfPlayerHpChanged", "PaGlobalFunc_MainStatusInfo_UpdateHPAndMP")
  registerEvent("FromClient_SelfPlayerMpChanged", "PaGlobalFunc_MainStatusInfo_UpdateHPAndMP")
  registerEvent("FromClient_SelfPlayerMpChanged", "PaGlobalFunc_MainStatusInfo_UpdateHPAndMP")
  registerEvent("subResourceChanged", "FromClient_MainStatusInfo_UpdateClassResource")
  registerEvent("EventSelfPlayerLevelUp", "FromClient_MainStatusInfo_UpdateLV")
  registerEvent("FromClient_SelfPlayerCombatSkillPointChanged", "PaGlobalFunc_MainStatusInfo_UpdateEXP")
  registerEvent("FromClient_WpChanged", "PaGlobalFunc_MainStatusInfo_UpdateEnergy")
  registerEvent("FromClient_UpdateExplorePoint", "PaGlobalFunc_MainStatusInfo_UpdateContribute")
  registerEvent("FromClient_UpdateAdrenalin", "FromClient_MainStatusInfo_UpdateRage")
  registerEvent("FromClient_ChangeAdrenalinMode", "FromClient_MainStatusInfo_UpdateRage")
  registerEvent("FromClient_UseableBlackSpritSkill", "FromClient_MainStatusInfo_ShowUseableBlackSpirit")
  registerEvent("onScreenResize", "FromClient_MainStatusInfo_OnScreenResize")
  registerEvent("FromClient_DamageByOtherPlayer", "FromClient_MainStatusInfo_DamageByOtherPlayer")
  registerEvent("FromClient_RenderModeChangeState", "FromClient_MainStatusInfo_checkHpAlertPostEvent")
  registerEvent("EventPvPModeChanged", "FromClient_MainStatusInfo_changeMode")
  registerEvent("EventPlayerPvPAbleChanged", "FromClient_MainStatusInfo_PVPEnabled")
end

PaGlobalFunc_MainStatusInfo_Open = function()
  -- function num : 0_4 , upvalues : MainStatusInfo
  MainStatusInfo:open()
end

MainStatusInfo.open = function(self)
  -- function num : 0_5 , upvalues : _panel, MainStatusInfo
  _panel:SetShow(true)
  MainStatusInfo:update()
end

PaGlobalFunc_MainStatusInfo_Close = function()
  -- function num : 0_6 , upvalues : MainStatusInfo
  MainStatusInfo:close()
end

MainStatusInfo.close = function(self)
  -- function num : 0_7 , upvalues : _panel
  _panel:SetShow(false)
end

PaGlobalFunc_MainStatusInfo_Update = function()
  -- function num : 0_8 , upvalues : MainStatusInfo
  MainStatusInfo:update()
end

MainStatusInfo.update = function(self)
  -- function num : 0_9
  self:updateLV()
  self:updateExp()
  self:updateSkillPoint()
  self:updateEnergy()
  self:updateContribute()
  self:updateRage()
  self:updateHPAndMP()
  self:updateClassResource()
end

FromClient_MainStatusInfo_UpdateLV = function()
  -- function num : 0_10 , upvalues : MainStatusInfo
  MainStatusInfo:updateLV()
  MainStatusInfo:CheckHpAlertPostEvent()
end

local _lastLevel = 0
MainStatusInfo.updateLV = function(self)
  -- function num : 0_11 , upvalues : _lastLevel
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  ;
  ((self._ui).txt_lv):SetText(tostring((player:get()):getLevel()))
  if _lastLevel < (player:get()):getLevel() and _lastLevel ~= 0 then
    ((self._ui).txt_lv):EraseAllEffect()
    ;
    ((self._ui).txt_lv):AddEffect("fUI_NewSkill01", false, 0, 0)
    ;
    ((self._ui).txt_lv):AddEffect("UI_NewSkill01", false, 0, 0)
  end
  self:characterLevelCheckForWeather()
  _lastLevel = (player:get()):getLevel()
end

local isSixteen = false
MainStatusInfo.characterLevelCheckForWeather = function(self)
  -- function num : 0_12 , upvalues : isSixteen
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local inMyLevel = (player:get()):getLevel()
  if inMyLevel == 16 and not isSixteen then
    isSixteen = true
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "PANEL_SELFPLAYEREXPGAGE_LEVEL_WEATHERCHECK"))
  end
end

PaGlobalFunc_MainStatusInfo_UpdateEXP = function()
  -- function num : 0_13 , upvalues : MainStatusInfo
  MainStatusInfo:updateExp()
  MainStatusInfo:updateSkillPoint()
end

MainStatusInfo.updateExp = function(self)
  -- function num : 0_14
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local player = selfPlayer:get()
  local s64_needExp = player:getNeedExp_s64()
  local s64_exp = player:getExp_s64()
  local _const = Defines.s64_const
  local rate = 0
  local rateDisplay = 0
  if _const.s64_10000 < s64_needExp then
    rate = Int64toInt32(s64_exp * (Defines.s64_const).s64_1000 * (Defines.s64_const).s64_100 / s64_needExp)
  else
    if _const.s64_0 ~= s64_needExp then
      rate = Int64toInt32(s64_exp * (Defines.s64_const).s64_1000 * (Defines.s64_const).s64_100 / s64_needExp)
    end
  end
  local real_rate = rate / 1000
  if real_rate == 100 then
    rateDisplay = "100.000%"
  else
    if real_rate == 0 then
      rateDisplay = "0.000%"
    else
      if real_rate == real_rate - real_rate % 1 then
        rateDisplay = real_rate .. ".000%"
      else
        if real_rate == real_rate - real_rate % 0.1 then
          rateDisplay = real_rate .. "00%"
        else
          if real_rate == real_rate - real_rate % 0.01 then
            rateDisplay = real_rate .. "0%"
          else
            rateDisplay = real_rate .. "%"
          end
        end
      end
    end
  end
  ;
  ((self._ui).cirProgress_exp):SetProgressRate(real_rate)
  self._lastEXP = Int64toInt32(s64_exp)
  ;
  ((self._ui).txt_exp):ComputePos()
  ;
  ((self._ui).txt_exp):SetText((string.format)("%.3f", real_rate) .. "%")
  local MaxLevQuestInfo = questList_isClearQuest(677, 1)
  if player:getLevel() == 49 and rate >= 99 and not MaxLevQuestInfo then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_50UP"))
  end
  ;
  ((self._ui).txt_exp):SetFontColor(4294899677)
  ;
  ((self._ui).txt_exp):useGlowFont(true, "BaseFont_Glow", 4289951243)
end

MainStatusInfo.updateSkillPoint = function(self)
  -- function num : 0_15
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local player = (selfPlayer:get())
  local skillExpRate, skillPointNeedExp = nil, nil
  skillPointNeedExp = player:getSkillPointNeedExperience()
  if skillPointNeedExp ~= 0 then
    skillExpRate = player:getSkillPointExperience() / skillPointNeedExp
  else
    skillExpRate = 0
  end
  if self._lastSkillPoint < player:getRemainSkillPoint() and self._lastSkillPoint ~= -1 then
    audioPostEvent_SystemUi(3, 7)
    ;
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).SkillIconCheck, true, (CppEnums.VariableStorageType).eVariableStorageType_User)
    ;
    ((self._ui).txt_skillPoint):EraseAllEffect()
    ;
    ((self._ui).txt_skillPoint):AddEffect("UI_LevelUP_Skill", false, -28, 1)
    ;
    ((self._ui).txt_skillPoint):AddEffect("fUI_LevelUP_Skill02", false, -28, 1)
  end
  local skillPoint = tostring(player:getRemainSkillPoint())
  local _tempSkillPoint = skillExpRate * 100
  local skillPointExp = (string.format)("%.1f", _tempSkillPoint)
  ;
  ((self._ui).txt_skillPoint):SetText(skillPoint .. " (" .. skillPointExp .. "%)")
  self._lastSkillPoint = player:getRemainSkillPoint()
  self._lastSkillExp = skillExpRate
  ;
  ((self._ui).txt_skillPoint):SetFontColor(4294899677)
  if _ContentsGroup_RenewUI_Skill == false then
    enableSkill_UpdateData()
  end
end

PaGlobalFunc_MainStatusInfo_UpdateEnergy = function()
  -- function num : 0_16 , upvalues : MainStatusInfo
  MainStatusInfo:updateEnergy()
end

MainStatusInfo.updateEnergy = function(self)
  -- function num : 0_17
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local Wp = selfPlayer:getWp()
  local maxWp = selfPlayer:getMaxWp()
  local wpSetProgress = Wp / maxWp * 100
  if self._lastWP < Wp and self._lastWP ~= -1 then
    audioPostEvent_SystemUi(3, 13)
    ;
    ((self._ui).txt_energyPoint):EraseAllEffect()
    ;
    ((self._ui).txt_energyPoint):AddEffect("UI_LevelUP_Skill", false, -43, 1)
    ;
    ((self._ui).txt_energyPoint):AddEffect("fUI_LevelUP_Skill02", false, -43, 1)
  end
  ;
  ((self._ui).txt_energyPoint):SetText(tostring(Wp) .. " / " .. maxWp)
  ;
  ((self._ui).txt_energyPoint):SetEnableArea(0, 0, ((self._ui).txt_energyPoint):GetTextSizeX(), ((self._ui).txt_energyPoint):GetSizeY())
  ;
  ((self._ui).txt_energyPoint):SetFontColor(4294899677)
  self._lastWP = Wp
end

PaGlobalFunc_MainStatusInfo_UpdateContribute = function()
  -- function num : 0_18 , upvalues : MainStatusInfo
  MainStatusInfo:updateContribute()
end

MainStatusInfo.updateContribute = function(self)
  -- function num : 0_19
  local territoryKeyRaw = ToClient_getDefaultTerritoryKey()
  local explorePoint = ToClient_getExplorePointByTerritoryRaw(territoryKeyRaw)
  if explorePoint == nil then
    ((self._ui).txt_contributePoint):SetText("")
    return 
  end
  local s64_exploreRequireExp = getRequireExperienceToExplorePointByTerritory_s64(territoryKeyRaw)
  local cont_expRate = Int64toInt32(explorePoint:getExperience_s64()) / Int64toInt32(getRequireExplorationExperience_s64())
  local nowRemainExpPoint = tostring(explorePoint:getRemainedPoint())
  local nowExpPoint = tostring(explorePoint:getAquiredPoint())
  if false then
    ((self._ui).txt_contributePoint):SetText(tostring(explorePoint:getRemainedPoint()) .. " / " .. tostring(explorePoint:getAquiredPoint()) .. "      (" .. Int64toInt32(explorePoint:getExperience_s64()) .. " / " .. Int64toInt32(getRequireExplorationExperience_s64()) .. ")")
  else
    ;
    ((self._ui).txt_contributePoint):SetText(tostring(explorePoint:getRemainedPoint()) .. " / " .. tostring(explorePoint:getAquiredPoint()))
  end
  if self._isFirstExplore == false then
    self._lastRemainExplorePoint = 0
    self._lastExplorePoint = 0
    nowRemainExpPoint = 0
    nowExpPoint = 0
    self._isFirstExplore = true
  end
  if self._lastContRate ~= cont_expRate then
    ((self._ui).txt_contributePoint):SetNotAbleMasking(true)
    ;
    ((self._ui).txt_contributePoint):EraseAllEffect()
    ;
    ((self._ui).txt_contributePoint):AddEffect("fUI_Repair01", false, 0, 0)
  end
  if self._lastRemainExplorePoint ~= nowRemainExpPoint and self._isFirstExplore == true then
    audioPostEvent_SystemUi(3, 7)
    ;
    ((self._ui).txt_contributePoint):EraseAllEffect()
    ;
    ((self._ui).txt_contributePoint):AddEffect("UI_LevelUP_Skill", false, 0, 1)
  end
  if self._lastExplorePoint ~= nowExpPoint and self._isFirstExplore == true then
    audioPostEvent_SystemUi(3, 7)
    ;
    ((self._ui).txt_contributePoint):EraseAllEffect()
    ;
    ((self._ui).txt_contributePoint):AddEffect("UI_LevelUP_Skill", false, 0, 0)
  end
  ;
  ((self._ui).txt_contributePoint):SetFontColor(4294899677)
  self._lastContRate = cont_expRate
  self._lastRemainExplorePoint = tostring(explorePoint:getRemainedPoint())
  self._lastExplorePoint = tostring(explorePoint:getAquiredPoint())
end

MainStatusInfo.updateRage = function(self)
  -- function num : 0_20
  local selfPlayer = getSelfPlayer()
  local adrenallin = selfPlayer:getAdrenalin()
  ;
  ((self._ui).progress_rage):SetProgressRate(adrenallin)
end

MainStatusInfo.showUseableBlackSpirit = function(self)
  -- function num : 0_21
  local selfPlayer = getSelfPlayer()
  if selfPlayer:isUseableBlackSpritSkill() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_USEABLE_BLACKSPRITSKILL"), 5)
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NOTUSEABLE_BLACKSPRITSKILL"), 5)
  end
end

Input_MainStatusInfo_CheckPVP = function()
  -- function num : 0_22
end

PaGlobalFunc_MainStatusInfo_UpdateHPAndMP = function()
  -- function num : 0_23 , upvalues : MainStatusInfo
  MainStatusInfo:updateHPAndMP()
end

MainStatusInfo.updateHPAndMP = function(self)
  -- function num : 0_24
  local playerWrapper = getSelfPlayer()
  local classType = playerWrapper:getClassType()
  local player = playerWrapper:get()
  local regionKeyRaw = playerWrapper:getRegionKeyRaw()
  local regionWrapper = getRegionInfoWrapper(regionKeyRaw)
  local isArenaZone = (regionWrapper:get()):isArenaZone()
  local hp = (math.floor)(player:getHp())
  local maxHp = (math.floor)(player:getMaxHp())
  local percentHp = (math.floor)(hp / maxHp * 100)
  self._percentHP = percentHp
  do
    if percentHp < 20 and hp < self._prevHp and self._prevHpAlertTime + 20 <= FGlobal_getLuaLoadTime() and not isArenaZone then
      local sendMsg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_HP_WARNING"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_HP_WARNING_SUB"), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(sendMsg, 3, 24)
      self._prevHpAlertTime = FGlobal_getLuaLoadTime()
    end
    self._prevHp = hp
    if maxHp ~= 0 and (hp ~= self._prevHP or maxHp ~= self._prevMaxHP) then
      ((self._ui).progress_HP):SetProgressRate(hp / maxHp * 100)
      FGlobal_MainStatus_FadeIn(5)
      self._prevHP = hp
      self._prevMaxHP = maxHp
      self:checkHpAlert(hp, maxHp, false)
    end
    local mp = player:getMp()
    local maxMp = player:getMaxMp()
    if maxMp ~= 0 and (mp ~= self._prevMP or maxMp ~= self._prevMaxMP) then
      ((self._ui).progress_MP):SetProgressRate(mp / maxMp * 100)
      FGlobal_MainStatus_FadeIn(5)
      self._prevMP = mp
      self._prevMaxMP = maxMp
    end
    FGlobal_SettingMpBarTemp()
  end
end

local _alertDanger = (UI.getChildControl)(Panel_Danger, "Static_Alert")
MainStatusInfo.checkHpAlert = function(self, hp, maxHp, isLevelUp)
  -- function num : 0_25 , upvalues : _alertDanger
  local isUpdate = (Defines.UIMode).eUIMode_Default == GetUIMode()
  if isUpdate == false then
    _alertDanger:SetShow(false)
    return 
  end
  if isLevelUp == false then
    return 
  end
  do
    local totalHp = hp / maxHp * 100
    if totalHp <= 99.99 and strongMonsterAlert == false then
      _hpGaugeHead:SetShow(true)
    end
    if totalHp == 100 and strongMonsterAlert == false then
      _hpGaugeHead:SetShow(false)
    end
    if totalHp >= 40 and strongMonsterAlert == false then
      Panel_Danger:SetShow(false, false)
      _alertDanger:SetAlpha(0)
    end
    if totalHp <= 39 and totalHp >= 20 then
      if Panel_Danger:GetShow() == false then
        Panel_Danger:SetShow(true, false)
        _alertDanger:SetAlpha(1)
      end
      if _alertDanger:GetShow() == false then
        _alertDanger:SetShow(true)
      end
      _alertDanger:SetVertexAniRun("Ani_Color_Danger0", true)
    end
    if totalHp <= 19 and totalHp >= 0 then
      if Panel_Danger:GetShow() == false then
        Panel_Danger:SetShow(true, false)
        _alertDanger:SetAlpha(1)
      end
      if _alertDanger:GetShow() == false then
        _alertDanger:SetShow(true)
      end
      _alertDanger:SetVertexAniRun("Ani_Color_Danger1", true)
    end
    -- DECOMPILER ERROR: 12 unprocessed JMP targets
  end
end

PaGlobalFunc_MainStatusInfo_DangerAlertShow = function(isShow)
  -- function num : 0_26 , upvalues : _alertDanger
  if isShow == false then
    Panel_Danger:SetShow(false, false)
    strongMonsterAlert = false
    return 
  end
  strongMonsterAlert = true
  if Panel_Danger:GetShow() ~= true then
    Panel_Danger:SetShow(true, false)
    _alertDanger:SetAlpha(1)
  end
  if _alertDanger:GetShow() == false then
    _alertDanger:SetShow(true)
  end
  _alertDanger:SetVertexAniRun("Ani_Color_Danger1", true)
end

MainStatusInfo.updateClassResource = function(self)
  -- function num : 0_27
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    ((self._ui).stc_resourceType0):SetShow(false)
    ;
    ((self._ui).stc_resourceType1):SetShow(false)
    return 
  end
  do
    local classType = selfPlayer:getClassType()
    if (CppEnums.ClassType).ClassType_Sorcerer == classType then
      ((self._ui).stc_resourceType0):SetShow(true)
      ;
      ((self._ui).stc_resourceType1):SetShow(false)
      self._resourceCount = (selfPlayer:get()):getSubResourcePoint()
      local showCount = (math.floor)(self._resourceCount / 10)
      for ii = 1, self._resource0ElementCount do
        (((self._ui).stc_resource0Elements)[ii]):SetShow(ii <= showCount)
      end
      ;
      ((self._ui).txt_resourceNum):SetText(self._resourceCount)
    elseif (CppEnums.ClassType).ClassType_Combattant == classType or (CppEnums.ClassType).ClassType_CombattantWomen == classType then
      ((self._ui).stc_resourceType0):SetShow(false)
      ;
      ((self._ui).stc_resourceType1):SetShow(true)
      self._resourceCount = (selfPlayer:get()):getSubResourcePoint()
      local showCount = (math.floor)(self._resourceCount / 10)
      for ii = 1, self._resource1ElementCount do
        (((self._ui).stc_resource1Elements)[ii]):SetShow(ii <= showCount)
      end
    else
      ((self._ui).stc_resourceType0):SetShow(false)
      ;
      ((self._ui).stc_resourceType1):SetShow(false)
      self._resourceCount = nil
    end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

FGlobal_MainStatus_FadeIn = function(viewTime)
  -- function num : 0_28 , upvalues : MainStatusInfo
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  MainStatusInfo._simpleUIFadeRate = viewTime
end

FromClient_MainStatusInfo_OnScreenResize = function()
  -- function num : 0_29 , upvalues : _alertDanger, MainStatusInfo
  Panel_Danger:SetPosX(0)
  _alertDanger:SetSize(getScreenSizeX(), getScreenSizeY())
  MainStatusInfo:CheckHpAlertPostEvent()
end

FromClient_MainStatusInfo_LvUp = function()
  -- function num : 0_30
end

FromClient_MainStatusInfo_PVPEnabled = function(actorKeyRaw)
  -- function num : 0_31
  local selfWrapper = getSelfPlayer()
  if selfWrapper == nil then
    return 
  end
  if selfWrapper:getActorKey() == actorKeyRaw then
    FromClient_MainStatusInfo_changeMode(selfWrapper)
  end
end

local isPvPOn = true
FromClient_MainStatusInfo_changeMode = function(where, actorKeyRaw)
  -- function num : 0_32 , upvalues : MainStatusInfo, isPvPOn
  local self = MainStatusInfo
  do
    if actorKeyRaw ~= nil then
      local actorProxyWrapper = getActor(actorKeyRaw)
      if actorProxyWrapper == nil then
        return 
      end
      if not (actorProxyWrapper:get()):isSelfPlayer() then
        return 
      end
    end
    if isPvpEnable() and isFlushedUI() == false then
      self:pvpButtonShow(true)
      if getPvPMode() then
        audioPostEvent_SystemUi(0, 9)
        audioPostEvent_SystemUi(9, 0)
        ;
        ((self._ui).chk_pvp):EraseAllEffect()
        ;
        ((self._ui).chk_pvp):AddEffect("fUI_SkillButton02", true, 0, 0)
        ;
        ((self._ui).chk_pvp):AddEffect("fUI_PvPButtonLoop", true, 0, 0)
        if where == nil then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PVP_BUTTON_ON"))
        end
        isPvPOn = true
      else
        if isPvPOn then
          audioPostEvent_SystemUi(0, 11)
          ;
          ((self._ui).chk_pvp):EraseAllEffect()
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PVP_BUTTON_OFF"))
          isPvPOn = false
        end
      end
      FGlobal_MainStatus_FadeIn(5)
    else
      self:pvpButtonShow(false)
    end
  end
end

MainStatusInfo.pvpButtonShow = function(self, isShow)
  -- function num : 0_33
  if ToClient_isAdultUser() == false then
    ((self._ui).chk_pvp):SetShow(false)
    return 
  end
  if ((self._ui).chk_pvp):GetShow() == isShow then
    return 
  end
  ;
  ((self._ui).chk_pvp):ResetVertexAni()
  if isShow then
    ((self._ui).chk_pvp):SetShow(not isRecordMode)
    local PvPModeOpen_Alpha = ((self._ui).chk_pvp):addColorAnimation(0, 0.6, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    PvPModeOpen_Alpha:SetStartColor((Defines.Color).C_00FFFFFF)
    PvPModeOpen_Alpha:SetEndColor((Defines.Color).C_FFFFFFFF)
    PvPModeOpen_Alpha:SetHideAtEnd(false)
  else
    do
      local PvPModeClose_Alpha = ((self._ui).chk_pvp):addColorAnimation(0, 0.6, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      PvPModeClose_Alpha:SetStartColor((Defines.Color).C_FFFFFFFF)
      PvPModeClose_Alpha:SetEndColor((Defines.Color).C_00FFFFFF)
      PvPModeClose_Alpha:SetHideAtEnd(true)
      PvPModeClose_Alpha:SetDisableWhileAni(true)
    end
  end
end

FromClient_MainStatusInfo_UpdateClassResource = function()
  -- function num : 0_34 , upvalues : MainStatusInfo
  MainStatusInfo:updateClassResource()
end

FromClient_MainStatusInfo_UpdateRage = function()
  -- function num : 0_35 , upvalues : MainStatusInfo
  MainStatusInfo:updateRage()
end

FromClient_MainStatusInfo_ShowUseableBlackSpirit = function()
  -- function num : 0_36 , upvalues : MainStatusInfo
  MainStatusInfo:showUseableBlackSpirit()
end

local now_HpBarBurn = false
local HpBarBurnTimer = 0
FromClient_MainStatusInfo_DamageByOtherPlayer = function()
  -- function num : 0_37 , upvalues : now_HpBarBurn, MainStatusInfo, HpBarBurnTimer
  if now_HpBarBurn == false then
    now_HpBarBurn = ((MainStatusInfo._ui).stc_hpBG):EraseAllEffect()
    now_HpBarBurn = ((MainStatusInfo._ui).stc_hpBG):AddEffect("fUI_Gauge_PvP", false, 0, 0)
    HpBarBurnTimer = 0
  end
end

PaGlobalFunc_MainStatusInfo_PerFrame = function(DeltaTime)
  -- function num : 0_38 , upvalues : HpBarBurnTimer, now_HpBarBurn, MainStatusInfo
  HpBarBurnTimer = HpBarBurnTimer + DeltaTime
  if HpBarBurnTimer > 10 and now_HpBarBurn ~= false then
    ((MainStatusInfo._ui).stc_hpBG):EraseEffect(now_HpBarBurn)
    now_HpBarBurn = false
    HpBarBurnTimer = 0
  end
  if HpBarBurnTimer > 12 then
    HpBarBurnTimer = 0
  end
end

PhantomCount_HelpComment = function(_isShowPhantomHelp)
  -- function num : 0_39 , upvalues : MainStatusInfo
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local control = (MainStatusInfo._ui).stc_resourceType0
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_14")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_PHANTOMCOUNT_MESSAGE")
  TooltipSimple_Show(control, name, desc)
end

FighterIcon_HelpComment = function(isShow)
  -- function num : 0_40 , upvalues : MainStatusInfo
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local classType = selfPlayer:getClassType()
  if (CppEnums.ClassType).ClassType_Combattant ~= classType and (CppEnums.ClassType).ClassType_CombattantWomen ~= classType then
    return 
  end
  local control = (MainStatusInfo._ui).stc_resourceType1
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_FIGHTERTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_FIGHTER")
  if (CppEnums.ClassType).ClassType_CombattantWomen == classType then
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_MYSTIC")
  end
  TooltipSimple_Show(control, name, desc)
end

FGlobal_ImmediatelyResurrection = function(resurrFunc)
  -- function num : 0_41 , upvalues : MainStatusInfo
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  MainStatusInfo._prevHp = resurrFunc
end

FromClient_MainStatusInfo_checkHpAlertPostEvent = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_42 , upvalues : MainStatusInfo
  local currentRenderMode = {(Defines.RenderMode).eRenderMode_Default, (Defines.RenderMode).eRenderMode_WorldMap}
  if CheckRenderModebyGameMode(nextRenderModeList) or CheckRenderMode(prevRenderModeList, currentRenderMode) then
    MainStatusInfo:CheckHpAlertPostEvent()
  end
  FromClient_MainStatusInfo_OnScreenResize()
end

MainStatusInfo.CheckHpAlertPostEvent = function(self)
  -- function num : 0_43 , upvalues : _alertDanger
  if (Defines.UIMode).eUIMode_Default ~= GetUIMode() then
    return 
  end
  self:updateHPAndMP()
  if self._alertHpValue < self._percentHP then
    _alertDanger:SetShow(false)
    Panel_Danger:SetShow(false)
  else
    _alertDanger:SetShow(true)
    Panel_Danger:SetShow(true)
  end
end


