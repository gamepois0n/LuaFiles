-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\housing\panel_installationmode_farmguide.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
Panel_InstallationMode_FarmInfo:SetShow(false)
Panel_InstallationMode_FarmInfo:SetDragEnable(false)
local radioBtn_Crop = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "RadioButton_Crop")
local radioBtn_DomesticAnimal = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "RadioButton_DomesticAnimal")
radioBtn_Crop:addInputEvent("Mouse_LUp", "FarmGuide_DescChange( 0 )")
radioBtn_DomesticAnimal:addInputEvent("Mouse_LUp", "FarmGuide_DescChange( 1 )")
local farmGuideDesc = {
[0] = {}
, 
[1] = {}
}
-- DECOMPILER ERROR at PC113: Confused about usage of register: R7 in 'UnsetPending'

;
(farmGuideDesc[0])[0] = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_5"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_10"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_11"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_12"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_13"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_14"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_15")}
-- DECOMPILER ERROR at PC164: Confused about usage of register: R7 in 'UnsetPending'

;
(farmGuideDesc[0])[1] = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_3"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_10"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_11"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_12"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_13")}
-- DECOMPILER ERROR at PC191: Confused about usage of register: R7 in 'UnsetPending'

;
(farmGuideDesc[0])[2] = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC2_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC2_1"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC2_10"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC2_11")}
-- DECOMPILER ERROR at PC266: Confused about usage of register: R7 in 'UnsetPending'

;
(farmGuideDesc[1])[0] = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_6"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_5"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_20"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_21"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_22"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_23"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_24"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC0_25")}
-- DECOMPILER ERROR at PC317: Confused about usage of register: R7 in 'UnsetPending'

;
(farmGuideDesc[1])[1] = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_4"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_5"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_10"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_14"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_15"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_16")}
-- DECOMPILER ERROR at PC344: Confused about usage of register: R7 in 'UnsetPending'

