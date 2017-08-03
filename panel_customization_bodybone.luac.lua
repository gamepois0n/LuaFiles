-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\panel_customization_bodybone.luac 

-- params : ...
-- function num : 0
local UI_GroupType = CppEnums.PA_CONSOLE_UI_CONTROL_TYPE
local StaticText_DefaultControl = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_DefaultControl")
local RadioButton_Bone_Scale = (UI.getChildControl)(Panel_CustomizationTransformBody, "RadioButton_Bone_Scale")
local StaticText_ScaleX = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_ScaleX")
local StaticText_ScaleY = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_ScaleY")
local StaticText_ScaleZ = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_ScaleZ")
local Slider_ScaleX = (UI.getChildControl)(Panel_CustomizationTransformBody, "Slider_ScaleX_Controller")
local Slider_ScaleY = (UI.getChildControl)(Panel_CustomizationTransformBody, "Slider_ScaleY_Controller")
local Slider_ScaleZ = (UI.getChildControl)(Panel_CustomizationTransformBody, "Slider_ScaleZ_Controller")
local Button_Slider_ScaleX = (UI.getChildControl)(Slider_ScaleX, "Slider_GammaController_Button")
local Button_Slider_ScaleY = (UI.getChildControl)(Slider_ScaleY, "Slider_GammaController_Button")
local Button_Slider_ScaleZ = (UI.getChildControl)(Slider_ScaleZ, "Slider_GammaController_Button")
local StaticText_ControlPart = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_ControlPart")
local CheckButton_ControlPart = (UI.getChildControl)(Panel_CustomizationTransformBody, "CheckButton_ControlPart")
local Button_All_Reset = (UI.getChildControl)(Panel_CustomizationTransformBody, "Button_All_Reset")
local Button_Part_Reset = (UI.getChildControl)(Panel_CustomizationTransformBody, "Button_Part_Reset")
local StaticText_CurrValue_ScaleX = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_Slider_ScaleX_Left")
local StaticText_CurrValue_ScaleY = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_Slider_ScaleY_Left")
local StaticText_CurrValue_ScaleZ = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_Slider_ScaleZ_Left")
local Slider_Height = (UI.getChildControl)(Panel_CustomizationTransformBody, "Slider_Height_Controller")
local Button_Slider_Height = (UI.getChildControl)(Slider_Height, "Slider_GammaController_Button")
local Slider_Weight = (UI.getChildControl)(Panel_CustomizationTransformBody, "Slider_Weight_Controller")
local Button_Slider_Weight = (UI.getChildControl)(Slider_Weight, "Slider_GammaController_Button")
local StaticText_Weight = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_Weight")
local StaticText_Height = (UI.getChildControl)(Panel_CustomizationTransformBody, "StaticText_Height")
StaticText_DefaultControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATIONTRANSFORM_STATICTEXT_DEFAULTCONTROL"))
StaticText_ControlPart:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_CONTROLPART"))
Button_All_Reset:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_ALL_RESET"))
Button_Part_Reset:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_PART_RESET"))
CheckButton_ControlPart:SetCheck(true)
StaticText_Weight:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_WEIGHT"))
StaticText_Height:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_HEIGHT"))
Slider_ScaleX:addInputEvent("Mouse_LPress", "UpdateBodyBoneScale()")
Slider_ScaleY:addInputEvent("Mouse_LPress", "UpdateBodyBoneScale()")
Slider_ScaleZ:addInputEvent("Mouse_LPress", "UpdateBodyBoneScale()")
Button_Slider_ScaleX:addInputEvent("Mouse_LPress", "UpdateBodyBoneScale()")
Button_Slider_ScaleY:addInputEvent("Mouse_LPress", "UpdateBodyBoneScale()")
Button_Slider_ScaleZ:addInputEvent("Mouse_LPress", "UpdateBodyBoneScale()")
Slider_ScaleX:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_ScaleY:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_ScaleZ:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_ScaleX:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_ScaleY:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_ScaleZ:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_Height:addInputEvent("Mouse_LPress", "UpdateBodyHeight()")
Button_Slider_Height:addInputEvent("Mouse_LPress", "UpdateBodyHeight()")
Slider_Weight:addInputEvent("Mouse_LPress", "UpdateBodyWeight()")
Button_Slider_Weight:addInputEvent("Mouse_LPress", "UpdateBodyWeight()")
Slider_Height:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_Height:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_Weight:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_Weight:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_All_Reset:addInputEvent("Mouse_LUp", "clearGroupCustomizedBonInfoLua()")
Button_Part_Reset:addInputEvent("Mouse_LUp", "clearCustomizedBoneInfo()")
CheckButton_ControlPart:addInputEvent("Mouse_LUp", "ToggleShowBodyBoneControlPart()")
registerEvent("EventShowBodyBoneEditor", "ShowBodyBoneEditor")
registerEvent("EventPickingBodyBone", "PickingBodyBone")
registerEvent("EventAdjustBodyBoneScale", "AdjustBodyBoneScale")
registerEvent("EventOpenBodyShapeUi", "OpenBodyShapeUi")
registerEvent("EventCloseBodyShapeUi", "CloseBodyShapeUi")
registerEvent("EventEnableBodySlide", "EnableBodySlide")
local scaleMin, scaleMax, currentScale, selectedClassType = nil, nil, nil, nil
local SculptingUIRect = {left, top, right, bottom}
local selectedCharacterClass = -1
local sliderTextGap = 3
local contentsGapHeight = 10
local selectedClassIndex = nil
local currentclassType = -1
local currentuiId = -1
local InitBodyBoneControls = function()
  -- function num : 0_0 , upvalues : currentScale, Slider_ScaleX, scaleMin, scaleMax, Slider_ScaleY, Slider_ScaleZ
  if currentScale ~= nil then
    setValueSlider(Slider_ScaleX, currentScale.x, scaleMin.x, scaleMax.x)
    setValueSlider(Slider_ScaleY, currentScale.y, scaleMin.y, scaleMax.y)
    setValueSlider(Slider_ScaleZ, currentScale.z, scaleMin.z, scaleMax.z)
  end
