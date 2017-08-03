-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\chatting\panel_chatoption.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_CT = CppEnums.ChatType
local UI_CNT = CppEnums.EChatNoticeType
local UI_Group = Defines.UIGroup
local UI_CST = CppEnums.ChatSystemType
Panel_ChatOption:SetShow(false)
Panel_ChatOption:SetIgnore(true)
Panel_ChatOption:ActiveMouseEventEffect(true)
Panel_ChatOption:setGlassBackground(true)
Panel_ChatOption:RegisterShowEventFunc(true, "ChatOption_ShowAni()")
Panel_ChatOption:RegisterShowEventFunc(false, "ChatOption_HideAni()")
Panel_ChatOption:RegisterUpdateFunc("RegisterUpdate_ChatOption")
local isLocalWarOpen = ToClient_IsContentsGroupOpen("43")
local isArshaOpen = ToClient_IsContentsGroupOpen("227")
local isSavageDefenceOpen = ToClient_IsContentsGroupOpen("249")
if not isGameTypeEnglish() then
  local roleplayTypeOpen = isGameServiceTypeDev()
end
local channel_Notice = false
local channel_System = false
local channel_World = false
local channel_Public = false
local channel_Private = false
local channel_Party = false
local channel_Guild = false
local channel_WorldWithItem = false
local channel_Battle = false
local channel_RolePlay = false
local channel_Arsha = false
local channel_Team = false
local color_Notice = UI_color.C_FFFFEF82
local color_World = UI_color.C_FFFF973A
local color_Public = UI_color.C_FFE7E7E7
local color_Private = UI_color.C_FFF601FF
local color_Party = UI_color.C_FF8EBD00
local color_Guild = UI_color.C_FF84FFF5
local color_WorldWithItem = UI_color.C_FF00F3A0
local color_RolePlay = UI_color.C_FF00B4FF
local color_Arsha = UI_color.C_FFFFD237
local color_Team = UI_color.C_FFB97FEF
local savedChatColorIndex = (Array.new)()
local channel_SystemUndefine = false
local channel_SystemPrivateItem = false
local channel_SystemPartyItem = false
local channel_SystemMarket = false
local channel_SystemWorker = false
local channel_SystemHarvest = false
local _alphaPosX = 0
local eChatButtonType = {eChatNotice = 0, eChatWorldWithItem = 1, eChatWorld = 2, eChatGuild = 3, eChatParty = 5, eChatBattle = 4, eChatPublic = 6, eChatPrivate = 7, eChatRolePlay = 8, eChatArsha = 9, eChatTeam = 10}
local eChatSystemButtonType = {eChatSystem = 0, eChatSystemUndefine = 1, eChatSystemPrivateItem = 2, eChatSystemPartyItem = 3, eChatSystemMarket = 4, eChatSystemWorker = 5, eChatSystemHarvest = 6}
local chatOptionData = {makeChatPanelCount = 5, chatFilterCount = 12, chatSystemFilterCount = 7, _slotsCols = 2, slotStartX = 0, slotGapX = 140, slotStartY = 0, slotGapY = 30, slotSystemTypeStartX = 270, slotSystemTypeStartY = 0, slotSystemTypeChildButtonGapX = 20}
local prevFontSizeType = (CppEnums.ChatFontSizeType).eChatFontSizeType_Normal
local isChangeFont = false
local _ChatOption_Title = (UI.getChildControl)(Panel_ChatOption, "StaticText_ChatOptionTitle")
local _msgFilter_BG = (UI.getChildControl)(Panel_ChatOption, "Static_FilterBG")
local msgFilter_Chkbox = (UI.getChildControl)(Panel_ChatOption, "Template_CheckButton_Filter")
local selectColor_btn = (UI.getChildControl)(Panel_ChatOption, "Template_Radiobutton_SelectColor")
local onlySystemSelectColor = (UI.getChildControl)(Panel_ChatOption, "Template_Radiobutton_SystemSelectColor")
local _alpha_0 = (UI.getChildControl)(Panel_ChatOption, "StaticText_PanelTransparency_0")
local _alpha_50 = (UI.getChildControl)(Panel_ChatOption, "StaticText_PanelTransparency_50")
local _alpha_100 = (UI.getChildControl)(Panel_ChatOption, "StaticText_PanelTransparency_100")
local _alphaSlider_Control = (UI.getChildControl)(Panel_ChatOption, "Slider_PanelTransparencyControl")
local _alphaSlider_ControlBTN = (UI.getChildControl)(_alphaSlider_Control, "Slider_PanelTransparency_Button")
local _button_Confirm = (UI.getChildControl)(Panel_ChatOption, "Button_Confirm")
local _button_Cancle = (UI.getChildControl)(Panel_ChatOption, "Button_Cancle")
local _button_Close = (UI.getChildControl)(Panel_ChatOption, "Button_WinClose")
local _button_blockList = (UI.getChildControl)(Panel_ChatOption, "Button_BlockList")
local _button_resetColor = (UI.getChildControl)(Panel_ChatOption, "Button_ResetColor")
local fontSizeTitleBg = (UI.getChildControl)(Panel_ChatOption, "Static_FontSizeTitleBg")
local fontSizeBG = (UI.getChildControl)(Panel_ChatOption, "Static_FontSizeBG")
local rdo_FontSizeSmall = (UI.getChildControl)(Panel_ChatOption, "RadioButton_FontSizeSmall")
local rdo_FontSizeSmall2 = (UI.getChildControl)(Panel_ChatOption, "RadioButton_FontSizeSmall2")
local rdo_FontSizeNormal = (UI.getChildControl)(Panel_ChatOption, "RadioButton_FontSizeNormal")
local rdo_FontSizeNormal2 = (UI.getChildControl)(Panel_ChatOption, "RadioButton_FontSizeNormal2")
local rdo_FontSizeBig = (UI.getChildControl)(Panel_ChatOption, "RadioButton_FontSizeBig")
local stringHeadTitleBg = (UI.getChildControl)(Panel_ChatOption, "Static_StringHeadTitleBg")
local stringHeadBg = (UI.getChildControl)(Panel_ChatOption, "Static_StringHeadBG")
local rdo_CharacterName = (UI.getChildControl)(stringHeadBg, "RadioButton_CharacterName")
local rdo_FamilyName = (UI.getChildControl)(stringHeadBg, "RadioButton_FamilyName")
rdo_CharacterName:addInputEvent("Mouse_LUp", "ChattingOption_SelectNameType( 0 )")
rdo_FamilyName:addInputEvent("Mouse_LUp", "ChattingOption_SelectNameType( 1 )")
local preNameType = nil
local msgFilterBg_SizeY = _msgFilter_BG:GetSizeY()
local panelSizeY = Panel_ChatOption:GetSizeY()
local buttonSizeY = _button_Confirm:GetPosY()
local _buttonQuestion = (UI.getChildControl)(Panel_ChatOption, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Chatting\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Chatting\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Chatting\", \"false\")")
local _check_Division = (UI.getChildControl)(Panel_ChatOption, "Checkbox_DivisionOption")
_check_Division:addInputEvent("Mouse_LUp", "HandleClicked_ChattingDivision()")
local _checkButton_ChatTime = (UI.getChildControl)(Panel_ChatOption, "CheckButton_ChatTime")
local _prevIsCheckChatTime = {}
local btnFilter = (Array.new)()
local btnSystemFilter = (Array.new)()
local chatPanel = (Array.new)()
for i = 0, chatOptionData.makeChatPanelCount - 1 do
  chatPanel[i] = false
end
local ChattingAnimationTitleBg = (UI.getChildControl)(Panel_ChatOption, "Static_AnimationTitleBg")
local ChattingAnimationOptionBg = (UI.getChildControl)(Panel_ChatOption, "Static_AnimationOptionBg")
local rdo_ChattingAnimationOn = (UI.getChildControl)(ChattingAnimationOptionBg, "RadioButton_AnimationOn")
local rdo_ChattingAnimationOff = (UI.getChildControl)(ChattingAnimationOptionBg, "RadioButton_AnimationOff")
local preChattingAnimation = true
HandleClicked_ChattingTypeFilter_Notice = function(panelIdex)
  -- function num : 0_0 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_Notice
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatNotice]).chatFilter):IsCheck()
  channel_Notice = check
end

HandleClicked_ChattingTypeFilter_WorldWithItem = function(panelIdex)
  -- function num : 0_1 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_WorldWithItem
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatWorldWithItem]).chatFilter):IsCheck()
  channel_WorldWithItem = check
end

HandleClicked_ChattingTypeFilter_World = function(panelIdex)
  -- function num : 0_2 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_World
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatWorld]).chatFilter):IsCheck()
  channel_World = check
end

HandleClicked_ChattingTypeFilter_Guild = function(panelIdex)
  -- function num : 0_3 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_Guild
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatGuild]).chatFilter):IsCheck()
  channel_Guild = check
end

HandleClicked_ChattingTypeFilter_Battle = function(panelIndex)
  -- function num : 0_4 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_Battle
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatBattle]).chatFilter):IsCheck()
  channel_Battle = check
