-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_buyconfirm.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local ItemClassify = CppEnums.ItemClassifyType
local IM = CppEnums.EProcessorInputMode
local isBuySingle = nil
local buyItemPrice = 0
local currentItemCount = 0
local failCount = 0
local maxFailCount = 5
if isItemMarketSecureCode() == true then
  Panel_Window_ItemMarket_BuyConfirm = Panel_Window_ItemMarket_BuyConfirmSecure
  local rndNo_1, rndNo_2 = nil, nil
end
do
  Panel_Window_ItemMarket_BuyConfirm:setGlassBackground(true)
  Panel_Window_ItemMarket_BuyConfirm:ActiveMouseEventEffect(true)
  Panel_Window_ItemMarket_BuyConfirm:SetShow(false)
  local ItemMarketBuyConfirm = {txt_ItemBuyQuestion = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "StaticText_ItemBuyQuestion"), txt_ItemBuyCountQuestion = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "StaticText_ItemBuyCountQuestion"), buyItemCount = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "Edit_BuyItemCount"), buyItemTotalPrice = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "StaticText_ItemBuyTotalPrice"), buyItemBG = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "Static_BuyItemBG"), btn_Buy = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "Button_Yes"), btn_Close = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "Button_No"), btn_Min = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "Button_Min"), btn_Max = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "Button_Max")}
  if isItemMarketSecureCode() == true then
    ItemMarketBuyConfirm.buyItemSecureCodeBG = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "Static_BuySecureCodeBG")
    ItemMarketBuyConfirm.buyItemSecureCode1 = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "StaticText_SecureCode1")
    ItemMarketBuyConfirm.buyItemSecureCode2 = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "StaticText_SecureCode2")
    ItemMarketBuyConfirm.buySecureCode = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "Edit_BuySecureCode")
    ItemMarketBuyConfirm.buyGuideText = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "StaticText_GuideText")
    ItemMarketBuyConfirm.buyItemBuyCountTit = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "StaticText_ItemBuyCountTit")
    ItemMarketBuyConfirm.buyItemBuyPrice = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "StaticText_ItemBuyPrice")
    ItemMarketBuyConfirm.buyItemBuyPriceValue = (UI.getChildControl)(Panel_Window_ItemMarket_BuyConfirm, "StaticText_ItemBuyPriceValue")
    ;
    (ItemMarketBuyConfirm.buySecureCode):SetMaxInput(2)
    ;
    (ItemMarketBuyConfirm.buySecureCode):RegistReturnKeyEvent("HandleClicked_ItemMarket_BuyItem()")
  end
  local marketItemName, marketItemBuyCount, marketItemMaxCount = nil, nil, nil
  ItemMarketBuyConfirmShowAni = function()
  -- function num : 0_0
  Panel_Window_ItemMarket_BuyConfirm:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Window_ItemMarket_BuyConfirm, 0, 0.3)
end

  ItemMarketBuyConfirmHideAni = function()
  -- function num : 0_1
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_Window_ItemMarket_BuyConfirm, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

  ItemMarketBuyConfirm.init = function(self)
  -- function num : 0_2
  (self.buyItemCount):SetNumberMode(true)
  ;
  (self.buyItemCount):SetMaxInput(4)
