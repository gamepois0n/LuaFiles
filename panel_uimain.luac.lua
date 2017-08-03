-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\uicontrolbar\panel_uimain.luac 

-- params : ...
-- function num : 0
Panel_UIMain:SetShow(true, false)
Panel_DailyStamp_Alert:SetShow(false)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local VCK = CppEnums.VirtualKeyCode
local UI_IT = CppEnums.UiInputType
local UIMode = Defines.UIMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local animationEndTime = 0.15
local elapsedTime = 0
local newQuestDeltaTime = 0
local isOn = false
local checkNewQuestForEffect = false
local blackMsgShowTime = 10
local btn_totalSizeTmp = 0
local btn_totalSize = 0
local _fold_UIMain = true
local _use_ForSimpleUI = true
local _badgeFriend = nil
local _badges = {Count = 0, Quest = false, BlackSpirit = false, Skill = false, Item = false, Knowledge = false, FriendList = false}
local isCouponOpen = ToClient_IsContentsGroupOpen("224")
local _badgeWidget = (UI.getChildControl)(Panel_UIMain, "StaticText_Number")
local _gameExitButton = false
Panel_UIMain:RegisterShowEventFunc(true, "Panel_UIMain_ShowAni()")
Panel_UIMain:RegisterShowEventFunc(false, "Panel_UIMain_HideAni()")
Panel_UIMain:SetIgnore(true)
Panel_UIMain_ShowAni = function()
  -- function num : 0_0
end

Panel_UIMain_HideAni = function()
  -- function num : 0_1
end

local MenuButtonId = {Btn_GameExit = 1, Btn_Setting = 2, Btn_Menu = 3, Btn_Beauty = 4, Btn_CashShop = 5, Btn_Mail = 6, Btn_FriendList = 7, Btn_BlackStone = 8, Btn_Guild = 9}
local contry = {kr = 0, jp = 1, ru = 2, cn = 3, tw = 4}
local cashIconTexture = {
{165, 202, 205, 242}
, 
{83, 161, 123, 201}
, 
{83, 161, 123, 201}
, 
{83, 161, 123, 201}
; 
[0] = {83, 161, 123, 201}
}
local cashIcon_UiMainchangeButtonTexture = function(control, contry)
  -- function num : 0_2 , upvalues : cashIconTexture
  local x1, y1, x2, y2 = setTextureUV_Func(control, (cashIconTexture[contry])[1], (cashIconTexture[contry])[2], (cashIconTexture[contry])[3], (cashIconTexture[contry])[4])
  return x1, y1, x2, y2
end

local MenuButtons = (Array.new)()
local showedMenuButtonList = (Array.new)()
local _bubbleNotice = (UI.getChildControl)(Panel_UIMain, "StaticText_Notice")
Panel_UIMain:SetChildIndex(_bubbleNotice, 9999)
local blackQuestIcon = (UI.getChildControl)(Panel_NewQuest_Alarm, "Static_BlackIcon")
local blackQuestCall = (UI.getChildControl)(Panel_NewQuest_Alarm, "StaticText_CallingYou")
local blackSpritCall = (UI.getChildControl)(Panel_UIMain, "StaticText_BlackSpritCall")
blackSpritCall:SetShow(false)
local challengeIcon = (UI.getChildControl)(Panel_ChallengeReward_Alert, "Static_Icon")
local dailyStampAlert = (UI.getChildControl)(Panel_DailyStamp_Alert, "Static_Icon")
local couponIcon = (UI.getChildControl)(Panel_Coupon_Alert, "Static_Icon")
local couponCount = (UI.getChildControl)(Panel_Coupon_Alert, "StaticText_Number")
if ToClient_GetAttendanceInfoWrapper(0) ~= nil then
  dailyStampAlert:addInputEvent("Mouse_LUp", "UIMain_DailyStmp_SetAttendanceAll()")
  dailyStampAlert:addInputEvent("Mouse_On", "ShowTooltip_DailyStampIcon( true )")
  dailyStampAlert:addInputEvent("Mouse_Out", "ShowTooltip_DailyStampIcon()")
