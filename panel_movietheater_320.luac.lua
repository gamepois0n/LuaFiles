-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\movie\panel_movietheater_320.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
value_Panel_MovieTheater_320_IsCheckedShow = false
Panel_MovieTheater_320:ActiveMouseEventEffect(true)
Panel_MovieTheater_320:setGlassBackground(true)
Panel_MovieTheater_320:SetShow(false, false)
Panel_MovieTheater_320:RegisterShowEventFunc(true, "Panel_MovieTheater320_ShowAni()")
Panel_MovieTheater_320:RegisterShowEventFunc(false, "PanelMovieTheater320_HideAni()")
Panel_MovieTheater320_ShowAni = function()
  -- function num : 0_0
  (UIAni.AlphaAnimation)(1, Panel_MovieTheater_320, 0, 0.15)
  Panel_MovieTheater_320:SetShow(true)
end

Panel_MovieTheater320_HideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_MovieTheater_320, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local isMoviePlay = false
local _btn_Close = (UI.getChildControl)(Panel_MovieTheater_320, "Button_Close")
local _btn_Replay = (UI.getChildControl)(Panel_MovieTheater_320, "Button_Replay")
local _btn_Nomore = (UI.getChildControl)(Panel_MovieTheater_320, "Button_Nomore")
local _txt_Title = (UI.getChildControl)(Panel_MovieTheater_320, "StaticText_Title")
local _movieTheater_320 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieTheater_320, "WebControl_SkillGuide")
local helpBubble = (UI.getChildControl)(Panel_MovieTheater_320, "Static_HelpBubble")
local helpMsg = (UI.getChildControl)(Panel_MovieTheater_320, "StaticText_HelpMsg")
local _comboList = (UI.getChildControl)(Panel_MovieTheater_320, "StaticText_ComboList")
local messageUI = {_messageBox = (UI.getChildControl)(Panel_MovieTheater_MessageBox, "Static_MessageBox"), _message_Title = (UI.getChildControl)(Panel_MovieTheater_MessageBox, "Static_Text_Title"), _messageText = (UI.getChildControl)(Panel_MovieTheater_MessageBox, "Static_Text"), _btn_Yes = (UI.getChildControl)(Panel_MovieTheater_MessageBox, "Button_Yes"), _btn_No = (UI.getChildControl)(Panel_MovieTheater_MessageBox, "Button_No")}
_btn_Close:addInputEvent("Mouse_LUp", "Panel_MovieTheater320_JustClose()")
_btn_Replay:addInputEvent("Mouse_LUp", "Panel_MovieTheater320_Replay()")
_btn_Nomore:addInputEvent("Mouse_LUp", "Panel_MovieTheater320_MessageBox()")
_movieTheater_320:addInputEvent("Mouse_Out", "Panel_MovieTheater320_HideControl()")
_movieTheater_320:addInputEvent("Mouse_On", "Panel_MovieTheater320_ShowControl()")
Panel_MovieTheater320_Initialize = function()
  -- function num : 0_2 , upvalues : _movieTheater_320
  _movieTheater_320:SetPosX(5)
  _movieTheater_320:SetPosY(38)
  _movieTheater_320:ResetUrl()
  Panel_MovieTheater_320:SetSize(Panel_MovieTheater_320:GetSizeX(), 317)
  Panel_MovieTheater320_ResetMessageBox()
end

Panel_MovieTheater320_ResetMessageBox = function()
  -- function num : 0_3 , upvalues : messageUI
  Panel_MovieTheater_MessageBox:SetShow(false)
  for _,v in pairs(messageUI) do
    v:SetShow(false)
  end
end

