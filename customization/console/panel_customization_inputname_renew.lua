Panel_Customizing_InputName:ignorePanelMoveSnapping()
local Customization_InputNameInfo = {
  _ui = {
    _edit_InputName = UI.getChildControl(Panel_Customizing_InputName, "Edit_InputName"),
    _static_KeyGuideBg = UI.getChildControl(Panel_Customizing_InputName, "Static_BottomGroup_ConsoleUI")
  },
  _defaultEditText = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CUSTOMIZATION_INPUTNAME_EDITTEXT")
}
function PaGlobalFunc_Customization_InputName_Confirm(str)
  local self = Customization_InputNameInfo
  local nameStr = str
  if nil == nameStr then
    nameStr = self._ui._edit_InputName:GetEditText()
  end
  Panel_CharacterCreateOK_Renew(nameStr)
end
function Customization_InputNameInfo:InitControl()
  self._ui._button_Confirm = UI.getChildControl(self._ui._static_KeyGuideBg, "Button_OK_ConsoleUI")
  self._ui._button_Cancel = UI.getChildControl(self._ui._static_KeyGuideBg, "Button_NO_ConsoleUI")
end
function Customization_InputNameInfo:InitEvent()
  self._ui._button_Confirm:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_InputName_Confirm()")
  self._ui._button_Cancel:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_InputName_Close()")
  Panel_Customizing_InputName:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "PaGlobalFunc_Customization_InputName_Confirm()")
  Panel_Customizing_InputName:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "PaGlobalFunc_Customization_InputName_SetFocus()")
  self._ui._edit_InputName:setXboxVirtualKeyBoardEndEvent("PaGlobalFunc_Customization_InputName_Confirm")
end
function Customization_InputNameInfo:InitRegister()
end
function Customization_InputNameInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_Customization_InputName_SetFocus()
  local self = Customization_InputNameInfo
  SetFocusEdit(self._ui._edit_InputName)
end
function PaGlobalFunc_FromClient_Customization_InputName_luaLoadComplete()
  local self = Customization_InputNameInfo
  self:Initialize()
end
function PaGlobalFunc_Customization_InputName_Close()
  local self = Customization_InputNameInfo
  if false == PaGlobalFunc_Customization_InputName_GetShow() then
    return
  end
  if true == self._ui._edit_InputName:GetFocusEdit() then
    ClearFocusEdit()
    return
  end
  self._ui._edit_InputName:SetEditText("")
  PaGlobalFunc_Customization_SetCloseFunc(nil)
  PaGlobalFunc_Customization_SetBackEvent()
  PaGlobalFunc_Customization_InputName_SetShow(false, false)
end
function PaGlobalFunc_Customization_InputName_Open()
  local self = Customization_InputNameInfo
  self._ui._edit_InputName:SetText(self._defaultEditText)
  if true == PaGlobalFunc_Customization_InputName_GetShow() then
    return
  end
  PaGlobalFunc_Customization_SetCloseFunc(PaGlobalFunc_Customization_InputName_Close)
  PaGlobalFunc_Customization_SetBackEvent("PaGlobalFunc_Customization_InputName_Close()")
  PaGlobalFunc_Customization_InputName_SetShow(true, false)
end
function PaGlobalFunc_Customization_InputName_SetShow(isShow, isAni)
  Panel_Customizing_InputName:SetShow(isShow, isAni)
end
function PaGlobalFunc_Customization_InputName_GetShow()
  return Panel_Customizing_InputName:GetShow()
end
PaGlobalFunc_FromClient_Customization_InputName_luaLoadComplete()
