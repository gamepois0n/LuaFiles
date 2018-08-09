local expeditionSettingInfo = {
  _ui = {
    _button_close = UI.getChildControl(Panel_ArmyUnitSetting, "Button_Win_Close"),
    _button_save = UI.getChildControl(Panel_ArmyUnitSetting, "Button_Save"),
    _text_time = UI.getChildControl(Panel_ArmyUnitSetting, "StaticText_Time"),
    _baseBG = UI.getChildControl(Panel_ArmyUnitSetting, "Static_LeftBG")
  },
  _config = {
    _posX = 20,
    _posY = 80,
    _bgMaxCount = 3
  },
  _settingBG = Array.new()
}
function expeditionSettingInfo:initialize()
  ToClient_loadMyCharacterInfo()
  ToClient_getListExpeditionaryUnits()
  self:createControl()
  self:registEventHandler()
  Panel_ArmyUnitSetting:SetShow(false)
end
function expeditionSettingInfo:registEventHandler()
  self._ui._button_close:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_Close()")
  self._ui._button_save:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_Save()")
end
function expeditionSettingInfo:createControl()
  self._ui._text_time:SetText("\237\134\160\235\178\140 \234\176\128\235\138\165 \236\139\156\234\176\132 ??\236\139\156\234\176\132 ??\235\182\132")
  local myCharacterList = ToClient_getMyCharacterInfo()
  for ii = 0, self._config._bgMaxCount - 1 do
    local settingBG = {
      _cloneBG = nil,
      _mainBG = nil,
      _selectCharacter = nil
    }
    local cloneBG = UI.cloneControl(self._ui._baseBG, Panel_ArmyUnitSetting, "SettingBG_" .. ii)
    settingBG._cloneBG = cloneBG
    cloneBG:SetPosX(self._config._posX + ii * 351)
    cloneBG:SetPosY(self._config._posY)
    local defaultBG = UI.getChildControl(cloneBG, "Static_DefaultBG")
    local mainBG = UI.getChildControl(cloneBG, "Static_SelectMainBG")
    settingBG._mainBG = mainBG
    local subTitle = UI.getChildControl(defaultBG, "StaticText_SubTitle")
    subTitle:SetText(tostring(ii + 1) .. "\235\178\136 \235\182\128\235\140\128 \236\132\164\236\160\149")
    local button_areaSelect = UI.getChildControl(mainBG, "Button_SelectArea")
    button_areaSelect:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionAreaSelectInfo_Open(" .. ii .. ")")
    local button_unitSelect = UI.getChildControl(mainBG, "Static_MercenaryList")
    button_unitSelect:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionUnitSelectInfo_Open(" .. ii .. ")")
    local comboBox_characterSelect = UI.getChildControl(mainBG, "Combobox_SelectCharacter")
    for jj = 0, #myCharacterList do
      local myCharacter = myCharacterList[jj]
      if nil ~= myCharacter then
        local className = getClassName(myCharacter:getClassType())
        local characterName = myCharacter:getCharacterName()
        local boxTitle = string.format("[%s] %s", className, characterName)
        comboBox_characterSelect:AddItem(boxTitle, jj)
      end
    end
    _PA_LOG("\235\176\149\234\183\156\235\130\152_\237\134\160\235\178\140", "clone \234\176\175\236\136\152" .. tostring(cloneBG:GetChildSize()))
    comboBox_characterSelect:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_SelectCharacter(" .. ii .. ")")
    comboBox_characterSelect:GetListControl():addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_SelectCharacterSet(" .. ii .. ")")
    settingBG._selectCharacter = comboBox_characterSelect
    self._settingBG[ii] = settingBG
  end
  deleteControl(self._ui._baseBG)
  self._ui._baseBG = nil
end
function expeditionSettingInfo:open()
  Panel_ArmyUnitSetting:SetShow(true)
end
function expeditionSettingInfo:close()
  Panel_ArmyUnitSetting:SetShow(false)
end
function PaGlobalFunc_ExpeditionSettingInfo_Open()
  local self = expeditionSettingInfo
  self:open()
end
function PaGlobalFunc_ExpeditionSettingInfo_Close()
  local self = expeditionSettingInfo
  self:close()
  PaGlobalFunc_ExpeditionRewardItemInfo_Close()
  PaGlobalFunc_ExpeditionUnitSelectInfo_Close()
  PaGlobalFunc_ExpeditionAreaSelectInfo_Close()
end
function PaGlobalFunc_ExpeditionSettingInfo_Save()
end
function PaGlobalFunc_ExpeditionSettingInfo_SelectCharacter(index)
  local self = expeditionSettingInfo
  self._settingBG[index]._selectCharacter:ToggleListbox()
end
function PaGlobalFunc_ExpeditionSettingInfo_SelectCharacterSet(index)
  local self = expeditionSettingInfo
  local selectText = self._settingBG[index]._selectCharacter:GetTextFromSelectItem()
  self._settingBG[index]._selectCharacter:SetText(selectText)
end
function PaGlobalFunc_ExpeditionSettingInfo_SelectUnitSet(index, unitNo)
  local self = expeditionSettingInfo
  local mainBG = self._settingBG[index]._mainBG
  local content = UI.getChildControl(mainBG, "Static_MercenaryList")
  local textStatus = UI.getChildControl(content, "StaticText_Top_Status")
  local expValue = UI.getChildControl(content, "StaticText_ExpValue")
  local guageBar = UI.getChildControl(content, "Progress2_ExpGauge")
  local unitInfoBG = UI.getChildControl(content, "StaticText_SlotIconBG")
  local textLevel = UI.getChildControl(unitInfoBG, "StaticText_GradeEdge")
  local myUnit = ToClient_getMyExpeditionUnitInfo(unitNo)
  if nil ~= myUnit then
    local atkPoint = myUnit:getAttackPoint()
    local level = myUnit._level
    local curExp = myUnit._experience
    local maxExp = myUnit:getMaxExperience()
    local curEnergyPoint = myUnit._energyPoint
    local unitName = myUnit:getUnitName()
    textLevel:SetText("Lv." .. tostring(level))
    local expRate = curExp / maxExp * 100
    expValue:SetText(tostring(expRate) .. "%")
    guageBar:SetProgressRate(expRate)
    textStatus:SetText(string.format("[%s] atk:%s/Energy:%s", unitName, atkPoint, curEnergyPoint))
  end
end
function PaGlobalFunc_ExpeditionSettingInfo_SelectAreaSet(index, groupKey)
  local self = expeditionSettingInfo
  local regionWrapper = ToClient_getExpeditionRegionWrapper(groupKey)
  if nil == regionWrapper then
    return
  end
  local dropItemList = regionWrapper:getDropItemList()
  if nil == dropItemList then
    return
  end
  _PA_LOG("\235\176\149\234\183\156\235\130\152_\237\134\160\235\178\140", "\236\167\128\236\151\173\236\133\139\237\140\133" .. tostring(#dropItemList))
end
function FromClient_ExpeditionSettingInfo_Initialize()
  local self = expeditionSettingInfo
  self:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_ExpeditionSettingInfo_Initialize")
