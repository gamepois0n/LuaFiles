-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\mail\panel_mail.luac 

-- params : ...
-- function num : 0
Panel_Mail_Main:ActiveMouseEventEffect(true)
Panel_Mail_Main:setGlassBackground(true)
Panel_Mail_Main:RegisterShowEventFunc(true, "Mail_ShowAni()")
Panel_Mail_Main:RegisterShowEventFunc(false, "Mail_HideAni()")
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local IM = CppEnums.EProcessorInputMode
Mail_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Left)(Panel_Mail_Main)
  local aniInfo1 = Panel_Mail_Main:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Mail_Main:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Mail_Main:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Mail_Main:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Mail_Main:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Mail_Main:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Mail_HideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Mail_Main, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local defalut_Control = {
_mail = {_buttonClose = (UI.getChildControl)(Panel_Mail_Main, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Mail_Main, "Button_Question"), _BG = (UI.getChildControl)(Panel_Mail_Main, "Static_MailList_BG"), _NoMail = (UI.getChildControl)(Panel_Mail_Main, "StaticText_NoMail"), _page_Count = (UI.getChildControl)(Panel_Mail_Main, "StaticText_PageCount"), _Btn_pre_page = (UI.getChildControl)(Panel_Mail_Main, "Button_Pre_Page"), _Btn_Nxt_page = (UI.getChildControl)(Panel_Mail_Main, "Button_Next_Page"), _Btn_QnA = (UI.getChildControl)(Panel_Mail_Main, "Button_QNA"), _Btn_SelectAll = (UI.getChildControl)(Panel_Mail_Main, "Button_SelectAll"), _Btn_SelectDel = (UI.getChildControl)(Panel_Mail_Main, "Button_SelectDelete"), _Btn_ReceiveAll = (UI.getChildControl)(Panel_Mail_Main, "Button_AllRecieve"), 
_List_BG = {}
, 
_checkBtn = {}
, 
_Sender_Name = {}
, 
_Mail_Title = {}
, 
_Mail_Num = {}
, 
_mailNo = {}
, 
_mail_GetItem = {}
, 
_mail_GetDate = {}
, isSelectAll = false, 
_Template = {_List_BG = (UI.getChildControl)(Panel_Mail_Main, "RadioButton_MailList"), _checkBtn = (UI.getChildControl)(Panel_Mail_Main, "CheckButton_Mail"), _Sender_Name = (UI.getChildControl)(Panel_Mail_Main, "StaticText_Sender"), _Mail_Title = (UI.getChildControl)(Panel_Mail_Main, "StaticText_Mail_Title"), _Mail_Num = (UI.getChildControl)(Panel_Mail_Main, "StaticText_Mail_Num"), _mail_GetItem = (UI.getChildControl)(Panel_Mail_Main, "Static_GetItem"), _rowMax = 8, _row_PosY_Gap = 2}
}
}
local _btn_Mail = (UI.getChildControl)(Panel_UIMain, "Button_Mail")
defalut_Control.Init_Control = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  (((self._mail)._Template)._Sender_Name):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (((self._mail)._Template)._Mail_Title):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (((self._mail)._Template)._Mail_Num):SetTextMode(UI_TM.eTextMode_LimitText)
  FGlobal_Set_Table_Control(self._mail, "_List_BG", "_List_BG", true, false)
  FGlobal_Set_Table_Control(self._mail, "_checkBtn", "_List_BG", true, false)
  FGlobal_Set_Table_Control(self._mail, "_Sender_Name", "_List_BG", true, false)
  FGlobal_Set_Table_Control(self._mail, "_Mail_Title", "_List_BG", true, false)
  FGlobal_Set_Table_Control(self._mail, "_Mail_Num", "_List_BG", true, false)
  FGlobal_Set_Table_Control(self._mail, "_mail_GetItem", "_List_BG", true, false)
  local isCommercial = FGlobal_IsCommercialService()
  ;
  ((self._mail)._Btn_QnA):SetShow(isCommercial)
  if isGameTypeKR2() then
    ((self._mail)._Btn_QnA):SetShow(false)
  end
end

