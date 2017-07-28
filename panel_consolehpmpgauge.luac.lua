-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\console\panel_consolehpmpgauge.luac 

-- params : ...
-- function num : 0
PaGlobal_ConsoleHpMp = {
_ui = {_staticGage_HP = (UI.getChildControl)(Panel_ConsoleHpMpGauge, "Progress2_Hp"), _staticGage_MP = (UI.getChildControl)(Panel_ConsoleHpMpGauge, "Progress2_Mp")}
, _prevHP = 0, _prevMaxHP = 0}
-- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleHpMp.Initialize = function(self)
  -- function num : 0_0
  Panel_ConsoleHpMpGauge:SetShow(true)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._hpGaugeHead = (UI.getChildControl)((self._ui)._staticGage_HP, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._mpGaugeHead = (UI.getChildControl)((self._ui)._staticGage_MP, "Progress2_2_Bar_Head")
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).hpGageMaxSize = ((self._ui)._staticGage_HP):GetSizeX()
  ;
  ((self._ui)._staticGage_HP):SetShow(true)
  ;
  ((self._ui)._hpGaugeHead):SetShow(true)
  ;
  ((self._ui)._staticGage_MP):SetShow(true)
  ;
  ((self._ui)._mpGaugeHead):SetShow(true)
  ;
  ((self._ui)._staticGage_HP):ChangeTextureInfoName("new_ui_common_forlua/default/console_progressbar_00.dds")
  local xx1, yy1, xx2, yy2 = setTextureUV_Func((self._ui)._staticGage_HP, 2, 123, 328, 143)
  ;
  (((self._ui)._staticGage_HP):getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  ;
  ((self._ui)._staticGage_HP):setRenderTexture(((self._ui)._staticGage_HP):getBaseTexture())
  ;
  ((self._ui)._staticGage_HP):SetProgressRate(100)
  ;
  ((self._ui)._staticGage_HP):AddEffect("fUI_Gauge_Red", false, 0, 0)
  ;
  ((self._ui)._staticGage_HP):SetAlpha(1)
  ;
  ((self._ui)._staticGage_MP):ChangeTextureInfoName("new_ui_common_forlua/default/console_progressbar_00.dds")
  xx1 = setTextureUV_Func((self._ui)._staticGage_MP, 2, 144, 306, 164)
  ;
  (((self._ui)._staticGage_MP):getBaseTexture()):setUV(xx1, yy1, xx2, yy2)
  ;
  ((self._ui)._staticGage_MP):setRenderTexture(((self._ui)._staticGage_MP):getBaseTexture())
  ;
  ((self._ui)._staticGage_MP):SetProgressRate(100)
  ;
  ((self._ui)._staticGage_MP):AddEffect("fUI_Gauge_Red", false, 0, 0)
  ;
  ((self._ui)._staticGage_MP):SetAlpha(1)
  Panel_ConsoleHpMpGauge:SetPosX(getScreenSizeX() / 2 - Panel_ConsoleHpMpGauge:GetSizeX() / 2)
  Panel_ConsoleHpMpGauge:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - Panel_ConsoleHpMpGauge:GetSizeY())
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ConsoleHpMp.Update = function(self)
  -- function num : 0_1
  local playerWrapper = getSelfPlayer()
  local player = playerWrapper:get()
  local hp = (math.floor)(player:getHp())
  local maxHp = (math.floor)(player:getMaxHp())
  local percentHp = (math.floor)(hp / maxHp * 100)
  if maxHp ~= 0 and (hp ~= self._prevHP or maxHp ~= self._prevMaxHP) then
    ((self._ui)._staticGage_HP):SetProgressRate(hp / maxHp * 100)
    if hp - self._prevHP > 5 then
      ((self._ui)._staticGage_HP):AddEffect("fUI_Gauge_Red", false, 0, 0)
    end
    self._prevHP = hp
    self._prevMaxHP = maxHp
  end
end

Panel_ConsoleHpMpGauge_Update = function()
  -- function num : 0_2
  PaGlobal_ConsoleHpMp:Update()
end

Panel_ConsoleHpMp_Simplify_Show = function()
  -- function num : 0_3
  Panel_ConsoleHpMpGauge:ResetVertexAni(true)
  local aniInfo1 = Panel_ConsoleHpMpGauge:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartPosition(Panel_ConsoleHpMpGauge:GetPosX() - Panel_ConsoleHpMpGauge:GetSizeX(), Panel_ConsoleHpMpGauge:GetPosY() - Panel_ConsoleHpMpGauge:GetSizeY())
  aniInfo1:SetEndPosition(0, 0)
  aniInfo1.IsChangeChild = true
end

Panel_ConsoleHpMp_Simpilify_Hide = function()
  -- function num : 0_4
  Panel_ConsoleHpMpGauge:ResetVertexAni(true)
  local aniInfo1 = Panel_ConsoleHpMpGauge:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartPosition(0, 0)
  aniInfo1:SetEndPosition(Panel_ConsoleHpMpGauge:GetPosX() - Panel_ConsoleHpMpGauge:GetSizeX(), Panel_ConsoleHpMpGauge:GetPosY() - Panel_ConsoleHpMpGauge:GetSizeY())
  aniInfo1.IsChangeChild = true
end

Panel_ConsoleHpMpGauge:setConsoleUIPanelType(1)
registerEvent("EventCharacterInfoUpdate", "Panel_ConsoleHpMpGauge_Update")
registerEvent("FromClient_SelfPlayerHpChanged", "Panel_ConsoleHpMpGauge_Update")
registerEvent("FromClient_SelfPlayerMpChanged", "Panel_ConsoleHpMpGauge_Update")
registerEvent("FromClient_simplify_Show", "Panel_ConsoleHpMp_Simplify_Show")
registerEvent("FromClient_simplify_Hide", "Panel_ConsoleHpMp_Simpilify_Hide")
PaGlobal_ConsoleHpMp:Initialize()

