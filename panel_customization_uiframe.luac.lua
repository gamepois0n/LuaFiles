-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\panel_customization_uiframe.luac 

-- params : ...
-- function num : 0
local UI_GroupType = CppEnums.PA_CONSOLE_UI_CONTROL_TYPE
local StaticText_Category_Template = (UI.getChildControl)(Panel_CustomizationFrame, "StaticText_Category_Template")
local Button_ShowDetail_Template = (UI.getChildControl)(Panel_CustomizationFrame, "Button_ShowDetail_Template")
local Button_Close = (UI.getChildControl)(Panel_CustomizationFrame, "Button_Close")
local Panel_Child = (UI.getChildControl)(Panel_CustomizationFrame, "Panel_Child")
local CheckButton_UseFaceCustomizationHair = (UI.getChildControl)(Panel_CustomizationFrame, "CheckButton_UseFaceCustomizationHair")
local StaticText_UseFaceCustomizationHair = (UI.getChildControl)(Panel_CustomizationFrame, "StaticText_UseFaceCustomizationHair")
local openclasstype = {}
StaticText_UseFaceCustomizationHair:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATIONFRAME_USEFACECUSTOMIZATIONHAIR"))
Button_Close:addInputEvent("Mouse_LUp", "CloseFrame()")
registerEvent("EventCloseFrame", "CloseFrame")
registerEvent("EventOpenCustomizationUiGroupFrame", "OpenCustomizationUiGroupFrame")
registerEvent("EventCloseCustomizationUiGroupFrame", "CloseCustomizationUiGroupFrame")
CheckButton_UseFaceCustomizationHair:addInputEvent("Mouse_LUp", "CheckFaceCustomizationHair()")
CheckButton_UseFaceCustomizationHair:SetCheck(false)
g_selectedPart = 0
g_selectedPanel = nil
g_selectedGroup = 0
local panelGapWidth = 10
local panelGapHeight = 8
local customizationPartControl = {}
local partNum = 0
local partControlButtonHeight = StaticText_Category_Template:GetSizeY()
local radioButtonTextureName = "new_ui_common_forlua/Window/Lobby/cus_buttons.dds"
local isTatooCheckContry = isGameTypeKR2()
local isTatooGroup = false
local tatooIndex = 0
local currentidex = -1
local clearGroupFrame = function()
  -- function num : 0_0 , upvalues : partNum, customizationPartControl
  for partIndex = 1, partNum do
    if ChekcTatoo_PossibleContry(partIndex, true) then
      ((customizationPartControl[partIndex]).button):SetShow(false)
      ;
      ((customizationPartControl[partIndex]).text):SetShow(false)
      ;
      (UI.deleteControl)((customizationPartControl[partIndex]).button)
      ;
      (UI.deleteControl)((customizationPartControl[partIndex]).text)
    end
  end
  partNum = 0
  g_selectedPart = 0
  g_selectedPanel = nil
  customizationPartControl = {}
end