end

  ItemMarketBuyConfirm.Update = function(self)
  -- function num : 0_3 , upvalues : isBuySingle, marketItemName, marketItemMaxCount, marketItemBuyCount, buyItemPrice
  if isItemMarketSecureCode() == true then
    if isBuySingle == true then
      (self.txt_ItemBuyQuestion):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_MESSAGEBOX_BUYCONFIRM", "itemName", marketItemName))
      ;
      (self.buyItemSecureCodeBG):SetPosY(93)
      ;
      (self.buySecureCode):SetPosY(93)
      ;
      (self.buyItemSecureCode1):SetPosY(101)
      ;
      (self.buyItemSecureCode2):SetPosY(101)
      ;
      (self.buyGuideText):SetPosY(125)
      ;
      (self.btn_Buy):SetPosY(165)
      ;
      (self.btn_Close):SetPosY(165)
      Panel_Window_ItemMarket_BuyConfirm:SetSize(425, 200)
      ;
      (self.buyItemBG):SetSize(400, 120)
      ;
      (self.buyItemCount):SetShow(false)
      ;
      (self.txt_ItemBuyCountQuestion):SetShow(false)
      ;
      (self.buyItemBuyCountTit):SetShow(false)
      ;
      (self.buyItemBuyPrice):SetShow(false)
      ;
      (self.buyItemBuyPriceValue):SetShow(false)
      ;
      (self.btn_Min):SetShow(false)
      ;
      (self.btn_Max):SetShow(false)
    else
      ;
      (self.buyItemSecureCodeBG):SetPosY(188)
      ;
      (self.buySecureCode):SetPosY(188)
      ;
      (self.buyItemSecureCode1):SetPosY(196)
      ;
      (self.buyItemSecureCode2):SetPosY(196)
      ;
      (self.buyGuideText):SetPosY(225)
      ;
      (self.btn_Buy):SetPosY(265)
      ;
      (self.btn_Close):SetPosY(265)
      Panel_Window_ItemMarket_BuyConfirm:SetSize(425, 300)
      ;
      (self.buyItemBG):SetSize(400, 190)
      ;
      (self.buyItemCount):SetShow(true)
      ;
      (self.txt_ItemBuyCountQuestion):SetShow(true)
      ;
      (self.buyItemBuyCountTit):SetShow(true)
      ;
      (self.buyItemBuyPrice):SetShow(true)
      ;
      (self.buyItemBuyPriceValue):SetShow(true)
      ;
      (self.btn_Min):SetShow(true)
      ;
      (self.btn_Max):SetShow(true)
      ;
      (self.txt_ItemBuyQuestion):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCONFIRM_ITEMBUYQUESTION", "marketItemName", marketItemName))
      ;
      (self.txt_ItemBuyCountQuestion):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCONFIRM_ITEMCOUNTBUYQUESTION", "marketItemBuyCount", makeDotMoney(marketItemMaxCount)))
      ;
      (self.buyItemCount):SetEditText(makeDotMoney(marketItemBuyCount))
      local totalPrice = buyItemPrice * marketItemBuyCount
      ;
      (self.buyItemBuyPriceValue):SetText(makeDotMoney(totalPrice))
    end
  else
    do
      ;
      (self.txt_ItemBuyQuestion):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCONFIRM_ITEMBUYQUESTION", "marketItemName", marketItemName))
      ;
      (self.txt_ItemBuyCountQuestion):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCONFIRM_ITEMCOUNTBUYQUESTION", "marketItemBuyCount", makeDotMoney(marketItemMaxCount)))
      ;
      (self.buyItemCount):SetEditText(makeDotMoney(marketItemBuyCount))
      local totalPrice = buyItemPrice * marketItemBuyCount
      ;
      (self.buyItemTotalPrice):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCONFIRM_BUYPRICE", "totalPrice", makeDotMoney(totalPrice)))
    end
  end
end

  HandleClicked_ItemMarket_BuyCountInput = function()
  -- function num : 0_4 , upvalues : ItemMarketBuyConfirm, marketItemMaxCount
  local currentNumber = toInt64(0, (ItemMarketBuyConfirm.buyItemCount):GetEditText())
  Panel_NumberPad_Show(true, marketItemMaxCount, nil, _itemMarketConfirmFunction, false, nil, true)
end

  _itemMarketConfirmFunction = function(param0)
  -- function num : 0_5 , upvalues : ItemMarketBuyConfirm, currentItemCount, buyItemPrice
  (ItemMarketBuyConfirm.buyItemCount):SetEditText(makeDotMoney(param0))
  currentItemCount = param0
  local totalPrice = buyItemPrice * currentItemCount
  if isItemMarketSecureCode() == true then
    (ItemMarketBuyConfirm.buyItemBuyPriceValue):SetText(makeDotMoney(totalPrice))
  else
    ;
    (ItemMarketBuyConfirm.buyItemTotalPrice):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCONFIRM_TOTALPRICE", "totalPrice", makeDotMoney(totalPrice)))
  end
end

  HandleClicked_ItemMarket_BuyConfirm_Close = function()
  -- function num : 0_6
  FGlobal_ItemMarket_BuyConfirm_Close()
