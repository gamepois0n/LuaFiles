local expeditionInfo = {
  _initialize = false,
  _loadInfo = false,
  _ui = {
    _closeButton = UI.getChildControl(Panel_Window_Expedition, "Button_Win_Close"),
    _groupBG = {},
    _comboBoxCharacter = {},
    _comboBoxMercenary = {},
    _comboBoxRegion = {},
    _startButton = {}
  },
  _groupCnt = 3,
  _characterList = {},
  _mercenaryList = {},
  _regionList = {},
  _selectcharacter = {},
  _selectmercenary = {},
  _selectregion = {},
  _selectIndex = -1
}
for ii = 0, expeditionInfo._groupCnt - 1 do
  expeditionInfo._ui._groupBG[ii] = UI.getChildControl(Panel_Window_Expedition, "Static_Group_" .. tostring(ii + 1))
end
function expeditionInfo:initialize()
  self._initialize = true
  self:createControl()
  self:registerEvent()
end
function expeditionInfo:createControl()
  for ii = 0, self._groupCnt - 1 do
    self._ui._comboBoxCharacter[ii] = UI.getChildControl(self._ui._groupBG[ii], "ComboBox_Character")
    self._ui._comboBoxMercenary[ii] = UI.getChildControl(self._ui._groupBG[ii], "ComboBox_Mercenary")
    self._ui._comboBoxRegion[ii] = UI.getChildControl(self._ui._groupBG[ii], "ComboBox_Region")
    self._ui._startButton[ii] = UI.getChildControl(self._ui._groupBG[ii], "CheckButton_Go")
    self._selectcharacter[ii] = -1
    self._selectmercenary[ii] = -1
    self._selectregion[ii] = -1
  end
end
function expeditionInfo:open()
  Panel_Window_Expedition:SetShow(true)
  if false == self._loadInfo then
    ToClient_loadMyCharacterInfo()
    ToClient_getListExpeditionaryUnits()
    self._loadInfo = true
  end
end
function expeditionInfo:close()
  Panel_Window_Expedition:SetShow(false)
end
function expeditionInfo:update()
end
function expeditionInfo:perFrameUpdate()
end
function expeditionInfo:changePlatformSpecKey()
end
function FromClient_expeditionInfoInit()
  expeditionInfo:initialize()
  ToClient_sortExpeditionDropItemList()
end
function FromClient_receiveExpeditionItem(itemKey, count)
  local itemStaticWrapper = getItemEnchantStaticStatus(itemKey)
  if nil ~= itemStaticWrapper then
    local itemName = itemStaticWrapper:getName() .. " " .. tostring(count)
    Proc_ShowMessage_Ack("\236\149\132\236\157\180\237\133\156\236\157\132 \235\176\155\236\149\152\236\138\181\235\139\136\235\139\164. : " .. itemName)
  end
end
function FromClient_receiveExpeditionRegist()
  local self = expeditionInfo
  Proc_ShowMessage_Ack("\237\134\160\235\178\140\236\157\180 \236\160\149\236\131\129\236\160\129\236\156\188\235\161\156 \235\147\177\235\161\157\235\144\152\236\151\136\236\138\181\235\139\136\235\139\164.")
  if -1 ~= self._selectIndex then
    self._ui._startButton[self._selectIndex]:SetText("\236\183\168\236\134\140")
    self._ui._startButton[self._selectIndex]:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionCancel(" .. self._selectIndex .. ")")
  end
end
function FromClient_receiveExpeditionCancel()
  local self = expeditionInfo
  Proc_ShowMessage_Ack("\237\134\160\235\178\140\236\157\180 \236\160\149\236\131\129\236\160\129\236\156\188\235\161\156 \236\183\168\236\134\140\235\144\152\236\151\136\236\138\181\235\139\136\235\139\164.")
  if -1 ~= self._selectIndex then
    self._ui._startButton[self._selectIndex]:SetText("\235\179\180\235\130\180\234\184\176")
    self._ui._startButton[self._selectIndex]:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionStart(" .. self._selectIndex .. ")")
  end
end
function PaGlobalFunc_ExpeditionInfoClose()
  expeditionInfo:close()
end
function PaGlobalFunc_ExpeditionComboCharacter(index)
  local self = expeditionInfo
  self._ui._comboBoxCharacter[index]:DeleteAllItem()
  self._characterList = {}
  local characterCount = ToClient_getMyCharacterInfoCount()
  for ii = 0, characterCount - 1 do
    local myCharacter = ToClient_getMyCharacterInfo(ii)
    if nil ~= myCharacter then
      local className = getClassName(myCharacter:getClassType())
      local characterstring = className .. " " .. myCharacter:getCharacterName()
      self._characterList[ii] = characterstring
      self._ui._comboBoxCharacter[index]:AddItem(characterstring, ii)
    end
  end
  self._ui._comboBoxCharacter[index]:ToggleListbox()
end
function PaGlobalFunc_ExpeditionComboMercenary(index)
  local self = expeditionInfo
  self._ui._comboBoxMercenary[index]:DeleteAllItem()
  self._mercenaryList = {}
  local unitCount = ToClient_getMyExpeditionUnitInfoCount()
  for ii = 0, unitCount - 1 do
    local unitInfo = ToClient_getMyExpeditionUnitInfo(ii)
    if nil ~= unitInfo then
      self._mercenaryList[ii] = unitInfo:getUnitName()
      self._ui._comboBoxMercenary[index]:AddItem(unitInfo:getUnitName(), ii)
    end
  end
  self._ui._comboBoxMercenary[index]:ToggleListbox()
