local _panel = Panel_Widget_FloatingTooltip_Renew
local COMPONENT_TYPE = {
  HEADER = 1,
  WEIGHT_PRICE = 2,
  ENDURANCE = 3,
  KEY_GUIDE = 4
}
local FloatingTooltip = {
  _ui = {
    stc_components = {
      [COMPONENT_TYPE.HEADER] = UI.getChildControl(_panel, "HEADER"),
      [COMPONENT_TYPE.WEIGHT_PRICE] = UI.getChildControl(_panel, "WEIGHT_PRICE"),
      [COMPONENT_TYPE.ENDURANCE] = UI.getChildControl(_panel, "ENDURANCE"),
      [COMPONENT_TYPE.KEY_GUIDE] = UI.getChildControl(_panel, "StaticText_KeyGuideDetail")
    }
  },
  _defaultXGap = 8
}
local _currentYPos = 15
local _defaultWidth = 290
local _componentOption = {}
local _targetData = {
  [Defines.TooltipTargetType.Item] = {
    COMPONENT_TYPE.HEADER,
    COMPONENT_TYPE.WEIGHT_PRICE,
    COMPONENT_TYPE.ENDURANCE,
    COMPONENT_TYPE.KEY_GUIDE
  },
  [Defines.TooltipTargetType.ItemWithoutCompare] = {
    COMPONENT_TYPE.HEADER,
    COMPONENT_TYPE.WEIGHT_PRICE,
    COMPONENT_TYPE.ENDURANCE,
    COMPONENT_TYPE.KEY_GUIDE
  }
}
function FromClient_luaLoadComplete_FloatingTooltip_Init()
  FloatingTooltip:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_FloatingTooltip_Init")
function FloatingTooltip:initialize()
  _componentOption = {
    [COMPONENT_TYPE.HEADER] = {fillDataFunc = FloatingTooltip_updateHEADER},
    [COMPONENT_TYPE.WEIGHT_PRICE] = {fillDataFunc = FloatingTooltip_updateWEIGHT_PRICE},
    [COMPONENT_TYPE.ENDURANCE] = {fillDataFunc = FloatingTooltip_updateENDURANCE},
    [COMPONENT_TYPE.KEY_GUIDE] = {fillDataFunc = FloatingTooltip_updateKEY_GUIDE}
  }
  registerEvent("FromClient_PadSnapChangeTarget", "FromClient_FloatingTooltip_PadSnapChangeTarget")
end
function PaGlobalFunc_FloatingTooltip_Open(tooltipDataType, data, tooltipTargetType, targetControl)
  FloatingTooltip:open(tooltipDataType, data, tooltipTargetType, targetControl)
end
function FloatingTooltip:open(tooltipDataType, data, tooltipTargetType, targetControl)
  if nil == tooltipDataType or nil == data or nil == tooltipTargetType then
    self:close()
    return
  end
  local itemWrapper
  local itemSSW = data
  if Defines.TooltipDataType.ItemWrapper == tooltipDataType then
    itemWrapper = data
    itemSSW = itemWrapper:getStaticStatus()
  end
  _panel:SetShow(true)
  _currentYPos = 15
  self:compose(itemWrapper, itemSSW, tooltipTargetType)
  local defaultXPos = targetControl:GetParentPosX() + targetControl:GetSizeX() - _panel:GetSizeX()
  _panel:SetPosX(defaultXPos)
  if getScreenSizeY() < targetControl:GetParentPosY() + targetControl:GetSizeY() + _panel:GetSizeY() + self._defaultXGap then
    _panel:SetPosY(targetControl:GetParentPosY() + targetControl:GetSizeY() - _panel:GetSizeY())
    _panel:SetPosX(defaultXPos - targetControl:GetSizeX() - self._defaultXGap)
  else
    _panel:SetPosY(targetControl:GetParentPosY() + targetControl:GetSizeY() + self._defaultXGap)
  end
