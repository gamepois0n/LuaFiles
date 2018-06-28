Panel_Customizing_BodyShape:ignorePanelMoveSnapping()
local Customization_BodyBoneInfo = {
  _ui = {
    _static_ButtonBg = UI.getChildControl(Panel_Customizing_BodyShape, "Static_ButtonGroup"),
    _static_BodySliderGroup = UI.getChildControl(Panel_Customizing_BodyShape, "Static_SliderGroup1"),
    _static_ScaleSliderGroup = UI.getChildControl(Panel_Customizing_BodyShape, "Static_SliderGroup2"),
    _static_KeyGuideBg = UI.getChildControl(Panel_Customizing_BodyShape, "Static_KeyGuideBg"),
    _button_Scale = UI.getChildControl(Panel_Customizing_BodyShape, "Button_Scale")
  },
  _currentClassType,
  _currentUiId,
  _selectScaleMin,
  _selectScaleMax,
  _currentScale,
  _controlMode
}
function Customization_BodyBoneInfo:EnableBodySlide(enable)
  local color = Defines.Color.C_FF444444
  if enable then
    color = Defines.Color.C_FFFFFFFF
  end
  self._ui._staticText_ScaleSliderX_Title:SetFontColor(color)
  self._ui._staticText_ScaleSliderY_Title:SetFontColor(color)
  self._ui._staticText_ScaleSliderZ_Title:SetFontColor(color)
  self._ui._slider_ScaleX:SetMonoTone(not enable)
  self._ui._slider_ScaleY:SetMonoTone(not enable)
  self._ui._slider_ScaleZ:SetMonoTone(not enable)
  self._ui._slider_ScaleX:SetEnable(enable)
  self._ui._slider_ScaleY:SetEnable(enable)
  self._ui._slider_ScaleZ:SetEnable(enable)
  color = Defines.Color.C_FFFFFFFF
  if enable then
    color = Defines.Color.C_FF444444
  end
  self._ui._staticText_HeightSliderTitle:SetFontColor(color)
  self._ui._staticText_WeightSliderTitle:SetFontColor(color)
  self._ui._staticText_HeightSliderValue:SetFontColor(color)
  self._ui._staticText_WeightSliderValue:SetFontColor(color)
  self._ui._slider_Height:SetMonoTone(enable)
  self._ui._slider_Weight:SetMonoTone(enable)
  self._ui._slider_Height:SetEnable(not enable)
  self._ui._slider_Weight:SetEnable(not enable)
end
function Customization_BodyBoneInfo:InitbodyBoneControls()
  if nil ~= self._currentScale then
    self:SetValueSlider(self._ui._slider_ScaleX, self._currentScale.x, self._selectScaleMin.x, self._selectScaleMax.x)
    self:SetValueSlider(self._ui._slider_ScaleY, self._currentScale.y, self._selectScaleMin.y, self._selectScaleMax.y)
    self:SetValueSlider(self._ui._slider_ScaleZ, self._currentScale.z, self._selectScaleMin.z, self._selectScaleMax.z)
  end
end
function Customization_BodyBoneInfo:CalculateSliderValue(sliderControl, valueMin, valueMax)
  local ratio = sliderControl:GetControlPos()
  local val = valueMax - valueMin
  return ratio * val - (val - math.abs(valueMax))
end
function Customization_BodyBoneInfo:SetValueSlider(sliderControl, value, valueMin, valueMax)
  local val = valueMax - valueMin
  if val ~= 0 then
    sliderControl:SetControlPos((value - valueMin) / val * 100)
  end
end
function PaGlobalFunc_Customization_BodyBone_OpenBodyShapeUi(classType, uiId)
  local self = Customization_BodyBoneInfo
  self._currentClassType = classType
  self._currentUiId = uiId
  startBodyPickingMode()
  self:EnableBodySlide(false)
  PaGlobalFunc_Customization_BodyBone_ShowBodyBoneEditor()
  if self._ui._checkBox_ShowPart:IsCheck() then
    showBoneControlPart(true)
  else
    showBoneControlPart(false)
  end
  PaGlobalFunc_Customization_BodyBone_Open()
