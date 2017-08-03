-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\gameexit\panel_gameexitserverselect.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
Panel_ChannelSelect:SetShow(false)
Panel_ChannelSelect:RegisterShowEventFunc(true, "Panel_ChannelSelect_ShowAni()")
Panel_ChannelSelect:RegisterShowEventFunc(false, "Panel_ChannelSelect_HideAni()")
local channelSelect = {_BlockBG = (UI.getChildControl)(Panel_ChannelSelect, "Static_BlockBG"), _close_btn = (UI.getChildControl)(Panel_ChannelSelect, "Button_Close"), _question_btn = (UI.getChildControl)(Panel_ChannelSelect, "Button_Question"), _allBG = (UI.getChildControl)(Panel_ChannelSelect, "Static_AllBG"), _title = (UI.getChildControl)(Panel_ChannelSelect, "StaticText_Title"), _channelBg = (UI.getChildControl)(Panel_ChannelSelect, "Static_Channel_BG"), _currentChBg = (UI.getChildControl)(Panel_ChannelSelect, "Static_CurrentChannel_BG"), _selectedChBg = (UI.getChildControl)(Panel_ChannelSelect, "StaticText_SelectedChannelBg"), _warIcon = (UI.getChildControl)(Panel_ChannelSelect, "StaticText_WarIcon"), _noEnteranceIcon = (UI.getChildControl)(Panel_ChannelSelect, "StaticText_NoEnterance"), _maintenanceIcon = (UI.getChildControl)(Panel_ChannelSelect, "StaticText_Maintenance"), _expIcon = (UI.getChildControl)(Panel_ChannelSelect, "StaticText_ExpEvent"), _PremiumIcon = (UI.getChildControl)(Panel_ChannelSelect, "StaticText_Preminum"), _mainDesc = (UI.getChildControl)(Panel_ChannelSelect, "Static_ChannelSelectDescPanel"), 
channelSelectData = {}
, 
isSpeedServer = {}
, 
isNotSpeedServer = {}
, 
groupBg = {}
, 
channelSelectUIPool = {}
, _selectChannel = -1, _channelUiMaxCount = 0, _serverCountInGroup = 0}
channelSelect._mainDescBg = (UI.getChildControl)(channelSelect._mainDesc, "Static_ChannelSelectDescBG")
local channelGroupCount = {}
if isGameTypeKorea() then
  channelGroupCount = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1; [0] = 5}
else
  if isGameTypeJapan() then
    channelGroupCount = {4, 4, 4, 4, 4, 2; [0] = 4}
  else
    if isGameTypeRussia() then
      channelGroupCount = {4, 4, 4, 4, 4; [0] = 3}
    else
      if isGameTypeEnglish() then
        channelGroupCount = {6, 6, 6, 6, 6, 6; [0] = 2}
      else
        if isGameTypeTaiwan() then
          channelGroupCount = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3; [0] = 3}
        else
          channelGroupCount = {3, 3, 3, 3, 3, 3, 3, 3, 3, 3; [0] = 5}
        end
      end
    end
  end
end
local channelChildControl = {_name = (UI.getChildControl)(channelSelect._channelBg, "StaticText_ChannelName"), _status = (UI.getChildControl)(channelSelect._channelBg, "StaticText_Status"), _warIcon = (UI.getChildControl)(channelSelect._channelBg, "Static_WarIcon"), _noEnteranceIcon = (UI.getChildControl)(channelSelect._channelBg, "Static_NoEnterance"), _maintenanceIcon = (UI.getChildControl)(channelSelect._channelBg, "Static_Maintenance"), _expIcon = (UI.getChildControl)(channelSelect._channelBg, "Static_ExpEvent"), _premiumIcon = (UI.getChildControl)(channelSelect._channelBg, "Static_Premium")}
local channelMainDesc = {_serverTitle = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_ChannelSelectTitle"), _serverDesc = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_ChannelSelectDesc"), _speedTitle = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_SpeedTitle"), _speedDesc = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_SpeedDesc"), _siegeTitle = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_Channel"), _siegeBalenos = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_Siege_Balenos"), _siegeSerendia = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_Siege_Serendia"), _siegeCalpheon = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_Siege_Calpheon"), _siegeMedia = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_Siege_Media"), _siegeValencia = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_Siege_Valencia"), _scheduleTitle = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_Schedule"), _scheduleSiege = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_Schedule_Siege"), _scheduleNodeWar = (UI.getChildControl)(channelSelect._mainDescBg, "StaticText_Schedule_Nodewar")}
Panel_ChannelSelect_ShowAni = function()
  -- function num : 0_0
  Panel_ChannelSelect:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_ChannelSelect, 0, 0.3)
end

Panel_ChannelSelect_HideAni = function()
  -- function num : 0_1
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_ChannelSelect, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

