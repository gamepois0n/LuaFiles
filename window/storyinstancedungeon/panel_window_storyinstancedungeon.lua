local Panel_Window_StroyInstanceDungeon_info = {
  _ui = {},
  _value = {instanceDungeonKey = -1},
  _config = {},
  _enum = {}
}
function Panel_Window_StroyInstanceDungeon_info:registEventHandler()
end
function Panel_Window_StroyInstanceDungeon_info:registerMessageHandler()
  registerEvent("onScreenResize", "FromClient_StroyInstanceDungeon_Resize")
end
function Panel_Window_StroyInstanceDungeon_info:initialize()
  self:childControl()
  self:initValue()
  self:resize()
  self:registerMessageHandler()
  self:registEventHandler()
end
function Panel_Window_StroyInstanceDungeon_info:initValue()
  self._value.instanceDungeonKey = -1
end
function Panel_Window_StroyInstanceDungeon_info:resize()
end
function Panel_Window_StroyInstanceDungeon_info:childControl()
end
function Panel_Window_StroyInstanceDungeon_info:setContent()
end
function Panel_Window_StroyInstanceDungeon_info:open()
end
function Panel_Window_StroyInstanceDungeon_info:close()
end
function PaGlobalFunc_StroyInstanceDungeon_GetShow()
end
function PaGlobalFunc_StroyInstanceDungeon_Open()
  local self = Panel_Window_StroyInstanceDungeon_info
  self:open()
end
function PaGlobalFunc_StroyInstanceDungeon_Close()
  local self = Panel_Window_StroyInstanceDungeon_info
  self:close()
end
function PaGlobalFunc_StroyInstanceDungeon_Show()
  local self = Panel_Window_StroyInstanceDungeon_info
  self:open()
end
function PaGlobalFunc_StroyInstanceDungeon_Exit()
  local self = Panel_Window_StroyInstanceDungeon_info
  self:close()
end
function PaGlobalFunc_StroyInstanceDungeon_Enter()
  local self = Panel_Window_StroyInstanceDungeon_info
  local indunkey = self._value.instanceDungeonKey
  ToClient_EnterIntanceDungeon(indunkey, true)
end
function PaGlobalFunc_StroyInstanceDungeon_Leave()
  local self = Panel_Window_StroyInstanceDungeon_info
  self._value.instanceDungeonKey = -1
  ToClient_EnterIntanceDungeon(-1, false)
end
function FromClient_StroyInstanceDungeon_Init()
  local self = Panel_Window_StroyInstanceDungeon_info
  self:initialize()
end
function FromClient_StroyInstanceDungeon_Resize()
  local self = Panel_Window_StroyInstanceDungeon_info
  self:resize()
end
function FromClient_ShowIndunEnterMessage(indunKey, enterRequest)
  local self = Panel_Window_StroyInstanceDungeon_info
  if true == enterRequest then
    self._value.instanceDungeonKey = indunkey
    local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
    local message = PAGetString(Defines.StringSheet_GAME, "LUA_STORYINSTANCEDUNGEON_ENTER")
    local messageboxData = {
      title = titleText,
      content = message,
      functionYes = PaGlobalFunc_StroyInstanceDungeon_Enter,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  else
    local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
    local message = PAGetString(Defines.StringSheet_GAME, "LUA_STORYINSTANCEDUNGEON_LEAVE")
    local messageboxData = {
      title = titleText,
      content = message,
      functionYes = PaGlobalFunc_StroyInstanceDungeon_Leave,
      functionNo = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
registerEvent("FromClient_luaLoadComplete", "FromClient_StroyInstanceDungeon_Init")
registerEvent("FromClient_ShowIndunMessage", "FromClient_ShowIndunEnterMessage")
