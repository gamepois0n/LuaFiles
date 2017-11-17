-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\friend\panel_friendmessanger.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local CTLTYPE = CppEnums.PA_UI_CONTROL_TYPE
PaGlobal_FriendMessanger = {_currentFocusId = -1, 
_messangerList = {}
}
-- DECOMPILER ERROR at PC12: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FriendMessanger.CreateMessanger = function(self, messangerId, userName, isOnline)
  -- function num : 0_0 , upvalues : CTLTYPE
  local messanger = {
_ui = {_mainPanel = nil, _btnClose = nil, _enterBtn = nil, _editInputChat = nil, _staticTitle = nil, _staticTitleImg = nil, _sizeControl = nil, _slider = nil, _sliderButton = nil, _frame = nil, _frameContent = nil, _frameScroll = nil, 
_staticText = {}
, 
_staticBg = {}
}
, _messangerAlpha = 1, _messageCount = 0, _isCallShow = false}
  messanger.Initialize = function(self, messangerId, userName, isOnline)
    -- function num : 0_0_0 , upvalues : messanger
    messanger:CreatePanel(messangerId, isOnline)
    messanger:PrepareControl(messangerId, userName, isOnline)
  end

  messanger.Clear = function(self)
    -- function num : 0_0_1
    (UI.deletePanel)(((self._ui)._mainPanel):GetID())
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._ui)._mainPanel = nil
  end

  messanger.CreatePanel = function(self, messangerId, isOnline)
    -- function num : 0_0_2 , upvalues : messanger
    local newName = "Panel_FriendMessanger" .. messangerId
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (messanger._ui)._mainPanel = (UI.createPanel)(newName, (Defines.UIGroup).PAGameUIGroup_WorldMap_Popups)
    CopyBaseProperty(Panel_Friend_Messanger, (messanger._ui)._mainPanel)
    ;
    ((messanger._ui)._mainPanel):SetDragAll(true)
    ;
    ((messanger._ui)._mainPanel):SetShow(true)
    ;
    ((messanger._ui)._mainPanel):addInputEvent("Mouse_UpScroll", "PaGlobal_FriendMessanger:Scroll( " .. messangerId .. ", true )")
    ;
    ((messanger._ui)._mainPanel):addInputEvent("Mouse_DownScroll", "PaGlobal_FriendMessanger:Scroll( " .. messangerId .. ", false )")
  end

  messanger.PrepareControl = function(self, messangerId, userName, isOnline)
    -- function num : 0_0_3 , upvalues : messanger, CTLTYPE
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R4 in 'UnsetPending'

    (self._ui)._btnClose = messanger:CreateControl(CTLTYPE.PA_UI_CONTROL_BUTTON, Panel_Friend_Messanger, (self._ui)._mainPanel, "Button_Close", 0)
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._frame = messanger:CreateControl(CTLTYPE.PA_UI_CONTROL_FRAME, Panel_Friend_Messanger, (self._ui)._mainPanel, "Frame_1", 0)
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._enterBtn = messanger:CreateControl(CTLTYPE.PA_UI_CONTROL_BUTTON, Panel_Friend_Messanger, (self._ui)._mainPanel, "Button_Enter", 0)
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._staticTitle = messanger:CreateControl(CTLTYPE.PA_UI_CONTROL_STATICTEXT, Panel_Friend_Messanger, (self._ui)._mainPanel, "StaticText_TitleName", 0)
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._staticTitleImg = messanger:CreateControl(CTLTYPE.PA_UI_CONTROL_STATIC, Panel_Friend_Messanger, (self._ui)._mainPanel, "Static_TitleImage", 0)
    -- DECOMPILER ERROR at PC71: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._sizeControl = messanger:CreateControl(CTLTYPE.PA_UI_CONTROL_BUTTON, Panel_Friend_Messanger, (self._ui)._mainPanel, "Button_SizeControl", 0)
    -- DECOMPILER ERROR at PC83: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._editInputChat = messanger:CreateControl(CTLTYPE.PA_UI_CONTROL_EDIT, Panel_Friend_Messanger, (self._ui)._mainPanel, "Edit_InputChat", 0)
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._frameScroll = ((self._ui)._frame):GetVScroll()
    CopyBaseProperty((UI.getChildControl)((UI.getChildControl)(Panel_Friend_Messanger, "Frame_1"), "Frame_1_VerticalScroll"), (self._ui)._frameScroll)
    -- DECOMPILER ERROR at PC108: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._frameContent = ((self._ui)._frame):GetFrameContent()
    ;
    ((self._ui)._btnClose):addInputEvent("Mouse_LUp", "PaGlobal_FriendMessanger:Close(" .. messangerId .. ")")
    ;
    ((self._ui)._enterBtn):addInputEvent("Mouse_LUp", "PaGlobal_FriendMessanger:SendMessage(" .. messangerId .. ")")
    ;
    ((self._ui)._editInputChat):SetMaxInput(100)
    if isOnline then
      ((self._ui)._editInputChat):addInputEvent("Mouse_LUp", "PaGlobal_FriendMessanger:SetFocusEdit(" .. messangerId .. ")")
      ;
      ((self._ui)._editInputChat):RegistReturnKeyEvent("PaGlobal_FriendMessanger:SendMessageByKeyboard()")
      ;
      ((self._ui)._editInputChat):SetEnable(true)
      ;
      ((self._ui)._enterBtn):SetEnable(true)
    else
      ;
      ((self._ui)._editInputChat):SetEnable(false)
      ;
      ((self._ui)._enterBtn):SetEnable(false)
    end
    ;
    ((self._ui)._staticTitle):SetText(userName)
    ;
    ((self._ui)._sizeControl):addInputEvent("Mouse_LDown", "PaGlobal_FriendMessanger:SetPos( " .. messangerId .. " )")
    ;
    ((self._ui)._sizeControl):addInputEvent("Mouse_LPress", "PaGlobal_FriendMessanger:Resize( " .. messangerId .. " )")
    -- DECOMPILER ERROR at PC201: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._slider = (UI.createControl)(CTLTYPE.PA_UI_CONTROL_SLIDER, (self._ui)._mainPanel, "Slider_Alpha")
    -- DECOMPILER ERROR at PC207: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._ui)._sliderButton = ((self._ui)._slider):GetControlButton()
    local style = (UI.getChildControl)(Panel_Friend_Messanger, "Slider_Alpha")
    CopyBaseProperty(style, (self._ui)._slider)
    ;
    ((self._ui)._slider):SetInterval(100)
    ;
    ((self._ui)._sliderButton):addInputEvent("Mouse_LPress", "PaGlobal_FriendMessanger:SetAlpha( " .. messangerId .. ")")
    ;
    ((self._ui)._slider):addInputEvent("Mouse_LUp", "PaGlobal_FriendMessanger:SetAlpha( " .. messangerId .. ")")
    ;
    ((self._ui)._slider):SetControlPos(100)
  end

  messanger.CreateControl = function(self, controlType, parentStyleControl, parentControl, controlName, index)
    -- function num : 0_0_4
    local styleControl = (UI.getChildControl)(parentStyleControl, controlName)
    local control = (UI.createControl)(controlType, parentControl, controlName .. index)
    CopyBaseProperty(styleControl, control)
    return control
  end

  messanger.ClearAllMessage = function(self)
    -- function num : 0_0_5
    for index = 0, self._messageCount - 1 do
      (((self._ui)._staticText)[index]):SetShow(false)
      ;
      (((self._ui)._staticBg)[index]):SetShow(false)
      ;
      (UI.deleteControl)(((self._ui)._staticText)[index])
      ;
      (UI.deleteControl)(((self._ui)._staticBg)[index])
    end
    self._messageCount = 0
  end

  messanger.UpdateMessage = function(self, chattingMessage)
    -- function num : 0_0_6 , upvalues : messanger
    messanger:ShowMessage(chattingMessage.isMe, chattingMessage:getContent())
    self._messageCount = self._messageCount + 1
  end

  messanger.ShowMessage = function(self, isMe, msg)
    -- function num : 0_0_7 , upvalues : messanger
    messanger:CreateMessageUI(isMe)
    messanger:ResizeMessageUI(msg)
    messanger:SetPosMessageUI(isMe)
  end

  messanger.ResizeMessageUI = function(self, msg)
    -- function num : 0_0_8
    local panelSizeX = ((self._ui)._mainPanel):GetSizeX()
    local maxTextSizeX = panelSizeX - 100
    local staticText = ((self._ui)._staticText)[self._messageCount]
    local staticBg = ((self._ui)._staticBg)[self._messageCount]
    staticText:SetSize(maxTextSizeX, staticText:GetSizeY())
    staticText:SetAutoResize(true)
    staticText:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    staticText:SetText(msg)
    local textSizeX = maxTextSizeX
    local textSizeX = (math.min)(staticText:GetTextSizeX(), maxTextSizeX)
    textSizeX = (math.max)(12, textSizeX)
    staticBg:SetSize(textSizeX + 13, staticText:GetSizeY() + 13)
    staticBg:SetAlpha(self._messangerAlpha)
    staticText:SetFontAlpha(self._messangerAlpha)
  end

  messanger.CreateMessageUI = function(self, isMe)
    -- function num : 0_0_9 , upvalues : CTLTYPE
    local styleBg = (UI.getChildControl)(Panel_Friend_Messanger, "Static_To")
    local styleText = (UI.getChildControl)(Panel_Friend_Messanger, "StaticText_To")
    if isMe == false then
      styleBg = (UI.getChildControl)(Panel_Friend_Messanger, "Static_From")
      styleText = (UI.getChildControl)(Panel_Friend_Messanger, "StaticText_From")
    end
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R4 in 'UnsetPending'

    ;
    ((self._ui)._staticBg)[self._messageCount] = (UI.createControl)(CTLTYPE.PA_UI_CONTROL_STATIC, (self._ui)._frameContent, "Static_BG_" .. self._messageCount)
    -- DECOMPILER ERROR at PC51: Confused about usage of register: R4 in 'UnsetPending'

    ;
    ((self._ui)._staticText)[self._messageCount] = (UI.createControl)(CTLTYPE.PA_UI_CONTROL_STATICTEXT, (self._ui)._frameContent, "Static_Text_" .. self._messageCount)
    CopyBaseProperty(styleBg, ((self._ui)._staticBg)[self._messageCount])
    CopyBaseProperty(styleText, ((self._ui)._staticText)[self._messageCount])
    ;
    (((self._ui)._staticBg)[self._messageCount]):SetShow(true)
    ;
    (((self._ui)._staticText)[self._messageCount]):SetIgnore(true)
    ;
    (((self._ui)._staticText)[self._messageCount]):SetShow(true)
  end

  messanger.SetPosMessageUI = function(self, isMe)
    -- function num : 0_0_10 , upvalues : messanger
    local prevBgPosY = 0
    local prevBgSizeY = 0
    if self._messageCount > 0 then
      prevBgPosY = (((self._ui)._staticBg)[self._messageCount - 1]):GetPosY()
      prevBgSizeY = (((self._ui)._staticBg)[self._messageCount - 1]):GetSizeY()
    end
    local bgPosX = 12
    if isMe then
      bgPosX = ((messanger._ui)._mainPanel):GetSizeX() - (((self._ui)._staticBg)[self._messageCount]):GetSizeX() - 14
      ;
      (((self._ui)._staticText)[self._messageCount]):SetPosX((((self._ui)._staticText)[self._messageCount]):GetPosX() - 13)
    end
    ;
    (((self._ui)._staticBg)[self._messageCount]):SetPosX(bgPosX)
    ;
    (((self._ui)._staticBg)[self._messageCount]):SetPosY(prevBgPosY + prevBgSizeY + 5)
    ;
    (((self._ui)._staticText)[self._messageCount]):SetPosY((((self._ui)._staticBg)[self._messageCount]):GetPosY() + 1)
  end

  messanger:Initialize(messangerId, userName, isOnline)
  return messanger
