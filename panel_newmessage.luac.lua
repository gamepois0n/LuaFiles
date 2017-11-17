-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\friend\panel_newmessage.luac 

-- params : ...
-- function num : 0
Panel_NewMessage:SetShow(false, false)
PaGlobal_NewMessage = {
_ui = {_btnClose = (UI.getChildControl)(Panel_NewMessage, "Button_Close"), _btnEnter = (UI.getChildControl)(Panel_NewMessage, "Button_Open"), _staticTitle = (UI.getChildControl)(Panel_NewMessage, "StaticTitle"), _staticText = (UI.getChildControl)(Panel_NewMessage, "StaticText")}
}
-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_NewMessage.SetShow = function(self, isShow)
  -- function num : 0_0
  self._isShow = isShow
  ;
  ((self._ui)._btnClose):SetShow(isShow)
  ;
  ((self._ui)._btnEnter):SetShow(isShow)
  ;
  ((self._ui)._staticTitle):SetShow(isShow)
  ;
  ((self._ui)._staticText):SetShow(isShow)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_NewMessage.Initialize = function(self)
  -- function num : 0_1
  ((self._ui)._btnClose):addInputEvent("Mouse_LUp", "PaGlobal_NewMessage:Close()")
  ;
  ((self._ui)._btnEnter):addInputEvent("Mouse_LUp", "PaGlobal_NewMessage:Open()")
  ;
  ((self._ui)._staticText):SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
  ;
  ((self._ui)._staticText):setLineCountByLimitAutoWrap(1)
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_NewMessage.Show = function(self)
  -- function num : 0_2
  Panel_NewMessage:SetShow(true, true)
  if PaGlobal_NewMessage._isShow == false then
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_NewMessage.Open = function(self)
  -- function num : 0_3
  PaGlobal_NewMessage:Close()
  FGlobal_FriendList_Show()
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_NewMessage.Close = function(self)
  -- function num : 0_4
  Panel_NewMessage:SetShow(false, true)
  if PaGlobal_NewMessage._isShow == true then
  end
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_NewMessage.Popup = function(self, userName, text)
  -- function num : 0_5
  PaGlobal_NewMessage:Show()
  if self._isShow == false then
    self:SetShow(true)
  end
  ;
  ((self._ui)._staticTitle):SetText(userName)
  ;
  ((self._ui)._staticText):SetText(text)
end

FGlobal_FriendList_Popup = function(userName, text)
  -- function num : 0_6
  PaGlobal_NewMessage:Popup(userName, text)
end

FGlobal_NewMessage_Close = function()
  -- function num : 0_7
  PaGlobal_NewMessage:Close()
end

FromClient_NotifyNewMessage = function(userName, text)
  -- function num : 0_8
  PaGlobal_NewMessage:Popup(userName, text)
end

FromClient_luaLoadComplete_NewMessage = function()
  -- function num : 0_9
  ToClient_GetFriendList()
end

PaGlobal_NewMessage:Initialize()
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_NewMessage")
registerEvent("FromClient_NotifyNewMessage", "FromClient_NotifyNewMessage")

