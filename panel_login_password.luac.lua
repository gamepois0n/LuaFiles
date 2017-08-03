-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\panel_login_password.luac 

-- params : ...
-- function num : 0
Panel_Login_Password:SetShow(false, false)
Panel_Login_Password:setGlassBackground(true)
local loginPassword = {
config = {indexMax = 10, startX = 30, startY = 95, gapX = 70, gapY = 40, row = 2, column = 5}
, 
const = {type_CreatePassword = 0, type_Reconfirm = 1, type_Authentic = 2}
, Edit_Password = (UI.getChildControl)(Panel_Login_Password, "Edit_DisplayNumber"), StaticText_Title = (UI.getChildControl)(Panel_Login_Password, "Static_Text_Title_Import"), Button_Keypad_Back = (UI.getChildControl)(Panel_Login_Password, "Button_Back_Import"), Button_Keypad_Clear = (UI.getChildControl)(Panel_Login_Password, "Button_Clear_Import"), Button_Apply = (UI.getChildControl)(Panel_Login_Password, "Button_Apply_Import"), Button_Cancel = (UI.getChildControl)(Panel_Login_Password, "Button_Cancel_Import"), Check_PasswordView = (UI.getChildControl)(Panel_Login_Password, "CheckButton_NumberView"), indexs = (Array.new)(), state = 0, isChangeTexture = false}
local UI_color = Defines.Color
loginPassword.init = function(self)
  -- function num : 0_0
  ;
  (UI.ASSERT)(self.Edit_Password ~= nil and type(self.Edit_Password) ~= "number", "Static_DisplayNumber_Import")
  ;
  (UI.ASSERT)(self.Button_Keypad_Back ~= nil and type(self.Button_KeyPad_Back) ~= "number", "Button_Back_Import")
  ;
  (UI.ASSERT)(self.Button_Keypad_Clear ~= nil and type(self.Button_KeyPad_Clea) ~= "number", "Button_Clear_Import")
  ;
  (UI.ASSERT)(self.Button_Apply ~= nil and type(self.Button_Apply) ~= "number", "Button_Apply_Import")
  ;
  (UI.ASSERT)(self.Button_Cancel ~= nil and type(self.Button_Cancel) ~= "number", "Button_Cancel_Import")
  ;
  (UI.ASSERT)(self.StaticText_Title ~= nil and type(self.StaticText_Title) ~= "number", "Static_Text_Title_Import")
  ;
  (UI.ASSERT)(self.Check_PasswordView ~= nil and type(self.Check_PasswordView) ~= "number", "CheckButton_NumberView")
  for ii = 0, (self.config).indexMax - 1 do
    local index = {}
    index.index = ii
    index.button = (UI.getChildControl)(Panel_Login_Password, "Button_" .. ii .. "_Import")
    ;
    (index.button):addInputEvent("Mouse_Out", "LoginPassword_ButtonMouseOut(" .. ii .. ")")
    ;
    (index.button):addInputEvent("Mouse_LDown", "LoginPassword_ButtonBlind(" .. ii .. ")")
    ;
    (index.button):addInputEvent("Mouse_LUp", "LoginPassword_Input(" .. ii .. ")")
    index.baseText = tostring(ii)
    ;
    (UI.ASSERT)(index.button ~= nil and type(index.button) ~= "number", "Button_" .. ii .. "_Import")
    -- DECOMPILER ERROR at PC161: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.indexs)[ii] = index
  end
  ;
  (self.Button_Keypad_Back):SetPosX((self.config).startX + (self.config).gapX * ((self.config).column - 2))
  ;
  (self.Button_Keypad_Back):SetPosY((self.config).startY + (self.config).gapY * (self.config).row)
  ;
  (self.Button_Keypad_Clear):SetPosX((self.config).startX + (self.config).gapX * ((self.config).column - 1))
  ;
  (self.Button_Keypad_Clear):SetPosY((self.config).startY + (self.config).gapY * (self.config).row)
  ;
  (self.Button_Keypad_Back):addInputEvent("Mouse_LUp", "LoginPassword_Input_Back()")
  ;
  (self.Button_Keypad_Clear):addInputEvent("Mouse_LUp", "LoginPassword_Input_Clear()")
  ;
  (self.Button_Apply):addInputEvent("Mouse_LUp", "LoginPassword_Enter()")
  ;
  (self.Button_Cancel):addInputEvent("Mouse_LUp", "LoginPassword_Cancel()")
  ;
  (self.Button_Apply):ActiveMouseEventEffect(true)
  ;
  (self.Button_Cancel):ActiveMouseEventEffect(true)
  ;
  (self.Check_PasswordView):addInputEvent("Mouse_LUp", "CheckButton_Sound()")
  registerEvent("EventOpenPassword", "LoginPassword_Open")
  -- DECOMPILER ERROR: 15 unprocessed JMP targets
end

