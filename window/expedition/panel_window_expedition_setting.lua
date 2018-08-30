local expeditionSettingInfo = {
  _ui = {
    _button_close = UI.getChildControl(Panel_ArmyUnitSetting, "Button_Win_Close"),
    _button_save = UI.getChildControl(Panel_ArmyUnitSetting, "Button_Save"),
    _button_allReceive = UI.getChildControl(Panel_ArmyUnitSetting, "Button_AllReceive"),
    _button_selectReceive = UI.getChildControl(Panel_ArmyUnitSetting, "Button_SelectReceive"),
    _button_unit = UI.getChildControl(Panel_ArmyUnitSetting, "RadioButton_Unit"),
    _button_item = UI.getChildControl(Panel_ArmyUnitSetting, "RadioButton_Item"),
    _text_time = UI.getChildControl(Panel_ArmyUnitSetting, "StaticText_Time"),
    _baseBG = UI.getChildControl(Panel_ArmyUnitSetting, "Static_LeftBG")
  },
  _config = {
    _posX = 20,
    _posY = 80,
    _bgMaxCount = 3,
    _rewardItemMaxCount = 48
  },
  _slotConfig = {
    createIcon = true,
    createBorder = true,
    createEnchant = true,
    createCount = true
  },
  _settingBG = Array.new(),
  _selectInfo = {
    [0] = {
      _characterNo = nil,
      _unitNo = nil,
      _groupKey = nil
    },
    [1] = {
      _characterNo = nil,
      _unitNo = nil,
      _groupKey = nil
    },
    [2] = {
      _characterNo = nil,
      _unitNo = nil,
      _groupKey = nil
    }
  },
  _initialize = false,
  _rewardItemSlot = Array.new(),
  _selectItemEnchantKeyList = Array.new()
}
function expeditionSettingInfo:selectInfoClear()
  for ii = 0, self._config._bgMaxCount - 1 do
    local info = _selectInfo[ii]
    info._characterNo = nil
    info._unitNo = nil
    info._groupKey = nil
  end
end
function expeditionSettingInfo:initialize()
  if false == self._initialize then
    self:createControl()
    self:registEventHandler()
    self:selectInfoClear()
  end
  Panel_ArmyUnitSetting:SetShow(false)
  self._initialize = true
end
function expeditionSettingInfo:registEventHandler()
  self._ui._button_close:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_Close()")
  self._ui._button_save:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_Save()")
  self._ui._button_unit:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_ClickRadioButton(0)")
  self._ui._button_item:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_ClickRadioButton(1)")
  self._ui._button_selectReceive:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_ReceiveItem(false)")
  self._ui._button_allReceive:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionSettingInfo_ReceiveItem(true)")
