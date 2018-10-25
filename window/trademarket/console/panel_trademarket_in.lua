local _panel = Panel_TradeMarket_In
local TradeMarketIn = {
  _ui = {
    txt_Title = UI.getChildControl(_panel, "StaticText_Title"),
    btn_Sell = UI.getChildControl(_panel, "RadioButton_Sell"),
    btn_Buy = UI.getChildControl(_panel, "RadioButton_Buy"),
    stc_BottomBg = UI.getChildControl(_panel, "Static_BottomBG")
  }
}
function TradeMarketIn:open()
  _panel:SetShow(true)
end
function TradeMarketIn:close()
  _panel:SetShow(false)
end
function TradeMarketIn:init()
  self:registEventHandler()
end
function TradeMarketIn:registEventHandler()
  self._ui.btn_Sell:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobal_TradeMarketIn_OpenSellPanel()")
  self._ui.btn_Buy:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobal_TradeMarketIn_OpenBuyPanel()")
  PaGlobal_registerPanelOnBlackBackground(_panel)
end
function PaGlobal_TradeMarketIn_OpenSellPanel()
  local self = TradeMarketIn
  self:close()
  PaGlobal_TradeMarketGoods_Open()
  PaGlobal_TradeMarketGraph_Open(true)
end
function PaGlobal_TradeMarketIn_OpenBuyPanel()
  local self = TradeMarketIn
  self:close()
  PaGlobal_TradeMarketBasket_Open()
  PaGlobal_TradeMarketGraph_Open(false)
end
function PaGlobalFunc_TradeMarketIn_Open()
  local self = TradeMarketIn
  self:open()
end
function PaGlobalFunc_TradeMarketIn_Close()
  local self = TradeMarketIn
  self:close()
end
function PaGlobalFunc_TradeMarketIn_Init()
  local self = TradeMarketIn
  self:init()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_TradeMarketIn_Init")
