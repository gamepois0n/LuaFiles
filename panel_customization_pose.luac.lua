-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\panel_customization_pose.luac 

-- params : ...
-- function num : 0
local UI_GroupType = CppEnums.PA_CONSOLE_UI_CONTROL_TYPE
local rotMin, rotMax, currentRotation = nil, nil, nil
local PoseEditUIRect = {left, top, right, bottom}
local ContentImage = {}
local selectedImageIndex = -1
local StaticText_ControlType = (UI.getChildControl)(Panel_CustomizationPoseEdit, "StaticText_ControlType")
local StaticText_DetailControl = (UI.getChildControl)(Panel_CustomizationPoseEdit, "StaticText_DetailControl")
local StaticText_Symmetry = (UI.getChildControl)(Panel_CustomizationPoseEdit, "StaticText_Symmetry")
local StaticText_ControlPart = (UI.getChildControl)(Panel_CustomizationPoseEdit, "StaticText_ControlPart")
local StaticText_Y = (UI.getChildControl)(Panel_CustomizationPoseEdit, "StaticText_Y")
local StaticText_Z = (UI.getChildControl)(Panel_CustomizationPoseEdit, "StaticText_Z")
local RadioButton_Ik = (UI.getChildControl)(Panel_CustomizationPoseEdit, "RadioButton_Ik")
local RadioButton_Bone = (UI.getChildControl)(Panel_CustomizationPoseEdit, "RadioButton_Bone")
RadioButton_Bone:SetCheck(true)
RadioButton_Ik:SetShow(false)
local Button_AllReset = (UI.getChildControl)(Panel_CustomizationPoseEdit, "Button_All_Reset")
local Button_PartReset = (UI.getChildControl)(Panel_CustomizationPoseEdit, "Button_Part_Reset")
local Button_Save = (UI.getChildControl)(Panel_CustomizationPoseEdit, "Button_Save")
local Button_Delete = (UI.getChildControl)(Panel_CustomizationPoseEdit, "Button_Delete")
local Slider_X = (UI.getChildControl)(Panel_CustomizationPoseEdit, "Slider_X_Controller")
local Slider_Y = (UI.getChildControl)(Panel_CustomizationPoseEdit, "Slider_Y_Controller")
local Slider_Z = (UI.getChildControl)(Panel_CustomizationPoseEdit, "Slider_Z_Controller")
local StaticText_Slider_X = (UI.getChildControl)(Panel_CustomizationPoseEdit, "StaticText_Slider_X_Left")
local StaticText_Slider_Y = (UI.getChildControl)(Panel_CustomizationPoseEdit, "StaticText_Slider_Y_Left")
local StaticText_Slider_Z = (UI.getChildControl)(Panel_CustomizationPoseEdit, "StaticText_Slider_Z_Left")
StaticText_Slider_X:SetShow(false)
StaticText_Slider_Y:SetShow(false)
StaticText_Slider_Z:SetShow(false)
local Button_Slider_X = (UI.getChildControl)(Slider_X, "Slider_GammaController_Button")
local Button_Slider_Y = (UI.getChildControl)(Slider_Y, "Slider_GammaController_Button")
local Button_Slider_Z = (UI.getChildControl)(Slider_Z, "Slider_GammaController_Button")
Slider_X:addInputEvent("Mouse_LPress", "PoseEditSliderUpdate()")
Slider_Y:addInputEvent("Mouse_LPress", "PoseEditSliderUpdate()")
Slider_Z:addInputEvent("Mouse_LPress", "PoseEditSliderUpdate()")
Button_Slider_X:addInputEvent("Mouse_LPress", "PoseEditSliderUpdate()")
Button_Slider_Y:addInputEvent("Mouse_LPress", "PoseEditSliderUpdate()")
Button_Slider_Z:addInputEvent("Mouse_LPress", "PoseEditSliderUpdate()")
local CheckButton_Symmetry = (UI.getChildControl)(Panel_CustomizationPoseEdit, "CheckButton_Symmetry")
local CheckButton_ControlPart = (UI.getChildControl)(Panel_CustomizationPoseEdit, "CheckButton_ControlPart")
CheckButton_Symmetry:SetCheck(false)
CheckButton_ControlPart:SetCheck(true)
CheckButton_ControlPart:addInputEvent("Mouse_LUp", "ToggleShowPoseBoneControlPart()")
local FrameTemplate = (UI.getChildControl)(Panel_CustomizationPoseEdit, "Frame_Template")
local Frame_Content = (UI.getChildControl)(FrameTemplate, "Frame_Content")
local Frame_ContentImage = (UI.getChildControl)(Frame_Content, "Frame_Content_Image")
local Frame_Scroll = (UI.getChildControl)(FrameTemplate, "Frame_Scroll")
CheckButton_Symmetry:addInputEvent("Mouse_LUp", "PoseEditSymmetryChecked()")
Button_AllReset:addInputEvent("Mouse_LUp", "clearAllPoseBone()")
Button_PartReset:addInputEvent("Mouse_LUp", "clearPoseBone()")
Button_Save:addInputEvent("Mouse_LUp", "SavePose()")
Button_Delete:addInputEvent("Mouse_LUp", "DeletePose()")
registerEvent("EventOpenPoseEditUi", "OpenPoseEditUi")
registerEvent("EventClosePoseEditUi", "ClosePoseEditUi")
registerEvent("EventShowPoseEditor", "ShowPoseEditor")
registerEvent("EventAdjustPoseBoneRotation", "AdjustPoseBoneRotation")
registerEvent("EventSelectPoseEditorControl", "SelectPoseEditorControl")
registerEvent("EventRepositionPoseEditCursorUI", "RepositionPoseEditCursorUI")
registerEvent("EventEnablePoseEditSlide", "EnablePoseEditSlide")
registerEvent("EventPoseEditBoneDrag", "PoseEditBoneDrag")
local clearContentList = function()
  -- function num : 0_0 , upvalues : ContentImage
  for _,content in pairs(ContentImage) do
    content:SetShow(false)
    ;
    (UI.deleteControl)(content)
  end
  ContentImage = {}
