local _panel = Panel_Widget_Tooltip_Renew
local TooltipInfo = {
  _ui = {
    stc_BG = {
      [1] = UI.getChildControl(_panel, "Static_BG_1"),
      [2] = UI.getChildControl(_panel, "Static_BG_2")
    },
    txt_equipped = {},
    stc_components = {},
    slot_itemIcon = {},
    stc_socketBG = {},
    stc_socketIcon = {},
    txt_mainAttr = {}
  },
  _poolCount = 2,
  _compareItemWrapper = nil
}
local _currentPool = 1
local _currentYPos = 80
local _defaultYPos = 80
local _defaultGapBetweenComponent = 5
local _defaultSizeX = 400
local _leftAlignDefaultX = 60
local _rightAlignDefaultX = 200
local _currentComponentIsInFrame = false
local _currentComponentIsLeftAlign = false
local _baseRightCompareLeft = true
local _equippedItemTooltip = false
local _componentOption = {}
local COMPONENT_TYPE = {
  HEADER = 1,
  CRYSTAL = 2,
  MAIN_ATTR = 3,
  SUB_ATTR = 4,
  ENCHANT_TYPE = 5,
  DESCRIPTION = 6,
  DYEING_INFO = 7,
  EQUIP_SLOT = 8,
  ITEM_MARKET_INFO = 9,
  ENDURANCE = 10,
  WEIGHT_PRICE = 11,
  TIME_LIMIT = 12,
  PRODUCTION_REGION = 13,
  LINE_SPLIT = 14,
  TRADE_PRICE = 15
}
local SPLIT = -1
local _slotBGUV = {
  {
    143,
    195,
    187,
    239
  },
  {
    278,
    195,
    322,
    239
  }
}
local _targetData = {
  [Defines.TooltipTargetType.Item] = {
    COMPONENT_TYPE.HEADER,
    COMPONENT_TYPE.CRYSTAL,
    COMPONENT_TYPE.MAIN_ATTR,
    SPLIT,
    COMPONENT_TYPE.LINE_SPLIT,
    SPLIT,
    COMPONENT_TYPE.SUB_ATTR,
    SPLIT,
    COMPONENT_TYPE.ENCHANT_TYPE,
    COMPONENT_TYPE.TIME_LIMIT,
    COMPONENT_TYPE.PRODUCTION_REGION,
    COMPONENT_TYPE.DESCRIPTION,
    COMPONENT_TYPE.DYEING_INFO,
    COMPONENT_TYPE.ITEM_MARKET_INFO,
    COMPONENT_TYPE.TRADE_PRICE,
    COMPONENT_TYPE.ENDURANCE,
    COMPONENT_TYPE.WEIGHT_PRICE
  },
  [Defines.TooltipTargetType.ItemWithoutCompare] = {
    COMPONENT_TYPE.HEADER,
    COMPONENT_TYPE.CRYSTAL,
    COMPONENT_TYPE.MAIN_ATTR,
    SPLIT,
    COMPONENT_TYPE.LINE_SPLIT,
    SPLIT,
    COMPONENT_TYPE.SUB_ATTR,
    SPLIT,
    COMPONENT_TYPE.ENCHANT_TYPE,
    COMPONENT_TYPE.TIME_LIMIT,
    COMPONENT_TYPE.PRODUCTION_REGION,
    COMPONENT_TYPE.DESCRIPTION,
    COMPONENT_TYPE.DYEING_INFO,
    COMPONENT_TYPE.ITEM_MARKET_INFO,
    COMPONENT_TYPE.TRADE_PRICE,
    COMPONENT_TYPE.ENDURANCE,
    COMPONENT_TYPE.WEIGHT_PRICE
  }
}
local _config = {
  createIcon = true,
  createBorder = true,
  createCount = false,
  createCash = true,
  createEnchant = true,
  createEnduranceIcon = true
}
local socketMaxCount = 0
function FromClient_luaLoadComplete_TooltipInfo_Init()
  TooltipInfo:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_TooltipInfo_Init")