end

HandleClicked_ChattingTypeFilter_Party = function(panelIdex)
  -- function num : 0_5 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_Party
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatParty]).chatFilter):IsCheck()
  channel_Party = check
end

HandleClicked_ChattingTypeFilter_Public = function(panelIdex)
  -- function num : 0_6 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_Public
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatPublic]).chatFilter):IsCheck()
  channel_Public = check
end

HandleClicked_ChattingTypeFilter_RolePlay = function(panelIndex)
  -- function num : 0_7 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_RolePlay
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatRolePlay]).chatFilter):IsCheck()
  channel_RolePlay = check
end

HandleClicked_ChattingTypeFilter_Private = function(panelIdex)
  -- function num : 0_8 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_Private
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatPrivate]).chatFilter):IsCheck()
  channel_Private = check
end

HandleClicked_ChattingTypeFilter_Arsha = function(panelIdex)
  -- function num : 0_9 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_Arsha
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatArsha]).chatFilter):IsCheck()
  channel_Arsha = check
end

HandleClicked_ChattingTypeFilter_Team = function(panelIdex)
  -- function num : 0_10 , upvalues : chatOptionData, btnFilter, eChatButtonType, channel_Team
  local self = chatOptionData
  local check = ((btnFilter[eChatButtonType.eChatTeam]).chatFilter):IsCheck()
  channel_Team = check
end

HandleClicked_ChattingColor_Notice = function(panelIndex)
  -- function num : 0_11 , upvalues : chatOptionData, btnFilter, eChatButtonType, UI_color, color_Notice, UI_CT
  local self = chatOptionData
  local checkColor = ((btnFilter[eChatButtonType.eChatNotice]).chatColor):SetColor(UI_color.C_FFFFEF82)
  color_Notice = checkColor
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.Notice, eChatButtonType.eChatNotice, false)
end

HandleClicked_ChattingColor_WorldWithItem = function(panelIndex)
  -- function num : 0_12 , upvalues : chatOptionData, btnFilter, eChatButtonType, UI_color, color_WorldWithItem, UI_CT
  local self = chatOptionData
  local checkColor = ((btnFilter[eChatButtonType.eChatWorldWithItem]).chatColor):SetColor(UI_color.C_FF00F3A0)
  color_WorldWithItem = checkColor
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.WorldWithItem, eChatButtonType.eChatWorldWithItem, false)
end

HandleClicked_ChattingColor_World = function(panelIndex)
  -- function num : 0_13 , upvalues : chatOptionData, btnFilter, eChatButtonType, UI_color, color_World, UI_CT
  local self = chatOptionData
  local checkColor = ((btnFilter[eChatButtonType.eChatWorld]).chatColor):SetColor(UI_color.C_FFFF973A)
  color_World = checkColor
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.World, eChatButtonType.eChatWorld, false)
end

HandleClicked_ChattingColor_Guild = function(panelIndex)
  -- function num : 0_14 , upvalues : chatOptionData, UI_CT, color_Guild, eChatButtonType
  local self = chatOptionData
  local chat = ToClient_getChattingPanel(panelIndex)
  local checkColor = chat:getChatColorIndex(UI_CT.Guild)
  color_Guild = FGlobal_ColorList(checkColor)
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.Guild, eChatButtonType.eChatGuild, false)
end

HandleClicked_ChattingColor_Party = function(panelIndex)
  -- function num : 0_15 , upvalues : chatOptionData, btnFilter, eChatButtonType, UI_color, color_Party, UI_CT
  local self = chatOptionData
  local checkColor = ((btnFilter[eChatButtonType.eChatParty]).chatColor):SetColor(UI_color.C_FF8EBD00)
  color_Party = checkColor
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.Party, eChatButtonType.eChatParty, false)
end

HandleClicked_ChattingColor_Public = function(panelIndex)
  -- function num : 0_16 , upvalues : chatOptionData, btnFilter, eChatButtonType, UI_color, color_Public, UI_CT
  local self = chatOptionData
  local checkColor = ((btnFilter[eChatButtonType.eChatPublic]).chatColor):SetColor(UI_color.C_FFE7E7E7)
  color_Public = checkColor
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.Public, eChatButtonType.eChatPublic, false)
end

HandleClicked_ChattingColor_RolePlay = function(panelIndex)
  -- function num : 0_17 , upvalues : chatOptionData, btnFilter, eChatButtonType, UI_color, color_RolePlay, UI_CT
  local self = chatOptionData
  local checkColor = ((btnFilter[eChatButtonType.eChatRolePlay]).chatColor):SetColor(UI_color.C_FF00B4FF)
  color_RolePlay = checkColor
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.RolePlay, eChatButtonType.eChatRolePlay, false)
end

HandleClicked_ChattingColor_Private = function(panelIndex)
  -- function num : 0_18 , upvalues : chatOptionData, btnFilter, eChatButtonType, UI_color, color_Private, UI_CT
  local self = chatOptionData
  local checkColor = ((btnFilter[eChatButtonType.eChatPrivate]).chatColor):SetColor(UI_color.C_FFF601FF)
  color_Private = checkColor
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.Private, eChatButtonType.eChatPrivate, false)
end

HandleClicked_ChattingColor_Arsha = function(panelIndex)
  -- function num : 0_19 , upvalues : chatOptionData, btnFilter, eChatButtonType, UI_color, color_Arsha, UI_CT
  local self = chatOptionData
  local checkColor = ((btnFilter[eChatButtonType.eChatArsha]).chatColor):SetColor(UI_color.C_FFFFD237)
  color_Arsha = checkColor
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.Arsha, eChatButtonType.eChatArsha, false)
end

HandleClicked_ChattingColor_Team = function(panelIndex)
  -- function num : 0_20 , upvalues : chatOptionData, btnFilter, eChatButtonType, UI_color, color_Team, UI_CT
  local self = chatOptionData
  local checkColor = ((btnFilter[eChatButtonType.eChatTeam]).chatColor):SetColor(UI_color.C_FFB97FEF)
  color_Team = checkColor
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.Team, eChatButtonType.eChatTeam, false)
end

HandleClicked_ChattingColor_MainSystem = function(panelIndex)
  -- function num : 0_21 , upvalues : chatOptionData, UI_CT
  local self = chatOptionData
  FGlobal_ChattingColor_GetColor(panelIndex, UI_CT.System, 0, true)
end

HandleClicked_ChattingDivision = function()
  -- function num : 0_22 , upvalues : _check_Division
  local isCheck = _check_Division:IsCheck()
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).ChatDivision, isCheck)
end

HandleClicked_ChatTime = function(panelIndex)
  -- function num : 0_23 , upvalues : _checkButton_ChatTime
  local isCheck = _checkButton_ChatTime:IsCheck()
  FGlobal_ChatOption_SetIsShowTimeString(panelIndex, isCheck)
end

FGlobal_ChatOption_HandleChattingOptionInitialize = function(panelIndex)
  -- function num : 0_24 , upvalues : _checkButton_ChatTime, _prevIsCheckChatTime
  local currentIsCheckChatTime = FGlobal_ChatOption_GetIsShowTimeString(panelIndex)
  _checkButton_ChatTime:SetCheck(currentIsCheckChatTime)
  _checkButton_ChatTime:addInputEvent("Mouse_LUp", "HandleClicked_ChatTime(" .. panelIndex .. ")")
  local chatCount = ToClient_getChattingPanelCount()
  for ii = 0, chatCount - 1 do
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R7 in 'UnsetPending'

    _prevIsCheckChatTime[ii] = FGlobal_ChatOption_GetIsShowTimeString(ii)
  end
end

