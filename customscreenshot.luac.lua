-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\customscreenshot\customscreenshot.luac 

-- params : ...
-- function num : 0
Panel_Widget_ScreenShotFrame:SetShow(false)
Panel_Widget_ScreenShotFrame:ActiveMouseEventEffect(true)
Panel_Widget_ScreenShotFrame:setGlassBackground(true)
local renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_customScreenShot}, false)
local KeyCode_ESCAPE = 27
local KeyCode_SPACE = 32
local KeyCode_RETURN = 13
local KeyCode_ADD = 107
local KeyCode_SUBTRACT = 109
local frameArea = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "Static_Frame")
local btnIncrease = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "Button_Increase")
local btnDecrease = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "Button_Decrease")
local btnScreenShot = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "Button_ScreenShot")
local ScreenShotFramedesc = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "StaticText_Desc")
local photoFilter = {_bg = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "Static_SelectTerritoryBg"), _title = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "StaticText_FilterTitle"), _name = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "StaticText_FilterValue"), _btnLeft = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "Button_Left"), _btnRight = (UI.getChildControl)(Panel_Widget_ScreenShotFrame, "Button_Right")}
local desc1 = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_DESC_1")
local desc2 = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_DESC_2")
local basePosX = getScreenSizeX() / 2 - Panel_Widget_ScreenShotFrame:GetSizeX() / 2
local basePosY = getScreenSizeY() / 2 - Panel_Widget_ScreenShotFrame:GetSizeY() / 2
local baseWidth = frameArea:GetSizeX()
local baseHeight = frameArea:GetSizeY()
local increaseSizeX = 100
local increaseSizeY = 110
local posX, posY, width, height = nil, nil, nil, nil
local subNameString = ""
local meanunglessNumber = -1
local prevUiMode = nil
local CheckUIModebyCustomScreenShot = function()
  -- function num : 0_0
  if ToClient_isGamePlayProcessor() == false then
    return false
  end
  if (Defines.UIMode).eUIMode_Default ~= GetUIMode() and (Defines.UIMode).eUIMode_InGameCustomize ~= GetUIMode() then
    ToClient_cancelRequestAddToFile()
    return true
  end
  return false
end

FromClient_OpenExplorer_CustomizingCharacter = function(title, defaultName, paramList)
  -- function num : 0_1
  local paramCount = 0
  local subNameStringBDC = ""
  for key,value in pairs(paramList) do
    if (string.sub)(value, 1, 5) == ".bdcp" or (string.sub)(value, 1, 4) ~= ".bdc" then
      return 
    end
    subNameStringBDC = (string.sub)(value, 5, -2)
    if subNameStringBDC == "" then
      subNameStringBDC = "_"
    end
    paramCount = paramCount + 1
    if paramCount > 1 then
      return 
    end
  end
  do
    do
      if paramCount ~= 1 or title ~= "" then
        return 
      end
      ToClient_UploadWebCustomizingCharacter(Panel_CustomizationMain:GetShow() == false, subNameStringBDC)
      -- DECOMPILER ERROR: 1 unprocessed JMP targets
    end
  end
end

FromClient_OpenExplorer_CustomSizeScreenShot = function(title, defaultName, paramList)
  -- function num : 0_2 , upvalues : subNameString, CheckUIModebyCustomScreenShot
  local paramCount = 0
  for key,value in pairs(paramList) do
    if (string.sub)(value, 1, 4) ~= ".bds" then
      return 
    end
    subNameString = (string.sub)(value, 5, -2)
    if subNameString == "" then
      subNameString = "_"
    end
    paramCount = paramCount + 1
    if paramCount > 1 then
      return 
    end
  end
  do
    if paramCount ~= 1 or title ~= "" then
      return 
    end
    if CheckUIModebyCustomScreenShot() then
      return 
    end
    subNameString = subNameString .. "_BeautyAlbum"
    ScreenShotFrame_Show()
  end
end

