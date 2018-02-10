-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_password.luac 

-- params : ...
-- function num : 0
Panel_ItemMarket_Password:SetShow(false)
PaGlobal_ItemMarketPassword = {
_ui = {_staticTextTitle = (UI.getChildControl)(Panel_ItemMarket_Password, "Static_Text_Title_Import"), _editPassword = (UI.getChildControl)(Panel_ItemMarket_Password, "Edit_DisplayNumber"), _checkPasswordView = (UI.getChildControl)(Panel_ItemMarket_Password, "CheckButton_NumberView"), _buttonKeypadBack = (UI.getChildControl)(Panel_ItemMarket_Password, "Button_Back_Import"), _buttonKeypadClear = (UI.getChildControl)(Panel_ItemMarket_Password, "Button_Clear_Import"), _buttonApply = (UI.getChildControl)(Panel_ItemMarket_Password, "Button_Apply_Import"), _buttonCancel = (UI.getChildControl)(Panel_ItemMarket_Password, "Button_Cancel_Import"), BlockBG = (UI.getChildControl)(Panel_ItemMarket_Password, "Static_BlockBG")}
, 
_password = {}
, 
_const = {NonePassword = 0, CreatedPassword = 1, InputMode = 2}
, _state = 0, _maxPassward = 8, _minPassward = 6, _itemCount = 0}
-- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ItemMarketPassword.Init = function(self)
  -- function num : 0_0
  for index = 1, 9 do
    ((UI.getChildControl)(Panel_ItemMarket_Password, "Button_" .. index .. "_Import")):addInputEvent("Mouse_LUp", "PaGlobal_ItemMarketPassword:ClickedPassword( " .. index .. " )")
  end
  ;
  ((self._ui)._checkPasswordView):addInputEvent("Mouse_LUp", "PaGlobal_ItemMarketPassword:ToggleViewPassword()")
  ;
  ((self._ui)._buttonKeypadBack):addInputEvent("Mouse_LUp", "PaGlobal_ItemMarketPassword:ClickedPasswordDelete()")
  ;
  ((self._ui)._buttonKeypadClear):addInputEvent("Mouse_LUp", "PaGlobal_ItemMarketPassword:ClickedPasswordClear()")
  ;
  ((self._ui)._buttonApply):addInputEvent("Mouse_LUp", "PaGlobal_ItemMarketPassword:ClickedPasswordRegist()")
  ;
  ((self._ui)._buttonCancel):addInputEvent("Mouse_LUp", "PaGlobal_ItemMarketPassword:ClickedCancel()")
  ;
  ((self._ui).BlockBG):SetShow(true)
  ;
  ((self._ui).BlockBG):SetSize(getScreenSizeX() + 500, getScreenSizeY() + 500)
  ;
  ((self._ui).BlockBG):SetHorizonCenter()
  ;
  ((self._ui).BlockBG):SetVerticalMiddle()
  ;
  ((self._ui).BlockBG):ComputePos()
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ItemMarketPassword.ClickedCancel = function(self)
  -- function num : 0_1
  if ((self._ui)._editPassword):GetEditText() == "" then
    FGlobal_ItemMarketPassword_CanelPassword()
  end
  local password = tonumber(((self._ui)._editPassword):GetEditText())
  if password == nil then
    _PA_LOG("후진", "[PaGlobal_ItemMarketPassword] 패스워드�\144 숫자�\128 아닌 것이 있습니다.")
    return 
  end
  FGlobal_ItemMarketPassword_CanelPassword()
end

