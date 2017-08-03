-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\panel_selfplayerexpgage.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local UI_BUFFTYPE = CppEnums.UserChargeType
Panel_SelfPlayerExpGage:SetShow(true, false)
Panel_SelfPlayerExpGage:SetIgnore(true)
Panel_SelfPlayerExpGage:ActiveMouseEventEffect(false)
Panel_SelfPlayerExpGage:RegisterShowEventFunc(true, "SelfPlayerExpGageShowAni()")
Panel_SelfPlayerExpGage:RegisterShowEventFunc(false, "SelfPlayerExpGageHideAni()")
local _defaultEventExp = 1000000
local _levelBG = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Static_LevelBG")
local expGageBG = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Static_SelfPlayerExpBG")
local expGage = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Progress2_ExpGage")
local _expHead = (UI.getChildControl)(expGage, "Progress2_ExpGage_Head")
local staticLevelBg = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Static_LevelBG")
local _staticLevel = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_Level")
local _staticLevelSub = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_Level_Sub")
local _staticLvText = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_LVTXT")
local expText = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_EXPText")
local _skillGaugeBG = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Static_SkillGauge_BG")
local _staticSkillExp = (UI.getChildControl)(Panel_SelfPlayerExpGage, "CircularProgress_SkillExp")
local _staticSkillExp_Head = (UI.getChildControl)(_staticSkillExp, "Progress2_1_Bar_Head")
local _staticSkillPoint = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_Sp")
local _staticSkillPointMain = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_Sp_Main")
local _staticSkillPointSub = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_Sp_Sub")
local _wpGaugeBG = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Static_WP_BG")
local _Wp = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_WP")
local _Wp_Main = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_WP_Main")
local _wpGauge = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Progress2_WP")
local _wpGauge_Head = (UI.getChildControl)(_wpGauge, "Progress2_1_Bar_Head")
local _WpHelpMSG = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_WPHelp")
local _contribute_BG = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Static_Contribute_BG")
local _contribute_progress = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Progress_Contribute")
local _contribute_progress_Head = (UI.getChildControl)(_contribute_progress, "Progress2_1_Bar_Head")
local _contribute_txt = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_ContributeP")
local _contribute_Main = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_Contribute_Main")
local _contribute_helpMsg = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_ContributeHelpMsg")
local _close_ExpGauge = ((UI.getChildControl)(Panel_SelfPlayerExpGage, "Button_Win_Close"))
local localNodeName = nil
local localNodeInvestment = false
local pcRoomRate = 0
local pcRoomNeedTime = ToClient_GetPcRoomUserHomeBuffLimitTime()
local needTime = 0
local useTime = 0
if isGameTypeKorea() == false and isGameTypeTaiwan() == false then
  _levelBG:SetSize(100, _levelBG:GetSizeY())
  local expGagePosX = _levelBG:GetPosX() + _levelBG:GetSizeX()
  local gaugeBundle = {_wpGaugeBG, _Wp, _Wp_Main, _wpGauge, _wpGauge_Head, _WpHelpMSG, _contribute_BG, _contribute_progress, _contribute_progress_Head, _contribute_txt, _contribute_Main, _contribute_helpMsg, _skillGaugeBG, _staticSkillExp, _staticSkillExp_Head, _staticSkillPoint, _staticSkillPointMain, _staticSkillPointSub}
  for _,control in pairs(gaugeBundle) do
    control:SetPosX(expGagePosX)
  end
end
do
  local initPosX = Panel_SelfPlayerExpGage:GetPosX()
  local initPosY = Panel_SelfPlayerExpGage:GetPosY()
  _close_ExpGauge:SetShow(false)
  _Wp:SetIgnore(false)
  _WpHelpMSG:SetAlpha(0)
  _WpHelpMSG:SetFontAlpha(0)
  local _reservedLearningSkillSlot = {iconBG = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Static_IconBG"), icon = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Static_SkillIcon"), circularBorder = (UI.getChildControl)(Panel_SelfPlayerExpGage, "CircularProgress_Active"), point = (UI.getChildControl)(Panel_SelfPlayerExpGage, "Static_ProgressHead")}
  ;
  (_reservedLearningSkillSlot.iconBG):SetShow(false)
  ;
  (_reservedLearningSkillSlot.icon):SetShow(false)
  ;
  (_reservedLearningSkillSlot.circularBorder):SetShow(false)
  ;
  (_reservedLearningSkillSlot.point):SetShow(false)
  SelfPlayerExpGageShowAni = function()
  -- function num : 0_0
  (UIAni.AlphaAnimation)(1, Panel_SelfPlayerExpGage, 0, 0.2)
end

  SelfPlayerExpGageHideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_SelfPlayerExpGage, 0, 0.2)
  aniInfo:SetHideAtEnd(true)