setEnableSystemChildButton = function(enabled)
  -- function num : 0_25 , upvalues : chatOptionData, btnSystemFilter, eChatSystemButtonType, UI_color
  local self = chatOptionData
  local check = ((btnSystemFilter[eChatSystemButtonType.eChatSystem]).chatFilter):IsCheck()
  for idx = 1, self.chatSystemFilterCount - 1 do
    ((btnSystemFilter[idx]).chatFilter):SetIgnore(not enabled)
    if not check then
      ((btnSystemFilter[idx]).chatFilter):SetCheck(false)
    end
    if enabled then
      ((btnSystemFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFC4BEBE)
    end
  end
end

HandleClicked_ChattingTypeFilter_System = function(panelIdex)
  -- function num : 0_26 , upvalues : chatOptionData, btnSystemFilter, eChatSystemButtonType, channel_System, channel_SystemUndefine, channel_SystemPrivateItem, channel_SystemPartyItem, channel_SystemMarket, channel_SystemWorker, channel_SystemHarvest
  local self = chatOptionData
  local check = ((btnSystemFilter[eChatSystemButtonType.eChatSystem]).chatFilter):IsCheck()
  channel_System = check
  for idx = 1, self.chatSystemFilterCount - 1 do
    if check then
      ((btnSystemFilter[idx]).chatFilter):SetCheck(true)
      channel_SystemUndefine = true
      channel_SystemPrivateItem = true
      channel_SystemPartyItem = true
      channel_SystemMarket = true
      channel_SystemWorker = true
      channel_SystemHarvest = true
    else
      ;
      ((btnSystemFilter[idx]).chatFilter):SetCheck(false)
    end
  end
  setEnableSystemChildButton(check)
end

HandleClicked_ChattingSystemTypeFilter_Undefine = function(panelIndex)
  -- function num : 0_27 , upvalues : chatOptionData, btnSystemFilter, eChatSystemButtonType, channel_SystemUndefine
  local self = chatOptionData
  local check = ((btnSystemFilter[eChatSystemButtonType.eChatSystemUndefine]).chatFilter):IsCheck()
  channel_SystemUndefine = check
end

HandleClicked_ChattingSystemTypeFilter_PrivateItem = function(panelIndex)
  -- function num : 0_28 , upvalues : chatOptionData, btnSystemFilter, eChatSystemButtonType, channel_SystemPrivateItem
  local self = chatOptionData
  local check = ((btnSystemFilter[eChatSystemButtonType.eChatSystemPrivateItem]).chatFilter):IsCheck()
  channel_SystemPrivateItem = check
end

HandleClicked_ChattingSystemTypeFilter_PartyItem = function(panelIndex)
  -- function num : 0_29 , upvalues : chatOptionData, btnSystemFilter, eChatSystemButtonType, channel_SystemPartyItem
  local self = chatOptionData
  local check = ((btnSystemFilter[eChatSystemButtonType.eChatSystemPartyItem]).chatFilter):IsCheck()
  channel_SystemPartyItem = check
end

HandleClicked_ChattingSystemTypeFilter_Market = function(panelIndex)
  -- function num : 0_30 , upvalues : chatOptionData, btnSystemFilter, eChatSystemButtonType, channel_SystemMarket
  local self = chatOptionData
  local check = ((btnSystemFilter[eChatSystemButtonType.eChatSystemMarket]).chatFilter):IsCheck()
  channel_SystemMarket = check
end

HandleClicked_ChattingSystemTypeFilter_Worker = function(panelIndex)
  -- function num : 0_31 , upvalues : chatOptionData, btnSystemFilter, eChatSystemButtonType, channel_SystemWorker
  local self = chatOptionData
  local check = ((btnSystemFilter[eChatSystemButtonType.eChatSystemWorker]).chatFilter):IsCheck()
  channel_SystemWorker = check
end

HandleClicked_ChattingSystemTypeFilter_Harvest = function(panelIndex)
  -- function num : 0_32 , upvalues : chatOptionData, btnSystemFilter, eChatSystemButtonType, channel_SystemHarvest
  local self = chatOptionData
  local check = ((btnSystemFilter[eChatSystemButtonType.eChatSystemHarvest]).chatFilter):IsCheck()
  channel_SystemHarvest = check
end

createCheckBoxButton = function(btnObject, buttonName, buttonText, isCheck, posX, posY, fontColor, index)
  -- function num : 0_33 , upvalues : _msgFilter_BG, msgFilter_Chkbox
  btnObject.chatFilter = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_CHECKBUTTON, _msgFilter_BG, buttonName)
  CopyBaseProperty(msgFilter_Chkbox, btnObject.chatFilter)
  ;
  (btnObject.chatFilter):SetText(buttonText)
  ;
  (btnObject.chatFilter):SetCheck(isCheck)
  ;
  (btnObject.chatFilter):SetPosX(posX)
  ;
  (btnObject.chatFilter):SetPosY(posY)
  ;
  (btnObject.chatFilter):SetFontColor(fontColor)
  ;
  (btnObject.chatFilter):SetShow(true)
end

createRadioButton = function(btnObject, buttonName, posX, posY, setColor, index)
  -- function num : 0_34 , upvalues : _msgFilter_BG, onlySystemSelectColor
  btnObject.chatColor = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, _msgFilter_BG, buttonName)
  CopyBaseProperty(onlySystemSelectColor, btnObject.chatColor)
  ;
  (btnObject.chatColor):SetPosX(posX)
  ;
  (btnObject.chatColor):SetPosY(posY)
  ;
  (btnObject.chatColor):SetShow(true)
end

