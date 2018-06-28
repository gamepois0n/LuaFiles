Panel_Customizing_FaceShape:ignorePanelMoveSnapping()
local Customization_FaceBoneInfo = {
  _ui = {
    _static_ButtonGroup = UI.getChildControl(Panel_Customizing_FaceShape, "Static_ButtonGroup"),
    _static_PositionSliderGroup = UI.getChildControl(Panel_Customizing_FaceShape, "Static_SliderGroup1"),
    _static_RotationSliderGroup = UI.getChildControl(Panel_Customizing_FaceShape, "Static_SliderGroup2"),
    _static_ScaleSliderGroup = UI.getChildControl(Panel_Customizing_FaceShape, "Static_SliderGroup3"),
    _static_KeyGuideBg = UI.getChildControl(Panel_Customizing_FaceShape, "Static_KeyGuideBg"),
    _button_Position = UI.getChildControl(Panel_Customizing_FaceShape, "Button_Position"),
    _button_Rotation = UI.getChildControl(Panel_Customizing_FaceShape, "Button_Rotation"),
    _button_Scale = UI.getChildControl(Panel_Customizing_FaceShape, "Button_Scale")
  },
  _currentClassType,
  _currentUiId,
  _checkTansRotScale = 1,
  _controlMode = 1,
  _selectedTransMin,
  _selectedTransMax,
  _selectedRotMin,
  _selectedRotMax,
  _selectedScaleMin,
  _selectedScaleMax,
  _currentTranslation,
  _currentRotation,
  _currentScale
}
function PaGlobalFunc_Customization_FaceBone_OpenFaceShapeUi(classType, uiId)
  local self = Customization_FaceBoneInfo
  self._currentClassType = classType
  self._currentUiId = uiId
  PaGlobalFunc_Customization_CameraLookEnable(false)
  startFacePickingMode()
  self:EnableFaceSlide(false)
  PaGlobalFunc_Customization_FaceBone_showBoneSculptingSelector(true)
  PaGlobalFunc_Customization_FaceBone_Open()
end
function PaGlobalFunc_Customization_FaceBone_CloseFaceShapeUi()
  PaGlobalFunc_Customization_CameraLookEnable(true)
  endPickingMode()
  PaGlobalFunc_Customization_FaceBone_Close()
end
function PaGlobalFunc_Customization_FaceBone_CursorSelect(luaControlModeIndex)
  local self = Customization_FaceBoneInfo
  selectSculptingBoneTransformType(luaControlModeIndex - 1)
  self._controlMode = luaControlModeIndex
end
function PaGlobalFunc_Customization_FaceBone_EnableFaceSlide(enable)
  local self = Customization_FaceBoneInfo
  self:EnableFaceSlide(enable)
end
function PaGlobalFunc_Customization_FaceBone_ShowControlPart()
  local self = Customization_FaceBoneInfo
  showBoneControlPart(self._ui._checkBox_ShowPart:IsCheck())
end
function PaGlobalFunc_Customization_FaceBone_UpperHairChecked()
  local self = Customization_FaceBoneInfo
  setUseFaceCustomizationHair(self._ui._checkBox_ShowUpperHair:IsCheck())
end
function PaGlobalFunc_Customization_FaceBone_SymmetryChecked()
  local self = Customization_FaceBoneInfo
  setSymmetryBoneTransform(self._ui._checkBox_Symmetry:IsCheck())
end
function PaGlobalFunc_Customization_FaceBone_SliderOn(sliderType, sliderIndex)
  local self = Customization_FaceBoneInfo
  if 1 == sliderType then
    self._ui._slider_PositionFocus[sliderIndex]:SetShow(true)
  elseif 2 == sliderType then
    self._ui._slider_RotationFocus[sliderIndex]:SetShow(true)
  elseif 3 == sliderType then
    self._ui._slider_ScaleFocus[sliderIndex]:SetShow(true)
  end
end
function PaGlobalFunc_Customization_FaceBone_SliderOut(sliderType, sliderIndex)
  local self = Customization_FaceBoneInfo
  if 1 == sliderType then
    self._ui._slider_PositionFocus[sliderIndex]:SetShow(false)
  elseif 2 == sliderType then
    self._ui._slider_RotationFocus[sliderIndex]:SetShow(false)
  elseif 3 == sliderType then
    self._ui._slider_ScaleFocus[sliderIndex]:SetShow(false)
  end