function TooltipInfo:initialize()
  _componentOption = {
    [COMPONENT_TYPE.HEADER] = {fillDataFunc = TooltipInfo_updateHEADER},
    [COMPONENT_TYPE.CRYSTAL] = {fillDataFunc = TooltipInfo_updateCRYSTAL},
    [COMPONENT_TYPE.MAIN_ATTR] = {fillDataFunc = TooltipInfo_updateMAIN_ATTR},
    [COMPONENT_TYPE.SUB_ATTR] = {fillDataFunc = TooltipInfo_updateSUB_ATTR},
    [COMPONENT_TYPE.ENCHANT_TYPE] = {fillDataFunc = TooltipInfo_updateENCHANT_TYPE},
    [COMPONENT_TYPE.DESCRIPTION] = {fillDataFunc = TooltipInfo_updateDESCRIPTION},
    [COMPONENT_TYPE.DYEING_INFO] = {fillDataFunc = TooltipInfo_updateDYEING_INFO},
    [COMPONENT_TYPE.TIME_LIMIT] = {fillDataFunc = TooltipInfo_updateTIME_LIMIT},
    [COMPONENT_TYPE.ITEM_MARKET_INFO] = {fillDataFunc = TooltipInfo_updateITEM_MARKET_INFO},
    [COMPONENT_TYPE.ENDURANCE] = {
      fillDataFunc = TooltipInfo_updateENDURANCE,
      bottomAlign = true,
      cornerAlign = true
    },
    [COMPONENT_TYPE.WEIGHT_PRICE] = {
      fillDataFunc = TooltipInfo_updateWEIGHT_PRICE,
      bottomAlign = true,
      cornerAlign = true
    },
    [COMPONENT_TYPE.LINE_SPLIT] = {fillDataFunc = TooltipInfo_updateLINE_SPLIT},
    [COMPONENT_TYPE.PRODUCTION_REGION] = {fillDataFunc = TooltipInfo_updatePRODUCTION_REGION},
    [COMPONENT_TYPE.TRADE_PRICE] = {fillDataFunc = TooltipInfo_updateTRADE_PRICE}
  }
  self._ui.stc_components = {
    [1] = {
      [COMPONENT_TYPE.HEADER] = UI.getChildControl(self._ui.stc_BG[1], "HEADER"),
      [COMPONENT_TYPE.CRYSTAL] = UI.getChildControl(self._ui.stc_BG[1], "CRYSTAL"),
      [COMPONENT_TYPE.MAIN_ATTR] = UI.getChildControl(self._ui.stc_BG[1], "MAIN_ATTR"),
      [COMPONENT_TYPE.SUB_ATTR] = UI.getChildControl(self._ui.stc_BG[1], "SUB_ATTR"),
      [COMPONENT_TYPE.ENCHANT_TYPE] = UI.getChildControl(self._ui.stc_BG[1], "ENCHANT_TYPE"),
      [COMPONENT_TYPE.DESCRIPTION] = UI.getChildControl(self._ui.stc_BG[1], "DESCRIPTION"),
      [COMPONENT_TYPE.DYEING_INFO] = UI.getChildControl(self._ui.stc_BG[1], "DYEING_INFO"),
      [COMPONENT_TYPE.EQUIP_SLOT] = UI.getChildControl(self._ui.stc_BG[1], "EQUIP_SLOT"),
      [COMPONENT_TYPE.ITEM_MARKET_INFO] = UI.getChildControl(self._ui.stc_BG[1], "ITEM_MARKET_INFO"),
      [COMPONENT_TYPE.ENDURANCE] = UI.getChildControl(self._ui.stc_BG[1], "ENDURANCE"),
      [COMPONENT_TYPE.WEIGHT_PRICE] = UI.getChildControl(self._ui.stc_BG[1], "WEIGHT_PRICE"),
      [COMPONENT_TYPE.TIME_LIMIT] = UI.getChildControl(self._ui.stc_BG[1], "TIME_LIMIT"),
      [COMPONENT_TYPE.LINE_SPLIT] = UI.getChildControl(self._ui.stc_BG[1], "LINE_SPLIT"),
      [COMPONENT_TYPE.PRODUCTION_REGION] = UI.getChildControl(self._ui.stc_BG[1], "PRODUCTION_REGION"),
      [COMPONENT_TYPE.TRADE_PRICE] = UI.getChildControl(self._ui.stc_BG[1], "TRADE_PRICE")
    }
  }
  socketMaxCount = ToClient_GetMaxItemSocketCount()
  self._ui.txt_equipped[1] = UI.getChildControl(self._ui.stc_BG[1], "StaticText_Equipped")
  for ii = 2, self._poolCount do
    self._ui.stc_components[ii] = {}
    for jj = 1, #self._ui.stc_components[1] do
      self._ui.stc_components[ii][jj] = UI.cloneControl(self._ui.stc_components[1][jj], self._ui.stc_BG[ii], self._ui.stc_components[1][jj]:GetID() .. "_" .. ii .. "_" .. jj)
      self._ui.stc_components[ii][jj]:SetShow(false)
      self._ui.txt_equipped[ii] = UI.createAndCopyBasePropertyControl(self._ui.stc_BG[1], "StaticText_Equipped", self._ui.stc_BG[ii], "StaticText_Equipped_" .. ii)
    end
  end
  self._ui.txt_equipped[2]:SetPosX(_rightAlignDefaultX)
  for ii = 1, self._poolCount do
    self._ui.stc_BG[ii]:SetShow(false)
    self:initPool(ii)
  end
  self:registEventHandler()
