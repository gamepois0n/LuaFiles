local expeditionCharacterSelectInfo = {
  _ui = {
    _button_close = UI.getChildControl(Panel_Subjugation_SelectCharacter, "Button_Win_Close"),
    _button_select = UI.getChildControl(Panel_Subjugation_SelectCharacter, "Button_Select"),
    _mainBG = UI.getChildControl(Panel_Subjugation_SelectCharacter, "Static_CharacterSelectBG")
  },
  _config = {_maxSlotCount = 9},
  _charListSlot = Array.new(),
  _selectIndex = nil,
  _selectCharacterIndex = nil
}
function expeditionCharacterSelectInfo:initialize()
  _PA_LOG("\235\176\149\234\183\156\235\130\152_\237\134\160\235\178\140", "\236\186\144\235\166\173\237\132\176 \236\132\160\237\131\157 \235\161\156\235\147\156 \236\153\132\235\163\140!!")
  ToClient_loadMyCharacterInfo()
  self:createControl()
  Panel_Subjugation_SelectCharacter:SetShow(false)
end
function expeditionCharacterSelectInfo:createControl()
  local baseBorder = UI.getChildControl(self._ui._mainBG, "Static_CharacterImageBorder")
  for ii = 0, self._config._maxSlotCount - 1 do
    local slot = {
      _parent = nil,
      _image = nil,
      _topText = nil,
      _bottomText = nil
    }
    local cloneBG = UI.cloneControl(baseBorder, Panel_Subjugation_SelectCharacter, "CharacterBG_" .. ii)
    cloneBG:SetPosX(ii % 3 * 108 + 22)
    cloneBG:SetPosY(math.floor(ii / 3) * 137 + 100)
    slot._parent = cloneBG
    local image = UI.getChildControl(cloneBG, "Static_Image")
    image:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionCharacterSelectInfo_Click(" .. ii .. ")")
    slot._image = image
    local bottomText = UI.getChildControl(cloneBG, "StaticText_BottomText")
    slot._bottomText = bottomText
    local topText = UI.getChildControl(cloneBG, "StaticText_TopText")
    slot._topText = topText
    self._charListSlot[ii] = slot
  end
  self._ui._button_close:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionCharacterSelectInfo_Close()")
  self._ui._button_select:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionCharacterSelectInfo_Select()")
  deleteControl(baseBorder)
  baseBorder = nil
end
function expeditionCharacterSelectInfo:loadImage()
  local charList = ToClient_getMyCharacterInfo()
  for ii = 0, self._config._maxSlotCount - 1 do
    local slot = self._charListSlot[ii]
    if ii <= #charList then
      local myCharData = charList[ii]
      local charType = myCharData:getClassType()
      local charName = myCharData:getCharacterName()
      local textureName = myCharData:getFaceTexture()
      local isCaptureExist = slot._image:ChangeTextureInfoNameNotDDS(textureName, charType, PaGlobal_getIsExitPhoto())
      if isCaptureExist == true then
        slot._image:getBaseTexture():setUV(0, 0, 1, 1)
      else
        _PA_LOG("\235\176\149\234\183\156\235\130\152_\237\134\160\235\178\140", "loadImage \234\176\128 \236\151\134\236\150\180!!!" .. ii)
      end
      slot._image:setRenderTexture(slot._image:getBaseTexture())
      slot._bottomText:SetText(string.format("Lv.%s %s", myCharData._level, charName))
      slot._topText:SetText(string.format("\235\170\168\237\151\152\235\170\133\236\132\177:%s", myCharData._totalStatValue))
      slot._parent:SetShow(true)
    else
      slot._parent:SetShow(false)
    end
  end
end
function expeditionCharacterSelectInfo:open()
  Panel_Subjugation_SelectCharacter:SetShow(true)
  self:loadImage()
end
function expeditionCharacterSelectInfo:close()
  self._selectIndex = nil
  Panel_Subjugation_SelectCharacter:SetShow(false)
end
function PaGlobalFunc_ExpeditionCharacterSelectInfo_Open(index)
  local self = expeditionCharacterSelectInfo
  self:open()
  self._selectIndex = index
end
function PaGlobalFunc_ExpeditionCharacterSelectInfo_Close()
  local self = expeditionCharacterSelectInfo
  self:close()
end
function PaGlobalFunc_ExpeditionCharacterSelectInfo_Select()
  if false == Panel_Subjugation_SelectCharacter:IsShow() then
    return
  end
  local self = expeditionCharacterSelectInfo
  if nil == self._selectCharacterIndex then
    return
  end
  local charList = ToClient_getMyCharacterInfo()
  _PA_LOG("\235\176\149\234\183\156\235\130\152_\237\134\160\235\178\140", "\236\186\144\235\166\173\237\132\176 \236\132\160\237\131\157" .. tostring(self._selectIndex) .. "/" .. tostring(charList) .. "/" .. tostring(charList[self._selectCharacterIndex]._characterNo))
  PaGlobalFunc_ExpeditionSettingInfo_SelectCharacterSet(self._selectIndex, charList[self._selectCharacterIndex]._characterNo)
  self:close()
end
function PaGlobalFunc_ExpeditionCharacterSelectInfo_Click(index)
  local self = expeditionCharacterSelectInfo
  local prevIndex = self._selectCharacterIndex
  if prevIndex ~= nil then
    self._charListSlot[prevIndex]._topText:SetFontColor(Defines.Color.C_FFC4BEBE)
    self._charListSlot[prevIndex]._bottomText:SetFontColor(Defines.Color.C_FFC4BEBE)
  end
  self._selectCharacterIndex = index
  self._charListSlot[index]._topText:SetFontColor(Defines.Color.C_FFFFEEA0)
  self._charListSlot[index]._bottomText:SetFontColor(Defines.Color.C_FFFFEEA0)
end
function FromClient_ExpeditionCharacterSelectInfo_Initialize()
  local self = expeditionCharacterSelectInfo
  self:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_ExpeditionCharacterSelectInfo_Initialize")