end

-- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FriendMessanger.SetAlpha = function(self, messangerId)
  -- function num : 0_1
  local messanger = (PaGlobal_FriendMessanger._messangerList)[messangerId]
  local panel = (((PaGlobal_FriendMessanger._messangerList)[messangerId])._ui)._mainPanel
  messanger._messangerAlpha = ((messanger._ui)._slider):GetControlPos() * 0.5 + 0.5
  panel:SetAlpha(messanger._messangerAlpha)
  panel:SetAlphaChild(messanger._messangerAlpha)
  ;
  ((messanger._ui)._btnClose):SetAlpha(1)
  ;
  ((messanger._ui)._slider):SetAlpha(1)
  ;
  ((messanger._ui)._sliderButton):SetAlpha(1)
  ;
  ((messanger._ui)._staticTitle):SetFontAlpha(messanger._messangerAlpha)
  for i = 0, messanger._messageCount - 1 do
    local staticText = ((messanger._ui)._staticText)[i]
    if staticText ~= nil then
      staticText:SetFontAlpha(messanger._messangerAlpha)
    end
  end
end

local orgMouseX = 0
local orgMouseY = 0
local orgPanelSizeX = 0
local orgPanelSizeY = 0
local orgPanelPosY = 0
-- DECOMPILER ERROR at PC27: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_FriendMessanger.SetPos = function(self, messangerId)
  -- function num : 0_2 , upvalues : orgMouseX, orgMouseY, orgPanelSizeX, orgPanelSizeY
  local panel = (((PaGlobal_FriendMessanger._messangerList)[messangerId])._ui)._mainPanel
  orgMouseX = getMousePosX()
  orgMouseY = getMousePosY()
  orgPanelPosX = panel:GetPosX()
  orgPanelSizeX = panel:GetSizeX()
  orgPanelSizeY = panel:GetSizeY()
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_FriendMessanger.Resize = function(self, messangerId)
  -- function num : 0_3 , upvalues : orgMouseX, orgMouseY, orgPanelSizeX, orgPanelSizeY
  local messanger = (PaGlobal_FriendMessanger._messangerList)[messangerId]
  local panel = (messanger._ui)._mainPanel
  local currentPosX = panel:GetPosX()
  local currentX = getMousePosX()
  local currentY = getMousePosY()
  local deltaX = orgMouseX - currentX
  local deltaY = currentY - orgMouseY
  local sizeX = orgPanelSizeX + deltaX
  local sizeY = orgPanelSizeY + deltaY
  if sizeX > 800 then
    sizeX = 800
  else
    if sizeX < 300 then
      sizeX = 300
    end
  end
  if sizeY > 800 then
    sizeY = 800
  else
    if sizeY < 212 then
      sizeY = 212
    end
  end
  local currentSizeX = panel:GetSizeX()
  local currentSizeY = panel:GetSizeY()
  panel:SetSize(sizeX, sizeY)
  panel:SetPosX(currentPosX + currentSizeX - sizeX)
  ;
  ((messanger._ui)._sizeControl):SetPosY(panel:GetSizeY() - ((messanger._ui)._sizeControl):GetSizeY())
  ;
  ((messanger._ui)._editInputChat):SetPosY(panel:GetSizeY() - ((messanger._ui)._editInputChat):GetSizeY() - 5)
  ;
  ((messanger._ui)._editInputChat):SetSize(panel:GetSizeX() - 69, ((messanger._ui)._editInputChat):GetSizeY())
  ;
  ((messanger._ui)._btnClose):SetPosX(panel:GetSizeX() - ((messanger._ui)._btnClose):GetSizeX() - 5)
  ;
  ((messanger._ui)._frame):SetSize(panel:GetSizeX() - 10, panel:GetSizeY() - 55)
  ;
  ((messanger._ui)._enterBtn):SetPosY(panel:GetSizeY() - 33)
  ;
  ((messanger._ui)._enterBtn):SetPosX(panel:GetSizeX() - 46)
  ;
  ((messanger._ui)._slider):SetPosX(panel:GetSizeX() - 82)
  FromClient_UpdateFriendMessanger(messangerId)
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_FriendMessanger.Scroll = function(self, messangerId, isUp)
  -- function num : 0_4
  local messanger = (PaGlobal_FriendMessanger._messangerList)[messangerId]
  local targetScroll = (messanger._ui)._frameScroll
  if isUp then
    targetScroll:ControlButtonUp()
  else
    targetScroll:ControlButtonDown()
  end
  ;
  ((messanger._ui)._frame):UpdateContentPos()
