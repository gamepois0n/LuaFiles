Panel_Customizing_Skin:ignorePadSnapMoveToOtherPanel()
local Customization_SkinInfo = {
  _ui = {
    _static_SliderGroup = UI.getChildControl(Panel_Customizing_Skin, "Static_SliderGroup"),
    _static_ColorGroup = UI.getChildControl(Panel_Customizing_Skin, "Static_ColorGroup"),
    _static_KeyGuideBg = UI.getChildControl(Panel_Customizing_Skin, "Static_KeyGuideBg")
  },
  _config = {_controlOffset = 10, _sliderOffset = 7},
  _currentClassType,
  _currentUiId,
  _sliderParamMin,
  _sliderParamMax,
  _sliderParamDefault,
  _sliderParamType,
  _sliderParamIndex,
  _isBoneControl = false
}
function PaGlobalFunc_Customization_Skin_UpdatePerFrame(deltaTime)
  local self = Customization_SkinInfo
  if true == self._isBoneControl then
    if true == isPadUp(__eJoyPadInputType_RightShoulder) then
      PaGlobalFunc_Customization_Skin_SetBoneControl(false)
    end
    return
  end
end
function PaGlobalFunc_Customization_Skin_SetBoneControl(isSet)
  local self = Customization_SkinInfo
  if false == isSet then
    self._isBoneControl = false
    PaGlobalFunc_Customization_SetKeyGuide(1)
    Panel_Customizing_Skin:ignorePadSnapUpdate(false)
    ToClient_StartOrEndShapeBoneControlStart(false)
  else
    self._isBoneControl = true
    PaGlobalFunc_Customization_SetKeyGuide(9)
    Panel_Customizing_Skin:ignorePadSnapUpdate(true)
    ToClient_StartOrEndShapeBoneControlStart(true)
  end
end
function HandleClicked_Customization_Skin_OpenSkinUi(classType, uiId)
  local self = Customization_SkinInfo
  self._currentClassType = classType
  self._currentUiId = uiId
  contentsIndex = 0
  local paletteCount = getUiPaletteCount(self._currentClassType, self._currentUiId, contentsIndex)
  if paletteCount == 1 then
    local paletteParamType = getUiPaletteParamType(self._currentClassType, self._currentUiId, contentsIndex)
    local paletteParamIndex = getUiPaletteParamIndex(self._currentClassType, self._currentUiId, contentsIndex)
    local paletteIndex = getDecorationParamMethodValue(self._currentClassType, paletteParamType, paletteParamIndex)
    PaGlobalFunc_Customization_PaletteHandle_CreateCommonPalette(self._ui._colorTemplate, self._ui._static_ColorGroup, self._ui._colorSelect, self._currentClassType, paletteParamType, paletteParamIndex, paletteIndex)
    local colorIndex = getParam(paletteParamType, paletteParamIndex)
    PaGlobalFunc_Customization_PaletteHandle_UpdateFocusBox(colorIndex)
  end
  local sliderCount = getUiSliderCount(self._currentClassType, self._currentUiId, contentsIndex)
  if sliderCount == 1 then
    local sliderIndex = 0
    self._sliderParamType = getUiSliderParamType(self._currentClassType, self._currentUiId, contentsIndex, sliderIndex)
    self._sliderParamIndex = getUiSliderParamIndex(self._currentClassType, self._currentUiId, contentsIndex, sliderIndex)
    local sliderParam = getParam(self._sliderParamType, self._sliderParamIndex)
    self._sliderParamMin = getParamMin(self._currentClassType, self._sliderParamType, self._sliderParamIndex)
    self._sliderParamMax = getParamMax(self._currentClassType, self._sliderParamType, self._sliderParamIndex)
    self._sliderParamDefault = getParamDefault(self._currentClassType, self._sliderParamType, self._sliderParamIndex)
    PaGlobalFunc_CustomIzationCommon_SetSliderValue(self._ui._slider_Twinkle, sliderParam, self._sliderParamMin, self._sliderParamMax)
    self._ui._sliderButton_Twinkle:SetIgnore(true)
    self._ui._slider_Twinkle:addInputEvent("Mouse_LPress", "HandleClicked_Customization_Skin_UpdateSkinSlider()")
    self._ui._slider_Twinkle:addInputEvent("Mouse_On", "HandleClicked_Customization_Skin_SliderOn()")
    self._ui._slider_Twinkle:addInputEvent("Mouse_Out", "HandleClicked_Customization_Skin_SliderOut()")
    local sliderDesc = getUiSliderDescName(self._currentClassType, self._currentUiId, contentsIndex, sliderIndex)
    self._ui._staticText_TwinkleSliderTitle:SetText(PAGetString(Defines.StringSheet_GAME, sliderDesc))
    self._ui._staticText_TwinkleSliderValue:SetText(sliderParam)
  end
  Panel_Customizing_Skin:SetSize(Panel_Customizing_Skin:GetSizeX(), self._ui._static_ColorGroup:GetSizeY() + 50)
  self._ui._static_KeyGuideBg:SetPosY(Panel_Customizing_Skin:GetPosY() + Panel_Customizing_Skin:GetSizeY() - 50)
  PaGlobalFunc_Customization_Skin_Open()