end
function PaGlobalFunc_Customization_FaceBone_UpdateSlider(updateControlMode)
  local self = Customization_FaceBoneInfo
  if self._controlMode ~= updateControlMode then
    self:UpdateButtons(updateControlMode)
  end
  PaGlobalFunc_Customization_FaceBone_CursorSelect(updateControlMode)
  if 1 == updateControlMode then
    if true == self._ui._sliderButton_Position[0]:IsEnable() then
      local x = self:CalculateSliderValue(self._ui._slider_Position[0], self._selectedTransMin.x, self._selectedTransMax.x)
      local y = self:CalculateSliderValue(self._ui._slider_Position[1], self._selectedTransMin.y, self._selectedTransMax.y)
      local z = self:CalculateSliderValue(self._ui._slider_Position[2], self._selectedTransMin.z, self._selectedTransMax.z)
      self._currentTranslation.x = x
      self._currentTranslation.y = y
      self._currentTranslation.z = z
      applyTranslationValue(x, y, z)
    end
  elseif 2 == updateControlMode then
    if true == self._ui._slider_Rotation[0]:IsEnable() then
      local x = self:CalculateSliderValue(self._ui._slider_Rotation[0], self._selectedRotMin.x, self._selectedRotMax.x)
      local y = self:CalculateSliderValue(self._ui._slider_Rotation[1], self._selectedRotMin.y, self._selectedRotMax.y)
      local z = self:CalculateSliderValue(self._ui._slider_Rotation[2], self._selectedRotMin.z, self._selectedRotMax.z)
      self._currentRotation.x = x
      self._currentRotation.y = y
      self._currentRotation.z = z
      applyRotationValue(x, y, z)
    end
  elseif 3 == updateControlMode and true == self._ui._slider_Scale[0]:IsEnable() then
    local x = self:CalculateSliderValue(self._ui._slider_Scale[0], self._selectedScaleMin.x, self._selectedScaleMax.x)
    local y = self:CalculateSliderValue(self._ui._slider_Scale[1], self._selectedScaleMin.y, self._selectedScaleMax.y)
    local z = self:CalculateSliderValue(self._ui._slider_Scale[2], self._selectedScaleMin.z, self._selectedScaleMax.z)
    self._currentScale.x = x
    self._currentScale.y = y
    self._currentScale.z = z
    applyScaleValue(x, y, z)
  end
end
function PaGlobalFunc_Customization_FaceBone_AdjustSculptingBoneTranslation(translationX, translationY, translationZ)
  local self = Customization_FaceBoneInfo
  self:SetValueSlider(self._ui._slider_Position[0], translationX, self._selectedTransMin.x, self._selectedTransMax.x)
  self:SetValueSlider(self._ui._slider_Position[1], translationY, self._selectedTransMin.y, self._selectedTransMax.y)
  self:SetValueSlider(self._ui._slider_Position[2], translationZ, self._selectedTransMin.z, self._selectedTransMax.z)
  self._currentTranslation.x = translationX
  self._currentTranslation.y = translationY
  self._currentTranslation.z = translationZ
end
function PaGlobalFunc_Customization_FaceBone_AdjustSculptingBoneRotation(rotationX, rotationY, rotationZ)
  local self = Customization_FaceBoneInfo
  self:SetValueSlider(self._ui._slider_Rotation[0], rotationX, self._selectedRotMin.x, self._selectedRotMax.x)
  self:SetValueSlider(self._ui._slider_Rotation[1], rotationY, self._selectedRotMin.y, self._selectedRotMax.y)
  self:SetValueSlider(self._ui._slider_Rotation[2], rotationZ, self._selectedRotMin.z, self._selectedRotMax.z)
  self._currentRotation.x = rotationX
  self._currentRotation.y = rotationY
  self._currentRotation.z = rotationZ
