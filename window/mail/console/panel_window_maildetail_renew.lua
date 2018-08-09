local _panel = Panel_Window_MailDetail_Renew
_panel:ActiveMouseEventEffect(true)
_panel:setGlassBackground(true)
_panel:RegisterShowEventFunc(true, "Mail_Detail_ShowAni()")
_panel:RegisterShowEventFunc(false, "Mail_Detail_HideAni()")
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
function Mail_Detail_ShowAni()
  audioPostEvent_SystemUi(1, 0)
  UIAni.fadeInSCR_Left(_panel)
end
function Mail_Detail_HideAni()
  audioPostEvent_SystemUi(1, 1)
  _panel:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local mailHideAni = _panel:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  mailHideAni:SetStartColor(UI_color.C_FFFFFFFF)
  mailHideAni:SetEndColor(UI_color.C_00FFFFFF)
  mailHideAni:SetStartIntensity(3)
  mailHideAni:SetEndIntensity(1)
  mailHideAni.IsChangeChild = true
  mailHideAni:SetHideAtEnd(true)
  mailHideAni:SetDisableWhileAni(true)
end
local panel_SizeY = _panel:GetSizeY()
local mailDetail = {
  _ui = {
    stc_topBG = UI.getChildControl(_panel, "Static_TopBg"),
    stc_centerBG = UI.getChildControl(_panel, "Static_CenterBg"),
    stc_bottomBG = UI.getChildControl(_panel, "Static_BottomBg"),
    _frame = nil,
    _frameContents = nil,
    _frameScroll = nil,
    _sender = nil,
    _title = nil,
    _contents = nil,
    txt_itemEnclosed = nil,
    stc_slotBG = nil,
    _buttonDelete = nil,
    _buttonReceive = nil,
    _buttonClose = nil,
    _buttonQuestion = nil,
    slot_item = {},
    stc_line = {},
    txt_keyGuideA = nil,
    txt_keyGuideX = nil,
    txt_keyGuideY = nil
  },
  slotConfig = {
    createIcon = true,
    createBorder = true,
    createMailCount = true,
    createEnchant = true,
    createCash = true
  },
  config = {slotX = 5, slotY = 5},
  openMailNo = nil
}
function FromClient_luaLoadComplete_MailDetail_Init()
  mailDetail:init()
  mailDetail:registEventHandler()
  mailDetail:registMessageHandler()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_MailDetail_Init")
function mailDetail:init()
  self._ui._frame = UI.getChildControl(self._ui.stc_centerBG, "Frame_MailText")
  self._ui._frameContents = self._ui._frame:GetFrameContent()
  self._ui._frameScroll = self._ui._frame:GetVScroll()
  self._ui._sender = UI.getChildControl(self._ui.stc_centerBG, "StaticText_Sender")
  self._ui._sender:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  self._ui._title = UI.getChildControl(self._ui.stc_centerBG, "StaticText_Title")
  self._ui._title:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  self._ui._contents = UI.getChildControl(self._ui._frameContents, "StaticText_MailContent")
  self._ui.txt_itemEnclosed = UI.getChildControl(self._ui.stc_centerBG, "StaticText_ItemEnclosed")
  self._ui.stc_slotBG = UI.getChildControl(self._ui.stc_centerBG, "Static_ItemSlotBg")
  for ii = 1, 4 do
    self._ui.stc_line[ii] = UI.getChildControl(self._ui.stc_centerBG, "Static_Line" .. ii)
  end
  self._ui._buttonDelete = UI.getChildControl(self._ui.stc_bottomBG, "Button_Delete")
  SlotItem.new(self._ui.slot_item, "ItemIconSlot_", 0, self._ui.stc_slotBG, self.slotConfig)
  self._ui.slot_item:createChild()
  self._ui.slot_item.icon:SetPosX(self.config.slotX)
  self._ui.slot_item.icon:SetPosY(self.config.slotY)
  self._ui.slot_item.icon:addInputEvent("Mouse_On", "Mail_ShowItemToolTip()")
  self._ui.slot_item.icon:addInputEvent("Mouse_Out", "Mail_HideItemToolTip()")
  self._ui.txt_keyGuideA = UI.getChildControl(self._ui.stc_bottomBG, "StaticText_ReceiveItem")
  self._ui.txt_keyGuideX = UI.getChildControl(self._ui.stc_bottomBG, "StaticText_ReceiveToWarehouse")
  self._ui.txt_keyGuideY = UI.getChildControl(self._ui.stc_bottomBG, "StaticText_MailDelete")
  self._ui.txt_keyGuideB = UI.getChildControl(self._ui.stc_bottomBG, "StaticText_Close")
  self._ui.stc_slotBG:SetShow(false)
