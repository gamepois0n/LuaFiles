-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\panel_customization_hairshape.luac 

-- params : ...
-- function num : 0
local RadioButton_Bone_Trans = (UI.getChildControl)(Panel_CustomizationTransformHair, "RadioButton_Bone_Trans")
local RadioButton_Bone_Rot = (UI.getChildControl)(Panel_CustomizationTransformHair, "RadioButton_Bone_Rot")
local StaticText_DefaultControl = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_DefaultControl")
local StaticText_ControlPart = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_ControlPart")
local StaticText_TransX = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_TransX")
local StaticText_TransY = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_TransY")
local StaticText_TransZ = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_TransZ")
local Slider_TransX = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_TransX_Controller")
local Slider_TransY = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_TransY_Controller")
local Slider_TransZ = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_TransZ_Controller")
local Button_Slider_TransX = (UI.getChildControl)(Slider_TransX, "Slider_GammaController_Button")
local Button_Slider_TransY = (UI.getChildControl)(Slider_TransY, "Slider_GammaController_Button")
local Button_Slider_TransZ = (UI.getChildControl)(Slider_TransZ, "Slider_GammaController_Button")
local StaticText_RotX = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_RotX")
local StaticText_RotY = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_RotY")
local StaticText_RotZ = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_RotZ")
local Slider_RotX = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_RotX_Controller")
local Slider_RotY = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_RotY_Controller")
local Slider_RotZ = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_RotZ_Controller")
local Button_Slider_RotX = (UI.getChildControl)(Slider_RotX, "Slider_GammaController_Button")
local Button_Slider_RotY = (UI.getChildControl)(Slider_RotY, "Slider_GammaController_Button")
local Button_Slider_RotZ = (UI.getChildControl)(Slider_RotZ, "Slider_GammaController_Button")
local SliderArr = {}
local Button_SliderArr = {}
local StaticTextArr = {}
local StaticText_CurrentValue = {}
SliderArr[1] = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_Controller1")
SliderArr[2] = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_Controller2")
SliderArr[3] = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_Controller3")
SliderArr[4] = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_Controller4")
SliderArr[5] = (UI.getChildControl)(Panel_CustomizationTransformHair, "Slider_Controller5")
Button_SliderArr[1] = (UI.getChildControl)(SliderArr[1], "Slider_GammaController_Button")
Button_SliderArr[2] = (UI.getChildControl)(SliderArr[2], "Slider_GammaController_Button")
Button_SliderArr[3] = (UI.getChildControl)(SliderArr[3], "Slider_GammaController_Button")
Button_SliderArr[4] = (UI.getChildControl)(SliderArr[4], "Slider_GammaController_Button")
Button_SliderArr[5] = (UI.getChildControl)(SliderArr[5], "Slider_GammaController_Button")
StaticTextArr[1] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderDesc1")
StaticTextArr[2] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderDesc2")
StaticTextArr[3] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderDesc3")
StaticTextArr[4] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderDesc4")
StaticTextArr[5] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderDesc5")
StaticText_CurrentValue[1] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderValue1")
StaticText_CurrentValue[2] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderValue2")
StaticText_CurrentValue[3] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderValue3")
StaticText_CurrentValue[4] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderValue4")
StaticText_CurrentValue[5] = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_SliderValue5")
local CheckButton_ControlPart = (UI.getChildControl)(Panel_CustomizationTransformHair, "CheckButton_ControlPart")
local Button_All_Reset = (UI.getChildControl)(Panel_CustomizationTransformHair, "Button_All_Reset")
local Button_Part_Reset = (UI.getChildControl)(Panel_CustomizationTransformHair, "Button_Part_Reset")
local StaticText_CurrValue_TransX = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_Slider_TransX_Left")
local StaticText_CurrValue_TransY = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_Slider_TransY_Left")
local StaticText_CurrValue_TransZ = (UI.getChildControl)(Panel_CustomizationTransformHair, "StaticText_Slider_TransZ_Left")
StaticText_CurrValue_TransX:SetShow(false)
StaticText_CurrValue_TransY:SetShow(false)
StaticText_CurrValue_TransZ:SetShow(false)
StaticText_DefaultControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATIONTRANSFORM_STATICTEXT_DEFAULTCONTROL"))
StaticText_ControlPart:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_CONTROLPART"))
Button_All_Reset:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_ALL_RESET"))
Button_Part_Reset:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_PART_RESET"))
CheckButton_ControlPart:SetCheck(true)
RadioButton_Bone_Trans:addInputEvent("Mouse_LUp", "CursorSelect(1)")
RadioButton_Bone_Rot:addInputEvent("Mouse_LUp", "CursorSelect(2)")
Slider_TransX:addInputEvent("Mouse_LPress", "UpdateHairBone(1)")
Slider_TransY:addInputEvent("Mouse_LPress", "UpdateHairBone(1)")
Slider_TransZ:addInputEvent("Mouse_LPress", "UpdateHairBone(1)")
Button_Slider_TransX:addInputEvent("Mouse_LPress", "UpdateHairBone(1)")
Button_Slider_TransY:addInputEvent("Mouse_LPress", "UpdateHairBone(1)")
Button_Slider_TransZ:addInputEvent("Mouse_LPress", "UpdateHairBone(1)")
Slider_RotX:addInputEvent("Mouse_LPress", "UpdateHairBone(2)")
Slider_RotY:addInputEvent("Mouse_LPress", "UpdateHairBone(2)")
Slider_RotZ:addInputEvent("Mouse_LPress", "UpdateHairBone(2)")
Button_Slider_RotX:addInputEvent("Mouse_LPress", "UpdateHairBone(2)")
Button_Slider_RotY:addInputEvent("Mouse_LPress", "UpdateHairBone(2)")
Button_Slider_RotZ:addInputEvent("Mouse_LPress", "UpdateHairBone(2)")
Slider_TransX:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_TransY:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_TransZ:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_TransX:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_TransY:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_TransZ:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_RotX:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_RotY:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_RotZ:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_RotX:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_RotY:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_RotZ:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(SliderArr[1]):addInputEvent("Mouse_LPress", "UpdateHairSlider(0)")
;
(SliderArr[2]):addInputEvent("Mouse_LPress", "UpdateHairSlider(1)")
;
(SliderArr[3]):addInputEvent("Mouse_LPress", "UpdateHairSlider(2)")
;
(SliderArr[4]):addInputEvent("Mouse_LPress", "UpdateHairSlider(3)")
;
(SliderArr[5]):addInputEvent("Mouse_LPress", "UpdateHairSlider(4)")
;
(Button_SliderArr[1]):addInputEvent("Mouse_LPress", "UpdateHairSlider(0)")
;
(Button_SliderArr[2]):addInputEvent("Mouse_LPress", "UpdateHairSlider(1)")
;
(Button_SliderArr[3]):addInputEvent("Mouse_LPress", "UpdateHairSlider(2)")
;
(Button_SliderArr[4]):addInputEvent("Mouse_LPress", "UpdateHairSlider(3)")
;
(Button_SliderArr[5]):addInputEvent("Mouse_LPress", "UpdateHairSlider(4)")
;
(SliderArr[1]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(SliderArr[2]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(SliderArr[3]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(SliderArr[4]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(SliderArr[5]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(Button_SliderArr[1]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(Button_SliderArr[2]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(Button_SliderArr[3]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(Button_SliderArr[4]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
;
(Button_SliderArr[5]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_All_Reset:addInputEvent("Mouse_LUp", "clearGroupCustomizedBonInfoLua()")
Button_Part_Reset:addInputEvent("Mouse_LUp", "clearCustomizedBoneInfo()")
CheckButton_ControlPart:addInputEvent("Mouse_LUp", "ToggleShowHairBoneControlPart()")
registerEvent("EventOpenHairShapeUi", "OpenHairShapeUi")
registerEvent("EventCloseHairShapeUi", "CloseHairShapeUi")
registerEvent("EventOpenHairShapeUiWithoutBoneControl", "OpenHairShapeUiWithoutBoneControl")
registerEvent("EventCloseHairShapeUiWithoutBoneControl", "CloseHairShapeUiWithoutBoneControl")
registerEvent("EventPickingHairBone", "PickingHairBone")
registerEvent("EventAdjustHairBoneTranslation", "AdjustHairBoneTranslation")
registerEvent("EventAdjustHairBoneRotation", "AdjustHairBoneRotation")
registerEvent("EventEnableHairSlide", "EnableHairSlide")
local transMin, transMax, currentTranslation, rotMin, rotMax, currentRotation = nil, nil, nil, nil, nil, nil
local paramType = {}
local paramIndex = {}
local SculptingUIRect = {left, top, right, bottom}
local selectedClassType = -1
local sliderContentsStartY = 125
local sliderTextGap = 3
local contentsGapHeight = 10
local selectedClassIndex = 0
local param = {}
local paramMin = {}
local paramMax = {}
local paramDefault = {}
local iswithoutbone = true
local currentclassType = -1
local currentuiId = -1
local checktransrot = 1
local UpdateHairBoneControls = function()
  -- function num : 0_0 , upvalues : currentTranslation, Slider_TransX, transMin, transMax, Slider_TransY, Slider_TransZ, currentRotation, Slider_RotX, rotMin, rotMax, Slider_RotY, Slider_RotZ
  if currentTranslation ~= nil then
    setValueSlider(Slider_TransX, currentTranslation.x, transMin.x, transMax.x)
    setValueSlider(Slider_TransY, currentTranslation.y, transMin.y, transMax.y)
    setValueSlider(Slider_TransZ, currentTranslation.z, transMin.z, transMax.z)
  end
  if currentRotation ~= nil then
    setValueSlider(Slider_RotX, currentRotation.x, rotMin.x, rotMax.x)
    setValueSlider(Slider_RotY, currentRotation.y, rotMin.y, rotMax.y)
    setValueSlider(Slider_RotZ, currentRotation.z, rotMin.z, rotMax.z)
  end
end

local floatString = function(floatValue)
  -- function num : 0_1
  return (string.format)("%.2f", floatValue)
end

local ShowBoneControls = function(show)
  -- function num : 0_2 , upvalues : StaticText_DefaultControl, RadioButton_Bone_Trans, StaticText_TransX, StaticText_TransY, StaticText_TransZ, Slider_TransX, Slider_TransY, Slider_TransZ, RadioButton_Bone_Rot, StaticText_RotX, StaticText_RotY, StaticText_RotZ, Slider_RotX, Slider_RotY, Slider_RotZ, StaticText_ControlPart, CheckButton_ControlPart, Button_Part_Reset, Button_All_Reset
  StaticText_DefaultControl:SetShow(show)
  RadioButton_Bone_Trans:SetShow(show)
  StaticText_TransX:SetShow(show)
  StaticText_TransY:SetShow(show)
  StaticText_TransZ:SetShow(show)
  Slider_TransX:SetShow(show)
  Slider_TransY:SetShow(show)
  Slider_TransZ:SetShow(show)
  RadioButton_Bone_Rot:SetShow(show)
  StaticText_RotX:SetShow(show)
  StaticText_RotY:SetShow(show)
  StaticText_RotZ:SetShow(show)
  Slider_RotX:SetShow(show)
  Slider_RotY:SetShow(show)
  Slider_RotZ:SetShow(show)
  StaticText_ControlPart:SetShow(show)
  CheckButton_ControlPart:SetShow(show)
  Button_Part_Reset:SetShow(show)
  Button_All_Reset:SetShow(show)
end

local EnableSlide = function(static1, static2, slide, enable)
  -- function num : 0_3
  local color = (Defines.Color).C_FF444444
  if enable then
    color = (Defines.Color).C_FFFFFFFF
  end
  slide:SetMonoTone(not enable)
  slide:SetEnable(enable)
  static1:SetFontColor(color)
  static2:SetFontColor(color)
end

local UpdateHairRadioButtons = function(updateControlMode)
  -- function num : 0_4 , upvalues : RadioButton_Bone_Trans, RadioButton_Bone_Rot
  if updateControlMode == 1 then
    RadioButton_Bone_Trans:SetCheck(true)
    RadioButton_Bone_Rot:SetCheck(false)
  else
    if updateControlMode == 2 then
      RadioButton_Bone_Trans:SetCheck(false)
      RadioButton_Bone_Rot:SetCheck(true)
    end
  end
end

UpdateHairBone = function(updateControlMode)
  -- function num : 0_5 , upvalues : UpdateHairRadioButtons, Slider_TransX, transMin, transMax, Slider_TransY, Slider_TransZ, currentTranslation, checktransrot, Slider_RotX, rotMin, rotMax, Slider_RotY, Slider_RotZ, currentRotation
  if ControlMode ~= updateControlMode then
    UpdateHairRadioButtons(updateControlMode)
  end
  CursorSelect(updateControlMode)
  if updateControlMode == 1 then
    local x = calculateSliderValue(Slider_TransX, transMin.x, transMax.x)
    local y = calculateSliderValue(Slider_TransY, transMin.y, transMax.y)
    local z = calculateSliderValue(Slider_TransZ, transMin.z, transMax.z)
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R4 in 'UnsetPending'

    currentTranslation.x = x
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R4 in 'UnsetPending'

    currentTranslation.y = y
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R4 in 'UnsetPending'

    currentTranslation.z = z
    applyTranslationValue(x, y, z)
    checktransrot = 1
  else
    do
      if updateControlMode == 2 then
        local x = calculateSliderValue(Slider_RotX, rotMin.x, rotMax.x)
        local y = calculateSliderValue(Slider_RotY, rotMin.y, rotMax.y)
        local z = calculateSliderValue(Slider_RotZ, rotMin.z, rotMax.z)
        -- DECOMPILER ERROR at PC70: Confused about usage of register: R4 in 'UnsetPending'

        currentRotation.x = x
        -- DECOMPILER ERROR at PC72: Confused about usage of register: R4 in 'UnsetPending'

        currentRotation.y = y
        -- DECOMPILER ERROR at PC74: Confused about usage of register: R4 in 'UnsetPending'

        currentRotation.z = z
        checktransrot = 2
        applyRotationValue(x, y, z)
      end
    end
  end
end

UpdateHairSlider = function(sliderIndex)
  -- function num : 0_6 , upvalues : SliderArr, paramMin, paramMax, selectedClassType, paramType, paramIndex, StaticText_CurrentValue, Slider_TransX, iswithoutbone
  local luaSliderIndex = sliderIndex + 1
  local value = getSliderValue(SliderArr[luaSliderIndex], paramMin[luaSliderIndex], paramMax[luaSliderIndex])
  setParam(selectedClassType, paramType[luaSliderIndex], paramIndex[luaSliderIndex], value)
  ;
  (StaticText_CurrentValue[luaSliderIndex]):SetText(value)
  if Slider_TransX:IsEnable() == false or iswithoutbone then
    setGlobalCheck(true)
  end
end

OpenHairShapeUi = function(classType, uiId)
  -- function num : 0_7 , upvalues : iswithoutbone, currentclassType, currentuiId, selectedClassType, checktransrot, ShowBoneControls, StaticText_ControlPart, CheckButton_ControlPart, Button_Part_Reset, Button_All_Reset, contentsGapHeight, paramType, paramIndex, paramMin, paramMax, paramDefault, EnableSlide, StaticTextArr, StaticText_CurrentValue, SliderArr, sliderTextGap, UpdateHairRadioButtons
  iswithoutbone = false
  globalcurrentclassType = classType
  globalcurrentuiId = uiId
  currentclassType = classType
  currentuiId = uiId
  selectedClassType = classType
  CameraLookEnable(false)
  CursorSelect(checktransrot)
  EnableHairSlide(false)
  startHairPickingMode()
  selectedClassType = classType
  ShowBoneControls(true)
  local defaultContentsIndex = 0
  local sliderNum = getUiSliderCount(classType, uiId, defaultContentsIndex)
  local controlPosY = 206
  StaticText_ControlPart:SetPosY(controlPosY)
  controlPosY = controlPosY + 2
  CheckButton_ControlPart:SetPosY(controlPosY)
  controlPosY = controlPosY + CheckButton_ControlPart:GetSizeY() + 5
  Button_Part_Reset:SetPosY(controlPosY)
  Button_All_Reset:SetPosY(controlPosY)
  controlPosY = controlPosY + Button_Part_Reset:GetSizeY() + contentsGapHeight
  local meshParamType = 1
  local curlRange = getCurlLengthRange()
  local sliderValueBasePosX = 0
  for sliderIndex = 0, sliderNum - 1 do
    local luaSliderIndex = sliderIndex + 1
    -- DECOMPILER ERROR at PC73: Confused about usage of register: R13 in 'UnsetPending'

    paramType[luaSliderIndex] = getUiSliderParamType(classType, uiId, defaultContentsIndex, sliderIndex)
    -- DECOMPILER ERROR at PC81: Confused about usage of register: R13 in 'UnsetPending'

    paramIndex[luaSliderIndex] = getUiSliderParamIndex(classType, uiId, defaultContentsIndex, sliderIndex)
    local sliderText = getUiSliderDescName(classType, uiId, defaultContentsIndex, sliderIndex)
    local param = getParam(paramType[luaSliderIndex], paramIndex[luaSliderIndex])
    -- DECOMPILER ERROR at PC102: Confused about usage of register: R15 in 'UnsetPending'

    if sliderIndex >= 0 and sliderIndex < 3 then
      paramMin[luaSliderIndex] = getHairMinLength(sliderIndex)
      -- DECOMPILER ERROR at PC111: Confused about usage of register: R15 in 'UnsetPending'

      paramMax[luaSliderIndex] = getParamMax(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
      -- DECOMPILER ERROR at PC120: Confused about usage of register: R15 in 'UnsetPending'

      paramDefault[luaSliderIndex] = getParamDefault(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
      if paramMin[luaSliderIndex] == paramMax[luaSliderIndex] then
        EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], false)
      else
        EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], true)
      end
    else
      if sliderIndex == 3 then
        local curlRange = getCurlLengthRange()
        -- DECOMPILER ERROR at PC154: Confused about usage of register: R16 in 'UnsetPending'

        paramMin[luaSliderIndex] = 50 - curlRange / 2
        -- DECOMPILER ERROR at PC158: Confused about usage of register: R16 in 'UnsetPending'

        paramMax[luaSliderIndex] = 50 + curlRange / 2
        -- DECOMPILER ERROR at PC167: Confused about usage of register: R16 in 'UnsetPending'

        paramDefault[luaSliderIndex] = getParamDefault(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
        if curlRange == 0 then
          EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], false)
        else
          EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], true)
        end
      else
        do
          -- DECOMPILER ERROR at PC200: Confused about usage of register: R15 in 'UnsetPending'

          if sliderIndex == 4 then
            paramMin[luaSliderIndex] = getParamMin(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
            -- DECOMPILER ERROR at PC209: Confused about usage of register: R15 in 'UnsetPending'

            paramMax[luaSliderIndex] = getParamMax(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
            -- DECOMPILER ERROR at PC218: Confused about usage of register: R15 in 'UnsetPending'

            paramDefault[luaSliderIndex] = getParamDefault(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
            if curlRange == 0 then
              EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], false)
            else
              EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], true)
            end
          end
          ;
          (StaticTextArr[luaSliderIndex]):SetText(PAGetString(Defines.StringSheet_GAME, sliderText))
          ;
          (StaticText_CurrentValue[luaSliderIndex]):SetText(param)
          setSliderValue(SliderArr[luaSliderIndex], param, paramMin[luaSliderIndex], paramMax[luaSliderIndex])
          ;
          (StaticTextArr[luaSliderIndex]):SetPosY(controlPosY)
          ;
          (SliderArr[luaSliderIndex]):SetPosY(controlPosY + sliderTextGap)
          ;
          (StaticText_CurrentValue[luaSliderIndex]):SetPosY(controlPosY + sliderTextGap)
          local sliderTextSizeX = (StaticTextArr[luaSliderIndex]):GetPosX() + (StaticTextArr[luaSliderIndex]):GetTextSizeX()
          do
            local sliderValuePosX = (StaticText_CurrentValue[luaSliderIndex]):GetPosX()
            if sliderValuePosX < sliderTextSizeX then
              sliderValueBasePosX = (math.max)(sliderValueBasePosX, sliderTextSizeX)
            end
            controlPosY = controlPosY + contentsGapHeight + (StaticTextArr[luaSliderIndex]):GetSizeY()
            -- DECOMPILER ERROR at PC308: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC308: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC308: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC308: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC308: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  if sliderValueBasePosX > 0 then
    for sliderIndex = 0, sliderNum - 1 do
      local luaSliderIndex = sliderIndex + 1
      local sliderValuePosX = (StaticText_CurrentValue[luaSliderIndex]):GetPosX()
      ;
      (StaticText_CurrentValue[luaSliderIndex]):SetPosX(sliderValueBasePosX + 5)
      ;
      (SliderArr[luaSliderIndex]):SetSize(174 - (sliderValueBasePosX - sliderValuePosX), (SliderArr[luaSliderIndex]):GetSizeY())
      ;
      (SliderArr[luaSliderIndex]):SetPosX(95 + (sliderValueBasePosX - sliderValuePosX) + 5)
      -- DECOMPILER ERROR at PC349: Confused about usage of register: R14 in 'UnsetPending'

      paramType[luaSliderIndex] = getUiSliderParamType(classType, uiId, defaultContentsIndex, sliderIndex)
      -- DECOMPILER ERROR at PC357: Confused about usage of register: R14 in 'UnsetPending'

      paramIndex[luaSliderIndex] = getUiSliderParamIndex(classType, uiId, defaultContentsIndex, sliderIndex)
      local sliderParam = getParam(paramType[luaSliderIndex], paramIndex[luaSliderIndex])
      setSliderValue(SliderArr[luaSliderIndex], sliderParam, paramMin[luaSliderIndex], paramMax[luaSliderIndex])
      ;
      (SliderArr[luaSliderIndex]):SetInterval(100)
    end
  end
  do
    Panel_CustomizationTransformHair:SetSize(Panel_CustomizationTransformHair:GetSizeX(), controlPosY)
    UpdateHairRadioButtons(checktransrot)
    updateGroupFrameControls(Panel_CustomizationTransformHair:GetSizeY(), Panel_CustomizationTransformHair)
    ToggleShowHairBoneControlPart()
  end
end

OpenHairShapeUiWithoutBoneControl = function(classType, uiId)
  -- function num : 0_8 , upvalues : iswithoutbone, currentclassType, currentuiId, selectedClassType, ShowBoneControls, StaticText_CurrentValue, SliderArr, paramType, paramIndex, paramMin, paramMax, paramDefault, EnableSlide, StaticTextArr, sliderTextGap, contentsGapHeight
  iswithoutbone = true
  globalcurrentclassType = classType
  globalcurrentuiId = uiId
  currentclassType = classType
  currentuiId = uiId
  selectedClassType = classType
  CameraLookEnable(false)
  ShowBoneControls(false)
  local controlPosY = 10
  local defaultContentsIndex = 0
  sliderCount = getUiSliderCount(classType, uiId, defaultContentsIndex)
  local meshParamType = 1
  local curlRange = getCurlLengthRange()
  for sliderIndex = 0, sliderCount - 1 do
    local luaSliderIndex = sliderIndex + 1
    if (CppEnums.CountryType).TH_ALPHA == getGameServiceType() or (CppEnums.CountryType).TH_REAL == getGameServiceType() then
      (StaticText_CurrentValue[luaSliderIndex]):SetPosX(95)
      ;
      (SliderArr[luaSliderIndex]):SetPosX(120)
      ;
      (SliderArr[luaSliderIndex]):SetSize(144, (SliderArr[luaSliderIndex]):GetSizeY())
    end
    -- DECOMPILER ERROR at PC70: Confused about usage of register: R11 in 'UnsetPending'

    paramType[luaSliderIndex] = getUiSliderParamType(classType, uiId, defaultContentsIndex, sliderIndex)
    -- DECOMPILER ERROR at PC78: Confused about usage of register: R11 in 'UnsetPending'

    paramIndex[luaSliderIndex] = getUiSliderParamIndex(classType, uiId, defaultContentsIndex, sliderIndex)
    local sliderText = getUiSliderDescName(classType, uiId, defaultContentsIndex, sliderIndex)
    local param = getParam(paramType[luaSliderIndex], paramIndex[luaSliderIndex])
    -- DECOMPILER ERROR at PC99: Confused about usage of register: R13 in 'UnsetPending'

    if sliderIndex >= 0 and sliderIndex < 3 then
      paramMin[luaSliderIndex] = getHairMinLength(sliderIndex)
      -- DECOMPILER ERROR at PC108: Confused about usage of register: R13 in 'UnsetPending'

      paramMax[luaSliderIndex] = getParamMax(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
      -- DECOMPILER ERROR at PC117: Confused about usage of register: R13 in 'UnsetPending'

      paramDefault[luaSliderIndex] = getParamDefault(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
      if paramMin[luaSliderIndex] == paramMax[luaSliderIndex] then
        EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], false)
      else
        EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], true)
      end
    else
      -- DECOMPILER ERROR at PC149: Confused about usage of register: R13 in 'UnsetPending'

      if sliderIndex == 3 then
        paramMin[luaSliderIndex] = 50 - curlRange / 2
        -- DECOMPILER ERROR at PC153: Confused about usage of register: R13 in 'UnsetPending'

        paramMax[luaSliderIndex] = 50 + curlRange / 2
        -- DECOMPILER ERROR at PC162: Confused about usage of register: R13 in 'UnsetPending'

        paramDefault[luaSliderIndex] = getParamDefault(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
        if curlRange == 0 then
          EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], false)
        else
          EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], true)
        end
      else
        -- DECOMPILER ERROR at PC195: Confused about usage of register: R13 in 'UnsetPending'

        if sliderIndex == 4 then
          paramMin[luaSliderIndex] = getParamMin(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
          -- DECOMPILER ERROR at PC204: Confused about usage of register: R13 in 'UnsetPending'

          paramMax[luaSliderIndex] = getParamMax(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
          -- DECOMPILER ERROR at PC213: Confused about usage of register: R13 in 'UnsetPending'

          paramDefault[luaSliderIndex] = getParamDefault(classType, paramType[luaSliderIndex], paramIndex[luaSliderIndex])
          if curlRange == 0 then
            EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], false)
          else
            EnableSlide(StaticTextArr[luaSliderIndex], StaticText_CurrentValue[luaSliderIndex], SliderArr[luaSliderIndex], true)
          end
        end
      end
    end
    ;
    (StaticTextArr[luaSliderIndex]):SetText(PAGetString(Defines.StringSheet_GAME, sliderText))
    ;
    (StaticText_CurrentValue[luaSliderIndex]):SetText(param)
    setSliderValue(SliderArr[luaSliderIndex], param, paramMin[luaSliderIndex], paramMax[luaSliderIndex])
    ;
    (StaticTextArr[luaSliderIndex]):SetPosY(controlPosY)
    ;
    (SliderArr[luaSliderIndex]):SetPosY(controlPosY + sliderTextGap)
    ;
    (StaticText_CurrentValue[luaSliderIndex]):SetPosY(controlPosY + sliderTextGap)
    controlPosY = controlPosY + contentsGapHeight + (StaticTextArr[luaSliderIndex]):GetSizeY()
  end
  Panel_CustomizationTransformHair:SetSize(Panel_CustomizationTransformHair:GetSizeX(), controlPosY)
  updateGroupFrameControls(Panel_CustomizationTransformHair:GetSizeY(), Panel_CustomizationTransformHair)