end
function TooltipInfo:initPool(poolIndex)
  local slotBG = UI.getChildControl(self._ui.stc_components[poolIndex][COMPONENT_TYPE.HEADER], "Static_Icon")
  self._ui.slot_itemIcon[poolIndex] = {}
  local slot = self._ui.slot_itemIcon[poolIndex]
  SlotItem.new(slot, "Slot_ItemIcon", 1, slotBG, _config)
  slot:createChild()
  slot.icon:SetPosX(1)
  slot.icon:SetPosY(1)
  self._ui.stc_socketBG[poolIndex] = {}
  self._ui.stc_socketIcon[poolIndex] = {}
  for ii = 1, socketMaxCount do
    self._ui.stc_socketBG[poolIndex][ii] = UI.getChildControl(self._ui.stc_components[poolIndex][COMPONENT_TYPE.CRYSTAL], "Static_CrystalSlotBg_" .. ii)
    if nil ~= self._ui.stc_socketBG[poolIndex][ii] then
      self._ui.stc_socketIcon[poolIndex][ii] = UI.getChildControl(self._ui.stc_socketBG[poolIndex][ii], "Static_SocketIcon")
    end
  end
  self._ui.txt_mainAttr[poolIndex] = {
    [1] = UI.getChildControl(self._ui.stc_components[poolIndex][COMPONENT_TYPE.MAIN_ATTR], "StaticText_AttackPoint"),
    [2] = UI.getChildControl(self._ui.stc_components[poolIndex][COMPONENT_TYPE.MAIN_ATTR], "StaticText_DefencePoint")
  }
end
function TooltipInfo:registEventHandler()
  registerEvent("FromClient_PadSnapChangeTarget", "FromClient_TooltipInfo_PadSnapChangeTarget")
end
function PaGlobalFunc_TooltipInfo_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_TooltipInfo_Open(tooltipDataType, data, tooltipTargetType, targetX, compareX)
  TooltipInfo:open(tooltipDataType, data, tooltipTargetType, targetX, compareX)
end
function TooltipInfo:open(tooltipDataType, data, tooltipTargetType, targetX, compareX)
  if nil == tooltipDataType or nil == data or nil == tooltipTargetType then
    self:close()
    return
  end
  _currentYPos = 80
  _panel:SetShow(true)
  local itemWrapper
  local itemSSW = data
  if Defines.TooltipDataType.ItemWrapper == tooltipDataType then
    itemWrapper = data
    itemSSW = itemWrapper:getStaticStatus()
  end
  local itemType = itemSSW:getItemType()
  self._compareItemWrapper = nil
  for ii = 1, #self._ui.stc_BG do
    self._ui.stc_BG[ii]:SetShow(false)
  end
  _baseRightCompareLeft = true
  if nil == targetX or 0 == targetX then
    _baseRightCompareLeft = false
    targetX = 0
  end
  if CppEnums.ItemType.Equip ~= itemType or Defines.TooltipTargetType.ItemWithoutCompare == tooltipTargetType or true == itemSSW:isVehicleItem() then
  else
    local equipSlotNo = itemSSW:getEquipSlotNo()
    local equipItemWrapper = ToClient_getEquipmentItem(equipSlotNo)
    if nil ~= equipItemWrapper then
      local equipItemSSW = equipItemWrapper:getStaticStatus()
      self._compareItemWrapper = equipItemWrapper
      _currentComponentIsLeftAlign = true == _baseRightCompareLeft
      _equippedItemTooltip = true
      local xPos = 0
      if nil ~= compareX then
        xPos = compareX
      end
      self:compose(equipItemWrapper, equipItemSSW, tooltipTargetType, xPos)
      PaGlobalFunc_MainStatusInfo_Close()
      PaGlobalFunc_ChattingViewer_Off()
    end
  end
  _currentYPos = _defaultYPos
  _currentComponentIsLeftAlign = false == _baseRightCompareLeft
  _equippedItemTooltip = false
  self:compose(itemWrapper, itemSSW, tooltipTargetType, targetX)
