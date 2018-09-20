local expeditionUnitSelectInfo = {
  _ui = {
    _button_close = UI.getChildControl(Panel_Subjugation_SelectArmyUnit, "Button_Win_Close"),
    _bg_select = UI.getChildControl(Panel_Subjugation_SelectArmyUnit, "Static_ArmySelectListBG"),
    _list2_myUnitList = nil
  },
  _selectIndex = nil,
  _selectUnitNo = nil,
  _isSell = false
}
function expeditionUnitSelectInfo:initialize()
  ToClient_getListExpeditionaryUnits()
  self:registEventHandler()
  Panel_Subjugation_SelectArmyUnit:SetShow(false)
end
function expeditionUnitSelectInfo:registEventHandler()
  self._ui._button_close:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionUnitSelectInfo_Close()")
  self._ui._list2_myUnitList = UI.getChildControl(self._ui._bg_select, "List2_SubNode")
  self._ui._list2_myUnitList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_ExpeditionUnitSelectInfo_CreateControlList2")
  self._ui._list2_myUnitList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
end
function expeditionUnitSelectInfo:open(isSell)
  local unitList = ToClient_getMyExpeditionUnitList()
  self._isSell = isSell
  if nil ~= unitList then
    _PA_LOG("\235\176\149\234\183\156\235\130\152_\237\134\160\235\178\140", "\236\156\160\235\139\155\234\176\175\236\136\152" .. tostring(#unitList))
    self._ui._list2_myUnitList:getElementManager():clearKey()
    for ii = 0, #unitList do
      self._ui._list2_myUnitList:getElementManager():pushKey(unitList[ii]._expeditionUnitNo)
    end
  else
    _PA_LOG("\235\176\149\234\183\156\235\130\152_\237\134\160\235\178\140", "\235\147\177\235\161\157\235\144\156 \236\156\160\235\139\155\236\157\180 \236\151\134\236\138\181\235\139\136\235\139\164.")
  end
  Panel_Subjugation_SelectArmyUnit:SetShow(true)
end
function expeditionUnitSelectInfo:close()
  self._selectIndex = nil
  self._selectUnitNo = nil
  Panel_Subjugation_SelectArmyUnit:SetShow(false)
  Panel_NumberPad_Close()
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_Open(index, isSell)
  local self = expeditionUnitSelectInfo
  self:open(isSell)
  self._selectIndex = index
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_reOpen()
  local self = expeditionUnitSelectInfo
  if true == Panel_Subjugation_SelectArmyUnit:IsShow() then
    self:open(self._isSell)
  end
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_Close()
  local self = expeditionUnitSelectInfo
  self:close()
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_Select(unitNo)
  if false == Panel_Subjugation_SelectArmyUnit:IsShow() then
    return
  end
  local self = expeditionUnitSelectInfo
  PaGlobalFunc_ExpeditionSettingInfo_SelectUnitSet(self._selectIndex, unitNo)
  self:close()
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_CreateControlList2(content, key)
  local self = expeditionUnitSelectInfo
  local guageBG = UI.getChildControl(content, "Static_GuageBG")
  local textStatus = UI.getChildControl(content, "StaticText_Top_Status")
  local expValue = UI.getChildControl(guageBG, "StaticText_ExpValue")
  local guageBar = UI.getChildControl(guageBG, "Progress2_ExpGauge")
  local unitInfoBG = UI.getChildControl(content, "Static_Bg")
  local textLevel = UI.getChildControl(content, "StaticText_GradeEdge")
  local textEnergy = UI.getChildControl(content, "StaticText_Energy")
  local recoveryBtn = UI.getChildControl(content, "Button_Recover")
  local promoteBtn = UI.getChildControl(content, "Button_Promote")
  local button_select = UI.getChildControl(content, "Button_Select")
  local button_sell = UI.getChildControl(content, "Button_Sell")
  local myUnit = ToClient_getMyExpeditionUnitInfo(key)
  local unitNo = Int64toInt32(key)
  if nil ~= myUnit then
    local atkPoint = myUnit:getAttackPoint()
    local level = myUnit._level
    local curExp = myUnit._experience
    local maxExp = myUnit:getMaxExperience()
    local curEnergyPoint = myUnit._energyPoint
    local unitName = myUnit:getUnitName()
    local maxEnergy = myUnit:getMaxEnergyPoint()
    textLevel:SetText("Lv." .. tostring(level))
    local expRate = curExp / maxExp * 100
    expValue:SetText(tostring(expRate) .. "%")
    guageBar:SetProgressRate(expRate)
    if self._selectUnitNo == unitNo then
      textStatus:SetFontColor(Defines.Color.C_FFFFEEA0)
    else
      textStatus:SetFontColor(Defines.Color.C_FFC4BEBE)
    end
    textStatus:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_EXPEDITION_UNITINFO", "name", unitName, "attack", atkPoint))
    textEnergy:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_EXPEDITION_CURRENT_ENERGY", "energy", curEnergyPoint, "maxenergy", maxEnergy))
    unitInfoBG:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionUnitSelectInfo_ClickUnit(" .. unitNo .. ")")
    recoveryBtn:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionUnitRecoveryDetail(" .. unitNo .. ")")
    promoteBtn:SetShow(myUnit:canUpgrade())
    promoteBtn:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionUnitPromote(" .. unitNo .. ")")
    button_select:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionUnitSelectInfo_Select(" .. unitNo .. ")")
    button_sell:addInputEvent("Mouse_LUp", "PaGlobalFunc_SellExpeditionUnit(" .. unitNo .. ")")
    if true == self._isSell then
      button_sell:SetShow(true)
      button_select:SetShow(false)
    else
      button_sell:SetShow(false)
      button_select:SetShow(true)
    end
  end
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_ClickUnit(unitNo)
  local self = expeditionUnitSelectInfo
  if unitNo == self._selectUnitNo then
    return
  end
  local prevSelectUnitNo = self._selectUnitNo
  self._selectUnitNo = unitNo
  self._ui._list2_myUnitList:requestUpdateByKey(self._selectUnitNo)
  if nil ~= prevSelectUnitNo then
    self._ui._list2_myUnitList:requestUpdateByKey(prevSelectUnitNo)
  end
end
function PaGlobalFunc_ExpeditionUnitPromote(unitNo)
  local function doPromote()
    ToClient_requestUpgradeExpeditionUnit(unitNo)
  end
  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_EXPEDITION_UNIT_UPGRADE")
  local messageBoxData = {
    title = messageBoxTitle,
    content = messageBoxMemo,
    functionYes = doPromote,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData, "middle")
end
function PaGlobalFunc_SellExpeditionUnit(unitNo)
  local function doSell()
    ToClient_sellExpeditionUnit(unitNo)
  end
  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
  local messageBoxMemo = tostring("\235\182\128\235\140\128\235\165\188 \237\140\144\235\167\164 \237\149\152\236\139\156\234\178\160\236\138\181\235\139\136\234\185\140?")
  local messageBoxData = {
    title = messageBoxTitle,
    content = messageBoxMemo,
    functionYes = doSell,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData, "middle")
end
function FromClient_ExpeditionUnitSelectInfo_Initialize()
  local self = expeditionUnitSelectInfo
  self:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_ExpeditionUnitSelectInfo_Initialize")
