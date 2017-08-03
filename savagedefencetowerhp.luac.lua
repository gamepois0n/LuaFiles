-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\savagedefence\savagedefencetowerhp.luac 

-- params : ...
-- function num : 0
Panel_SavageDefenceTowerHp:SetShow(false)
Panel_SavageDefenceTowerHp:setMaskingChild(true)
Panel_SavageDefenceTowerHp:setGlassBackground(true)
Panel_SavageDefenceTowerHp:SetDragAll(true)
local SavageDefenceTowerHp = {_title = (UI.getChildControl)(Panel_SavageDefenceTowerHp, "StaticText_Title"), _towername = (UI.getChildControl)(Panel_SavageDefenceTowerHp, "StaticText_TowerName"), _hpProgress = (UI.getChildControl)(Panel_SavageDefenceTowerHp, "Progress2_HpGauge")}
SavageDefenceTowerHp.Init = function(self)
  -- function num : 0_0 , upvalues : SavageDefenceTowerHp
  (SavageDefenceTowerHp._title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_TITLE"))
  ;
  (SavageDefenceTowerHp._towername):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_TOWER_NAME"))
  ;
  (SavageDefenceTowerHp._hpProgress):SetProgressRate(100)
end

SavageDefenceTowerHp.SetPosition = function(self)
  -- function num : 0_1
  Panel_SavageDefenceTowerHp:SetPosX(Panel_SavageDefenceMember:GetPosX())
  Panel_SavageDefenceTowerHp:SetPosY(Panel_SavageDefenceMember:GetPosY() - Panel_SavageDefenceTowerHp:GetSizeY())
end

SavageDefenceTowerHp_Open = function()
  -- function num : 0_2 , upvalues : SavageDefenceTowerHp
  if not ToClient_getPlayNowSavageDefence() then
    return 
  end
  ;
  (SavageDefenceTowerHp._hpProgress):SetProgressRate(100)
  Panel_SavageDefenceTowerHp:SetShow(true)
  SavageDefenceTowerHp:SetPosition()
end

FromClient_UpdateTowerHp = function(rate)
  -- function num : 0_3 , upvalues : SavageDefenceTowerHp
  SavageDefenceTowerHp:SetProgressRate(rate)
end

SavageDefenceTowerHp.SetProgressRate = function(self, rate)
  -- function num : 0_4 , upvalues : SavageDefenceTowerHp
  (SavageDefenceTowerHp._hpProgress):SetProgressRate(rate)
end

SavageDefenceTowerHp:Init()
registerEvent("FromClient_UpdateTowerHp", "FromClient_UpdateTowerHp")