end

  Panel_SelfPlayerExpGage_onScreenResize = function()
  -- function num : 0_2 , upvalues : expGageBG, expGage
  local sizeX = getScreenSizeX()
  expGageBG:SetSize(sizeX, 4)
  expGage:SetSize(sizeX, 4)
  expGage:SetProgressRate(0)
  FGlobal_PackageIconUpdate()
  ExpGauge_CharacterInfoUpdate_Reload()
end

  local _selfExpSimpleUI_MouseOver = false
  SelfExp_MouseOver = function(isOver)
  -- function num : 0_3
  if not getEnableSimpleUI() then
    return 
  end
  SelfExp_MouseOver_Force(isOver)
end

  SelfExp_MouseOver_Force = function(isOver)
  -- function num : 0_4 , upvalues : _selfExpSimpleUI_MouseOver
  _selfExpSimpleUI_MouseOver = isOver
end

  SelfExp_MouseOver_Force_Over = function()
  -- function num : 0_5
  SelfExp_MouseOver_Force(false)
end

  SelfExp_MouseOver_Force_Out = function()
  -- function num : 0_6 , upvalues : _levelBG, _skillGaugeBG, _staticSkillExp, _staticSkillExp_Head, _staticSkillPoint, _staticSkillPointMain, _staticSkillPointSub, _wpGaugeBG, _wpGauge, _wpGauge_Head, _Wp, _Wp_Main, _contribute_BG, _contribute_progress, _contribute_progress_Head, _contribute_txt, _contribute_Main
  _levelBG:SetShow(true)
  _skillGaugeBG:SetShow(true)
  _skillGaugeBG:SetAlpha(1)
  _staticSkillExp:SetShow(true)
  _staticSkillExp:SetAlpha(1)
  _staticSkillExp_Head:SetShow(true)
  _staticSkillExp_Head:SetAlpha(1)
  _staticSkillPoint:SetShow(true)
  _staticSkillPoint:SetFontAlpha(1)
  _staticSkillPointMain:SetShow(true)
  _staticSkillPointMain:SetFontAlpha(1)
  _staticSkillPointSub:SetShow(true)
  _staticSkillPointSub:SetFontAlpha(1)
  _wpGaugeBG:SetShow(true)
  _wpGaugeBG:SetAlpha(1)
  _wpGauge:SetShow(true)
  _wpGauge:SetAlpha(1)
  _wpGauge_Head:SetShow(true)
  _wpGauge_Head:SetAlpha(1)
  _Wp:SetShow(true)
  _Wp:SetFontAlpha(1)
  _Wp_Main:SetShow(true)
  _Wp_Main:SetFontAlpha(1)
  _contribute_BG:SetShow(true)
  _contribute_BG:SetAlpha(1)
  _contribute_progress:SetShow(true)
  _contribute_progress:SetAlpha(1)
  _contribute_progress_Head:SetShow(true)
  _contribute_progress_Head:SetAlpha(1)
  _contribute_txt:SetShow(true)
  _contribute_txt:SetFontAlpha(1)
  _contribute_Main:SetShow(true)
  _contribute_Main:SetFontAlpha(1)
end

  if getEnableSimpleUI() then
    SelfExp_MouseOver_Force(false)
  end
  _levelBG:addInputEvent("Mouse_On", "SelfExp_MouseOver( true )")
  _levelBG:addInputEvent("Mouse_Out", "SelfExp_MouseOver( false )")
  registerEvent("EventSimpleUIEnable", "SelfExp_MouseOver_Force_Over")
  registerEvent("EventSimpleUIDisable", "SelfExp_MouseOver_Force_Out")
  SelfExp_SimpleUIUpdatePerFrame = function(deltaTime)
  -- function num : 0_7 , upvalues : _selfExpSimpleUI_MouseOver, _levelBG, _skillGaugeBG, _staticSkillExp, _staticSkillExp_Head, _staticSkillPoint, _staticSkillPointMain, _staticSkillPointSub, _wpGaugeBG, _wpGauge, _wpGauge_Head, _Wp, _Wp_Main, _contribute_BG, _contribute_progress, _contribute_progress_Head, _contribute_txt, _contribute_Main
  local tmpRaderAlphaValue = 0.65
  local tmpRaderLessAlphaValue = 0.85
  local tmpRaderMoreAlphaValue = 0.55
  if _selfExpSimpleUI_MouseOver then
    tmpRaderAlphaValue = 1
    tmpRaderLessAlphaValue = 1
    tmpRaderMoreAlphaValue = 1
  end
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderAlphaValue, _levelBG, 2.8 * deltaTime)
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderMoreAlphaValue, _skillGaugeBG, 3.8 * deltaTime)
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderMoreAlphaValue, _staticSkillExp, 3.8 * deltaTime)
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderMoreAlphaValue, _staticSkillExp_Head, 3.8 * deltaTime)
  ;
  (UIAni.perFrameFontAlphaAnimation)(tmpRaderLessAlphaValue, _staticSkillPoint, 3.8 * deltaTime)
  ;
  (UIAni.perFrameFontAlphaAnimation)(tmpRaderLessAlphaValue, _staticSkillPointMain, 3.8 * deltaTime)
  ;
  (UIAni.perFrameFontAlphaAnimation)(tmpRaderLessAlphaValue, _staticSkillPointSub, 3.8 * deltaTime)
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderMoreAlphaValue, _wpGaugeBG, 3.8 * deltaTime)
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderMoreAlphaValue, _wpGauge, 3.8 * deltaTime)
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderMoreAlphaValue, _wpGauge_Head, 3.8 * deltaTime)
  ;
  (UIAni.perFrameFontAlphaAnimation)(tmpRaderLessAlphaValue, _Wp, 3.8 * deltaTime)
  ;
  (UIAni.perFrameFontAlphaAnimation)(tmpRaderLessAlphaValue, _Wp_Main, 3.8 * deltaTime)
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderMoreAlphaValue, _contribute_BG, 3.8 * deltaTime)
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderMoreAlphaValue, _contribute_progress, 3.8 * deltaTime)
  ;
  (UIAni.perFrameAlphaAnimation)(tmpRaderMoreAlphaValue, _contribute_progress_Head, 3.8 * deltaTime)
  ;
  (UIAni.perFrameFontAlphaAnimation)(tmpRaderLessAlphaValue, _contribute_txt, 3.8 * deltaTime)
  ;
  (UIAni.perFrameFontAlphaAnimation)(tmpRaderLessAlphaValue, _contribute_Main, 3.8 * deltaTime)