end
function HandleClicked_Customization_Skin_SliderOn()
  local self = Customization_SkinInfo
  PaGlobalFunc_Customization_SetKeyGuide(3)
  self._ui._slider_TwinkleFocus:SetShow(true)
end
function HandleClicked_Customization_Skin_SliderOut()
  local self = Customization_SkinInfo
  if false == self._isBoneControl and true == PaGlobalFunc_Customization_Skin_GetShow() then
    PaGlobalFunc_Customization_SetKeyGuide(1)
  end
  self._ui._slider_TwinkleFocus:SetShow(false)
end
function HandleClicked_Customization_Skin_UpdateSkinSlider()
  local self = Customization_SkinInfo
  local value = PaGlobalFunc_CustomIzationCommon_GetSliderValue(self._ui._slider_Twinkle, self._sliderParamMin, self._sliderParamMax)
  setParam(self._currentClassType, self._sliderParamType, self._sliderParamIndex, value)
  self._ui._staticText_TwinkleSliderValue:SetText(value)
end
function HandleClicked_Customization_Skin_CloseSkinUi()
  local self = Customization_SkinInfo
  PaGlobalFunc_Customization_Skin_Close()
end
function Customization_SkinInfo:InitControl()
  self._ui._static_TwinkleSliderBg = UI.getChildControl(self._ui._static_SliderGroup, "Static_TwinkleBg")
  self._ui._staticText_TwinkleSliderValue = UI.getChildControl(self._ui._static_TwinkleSliderBg, "StaticText_TwinkleValue")
  self._ui._staticText_TwinkleSliderTitle = UI.getChildControl(self._ui._static_TwinkleSliderBg, "StaticText_Title")
  self._ui._slider_Twinkle = UI.getChildControl(self._ui._static_TwinkleSliderBg, "Slider_Twinkle")
  self._ui._sliderButton_Twinkle = UI.getChildControl(self._ui._slider_Twinkle, "Slider_Button")
  self._ui._slider_TwinkleFocus = UI.getChildControl(self._ui._static_TwinkleSliderBg, "Static_FocusBox")
  self._ui._slider_TwinkleFocus:SetShow(false)
  self._ui._colorTemplate = UI.getChildControl(self._ui._static_ColorGroup, "Button_ColorTemplate")
  self._ui._colorTemplate:SetShow(false)
  self._ui._colorSelect = UI.getChildControl(self._ui._static_ColorGroup, "Static_SelectedColor")
  self._ui._colorSelect:SetShow(false)
end
function Customization_SkinInfo:InitEvent()
  Panel_Customizing_Skin:RegisterUpdateFunc("PaGlobalFunc_Customization_Skin_UpdatePerFrame")
  Panel_Customizing_Skin:registerPadEvent(__eConsoleUIPadEvent_LB, "PaGlobalFunc_Customization_Skin_SetBoneControl(true)")
end
function Customization_SkinInfo:InitRegister()
  registerEvent("EventOpenSkinUi", "HandleClicked_Customization_Skin_OpenSkinUi")
  registerEvent("EventCloseSkinUi", "HandleClicked_Customization_Skin_CloseSkinUi")
end
function Customization_SkinInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_FromClient_Customization_Skin_luaLoadComplete()
  local self = Customization_SkinInfo
  self:Initialize()
end
function PaGlobalFunc_Customization_Skin_Close()
  local self = Customization_SkinInfo
  if false == PaGlobalFunc_Customization_Skin_GetShow() then
    return false
  end
  if true == self._isBoneControl then
    PaGlobalFunc_Customization_Skin_SetBoneControl(false)
    return false
  end
  PaGlobalFunc_Customization_PaletteHandle_ClearPalette()
  PaGlobalFunc_Customization_SetCloseFunc(nil)
  PaGlobalFunc_Customization_SetBackEvent()
  PaGlobalFunc_Customization_Skin_SetShow(false, false)
  return true
end
function PaGlobalFunc_Customization_Skin_Open()
  if true == PaGlobalFunc_Customization_Skin_GetShow() then
    return
  end
  PaGlobalFunc_Customization_SetKeyGuide(1)
  PaGlobalFunc_Customization_SetCloseFunc(PaGlobalFunc_Customization_Skin_Close)
  PaGlobalFunc_Customization_SetBackEvent("PaGlobalFunc_Customization_Skin_Close()")
  PaGlobalFunc_Customization_Skin_SetShow(true, false)
end
function PaGlobalFunc_Customization_Skin_SetShow(isShow, isAni)
  Panel_Customizing_Skin:SetShow(isShow, isAni)
end
function PaGlobalFunc_Customization_Skin_GetShow()
  return Panel_Customizing_Skin:GetShow()
end
PaGlobalFunc_FromClient_Customization_Skin_luaLoadComplete()