end

ToggleShowHairBoneControlPart = function()
  -- function num : 0_9 , upvalues : CheckButton_ControlPart
  showBoneControlPart(CheckButton_ControlPart:IsCheck())
end

PickingHairBone = function()
  -- function num : 0_10 , upvalues : transMin, transMax, currentTranslation, rotMin, rotMax, currentRotation, Slider_TransX, Slider_TransY, Slider_TransZ, Slider_RotX, Slider_RotY, Slider_RotZ
  EnableHairSlide(true)
  transMin = getSelectedBoneMinTrans()
  transMax = getSelectedBoneMaxTrans()
  currentTranslation = getSelectedBoneTrans()
  rotMin = getSelectedBoneMinRot()
  rotMax = getSelectedBoneMaxRot()
  currentRotation = getSelectedBoneRot()
  if currentTranslation ~= nil then
    setValueSlider(Slider_TransX, currentTranslation.x, transMin.x, transMax.x)
    setValueSlider(Slider_TransY, currentTranslation.y, transMin.y, transMax.y)
    setValueSlider(Slider_TransZ, currentTranslation.z, transMin.z, transMax.z)
  end
  if currentRotation ~= nil then
    setValueSlider(Slider_RotX, currentRotation.x, rotMin.x, rotMax.x)
    setValueSlider(Slider_RotY, currentRotation.y, rotMin.y, rotMax.y)
    setValueSlider(Slider_RotZ, currentRotation.z, rotMin.z, rotMax.z)
  end
