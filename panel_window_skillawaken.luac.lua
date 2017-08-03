-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\skillawaken\panel_window_skillawaken.luac 

-- params : ...
-- function num : 0
local UIMode = Defines.UIMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
Panel_SkillAwaken:RegisterShowEventFunc(true, "SkillAwaken_ShowAni()")
Panel_SkillAwaken:RegisterShowEventFunc(false, "SkillAwaken_HideAni()")
Panel_SkillAwaken:ActiveMouseEventEffect(true)
Panel_SkillAwaken:setGlassBackground(true)
local _frame_SkillList = (UI.getChildControl)(Panel_Frame_AwkSkillList, "Frame_SkillList")
local _content_SkillList = (UI.getChildControl)(_frame_SkillList, "Frame_1_Content")
local _sld_content_SkillList = (UI.getChildControl)(_frame_SkillList, "Frame_1_VerticalScroll")
local _sldBtn_content_SkillList = (UI.getChildControl)(_sld_content_SkillList, "Frame_1_VerticalScroll_CtrlButton")
local _skillListSizeY = _content_SkillList:GetSizeY()
local _frame_OptionList = (UI.getChildControl)(Panel_Frame_AwkOptions, "Frame_OptionList")
local _content_OptionList = (UI.getChildControl)(_frame_OptionList, "Frame_2_Content")
local _isReAwaken = false
local _isAwakenRest = false
_frame_OptionList:SetShow(false)
local ui = {_txt_Title = (UI.getChildControl)(Panel_SkillAwaken, "StaticText_Title"), _txt_canAwaken = (UI.getChildControl)(Panel_SkillAwaken, "StaticText_SkillList"), _txt_OptionList = (UI.getChildControl)(Panel_SkillAwaken, "StaticText_OpList"), _awakenPoint = (UI.getChildControl)(Panel_SkillAwaken, "StaticText_AwakePoint"), _btn_Close = (UI.getChildControl)(Panel_SkillAwaken, "Button_Close"), _btn_CloseWin = (UI.getChildControl)(Panel_SkillAwaken, "Button_CloseWindow"), _btn_SwapWin = (UI.getChildControl)(Panel_SkillAwaken, "Button_WindowSwapisRewaken"), _btn_doAwaken = (UI.getChildControl)(Panel_SkillAwaken, "Button_Awaken"), _circle = (UI.getChildControl)(Panel_SkillAwaken, "Static_Circle"), _circleEff = (UI.getChildControl)(Panel_SkillAwaken, "Static_CircleEff"), _circle_IconBG = (UI.getChildControl)(Panel_SkillAwaken, "Static_SkillIcon_BG"), _circle_Icon = (UI.getChildControl)(Panel_SkillAwaken, "Static_SkillIcon"), _circle_IconOff = (UI.getChildControl)(Panel_SkillAwaken, "Static_SkillIcon_Off"), _circle_IconOn = (UI.getChildControl)(Panel_SkillAwaken, "Static_SkillIcon_On"), _txt_SkillAwakenDesc = (UI.getChildControl)(Panel_SkillAwaken, "StaticText_SkillAwakenDesc"), _circle_progress = (UI.getChildControl)(Panel_SkillAwaken, "CircularProgress_Awk"), _buttonQuestion = (UI.getChildControl)(Panel_SkillAwaken, "Button_Question")}
local result = {_awakenResult_BG = (UI.getChildControl)(Panel_SkillAwaken_ResultOption, "Static_AcquireBG"), _awakenTitle = (UI.getChildControl)(Panel_SkillAwaken_ResultOption, "StaticText_AwakenTitle"), _awakenOption = (UI.getChildControl)(Panel_SkillAwaken_ResultOption, "StaticText_AwakenOption")}
local copyUI = {_copy_IconBG = (UI.getChildControl)(_content_SkillList, "Button_C_SkIconBG_0"), _copy_Icon = (UI.getChildControl)(_content_SkillList, "Static_C_SkIcon_0"), _copy_SkillName = (UI.getChildControl)(_content_SkillList, "StaticText_C_SkName_0"), _copy_AwakenLv = (UI.getChildControl)(_content_SkillList, "StaticText_C_AwkLv_0"), _copy_AwakenOption = (UI.getChildControl)(_content_SkillList, "StaticText_C_AwkOp_0")}
local getStr_SkillAwaken = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLAWAKEN_TITLE"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLAWAKEN_AWAKENLIST"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLAWAKEN_OPTIONLIST")}
local AwakenMng = {_buttonCount = 50, 
_uiButtonAwkList = {}
}
local buttonAwakenList = (UI.getChildControl)(Panel_SkillAwaken, "Button_AwakenA")
local buttonAwakenClearList = (UI.getChildControl)(Panel_SkillAwaken, "Button_ResetAwaken")
local textNoSkills = (UI.getChildControl)(Panel_SkillAwaken, "StaticText_NoSkills")
;
(ui._btn_doAwaken):SetIgnore(true)
;
(ui._btn_doAwaken):SetMonoTone(true)
;
(ui._circle_IconOn):SetShow(false)
;
(ui._circleEff):SetShow(false)
;
(copyUI._copy_IconBG):SetShow(false)
;
(copyUI._copy_Icon):SetShow(false)
;
(copyUI._copy_SkillName):SetShow(false)
;
(copyUI._copy_AwakenLv):SetShow(false)
;
(copyUI._copy_AwakenOption):SetShow(false)
Panel_SkillAwaken:SetShow(false)
Panel_SkillAwaken:MoveChilds(Panel_SkillAwaken:GetID(), Panel_Frame_AwkSkillList)
Panel_SkillAwaken:MoveChilds(Panel_SkillAwaken:GetID(), Panel_Frame_AwkOptions)
deletePanel(Panel_Frame_AwkSkillList:GetID())
deletePanel(Panel_Frame_AwkOptions:GetID())
Panel_Frame_AwkSkillList = nil
Panel_Frame_AwkOptions = nil
local listSizeY = 0
local skillIndex = -1
local copyIndex = -1
local isStartAwaken = false
local isEndCircular = false
local currentTimer = 0
local currentRate = 0
local _endCircular = 100
local endTime = 2
local tmpValue = _endCircular / endTime
local isCompleteCircular = false
;
(ui._btn_Close):addInputEvent("Mouse_LUp", "SkillAwaken_HideAni()")
;
(ui._btn_CloseWin):addInputEvent("Mouse_LUp", "SkillAwaken_HideAni()")
;
(ui._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelSkillAwaken\" )")
;
(ui._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelSkillAwaken\", \"true\")")
;
(ui._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelSkillAwaken\", \"false\")")
;
(ui._btn_SwapWin):addInputEvent("Mouse_LUp", "HandleClicked_SwapWindow()")
SkillAwaken_ShowAni = function()
  -- function num : 0_0 , upvalues : ui, AwakenMng
  Panel_SkillAwaken:SetShow(true)
  ;
  (UIAni.fadeInSCR_Down)(Panel_SkillAwaken)
  ;
  (UIAni.AlphaAnimation)(1, ui._circle_progress, 0, 0.2)
  ;
  (UIAni.AlphaAnimation)(1, ui._circleEff, 0, 0.2)
  ;
  (ui._circleEff):SetVertexAniRun("Ani_Color_Off", true)
  Panel_SkillAwaken_ResultOption:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_SkillAwaken_ResultOption, 0, 0.3)
  aniInfo:SetHideAtEnd(true)
  local self = AwakenMng
  for index = 0, self._buttonCount - 1 do
    (((self._uiButtonAwkList)[index])._Icon):SetIgnore(false)
    ;
    (((self._uiButtonAwkList)[index])._IconBG):SetIgnore(false)
  end
