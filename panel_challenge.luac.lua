-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\characterinfo\panel_challenge.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_RewardType = CppEnums.RewardType
Panel_Window_Challenge:SetShow(false)
local shortClearCount = (UI.getChildControl)(Panel_Window_Challenge, "StaticText_ShortClearCount_Value")
local dailyChallengeValue = (UI.getChildControl)(Panel_Window_Challenge, "StaticText_DailyChallenge_Value")
local clearCount = (UI.getChildControl)(Panel_Window_Challenge, "StaticText_ClearCountValue")
local remainRewardCountValue = (UI.getChildControl)(Panel_Window_Challenge, "StaticText_RemailRewardCount")
local btnRewardShow = (UI.getChildControl)(Panel_Window_Challenge, "Button_ChallengeReward_Show")
local contentBody = (UI.getChildControl)(Panel_Window_Challenge, "Static_CallengeBodyBG")
local contentBG = (UI.getChildControl)(Panel_Window_Challenge, "Static_ChallengeContent_BG")
local contentTitle = (UI.getChildControl)(Panel_Window_Challenge, "StaticText_ChallengeContent_Title")
local contentDesc = (UI.getChildControl)(Panel_Window_Challenge, "StaticText_ChallengeContent_Desc")
local contentIcon = (UI.getChildControl)(Panel_Window_Challenge, "Static_ChallengeContent_Icon")
local contentComplete = (UI.getChildControl)(Panel_Window_Challenge, "Static_ChallengeCompleteIcon")
local normalText = (UI.getChildControl)(Panel_Window_Challenge, "StaticText_NormalReward")
local selectText = (UI.getChildControl)(Panel_Window_Challenge, "StaticText_SelectReward")
local rewardBG = (UI.getChildControl)(Panel_Window_Challenge, "Static_RewardBG")
local itemSlotBG0 = (UI.getChildControl)(Panel_Window_Challenge, "Static_ResultSlot0")
local itemSlotBG1 = (UI.getChildControl)(Panel_Window_Challenge, "Static_ResultSlot1")
local itemSlotBG2 = (UI.getChildControl)(Panel_Window_Challenge, "Static_ResultSlot2")
local itemSlotBG3 = (UI.getChildControl)(Panel_Window_Challenge, "Static_ResultSlot3")
local itemIcon0 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SlotIcon0")
local itemIcon1 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SlotIcon1")
local itemIcon2 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SlotIcon2")
local itemIcon3 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SlotIcon3")
local selectSlotBG0 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectSlot0")
local selectSlotBG1 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectSlot1")
local selectSlotBG2 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectSlot2")
local selectSlotBG3 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectSlot3")
local selectSlotBG4 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectSlot4")
local selectSlotBG5 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectSlot5")
local selectSlotBGCover = (UI.getChildControl)(Panel_Window_Challenge, "Template_Static_SlotSelectBG")
local selectItemIcon0 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectItemIcon0")
local selectItemIcon1 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectItemIcon1")
local selectItemIcon2 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectItemIcon2")
local selectItemIcon3 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectItemIcon3")
local selectItemIcon4 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectItemIcon4")
local selectItemIcon5 = (UI.getChildControl)(Panel_Window_Challenge, "Static_SelectItemIcon5")
local explainBG = (UI.getChildControl)(Panel_Window_Challenge, "Static_ChallengeExplainBG")
local _scroll = (UI.getChildControl)(Panel_Window_Challenge, "VerticalScroll")
local _scrollCtrlBtn = (UI.getChildControl)(_scroll, "VerticalScroll_CtrlButton")
local _scrollIndex = 0
local isInit = true
local currentRewardCount = 0
local expTooltipBase = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_2")
local expTooltip = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_Challenge, "expTooltip")
CopyBaseProperty(expTooltipBase, expTooltip)
expTooltip:SetColor(UI_color.C_FFFFFFFF)
expTooltip:SetAlpha(1)
expTooltip:SetFontColor(UI_color.C_FFFFFFFF)
expTooltip:SetAutoResize(true)
expTooltip:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
expTooltip:SetTextHorizonCenter()
expTooltip:SetShow(false)
Panel_ChallengeReward_Alert:SetShow(false)
HandleClicked_challengeRewardAlert_Open = function()
  -- function num : 0_0 , upvalues : IM
  CharacterInfoWindow_Show()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

local group_2 = nil
local totalSlotCount = 0
local tapCount = 6
if isGameTypeKorea() then
  tapCount = 6
else
  if isGameTypeRussia() then
    tapCount = 6
  else
    if isGameTypeEnglish() then
      tapCount = 6
    else
      if isGameTypeJapan() then
        tapCount = 6
      else
        tapCount = 6
      end
    end
  end