FGlobal_ItemMarketPassword_CanelPassword = function()
  -- function num : 0_2
  ((PaGlobal_ItemMarketPassword._ui)._editPassword):SetEditText("")
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_ItemMarketPassword._state = (PaGlobal_ItemMarketPassword._const).NonePassword
  Panel_ItemMarket_Password:SetShow(false)
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ItemMarketPassword.ClickedPasswordRegist = function(self)
  -- function num : 0_3
  local passwordString = ((self._ui)._editPassword):GetEditText()
  local password = tonumber(passwordString)
  if password == nil then
    _PA_LOG("후진", "[PaGlobal_ItemMarketPassword] 패스워드�\144 숫자�\128 아닌 것이 있습니다.  : " .. passwordString)
    return 
  end
  if self._state == (self._const).InputMode then
    FGlobal_ItemMarket_BuyWith_PrivatePasssword(tonumber(((self._ui)._editPassword):GetEditText()), self._itemCount)
    return 
  end
  if self._maxPassward < (string.len)(passwordString) then
    return 
  end
  if (string.len)(passwordString) < self._minPassward then
    return 
  end
  local messageBoxMemo = "현재 비밀번호�\156 물품 비밀번호 설정하시겠습니까?"
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = FGlobal_ItemMarketPassword_ApplyPassword, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_ItemMarketPassword_ApplyPassword = function()
  -- function num : 0_4
  FGlobal_ItemMarketRegistItem_RegistPassword(tonumber(((PaGlobal_ItemMarketPassword._ui)._editPassword):GetEditText()))
  Panel_ItemMarket_Password:SetShow(false)
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ItemMarketPassword.ClickedPasswordDelete = function(self)
  -- function num : 0_5
  local password = tonumber(((self._ui)._editPassword):GetEditText())
  if password == nil then
    _PA_LOG("후진", "[PaGlobal_ItemMarketPassword] 패스워드�\144 숫자�\128 아닌 것이 있습니다.")
    return 
  end
  local deletePassword = (math.floor)(password * 0.1)
  if password < 10 then
    deletePassword = ""
  end
  ;
  ((self._ui)._editPassword):SetEditText(deletePassword)
  self:update()
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ItemMarketPassword.ClickedPasswordClear = function(self)
  -- function num : 0_6
  ((self._ui)._editPassword):SetEditText("")
  self:update()
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ItemMarketPassword.ToggleViewPassword = function(self)
  -- function num : 0_7
  self:update()
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ItemMarketPassword.ClickedPassword = function(self, index)
  -- function num : 0_8
  if index == 0 then
    return 
  end
  local passwordString = ((self._ui)._editPassword):GetEditText() .. tostring(index)
  local password = tonumber(passwordString)
  if password == nil then
    _PA_LOG("후진", "[PaGlobal_ItemMarketPassword] 패스워드�\144 숫자�\128 아닌 것이 있습니다.")
    return 
  end
  if self._maxPassward < (string.len)(passwordString) and self._state ~= (self._const).InputMode then
    return 
  end
  ;
  ((self._ui)._editPassword):SetEditText(passwordString)
  self:update()
end

FGlobal_ItemMarketPassword_Open = function(password, InputMode, itemCount)
  -- function num : 0_9
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

  if PaGlobal_ItemMarketPassword._minPassward <= password then
    PaGlobal_ItemMarketPassword._state = (PaGlobal_ItemMarketPassword._const).CreatedPasswords
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R3 in 'UnsetPending'

  if InputMode == true then
    PaGlobal_ItemMarketPassword._state = (PaGlobal_ItemMarketPassword._const).InputMode
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R3 in 'UnsetPending'

    PaGlobal_ItemMarketPassword._itemCount = itemCount
  end
  ;
  ((PaGlobal_ItemMarketPassword._ui)._editPassword):SetEditText(((PaGlobal_ItemMarketPassword._ui)._editPassword):GetEditText())
  ;
  ((PaGlobal_ItemMarketPassword._ui).BlockBG):SetShow(true)
  Panel_ItemMarket_Password:SetShow(true)
  ;
  ((PaGlobal_ItemMarketPassword._ui).BlockBG):SetSize(getScreenSizeX() + 500, getScreenSizeY() + 500)
  ;
  ((PaGlobal_ItemMarketPassword._ui).BlockBG):SetHorizonCenter()
  ;
  ((PaGlobal_ItemMarketPassword._ui).BlockBG):SetVerticalMiddle()
  ;
  ((PaGlobal_ItemMarketPassword._ui).BlockBG):ComputePos()
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ItemMarketPassword.update = function(self)
  -- function num : 0_10
  local isBlind = not ((self._ui)._checkPasswordView):IsCheck()
  ;
  ((self._ui)._editPassword):SetSafeMode(isBlind)
  ;
  ((self._ui)._editPassword):SetText(((self._ui)._editPassword):GetEditText())
  ;
  ((self._ui)._editPassword):SetEditText(((self._ui)._editPassword):GetEditText())
end

PaGlobal_ItemMarketPassword:Init()
registerEvent("FromClient_luaLoadComplete", "PaGlobal_ItemMarketPassword:Init()")