local radioButtonOnOff = function(part, on)
  -- function num : 0_1 , upvalues : partNum, customizationPartControl, radioButtonTextureName
  if part == 0 or partNum < part then
    return 
  end
  local selectedButtonControl = (customizationPartControl[part]).button
  if on == true then
    selectedButtonControl:ChangeTextureInfoName(radioButtonTextureName)
    local x1, y1, x2, y2 = setTextureUV_Func(selectedButtonControl, 1, 23, 21, 43)
    ;
    (selectedButtonControl:getBaseTexture()):setUV(x1, y1, x2, y2)
    selectedButtonControl:setRenderTexture(selectedButtonControl:getBaseTexture())
    selectedButtonControl:ChangeOnTextureInfoName(radioButtonTextureName)
    local x1, y1, x2, y2 = setTextureUV_Func(selectedButtonControl, 22, 23, 42, 43)
    ;
    (selectedButtonControl:getOnTexture()):setUV(x1, y1, x2, y2)
    selectedButtonControl:ChangeClickTextureInfoName(radioButtonTextureName)
    local x1, y1, x2, y2 = setTextureUV_Func(selectedButtonControl, 43, 23, 63, 43)
    ;
    (selectedButtonControl:getClickTexture()):setUV(x1, y1, x2, y2)
  else
    do
      selectedButtonControl:ChangeTextureInfoName(radioButtonTextureName)
      local x1, y1, x2, y2 = setTextureUV_Func(selectedButtonControl, 1, 1, 21, 21)
      ;
      (selectedButtonControl:getBaseTexture()):setUV(x1, y1, x2, y2)
      selectedButtonControl:setRenderTexture(selectedButtonControl:getBaseTexture())
      selectedButtonControl:ChangeOnTextureInfoName(radioButtonTextureName)
      local x1, y1, x2, y2 = setTextureUV_Func(selectedButtonControl, 22, 1, 42, 21)
      ;
      (selectedButtonControl:getOnTexture()):setUV(x1, y1, x2, y2)
      selectedButtonControl:ChangeClickTextureInfoName(radioButtonTextureName)
      local x1, y1, x2, y2 = setTextureUV_Func(selectedButtonControl, 43, 1, 63, 21)
      ;
      (selectedButtonControl:getClickTexture()):setUV(x1, y1, x2, y2)
    end
  end
end

SelectControlPart = function(partIndex)
  -- function num : 0_2 , upvalues : Panel_Child, currentidex, radioButtonOnOff
  Panel_Child:SetShow(false)
  currentidex = partIndex
  if g_selectedPart ~= 0 then
    radioButtonOnOff(g_selectedPart, false)
  end
  if g_selectedPanel ~= nil then
    g_selectedPanel:MoveChilds(g_selectedPanel:GetID(), Panel_Child)
    g_selectedPanel:SetShow(false)
    g_selectedPanel = nil
  end
  if g_selectedPart ~= partIndex + 1 then
    g_selectedPart = partIndex + 1
    radioButtonOnOff(g_selectedPart, true)
    selectCustomizationControlPart(partIndex)
  else
    if g_selectedPart ~= 0 then
      g_selectedPart = 0
      updateGroupFrameControls(0, nil)
      selectCustomizationControlPart(-1)
    end
  end
end

updateGroupFrameControls = function(selectedPartSpaceLength, selectedPanel)
  -- function num : 0_3 , upvalues : Panel_Child, customizationPartControl, partNum, partControlButtonHeight, panelGapWidth, panelGapHeight
  EnableCursor(false)
  if selectedPanel ~= nil then
    selectedPanel:SetIgnore(true)
    Panel_Child:MoveChilds(Panel_Child:GetID(), selectedPanel)
    Panel_Child:SetShow(true)
  end
  g_selectedPanel = selectedPanel
  local textOffsetY = ((customizationPartControl[1]).text):GetPosY()
  local buttonGap = 2
  for partIndex = 1, partNum do
    if ChekcTatoo_PossibleContry(partIndex, true) then
      local buttonOffsetY = textOffsetY + buttonGap
      ;
      ((customizationPartControl[partIndex]).text):SetPosY(textOffsetY)
      ;
      ((customizationPartControl[partIndex]).button):SetPosY(buttonOffsetY)
      textOffsetY = textOffsetY + partControlButtonHeight
      if partIndex == g_selectedPart then
        local selectedPanelHeight = g_selectedPanel:GetSizeY()
        Panel_Child:SetPosX(panelGapWidth)
        Panel_Child:SetPosY(panelGapHeight + (textOffsetY))
        Panel_Child:SetSize(Panel_Child:GetSizeX(), selectedPanelHeight)
        textOffsetY = textOffsetY + panelGapHeight + selectedPanelHeight + panelGapHeight
      end
    end
  end
  Panel_CustomizationFrame:SetSize(Panel_CustomizationFrame:GetSizeX(), textOffsetY + 4)