local playedNo = 0
local warriorText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_WARRIORTEXT")
local rangerText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_RANGERTEXT")
local sorcererText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_SORCERERTEXT")
local giantText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_GIANTTEXT")
local tamerText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_TAMERTEXT")
local bladerText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_BLADERTEXT")
local valkyrieText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_VALKYRIETEXT")
local bladerWomenText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_BLADERWOMENTEXT")
local wizardWomenText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_WIZARDWOMENTEXT")
local wizardText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_WIZARDTEXT")
local ninjaWomenText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_NINJAWOMENTEXT")
local ninjaNanText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_NINJAMANTEXT")
local darkelfText = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_DARKELFTEXT")
local comboDesc = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_3"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_16"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_6"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_7"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_17"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_8"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_9"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_10"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_11"), [18] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_18"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_12"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_13"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_14"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_15"), [19] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_19"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_20"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_21"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_22"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_23"), [24] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_24"), [25] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_25"), [26] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_26"), [27] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_27"), [28] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_28"), [29] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_29"), [30] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_30"), [31] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_31"), [32] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_32"), [33] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_33"), [34] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_34"), [35] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_35"), [36] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_36"), [37] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_37"), [38] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_38"), [39] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_39"), [40] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_40"), [41] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_41"), [42] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_42"), [43] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_43"), [44] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_44"), [45] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_45"), [46] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_46"), [47] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_47"), [48] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_48"), [49] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_49"), [50] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_45"), [51] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_46"), [52] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_47"), [53] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_50"), [54] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_51"), [55] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_55"), [56] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_56"), [57] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_57"), [58] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_58"), [59] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMBODESC_59")}
Panel_MovieTheater320_JustClose = function()
  -- function num : 0_4 , upvalues : _movieTheater_320, isMoviePlay
  Panel_MovieTheater_320:SetShow(false)
  _movieTheater_320:ResetUrl()
  isMoviePlay = false
end

local isFirstPlay = true
Panel_MovieTheater320_ShowToggle = function()
  -- function num : 0_5 , upvalues : _movieTheater_320, helpBubble, helpMsg, UI_TM, _comboList, isFirstPlay, _txt_Title, _btn_Close, _btn_Replay, _btn_Nomore, isMoviePlay
  if Panel_MovieTheater_MessageBox:IsShow() == true then
    return 
  end
  value_Panel_MovieTheater_320_IsCheckedShow = true
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local UI_classType = CppEnums.ClassType
  local isWarrior = UI_classType.ClassType_Warrior == player:getClassType()
  local isRanger = UI_classType.ClassType_Ranger == player:getClassType()
  local isSorcerer = UI_classType.ClassType_Sorcerer == player:getClassType()
  local isGiant = UI_classType.ClassType_Giant == player:getClassType()
  local isTamer = UI_classType.ClassType_Tamer == player:getClassType()
  local isBlader = UI_classType.ClassType_BladeMaster == player:getClassType()
  local isValkyrie = UI_classType.ClassType_Valkyrie == player:getClassType()
  local isBladerWomen = UI_classType.ClassType_BladeMasterWomen == player:getClassType()
  local isWizard = UI_classType.ClassType_Wizard == player:getClassType()
  local isWizardWomen = UI_classType.ClassType_WizardWomen == player:getClassType()
  local isNinjaWomen = UI_classType.ClassType_NinjaWomen == player:getClassType()
  local isNinjaMan = UI_classType.ClassType_NinjaMan == player:getClassType()
  local isDarkElf = UI_classType.ClassType_DarkElf == player:getClassType()
  local playerGet = player:get()
  local playerLevel = playerGet:getLevel()
  do
    local isShow = Panel_MovieTheater_320:IsShow()
    if playerLevel >= 36 or playerLevel <= 6 then
      return 
    end
    if isShow == false then
      _movieTheater_320:SetUrl(320, 240, "coui://UI_Data/UI_Html/UI_Guide_Movie.html")
    end
    helpBubble:SetShow(true)
    helpMsg:SetShow(true)
    helpMsg:SetAutoResize(true)
    helpMsg:SetTextMode(UI_TM.eTextMode_AutoWrap)
    if isWarrior == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISWARRIOR"))
    elseif isRanger == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISRANGER"))
    elseif isSorcerer == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISSORCERER"))
    elseif isGiant == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISGIANT"))
    elseif isTamer == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISTAMER"))
    elseif isBlader == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISBLADER"))
    elseif isValkyrie == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISVALKYRIE"))
    elseif isBladerWomen == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISBLADERWOMEN"))
    elseif isWizard == true or isWizardWomen == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISWIZARD"))
    elseif isNinjaWomen == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISNINJAWOMEN"))
    elseif isNinjaMan == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISNINJAMAN"))
    elseif isDarkElf == true then
      helpMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_ISDARKELF"))
    end
    helpBubble:SetSize(helpBubble:GetSizeX(), helpMsg:GetTextSizeY() + 35)
    _movieTheater_320:SetSize(320, 240)
    _comboList:SetTextMode(UI_TM.eTextMode_AutoWrap)
    _comboList:SetPosY(283)
    _comboList:SetSize(315, _comboList:GetTextSizeY() + 7)
    if isFirstPlay then
      isFirstPlay = false
      _comboList:SetText("")
    end
    Panel_MovieTheater_320:SetPosX(getScreenSizeX() - Panel_MovieTheater_320:GetSizeX() - 7)
    Panel_MovieTheater_320:SetPosY(getScreenSizeY() - Panel_MovieTheater_320:GetSizeY() - Panel_QuickSlot:GetSizeY())
    Panel_MovieTheater_320:SetShow(true, false)
    _txt_Title:SetSize(Panel_MovieTheater_320:GetSizeX(), _txt_Title:GetSizeY())
    _txt_Title:ComputePos()
    _btn_Close:ComputePos()
    _btn_Replay:addInputEvent("Mouse_LUp", "Panel_MovieTheater320_Replay()")
    _btn_Nomore:SetShow(true)
    isMoviePlay = true
    -- DECOMPILER ERROR: 30 unprocessed JMP targets
  end
