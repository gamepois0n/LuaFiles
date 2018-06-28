local Customization_MenuHandlerInfo = {
  _ui = {
    _static_MainMenuBg = UI.getChildControl(Panel_Customizing, "Static_MainMenu"),
    _static_SubMenuBg = UI.getChildControl(Panel_Customizing, "Static_SubMenu"),
    _static_BottomBg = UI.getChildControl(Panel_Customizing, "Static_BottomBg"),
    _static_ZodiacBg = UI.getChildControl(Panel_Customizing, "Static_ZodiacBg"),
    _mainMenu = {},
    _ingameMainMenu = {},
    _currentMainMenu = {},
    _subMenu = {},
    _leafMune = {}
  },
  _config = {
    _CustomizingMaxSubTree = 4,
    _ActionMaxSubTree = 2,
    _maxLeafTree = 20
  },
  _mainMenuConfig = {
    _Customizing = 0,
    _Zodiac = 1,
    _Action = 2,
    _BeautyAlbum = 3,
    _popular = 4,
    _max = 5
  },
  _strCustomizingConfig = {
    [0] = PAGetString(Defines.StringSheet_RESOURCE, "UI_CUSTOMIZATION_MAIN_HAIR"),
    [1] = PAGetString(Defines.StringSheet_RESOURCE, "UI_CUSTOMIZATION_MAIN_FACE"),
    [2] = PAGetString(Defines.StringSheet_RESOURCE, "UI_CUSTOMIZATION_MAIN_FORM"),
    [3] = PAGetString(Defines.StringSheet_RESOURCE, "UI_CUSTOMIZATION_MAIN_VOICE")
  },
  _strActionConfig = {
    [0] = PAGetString(Defines.StringSheet_RESOURCE, "UI_CUSTOMIZATION_MAIN_LOOK"),
    [1] = PAGetString(Defines.StringSheet_RESOURCE, "UI_CUSTOMIZATION_MAIN_COSTUME")
  },
  _currentMainIndex = -1,
  _currentSubIndex = -1,
  _currentLeafIndex = -1,
  _currentDepth = 0,
  _focusMenuPosX,
  _focusMenuPosY,
  _currentClassType,
  _isOtherPanelOpen = false,
  _currentOpenPanelCloseFunc = nil,
  _currentZodiacIndex = -1,
  _isInGame = false
}
function PaGlobalFunc_Customization_IsInGame()
  local self = Customization_MenuHandlerInfo
  return self._isInGame
end
function PaGlobalFunc_Customization_SetCloseFunc(func)
  local self = Customization_MenuHandlerInfo
  self._currentOpenPanelCloseFunc = func
end
function PaGlobalFunc_Customization_SetClassType(index)
  local self = Customization_MenuHandlerInfo
  self._currentClassType = index
end
function PaGlobalFunc_Customization_GetLeafTree()
  local self = Customization_MenuHandlerInfo
  self:LeafMenuClose()
  return self._ui._leafMune
end
function PaGlobalFunc_Customization_SetSubTitle()
  local self = Customization_MenuHandlerInfo
  self._ui._subMenu[self._currentMainIndex][self._currentSubIndex]:SetShow(true)
  self._ui._subMenu[self._currentMainIndex][self._currentSubIndex]:SetPosX(self._focusMenuPosX)
  self._ui._subMenu[self._currentMainIndex][self._currentSubIndex]:SetPosY(self._focusMenuPosY)
end
function PaGlobalFunc_Customization_ClickedZodiac(index)
  local self = Customization_MenuHandlerInfo
  local zodiacInfo = getZodiac(index)
  local zodiacName = zodiacInfo:getZodiacName()
  if zodiacName ~= nil then
    self._ui._staticText_ZodiacTitle:SetText(zodiacName)
  end
  local zodiacDescription = zodiacInfo:getZodiacDescription()
  if zodiacDescription ~= nil then
    self._ui._staticText_ZodiacDesc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    self._ui._staticText_ZodiacDesc:SetText(zodiacDescription)
  end
  local zodiacImagePath = zodiacInfo:getZodiacImagePath()
  if zodiacImagePath ~= nil then
    self._ui._static_ZodiacImage:ChangeTextureInfoName(zodiacImagePath)
    self._ui._static_ZodiacImage:getBaseTexture():setUV(0, 0, 1, 1)
    self._ui._static_ZodiacImage:setRenderTexture(self._ui._static_ZodiacImage:getBaseTexture())
  end
  local zodiacKey = zodiacInfo:getZodiacKey()
  applyZodiac(zodiacKey)
  self._currentZodiacIndex = index