local optionCount = 0
ChattingOption_Initialize = function(panelIdex, _transparency, isCombinedMainPanel)
  -- function num : 0_35 , upvalues : chatOptionData, _ChatOption_Title, selectColor_btn, onlySystemSelectColor, _msgFilter_BG, chatPanel, msgFilter_Chkbox, eChatButtonType, roleplayTypeOpen, isArshaOpen, isLocalWarOpen, btnFilter, UI_color, UI_CT, isSavageDefenceOpen, btnSystemFilter, eChatSystemButtonType, UI_CST, optionCount, panelSizeY, msgFilterBg_SizeY, _button_Confirm, buttonSizeY, _button_Cancle, _button_blockList, _button_resetColor, fontSizeTitleBg, fontSizeBG, rdo_FontSizeSmall, rdo_FontSizeSmall2, rdo_FontSizeNormal, rdo_FontSizeNormal2, rdo_FontSizeBig, stringHeadTitleBg, stringHeadBg, channel_Notice, channel_World, channel_Public, channel_Private, channel_Party, channel_Guild, channel_WorldWithItem, channel_Battle, channel_Arsha, channel_Team, channel_RolePlay, channel_System, channel_SystemUndefine, channel_SystemPrivateItem, channel_SystemPartyItem, channel_SystemMarket, channel_SystemWorker, channel_SystemHarvest, _alphaSlider_ControlBTN, _alphaSlider_Control, _alpha_0, _alpha_50, _alpha_100, _check_Division, _button_Close
  local self = chatOptionData
  _ChatOption_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHATTING_OPTION_TITLE", "panel_Index", panelIdex + 1))
  local chat = ToClient_getChattingPanel(panelIdex)
  selectColor_btn:SetShow(false)
  onlySystemSelectColor:SetShow(false)
  _msgFilter_BG:AddChild(onlySystemSelectColor)
  Panel_ChatOption:RemoveControl(onlySystemSelectColor)
  local index = 0
  if not chatPanel[panelIdex] then
    local optionCount = 0
    local idx = 0
    for idx = 0, self.chatFilterCount - 1 do
      local tempBtn = {}
      tempBtn.chatFilter = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_CHECKBUTTON, _msgFilter_BG, "ChatOption_Btn_" .. idx .. "_" .. panelIdex)
      CopyBaseProperty(msgFilter_Chkbox, tempBtn.chatFilter)
      ;
      (tempBtn.chatFilter):SetShow(false)
      tempBtn.chatColor = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, _msgFilter_BG, "ChatOption_Color_Btn_" .. idx .. "_" .. panelIdex)
      CopyBaseProperty(selectColor_btn, tempBtn.chatColor)
      ;
      (tempBtn.chatColor):SetShow(false)
      local isRoleplay = (eChatButtonType.eChatRolePlay == idx and not roleplayTypeOpen)
      local isOpen = isGameTypeRussia()
      -- DECOMPILER ERROR at PC109: Unhandled construct in 'MakeBoolean' P1

      if (isGameTypeTaiwan() or isGameTypeJapan()) and idx >= 10 then
        if isArshaOpen then
          index = idx - 1
        else
          index = idx - 2
        end
      else
        index = idx
      end
      if isGameTypeKorea() and not isGameServiceTypeDev() then
        if idx >= 8 then
          index = idx - 1
        else
          index = idx
        end
      elseif isGameServiceTypeDev() or isGameTypeEnglish() then
        if idx >= 9 then
          if isLocalWarOpen or isArshaOpen then
            index = idx
          else
            index = idx - 1
          end
        else
          index = idx
        end
      elseif isGameTypeRussia() then
        if idx > 1 then
          if idx > 8 then
            index = idx - 2
          else
            index = idx - 1
          end
        else
          index = idx
        end
      elseif isGameTypeJapan() then
        if idx >= 8 then
          index = idx - 1
        else
          index = idx
        end
      elseif isGameTypeKR2() then
        index = idx
      elseif isGameTypeSA() then
        if idx >= 8 then
          index = idx - 1
        else
          index = idx
        end
      else
        index = idx
      end
      local row = (math.floor)(index / self._slotsCols)
      local col = index % self._slotsCols
      optionCount = index + 1
      ;
      (tempBtn.chatFilter):SetPosX(self.slotStartX + self.slotGapX * col)
      ;
      (tempBtn.chatFilter):SetPosY(self.slotStartY + self.slotGapY * row)
      -- DECOMPILER ERROR at PC214: Confused about usage of register: R17 in 'UnsetPending'

      btnFilter[idx] = tempBtn
      if eChatButtonType.eChatNotice == idx then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFFFEF82)
        ;
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Notice))
        ;
        ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_GAME, "CHATTING_NOTICE"))
        ;
        ((btnFilter[idx]).chatFilter):SetShow(true)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_Notice( " .. panelIdex .. " )")
      elseif eChatButtonType.eChatWorldWithItem == idx then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF00F3A0)
        ;
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.WorldWithItem))
        ;
        ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_GAME, "CHATTING_TAB_WORLD"))
        ;
        ((btnFilter[idx]).chatFilter):SetShow(not isOpen)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_WorldWithItem( " .. panelIdex .. " )")
      elseif eChatButtonType.eChatWorld == idx then
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.World))
        ;
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFFF973A)
        if not isOpen then
          ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHATTING_OPTION_FILTER_CHANNELGROUP"))
        else
          ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_GAME, "CHATTING_TAB_WORLD"))
        end
        ;
        ((btnFilter[idx]).chatFilter):SetShow(true)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_World( " .. panelIdex .. " )")
      elseif eChatButtonType.eChatGuild == idx then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF84FFF5)
        ;
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Guild))
        ;
        ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_GAME, "CHATTING_TAB_GUILD"))
        ;
        ((btnFilter[idx]).chatFilter):SetShow(true)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_Guild( " .. panelIdex .. " )")
      elseif eChatButtonType.eChatParty == idx then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF8EBD00)
        ;
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Party))
        ;
        ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_GAME, "CHATTING_TAB_PARTY"))
        ;
        ((btnFilter[idx]).chatFilter):SetShow(true)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_Party( " .. panelIdex .. " )")
      elseif eChatButtonType.eChatBattle == idx then
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Battle))
        ;
        ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHATTING_OPTION_FILTER_BATTLE"))
        ;
        ((btnFilter[idx]).chatFilter):SetShow(true)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_Battle( " .. panelIdex .. " )")
        ;
        ((btnFilter[idx]).chatColor):SetShow(false)
        ;
        ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      elseif eChatButtonType.eChatPublic == idx then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFE7E7E7)
        ;
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Public))
        ;
        ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_GAME, "CHATTING_TAB_GENERAL"))
        ;
        ((btnFilter[idx]).chatFilter):SetShow(true)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_Public( " .. panelIdex .. " )")
      elseif eChatButtonType.eChatRolePlay == idx then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF00B4FF)
        ;
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.RolePlay))
        ;
        ((btnFilter[idx]).chatFilter):SetText("RolePlay")
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_RolePlay( " .. panelIdex .. " )")
        ;
        ((btnFilter[idx]).chatFilter):SetShow(roleplayTypeOpen)
        ;
        ((btnFilter[idx]).chatColor):SetShow(roleplayTypeOpen)
      elseif eChatButtonType.eChatPrivate == idx then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFF601FF)
        ;
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Private))
        ;
        ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_GAME, "CHATTING_TAB_WHISPER"))
        ;
        ((btnFilter[idx]).chatFilter):SetShow(true)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_Private( " .. panelIdex .. " )")
      elseif eChatButtonType.eChatArsha == idx then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFFFD237)
        ;
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Arsha))
        ;
        ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHATTING_OPTION_FILTER_ARSHA"))
        ;
        ((btnFilter[idx]).chatFilter):SetShow(isArshaOpen)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_Arsha( " .. panelIdex .. " )")
        ;
        ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_Arsha( " .. panelIdex .. ")")
      elseif eChatButtonType.eChatTeam == idx then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFB97FEF)
        ;
        ((btnFilter[idx]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Team))
        ;
        ((btnFilter[idx]).chatFilter):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHATTING_OPTION_FILTER_TEAM"))
        ;
        ((btnFilter[idx]).chatFilter):SetShow(isArshaOpen or isLocalWarOpen or isSavageDefenceOpen)
        ;
        ((btnFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_Team( " .. panelIdex .. " )")
        ;
        ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_Team( " .. panelIdex .. ")")
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosY(self.slotStartY + self.slotGapY * row)
    end
    local posX = 0
    local posY = 0
    for idx = 0, self.chatSystemFilterCount - 1 do
      posX = self.slotSystemTypeStartX
      posY = self.slotSystemTypeStartY + idx * self.slotGapY
      -- DECOMPILER ERROR at PC818: Confused about usage of register: R14 in 'UnsetPending'

      btnSystemFilter[idx] = {}
      if eChatSystemButtonType.eChatSystem == idx then
        createCheckBoxButton(btnSystemFilter[idx], "ChatSystemOption_Btn_" .. idx .. "_" .. panelIdex, PAGetString(Defines.StringSheet_GAME, "CHATTING_TAB_SYSTEM"), chat:isShowChatType(UI_CT.System), posX, posY, UI_color.C_FFEFEFEF, idx)
        ;
        ((btnSystemFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingTypeFilter_System( " .. panelIdex .. " )")
        createRadioButton(btnSystemFilter[idx], "ChatSystemOption_Color_" .. idx .. "_" .. panelIdex, posX, posY, UI_color.C_FFEFEFEF, idx)
        local chatColorIndex = chat:getChatSystemColorIndex(UI_CT.System)
        if chatColorIndex == -1 then
          ((btnSystemFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFC4BEBE)
          ;
          ((btnSystemFilter[idx]).chatColor):SetColor(UI_color.C_FFC4BEBE)
        else
          ((btnSystemFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
          ;
          ((btnSystemFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
        end
        ;
        ((btnSystemFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_MainSystem( " .. panelIdex .. " )")
        ;
        ((btnSystemFilter[idx]).chatColor):SetPosY(posY)
        ;
        ((btnSystemFilter[idx]).chatColor):SetPosX(((btnSystemFilter[idx]).chatFilter):GetPosX() + ((btnSystemFilter[idx]).chatFilter):GetSizeX() + ((btnSystemFilter[idx]).chatFilter):GetTextSizeX() + 10)
      elseif eChatSystemButtonType.eChatSystemUndefine == idx then
        createCheckBoxButton(btnSystemFilter[idx], "ChatSystemOption_Btn_" .. idx .. "_" .. panelIdex, PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_TAB_SYSTEM_UNDEFINE"), chat:isShowChatSystemType(UI_CST.Undefine), posX + self.slotSystemTypeChildButtonGapX, posY, UI_color.C_FFC4BEBE)
        ;
        ((btnSystemFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingSystemTypeFilter_Undefine( " .. panelIdex .. " )")
      elseif eChatSystemButtonType.eChatSystemPrivateItem == idx then
        createCheckBoxButton(btnSystemFilter[idx], "ChatSystemOption_Btn_" .. idx .. "_" .. panelIdex, PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_TAB_SYSTEM_PRIVATEITEM"), chat:isShowChatSystemType(UI_CST.PrivateItem), posX + self.slotSystemTypeChildButtonGapX, posY, UI_color.C_FFC4BEBE)
        ;
        ((btnSystemFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingSystemTypeFilter_PrivateItem( " .. panelIdex .. " )")
      elseif eChatSystemButtonType.eChatSystemPartyItem == idx then
        createCheckBoxButton(btnSystemFilter[idx], "ChatSystemOption_Btn_" .. idx .. "_" .. panelIdex, PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_TAB_SYSTEM_PARTYITEM"), chat:isShowChatSystemType(UI_CST.PartyItem), posX + self.slotSystemTypeChildButtonGapX, posY, UI_color.C_FFC4BEBE)
        ;
        ((btnSystemFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingSystemTypeFilter_PartyItem( " .. panelIdex .. " )")
      elseif eChatSystemButtonType.eChatSystemMarket == idx then
        createCheckBoxButton(btnSystemFilter[idx], "ChatSystemOption_Btn_" .. idx .. "_" .. panelIdex, PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_TAB_SYSTEM_MARKET"), chat:isShowChatSystemType(UI_CST.Market), posX + self.slotSystemTypeChildButtonGapX, posY, UI_color.C_FFC4BEBE)
        ;
        ((btnSystemFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingSystemTypeFilter_Market( " .. panelIdex .. " )")
      elseif eChatSystemButtonType.eChatSystemWorker == idx then
        createCheckBoxButton(btnSystemFilter[idx], "ChatSystemOption_Btn_" .. idx .. "_" .. panelIdex, PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_TAB_SYSTEM_WORKER"), chat:isShowChatSystemType(UI_CST.Worker), posX + self.slotSystemTypeChildButtonGapX, posY, UI_color.C_FFC4BEBE)
        ;
        ((btnSystemFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingSystemTypeFilter_Worker( " .. panelIdex .. " )")
      elseif eChatSystemButtonType.eChatSystemHarvest == idx then
        createCheckBoxButton(btnSystemFilter[idx], "ChatSystemOption_Btn_" .. idx .. "_" .. panelIdex, PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_TAB_SYSTEM_HARVEST"), chat:isShowChatSystemType(UI_CST.Harvest), posX + self.slotSystemTypeChildButtonGapX, posY, UI_color.C_FFC4BEBE)
        ;
        ((btnSystemFilter[idx]).chatFilter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingSystemTypeFilter_Harvest( " .. panelIdex .. " )")
      else
        _PA_LOG("�\128형욱", "처리되지 않은 eChatSystemButtonType Index : " .. idx)
      end
    end
    -- DECOMPILER ERROR at PC1183: Confused about usage of register: R10 in 'UnsetPending'

    chatPanel[panelIdex] = true
  end
  for idx = 0, self.chatFilterCount - 1 do
    if eChatButtonType.eChatNotice == idx then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.Notice)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFFFEF82)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFFFEF82)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_Notice(" .. panelIdex .. ")")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    elseif eChatButtonType.eChatWorldWithItem == idx then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.WorldWithItem)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF00F3A0)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FF00F3A0)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_WorldWithItem( " .. panelIdex .. ")")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    elseif eChatButtonType.eChatWorld == idx then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.World)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFFF973A)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFFF973A)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_World( " .. panelIdex .. ")")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    elseif eChatButtonType.eChatGuild == idx then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.Guild)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF84FFF5)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FF84FFF5)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_Guild( " .. panelIdex .. ")")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    elseif eChatButtonType.eChatParty == idx then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.Party)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF8EBD00)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FF8EBD00)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_Party( " .. panelIdex .. ")")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    elseif eChatButtonType.eChatPublic == idx then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.Public)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFE7E7E7)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFE7E7E7)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_Public( " .. panelIdex .. " )")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    elseif eChatButtonType.eChatRolePlay == idx and roleplayTypeOpen then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.RolePlay)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF00B4FF)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FF00B4FF)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_RolePlay( " .. panelIdex .. " )")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    end
    if eChatButtonType.eChatPrivate == idx then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.Private)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFF601FF)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFF601FF)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_Private( " .. panelIdex .. " )")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    elseif eChatButtonType.eChatArsha == idx and isArshaOpen then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.Arsha)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFFFD237)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFFFD237)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_Arsha( " .. panelIdex .. ")")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    end
    if eChatButtonType.eChatTeam == idx and (isArshaOpen or isLocalWarOpen or isSavageDefenceOpen) then
      local chatColorIndex = chat:getChatColorIndex(UI_CT.Team)
      if chatColorIndex == -1 then
        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFB97FEF)
        ;
        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFB97FEF)
      else
        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
      ;
      ((btnFilter[idx]).chatColor):SetPosX(((btnFilter[idx]).chatFilter):GetPosX() + ((btnFilter[idx]).chatFilter):GetSizeX() + ((btnFilter[idx]).chatFilter):GetTextSizeX() + 10)
      ;
      ((btnFilter[idx]).chatColor):addInputEvent("Mouse_LUp", "HandleClicked_ChattingColor_Team( " .. panelIdex .. ")")
      ;
      ((btnFilter[idx]).chatColor):SetShow(true)
    end
  end
  local optionLineCount = (math.ceil)(optionCount / self._slotsCols)
  do
    local lineGapY = 40
    if optionLineCount < self.chatSystemFilterCount then
      optionLineCount = self.chatSystemFilterCount
    end
    if optionLineCount < 5 then
      optionLineCount = 5
    end
    Panel_ChatOption:SetSize(Panel_ChatOption:GetSizeX(), panelSizeY + (optionLineCount - 5) * lineGapY)
    _msgFilter_BG:SetSize(_msgFilter_BG:GetSizeX(), msgFilterBg_SizeY + (optionLineCount - 5) * lineGapY)
    _button_Confirm:SetPosY(buttonSizeY + (optionLineCount - 5) * lineGapY)
    _button_Cancle:SetPosY(buttonSizeY + (optionLineCount - 5) * lineGapY)
    _button_blockList:SetPosY(buttonSizeY + (optionLineCount - 5) * lineGapY)
    _button_resetColor:SetPosY(buttonSizeY + (optionLineCount - 5) * lineGapY)
    fontSizeTitleBg:ComputePos()
    fontSizeBG:SetSize(fontSizeBG:GetSizeX(), 35)
    fontSizeBG:ComputePos()
    rdo_FontSizeSmall:ComputePos()
    rdo_FontSizeSmall2:ComputePos()
    rdo_FontSizeNormal:ComputePos()
    rdo_FontSizeNormal2:ComputePos()
    rdo_FontSizeBig:ComputePos()
    stringHeadTitleBg:ComputePos()
    stringHeadBg:ComputePos()
    ;
    ((btnFilter[eChatButtonType.eChatNotice]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Notice))
    ;
    ((btnFilter[eChatButtonType.eChatWorldWithItem]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.WorldWithItem))
    ;
    ((btnFilter[eChatButtonType.eChatWorld]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.World))
    ;
    ((btnFilter[eChatButtonType.eChatParty]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Party))
    ;
    ((btnFilter[eChatButtonType.eChatPublic]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Public))
    ;
    ((btnFilter[eChatButtonType.eChatGuild]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Guild))
    ;
    ((btnFilter[eChatButtonType.eChatPrivate]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Private))
    ;
    ((btnFilter[eChatButtonType.eChatBattle]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Battle))
    if isArshaOpen then
      ((btnFilter[eChatButtonType.eChatArsha]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Arsha))
      ;
      ((btnFilter[eChatButtonType.eChatTeam]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.Team))
    end
    if roleplayTypeOpen then
      ((btnFilter[eChatButtonType.eChatRolePlay]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.RolePlay))
    end
    ;
    ((btnSystemFilter[eChatSystemButtonType.eChatSystem]).chatFilter):SetCheck(chat:isShowChatType(UI_CT.System))
    ;
    ((btnSystemFilter[eChatSystemButtonType.eChatSystemUndefine]).chatFilter):SetCheck(chat:isShowChatSystemType(UI_CST.Undefine))
    ;
    ((btnSystemFilter[eChatSystemButtonType.eChatSystemPrivateItem]).chatFilter):SetCheck(chat:isShowChatSystemType(UI_CST.PrivateItem))
    ;
    ((btnSystemFilter[eChatSystemButtonType.eChatSystemPartyItem]).chatFilter):SetCheck(chat:isShowChatSystemType(UI_CST.PartyItem))
    ;
    ((btnSystemFilter[eChatSystemButtonType.eChatSystemMarket]).chatFilter):SetCheck(chat:isShowChatSystemType(UI_CST.Market))
    ;
    ((btnSystemFilter[eChatSystemButtonType.eChatSystemWorker]).chatFilter):SetCheck(chat:isShowChatSystemType(UI_CST.Worker))
    ;
    ((btnSystemFilter[eChatSystemButtonType.eChatSystemHarvest]).chatFilter):SetCheck(chat:isShowChatSystemType(UI_CST.Harvest))
    channel_Notice = chat:isShowChatType(UI_CT.Notice)
    channel_World = chat:isShowChatType(UI_CT.World)
    channel_Public = chat:isShowChatType(UI_CT.Public)
    channel_Private = chat:isShowChatType(UI_CT.Private)
    channel_Party = chat:isShowChatType(UI_CT.Party)
    channel_Guild = chat:isShowChatType(UI_CT.Guild)
    channel_WorldWithItem = chat:isShowChatType(UI_CT.WorldWithItem)
    channel_Battle = chat:isShowChatType(UI_CT.Battle)
    channel_Arsha = chat:isShowChatType(UI_CT.Arsha)
    channel_Team = chat:isShowChatType(UI_CT.Team)
    if roleplayTypeOpen then
      channel_RolePlay = chat:isShowChatType(UI_CT.RolePlay)
    end
    channel_System = chat:isShowChatType(UI_CT.System)
    setEnableSystemChildButton(channel_System)
    channel_SystemUndefine = chat:isShowChatSystemType(UI_CST.Undefine)
    channel_SystemPrivateItem = chat:isShowChatSystemType(UI_CST.PrivateItem)
    channel_SystemPartyItem = chat:isShowChatSystemType(UI_CST.PartyItem)
    channel_SystemMarket = chat:isShowChatSystemType(UI_CST.Market)
    channel_SystemWorker = chat:isShowChatSystemType(UI_CST.Worker)
    channel_SystemHarvest = chat:isShowChatSystemType(UI_CST.Harvest)
    _alphaSlider_ControlBTN:addInputEvent("Mouse_LPress", "HandleClicked_ChattingSetTransparency(" .. panelIdex .. ")")
    _alphaSlider_ControlBTN:SetPosX((_alphaSlider_Control:GetSizeX() - _alphaSlider_ControlBTN:GetSizeX()) / 100 * _transparency * 100)
    if isCombinedMainPanel == true and panelIdex ~= 0 then
      _alphaSlider_Control:SetEnable(false)
      _alphaSlider_Control:SetMonoTone(true)
      _alphaSlider_ControlBTN:SetEnable(false)
      _alphaSlider_ControlBTN:SetMonoTone(true)
      _alpha_0:SetShow(false)
      _alpha_50:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_OPTION_SUBPANEL_TRANSPARENCY_NOTIFY"))
      _alpha_100:SetShow(false)
    else
      _alphaSlider_Control:SetEnable(true)
      _alphaSlider_Control:SetMonoTone(false)
      _alphaSlider_ControlBTN:SetEnable(true)
      _alphaSlider_ControlBTN:SetMonoTone(false)
      _alpha_0:SetShow(true)
      _alpha_50:SetText("50%")
      _alpha_100:SetShow(true)
    end
    if not (ToClient_getGameUIManagerWrapper()):hasLuaCacheDataList((CppEnums.GlobalUIOptionType).ChatDivision) then
      _check_Division:SetCheck(true)
      ;
      (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).ChatDivision, true)
    else
      _check_Division:SetCheck((ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).ChatDivision))
    end
    _button_resetColor:addInputEvent("Mouse_LUp", "HandledClicked_ChattingColorReset(" .. panelIdex .. ")")
    _button_Confirm:addInputEvent("Mouse_LUp", "HandleClicked_ChattingOption_SetFilter( " .. panelIdex .. " )")
    _button_Cancle:addInputEvent("Mouse_LUp", "ChattingOption_Close()")
    _button_Close:addInputEvent("Mouse_LUp", "ChattingOption_Close()")
    _button_blockList:addInputEvent("Mouse_LUp", "ChattingOption_ShowBlockList()")
    rdo_FontSizeSmall:addInputEvent("Mouse_LUp", "ChattingOption_SelectFontSize( 10 )")
    rdo_FontSizeSmall2:addInputEvent("Mouse_LUp", "ChattingOption_SelectFontSize( 12 )")
    rdo_FontSizeNormal:addInputEvent("Mouse_LUp", "ChattingOption_SelectFontSize( 14 )")
    rdo_FontSizeNormal2:addInputEvent("Mouse_LUp", "ChattingOption_SelectFontSize( 18 )")
    rdo_FontSizeBig:addInputEvent("Mouse_LUp", "ChattingOption_SelectFontSize( 20 )")
    ChattingOption_InitailizeChattingAnimationControl()
    FGlobal_ChatOption_HandleChattingOptionInitialize(panelIdex)
    -- DECOMPILER ERROR: 87 unprocessed JMP targets
  end
end

HandledClicked_ChattingColorReset = function(panelIndex)
  -- function num : 0_36 , upvalues : chatOptionData, UI_CT, eChatSystemButtonType, btnSystemFilter, UI_color, eChatButtonType, btnFilter, roleplayTypeOpen
  local self = chatOptionData
  local chat = ToClient_getChattingPanel(panelIndex)
  chat:setChatColor(UI_CT.Notice, -1)
  chat:setChatColor(UI_CT.World, -1)
  chat:setChatColor(UI_CT.Public, -1)
  chat:setChatColor(UI_CT.Private, -1)
  chat:setChatColor(UI_CT.Party, -1)
  chat:setChatColor(UI_CT.Guild, -1)
  chat:setChatColor(UI_CT.WorldWithItem, -1)
  chat:setChatColor(UI_CT.RolePlay, -1)
  chat:setChatColor(UI_CT.Arsha, -1)
  chat:setChatColor(UI_CT.Team, -1)
  chat:setChatSystemColorIndex(UI_CT.System, -1)
  do
    if eChatSystemButtonType.eChatSystem == 0 then
      local chatColorIndex = chat:getChatSystemColorIndex(UI_CT.System)
      if chatColorIndex == -1 then
        ((btnSystemFilter[0]).chatFilter):SetFontColor(UI_color.C_FFC4BEBE)
        ;
        ((btnSystemFilter[0]).chatColor):SetColor(UI_color.C_FFC4BEBE)
      else
        ;
        ((btnSystemFilter[0]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
        ;
        ((btnSystemFilter[0]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
      end
    end
    for idx = 0, self.chatFilterCount - 1 do
      if eChatButtonType.eChatNotice == idx then
        local chatColorIndex = chat:getChatColorIndex(UI_CT.Notice)
        if chatColorIndex == -1 then
          ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFFFEF82)
          ;
          ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFFFEF82)
        else
          ;
          ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
          ;
          ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
        end
      else
        do
          if eChatButtonType.eChatWorldWithItem == idx then
            local chatColorIndex = chat:getChatColorIndex(UI_CT.WorldWithItem)
            if chatColorIndex == -1 then
              ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF00F3A0)
              ;
              ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FF00F3A0)
            else
              ;
              ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
              ;
              ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
            end
          else
            do
              if eChatButtonType.eChatWorld == idx then
                local chatColorIndex = chat:getChatColorIndex(UI_CT.World)
                if chatColorIndex == -1 then
                  ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFFF973A)
                  ;
                  ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFFF973A)
                else
                  ;
                  ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
                  ;
                  ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
                end
              else
                do
                  if eChatButtonType.eChatGuild == idx then
                    local chatColorIndex = chat:getChatColorIndex(UI_CT.Guild)
                    if chatColorIndex == -1 then
                      ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF84FFF5)
                      ;
                      ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FF84FFF5)
                    else
                      ;
                      ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
                      ;
                      ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
                    end
                  else
                    do
                      if eChatButtonType.eChatParty == idx then
                        local chatColorIndex = chat:getChatColorIndex(UI_CT.Party)
                        if chatColorIndex == -1 then
                          ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF8EBD00)
                          ;
                          ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FF8EBD00)
                        else
                          ;
                          ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
                          ;
                          ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
                        end
                      else
                        do
                          if eChatButtonType.eChatPublic == idx then
                            local chatColorIndex = chat:getChatColorIndex(UI_CT.Public)
                            if chatColorIndex == -1 then
                              ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFE7E7E7)
                              ;
                              ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFE7E7E7)
                            else
                              ;
                              ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
                              ;
                              ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
                            end
                          else
                            do
                              do
                                if eChatButtonType.eChatRolePlay == idx and roleplayTypeOpen then
                                  local chatColorIndex = chat:getChatColorIndex(UI_CT.RolePlay)
                                  if chatColorIndex == -1 then
                                    ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FF00B4FF)
                                    ;
                                    ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FF00B4FF)
                                  else
                                    ;
                                    ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
                                    ;
                                    ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
                                  end
                                end
                                if eChatButtonType.eChatPrivate == idx then
                                  local chatColorIndex = chat:getChatColorIndex(UI_CT.Private)
                                  if chatColorIndex == -1 then
                                    ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFF601FF)
                                    ;
                                    ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFF601FF)
                                  else
                                    ;
                                    ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
                                    ;
                                    ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
                                  end
                                else
                                  do
                                    if eChatButtonType.eChatArsha == idx then
                                      local chatColorIndex = chat:getChatColorIndex(UI_CT.Arsha)
                                      if chatColorIndex == -1 then
                                        ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFFFD237)
                                        ;
                                        ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFFFD237)
                                      else
                                        ;
                                        ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
                                        ;
                                        ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
                                      end
                                    else
                                      do
                                        do
                                          if eChatButtonType.eChatTeam == idx then
                                            local chatColorIndex = chat:getChatColorIndex(UI_CT.Team)
                                            if chatColorIndex == -1 then
                                              ((btnFilter[idx]).chatFilter):SetFontColor(UI_color.C_FFB97FEF)
                                              ;
                                              ((btnFilter[idx]).chatColor):SetColor(UI_color.C_FFB97FEF)
                                            else
                                              ;
                                              ((btnFilter[idx]).chatFilter):SetFontColor(FGlobal_ColorList(chatColorIndex))
                                              ;
                                              ((btnFilter[idx]).chatColor):SetColor(FGlobal_ColorList(chatColorIndex))
                                            end
                                          end
                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out DO_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out DO_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out DO_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out DO_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out DO_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out DO_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out DO_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out DO_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out DO_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                          -- DECOMPILER ERROR at PC527: LeaveBlock: unexpected jumping out IF_STMT

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
    end
  end
