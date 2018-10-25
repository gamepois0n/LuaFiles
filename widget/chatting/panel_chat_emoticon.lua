local _panel = Panel_Chat_Emoticon
local chatEmoticon = {
  _ui = {
    _staticText_SocialTitle = UI.getChildControl(_panel, "StaticText_SocialTitle"),
    _static_CenterBG = UI.getChildControl(_panel, "Static_CenterBG"),
    _button_WinClose = UI.getChildControl(_panel, "Button_WinClose"),
    _static_C_IconBG = UI.getChildControl(_panel, "Static_C_IconBG"),
    _static_C_EmoticonIcon = UI.getChildControl(_panel, "Static_C_EmoticonIcon"),
    _static_C_IconSelect = UI.getChildControl(_panel, "Static_C_IconSelect"),
    _static_EmoticonListBG = UI.getChildControl(_panel, "Static_EmoticonListBG"),
    _button_Apply = UI.getChildControl(_panel, "Button_Apply"),
    _button_Cancel = UI.getChildControl(_panel, "Button_Cancel")
  },
  _config = {_iconMaxCount = 14, _iconMaxRowCount = 7},
  _iconSlot = {},
  _iconFocus = {},
  _currentSetIndex = 0,
  _imoticonCount = 0
}
function FromClient_ChatEmoticon_luaLoadComplete()
  chatEmoticon:initialize()
end
function chatEmoticon:initialize()
  self:createControl()
  self:initControl()
  _panel:SetShow(false)
end
function chatEmoticon:createControl()
  local EmoticonSmall = UI.getChildControl(self._ui._static_EmoticonListBG, "Static_Emoticon_Small")
  local Focus = UI.getChildControl(self._ui._static_EmoticonListBG, "Static_Focus")
  EmoticonSmall:SetShow(false)
  Focus:SetShow(false)
  for index = 0, self._config._iconMaxCount - 1 do
    self._iconFocus[index] = UI.cloneControl(Focus, self._ui._static_EmoticonListBG, "FocusBG_" .. index)
    self._iconSlot[index] = UI.cloneControl(EmoticonSmall, self._ui._static_EmoticonListBG, "IconBG_" .. index)
    self._ui._static_EmoticonListBG:SetChildIndex(self._iconFocus[index], 0)
    self._ui._static_EmoticonListBG:SetChildIndex(self._iconSlot[index], 9999)
    self._iconSlot[index]:SetPosX(EmoticonSmall:GetPosX() + index % self._config._iconMaxRowCount * (Focus:GetSizeX() + 2))
    self._iconFocus[index]:SetPosX(Focus:GetPosX() + index % self._config._iconMaxRowCount * (Focus:GetSizeX() + 2))
    self._iconSlot[index]:SetPosY(EmoticonSmall:GetPosY() + math.floor(index / self._config._iconMaxRowCount) * Focus:GetSizeY())
    self._iconFocus[index]:SetPosY(Focus:GetPosY() + math.floor(index / self._config._iconMaxRowCount) * Focus:GetSizeY())
    self._iconFocus[index]:SetShow(true)
    self._iconSlot[index]:addInputEvent("Mouse_LUp", "EventHandler_ChatEmoticon_IconClick(" .. index .. ")")
  end
end
function chatEmoticon:initControl()
  self._ui._static_Emoticon_Sequence = UI.getChildControl(self._ui._static_CenterBG, "Static_Emoticon_Sequence")
  self._ui._staticText_EmoticonName = UI.getChildControl(self._ui._static_CenterBG, "StaticText_EmoticonName")
  self._ui._staticText_Command = UI.getChildControl(self._ui._static_CenterBG, "StaticText_Command")
  self._ui._staticText_Title = UI.getChildControl(self._ui._static_CenterBG, "StaticText_Title")
  self._ui._button_Cancel:addInputEvent("Mouse_LUp", "PaGlobalFunc_ChatEmoticon_Close()")
  self._ui._button_WinClose:addInputEvent("Mouse_LUp", "PaGlobalFunc_ChatEmoticon_Close()")
  self._ui._button_Apply:addInputEvent("Mouse_LUp", "EventHandler_ChatEmoticon_ApplyEmoticon()")