end
local tapMenu = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_SHORT"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_DAILY"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_COMPLETE"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_EVENT"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_PCROOM"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_COMPLETEGETITEM")}
local tabTexture = {
[0] = {
[0] = {211, 5, 311, 40}
, 
[1] = {211, 43, 311, 78}
, 
[2] = {211, 81, 311, 116}
}
, 
[1] = {
[0] = {211, 119, 311, 154}
, 
[1] = {211, 157, 311, 192}
, 
[2] = {211, 195, 311, 230}
}
, 
[2] = {
[0] = {211, 233, 311, 268}
, 
[1] = {211, 271, 311, 306}
, 
[2] = {211, 309, 311, 344}
}
, 
[3] = {
[0] = {211, 5, 311, 40}
, 
[1] = {211, 43, 311, 78}
, 
[2] = {211, 81, 311, 116}
}
, 
[4] = {
[0] = {5, 182, 105, 217}
, 
[1] = {108, 182, 208, 217}
, 
[2] = {211, 346, 311, 381}
}
, 
[5] = {
[0] = {402, 390, 502, 425}
, 
[1] = {403, 428, 502, 463}
, 
[2] = {403, 466, 502, 501}
}
}
local _tapMenu = {}
local _tapIcon = {}
local _tapValue = 0
local _menuTextspan = 7
local countrySet = true
local maxCount = 0
local _selectedReward_ChallengeIndex, _selectedReward_SlotIndex = nil, nil
local radioBtn_TapMenu = (UI.getChildControl)(Panel_Window_Challenge, "RadioButton_Tap")
local tapPosX = radioBtn_TapMenu:GetPosX()
local tapSizeX = radioBtn_TapMenu:GetSizeX()
Challenge_TapMenu_Create = function()
  -- function num : 0_1 , upvalues : countrySet, tapCount, _tapMenu, UCT, radioBtn_TapMenu, tapMenu, _menuTextspan, tapPosX, tapSizeX, tabTexture
  if isGameTypeRussia() then
    countrySet = true
  else
    if isGameTypeEnglish() or isGameTypeTaiwan() or isGameTypeSA() or isGameTypeKR2() then
      countrySet = false
    else
      countrySet = true
    end
  end
  for index = 0, tapCount - 1 do
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R4 in 'UnsetPending'

    _tapMenu[index] = {}
    -- DECOMPILER ERROR at PC46: Confused about usage of register: R4 in 'UnsetPending'

    _tapMenu[index] = (UI.createControl)(UCT.PA_UI_CONTROL_RADIOBUTTON, Panel_Window_Challenge, "Challenge_Tapmenu_" .. index)
    CopyBaseProperty(radioBtn_TapMenu, _tapMenu[index])
    ;
    (_tapMenu[index]):addInputEvent("Mouse_LUp", "HandleClickedTapButton(" .. index .. ")")
    ;
    (_tapMenu[index]):SetText(tapMenu[index])
    ;
    (_tapMenu[index]):SetTextSpan((_tapMenu[index]):GetSizeX() / 2 - (_tapMenu[index]):GetTextSizeX() / 2 + _menuTextspan)
    if index == 4 then
      if isGameTypeRussia() then
        (_tapMenu[index]):SetShow(true)
      else
        if isGameTypeEnglish() or isGameTypeTaiwan() or isGameTypeSA() or isGameTypeKR2() then
          (_tapMenu[index]):SetShow(false)
        else
          ;
          (_tapMenu[index]):SetShow(true)
        end
      end
    else
      ;
      (_tapMenu[index]):SetShow(true)
    end
    if index == 0 then
      (_tapMenu[0]):SetPosX(tapPosX + (tapSizeX - 4) * 0)
    else
      if index == 1 then
        (_tapMenu[1]):SetPosX(tapPosX + (tapSizeX - 4) * 1)
      else
        if index == 2 then
          if countrySet then
            (_tapMenu[2]):SetPosX(tapPosX + (tapSizeX - 4) * 4)
          else
            ;
            (_tapMenu[2]):SetPosX(tapPosX + (tapSizeX - 4) * 3)
          end
        else
          if index == 3 then
            if countrySet then
              (_tapMenu[3]):SetPosX(tapPosX + (tapSizeX - 4) * 3)
            else
              ;
              (_tapMenu[3]):SetPosX(tapPosX + (tapSizeX - 4) * 2)
            end
          else
            if index == 4 then
              (_tapMenu[4]):SetPosX(tapPosX + (tapSizeX - 4) * 2)
            else
              if index == 5 then
                if countrySet then
                  (_tapMenu[5]):SetPosX(tapPosX + (tapSizeX - 4) * 5)
                else
                  ;
                  (_tapMenu[5]):SetPosX(tapPosX + (tapSizeX - 4) * 4)
                end
              end
            end
          end
        end
      end
    end
    local texturePath = "new_ui_common_forlua/window/itemmarket/itemmarket_00.dds"
    if index == 5 then
      texturePath = "new_ui_common_forlua/window/itemmarket/itemmarket_03.dds"
    end
    ;
    (_tapMenu[index]):ChangeTextureInfoName(texturePath)
    local x1, y1, x2, y2 = setTextureUV_Func(_tapMenu[index], ((tabTexture[index])[0])[1], ((tabTexture[index])[0])[2], ((tabTexture[index])[0])[3], ((tabTexture[index])[0])[4])
    ;
    ((_tapMenu[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (_tapMenu[index]):ChangeOnTextureInfoName(texturePath)
    local x1, y1, x2, y2 = setTextureUV_Func(_tapMenu[index], ((tabTexture[index])[1])[1], ((tabTexture[index])[1])[2], ((tabTexture[index])[1])[3], ((tabTexture[index])[1])[4])
    ;
    ((_tapMenu[index]):getOnTexture()):setUV(x1, y1, x2, y2)
    ;
    (_tapMenu[index]):ChangeClickTextureInfoName(texturePath)
    local x1, y1, x2, y2 = setTextureUV_Func(_tapMenu[index], ((tabTexture[index])[2])[1], ((tabTexture[index])[2])[2], ((tabTexture[index])[2])[3], ((tabTexture[index])[2])[4])
    ;
    ((_tapMenu[index]):getClickTexture()):setUV(x1, y1, x2, y2)
    ;
    (_tapMenu[index]):setRenderTexture((_tapMenu[index]):getBaseTexture())
  end
end

FGlobal_TapButton_Complete = function()
  -- function num : 0_2
  HandleClickedTapButton(5)
end

HandleClickedTapButton = function(index)
  -- function num : 0_3 , upvalues : tapCount, _tapMenu, _tapValue, _scroll, _scrollIndex, maxCount
  for i = 0, tapCount - 1 do
    (_tapMenu[i]):SetCheck(false)
  end
  _tapValue = index
  ;
  (_tapMenu[index]):SetCheck(true)
  _scroll:SetControlPos(0)
  _scrollIndex = 0
  maxCount = 0
  Challenge_Update()
end

local _content = {}
local _baseReward = {}
local _selectReward = {}
local sizeY = contentBG:GetSizeY() + 7
local controlCount = 4
Challenge_Initialize = function()
  -- function num : 0_4 , upvalues : controlCount, _content, UCT, contentBody, contentBG, contentTitle, contentDesc, contentIcon, btnRewardShow, normalText, selectText, rewardBG, itemSlotBG0, itemSlotBG1, itemSlotBG2, itemSlotBG3, itemIcon0, itemIcon1, itemIcon2, itemIcon3, selectSlotBG0, selectSlotBG1, selectSlotBG2, selectSlotBG3, selectSlotBG4, selectSlotBG5, selectItemIcon0, selectItemIcon1, selectItemIcon2, selectItemIcon3, selectItemIcon4, selectItemIcon5, contentComplete, UI_TM, sizeY, _baseReward, _selectReward, explainBG
  for index = 0, controlCount - 1 do
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R4 in 'UnsetPending'

    _content[index] = {}
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).BG = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, contentBody, "Challenge_content_BG_" .. index)
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).Title = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, (_content[index]).BG, "Challenge_content_Title_" .. index)
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).Desc = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, (_content[index]).BG, "Challenge_content_Desc_" .. index)
    -- DECOMPILER ERROR at PC61: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).Icon = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_content_Icon_" .. index)
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).btnGetReward = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, (_content[index]).BG, "Challenge_content_btnGetReward_" .. index)
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).normalText = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, (_content[index]).BG, "StaticText_NormalReward_" .. index)
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectText = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, (_content[index]).BG, "StaticText_SelectReward_" .. index)
    -- DECOMPILER ERROR at PC117: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).rewardBG = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_RewardBG_" .. index)
    -- DECOMPILER ERROR at PC131: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).itemSlotBG0 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_ResultSlot0_" .. index)
    -- DECOMPILER ERROR at PC145: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).itemSlotBG1 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_ResultSlot1_" .. index)
    -- DECOMPILER ERROR at PC159: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).itemSlotBG2 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_ResultSlot2_" .. index)
    -- DECOMPILER ERROR at PC173: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).itemSlotBG3 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_ResultSlot3_" .. index)
    -- DECOMPILER ERROR at PC187: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).itemIcon0 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_ItemIcon0_" .. index)
    -- DECOMPILER ERROR at PC201: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).itemIcon1 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_ItemIcon1_" .. index)
    -- DECOMPILER ERROR at PC215: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).itemIcon2 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_ItemIcon2_" .. index)
    -- DECOMPILER ERROR at PC229: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).itemIcon3 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_ItemIcon3_" .. index)
    -- DECOMPILER ERROR at PC243: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectSlotBG0 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectSlot0_" .. index)
    -- DECOMPILER ERROR at PC257: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectSlotBG1 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectSlot1_" .. index)
    -- DECOMPILER ERROR at PC271: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectSlotBG2 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectSlot2_" .. index)
    -- DECOMPILER ERROR at PC285: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectSlotBG3 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectSlot3_" .. index)
    -- DECOMPILER ERROR at PC299: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectSlotBG4 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectSlot4_" .. index)
    -- DECOMPILER ERROR at PC313: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectSlotBG5 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectSlot5_" .. index)
    -- DECOMPILER ERROR at PC327: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectItemIcon0 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectItemIcon0_" .. index)
    -- DECOMPILER ERROR at PC341: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectItemIcon1 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectItemIcon1_" .. index)
    -- DECOMPILER ERROR at PC355: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectItemIcon2 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectItemIcon2_" .. index)
    -- DECOMPILER ERROR at PC369: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectItemIcon3 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectItemIcon3_" .. index)
    -- DECOMPILER ERROR at PC383: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectItemIcon4 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectItemIcon4_" .. index)
    -- DECOMPILER ERROR at PC397: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).selectItemIcon5 = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_Static_SelectItemIcon5_" .. index)
    -- DECOMPILER ERROR at PC411: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_content[index]).contentComplete = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_content[index]).BG, "Challenge_content_Complete_" .. index)
    CopyBaseProperty(contentBG, (_content[index]).BG)
    CopyBaseProperty(contentTitle, (_content[index]).Title)
    CopyBaseProperty(contentDesc, (_content[index]).Desc)
    CopyBaseProperty(contentIcon, (_content[index]).Icon)
    CopyBaseProperty(btnRewardShow, (_content[index]).btnGetReward)
    CopyBaseProperty(normalText, (_content[index]).normalText)
    CopyBaseProperty(selectText, (_content[index]).selectText)
    CopyBaseProperty(rewardBG, (_content[index]).rewardBG)
    CopyBaseProperty(itemSlotBG0, (_content[index]).itemSlotBG0)
    CopyBaseProperty(itemSlotBG1, (_content[index]).itemSlotBG1)
    CopyBaseProperty(itemSlotBG2, (_content[index]).itemSlotBG2)
    CopyBaseProperty(itemSlotBG3, (_content[index]).itemSlotBG3)
    CopyBaseProperty(itemIcon0, (_content[index]).itemIcon0)
    CopyBaseProperty(itemIcon1, (_content[index]).itemIcon1)
    CopyBaseProperty(itemIcon2, (_content[index]).itemIcon2)
    CopyBaseProperty(itemIcon3, (_content[index]).itemIcon3)
    CopyBaseProperty(selectSlotBG0, (_content[index]).selectSlotBG0)
    CopyBaseProperty(selectSlotBG1, (_content[index]).selectSlotBG1)
    CopyBaseProperty(selectSlotBG2, (_content[index]).selectSlotBG2)
    CopyBaseProperty(selectSlotBG3, (_content[index]).selectSlotBG3)
    CopyBaseProperty(selectSlotBG4, (_content[index]).selectSlotBG4)
    CopyBaseProperty(selectSlotBG5, (_content[index]).selectSlotBG5)
    CopyBaseProperty(selectItemIcon0, (_content[index]).selectItemIcon0)
    CopyBaseProperty(selectItemIcon1, (_content[index]).selectItemIcon1)
    CopyBaseProperty(selectItemIcon2, (_content[index]).selectItemIcon2)
    CopyBaseProperty(selectItemIcon3, (_content[index]).selectItemIcon3)
    CopyBaseProperty(selectItemIcon4, (_content[index]).selectItemIcon4)
    CopyBaseProperty(selectItemIcon5, (_content[index]).selectItemIcon5)
    CopyBaseProperty(contentComplete, (_content[index]).contentComplete)
    ;
    ((_content[index]).BG):SetShow(false)
    ;
    ((_content[index]).Title):SetShow(false)
    ;
    ((_content[index]).Desc):SetShow(false)
    ;
    ((_content[index]).Icon):SetShow(false)
    ;
    ((_content[index]).contentComplete):SetShow(false)
    ;
    ((_content[index]).btnGetReward):SetShow(false)
    ;
    ((_content[index]).btnGetReward):SetAutoDisableTime(0.5)
    ;
    ((_content[index]).normalText):SetShow(false)
    ;
    ((_content[index]).selectText):SetShow(false)
    ;
    ((_content[index]).rewardBG):SetShow(false)
    ;
    ((_content[index]).itemSlotBG0):SetShow(false)
    ;
    ((_content[index]).itemSlotBG1):SetShow(false)
    ;
    ((_content[index]).itemSlotBG2):SetShow(false)
    ;
    ((_content[index]).itemSlotBG3):SetShow(false)
    ;
    ((_content[index]).itemIcon0):SetShow(false)
    ;
    ((_content[index]).itemIcon1):SetShow(false)
    ;
    ((_content[index]).itemIcon2):SetShow(false)
    ;
    ((_content[index]).itemIcon3):SetShow(false)
    ;
    ((_content[index]).selectSlotBG0):SetShow(false)
    ;
    ((_content[index]).selectSlotBG1):SetShow(false)
    ;
    ((_content[index]).selectSlotBG2):SetShow(false)
    ;
    ((_content[index]).selectSlotBG3):SetShow(false)
    ;
    ((_content[index]).selectSlotBG4):SetShow(false)
    ;
    ((_content[index]).selectSlotBG5):SetShow(false)
    ;
    ((_content[index]).selectItemIcon0):SetShow(false)
    ;
    ((_content[index]).selectItemIcon1):SetShow(false)
    ;
    ((_content[index]).selectItemIcon2):SetShow(false)
    ;
    ((_content[index]).selectItemIcon3):SetShow(false)
    ;
    ((_content[index]).selectItemIcon4):SetShow(false)
    ;
    ((_content[index]).selectItemIcon5):SetShow(false)
    ;
    ((_content[index]).Desc):setLineCountByLimitAutoWrap(3)
    ;
    ((_content[index]).Desc):SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
    if index == 0 then
      ((_content[index]).BG):SetPosY(7)
    else
      ;
      ((_content[index]).BG):SetPosY(((_content[index - 1]).BG):GetPosY() + sizeY)
    end
    ;
    ((_content[index]).Icon):SetPosY(0)
    ;
    ((_content[index]).contentComplete):SetPosY(5)
    ;
    ((_content[index]).btnGetReward):SetPosX(350)
    ;
    ((_content[index]).btnGetReward):SetPosY(2)
    -- DECOMPILER ERROR at PC827: Confused about usage of register: R4 in 'UnsetPending'

    _baseReward[index] = {}
    -- DECOMPILER ERROR at PC833: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_baseReward[index])[0] = (_content[index]).itemIcon0
    -- DECOMPILER ERROR at PC839: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_baseReward[index])[1] = (_content[index]).itemIcon1
    -- DECOMPILER ERROR at PC845: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_baseReward[index])[2] = (_content[index]).itemIcon2
    -- DECOMPILER ERROR at PC851: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_baseReward[index])[3] = (_content[index]).itemIcon3
    -- DECOMPILER ERROR at PC854: Confused about usage of register: R4 in 'UnsetPending'

    _selectReward[index] = {}
    -- DECOMPILER ERROR at PC860: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_selectReward[index])[0] = (_content[index]).selectItemIcon0
    -- DECOMPILER ERROR at PC866: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_selectReward[index])[1] = (_content[index]).selectItemIcon1
    -- DECOMPILER ERROR at PC872: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_selectReward[index])[2] = (_content[index]).selectItemIcon2
    -- DECOMPILER ERROR at PC878: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_selectReward[index])[3] = (_content[index]).selectItemIcon3
    -- DECOMPILER ERROR at PC884: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_selectReward[index])[4] = (_content[index]).selectItemIcon4
    -- DECOMPILER ERROR at PC890: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_selectReward[index])[5] = (_content[index]).selectItemIcon5
    Challenge_SlotSetting(index)
    explainBG:SetText("")
    ;
    ((_content[index]).BG):addInputEvent("Mouse_UpScroll", "Challenge_Scroll( true )")
    ;
    ((_content[index]).BG):addInputEvent("Mouse_DownScroll", "Challenge_Scroll( false )")
  end