defalut_Control:Init_Control()
defalut_Control.Init_Function = function(self)
  -- function num : 0_3
  ((self._mail)._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Panelmail\" )")
  ;
  ((self._mail)._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Panelmail\", \"true\")")
  ;
  ((self._mail)._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Panelmail\", \"false\")")
  ;
  ((self._mail)._buttonClose):addInputEvent("Mouse_LUp", "Mail_Close()")
  ;
  ((self._mail)._Btn_pre_page):addInputEvent("Mouse_LUp", "MailList_Change_Page(false)")
  ;
  ((self._mail)._Btn_Nxt_page):addInputEvent("Mouse_LUp", "MailList_Change_Page(true)")
  ;
  ((self._mail)._Btn_QnA):addInputEvent("Mouse_LUp", "FGlobal_QnAWebLink_Open()")
  ;
  ((self._mail)._Btn_SelectAll):addInputEvent("Mouse_LUp", "MailList_SelectAll()")
  ;
  ((self._mail)._Btn_SelectDel):addInputEvent("Mouse_LUp", "MailList_SelectDelete()")
  ;
  ((self._mail)._BG):addInputEvent("Mouse_DownScroll", "MailList_Change_Page(true)")
  ;
  ((self._mail)._BG):addInputEvent("Mouse_UpScroll", "MailList_Change_Page(false)")
  ;
  ((self._mail)._Btn_ReceiveAll):addInputEvent("Mouse_LUp", "MailList_ReceiveAll()")
  for key,value in pairs((self._mail)._List_BG) do
    value:addInputEvent("Mouse_LUp", "Mail_GetDetail(" .. tostring(key) .. ")")
    value:addInputEvent("Mouse_DownScroll", "MailList_Change_Page(true)")
    value:addInputEvent("Mouse_UpScroll", "MailList_Change_Page(false)")
  end
end

defalut_Control:Init_Function()
local _mail_Data = {_Page_Total = 0, _Page_Current = 0, 
_Selected = {}
, 
_Data = {}
}
_mail_Data.setData = function(self)
  -- function num : 0_4 , upvalues : defalut_Control
  local mailCount = RequestMail_mailCount()
  local SlotMax = ((defalut_Control._mail)._Template)._rowMax
  self._Data = {}
  local pageNo = 0
  for index = 1, mailCount do
    if (index - 1) % SlotMax == 0 then
      pageNo = pageNo + 1
    end
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R8 in 'UnsetPending'

    if (self._Data)[pageNo] == nil then
      (self._Data)[pageNo] = {}
    end
    local mail_Info = RequestMail_getMailAt(index - 1)
    local sender_Name = mail_Info:getSender()
    local mail_Title = mail_Info:getTitle()
    local mail_No = mail_Info:getMailNo()
    local mail_isExistItem = mail_Info:isExistItem()
    local mail_getMailReceiveDate = mail_Info:getMailReceiveDate()
    local idx = (index - 1) % SlotMax + 1
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R15 in 'UnsetPending'

    ;
    ((self._Data)[pageNo])[idx] = {_indx = index - 1, _sender_Name = sender_Name, _mail_Title = mail_Title, _mail_No = mail_No, _mail_GetItem = mail_isExistItem, _mail_GetDate = mail_getMailReceiveDate}
  end
  self._Page_Total = pageNo
end

_mail_Data.clear = function(self)
  -- function num : 0_5 , upvalues : defalut_Control
  local SlotMax = ((defalut_Control._mail)._Template)._rowMax
  for index = 1, SlotMax do
    (((defalut_Control._mail)._List_BG)[index]):SetShow(false)
    ;
    (((defalut_Control._mail)._checkBtn)[index]):SetShow(false)
    ;
    (((defalut_Control._mail)._Sender_Name)[index]):SetShow(false)
    ;
    (((defalut_Control._mail)._Mail_Title)[index]):SetShow(false)
    ;
    (((defalut_Control._mail)._Mail_Num)[index]):SetShow(false)
    ;
    (((defalut_Control._mail)._mail_GetItem)[index]):SetShow(false)
  end
  ;
  ((defalut_Control._mail)._page_Count):SetText("-- / --")
  ;
  ((defalut_Control._mail)._Btn_pre_page):SetShow(false)
  ;
  ((defalut_Control._mail)._Btn_Nxt_page):SetShow(false)
  ;
  ((defalut_Control._mail)._NoMail):SetShow(true)
