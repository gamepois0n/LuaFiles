-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\inn\panel_inn.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Panel_Inn:SetShow(false, true)
Panel_Inn:setMaskingChild(true)
Panel_Inn:ActiveMouseEventEffect(true)
Panel_Inn:setGlassBackground(true)
Panel_Inn:RegisterShowEventFunc(true, "Inn_ShowAni()")
Panel_Inn:RegisterShowEventFunc(false, "Inn_HideAni()")
local _uiBackGround = (UI.getChildControl)(Panel_Inn, "Static_BackGround")
local _styleBG = (UI.getChildControl)(Panel_Inn, "Style_BG")
local _styleButton = (UI.getChildControl)(Panel_Inn, "Style_Button")
local _styleName = (UI.getChildControl)(Panel_Inn, "StaticText_Name")
local _stylePrice = (UI.getChildControl)(Panel_Inn, "StaticText_Price")
local _styleRentable = (UI.getChildControl)(Panel_Inn, "StaticText_Rentable")
local _styleImage = (UI.getChildControl)(Panel_Inn, "Static_Image")
local _styleTime = (UI.getChildControl)(Panel_Inn, "StaticText_Time")
local _styleArea = (UI.getChildControl)(Panel_Inn, "StaticText_Area")
local _styleBasicService = (UI.getChildControl)(Panel_Inn, "StaticText_BasicService")
local _styleSpecialService = (UI.getChildControl)(Panel_Inn, "StaticText_SpecialService")
local _closeButton = (UI.getChildControl)(Panel_Inn, "Button_Win_Close")
local _buttonQuestion = (UI.getChildControl)(Panel_Inn, "Button_Question")
local _noticeText = (UI.getChildControl)(Panel_Inn, "StaticText_Notice")
local _currentInn = (UI.getChildControl)(Panel_Inn, "StaticText_CurrentInn")
local _cancelRentedRoomButton = (UI.getChildControl)(Panel_Inn, "Button_CancelRent")
local _inn_ListPage = (UI.getChildControl)(Panel_Inn, "StaticText_List")
_inn_ListPage:SetShow(true)
local _inn_BtnLeft = (UI.getChildControl)(Panel_Inn, "Button_List_Left")
_inn_BtnLeft:SetShow(true)
local _inn_BtnRight = (UI.getChildControl)(Panel_Inn, "Button_List_Right")
_inn_BtnRight:SetShow(true)
_noticeText:SetTextMode(UI_TM.eTextMode_AutoWrap)
_styleButton:SetShow(false)
local _uiButtonInnList = {}
local roomNumber = -1
local _selectedIndex = 0
local _maxXCount = 1
local _maxYCount = 3
local _currentPage = 0
local _maxPage = 0
local INNLIST_COUNT_PER_PAGE = _maxXCount * _maxYCount
local InnManager = {
_innList = {}
}
-- DECOMPILER ERROR at PC173: Confused about usage of register: R34 in 'UnsetPending'