end
function TooltipInfo:compose(itemWrapper, itemSSW, tooltipTargetType, targetX)
  if true == _currentComponentIsLeftAlign then
    _currentPool = 1
    self._ui.stc_BG[_currentPool]:SetPosX(targetX)
  else
    _currentPool = 2
    self._ui.stc_BG[_currentPool]:SetPosX(targetX - self._ui.stc_BG[_currentPool]:GetSizeX())
  end
  self._ui.stc_BG[_currentPool]:SetShow(true)
  for ii = 1, #self._ui.stc_components[_currentPool] do
    self._ui.stc_components[_currentPool][ii]:SetShow(false)
  end
  for ii = 1, #_targetData[tooltipTargetType] do
    if nil ~= _targetData[tooltipTargetType][ii] then
      local componentIndex = _targetData[tooltipTargetType][ii]
      if SPLIT == componentIndex then
        _currentYPos = _currentYPos + 10
      else
        local updateFunc = _componentOption[componentIndex].fillDataFunc
        if nil ~= updateFunc and "function" == type(updateFunc) then
          local componentHaveValidData = updateFunc(itemWrapper, itemSSW, tooltipTargetType)
          if true == componentHaveValidData then
            self._ui.stc_components[_currentPool][componentIndex]:SetShow(true)
            if not _componentOption[componentIndex].bottomAlign then
              self._ui.stc_components[_currentPool][componentIndex]:SetPosY(_currentYPos)
              _currentYPos = _currentYPos + self._ui.stc_components[_currentPool][componentIndex]:GetSizeY() + _defaultGapBetweenComponent
            end
            if _componentOption[componentIndex].cornerAlign then
              if _currentComponentIsLeftAlign then
                self._ui.stc_components[_currentPool][componentIndex]:SetHorizonLeft()
              else
                self._ui.stc_components[_currentPool][componentIndex]:SetHorizonRight()
              end
              self._ui.stc_components[_currentPool][componentIndex]:ComputePos()
            else
              local xPos = _rightAlignDefaultX
              if _currentComponentIsLeftAlign then
                xPos = _leftAlignDefaultX
              end
              self._ui.stc_components[_currentPool][componentIndex]:SetPosX(xPos)
            end
          end
        else
          _PA_LOG("\235\176\149\235\178\148\236\164\128", "fillDataFunc is nil at ii : " .. ii)
        end
      end
    end
  end
  self._ui.txt_equipped[_currentPool]:SetShow(_equippedItemTooltip)
end
function PaGlobalFunc_TooltipInfo_Close()
  TooltipInfo:close()
end
function TooltipInfo:close()
  _panel:SetShow(false)
  PaGlobalFunc_MainStatusInfo_Open()
  if false == PaGlobal_TutorialManager:isDoingTutorial() then
    PaGlobalFunc_ChattingViewer_On()
  end
  self._compareItemWrapper = nil
end
local colorTable = {
  [0] = Defines.Color.C_FFEEEEEE,
  [1] = Defines.Color.C_FF8DB245,
  [2] = Defines.Color.C_FF309BF5,
  [3] = Defines.Color.C_FFF0D147,
  [4] = Defines.Color.C_FFFF6244
}
local self = TooltipInfo
function TooltipInfo_updateHEADER(itemWrapper, itemSSW, tooltipTargetType)
  local slotBG = UI.getChildControl(self._ui.stc_components[_currentPool][COMPONENT_TYPE.HEADER], "Static_Icon")
  local txt_name = UI.getChildControl(self._ui.stc_components[_currentPool][COMPONENT_TYPE.HEADER], "StaticText_ItemName")
  local uv = _slotBGUV[2]
  if _equippedItemTooltip then
    uv = _slotBGUV[1]
  end
  slotBG:ChangeTextureInfoName("renewal/frame/console_frame_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(slotBG, uv[1], uv[2], uv[3], uv[4])
  slotBG:getBaseTexture():setUV(x1, y1, x2, y2)
  slotBG:setRenderTexture(slotBG:getBaseTexture())
  txt_name:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  local nameColorGrade = itemSSW:getGradeType()
  local fontColor = colorTable[0]
  if nil ~= colorTable[nameColorGrade] then
    fontColor = colorTable[nameColorGrade]
  end
  txt_name:SetFontColor(fontColor)
  txt_name:SetText(itemSSW:getName())
  self._ui.slot_itemIcon[_currentPool]:setItemByStaticStatus(itemSSW)
  return true
end
function TooltipInfo_updateCRYSTAL(itemWrapper, itemSSW, tooltipTargetType)
  local socketMaxCount = ToClient_GetMaxItemSocketCount()
  local slotCount = 0
  if false == itemSSW:get():getEnchant():empty() then
    slotCount = itemSSW:get():getEnchant()._socketCount
  end
  for ii = 1, socketMaxCount do
    if ii <= slotCount then
      self._ui.stc_socketBG[_currentPool][ii]:SetShow(true)
      if nil ~= itemWrapper then
        local crystalESSW = itemWrapper:getPushedItem(ii - 1)
        if nil ~= crystalESSW then
          self._ui.stc_socketIcon[_currentPool][ii]:SetShow(true)
          self._ui.stc_socketIcon[_currentPool][ii]:ChangeTextureInfoName("icon/" .. crystalESSW:getIconPath())
          local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_socketIcon[_currentPool][ii], 0, 0, 42, 42)
          self._ui.stc_socketIcon[_currentPool][ii]:getBaseTexture():setUV(x1, y1, x2, y2)
          self._ui.stc_socketIcon[_currentPool][ii]:setRenderTexture(self._ui.stc_socketIcon[_currentPool][ii]:getBaseTexture())
        else
          self._ui.stc_socketIcon[_currentPool][ii]:SetShow(false)
        end
      end
    else
      self._ui.stc_socketBG[_currentPool][ii]:SetShow(false)
    end
  end
  return true
