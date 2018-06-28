local _panel = Panel_Window_Mail_Renew
_panel:ActiveMouseEventEffect(true)
_panel:setGlassBackground(true)
_panel:RegisterShowEventFunc(true, "Mail_ShowAni()")
_panel:RegisterShowEventFunc(false, "Mail_HideAni()")
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local IM = CppEnums.EProcessorInputMode
function Mail_ShowAni()
  UIAni.fadeInSCR_Left(_panel)
  local aniInfo1 = _panel:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = _panel:GetSizeX() / 2
  aniInfo1.AxisY = _panel:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = _panel:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = _panel:GetSizeX() / 2
  aniInfo2.AxisY = _panel:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end
function Mail_HideAni()
  local aniInfo = UIAni.AlphaAnimation(0, _panel, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end
local defalut_Control = {
  _ui = {
    stc_topBG = UI.getChildControl(_panel, "Static_TopBg"),
    stc_centerBG = UI.getChildControl(_panel, "Static_CenterBg"),
    stc_bottomBG = UI.getChildControl(_panel, "Static_BottomBg"),
    _page_Count = nil,
    _List_BG = {},
    _Sender_Name = {},
    _Mail_Title = {},
    _mailNo = {},
    _mail_GetItem = {},
    _mail_GetDate = {},
    isSelectAll = false
  },
  _rowMax = 8,
  _currentSelect = 1
}
function FromClient_luaLoadComplete_MailInfo_Init()
  defalut_Control:Init_Control()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_MailInfo_Init")
function defalut_Control:Init_Control()
  self._ui._page_Count = UI.getChildControl(self._ui.stc_topBG, "StaticText_PageNumber")
  self._ui.mailTemplate = UI.getChildControl(self._ui.stc_centerBG, "RadioButton_MailTemplate")
  for ii = 1, self._rowMax do
    self._ui._List_BG[ii] = UI.cloneControl(self._ui.mailTemplate, self._ui.stc_centerBG, "Btn_Mail_" .. ii)
    self._ui._List_BG[ii]:SetPosY((ii - 1) * 68 + 12)
    self._ui._Sender_Name[ii] = UI.getChildControl(self._ui._List_BG[ii], "StaticText_Sender")
    self._ui._Sender_Name[ii]:SetTextMode(UI_TM.eTextMode_LimitText)
    self._ui._Mail_Title[ii] = UI.getChildControl(self._ui._List_BG[ii], "StaticText_Title")
    self._ui._Mail_Title[ii]:SetTextMode(UI_TM.eTextMode_LimitText)
  end
  self._ui.mailTemplate:SetShow(false)
  defalut_Control:registEventHandler()
  defalut_Control:registMessageHandler()
end
function defalut_Control:registEventHandler()
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LEFT, "MailList_Change_Page(false)")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RIGHT, "MailList_Change_Page(true)")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "PaGloba_Mail_GetDetail()")
  for key, value in pairs(self._ui._List_BG) do
    value:addInputEvent("Mouse_On", "MailList_SelectMailWithIndex(" .. tostring(key) .. ")")
    value:addInputEvent("Mouse_LUp", "PaGloba_Mail_GetDetail()")
  end
end
function defalut_Control:registMessageHandler()
  registerEvent("ResponseMail_showList", "Mail_UpdateList")
  registerEvent("onScreenResize", "Mail_onScreenResize")
end
local _mail_Data = {
  _Page_Total = 0,
  _Page_Current = 0,
  _Selected = {},
  _Data = {}
}
function _mail_Data:setData()
  local mailCount = RequestMail_mailCount()
  local SlotMax = defalut_Control._rowMax
  self._Data = {}
  local pageNo = 0
  for index = 1, mailCount do
    if (index - 1) % SlotMax == 0 then
      pageNo = pageNo + 1
    end
    if self._Data[pageNo] == nil then
      self._Data[pageNo] = {}
    end
    local mail_Info = RequestMail_getMailAt(index - 1)
    defalut_Control._ui._mailNo[index] = mail_Info:getMailNo()
    local sender_Name = mail_Info:getSender()
    local mail_Title = mail_Info:getTitle()
    local mail_No = mail_Info:getMailNo()
    local mail_getMailReceiveDate = mail_Info:getMailReceiveDate()
    local idx = (index - 1) % SlotMax + 1
    self._Data[pageNo][idx] = {
      _indx = index - 1,
      _sender_Name = sender_Name,
      _mail_Title = mail_Title,
      _mail_GetDate = mail_getMailReceiveDate
    }
  end
  self._Page_Total = pageNo
end
function _mail_Data:clear()
  local SlotMax = defalut_Control._rowMax
  for index = 1, SlotMax do
    defalut_Control._ui._List_BG[index]:SetShow(false)
    defalut_Control._ui._Sender_Name[index]:SetShow(false)
    defalut_Control._ui._Mail_Title[index]:SetShow(false)
  end
  defalut_Control._ui._page_Count:SetText("-- / --")