end

Panel_MovieTheater320_TriggerEvent = function()
  -- function num : 0_6 , upvalues : helpBubble, helpMsg, _txt_Title, warriorText, _movieTheater_320, _comboList, comboDesc, playedNo, rangerText, sorcererText, giantText, tamerText, bladerText, valkyrieText, bladerWomenText, wizardText, wizardWomenText, ninjaWomenText, darkelfText, _btn_Nomore, _btn_Replay, _btn_Close
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local UI_classType = CppEnums.ClassType
  local isWarrior = UI_classType.ClassType_Warrior == player:getClassType()
  local isRanger = UI_classType.ClassType_Ranger == player:getClassType()
  local isSorcerer = UI_classType.ClassType_Sorcerer == player:getClassType()
  local isGiant = UI_classType.ClassType_Giant == player:getClassType()
  local isTamer = UI_classType.ClassType_Tamer == player:getClassType()
  local isBlader = UI_classType.ClassType_BladeMaster == player:getClassType()
  local isValkyrie = UI_classType.ClassType_Valkyrie == player:getClassType()
  local isBladerWomen = UI_classType.ClassType_BladeMasterWomen == player:getClassType()
  local isWizard = UI_classType.ClassType_Wizard == player:getClassType()
  local isWizardWomen = UI_classType.ClassType_WizardWomen == player:getClassType()
  local isNinjaWomen = UI_classType.ClassType_NinjaWomen == player:getClassType()
  local isNinjaMan = UI_classType.ClassType_NinjaMan == player:getClassType()
  local isDarkelf = UI_classType.ClassType_DarkElf == player:getClassType()
  local playerGet = player:get()
  do
    local playerLevel = playerGet:getLevel()
    if isWarrior then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", warriorText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/100.webm")
        _comboList:SetText(comboDesc[0])
        playedNo = 100
      elseif playerLevel >= 16 and playerLevel <= 20 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", warriorText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/101.webm")
        _comboList:SetText(comboDesc[1])
        playedNo = 101
      elseif playerLevel >= 21 and playerLevel <= 25 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", warriorText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/102.webm")
        _comboList:SetText(comboDesc[2])
        playedNo = 102
      elseif playerLevel >= 26 and playerLevel <= 30 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", warriorText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/103.webm")
        _comboList:SetText(comboDesc[3])
        playedNo = 103
      elseif playerLevel >= 31 and playerLevel <= 35 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", warriorText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/104.webm")
        _comboList:SetText(comboDesc[16])
        playedNo = 104
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isRanger then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", rangerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/200.webm")
        _comboList:SetText(comboDesc[4])
        playedNo = 200
      elseif playerLevel >= 16 and playerLevel <= 20 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", rangerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/201.webm")
        _comboList:SetText(comboDesc[5])
        playedNo = 201
      elseif playerLevel >= 21 and playerLevel <= 25 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", rangerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/202.webm")
        _comboList:SetText(comboDesc[6])
        playedNo = 202
      elseif playerLevel >= 26 and playerLevel <= 30 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", rangerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/203.webm")
        _comboList:SetText(comboDesc[7])
        playedNo = 203
      elseif playerLevel >= 31 and playerLevel <= 35 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", rangerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/204.webm")
        _comboList:SetText(comboDesc[17])
        playedNo = 204
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isSorcerer then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", sorcererText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/300.webm")
        _comboList:SetText(comboDesc[8])
        playedNo = 300
      elseif playerLevel >= 16 and playerLevel <= 20 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", sorcererText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/301.webm")
        _comboList:SetText(comboDesc[9])
        playedNo = 301
      elseif playerLevel >= 21 and playerLevel <= 25 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", sorcererText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/302.webm")
        _comboList:SetText(comboDesc[10])
        playedNo = 302
      elseif playerLevel >= 26 and playerLevel <= 30 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", sorcererText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/303.webm")
        _comboList:SetText(comboDesc[11])
        playedNo = 303
      elseif playerLevel >= 31 and playerLevel <= 35 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", sorcererText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/304.webm")
        _comboList:SetText(comboDesc[18])
        playedNo = 304
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isGiant then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", giantText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/400.webm")
        _comboList:SetText(comboDesc[12])
        playedNo = 400
      elseif playerLevel >= 16 and playerLevel <= 20 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", giantText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/401.webm")
        _comboList:SetText(comboDesc[13])
        playedNo = 401
      elseif playerLevel >= 21 and playerLevel <= 25 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", giantText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/402.webm")
        _comboList:SetText(comboDesc[14])
        playedNo = 402
      elseif playerLevel >= 26 and playerLevel <= 30 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", giantText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/403.webm")
        _comboList:SetText(comboDesc[15])
        playedNo = 403
      elseif playerLevel >= 31 and playerLevel <= 35 then
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", giantText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/404.webm")
        _comboList:SetText(comboDesc[19])
        playedNo = 404
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isTamer then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        playedNo = 500
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", tamerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[20])
      elseif playerLevel >= 16 and playerLevel <= 20 then
        playedNo = 501
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", tamerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[21])
      elseif playerLevel >= 21 and playerLevel <= 25 then
        playedNo = 502
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", tamerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[22])
      elseif playerLevel >= 26 and playerLevel <= 30 then
        playedNo = 503
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", tamerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[23])
      elseif playerLevel >= 31 and playerLevel <= 35 then
        playedNo = 504
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", tamerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[24])
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isBlader then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        playedNo = 600
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", bladerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[25])
      elseif playerLevel >= 16 and playerLevel <= 20 then
        playedNo = 601
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", bladerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[26])
      elseif playerLevel >= 21 and playerLevel <= 25 then
        playedNo = 602
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", bladerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[27])
      elseif playerLevel >= 26 and playerLevel <= 30 then
        playedNo = 603
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", bladerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[28])
      elseif playerLevel >= 31 and playerLevel <= 35 then
        playedNo = 604
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", bladerText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[29])
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isValkyrie then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        playedNo = 700
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", valkyrieText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[30])
      elseif playerLevel >= 16 and playerLevel <= 20 then
        playedNo = 701
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", valkyrieText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[31])
      elseif playerLevel >= 21 and playerLevel <= 25 then
        playedNo = 702
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", valkyrieText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[32])
      elseif playerLevel >= 26 and playerLevel <= 30 then
        playedNo = 703
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", valkyrieText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[33])
      elseif playerLevel >= 31 and playerLevel <= 35 then
        playedNo = 704
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", valkyrieText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[34])
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isBladerWomen then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        playedNo = 800
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", bladerWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[35])
      elseif playerLevel >= 16 and playerLevel <= 20 then
        playedNo = 801
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", bladerWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[36])
      elseif playerLevel >= 21 and playerLevel <= 25 then
        playedNo = 802
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", bladerWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[37])
      elseif playerLevel >= 26 and playerLevel <= 30 then
        playedNo = 803
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", bladerWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[38])
      elseif playerLevel >= 31 and playerLevel <= 35 then
        playedNo = 804
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", bladerWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[39])
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isWizard then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        playedNo = 900
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", wizardText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[40])
      elseif playerLevel >= 16 and playerLevel <= 20 then
        playedNo = 901
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", wizardText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[41])
      elseif playerLevel >= 21 and playerLevel <= 25 then
        playedNo = 902
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", wizardText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[42])
      elseif playerLevel >= 26 and playerLevel <= 30 then
        playedNo = 903
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", wizardText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[43])
      elseif playerLevel >= 31 and playerLevel <= 35 then
        playedNo = 904
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", wizardText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[44])
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isWizardWomen then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        playedNo = 900
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", wizardWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[40])
      elseif playerLevel >= 16 and playerLevel <= 20 then
        playedNo = 901
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", wizardWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[41])
      elseif playerLevel >= 21 and playerLevel <= 25 then
        playedNo = 902
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", wizardWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[42])
      elseif playerLevel >= 26 and playerLevel <= 30 then
        playedNo = 903
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", wizardWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[43])
      elseif playerLevel >= 31 and playerLevel <= 35 then
        playedNo = 904
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", wizardWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[44])
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isNinjaWomen then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        playedNo = 1001
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", ninjaWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[45])
      elseif playerLevel >= 16 and playerLevel <= 20 then
        playedNo = 1002
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", ninjaWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[46])
      elseif playerLevel >= 21 and playerLevel <= 25 then
        playedNo = 1003
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", ninjaWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[47])
      elseif playerLevel >= 26 and playerLevel <= 30 then
        playedNo = 1004
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", ninjaWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[48])
      elseif playerLevel >= 31 and playerLevel <= 35 then
        playedNo = 1005
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", ninjaWomenText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[49])
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isNinjaMan then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        playedNo = 1100
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", ninjaManText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[50])
      elseif playerLevel >= 16 and playerLevel <= 20 then
        playedNo = 1101
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", ninjaManText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[51])
      elseif playerLevel >= 21 and playerLevel <= 25 then
        playedNo = 1102
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", ninjaManText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[52])
      elseif playerLevel >= 26 and playerLevel <= 30 then
        playedNo = 1103
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", ninjaManText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[53])
      elseif playerLevel >= 31 and playerLevel <= 35 then
        playedNo = 1104
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", ninjaManText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[54])
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    elseif isDarkelf then
      if playerLevel <= 6 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      elseif playerLevel >= 7 and playerLevel <= 15 then
        playedNo = 1200
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", darkelfText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[55])
      elseif playerLevel >= 16 and playerLevel <= 20 then
        playedNo = 1201
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_LOW", "getText", darkelfText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[56])
      elseif playerLevel >= 21 and playerLevel <= 25 then
        playedNo = 1202
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_MIDDLE", "getText", darkelfText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[57])
      elseif playerLevel >= 26 and playerLevel <= 30 then
        playedNo = 1203
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGH", "getText", darkelfText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[58])
      elseif playerLevel >= 31 and playerLevel <= 35 then
        playedNo = 1204
        _txt_Title:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_320_COMMON_LINK_HIGHTOP", "getText", darkelfText))
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        _comboList:SetText(comboDesc[59])
      elseif playerLevel >= 36 then
        Panel_MovieTheater_320:SetShow(false, false)
        helpBubble:SetShow(false)
        helpMsg:SetShow(false)
      end
    end
    _comboList:SetSize(315, _comboList:GetTextSizeY() + 7)
    Panel_MovieTheater_320:SetSize(Panel_MovieTheater_320:GetSizeX(), _comboList:GetPosY() + _comboList:GetSizeY() + _btn_Nomore:GetSizeY() + 15)
    _btn_Nomore:ComputePos()
    _btn_Replay:ComputePos()
    Panel_MovieTheater_320:SetPosX(getScreenSizeX() - Panel_MovieTheater_320:GetSizeX() - 7)
    Panel_MovieTheater_320:SetPosY(getScreenSizeY() - Panel_MovieTheater_320:GetSizeY() - Panel_QuickSlot:GetSizeY())
    _txt_Title:SetSize(Panel_MovieTheater_320:GetSizeX(), _txt_Title:GetSizeY())
    _txt_Title:ComputePos()
    _btn_Close:ComputePos()
    -- DECOMPILER ERROR: 104 unprocessed JMP targets
  end
