-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\gameexit\console\panel_window_gameexit_confirm_renew.luac 

-- params : ...
-- function num : 0
local Window_GameExit_ConfirmInfo = {
_ui = {_staticText_Title = (UI.getChildControl)(Panel_Window_GameExit_Confirm, "StaticText_Title"), _button_Confirm = (UI.getChildControl)(Panel_Window_GameExit_Confirm, "Button_Confirm"), _button_Cancle = (UI.getChildControl)(Panel_Window_GameExit_Confirm, "Button_Cancel"), _checkBox_Tray = (UI.getChildControl)(Panel_Window_GameExit_Confirm, "CheckButton_Tray"), _staticText_TrayHelp = (UI.getChildControl)(Panel_Window_GameExit_Confirm, "StaticText_TrayHelp"), _staticText_GameExit = (UI.getChildControl)(Panel_Window_GameExit_Confirm, "StaticText_GameExit")}
, 
_config = {_exitType_Exit = 0, _exitType_Tray = 1, _exitType_CharacterSelect = 2}
}
Window_GameExit_ConfirmInfo.SetDescByExitType = function(self, exitType)
  -- function num : 0_0
  if (self._config)._exitType_Exit == exitType then
    ((self._ui)._staticText_Title):SetText(PAGetString(Defines.StringSheet_GAME, "GAME_EXIT_MESSAGEBOX_TITLE"))
    ;
    ((self._ui)._staticText_GameExit):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_GAMEEXIT_TRAY_ASK"))
    ;
    ((self._ui)._staticText_TrayHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITTRAY_TRAYHELP"))
  else
    if (self._config)._exitType_Tray == exitType then
      ((self._ui)._staticText_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITCONFIRM_TITLE"))
      ;
      ((self._ui)._staticText_GameExit):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_GAMEEXIT_TRAY_ASK2"))
      ;
      ((self._ui)._staticText_TrayHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_TRAYLIMIT"))
    else
      if (self._config)._exitType_CharacterSelect == exitType then
        ((self._ui)._staticText_Title):SetText("")
        ;
        ((self._ui)._staticText_GameExit):SetText("")
        ;
        ((self._ui)._staticText_TrayHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_BACK_TO_CHARACTERSELECT_Q"))
      else
        _PA_LOG("이호�\156", "종료 �\128입이 잘못됐습니다.")
      end
    end
  end
end

Window_GameExit_ConfirmInfo.SetButtonEventByExitType = function(self, exitType)
  -- function num : 0_1
  if (self._config)._exitType_Exit == exitType then
    ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitConfirm_ExitButton()")
  else
    if (self._config)._exitType_Tray == exitType then
      ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitConfirm_TrayButton()")
    else
      if (self._config)._exitType_CharacterSelect == exitType then
        ((self._ui)._button_Confirm):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitConfirm_CharacterSelectButton()")
      else
        _PA_LOG("이호�\156", "종료 �\128입이 잘못됐습니다.")
      end
    end
  end
end

PaGlobalFunc_GameExitConfirm_ExitButton = function()
  -- function num : 0_2 , upvalues : Window_GameExit_ConfirmInfo
  local self = Window_GameExit_ConfirmInfo
  PaGlobalFunc_GameExit_ExitHandler(0)
  PaGlobalFunc_GameExitConfirm_SetShow(false, false)
end

PaGlobalFunc_GameExitConfirm_TrayButton = function()
  -- function num : 0_3 , upvalues : Window_GameExit_ConfirmInfo
  local self = Window_GameExit_ConfirmInfo
  PaGlobalFunc_GameExitConfirm_SetShow(false, false)
end

PaGlobalFunc_GameExitConfirm_CharacterSelectButton = function()
  -- function num : 0_4
  PaGlobalFunc_GameExit_ExitHandler(1)
  PaGlobalFunc_GameExitConfirm_SetShow(false, false)
end

Window_GameExit_ConfirmInfo.Initialize = function(self)
  -- function num : 0_5
  self:InitControl()
  self:InitEvent()
end

Window_GameExit_ConfirmInfo.InitControl = function(self)
  -- function num : 0_6
  ((self._ui)._staticText_TrayHelp):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui)._staticText_TrayHelp):SetAutoResize(true)
end

Window_GameExit_ConfirmInfo.InitEvent = function(self)
  -- function num : 0_7
  ((self._ui)._button_Cancle):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExitConfirm_SetShow(false,false)")
end

PaGlobalFunc_FromClient_GameExitConfirm_luaLoadComplete = function()
  -- function num : 0_8 , upvalues : Window_GameExit_ConfirmInfo
  local self = Window_GameExit_ConfirmInfo
  self:Initialize()
end

PaGlobalFunc_GameExitConfirm_OpenByExitType = function(exitType)
  -- function num : 0_9 , upvalues : Window_GameExit_ConfirmInfo
  local self = Window_GameExit_ConfirmInfo
  self:SetDescByExitType(exitType)
  self:SetButtonEventByExitType(exitType)
  PaGlobalFunc_GameExitConfirm_SetShow(true, true)
end

PaGlobalFunc_GameExitConfirm_SetShow = function(isShow, isAni)
  -- function num : 0_10
  Panel_Window_GameExit_Confirm:SetShow(isShow, isAni)
end

PaGlobalFunc_GameExitConfirm_GetShow = function()
  -- function num : 0_11
  return Panel_Window_GameExit_Confirm:GetShow()
end

PaGlobalFunc_GameExitConfirm_Toggle = function()
  -- function num : 0_12
  PaGlobalFunc_GameExitConfirm_SetShow(not PaGlobalFunc_GameExitConfirm_GetShow(), false)
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_GameExitConfirm_luaLoadComplete")

