-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\gameexit\panel_gameexit.luac 

-- params : ...
-- function num : 0
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_Class = CppEnums.ClassType
local PP = CppEnums.PAUIMB_PRIORITY
local ePcWorkingType = CppEnums.PcWorkType
local const_64 = Defines.s64_const
Panel_GameExit:setMaskingChild(true)
Panel_GameExit:ActiveMouseEventEffect(true)
Panel_GameExit:setGlassBackground(true)
Panel_ExitConfirm:setMaskingChild(true)
Panel_ExitConfirm:ActiveMouseEventEffect(true)
Panel_ExitConfirm:setGlassBackground(true)
Panel_ExitConfirm:SetShow(false)
Panel_GameExit:SetShow(false)
local userConnectionType = 0
Panel_GameExit:RegisterShowEventFunc(true, "Panel_GameExit_ShowAni()")
Panel_GameExit:RegisterShowEventFunc(false, "Panel_GameExit_HideAni()")
local isValksItem = ToClient_IsContentsGroupOpen("47")
Panel_GameExit_ShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Down)(Panel_GameExit)
  audioPostEvent_SystemUi(1, 0)
end

Panel_GameExit_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_GameExit:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_GameExit:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  ButtonFacePhoto_ToolTip(false)
  audioPostEvent_SystemUi(1, 1)
end