end

SkillAwaken_HideAni = function()
  -- function num : 0_1 , upvalues : ui, _isReAwaken
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_SkillAwaken, 0, 0.2)
  aniInfo:SetHideAtEnd(true)
  local aniInfo1 = (UIAni.AlphaAnimation)(0, ui._circle_progress, 0, 0.2)
  aniInfo1:SetHideAtEnd(true)
  local aniInfo3 = (UIAni.AlphaAnimation)(0, ui._circleEff, 0, 0.2)
  aniInfo3:SetHideAtEnd(true)
  _isReAwaken = false
end

local awakening = {}
awakening.createSlot = function(index)
  -- function num : 0_2 , upvalues : UI_PUCT, _content_SkillList, copyUI, UI_TM, listSizeY
  local ui = {}
  ui._IconBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, _content_SkillList, "Button_AwakenBG_" .. index)
  CopyBaseProperty(copyUI._copy_IconBG, ui._IconBG)
  ;
  (ui._IconBG):SetShow(true)
  ;
  (ui._IconBG):addInputEvent("Mouse_LUp", "event_AwakenSkill(" .. index .. ")")
  ui._Icon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, _content_SkillList, "Static_C_SkillIcon_" .. index)
  CopyBaseProperty(copyUI._copy_Icon, ui._Icon)
  ;
  (ui._Icon):SetShow(true)
  ;
  (ui._Icon):addInputEvent("Mouse_LUp", "event_AwakenSkill( " .. index .. " )")
  ui._SkillName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, _content_SkillList, "StaticText_C_SkillName_" .. index)
  CopyBaseProperty(copyUI._copy_SkillName, ui._SkillName)
  ;
  (ui._SkillName):SetShow(true)
  ui._AwakenLv = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, _content_SkillList, "StaticText_C_AwknLv_" .. index)
  CopyBaseProperty(copyUI._copy_AwakenLv, ui._AwakenLv)
  ;
  (ui._AwakenLv):SetShow(true)
  ;
  (ui._AwakenLv):SetAutoResize(true)
  ;
  (ui._AwakenLv):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ui._AwakenOption = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, _content_SkillList, "StaticText_C_AwknOp_" .. index)
  CopyBaseProperty(copyUI._copy_AwakenOption, ui._AwakenOption)
  ;
  (ui._AwakenOption):SetShow(true)
  ;
  (ui._AwakenOption):SetAutoResize(true)
  ;
  (ui._AwakenOption):SetTextMode(UI_TM.eTextMode_AutoWrap)
  listSizeY = index * ((ui._IconBG):GetSizeY() + 35)
  _content_SkillList:SetSize(_content_SkillList:GetSizeX(), listSizeY + 50)
  ui.SetShow = function(self, isShow)
    -- function num : 0_2_0 , upvalues : ui
    (ui._IconBG):SetShow(isShow)
    ;
    (ui._Icon):SetShow(isShow)
    ;
    (ui._SkillName):SetShow(isShow)
    ;
    (ui._AwakenLv):SetShow(isShow)
    ;
    (ui._AwakenOption):SetShow(isShow)
  end

  ui.SetData = function(self, skillWrapper, posY, tabType)
    -- function num : 0_2_1 , upvalues : ui
    local skillTypeSSW = skillWrapper:getSkillTypeStaticStatusWrapper()
    local skillNo = skillWrapper:getSkillNo()
    skillNoCache = skillNo
    if not tabType then
      (ui._IconBG):SetPosY(posY)
      ;
      (ui._Icon):SetPosY((ui._IconBG):GetPosY() + 8)
      ;
      (ui._SkillName):SetPosY((ui._IconBG):GetPosY() + 12)
      ;
      (ui._AwakenLv):SetPosY((ui._IconBG):GetPosY() + 35)
      ;
      (ui._AwakenOption):SetPosY((ui._IconBG):GetPosY() + 55)
      ;
      (ui._SkillName):SetText(skillWrapper:getName())
      ;
      (ui._Icon):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
      ;
      (ui._AwakenOption):SetText(skillTypeSSW:getDescription())
      ;
      (ui._IconBG):SetSize((ui._IconBG):GetSizeX(), (ui._Icon):GetSizeY() + (ui._AwakenOption):GetTextSizeY() + 30)
    else
      ;
      (ui._IconBG):SetPosY(posY)
      ;
      (ui._Icon):SetPosY((ui._IconBG):GetPosY() + 8)
      ;
      (ui._SkillName):SetPosY((ui._IconBG):GetPosY() + 12)
      ;
      (ui._AwakenLv):SetPosY((ui._IconBG):GetPosY() + 35)
      ;
      (ui._AwakenOption):SetPosY((ui._IconBG):GetPosY() + (ui._AwakenLv):GetTextSizeY() + 55)
      ;
      (ui._SkillName):SetText(skillWrapper:getName())
      ;
      (ui._Icon):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
      ;
      (ui._AwakenOption):SetText(skillTypeSSW:getDescription())
      ;
      (ui._IconBG):SetSize((ui._IconBG):GetSizeX(), (ui._Icon):GetSizeY() + (ui._AwakenLv):GetTextSizeY() + (ui._AwakenOption):GetTextSizeY() + 30)
    end
    ;
    (self._Icon):addInputEvent("Mouse_On", "SkillAwaken_OverEvent(" .. skillNo .. ", \"SkillAwaken\")")
    ;
    (self._Icon):addInputEvent("Mouse_Out", "SkillAwaken_OverEventHide(" .. skillNo .. ",\"SkillAwaken\")")
    Panel_SkillTooltip_SetPosition(skillNo, self._Icon, "SkillAwaken")
    return (ui._IconBG):GetPosY() + (ui._IconBG):GetSizeY() + 5
  end

  return ui