end

local floatString = function(floatValue)
  -- function num : 0_1
  return (string.format)("%.2f", floatValue)
end

local bonInfoPostFunction = function()
  -- function num : 0_2 , upvalues : Slider_Height, Slider_Weight
  Slider_Height:SetControlPos(getCustomizationBodyHeight())
  Slider_Weight:SetControlPos(getCustomizationBodyWeight())
end

pushClearGroupCustomizedBonInfoPostFunction(bonInfoPostFunction)
UpdateBodyHeight = function()
  -- function num : 0_3 , upvalues : selectedClassType, Slider_Height
  applyBodyHeight(selectedClassType, Slider_Height:GetControlPos() * 100)
  setGlobalCheck(true)
end

UpdateBodyWeight = function()
  -- function num : 0_4 , upvalues : selectedClassType, Slider_Weight
  applyBodyWeight(selectedClassType, Slider_Weight:GetControlPos() * 100)
  setGlobalCheck(true)
end

historyInit = function()
  -- function num : 0_5 , upvalues : bonInfoPostFunction, selectedClassType
  bonInfoPostFunction()
  selectedClassType = (getSelfPlayer()):getClassType()
end

UpdateBodyBoneScale = function()
  -- function num : 0_6 , upvalues : Slider_ScaleX, scaleMin, scaleMax, Slider_ScaleY, Slider_ScaleZ, currentScale, StaticText_CurrValue_ScaleX, StaticText_CurrValue_ScaleY, StaticText_CurrValue_ScaleZ
  local x = calculateSliderValue(Slider_ScaleX, scaleMin.x, scaleMax.x)
  local y = calculateSliderValue(Slider_ScaleY, scaleMin.y, scaleMax.y)
  local z = calculateSliderValue(Slider_ScaleZ, scaleMin.z, scaleMax.z)
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R3 in 'UnsetPending'

  currentScale.x = x
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R3 in 'UnsetPending'

  currentScale.y = y
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R3 in 'UnsetPending'

  currentScale.z = z
  applyScaleValue(x, y, z)
  StaticText_CurrValue_ScaleX:SetText((math.floor)(x * 100) / 100)
  StaticText_CurrValue_ScaleY:SetText((math.floor)(y * 100) / 100)
  StaticText_CurrValue_ScaleZ:SetText((math.floor)(z * 100) / 100)
  StaticText_CurrValue_ScaleX:SetShow(false)
  StaticText_CurrValue_ScaleY:SetShow(false)
  StaticText_CurrValue_ScaleZ:SetShow(false)