Inn.createInnSlot = function(index)
  -- function num : 0_0 , upvalues : _styleBG, _styleName, _styleButton, _styleTime, _stylePrice, _styleRentable, _styleImage, _styleArea, _styleBasicService, _styleSpecialService, UI_TM
  local innslot = {}
  innslot._staticBack = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Inn, "Style_BG" .. index)
  innslot._name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, innslot._staticBack, "StaticText_Name" .. index)
  innslot._buttonRent = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, innslot._staticBack, "Button_Rent" .. index)
  innslot._time = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, innslot._staticBack, "StaticText_Time" .. index)
  innslot._price = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, innslot._staticBack, "StaticText_Price" .. index)
  innslot._rentable = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, innslot._staticBack, "StaticText_Rentable" .. index)
  innslot._image = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, innslot._staticBack, "Static_Image" .. index)
  innslot._area = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, innslot._staticBack, "StaticText_Area" .. index)
  innslot._basicService = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, innslot._staticBack, "StaticText_BasicService" .. index)
  innslot._specialService = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, innslot._staticBack, "StaticText_SpecialService" .. index)
  CopyBaseProperty(_styleBG, innslot._staticBack)
  ;
  (innslot._staticBack):SetShow(true)
  CopyBaseProperty(_styleName, innslot._name)
  ;
  (innslot._name):SetShow(true)
  CopyBaseProperty(_styleButton, innslot._buttonRent)
  ;
  (innslot._buttonRent):SetShow(true)
  CopyBaseProperty(_styleTime, innslot._time)
  ;
  (innslot._time):SetShow(true)
  CopyBaseProperty(_stylePrice, innslot._price)
  ;
  (innslot._price):SetShow(true)
  CopyBaseProperty(_styleRentable, innslot._rentable)
  ;
  (innslot._rentable):SetShow(true)
  CopyBaseProperty(_styleImage, innslot._image)
  ;
  (innslot._image):SetShow(true)
  CopyBaseProperty(_styleArea, innslot._area)
  ;
  (innslot._area):SetShow(true)
  CopyBaseProperty(_styleBasicService, innslot._basicService)
  ;
  (innslot._basicService):SetShow(true)
  CopyBaseProperty(_styleSpecialService, innslot._specialService)
  ;
  (innslot._specialService):SetShow(true)
  ;
  (innslot._buttonRent):addInputEvent("Mouse_LUp", "handleInn_Rent(" .. index .. ")")
  innslot.SetPos = function(self, x, y)
    -- function num : 0_0_0 , upvalues : innslot
    (innslot._staticBack):SetPosX(x)
    ;
    (innslot._staticBack):SetPosY(y)
  end

  innslot.SetShow = function(self, isShow)
    -- function num : 0_0_1 , upvalues : innslot
    (innslot._staticBack):SetShow(isShow)
  end

  innslot.SetData = function(self, innData, myInnCharacterKey)
    -- function num : 0_0_2 , upvalues : innslot, UI_TM
    local roomName = innData:getName()
    local roomPrice = innData:getPrice_s64()
    ;
    (innslot._name):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (innslot._name):SetText(roomName)
    ;
    (innslot._price):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INN_PRICE", "roomPrice", tostring(roomPrice)))
    local innCharacterKey = innData:getInnCharacterKey()
    local screenShotPath = ((innData:get()):getObjectStaticStatus()):getHouseScreenShotPath(0)
    local descArea = ((innData:get()):getObjectStaticStatus()):getDescArea()
    local descFeature1 = ((innData:get()):getObjectStaticStatus()):getDescFeature1()
    local descFeature2 = ((innData:get()):getObjectStaticStatus()):getDescFeature2()
    if myInnCharacterKey == innCharacterKey then
      (innslot._buttonRent):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INN_BTN_RENT_CANCEL"))
      ;
      (innslot._rentable):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INN_RENTAL"))
      ;
      (innslot._time):SetShow(true)
      ;
      (innslot._time):SetPosX((innslot._staticBack):GetSizeX() - (innslot._rentable):GetTextSizeX() - (innslot._time):GetSizeX())
    else
      ;
      (innslot._buttonRent):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INN_BTN_RENT"))
      ;
      (innslot._rentable):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INN_RENT_POSSIBEL"))
      ;
      (innslot._time):SetShow(false)
    end
    ;
    (innslot._area):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INN_AREA", "descArea", descArea))
    ;
    (innslot._basicService):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (innslot._basicService):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INN_BASICSERVICES", "descFeature1", descFeature1))
    ;
    (innslot._specialService):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (innslot._specialService):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INN_SPECIALSERVICE", "descFeature2", descFeature2))
    ;
    (innslot._image):ChangeTextureInfoName(screenShotPath)
  end

  return innslot
end

