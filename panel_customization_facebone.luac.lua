-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\panel_customization_facebone.luac 

-- params : ...
-- function num : 0
local UI_GroupType = CppEnums.PA_CONSOLE_UI_CONTROL_TYPE
local RadioButton_Bone_Trans = (UI.getChildControl)(Panel_CustomizationTransform, "RadioButton_Bone_Trans")
local RadioButton_Bone_Rot = (UI.getChildControl)(Panel_CustomizationTransform, "RadioButton_Bone_Rot")
local RadioButton_Bone_Scale = (UI.getChildControl)(Panel_CustomizationTransform, "RadioButton_Bone_Scale")
local StaticText_DefaultControl = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_DefaultControl")
local StaticText_Symmetry = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_Symmetry")
local StaticText_ControlPart = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_ControlPart")
local StaticText_TransX = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_TransX")
local StaticText_TransY = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_TransY")
local StaticText_TransZ = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_TransZ")
local StaticText_RotX = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_RotX")
local StaticText_RotY = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_RotY")
local StaticText_RotZ = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_RotZ")
local StaticText_ScaleX = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_ScaleX")
local StaticText_ScaleY = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_ScaleY")
local StaticText_ScaleZ = (UI.getChildControl)(Panel_CustomizationTransform, "StaticText_ScaleZ")
local Button_All_Reset = (UI.getChildControl)(Panel_CustomizationTransform, "Button_All_Reset")
local Button_Part_Reset = (UI.getChildControl)(Panel_CustomizationTransform, "Button_Part_Reset")
local Slider_TransX = (UI.getChildControl)(Panel_CustomizationTransform, "Slider_TransX_Controller")
local Slider_TransY = (UI.getChildControl)(Panel_CustomizationTransform, "Slider_TransY_Controller")
local Slider_TransZ = (UI.getChildControl)(Panel_CustomizationTransform, "Slider_TransZ_Controller")
local Slider_RotX = (UI.getChildControl)(Panel_CustomizationTransform, "Slider_RotX_Controller")
local Slider_RotY = (UI.getChildControl)(Panel_CustomizationTransform, "Slider_RotY_Controller")
local Slider_RotZ = (UI.getChildControl)(Panel_CustomizationTransform, "Slider_RotZ_Controller")
local Slider_ScaleX = (UI.getChildControl)(Panel_CustomizationTransform, "Slider_ScaleX_Controller")
local Slider_ScaleY = (UI.getChildControl)(Panel_CustomizationTransform, "Slider_ScaleY_Controller")
local Slider_ScaleZ = (UI.getChildControl)(Panel_CustomizationTransform, "Slider_ScaleZ_Controller")
local Button_Slider_TransX = (UI.getChildControl)(Slider_TransX, "Slider_GammaController_Button")
local Button_Slider_TransY = (UI.getChildControl)(Slider_TransY, "Slider_GammaController_Button")
local Button_Slider_TransZ = (UI.getChildControl)(Slider_TransZ, "Slider_GammaController_Button")
local Button_Slider_RotX = (UI.getChildControl)(Slider_RotX, "Slider_GammaController_Button")
local Button_Slider_RotY = (UI.getChildControl)(Slider_RotY, "Slider_GammaController_Button")
local Button_Slider_RotZ = (UI.getChildControl)(Slider_RotZ, "Slider_GammaController_Button")
local Button_Slider_ScaleX = (UI.getChildControl)(Slider_ScaleX, "Slider_GammaController_Button")
local Button_Slider_ScaleY = (UI.getChildControl)(Slider_ScaleY, "Slider_GammaController_Button")
local Button_Slider_ScaleZ = (UI.getChildControl)(Slider_ScaleZ, "Slider_GammaController_Button")
local CheckButton_Symmetry = (UI.getChildControl)(Panel_CustomizationTransform, "CheckButton_Symmetry")
local CheckButton_ControlPart = (UI.getChildControl)(Panel_CustomizationTransform, "CheckButton_ControlPart")
local Static_MouseCursor = {}
Static_MouseCursor[1] = (UI.getChildControl)(Panel_Customization_Control, "Static_Cursor_Trans")
Static_MouseCursor[2] = (UI.getChildControl)(Panel_Customization_Control, "Static_Cursor_Rotate")
Static_MouseCursor[3] = (UI.getChildControl)(Panel_Customization_Control, "Static_Cursor_Scale")
local Static_Control_BG = (UI.getChildControl)(Panel_CustomizationTest, "Static_Control_BG")
local StaticText_Control_Title = (UI.getChildControl)(Panel_CustomizationTest, "StaticText_Control_Title")
local StaticText_Control_Name = (UI.getChildControl)(Panel_CustomizationTest, "StaticText_Control_Name")
local Edit_Control = (UI.getChildControl)(Panel_CustomizationTest, "Edit_Control")
local Button_Apply = (UI.getChildControl)(Panel_CustomizationTest, "Button_Apply")
local Button_Reset = (UI.getChildControl)(Panel_CustomizationTest, "Button_Reset")
local Button_Save = (UI.getChildControl)(Panel_CustomizationTest, "Button_SaveXml")
local Button_DebugRot = (UI.getChildControl)(Panel_CustomizationTest, "Button_DebugRot")
local Edit_DebugRotControl = (UI.getChildControl)(Panel_CustomizationTest, "Edit_DebugRotControl")
local currentclassType = -1
local currentuiId = -1
RadioButton_Bone_Trans:SetCheck(true)
StaticText_DefaultControl:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_SELECT_CONTROL"))
StaticText_Symmetry:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_SYMMETRY"))
StaticText_ControlPart:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_CONTROLPART"))
Button_All_Reset:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_ALL_RESET"))
Button_Part_Reset:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_PART_RESET"))
CheckButton_Symmetry:SetCheck(true)
CheckButton_ControlPart:SetCheck(true)
;
(Static_MouseCursor[1]):SetShow(false)
;
(Static_MouseCursor[1]):SetIgnore(true)
;
(Static_MouseCursor[2]):SetShow(false)
;
(Static_MouseCursor[2]):SetIgnore(true)
;
(Static_MouseCursor[3]):SetShow(false)
;
(Static_MouseCursor[3]):SetIgnore(true)
Edit_DebugRotControl:SetEditText("0")
Slider_TransX:addInputEvent("Mouse_LPress", "UpdateSlider( 1 )")
Slider_TransY:addInputEvent("Mouse_LPress", "UpdateSlider( 1 )")
Slider_TransZ:addInputEvent("Mouse_LPress", "UpdateSlider( 1 )")
Button_Slider_TransX:addInputEvent("Mouse_LPress", "UpdateSlider( 1 )")
Button_Slider_TransY:addInputEvent("Mouse_LPress", "UpdateSlider( 1 )")
Button_Slider_TransZ:addInputEvent("Mouse_LPress", "UpdateSlider( 1 )")
Slider_RotX:addInputEvent("Mouse_LPress", "UpdateSlider( 2 )")
Slider_RotY:addInputEvent("Mouse_LPress", "UpdateSlider( 2 )")
Slider_RotZ:addInputEvent("Mouse_LPress", "UpdateSlider( 2 )")
Button_Slider_RotX:addInputEvent("Mouse_LPress", "UpdateSlider( 2 )")
Button_Slider_RotY:addInputEvent("Mouse_LPress", "UpdateSlider( 2 )")
Button_Slider_RotZ:addInputEvent("Mouse_LPress", "UpdateSlider( 2 )")
Slider_ScaleX:addInputEvent("Mouse_LPress", "UpdateSlider( 3 )")
Slider_ScaleY:addInputEvent("Mouse_LPress", "UpdateSlider( 3 )")
Slider_ScaleZ:addInputEvent("Mouse_LPress", "UpdateSlider( 3 )")
Button_Slider_ScaleX:addInputEvent("Mouse_LPress", "UpdateSlider( 3 )")
Button_Slider_ScaleY:addInputEvent("Mouse_LPress", "UpdateSlider( 3 )")
Button_Slider_ScaleZ:addInputEvent("Mouse_LPress", "UpdateSlider( 3 )")
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
Slider_ScaleX:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_ScaleY:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Slider_ScaleZ:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_ScaleX:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_ScaleY:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
Button_Slider_ScaleZ:addInputEvent("Mouse_LUp", "add_CurrentHistory()")
CheckButton_Symmetry:addInputEvent("Mouse_LUp", "SymmetryChecked()")
CheckButton_ControlPart:addInputEvent("Mouse_LUp", "ShowControlPart()")
Button_All_Reset:addInputEvent("Mouse_LUp", "clearGroupCustomizedBonInfoLua()")
Button_Part_Reset:addInputEvent("Mouse_LUp", "clearCustomizedBoneInfo()")
Button_Reset:addInputEvent("Mouse_LUp", "resetControlParameters()")
Button_Save:addInputEvent("Mouse_LUp", "saveControlParameters()")
RadioButton_Bone_Trans:addInputEvent("Mouse_LUp", "CursorSelect(1)")
RadioButton_Bone_Rot:addInputEvent("Mouse_LUp", "CursorSelect(2)")
RadioButton_Bone_Scale:addInputEvent("Mouse_LUp", "CursorSelect(3)")
Button_DebugRot:addInputEvent("Mouse_LUp", "ApplyCharacterRotateForDebugging()")
registerEvent("EventSelectSculptingBoneControl", "SelectSculptingBoneControl")
registerEvent("EventAdjustSculptingBoneTranslation", "AdjustSculptingBoneTranslation")
registerEvent("EventAdjustSculptingBoneRotation", "AdjustSculptingBoneRotation")
registerEvent("EventAdjustSculptingBoneScale", "AdjustSculptingBoneScale")
registerEvent("EventOpenFaceShapeUi", "OpenFaceShapeUi")
registerEvent("EventCloseFaceShapeUi", "CloseFaceShapeUi")
registerEvent("EventShowBoneSculptingSelector", "showBoneSculptingSelector")
registerEvent("EventSetShowCustomizationEditor", "SetShowCustomizationEditor")
registerEvent("EventRepositionCursorUI", "RepositionCursorUI")
registerEvent("EventSelectBoneDrag", "SelectBoneDrag")
registerEvent("EventSelectTransformType", "SelectTransformType")
registerEvent("EventEnableFaceSlide", "EnableFaceSlide")
local transMin, transMax, rotMin, rotMax, scaleMin, scaleMax, currentTranslation, currentRotation, currentScale = nil, nil, nil, nil, nil, nil, nil, nil, nil
local SculptingUIRect = {left, top, right, bottom}
local mouseCursorRadius = (Static_MouseCursor[1]):GetSizeX()
local ControlMode = 1
local selectedGroup = 0
local selectedPart = 0
local thirtyDegree = math.pi / 10
local GroupTree = {}
local groupCount = nil
groups = {}
local selectedCharacterClass = -1
sculptingBoneSettingUI = {
StaticText = {}
, 
StaticText_String = {[1] = "Pick Radius", [2] = "Pick x y z", [3] = "Trans Min x y z", [4] = "Trans Max x y z", [5] = "Rot Min p y r", [6] = "Rot Max p y r", [7] = "Scale Min x y z", [8] = "Scale Max x y z", [9] = "Trans Value x y z", [10] = "Rot Value p y r", [11] = "Scale Value x y z"}
, STATIC_TEXT_COUNT = 11, 
EditText = {}
, 
ControlParam = {}
, PARAM_PICKRADIUS = 1, PARAM_PICKPOSX = 2, PARAM_PICKPOSY = 3, PARAM_PICKPOSZ = 4, PARAM_TRANSMINX = 5, PARAM_TRANSMINY = 6, PARAM_TRANSMINZ = 7, PARAM_TRANSMAXX = 8, PARAM_TRANSMAXY = 9, PARAM_TRANSMAXZ = 10, PARAM_ROTMINX = 11, PARAM_ROTMINY = 12, PARAM_ROTMINZ = 13, PARAM_ROTMAXX = 14, PARAM_ROTMAXY = 15, PARAM_ROTMAXZ = 16, PARAM_SCALEMINX = 17, PARAM_SCALEMINY = 18, PARAM_SCALEMINZ = 19, PARAM_SCALEMAXX = 20, PARAM_SCALEMAXY = 21, PARAM_SCALEMAXZ = 22, PARAM_TRANSVALX = 23, PARAM_TRANSVALY = 24, PARAM_TRANSVALZ = 25, PARAM_ROTVALX = 26, PARAM_ROTVALY = 27, PARAM_ROTVALZ = 28, PARAM_SCALEVALX = 29, PARAM_SCALEVALY = 30, PARAM_SCALEVALZ = 31, CONTROL_PARAM_COUNT = 31}
InitializeCustomizationData = function(customizationData, _selectedCharacterClass)
  -- function num : 0_0 , upvalues : selectedCharacterClass
  selectedCharacterClass = _selectedCharacterClass
  InitializePoseEditor(customizationData)
  initSculptingBoneTestUI()