end

FGlobal_FriendMessanger_CheckUiEdit = function(targetUI)
  -- function num : 0_5
  if PaGlobal_FriendMessanger._currentFocusId == -1 then
    return false
  end
  do
    local currentEdit = (((PaGlobal_FriendMessanger._messangerList)[PaGlobal_FriendMessanger._currentFocusId])._ui)._editInputChat
    do return targetUI ~= nil and targetUI:GetKey() == currentEdit:GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_FriendMessanger.Close = function(self, messangerId)
  -- function num : 0_6 , upvalues : IM
  local messanger = (PaGlobal_FriendMessanger._messangerList)[messangerId]
  ToClient_CloseMessanger(messangerId)
  messanger:Clear()
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (PaGlobal_FriendMessanger._messangerList)[messangerId] = nil
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R3 in 'UnsetPending'

  if messangerId == PaGlobal_FriendMessanger._currentFocusId then
    PaGlobal_FriendMessanger._currentFocusId = -1
    ClearFocusEdit()
  end
  if AllowChangeInputMode() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  else
    SetFocusChatting()
  end
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_FriendMessanger.SetFocusEdit = function(self, messangerId)
  -- function num : 0_7 , upvalues : IM
  local messanger = (PaGlobal_FriendMessanger._messangerList)[messangerId]
  SetFocusEdit((messanger._ui)._editInputChat)
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

  PaGlobal_FriendMessanger._currentFocusId = messangerId
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

