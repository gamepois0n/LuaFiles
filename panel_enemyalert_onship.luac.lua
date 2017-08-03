-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\enemygauge\panel_enemyalert_onship.luac 

-- params : ...
-- function num : 0
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_EnemyAlert_OnShip:SetShow(false)
Panel_EnemyAlert_OnShip:setGlassBackground(true)
Panel_EnemyAlert_OnShip:ActiveMouseEventEffect(true)
Panel_EnemyAlert_OnShip:RegisterShowEventFunc(true, "Panel_EnemyAlert_OnShip_ShowAni()")
Panel_EnemyAlert_OnShip:RegisterShowEventFunc(false, "Panel_EnemyAlert_OnShip_HideAni()")
Panel_EnemyAlert_OnShip_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  Panel_EnemyAlert_OnShip:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_EnemyAlert_OnShip, 0, 0.15)
  local aniInfo1 = Panel_EnemyAlert_OnShip:addScaleAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(1.5)
  aniInfo1:SetEndScale(0.8)
  aniInfo1.AxisX = Panel_EnemyAlert_OnShip:GetSizeX() / 2
  aniInfo1.AxisY = Panel_EnemyAlert_OnShip:GetSizeY() / 2
  aniInfo1.ScaleType = 0
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_EnemyAlert_OnShip:addScaleAnimation(0.15, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(0.8)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_EnemyAlert_OnShip:GetSizeX() / 2
  aniInfo2.AxisY = Panel_EnemyAlert_OnShip:GetSizeY() / 2
  aniInfo2.ScaleType = 0
  aniInfo2.IsChangeChild = true
end

Panel_EnemyAlert_OnShip_HideAni = function()
  -- function num : 0_1
  Panel_EnemyAlert_OnShip:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_EnemyAlert_OnShip, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _darkSpirit = (UI.getChildControl)(Panel_EnemyAlert_OnShip, "Static_Darkspirit")
local _helpBubble = (UI.getChildControl)(Panel_EnemyAlert_OnShip, "Static_Runaway")
local _helpMsg = (UI.getChildControl)(Panel_EnemyAlert_OnShip, "StaticText_Runaway")
_helpMsg:SetTextMode(UI_TM.eTextMode_AutoWrap)
_helpMsg:SetAutoResize(true)
_helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ENEMYALERT_ONSHIP_TXT"))
local panelShowTime = 0
FGlobal_EnemyAlert_OnShip_Show = function()
  -- function num : 0_2 , upvalues : panelShowTime, _darkSpirit, _helpBubble, _helpMsg
  if Panel_EnemyAlert_OnShip:GetShow() then
    return 
  end
  panelShowTime = 0
  Panel_EnemyAlert_OnShip:SetShow(true, true)
  Panel_EnemyAlert_OnShip:SetPosX(getScreenSizeX() / 2 - Panel_EnemyAlert_OnShip:GetSizeX() / 2)
  Panel_EnemyAlert_OnShip:SetPosY(getScreenSizeY() / 5 * 1)
  _darkSpirit:SetShow(true)
  _helpBubble:SetShow(true)
  _helpMsg:SetShow(true)
  _darkSpirit:EraseAllEffect()
  _darkSpirit:AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
  _helpBubble:SetSize(_helpMsg:GetTextSizeX() + 20, _helpMsg:GetSizeY() + 37)
  _helpMsg:SetPosY(_helpBubble:GetPosY() + 27)
end

FGlobal_EnemyAlert_OnShip_Hide = function()
  -- function num : 0_3
  Panel_EnemyAlert_OnShip:SetShow(false, true)
end

EnemyAlert_OnShip_TimeCheck = function(deltaTime)
  -- function num : 0_4 , upvalues : panelShowTime
  panelShowTime = panelShowTime + deltaTime
  if panelShowTime > 10 then
    panelShowTime = 0
    FGlobal_EnemyAlert_OnShip_Hide()
  end
end

Panel_EnemyAlert_OnShip:RegisterUpdateFunc("EnemyAlert_OnShip_TimeCheck")