end

OpenBodyShapeUi = function(classType, uiId, historyapply)
  -- function num : 0_7 , upvalues : UI_GroupType, Button_Slider_ScaleX, Button_Slider_ScaleY, Button_Slider_ScaleZ, CheckButton_ControlPart, Button_Part_Reset, Button_All_Reset, Button_Slider_Height, Button_Slider_Weight, currentclassType, currentuiId, selectedClassType
  if historyapply == nil then
    Set_CustomizationUIPanel(0, Panel_CustomizationFrame, 10)
    ClearAll_CustomizationUIGroup(0)
    Add_CustomizationUIGroup(0, 0, UI_GroupType.eCONSOLE_UI_CONTROL_TYPE_CUSTOMIZATION)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsolePrevFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB2)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsoleNextFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB2)
    Set_CustomizationUIgroupCurrentIndex(0, 0, 0, 3)
    local maxcountx = 2
    local maxcountx = 7
    Add_CustomizationUIControl(0, 0, 0, 0, maxcountx, maxcountx, Button_Slider_ScaleX)
    Add_CustomizationUIControl(0, 0, 0, 1, maxcountx, maxcountx, Button_Slider_ScaleY)
    Add_CustomizationUIControl(0, 0, 0, 2, maxcountx, maxcountx, Button_Slider_ScaleZ)
    Add_CustomizationUIControl(0, 0, 0, 3, maxcountx, maxcountx, CheckButton_ControlPart)
    Add_CustomizationUIControl(0, 0, 0, 4, maxcountx, maxcountx, Button_Part_Reset)
    Add_CustomizationUIControl(0, 0, 1, 4, maxcountx, maxcountx, Button_All_Reset)
    Add_CustomizationUIControl(0, 0, 0, 5, maxcountx, maxcountx, Button_Slider_Height)
    Add_CustomizationUIControl(0, 0, 0, 6, maxcountx, maxcountx, Button_Slider_Weight)
  end
  do
    globalcurrentclassType = classType
    globalcurrentuiId = uiId
    currentclassType = classType
    currentuiId = uiId
    selectedClassType = classType
    startBodyPickingMode()
    EnableBodySlide(false)
    ShowBodyBoneEditor()
    if CheckButton_ControlPart:IsCheck() then
      showBoneControlPart(true)
    else
      showBoneControlPart(false)
    end
  end
end

CloseBodyShapeUi = function()
  -- function num : 0_8
  endPickingMode()
  ToggleShowPosePreCheck()
  globalcurrentclassType = -2
  globalcurrentuiId = -2
  globalisCustomizationPicking = false
end

ShowBodyBoneEditor = function()
  -- function num : 0_9 , upvalues : Slider_ScaleX, Slider_ScaleY, Slider_ScaleZ, Slider_Height, Slider_Weight, StaticText_CurrValue_ScaleX, StaticText_CurrValue_ScaleY, StaticText_CurrValue_ScaleZ, RadioButton_Bone_Scale
  Slider_ScaleX:SetControlPos(50)
  Slider_ScaleY:SetControlPos(50)
  Slider_ScaleZ:SetControlPos(50)
  Slider_Height:SetControlPos(getCustomizationBodyHeight())
  Slider_Weight:SetControlPos(getCustomizationBodyWeight())
  StaticText_CurrValue_ScaleX:SetText(0)
  StaticText_CurrValue_ScaleY:SetText(0)
  StaticText_CurrValue_ScaleZ:SetText(0)
  setSymmetryBoneTransform(true)
  RadioButton_Bone_Scale:SetCheck(true)
  CursorSelect(3)
  updateGroupFrameControls(Panel_CustomizationTransformBody:GetSizeY(), Panel_CustomizationTransformBody)
  StaticText_CurrValue_ScaleX:SetShow(false)
  StaticText_CurrValue_ScaleY:SetShow(false)
  StaticText_CurrValue_ScaleZ:SetShow(false)
