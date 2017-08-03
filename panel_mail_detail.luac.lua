-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\mail\panel_mail_detail.luac 

-- params : ...
-- function num : 0
Panel_Mail_Detail:ActiveMouseEventEffect(true)
Panel_Mail_Detail:setGlassBackground(true)
Panel_Mail_Detail:RegisterShowEventFunc(true, "Mail_Detail_ShowAni()")
Panel_Mail_Detail:RegisterShowEventFunc(false, "Mail_Detail_HideAni()")
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Mail_Detail_ShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Left)(Panel_Mail_Detail)
end

Mail_Detail_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Mail_Detail:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local mailHideAni = Panel_Mail_Detail:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  mailHideAni:SetStartColor(UI_color.C_FFFFFFFF)
  mailHideAni:SetEndColor(UI_color.C_00FFFFFF)
  mailHideAni:SetStartIntensity(3)
  mailHideAni:SetEndIntensity(1)
  mailHideAni.IsChangeChild = true
  mailHideAni:SetHideAtEnd(true)
  mailHideAni:SetDisableWhileAni(true)
end

local _frame = (UI.getChildControl)(Panel_Mail_Detail, "Frame_MailText")
local _frameContents = (UI.getChildControl)(_frame, "Frame_Contents")
local _frameScroll = (UI.getChildControl)(_frame, "Frame_Scroll")
local _frameScroll_Btn = (UI.getChildControl)(_frameScroll, "Scroll_Bar_CtrlButton")
local panel_SizeY = Panel_Mail_Detail:GetSizeY()
local mailDetail = {
slotConfig = {createIcon = true, createBorder = true, createMailCount = true, createEnchant = true, createCash = true}
, 
config = {slotX = 5, slotY = 5}
, _sender = (UI.getChildControl)(Panel_Mail_Detail, "StaticText_Sender"), _title = (UI.getChildControl)(Panel_Mail_Detail, "StaticText_Subtitle"), _contents = (UI.getChildControl)(_frameContents, "StaticText_Content"), _itemText = (UI.getChildControl)(Panel_Mail_Detail, "StaticText_Item_Message"), _iconBase = (UI.getChildControl)(Panel_Mail_Detail, "Static_Itemicon"), _buttonDelete = (UI.getChildControl)(Panel_Mail_Detail, "Button_Delete"), _buttonReceive = (UI.getChildControl)(Panel_Mail_Detail, "Button_Receive"), _buttonClose = (UI.getChildControl)(Panel_Mail_Detail, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Mail_Detail, "Button_Question"), _checkboxToWarehouse = (UI.getChildControl)(Panel_Mail_Detail, "CheckButton_Warehouse"), 
_itemSlot = {}
, openMailNo = nil}
mailDetail.init = function(self)
  -- function num : 0_2
  ;
  (UI.ASSERT)(self._sender ~= nil and type(self._sender) ~= "number", "StaticText_Sender")
  ;
  (UI.ASSERT)(self._title ~= nil and type(self._title) ~= "number", "StaticText_Subtitle")
  ;
  (UI.ASSERT)(self._contents ~= nil and type(self._contents) ~= "number", "StaticText_Content")
  ;
  (UI.ASSERT)(self._itemText ~= nil and type(self._itemText) ~= "number", "StaticText_Item_Message")
  ;
  (UI.ASSERT)(self._iconBase ~= nil and type(self._iconBase) ~= "number", "Static_Itemicon")
  ;
  (UI.ASSERT)(self._buttonDelete ~= nil and type(self._buttonDelete) ~= "number", "Button_Delete")
  ;
  (UI.ASSERT)(self._buttonClose ~= nil and type(self._buttonClose) ~= "number", "Button_Win_Close")
  ;
  (SlotItem.new)(self._itemSlot, "ItemIconSlot_", 0, self._iconBase, self.slotConfig)
  ;
  (self._itemSlot):createChild()
  ;
  ((self._itemSlot).icon):SetPosX((self.config).slotX)
  ;
  ((self._itemSlot).icon):SetPosY((self.config).slotY)
  ;
  ((self._itemSlot).icon):addInputEvent("Mouse_On", "Mail_ShowItemToolTip()")
  ;
  ((self._itemSlot).icon):addInputEvent("Mouse_Out", "Mail_HideItemToolTip()")
  ;
  (self._iconBase):SetShow(false)
  ;
  (self._checkboxToWarehouse):SetCheck(false)
  ;
  (self._checkboxToWarehouse):SetShow(false)
  -- DECOMPILER ERROR: 13 unprocessed JMP targets
end

Mail_ShowItemToolTip = function()
  -- function num : 0_3 , upvalues : mailDetail
  local self = mailDetail
  if RequestMail_getMailType() == 1 then
    local productKeyRaw = RequestMail_getMailCashProductNoRaw()
    FGlobal_CashShop_GoodsTooltipInfo_Open(productKeyRaw, (self._itemSlot).icon)
  else
    do
      if RequestMail_getMailType() == 2 then
        local mailIESS = RequestMail_getMailItemWrapper()
        Panel_Tooltip_Item_Show(mailIESS, (self._itemSlot).icon, false, true, nil)
      else
        do
          local mailIESS = mail_getMailItemStatic()
          Panel_Tooltip_Item_Show(mailIESS, (self._itemSlot).icon, true, false, nil)
        end
      end
    end
  end
