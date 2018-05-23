-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\chatting\panel_chatting_filter.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_Chatting_Filter:RegisterShowEventFunc(true, "ChattingFilterList_ShowAni()")
Panel_Chatting_Filter:RegisterShowEventFunc(false, "ChattingFilterList_HideAni()")
Panel_Chatting_Filter:SetShow(false, false)
Panel_Chatting_Filter:ActiveMouseEventEffect(true)
Panel_Chatting_Filter:setGlassBackground(true)
local ChattingFilter = {
ui = {title = (UI.getChildControl)(Panel_Chatting_Filter, "StaticText_Title"), btn_Close = (UI.getChildControl)(Panel_Chatting_Filter, "Button_Win_Close"), bg = (UI.getChildControl)(Panel_Chatting_Filter, "Static_BG"), edit_Filter = (UI.getChildControl)(Panel_Chatting_Filter, "Edit_Filter"), btn_Filter = (UI.getChildControl)(Panel_Chatting_Filter, "Button_Yes"), btn_Reset = (UI.getChildControl)(Panel_Chatting_Filter, "Button_Reset"), desc_BG = (UI.getChildControl)(Panel_Chatting_Filter, "Static_DescBG"), desc_Txt = (UI.getChildControl)(Panel_Chatting_Filter, "StaticText_Desc"), temp_FilterBG = (UI.getChildControl)(Panel_Chatting_Filter, "Static_SlotBG"), temp_Filter_ItemName = (UI.getChildControl)(Panel_Chatting_Filter, "StaticText_FilterName"), temp_Button_Delete = (UI.getChildControl)(Panel_Chatting_Filter, "Button_Delete"), scroll = (UI.getChildControl)(Panel_Chatting_Filter, "Scroll_List")}
, 
config = {maxFilterCount = 9, totalFilterCount = 0, startIndex = 0}
, 
uiPool = {}
}
local _buttonQuestion = (UI.getChildControl)(Panel_Chatting_Filter, "Button_Question")
_buttonQuestion:SetShow(false)
ChattingFilterList_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_Chatting_Filter:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.12)
  aniInfo1.AxisX = Panel_Chatting_Filter:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Chatting_Filter:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Chatting_Filter:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.12)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Chatting_Filter:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Chatting_Filter:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

ChattingFilterList_HideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  audioPostEvent_SystemUi(1, 1)
  local aniInfo1 = Panel_Chatting_Filter:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