end

InitializePoseEditor = function(customizationData)
  -- function num : 0_1 , upvalues : clearContentList, Frame_Content, Frame_ContentImage, ContentImage, FrameTemplate, Frame_Scroll
  clearContentList()
  local texSize = 48.25
  for itemIdx = 0, 9 do
    local tempContentImage = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Frame_Content, "Frame_Image_" .. itemIdx)
    CopyBaseProperty(Frame_ContentImage, tempContentImage)
    tempContentImage:addInputEvent("Mouse_LUp", "SelectPose(" .. itemIdx .. ")")
    local mod = itemIdx % 4
    local divi = (math.floor)(itemIdx / 4)
    local texUV = {x1, y1, x2, y2}
    texUV.x1 = mod * texSize
    texUV.y1 = divi * texSize
    texUV.x2 = texUV.x1 + texSize
    texUV.y2 = texUV.y1 + texSize
    tempContentImage:ChangeTextureInfoName("New_UI_Common_ForLua/Window/Lobby/cus_pose_tempsave.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(tempContentImage, texUV.x1, texUV.y1, texUV.x2, texUV.y2)
    ;
    (tempContentImage:getBaseTexture()):setUV(x1, y1, x2, y2)
    tempContentImage:SetPosX(10 + itemIdx % 4 * (Frame_ContentImage:GetSizeX() + 10))
    tempContentImage:SetPosY(10 + (math.floor)(itemIdx / 4) * (Frame_ContentImage:GetSizeY() + 10))
    tempContentImage:setRenderTexture(tempContentImage:getBaseTexture())
    tempContentImage:SetShow(true)
    -- DECOMPILER ERROR at PC96: Confused about usage of register: R14 in 'UnsetPending'

    ContentImage[itemIdx] = tempContentImage
  end
  FrameTemplate:UpdateContentScroll()
  Frame_Scroll:SetControlTop()
  FrameTemplate:UpdateContentPos()
end

SelectPoseEditorControl = function(customizationData)
  -- function num : 0_2 , upvalues : rotMin, rotMax, currentRotation, Slider_X, Slider_Y, Slider_Z
  EnablePoseEditSlide(true)
  rotMin = customizationData:getSelectedBoneRotationMin()
  rotMax = customizationData:getSelectedBoneRotationMax()
  currentRotation = customizationData:getSelectedBoneRotationValue()
  setRotationSlider(Slider_X, currentRotation.x, rotMin.x, rotMax.x)
  setRotationSlider(Slider_Y, currentRotation.y, rotMin.y, rotMax.y)
  setRotationSlider(Slider_Z, currentRotation.z, rotMin.z, rotMax.z)
end

AdjustPoseBoneRotation = function(rotationX, rotationY, rotationZ)
  -- function num : 0_3 , upvalues : Slider_X, rotMin, rotMax, Slider_Y, Slider_Z, currentRotation
  setRotationSlider(Slider_X, rotationX, rotMin.x, rotMax.x)
  setRotationSlider(Slider_Y, rotationY, rotMin.y, rotMax.y)
  setRotationSlider(Slider_Z, rotationZ, rotMin.z, rotMax.z)
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R3 in 'UnsetPending'

  currentRotation.x = rotationX
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

  currentRotation.y = rotationY
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R3 in 'UnsetPending'

  currentRotation.z = rotationZ
end

local CheckCursorInPoseEditorUI = function()
  -- function num : 0_4
end

RepositionPoseEditCursorUI = function(posX, posY)
  -- function num : 0_5
end

EnablePoseEditCursor = function(Enable)
  -- function num : 0_6
end

PoseEditSymmetryChecked = function()
  -- function num : 0_7 , upvalues : CheckButton_Symmetry
  setSymmetryBoneTransform(CheckButton_Symmetry:IsCheck())
end

OpenPoseEditUi = function(classType, uiId)
  -- function num : 0_8 , upvalues : Slider_X, Slider_Y, Slider_Z
  EnablePoseEditSlide(false)
  startPosePickingMode()
  Slider_X:SetControlPos(50)
  Slider_Y:SetControlPos(50)
  Slider_Z:SetControlPos(50)
  updateGroupFrameControls(Panel_CustomizationPoseEdit:GetSizeY(), Panel_CustomizationPoseEdit)
  UpdateSavedPoses()
  Panel_CustomizationPoseEdit:SetShow(true, false)
  UseIkPoseControl(false)
  PoseEditSymmetryChecked()
  EnablePoseEditCursor(true)
  setPresetCamera(4)
end

ClosePoseEditUi = function()
  -- function num : 0_9
  clearAllPoseBone()
  endPickingMode()
end

ShowPoseEditor = function(show)
  -- function num : 0_10 , upvalues : Slider_X, Slider_Y, Slider_Z
  if show == true then
    EnablePoseEditSlide(false)
    Slider_X:SetControlPos(50)
    Slider_Y:SetControlPos(50)
    Slider_Z:SetControlPos(50)
    updateGroupFrameControls(Panel_CustomizationPoseEdit:GetSizeY(), Panel_CustomizationPoseEdit)
    UpdateSavedPoses()
    Panel_CustomizationPoseEdit:SetShow(show, false)
    UseIkPoseControl(false)
    PoseEditSymmetryChecked()
    EnablePoseEditCursor(show)
  end
end

UpdateSavedPoses = function()
  -- function num : 0_11 , upvalues : UI_GroupType, Button_Slider_X, Button_Slider_Y, Button_Slider_Z, CheckButton_Symmetry, CheckButton_ControlPart, Button_AllReset, Button_PartReset, ContentImage, Button_Save, Button_Delete, FrameTemplate, Frame_Scroll
  Set_CustomizationUIPanel(0, Panel_CustomizationFrame, 10)
  ClearAll_CustomizationUIGroup(0)
  Add_CustomizationUIGroup(0, 0, UI_GroupType.eCONSOLE_UI_CONTROL_TYPE_CUSTOMIZATION)
  Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsolePrevFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB2)
  Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsoleNextFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB2)
  local maxcountx = 50
  local maxcounty = 50
  Add_CustomizationUIControl(0, 0, 0, 0, maxcountx, maxcounty, Button_Slider_X)
  Add_CustomizationUIControl(0, 0, 0, 1, maxcountx, maxcounty, Button_Slider_Y)
  Add_CustomizationUIControl(0, 0, 0, 2, maxcountx, maxcounty, Button_Slider_Z)
  Add_CustomizationUIControl(0, 0, 0, 3, maxcountx, maxcounty, CheckButton_Symmetry)
  Add_CustomizationUIControl(0, 0, 1, 3, maxcountx, maxcounty, CheckButton_ControlPart)
  Add_CustomizationUIControl(0, 0, 0, 4, maxcountx, maxcounty, Button_AllReset)
  Add_CustomizationUIControl(0, 0, 1, 4, maxcountx, maxcounty, Button_PartReset)
  Set_CustomizationUIgroupCurrentIndex(0, 0, 0, 3)
  local currentheight = 5
  local countx = 4
  local county = 3
  local realcount = 10
  for imageIndex = 0, 9 do
    local bPoseSlotEmpty = getPoseDataEmpty(imageIndex)
    if bPoseSlotEmpty == false then
      (ContentImage[imageIndex]):SetShow(true)
    else
      ;
      (ContentImage[imageIndex]):SetShow(false)
    end
    Add_CustomizationUIControl(0, 0, imageIndex % countx, currentheight + imageIndex / countx, maxcountx, maxcounty, ContentImage[imageIndex])
  end
  currentheight = currentheight + county
  Add_CustomizationUIControl(0, 0, 0, currentheight, maxcountx, maxcounty, Button_Save)
  Add_CustomizationUIControl(0, 0, 1, currentheight, maxcountx, maxcounty, Button_Delete)
  FrameTemplate:UpdateContentScroll()
  Frame_Scroll:SetControlTop()
  FrameTemplate:UpdateContentPos()
