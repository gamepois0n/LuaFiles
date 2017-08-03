-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\panel_serverselect.luac 

-- params : ...
-- function num : 0
local UI_PD = CppEnums.Padding
Panel_ServerSelect:SetShow(true, false)
Panel_ServerSelect:SetSize(getScreenSizeX(), getScreenSizeY())
local FRAME_SERVERLIST = (UI.getChildControl)(Panel_ServerSelect, "FrameServerList")
local FRAMEContents_SERVERLIST = (UI.getChildControl)(FRAME_SERVERLIST, "Frame_1_Content")
local FRAME_Scroll = (UI.getChildControl)(FRAME_SERVERLIST, "Frame_1_VerticalScroll")
local SELECT_SERVER_BG_TEXT = (UI.getChildControl)(Panel_ServerSelect, "StaticText_ServerSelect")
local WORLD_BG_BTN = (UI.getChildControl)(Panel_ServerSelect, "Button_Server")
local WORLD_NAME_TEXT = (UI.getChildControl)(Panel_ServerSelect, "StaticText_ServerName")
local WORLD_Event_TEXT = (UI.getChildControl)(Panel_ServerSelect, "StaticText_ServerEvent")
local WORLD_UNABLE_CREATE_CHARACTER = (UI.getChildControl)(Panel_ServerSelect, "Static_UnableCreate")
local WORLD_SPEED_SERVER_IMG = (UI.getChildControl)(Panel_ServerSelect, "Static_WorthChannel")
local WORLD_CHARACTERCOUNT_TEXT = (UI.getChildControl)(Panel_ServerSelect, "StaticText_CharacterCount")
local WORLD_STATUS_TEXT = (UI.getChildControl)(Panel_ServerSelect, "Static_ServerStatus")
local WORLD_PRIMIUMSERVER_ICON = (UI.getChildControl)(Panel_ServerSelect, "Static_PrimiumIcon")
local CHANNEL_BG_STATIC = (UI.getChildControl)(Panel_ServerSelect, "Static_ChannelBG")
local CHANNEL_NAME_TEXT = (UI.getChildControl)(Panel_ServerSelect, "StaticText_ChannelName")
local CHANNEL_MAINICON_STATIC = (UI.getChildControl)(Panel_ServerSelect, "Static_MainChannelIcon")
local CHANNEL_STATUS_TEXT = (UI.getChildControl)(Panel_ServerSelect, "Static_ChannelStatus")
local CHANNEL_ENTER_BTN = (UI.getChildControl)(Panel_ServerSelect, "Button_Channel")
local CHANNEL_MAINSERVER = (UI.getChildControl)(Panel_ServerSelect, "RadioButton_MainServer")
local CHANNEL_MAINSERVERSQ = (UI.getChildControl)(Panel_ServerSelect, "Static_MainServerSq")
local CHANNEL_CHANGE_TEXT = (UI.getChildControl)(Panel_ServerSelect, "MultilineText_ChangeChannel")
local channel_WarIcon = (UI.getChildControl)(Panel_ServerSelect, "Static_WarIcon")
local channel_Premium = (UI.getChildControl)(Panel_ServerSelect, "Static_PremiumIcon")
local mainServerBg = (UI.getChildControl)(Panel_ServerSelect, "Static_MainServerBg")
local mainServerText = (UI.getChildControl)(mainServerBg, "StaticText_MainServerDesc")
local btn_SetMainServer = (UI.getChildControl)(mainServerBg, "Button_SetMainServer")
local btn_EnterMainServer = (UI.getChildControl)(mainServerBg, "Button_EnterMainServer")
local btn_EnterLastJoinServer = (UI.getChildControl)(mainServerBg, "Button_LastJoinServer")
local txt_EnterLastJoinServer = (UI.getChildControl)(mainServerBg, "MultilineText_LastJoinServer")
local btn_RandomJoinServer = (UI.getChildControl)(mainServerBg, "Button_RandomJoinServer")
mainServerText:setPadding(UI_PD.ePadding_Left, 10)
mainServerText:setPadding(UI_PD.ePadding_Top, 5)
mainServerText:setPadding(UI_PD.ePadding_Right, 10)
mainServerText:setPadding(UI_PD.ePadding_Bottom, 5)
local isRadioBtnShow = false
local isSpeedServer = {}
local isNotSpeedServer = {}
local warInfo = {_uiWarInfo = (UI.getChildControl)(Panel_ServerSelect, "Static_WarInfo"), _warInfoTitle = (UI.getChildControl)(Panel_ServerSelect, "StaticText_WarInfo_Title"), _uiBG = (UI.getChildControl)(Panel_ServerSelect, "Static_WarInfo_BG"), _warGuide = (UI.getChildControl)(Panel_ServerSelect, "StaticText_WarGuide"), _siegeBG = (UI.getChildControl)(Panel_ServerSelect, "Static_SiegeBG"), _staticChannel = (UI.getChildControl)(Panel_ServerSelect, "StaticText_Channel"), _siegeBalenos = (UI.getChildControl)(Panel_ServerSelect, "StaticText_Siege_Balenos"), _siegeSerendia = (UI.getChildControl)(Panel_ServerSelect, "StaticText_Siege_Serendia"), _siegeCalpheon = (UI.getChildControl)(Panel_ServerSelect, "StaticText_Siege_Calpheon"), _siegeMedia = (UI.getChildControl)(Panel_ServerSelect, "StaticText_Siege_Media"), _siegeValencia = (UI.getChildControl)(Panel_ServerSelect, "StaticText_Siege_Valencia"), _nodeWarBG = (UI.getChildControl)(Panel_ServerSelect, "Static_NodeWarBG"), _staticSchedule = (UI.getChildControl)(Panel_ServerSelect, "StaticText_Schedule"), _scheduleSiege = (UI.getChildControl)(Panel_ServerSelect, "StaticText_Schedule_Siege"), _scheduleNodeWar = (UI.getChildControl)(Panel_ServerSelect, "StaticText_Schedule_Nodewar"), _slotMaxCount = 5, _startPosY = 5, _isSieging = false, _isNodeWar = false, 
_slots = {}
}
local channelSelectInfo = {_channelSelectTitle = (UI.getChildControl)(Panel_ServerSelect, "StaticText_ChannelSelectTitle"), _mainBG = (UI.getChildControl)(Panel_ServerSelect, "Static_ChannelSelectMainBG"), _subBG = (UI.getChildControl)(Panel_ServerSelect, "Static_ChannelSelectSubBG"), _channelSelectDesc = (UI.getChildControl)(Panel_ServerSelect, "StaticText_ChannelSelectDesc")}
local channelSpeedInfo = {_speedTitle = (UI.getChildControl)(Panel_ServerSelect, "StaticText_SpeedTitle"), _speedMainBG = (UI.getChildControl)(Panel_ServerSelect, "Static_SpeedMainBG"), _speedSubBG = (UI.getChildControl)(Panel_ServerSelect, "Static_SpeedDescBG"), _speedDesc = (UI.getChildControl)(Panel_ServerSelect, "StaticText_SpeedDesc")}
channelSelectInfo_Init = function()
  -- function num : 0_0 , upvalues : channelSelectInfo
  local self = channelSelectInfo
  ;
  (self._mainBG):AddChild(self._channelSelectTitle)
  ;
  (self._mainBG):AddChild(self._subBG)
  ;
  (self._mainBG):AddChild(self._channelSelectDesc)
  Panel_ServerSelect:RemoveControl(self._channelSelectTitle)
  Panel_ServerSelect:RemoveControl(self._subBG)
  Panel_ServerSelect:RemoveControl(self._channelSelectDesc)
  ;
  (self._channelSelectDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._channelSelectDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_CHANNELSELECTDESC"))
  ;
  (self._mainBG):SetSize((self._mainBG):GetSizeX(), (self._channelSelectDesc):GetTextSizeY() + 70)
  ;
  (self._subBG):SetSize((self._subBG):GetSizeX(), (self._channelSelectDesc):GetTextSizeY() + 10)
  ;
  (self._channelSelectTitle):SetPosX(10)
  ;
  (self._channelSelectTitle):SetPosY(30)
  ;
  (self._subBG):SetPosX(10)
  ;
  (self._subBG):SetPosY(40)
  ;
  (self._channelSelectDesc):SetPosX(18)
  ;
  (self._channelSelectDesc):SetPosY(50)
end

warInfo_Init = function()
  -- function num : 0_1 , upvalues : warInfo
  local self = warInfo
  ;
  (self._uiWarInfo):AddChild(self._warInfoTitle)
  ;
  (self._uiWarInfo):AddChild(self._uiBG)
  ;
  (self._uiWarInfo):AddChild(self._siegeBG)
  ;
  (self._uiWarInfo):AddChild(self._staticChannel)
  ;
  (self._uiWarInfo):AddChild(self._siegeBalenos)
  ;
  (self._uiWarInfo):AddChild(self._siegeSerendia)
  ;
  (self._uiWarInfo):AddChild(self._siegeCalpheon)
  ;
  (self._uiWarInfo):AddChild(self._siegeMedia)
  ;
  (self._uiWarInfo):AddChild(self._siegeValencia)
  ;
  (self._uiWarInfo):AddChild(self._nodeWarBG)
  ;
  (self._uiWarInfo):AddChild(self._staticSchedule)
  ;
  (self._uiWarInfo):AddChild(self._scheduleSiege)
  ;
  (self._uiWarInfo):AddChild(self._scheduleNodeWar)
  Panel_ServerSelect:RemoveControl(self._warInfoTitle)
  Panel_ServerSelect:RemoveControl(self._uiBG)
  Panel_ServerSelect:RemoveControl(self._siegeBG)
  Panel_ServerSelect:RemoveControl(self._staticChannel)
  Panel_ServerSelect:RemoveControl(self._siegeBalenos)
  Panel_ServerSelect:RemoveControl(self._siegeSerendia)
  Panel_ServerSelect:RemoveControl(self._siegeCalpheon)
  Panel_ServerSelect:RemoveControl(self._siegeMedia)
  Panel_ServerSelect:RemoveControl(self._siegeValencia)
  Panel_ServerSelect:RemoveControl(self._nodeWarBG)
  Panel_ServerSelect:RemoveControl(self._staticSchedule)
  Panel_ServerSelect:RemoveControl(self._scheduleSiege)
  Panel_ServerSelect:RemoveControl(self._scheduleNodeWar)
  ;
  (self._warInfoTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_TITLE"))
  ;
  (self._staticChannel):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_TERRITORY_SUB_TITLE"))
  ;
  (self._siegeBalenos):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_TERRITORY_SUB_DESC_BALENOS"))
  ;
  (self._siegeSerendia):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_TERRITORY_SUB_DESC_SERENDIA"))
  ;
  (self._siegeCalpheon):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_TERRITORY_SUB_DESC_CALPEON"))
  ;
  (self._siegeMedia):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_TERRITORY_SUB_DESC_MEDIA"))
  ;
  (self._siegeValencia):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_TERRITORY_SUB_DESC_VALENCIA"))
  ;
  (self._staticSchedule):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_DATE_SUB_TITLE"))
  ;
  (self._scheduleSiege):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_DATE_SUB_DESC_TERRITORYWAR"))
  ;
  (self._scheduleNodeWar):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_WARCHANNEL_DATE_SUB_DESC_NODEWAR"))
  ;
  (self._warInfoTitle):SetPosX(10)
  ;
  (self._warInfoTitle):SetPosY(38)
  ;
  (self._uiBG):SetPosX(10)
  ;
  (self._uiBG):SetPosY(45)
  ;
  (self._siegeBG):SetPosX(15)
  ;
  (self._siegeBG):SetPosY(50)
  ;
  (self._staticChannel):SetPosX(25)
  ;
  (self._staticChannel):SetPosY(60)
  ;
  (self._siegeBalenos):SetPosX(30)
  ;
  (self._siegeBalenos):SetPosY(80)
  ;
  (self._siegeSerendia):SetPosX(30)
  ;
  (self._siegeSerendia):SetPosY(100)
  ;
  (self._siegeCalpheon):SetPosX(30)
  ;
  (self._siegeCalpheon):SetPosY(120)
  ;
  (self._siegeMedia):SetPosX(30)
  ;
  (self._siegeMedia):SetPosY(140)
  ;
  (self._siegeValencia):SetPosX(30)
  ;
  (self._siegeValencia):SetPosY(160)
  ;
  (self._nodeWarBG):SetPosX(15)
  ;
  (self._nodeWarBG):SetPosY(190)
  ;
  (self._staticSchedule):SetPosX(25)
  ;
  (self._staticSchedule):SetPosY(200)
  ;
  (self._scheduleSiege):SetPosX(30)
  ;
  (self._scheduleSiege):SetPosY(220)
  ;
  (self._scheduleNodeWar):SetPosX(30)
  ;
  (self._scheduleNodeWar):SetPosY(240)
end

SpeedChannelInfo_Init = function()
  -- function num : 0_2 , upvalues : channelSpeedInfo
  local self = channelSpeedInfo
  ;
  (self._speedMainBG):AddChild(self._speedTitle)
  ;
  (self._speedMainBG):AddChild(self._speedSubBG)
  ;
  (self._speedMainBG):AddChild(self._speedDesc)
  Panel_ServerSelect:RemoveControl(self._speedTitle)
  Panel_ServerSelect:RemoveControl(self._speedSubBG)
  Panel_ServerSelect:RemoveControl(self._speedDesc)
  ;
  (self._speedTitle):SetPosX(10)
  ;
  (self._speedTitle):SetPosY(30)
  ;
  (self._speedSubBG):SetPosX(10)
  ;
  (self._speedSubBG):SetPosY(40)
  ;
  (self._speedDesc):SetPosX(18)
  ;
  (self._speedDesc):SetPosY(45)
  ;
  (self._speedDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._speedTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_SPEEDCHANNEL_TITLE"))
  if isGameTypeTaiwan() then
    (self._speedDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_SPEEDCHANNEL_DESC_TW"))
  else
    ;
    (self._speedDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_SPEEDCHANNEL_DESC"))
  end
  ;
  (self._speedMainBG):SetSize((self._speedMainBG):GetSizeX(), (self._speedTitle):GetSizeY() + (self._speedDesc):GetTextSizeY() + 50)
  ;
  (self._speedSubBG):SetSize((self._speedSubBG):GetSizeX(), (self._speedDesc):GetTextSizeY())
  if isGameTypeKorea() or isGameTypeJapan() or isGameTypeTaiwan() then
    ChannelSelectInfo_Show()
    SpeedChannelInfo_Show()
    warInfo_Show()
  else
    if isGameTypeRussia() then
      ChannelSelectInfo_Hide()
      SpeedChannelInfo_Show()
      warInfo_Show()
    else
      if isGameTypeSA() then
        SpeedChannelInfo_Hide()
        ChannelSelectInfo_Show()
        warInfo_Show()
      else
        ChannelSelectInfo_Hide()
        SpeedChannelInfo_Hide()
        warInfo_Hide()
      end
    end
  end
end

WORLD_BG_BTN:SetShow(false)
WORLD_NAME_TEXT:SetShow(false)
WORLD_UNABLE_CREATE_CHARACTER:SetShow(false)
WORLD_SPEED_SERVER_IMG:SetShow(false)
WORLD_CHARACTERCOUNT_TEXT:SetShow(false)
WORLD_STATUS_TEXT:SetShow(false)
WORLD_PRIMIUMSERVER_ICON:SetShow(false)
CHANNEL_BG_STATIC:SetShow(false)
CHANNEL_NAME_TEXT:SetShow(false)
CHANNEL_STATUS_TEXT:SetShow(false)
CHANNEL_ENTER_BTN:SetShow(false)
CHANNEL_CHANGE_TEXT:SetShow(false)
CHANNEL_MAINSERVER:SetShow(false)
CHANNEL_MAINSERVERSQ:SetShow(false)
FRAME_SERVERLIST:SetShow(true)
local screenX = getScreenSizeX()
local screenY = getScreenSizeY()
Static_Back = (Array.new)()
local bgItem = {"base", "calpeon", "media", "valencia", "sea", "kamasilvia", "dragan", "xmas", "halloween", "thanksGivingDay", "aurora", "KoreaOnly", "JapanOnly", "RussiaOnly", "NaOnly", "TaiwanOnly", "KR2Only", "kamasilvia2"}
local bgIndex = {}
for k,v in pairs(bgItem) do
  bgIndex[v] = k
end
local baseLink = "New_UI_Common_forLua/Window/Lobby/"
local bgManager = {
[bgIndex.base] = {isOpen = true, imageCount = 3, iconPath = "bgBase_"}
, 
[bgIndex.calpeon] = {isOpen = ToClient_IsContentsGroupOpen("2"), imageCount = 6, iconPath = "bgCalpeon_"}
, 
[bgIndex.media] = {isOpen = ToClient_IsContentsGroupOpen("3"), imageCount = 2, iconPath = "bgMedia_"}
, 
[bgIndex.valencia] = {isOpen = ToClient_IsContentsGroupOpen("4"), imageCount = 6, iconPath = "bgValencia_"}
, 
[bgIndex.sea] = {isOpen = ToClient_IsContentsGroupOpen("83"), imageCount = 3, iconPath = "bgValenciaSea_"}
, 
[bgIndex.kamasilvia] = {isOpen = ToClient_IsContentsGroupOpen("5"), imageCount = 7, iconPath = "bgKamasilvia_"}
, 
[bgIndex.kamasilvia2] = {isOpen = ToClient_IsContentsGroupOpen("260"), imageCount = 3, iconPath = "bgKamasilvia2_Server_"}
, 
[bgIndex.dragan] = {isOpen = ToClient_IsContentsGroupOpen("6"), imageCount = 0, iconPath = "bgDragan_"}
, 
[bgIndex.xmas] = {isOpen = ToClient_isEventOn("x-mas"), imageCount = 2, iconPath = "bgXmas_"}
, 
[bgIndex.halloween] = {isOpen = ToClient_isEventOn("Halloween"), imageCount = 3, iconPath = "bgHalloween_"}
, 
[bgIndex.thanksGivingDay] = {isOpen = ToClient_isEventOn("ThanksGivingDay"), imageCount = 2, iconPath = "bgThanksGivingDay_"}
, 
[bgIndex.aurora] = {isOpen = ToClient_isEventOn("Aurora"), imageCount = 2, iconPath = "bgAurora_"}
, 
[bgIndex.KoreaOnly] = {isOpen = not isGameTypeKorea() or false, imageCount = 1, iconPath = "bgKoreaOnly2_"}
, 
[bgIndex.JapanOnly] = {isOpen = not isGameTypeJapan() or false, imageCount = 2, iconPath = "bgJapanOnly_"}
, 
[bgIndex.RussiaOnly] = {isOpen = not isGameTypeRussia() or false, imageCount = 0, iconPath = "bgRussiaOnly_"}
, 
[bgIndex.NaOnly] = {isOpen = not isGameTypeEnglish() or false, imageCount = 4, iconPath = "bgNAOnly_"}
, 
[bgIndex.TaiwanOnly] = {isOpen = not isGameTypeTaiwan() or false, imageCount = 0, iconPath = "bgTaiwanOnly_"}
, 
[bgIndex.KR2Only] = {isOpen = not isGameTypeKR2() or false, imageCount = 0, iconPath = "bgKR2Only_"}
}
local totalBG = 0
local imageIndex = 1
local startIndex, endIndex = nil, nil
local tempBg = (UI.getChildControl)(Panel_ServerSelect, "bgBase_1")
for v,value in ipairs(bgManager) do
  if value.isOpen then
    totalBG = totalBG + value.imageCount
    if value.imageCount > 0 then
      startIndex = imageIndex
      for index = 1, value.imageCount do
        local targetControl = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_ServerSelect, "Static_ServerSelectBg_" .. imageIndex)
        CopyBaseProperty(tempBg, targetControl)
        targetControl:ChangeTextureInfoName(baseLink .. value.iconPath .. index .. ".dds")
        targetControl:SetSize(screenX, screenY)
        targetControl:SetPosX(0)
        targetControl:SetPosY(0)
        targetControl:SetAlpha(0)
        Panel_ServerSelect:SetChildIndex(targetControl, 0)
        -- DECOMPILER ERROR at PC653: Confused about usage of register: R57 in 'UnsetPending'

        Static_Back[imageIndex] = targetControl
        endIndex = imageIndex
        imageIndex = imageIndex + 1
      end
    end
  end
end
tempBg:SetShow(false)
local bgStartIndex = getRandomValue(startIndex, endIndex)
local _selectWorldIndex = -1
local _worldServerCount = 0
local _channelCtrl = {_bgStatic, _nameText, _warIcon, _premiumIcon, _statusText, _enterBtn, _changeChannel}
local _worldServerCtrl = {_bgButton, _nameText, _countText, _statusText, _channelCount, _channelCtrls}
local _worldServerCtrls = {}
local serverStatusTexture = {
{150, 27, 166, 43}
, 
{167, 27, 183, 43}
, 
{184, 27, 200, 43}
, 
{184, 44, 200, 60}
; 
[0] = {133, 27, 149, 43}
}
changeTexture_ByServerStatus = function(control, status)
  -- function num : 0_3 , upvalues : serverStatusTexture
  control:ChangeTextureInfoName("new_ui_common_forlua/Default/Default_Etc_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, (serverStatusTexture[status])[1], (serverStatusTexture[status])[2], (serverStatusTexture[status])[3], (serverStatusTexture[status])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

local createStatusTexture = {
{111, 44, 138, 71}
; 
[0] = {139, 44, 166, 71}
}
changeTexture_ByCreateStatus = function(control, status)
  -- function num : 0_4 , upvalues : createStatusTexture
  control:ChangeTextureInfoName("new_ui_common_forlua/Default/Default_Etc_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, (createStatusTexture[status])[1], (createStatusTexture[status])[2], (createStatusTexture[status])[3], (createStatusTexture[status])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

StartUp_Panel_SelectServer = function()
  -- function num : 0_5 , upvalues : SELECT_SERVER_BG_TEXT, _worldServerCount, FRAME_SERVERLIST, WORLD_BG_BTN, WORLD_NAME_TEXT, WORLD_PRIMIUMSERVER_ICON, WORLD_Event_TEXT, WORLD_CHARACTERCOUNT_TEXT, WORLD_STATUS_TEXT, WORLD_UNABLE_CREATE_CHARACTER, _worldServerCtrls, _selectWorldIndex
  if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_KOR) then
    SELECT_SERVER_BG_TEXT:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_CHANNEL"))
  else
    SELECT_SERVER_BG_TEXT:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_SERVER"))
  end
  Panel_ServerSelect:SetSize(getScreenSizeX(), getScreenSizeY())
  _worldServerCount = getGameWorldServerDataCount()
  for idx = 0, _worldServerCount - 1 do
    local serverData = getGameWorldServerDataByIndex(idx)
    if serverData == nil then
      break
    end
    local isExpBonusEvent = IsWorldServerEventTypeByWorldIndex(idx, -1, 0)
    local isDropRateEvent = IsWorldServerEventTypeByWorldIndex(idx, -1, 1)
    local worldCtrl = {}
    local tempBtn = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, FRAME_SERVERLIST:GetFrameContent(), "WorldButton_" .. tostring(idx))
    CopyBaseProperty(WORLD_BG_BTN, tempBtn)
    tempBtn:SetShow(true)
    tempBtn:ActiveMouseEventEffect(true)
    tempBtn:addInputEvent("Mouse_LUp", "Panel_Lobby_function_SelectWorldServer(" .. idx .. ")")
    tempBtn:SetPosX(0)
    tempBtn:SetPosY(idx * (tempBtn:GetSizeY() + 25))
    local tempName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempBtn, "WorldName_" .. tostring(idx))
    CopyBaseProperty(WORLD_NAME_TEXT, tempName)
    tempName:SetShow(true)
    tempName:ActiveMouseEventEffect(true)
    local tempWorldName = getWorldNameByWorldNo(serverData._worldNo)
    tempName:SetText(tempWorldName)
    tempName:SetPosX(20)
    tempName:SetPosY(14)
    local tempPrimiumIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempBtn, "WorldPrimiumIcon_" .. tostring(idx))
    CopyBaseProperty(WORLD_PRIMIUMSERVER_ICON, tempPrimiumIcon)
    tempPrimiumIcon:SetPosX(20)
    local tempEvent = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempBtn, "WorldEventName_" .. tostring(idx))
    CopyBaseProperty(WORLD_Event_TEXT, tempEvent)
    tempEvent:ActiveMouseEventEffect(true)
    local tempEventName = ""
    if isExpBonusEvent then
      tempEventName = tempEventName .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_EXPEVENT")
    end
    if isDropRateEvent then
      tempEventName = tempEventName .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_DROPEVENT")
    end
    if tempEventName == "" then
      tempName:SetPosY(20)
      tempEvent:SetShow(false)
      tempPrimiumIcon:SetPosY(20)
    else
      tempName:SetPosY(14)
      tempEvent:SetShow(true)
      tempPrimiumIcon:SetPosY(14)
    end
    local temporaryWrapper = getTemporaryInformationWrapper()
    local isFixedCharge = temporaryWrapper:isFixedCharge()
    if serverData._fixedCharge then
      tempPrimiumIcon:SetShow(true)
      tempName:SetPosX(tempPrimiumIcon:GetPosX() + tempPrimiumIcon:GetSizeX() + 2)
    else
      tempPrimiumIcon:SetShow(false)
      tempName:SetPosX(20)
    end
    tempEvent:SetText(tempEventName)
    tempEvent:SetPosX(20)
    tempEvent:SetPosY(37)
    local tempCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempBtn, "WorldCount_" .. tostring(idx))
    CopyBaseProperty(WORLD_CHARACTERCOUNT_TEXT, tempCount)
    tempCount:SetShow(true)
    tempCount:ActiveMouseEventEffect(true)
    local tempStr = ""
    tempStr = "(" .. tostring(serverData._characterCount) .. "/" .. tostring(serverData._deleteCount) .. ")"
    tempCount:SetText(tempStr)
    tempCount:SetPosX(180)
    tempCount:SetPosY(20)
    local tempStatus = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempBtn, "WorldStatus_" .. tostring(idx))
    CopyBaseProperty(WORLD_STATUS_TEXT, tempStatus)
    tempStatus:SetShow(true)
    tempStatus:ActiveMouseEventEffect(true)
    tempStatus:SetAutoResize(true)
    tempStatus:SetVerticalMiddle()
    tempStatus:SetHorizonRight()
    local busyState = getGameWorldServerBusyByIndex(idx)
    if busyState == 0 then
      tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_0")
    else
      if busyState == 1 then
        tempStr = ""
      else
        if busyState == 2 then
          tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_2")
        else
          if busyState == 3 then
            tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_3")
          else
            if busyState == 4 then
              tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_4")
            end
          end
        end
      end
    end
    local tempUnableCreate = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempBtn, "WorldUnableCreate_" .. tostring(idx))
    CopyBaseProperty(WORLD_UNABLE_CREATE_CHARACTER, tempUnableCreate)
    tempUnableCreate:SetShow(true)
    tempUnableCreate:SetPosX(tempBtn:GetSizeX() - tempUnableCreate:GetSizeX() * 1.5)
    tempUnableCreate:SetPosY(18)
    if ToClient_IsCreatableWorldServer(idx) then
      changeTexture_ByCreateStatus(tempUnableCreate, 0)
    else
      changeTexture_ByCreateStatus(tempUnableCreate, 1)
    end
    tempStatus:SetText(tempStr)
    tempStatus:SetSpanSize(tempUnableCreate:GetSizeX() * 2 + 10, -3)
    worldCtrl._bgButton = tempBtn
    worldCtrl._nameText = tempName
    worldCtrl._unableCreate = tempUnableCreate
    worldCtrl._countText = tempCount
    worldCtrl._statusText = tempStatus
    -- DECOMPILER ERROR at PC417: Confused about usage of register: R21 in 'UnsetPending'

    _worldServerCtrls[idx] = worldCtrl
  end
  do
    for idx = 0, _worldServerCount - 1 do
      Panel_SelectServer_ReCreateChannelCtrl(idx)
    end
    _selectWorldIndex = -1
    Panel_Lobby_function_SelectWorldServer(0)
    Panel_SelectServer_RePositioningCtrls()
  end