end

SetControlParameters = function(controlIdx, value)
  -- function num : 0_1 , upvalues : selectedGroup, selectedPart
  (((((((groups[selectedGroup]).parts)[selectedPart]).controls)[controlIdx]).controlDetails)[2]):SetText(value)
end

local clearEditor = function()
  -- function num : 0_2
  local self = sculptingBoneSettingUI
  for _,v in pairs(self.StaticText) do
    v:SetShow(false)
    ;
    (UI.deleteControl)(v)
  end
  self.StaticText = {}
  for _,v in pairs(self.EditText) do
    v:SetShow(false)
    ;
    (UI.deleteControl)(v)
  end
  self.EditText = {}
end

initSculptingBoneTestUI = function()
  -- function num : 0_3 , upvalues : clearEditor, StaticText_Control_Name, Edit_Control
  clearEditor()
  local self = sculptingBoneSettingUI
  local controlSpanX = 20
  local controlSpanY = 105
  for index = 1, 11 do
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R7 in 'UnsetPending'

    (self.StaticText)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_CustomizationTest, "StaticText" .. index)
    CopyBaseProperty(StaticText_Control_Name, (self.StaticText)[index])
    ;
    ((self.StaticText)[index]):SetShow(false)
    ;
    ((self.StaticText)[index]):SetText((self.StaticText_String)[index])
    if index == 9 then
      controlSpanY = controlSpanY + 20
    end
    ;
    ((self.StaticText)[index]):SetSpanSize(controlSpanX, controlSpanY + 30 * (index - 1))
  end
  controlSpanX = 150
  controlSpanY = 112
  for index = 1, self.CONTROL_PARAM_COUNT do
    -- DECOMPILER ERROR at PC66: Confused about usage of register: R7 in 'UnsetPending'

    (self.EditText)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_EDIT, Panel_CustomizationTest, "EditText" .. index)
    CopyBaseProperty(Edit_Control, (self.EditText)[index])
    ;
    ((self.EditText)[index]):SetShow(false)
    ;
    ((self.EditText)[index]):SetEditText("0")
    if index == 23 then
      controlSpanY = controlSpanY + 20
    end
    if index == 1 then
      ((self.EditText)[index]):SetSpanSize(controlSpanX, controlSpanY)
    else
      ;
      ((self.EditText)[index]):SetSpanSize(controlSpanX + (index - 2) % 3 * 35, controlSpanY + 30 + (math.floor)((index - 2) / 3) * 30)
    end
  end
  Panel_CustomizationTest:SetShow(false, false)