end
function TooltipInfo_updateMAIN_ATTR(itemWrapper, itemSSW, tooltipTargetType)
  self._ui.txt_mainAttr[_currentPool][1]:SetShow(false)
  self._ui.txt_mainAttr[_currentPool][2]:SetShow(false)
  local itemaddedDD = 0
  local itemaddedDV = 0
  local itemaddedPV = 0
  if nil ~= itemWrapper then
    itemaddedDD = itemWrapper:getAddedDD()
    itemaddedDV = itemWrapper:getAddedDV()
    itemaddedPV = itemWrapper:getAddedPV()
  end
  local lowestAttackVal = 0
  local highestAttackVal = 0
  for ii = 0, 2 do
    local currentMin = itemSSW:getMinDamage(ii)
    lowestAttackVal = math.max(lowestAttackVal, currentMin)
    local currentMax = itemSSW:getMaxDamage(ii)
    highestAttackVal = math.max(highestAttackVal, currentMax)
  end
  if 1 == itemSSW:getItemType() and 36 == itemSSW:getEquipType() then
    lowestAttackVal = itemSSW:getMinDamage(0)
    highestAttackVal = itemSSW:getMaxDamage(0)
  end
  lowestAttackVal = lowestAttackVal + itemaddedDD
  highestAttackVal = highestAttackVal + itemaddedDD
  local componentHaveValidData = false
  if 0 ~= lowestAttackVal or 0 ~= highestAttackVal then
    componentHaveValidData = true
    self._ui.txt_mainAttr[_currentPool][1]:SetShow(true)
    local attackString = tostring(lowestAttackVal) .. " ~ " .. tostring(highestAttackVal)
    self._ui.txt_mainAttr[_currentPool][1]:SetText(attackString)
  end
  local defValue = 0
  for idx = 0, 2 do
    local currentdef_value = itemSSW:getDefence(idx) + itemaddedDV + itemaddedPV
    defValue = math.max(defValue, currentdef_value)
  end
  if 0 ~= defValue then
    componentHaveValidData = true
    self._ui.txt_mainAttr[_currentPool][2]:SetShow(true)
    self._ui.txt_mainAttr[_currentPool][2]:SetText(tostring(defValue))
    if self._ui.txt_mainAttr[_currentPool][1]:GetShow() then
      self._ui.txt_mainAttr[_currentPool][2]:SetPosX(180)
    else
      self._ui.txt_mainAttr[_currentPool][2]:SetPosX(0)
    end
  end
  return componentHaveValidData
