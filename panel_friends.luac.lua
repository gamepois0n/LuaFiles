-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\friend\panel_friends.luac 

-- params : ...
-- function num : 0
Panel_FriendList:SetShow(false, false)
Panel_FriendList:setMaskingChild(true)
Panel_FriendList:ActiveMouseEventEffect(true)
Panel_FriendList:setGlassBackground(true)
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
Panel_FriendList:RegisterShowEventFunc(true, "FriendList_showAni()")
Panel_FriendList:RegisterShowEventFunc(false, "FriendList_hideAni()")
local _groupListData = {_defaultGroupIndex = -1, _partyplayGroupIndex = -1, _selectedGroupIndex = -1, 
_uiGroups = {}
, 
_groupInfo = {}
, 
_groupInfoByGroupIndex = {}
, _groupCount = 0}
_groupListData.clear = function(self)
  -- function num : 0_0
  _defaultGroupIndex = -1
  _partyplayGroupIndex = -1
  self._selectedGroupIndex = -1
  self._uiGroups = {}
  self._groupInfo = {}
  self._groupCount = 0
end

local _friendListData = {_selectedFriendIndex = -1, 
_uiFriends = {}
, 
_friendInfo = {}
}
_friendListData.clear = function(self)
  -- function num : 0_1
  self._selectedFriendIndex = -1
  self._uiFriends = {}
  self._friendInfo = {}
end

local FriendMessangerManager = {_currentFocusId = -1, 
_messangerList = {}
}
FriendMessangerManager.createMessanger = function(self, messangerId, userName, isOnline)
  -- function num : 0_2
  local messanger = {_mainPanel = nil, _uiClose = nil, _uiEnter = nil, _uiEditInputChat = nil, _uiStaticTitle = nil, _uiStaticTitleImg = nil, _uiSizeControl = nil, _uiSlider = nil, _uiSliderButton = nil, _uiFrame = nil, _uiFrameContent = nil, _uiFrameScroll = nil, 
_uiStaticText = {}
, 
_uiStaticBg = {}
, _messangerAlpha = 1, _messageCount = 0, _isCallShow = false}
  messanger.initialize = function(self, messangerId, userName, isOnline)
    -- function num : 0_2_0 , upvalues : messanger
    messanger:createPanel(messangerId, isOnline)
    messanger:prepareControl(messangerId, userName, isOnline)
  end

  messanger.clear = function(self)
    -- function num : 0_2_1
    (UI.deletePanel)((self._mainPanel):GetID())
    self._mainPanel = nil
  end

  messanger.createPanel = function(self, messangerId, isOnline)
    -- function num : 0_2_2 , upvalues : messanger
    local newName = "Panel_FriendMessanger" .. messangerId
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R4 in 'UnsetPending'

    messanger._mainPanel = (UI.createPanel)(newName, (Defines.UIGroup).PAGameUIGroup_WorldMap_Popups)
    CopyBaseProperty(Panel_Friend_Messanger, messanger._mainPanel)
    ;
    (messanger._mainPanel):SetDragAll(true)
    ;
    (messanger._mainPanel):SetShow(true)
    ;
    (messanger._mainPanel):addInputEvent("Mouse_UpScroll", "FriendMessanger_OnMouseWheel( " .. messangerId .. ", true )")
    ;
    (messanger._mainPanel):addInputEvent("Mouse_DownScroll", "FriendMessanger_OnMouseWheel( " .. messangerId .. ", false )")
  end

  messanger.prepareControl = function(self, messangerId, userName, isOnline)
    -- function num : 0_2_3 , upvalues : messanger
    self._uiClose = messanger:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Friend_Messanger, self._mainPanel, "Button_Close", 0)
    ;
    (self._uiClose):addInputEvent("Mouse_LUp", "FriendMessanger_Close(" .. messangerId .. ")")
    self._uiFrame = messanger:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_FRAME, Panel_Friend_Messanger, self._mainPanel, "Frame_1", 0)
    self._uiFrameScroll = (self._uiFrame):GetVScroll()
    local styleFrame = (UI.getChildControl)(Panel_Friend_Messanger, "Frame_1")
    local styleScroll = (UI.getChildControl)(styleFrame, "Frame_1_VerticalScroll")
    CopyBaseProperty(styleScroll, self._uiFrameScroll)
    self._uiFrameContent = (self._uiFrame):GetFrameContent()
    self._uiEnter = messanger:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Friend_Messanger, self._mainPanel, "Button_Enter", 0)
    ;
    (self._uiEnter):addInputEvent("Mouse_LUp", "friend_sendMessage(" .. messangerId .. ")")
    self._uiEditInputChat = messanger:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_EDIT, Panel_Friend_Messanger, self._mainPanel, "Edit_InputChat", 0)
    ;
    (self._uiEditInputChat):SetMaxInput(100)
    if isOnline then
      (self._uiEditInputChat):addInputEvent("Mouse_LUp", "FriendMessanger_SetFocusEdit(" .. messangerId .. ")")
      ;
      (self._uiEditInputChat):RegistReturnKeyEvent("friend_sendMessageByKey()")
      ;
      (self._uiEditInputChat):SetEnable(true)
      ;
      (self._uiEnter):SetEnable(true)
    else
      ;
      (self._uiEditInputChat):SetEnable(false)
      ;
      (self._uiEnter):SetEnable(false)
    end
    self._uiStaticTitle = messanger:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Friend_Messanger, self._mainPanel, "StaticText_TitleName", 0)
    ;
    (self._uiStaticTitle):SetText(userName)
    self._uiStaticTitleImg = messanger:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Friend_Messanger, self._mainPanel, "Static_TitleImage", 0)
    self._uiSizeControl = messanger:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Friend_Messanger, self._mainPanel, "Button_SizeControl", 0)
    ;
    (self._uiSizeControl):addInputEvent("Mouse_LDown", "FriendMessanger_ResizeStartPos( " .. messangerId .. " )")
    ;
    (self._uiSizeControl):addInputEvent("Mouse_LPress", "FriendMessanger_Resize( " .. messangerId .. " )")
    self._uiCall = messanger:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Friend_Messanger, self._mainPanel, "Button_Call", 0)
    self._uiSlider = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_SLIDER, self._mainPanel, "Slider_Alpha")
    self._uiSliderButton = (self._uiSlider):GetControlButton()
    local style = (UI.getChildControl)(Panel_Friend_Messanger, "Slider_Alpha")
    CopyBaseProperty(style, self._uiSlider)
    ;
    (self._uiSlider):SetInterval(100)
    ;
    (self._uiSliderButton):addInputEvent("Mouse_LPress", "FriendMessanger_AlphaSlider( " .. messangerId .. ")")
    ;
    (self._uiSlider):addInputEvent("Mouse_LUp", "FriendMessanger_AlphaSlider( " .. messangerId .. ")")
    ;
    (self._uiSlider):SetControlPos(100)
    messanger:setShowCallBtn()
  end

  messanger.setShowCallBtn = function(self)
    -- function num : 0_2_4
    (self._uiCall):SetShow(self._isCallShow)
    local computeValue = 0
    if self._isCallShow == false then
      computeValue = 20
    end
    ;
    (self._uiSlider):SetPosX((self._mainPanel):GetSizeX() - 102 + computeValue)
  end

  messanger.createControl = function(self, controlType, parentStyleControl, parentControl, controlName, index)
    -- function num : 0_2_5
    local styleControl = (UI.getChildControl)(parentStyleControl, controlName)
    local control = (UI.createControl)(controlType, parentControl, controlName .. index)
    CopyBaseProperty(styleControl, control)
    return control
  end

  messanger.clearAllMessage = function(self)
    -- function num : 0_2_6
    for index = 0, self._messageCount - 1 do
      ((self._uiStaticText)[index]):SetShow(false)
      ;
      ((self._uiStaticBg)[index]):SetShow(false)
      ;
      (UI.deleteControl)((self._uiStaticText)[index])
      ;
      (UI.deleteControl)((self._uiStaticBg)[index])
    end
    self._messageCount = 0
  end

  messanger.updateMessage = function(self, chattingMessage)
    -- function num : 0_2_7 , upvalues : messanger
    local msg = chattingMessage:getContent()
    local isMe = chattingMessage.isMe
    messanger:showMessage(isMe, msg)
    self._messageCount = self._messageCount + 1
  end

  messanger.showMessage = function(self, isMe, msg)
    -- function num : 0_2_8 , upvalues : messanger
    messanger:createMessageUI(isMe)
    messanger:resizeMessageUI(msg)
    messanger:setPosMessageUI(isMe)
  end

  messanger.resizeMessageUI = function(self, msg)
    -- function num : 0_2_9
    local panelSizeX = (self._mainPanel):GetSizeX()
    local maxTextSizeX = panelSizeX - 100
    local staticText = (self._uiStaticText)[self._messageCount]
    local staticBg = (self._uiStaticBg)[self._messageCount]
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

  messanger.createMessageUI = function(self, isMe)
    -- function num : 0_2_10
    local styleBg = (UI.getChildControl)(Panel_Friend_Messanger, "Static_To")
    local styleText = (UI.getChildControl)(Panel_Friend_Messanger, "StaticText_To")
    if isMe == false then
      styleBg = (UI.getChildControl)(Panel_Friend_Messanger, "Static_From")
      styleText = (UI.getChildControl)(Panel_Friend_Messanger, "StaticText_From")
    end
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._uiStaticBg)[self._messageCount] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self._uiFrameContent, "Static_BG_" .. self._messageCount)
    -- DECOMPILER ERROR at PC49: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._uiStaticText)[self._messageCount] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, self._uiFrameContent, "Static_Text_" .. self._messageCount)
    CopyBaseProperty(styleBg, (self._uiStaticBg)[self._messageCount])
    CopyBaseProperty(styleText, (self._uiStaticText)[self._messageCount])
    ;
    ((self._uiStaticBg)[self._messageCount]):SetShow(true)
    ;
    ((self._uiStaticText)[self._messageCount]):SetIgnore(true)
    ;
    ((self._uiStaticText)[self._messageCount]):SetShow(true)
  end

  messanger.setPosMessageUI = function(self, isMe)
    -- function num : 0_2_11 , upvalues : messanger
    local prevBgPosY = 0
    local prevBgSizeY = 0
    if self._messageCount > 0 then
      prevBgPosY = ((self._uiStaticBg)[self._messageCount - 1]):GetPosY()
      prevBgSizeY = ((self._uiStaticBg)[self._messageCount - 1]):GetSizeY()
    end
    local bgPosX = 12
    if isMe then
      bgPosX = (messanger._mainPanel):GetSizeX() - ((self._uiStaticBg)[self._messageCount]):GetSizeX() - 14
      ;
      ((self._uiStaticText)[self._messageCount]):SetPosX(((self._uiStaticText)[self._messageCount]):GetPosX() - 13)
    end
    ;
    ((self._uiStaticBg)[self._messageCount]):SetPosX(bgPosX)
    ;
    ((self._uiStaticBg)[self._messageCount]):SetPosY(prevBgPosY + prevBgSizeY + 5)
    ;
    ((self._uiStaticText)[self._messageCount]):SetPosY(((self._uiStaticBg)[self._messageCount]):GetPosY() + 1)
  end

  messanger:initialize(messangerId, userName, isOnline)
  return messanger
