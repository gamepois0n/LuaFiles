local expeditionUnitSelectInfo = {
  _ui = {
    _button_close = UI.getChildControl(Panel_Subjugation_SelectArmyUnit, "Button_Win_Close"),
    _button_select = UI.getChildControl(Panel_Subjugation_SelectArmyUnit, "Button_Select"),
    _bg_select = UI.getChildControl(Panel_Subjugation_SelectArmyUnit, "Static_ArmySelectListBG"),
    _list2_myUnitList = nil
  },
  _selectIndex = nil,
  _selectUnitNo = nil
}
function expeditionUnitSelectInfo:initialize()
  self:registEventHandler()
  Panel_Subjugation_SelectArmyUnit:SetShow(false)
end
function expeditionUnitSelectInfo:registEventHandler()
  self._ui._button_select:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionUnitSelectInfo_Select()")
  self._ui._button_close:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionUnitSelectInfo_Close()")
  self._ui._list2_myUnitList = UI.getChildControl(self._ui._bg_select, "List2_SubNode")
  self._ui._list2_myUnitList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_ExpeditionUnitSelectInfo_CreateControlList2")
  self._ui._list2_myUnitList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
end
function expeditionUnitSelectInfo:open()
  local unitList = ToClient_getMyExpeditionUnitList()
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
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_Open(index)
  local self = expeditionUnitSelectInfo
  self:open()
  self._selectIndex = index
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_Close()
  local self = expeditionUnitSelectInfo
  self:close()
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_Select()
  if false == Panel_Subjugation_SelectArmyUnit:IsShow() then
    return
  end
  local self = expeditionUnitSelectInfo
  PaGlobalFunc_ExpeditionSettingInfo_SelectUnitSet(self._selectIndex, self._selectUnitNo)
  self:close()
end
function PaGlobalFunc_ExpeditionUnitSelectInfo_CreateControlList2(content, key)
  local self = expeditionUnitSelectInfo
  local textStatus = UI.getChildControl(content, "StaticText_Top_Status")
  local expValue = UI.getChildControl(content, "StaticText_ExpValue")
  local guageBar = UI.getChildControl(content, "Progress2_ExpGauge")
  local unitInfoBG = UI.getChildControl(content, "Static_Bg")
  local textLevel = UI.getChildControl(content, "StaticText_GradeEdge")
  local myUnit = ToClient_getMyExpeditionUnitInfo(key)
  local unitNo = Int64toInt32(key)
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
    if self._selectUnitNo == unitNo then
      textStatus:SetFontColor(Defines.Color.C_FFFFEEA0)
    else
      textStatus:SetFontColor(Defines.Color.C_FFC4BEBE)
    end
    textStatus:SetText(string.format("[%s] atk:%s/Energy:%s", unitName, atkPoint, curEnergyPoint))
    unitInfoBG:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionAreaSelectInfo_ClickUnit(" .. unitNo .. ")")
  end
end
function PaGlobalFunc_ExpeditionAreaSelectInfo_ClickUnit(unitNo)
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
expeditionUnitSelectInfo:initialize()