end

calculateSliderRotation = function(SliderControl, valueMin, valueMax)
  -- function num : 0_12
  local ratio = SliderControl:GetControlPos()
  local val = valueMax - valueMin
  return ratio * val - (val - (math.abs)(valueMax))
end

setRotationSlider = function(SliderControl, value, valueMin, valueMax)
  -- function num : 0_13
  local val = valueMax - valueMin
  if val ~= 0 then
    SliderControl:SetControlPos((value - valueMin) / val * 100)
  end
end

PoseEditSliderUpdate = function()
  -- function num : 0_14 , upvalues : Slider_X, rotMin, rotMax, Slider_Y, Slider_Z, currentRotation
  local x = calculateSliderRotation(Slider_X, rotMin.x, rotMax.x)
  local y = calculateSliderRotation(Slider_Y, rotMin.y, rotMax.y)
  local z = calculateSliderRotation(Slider_Z, rotMin.z, rotMax.z)
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R3 in 'UnsetPending'

  currentRotation.x = x
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R3 in 'UnsetPending'

  currentRotation.y = y
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R3 in 'UnsetPending'

  currentRotation.z = z
  applyPoseRotation(x, y, z)
end

PoseEditBoneDrag = function(bDrag)
  -- function num : 0_15
  if bDrag == true then
    EnablePoseEditCursor(false)
  else
    EnablePoseEditCursor(true)
  end