end
function mailDetail:registEventHandler()
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobal_MailDetail_Delete()")
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_A, "Mail_Detail_GetItem(false)")
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_X, "Mail_Detail_GetItem(true)")
  self._ui._buttonDelete:addInputEvent("Mouse_LUp", "PaGlobal_MailDetail_Delete()")
end
function mailDetail:registMessageHandler()
  registerEvent("ResponseMail_showDetail", "Mail_Detail_Open")
  registerEvent("FromClient_ResponseMailGetItem", "FromClient_ResponseMailGetItem")
  registerEvent("FromClient_PadSnapChangePanel", "FromClient_MailDetail_PadSnapChangePanel")
end
function Mail_Detail_Open(mailNo)
  if not _panel:IsShow() then
    _panel:SetShow(true, true)
  elseif Panel_Window_Mail_Renew:GetShow() then
    ToClient_padSnapSetTargetPanel(_panel)
  end
  if Panel_Window_Mail_Renew:GetShow() then
    _panel:SetPosX(Panel_Window_Mail_Renew:GetPosX() - _panel:GetSizeX())
    _panel:SetPosY(Panel_Window_Mail_Renew:GetPosY())
  end
  FGlobal_CashShop_GoodsTooltipInfo_Close()
  Panel_Tooltip_Item_hideTooltip()
  local self = mailDetail
  self.openMailNo = mailNo
  self._ui._sender:SetText(RequestMail_getMailSenderName())
  self._ui._title:SetText(RequestMail_getMailTitle())
  self._ui._contents:SetAutoResize(true)
  self._ui._contents:SetTextMode(UI_TM.eTextMode_AutoWrap)
  self._ui._contents:SetText(RequestMail_getMailContents())
  local textSizeY = self._ui._contents:GetSizeY()
  local frameSizeY = self._ui._frame:GetSizeY()
  self._ui._frameContents:SetSize(self._ui._frameContents:GetSizeX(), textSizeY)
  UIScroll.SetButtonSize(self._ui._frameScroll, frameSizeY, textSizeY)
  self._ui._frameScroll:SetControlPos(0)
  if 1 == RequestMail_getMailType() then
    local mailCashProductNoRaw = RequestMail_getMailCashProductNoRaw()
    local cPSSW
    if 0 ~= mailCashProductNoRaw then
      cPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(mailCashProductNoRaw)
    end
    if nil ~= cPSSW then
      self._ui.slot_item:clearItem()
      self._ui.slot_item:setItemByCashProductStaticStatus(cPSSW, RequestMail_getMailItemCount())
      self._ui.stc_slotBG:SetShow(true)
      self._ui.slot_item.icon:SetShow(true)
      self._ui.txt_itemEnclosed:SetShow(true)
      self._ui.txt_keyGuideA:SetMonoTone(false)
      self._ui.txt_keyGuideX:SetMonoTone(false)
    else
      self._ui.slot_item:clearItem()
      self._ui.stc_slotBG:SetShow(false)
      self._ui.slot_item.icon:SetShow(false)
      self._ui.txt_itemEnclosed:SetShow(false)
      self._ui.txt_keyGuideA:SetMonoTone(true)
      self._ui.txt_keyGuideX:SetMonoTone(true)
    end
  else
    local mailItem = mail_getMailItemStatic()
    if nil ~= mailItem then
      self._ui.slot_item:clearItem()
      self._ui.slot_item:setItemByStaticStatus(mailItem, RequestMail_getMailItemCount())
      self._ui.stc_slotBG:SetShow(true)
      self._ui.slot_item.icon:SetShow(true)
      self._ui.txt_itemEnclosed:SetShow(true)
      self._ui.txt_keyGuideA:SetMonoTone(false)
      self._ui.txt_keyGuideX:SetMonoTone(false)
      local isMoney = mailItem:isMoney()
      if true == isMoney then
      else
      end
    else
      self._ui.slot_item:clearItem()
      self._ui.stc_slotBG:SetShow(false)
      self._ui.slot_item.icon:SetShow(false)
      self._ui.txt_itemEnclosed:SetShow(false)
      self._ui.txt_keyGuideA:SetMonoTone(true)
      self._ui.txt_keyGuideX:SetMonoTone(true)
    end
  end