end

  HandleClicked_ItemMarket_BuyConfirm_SetMin = function()
  -- function num : 0_7 , upvalues : ItemMarketBuyConfirm, marketItemBuyCount, buyItemPrice
  (ItemMarketBuyConfirm.buyItemCount):SetEditText(makeDotMoney(marketItemBuyCount))
  local totalPrice = buyItemPrice * marketItemBuyCount
  if isItemMarketSecureCode() == true then
    (ItemMarketBuyConfirm.buyItemBuyPriceValue):SetText(makeDotMoney(totalPrice))
  else
    ;
    (ItemMarketBuyConfirm.buyItemTotalPrice):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCONFIRM_TOTALPRICE", "totalPrice", makeDotMoney(totalPrice)))
  end
end

  HandleClicked_ItemMarket_BuyConfirm_SetMax = function()
  -- function num : 0_8 , upvalues : ItemMarketBuyConfirm, marketItemMaxCount, buyItemPrice
  (ItemMarketBuyConfirm.buyItemCount):SetEditText(makeDotMoney(marketItemMaxCount))
  local totalPrice = buyItemPrice * marketItemMaxCount
  if isItemMarketSecureCode() == true then
    (ItemMarketBuyConfirm.buyItemBuyPriceValue):SetText(makeDotMoney(totalPrice))
  else
    ;
    (ItemMarketBuyConfirm.buyItemTotalPrice):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYCONFIRM_TOTALPRICE", "totalPrice", makeDotMoney(totalPrice)))
  end