end

event_AwakenSkill = function(index)
  -- function num : 0_3 , upvalues : ui, skillIndex, _isReAwaken, _isAwakenRest
  audioPostEvent_SystemUi(0, 7)
  local skillWrapper = skillWindow_awakeningSkillAt(index)
  local skillTypeSSW = skillWrapper:getSkillTypeStaticStatusWrapper()
  ;
  (ui._circleEff):ResetVertexAni()
  ;
  (ui._circleEff):EraseAllEffect()
  ;
  (ui._circleEff):SetVertexAniRun("Ani_Color_On", true)
  ;
  (ui._circleEff):SetVertexAniRun("Ani_Rotate_New", true)
  ;
  (ui._circle_IconOff):SetShow(false)
  ;
  (ui._circle_IconOn):SetShow(true)
  ;
  (ui._circle_Icon):ChangeTextureInfoName("Icon/" .. skillTypeSSW:getIconPath())
  ;
  (ui._circle_Icon):addInputEvent("Mouse_LUp", "event_deleteCircleIcon()")
  ;
  (ui._btn_doAwaken):SetAlpha(1)
  ;
  (ui._btn_doAwaken):SetFontAlpha(1)
  ;
  (ui._btn_doAwaken):SetIgnore(false)
  ;
  (ui._btn_doAwaken):SetMonoTone(false)
  ;
  (ui._btn_doAwaken):EraseAllEffect()
  ;
  (ui._btn_doAwaken):AddEffect("UI_Shop_Button", true, 0, 0)
  ;
  (ui._circle_Icon):EraseAllEffect()
  ;
  (ui._circle_Icon):AddEffect("fUI_NewSkill_Loop01", true, 0, 0)
  ;
  (ui._circle_Icon):AddEffect("fUI_SkillAwakenLight", false, 0, 0)
  ;
  (ui._circle_Icon):AddEffect("fUI_SkillAwakenSpinSmoke", false, 0, 0)
  skillIndex = index
  local doHaveAwakenResetItem = false
  local isAwakenable = false
  if _isReAwaken == true then
    if ToClient_isPossibleReAwalening() then
      (ui._btn_doAwaken):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREAWAKEN_TITLE"))
      ;
      (ui._btn_doAwaken):addInputEvent("Mouse_LUp", "Awaken_MessageBox()")
    else
      ;
      (ui._btn_doAwaken):EraseAllEffect()
      ;
      (ui._btn_doAwaken):SetAlpha(0.85)
      ;
      (ui._btn_doAwaken):SetFontAlpha(0.85)
      ;
      (ui._btn_doAwaken):SetIgnore(true)
      ;
      (ui._btn_doAwaken):SetMonoTone(true)
    end
  else
    if _isAwakenRest == true then
      (ui._btn_doAwaken):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLAWAKEN_RESET"))
      ;
      (ui._btn_doAwaken):addInputEvent("Mouse_LUp", "clickAwakeningRest(" .. index .. ")")
      doHaveAwakenResetItem = skillWindow_doHaveAwakenResetItem()
      if not doHaveAwakenResetItem then
        (ui._btn_doAwaken):EraseAllEffect()
        ;
        (ui._btn_doAwaken):SetIgnore(true)
        ;
        (ui._btn_doAwaken):SetMonoTone(true)
      end
    else
      ;
      (ui._btn_doAwaken):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLAWAKEN_TITLE"))
      ;
      (ui._btn_doAwaken):addInputEvent("Mouse_LUp", "clickAwakeningSkill()")
      isAwakenable = skillWindow_isAwakenable()
      if not isAwakenable then
        (ui._btn_doAwaken):EraseAllEffect()
        ;
        (ui._btn_doAwaken):SetIgnore(true)
        ;
        (ui._btn_doAwaken):SetMonoTone(true)
      end
    end
  end
