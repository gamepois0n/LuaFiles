-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\savagedefence\savagedefenceshop.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
Panel_SavageDefenceShop:SetShow(false)
local SavageDefenceShop = {_myCoin = (UI.getChildControl)(Panel_SavageDefenceShop, "StaticText_Coin"), _list2 = (UI.getChildControl)(Panel_SavageDefenceShop, "List2_SavageDefenceShopList"), 
_listPool = {}
, _listCount = 0, 
_posConfig = {_listStartPosY = 12, _iconStartPosX = 5, _itemNamePosX = 10, _itemPricePosX = 50, _BuyButtonPosX = 50, _listPosYGap = 30}
, 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true}
}
SavageDefenceShop_init = function()
  -- function num : 0_0 , upvalues : SavageDefenceShop
  local self = SavageDefenceShop
  local list2Control = (UI.getChildControl)(Panel_SavageDefenceShop, "List2_SavageDefenceShopList")
  local list2Content = (UI.getChildControl)(list2Control, "List2_1_Content")
  local createSlot = {}
  local itemlist_Slot = (UI.getChildControl)(list2Content, "Template_Static_Slot")
  ;
  (SlotItem.new)(createSlot, "SavageDefenceShop_SlotItem", 0, itemlist_Slot, self.slotConfig)
  createSlot:createChild()
  ;
  (createSlot.icon):SetPosX(4)
  ;
  (createSlot.icon):SetPosY(1)
  self._listCount = ToClient_SavagetDefenceItemCount()
  ;
  (self._list2):changeAnimationSpeed(10)
  ;
  (self._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "SavageDefenceShop_ListUpdate")
  ;
  (self._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

SavageDefenceShop_ListUpdate = function(contents, key)
  -- function num : 0_1 , upvalues : SavageDefenceShop, UI_TM
  local self = SavageDefenceShop
  local idx = Int64toInt32(key)
  local itemlistBG = (UI.getChildControl)(contents, "Template_Button_ItemList")
  itemlistBG:SetShow(true)
  itemlistBG:setNotImpactScrollEvent(true)
  local itemlist_SlotBG = (UI.getChildControl)(contents, "Template_Static_SlotBG")
  itemlist_SlotBG:SetShow(false)
  local createSlot = {}
  local itemlist_Slot = (UI.getChildControl)(contents, "Template_Static_Slot")
  itemlist_Slot:SetShow(true)
  ;
  (SlotItem.reInclude)(createSlot, "SavageDefenceShop_SlotItem", 0, itemlist_Slot, self.slotConfig)
  ;
  (createSlot.icon):SetSize(40, 40)
  ;
  (createSlot.border):SetSize(41, 41)
  ;
  (createSlot.border):SetPosX(0)
  local icon_ItemPrice = (UI.getChildControl)(contents, "Template_StaticText_CoinIcon")
  icon_ItemPrice:SetShow(true)
  local txt_ItemName = (UI.getChildControl)(contents, "StaticText_ItemName")
  txt_ItemName:SetShow(true)
  txt_ItemName:SetTextMode(UI_TM.eTextMode_LimitText)
  local btn_ItemBuy = (UI.getChildControl)(contents, "Template_Button_BuyItem")
  btn_ItemBuy:SetShow(true)
  local itemKey = ToClient_getSavageDefenceItemkey(idx)
  local price = ToClient_getSavageDefenceItemPrice(idx)
  _PA_LOG("정태�\164", "itemKey : " .. tostring(itemKey))
  if itemKey ~= 0 then
    local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
    local itemName = itemStatic:getName()
    _PA_LOG("정태�\164", "itemName : " .. tostring(itemName))
    createSlot:setItemByStaticStatus(itemStatic, 1, -1, false)
    ;
    (createSlot.icon):addInputEvent("Mouse_On", "SavageDefenceShop_ItemTooltip( " .. idx .. " )")
    ;
    (createSlot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
    ;
    (createSlot.icon):SetShow(true)
    txt_ItemName:SetText(itemName)
    _PA_LOG("정태�\164", "price : " .. tostring(price))
    icon_ItemPrice:SetText(makeDotMoney(price))
    btn_ItemBuy:addInputEvent("Mouse_LUp", "SavageDefenceShop_buy(" .. idx .. ")")
  end
end

SavageDefenceShop_Update = function()
  -- function num : 0_2 , upvalues : SavageDefenceShop
  local self = SavageDefenceShop
  local itemCount = ToClient_SavagetDefenceItemCount()
  _PA_LOG("정태�\164", "itemCount : " .. tostring(itemCount))
  local inMyCoin = ToClient_getSavageDefencePlayerCoin()
  _PA_LOG("정태�\164", "야만�\152 균열 상점 업데이트 들어오나�\148?")
  ;
  ((self._list2):getElementManager()):clearKey()
  for idx = 0, itemCount - 1 do
    ((self._list2):getElementManager()):pushKey(toInt64(0, idx))
  end
  ;
  (self._myCoin):SetText("보유 점수 : " .. makeDotMoney(inMyCoin))
end

SavageDefenceShop_buy = function(idx, count)
  -- function num : 0_3
  local inMyCoin = ToClient_getSavageDefencePlayerCoin()
  local price = ToClient_getSavageDefenceItemPrice(idx)
  local s32_maxNumber = (math.floor)(inMyCoin / Int64toInt32(price))
  local s64_maxNumber = toInt64(0, s32_maxNumber)
  Panel_NumberPad_Show(true, s64_maxNumber, idx, SavageDefenceShop_BuyXXX)
end

SavageDefenceShop_BuyXXX = function(inputNumber, param)
  -- function num : 0_4
  ToClient_SavageDefenceBuyItem(param, inputNumber)
end

SavageDefenceShop_ItemTooltip = function(idx)
  -- function num : 0_5 , upvalues : SavageDefenceShop
  local self = SavageDefenceShop
  local itemStaticStatus = nil
  if idx == nil then
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  local control = self._list2
  local contents = control:GetContentByKey(toInt64(0, idx))
  if contents ~= nil then
    local itemSlot = (UI.getChildControl)(contents, "Template_Static_Slot")
    local itemKey = ToClient_getSavageDefenceItemkey(idx)
    local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
    local itemStaticStatus = itemStatic
    Panel_Tooltip_Item_Show(itemStaticStatus, itemSlot, true, false, nil, nil, true)
  end
end

SavageDefenceShop_Open = function()
  -- function num : 0_6
  _PA_LOG("정태�\164", "ToClient_getPlayNowSavageDefence() : " .. tostring(ToClient_getPlayNowSavageDefence()))
  if not ToClient_getPlayNowSavageDefence() then
    return 
  end
  Panel_SavageDefenceShop:SetShow(true)
  SavageDefenceShop_Update()
end

FromClient_joinSavageDefence = function()
  -- function num : 0_7
  SavageDefenceShop_Open()
end

FGlobal_SavageDefenceShop_Close = function()
  -- function num : 0_8
end

PaGlobal_SavageDefenceShop_SetCoin = function(coin)
  -- function num : 0_9 , upvalues : SavageDefenceShop
  local self = SavageDefenceShop
  ;
  (self._myCoin):SetText("보유 점수 : " .. makeDotMoney(coin))
end

SavageDefenceShop_init()
registerEvent("FromClient_luaLoadComplete", "SavageDefenceShop_Open")
registerEvent("FromClient_joinSavageDefence", "FromClient_joinSavageDefence")

