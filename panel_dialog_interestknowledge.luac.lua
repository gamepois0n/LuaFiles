-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_dialog_interestknowledge.luac 

-- params : ...
-- function num : 0
Panel_Interest_Knowledge:SetShow(false, false)
Panel_Interest_Knowledge:RegisterShowEventFunc(true, "InterestKnowledgeShowAni()")
Panel_Interest_Knowledge:RegisterShowEventFunc(false, "InterestKnowledgeHideAni()")
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local uiBackGround = (UI.getChildControl)(Panel_Interest_Knowledge, "Static_Interest_KnowledgeBG")
local needKnowledgeText = (UI.getChildControl)(Panel_Interest_Knowledge, "StaticText_Need_Knowledge")
local _knowledgeList = (UI.getChildControl)(Panel_Interest_Knowledge, "StaticText_Knowledge_List")
local _scroll = (UI.getChildControl)(Panel_Interest_Knowledge, "VerticalScroll")
local _scrollCtrlBtn = (UI.getChildControl)(_scroll, "VerticalScroll_CtrlButton")
local uiText = {}
local scrollIndex = 0
local Panel_Interest_Knowledge_Value_elementCount = 0
needKnowledgeText:SetTextMode(UI_TM.eTextMode_AutoWrap)
needKnowledgeText:SetAutoResize(true)
needKnowledgeText:SetFontColor((Defines.Color).C_FF96D4FC)
InterestKnowledgeShowAni = function()
  -- function num : 0_0
end

InterestKnowledgeHideAni = function()
  -- function num : 0_1
end

Dialog_InterestKnowledgeUpdate = function()
  -- function num : 0_2
  local talker = dialog_getTalker()
  if talker == nil then
    return 
  end
  local actorKeyRaw = talker:getActorKey()
  local npcActorProxyWrapper = getNpcActor(actorKeyRaw)
  local knowledge = ((getSelfPlayer()):get()):getMentalKnowledge()
  local mentalObject = knowledge:getThemeByKeyRaw(npcActorProxyWrapper:getNpcThemeKey())
  if mentalObject == nil then
    Panel_Interest_Knowledge_Hide()
    return 
  end
  InterestKnowledge_SetText(mentalObject, npcActorProxyWrapper)
end

local constSizeX = Panel_Interest_Knowledge:GetSizeX()
local constSizeY = Panel_Interest_Knowledge:GetSizeY()
local _listPosY = _knowledgeList:GetPosY()
local _scrollSize = _knowledgeList:GetSizeY()
local uiBG_PosY = uiBackGround:GetPosY()
local _scroll_PosY = _scroll:GetPosY()
local _needKnowledgeTextSize = needKnowledgeText:GetSizeY()
local _needKnowledgeTextGap = 19
local _knowledgeMaxCount = 9
InterestKnowledge_SetText = function(theme, npcActorProxyWrapper)
  -- function num : 0_3 , upvalues : _knowledgeMaxCount, scrollIndex, uiText, _listPosY, _needKnowledgeTextGap, needKnowledgeText, Panel_Interest_Knowledge_Value_elementCount, _needKnowledgeTextSize, constSizeX, constSizeY, uiBackGround, uiBG_PosY, _scroll, _scroll_PosY
  local _needKnowledge = npcActorProxyWrapper:getNpcTheme()
  local _needCount = npcActorProxyWrapper:getNeedCount()
  local _currCount = getKnowledgeCountMatchTheme(npcActorProxyWrapper:getNpcThemeKey())
  local _currentKnowledge = ""
  Panel_Interest_Knowledge:deleteConsoleUIGroup(0)
  local group_0 = Panel_Interest_Knowledge:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_0:setConsoleKeyEventForLUA("InterestKnowledge_UpScroll", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_UP)
  group_0:setConsoleKeyEventForLUA("InterestKnowledge_DownScroll", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_DOWN)
  for index = 0, _knowledgeMaxCount - 1 do
    local _childCard = theme:getChildCardByIndex(index + scrollIndex)
    if _childCard == nil then
      (uiText[index]):SetShow(false)
    else
      ;
      (uiText[index]):SetText(_childCard:getName())
      ;
      (uiText[index]):SetPosY(_listPosY + _needKnowledgeTextGap * index)
      ;
      (uiText[index]):SetShow(true)
      group_0:addControl(0, index, 1, _knowledgeMaxCount, uiText[index])
    end
  end
  needKnowledgeText:SetText(_needKnowledge .. " ( " .. _currCount .. "/" .. theme:getChildCardCount() .. " ) ")
  Panel_Interest_Knowledge_Show()
  Panel_Interest_Knowledge_Value_elementCount = theme:getChildCardCount()
  if _needKnowledgeTextSize < needKnowledgeText:GetSizeY() then
    Panel_Interest_Knowledge:SetSize(constSizeX, constSizeY + _needKnowledgeTextGap)
    uiBackGround:SetPosY(uiBG_PosY + _needKnowledgeTextGap)
    _scroll:SetPosY(_scroll_PosY + _needKnowledgeTextGap)
    uiText_RePosY(_knowledgeMaxCount, true)
  else
    Panel_Interest_Knowledge:SetSize(constSizeX, constSizeY)
    uiBackGround:SetPosY(uiBG_PosY)
    _scroll:SetPosY(_scroll_PosY)
    uiText_RePosY(_knowledgeMaxCount, false)
  end
  if _knowledgeMaxCount < Panel_Interest_Knowledge_Value_elementCount then
    _scroll:SetShow(true)
  else
    _scroll:SetShow(false)
  end
  ;
  (UIScroll.SetButtonSize)(_scroll, _knowledgeMaxCount, Panel_Interest_Knowledge_Value_elementCount)