end

local _maxBaseSlotCount = 4
local _maxSelectSlotCount = 6
local _uiBackBaseReward = {}
local _listBaseRewardSlots = {}
local _uiButtonSelectRewardSlots = {}
local _listSelectRewardSlots = {}
local _challengerewardSlotConfig = {createIcon = true, createBorder = true, createCount = true, createClassEquipBG = true, createCash = true}
local baseRewardPosY = 0
Challenge_SlotSetting = function(index)
  -- function num : 0_5 , upvalues : _uiBackBaseReward, _listBaseRewardSlots, _maxBaseSlotCount, _baseReward, _challengerewardSlotConfig, _uiButtonSelectRewardSlots, _listSelectRewardSlots, _maxSelectSlotCount, _selectReward, UCT, selectSlotBGCover
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  _uiBackBaseReward[index] = {}
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  _listBaseRewardSlots[index] = {}
  for ii = 0, _maxBaseSlotCount - 1 do
    ((_baseReward[index])[ii]):SetIgnore(true)
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (_uiBackBaseReward[index])[ii] = (_baseReward[index])[ii]
    local slot = {}
    ;
    (SlotItem.new)(slot, "BaseReward_" .. ii, ii, (_baseReward[index])[ii], _challengerewardSlotConfig)
    slot:createChild()
    ;
    (slot.icon):SetSize(42, 42)
    ;
    (slot.icon):SetPosX(0)
    ;
    (slot.icon):SetPosY(0)
    ;
    (slot.border):SetSize(42, 42)
    ;
    (slot.border):SetPosX(1)
    ;
    (slot.border):SetPosY(1)
    -- DECOMPILER ERROR at PC66: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (_listBaseRewardSlots[index])[ii] = slot
  end
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

  _uiButtonSelectRewardSlots[index] = {}
  -- DECOMPILER ERROR at PC73: Confused about usage of register: R1 in 'UnsetPending'

  _listSelectRewardSlots[index] = {}
  for jj = 0, _maxSelectSlotCount - 1 do
    -- DECOMPILER ERROR at PC84: Confused about usage of register: R5 in 'UnsetPending'

    (_uiButtonSelectRewardSlots[index])[jj] = (_selectReward[index])[jj]
    local slot = {}
    ;
    (SlotItem.new)(slot, "SelectReward_" .. jj, jj, (_selectReward[index])[jj], _challengerewardSlotConfig)
    slot:createChild()
    ;
    (slot.icon):SetPosX(0)
    ;
    (slot.icon):SetPosY(0)
    ;
    (slot.icon):SetSize(30, 30)
    ;
    (slot.icon):SetIgnore(false)
    ;
    (slot.border):SetSize(30, 30)
    ;
    (slot.count):SetPosX(-10)
    ;
    (slot.count):SetPosY(8)
    ;
    (slot.classEquipBG):SetHorizonRight()
    ;
    (slot.classEquipBG):SetVerticalBottom()
    ;
    (slot.classEquipBG):SetSpanSize(2, 2)
    slot.selectedSatic = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, (_selectReward[index])[jj], "Challenge_Static_SelectedSlot_" .. index .. "_" .. jj)
    CopyBaseProperty(selectSlotBGCover, slot.selectedSatic)
    ;
    (slot.selectedSatic):SetPosX(-2)
    ;
    (slot.selectedSatic):SetPosY(-2)
    ;
    (slot.selectedSatic):SetSize(32, 32)
    ;
    (slot.selectedSatic):SetShow(false)
    ;
    (slot.selectedSatic):SetIgnore(true)
    -- DECOMPILER ERROR at PC182: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (_listSelectRewardSlots[index])[jj] = slot
  end