local _btn_winClose = (UI.getChildControl)(Panel_GameExit, "Button_Win_Close")
local _btn_selectCharacter = (UI.getChildControl)(Panel_GameExit, "Button_CharacterSelect")
local _btn_gameExit = (UI.getChildControl)(Panel_GameExit, "Button_GameExit")
local _btn_cancel = (UI.getChildControl)(Panel_GameExit, "Button_Cancel")
local _charSlotBG = (UI.getChildControl)(Panel_GameExit, "Static_CharSlot_BG")
local _btn_NoticeMsg = (UI.getChildControl)(Panel_GameExit, "Button_NoticeMsg")
local _btn_PreCharPage = (UI.getChildControl)(Panel_GameExit, "Button_PrePage")
local _btn_NextCharPage = (UI.getChildControl)(Panel_GameExit, "Button_NextPage")
local _btn_ChangeChannel = (UI.getChildControl)(Panel_GameExit, "Button_ChangeChannel")
local _btn_CharTransport = (UI.getChildControl)(Panel_GameExit, "Button_Transport")
local _block_BG = (UI.getChildControl)(Panel_GameExit, "Static_block_BG")
local _dailyStampBanner = (UI.getChildControl)(Panel_GameExit, "Static_DailyCheckBanner")
local _dailyStampSlotBg = (UI.getChildControl)(Panel_GameExit, "Static_DailyCheckSlotBg")
local _dailyStampText = (UI.getChildControl)(Panel_GameExit, "StaticText_DailycheckAlert")
local _btn_FacePhoto = (UI.getChildControl)(Panel_GameExit, "Button_FacePhoto")
local photoIndex = 0
local isExitPhoto = false
local isTrayMode = false
local _exitConfirm_TitleText = (UI.getChildControl)(Panel_ExitConfirm, "StaticText_Title")
local _exitConfirm_Btn_Confirm = (UI.getChildControl)(Panel_ExitConfirm, "Button_Confirm")
local _exitConfirm_Btn_Cancle = (UI.getChildControl)(Panel_ExitConfirm, "Button_Cancle")
local _exitConfirm_Chk_Tray = (UI.getChildControl)(Panel_ExitConfirm, "CheckButton_Tray")
local _exitConfirm_TrayString = (UI.getChildControl)(Panel_ExitConfirm, "StaticText_TrayHelp")
local _exitConfirm_ContentsString = (UI.getChildControl)(Panel_ExitConfirm, "StaticText_GameExit")
_exitConfirm_ContentsString:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEEXIT_TRAY_ASK"))
_exitConfirm_TrayString:SetTextMode(UI_TM.eTextMode_AutoWrap)
_exitConfirm_TrayString:SetAutoResize(true)
_exitConfirm_TrayString:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITTRAY_TRAYHELP"))
_exitConfirm_Chk_Tray:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITTRAY_CHKTRAY"))
_exitConfirm_Chk_Tray:SetEnableArea(0, 0, _exitConfirm_Chk_Tray:GetSizeX() + _exitConfirm_Chk_Tray:GetTextSizeX(), _exitConfirm_Chk_Tray:GetSizeY())
local _exitConfirm_Chk_Tray_2 = (UI.createControl)(UCT.PA_UI_CONTROL_CHECKBUTTON, Panel_ExitConfirm, "CheckButton_Tray_2")
CopyBaseProperty(_exitConfirm_Chk_Tray, _exitConfirm_Chk_Tray_2)
_exitConfirm_Chk_Tray_2:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEXITTRAYCHECKBUTTONTEXT"))
local _progressingQuest = (UI.getChildControl)(Panel_GameExit, "StaticText_ProgressingQuest_Value")
local _completeQuest = (UI.getChildControl)(Panel_GameExit, "StaticText_LastCompleteQuest_Value")
local _addMessage = (UI.getChildControl)(Panel_GameExit, "Edit_AddMessage")
local journalFrame = (UI.getChildControl)(Panel_GameExit, "Frame_TodayMyChallenge")
local journalFrameContents = (UI.getChildControl)(journalFrame, "Frame_1_Content")
local journalFrameScroll = (UI.getChildControl)(journalFrame, "Frame_Scroll_TodayMyChallenge")
local journalContents = (UI.getChildControl)(Panel_GameExit, "StaticText_TodayMyChallenge_Contents")
journalFrameContents:AddChild(journalContents)
Panel_GameExit:RemoveControl(journalContents)
journalContents:SetAutoResize(true)
journalContents:SetTextMode(UI_TM.eTextMode_AutoWrap)
journalContents:SetPosX(0)
journalContents:SetPosY(0)
_addMessage:SetMaxInput(24)
local normalStack = {}
local valksStack = {}
_btn_PreCharPage:SetAutoDisableTime(0)
_btn_NextCharPage:SetAutoDisableTime(0)
local _buttonQuestion = (UI.getChildControl)(Panel_GameExit, "Button_Question")
local Copy_UI_CharChange = {_copy_CharSlot = (UI.getChildControl)(Panel_GameExit, "Static_CharSlot"), _copy_CharLevel = (UI.getChildControl)(Panel_GameExit, "StaticText_Char_Level"), _copy_CharName = (UI.getChildControl)(Panel_GameExit, "StaticText_Char_Name"), _copy_NormalStack = (UI.getChildControl)(Panel_GameExit, "StaticText_NormalStack"), _copy_CharGaugeBG = (UI.getChildControl)(Panel_GameExit, "Static_Char_GaugeBG"), _copy_CharGauge = (UI.getChildControl)(Panel_GameExit, "Static_Char_Gauge"), _copy_CharWorkTxt = (UI.getChildControl)(Panel_GameExit, "StaticText_Char_Work"), _copy_CharPcDeliveryRemainTime = (UI.getChildControl)(Panel_GameExit, "StaticText_PcDeliveryRemainTime"), _copy_CharWhere = (UI.getChildControl)(Panel_GameExit, "StaticText_Char_Where"), _copy_CharPosition = (UI.getChildControl)(Panel_GameExit, "StaticText_Char_Position"), _copy_CharEnterWaiting = (UI.getChildControl)(Panel_GameExit, "StaticText_EnterWaiting"), _copy_CharChange = (UI.getChildControl)(Panel_GameExit, "Button_Change"), _copy_CharSelect = (UI.getChildControl)(Panel_GameExit, "Static_CharSlot_Select"), _copy_CharSlot_BG2 = (UI.getChildControl)(Panel_GameExit, "Static_CharSlot_BG2"), _copy_CharWpCount = (UI.getChildControl)(Panel_GameExit, "StaticText_WpCount")}
local totalCharacterCount = 4
local startPosX = 4
local exitMode = -1
local logoutDelayTime = getLogoutWaitingTime()
enum_ExitMode = {eExitMode_GameExit = 0, eExitMode_BackCharacter = 1, eExitMode_SwapCharacter = 2}
local exit_Time = 0
local prevTime = 0
local selectCharacterIndex = -1
local back_CharacterSelectTime = 0
local selfCharacterIndex = -1
local isCharacterSlotBG = {}
local isCharacterSlot = {}
local CharacterChangeButton = {}
local isCharacterSelect = {}
local charWorking = {}
local charPcDeliveryRemainTime = {}
local charEnterWaiting = {}
local charLevelPool = {}
local charNamePool = {}
local charPositionPool = {}
local beginnerReward = {}
local normalStackPool = {}
local charWpCountPool = {}
local _selectChannel = -1
local slot = {}
local _dailyStampSlotConfig = {createIcon = true, createBorder = true, createCount = true, createClassEquipBG = true, createCash = true}
Panel_GameExit_Initialize = function()
  -- function num : 0_2 , upvalues : totalCharacterCount, UCT, _charSlotBG, Copy_UI_CharChange, startPosX, isCharacterSlotBG, isCharacterSlot, charLevelPool, UI_TM, charNamePool, charWorking, charPcDeliveryRemainTime, charPositionPool, charEnterWaiting, CharacterChangeButton, isCharacterSelect, normalStackPool, charWpCountPool, _btn_ChangeChannel, _block_BG, _btn_FacePhoto, _dailyStampSlotBg, _dailyStampSlotConfig, slot, _btn_selectCharacter, _btn_gameExit, _btn_cancel
  local selfProxy = getSelfPlayer()
  local characterNo_64 = toInt64(0, 0)
  if selfProxy ~= nil then
    characterNo_64 = selfProxy:getCharacterNo_64()
  end
  for idx = 0, totalCharacterCount - 1 do
    local charSlotBG2 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, _charSlotBG, "Static_CharSlotBG2_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharSlot_BG2, charSlotBG2)
    charSlotBG2:SetShow(false)
    charSlotBG2:SetIgnore(true)
    charSlotBG2:SetPosX(startPosX + idx * 159)
    charSlotBG2:SetPosY(4)
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R7 in 'UnsetPending'

    isCharacterSlotBG[idx] = charSlotBG2
    local charSlot = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, _charSlotBG, "Static_CharSlot_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharSlot, charSlot)
    charSlot:SetShow(false)
    charSlot:SetPosX(startPosX + idx * 159)
    charSlot:SetPosY(4)
    -- DECOMPILER ERROR at PC72: Confused about usage of register: R8 in 'UnsetPending'

    isCharacterSlot[idx] = charSlot
    local charLevel = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, charSlot, "StaticText_CharLevel_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharLevel, charLevel)
    charLevel:SetShow(false)
    -- DECOMPILER ERROR at PC91: Confused about usage of register: R9 in 'UnsetPending'

    charLevelPool[idx] = charLevel
    local charName = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, charSlot, "StaticText_CharName_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharName, charName)
    charName:SetShow(false)
    charName:SetTextMode(UI_TM.eTextMode_AutoWrap)
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R10 in 'UnsetPending'

    charNamePool[idx] = charName
    local charWorkTxt = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, charSlot, "StaticText_CharWorkText_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharWorkTxt, charWorkTxt)
    charWorkTxt:SetShow(false)
    charWorkTxt:SetPosY(charWorkTxt:GetPosY() + 20)
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R11 in 'UnsetPending'

    charWorking[idx] = charWorkTxt
    local charWorkRemainText = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, charSlot, "StaticText_PcDeliveryRamainTimeText_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharPcDeliveryRemainTime, charWorkRemainText)
    charWorkRemainText:SetShow(false)
    -- DECOMPILER ERROR at PC157: Confused about usage of register: R12 in 'UnsetPending'

    charPcDeliveryRemainTime[idx] = charWorkRemainText
    local charPositionTxt = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, charSlot, "StaticText_CharPosition_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharPosition, charPositionTxt)
    charPositionTxt:SetShow(false)
    -- DECOMPILER ERROR at PC176: Confused about usage of register: R13 in 'UnsetPending'

    charPositionPool[idx] = charPositionTxt
    local charEnterWaitingTxt = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, charSlot, "StaticText_EnterWaiting_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharEnterWaiting, charEnterWaitingTxt)
    charEnterWaitingTxt:SetShow(false)
    -- DECOMPILER ERROR at PC195: Confused about usage of register: R14 in 'UnsetPending'

    charEnterWaiting[idx] = charEnterWaitingTxt
    local charChange = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, charSlot, "Button_CharChange_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharChange, charChange)
    charChange:SetShow(false)
    -- DECOMPILER ERROR at PC214: Confused about usage of register: R15 in 'UnsetPending'

    CharacterChangeButton[idx] = charChange
    local charSelected = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, _charSlotBG, "Statc_CharSelected_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharSelect, charSelected)
    charSelected:SetShow(false)
    charSelected:SetPosX(2 + idx * 159)
    charSelected:SetPosY(2)
    -- DECOMPILER ERROR at PC240: Confused about usage of register: R16 in 'UnsetPending'

    isCharacterSelect[idx] = charSelected
    local normalStack = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, charSlot, "StaticText_NormalStack_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_NormalStack, normalStack)
    normalStack:SetShow(false)
    normalStack:SetPosX(127)
    normalStack:SetPosY(170)
    -- DECOMPILER ERROR at PC265: Confused about usage of register: R17 in 'UnsetPending'

    normalStackPool[idx] = normalStack
    local charWpCount = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, charSlot, "StaticText_charWpCount_" .. idx)
    CopyBaseProperty(Copy_UI_CharChange._copy_CharWpCount, charWpCount)
    charWpCount:SetShow(false)
    charWpCount:SetPosX(2)
    charWpCount:SetPosY(176)
    -- DECOMPILER ERROR at PC290: Confused about usage of register: R18 in 'UnsetPending'

    charWpCountPool[idx] = charWpCount
  end
  for _,value in pairs(Copy_UI_CharChange) do
    value:SetShow(false)
  end
  Panel_GameExit:SetChildIndex(_btn_ChangeChannel, 9999)
  _block_BG:SetSize(getScreenSizeX() + 200, getScreenSizeY() + 200)
  _block_BG:SetHorizonCenter()
  _block_BG:SetVerticalMiddle()
  _btn_ChangeChannel:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"))
  _btn_FacePhoto:SetShow(true)
  _btn_FacePhoto:addInputEvent("Mouse_On", "ButtonFacePhoto_ToolTip( true )")
  _btn_FacePhoto:addInputEvent("Mouse_Out", "ButtonFacePhoto_ToolTip( false )")
  _btn_FacePhoto:addInputEvent("Mouse_LUp", "GameExit_ForFacePhoto()")
  local temp = {}
  ;
  (SlotItem.new)(temp, "DailyStamp_RewardItem", 0, _dailyStampSlotBg, _dailyStampSlotConfig)
  temp:createChild()
  ;
  (temp.icon):SetPosX(4)
  ;
  (temp.icon):SetPosY(12)
  slot = temp
  _btn_selectCharacter:SetText(_btn_selectCharacter:GetText())
  _btn_gameExit:SetText(_btn_gameExit:GetText())
  _btn_cancel:SetText(_btn_cancel:GetText())
  _btn_selectCharacter:setChangeFontAfterTransSizeValue()
  _btn_gameExit:setChangeFontAfterTransSizeValue()
  _btn_cancel:setChangeFontAfterTransSizeValue()
end

GameExit_ForFacePhoto = function()
  -- function num : 0_3 , upvalues : isExitPhoto, photoIndex
  isExitPhoto = true
  GameExit_Close()
  IsGameExitPhoto(true)
  IngameCustomize_Show()
  characterSlot_Index(photoIndex)
end

ButtonFacePhoto_ToolTip = function(isOn)
  -- function num : 0_4 , upvalues : _btn_FacePhoto
  if isOn == false then
    TooltipSimple_Hide()
    return 
  end
  local self, uiControl, name, desc = nil, nil, nil, nil
  uiControl = _btn_FacePhoto
  name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_FACEPHOTO_TOOLTIP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_FACEPHOTO_TOOLTIP_DESC")
  local reversePosX = true
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc, reversePosX)
end

