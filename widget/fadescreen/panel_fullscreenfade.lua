local _panel = Panel_FullScreenFade
_panel:SetSize(getScreenSizeX(), getScreenSizeY())
_panel:SetPosX(0)
_panel:SetPosY(0)
_panel:SetShow(false)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local _fadeTime = 0.5
local _fadeOutDelay = 0.3
local _isFading = false
local function FullScreenFade_FadeIn()
  if ToClient_isXBox() then
    return
  end
  _isFading = true
  _panel:SetIgnore(false)
  _panel:SetPosX(0)
  _panel:SetPosY(0)
  _panel:SetColor(UI_color.C_00000000)
  _panel:SetShow(true)
  local aniInfo = _panel:addColorAnimation(0, _fadeTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo:SetStartColor(UI_color.C_00000000)
  aniInfo:SetEndColor(UI_color.C_FF000000)
end
function PaGlobalFunc_FullScreenFade_RunAfterFadeIn(func)
  if nil == func or "function" ~= type(func) then
    return
  end
  if ToClient_isXBox() then
    func()
    return
  end
  if nil ~= PaGlobalFunc_CancelByAttackIsCalled and true == PaGlobalFunc_CancelByAttackIsCalled() then
    func()
    return
  end
  func()
  do return end
  luaTimer_AddEvent(func, _fadeTime * 1000, false, 0)
  FullScreenFade_FadeIn()
end
function PaGlobalFunc_FullScreenFade_FadeOut(fadeTime, fadeDelay)
  _isFading = false
  _panel:SetIgnore(true)
  if ToClient_isXBox() then
    _panel:SetShow(false)
    return
  end
  if nil ~= PaGlobalFunc_CancelByAttackIsCalled and true == PaGlobalFunc_CancelByAttackIsCalled() then
    _panel:SetShow(false)
    return
  end
  _panel:SetShow(false)
  do return end
  if false == _panel:GetShow() then
    return
  end
  local time, delay = 0, 0
  if nil ~= fadeTime then
    time = fadeTime
  else
    time = _fadeTime
  end
  if nil ~= fadeDelay then
    delay = fadeDelay
  else
    delay = _fadeOutDelay
  end
  _panel:ResetVertexAni()
  local aniInfo = _panel:addColorAnimation(delay, time + delay, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo:SetStartColor(UI_color.C_FF000000)
  aniInfo:SetEndColor(UI_color.C_00000000)
  aniInfo:SetHideAtEnd(true)
end
function PaGlobalFunc_FullScreenFade_IsFading()
  return _isFading
end
function PaGlobalFunc_FullScreenFade_RemoveFade()
  _isFading = false
  _panel:SetShow(false)
end
function PaGlobalFunc_FullScreenFade_Resize()
  _panel:SetSize(getScreenSizeX(), getScreenSizeY())
  _panel:SetPosX(0)
  _panel:SetPosY(0)
  PaGlobalFunc_FullScreenFade_FadeOut()
end
PaGlobalFunc_FullScreenFade_FadeOut()
registerEvent("onScreenResize", "PaGlobalFunc_FullScreenFade_Resize")