end

FriendMessanger_AlphaSlider = function(messangerId)
  -- function num : 0_3 , upvalues : FriendMessangerManager
  local messanger = (FriendMessangerManager._messangerList)[messangerId]
  local panel = ((FriendMessangerManager._messangerList)[messangerId])._mainPanel
  messanger._messangerAlpha = (messanger._uiSlider):GetControlPos() * 0.5 + 0.5
  panel:SetAlpha(messanger._messangerAlpha)
  panel:SetAlphaChild(messanger._messangerAlpha)
  ;
  (messanger._uiStaticTitle):SetFontAlpha(messanger._messangerAlpha)
  for i = 0, messanger._messageCount - 1 do
    local staticText = (messanger._uiStaticText)[i]
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
FriendMessanger_ResizeStartPos = function(messangerId)
  -- function num : 0_4 , upvalues : FriendMessangerManager, orgMouseX, orgMouseY, orgPanelSizeX, orgPanelSizeY
  local panel = ((FriendMessangerManager._messangerList)[messangerId])._mainPanel
  orgMouseX = getMousePosX()
  orgMouseY = getMousePosY()
  orgPanelPosX = panel:GetPosX()
  orgPanelSizeX = panel:GetSizeX()
  orgPanelSizeY = panel:GetSizeY()
end

FriendMessanger_Resize = function(messangerId)
  -- function num : 0_5 , upvalues : FriendMessangerManager, orgMouseX, orgMouseY, orgPanelSizeX, orgPanelSizeY
  local messanger = (FriendMessangerManager._messangerList)[messangerId]
  local panel = messanger._mainPanel
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
  (messanger._uiSizeControl):SetPosY(panel:GetSizeY() - (messanger._uiSizeControl):GetSizeY())
  ;
  (messanger._uiEditInputChat):SetPosY(panel:GetSizeY() - (messanger._uiEditInputChat):GetSizeY() - 5)
  ;
  (messanger._uiEditInputChat):SetSize(panel:GetSizeX() - 69, (messanger._uiEditInputChat):GetSizeY())
  ;
  (messanger._uiClose):SetPosX(panel:GetSizeX() - (messanger._uiClose):GetSizeX() - 5)
  ;
  (messanger._uiFrame):SetSize(panel:GetSizeX() - 10, panel:GetSizeY() - 55)
  ;
  (messanger._uiEnter):SetPosY(panel:GetSizeY() - 33)
  ;
  (messanger._uiEnter):SetPosX(panel:GetSizeX() - 46)
  ;
  (messanger._uiCall):SetPosX(panel:GetSizeX() - 41)
  ;
  (messanger._uiSlider):SetPosX(panel:GetSizeX() - 102)
  messanger:setShowCallBtn()
  FromClient_FriendListUpdateMessanger(messangerId)
end

FriendMessanger_OnMouseWheel = function(messangerId, isUp)
  -- function num : 0_6 , upvalues : FriendMessangerManager
  local messanger = (FriendMessangerManager._messangerList)[messangerId]
  local targetScroll = messanger._uiFrameScroll
  if isUp then
    targetScroll:ControlButtonUp()
  else
    targetScroll:ControlButtonDown()
  end
  ;
  (messanger._uiFrame):UpdateContentPos()
end

FriendMessanger_CheckCurrentUiEdit = function(targetUI)
  -- function num : 0_7 , upvalues : FriendMessangerManager
  if FriendMessangerManager._currentFocusId == -1 then
    return false
  end
  do
    local currentEdit = ((FriendMessangerManager._messangerList)[FriendMessangerManager._currentFocusId])._uiEditInputChat
    do return targetUI ~= nil and targetUI:GetKey() == currentEdit:GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

FriendMessanger_Close = function(messangerId)
  -- function num : 0_8 , upvalues : FriendMessangerManager, IM
  local messanger = (FriendMessangerManager._messangerList)[messangerId]
  ToClient_FriendListCloseMessanger(messangerId)
  messanger:clear()
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (FriendMessangerManager._messangerList)[messangerId] = nil
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  if messangerId == FriendMessangerManager._currentFocusId then
    FriendMessangerManager._currentFocusId = -1
    ClearFocusEdit()
  end
  if AllowChangeInputMode() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  else
    SetFocusChatting()
  end
end

FriendMessanger_SetFocusEdit = function(messangerId)
  -- function num : 0_9 , upvalues : FriendMessangerManager, IM
  local messanger = (FriendMessangerManager._messangerList)[messangerId]
  SetFocusEdit(messanger._uiEditInputChat)
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  FriendMessangerManager._currentFocusId = messangerId
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

