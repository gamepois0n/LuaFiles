-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\panel_mainstatus_user_bar.luac 

-- params : ...
-- function num : 0
Panel_MainStatus_User_Bar:SetShow(true)
Panel_MainStatus_User_Bar:RegisterShowEventFunc(true, "mainStatus_AniOpen()")
Panel_MainStatus_User_Bar:RegisterShowEventFunc(false, "mainStatus_AniClose()")
Panel_MainStatus_User_Bar:SetFakeUIRenderList()
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_AH = CppEnums.PA_UI_ALIGNHORIZON
local UI_color = Defines.Color
local UI_classType = CppEnums.ClassType
local _damageByOtherPlayer_Time = 0
local now_HpBarBurn = false
local HpBarBurnTimer = 0
local prevHp = 0
local prevHpAlertTime = 0
local _alertDanger = (UI.getChildControl)(Panel_Danger, "Static_Alert")
local _alertGauge = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_GaugeAlert")
local _gauge100per = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_100per")
local mainBarText = (UI.getChildControl)(Panel_MainStatus_User_Bar, "StaticText_MainBarText")
local SimpleUIFadeRate = 1
local selfPlayerStatusBar = {_staticHP_BG = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_HP_MainBG"), _staticMP_BG = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_MP_MainBG"), _staticText_HP = (UI.getChildControl)(Panel_MainStatus_User_Bar, "StaticText_HP"), _staticText_MP = (UI.getChildControl)(Panel_MainStatus_User_Bar, "StaticText_MP"), _staticTexture_MP = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_Texture_MP"), _staticTexture_FP = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_Texture_FP"), _staticTexture_CP = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_Texture_CP"), _staticTexture_EP = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_Texture_EP"), _staticTexture_BP = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_Texture_BP"), _staticTexture_Dark = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_Texture_Dark"), _staticGage_HP = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_HPGauge"), _staticGage_HP_Later = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress2_HpGaugeLater"), _staticShowHp = (UI.getChildControl)(Panel_MainStatus_User_Bar, "StaticText_HPText"), _staticShowMp = (UI.getChildControl)(Panel_MainStatus_User_Bar, "StaticText_MPText"), _staticGage_CombatResource = nil, 
define = {MP = 0, FP = 1, EP = 2, BP = 3}
, 
_combatResources = {(UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_FPGauge"), (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_EPGauge"), (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_BPGauge"); [0] = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_MPGauge")}
, _combatResources_Later = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress2_MpGaugeLater"), _combatResources_LaterHead = (UI.getChildControl)((UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress2_MpGaugeLater"), "Progress2_1_Bar_Head"), 
config = {hpGageMaxSize = 0, mpGageMaxSize = 0}
, posX = Panel_MainStatus_User_Bar:GetPosX(), posY = Panel_MainStatus_User_Bar:GetPosY(), initPosX = Panel_MainStatus_User_Bar:GetPosX(), initPosY = Panel_MainStatus_User_Bar:GetPosY()}
Panel_Danger:SetIgnore(true)
_alertDanger:SetIgnore(true)
_gauge100per:SetIgnore(true)
;
(selfPlayerStatusBar._staticHP_BG):SetIgnore(false)
;
(selfPlayerStatusBar._staticMP_BG):SetIgnore(false)
local _hpGaugeHead = (UI.getChildControl)(selfPlayerStatusBar._staticGage_HP, "Progress_HPHead")
local _mpGauge = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_MPGauge")
local _fpGauge = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_FPGauge")
local _epGauge = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_EPGauge")
local _bpGauge = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_BPGauge")
local _darkGauge = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Progress_DarkGauge")
local _mpGaugeHead = (UI.getChildControl)(_mpGauge, "Progress_MPHead")
local _fpGaugeHead = (UI.getChildControl)(_fpGauge, "Progress_FPHead")
local _epGaugeHead = (UI.getChildControl)(_epGauge, "Progress_EPHead")
local _bpGaugeHead = (UI.getChildControl)(_bpGauge, "Progress_BPHead")
local _darkGaugeHead = (UI.getChildControl)(_darkGauge, "Progress_DarkHead")
local _hpGauge_Back = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_HPGage_Back")
local _mpGauge_Back = (UI.getChildControl)(Panel_MainStatus_User_Bar, "Static_MPGage_Back")
selfPlayerStatusBar.init = function(self)
  -- function num : 0_0
  self._staticGage_CombatResource = (self._combatResources)[(self.define).MP]
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).hpGageMaxSize = (self._staticGage_HP):GetSizeX()
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).mpGageMaxSize = (self._staticGage_CombatResource):GetSizeX()
  Panel_MainStatus_User_Bar:addInputEvent("Mouse_PressMove", "SelfPlayerStatusBar_RefleshPosition()")
  Panel_MainStatus_User_Bar:addInputEvent("Mouse_LUp", "SelfPlayerStatusBar_RefleshPosition()")