end
function PaGlobalFunc_Customization_BodyBone_CloseBodyShapeUi()
  local self = Customization_BodyBoneInfo
  endPickingMode()
  PaGlobalFunc_Customization_BodyPose_ToggleShowPosePreCheck()
  PaGlobalFunc_Customization_BodyBone_Close()
end
function PaGlobalFunc_Customization_BodyBone_EnableBodySlide(enable)
  local self = Customization_BodyBoneInfo
  self:EnableBodySlide(enable)
end
function PaGlobalFunc_Customization_BodyBone_AdjustBodyBoneScale(scaleX, scaleY, scaleZ)
  local self = Customization_BodyBoneInfo
  self:SetValueSlider(self._ui._slider_ScaleX, scaleX, self._selectScaleMin.x, self._selectScaleMax.x)
  self:SetValueSlider(self._ui._slider_ScaleY, scaleY, self._selectScaleMin.y, self._selectScaleMax.y)
  self:SetValueSlider(self._ui._slider_ScaleZ, scaleZ, self._selectScaleMin.z, self._selectScaleMax.z)
  self._currentScale.x = scaleX
  self._currentScale.y = scaleY
  self._currentScale.z = scaleZ
end
function PaGlobalFunc_Customization_BodyBone_PickingBodyBone(customizationData)
  local self = Customization_BodyBoneInfo
  self._selectScaleMin = customizationData:getSelectedBoneScaleMin()
  self._selectScaleMax = customizationData:getSelectedBoneScaleMax()
  self._currentScale = customizationData:getSelectedBoneScaleValue()
  self:EnableBodySlide(true)
end
function PaGlobalFunc_Customization_BodyBone_ShowBodyBoneEditor()
  local self = Customization_BodyBoneInfo
  self._ui._slider_ScaleX:SetControlPos(50)
  self._ui._slider_ScaleY:SetControlPos(50)
  self._ui._slider_ScaleZ:SetControlPos(50)
  self._ui._slider_Height:SetControlPos(getCustomizationBodyHeight())
  self._ui._slider_Weight:SetControlPos(getCustomizationBodyWeight())
  setSymmetryBoneTransform(true)
  PaGlobalFunc_Customization_BodyBone_CursorSelect(3)
end
function PaGlobalFunc_Customization_BodyBone_UpdateBodyBoneScale()
  local self = Customization_BodyBoneInfo
  if true == self._ui._slider_ScaleX:IsEnable() then
    local x = calculateSliderValue(self._ui._slider_ScaleX, self._selectScaleMin.x, self._selectScaleMax.x)
    local y = calculateSliderValue(self._ui._slider_ScaleY, self._selectScaleMin.y, self._selectScaleMax.y)
    local z = calculateSliderValue(self._ui._slider_ScaleZ, self._selectScaleMin.z, self._selectScaleMax.z)
  end
  self._currentScale.x = x
  self._currentScale.y = y
  self._currentScale.z = z
  applyScaleValue(x, y, z)
end
function PaGlobalFunc_Customization_BodyBone_SliderOn(sliderType, sliderIndex)
  local self = Customization_BodyBoneInfo
  if 0 == sliderType then
    if 0 == sliderIndex then
      self._ui._slider_HeightFocus:SetShow(true)
    elseif 1 == sliderIndex then
      self._ui._slider_WeightFocus:SetShow(true)
    end
  elseif 1 == sliderType then
    if 0 == sliderIndex then
      self._ui._slider_ScaleXFocus:SetShow(true)
    elseif 1 == sliderIndex then
      self._ui._slider_ScaleYFocus:SetShow(true)
    elseif 2 == sliderIndex then
      self._ui._slider_ScaleZFocus:SetShow(true)
    end
  end