end

uiText_RePosY = function(count, isReposition)
  -- function num : 0_4 , upvalues : uiText, uiBG_PosY, _needKnowledgeTextGap
  if isReposition == true then
    for i = 0, count - 1 do
      (uiText[i]):SetPosY(uiBG_PosY + 6 + _needKnowledgeTextGap + _needKnowledgeTextGap * i)
    end
  else
    do
      for i = 0, count - 1 do
        (uiText[i]):SetPosY(uiBG_PosY + 6 + _needKnowledgeTextGap * i)
      end
    end
  end
end

InterestKnowledge_UpScroll = function()
  -- function num : 0_5
  InterestKnowledge_Scroll(true)
end

InterestKnowledge_DownScroll = function()
  -- function num : 0_6
  InterestKnowledge_Scroll(false)
end

InterestKnowledge_Scroll = function(isUp)
  -- function num : 0_7 , upvalues : scrollIndex, _scroll, _knowledgeMaxCount, Panel_Interest_Knowledge_Value_elementCount
  scrollIndex = (UIScroll.ScrollEvent)(_scroll, isUp, _knowledgeMaxCount, Panel_Interest_Knowledge_Value_elementCount, scrollIndex, 1)
  Dialog_InterestKnowledgeUpdate()
end

Panel_Interest_Knowledge_Show = function()
  -- function num : 0_8
  Panel_Interest_Knowledge:SetShow(true, true)
end

Panel_Interest_Knowledge_Hide = function()
  -- function num : 0_9 , upvalues : scrollIndex, _scrollCtrlBtn
  Panel_Interest_Knowledge:SetShow(false, false)
  scrollIndex = 0
  _scrollCtrlBtn:SetPosY(0)
end

InterestKnowledge_onScreenResize = function()
  -- function num : 0_10
  local scrY = getScreenSizeY()
  Panel_Interest_Knowledge:SetPosY(scrY - (Panel_Npc_Dialog:GetSizeY() + Panel_Interest_Knowledge:GetSizeY() + 50))
end

InterestKnowledge_Init = function()
  -- function num : 0_11 , upvalues : _knowledgeMaxCount, uiText, UI_PUCT, _knowledgeList, _scroll, uiBackGround
  for index = 0, _knowledgeMaxCount - 1 do
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

    uiText[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, Panel_Interest_Knowledge, "StaticText_InterestKnowledgeList_" .. index)
    CopyBaseProperty(_knowledgeList, uiText[index])
  end
  Panel_Interest_Knowledge:RemoveControl(_knowledgeList)
  _knowledgeList = nil
  ;
  (UIScroll.InputEvent)(_scroll, "InterestKnowledge_Scroll")
  uiBackGround:addInputEvent("Mouse_UpScroll", "InterestKnowledge_Scroll( true )")
  uiBackGround:addInputEvent("Mouse_DownScroll", "InterestKnowledge_Scroll( false )")
end

InterestKnowledge_Init()
InterestKnowledge_onScreenResize()
local _buttonQuestion = (UI.getChildControl)(Panel_Interest_Knowledge, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelImportantKnowledge\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelImportantKnowledge\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelImportantKnowledge\", \"false\")")