end

  registerEvent("SimpleUI_UpdatePerFrame", "SelfExp_SimpleUIUpdatePerFrame")
  local registEventHandler = function()
  -- function num : 0_8 , upvalues : _reservedLearningSkillSlot, _staticSkillPoint, _staticSkillPointMain, _staticSkillPointSub, _Wp, _Wp_Main, _contribute_txt, _contribute_Main, _close_ExpGauge
  (_reservedLearningSkillSlot.icon):addInputEvent("Mouse_LUp", "ExpGauge_Skill_IconClick()")
  ;
  (_reservedLearningSkillSlot.icon):addInputEvent("Mouse_On", "ExpGauge_Skill_OverEvent(\"SkillBoxBottom\")")
  ;
  (_reservedLearningSkillSlot.icon):addInputEvent("Mouse_Out", "ExpGauge_Skill_OverEventHide(\"SkillBoxBottom\")")
  _staticSkillPoint:addInputEvent("Mouse_On", "SelfPlayer_ExpTooltip(true, " .. 0 .. ")")
  _staticSkillPoint:addInputEvent("Mouse_Out", "SelfPlayer_ExpTooltip(false, " .. 0 .. ")")
  _staticSkillPointMain:addInputEvent("Mouse_On", "SelfPlayer_ExpTooltip(true, " .. 0 .. ")")
  _staticSkillPointMain:addInputEvent("Mouse_Out", "SelfPlayer_ExpTooltip(false, " .. 0 .. ")")
  _staticSkillPointSub:addInputEvent("Mouse_On", "SelfPlayer_ExpTooltip(true, " .. 0 .. ")")
  _staticSkillPointSub:addInputEvent("Mouse_Out", "SelfPlayer_ExpTooltip(false, " .. 0 .. ")")
  _staticSkillPoint:setTooltipEventRegistFunc("SelfPlayer_ExpTooltip(true, " .. 0 .. ")")
  _staticSkillPointMain:setTooltipEventRegistFunc("SelfPlayer_ExpTooltip(true, " .. 0 .. ")")
  _staticSkillPointSub:setTooltipEventRegistFunc("SelfPlayer_ExpTooltip(true, " .. 0 .. ")")
  _Wp:addInputEvent("Mouse_On", "SelfPlayer_ExpTooltip(true, " .. 1 .. ")")
  _Wp:addInputEvent("Mouse_Out", "SelfPlayer_ExpTooltip(false, " .. 1 .. ")")
  _Wp_Main:addInputEvent("Mouse_On", "SelfPlayer_ExpTooltip(true, " .. 1 .. ")")
  _Wp_Main:addInputEvent("Mouse_Out", "SelfPlayer_ExpTooltip(false, " .. 1 .. ")")
  _Wp:setTooltipEventRegistFunc("SelfPlayer_ExpTooltip(true, " .. 1 .. ")")
  _Wp_Main:setTooltipEventRegistFunc("SelfPlayer_ExpTooltip(true, " .. 1 .. ")")
  _contribute_txt:addInputEvent("Mouse_On", "SelfPlayer_ExpTooltip( true, " .. 2 .. " )")
  _contribute_txt:addInputEvent("Mouse_Out", "SelfPlayer_ExpTooltip( false, " .. 2 .. " )")
  _contribute_Main:addInputEvent("Mouse_On", "SelfPlayer_ExpTooltip( true, " .. 2 .. " )")
  _contribute_Main:addInputEvent("Mouse_Out", "SelfPlayer_ExpTooltip( false, " .. 2 .. " )")
  _contribute_txt:setTooltipEventRegistFunc("SelfPlayer_ExpTooltip(true, " .. 2 .. ")")
  _contribute_Main:setTooltipEventRegistFunc("SelfPlayer_ExpTooltip(true, " .. 2 .. ")")
  _close_ExpGauge:addInputEvent("Mouse_LUp", "SelfPlayerExpGauge_ShowToggle()")
  Panel_SelfPlayerExpGage:addInputEvent("Mouse_On", "ExpGauge_ChangeTexture_On()")
  Panel_SelfPlayerExpGage:addInputEvent("Mouse_Out", "ExpGauge_ChangeTexture_Off()")
  Panel_SelfPlayerExpGage:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