end

event_deleteCircleIcon = function()
  -- function num : 0_4 , upvalues : ui, skillIndex
  audioPostEvent_SystemUi(0, 11)
  ;
  (ui._circleEff):ResetVertexAni()
  ;
  (ui._circleEff):EraseAllEffect()
  ;
  (ui._circleEff):SetVertexAniRun("Ani_Color_Off", true)
  ;
  (ui._circleEff):SetVertexAniRun("Ani_Rotate_New", true)
  ;
  (ui._circle_IconOff):SetShow(true)
  ;
  (ui._circle_IconOn):SetShow(false)
  ;
  (ui._circle_Icon):ChangeTextureInfoName("")
  ;
  (ui._circle_Icon):EraseAllEffect()
  ;
  (ui._btn_doAwaken):EraseAllEffect()
  ;
  (ui._btn_doAwaken):SetAlpha(0.85)
  ;
  (ui._btn_doAwaken):SetFontAlpha(0.85)
  ;
  (ui._btn_doAwaken):SetIgnore(true)
  ;
  (ui._btn_doAwaken):SetMonoTone(true)
  skillIndex = -1
end

local skillNoCache = 0
local slotTypeCache = 0
local tooltipcacheCount = 0
SkillAwaken_OverEvent = function(skillNo, SlotType)
  -- function num : 0_5 , upvalues : skillNoCache, slotTypeCache, tooltipcacheCount
  if skillNoCache == skillNo and slotTypeCache == SlotType then
    tooltipcacheCount = tooltipcacheCount + 1
  else
    skillNoCache = skillNo
    slotTypeCache = SlotType
    tooltipcacheCount = 1
  end
  Panel_SkillTooltip_Show(skillNo, false, SlotType)
