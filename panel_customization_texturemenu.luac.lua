-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\panel_customization_texturemenu.luac 

-- params : ...
-- function num : 0
local Button_Close = (UI.getChildControl)(Panel_CustomizationTextureMenu, "Button_Close")
local Button_FileOpen = (UI.getChildControl)(Panel_CustomizationTextureMenu, "Button_FileOpen")
local Slider_Alpha = (UI.getChildControl)(Panel_CustomizationTextureMenu, "Slider_Alpha")
local Slider_Rotate = (UI.getChildControl)(Panel_CustomizationTextureMenu, "Slider_Rotate")
local Button_Alpha = (UI.getChildControl)(Slider_Alpha, "Slider_GammaController_Button")
local Button_Rotate = (UI.getChildControl)(Slider_Rotate, "Slider_GammaController_Button")
local CheckButton_FixedUI = (UI.getChildControl)(Panel_CustomizationTextureMenu, "CheckButton_Fixed")
local StaticText_FixedUI = (UI.getChildControl)(Panel_CustomizationTextureMenu, "StaticText_Fixed")
local Button_TextureArr = {}
Button_TextureArr[1] = (UI.getChildControl)(Panel_CustomizationTextureMenu, "Button_1")
Button_TextureArr[2] = (UI.getChildControl)(Panel_CustomizationTextureMenu, "Button_2")
Button_TextureArr[3] = (UI.getChildControl)(Panel_CustomizationTextureMenu, "Button_3")
Button_TextureArr[4] = (UI.getChildControl)(Panel_CustomizationTextureMenu, "Button_4")
Button_TextureArr[5] = (UI.getChildControl)(Panel_CustomizationTextureMenu, "Button_5")
Button_Close:addInputEvent("Mouse_LUp", "CloseTextureUi()")
Button_FileOpen:addInputEvent("Mouse_LUp", "OpenProjectionTextureUi()")
;
(Button_TextureArr[1]):addInputEvent("Mouse_LUp", "SetProjectionTexture(0)")
;
(Button_TextureArr[2]):addInputEvent("Mouse_LUp", "SetProjectionTexture(1)")
;
(Button_TextureArr[3]):addInputEvent("Mouse_LUp", "SetProjectionTexture(2)")
;
(Button_TextureArr[4]):addInputEvent("Mouse_LUp", "SetProjectionTexture(3)")
;
(Button_TextureArr[5]):addInputEvent("Mouse_LUp", "SetProjectionTexture(4)")
Slider_Alpha:addInputEvent("Mouse_LPress", "SetAlphaTextureUI()")
Button_Alpha:addInputEvent("Mouse_LPress", "SetAlphaTextureUI()")
Slider_Rotate:addInputEvent("Mouse_LPress", "SetRotateTextureUI()")
Button_Rotate:addInputEvent("Mouse_LPress", "SetRotateTextureUI()")
CheckButton_FixedUI:addInputEvent("Mouse_LUp", "SetFixedTextureUI()")
OpenTextureUi = function()
  -- function num : 0_0 , upvalues : Slider_Alpha, Slider_Rotate
  InitButton()
  Panel_CustomizationTextureMenu:SetShow(true)
  Panel_CustomizationTextureMenu:SetHorizonRight()
  Panel_CustomizationTextureMenu:SetVerticalMiddle()
  Slider_Alpha:SetControlPos(0)
  Slider_Rotate:SetControlPos(0)
end

CloseTextureUi = function()
  -- function num : 0_1
  Panel_CustomizationTextureMenu:SetShow(false)
  closeImagePanel()
end

OpenProjectionTextureUi = function()
  -- function num : 0_2
  loadProjectionTexture()
  InitButton()
end

InitButton = function()
  -- function num : 0_3 , upvalues : Button_TextureArr
  local count = getProjectionTextureCount()
  for idx = 1, 5 do
    (Button_TextureArr[idx]):SetMonoTone(true)
    ;
    (Button_TextureArr[idx]):SetEnable(false)
    ;
    (Button_TextureArr[idx]):SetShow(false)
  end
  for idx = 1, count do
    (Button_TextureArr[idx]):SetMonoTone(false)
    ;
    (Button_TextureArr[idx]):SetEnable(true)
    ;
    (Button_TextureArr[idx]):SetShow(true)
  end
end

SetProjectionTexture = function(index)
  -- function num : 0_4
  loadImage(index)
end

SetAlphaTextureUI = function()
  -- function num : 0_5 , upvalues : Slider_Alpha
  local value = Slider_Alpha:GetControlPos()
  alphaImage(value)
end

SetRotateTextureUI = function()
  -- function num : 0_6 , upvalues : Slider_Rotate
  local value = Slider_Rotate:GetControlPos()
  rotateImage(value)
end

SetFixedTextureUI = function()
  -- function num : 0_7 , upvalues : CheckButton_FixedUI
  isFixed = CheckButton_FixedUI:IsCheck()
  setFixedTexturePanel(isFixed)
end


