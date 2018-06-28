local _panel = Panel_ServerSelect_Renew
local ServerSelect = {
  _ui = {
    txt_ServerSelectTitle = UI.getChildControl(_panel, "StaticText_ServerSelectTitle"),
    stc_RightBg = UI.getChildControl(_panel, "Static_RightBg")
  },
  _serverIdxData = {},
  _lastConnectedServerIdx = 0,
  _worldServerCount = 0,
  _selectedWorldIndex = 0,
  _maxWorldIndex = 0
}
local screenX = getScreenSizeX()
local screenY = getScreenSizeY()
_stc_BackgroundImage = Array.new()
local bgItem = {
  "base",
  "calpeon",
  "media",
  "valencia",
  "sea",
  "kamasilvia",
  "kamasilvia2",
  "dragan",
  "xmas",
  "halloween",
  "thanksGivingDay",
  "aurora",
  "KoreaOnly",
  "JapanOnly",
  "RussiaOnly",
  "NaOnly",
  "TaiwanOnly",
  "KR2Only",
  "SAOnly",
  "TROnly",
  "THOnly",
  "IDOnly"
}
local bgIndex = {}
for k, v in pairs(bgItem) do
  bgIndex[v] = k
end
local baseLink = "New_UI_Common_forLua/Window/Lobby/"
local bgManager = {
  [bgIndex.base] = {
    isOpen = true,
    imageCount = 3,
    iconPath = "bgBase_"
  },
  [bgIndex.calpeon] = {
    isOpen = ToClient_IsContentsGroupOpen("2"),
    imageCount = 6,
    iconPath = "bgCalpeon_"
  },
  [bgIndex.media] = {
    isOpen = ToClient_IsContentsGroupOpen("3"),
    imageCount = 2,
    iconPath = "bgMedia_"
  },
  [bgIndex.valencia] = {
    isOpen = ToClient_IsContentsGroupOpen("4"),
    imageCount = 6,
    iconPath = "bgValencia_"
  },
  [bgIndex.sea] = {
    isOpen = ToClient_IsContentsGroupOpen("83"),
    imageCount = 3,
    iconPath = "bgValenciaSea_"
  },
  [bgIndex.kamasilvia] = {
    isOpen = ToClient_IsContentsGroupOpen("5"),
    imageCount = 7,
    iconPath = "bgKamasilvia_"
  },
  [bgIndex.kamasilvia2] = {
    isOpen = ToClient_IsContentsGroupOpen("260"),
    imageCount = 3,
    iconPath = "bgKamasilvia2_Server_"
  },
  [bgIndex.dragan] = {
    isOpen = ToClient_IsContentsGroupOpen("6"),
    imageCount = 1,
    iconPath = "bgDraganServer_"
  },
  [bgIndex.xmas] = {
    isOpen = ToClient_isEventOn("x-mas"),
    imageCount = 1,
    iconPath = "bgXmas_"
  },
  [bgIndex.halloween] = {
    isOpen = ToClient_isEventOn("Halloween"),
    imageCount = 3,
    iconPath = "bgHalloween_"
  },
  [bgIndex.thanksGivingDay] = {
    isOpen = ToClient_isEventOn("ThanksGivingDay"),
    imageCount = 2,
    iconPath = "bgThanksGivingDay_"
  },
  [bgIndex.aurora] = {
    isOpen = ToClient_isEventOn("Aurora"),
    imageCount = 2,
    iconPath = "bgAurora_"
  },
  [bgIndex.KoreaOnly] = {
    isOpen = isGameTypeKorea() and false,
    imageCount = 1,
    iconPath = "bgKoreaOnly2_"
  },
  [bgIndex.JapanOnly] = {
    isOpen = isGameTypeJapan() and false,
    imageCount = 2,
    iconPath = "bgJapanOnly_"
  },
  [bgIndex.RussiaOnly] = {
    isOpen = isGameTypeRussia() and false,
    imageCount = 0,
    iconPath = "bgRussiaOnly_"
  },
  [bgIndex.NaOnly] = {
    isOpen = isGameTypeEnglish() and false,
    imageCount = 4,
    iconPath = "bgNAOnly_"
  },
  [bgIndex.TaiwanOnly] = {
    isOpen = isGameTypeTaiwan() and false,
    imageCount = 0,
    iconPath = "bgTaiwanOnly_"
  },
  [bgIndex.KR2Only] = {
    isOpen = isGameTypeKR2() and false,
    imageCount = 0,
    iconPath = "bgKR2Only_"
  },
  [bgIndex.SAOnly] = {
    isOpen = isGameTypeSA() and false,
    imageCount = 0,
    iconPath = "bgSAOnly_"
  },
  [bgIndex.TROnly] = {
    isOpen = isGameTypeTR() and false,
    imageCount = 0,
    iconPath = "bgTROnly_"
  },
  [bgIndex.THOnly] = {
    isOpen = isGameTypeTH() and false,
    imageCount = 0,
    iconPath = "bgTHOnly_"
  },
  [bgIndex.IDOnly] = {
    isOpen = isGameTypeID() and false,
    imageCount = 0,
    iconPath = "bgIDOnly_"
  }
}
local totalBG = 0
local imageIndex = 1
local startIndex, endIndex
local tempBg = UI.getChildControl(_panel, "bgBase_1")
for v, value in ipairs(bgManager) do
  if value.isOpen then
    totalBG = totalBG + value.imageCount
    if 0 < value.imageCount then
      startIndex = imageIndex
      for index = 1, value.imageCount do
        local targetControl = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, _panel, "Static_ServerSelectBg_" .. imageIndex)
        CopyBaseProperty(tempBg, targetControl)
        targetControl:ChangeTextureInfoNameAsync(baseLink .. value.iconPath .. index .. ".dds")
        targetControl:SetSize(screenX, screenY)
        targetControl:SetPosX(0)
        targetControl:SetPosY(0)
        targetControl:SetAlpha(0)
        _panel:SetChildIndex(targetControl, 0)
        _stc_BackgroundImage[imageIndex] = targetControl
        endIndex = imageIndex
        imageIndex = imageIndex + 1
      end
    end
  end