end

SkillAwaken_OverEventHide = function(skillNo, SlotType)
  -- function num : 0_6 , upvalues : skillNoCache, slotTypeCache, tooltipcacheCount
  if skillNoCache == skillNo and slotTypeCache == SlotType then
    tooltipcacheCount = tooltipcacheCount - 1
  else
    tooltipcacheCount = 0
  end
  if tooltipcacheCount <= 0 then
    Panel_SkillTooltip_Hide()
  end
end

Update_CircularProgress = function(deltaTime, index)
  -- function num : 0_7 , upvalues : ui, getStr_SkillAwaken, copyIndex, isStartAwaken, currentTimer, isCompleteCircular, currentRate, tmpValue, isEndCircular, _endCircular, skillIndex, buttonAwakenList, buttonAwakenClearList
  (ui._awakenPoint):SetText(getStr_SkillAwaken[1] .. " <PAColor0xffffa82c>" .. tostring(copyIndex) .. "<PAOldColor>")
  if isStartAwaken == true and currentTimer < 3 and isCompleteCircular == false then
    currentTimer = currentTimer + deltaTime
    currentRate = currentRate + tmpValue * deltaTime
    ;
    (ui._circle_progress):SetProgressRate(currentRate)
    if currentRate >= 100 then
      (ui._circle_progress):EraseAllEffect()
      ;
      (ui._circle_Icon):EraseAllEffect()
      ;
      (ui._circle_progress):AddEffect("UI_ItemInstall_BigRing", true, 0, 0)
      ;
      (ui._circle_Icon):AddEffect("UI_ItemInstall_Gold", true, 0, 0)
      ;
      (ui._circle_Icon):AddEffect("UI_SkillAwakeningShield", false, 0, 0)
      ;
      (ui._circle_Icon):AddEffect("fUI_SkillButton02", false, 0, 0)
      ;
      (ui._circle_Icon):AddEffect("fUI_NewSkill01", false, 0, 0)
      ;
      (ui._circle_Icon):AddEffect("UI_SkillAwakeningFinal", false, 0, 0)
      ;
      (ui._circle_Icon):AddEffect("fUI_SkillAwakenBoom", false, 0, 0)
      currentTimer = 0
      isCompleteCircular = true
    end
  end
  if isCompleteCircular == true then
    currentTimer = currentTimer + deltaTime
    if currentTimer > 2 then
      isStartAwaken = false
      isEndCircular = true
      isCompleteCircular = false
      _endCircular = 100
      currentTimer = 0
      currentRate = 0
      deltaTime = 0
      ;
      (ui._circle_Icon):SetIgnore(false)
      Panel_SkillAwaken:SetShow(false, true)
      skillWindow_requestAwakenSkill(skillIndex)
      skillIndex = -1
      buttonAwakenList:SetIgnore(false)
      buttonAwakenClearList:SetIgnore(false)
      FGlobal_ResetUrl_Tooltip_SkillForLearning()
    end
  end
end

clickAwakeningSkill = function()
  -- function num : 0_8 , upvalues : isStartAwaken, ui, AwakenMng, buttonAwakenList, buttonAwakenClearList
  audioPostEvent_SystemUi(3, 10)
  isStartAwaken = true
  ;
  (ui._circle_Icon):SetIgnore(true)
  ;
  (ui._btn_doAwaken):EraseAllEffect()
  ;
  (ui._btn_doAwaken):SetAlpha(0.85)
  ;
  (ui._btn_doAwaken):SetFontAlpha(0.85)
  ;
  (ui._btn_doAwaken):SetIgnore(true)
  ;
  (ui._btn_doAwaken):SetMonoTone(true)
  ;
  (ui._circle_progress):AddEffect("UI_ItemInstall_ProduceRing", true, 0, 0)
  ;
  (ui._circle_Icon):AddEffect("UI_SkillAwakening01", false, 0, 0)
  ;
  (ui._circle_progress):SetShow(true)
  local self = AwakenMng
  for index = 0, self._buttonCount - 1 do
    (((self._uiButtonAwkList)[index])._Icon):SetIgnore(true)
    ;
    (((self._uiButtonAwkList)[index])._IconBG):SetIgnore(true)
  end
  buttonAwakenList:SetIgnore(true)
  buttonAwakenClearList:SetIgnore(true)