FGlobal_FriendMessanger_KillFocusEdit = function()
  -- function num : 0_8 , upvalues : IM
  if PaGlobal_FriendMessanger._currentFocusId == -1 then
    return false
  end
  ClearFocusEdit()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_FriendMessanger._currentFocusId = -1
  if AllowChangeInputMode() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  else
    SetFocusChatting()
  end
  return false
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_FriendMessanger.SendMessageByKeyboard = function(self)
  -- function num : 0_9
  PaGlobal_FriendMessanger:SendMessage(PaGlobal_FriendMessanger._currentFocusId)
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_FriendMessanger.SendMessage = function(self, messangerId)
  -- function num : 0_10
  local messanger = (PaGlobal_FriendMessanger._messangerList)[messangerId]
  local rv = chatting_sendMessageByUserNo((ToClient_GetMessageListById(messangerId)):getUserNo(), ((messanger._ui)._editInputChat):GetEditText(), (CppEnums.ChatType).Friend)
  if rv == 0 then
    (ToClient_GetMessageListById(messangerId)):pushFromMessage(((messanger._ui)._editInputChat):GetEditText())
  end
  ;
  ((messanger._ui)._editInputChat):SetEditText("", true)
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_FriendMessanger.UpdateLogOnOff = function(self, messangerId, isOnline)
  -- function num : 0_11 , upvalues : IM
  local messanger = (self._messangerList)[messangerId]
  if messangerId == self._currentFocusId and messangerId ~= -1 then
    self._currentFocusId = -1
    ClearFocusEdit()
    if AllowChangeInputMode() then
      if (UI.checkShowWindow)() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    else
      SetFocusChatting()
    end
  end
  if messanger ~= nil then
    if isOnline == 1 then
      ((messanger._ui)._editInputChat):SetEnable(true)
      ;
      ((messanger._ui)._enterBtn):SetEnable(true)
    else
      ;
      ((messanger._ui)._editInputChat):SetEnable(false)
      ;
      ((messanger._ui)._enterBtn):SetEnable(false)
    end
  end
