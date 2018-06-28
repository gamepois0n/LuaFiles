local Customization_CustomizingHandleInfo = {
  _ui = {
    _leafTree = {}
  },
  _currentPartCount = 0,
  _currentClassType
}
function PaGlobalFunc_Customization_ClickLeafTree(index)
  selectCustomizationControlPart(index)
end
function PaGlobalFunc_FromClient_Customization_Open(classType, uiGroupIndex)
  local self = Customization_CustomizingHandleInfo
  self._ui._leafTree = PaGlobalFunc_Customization_GetLeafTree()
  self._ui._currentClassType = classType
  self._currentPartCount = getUiPartCount(classType, uiGroupIndex)
  for uiPartIndex = 0, self._currentPartCount - 1 do
    local partName = getUiPartDescName(classType, uiGroupIndex, uiPartIndex)
    self._ui._leafTree[uiPartIndex]:SetText(PAGetString(Defines.StringSheet_GAME, partName))
    self._ui._leafTree[uiPartIndex]:SetShow(true)
    self._ui._leafTree[uiPartIndex]:addInputEvent("Mouse_LUp", "PaGlobalFunc_Customization_ClickLeafTree(" .. uiPartIndex .. ")")
  end
end
function Customization_CustomizingHandleInfo:InitControl()
end
function Customization_CustomizingHandleInfo:InitEvent()
end
function Customization_CustomizingHandleInfo:InitRegister()
  registerEvent("EventOpenCustomizationUiGroupFrame", "PaGlobalFunc_FromClient_Customization_Open")
end
function Customization_CustomizingHandleInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_FromClient_Customization_CustomizingHandle_luaLoadComplete()
  local self = Customization_CustomizingHandleInfo
  self:Initialize()
end
PaGlobalFunc_FromClient_Customization_CustomizingHandle_luaLoadComplete()
