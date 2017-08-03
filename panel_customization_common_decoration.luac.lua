-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\panel_customization_common_decoration.luac 

-- params : ...
-- function num : 0
local UI_GroupType = CppEnums.PA_CONSOLE_UI_CONTROL_TYPE
local NoCashType = CppEnums.CustomizationNoCashType
local NoCashDeco = CppEnums.CustomizationNoCashDeco
local isTattooMode = false
local FrameTemplate = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Frame_Template")
local Frame_Content = (UI.getChildControl)(FrameTemplate, "Frame_Content")
local Frame_ContentImage = (UI.getChildControl)(Frame_Content, "Frame_Content_Image")
local Frame_Scroll = (UI.getChildControl)(FrameTemplate, "Frame_Scroll")
local Static_SelectMark = (UI.getChildControl)(Frame_Content, "Static_SelectMark")
local Static_PayMark = (UI.getChildControl)(Frame_Content, "Static_PayMark")
local FrameTemplateColor = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Frame_Template_Color")
local Static_Collision = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Static_Collision")
local RadioButton_Template = (UI.getChildControl)(Panel_Customization_Common_Decoration, "RadioButton_Template")
local SliderControlArr = {}
local SliderButtonArr = {}
local SliderTextArr = {}
local SliderValueArr = {}
local CheckControlArr = {}
local CheckTextArr = {}
CheckControlArr[1] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "CheckButton_Left")
CheckControlArr[2] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "CheckButton_Right")
CheckTextArr[1] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_EyeLeft")
CheckTextArr[2] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_EyeRight")
SliderControlArr[1] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Slider_Control1")
SliderControlArr[2] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Slider_Control2")
SliderControlArr[3] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Slider_Control3")
SliderControlArr[4] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Slider_Control4")
SliderControlArr[5] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Slider_Control5")
SliderControlArr[6] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Slider_Control6")
SliderControlArr[7] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "Slider_Control7")
SliderButtonArr[1] = (UI.getChildControl)(SliderControlArr[1], "Slider_GammaController_Button")
SliderButtonArr[2] = (UI.getChildControl)(SliderControlArr[2], "Slider_GammaController_Button")
SliderButtonArr[3] = (UI.getChildControl)(SliderControlArr[3], "Slider_GammaController_Button")
SliderButtonArr[4] = (UI.getChildControl)(SliderControlArr[4], "Slider_GammaController_Button")
SliderButtonArr[5] = (UI.getChildControl)(SliderControlArr[5], "Slider_GammaController_Button")
SliderButtonArr[6] = (UI.getChildControl)(SliderControlArr[6], "Slider_GammaController_Button")
SliderButtonArr[7] = (UI.getChildControl)(SliderControlArr[7], "Slider_GammaController_Button")
SliderTextArr[1] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderText1")
SliderTextArr[2] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderText2")
SliderTextArr[3] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderText3")
SliderTextArr[4] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderText4")
SliderTextArr[5] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderText5")
SliderTextArr[6] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderText6")
SliderTextArr[7] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderText7")
SliderValueArr[1] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderValue1")
SliderValueArr[2] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderValue2")
SliderValueArr[3] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderValue3")
SliderValueArr[4] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderValue4")
SliderValueArr[5] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderValue5")
SliderValueArr[6] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderValue6")
SliderValueArr[7] = (UI.getChildControl)(Panel_Customization_Common_Decoration, "StaticText_SliderValue7")
local sliderParamType = {}
local sliderParamIndex = {}
local sliderParamIndex2 = {}
local sliderParam = {}
local sliderParamMin = {}
local sliderParamMax = {}
local sliderParamDefault = {}
;
(CheckTextArr[1]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATIONEYE_EYELEFT"))
;
(CheckTextArr[2]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATIONEYE_EYERIGHT"))
registerEvent("EventOpenCommonDecorationUi", "OpenCommonDecorationUi")
registerEvent("EventCloseCommonDecorationUi", "CloseCommonDecorationUi")
registerEvent("EventOpenEyeDecorationUi", "OpenEyeDecorationUi")
registerEvent("EventCloseEyeDecorationUi", "CloseEyeDecorationUi")
registerEvent("EventOpenTattooDecorationUi", "OpenTattooDecorationUi")
registerEvent("EventCloseTattooDecorationUi", "CloseTattooDecorationUi")
registerEvent("EventEnableDecorationSlide", "EnableDecorationSlide")
registerEvent("EventOpenCommonExpressionUi", "OpenCommonExpressionUi")
registerEvent("EventCloseCommonExpressionUi", "CloseCommonExpressionUi")
local selectedClassType, selectedUiId, selectedListParamType, selectedListParamIndex, selectedItemIndex = nil, nil, nil, nil, nil
local ContentImage = {}
local PayMark = {}
local decoGroup = {}
local RadioButtonGroup = {}
local selectedDecoGroupIdx = 0
local selectedDecoPartIdx = 0
local luaSelectedDecoGroupIdx = 0
local contentsStartY = 0
local controlOffset = 10
local radioButtonStartX = 10
local radioButtonStartY = 10
local radioButtonColumnNum = 3
local radioButtonGap = 2
local radioButtonColumnWidth = RadioButton_Template:GetSizeX() + radioButtonGap
local radioButtonColumnHeight = RadioButton_Template:GetSizeY() + radioButtonGap
local imageFrameSizeY = 125
local listColumCount = 4
local listOffset = 10
local listColumnWidth = Frame_ContentImage:GetSizeX() + listOffset
local listColumnHeight = Frame_ContentImage:GetSizeY() + listOffset
local listStartX = 10
local listStartY = 10
local sliderOffset = 7
local sliderValueOffset = 10
local sliderHeight = (SliderTextArr[1]):GetSizeY()
local colorPickerStartY = 370
local currentclassType = -1
local currentuiId = -1
checkType = -1
local currentcontentindex = -1
local UpdateMarkPosition = function(shapeIdx)
  -- function num : 0_0 , upvalues : FrameTemplate, Static_SelectMark, listColumCount, listColumnWidth, listStartX, listColumnHeight, listStartY
  if FrameTemplate:GetShow() then
    if shapeIdx ~= -1 then
      Static_SelectMark:SetShow(true)
      Static_SelectMark:SetPosX(shapeIdx % listColumCount * listColumnWidth + listStartX)
      Static_SelectMark:SetPosY((math.floor)(shapeIdx / listColumCount) * listColumnHeight + listStartY)
    else
      Static_SelectMark:SetShow(false)
    end
  end
end

local clearRadioButtons = function()
  -- function num : 0_1 , upvalues : RadioButtonGroup
  for _,rb in pairs(RadioButtonGroup) do
    rb:SetShow(false)
    ;
    (UI.deleteControl)(rb)
  end
  RadioButtonGroup = {}
end

local clearContents = function()
  -- function num : 0_2 , upvalues : ContentImage, PayMark, SliderControlArr, SliderTextArr, SliderValueArr, Static_Collision, FrameTemplate, Frame_Content
  for _,content in pairs(ContentImage) do
    content:SetShow(false)
    ;
    (UI.deleteControl)(content)
  end
  ContentImage = {}
  for _,content in pairs(PayMark) do
    content:SetShow(false)
    ;
    (UI.deleteControl)(content)
  end
  PayMark = {}
  for index = 1, 7 do
    (SliderControlArr[index]):SetShow(false)
    ;
    (SliderTextArr[index]):SetShow(false)
    ;
    (SliderValueArr[index]):SetShow(false)
  end
  Static_Collision:SetShow(false)
  FrameTemplate:SetShow(false)
  Frame_Content:SetSize(Frame_Content:GetSizeX(), 0)
end

OpenCommonDecorationUi = function(classType, uiId, incheckType)
  -- function num : 0_3 , upvalues : currentclassType, currentuiId, clearRadioButtons, CheckControlArr, CheckTextArr, selectedClassType, selectedUiId, FrameTemplateColor, radioButtonColumnNum, RadioButton_Template, radioButtonStartX, radioButtonColumnWidth, radioButtonStartY, radioButtonColumnHeight, RadioButtonGroup, contentsStartY, controlOffset
  globalcurrentclassType = classType
  globalcurrentuiId = uiId
  currentclassType = classType
  currentuiId = uiId
  if incheckType == nil then
    checkType = 0
  else
    checkType = incheckType
  end
  clearRadioButtons()
  Set_CustomizationUIPanel(0, Panel_CustomizationFrame, 10)
  ClearAll_CustomizationUIGroup(0)
  ;
  (CheckControlArr[1]):SetShow(false)
  ;
  (CheckControlArr[2]):SetShow(false)
  ;
  (CheckTextArr[1]):SetShow(false)
  ;
  (CheckTextArr[2]):SetShow(false)
  selectedClassType = classType
  selectedUiId = uiId
  FrameTemplateColor:SetSize(Panel_Customization_Common_Decoration:GetSizeX(), 0)
  FrameTemplateColor:SetShow(false)
  local contentsCount = getUiContentsCount(classType, uiId)
  local countx = radioButtonColumnNum
  local county = (math.floor)(contentsCount / radioButtonColumnNum)
  if contentsCount % countx ~= 0 then
    county = county + 1
  end
  if contentsCount > 1 then
    for contentsIndex = 0, contentsCount - 1 do
      local luaContentsIndex = contentsIndex + 1
      local tempRadioButton = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, Panel_Customization_Common_Decoration, "RadioButton_" .. luaContentsIndex)
      CopyBaseProperty(RadioButton_Template, tempRadioButton)
      local contentsDesc = getUiContentsDescName(classType, uiId, contentsIndex)
      tempRadioButton:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      tempRadioButton:SetText(PAGetString(Defines.StringSheet_GAME, contentsDesc))
      tempRadioButton:SetPosX(radioButtonStartX + contentsIndex % radioButtonColumnNum * radioButtonColumnWidth)
      tempRadioButton:SetPosY(radioButtonStartY + (math.floor)(contentsIndex / radioButtonColumnNum) * radioButtonColumnHeight)
      tempRadioButton:addInputEvent("Mouse_LUp", "UpdateDecorationContents(" .. contentsIndex .. ")")
      tempRadioButton:SetShow(true)
      -- DECOMPILER ERROR at PC135: Confused about usage of register: R13 in 'UnsetPending'

      RadioButtonGroup[luaContentsIndex] = tempRadioButton
    end
    local radioButtonRowCount = 1 + (math.floor)((contentsCount - 1) / radioButtonColumnNum)
    contentsStartY = controlOffset + radioButtonRowCount * RadioButton_Template:GetSizeY() + controlOffset
  else
    do
      contentsStartY = controlOffset
      if contentsCount > 1 then
        (RadioButtonGroup[1]):SetCheck(true)
      end
      UpdateDecorationContents(0)
    end
  end
end

CloseCommonDecorationUi = function()
  -- function num : 0_4
  EnableDecorationSlide(true)
  clearPalette()
  globalcurrentclassType = -2
  globalcurrentuiId = -2
  checkType = -1
  setConsoleHeightPalette(0)
end

CloseEyeDecorationUi = function()
  -- function num : 0_5
  clearPalette()
  globalcurrentclassType = -2
  globalcurrentuiId = -2
  checkType = -1
  setConsoleHeightPalette(0)
end

UpdateDecorationContents = function(contentsIndex, currentclassType, currentuiId, historyapply)
  -- function num : 0_6 , upvalues : clearContents, clearRadioButtons, currentcontentindex, selectedClassType, selectedUiId, UI_GroupType, radioButtonColumnNum, contentsStartY, RadioButton_Template, radioButtonStartX, radioButtonColumnWidth, radioButtonStartY, radioButtonColumnHeight, RadioButtonGroup, controlOffset, listColumCount, Frame_Content, Frame_ContentImage, NoCashType, NoCashDeco, Static_PayMark, listColumnWidth, listStartX, listColumnHeight, listStartY, ContentImage, PayMark, selectedListParamType, selectedListParamIndex, selectedItemIndex, FrameTemplate, imageFrameSizeY, sliderParamType, sliderParamIndex, sliderParamMin, sliderParamMax, sliderParamDefault, SliderControlArr, SliderButtonArr, SliderTextArr, sliderOffset, SliderValueArr, sliderValueOffset, sliderHeight, FrameTemplateColor, Static_Collision, Frame_Scroll
  clearContents()
  clearRadioButtons()
  currentcontentindex = contentsIndex
  if currentclassType ~= nil then
    selectedClassType = currentclassType
  end
  if currentuiId ~= nil then
    selectedUiId = currentuiId
  end
  if historyapply == nil then
    local indexX = Get_CustomizationUIgroupCurrentIndexX(0, 0)
    local indexY = Get_CustomizationUIgroupCurrentIndexY(0, 0)
    if indexX == -1 then
      indexX = 0
    end
    if indexY == -1 then
      indexY = 0
    end
    ClearAll_CustomizationUIGroup(0)
    Delete_CustomizationUIGroup(0, 0, false)
    Add_CustomizationUIGroup(0, 0, UI_GroupType.eCONSOLE_UI_CONTROL_TYPE_CUSTOMIZATION)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsolePrevFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB2)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsoleNextFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB2)
    Set_CustomizationUIgroupCurrentIndex(0, 0, indexX, indexY)
  end
  do
    local currentheight = 0
    local maxcountx = 50
    local maxcounty = 50
    local contentsCount = getUiContentsCount(selectedClassType, selectedUiId)
    local countx = radioButtonColumnNum
    local county = (math.floor)(contentsCount / radioButtonColumnNum)
    if contentsCount % countx ~= 0 then
      county = county + 1
    end
    contentsStartY = 0
    if contentsCount > 1 then
      for contentsIndex = 0, contentsCount - 1 do
        local luaContentsIndex = contentsIndex + 1
        local tempRadioButton = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, Panel_Customization_Common_Decoration, "RadioButton_" .. luaContentsIndex)
        CopyBaseProperty(RadioButton_Template, tempRadioButton)
        local contentsDesc = getUiContentsDescName(selectedClassType, selectedUiId, contentsIndex)
        tempRadioButton:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
        tempRadioButton:SetText(PAGetString(Defines.StringSheet_GAME, contentsDesc))
        tempRadioButton:SetPosX(radioButtonStartX + contentsIndex % radioButtonColumnNum * radioButtonColumnWidth)
        tempRadioButton:SetPosY(radioButtonStartY + (math.floor)(contentsIndex / radioButtonColumnNum) * radioButtonColumnHeight)
        tempRadioButton:addInputEvent("Mouse_LUp", "UpdateDecorationContents(" .. contentsIndex .. ")")
        tempRadioButton:SetShow(true)
        -- DECOMPILER ERROR at PC150: Confused about usage of register: R17 in 'UnsetPending'

        RadioButtonGroup[luaContentsIndex] = tempRadioButton
        Add_CustomizationUIControl(0, 0, contentsIndex % countx, currentheight + contentsIndex / countx, maxcountx, maxcounty, RadioButtonGroup[luaContentsIndex])
      end
      local radioButtonRowCount = 1 + (math.floor)((contentsCount - 1) / radioButtonColumnNum)
      contentsStartY = controlOffset + radioButtonRowCount * RadioButton_Template:GetSizeY() + controlOffset
    else
      do
        contentsStartY = controlOffset
        if contentsCount ~= 1 then
          currentheight = currentheight + (county)
        end
        local texSize = 48.25
        local controlPosY = contentsStartY
        local listCount = getUiListCount(selectedClassType, selectedUiId, contentsIndex)
        if listCount == 1 then
          local listIndex = 0
          local luaListIndex = listIndex + 1
          local listTexture = getUiListTextureName(selectedClassType, selectedUiId, contentsIndex, listIndex)
          local listParamType = getUiListParamType(selectedClassType, selectedUiId, contentsIndex, listIndex)
          local listParamIndex = getUiListParamIndex(selectedClassType, selectedUiId, contentsIndex, listIndex)
          local paramMax = getParamMax(selectedClassType, listParamType, listParamIndex)
          local countx = listColumCount
          local county = (math.floor)(paramMax / listColumCount)
          if paramMax % countx ~= 0 then
            county = county + 1
          end
          for itemIndex = 0, paramMax do
            local luaShapeIdx = itemIndex + 1
            local tempContentImage = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Frame_Content, "Frame_Image_" .. itemIndex .. "_" .. selectedUiId)
            CopyBaseProperty(Frame_ContentImage, tempContentImage)
            tempContentImage:addInputEvent("Mouse_LUp", "UpdateDecorationListMessage(" .. listParamType .. "," .. listParamIndex .. "," .. itemIndex .. ")")
            local staticPayMark = nil
            if NoCashType.eCustomizationNoCashType_Deco == listParamType and (NoCashDeco.eCustomizationNoCashDeco_FaceTattoo == listParamIndex or NoCashDeco.eCustomizationNoCashDeco_BodyTattoo == listParamIndex) then
              staticPayMark = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempContentImage, "Static_PayMark_" .. itemIndex .. "_" .. selectedUiId)
              CopyBaseProperty(Static_PayMark, staticPayMark)
            end
            local mod = itemIndex % listColumCount
            local divi = (math.floor)(itemIndex / listColumCount)
            local texUV = {x1, y1, x2, y2}
            texUV.x1 = mod * texSize
            texUV.y1 = divi * texSize
            texUV.x2 = texUV.x1 + texSize
            texUV.y2 = texUV.y1 + texSize
            tempContentImage:ChangeTextureInfoName(listTexture)
            local x1, y1, x2, y2 = setTextureUV_Func(tempContentImage, texUV.x1, texUV.y1, texUV.x2, texUV.y2)
            ;
            (tempContentImage:getBaseTexture()):setUV(x1, y1, x2, y2)
            tempContentImage:SetPosX(itemIndex % listColumCount * listColumnWidth + listStartX)
            tempContentImage:SetPosY((math.floor)(itemIndex / listColumCount) * listColumnHeight + listStartY)
            tempContentImage:setRenderTexture(tempContentImage:getBaseTexture())
            if not FGlobal_IsCommercialService() and not isNormalCustomizingIndex(selectedClassType, listParamType, listParamIndex, itemIndex) then
              tempContentImage:SetShow(false)
            else
              if not isNormalCustomizingIndex(selectedClassType, listParamType, listParamIndex, itemIndex) and not FGlobal_IsInGameMode() and isServerFixedCharge() then
                tempContentImage:SetShow(false)
              else
                tempContentImage:SetShow(true)
              end
            end
            if NoCashType.eCustomizationNoCashType_Deco == listParamType and (NoCashDeco.eCustomizationNoCashDeco_FaceTattoo == listParamIndex or NoCashDeco.eCustomizationNoCashDeco_BodyTattoo == listParamIndex) then
              if not isNormalCustomizingIndex(selectedClassType, listParamType, listParamIndex, itemIndex) then
                staticPayMark:SetShow(true)
              else
                staticPayMark:SetShow(false)
              end
            end
            -- DECOMPILER ERROR at PC422: Confused about usage of register: R35 in 'UnsetPending'

            ContentImage[luaShapeIdx] = tempContentImage
            -- DECOMPILER ERROR at PC424: Confused about usage of register: R35 in 'UnsetPending'

            PayMark[luaShapeIdx] = staticPayMark
            Add_CustomizationUIControl(0, 0, itemIndex % countx, currentheight + itemIndex / countx, maxcountx, maxcounty, ContentImage[luaShapeIdx])
          end
          currentheight = currentheight + (county)
          local param = getParam(listParamType, listParamIndex)
          selectedListParamType = listParamType
          selectedListParamIndex = listParamIndex
          selectedItemIndex = param
          FrameTemplate:SetShow(true)
          FrameTemplate:SetPosY(controlPosY)
          if paramMax < listColumCount then
            FrameTemplate:SetSize(FrameTemplate:GetSizeX(), imageFrameSizeY - listColumnHeight)
          else
            FrameTemplate:SetSize(FrameTemplate:GetSizeX(), imageFrameSizeY)
          end
          controlPosY = controlPosY + FrameTemplate:GetSizeY() + controlOffset
        end
        do
          if listCount > 0 then
            UpdateDecorationList()
          end
          local sliderCount = getUiSliderCount(selectedClassType, selectedUiId, contentsIndex)
          local sliderValueBasePosX = 0
          for sliderIndex = 0, sliderCount - 1 do
            local luaSliderIndex = sliderIndex + 1
            -- DECOMPILER ERROR at PC501: Confused about usage of register: R20 in 'UnsetPending'

            sliderParamType[luaSliderIndex] = getUiSliderParamType(selectedClassType, selectedUiId, contentsIndex, sliderIndex)
            -- DECOMPILER ERROR at PC509: Confused about usage of register: R20 in 'UnsetPending'

            sliderParamIndex[luaSliderIndex] = getUiSliderParamIndex(selectedClassType, selectedUiId, contentsIndex, sliderIndex)
            local sliderParam = getParam(sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
            -- DECOMPILER ERROR at PC524: Confused about usage of register: R21 in 'UnsetPending'

            sliderParamMin[luaSliderIndex] = getParamMin(selectedClassType, sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
            -- DECOMPILER ERROR at PC533: Confused about usage of register: R21 in 'UnsetPending'

            sliderParamMax[luaSliderIndex] = getParamMax(selectedClassType, sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
            -- DECOMPILER ERROR at PC542: Confused about usage of register: R21 in 'UnsetPending'

            sliderParamDefault[luaSliderIndex] = getParamDefault(selectedClassType, sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
            setSliderValue(SliderControlArr[luaSliderIndex], sliderParam, sliderParamMin[luaSliderIndex], sliderParamMax[luaSliderIndex])
            ;
            (SliderButtonArr[luaSliderIndex]):addInputEvent("Mouse_LPress", "UpdateDecorationSlider(" .. sliderIndex .. ")")
            ;
            (SliderControlArr[luaSliderIndex]):addInputEvent("Mouse_LPress", "UpdateDecorationSlider(" .. sliderIndex .. ")")
            if checkType ~= 3 then
              (SliderButtonArr[luaSliderIndex]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
              ;
              (SliderControlArr[luaSliderIndex]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
            end
            local sliderDesc = getUiSliderDescName(selectedClassType, selectedUiId, contentsIndex, sliderIndex)
            ;
            (SliderTextArr[luaSliderIndex]):SetText(PAGetString(Defines.StringSheet_GAME, sliderDesc))
            ;
            (SliderTextArr[luaSliderIndex]):SetPosY(controlPosY)
            ;
            (SliderTextArr[luaSliderIndex]):SetShow(true)
            ;
            (SliderControlArr[luaSliderIndex]):SetPosY(controlPosY + sliderOffset)
            ;
            (SliderControlArr[luaSliderIndex]):SetShow(true)
            ;
            (SliderValueArr[luaSliderIndex]):SetText(sliderParam)
            ;
            (SliderValueArr[luaSliderIndex]):SetPosY(controlPosY + sliderValueOffset)
            ;
            (SliderValueArr[luaSliderIndex]):SetShow(true)
            if ToClient_getGameOptionControllerWrapper() ~= nil then
              if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
                (SliderValueArr[luaSliderIndex]):SetPosX(72)
              else
                ;
                (SliderValueArr[luaSliderIndex]):SetPosX(64)
              end
            end
            local sliderTextSizeX = (SliderTextArr[luaSliderIndex]):GetPosX() + (SliderTextArr[luaSliderIndex]):GetTextSizeX()
            local sliderValuePosX = (SliderValueArr[luaSliderIndex]):GetPosX()
            if sliderValuePosX < sliderTextSizeX then
              sliderValueBasePosX = (math.max)(sliderValueBasePosX, sliderTextSizeX)
            end
            controlPosY = controlPosY + sliderHeight
            Add_CustomizationUIControl(0, 0, 0, currentheight + sliderIndex, maxcountx, maxcounty, SliderButtonArr[luaSliderIndex])
          end
          currentheight = currentheight + sliderCount
          if sliderValueBasePosX > 0 then
            for sliderIndex = 0, sliderCount - 1 do
              local luaSliderIndex = sliderIndex + 1
              local sliderValuePosX = (SliderValueArr[luaSliderIndex]):GetPosX()
              ;
              (SliderValueArr[luaSliderIndex]):SetPosX(sliderValueBasePosX + 5)
              ;
              (SliderControlArr[luaSliderIndex]):SetSize(174 - (sliderValueBasePosX - sliderValuePosX), (SliderControlArr[luaSliderIndex]):GetSizeY())
              ;
              (SliderControlArr[luaSliderIndex]):SetPosX(95 + (sliderValueBasePosX - sliderValuePosX) + 5)
              local sliderParam = getParam(sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
              setSliderValue(SliderControlArr[luaSliderIndex], sliderParam, sliderParamMin[luaSliderIndex], sliderParamMax[luaSliderIndex])
              ;
              (SliderControlArr[luaSliderIndex]):SetInterval(100)
            end
          end
          do
            local paletteCount = getUiPaletteCount(selectedClassType, selectedUiId, contentsIndex)
            if paletteCount == 1 then
              setConsoleHeightPalette(currentheight)
              controlPosY = controlPosY + controlOffset
              local paletteParamType = getUiPaletteParamType(selectedClassType, selectedUiId, contentsIndex)
              local paletteParamIndex = getUiPaletteParamIndex(selectedClassType, selectedUiId, contentsIndex)
              local paletteIndex = getDecorationParamMethodValue(selectedClassType, paletteParamType, paletteParamIndex)
              FrameTemplateColor:SetShow(true)
              FrameTemplateColor:SetPosY(controlPosY)
              CreateCommonPalette(FrameTemplateColor, Static_Collision, selectedClassType, paletteParamType, paletteParamIndex, paletteIndex, historyapply)
              local colorIndex = getParam(paletteParamType, paletteParamIndex)
              UpdatePaletteMarkPosition(colorIndex)
              local Frame_Content_Color = (UI.getChildControl)(FrameTemplateColor, "Frame_Content")
              Static_SelectMark_Color = (UI.getChildControl)(Frame_Content_Color, "Static_SelectMark")
              Frame_Content_Color:SetChildIndex(Static_SelectMark_Color, 9999)
            else
              do
                clearPalette()
                Panel_Customization_Common_Decoration:SetSize(Panel_Customization_Common_Decoration:GetSizeX(), controlPosY + FrameTemplateColor:GetSizeY() + controlOffset)
                updateGroupFrameControls(Panel_Customization_Common_Decoration:GetSizeY(), Panel_Customization_Common_Decoration)
                Panel_Customization_Common_Decoration:SetShow(true)
                FrameTemplateColor:UpdateContentScroll()
                FrameTemplateColor:UpdateContentPos()
                FrameTemplate:UpdateContentScroll()
                Frame_Scroll:SetControlTop()
                FrameTemplate:UpdateContentPos()
              end
            end
          end
        end
      end
    end
  end
end

UpdateDecorationListMessage = function(paramType, paramIndex, itemIndex)
  -- function num : 0_7 , upvalues : selectedListParamType, selectedListParamIndex, selectedItemIndex, isTattooMode, NoCashType, NoCashDeco, selectedClassType
  selectedListParamType = paramType
  selectedListParamIndex = paramIndex
  selectedItemIndex = itemIndex
  local fp = nil
  if isTattooMode then
    fp = UpdateTattooAtlasList
  else
    fp = UpdateDecorationPose
  end
  if Panel_Win_System:GetShow() then
    MessageBox_Empty_function()
    allClearMessageData()
  end
  if NoCashType.eCustomizationNoCashType_Deco == paramType and (NoCashDeco.eCustomizationNoCashDeco_FaceTattoo == paramIndex or NoCashDeco.eCustomizationNoCashDeco_BodyTattoo == paramIndex) and not FGlobal_IsInGameMode() and not isNormalCustomizingIndex(selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex) then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MSGBOX_APPLY_CASHITEM")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = fp, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "top")
    return 
  end
  do
    if paramType == 4 then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MSGBOX_APPLY_EXPRESSION")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = fp, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData, "top", nil, nil, true)
      return 
    end
    do
      if isTattooMode then
        slideEnable = getEnableTattooSlide(selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex)
        EnableDecorationSlide(slideEnable)
      end
      UpdateDecorationList()
      if checkType ~= 3 then
        add_CurrentHistory()
      end
    end
  end
end

UpdateTattooAtlasList = function()
  -- function num : 0_8 , upvalues : selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex, UpdateMarkPosition
  slideEnable = getEnableTattooSlide(selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex)
  EnableDecorationSlide(slideEnable)
  setParam(selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex)
  UpdateMarkPosition(selectedItemIndex)
end

UpdateDecorationPose = function()
  -- function num : 0_9 , upvalues : selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex, UpdateMarkPosition
  setParam(selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex)
  UpdateMarkPosition(selectedItemIndex)
  if checkType ~= 3 then
    add_CurrentHistory()
  end
end

UpdateDecorationList = function()
  -- function num : 0_10 , upvalues : selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex, UpdateMarkPosition
  setParam(selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex)
  UpdateMarkPosition(selectedItemIndex)
end

UpdateDecorationSlider = function(sliderIndex)
  -- function num : 0_11 , upvalues : SliderControlArr, sliderParamMin, sliderParamMax, selectedClassType, sliderParamType, sliderParamIndex, SliderValueArr
  local luaSliderIndex = sliderIndex + 1
  local value = getSliderValue(SliderControlArr[luaSliderIndex], sliderParamMin[luaSliderIndex], sliderParamMax[luaSliderIndex])
  setParam(selectedClassType, sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex], value)
  ;
  (SliderValueArr[luaSliderIndex]):SetText(value)
  if checkType ~= 3 then
    setGlobalCheck(true)
  end
end

UpdateHairDecorationSlider = function(sliderIndex)
  -- function num : 0_12
end

OpenEyeDecorationUi = function(classType, uiId)
  -- function num : 0_13 , upvalues : currentclassType, currentuiId, clearRadioButtons, CheckControlArr, CheckTextArr, contentsStartY, controlOffset, selectedClassType, selectedUiId, FrameTemplateColor, radioButtonColumnNum, RadioButton_Template, radioButtonStartX, radioButtonColumnWidth, radioButtonStartY, radioButtonColumnHeight, RadioButtonGroup
  Set_CustomizationUIPanel(0, Panel_CustomizationFrame, 10)
  ClearAll_CustomizationUIGroup(0)
  globalcurrentclassType = classType
  globalcurrentuiId = uiId
  currentclassType = classType
  currentuiId = uiId
  checkType = 1
  clearRadioButtons()
  ;
  (CheckControlArr[1]):SetShow(true)
  ;
  (CheckControlArr[2]):SetShow(true)
  ;
  (CheckControlArr[1]):SetCheck(true)
  ;
  (CheckControlArr[2]):SetCheck(true)
  ;
  (CheckTextArr[1]):SetShow(true)
  ;
  (CheckTextArr[2]):SetShow(true)
  contentsStartY = 0
  contentsStartY = contentsStartY + (CheckControlArr[1]):GetSizeY() + controlOffset
  selectedClassType = classType
  selectedUiId = uiId
  FrameTemplateColor:SetSize(Panel_Customization_Common_Decoration:GetSizeX(), 1)
  local contentsCount = getUiContentsCount(classType, uiId) / 2
  local countx = radioButtonColumnNum
  local county = (math.floor)(contentsCount / radioButtonColumnNum)
  if contentsCount % countx ~= 0 then
    county = county + 1
  end
  county = county + 1
  if contentsCount > 1 then
    for contentsIndex = 0, contentsCount - 1 do
      local luaContentsIndex = contentsIndex + 1
      local tempRadioButton = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, Panel_Customization_Common_Decoration, "RadioButton_" .. luaContentsIndex)
      CopyBaseProperty(RadioButton_Template, tempRadioButton)
      local contentsDesc = getUiContentsDescName(classType, uiId, contentsIndex)
      tempRadioButton:SetText(PAGetString(Defines.StringSheet_GAME, contentsDesc))
      tempRadioButton:SetPosX(radioButtonStartX + contentsIndex % radioButtonColumnNum * radioButtonColumnWidth)
      tempRadioButton:SetPosY(contentsStartY + radioButtonStartY + (math.floor)(contentsIndex / radioButtonColumnNum) * radioButtonColumnHeight)
      tempRadioButton:addInputEvent("Mouse_LUp", "UpdateEyeDecorationContents(" .. contentsIndex .. ", " .. 0 .. ")")
      tempRadioButton:SetShow(true)
      -- DECOMPILER ERROR at PC149: Confused about usage of register: R12 in 'UnsetPending'

      RadioButtonGroup[luaContentsIndex] = tempRadioButton
    end
    local radioButtonRowCount = 1 + (math.floor)((contentsCount - 1) / radioButtonColumnNum)
    contentsStartY = contentsStartY + controlOffset + radioButtonRowCount * RadioButton_Template:GetSizeY() + controlOffset
  else
    do
      contentsStartY = contentsStartY + controlOffset
      if contentsCount > 1 then
        (RadioButtonGroup[1]):SetCheck(true)
      end
      UpdateEyeDecorationContents(0, 0)
    end
  end
end

UpdateEyeDecorationContents = function(contentsIndex, addHistory, currentclassType, currentuiId, historyapply)
  -- function num : 0_14 , upvalues : clearContents, clearRadioButtons, UI_GroupType, currentcontentindex, selectedClassType, selectedUiId, CheckControlArr, radioButtonColumnNum, contentsStartY, controlOffset, RadioButton_Template, radioButtonStartX, radioButtonColumnWidth, radioButtonStartY, radioButtonColumnHeight, RadioButtonGroup, FrameTemplate, listColumCount, Frame_Content, Frame_ContentImage, listColumnWidth, listStartX, listColumnHeight, listStartY, ContentImage, UpdateMarkPosition, imageFrameSizeY, sliderParamType, sliderParamIndex, sliderParamIndex2, sliderParamMin, sliderParamMax, sliderParamDefault, SliderControlArr, SliderButtonArr, SliderTextArr, sliderOffset, SliderValueArr, sliderValueOffset, sliderHeight, FrameTemplateColor, Static_Collision, Frame_Scroll
  clearContents()
  clearRadioButtons()
  if historyapply == nil then
    local indexX = Get_CustomizationUIgroupCurrentIndexX(0, 0)
    local indexY = Get_CustomizationUIgroupCurrentIndexY(0, 0)
    if indexX == -1 then
      indexX = 0
    end
    if indexY == -1 then
      indexY = 0
    end
    ClearAll_CustomizationUIGroup(0)
    Delete_CustomizationUIGroup(0, 0, false)
    Add_CustomizationUIGroup(0, 0, UI_GroupType.eCONSOLE_UI_CONTROL_TYPE_CUSTOMIZATION)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsolePrevFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB2)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsoleNextFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB2)
    Set_CustomizationUIgroupCurrentIndex(0, 0, indexX, indexY)
  end
  do
    currentcontentindex = contentsIndex
    if currentclassType ~= nil then
      selectedClassType = currentclassType
    end
    if currentuiId ~= nil then
      selectedUiId = currentuiId
    end
    local currentheight = 0
    local maxcountx = 50
    local maxcounty = 50
    Add_CustomizationUIControl(0, 0, 0, 0, maxcountx, maxcounty, CheckControlArr[2])
    Add_CustomizationUIControl(0, 0, 1, 0, maxcountx, maxcounty, CheckControlArr[1])
    currentheight = 1
    local contentsCount = getUiContentsCount(selectedClassType, selectedUiId) / 2
    local countx = radioButtonColumnNum
    local county = (math.floor)(contentsCount / radioButtonColumnNum)
    if contentsCount % countx ~= 0 then
      county = county + 1
    end
    contentsStartY = 0
    contentsStartY = contentsStartY + (CheckControlArr[1]):GetSizeY() + controlOffset
    if contentsCount > 1 then
      for contentsIndex = 0, contentsCount - 1 do
        local luaContentsIndex = contentsIndex + 1
        local tempRadioButton = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, Panel_Customization_Common_Decoration, "RadioButton_" .. luaContentsIndex)
        CopyBaseProperty(RadioButton_Template, tempRadioButton)
        local contentsDesc = getUiContentsDescName(selectedClassType, selectedUiId, contentsIndex)
        tempRadioButton:SetText(PAGetString(Defines.StringSheet_GAME, contentsDesc))
        tempRadioButton:SetPosX(radioButtonStartX + contentsIndex % radioButtonColumnNum * radioButtonColumnWidth)
        tempRadioButton:SetPosY(contentsStartY + radioButtonStartY + (math.floor)(contentsIndex / radioButtonColumnNum) * radioButtonColumnHeight)
        tempRadioButton:addInputEvent("Mouse_LUp", "UpdateEyeDecorationContents(" .. contentsIndex .. ", " .. 0 .. ")")
        tempRadioButton:SetShow(true)
        -- DECOMPILER ERROR at PC180: Confused about usage of register: R18 in 'UnsetPending'

        RadioButtonGroup[luaContentsIndex] = tempRadioButton
        Add_CustomizationUIControl(0, 0, contentsIndex % countx, currentheight + contentsIndex / countx, maxcountx, maxcounty, RadioButtonGroup[luaContentsIndex])
      end
      local radioButtonRowCount = 1 + (math.floor)((contentsCount - 1) / radioButtonColumnNum)
      contentsStartY = contentsStartY + controlOffset + radioButtonRowCount * RadioButton_Template:GetSizeY() + controlOffset
    else
      do
        contentsStartY = contentsStartY + controlOffset
        currentheight = currentheight + (county)
        local texSize = 48.25
        local controlPosY = contentsStartY
        local listCount = getUiListCount(selectedClassType, selectedUiId, contentsIndex)
        if listCount == 1 then
          local listIndex = 0
          local luaListIndex = listIndex + 1
          local listTexture = getUiListTextureName(selectedClassType, selectedUiId, contentsIndex, listIndex)
          local listParamType = getUiListParamType(selectedClassType, selectedUiId, contentsIndex, listIndex)
          local listParamIndex = getUiListParamIndex(selectedClassType, selectedUiId, contentsIndex, listIndex)
          local listParamIndex2 = getUiListParamIndex(selectedClassType, selectedUiId, contentsIndex + 3, listIndex)
          FrameTemplate:SetShow(true)
          local paramMax = getParamMax(selectedClassType, listParamType, listParamIndex)
          countx = listColumCount
          county = (math.floor)(paramMax / listColumCount)
          if contentsCount % countx ~= 0 then
            county = county + 1
          end
          for itemIndex = 0, paramMax do
            local luaShapeIdx = itemIndex + 1
            local tempContentImage = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Frame_Content, "Frame_Image_" .. itemIndex)
            CopyBaseProperty(Frame_ContentImage, tempContentImage)
            tempContentImage:addInputEvent("Mouse_LUp", "UpdateEyeDecorationList(" .. listParamType .. "," .. listParamIndex .. "," .. listParamIndex2 .. "," .. itemIndex .. ")")
            local mod = itemIndex % listColumCount
            local divi = (math.floor)(itemIndex / listColumCount)
            local texUV = {x1, y1, x2, y2}
            texUV.x1 = mod * texSize
            texUV.y1 = divi * texSize
            texUV.x2 = texUV.x1 + texSize
            texUV.y2 = texUV.y1 + texSize
            tempContentImage:ChangeTextureInfoName(listTexture)
            local x1, y1, x2, y2 = setTextureUV_Func(tempContentImage, texUV.x1, texUV.y1, texUV.x2, texUV.y2)
            ;
            (tempContentImage:getBaseTexture()):setUV(x1, y1, x2, y2)
            tempContentImage:SetPosX(itemIndex % listColumCount * listColumnWidth + listStartX)
            tempContentImage:SetPosY((math.floor)(itemIndex / listColumCount) * listColumnHeight + listStartY)
            tempContentImage:setRenderTexture(tempContentImage:getBaseTexture())
            tempContentImage:SetShow(true)
            -- DECOMPILER ERROR at PC372: Confused about usage of register: R34 in 'UnsetPending'

            ContentImage[luaShapeIdx] = tempContentImage
            Add_CustomizationUIControl(0, 0, itemIndex % countx, currentheight + itemIndex / countx, maxcountx, maxcounty, ContentImage[luaShapeIdx])
          end
          currentheight = currentheight + (county)
          local param = getParam(listParamType, listParamIndex)
          UpdateMarkPosition(param)
          FrameTemplate:SetPosY(controlPosY)
          if paramMax < listColumCount then
            FrameTemplate:SetSize(FrameTemplate:GetSizeX(), imageFrameSizeY - listColumnHeight)
          else
            FrameTemplate:SetSize(FrameTemplate:GetSizeX(), imageFrameSizeY)
          end
          controlPosY = controlPosY + FrameTemplate:GetSizeY() + controlOffset
        end
        do
          local sliderCount = getUiSliderCount(selectedClassType, selectedUiId, contentsIndex)
          local sliderValueBasePosX = 0
          for sliderIndex = 0, sliderCount - 1 do
            local luaSliderIndex = sliderIndex + 1
            -- DECOMPILER ERROR at PC441: Confused about usage of register: R21 in 'UnsetPending'

            sliderParamType[luaSliderIndex] = getUiSliderParamType(selectedClassType, selectedUiId, contentsIndex, sliderIndex)
            -- DECOMPILER ERROR at PC449: Confused about usage of register: R21 in 'UnsetPending'

            sliderParamIndex[luaSliderIndex] = getUiSliderParamIndex(selectedClassType, selectedUiId, contentsIndex, sliderIndex)
            -- DECOMPILER ERROR at PC457: Confused about usage of register: R21 in 'UnsetPending'

            sliderParamIndex2[luaSliderIndex] = getUiSliderParamIndex(selectedClassType, selectedUiId, contentsIndex + 3, sliderIndex)
            local sliderParam = getParam(sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
            -- DECOMPILER ERROR at PC472: Confused about usage of register: R22 in 'UnsetPending'

            sliderParamMin[luaSliderIndex] = getParamMin(selectedClassType, sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
            -- DECOMPILER ERROR at PC481: Confused about usage of register: R22 in 'UnsetPending'

            sliderParamMax[luaSliderIndex] = getParamMax(selectedClassType, sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
            -- DECOMPILER ERROR at PC490: Confused about usage of register: R22 in 'UnsetPending'

            sliderParamDefault[luaSliderIndex] = getParamDefault(selectedClassType, sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
            setSliderValue(SliderControlArr[luaSliderIndex], sliderParam, sliderParamMin[luaSliderIndex], sliderParamMax[luaSliderIndex])
            ;
            (SliderButtonArr[luaSliderIndex]):addInputEvent("Mouse_LPress", "UpdateEyeDecorationSlider(" .. sliderIndex .. ")")
            ;
            (SliderControlArr[luaSliderIndex]):addInputEvent("Mouse_LUp", "add_CurrentHistory()")
            local sliderDesc = getUiSliderDescName(selectedClassType, selectedUiId, contentsIndex, sliderIndex)
            ;
            (SliderTextArr[luaSliderIndex]):SetText(PAGetString(Defines.StringSheet_GAME, sliderDesc))
            ;
            (SliderTextArr[luaSliderIndex]):SetPosY(controlPosY)
            ;
            (SliderTextArr[luaSliderIndex]):SetShow(true)
            ;
            (SliderControlArr[luaSliderIndex]):SetPosY(controlPosY + sliderOffset)
            ;
            (SliderControlArr[luaSliderIndex]):SetShow(true)
            ;
            (SliderValueArr[luaSliderIndex]):SetText(sliderParam)
            ;
            (SliderValueArr[luaSliderIndex]):SetPosY(controlPosY + sliderValueOffset)
            ;
            (SliderValueArr[luaSliderIndex]):SetShow(true)
            Add_CustomizationUIControl(0, 0, 0, currentheight + sliderIndex, maxcountx, maxcounty, SliderButtonArr[luaSliderIndex])
            local sliderTextSizeX = (SliderTextArr[luaSliderIndex]):GetPosX() + (SliderTextArr[luaSliderIndex]):GetTextSizeX()
            local sliderValuePosX = (SliderValueArr[luaSliderIndex]):GetPosX()
            if sliderValuePosX < sliderTextSizeX then
              sliderValueBasePosX = (math.max)(sliderValueBasePosX, sliderTextSizeX)
            end
            controlPosY = controlPosY + sliderHeight
          end
          currentheight = currentheight + sliderCount
          if sliderValueBasePosX > 0 then
            for sliderIndex = 0, sliderCount - 1 do
              local luaSliderIndex = sliderIndex + 1
              local sliderValuePosX = (SliderValueArr[luaSliderIndex]):GetPosX()
              ;
              (SliderValueArr[luaSliderIndex]):SetPosX(sliderValueBasePosX + 5)
              ;
              (SliderControlArr[luaSliderIndex]):SetSize(174 - (sliderValueBasePosX - sliderValuePosX), (SliderControlArr[luaSliderIndex]):GetSizeY())
              ;
              (SliderControlArr[luaSliderIndex]):SetPosX(95 + (sliderValueBasePosX - sliderValuePosX) + 5)
              local sliderParam = getParam(sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex])
              setSliderValue(SliderControlArr[luaSliderIndex], sliderParam, sliderParamMin[luaSliderIndex], sliderParamMax[luaSliderIndex])
              ;
              (SliderControlArr[luaSliderIndex]):SetInterval(100)
            end
          end
          do
            local paletteCount = getUiPaletteCount(selectedClassType, selectedUiId, contentsIndex)
            if paletteCount == 1 then
              setConsoleHeightPalette(currentheight)
              controlPosY = controlPosY + controlOffset
              local paletteParamType = getUiPaletteParamType(selectedClassType, selectedUiId, contentsIndex)
              local paletteParamIndex = getUiPaletteParamIndex(selectedClassType, selectedUiId, contentsIndex)
              local paletteParamIndex2 = getUiPaletteParamIndex(selectedClassType, selectedUiId, contentsIndex + 3)
              local paletteIndex = getDecorationParamMethodValue(selectedClassType, paletteParamType, paletteParamIndex)
              FrameTemplateColor:SetShow(true)
              FrameTemplateColor:SetPosY(controlPosY)
              CreateEyePalette(FrameTemplateColor, Static_Collision, selectedClassType, paletteParamType, paletteParamIndex, paletteParamIndex2, paletteIndex, CheckControlArr[1], CheckControlArr[2], historyapply)
              local colorIndex = getParam(paletteParamType, paletteParamIndex)
              UpdatePaletteMarkPosition(colorIndex)
              local Frame_Content_Color = (UI.getChildControl)(FrameTemplateColor, "Frame_Content")
              Static_SelectMark_Color = (UI.getChildControl)(Frame_Content_Color, "Static_SelectMark")
              Frame_Content_Color:SetChildIndex(Static_SelectMark_Color, 9999)
            else
              do
                clearPalette()
                Panel_Customization_Common_Decoration:SetSize(Panel_Customization_Common_Decoration:GetSizeX(), controlPosY + FrameTemplateColor:GetSizeY() + controlOffset)
                updateGroupFrameControls(Panel_Customization_Common_Decoration:GetSizeY(), Panel_Customization_Common_Decoration)
                Panel_Customization_Common_Decoration:SetShow(true)
                FrameTemplateColor:UpdateContentScroll()
                FrameTemplateColor:UpdateContentPos()
                FrameTemplate:UpdateContentScroll()
                Frame_Scroll:SetControlTop()
                FrameTemplate:UpdateContentPos()
                if addHistory == 1 then
                  add_CurrentHistory()
                end
              end
            end
          end
        end
      end
    end
  end
end

UpdateEyeDecorationList = function(paramType, paramIndex, paramIndex2, itemIndex)
  -- function num : 0_15 , upvalues : CheckControlArr, selectedClassType, UpdateMarkPosition
  if (CheckControlArr[1]):IsCheck() == true then
    setParam(selectedClassType, paramType, paramIndex, itemIndex)
  end
  if (CheckControlArr[2]):IsCheck() == true then
    setParam(selectedClassType, paramType, paramIndex2, itemIndex)
  end
  add_CurrentHistory()
  UpdateMarkPosition(itemIndex)
end

UpdateEyeDecorationSlider = function(sliderIndex)
  -- function num : 0_16 , upvalues : SliderControlArr, sliderParamMin, sliderParamMax, CheckControlArr, selectedClassType, sliderParamType, sliderParamIndex, sliderParamIndex2, SliderValueArr
  local luaSliderIndex = sliderIndex + 1
  local value = getSliderValue(SliderControlArr[luaSliderIndex], sliderParamMin[luaSliderIndex], sliderParamMax[luaSliderIndex])
  if (CheckControlArr[1]):IsCheck() == true then
    setParam(selectedClassType, sliderParamType[luaSliderIndex], sliderParamIndex[luaSliderIndex], value)
  end
  if (CheckControlArr[2]):IsCheck() == true then
    setParam(selectedClassType, sliderParamType[luaSliderIndex], sliderParamIndex2[luaSliderIndex], value)
  end
  ;
  (SliderValueArr[luaSliderIndex]):SetText(value)
  setGlobalCheck(true)
end

EnableDecorationSlide = function(enable)
  -- function num : 0_17 , upvalues : SliderButtonArr, SliderControlArr, SliderTextArr, SliderValueArr
  (SliderButtonArr[1]):SetMonoTone(not enable)
  ;
  (SliderButtonArr[2]):SetMonoTone(not enable)
  ;
  (SliderButtonArr[3]):SetMonoTone(not enable)
  ;
  (SliderButtonArr[4]):SetMonoTone(not enable)
  ;
  (SliderButtonArr[5]):SetMonoTone(not enable)
  local color = (Defines.Color).C_FF444444
  if enable then
    color = (Defines.Color).C_FFFFFFFF
  end
  ;
  (SliderControlArr[1]):SetEnable(enable)
  ;
  (SliderControlArr[2]):SetEnable(enable)
  ;
  (SliderControlArr[3]):SetEnable(enable)
  ;
  (SliderControlArr[4]):SetEnable(enable)
  ;
  (SliderControlArr[5]):SetEnable(enable)
  ;
  (SliderTextArr[1]):SetFontColor(color)
  ;
  (SliderTextArr[2]):SetFontColor(color)
  ;
  (SliderTextArr[3]):SetFontColor(color)
  ;
  (SliderTextArr[4]):SetFontColor(color)
  ;
  (SliderTextArr[5]):SetFontColor(color)
  ;
  (SliderValueArr[1]):SetFontColor(color)
  ;
  (SliderValueArr[2]):SetFontColor(color)
  ;
  (SliderValueArr[3]):SetFontColor(color)
  ;
  (SliderValueArr[4]):SetFontColor(color)
  ;
  (SliderValueArr[5]):SetFontColor(color)
end

OpenTattooDecorationUi = function(classType, uiId)
  -- function num : 0_18 , upvalues : isTattooMode, currentclassType, currentuiId, selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex
  isTattooMode = true
  checkType = 2
  OpenCommonDecorationUi(classType, uiId, checkType)
  globalcurrentclassType = classType
  globalcurrentuiId = uiId
  currentclassType = classType
  currentuiId = uiId
  if isTattooMode then
    slideEnable = getEnableTattooSlide(selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex)
    EnableDecorationSlide(slideEnable)
  end
end

CloseTattooDecorationUi = function()
  -- function num : 0_19 , upvalues : isTattooMode
  isTattooMode = false
  EnableDecorationSlide(true)
  CloseCommonDecorationUi()
  checkType = -1
  setConsoleHeightPalette(0)
end

OpenCommonExpressionUi = function(classType, uiId)
  -- function num : 0_20 , upvalues : currentclassType, currentuiId
  SetExpression()
  checkType = 3
  OpenCommonDecorationUi(classType, uiId, checkType)
  globalcurrentclassType = classType
  globalcurrentuiId = uiId
  currentclassType = classType
  currentuiId = uiId
end

CloseCommonExpressionUi = function()
  -- function num : 0_21
  applyExpression(-1, 1)
  CloseCommonDecorationUi()
  checkType = -1
  setConsoleHeightPalette(0)
end

SetExpression = function()
  -- function num : 0_22
  local expressionIndex = getParam(4, 0)
  local expressionWeight = getParam(4, 1)
  applyExpression(expressionIndex, expressionWeight)
end

CommonDecorationHistoryApplyUpdate = function()
  -- function num : 0_23 , upvalues : currentclassType, currentuiId, currentcontentindex
  if globalcurrentclassType ~= currentclassType or globalcurrentuiId ~= currentuiId then
    return 
  end
  if checkType == 0 then
    UpdateDecorationContents(currentcontentindex, currentclassType, currentuiId, true)
  else
    if checkType == 1 then
      UpdateEyeDecorationContents(currentcontentindex, 0, currentclassType, currentuiId, true)
    else
      if checkType == 2 then
        UpdateDecorationContents(currentcontentindex, currentclassType, currentuiId, true)
      else
        if checkType == 3 then
          SetExpression()
          UpdateDecorationContents(currentcontentindex, currentclassType, currentuiId, true)
        end
      end
    end
  end
end

FrameScrollUp = function()
  -- function num : 0_24 , upvalues : Frame_Scroll, FrameTemplate
  Frame_Scroll:SetCtrlPosByInterval(-7)
  FrameTemplate:UpdateContentPos()
end

FrameScrollDown = function()
  -- function num : 0_25 , upvalues : Frame_Scroll, FrameTemplate
  Frame_Scroll:SetCtrlPosByInterval(7)
  FrameTemplate:UpdateContentPos()
end