end

  ItemMarketBuyConfirm.registEventHandler = function(self)
  -- function num : 0_9
  (self.buyItemCount):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_BuyCountInput()")
  ;
  (self.btn_Buy):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_BuyItem()")
  ;
  (self.btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_BuyConfirm_Close()")
  ;
  (self.btn_Min):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_BuyConfirm_SetMin()")
  ;
  (self.btn_Max):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarket_BuyConfirm_SetMax()")
end

  HandleClicked_ItemMarket_BuyItem = function()
  -- function num : 0_10 , upvalues : ItemMarketBuyConfirm, isBuySingle, failCount, maxFailCount
  local self = ItemMarketBuyConfirm
  local itemCount = (self.buyItemCount):GetEditText()
  if isBuySingle == true then
    itemCount = 1
  end
  if isItemMarketSecureCode() == true then
    local secureCode = (self.buySecureCode):GetEditText()
    if secureCode == "" then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYSECURECODE_ALERT1"))
      SetFocusEdit(ItemMarketBuyConfirm.buySecureCode)
      return 
    end
    if rndNo_1 .. rndNo_2 == secureCode then
      FGlobal_HandleClicked_ItemMarket_SingleItem_Do(itemCount)
    else
      if failCount < maxFailCount then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_BUYSECURECODE_ALERT2"))
        buySecureCodeSetting()
        SetFocusEdit(ItemMarketBuyConfirm.buySecureCode)
        failCount = failCount + 1
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_BUYCONFIRM_FAILNOTICE"))
        FGlobal_ItemMarket_BuyConfirm_Close()
        FGolbal_ItemMarketNew_Close()
        if Panel_Window_ItemMarket_Function:GetShow() then
          FGolbal_ItemMarket_Function_Close()
          FGlobal_HideDialog()
        end
      end
    end
  else
    do
      FGlobal_HandleClicked_ItemMarket_SingleItem_Do(itemCount)
    end
  end
end

  FGlobal_ItemMarket_BuyConfirm_Open = function(itemName, itemBuyCount, isSingle, singleItemPrice)
  -- function num : 0_11 , upvalues : ItemMarketBuyConfirm, isBuySingle, marketItemName, marketItemBuyCount, marketItemMaxCount, buyItemPrice, failCount
  local self = ItemMarketBuyConfirm
  isBuySingle = isSingle
  marketItemName = itemName
  marketItemBuyCount = toInt64(0, 1)
  marketItemMaxCount = itemBuyCount
  buyItemPrice = singleItemPrice
  Panel_Window_ItemMarket_BuyConfirm:SetShow(true)
  ItemMarketBuyConfirm:Update()
  if isItemMarketSecureCode() == true then
    SetFocusEdit(self.buySecureCode)
    ;
    (self.buyItemSecureCodeBG):EraseAllEffect()
    ;
    (self.buyItemSecureCodeBG):AddEffect("UI_Item_MenuAura04", true, 0, -0.5)
    buySecureCodeSetting()
    failCount = 0
  end
end

  buySecureCodeSetting = function()
  -- function num : 0_12 , upvalues : ItemMarketBuyConfirm
  local self = ItemMarketBuyConfirm
  rndNo_1 = (math.random)(0, 9)
  rndNo_2 = (math.random)(0, 9)
  local floatRnd_1 = (math.random)(0, 5)
  local floatRnd_2 = ((math.random)(0, 5))
  local isNegativeNum = nil
  local isBlindType = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  ;
  (self.buySecureCode):SetEditText("", true)
  ;
  (self.buyItemSecureCode1):ChangeTextureInfoName("New_UI_Common_forLua/Window/ItemMarket/" .. rndNo_1 .. ".dds")
  ;
  (self.buyItemSecureCode2):ChangeTextureInfoName("New_UI_Common_forLua/Window/ItemMarket/" .. rndNo_2 .. ".dds")
  ;
  (self.buyItemSecureCode1):SetAlpha(0.9)
  ;
  (self.buyItemSecureCode2):SetAlpha(0.9)
  if isBlindType == 1 or isBlindType == 2 then
    (self.buyItemSecureCode1):SetColor(4294938624)
    ;
    (self.buyItemSecureCode2):SetColor(4294938624)
  else
    ;
    (self.buyItemSecureCode1):SetColor(4291231744)
    ;
    (self.buyItemSecureCode2):SetColor(4291231744)
  end
  if floatRnd_1 % 2 == 0 then
    isNegativeNum_1 = "0."
  else
    isNegativeNum_1 = "-0."
  end
  if floatRnd_2 % 2 == 0 then
    isNegativeNum_2 = "0."
  else
    isNegativeNum_2 = "-0."
  end
  ;
  (self.buyItemSecureCode1):SetRotate(isNegativeNum_1 .. floatRnd_1)
  ;
  (self.buyItemSecureCode2):SetRotate(isNegativeNum_2 .. floatRnd_2)
  local rndNoPos_1 = (math.random)(0, 25)
  local rndNoPos_2 = (math.random)(0, 25)
  ;
  (self.buyItemSecureCode1):SetPosX(120 + rndNoPos_1)
  ;
  (self.buyItemSecureCode2):SetPosX(215 + rndNoPos_2)
  local rndPosX = (math.random)(-15, 20)
  local rndPosY = (math.random)(-15, 20)
  local panelSecurePosX = getScreenSizeX() / 2 - Panel_Window_ItemMarket_BuyConfirm:GetSizeX() / 2 + rndPosX
  local panelSecurePosY = getScreenSizeY() / 2 - Panel_Window_ItemMarket_BuyConfirm:GetSizeY() / 2 + rndPosY
  Panel_Window_ItemMarket_BuyConfirm:SetPosX(panelSecurePosX)
  Panel_Window_ItemMarket_BuyConfirm:SetPosY(panelSecurePosY)
end

  FGlobal_ItemMarket_BuyConfirm_Close = function()
  -- function num : 0_13 , upvalues : ItemMarketBuyConfirm, marketItemMaxCount
  if Panel_Window_ItemMarket_BuyConfirm:GetShow() == false then
    return 
  end
  local self = ItemMarketBuyConfirm
  ;
  (self.buyItemCount):SetEditText("")
  ClearFocusEdit()
  Panel_Window_ItemMarket_BuyConfirm:SetShow(false)
  marketItemMaxCount = nil
end

  FGlobal_isItemMarketBuyConfirm = function()
  -- function num : 0_14
  local self = Panel_Window_ItemMarket_BuyConfirm
  return self:GetShow()
end

  FGlobal_ItemMarket_BuyItemConfirm_PriceCheck = function(itemPrice)
  -- function num : 0_15 , upvalues : buyItemPrice
  buyItemPrice = itemPrice
  return buyItemPrice
end

  ItemMarketBuyConfirm:init()
  ItemMarketBuyConfirm:registEventHandler()
end

