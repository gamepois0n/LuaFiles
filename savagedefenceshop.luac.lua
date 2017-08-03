-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\savagedefence\savagedefenceshop.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
Panel_SavageDefenceShop:SetShow(false)
local PaGlobal_SavageDefenceShop = {_myCoin = (UI.getChildControl)(Panel_SavageDefenceShop, "StaticText_Coin"), _list2 = (UI.getChildControl)(Panel_SavageDefenceShop, "List2_SavageDefenceShopList"), 
_listPool = {}
, _listCount = 0, 
_posConfig = {_listStartPosY = 12, _iconStartPosX = 5, _itemNamePosX = 10, _itemPricePosX = 50, _BuyButtonPosX = 50, _listPosYGap = 30}
, 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true}
}
FGlobal_SavageDefenceShop_init = function()
  -- function num : 0_0 , upvalues : PaGlobal_SavageDefenceShop
  local self = PaGlobal_SavageDefenceShop
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
  (self._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_SavageDefenceShop_ListUpdate")
  ;
  (self._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

FGlobal_SavageDefenceShop_ListUpdate = function(contents, key)
  -- function num : 0_1 , upvalues : PaGlobal_SavageDefenceShop, UI_TM
  local self = PaGlobal_SavageDefenceShop
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
  if itemKey ~= 0 then
    local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
    local itemName = itemStatic:getName()
    createSlot:setItemByStaticStatus(itemStatic, 1, -1, false)
    ;
    (createSlot.icon):addInputEvent("Mouse_On", "FGlobal_SavageDefenceShop_ItemTooltip( " .. idx .. " )")
    ;
    (createSlot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
    ;
    (createSlot.icon):SetShow(true)
    txt_ItemName:SetText(itemName)
    icon_ItemPrice:SetText(makeDotMoney(price))
    btn_ItemBuy:addInputEvent("Mouse_LUp", "FGlobal_SavageDefenceShop_buy(" .. idx .. ")")
  end
end

FGlobal_SavageDefenceShop_Update = function()
  -- function num : 0_2 , upvalues : PaGlobal_SavageDefenceShop
  local self = PaGlobal_SavageDefenceShop
  local itemCount = ToClient_SavagetDefenceItemCount()
  local inMyCoin = ToClient_getSavageDefenceMyCoinCount()
  ;
  ((self._list2):getElementManager()):clearKey()
  for idx = 0, itemCount - 1 do
    ((self._list2):getElementManager()):pushKey(toInt64(0, idx))
  end
  ;
  (self._myCoin):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCESHOP_GETPOINT", "point", makeDotMoney(inMyCoin)))
end

FGlobal_SavageDefenceShop_coinUpdate = function()
  -- function num : 0_3 , upvalues : PaGlobal_SavageDefenceShop
  local self = PaGlobal_SavageDefenceShop
  local inMyCoin = ToClient_getSavageDefenceMyCoinCount()
  ;
  (self._myCoin):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCESHOP_GETPOINT", "point", makeDotMoney(inMyCoin)))
end

FGlobal_SavageDefenceShop_buy = function(idx)
  -- function num : 0_4
  local inMyCoin = ToClient_getSavageDefenceMyCoinCount()
  local price = ToClient_getSavageDefenceItemPrice(idx)
  local s32_maxNumber = (math.floor)(inMyCoin / Int64toInt32(price))
  local s64_maxNumber = toInt64(0, s32_maxNumber)
  local itemKey = ToClient_getSavageDefenceItemkey(idx)
  if itemKey ~= 0 then
    local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
    if itemStatic:isStackable() then
      Panel_NumberPad_Show(true, s64_maxNumber, idx, FGlobal_SavageDefenceShop_BuyXXX)
    else
      ToClient_SavageDefenceBuyItem(idx, 1)
    end
  end
end

FGlobal_SavageDefenceShop_BuyXXX = function(inputNumber, param)
  -- function num : 0_5
  ToClient_SavageDefenceBuyItem(param, inputNumber)
end

FGlobal_SavageDefenceShop_ItemTooltip = function(idx)
  -- function num : 0_6 , upvalues : PaGlobal_SavageDefenceShop
  local self = PaGlobal_SavageDefenceShop
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
    Panel_Tooltip_Item_Show(itemStaticStatus, itemSlot, true, false, nil, nil, false)
  end
end

FGlobal_SavageDefenceShop_Open = function()
  -- function num : 0_7
  if not ToClient_getPlayNowSavageDefence() then
    return 
  end
  if Panel_SavageDefenceShop:GetShow() then
    return 
  end
  Panel_SavageDefenceShop:SetShow(true)
  FGlobal_SavageDefenceShop_Update()
  Panel_SavageDefenceShop:SetPosY(Panel_Radar:GetPosY() + Panel_Radar:GetSizeY() + Panel_SavageDefenceWave:GetSizeY())
end

FGlobal_FromClient_joinSavageDefence = function()
  -- function num : 0_8
  if not Panel_SavageDefenceShop:GetShow() then
    FGlobal_SavageDefenceShop_Open()
  else
    FGlobal_SavageDefenceShop_Close()
  end
end

FGlobal_SavageDefenceShop_Close = function()
  -- function num : 0_9
  Panel_SavageDefenceShop:SetShow(false)
end

FGlobal_SavageDefenceShop_SetCoin = function(coin)
  -- function num : 0_10 , upvalues : PaGlobal_SavageDefenceShop
  local self = PaGlobal_SavageDefenceShop
  ;
  (self._myCoin):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCESHOP_GETPOINT", "point", makeDotMoney(coin)))
end

FGlobal_SavageDefenceShop_init()
registerEvent("FromClient_joinSavageDefence", "FGlobal_FromClient_joinSavageDefence")

