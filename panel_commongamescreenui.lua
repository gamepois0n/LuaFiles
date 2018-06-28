local isBossRange = false
local btn_bossCamera
local function clear_BossCamButton()
  isBossRange = false
  btn_bossCamera:SetShow(false)
  btn_bossCamera:SetCheck(false)
  sttic_sequenceAni:SetShow(false)
  ToClient_onBossCamera(false)
end
function click_button()
  if false == isBossRange then
    clear_BossCamButton()
    return
  end
  if true == btn_bossCamera:IsCheck() then
  else
    chk = ToClient_onBossCamera(false)
  end
  local chk = ToClient_onBossCamera(btn_bossCamera:IsCheck())
  if false == chk then
    _PA_LOG("\234\180\145\236\154\180", "Camera \236\180\136\234\184\176\237\153\148\234\176\128 \235\144\152\236\167\128 \236\149\138\236\149\152\235\139\164...?")
    btn_bossCamera:SetCheck(false)
  end
end
function bossCamera_ShowTooltip()
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSCAMERA_TOOLTIPNAME")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSCAMERA_TOOLTIPDESC")
  TooltipSimple_Show(btn_bossCamera, name, desc)
end
function bossCamera_HideTooltip()
  TooltipSimple_Hide()
end
function FromClient_EventCameraCharacter_RangeIn(chracterWrapper)
  if not _ContentsGroup_DriganBossDragon then
    return
  end
  btn_bossCamera:SetShow(true)
  sttic_sequenceAni:SetShow(true)
  isBossRange = true
end
function FromClient_EventCameraCharacter_RangeChange()
  if not _ContentsGroup_DriganBossDragon then
    return
  end
  btn_bossCamera:SetShow(true)
  sttic_sequenceAni:SetShow(true)
  bossCamera_Repos()
  isBossRange = true
end
function FromClient_EventCameraCharacter_RangeOut()
  isBossRange = false
  clear_BossCamButton()
end
function FromClient_EventCameraCharacter_Dead()
  isBossRange = false
  clear_BossCamButton()
end
function bossCamera_Repos()
  btn_bossCamera:SetPosX(getScreenSizeX() - Panel_Radar:GetSizeX() - btn_bossCamera:GetSizeX() - 20)
  btn_bossCamera:SetPosY(Panel_Radar:GetSizeY() - btn_bossCamera:GetSizeY() + 10)
  sttic_sequenceAni:SetPosX(btn_bossCamera:GetPosX() - 5)
  sttic_sequenceAni:SetPosY(btn_bossCamera:GetPosY() - 5)
end
local function initialize()
  btn_bossCamera = UI.getChildControl(Panel_CommonGameScreenUI, "Button_BossCamera")
  btn_bossCamera:SetShow(false)
  btn_bossCamera:addInputEvent("Mouse_LUp", "click_button()")
  btn_bossCamera:addInputEvent("Mouse_On", "bossCamera_ShowTooltip()")
  btn_bossCamera:addInputEvent("Mouse_Out", "bossCamera_HideTooltip()")
  sttic_sequenceAni = UI.getChildControl(Panel_CommonGameScreenUI, "Static_SequenceAni")
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
function FromClient_luaLoadComplete_CommonGameScreenUI()
  initialize()
  Panel_CommonGameScreenUI:SetShow(true)
  btn_bossCamera:SetShow(false)
end