end
function PaGlobalFunc_Customization_ClickedCustomizing(index)
  local self = Customization_MenuHandlerInfo
  self._currentSubIndex = index
  if 3 == index then
    PaGlobalFunc_Customization_Voice_CreateVoiceList(false, self._currentClassType)
    closeExplorer()
    return
  end
  selectCustomizationControlGroup(index)
  self._currentDepth = 2
  self:MainMenuClose()
  self:SubMenuClose(self._currentMainIndex)
  self:SetSubTitlePos()
  closeExplorer()
end
function PaGlobalFunc_Customization_ClickedAction(index)
  local self = Customization_MenuHandlerInfo
  self._currentSubIndex = index
  selectPoseControl(index + 1)
end
function aGlobalFunc_Customization_RandomBeautyComfirm()
  local self = Customization_MenuHandlerInfo
  self._ui._web_RandomBeauty:SetIgnore(true)
  self._ui._web_RandomBeauty:SetPosX(-1500)
  self._ui._web_RandomBeauty:SetPosY(-1500)
  self._ui._web_RandomBeauty:SetSize(1, 1)
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local url = PaGlobal_URL_Check(worldNo)
  local userNo = 0
  local userNickName = ""
  local cryptKey = getSelfPlayer():get():getWebAuthenticKeyCryptString()
  local classType = getSelfPlayer():getClassType()
  local isGm = ToClient_SelfPlayerIsGM()
  if ToClient_isLobbyProcessor() then
    userNickName = getFamilyName()
    userNo = getUserNoByLobby()
  else
    userNickName = getSelfPlayer():getUserNickname()
    userNo = getSelfPlayer():get():getUserNo()
  end
  url = url .. "/customizing?userNo=" .. tostring(userNo) .. "&userNickname=" .. tostring(userNickName) .. "&certKey=" .. tostring(cryptKey) .. "&classType=" .. tostring(classType) .. "&isCustomizationMode=" .. tostring(true) .. "&isGm=" .. tostring(isGm) .. "&isRandom=" .. tostring(true)
  self._ui._web_RandomBeauty:SetUrl(1, 1, url, false, true)
end
function PaGlobalFunc_Customization_RandomBeauty()
  if ToClient_isUserCreateContentsAllowed() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MAIN_RANDOMBEAUTY_MSG")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
      content = messageBoxMemo,
      functionYes = aGlobalFunc_Customization_RandomBeautyComfirm,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
  else
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DONOTHAVE_PRIVILEGE")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
      content = messageBoxMemo,
      functionYes = MessageBox_Empty_function,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
  end
end
function PaGlobalFunc_Customization_ClickedMainMenu(index)
  local self = Customization_MenuHandlerInfo
  if 3 == index then
    FGlobal_CustomizingAlbum_Show(true, CppEnums.ClientSceneState.eClientSceneStateType_Customization)
    return
  end
  if 4 == index then
    PaGlobalFunc_Customization_RandomBeauty()
    return
  end
  self:MainMenuClose()
  self:SubMenuOpen(index)
  self._currentMainIndex = index
  self._currentDepth = 1
end
function Customization_MenuHandlerInfo:MainMenuOpen()
  self._ui._static_ZodiacBg:SetShow(false)
  for index, mainButton in pairs(self._ui._currentMainMenu) do
    mainButton:SetShow(true)
    mainButton:SetPosX(self._focusMenuPosX)
    mainButton:SetPosY(self._focusMenuPosY + (mainButton:GetSizeY() + 30) * index)
  end
  self._currentDepth = 0
end
function Customization_MenuHandlerInfo:MainMenuClose()
  for index, mainButton in pairs(self._ui._currentMainMenu) do
    mainButton:SetShow(false)
  end