local bgIndex = nil
ChannelSelect_Init = function()
  -- function num : 0_2 , upvalues : channelSelect, channelGroupCount, bgIndex, UI_PUCT, channelChildControl, channelMainDesc
  local self = channelSelect
  local curChannelData = getCurrentChannelServerData()
  if curChannelData == nil then
    return 
  end
  local isChannelCountLow = false
  local curWorldData = getGameWorldServerDataByWorldNo(curChannelData._worldNo)
  local channelCount = getGameChannelServerDataCount(curWorldData._worldNo)
  if channelCount < 20 then
    isChannelCountLow = true
  end
  local halfChannelCount = (math.ceil)(channelCount / 2)
  local channelGroupIndex = 0
  while halfChannelCount > self._channelUiMaxCount do
    self._channelUiMaxCount = self._channelUiMaxCount + channelGroupCount[channelGroupIndex]
    channelGroupIndex = channelGroupIndex + 1
  end
  bgIndex = (math.floor)((channelCount - 1) / self._channelUiMaxCount)
  if isChannelCountLow then
    bgIndex = 0
    self._channelUiMaxCount = 20
  end
  for index = 0, bgIndex do
    -- DECOMPILER ERROR at PC61: Confused about usage of register: R11 in 'UnsetPending'

    if (self.groupBg)[index] == nil then
      (self.groupBg)[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_ChannelSelect, "Static_ChannelGroupBg_" .. index)
      CopyBaseProperty(self._allBG, (self.groupBg)[index])
      ;
      ((self.groupBg)[index]):SetPosX(15 + ((self._allBG):GetSizeX() + 5) * index)
      ;
      ((self.groupBg)[index]):SetShow(true)
      ;
      ((self.groupBg)[index]):SetSize(((self.groupBg)[index]):GetSizeX(), self._channelUiMaxCount * 30 + 5)
    end
  end
  if isChannelCountLow then
    for index = 0, channelCount - 1 do
      local channelList = {}
      channelList.channelBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, (self.groupBg)[0], "create_ChannelBg_" .. index)
      channelList.channelCurrentBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, channelList.channelBg, "create_ChannelCurrentBg_" .. index)
      channelList.channelSelectedBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, channelList.channelBg, "create_ChannelSelectedBg_" .. index)
      channelList.channelName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, channelList.channelBg, "create_ChannelName_" .. index)
      channelList.channelStatus = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, channelList.channelBg, "create_ChannelStatus_" .. index)
      channelList.channelWaricon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelWaricon_" .. index)
      channelList.channelnoEnterIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelNoEnterIcon_" .. index)
      channelList.channelMaintenanceIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelMaintenanceIcon_" .. index)
      channelList.channelExpIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelExpIcon_" .. index)
      channelList.channelPremiumIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelPremiumIcon_" .. index)
      CopyBaseProperty(self._channelBg, channelList.channelBg)
      CopyBaseProperty(self._currentChBg, channelList.channelCurrentBg)
      CopyBaseProperty(self._selectedChBg, channelList.channelSelectedBg)
      CopyBaseProperty(channelChildControl._name, channelList.channelName)
      CopyBaseProperty(channelChildControl._status, channelList.channelStatus)
      CopyBaseProperty(channelChildControl._warIcon, channelList.channelWaricon)
      CopyBaseProperty(channelChildControl._noEnteranceIcon, channelList.channelnoEnterIcon)
      CopyBaseProperty(channelChildControl._maintenanceIcon, channelList.channelMaintenanceIcon)
      CopyBaseProperty(channelChildControl._expIcon, channelList.channelExpIcon)
      CopyBaseProperty(channelChildControl._premiumIcon, channelList.channelPremiumIcon)
      ;
      (channelList.channelBg):SetShow(true)
      ;
      (channelList.channelBg):SetPosX(3)
      ;
      (channelList.channelBg):SetPosY(5 + ((channelList.channelBg):GetSizeY() + 5) * index)
      ;
      (channelList.channelCurrentBg):SetShow(false)
      ;
      (channelList.channelCurrentBg):SetPosX(0)
      ;
      (channelList.channelCurrentBg):SetPosY(0)
      ;
      (channelList.channelSelectedBg):SetShow(false)
      ;
      (channelList.channelSelectedBg):SetPosX(0)
      ;
      (channelList.channelSelectedBg):SetPosY(0)
      -- DECOMPILER ERROR at PC291: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (self.channelSelectUIPool)[index] = channelList
    end
  else
    do
      for index = 0, channelCount - 1 do
        local _bgIndex = (math.floor)(index / self._channelUiMaxCount)
        local channelList = {}
        channelList.channelBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, (self.groupBg)[_bgIndex], "create_ChannelBg_" .. index)
        channelList.channelCurrentBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, channelList.channelBg, "create_ChannelCurrentBg_" .. index)
        channelList.channelSelectedBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, channelList.channelBg, "create_ChannelSelectedBg_" .. index)
        channelList.channelName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, channelList.channelBg, "create_ChannelName_" .. index)
        channelList.channelStatus = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, channelList.channelBg, "create_ChannelStatus_" .. index)
        channelList.channelWaricon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelWaricon_" .. index)
        channelList.channelnoEnterIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelNoEnterIcon_" .. index)
        channelList.channelMaintenanceIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelMaintenanceIcon_" .. index)
        channelList.channelExpIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelExpIcon_" .. index)
        channelList.channelPremiumIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, channelList.channelBg, "create_ChannelPremiumIcon_" .. index)
        CopyBaseProperty(self._channelBg, channelList.channelBg)
        CopyBaseProperty(self._currentChBg, channelList.channelCurrentBg)
        CopyBaseProperty(self._selectedChBg, channelList.channelSelectedBg)
        CopyBaseProperty(channelChildControl._name, channelList.channelName)
        CopyBaseProperty(channelChildControl._status, channelList.channelStatus)
        CopyBaseProperty(channelChildControl._warIcon, channelList.channelWaricon)
        CopyBaseProperty(channelChildControl._noEnteranceIcon, channelList.channelnoEnterIcon)
        CopyBaseProperty(channelChildControl._maintenanceIcon, channelList.channelMaintenanceIcon)
        CopyBaseProperty(channelChildControl._expIcon, channelList.channelExpIcon)
        CopyBaseProperty(channelChildControl._premiumIcon, channelList.channelPremiumIcon)
        ;
        (channelList.channelBg):SetShow(true)
        ;
        (channelList.channelBg):SetPosX(3)
        ;
        (channelList.channelBg):SetPosY(5 + ((channelList.channelBg):GetSizeY() + 5) * (index % self._channelUiMaxCount))
        ;
        (channelList.channelCurrentBg):SetShow(false)
        ;
        (channelList.channelCurrentBg):SetPosX(0)
        ;
        (channelList.channelCurrentBg):SetPosY(0)
        ;
        (channelList.channelSelectedBg):SetShow(false)
        ;
        (channelList.channelSelectedBg):SetPosX(0)
        ;
        (channelList.channelSelectedBg):SetPosY(0)
        -- DECOMPILER ERROR at PC496: Confused about usage of register: R13 in 'UnsetPending'

        ;
        (self.channelSelectUIPool)[index] = channelList
      end
      do
        ;
        (channelMainDesc._serverTitle):SetPosY(10)
        ;
        (channelMainDesc._serverDesc):SetPosY(30)
        ;
        (channelMainDesc._serverDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
        ;
        (channelMainDesc._serverDesc):SetText((channelMainDesc._serverDesc):GetText())
        local sizeControl = nil
        if isGameTypeSA() then
          (channelMainDesc._speedTitle):SetShow(false)
          ;
          (channelMainDesc._speedDesc):SetShow(false)
          sizeControl = channelMainDesc._serverDesc
        else
          if isGameTypeKR2() then
            (channelMainDesc._speedTitle):SetShow(false)
            ;
            (channelMainDesc._speedDesc):SetShow(false)
            ;
            (channelMainDesc._siegeTitle):SetShow(false)
            ;
            (channelMainDesc._siegeBalenos):SetShow(false)
            ;
            (channelMainDesc._siegeSerendia):SetShow(false)
            ;
            (channelMainDesc._siegeCalpheon):SetShow(false)
            ;
            (channelMainDesc._siegeMedia):SetShow(false)
            ;
            (channelMainDesc._siegeValencia):SetShow(false)
            ;
            (channelMainDesc._scheduleTitle):SetShow(false)
            ;
            (channelMainDesc._scheduleSiege):SetShow(false)
            ;
            (channelMainDesc._scheduleNodeWar):SetShow(false)
            sizeControl = channelMainDesc._serverDesc
          else
            sizeControl = channelMainDesc._speedDesc
          end
        end
        ;
        (channelMainDesc._speedTitle):SetPosY((channelMainDesc._serverDesc):GetPosY() + (channelMainDesc._serverDesc):GetTextSizeY() + 15)
        ;
        (channelMainDesc._speedTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_SPEEDCHANNEL_TITLE"))
        ;
        (channelMainDesc._speedDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
        if isGameTypeTaiwan() then
          (channelMainDesc._speedDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_SPEEDCHANNEL_DESC_TW"))
        else
          ;
          (channelMainDesc._speedDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_SPEEDCHANNEL_DESC"))
        end
        ;
        (channelMainDesc._speedDesc):SetPosY((channelMainDesc._speedTitle):GetPosY() + 20)
        ;
        (channelMainDesc._siegeTitle):SetPosY(sizeControl:GetPosY() + sizeControl:GetTextSizeY() + 15)
        ;
        (channelMainDesc._siegeBalenos):SetPosY((channelMainDesc._siegeTitle):GetPosY() + 20)
        ;
        (channelMainDesc._siegeSerendia):SetPosY((channelMainDesc._siegeBalenos):GetPosY() + 20)
        ;
        (channelMainDesc._siegeCalpheon):SetPosY((channelMainDesc._siegeSerendia):GetPosY() + 20)
        ;
        (channelMainDesc._siegeMedia):SetPosY((channelMainDesc._siegeCalpheon):GetPosY() + 20)
        ;
        (channelMainDesc._siegeValencia):SetPosY((channelMainDesc._siegeMedia):GetPosY() + 20)
        ;
        (channelMainDesc._scheduleTitle):SetPosY((channelMainDesc._siegeValencia):GetPosY() + 30)
        ;
        (channelMainDesc._scheduleSiege):SetPosY((channelMainDesc._scheduleTitle):GetPosY() + 20)
        ;
        (channelMainDesc._scheduleNodeWar):SetPosY((channelMainDesc._scheduleSiege):GetPosY() + 20)
        if isGameTypeKR2() then
          (self._mainDescBg):SetSize((self._mainDescBg):GetSizeX(), (channelMainDesc._serverDesc):GetPosY() + (channelMainDesc._serverDesc):GetTextSizeY())
        else
          ;
          (self._mainDescBg):SetSize((self._mainDescBg):GetSizeX(), (channelMainDesc._scheduleNodeWar):GetPosY() + (channelMainDesc._scheduleNodeWar):GetTextSizeY())
        end
        ;
        (self._mainDesc):SetSize((self._mainDesc):GetSizeX(), (self._mainDescBg):GetSizeY() + 15)
        ;
        (self._warIcon):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHANNELSELECTE_WARICON"))
        ;
        (self._noEnteranceIcon):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHANNELSELECTE_NOENTERANCEICON"))
        ;
        (self._maintenanceIcon):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHANNELSELECTE_MAINTENANCEICON"))
        ;
        (self._expIcon):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHANNELSELECTE_EXPEVENTICON"))
        ;
        (self._PremiumIcon):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_SEVERSELECT_PCROOMSERVER"))
        if isChannelCountLow then
          Panel_ChannelSelect:SetSize(410, ((self.groupBg)[0]):GetPosY() + ((self.groupBg)[0]):GetSizeY() + 70)
          ;
          (self._title):SetSize(406, (self._title):GetSizeY())
          ;
          (self._warIcon):ComputePos()
          ;
          (self._noEnteranceIcon):ComputePos()
          ;
          (self._maintenanceIcon):ComputePos()
          ;
          (self._expIcon):ComputePos()
          ;
          (self._PremiumIcon):ComputePos()
          ;
          (self._warIcon):SetPosX(15)
          ;
          (self._warIcon):SetPosY(((self.groupBg)[0]):GetPosY() + ((self.groupBg)[0]):GetSizeY() + 10)
          ;
          (self._noEnteranceIcon):SetPosX((self._warIcon):GetPosX() + (self._warIcon):GetSizeX() + (self._warIcon):GetTextSizeX() + 15)
          ;
          (self._noEnteranceIcon):SetPosY(((self.groupBg)[0]):GetPosY() + ((self.groupBg)[0]):GetSizeY() + 10)
          ;
          (self._maintenanceIcon):SetPosX(15)
          ;
          (self._expIcon):SetPosX((self._maintenanceIcon):GetPosX() + (self._maintenanceIcon):GetSizeX() + (self._maintenanceIcon):GetTextSizeX() + 15)
          ;
          (self._PremiumIcon):SetPosX((self._expIcon):GetPosX() + (self._expIcon):GetSizeX() + (self._expIcon):GetTextSizeX() + 15)
        else
          Panel_ChannelSelect:SetSize(796, ((self.groupBg)[0]):GetPosY() + ((self.groupBg)[0]):GetSizeY() + 50)
          ;
          (self._title):SetSize(792, (self._title):GetSizeY())
          ;
          (self._warIcon):ComputePos()
          ;
          (self._noEnteranceIcon):ComputePos()
          ;
          (self._maintenanceIcon):ComputePos()
          ;
          (self._expIcon):ComputePos()
          ;
          (self._PremiumIcon):ComputePos()
          ;
          (self._noEnteranceIcon):SetPosX((self._warIcon):GetPosX() + (self._warIcon):GetSizeX() + (self._warIcon):GetTextSizeX() + 15)
          ;
          (self._maintenanceIcon):SetPosX((self._noEnteranceIcon):GetPosX() + (self._noEnteranceIcon):GetSizeX() + (self._noEnteranceIcon):GetTextSizeX() + 15)
          ;
          (self._expIcon):SetPosX((self._maintenanceIcon):GetPosX() + (self._maintenanceIcon):GetSizeX() + (self._maintenanceIcon):GetTextSizeX() + 15)
          ;
          (self._PremiumIcon):SetPosX((self._expIcon):GetPosX() + (self._expIcon):GetSizeX() + (self._expIcon):GetTextSizeX() + 15)
        end
        if isGameTypeKorea() then
          (self._PremiumIcon):SetShow(true)
        else
          ;
          (self._PremiumIcon):SetShow(false)
        end
        if isGameTypeKR2() then
          (channelSelect._warIcon):SetShow(false)
          ;
          (channelSelect._noEnteranceIcon):SetShow(false)
          ;
          (channelSelect._maintenanceIcon):SetShow(false)
          ;
          (channelSelect._expIcon):SetShow(false)
          ;
          (channelSelect._PremiumIcon):SetShow(false)
        end
      end
    end
  end
end

local oneTimeChange = false
ChannelSelect_Update = function()
  -- function num : 0_3 , upvalues : channelSelect, bgIndex, oneTimeChange
  local curChannelData = getCurrentChannelServerData()
  if curChannelData == nil then
    return 
  end
  local self = channelSelect
  local curWorldData = getGameWorldServerDataByWorldNo(curChannelData._worldNo)
  local channelCount = getGameChannelServerDataCount(curWorldData._worldNo)
  local restrictedServerNo = curWorldData._restrictedServerNo
  local curServerNo = curChannelData._serverNo
  local channelMoveableGlobalTime = getChannelMoveableTime(curWorldData._worldNo)
  local channelMoveableRemainTime = getChannelMoveableRemainTime(curWorldData._worldNo)
  local _worldServerCount = (getGameWorldServerDataCount())
  local _serverData = nil
  isSpeedServer = {}
  isNotSpeedServer = {}
  local index1 = 0
  local index2 = 0
  for chIndex = 0, channelCount - 1 do
    local _serverData = getGameChannelServerDataByWorldNo(curChannelData._worldNo, chIndex)
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R17 in 'UnsetPending'

    if _serverData._isSpeedChannel then
      isSpeedServer[index1] = chIndex
      index1 = index1 + 1
    else
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R17 in 'UnsetPending'

      isNotSpeedServer[index2] = chIndex
      index2 = index2 + 1
    end
  end
  for idx = 0, index2 - 1 do
    -- DECOMPILER ERROR at PC56: Confused about usage of register: R16 in 'UnsetPending'

    isSpeedServer[index1 + idx] = isNotSpeedServer[idx]
  end
  local channelSizeX = 0
  local temporaryWrapper = getTemporaryInformationWrapper()
  for chIndex = 0, channelCount - 1 do
    _serverData = getGameChannelServerDataByWorldNo(curChannelData._worldNo, isSpeedServer[chIndex])
    if _serverData ~= nil then
      (((self.channelSelectUIPool)[chIndex]).channelMaintenanceIcon):SetShow(false)
      local busyState = _serverData._busyState
      if busyState == 0 then
        tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_BUSYSTATE_0")
        ;
        (((self.channelSelectUIPool)[chIndex]).channelMaintenanceIcon):SetShow(true)
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
      local warTerritoryName = ToClient_GetStartSiegeTerritoryKey()
      if warTerritoryName == -2 then
        tempWarName = "모두 불가"
      else
        if warTerritoryName == -1 then
          tempWarName = "모두 �\128�\165"
        else
          if warTerritoryName == 0 then
            tempWarName = "발레노스"
          else
            if warTerritoryName == 1 then
              tempWarName = "세렌디아"
            else
              if warTerritoryName == 2 then
                tempWarName = "칼페�\168"
              else
                if warTerritoryName == 3 then
                  tempWarName = "메디�\132"
                else
                  if warTerritoryName == 4 then
                    tempWarName = "발렌시아"
                  else
                    _PA_ASSERT(false, "확인되지 않은 전쟁 �\128�\165/불가�\165 �\128역값�\180 들어왔따! 확인하거�\152 새로�\180 전쟁�\128역이 추가됬다�\180 추가해주어야한다!!!!")
                  end
                end
              end
            end
          end
        end
      end
      local tempChannel = getGameChannelServerDataByWorldNo(curChannelData._worldNo, isSpeedServer[chIndex])
      local isBeingWar = tempChannel._isSiegeBeing
      local isVillage = tempChannel._isVillageSiege
      ;
      (((self.channelSelectUIPool)[chIndex]).channelWaricon):SetShow(isBeingWar)
      ;
      (((self.channelSelectUIPool)[chIndex]).channelExpIcon):SetShow(_serverData._isSpeedChannel)
      ;
      (((self.channelSelectUIPool)[chIndex]).channelPremiumIcon):SetShow(_serverData._isPcroomChannel)
      if _serverData._isSteamChannel then
        if isSteamClient() == true then
          (((self.channelSelectUIPool)[chIndex]).channelBg):SetIgnore(false)
        else
          ;
          (((self.channelSelectUIPool)[chIndex]).channelBg):SetIgnore(true)
        end
      else
        -- DECOMPILER ERROR at PC226: Unhandled construct in 'MakeBoolean' P1

        if _serverData._isPremiumChannel and temporaryWrapper:isPremiumChannelPermission() == false then
          (((self.channelSelectUIPool)[chIndex]).channelBg):addInputEvent("Mouse_LUp", "")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelBg):SetIgnore(true)
        end
      end
      if _serverData._isSpeedChannel then
        if temporaryWrapper:getMyAdmissionToSpeedServer() ~= 0 then
          (((self.channelSelectUIPool)[chIndex]).channelBg):addInputEvent("Mouse_On", "GameChannelMove_NewbieServerJoinDateToolTip( true, " .. chIndex .. " )")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelBg):addInputEvent("Mouse_Out", "GameChannelMove_NewbieServerJoinDateToolTip( false, " .. chIndex .. ")")
        else
          if ToClient_SelfPlayerIsGM() then
            (((self.channelSelectUIPool)[chIndex]).channelBg):SetIgnore(false)
          else
            ;
            (((self.channelSelectUIPool)[chIndex]).channelBg):SetIgnore(true)
          end
        end
      end
      if _serverData._isBalanceChannel then
        if ToClient_isAccessableBalanceChannel() then
          (((self.channelSelectUIPool)[chIndex]).channelBg):SetIgnore(false)
        else
          ;
          (((self.channelSelectUIPool)[chIndex]).channelBg):addInputEvent("Mouse_LUp", "")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelBg):SetIgnore(true)
        end
      end
      if _serverData._isPcroomChannel and ToClient_isAccessablePcRoomChannel() == false then
        (((self.channelSelectUIPool)[chIndex]).channelBg):addInputEvent("Mouse_LUp", "")
        ;
        (((self.channelSelectUIPool)[chIndex]).channelBg):SetIgnore(true)
      end
      local isAdmission = true
      local isSiegeBeing = deadMessage_isSiegeBeingMyChannel()
      local isInSiegeBattle = deadMessage_isInSiegeBattle()
      if isSiegeBeing == true and isInSiegeBattle == false then
        isAdmission = true
      else
        if restrictedServerNo ~= 0 and toInt64(0, 0) ~= channelMoveableGlobalTime then
          if restrictedServerNo == tempChannel._serverNo then
            isAdmission = true
          else
            if toInt64(0, 0) < channelMoveableRemainTime then
              isAdmission = false
            else
              isAdmission = true
            end
          end
        end
      end
      ;
      (((self.channelSelectUIPool)[chIndex]).channelnoEnterIcon):SetShow(not isAdmission)
      local channelName = getChannelName(tempChannel._worldNo, tempChannel._serverNo)
      if channelName == nil then
        channelName = ""
      end
      ;
      (((self.channelSelectUIPool)[chIndex]).channelBg):addInputEvent("Mouse_LUp", "HandleClicked_ChannelSelect( " .. chIndex .. " )")
      ;
      (((self.channelSelectUIPool)[chIndex]).channelCurrentBg):SetShow(false)
      if curChannelData._worldNo == tempChannel._worldNo and curChannelData._serverNo == tempChannel._serverNo then
        (((self.channelSelectUIPool)[chIndex]).channelCurrentBg):SetShow(true)
        ;
        (((self.channelSelectUIPool)[chIndex]).channelBg):addInputEvent("Mouse_LUp", "")
      end
      if isGameServiceTypeDev() then
        (((self.channelSelectUIPool)[chIndex]).channelSelectedBg):SetShow(false)
        if not tempChannel._isMain or isGameServiceTypeDev() then
          (((self.channelSelectUIPool)[chIndex]).channelName):SetText(channelName .. "(" .. tempWarName .. ")")
        else
          ;
          (((self.channelSelectUIPool)[chIndex]).channelName):SetText(channelName)
        end
        ;
        (((self.channelSelectUIPool)[chIndex]).channelStatus):SetText(tempStr)
        local basePosX = (((self.channelSelectUIPool)[chIndex]).channelName):GetPosX() + (((self.channelSelectUIPool)[chIndex]).channelName):GetTextSizeX() + 20
        if (((self.channelSelectUIPool)[chIndex]).channelWaricon):GetShow() then
          (((self.channelSelectUIPool)[chIndex]).channelWaricon):SetPosX(basePosX)
          basePosX = basePosX + (((self.channelSelectUIPool)[chIndex]).channelWaricon):GetSizeX() + 5
        end
        if (((self.channelSelectUIPool)[chIndex]).channelnoEnterIcon):GetShow() then
          (((self.channelSelectUIPool)[chIndex]).channelnoEnterIcon):SetPosX(basePosX)
          basePosX = basePosX + (((self.channelSelectUIPool)[chIndex]).channelnoEnterIcon):GetSizeX() + 5
        end
        if (((self.channelSelectUIPool)[chIndex]).channelMaintenanceIcon):GetShow() then
          (((self.channelSelectUIPool)[chIndex]).channelMaintenanceIcon):SetPosX(basePosX)
          basePosX = basePosX + (((self.channelSelectUIPool)[chIndex]).channelMaintenanceIcon):GetSizeX() + 5
        end
        if (((self.channelSelectUIPool)[chIndex]).channelExpIcon):GetShow() then
          (((self.channelSelectUIPool)[chIndex]).channelExpIcon):SetPosX(basePosX)
          basePosX = basePosX + (((self.channelSelectUIPool)[chIndex]).channelExpIcon):GetSizeX() + 5
        end
        if (((self.channelSelectUIPool)[chIndex]).channelPremiumIcon):GetShow() then
          (((self.channelSelectUIPool)[chIndex]).channelPremiumIcon):SetPosX(basePosX)
          basePosX = basePosX + (((self.channelSelectUIPool)[chIndex]).channelPremiumIcon):GetSizeX() + 5
        end
        do
          local channelBgSizeX = (((self.channelSelectUIPool)[chIndex]).channelStatus):GetTextSizeX() + (basePosX) + 50
          channelSizeX = (math.max)(channelSizeX, channelBgSizeX)
          ;
          (((self.channelSelectUIPool)[chIndex]).channelWaricon):addInputEvent("Mouse_On", "ChannelSelect_IconToolTip(" .. 0 .. "," .. chIndex .. ")")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelWaricon):addInputEvent("Mouse_Out", "ChannelSelect_IconToolTip()")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelnoEnterIcon):addInputEvent("Mouse_On", "ChannelSelect_IconToolTip(" .. 1 .. "," .. chIndex .. ")")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelnoEnterIcon):addInputEvent("Mouse_Out", "ChannelSelect_IconToolTip()")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelMaintenanceIcon):addInputEvent("Mouse_On", "ChannelSelect_IconToolTip(" .. 2 .. "," .. chIndex .. ")")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelMaintenanceIcon):addInputEvent("Mouse_Out", "ChannelSelect_IconToolTip()")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelExpIcon):addInputEvent("Mouse_On", "ChannelSelect_IconToolTip(" .. 3 .. "," .. chIndex .. ")")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelExpIcon):addInputEvent("Mouse_Out", "ChannelSelect_IconToolTip()")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelPremiumIcon):addInputEvent("Mouse_On", "ChannelSelect_IconToolTip(" .. 4 .. "," .. chIndex .. ")")
          ;
          (((self.channelSelectUIPool)[chIndex]).channelPremiumIcon):addInputEvent("Mouse_Out", "ChannelSelect_IconToolTip()")
          -- DECOMPILER ERROR at PC671: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC671: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC671: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC671: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  local channelSizeX = (math.max)(channelSizeX, 290)
  for chIndex = 0, channelCount - 1 do
    (((self.channelSelectUIPool)[chIndex]).channelBg):SetSize(channelSizeX, (((self.channelSelectUIPool)[chIndex]).channelBg):GetSizeY())
    ;
    (((self.channelSelectUIPool)[chIndex]).channelCurrentBg):SetSize(channelSizeX, (((self.channelSelectUIPool)[chIndex]).channelCurrentBg):GetSizeY())
    ;
    (((self.channelSelectUIPool)[chIndex]).channelSelectedBg):SetSize(channelSizeX, (((self.channelSelectUIPool)[chIndex]).channelSelectedBg):GetSizeY())
    ;
    (((self.channelSelectUIPool)[chIndex]).channelStatus):ComputePos()
  end
  for index = 0, bgIndex do
    ((self.groupBg)[index]):SetSize(channelSizeX + 10, ((self.groupBg)[bgIndex]):GetSizeY())
    if index > 0 then
      ((self.groupBg)[index]):SetPosX(((self.groupBg)[index - 1]):GetPosX() + ((self.groupBg)[index - 1]):GetSizeX() + 10)
    end
  end
  Panel_ChannelSelect:SetSize(((self.groupBg)[bgIndex]):GetPosX() + ((self.groupBg)[bgIndex]):GetSizeX() + 20, Panel_ChannelSelect:GetSizeY())
  ;
  (self._title):SetSize(Panel_ChannelSelect:GetSizeX() - 4, (self._title):GetSizeY())
  ;
  (self._close_btn):ComputePos()
  ;
  (self._question_btn):ComputePos()
  ;
  (self._question_btn):SetShow(false)
  if not oneTimeChange then
    FGlobal_SeasonTexture_ChannelSelectPanelSizeCahnge(Panel_ChannelSelect:GetSizeX())
    oneTimeChange = true
  end
  Panel_ChannelSelect:deleteConsoleUIGroup(0)
  local group_0 = Panel_ChannelSelect:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  for chIndex = 0, channelCount - 1 do
    group_0:addControl(R22_PC824, 0, 1, 1, ((self.channelSelectUIPool)[chIndex]).channelBg)
  end