end

  local registMessageHandler = function()
  -- function num : 0_9
  registerEvent("onScreenResize", "Panel_SelfPlayerExpGage_onScreenResize")
  registerEvent("EventCharacterInfoUpdate", "ExpGauge_CharacterInfoUpdate_Reload")
  registerEvent("FromClient_SelfPlayerCombatSkillPointChanged", "UserSkillPoint_Update")
  registerEvent("FromClient_SelfPlayerExpChanged", "Panel_SelfPlayerExpGage_CharacterInfoWindowUpdate")
  registerEvent("EventSelfPlayerLevelUp", "UserLevel_Update")
  registerEvent("FromClient_WpChanged", "wpPoint_UpdateFunc")
  registerEvent("FromClient_UpdateExplorePoint", "contributePoint_UpdateFunc")
end

  local _lastSkillPoint = -1
  local _lastWP = -1
  local _lastEXP = -1
  local _lastSkillExp = 0
  local saved_maxWp = 0
  local expHead_EffectKey = 0
  local prevLevel = 0
  Panel_SelfPlayerExpGage_CharacterInfoWindowUpdate = function()
  -- function num : 0_10 , upvalues : _lastEXP, expHead_EffectKey, _expHead, expGage, _staticLevelSub, _staticLvText
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local player = selfPlayer:get()
  local s64_needExp = player:getNeedExp_s64()
  local s64_exp = player:getExp_s64()
  local _const = Defines.s64_const
  local rate = 0
  local rateDisplay = 0
  if _const.s64_10000 < s64_needExp then
    rate = Int64toInt32(s64_exp * (Defines.s64_const).s64_1000 * (Defines.s64_const).s64_100 / s64_needExp)
  else
    if _const.s64_0 ~= s64_needExp then
      rate = Int64toInt32(s64_exp * (Defines.s64_const).s64_1000 * (Defines.s64_const).s64_100 / s64_needExp)
    end
  end
  if _lastEXP < Int64toInt32(s64_exp) and _lastEXP ~= -1 then
    if expHead_EffectKey ~= 0 then
      _expHead:EraseEffect(expHead_EffectKey)
    end
    expHead_EffectKey = _expHead:AddEffect("fUI_Gauge_Experience", false, 0, 0)
  end
  local real_rate = rate / 1000
  if real_rate == 100 then
    rateDisplay = "100.000%"
  else
    if real_rate == 0 then
      rateDisplay = "0.000%"
    else
      if real_rate == real_rate - real_rate % 1 then
        rateDisplay = real_rate .. ".000%"
      else
        if real_rate == real_rate - real_rate % 0.1 then
          rateDisplay = real_rate .. "00%"
        else
          if real_rate == real_rate - real_rate % 0.01 then
            rateDisplay = real_rate .. "0%"
          else
            rateDisplay = real_rate .. "%"
          end
        end
      end
    end
  end
  expGage:SetProgressRate(real_rate)
  _lastEXP = Int64toInt32(s64_exp)
  _staticLevelSub:ComputePos()
  _staticLevelSub:SetText((string.format)("%.3f", real_rate) .. "%")
  local MaxLevQuestInfo = questList_isClearQuest(677, 1)
  if player:getLevel() == 49 and rate >= 99 and not MaxLevQuestInfo then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAGE_50UP"))
  end
  _staticLevelSub:SetFontColor(4294899677)
  _staticLevelSub:useGlowFont(true, "BaseFont_Glow", 4289951243)
  _staticLvText:SetFontColor(4294899677)
  _staticLvText:useGlowFont(true, "BaseFont_8_Glow", 4289951243)