end

HandleClicked_ChattingSetTransparency = function(penelIdex)
  -- function num : 0_37 , upvalues : _alphaSlider_ControlBTN, _alphaSlider_Control
  local _transparency = _alphaSlider_ControlBTN:GetPosX() / (_alphaSlider_Control:GetSizeX() - _alphaSlider_ControlBTN:GetSizeX())
  FGlobal_Chatting_PanelTransparency(penelIdex, _transparency, true)
end

HandleClicked_ChattingOption_SetFilter = function(panelIdex)
  -- function num : 0_38 , upvalues : UI_CT, channel_Notice, channel_System, channel_World, channel_Public, channel_Private, channel_Party, channel_Guild, channel_WorldWithItem, channel_Battle, channel_RolePlay, channel_Arsha, channel_Team, UI_CST, channel_SystemUndefine, channel_SystemPrivateItem, channel_SystemPartyItem, channel_SystemMarket, channel_SystemWorker, channel_SystemHarvest, prevFontSizeType, _alphaSlider_ControlBTN, _alphaSlider_Control, _checkButton_ChatTime, _prevIsCheckChatTime
  local chat = ToClient_getChattingPanel(panelIdex)
  chat:setShowChatType(UI_CT.Notice, channel_Notice)
  chat:setShowChatType(UI_CT.System, channel_System)
  chat:setShowChatType(UI_CT.World, channel_World)
  chat:setShowChatType(UI_CT.Public, channel_Public)
  chat:setShowChatType(UI_CT.Private, channel_Private)
  chat:setShowChatType(UI_CT.Party, channel_Party)
  chat:setShowChatType(UI_CT.Guild, channel_Guild)
  chat:setShowChatType(UI_CT.WorldWithItem, channel_WorldWithItem)
  chat:setShowChatType(UI_CT.Battle, channel_Battle)
  chat:setShowChatType(UI_CT.RolePlay, channel_RolePlay)
  chat:setShowChatType(UI_CT.Arsha, channel_Arsha)
  chat:setShowChatType(UI_CT.Team, channel_Team)
  chat:setShowChatSystemType(UI_CST.Undefine, channel_SystemUndefine)
  chat:setShowChatSystemType(UI_CST.PrivateItem, channel_SystemPrivateItem)
  chat:setShowChatSystemType(UI_CST.PartyItem, channel_SystemPartyItem)
  chat:setShowChatSystemType(UI_CST.Market, channel_SystemMarket)
  chat:setShowChatSystemType(UI_CST.Worker, channel_SystemWorker)
  chat:setShowChatSystemType(UI_CST.Harvest, channel_SystemHarvest)
  local count = ToClient_getChattingPanelCount()
  local currentFontSize = (ToClient_getFontWrapper("BaseFont_10_Chat")):getFontSize()
  for panelIdx = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIdx)
    chatPanel:setChatFontSizeType(ChattingOption_convertFontSizeToChatFontType(currentFontSize))
  end
  prevFontSizeType = currentFontSize
  local _transparency = _alphaSlider_ControlBTN:GetPosX() / (_alphaSlider_Control:GetSizeX() - _alphaSlider_ControlBTN:GetSizeX())
  chat:setTransparency(_transparency)
  FGlobal_ChatOption_SetIsShowTimeString(panelIdex, _checkButton_ChatTime:IsCheck())
  -- DECOMPILER ERROR at PC138: Confused about usage of register: R5 in 'UnsetPending'

  _prevIsCheckChatTime[panelIdex] = _checkButton_ChatTime:IsCheck()
  ToClient_SaveUiInfo(false)
  Panel_ChatOption:SetShow(false, false)
  Panel_ChatOption:SetIgnore(true)
  ChattingColor_Hide()