end

Awaken_MessageBox = function()
  -- function num : 0_9 , upvalues : _isReAwaken
  if _isReAwaken == true then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREAWAKEN_MSGBOX")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = clickAwakeningSkill, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      clickAwakeningSkill()
    end
  end
end

clickAwakeningRest = function(index)
  -- function num : 0_10
  ToClient_AwakenSkillResetRequest(index)
  Panel_SkillAwaken:SetShow(false, true)
end

AwakenMng.initialize = function(self)
  -- function num : 0_11 , upvalues : _frame_SkillList, awakening, copyIndex, _frame_OptionList, buttonAwakenList, buttonAwakenClearList, textNoSkills
  _frame_SkillList:UpdateContentScroll()
  ;
  (_frame_SkillList:GetVScroll()):SetControlTop()
  _frame_SkillList:UpdateContentPos()
  for index = 0, self._buttonCount - 1 do
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R5 in 'UnsetPending'

    (self._uiButtonAwkList)[index] = (awakening.createSlot)(index)
    ;
    ((self._uiButtonAwkList)[index]):SetShow(false)
    copyIndex = index
  end
  _frame_SkillList:UpdateContentScroll()
  _frame_OptionList:UpdateContentScroll()
  buttonAwakenList:addInputEvent("Mouse_LUp", "HandleClicked_ButtonAwakenList()")
  buttonAwakenClearList:addInputEvent("Mouse_LUp", "HandleClicked_ButtonAwakenClearList()")
  textNoSkills:SetShow(false)
end

AwakenMng.SkillAwaken_Show = function(self)
  -- function num : 0_12 , upvalues : _isAwakenRest, _isReAwaken, buttonAwakenList, buttonAwakenClearList, _content_SkillList, _sld_content_SkillList, _frame_SkillList, ui, isStartAwaken, isCompleteCircular, currentRate, _endCircular, currentTimer, skillIndex, textNoSkills
  if Panel_Window_Enchant:GetShow() then
    PaGlobal_Enchant:enchantClose()
  else
    if Panel_Window_Socket:GetShow() then
      Socket_WindowClose()
      ToClient_BlackspiritEnchantClose()
    end
  end
  Panel_Join_Close()
  FGlobal_LifeRanking_Close()
  local count = skillWindow_awakeningSkillCount()
  local posY = 0
  for index = 0, self._buttonCount - 1 do
    if index < count then
      local skillWrapper = skillWindow_awakeningSkillAt(index)
      if skillWrapper ~= nil then
        posY = ((self._uiButtonAwkList)[index]):SetData(skillWrapper, posY, _isAwakenRest)
        ;
        ((self._uiButtonAwkList)[index]):SetShow(true)
        if _isAwakenRest == true or _isAwakenRest == false and _isReAwaken == true then
          local activeSkillSS = skillWrapper:getActiveSkillStatus()
          if activeSkillSS ~= nil then
            local awakeningDataCount = activeSkillSS:getSkillAwakenInfoCount()
            local awakeInfo = ""
            local realCount = 0
            for idx = 0, awakeningDataCount - 1 do
              local skillInfo = activeSkillSS:getSkillAwakenInfo(idx)
              if skillInfo ~= "" then
                if awakeInfo == "" then
                  awakeInfo = skillInfo
                else
                  awakeInfo = awakeInfo .. "\n" .. skillInfo
                end
                realCount = realCount + 1
              end
            end
            ;
            (((self._uiButtonAwkList)[index])._AwakenLv):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SKILLAWAKEN_AWAKENEFFECT", "awakeInfo", awakeInfo))
          end
        else
          do
            do
              do
                ;
                (((self._uiButtonAwkList)[index])._AwakenLv):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLAWAKEN_POSSIBLE"))
                ;
                ((self._uiButtonAwkList)[index]):SetShow(false)
                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
  if _isAwakenRest == false then
    buttonAwakenList:SetCheck(true)
    buttonAwakenClearList:SetCheck(false)
  else
    buttonAwakenList:SetCheck(false)
    buttonAwakenClearList:SetCheck(true)
  end
  _content_SkillList:SetSize(_content_SkillList:GetSizeX(), posY)
  ;
  (UIScroll.SetButtonSize)(_sld_content_SkillList, _frame_SkillList:GetSizeY(), posY)
  _sld_content_SkillList:SetControlPos(0)
  Panel_SkillAwaken:SetShow(true, true)
  _frame_SkillList:UpdateContentScroll()
  ;
  (_frame_SkillList:GetVScroll()):SetControlTop()
  _frame_SkillList:UpdateContentPos()
  _content_SkillList:SetIgnore(true)
  ;
  (ui._circle_progress):SetCurrentControlPos(0)
  ;
  (ui._circle_progress):SetProgressRate(0)
  isStartAwaken = false
  isCompleteCircular = false
  currentRate = 0
  _endCircular = 100
  currentTimer = 0
  skillIndex = -1
  if count == 0 then
    textNoSkills:SetShow(true)
  else
    textNoSkills:SetShow(false)
  end