FriendMessanger_KillFocusEdit = function()
  -- function num : 0_10 , upvalues : FriendMessangerManager, IM
  if FriendMessangerManager._currentFocusId == -1 then
    return false
  end
  ClearFocusEdit()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  FriendMessangerManager._currentFocusId = -1
  if AllowChangeInputMode() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  else
    SetFocusChatting()
  end
  return false
end

friend_sendMessageByKey = function()
  -- function num : 0_11 , upvalues : FriendMessangerManager
  friend_sendMessage(FriendMessangerManager._currentFocusId)
end

friend_killFocusMessangerByKey = function()
  -- function num : 0_12
  FriendMessanger_KillFocusEdit()
end

friend_sendMessage = function(messangerId)
  -- function num : 0_13 , upvalues : FriendMessangerManager
  local messanger = (FriendMessangerManager._messangerList)[messangerId]
  local rv = chatting_sendMessageByUserNo((RequestFriendList_GetMessageListById(messangerId)):getUserNo(), (messanger._uiEditInputChat):GetEditText(), (CppEnums.ChatType).Friend)
  if rv == 0 then
    (RequestFriendList_GetMessageListById(messangerId)):pushFromMessage((messanger._uiEditInputChat):GetEditText())
  end
  ;
  (messanger._uiEditInputChat):SetEditText("", true)
end

FromClient_FriendListUpdateMessanger = function(messangerId)
  -- function num : 0_14 , upvalues : FriendMessangerManager
  local friendMesaageList = RequestFriendList_GetMessageListById(messangerId)
  local message = friendMesaageList:beginMessage()
  local messanger = (FriendMessangerManager._messangerList)[messangerId]
  if messanger == nil then
    return 
  end
  if messanger._messageCount > 0 then
    messanger:clearAllMessage()
  end
  while message ~= nil do
    messanger:updateMessage(message)
    message = friendMesaageList:nextMessage()
  end
  ;
  (messanger._uiFrame):UpdateContentScroll()
  ;
  (messanger._uiFrameScroll):SetControlBottom()
  ;
  (messanger._uiFrame):UpdateContentPos()
  ;
  ((messanger._uiFrameScroll):GetControlButton()):SetPosX(-3)
end

FromClient_FriendListOpenMessanger = function(messangerId, userName, isOnline)
  -- function num : 0_15 , upvalues : FriendMessangerManager
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R3 in 'UnsetPending'

  if (FriendMessangerManager._messangerList)[messangerId] == nil then
    (FriendMessangerManager._messangerList)[messangerId] = FriendMessangerManager:createMessanger(messangerId, userName, isOnline)
  end
  if isOnline then
    FriendMessanger_SetFocusEdit(messangerId)
  end
  FromClient_FriendListUpdateMessanger(messangerId)
end

FromClient_FriendListUpdateLogOnOffForMessanger = function(messangerId, isOnline)
  -- function num : 0_16 , upvalues : FriendMessangerManager, IM
  local messanger = (FriendMessangerManager._messangerList)[messangerId]
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R3 in 'UnsetPending'

  if messangerId == FriendMessangerManager._currentFocusId and messangerId ~= -1 then
    FriendMessangerManager._currentFocusId = -1
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
      (messanger._uiEditInputChat):SetEnable(true)
      ;
      (messanger._uiEnter):SetEnable(true)
    else
      ;
      (messanger._uiEditInputChat):SetEnable(false)
      ;
      (messanger._uiEnter):SetEnable(false)
    end
  end
end

registerEvent("FromClient_FriendListUpdateMessanger", "FromClient_FriendListUpdateMessanger")
registerEvent("FromClient_FriendListOpenMessanger", "FromClient_FriendListOpenMessanger")
local styleFriendGroup = (UI.getChildControl)(Panel_FriendList, "Style_FriendGroup")
local styleFriendGroupName = (UI.getChildControl)(Panel_FriendList, "StyleGroupName")
local styleName = (UI.getChildControl)(Panel_FriendList, "Style_Name")
local friendsBTN = (UI.getChildControl)(Panel_UIMain, "Button_FriendList")
styleFriendGroup:SetShow(false)
styleFriendGroupName:SetShow(false)
styleFriendGroupName:SetIgnore(false)
styleName:SetShow(false)
styleName:SetIgnore(false)
local FriendList = {_mainPanel = Panel_FriendList, _maxGroupCount = 5, _maxFriendCount = 50, _uiClose = (UI.getChildControl)(Panel_FriendList, "Button_Close"), _buttonRefresh = (UI.getChildControl)(Panel_FriendList, "Button_Refresh"), _buttonQuestion = (UI.getChildControl)(Panel_FriendList, "Button_Question"), _checkButtonSound = (UI.getChildControl)(Panel_FriendList, "CheckButton_Sound"), _checkButtonEffect = (UI.getChildControl)(Panel_FriendList, "CheckButton_Effect"), _uiTreeFriend = (UI.getChildControl)(Panel_FriendList, "Tree_Friend"), _uiTreeFriendBackStatic = nil, _uiTreeFriendOverStatic = nil, _uiTreeFriendScroll = nil, _isFriendMenuShow = false, _isGroupMenuShow = false}
FriendList.initialize = function(self)
  -- function num : 0_17
  self._uiTreeFriendBackStatic = (UI.getChildControl)(self._uiTreeFriend, "Tree_Friend_BackStatic")
  self._uiTreeFriendOverStatic = (UI.getChildControl)(self._uiTreeFriend, "Tree_Friend_OverStatic")
  self._uiTreeFriendScroll = (UI.getChildControl)(self._uiTreeFriend, "Tree_Friend_Scroll")
  ;
  (self._uiClose):addInputEvent("Mouse_LUp", "Friend_CloseWindow()")
  ;
  (self._buttonRefresh):SetShow(false)
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelFriends\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelFriends\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelFriends\", \"false\")")
  ;
  (self._checkButtonSound):addInputEvent("Mouse_LUp", "ToClient_RequestToggleSoundNotice()")
  ;
  (self._checkButtonEffect):addInputEvent("Mouse_LUp", "ToClient_RequestToggleEffectNotice()")
  ;
  (self._uiTreeFriend):addInputEvent("Mouse_RUp", "clickFriendList(true)")
  ;
  (self._uiTreeFriend):addInputEvent("Mouse_LUp", "clickFriendList(false)")
  ;
  (self._uiTreeFriend):addInputEvent("Mouse_UpScroll", "friend_closeFriendMenu()")
  ;
  (self._uiTreeFriend):addInputEvent("Mouse_DownScroll", "friend_closeFriendMenu()")
  local ySize = (self._uiTreeFriend):GetSizeY()
  ;
  (self._uiTreeFriend):SetItemQuantity(15)
  ;
  (self._uiTreeFriendScroll):SetSize((self._uiTreeFriendScroll):GetSizeX(), ySize)
end