end
function TooltipInfo_updateSUB_ATTR(itemWrapper, itemSSW, tooltipTargetType)
  local contentString = ""
  local hit = 0
  local hitShow = false
  for idx = 0, 2 do
    local currentHit = itemSSW:ToClient_getHit(idx)
    hit = math.max(hit, currentHit)
  end
  if nil ~= itemWrapper then
    hit = hit + itemWrapper:getAddedHIT()
  end
  if 1 == itemSSW:getItemType() and 36 == itemSSW:getEquipType() then
    hit = itemSSW:ToClient_getHit(0)
  end
  if 0 ~= hit then
    contentString = PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_ITEM_TXT_HIT") .. " " .. tostring(hit)
  end
  local dv = 0
  local hdv = 0
  local dvShow = false
  for idx = 0, 2 do
    local currnetDv = itemSSW:ToClient_getDV(idx)
    dv = math.max(dv, currnetDv)
    local currentHDV = itemSSW:ToClient_getHDV(idx)
    hdv = math.max(hdv, currentHDV)
  end
  local itemaddedHDV = 0
  if nil ~= itemWrapper then
    dv = dv + itemWrapper:getAddedDV()
    itemaddedHDV = itemWrapper:getCronHDV()
  end
  if dv + hdv + itemaddedHDV > 0 then
    if contentString ~= "" then
      contentString = contentString .. "\n"
    end
    contentString = contentString .. PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_ITEMEQUIP_TXT_DV") .. " " .. tostring(dv) .. " (+" .. tostring(hdv + itemaddedHDV) .. ")"
  end
  local pv = 0
  local hpv = 0
  for idx = 0, 2 do
    local currentPv = itemSSW:ToClient_getPV(idx)
    if pv < currentPv then
      pv = currentPv
    end
    local currentHPv = itemSSW:ToClient_getHPV(idx)
    if hpv < currentHPv then
      hpv = currentHPv
    end
  end
  local itemaddedHPV = 0
  if nil ~= itemWrapper then
    local itemaddedPV = itemWrapper:getAddedPV()
    pv = pv + itemaddedPV
    itemaddedHPV = itemWrapper:getCronHPV()
  end
  if pv + hpv + itemaddedHPV > 0 then
    if contentString ~= "" then
      contentString = contentString .. "\n"
    end
    contentString = contentString .. PAGetString(Defines.StringSheet_RESOURCE, "TOOLTIP_ITEM_TXT_PV") .. " " .. tostring(pv) .. " (+" .. tostring(hpv + itemaddedHPV) .. ")"
  end
  local txt = UI.getChildControl(self._ui.stc_components[_currentPool][COMPONENT_TYPE.SUB_ATTR], "StaticText_Content")
  local componentIsShow = false
  if "" ~= contentString then
    txt:SetShow(true)
    txt:SetText(contentString)
    componentIsShow = true
    self._ui.stc_components[_currentPool][COMPONENT_TYPE.SUB_ATTR]:SetSize(_defaultSizeX, txt:GetTextSizeY())
  else
    txt:SetShow(false)
  end
  return componentIsShow
end
function TooltipInfo_updateENCHANT_TYPE(itemWrapper, itemSSW, tooltipTargetType)
  local componentIsShow = false
  local isPossibleToEnchant = itemSSW:get():isEnchantable()
  local content = UI.getChildControl(self._ui.stc_components[_currentPool][COMPONENT_TYPE.ENCHANT_TYPE], "StaticText_Content")
  if true == isPossibleToEnchant then
    local enchantDifficulty = itemSSW:get():getEnchantDifficulty()
    if enchantDifficulty > 0 then
      if 1 == enchantDifficulty then
        componentIsShow = true
        content:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ENCHANTDIFFICULTY_EASY"))
      elseif 2 == enchantDifficulty then
        componentIsShow = true
        content:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ENCHANTDIFFICULTY_NORMAL"))
      elseif 3 == enchantDifficulty then
        componentIsShow = true
        content:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ENCHANTDIFFICULTY_HARD"))
      end
    end
  elseif itemSSW:isEquipable() then
    componentIsShow = true
    content:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOT_ENCHANT"))
  end
  return componentIsShow
end
function TooltipInfo_updateDESCRIPTION(itemWrapper, itemSSW, tooltipTargetType)
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_DESC_TITLE") .. " " .. itemSSW:getDescription()
  local item_type = itemSSW:getItemType()
  if item_type == 2 and true == itemSSW:get():isForJustTrade() then
    desc = desc .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_DESC_TRADEITEM")
  end
  if "" ~= itemSSW:getEnchantDescription() then
    desc = desc .. [[


- ]] .. itemSSW:getEnchantDescription()
  end
  local content = UI.getChildControl(self._ui.stc_components[_currentPool][COMPONENT_TYPE.DESCRIPTION], "StaticText_Content")
  content:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  content:SetText(desc)
  self._ui.stc_components[_currentPool][COMPONENT_TYPE.DESCRIPTION]:SetSize(_defaultSizeX, content:GetTextSizeY())
  return "" ~= desc