end

Mail_HideItemToolTip = function()
  -- function num : 0_4
  if RequestMail_getMailType() == 1 then
    FGlobal_CashShop_GoodsTooltipInfo_Close()
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end

FromClient_ResponseMailGetItem = function(itemKey, itemCount_s64, immediateItem, isRelay)
  -- function num : 0_5 , upvalues : mailDetail
  local self = mailDetail
  if itemKey ~= 1 and not immediateItem then
    return 
  end
  local itemESSW = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
  local itemName = itemESSW:getName()
  local isWarehouse = (self._checkboxToWarehouse):IsCheck()
  if immediateItem then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MAIL_DETAIL_ALERT_IMMEDIATEITEM", "itemName", itemName))
  else
    if itemKey == 1 and (isWarehouse or isRelay) then
      Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MAIL_DETAIL_ALERT_GET_WAREHOUSE", "itemName", itemName, "itemCount", makeDotMoney(itemCount_s64)))
    end
  end
end

mailDetail.registMessageHandler = function(self)
  -- function num : 0_6
  registerEvent("ResponseMail_showDetail", "Mail_Detail_Open")
  registerEvent("FromClient_ResponseMailGetItem", "FromClient_ResponseMailGetItem")
end

mailDetail.registEventHandler = function(self)
  -- function num : 0_7
  (self._buttonClose):addInputEvent("Mouse_LUp", "Mail_Detail_Close()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelMailDetail\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelMailDetail\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelMailDetail\", \"false\")")
  ;
  (self._buttonDelete):addInputEvent("Mouse_LUp", "Mail_Detail_Delete()")
  ;
  ((self._itemSlot).icon):addInputEvent("Mouse_RUp", "Mail_Detail_GetItem()")
  ;
  (self._buttonReceive):addInputEvent("Mouse_LUp", "Mail_Detail_GetItem()")
end

Mail_Detail_Open = function(mailNo)
  -- function num : 0_8 , upvalues : mailDetail, UI_TM, _frame, _frameContents, _frameScroll, panel_SizeY
  if not Panel_Mail_Detail:IsShow() then
    Panel_Mail_Detail:SetShow(true, true)
  end
  FGlobal_CashShop_GoodsTooltipInfo_Close()
  Panel_Tooltip_Item_hideTooltip()
  local self = mailDetail
  self.openMailNo = mailNo
  ;
  (self._sender):SetText(RequestMail_getMailSenderName())
  ;
  (self._title):SetText(RequestMail_getMailTitle())
  ;
  (self._contents):SetAutoResize(true)
  ;
  (self._contents):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._contents):SetText(RequestMail_getMailContents())
  local textSizeY = (self._contents):GetSizeY()
  local frameSizeY = _frame:GetSizeY()
  _frameContents:SetSize(_frameContents:GetSizeX(), textSizeY)
  ;
  (UIScroll.SetButtonSize)(_frameScroll, frameSizeY, textSizeY)
  _frameScroll:SetControlPos(0)
  if RequestMail_getMailType() == 1 then
    local mailCashProductNoRaw = (RequestMail_getMailCashProductNoRaw())
    local cPSSW = nil
    if mailCashProductNoRaw ~= 0 then
      cPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(mailCashProductNoRaw)
    end
    if cPSSW ~= nil then
      (self._itemSlot):setItemByCashProductStaticStatus(cPSSW, RequestMail_getMailItemCount())
      ;
      (self._iconBase):SetShow(true)
      ;
      ((self._itemSlot).icon):SetShow(true)
      ;
      (self._itemText):SetShow(true)
      if isGameTypeKorea() then
        (self._itemText):SetSpanSize(30, 40)
      else
        ;
        (self._itemText):SetSpanSize(10, 40)
      end
      ;
      (self._buttonReceive):SetShow(true)
      ;
      (self._checkboxToWarehouse):SetCheck(false)
      ;
      (self._checkboxToWarehouse):SetShow(false)
      Panel_Mail_Detail:SetSize(Panel_Mail_Detail:GetSizeX(), panel_SizeY)
    else
      ;
      (self._itemSlot):clearItem()
      ;
      (self._iconBase):SetShow(false)
      ;
      ((self._itemSlot).icon):SetShow(false)
      ;
      (self._itemText):SetShow(false)
      ;
      (self._buttonReceive):SetShow(false)
      ;
      (self._checkboxToWarehouse):SetCheck(false)
      ;
      (self._checkboxToWarehouse):SetShow(false)
      Panel_Mail_Detail:SetSize(Panel_Mail_Detail:GetSizeX(), panel_SizeY - 40)
    end
  else
    do
      local mailItem = mail_getMailItemStatic()
      if mailItem ~= nil then
        (self._itemSlot):setItemByStaticStatus(mailItem, RequestMail_getMailItemCount())
        ;
        (self._iconBase):SetShow(true)
        ;
        ((self._itemSlot).icon):SetShow(true)
        ;
        (self._itemText):SetShow(true)
        ;
        (self._buttonReceive):SetShow(true)
        ;
        (self._checkboxToWarehouse):SetCheck(false)
        local isMoney = mailItem:isMoney()
        if isMoney == true then
          (self._checkboxToWarehouse):SetShow(true)
        else
          ;
          (self._checkboxToWarehouse):SetShow(false)
        end
        Panel_Mail_Detail:SetSize(Panel_Mail_Detail:GetSizeX(), panel_SizeY)
      else
        do
          do
            ;
            (self._itemSlot):clearItem()
            ;
            (self._iconBase):SetShow(false)
            ;
            ((self._itemSlot).icon):SetShow(false)
            ;
            (self._itemText):SetShow(false)
            ;
            (self._buttonReceive):SetShow(false)
            ;
            (self._checkboxToWarehouse):SetCheck(false)
            ;
            (self._checkboxToWarehouse):SetShow(false)
            Panel_Mail_Detail:SetSize(Panel_Mail_Detail:GetSizeX(), panel_SizeY - 40)
            local groupIndex = 0
            local groupCount = 0
            Panel_Mail_Detail:deleteConsoleUIGroup(0)
            local group_0 = Panel_Mail_Detail:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
            if (self._buttonReceive):GetShow() then
              groupCount = groupCount + 1
            end
            if (self._buttonDelete):GetShow() then
              groupCount = groupCount + 1
            end
            if (self._checkboxToWarehouse):GetShow() then
              groupCount = groupCount + 1
            end
            if ((self._itemSlot).icon):GetShow() then
              groupCount = groupCount + 1
            end
            if (self._buttonReceive):GetShow() then
              group_0:addControl(groupIndex, 0, groupCount, 1, self._buttonReceive)
              groupIndex = groupIndex + 1
            end
            if (self._buttonDelete):GetShow() then
              group_0:addControl(groupIndex, 0, groupCount, 1, self._buttonDelete)
              groupIndex = groupIndex + 1
            end
            if (self._checkboxToWarehouse):GetShow() then
              group_0:addControl(groupIndex, 0, groupCount, 1, self._checkboxToWarehouse)
              groupIndex = groupIndex + 1
            end
            if ((self._itemSlot).icon):GetShow() then
              group_0:addControl(groupIndex, 0, groupCount, 1, (self._itemSlot).icon)
              groupIndex = groupIndex + 1
            end
            ;
            (mailDetail._buttonDelete):ComputePos()
          end
        end
      end
    end
  end