end

local tooltipCheck = false
ChannelSelect_IconToolTip = function(iconType, index)
  -- function num : 0_4 , upvalues : tooltipCheck, channelSelect
  if iconType == nil then
    TooltipSimple_Hide()
    tooltipCheck = false
    return 
  end
  tooltipCheck = true
  local control, name = nil, nil
  if iconType == 0 then
    control = ((channelSelect.channelSelectUIPool)[index]).channelWaricon
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CHANNELSELECTE_WARICON")
  else
    if iconType == 1 then
      control = ((channelSelect.channelSelectUIPool)[index]).channelnoEnterIcon
      name = PAGetString(Defines.StringSheet_GAME, "LUA_CHANNELSELECTE_NOENTERANCEICON")
    else
      if iconType == 2 then
        control = ((channelSelect.channelSelectUIPool)[index]).channelMaintenanceIcon
        name = PAGetString(Defines.StringSheet_GAME, "LUA_CHANNELSELECTE_MAINTENANCEICON")
      else
        if iconType == 3 then
          control = ((channelSelect.channelSelectUIPool)[index]).channelExpIcon
          name = PAGetString(Defines.StringSheet_GAME, "LUA_CHANNELSELECTE_EXPEVENTICON")
        else
          if iconType == 4 then
            control = ((channelSelect.channelSelectUIPool)[index]).channelPremiumIcon
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_SEVERSELECT_PCROOMSERVER")
          end
        end
      end
    end
  end
  TooltipSimple_Show(control, name)