end
function PaGlobalFunc_Customization_FaceBone_AdjustSculptingBoneScale(scaleX, scaleY, scaleZ)
  local self = Customization_FaceBoneInfo
  self:SetValueSlider(self._ui._slider_Scale[0], scaleX, self._selectedScaleMin.x, self._selectedScaleMax.x)
  self:SetValueSlider(self._ui._slider_Scale[1], scaleY, self._selectedScaleMin.y, self._selectedScaleMax.y)
  self:SetValueSlider(self._ui._slider_Scale[2], scaleZ, self._selectedScaleMin.z, self._selectedScaleMax.z)
  self._currentScale.x = scaleX
  self._currentScale.y = scaleY
  self._currentScale.z = scaleZ
end
function PaGlobalFunc_Customization_FaceBone_SelectSculptingBoneControl(customizationData)
  local self = Customization_FaceBoneInfo
  local radius = customizationData:getSelectedBonePickRadius()
  self:EnableFaceSlide(true)
  self._selectedTransMin = customizationData:getSelectedBoneTranslationMin()
  self._selectedTransMax = customizationData:getSelectedBoneTranslationMax()
  self._selectedRotMin = customizationData:getSelectedBoneRotationMin()
  self._selectedRotMax = customizationData:getSelectedBoneRotationMax()
  self._selectedScaleMin = customizationData:getSelectedBoneScaleMin()
  self._selectedScaleMax = customizationData:getSelectedBoneScaleMax()
  self._currentTranslation = customizationData:getSelectedBoneTranslationValue()
  self._currentRotation = customizationData:getSelectedBoneRotationValue()
  self._currentScale = customizationData:getSelectedBoneScaleValue()
  self:InitSlider()
end
function Customization_FaceBoneInfo:InitSlider()
  if self._currentTranslation ~= nil then
    self:SetValueSlider(self._ui._slider_Position[0], self._currentTranslation.x, self._selectedTransMin.x, self._selectedTransMax.x)
    self:SetValueSlider(self._ui._slider_Position[1], self._currentTranslation.y, self._selectedTransMin.y, self._selectedTransMax.y)
    self:SetValueSlider(self._ui._slider_Position[2], self._currentTranslation.z, self._selectedTransMin.z, self._selectedTransMax.z)
  end
  if self._currentRotation ~= nil then
    self:SetValueSlider(self._ui._slider_Rotation[0], self._currentRotation.x, self._selectedRotMin.x, self._selectedRotMax.x)
    self:SetValueSlider(self._ui._slider_Rotation[1], self._currentRotation.y, self._selectedRotMin.y, self._selectedRotMax.y)
    self:SetValueSlider(self._ui._slider_Rotation[2], self._currentRotation.z, self._selectedRotMin.z, self._selectedRotMax.z)
  end
  if self._currentScale ~= nil then
    self:SetValueSlider(self._ui._slider_Scale[0], self._currentScale.x, self._selectedScaleMin.x, self._selectedScaleMax.x)
    self:SetValueSlider(self._ui._slider_Scale[1], self._currentScale.y, self._selectedScaleMin.y, self._selectedScaleMax.y)
    self:SetValueSlider(self._ui._slider_Scale[2], self._currentScale.z, self._selectedScaleMin.z, self._selectedScaleMax.z)
  end
end
function PaGlobalFunc_Customization_FaceBone_SelectTransformType(transformType)
  local self = Customization_FaceBoneInfo
  PaGlobalFunc_Customization_FaceBone_CursorSelect(transformType + 1)
  self:UpdateButtons(self._controlMode)
end
function Customization_FaceBoneInfo:UpdateButtons(updateControlMode)
end
function Customization_FaceBoneInfo:CalculateSliderValue(sliderControl, valueMin, valueMax)
  local ratio = sliderControl:GetControlPos()
  local val = valueMax - valueMin
  return ratio * val - (val - math.abs(valueMax))
end
function Customization_FaceBoneInfo:SetValueSlider(sliderControl, value, valueMin, valueMax)
  local val = valueMax - valueMin
  if val ~= 0 then
    sliderControl:SetControlPos((value - valueMin) / val * 100)
  end