ChattingFilter.Init = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  for slotIdx = 0, (self.config).maxFilterCount - 1 do
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R5 in 'UnsetPending'

    (self.uiPool)[slotIdx] = {}
    local slot = (self.uiPool)[slotIdx]
    slot.FilterNameBG = (UI.createAndCopyBasePropertyControl)(Panel_Chatting_Filter, "Static_SlotBG", (self.ui).bg, "ChattingFilter_BG_" .. slotIdx)
    slot.FilterName = (UI.createAndCopyBasePropertyControl)(Panel_Chatting_Filter, "StaticText_FilterName", slot.FilterNameBG, "ChattingFilter_FilterItemName_" .. slotIdx)
    slot.Delete = (UI.createAndCopyBasePropertyControl)(Panel_Chatting_Filter, "Button_Delete", slot.FilterNameBG, "ChattingFilter_FilterDeleteBtn_" .. slotIdx)
    ;
    (slot.FilterNameBG):SetPosX(5)
    ;
    (slot.FilterNameBG):SetPosY(5 + ((slot.FilterNameBG):GetSizeY() + 5) * slotIdx)
    ;
    (slot.FilterName):SetPosX(10)
    ;
    (slot.FilterName):SetPosY(7)
    ;
    (slot.Delete):SetPosX(300)
    ;
    (slot.Delete):SetPosY(5)
    ;
    (slot.FilterNameBG):SetShow(false)
    ;
    (slot.FilterNameBG):addInputEvent("Mouse_UpScroll", "Scroll_ChattingFilterList( true )")
    ;
    (slot.FilterNameBG):addInputEvent("Mouse_DownScroll", "Scroll_ChattingFilterList( false )")
    ;
    (slot.FilterName):addInputEvent("Mouse_UpScroll", "Scroll_ChattingFilterList( true )")
    ;
    (slot.FilterName):addInputEvent("Mouse_DownScroll", "Scroll_ChattingFilterList( false )")
    ;
    (slot.Delete):addInputEvent("Mouse_UpScroll", "Scroll_ChattingFilterList( true )")
    ;
    (slot.Delete):addInputEvent("Mouse_DownScroll", "Scroll_ChattingFilterList( false )")
    ;
    ((self.ui).btn_Filter):addInputEvent("Mouse_LUp", "ChattingFilter_InsertFilterString()")
    ;
    ((self.ui).btn_Reset):addInputEvent("Mouse_LUp", "ChattingFilter_ResetFilterString()")
    ;
    ((self.ui).edit_Filter):addInputEvent("Mouse_LUp", "HandleClicked_ChattingFilter_EditName()")
    ;
    ((self.ui).edit_Filter):RegistReturnKeyEvent("ChattingFilter_InsertFilterString()")
    ;
    ((self.ui).temp_FilterBG):SetShow(false)
    ;
    ((self.ui).temp_Filter_ItemName):SetShow(false)
    ;
    ((self.ui).temp_Button_Delete):SetShow(false)
    ;
    ((self.ui).scroll):SetShow(false)
    ;
    ((self.ui).desc_Txt):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    ((self.ui).desc_Txt):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_FILTER_DESC"))
    ;
    ((self.ui).desc_BG):SetSize(((self.ui).desc_BG):GetSizeX(), ((self.ui).desc_Txt):GetTextSizeY() + 20)
    ;
    ((self.ui).edit_Filter):SetMaxInput(50)
    ;
    ((self.ui).desc_Txt):SetSize(((self.ui).desc_Txt):GetSizeX(), ((self.ui).desc_Txt):GetTextSizeY() + 10)
    Panel_Chatting_Filter:SetSize(Panel_Chatting_Filter:GetSizeX(), ((self.ui).bg):GetSizeY() + ((self.ui).title):GetSizeY() + ((self.ui).edit_Filter):GetSizeY() + ((self.ui).btn_Reset):GetSizeY() + ((self.ui).desc_Txt):GetTextSizeY() + 70)
  end
end

ChattingFilter:Init()
ChattingFilter.Update = function(self)
  -- function num : 0_3 , upvalues : UI_TM
  for slotIdx = 0, (self.config).maxFilterCount - 1 do
    local slot = (self.uiPool)[slotIdx]
    ;
    (slot.FilterNameBG):SetShow(false)
    ;
    ((self.ui).scroll):SetShow(false)
    ;
    (slot.Delete):addInputEvent("Mouse_LUp", "")
  end
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).totalFilterCount = ToClient_getBlockStringListCount()
  if (self.config).totalFilterCount <= 0 then
    return 
  end
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  if (self.config).totalFilterCount <= (self.config).maxFilterCount then
    (self.config).startIndex = 0
    ;
    ((self.ui).scroll):SetControlPos(0)
  else
    -- DECOMPILER ERROR at PC61: Confused about usage of register: R1 in 'UnsetPending'

    if (self.config).totalFilterCount - (self.config).startIndex < (self.config).maxFilterCount then
      (self.config).startIndex = (self.config).totalFilterCount - (self.config).maxFilterCount
    end
  end
  if (self.config).maxFilterCount < (self.config).totalFilterCount then
    (UIScroll.SetButtonSize)((self.ui).scroll, (self.config).maxFilterCount, (self.config).totalFilterCount)
    ;
    ((self.ui).scroll):SetControlPos((self.config).startIndex / ((self.config).totalFilterCount - (self.config).maxFilterCount))
  else
    ;
    ((self.ui).scroll):SetShow(false)
  end
  local uiCount = 0
  for slotIdx = (self.config).startIndex, (self.config).totalFilterCount - 1 do
    if (self.config).maxFilterCount <= uiCount then
      break
    end
    local slot = (self.uiPool)[uiCount]
    local filterStringGet = ToClient_getBlockStringListByIndex(slotIdx)
    ;
    (slot.FilterNameBG):SetShow(true)
    ;
    (slot.FilterName):SetTextMode(UI_TM.eTextMode_LimitText)
    ;
    (slot.FilterName):SetText(tostring(filterStringGet))
    ;
    (slot.Delete):addInputEvent("Mouse_LUp", "HandleClicked_ChattingFilter_Delete(" .. slotIdx .. ")")
    uiCount = uiCount + 1
  end