end
function expeditionSettingInfo:createControl()
  self._ui._text_time:SetText("\237\134\160\235\178\140 \234\176\128\235\138\165 \236\139\156\234\176\132 ??\236\139\156\234\176\132 ??\235\182\132")
  for ii = 0, self._config._bgMaxCount - 1 do
    local settingBG = {
      _parent = nil,
      _mainBG = nil,
      _itemBG = nil,
      _areaDesc = nil,
      _image = nil,
      _imageInfo = nil
    }
    local cloneBG = UI.cloneControl(self._ui._baseBG, Panel_ArmyUnitSetting, "SettingBG_" .. ii)
    settingBG._parent = cloneBG
    cloneBG:SetPosX(self._config._posX + ii * 351)
    cloneBG:SetPosY(self._config._posY)
    local defaultBG = UI.getChildControl(cloneBG, "Static_DefaultBG")
    local mainBG = UI.getChildControl(cloneBG, "Static_SelectMainBG")
    settingBG._mainBG = mainBG
    local subTitle = UI.getChildControl(defaultBG, "StaticText_SubTitle")
    subTitle:SetText(tostring(ii + 1) .. "\235\178\136 \235\182\128\235\140\128 \236\132\164\236\160\149")
    local button_areaSelect = UI.getChildControl(mainBG, "Button_SelectArea")
    button_areaSelect:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionAreaSelectInfo_Open(" .. ii .. ")")
    local unitSelect = UI.getChildControl(mainBG, "Static_MercenaryList")
    local button_change = UI.getChildControl(unitSelect, "Button_Change")
    button_change:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionUnitSelectInfo_Open(" .. ii .. ")")
    local text_desc = UI.getChildControl(mainBG, "StaticText_AreaDesc")
    text_desc:SetText("")
    settingBG._areaDesc = text_desc
    local imageBorder = UI.getChildControl(mainBG, "Static_TemPleate_CharacterImageBorder")
    local image = UI.getChildControl(imageBorder, "Static_Image")
    image:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionCharacterSelectInfo_Open(" .. ii .. ")")
    settingBG._image = image
    local imageInfo = UI.getChildControl(imageBorder, "StaticText_Info")
    settingBG._imageInfo = imageInfo
    local itemBG = UI.getChildControl(cloneBG, "Static_ItemBg")
    settingBG._itemBG = itemBG
    local baseSlotBg = UI.getChildControl(itemBG, "Static_ItemSlotBG")
    local baseSelectSlotBg = UI.getChildControl(baseSlotBg, "Static_SelectSlot")
    self._rewardItemSlot[ii] = Array.new()
    for jj = 0, self._config._rewardItemMaxCount - 1 do
      local slot = {
        background = nil,
        select = nil,
        icon = nil,
        itemEnchantKey = nil
      }
      slot.background = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, itemBG, "RewardItemBG_" .. jj)
      CopyBaseProperty(baseSlotBg, slot.background)
      slot.background:SetPosX(20 + jj % 6 * 55)
      slot.background:SetPosY(35 + math.floor(jj / 6) * 55)
      slot.background:SetShow(true)
      SlotItem.new(slot, "RewardItemIcon_" .. jj, jj, slot.background, self._slotConfig)
      slot:createChild()
      slot.icon:SetPosX(0)
      slot.icon:SetPosY(0)
      slot.icon:SetShow(true)
      slot.icon:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionCharacterSelectInfo_SelectRewardItem(" .. ii .. "," .. jj .. ")")
      slot.select = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, slot.background, "SelectItemBG_" .. jj)
      CopyBaseProperty(baseSelectSlotBg, slot.select)
      slot.select:SetPosX(0)
      slot.select:SetPosY(0)
      slot.select:SetShow(false)
      slot.select:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionCharacterSelectInfo_SelectRewardItem(" .. ii .. "," .. jj .. ")")
      self._rewardItemSlot[ii][jj] = slot
    end
    deleteControl(baseSlotBg)
    deleteControl(baseSelectSlotBg)
    self._settingBG[ii] = settingBG
  end
  deleteControl(self._ui._baseBG)
  self._ui._baseBG = nil
end
function expeditionSettingInfo:open()
  self:refreshItemList()
  PaGlobalFunc_ExpeditionSettingInfo_ClickRadioButton(0)
  for ii = 0, self._config._bgMaxCount - 1 do
    local expeditionInfo = ToClient_getExpeditionInfo(ii)
    if nil ~= expeditionInfo then
      PaGlobalFunc_ExpeditionSettingInfo_SelectCharacterSet(ii, expeditionInfo._characterNo)
      PaGlobalFunc_ExpeditionSettingInfo_SelectUnitSet(ii, expeditionInfo._unitNo)
      PaGlobalFunc_ExpeditionSettingInfo_SelectAreaSet(ii, expeditionInfo._groupKey)
    end
  end
  Panel_ArmyUnitSetting:SetShow(true)
end
function expeditionSettingInfo:close()
  Panel_ArmyUnitSetting:SetShow(false)