FriendList.updateList = function(self)
  -- function num : 0_18 , upvalues : _groupListData, _friendListData
  (self._uiTreeFriend):ClearTree()
  ;
  (self._uiTreeFriend):SetAlpha(1)
  ;
  (self._uiTreeFriend):SetShow(true)
  ;
  (self._uiTreeFriendBackStatic):SetAlpha(1)
  ;
  (self._uiTreeFriendOverStatic):SetAlpha(1)
  ;
  (self._uiTreeFriendBackStatic):SetShow(true)
  ;
  (self._uiTreeFriendOverStatic):SetShow(true)
  local friendGroupNoDefault = -1
  local friendGroupNoPartyFriend = -2
  local friendGroupCount = RequestFriends_getFriendGroupCount()
  local indexCnt = 0
  local groupIndexCnt = 0
  for groupIndex = 0, friendGroupCount - 1 do
    local friendGroup = RequestFriends_getFriendGroupAt(groupIndex)
    local rootItem = (self._uiTreeFriend):createRootItem()
    if friendGroup:getGroupNo() == friendGroupNoDefault then
      rootItem:SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_GROUP_ETC"))
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R12 in 'UnsetPending'

      _groupListData._defaultGroupIndex = indexCnt
    else
      if friendGroup:getGroupNo() == friendGroupNoPartyFriend then
        rootItem:SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_GROUP_PARTY"))
        -- DECOMPILER ERROR at PC69: Confused about usage of register: R12 in 'UnsetPending'

        _groupListData._partyplayGroupIndex = indexCnt
      else
        rootItem:SetText(friendGroup:getName())
      end
    end
    rootItem:SetCustomData(rootItem)
    ;
    (self._uiTreeFriend):AddRootItem(rootItem)
    -- DECOMPILER ERROR at PC84: Confused about usage of register: R12 in 'UnsetPending'

    ;
    (_groupListData._groupInfo)[indexCnt] = friendGroup
    -- DECOMPILER ERROR at PC87: Confused about usage of register: R12 in 'UnsetPending'

    ;
    (_groupListData._groupInfoByGroupIndex)[groupIndex] = friendGroup
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R12 in 'UnsetPending'

    _groupListData._groupCount = friendGroupCount
    indexCnt = indexCnt + 1
    groupIndexCnt = indexCnt
    if friendGroup:isHide() == false then
      local friendCount = friendGroup:getFriendCount()
      for friendIndex = 0, friendCount - 1 do
        local friendInfo = friendGroup:getFriendAt(friendIndex)
        local childItem = (self._uiTreeFriend):createChildItem()
        local friendName = friendInfo:getName()
        if friendInfo:isOnline() == false then
          local s64_lastLogoutTime = friendInfo:getLastLogoutTime_s64()
          friendName = friendName .. "(" .. convertStringFromDatetimeOverHourForFriends(s64_lastLogoutTime) .. ")"
        else
          do
            if friendInfo:getWp() > -1 and friendInfo:getExplorationPoint() > -1 then
              friendName = friendName .. "(" .. friendInfo:getCharacterName() .. ", " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. tostring(friendInfo:getLevel()) .. ") " .. tostring(friendInfo:getWp()) .. "/" .. tostring(friendInfo:getExplorationPoint())
            else
              friendName = friendName .. "(" .. PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_ONLINE") .. ")"
            end
            childItem:SetText(friendName)
            childItem:SetCustomData(childItem)
            ;
            (self._uiTreeFriend):AddItem(childItem, rootItem)
            local messageList = ToClient_GetFriendMessageListByUserNo(friendInfo:getUserNo())
            if messageList ~= nil then
              local messageCount = messageList:getMessageCount()
              if messageCount > 0 then
                local childIcon = childItem:GetChildIcon()
                childIcon:SetText(messageCount)
                childIcon:SetTextureByPath("New_UI_Common_forLua/Widget/Character_Main/Knowledge_00.dds")
                childIcon:SetTextureUV(196, 1, 20, 20)
                childIcon:SetIconSize(14, 14)
              end
            end
            do
              do
                -- DECOMPILER ERROR at PC208: Confused about usage of register: R21 in 'UnsetPending'

                ;
                (_friendListData._friendInfo)[indexCnt] = friendInfo
                indexCnt = indexCnt + 1
                -- DECOMPILER ERROR at PC210: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC210: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC210: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC210: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
      if friendCount > 0 then
        (self._uiTreeFriend):SetSelectItem(groupIndexCnt)
      end
    end
  end
  ;
  (self._uiTreeFriend):RefreshOpenList()
end

FriendList:initialize()
registerEvent("ResponseFriendList_updateFriends", "ResponseFriendList_updateFriends")
registerEvent("FromClient_NoticeNewMessage", "FromClient_NoticeNewMessage")
ResponseFriendList_updateFriends = function()
  -- function num : 0_19 , upvalues : FriendList
  FriendList:updateList()
end

Friend_CloseWindow = function()
  -- function num : 0_20
  FriendList_hide()
end

FromClient_NoticeNewMessage = function(isSoundNotice, isEffectNotice)
  -- function num : 0_21
  if isEffectNotice and Panel_FriendList:GetShow() == false then
    UIMain_FriendListUpdate()
    UIMain_FriendsUpdate()
  end
  if isSoundNotice then
    audioPostEvent_SystemUi(3, 11)
  end
end

local RequestFriendList = {_selectFriendIndex; _maxFriendCount = 30, _uiRequestFriendList = (UI.getChildControl)(Panel_FriendList, "Listbox_RequestFriend"), _uiBackGround = (UI.getChildControl)(Panel_FriendList, "Static_OfferWindow"), _uiClose = (UI.getChildControl)(Panel_FriendList, "RequestFriend_Close"), _uiApply = (UI.getChildControl)(Panel_FriendList, "Button_Apply"), _uiRefuse = (UI.getChildControl)(Panel_FriendList, "Button_Dismiss"), _uiPartLine = (UI.getChildControl)(Panel_FriendList, "Static_RequestFriendPartLine"), _uiTitleName = (UI.getChildControl)(Panel_FriendList, "StaticText_RequestFriendName"), _uiScroll = nil, _uiScrollCtrlButton = nil, 
_friendList = {}
, _slotRows = 12}
friend_clickCloseRequestFriendButton = function()
  -- function num : 0_22
  AddFriendList_hide()
end

RequestFriendList.SetShow = function(self, isShow)
  -- function num : 0_23 , upvalues : RequestFriendList
  (RequestFriendList._uiRequestFriendList):SetShow(isShow)
  ;
  (RequestFriendList._uiBackGround):SetShow(isShow)
  ;
  (RequestFriendList._uiClose):SetShow(isShow)
  ;
  (RequestFriendList._uiApply):SetShow(isShow)
  ;
  (RequestFriendList._uiRefuse):SetShow(isShow)
  ;
  (RequestFriendList._uiPartLine):SetShow(isShow)
  ;
  (RequestFriendList._uiTitleName):SetShow(isShow)
end

RequestFriendList.initialize = function(self)
  -- function num : 0_24
  self._uiScroll = (UI.getChildControl)(self._uiRequestFriendList, "RequestFriend_Scroll")
  ;
  (self._uiScroll):SetControlTop()
  ;
  (self._uiRequestFriendList):addInputEvent("Mouse_LUp", "clickRequestList()")
  ;
  (self._uiClose):addInputEvent("Mouse_LUp", "friend_clickCloseRequestFriendButton()")
  self._selectFriendIndex = -1
  ;
  (self._uiApply):addInputEvent("Mouse_LUp", "friend_clickAcceptFriend()")
  ;
  (self._uiRefuse):addInputEvent("Mouse_LUp", "friend_clickRefuseFriend()")
  self:SetShow(false)
end

friend_clickAcceptFriend = function()
  -- function num : 0_25 , upvalues : RequestFriendList
  if RequestFriendList._selectFriendIndex ~= -1 then
    requestFriendList_acceptFriend(RequestFriendList._selectFriendIndex)
  end
end

friend_clickRefuseFriend = function()
  -- function num : 0_26 , upvalues : RequestFriendList
  if RequestFriendList._selectFriendIndex ~= -1 then
    requestFriendList_refuseFriend(RequestFriendList._selectFriendIndex)
  end
end

clickRequestList = function()
  -- function num : 0_27 , upvalues : RequestFriendList
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  RequestFriendList._selectFriendIndex = (RequestFriendList._uiRequestFriendList):GetSelectIndex()
end

RequestFriendList.updateList = function(self)
  -- function num : 0_28 , upvalues : UI_color
  local listControl = self._uiRequestFriendList
  listControl:DeleteAll()
  local friendCount = RequestFriends_getAddFriendCount()
  for friendIndex = 0, friendCount - 1 do
    local addFriendInfo = RequestFriends_getAddFriendAt(friendIndex)
    listControl:AddItemWithLineFeed(addFriendInfo:getName(), UI_color.C_FFC4BEBE)
  end
  ;
  (UIScroll.SetButtonSize)(self._uiScroll, self._slotRows, friendCount)
  if friendCount > 0 then
    self:SetShow(true)
  end
  FGlobal_NewFriendAlertOff()