end

SkillAwaken_Close = function()
  -- function num : 0_13
  Panel_SkillAwaken:SetShow(false, false)
end

FromClient_SuccessSkillAwaken = function(skillNo, level)
  -- function num : 0_14 , upvalues : result
  if ToClient_IsContentsGroupOpen("203") then
    return 
  end
  Panel_SkillAwaken_ResultOption:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_SkillAwaken_ResultOption:SetPosX(0)
  Panel_SkillAwaken_ResultOption:SetPosY(20)
  local skillStatic = (getSkillStaticStatus(skillNo, 1))
  local activeSkillSS = nil
  if skillStatic:isActiveSkillHas() then
    activeSkillSS = getActiveSkillStatus(skillStatic)
    if activeSkillSS == nil then
      Panel_SkillAwaken_ResultOption:SetShow(false)
    else
      local awakeInfo = ""
      local awakeningDataCount = activeSkillSS:getSkillAwakenInfoCount() - 1
      for index = 0, awakeningDataCount do
        local skillInfo = activeSkillSS:getSkillAwakenInfo(index)
        if skillInfo ~= "" then
          awakeInfo = awakeInfo .. "\n" .. skillInfo
        end
      end
      Panel_SkillAwaken_ResultOption:SetShow(true)
      Panel_SkillAwaken_ResultOption:SetAlpha(0)
      ;
      (UIAni.AlphaAnimation)(1, Panel_SkillAwaken_ResultOption, 0, 0.3)
      ;
      (result._awakenOption):SetText("<PAColor0xffdadada>" .. tostring(awakeInfo) .. "<PAOldColor>")
      ;
      (result._awakenResult_BG):SetPosX(0)
      ;
      (result._awakenTitle):ComputePos()
      ;
      (result._awakenOption):ComputePos()
      acquireSizeY = (result._awakenTitle):GetSizeY() + (result._awakenOption):GetTextSizeY() + 85
      ;
      (result._awakenResult_BG):SetSize(getScreenSizeX(), acquireSizeY)
    end
  end
  do
    ReqeustDialog_retryTalk()
  end
end

EventShowAwakenSkill = function(isRewaken)
  -- function num : 0_15 , upvalues : _isAwakenRest, ui, _isReAwaken, AwakenMng, buttonAwakenClearList, buttonAwakenList
  if ToClient_IsContentsGroupOpen("203") then
    return 
  end
  _isAwakenRest = false
  ;
  (ui._circle_progress):SetProgressRate(0)
  ;
  (ui._circleEff):SetShow(true)
  ;
  (ui._circleEff):ResetVertexAni()
  ;
  (ui._circleEff):SetVertexAniRun("Ani_Color_Off", true)
  ;
  (ui._circleEff):SetVertexAniRun("Ani_Rotate_New", true)
  ;
  (ui._circle_Icon):EraseAllEffect()
  ;
  (ui._circle_Icon):ChangeTextureInfoName("")
  ;
  (ui._circle_progress):EraseAllEffect()
  ;
  (ui._circle_IconOff):SetShow(true)
  ;
  (ui._circle_IconOn):SetShow(false)
  ;
  (ui._btn_doAwaken):EraseAllEffect()
  ;
  (ui._btn_doAwaken):SetAlpha(0.85)
  ;
  (ui._btn_doAwaken):SetFontAlpha(0.85)
  ;
  (ui._btn_doAwaken):SetIgnore(true)
  ;
  (ui._btn_doAwaken):SetMonoTone(true)
  _isReAwaken = isRewaken
  AwakenMng:SkillAwaken_Show()
  local _AwakenTitle = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLAWAKEN_TITLE")
  if isRewaken == true then
    _AwakenTitle = PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREAWAKEN_TITLE")
  end
  ;
  (ui._txt_Title):SetText(_AwakenTitle)
  ;
  (ui._btn_doAwaken):SetText(_AwakenTitle)
  if ToClient_CheckAwakenResetItem() then
    buttonAwakenClearList:SetIgnore(false)
    buttonAwakenClearList:SetFontColor(4294962304)
  else
    buttonAwakenClearList:SetIgnore(true)
    buttonAwakenClearList:SetFontColor(4287137928)
  end
  ;
  (ui._btn_SwapWin):SetShow(true)
  if isRewaken then
    buttonAwakenList:SetShow(false)
    buttonAwakenClearList:SetShow(false)
    ;
    (ui._txt_SkillAwakenDesc):SetShow(true)
    ;
    (ui._txt_canAwaken):SetShow(true)
    ;
    (ui._btn_SwapWin):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLAWAKEN_TITLE"))
  else
    buttonAwakenList:SetShow(true)
    buttonAwakenClearList:SetShow(true)
    ;
    (ui._txt_SkillAwakenDesc):SetShow(false)
    ;
    (ui._txt_canAwaken):SetShow(false)
    ;
    (ui._btn_SwapWin):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SKILLREAWAKEN_TITLE"))
    if ((getSelfPlayer()):get()):getLevel() < 50 or ToClient_GetAwakenSkillCount() == 0 then
      (ui._btn_SwapWin):SetShow(false)
    end
  end