end

_mail_Data.Update_MailPage = function(self)
  -- function num : 0_6 , upvalues : defalut_Control, _mail_Data
  local pageNo = self._Page_Current
  local pageNo_Total = self._Page_Total
  if pageNo_Total < pageNo then
    self._Page_Current = self._Page_Total
    pageNo = self._Page_Current
  end
  local SlotMax = ((defalut_Control._mail)._Template)._rowMax
  for index = 1, SlotMax do
    (((defalut_Control._mail)._checkBtn)[index]):SetCheck(false)
  end
  for index = 0, 2 do
    Panel_Mail_Main:deleteConsoleUIGroup(index)
  end
  local group_0 = Panel_Mail_Main:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local group_1 = Panel_Mail_Main:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local group_2 = Panel_Mail_Main:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local mailCount = RequestMail_mailCount()
  _mail_Data:clear()
  for index = 1, SlotMax do
    -- DECOMPILER ERROR at PC75: Unhandled construct in 'MakeBoolean' P1

    if (self._Data)[pageNo] ~= nil and ((self._Data)[pageNo])[index] ~= nil then
      local _sender_Name = (((self._Data)[pageNo])[index])._sender_Name
      local _mail_Title = (((self._Data)[pageNo])[index])._mail_Title
      local _indx = (((self._Data)[pageNo])[index])._indx
      local _getItem = (((self._Data)[pageNo])[index])._mail_GetItem
      local _getDate = (((self._Data)[pageNo])[index])._mail_GetDate
      local _mail_num = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_NO") .. "." .. tostring(_indx + 1)
      ;
      (((defalut_Control._mail)._Sender_Name)[index]):SetText(_sender_Name .. "(" .. _getDate .. ")")
      ;
      (((defalut_Control._mail)._Mail_Title)[index]):SetText(_mail_Title)
      ;
      (((defalut_Control._mail)._Mail_Num)[index]):SetText(_mail_num)
      if (self._Selected)._indx == _indx and (self._Selected)._sender_Name == _sender_Name and (self._Selected)._mail_Title == _mail_Title then
        (((defalut_Control._mail)._List_BG)[index]):SetCheck(true)
      else
        ;
        (((defalut_Control._mail)._List_BG)[index]):SetCheck(false)
      end
      ;
      (((defalut_Control._mail)._List_BG)[index]):SetShow(true)
      ;
      (((defalut_Control._mail)._checkBtn)[index]):SetShow(true)
      ;
      (((defalut_Control._mail)._Sender_Name)[index]):SetShow(true)
      ;
      (((defalut_Control._mail)._Mail_Title)[index]):SetShow(true)
      ;
      (((defalut_Control._mail)._Mail_Num)[index]):SetShow(true)
      ;
      (((defalut_Control._mail)._mail_GetItem)[index]):SetShow(true)
      ;
      (((defalut_Control._mail)._mail_GetItem)[index]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_New_01.dds")
      if _getItem == true then
        local x1, y1, x2, y2 = setTextureUV_Func(((defalut_Control._mail)._mail_GetItem)[index], 1, 433, 22, 455)
        ;
        ((((defalut_Control._mail)._mail_GetItem)[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((defalut_Control._mail)._mail_GetItem)[index]):setRenderTexture((((defalut_Control._mail)._mail_GetItem)[index]):getBaseTexture())
      else
        do
          do
            do
              do
                local x1, y1, x2, y2 = setTextureUV_Func(((defalut_Control._mail)._mail_GetItem)[index], 1, 457, 22, 479)
                ;
                ((((defalut_Control._mail)._mail_GetItem)[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (((defalut_Control._mail)._mail_GetItem)[index]):setRenderTexture((((defalut_Control._mail)._mail_GetItem)[index]):getBaseTexture())
                group_0:addControl(0, index - 1, 2, SlotMax, ((defalut_Control._mail)._List_BG)[index])
                group_0:addControl(1, index - 1, 2, SlotMax, ((defalut_Control._mail)._checkBtn)[index])
                ;
                (((defalut_Control._mail)._List_BG)[index]):SetShow(false)
                ;
                (((defalut_Control._mail)._checkBtn)[index]):SetShow(false)
                ;
                (((defalut_Control._mail)._Sender_Name)[index]):SetShow(false)
                ;
                (((defalut_Control._mail)._Mail_Title)[index]):SetShow(false)
                ;
                (((defalut_Control._mail)._Mail_Num)[index]):SetShow(false)
                ;
                (((defalut_Control._mail)._mail_GetItem)[index]):SetShow(false)
                -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC336: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  if pageNo_Total == 1 or pageNo_Total < 1 then
    ((defalut_Control._mail)._Btn_pre_page):SetShow(false)
    ;
    ((defalut_Control._mail)._Btn_Nxt_page):SetShow(false)
  else
    if pageNo == 1 then
      ((defalut_Control._mail)._Btn_pre_page):SetShow(false)
      ;
      ((defalut_Control._mail)._Btn_Nxt_page):SetShow(true)
    else
      if pageNo == pageNo_Total then
        ((defalut_Control._mail)._Btn_pre_page):SetShow(true)
        ;
        ((defalut_Control._mail)._Btn_Nxt_page):SetShow(false)
      else
        ;
        ((defalut_Control._mail)._Btn_pre_page):SetShow(true)
        ;
        ((defalut_Control._mail)._Btn_Nxt_page):SetShow(true)
      end
    end
  end
  if ((defalut_Control._mail)._Btn_pre_page):GetShow() and ((defalut_Control._mail)._Btn_Nxt_page):GetShow() then
    group_1:addControl(0, 0, 2, 1, (defalut_Control._mail)._Btn_pre_page)
    group_1:addControl(1, 0, 2, 1, (defalut_Control._mail)._Btn_Nxt_page)
    group_2:addControl(0, 0, 4, 1, (defalut_Control._mail)._Btn_SelectAll)
    group_2:addControl(1, 0, 4, 1, (defalut_Control._mail)._Btn_SelectDel)
    group_2:addControl(2, 0, 4, 1, (defalut_Control._mail)._Btn_ReceiveAll)
    group_2:addControl(3, 0, 4, 1, (defalut_Control._mail)._Btn_QnA)
  else
    if ((defalut_Control._mail)._Btn_pre_page):GetShow() and not ((defalut_Control._mail)._Btn_Nxt_page):GetShow() then
      group_1:addControl(0, 0, 1, 1, (defalut_Control._mail)._Btn_pre_page)
      group_2:addControl(0, 0, 4, 1, (defalut_Control._mail)._Btn_SelectAll)
      group_2:addControl(1, 0, 4, 1, (defalut_Control._mail)._Btn_SelectDel)
      group_2:addControl(2, 0, 4, 1, (defalut_Control._mail)._Btn_ReceiveAll)
      group_2:addControl(3, 0, 4, 1, (defalut_Control._mail)._Btn_QnA)
    else
      if not ((defalut_Control._mail)._Btn_pre_page):GetShow() and ((defalut_Control._mail)._Btn_Nxt_page):GetShow() then
        group_1:addControl(0, 0, 1, 1, (defalut_Control._mail)._Btn_Nxt_page)
        group_2:addControl(0, 0, 4, 1, (defalut_Control._mail)._Btn_SelectAll)
        group_2:addControl(1, 0, 4, 1, (defalut_Control._mail)._Btn_SelectDel)
        group_2:addControl(2, 0, 4, 1, (defalut_Control._mail)._Btn_ReceiveAll)
        group_2:addControl(3, 0, 4, 1, (defalut_Control._mail)._Btn_QnA)
      else
        if mailCount == 0 then
          group_0:addControl(0, 0, 4, 1, (defalut_Control._mail)._Btn_SelectAll)
          group_0:addControl(1, 0, 4, 1, (defalut_Control._mail)._Btn_SelectDel)
          group_0:addControl(2, 0, 4, 1, (defalut_Control._mail)._Btn_ReceiveAll)
          group_0:addControl(3, 0, 4, 1, (defalut_Control._mail)._Btn_QnA)
        else
          group_1:addControl(0, 0, 4, 1, (defalut_Control._mail)._Btn_SelectAll)
          group_1:addControl(1, 0, 4, 1, (defalut_Control._mail)._Btn_SelectDel)
          group_1:addControl(2, 0, 4, 1, (defalut_Control._mail)._Btn_ReceiveAll)
          group_1:addControl(3, 0, 4, 1, (defalut_Control._mail)._Btn_QnA)
        end
      end
    end
  end
  if pageNo_Total > 0 then
    local pageCount = tostring(pageNo) .. "/" .. tostring(pageNo_Total)
    ;
    ((defalut_Control._mail)._page_Count):SetText(pageCount)
    ;
    ((defalut_Control._mail)._NoMail):SetShow(false)
  end
end

Mail_GetDetail = function(index)
  -- function num : 0_7 , upvalues : _mail_Data, defalut_Control
  local pageNo = _mail_Data._Page_Current
  local SlotMax = ((defalut_Control._mail)._Template)._rowMax
  if pageNo < 1 then
    return 
  end
  local realIndex = (((_mail_Data._Data)[pageNo])[index])._indx
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R4 in 'UnsetPending'

  _mail_Data._Selected = {_indx = (((_mail_Data._Data)[pageNo])[index])._indx, _sender_Name = (((_mail_Data._Data)[pageNo])[index])._sender_Name, _mail_Title = (((_mail_Data._Data)[pageNo])[index])._mail_Title}
  RequestMail_getMailDetail(realIndex)
end

MailList_Change_Page = function(isNext)
  -- function num : 0_8 , upvalues : _mail_Data, defalut_Control
  local pageNo_Current = _mail_Data._Page_Current
  local pageNo_Total = _mail_Data._Page_Total
  if isNext == true then
    if pageNo_Total < pageNo_Current + 1 then
      return 
    else
      -- DECOMPILER ERROR at PC13: Confused about usage of register: R3 in 'UnsetPending'

      _mail_Data._Page_Current = pageNo_Current + 1
    end
  else
    if isNext == false then
      if pageNo_Current - 1 < 1 then
        return 
      else
        -- DECOMPILER ERROR at PC24: Confused about usage of register: R3 in 'UnsetPending'

        _mail_Data._Page_Current = pageNo_Current - 1
      end
    end
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (defalut_Control._mail).isSelectAll = false
  _mail_Data:Update_MailPage()
end

MailList_SelectAll = function()
  -- function num : 0_9 , upvalues : _mail_Data, defalut_Control
  local self = _mail_Data
  local SlotMax = ((defalut_Control._mail)._Template)._rowMax
  local stat_checkBtn = (defalut_Control._mail).isSelectAll
  for index = 1, SlotMax do
    if (((defalut_Control._mail)._checkBtn)[index]):GetShow() then
      (((defalut_Control._mail)._checkBtn)[index]):SetCheck(not stat_checkBtn)
    end
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (defalut_Control._mail).isSelectAll = not stat_checkBtn
end

MailList_SelectDelete = function()
  -- function num : 0_10 , upvalues : _mail_Data, defalut_Control
  local self = _mail_Data
  local pageNo = self._Page_Current
  local SlotMax = ((defalut_Control._mail)._Template)._rowMax
  do
    local lastMailIndex = 0
    for index = 1, SlotMax do
      if (((defalut_Control._mail)._checkBtn)[index]):IsCheck() then
        lastMailIndex = index
      end
    end
    for index = 1, SlotMax do
      if (((defalut_Control._mail)._checkBtn)[index]):GetShow() and (((defalut_Control._mail)._checkBtn)[index]):IsCheck() then
        local mailNo = (((self._Data)[pageNo])[index])._mail_No
        RequestMail_removeMail(mailNo, index == lastMailIndex)
      end
    end
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (defalut_Control._mail).isSelectAll = false
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

MailList_ReceiveAll = function()
  -- function num : 0_11
  local recievemail = function()
    -- function num : 0_11_0
    RequestMail_receiveAllMailItem()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_MAIL_GETALL_MESSAGEBOX_MEMO")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MAIL_GETALL_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = recievemail, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

Mail_Open = function()
  -- function num : 0_12 , upvalues : _mail_Data
  if isAutoTraining() then
    Proc_ShowMessage_Ack("흑정령의 수련중에�\148 편지창을 �\180 �\152 없습니다.")
    return 
  end
  if not Panel_Mail_Main:IsShow() then
    Panel_Mail_Main:SetShow(true, true)
  end
  if Panel_NewMail_Alarm:IsShow() then
    Panel_NewMail_Alarm:SetShow(false)
  end
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

  _mail_Data._Page_Current = 1
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

  _mail_Data._Page_Total = 0
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

  _mail_Data._Selected = {}
  _mail_Data:clear()
  RequestMail_requestMailList()
  RequestMail_setNewMailFlag(false)
end

Mail_Close = function()
  -- function num : 0_13
  if Panel_Mail_Main:IsShow() then
    Panel_Mail_Main:SetShow(false, true)
    Mail_Detail_Close()
  end
  HelpMessageQuestion_Out()
end

local newMailAlarm_icon = (UI.getChildControl)(Panel_NewMail_Alarm, "Static_MailIcon")
local newMailAlarm_call = (UI.getChildControl)(Panel_NewMail_Alarm, "StaticText_CallingYou")
local newMailEffectIcon = (UI.getChildControl)(Panel_UIMain, "Button_Mail")
newMailAlarm_call:SetShow(false, false)
newMailEffectIcon:EraseAllEffect()
Panel_NewMail_Alarm:SetShow(false)
newMailAlarm_icon:addInputEvent("Mouse_LUp", "Mail_Open()")
init_newMailAlarm = function()
  -- function num : 0_14 , upvalues : newMailEffectIcon
  local bNewFlag = RequestMail_getNewMailFlag()
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  Panel_NewMail_Alarm:SetShow(false)
  if bNewFlag then
    if isColorBlindMode == 0 then
      newMailEffectIcon:EraseAllEffect()
      newMailEffectIcon:AddEffect("fUI_Letter_01A", true, 0, 2.1)
    else
      if isColorBlindMode == 1 then
        newMailEffectIcon:EraseAllEffect()
        newMailEffectIcon:AddEffect("fUI_Letter_01B", true, 0, 2.1)
      else
        if isColorBlindMode == 2 then
          newMailEffectIcon:EraseAllEffect()
          newMailEffectIcon:AddEffect("fUI_Letter_01B", true, 0, 2.1)
        end
      end
    end
  end
end

Mail_UpdateList = function(isCheck)
  -- function num : 0_15 , upvalues : newMailEffectIcon, _mail_Data
  newMailEffectIcon:EraseAllEffect()
  _mail_Data:setData()
  _mail_Data:Update_MailPage()
end

FromClient_NewMail = function()
  -- function num : 0_16 , upvalues : newMailEffectIcon
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "FROMCLIENT_NEWMAIL"))
  if isColorBlindMode == 0 then
    newMailEffectIcon:EraseAllEffect()
    newMailEffectIcon:AddEffect("fUI_Letter_01A", true, 0, 2.1)
  else
    if isColorBlindMode == 1 then
      newMailEffectIcon:EraseAllEffect()
      newMailEffectIcon:AddEffect("fUI_Letter_01B", true, 0, 2.1)
    else
      if isColorBlindMode == 2 then
        newMailEffectIcon:EraseAllEffect()
        newMailEffectIcon:AddEffect("fUI_Letter_01B", true, 0, 2.1)
      end
    end
  end
end

Mail_onScreenResize = function()
  -- function num : 0_17
  Panel_Mail_Main:SetPosX(getScreenSizeX() - Panel_Mail_Main:GetSizeX())
  Panel_Mail_Main:SetPosY(getScreenSizeY() / 2 - Panel_Mail_Main:GetSizeY() / 2)
end

init_newMailAlarm()
registerEvent("ResponseMail_showList", "Mail_UpdateList")
registerEvent("FromClient_NewMail", "FromClient_NewMail")
registerEvent("onScreenResize", "Mail_onScreenResize")

