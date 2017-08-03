-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\party\panel_partyitemlist.luac 

-- params : ...
-- function num : 0
Panel_Party_ItemList:setMaskingChild(true)
Panel_Party_ItemList:ActiveMouseEventEffect(true)
Panel_Party_ItemList:setGlassBackground(true)
Panel_Party_ItemList:SetShow(false, false)
Panel_Party_ItemList:RegisterShowEventFunc(true, "PartyShowAni()")
Panel_Party_ItemList:RegisterShowEventFunc(false, "PartyHideAni()")
local PA_UI = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local UI_PD = CppEnums.Padding
local registMarket = true
local partyItemList = {_btnClose = (UI.getChildControl)(Panel_Party_ItemList, "Button_Close"), _scroll = (UI.getChildControl)(Panel_Party_ItemList, "Scroll_PartyItem"), _radioBag = (UI.getChildControl)(Panel_Party_ItemList, "RadioButton_Money"), _radioWarehouse = (UI.getChildControl)(Panel_Party_ItemList, "RadioButton_Money2"), _txtBag = (UI.getChildControl)(Panel_Party_ItemList, "Static_Text_Money"), _txtWarehouse = (UI.getChildControl)(Panel_Party_ItemList, "Static_Text_Money2"), bottomDesc = (UI.getChildControl)(Panel_Party_ItemList, "Static_CommentBG"), _itemListBg = (UI.getChildControl)(Panel_Party_ItemList, "Template_Button_ItemList"), _itemSlotBg = (UI.getChildControl)(Panel_Party_ItemList, "Template_Static_SlotBG"), _itemSlot = (UI.getChildControl)(Panel_Party_ItemList, "Template_Static_Slot"), _itemName = (UI.getChildControl)(Panel_Party_ItemList, "Template_StaticText_ItemName"), _itemPrice = (UI.getChildControl)(Panel_Party_ItemList, "Template_StaticText_ItemPrice"), _btnBuy = (UI.getChildControl)(Panel_Party_ItemList, "Button_BuyPartyItem"), _btnDice = (UI.getChildControl)(Panel_Party_ItemList, "Button_Dice"), _btnGiveUp = (UI.getChildControl)(Panel_Party_ItemList, "Button_GiveUpDice"), 
_config = {createIcon = true, createBorder = true, createCount = false, createEnchant = true, createClassEquipBG = true}
, _viewableCount = 3, 
_itemList = {}
, 
_slot = {}
, _startIndex = 0}
;
(partyItemList._itemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
;
(partyItemList._btnClose):addInputEvent("Mouse_LUp", "Panel_Party_ItemList_Close()")
Panel_PartyItemList_SlotInit = function()
  -- function num : 0_0 , upvalues : partyItemList, PA_UI, UI_TM, UI_PD
  local self = partyItemList
  for index = 0, self._viewableCount - 1 do
    local temp = {}
    temp._itemListBg = (UI.createControl)(PA_UI.PA_UI_CONTROL_BUTTON, Panel_Party_ItemList, "Static_ItemListBg_" .. index)
    CopyBaseProperty(self._itemListBg, temp._itemListBg)
    ;
    (temp._itemListBg):SetPosY(45 + index * ((temp._itemListBg):GetSizeY() + 5))
    ;
    (temp._itemListBg):SetShow(false)
    ;
    (temp._itemListBg):addInputEvent("Mouse_UpScroll", "Panel_PartyItemList_ScrollUpdate( true )")
    ;
    (temp._itemListBg):addInputEvent("Mouse_DownScroll", "Panel_PartyItemList_ScrollUpdate( false )")
    temp._itemSlotBg = (UI.createControl)(PA_UI.PA_UI_CONTROL_STATIC, temp._itemListBg, "Static_ItemSlotBg_" .. index)
    CopyBaseProperty(self._itemSlotBg, temp._itemSlotBg)
    ;
    (temp._itemSlotBg):SetPosX(7)
    ;
    (temp._itemSlotBg):SetPosY(8)
    ;
    (temp._itemSlotBg):SetShow(true)
    ;
    (temp._itemSlotBg):addInputEvent("Mouse_UpScroll", "Panel_PartyItemList_ScrollUpdate( true )")
    ;
    (temp._itemSlotBg):addInputEvent("Mouse_DownScroll", "Panel_PartyItemList_ScrollUpdate( false )")
    temp._itemName = (UI.createControl)(PA_UI.PA_UI_CONTROL_STATICTEXT, temp._itemListBg, "StaticText_ItemName_" .. index)
    CopyBaseProperty(self._itemName, temp._itemName)
    ;
    (temp._itemName):SetPosX(56)
    ;
    (temp._itemName):SetPosY(9)
    ;
    (temp._itemName):SetShow(true)
    temp._itemPrice = (UI.createControl)(PA_UI.PA_UI_CONTROL_STATICTEXT, temp._itemListBg, "StaticText_ItemPrice_" .. index)
    CopyBaseProperty(self._itemPrice, temp._itemPrice)
    ;
    (temp._itemPrice):SetPosX(137)
    ;
    (temp._itemPrice):SetPosY(23)
    ;
    (temp._itemPrice):SetShow(true)
    temp._btnBuy = (UI.createControl)(PA_UI.PA_UI_CONTROL_BUTTON, temp._itemListBg, "Button_Buy_" .. index)
    CopyBaseProperty(self._btnBuy, temp._btnBuy)
    ;
    (temp._btnBuy):SetPosX(250)
    ;
    (temp._btnBuy):SetPosY(8)
    ;
    (temp._btnBuy):SetShow(true)
    ;
    (temp._btnBuy):addInputEvent("Mouse_UpScroll", "Panel_PartyItemList_ScrollUpdate( true )")
    ;
    (temp._btnBuy):addInputEvent("Mouse_DownScroll", "Panel_PartyItemList_ScrollUpdate( false )")
    temp._btnDice = (UI.createControl)(PA_UI.PA_UI_CONTROL_BUTTON, temp._itemListBg, "Button_Dice_" .. index)
    CopyBaseProperty(self._btnDice, temp._btnDice)
    ;
    (temp._btnDice):SetPosX(307)
    ;
    (temp._btnDice):SetPosY(8)
    ;
    (temp._btnDice):SetShow(true)
    ;
    (temp._btnDice):addInputEvent("Mouse_UpScroll", "Panel_PartyItemList_ScrollUpdate( true )")
    ;
    (temp._btnDice):addInputEvent("Mouse_DownScroll", "Panel_PartyItemList_ScrollUpdate( false )")
    ;
    (temp._btnDice):addInputEvent("Mouse_On", "Panel_PartyItemList_SimpleTooltip( true, " .. index .. ", " .. 0 .. ")")
    ;
    (temp._btnDice):addInputEvent("Mouse_Out", "Panel_PartyItemList_SimpleTooltip( false, " .. index .. ", " .. 0 .. ")")
    ;
    (temp._btnDice):setTooltipEventRegistFunc("Panel_PartyItemList_SimpleTooltip( true, " .. index .. ", " .. 0 .. ")")
    temp._btnGiveUp = (UI.createControl)(PA_UI.PA_UI_CONTROL_BUTTON, temp._itemListBg, "Button_GiveUp_" .. index)
    CopyBaseProperty(self._btnGiveUp, temp._btnGiveUp)
    ;
    (temp._btnGiveUp):SetPosX(365)
    ;
    (temp._btnGiveUp):SetPosY(8)
    ;
    (temp._btnGiveUp):SetShow(true)
    ;
    (temp._btnGiveUp):addInputEvent("Mouse_UpScroll", "Panel_PartyItemList_ScrollUpdate( true )")
    ;
    (temp._btnGiveUp):addInputEvent("Mouse_DownScroll", "Panel_PartyItemList_ScrollUpdate( false )")
    ;
    (temp._btnGiveUp):addInputEvent("Mouse_On", "Panel_PartyItemList_SimpleTooltip( true, " .. index .. ", " .. 1 .. ")")
    ;
    (temp._btnGiveUp):addInputEvent("Mouse_Out", "Panel_PartyItemList_SimpleTooltip( false, " .. index .. ", " .. 1 .. ")")
    ;
    (temp._btnGiveUp):setTooltipEventRegistFunc("Panel_PartyItemList_SimpleTooltip( true, " .. index .. ", " .. 1 .. ")")
    temp._slot = {}
    ;
    (SlotItem.new)(temp._slot, "Party_ItemSlot_" .. index, 0, temp._itemSlotBg, self._config)
    ;
    (temp._slot):createChild()
    -- DECOMPILER ERROR at PC314: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._itemList)[index] = temp
  end
  ;
  (self.bottomDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.bottomDesc):setPadding(UI_PD.ePadding_Left, 5)
  ;
  (self.bottomDesc):setPadding(UI_PD.ePadding_Right, 5)
  ;
  (self.bottomDesc):setPadding(UI_PD.ePadding_Top, 5)
  ;
  (self.bottomDesc):setPadding(UI_PD.ePadding_Bottom, 5)
  ;
  (self.bottomDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PARTY_ITEMLIST_COMMENT"))
  ;
  (self.bottomDesc):SetSize((self.bottomDesc):GetSizeX(), (self.bottomDesc):GetTextSizeY() + 10)
  Panel_Party_ItemList:SetSize(Panel_Party_ItemList:GetSizeX(), (self.bottomDesc):GetSizeY() + 330)
end

Panel_PartyItemList_SlotInit()
partyItemList.update = function(self)
  -- function num : 0_1
  local itemCount = ToClient_requestGetMySellInfoCount()
  for ii = 0, 2 do
    (((self._itemList)[ii])._itemListBg):SetShow(false)
    ;
    (((self._itemList)[ii])._btnDice):SetShow(false)
    ;
    (((self._itemList)[ii])._btnGiveUp):SetShow(false)
  end
  if itemCount > 0 then
    for index = 0, itemCount - 1 do
      if index < 3 then
        local itemStaticStatusWrapper = ToClient_requestGetMyItemEnchantStaticStatusWrapperByIndex(index + self._startIndex)
        local isDiceable = ToClient_requestGetMyItemDiceableByIndex(index + self._startIndex)
        local itemPrice = ToClient_requestGetMyItemPriceByIndex(index + self._startIndex)
        local enchantKey = ((itemStaticStatusWrapper:get())._key):get()
        local slot = (self._itemList)[index]
        ;
        (slot._itemListBg):SetShow(true)
        ;
        (slot._itemName):SetText(itemStaticStatusWrapper:getName())
        ;
        (slot._itemPrice):SetText(makeDotMoney(itemPrice))
        ;
        (slot._slot):setItemByStaticStatus(itemStaticStatusWrapper, 1)
        ;
        ((slot._slot).icon):addInputEvent("Mouse_On", "PartyItemList_ShowToolTip( " .. index + self._startIndex .. ", " .. index .. " )")
        ;
        ((slot._slot).icon):addInputEvent("Mouse_Out", "PartyItemList_HideToolTip()")
        ;
        ((slot._slot).icon):addInputEvent("Mouse_UpScroll", "Panel_PartyItemList_ScrollUpdate( true )")
        ;
        ((slot._slot).icon):addInputEvent("Mouse_DownScroll", "Panel_PartyItemList_ScrollUpdate( false )")
        ;
        (slot._btnBuy):addInputEvent("Mouse_LUp", "doBuy_PartyItemList(" .. enchantKey .. ", " .. index + self._startIndex .. ")")
        if isDiceable == true then
          _PA_LOG("ìž„ì¢…ì—\176", "ì£¼ì‚¬ìœ\132 ê°\128ëŠ\165")
          ;
          (slot._btnDice):addInputEvent("Mouse_LUp", "doDice_PartyItemList(" .. enchantKey .. ", " .. index + self._startIndex .. ")")
          ;
          (slot._btnGiveUp):addInputEvent("Mouse_LUp", "doDiceAbandon_PartyItemList(" .. enchantKey .. ", " .. index + self._startIndex .. ")")
          ;
          (slot._btnDice):SetShow(true)
          ;
          (slot._btnGiveUp):SetShow(true)
        end
      end
    end
  end
  do
    warehouse_requestInfoByCurrentRegionMainTown()
    ;
    (self._txtBag):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
    ;
    (self._txtWarehouse):SetText(makeDotMoney(warehouse_moneyByCurrentRegionMainTown_s64()))
    ;
    (UIScroll.SetButtonSize)(self._scroll, self._viewableCount, itemCount)
    if ((self._scroll):GetControlButton()):GetSizeY() < 50 then
      ((self._scroll):GetControlButton()):SetSize(((self._scroll):GetControlButton()):GetSizeX(), 50)
    end
    ;
    (self._scroll):SetInterval((math.max)(0, itemCount - self._viewableCount))
  end
end

partyItemList.SetScroll = function(self)
  -- function num : 0_2
  local itemCount = ToClient_requestGetMySellInfoCount()
  ;
  (UIScroll.SetButtonSize)(self._scroll, self._viewableCount, itemCount)
  if ((self._scroll):GetControlButton()):GetSizeY() < 50 then
    ((self._scroll):GetControlButton()):SetSize(((self._scroll):GetControlButton()):GetSizeX(), 50)
  end
  ;
  (self._scroll):SetInterval((math.max)(0, itemCount - self._viewableCount))
  ;
  (self._scroll):SetControlPos(0)
  self._startIndex = 0
end

Panel_PartyItemList_ScrollUpdate = function(isUpScroll)
  -- function num : 0_3 , upvalues : partyItemList
  local self = partyItemList
  local itemCount = ToClient_requestGetMySellInfoCount()
  self._startIndex = (UIScroll.ScrollEvent)(self._scroll, isUpScroll, self._viewableCount, itemCount, self._startIndex, 1)
  self:update()
end

doBuy_PartyItemList = function(enchantKey, index)
  -- function num : 0_4 , upvalues : partyItemList
  local self = partyItemList
  local fromWhereType = (CppEnums.ItemWhereType).eInventory
  if (self._radioWarehouse):IsCheck() then
    fromWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  local itemCount = ToClient_requestGetMySellInfoCount()
  if self._startIndex > 0 and itemCount <= self._startIndex + 3 then
    self._startIndex = self._startIndex - 1
  end
  _PA_LOG("ìž„ì¢…ì—\176", fromWhereType)
  ToClient_requestBuyMyItemAtItemMarketByParty(fromWhereType, enchantKey, index)
end

doDice_PartyItemList = function(enchantKey, index)
  -- function num : 0_5 , upvalues : partyItemList
  local self = partyItemList
  local itemCount = ToClient_requestGetMySellInfoCount()
  if self._startIndex > 0 and itemCount <= self._startIndex + 3 then
    self._startIndex = self._startIndex - 1
  end
  ToClient_requestDiceAtItemMarketByParty(enchantKey, index)
end

doDiceAbandon_PartyItemList = function(enchantKey, index)
  -- function num : 0_6 , upvalues : partyItemList
  local self = partyItemList
  local itemCount = ToClient_requestGetMySellInfoCount()
  if self._startIndex > 0 and itemCount <= self._startIndex + 3 then
    self._startIndex = self._startIndex - 1
  end
  ToClient_abandonDiceAtItemMarketByParty(enchantKey, index)
end

FGlobal_PartyItemList_Update = function()
  -- function num : 0_7 , upvalues : partyItemList
  if Panel_Party_ItemList:GetShow() then
    partyItemList:update()
  end
end

PartyItemList_ShowToolTip = function(item_idx, ui_Idx)
  -- function num : 0_8 , upvalues : partyItemList
  local self = partyItemList
  local itemStaticStatus, UiBase = nil, nil
  itemStaticStatus = ToClient_requestGetMyItemEnchantStaticStatusWrapperByIndex(item_idx)
  UiBase = (((self._itemList)[ui_Idx])._slot).icon
  Panel_Tooltip_Item_Show(itemStaticStatus, UiBase, true, false, nil)
end

PartyItemList_HideToolTip = function()
  -- function num : 0_9
  Panel_Tooltip_Item_hideTooltip()
end

Panel_Party_ItemList_Open = function()
  -- function num : 0_10 , upvalues : registMarket, partyItemList
  if not registMarket then
    return 
  end
  if Panel_Party_ItemList:GetShow() then
    Panel_Party_ItemList:SetShow(false)
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  ToClient_requestListMySellInfo()
  local itemCount = tonumber(ToClient_requestGetMySellInfoCount())
  if itemCount <= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PARTYITEMLIST_REGISTITEMEMPTY"))
    return 
  end
  Panel_Party_ItemList:SetShow(true)
  Panel_Party_ItemList:SetPosX(Panel_Party:GetPosX() + Panel_Party:GetSizeX() + 10)
  Panel_Party_ItemList:SetPosY(Panel_Party:GetPosY())
  if ToClient_HasWareHouseFromNpc() then
    if toInt64(0, 0) == warehouse_moneyByCurrentRegionMainTown_s64() then
      (partyItemList._radioBag):SetCheck(true)
      ;
      (partyItemList._radioWarehouse):SetCheck(false)
    else
      ;
      (partyItemList._radioBag):SetCheck(false)
      ;
      (partyItemList._radioWarehouse):SetCheck(true)
    end
  else
    ;
    (partyItemList._radioBag):SetCheck(true)
    ;
    (partyItemList._radioWarehouse):SetCheck(false)
  end
  partyItemList:SetScroll()
  partyItemList:update()
end

Panel_Party_ItemList_Close = function()
  -- function num : 0_11
  Panel_Party_ItemList:SetShow(false)
  Panel_Tooltip_Item_hideTooltip()
end

Panel_PartyItemList_SimpleTooltip = function(isShow, index, tipType)
  -- function num : 0_12 , upvalues : partyItemList
  local self = partyItemList
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYITEMLIST_TOOLTIP_DICE")
    control = ((self._itemList)[index])._btnDice
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYITEMLIST_TOOLTIP_DICE_GIVEUP")
      control = ((self._itemList)[index])._btnGiveUp
    end
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

FromClient_DiceAckItemMarketByParty = function()
  -- function num : 0_13
end

;
(UIScroll.InputEvent)(partyItemList._scroll, "Panel_PartyItemList_ScrollUpdate")
registerEvent("FromClient_NotifyItemMarketByParty", "FromClient_NotifyItemMarketByParty")
registerEvent("FromClient_DiceAckItemMarketByParty", "FromClient_DiceAckItemMarketByParty")