end

SetShowCustomizationEditor = function(show)
  -- function num : 0_4
  Panel_CustomizationTest:SetShow(show, false)
  local self = sculptingBoneSettingUI
  for index = 1, 11 do
    ((self.StaticText)[index]):SetShow(show)
  end
  for index = 1, self.CONTROL_PARAM_COUNT do
    ((self.EditText)[index]):SetShow(show)
  end
end

local initSlider = function()
  -- function num : 0_5 , upvalues : currentTranslation, Slider_TransX, transMin, transMax, Slider_TransY, Slider_TransZ, currentRotation, Slider_RotX, rotMin, rotMax, Slider_RotY, Slider_RotZ, currentScale, Slider_ScaleX, scaleMin, scaleMax, Slider_ScaleY, Slider_ScaleZ
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
  if currentScale ~= nil then
    setValueSlider(Slider_ScaleX, currentScale.x, scaleMin.x, scaleMax.x)
    setValueSlider(Slider_ScaleY, currentScale.y, scaleMin.y, scaleMax.y)
    setValueSlider(Slider_ScaleZ, currentScale.z, scaleMin.z, scaleMax.z)
  end
end

SelectSculptingBoneControl = function(customizationData)
  -- function num : 0_6 , upvalues : transMin, transMax, rotMin, rotMax, scaleMin, scaleMax, currentTranslation, currentRotation, currentScale, initSlider, ControlMode
  local self = sculptingBoneSettingUI
  local radius = customizationData:getSelectedBonePickRadius()
  ;
  ((self.EditText)[1]):SetEditText(floatString(radius))
  EnableFaceSlide(true)
  local vector = {x, y, z}
  vector = customizationData:getSelectedBoneTranslationMin()
  ;
  ((self.EditText)[5]):SetEditText(floatString(vector.x))
  ;
  ((self.EditText)[6]):SetEditText(floatString(vector.y))
  ;
  ((self.EditText)[7]):SetEditText(floatString(vector.z))
  vector = customizationData:getSelectedBoneTranslationMax()
  ;
  ((self.EditText)[8]):SetEditText(floatString(vector.x))
  ;
  ((self.EditText)[9]):SetEditText(floatString(vector.y))
  ;
  ((self.EditText)[10]):SetEditText(floatString(vector.z))
  vector = customizationData:getSelectedBoneRotationMin()
  ;
  ((self.EditText)[11]):SetEditText(floatString(vector.x))
  ;
  ((self.EditText)[12]):SetEditText(floatString(vector.y))
  ;
  ((self.EditText)[13]):SetEditText(floatString(vector.z))
  vector = customizationData:getSelectedBoneRotationMax()
  ;
  ((self.EditText)[14]):SetEditText(floatString(vector.x))
  ;
  ((self.EditText)[15]):SetEditText(floatString(vector.y))
  ;
  ((self.EditText)[16]):SetEditText(floatString(vector.z))
  vector = customizationData:getSelectedBoneScaleMin()
  ;
  ((self.EditText)[17]):SetEditText(floatString(vector.x))
  ;
  ((self.EditText)[18]):SetEditText(floatString(vector.y))
  ;
  ((self.EditText)[19]):SetEditText(floatString(vector.z))
  vector = customizationData:getSelectedBoneScaleMax()
  ;
  ((self.EditText)[20]):SetEditText(floatString(vector.x))
  ;
  ((self.EditText)[21]):SetEditText(floatString(vector.y))
  ;
  ((self.EditText)[22]):SetEditText(floatString(vector.z))
  transMin = customizationData:getSelectedBoneTranslationMin()
  transMax = customizationData:getSelectedBoneTranslationMax()
  rotMin = customizationData:getSelectedBoneRotationMin()
  rotMax = customizationData:getSelectedBoneRotationMax()
  scaleMin = customizationData:getSelectedBoneScaleMin()
  scaleMax = customizationData:getSelectedBoneScaleMax()
  currentTranslation = customizationData:getSelectedBoneTranslationValue()
  currentRotation = customizationData:getSelectedBoneRotationValue()
  currentScale = customizationData:getSelectedBoneScaleValue()
  initSlider()
  CursorSelect(ControlMode)
  EnableCursor(false)