end

Panel_SelectServer_ReCreateChannelCtrl = function(worldIndex)
  -- function num : 0_6 , upvalues : _worldServerCtrls, isSpeedServer, isNotSpeedServer, FRAME_SERVERLIST, CHANNEL_BG_STATIC, CHANNEL_MAINSERVER, CHANNEL_MAINSERVERSQ, CHANNEL_NAME_TEXT, channel_WarIcon, channel_Premium, CHANNEL_MAINICON_STATIC, CHANNEL_STATUS_TEXT, WORLD_SPEED_SERVER_IMG, CHANNEL_ENTER_BTN, CHANNEL_CHANGE_TEXT
  local worldServerData = getGameWorldServerDataByIndex(worldIndex)
  local restrictedServerNo = worldServerData._restrictedServerNo
  local changeChannelTime = getChannelMoveableRemainTime(worldServerData._worldNo)
  local changeMoveChannel = getChannelMoveableTime(worldServerData._worldNo)
  local changeRealChannelTime = convertStringFromDatetime(changeChannelTime)
  local changeMoveChannelTime = convertStringFromDatetime(changeMoveChannel)
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (_worldServerCtrls[worldIndex])._channelCount = getGameChannelServerDataCount(worldServerData._worldNo)
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (_worldServerCtrls[worldIndex])._channelCtrls = {}
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R7 in 'UnsetPending'

  isSpeedServer[worldIndex] = {}
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R7 in 'UnsetPending'

  isNotSpeedServer[worldIndex] = {}
  local index1 = 0
  local index2 = 0
  for idx = 0, (_worldServerCtrls[worldIndex])._channelCount - 1 do
    local serverData = getGameChannelServerDataByIndex(worldIndex, idx)
    if serverData == nil then
      break
    end
    local isAdmission = true
    if restrictedServerNo ~= 0 then
      if restrictedServerNo == serverData._serverNo then
        isAdmission = true
      else
        if toInt64(0, 0) < changeChannelTime then
          isAdmission = false
        else
          isAdmission = true
        end
      end
    end
    local strTemp = "ChannelBG_" .. tostring(worldIndex) .. "_" .. tostring(idx)
    local tempBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, FRAME_SERVERLIST:GetFrameContent(), "ChannelBG_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(CHANNEL_BG_STATIC, tempBG)
    tempBG:SetShow(false)
    tempBG:ActiveMouseEventEffect(true)
    tempBG:SetIgnore(false)
    local tempCheckMainServer = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, tempBG, "ChannelRadioBtn_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(CHANNEL_MAINSERVER, tempCheckMainServer)
    tempCheckMainServer:SetPosX(270)
    tempCheckMainServer:SetPosY(7)
    tempCheckMainServer:SetShow(false)
    tempCheckMainServer:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_SELECT"))
    local tempCheckMainServerSQ = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempBG, "ChannelSequense_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(CHANNEL_MAINSERVERSQ, tempCheckMainServerSQ)
    tempCheckMainServerSQ:SetPosX(270)
    tempCheckMainServerSQ:SetPosY(7)
    tempCheckMainServerSQ:SetShow(false)
    local tempName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempBG, "ChannelName_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(CHANNEL_NAME_TEXT, tempName)
    tempName:SetShow(true)
    tempName:ActiveMouseEventEffect(true)
    local tempWar = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempBG, "ChannelWar_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(channel_WarIcon, tempWar)
    tempWar:SetShow(false)
    tempWar:ActiveMouseEventEffect(true)
    local tempPremium = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempBG, "ChannelPremium_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(channel_Premium, tempPremium)
    tempPremium:SetShow(false)
    tempPremium:ActiveMouseEventEffect(true)
    local tempMainIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempBG, "ChannelMainIcon_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(CHANNEL_MAINICON_STATIC, tempMainIcon)
    tempMainIcon:SetShow(false)
    tempMainIcon:ActiveMouseEventEffect(true)
    local admissionDesc = ""
    if isAdmission == false then
      admissionDesc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVERSELECT_ISADMISSION_LIMIT", "admissionDesc", admissionDesc)
    end
    local channelName = getChannelName(worldServerData._worldNo, serverData._serverNo)
    _PA_ASSERT(channelName ~= nil, "서버 이름�\128 존재해야합니�\164.")
    if isGameServiceTypeDev() == true then
      channelName = channelName .. " " .. getDotIp(serverData) .. admissionDesc
    else
      channelName = channelName .. " " .. admissionDesc
    end
    tempName:SetText(channelName)
    tempName:SetPosX(15)
    tempName:SetPosY(13)
    if serverData._isMain == true then
      tempMainIcon:SetShow(false)
      tempMainIcon:SetPosX(15)
      tempMainIcon:SetPosY(17)
    end
    local tempStatus = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, tempBG, "ChannelStatus_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(CHANNEL_STATUS_TEXT, tempStatus)
    tempStatus:SetShow(true)
    tempStatus:ActiveMouseEventEffect(true)
    local busyState = serverData._busyState
    if busyState == 0 then
      tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_0")
    elseif busyState == 1 then
      tempStr = ""
    elseif busyState == 2 then
      tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_2")
    elseif busyState == 3 then
      tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_3")
    elseif busyState == 4 then
      tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_4")
    end
    tempStatus:SetText(tempStr)
    tempStatus:SetPosX(160)
    tempStatus:SetPosY(14)
    local tempUnableCreate = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempBG, "ChannelCreateStatus_" .. tostring(idx))
    CopyBaseProperty(WORLD_SPEED_SERVER_IMG, tempUnableCreate)
    tempUnableCreate:SetShow(false)
    tempUnableCreate:SetPosX(230)
    tempUnableCreate:SetPosY(8)
    local tempBtn = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, tempBG, "ChannelButton_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(CHANNEL_ENTER_BTN, tempBtn)
    tempBtn:SetIgnore(false)
    tempBtn:ActiveMouseEventEffect(true)
    tempBtn:SetPosX(270)
    tempBtn:SetPosY(7)
    tempBtn:addInputEvent("Mouse_LUp", "Panel_Lobby_function_EnterChannel(" .. idx .. ")")
    local tempChgChannel = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_MULTILINETEXT, tempBG, "ChannelChangeText_" .. tostring(worldIndex) .. "_" .. tostring(idx))
    CopyBaseProperty(CHANNEL_CHANGE_TEXT, tempChgChannel)
    tempChgChannel:SetIgnore(true)
    tempChgChannel:SetPosX(265)
    tempChgChannel:SetPosY(7)
    if isLoginIDShow() == true then
      tempBtn:SetShow(isAdmission)
      if toInt64(0, 0) < changeChannelTime then
        tempChgChannel:SetShow(not isAdmission)
        if tempChgChannel:GetShow() then
          tempBtn:SetShow(false)
        end
        tempChgChannel:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVERSELECT_CHANGECHANNEL", "changeRealChannelTime", changeRealChannelTime))
      end
    else
      tempBtn:SetShow(not isAdmission or busyState ~= 0)
      local isTextShow = not isAdmission and busyState ~= 0
      tempChgChannel:SetShow(isTextShow)
      if tempChgChannel:GetShow() then
        tempBtn:SetShow(false)
      end
      if isTextShow then
        if toInt64(0, 0) < changeChannelTime then
          tempChgChannel:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVERSELECT_CHANGECHANNEL", "changeRealChannelTime", changeRealChannelTime))
        else
          tempChgChannel:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVERSELECT_CHANGECHANNEL", "changeRealChannelTime", 0))
        end
      end
    end
    if isGameTypeRussia() or (CppEnums.CountryType).DEV == getGameServiceType() then
      local temporaryWrapper = getTemporaryInformationWrapper()
      local isFixedCharge = temporaryWrapper:isFixedCharge()
      if serverData._fixedCharge then
        if isFixedCharge then
          tempBtn:SetIgnore(false)
          tempBtn:SetMonoTone(false)
        else
          tempBtn:SetIgnore(true)
          tempBtn:SetMonoTone(true)
        end
      else
        tempBtn:SetIgnore(false)
        tempBtn:SetMonoTone(false)
      end
    end
    if serverData._isSpeedChannel then
      tempUnableCreate:SetShow(true)
      -- DECOMPILER ERROR at PC635: Confused about usage of register: R30 in 'UnsetPending'

      ;
      (isSpeedServer[worldIndex])[index1] = idx
      tempBtn:SetShow(false)
      index1 = index1 + 1
    else
      tempUnableCreate:SetShow(false)
      -- DECOMPILER ERROR at PC646: Confused about usage of register: R30 in 'UnsetPending'

      ;
      (isNotSpeedServer[worldIndex])[index2] = idx
      index2 = index2 + 1
    end
    -- DECOMPILER ERROR at PC652: Confused about usage of register: R30 in 'UnsetPending'

    ;
    ((_worldServerCtrls[worldIndex])._channelCtrls)[idx] = {}
    -- DECOMPILER ERROR at PC657: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (((_worldServerCtrls[worldIndex])._channelCtrls)[idx])._bgStatic = tempBG
    -- DECOMPILER ERROR at PC662: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (((_worldServerCtrls[worldIndex])._channelCtrls)[idx])._nameText = tempName
    -- DECOMPILER ERROR at PC667: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (((_worldServerCtrls[worldIndex])._channelCtrls)[idx])._warIcon = tempWar
    -- DECOMPILER ERROR at PC672: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (((_worldServerCtrls[worldIndex])._channelCtrls)[idx])._premiumIcon = tempPremium
    -- DECOMPILER ERROR at PC677: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (((_worldServerCtrls[worldIndex])._channelCtrls)[idx])._statusText = tempStatus
    -- DECOMPILER ERROR at PC682: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (((_worldServerCtrls[worldIndex])._channelCtrls)[idx])._enterBtn = tempBtn
    -- DECOMPILER ERROR at PC687: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (((_worldServerCtrls[worldIndex])._channelCtrls)[idx])._changeChannel = tempChgChannel
    -- DECOMPILER ERROR at PC692: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (((_worldServerCtrls[worldIndex])._channelCtrls)[idx])._radioBtnMain = tempCheckMainServer
    -- DECOMPILER ERROR at PC697: Confused about usage of register: R30 in 'UnsetPending'

    ;
    (((_worldServerCtrls[worldIndex])._channelCtrls)[idx])._mainServerSQ = tempCheckMainServerSQ
  end
  for idx = 0, index2 - 1 do
    -- DECOMPILER ERROR at PC709: Confused about usage of register: R13 in 'UnsetPending'

    (isSpeedServer[worldIndex])[index1 + idx] = (isNotSpeedServer[worldIndex])[idx]
  end
  -- DECOMPILER ERROR: 25 unprocessed JMP targets
