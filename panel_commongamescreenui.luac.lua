-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\panel_commongamescreenui.luac 

-- params : ...
-- function num : 0
local isBossRange = false
local btn_bossCamera = nil
local clear_BossCamButton = function()
  -- function num : 0_0 , upvalues : isBossRange, btn_bossCamera
  isBossRange = false
  btn_bossCamera:SetShow(false)
  btn_bossCamera:SetCheck(false)
  sttic_sequenceAni:SetShow(false)
  ToClient_onBossCamera(false)
end

click_button = function()
  -- function num : 0_1 , upvalues : isBossRange, clear_BossCamButton, btn_bossCamera
  if isBossRange == false then
    clear_BossCamButton()
    return 
  end
  if btn_bossCamera:IsCheck() == true then
    chk = ToClient_onBossCamera(false)
    local chk = ToClient_onBossCamera(btn_bossCamera:IsCheck())
    if chk == false then
      _PA_LOG("광운", "Camera 초기화가 되지 않았�\164...?")
      btn_bossCamera:SetCheck(false)
    end
  end
end

bossCamera_ShowTooltip = function()
  -- function num : 0_2 , upvalues : btn_bossCamera
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSCAMERA_TOOLTIPNAME")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSCAMERA_TOOLTIPDESC")
  TooltipSimple_Show(btn_bossCamera, name, desc)
end

bossCamera_HideTooltip = function()
  -- function num : 0_3
  TooltipSimple_Hide()
end

FromClient_EventCameraCharacter_RangeIn = function(chracterWrapper)
  -- function num : 0_4 , upvalues : btn_bossCamera, isBossRange
  if not _ContentsGroup_DriganBossDragon then
    return 
  end
  btn_bossCamera:SetShow(true)
  sttic_sequenceAni:SetShow(true)
  isBossRange = true
end

FromClient_EventCameraCharacter_RangeChange = function()
  -- function num : 0_5 , upvalues : btn_bossCamera, isBossRange
  if not _ContentsGroup_DriganBossDragon then
    return 
  end
  btn_bossCamera:SetShow(true)
  sttic_sequenceAni:SetShow(true)
  bossCamera_Repos()
  isBossRange = true
end

FromClient_EventCameraCharacter_RangeOut = function()
  -- function num : 0_6 , upvalues : isBossRange, clear_BossCamButton
  isBossRange = false
  clear_BossCamButton()
end

FromClient_EventCameraCharacter_Dead = function()
  -- function num : 0_7 , upvalues : isBossRange, clear_BossCamButton
  isBossRange = false
  clear_BossCamButton()
end

bossCamera_Repos = function()
  -- function num : 0_8 , upvalues : btn_bossCamera
  btn_bossCamera:SetPosX(getScreenSizeX() - Panel_Radar:GetSizeX() - btn_bossCamera:GetSizeX() - 20)
  btn_bossCamera:SetPosY(Panel_Radar:GetSizeY() - btn_bossCamera:GetSizeY() + 10)
  sttic_sequenceAni:SetPosX(btn_bossCamera:GetPosX() - 5)
  sttic_sequenceAni:SetPosY(btn_bossCamera:GetPosY() - 5)
end

local initialize = function()
  -- function num : 0_9 , upvalues : btn_bossCamera, clear_BossCamButton
  btn_bossCamera = (UI.getChildControl)(Panel_CommonGameScreenUI, "Button_BossCamera")
  btn_bossCamera:SetShow(false)
  btn_bossCamera:addInputEvent("Mouse_LUp", "click_button()")
  btn_bossCamera:addInputEvent("Mouse_On", "bossCamera_ShowTooltip()")
  btn_bossCamera:addInputEvent("Mouse_Out", "bossCamera_HideTooltip()")
  sttic_sequenceAni = (UI.getChildControl)(Panel_CommonGameScreenUI, "Static_SequenceAni")
  sttic_sequenceAni:SetShow(false)
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  bossCamera_Repos()
  clear_BossCamButton()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_CommonGameScreenUI")
registerEvent("FromClient_EventCameraCharacter_RangeIn", "FromClient_EventCameraCharacter_RangeIn")
registerEvent("FromClient_EventCameraCharacter_RangeChange", "FromClient_EventCameraCharacter_RangeChange")
registerEvent("FromClient_EventCameraCharacter_RangeOut", "FromClient_EventCameraCharacter_RangeOut")
registerEvent("FromClient_EventCameraCharacter_Dead", "FromClient_EventCameraCharacter_Dead")
FromClient_luaLoadComplete_CommonGameScreenUI = function()
  -- function num : 0_10 , upvalues : initialize, btn_bossCamera
  initialize()
  Panel_CommonGameScreenUI:SetShow(true)
  btn_bossCamera:SetShow(false)
end