end

FromClient_KillFocusMessanger = function()
  -- function num : 0_12
  FGlobal_FriendMessanger_KillFocusEdit()
end

FromClient_UpdateFriendMessanger = function(messangerId)
  -- function num : 0_13
  local friendMesaageList = ToClient_GetMessageListById(messangerId)
  local message = friendMesaageList:beginMessage()
  local messanger = (PaGlobal_FriendMessanger._messangerList)[messangerId]
  if messanger == nil then
    return 
  end
  if messanger._messageCount > 0 then
    messanger:ClearAllMessage()
  end
  while message ~= nil do
    messanger:UpdateMessage(message)
    message = friendMesaageList:nextMessage()
  end
  ;
  ((messanger._ui)._frame):UpdateContentScroll()
  ;
  ((messanger._ui)._frameScroll):SetControlBottom()
  ;
  ((messanger._ui)._frame):UpdateContentPos()
  ;
  (((messanger._ui)._frameScroll):GetControlButton()):SetPosX(-3)
end

FromClient_OpenMessanger = function(messangerId, userName, isOnline)
  -- function num : 0_14
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R3 in 'UnsetPending'

  if (PaGlobal_FriendMessanger._messangerList)[messangerId] == nil then
    (PaGlobal_FriendMessanger._messangerList)[messangerId] = PaGlobal_FriendMessanger:CreateMessanger(messangerId, userName, isOnline)
  end
  if isOnline then
    PaGlobal_FriendMessanger:SetFocusEdit(messangerId)
  end
  FGlobal_FriendList_UpdateList()
  FromClient_UpdateFriendMessanger(messangerId)
end

FromClient_NotifyFriendMessage = function(msgType, strParam1, param1, param2)
  -- function num : 0_15
  local msgStr = ""
  if msgType == 0 then
    if param1 == 1 then
      msgStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FRIENDS_NOTIFYFRIENDMESSAGE_LOGIN", "strParam1", strParam1)
    else
      if msgType == 0 then
        msgStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_FRIENDS_NOTIFYFRIENDMESSAGE_LOGOUT", "strParam1", strParam1)
      end
    end
    Proc_ShowMessage_Ack(msgStr)
    FGlobal_FriendList_UpdateList()
    PaGlobal_FriendMessanger:UpdateLogOnOff(param2, param1)
  end
end

registerEvent("FromClient_GroundMouseClick", "FromClient_KillFocusMessanger")
registerEvent("FromClient_UpdateFriendMessanger", "FromClient_UpdateFriendMessanger")
registerEvent("FromClient_OpenMessanger", "FromClient_OpenMessanger")
registerEvent("FromClient_NotifyFriendMessage", "FromClient_NotifyFriendMessage")