end
function PaGlobalFunc_Customization_FaceBone_showBoneSculptingSelector(show)
  local self = Customization_FaceBoneInfo
  for index = 0, 2 do
    self._ui._slider_Position[index]:SetControlPos(50)
    self._ui._slider_Rotation[index]:SetControlPos(50)
    self._ui._slider_Scale[index]:SetControlPos(50)
  end
  if true == show then
    PaGlobalFunc_Customization_FaceBone_CursorSelect(1)
    PaGlobalFunc_Customization_FaceBone_ShowControlPart()
    PaGlobalFunc_Customization_FaceBone_SymmetryChecked()
    PaGlobalFunc_Customization_FaceBone_UpperHairChecked()
  end
end
function Customization_FaceBoneInfo:EnableFaceSlide(enable)
  local color = Defines.Color.C_FF444444
  if enable then
    color = Defines.Color.C_FFFFFFFF
  end
  for index = 0, 2 do
    self._ui._slider_Position[index]:SetEnable(enable)
    self._ui._slider_Rotation[index]:SetEnable(enable)
    self._ui._slider_Scale[index]:SetEnable(enable)
    self._ui._sliderButton_Position[index]:SetMonoTone(not enable)
    self._ui._sliderButton_Rotation[index]:SetMonoTone(not enable)
    self._ui._sliderButton_Scale[index]:SetMonoTone(not enable)
    self._ui._staticText_PositionSliderTitle[index]:SetFontColor(color)
    self._ui._staticText_RotationSliderTitle[index]:SetFontColor(color)
    self._ui._staticText_ScaleSliderTitle[index]:SetFontColor(color)
  end
