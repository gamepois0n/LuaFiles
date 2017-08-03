-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\panel_login_nickname.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
Panel_Login_Nickname:SetShow(false, false)
Panel_Login_Nickname:setGlassBackground(true)
local loginNickname = {edit_Nickname = (UI.getChildControl)(Panel_Login_Nickname, "Edit_Nickname"), button_OK = (UI.getChildControl)(Panel_Login_Nickname, "Button_Apply_Import"), desc1 = (UI.getChildControl)(Panel_Login_Nickname, "StaticText_1"), desc2 = (UI.getChildControl)(Panel_Login_Nickname, "StaticText_2"), desc3 = (UI.getChildControl)(Panel_Login_Nickname, "StaticText_3")}
loginNickname.init = function(self)
  -- function num : 0_0 , upvalues : loginNickname, UI_TM
  ;
  (UI.ASSERT)(self.edit_Nickname ~= nil and type(self.edit_Nickname) ~= "number", "Edit_Nickname")
  ;
  (UI.ASSERT)(self.button_OK ~= nil and type(self.button_OK) ~= "number", "Button_Apply_Import")
  ;
  (loginNickname.desc1):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (loginNickname.desc2):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (loginNickname.desc3):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (loginNickname.desc1):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NICKNAME_NOTIFY_1"))
  ;
  (loginNickname.desc2):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NICKNAME_NOTIFY_2"))
  ;
  (loginNickname.desc3):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NICKNAME_NOTIFY_3"))
  ;
  (self.button_OK):addInputEvent("Mouse_LUp", "LoginNickname_OK()")
  ;
  (self.edit_Nickname):RegistReturnKeyEvent("LoginNickname_OK()")
  registerEvent("EventCreateNickname", "LoginNickname_Open")
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

LoginNickname_OK = function()
  -- function num : 0_1 , upvalues : loginNickname
  ClearFocusEdit()
  local self = loginNickname
  if not lobbyNickname_createNickname((self.edit_Nickname):GetEditText()) then
    return 
  end
  local createFamilyName = function()
    -- function num : 0_1_0
    registerNickname()
  end

  local messageBoxContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOGIN_NICKNAME_FIRSTCREATE", "name", (self.edit_Nickname):GetEditText())
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxContent, functionYes = createFamilyName, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

LoginNickname_Cancel_End = function()
  -- function num : 0_2
  disConnectToGame()
  GlobalExitGameClient()
end

LoginNickname_Open = function()
  -- function num : 0_3 , upvalues : loginNickname
  if Panel_Login_Nickname:GetShow() then
    return 
  end
  local self = loginNickname
  ;
  (self.edit_Nickname):SetEditText("")
  ;
  (self.edit_Nickname):SetMaxInput(getGameServiceTypeUserNickNameLength())
  SetFocusEdit(self.edit_Nickname)
  Panel_Login_Nickname:SetShow(true)
end

LoginNickname_Close = function()
  -- function num : 0_4 , upvalues : loginNickname
  local self = loginNickname
  ;
  (self.edit_Nickname):SetEditText("")
  if Panel_Login_Nickname:GetShow() then
    Panel_Login_Nickname:SetShow(false)
  end
end

loginNickname:init()