end
function TooltipInfo_updateDYEING_INFO(itemWrapper, itemSSW, tooltipTargetType)
end
function TooltipInfo_updateTIME_LIMIT(itemWrapper, itemSSW, tooltipTargetType)
  if nil == itemWrapper then
    return false
  end
  local item = itemWrapper:get()
  if nil == item or item:getExpirationDate():isIndefinite() then
    return false
  end
  local txt = UI.getChildControl(self._ui.stc_components[_currentPool][COMPONENT_TYPE.TIME_LIMIT], "StaticText_Content")
  local s64_remainingTime = getLeftSecond_s64(item:getExpirationDate())
  local fontColor = Defines.Color.C_FFEEEEEE
  local itemExpiration = item:getExpirationDate()
  local leftPeriod = FromClient_getTradeItemExpirationDate(itemExpiration, itemWrapper:getStaticStatus():get()._expirationPeriod)
  local frontStr = ""
  if not itemSSW:get():isCash() and itemSSW:isTradeAble() then
    frontStr = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_REMAINTIME_PRICEREMAIN")
  else
    frontStr = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_REMAINTIME_REMAINTIME")
  end
  local backStr = ""
  if Defines.s64_const.s64_0 == s64_remainingTime then
    if not itemSSW:get():isCash() and itemSSW:isTradeAble() then
      backStr = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_REMAIN_TIME") .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_MARKETPRICE") .. " : " .. leftPeriod / 10000 .. " %)"
    else
      backStr = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_REMAIN_TIME")
    end
    fontColor = Defines.Color.C_FFBA2737
  elseif not itemSSW:get():isCash() and itemSSW:isTradeAble() then
    backStr = convertStringFromDatetime(s64_remainingTime) .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_MARKETPRICE") .. " : " .. leftPeriod / 10000 .. " %)"
  else
    backStr = convertStringFromDatetime(s64_remainingTime)
  end
  txt:SetText(frontStr .. "\n" .. backStr)
  self._ui.stc_components[_currentPool][COMPONENT_TYPE.TIME_LIMIT]:SetSize(_defaultSizeX, txt:GetTextSizeY())
  txt:SetFontColor(fontColor)
  txt:SetShow(true)
  return true
end
function TooltipInfo_updateITEM_MARKET_INFO(itemWrapper, itemSSW, tooltipTargetType)
end
function TooltipInfo_updateENDURANCE(itemWrapper, itemSSW, tooltipTargetType)
  local component = self._ui.stc_components[_currentPool][COMPONENT_TYPE.ENDURANCE]
  local stc_bg = UI.getChildControl(component, "Static_EnduranceProgressBg")
  local progress_endurance = UI.getChildControl(stc_bg, "Progress2_Endurance")
  local progress_dynamicEndurance = UI.getChildControl(stc_bg, "Progress2_Dynamic")
  local txt_enduranceValue = UI.getChildControl(stc_bg, "StaticText_EnduranceValue")
  local maxEndurance = 32767
  local dynamicMaxEndurance = 32767
  if false == itemSSW:get():isUnbreakable() then
    maxEndurance = itemSSW:get():getMaxEndurance()
  end
  local currentEndurance = maxEndurance
  if nil ~= itemWrapper then
    dynamicMaxEndurance = itemWrapper:get():getMaxEndurance()
    currentEndurance = itemWrapper:get():getEndurance()
  end
  local calcEndurance = currentEndurance / maxEndurance
  local calcDynamicEndurance = dynamicMaxEndurance / maxEndurance
  progress_endurance:SetCurrentProgressRate(calcEndurance * 100)
  progress_endurance:SetProgressRate(calcEndurance * 100)
  progress_endurance:SetAniSpeed(0)
  progress_dynamicEndurance:SetCurrentProgressRate(calcDynamicEndurance * 100)
  progress_dynamicEndurance:SetProgressRate(calcDynamicEndurance * 100)
  progress_dynamicEndurance:SetAniSpeed(0)
  if 32767 ~= dynamicMaxEndurance then
    txt_enduranceValue:SetText(currentEndurance .. " / " .. dynamicMaxEndurance .. "  [" .. maxEndurance .. "]")
  elseif 32767 ~= maxEndurance then
    txt_enduranceValue:SetText(currentEndurance .. " / " .. maxEndurance)
  else
    return false
  end
  local check_fishingRod = function(itemKey)
    if 17591 == itemKey or 17592 == itemKey or 17596 == itemKey or 17612 == itemKey or 17613 == itemKey or 17669 == itemKey then
      return true
    else
      return false
    end
  end
  local isCash = itemSSW:get():isCash()
  if true == isCash and false == check_fishingRod(itemSSW:get()._key:getItemKey()) then
    return false
  end
  return true
