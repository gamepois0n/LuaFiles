-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\journal\panel_journalinfo.luac 

-- params : ...
-- function num : 0
Panel_JournalInfo:SetShow(false)
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local uiBackGround = (UI.getChildControl)(Panel_JournalInfo, "Static_JournalInfo_BG")
local needJournalText = (UI.getChildControl)(Panel_JournalInfo, "StaticText_NeedJournal")
local _journalInfoList = (UI.getChildControl)(Panel_JournalInfo, "StaticText_JournalInfo_List")
local _scroll = (UI.getChildControl)(Panel_JournalInfo, "VerticalScroll")
local _scrollCtrlBtn = (UI.getChildControl)(_scroll, "VerticalScroll_CtrlButton")
local uiText = {}
local scrollIndex = 0
local Panel_JournalInfo_Value_elementCount = 0
needJournalText:SetTextMode(UI_TM.eTextMode_AutoWrap)
needJournalText:SetAutoResize(true)
needJournalText:SetFontColor((Defines.Color).C_FF96D4FC)
local constSizeX = Panel_JournalInfo:GetSizeX()
local constSizeY = Panel_JournalInfo:GetSizeY()
local _listPosY = _journalInfoList:GetPosY()
local _scrollSize = _journalInfoList:GetSizeY()
local uiBG_PosY = uiBackGround:GetPosY()
local _scroll_PosY = _scroll:GetPosY()
local _needJournalTextSize = needJournalText:GetSizeY()
local _needJournalTextGap = 19
local _journalInfoMaxCount = 9
Panel_JournalInfo:RegisterShowEventFunc(true, "Journal_ShowAni()")
Panel_JournalInfo:RegisterShowEventFunc(false, "Journal_HideAni()")
Journal_ShowAni = function()
  -- function num : 0_0
end

Journal_HideAni = function()
  -- function num : 0_1
end

FromClient_JournalInfo_UpdateText = function()
  -- function num : 0_2 , upvalues : Panel_JournalInfo_Value_elementCount, _journalInfoMaxCount, scrollIndex, uiText, _listPosY, _needJournalTextGap, _scroll
  Panel_JournalInfo_Value_elementCount = ToClient_GetJournalListCount(2014, 11, 0)
  for index = 0, _journalInfoMaxCount - 1 do
    local _journalInfo = ToClient_GetJournal(2014, 11, 0, index + scrollIndex)
    if _journalInfo == nil then
      (uiText[index]):SetShow(false)
    else
      ;
      (uiText[index]):SetText(_journalInfo:getJournalYear() .. "/" .. _journalInfo:getJournalMonth() .. "/" .. _journalInfo:getJournalDay() .. " " .. _journalInfo:getJournalHour() .. ":" .. _journalInfo:getJournalMinute() .. ":" .. _journalInfo:getJournalSecond() .. " " .. _journalInfo:getName())
      ;
      (uiText[index]):SetPosY(_listPosY + _needJournalTextGap * index)
      ;
      (uiText[index]):SetShow(true)
    end
  end
  if _journalInfoMaxCount < Panel_JournalInfo_Value_elementCount then
    _scroll:SetShow(true)
  else
    _scroll:SetShow(false)
  end
  ;
  (UIScroll.SetButtonSize)(_scroll, _journalInfoMaxCount, Panel_JournalInfo_Value_elementCount)
end

uiText_RePosY = function(count, isReposition)
  -- function num : 0_3 , upvalues : uiText, uiBG_PosY, _needJournalTextGap
  if isReposition == true then
    for i = 0, count - 1 do
      (uiText[i]):SetPosY(uiBG_PosY + 6 + _needJournalTextGap + _needJournalTextGap * i)
    end
  else
    do
      for i = 0, count - 1 do
        (uiText[i]):SetPosY(uiBG_PosY + 6 + _needJournalTextGap * i)
      end
    end
  end
end

JournalInfo_Scroll = function(isUp)
  -- function num : 0_4 , upvalues : scrollIndex, _scroll, _journalInfoMaxCount, Panel_JournalInfo_Value_elementCount
  scrollIndex = (UIScroll.ScrollEvent)(_scroll, isUp, _journalInfoMaxCount, Panel_JournalInfo_Value_elementCount, scrollIndex, 1)
  FromClient_JournalInfo_UpdateText()
end

Panel_JournalInfo_Show = function()
  -- function num : 0_5
  Panel_JournalInfo:SetShow(true, true)
end

Panel_JournalInfo_Hide = function()
  -- function num : 0_6 , upvalues : scrollIndex, _scrollCtrlBtn
  Panel_JournalInfo:SetShow(false, false)
  scrollIndex = 0
  _scrollCtrlBtn:SetPosY(0)
end

JournalInfo_Init = function()
  -- function num : 0_7 , upvalues : _journalInfoMaxCount, uiText, UI_PUCT, _journalInfoList, _scroll, uiBackGround
  for index = 0, _journalInfoMaxCount - 1 do
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

    uiText[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_JournalInfo, "StaticText_journalInfoList_" .. index)
    CopyBaseProperty(_journalInfoList, uiText[index])
  end
  Panel_JournalInfo:RemoveControl(_journalInfoList)
  _journalInfoList = nil
  ;
  (UIScroll.InputEvent)(_scroll, "JournalInfo_Scroll")
  uiBackGround:addInputEvent("Mouse_UpScroll", "JournalInfo_Scroll( true )")
  uiBackGround:addInputEvent("Mouse_DownScroll", "JournalInfo_Scroll( false )")
end

FGlobal_SetShowJournalWindow = function(isShow)
  -- function num : 0_8
  if isShow then
    ToClient_RequestJournalList(2014, 11, 0)
    Panel_JournalInfo_Show()
  else
    Panel_JournalInfo_Hide()
  end
end

JournalInfo_Init()
registerEvent("FromClient_JournalInfo_UpdateText", "FromClient_JournalInfo_UpdateText")