end

local UpdateRadioButtons = function(updateControlMode)
  -- function num : 0_7 , upvalues : RadioButton_Bone_Trans, RadioButton_Bone_Rot, RadioButton_Bone_Scale
  if updateControlMode == 1 then
    RadioButton_Bone_Trans:SetCheck(true)
    RadioButton_Bone_Rot:SetCheck(false)
    RadioButton_Bone_Scale:SetCheck(false)
  else
    if updateControlMode == 2 then
      RadioButton_Bone_Trans:SetCheck(false)
      RadioButton_Bone_Rot:SetCheck(true)
      RadioButton_Bone_Scale:SetCheck(false)
    else
      if updateControlMode == 3 then
        RadioButton_Bone_Trans:SetCheck(false)
        RadioButton_Bone_Rot:SetCheck(false)
        RadioButton_Bone_Scale:SetCheck(true)
      end
    end
  end
end

floatString = function(floatValue)
  -- function num : 0_8
  return (string.format)("%.2f", floatValue)
end

resetControlParameters = function()
  -- function num : 0_9
end

saveControlParameters = function()
  -- function num : 0_10
  saveSculptingBoneXml()
end

AdjustSculptingBoneTranslation = function(translationX, translationY, translationZ)
  -- function num : 0_11 , upvalues : Slider_TransX, transMin, transMax, Slider_TransY, Slider_TransZ, currentTranslation
  local self = sculptingBoneSettingUI
  ;
  ((self.EditText)[23]):SetEditText(floatString(translationX))
  ;
  ((self.EditText)[24]):SetEditText(floatString(translationY))
  ;
  ((self.EditText)[25]):SetEditText(floatString(translationZ))
  setValueSlider(Slider_TransX, translationX, transMin.x, transMax.x)
  setValueSlider(Slider_TransY, translationY, transMin.y, transMax.y)
  setValueSlider(Slider_TransZ, translationZ, transMin.z, transMax.z)
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R4 in 'UnsetPending'

  currentTranslation.x = translationX
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R4 in 'UnsetPending'

  currentTranslation.y = translationY
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R4 in 'UnsetPending'

  currentTranslation.z = translationZ