end

Challenge_clearRewardSlot = function(index)
  -- function num : 0_6 , upvalues : _maxBaseSlotCount, _listBaseRewardSlots, _maxSelectSlotCount, _listSelectRewardSlots
  for ii = 0, _maxBaseSlotCount - 1 do
    local slot = (_listBaseRewardSlots[index])[ii]
    slot:clearItem()
    ;
    (slot.icon):addInputEvent("Mouse_On", "")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "")
  end
  for jj = 0, _maxSelectSlotCount - 1 do
    local slot = (_listSelectRewardSlots[index])[jj]
    slot:clearItem()
    ;
    (slot.icon):addInputEvent("Mouse_On", "")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "")
  end
end

Challenge_clearSlot = function(list_Idx)
  -- function num : 0_7 , upvalues : _content
  ((_content[list_Idx]).BG):SetShow(false)
  ;
  ((_content[list_Idx]).btnGetReward):SetShow(false)
end

local controlValueCount = 0
local _count = 0
local specialRewardWrapper = {}
local normalRewardWrapper = {}
local challengeType = 0
local challengeWrapper = nil
local baseCount = 0
Fglobal_Challenge_UpdateData = function()
  -- function num : 0_8
  Challenge_SetConsolePadGroup()
  Challenge_Update()
end