end
function Customization_FaceBoneInfo:InitControl()
  self._ui._checkBox_ShowPart = UI.getChildControl(self._ui._static_ButtonGroup, "CheckButton_ShowPart")
  self._ui._checkBox_Symmetry = UI.getChildControl(self._ui._static_ButtonGroup, "CheckButton_Symmetry")
  self._ui._checkBox_ShowUpperHair = UI.getChildControl(self._ui._static_ButtonGroup, "CheckButton_ShowUpperHair")
  self._ui._checkBox_ShowUpperHair:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATIONFRAME_USEFACECUSTOMIZATIONHAIR"))
  self._ui._button_ResetPart = UI.getChildControl(self._ui._static_ButtonGroup, "Button_ResetPart")
  self._ui._button_ResetAll = UI.getChildControl(self._ui._static_ButtonGroup, "Button_ResetAll")
  self._ui._static_PositionSliderBg = {}
  self._ui._static_PositionSliderBg[0] = UI.getChildControl(self._ui._static_PositionSliderGroup, "Static_XBg")
  self._ui._static_PositionSliderBg[1] = UI.getChildControl(self._ui._static_PositionSliderGroup, "Static_YBg")
  self._ui._static_PositionSliderBg[2] = UI.getChildControl(self._ui._static_PositionSliderGroup, "Static_ZBg")
  self._ui._static_RotationSliderBg = {}
  self._ui._static_RotationSliderBg[0] = UI.getChildControl(self._ui._static_RotationSliderGroup, "Static_XBg")
  self._ui._static_RotationSliderBg[1] = UI.getChildControl(self._ui._static_RotationSliderGroup, "Static_YBg")
  self._ui._static_RotationSliderBg[2] = UI.getChildControl(self._ui._static_RotationSliderGroup, "Static_ZBg")
  self._ui._static_ScaleSliderBg = {}
  self._ui._static_ScaleSliderBg[0] = UI.getChildControl(self._ui._static_ScaleSliderGroup, "Static_XBg")
  self._ui._static_ScaleSliderBg[1] = UI.getChildControl(self._ui._static_ScaleSliderGroup, "Static_YBg")
  self._ui._static_ScaleSliderBg[2] = UI.getChildControl(self._ui._static_ScaleSliderGroup, "Static_ZBg")
  self._ui._staticText_PositionSliderTitle = {}
  self._ui._staticText_RotationSliderTitle = {}
  self._ui._staticText_ScaleSliderTitle = {}
  for index = 0, 2 do
    self._ui._staticText_PositionSliderTitle[index] = UI.getChildControl(self._ui._static_PositionSliderBg[index], "StaticText_Title")
    self._ui._staticText_RotationSliderTitle[index] = UI.getChildControl(self._ui._static_RotationSliderBg[index], "StaticText_Title")
    self._ui._staticText_ScaleSliderTitle[index] = UI.getChildControl(self._ui._static_ScaleSliderBg[index], "StaticText_Title")
  end
  self._ui._slider_Position = {}
  self._ui._slider_Position[0] = UI.getChildControl(self._ui._static_PositionSliderBg[0], "Slider_X")
  self._ui._slider_Position[1] = UI.getChildControl(self._ui._static_PositionSliderBg[1], "Slider_Y")
  self._ui._slider_Position[2] = UI.getChildControl(self._ui._static_PositionSliderBg[2], "Slider_Z")
  self._ui._slider_Rotation = {}
  self._ui._slider_Rotation[0] = UI.getChildControl(self._ui._static_RotationSliderBg[0], "Slider_X")
  self._ui._slider_Rotation[1] = UI.getChildControl(self._ui._static_RotationSliderBg[1], "Slider_Y")
  self._ui._slider_Rotation[2] = UI.getChildControl(self._ui._static_RotationSliderBg[2], "Slider_Z")
  self._ui._slider_Scale = {}
  self._ui._slider_Scale[0] = UI.getChildControl(self._ui._static_ScaleSliderBg[0], "Slider_X")
  self._ui._slider_Scale[1] = UI.getChildControl(self._ui._static_ScaleSliderBg[1], "Slider_Y")
  self._ui._slider_Scale[2] = UI.getChildControl(self._ui._static_ScaleSliderBg[2], "Slider_Z")
  self._ui._sliderButton_Position = {}
  self._ui._sliderButton_Rotation = {}
  self._ui._sliderButton_Scale = {}
  self._ui._slider_PositionFocus = {}
  self._ui._slider_RotationFocus = {}
  self._ui._slider_ScaleFocus = {}
  for index = 0, 2 do
    self._ui._sliderButton_Position[index] = UI.getChildControl(self._ui._slider_Position[index], "Slider_Button")
    self._ui._sliderButton_Rotation[index] = UI.getChildControl(self._ui._slider_Rotation[index], "Slider_Button")
    self._ui._sliderButton_Scale[index] = UI.getChildControl(self._ui._slider_Scale[index], "Slider_Button")
    self._ui._slider_PositionFocus[index] = UI.getChildControl(self._ui._static_PositionSliderBg[index], "Static_FocusBox")
    self._ui._slider_RotationFocus[index] = UI.getChildControl(self._ui._static_RotationSliderBg[index], "Static_FocusBox")
    self._ui._slider_ScaleFocus[index] = UI.getChildControl(self._ui._static_ScaleSliderBg[index], "Static_FocusBox")
    self._ui._slider_PositionFocus[index]:SetShow(false)
    self._ui._slider_RotationFocus[index]:SetShow(false)
    self._ui._slider_ScaleFocus[index]:SetShow(false)
  end
