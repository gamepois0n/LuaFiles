-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dance\panel_window_dance.luac 

-- params : ...
-- function num : 0
Panel_Window_Dance:SetShow(false)
Panel_Window_Dance:RegisterShowEventFunc(true, "Dance_InfoShowAni()")
Panel_Window_Dance:RegisterShowEventFunc(false, "Dance_InfoHideAni()")
Panel_Window_Dance:SetDragAll(true)
local _slide = (UI.getChildControl)(Panel_Window_Dance, "VerticalScroll")
local _slideBtn = (UI.getChildControl)(_slide, "VerticalScroll_CtrlButton")
local nSelectDanceList_VisibleMaxCount = 7
local nSelectDance_MaxCount = 0
local listRenderer_UIData = {}
local slideIndex = 0
local tempDanceNameInfo = {"DANCE_T00_Step00_Ing_00", "DANCE_T00_Step00_Ing_01", "DANCE_T00_Step00_Ing_01_M", "DANCE_T00_Step00_Ing_02", "DANCE_T00_Step00_Ing_02_M", "DANCE_T00_Step00_Ing_03", "DANCE_T00_Step00_Ing_03_M", "DANCE_T00_Step00_Ing_04_L", "DANCE_T00_Step00_Ing_04_R", "DANCE_T00_Step00_Ing_05", "DANCE_T00_Step00_Ing_05_M", "DANCE_T00_Step00_Ing_06_L", "DANCE_T00_Step00_Ing_06_R", "DANCE_T00_Step00_Start_00", "DANCE_T00_Step01_End_01_M", "DANCE_T00_Step01_End_02", "DANCE_T00_Step01_Ing_00", "DANCE_T00_Step01_Ing_01", "DANCE_T00_Step01_Ing_01_M", "DANCE_T00_Step01_Ing_02", "DANCE_T00_Step01_Ing_02_M", "DANCE_T00_Step01_Ing_03", "DANCE_T00_Step01_Ing_03_M", "DANCE_T00_Step01_Ing_04", "DANCE_T00_Step01_Ing_04_M", "DANCE_T00_Step01_Ing_05", "DANCE_T00_Step01_Ing_05_M", "DANCE_T00_Step01_Ing_06_L", "DANCE_T00_Step01_Ing_06_R", "DANCE_T00_Step01_Ing_07_L", "DANCE_T00_Step01_Ing_07_R", "DANCE_T00_Step01_Ing_08_L", "DANCE_T00_Step01_Ing_08_R", "DANCE_T00_Step01_Ing_09", "DANCE_T00_Step01_Ing_09_M", "DANCE_T00_Step01_Ing_10", "DANCE_T00_Step01_Ing_10_M", "DANCE_T00_Step01_Ing_11", "DANCE_T00_Step01_Ing_11_M", "DANCE_T00_Step01_Ing_12_L", "DANCE_T00_Step01_Ing_12_R", "DANCE_T00_Step01_Ing_13_L", "DANCE_T00_Step01_Ing_13_R", "DANCE_T00_Step01_Ing_14", "DANCE_T00_Step01_Ing_14_M"}
danceInfo_Initialize = function()
  -- function num : 0_0
  danceInfo_Basic_Initialize()
  danceInfo_List_Initialize()
end

danceInfo_Basic_Initialize = function()
  -- function num : 0_1
  local comboBoxUI = (UI.getChildControl)(Panel_Window_Dance, "Combobox_Sort")
  comboBoxUI:addInputEvent("Mouse_LUp", "danceInfo_Combo_show()")
  ;
  (comboBoxUI:GetListControl()):addInputEvent("Mouse_LUp", "Ev_danceInfo_Combo_Select()")
  local btnAdd = (UI.getChildControl)(Panel_Window_Dance, "BtnAdd")
  btnAdd:addInputEvent("Mouse_LUp", "Ev_danceInfo_DanceAdd()")
  btnAdd = (UI.getChildControl)(Panel_Window_Dance, "BtnPlay")
  btnAdd:addInputEvent("Mouse_LUp", "Ev_danceInfo_DancePlay()")
  local buttonClose = (UI.getChildControl)(Panel_Window_Dance, "Button_Win_Close")
  buttonClose:addInputEvent("Mouse_LUp", "danceInfo_HandleClicked_Close()")
end

Ev_danceInfo_DanceAdd = function()
  -- function num : 0_2 , upvalues : tempDanceNameInfo
  local comboBoxUI = (UI.getChildControl)(Panel_Window_Dance, "Combobox_Sort")
  local nSelIdx = comboBoxUI:GetSelectIndex()
  local editBox = (UI.getChildControl)(Panel_Window_Dance, "EditSearchText")
  local str = tonumber(editBox:GetText())
  if nSelIdx ~= -1 and str ~= nil then
    ToClient_Dance_AddUnit(tempDanceNameInfo[nSelIdx + 1], str)
    danceInfo_UpdateList()
    comboBoxUI:SetText("-")
    editBox:SetEditText("")
  end
end

Ev_danceInfo_DancePlay = function()
  -- function num : 0_3
  ToClient_Dance_Play()
end

Ev_danceInfo_DanceDelete = function(i)
  -- function num : 0_4 , upvalues : slideIndex
  ToClient_Dance_DeleteUnit(slideIndex + i)
  danceInfo_UpdateList()
end