LoginPassword_Open = function(isCreatePassword)
  -- function num : 0_1 , upvalues : loginPassword
  LoginNickname_Close()
  if not lobbyPassword_UsePassword() then
    loginToGame()
    return 
  end
  if isGameServiceTypeDev() and ToClient_UseConfigPassword() then
    loginToGame()
    return 
  end
  lobbyPassword_ClearIndexString(true)
  lobbyPassword_ClearIndexString(false)
  local self = loginPassword
  local shuffleIndex = 0
  local posX = 0
  local posY = 0
  for ii = 0, (self.config).indexMax - 1 do
    posX = (self.config).startX + (self.config).gapX * (ii % (self.config).column)
    posY = (self.config).startY + (self.config).gapY * (math.floor)(ii / (self.config).column)
    shuffleIndex = lobbyPassword_getShuffleIndex(ii)
    -- DECOMPILER ERROR at PC63: Confused about usage of register: R9 in 'UnsetPending'

    ;
    ((self.indexs)[shuffleIndex]).index = ii
    ;
    (((self.indexs)[shuffleIndex]).button):SetPosX(posX)
    ;
    (((self.indexs)[shuffleIndex]).button):SetPosY(posY)
  end
  ;
  (self.Check_PasswordView):SetCheck(false)
  if isCreatePassword then
    self.state = (self.const).type_CreatePassword
  else
    self.state = (self.const).type_Authentic
  end
  if (self.const).type_CreatePassword == self.state then
    (self.StaticText_Title):SetText(PAGetString(Defines.StringSheet_GAME, "SECONDARYPASSWORD_CREATE"))
  else
    if (self.const).type_Authentic == self.state then
      (self.StaticText_Title):SetText(PAGetString(Defines.StringSheet_GAME, "SECONDARYPASSWORD_INPUT"))
    end
  end
  Panel_Login_ButtonDisable(true)
  LoginPassword_Update()
  if not Panel_Login_Password:GetShow() then
    Panel_Login_Password:SetShow(true)
  end
end

LoginPassword_Close = function()
  -- function num : 0_2
  lobbyPassword_ClearIndexString(true)
  lobbyPassword_ClearIndexString(false)
  if Panel_Login_Password:IsShow() then
    Panel_Login_Password:SetShow(false)
  end
  Panel_Login_ButtonDisable(false)
end

LoginPassword_Enter = function()
  -- function num : 0_3 , upvalues : loginPassword
  local self = loginPassword
  do
    local isTemporary = (self.const).type_Reconfirm == self.state
    if not lobbyPassword_checkPasswordLength(isTemporary) then
      return 
    end
    if (self.const).type_CreatePassword == self.state then
      self.state = (self.const).type_Reconfirm
      ;
      (self.StaticText_Title):SetText(PAGetString(Defines.StringSheet_GAME, "SECONDARYPASSWORD_IDENTIFY"))
      LoginPassword_Update()
      return 
    end
    if (self.const).type_Reconfirm == self.state and not lobbyPassword_isEqualPassword() then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "SECONDARYPASSWORD_DIFFERENCE")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "SECONDARYPASSWORD_NOTICE"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      LoginPassword_Open(true)
      return 
    end
    loginToGame()
    LoginPassword_Close()
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

LoginPassword_Cancel = function()
  -- function num : 0_4
  if isGameServiceTypeDev() == true then
    lobbyPassword_ClearIndexString(true)
    lobbyPassword_ClearIndexString(false)
    Panel_Login_Password:SetShow(false)
  else
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "GAME_EXIT_MESSAGEBOX_MEMO")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "GAME_EXIT_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = LoginPassword_CancelEnd, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
  do
    Panel_Login_ButtonDisable(false)
  end
end

LoginPassword_CancelEnd = function()
  -- function num : 0_5
  disConnectToGame()
  GlobalExitGameClient()
end

LoginPassword_ButtonBlind = function(index)
  -- function num : 0_6 , upvalues : loginPassword
  local self = loginPassword
  for ii = 0, (self.config).indexMax - 1 do
    (((self.indexs)[ii]).button):SetText("")
  end
  self.isChangeTexture = true
end

LoginPassword_ButtonInit = function()
  -- function num : 0_7 , upvalues : loginPassword
  local self = loginPassword
  for ii = 0, (self.config).indexMax - 1 do
    (((self.indexs)[ii]).button):SetText(((self.indexs)[ii]).baseText)
  end
  self.isChangeTexture = false
end

LoginPassword_ButtonMouseOut = function(index)
  -- function num : 0_8
  LoginPassword_ButtonInit()
end

LoginPassword_Input = function(index)
  -- function num : 0_9 , upvalues : loginPassword
  local self = loginPassword
  local isTemporary = (self.const).type_Reconfirm == self.state
  do
    local shuffleIndex = ((self.indexs)[index]).index
    LoginPassword_ButtonInit()
    lobbyPassword_AddIndexString(shuffleIndex, isTemporary)
    LoginPassword_Update()
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

LoginPassword_Input_Back = function()
  -- function num : 0_10 , upvalues : loginPassword
  local self = loginPassword
  do
    local isTemporary = (self.const).type_Reconfirm == self.state
    lobbyPassword_BackIndexString(isTemporary)
    LoginPassword_Update()
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

LoginPassword_Input_Clear = function()
  -- function num : 0_11 , upvalues : loginPassword
  local self = loginPassword
  do
    local isTemporary = (self.const).type_Reconfirm == self.state
    lobbyPassword_ClearIndexString(isTemporary)
    LoginPassword_Update()
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

CheckButton_Sound = function()
  -- function num : 0_12
  audioPostEvent_SystemUi(0, 0)
  LoginPassword_Update()
end

LoginPassword_Update = function()
  -- function num : 0_13 , upvalues : loginPassword
  local self = loginPassword
  do
    local isTemporary = (self.const).type_Reconfirm == self.state
    ;
    (self.Edit_Password):SetText(lobbyPassword_GetIndexString(not (self.Check_PasswordView):IsCheck(), isTemporary))
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

loginPassword:init()