end

selfPlayerStatusBar.checkLoad = function(self)
  -- function num : 0_1
  ;
  (UI.ASSERT)(self._staticText_HP ~= nil and (self._staticText_HP).__name == "PAUIStatic", "Fail to load control")
  ;
  (UI.ASSERT)(self._staticText_MP ~= nil and (self._staticText_MP).__name == "PAUIStatic", "Fail to load control")
  ;
  (UI.ASSERT)(self._staticGage_HP ~= nil and (self._staticGage_HP).__name == "PAUIProgress", "Fail to load control")
  ;
  (UI.ASSERT)((self._combatResources)[0] ~= nil and ((self._combatResources)[0]).__name == "PAUIProgress", "Fail to load control")
  ;
  (UI.ASSERT)((self._combatResources)[1] ~= nil and ((self._combatResources)[1]).__name == "PAUIProgress", "Fail to load control")
  ;
  (UI.ASSERT)((self._combatResources)[2] ~= nil and ((self._combatResources)[2]).__name == "PAUIProgress", "Fail to load control")
  ;
  (UI.ASSERT)((self._combatResources)[3] ~= nil and ((self._combatResources)[3]).__name == "PAUIProgress", "Fail to load control")
  -- DECOMPILER ERROR: 13 unprocessed JMP targets
end