;
(farmGuideDesc[1])[2] = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC2_2"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC2_1"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC2_12"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC2_13")}
local farmGuideIcon = {}
farmGuideIcon[0] = {[0] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmBaseInfoIcon1"), [1] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmBaseInfoIcon2"), [2] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmBaseInfoIcon3"), [3] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmBaseInfoIcon4"), [4] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmBaseInfoIcon5"), [5] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmBaseInfoIcon6")}
farmGuideIcon[1] = {[0] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmManagementInfoIcon1"), [1] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmManagementInfoIcon2"), [2] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmManagementInfoIcon3"), [3] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmManagementInfoIcon4"), [4] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmManagementInfoIcon5"), [5] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmManagementInfoIcon6")}
farmGuideIcon[2] = {[0] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmHavestInfoIcon1"), [1] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmHavestInfoIcon2"), [2] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmHavestInfoIcon3"), [3] = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmHavestInfoIcon4")}
local selectIcon = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_C_IconSelect")
local descTitle = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "StaticText_FarmInfoTitle")
local descContent = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "StaticText_FarmInfoDesc")
descContent:SetTextMode(UI_TM.eTextMode_AutoWrap)
local descContentBG = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "Static_FarmInfoDescBG")
local iconToolTip = (UI.getChildControl)(Panel_InstallationMode_FarmInfo, "StaticText_ToolTip")
local IconAddInputEvnet = function(icon, iconType)
  -- function num : 0_0 , upvalues : farmGuideIcon
  for i = 0, #icon do
    (icon[i]):addInputEvent("Mouse_LUp", "HandleClicked_ShowDesc(" .. i .. ", " .. iconType .. ")")
    ;
    (icon[i]):addInputEvent("Mouse_On", "HandleOn_ShowBubble(" .. i .. ", " .. iconType .. ")")
    ;
    (icon[i]):addInputEvent("Mouse_Out", "HandleOn_ShowBubble()")
    ;
    (icon[i]):setTooltipEventRegistFunc("HandleOn_ShowBubble(" .. i .. ", " .. iconType .. ")")
  end
  ;
  ((farmGuideIcon[1])[4]):addInputEvent("Mouse_LUp", "HandleClicked_ShowDesc(" .. 2 .. ", " .. 1 .. ")")
  ;
  ((farmGuideIcon[1])[4]):addInputEvent("Mouse_On", "HandleOn_ShowBubble(" .. 2 .. ", " .. 1 .. ")")
  ;
  ((farmGuideIcon[1])[4]):addInputEvent("Mouse_Out", "HandleOn_ShowBubble()")
  ;
  ((farmGuideIcon[1])[4]):setTooltipEventRegistFunc("HandleOn_ShowBubble(" .. 2 .. ", " .. 1 .. ")")
  ;
  ((farmGuideIcon[1])[5]):addInputEvent("Mouse_LUp", "HandleClicked_ShowDesc(" .. 3 .. ", " .. 1 .. ")")
  ;
  ((farmGuideIcon[1])[5]):addInputEvent("Mouse_On", "HandleOn_ShowBubble(" .. 3 .. ", " .. 1 .. ")")
  ;
  ((farmGuideIcon[1])[5]):addInputEvent("Mouse_Out", "HandleOn_ShowBubble()")
  ;
  ((farmGuideIcon[1])[5]):setTooltipEventRegistFunc("HandleOn_ShowBubble(" .. 3 .. ", " .. 1 .. ")")
  ;
  ((farmGuideIcon[2])[2]):addInputEvent("Mouse_LUp", "HandleClicked_ShowDesc(" .. 0 .. ", " .. 2 .. ")")
  ;
  ((farmGuideIcon[2])[2]):addInputEvent("Mouse_On", "HandleOn_ShowBubble(" .. 0 .. ", " .. 2 .. ")")
  ;
  ((farmGuideIcon[2])[2]):addInputEvent("Mouse_Out", "HandleOn_ShowBubble()")
  ;
  ((farmGuideIcon[2])[2]):setTooltipEventRegistFunc("HandleOn_ShowBubble(" .. 0 .. ", " .. 2 .. ")")
  ;
  ((farmGuideIcon[2])[3]):addInputEvent("Mouse_LUp", "HandleClicked_ShowDesc(" .. 1 .. ", " .. 2 .. ")")
  ;
  ((farmGuideIcon[2])[3]):addInputEvent("Mouse_On", "HandleOn_ShowBubble(" .. 1 .. ", " .. 2 .. ")")
  ;
  ((farmGuideIcon[2])[3]):addInputEvent("Mouse_Out", "HandleOn_ShowBubble()")
  ;
  ((farmGuideIcon[2])[3]):setTooltipEventRegistFunc("HandleOn_ShowBubble(" .. 1 .. ", " .. 2 .. ")")
end

for ii = 0, 2 do
  IconAddInputEvnet(farmGuideIcon[ii], ii)
end
HandleClicked_ShowDesc = function(index, descType)
  -- function num : 0_1 , upvalues : radioBtn_Crop, radioBtn_DomesticAnimal, descTitle, farmGuideDesc, descContent, selectIcon, farmGuideIcon, descContentBG
  local radioIndex = 0
  if radioBtn_Crop:IsCheck() then
    radioIndex = 0
  else
    if radioBtn_DomesticAnimal:IsCheck() then
      radioIndex = 1
    end
  end
  descTitle:SetText("- " .. ((farmGuideDesc[radioIndex])[descType])[index])
  descContent:SetText(((farmGuideDesc[radioIndex])[descType])[index + 10])
  selectIcon:SetPosX(((farmGuideIcon[descType])[index]):GetPosX() - 1)
  selectIcon:SetPosY(((farmGuideIcon[descType])[index]):GetPosY() - 1)
  descContentBG:SetSize(descContentBG:GetSizeX(), descContent:GetTextSizeY() + 50)
  Panel_InstallationMode_FarmInfo:SetSize(Panel_InstallationMode_FarmInfo:GetSizeX(), 385 + descContent:GetTextSizeY() + 35)
end