end

  UserSkillPoint_Update = function()
  -- function num : 0_11 , upvalues : _lastSkillPoint, _staticSkillPointMain, _staticSkillPoint, _staticSkillPointSub, _staticSkillExp, _lastSkillExp, _staticSkillExp_Head, _reservedLearningSkillSlot
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local player = (selfPlayer:get())
  local skillExpRate, skillPointNeedExp = nil, nil
  skillPointNeedExp = player:getSkillPointNeedExperience()
  if skillPointNeedExp ~= 0 then
    skillExpRate = player:getSkillPointExperience() / skillPointNeedExp
  else
    skillExpRate = 0
  end
  if _lastSkillPoint < player:getRemainSkillPoint() and _lastSkillPoint ~= -1 then
    audioPostEvent_SystemUi(3, 7)
    ;
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).SkillIconCheck, true)
    _staticSkillPointMain:EraseAllEffect()
    _staticSkillPointMain:AddEffect("UI_LevelUP_Skill", false, -28, 1)
    _staticSkillPointMain:AddEffect("fUI_LevelUP_Skill02", false, -28, 1)
  end
  _staticSkillPointMain:SetPosX(_staticSkillPoint:GetSizeX() + _staticSkillPoint:GetPosX() + 5)
  _staticSkillPointMain:SetText(tostring(player:getRemainSkillPoint()))
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    local skillPointInfo = getSkillPointInfo(0)
    local skillPointLev = tostring(skillPointInfo._pointLevel)
    _staticSkillPointMain:SetText("(" .. skillPointLev .. ")" .. tostring(player:getRemainSkillPoint()))
  end
  do
    _staticSkillPointMain:SetSize(_staticSkillPointMain:GetTextSizeX() + 5, _staticSkillPointMain:GetSizeY())
    _staticSkillPointSub:SetPosX(_staticSkillPointMain:GetSizeX() + _staticSkillPointMain:GetPosX() - 5)
    _staticSkillExp:SetProgressRate(skillExpRate * 100)
    if _lastSkillExp ~= skillExpRate then
      _staticSkillExp:EraseAllEffect()
      _staticSkillExp_Head:EraseAllEffect()
      _staticSkillExp:AddEffect("UI_Gauge_Experience02", false, 0, 0)
      _staticSkillExp_Head:AddEffect("fUI_Repair01", false, 0, 0)
    end
    local _tempSkillPoint = skillExpRate * 100
    if _tempSkillPoint < 10 then
      _staticSkillPointSub:SetText(".0" .. (string.format)("%.0f", _tempSkillPoint))
    else
      _staticSkillPointSub:SetText("." .. (string.format)("%.0f", _tempSkillPoint))
    end
    _lastSkillPoint = player:getRemainSkillPoint()
    _lastSkillExp = skillExpRate
    if ((selfPlayer:get()):getReservedLearningSkillKey()):isDefined() then
      if (_reservedLearningSkillSlot.iconBG):GetShow() == false then
        ExpGauge_SetReservedLearningSkill()
      end
      ExpGauge_UpdateReservedSkillCircularProgress()
    end
    _staticSkillPointMain:SetFontColor(4294899677)
    _staticSkillPointMain:useGlowFont(true, "BaseFont_Glow", 4289951243)
    _staticSkillPointSub:SetFontColor(4294899677)
    _staticSkillPointSub:useGlowFont(true, "BaseFont_10_Glow", 4289951243)
    enableSkill_UpdateData()
  end
end

  local tooltipExpPanel = (UI.createPanel)("tooltipExp", (Defines.UIGroup).PAGameUIGroup_Windows)
  tooltipExpPanel:SetShow(false, false)
  local tooltipExpPanel_Static = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, tooltipExpPanel, "tooltipExpStatic")
  tooltipExpPanel_Static:SetPosX(10)
  tooltipExpPanel_Static:SetPosY(10)
  tooltipExpPanel_Static:SetSize(290, 90)
  tooltipExpPanel_Static:SetShow(true)
  Panel_SelfPlayerExpGage_OnMouse = function()
  -- function num : 0_12 , upvalues : tooltipExpPanel, tooltipExpPanel_Static
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local player = selfPlayer:get()
  tooltipExpPanel:SetSize(300, 100)
  tooltipExpPanel:SetPosX(getMousePosX())
  positionY = getMousePosY()
  positionY = positionY - 100
  tooltipExpPanel:SetPosY(positionY)
  tooltipExpPanel:SetShow(true, false)
  tooltipExpPanel_Static:SetText(PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_EXP") .. tostring(player:getExp_s64()) .. "/" .. tostring(player:getNeedExp_s64()))
end

  Panel_SelfPlayerExpGage_OutMouse = function()
  -- function num : 0_13 , upvalues : tooltipExpPanel
  tooltipExpPanel:SetShow(false, false)
end

  local _lastLevel = 0
  UserLevel_Update = function()
  -- function num : 0_14 , upvalues : staticLevelBg, _staticLevel, _lastLevel
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  staticLevelBg:SetShow(true)
  staticLevelBg:SetAlpha(0.6)
  _staticLevel:SetText(tostring((player:get()):getLevel()))
  _staticLevel:SetFontColor(4294899677)
  _staticLevel:useGlowFont(true, "BaseFont_26_Glow", 4289951243)
  if _lastLevel < (player:get()):getLevel() and _lastLevel ~= 0 then
    _staticLevel:EraseAllEffect()
    _staticLevel:AddEffect("fUI_NewSkill01", false, 0, 0)
    _staticLevel:AddEffect("UI_NewSkill01", false, 0, 0)
    _staticLevel:AddEffect("UI_LevelUP_Main", false, -33, -43)
    _staticLevel:AddEffect("fUI_Gauge_LevelUp01", false, 80, -40)
  end
  CharacterLevelCheckForWeather()
  _lastLevel = (player:get()):getLevel()
end

  local isSixteen = false
  CharacterLevelCheckForWeather = function()
  -- function num : 0_15 , upvalues : isSixteen
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local inMyLevel = (player:get()):getLevel()
  if inMyLevel == 16 and not isSixteen then
    isSixteen = true
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "PANEL_SELFPLAYEREXPGAGE_LEVEL_WEATHERCHECK"))
  end
