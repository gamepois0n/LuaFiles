-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dye\panel_dyenew_charactercontroller.luac 

-- params : ...
-- function num : 0
Panel_DyeNew_CharacterController:SetShow(false)
local DyeNewController = {isLdown = false, isRdown = false, lMovePos = 0, yMovePos = 0, btn_EyeSee = (UI.getChildControl)(Panel_DyeNew_CharacterController, "CheckButton_EyeSee"), btn_ShowUI = (UI.getChildControl)(Panel_DyeNew_CharacterController, "CheckButton_ShowUI"), btn_Weather = (UI.getChildControl)(Panel_DyeNew_CharacterController, "CheckButton_Weather"), btn_Exit = (UI.getChildControl)(Panel_DyeNew_CharacterController, "Button_Exit"), btn_Pose = (UI.getChildControl)(Panel_DyeNew_CharacterController, "Button_pose"), btn_temp1 = (UI.getChildControl)(Panel_DyeNew_CharacterController, "Button_pose1"), btn_temp2 = (UI.getChildControl)(Panel_DyeNew_CharacterController, "Button_pose2"), btn_temp3 = (UI.getChildControl)(Panel_DyeNew_CharacterController, "Button_pose3"), btn_temp4 = (UI.getChildControl)(Panel_DyeNew_CharacterController, "Button_pose4"), btn_temp5 = (UI.getChildControl)(Panel_DyeNew_CharacterController, "Button_pose5"), btn_temp6 = (UI.getChildControl)(Panel_DyeNew_CharacterController, "Button_pose6")}
DyeNewController.initialize = function(self)
  -- function num : 0_0
  (self.btn_EyeSee):ComputePos()
  ;
  (self.btn_ShowUI):ComputePos()
  ;
  (self.btn_Weather):ComputePos()
  ;
  (self.btn_Pose):ComputePos()
  ;
  (self.btn_temp1):ComputePos()
  ;
  (self.btn_temp2):ComputePos()
  ;
  (self.btn_temp3):ComputePos()
  ;
  (self.btn_temp4):ComputePos()
  ;
  (self.btn_temp5):ComputePos()
  ;
  (self.btn_temp6):ComputePos()
  ;
  (self.btn_Exit):ComputePos()
end

deyNew_Controller_UpdateCharacterRotate = function(deltatime)
  -- function num : 0_1 , upvalues : DyeNewController
  local self = DyeNewController
  if self.isLdown == false and self.isRdown == false then
    return 
  end
  local currPos = getMousePosX()
  local currPosY = getMousePosY()
  if currPos == self.lMovePos and currPosY == self.yMovePos then
    return 
  end
  local radianAngle = (self.lMovePos - currPos) / (getScreenSizeX() / 10)
  local cameraPitch = (currPosY - self.yMovePos) / (getScreenSizeY() / 2)
  self.lMovePos = currPos
  self.yMovePos = currPosY
  if self.isLdown then
    ToClient_RequestUpdateDyeVaryCameraPosition(radianAngle * 30, cameraPitch * 90)
  end
  if self.isRdown then
    ToClient_RequestUpdateDyeVaryRotation(radianAngle * 0.8, -(cameraPitch * 2))
  end
end

HandleClicked_DeyNew_SetCharacterRotate_Start = function(isLDown)
  -- function num : 0_2 , upvalues : DyeNewController
  local self = DyeNewController
  if isLDown then
    self.isLdown = true
  else
    self.isRdown = true
  end
  self.lMovePos = getMousePosX()
  self.yMovePos = getMousePosY()
end

HandleClicked_DeyNew_SetCharacterRotate_End = function(isLDown)
  -- function num : 0_3 , upvalues : DyeNewController
  local self = DyeNewController
  if isLDown == nil then
    self.isLdown = false
    self.isRdown = false
  else
    if isLDown then
      self.isLdown = false
    else
      self.isRdown = false
    end
  end
end

HandleClicked_DeyNew_SetCharacterScroll = function(isUp)
  -- function num : 0_4
  local upValue = 35
  if isUp == true then
    upValue = -upValue
  end
  ToClient_RequestUpdateDyeVaryZoom(upValue)
end

HandleClicked_dyeNew_SetCharacterViewCamera = function()
  -- function num : 0_5 , upvalues : DyeNewController
  local self = DyeNewController
  ToClient_setCharacterViewCamera((self.btn_EyeSee):IsCheck())
end

HandleClicked_DeyNew_SetShowUI = function()
  -- function num : 0_6
  if Panel_Dye_New:GetShow() then
    Panel_Dye_New:SetShow(false)
    Panel_Window_Inventory:SetShow(false)
  else
    Panel_Dye_New:SetShow(true)
    Panel_Window_Inventory:SetShow(true)
  end
end

HandleClicked_DeyNew_Exit = function()
  -- function num : 0_7
  FGlobal_Panel_DyeReNew_Hide()
end

FGlobal_DyeNew_CharacterController_Open = function()
  -- function num : 0_8
  Panel_DyeNew_CharacterController:SetShow(true)
  FGlobal_BuffTooltipOff()
end