end
function TooltipInfo_updateWEIGHT_PRICE(itemWrapper, itemSSW, tooltipTargetType)
  local component = self._ui.stc_components[_currentPool][COMPONENT_TYPE.WEIGHT_PRICE]
  local enchantLevel = itemSSW:get()._key:getEnchantLevel()
  local isTradeItem = itemSSW:isTradeAble()
  local s64_originalPrice = itemSSW:get()._originalPrice_s64
  local s64_sellPrice = itemSSW:get()._sellPriceToNpc_s64
  local txt_price = UI.getChildControl(component, "StaticText_Price")
  if isTradeItem then
    if s64_originalPrice > Defines.s64_const.s64_0 and 0 == enchantLevel then
      local text = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_TradeMarketGraph_OriginalPrice", "OriginalPrice", makeDotMoney(s64_originalPrice))
      txt_price:SetText(text)
      txt_price:SetFontColor(4292726146)
    else
      txt_price:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOT_SELLING_ITEM"))
      txt_price:SetFontColor(4290733156)
    end
  elseif s64_sellPrice > Defines.s64_const.s64_0 and 0 == enchantLevel then
    txt_price:SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_TOOLTIP_ITEM_SELLPRICE") .. " " .. makeDotMoney(s64_sellPrice))
    txt_price:SetFontColor(4292726146)
  else
    txt_price:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOT_SELLING_ITEM"))
    txt_price:SetFontColor(4290733156)
  end
  txt_price:SetPosX(_defaultSizeX - txt_price:GetTextSizeX() - txt_price:GetTextSpan().x)
  local weightVal = itemSSW:get()._weight
  local txt_weight = UI.getChildControl(component, "StaticText_Weight")
  txt_weight:SetShow(true)
  local calcWeight = weightVal / 10000
  txt_weight:SetText(string.format("%.2f", calcWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  txt_weight:SetPosX(txt_price:GetPosX() - txt_weight:GetTextSizeX() - txt_weight:GetTextSpan().x - 15)
  if itemSSW:get():isCash() then
    txt_weight:SetShow(false)
  end
  return true
end
function TooltipInfo_updatePRODUCTION_REGION(itemWrapper, itemSSW, tooltipTargetType)
  local component = self._ui.stc_components[_currentPool][COMPONENT_TYPE.PRODUCTION_REGION]
  local txt = UI.getChildControl(component, "StaticText_Content")
  txt:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  if true == itemSSW:get():isForJustTrade() and nil ~= itemWrapper then
    local nodeLevel = ToClient_GetNodeLevel(itemWrapper:getProductionRegionKey())
    if nodeLevel >= 1 then
      txt:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_PRODUCT_PLACE") .. " : " .. itemWrapper:getProductionRegion() .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_LINK") .. ")")
    else
      txt:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_PRODUCT_PLACE") .. " : " .. itemWrapper:getProductionRegion() .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOLINK") .. ")")
    end
  else
    return false
  end
  component:SetSize(_defaultSizeX, txt:GetTextSizeY())
  return true
end
function TooltipInfo_updateTRADE_PRICE(itemWrapper, itemSSW, tooltipTargetType)
  local component = self._ui.stc_components[_currentPool][COMPONENT_TYPE.TRADE_PRICE]
  local txt = UI.getChildControl(component, "StaticText_Content")
  local isTradeItem = itemSSW:isTradeAble()
  if true == isTradeItem and nil ~= itemWrapper then
    local item = itemWrapper:get()
    local text = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TRADE_BUY_PRICE")
    if nil ~= item then
      if item:getBuyingPrice_s64() > Defines.s64_const.s64_0 then
        text = text .. " : <PAColor0xFFEEEEEE>" .. PAGetString(Defines.StringSheet_GAME, "LUA_AUCTION_GOLDTEXT") .. " " .. makeDotMoney(item:getBuyingPrice_s64()) .. "<PAOldColor>"
      else
        text = text .. " : <PAColor0xFFBA2737>" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOTHING") .. "<PAOldColor>"
      end
      txt:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
      txt:SetText(text)
    end
  else
    return false
  end
  component:SetSize(_defaultSizeX, txt:GetTextSizeY())
  return true
end
function TooltipInfo_updateLINE_SPLIT()
  local component = self._ui.stc_components[_currentPool][COMPONENT_TYPE.LINE_SPLIT]
  local stc_left = UI.getChildControl(component, "Static_Left")
  local stc_right = UI.getChildControl(component, "Static_Right")
  if _currentComponentIsLeftAlign then
    stc_left:SetShow(true)
    stc_right:SetShow(false)
  else
    stc_left:SetShow(false)
    stc_right:SetShow(true)
  end
  return true
end
function FromClient_TooltipInfo_PadSnapChangeTarget(fromControl, toControl)
  TooltipInfo:close()
end