end

GameChannelMove_NewbieServerJoinDateToolTip = function(isShow, chIndex)
  -- function num : 0_5 , upvalues : channelSelect, tooltipCheck
  local temporaryWrapper = getTemporaryInformationWrapper()
  local newbieTime = temporaryWrapper:getSpeedServerExpiration()
  local isAdmission = (temporaryWrapper:getMyAdmissionToSpeedServer())
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITSERVERSELECT_NEWBIE_TOOLTIP_TITLE")
  desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXITSERVERSELECT_NEWBIE_TOOLTIP_DESC", "newbieTime", getTimeYearMonthDayHourMinSecByTTime64(newbieTime))
  control = ((channelSelect.channelSelectUIPool)[chIndex]).channelBg
  if isShow == true then
    if isAdmission ~= 0 then
      TooltipSimple_Show(control, name, desc)
    else
      if not tooltipCheck then
        TooltipSimple_Hide()
      end
    end
  else
    if not tooltipCheck then
      TooltipSimple_Hide()
    end
  end
end

HandleClicked_ChannelSelect = function(selectChannel)
  -- function num : 0_6 , upvalues : channelSelect
  do
    if isChannelMoveOnlySafe() then
      local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
      if not (regionInfo:get()):isSafeZone() and ToClient_SelfPlayerIsGM() == false then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITSERVERSELECT_SAFEREGION"))
        return 
      end
    end
    if (getSelfPlayer()):isCompleteTutorial() == false then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoPlayerIsDoingTutorial"))
      return 
    end
    local curChannelData = getCurrentChannelServerData()
    local curWorldData = getGameWorldServerDataByWorldNo(curChannelData._worldNo)
    local channelCount = getGameChannelServerDataCount(curWorldData._worldNo)
    _selectChannel = isSpeedServer[selectChannel]
    local tempChannel = getGameChannelServerDataByWorldNo(curChannelData._worldNo, _selectChannel)
    local channelName = getChannelName(tempChannel._worldNo, tempChannel._serverNo)
    local changeChannelTime = getChannelMoveableRemainTime(curChannelData._worldNo)
    local changeRealChannelTime = convertStringFromDatetime(changeChannelTime)
    _PA_LOG("�\128규보", "테스�\184 : " .. tostring(changeChannelTime))
    local isSiegeBeing = deadMessage_isSiegeBeingMyChannel()
    local isInSiegeBattle = deadMessage_isInSiegeBattle()
    if isSiegeBeing == true and isInSiegeBattle == false then
      local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_MSG", "channelName", tostring(channelName))
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), content = messageBoxMemo, functionYes = moveChannelMsg, functionNo = ChannelSelect_Update, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    else
      do
        if toInt64(0, 0) < changeChannelTime then
          local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANGECHANNEL_PENALTY", "changeRealChannelTime", changeRealChannelTime)
          local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), content = messageBoxMemo, functionYes = ChannelSelect_Update, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageBoxData)
        else
          do
            local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_MSG", "channelName", tostring(channelName))
            do
              local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), content = messageBoxMemo, functionYes = moveChannelMsg, functionNo = ChannelSelect_Update, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
              ;
              (MessageBox.showMessageBox)(messageBoxData)
              ;
              (((channelSelect.channelSelectUIPool)[selectChannel]).channelSelectedBg):SetShow(true)
            end
          end
        end
      end
    end
  end