end
UIMain_DailyStmp_SetAttendanceAll = function()
  -- function num : 0_3
  FGlobal_DailyStamp_SetAttendanceAll()
  TooltipSimple_Hide()
  Panel_DailyStamp_Alert:SetShow(false)
end

ShowTooltip_DailyStampIcon = function(isShow)
  -- function num : 0_4 , upvalues : dailyStampAlert
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local uiControl = dailyStampAlert
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_DAILYSTAMP_TITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_DAILYSTAMP_DESC")
  TooltipSimple_Show(uiControl, name, desc)
end

FGlobal_DailyStamp_CheckAttendance = function(isShow)
  -- function num : 0_5
  if Panel_DailyStamp_Alert:GetShow() ~= isShow then
    Panel_DailyStamp_Alert:SetShow(isShow)
    if isShow then
      UIMain_DailyStmp_SetAttendanceAll()
    end
  end
  if isShow then
    FGlobal_DailyStmpIcon_SetPos()
  end
end

FGlobal_DailyStmpIcon_SetPos = function()
  -- function num : 0_6
  if Panel_NewEventProduct_Alarm:GetShow() then
    Panel_DailyStamp_Alert:SetPosX(Panel_NewEventProduct_Alarm:GetPosX() - Panel_DailyStamp_Alert:GetSizeX() - 10)
  else
    if Panel_ChallengeReward_Alert:GetShow() then
      Panel_DailyStamp_Alert:SetPosX(Panel_ChallengeReward_Alert:GetPosX() - Panel_DailyStamp_Alert:GetSizeX() - 20)
    else
      if Panel_Coupon_Alert:GetShow() then
        Panel_DailyStamp_Alert:SetPosX(Panel_ChallengeReward_Alert:GetPosX() - Panel_DailyStamp_Alert:GetSizeX() - 30)
      else
        Panel_DailyStamp_Alert:SetPosX(getScreenSizeX() - Panel_DailyStamp_Alert:GetSizeX() - 10)
      end
    end
  end
  Panel_DailyStamp_Alert:SetPosY(Panel_ChallengeReward_Alert:GetPosY() - 10)
end

local buttonAni = (UI.getChildControl)(Panel_UIMain, "Static_NewEffect_Ani")
local MenuButton_CheckEnAble = function(buttonType)
  -- function num : 0_7 , upvalues : MenuButtonId
  local returnValue = false
  if buttonType == MenuButtonId.Btn_CashShop or buttonType == MenuButtonId.Btn_Beauty then
    if getContentsServiceType() ~= (CppEnums.ContentsServiceType).eContentsServiceType_Commercial then
      returnValue = false
    else
      returnValue = true
    end
  else
    returnValue = true
  end
  return returnValue
end