end

ToggleShowBodyBoneControlPart = function()
  -- function num : 0_10 , upvalues : CheckButton_ControlPart
  showBoneControlPart(CheckButton_ControlPart:IsCheck())
end

PickingBodyBone = function(customizationData)
  -- function num : 0_11 , upvalues : scaleMin, scaleMax, currentScale, InitBodyBoneControls
  scaleMin = customizationData:getSelectedBoneScaleMin()
  scaleMax = customizationData:getSelectedBoneScaleMax()
  currentScale = customizationData:getSelectedBoneScaleValue()
  EnableBodySlide(true)
  InitBodyBoneControls()
end

EnableBodySlide = function(enable)
  -- function num : 0_12 , upvalues : StaticText_ScaleX, StaticText_ScaleY, StaticText_ScaleZ, Slider_ScaleX, Slider_ScaleY, Slider_ScaleZ, Slider_Weight, StaticText_Weight, Slider_Height, StaticText_Height
  globalisCustomizationPicking = enable
  local color = (Defines.Color).C_FF444444
  if enable then
    color = (Defines.Color).C_FFFFFFFF
  end
  StaticText_ScaleX:SetFontColor(color)
  StaticText_ScaleY:SetFontColor(color)
  StaticText_ScaleZ:SetFontColor(color)
  Slider_ScaleX:SetMonoTone(not enable)
  Slider_ScaleY:SetMonoTone(not enable)
  Slider_ScaleZ:SetMonoTone(not enable)
  Slider_ScaleX:SetEnable(enable)
  Slider_ScaleY:SetEnable(enable)
  Slider_ScaleZ:SetEnable(enable)
  color = (Defines.Color).C_FFFFFFFF
  if enable then
    color = (Defines.Color).C_FF444444
  end
  Slider_Weight:SetMonoTone(enable)
  Slider_Weight:SetEnable(not enable)
  StaticText_Weight:SetFontColor(color)
  Slider_Height:SetMonoTone(enable)
  Slider_Height:SetEnable(not enable)
  StaticText_Height:SetFontColor(color)
end

AdjustBodyBoneScale = function(scaleX, scaleY, scaleZ)
  -- function num : 0_13 , upvalues : floatString, Slider_ScaleX, scaleMin, scaleMax, Slider_ScaleY, Slider_ScaleZ, currentScale
  local self = sculptingBoneSettingUI
  ;
  ((self.EditText)[self.PARAM_SCALEVALX]):SetEditText(floatString(scaleX))
  ;
  ((self.EditText)[self.PARAM_SCALEVALY]):SetEditText(floatString(scaleY))
  ;
  ((self.EditText)[self.PARAM_SCALEVALZ]):SetEditText(floatString(scaleZ))
  setValueSlider(Slider_ScaleX, scaleX, scaleMin.x, scaleMax.x)
  setValueSlider(Slider_ScaleY, scaleY, scaleMin.y, scaleMax.y)
  setValueSlider(Slider_ScaleZ, scaleZ, scaleMin.z, scaleMax.z)
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R4 in 'UnsetPending'

  currentScale.x = scaleX
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R4 in 'UnsetPending'

  currentScale.y = scaleY
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R4 in 'UnsetPending'

  currentScale.z = scaleZ
end

BodyBoneHistoryApplyUpdate = function()
  -- function num : 0_14 , upvalues : currentclassType, currentuiId
  if globalcurrentclassType ~= currentclassType or globalcurrentuiId ~= currentuiId then
    return 
  end
  OpenBodyShapeUi(currentclassType, currentuiId, true)
  PickingBodyBone(ToClient_getCharacterCustomizationUiWrapper())
end