FGlobal_DyeNew_CharacterController_Close = function()
  -- function num : 0_9 , upvalues : DyeNewController
  local self = DyeNewController
  Panel_DyeNew_CharacterController:SetShow(false)
  ;
  (self.btn_Weather):SetCheck(false)
  ;
  (self.btn_temp1):SetShow(false)
  ;
  (self.btn_temp2):SetShow(false)
  ;
  (self.btn_temp3):SetShow(false)
  ;
  (self.btn_temp4):SetShow(false)
  ;
  (self.btn_temp5):SetShow(false)
  ;
  (self.btn_temp6):SetShow(false)
end

FGlobal_DeyNew_CharacterController_AddonButtonSet_ByCharacterType = function(set)
  -- function num : 0_10 , upvalues : DyeNewController
  local self = DyeNewController
  ;
  (self.btn_EyeSee):SetEnable(set)
  ;
  (self.btn_EyeSee):SetMonoTone(not set)
  ;
  (self.btn_Pose):SetEnable(set)
  ;
  (self.btn_Pose):SetMonoTone(not set)
  ;
  (self.btn_temp1):SetEnable(set)
  ;
  (self.btn_temp1):SetMonoTone(not set)
  ;
  (self.btn_temp2):SetEnable(set)
  ;
  (self.btn_temp2):SetMonoTone(not set)
  ;
  (self.btn_temp3):SetEnable(set)
  ;
  (self.btn_temp3):SetMonoTone(not set)
  ;
  (self.btn_temp4):SetEnable(set)
  ;
  (self.btn_temp4):SetMonoTone(not set)
  ;
  (self.btn_temp5):SetEnable(set)
  ;
  (self.btn_temp5):SetMonoTone(not set)
  ;
  (self.btn_temp6):SetEnable(set)
  ;
  (self.btn_temp6):SetMonoTone(not set)
end

dyeNew_CharacterController_SetPosition = function()
  -- function num : 0_11 , upvalues : DyeNewController
  local self = DyeNewController
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  Panel_DyeNew_CharacterController:SetSize(scrSizeX, scrSizeY)
  ;
  (self.btn_Pose):SetSpanSize(160, 22)
  ;
  (self.btn_temp1):SetSpanSize(250, 70)
  ;
  (self.btn_temp2):SetSpanSize(200, 70)
  ;
  (self.btn_temp3):SetSpanSize(150, 70)
  ;
  (self.btn_temp4):SetSpanSize(100, 70)
  ;
  (self.btn_temp5):SetSpanSize(50, 70)
  ;
  (self.btn_temp6):SetSpanSize(0, 70)
  ;
  (self.btn_EyeSee):ComputePos()
  ;
  (self.btn_ShowUI):ComputePos()
  ;
  (self.btn_Weather):ComputePos()
  ;
  (self.btn_Pose):ComputePos()
  ;
  (self.btn_temp1):ComputePos()
  ;
  (self.btn_temp2):ComputePos()
  ;
  (self.btn_temp3):ComputePos()
  ;
  (self.btn_temp4):ComputePos()
  ;
  (self.btn_temp5):ComputePos()
  ;
  (self.btn_temp6):ComputePos()
  ;
  (self.btn_Exit):ComputePos()
end

HandleClicked_WeatherToggle = function()
  -- function num : 0_12 , upvalues : DyeNewController
  local self = DyeNewController
  local weatherCheck = (self.btn_Weather):IsCheck()
  ;
  (self.btn_temp1):SetShow(weatherCheck)
  ;
  (self.btn_temp2):SetShow(weatherCheck)
  ;
  (self.btn_temp3):SetShow(weatherCheck)
  ;
  (self.btn_temp4):SetShow(weatherCheck)
  ;
  (self.btn_temp5):SetShow(weatherCheck)
  ;
  (self.btn_temp6):SetShow(weatherCheck)
  self:SetConsolePadGroup(weatherCheck)
end

HandleClicked_DeyNew_RandomPose = function()
  -- function num : 0_13
  local randValue = (math.random)(4, 9)
  if isGameTypeTaiwan() and randValue == 6 then
    randValue = 8
  end
  ToClient_setActionChart(randValue)
end

HandleClicked_WeatherSetting = function(weatherType)
  -- function num : 0_14
  if weatherType == 1 then
    weatherIndex = 0
  else
    if weatherType == 2 then
      weatherIndex = 3
    else
      if weatherType == 3 then
        weatherIndex = 7
      else
        if weatherType == 4 then
          weatherIndex = 11
        else
          if weatherType == 5 then
            weatherIndex = 15
          else
            if weatherType == 6 then
              weatherIndex = 19
            end
          end
        end
      end
    end
  end
  ToClient_RequestUpdateDyeSetCustomWeather(6, weatherIndex)
end

HandleOver_DyeNew_SimpleTooltips = function(isShow, tipType)
  -- function num : 0_15 , upvalues : DyeNewController
  local name, desc, control = nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_POSE")
    control = DyeNewController.btn_Pose
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EYESEE")
      control = DyeNewController.btn_EyeSee
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SHOWUI")
        control = DyeNewController.btn_ShowUI
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SUNICON")
          control = DyeNewController.btn_Weather
        end
      end
    end
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