end
function PaGlobalFunc_Customization_BodyBone_SliderOut(sliderType, sliderIndex)
  local self = Customization_BodyBoneInfo
  if 0 == sliderType then
    if 0 == sliderIndex then
      self._ui._slider_HeightFocus:SetShow(false)
    elseif 1 == sliderIndex then
      self._ui._slider_WeightFocus:SetShow(false)
    end
  elseif 1 == sliderType then
    if 0 == sliderIndex then
      self._ui._slider_ScaleXFocus:SetShow(false)
    elseif 1 == sliderIndex then
      self._ui._slider_ScaleYFocus:SetShow(false)
    elseif 2 == sliderIndex then
      self._ui._slider_ScaleZFocus:SetShow(false)
    end
  end
end
function PaGlobalFunc_Customization_BodyBone_UpdateBodyHeight()
  local self = Customization_BodyBoneInfo
  if true == self._ui._slider_Height:IsEnable() then
    applyBodyHeight(self._currentClassType, self._ui._slider_Height:GetControlPos() * 100)
  end
end
function PaGlobalFunc_Customization_BodyBone_UpdateBodyWeight()
  local self = Customization_BodyBoneInfo
  if true == self._ui._slider_Weight:IsEnable() then
    applyBodyWeight(self._currentClassType, self._ui._slider_Weight:GetControlPos() * 100)
  end
end
function PaGlobalFunc_Customization_BodyBone_ToggleShowBodyBoneControlPart()
  local self = Customization_BodyBoneInfo
  showBoneControlPart(self._ui._checkBox_ShowPart:IsCheck())
end
function PaGlobalFunc_Customization_BodyBone_CursorSelect(luaControlModeIndex)
  local self = Customization_BodyBoneInfo
  selectSculptingBoneTransformType(luaControlModeIndex - 1)
  self._controlMode = luaControlModeIndex