end

AdjustSculptingBoneRotation = function(rotationX, rotationY, rotationZ)
  -- function num : 0_12 , upvalues : Slider_RotX, rotMin, rotMax, Slider_RotY, Slider_RotZ, currentRotation
  local self = sculptingBoneSettingUI
  ;
  ((self.EditText)[26]):SetEditText(floatString(rotationX))
  ;
  ((self.EditText)[27]):SetEditText(floatString(rotationY))
  ;
  ((self.EditText)[28]):SetEditText(floatString(rotationZ))
  setValueSlider(Slider_RotX, rotationX, rotMin.x, rotMax.x)
  setValueSlider(Slider_RotY, rotationY, rotMin.y, rotMax.y)
  setValueSlider(Slider_RotZ, rotationZ, rotMin.z, rotMax.z)
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R4 in 'UnsetPending'

  currentRotation.x = rotationX
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R4 in 'UnsetPending'

  currentRotation.y = rotationY
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R4 in 'UnsetPending'

  currentRotation.z = rotationZ
end

AdjustSculptingBoneScale = function(scaleX, scaleY, scaleZ)
  -- function num : 0_13 , upvalues : Slider_ScaleX, scaleMin, scaleMax, Slider_ScaleY, Slider_ScaleZ, currentScale
  local self = sculptingBoneSettingUI
  ;
  ((self.EditText)[29]):SetEditText(floatString(scaleX))
  ;
  ((self.EditText)[30]):SetEditText(floatString(scaleY))
  ;
  ((self.EditText)[31]):SetEditText(floatString(scaleZ))
  setValueSlider(Slider_ScaleX, scaleX, scaleMin.x, scaleMax.x)
  setValueSlider(Slider_ScaleY, scaleY, scaleMin.y, scaleMax.y)
  setValueSlider(Slider_ScaleZ, scaleZ, scaleMin.z, scaleMax.z)
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R4 in 'UnsetPending'

  currentScale.x = scaleX
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R4 in 'UnsetPending'

  currentScale.y = scaleY
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R4 in 'UnsetPending'

  currentScale.z = scaleZ
end

RepositioningGroupUI = function(groupIndex, posX, posY)
  -- function num : 0_14
end

RepositionCursorUI = function(posX, posY)
  -- function num : 0_15
end