end

GetChildPanelPosX = function()
  -- function num : 0_4 , upvalues : Panel_Child
  return Panel_CustomizationFrame:GetPosX() + Panel_Child:GetPosX()
end

GetChildPanelPosY = function()
  -- function num : 0_5 , upvalues : Panel_Child
  return Panel_CustomizationFrame:GetPosY() + Panel_Child:GetPosY()
end

CloseFrameSlide = function()
  -- function num : 0_6 , upvalues : clearGroupFrame
  SelectControlPart(-1)
  clearGroupFrame()
  selectCustomizationControlPart(-1)
  selectCustomizationControlGroup(-1)
end

CloseFrame = function()
  -- function num : 0_7 , upvalues : clearGroupFrame
  if Panel_CustomizationImage:GetShow() then
    CloseTextureUi()
    return 
  end
  EnableCursor(false)
  SelectControlPart(-1)
  Panel_CustomizationFrame:SetShow(false, false)
  clearGroupFrame()
  selectCustomizationControlPart(-1)
  selectCustomizationControlGroup(-1)
  CustomizationMainUIShow(true)
  Set_CustomizationUIPanel(0, Panel_CustomizationMain, 4)
  ClearAll_CustomizationUIGroup(0)
  CustomizationMain_SettingConsoleUI()
end

CloseFrameForPoseUI = function()
  -- function num : 0_8 , upvalues : clearGroupFrame
  Panel_CustomizationFrame:SetShow(false)
  clearGroupFrame()
end

OpenCustomizationUiGroupFrame = function(classType, uiGroupIndex)
  -- function num : 0_9 , upvalues : clearGroupFrame, openclasstype, CheckButton_UseFaceCustomizationHair, StaticText_UseFaceCustomizationHair, isTatooGroup, partNum, tatooIndex, StaticText_Category_Template, partControlButtonHeight, Button_ShowDetail_Template, customizationPartControl
  ClearFocusEdit()
  clearGroupFrame()
  g_selectedGroup = uiGroupIndex
  openclasstype = classType
  if uiGroupIndex == 1 then
    CheckFaceCustomizationHair()
    CheckButton_UseFaceCustomizationHair:SetShow(true)
    StaticText_UseFaceCustomizationHair:SetShow(true)
  else
    CheckButton_UseFaceCustomizationHair:SetShow(false)
    StaticText_UseFaceCustomizationHair:SetShow(false)
  end
  if uiGroupIndex == 1 or uiGroupIndex == 2 then
    isTatooGroup = true
  else
    isTatooGroup = false
  end
  partNum = getUiPartCount(classType, uiGroupIndex)
  for uiPartIndex = 0, partNum - 1 do
    local partName = getUiPartDescName(classType, uiGroupIndex, uiPartIndex)
    if partName == "XML_CUSTOMIZATION_TATTOO" then
      tatooIndex = uiPartIndex
      break
    end
  end
  do
    for uiPartIndex = 0, partNum - 1 do
      if ChekcTatoo_PossibleContry(uiPartIndex, false) then
        local luaUiPartIndex = uiPartIndex + 1
        local partName = getUiPartDescName(classType, uiGroupIndex, uiPartIndex)
        local tempGroup = {button, text}
        local tempStaticText = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_CustomizationFrame, "StaticText_Category_" .. uiPartIndex)
        CopyBaseProperty(StaticText_Category_Template, tempStaticText)
        tempStaticText:SetText(PAGetString(Defines.StringSheet_GAME, partName))
        tempStaticText:SetShow(true)
        tempStaticText:SetPosY(StaticText_Category_Template:GetPosY() + uiPartIndex * partControlButtonHeight)
        local tempButton = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_CustomizationFrame, "Button_ShowDetail_" .. uiPartIndex)
        CopyBaseProperty(Button_ShowDetail_Template, tempButton)
        tempButton:SetShow(true)
        tempButton:SetPosY(Button_ShowDetail_Template:GetPosY() + uiPartIndex * partControlButtonHeight)
        tempButton:addInputEvent("Mouse_LUp", "SelectControlPart(" .. uiPartIndex .. ")")
        tempGroup.text = tempStaticText
        tempGroup.button = tempButton
        -- DECOMPILER ERROR at PC144: Confused about usage of register: R11 in 'UnsetPending'

        customizationPartControl[luaUiPartIndex] = tempGroup
      end
    end
    SelectControlPart(0)
    Panel_CustomizationFrame:SetShow(true, false)
  end