end
function Customization_FaceBoneInfo:InitEvent()
  for index = 0, 2 do
    self._ui._sliderButton_Position[index]:SetIgnore(true)
    self._ui._slider_Position[index]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_Customization_FaceBone_UpdateSlider(1)")
    self._ui._slider_Position[index]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_Customization_FaceBone_UpdateSlider(1)")
    self._ui._slider_Position[index]:addInputEvent("Mouse_On", "PaGlobalFunc_Customization_FaceBone_SliderOn(1," .. index .. ")")
    self._ui._slider_Position[index]:addInputEvent("Mouse_Out", "PaGlobalFunc_Customization_FaceBone_SliderOut(1," .. index .. ")")
    self._ui._sliderButton_Rotation[index]:SetIgnore(true)
    self._ui._slider_Rotation[index]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_Customization_FaceBone_UpdateSlider(2)")
    self._ui._slider_Rotation[index]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_Customization_FaceBone_UpdateSlider(2)")
    self._ui._slider_Rotation[index]:addInputEvent("Mouse_On", "PaGlobalFunc_Customization_FaceBone_SliderOn(2," .. index .. ")")
    self._ui._slider_Rotation[index]:addInputEvent("Mouse_Out", "PaGlobalFunc_Customization_FaceBone_SliderOut(2," .. index .. ")")
    self._ui._sliderButton_Scale[index]:SetIgnore(true)
    self._ui._slider_Scale[index]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "PaGlobalFunc_Customization_FaceBone_UpdateSlider(3)")
    self._ui._slider_Scale[index]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "PaGlobalFunc_Customization_FaceBone_UpdateSlider(3)")
    self._ui._slider_Scale[index]:addInputEvent("Mouse_On", "PaGlobalFunc_Customization_FaceBone_SliderOn(3," .. index .. ")")
    self._ui._slider_Scale[index]:addInputEvent("Mouse_Out", "PaGlobalFunc_Customization_FaceBone_SliderOut(3," .. index .. ")")
  end
  self._ui._checkBox_ShowPart:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_FaceBone_ShowControlPart()")
  self._ui._checkBox_Symmetry:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_FaceBone_SymmetryChecked()")
  self._ui._checkBox_ShowUpperHair:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_FaceBone_UpperHairChecked()")
  self._ui._button_ResetPart:addInputEvent("Mouse_LUp", "clearCustomizedBoneInfo()")
  self._ui._button_ResetAll:addInputEvent("Mouse_LUp", "PaGlobalFunc_CustomIzationCommon_ClearGroupCustomizedBonInfoLua()")
  self._ui._button_Position:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_FaceBone_CursorSelect(1)")
  self._ui._button_Rotation:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_FaceBone_CursorSelect(2)")
  self._ui._button_Scale:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_FaceBone_CursorSelect(3)")
end
function Customization_FaceBoneInfo:InitRegister()
  registerEvent("EventSelectSculptingBoneControl", "PaGlobalFunc_Customization_FaceBone_SelectSculptingBoneControl")
  registerEvent("EventAdjustSculptingBoneTranslation", "PaGlobalFunc_Customization_FaceBone_AdjustSculptingBoneTranslation")
  registerEvent("EventAdjustSculptingBoneRotation", "PaGlobalFunc_Customization_FaceBone_AdjustSculptingBoneRotation")
  registerEvent("EventAdjustSculptingBoneScale", "PaGlobalFunc_Customization_FaceBone_AdjustSculptingBoneScale")
  registerEvent("EventOpenFaceShapeUi", "PaGlobalFunc_Customization_FaceBone_OpenFaceShapeUi")
  registerEvent("EventCloseFaceShapeUi", "PaGlobalFunc_Customization_FaceBone_CloseFaceShapeUi")
  registerEvent("EventShowBoneSculptingSelector", "PaGlobalFunc_Customization_FaceBone_showBoneSculptingSelector")
  registerEvent("EventSelectTransformType", "PaGlobalFunc_Customization_FaceBone_SelectTransformType")
  registerEvent("EventEnableFaceSlide", "PaGlobalFunc_Customization_FaceBone_EnableFaceSlide")
end
function Customization_FaceBoneInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_FromClient_Customization_FaceBone_luaLoadComplete()
  local self = Customization_FaceBoneInfo
  self:Initialize()
end
function PaGlobalFunc_Customization_FaceBone_Close()
  if false == PaGlobalFunc_Customization_FaceBone_GetShow() then
    return
  end
  PaGlobalFunc_Customization_SetCloseFunc(nil)
  PaGlobalFunc_Customization_SetBackEvent()
  PaGlobalFunc_Customization_FaceBone_SetShow(false, false)
end
function PaGlobalFunc_Customization_FaceBone_Open()
  if true == PaGlobalFunc_Customization_FaceBone_GetShow() then
    return
  end
  PaGlobalFunc_Customization_SetCloseFunc(PaGlobalFunc_Customization_FaceBone_Close)
  PaGlobalFunc_Customization_SetBackEvent("PaGlobalFunc_Customization_FaceBone_Close()")
  PaGlobalFunc_Customization_FaceBone_SetShow(true, false)
end
function PaGlobalFunc_Customization_FaceBone_SetShow(isShow, isAni)
  Panel_Customizing_FaceShape:SetShow(isShow, isAni)
end
function PaGlobalFunc_Customization_FaceBone_GetShow()
  return Panel_Customizing_FaceShape:GetShow()
end
PaGlobalFunc_FromClient_Customization_FaceBone_luaLoadComplete()
