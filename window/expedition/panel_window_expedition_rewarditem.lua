local expeditionRewardItemInfo = {
  _ui = {
    _button_close = UI.getChildControl(Panel_ArmyUnitSetting, "Button_Win_Close")
  }
}
function expeditionRewardItemInfo:initialize()
  self:registEventHandler()
  Panel_Subjugation_Item:SetShow(false)
end
function expeditionRewardItemInfo:registEventHandler()
  self._ui._button_close:addInputEvent("Mouse_LUp", "PaGlobalFunc_ExpeditionRewardItemInfo_Close()")
end
function expeditionRewardItemInfo:open()
  Panel_Subjugation_Item:SetShow(true)
end
function expeditionRewardItemInfo:close()
  Panel_Subjugation_Item:SetShow(false)
end
function PaGlobalFunc_ExpeditionRewardItemInfo_Open()
  local self = expeditionRewardItemInfo
  self:open()
end
function PaGlobalFunc_ExpeditionRewardItemInfo_Close()
  local self = expeditionRewardItemInfo
  self:close()
end
expeditionRewardItemInfo:initialize()
