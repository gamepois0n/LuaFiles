-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tutorial\panel_summonbosstutorial_uimanager.luac 

-- params : ...
-- function num : 0
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_SummonBossTutorial_UiManager")
registerEvent("onScreenResize", "FromClient_SummonBossTutorial_ScreenReposition")
PaGlobal_SummonBossTutorial_UiManager = {
_uiList = {_uiBlackSpirit = nil, _uiKeyButton = nil, _uiHeadlineMessage = nil, _uiMasking = nil}
}
PaGlobal_SummonBossTutorial_UiMasking = {
_ui = {_maskBg_Quest = (UI.getChildControl)(Panel_Masking_Tutorial, "Static_MaskBg_Quest"), _maskBg_SelfExpGuage = (UI.getChildControl)(Panel_Masking_Tutorial, "Static_MaskBg_SelfExpGauge"), _maskBg_Spirit = (UI.getChildControl)(Panel_Masking_Tutorial, "Static_MaskBg_Spirit")}
}
-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiManager.getUiBlackSpirit = function(self)
  -- function num : 0_0
  return (self._uiList)._uiBlackSpirit
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiManager.getUiKeyButton = function(self)
  -- function num : 0_1
  return (self._uiList)._uiKeyButton
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiManager.getUiHeadlineMessage = function(self)
  -- function num : 0_2
  return (self._uiList)._uiHeadlineMessage
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiManager.getUiMasking = function(self)
  -- function num : 0_3
  return (self._uiList)._uiMasking
end

FromClient_luaLoadComplete_SummonBossTutorial_UiManager = function()
  -- function num : 0_4
  PaGlobal_SummonBossTutorial_UiManager:initialize()
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiManager.initialize = function(self)
  -- function num : 0_5
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (self._uiList)._uiBlackSpirit = PaGlobal_SummonBossTutorial_UiBlackSpirit
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiList)._uiKeyButton = PaGlobal_SummonBossTutorial_UiKeyButton
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiList)._uiHeadlineMessage = PaGlobal_SummonBossTutorial_UiHeadlineMessage
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiList)._uiMasking = PaGlobal_SummonBossTutorial_UiMasking
  Panel_SummonBossTutorial:RegisterShowEventFunc(true, "FGlobal_SummonBossTutorial_UiManager_ShowAni()")
  Panel_SummonBossTutorial:RegisterShowEventFunc(false, "FGlobal_SummonBossTutorial_UiManager_HideAni()")
  _PA_LOG("곽민�\176", "PaGlobal_SummonBossTutorial_UiManager:initialize() UI 매니�\128 초기�\148 완료!")
end

FGlobal_SummonBossTutorial_UiManager_ShowAni = function()
  -- function num : 0_6
  PaGlobal_SummonBossTutorial_UiManager:showAni()
end

FGlobal_SummonBossTutorial_UiManager_HideAni = function()
  -- function num : 0_7
  PaGlobal_SummonBossTutorial_UiManager:hideAni()
end

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiManager.showAni = function(self)
  -- function num : 0_8
  (PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit()):changeBubbleTextureForAni(false)
  Panel_SummonBossTutorial:ResetVertexAni()
  Panel_SummonBossTutorial:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo = Panel_SummonBossTutorial:addColorAnimation(0, 0.75, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor((Defines.Color).C_00FFFFFF)
  aniInfo:SetEndColor((Defines.Color).C_FFFFFFFF)
  aniInfo.IsChangeChild = true
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiManager.hideAni = function(self)
  -- function num : 0_9
  (PaGlobal_ArousalTutorial_UiManager:getUiBlackSpirit()):changeBubbleTextureForAni(false)
  Panel_SummonBossTutorial:ResetVertexAni()
  Panel_SummonBossTutorial:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo = Panel_SummonBossTutorial:addColorAnimation(0, 1.25, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor((Defines.Color).C_FFFFFFFF)
  aniInfo:SetEndColor((Defines.Color).C_00FFFFFF)
  aniInfo.IsChangeChild = true
  aniInfo:SetHideAtEnd(true)
  aniInfo:SetDisableWhileAni(true)
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiManager.hideAllTutorialUi = function(self)
  -- function num : 0_10
  for _,v in pairs(self._uiList) do
    for __,vv in pairs(v._ui) do
      vv:SetShow(false)
    end
  end
end

FromClient_SummonBossTutorial_ScreenReposition = function()
  -- function num : 0_11
  PaGlobal_SummonBossTutorial_UiManager:repositionScreen()
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiManager.repositionScreen = function(self)
  -- function num : 0_12
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  Panel_SummonBossTutorial:SetSize(scrX, scrY)
  Panel_SummonBossTutorial:SetPosX(0)
  Panel_SummonBossTutorial:SetPosY(0)
  for key,value in pairs(self._uiList) do
    for _,vv in pairs(value._ui) do
      vv:ComputePos()
    end
  end
end