end
function Customization_BodyBoneInfo:InitControl()
  self._ui._checkBox_ShowPart = UI.getChildControl(self._ui._static_ButtonBg, "CheckButton_ShowPart")
  self._ui._button_ResetPart = UI.getChildControl(self._ui._static_ButtonBg, "Button_ResetPart")
  self._ui._button_ResetAll = UI.getChildControl(self._ui._static_ButtonBg, "Button_ResetAll")
  self._ui._static_HeightSliderBg = UI.getChildControl(self._ui._static_BodySliderGroup, "Static_HeightBg")
  self._ui._static_WeightSliderBg = UI.getChildControl(self._ui._static_BodySliderGroup, "Static_WeightBg")
  self._ui._staticText_HeightSliderTitle = UI.getChildControl(self._ui._static_HeightSliderBg, "StaticText_Title")
  self._ui._staticText_WeightSliderTitle = UI.getChildControl(self._ui._static_WeightSliderBg, "StaticText_Title")
  self._ui._staticText_HeightSliderTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_HEIGHT"))
  self._ui._staticText_WeightSliderTitle:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_WEIGHT"))
  self._ui._staticText_HeightSliderValue = UI.getChildControl(self._ui._static_HeightSliderBg, "StaticText_HeigtValue")
  self._ui._staticText_WeightSliderValue = UI.getChildControl(self._ui._static_WeightSliderBg, "StaticText_WeightValue")
  self._ui._slider_Height = UI.getChildControl(self._ui._static_HeightSliderBg, "Slider_Height")
  self._ui._slider_Weight = UI.getChildControl(self._ui._static_WeightSliderBg, "Slider_Weight")
  self._ui._slider_HeightFocus = UI.getChildControl(self._ui._static_HeightSliderBg, "Static_FocusBox")
  self._ui._slider_HeightFocus:SetShow(false)
  self._ui._slider_WeightFocus = UI.getChildControl(self._ui._static_WeightSliderBg, "Static_FocusBox")
  self._ui._slider_WeightFocus:SetShow(false)
  self._ui._sliderButton_Height = UI.getChildControl(self._ui._slider_Height, "Slider_Button")
  self._ui._sliderButton_Weight = UI.getChildControl(self._ui._slider_Weight, "Slider_Button")
  self._ui._static_ScaleSliderXBg = UI.getChildControl(self._ui._static_ScaleSliderGroup, "Static_XBg")
  self._ui._static_ScaleSliderYBg = UI.getChildControl(self._ui._static_ScaleSliderGroup, "Static_YBg")
  self._ui._static_ScaleSliderZBg = UI.getChildControl(self._ui._static_ScaleSliderGroup, "Static_ZBg")
  self._ui._staticText_ScaleSliderX_Title = UI.getChildControl(self._ui._static_ScaleSliderXBg, "StaticText_Title")
  self._ui._staticText_ScaleSliderY_Title = UI.getChildControl(self._ui._static_ScaleSliderYBg, "StaticText_Title")
  self._ui._staticText_ScaleSliderZ_Title = UI.getChildControl(self._ui._static_ScaleSliderZBg, "StaticText_Title")
  self._ui._slider_ScaleX = UI.getChildControl(self._ui._static_ScaleSliderXBg, "Slider_X")
  self._ui._slider_ScaleY = UI.getChildControl(self._ui._static_ScaleSliderYBg, "Slider_Y")
  self._ui._slider_ScaleZ = UI.getChildControl(self._ui._static_ScaleSliderZBg, "Slider_Z")
  self._ui._slider_ScaleXFocus = UI.getChildControl(self._ui._static_ScaleSliderXBg, "Static_FocusBox")
  self._ui._slider_ScaleYFocus = UI.getChildControl(self._ui._static_ScaleSliderYBg, "Static_FocusBox")
  self._ui._slider_ScaleZFocus = UI.getChildControl(self._ui._static_ScaleSliderZBg, "Static_FocusBox")
  self._ui._slider_ScaleXFocus:SetShow(false)
  self._ui._slider_ScaleYFocus:SetShow(false)
  self._ui._slider_ScaleZFocus:SetShow(false)
  self._ui._sliderButton_ScaleX = UI.getChildControl(self._ui._slider_ScaleX, "Slider_Button")
  self._ui._sliderButton_ScaleY = UI.getChildControl(self._ui._slider_ScaleY, "Slider_Button")
  self._ui._sliderButton_ScaleZ = UI.getChildControl(self._ui._slider_ScaleZ, "Slider_Button")