danceInfo_List_Initialize = function()
  -- function num : 0_5 , upvalues : _slide, nSelectDanceList_VisibleMaxCount
  (UIScroll.InputEvent)(_slide, "danceInfo_List_Scroll")
  local _frameBG = (UI.getChildControl)(Panel_Window_Dance, "Static_ListFrame_BG")
  _frameBG:addInputEvent("Mouse_UpScroll", "danceInfo_List_Scroll( true )")
  _frameBG:addInputEvent("Mouse_DownScroll", "danceInfo_List_Scroll( false )")
  for i = 0, nSelectDanceList_VisibleMaxCount - 1 do
    local tmpUi = (UI.getChildControl)(Panel_Window_Dance, "Button_Delete_" .. tostring(i))
    tmpUi:addInputEvent("Mouse_LUp", "Ev_danceInfo_DanceDelete(" .. i .. ")")
  end
  danceInfo_UpdateList()
end

danceInfo_List_Scroll = function(isUp)
  -- function num : 0_6 , upvalues : slideIndex, _slide, nSelectDanceList_VisibleMaxCount
  slideIndex = (UIScroll.ScrollEvent)(_slide, isUp, nSelectDanceList_VisibleMaxCount, ToClient_Dance_GetSelectUnitSize(), slideIndex, 1)
  danceInfo_UpdateList()
end

danceInfo_UpdateList = function()
  -- function num : 0_7 , upvalues : nSelectDanceList_VisibleMaxCount, _slide, slideIndex
  local nDanceSize = ToClient_Dance_GetSelectUnitSize()
  local nVisibleRendereCount = nDanceSize
  if nSelectDanceList_VisibleMaxCount < nDanceSize then
    nVisibleRendereCount = nSelectDanceList_VisibleMaxCount
  end
  if nVisibleRendereCount < nSelectDanceList_VisibleMaxCount then
    _slide:SetShow(false)
  else
    _slide:SetShow(true)
  end
  for i = 0, nVisibleRendereCount - 1 do
    danceInfo_SetRendererVisible(i, true)
    danceInfo_SetInfo(i, ToClient_Dance_GetSelectUnitName(slideIndex + i), ToClient_Dance_GetSelectUnitSpeed(slideIndex + i))
  end
  for i = nVisibleRendereCount, nSelectDanceList_VisibleMaxCount - 1 do
    danceInfo_SetRendererVisible(i, false)
  end
end

danceInfo_SetRendererVisible = function(nIndex, bShow)
  -- function num : 0_8
  local tmpUi = nil
  tmpUi = (UI.getChildControl)(Panel_Window_Dance, "Static_ListRenderer_BG_" .. tostring(nIndex))
  tmpUi:SetShow(bShow)
  tmpUi = (UI.getChildControl)(Panel_Window_Dance, "Static_ListRenderer_YellowBG_" .. tostring(nIndex))
  tmpUi:SetShow(bShow)
  tmpUi = (UI.getChildControl)(Panel_Window_Dance, "Static_Name_Label_" .. tostring(nIndex))
  tmpUi:SetShow(bShow)
  tmpUi = (UI.getChildControl)(Panel_Window_Dance, "Static_Speed_Label_" .. tostring(nIndex))
  tmpUi:SetShow(bShow)
  tmpUi = (UI.getChildControl)(Panel_Window_Dance, "Button_Delete_" .. tostring(nIndex))
  tmpUi:SetShow(bShow)
end

danceInfo_SetInfo = function(nIndex, strName, strSpeed)
  -- function num : 0_9
  local tmpUi = nil
  tmpUi = (UI.getChildControl)(Panel_Window_Dance, "Static_Name_Label_" .. tostring(nIndex))
  tmpUi:SetText("Name      " .. strName)
  tmpUi = (UI.getChildControl)(Panel_Window_Dance, "Static_Speed_Label_" .. tostring(nIndex))
  tmpUi:SetText("Speed     " .. strSpeed)
end

danceInfo_Combo_show = function()
  -- function num : 0_10 , upvalues : tempDanceNameInfo
  local comboBoxUIListSize = 4
  local comboBoxUI = (UI.getChildControl)(Panel_Window_Dance, "Combobox_Sort")
  comboBoxUI:DeleteAllItem(0)
  local tbAllDance = tempDanceNameInfo
  local nSize = (table.getn)(tbAllDance)
  for i = 1, nSize do
    local tbUnit = tbAllDance[i]
    if tbUnit == nil then
      _PA_LOG("규보", "   danceInfo_Initialize.. nil " .. tostring(i))
    else
      comboBoxUI:AddItem(tbUnit)
    end
  end
  ;
  (comboBoxUI:GetListControl()):SetPosX(0)
  ;
  (comboBoxUI:GetListControl()):SetSize((comboBoxUI:GetListControl()):GetSizeX(), comboBoxUIListSize * 20)
  comboBoxUI:ToggleListbox()
end

Ev_danceInfo_Combo_Select = function()
  -- function num : 0_11 , upvalues : tempDanceNameInfo
  local comboBoxUI = (UI.getChildControl)(Panel_Window_Dance, "Combobox_Sort")
  local selectIndex = comboBoxUI:GetSelectIndex()
  comboBoxUI:SetText(tempDanceNameInfo[selectIndex + 1])
  comboBoxUI:ToggleListbox()
end

danceInfo_HandleClicked_Close = function()
  -- function num : 0_12
  if Panel_Window_Dance:IsShow() then
    Panel_Window_Dance:SetShow(false)
  end
end

danceInfo_OpenWindow = function()
  -- function num : 0_13
  danceInfo_UpdateList()
  Panel_Window_Dance:SetShow(true)
end

danceInfo_ShowAni = function()
  -- function num : 0_14
end

danceInfo_HideAni = function()
  -- function num : 0_15
end

danceInfo_Initialize()