end

FGlobal_ChattingOption_SettingColor = function(index, chatType, panelIndex, isSystem)
  -- function num : 0_39 , upvalues : btnSystemFilter, btnFilter
  if isSystem then
    ((btnSystemFilter[0]).chatFilter):SetFontColor(FGlobal_ColorList(index))
    ;
    ((btnSystemFilter[0]).chatColor):SetColor(FGlobal_ColorList(index))
  else
    ;
    ((btnFilter[chatType]).chatFilter):SetFontColor(FGlobal_ColorList(index))
    ;
    ((btnFilter[chatType]).chatColor):SetColor(FGlobal_ColorList(index))
  end
end

ChattingOption_Open = function(penelIdex, drawPanelIndex, isCombinedMainPanel)
  -- function num : 0_40 , upvalues : rdo_FontSizeSmall, rdo_FontSizeSmall2, rdo_FontSizeNormal, rdo_FontSizeNormal2, rdo_FontSizeBig, preNameType, rdo_CharacterName, rdo_FamilyName, prevFontSizeType
  if Panel_ChatOption:GetShow() == false then
    Panel_ChatOption:SetShow(true, true)
    Panel_ChatOption:SetSpanSize(0, 0)
    Panel_ChatOption:SetIgnore(false)
  end
  local thisFontSize = (ToClient_getFontWrapper("BaseFont_10_Chat")):getFontSize()
  if thisFontSize == 10 then
    rdo_FontSizeSmall:SetCheck(true)
    rdo_FontSizeSmall2:SetCheck(false)
    rdo_FontSizeNormal:SetCheck(false)
    rdo_FontSizeNormal2:SetCheck(false)
    rdo_FontSizeBig:SetCheck(false)
  else
    if thisFontSize == 12 then
      rdo_FontSizeSmall:SetCheck(false)
      rdo_FontSizeSmall2:SetCheck(true)
      rdo_FontSizeNormal:SetCheck(false)
      rdo_FontSizeNormal2:SetCheck(false)
      rdo_FontSizeBig:SetCheck(false)
    else
      if thisFontSize == 14 then
        rdo_FontSizeSmall:SetCheck(false)
        rdo_FontSizeSmall2:SetCheck(false)
        rdo_FontSizeNormal:SetCheck(true)
        rdo_FontSizeNormal2:SetCheck(false)
        rdo_FontSizeBig:SetCheck(false)
      else
        if thisFontSize == 18 then
          rdo_FontSizeSmall:SetCheck(false)
          rdo_FontSizeSmall2:SetCheck(false)
          rdo_FontSizeNormal:SetCheck(false)
          rdo_FontSizeNormal2:SetCheck(true)
          rdo_FontSizeBig:SetCheck(false)
        else
          if thisFontSize == 20 then
            rdo_FontSizeSmall:SetCheck(false)
            rdo_FontSizeSmall2:SetCheck(false)
            rdo_FontSizeNormal:SetCheck(false)
            rdo_FontSizeNormal2:SetCheck(false)
            rdo_FontSizeBig:SetCheck(true)
          end
        end
      end
    end
  end
  local currentNameType = ToClient_getChatNameType()
  preNameType = currentNameType
  if currentNameType == 0 then
    rdo_CharacterName:SetCheck(true)
    rdo_FamilyName:SetCheck(false)
  else
    if currentNameType == 1 then
      rdo_CharacterName:SetCheck(false)
      rdo_FamilyName:SetCheck(true)
    end
  end
  prevFontSizeType = ChattingOption_convertFontSizeToChatFontType(thisFontSize)
  local _transparency = FGlobal_Chatting_PanelTransparency_Chk(drawPanelIndex)
  ChattingOption_Initialize(penelIdex, _transparency, isCombinedMainPanel)
