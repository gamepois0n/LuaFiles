-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\frame_guild_list.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_Class = CppEnums.ClassType
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local _constGuildListMaxCount = 150
local _startMemberIndex = 0
local _constStartY = 5
local _constStartButtonX = 8
local _constStartButtonY = 5
local _constStartButtonGapY = 30
local _constCollectionX = 120
local _constCollectionY = 80
local _selectIndex = 0
local _onlineGuildMember = 0
local _initMoney = false
local _UI_Menu_Button = {Type_Deportation = 0, Type_AppointCommander = 1, Type_CancelAppoint = 2, Type_ChangeMaster = 3, Type_ProtectMember = 4, Type_CancelProtectMember = 5, Type_PartyInvite = 6, Type_Supply = 7, Type_Count = 8}
local numberKeyCode = {VCK.KeyCode_0, VCK.KeyCode_1, VCK.KeyCode_2, VCK.KeyCode_3, VCK.KeyCode_4, VCK.KeyCode_5, VCK.KeyCode_6, VCK.KeyCode_7, VCK.KeyCode_8, VCK.KeyCode_9, VCK.KeyCode_NUMPAD0, VCK.KeyCode_NUMPAD1, VCK.KeyCode_NUMPAD2, VCK.KeyCode_NUMPAD3, VCK.KeyCode_NUMPAD4, VCK.KeyCode_NUMPAD5, VCK.KeyCode_NUMPAD6, VCK.KeyCode_NUMPAD7, VCK.KeyCode_NUMPAD8, VCK.KeyCode_NUMPAD9}
local inputGuildDepositNum_s64 = toInt64(0, 0)
local inputGuildDepositMaxNum_s64 = toInt64(0, 0)
local notice_title = (UI.getChildControl)(Panel_Window_Guild, "StaticText_NoticeTitle")
local isVoiceOpen = ToClient_IsContentsGroupOpen("75")
GuildListInfoPage = {_scrollBar, _btnGiveIncentive, _btnDeposit, _btnPaypal, _btnWelfare, decoIcon_Guild, decoIcon_Clan, _frameGuildList, _contentGuildList, _onlineCount; _frameDefaultBG = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_ListBG"), _buttonListBG = (UI.getChildControl)(Panel_Guild_List, "Static_FunctionBG"), 
_list = {}
, 
_buttonList = {}
}
local tempGuildList = {}
local tempGuildUserNolist = {}
Panel_GuildIncentive:SetShow(false)
local incentive_InputMoney = (UI.getChildControl)(Panel_GuildIncentive, "Edit_InputIncentiveValue")
local btn_incentive_Send = (UI.getChildControl)(Panel_GuildIncentive, "Button_Confirm")
local btn_incentive_Cancle = (UI.getChildControl)(Panel_GuildIncentive, "Button_Cancle")
local btn_incentive_Help = (UI.getChildControl)(Panel_GuildIncentive, "Button_Question")
incentive_InputMoney:SetNumberMode(true)
local txt_incentive_Title = (UI.getChildControl)(Panel_GuildIncentive, "StaticText_Title")
local txt_incentive_Deposit = (UI.getChildControl)(Panel_GuildIncentive, "StaticText_Incentive")
local txt_incentive_Notify = (UI.getChildControl)(Panel_GuildIncentive, "StaticText_Notify")
txt_incentive_Notify:SetTextMode(UI_TM.eTextMode_AutoWrap)
incentive_InputMoney:addInputEvent("Mouse_LUp", "HandleClicked_SetIncentive()")
btn_incentive_Send:addInputEvent("Mouse_LUp", "HandleClicked_GuildIncentive_Send()")
btn_incentive_Cancle:addInputEvent("Mouse_LUp", "HandleClicked_GuildIncentive_Close()")
btn_incentive_Help:addInputEvent("Mouse_LUp", "")
incentive_InputMoney:RegistReturnKeyEvent("FGlobal_SaveGuildMoney_Send()")
local btn_GuildMasterMandateBG = (UI.getChildControl)(Panel_Window_Guild, "Static_GuildMandateBG")
local btn_GuildMasterMandate = (UI.getChildControl)(Panel_Window_Guild, "Button_GuildMandate")
local frameSizeY = 0
local contentSizeY = 0
local staticText_Grade = (UI.getChildControl)(Panel_Guild_List, "StaticText_M_Grade")
local staticText_Level = (UI.getChildControl)(Panel_Guild_List, "StaticText_M_Level")
local staticText_Class = (UI.getChildControl)(Panel_Guild_List, "StaticText_M_Class")
local staticText_activity = (UI.getChildControl)(Panel_Guild_List, "StaticText_M_Activity")
local staticText_contributedTendency = (UI.getChildControl)(Panel_Guild_List, "StaticText_M_ContributedTendency")
local staticText_contract = (UI.getChildControl)(Panel_Guild_List, "StaticText_M_Contract")
local staticText_charName = (UI.getChildControl)(Panel_Guild_List, "StaticText_M_CharName")
local staticText_Voice = (UI.getChildControl)(Panel_Guild_List, "StaticText_M_Voice")
local listening_Volume = (UI.getChildControl)(Panel_Guild_List, "Static_Listening_VolumeBG")
local listening_VolumeSlider = (UI.getChildControl)(listening_Volume, "Slider_ListeningVolume")
local listening_VolumeSliderBtn = (UI.getChildControl)(listening_VolumeSlider, "Slider_MicVol_Button")
local listening_VolumeClose = (UI.getChildControl)(listening_Volume, "Button_VolumeSetClose")
local listening_VolumeButton = (UI.getChildControl)(listening_Volume, "Checkbox_SpeakerIcon")
local listening_VolumeValue = (UI.getChildControl)(listening_Volume, "StaticText_SpeakerVolumeValue")
local _incentivePanelType = 0
local _selectSortType = -1
local _listSort = {grade = false, level = false, class = false, name = false, ap = false, expiration = false, wp = false, kp = false}
staticText_Grade:addInputEvent("Mouse_LUp", "HandleClicked_GuildListSort( " .. 0 .. " )")
staticText_Level:addInputEvent("Mouse_LUp", "HandleClicked_GuildListSort( " .. 1 .. " )")
staticText_Class:addInputEvent("Mouse_LUp", "HandleClicked_GuildListSort( " .. 2 .. " )")
staticText_charName:addInputEvent("Mouse_LUp", "HandleClicked_GuildListSort( " .. 3 .. " )")
staticText_activity:addInputEvent("Mouse_LUp", "HandleClicked_GuildListSort( " .. 4 .. " )")
staticText_contract:addInputEvent("Mouse_LUp", "HandleClicked_GuildListSort( " .. 5 .. " )")
staticText_contributedTendency:addInputEvent("Mouse_LUp", "HandleClicked_GuildListSort( " .. 6 .. " )")
staticText_activity:addInputEvent("Mouse_On", "_guildListInfoPage_titleTooltipShow( true,\t\t" .. 0 .. " )")
staticText_activity:addInputEvent("Mouse_Out", "_guildListInfoPage_titleTooltipShow( false,\t" .. 0 .. " )")
staticText_activity:setTooltipEventRegistFunc("_guildListInfoPage_titleTooltipShow( true,\t\t" .. 0 .. " )")
staticText_contract:addInputEvent("Mouse_On", "_guildListInfoPage_titleTooltipShow( true,\t\t" .. 2 .. " )")
staticText_contract:addInputEvent("Mouse_Out", "_guildListInfoPage_titleTooltipShow( false,\t" .. 2 .. " )")
staticText_contract:setTooltipEventRegistFunc("_guildListInfoPage_titleTooltipShow( true,\t\t" .. 2 .. " )")
staticText_contributedTendency:addInputEvent("Mouse_On", "_guildListInfoPage_titleTooltipShow( true,\t\t" .. 3 .. " )")
staticText_contributedTendency:addInputEvent("Mouse_Out", "_guildListInfoPage_titleTooltipShow( false,\t" .. 3 .. " )")
staticText_contributedTendency:setTooltipEventRegistFunc("_guildListInfoPage_titleTooltipShow( true,\t\t" .. 3 .. " )")
staticText_Voice:SetShow(false)
listening_Volume:SetShow(false)
staticText_contributedTendency:SetSpanSize(535, 50)
if isVoiceOpen == true then
  listening_VolumeClose:addInputEvent("Mouse_LUp", "HandleOnOut_GuildMemberList_VolumeClose()")
  listening_VolumeButton:addInputEvent("Mouse_LUp", "HandleClicked_VoiceChatListening()")
  listening_VolumeSlider:addInputEvent("Mouse_LUp", "HandleClicked_VoiceChatListeningVolume()")
  listening_VolumeSliderBtn:addInputEvent("Mouse_LPress", "HandleClicked_VoiceChatListeningVolume()")
  staticText_Voice:SetShow(true)
  staticText_Voice:addInputEvent("Mouse_On", "_guildListInfoPage_titleTooltipShow( true,\t\t" .. 4 .. " )")
  staticText_Voice:addInputEvent("Mouse_Out", "_guildListInfoPage_titleTooltipShow( false,\t" .. 4 .. " )")
  staticText_Voice:setTooltipEventRegistFunc("_guildListInfoPage_titleTooltipShow( true,\t\t" .. 4 .. " )")
  staticText_contributedTendency:SetSpanSize(495, 50)
end
local setVol_selectedMemberIdx = 0
local setVol_selectedMemberVol = 0
local text_contributedTendency = staticText_contributedTendency:GetText()
_guildListInfoPage_titleTooltipShow = function(isShow, titleType)
  -- function num : 0_0 , upvalues : staticText_activity, staticText_contributedTendency, staticText_contract, staticText_Voice
  local control = nil
  local name = ""
  local desc = ""
  if titleType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_ACTIVITY_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_ACTIVITY_CONTENTS")
    control = staticText_activity
  else
    if titleType == 1 then
      control = staticText_contributedTendency
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_CONTRIBUTEDTENDENCY_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_CONTRIBUTEDTENDENCY_CONTENTS")
    else
      if titleType == 2 then
        control = staticText_contract
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_CONTRACT_TITLE")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_CONTRACT_CONTENTS")
      else
        if titleType == 3 then
          control = staticText_contributedTendency
          name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_CONTRIBUTEDTENDENCY_TOOLTIP_TITLE")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_CONTRIBUTEDTENDENCY_TOOLTIP_DESC")
        else
          if titleType == 4 then
            control = staticText_Voice
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_VOICECHAT_TOOLTIP_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_VOICECHAT_TOOLTIP_DESC")
          end
        end
      end
    end
  end
  if isShow == true then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

_guildListInfoPage_MandateTooltipShow = function(isShow, titleType, controlIdx)
  -- function num : 0_1 , upvalues : tempGuildList
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local dataIdx = (tempGuildList[controlIdx + 1]).idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local channelName = getChannelName(worldNo, myGuildMemberInfo:getServerNo())
  local memberChannel = ""
  if myGuildMemberInfo:isOnline() then
    lastLogin = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ONLINE_MEMBER")
    memberChannel = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_CHANNEL_MEMBER", "channelName", channelName)
  else
    lastLogin = GuildLogoutTimeConvert(myGuildMemberInfo:getElapsedTimeAfterLogOut_s64())
    memberChannel = ""
  end
  if titleType == 0 then
    control = ((GuildListInfoPage._list)[controlIdx])._contractBtn
    name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_CONTRACT_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_TOOLTIP_TITLETYPE5_DESC") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_LIST_TOOLTIP_LASTLOGOUT", "lastLogin", lastLogin) .. memberChannel
  else
    if titleType == 1 then
      control = ((GuildListInfoPage._list)[controlIdx])._contractBtn
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_CONTRACT_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_TOOLTIP_TITLETYPE3_DESC") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_LIST_TOOLTIP_LASTLOGOUT", "lastLogin", lastLogin) .. memberChannel
    else
      if titleType == 2 then
        control = ((GuildListInfoPage._list)[controlIdx])._contractBtn
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_CONTRACT_TITLE")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_TOOLTIP_TITLETYPE4_DESC") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_LIST_TOOLTIP_LASTLOGOUT", "lastLogin", lastLogin) .. memberChannel
      end
    end
  end
  if isShow == true then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

GuildLogoutTimeConvert = function(s64_datetime)
  -- function num : 0_2
  local s64_dayCycle = toInt64(0, 86400)
  local s64_hourCycle = toInt64(0, 3600)
  local s64_day = s64_datetime / s64_dayCycle
  local s64_hour = (s64_datetime - s64_dayCycle * s64_day) / s64_hourCycle
  local strDate = ""
  if (Defines.s64_const).s64_0 < s64_day then
    strDate = tostring(s64_day) .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY")
  else
    if (Defines.s64_const).s64_0 < s64_hour then
      strDate = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY_IN")
    else
      strDate = PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_DAY_IN")
    end
  end
  return strDate