end
tempBg:SetShow(false)
local bgStartIndex = getRandomValue(startIndex, endIndex)
local _isScope = true
local _updateTimeAcc = 0
local currentBackIndex = bgStartIndex
local startUV = 0.1
local endUV = startUV + 0.04
local startUV2 = 0.9
local endUV2 = startUV2 + 0.04
function ServerSelect:init()
  self._ui.txt_WorldName = UI.getChildControl(self._ui.stc_RightBg, "StaticText_WorldName")
  self._ui.list_Server = UI.getChildControl(self._ui.stc_RightBg, "List2_ServerList")
  self._ui.list_Server:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobal_ServerSelect_ServerList_ControlCreate")
  self._ui.list_Server:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui.btn_WorldTemplate = UI.getChildControl(self._ui.stc_RightBg, "Button_WorldTemplate")
  self._ui.txt_Select_ConsoleUI = UI.getChildControl(self._ui.stc_RightBg, "StaticText_Select_ConsoleUI")
  self:registEventHandler()
  self._ui.txt_Back_ConsoleUI = UI.getChildControl(self._ui.stc_RightBg, "StaticText_Back_ConsoleUI")
  self:initListData()
end
function ServerSelect:updateListData()
  local channelIdx = 0
  local worldServerData = getGameWorldServerDataByIndex(self._selectedWorldIndex)
  local serverCount = getGameChannelServerDataCount(worldServerData._worldNo)
  for serverIndex = 0, serverCount - 1 do
    self._ui.list_Server:requestUpdateByKey(toInt64(0, channelIdx))
    channelIdx = channelIdx + 1
  end