SelectTransformType = function(transformType)
  -- function num : 0_16 , upvalues : ControlMode, RadioButton_Bone_Trans, RadioButton_Bone_Rot, RadioButton_Bone_Scale
  CursorSelect(transformType + 1)
  if ControlMode == 1 then
    RadioButton_Bone_Trans:SetCheck(true)
    RadioButton_Bone_Rot:SetCheck(false)
    RadioButton_Bone_Scale:SetCheck(false)
  else
    if ControlMode == 2 then
      RadioButton_Bone_Trans:SetCheck(false)
      RadioButton_Bone_Rot:SetCheck(true)
      RadioButton_Bone_Scale:SetCheck(false)
    else
      if ControlMode == 3 then
        RadioButton_Bone_Trans:SetCheck(false)
        RadioButton_Bone_Rot:SetCheck(false)
        RadioButton_Bone_Scale:SetCheck(true)
      end
    end
  end
end

CursorSelect = function(luaControlModeIndex)
  -- function num : 0_17 , upvalues : ControlMode
  ControlMode = luaControlModeIndex
  local transformTypeIndex = luaControlModeIndex - 1
  selectSculptingBoneTransformType(transformTypeIndex)
end

EnableCursor = function(Enable)
  -- function num : 0_18
end

EnablePick = function(pickEnable)
  -- function num : 0_19
  SetShowCustomizationDetails(pickEnable)
end

SymmetryChecked = function()
  -- function num : 0_20 , upvalues : CheckButton_Symmetry
  setSymmetryBoneTransform(CheckButton_Symmetry:IsCheck())
end

ShowControlPart = function()
  -- function num : 0_21 , upvalues : CheckButton_ControlPart
  showBoneControlPart(CheckButton_ControlPart:IsCheck())
end

CloseBoneSculptingSelector = function()
  -- function num : 0_22
  showBoneSculptingSelector(false)
  EnableCursor(false)
  selectCustomizationControlPart(-1)
end

OpenFaceShapeUi = function(classType, uiId)
  -- function num : 0_23 , upvalues : UI_GroupType, currentclassType, currentuiId, Button_Slider_TransX, Button_Slider_TransY, Button_Slider_TransZ, Button_Slider_RotX, Button_Slider_RotY, Button_Slider_RotZ, Button_Slider_ScaleX, Button_Slider_ScaleY, Button_Slider_ScaleZ, CheckButton_Symmetry, CheckButton_ControlPart, Button_Part_Reset, Button_All_Reset
  Set_CustomizationUIPanel(0, Panel_CustomizationFrame, 10)
  ClearAll_CustomizationUIGroup(0)
  Add_CustomizationUIGroup(0, 0, UI_GroupType.eCONSOLE_UI_CONTROL_TYPE_CUSTOMIZATION)
  Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsolePrevFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB2)
  Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsoleNextFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB2)
  globalcurrentclassType = classType
  globalcurrentuiId = uiId
  currentclassType = classType
  currentuiId = uiId
  CameraLookEnable(false)
  startFacePickingMode()
  EnableFaceSlide(false)
  showBoneSculptingSelector(true)
  local maxcountx = 2
  local maxcounty = 11
  Add_CustomizationUIControl(0, 0, 0, 0, maxcountx, maxcounty, Button_Slider_TransX)
  Add_CustomizationUIControl(0, 0, 0, 1, maxcountx, maxcounty, Button_Slider_TransY)
  Add_CustomizationUIControl(0, 0, 0, 2, maxcountx, maxcounty, Button_Slider_TransZ)
  Add_CustomizationUIControl(0, 0, 0, 3, maxcountx, maxcounty, Button_Slider_RotX)
  Add_CustomizationUIControl(0, 0, 0, 4, maxcountx, maxcounty, Button_Slider_RotY)
  Add_CustomizationUIControl(0, 0, 0, 5, maxcountx, maxcounty, Button_Slider_RotZ)
  Add_CustomizationUIControl(0, 0, 0, 6, maxcountx, maxcounty, Button_Slider_ScaleX)
  Add_CustomizationUIControl(0, 0, 0, 7, maxcountx, maxcounty, Button_Slider_ScaleY)
  Add_CustomizationUIControl(0, 0, 0, 8, maxcountx, maxcounty, Button_Slider_ScaleZ)
  Add_CustomizationUIControl(0, 0, 0, 9, maxcountx, maxcounty, CheckButton_Symmetry)
  Add_CustomizationUIControl(0, 0, 1, 9, maxcountx, maxcounty, CheckButton_ControlPart)
  Add_CustomizationUIControl(0, 0, 0, 10, maxcountx, maxcounty, Button_Part_Reset)
  Add_CustomizationUIControl(0, 0, 1, 10, maxcountx, maxcounty, Button_All_Reset)
  Set_CustomizationUIgroupCurrentIndex(0, 0, 0, 9)
end