end

moveChannelMsg = function()
  -- function num : 0_7
  FGlobal_gameExit_saveCurrentData()
  gameExit_MoveChannel(_selectChannel)
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELWAIT_MSG")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), content = messageBoxMemo, functionYes = nil, functionClose = nil, exitButton = true, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

EventUpdateServerInformation_Exit = function()
  -- function num : 0_8 , upvalues : channelSelect
  local isShow = Panel_ChannelSelect:IsShow()
  if isShow == false then
    return 
  end
  local curChannelData = getCurrentChannelServerData()
  if curChannelData == nil then
    return 
  end
  local curWorldData = getGameWorldServerDataByWorldNo(curChannelData._worldNo)
  local channelCount = getGameChannelServerDataCount(curWorldData._worldNo)
  local restrictedServerNo = curWorldData._restrictedServerNo
  local curServerNo = curChannelData._serverNo
  local channelMoveableGlobalTime = getChannelMoveableTime()
  local channelMoveableRemainTime = converStringFromLeftDateTime(channelMoveableGlobalTime)
  for chIndex = 0, channelCount - 1 do
    local tempChannel = getGameChannelServerDataByWorldNo(curChannelData._worldNo, chIndex)
    if tempChannel == nil then
      return 
    end
    local isAdmission = true
    if restrictedServerNo ~= 0 and toInt64(0, 0) ~= channelMoveableGlobalTime then
      if restrictedServerNo == tempChannel._serverNo then
        isAdmission = true
      else
        if channelMoveableRemainTime > 0 then
          isAdmission = true
        else
          isAdmission = false
        end
      end
    end
    local channelName = getChannelName(tempChannel._worldNo, tempChannel._serverNo)
    if channelName == nil then
      channelName = ""
    end
    if curChannelData._worldNo == tempChannel._worldNo and curChannelData._serverNo == tempChannel._serverNo then
      channelName = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELNAME_CURRENT") .. channelName
    end
    if not tempChannel._isMain or not isAdmission then
      channelName = channelName .. PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELNAME_LIMIT")
    end
    ;
    (((channelSelect.channelSelectUIPool)[chIndex]).channelName):SetText(channelName)
    ;
    (((channelSelect.channelSelectUIPool)[chIndex]).channelBg):addInputEvent("Mouse_LUp", "HandleClicked_ChannelSelect( " .. chIndex .. " )")
  end