end

RequestFriendList:initialize()
registerEvent("ResponseFriendList_updateAddFriends", "ResponseFriendList_updateAddFriends")
AddFriendList_show = function()
  -- function num : 0_29 , upvalues : RequestFriendList
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  self._selectFriendIndex = -1
  RequestFriendList:SetShow(true)
  local isNew = RequestFriendList_getAddFriendList()
  RequestFriendList:updateList()
end

AddFriendList_hide = function()
  -- function num : 0_30 , upvalues : RequestFriendList
  RequestFriendList:SetShow(false)
end

ResponseFriendList_updateAddFriends = function()
  -- function num : 0_31 , upvalues : RequestFriendList
  RequestFriendList:updateList()
end

local PopupAddFriend = {_uiBackGround = (UI.getChildControl)(Panel_FriendList, "Static_FriendName_BG"), _uiEditName = (UI.getChildControl)(Panel_FriendList, "Edit_FriendName"), _uiYesButton = (UI.getChildControl)(Panel_FriendList, "Button_AddFriend_Yes"), _uiNoButton = (UI.getChildControl)(Panel_FriendList, "Button_AddFriend_No"), _uiCloseButton = (UI.getChildControl)(Panel_FriendList, "Button_AddFriend_Close"), _uiStaticTitle = (UI.getChildControl)(Panel_FriendList, "StaticText_AddFriend"), _uiCheckUserNickName = (UI.getChildControl)(Panel_FriendList, "CheckButton_IsUserNickName")}
PopupAddFriend.SetShow = function(self, isShow)
  -- function num : 0_32 , upvalues : IM
  (self._uiBackGround):SetShow(isShow)
  ;
  (self._uiEditName):SetShow(isShow)
  ;
  (self._uiYesButton):SetShow(isShow)
  ;
  (self._uiNoButton):SetShow(isShow)
  ;
  (self._uiCloseButton):SetShow(isShow)
  ;
  (self._uiStaticTitle):SetShow(isShow)
  ;
  (self._uiCheckUserNickName):SetShow(isShow)
  if isShow then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
    SetFocusEdit(self._uiEditName)
    ;
    (self._uiEditName):SetMaxInput(getGameServiceTypeUserNickNameLength())
  else
    if AllowChangeInputMode() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      SetFocusChatting()
    end
  end
  ;
  (self._uiEditName):SetEditText("", true)
end

PopupAddFriend.initialize = function(self)
  -- function num : 0_33
  (self._uiYesButton):addInputEvent("Mouse_LUp", "friend_clickAddFriend()")
  ;
  (self._uiNoButton):addInputEvent("Mouse_LUp", "friend_clickAddFriendClose()")
  ;
  (self._uiCloseButton):addInputEvent("Mouse_LUp", "friend_clickAddFriendClose()")
  ;
  (self._uiEditName):addInputEvent("Mouse_LUp", "friend_ChangeInputMode()")
  ;
  (self._uiCheckUserNickName):addInputEvent("Mouse_LUp", "friend_ChangeNickNameMode()")
  ;
  (self._uiCheckUserNickName):SetPosX((self._uiBackGround):GetPosX() + 15)
  ;
  (self._uiCheckUserNickName):SetPosY((self._uiBackGround):GetPosY() + 40)
  ;
  (self._uiCheckUserNickName):SetCheck(true)
  ;
  (self._uiCheckUserNickName):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_BTN_NICKNAME"))
  ;
  (self._uiEditName):RegistReturnKeyEvent("friend_clickAddFriend()")
  self:SetShow(false)
  friend_ChangeNickNameMode()
end

friend_clickAddFriend = function()
  -- function num : 0_34 , upvalues : PopupAddFriend
  local isNickName = (PopupAddFriend._uiCheckUserNickName):IsCheck()
  requestFriendList_addFriend((PopupAddFriend._uiEditName):GetEditText(), isNickName)
  PopupAddFriend:SetShow(false)
  ClearFocusEdit()
end

friend_clickAddFriendClose = function()
  -- function num : 0_35 , upvalues : PopupAddFriend
  PopupAddFriend:SetShow(false)
  ClearFocusEdit()
end

friend_ChangeInputMode = function()
  -- function num : 0_36 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

friend_ChangeNickNameMode = function()
  -- function num : 0_37 , upvalues : PopupAddFriend
  local isNickName = not (PopupAddFriend._uiCheckUserNickName):IsCheck()
  if isNickName then
    (PopupAddFriend._uiCheckUserNickName):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_BTN_NICKNAME"))
  else
    ;
    (PopupAddFriend._uiCheckUserNickName):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_BTN_CHARACTERNAME"))
  end
end

AddFriendInput_CheckCurrentUiEdit = function(targetUI)
  -- function num : 0_38 , upvalues : PopupAddFriend
  do return targetUI ~= nil and targetUI:GetKey() == (PopupAddFriend._uiEditName):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

PopupAddFriend:initialize()
local PopupRenameGroup = {_uiBackGround = (UI.getChildControl)(Panel_FriendList, "Static_GroupName_BG"), _uiEditName = (UI.getChildControl)(Panel_FriendList, "Edit_GroupName"), _uiYesButton = (UI.getChildControl)(Panel_FriendList, "Button_GroupName_Yes"), _uiNoButton = (UI.getChildControl)(Panel_FriendList, "Button_GroupName_No"), _uiCloseButton = (UI.getChildControl)(Panel_FriendList, "Button_GroupName_Close"), _uiStaticTitle = (UI.getChildControl)(Panel_FriendList, "StaticText_ChangeGroupName")}
PopupRenameGroup.SetShow = function(self, isShow)
  -- function num : 0_39 , upvalues : IM
  self._isShow = isShow
  ;
  (self._uiBackGround):SetShow(isShow)
  ;
  (self._uiEditName):SetShow(isShow)
  ;
  (self._uiYesButton):SetShow(isShow)
  ;
  (self._uiNoButton):SetShow(isShow)
  ;
  (self._uiCloseButton):SetShow(isShow)
  ;
  (self._uiStaticTitle):SetShow(isShow)
  if isShow then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  else
    if AllowChangeInputMode() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      SetFocusChatting()
    end
  end
  ;
  (self._uiEditName):SetEditText("", true)
end

PopupRenameGroup.initialize = function(self)
  -- function num : 0_40
  (self._uiYesButton):addInputEvent("Mouse_LUp", "friend_clickRenameGroup()")
  ;
  (self._uiNoButton):addInputEvent("Mouse_LUp", "friend_clickRenameGroupClose()")
  ;
  (self._uiCloseButton):addInputEvent("Mouse_LUp", "friend_clickRenameGroupClose()")
  ;
  (self._uiEditName):addInputEvent("Mouse_LUp", "friend_ChangeInputMode()")
  self:SetShow(false)
  ;
  (self._uiEditName):SetMaxInput(getGameServiceTypeUserNickNameLength())
end

friend_clickRenameGroup = function()
  -- function num : 0_41 , upvalues : _groupListData, PopupRenameGroup
  do
    if _groupListData._selectedGroupIndex >= 0 then
      local friendGroup = (_groupListData._groupInfo)[_groupListData._selectedGroupIndex]
      if (PopupRenameGroup._uiEditName):GetEditText() == friendGroup:getName() then
        return 
      end
      if (PopupRenameGroup._uiEditName):GetEditText() == "" then
        return 
      end
      requestFriendList_renameGroup(((_groupListData._groupInfo)[_groupListData._selectedGroupIndex]):getGroupNo(), (PopupRenameGroup._uiEditName):GetEditText())
    end
    PopupRenameGroup:SetShow(false)
  end
end

friend_clickRenameGroupClose = function()
  -- function num : 0_42 , upvalues : PopupRenameGroup
  PopupRenameGroup:SetShow(false)
end