end

CheckFaceCustomizationHair = function()
  -- function num : 0_10 , upvalues : CheckButton_UseFaceCustomizationHair
  setUseFaceCustomizationHair(CheckButton_UseFaceCustomizationHair:IsCheck())
end

toggleShowFrameUI = function(show)
  -- function num : 0_11
  Panel_CustomizationFrame:SetShow(show)
end

ChekcTatoo_PossibleContry = function(uiPartIndex, isContainer)
  -- function num : 0_12 , upvalues : isTatooGroup, isTatooCheckContry, tatooIndex
  local plusIndex = 0
  if isContainer then
    plusIndex = 1
  end
  do
    local isTatoo = isTatooGroup ~= false and ((tatooIndex + plusIndex ~= uiPartIndex and isTatooCheckContry))
    do return isTatoo end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

InConsoleNextFrame = function()
  -- function num : 0_13 , upvalues : partNum, currentidex, UI_GroupType, Button_Close, CheckButton_UseFaceCustomizationHair
  if partNum < currentidex + 1 then
    currentidex = 0
    SelectControlPart(currentidex)
  else
    if partNum == currentidex + 1 then
      SelectControlPart(currentidex)
      Set_CustomizationUIPanel(0, Panel_CustomizationFrame, 10)
      ClearAll_CustomizationUIGroup(0)
      Add_CustomizationUIGroup(0, 0, UI_GroupType.eCONSOLE_UI_CONTROL_TYPE_CUSTOMIZATION)
      Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsolePrevFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB2)
      Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsoleNextFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB2)
      if g_selectedGroup ~= 1 then
        Add_CustomizationUIControl(0, 0, 0, 0, 1, 1, Button_Close)
      else
        Add_CustomizationUIControl(0, 0, 0, 0, 2, 1, Button_Close)
        Add_CustomizationUIControl(0, 0, 1, 0, 2, 1, CheckButton_UseFaceCustomizationHair)
      end
      currentidex = currentidex + 1
    else
      SelectControlPart(currentidex + 1)
    end
  end
  ToClient_setConsoleManagerSafeByLua(true)
end

InConsolePrevFrame = function()
  -- function num : 0_14 , upvalues : currentidex, partNum, UI_GroupType, Button_Close, CheckButton_UseFaceCustomizationHair
  if currentidex - 1 < 0 then
    SelectControlPart(0)
    currentidex = partNum
    Set_CustomizationUIPanel(0, Panel_CustomizationFrame, 10)
    ClearAll_CustomizationUIGroup(0)
    Add_CustomizationUIGroup(0, 0, UI_GroupType.eCONSOLE_UI_CONTROL_TYPE_CUSTOMIZATION)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsolePrevFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB2)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsoleNextFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB2)
    if g_selectedGroup ~= 1 then
      Add_CustomizationUIControl(0, 0, 0, 0, 1, 1, Button_Close)
    else
      Add_CustomizationUIControl(0, 0, 0, 0, 2, 1, Button_Close)
      Add_CustomizationUIControl(0, 0, 1, 0, 2, 1, CheckButton_UseFaceCustomizationHair)
    end
  else
    SelectControlPart(currentidex - 1)
  end
  ToClient_setConsoleManagerSafeByLua(true)
end