end

Panel_MovieTheater320_Replay = function()
  -- function num : 0_7 , upvalues : playedNo, _movieTheater_320
  if playedNo == 100 then
    _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
  else
    if playedNo == 101 then
      _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
    else
      if playedNo == 102 then
        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
      else
        if playedNo == 103 then
          _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
        else
          if playedNo == 104 then
            _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
          else
            if playedNo == 200 then
              _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
            else
              if playedNo == 201 then
                _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
              else
                if playedNo == 202 then
                  _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                else
                  if playedNo == 203 then
                    _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                  else
                    if playedNo == 204 then
                      _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                    else
                      if playedNo == 300 then
                        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                      else
                        if playedNo == 301 then
                          _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                        else
                          if playedNo == 302 then
                            _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                          else
                            if playedNo == 303 then
                              _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                            else
                              if playedNo == 304 then
                                _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                              else
                                if playedNo == 400 then
                                  _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                else
                                  if playedNo == 401 then
                                    _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                  else
                                    if playedNo == 402 then
                                      _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                    else
                                      if playedNo == 403 then
                                        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                      else
                                        if playedNo == 404 then
                                          _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                        else
                                          if playedNo == 500 then
                                            _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                          else
                                            if playedNo == 501 then
                                              _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                            else
                                              if playedNo == 502 then
                                                _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                              else
                                                if playedNo == 503 then
                                                  _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                else
                                                  if playedNo == 504 then
                                                    _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                  else
                                                    if playedNo == 600 then
                                                      _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                    else
                                                      if playedNo == 601 then
                                                        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                      else
                                                        if playedNo == 602 then
                                                          _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                        else
                                                          if playedNo == 603 then
                                                            _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                          else
                                                            if playedNo == 604 then
                                                              _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                            else
                                                              if playedNo == 700 then
                                                                _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                              else
                                                                if playedNo == 701 then
                                                                  _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                else
                                                                  if playedNo == 702 then
                                                                    _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                  else
                                                                    if playedNo == 703 then
                                                                      _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                    else
                                                                      if playedNo == 704 then
                                                                        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                      else
                                                                        if playedNo == 800 then
                                                                          _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                        else
                                                                          if playedNo == 801 then
                                                                            _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                          else
                                                                            if playedNo == 802 then
                                                                              _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                            else
                                                                              if playedNo == 803 then
                                                                                _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                              else
                                                                                if playedNo == 804 then
                                                                                  _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                else
                                                                                  if playedNo == 900 then
                                                                                    _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                  else
                                                                                    if playedNo == 901 then
                                                                                      _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                    else
                                                                                      if playedNo == 902 then
                                                                                        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                      else
                                                                                        if playedNo == 903 then
                                                                                          _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                        else
                                                                                          if playedNo == 904 then
                                                                                            _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                          else
                                                                                            if playedNo == 1001 then
                                                                                              _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                            else
                                                                                              if playedNo == 1002 then
                                                                                                _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                              else
                                                                                                if playedNo == 1003 then
                                                                                                  _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                else
                                                                                                  if playedNo == 1004 then
                                                                                                    _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                  else
                                                                                                    if playedNo == 1005 then
                                                                                                      _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                    else
                                                                                                      if playedNo == 1100 then
                                                                                                        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                      else
                                                                                                        if playedNo == 1101 then
                                                                                                          _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                        else
                                                                                                          if playedNo == 1102 then
                                                                                                            _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                          else
                                                                                                            if playedNo == 1103 then
                                                                                                              _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                            else
                                                                                                              if playedNo == 1104 then
                                                                                                                _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                              else
                                                                                                                if playedNo == 1200 then
                                                                                                                  _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                                else
                                                                                                                  if playedNo == 1201 then
                                                                                                                    _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                                  else
                                                                                                                    if playedNo == 1202 then
                                                                                                                      _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                                    else
                                                                                                                      if playedNo == 1203 then
                                                                                                                        _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
                                                                                                                      else
                                                                                                                        if playedNo == 1204 then
                                                                                                                          _movieTheater_320:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Pc_Skill/11_Common_ComboGuide/" .. playedNo .. ".webm")
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

