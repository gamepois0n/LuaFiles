local UI_TM = CppEnums.TextMode
local _panel = Panel_Login_Nickname_Renew
_panel:SetShow(false, false)
_panel:setGlassBackground(true)
local loginNickname = {
  edit_nickname = UI.getChildControl(_panel, "Edit_Nickname"),
  btn_apply = UI.getChildControl(_panel, "Button_Apply_Import"),
  desc1 = UI.getChildControl(_panel, "StaticText_1"),
  desc2 = UI.getChildControl(_panel, "StaticText_2"),
  desc3 = UI.getChildControl(_panel, "StaticText_3"),
  stc_sampleImage = UI.getChildControl(_panel, "Static_Illust")
}
function loginNickname:init()
  UI.ASSERT(nil ~= self.edit_nickname and "number" ~= type(self.edit_nickname), "Edit_Nickname")
  UI.ASSERT(nil ~= self.btn_apply and "number" ~= type(self.btn_apply), "Button_Apply_Import")
  loginNickname.desc1:SetTextMode(UI_TM.eTextMode_AutoWrap)
  loginNickname.desc2:SetTextMode(UI_TM.eTextMode_AutoWrap)
  loginNickname.desc3:SetTextMode(UI_TM.eTextMode_AutoWrap)
  loginNickname.desc1:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NICKNAME_NOTIFY_1"))
  loginNickname.desc2:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NICKNAME_NOTIFY_2"))
  loginNickname.desc3:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NICKNAME_NOTIFY_3"))
  self.btn_apply:addInputEvent("Mouse_LUp", "LoginNickname_OK()")
  self.edit_nickname:setXboxVirtualKeyBoardEndEvent("Input_LoginNickname_KeyboardEnd")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "Input_loginNickname_Edit()")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "LoginNickname_OK()")
  registerEvent("EventCreateNickname", "LoginNickname_Open")
end
function LoginNickname_OK()
  ClearFocusEdit()
  local self = loginNickname
  if not lobbyNickname_createNickname(self.edit_nickname:GetEditText()) then
    return
  end
  local createFamilyName = function()
    registerNickname()
  end
  local messageBoxContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOGIN_NICKNAME_FIRSTCREATE", "name", self.edit_nickname:GetEditText())
  local messageboxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"),
    content = messageBoxContent,
    functionYes = createFamilyName,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function Input_loginNickname_Edit()
  SetFocusEdit(loginNickname.edit_nickname)
end
function Input_LoginNickname_KeyboardEnd(str)
  loginNickname.edit_nickname:SetText(str)
end
function LoginNickname_Cancel_End()
  disConnectToGame()
  GlobalExitGameClient()
end
function LoginNickname_Open()
  if _panel:GetShow() then
    return
  end
  ToClient_setTargetPanel(_panel)
  local self = loginNickname
  self.edit_nickname:SetEditText("")
  self.edit_nickname:SetMaxInput(getGameServiceTypeUserNickNameLength())
  ClearFocusEdit()
  _panel:SetShow(true)
  PaGlobal_Policy_ShowWindow(true)
end
function LoginNickname_Close()
  local self = loginNickname
  self.edit_nickname:SetEditText("")
  if _panel:GetShow() then
    _panel:SetShow(false)
  end
end
loginNickname:init()