end

  CharacterLevelCheckForWeather()
  wpPoint_UpdateFunc = function()
  -- function num : 0_16 , upvalues : _lastWP, _Wp_Main, _wpGauge, _wpGauge_Head, _Wp
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local Wp = selfPlayer:getWp()
  local maxWp = selfPlayer:getMaxWp()
  local wpSetProgress = Wp / maxWp * 100
  if _lastWP < Wp and _lastWP ~= -1 then
    audioPostEvent_SystemUi(3, 13)
    _Wp_Main:EraseAllEffect()
    _Wp_Main:AddEffect("UI_LevelUP_Skill", false, -43, 1)
    _Wp_Main:AddEffect("fUI_LevelUP_Skill02", false, -43, 1)
    _wpGauge:EraseAllEffect()
    _wpGauge_Head:EraseAllEffect()
    _wpGauge:AddEffect("UI_Gauge_Experience02", false, 0, 0)
    _wpGauge_Head:AddEffect("fUI_Repair01", false, 0, 0)
  end
  _Wp_Main:SetPosX(_Wp:GetSizeX() + _Wp:GetPosX() + 5)
  _Wp_Main:SetText(tostring(Wp) .. " / " .. maxWp)
  _wpGauge:SetProgressRate(wpSetProgress)
  _Wp_Main:SetSize(_Wp_Main:GetTextSizeX() + 10, _Wp_Main:GetSizeY())
  _Wp_Main:SetEnableArea(0, 0, _Wp_Main:GetTextSizeX(), _Wp_Main:GetSizeY())
  _Wp_Main:SetFontColor(4294899677)
  _Wp_Main:useGlowFont(true, "BaseFont_Glow", 4289951243)
  _lastWP = Wp
end

  local lastContRate = 0
  local lastRemainExplorePoint = 0
  local lastExplorePoint = 0
  local isFirstExplore = false
  Panel_Expgauge_MyContributeValue = 0
  contributePoint_UpdateFunc = function()
  -- function num : 0_17 , upvalues : _contribute_Main, _contribute_progress, _contribute_txt, isFirstExplore, lastRemainExplorePoint, lastExplorePoint, lastContRate, _contribute_progress_Head
  local territoryKeyRaw = getDefaultTerritoryKey()
  local explorePoint = getExplorePointByTerritoryRaw(territoryKeyRaw)
  if explorePoint == nil then
    _contribute_Main:SetText("")
    _contribute_progress:SetProgressRate(0)
    return 
  end
  local s64_exploreRequireExp = getRequireExperienceToExplorePointByTerritory_s64(territoryKeyRaw)
  local cont_expRate = Int64toInt32(explorePoint:getExperience_s64()) / Int64toInt32(getRequireExplorationExperience_s64())
  local nowRemainExpPoint = tostring(explorePoint:getRemainedPoint())
  local nowExpPoint = tostring(explorePoint:getAquiredPoint())
  _contribute_Main:SetPosX(_contribute_txt:GetSizeX() + _contribute_txt:GetPosX() + 5)
  _contribute_Main:SetText(tostring(explorePoint:getRemainedPoint()) .. " / " .. tostring(explorePoint:getAquiredPoint()))
  if isGameServiceTypeDev() then
    _contribute_Main:SetText(tostring(explorePoint:getRemainedPoint()) .. " / " .. tostring(explorePoint:getAquiredPoint()) .. "      (" .. Int64toInt32(explorePoint:getExperience_s64()) .. " / " .. Int64toInt32(getRequireExplorationExperience_s64()) .. ")")
  end
  _contribute_progress:SetProgressRate(cont_expRate * 100)
  _contribute_Main:SetSize(_contribute_Main:GetTextSizeX() + 10, _contribute_Main:GetSizeY())
  _contribute_Main:SetEnableArea(0, 0, _contribute_Main:GetTextSizeX(), _contribute_Main:GetSizeY())
  Panel_Expgauge_MyContributeValue = tostring(explorePoint:getRemainedPoint())
  if isFirstExplore == false then
    lastRemainExplorePoint = 0
    lastExplorePoint = 0
    nowRemainExpPoint = 0
    nowExpPoint = 0
    isFirstExplore = true
  end
  if lastContRate ~= cont_expRate then
    _contribute_progress:SetNotAbleMasking(true)
    _contribute_progress_Head:SetNotAbleMasking(true)
    _contribute_progress:EraseAllEffect()
    _contribute_progress_Head:EraseAllEffect()
    _contribute_progress:AddEffect("UI_Gauge_Experience02", false, 0, 0)
    _contribute_progress_Head:AddEffect("fUI_Repair01", false, 0, 0)
  end
  if lastRemainExplorePoint ~= nowRemainExpPoint and isFirstExplore == true then
    audioPostEvent_SystemUi(3, 7)
    _contribute_Main:EraseAllEffect()
    _contribute_Main:AddEffect("UI_LevelUP_Skill", false, 0, 1)
  end
  if lastExplorePoint ~= nowExpPoint and isFirstExplore == true then
    audioPostEvent_SystemUi(3, 7)
    _contribute_Main:EraseAllEffect()
    _contribute_Main:AddEffect("UI_LevelUP_Skill", false, -38, 1)
  end
  _contribute_Main:SetFontColor(4294899677)
  _contribute_Main:useGlowFont(true, "BaseFont_Glow", 4289951243)
  lastContRate = cont_expRate
  lastRemainExplorePoint = tostring(explorePoint:getRemainedPoint())
  lastExplorePoint = tostring(explorePoint:getAquiredPoint())