local currentLUT = nil
ScreenshotFrame_PhotoFilterShow = function()
  -- function num : 0_3 , upvalues : photoFilter, currentLUT
  for _,control in pairs(photoFilter) do
    control:SetShow(true)
    control:ComputePos()
  end
  currentLUT = FGlobal_GetCurrentLUT()
  local filterName = getCameraLUTFilterName(currentLUT)
  ;
  (photoFilter._name):SetText(filterName)
  setCameraLUTFilter(currentLUT)
end

ScreenshotFrame_PhotoFilterHide = function()
  -- function num : 0_4 , upvalues : photoFilter
  for _,control in pairs(photoFilter) do
    control:SetShow(false)
  end
end

ScreenshotFrame_SetFilter = function(LUT)
  -- function num : 0_5 , upvalues : currentLUT, photoFilter
  currentLUT = LUT
  local filterName = getCameraLUTFilterName(LUT)
  ;
  (photoFilter._name):SetText(filterName)
  setCameraLUTFilter(LUT)
end

ScreenshotFrame_LUTIncrease = function()
  -- function num : 0_6 , upvalues : currentLUT
  ScreenshotFrame_SetFilter(currentLUT + 1)
end

ScreenshotFrame_LUTDecrease = function()
  -- function num : 0_7 , upvalues : currentLUT
  ScreenshotFrame_SetFilter(currentLUT - 1)
end

;
(photoFilter._btnLeft):addInputEvent("Mouse_LUp", "ScreenshotFrame_LUTDecrease()")
;
(photoFilter._btnRight):addInputEvent("Mouse_LUp", "ScreenshotFrame_LUTIncrease()")
FromClient_OpenExplorer_FullScreenSizeScreenShot = function(title, defaultName, paramList)
  -- function num : 0_8 , upvalues : subNameString, CheckUIModebyCustomScreenShot, meanunglessNumber
  local paramCount = 0
  for key,value in pairs(paramList) do
    if (string.sub)(value, 1, 4) ~= ".bdf" then
      return 
    end
    subNameString = (string.sub)(value, 5, -2)
    if subNameString == "" then
      subNameString = "_"
    end
    paramCount = paramCount + 1
    if paramCount > 1 then
      return 
    end
  end
  do
    if paramCount ~= 1 or title ~= "" then
      return 
    end
    if CheckUIModebyCustomScreenShot() then
      return 
    end
    meanunglessNumber = meanunglessNumber + 1
    subNameString = subNameString .. "_PhotoGallery_" .. tostring(meanunglessNumber)
    FullScreenShotFrame_Show()
  end
end

local isFullScreenShotMode = false
FullScreenShotFrame_Show = function()
  -- function num : 0_9 , upvalues : isFullScreenShotMode, prevUiMode, renderMode, frameArea, width, height, btnIncrease, btnDecrease, btnScreenShot, ScreenShotFramedesc
  isFullScreenShotMode = true
  prevUiMode = GetUIMode()
  SetUIMode((Defines.UIMode).eUIMode_ScreenShotMode)
  setRenderCrossHair(false)
  renderMode:set()
  local gameoptionController = ToClient_getGameOptionControllerWrapper()
  if gameoptionController:getCropModeEnable() == false then
    Panel_Widget_ScreenShotFrame:SetShow(true)
    Panel_Widget_ScreenShotFrame:SetSize(getScreenSizeX(), getScreenSizeY())
    Panel_Widget_ScreenShotFrame:SetPosX(0)
    Panel_Widget_ScreenShotFrame:SetPosY(0)
    frameArea:SetSize(getScreenSizeX(), getScreenSizeY())
    width = getResolutionSizeX()
    height = getResolutionSizeY()
  else
    Panel_Widget_ScreenShotFrame:SetShow(true)
    Panel_Widget_ScreenShotFrame:SetSize(getScreenSizeX(), getScreenSizeY())
    Panel_Widget_ScreenShotFrame:SetPosX(0)
    Panel_Widget_ScreenShotFrame:SetPosY(0)
    frameArea:SetSize(getScreenSizeX() * gameoptionController:getCropModeScaleX(), getScreenSizeY() * gameoptionController:getCropModeScaleY())
    width = getResolutionSizeX() * gameoptionController:getCropModeScaleX()
    height = getResolutionSizeY() * gameoptionController:getCropModeScaleY()
  end
  frameArea:ComputePos()
  btnIncrease:SetShow(false)
  btnDecrease:SetShow(false)
  btnScreenShot:SetSpanSize(0, 60)
  btnScreenShot:ComputePos()
  ScreenShotFramedesc:SetSpanSize(0, 30)
  ScreenShotFramedesc:ComputePos()
  ScreenshotFrame_PhotoFilterShow()
  Panel_Widget_ScreenShotFrame:SetIgnore(true)
  ToClient_setScreenShotModeState(true)