end

ClosePoseEditor = function()
  -- function num : 0_16 , upvalues : selectedImageIndex
  selectCustomizationControlPart(-1)
  clearAllPoseBone()
  selectedImageIndex = -1
end

SavePose = function()
  -- function num : 0_17
  savePoseInfo()
  UpdateSavedPoses()
end

DeletePose = function()
  -- function num : 0_18 , upvalues : selectedImageIndex
  if selectedImageIndex ~= -1 then
    deletePoseInfo(selectedImageIndex)
    UpdateSavedPoses()
  end
end

SelectPose = function(imageIndex)
  -- function num : 0_19 , upvalues : selectedImageIndex
  applyPose(imageIndex)
  selectedImageIndex = imageIndex
end

UseIkPoseControl = function(useIk)
  -- function num : 0_20
  if useIk == false then
    EnablePoseEditCursor(true)
  else
    if controlType == true then
      EnablePoseEditCursor(false)
    end
  end
  useIkPoseControl(useIk)
end

ToggleShowPosePreCheck = function()
  -- function num : 0_21 , upvalues : CheckButton_ControlPart
  if CheckButton_ControlPart:IsCheck() then
    showBoneControlPart(true)
  else
    showBoneControlPart(false)
  end
end

ToggleShowPoseBoneControlPart = function()
  -- function num : 0_22 , upvalues : CheckButton_ControlPart
  showBoneControlPart(CheckButton_ControlPart:IsCheck())
end

EnablePoseEditSlide = function(enable)
  -- function num : 0_23 , upvalues : Slider_X, Slider_Y, Slider_Z
  Slider_X:SetMonoTone(not enable)
  Slider_Y:SetMonoTone(not enable)
  Slider_Z:SetMonoTone(not enable)
  Slider_X:SetEnable(enable)
  Slider_Y:SetEnable(enable)
  Slider_Z:SetEnable(enable)
end

PoseFrameScrollUp = function()
  -- function num : 0_24 , upvalues : Frame_Scroll, FrameTemplate
  Frame_Scroll:SetCtrlPosByInterval(-7)
  FrameTemplate:UpdateContentPos()
end

PoseFrameScrollDown = function()
  -- function num : 0_25 , upvalues : Frame_Scroll, FrameTemplate
  Frame_Scroll:SetCtrlPosByInterval(7)
  FrameTemplate:UpdateContentPos()
end