Challenge_Update = function()
  -- function num : 0_9 , upvalues : group_2, totalSlotCount, _selectedReward_ChallengeIndex, _selectedReward_SlotIndex, _tapMenu, _tapValue, clearCount, shortClearCount, dailyChallengeValue, remainRewardCountValue, UI_color, _content, _baseReward, _selectReward, challengeType, challengeWrapper, _scrollIndex, baseCount, tapCount, controlValueCount, _scroll, controlCount, _count, maxCount
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(2)
  group_2 = Panel_Window_CharInfo_Status:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  totalSlotCount = 0
  _selectedReward_ChallengeIndex = nil
  _selectedReward_SlotIndex = nil
  ;
  (_tapMenu[_tapValue]):SetCheck(true)
  local totalCompleteCount = ToClient_GetCompletedChallengeCount()
  local rewardCompleteCount = ToClient_GetChallengeRewardInfoCount()
  local totalProgressCount = ToClient_GetProgressChallengeCount(1) + ToClient_GetProgressChallengeCount(2) + ToClient_GetProgressChallengeCount(3)
  clearCount:SetText(totalCompleteCount .. " / " .. totalCompleteCount + totalProgressCount)
  shortClearCount:SetText("")
  dailyChallengeValue:SetText("")
  local remainRewardCount = ToClient_GetChallengeRewardInfoCount()
  if remainRewardCount <= 0 then
    remainRewardCountValue:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_REWARDCOUNTVALUE_EMPTY"))
    remainRewardCountValue:SetFontColor(UI_color.C_FF888888)
    Panel_ChallengeReward_Alert:SetShow(false)
  else
    remainRewardCountValue:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_REWARDCOUNTVALUE_HAVE", "remainRewardCount", remainRewardCount))
    remainRewardCountValue:SetFontColor(UI_color.C_FFFFFFFF)
    if (getGameServiceType() == 7 or getGameServiceType() == 8) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
      Panel_ChallengeReward_Alert:SetShow(false)
    else
      Panel_ChallengeReward_Alert:SetShow(true)
    end
  end
  local viewCount = 4
  for list_Idx = 0, viewCount - 1 do
    ((_content[list_Idx]).itemSlotBG0):SetShow(false)
    ;
    ((_content[list_Idx]).itemSlotBG1):SetShow(false)
    ;
    ((_content[list_Idx]).itemSlotBG2):SetShow(false)
    ;
    ((_content[list_Idx]).selectSlotBG0):SetShow(false)
    ;
    ((_content[list_Idx]).selectSlotBG1):SetShow(false)
    ;
    ((_content[list_Idx]).selectSlotBG2):SetShow(false)
    ;
    ((_content[list_Idx]).selectSlotBG3):SetShow(false)
    ;
    ((_content[list_Idx]).selectSlotBG4):SetShow(false)
    ;
    ((_content[list_Idx]).selectSlotBG5):SetShow(false)
    ;
    ((_baseReward[list_Idx])[0]):SetShow(false)
    ;
    ((_baseReward[list_Idx])[1]):SetShow(false)
    ;
    ((_baseReward[list_Idx])[2]):SetShow(false)
    ;
    ((_selectReward[list_Idx])[0]):SetShow(false)
    ;
    ((_selectReward[list_Idx])[1]):SetShow(false)
    ;
    ((_selectReward[list_Idx])[2]):SetShow(false)
    ;
    ((_selectReward[list_Idx])[3]):SetShow(false)
    ;
    ((_selectReward[list_Idx])[4]):SetShow(false)
    ;
    ((_selectReward[list_Idx])[5]):SetShow(false)
    ;
    ((_content[list_Idx]).BG):SetShow(false)
    ;
    ((_content[list_Idx]).Title):SetShow(false)
    ;
    ((_content[list_Idx]).Desc):SetShow(false)
    ;
    ((_content[list_Idx]).Icon):SetShow(false)
    ;
    ((_content[list_Idx]).normalText):SetShow(false)
    ;
    ((_content[list_Idx]).selectText):SetShow(false)
    ;
    ((_content[list_Idx]).rewardBG):SetShow(false)
    ;
    ((_content[list_Idx]).contentComplete):SetShow(false)
  end
  local rewardPositionSet = function()
    -- function num : 0_9_0 , upvalues : viewCount, _tapValue, challengeType, challengeWrapper, _scrollIndex, baseCount, _content, _baseReward, _selectReward
    for list_Idx = 0, viewCount - 1 do
      Challenge_clearRewardSlot(list_Idx)
      Challenge_clearSlot(list_Idx)
      if _tapValue == 0 then
        challengeType = 1
      else
        if _tapValue == 1 then
          challengeType = 2
        else
          if _tapValue == 3 then
            challengeType = 3
          else
            if _tapValue == 4 then
              if isGameTypeRussia() then
                challengeType = 7
              else
                challengeType = 4
              end
            else
              if _tapValue == 5 then
                challengeType = 5
              end
            end
          end
        end
      end
      if _tapValue == 2 then
        challengeWrapper = ToClient_GetCompletedChallengeAt(list_Idx + _scrollIndex)
        if challengeWrapper ~= nil then
          baseCount = challengeWrapper:getBaseRewardCount()
        end
      else
        if _tapValue == 5 then
          challengeWrapper = ToClient_GetChallengeRewardInfoWrapper(list_Idx + _scrollIndex)
          if challengeWrapper ~= nil then
            baseCount = challengeWrapper:getBaseRewardCount()
          end
        else
          challengeWrapper = ToClient_GetProgressChallengeAt(challengeType, list_Idx + _scrollIndex)
          if challengeWrapper ~= nil then
            baseCount = challengeWrapper:getBaseRewardCount()
          end
        end
      end
      if baseCount > 3 then
        ((_content[list_Idx]).itemSlotBG3):SetShow(true)
        ;
        ((_baseReward[list_Idx])[3]):SetShow(true)
        ;
        ((_content[list_Idx]).itemSlotBG0):SetSpanSize(155, 8)
        ;
        ((_content[list_Idx]).itemSlotBG1):SetSpanSize(105, 8)
        ;
        ((_content[list_Idx]).itemSlotBG2):SetSpanSize(55, 8)
        ;
        ((_content[list_Idx]).itemSlotBG3):SetSpanSize(5, 8)
        ;
        ((_baseReward[list_Idx])[0]):SetSpanSize(155, 8)
        ;
        ((_baseReward[list_Idx])[1]):SetSpanSize(105, 8)
        ;
        ((_baseReward[list_Idx])[2]):SetSpanSize(55, 8)
        ;
        ((_baseReward[list_Idx])[3]):SetSpanSize(5, 8)
      else
        ;
        ((_content[list_Idx]).itemSlotBG3):SetShow(false)
        ;
        ((_baseReward[list_Idx])[3]):SetShow(false)
        ;
        ((_content[list_Idx]).itemSlotBG0):SetSpanSize(125, 8)
        ;
        ((_content[list_Idx]).itemSlotBG1):SetSpanSize(75, 8)
        ;
        ((_content[list_Idx]).itemSlotBG2):SetSpanSize(25, 8)
        ;
        ((_content[list_Idx]).itemSlotBG3):SetSpanSize(-25, 8)
        ;
        ((_baseReward[list_Idx])[0]):SetSpanSize(125, 8)
        ;
        ((_baseReward[list_Idx])[1]):SetSpanSize(75, 8)
        ;
        ((_baseReward[list_Idx])[2]):SetSpanSize(25, 8)
        ;
        ((_baseReward[list_Idx])[3]):SetSpanSize(-25, 8)
      end
      ;
      ((_content[list_Idx]).itemSlotBG0):SetShow(true)
      ;
      ((_content[list_Idx]).itemSlotBG1):SetShow(true)
      ;
      ((_content[list_Idx]).itemSlotBG2):SetShow(true)
      ;
      ((_content[list_Idx]).selectSlotBG0):SetShow(true)
      ;
      ((_content[list_Idx]).selectSlotBG1):SetShow(true)
      ;
      ((_content[list_Idx]).selectSlotBG2):SetShow(true)
      ;
      ((_content[list_Idx]).selectSlotBG3):SetShow(true)
      ;
      ((_content[list_Idx]).selectSlotBG4):SetShow(true)
      ;
      ((_content[list_Idx]).selectSlotBG5):SetShow(true)
      ;
      ((_baseReward[list_Idx])[0]):SetShow(true)
      ;
      ((_baseReward[list_Idx])[1]):SetShow(true)
      ;
      ((_baseReward[list_Idx])[2]):SetShow(true)
      ;
      ((_selectReward[list_Idx])[0]):SetShow(true)
      ;
      ((_selectReward[list_Idx])[1]):SetShow(true)
      ;
      ((_selectReward[list_Idx])[2]):SetShow(true)
      ;
      ((_selectReward[list_Idx])[3]):SetShow(true)
      ;
      ((_selectReward[list_Idx])[4]):SetShow(true)
      ;
      ((_selectReward[list_Idx])[5]):SetShow(true)
      ;
      ((_content[list_Idx]).BG):ChangeTextureInfoName("new_ui_common_forlua/default/default_etc_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func((_content[list_Idx]).BG, 206, 1, 230, 25)
      ;
      (((_content[list_Idx]).BG):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      ((_content[list_Idx]).BG):setRenderTexture(((_content[list_Idx]).BG):getBaseTexture())
      ;
      ((_content[list_Idx]).BG):SetIgnore(false)
    end
  end

  rewardPositionSet()
  for i = 0, tapCount - 1 do
    if (_tapMenu[i]):IsChecked() == true then
      (_tapMenu[i]):SetFontColor(UI_color.C_FFFFFFFF)
    else
      ;
      (_tapMenu[i]):SetFontColor(UI_color.C_FF888888)
    end
  end
  if _tapValue ~= 2 and _tapValue ~= 5 then
    if _tapValue == 0 then
      challengeType = 1
    else
      if _tapValue == 1 then
        challengeType = 2
      else
        if _tapValue == 3 then
          challengeType = 3
        else
          if _tapValue == 4 then
            if isGameTypeRussia() then
              challengeType = 7
            else
              challengeType = 4
            end
          else
            if _tapValue == 5 then
              challengeType = 5
            end
          end
        end
      end
    end
    controlValueCount = ToClient_GetProgressChallengeCount(challengeType)
    ;
    (UIScroll.SetButtonSize)(_scroll, controlCount, controlValueCount)
    if controlValueCount > 0 then
      if controlValueCount < controlCount then
        _count = controlValueCount
      else
        _count = controlCount
      end
      local uiIdx = 0
      for i = 0, _count - 1 do
        local dataIdx = i + _scrollIndex
        local progressInfo = ToClient_GetProgressChallengeAt(challengeType, dataIdx)
        if progressInfo ~= nil then
          ((_content[uiIdx]).Title):SetTextMode((CppEnums.TextMode).eTextMode_None)
          ;
          ((_content[uiIdx]).Title):SetText(progressInfo:getName())
          ;
          ((_content[uiIdx]).Desc):SetText(progressInfo:getDesc())
          ;
          ((_content[uiIdx]).BG):SetShow(true)
          ;
          ((_content[uiIdx]).Title):SetShow(true)
          ;
          ((_content[uiIdx]).Desc):SetShow(true)
          ;
          ((_content[uiIdx]).Icon):SetShow(true)
          ;
          ((_content[uiIdx]).Icon):ChangeTextureInfoName("new_ui_common_forlua/window/itemmarket/itemmarket_00.dds")
          local x1, y1, x2, y2 = setTextureUV_Func((_content[uiIdx]).Icon, 1, 386, 104, 481)
          ;
          (((_content[uiIdx]).Icon):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          ((_content[uiIdx]).Icon):setRenderTexture(((_content[uiIdx]).Icon):getBaseTexture())
          ;
          ((_content[uiIdx]).normalText):SetShow(true)
          ;
          ((_content[uiIdx]).selectText):SetShow(true)
          ;
          ((_content[uiIdx]).rewardBG):SetShow(true)
          ChallengeReward_Update(progressInfo, dataIdx, uiIdx)
          ;
          ((_content[uiIdx]).contentComplete):SetShow(false)
          uiIdx = uiIdx + 1
        end
      end
    end
  else
    do
      if _tapValue == 2 then
        controlValueCount = totalCompleteCount
        ;
        (UIScroll.SetButtonSize)(_scroll, controlCount, controlValueCount)
        if controlValueCount > 0 then
          if controlValueCount < controlCount then
            _count = controlValueCount
          else
            _count = controlCount
          end
          local viewCount = 4
          for challenge_Idx = 0, controlValueCount - 1 do
            local completeInfo = ToClient_GetCompletedChallengeAt(challenge_Idx + _scrollIndex)
            ;
            ((_content[challenge_Idx]).Title):SetTextMode((CppEnums.TextMode).eTextMode_None)
            ;
            ((_content[challenge_Idx]).Title):SetText(completeInfo:getName())
            ;
            ((_content[challenge_Idx]).Desc):SetText(completeInfo:getDesc())
            ;
            ((_content[challenge_Idx]).BG):SetShow(true)
            ;
            ((_content[challenge_Idx]).Title):SetShow(true)
            ;
            ((_content[challenge_Idx]).Desc):SetShow(true)
            local existRewardCount = completeInfo:getExistRewardCount()
            ;
            ((_content[challenge_Idx]).btnGetReward):SetMonoTone(true)
            ;
            ((_content[challenge_Idx]).btnGetReward):SetIgnore(true)
            ;
            ((_content[challenge_Idx]).BG):ChangeTextureInfoName("new_ui_common_forlua/default/default_etc_01.dds")
            local x1, y1, x2, y2 = setTextureUV_Func((_content[challenge_Idx]).BG, 206, 26, 230, 50)
            ;
            (((_content[challenge_Idx]).BG):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            ((_content[challenge_Idx]).BG):setRenderTexture(((_content[challenge_Idx]).BG):getBaseTexture())
            ;
            ((_content[challenge_Idx]).btnGetReward):SetShow(false)
            ;
            ((_content[challenge_Idx]).contentComplete):SetShow(true)
            ;
            ((_content[challenge_Idx]).normalText):SetShow(false)
            ;
            ((_content[challenge_Idx]).selectText):SetShow(false)
            ;
            ((_content[challenge_Idx]).rewardBG):SetShow(true)
            ;
            ((_content[challenge_Idx]).BG):SetIgnore(true)
            ChallengeReward_Update(completeInfo, challenge_Idx + _scrollIndex, challenge_Idx)
            if challenge_Idx == viewCount - 1 then
              return 
            end
          end
        end
      else
        do
          if _tapValue == 5 then
            controlValueCount = rewardCompleteCount
            ;
            (UIScroll.SetButtonSize)(_scroll, controlCount, controlValueCount)
            if controlValueCount > 0 then
              if controlValueCount < controlCount then
                _count = controlValueCount
              else
                _count = controlCount
              end
              if maxCount > 4 and maxCount - controlValueCount == 1 then
                if controlValueCount < _scrollIndex + 4 then
                  _scrollIndex = (math.max)(0, _scrollIndex - 1)
                  rewardPositionSet()
                end
                _scroll:SetControlPos(_scrollIndex / (controlValueCount - 4))
              end
              maxCount = controlValueCount
              local viewCount = 4
              for challenge_Idx = 0, controlValueCount - 1 do
                local rewardWrapper = ToClient_GetChallengeRewardInfoWrapper(challenge_Idx + _scrollIndex)
                if rewardWrapper ~= nil then
                  ((_content[challenge_Idx]).Title):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
                  ;
                  ((_content[challenge_Idx]).Title):SetText(rewardWrapper:getName())
                  ;
                  ((_content[challenge_Idx]).Desc):SetText(rewardWrapper:getDesc())
                  ;
                  ((_content[challenge_Idx]).BG):SetShow(true)
                  ;
                  ((_content[challenge_Idx]).Title):SetShow(true)
                  ;
                  ((_content[challenge_Idx]).Desc):SetShow(true)
                  local existRewardCount = rewardWrapper:getRewardCount()
                  if existRewardCount > 0 then
                    ((_content[challenge_Idx]).contentComplete):SetShow(false)
                    ;
                    ((_content[challenge_Idx]).normalText):SetShow(true)
                    ;
                    ((_content[challenge_Idx]).selectText):SetShow(true)
                    ;
                    ((_content[challenge_Idx]).rewardBG):SetShow(true)
                    ;
                    ((_content[challenge_Idx]).btnGetReward):SetShow(true)
                    ;
                    ((_content[challenge_Idx]).btnGetReward):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_BTNGETREWARD", "existRewardCount", existRewardCount))
                    ;
                    ((_content[challenge_Idx]).btnGetReward):addInputEvent("Mouse_LUp", "HandleClicked_Reward_Show( " .. challenge_Idx + _scrollIndex .. ", " .. _scrollIndex .. " )")
                    ;
                    ((_content[challenge_Idx]).BG):SetIgnore(false)
                    ;
                    ((_content[challenge_Idx]).btnGetReward):SetMonoTone(false)
                    ;
                    ((_content[challenge_Idx]).btnGetReward):SetIgnore(false)
                  end
                  ChallengeReward_Update(rewardWrapper, challenge_Idx + _scrollIndex, challenge_Idx)
                  if challenge_Idx == viewCount - 1 then
                    return 
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

Challenge_SetConsolePadGroup = function()
  -- function num : 0_10 , upvalues : _tapMenu
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(1)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(2)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(3)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(4)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(5)
  local group_1 = Panel_Window_CharInfo_Status:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_1:addControl(0, 0, 6, 1, _tapMenu[0])
  group_1:addControl(1, 0, 6, 1, _tapMenu[1])
  group_1:addControl(2, 0, 6, 1, _tapMenu[4])
  group_1:addControl(3, 0, 6, 1, _tapMenu[3])
  group_1:addControl(4, 0, 6, 1, _tapMenu[2])
  group_1:addControl(5, 0, 6, 1, _tapMenu[5])
end

HandleClicked_Challenge_ProgressReward = function(index)
  -- function num : 0_11
  local progressInfo = ToClient_GetProgressChallengeAt(index)
  ChallengeReward_Update(progressInfo, index, index)
end

HandleClicked_Challenge_CompleteReward = function(completeInfo, index)
  -- function num : 0_12
  local completeInfo = ToClient_GetChallengeRewardInfoWrapper(index)
  ChallengeReward_Update(completeInfo, index, index)
end

HandleClicked_Reward_Show = function(challenge_Idx, selectIndex)
  -- function num : 0_13 , upvalues : _selectedReward_SlotIndex, _selectedReward_ChallengeIndex, controlCount, _maxSelectSlotCount, _listSelectRewardSlots, _scrollIndex, _scroll
  local selectedRewardSlotIndex = _selectedReward_SlotIndex
  local challengeWrapper = ToClient_GetChallengeRewardInfoWrapper(challenge_Idx)
  local selectRewardCount = challengeWrapper:getSelectRewardCount()
  if selectRewardCount ~= 0 and selectedRewardSlotIndex == nil then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_YOUCANSELECTITEM"))
    return 
  end
  if challengeWrapper == nil then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_WRONGINFOCHALLENGE"))
    return 
  end
  if selectRewardCount ~= 0 and selectRewardCount - 1 < selectedRewardSlotIndex then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_WRONGSELECTVALUE"))
    return 
  end
  if _selectedReward_ChallengeIndex ~= challenge_Idx and selectRewardCount ~= 0 then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_WRONGSELECTVALUE"))
    return 
  end
  if selectRewardCount == 0 or selectedRewardSlotIndex == nil then
    selectedRewardSlotIndex = selectRewardCount
  end
  local challengeKey = challengeWrapper:getKey()
  ToClient_AcceptReward_ButtonClicked(challengeKey, selectedRewardSlotIndex)
  for ui_idx = 0, controlCount - 1 do
    for idx = 0, _maxSelectSlotCount - 1 do
      (((_listSelectRewardSlots[ui_idx])[idx]).selectedSatic):SetShow(false)
    end
  end
  local remainRewardCount = ToClient_GetChallengeRewardInfoCount()
  if remainRewardCount - _scrollIndex == 1 then
    _scroll:SetControlTop()
    _scrollIndex = 0
  end
end

ChallengeReward_Update = function(challengeWrapper, challenge_Idx, uiIdx)
  -- function num : 0_14
  if challengeWrapper == nil then
    return 
  end
  local baseCount = challengeWrapper:getBaseRewardCount()
  local _baseReward = {}
  for idx = 1, baseCount do
    local baseReward = challengeWrapper:getBaseRewardAt(idx - 1)
    _baseReward[idx] = {}
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (_baseReward[idx])._type = baseReward._type
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R10 in 'UnsetPending'

    if (CppEnums.RewardType).RewardType_Exp == baseReward._type then
      (_baseReward[idx])._exp = baseReward._experience
    else
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R10 in 'UnsetPending'

      if (CppEnums.RewardType).RewardType_SkillExp == baseReward._type then
        (_baseReward[idx])._exp = baseReward._skillExperience
      else
        -- DECOMPILER ERROR at PC46: Confused about usage of register: R10 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_ProductExp == baseReward._type then
          (_baseReward[idx])._exp = baseReward._productExperience
        else
          -- DECOMPILER ERROR at PC57: Confused about usage of register: R10 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_Item == baseReward._type then
            (_baseReward[idx])._item = baseReward:getItemEnchantKey()
            -- DECOMPILER ERROR at PC60: Confused about usage of register: R10 in 'UnsetPending'

            ;
            (_baseReward[idx])._count = baseReward._itemCount
          else
            -- DECOMPILER ERROR at PC71: Confused about usage of register: R10 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_Intimacy == baseReward._type then
              (_baseReward[idx])._character = baseReward:getIntimacyCharacter()
              -- DECOMPILER ERROR at PC74: Confused about usage of register: R10 in 'UnsetPending'

              ;
              (_baseReward[idx])._value = baseReward._intimacyValue
            end
          end
        end
      end
    end
  end
  local selectCount = challengeWrapper:getSelectRewardCount()
  local _selectReward = {}
  if selectCount > 0 then
    for idx = 1, selectCount do
      local selectReward = challengeWrapper:getSelectRewardAt(idx - 1)
      _selectReward[idx] = {}
      -- DECOMPILER ERROR at PC92: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (_selectReward[idx])._type = selectReward._type
      -- DECOMPILER ERROR at PC101: Confused about usage of register: R12 in 'UnsetPending'

      if (CppEnums.RewardType).RewardType_Exp == selectReward._type then
        (_selectReward[idx])._exp = selectReward._experience
      else
        -- DECOMPILER ERROR at PC111: Confused about usage of register: R12 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_SkillExp == selectReward._type then
          (_selectReward[idx])._exp = selectReward._skillExperience
        else
          -- DECOMPILER ERROR at PC121: Confused about usage of register: R12 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_ProductExp == selectReward._type then
            (_selectReward[idx])._exp = selectReward._productExperience
          else
            -- DECOMPILER ERROR at PC132: Confused about usage of register: R12 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_Item == selectReward._type then
              (_selectReward[idx])._item = selectReward:getItemEnchantKey()
              -- DECOMPILER ERROR at PC135: Confused about usage of register: R12 in 'UnsetPending'

              ;
              (_selectReward[idx])._count = selectReward._itemCount
              local selfPlayer = getSelfPlayer()
              if selfPlayer ~= nil then
                local classType = selfPlayer:getClassType()
                -- DECOMPILER ERROR at PC146: Confused about usage of register: R14 in 'UnsetPending'

                ;
                (_selectReward[idx])._isEquipable = selectReward:isEquipable(classType)
              end
            else
              do
                do
                  -- DECOMPILER ERROR at PC157: Confused about usage of register: R12 in 'UnsetPending'

                  if (CppEnums.RewardType).RewardType_Intimacy == selectReward._type then
                    (_selectReward[idx])._character = selectReward:getIntimacyCharacter()
                    -- DECOMPILER ERROR at PC160: Confused about usage of register: R12 in 'UnsetPending'

                    ;
                    (_selectReward[idx])._value = selectReward._intimacyValue
                  end
                  -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC161: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  SetChallengeRewardList(_baseReward, _selectReward, challenge_Idx, uiIdx)
end

SetChallengeRewardList = function(baseReward, selectReward, challenge_Idx, uiIdx)
  -- function num : 0_15 , upvalues : _tapMenu, group_2, _content, totalSlotCount, _maxBaseSlotCount, _uiBackBaseReward, _listBaseRewardSlots, _maxSelectSlotCount, _listSelectRewardSlots, _uiButtonSelectRewardSlots
  local columnCount = 0
  if (_tapMenu[5]):IsCheck() then
    columnCount = 1
  end
  columnCount = columnCount + #baseReward + #selectReward
  if (_tapMenu[5]):IsCheck() then
    group_2:addControl(0, 0, columnCount, 1, (_content[uiIdx]).btnGetReward)
    totalSlotCount = totalSlotCount + 1
  end
  _baseRewardCount = #baseReward
  for ii = 0, _maxBaseSlotCount - 1 do
    ((_uiBackBaseReward[uiIdx])[ii]):EraseAllEffect()
    if ii < _baseRewardCount then
      setChallengeRewardShow((_listBaseRewardSlots[uiIdx])[ii], baseReward[ii + 1], uiIdx, ii, "main")
      ;
      ((_uiBackBaseReward[uiIdx])[ii]):SetShow(true)
      group_2:addControl(totalSlotCount, 0, columnCount, 1, ((_listBaseRewardSlots[uiIdx])[ii]).icon)
      totalSlotCount = totalSlotCount + 1
    else
      ;
      ((_uiBackBaseReward[uiIdx])[ii]):SetShow(false)
    end
  end
  local _selectRewardCount = #selectReward
  for ii = 0, _maxSelectSlotCount - 1 do
    if ii < _selectRewardCount then
      setChallengeRewardShow((_listSelectRewardSlots[uiIdx])[ii], selectReward[ii + 1], uiIdx, ii, "sub")
      ;
      ((_uiButtonSelectRewardSlots[uiIdx])[ii]):SetShow(true)
      if (_tapMenu[5]):IsCheck() then
        (((_listSelectRewardSlots[uiIdx])[ii]).icon):addInputEvent("Mouse_LUp", "_challengeSelectReward_Set( " .. challenge_Idx .. ", " .. uiIdx .. ", " .. ii .. " )")
      end
      group_2:addControl(totalSlotCount, 1, columnCount, 1, ((_listSelectRewardSlots[uiIdx])[ii]).icon)
      totalSlotCount = totalSlotCount + 1
    else
      ;
      ((_uiButtonSelectRewardSlots[uiIdx])[ii]):SetShow(false)
    end
  end
end

_challengeSelectReward_Set = function(challenge_Idx, uiIdx, slot_Idx)
  -- function num : 0_16 , upvalues : _selectedReward_ChallengeIndex, _selectedReward_SlotIndex, controlCount, _maxSelectSlotCount, _listSelectRewardSlots
  _selectedReward_ChallengeIndex = challenge_Idx
  _selectedReward_SlotIndex = slot_Idx
  for ui_idx = 0, controlCount - 1 do
    for idx = 0, _maxSelectSlotCount - 1 do
      (((_listSelectRewardSlots[ui_idx])[idx]).selectedSatic):SetShow(false)
    end
  end
  ;
  (((_listSelectRewardSlots[uiIdx])[slot_Idx]).selectedSatic):SetShow(true)
  local challengeWrapper = ToClient_GetChallengeRewardInfoWrapper(challenge_Idx)
  local selectRewardCount = challengeWrapper:getSelectRewardCount()
  if selectRewardCount == 0 then
    _selectedReward_SlotIndex = 0
  end
end

ChallengeRewardTooltip = function(type, show, questtype, index, uiIdx)
  -- function num : 0_17 , upvalues : expTooltip, _uiBackBaseReward, _uiButtonSelectRewardSlots
  if show == true then
    if type == "Exp" then
      expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_EXP"))
    else
      if type == "SkillExp" then
        expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_SKILLEXP"))
      else
        if type == "ProductExp" then
          expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_PRODUCTEXP"))
        else
          if type == "Intimacy" then
            expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_INTIMACY"))
          end
        end
      end
    end
    if questtype == "main" then
      expTooltip:SetPosX(((_uiBackBaseReward[uiIdx])[index]):GetPosX() - expTooltip:GetSizeX() / 2)
      expTooltip:SetPosY(((_uiBackBaseReward[uiIdx])[index]):GetPosY() - expTooltip:GetSizeY() - 10)
    else
      expTooltip:SetPosX(((_uiButtonSelectRewardSlots[uiIdx])[index]):GetPosX() - expTooltip:GetSizeX() / 2)
      expTooltip:SetPosY(((_uiButtonSelectRewardSlots[uiIdx])[index]):GetPosY() - expTooltip:GetSizeY())
    end
    registTooltipControl(expTooltip, Panel_CheckedQuest)
    expTooltip:SetShow(true)
  else
    expTooltip:SetShow(false)
  end
end

setChallengeRewardShow = function(uiSlot, reward, uiIdx, index, questType)
  -- function num : 0_18 , upvalues : UI_RewardType
  uiSlot._type = reward._type
  if UI_RewardType.RewardType_Exp == reward._type then
    (uiSlot.count):SetText("")
    ;
    (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
    ;
    (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip( \"Exp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    ;
    (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip( \"Exp\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    ;
    (uiSlot.icon):setTooltipEventRegistFunc("ChallengeRewardTooltip( \"Exp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
  else
    if UI_RewardType.RewardType_SkillExp == reward._type then
      (uiSlot.count):SetText("")
      ;
      (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExp.dds")
      ;
      (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip( \"SkillExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
      ;
      (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip( \"SkillExp\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
      ;
      (uiSlot.icon):setTooltipEventRegistFunc("ChallengeRewardTooltip( \"SkillExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    else
      if UI_RewardType.RewardType_ProductExp == reward._type then
        (uiSlot.count):SetText("")
        ;
        (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
        ;
        (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip( \"ProductExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
        ;
        (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip( \"ProductExp\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
        ;
        (uiSlot.icon):setTooltipEventRegistFunc("ChallengeRewardTooltip( \"ProductExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
      else
        if UI_RewardType.RewardType_Item == reward._type then
          local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(reward._item))
          uiSlot:setItemByStaticStatus(itemStatic, reward._count)
          uiSlot._item = reward._item
          if questType == "main" then
            (uiSlot.icon):addInputEvent("Mouse_On", "Challenge_RewardTooltipShow( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "Challenge_RewardTooltipShow( false, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
            ;
            (uiSlot.icon):setTooltipEventRegistFunc("Challenge_RewardTooltipShow( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
          else
            ;
            (uiSlot.icon):addInputEvent("Mouse_On", "Challenge_RewardTooltipShow( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "Challenge_RewardTooltipShow( false, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
            ;
            (uiSlot.icon):setTooltipEventRegistFunc("Challenge_RewardTooltipShow( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
          end
          return reward._isEquipable
        else
          do
            if UI_RewardType.RewardType_Intimacy == reward._type then
              (uiSlot.count):SetText(tostring(reward._value))
              ;
              (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/00000000_Special_Contributiveness.dds")
              ;
              (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip( \"Intimacy\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
              ;
              (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip( \"Intimacy\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
              ;
              (uiSlot.icon):setTooltipEventRegistFunc("ChallengeRewardTooltip( \"Intimacy\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
            else
              ;
              (uiSlot.icon):addInputEvent("Mouse_On", "")
              ;
              (uiSlot.icon):addInputEvent("Mouse_Out", "")
            end
            return false
          end
        end
      end
    end
  end
end

Challenge_Scroll = function(isUp)
  -- function num : 0_19 , upvalues : _scrollIndex, _scroll, controlCount, controlValueCount, _maxSelectSlotCount, _listSelectRewardSlots
  _scrollIndex = (UIScroll.ScrollEvent)(_scroll, isUp, controlCount, controlValueCount, _scrollIndex, 1)
  Challenge_Update()
  for ui_idx = 0, controlCount - 1 do
    for idx = 0, _maxSelectSlotCount - 1 do
      (((_listSelectRewardSlots[ui_idx])[idx]).selectedSatic):SetShow(false)
    end
  end
end

;
(UIScroll.InputEvent)(_scroll, "Challenge_Scroll")
contentBody:addInputEvent("Mouse_UpScroll", "Challenge_Scroll( true )")
contentBody:addInputEvent("Mouse_DownScroll", "Challenge_Scroll( false )")
Challenge_RewardTooltipShow = function(isShow, uiIdx, slotNo, rewardType)
  -- function num : 0_20 , upvalues : _listBaseRewardSlots, _listSelectRewardSlots
  local passTooltipType, uiSlot = nil
  if rewardType == "main" then
    passTooltipType = "Dialog_ChallengeReward_Base"
    uiSlot = (_listBaseRewardSlots[uiIdx])[slotNo]
  else
    passTooltipType = "Dialog_ChallengeReward_Select"
    uiSlot = (_listSelectRewardSlots[uiIdx])[slotNo]
  end
  Panel_Tooltip_Item_SetPosition(slotNo, uiSlot, passTooltipType)
  if isShow == true then
    Panel_Tooltip_Item_Show_GeneralStatic(slotNo, passTooltipType, true)
  else
    if isShow == false then
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

FromClient_ChallengeReward_UpdateText = function()
  -- function num : 0_21
  Challenge_Update()
end

registerEvent("FromClient_ChallengeReward_UpdateText", "FromClient_ChallengeReward_UpdateText")
Challenge_Initialize()
Challenge_TapMenu_Create()