end

EnableHairSlide = function(enable)
  -- function num : 0_11 , upvalues : Slider_TransX, Slider_TransY, Slider_TransZ, Button_Slider_TransX, Button_Slider_TransY, Button_Slider_TransZ, Slider_RotX, Slider_RotY, Slider_RotZ, Button_Slider_RotX, Button_Slider_RotY, Button_Slider_RotZ, StaticText_CurrValue_TransX, StaticText_CurrValue_TransY, StaticText_CurrValue_TransZ, StaticText_TransX, StaticText_TransY, StaticText_TransZ, StaticText_RotX, StaticText_RotY, StaticText_RotZ
  globalisCustomizationPicking = enable
  Slider_TransX:SetEnable(enable)
  Slider_TransY:SetEnable(enable)
  Slider_TransZ:SetEnable(enable)
  Button_Slider_TransX:SetMonoTone(not enable)
  Button_Slider_TransY:SetMonoTone(not enable)
  Button_Slider_TransZ:SetMonoTone(not enable)
  Slider_RotX:SetEnable(enable)
  Slider_RotY:SetEnable(enable)
  Slider_RotZ:SetEnable(enable)
  Button_Slider_RotX:SetMonoTone(not enable)
  Button_Slider_RotY:SetMonoTone(not enable)
  Button_Slider_RotZ:SetMonoTone(not enable)
  local color = (Defines.Color).C_FF444444
  if enable then
    color = (Defines.Color).C_FFFFFFFF
  end
  StaticText_CurrValue_TransX:SetFontColor(color)
  StaticText_CurrValue_TransY:SetFontColor(color)
  StaticText_CurrValue_TransZ:SetFontColor(color)
  StaticText_TransX:SetFontColor(color)
  StaticText_TransY:SetFontColor(color)
  StaticText_TransZ:SetFontColor(color)
  StaticText_RotX:SetFontColor(color)
  StaticText_RotY:SetFontColor(color)
  StaticText_RotZ:SetFontColor(color)