end
function ServerSelect:initListData()
  local worldServerCount = getGameWorldServerDataCount()
  local channelIdx = 0
  self._maxWorldIndex = getGameWorldServerDataCount()
  self._ui.list_Server:getElementManager():clearKey()
  local worldServerData = getGameWorldServerDataByIndex(self._selectedWorldIndex)
  if nil == worldServerData then
    return
  end
  local worldName = getWorldNameByWorldNo(worldServerData._worldNo)
  if true == ToClient_isXBox() then
    worldName = "BlackDesert World"
  end
  self._ui.txt_WorldName:SetText(worldName)
  if isGameServiceTypeKor() and false == ToClient_IsDevelopment() then
    local serverData = getGameChannelServerDataByIndex(self._selectedWorldIndex, 0)
    local isAdultWorld
    if serverData == nil then
      isAdultWorld = true
    else
      isAdultWorld = serverData._isAdultWorld
    end
    local isAdultUser = ToClient_isAdultUser()
    if isAdultUser ~= isAdultWorld then
      local msg = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_ADULT_CANT_CONNECT")
      if false == isAdultWorld then
        msg = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_NONADULT_CANT_CONNECT")
      end
      local messageBoxData = {
        title = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE"),
        content = msg,
        functionApply = MessageBox_Empty_function,
        priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageBoxData)
      return
    end
  end
  local serverCount = getGameChannelServerDataCount(worldServerData._worldNo)
  for serverIndex = 0, serverCount - 1 do
    local serverIdxData = {}
    serverIdxData.worldIdx = self._selectedWorldIndex
    serverIdxData.serverIdx = serverIndex
    self._serverIdxData[channelIdx] = serverIdxData
    self._ui.list_Server:getElementManager():pushKey(toInt64(0, channelIdx))
    channelIdx = channelIdx + 1
  end
  PaGlobal_CheckGamerTag()
end
function ServerSelect:registEventHandler()
  if true == ToClient_IsDevelopment() then
  end
  registerEvent("EventUpdateServerInformationForServerSelect", "PaGlobal_ServerSelect_EventUpdateServerInfo")
  registerEvent("onScreenResize", "PaGlobal_ServerSelect_Resize")
  _panel:RegisterUpdateFunc("PaGlobal_ServerSelect_PerFrameUpdate")
end
function InputMLUp_ServerSelect_EnterServer(channelIdx)
  local self = ServerSelect
  if nil == self._serverIdxData[channelIdx] then
    return
  end
  local worldIndex = self._serverIdxData[channelIdx].worldIdx
  local serverIndex = self._serverIdxData[channelIdx].serverIdx
  if isGameServiceTypeKor() and false == ToClient_isAdultUser() and false == ToClient_CanEnterNonAdultWorld() then
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE"),
      content = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_CANT_CONNECTABLE_TIME"),
      functionApply = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    return
  end
  if true == selectServerGroup(worldIndex, serverIndex) then
  end
end
function InputMLUp_ServerSelect_SelectWorld()
end
function InputMLUp_ServerSelect_EnterLastJoinedServer()
  local tempWrapper = getTemporaryInformationWrapper()
  local lastJoinServerNo = tempWrapper:getLastServerNo()
  if 1 == lastJoinServerNo then
    return
  end
  PaGlobal_ServerSelect_EnterMemorizedChannel(lastJoinServerNo)
end
function InputMLUp_ServerSelect_EnterRandomServer()
  if isGameServiceTypeKor() and false == ToClient_IsDevelopment() and false == ToClient_CanEnterNonAdultWorld() then
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE"),
      content = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_CANT_CONNECTABLE_TIME"),
      functionApply = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    return
  end
  local self = ServerSelect
  selectRandomServer(self._selectedWorldIndex)