end

-- DECOMPILER ERROR at PC453: Confused about usage of register: R56 in 'UnsetPending'

GuildListInfoPage.initialize = function(self)
  -- function num : 0_3 , upvalues : UCT, _constStartY, isVoiceOpen, _constStartButtonX, _constGuildListMaxCount, _UI_Menu_Button, staticText_Grade, staticText_Level, staticText_Class, staticText_charName, staticText_activity, staticText_contract, frameSizeY
  self._frameGuildList = (UI.getChildControl)(Panel_Guild_List, "Frame_GuildList")
  self._contentGuildList = (UI.getChildControl)(self._frameGuildList, "Frame_1_Content")
  local _copyGrade = (UI.getChildControl)(self._contentGuildList, "StaticText_C_Grade")
  local _copyLevel = (UI.getChildControl)(self._contentGuildList, "StaticText_C_Level")
  local _copyClass = (UI.getChildControl)(self._contentGuildList, "StaticText_C_Class")
  local _copyCharName = (UI.getChildControl)(self._contentGuildList, "StaticText_C_CharName")
  local _copyContributedTendency = (UI.getChildControl)(self._contentGuildList, "StaticText_C_ContributedTendency")
  local _copySaying = (UI.getChildControl)(self._contentGuildList, "StaticText_C_Voice_Saying")
  local _copyListening = (UI.getChildControl)(self._contentGuildList, "StaticText_C_Voice_Listening")
  local _copyActivity = (UI.getChildControl)(self._contentGuildList, "StaticText_C_Activity")
  local _copyPartLine = (UI.getChildControl)(self._contentGuildList, "Static_C_PartLine")
  local _copyContractButton = (UI.getChildControl)(self._contentGuildList, "Button_C_Contract")
  local _copyGuardHim = (UI.getChildControl)(self._contentGuildList, "Static_C_GuardHim")
  local _copyButton = (UI.getChildControl)(Panel_Guild_List, "Button_Function")
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R13 in 'UnsetPending'

  GuildListInfoPage._textBusinessFundsBG = (UI.getChildControl)(Panel_Guild_List, "StaticText_GuildMoney")
  -- DECOMPILER ERROR at PC85: Confused about usage of register: R13 in 'UnsetPending'

  GuildListInfoPage._btnGiveIncentive = (UI.getChildControl)(Panel_Guild_List, "Button_Incentive")
  -- DECOMPILER ERROR at PC92: Confused about usage of register: R13 in 'UnsetPending'

  GuildListInfoPage._btnDeposit = (UI.getChildControl)(Panel_Guild_List, "Button_Deposit")
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R13 in 'UnsetPending'

  GuildListInfoPage._btnPaypal = (UI.getChildControl)(Panel_Guild_List, "Button_Paypal")
  -- DECOMPILER ERROR at PC106: Confused about usage of register: R13 in 'UnsetPending'

  GuildListInfoPage._btnWelfare = (UI.getChildControl)(Panel_Guild_List, "Button_Welfare")
  -- DECOMPILER ERROR at PC113: Confused about usage of register: R13 in 'UnsetPending'

  GuildListInfoPage.decoIcon_Guild = (UI.getChildControl)(self._contentGuildList, "Static_DecoIcon_Guild")
  -- DECOMPILER ERROR at PC120: Confused about usage of register: R13 in 'UnsetPending'

  GuildListInfoPage.decoIcon_Clan = (UI.getChildControl)(self._contentGuildList, "Static_DecoIcon_Clan")
  ;
  (GuildListInfoPage._btnGiveIncentive):addInputEvent("Mouse_LUp", "HandleCLicked_IncentiveOption()")
  ;
  (GuildListInfoPage._btnDeposit):addInputEvent("Mouse_LUp", "HandleCLicked_GuildListIncentive_Deposit()")
  ;
  (GuildListInfoPage._btnPaypal):addInputEvent("Mouse_LUp", "HandleCLicked_GuildListIncentive_Paypal()")
  ;
  (GuildListInfoPage._btnWelfare):addInputEvent("Mouse_LUp", "HandleClicked_GuildListWelfare_Request()")
  self._scrollBar = (UI.getChildControl)(self._frameGuildList, "VerticalScroll")
  ;
  (UIScroll.InputEvent)(self._scrollBar, "GuildListMouseScrollEvent")
  ;
  (self._contentGuildList):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
  ;
  (self._contentGuildList):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
  createListInfo = function(pIndex)
    -- function num : 0_3_0 , upvalues : UCT, self, _copyGrade, _copyLevel, _copyClass, _copyCharName, _copyContributedTendency, _copyActivity, _copyPartLine, _copyContractButton, _copyGuardHim, _constStartY, isVoiceOpen, _copySaying, _copyListening
    local rtGuildListInfo = {}
    rtGuildListInfo._grade = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self._contentGuildList, "StaticText_Grade_" .. pIndex)
    rtGuildListInfo._level = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self._contentGuildList, "StaticText_Level_" .. pIndex)
    rtGuildListInfo._class = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self._contentGuildList, "StaticText_Class_" .. pIndex)
    rtGuildListInfo._charName = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self._contentGuildList, "StaticText_CharName_" .. pIndex)
    rtGuildListInfo._contributedTendency = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self._contentGuildList, "StaticText_ContributedTendency_" .. pIndex)
    rtGuildListInfo._activity = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, self._contentGuildList, "StaticText_Activity_" .. pIndex)
    rtGuildListInfo._partLine = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self._contentGuildList, "Static_C_PartLine_" .. pIndex)
    rtGuildListInfo._contractBtn = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, self._contentGuildList, "Button_C_Contract_" .. pIndex)
    rtGuildListInfo._guardHim = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, self._contentGuildList, "Static_C_GuardHim_" .. pIndex)
    CopyBaseProperty(_copyGrade, rtGuildListInfo._grade)
    CopyBaseProperty(_copyLevel, rtGuildListInfo._level)
    CopyBaseProperty(_copyClass, rtGuildListInfo._class)
    CopyBaseProperty(_copyCharName, rtGuildListInfo._charName)
    CopyBaseProperty(_copyContributedTendency, rtGuildListInfo._contributedTendency)
    CopyBaseProperty(_copyActivity, rtGuildListInfo._activity)
    CopyBaseProperty(_copyPartLine, rtGuildListInfo._partLine)
    CopyBaseProperty(_copyContractButton, rtGuildListInfo._contractBtn)
    CopyBaseProperty(_copyGuardHim, rtGuildListInfo._guardHim)
    ;
    (rtGuildListInfo._grade):SetPosY(_constStartY + pIndex * 30)
    ;
    (rtGuildListInfo._level):SetPosY(_constStartY + pIndex * 30)
    ;
    (rtGuildListInfo._class):SetPosY(_constStartY + pIndex * 30)
    ;
    (rtGuildListInfo._charName):SetPosY(_constStartY + pIndex * 30)
    ;
    (rtGuildListInfo._contributedTendency):SetPosY(_constStartY + pIndex * 30)
    ;
    (rtGuildListInfo._activity):SetPosY(_constStartY + pIndex * 30)
    ;
    (rtGuildListInfo._partLine):SetPosY(pIndex * 30)
    ;
    (rtGuildListInfo._contractBtn):SetPosY(pIndex * 30 + 6)
    ;
    (rtGuildListInfo._guardHim):SetPosY(pIndex * 30 + 8)
    ;
    (rtGuildListInfo._guardHim):SetPosX((rtGuildListInfo._grade):GetTextSizeX() + 20)
    ;
    (rtGuildListInfo._contributedTendency):SetPosX(520)
    ;
    (rtGuildListInfo._grade):SetIgnore(false)
    ;
    (rtGuildListInfo._level):SetIgnore(false)
    ;
    (rtGuildListInfo._class):SetIgnore(false)
    ;
    (rtGuildListInfo._charName):SetIgnore(false)
    ;
    (rtGuildListInfo._contributedTendency):SetIgnore(false)
    ;
    (rtGuildListInfo._activity):SetIgnore(false)
    ;
    (rtGuildListInfo._partLine):SetIgnore(false)
    ;
    (rtGuildListInfo._charName):addInputEvent("Mouse_LUp", "HandleClickedGuildMemberMenuButton(" .. pIndex .. ")")
    ;
    (rtGuildListInfo._charName):addInputEvent("Mouse_On", "HandleToolTipChannelName( true,\t" .. pIndex .. ")")
    ;
    (rtGuildListInfo._charName):addInputEvent("Mouse_Out", "HandleToolTipChannelName( false,\t" .. pIndex .. ")")
    ;
    (rtGuildListInfo._charName):addInputEvent("Mouse_LUp", "HandleToolTipChannelName( true, " .. pIndex .. " )")
    ;
    (rtGuildListInfo._contractBtn):addInputEvent("Mouse_LUp", "HandleClickedGuildMemberContractButton(" .. pIndex .. ")")
    ;
    (rtGuildListInfo._grade):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
    ;
    (rtGuildListInfo._level):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
    ;
    (rtGuildListInfo._class):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
    ;
    (rtGuildListInfo._charName):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
    ;
    (rtGuildListInfo._contributedTendency):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
    ;
    (rtGuildListInfo._activity):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
    ;
    (rtGuildListInfo._partLine):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
    ;
    (rtGuildListInfo._contractBtn):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
    ;
    (rtGuildListInfo._guardHim):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
    ;
    (rtGuildListInfo._grade):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
    ;
    (rtGuildListInfo._level):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
    ;
    (rtGuildListInfo._class):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
    ;
    (rtGuildListInfo._charName):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
    ;
    (rtGuildListInfo._contributedTendency):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
    ;
    (rtGuildListInfo._activity):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
    ;
    (rtGuildListInfo._partLine):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
    ;
    (rtGuildListInfo._contractBtn):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
    ;
    (rtGuildListInfo._guardHim):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(false)")
    if isVoiceOpen == true then
      rtGuildListInfo._saying = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, self._contentGuildList, "StaticText_Saying_" .. pIndex)
      rtGuildListInfo._listening = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, self._contentGuildList, "StaticText_Listening_" .. pIndex)
      CopyBaseProperty(_copySaying, rtGuildListInfo._saying)
      CopyBaseProperty(_copyListening, rtGuildListInfo._listening)
      ;
      (rtGuildListInfo._saying):SetPosY(_constStartY + pIndex * 30)
      ;
      (rtGuildListInfo._listening):SetPosY(_constStartY + pIndex * 30)
      ;
      (rtGuildListInfo._saying):SetIgnore(false)
      ;
      (rtGuildListInfo._listening):SetIgnore(false)
      ;
      (rtGuildListInfo._saying):SetAutoDisableTime(2)
      ;
      (rtGuildListInfo._saying):DoAutoDisableTime()
      ;
      (rtGuildListInfo._listening):SetAutoDisableTime(2)
      ;
      (rtGuildListInfo._listening):DoAutoDisableTime()
      ;
      (rtGuildListInfo._saying):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
      ;
      (rtGuildListInfo._listening):addInputEvent("Mouse_DownScroll", "GuildListMouseScrollEvent(false)")
      ;
      (rtGuildListInfo._saying):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
      ;
      (rtGuildListInfo._listening):addInputEvent("Mouse_UpScroll", "GuildListMouseScrollEvent(true)")
      ;
      (rtGuildListInfo._saying):addInputEvent("Mouse_LUp", "HandleClickedVoiceChatSaying(" .. pIndex .. ")")
      ;
      (rtGuildListInfo._saying):addInputEvent("Mouse_On", "HandleToolTipVoiceIcon( true,\t" .. pIndex .. "," .. 0 .. ")")
      ;
      (rtGuildListInfo._saying):addInputEvent("Mouse_Out", "HandleToolTipVoiceIcon( false,\t" .. pIndex .. "," .. 0 .. ")")
      ;
      (rtGuildListInfo._saying):setTooltipEventRegistFunc("HandleToolTipVoiceIcon( true,\t" .. pIndex .. "," .. 0 .. ")")
      ;
      (rtGuildListInfo._listening):addInputEvent("Mouse_LUp", "HandleClick_GuildMemberList_Listening(" .. pIndex .. ")")
      ;
      (rtGuildListInfo._listening):addInputEvent("Mouse_On", "HandleToolTipVoiceIcon( true,\t" .. pIndex .. "," .. 1 .. ")")
      ;
      (rtGuildListInfo._listening):addInputEvent("Mouse_Out", "HandleToolTipVoiceIcon( false,\t" .. pIndex .. "," .. 1 .. ")")
      ;
      (rtGuildListInfo._listening):setTooltipEventRegistFunc("HandleToolTipVoiceIcon( true,\t" .. pIndex .. "," .. 1 .. ")")
    end
    rtGuildListInfo.SetShow = function(self, isShow)
      -- function num : 0_3_0_0 , upvalues : rtGuildListInfo, isVoiceOpen
      (rtGuildListInfo._grade):SetShow(isShow)
      ;
      (rtGuildListInfo._level):SetShow(isShow)
      ;
      (rtGuildListInfo._class):SetShow(isShow)
      ;
      (rtGuildListInfo._charName):SetShow(isShow)
      ;
      (rtGuildListInfo._contributedTendency):SetShow(isShow)
      if isVoiceOpen == true then
        (rtGuildListInfo._saying):SetShow(isShow)
        ;
        (rtGuildListInfo._listening):SetShow(isShow)
      end
      ;
      (rtGuildListInfo._activity):SetShow(isShow)
      ;
      (rtGuildListInfo._partLine):SetShow(isShow)
      ;
      (rtGuildListInfo._contractBtn):SetShow(isShow)
      ;
      (rtGuildListInfo._guardHim):SetShow(isShow)
    end

    rtGuildListInfo.SetIgnore = function(self, isIgnore)
      -- function num : 0_3_0_1 , upvalues : rtGuildListInfo, isVoiceOpen
      (rtGuildListInfo._grade):SetIgnore(isIgnore)
      ;
      (rtGuildListInfo._level):SetIgnore(isIgnore)
      ;
      (rtGuildListInfo._class):SetIgnore(isIgnore)
      ;
      (rtGuildListInfo._charName):SetIgnore(isIgnore)
      ;
      (rtGuildListInfo._contributedTendency):SetIgnore(isIgnore)
      if isVoiceOpen == true then
        (rtGuildListInfo._saying):SetIgnore(isIgnore)
        ;
        (rtGuildListInfo._listening):SetIgnore(isIgnore)
      end
      ;
      (rtGuildListInfo._activity):SetIgnore(isIgnore)
      ;
      (rtGuildListInfo._partLine):SetIgnore(isIgnore)
      ;
      (rtGuildListInfo._guardHim):SetIgnore(isIgnore)
    end

    return rtGuildListInfo
  end

  createListInfoButton = function(pIndex)
    -- function num : 0_3_1 , upvalues : UCT, self, _copyButton, _constStartButtonX
    local rtGuildListInfoButton = {}
    local rtGuildListInfoButton = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, self._buttonListBG, "Guild_Menu_Button_" .. pIndex)
    CopyBaseProperty(_copyButton, rtGuildListInfoButton)
    rtGuildListInfoButton:SetText(PAGetString(Defines.StringSheet_GAME, "GULD_BUTTON" .. tostring(pIndex)))
    rtGuildListInfoButton:SetPosX(_constStartButtonX)
    rtGuildListInfoButton:SetShow(true)
    rtGuildListInfoButton:addInputEvent("Mouse_LUp", "HandleClickedGuildMenuButton(" .. pIndex .. ")")
    return rtGuildListInfoButton
  end

  ;
  (self._buttonListBG):addInputEvent("Mouse_Out", "MouseOutGuildMenuButton()")
  for index = 0, _constGuildListMaxCount - 1 do
    -- DECOMPILER ERROR at PC203: Confused about usage of register: R17 in 'UnsetPending'

    (self._list)[index] = createListInfo(index)
  end
  for index = 0, _UI_Menu_Button.Type_Count - 1 do
    -- DECOMPILER ERROR at PC215: Confused about usage of register: R17 in 'UnsetPending'

    (self._buttonList)[index] = createListInfoButton(index)
    ;
    ((self._buttonList)[index]):addInputEvent("Mouse_Out", "MouseOutGuildMenuButton()")
  end
  Panel_Guild_List:SetChildIndex(staticText_Grade, 9999)
  Panel_Guild_List:SetChildIndex(staticText_Level, 9999)
  Panel_Guild_List:SetChildIndex(staticText_Class, 9999)
  Panel_Guild_List:SetChildIndex(staticText_charName, 9999)
  Panel_Guild_List:SetChildIndex(staticText_activity, 9999)
  Panel_Guild_List:SetChildIndex(staticText_contract, 9999)
  ;
  ((GuildListInfoPage._buttonList)[0]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_1"))
  ;
  ((GuildListInfoPage._buttonList)[1]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_2"))
  ;
  ((GuildListInfoPage._buttonList)[2]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_3"))
  ;
  ((GuildListInfoPage._buttonList)[3]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_0"))
  ;
  ((GuildListInfoPage._buttonList)[4]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_4"))
  ;
  ((GuildListInfoPage._buttonList)[5]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_5"))
  ;
  ((GuildListInfoPage._buttonList)[6]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_BUTTONLIST_TEXT_6"))
  ;
  (UI.deleteControl)(_copyGrade)
  ;
  (UI.deleteControl)(_copyLevel)
  ;
  (UI.deleteControl)(_copyClass)
  ;
  (UI.deleteControl)(_copyCharName)
  ;
  (UI.deleteControl)(_copyContributedTendency)
  ;
  (UI.deleteControl)(_copySaying)
  ;
  (UI.deleteControl)(_copyListening)
  ;
  (UI.deleteControl)(_copyActivity)
  ;
  (UI.deleteControl)(_copyPartLine)
  ;
  (UI.deleteControl)(_copyContractButton)
  ;
  (UI.deleteControl)(_copyButton)
  ;
  (UI.deleteControl)(_copyGuardHim)
  _copyGrade, _copyLevel, _copyClass, _copyCharName, _copyContributedTendency, _copySaying, _copyListening = nil
  _copyPartLine, _copyContractButton = nil
  _copyButton = nil
  _copyGuardHim = nil
  frameSizeY = (self._frameGuildList):GetSizeY()
  ;
  (self._frameGuildList):UpdateContentScroll()
  ;
  (self._frameGuildList):UpdateContentPos()
  ;
  (self._frameDefaultBG):MoveChilds((self._frameDefaultBG):GetID(), Panel_Guild_List)
  ;
  (UI.deletePanel)(Panel_Guild_List:GetID())
  Panel_Guild_List = nil
end

HandleClickedGuildMemberMenuButton = function(index)
  -- function num : 0_4 , upvalues : tempGuildList, _constCollectionY, _UI_Menu_Button, _constStartButtonY, _constStartButtonGapY, _selectIndex
  local self = GuildListInfoPage
  local dataIdx = (tempGuildList[index + 1]).idx
  local guildMember = (ToClient_GetMyGuildInfoWrapper()):getMember(dataIdx)
  local grade = guildMember:getGrade()
  local isProtect = guildMember:isProtectable()
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  local isSupplyOfficer = ((getSelfPlayer()):get()):isGuildSupplyOfficer()
  local buttonListBgX = (((self._list)[index])._charName):GetParentPosX() - Panel_Window_Guild:GetPosX()
  local buttonListBgY = (((self._list)[index])._charName):GetParentPosY() - Panel_Window_Guild:GetPosY() - _constCollectionY
  ;
  (GuildListInfoPage._buttonListBG):SetPosX(buttonListBgX)
  ;
  (GuildListInfoPage._buttonListBG):SetPosY(buttonListBgY)
  for dataIdx = 0, _UI_Menu_Button.Type_Count - 1 do
    ((GuildListInfoPage._buttonList)[dataIdx]):SetShow(false)
  end
  if isGuildMaster == true then
    if grade == 0 then
      (GuildListInfoPage._buttonListBG):SetShow(false)
    else
      if grade == 1 then
        (GuildListInfoPage._buttonListBG):SetShow(true)
        ;
        ((GuildListInfoPage._buttonList)[6]):SetShow(true)
        ;
        ((GuildListInfoPage._buttonList)[6]):SetPosY(_constStartButtonY)
        ;
        ((GuildListInfoPage._buttonList)[0]):SetShow(true)
        ;
        ((GuildListInfoPage._buttonList)[0]):SetPosY(_constStartButtonY + _constStartButtonGapY)
        ;
        ((GuildListInfoPage._buttonList)[2]):SetShow(true)
        ;
        ((GuildListInfoPage._buttonList)[2]):SetPosY(_constStartButtonY + _constStartButtonGapY * 2)
        ;
        ((GuildListInfoPage._buttonList)[7]):SetShow(true)
        ;
        ((GuildListInfoPage._buttonList)[7]):SetPosY(_constStartButtonY + _constStartButtonGapY * 3)
        ;
        ((GuildListInfoPage._buttonList)[3]):SetShow(true)
        ;
        ((GuildListInfoPage._buttonList)[3]):SetPosY(_constStartButtonY + _constStartButtonGapY * 4)
        ;
        (GuildListInfoPage._buttonListBG):SetSize(140, 160)
        _selectIndex = dataIdx
      else
        if grade == 2 then
          (GuildListInfoPage._buttonListBG):SetShow(true)
          ;
          ((GuildListInfoPage._buttonList)[6]):SetShow(true)
          ;
          ((GuildListInfoPage._buttonList)[6]):SetPosY(_constStartButtonY)
          if isProtect == false then
            ((GuildListInfoPage._buttonList)[7]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[7]):SetPosY(_constStartButtonY + _constStartButtonGapY)
            ;
            ((GuildListInfoPage._buttonList)[1]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[1]):SetPosY(_constStartButtonY + _constStartButtonGapY * 2)
            ;
            ((GuildListInfoPage._buttonList)[4]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[4]):SetPosY(_constStartButtonY + _constStartButtonGapY * 3)
            ;
            ((GuildListInfoPage._buttonList)[0]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[0]):SetPosY(_constStartButtonY + _constStartButtonGapY * 4)
            ;
            (GuildListInfoPage._buttonListBG):SetSize(140, 160)
          else
            ;
            ((GuildListInfoPage._buttonList)[5]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[5]):SetPosY(_constStartButtonY + _constStartButtonGapY)
            ;
            ((GuildListInfoPage._buttonList)[0]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[0]):SetPosY(_constStartButtonY + _constStartButtonGapY * 2)
            ;
            (GuildListInfoPage._buttonListBG):SetSize(140, 100)
          end
          _selectIndex = dataIdx
        else
          if grade == 3 then
            (GuildListInfoPage._buttonListBG):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[6]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[6]):SetPosY(_constStartButtonY)
            ;
            ((GuildListInfoPage._buttonList)[2]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[2]):SetPosY(_constStartButtonY + _constStartButtonGapY)
            ;
            ((GuildListInfoPage._buttonList)[1]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[1]):SetPosY(_constStartButtonY + _constStartButtonGapY * 2)
            ;
            ((GuildListInfoPage._buttonList)[0]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[0]):SetPosY(_constStartButtonY + _constStartButtonGapY * 3)
            ;
            (GuildListInfoPage._buttonListBG):SetSize(140, 130)
            _selectIndex = dataIdx
          end
        end
      end
    end
  else
    if isGuildSubMaster == true then
      if grade == 0 then
        (GuildListInfoPage._buttonListBG):SetSize(140, 40)
        ;
        (GuildListInfoPage._buttonListBG):SetShow(true)
        ;
        ((GuildListInfoPage._buttonList)[6]):SetShow(true)
        ;
        ((GuildListInfoPage._buttonList)[6]):SetPosY(_constStartButtonY)
        _selectIndex = dataIdx
      else
        if grade == 1 then
          (GuildListInfoPage._buttonListBG):SetSize(140, 40)
          ;
          (GuildListInfoPage._buttonListBG):SetShow(true)
          ;
          ((GuildListInfoPage._buttonList)[6]):SetShow(true)
          ;
          ((GuildListInfoPage._buttonList)[6]):SetPosY(_constStartButtonY)
          _selectIndex = dataIdx
        else
          if grade == 2 then
            (GuildListInfoPage._buttonListBG):SetSize(140, 70)
            ;
            (GuildListInfoPage._buttonListBG):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[6]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[6]):SetPosY(_constStartButtonY)
            ;
            ((GuildListInfoPage._buttonList)[0]):SetShow(true)
            ;
            ((GuildListInfoPage._buttonList)[0]):SetPosY(_constStartButtonY + _constStartButtonGapY)
            _selectIndex = dataIdx
          else
            if grade == 3 then
              (GuildListInfoPage._buttonListBG):SetShow(true)
              ;
              ((GuildListInfoPage._buttonList)[6]):SetShow(true)
              ;
              ((GuildListInfoPage._buttonList)[6]):SetPosY(_constStartButtonY)
              ;
              ((GuildListInfoPage._buttonList)[0]):SetShow(true)
              ;
              ((GuildListInfoPage._buttonList)[0]):SetPosY(_constStartButtonY + _constStartButtonGapY)
              ;
              (GuildListInfoPage._buttonListBG):SetSize(140, 70)
              _selectIndex = dataIdx
            else
              ;
              (GuildListInfoPage._buttonListBG):SetShow(false)
            end
          end
        end
      end
    else
      ;
      (GuildListInfoPage._buttonListBG):SetSize(140, 40)
      ;
      (GuildListInfoPage._buttonListBG):SetShow(true)
      ;
      ((GuildListInfoPage._buttonList)[6]):SetShow(true)
      ;
      ((GuildListInfoPage._buttonList)[6]):SetPosY(_constStartButtonY)
      _selectIndex = dataIdx
    end
  end
end

HandleClickedGuildMemberContractButton = function(index)
  -- function num : 0_5 , upvalues : tempGuildList
  local memberIndex = index
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local dataIdx = (tempGuildList[index + 1]).idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  local usableActivity = myGuildMemberInfo:getUsableActivity()
  if isGuildMaster == true then
    FGlobal_AgreementGuild_Master_Open(dataIdx, 0, usableActivity)
  else
    if isGuildSubMaster == true then
      FGlobal_AgreementGuild_Master_Open(dataIdx, 1, usableActivity)
    else
      FGlobal_AgreementGuild_Master_Open(dataIdx, 2, usableActivity)
    end
  end
end

HandleCLicked_IncentiveOption = function()
  -- function num : 0_6
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local pcPosition = (player:get()):getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  local safeZoneCheck = (regionInfo:get()):isSafeZone()
  if safeZoneCheck then
    Panel_GuildIncentiveOption_ShowToggle()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_ALERT"))
  end
end

HandleCLicked_GuildListIncentive_Open = function()
  -- function num : 0_7 , upvalues : _incentivePanelType, incentive_InputMoney, txt_incentive_Title, txt_incentive_Deposit, txt_incentive_Notify
  _incentivePanelType = 0
  incentive_InputMoney:SetEditText("", true)
  Panel_GuildIncentive:SetShow(true)
  txt_incentive_Title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_INCENTIVE_TITLE"))
  txt_incentive_Deposit:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_INCENTIVE_DEPOSIT"))
  txt_incentive_Notify:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_INCENTIVE_NOTIFY"))
end

HandleCLicked_GuildListIncentive_Deposit = function()
  -- function num : 0_8 , upvalues : _incentivePanelType, inputGuildDepositMaxNum_s64, incentive_InputMoney, txt_incentive_Title, txt_incentive_Deposit, txt_incentive_Notify
  _incentivePanelType = 1
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local businessFunds_s64 = myGuildListInfo:getGuildBusinessFunds_s64()
  local unpaidTax_s64 = myGuildListInfo:getAccumulateTax()
  local unpaidCost_s64 = myGuildListInfo:getAccumulateGuildHouseCost()
  local maxInputValue_s64 = toInt64(0, 0)
  if toInt64(0, 0) < unpaidTax_s64 then
    maxInputValue_s64 = myGuildListInfo:getAccumulateTax() - myGuildListInfo:getGuildBusinessFunds_s64()
  else
    if toInt64(0, 0) < unpaidCost_s64 then
      maxInputValue_s64 = myGuildListInfo:getAccumulateGuildHouseCost() - myGuildListInfo:getGuildBusinessFunds_s64()
    end
  end
  inputGuildDepositMaxNum_s64 = maxInputValue_s64
  incentive_InputMoney:SetEditText(maxInputValue_s64, true)
  Panel_GuildIncentive:SetShow(true)
  txt_incentive_Title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_DEPOSIT_TITLE"))
  txt_incentive_Deposit:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDLIST_DEPOSIT_DEPOSIT"))
  txt_incentive_Notify:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDLIST_DEPOSIT_NOTIFY", "maxInput", makeDotMoney(maxInputValue_s64)))
end

HandleCLicked_GuildListIncentive_Paypal = function()
  -- function num : 0_9
  local hasWareHouse = ToClient_HasWareHouseFromNpc()
  if hasWareHouse then
    FGlobal_GetDailyPay_Show()
  else
    ToClient_TakeMyGuildBenefit(false)
  end
end

checkVoiceChatMicTexture = function(idx, onOff)
  -- function num : 0_10
  local sayControl = ((GuildListInfoPage._list)[idx])._saying
  if onOff then
    local x1, y1, x2, y2 = setTextureUV_Func(sayControl, 452, 70, 481, 93)
    ;
    (sayControl:getBaseTexture()):setUV(x1, y1, x2, y2)
    sayControl:setRenderTexture(sayControl:getBaseTexture())
  else
    do
      local x1, y1, x2, y2 = setTextureUV_Func(sayControl, 482, 70, 511, 93)
      ;
      (sayControl:getBaseTexture()):setUV(x1, y1, x2, y2)
      sayControl:setRenderTexture(sayControl:getBaseTexture())
    end
  end
end

checkVoiceChatListenTexture = function(idx, onOff)
  -- function num : 0_11
  local listenControl = ((GuildListInfoPage._list)[idx])._listening
  if onOff then
    local x1, y1, x2, y2 = setTextureUV_Func(listenControl, 422, 94, 451, 117)
    ;
    (listenControl:getBaseTexture()):setUV(x1, y1, x2, y2)
    listenControl:setRenderTexture(listenControl:getBaseTexture())
  else
    do
      local x1, y1, x2, y2 = setTextureUV_Func(listenControl, 452, 94, 481, 117)
      ;
      (listenControl:getBaseTexture()):setUV(x1, y1, x2, y2)
      listenControl:setRenderTexture(listenControl:getBaseTexture())
    end
  end
end

checkVoiceChatListenOtherTexture = function(onOff)
  -- function num : 0_12 , upvalues : listening_VolumeButton
  listening_VolumeButton:ChangeTextureInfoName("new_ui_common_forlua/window/guild/guild_00.dds")
  if onOff then
    local x1, y1, x2, y2 = setTextureUV_Func(listening_VolumeButton, 422, 94, 451, 117)
    ;
    (listening_VolumeButton:getBaseTexture()):setUV(x1, y1, x2, y2)
    listening_VolumeButton:setRenderTexture(listening_VolumeButton:getBaseTexture())
  else
    do
      local x1, y1, x2, y2 = setTextureUV_Func(listening_VolumeButton, 452, 94, 481, 117)
      ;
      (listening_VolumeButton:getBaseTexture()):setUV(x1, y1, x2, y2)
      listening_VolumeButton:setRenderTexture(listening_VolumeButton:getBaseTexture())
    end
  end
end

HandleClickedVoiceChatSaying = function(index)
  -- function num : 0_13 , upvalues : tempGuildList, isVoiceOpen
  local self = GuildListInfoPage
  local memberIndex = index
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local dataIdx = (tempGuildList[index + 1]).idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  if isVoiceOpen == true then
    (((self._list)[index])._saying):SetAutoDisableTime(2)
    ;
    (((self._list)[index])._saying):DoAutoDisableTime()
    ;
    (((self._list)[index])._listening):SetAutoDisableTime(2)
    ;
    (((self._list)[index])._listening):DoAutoDisableTime()
  end
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  local usableActivity = myGuildMemberInfo:getUsableActivity()
  local isSaying = myGuildMemberInfo:isVoiceChatSpeak()
  local isListening = myGuildMemberInfo:isVoiceChatListen()
  if myGuildMemberInfo:isSelf() == true then
    if isSaying then
      isSaying = false
      ToClient_StopVoiceChat()
    else
      isSaying = true
      ToClient_StartVoiceChat()
    end
    do
      if ToClient_IsConnectedMic() == false then
        local x1, y1, x2, y2 = setTextureUV_Func(((self._list)[index])._saying, 482, 70, 511, 93)
        ;
        ((((self._list)[index])._saying):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((self._list)[index])._saying):setRenderTexture((((self._list)[index])._saying):getBaseTexture())
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_Guild_List_NotConnectedMic"))
        return 
      end
      checkVoiceChatMicTexture(index, isSaying)
      ToClient_VoiceChatChangeState((CppEnums.VoiceChatType).eVoiceChatType_Guild, myGuildMemberInfo:getUserNo(), isSaying, isListening, false)
      local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
      local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
      if isGuildMaster == true or isGuildSubMaster == true then
        local handle_SendForceState = function()
    -- function num : 0_13_0 , upvalues : index, tempGuildList, isListening
    checkVoiceChatMicTexture(index, false)
    ToClient_VoiceChatChangeState((CppEnums.VoiceChatType).eVoiceChatType_Guild, (tempGuildList[index + 1]).userNo, false, isListening, true)
  end

        if isSaying == false then
          return 
        end
        local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "Lua_Guild_List_VoiceChatControl_ForceSpeakOff", "GuildMember", myGuildMemberInfo:getName())
        local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionYes = handle_SendForceState, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData)
        return 
      end
    end
  end
end

HandleClicked_VoiceChatListening = function()
  -- function num : 0_14 , upvalues : setVol_selectedMemberIdx, tempGuildList, listening_VolumeSlider, listening_VolumeValue
  local self = GuildListInfoPage
  local memberIndex = setVol_selectedMemberIdx
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local dataIdx = (tempGuildList[setVol_selectedMemberIdx + 1]).idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  local isSaying = myGuildMemberInfo:isVoiceChatSpeak()
  local isListening = myGuildMemberInfo:isVoiceChatListen()
  isListening = not isListening
  checkVoiceChatListenTexture(memberIndex, isListening)
  checkVoiceChatListenOtherTexture(isListening)
  if not isListening then
    listening_VolumeSlider:SetControlPos(0)
    ToClient_setSpeakerVolume(0)
  else
    listening_VolumeSlider:SetControlPos(100)
    ToClient_setSpeakerVolume(100)
  end
  listeningVol = (math.ceil)(listening_VolumeSlider:GetControlPos() * 100)
  listening_VolumeValue:SetText(listeningVol .. "%")
  ToClient_VoiceChatChangeState((CppEnums.VoiceChatType).eVoiceChatType_Guild, myGuildMemberInfo:getUserNo(), isSaying, isListening, not isSelf)
  FGlobal_VoiceChatState()
end

local prevVoiceChatListen = false
HandleClicked_VoiceChatListeningVolume = function()
  -- function num : 0_15 , upvalues : tempGuildList, setVol_selectedMemberIdx, prevVoiceChatListen, listening_VolumeSlider, listening_VolumeValue
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  local dataIdx = (tempGuildList[setVol_selectedMemberIdx + 1]).idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  local isSaying = myGuildMemberInfo:isVoiceChatSpeak()
  local isListening = myGuildMemberInfo:isVoiceChatListen()
  prevVoiceChatListen = isListening
  local volume = (math.ceil)(listening_VolumeSlider:GetControlPos() * 100)
  listening_VolumeValue:SetText(volume .. "%")
  if volume > 0 then
    isListening = true
    checkVoiceChatListenOtherTexture(true)
    checkVoiceChatListenTexture(setVol_selectedMemberIdx, true)
  else
    isListening = false
    checkVoiceChatListenOtherTexture(false)
    checkVoiceChatListenTexture(setVol_selectedMemberIdx, false)
  end
  if myGuildMemberInfo:isSelf() then
    ToClient_setSpeakerVolume(volume)
    if prevVoiceChatListen ~= isListening then
      ToClient_VoiceChatChangeState((CppEnums.VoiceChatType).eVoiceChatType_Guild, myGuildMemberInfo:getUserNo(), isSaying, isListening, false)
    end
    FGlobal_VoiceChatState()
  else
    ToClient_VoiceChatChangeVolume((CppEnums.VoiceChatType).eVoiceChatType_Guild, myGuildMemberInfo:getUserNo(), volume)
  end
end

HandleClickedGuildMenuButton = function(index)
  -- function num : 0_16 , upvalues : _selectIndex, _UI_Menu_Button
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local myGuildMemberInfo = myGuildListInfo:getMember(_selectIndex)
  if myGuildMemberInfo == nil then
    return 
  end
  local messageTitle = ""
  local messageContent = ""
  local yesFunction = nil
  local targetName = myGuildMemberInfo:getName()
  local characterName = myGuildMemberInfo:getCharacterName()
  local isOnlineMember = myGuildMemberInfo:isOnline()
  if index == _UI_Menu_Button.Type_ChangeMaster then
    messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_DELEGATE_MASTER")
    messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_DELEGATE_MASTER_QUESTION", "target", "\'" .. tostring(targetName) .. "\'")
    yesFunction = MessageBoxYesFunction_ChangeGuildMaster
    local messageboxData = {title = messageTitle, content = messageContent, functionYes = yesFunction, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData, "top")
    return 
  else
    do
      if index == _UI_Menu_Button.Type_Deportation then
        messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_EXPEL_GUILDMEMBER")
        messageContent = "\'" .. tostring(targetName) .. "\'" .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_EXPEL_GUILDMEMBER_QUESTION")
        yesFunction = MessageBoxYesFunction_ExpelMember
      else
        if index == _UI_Menu_Button.Type_AppointCommander then
          messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_APPOINT_GUILDSUBMASTER")
          messageContent = "\'" .. tostring(targetName) .. "\'" .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_APPOINT_GUILDSUBMASTER_QUESTION")
          yesFunction = MessageBoxYesFunction_AppointCommander
        else
          if index == _UI_Menu_Button.Type_CancelAppoint then
            messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_APPOINT_GUILDMEMBER")
            messageContent = "\'" .. tostring(targetName) .. "\'" .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_APPOINT_GUILDMEMBER_QUESTION")
            yesFunction = MessageBoxYesFunction_CancelAppoint
          else
            if index == _UI_Menu_Button.Type_ProtectMember then
              local protectRate = 10
              local currentProtectMemberCount = myGuildListInfo:getProtectGuildMemberCount()
              local maxProtectMemberCount = (math.floor)(myGuildListInfo:getMemberCount() / protectRate + 0.5) - 1
              messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_PROTECT_GUILDMEMBER")
              messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_PROTECT_GUILDMEMBER_DESC")
              yesFunction = MessageBoxYesFunction_ProtectMember
              ;
              (GuildListInfoPage._buttonListBG):SetShow(false)
              local messageboxData = {title = messageTitle, content = messageContent, functionYes = yesFunction, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
              ;
              (MessageBox.showMessageBox)(messageboxData, "top")
              return 
            else
              do
                if index == _UI_Menu_Button.Type_CancelProtectMember then
                  messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CANCEL_PROTECT_GUILDMEMBER")
                  messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CANCEL_PROTECT_GUILDMEMBER_DESC")
                  yesFunction = MessageBoxYesFunction_CancelProtectMember
                else
                  if index == _UI_Menu_Button.Type_PartyInvite then
                    local guildMemberPartyInvite = function()
    -- function num : 0_16_0 , upvalues : characterName
    RequestParty_inviteCharacter(characterName)
  end

                    messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
                    ;
                    (GuildListInfoPage._buttonListBG):SetShow(false)
                    if isOnlineMember then
                      messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDLIST_GUILDMEMBERPARTYINVITE_MSG", "targetName", characterName)
                      local messageboxData = {title = messageTitle, content = messageContent, functionYes = guildMemberPartyInvite, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                      ;
                      (MessageBox.showMessageBox)(messageboxData, "middle")
                      return 
                    else
                      do
                        messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_PARTYINVITE_NOTJOINMEMBER")
                        do
                          local messageboxData = {title = messageTitle, content = messageContent, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                          ;
                          (MessageBox.showMessageBox)(messageboxData, "middle")
                          do return  end
                          if index == _UI_Menu_Button.Type_Supply then
                            messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_SUPPLYOFFICER_APPOINTMENT_TITLE")
                            messageContent = "\'" .. tostring(targetName) .. "\'" .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_SUPPLYOFFICER_APPOINTMENT_MEMO")
                            yesFunction = MessageBoxYesFunction_AppointSupply
                          else
                            ;
                            (UI.ASSERT)(false, "ìž‘ì—…í•´ì•¼í•©ë‹ˆë‹\164!")
                            return 
                          end
                          ;
                          (GuildListInfoPage._buttonListBG):SetShow(false)
                          local messageboxData = {title = messageTitle, content = messageContent, functionYes = yesFunction, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                          ;
                          (MessageBox.showMessageBox)(messageboxData)
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

HandleToolTipCharacterName = function(isShow, index, uiIndex)
  -- function num : 0_17 , upvalues : tempGuildList
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local dataIndex = (tempGuildList[uiIndex + 1]).idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIndex)
  local isOnline = myGuildMemberInfo:isOnline()
  local uiControl = ((GuildListInfoPage._list)[uiIndex])._charName
  local name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDLIST_FAMILYNAME", "name", myGuildMemberInfo:getName())
  local desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDLIST_CHARACTERNAME", "name", myGuildMemberInfo:getCharacterName())
  if isOnline then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

HandleToolTipChannelName = function(isShow, index)
  -- function num : 0_18 , upvalues : tempGuildList
  local self = GuildListInfoPage
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local dataIndex = (tempGuildList[index + 1]).idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIndex)
  local guildMemberName = myGuildMemberInfo:getCharacterName()
  local isOnline = myGuildMemberInfo:isOnline()
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local channelName = getChannelName(worldNo, myGuildMemberInfo:getServerNo())
  if isOnline then
    name = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDLIST_JOINCHANNEL_FOR", "guildMemberName", guildMemberName)
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_CHANNEL_MEMBER", "channelName", channelName)
    control = ((self._list)[index])._charName
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    if isShow == true then
      TooltipSimple_Show(control, name, desc)
    else
      TooltipSimple_Hide()
    end
  end
end

HandleToolTipVoiceIcon = function(isShow, index, tipType)
  -- function num : 0_19
  local self = GuildListInfoPage
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_VOICECHATICON_TOOLTIP_VOICE_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_VOICECHATICON_TOOLTIP_VOICE_DESC")
    control = ((self._list)[index])._saying
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_VOICECHATICON_TOOLTIP_SPEAKER_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_VOICECHATICON_TOOLTIP_SPEAKER_DESC")
      control = ((self._list)[index])._listening
    end
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

HandleClick_GuildMemberList_Listening = function(index)
  -- function num : 0_20 , upvalues : tempGuildList, listening_Volume, setVol_selectedMemberVol, listening_VolumeSlider, listening_VolumeValue, setVol_selectedMemberIdx
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local dataIdx = (tempGuildList[index + 1]).idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  if myGuildMemberInfo == nil then
    return 
  end
  listening_Volume:SetShow(true)
  if myGuildMemberInfo:isSelf() then
    setVol_selectedMemberVol = ToClient_getSpeakerVolume()
  else
    setVol_selectedMemberVol = myGuildMemberInfo:getVoiceVolume()
  end
  listening_VolumeSlider:SetControlPos(setVol_selectedMemberVol)
  if setVol_selectedMemberVol > 0 then
    checkVoiceChatListenOtherTexture(true)
  else
    checkVoiceChatListenOtherTexture(false)
  end
  listening_VolumeValue:SetText(setVol_selectedMemberVol .. "%")
  setVol_selectedMemberIdx = index
  local targetControl = ((GuildListInfoPage._list)[index])._listening
  listening_Volume:SetPosX(targetControl:GetPosX() - listening_Volume:GetSizeX() / 2)
  listening_Volume:SetPosY(targetControl:GetPosY() + targetControl:GetSizeY() * 2 + 45)
end

HandleOnOut_GuildMemberList_VolumeClose = function()
  -- function num : 0_21 , upvalues : listening_Volume, setVol_selectedMemberIdx
  listening_Volume:SetShow(false)
  setVol_selectedMemberIdx = 0
end

MessageBoxYesFunction_ChangeGuildMaster = function()
  -- function num : 0_22 , upvalues : _selectIndex
  ToClient_RequestChangeGuildMemberGradeForMaster(_selectIndex)
  FGlobal_Notice_AuthorizationUpdate()
end

MessageBoxYesFunction_ExpelMember = function()
  -- function num : 0_23 , upvalues : _selectIndex
  ToClient_RequestExpelMemberFromGuild(_selectIndex)
end

MessageBoxYesFunction_AppointCommander = function()
  -- function num : 0_24 , upvalues : _selectIndex
  ToClient_RequestChangeGuildMemberGrade(_selectIndex, 1)
  FGlobal_Notice_AuthorizationUpdate()
end

MessageBoxYesFunction_CancelAppoint = function()
  -- function num : 0_25 , upvalues : _selectIndex
  ToClient_RequestChangeGuildMemberGrade(_selectIndex, 2)
  FGlobal_Notice_AuthorizationUpdate()
end

MessageBoxYesFunction_AppointSupply = function()
  -- function num : 0_26 , upvalues : _selectIndex
  ToClient_RequestChangeGuildMemberGrade(_selectIndex, 3)
  FGlobal_Notice_AuthorizationUpdate()
end

MessageBoxYesFunction_ProtectMember = function()
  -- function num : 0_27 , upvalues : _selectIndex
  ToClient_RequestChangeProtectMember(_selectIndex, true)
end

MessageBoxYesFunction_CancelProtectMember = function()
  -- function num : 0_28 , upvalues : _selectIndex
  ToClient_RequestChangeProtectMember(_selectIndex, false)
end

MouseOutGuildMenuButton = function()
  -- function num : 0_29 , upvalues : _constCollectionX, _constCollectionY
  local self = GuildListInfoPage
  local sizeX = (self._buttonListBG):GetSizeX()
  local sizeY = (self._buttonListBG):GetSizeY()
  local posX = (self._buttonListBG):GetPosX()
  local posY = (self._buttonListBG):GetPosY()
  local xxxx = Panel_Window_Guild:GetPosX() + posX + 42
  local yyyy = Panel_Window_Guild:GetPosY() + posY + 95
  local mousePosX = getMousePosX() - Panel_Window_Guild:GetPosX() - _constCollectionX
  local mousePosY = getMousePosY() - Panel_Window_Guild:GetPosY() - _constCollectionY
  if xxxx <= getMousePosX() and getMousePosX() <= xxxx + sizeX and yyyy <= getMousePosY() and getMousePosY() <= yyyy + sizeY then
    (self._buttonListBG):SetShow(false)
  end
end

GuildListMouseScrollEvent = function(isUpScroll)
  -- function num : 0_30
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  local memberCount = guildWrapper:getMemberCount()
  ;
  (UIScroll.ScrollEvent)(GuildListInfoPage._scrollBar, isUpScroll, memberCount, memberCount, 0, 1)
  GuildListInfoPage:UpdateData()
end

-- DECOMPILER ERROR at PC570: Confused about usage of register: R57 in 'UnsetPending'

GuildListInfoPage.TitleLineReset = function(self)
  -- function num : 0_31 , upvalues : staticText_Grade, staticText_Level, staticText_Class, staticText_charName, staticText_activity, staticText_contract, staticText_contributedTendency, text_contributedTendency
  staticText_Grade:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_POSITION"))
  staticText_Level:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_LEVEL"))
  staticText_Class:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CLASS"))
  staticText_charName:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CHARNAME"))
  staticText_activity:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_ACTIVITY"))
  staticText_contract:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_HIRE"))
  staticText_contributedTendency:SetText(text_contributedTendency)
end

-- DECOMPILER ERROR at PC574: Confused about usage of register: R57 in 'UnsetPending'

GuildListInfoPage.SetGuildList = function(self)
  -- function num : 0_32 , upvalues : tempGuildList
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local memberCount = myGuildListInfo:getMemberCount()
  tempGuildList = {}
  for index = 1, memberCount do
    local myGuildMemberInfo = myGuildListInfo:getMember(index - 1)
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R8 in 'UnsetPending'

    tempGuildList[index] = {idx = index - 1, online = myGuildMemberInfo:isOnline(), grade = myGuildMemberInfo:getGrade(), level = myGuildMemberInfo:getLevel(), class = myGuildMemberInfo:getClassType(), name = myGuildMemberInfo:getName(), ap = Int64toInt32(myGuildMemberInfo:getTotalActivity()), expiration = myGuildMemberInfo:getContractedExpirationUtc(), wp = myGuildMemberInfo:getMaxWp(), kp = myGuildMemberInfo:getExplorationPoint(), userNo = myGuildMemberInfo:getUserNo()}
  end
end

local guildListCompareGrade = function(w1, w2)
  -- function num : 0_33 , upvalues : _listSort
  local w1Grade = w1.grade
  local w2Grade = w2.grade
  if w1Grade == 2 then
    w1Grade = 3
  else
    if w1Grade == 3 then
      w1Grade = 2
    end
  end
  if w2Grade == 2 then
    w2Grade = 3
  else
    if w2Grade == 3 then
      w2Grade = 2
    end
  end
  if w1Grade >= w2Grade then
    do
      do return _listSort.grade ~= true end
      do return w2Grade < w1Grade end
      -- DECOMPILER ERROR: 4 unprocessed JMP targets
    end
  end
end

local guildListCompareLev = function(w1, w2)
  -- function num : 0_34 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.level == true and w2.level < w1.level then
    return true
  end
  if w1.level < w2.level then
    return true
  end
end

local guildListCompareClass = function(w1, w2)
  -- function num : 0_35 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.class == true and w2.class < w1.class then
    return true
  end
  if w1.class < w2.class then
    return true
  end
end

local guildListCompareName = function(w1, w2)
  -- function num : 0_36 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.name == true and w1.name < w2.name then
    return true
  end
  if w2.name < w1.name then
    return true
  end
end

local guildListCompareAp = function(w1, w2)
  -- function num : 0_37 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.ap == true and w2.ap < w1.ap then
    return true
  end
  if w1.ap < w2.ap then
    return true
  end
end

local guildListCompareExpiration = function(w1, w2)
  -- function num : 0_38 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.expiration == true and w2.expiration < w1.expiration then
    return true
  end
  if w1.expiration < w2.expiration then
    return true
  end
end

local guildListCompareWp = function(w1, w2)
  -- function num : 0_39 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.wp == true and w2.wp < w1.wp then
    return true
  end
  -- DECOMPILER ERROR at PC24: Unhandled construct in 'MakeBoolean' P1

  if _listSort.wp == false and _listSort.kp == true and w2.kp < w1.kp then
    return true
  end
  if w1.wp < w2.wp then
    return true
  end
end

HandleClicked_GuildListSort = function(sortType)
  -- function num : 0_40 , upvalues : _selectSortType, _listSort, staticText_Grade, tempGuildList, guildListCompareGrade, staticText_Level, guildListCompareLev, staticText_Class, guildListCompareClass, staticText_charName, guildListCompareName, staticText_activity, guildListCompareAp, staticText_contract, guildListCompareExpiration, staticText_contributedTendency, text_contributedTendency, guildListCompareWp
  _selectSortType = sortType
  GuildListInfoPage:TitleLineReset()
  if sortType == 0 then
    if _listSort.grade == false then
      staticText_Grade:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_POSITION") .. "â–\178")
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

      _listSort.grade = true
    else
      staticText_Grade:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_POSITION") .. "â–\188")
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

      _listSort.grade = false
    end
    ;
    (table.sort)(tempGuildList, guildListCompareGrade)
  else
    if sortType == 1 then
      if _listSort.level == false then
        staticText_Level:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_LEVEL") .. "â–\178")
        -- DECOMPILER ERROR at PC58: Confused about usage of register: R1 in 'UnsetPending'

        _listSort.level = true
      else
        staticText_Level:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_LEVEL") .. "â–\188")
        -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

        _listSort.level = false
      end
      ;
      (table.sort)(tempGuildList, guildListCompareLev)
    else
      if sortType == 2 then
        if _listSort.class == false then
          staticText_Class:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CLASS") .. "â–\178")
          -- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

          _listSort.class = true
        else
          staticText_Class:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CLASS") .. "â–\188")
          -- DECOMPILER ERROR at PC108: Confused about usage of register: R1 in 'UnsetPending'

          _listSort.class = false
        end
        ;
        (table.sort)(tempGuildList, guildListCompareClass)
      else
        if sortType == 3 then
          if _listSort.name == false then
            staticText_charName:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CHARNAME") .. "â–\178")
            -- DECOMPILER ERROR at PC132: Confused about usage of register: R1 in 'UnsetPending'

            _listSort.name = true
          else
            staticText_charName:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CHARNAME") .. "â–\188")
            -- DECOMPILER ERROR at PC145: Confused about usage of register: R1 in 'UnsetPending'

            _listSort.name = false
          end
          ;
          (table.sort)(tempGuildList, guildListCompareName)
        else
          if sortType == 4 then
            if _listSort.ap == false then
              staticText_activity:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_ACTIVITY") .. "â–\178")
              -- DECOMPILER ERROR at PC169: Confused about usage of register: R1 in 'UnsetPending'

              _listSort.ap = true
            else
              staticText_activity:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_ACTIVITY") .. "â–\188")
              -- DECOMPILER ERROR at PC182: Confused about usage of register: R1 in 'UnsetPending'

              _listSort.ap = false
            end
            ;
            (table.sort)(tempGuildList, guildListCompareAp)
          else
            if sortType == 5 then
              if _listSort.expiration == false then
                staticText_contract:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_HIRE") .. "â–\178")
                -- DECOMPILER ERROR at PC206: Confused about usage of register: R1 in 'UnsetPending'

                _listSort.expiration = true
              else
                staticText_contract:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_HIRE") .. "â–\188")
                -- DECOMPILER ERROR at PC219: Confused about usage of register: R1 in 'UnsetPending'

                _listSort.expiration = false
              end
              ;
              (table.sort)(tempGuildList, guildListCompareExpiration)
            else
              if sortType == 6 then
                if _listSort.wp == false then
                  staticText_contributedTendency:SetText(text_contributedTendency .. "â–\178")
                  -- DECOMPILER ERROR at PC239: Confused about usage of register: R1 in 'UnsetPending'

                  _listSort.wp = true
                else
                  if _listSort.kp == false then
                    staticText_contributedTendency:SetText(text_contributedTendency .. "â–\178")
                    -- DECOMPILER ERROR at PC252: Confused about usage of register: R1 in 'UnsetPending'

                    _listSort.kp = true
                  else
                    staticText_contributedTendency:SetText(text_contributedTendency .. "â–\188")
                    -- DECOMPILER ERROR at PC261: Confused about usage of register: R1 in 'UnsetPending'

                    _listSort.wp = false
                    -- DECOMPILER ERROR at PC263: Confused about usage of register: R1 in 'UnsetPending'

                    _listSort.kp = false
                  end
                end
                ;
                (table.sort)(tempGuildList, guildListCompareWp)
              end
            end
          end
        end
      end
    end
  end
  GuildListInfoPage:UpdateData()
end

-- DECOMPILER ERROR at PC615: Confused about usage of register: R64 in 'UnsetPending'

GuildListInfoPage.GuildListSortSet = function(self)
  -- function num : 0_41 , upvalues : staticText_Grade, _listSort, tempGuildList, guildListCompareGrade
  GuildListInfoPage:TitleLineReset()
  staticText_Grade:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_POSITION") .. "â–\178")
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  _listSort.grade = true
  ;
  (table.sort)(tempGuildList, guildListCompareGrade)
end

-- DECOMPILER ERROR at PC627: Confused about usage of register: R64 in 'UnsetPending'

GuildListInfoPage.updateSort = function(self)
  -- function num : 0_42 , upvalues : _selectSortType, tempGuildList, guildListCompareGrade, guildListCompareLev, guildListCompareClass, guildListCompareName, guildListCompareAp, guildListCompareExpiration, guildListCompareWp
  if _selectSortType == 0 then
    (table.sort)(tempGuildList, guildListCompareGrade)
  else
    if _selectSortType == 1 then
      (table.sort)(tempGuildList, guildListCompareLev)
    else
      if _selectSortType == 2 then
        (table.sort)(tempGuildList, guildListCompareClass)
      else
        if _selectSortType == 3 then
          (table.sort)(tempGuildList, guildListCompareName)
        else
          if _selectSortType == 4 then
            (table.sort)(tempGuildList, guildListCompareAp)
          else
            if _selectSortType == 5 then
              (table.sort)(tempGuildList, guildListCompareExpiration)
            else
              if _selectSortType == 6 then
                (table.sort)(tempGuildList, guildListCompareWp)
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC641: Confused about usage of register: R64 in 'UnsetPending'

GuildListInfoPage.UpdateData = function(self)
  -- function num : 0_43 , upvalues : _initMoney, contentSizeY, _constGuildListMaxCount, tempGuildUserNolist, tempGuildList, UI_Class, isVoiceOpen, UI_color, btn_GuildMasterMandate, frameSizeY, notice_title
  GuildListInfoPage:SetGuildList()
  GuildListInfoPage:updateSort()
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local businessFunds_s64 = myGuildListInfo:getGuildBusinessFunds_s64()
  local guildGrade = myGuildListInfo:getGuildGrade()
  if getServiceNationType() == 1 then
    (GuildListInfoPage._textBusinessFundsBG):SetText(PAGetString(Defines.StringSheet_RESOURCE, "FRAME_GUILD_LIST_GUILDMONEY") .. "\n<PAColor0xffffebbc>" .. makeDotMoney(businessFunds_s64) .. "<PAOldColor>")
    if _initMoney == false then
      _initMoney = true
      ;
      (GuildListInfoPage._textBusinessFundsBG):SetPosY((GuildListInfoPage._textBusinessFundsBG):GetPosY() - (GuildListInfoPage._textBusinessFundsBG):GetSizeY() / 5 * 2)
    end
  else
    ;
    (GuildListInfoPage._textBusinessFundsBG):SetText(PAGetString(Defines.StringSheet_RESOURCE, "FRAME_GUILD_LIST_GUILDMONEY") .. " <PAColor0xffffebbc>" .. makeDotMoney(businessFunds_s64) .. "<PAOldColor>")
  end
  local memberCount = myGuildListInfo:getMemberCount()
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  self._onlineCount = 0
  contentSizeY = 0
  for index = 0, _constGuildListMaxCount - 1 do
    ((self._list)[index]):SetShow(false)
  end
  tempGuildUserNolist = {}
  for index = 0, memberCount - 1 do
    local dataIdx = (tempGuildList[index + 1]).idx
    local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
    if myGuildMemberInfo == nil then
      _PA_ASSERT(false, "ë©¤ë²„ ë°ì´í„°ê°€ ì—†ì„ ìˆ\152 ìžˆë‚˜? í™•ì¸ ë°”ëžë‹ˆë‹¤.")
      return 
    end
    local gradeType = myGuildMemberInfo:getGrade()
    ;
    (((self._list)[index])._grade):SetText("")
    ;
    (((self._list)[index])._grade):SetSize(43, 26)
    if gradeType == 0 then
      (((self._list)[index])._grade):ChangeTextureInfoName("new_ui_common_forlua/window/guild/guild_00.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(((self._list)[index])._grade, 424, 159, 467, 185)
      ;
      ((((self._list)[index])._grade):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (((self._list)[index])._grade):setRenderTexture((((self._list)[index])._grade):getBaseTexture())
    else
      do
        if gradeType == 1 then
          (((self._list)[index])._grade):ChangeTextureInfoName("new_ui_common_forlua/window/guild/guild_00.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(((self._list)[index])._grade, 468, 159, 511, 185)
          ;
          ((((self._list)[index])._grade):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          (((self._list)[index])._grade):setRenderTexture((((self._list)[index])._grade):getBaseTexture())
        else
          do
            if gradeType == 2 then
              (((self._list)[index])._grade):ChangeTextureInfoName("new_ui_common_forlua/window/guild/guild_00.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(((self._list)[index])._grade, 468, 219, 511, 245)
              ;
              ((((self._list)[index])._grade):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (((self._list)[index])._grade):setRenderTexture((((self._list)[index])._grade):getBaseTexture())
            else
              do
                if gradeType == 3 then
                  (((self._list)[index])._grade):ChangeTextureInfoName("new_ui_common_forlua/window/guild/guild_00.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(((self._list)[index])._grade, 424, 219, 467, 245)
                  ;
                  ((((self._list)[index])._grade):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (((self._list)[index])._grade):setRenderTexture((((self._list)[index])._grade):getBaseTexture())
                end
                do
                  ;
                  (((self._list)[index])._grade):addInputEvent("Mouse_On", "GuildListInfoTooltip_Grade( true, " .. index .. ", " .. gradeType .. " )")
                  ;
                  (((self._list)[index])._grade):addInputEvent("Mouse_Out", "GuildListInfoTooltip_Grade( false, " .. index .. ", " .. gradeType .. " )")
                  local userNo = myGuildMemberInfo:getUserNo()
                  -- DECOMPILER ERROR at PC315: Confused about usage of register: R15 in 'UnsetPending'

                  tempGuildUserNolist[index] = userNo
                  if myGuildMemberInfo:isSelf() then
                    ((self._list)[index]):SetIgnore(true)
                  else
                    ;
                    ((self._list)[index]):SetIgnore(false)
                  end
                  ;
                  (((self._list)[index])._level):SetText(myGuildMemberInfo:getLevel())
                  local classType = myGuildMemberInfo:getClassType()
                  if UI_Class.ClassType_Warrior == classType then
                    (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_WARRIOR"))
                  else
                    if UI_Class.ClassType_Ranger == classType then
                      (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_RANGER"))
                    else
                      if UI_Class.ClassType_Sorcerer == classType then
                        (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_SORCERER"))
                      else
                        if UI_Class.ClassType_Giant == classType then
                          (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_GIANT"))
                        else
                          if UI_Class.ClassType_Tamer == classType then
                            (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_TAMER"))
                          else
                            if UI_Class.ClassType_BladeMaster == classType then
                              (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_BLADEMASTER"))
                            else
                              if UI_Class.ClassType_Valkyrie == classType then
                                (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_VALKYRIE"))
                              else
                                if UI_Class.ClassType_BladeMasterWomen == classType then
                                  (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_BLADEMASTERWOMAN"))
                                else
                                  if UI_Class.ClassType_Kunoichi == classType then
                                    (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_KUNOICHI"))
                                  else
                                    if UI_Class.ClassType_Wizard == classType then
                                      (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_WIZARD"))
                                    else
                                      if UI_Class.ClassType_WizardWomen == classType then
                                        (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_WIZARDWOMAN"))
                                      else
                                        if UI_Class.ClassType_NinjaWomen == classType then
                                          (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_NINJAWOMEN"))
                                        else
                                          if UI_Class.ClassType_NinjaMan == classType then
                                            (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_NINJAMAN"))
                                          else
                                            if UI_Class.ClassType_DarkElf == classType then
                                              (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_DARKELF"))
                                            else
                                              if UI_Class.ClassType_Combattant == classType then
                                                (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_STRIKER"))
                                              else
                                                if UI_Class.ClassType_CombattantWomen == classType then
                                                  (((self._list)[index])._class):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_COMBATTANTWOMEN"))
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
                  local maxWp = myGuildMemberInfo:getMaxWp()
                  if maxWp == 0 then
                    maxWp = "-"
                  end
                  local explorationPoint = myGuildMemberInfo:getExplorationPoint()
                  ;
                  (((self._list)[index])._contributedTendency):SetText(maxWp .. "/" .. explorationPoint)
                  if isVoiceOpen == true then
                    if myGuildMemberInfo:isVoiceChatSpeak() then
                      if myGuildMemberInfo:isVoiceSpeaking() then
                        local x1, y1, x2, y2 = setTextureUV_Func(((self._list)[index])._saying, 422, 70, 451, 93)
                        ;
                        ((((self._list)[index])._saying):getBaseTexture()):setUV(x1, y1, x2, y2)
                        ;
                        (((self._list)[index])._saying):setRenderTexture((((self._list)[index])._saying):getBaseTexture())
                      else
                        do
                          checkVoiceChatMicTexture(index, true)
                          checkVoiceChatMicTexture(index, false)
                          checkVoiceChatListenTexture(index, myGuildMemberInfo:isVoiceChatListen())
                          if myGuildMemberInfo:isOnline() == true then
                            local usableActivity = myGuildMemberInfo:getUsableActivity()
                            if usableActivity > 10000 then
                              usableActivity = 10000
                            end
                            local textActivity = tostring(myGuildMemberInfo:getTotalActivity()) .. "(<PAColor0xfface400>+" .. tostring(usableActivity) .. "<PAOldColor>)"
                            ;
                            (((self._list)[index])._activity):SetText(textActivity)
                            ;
                            (((self._list)[index])._activity):SetFontColor(UI_color.C_FFC4BEBE)
                            ;
                            (((self._list)[index])._level):SetFontColor(UI_color.C_FFC4BEBE)
                            ;
                            (((self._list)[index])._class):SetFontColor(UI_color.C_FFC4BEBE)
                            ;
                            (((self._list)[index])._contributedTendency):SetFontColor(UI_color.C_FFC4BEBE)
                            if myGuildMemberInfo:isSelf() then
                              (((self._list)[index])._charName):SetFontColor(UI_color.C_FFEF9C7F)
                            else
                              ;
                              (((self._list)[index])._charName):SetFontColor(UI_color.C_FFC4BEBE)
                            end
                            ;
                            (((self._list)[index])._charName):SetText(myGuildMemberInfo:getName() .. " (" .. myGuildMemberInfo:getCharacterName() .. ")")
                            ;
                            (((self._list)[index])._charName):addInputEvent("Mouse_On", "")
                            ;
                            (((self._list)[index])._charName):addInputEvent("Mouse_Out", "")
                            if isVoiceOpen and (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
                              (((self._list)[index])._charName):SetText(myGuildMemberInfo:getName())
                              ;
                              (((self._list)[index])._charName):addInputEvent("Mouse_On", "HandleToolTipCharacterName(true, " .. dataIdx .. "," .. index .. ")")
                              ;
                              (((self._list)[index])._charName):addInputEvent("Mouse_Out", "HandleToolTipCharacterName(false)")
                            end
                            if isVoiceOpen == true then
                              (((self._list)[index])._saying):SetIgnore(false)
                              ;
                              (((self._list)[index])._listening):SetIgnore(false)
                            end
                            self._onlineCount = self._onlineCount + 1
                          else
                            do
                              do
                                local textActivity = tostring(myGuildMemberInfo:getTotalActivity()) .. "(+" .. tostring(myGuildMemberInfo:getUsableActivity()) .. ")"
                                ;
                                (((self._list)[index])._activity):SetText(textActivity)
                                ;
                                (((self._list)[index])._contributedTendency):SetFontColor(UI_color.C_FF515151)
                                ;
                                (((self._list)[index])._activity):SetFontColor(UI_color.C_FF515151)
                                ;
                                (((self._list)[index])._level):SetFontColor(UI_color.C_FF515151)
                                ;
                                (((self._list)[index])._class):SetFontColor(UI_color.C_FF515151)
                                ;
                                (((self._list)[index])._charName):SetFontColor(UI_color.C_FF515151)
                                ;
                                (((self._list)[index])._charName):SetText(myGuildMemberInfo:getName() .. " ( - )")
                                ;
                                (((self._list)[index])._level):SetText("-")
                                ;
                                (((self._list)[index])._class):SetText("-")
                                if isVoiceOpen == true then
                                  (((self._list)[index])._saying):SetIgnore(true)
                                  ;
                                  (((self._list)[index])._listening):SetIgnore(true)
                                end
                                ;
                                (((self._list)[index])._charName):addInputEvent("Mouse_LUp", "HandleClickedGuildMemberMenuButton( " .. index .. " )")
                                local contractAble = myGuildMemberInfo:getContractableUtc()
                                local expiration = myGuildMemberInfo:getContractedExpirationUtc()
                                do
                                  local isContractState = 0
                                  if Int64toInt32(getLeftSecond_TTime64(expiration)) > 0 then
                                    isContractState = 1
                                    if Int64toInt32(getLeftSecond_TTime64(contractAble)) <= 0 then
                                      isContractState = 0
                                    end
                                  else
                                    isContractState = 2
                                  end
                                  GuildListControl_ChangeTexture_Expiration(((self._list)[index])._contractBtn, isContractState)
                                  ;
                                  (((self._list)[index])._contractBtn):addInputEvent("Mouse_On", "_guildListInfoPage_MandateTooltipShow( true, " .. isContractState .. ", " .. index .. ")")
                                  ;
                                  (((self._list)[index])._contractBtn):addInputEvent("Mouse_Out", "_guildListInfoPage_MandateTooltipShow( false, " .. isContractState .. ", " .. index .. ")")
                                  ;
                                  (((self._list)[index])._contractBtn):setTooltipEventRegistFunc("_guildListInfoPage_MandateTooltipShow( true, " .. isContractState .. ", " .. index .. ")")
                                  ;
                                  (((self._list)[index])._contractBtn):addInputEvent("Mouse_LUp", "HandleClickedGuildMemberContractButton( " .. index .. " )")
                                  ;
                                  ((self._list)[index]):SetShow(true)
                                  ;
                                  (((self._list)[index])._guardHim):SetShow(myGuildMemberInfo:isProtectable())
                                  if (ToClient_GetMyGuildInfoWrapper()):getGuildGrade() == 0 then
                                    (((self._list)[index])._contractBtn):SetIgnore(true)
                                    ;
                                    (((self._list)[index])._contractBtn):SetMonoTone(true)
                                  else
                                    ;
                                    (((self._list)[index])._contractBtn):SetIgnore(false)
                                    ;
                                    (((self._list)[index])._contractBtn):SetMonoTone(false)
                                  end
                                  contentSizeY = contentSizeY + (((self._list)[index])._charName):GetSizeY() + 2
                                  btn_GuildMasterMandate:addInputEvent("Mouse_LUp", "HandleClicked_GuildMasterMandate( " .. index .. " )")
                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                  -- DECOMPILER ERROR at PC1035: LeaveBlock: unexpected jumping out IF_STMT

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
  ;
  (self._contentGuildList):SetSize((self._frameGuildList):GetSizeX(), contentSizeY)
  if contentSizeY <= frameSizeY then
    (self._scrollBar):SetShow(false)
  else
    ;
    (self._scrollBar):SetShow(true)
  end
  if not notice_title:GetShow() then
    GuildMainInfo_Hide()
  end
  ;
  (self._frameGuildList):UpdateContentScroll()
  ;
  (self._frameGuildList):UpdateContentPos()
  ;
  (self._scrollBar):SetInterval((self._contentGuildList):GetSizeY() / 100 * 1.1)
  if (isGuildMaster == true or isGuildSubMaster == true) and guildGrade == 1 then
    (self._btnWelfare):SetShow(true)
  else
    ;
    (self._btnWelfare):SetShow(false)
  end
end

GuildListInfoTooltip_Grade = function(isShow, index, gradeType)
  -- function num : 0_44
  if index == nil then
    return 
  end
  local self = GuildListInfoPage
  local name, desc, control = nil, nil, nil
  local gradeValue = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMEMBER")
  if gradeType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMASTER")
    control = ((self._list)[index])._grade
  else
    if gradeType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDSUBMASTER")
      control = ((self._list)[index])._grade
    else
      if gradeType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMEMBER")
        control = ((self._list)[index])._grade
      else
        if gradeType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_SUPPLYOFFICER")
          control = ((self._list)[index])._grade
        end
      end
    end
  end
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

-- DECOMPILER ERROR at PC647: Confused about usage of register: R64 in 'UnsetPending'

GuildListInfoPage.UpdateVoiceDataByUserNo = function(self, userNo)
  -- function num : 0_45 , upvalues : tempGuildUserNolist
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local memberCount = myGuildListInfo:getMemberCount()
  local uiIndex = 0
  for index = 0, memberCount - 1 do
    if userNo == tempGuildUserNolist[index] then
      uiIndex = index
    end
  end
  if uiIndex == nil then
    return 
  end
  local myGuildMemberInfo = myGuildListInfo:getMemberByUserNo(userNo)
  if myGuildMemberInfo == nil then
    return 
  end
  if myGuildMemberInfo:isVoiceChatSpeak() then
    if myGuildMemberInfo:isVoiceSpeaking() then
      local x1, y1, x2, y2 = setTextureUV_Func(((self._list)[uiIndex])._saying, 422, 70, 451, 93)
      ;
      ((((self._list)[uiIndex])._saying):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (((self._list)[uiIndex])._saying):setRenderTexture((((self._list)[uiIndex])._saying):getBaseTexture())
    else
      do
        do
          local x1, y1, x2, y2 = setTextureUV_Func(((self._list)[uiIndex])._saying, 452, 70, 481, 93)
          ;
          ((((self._list)[uiIndex])._saying):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          (((self._list)[uiIndex])._saying):setRenderTexture((((self._list)[uiIndex])._saying):getBaseTexture())
          checkVoiceChatMicTexture(uiIndex, false)
        end
      end
    end
  end
end

FGlobal_GuildListOnlineCheck = function()
  -- function num : 0_46 , upvalues : _onlineGuildMember
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local memberCount = myGuildListInfo:getMemberCount()
  for index = 0, memberCount - 1 do
    local myGuildMemberInfo = myGuildListInfo:getMember(index)
    if myGuildMemberInfo == nil then
      return 
    end
    if myGuildMemberInfo:isOnline() == true then
      _onlineGuildMember = _onlineGuildMember + 1
    end
  end
end

HandleClicked_GuildMasterMandate = function(index)
  -- function num : 0_47
  local self = GuildListInfoPage
  if not ToClient_IsAbleChangeMaster() then
    return 
  end
  ToClient_RequestChangeGuildMaster(index)
  self:UpdateData()
end

GuildListControl_ChangeTexture_Expiration = function(control, state)
  -- function num : 0_48
  control:ChangeTextureInfoName("new_ui_common_forlua/window/guild/guild_00.dds")
  if state == 2 then
    local x1, y1, x2, y2 = setTextureUV_Func(control, 376, 24, 398, 46)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    local x1, y1, x2, y2 = setTextureUV_Func(control, 399, 24, 421, 46)
    ;
    (control:getOnTexture()):setUV(x1, y1, x2, y2)
    local x1, y1, x2, y2 = setTextureUV_Func(control, 422, 24, 444, 46)
    ;
    (control:getClickTexture()):setUV(x1, y1, x2, y2)
  else
    do
      if state == 0 then
        local x1, y1, x2, y2 = setTextureUV_Func(control, 422, 47, 444, 69)
        ;
        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
        control:setRenderTexture(control:getBaseTexture())
        local x1, y1, x2, y2 = setTextureUV_Func(control, 445, 47, 467, 69)
        ;
        (control:getOnTexture()):setUV(x1, y1, x2, y2)
        local x1, y1, x2, y2 = setTextureUV_Func(control, 468, 47, 490, 69)
        ;
        (control:getClickTexture()):setUV(x1, y1, x2, y2)
      else
        do
          if state == 1 then
            local x1, y1, x2, y2 = setTextureUV_Func(control, 376, 1, 398, 23)
            ;
            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
            control:setRenderTexture(control:getBaseTexture())
            local x1, y1, x2, y2 = setTextureUV_Func(control, 399, 1, 421, 23)
            ;
            (control:getOnTexture()):setUV(x1, y1, x2, y2)
            local x1, y1, x2, y2 = setTextureUV_Func(control, 422, 1, 444, 23)
            ;
            (control:getClickTexture()):setUV(x1, y1, x2, y2)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC659: Confused about usage of register: R64 in 'UnsetPending'

GuildListInfoPage.Show = function(self)
  -- function num : 0_49 , upvalues : _selectSortType, listening_Volume
  if (self._frameDefaultBG):GetShow() == false then
    (self._frameDefaultBG):SetShow(true)
    ;
    (self._scrollBar):SetControlPos(0)
    self:SetGuildList()
    _selectSortType = 0
    self:GuildListSortSet()
    self:UpdateData()
    FGlobal_Notice_Update()
    listening_Volume:SetShow(false)
    ToClient_RequestWarehouseInfo()
    GuildList_PanelResize_ByFontSize()
  end
end

-- DECOMPILER ERROR at PC663: Confused about usage of register: R64 in 'UnsetPending'

GuildListInfoPage.Hide = function(self)
  -- function num : 0_50 , upvalues : IM
  if (self._frameDefaultBG):GetShow() == true then
    (self._frameDefaultBG):SetShow(false)
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
    ClearFocusEdit()
  end
end

FGlobal_GuildListScrollTop = function()
  -- function num : 0_51
  local self = GuildListInfoPage
  ;
  (self._scrollBar):SetControlTop()
end

HandleClicked_SetIncentive = function()
  -- function num : 0_52 , upvalues : IM, incentive_InputMoney, inputGuildDepositNum_s64
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetFocusEdit(incentive_InputMoney)
  inputGuildDepositNum_s64 = toInt64(0, 0)
  incentive_InputMoney:SetEditText("", true)
  incentive_InputMoney:SetNumberMode(true)
end

FGlobal_GuildIncentive_Close = function()
  -- function num : 0_53 , upvalues : IM
  if not Panel_GuildIncentive:GetShow() then
    return 
  end
  ClearFocusEdit()
  Panel_GuildIncentive:SetShow(false)
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

HandleClicked_GuildIncentive_Close = function()
  -- function num : 0_54 , upvalues : IM
  if not Panel_GuildIncentive:GetShow() then
    return 
  end
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
  Panel_GuildIncentive:SetShow(false)
end

HandleClicked_GuildIncentive_Send = function()
  -- function num : 0_55 , upvalues : incentive_InputMoney, _incentivePanelType
  local tempMoney = tonumber(incentive_InputMoney:GetEditText())
  if tempMoney == nil or tempMoney <= 0 or tempMoney == "" then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_VENDINGMACHINE_PERFORM_MESSAGE_0"))
    ClearFocusEdit()
    return 
  end
  if _incentivePanelType == 0 then
    ToClient_DepositToGuildWareHouse(tempMoney)
    ClearFocusEdit()
    FGlobal_GuildIncentive_Close()
  end
end

FGlobal_SaveGuildMoney_Send = function()
  -- function num : 0_56
  HandleClicked_GuildIncentive_Send()
end

FGlobal_CheckSaveGuildMoneyUiEdit = function(targetUI)
  -- function num : 0_57 , upvalues : incentive_InputMoney
  do return targetUI ~= nil and targetUI:GetKey() == incentive_InputMoney:GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_GuildDeposit_InputCheck = function()
  -- function num : 0_58 , upvalues : numberKeyCode, VCK
  for idx,val in ipairs(numberKeyCode) do
    if isKeyDown_Once(val) then
      if idx > 10 then
        _GuildDeposit_InputCheck_Command(idx - 11)
      else
        _GuildDeposit_InputCheck_Command(idx - 1)
      end
    end
  end
  if isKeyDown_Once(VCK.KeyCode_BACK) then
    _GuildDeposit_InputCheck_BackSpaceCommand()
  end
end

_GuildDeposit_InputCheck_Command = function(number)
  -- function num : 0_59 , upvalues : inputGuildDepositNum_s64, inputGuildDepositMaxNum_s64, incentive_InputMoney
  local str = tostring(inputGuildDepositNum_s64)
  local newStr = str .. tostring(number)
  local s64_newNumber = tonumber64(newStr)
  local s64_MAX = inputGuildDepositMaxNum_s64
  if s64_MAX < s64_newNumber then
    inputGuildDepositNum_s64 = inputGuildDepositMaxNum_s64
  else
    inputGuildDepositNum_s64 = s64_newNumber
  end
  incentive_InputMoney:SetEditText(tostring(inputGuildDepositNum_s64), true)
end

_GuildDeposit_InputCheck_BackSpaceCommand = function()
  -- function num : 0_60 , upvalues : inputGuildDepositNum_s64, incentive_InputMoney
  local str = tostring(inputGuildDepositNum_s64)
  local length = strlen(str)
  local newStr = ""
  if length > 1 then
    newStr = substring(str, 1, length - 1)
    inputGuildDepositNum_s64 = tonumber64(newStr)
  else
    newStr = "0"
    inputGuildDepositNum_s64 = (Defines.s64_const).s64_0
  end
  incentive_InputMoney:SetEditText(newStr, true)
end

FGlobal_GuildMenuButtonHide = function()
  -- function num : 0_61
  (GuildListInfoPage._buttonListBG):SetShow(false)
end

GuildList_PanelResize_ByFontSize = function()
  -- function num : 0_62 , upvalues : isVoiceOpen, staticText_charName, staticText_activity, staticText_contributedTendency, staticText_Voice, _constGuildListMaxCount
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 and isVoiceOpen then
    staticText_charName:SetSize(135, 20)
    staticText_charName:SetPosX(210)
    staticText_activity:SetPosX(400)
    staticText_contributedTendency:SetPosX(490)
    staticText_Voice:SetPosX(570)
  else
    staticText_charName:SetSize(235, 20)
    staticText_charName:SetPosX(180)
    staticText_activity:SetPosX(419)
    if isVoiceOpen then
      staticText_contributedTendency:SetPosX(495)
    else
      staticText_contributedTendency:SetPosX(535)
    end
    staticText_Voice:SetPosX(580)
  end
  if isVoiceOpen then
    for index = 0, _constGuildListMaxCount - 1 do
      local rtGuildListInfo = (GuildListInfoPage._list)[index]
      if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
        (rtGuildListInfo._charName):SetSize(120, 20)
        ;
        (rtGuildListInfo._charName):SetPosX(210)
        ;
        (rtGuildListInfo._activity):SetPosX(370)
        ;
        (rtGuildListInfo._contributedTendency):SetPosX(470)
        ;
        (rtGuildListInfo._saying):SetPosX(575)
        ;
        (rtGuildListInfo._listening):SetPosX(597)
      else
        ;
        (rtGuildListInfo._charName):SetSize(240, 20)
        ;
        (rtGuildListInfo._charName):SetPosX(180)
        ;
        (rtGuildListInfo._activity):SetPosX(390)
        ;
        (rtGuildListInfo._contributedTendency):SetPosX(480)
        ;
        (rtGuildListInfo._saying):SetPosX(585)
        ;
        (rtGuildListInfo._listening):SetPosX(607)
      end
    end
  end
end

registerEvent("FromClient_ResponseGuildMasterChange", "FromClient_ResponseGuildMasterChange")
registerEvent("FromClient_ResponseChangeGuildMemberGrade", "FromClient_ResponseChangeGuildMemberGrade")
registerEvent("FromClient_RequestExpelMemberFromGuild", "FromClient_RequestExpelMemberFromGuild")
registerEvent("FromClient_RequestChangeGuildMemberGrade", "FromClient_RequestChangeGuildMemberGrade")
registerEvent("FromClient_ResponseChangeProtectGuildMember", "FromClient_ResponseChangeProtectGuildMember")
FromClient_ResponseGuildMasterChange = function(userNo, targetNo)
  -- function num : 0_63
  local userNum = Int64toInt32(((getSelfPlayer()):get()):getUserNo())
  if userNum == Int64toInt32(userNo) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_MASTERCHANGE_MESSAGE_0"))
  else
    if userNum == Int64toInt32(targetNo) then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_MASTERCHANGE_MESSAGE_1"))
    end
  end
  GuildListInfoPage:UpdateData()
end

FromClient_ResponseChangeGuildMemberGrade = function(targetNo, grade)
  -- function num : 0_64
  local userNum = Int64toInt32(((getSelfPlayer()):get()):getUserNo())
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  do
    if guildWrapper ~= nil then
      local guildGrade = guildWrapper:getGuildGrade()
      -- DECOMPILER ERROR at PC29: Unhandled construct in 'MakeBoolean' P1

      if guildGrade ~= 0 and userNum == Int64toInt32(targetNo) then
        if grade == 1 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GRADECHANGE_MESSAGE_0"))
        else
          if grade == 2 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GRADECHANGE_MESSAGE_1"))
          else
            if grade == 3 then
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_LIST_SUPPLYOFFICER_APPOINTMENT_DO"))
            end
          end
        end
      end
    end
    if userNum == Int64toInt32(targetNo) then
      if grade == 1 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CLAN_GRADECHANGE_MESSAGE_4"))
      else
        if grade == 2 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CLAN_GRADECHANGE_MESSAGE_5"))
        end
      end
    end
    GuildServantList_Close()
    FGlobal_Window_Servant_Update()
    GuildListInfoPage:UpdateData()
  end
end

FromClient_ResponseChangeProtectGuildMember = function(targetNo, isProtectable)
  -- function num : 0_65
  local userNum = Int64toInt32(((getSelfPlayer()):get()):getUserNo())
  if userNum == Int64toInt32(targetNo) then
    if isProtectable == true then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PROTECT_GUILDMEMBER_MESSAGE_0"))
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PROTECT_GUILDMEMBER_MESSAGE_1"))
    end
  end
  GuildServantList_Close()
  FGlobal_Window_Servant_Update()
  GuildListInfoPage:UpdateData()
end

FromClient_RequestExpelMemberFromGuild = function()
  -- function num : 0_66
  if Panel_Window_Guild:GetShow() == true then
    GuildListInfoPage:UpdateData()
  else
    if Panel_ClanList:GetShow() == true then
      FGlobal_ClanList_Update()
    end
  end
  GuildServantList_Close()
  FGlobal_Window_Servant_Update()
end

FromClient_RequestChangeGuildMemberGrade = function(grade)
  -- function num : 0_67
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  do
    if guildWrapper ~= nil then
      local guildGrade = guildWrapper:getGuildGrade()
      if guildGrade ~= 0 then
        if grade == 1 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GRADECHANGE_MESSAGE_2"))
        else
          if grade == 2 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GRADECHANGE_MESSAGE_3"))
          else
            if grade == 3 then
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GRADECHANGE_MESSAGE_4"))
            end
          end
        end
      else
        if grade == 1 then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CLAN_GRADECHANGE_MESSAGE_2"))
        else
          if grade == 2 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CLAN_GRADECHANGE_MESSAGE_3"))
          end
        end
      end
    end
    GuildServantList_Close()
    FGlobal_Window_Servant_Update()
    GuildListInfoPage:UpdateData()
  end
end

HandleClicked_GuildListWelfare_Request = function()
  -- function num : 0_68
  ToClient_RequestGuildWelfare()
end


