local _panel = Panel_Window_MarketPlace_Main
local _mainBg = UI.getChildControl(_panel, "Static_Wallet")
local UI_color = Defines.Color
local Wallet = {
  _ui = {}
}
function PaGlobalFunc_Wallet_Init()
  local self = Wallet
  self:initControl()
  self:initEvent()
end
function Wallet:initControl()
end
function Wallet:initEvent()
end
function PaGlobalFunc_Wallet_Open()
  local self = Wallet
  if false == _panel:GetShow() then
    _PA_ASSERT(false, "\235\169\148\236\157\184 \237\140\168\235\132\144\236\157\180 \236\151\180\235\160\164\236\158\136\236\167\128 \236\149\138\236\157\128\235\141\176 \236\149\132\236\157\180\237\133\156 \235\167\136\236\188\147\236\157\132 \236\151\180\235\160\164\234\179\160 \237\150\136\236\138\181\235\139\136\235\139\164. : \237\140\168\235\132\144 : Panel_Window_MarketPlace_Main")
    return
  end
  self:open()
end
function PaGlobalFunc_Wallet_Close()
  local self = Wallet
  if false == _panel:GetShow() then
    _PA_ASSERT(false, "\235\169\148\236\157\184 \237\140\168\235\132\144\236\157\180 \236\151\180\235\160\164\236\158\136\236\167\128 \236\149\138\236\157\128\235\141\176 \236\149\132\236\157\180\237\133\156 \235\167\136\236\188\147\236\157\132 \236\151\180\235\160\164\234\179\160 \237\150\136\236\138\181\235\139\136\235\139\164. : \237\140\168\235\132\144 : Panel_Window_MarketPlace_Main")
    return
  end
  self:close()
end
function Wallet:open()
  _mainBg:SetShow(true)
end
function Wallet:close()
  _mainBg:SetShow(false)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_MarketPlace_Init")