CloseFaceShapeUi = function()
  -- function num : 0_24
  CameraLookEnable(true)
  ;
  (endPickingMode()).globalcurrentclassType = -2
  globalcurrentuiId = -2
  globalisCustomizationPicking = false
end

showBoneSculptingSelector = function(show)
  -- function num : 0_25 , upvalues : Slider_TransX, Slider_TransY, Slider_TransZ, Slider_RotX, Slider_RotY, Slider_RotZ, Slider_ScaleX, Slider_ScaleY, Slider_ScaleZ, RadioButton_Bone_Trans, RadioButton_Bone_Rot, RadioButton_Bone_Scale
  Slider_TransX:SetControlPos(50)
  Slider_TransY:SetControlPos(50)
  Slider_TransZ:SetControlPos(50)
  Slider_RotX:SetControlPos(50)
  Slider_RotY:SetControlPos(50)
  Slider_RotZ:SetControlPos(50)
  Slider_ScaleX:SetControlPos(50)
  Slider_ScaleY:SetControlPos(50)
  Slider_ScaleZ:SetControlPos(50)
  if show == true then
    RadioButton_Bone_Trans:SetCheck(true)
    CursorSelect(1)
    RadioButton_Bone_Rot:SetCheck(false)
    RadioButton_Bone_Scale:SetCheck(false)
    updateGroupFrameControls(Panel_CustomizationTransform:GetSizeY(), Panel_CustomizationTransform)
  end
  EnableCursor(show)
  ShowControlPart()
  SymmetryChecked()
end

showBoneDetailedController = function(show)
  -- function num : 0_26 , upvalues : StaticText_Symmetry, StaticText_ControlPart, Slider_TransX, Slider_TransY, Slider_TransZ, StaticText_TransX, StaticText_TransY, StaticText_TransZ, StaticText_RotX, StaticText_RotY, StaticText_RotZ, StaticText_ScaleX, StaticText_ScaleY, StaticText_ScaleZ, CheckButton_Symmetry, CheckButton_ControlPart
  StaticText_Symmetry:SetShow(show)
  StaticText_ControlPart:SetShow(show)
  Slider_TransX:SetShow(show)
  Slider_TransY:SetShow(show)
  Slider_TransZ:SetShow(show)
  StaticText_TransX:SetShow(show)
  StaticText_TransY:SetShow(show)
  StaticText_TransZ:SetShow(show)
  StaticText_RotX:SetShow(show)
  StaticText_RotY:SetShow(show)
  StaticText_RotZ:SetShow(show)
  StaticText_ScaleX:SetShow(show)
  StaticText_ScaleY:SetShow(show)
  StaticText_ScaleZ:SetShow(show)
  CheckButton_Camera:SetShow(show)
  CheckButton_Symmetry:SetShow(show)
  CheckButton_ControlPart:SetShow(show)
  Static_Symmetry:SetShow(show)
  Static_ControlPart:SetShow(show)
end

calculateSliderValue = function(SliderControl, valueMin, valueMax)
  -- function num : 0_27
  local ratio = SliderControl:GetControlPos()
  local val = valueMax - valueMin
  return ratio * val - (val - (math.abs)(valueMax))
end

setValueSlider = function(SliderControl, value, valueMin, valueMax)
  -- function num : 0_28
  local val = valueMax - valueMin
  if val ~= 0 then
    SliderControl:SetControlPos((value - valueMin) / val * 100)
  end
end

UpdateSlider = function(updateControlMode)
  -- function num : 0_29 , upvalues : ControlMode, UpdateRadioButtons, Slider_TransX, transMin, transMax, Slider_TransY, Slider_TransZ, currentTranslation, Slider_RotX, rotMin, rotMax, Slider_RotY, Slider_RotZ, currentRotation, Slider_ScaleX, scaleMin, scaleMax, Slider_ScaleY, Slider_ScaleZ, currentScale
  if ControlMode ~= updateControlMode then
    UpdateRadioButtons(updateControlMode)
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
  else
    do
      if updateControlMode == 2 then
        local x = calculateSliderValue(Slider_RotX, rotMin.x, rotMax.x)
        local y = calculateSliderValue(Slider_RotY, rotMin.y, rotMax.y)
        local z = calculateSliderValue(Slider_RotZ, rotMin.z, rotMax.z)
        -- DECOMPILER ERROR at PC68: Confused about usage of register: R4 in 'UnsetPending'

        currentRotation.x = x
        -- DECOMPILER ERROR at PC70: Confused about usage of register: R4 in 'UnsetPending'

        currentRotation.y = y
        -- DECOMPILER ERROR at PC72: Confused about usage of register: R4 in 'UnsetPending'

        currentRotation.z = z
        applyRotationValue(x, y, z)
      else
        do
          if updateControlMode == 3 then
            local x = calculateSliderValue(Slider_ScaleX, scaleMin.x, scaleMax.x)
            local y = calculateSliderValue(Slider_ScaleY, scaleMin.y, scaleMax.y)
            local z = calculateSliderValue(Slider_ScaleZ, scaleMin.z, scaleMax.z)
            -- DECOMPILER ERROR at PC103: Confused about usage of register: R4 in 'UnsetPending'

            currentScale.x = x
            -- DECOMPILER ERROR at PC105: Confused about usage of register: R4 in 'UnsetPending'

            currentScale.y = y
            -- DECOMPILER ERROR at PC107: Confused about usage of register: R4 in 'UnsetPending'

            currentScale.z = z
            applyScaleValue(x, y, z)
          end
        end
      end
    end
  end