local consoleGroup = {}
for index = 1, 7 do
  consoleGroup[index] = Panel_GameExit:addConsoleUIGroup(index, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
end
refreshCharacterInfoData = function(startIdx)
  -- function num : 0_5 , upvalues : photoIndex, isCharacterSlot, isExitPhoto, UI_Class, charLevelPool, charNamePool, charPositionPool, normalStackPool, charWpCountPool, UI_color, charWorking, charPcDeliveryRemainTime, charEnterWaiting, CharacterChangeButton, isCharacterSlotBG, _charSlotBG, const_64, _btn_ChangeChannel, _btn_CharTransport, _btn_NextCharPage, _btn_PreCharPage, consoleGroup, _addMessage
  local selfProxy = getSelfPlayer()
  local characterNo_64 = toInt64(0, 0)
  if startIdx == nil or startIdx <= 0 then
    startIdx = 0
  end
  if selfProxy ~= nil then
    characterNo_64 = selfProxy:getCharacterNo_64()
  end
  photoIndex = startIdx - 1
  if Panel_GameExit:IsShow() == false then
    return 
  end
  local currentTicketNo = getCurrentTicketNo()
  local uiCount = 0
  local characterTicketNo = nil
  local firstTicketNo = getFirstTicketNoByAll()
  local characterDatacount = (getCharacterDataCount())
  local nowPlayCharaterSlotNo = nil
  local serverUtc64 = getServerUtc64()
  for idx = startIdx, characterDatacount - 1 do
    local characterData = getCharacterDataByIndex(idx)
    local char_Type = getCharacterClassType(characterData)
    local char_Level = (string.format)("%d", characterData._level)
    local char_Name = getCharacterName(characterData)
    local char_wp = ToClient_getWpInCharacterDataList(idx)
    local defaultCount = characterData._enchantFailCount
    local valksCount = characterData._valuePackCount
    local char_No_s64 = characterData._characterNo_s64
    local char_TextureName = getCharacterFaceTextureByIndex(idx)
    local char_WorkTxt = ""
    local pcDeliveryRemainTimeText = ""
    local pcDeliveryRegionKey = characterData._arrivalRegionKey
    if pcDeliveryRegionKey:get() ~= 0 and serverUtc64 < characterData._arrivalTime then
      char_WorkTxt = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_DELIVERY")
      local remainTime = characterData._arrivalTime - serverUtc64
      pcDeliveryRemainTimeText = convertStringFromDatetime(remainTime)
    else
      do
        char_WorkTxt = global_workTypeToStringSwap(characterData._pcWorkingType)
        local regionInfo = getRegionInfoByPosition(characterData._currentPosition)
        ;
        (isCharacterSlot[uiCount]):SetShow(true)
        local isCaptureExist = (isCharacterSlot[uiCount]):ChangeTextureInfoNameNotDDS(char_TextureName, char_Type, isExitPhoto)
        if isCaptureExist == true then
          ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(0, 0, 1, 1)
        else
          if char_Type == UI_Class.ClassType_Warrior then
            (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 1, 1, 156, 201)
            ;
            ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
          else
            do
              if char_Type == UI_Class.ClassType_Ranger then
                (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 157, 1, 312, 201)
                ;
                ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                ;
                (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
              else
                do
                  if char_Type == UI_Class.ClassType_Sorcerer then
                    (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 313, 1, 468, 201)
                    ;
                    ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                    ;
                    (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                  else
                    do
                      if char_Type == UI_Class.ClassType_Giant then
                        (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 1, 202, 156, 402)
                        ;
                        ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                        ;
                        (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                      else
                        do
                          if char_Type == UI_Class.ClassType_Tamer then
                            (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                            local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 157, 202, 312, 402)
                            ;
                            ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                            ;
                            (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                          else
                            do
                              if char_Type == UI_Class.ClassType_BladeMaster then
                                (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                                local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 313, 202, 468, 402)
                                ;
                                ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                ;
                                (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                              else
                                do
                                  if char_Type == UI_Class.ClassType_Valkyrie then
                                    (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                    local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 1, 1, 156, 201)
                                    ;
                                    ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                    ;
                                    (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                  else
                                    do
                                      if char_Type == UI_Class.ClassType_BladeMasterWomen then
                                        (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                        local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 157, 1, 312, 201)
                                        ;
                                        ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                        ;
                                        (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                      else
                                        do
                                          if char_Type == UI_Class.ClassType_Wizard then
                                            (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                            local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 313, 1, 468, 201)
                                            ;
                                            ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                            ;
                                            (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                          else
                                            do
                                              if char_Type == UI_Class.ClassType_WizardWomen then
                                                (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 1, 202, 156, 402)
                                                ;
                                                ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                ;
                                                (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                              else
                                                do
                                                  if char_Type == UI_Class.ClassType_NinjaWomen then
                                                    (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                    local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 157, 202, 312, 402)
                                                    ;
                                                    ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                    ;
                                                    (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                                  else
                                                    do
                                                      if char_Type == UI_Class.ClassType_NinjaMan then
                                                        (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                        local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 313, 202, 468, 402)
                                                        ;
                                                        ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                        ;
                                                        (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                                      else
                                                        do
                                                          if char_Type == UI_Class.ClassType_DarkElf then
                                                            (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                            local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 1, 1, 156, 201)
                                                            ;
                                                            ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                            ;
                                                            (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                                          else
                                                            do
                                                              if char_Type == UI_Class.ClassType_Combattant then
                                                                (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                                local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 157, 1, 312, 201)
                                                                ;
                                                                ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                ;
                                                                (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                                              else
                                                                do
                                                                  if char_Type == UI_Class.ClassType_CombattantWomen then
                                                                    (isCharacterSlot[uiCount]):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                                    local x1, y1, x2, y2 = setTextureUV_Func(isCharacterSlot[uiCount], 313, 1, 468, 201)
                                                                    ;
                                                                    ((isCharacterSlot[uiCount]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                    ;
                                                                    (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                                                  end
                                                                  do
                                                                    ;
                                                                    (isCharacterSlot[uiCount]):setRenderTexture((isCharacterSlot[uiCount]):getBaseTexture())
                                                                    ;
                                                                    (charLevelPool[uiCount]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. char_Level)
                                                                    ;
                                                                    (charNamePool[uiCount]):SetText(char_Name)
                                                                    if (characterData._currentPosition).x == 0 and (characterData._currentPosition).y == 0 and (characterData._currentPosition).z == 0 then
                                                                      (charPositionPool[uiCount]):SetText("")
                                                                    else
                                                                      if pcDeliveryRegionKey:get() ~= 0 and characterData._arrivalTime < serverUtc64 then
                                                                        local retionInfoArrival = getRegionInfoByRegionKey(pcDeliveryRegionKey)
                                                                        ;
                                                                        (charPositionPool[uiCount]):SetText(retionInfoArrival:getAreaName())
                                                                      else
                                                                        do
                                                                          ;
                                                                          (charPositionPool[uiCount]):SetText(regionInfo:getAreaName())
                                                                          ;
                                                                          (normalStackPool[uiCount]):SetShow(true)
                                                                          ;
                                                                          (charWpCountPool[uiCount]):SetShow(true)
                                                                          ;
                                                                          (charWpCountPool[uiCount]):SetText(char_wp)
                                                                          if ToClient_IsReceivedEnchantFailCount() then
                                                                            (normalStackPool[uiCount]):SetText(defaultCount + valksCount)
                                                                          else
                                                                            ;
                                                                            (normalStackPool[uiCount]):SetText("-")
                                                                          end
                                                                          ;
                                                                          (normalStackPool[uiCount]):SetFontColor(UI_color.C_FFE7E7E7)
                                                                          ;
                                                                          (charWpCountPool[uiCount]):SetFontColor(UI_color.C_FFE7E7E7)
                                                                          ;
                                                                          (normalStackPool[uiCount]):addInputEvent("Mouse_On", "GameExit_SimpleTooltips( true, " .. uiCount .. ", 0," .. defaultCount .. "," .. valksCount .. " )")
                                                                          ;
                                                                          (normalStackPool[uiCount]):addInputEvent("Mouse_Out", "GameExit_SimpleTooltips( false, " .. uiCount .. ", 0 )")
                                                                          ;
                                                                          (normalStackPool[uiCount]):setTooltipEventRegistFunc("GameExit_SimpleTooltips( true, " .. uiCount .. ", 0," .. defaultCount .. "," .. valksCount .. ")")
                                                                          ;
                                                                          (charWpCountPool[uiCount]):addInputEvent("Mouse_On", "GameExit_SimpleTooltips( true, " .. uiCount .. ", 1 )")
                                                                          ;
                                                                          (charWpCountPool[uiCount]):addInputEvent("Mouse_Out", "GameExit_SimpleTooltips( false, " .. uiCount .. ", 1 )")
                                                                          ;
                                                                          (charWpCountPool[uiCount]):setTooltipEventRegistFunc("GameExit_SimpleTooltips( true, " .. uiCount .. ", 1 )")
                                                                          ;
                                                                          (charWorking[uiCount]):SetShow(true)
                                                                          ;
                                                                          (charPcDeliveryRemainTime[uiCount]):SetShow(true)
                                                                          ;
                                                                          (charLevelPool[uiCount]):SetShow(true)
                                                                          ;
                                                                          (charNamePool[uiCount]):SetShow(true)
                                                                          ;
                                                                          (charPositionPool[uiCount]):SetShow(true)
                                                                          ;
                                                                          (charEnterWaiting[uiCount]):SetShow(true)
                                                                          ;
                                                                          (isCharacterSlot[uiCount]):addInputEvent("Mouse_LUp", "Panel_GameExit_ClickCharSlot(" .. uiCount .. ")")
                                                                          ;
                                                                          (CharacterChangeButton[uiCount]):addInputEvent("Mouse_LUp", "Panel_GameExit_ChangeCharacter(" .. idx .. ")")
                                                                          local selfProxy = getSelfPlayer()
                                                                          local characterNo_64 = toInt64(0, 0)
                                                                          if selfProxy ~= nil then
                                                                            characterNo_64 = selfProxy:getCharacterNo_64()
                                                                          end
                                                                          ;
                                                                          (CharacterChangeButton[uiCount]):SetShow(false)
                                                                          if characterNo_64 == characterData._characterNo_s64 then
                                                                            (isCharacterSlot[uiCount]):SetMonoTone(false)
                                                                            ;
                                                                            (isCharacterSlot[uiCount]):SetIgnore(true)
                                                                            ;
                                                                            (isCharacterSlotBG[uiCount]):SetShow(true)
                                                                            if startIdx + 4 <= characterDatacount - 1 then
                                                                              (isCharacterSlot[uiCount]):addInputEvent("Mouse_DownScroll", "refreshCharacterInfoData(" .. startIdx + 1 .. ")")
                                                                              _charSlotBG:addInputEvent("Mouse_DownScroll", "refreshCharacterInfoData(" .. startIdx + 1 .. " )")
                                                                            end
                                                                            ;
                                                                            (isCharacterSlot[uiCount]):addInputEvent("Mouse_UpScroll", "refreshCharacterInfoData(" .. startIdx - 1 .. " )")
                                                                            _charSlotBG:addInputEvent("Mouse_UpScroll", "refreshCharacterInfoData(" .. startIdx - 1 .. " )")
                                                                            ;
                                                                            (CharacterChangeButton[uiCount]):SetShow(false)
                                                                            ;
                                                                            (CharacterChangeButton[uiCount]):SetIgnore(true)
                                                                            ;
                                                                            (CharacterChangeButton[uiCount]):SetEnable(false)
                                                                            ;
                                                                            (normalStackPool[uiCount]):SetFontColor(UI_color.C_FFE7E7E7)
                                                                            ;
                                                                            (charWorking[uiCount]):SetText("")
                                                                            ;
                                                                            (charWorking[uiCount]):SetFontColor(UI_color.C_FF6DC6FF)
                                                                            ;
                                                                            (charPositionPool[uiCount]):SetShow(false)
                                                                            ;
                                                                            (charPcDeliveryRemainTime[uiCount]):SetText("")
                                                                            nowPlayCharaterSlotNo = uiCount
                                                                          else
                                                                            ;
                                                                            (isCharacterSlot[uiCount]):SetIgnore(false)
                                                                            ;
                                                                            (isCharacterSlot[uiCount]):SetMonoTone(true)
                                                                            if startIdx + 4 <= characterDatacount - 1 then
                                                                              (isCharacterSlot[uiCount]):addInputEvent("Mouse_DownScroll", "refreshCharacterInfoData(" .. startIdx + 1 .. ")")
                                                                              _charSlotBG:addInputEvent("Mouse_DownScroll", "refreshCharacterInfoData(" .. startIdx + 1 .. ")")
                                                                            end
                                                                            ;
                                                                            (isCharacterSlot[uiCount]):addInputEvent("Mouse_UpScroll", "refreshCharacterInfoData(" .. startIdx - 1 .. " )")
                                                                            _charSlotBG:addInputEvent("Mouse_UpScroll", "refreshCharacterInfoData(" .. startIdx - 1 .. " )")
                                                                            ;
                                                                            (isCharacterSlotBG[uiCount]):SetShow(false)
                                                                            ;
                                                                            (normalStackPool[uiCount]):SetFontColor(UI_color.C_FFC4BEBE)
                                                                            ;
                                                                            (CharacterChangeButton[uiCount]):SetIgnore(false)
                                                                            ;
                                                                            (CharacterChangeButton[uiCount]):SetEnable(true)
                                                                            ;
                                                                            (charWorking[uiCount]):SetText(char_WorkTxt)
                                                                            ;
                                                                            (charWorking[uiCount]):SetFontColor(UI_color.C_FFE7E7E7)
                                                                            ;
                                                                            (charPcDeliveryRemainTime[uiCount]):SetText(pcDeliveryRemainTimeText)
                                                                            local removeTime = getCharacterDataRemoveTime(idx)
                                                                            if removeTime ~= nil then
                                                                              (charWorking[uiCount]):SetText(PAGetString(Defines.StringSheet_GAME, "CHARACTER_DELETING"))
                                                                              ;
                                                                              (charEnterWaiting[uiCount]):SetShow(false)
                                                                              ;
                                                                              (CharacterChangeButton[uiCount]):SetEnable(false)
                                                                              ;
                                                                              (charPositionPool[uiCount]):SetShow(false)
                                                                            else
                                                                              ;
                                                                              (charWorking[uiCount]):SetText(char_WorkTxt)
                                                                            end
                                                                          end
                                                                          do
                                                                            do
                                                                              characterTicketNo = currentTicketNo - characterData._lastTicketNoByRegion
                                                                              if const_64.s64_m1 ~= firstTicketNo or const_64.s64_m1 ~= characterData._lastTicketNoByRegion and const_64.s64_m1 < characterTicketNo then
                                                                                (charEnterWaiting[uiCount]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_NOT_ENTER_TO_FIELD"))
                                                                              else
                                                                                if characterNo_64 == characterData._characterNo_s64 then
                                                                                  (charEnterWaiting[uiCount]):SetShow(false)
                                                                                end
                                                                              end
                                                                              uiCount = uiCount + 1
                                                                              if uiCount == 4 then
                                                                                break
                                                                              end
                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out DO_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                              -- DECOMPILER ERROR at PC1145: LeaveBlock: unexpected jumping out IF_STMT

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
  if nowPlayCharaterSlotNo ~= nil then
    local basePosX = _charSlotBG:GetPosX()
    local basePosY = _charSlotBG:GetPosY()
    local posX = basePosX + (isCharacterSlot[nowPlayCharaterSlotNo]):GetPosX() + (isCharacterSlot[nowPlayCharaterSlotNo]):GetSizeX() / 2 - _btn_ChangeChannel:GetSizeX() / 2
    local posY = basePosY + (isCharacterSlot[nowPlayCharaterSlotNo]):GetPosY() + (isCharacterSlot[nowPlayCharaterSlotNo]):GetSizeY() - _btn_ChangeChannel:GetSizeY() - 10
    _btn_ChangeChannel:SetPosX(posX)
    _btn_ChangeChannel:SetPosY(posY)
    _btn_ChangeChannel:SetShow(true)
    _btn_ChangeChannel:addInputEvent("Mouse_LUp", "FGlobal_ChannelSelect_Show()")
    local posX2 = basePosX + (isCharacterSlot[nowPlayCharaterSlotNo]):GetPosX() + (isCharacterSlot[nowPlayCharaterSlotNo]):GetSizeX() / 2 - _btn_CharTransport:GetSizeX() / 2
    local posY2 = basePosY + (isCharacterSlot[nowPlayCharaterSlotNo]):GetPosY() + (isCharacterSlot[nowPlayCharaterSlotNo]):GetSizeY() - _btn_CharTransport:GetSizeY() - 10
    _btn_CharTransport:SetPosX(posX2)
    _btn_CharTransport:SetPosY(posY2 + 37)
    _btn_CharTransport:SetShow(true)
    _btn_CharTransport:addInputEvent("Mouse_LUp", "Panel_GameExit_Transport()")
  else
    do
      _btn_ChangeChannel:SetShow(false)
      _btn_CharTransport:SetShow(false)
      if characterDatacount - 1 < startIdx + 4 then
        _btn_NextCharPage:addInputEvent("Mouse_LUp", "")
        _btn_NextCharPage:SetShow(false)
      else
        _btn_NextCharPage:addInputEvent("Mouse_LUp", "refreshCharacterInfoData(" .. startIdx + 1 .. ")")
        _btn_NextCharPage:SetShow(true)
      end
      if startIdx > 0 then
        _btn_PreCharPage:addInputEvent("Mouse_LUp", "refreshCharacterInfoData(" .. startIdx - 1 .. ")")
        _btn_PreCharPage:SetShow(true)
      else
        _btn_PreCharPage:addInputEvent("Mouse_LUp", "")
        _btn_PreCharPage:SetShow(false)
      end
      for index = 1, 7 do
        Panel_GameExit:deleteConsoleUIGroup(index, false)
      end
      local groupIndex = 1
      -- DECOMPILER ERROR at PC1330: Confused about usage of register: R11 in 'UnsetPending'

      if startIdx > 0 then
        consoleGroup[groupIndex] = Panel_GameExit:addConsoleUIGroup(groupIndex, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
        ;
        (consoleGroup[groupIndex]):addControl(0, 0, 1, 1, _btn_PreCharPage)
        groupIndex = groupIndex + 1
      end
      local index = 0
      local characterNo_64 = (getSelfPlayer()):getCharacterNo_64()
      for idx = startIdx, characterDatacount - 1 do
        if index <= 3 then
          local characterData = getCharacterDataByIndex(idx)
          -- DECOMPILER ERROR at PC1363: Confused about usage of register: R18 in 'UnsetPending'

          consoleGroup[groupIndex] = Panel_GameExit:addConsoleUIGroup(groupIndex, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
          if characterNo_64 == characterData._characterNo_s64 then
            (consoleGroup[groupIndex]):addControl(0, 0, 2, 1, _btn_ChangeChannel)
            ;
            (consoleGroup[groupIndex]):addControl(1, 0, 2, 1, _btn_CharTransport)
          else
            ;
            (consoleGroup[groupIndex]):addControl(0, 0, 1, 1, isCharacterSlot[index])
          end
          index = index + 1
          groupIndex = groupIndex + 1
        end
      end
      -- DECOMPILER ERROR at PC1411: Confused about usage of register: R13 in 'UnsetPending'

      if startIdx + 4 <= characterDatacount - 1 then
        consoleGroup[groupIndex] = Panel_GameExit:addConsoleUIGroup(groupIndex, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
        ;
        (consoleGroup[groupIndex]):addControl(0, 0, 1, 1, _btn_NextCharPage)
        groupIndex = groupIndex + 1
      end
      -- DECOMPILER ERROR at PC1430: Confused about usage of register: R13 in 'UnsetPending'

      consoleGroup[groupIndex] = Panel_GameExit:addConsoleUIGroup(groupIndex, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
      ;
      (consoleGroup[groupIndex]):addControl(0, 0, 1, 1, _addMessage)
    end
  end
end

confirm_MoveChannel_From_MessageBox = function()
  -- function num : 0_6 , upvalues : _selectChannel
  FGlobal_gameExit_saveCurrentData()
  gameExit_MoveChannel(_selectChannel)
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELWAIT_MSG")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), content = messageBoxMemo, functionYes = nil, functionClose = nil, exitButton = true, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

global_workTypeToStringSwap = function(workingType)
  -- function num : 0_7 , upvalues : ePcWorkingType
  local workingText = nil
  if ePcWorkingType.ePcWorkType_Empty == workingType then
    workingText = ""
  else
    if ePcWorkingType.ePcWorkType_Play == workingType then
      workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_PLAY")
    else
      if ePcWorkingType.ePcWorkType_RepairItem == workingType then
        workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_REPAIRITEM")
      else
        if ePcWorkingType.ePcWorkType_Relax == workingType then
          workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_RELEX")
        else
          if ePcWorkingType.ePcWorkType_ReadBook == workingType then
            workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_READBOOK")
          else
            _PA_ASSERT(false, "캐릭�\176 작업 �\128입이 추가 되었습니�\164. Lobby_New.lua �\132 추가�\180 주어�\188 합니�\164.")
            workingText = "unKnown"
          end
        end
      end
    end
  end
  return workingText
end

FGlobal_gameExit_saveCurrentData = function()
  -- function num : 0_8 , upvalues : _addMessage
  (getSelfPlayer()):updateNavigationInformation(_addMessage:GetEditText())
  ;
  (getSelfPlayer()):saveCurrentDataForGameExit()
  ToClient_SaveUiInfo(false)
end

gameExit_UpdatePerFrame = function(deltaTime)
  -- function num : 0_9 , upvalues : exit_Time, prevTime, exitMode, _btn_NoticeMsg
  if exit_Time > 0 then
    exit_Time = exit_Time - deltaTime
    local remainTime = (math.floor)(exit_Time)
    if prevTime ~= remainTime then
      if remainTime < 0 then
        remainTime = 0
      end
      prevTime = remainTime
      if enum_ExitMode.eExitMode_GameExit == exitMode then
        _btn_NoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_EXIT", "remainTime", tostring(remainTime)))
        if prevTime <= 0 then
          exit_Time = -1
          _btn_NoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_PROGRESS"))
          doGameLogOut()
        end
      else
        if enum_ExitMode.eExitMode_BackCharacter == exitMode then
          _btn_NoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_SELECT", "remainTime", tostring(remainTime)))
          if prevTime <= 0 then
            exit_Time = -1
            _btn_NoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_CHARACTERSELECT"))
          end
        else
          if enum_ExitMode.eExitMode_SwapCharacter == exitMode then
            _btn_NoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_CHANGE", "remainTime", tostring(remainTime)))
            if prevTime <= 0 then
              exit_Time = -1
              _btn_NoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_SWAPCHARACTER"))
            end
          else
            _btn_NoticeMsg:SetShow(false)
          end
        end
      end
    end
  end
end

Panel_GameExit_sendGameDelayExitCancel = function()
  -- function num : 0_10 , upvalues : _btn_NoticeMsg, exitMode, prevTime, _btn_selectCharacter, _btn_gameExit, _btn_cancel, exit_Time
  if not _btn_NoticeMsg:GetShow() then
    return 
  end
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local cancelAble = true
  if (exitMode == enum_ExitMode.eExitMode_BackCharacter and (regionInfo:get()):isSafeZone() == true) or prevTime < 2 then
    cancelAble = false
  end
  if cancelAble == true then
    sendGameDelayExitCancel()
  end
  _btn_NoticeMsg:SetShow(false)
  _btn_selectCharacter:SetShow(true)
  _btn_gameExit:SetShow(true)
  _btn_cancel:SetShow(true)
  exit_Time = 0
  exitMode = -1
end

local prevClickIndex = 0
Panel_GameExit_ClickCharSlot = function(idx)
  -- function num : 0_11 , upvalues : prevClickIndex, isCharacterSelect, CharacterChangeButton, isCharacterSlot, photoIndex, consoleGroup
  if prevClickIndex ~= idx then
    (isCharacterSelect[prevClickIndex]):SetShow(false)
    ;
    (CharacterChangeButton[prevClickIndex]):SetShow(false)
    ;
    (isCharacterSlot[prevClickIndex]):ResetVertexAni()
    ;
    (isCharacterSlot[prevClickIndex]):SetAlpha(1)
    local groupIndex = 1 + prevClickIndex
    if photoIndex > 0 then
      groupIndex = groupIndex + 1
    end
    Panel_GameExit:deleteConsoleUIGroup(groupIndex, false)
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

    consoleGroup[groupIndex] = Panel_GameExit:addConsoleUIGroup(groupIndex, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
    ;
    (consoleGroup[groupIndex]):addControl(0, 0, 1, 1, isCharacterSlot[prevClickIndex])
  end
  do
    ;
    (isCharacterSelect[idx]):SetShow(true)
    ;
    (CharacterChangeButton[idx]):SetShow(true)
    ;
    (isCharacterSlot[idx]):ResetVertexAni()
    ;
    (isCharacterSlot[idx]):SetVertexAniRun("Ani_Color_New", true)
    local groupIndex = 1 + idx
    if photoIndex > 0 then
      groupIndex = groupIndex + 1
    end
    Panel_GameExit:deleteConsoleUIGroup(groupIndex, false)
    -- DECOMPILER ERROR at PC95: Confused about usage of register: R2 in 'UnsetPending'

    consoleGroup[groupIndex] = Panel_GameExit:addConsoleUIGroup(groupIndex, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
    ;
    (consoleGroup[groupIndex]):addControl(0, 0, 1, 1, CharacterChangeButton[idx])
    prevClickIndex = idx
  end
end

Panel_GameExit_ClickSelectCharacter = function()
  -- function num : 0_12 , upvalues : PP
  local contentStr = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_BACK_TO_CHARACTERSELECT_Q")
  local messageboxData = {title = "", content = contentStr, functionYes = Panel_GameExit_CharSelect_Yes, functionCancel = MessageBox_Empty_function, priority = PP.PAUIMB_PRIORITY_LOW, exitButton = true}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Panel_GameExit_CharSelect_Yes = function()
  -- function num : 0_13 , upvalues : exitMode, _btn_selectCharacter, _btn_gameExit, _btn_cancel, _btn_NoticeMsg, logoutDelayTime
  exitMode = enum_ExitMode.eExitMode_BackCharacter
  FGlobal_gameExit_saveCurrentData()
  sendCharacterSelect()
  _btn_selectCharacter:SetShow(false)
  _btn_gameExit:SetShow(false)
  _btn_cancel:SetShow(false)
  _btn_NoticeMsg:SetShow(true)
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if (regionInfo:get()):isSafeZone() == true then
    _btn_NoticeMsg:SetIgnore(true)
    _btn_NoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_CHARACTERSELECT"))
  else
    _btn_NoticeMsg:SetIgnore(false)
    _btn_NoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_SELECT", "remainTime", logoutDelayTime))
  end
end

local changeIndex = 0
Panel_GameExit_ChangeCharacter = function(index)
  -- function num : 0_14 , upvalues : changeIndex, const_64, ePcWorkingType, PP
  changeIndex = index
  local characterData = getCharacterDataByIndex(index)
  local classType = getCharacterClassType(characterData)
  if ToClient_IsCustomizeOnlyClass(classType) then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "LUA_LOBBY_SELECTCHARACTER_NOTYET_1"))
    return 
  end
  if characterData._level < 5 then
    NotifyDisplay(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_DONT_CHAGECHARACTER", "iLevel", 4))
    return 
  end
  local removeTime = getCharacterDataRemoveTime(index)
  if removeTime ~= nil then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_CHARACTER_DELETE"))
    return 
  end
  local usabelSlotCount = getUsableCharacterSlotCount()
  if usabelSlotCount <= index then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_CLOSE_CHARACTER_SLOT"))
    return 
  end
  local contentString = ""
  if const_64.s64_m1 ~= characterData._lastTicketNoByRegion then
    contentString = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_WAIT") .. "\n"
  end
  if ePcWorkingType.ePcWorkType_Empty ~= characterData._pcWorkingType then
    if ePcWorkingType.ePcWorkType_ReadBook == characterData._pcWorkingType then
      contentString = contentString .. PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_WORKING_NOW_READ_BOOK")
    else
      contentString = contentString .. PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_WORKING_NOW_CHANGE_Q")
    end
  end
  local pcDeliveryRegionKey = characterData._arrivalRegionKey
  local serverUtc64 = getServerUtc64()
  if pcDeliveryRegionKey:get() ~= 0 and serverUtc64 < characterData._arrivalTime then
    contentString = PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_SelectPcDelivery") .. "\n"
  end
  if contentString ~= nil then
    contentString = contentString .. PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHARACTER_CHANGE_QUESTION")
    local messageboxData = {title = "", content = contentString, functionYes = Panel_GameExit_CharChange_Confirm, functionCancel = MessageBox_Empty_function, priority = PP.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      Panel_GameExit_CharChange_Confirm()
    end
  end
end

Panel_GameExit_Transport = function()
  -- function num : 0_15
  FGlobal_DeliveryForGameExit_Show(true)
end

Panel_GameExit_CharChange_Confirm = function()
  -- function num : 0_16 , upvalues : changeIndex, exitMode, _btn_selectCharacter, _btn_gameExit, _btn_cancel, _btn_NoticeMsg, logoutDelayTime
  FGlobal_gameExit_saveCurrentData()
  local rv = swapCharacter_Select(changeIndex, true)
  if rv == false then
    return 
  end
  exitMode = enum_ExitMode.eExitMode_SwapCharacter
  _btn_selectCharacter:SetShow(false)
  _btn_gameExit:SetShow(false)
  _btn_cancel:SetShow(false)
  _btn_NoticeMsg:SetShow(true)
  _btn_NoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_CHANGE", "remainTime", logoutDelayTime))
end

Panel_GameExit_ClickGameOff = function()
  -- function num : 0_17 , upvalues : _exitConfirm_TitleText, _exitConfirm_ContentsString, _exitConfirm_TrayString, _exitConfirm_Chk_Tray, _exitConfirm_Chk_Tray_2
  _exitConfirm_TitleText:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_EXIT_MESSAGEBOX_TITLE"))
  _exitConfirm_ContentsString:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_GAMEEXIT_TRAY_ASK"))
  if isFullscreenMode() == false then
    _exitConfirm_TrayString:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITTRAY_TRAYHELP"))
    _exitConfirm_Chk_Tray:SetCheck(false)
    _exitConfirm_Chk_Tray:SetShow(true)
  else
    _exitConfirm_TrayString:SetText("")
    _exitConfirm_Chk_Tray:SetCheck(false)
    _exitConfirm_Chk_Tray:SetShow(false)
  end
  Panel_ExitConfirm:SetShow(true)
  _exitConfirm_Chk_Tray_2:SetShow(false)
end

FromClient_TrayIconMessageBox = function()
  -- function num : 0_18 , upvalues : _exitConfirm_TitleText, _exitConfirm_ContentsString, _exitConfirm_TrayString, _exitConfirm_Chk_Tray, _exitConfirm_Chk_Tray_2
  _exitConfirm_TitleText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITCONFIRM_TITLE"))
  _exitConfirm_ContentsString:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_GAMEEXIT_TRAY_ASK2"))
  _exitConfirm_TrayString:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_TRAYLIMIT"))
  _exitConfirm_Chk_Tray:SetCheck(true)
  _exitConfirm_Chk_Tray:SetShow(false)
  Panel_ExitConfirm:SetShow(true)
  _exitConfirm_Chk_Tray_2:SetShow(true)
end

Panel_GameExit_Minimize = function()
  -- function num : 0_19
  Panel_ExitConfirm:SetShow(false)
end

Panel_GameExit_MinimizeTray = function()
  -- function num : 0_20 , upvalues : _exitConfirm_Chk_Tray, _exitConfirm_Chk_Tray_2
  if Panel_GameExit:GetShow() then
    if _exitConfirm_Chk_Tray:IsCheck() == false then
      Panel_GameExit_GameOff_Yes()
    else
      Panel_ExitConfirm:SetShow(false)
      GameExit_Close()
      ToClient_CheckTrayIcon()
    end
  else
    if _exitConfirm_Chk_Tray_2:IsCheck() then
      ToClient_CheckTrayIcon()
    else
      ToClient_UnCheckTrayIcon()
    end
    Panel_ExitConfirm:SetShow(false)
  end
end

Panel_GameExit_GameOff_Yes = function()
  -- function num : 0_21 , upvalues : exitMode, _btn_NoticeMsg, logoutDelayTime, _btn_selectCharacter, _btn_gameExit, _btn_cancel
  exitMode = enum_ExitMode.eExitMode_GameExit
  FGlobal_gameExit_saveCurrentData()
  do
    local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
    if (regionInfo:get()):isSafeZone() == true then
      _btn_NoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_PROGRESS"))
      _btn_NoticeMsg:SetIgnore(true)
    else
      _btn_NoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_EXIT", "remainTime", logoutDelayTime))
      _btn_NoticeMsg:SetIgnore(false)
    end
    sendBeginGameDelayExit(enum_ExitMode.eExitMode_SwapCharacter == exitMode)
    _btn_selectCharacter:SetShow(false)
    _btn_gameExit:SetShow(false)
    _btn_cancel:SetShow(false)
    _btn_NoticeMsg:SetShow(true)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

doGameLogOut = function()
  -- function num : 0_22
  SetUIMode((Defines.UIMode).eUIMode_Default)
  sendGameLogOut()
end

setGameExitDelayTime = function(delayTime)
  -- function num : 0_23 , upvalues : exit_Time, _btn_NoticeMsg, exitMode
  if Panel_GameExit:GetShow() == false then
    return 
  end
  exit_Time = delayTime
  _btn_NoticeMsg:SetIgnore(false)
  if exit_Time == 0 then
    if enum_ExitMode.eExitMode_SwapCharacter == exitMode then
      _btn_NoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_SWAPCHARACTER"))
    else
      if enum_ExitMode.eExitMode_GameExit == exitMode then
        _btn_NoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_PROGRESS"))
      else
        if enum_ExitMode.eExitMode_BackCharacter == exitMode then
          _btn_NoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_CHARACTERSELECT"))
        end
      end
    end
  else
    if enum_ExitMode.eExitMode_SwapCharacter ~= exitMode then
      _btn_NoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_CHANGE", "remainTime", tostring(delayTime)))
    else
      if enum_ExitMode.eExitMode_GameExit == exitMode then
        _btn_NoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_EXIT", "remainTime", tostring(delayTime)))
      else
        if enum_ExitMode.eExitMode_BackCharacter == exitMode then
          _btn_NoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_SELECT", "remainTime", tostring(delayTime)))
        end
      end
    end
  end
end

characterInfoRequest = function()
  -- function num : 0_24
end

local prevUIMode = 0
GameExitShowToggle = function(isAttacked)
  -- function num : 0_25 , upvalues : _btn_NoticeMsg, prevUIMode, exitMode, _addMessage, _exitConfirm_Chk_Tray, isExitPhoto, photoIndex, _completeQuest, _progressingQuest, _dailyStampBanner, _dailyStampSlotBg, _dailyStampText, slot, isCharacterSlot, isCharacterSelect, CharacterChangeButton, charEnterWaiting
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITOPENALERT_INDEAD"))
    return 
  end
  if (CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode == (UI.Get_ProcessorInputMode)() then
    return 
  end
  local currentUIMode = GetUIMode()
  if currentUIMode == (Defines.UIMode).eUIMode_Gacha_Roulette or currentUIMode == (Defines.UIMode).eUIMode_DeadMessage then
    return 
  end
  if ToClient_cutsceneIsPlay() then
    return 
  end
  if isFlushedUI() then
    return 
  end
  if isAttacked then
    return 
  end
  do
    if isGameTypeRussia() and isAttacked then
      local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
      if (regionInfo:get()):isSafeZone() then
        return 
      end
    end
    local isShow = Panel_GameExit:IsShow()
    if isShow == true then
      if _btn_NoticeMsg:GetShow() then
        return 
      end
      Panel_GameExit:SetShow(false, true)
      SetUIMode(prevUIMode)
      ;
      (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode)
      if exitMode ~= -1 then
        Panel_GameExit_sendGameDelayExitCancel()
      end
      local focusEdit = GetFocusEdit()
      if focusEdit ~= nil and focusEdit:GetKey() == _addMessage:GetKey() then
        ClearFocusEdit()
      end
      if Panel_ExitConfirm:GetShow() then
        _exitConfirm_Chk_Tray:SetCheck(false)
        Panel_ExitConfirm:SetShow(false)
      end
    else
      do
        prevUIMode = GetUIMode()
        SetUIMode((Defines.UIMode).eUIMode_GameExit)
        Panel_GameExit:SetShow(true, true)
        sendWaitingListOfMyCharacters()
        if isExitPhoto == true then
          refreshCharacterInfoData(photoIndex)
        else
          refreshCharacterInfoData(0)
        end
        isExitPhoto = false
        ToClient_RequestRecentJournalByCount(5)
        ToClient_RequestCharacterEnchantFailCount()
        local questWrapper = nil
        local questNo0 = ((getSelfPlayer()):get()):getLastCompleteQuest(0)
        questWrapper = ToClient_getQuestWrapper(questNo0)
        if questWrapper ~= nil then
          _completeQuest:SetText(questWrapper:getTitle())
        else
          _completeQuest:SetText("-")
        end
        do
          local questNo1 = ((getSelfPlayer()):get()):getLastCompleteQuest(1)
          questWrapper = ToClient_getQuestWrapper(questNo1)
          if questWrapper ~= nil then
            _progressingQuest:SetText(questWrapper:getTitle())
          else
            _progressingQuest:SetText("-")
          end
          _addMessage:SetEditText(((getSelfPlayer()):get()):getUserMemo())
          local selfProxy = getSelfPlayer()
          local characterNo_64 = toInt64(0, 0)
          if selfProxy ~= nil then
            characterNo_64 = selfProxy:getCharacterNo_64()
          end
          _dailyStampBanner:SetShow(false)
          _dailyStampSlotBg:SetShow(false)
          _dailyStampText:SetShow(false)
          do
            if false then
              local rewardIndex = ToClient_getAttendanceCount()
              if rewardIndex > 0 then
                return 
              end
              if nil ~= nil then
                _dailyStampBanner:SetShow(true)
                _dailyStampSlotBg:SetShow(true)
                _dailyStampText:SetShow(true)
                slot:setItem(ToClient_getRewardItem(rewardIndex))
                ;
                (slot.icon):addInputEvent("Mouse_On", "GameExit_Tooltip_Show(" .. rewardIndex .. ")")
                ;
                (slot.icon):addInputEvent("Mouse_Out", "GameExit_Tooltip_Show()")
              end
            end
            local uiCount = 0
            local characterDatacount = getCharacterDataCount()
            for index = 0, 3 do
              local characterData = getCharacterDataByIndex(index)
              if characterData == nil then
                return 
              end
              if characterNo_64 ~= characterData._characterNo_s64 then
                (isCharacterSlot[index]):ResetVertexAni()
                ;
                (isCharacterSelect[index]):SetShow(false)
                ;
                (CharacterChangeButton[index]):SetShow(false)
              end
              if uiCount == 4 then
                break
              end
              uiCount = uiCount + 1
            end
            do
              local uiCount = 0
              local characterDatacount = getCharacterDataCount()
              for charIndex = 0, 3 do
                local characterData = getCharacterDataByIndex(charIndex)
                if characterData == nil then
                  return 
                end
                if characterData ~= nil and characterNo_64 ~= characterData._characterNo_s64 then
                  (charEnterWaiting[uiCount]):SetText("")
                  uiCount = uiCount + 1
                end
                if uiCount == 4 then
                  break
                end
              end
            end
          end
        end
      end
    end
  end
end

GameExit_Tooltip_Show = function(index)
  -- function num : 0_26 , upvalues : slot
  if index == nil then
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  local itemWrapper = ToClient_getRewardItem(index)
  local uiBase = slot.icon
  Panel_Tooltip_Item_Show(itemWrapper, uiBase, false, true)
end

FromClient_ResponseEnchantFailCountOfMyCharacters = function()
  -- function num : 0_27 , upvalues : normalStack, valksStack
  local uiCount = 0
  local characterDatacount = getCharacterDataCount()
  normalStack = {}
  valksStack = {}
  for index = 0, characterDatacount - 1 do
    local characterData = getCharacterDataByIndex(index)
    if characterData == nil then
      return 
    end
    local defaultCount = characterData._enchantFailCount
    local valksCount = characterData._valuePackCount
    local characterNo_64 = characterData._characterNo_s64
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R10 in 'UnsetPending'

    normalStack[characterNo_64] = defaultCount
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R10 in 'UnsetPending'

    valksStack[characterNo_64] = valksCount
  end
end

GameExit_SimpleTooltips = function(isShow, index, tipType, defaultCount, valksCount)
  -- function num : 0_28 , upvalues : isValksItem, normalStackPool, charWpCountPool
  local name, desc, control = nil
  if tipType == 0 then
    local isValksItemCheck = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GAMEEXIT_ENCHANTCOUNT_TOOLTIP", "defaultCount", tostring(defaultCount), "valksCount", tostring(valksCount))
    if isValksItem then
      isValksItemCheck = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GAMEEXIT_ENCHANTCOUNT_TOOLTIP", "defaultCount", tostring(defaultCount), "valksCount", tostring(valksCount))
    else
      isValksItemCheck = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_ENCHANTCOUNT_TOOLTIP_ADDCOUNT_NONE", "defaultCount", tostring(defaultCount))
    end
    name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_NORMALSTACK_TOOLTIP_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_NORMALSTACK_TOOLTIP_DESC") .. isValksItemCheck
    control = normalStackPool[index]
  else
    do
      if tipType == 1 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHARWP_TITLE")
        desc = PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_DESC_WP")
        control = charWpCountPool[index]
      end
      registTooltipControl(control, Panel_Tooltip_SimpleText)
      if isShow == true then
        TooltipSimple_Show(control, name, desc)
      else
        TooltipSimple_Hide()
      end
    end
  end
end

GameExit_Close = function()
  -- function num : 0_29 , upvalues : _btn_NoticeMsg, prevUIMode, exitMode, _addMessage, _exitConfirm_Chk_Tray, isCharacterSlot, isCharacterSelect, CharacterChangeButton, charEnterWaiting, isTrayMode
  if _btn_NoticeMsg:GetShow() then
    return 
  end
  Panel_GameExit:SetShow(false, true)
  SetUIMode(prevUIMode)
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode)
  if exitMode ~= -1 then
    Panel_GameExit_sendGameDelayExitCancel()
  end
  local focusEdit = GetFocusEdit()
  if focusEdit ~= nil and focusEdit:GetKey() == _addMessage:GetKey() then
    ClearFocusEdit()
  end
  if Panel_ExitConfirm:GetShow() then
    _exitConfirm_Chk_Tray:SetCheck(false)
    Panel_ExitConfirm:SetShow(false)
  end
  local selfProxy = getSelfPlayer()
  local characterNo_64 = toInt64(0, 0)
  if selfProxy ~= nil then
    characterNo_64 = selfProxy:getCharacterNo_64()
  end
  local uiCount = 0
  local characterDatacount = getCharacterDataCount()
  for index = 0, 3 do
    local characterData = getCharacterDataByIndex(index)
    if characterData == nil then
      return 
    end
    if characterNo_64 ~= characterData._characterNo_s64 then
      (isCharacterSlot[index]):ResetVertexAni()
      ;
      (isCharacterSelect[index]):SetShow(false)
      ;
      (CharacterChangeButton[index]):SetShow(false)
    end
    if uiCount == 4 then
      break
    end
    uiCount = uiCount + 1
  end
  do
    local uiCount = 0
    local characterDatacount = getCharacterDataCount()
    for charIndex = 0, 3 do
      local characterData = getCharacterDataByIndex(charIndex)
      if characterData == nil then
        return 
      end
      if characterData ~= nil and characterNo_64 ~= characterData._characterNo_s64 then
        (charEnterWaiting[uiCount]):SetText("-")
        uiCount = uiCount + 1
      end
      if uiCount == 4 then
        break
      end
    end
    do
      if isTrayMode == true then
        ToClient_UnCheckTrayIcon()
        Panel_ExitConfirm:SetShow(false)
      end
    end
  end
end

FromClient_RecentJournal_Update = function()
  -- function num : 0_30 , upvalues : journalContents, UI_TM, journalFrameContents, journalFrame, journalFrameScroll
  journalContents:SetText("")
  local journal_Count = ToClient_GetRecentJournalCount()
  if journal_Count > 0 then
    for journal_Idx = 0, journal_Count - 1 do
      local journalWrapper = ToClient_GetRecentJournalByIndex(journal_Idx)
      local stringData = "[" .. (string.format)("%.02d", journalWrapper:getJournalHour()) .. ":" .. (string.format)("%.02d", journalWrapper:getJournalMinute()) .. "] " .. journalWrapper:getName()
      if journal_Idx == 0 then
        journalContents:SetTextMode(UI_TM.eTextMode_LimitText)
        journalContents:SetText(stringData)
      else
        journalContents:SetTextMode(UI_TM.eTextMode_LimitText)
        journalContents:SetText(journalContents:GetText() .. "\n" .. stringData)
      end
      journalFrameContents:SetSize(journalFrameContents:GetSizeX(), journalContents:GetTextSizeY())
    end
  else
    do
      journalContents:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_JOURNALCONTENTS"))
      if journalFrame:GetSizeY() < journalFrameContents:GetSizeY() then
        journalFrameScroll:SetShow(true)
      else
        journalFrameScroll:SetShow(false)
      end
      journalFrame:UpdateContentScroll()
      journalFrame:UpdateContentPos()
    end
  end
end

GameExit_onScreenResize = function()
  -- function num : 0_31 , upvalues : _block_BG
  Panel_GameExit:ComputePos()
  _block_BG:SetSize(getScreenSizeX() + 50, getScreenSizeY() + 50)
  _block_BG:SetHorizonCenter()
  _block_BG:SetVerticalMiddle()
end

Panel_GameExit_Initialize()
local registEventHandler = function()
  -- function num : 0_32 , upvalues : _btn_cancel, _btn_winClose, _btn_gameExit, _btn_selectCharacter, _btn_NoticeMsg, _buttonQuestion, _exitConfirm_Btn_Confirm, _exitConfirm_Btn_Cancle
  _btn_cancel:addInputEvent("Mouse_LUp", "GameExit_Close()")
  _btn_winClose:addInputEvent("Mouse_LUp", "GameExit_Close()")
  _btn_gameExit:addInputEvent("Mouse_LUp", "Panel_GameExit_ClickGameOff()")
  _btn_selectCharacter:addInputEvent("Mouse_LUp", "Panel_GameExit_ClickSelectCharacter()")
  _btn_NoticeMsg:addInputEvent("Mouse_LUp", "Panel_GameExit_sendGameDelayExitCancel()")
  _buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelGameExit\" )")
  _buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelGameExit\", \"true\")")
  _buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelGameExit\", \"false\")")
  _exitConfirm_Btn_Confirm:addInputEvent("Mouse_LUp", "Panel_GameExit_MinimizeTray()")
  _exitConfirm_Btn_Cancle:addInputEvent("Mouse_LUp", "Panel_GameExit_Minimize()")
end

local registMessageHandler = function()
  -- function num : 0_33 , upvalues : photoIndex
  Panel_GameExit:RegisterUpdateFunc("gameExit_UpdatePerFrame")
  registerEvent("EventGameExitDelayTime", "setGameExitDelayTime")
  registerEvent("EventReceiveEnterWating", "refreshCharacterInfoData(" .. photoIndex .. ")")
  registerEvent("EventGameWindowClose", "GameExitShowToggle()")
  registerEvent("FromClient_RecentJournal_Update", "FromClient_RecentJournal_Update")
  registerEvent("FromClient_TrayIconMessageBox", "FromClient_TrayIconMessageBox")
  registerEvent("FromClient_ResponseEnchantFailCountOfMyCharacters", "refreshCharacterInfoData(" .. photoIndex .. ")")
  registerEvent("onScreenResize", "GameExit_onScreenResize")
end

registEventHandler()
registMessageHandler()
ToClient_RequestCharacterEnchantFailCount()
ConsoleGroupCreate_Panel_GameExit = function()
  -- function num : 0_34 , upvalues : _btn_selectCharacter, _btn_gameExit, _btn_cancel, _btn_FacePhoto
  local group_0 = Panel_GameExit:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_0:addControl(0, 0, 4, 1, _btn_selectCharacter)
  group_0:addControl(1, 0, 4, 1, _btn_gameExit)
  group_0:addControl(2, 0, 4, 1, _btn_cancel)
  group_0:addControl(3, 0, 4, 1, _btn_FacePhoto)
end

ConsoleGroupCreate_Panel_ExitConfirm = function()
  -- function num : 0_35 , upvalues : _exitConfirm_Btn_Confirm, _exitConfirm_Btn_Cancle, _exitConfirm_Chk_Tray
  local group_ExitConfirm = Panel_GameExit:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_ExitConfirm:addControl(0, 0, 3, 1, _exitConfirm_Btn_Confirm)
  group_ExitConfirm:addControl(1, 0, 3, 1, _exitConfirm_Btn_Cancle)
  group_ExitConfirm:addControl(2, 0, 3, 1, _exitConfirm_Chk_Tray)
end

ConsoleGroupCreate_Panel_GameExit()
ConsoleGroupCreate_Panel_ExitConfirm()