selfPlayerStatusBar.resourceTypeCheck = function(self, selfPlayerWrapper)
  -- function num : 0_2
  local resourceType = selfPlayerWrapper:getCombatResourceType()
  local classType = selfPlayerWrapper:getClassType()
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  if (self.define).MP <= resourceType then
    self._staticGage_CombatResource = (self._combatResources)[resourceType]
  else
    ;
    (UI.ASSERT)(false, "SelfPlayer Combat Resource Type is INVALID!!!!")
  end
  for _,control in pairs(self._combatResources) do
    control:SetShow(false)
  end
  if isColorBlindMode == 0 then
    (self._staticGage_CombatResource):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self._staticGage_CombatResource, 0, 52, 255, 61)
    if resourceType == 0 then
      x1 = setTextureUV_Func(self._staticGage_CombatResource, 0, 52, 255, 61)
    else
      -- DECOMPILER ERROR at PC69: Overwrote pending register: R8 in 'AssignReg'

      -- DECOMPILER ERROR at PC70: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC71: Overwrote pending register: R6 in 'AssignReg'

      if resourceType == 1 then
        x1 = setTextureUV_Func(self._staticGage_CombatResource, 0, 42, 255, 51)
      else
        -- DECOMPILER ERROR at PC83: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC84: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC85: Overwrote pending register: R6 in 'AssignReg'

        if resourceType == 2 then
          x1 = setTextureUV_Func(self._staticGage_CombatResource, 0, 62, 255, 71)
          if classType == (CppEnums.ClassType).ClassType_DarkElf then
            (self._staticGage_CombatResource):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_03.dds")
            -- DECOMPILER ERROR at PC103: Overwrote pending register: R8 in 'AssignReg'

            -- DECOMPILER ERROR at PC104: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC105: Overwrote pending register: R6 in 'AssignReg'

            x1 = setTextureUV_Func(self._staticGage_CombatResource, 1, 1, 256, 10)
          end
        else
          -- DECOMPILER ERROR at PC117: Overwrote pending register: R8 in 'AssignReg'

          -- DECOMPILER ERROR at PC118: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC119: Overwrote pending register: R6 in 'AssignReg'

          if resourceType == 3 then
            x1 = setTextureUV_Func(self._staticGage_CombatResource, 0, 226, 256, 235)
          end
        end
      end
    end
    ;
    ((self._staticGage_CombatResource):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (self._staticGage_CombatResource):setRenderTexture((self._staticGage_CombatResource):getBaseTexture())
    ;
    (self._staticGage_HP):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
    local xx1, yy1, xx2, yy2 = setTextureUV_Func(self._staticGage_HP, 0, 0, 255, 9)
    ;
    ((self._staticGage_HP):getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
    ;
    (self._staticGage_HP):setRenderTexture((self._staticGage_HP):getBaseTexture())
  else
    do
      -- DECOMPILER ERROR at PC166: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC167: Overwrote pending register: R7 in 'AssignReg'

      if isColorBlindMode == 1 then
        (self._staticGage_CombatResource):ChangeTextureInfoName(x2)
        -- DECOMPILER ERROR at PC172: Overwrote pending register: R8 in 'AssignReg'

        local x1, y1, x2, y2 = setTextureUV_Func(self._staticGage_CombatResource, 1, y2, 256, 244)
        ;
        ((self._staticGage_CombatResource):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (self._staticGage_CombatResource):setRenderTexture((self._staticGage_CombatResource):getBaseTexture())
        ;
        (self._staticGage_HP):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
        local xx1, yy1, xx2, yy2 = setTextureUV_Func(self._staticGage_HP, 1, 226, 256, 234)
        ;
        ((self._staticGage_HP):getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
        ;
        (self._staticGage_HP):setRenderTexture((self._staticGage_HP):getBaseTexture())
      else
        do
          if isColorBlindMode == 2 then
            (self._staticGage_CombatResource):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self._staticGage_CombatResource, 1, 236, 256, 244)
            ;
            ((self._staticGage_CombatResource):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self._staticGage_CombatResource):setRenderTexture((self._staticGage_CombatResource):getBaseTexture())
            ;
            (self._staticGage_HP):ChangeTextureInfoName("new_ui_common_forlua/default/Default_Gauges_01.dds")
            local xx1, yy1, xx2, yy2 = setTextureUV_Func(self._staticGage_HP, 1, 226, 256, 234)
            ;
            ((self._staticGage_HP):getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
            ;
            (self._staticGage_HP):setRenderTexture((self._staticGage_HP):getBaseTexture())
          end
          do
            ;
            (self._staticGage_CombatResource):SetShow(true)
            ;
            (self._combatResources_Later):SetShow(true)
          end
        end
      end
    end
  end
end

local prevHP = -1
local prevMaxHP = -1
local prevMP = -1
local prevMaxMP = -1
local screenSizeX = getScreenSizeX()
local screenSizeY = getScreenSizeY()
local strongMonsterAlert = false
local checkHpAlert = function(hp, maxHp, isLevelUp)
  -- function num : 0_3 , upvalues : _alertDanger, strongMonsterAlert, _hpGaugeHead, selfPlayerStatusBar, UI_color
  local isUpdate = (Defines.UIMode).eUIMode_Default == GetUIMode()
  if isUpdate == false then
    _alertDanger:SetShow(false)
    return 
  end
  if global_danger_MessageShow == false and isLevelUp == false then
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
      (selfPlayerStatusBar._staticText_HP):SetFontColor(UI_color.C_FFF0EF9D)
      Panel_Danger:SetShow(false, false)
      _alertDanger:SetAlpha(0)
    end
    if totalHp <= 39 and totalHp >= 20 then
      (selfPlayerStatusBar._staticText_HP):SetFontColor(UI_color.C_FFF26A6A)
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

FGlobal_DangerAlert_Show = function(isShow)
  -- function num : 0_4 , upvalues : strongMonsterAlert, _alertDanger
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

checkHpAlertPostEvent = function()
  -- function num : 0_5 , upvalues : checkHpAlert
  checkHpAlert(1, 1, false)
end

renderModeChange_checkHpAlertPostEvent = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_6
  local currentRenderMode = {(Defines.RenderMode).eRenderMode_Default, (Defines.RenderMode).eRenderMode_WorldMap}
  if CheckRenderModebyGameMode(nextRenderModeList) or CheckRenderMode(prevRenderModeList, currentRenderMode) then
    checkHpAlertPostEvent()
  end
  Panel_MainStatus_User_Bar_Onresize()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_checkHpAlertPostEvent")
local checkMpAlert = function(mp, maxMp)
  -- function num : 0_7 , upvalues : _fpGaugeHead, _mpGaugeHead, _epGaugeHead, _bpGaugeHead, _darkGaugeHead
  local totalMp = mp / maxMp * 100
  if totalMp <= 99.99 then
    _fpGaugeHead:SetShow(true)
    _mpGaugeHead:SetShow(true)
    _epGaugeHead:SetShow(true)
    _bpGaugeHead:SetShow(true)
    _darkGaugeHead:SetShow(true)
  end
  if totalMp == 100 then
    _fpGaugeHead:SetShow(false)
    _mpGaugeHead:SetShow(false)
    _epGaugeHead:SetShow(false)
    _bpGaugeHead:SetShow(false)
    _darkGaugeHead:SetShow(false)
  end
end

DamageByOtherPlayer = function()
  -- function num : 0_8 , upvalues : now_HpBarBurn, selfPlayerStatusBar, HpBarBurnTimer
  if now_HpBarBurn == false then
    now_HpBarBurn = (selfPlayerStatusBar._staticHP_BG):EraseAllEffect()
    now_HpBarBurn = (selfPlayerStatusBar._staticHP_BG):AddEffect("fUI_Gauge_PvP", false, 0, 0)
    HpBarBurnTimer = 0
  end
end

DamageByOtherPlayer_chkOnEffectTime = function(DeltaTime)
  -- function num : 0_9 , upvalues : HpBarBurnTimer, now_HpBarBurn, selfPlayerStatusBar
  HpBarBurnTimer = HpBarBurnTimer + DeltaTime
  if HpBarBurnTimer > 10 and now_HpBarBurn ~= false then
    (selfPlayerStatusBar._staticHP_BG):EraseEffect(now_HpBarBurn)
    now_HpBarBurn = false
    HpBarBurnTimer = 0
  end
  if HpBarBurnTimer > 12 then
    HpBarBurnTimer = 0
  end
end

Panel_MainStatus_EnableSimpleUI = function()
  -- function num : 0_10 , upvalues : SimpleUIFadeRate
  SimpleUIFadeRate = 1
  Panel_MainStatus_SetAlphaAllChild(1)
end

Panel_MainStatus_DisableSimpleUI = function()
  -- function num : 0_11 , upvalues : SimpleUIFadeRate
  SimpleUIFadeRate = 1
  Panel_MainStatus_SetAlphaAllChild(1)
end

Panel_MainStatus_UpdateSimpleUI = function(DeltaTime)
  -- function num : 0_12 , upvalues : SimpleUIFadeRate
  SimpleUIFadeRate = SimpleUIFadeRate - DeltaTime
  if SimpleUIFadeRate < 0 then
    SimpleUIFadeRate = 0
  end
  if getPvPMode() then
    SimpleUIFadeRate = 1
  end
  local alphaRate = SimpleUIFadeRate
  if alphaRate > 1 then
    alphaRate = 1
  end
  Panel_MainStatus_SetAlphaAllChild(alphaRate)
end

registerEvent("SimpleUI_UpdatePerFrame", "Panel_MainStatus_UpdateSimpleUI")
registerEvent("EventSimpleUIEnable", "Panel_MainStatus_EnableSimpleUI")
registerEvent("EventSimpleUIDisable", "Panel_MainStatus_DisableSimpleUI")
Panel_MainStatus_SetAlphaAllChild = function(alphaRate)
  -- function num : 0_13 , upvalues : selfPlayerStatusBar, _hpGaugeHead, _mpGaugeHead, _fpGaugeHead, _epGaugeHead, _bpGaugeHead, _darkGaugeHead, _hpGauge_Back, _mpGauge_Back
  local self = selfPlayerStatusBar
  Panel_MainStatus_User_Bar:SetAlpha(alphaRate)
  ;
  (self._staticHP_BG):SetAlpha(alphaRate)
  ;
  (self._staticMP_BG):SetAlpha(alphaRate)
  ;
  (self._staticText_HP):SetAlpha(alphaRate)
  ;
  (self._staticText_MP):SetAlpha(alphaRate)
  ;
  (self._staticTexture_MP):SetAlpha(alphaRate)
  ;
  (self._staticTexture_FP):SetAlpha(alphaRate)
  ;
  (self._staticTexture_CP):SetAlpha(alphaRate)
  ;
  (self._staticTexture_EP):SetAlpha(alphaRate)
  ;
  (self._staticTexture_BP):SetAlpha(alphaRate)
  ;
  (self._staticTexture_Dark):SetAlpha(alphaRate)
  ;
  (self._staticGage_HP):SetAlpha(alphaRate)
  ;
  (self._staticGage_HP_Later):SetAlpha(alphaRate)
  ;
  (self._staticGage_CombatResource):SetAlpha(alphaRate)
  ;
  (self._combatResources_Later):SetAlpha(alphaRate)
  ;
  (self._combatResources_LaterHead):SetAlpha(alphaRate)
  _hpGaugeHead:SetAlpha(alphaRate)
  _mpGaugeHead:SetAlpha(alphaRate)
  _fpGaugeHead:SetAlpha(alphaRate)
  _epGaugeHead:SetAlpha(alphaRate)
  _bpGaugeHead:SetAlpha(alphaRate)
  _darkGaugeHead:SetAlpha(alphaRate)
  _hpGauge_Back:SetAlpha(alphaRate)
  _mpGauge_Back:SetAlpha(alphaRate)
  ;
  (self._staticShowHp):SetFontAlpha(alphaRate)
  ;
  (self._staticShowMp):SetFontAlpha(alphaRate)
end

FGlobal_MainStatus_FadeIn = function(viewTime)
  -- function num : 0_14 , upvalues : SimpleUIFadeRate
  SimpleUIFadeRate = viewTime
end

Panel_MainStatus_User_Bar:RegisterUpdateFunc("DamageByOtherPlayer_chkOnEffectTime")
FGlobal_ImmediatelyResurrection = function(resurrFunc)
  -- function num : 0_15 , upvalues : prevHp
  prevHp = resurrFunc
end

Panel_MainStatus_User_Bar_CharacterInfoWindowUpdate = function()
  -- function num : 0_16 , upvalues : selfPlayerStatusBar, prevHp, prevHpAlertTime, prevHP, prevMaxHP, checkHpAlert, UI_classType, prevMP, prevMaxMP, checkMpAlert
  local self = selfPlayerStatusBar
  local playerWrapper = getSelfPlayer()
  local classType = playerWrapper:getClassType()
  local player = playerWrapper:get()
  local regionKeyRaw = playerWrapper:getRegionKeyRaw()
  local regionWrapper = getRegionInfoWrapper(regionKeyRaw)
  local isArenaZone = (regionWrapper:get()):isArenaZone()
  self:resourceTypeCheck(playerWrapper)
  local hp = (math.floor)(player:getHp())
  local maxHp = (math.floor)(player:getMaxHp())
  local percentHp = (math.floor)(hp / maxHp * 100)
  do
    if percentHp < 20 and hp < prevHp and prevHpAlertTime + 20 <= FGlobal_getLuaLoadTime() and not isArenaZone then
      local sendMsg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_HP_WARNING"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_HP_WARNING_SUB"), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(sendMsg, 3, 24)
      prevHpAlertTime = FGlobal_getLuaLoadTime()
    end
    prevHp = hp
    if maxHp ~= 0 and (hp ~= prevHP or maxHp ~= prevMaxHP) then
      (self._staticShowHp):SetText(tostring(hp) .. "/" .. tostring(maxHp))
      ;
      (self._staticGage_HP_Later):SetProgressRate(hp / maxHp * 100)
      ;
      (self._staticGage_HP):SetProgressRate(hp / maxHp * 100)
      if hp - prevHP > 5 then
        local HP_BG_PosX = (self._staticHP_BG):GetPosX()
        local HP_BG_PosY = (self._staticHP_BG):GetPosY()
        ;
        (self._staticGage_HP):AddEffect("fUI_Gauge_Red", false, 0, 0)
      end
      do
        FGlobal_MainStatus_FadeIn(5)
        prevHP = hp
        prevMaxHP = maxHp
        checkHpAlert(hp, maxHp, false)
        local effectName = ""
        local isEP_Character = UI_classType.ClassType_Ranger == playerWrapper:getClassType()
        local isFP_Character = UI_classType.ClassType_Warrior == playerWrapper:getClassType() or UI_classType.ClassType_Giant == playerWrapper:getClassType() or UI_classType.ClassType_BladeMaster == playerWrapper:getClassType() or UI_classType.ClassType_BladeMasterWomen == playerWrapper:getClassType() or UI_classType.ClassType_NinjaWomen == playerWrapper:getClassType() or UI_classType.ClassType_Combattant == playerWrapper:getClassType()
        local isBP_Character = UI_classType.ClassType_Valkyrie == playerWrapper:getClassType()
        local isMP_Character = (not isEP_Character and not isFP_Character and not isBP_Character)
        local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
        ;
        (self._staticTexture_EP):SetShow(isEP_Character)
        ;
        (self._staticTexture_MP):SetShow(isMP_Character)
        ;
        (self._staticTexture_FP):SetShow(isFP_Character)
        ;
        (self._staticTexture_BP):SetShow(isBP_Character)
        ;
        (self._staticTexture_Dark):SetShow(isEP_Character)
        if isEP_Character then
          if classType == (CppEnums.ClassType).ClassType_DarkElf then
            effectName = "fUI_Gauge_Green"
          else
            effectName = "fUI_Gauge_Green"
          end
        elseif isFP_Character then
          effectName = "fUI_Gauge_Mental"
        elseif isBP_Character then
          effectName = "fUI_Gauge_Blue"
        elseif isMP_Character then
          effectName = "fUI_Gauge_Blue"
        end
        local mp = player:getMp()
        _prevMPSize = mp
        do
          local maxMp = player:getMaxMp()
          if maxMp ~= 0 and (mp ~= prevMP or maxMp ~= prevMaxMP) then
            (self._staticShowMp):SetText(tostring(mp) .. "/" .. tostring(maxMp))
            ;
            (self._staticGage_CombatResource):SetProgressRate(mp / maxMp * 100)
            ;
            (self._staticGage_CombatResource):SetShow(true)
            ;
            (self._combatResources_Later):SetProgressRate(mp / maxMp * 100)
            ;
            (self._combatResources_Later):SetShow(true)
            if mp - prevMP > 10 then
              local MP_BG_PosX = (self._staticMP_BG):GetPosX()
              local MP_BG_PosY = (self._staticMP_BG):GetPosY()
              ;
              (self._staticGage_CombatResource):AddEffect(effectName, false, 0, 0)
            end
            FGlobal_MainStatus_FadeIn(5)
            prevMP = mp
            checkMpAlert(mp, maxMp)
            prevMaxMP = maxMp
          end
          ;
          (self._staticText_HP):SetPosX(3.09 * (self._staticGage_HP):GetProgressRate() + 30)
          ;
          (self._staticText_MP):SetPosX(3.09 * (self._staticGage_CombatResource):GetProgressRate() + 30)
          ;
          (self._staticShowHp):SetPosX(3.09 * (self._staticGage_HP):GetProgressRate() + 40)
          ;
          (self._staticShowHp):SetPosY(10)
          ;
          (self._staticShowMp):SetPosX(3.09 * (self._staticGage_CombatResource):GetProgressRate() + 40)
          ;
          (self._staticShowMp):SetPosY(55)
          FGlobal_SettingMpBarTemp()
          -- DECOMPILER ERROR: 13 unprocessed JMP targets
        end
      end
    end
  end
end

Panel_MainStatus_User_Bar_Onresize = function()
  -- function num : 0_17 , upvalues : _alertDanger
  Panel_Danger:SetPosX(0)
  _alertDanger:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_MainStatus_User_Bar:ComputePos()
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_MainStatus_User_Bar:GetRelativePosX() == -1 and Panel_MainStatus_User_Bar:GetRelativePosY() == -1 then
      local initPosX = getScreenSizeX() / 2 - Panel_MainStatus_User_Bar:GetSizeX() / 2
      local initPosY = getScreenSizeY() - Panel_QuickSlot:GetSizeY() - Panel_MainStatus_User_Bar:GetSizeY()
      Panel_MainStatus_User_Bar:SetPosX(initPosX)
      Panel_MainStatus_User_Bar:SetPosY(initPosY)
      changePositionBySever(Panel_MainStatus_User_Bar, (CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, true, true, false)
      FGlobal_InitPanelRelativePos(Panel_MainStatus_User_Bar, initPosX, initPosY)
    else
      do
        if Panel_MainStatus_User_Bar:GetRelativePosX() == 0 and Panel_MainStatus_User_Bar:GetRelativePosY() == 0 then
          Panel_MainStatus_User_Bar:SetPosX(getScreenSizeX() / 2 - Panel_MainStatus_User_Bar:GetSizeX() / 2)
          Panel_MainStatus_User_Bar:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - Panel_MainStatus_User_Bar:GetSizeY())
        else
          Panel_MainStatus_User_Bar:SetPosX(getScreenSizeX() * Panel_MainStatus_User_Bar:GetRelativePosX() - Panel_MainStatus_User_Bar:GetSizeX() / 2)
          Panel_MainStatus_User_Bar:SetPosY(getScreenSizeY() * Panel_MainStatus_User_Bar:GetRelativePosY() - Panel_MainStatus_User_Bar:GetSizeY() / 2)
        end
        if ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
          Panel_MainStatus_User_Bar:SetShow(ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow))
        end
        Panel_MainStatus_User_Bar:SetPosX(getScreenSizeX() / 2 - Panel_MainStatus_User_Bar:GetSizeX() / 2)
        Panel_MainStatus_User_Bar:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - Panel_MainStatus_User_Bar:GetSizeY())
        changePositionBySever(Panel_MainStatus_User_Bar, (CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, true, true, false)
        if getScreenSizeX() < Panel_MainStatus_User_Bar:GetPosX() or getScreenSizeY() < Panel_MainStatus_User_Bar:GetPosY() then
          Panel_MainStatus_User_Bar:ComputePos()
          Panel_MainStatus_User_Bar:SetPosX(getScreenSizeX() / 2 - Panel_MainStatus_User_Bar:GetSizeX() / 2)
          Panel_MainStatus_User_Bar:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - Panel_MainStatus_User_Bar:GetSizeY())
        end
        FGlobal_PanelRepostionbyScreenOut(Panel_MainStatus_User_Bar)
      end
    end
  end
end

refreshHpAlertForLevelup = function()
  -- function num : 0_18 , upvalues : checkHpAlert
  local playerWrapper = getSelfPlayer()
  local player = playerWrapper:get()
  local hp = (math.floor)(player:getHp())
  local maxHp = (math.floor)(player:getMaxHp())
  checkHpAlert(hp, maxHp, true)
end

selfPlayerStatusBar.registMessageHandler = function(self)
  -- function num : 0_19 , upvalues : selfPlayerStatusBar
  registerEvent("EventCharacterInfoUpdate", "Panel_MainStatus_User_Bar_CharacterInfoWindowUpdate")
  registerEvent("FromClient_SelfPlayerHpChanged", "Panel_MainStatus_User_Bar_CharacterInfoWindowUpdate")
  registerEvent("FromClient_SelfPlayerMpChanged", "Panel_MainStatus_User_Bar_CharacterInfoWindowUpdate")
  registerEvent("onScreenResize", "Panel_MainStatus_User_Bar_Onresize")
  registerEvent("EventSelfPlayerLevelUp", "refreshHpAlertForLevelup")
  registerEvent("FromClient_DamageByOtherPlayer", "DamageByOtherPlayer")
  ;
  (selfPlayerStatusBar._staticHP_BG):addInputEvent("Mouse_On", "HP_TextOn()")
  ;
  (selfPlayerStatusBar._staticHP_BG):addInputEvent("Mouse_Out", "HP_TextOff()")
  ;
  (selfPlayerStatusBar._staticMP_BG):addInputEvent("Mouse_On", "MP_TextOn()")
  ;
  (selfPlayerStatusBar._staticMP_BG):addInputEvent("Mouse_Out", "MP_TextOff()")
end

selfPlayerStatusBar:checkLoad()
selfPlayerStatusBar:init()
selfPlayerStatusBar:registMessageHandler()
SelfPlayerStatusBar_RefleshPosition = function()
  -- function num : 0_20 , upvalues : selfPlayerStatusBar
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  selfPlayerStatusBar.posX = Panel_MainStatus_User_Bar:GetPosX()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  selfPlayerStatusBar.posY = Panel_MainStatus_User_Bar:GetPosY()
end

SelfPlayerStatusBar_Vibrate_ByDamage = function(damagePercent, isbackAttack, isCritical)
  -- function num : 0_21 , upvalues : UI_ANI_ADV, UI_AH, selfPlayerStatusBar
  local periodTime = 0.015
  local moveCount = 6
  local randomizeValue = 7
  for idx = 0, moveCount do
    local aniInfo0 = Panel_MainStatus_User_Bar:addMoveAnimation(periodTime * idx, periodTime * (idx + 1), UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo0.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
    aniInfo0.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
    aniInfo0:SetStartPosition(selfPlayerStatusBar.posX + getRandomValue(-randomizeValue, randomizeValue), selfPlayerStatusBar.posY + getRandomValue(-randomizeValue, randomizeValue))
    aniInfo0:SetEndPosition(selfPlayerStatusBar.posX + getRandomValue(-randomizeValue, randomizeValue), selfPlayerStatusBar.posY + getRandomValue(-randomizeValue, randomizeValue))
  end
  local endTime = periodTime * (moveCount + 1)
  local periodTime_vertical = 0.012
  local moveCount_vertical = 4
  local randomizeValue_vertical = 8
  for idx = 0, moveCount_vertical do
    local aniInfo0 = Panel_MainStatus_User_Bar:addMoveAnimation(endTime + periodTime_vertical * idx, endTime + periodTime_vertical * (idx + 1), UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
    aniInfo0.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
    aniInfo0.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
    aniInfo0:SetStartPosition(selfPlayerStatusBar.posX, selfPlayerStatusBar.posY + getRandomValue(-randomizeValue_vertical, randomizeValue_vertical))
    aniInfo0:SetEndPosition(selfPlayerStatusBar.posX, selfPlayerStatusBar.posY + getRandomValue(-randomizeValue_vertical, randomizeValue_vertical))
  end
  endTime = endTime + periodTime_vertical * (moveCount_vertical + 1)
  local aniInfo1 = Panel_MainStatus_User_Bar:addMoveAnimation(endTime, endTime + periodTime_vertical, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo1.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo1.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo1:SetStartPosition(selfPlayerStatusBar.posX, selfPlayerStatusBar.posY)
  aniInfo1:SetEndPosition(selfPlayerStatusBar.posX, selfPlayerStatusBar.posY)
end

Panel_MainStatus_User_Bar:addInputEvent("Mouse_On", "MainStatus_ChangeTexture_On()")
Panel_MainStatus_User_Bar:addInputEvent("Mouse_Out", "MainStatus_ChangeTexture_Off()")
Panel_MainStatus_User_Bar:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
MainStatus_ChangeTexture_On = function()
  -- function num : 0_22 , upvalues : mainBarText
  Panel_MainStatus_User_Bar:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_drag.dds")
  mainBarText:SetText(PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_DRAG_BATTLERESOURCE"))
end

MainStatus_ChangeTexture_Off = function()
  -- function num : 0_23 , upvalues : mainBarText
  if Panel_UIControl:IsShow() then
    Panel_MainStatus_User_Bar:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
    mainBarText:SetText(PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_BATTLERESOURCE"))
  else
    Panel_MainStatus_User_Bar:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  end
end

-- DECOMPILER ERROR at PC438: Confused about usage of register: R38 in 'UnsetPending'

Panel_MainStatus_User_Bar.MainStatusShowToggle = function()
  -- function num : 0_24
  local isShow = Panel_MainStatus_User_Bar:GetShow()
  if isShow == true then
    Panel_MainStatus_User_Bar:SetShow(false, true)
  else
    Panel_MainStatus_User_Bar:SetShow(true, true)
  end
end

FGlobal_Panel_MainStatus_User_Bar_Show = function()
  -- function num : 0_25 , upvalues : selfPlayerStatusBar
  Panel_MainStatus_User_Bar:SetShow(true, true)
  Panel_MainStatus_User_Bar:AddEffect("UI_Tuto_Hp_1", false, 0, -4)
  Panel_MainStatus_User_Bar:AddEffect("fUI_Tuto_Hp_01A", false, 0, -4)
  local self = selfPlayerStatusBar
  ;
  (self._staticGage_HP):AddEffect("fUI_Tuto_Hp_01A", false, 0, -5)
  ;
  (self._staticGage_HP):AddEffect("UI_Tuto_Hp_1", false, 0, -5)
  ;
  (self._staticGage_CombatResource):AddEffect("fUI_Tuto_Hp_01A", false, 0, -5)
  ;
  (self._staticGage_CombatResource):AddEffect("UI_Tuto_Hp_1", false, 0, -5)
end

mainStatus_AniOpen = function()
  -- function num : 0_26 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_MainStatus_User_Bar:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local MainStatusOpen_Alpha = Panel_MainStatus_User_Bar:addColorAnimation(0, 0.35, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MainStatusOpen_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  MainStatusOpen_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  MainStatusOpen_Alpha.IsChangeChild = true
end

mainStatus_AniClose = function()
  -- function num : 0_27 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_MainStatus_User_Bar:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local MainStatusClose_Alpha = Panel_MainStatus_User_Bar:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MainStatusClose_Alpha:SetStartColor(UI_color.C_FFFFFFFF)
  MainStatusClose_Alpha:SetEndColor(UI_color.C_00FFFFFF)
  MainStatusClose_Alpha.IsChangeChild = true
  MainStatusClose_Alpha:SetHideAtEnd(true)
  MainStatusClose_Alpha:SetDisableWhileAni(true)
end

HP_TextOn = function()
  -- function num : 0_28 , upvalues : selfPlayerStatusBar
  local playerWrapper = getSelfPlayer()
  local player = playerWrapper:get()
  local hp = (math.floor)(player:getHp())
  local maxHp = (math.floor)(player:getMaxHp())
  local self = selfPlayerStatusBar
  ;
  (self._staticShowHp):SetShow(true)
end

MP_TextOn = function()
  -- function num : 0_29 , upvalues : selfPlayerStatusBar
  local playerWrapper = getSelfPlayer()
  local player = playerWrapper:get()
  local mp = player:getMp()
  local maxMp = player:getMaxMp()
  local self = selfPlayerStatusBar
  ;
  (self._staticShowMp):SetShow(true)
end

HP_TextOff = function()
  -- function num : 0_30
end

MP_TextOff = function()
  -- function num : 0_31
end

changePositionBySever(Panel_MainStatus_User_Bar, (CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, true, true, false)