end

ChattingFilter.Open = function(self)
  -- function num : 0_4
  Panel_Chatting_Filter:SetShow(true, true)
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Chatting_Filter:GetSizeX()
  local panelSizeY = Panel_Chatting_Filter:GetSizeY()
  Panel_Chatting_Filter:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Chatting_Filter:SetPosY(scrSizeY / 2 - panelSizeY / 2)
  ;
  ((self.ui).scroll):SetControlPos(0)
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self.config).startIndex = 0
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self.config).totalFilterCount = 0
  self:Update()
end

ChattingFilter.Close = function(self)
  -- function num : 0_5
  audioPostEvent_SystemUi(1, 1)
  Panel_Chatting_Filter:SetShow(false, false)
  ;
  ((self.ui).scroll):SetControlPos(0)
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).startIndex = 0
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).totalFilterCount = 0
end

ChattingFilter_InsertFilterString = function()
  -- function num : 0_6 , upvalues : ChattingFilter
  local self = ChattingFilter
  local filterString = ((self.ui).edit_Filter):GetEditText()
  if ToClient_InsertBlockStringList(filterString) == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_FILTER_NOWORD_ACK"))
    ;
    ((self.ui).edit_Filter):SetEditText("", true)
    return 
  end
  ;
  ((self.ui).edit_Filter):SetEditText("", true)
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.config).totalFilterCount = ToClient_getBlockStringListCount()
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.config).startIndex = (math.max)((self.config).totalFilterCount - (self.config).maxFilterCount, 0)
  ChattingFilter:Update()
end

ChattingFilter_ResetFilterString = function()
  -- function num : 0_7 , upvalues : ChattingFilter
  ToClient_ClearBlockStringList()
  ChattingFilter:Update()
end

Scroll_ChattingFilterList = function(isScrollUp)
  -- function num : 0_8 , upvalues : ChattingFilter
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  (ChattingFilter.config).startIndex = (UIScroll.ScrollEvent)((ChattingFilter.ui).scroll, isScrollUp, (ChattingFilter.config).maxFilterCount, (ChattingFilter.config).totalFilterCount, (ChattingFilter.config).startIndex, 1)
  ChattingFilter:Update()
end

HandleClicked_ChattingFilter_EditName = function()
  -- function num : 0_9 , upvalues : ChattingFilter
  SetFocusEdit((ChattingFilter.ui).edit_Filter)
  ;
  ((ChattingFilter.ui).edit_Filter):SetEditText("", true)
end

FGlobal_ChattingFilter_ClearFocusEdit = function()
  -- function num : 0_10
  ClearFocusEdit()
  CheckChattingInput()
end

FGlobal_ChattingFilter_UiEdit = function(targetUI)
  -- function num : 0_11 , upvalues : ChattingFilter
  do return targetUI ~= nil and targetUI:GetKey() == ((ChattingFilter.ui).edit_Filter):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

HandleClicked_ChattingFilter_Delete = function(index)
  -- function num : 0_12 , upvalues : ChattingFilter
  ToClient_EraseBlockStringList(index)
  ChattingFilter:Update()
end

HandleClicked_ChattingFilterList_Close = function()
  -- function num : 0_13 , upvalues : ChattingFilter
  ChattingFilter:Close()
end

FGlobal_ChattingFilterList_Open = function()
  -- function num : 0_14 , upvalues : ChattingFilter
  ChattingFilter:Open()
end

FGlobal_ChattingFilterList_Close = function()
  -- function num : 0_15 , upvalues : ChattingFilter
  ChattingFilter:Close()
end

ChattingFilter.registEventHandler = function(self)
  -- function num : 0_16
  ((self.ui).btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_ChattingFilterList_Close()")
  ;
  ((self.ui).bg):addInputEvent("Mouse_UpScroll", "Scroll_ChattingFilterList( true )")
  ;
  ((self.ui).bg):addInputEvent("Mouse_DownScroll", "Scroll_ChattingFilterList( false )")
  ;
  (UIScroll.InputEvent)((self.ui).scroll, "Scroll_ChattingFilterList")
end

ChattingFilter.registMessageHandler = function(self)
  -- function num : 0_17
end

ChattingFilter:registEventHandler()
ChattingFilter:registMessageHandler()