end
function PaGlobal_ServerSelect_ServerList_ControlCreate(content, key)
  local self = ServerSelect
  local channelIdx = Int64toInt32(key)
  local worldIdx = self._serverIdxData[channelIdx].worldIdx
  local serverIdx = self._serverIdxData[channelIdx].serverIdx
  local worldServerData = getGameWorldServerDataByIndex(worldIdx)
  local serverData = getGameChannelServerDataByIndex(worldIdx, serverIdx)
  if nil == serverData then
    return
  end
  local isBeingWar = serverData._isSiegeBeing
  local isVillageStart = serverData._isVillageSiege
  local changeChannelTime = getChannelMoveableRemainTime(worldServerData._worldNo)
  local btn_NormalSlot = UI.getChildControl(content, "Button_NormalServerSlot")
  local btn_ArshaSlot = UI.getChildControl(content, "Button_ArshaServerSlot")
  local btn_OlviaSlot = UI.getChildControl(content, "Button_OlviaServerSlot")
  local txt_ServerName = UI.getChildControl(content, "StaticText_Name")
  local txt_State = UI.getChildControl(content, "StaticText_State")
  local stc_PCRoomIcon = UI.getChildControl(content, "Static_PCRoomIcon")
  local stc_OlviaIcon = UI.getChildControl(content, "Static_OlviaIcon")
  local stc_PVPIcon = UI.getChildControl(content, "Static_PvPIcon")
  local stc_ArshaIcon = UI.getChildControl(content, "Static_ArshaIcon")
  btn_NormalSlot:SetShow(false)
  btn_ArshaSlot:SetShow(false)
  btn_OlviaSlot:SetShow(false)
  txt_State:SetShow(false)
  stc_PCRoomIcon:SetShow(false)
  stc_OlviaIcon:SetShow(false)
  stc_PVPIcon:SetShow(false)
  stc_ArshaIcon:SetShow(false)
  local serverSlotButton = btn_NormalSlot
  local isAdmission = true
  if restrictedServerNo ~= 0 then
    if restrictedServerNo == serverData._serverNo then
      isAdmission = true
    elseif changeChannelTime > toInt64(0, 0) then
      isAdmission = false
    else
      isAdmission = true
    end
  end
  local admissionDesc = ""
  if false == isAdmission then
    admissionDesc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVERSELECT_ISADMISSION_LIMIT", "admissionDesc", admissionDesc)
  else
  end
  local channelName = getChannelName(worldServerData._worldNo, serverData._serverNo)
  _PA_ASSERT(nil ~= channelName, "\236\132\156\235\178\132 \236\157\180\235\166\132\236\157\128 \236\161\180\236\158\172\237\149\180\236\149\188\237\149\169\235\139\136\235\139\164.")
  if true == isGameServiceTypeDev() then
    channelName = channelName .. " " .. getDotIp(serverData) .. admissionDesc
  else
    channelName = channelName .. " " .. admissionDesc
  end
  txt_ServerName:SetText(channelName)
  txt_ServerName:SetShow(true)
  local stateStr = ""
  local busyState = serverData._busyState
  if busyState == 0 then
    stateStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_0")
  elseif busyState == 1 then
    stateStr = ""
  elseif busyState == 2 then
    stateStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_2")
  elseif busyState == 3 then
    stateStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_3")
  elseif busyState == 4 then
    stateStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_4")
  end
  txt_State:SetText(stateStr)
  txt_State:SetShow(true)
  if true == isLoginIDShow() then
    serverSlotButton = btn_NormalSlot
  elseif serverData._isSpeedChannel then
    serverSlotButton = btn_OlviaSlot
    stc_OlviaIcon:SetShow(true)
    if 0 ~= temporaryWrapper:getMyAdmissionToSpeedServer() then
      serverSlotButton:SetIgnore(false)
      serverSlotButton:SetMonoTone(false)
    else
      serverSlotButton:SetIgnore(true)
      serverSlotButton:SetMonoTone(true)
    end
  elseif serverData._isPcroomChannel then
    stc_PCRoomIcon:SetShow(true)
  elseif serverData._isDontPvPTendencyDecrease then
    serverSlotButton = btn_ArshaSlot
    stc_ArshaIcon:SetShow(true)
  end
  serverSlotButton:addInputEvent("Mouse_LUp", "InputMLUp_ServerSelect_EnterServer(" .. channelIdx .. ")")
  serverSlotButton:SetShow(true)
  if isGameTypeRussia() or CppEnums.CountryType.DEV == getGameServiceType() then
    local temporaryWrapper = getTemporaryInformationWrapper()
    local isFixedCharge = temporaryWrapper:isFixedCharge()
    if serverData._fixedCharge then
      if isFixedCharge then
        serverSlotButton:SetIgnore(false)
        serverSlotButton:SetMonoTone(false)
      else
        serverSlotButton:SetIgnore(true)
        serverSlotButton:SetMonoTone(true)
      end
    else
      serverSlotButton:SetIgnore(false)
      serverSlotButton:SetMonoTone(false)
    end
  end
end
function PaGlobal_ServerSelect_EnterMemorizedChannel(channelIdx)
  local self = ServerSelect
  if isGameServiceTypeKor() and false == ToClient_IsDevelopment() and false == ToClient_CanEnterNonAdultWorld() then
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE"),
      content = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_CANT_CONNECTABLE_TIME"),
      functionApply = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    return
  end
  selectMemorizedServer(self._selectedWorldIndex, channelIdx)
end
function PaGlobal_ServerSelect_EventUpdateServerInfo()
  local isShow = Panel_ServerSelect_Renew:IsShow()
  if false == isShow then
    return
  end
  PaGlobal_ServerSelect_Init()