end

local delayTime = 1
local serverSelectDeltaTime = 0
Panel_SelectServer_Delta = function(deltaTime)
  -- function num : 0_7 , upvalues : serverSelectDeltaTime, delayTime, mainServerText, txt_EnterLastJoinServer, _worldServerCtrls, isRadioBtnShow
  serverSelectDeltaTime = serverSelectDeltaTime + deltaTime
  if delayTime <= serverSelectDeltaTime then
    local serverCount = getGameWorldServerDataCount()
    local temporaryWrapper = getTemporaryInformationWrapper()
    mainServerText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_NOMAINSERVER"))
    txt_EnterLastJoinServer:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_BTN_LASTJOINSERVER"))
    for index = 0, serverCount - 1 do
      local worldServerData = getGameWorldServerDataByIndex(R8_PC33)
      R8_PC33 = worldServerData._restrictedServerNo
      local restrictedServerNo = nil
      local changeChannelTime = getChannelMoveableRemainTime(worldServerData._worldNo)
      changeChannelTime = changeChannelTime - toInt64(0, 20)
      local changeMoveChannel = getChannelMoveableTime(worldServerData._worldNo)
      local changeRealChannelTime = convertStringFromDatetime(changeChannelTime)
      local changeMoveChannelTime = convertStringFromDatetime(changeMoveChannel)
      for idx = 0, (_worldServerCtrls[index])._channelCount - 1 do
        local serverData = getGameChannelServerDataByIndex(R18_PC62, idx)
        if serverData == nil then
          break
        end
        R18_PC62 = serverData._isSiegeBeing
        local isBeingWar = nil
        local isVillageStart = serverData._isVillageSiege
        local isAdmission = true
        if restrictedServerNo ~= 0 then
          if restrictedServerNo == serverData._serverNo then
            isAdmission = true
          else
            if toInt64(0, 0) < changeChannelTime then
              isAdmission = false
            else
              isAdmission = true
            end
          end
        end
        local busyState = serverData._busyState
        if busyState == 0 then
          tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_0")
        else
          if busyState == 1 then
            tempStr = ""
          else
            if busyState == 2 then
              tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_2")
            else
              if busyState == 3 then
                tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_3")
              else
                if busyState == 4 then
                  tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_4")
                end
              end
            end
          end
        end
        ;
        ((((_worldServerCtrls[index])._channelCtrls)[idx])._statusText):SetText(tempStr)
        local isTempShow = not isAdmission or busyState ~= 0
        local admissionDesc = ""
        if isAdmission == false then
          admissionDesc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVERSELECT_ISADMISSION_LIMIT", "admissionDesc", admissionDesc)
        end
        local channelName = getChannelName(worldServerData._worldNo, serverData._serverNo)
        _PA_ASSERT(channelName ~= nil, "서버 이름�\128 존재해야합니�\164.")
        if isGameServiceTypeDev() then
          channelName = channelName .. " " .. getDotIp(serverData) .. admissionDesc
        elseif isBeingWar then
          if isVillageStart then
            channelName = channelName .. " " .. admissionDesc
            ;
            ((((_worldServerCtrls[index])._channelCtrls)[idx])._bgStatic):addInputEvent("Mouse_On", "ServerSelect_Simpletooltip(true, 0, " .. R29_PC195 .. ", " .. idx .. ")")
            ;
            ((((_worldServerCtrls[index])._channelCtrls)[idx])._bgStatic):addInputEvent("Mouse_Out", "ServerSelect_Simpletooltip(false)")
          else
            channelName = channelName .. " " .. admissionDesc
            ;
            ((((_worldServerCtrls[index])._channelCtrls)[idx])._bgStatic):addInputEvent("Mouse_On", "ServerSelect_Simpletooltip(true, 1, " .. R29_PC195 .. ", " .. idx .. ")")
            ;
            ((((_worldServerCtrls[index])._channelCtrls)[idx])._bgStatic):addInputEvent("Mouse_Out", "ServerSelect_Simpletooltip(false)")
          end
          ;
          ((((_worldServerCtrls[index])._channelCtrls)[idx])._warIcon):SetShow(true)
        else
          ((((_worldServerCtrls[index])._channelCtrls)[idx])._warIcon):SetShow(false)
          channelName = channelName .. " " .. admissionDesc
          ;
          ((((_worldServerCtrls[index])._channelCtrls)[idx])._bgStatic):addInputEvent("Mouse_On", "")
        end
        ;
        ((((_worldServerCtrls[index])._channelCtrls)[idx])._nameText):SetText(channelName)
        ;
        ((((_worldServerCtrls[index])._channelCtrls)[idx])._warIcon):SetPosX(235)
        ;
        ((((_worldServerCtrls[index])._channelCtrls)[idx])._warIcon):SetPosY(((((_worldServerCtrls[index])._channelCtrls)[idx])._nameText):GetPosY())
        ;
        ((((_worldServerCtrls[index])._channelCtrls)[idx])._premiumIcon):SetPosX(235)
        ;
        ((((_worldServerCtrls[index])._channelCtrls)[idx])._premiumIcon):SetPosY(((((_worldServerCtrls[index])._channelCtrls)[idx])._nameText):GetPosY())
        ;
        ((((_worldServerCtrls[index])._channelCtrls)[idx])._premiumIcon):SetShow(false)
        if isLoginIDShow() == true then
          if isAdmission then
            ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(not isRadioBtnShow)
            ;
            ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(not isAdmission or isRadioBtnShow)
            ;
            ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(not isAdmission or isRadioBtnShow)
            if serverData._isPremiumChannel then
              if temporaryWrapper:isPremiumChannelPermission() == true then
                if isTempShow then
                  ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(not isRadioBtnShow)
                  ;
                  ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(not isTempShow or isRadioBtnShow)
                  ;
                  ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(not isTempShow or isRadioBtnShow)
                  ;
                  ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(false)
                  ;
                  ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(false)
                  ;
                  ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(false)
                  if serverData._isSteamChannel then
                    if isSteamClient() == true then
                      if isTempShow then
                        ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(not isRadioBtnShow)
                        ;
                        ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(not isTempShow or isRadioBtnShow)
                        ;
                        ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(not isTempShow or isRadioBtnShow)
                        ;
                        ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(false)
                        ;
                        ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(false)
                        ;
                        ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(false)
                        if serverData._isSpeedChannel then
                          if temporaryWrapper:getMyAdmissionToSpeedServer() ~= 0 then
                            if isTempShow then
                              ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(not isRadioBtnShow)
                              ;
                              ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(not isTempShow or isRadioBtnShow)
                              ;
                              ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(not isTempShow or isRadioBtnShow)
                              ;
                              ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(false)
                              ;
                              ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(false)
                              ;
                              ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(false)
                              if serverData._isBalanceChannel then
                                if ToClient_isAccessableBalanceChannel() then
                                  if isTempShow then
                                    ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(not isRadioBtnShow)
                                    ;
                                    ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(not isTempShow or isRadioBtnShow)
                                    ;
                                    ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(not isTempShow or isRadioBtnShow)
                                    ;
                                    ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(false)
                                    ;
                                    ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(false)
                                    ;
                                    ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(false)
                                    if serverData._isPcroomChannel then
                                      ((((_worldServerCtrls[index])._channelCtrls)[idx])._premiumIcon):SetShow(true)
                                    elseif isTempShow then
                                      ((((_worldServerCtrls[index])._channelCtrls)[idx])._enterBtn):SetShow(not isRadioBtnShow)
                                      ;
                                      ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):SetShow(not isTempShow or isRadioBtnShow)
                                      ;
                                      ((((_worldServerCtrls[index])._channelCtrls)[idx])._mainServerSQ):SetShow(not isTempShow or isRadioBtnShow)
                                      ;
                                      ((((_worldServerCtrls[index])._channelCtrls)[idx])._changeChannel):SetShow(not isTempShow)
                                      if busyState == 0 then
                                        ((((_worldServerCtrls[index])._channelCtrls)[idx])._changeChannel):SetShow(false)
                                      end
                                      -- DECOMPILER ERROR at PC686: Overwrote pending register: R29 in 'AssignReg'

                                      ;
                                      ((((_worldServerCtrls[index])._channelCtrls)[idx])._changeChannel):SetText(PAGetStringParam1(Defines.StringSheet_GAME, R29_PC195, "changeRealChannelTime", changeRealChannelTime))
                                      local mainServerNo = ServerList_GetMainServerNo()
                                      -- DECOMPILER ERROR at PC701: Overwrote pending register: R29 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC702: Overwrote pending register: R29 in 'AssignReg'

                                      if mainServerNo ~= -1 and serverData._serverNo == mainServerNo then
                                        mainServerText:SetText(PAGetStringParam1(R29_PC195, "LUA_SERVERSELECT_SETMAINSERVER", "serverName", tostring(getChannelName(worldServerData._worldNo, serverData._serverNo))))
                                      end
                                      do
                                        local lastServerNo = temporaryWrapper:getLastServerNo()
                                        if getChannelName(worldServerData._worldNo, lastServerNo) == nil then
                                          txt_EnterLastJoinServer:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVERSELECT_BTN_LASTJOINSERVER"))
                                        else
                                          txt_EnterLastJoinServer:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVERSELECT_LASTJOINSERVER_NUMBER", "lastJoinServer", tostring(getChannelName(worldServerData._worldNo, lastServerNo))))
                                        end
                                        ;
                                        ((((_worldServerCtrls[index])._channelCtrls)[idx])._radioBtnMain):addInputEvent("Mouse_LUp", "ServerList_SetMainServer(" .. R31_PC757 .. "," .. idx .. ")")
                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                        -- DECOMPILER ERROR at PC759: LeaveBlock: unexpected jumping out IF_STMT

                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    serverSelectDeltaTime = 0
  end
  -- DECOMPILER ERROR: 44 unprocessed JMP targets