DyeNewController.registEventHandler = function(self)
  -- function num : 0_16
  Panel_DyeNew_CharacterController:addInputEvent("Mouse_LDown", "HandleClicked_DeyNew_SetCharacterRotate_Start(true)")
  Panel_DyeNew_CharacterController:addInputEvent("Mouse_LUp", "HandleClicked_DeyNew_SetCharacterRotate_End(true)")
  Panel_DyeNew_CharacterController:addInputEvent("Mouse_Out", "HandleClicked_DeyNew_SetCharacterRotate_End()")
  Panel_DyeNew_CharacterController:addInputEvent("Mouse_RDown", "HandleClicked_DeyNew_SetCharacterRotate_Start(false)")
  Panel_DyeNew_CharacterController:addInputEvent("Mouse_RUp", "HandleClicked_DeyNew_SetCharacterRotate_End(false)")
  Panel_DyeNew_CharacterController:addInputEvent("Mouse_UpScroll", "HandleClicked_DeyNew_SetCharacterScroll(true)")
  Panel_DyeNew_CharacterController:addInputEvent("Mouse_DownScroll", "HandleClicked_DeyNew_SetCharacterScroll(false)")
  ;
  (self.btn_Pose):addInputEvent("Mouse_LUp", "HandleClicked_DeyNew_RandomPose()")
  ;
  (self.btn_Pose):addInputEvent("Mouse_On", "HandleOver_DyeNew_SimpleTooltips( true, 0 )")
  ;
  (self.btn_Pose):addInputEvent("Mouse_Out", "HandleOver_DyeNew_SimpleTooltips( false, 0 )")
  ;
  (self.btn_Pose):setTooltipEventRegistFunc("HandleOver_DyeNew_SimpleTooltips( true, 0 )")
  ;
  (self.btn_EyeSee):addInputEvent("Mouse_LUp", "HandleClicked_dyeNew_SetCharacterViewCamera()")
  ;
  (self.btn_EyeSee):addInputEvent("Mouse_On", "HandleOver_DyeNew_SimpleTooltips( true, 1 )")
  ;
  (self.btn_EyeSee):addInputEvent("Mouse_Out", "HandleOver_DyeNew_SimpleTooltips( false, 1 )")
  ;
  (self.btn_EyeSee):setTooltipEventRegistFunc("HandleOver_DyeNew_SimpleTooltips( true, 1 )")
  ;
  (self.btn_ShowUI):addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetShowUI()")
  ;
  (self.btn_ShowUI):addInputEvent("Mouse_On", "HandleOver_DyeNew_SimpleTooltips( true, 2 )")
  ;
  (self.btn_ShowUI):addInputEvent("Mouse_Out", "HandleOver_DyeNew_SimpleTooltips( false, 2 )")
  ;
  (self.btn_ShowUI):setTooltipEventRegistFunc("HandleOver_DyeNew_SimpleTooltips( true, 2 )")
  ;
  (self.btn_Weather):addInputEvent("Mouse_LUp", "HandleClicked_WeatherToggle()")
  ;
  (self.btn_Weather):addInputEvent("Mouse_On", "HandleOver_DyeNew_SimpleTooltips( true, 3 )")
  ;
  (self.btn_Weather):addInputEvent("Mouse_Out", "HandleOver_DyeNew_SimpleTooltips( false, 3 )")
  ;
  (self.btn_Weather):setTooltipEventRegistFunc("HandleOver_DyeNew_SimpleTooltips( true, 3 )")
  ;
  (self.btn_temp1):addInputEvent("Mouse_LUp", "HandleClicked_WeatherSetting( 1 )")
  ;
  (self.btn_temp2):addInputEvent("Mouse_LUp", "HandleClicked_WeatherSetting( 2 )")
  ;
  (self.btn_temp3):addInputEvent("Mouse_LUp", "HandleClicked_WeatherSetting( 3 )")
  ;
  (self.btn_temp4):addInputEvent("Mouse_LUp", "HandleClicked_WeatherSetting( 4 )")
  ;
  (self.btn_temp5):addInputEvent("Mouse_LUp", "HandleClicked_WeatherSetting( 5 )")
  ;
  (self.btn_temp6):addInputEvent("Mouse_LUp", "HandleClicked_WeatherSetting( 6 )")
  ;
  (self.btn_Exit):addInputEvent("Mouse_LUp", "HandleClicked_DeyNew_Exit()")
end

ConsoleGroupCreate_Panel_DyeNew_CharacterController = function()
  -- function num : 0_17
end

DyeNewController.SetConsolePadGroup = function(self, isAdd)
  -- function num : 0_18
  if isAdd then
  end
end

Panel_DyeNew_CharacterController:RegisterUpdateFunc("deyNew_Controller_UpdateCharacterRotate")
registerEvent("onScreenResize", "dyeNew_CharacterController_SetPosition")
DyeNewController:initialize()
DyeNewController:registEventHandler()
dyeNew_CharacterController_SetPosition()
ConsoleGroupCreate_Panel_DyeNew_CharacterController()