end

HandleClicked_SwapWindow = function()
  -- function num : 0_16 , upvalues : _isReAwaken
  if _isReAwaken then
    ToClient_UpdateAwakenList()
  else
    ToClient_UpdateAwakenClearList()
  end
  ToClient_SetShowAwakenSkill(not _isReAwaken)
end

reAwaken_Func = function()
  -- function num : 0_17 , upvalues : result
  Panel_SkillAwaken_ResultOption:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_SkillAwaken_ResultOption:SetPosX(0)
  Panel_SkillAwaken_ResultOption:SetPosY(20)
  local isAwakeningData = false
  do
    local activeSkillSS = nil
    if skillWrapper:isActiveSkillHas() then
      activeSkillSS = getActiveSkillStatus(skillWrapper)
      if activeSkillSS == nil then
        Panel_SkillAwaken_ResultOption:SetShow(false)
      else
        local awakeInfo = ""
        local awakeningDataCount = activeSkillSS:getSkillAwakenInfoCount()
        local realCount = 0
        for idx = 0, awakeningDataCount do
          local skillInfo = activeSkillSS:getSkillAwakenInfo(idx)
          if skillInfo ~= "" then
            awakeInfo = awakeInfo .. "\n" .. skillInfo
            realCount = realCount + 1
          end
        end
        Panel_SkillAwaken_ResultOption:SetShow(true)
        Panel_SkillAwaken_ResultOption:SetAlpha(0)
        ;
        (UIAni.AlphaAnimation)(1, Panel_SkillAwaken_ResultOption, 0, 0.3)
        ;
        (result._awakenOption):SetText("<PAColor0xffdadada>" .. awakeInfo .. "<PAOldColor>")
        ;
        (result._awakenResult_BG):SetPosX(0)
        ;
        (result._awakenTitle):ComputePos()
        ;
        (result._awakenOption):ComputePos()
        acquireSizeY = (result._awakenTitle):GetSizeY() + (result._awakenOption):GetTextSizeY() + 85
        ;
        (result._awakenResult_BG):SetSize(getScreenSizeX(), acquireSizeY)
        isAwakeningData = realCount > 0
      end
    else
      Panel_SkillAwaken_ResultOption:SetShow(false)
    end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

HandleClicked_ButtonAwakenList = function()
  -- function num : 0_18 , upvalues : _isAwakenRest, AwakenMng
  _isAwakenRest = false
  ToClient_UpdateAwakenList()
  AwakenMng:SkillAwaken_Show()
end

HandleClicked_ButtonAwakenClearList = function()
  -- function num : 0_19 , upvalues : _isAwakenRest, AwakenMng
  _isAwakenRest = true
  ToClient_UpdateAwakenClearList()
  FGlobal_SetUrl_Tooltip_SkillForLearning()
  AwakenMng:SkillAwaken_Show()
end

AwakenMng:initialize()
registerEvent("EventShowAwakenSkill", "EventShowAwakenSkill")
registerEvent("FromClient_SuccessSkillAwaken", "FromClient_SuccessSkillAwaken")
Panel_SkillAwaken:RegisterUpdateFunc("Update_CircularProgress")