initMenuButtons = function()
  -- function num : 0_8 , upvalues : MenuButtonId, UI_IT, MenuButtons, cashIcon_UiMainchangeButtonTexture, contry, buttonAni, UI_PUCT, MenuButton_CheckEnAble
  local MenuButtonControlId = {[MenuButtonId.Btn_GameExit] = "Button_GameExit", [MenuButtonId.Btn_Setting] = "Button_Setting", [MenuButtonId.Btn_Menu] = "Button_Menu", [MenuButtonId.Btn_BlackStone] = "Button_BlackStone", [MenuButtonId.Btn_Beauty] = "Button_Beauty", [MenuButtonId.Btn_CashShop] = "Button_CashShop", [MenuButtonId.Btn_Mail] = "Button_Mail", [MenuButtonId.Btn_FriendList] = "Button_FriendList", [MenuButtonId.Btn_Guild] = "Button_Guild"}
  local MenuButtonEventFunction = {[MenuButtonId.Btn_GameExit] = "GameExitShowToggle(false)", [MenuButtonId.Btn_Setting] = "showGameOption()", [MenuButtonId.Btn_Menu] = "Panel_Menu_ShowToggle()", [MenuButtonId.Btn_BlackStone] = "GlobalKeyBinder_MouseKeyMap(" .. UI_IT.UiInputType_BlackSpirit .. ")", [MenuButtonId.Btn_Beauty] = "IngameCustomize_Show()", [MenuButtonId.Btn_CashShop] = "GlobalKeyBinder_MouseKeyMap(" .. UI_IT.UiInputType_CashShop .. ")", [MenuButtonId.Btn_Mail] = "GlobalKeyBinder_MouseKeyMap(" .. UI_IT.UiInputType_Mail .. ")", [MenuButtonId.Btn_FriendList] = "GlobalKeyBinder_MouseKeyMap(" .. UI_IT.UiInputType_FriendList .. ")", [MenuButtonId.Btn_Guild] = "GlobalKeyBinder_MouseKeyMap(" .. UI_IT.UiInputType_Guild .. ")"}
  MenuButtons:resize(#MenuButtonId, nil)
  local panel = Panel_UIMain
  for idx,controlId in ipairs(MenuButtonControlId) do
    local button = (UI.getChildControl)(panel, controlId)
    button:addInputEvent("Mouse_On", "UIMain_MouseOverEvent(" .. idx .. ")")
    button:addInputEvent("Mouse_Out", "UIMain_MouseOutEvent(" .. idx .. ")")
    button:ActiveMouseEventEffect(true)
    local eventFunction = MenuButtonEventFunction[idx]
    if eventFunction ~= nil then
      button:addInputEvent("Mouse_LUp", eventFunction)
    end
    if MenuButtonId.Btn_CashShop == idx then
      button:ChangeTextureInfoName("New_UI_Common_forLua/Widget/UIControl/UI_Control_00.dds")
      local x1, y1, x2, y2 = 0, 0, 0, 0
      if getGameServiceType() == 0 or getGameServiceType() == 1 or getGameServiceType() == 2 or getGameServiceType() == 3 or getGameServiceType() == 4 then
        x1 = cashIcon_UiMainchangeButtonTexture(button, contry.kr)
      else
        -- DECOMPILER ERROR at PC175: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC176: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC177: Overwrote pending register: R11 in 'AssignReg'

        if getGameServiceType() == 5 or getGameServiceType() == 6 then
          x1 = cashIcon_UiMainchangeButtonTexture(button, contry.jp)
        else
          -- DECOMPILER ERROR at PC193: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC194: Overwrote pending register: R12 in 'AssignReg'

          -- DECOMPILER ERROR at PC195: Overwrote pending register: R11 in 'AssignReg'

          if getGameServiceType() == 7 or getGameServiceType() == 8 then
            x1 = cashIcon_UiMainchangeButtonTexture(button, contry.ru)
          else
            -- DECOMPILER ERROR at PC211: Overwrote pending register: R13 in 'AssignReg'

            -- DECOMPILER ERROR at PC212: Overwrote pending register: R12 in 'AssignReg'

            -- DECOMPILER ERROR at PC213: Overwrote pending register: R11 in 'AssignReg'

            if getGameServiceType() == 9 or getGameServiceType() == 10 then
              x1 = cashIcon_UiMainchangeButtonTexture(button, contry.cn)
            else
              -- DECOMPILER ERROR at PC225: Overwrote pending register: R13 in 'AssignReg'

              -- DECOMPILER ERROR at PC226: Overwrote pending register: R12 in 'AssignReg'

              -- DECOMPILER ERROR at PC227: Overwrote pending register: R11 in 'AssignReg'

              if isGameTypeTaiwan() then
                x1 = cashIcon_UiMainchangeButtonTexture(button, contry.tw)
              else
                -- DECOMPILER ERROR at PC235: Overwrote pending register: R13 in 'AssignReg'

                -- DECOMPILER ERROR at PC236: Overwrote pending register: R12 in 'AssignReg'

                -- DECOMPILER ERROR at PC237: Overwrote pending register: R11 in 'AssignReg'

                x1 = cashIcon_UiMainchangeButtonTexture(button, contry.kr)
              end
            end
          end
        end
      end
      ;
      (button:getBaseTexture()):setUV(x1, y1, x2, y2)
      button:setRenderTexture(button:getBaseTexture())
    end
    do
      do
        -- DECOMPILER ERROR at PC252: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC254: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC256: Overwrote pending register: R13 in 'AssignReg'

        -- DECOMPILER ERROR at PC261: Confused about usage of register: R10 in 'UnsetPending'

        buttonAni[idx] = (y1.createControl)(x2.PA_UI_CONTROL_STATIC, y2, "Static_ButtonAni" .. idx)
        CopyBaseProperty(buttonAni, buttonAni[idx])
        ;
        (buttonAni[idx]):SetPosX((button[idx]):GetPosX() - 2)
        ;
        (buttonAni[idx]):SetPosY(button:GetPosY())
        ;
        (buttonAni[idx]):SetShow(false)
        if MenuButton_CheckEnAble(idx) then
          button:SetShow(true)
        else
          button:SetShow(false)
        end
        -- DECOMPILER ERROR at PC299: Confused about usage of register: R10 in 'UnsetPending'

        MenuButtons[idx] = button
        -- DECOMPILER ERROR at PC300: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
end

Panel_UIMain_CheckBtnVisibility = function()
  -- function num : 0_9 , upvalues : MenuButtons, MenuButtonId, showedMenuButtonList, MenuButton_CheckEnAble
  local selfPlayerWrapper = getSelfPlayer()
  local guildShow = (selfPlayerWrapper ~= nil and (selfPlayerWrapper:get()):isGuildMember())
  ;
  (MenuButtons[MenuButtonId.Btn_Guild]):SetShow(guildShow)
  showedMenuButtonList = (Array.new)()
  for idx,button in ipairs(MenuButtons) do
    if button:GetShow() and MenuButton_CheckEnAble(idx) then
      showedMenuButtonList:push_back(button)
    end
  end
  -- DECOMPILER ERROR: 3 unprocessed JMP targets
end

Panel_UIMain_SetScreenSize = function()
  -- function num : 0_10 , upvalues : MenuButtons, MenuButtonId, showedMenuButtonList, btn_totalSizeTmp, btn_totalSize
  local ScrX = getScreenSizeX()
  local btn_Count = 10
  Panel_UIMain:SetSize((MenuButtons[MenuButtonId.Btn_GameExit]):GetSizeX() * btn_Count, 38)
  Panel_UIMain:ComputePos()
  local count = showedMenuButtonList:length()
  if count == 0 then
    return 
  end
  local _styleInfo = (UI.getChildControl)(Panel_UIMain, "Button_PlayerInfo")
  local startPos_FirstRaw = Panel_UIMain:GetSizeX() - _styleInfo:GetSizeX()
  local gapPos = -(_styleInfo:GetSizeX() + _styleInfo:GetSizeX() * 0.1)
  local buttonSpanY = 0
  for key,button in ipairs(showedMenuButtonList) do
    button:SetScale(1, 1)
    button:SetVerticalBottom()
    button:SetPosX(startPos_FirstRaw)
    button:SetSpanSize((button:GetSpanSize()).x, 0)
    btn_totalSizeTmp = btn_totalSizeTmp + button:GetSizeX()
  end
  btn_totalSize = btn_totalSizeTmp
  btn_totalSizeTmp = 0
  local SpanY = Panel_UIMain:GetSizeY()
  Panel_NewQuest_Alarm:SetSpanSize(-33, SpanY)
end

local bubbleNoticeData = {
{_x = 70, _y = 50, _text = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_NOTICE_GAMEEND")}
, 
{_x = 70, _y = 50, _text = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_NOTICE_OPTION")}
, 
{_x = 70, _y = 50, _text = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_GAMEMENU")}
, 
{_x = 115, _y = 50, _text = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_NOTICE_BEAUTY")}
, 
{_x = 115, _y = 50, _text = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_NOTICE_CASHSHOP")}
, 
{_x = 70, _y = 50, _text = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_NOTICE_MAIL")}
, 
{_x = 70, _y = 50, _text = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_NOTICE_FRIEND")}
, 
{_x = 115, _y = 50, _text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UIMAIN_NOTICE_BLACKSTONE", "getKey", keyCustom_GetString_UiKey(UI_IT.UiInputType_BlackSpirit))}
, 
{_x = 70, _y = 50, _text = PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_NOTICE_GUILD")}
}
UIMain_MouseOverEvent = function(index)
  -- function num : 0_11 , upvalues : elapsedTime, isOn, MenuButtons, bubbleNoticeData, _bubbleNotice
  audioPostEvent_SystemUi(0, 13)
  elapsedTime = 0
  isOn = true
  local button = MenuButtons[index]
  button:SetAlpha(1)
  button:ResetVertexAni()
  button:SetVertexAniRun("Ani_Color_UIMain_Bright", true)
  if bubbleNoticeData[index] ~= nil then
    _bubbleNotice:SetText((bubbleNoticeData[index])._text)
  else
    _bubbleNotice:SetText((bubbleNoticeData[1])._text)
  end
  _bubbleNotice:SetSize(_bubbleNotice:GetTextSizeX() + 10, _bubbleNotice:GetSizeY())
  _bubbleNotice:SetPosX(button:GetPosX() - _bubbleNotice:GetSizeX())
  if index < 16 then
    _bubbleNotice:SetPosY(-45)
  else
    _bubbleNotice:SetPosY(-90)
  end
  _bubbleNotice:ComputePos()
  _bubbleNotice:SetShow(true)
end

UIMain_MouseOutEvent = function(index)
  -- function num : 0_12 , upvalues : elapsedTime, isOn, MenuButtons, _bubbleNotice
  elapsedTime = 0
  isOn = false
  local button = MenuButtons[index]
  button:ResetVertexAni()
  _bubbleNotice:SetShow(false)
  MenuButtons_SetAlpha()
end

MenuButtons_SetAlpha = function()
  -- function num : 0_13 , upvalues : MenuButtons
  for idx,button in ipairs(MenuButtons) do
    button:SetAlpha(0.55)
  end
end

UIMain_FriendsUpdate = function()
  -- function num : 0_14 , upvalues : MenuButtons, MenuButtonId
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  if isColorBlindMode == 0 then
    (MenuButtons[MenuButtonId.Btn_FriendList]):EraseAllEffect()
    ;
    (MenuButtons[MenuButtonId.Btn_FriendList]):AddEffect("fUI_Friend_01A", true, -0.5, 0)
  else
    if isColorBlindMode == 1 then
      (MenuButtons[MenuButtonId.Btn_FriendList]):EraseAllEffect()
      ;
      (MenuButtons[MenuButtonId.Btn_FriendList]):AddEffect("fUI_Friend_01B", true, -0.5, 0)
    else
      if isColorBlindMode == 2 then
        (MenuButtons[MenuButtonId.Btn_FriendList]):EraseAllEffect()
        ;
        (MenuButtons[MenuButtonId.Btn_FriendList]):AddEffect("fUI_Friend_01B", true, -0.5, 0)
      end
    end
  end
end

FGlobal_ChangeEffectCheck = function()
  -- function num : 0_15 , upvalues : checkNewQuestForEffect
  checkNewQuestForEffect = false
end

local deltaTime = 0
UIMain_QuestUpdate = function()
  -- function num : 0_16 , upvalues : blackMsgShowTime, checkNewQuestForEffect, buttonAni, MenuButtonId, MenuButtons, blackSpritCall, UI_IT, blackQuestIcon
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  if ((getSelfPlayer()):get()):getLevel() < 11 then
    blackMsgShowTime = 5
  else
    if getGameServiceType() == 5 or getGameServiceType() == 6 or getGameServiceType() == 7 or getGameServiceType() == 8 then
      blackMsgShowTime = 5
    else
      blackMsgShowTime = 10
    end
  end
  if questList_doHaveNewQuest() and checkNewQuestForEffect == false then
    Panel_NewQuest_Alarm:SetShow(false)
    FGlobal_MessageHistory_InputMSG(0, PAGetString(Defines.StringSheet_GAME, "LUA_UIMAIN_MESSAGEHISTORY_NEWSPRITQUEST"))
    FGlobal_NewMainQuest_Alarm_Open()
    ;
    (buttonAni[MenuButtonId.Btn_BlackStone]):SetShow(false)
    audioPostEvent_SystemUi(4, 11)
    if isColorBlindMode == 0 then
      (MenuButtons[MenuButtonId.Btn_BlackStone]):EraseAllEffect()
      ;
      (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("UI_DarkSprit_Summon", false, 0, 0)
      ;
      (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("fUI_DarkSprit_Summon", false, 0, 0)
      ;
      (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("UI_DarkSpirit_RedAura_Icon", true, 0, 0)
      ;
      (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("fUI_BlackSoul_Aura01", true, 0, 0)
    else
      if isColorBlindMode == 1 then
        (MenuButtons[MenuButtonId.Btn_BlackStone]):EraseAllEffect()
        ;
        (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("fUI_DarkSprit_Summon", false, 0, 0)
        ;
        (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("UI_DarkSpirit_RedAura_Icon_A", true, 0, 0)
        ;
        (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("fUI_BlackSoul_Aura02", true, 0, 0)
      else
        if isColorBlindMode == 2 then
          (MenuButtons[MenuButtonId.Btn_BlackStone]):EraseAllEffect()
          ;
          (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("fUI_DarkSprit_Summon", false, 0, 0)
          ;
          (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("UI_DarkSpirit_RedAura_Icon_A", true, 0, 0)
          ;
          (MenuButtons[MenuButtonId.Btn_BlackStone]):AddEffect("fUI_BlackSoul_Aura02", true, 0, 0)
        end
      end
    end
    blackSpritCall:SetShow(true)
    blackSpritCall:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UIMAIN_BLACKSPIRIT_TOOLTIP", "getKey", keyCustom_GetString_UiKey(UI_IT.UiInputType_BlackSpirit)))
    blackSpritCall:SetPosX(-67)
    blackSpritCall:SetPosY(-15)
    checkNewQuestForEffect = true
  else
    if questList_doHaveNewQuest() == false and checkNewQuestForEffect == true then
      (MenuButtons[MenuButtonId.Btn_BlackStone]):EraseAllEffect()
      ;
      (buttonAni[MenuButtonId.Btn_BlackStone]):SetShow(false)
      blackSpritCall:SetShow(false)
      Panel_NewQuest_Alarm:SetShow(false)
      blackQuestIcon:EraseAllEffect()
      checkNewQuestForEffect = false
    end
  end
end

UIMain_ChallengeUpdate = function()
  -- function num : 0_17 , upvalues : challengeIcon
  challengeIcon:SetEnableArea(0, 0, challengeIcon:GetSizeX(), challengeIcon:GetSizeY())
  challengeIcon:addInputEvent("Mouse_LUp", "_challengeCall_byNewChallengeAlarm()")
end

local isBlackSpiritClicked = false
_blackSpritCall_byNewQuestAlarm = function()
  -- function num : 0_18
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_SUMMON_BLACKSPIRIT"))
    return 
  end
  if PaGlobal_TutorialManager:isDoingTutorial() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
    return 
  end
  audioPostEvent_SystemUi(0, 5)
  ToClient_AddBlackSpiritFlush()
end

_challengeCall_byNewChallengeAlarm = function()
  -- function num : 0_19
  audioPostEvent_SystemUi(0, 5)
  if GetUIMode() == (Defines.UIMode).eUIMode_Gacha_Roulette then
    return 
  end
  if not Panel_Window_CharInfo_Status:GetShow() then
    Panel_Window_CharInfo_Status:SetShow(true)
    FGlobal_CharInfoStatusShowAni()
    audioPostEvent_SystemUi(1, 34)
  end
  HandleClicked_CharacterInfo_Tab(3)
  HandleClickedTapButton(5)
end

initMenuButtons()
Panel_UIMain_CheckBtnVisibility()
Panel_UIMain_SetScreenSize()
Tutorial_InventoryOpen = function()
  -- function num : 0_20
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  do
    local playerLevel = (selfPlayer:get()):getLevel()
    if playerLevel > 3 or Panel_Window_Inventory:GetShow() == false then
    end
  end
end

local setAlphaAll = function(alpha)
  -- function num : 0_21 , upvalues : _bubbleNotice
  _bubbleNotice:SetFontAlpha(alpha)
  _bubbleNotice:SetAlpha(alpha)
end

uiMainUpdate = function(updateTime)
  -- function num : 0_22 , upvalues : elapsedTime, _bubbleNotice, isOn, animationEndTime, setAlphaAll, blackSpritCall, newQuestDeltaTime, blackMsgShowTime
  elapsedTime = elapsedTime + updateTime
  if _bubbleNotice:GetShow() == true then
    if isOn == false then
      local temp = animationEndTime - elapsedTime
      if temp < 0 then
        temp = 0
        _bubbleNotice:SetShow(false)
      end
      setAlphaAll(temp / animationEndTime)
    else
      do
        do
          local temp = elapsedTime / animationEndTime
          if temp > 1 then
            temp = 1
          end
          setAlphaAll(temp)
          if blackSpritCall:GetShow() then
            if Panel_RaceTimeAttack:GetShow() then
              Panel_NewQuest:SetShow(false)
              return 
            end
            newQuestDeltaTime = newQuestDeltaTime + updateTime
            if blackMsgShowTime <= newQuestDeltaTime then
              audioPostEvent_SystemUi(4, 11)
              FGlobal_NewMainQuest_Alarm_Open()
              newQuestDeltaTime = 0
            end
          end
        end
      end
    end
  end
end

ResetPos_WidgetButton = function()
  -- function num : 0_23 , upvalues : MenuButtons, MenuButtonId, showedMenuButtonList, btn_totalSizeTmp
  local ScrX = getScreenSizeX()
  local btn_Count = 7
  Panel_UIMain:SetSize((MenuButtons[MenuButtonId.Btn_GameExit]):GetSizeX() * btn_Count, 38)
  Panel_UIMain:ComputePos()
  local count = showedMenuButtonList:length()
  if count == 0 then
    return 
  end
  local _styleInfo = (UI.getChildControl)(Panel_UIMain, "Button_PlayerInfo")
  local startPos_FirstRaw = Panel_UIMain:GetSizeX() - _styleInfo:GetSizeX()
  local gapPos = -(_styleInfo:GetSizeX() + _styleInfo:GetSizeX() * 0.1)
  local buttonSpanY = 0
  for key,button in ipairs(showedMenuButtonList) do
    button:SetScale(1, 1)
    button:SetVerticalBottom()
    button:SetPosX(startPos_FirstRaw)
    button:SetSpanSize((button:GetSpanSize()).x, 0)
    startPos_FirstRaw = startPos_FirstRaw + gapPos
    btn_totalSizeTmp = btn_totalSizeTmp + button:GetSizeX()
  end
end

FromClient_NewFriendAlert = function(param)
  -- function num : 0_24 , upvalues : MenuButtons, MenuButtonId, _badgeFriend
  local isColorBlindMode = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  if param == 1 then
    if isColorBlindMode == 0 then
      (MenuButtons[MenuButtonId.Btn_FriendList]):EraseAllEffect()
      ;
      (MenuButtons[MenuButtonId.Btn_FriendList]):AddEffect("fUI_Friend_01A", true, 0, 0)
    else
      if isColorBlindMode == 1 then
        (MenuButtons[MenuButtonId.Btn_FriendList]):EraseAllEffect()
        ;
        (MenuButtons[MenuButtonId.Btn_FriendList]):AddEffect("fUI_Friend_01B", true, 0, 0)
      else
        if isColorBlindMode == 2 then
          (MenuButtons[MenuButtonId.Btn_FriendList]):EraseAllEffect()
          ;
          (MenuButtons[MenuButtonId.Btn_FriendList]):AddEffect("fUI_Friend_01B", true, 0, 0)
        end
      end
    end
    _badgeFriend = badgeWidgetMake(MenuButtons[MenuButtonId.Btn_FriendList], "StaticText_Number_Friend", "N")
    local sendMsg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_FRIEND_ALERT"), sub = "", addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(sendMsg, 3, 3)
  else
    do
      local sendMsg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_FRIEND_COMPLETE"), sub = "", addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(sendMsg, 3, 3)
    end
  end
end

badgeWidgetMake = function(parentControl, controlName, text)
  -- function num : 0_25
  local _badgeWidgetChild = (UI.createAndCopyBasePropertyControl)(Panel_UIMain, "StaticText_Number", parentControl, controlName)
  _badgeWidgetChild:SetPosX(15)
  _badgeWidgetChild:SetPosY(parentControl:GetPosY() - 2)
  _badgeWidgetChild:SetText(text)
  _badgeWidgetChild:SetShow(true)
  return _badgeWidgetChild
end

FGlobal_NewFriendAlertOff = function()
  -- function num : 0_26 , upvalues : _badgeFriend, MenuButtons, MenuButtonId
  if _badgeFriend == nil then
    return 
  end
  if _badgeFriend:GetShow() == true then
    (MenuButtons[MenuButtonId.Btn_FriendList]):EraseAllEffect()
    _badgeFriend:SetShow(false)
  end
end

FromClient_RegisterCoupon = function()
  -- function num : 0_27 , upvalues : couponIcon, couponCount
  local count = ToClient_GetCouponInfoUsableCount()
  Panel_Coupon_Alert:SetShow(false)
  local iconPosX = 60
  Panel_Coupon_Alert:SetSpanSize(0, 10)
  if Panel_ChallengeReward_Alert:GetShow() then
    Panel_Coupon_Alert:SetSpanSize(iconPosX, 10)
    iconPosX = iconPosX + (Panel_Coupon_Alert:GetSpanSize()).x + 5
  end
  if Panel_NewEventProduct_Alarm:GetShow() then
    Panel_Coupon_Alert:SetSpanSize(iconPosX, 10)
    iconPosX = iconPosX + (Panel_Coupon_Alert:GetSpanSize()).x + 5
  end
  couponIcon:EraseAllEffect()
  if count > 0 then
    Panel_Coupon_Alert:SetShow(true)
    couponIcon:addInputEvent("Mouse_LUp", "IngameCashShopCoupon_Open()")
    couponCount:SetText(count)
    couponIcon:AddEffect("fUI_Coupon_01A", true, 0, 0)
  end
end

FGlobal_RightBottomIconReposition = function()
  -- function num : 0_28
  FromClient_RegisterCoupon()
end

UIMain_QuestUpdate()
UIMain_ChallengeUpdate()
MenuButtons_SetAlpha()
FromClient_RegisterCoupon()
Panel_UIMain:RegisterUpdateFunc("uiMainUpdate")
registerEvent("FromClient_UpdateQuestList", "UIMain_QuestUpdate")
registerEvent("onScreenResize", "ResetPos_WidgetButton")
registerEvent("FromClient_NewFriend", "FromClient_NewFriendAlert")
registerEvent("FromClient_RegisterCoupon", "FromClient_RegisterCoupon")
registerEvent("FromClient_luaLoadComplete", "FromClient_RegisterCoupon")
changePositionBySever(Panel_UIMain, (CppEnums.PAGameUIType).PAGameUIPanel_UIMenu, true, false, false)

