if nil == UI then
  UI = {}
end
local defaultRenderMode = PAUIRenderModeBitSet({
  Defines.RenderMode.eRenderMode_Default
})
function UI.createPanel(strID, groupID)
  tempUIBaseForLua = nil
  createPanel(strID, groupID, defaultRenderMode)
  return tempUIBaseForLua
end
function UI.createPanelAndSetPanelRenderMode(strID, groupID, renderModeBitSet)
  tempUIBaseForLua = nil
  createPanel(strID, groupID, renderModeBitSet)
  return tempUIBaseForLua
end
function UI.createControl(uiType, parent, strID)
  tempUIBaseForLua = nil
  createControl(uiType, parent, strID)
  return tempUIBaseForLua
end
function UI.createAndCopyBasePropertyControl(fromParent, fromStrID, parent, strID)
  local fromControl = UI.getChildControl(fromParent, fromStrID)
  if nil == fromControl then
    UI.ASSERT(nil ~= fromControl and "number" ~= type(fromControl), fromStrID)
    return nil
  end
  fromControl:SetShow(false)
  tempUIBaseForLua = nil
  createControl(fromControl:GetType(), parent, strID)
  if nil == tempUIBaseForLua then
    UI.ASSERT(nil ~= tempUIBaseForLua and "number" ~= type(tempUIBaseForLua), strID)
    return nil
  end
  CopyBaseProperty(fromControl, tempUIBaseForLua)
  tempUIBaseForLua:SetShow(true)
  return tempUIBaseForLua
end
function UI.cloneControl(controlToClone, parent, strID)
  if nil == controlToClone then
    UI.ASSERT(false, "clone\237\149\152\235\160\164\235\138\148 rootUI\234\176\128 nil\236\158\133\235\139\136\235\139\164")
    return nil
  end
  tempUIBaseForLua = nil
  cloneControl(controlToClone, parent, strID)
  if nil == tempUIBaseForLua then
    UI.ASSERT(false, "Control\236\157\132 \235\179\181\236\160\156\234\176\128 \236\139\164\237\140\168\237\149\152\236\152\128\236\138\181\235\139\136\235\139\164.")
  end
  return tempUIBaseForLua
end
function UI.createCustomControl(typeStr, parent, strID)
  tempUIBaseForLua = nil
  createCustomControl(typeStr, parent, strID)
  return tempUIBaseForLua
end
function UI.deleteControl(conrol)
  deleteControl(conrol)
end
function UI.getChildControl(parent, strID)
  tempUIBaseForLua = nil
  parent:getChildControl(strID)
  if nil == tempUIBaseForLua then
    UI.ASSERT(nil ~= tempUIBaseForLua and "number" ~= type(tempUIBaseForLua), strID)
    return nil
  end
  return tempUIBaseForLua
end
function UI.getChildControlNoneAssert(parent, strID)
  tempUIBaseForLua = nil
  parent:getChildControl(strID)
  if nil == tempUIBaseForLua then
    return nil
  end
  return tempUIBaseForLua
end
function UI.getChildControlByIndex(parent, index)
  tempUIBaseForLua = nil
  parent:getChildControlByIndex(index)
  return tempUIBaseForLua
end
function UI.deletePanel(strID)
  deletePanel(strID, groupID)
end
function UI.createOtherPanel(strID, groupID)
  tempUIBaseForLua = nil
  createOtherPanel(strID, groupID)
  return tempUIBaseForLua
end
function UI.deleteOtherPanel(strID)
  deleteOtherPanel(strID)
end
function UI.deleteOtherControl(panel, control)
  deleteOtherControl(panel, control)
end
function UI.isFlushedUI()
  return isFlushedUI()
end
function UI.ASSERT(test, message)
  message = message or tostring(test)
  if "string" ~= type(message) then
    message = tostring(message)
  end
  test = nil ~= test and false ~= test and 0 ~= test
  _PA_ASSERT(test, message)
end
function UI.Set_ProcessorInputMode(UIModeType)
end
function UI.ClearFocusEdit()
  ClearFocusEdit()
  CheckChattingInput()