end
function Customization_MenuHandlerInfo:InitControl()
  self._ui._staticText_ZodiacTitle = UI.getChildControl(self._ui._static_ZodiacBg, "StaticText_StarTitle")
  self._ui._staticText_ZodiacDesc = UI.getChildControl(self._ui._static_ZodiacBg, "StaticText_StarDesc")
  self._ui._static_ZodiacImage = UI.getChildControl(self._ui._static_ZodiacBg, "Static_ZodiacImage")
  self._ui._static_ZodiacBg:SetShow(false)
  self._ui._mainMenu[self._mainMenuConfig._Customizing] = UI.getChildControl(self._ui._static_MainMenuBg, "RadioButton_MainMenu_Customizing")
  self._ui._mainMenu[self._mainMenuConfig._Zodiac] = UI.getChildControl(self._ui._static_MainMenuBg, "RadioButton_MainMenu_Zodiac")
  self._ui._mainMenu[self._mainMenuConfig._Action] = UI.getChildControl(self._ui._static_MainMenuBg, "RadioButton_MainMenu_Action")
  self._ui._mainMenu[self._mainMenuConfig._BeautyAlbum] = UI.getChildControl(self._ui._static_MainMenuBg, "RadioButton_MainMenu_BeautyAlbum")
  self._ui._mainMenu[self._mainMenuConfig._popular] = UI.getChildControl(self._ui._static_MainMenuBg, "RadioButton_MainMenu_Popular")
  self._ui._mainMenu[self._mainMenuConfig._Customizing]:SetShow(false)
  self._ui._mainMenu[self._mainMenuConfig._Zodiac]:SetShow(false)
  self._ui._mainMenu[self._mainMenuConfig._Action]:SetShow(false)
  self._ui._mainMenu[self._mainMenuConfig._BeautyAlbum]:SetShow(false)
  self._ui._mainMenu[self._mainMenuConfig._popular]:SetShow(false)
  self._ui._ingameMainMenu[0] = self._ui._mainMenu[self._mainMenuConfig._Customizing]
  self._ui._ingameMainMenu[1] = self._ui._mainMenu[self._mainMenuConfig._Action]
  self._ui._ingameMainMenu[2] = self._ui._mainMenu[self._mainMenuConfig._BeautyAlbum]
  self._ui._ingameMainMenu[3] = self._ui._mainMenu[self._mainMenuConfig._popular]
  self._focusMenuPosX = self._ui._mainMenu[self._mainMenuConfig._Customizing]:GetPosX()
  self._focusMenuPosY = self._ui._mainMenu[self._mainMenuConfig._Customizing]:GetPosY()
  self._ui._button_Back = UI.getChildControl(self._ui._static_BottomBg, "Button_Back")
  self._ui._button_CreateCharacter = UI.getChildControl(self._ui._static_BottomBg, "Button_CharacterCreate")
  self._ui._subMenuTemplate = UI.getChildControl(self._ui._static_SubMenuBg, "RadioButton_SubMenu_Template")
  self._ui._subMenuTemplate:SetShow(false)
  self._ui._leafMenuTemplate = UI.getChildControl(self._ui._static_SubMenuBg, "RadioButton_ItemTemplate")
  self._ui._leafMenuTemplate:SetShow(false)
  self._ui._subMenu[self._mainMenuConfig._Customizing] = {}
  for index = 0, self._config._CustomizingMaxSubTree - 1 do
    local control = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_RADIOBUTTON, self._ui._static_SubMenuBg, "radioButton_Customizing_" .. index)
    CopyBaseProperty(self._ui._subMenuTemplate, control)
    control:SetText(self._strCustomizingConfig[index])
    control:SetShow(false)
    control:SetPosX(self._focusMenuPosX)
    control:SetPosY(self._focusMenuPosY + (control:GetSizeY() + 30) * (index + 1))
    self._ui._subMenu[self._mainMenuConfig._Customizing][index] = control
  end
  self._ui._subMenu[self._mainMenuConfig._Zodiac] = {}
  local count = getZodiacCount()
  for index = 0, count - 1 do
    local control = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_RADIOBUTTON, self._ui._static_SubMenuBg, "radioButton_Zodiac_" .. index)
    CopyBaseProperty(self._ui._subMenuTemplate, control)
    control:SetPosY(control:GetPosY() + (control:GetSizeY() + 30) * index)
    local zodiacInfo = getZodiac(index)
    local zodiacName = zodiacInfo:getZodiacName()
    control:SetText(zodiacName)
    control:SetShow(false)
    control:SetPosX(self._focusMenuPosX)
    control:SetPosY(self._focusMenuPosY + (control:GetSizeY() + 30) * (index + 1))
    self._ui._subMenu[self._mainMenuConfig._Zodiac][index] = control
  end
  self._ui._subMenu[self._mainMenuConfig._Action] = {}
  for index = 0, self._config._ActionMaxSubTree - 1 do
    local control = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_RADIOBUTTON, self._ui._static_SubMenuBg, "radioButton_Action_" .. index)
    CopyBaseProperty(self._ui._subMenuTemplate, control)
    control:SetPosX(self._focusMenuPosX)
    control:SetPosY(self._focusMenuPosY + (control:GetSizeY() + 30) * (index + 1))
    control:SetText(self._strActionConfig[index])
    control:SetShow(false)
    self._ui._subMenu[self._mainMenuConfig._Action][index] = control
  end
  for index = 0, self._config._maxLeafTree - 1 do
    local control = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_RADIOBUTTON, self._ui._static_SubMenuBg, "leafButton_" .. index)
    CopyBaseProperty(self._ui._leafMenuTemplate, control)
    control:SetPosX(self._focusMenuPosX)
    control:SetPosY(self._focusMenuPosY + (control:GetSizeY() + 30) * (index + 1))
    control:SetShow(false)
    self._ui._leafMune[index] = control
  end
  self._ui._web_RandomBeauty = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_WEBCONTROL, Panel_Customizing, "WebControl_RandomCustomization_Renew")