end
function chatEmoticon:resetData()
  self._currentSetIndex = -1
  self._ui._static_Emoticon_Sequence:SetShow(false)
  self._ui._staticText_EmoticonName:SetShow(false)
  self._ui._staticText_Command:SetShow(false)
  self._ui._staticText_Title:SetShow(false)
  self._imoticonCount = ToClient_getEmoticonInfoList()
  if self._imoticonCount > 0 then
    self._currentSetIndex = 0
    self:IconMouseClickEvent(self._currentSetIndex)
  end
end
function PaGlobalFunc_ChatEmoticon_Open()
  chatEmoticon:resetData()
  chatEmoticon:open()
  chatEmoticon:update()
end
function chatEmoticon:open()
  if false == _panel:GetShow() then
    _panel:SetShow(true)
  end
  PaGlobalFunc_ChatEmoticon_SetCheck(true)
end
function PaGlobalFunc_ChatEmoticon_Close()
  chatEmoticon:close()
end
function chatEmoticon:close()
  if true == _panel:GetShow() then
    _panel:SetShow(false)
  end
  PaGlobalFunc_ChatEmoticon_SetCheck(false)
end
function PaGlobalFunc_ChatEmoticon_GetShow()
  return _panel:GetShow()
end
function chatEmoticon:registerEvent()
  registerEvent("FromClient_luaLoadComplete", "FromClient_ChatEmoticon_luaLoadComplete")
end
function PaGlobalFunc_Emoticon_ShowToggle()
  if Panel_Chat_SocialMenu:GetShow() then
    Panel_Chat_SocialMenu:SetShow(false)
    FGlobal_SocialAction_SetCHK(false)
    TooltipSimple_Hide()
    PaGlobalFunc_ChatEmoticon_Open()
    return false
  elseif Panel_Chatting_Macro:IsShow() then
    Panel_Chatting_Macro:SetShow(false, false)
    PaGlobalFunc_ChatEmoticon_Open()
    return true
  elseif PaGlobalFunc_ChatEmoticon_GetShow() then
    PaGlobalFunc_ChatEmoticon_Close()
    return true
  else
    PaGlobalFunc_ChatEmoticon_Open()
  end
  return false
end
chatEmoticon:registerEvent()
function chatEmoticon:update()
  for index = 0, self._config._iconMaxCount - 1 do
    self._iconSlot[index]:SetShow(false)
    self._iconFocus[index]:SetShow(false)
  end
  self._imoticonCount = ToClient_getEmoticonInfoList()
  if 0 >= self._imoticonCount then
    self._imoticonCount = 0
    return
  end
  for index = 0, self._imoticonCount - 1 do
    local EmoticonSs = ToClient_getEmoticonInfoByIndex(index)
    local iconPath = EmoticonSs:getIconPath()
    if nil ~= iconPath then
      self._iconSlot[index]:SetShow(true)
      self._iconSlot[index]:ChangeTextureInfoNameAsync(iconPath)
    end
  end
  if nil == self._currentSetIndex or 0 > self._currentSetIndex then
    return
  end
  self._iconFocus[self._currentSetIndex]:SetShow(true)
end
function EventHandler_ChatEmoticon_IconClick(index)
  chatEmoticon:IconMouseClickEvent(index)
end
function chatEmoticon:IconMouseClickEvent(index)
  local EmoticonSs = ToClient_getEmoticonInfoByIndex(index)
  if nil == EmoticonSs then
    return
  end
  self._currentSetIndex = index
  self:update()
  self._ui._static_Emoticon_Sequence:ChangeTextureInfoNameAsync(EmoticonSs:getSequenceImagePath())
  self._ui._staticText_EmoticonName:SetText(EmoticonSs:getName())
  self._ui._staticText_Command:SetText("(" .. EmoticonSs:getKeyword() .. ")")
  self._ui._static_Emoticon_Sequence:SetShow(true)
  self._ui._staticText_EmoticonName:SetShow(true)
  self._ui._staticText_Command:SetShow(true)
  self._ui._staticText_Title:SetShow(true)
end
function EventHandler_ChatEmoticon_ApplyEmoticon()
  chatEmoticon:applyMouseClickEvent()
end
function chatEmoticon:applyMouseClickEvent()
  if self._currentSetIndex < 0 then
    return
  end
  local EmoticonSs = ToClient_getEmoticonInfoByIndex(self._currentSetIndex)
  if nil == EmoticonSs then
    return
  end
  local replaceText = "(" .. EmoticonSs:getKeyword() .. ")"
  ChatInput_addEmoticon(replaceText)
end