end

Panel_SelectServer_ShowChannelCtrls = function(worldIndex)
  -- function num : 0_8 , upvalues : _worldServerCount, _worldServerCtrls
  local count = _worldServerCount
  for idx = 0, count - 1 do
    local isShow = false
    if idx == worldIndex then
      isShow = true
    end
    for channelIdx = 0, (_worldServerCtrls[idx])._channelCount - 1 do
      ((((_worldServerCtrls[idx])._channelCtrls)[channelIdx])._bgStatic):SetShow(isShow)
    end
  end
end

Panel_SelectServer_RePositioningCtrls = function()
  -- function num : 0_9 , upvalues : SELECT_SERVER_BG_TEXT, WORLD_BG_BTN, FRAME_SERVERLIST, _worldServerCount, _worldServerCtrls, FRAMEContents_SERVERLIST, FRAME_Scroll, mainServerBg
  local bgPosY = SELECT_SERVER_BG_TEXT:GetPosY() + 20
  local worldSizeY = WORLD_BG_BTN:GetSizeY()
  local posX = SELECT_SERVER_BG_TEXT:GetPosX() + 20
  local posY = bgPosY + 30
  FRAME_SERVERLIST:SetPosX(posX)
  FRAME_SERVERLIST:SetPosY(posY)
  posX = 0
  posY = 0
  local count = _worldServerCount
  for idx = 0, count - 1 do
    ((_worldServerCtrls[idx])._bgButton):SetPosX(posX)
    ;
    ((_worldServerCtrls[idx])._bgButton):SetPosY(posY + 5)
    local varyY = Panel_SelectServer_GetVariableSizeY(posX + 5, posY, idx)
    posY = posY + varyY
    SELECT_SERVER_BG_TEXT:SetSize(SELECT_SERVER_BG_TEXT:GetSizeX(), getScreenSizeY() - 20)
  end
  FRAME_SERVERLIST:SetSize(SELECT_SERVER_BG_TEXT:GetSizeX() - 40, SELECT_SERVER_BG_TEXT:GetSizeY() - 60 - 130)
  FRAMEContents_SERVERLIST:SetSize(SELECT_SERVER_BG_TEXT:GetSizeX() - 40, posY)
  FRAME_Scroll:SetSize(FRAME_Scroll:GetSizeX(), SELECT_SERVER_BG_TEXT:GetSizeY() - 60 - 110)
  FRAME_SERVERLIST:UpdateContentScroll()
  FRAME_Scroll:SetControlTop()
  FRAME_SERVERLIST:UpdateContentPos()
  if FRAME_SERVERLIST:GetSizeY() < FRAMEContents_SERVERLIST:GetSizeY() then
    FRAME_Scroll:SetShow(true)
  else
    FRAME_Scroll:SetShow(false)
  end
  mainServerBg:ComputePos()