end

ScreenShotFrame_Show = function()
  -- function num : 0_10 , upvalues : isFullScreenShotMode, ScreenShotFramedesc, desc2, prevUiMode, renderMode, desc1, baseWidth, baseHeight, basePosX, basePosY, frameArea, btnIncrease, btnDecrease, btnScreenShot, width, height
  isFullScreenShotMode = false
  if ToClient_isLobbyProcessor() then
    if not isShowCustomizationMain() then
      Proc_ShowMessage_Ack_WithOut_ChattingMessage("현재 단계에서�\148 스크린샷�\132 찍을 �\152 없습니다.")
      return 
    end
    FGlobal_CustomizingAlbum_Close()
    FGlobal_Customization_UiClose()
    ScreenShotFramedesc:SetText(desc2)
  else
    if (Defines.UIMode).eUIMode_InGameCustomize == GetUIMode() then
      if not isShowCustomizationMain() then
        Proc_ShowMessage_Ack_WithOut_ChattingMessage("현재 단계에서�\148 스크린샷�\132 찍을 �\152 없습니다.")
        return 
      end
      FGlobal_CustomizingAlbum_Close()
      FGlobal_Customization_UiClose()
      ScreenShotFramedesc:SetText(desc2)
    else
      prevUiMode = GetUIMode()
      SetUIMode((Defines.UIMode).eUIMode_ScreenShotMode)
      setRenderCrossHair(false)
      renderMode:set()
      ScreenShotFramedesc:SetText(desc1)
    end
  end
  Panel_Widget_ScreenShotFrame:SetShow(true)
  Panel_Widget_ScreenShotFrame:SetSize(baseWidth, baseHeight)
  Panel_Widget_ScreenShotFrame:SetPosX(basePosX)
  Panel_Widget_ScreenShotFrame:SetPosY(basePosY)
  frameArea:SetSize(baseWidth, baseHeight)
  frameArea:ComputePos()
  btnIncrease:ComputePos()
  btnDecrease:ComputePos()
  btnScreenShot:SetSpanSize(60, -60)
  ScreenShotFramedesc:SetSpanSize(0, -90)
  btnScreenShot:ComputePos()
  ScreenShotFramedesc:ComputePos()
  width = baseWidth
  height = baseHeight
  btnIncrease:SetShow(true)
  btnDecrease:SetShow(true)
  btnIncrease:addInputEvent("Mouse_LUp", "ScreenShotFrameSize_Increase()")
  btnDecrease:addInputEvent("Mouse_LUp", "ScreenShotFrameSize_Decrease()")
  ScreenshotFrame_PhotoFilterHide()
  ToClient_setScreenShotModeState(true)
end

