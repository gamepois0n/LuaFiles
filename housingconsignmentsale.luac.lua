-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\housing\housingconsignmentsale.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_color = Defines.Color
local const_64 = Defines.s64_const
local displayTime = function(timeValue)
  -- function num : 0_0
  timeValue = timeValue / toUint64(0, 1000)
  if toUint64(0, 3600) < timeValue then
    timeValue = timeValue / toUint64(0, 3600)
    return tostring(timeValue) .. PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_HOUR")
  else
    if toUint64(0, 120) < timeValue then
      timeValue = timeValue / toUint64(0, 60)
      return tostring(timeValue) .. PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_MINUTE")
    else
      if toUint64(0, 0) < timeValue then
        return PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_DEADLINE")
      else
        return PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_SALECLOSE")
      end
    end
  end
end

local ConsignmentSaleManager = {
_topList = {}
, 
_saleList = {}
, _static_currentPage = 0, _lastPage = 0, _slotNo = 0, _itemCount = 0, _isShowMyList = false, _isOwner = false, _isUpdate = true, _registGoldMinimum = 0, _currentHoldingMoney = 0, _currentCommission = 0, _currentIndex = 0, _checkRegisterButton = false, _title = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_Title"), _title_Mylist = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_ShopList_Title"), _static_CenterLine = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Static_CenterLine"), _buttonStartStop = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_StopRegist"), _buttonMyList = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_MyList"), _buttonClose = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_Win_Close"), _updateIcon = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Static_UpdateIcon"), _buttonRegisterItem = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_RegistItem"), _buttonWithdrawGold = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_WithdrawGold"), _editRegistMinimum = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Edit_RegistMinimum"), _editBalance = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Edit_RegistMaximum"), _comboCommission = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Combobox_Commision"), _comboSellDate = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Combobox_SellDate"), _sellInfoBG = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Static_SellCom_BG"), _textWhatFor = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_WhatFor"), _textWhatForNo = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_WhatForNo"), _textSellCommission = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_SellCommision"), _textPercent = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_Percent"), _textRegistMinimum = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_RegistMinimum"), _textSellDate = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_SellDate"), _textRegistMinimumNo = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_RegistMinimumNo"), _textSellDateNo = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_SellDateNo"), _textDate = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_Date"), _textBalance = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_Balance"), _iconBalance = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_BalanceIcon"), _iconRegistMinimum = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_MinimumIcon"), _iconBalanceInput = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_MaximumPrice"), _textListNo = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_List"), _buttonListLeft = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_List_Left"), _buttonListRight = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_List_Right"), _buttonQuestion = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_Question")}
ConsignmentSaleManager.initialize = function(self)
  -- function num : 0_1 , upvalues : UCT, UI_color, displayTime
  local copyStaticBack = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Static_BackGround")
  local copyButtonBuy = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_Buy")
  local copyTextBuyPrice = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Text_BuyPrice")
  local copyTextRegisterPrice = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Text_RegisterPrice")
  local copyStaticRemainedTime = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_RemainedTime")
  local copyStaticItemicon = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Static_Itemicon")
  local copyStaticItemName = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_ItemName")
  local copyStaticRegisterPrice = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_RegisterPrice")
  local copyStaticBuyPrice = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_BuyPrice")
  local copyIconRegister = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_RegisterIcon")
  local copyIconSale = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "StaticText_SaleIcon")
  local copyEnchantText = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Static_Text_Slot_Enchant_value")
  local copyEditRegisterPrice = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Edit_RegistPrice")
  local copyEditSalePrice = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Edit_SalePrice")
  local copyButtonRegister = (UI.getChildControl)(Panel_Housing_ConsignmentSale, "Button_Register")
  createConsignmentSaleList = function(pIndex, pName)
    -- function num : 0_1_0 , upvalues : UCT, copyStaticBack, copyButtonBuy, copyTextBuyPrice, copyTextRegisterPrice, copyStaticRemainedTime, copyStaticItemicon, copyStaticItemName, copyStaticRegisterPrice, copyStaticBuyPrice, copyIconRegister, copyIconSale, copyEditRegisterPrice, copyEditSalePrice, copyButtonRegister, copyEnchantText, UI_color, displayTime
    local rtConsignment = {}
    rtConsignment._staticBack = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, Panel_Housing_ConsignmentSale, "Static_BackGround_" .. pIndex .. pName)
    rtConsignment._buttonBuy = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, rtConsignment._staticBack, "Button_Buy_" .. pIndex .. pName)
    rtConsignment._textBuyPrice = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtConsignment._staticBack, "Text_BuyPrice_" .. pIndex .. pName)
    rtConsignment._textRegisterPrice = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtConsignment._staticBack, "Text_RegisterPrice" .. pIndex .. pName)
    rtConsignment._staticRemainedTime = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtConsignment._staticBack, "Text_ItemCount_" .. pIndex .. pName)
    rtConsignment._staticItemicon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, rtConsignment._staticBack, "Static_Itemicon_" .. pIndex .. pName)
    rtConsignment._staticItemName = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtConsignment._staticBack, "StaticText_ItemName_" .. pIndex .. pName)
    rtConsignment._staticRegisterPrice = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtConsignment._staticBack, "StaticText_RegisterPrice_" .. pIndex .. pName)
    rtConsignment._staticBuyPrice = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtConsignment._staticBack, "StaticText_BuyPrice_" .. pIndex .. pName)
    rtConsignment._iconRegister = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtConsignment._staticBack, "StaticText_RegisterIcon_" .. pIndex .. pName)
    rtConsignment._IconSale = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, rtConsignment._staticBack, "StaticText_SaleIcon_" .. pIndex .. pName)
    rtConsignment._editRegisterPrice = (UI.createControl)(UCT.PA_UI_CONTROL_EDIT, rtConsignment._staticBack, "Edit_RegistPrice_" .. pIndex .. pName)
    CopyBaseProperty(copyStaticBack, rtConsignment._staticBack)
    CopyBaseProperty(copyButtonBuy, rtConsignment._buttonBuy)
    CopyBaseProperty(copyTextBuyPrice, rtConsignment._textBuyPrice)
    CopyBaseProperty(copyTextRegisterPrice, rtConsignment._textRegisterPrice)
    CopyBaseProperty(copyStaticRemainedTime, rtConsignment._staticRemainedTime)
    CopyBaseProperty(copyStaticItemicon, rtConsignment._staticItemicon)
    CopyBaseProperty(copyStaticItemName, rtConsignment._staticItemName)
    CopyBaseProperty(copyStaticRegisterPrice, rtConsignment._staticRegisterPrice)
    CopyBaseProperty(copyStaticBuyPrice, rtConsignment._staticBuyPrice)
    CopyBaseProperty(copyIconRegister, rtConsignment._iconRegister)
    CopyBaseProperty(copyIconSale, rtConsignment._IconSale)
    CopyBaseProperty(copyEditRegisterPrice, rtConsignment._editRegisterPrice)
    if pIndex == 0 and pName == "Sale" then
      rtConsignment._editSalePrice = (UI.createControl)(UCT.PA_UI_CONTROL_EDIT, rtConsignment._staticBack, "Edit_SalePrice_" .. pIndex .. pName)
      rtConsignment._buttonRegister = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, rtConsignment._staticBack, "Button_Register_" .. pIndex .. pName)
      CopyBaseProperty(copyEditSalePrice, rtConsignment._editSalePrice)
      CopyBaseProperty(copyButtonRegister, rtConsignment._buttonRegister)
      ;
      (UI.deleteControl)(copyEditSalePrice)
      ;
      (UI.deleteControl)(copyButtonRegister)
      copyEditSalePrice = nil
      copyButtonRegister = nil
    end
    local _consignmentSaleSlotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true}
    local slot = {}
    ;
    (SlotItem.new)(slot, "ItemIcon_" .. pIndex, pIndex, rtConsignment._staticItemicon, _consignmentSaleSlotConfig)
    slot:createChild()
    ;
    (slot.icon):SetPosX(8)
    ;
    (slot.icon):SetPosY(8)
    ;
    (slot.icon):addInputEvent("Mouse_On", "handleMouseOnConsignmentSaleIconTooltip" .. pName .. "(" .. pIndex .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
    CopyBaseProperty(copyEnchantText, slot.enchantText)
    ;
    (slot.enchantText):SetSize((slot.icon):GetSizeX(), (slot.icon):GetSizeY())
    ;
    (slot.enchantText):SetPosX(0)
    ;
    (slot.enchantText):SetPosY(0)
    ;
    (slot.enchantText):SetTextHorizonCenter()
    ;
    (slot.enchantText):SetTextVerticalCenter()
    rtConsignment._itemIcon = slot
    ;
    (rtConsignment._editRegisterPrice):SetNumberMode(true)
    ;
    (rtConsignment._editRegisterPrice):SetMaxInput(9)
    ;
    (rtConsignment._editRegisterPrice):addInputEvent("Mouse_LUp", "HandleClickedConsignmentEditRegisterPrice(" .. pIndex .. ")")
    ;
    (rtConsignment._buttonBuy):addInputEvent("Mouse_LUp", "handleClickedConsignmentBuy" .. pName .. "(" .. pIndex .. ")")
    rtConsignment.SetPos = function(self, x, y)
      -- function num : 0_1_0_0 , upvalues : rtConsignment
      (rtConsignment._staticBack):SetPosX(x)
      ;
      (rtConsignment._staticBack):SetPosY(y)
    end

    rtConsignment.SetData = function(self, salesData)
      -- function num : 0_1_0_1 , upvalues : rtConsignment, UI_color, displayTime
      if salesData == nil then
        (rtConsignment._staticBack):SetShow(false)
      else
        if salesData:isMyItem() then
          (rtConsignment._buttonBuy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_RETRIEVE"))
          ;
          (rtConsignment._buttonBuy):SetFontColor(UI_color.C_FFFFCE22)
        else
          ;
          (rtConsignment._buttonBuy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUY"))
          ;
          (rtConsignment._buttonBuy):SetFontColor(UI_color.C_FFC4BEBE)
        end
        ;
        (rtConsignment._staticBack):SetShow(true)
        if salesData:getItem() ~= nil then
          (rtConsignment._itemIcon):setItem(salesData:getItem())
          local enchantCount = (((salesData:getItem()):get()):getKey()):getEnchantLevel()
          ;
          (rtConsignment._staticItemName):SetText(((salesData:getItem()):getStaticStatus()):getName())
          if Int64toInt32(((salesData:getItem()):get()):getCount_s64()) > 1 then
            (rtConsignment._staticBuyPrice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_STATICBUYPRICE_1"))
          else
            ;
            (rtConsignment._staticBuyPrice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_STATICBUYPRICE_0"))
          end
        else
          do
            ;
            (rtConsignment._itemIcon):clearItem()
            ;
            (rtConsignment._editRegisterPrice):SetShow(false)
            ;
            (rtConsignment._textRegisterPrice):SetShow(true)
            ;
            (rtConsignment._staticItemName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_SALECOMPLETE"))
            ;
            (rtConsignment._buttonBuy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_COLLECTMONEY"))
            ;
            (rtConsignment._textBuyPrice):SetText(tostring(Int64toInt32(salesData._price)))
            ;
            (rtConsignment._textRegisterPrice):SetText(tostring(Int64toInt32(salesData._registerMoney)))
            ;
            (rtConsignment._staticRemainedTime):SetText(displayTime(salesData:getRemainedTime()))
            ;
            (rtConsignment._editRegisterPrice):SetEditText(tostring(Int64toInt32(salesData._registerMoney)))
          end
        end
      end
    end

    return rtConsignment
  end

  local startX = 415
  local startY = 75
  local sizeX = 400
  local sizeY = 115
  for index = 0, 4 do
    -- DECOMPILER ERROR at PC108: Confused about usage of register: R24 in 'UnsetPending'

    (self._topList)[index] = createConsignmentSaleList(index, "Top")
    ;
    ((self._topList)[index]):SetPos(10, sizeY * index + startY)
  end
  for y = 0, 4 do
    for x = 0, 1 do
      local index = y * 2 + x
      -- DECOMPILER ERROR at PC132: Confused about usage of register: R29 in 'UnsetPending'

      ;
      (self._saleList)[index] = createConsignmentSaleList(index, "Sale")
      ;
      ((self._saleList)[index]):SetPos(x * sizeX + startX, y * sizeY + startY)
    end
  end
  ;
  (self._comboCommission):AddItem(0)
  ;
  (self._comboCommission):AddItem(1)
  ;
  (self._comboCommission):AddItem(2)
  ;
  (self._comboCommission):AddItem(3)
  ;
  (self._comboCommission):AddItem(4)
  ;
  (self._comboCommission):AddItem(5)
  ;
  (self._comboSellDate):AddItem(1)
  ;
  (self._comboSellDate):AddItem(2)
  ;
  (self._comboSellDate):AddItem(3)
  Panel_Housing_ConsignmentSale:SetChildIndex(self._comboSellDate, Panel_Housing_ConsignmentSale:GetChildSize())
  Panel_Housing_ConsignmentSale:SetChildIndex(self._comboCommission, Panel_Housing_ConsignmentSale:GetChildSize())
  ;
  (self._textListNo):SetShow(true)
  ;
  (self._buttonListLeft):SetShow(true)
  ;
  (self._buttonListRight):SetShow(true)
  ;
  (((self._saleList)[0])._editSalePrice):SetNumberMode(true)
  ;
  (((self._saleList)[0])._editSalePrice):SetMaxInput(9)
  ;
  (self._editRegistMinimum):SetNumberMode(true)
  ;
  (self._editBalance):SetNumberMode(true)
  ;
  (self._updateIcon):AddEffect("fUI_InnerCircle", true, 0, 0)
  ;
  (((self._saleList)[0])._editSalePrice):addInputEvent("Mouse_LUp", "HandleClickedConsignmentEditSalePrice()")
  ;
  (((self._saleList)[0])._buttonRegister):addInputEvent("Mouse_LUp", "handleClickedShowMessageConsignmentRegister()")
  ;
  (self._buttonListLeft):addInputEvent("Mouse_LUp", "HandleClickedConsignmentListLeft()")
  ;
  (self._buttonListRight):addInputEvent("Mouse_LUp", "HandleClickedConsignmentListRight()")
  ;
  (self._editRegistMinimum):addInputEvent("Mouse_LUp", "HandleClickedConsignmentEditRegistMinimum()")
  ;
  (self._editBalance):addInputEvent("Mouse_LUp", "HandleClickedConsignmentEditBalance()")
  ;
  (self._comboCommission):addInputEvent("Mouse_LUp", "HandleClickedShowComboBoxConsignmentCommission()")
  ;
  (self._comboSellDate):addInputEvent("Mouse_LUp", "HandleClickedShowComboBoxConsignmentSaleDate()")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "handleClickedConsignmentClose()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"HousingConsignmentSale\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"HousingConsignmentSale\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"HousingConsignmentSale\", \"false\")")
  ;
  (self._buttonStartStop):addInputEvent("Mouse_LUp", "handleClickedConsignmentStartStop()")
  ;
  (self._buttonMyList):addInputEvent("Mouse_LUp", "handleClickedConsignmentMyList()")
  ;
  (self._buttonRegisterItem):addInputEvent("Mouse_LUp", "handleClickedConsignmentRegisterItem()")
  ;
  (self._buttonWithdrawGold):addInputEvent("Mouse_LUp", "handleClickedConsignmentWithdrawGold()")
  ;
  (UI.deleteControl)(copyStaticBack)
  ;
  (UI.deleteControl)(copyButtonBuy)
  ;
  (UI.deleteControl)(copyTextBuyPrice)
  ;
  (UI.deleteControl)(copyTextRegisterPrice)
  ;
  (UI.deleteControl)(copyStaticRemainedTime)
  ;
  (UI.deleteControl)(copyStaticItemicon)
  ;
  (UI.deleteControl)(copyStaticItemName)
  ;
  (UI.deleteControl)(copyStaticRegisterPrice)
  ;
  (UI.deleteControl)(copyStaticBuyPrice)
  ;
  (UI.deleteControl)(copyIconRegister)
  ;
  (UI.deleteControl)(copyIconSale)
  ;
  (UI.deleteControl)(copyEditRegisterPrice)
  ;
  (UI.deleteControl)(copyEnchantText)
  copyStaticBack, copyButtonBuy, copyTextBuyPrice, copyTextRegisterPrice, copyStaticRemainedTime, copyStaticItemicon, copyStaticItemName, copyStaticRegisterPrice, copyStaticBuyPrice, copyIconRegister, copyIconSale = nil
  copyEditRegisterPrice = nil
  copyEnchantText = nil
end

handleClickedConsignmentBuyTop = function(index)
  -- function num : 0_2 , upvalues : ConsignmentSaleManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  ConsignmentSaleManager._currentIndex = index
  local consignmentData = ToClient_RequestConsignmentSaleTopListAt(ConsignmentSaleManager._currentIndex)
  if consignmentData:isMyItem() then
    showMessageConsignmentRetrieveTop()
  else
    showMessageConsignmentBuyTop()
  end
end

handleClickedConsignmentBuySale = function(index)
  -- function num : 0_3 , upvalues : ConsignmentSaleManager
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if ConsignmentSaleManager._isShowMyList == true then
    ConsignmentSaleManager._currentIndex = ConsignmentSaleManager._static_currentPage * 10 + index
  else
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

    if index > 1 then
      ConsignmentSaleManager._currentIndex = ConsignmentSaleManager._static_currentPage * 8 + index - 2
    end
  end
  local consignmentData = ToClient_RequestConsignmentSaleListAt(ConsignmentSaleManager._currentIndex)
  if consignmentData:isMyItem() then
    showMessageConsignmentRetrieveSale()
  else
    showMessageConsignmentBuySale()
  end
end

handleMouseOnConsignmentSaleIconTooltipTop = function(index)
  -- function num : 0_4 , upvalues : ConsignmentSaleManager
  Panel_Tooltip_Item_Show((ToClient_RequestConsignmentSaleTopListAt(index)):getItem(), (((ConsignmentSaleManager._topList)[index])._itemIcon).icon, false, true)
end

handleMouseOnConsignmentSaleIconTooltipSale = function(index)
  -- function num : 0_5 , upvalues : ConsignmentSaleManager
  if ConsignmentSaleManager._isShowMyList == true then
    tooltipIndex = ConsignmentSaleManager._static_currentPage * 10 + index
  else
    if index == 0 then
      return 
    end
    tooltipIndex = ConsignmentSaleManager._static_currentPage * 8 + index - 2
  end
  Panel_Tooltip_Item_Show((ToClient_RequestConsignmentSaleListAt(tooltipIndex)):getItem(), (((ConsignmentSaleManager._saleList)[index])._itemIcon).icon, false, true)
end

showMessageConsignmentRetrieveTop = function()
  -- function num : 0_6 , upvalues : ConsignmentSaleManager, UI_PP
  local salesData = ToClient_RequestConsignmentSaleTopListAt(ConsignmentSaleManager._currentIndex)
  local gatherMoney = (Int64toInt32(salesData._gatherMoney))
  local messageboxData = nil
  if salesData:getItem() == nil then
    messageboxData = {title = "", content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_RETRIEVE_MESSAGE_0", "gatherMoney", gatherMoney), functionYes = executeConsignmentRetrieveTop, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  else
    if gatherMoney > 0 then
      messageboxData = {title = "", content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_RETRIEVE_MESSAGE_1", "gatherMoney", gatherMoney), functionYes = executeConsignmentRetrieveTop, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    else
      messageboxData = {title = "", content = PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_RETRIEVE_MESSAGE_2"), functionYes = executeConsignmentRetrieveTop, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    end
  end
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

showMessageConsignmentRetrieveSale = function()
  -- function num : 0_7 , upvalues : ConsignmentSaleManager, UI_PP
  local salesData = ToClient_RequestConsignmentSaleListAt(ConsignmentSaleManager._currentIndex)
  local gatherMoney = (Int64toInt32(salesData._gatherMoney))
  local messageboxData = nil
  if salesData:getItem() == nil then
    messageboxData = {title = "", content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_RETRIEVE_MESSAGE_0", "gatherMoney", gatherMoney), functionYes = executeConsignmentRetrieveSale, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  else
    if gatherMoney > 0 then
      messageboxData = {title = "", content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_RETRIEVE_MESSAGE_1", "gatherMoney", gatherMoney), functionYes = executeConsignmentRetrieveSale, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    else
      messageboxData = {title = "", content = PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_RETRIEVE_MESSAGE_2"), functionYes = executeConsignmentRetrieveSale, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    end
  end
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

executeConsignmentRetrieveTop = function()
  -- function num : 0_8 , upvalues : ConsignmentSaleManager
  ToClient_RequestRetrieveFromConsignmentSaleTopList(ConsignmentSaleManager._currentIndex)
  ToClient_RequestRecontactInstallation()
end

executeConsignmentRetrieveSale = function()
  -- function num : 0_9 , upvalues : ConsignmentSaleManager
  ToClient_RequestRetrieveFromConsignmentSale(ConsignmentSaleManager._currentIndex)
  ToClient_RequestRecontactInstallation()
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  if ConsignmentSaleManager._isShowMyList == true then
    ConsignmentSaleManager._isUpdate = false
    ToClient_RequestGetConsignmentSaleMyList()
  end
end

showMessageConsignmentBuyTop = function()
  -- function num : 0_10 , upvalues : UI_PP
  local messageboxData = {title = "", content = PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUY_MESSAGE"), functionYes = executeConsignmentBuyTop, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

showMessageConsignmentBuySale = function()
  -- function num : 0_11 , upvalues : UI_PP
  local messageboxData = {title = "", content = PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUY_MESSAGE"), functionYes = executeConsignmentBuySale, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

executeConsignmentBuyTop = function()
  -- function num : 0_12 , upvalues : ConsignmentSaleManager
  local consignmentData = ToClient_RequestConsignmentSaleTopListAt(ConsignmentSaleManager._currentIndex)
  Panel_NumberPad_Show(true, ((consignmentData:getItem()):get()):getCount_s64(), 0, handleClickedNumberPadConsignmentBuyTop)
end

executeConsignmentBuySale = function()
  -- function num : 0_13 , upvalues : ConsignmentSaleManager
  local consignmentData = ToClient_RequestConsignmentSaleListAt(ConsignmentSaleManager._currentIndex)
  Panel_NumberPad_Show(true, ((consignmentData:getItem()):get()):getCount_s64(), 0, handleClickedNumberPadConsignmentBuySale)
end

handleClickedNumberPadConsignmentBuyTop = function(itemCount)
  -- function num : 0_14 , upvalues : ConsignmentSaleManager
  ToClient_RequestBuyFromConsignmentSaleTopList(ConsignmentSaleManager._currentIndex, itemCount)
  ToClient_RequestRecontactInstallation()
end

handleClickedNumberPadConsignmentBuySale = function(itemCount)
  -- function num : 0_15 , upvalues : ConsignmentSaleManager
  ToClient_RequestBuyFromConsignmentSale(ConsignmentSaleManager._currentIndex, itemCount)
  if ConsignmentSaleManager._isShowMyList == true then
    ToClient_RequestGetConsignmentSaleMyList()
  else
    ToClient_RequestRecontactInstallation()
  end
end

HandleClickedShowComboBoxConsignmentCommission = function()
  -- function num : 0_16 , upvalues : ConsignmentSaleManager
  local list = (ConsignmentSaleManager._comboCommission):GetListControl()
  list:addInputEvent("Mouse_LUp", "HandleClickedSelectComboBoxConsignmentCommission()")
  ;
  (ConsignmentSaleManager._comboCommission):ToggleListbox()
end

HandleClickedSelectComboBoxConsignmentCommission = function()
  -- function num : 0_17 , upvalues : ConsignmentSaleManager
  local selectIndex = (ConsignmentSaleManager._comboCommission):GetSelectIndex()
  ;
  (ConsignmentSaleManager._comboCommission):SetSelectItemIndex(selectIndex)
  ;
  (ConsignmentSaleManager._comboCommission):ToggleListbox()
end

HandleClickedShowComboBoxConsignmentSaleDate = function()
  -- function num : 0_18 , upvalues : ConsignmentSaleManager
  local list = (ConsignmentSaleManager._comboSellDate):GetListControl()
  list:addInputEvent("Mouse_LUp", "HandleClickedSelectComboBoxConsignmentSellDate()")
  ;
  (ConsignmentSaleManager._comboSellDate):ToggleListbox()
end

HandleClickedSelectComboBoxConsignmentSellDate = function()
  -- function num : 0_19 , upvalues : ConsignmentSaleManager
  local selectIndex = (ConsignmentSaleManager._comboSellDate):GetSelectIndex()
  ;
  (ConsignmentSaleManager._comboSellDate):SetSelectItemIndex(selectIndex)
  ;
  (ConsignmentSaleManager._comboSellDate):ToggleListbox()
end

HandleClickedConsignmentEditRegisterPrice = function(index)
  -- function num : 0_20 , upvalues : IM, ConsignmentSaleManager
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  ;
  (((ConsignmentSaleManager._saleList)[index])._editRegisterPrice):SetEditText("", true)
end

HandleClickedConsignmentEditSalePrice = function()
  -- function num : 0_21 , upvalues : IM, ConsignmentSaleManager
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  ;
  (((ConsignmentSaleManager._saleList)[0])._editSalePrice):SetEditText("", true)
end

HandleClickedConsignmentEditRegistMinimum = function()
  -- function num : 0_22 , upvalues : IM, ConsignmentSaleManager
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  ;
  (ConsignmentSaleManager._editRegistMinimum):SetEditText("", true)
end

HandleClickedConsignmentEditBalance = function()
  -- function num : 0_23 , upvalues : IM, ConsignmentSaleManager
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  ;
  (ConsignmentSaleManager._editBalance):SetEditText("", true)
end

FGlobal_CheckCurrentConsignmentSaleUiEdit = function(targetUI)
  -- function num : 0_24 , upvalues : ConsignmentSaleManager
  local checkUi = false
  if targetUI == nil then
    return false
  end
  if targetUI:GetKey() == (((ConsignmentSaleManager._saleList)[0])._editRegisterPrice):GetKey() then
    checkUi = true
  else
    if targetUI:GetKey() == (((ConsignmentSaleManager._saleList)[0])._editSalePrice):GetKey() then
      checkUi = true
    else
      if targetUI:GetKey() == (ConsignmentSaleManager._editRegistMinimum):GetKey() then
        checkUi = true
      else
        if targetUI:GetKey() == (ConsignmentSaleManager._editBalance):GetKey() then
          checkUi = true
        end
      end
    end
  end
  return checkUi
end

FGlobal_ConsignmentSaleClearFocusEdit = function()
  -- function num : 0_25 , upvalues : ConsignmentSaleManager, IM
  (ConsignmentSaleManager._editRegistMinimum):SetEditText(ConsignmentSaleManager._registGoldMinimum, true)
  ClearFocusEdit()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

HandleClickedConsignmentListLeft = function()
  -- function num : 0_26 , upvalues : ConsignmentSaleManager
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  ConsignmentSaleManager._static_currentPage = ConsignmentSaleManager._static_currentPage - 1
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  if ConsignmentSaleManager._static_currentPage < 0 then
    ConsignmentSaleManager._static_currentPage = 0
  end
  if ConsignmentSaleManager._isShowMyList == true then
    ConsignmentSaleManager:UpdateMyData(ConsignmentSaleManager._isOwner)
  else
    ConsignmentSaleManager:UpdateData(ConsignmentSaleManager._isOwner)
  end
end

HandleClickedConsignmentListRight = function()
  -- function num : 0_27 , upvalues : ConsignmentSaleManager
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  ConsignmentSaleManager._static_currentPage = ConsignmentSaleManager._static_currentPage + 1
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  if ConsignmentSaleManager._isShowMyList == true then
    if ConsignmentSaleManager._lastPage < ConsignmentSaleManager._static_currentPage then
      ConsignmentSaleManager._static_currentPage = ConsignmentSaleManager._static_currentPage - 1
    end
    ConsignmentSaleManager:UpdateMyData(ConsignmentSaleManager._isOwner)
  else
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

    if ConsignmentSaleManager._lastPage < ConsignmentSaleManager._static_currentPage then
      ConsignmentSaleManager._static_currentPage = ConsignmentSaleManager._static_currentPage - 1
    end
    ConsignmentSaleManager:UpdateData(ConsignmentSaleManager._isOwner)
  end
end

handleClickedConsignmentClose = function()
  -- function num : 0_28 , upvalues : ConsignmentSaleManager
  ConsignmentSaleManager:Close()
end

handleClickedConsignmentStartStop = function()
  -- function num : 0_29 , upvalues : ConsignmentSaleManager
  if ToClient_RequestBusinessIsActive() == false then
    local selectCommissionIndex = (ConsignmentSaleManager._comboCommission):GetSelectIndex()
    local selectSellDateIndex = (ConsignmentSaleManager._comboSellDate):GetSelectIndex()
    local minRegisterPrice = ((ConsignmentSaleManager._editRegistMinimum):GetEditNumber())
    local messageboxData = nil
    if toInt64(0, 0) < minRegisterPrice then
      ToClient_RequestSettingToConsignmentSale(selectCommissionIndex, selectSellDateIndex + 1, minRegisterPrice)
      ToClient_RequestGetConsignmentSaleInfo()
    else
      if minRegisterPrice <= toInt64(0, 0) then
        messageboxData = {title = "", content = PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_APPLY_MESSAGE_2"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
        return 
      end
    end
  end
  do
    ToClient_RequestBusinessToggleActive()
    ToClient_RequestRecontactInstallation()
  end
end

handleClickedConsignmentMyList = function()
  -- function num : 0_30 , upvalues : ConsignmentSaleManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  ConsignmentSaleManager._static_currentPage = 0
  if ConsignmentSaleManager._isShowMyList == false then
    ToClient_RequestGetConsignmentSaleMyList()
  else
    ToClient_RequestRecontactInstallation()
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  ConsignmentSaleManager._slotNo = 0
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  ConsignmentSaleManager._itemCount = 0
end

FGlobal_ConsignmentRegisterItemFromInventory = function(count, slotNo)
  -- function num : 0_31 , upvalues : ConsignmentSaleManager
  if ConsignmentSaleManager._checkRegisterButton == true then
    Panel_NumberPad_Show(true, count, slotNo, handleClickedConsignmentNumberPad)
  end
end

handleClickedConsignmentNumberPad = function(count, slotNo)
  -- function num : 0_32 , upvalues : ConsignmentSaleManager
  local itemWrapper = getInventoryItem(slotNo)
  if itemWrapper:isMaxEndurance() then
    (((ConsignmentSaleManager._saleList)[0])._itemIcon):setItemByStaticStatus(itemWrapper:getStaticStatus(), count)
    local enchantCount = (((itemWrapper:getStaticStatus()):get())._key):getEnchantLevel()
    ;
    (((ConsignmentSaleManager._saleList)[0])._staticItemName):SetText((itemWrapper:getStaticStatus()):getName())
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R4 in 'UnsetPending'

    ConsignmentSaleManager._slotNo = slotNo
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R4 in 'UnsetPending'

    ConsignmentSaleManager._itemCount = count
    if Int64toInt32(count) > 1 then
      (((ConsignmentSaleManager._saleList)[0])._staticBuyPrice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_STATICBUYPRICE_1"))
    else
      ;
      (((ConsignmentSaleManager._saleList)[0])._staticBuyPrice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_STATICBUYPRICE_0"))
    end
  end
end

handleClickedShowMessageConsignmentRegister = function()
  -- function num : 0_33 , upvalues : ConsignmentSaleManager, UI_PP
  local registerGold = (((ConsignmentSaleManager._saleList)[0])._editRegisterPrice):GetEditNumber()
  local saleGold = (((ConsignmentSaleManager._saleList)[0])._editSalePrice):GetEditNumber()
  if ConsignmentSaleManager._itemCount == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_REGISTER_MESSAGE_1"))
    return 
  end
  if registerGold == nil or toInt64(0, 0) == registerGold then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_REGISTERGOLD_LESS_0"))
    return 
  end
  if saleGold == nil or toInt64(0, 0) == saleGold then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_SALEGOLD_LESS_0"))
    return 
  end
  if registerGold == nil or toInt64(0, 0) == registerGold then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_REGISTERGOLD_NIL"))
    return 
  end
  if registerGold < toInt64(0, ConsignmentSaleManager._registGoldMinimum) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_REGISTERGOLD_LESS_MIN"))
    return 
  end
  if saleGold <= toInt64(0, 0) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_SALEGOLD_NIL"))
    return 
  end
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  local selfPlayer = selfPlayerWrapper:get()
  local inventory = selfPlayer:getInventory()
  local commission = registerGold
  if inventory:getMoney_s64() < commission then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_NOT_ENOUGH_REGISTERGOLD"))
    return 
  end
  if registerGold / saleGold < 0.2 then
    local messageboxData = {title = "", content = "\n" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_REGISTERGOLD_VALUE", "registerGold", registerGold) .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_SALEGOLD_VALUE", "saleGold", saleGold) .. "\n\n<PAColor0xFFFFAB6D>" .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_YOUDONT_REFUNDS_REGISTERGOLD") .. "<PAOldColor>\n\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_REGISTER_MESSAGE_0"), functionYes = executeConsignmentRegister, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData, "top")
  else
    do
      local messageboxData = {title = "", content = "\n<PAColor0xFFDDCD82>" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_REGISTERGOLD_VALUE", "registerGold", registerGold) .. "<PAOldColor>\n" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_SALEGOLD_VALUE", "saleGold", saleGold) .. "\n\n" .. "<PAColor0xFFF26A6A>" .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_CAUTION_OVER_REGISTERGOLD") .. "\n<PAColor0xFFF26A6A>" .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_YOUDONT_REFUNDS_REGISTERGOLD") .. "<PAOldColor>\n\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_REGISTER_MESSAGE_0"), functionYes = executeConsignmentRegister, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData, "top")
    end
  end
end

executeConsignmentRegister = function()
  -- function num : 0_34 , upvalues : ConsignmentSaleManager
  local registerGold = (((ConsignmentSaleManager._saleList)[0])._editRegisterPrice):GetEditNumber()
  local saleGold = (((ConsignmentSaleManager._saleList)[0])._editSalePrice):GetEditNumber()
  ToClient_RequestRegisterToConsignmentSale(ConsignmentSaleManager._slotNo, ConsignmentSaleManager._itemCount, registerGold, saleGold)
  ToClient_RequestRecontactInstallation()
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

  ConsignmentSaleManager._checkRegisterButton = false
  InventoryWindow_Close()
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  ConsignmentSaleManager._slotNo = 0
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

  ConsignmentSaleManager._itemCount = 0
end

handleClickedConsignmentRegisterItem = function()
  -- function num : 0_35 , upvalues : ConsignmentSaleManager
  if ToClient_RequestBusinessIsActive() then
    (((ConsignmentSaleManager._saleList)[0])._staticBack):SetShow(true)
    ;
    (((ConsignmentSaleManager._saleList)[0])._itemIcon):clearItem()
    ;
    (((ConsignmentSaleManager._saleList)[0])._staticItemName):SetText("")
    ;
    (((ConsignmentSaleManager._saleList)[0])._textBuyPrice):SetShow(false)
    ;
    (((ConsignmentSaleManager._saleList)[0])._textRegisterPrice):SetShow(false)
    ;
    (((ConsignmentSaleManager._saleList)[0])._editRegisterPrice):SetShow(true)
    ;
    (((ConsignmentSaleManager._saleList)[0])._editRegisterPrice):SetEditText("")
    ;
    (((ConsignmentSaleManager._saleList)[0])._editSalePrice):SetShow(true)
    ;
    (((ConsignmentSaleManager._saleList)[0])._editSalePrice):SetEditText("")
    ;
    (((ConsignmentSaleManager._saleList)[0])._buttonRegister):SetShow(true)
    ;
    (((ConsignmentSaleManager._saleList)[0])._staticRemainedTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_COMMISSION", "commission", ConsignmentSaleManager._currentCommission) .. "%")
    ;
    (((ConsignmentSaleManager._saleList)[0])._staticRemainedTime):SetShow(true)
    ;
    (ConsignmentSaleManager._buttonRegisterItem):SetShow(false)
    -- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

    ConsignmentSaleManager._checkRegisterButton = true
    Inventory_SetShow(true)
  end
end

handleClickedConsignmentWithdrawGold = function()
  -- function num : 0_36 , upvalues : ConsignmentSaleManager, UI_PP
  local gold = (ConsignmentSaleManager._editBalance):GetEditNumber()
  if gold <= toInt64(0, 0) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_VENDINGMACHINE_PERFORM_MESSAGE_0"))
    return 
  else
    if toInt64(0, ConsignmentSaleManager._currentHoldingMoney) < gold then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_VENDINGMACHINE_PERFORM_MESSAGE_1"))
      return 
    end
  end
  local messageboxData = {title = "", content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_WITHDRAW", "gold", gold), functionYes = handleClickedConsignmentWithdrawGoldContinue, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

handleClickedConsignmentWithdrawGoldContinue = function()
  -- function num : 0_37 , upvalues : ConsignmentSaleManager, IM
  local gold = (ConsignmentSaleManager._editBalance):GetEditNumber()
  ToClient_RequestBusinessWithdrawMoney(gold)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ClearFocusEdit()
end

ConsignmentSaleManager.UpdateData = function(self, isOwner)
  -- function num : 0_38
  self._isShowMyList = false
  self:UpdateDataCommon(isOwner)
  local count = ToClient_RequestConsignmentSaleListCount()
  self._lastPage = count / 8
  ;
  (self._textListNo):SetText(self._static_currentPage + 1 .. "/" .. (string.format)("%d", self._lastPage + 1))
  for index = 0, 9 do
    if index == 0 then
      (((self._saleList)[index])._staticBack):SetShow(false)
      ;
      (((self._saleList)[index])._itemIcon):clearItem()
      ;
      (((self._saleList)[index])._buttonBuy):SetShow(false)
    else
      if index == 1 then
        ((self._saleList)[index]):SetData(nil)
      else
        local salesindex = 0
        if index > 1 then
          salesindex = self._static_currentPage * 8 + index - 2
        end
        if salesindex < count then
          local salesData = ToClient_RequestConsignmentSaleListAt(salesindex)
          ;
          ((self._saleList)[index]):SetData(salesData)
        else
          do
            do
              ;
              ((self._saleList)[index]):SetData(nil)
              -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

ConsignmentSaleManager.UpdateMyData = function(self, isOwner)
  -- function num : 0_39
  self._isShowMyList = true
  self:UpdateDataCommon(isOwner)
  local count = ToClient_RequestConsignmentSaleListCount()
  self._lastPage = count / 10
  ;
  (self._textListNo):SetText(self._static_currentPage + 1 .. "/" .. (string.format)("%d", self._lastPage + 1))
  ;
  (((self._saleList)[0])._staticBack):SetShow(true)
  ;
  (((self._saleList)[0])._buttonBuy):SetShow(true)
  ;
  (((self._saleList)[0])._textBuyPrice):SetShow(true)
  ;
  (((self._saleList)[0])._textRegisterPrice):SetShow(true)
  for index = 0, 9 do
    salesindex = self._static_currentPage * 10 + index
    if salesindex < count then
      local salesData = ToClient_RequestConsignmentSaleListAt(salesindex)
      ;
      ((self._saleList)[index]):SetData(salesData)
    else
      do
        do
          ;
          ((self._saleList)[index]):SetData(nil)
          -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC70: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

ConsignmentSaleManager.SetShow = function(self, isOwner, isShow)
  -- function num : 0_40
  ;
  (self._editRegistMinimum):SetShow(not isOwner or isShow)
  ;
  (self._editBalance):SetShow(not isOwner or isShow)
  ;
  (self._comboCommission):SetShow(not isOwner or isShow)
  ;
  (self._comboSellDate):SetShow(not isOwner or isShow)
  ;
  (self._buttonWithdrawGold):SetShow(not isOwner or isShow)
  ;
  (self._textSellCommission):SetShow(not isOwner or isShow)
  ;
  (self._textPercent):SetShow(not isOwner or isShow)
  ;
  (self._textDate):SetShow(not isOwner or isShow)
  ;
  (self._iconRegistMinimum):SetShow(not isOwner or isShow)
  ;
  (self._iconBalanceInput):SetShow(not isOwner or isShow)
  ;
  (self._sellInfoBG):SetShow(not isOwner or isShow)
  ;
  (self._textWhatFor):SetShow(not isOwner or isShow)
  ;
  (self._textWhatForNo):SetShow(not isOwner or isShow)
  ;
  (self._updateIcon):SetShow(ToClient_RequestBusinessIsActive())
end

ConsignmentSaleManager.UpdateDataCommon = function(self, isOwner)
  -- function num : 0_41 , upvalues : UI_color, ConsignmentSaleManager
  local count = ToClient_RequestConsignmentSaleTopListCount()
  for index = 0, 4 do
    if index < count then
      local salesData = ToClient_RequestConsignmentSaleTopListAt(index)
      ;
      ((self._topList)[index]):SetData(salesData)
      ;
      (((self._topList)[index])._buttonBuy):SetShow(not self._isShowMyList)
    else
      do
        do
          ;
          ((self._topList)[index]):SetData(nil)
          -- DECOMPILER ERROR at PC29: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC29: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC29: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (self._textListNo):SetShow(true)
  ;
  (self._buttonListLeft):SetShow(true)
  ;
  (self._buttonListRight):SetShow(true)
  ;
  (((self._saleList)[0])._editRegisterPrice):SetShow(false)
  ;
  (((self._saleList)[0])._editSalePrice):SetShow(false)
  ;
  (((self._saleList)[0])._buttonRegister):SetShow(false)
  if self._isShowMyList == true then
    (self._static_CenterLine):SetShow(false)
    ;
    (self._buttonMyList):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUTTON_MYLIST"))
    ;
    (self._buttonMyList):SetShow(true)
    ;
    (self._buttonRegisterItem):SetShow(false)
    ;
    (self._title_Mylist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_TITLE_MYLIST"))
    ;
    (self._title_Mylist):ChangeTextureInfoName("New_UI_Common_forLua/Window/Guild/Guild_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self._title_Mylist, 152, 1, 164, 15)
    ;
    ((self._title_Mylist):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (self._title_Mylist):setRenderTexture((self._title_Mylist):getBaseTexture())
    self:SetShow(isOwner, false)
    ;
    (self._buttonStartStop):SetShow(false)
    ;
    (self._textRegistMinimum):SetShow(false)
    ;
    (self._textSellDate):SetShow(false)
    ;
    (self._textRegistMinimumNo):SetShow(false)
    ;
    (self._textSellDateNo):SetShow(false)
    ;
    (self._textBalance):SetShow(false)
    ;
    (self._iconBalance):SetShow(false)
    ;
    (self._sellInfoBG):SetShow(false)
    ;
    (self._textWhatFor):SetShow(false)
    ;
    (self._textWhatForNo):SetShow(false)
  else
    do
      ToClient_RequestGetConsignmentSaleInfo()
      ;
      (self._static_CenterLine):SetShow(isOwner)
      ;
      (self._buttonMyList):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUTTON_ITEMLIST"))
      ;
      (self._buttonMyList):SetShow(true)
      ;
      (self._buttonRegisterItem):SetShow(true)
      ;
      (self._title_Mylist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_TITLE_ITEMLIST"))
      ;
      (self._title_Mylist):ChangeTextureInfoName("New_UI_Common_forLua/Window/Guild/Guild_00.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(self._title_Mylist, 92, 1, 104, 15)
      ;
      ((self._title_Mylist):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (self._title_Mylist):setRenderTexture((self._title_Mylist):getBaseTexture())
      if ToClient_RequestBusinessIsActive() then
        (self._buttonStartStop):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUTTON_STOP"))
        ;
        (self._buttonRegisterItem):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUTTON_REGISTER"))
        ;
        (self._buttonRegisterItem):ChangeTextureInfoName("New_UI_Common_forLua/Window/HouseInfo/HouseInfo_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(self._buttonRegisterItem, 1, 1, 391, 111)
        ;
        ((self._buttonRegisterItem):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (self._buttonRegisterItem):setRenderTexture((self._buttonRegisterItem):getBaseTexture())
        ;
        (self._buttonRegisterItem):SetFontColor(UI_color.C_FF6DC6FF)
        ;
        (self._buttonRegisterItem):SetIgnore(false)
        self:SetShow(isOwner, false)
        ;
        (self._buttonStartStop):SetShow(isOwner)
        ;
        (self._textRegistMinimum):SetShow(true)
        ;
        (self._textSellDate):SetShow(true)
        ;
        (self._textRegistMinimumNo):SetShow(true)
        ;
        (self._textSellDateNo):SetShow(true)
        ;
        (self._textBalance):SetShow(isOwner)
        ;
        (self._iconBalance):SetShow(isOwner)
        ;
        (self._sellInfoBG):SetShow(true)
        ;
        (self._textWhatFor):SetShow(true)
        ;
        (self._textWhatForNo):SetShow(true)
      else
        do
          ;
          (self._buttonStartStop):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUTTON_START"))
          ;
          (self._buttonRegisterItem):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUTTON_NOTREGISTER"))
          ;
          (self._buttonRegisterItem):ChangeTextureInfoName("New_UI_Common_forLua/Window/HouseInfo/HouseInfo_00.dds")
          do
            local x1, y1, x2, y2 = setTextureUV_Func(self._buttonRegisterItem, 1, 334, 391, 444)
            ;
            ((self._buttonRegisterItem):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self._buttonRegisterItem):setRenderTexture((self._buttonRegisterItem):getBaseTexture())
            ;
            (self._buttonRegisterItem):SetFontColor(UI_color.C_FFF26A6A)
            ;
            (self._buttonRegisterItem):SetIgnore(true)
            self:SetShow(isOwner, true)
            ;
            (self._editBalance):SetEditText("", true)
            ;
            (self._buttonStartStop):SetShow(isOwner)
            ;
            (self._textRegistMinimum):SetShow(isOwner)
            ;
            (self._textSellDate):SetShow(isOwner)
            ;
            (self._textRegistMinimumNo):SetShow(false)
            ;
            (self._textSellDateNo):SetShow(false)
            ;
            (self._textBalance):SetShow(isOwner)
            ;
            (self._iconBalance):SetShow(isOwner)
            ;
            (self._sellInfoBG):SetShow(isOwner)
            ;
            (self._textWhatFor):SetShow(isOwner)
            ;
            (self._textWhatForNo):SetShow(isOwner)
            self._isOwner = isOwner
            -- DECOMPILER ERROR at PC420: Confused about usage of register: R3 in 'UnsetPending'

            ConsignmentSaleManager._checkRegisterButton = false
            if isOwner == true then
              ToClient_RequestGetHoldingMoney()
            end
          end
        end
      end
    end
  end
end

ConsignmentSaleManager.SetRegistrableItemClassify = function(self)
  -- function num : 0_42
  local itemClassifyCount = ToClient_RequestGetRegistrableItemCount()
  local str = ""
  do
    if itemClassifyCount <= 1 then
      local actor = interaction_getInteractable()
      str = (actor:get()):getStaticStatusName()
      ;
      (self._title):SetText(str)
      return 
    end
    local count = 0
    for i = 0, itemClassifyCount - 1 do
      local itemClassify = ToClient_RequestGetRegistrableItemAt(i)
      if itemClassify ~= -1 then
        if itemClassify == 0 then
          str = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_ETC", "str", str)
          count = count + 1
        else
          if itemClassify == 1 then
            str = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_WEAPON", "str", str)
            count = count + 1
          else
            if itemClassify == 2 then
              str = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_ARMOR", "str", str)
              count = count + 1
            else
              if itemClassify == 3 then
                str = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_ACCESSORIES", "str", str)
                count = count + 1
              end
            end
          end
        end
        if i > 0 and i < count - 1 then
          str = str .. ", "
        end
      end
    end
    if count == 0 then
      str = ""
    else
      if count == 1 then
        str = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_CONSIGNMENT")
      else
        if count == 4 then
          str = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_CONSIGNMENT_ALL")
        else
          str = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSINGCONSIGNMENTSALE_CONSIGNMENT_ETC", "str", str)
        end
      end
    end
    ;
    (self._title):SetText(str)
  end
end

ConsignmentSaleManager.Show = function(self)
  -- function num : 0_43 , upvalues : ConsignmentSaleManager
  ConsignmentSaleManager:SetRegistrableItemClassify()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if Panel_Housing_ConsignmentSale:IsShow() == false then
    ConsignmentSaleManager._slotNo = 0
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

    ConsignmentSaleManager._itemCount = 0
    FGlobal_SetInventoryDragNoUse(Panel_Housing_ConsignmentSale)
    Panel_Housing_ConsignmentSale:SetShow(true, false)
  end
end

ConsignmentSaleManager.Close = function(self)
  -- function num : 0_44 , upvalues : IM, ConsignmentSaleManager
  if Panel_Housing_ConsignmentSale:IsShow() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    Panel_Housing_ConsignmentSale:SetShow(false, false)
    ClearFocusEdit()
    FGlobal_UpdateInventorySlotData()
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

    ConsignmentSaleManager._slotNo = 0
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

    ConsignmentSaleManager._itemCount = 0
  end
end

ConsignmentSaleManager:initialize()
registerEvent("FromClient_EventShowSetConsignmentSale", "FromClient_EventShowSetConsignmentSale")
registerEvent("FromClient_EventShowRegisterConsignmentSale", "FromClient_EventShowRegisterConsignmentSale")
registerEvent("FromClient_EventShowConsignmentSale", "FromClient_EventShowConsignmentSale")
registerEvent("FromClient_EventShowMyConsignmentSale", "FromClient_EventShowMyConsignmentSale")
registerEvent("FromClient_EventShowHoldingMoneyManager", "FromClient_EventShowConsignmentHoldingMoneyManager")
FromClient_EventShowSetConsignmentSale = function(isOwner)
  -- function num : 0_45 , upvalues : ConsignmentSaleManager, UI_color, IM
  (ConsignmentSaleManager._buttonMyList):SetShow(false)
  ;
  (ConsignmentSaleManager._buttonRegisterItem):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BUTTON_NOTREGISTER"))
  ;
  (ConsignmentSaleManager._buttonRegisterItem):ChangeTextureInfoName("New_UI_Common_forLua/Window/HouseInfo/HouseInfo_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(ConsignmentSaleManager._buttonRegisterItem, 1, 334, 391, 444)
  ;
  ((ConsignmentSaleManager._buttonRegisterItem):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (ConsignmentSaleManager._buttonRegisterItem):setRenderTexture((ConsignmentSaleManager._buttonRegisterItem):getBaseTexture())
  ;
  (ConsignmentSaleManager._buttonRegisterItem):SetFontColor(UI_color.C_FFF26A6A)
  ;
  (ConsignmentSaleManager._buttonRegisterItem):SetIgnore(true)
  ;
  (ConsignmentSaleManager._editRegistMinimum):SetEditText("", true)
  ;
  (ConsignmentSaleManager._comboCommission):SetSelectItemIndex(0)
  ;
  (ConsignmentSaleManager._comboSellDate):SetSelectItemIndex(0)
  ConsignmentSaleManager:SetShow(isOwner, true)
  ;
  (ConsignmentSaleManager._editBalance):SetShow(false)
  ;
  (ConsignmentSaleManager._buttonStartStop):SetShow(false)
  ;
  (ConsignmentSaleManager._buttonWithdrawGold):SetShow(false)
  ;
  (ConsignmentSaleManager._textRegistMinimum):SetShow(true)
  ;
  (ConsignmentSaleManager._textSellDate):SetShow(true)
  ;
  (ConsignmentSaleManager._textRegistMinimumNo):SetShow(not isOwner)
  ;
  (ConsignmentSaleManager._textSellDateNo):SetShow(not isOwner)
  ;
  (ConsignmentSaleManager._textBalance):SetShow(false)
  ;
  (ConsignmentSaleManager._iconBalance):SetShow(false)
  ;
  (ConsignmentSaleManager._iconBalanceInput):SetShow(false)
  ;
  (ConsignmentSaleManager._textListNo):SetShow(false)
  ;
  (ConsignmentSaleManager._buttonListLeft):SetShow(false)
  ;
  (ConsignmentSaleManager._buttonListRight):SetShow(false)
  ;
  (ConsignmentSaleManager._updateIcon):SetShow(false)
  for index = 0, 9 do
    if index < 5 then
      (((ConsignmentSaleManager._topList)[index])._staticBack):SetShow(false)
    end
    ;
    (((ConsignmentSaleManager._saleList)[index])._staticBack):SetShow(false)
  end
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ConsignmentSaleManager:Show()
  -- DECOMPILER ERROR at PC177: Confused about usage of register: R5 in 'UnsetPending'

  ConsignmentSaleManager._isOwner = isOwner
end

FromClient_EventShowRegisterConsignmentSale = function(commission, minRegisterMoney, saleDate)
  -- function num : 0_46 , upvalues : ConsignmentSaleManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R3 in 'UnsetPending'

  ConsignmentSaleManager._currentCommission = commission
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R3 in 'UnsetPending'

  ConsignmentSaleManager._registGoldMinimum = minRegisterMoney
  ;
  (ConsignmentSaleManager._textRegistMinimumNo):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_GOLD", "minRegisterMoney", minRegisterMoney))
  ;
  (ConsignmentSaleManager._textSellDateNo):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_DATE", "saleDate", saleDate / 86400000))
  ;
  (ConsignmentSaleManager._editRegistMinimum):SetEditText(minRegisterMoney, true)
  ;
  (ConsignmentSaleManager._comboCommission):SetSelectItemIndex(commission)
  ;
  (ConsignmentSaleManager._comboSellDate):SetSelectItemIndex(saleDate / 86400000 - 1)
end

FromClient_EventShowConsignmentSale = function(isOwner)
  -- function num : 0_47 , upvalues : ConsignmentSaleManager, IM
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  if ConsignmentSaleManager._isUpdate == false then
    ConsignmentSaleManager._isUpdate = true
    return 
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  if Panel_Housing_ConsignmentSale:GetShow() == false then
    ConsignmentSaleManager._static_currentPage = 0
  end
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ConsignmentSaleManager:Show()
  ConsignmentSaleManager:UpdateData(isOwner)
end

FromClient_EventShowMyConsignmentSale = function(isOwner)
  -- function num : 0_48 , upvalues : IM, ConsignmentSaleManager
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ConsignmentSaleManager:UpdateMyData(isOwner)
end

FromClient_EventShowConsignmentHoldingMoneyManager = function(holdingMoney)
  -- function num : 0_49 , upvalues : ConsignmentSaleManager
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ConsignmentSaleManager._currentHoldingMoney = Int64toInt32(holdingMoney)
  ;
  (ConsignmentSaleManager._textBalance):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_BALANCE", "holdingMoney", tostring(Int64toInt32(holdingMoney))))
end