handleInn_Rent = function(index)
  -- function num : 0_1 , upvalues : _currentPage, INNLIST_COUNT_PER_PAGE, roomNumber
  local roomIndex = index + _currentPage * INNLIST_COUNT_PER_PAGE
  local myInnInfoWrapper = nil
  local myInnCharacterKey = 0
  local innData = RequestMentalGame_getInnListAt(roomIndex)
  if myInnInfoWrapper ~= nil then
    myInnCharacterKey = myInnInfoWrapper:getHouseCharacterKey()
  end
  local innCharacterKey = innData:getInnCharacterKey()
  if myInnCharacterKey == innCharacterKey then
    local name = myInnInfoWrapper:getHouseName()
    local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INN_CANCELCONFIRM_MSGBOX", "name", name)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = contentString, functionYes = CancelRentedRoomConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    return 
  end
  do
    roomNumber = roomIndex
    local currentName = innData:getName()
    if myInnInfoWrapper ~= nil then
      local name = myInnInfoWrapper:getHouseName()
      local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INN_CHANGECONFIRM_MSGBOX", "name", name)
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = contentString, functionYes = Request_RentInn, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    else
      do
        local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INN_RENTCONFIRM_MSGBOX", "currentName", currentName)
        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = contentString, functionYes = Request_RentInn, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
      end
    end
  end
end

local startX = 12
local startY = 40
local gapX = 10
local gapY = 10
local sizeX = 120
local sizeY = 190
Inn_ShowAni = function()
  -- function num : 0_2
  (UIAni.fadeInSCR_Down)(Panel_Inn)
  audioPostEvent_SystemUi(1, 0)
end

Inn_HideAni = function()
  -- function num : 0_3 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Inn:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Inn:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(1, 1)
end

InnManager.initialize = function(self)
  -- function num : 0_4 , upvalues : _maxYCount, _maxXCount, sizeX, startX, sizeY, startY, gapY
  for indexY = 0, _maxYCount - 1 do
    for indexX = 0, _maxXCount - 1 do
      local index = indexY * _maxXCount + indexX
      -- DECOMPILER ERROR at PC18: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (self._innList)[index] = (Inn.createInnSlot)(index)
      ;
      ((self._innList)[index]):SetPos(indexX * sizeX + startX, indexY * sizeY + startY + indexY * gapY)
      ;
      ((self._innList)[index]):SetShow(true)
    end
  end
end

InnManager.update = function(self)
  -- function num : 0_5 , upvalues : _currentPage, INNLIST_COUNT_PER_PAGE, _currentInn
  local myInnInfoWrapper = nil
  local myInnCharacterKey = 0
  if myInnInfoWrapper ~= nil then
    myInnCharacterKey = myInnInfoWrapper:getHouseCharacterKey()
  end
  local innCount = RequestMentalGame_getInnListCount()
  local startInnIndex = _currentPage * INNLIST_COUNT_PER_PAGE
  for index = 0, INNLIST_COUNT_PER_PAGE - 1 do
    if startInnIndex <= innCount - 1 then
      local innData = RequestMentalGame_getInnListAt(startInnIndex)
      ;
      ((self._innList)[index]):SetData(innData, myInnCharacterKey)
      ;
      ((self._innList)[index]):SetShow(true)
      startInnIndex = startInnIndex + 1
    else
      do
        do
          ;
          ((self._innList)[index]):SetShow(false)
          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC40: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  local householdInfoWrapper = nil
  if householdInfoWrapper ~= nil then
    local name = (householdInfoWrapper:getStaticStatusWrapper()):getName()
    _currentInn:SetText("<PAColor0xFF92BA5A>" .. PAGetString(Defines.StringSheet_GAME, "LUA_INN_TEXT_INN_NOWRENT") .. " " .. name)
  else
    do
      _currentInn:SetText("<PAColor0xFFC4BEBE>" .. PAGetString(Defines.StringSheet_GAME, "LUA_INN_TEXT_INN_NOWRENT_NONE"))
    end
  end
end

ResponseInn_showList = function()
  -- function num : 0_6 , upvalues : _maxPage, INNLIST_COUNT_PER_PAGE, _inn_BtnLeft, _inn_BtnRight, _inn_ListPage, _currentPage, InnManager
  local isShow = Panel_Inn:GetShow()
  if isShow == true then
    Panel_Inn:SetShow(false, true)
  else
    ;
    (UIAni.fadeInSCR_Down)(Panel_Inn)
    Panel_Inn:SetShow(true, true)
    local innCount = RequestMentalGame_getInnListCount()
    _maxPage = (math.floor)(innCount / INNLIST_COUNT_PER_PAGE)
    local _isSecondPage = innCount / INNLIST_COUNT_PER_PAGE
    local isPageBtnShow = _isSecondPage > 1
    _inn_BtnLeft:SetShow(isPageBtnShow)
    _inn_BtnRight:SetShow(isPageBtnShow)
    _inn_ListPage:SetShow(isPageBtnShow)
    if isPageBtnShow then
      _inn_ListPage:SetText(tostring(_currentPage + 1))
    end
    InnManager:update()
  end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