end

AdjustHairBoneTranslation = function(translationX, translationY, translationZ)
  -- function num : 0_12 , upvalues : checktransrot, Slider_TransX, transMin, transMax, StaticText_CurrValue_TransX, Slider_TransY, StaticText_CurrValue_TransY, Slider_TransZ, StaticText_CurrValue_TransZ, currentTranslation
  checktransrot = 1
  setValueSlider(Slider_TransX, translationX, transMin.x, transMax.x)
  StaticText_CurrValue_TransX:SetText((math.floor)(translationX * 10) / 10)
  setValueSlider(Slider_TransY, translationY, transMin.y, transMax.y)
  StaticText_CurrValue_TransY:SetText((math.floor)(translationY * 10) / 10)
  setValueSlider(Slider_TransZ, translationZ, transMin.z, transMax.z)
  StaticText_CurrValue_TransZ:SetText((math.floor)(translationZ * 10) / 10)
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R3 in 'UnsetPending'

  currentTranslation.x = translationX
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R3 in 'UnsetPending'

  currentTranslation.y = translationY
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R3 in 'UnsetPending'

  currentTranslation.z = translationZ
end

AdjustHairBoneRotation = function(rotationX, rotationY, rotationZ)
  -- function num : 0_13 , upvalues : checktransrot, Slider_RotX, rotMin, rotMax, Slider_RotY, Slider_RotZ, currentRotation
  checktransrot = 2
  setValueSlider(Slider_RotX, rotationX, rotMin.x, rotMax.x)
  setValueSlider(Slider_RotY, rotationY, rotMin.y, rotMax.y)
  setValueSlider(Slider_RotZ, rotationZ, rotMin.z, rotMax.z)
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

  currentRotation.x = rotationX
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R3 in 'UnsetPending'

  currentRotation.y = rotationY
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R3 in 'UnsetPending'

  currentRotation.z = rotationZ
end

CloseHairShapeUi = function()
  -- function num : 0_14
  endPickingMode()
  CameraLookEnable(true)
  globalcurrentclassType = -2
  globalcurrentuiId = -2
  globalisCustomizationPicking = false
end

CloseHairShapeUiWithoutBoneControl = function()
  -- function num : 0_15
  CameraLookEnable(true)
  globalcurrentclassType = -2
  globalcurrentuiId = -2
  globalisCustomizationPicking = false
end

HairShapeHistoryApplyUpdate = function()
  -- function num : 0_16 , upvalues : currentclassType, currentuiId, iswithoutbone
  if globalcurrentclassType ~= currentclassType or globalcurrentuiId ~= currentuiId then
    return 
  end
  if iswithoutbone then
    OpenHairShapeUiWithoutBoneControl(currentclassType, currentuiId)
  else
    OpenHairShapeUi(currentclassType, currentuiId)
    PickingHairBone()
  end
end


