-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\coupon\coupon.luac 

-- params : ...
-- function num : 0
FromClient_UseCouponItem = function(itemWhereType, slotNo, param1)
  -- function num : 0_0
  ToClient_RegisterCoupon(itemWhereType, slotNo)
end

FromClient_Test = function()
  -- function num : 0_1
  _PA_LOG("asdf", "FromClient_Test")
end

registerEvent("FromClient_UseCouponItem", "FromClient_UseCouponItem")
registerEvent("FromClient_ClearSkillsByPoint", "FromClient_Test")