PopupRenameGroup:initialize()
local stylePopupBackGround = (UI.getChildControl)(Panel_FriendList, "Static_Function_BG")
local styleMenuButton = (UI.getChildControl)(Panel_FriendList, "Style_Function")
stylePopupBackGround:SetShow(false)
styleMenuButton:SetShow(false)
local PopupGroupMenu = {_uiBackGround, _uiRenameGroup, _uiAddGroup}
PopupGroupMenu.initialize = function(self)
  -- function num : 0_43 , upvalues : UI_PUCT, stylePopupBackGround, styleMenuButton
  self._uiBackGround = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_FriendList, "FriendPopupGroupMenu")
  CopyBaseProperty(stylePopupBackGround, self._uiBackGround)
  self._uiRenameGroup = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self._uiBackGround, "FriendPopupRenameGroup")
  CopyBaseProperty(styleMenuButton, self._uiRenameGroup)
  self._uiAddGroup = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self._uiBackGround, "FriendPopupAddGroup")
  CopyBaseProperty(styleMenuButton, self._uiAddGroup)
  local buttonSizeX = styleMenuButton:GetSizeX()
  local buttonSizeY = styleMenuButton:GetSizeY()
  ;
  (self._uiBackGround):SetSize(buttonSizeX, buttonSizeY * 2)
  ;
  (self._uiRenameGroup):SetPosX(0)
  ;
  (self._uiRenameGroup):SetPosY(0)
  ;
  (self._uiAddGroup):SetPosX(0)
  ;
  (self._uiAddGroup):SetPosY(buttonSizeY)
  ;
  (self._uiRenameGroup):SetShow(true)
  ;
  (self._uiAddGroup):SetShow(true)
  ;
  (self._uiRenameGroup):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_RENAME"))
  ;
  (self._uiAddGroup):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_ADD_GROUP"))
  ;
  (self._uiRenameGroup):addInputEvent("Mouse_LUp", "friend_renameFriendGroup()")
  ;
  (self._uiAddGroup):addInputEvent("Mouse_LUp", "friend_addFriendGroup()")
  ;
  (self._uiBackGround):SetShow(false)
end

PopupGroupMenu.SetShow = function(self, isShow)
  -- function num : 0_44 , upvalues : _groupListData, FriendList
  if _groupListData._defaultGroupIndex == _groupListData._selectedGroupIndex then
    (self._uiRenameGroup):SetEnable(false)
    ;
    (self._uiRenameGroup):SetMonoTone(true)
    ;
    (self._uiRenameGroup):SetIgnore(true)
    ;
    (self._uiAddGroup):SetEnable(true)
    ;
    (self._uiAddGroup):SetMonoTone(false)
    ;
    (self._uiAddGroup):SetIgnore(false)
  else
    if _groupListData._partyplayGroupIndex == _groupListData._selectedGroupIndex then
      (self._uiRenameGroup):SetEnable(false)
      ;
      (self._uiRenameGroup):SetMonoTone(true)
      ;
      (self._uiRenameGroup):SetIgnore(true)
      ;
      (self._uiAddGroup):SetEnable(false)
      ;
      (self._uiAddGroup):SetMonoTone(true)
      ;
      (self._uiAddGroup):SetIgnore(true)
    else
      ;
      (self._uiRenameGroup):SetEnable(true)
      ;
      (self._uiRenameGroup):SetMonoTone(false)
      ;
      (self._uiRenameGroup):SetIgnore(false)
      ;
      (self._uiAddGroup):SetEnable(true)
      ;
      (self._uiAddGroup):SetMonoTone(false)
      ;
      (self._uiAddGroup):SetIgnore(false)
    end
  end
  ;
  (self._uiBackGround):SetShow(isShow)
  -- DECOMPILER ERROR at PC91: Confused about usage of register: R2 in 'UnsetPending'

  FriendList._isGroupMenuShow = isShow
end

PopupGroupMenu.setPos = function(self, x, y)
  -- function num : 0_45
  (self._uiBackGround):SetPosX(x)
  ;
  (self._uiBackGround):SetPosY(y)
end

PopupGroupMenu:initialize()
local PopupFriendMenu = {_uiBackGround, _uiPartyInvite, _uiMessanger, _uiMoveGroup, _uiDelete}
PopupFriendMenu.initialize = function(self)
  -- function num : 0_46 , upvalues : UI_PUCT, styleMenuButton
  self._uiBackGround = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_FriendList, "FriendPopupFriendMenu")
  self._uiPartyInvite = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self._uiBackGround, "FriendPopupPartyInvite")
  CopyBaseProperty(styleMenuButton, self._uiPartyInvite)
  self._uiMessanger = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self._uiBackGround, "FriendPopupWhisper")
  CopyBaseProperty(styleMenuButton, self._uiMessanger)
  self._uiMoveGroup = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self._uiBackGround, "FriendPopupMoveGroup")
  CopyBaseProperty(styleMenuButton, self._uiMoveGroup)
  self._uiDelete = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self._uiBackGround, "FriendPopupDeleteFriend")
  CopyBaseProperty(styleMenuButton, self._uiDelete)
  local buttonSizeX = styleMenuButton:GetSizeX()
  local buttonSizeY = styleMenuButton:GetSizeY()
  ;
  (self._uiBackGround):SetSize(buttonSizeX, buttonSizeY * 2)
  ;
  (self._uiPartyInvite):SetPosX(0)
  ;
  (self._uiPartyInvite):SetPosY(0)
  ;
  (self._uiMessanger):SetPosX(0)
  ;
  (self._uiMessanger):SetPosY(buttonSizeY)
  ;
  (self._uiMoveGroup):SetPosX(0)
  ;
  (self._uiMoveGroup):SetPosY(buttonSizeY * 2)
  ;
  (self._uiDelete):SetPosX(0)
  ;
  (self._uiDelete):SetPosY(buttonSizeY * 3)
  ;
  (self._uiPartyInvite):SetShow(true)
  ;
  (self._uiMessanger):SetShow(true)
  ;
  (self._uiMoveGroup):SetShow(true)
  ;
  (self._uiDelete):SetShow(true)
  ;
  (self._uiPartyInvite):SetText(PAGetString(Defines.StringSheet_GAME, "INTERACTION_MENU3"))
  ;
  (self._uiMessanger):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_WHISPER"))
  ;
  (self._uiMoveGroup):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_CHANGE_GROUP"))
  ;
  (self._uiDelete):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_REMOVE_FRIEND"))
  ;
  (self._uiPartyInvite):addInputEvent("Mouse_LUp", "friend_PartyInvite()")
  ;
  (self._uiMessanger):addInputEvent("Mouse_LUp", "friend_Messanger()")
  ;
  (self._uiMoveGroup):addInputEvent("Mouse_LUp", "friend_groupMoveList()")
  ;
  (self._uiDelete):addInputEvent("Mouse_LUp", "friend_deleteFriend()")
  ;
  (self._uiBackGround):SetShow(false)
end