ScreenShotFrameSize_Increase = function()
  -- function num : 0_11 , upvalues : isFullScreenShotMode, frameArea, increaseSizeX, width, increaseSizeY, height, btnIncrease, btnDecrease, btnScreenShot, ScreenShotFramedesc
  if isFullScreenShotMode then
    return 
  end
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelPosX = Panel_Widget_ScreenShotFrame:GetPosX()
  local panelPosY = Panel_Widget_ScreenShotFrame:GetPosY()
  if panelPosX + frameArea:GetPosX() - increaseSizeX / 2 < 0 or scrSizeX < panelPosX + frameArea:GetPosX() + width + increaseSizeX / 2 then
    return 
  end
  if panelPosY + frameArea:GetPosY() - increaseSizeY < 0 then
    return 
  end
  width = width + increaseSizeX
  height = height + increaseSizeY
  Panel_Widget_ScreenShotFrame:SetSize(width, height)
  Panel_Widget_ScreenShotFrame:SetPosX(panelPosX - increaseSizeX / 2)
  Panel_Widget_ScreenShotFrame:SetPosY(panelPosY - increaseSizeY)
  Panel_Widget_ScreenShotFrame:SetDragEnable(true)
  Panel_Widget_ScreenShotFrame:SetDragAll(true)
  frameArea:SetSize(width, height)
  frameArea:ComputePos()
  btnIncrease:ComputePos()
  btnDecrease:ComputePos()
  btnScreenShot:ComputePos()
  ScreenShotFramedesc:ComputePos()
end

ScreenShotFrameSize_Decrease = function()
  -- function num : 0_12 , upvalues : isFullScreenShotMode, width, increaseSizeX, baseWidth, height, increaseSizeY, baseHeight, frameArea, btnIncrease, btnDecrease, btnScreenShot, ScreenShotFramedesc
  if isFullScreenShotMode then
    return 
  end
  if width - increaseSizeX < baseWidth or height - increaseSizeY < baseHeight then
    return 
  end
  width = width - increaseSizeX
  height = height - increaseSizeY
  Panel_Widget_ScreenShotFrame:SetSize(width, height)
  Panel_Widget_ScreenShotFrame:SetPosX(Panel_Widget_ScreenShotFrame:GetPosX() + increaseSizeX / 2)
  Panel_Widget_ScreenShotFrame:SetPosY(Panel_Widget_ScreenShotFrame:GetPosY() + increaseSizeY)
  Panel_Widget_ScreenShotFrame:SetDragEnable(true)
  Panel_Widget_ScreenShotFrame:SetDragAll(true)
  frameArea:SetSize(width, height)
  frameArea:ComputePos()
  btnIncrease:ComputePos()
  btnDecrease:ComputePos()
  btnScreenShot:ComputePos()
  ScreenShotFramedesc:ComputePos()
end

ScreenShotSave_ForWeb = function()
  -- function num : 0_13 , upvalues : posX, posY, isFullScreenShotMode, frameArea, width, height, subNameString
  local currentUiScale = (ToClient_getGameOptionControllerWrapper()):getUIScale()
  posX = Panel_Widget_ScreenShotFrame:GetPosX() * currentUiScale
  posY = Panel_Widget_ScreenShotFrame:GetPosY() * currentUiScale
  Panel_Widget_ScreenShotFrame:SetShow(false)
  local gameoptionController = ToClient_getGameOptionControllerWrapper()
  if isFullScreenShotMode then
    if gameoptionController:getCropModeEnable() == false then
      posX = Panel_Widget_ScreenShotFrame:GetPosX()
      posY = Panel_Widget_ScreenShotFrame:GetPosY()
    else
      posX = frameArea:GetPosX() * currentUiScale
      posY = frameArea:GetPosY() * currentUiScale
    end
  else
    width = width * currentUiScale
    height = height * currentUiScale
  end
  ToClient_ProgressCapture(posX, posY, width, height, subNameString)
end

FromClient_CustomizedCaptureComplete = function()
  -- function num : 0_14
  ScreenShotFrame_Close()
end

ScreenShotFrame_Close = function()
  -- function num : 0_15 , upvalues : prevUiMode, renderMode, isFullScreenShotMode
  Panel_Widget_ScreenShotFrame:SetShow(false)
  ToClient_cancelRequestAddToFile()
  if ToClient_isLobbyProcessor() then
    FGlobal_Customization_UiShow()
    FGlobal_CustomizingAlbum_ShowByScreenShotFrame()
  else
    if (Defines.UIMode).eUIMode_ScreenShotMode ~= GetUIMode() then
      FGlobal_Customization_UiShow()
      FGlobal_CustomizingAlbum_ShowByScreenShotFrame()
    else
      SetUIMode(prevUiMode)
      setRenderCrossHair(true)
      renderMode:reset()
    end
  end
  if isFullScreenShotMode then
    setCameraLUTFilter(FGlobal_GetCurrentLUT())
  end
  Panel_Widget_ScreenShotFrame:SetIgnore(false)
  ToClient_setScreenShotModeState(false)
