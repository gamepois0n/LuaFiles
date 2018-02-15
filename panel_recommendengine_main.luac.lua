-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\recommendengine\panel_recommendengine_main.luac 

-- params : ...
-- function num : 0
local RAT_VIEW = 0
local isDevelopment = ToClient_IsDevelopment()
local RecommendEngine = {_clearTime = 0, 
_clickCashProductList = {}
}
PaGlobal_RecommendEngine_CashVeiw = function(CashProductNo)
  -- function num : 0_0 , upvalues : RecommendEngine, RAT_VIEW
  local isFirstClick = RecommendEngine:checkCashProduct(CashProductNo)
  if isFirstClick == true then
    ToClient_sendRecommendInfoCashShop(RAT_VIEW, CashProductNo)
  end
end

PaGlobal_RecommendEngine_ItemMarketVeiw = function(ItemEnchantKey)
  -- function num : 0_1
end

RecommendEngine.checkCashProduct = function(self, CashProductNo)
  -- function num : 0_2
  local currentTime = (os.time)()
  if currentTime - self._clearTime < 300 then
    self._clickCashProductList = {}
    self._clearTime = currentTime
  end
  for key,value in pairs(self._clickCashProductList) do
    if key == CashProductNo then
      return false
    end
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._clickCashProductList)[CashProductNo] = 0
  return true
end