end
function expeditionSettingInfo:isRepetition()
  for ii = 0, self._config._bgMaxCount - 1 do
    for jj = ii + 1, self._config._bgMaxCount - 1 do
      local info1 = self._selectInfo[ii]
      local info2 = self._selectInfo[jj]
      if nil ~= info1._characterNo and nil ~= info1._unitNo and info1._groupKey and nil ~= info2._characterNo and nil ~= info2._unitNo and info2._groupKey then
        if info1._characterNo == info2._characterNo then
          return 1
        elseif info1._unitNo == info2._unitNo then
          return 2
        elseif info1._groupKey == info2._groupKey then
          return 3
        end
      end
    end
  end
  return 0
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
  local self = expeditionSettingInfo
  local rv = self:isRepetition()
  if 0 ~= rv then
    local errMsg = ""
    if rv == 1 then
      errMsg = "\236\186\144\235\166\173\237\132\176"
    elseif rv == 2 then
      errMsg = "\236\156\160\235\139\155"
    else
      errMsg = "\236\167\128\236\151\173"
    end
    Proc_ShowMessage_Ack(string.format("%s \236\164\145\235\179\181 \236\132\160\237\131\157", errMsg))
    return
  end
  for ii = 0, self._config._bgMaxCount - 1 do
    local info = self._selectInfo[ii]
    if nil ~= info._characterNo and nil ~= info._unitNo and info._groupKey then
      ToClient_requestExpeditionSet(info._characterNo, info._unitNo, info._groupKey, ii)
    end
  end
end
function PaGlobalFunc_ExpeditionSettingInfo_ClickRadioButton(radioButtonType)
  local self = expeditionSettingInfo
  for ii = 0, self._config._bgMaxCount - 1 do
    if 0 == radioButtonType then
      self._settingBG[ii]._mainBG:SetShow(true)
      self._settingBG[ii]._itemBG:SetShow(false)
      self._ui._button_save:SetShow(true)
      self._ui._button_selectReceive:SetShow(false)
      self._ui._button_allReceive:SetShow(false)
    else
      self._settingBG[ii]._mainBG:SetShow(false)
      self._settingBG[ii]._itemBG:SetShow(true)
      self._ui._button_save:SetShow(false)
      self._ui._button_selectReceive:SetShow(true)
      self._ui._button_allReceive:SetShow(true)
    end
  end
end
function PaGlobalFunc_ExpeditionSettingInfo_SelectUnitSet(index, unitNo)
  local myUnit = ToClient_getMyExpeditionUnitInfo(unitNo)
  if nil == myUnit then
    return
  end
  local self = expeditionSettingInfo
  local mainBG = self._settingBG[index]._mainBG
  local content = UI.getChildControl(mainBG, "Static_MercenaryList")
  local textStatus = UI.getChildControl(content, "StaticText_Top_Status")
  local expValue = UI.getChildControl(content, "StaticText_ExpValue")
  local guageBar = UI.getChildControl(content, "Progress2_ExpGauge")
  local unitInfoBG = UI.getChildControl(content, "StaticText_SlotIconBG")
  local textLevel = UI.getChildControl(unitInfoBG, "StaticText_GradeEdge")
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
  self._selectInfo[index]._unitNo = myUnit._expeditionUnitNo
end
function PaGlobalFunc_ExpeditionSettingInfo_SelectAreaSet(index, groupKey)
  local regionWrapper = ToClient_getExpeditionRegionWrapper(groupKey)
  if nil == regionWrapper then
    return
  end
  local self = expeditionSettingInfo
  local desc = string.format("\236\132\160\237\131\157 \236\167\128\236\151\173:%s\n\234\182\140\236\158\165 \235\170\168\237\151\152\234\176\128 \235\170\133\236\132\177:%s", regionWrapper:getGroupName(), regionWrapper:getRecommendCombatPoint())
  self._settingBG[index]._areaDesc:SetText(desc)
  self._selectInfo[index]._groupKey = groupKey
end
function PaGlobalFunc_ExpeditionSettingInfo_GetMyCharacterData(characterNo)
  local charList = ToClient_getMyCharacterInfo()
  for ii = 0, #charList do
    if characterNo == charList[ii]._characterNo then
      return charList[ii]
    end
  end
  return nil