end

Mail_Detail_Close = function()
  -- function num : 0_9 , upvalues : mailDetail
  if Panel_Mail_Detail:IsShow() then
    Panel_Mail_Detail:SetShow(false, true)
  end
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  mailDetail.openMailNo = nil
  FGlobal_CashShop_GoodsTooltipInfo_Close()
  Panel_Tooltip_Item_hideTooltip()
end

Mail_Detail_Delete = function()
  -- function num : 0_10 , upvalues : mailDetail
  if mailDetail.openMailNo ~= nil then
    RequestMail_removeMail(mailDetail.openMailNo, true)
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

    mailDetail.openMailNo = nil
  end
  Mail_Detail_Close()
end

Mail_Detail_GetItem = function()
  -- function num : 0_11 , upvalues : mailDetail
  local self = mailDetail
  warehouse_requestInfoByCurrentRegionMainTown()
  local itemWhereType = (CppEnums.ItemWhereType).eInventory
  local giftCount_s64 = RequestMail_getMailItemCount()
  if toInt64(0, 1) < giftCount_s64 then
    local getMygift = function(count_s64)
    -- function num : 0_11_0 , upvalues : self, itemWhereType
    local isWarehouseCheck = (self._checkboxToWarehouse):IsCheck()
    if isWarehouseCheck == true then
      itemWhereType = (CppEnums.ItemWhereType).eWarehouse
    else
      if isWarehouseCheck == false then
        itemWhereType = (CppEnums.ItemWhereType).eInventory
      end
    end
    RequestMail_receiveMailItem(count_s64, itemWhereType)
    return 
  end

    Panel_NumberPad_Show(true, giftCount_s64, nil, getMygift, false, nil)
  else
    do
      local isWarehouseCheck = (self._checkboxToWarehouse):IsCheck()
      if isWarehouseCheck == true then
        itemWhereType = (CppEnums.ItemWhereType).eWarehouse
      else
        if isWarehouseCheck == false then
          itemWhereType = (CppEnums.ItemWhereType).eInventory
        end
      end
      RequestMail_receiveMailItem(toInt64(0, 1), itemWhereType)
      do return  end
    end
  end
end

mailDetail:init()
mailDetail:registEventHandler()
mailDetail:registMessageHandler()