end
function Customization_MenuHandlerInfo:SetSubTitlePos()
  self._ui._subMenu[self._currentMainIndex][self._currentSubIndex]:SetShow(true)
  self._ui._subMenu[self._currentMainIndex][self._currentSubIndex]:SetPosX(self._focusMenuPosX)
  self._ui._subMenu[self._currentMainIndex][self._currentSubIndex]:SetPosY(self._focusMenuPosY)
end
function Customization_MenuHandlerInfo:LeafMenuClose()
  for _, control in pairs(self._ui._leafMune) do
    control:addInputEvent("Mouse_LUp", "")
    control:SetCheck(false)
    control:SetShow(false)
  end
end
function Customization_MenuHandlerInfo:SubMenuOpen(mainIndex)
  self._ui._static_ZodiacBg:SetShow(self._mainMenuConfig._Zodiac == mainIndex)
  self._ui._mainMenu[mainIndex]:SetShow(true)
  self._ui._mainMenu[mainIndex]:SetPosX(self._focusMenuPosX)
  self._ui._mainMenu[mainIndex]:SetPosY(self._focusMenuPosY)
  for index, control in pairs(self._ui._subMenu[mainIndex]) do
    control:SetShow(true)
    control:SetPosX(self._focusMenuPosX)
    control:SetPosY(self._focusMenuPosY + (control:GetSizeY() + 30) * (index + 1))
  end
  self._currentDepth = 1
  if self._mainMenuConfig._Zodiac == mainIndex then
    for index, control in pairs(self._ui._subMenu[mainIndex]) do
      control:SetCheck(index == self._currentZodiacIndex)
    end
  end
end
function Customization_MenuHandlerInfo:SubMenuClose(mainIndex)
  if nil ~= mainIndex then
    for _, control in pairs(self._ui._subMenu[mainIndex]) do
      control:SetShow(false)
      control:SetCheck(false)
    end
  else
    for _, control in pairs(self._ui._subMenu[self._mainMenuConfig._Customizing]) do
      control:SetShow(false)
      control:SetCheck(false)
    end
    for _, control in pairs(self._ui._subMenu[self._mainMenuConfig._Zodiac]) do
      control:SetShow(false)
      control:SetCheck(false)
    end
    for _, control in pairs(self._ui._subMenu[self._mainMenuConfig._Action]) do
      control:SetShow(false)
      control:SetCheck(false)
    end
  end
end
function PaGlobalFunc_Customization_Back()
  local self = Customization_MenuHandlerInfo
  if true == Panel_CustomizingAlbum:GetShow() then
    Panel_CustomizingAlbum:SetShow(false)
    return
  end
  if true == self._isOtherPanelOpen then
    if nil ~= self._currentOpenPanelCloseFunc then
      self._currentOpenPanelCloseFunc()
      for _, control in pairs(self._ui._leafMune) do
        if nil ~= control then
          control:SetCheck(false)
        end
      end
      if -1 ~= self._currentMainIndex and -1 ~= self._currentSubIndex then
        self._ui._subMenu[self._currentMainIndex][self._currentSubIndex]:SetCheck(false)
        self._ui._mainMenu[self._currentMainIndex]:SetCheck(false)
      end
    end
    return
  end
  if 0 == self._currentDepth then
    if true == PaGlobalFunc_Customization_IsInGame() then
      IngameCustomize_Hide()
      return
    end
    PaGlobalFunc_Customization_Cancel()
  elseif 1 == self._currentDepth then
    self:SubMenuClose(self._currentMainIndex)
    self:MainMenuOpen()
  elseif 2 == self._currentDepth then
    selectCustomizationControlPart(-1)
    selectCustomizationControlGroup(-1)
    self:LeafMenuClose()
    self:SubMenuOpen(self._currentMainIndex)
  end
end
function PaGlobalFunc_Customization_CreateCharacter()
  local self = Customization_MenuHandlerInfo
  PaGlobalFunc_Customization_InputName_Open()