end
function PaGlobal_ServerSelect_Resize()
  if false == Panel_ServerSelect_Renew:IsShow() then
    return
  end
  local resizedRatioY = getScreenSizeY() / Panel_ServerSelect_Renew:GetSizeY()
  local self = ServerSelect
  Panel_ServerSelect_Renew:SetSize(getScreenSizeX(), getScreenSizeY())
  self._ui.stc_RightBg:SetSize(self._ui.stc_RightBg:GetSizeX(), getScreenSizeY())
  self._ui.stc_RightBg:SetPosX(getScreenSizeX() - self._ui.stc_RightBg:GetSizeX())
  self._ui.list_Server:SetSize(self._ui.list_Server:GetSizeX(), self._ui.list_Server:GetSizeY() * resizedRatioY)
  self._ui.txt_Select_ConsoleUI:SetPosY(self._ui.txt_Select_ConsoleUI:GetPosY() * resizedRatioY)
  self._ui.txt_Back_ConsoleUI:SetPosY(self._ui.txt_Back_ConsoleUI:GetPosY() * resizedRatioY)
end
_stc_BackgroundImage[currentBackIndex]:SetShow(true)
_stc_BackgroundImage[currentBackIndex]:SetAlpha(1)
function PaGlobal_ServerSelect_PerFrameUpdate(deltaTime)
  _updateTimeAcc = _updateTimeAcc - deltaTime
  if _updateTimeAcc <= 0 then
    _updateTimeAcc = 15
    local self = ServerSelect
    self:updateListData()
    if _isScope then
      _stc_BackgroundImage[currentBackIndex]:SetShow(true)
      _isScope = false
      local FadeMaskAni = _stc_BackgroundImage[currentBackIndex]:addTextureUVAnimation(0, 15, 0)
      FadeMaskAni:SetStartUV(startUV, startUV, 0)
      FadeMaskAni:SetEndUV(endUV, startUV, 0)
      FadeMaskAni:SetStartUV(startUV2, startUV, 1)
      FadeMaskAni:SetEndUV(endUV2, startUV, 1)
      FadeMaskAni:SetStartUV(startUV, startUV2, 2)
      FadeMaskAni:SetEndUV(endUV, startUV2, 2)
      FadeMaskAni:SetStartUV(startUV2, startUV2, 3)
      FadeMaskAni:SetEndUV(endUV2, startUV2, 3)
    else
      _isScope = true
      local FadeMaskAni = _stc_BackgroundImage[currentBackIndex]:addTextureUVAnimation(0, 15, 0)
      FadeMaskAni:SetEndUV(startUV, startUV, 0)
      FadeMaskAni:SetStartUV(endUV, startUV, 0)
      FadeMaskAni:SetEndUV(startUV2, startUV, 1)
      FadeMaskAni:SetStartUV(endUV2, startUV, 1)
      FadeMaskAni:SetEndUV(startUV, startUV2, 2)
      FadeMaskAni:SetStartUV(endUV, startUV2, 2)
      FadeMaskAni:SetEndUV(startUV2, startUV2, 3)
      FadeMaskAni:SetStartUV(endUV2, startUV2, 3)
      local fadeColor = _stc_BackgroundImage[currentBackIndex]:addColorAnimation(15, 17, 0)
      fadeColor:SetStartColor(Defines.Color.C_FFFFFFFF)
      fadeColor:SetEndColor(Defines.Color.C_00FFFFFF)
      currentBackIndex = currentBackIndex + 1
      if totalBG < currentBackIndex then
        currentBackIndex = getRandomValue(1, totalBG)
      end
      local baseTexture = _stc_BackgroundImage[currentBackIndex]:getBaseTexture()
      baseTexture:setUV(startUV, startUV, startUV2, startUV2)
      _stc_BackgroundImage[currentBackIndex]:setRenderTexture(baseTexture)
      local fadeColor2 = _stc_BackgroundImage[currentBackIndex]:addColorAnimation(12, 15, 0)
      fadeColor2:SetStartColor(Defines.Color.C_00FFFFFF)
      fadeColor2:SetEndColor(Defines.Color.C_FFFFFFFF)
    end
  end
end
function PaGlobal_ServerSelect_Init()
  local self = ServerSelect
  self:init()
end
PaGlobal_ServerSelect_Init()
Panel_ServerSelect_Renew:SetShow(true)
PaGlobal_ServerSelect_Resize()