HandleOn_ShowBubble = function(index, descType)
  -- function num : 0_2 , upvalues : iconToolTip, radioBtn_Crop, radioBtn_DomesticAnimal, farmGuideIcon, farmGuideDesc
  if index == nil then
    iconToolTip:SetShow(false)
    return 
  end
  local radioIndex = 0
  if radioBtn_Crop:IsCheck() then
    radioIndex = 0
  else
    if radioBtn_DomesticAnimal:IsCheck() then
      radioIndex = 1
    end
  end
  registTooltipControl((farmGuideIcon[descType])[index], iconToolTip)
  iconToolTip:SetShow(true)
  iconToolTip:SetText(((farmGuideDesc[radioIndex])[descType])[index])
  iconToolTip:SetSize(iconToolTip:GetTextSizeX() + 10, iconToolTip:GetTextSizeY() + 5)
  Panel_InstallationMode_FarmInfo:SetChildIndex(iconToolTip, 9999)
  iconToolTip:SetPosX(((farmGuideIcon[descType])[index]):GetPosX() - 1)
  iconToolTip:SetPosY(((farmGuideIcon[descType])[index]):GetPosY() - iconToolTip:GetSizeY() - 5)
end

FarmGuide_DescChange = function(index)
  -- function num : 0_3 , upvalues : farmGuideIcon
  if index == 0 then
    ((farmGuideIcon[1])[2]):SetShow(true)
    ;
    ((farmGuideIcon[1])[3]):SetShow(true)
    ;
    ((farmGuideIcon[1])[4]):SetShow(false)
    ;
    ((farmGuideIcon[1])[5]):SetShow(false)
    ;
    ((farmGuideIcon[2])[0]):SetShow(true)
    ;
    ((farmGuideIcon[2])[1]):SetShow(true)
    ;
    ((farmGuideIcon[2])[2]):SetShow(false)
    ;
    ((farmGuideIcon[2])[3]):SetShow(false)
  else
    if index == 1 then
      ((farmGuideIcon[1])[2]):SetShow(false)
      ;
      ((farmGuideIcon[1])[3]):SetShow(false)
      ;
      ((farmGuideIcon[1])[4]):SetShow(true)
      ;
      ((farmGuideIcon[1])[5]):SetShow(true)
      ;
      ((farmGuideIcon[2])[0]):SetShow(false)
      ;
      ((farmGuideIcon[2])[1]):SetShow(false)
      ;
      ((farmGuideIcon[2])[2]):SetShow(true)
      ;
      ((farmGuideIcon[2])[3]):SetShow(true)
    end
  end
  HandleClicked_ShowDesc(0, 0)
end

FGlobal_FarmGuide_Open = function()
  -- function num : 0_4 , upvalues : radioBtn_Crop, radioBtn_DomesticAnimal
  Panel_InstallationMode_FarmInfo:SetShow(true)
  radioBtn_Crop:SetCheck(true)
  radioBtn_DomesticAnimal:SetCheck(false)
  FarmGuide_SetPosition()
  HandleClicked_ShowDesc(0, 0)
end

FGlobal_FarmGuide_Close = function()
  -- function num : 0_5
  Panel_InstallationMode_FarmInfo:SetShow(false)
end

FarmGuide_BtnTextPosition = function()
  -- function num : 0_6 , upvalues : radioBtn_Crop, radioBtn_DomesticAnimal
  local btnCropSizeX = radioBtn_Crop:GetSizeX() + 23
  local btnCropTextPosX = btnCropSizeX - btnCropSizeX / 2 - radioBtn_Crop:GetTextSizeX() / 2
  local btnAnimalSizeX = radioBtn_DomesticAnimal:GetSizeX() + 23
  local btnAnimalTextPosX = btnAnimalSizeX - btnAnimalSizeX / 2 - radioBtn_DomesticAnimal:GetTextSizeX() / 2
  radioBtn_Crop:SetTextSpan(btnCropTextPosX, 5)
  radioBtn_DomesticAnimal:SetTextSpan(btnAnimalTextPosX, 5)
end

FarmGuide_SetPosition = function()
  -- function num : 0_7
  Panel_InstallationMode_FarmInfo:SetPosX(10)
  Panel_InstallationMode_FarmInfo:SetPosY(getScreenSizeY() / 4 - Panel_InstallationMode_FarmInfo:GetSizeY() / 4)
end

registerEvent("onScreenResize", "FarmGuide_SetPosition")
FarmGuide_BtnTextPosition()