end

Panel_SelectServer_GetVariableSizeY = function(posX, posY, worldIndex)
  -- function num : 0_10 , upvalues : WORLD_BG_BTN, _selectWorldIndex, CHANNEL_BG_STATIC, _worldServerCtrls, isSpeedServer, FRAMEContents_SERVERLIST
  local default = WORLD_BG_BTN:GetSizeY() + 10
  if _selectWorldIndex ~= worldIndex then
    return default
  end
  local channelSizeY = CHANNEL_BG_STATIC:GetSizeY() + 5
  local count = (_worldServerCtrls[worldIndex])._channelCount
  local tempPosY = nil
  for idx = 0, count - 1 do
    tempPosY = posY + default + channelSizeY * idx
    ;
    ((((_worldServerCtrls[worldIndex])._channelCtrls)[(isSpeedServer[worldIndex])[idx]])._bgStatic):SetPosX(posX)
    ;
    ((((_worldServerCtrls[worldIndex])._channelCtrls)[(isSpeedServer[worldIndex])[idx]])._bgStatic):SetPosY(tempPosY)
  end
  FRAMEContents_SERVERLIST:SetSize(posX, tempPosY + default)
  return default + channelSizeY * count
end

Panel_Lobby_function_SelectWorldServer = function(index)
  -- function num : 0_11 , upvalues : _selectWorldIndex
  _selectWorldIndex = index
  Panel_SelectServer_ShowChannelCtrls(index)
  Panel_SelectServer_RePositioningCtrls()