end
function FloatingTooltip:compose(itemWrapper, itemSSW, tooltipTargetType)
  for ii = 1, #self._ui.stc_components do
    self._ui.stc_components[ii]:SetShow(false)
  end
  for ii = 1, #_targetData[tooltipTargetType] do
    if nil ~= _targetData[tooltipTargetType][ii] then
      local componentIndex = _targetData[tooltipTargetType][ii]
      if nil ~= _componentOption[componentIndex] and nil ~= _componentOption[componentIndex].fillDataFunc then
        local updateFunc = _componentOption[componentIndex].fillDataFunc
        if nil ~= updateFunc and "function" == type(updateFunc) and true == updateFunc(itemWrapper, itemSSW) then
          self._ui.stc_components[ii]:SetShow(true)
          self._ui.stc_components[componentIndex]:SetPosY(_currentYPos)
          _currentYPos = _currentYPos + self._ui.stc_components[componentIndex]:GetSizeY() + 5
        end
      end
    end
  end
  _panel:SetSize(_panel:GetSizeX(), _currentYPos + 10)
end
function PaGlobalFunc_FloatingTooltip_Close()
  FloatingTooltip:close()
end
function FloatingTooltip:close()
  _panel:SetShow(false)
end
local colorTable = {
  [0] = Defines.Color.C_FFEEEEEE,
  [1] = Defines.Color.C_FF8DB245,
  [2] = Defines.Color.C_FF309BF5,
  [3] = Defines.Color.C_FFF0D147,
  [4] = Defines.Color.C_FFFF6244
}
local self = FloatingTooltip
function FloatingTooltip_updateHEADER(itemWrapper, itemSSW)
  local txt_name = UI.getChildControl(self._ui.stc_components[COMPONENT_TYPE.HEADER], "StaticText_ItemName")
  txt_name:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  local nameColorGrade = itemSSW:getGradeType()
  local fontColor = colorTable[0]
  if nil ~= colorTable[nameColorGrade] then
    fontColor = colorTable[nameColorGrade]
  end
  txt_name:SetFontColor(fontColor)
  txt_name:SetText(itemSSW:getName())
  self._ui.stc_components[COMPONENT_TYPE.HEADER]:SetSize(_defaultWidth, txt_name:GetTextSizeY())
  return true
end
function FloatingTooltip_updateWEIGHT_PRICE(itemWrapper, itemSSW)
  local enchantLevel = itemSSW:get()._key:getEnchantLevel()
  local isTradeItem = itemSSW:isTradeAble()
  local s64_originalPrice = itemSSW:get()._originalPrice_s64
  local s64_sellPrice = itemSSW:get()._sellPriceToNpc_s64
  local txt_price = UI.getChildControl(self._ui.stc_components[COMPONENT_TYPE.WEIGHT_PRICE], "StaticText_Price")
  if isTradeItem then
    if s64_originalPrice > Defines.s64_const.s64_0 and 0 == enchantLevel then
      txt_price:SetText(tostring(makeDotMoney(s64_originalPrice)))
      txt_price:SetFontColor(4292726146)
    else
      txt_price:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOT_SELLING_ITEM"))
      txt_price:SetFontColor(4290733156)
    end
  elseif s64_sellPrice > Defines.s64_const.s64_0 and 0 == enchantLevel then
    txt_price:SetText(tostring(makeDotMoney(s64_sellPrice)))
    txt_price:SetFontColor(4292726146)
  else
    txt_price:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOT_SELLING_ITEM"))
    txt_price:SetFontColor(4290733156)
  end
  local weightVal = itemSSW:get()._weight
  local txt_weight = UI.getChildControl(self._ui.stc_components[COMPONENT_TYPE.WEIGHT_PRICE], "StaticText_Weight")
  txt_weight:SetShow(true)
  local calcWeight = weightVal / 10000
  txt_weight:SetText(string.format("%.2f", calcWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  if itemSSW:get():isCash() then
    txt_weight:SetShow(false)
  end
  return true
end
function FloatingTooltip_updateKEY_GUIDE()
  return true
end
function FloatingTooltip_updateENDURANCE(itemWrapper, itemSSW)
  if nil == itemWrapper then
    return false
  end
  local progress_endurance = UI.getChildControl(self._ui.stc_components[COMPONENT_TYPE.ENDURANCE], "Progress2_Endurance")
  local progress_dynamicEndurance = UI.getChildControl(self._ui.stc_components[COMPONENT_TYPE.ENDURANCE], "Progress2_Dynamic")
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
  elseif 32767 ~= maxEndurance then
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
function FromClient_FloatingTooltip_PadSnapChangeTarget()
  self:close()
end