PopupFriendMenu.SetShow = function(self, isShow)
  -- function num : 0_47 , upvalues : _friendListData, FriendList
  if isShow then
    local isOnline = ((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):isOnline()
    local isMessage = RequestFriendList_isMessageList(((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):getUserNo())
    if isOnline == false and isMessage == false then
      (self._uiMessanger):SetEnable(false)
      ;
      (self._uiMessanger):SetMonoTone(true)
      ;
      (self._uiMessanger):SetIgnore(true)
    else
      ;
      (self._uiMessanger):SetEnable(true)
      ;
      (self._uiMessanger):SetMonoTone(false)
      ;
      (self._uiMessanger):SetIgnore(false)
    end
  end
  do
    ;
    (self._uiBackGround):SetShow(isShow)
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

    FriendList._isFriendMenuShow = isShow
  end
end

PopupFriendMenu.setPos = function(self, x, y)
  -- function num : 0_48
  (self._uiBackGround):SetPosX(x)
  ;
  (self._uiBackGround):SetPosY(y)
end

PopupFriendMenu:initialize()
local PopupPartyFriendMenu = {_uiBackGround, _uiAddFriend, _uiDeletePartyFriend}
PopupPartyFriendMenu.initialize = function(self)
  -- function num : 0_49 , upvalues : UI_PUCT, styleMenuButton
  self._uiBackGround = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_FriendList, "FriendPopupPartyFriendMenu")
  self._uiAddFriend = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self._uiBackGround, "FriendPopupRequestAddFriend")
  self._uiDeletePartyFriend = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self._uiBackGround, "FriendPopupRequestDeletePartyFriend")
  CopyBaseProperty(styleMenuButton, self._uiAddFriend)
  CopyBaseProperty(styleMenuButton, self._uiDeletePartyFriend)
  local buttonSizeX = styleMenuButton:GetSizeX()
  local buttonSizeY = styleMenuButton:GetSizeY()
  ;
  (self._uiBackGround):SetSize(buttonSizeX, buttonSizeY)
  ;
  (self._uiDeletePartyFriend):SetSize(buttonSizeX, buttonSizeY)
  ;
  (self._uiAddFriend):SetPosX(0)
  ;
  (self._uiAddFriend):SetPosY(0)
  ;
  (self._uiDeletePartyFriend):SetPosX(0)
  ;
  (self._uiDeletePartyFriend):SetPosY((self._uiAddFriend):GetSizeY())
  ;
  (self._uiAddFriend):SetShow(true)
  ;
  (self._uiDeletePartyFriend):SetShow(true)
  ;
  (self._uiAddFriend):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_ADD_FRIEND"))
  ;
  (self._uiAddFriend):addInputEvent("Mouse_LUp", "friend_requestAddFriend()")
  ;
  (self._uiDeletePartyFriend):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_INGAMECASHSHOP_NEWCART_DELETEITEM"))
  ;
  (self._uiDeletePartyFriend):addInputEvent("Mouse_LUp", "friend_deleteFriend()")
  ;
  (self._uiBackGround):SetShow(false)
end

PopupPartyFriendMenu.SetShow = function(self, isShow)
  -- function num : 0_50 , upvalues : FriendList
  (self._uiBackGround):SetShow(isShow)
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  FriendList._isFriendMenuShow = isShow
end

PopupPartyFriendMenu.setPos = function(self, x, y)
  -- function num : 0_51
  (self._uiBackGround):SetPosX(x)
  ;
  (self._uiBackGround):SetPosY(y)
end

PopupPartyFriendMenu:initialize()
local PopupGroupList = {_uiBackGround; 
_uiMoveGroups = {}
, _maxGroupCount = 5}
PopupGroupList.initialize = function(self)
  -- function num : 0_52 , upvalues : UI_PUCT, styleMenuButton
  self._uiBackGround = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_FriendList, "FriendPopupGroupList")
  for groupIndex = 0, self._maxGroupCount - 1 do
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R5 in 'UnsetPending'

    (self._uiMoveGroups)[groupIndex] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, self._uiBackGround, "FriendPopupMoveGroups_" .. groupIndex)
    CopyBaseProperty(styleMenuButton, (self._uiMoveGroups)[groupIndex])
    local buttonSizeY = styleMenuButton:GetSizeY()
    ;
    ((self._uiMoveGroups)[groupIndex]):SetSize(styleMenuButton:GetSizeX() + styleMenuButton:GetSizeX() / 3, styleMenuButton:GetSizeY())
    ;
    ((self._uiMoveGroups)[groupIndex]):SetPosX(0)
    ;
    ((self._uiMoveGroups)[groupIndex]):SetPosY(buttonSizeY * groupIndex)
    ;
    ((self._uiMoveGroups)[groupIndex]):addInputEvent("Mouse_LUp", "clickedFriend_moveGroup(" .. groupIndex .. ")")
  end
  ;
  (self._uiBackGround):SetShow(false)
end