end
function PaGlobalFunc_ExpeditionComboRegion(index)
  local self = expeditionInfo
  self._ui._comboBoxRegion[index]:DeleteAllItem()
  self._regionList = {}
  local groupCount = ToClient_getExpeditionGroupCount()
  for ii = 0, groupCount - 1 do
    local groupName = ToClient_getExpeditionGroupName(ii)
    self._regionList[ii] = groupName
    self._ui._comboBoxRegion[index]:AddItem(groupName, ii)
  end
  self._ui._comboBoxRegion[index]:ToggleListbox()
end
function PaGlobalFunc_ExpeditionCharacterSet(index)
  local self = expeditionInfo
  local selectIndex = self._ui._comboBoxCharacter[index]:GetSelectIndex()
  if selectIndex < 0 then
    return
  end
  self._ui._comboBoxCharacter[index]:SetText(self._characterList[selectIndex])
  self._selectcharacter[index] = selectIndex
  self._ui._comboBoxCharacter[index]:ToggleListbox()
end
function PaGlobalFunc_ExpeditionMercenarySet(index)
  local self = expeditionInfo
  local selectIndex = self._ui._comboBoxMercenary[index]:GetSelectIndex()
  if selectIndex < 0 then
    return
  end
  self._ui._comboBoxMercenary[index]:SetText(self._mercenaryList[selectIndex])
  self._selectmercenary[index] = selectIndex
  self._ui._comboBoxMercenary[index]:ToggleListbox()
end
function PaGlobalFunc_ExpeditionRegionSet(index)
  local self = expeditionInfo
  local selectIndex = self._ui._comboBoxRegion[index]:GetSelectIndex()
  if selectIndex < 0 then
    return
  end
  self._ui._comboBoxRegion[index]:SetText(self._regionList[selectIndex])
  self._selectregion[index] = selectIndex
  self._ui._comboBoxRegion[index]:ToggleListbox()
end
function PaGlobalFunc_ExpeditionStart(index)
  local self = expeditionInfo
  if self._selectcharacter[index] == -1 or self._selectmercenary[index] == -1 or self._selectregion[index] == -1 then
    _PA_LOG("\235\172\180\236\160\149", "\236\132\184\237\140\133\235\144\152\236\167\128 \236\149\138\236\157\128 \234\176\146\236\157\180 \236\158\136\236\138\181\235\139\136\235\139\164." .. tostring(self._selectcharacter[index]) .. " " .. tostring(self._selectmercenary[index]) .. " " .. tostring(self._selectregion[index]))
    return
  end
  ToClient_requestExpedition(self._selectcharacter[index], self._selectmercenary[index], self._selectregion[index])
  self._selectIndex = index
end
function PaGlobalFunc_ExpeditionCancel(index)
  local self = expeditionInfo
  if self._selectcharacter[index] == -1 or self._selectmercenary[index] == -1 or self._selectregion[index] == -1 then
    _PA_LOG("\235\172\180\236\160\149", "\236\132\184\237\140\133\235\144\152\236\167\128 \236\149\138\236\157\128 \234\176\146\236\157\180 \236\158\136\236\138\181\235\139\136\235\139\164." .. tostring(self._selectcharacter[index]) .. " " .. tostring(self._selectmercenary[index]) .. " " .. tostring(self._selectregion[index]))
    return
  end
  ToClient_requestExpeditionCancel(self._selectcharacter[index], self._selectmercenary[index])
  self._selectIndex = index
end
function expeditionInfo:registerEvent()
  self._ui._closeButton:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionInfoClose()")
  for ii = 0, self._groupCnt - 1 do
    self._ui._comboBoxCharacter[ii]:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionComboCharacter(" .. ii .. ")")
    self._ui._comboBoxCharacter[ii]:GetListControl():addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionCharacterSet(" .. ii .. ")")
    self._ui._comboBoxMercenary[ii]:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionComboMercenary(" .. ii .. ")")
    self._ui._comboBoxMercenary[ii]:GetListControl():addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionMercenarySet(" .. ii .. ")")
    self._ui._comboBoxRegion[ii]:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionComboRegion(" .. ii .. ")")
    self._ui._comboBoxRegion[ii]:GetListControl():addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionRegionSet(" .. ii .. ")")
    self._ui._startButton[ii]:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionStart(" .. ii .. ")")
  end
end
function expeditionOpen()
  expeditionInfo:open()
end
function expeditionUnit(key, grade)
  ToClient_registExpeditionUnit(key, grade)
end
function expeditionReceive(index, count)
  ToClient_ReciveExpeditionResultItem(index, count)
end
function expeditionFillEnergy(unitNo, energy)
  ToClient_requestExpeditionFillEnergy(unitNo, energy)
end
registerEvent("FromClient_luaLoadComplete", "FromClient_expeditionInfoInit")
registerEvent("FromClient_receiveExpeditionItem", "FromClient_receiveExpeditionItem")
registerEvent("FromClient_receiveExpeditionRegist", "FromClient_receiveExpeditionRegist")
registerEvent("FromClient_receiveExpeditionCancel", "FromClient_receiveExpeditionCancel")