end
function PaGlobal_MailDetail_GetShow()
  return _panel:GetShow()
end
function PaGlobal_MailDetail_Close()
  if true == _panel:IsShow() then
    _panel:SetShow(false, true)
  end
  mailDetail.openMailNo = nil
  FGlobal_CashShop_GoodsTooltipInfo_Close()
  Panel_Tooltip_Item_hideTooltip()
end
function PaGlobal_MailDetail_Delete()
  if nil ~= mailDetail.openMailNo then
    RequestMail_removeMail(mailDetail.openMailNo, true)
    mailDetail.openMailNo = nil
  end
  PaGlobal_MailDetail_Close()
end
function Mail_Detail_GetItem(toWarehouse)
  local self = mailDetail
  warehouse_requestInfoByCurrentRegionMainTown()
  local itemWhereType = CppEnums.ItemWhereType.eInventory
  if true == toWarehouse then
    itemWhereType = CppEnums.ItemWhereType.eWarehouse
  end
  local giftCount_s64 = RequestMail_getMailItemCount()
  local function getMygift(count_s64)
    RequestMail_receiveMailItem(count_s64, itemWhereType)
    return
  end
  Panel_NumberPad_Show(true, giftCount_s64, nil, getMygift, false, nil)
end
function FromClient_ResponseMailGetItem(itemKey, itemCount_s64, immediateItem, isRelay)
  local self = mailDetail
  if 1 ~= itemKey and not immediateItem then
    return
  end
  local itemESSW = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
  local itemName = itemESSW:getName()
  if immediateItem then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MAIL_DETAIL_ALERT_IMMEDIATEITEM", "itemName", itemName))
  elseif 1 == itemKey and (isWarehouse or isRelay) then
    Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MAIL_DETAIL_ALERT_GET_WAREHOUSE", "itemName", itemName, "itemCount", makeDotMoney(itemCount_s64)))
  end
end
function FromClient_MailDetail_PadSnapChangePanel(fromPanel, toPanel)
  if nil ~= toPanel then
    if _panel:GetKey() == toPanel:GetKey() then
      mailDetail._ui.txt_keyGuideA:SetMonoTone(false)
      mailDetail._ui.txt_keyGuideX:SetMonoTone(false)
      mailDetail._ui.txt_keyGuideY:SetMonoTone(false)
      mailDetail._ui.txt_keyGuideB:SetMonoTone(false)
      if false == mailDetail._ui.slot_item.icon:GetShow() then
        mailDetail._ui.txt_keyGuideA:SetMonoTone(true)
        mailDetail._ui.txt_keyGuideX:SetMonoTone(true)
      end
    else
      mailDetail._ui.txt_keyGuideA:SetMonoTone(true)
      mailDetail._ui.txt_keyGuideX:SetMonoTone(true)
      mailDetail._ui.txt_keyGuideY:SetMonoTone(true)
      mailDetail._ui.txt_keyGuideB:SetMonoTone(true)
    end
  end
end