end

ChattingOption_Close = function()
  -- function num : 0_41 , upvalues : prevFontSizeType, _prevIsCheckChatTime, _checkButton_ChatTime, preNameType, preChattingAnimation
  local chatCount = ToClient_getChattingPanelCount()
  for panelIdex = 0, chatCount - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIdex)
    chatPanel:setChatFontSizeType(prevFontSizeType)
    if chatPanel:isOpen() == true then
      FGlobal_ChatOption_SetIsShowTimeString(panelIdex, _prevIsCheckChatTime[panelIdex])
      _checkButton_ChatTime:SetCheck(_prevIsCheckChatTime[panelIdex])
    end
  end
  setisChangeFontSize(true)
  FromClient_ChatUpdate(true)
  ToClient_setChatNameType(preNameType)
  ChattingOption_ChatiingAnimation(preChattingAnimation)
  Panel_ChatOption:SetShow(false, false)
  Panel_ChatOption:SetIgnore(true)
  ChattingColor_Hide()
end

ChatOption_ShowAni = function()
  -- function num : 0_42
  (UIAni.fadeInSCR_Left)(Panel_ChatOption)
end

ChattingOption_ShowBlockList = function()
  -- function num : 0_43
  clickRequestShowBlockList()
end

ChattingOption_SelectFontSize = function(fontSize)
  -- function num : 0_44
  if fontSize == nil then
    return 
  end
  audioPostEvent_SystemUi(0, 0)
  local count = ToClient_getChattingPanelCount()
  local fontType = ChattingOption_convertFontSizeToChatFontType(fontSize)
  for panelIdx = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIdx)
    chatPanel:setChatFontSizeType(fontType)
  end
  setisChangeFontSize(true)
end

setisChangeFontSize = function(set)
  -- function num : 0_45 , upvalues : isChangeFont
  isChangeFont = set
end

setisChangeFontSize(true)
isChangeFontSize = function()
  -- function num : 0_46 , upvalues : isChangeFont
  return isChangeFont
end

RegisterUpdate_ChatOption = function()
  -- function num : 0_47
  FromClient_ChatUpdate()
end

ChattingOption_convertFontSizeToChatFontType = function(chattingFontSize)
  -- function num : 0_48
  local ChatFontType = (CppEnums.ChatFontSizeType).eChatFontSizeType_Normal
  if chattingFontSize == 10 then
    ChatFontType = (CppEnums.ChatFontSizeType).eChatFontSizeType_Small
  else
    if chattingFontSize == 12 then
      ChatFontType = (CppEnums.ChatFontSizeType).eChatFontSizeType_Medium
    else
      if chattingFontSize == 14 then
        ChatFontType = (CppEnums.ChatFontSizeType).eChatFontSizeType_Normal
      else
        if chattingFontSize == 18 then
          ChatFontType = (CppEnums.ChatFontSizeType).eChatFontSizeType_Biggish
        else
          if chattingFontSize == 20 then
            ChatFontType = (CppEnums.ChatFontSizeType).eChatFontSizeType_Big
          end
        end
      end
    end
  end
  return ChatFontType
end