end
function Customization_BodyBoneInfo:InitEvent()
  self._ui._checkBox_ShowPart:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_BodyBone_ToggleShowBodyBoneControlPart()")
  self._ui._button_ResetPart:addInputEvent("Mouse_LUp", "clearCustomizedBoneInfo()")
  self._ui._button_ResetAll:addInputEvent("Mouse_LUp", "PaGlobalFunc_CustomIzationCommon_ClearGroupCustomizedBonInfoLua()")
  self._ui._slider_Height:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyHeight()")
  self._ui._slider_Height:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyHeight()")
  self._ui._slider_Weight:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyWeight()")
  self._ui._slider_Weight:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyWeight()")
  self._ui._slider_Height:addInputEvent("Mouse_On", "PaGlobalFunc_Customization_BodyBone_SliderOn(0,0)")
  self._ui._slider_Height:addInputEvent("Mouse_Out", "PaGlobalFunc_Customization_BodyBone_SliderOut(0,0)")
  self._ui._slider_Weight:addInputEvent("Mouse_On", "PaGlobalFunc_Customization_BodyBone_SliderOn(0,1)")
  self._ui._slider_Weight:addInputEvent("Mouse_Out", "PaGlobalFunc_Customization_BodyBone_SliderOut(0,1)")
  self._ui._sliderButton_Height:SetIgnore(true)
  self._ui._sliderButton_Weight:SetIgnore(true)
  self._ui._slider_ScaleX:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyBoneScale()")
  self._ui._slider_ScaleX:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyBoneScale()")
  self._ui._slider_ScaleY:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyBoneScale()")
  self._ui._slider_ScaleY:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyBoneScale()")
  self._ui._slider_ScaleZ:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyBoneScale()")
  self._ui._slider_ScaleZ:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_Customization_BodyBone_UpdateBodyBoneScale()")
  self._ui._slider_ScaleX:addInputEvent("Mouse_On", "PaGlobalFunc_Customization_BodyBone_SliderOn(1,0)")
  self._ui._slider_ScaleX:addInputEvent("Mouse_Out", "PaGlobalFunc_Customization_BodyBone_SliderOut(1,0)")
  self._ui._slider_ScaleY:addInputEvent("Mouse_On", "PaGlobalFunc_Customization_BodyBone_SliderOn(1,1)")
  self._ui._slider_ScaleY:addInputEvent("Mouse_Out", "PaGlobalFunc_Customization_BodyBone_SliderOut(1,1)")
  self._ui._slider_ScaleZ:addInputEvent("Mouse_On", "PaGlobalFunc_Customization_BodyBone_SliderOn(1,2)")
  self._ui._slider_ScaleZ:addInputEvent("Mouse_Out", "PaGlobalFunc_Customization_BodyBone_SliderOut(1,2)")
  self._ui._sliderButton_ScaleX:SetIgnore(true)
  self._ui._sliderButton_ScaleY:SetIgnore(true)
  self._ui._sliderButton_ScaleZ:SetIgnore(true)
end
function Customization_BodyBoneInfo:InitRegister()
  registerEvent("EventShowBodyBoneEditor", "PaGlobalFunc_Customization_BodyBone_ShowBodyBoneEditor")
  registerEvent("EventPickingBodyBone", "PaGlobalFunc_Customization_BodyBone_PickingBodyBone")
  registerEvent("EventAdjustBodyBoneScale", "PaGlobalFunc_Customization_BodyBone_AdjustBodyBoneScale")
  registerEvent("EventOpenBodyShapeUi", "PaGlobalFunc_Customization_BodyBone_OpenBodyShapeUi")
  registerEvent("EventCloseBodyShapeUi", "PaGlobalFunc_Customization_BodyBone_CloseBodyShapeUi")
  registerEvent("EventEnableBodySlide", "PaGlobalFunc_Customization_BodyBone_EnableBodySlide")
end
function Customization_BodyBoneInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_FromClient_Customization_BodyBone_luaLoadComplete()
  local self = Customization_BodyBoneInfo
  self:Initialize()
end
function PaGlobalFunc_Customization_BodyBone_Close()
  if false == PaGlobalFunc_Customization_BodyBone_GetShow() then
    return
  end
  PaGlobalFunc_Customization_SetCloseFunc(nil)
  PaGlobalFunc_Customization_SetBackEvent()
  PaGlobalFunc_Customization_BodyBone_SetShow(false, false)
end
function PaGlobalFunc_Customization_BodyBone_Open()
  if true == PaGlobalFunc_Customization_BodyBone_GetShow() then
    return
  end
  PaGlobalFunc_Customization_SetCloseFunc(PaGlobalFunc_Customization_BodyBone_Close)
  PaGlobalFunc_Customization_SetBackEvent("PaGlobalFunc_Customization_BodyBone_Close()")
  PaGlobalFunc_Customization_BodyBone_SetShow(true, false)
end
function PaGlobalFunc_Customization_BodyBone_SetShow(isShow, isAni)
  Panel_Customizing_BodyShape:SetShow(isShow, isAni)
end
function PaGlobalFunc_Customization_BodyBone_GetShow()
  return Panel_Customizing_BodyShape:GetShow()
end
PaGlobalFunc_FromClient_Customization_BodyBone_luaLoadComplete()