end

Panel_Lobby_function_EnterChannel = function(index)
  -- function num : 0_12 , upvalues : _selectWorldIndex
  if selectServerGroup(_selectWorldIndex, index) == true then
    Panel_Lobby_Function_EnableEnterChannelButton(false)
  end
end

Panel_Lobby_Function_EnableEnterChannelButton = function(enableValue)
  -- function num : 0_13 , upvalues : _worldServerCount, _worldServerCtrls, FRAME_SERVERLIST
  for worldIndex = 0, _worldServerCount - 1 do
    for idx = 0, (_worldServerCtrls[worldIndex])._channelCount - 1 do
      local tmpBG = (UI.getChildControl)(FRAME_SERVERLIST:GetFrameContent(), "ChannelBG_" .. tostring(worldIndex) .. "_" .. tostring(idx))
      local tmpButton = (UI.getChildControl)(tmpBG, "ChannelButton_" .. tostring(worldIndex) .. "_" .. tostring(idx))
      tmpButton:SetEnable(enableValue)
      tmpButton:SetMonoTone(not enableValue)
    end
  end
end

Panel_Lobby_function_EnterMemorizedChannel = function(index)
  -- function num : 0_14 , upvalues : _selectWorldIndex
  selectMemorizedServer(_selectWorldIndex, index)