clickCancelRentedRoomButton = function(index)
  -- function num : 0_7 , upvalues : UI_PP
  local luaCancelRentedRoomMsg = PAGetString(Defines.StringSheet_GAME, "LUA_INN_TEXT_CANCEL_RENTEDROOM_MSG")
  local luaCancelRentedRoom = PAGetString(Defines.StringSheet_GAME, "LUA_INN_TEXT_CANCEL_RENTEDROOM")
  local contentString = luaCancelRentedRoomMsg
  local messageboxData = {title = luaCancelRentedRoom, content = contentString, functionYes = CancelRentedRoomConfirm, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

clickLeftBtn_InnList = function()
  -- function num : 0_8 , upvalues : _currentPage, _inn_ListPage, InnManager
  _currentPage = _currentPage - 1
  if _currentPage < 0 then
    _currentPage = 0
  end
  _inn_ListPage:SetText(tostring(_currentPage + 1))
  InnManager:update()
end

clickRightBtn_InnList = function()
  -- function num : 0_9 , upvalues : _currentPage, _maxPage, _inn_ListPage, InnManager
  _currentPage = _currentPage + 1
  if _maxPage < _currentPage then
    _currentPage = _maxPage
  end
  _inn_ListPage:SetText(tostring(_currentPage + 1))
  InnManager:update()
end

CancelRentedRoomConfirm = function()
  -- function num : 0_10
  inn_CancelRentedInn()
end

Request_RentInn = function()
  -- function num : 0_11 , upvalues : roomNumber
  if roomNumber == -1 then
    return 
  else
    RequestInn_RentInn(roomNumber)
  end
  ResponseInn_showList()
end

InnWindow_Close = function()
  -- function num : 0_12
  if Panel_Inn:IsShow() then
    Panel_Inn:SetShow(false, IsAniUse())
  end
end

EventUnoccupyInnRoom = function(userName, houseName)
  -- function num : 0_13
end

EventOccupyInnRoom = function(useName, houseName)
  -- function num : 0_14
  local luaOccupyInnRoom = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_1")
  local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "HOUSING_RENT_HOUSE", "housename", houseName)
  Proc_ShowMessage_Ack(contentString)
end

EventUnoccupyFixedHouse = function(userName, houseName)
  -- function num : 0_15 , upvalues : UI_PP
  local luaUnoccupyFixedHouseMsg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INN_TEXT_UNOCCUPY_FIXEDHOUSE_MSG", "userName", userName, "houseName", houseName)
  local luaUnoccupyFixedHouse = PAGetString(Defines.StringSheet_GAME, "LUA_INN_TEXT_UNOCCUPY_FIXEDHOUSE")
  local contentString = luaUnoccupyFixedHouseMsg
  local messageboxData = {title = luaUnoccupyFixedHouse, content = contentString, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

InnManager:initialize()
registerEvent("ResponseInn_showList", "ResponseInn_showList")
registerEvent("EventUnoccupyInnRoom", "EventUnoccupyInnRoom")
registerEvent("EventOccupyInnRoom", "EventOccupyInnRoom")
registerEvent("EventUnoccupyFixedHouse", "EventUnoccupyFixedHouse")
_closeButton:addInputEvent("Mouse_LUp", "ResponseInn_showList()")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelInn\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelInn\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelInn\", \"false\")")
_cancelRentedRoomButton:addInputEvent("Mouse_LUp", "clickCancelRentedRoomButton()")
_inn_BtnLeft:addInputEvent("Mouse_LUp", "clickLeftBtn_InnList()")
_inn_BtnRight:addInputEvent("Mouse_LUp", "clickRightBtn_InnList()")