end
function _mail_Data:Update_MailPage()
  local pageNo = self._Page_Current
  local pageNo_Total = self._Page_Total
  if pageNo > pageNo_Total then
    self._Page_Current = self._Page_Total
    pageNo = self._Page_Current
  end
  local SlotMax = defalut_Control._rowMax
  local mailCount = RequestMail_mailCount()
  _mail_Data:clear()
  for index = 1, SlotMax do
    if nil ~= self._Data[pageNo] then
      if nil ~= self._Data[pageNo][index] then
        local _sender_Name = self._Data[pageNo][index]._sender_Name
        local _mail_Title = self._Data[pageNo][index]._mail_Title
        local _indx = self._Data[pageNo][index]._indx
        local _getDate = self._Data[pageNo][index]._mail_GetDate
        local _mail_num = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_NO") .. "." .. tostring(_indx + 1)
        defalut_Control._ui._Sender_Name[index]:SetText(_sender_Name .. "(" .. _getDate .. ")")
        defalut_Control._ui._Mail_Title[index]:SetText(_mail_Title)
        if self._Selected._indx == _indx and self._Selected._sender_Name == _sender_Name and self._Selected._mail_Title == _mail_Title then
          defalut_Control._ui._List_BG[index]:SetCheck(true)
        else
          defalut_Control._ui._List_BG[index]:SetCheck(false)
        end
        defalut_Control._ui._List_BG[index]:SetShow(true)
        defalut_Control._ui._Sender_Name[index]:SetShow(true)
        defalut_Control._ui._Mail_Title[index]:SetShow(true)
      end
    else
      defalut_Control._ui._List_BG[index]:SetShow(false)
      defalut_Control._ui._Sender_Name[index]:SetShow(false)
      defalut_Control._ui._Mail_Title[index]:SetShow(false)
    end
  end
  if pageNo_Total > 0 then
    local pageCount = tostring(pageNo) .. "/" .. tostring(pageNo_Total)
    defalut_Control._ui._page_Count:SetText(pageCount)
  end
end
function PaGloba_Mail_GetDetail()
  local pageNo = _mail_Data._Page_Current
  local SlotMax = defalut_Control._rowMax
  local index = defalut_Control._currentSelect
  if pageNo < 1 then
    return
  end
  local realIndex = _mail_Data._Data[pageNo][index]._indx
  _mail_Data._Selected = {
    _indx = _mail_Data._Data[pageNo][index]._indx,
    _sender_Name = _mail_Data._Data[pageNo][index]._sender_Name,
    _mail_Title = _mail_Data._Data[pageNo][index]._mail_Title
  }
  RequestMail_getMailDetail(realIndex)
end
function MailList_Change_Page(isNext)
  local pageNo_Current = _mail_Data._Page_Current
  local pageNo_Total = _mail_Data._Page_Total
  if true == isNext then
    if pageNo_Total < pageNo_Current + 1 then
      return
    else
      _mail_Data._Page_Current = pageNo_Current + 1
    end
  elseif false == isNext then
    if pageNo_Current - 1 < 1 then
      return
    else
      _mail_Data._Page_Current = pageNo_Current - 1
    end
  end
  defalut_Control._ui.isSelectAll = false
  _mail_Data:Update_MailPage()
end
function MailList_SelectMailWithIndex(index)
  defalut_Control._currentSelect = index
  for ii = 1, defalut_Control._rowMax do
    defalut_Control._ui._List_BG[ii]:SetCheck(false)
  end
  defalut_Control._ui._List_BG[defalut_Control._currentSelect]:SetCheck(true)
end
function MailList_SelectAll()
  local self = _mail_Data
  local SlotMax = defalut_Control._rowMax
  local stat_checkBtn = defalut_Control._ui.isSelectAll
  defalut_Control._ui.isSelectAll = not stat_checkBtn
end
function MailList_SelectDelete()
  local self = _mail_Data
  local pageNo = self._Page_Current
  local SlotMax = defalut_Control._rowMax
  local lastMailIndex = 0
  defalut_Control._ui.isSelectAll = false
end
function MailList_ReceiveAll()
  local recievemail = function()
    RequestMail_receiveAllMailItem()
  end
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_MAIL_GETALL_MESSAGEBOX_MEMO")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_MAIL_GETALL_MESSAGEBOX_TITLE"),
    content = messageBoxMemo,
    functionYes = recievemail,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function Mail_Open()
  if not _panel:IsShow() then
    _panel:SetShow(true, true)
  end
  _mail_Data._Page_Current = 1
  _mail_Data._Page_Total = 0
  _mail_Data._Selected = {}
  _mail_Data:clear()
  RequestMail_requestMailList()
  RequestMail_setNewMailFlag(false)
end
function Mail_Close()
  audioPostEvent_SystemUi(1, 21)
  if _panel:IsShow() then
    _panel:SetShow(false, true)
    PaGlobal_MailDetail_Close()
  end
  HelpMessageQuestion_Out()
end
function Mail_UpdateList(isCheck)
  _mail_Data:setData()
  _mail_Data:Update_MailPage()
end
function FromClient_NewMail()
end
function Mail_onScreenResize()
  _panel:SetPosX(getScreenSizeX() - _panel:GetSizeX())
  _panel:SetPosY(getScreenSizeY() / 2 - _panel:GetSizeY() / 2)
end