end

ServerList_RandomServerJoin = function()
  -- function num : 0_15 , upvalues : _selectWorldIndex
  selectRandomServer(_selectWorldIndex)
end

EventUpdateServerInformation_SelectServer = function()
  -- function num : 0_16 , upvalues : _selectWorldIndex
  local isShow = Panel_ServerSelect:IsShow()
  if isShow == false then
    return 
  end
  local selectIndex = _selectWorldIndex
  StartUp_Panel_SelectServer()
  if selectIndex ~= -1 then
    Panel_Lobby_function_SelectWorldServer(selectIndex)
  end
end

SelectServer_RequestInfo_ForTest = function()
  -- function num : 0_17
  requestServerInformationForTest()
end

PanelServerSelect_Resize = function()
  -- function num : 0_18 , upvalues : SELECT_SERVER_BG_TEXT, FRAME_SERVERLIST, FRAME_Scroll, totalBG
  local count = getGameWorldServerDataCount() + 1
  Panel_ServerSelect:SetSize(getScreenSizeX(), getScreenSizeY())
  SELECT_SERVER_BG_TEXT:SetSize(SELECT_SERVER_BG_TEXT:GetSizeX() + 21, count * 48 + 50)
  SELECT_SERVER_BG_TEXT:SetHorizonRight()
  FRAME_SERVERLIST:SetSize(SELECT_SERVER_BG_TEXT:GetSizeX() - 40, SELECT_SERVER_BG_TEXT:GetSizeY() - 60)
  FRAME_Scroll:SetSize(FRAME_Scroll:GetSizeX(), SELECT_SERVER_BG_TEXT:GetSizeY() - 60)
  FRAME_SERVERLIST:SetHorizonRight()
  FRAME_SERVERLIST:UpdateContentPos()
  if FRAME_SERVERLIST:GetSizeY() < FRAME_SERVERLIST:GetSizeY() then
    FRAME_Scroll:SetShow(true)
  else
    FRAME_Scroll:SetShow(false)
  end
  for ii = 1, totalBG do
    (Static_Back[ii]):SetSize(getScreenSizeX(), getScreenSizeY())
  end
end

local currentBackIndex = bgStartIndex
;
(Static_Back[currentBackIndex]):SetShow(true)
;
(Static_Back[currentBackIndex]):SetAlpha(1)
local updateTime = 0
local isScope = true
local startUV = 0.1
local endUV = startUV + 0.04
local startUV2 = 0.9
local endUV2 = startUV2 + 0.04
ChannelSelectInfo_onScreenResize = function()
  -- function num : 0_19 , upvalues : channelSelectInfo, FRAME_SERVERLIST
  local self = channelSelectInfo
  local scrX = getScreenSizeX()
  ;
  (self._mainBG):SetPosX(scrX - (FRAME_SERVERLIST:GetSizeX() + (self._mainBG):GetSizeX() + 55))
  ;
  (self._mainBG):SetPosY(10)
end

SpeedChannelInfo_onScreenResize = function()
  -- function num : 0_20 , upvalues : channelSpeedInfo, FRAME_SERVERLIST, channelSelectInfo
  local self = channelSpeedInfo
  local scrX = getScreenSizeX()
  ;
  (self._speedMainBG):SetPosX(scrX - (FRAME_SERVERLIST:GetSizeX() + (self._speedMainBG):GetSizeX() + 55))
  if isGameTypeRussia() then
    (self._speedMainBG):SetPosY(10)
  else
    ;
    (self._speedMainBG):SetPosY((channelSelectInfo._mainBG):GetPosY() + (channelSelectInfo._mainBG):GetSizeY() + 10)
  end
end

warInfo_onScreenResize = function()
  -- function num : 0_21 , upvalues : warInfo, FRAME_SERVERLIST, channelSelectInfo, channelSpeedInfo
  local self = warInfo
  local scrX = getScreenSizeX()
  ;
  (self._uiWarInfo):SetPosX(scrX - (FRAME_SERVERLIST:GetSizeX() + (self._uiWarInfo):GetSizeX() + 55))
  if isGameTypeSA() then
    (self._uiWarInfo):SetPosY((channelSelectInfo._mainBG):GetPosY() + (channelSelectInfo._mainBG):GetSizeY() + 10)
  else
    ;
    (self._uiWarInfo):SetPosY((channelSpeedInfo._speedMainBG):GetPosY() + (channelSpeedInfo._speedMainBG):GetSizeY() + 10)
  end
end

ChannelSelectInfo_Show = function()
  -- function num : 0_22 , upvalues : channelSelectInfo
  local self = channelSelectInfo
  ChannelSelectInfo_onScreenResize()
  ;
  (self._mainBG):SetShow(true)
end

ChannelSelectInfo_Hide = function()
  -- function num : 0_23 , upvalues : channelSelectInfo
  local self = channelSelectInfo
  if not (self._mainBG):GetShow() then
    return 
  end
  ;
  (self._mainBG):SetShow(false)
end

SpeedChannelInfo_Show = function()
  -- function num : 0_24 , upvalues : channelSpeedInfo
  local self = channelSpeedInfo
  SpeedChannelInfo_onScreenResize()
  ;
  (self._speedMainBG):SetShow(true)
end