PopupGroupList.updateGroups = function(self)
  -- function num : 0_53 , upvalues : _groupListData, styleMenuButton
  for index = 0, self._maxGroupCount - 1 do
    ((self._uiMoveGroups)[index]):SetShow(false)
  end
  local groupCount = _groupListData._groupCount
  local buttonSizeX = styleMenuButton:GetSizeX()
  local buttonSizeY = styleMenuButton:GetSizeY()
  local friendGroupNoPartyFriend = -2
  ;
  (self._uiBackGround):SetSize(buttonSizeX, buttonSizeY * groupCount)
  for groupIndex = 0, groupCount - 1 do
    local groupName = ((_groupListData._groupInfoByGroupIndex)[groupIndex]):getName()
    if ((_groupListData._groupInfoByGroupIndex)[groupIndex]):getGroupNo() ~= friendGroupNoPartyFriend then
      if groupName == "" then
        ((self._uiMoveGroups)[groupIndex]):SetText(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_GROUP_ETC"))
      else
        ;
        ((self._uiMoveGroups)[groupIndex]):SetText(groupName)
      end
      ;
      ((self._uiMoveGroups)[groupIndex]):SetShow(true)
    end
  end
end

PopupGroupList.SetShow = function(self, isShow)
  -- function num : 0_54 , upvalues : PopupGroupList
  (self._uiBackGround):SetShow(isShow)
  if isShow then
    PopupGroupList:updateGroups()
  end
end

PopupGroupList.setPos = function(self, x, y)
  -- function num : 0_55
  (self._uiBackGround):SetPosX(x)
  ;
  (self._uiBackGround):SetPosY(y)
end

PopupGroupList:initialize()
clickFriendGroupIcon = function(groupIndex)
  -- function num : 0_56 , upvalues : _groupListData
  requestFriendList_checkGroup(((_groupListData._groupInfoByGroupIndex)[groupIndex]):getGroupNo())
end

clickFriendGroup = function(groupIndex)
  -- function num : 0_57 , upvalues : _groupListData, PopupFriendMenu, PopupPartyFriendMenu, PopupGroupMenu
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  _groupListData._selectedGroupIndex = groupIndex
  PopupFriendMenu:SetShow(false)
  PopupPartyFriendMenu:SetShow(false)
  PopupGroupMenu:SetShow(true)
  PopupGroupMenu:setPos(((_groupListData._uiGroups)[groupIndex]):GetPosX() + 30, ((_groupListData._uiGroups)[groupIndex]):GetPosY())
end

friend_renameFriendGroup = function()
  -- function num : 0_58 , upvalues : PopupRenameGroup, PopupGroupMenu
  PopupRenameGroup:SetShow(true)
  PopupGroupMenu:SetShow(false)
end

friend_addFriendGroup = function()
  -- function num : 0_59 , upvalues : PopupGroupMenu
  requestFriendList_addFriendGroup(PAGetString(Defines.StringSheet_GAME, "FRIEND_TEXT_NEW_GROUPNAME"))
  PopupGroupMenu:SetShow(false)
end

friend_deleteFriendGroup = function()
  -- function num : 0_60 , upvalues : PopupGroupMenu
  PopupGroupMenu:SetShow(false)
end

clickFriendList = function(isRUp)
  -- function num : 0_61 , upvalues : FriendList, _groupListData, PopupFriendMenu, PopupPartyFriendMenu, PopupGroupMenu, _friendListData, PopupGroupList
  local self = FriendList
  ;
  (self._uiTreeFriend):SetSelectItemMousePoint()
  local friendIndex = (self._uiTreeFriend):GetSelectItem()
  if friendIndex == nil then
    return 
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R3 in 'UnsetPending'

  if isRUp then
    if (CppEnums.TreeItemType).PA_TREE_ITEM_ROOT == friendIndex:GetType() then
      _groupListData._selectedGroupIndex = friendIndex:GetIndex()
      PopupFriendMenu:SetShow(false)
      PopupPartyFriendMenu:SetShow(false)
      PopupGroupMenu:SetShow(true)
      PopupGroupMenu:setPos(getMousePosX() - (self._mainPanel):GetPosX(), getMousePosY() - (self._mainPanel):GetPosY())
    else
      -- DECOMPILER ERROR at PC54: Confused about usage of register: R3 in 'UnsetPending'

      _friendListData._selectedFriendIndex = friendIndex:GetIndex()
      PopupGroupMenu:SetShow(false)
      if ((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):getFriendType() == 1 then
        PopupPartyFriendMenu:SetShow(true)
        PopupFriendMenu:SetShow(false)
        PopupPartyFriendMenu:setPos(getMousePosX() - (self._mainPanel):GetPosX(), getMousePosY() - (self._mainPanel):GetPosY())
      else
        PopupFriendMenu:SetShow(true)
        PopupPartyFriendMenu:SetShow(false)
        PopupFriendMenu:setPos(getMousePosX() - (self._mainPanel):GetPosX(), getMousePosY() - (self._mainPanel):GetPosY())
      end
    end
    PopupGroupList:SetShow(false)
  else
    if self._isFriendMenuShow or self._isGroupMenuShow then
      friend_closeFriendMenu()
    else
    end
  end
  -- DECOMPILER ERROR at PC140: Confused about usage of register: R3 in 'UnsetPending'

  if (CppEnums.TreeItemType).PA_TREE_ITEM_ROOT == friendIndex:GetType() then
    _friendListData._selectedFriendIndex = friendIndex:GetIndex()
    -- DECOMPILER ERROR at PC154: Confused about usage of register: R3 in 'UnsetPending'

    if ((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):getFriendType() == 1 then
      _friendListData._selectedFriendIndex = friendIndex:GetIndex()
      friend_Messanger()
    end
  end
end

friend_PartyInvite = function()
  -- function num : 0_62 , upvalues : _friendListData
  local userCharacterName = ((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):getCharacterName()
  local isOnline = ((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):isOnline()
  local isSelfPlayerPlayingPvPMatch = (getSelfPlayer()):isDefinedPvPMatch()
  if isSelfPlayerPlayingPvPMatch == false then
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ACK_INVITE", "targetName", userCharacterName))
  end
  RequestParty_inviteCharacter(userCharacterName)
end

friend_Messanger = function()
  -- function num : 0_63 , upvalues : _friendListData, PopupFriendMenu
  local userNo = ((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):getUserNo()
  local userName = ((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):getName()
  local isOnline = ((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):isOnline()
  RequestFriendList_OpenMessanger(userNo, userName, isOnline)
  PopupFriendMenu:SetShow(false)
end

friend_groupMoveList = function()
  -- function num : 0_64 , upvalues : PopupGroupList, PopupFriendMenu
  PopupGroupList:SetShow(true)
  PopupGroupList:setPos((PopupFriendMenu._uiBackGround):GetPosX() + (PopupFriendMenu._uiBackGround):GetSizeX(), (PopupFriendMenu._uiBackGround):GetPosY())
end

friend_requestAddFriend = function()
  -- function num : 0_65 , upvalues : _friendListData, PopupPartyFriendMenu
  requestFriendList_addFriend(((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):getName())
  PopupPartyFriendMenu:SetShow(false)
end

friend_deleteFriend = function()
  -- function num : 0_66 , upvalues : _friendListData, PopupFriendMenu, PopupPartyFriendMenu
  requestFriendList_deleteFriend(((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):getUserNo())
  PopupFriendMenu:SetShow(false)
  PopupPartyFriendMenu:SetShow(false)
end

clickedFriend_moveGroup = function(groupIndex)
  -- function num : 0_67 , upvalues : _friendListData, _groupListData, PopupFriendMenu, PopupGroupList
  requestFriendList_moveGroup(((_friendListData._friendInfo)[_friendListData._selectedFriendIndex]):getUserNo(), ((_groupListData._groupInfoByGroupIndex)[groupIndex]):getGroupNo())
  PopupFriendMenu:SetShow(false)
  PopupGroupList:SetShow(false)
end

Panel_FriendList:addInputEvent("Mouse_Out", "friend_closeFriendMenu()")
local uiRequestList = (UI.getChildControl)(Panel_FriendList, "Button_Offer")
uiRequestList:addInputEvent("Mouse_LUp", "friend_clickRequestButton()")
local uiAddFriend = (UI.getChildControl)(Panel_FriendList, "Button_AddFriend")
uiAddFriend:addInputEvent("Mouse_LUp", "friend_clickAddFriendButton()")
friend_closeFriendMenu = function()
  -- function num : 0_68 , upvalues : PopupFriendMenu, PopupPartyFriendMenu, PopupGroupMenu, PopupGroupList
  PopupFriendMenu:SetShow(false)
  PopupPartyFriendMenu:SetShow(false)
  PopupGroupMenu:SetShow(false)
  PopupGroupList:SetShow(false)
end

friend_clickRequestButton = function()
  -- function num : 0_69 , upvalues : RequestFriendList
  if (RequestFriendList._uiBackGround):GetShow() then
    AddFriendList_hide()
  else
    AddFriendList_show()
  end
end

friend_clickAddFriendButton = function()
  -- function num : 0_70 , upvalues : PopupAddFriend
  if (PopupAddFriend._uiBackGround):GetShow() then
    PopupAddFriend:SetShow(false)
  else
    PopupAddFriend:SetShow(true)
  end
end

FriendList_ShowToggle = function()
  -- function num : 0_71
  if (CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode == (UI.Get_ProcessorInputMode)() then
    return 
  end
  if Panel_FriendList:GetShow() == true then
    FriendList_hide()
  else
    FriendList_show()
  end
end

FriendList_show = function()
  -- function num : 0_72 , upvalues : friendsBTN
  friendsBTN:EraseAllEffect()
  Panel_FriendList:SetShow(true, true)
end

FriendList_hide = function()
  -- function num : 0_73 , upvalues : PopupAddFriend, RequestFriendList, PopupFriendMenu, PopupPartyFriendMenu, PopupGroupMenu, PopupGroupList
  PopupAddFriend:SetShow(false)
  RequestFriendList:SetShow(false)
  PopupFriendMenu:SetShow(false)
  PopupPartyFriendMenu:SetShow(false)
  PopupGroupMenu:SetShow(false)
  PopupGroupList:SetShow(false)
  Panel_FriendList:SetShow(false, true)
end

FromClient_FriendList_onScreenResize = function()
  -- function num : 0_74
  Panel_FriendList:SetPosX(getScreenSizeX() - Panel_FriendList:GetSizeX())
  Panel_FriendList:SetPosY(getScreenSizeY() / 2 - Panel_FriendList:GetSizeY() / 2)
end

FriendList_showAni = function()
  -- function num : 0_75 , upvalues : FriendList, RequestFriendList, UI_ANI_ADV
  local isNew = RequestFriendList_getFriendList()
  FriendList:updateList()
  RequestFriendList_getAddFriendList()
  RequestFriendList:updateList()
  ;
  (UIAni.AlphaAnimation)(1, Panel_FriendList, 0, 0.15)
  local aniInfo1 = Panel_FriendList:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_FriendList:GetSizeX() / 2
  aniInfo1.AxisY = Panel_FriendList:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_FriendList:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_FriendList:GetSizeX() / 2
  aniInfo2.AxisY = Panel_FriendList:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

FriendList_hideAni = function()
  -- function num : 0_76
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_FriendList, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

FromClient_NotifyFriendMessage = function(msgType, strParam1, param1, param2)
  -- function num : 0_77 , upvalues : FriendList
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
    FriendList:updateList()
    FromClient_FriendListUpdateLogOnOffForMessanger(param2, param1)
  end
end

registerEvent("FromClient_GroundMouseClick", "FriendMessanger_KillFocusEdit")
registerEvent("onScreenResize", "FromClient_FriendList_onScreenResize")
registerEvent("FromClient_FriendListUpdateLogOnOffForMessanger", "FromClient_FriendListUpdateLogOnOffForMessanger")
registerEvent("FromClient_NotifyFriendMessage", "FromClient_NotifyFriendMessage")

