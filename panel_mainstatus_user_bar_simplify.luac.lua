-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\panel_mainstatus_user_bar_simplify.luac 

-- params : ...
-- function num : 0
Panel_MainStatus_User_Bar_simplify:RegisterShowEventFunc(true, "mainStatus_AniOpen()")
Panel_MainStatus_User_Bar_simplify:RegisterShowEventFunc(false, "mainStatus_AniClose()")
local UI_classType = CppEnums.ClassType
PaGlobal_MainStatus_User_Bar_simplify = {_combatResource_EP_RG = 0, _combatResource_EP_DE = 1, _combatResource_FP = 2, _combatResource_BP = 3, _combatResource_MP = 4, 
_ui = {_gaugePanel = Panel_MainStatus_User_Bar_simplify, _staticGauge_HP = (UI.getChildControl)(Panel_MainStatus_User_Bar_simplify, "Progress2_Hp"), _staticGauge_CombatResource = (UI.getChildControl)(Panel_MainStatus_User_Bar_simplify, "Progress2_Mp"), _dangerPanel = Panel_Danger, _alertDanger = (UI.getChildControl)(Panel_Danger, "Static_Alert"), _blackSpirit = (UI.getChildControl)(Panel_MainStatus_User_Bar_simplify, "Progress2_BlackSpirit"), _blackSpiritText = (UI.getChildControl)(Panel_MainStatus_User_Bar_simplify, "StaticText_BlackSpiritPercent")}
, _prevHP = 0, _prevMaxHP = 0, _prevMP = 0, _prevMaxMP = 0, _percentHP = 0, _prevHpAlertTime = 0, _prevAdrenallin = 0, _hpEffectName = "", _combatResourceEffectName = "", _hpEffectValue = 5, _mpEffectValue = 10, _alertHpValue = 40, _hpMsgValue = 20, _msgSendSec = 20, _simpleUIFadeRate = 1, _burnEffectStartTime = 0, _burnEffectDuringTime = 10, _burnEffectKey = 0, _isLoad = false, _burnEffectOn = false}
-- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.Initialize = function(self)
  -- function num : 0_0 , upvalues : UI_classType
  if self._isLoad == true then
    return 
  end
  self._combatResourceTypeList = {[UI_classType.ClassType_Ranger] = self._combatResource_EP_RG, [UI_classType.ClassType_DarkElf] = self._combatResource_EP_DE, [UI_classType.ClassType_Warrior] = self._combatResource_FP, [UI_classType.ClassType_Giant] = self._combatResource_FP, [UI_classType.ClassType_BladeMaster] = self._combatResource_FP, [UI_classType.ClassType_BladeMasterWomen] = self._combatResource_FP, [UI_classType.ClassType_NinjaWomen] = self._combatResource_FP, [UI_classType.ClassType_Combattant] = self._combatResource_FP, [UI_classType.ClassType_CombattantWomen] = self._combatResource_FP, [UI_classType.ClassType_Lahn] = self._combatResource_FP, [UI_classType.ClassType_Valkyrie] = self._combatResource_BP}
  self._uvDataList = {
[self._combatResource_EP_RG] = {setTextureUV_Func((self._ui)._staticGauge_CombatResource, 2, 144, 306, 164)}
, 
[self._combatResource_EP_DE] = {setTextureUV_Func((self._ui)._staticGauge_CombatResource, 2, 280, 307, 301)}
, 
[self._combatResource_FP] = {setTextureUV_Func((self._ui)._staticGauge_CombatResource, 2, 165, 306, 185)}
, 
[self._combatResource_BP] = {setTextureUV_Func((self._ui)._staticGauge_CombatResource, 2, 207, 306, 227)}
, 
[self._combatResource_MP] = {setTextureUV_Func((self._ui)._staticGauge_CombatResource, 2, 186, 306, 206)}
}
  self._warningMsg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_HP_WARNING"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTER_HP_WARNING_SUB"), addMsg = ""}
  self._blackSpritTooltipTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ADRENALLIN_TOOLTIP_TITLE")
  self._blackSpritTooltipDesc = PAGetString(Defines.StringSheet_GAME, "LUA_ADRENALLIN_TOOLTIP_DESC")
  self._playerWrapper = getSelfPlayer()
  self._player = (self._playerWrapper):get()
  self:LoadHpBar()
  self:LoadMpBar()
  ;
  ((self._ui)._gaugePanel):SetShow(false)
  self._isLoad = true
  ;
  ((self._ui)._gaugePanel):SetIgnore(true)
  ;
  ((self._ui)._blackSpirit):SetIgnore(false)
  ;
  ((self._ui)._blackSpirit):SetShow(true)
  ;
  ((self._ui)._blackSpiritText):SetShow(true)
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.Update = function(self)
  -- function num : 0_1
  self:UpdateHp()
  self:UpdateMp()
  FGlobal_SettingMpBarTemp()
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.LoadHpBar = function(self)
  -- function num : 0_2
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._hpGaugeHead = (UI.getChildControl)((self._ui)._staticGauge_HP, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).hpGaugeMaxSize = ((self._ui)._staticGauge_HP):GetSizeX()
  ;
  ((self._ui)._staticGauge_HP):SetShow(true)
  ;
  ((self._ui)._hpGaugeHead):SetShow(true)
  ;
  ((self._ui)._staticGauge_HP):ChangeTextureInfoName("new_ui_common_forlua/default/console_progressbar_00.dds")
  local xx1, yy1, xx2, yy2 = setTextureUV_Func((self._ui)._staticGauge_HP, 2, 123, 328, 143)
  ;
  (((self._ui)._staticGauge_HP):getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  ;
  ((self._ui)._staticGauge_HP):setRenderTexture(((self._ui)._staticGauge_HP):getBaseTexture())
  self._hpEffectName = "fUI_Gauge_Red"
  ;
  ((self._ui)._staticGauge_HP):AddEffect(self._hpEffectName, false, 0, 0)
  ;
  ((self._ui)._staticGauge_HP):SetProgressRate(100)
  ;
  ((self._ui)._staticGauge_HP):SetAlpha(1)
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.LoadMpBar = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._mpGaugeHead = (UI.getChildControl)((self._ui)._staticGauge_CombatResource, "Progress2_2_Bar_Head")
  ;
  ((self._ui)._staticGauge_CombatResource):SetShow(true)
  ;
  ((self._ui)._mpGaugeHead):SetShow(true)
  local resourceIndex = self:GetCombatResourceType((self._playerWrapper):getClassType())
  self:ChangeCombatResource(resourceIndex)
  self._combatResourceEffectName = self:GetEffectName(resourceIndex)
  ;
  ((self._ui)._staticGauge_CombatResource):AddEffect(self._combatResourceEffectName, false, 0, 0)
  ;
  ((self._ui)._staticGauge_CombatResource):SetProgressRate(100)
  ;
  ((self._ui)._staticGauge_CombatResource):SetAlpha(1)
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.SetPostion = function(self, posX, posY)
  -- function num : 0_4
  ((self._ui)._gaugePanel):SetPosX(posX)
  ;
  ((self._ui)._gaugePanel):SetPosY(posY)
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.GetCombatResourceType = function(self, classType)
  -- function num : 0_5
  local resourceType = (self._combatResourceTypeList)[classType]
  if resourceType ~= nil then
    return resourceType
  else
    return self._combatResource_MP
  end
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.ChangeCombatResource = function(self, index)
  -- function num : 0_6
  ((self._ui)._staticGauge_CombatResource):ChangeTextureInfoName("new_ui_common_forlua/default/console_progressbar_00.dds")
  local data = (self._uvDataList)[index]
  if data == nil then
    data = (self._uvDataList)[self._combatResource_MP]
  end
  ;
  (((self._ui)._staticGauge_CombatResource):getBaseTexture()):setUV(data[1], data[2], data[3], data[4])
  ;
  ((self._ui)._staticGauge_CombatResource):setRenderTexture(((self._ui)._staticGauge_CombatResource):getBaseTexture())
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.GetEffectName = function(self, index)
  -- function num : 0_7
  if self._combatResource_EP_RG == index then
    return "fUI_Gauge_Green"
  else
    if self._combatResource_EP_DE == index then
      return "fUI_Gauge_Green"
    else
      if self._combatResource_FP == index then
        return "fUI_Gauge_Mental"
      else
        if self._combatResource_BP == index then
          return "fUI_Gauge_Blue"
        else
          if self._combatResource_MP == index then
            return "fUI_Gauge_Blue"
          else
            return "fUI_Gauge_Blue"
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.SendWarningMessage = function(self)
  -- function num : 0_8
  local regionKeyRaw = (self._playerWrapper):getRegionKeyRaw()
  local regionWrapper = getRegionInfoWrapper(regionKeyRaw)
  local isArenaZone = (regionWrapper:get()):isArenaZone()
  if isArenaZone == true then
    return 
  end
  local luaTime = FGlobal_getLuaLoadTime()
  if self._percentHP < self._hpMsgValue and self._prevHpAlertTime + self._msgSendSec < luaTime then
    Proc_ShowMessage_Ack_For_RewardSelect(self._warningMsg, 3, 24)
    self._prevHpAlertTime = luaTime
  end
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.UpdateHp = function(self)
  -- function num : 0_9
  local hp = (math.floor)((self._player):getHp())
  local maxHp = (math.floor)((self._player):getMaxHp())
  self._percentHP = hp / maxHp * 100
  if maxHp ~= 0 and (hp ~= self._prevHP or maxHp ~= self._prevMaxHP) then
    ((self._ui)._staticGauge_HP):SetProgressRate(self._percentHP)
    if self._hpEffectValue < hp - self._prevHP then
      ((self._ui)._staticGauge_HP):AddEffect(self._hpEffectName, false, 0, 0)
    end
    self:SetFadeRate(5)
    self._prevHP = hp
    self._prevMaxHP = maxHp
    self:CheckHpAlert(hp, maxHp, false)
  end
  self:SendWarningMessage()
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.UpdateMp = function(self)
  -- function num : 0_10
  local mp = (math.floor)((self._player):getMp())
  local maxMp = (math.floor)((self._player):getMaxMp())
  if maxMp ~= 0 and (mp ~= self._prevMP or maxMp ~= self._prevMaxMP) then
    ((self._ui)._staticGauge_CombatResource):SetProgressRate(mp / maxMp * 100)
    if self._mpEffectValue < mp - self._prevMP then
      ((self._ui)._staticGauge_CombatResource):AddEffect(self._combatResourceEffectName, false, 0, 0)
    end
    self:SetFadeRate(5)
    self._prevMP = mp
    self._prevMaxMP = maxMp
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.CheckHpAlert = function(self, hp, maxHp, isLevelUp)
  -- function num : 0_11
  if (Defines.UIMode).eUIMode_Default ~= GetUIMode() then
    return 
  end
  if self._alertHpValue < self._percentHP then
    self:DangerPanelSetShow(false)
  else
    self:DangerPanelSetShow(true)
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.DangerPanelSetShow = function(self, isShow)
  -- function num : 0_12
  ((self._ui)._alertDanger):SetShow(isShow)
  ;
  ((self._ui)._dangerPanel):SetShow(isShow)
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.RegistMessageHandler = function(self)
  -- function num : 0_13
  registerEvent("EventCharacterInfoUpdate", "Panel_MainStatus_User_Bar_simplify_Update")
  registerEvent("FromClient_SelfPlayerHpChanged", "Panel_MainStatus_User_Bar_simplify_Update")
  registerEvent("FromClient_SelfPlayerMpChanged", "Panel_MainStatus_User_Bar_simplify_Update")
  registerEvent("onScreenResize", "Panel_MainStatus_User_Bar_simplify_Onresize")
  registerEvent("EventSelfPlayerLevelUp", "Panel_MainStatus_User_Bar_simplify_RefreshHpBar")
  registerEvent("FromClient_DamageByOtherPlayer", "Panel_MainStatus_User_Bar_simplify_DamageByOtherPlayer")
  ;
  ((self._ui)._blackSpirit):addInputEvent("Mouse_On", "PaGlobal_MainStatus_User_Bar_simplify:ShowAdrenallinTooltip( true )")
  ;
  ((self._ui)._blackSpirit):addInputEvent("Mouse_Out", "PaGlobal_MainStatus_User_Bar_simplify:ShowAdrenallinTooltip( false )")
  ;
  ((self._ui)._blackSpirit):setTooltipEventRegistFunc("PaGlobal_MainStatus_User_Bar_simplify:ShowAdrenallinTooltip( true )")
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.SetAlphaAll = function(self, alphaReate)
  -- function num : 0_14
  ((self._ui)._gaugePanel):SetAlpha(alphaReate)
  ;
  ((self._ui)._staticGauge_HP):SetAlpha(alphaReate)
  ;
  ((self._ui)._staticGauge_CombatResource):SetAlpha(alphaReate)
  ;
  ((self._ui)._blackSpirit):SetAlpha(alphaReate)
  ;
  ((self._ui)._blackSpiritText):SetAlpha(alphaReate)
end

local oncePos = false
Panel_MainStatus_User_Bar_simplify_Update = function()
  -- function num : 0_15
  PaGlobal_MainStatus_User_Bar_simplify:Update()
end

Panel_MainStatus_User_Bar_simplify_Onresize = function()
  -- function num : 0_16 , upvalues : oncePos
  local self = PaGlobal_MainStatus_User_Bar_simplify
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  ;
  ((self._ui)._dangerPanel):SetPosX(0)
  ;
  ((self._ui)._alertDanger):SetSize(screenSizeX, screenSizeY)
  if CppDefine.ChangeUIAndResolution == true then
    if ((self._ui)._gaugePanel):GetRelativePosX() == -1 and ((self._ui)._gaugePanel):GetRelativePosY() == -1 then
      local initPosX = screenSizeX / 2 - ((self._ui)._gaugePanel):GetSizeX() / 2
      local initPosY = screenSizeY - Panel_QuickSlot:GetSizeY() - ((self._ui)._gaugePanel):GetSizeY()
      ;
      ((self._ui)._gaugePanel):SetPosX(initPosX)
      ;
      ((self._ui)._gaugePanel):SetPosY(initPosY)
      changePositionBySever((self._ui)._gaugePanel, (CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, true, true, false)
      FGlobal_InitPanelRelativePos((self._ui)._gaugePanel, initPosX, initPosY)
    else
      do
        -- DECOMPILER ERROR at PC96: Unhandled construct in 'MakeBoolean' P1

        if ((self._ui)._gaugePanel):GetRelativePosX() == 0 and ((self._ui)._gaugePanel):GetRelativePosY() == 0 and oncePos == false then
          Panel_MainStatus_User_Bar_simplify:SetPosX(Panel_MainStatus_User_Bar_simplify:GetSizeX() * -1)
          Panel_MainStatus_User_Bar_simplify:SetPosY(Panel_MainStatus_User_Bar_simplify:GetSizeY() * -1)
          oncePos = true
        end
        ;
        ((self._ui)._gaugePanel):SetPosX(screenSizeX * ((self._ui)._gaugePanel):GetRelativePosX() - ((self._ui)._gaugePanel):GetSizeX() / 2)
        ;
        ((self._ui)._gaugePanel):SetPosY(screenSizeY * ((self._ui)._gaugePanel):GetRelativePosY() - ((self._ui)._gaugePanel):GetSizeY() / 2)
        if ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
          ((self._ui)._gaugePanel):SetShow(false)
        end
        ;
        ((self._ui)._gaugePanel):SetPosX(screenSizeX / 2 - ((self._ui)._gaugePanel):GetSizeX() / 2)
        ;
        ((self._ui)._gaugePanel):SetPosY(screenSizeY - Panel_QuickSlot:GetSizeY() - ((self._ui)._gaugePanel):GetSizeY())
        changePositionBySever((self._ui)._gaugePanel, (CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, true, true, false)
        if screenSizeX < ((self._ui)._gaugePanel):GetPosX() or screenSizeY < ((self._ui)._gaugePanel):GetPosY() then
          ((self._ui)._gaugePanel):ComputePos()
          ;
          ((self._ui)._gaugePanel):SetPosX(screenSizeX / 2 - ((self._ui)._gaugePanel):GetSizeX() / 2)
          ;
          ((self._ui)._gaugePanel):SetPosY(screenSizeY - Panel_QuickSlot:GetSizeY() - ((self._ui)._gaugePanel):GetSizeY())
        end
      end
    end
  end
end

Panel_MainStatus_User_Bar_simplify_RefreshHpBar = function()
  -- function num : 0_17
  local playerWrapper = getSelfPlayer()
  local player = playerWrapper:get()
  local hp = (math.floor)(player:getHp())
  local maxHp = (math.floor)(player:getMaxHp())
  PaGlobal_MainStatus_User_Bar_simplify:CheckHpAlert(hp, maxHp, true)
end

-- DECOMPILER ERROR at PC131: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.LoadBurnEffect = function(self)
  -- function num : 0_18
  if self._burnEffectOn == true then
    return 
  end
  ;
  ((self._ui)._staticGauge_HP):EraseAllEffect()
  self._burnEffectKey = ((self._ui)._staticGauge_HP):AddEffect("fUI_Gauge_PvP", false, 0, 0)
  self._burnEffectOn = true
  self._burnEffectStartTime = FGlobal_getLuaLoadTime()
end

-- DECOMPILER ERROR at PC134: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.CheckHpAlertPostEvent = function(self)
  -- function num : 0_19
  self:CheckHpAlert(1, 1, false)
end

Panel_MainStatus_User_Bar_simplify_DamageByOtherPlayer = function()
  -- function num : 0_20
  PaGlobal_MainStatus_User_Bar_simplify:LoadBurnEffect()
end

DamageByOtherPlayer_chkOnEffectTime = function(DeltaTime)
  -- function num : 0_21
  local self = PaGlobal_MainStatus_User_Bar_simplify
  if self._burnEffectOn == false then
    return 
  end
  local startTime = self._burnEffectStartTime
  if startTime + self._burnEffectDuringTime < FGlobal_getLuaLoadTime() then
    ((self._ui)._staticGauge_HP):EraseEffect(self._burnEffectKey)
    self._burnEffectOn = false
  end
end

renderModeChange_checkHpAlertPostEvent = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_22
  local currentRenderMode = {(Defines.RenderMode).eRenderMode_Default, (Defines.RenderMode).eRenderMode_WorldMap}
  if CheckRenderModebyGameMode(nextRenderModeList) or CheckRenderMode(prevRenderModeList, currentRenderMode) then
    PaGlobal_MainStatus_User_Bar_simplify:CheckHpAlertPostEvent()
  end
  Panel_MainStatus_User_Bar_simplify_Onresize()
end

Panel_MainStatus_UpdateSimpleUI = function(DeltaTime)
  -- function num : 0_23
  local self = PaGlobal_MainStatus_User_Bar_simplify
  if self._simpleUIFadeRate == nil then
    return 
  end
  self._simpleUIFadeRate = self._simpleUIFadeRate - DeltaTime
  if self._simpleUIFadeRate < 0 then
    self._simpleUIFadeRate = 0
  end
  if getPvPMode() == true then
    self._simpleUIFadeRate = 1
  end
  local alphaRate = self._simpleUIFadeRate
  if alphaRate > 1 then
    alphaRate = 1
  end
  PaGlobal_MainStatus_User_Bar_simplify:SetAlphaAll(alphaRate)
end

Panel_MainStatus_EnableSimpleUI = function()
  -- function num : 0_24
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_MainStatus_User_Bar_simplify._simpleUIFadeRate = 1
  PaGlobal_MainStatus_User_Bar_simplify:SetAlphaAll(1)
end

Panel_MainStatus_DisableSimpleUI = function()
  -- function num : 0_25
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_MainStatus_User_Bar_simplify._simpleUIFadeRate = 1
  PaGlobal_MainStatus_User_Bar_simplify:SetAlphaAll(1)
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.SetShowAll = function(self)
  -- function num : 0_26
  ((self._ui)._gaugePanel):SetShow(false)
  ;
  ((self._ui)._gaugePanel):AddEffect("UI_Tuto_Hp_1", false, 0, -4)
  ;
  ((self._ui)._gaugePanel):AddEffect("fUI_Tuto_Hp_01A", false, 0, -4)
  ;
  ((self._ui)._staticGauge_HP):AddEffect("fUI_Tuto_Hp_01A", false, 0, -5)
  ;
  ((self._ui)._staticGauge_HP):AddEffect("UI_Tuto_Hp_1", false, 0, -5)
  ;
  ((self._ui)._staticGauge_CombatResource):AddEffect("fUI_Tuto_Hp_01A", false, 0, -5)
  ;
  ((self._ui)._staticGauge_CombatResource):AddEffect("UI_Tuto_Hp_1", false, 0, -5)
end

-- DECOMPILER ERROR at PC152: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.SetPrevHP = function(self, value)
  -- function num : 0_27
  self._prevHP = value
end

-- DECOMPILER ERROR at PC155: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.SetFadeRate = function(self, value)
  -- function num : 0_28
  self._simpleUIFadeRate = value
end

mainStatus_AniOpen = function()
  -- function num : 0_29
  local self = PaGlobal_MainStatus_User_Bar_simplify
  ;
  ((self._ui)._gaugePanel):SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local MainStatusOpen_Alpha = ((self._ui)._gaugePanel):addColorAnimation(0, 0.35, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MainStatusOpen_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  MainStatusOpen_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  MainStatusOpen_Alpha.IsChangeChild = true
end

mainStatus_AniClose = function()
  -- function num : 0_30
  local self = PaGlobal_MainStatus_User_Bar_simplify
  ;
  ((self._ui)._gaugePanel):SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local MainStatusClose_Alpha = ((self._ui)._gaugePanel):addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  MainStatusClose_Alpha:SetStartColor(UI_color.C_FFFFFFFF)
  MainStatusClose_Alpha:SetEndColor(UI_color.C_00FFFFFF)
  MainStatusClose_Alpha.IsChangeChild = true
  MainStatusClose_Alpha:SetHideAtEnd(true)
  MainStatusClose_Alpha:SetDisableWhileAni(true)
end

PaGlobal_MainStatus_User_Bar_simplify:Initialize()
PaGlobal_MainStatus_User_Bar_simplify:RegistMessageHandler()
Panel_MainStatus_User_Bar_simplify:RegisterUpdateFunc("DamageByOtherPlayer_chkOnEffectTime")
registerEvent("SimpleUI_UpdatePerFrame", "Panel_MainStatus_UpdateSimpleUI")
registerEvent("EventSimpleUIEnable", "Panel_MainStatus_EnableSimpleUI")
registerEvent("EventSimpleUIDisable", "Panel_MainStatus_DisableSimpleUI")
registerEvent("FromClient_RenderModeChangeState", "renderModeChange_checkHpAlertPostEvent")
-- DECOMPILER ERROR at PC188: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.UpdateAdreanllin = function(self)
  -- function num : 0_31
  if self._playerWrapper == nil then
    return 
  end
  local adrenallinValue = (self._playerWrapper):getAdrenalin()
  ;
  ((self._ui)._blackSpirit):SetProgressRate(adrenallinValue)
  ;
  ((self._ui)._blackSpiritText):SetText(tostring(adrenallinValue) .. "%")
  if adrenallinValue ~= self._prevAdrenallin then
    self:SetFadeRate(5)
  end
  self._prevAdrenallin = adrenallinValue
end

PaGlobal_MainStatus_User_Bar_simplify_Update_Adrenalin = function()
  -- function num : 0_32
  PaGlobal_MainStatus_User_Bar_simplify:UpdateAdreanllin()
end

PaGlobal_MainStatus_User_Bar_simplify_Change_Adrenalin_Mode = function()
  -- function num : 0_33
  PaGlobal_MainStatus_User_Bar_simplify:UpdateAdreanllin()
end

-- DECOMPILER ERROR at PC195: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MainStatus_User_Bar_simplify.ShowAdrenallinTooltip = function(self, isShow)
  -- function num : 0_34
  registTooltipControl((self._ui)._blackSpirit, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show((self._ui)._blackSpirit, self._blackSpritTooltipTitle, self._blackSpritTooltipDesc)
  else
    TooltipSimple_Hide()
  end
end

PaGlobal_MainStatus_User_Bar_simplify_Check_Adrenalin_PostEvent = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_35
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  PaGlobal_MainStatus_User_Bar_simplify_Change_Adrenalin_Mode()
end

registerEvent("FromClient_UpdateAdrenalin", "PaGlobal_MainStatus_User_Bar_simplify_Update_Adrenalin")
registerEvent("FromClient_ChangeAdrenalinMode", "PaGlobal_MainStatus_User_Bar_simplify_Change_Adrenalin_Mode")
registerEvent("FromClient_RenderModeChangeState", "PaGlobal_MainStatus_User_Bar_simplify_Check_Adrenalin_PostEvent")
PaGlobal_MainStatus_User_Bar_simplify:UpdateAdreanllin()
local super = Panel_MainStatus_User_Bar_simplify
local animMoveValue = 0
super:SetPosX(super:GetPosX() - super:GetSizeX() + 200)
super:SetPosY(super:GetPosY() - super:GetSizeY())
statusSimply_simplify_Show = function()
  -- function num : 0_36 , upvalues : super
  super:ResetVertexAni(true)
  local aniInfo1 = super:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartPosition(super:GetSizeX() * -1, super:GetSizeY() * -1)
  aniInfo1:SetEndPosition(0, 0)
  aniInfo1.IsChangeChild = true
end

statusSimply_simplify_Hide = function()
  -- function num : 0_37 , upvalues : super
  super:ResetVertexAni(true)
  local aniInfo1 = super:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartPosition(super:GetPosX(), super:GetPosY())
  aniInfo1:SetEndPosition(super:GetSizeX() * -1, super:GetSizeY() * -1)
  aniInfo1.IsChangeChild = true
end

registerEvent("FromClient_simplify_Show", "statusSimply_simplify_Show")
registerEvent("FromClient_simplify_Hide", "statusSimply_simplify_Hide")