Panel_MovieTheater320_MessageBox = function()
  -- function num : 0_8 , upvalues : messageUI
  Panel_MovieTheater_320:SetShow(true)
  isComboMovieClosedCount = 0
  value_Panel_MovieTheater_320_IsCheckedShow = false
  Panel_MovieTheater_MessageBox:SetPosX(getScreenSizeX() - Panel_MovieTheater_MessageBox:GetSizeX() - 7)
  Panel_MovieTheater_MessageBox:SetPosY(getScreenSizeY() - Panel_MovieTheater_320:GetSizeY() - Panel_QuickSlot:GetSizeY())
  Panel_MovieTheater_MessageBox:SetShow(true)
  for _,v in pairs(messageUI) do
    v:SetShow(true)
    v:ComputePos()
  end
  ;
  (messageUI._btn_Yes):addInputEvent("Mouse_LUp", "Panel_MovieTheater320_Clicked_Func( true )")
  ;
  (messageUI._btn_No):addInputEvent("Mouse_LUp", "Panel_MovieTheater320_Clicked_Func( false )")
end

Panel_MovieTheater320_Clicked_Func = function(isYes)
  -- function num : 0_9 , upvalues : _movieTheater_320, isMoviePlay
  if isYes == true then
    value_GameOption_Check_ComboGuide:SetCheck(false)
    setShowComboGuide(false)
    GameOption_UpdateOptionChanged()
    _currentSpiritGuideCheck = false
    saveGameOption(false)
    Panel_MovieTheater_320:SetShow(false)
    Panel_MovieTheater_MessageBox:SetShow(false)
  else
    Panel_MovieTheater_320:SetShow(false)
    Panel_MovieTheater_MessageBox:SetShow(false)
  end
  _movieTheater_320:ResetUrl()
  isMoviePlay = false
end

local updateTime = 0
UpdateMovieTheater320 = function(deltaTime)
  -- function num : 0_10 , upvalues : isMoviePlay, updateTime, _movieTheater_320
  if not isMoviePlay then
    return 
  end
  updateTime = updateTime + deltaTime
  if updateTime > 1 and _movieTheater_320:isReadyView() then
    Panel_MovieTheater320_TriggerEvent()
    isMoviePlay = false
    updateTime = 0
  end
  if updateTime > 3 then
    isMoviePlay = true
    updateTime = 0
  end
end

Panel_MovieTheater320_ShowControl = function()
  -- function num : 0_11 , upvalues : _movieTheater_320
  _movieTheater_320:TriggerEvent("ShowControl", "true")
end

Panel_MovieTheater320_HideControl = function()
  -- function num : 0_12 , upvalues : _movieTheater_320
  _movieTheater_320:TriggerEvent("ShowControl", "false")
end

Panel_MovieTheater320_Initialize()
Panel_MovieTheater_320:RegisterUpdateFunc("UpdateMovieTheater320")