end
function PaGlobalFunc_ExpeditionSettingInfo_SelectCharacterSet(index, characterNo)
  local myCharData = PaGlobalFunc_ExpeditionSettingInfo_GetMyCharacterData(characterNo)
  if nil == myCharData then
    return
  end
  local self = expeditionSettingInfo
  local settingBG = self._settingBG[index]
  local mainBG = settingBG._mainBG
  local travelValue = UI.getChildControl(mainBG, "StaticText_TravelNumber")
  local image = settingBG._image
  local charType = myCharData:getClassType()
  local charName = myCharData:getCharacterName()
  local textureName = myCharData:getFaceTexture()
  local isCaptureExist = image:ChangeTextureInfoNameNotDDS(textureName, charType, PaGlobal_getIsExitPhoto())
  if isCaptureExist == true then
    image:getBaseTexture():setUV(0, 0, 1, 1)
  else
  end
  image:setRenderTexture(image:getBaseTexture())
  travelValue:SetText(string.format("\235\170\168\237\151\152 \235\170\133\236\132\177 %s", myCharData._totalStatValue))
  settingBG._imageInfo:SetText(string.format("Lv.%s %s", myCharData._level, charName))
  self._selectInfo[index]._characterNo = myCharData._characterNo
end
function FromClient_ExpeditionSettingInfo_Initialize()
  local self = expeditionSettingInfo
  self:initialize()
end
function PaGlobalFunc_ExpeditionCharacterSelectInfo_SelectRewardItem(index, slotIndex)
  local self = expeditionSettingInfo
  local rewardSlot = self._rewardItemSlot[index][slotIndex]
  if true == rewardSlot.select:GetShow() then
    rewardSlot.select:SetShow(false)
    self._selectItemEnchantKeyList[slotIndex] = nil
  else
    rewardSlot.select:SetShow(true)
    self._selectItemEnchantKeyList[slotIndex] = rewardSlot.itemEnchantKey
  end
end
function PaGlobalFunc_ExpeditionSettingInfo_ReceiveItem(isAll)
  _PA_LOG("\235\176\149\234\183\156\235\130\152_\237\134\160\235\178\140", "\236\132\160\237\131\157\235\176\155\234\184\176 \235\136\140\235\160\164 \236\161\140\235\139\164...")
  local self = expeditionSettingInfo
  if true == isAll then
    for ii = 0, self._config._rewardItemMaxCount - 1 do
      local itemEnchantKey = self._rewardItemSlot[0][ii].itemEnchantKey
      if nil ~= itemEnchantKey then
        ToClient_ReceiveExpeditionRewardItem(itemEnchantKey)
      end
    end
  else
    for ii = 0, self._config._rewardItemMaxCount - 1 do
      local itemEnchantKey = self._selectItemEnchantKeyList[ii]
      if nil ~= itemEnchantKey then
        _PA_LOG("\235\176\149\234\183\156\235\130\152_\237\134\160\235\178\140", "\236\132\160\237\131\157\235\176\155\234\184\176" .. ii .. "/" .. tostring(itemEnchantKey))
        ToClient_ReceiveExpeditionRewardItem(itemEnchantKey)
      end
    end
  end
end
function expeditionSettingInfo:refreshItemList()
  local itemKeyList = ToClient_ExpeditionRewardItemKeyList()
  if nil == itemKeyList then
    for ii = 0, self._config._rewardItemMaxCount - 1 do
      local rewardSlot = self._rewardItemSlot[0][ii]
      rewardSlot:clearItem()
      rewardSlot.itemEnchantKey = nil
      rewardSlot.select:SetShow(false)
    end
  else
    for ii = 0, self._config._rewardItemMaxCount - 1 do
      local rewardSlot = self._rewardItemSlot[0][ii]
      rewardSlot.select:SetShow(false)
      if ii <= #itemKeyList then
        local itemKey = itemKeyList[ii]
        local itemSSW = getItemEnchantStaticStatus(itemKey)
        local itemCount = ToClient_ExpeditionRewardItemCount(itemKey)
        rewardSlot:setItemByStaticStatus(itemSSW, itemCount)
        rewardSlot.itemEnchantKey = itemKey
      else
        rewardSlot:clearItem()
        rewardSlot.itemEnchantKey = nil
      end
    end
  end
end
function FromClient_refreshExpeditionItemList()
  local self = expeditionSettingInfo
  self:initialize()
  self:refreshItemList()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_ExpeditionSettingInfo_Initialize")
registerEvent("FromClient_refreshExpeditionItemList", "FromClient_refreshExpeditionItemList")