end

  local _contributeUsePoint = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_1"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_2"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_3")}
  ExpGauge_ChangeTexture_On = function()
  -- function num : 0_18 , upvalues : _close_ExpGauge, expText
  _close_ExpGauge:SetShow(true)
  Panel_SelfPlayerExpGage:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_drag.dds")
  expText:SetText(PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_DRAG_SKILLEXP"))
end

  ExpGauge_ChangeTexture_Off = function()
  -- function num : 0_19 , upvalues : _close_ExpGauge, expText
  _close_ExpGauge:SetShow(false)
  Panel_SelfPlayerExpGage:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
  expText:SetText(PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_SKILLEXP"))
end

  SelfPlayerExpGauge_ShowToggle = function()
  -- function num : 0_20 , upvalues : initPosX, initPosY
  local isShow = Panel_SelfPlayerExpGage:IsShow()
  if isShow == true then
    ExpGague_ClearReservedLearningSkill()
    Panel_SelfPlayerExpGage:SetShow(false, false)
  else
    Panel_SelfPlayerExpGage:SetPosX(initPosX)
    Panel_SelfPlayerExpGage:SetPosY(initPosY)
    Panel_SelfPlayerExpGage:SetShow(true, true)
    ExpGauge_SetReservedLearningSkill()
  end
end

  local _staticSkillExp_p = (UI.getChildControl)(Panel_SelfPlayerExpGage, "CircularProgress_SkillExp_p")
  local _staticSkillPoint_p = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_SkillPoint_p")
  Panel_User_ProductSkillPoint_Update = function()
  -- function num : 0_21 , upvalues : _staticSkillPoint_p, _staticSkillExp_p
  local skillPointInfo = getSkillPointInfo(2)
  _staticSkillPoint_p:SetText(tostring(skillPointInfo._remainPoint))
  local skillExpRate_p = skillPointInfo._currentExp / skillPointInfo._nextLevelExp
  _staticSkillExp_p:SetProgressRate(skillExpRate_p * 100)
end

  ExpGauge_Skill_IconClick = function()
  -- function num : 0_22
  skillWindow_ClearReservedLearningSkill()
end

  ExpGauge_Skill_OverEvent = function(SlotType)
  -- function num : 0_23 , upvalues : _reservedLearningSkillSlot
  local skillNo = 0
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if ((selfPlayer:get()):getReservedLearningSkillKey()):isDefined() then
    skillNo = ((selfPlayer:get()):getReservedLearningSkillKey()):getSkillNo()
  else
    return 
  end
  Panel_SkillTooltip_SetPosition(skillNo, _reservedLearningSkillSlot.icon, "SkillBoxBottom")
  Panel_SkillTooltip_Show(skillNo, false, SlotType, true)
end

  ExpGauge_Skill_OverEventHide = function(SlotType)
  -- function num : 0_24
  Panel_SkillTooltip_Hide()
end

  ExpGague_ClearReservedLearningSkill = function()
  -- function num : 0_25 , upvalues : _reservedLearningSkillSlot
  (_reservedLearningSkillSlot.icon):ReleaseTexture()
  ;
  (_reservedLearningSkillSlot.icon):ChangeTextureInfoName("")
  ;
  (_reservedLearningSkillSlot.icon):SetAlpha(0)
  ;
  (_reservedLearningSkillSlot.iconBG):SetShow(false)
  ;
  (_reservedLearningSkillSlot.icon):SetShow(false)
  ;
  (_reservedLearningSkillSlot.circularBorder):SetShow(false)
  ;
  (_reservedLearningSkillSlot.point):SetShow(false)
  Panel_SkillTooltip_Hide()
end

  ExpGauge_SetReservedLearningSkill = function()
  -- function num : 0_26 , upvalues : _reservedLearningSkillSlot
  local skillNo = 0
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if ((selfPlayer:get()):getReservedLearningSkillKey()):isDefined() then
    skillNo = ((selfPlayer:get()):getReservedLearningSkillKey()):getSkillNo()
  else
    return 
  end
  local skillTypeStaticWrapper = getSkillTypeStaticStatus(skillNo)
  local skillTypeStatic = skillTypeStaticWrapper:get()
  ;
  (_reservedLearningSkillSlot.icon):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
  ;
  (_reservedLearningSkillSlot.icon):SetAlpha(1)
  _reservedLearningSkillNo = skillNo
  ExpGauge_UpdateReservedSkillCircularProgress()
  ;
  (_reservedLearningSkillSlot.iconBG):SetShow(true)
  ;
  (_reservedLearningSkillSlot.icon):SetShow(true)
  ;
  (_reservedLearningSkillSlot.circularBorder):SetShow(true)
  ;
  (_reservedLearningSkillSlot.point):SetShow(false)
end

  ExpGauge_UpdateReservedSkillCircularProgress = function()
  -- function num : 0_27 , upvalues : _lastSkillPoint, _lastSkillExp, _reservedLearningSkillSlot
  local skillNo = 0
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if ((selfPlayer:get()):getReservedLearningSkillKey()):isDefined() then
    skillNo = ((selfPlayer:get()):getReservedLearningSkillKey()):getSkillNo()
  else
    return 
  end
  local skillStaticWrapper = getSkillStaticStatus(skillNo, 1)
  local needPoint = (skillStaticWrapper:get())._needSkillPointForLearning
  if needPoint == 0 then
    (UI.ASSERT)(false, "제수�\128 0 이면 안된�\164.")
    return 
  end
  local curSkillPoint = _lastSkillPoint + _lastSkillExp
  local progressRate = curSkillPoint / needPoint
  ;
  (_reservedLearningSkillSlot.circularBorder):SetProgressRate(progressRate * 100)
end

  ExpGauge_CharacterInfoUpdate_Reload = function()
  -- function num : 0_28
  Panel_SelfPlayerExpGage_CharacterInfoWindowUpdate()
  UserSkillPoint_Update()
  UserLevel_Update()
  wpPoint_UpdateFunc()
  contributePoint_UpdateFunc()
end

  SelfExp_BuffIcon_PosX = function()
  -- function num : 0_29
  return _buffIconPosX
end

  renderModeChange_FGlobal_PackageIconUpdate = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_30
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  FGlobal_PackageIconUpdate()
end

  registerEvent("FromClient_RenderModeChangeState", "renderModeChange_FGlobal_PackageIconUpdate")
  SelfPlayer_ExpTooltip = function(isShow, iconType)
  -- function num : 0_31 , upvalues : _staticSkillPointSub, _Wp_Main, _contributeUsePoint, _contribute_Main
  local uiControl, name, desc = nil
  if iconType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_MAINSTATUS_SKILLPOINTICON_TITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_MAINSTATUS_SKILLPOINTICON_DESC")
    uiControl = _staticSkillPointSub
  else
    if iconType == 1 then
      name = PAGetString(Defines.StringSheet_RESOURCE, "CHARACTERINFO_TEXT_MENTAL")
      desc = PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_DESC_WP")
      uiControl = _Wp_Main
    else
      if iconType == 2 then
        local _contributeBubbleText = ""
        for i = 0, 2 do
          if ToClient_UsedExplorePoint(i) > 0 then
            if _contributeBubbleText == "" then
              _contributeBubbleText = _contributeUsePoint[i] .. " " .. ToClient_UsedExplorePoint(i)
            else
              _contributeBubbleText = _contributeBubbleText .. " | " .. _contributeUsePoint[i] .. " " .. ToClient_UsedExplorePoint(i)
            end
          end
        end
        if _contributeBubbleText == "" then
          _contributeBubbleText = PAGetString(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_4")
        else
          _contributeBubbleText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EXPGUAGE_CONTRIBUTE_VALUE_5", "_contributeBubbleText", _contributeBubbleText)
        end
        name = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_GUIDE_CONTRIBUTIVENESS")
        desc = PAGetString(Defines.StringSheet_GAME, "MAINSTATUS_DESC_EXPLORE") .. "\n" .. _contributeBubbleText
        uiControl = _contribute_Main
      end
    end
  end
  do
    if isShow then
      audioPostEvent_SystemUi(0, 13)
      registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(uiControl, name, desc)
    else
      TooltipSimple_Hide()
    end
  end
end

  contributePoint_UpdateFunc()
  Panel_SelfPlayerExpGage_CharacterInfoWindowUpdate()
  UserSkillPoint_Update()
  registEventHandler()
  registMessageHandler()
  changePositionBySever(Panel_SelfPlayerExpGage, (CppEnums.PAGameUIType).PAGameUIPanel_SelfPlayer_ExpGage, true, false, false)
end