ChattingOption_convertChatFontTypeToFontSize = function(chattingFontType)
  -- function num : 0_49
  local fontSize = 14
  if chattingFontType == (CppEnums.ChatFontSizeType).eChatFontSizeType_Small then
    fontSize = 10
  else
    if chattingFontType == (CppEnums.ChatFontSizeType).eChatFontSizeType_Medium then
      fontSize = 12
    else
      if chattingFontType == (CppEnums.ChatFontSizeType).eChatFontSizeType_Normal then
        fontSize = 14
      else
        if chattingFontType == (CppEnums.ChatFontSizeType).eChatFontSizeType_Biggish then
          fontSize = 18
        else
          if chattingFontType == (CppEnums.ChatFontSizeType).eChatFontSizeType_Big then
            fontSize = 20
          end
        end
      end
    end
  end
  return fontSize
end

ChattingOption_getChatFontSizebyPanelIndex = function(panelIdx)
  -- function num : 0_50
  local chatPanel = ToClient_getChattingPanel(panelIdx)
  local fontType = chatPanel:getChatFontSizeType()
  return ChattingOption_convertChatFontTypeToFontSize(fontType)
end

getPanelChatFontSizeType = function(panelIdx)
  -- function num : 0_51
  local chatPanel = ToClient_getChattingPanel(panelIdx)
  return chatPanel:getChatFontSizeType()
end

FGlobal_ChatOption_GetIsShowTimeString = function(panelIndex)
  -- function num : 0_52
  local chatPanel = ToClient_getChattingPanel(panelIndex)
  if chatPanel == nil then
    _PA_ASSERT(false, "없는 번호�\152 채팅 패널입니�\164.(" .. tostring(panelIndex) .. ")")
    return false
  end
  return chatPanel:getIsShowTimeString()
end

FGlobal_ChatOption_SetIsShowTimeString = function(panelIndex, isShowTimeString)
  -- function num : 0_53
  local chatPanel = ToClient_getChattingPanel(panelIndex)
  if chatPanel == nil then
    _PA_ASSERT(false, "없는 번호�\152 채팅 패널입니�\164.(" .. tostring(panelIndex) .. ")")
    return 
  end
  if chatPanel:isOpen() == false then
    return 
  end
  chatPanel:setIsShowTimeString(isShowTimeString)
end

ChatOption_HideAni = function()
  -- function num : 0_54 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_ChatOption:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local mailHideAni = Panel_ChatOption:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  mailHideAni:SetStartColor(UI_color.C_FFFFFFFF)
  mailHideAni:SetEndColor(UI_color.C_00FFFFFF)
  mailHideAni:SetStartIntensity(3)
  mailHideAni:SetEndIntensity(1)
  mailHideAni.IsChangeChild = true
  mailHideAni:SetHideAtEnd(true)
  mailHideAni:SetDisableWhileAni(true)
end

local BlockList = {_selectDeleteIndex; _uiBlockList = (UI.getChildControl)(Panel_ChatOption, "Listbox_Block"), _uiBackGround = (UI.getChildControl)(Panel_ChatOption, "Static_OfferWindow"), _uiBlackListTItle = (UI.getChildControl)(Panel_ChatOption, "StaticText_ChatOptionOfferTitle"), _uiClose = (UI.getChildControl)(Panel_ChatOption, "Block_Close"), _uiDelete = (UI.getChildControl)(Panel_ChatOption, "Button_Delete"), _uiAllDelete = (UI.getChildControl)(Panel_ChatOption, "Button_AllDelete"), _uiScroll = nil, _uiScrollCtrlButton = nil, _slotRows = 12}
BlockList.SetShow = function(self, isShow)
  -- function num : 0_55 , upvalues : BlockList
  (BlockList._uiBlockList):SetShow(isShow)
  ;
  (BlockList._uiBackGround):SetShow(isShow)
  ;
  (BlockList._uiBlackListTItle):SetShow(isShow)
  ;
  (BlockList._uiClose):SetShow(isShow)
  ;
  (BlockList._uiDelete):SetShow(isShow)
  ;
  (BlockList._uiAllDelete):SetShow(isShow)
end

BlockList.initialize = function(self)
  -- function num : 0_56
  self._uiScroll = (UI.getChildControl)(self._uiBlockList, "Block_Scroll")
  ;
  (self._uiScroll):SetControlTop()
  ;
  (self._uiBlockList):addInputEvent("Mouse_LUp", "clickBlockList()")
  ;
  (self._uiClose):addInputEvent("Mouse_LUp", "clickCloseBlockList()")
  self._selectDeleteIndex = -1
  ;
  (self._uiDelete):addInputEvent("Mouse_LUp", "clickDeleteBlock()")
  ;
  (self._uiAllDelete):addInputEvent("Mouse_LUp", "clickAllDeleteBlock()")
  self:SetShow(false)
end

clickCloseBlockList = function()
  -- function num : 0_57
  BlockList_hide()
end

clickDeleteBlock = function()
  -- function num : 0_58 , upvalues : BlockList
  if BlockList._selectDeleteIndex ~= -1 then
    local deleteName = (BlockList._uiBlockList):GetItemText(BlockList._selectDeleteIndex)
    ToClient_RequestDeleteBlockName(deleteName)
  end
end

clickAllDeleteBlock = function()
  -- function num : 0_59 , upvalues : BlockList
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  BlockList._selectDeleteIndex = -1
  ToClient_RequestDeleteAllBlockList()
end

clickBlockList = function()
  -- function num : 0_60 , upvalues : BlockList
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  BlockList._selectDeleteIndex = (BlockList._uiBlockList):GetSelectIndex()
end

BlockList.updateList = function(self)
  -- function num : 0_61 , upvalues : UI_color
  local listControl = self._uiBlockList
  listControl:DeleteAll()
  local blockCount = ToClient_RequestBlockCount()
  for i = 0, blockCount - 1 do
    local blockName = ToClient_RequestGetBlockName(i)
    listControl:AddItemWithLineFeed(blockName, UI_color.C_FFFFF3AF)
  end
  ;
  (UIScroll.SetButtonSize)(self._uiScroll, self._slotRows, blockCount)
end

BlockList:initialize()
registerEvent("FromClient_UpdateBlockList", "FromClient_UpdateBlockList")
BlockList_show = function()
  -- function num : 0_62 , upvalues : BlockList
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  self._selectDeleteIndex = -1
  BlockList:SetShow(true)
  BlockList:updateList()
end

BlockList_hide = function()
  -- function num : 0_63 , upvalues : BlockList
  BlockList:SetShow(false)
end

FromClient_UpdateBlockList = function()
  -- function num : 0_64 , upvalues : BlockList
  BlockList:updateList()
end

clickRequestShowBlockList = function()
  -- function num : 0_65 , upvalues : BlockList
  if (BlockList._uiBackGround):GetShow() then
    BlockList_hide()
  else
    BlockList_show()
  end
end

ChattingOption_SelectNameType = function(nameType)
  -- function num : 0_66
  if nameType == nil then
    return 
  end
  audioPostEvent_SystemUi(0, 0)
  ToClient_setChatNameType(nameType)
end

ChattingOption_InitailizeChattingAnimationControl = function()
  -- function num : 0_67 , upvalues : ChattingAnimationTitleBg, ChattingAnimationOptionBg, rdo_ChattingAnimationOn, rdo_ChattingAnimationOff, preChattingAnimation
  ChattingAnimationTitleBg:ComputePos()
  ChattingAnimationOptionBg:ComputePos()
  rdo_ChattingAnimationOn:ComputePos()
  rdo_ChattingAnimationOff:ComputePos()
  rdo_ChattingAnimationOn:addInputEvent("Mouse_LUp", "ChattingOption_ChatiingAnimation( true )")
  rdo_ChattingAnimationOff:addInputEvent("Mouse_LUp", "ChattingOption_ChatiingAnimation( false )")
  local ChattingAnimationflag = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).ChattingAnimation)
  if ChattingAnimationflag == true then
    rdo_ChattingAnimationOn:SetCheck(true)
    rdo_ChattingAnimationOff:SetCheck(false)
    ChattingOption_ChatiingAnimation(true)
    preChattingAnimation = true
  else
    rdo_ChattingAnimationOn:SetCheck(false)
    rdo_ChattingAnimationOff:SetCheck(true)
    ChattingOption_ChatiingAnimation(false)
    preChattingAnimation = false
  end
end

ChattingOption_UpdateChattingAnimationControl = function(isUsedChattingAnimation)
  -- function num : 0_68 , upvalues : rdo_ChattingAnimationOn, rdo_ChattingAnimationOff, preChattingAnimation
  if isUsedChattingAnimation == true then
    rdo_ChattingAnimationOn:SetCheck(true)
    rdo_ChattingAnimationOff:SetCheck(false)
    ChattingOption_ChatiingAnimation(true)
    preChattingAnimation = true
  else
    rdo_ChattingAnimationOn:SetCheck(false)
    rdo_ChattingAnimationOff:SetCheck(true)
    ChattingOption_ChatiingAnimation(false)
    preChattingAnimation = false
  end
end

ChattingOption_ChatiingAnimation = function(ChattingAniFlag)
  -- function num : 0_69
  if ChattingAniFlag == nil then
    return 
  end
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).ChattingAnimation, ChattingAniFlag)
  Chatting_setUsedSmoothChattingUp(ChattingAniFlag)
end