end
function Customization_MenuHandlerInfo:InitEvent()
  for index, mainButton in pairs(self._ui._mainMenu) do
    mainButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_ClickedMainMenu(" .. index .. ")")
  end
  for index, zodiacControl in pairs(self._ui._subMenu[self._mainMenuConfig._Customizing]) do
    zodiacControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_ClickedCustomizing(" .. index .. ")")
  end
  for index, zodiacControl in pairs(self._ui._subMenu[self._mainMenuConfig._Zodiac]) do
    zodiacControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_ClickedZodiac(" .. index .. ")")
  end
  for index, zodiacControl in pairs(self._ui._subMenu[self._mainMenuConfig._Action]) do
    zodiacControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_ClickedAction(" .. index .. ")")
  end
  self._ui._button_Back:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_Cancel()")
  self._ui._button_CreateCharacter:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_CreateCharacter()")
  Panel_Customizing:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobalFunc_Customization_CreateCharacter()")
end
function PaGlobalFunc_Customization_SetBackEvent(func)
  local self = Customization_MenuHandlerInfo
  if nil ~= func then
    self._isOtherPanelOpen = true
    self._ui._button_Back:addInputEvent("Mouse_LUp", func)
  else
    self._isOtherPanelOpen = false
    self._ui._button_Back:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_Back()")
  end
end
function PaGlobalFunc_Customization_SelectClass()
  PaGlobalFunc_Customization_Close()
  changeCreateCharacterMode_SelectClass(FGlobal_getIsSpecialCharacter())
end
function PaGlobalFunc_Customization_Cancel()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MSGBOX_CANCEL")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
    content = messageBoxMemo,
    functionYes = PaGlobalFunc_Customization_SelectClass,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function PaGlobalFunc_Customization_CameraLookEnable(lookEnable)
  setCharacterLookAtCamera(lookEnable)
end
function PaGlobalFunc_FromClient_Customization_EventShowCharacterCustomization(customizationData, classIndex, isInGame)
  local self = Customization_MenuHandlerInfo
  self._currentClassType = classIndex
  self._isInGame = isInGame
end
function PaGlobalFunc_FromClient_Customization_ShowAllUI(isShow)
  local self = Customization_MenuHandlerInfo
  PaGlobalFunc_Customization_Open()
end
function PaGlobalFunc_Customization_GetShow()
  return Panel_Customizing:GetShow()
end
function PaGlobalFunc_Customization_SetShow(isShow, isAni)
  Panel_Customizing:SetShow(isShow, isAni)
end
function PaGlobalFunc_Customization_Close()
  if false == PaGlobalFunc_Customization_GetShow() then
    return
  end
  PaGlobalFunc_Customization_SetShow(false, false)
end
function PaGlobalFunc_Customization_Open()
  local self = Customization_MenuHandlerInfo
  if true == PaGlobalFunc_Customization_GetShow() then
    return
  end
  self._ui._currentMainMenu = {}
  if false == PaGlobalFunc_Customization_IsInGame() then
    self._ui._button_CreateCharacter:SetText(PAGetString(Defines.StringSheet_RESOURCE, "CHARACTER_CREATE_TXT_TITLE"))
    Panel_Customizing:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobalFunc_Customization_CreateCharacter()")
    self._ui._currentMainMenu = self._ui._mainMenu
  else
    self._ui._button_CreateCharacter:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CASH_REVIVAL_BUYITEM_BTN_CONFIRM"))
    Panel_Customizing:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "HandleClicked_CashCustomization_Apply()")
    self._ui._currentMainMenu = self._ui._ingameMainMenu
  end
  self._currentMainIndex = -1
  self._currentSubIndex = -1
  self._currentLeafIndex = -1
  self._currentDepth = 0
  self:LeafMenuClose()
  self:SubMenuClose()
  self:MainMenuOpen()
  if false == PaGlobalFunc_Customization_IsInGame() then
    PaGlobalFunc_Customization_ClickedZodiac(getRandomValue(0, getZodiacCount() - 1))
  end
  PaGlobalFunc_Customization_SetShow(true, false)
end
function PaGlobalFunc_Customization_Toggle()
  PaGlobalFunc_Customization_SetShow(not PaGlobalFunc_Customization_GetShow(), false)
end
function Customization_MenuHandlerInfo:InitRegister()
  registerEvent("EventShowUpAllUI", "PaGlobalFunc_FromClient_Customization_ShowAllUI")
  registerEvent("EventShowCharacterCustomization", "PaGlobalFunc_FromClient_Customization_EventShowCharacterCustomization")
end
function Customization_MenuHandlerInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
  self._isInGame = false
end
function PaGlobalFunc_FromClient_Customization_luaLoadComplete()
  local self = Customization_MenuHandlerInfo
  self:Initialize()
end
PaGlobalFunc_FromClient_Customization_luaLoadComplete()