SpeedChannelInfo_Hide = function()
  -- function num : 0_25 , upvalues : channelSpeedInfo
  local self = channelSpeedInfo
  if not (self._speedMainBG):GetShow() then
    return 
  end
  ;
  (self._speedMainBG):SetShow(false)
end

warInfo_Show = function()
  -- function num : 0_26 , upvalues : warInfo
  local self = warInfo
  warInfo_onScreenResize()
  ;
  (self._uiWarInfo):SetShow(true)
end

warInfo_Hide = function()
  -- function num : 0_27 , upvalues : warInfo
  local self = warInfo
  if not (self._uiWarInfo):GetShow() then
    return 
  end
  ;
  (self._uiWarInfo):SetShow(false)
end

Panel_ServerSelect_Update = function(deltaTime)
  -- function num : 0_28 , upvalues : updateTime, isScope, currentBackIndex, startUV, endUV, startUV2, endUV2, totalBG
  Panel_SelectServer_Delta(deltaTime)
  updateTime = updateTime - deltaTime
  if updateTime <= 0 then
    updateTime = 15
    if isScope then
      (Static_Back[currentBackIndex]):SetShow(true)
      isScope = false
      local FadeMaskAni = (Static_Back[currentBackIndex]):addTextureUVAnimation(0, 15, 0)
      FadeMaskAni:SetStartUV(startUV, startUV, 0)
      FadeMaskAni:SetEndUV(endUV, startUV, 0)
      FadeMaskAni:SetStartUV(startUV2, startUV, 1)
      FadeMaskAni:SetEndUV(endUV2, startUV, 1)
      FadeMaskAni:SetStartUV(startUV, startUV2, 2)
      FadeMaskAni:SetEndUV(endUV, startUV2, 2)
      FadeMaskAni:SetStartUV(startUV2, startUV2, 3)
      FadeMaskAni:SetEndUV(endUV2, startUV2, 3)
    else
      do
        isScope = true
        local FadeMaskAni = (Static_Back[currentBackIndex]):addTextureUVAnimation(0, 15, 0)
        FadeMaskAni:SetEndUV(startUV, startUV, 0)
        FadeMaskAni:SetStartUV(endUV, startUV, 0)
        FadeMaskAni:SetEndUV(startUV2, startUV, 1)
        FadeMaskAni:SetStartUV(endUV2, startUV, 1)
        FadeMaskAni:SetEndUV(startUV, startUV2, 2)
        FadeMaskAni:SetStartUV(endUV, startUV2, 2)
        FadeMaskAni:SetEndUV(startUV2, startUV2, 3)
        FadeMaskAni:SetStartUV(endUV2, startUV2, 3)
        local fadeColor = (Static_Back[currentBackIndex]):addColorAnimation(15, 17, 0)
        fadeColor:SetStartColor((Defines.Color).C_FFFFFFFF)
        fadeColor:SetEndColor((Defines.Color).C_00FFFFFF)
        currentBackIndex = currentBackIndex + 1
        if totalBG < currentBackIndex then
          currentBackIndex = getRandomValue(1, totalBG)
        end
        local baseTexture = (Static_Back[currentBackIndex]):getBaseTexture()
        baseTexture:setUV(startUV, startUV, startUV2, startUV2)
        ;
        (Static_Back[currentBackIndex]):setRenderTexture(baseTexture)
        local fadeColor2 = (Static_Back[currentBackIndex]):addColorAnimation(12, 15, 0)
        fadeColor2:SetStartColor((Defines.Color).C_00FFFFFF)
        fadeColor2:SetEndColor((Defines.Color).C_FFFFFFFF)
      end
    end
  end
end

ServerList_GetMainServerNo = function()
  -- function num : 0_29
  local mainServerNo = ToClient_getUserSubCacheData((CppEnums.GlobalUIOptionType).MainServerNo)
  return mainServerNo
end

ServerList_ToggleRadioBtn = function()
  -- function num : 0_30 , upvalues : isRadioBtnShow
  if isRadioBtnShow == true then
    isRadioBtnShow = false
  else
    if isRadioBtnShow == false then
      isRadioBtnShow = true
    end
  end
end

ServerList_SetMainServer = function(worldIndex, serverIndex)
  -- function num : 0_31 , upvalues : isRadioBtnShow
  local worldServerData = getGameWorldServerDataByIndex(worldIndex)
  local serverData = getGameChannelServerDataByIndex(worldIndex, serverIndex)
  if serverData == nil then
    Proc_ShowMessage_Ack("잘못�\156 서버 정보입니�\164. 다시 시도해주세요.")
    return 
  end
  local Set_MainServer = function()
    -- function num : 0_31_0 , upvalues : worldIndex, serverIndex, isRadioBtnShow
    local serverData = getGameChannelServerDataByIndex(worldIndex, serverIndex)
    local serverNo = serverData._serverNo
    ToClient_setUserSubCacheData((CppEnums.GlobalUIOptionType).MainServerNo, serverNo)
    isRadioBtnShow = false
  end

  local serverName = getChannelName(worldServerData._worldNo, serverData._serverNo)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_MAINSERVERTITLE"), content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVERSELECT_MAINSERVERCONTENT", "serverName", serverName), functionApply = Set_MainServer, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

ServerSelect_Simpletooltip = function(isShow, tipType, index, idx)
  -- function num : 0_32 , upvalues : _worldServerCtrls
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  local warName = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_LOCALWAR")
  if tipType == 0 then
    warName = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_LOCALWAR")
  else
    if tipType == 1 then
      warName = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_TERRITORYWAR")
    end
  end
  name = warName
  control = (((_worldServerCtrls[index])._channelCtrls)[idx])._bgStatic
  TooltipSimple_Show(control, name, desc)
end

ServerList_EnterMainServer = function()
  -- function num : 0_33 , upvalues : _selectWorldIndex, _worldServerCtrls
  local mainServerNo = ServerList_GetMainServerNo()
  do
    if mainServerNo == -1 then
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_MAINSERVERTITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_MAINSERVERALERT"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      return 
    end
    local worldServerData = getGameWorldServerDataByIndex(_selectWorldIndex)
    local restrictedServerNo = worldServerData._restrictedServerNo
    do
      if restrictedServerNo ~= 0 and mainServerNo ~= restrictedServerNo then
        local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_MAINSERVERTITLE"), content = PAGetString(Defines.StringSheet_SymbolNo, "eErrNoChannelMoveableTimeIsInvalid"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData)
        return 
      end
      for idx = 0, (_worldServerCtrls[_selectWorldIndex])._channelCount - 1 do
        local serverData = getGameChannelServerDataByIndex(_selectWorldIndex, idx)
        if serverData == nil then
          break
        end
        if ServerList_GetMainServerNo() == serverData._serverNo then
          Panel_Lobby_function_EnterMemorizedChannel(idx)
          break
        end
      end
    end
  end
end

ServerList_LastJoinServer = function()
  -- function num : 0_34 , upvalues : _selectWorldIndex, _worldServerCtrls
  local tempWrapper = getTemporaryInformationWrapper()
  local lastJoinServerNo = tempWrapper:getLastServerNo()
  if lastJoinServerNo == 1 then
    return 
  end
  local worldServerData = getGameWorldServerDataByIndex(_selectWorldIndex)
  local channelCount = getGameChannelServerDataCount(worldServerData._worldNo)
  for idx = 0, (_worldServerCtrls[_selectWorldIndex])._channelCount - 1 do
    local serverData = getGameChannelServerDataByIndex(_selectWorldIndex, idx)
    if serverData == nil then
      break
    end
    if serverData._serverNo == lastJoinServerNo then
      Panel_Lobby_function_EnterMemorizedChannel(idx)
      break
    end
  end
end

btn_SetMainServer:addInputEvent("Mouse_LUp", "ServerList_ToggleRadioBtn()")
btn_EnterMainServer:addInputEvent("Mouse_LUp", "ServerList_EnterMainServer()")
btn_EnterLastJoinServer:addInputEvent("Mouse_LUp", "ServerList_LastJoinServer()")
btn_RandomJoinServer:addInputEvent("Mouse_LUp", "ServerList_RandomServerJoin()")
registerEvent("EventChangeLobbyStageToServerSelect", "StartUp_Panel_SelectServer")
registerEvent("EventUpdateServerInformationForServerSelect", "EventUpdateServerInformation_SelectServer")
Panel_ServerSelect:RegisterUpdateFunc("Panel_ServerSelect_Update")
registerEvent("onScreenResize", "PanelServerSelect_Resize")
PanelServerSelect_Resize()
warInfo_Init()
channelSelectInfo_Init()
SpeedChannelInfo_Init()

