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
    _itemText = nil,
    _iconBase = nil,
    _buttonDelete = nil,
    _buttonReceive = nil,
    _buttonClose = nil,
    _buttonQuestion = nil,
    _checkboxToWarehouse = nil
  },
  slotConfig = {
    createIcon = true,
    createBorder = true,
    createMailCount = true,
    createEnchant = true,
    createCash = true
  },
  config = {slotX = 5, slotY = 5},
  _itemSlot = {},
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
  self._ui._title = UI.getChildControl(self._ui.stc_centerBG, "StaticText_Title")
  self._ui._contents = UI.getChildControl(self._ui._frameContents, "StaticText_MailContent")
  self._ui._buttonDelete = UI.getChildControl(self._ui.stc_bottomBG, "Button_Delete")
  UI.ASSERT(nil ~= self._ui._sender and "number" ~= type(self._ui._sender), "StaticText_Sender")
  UI.ASSERT(nil ~= self._ui._title and "number" ~= type(self._ui._title), "StaticText_Title")
  UI.ASSERT(nil ~= self._ui._contents and "number" ~= type(self._ui._contents), "StaticText_MailContent")
  UI.ASSERT(nil ~= self._ui._buttonDelete and "number" ~= type(self._ui._buttonDelete), "Button_Delete")
end
function mailDetail:registEventHandler()
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobal_MailDetail_Delete()")
  self._ui._buttonDelete:addInputEvent("Mouse_LUp", "PaGlobal_MailDetail_Delete()")
end
function mailDetail:registMessageHandler()
  registerEvent("ResponseMail_showDetail", "Mail_Detail_Open")
end
function Mail_Detail_Open(mailNo)
  if not _panel:IsShow() then
    _panel:SetShow(true, true)
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
  if true == ToClient_isXBox() then
  elseif nil ~= mailDetail.openMailNo then
    RequestMail_removeMail(mailDetail.openMailNo, true)
    mailDetail.openMailNo = nil
  end
  PaGlobal_MailDetail_Close()
end
function Mail_Detail_GetItem()
  local self = mailDetail
  warehouse_requestInfoByCurrentRegionMainTown()
  local itemWhereType = CppEnums.ItemWhereType.eInventory
  local giftCount_s64 = RequestMail_getMailItemCount()
  if giftCount_s64 > toInt64(0, 1) then
    local function getMygift(count_s64)
      local isWarehouseCheck = self._checkboxToWarehouse:IsCheck()
      if true == isWarehouseCheck then
        itemWhereType = CppEnums.ItemWhereType.eWarehouse
      elseif false == isWarehouseCheck then
        itemWhereType = CppEnums.ItemWhereType.eInventory
      end
      RequestMail_receiveMailItem(count_s64, itemWhereType)
      return
    end
    Panel_NumberPad_Show(true, giftCount_s64, nil, getMygift, false, nil)
  else
    local isWarehouseCheck = self._checkboxToWarehouse:IsCheck()
    if true == isWarehouseCheck then
      itemWhereType = CppEnums.ItemWhereType.eWarehouse
    elseif false == isWarehouseCheck then
      itemWhereType = CppEnums.ItemWhereType.eInventory
    end
    RequestMail_receiveMailItem(toInt64(0, 1), itemWhereType)
    return
  end
end
registerEvent("ResponseMail_showDetail", "Mail_Detail_Open")
