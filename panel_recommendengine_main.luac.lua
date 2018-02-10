-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\recommendengine\panel_recommendengine_main.luac 

-- params : ...
-- function num : 0
local RAT_VIEW = 0
local isDevelopment = ToClient_IsDevelopment()
PaGlobal_RecommendEngine_CashVeiw = function(CashProductNo)
  -- function num : 0_0 , upvalues : RAT_VIEW
  ToClient_sendRecommendInfoCashShop(RAT_VIEW, CashProductNo)
end

PaGlobal_RecommendEngine_ItemMarketVeiw = function(ItemEnchantKey)
  -- function num : 0_1 , upvalues : RAT_VIEW
  ToClient_sendRecommendInfoItemMarket(RAT_VIEW, ItemEnchantKey)
end