end

FGlobal_ScreenShotFrame_Close = function()
  -- function num : 0_16
  ScreenShotFrame_Close()
end

FGlobal_TakeAScreenShot = function()
  -- function num : 0_17
  ScreenShotSave_ForWeb()
end

ScreenShotFrame_RePos = function()
  -- function num : 0_18 , upvalues : KeyCode_ESCAPE, KeyCode_SPACE, KeyCode_RETURN, KeyCode_ADD, KeyCode_SUBTRACT, isFullScreenShotMode
  if ToClient_isLobbyProcessor() then
    if isKeyDown_Once(KeyCode_ESCAPE) then
      local screenShotFrame_Close = function()
    -- function num : 0_18_0
    FGlobal_ScreenShotFrame_Close()
  end

      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_CONTENT")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFRAME_MSGBOX_TITLE"), content = messageBoxMemo, functionYes = screenShotFrame_Close, functionNo = MessageBox_Empty_function, exitButton = true, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    else
      do
        if isKeyDown_Once(KeyCode_SPACE) or isKeyDown_Once(KeyCode_RETURN) then
          FGlobal_TakeAScreenShot()
        else
          if isKeyDown_Once(KeyCode_ADD) then
            ScreenShotFrameSize_Increase()
          else
            if isKeyDown_Once(KeyCode_SUBTRACT) then
              ScreenShotFrameSize_Decrease()
            end
          end
        end
        if isFullScreenShotMode then
          return 
        end
        local scrX = getScreenSizeX()
        local scrY = getScreenSizeY()
        local posX = Panel_Widget_ScreenShotFrame:GetPosX()
        local posY = Panel_Widget_ScreenShotFrame:GetPosY()
        local sizeX = Panel_Widget_ScreenShotFrame:GetSizeX()
        local sizeY = Panel_Widget_ScreenShotFrame:GetSizeY()
        if posX < 10 then
          Panel_Widget_ScreenShotFrame:SetPosX(10)
        end
        if scrX - 10 < posX + sizeX then
          Panel_Widget_ScreenShotFrame:SetPosX(scrX - sizeX - 10)
        end
        if posY < 10 then
          Panel_Widget_ScreenShotFrame:SetPosY(10)
        end
        -- DECOMPILER ERROR at PC117: Unhandled construct in 'MakeBoolean' P1

        if ToClient_isLobbyProcessor() and scrY - 90 < posY + sizeY then
          Panel_Widget_ScreenShotFrame:SetPosY(scrY - sizeY - 90)
        end
        -- DECOMPILER ERROR at PC134: Unhandled construct in 'MakeBoolean' P1

        if (Defines.UIMode).eUIMode_ScreenShotMode == GetUIMode() and scrY - 100 < posY + sizeY then
          Panel_Widget_ScreenShotFrame:SetPosY(scrY - sizeY - 100)
        end
        if scrY - 90 < posY + sizeY then
          Panel_Widget_ScreenShotFrame:SetPosY(scrY - sizeY - 90)
        end
      end
    end
  end
end

btnScreenShot:addInputEvent("Mouse_LUp", "ScreenShotSave_ForWeb()")
Panel_Widget_ScreenShotFrame:RegisterUpdateFunc("ScreenShotFrame_RePos")
registerEvent("FromClient_OpenExplorer", "FromClient_OpenExplorer_FullScreenSizeScreenShot")
registerEvent("FromClient_OpenExplorer", "FromClient_OpenExplorer_CustomSizeScreenShot")
registerEvent("FromClient_OpenExplorer", "FromClient_OpenExplorer_CustomizingCharacter")
registerEvent("FromClient_CustomizedCaptureComplete", "FromClient_CustomizedCaptureComplete")
renderMode:setClosefunctor(renderMode, FGlobal_ScreenShotFrame_Close)