end
function UI.isGameOptionMouseMode()
  return true == getOptionMouseMode()
end
function UI.Get_ProcessorInputMode()
  return getInputMode()
end
function setTextureUV_Func(control, pixX, pixY, pixEndX, pixEndY)
  local sizeX = control:getTextureWidth()
  local sizeY = control:getTextureHeight()
  if sizeX == 0 and sizeY == 0 then
    return 0, 0, 0, 0
  end
  return pixX / sizeX, pixY / sizeY, pixEndX / sizeX, pixEndY / sizeY
end
function UI.getFocusEdit()
  return GetFocusEdit()
end
function UI.isInPositionForLua(control, posX, posY)
  return isInPostion(control, posX, posY)
end
function UI.checkShowWindow()
  return check_ShowWindow()
end
function UI.checkIsInMouse(panel)
  local IsMouseOver = panel:GetPosX() < getMousePosX() and getMousePosX() < panel:GetPosX() + panel:GetSizeX() and panel:GetPosY() < getMousePosY() and getMousePosY() < panel:GetPosY() + panel:GetSizeY() and CppEnums.EProcessorInputMode.eProcessorInputMode_UiMode == UI.Get_ProcessorInputMode()
  return IsMouseOver and false == isCharacterCameraRotateMode()
end
function UI.checkIsInMouseAndEventPanel(panel)
  local isOverEvent = UI.checkIsInMouse(panel)
  local eventControl = getEventControl()
  if nil ~= eventControl then
    local parentPanel = eventControl:GetParentPanel()
    return parentPanel:GetKey() == panel:GetKey() and isOverEvent
  end
  return isOverEvent
end
function UI.checkResolution4KForXBox()
  if true == ToClient_isConsole() then
    local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
    if nil == gameOptionSetting then
      return false
    end
    local screenWidth = gameOptionSetting:getScreenResolutionWidth()
    local screenHeight = gameOptionSetting:getScreenResolutionHeight()
    if nil == screenWidth or nil == screenHeight then
      return false
    end
    if screenWidth >= 3840 or screenHeight >= 2160 then
      _PA_LOG("\234\180\145\236\154\180", "==== 4K \236\157\188\235\149\140\235\138\148 Ui Scale\234\176\146\236\157\128 \235\172\180\236\161\176\234\177\180 200% \235\161\156 \234\179\160\236\160\149 \237\149\156\235\139\164.")
      return true
    end
  end
  return false
end
local _tooltipControlRefTable = {}
function UI.setLimitTextAndAddTooltip(control, title, desc)
  if nil == control then
    return
  end
  if nil == control.IsLimitText or nil == control.SetTextMode then
    UI.ASSERT(nil ~= control.IsLimitText, "control does not contain key <IsLimitText>")
    return
  end
  control:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  control:SetText(control:GetText())
  if control:IsLimitText() then
    local key = #_tooltipControlRefTable + 1
    control:SetIgnore(false)
    _tooltipControlRefTable[key] = {}
    _tooltipControlRefTable[key].control = control
    _tooltipControlRefTable[key].title = title
    _tooltipControlRefTable[key].desc = desc
    control:addInputEvent("Mouse_On", "PaGlobalFunc_GlobalUtil_limitTextTooltip(" .. key .. ")")
    control:addInputEvent("Mouse_Out", "TooltipSimple_Hide()")
  end
end
function PaGlobalFunc_GlobalUtil_limitTextTooltip(key)
  if key > #_tooltipControlRefTable then
    return
  end
  local data = _tooltipControlRefTable[key]
  if nil == data.control then
    return
  end
  if not data.control:IsLimitText() then
    TooltipSimple_Hide()
    return
  end
  registTooltipControl(data.control, Panel_Tooltip_SimpleText)
  if nil == data.title then
    TooltipSimple_Show(data.control, data.control:GetText(), data.desc)
  else
    TooltipSimple_Show(data.control, data.title, data.desc)
  end
end