end

CheckCursorInSculptingUI = function()
  -- function num : 0_30 , upvalues : SculptingUIRect, mouseCursorRadius
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  SculptingUIRect.left = Panel_CustomizationFrame:GetPosX()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  SculptingUIRect.top = Panel_CustomizationFrame:GetPosY()
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  SculptingUIRect.right = SculptingUIRect.left + Panel_CustomizationFrame:GetSizeX()
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

  SculptingUIRect.bottom = SculptingUIRect.top + Panel_CustomizationFrame:GetSizeY()
  if SculptingUIRect.left - mouseCursorRadius / 2 <= getMousePosX() and SculptingUIRect.top - mouseCursorRadius / 2 <= getMousePosY() and getMousePosX() <= SculptingUIRect.right + mouseCursorRadius / 2 and getMousePosY() <= SculptingUIRect.bottom + mouseCursorRadius / 2 then
    EnableCursor(false)
  else
    EnableCursor(true)
  end
end

EnableFaceSlide = function(enable)
  -- function num : 0_31 , upvalues : Button_Slider_TransX, Button_Slider_TransY, Button_Slider_TransZ, Button_Slider_RotX, Button_Slider_RotY, Button_Slider_RotZ, Button_Slider_ScaleX, Button_Slider_ScaleY, Button_Slider_ScaleZ, Slider_TransX, Slider_TransY, Slider_TransZ, Slider_RotX, Slider_RotY, Slider_RotZ, Slider_ScaleX, Slider_ScaleY, Slider_ScaleZ, StaticText_TransX, StaticText_TransY, StaticText_TransZ, StaticText_RotX, StaticText_RotY, StaticText_RotZ, StaticText_ScaleX, StaticText_ScaleY, StaticText_ScaleZ
  globalisCustomizationPicking = enable
  Button_Slider_TransX:SetMonoTone(not enable)
  Button_Slider_TransY:SetMonoTone(not enable)
  Button_Slider_TransZ:SetMonoTone(not enable)
  Button_Slider_RotX:SetMonoTone(not enable)
  Button_Slider_RotY:SetMonoTone(not enable)
  Button_Slider_RotZ:SetMonoTone(not enable)
  Button_Slider_ScaleX:SetMonoTone(not enable)
  Button_Slider_ScaleY:SetMonoTone(not enable)
  Button_Slider_ScaleZ:SetMonoTone(not enable)
  Slider_TransX:SetEnable(enable)
  Slider_TransY:SetEnable(enable)
  Slider_TransZ:SetEnable(enable)
  Slider_RotX:SetEnable(enable)
  Slider_RotY:SetEnable(enable)
  Slider_RotZ:SetEnable(enable)
  Slider_ScaleX:SetEnable(enable)
  Slider_ScaleY:SetEnable(enable)
  Slider_ScaleZ:SetEnable(enable)
  local color = (Defines.Color).C_FF444444
  if enable then
    color = (Defines.Color).C_FFFFFFFF
  end
  StaticText_TransX:SetFontColor(color)
  StaticText_TransY:SetFontColor(color)
  StaticText_TransZ:SetFontColor(color)
  StaticText_RotX:SetFontColor(color)
  StaticText_RotY:SetFontColor(color)
  StaticText_RotZ:SetFontColor(color)
  StaticText_ScaleX:SetFontColor(color)
  StaticText_ScaleY:SetFontColor(color)
  StaticText_ScaleZ:SetFontColor(color)
end

SelectBoneDrag = function(bDrag)
  -- function num : 0_32
  if bDrag == true then
    EnableCursor(false)
  else
    EnableCursor(true)
    add_CurrentHistory()
  end
end

ApplyCharacterRotateForDebugging = function()
  -- function num : 0_33 , upvalues : Edit_DebugRotControl
  setCharacterRotateSpeedForDebugging(tonumber(Edit_DebugRotControl:GetEditText()))
end

FaceBoneHistoryApplyUpdate = function()
  -- function num : 0_34 , upvalues : currentclassType, currentuiId
  if globalcurrentclassType ~= currentclassType or globalcurrentuiId ~= currentuiId then
    return 
  end
  SelectSculptingBoneControl(ToClient_getCharacterCustomizationUiWrapper())
end