end

FGlobal_ChannelSelect_Show = function()
  -- function num : 0_9
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHANNELCHANGEOPENALERT_INDEAD"))
    return 
  end
  Panel_ChannelSelect:SetShow(true, true)
  ChannelSelect_Update()
  Panel_ChannelSelect:ComputePos()
end

FGlobal_ChannelSelect_Hide = function()
  -- function num : 0_10
  Panel_ChannelSelect:SetShow(false, true)
end

ChannelSelect_onScreenResize = function()
  -- function num : 0_11 , upvalues : channelSelect
  local self = channelSelect
  ;
  (self._BlockBG):SetSize(getScreenSizeX() + 200, getScreenSizeY() + 200)
  ;
  (self._BlockBG):SetHorizonCenter()
  ;
  (self._BlockBG):SetVerticalMiddle()
  Panel_ChannelSelect:ComputePos()
end

ChannelSelect_EventHandler = function()
  -- function num : 0_12 , upvalues : channelSelect
  local self = channelSelect
  ;
  (self._close_btn):addInputEvent("Mouse_LUp", "FGlobal_ChannelSelect_Hide()")
end

ChannelSelect_RegisterEventHandler = function()
  -- function num : 0_13
  registerEvent("onScreenResize", "ChannelSelect_onScreenResize")
end

ChannelSelect_Init()
ChannelSelect_EventHandler()

