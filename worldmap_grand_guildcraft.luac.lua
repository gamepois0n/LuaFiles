-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\wordmap_craft\worldmap_grand_guildcraft.luac 

-- params : ...
-- function num : 0
Worldmap_Grand_GuildCraft:SetShow(false)
Worldmap_Grand_GuildCraft:ActiveMouseEventEffect(true)
Worldmap_Grand_GuildCraft:setGlassBackground(true)
local UI_color = Defines.Color
local Panel_Info = {_bg = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_HouseInfo_BG"), _title = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_Title"), _useTypeIcon = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_HouseInfo_UseType_Icon"), _useTypeDesc = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_HouseInfo_UseType_Desc"), _btnClose = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Button_Win_Close")}
;
(Panel_Info._btnClose):addInputEvent("Mouse_LUp", "GuildCraft_Close()")
local GuildCraft_Left = {_title = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_SubWorkList_Title"), _bg = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_SubWorkList_BG"), _scroll = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Scroll_SubWorkList"), titleCount = 9, maxIconCol = 5, maxIconRow = 9, _houseKeyRaw = nil, _reciepeKeyRaw = nil, _startSlotIndex = 0, _totalRow = 0, _WorkingExchangeKey = 0, 
titlePool = {}
, 
iconPool = {}
}
local GuildCraft_Right = {_title = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_WorkerList_Title"), _bg = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_WorkerList_BG"), _frame = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Frame_WorkingInfo"), _workingItem_IconBG = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_LargCraftInfo_Result_Icon_BG_1"), _workingItem_Icon = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_LargCraftInfo_Result_Icon"), _workingItem_Name = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_LargCraftInfo_Name"), _workingItem_WokingCount = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_LargCraftInfo_TotalCount"), _workingItem_WokingProgress_BG = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_LargCraftInfo_Progress_BG"), _workingItem_WokingProgress_Cover = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_LargCraftInfo_Progress_OutLine"), _workingItem_WokingProgress_Ongoing = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Progress2_LargCraftInfo_OnGoing"), _workingItem_WokingProgress_Complete = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Progress2_LargCraftInfo_Complete"), _workingItem_WorkVolum = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_PartsDetail_Estimated_WorkVolum_Text"), _workingItem_Height = 72, workingCount = 0, haveCount = 0, _workingList_Title = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_Parts_Title"), _itemExchangeKeyRaw = nil, _itemEnchantKeyRaw = nil, _workingList_Height = 90, lastSlotSpanY = 0, lastSlotPosY = 0, _partsDetail_Title = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_PartsDetail_Title"), _partsDetail_Item_BG = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_PartsDetail_Icon_BG_1"), _partsDetail_Item_Icon = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_PartsDetail_Icon"), _partsDetail_Item_Name = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_PartsDetail_ItemName"), _partsDetail_HaveCount = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_PartsDetail_HaveCount"), _partsDetail_Height = 72, _partsDetail_OnGoing_BG = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_PartsDetail_OnGoing_BG"), _partsDetail_OnGoing_BtnNext = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Button_PartsDetail_NextPage"), _partsDetail_OnGoing_BtnPrev = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Button_PartsDetail_PrevPage"), _partsDetail_OnGoing_Page = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Static_PageNo"), _progressingWork_Height = 0, _maxWorkingWorkerSlot = 5, _nowWorkingWorkerPage = 0, _maxWorkingWorkerPage = 0, 
workingWorkerPool = {}
, 
workingWorkerArray = {}
, _partsDetail_WaitWorker_Title = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_SelectedWorker_Title"), _partsDetail_WaitWorker_Value = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_SelectedWorker"), _partsDetail_Btn_WaitWorkerChange = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Button_SelectedWorker_Change"), _partsDetail_WorkSpeed = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_Worker_Estimated_WorkSpeed_Text"), _partsDetail_WorkSpeed_Value = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_Worker_Estimated_WorkSpeed_Value"), _partsDetail_MoveDistance = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_Worker_Estimated_MoveDistance_Text"), _partsDetail_MoveDistance_Value = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_Worker_Estimated_MoveDistance_Value"), _partsDetail_MoveSpeed = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_Worker_Estimated_MoveSpeed_Text"), _partsDetail_MoveSpeed_Value = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_Worker_Estimated_MoveSpeed_Value"), _partsDetail_EstimatedTime = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_PartsDetail_Estimated_Time_Text"), _partsDetail_EstimatedTime_Value = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_PartsDetail_Estimated_Time_Value"), _partsDetail_WorkingCount = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_PartsDetail_Estimated_Time_Count"), _partsDetail_Btn_SetWorkingCount = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Button_PartsDetail_Estimated_Work_Count"), _partsDetail_EstimatedTimeBig_Value = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "StaticText_PartsDetail_OnGoing_Guide"), _check_IgnoreWorkingCount = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "CheckButton_IgnoreWorkingCount"), _btn_workingDo = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Button_Worker_doWork"), _btn_workingSet = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Button_Worker_setWork"), _btn_ImmediatelyDo = (UI.getChildControl)(Worldmap_Grand_GuildCraft, "Button_Worker_Immediately"), maxPartsCount = 10, partsCols = 5, 
partsPool = {}
, _SelectedWorkerNoRaw = nil, _workingCount = 1, _workerInfo_Height = 145, _frameContensSizeY = 0}
GuildCraft_Right._frameContents = (UI.getChildControl)(GuildCraft_Right._frame, "Frame_1_Content")
GuildCraft_Right._frameScroll = (UI.getChildControl)(GuildCraft_Right._frame, "Frame_1_VerticalScroll")
GuildCraft_Right._frameScrollBtn = (UI.getChildControl)(GuildCraft_Right._frameScroll, "Scroll_CtrlButton")
;
(GuildCraft_Right._check_IgnoreWorkingCount):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
local WorkDataRow = {}
GuildCraft_Left.Init = function(self)
  -- function num : 0_0
  for titleIdx = 0, self.titleCount - 1 do
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

    (self.titlePool)[titleIdx] = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "StaticText_SubWorkList_GradeTitle", self._bg, "GuildCraft_Left_WorkingGradeTitle_" .. titleIdx)
    local titleControl = (self.titlePool)[titleIdx]
    titleControl:SetSpanSize(0, (titleControl:GetSizeY() + 24) * titleIdx + 20)
  end
  for iconRowIdx = 0, self.maxIconRow - 1 do
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R5 in 'UnsetPending'

    (self.iconPool)[iconRowIdx] = {}
    for iconColIdx = 0, self.maxIconCol - 1 do
      -- DECOMPILER ERROR at PC43: Confused about usage of register: R9 in 'UnsetPending'

      ((self.iconPool)[iconRowIdx])[iconColIdx] = {}
      local slotPool = ((self.iconPool)[iconRowIdx])[iconColIdx]
      slotPool.bg = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "Radio_SubWork_Icon_BG", self._bg, "GuildCraft_Left_IconBG_" .. iconRowIdx .. "_" .. iconColIdx)
      slotPool.border = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "StaticText_SubWork_Icon_Border", slotPool.bg, "GuildCraft_Left_Border_" .. iconRowIdx .. "_" .. iconColIdx)
      slotPool.icon = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "StaticText_SubWork_Icon", slotPool.bg, "GuildCraft_Left_Icon_" .. iconRowIdx .. "_" .. iconColIdx)
      slotPool.ani = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "Static_Parts_OnGoingAni", slotPool.bg, "GuildCraft_Left_Ani_" .. iconRowIdx .. "_" .. iconColIdx)
      local spanSizeX = ((slotPool.bg):GetSizeX() + 10) * iconColIdx + 15
      local spanSizeY = (slotPool.bg):GetSizeY() * iconRowIdx + 10
      ;
      (slotPool.bg):SetSpanSize(spanSizeX, spanSizeY)
      ;
      (slotPool.icon):SetSpanSize(5, 5)
      ;
      (slotPool.border):SetSpanSize(0, 0)
      ;
      (slotPool.ani):SetSpanSize(2, 2)
      ;
      (slotPool.bg):SetIgnore(false)
    end
  end
  ;
  (self._scroll):SetControlPos(0)
  ;
  (self._bg):addInputEvent("Mouse_UpScroll", "GuildCraft_Left_ScrollEvent( true )")
  ;
  (self._bg):addInputEvent("Mouse_DownScroll", "GuildCraft_Left_ScrollEvent( false )")
end

GuildCraft_Left:Init()
GuildCraft_Right.Init = function(self)
  -- function num : 0_1
  (self._frameContents):AddChild(self._workingItem_IconBG)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingItem_IconBG)
  ;
  (self._workingItem_IconBG):AddChild(self._workingItem_Icon)
  ;
  (self._workingItem_IconBG):AddChild(self._workingItem_Name)
  ;
  (self._workingItem_IconBG):AddChild(self._workingItem_WokingCount)
  ;
  (self._workingItem_IconBG):AddChild(self._workingItem_WorkVolum)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingItem_Icon)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingItem_Name)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingItem_WokingCount)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingItem_WorkVolum)
  ;
  (self._workingItem_IconBG):AddChild(self._workingItem_WokingProgress_BG)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingItem_WokingProgress_BG)
  ;
  (self._workingItem_WokingProgress_BG):AddChild(self._workingItem_WokingProgress_Cover)
  ;
  (self._workingItem_WokingProgress_BG):AddChild(self._workingItem_WokingProgress_Ongoing)
  ;
  (self._workingItem_WokingProgress_BG):AddChild(self._workingItem_WokingProgress_Complete)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingItem_WokingProgress_Cover)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingItem_WokingProgress_Ongoing)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingItem_WokingProgress_Complete)
  ;
  (self._workingItem_IconBG):SetSpanSize(0, 5)
  ;
  (self._workingItem_Icon):SetSpanSize(5, 5)
  ;
  (self._workingItem_Name):SetSpanSize(60, 0)
  ;
  (self._workingItem_WokingCount):SetSpanSize(60, 30)
  ;
  (self._workingItem_WorkVolum):SetSpanSize(200, 30)
  ;
  (self._workingItem_WokingProgress_BG):SetSpanSize(10, 60)
  ;
  (self._workingItem_WokingProgress_Cover):SetSpanSize(0, 0)
  ;
  (self._workingItem_WokingProgress_Ongoing):SetSpanSize(0, 1)
  ;
  (self._workingItem_WokingProgress_Complete):SetSpanSize(0, 1)
  ;
  (self._frameContents):AddChild(self._workingList_Title)
  Worldmap_Grand_GuildCraft:RemoveControl(self._workingList_Title)
  ;
  (self._workingList_Title):SetSpanSize(0, 85)
  local partsSlotStartX = 10
  local partsSlotStartY = 25
  local partsSlotGapX = 52
  local partsSlotGapY = 52
  local partsSlotCols = 5
  local partsSlotRows = (self.maxPartsCount - 1) / self.partsCols
  for partsIdx = 0, self.maxPartsCount - 1 do
    -- DECOMPILER ERROR at PC146: Confused about usage of register: R11 in 'UnsetPending'

    (self.partsPool)[partsIdx] = {}
    local slotPool = (self.partsPool)[partsIdx]
    slotPool.bg = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "Radio_Parts_Icon_BG", self._workingList_Title, "GuildCraft_Right_PartsItem_IconBG_" .. partsIdx)
    slotPool.border = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "StaticText_Parts_Icon_Border", slotPool.bg, "GuildCraft_Right_PartsItem_Border_" .. partsIdx)
    slotPool.icon = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "StaticText_Parts_Icon", slotPool.bg, "GuildCraft_Right_PartsItem_Icon_" .. partsIdx)
    slotPool.count = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "StaticText_Parts_Count", slotPool.bg, "GuildCraft_Right_PartsItem_Count_" .. partsIdx)
    local col = partsIdx % partsSlotCols
    local row = (math.floor)(partsIdx / partsSlotCols)
    local posX = partsSlotStartX + partsSlotGapX * col
    local posY = partsSlotStartY + partsSlotGapY * row
    ;
    (slotPool.bg):SetSpanSize(posX, posY)
    ;
    (slotPool.icon):SetSpanSize(5, 5)
    ;
    (slotPool.border):SetSpanSize(0, 0)
    ;
    (slotPool.count):SetSpanSize(5, 25)
    ;
    (slotPool.bg):SetShow(false)
    ;
    (slotPool.bg):SetIgnore(false)
  end
  ;
  (self._frameContents):AddChild(self._partsDetail_Title)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_Title)
  ;
  (self._partsDetail_Title):AddChild(self._partsDetail_Item_BG)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_Item_BG)
  ;
  (self._partsDetail_Item_BG):AddChild(self._partsDetail_Item_Icon)
  ;
  (self._partsDetail_Item_BG):AddChild(self._partsDetail_Item_Name)
  ;
  (self._partsDetail_Item_BG):AddChild(self._partsDetail_HaveCount)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_Item_Icon)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_Item_Name)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_HaveCount)
  ;
  (self._partsDetail_Title):SetSpanSize(0, 220)
  ;
  (self._partsDetail_Item_BG):SetSpanSize(10, 25)
  ;
  (self._partsDetail_Item_Icon):SetSpanSize(5, 5)
  ;
  (self._partsDetail_Item_Name):SetSpanSize(60, 5)
  ;
  (self._partsDetail_HaveCount):SetSpanSize(60, 25)
  ;
  (self._frameContents):AddChild(self._partsDetail_OnGoing_BG)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_OnGoing_BG)
  ;
  (self._partsDetail_OnGoing_BG):SetSpanSize(0, 290)
  for workingWorkerIdx = 0, self._maxWorkingWorkerSlot - 1 do
    -- DECOMPILER ERROR at PC312: Confused about usage of register: R11 in 'UnsetPending'

    (self.workingWorkerPool)[workingWorkerIdx] = {}
    local slotPool = (self.workingWorkerPool)[workingWorkerIdx]
    slotPool.time = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "StaticText_PartsDetail_Ongoing_Time", self._partsDetail_OnGoing_BG, "GuildCraft_Right_workingWorker_Time_" .. workingWorkerIdx)
    slotPool.btnCancle = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "Button_PartsDetail_Cancel", slotPool.time, "GuildCraft_Right_workingWorker_Cancel_" .. workingWorkerIdx)
    slotPool.progressBG = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "Static_PartsDetail_OnGoing_Progress_BG", slotPool.time, "GuildCraft_Right_workingWorker_ProgressBG_" .. workingWorkerIdx)
    slotPool.progress = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft, "Progress2_PartsDetail_OnGoing", slotPool.progressBG, "GuildCraft_Right_workingWorker_Progress_" .. workingWorkerIdx)
    ;
    (slotPool.time):SetSpanSize(5, ((slotPool.time):GetSizeY() + 15) * workingWorkerIdx + 5)
    ;
    (slotPool.btnCancle):SetSpanSize(255, 1)
    ;
    (slotPool.progressBG):SetSpanSize(0, 20)
    ;
    (slotPool.progress):SetSpanSize(0, 0)
    ;
    (slotPool.time):SetShow(false)
  end
  ;
  (self._partsDetail_OnGoing_BG):AddChild(self._partsDetail_OnGoing_BtnNext)
  ;
  (self._partsDetail_OnGoing_BG):AddChild(self._partsDetail_OnGoing_BtnPrev)
  ;
  (self._partsDetail_OnGoing_BG):AddChild(self._partsDetail_OnGoing_Page)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_OnGoing_BtnNext)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_OnGoing_BtnPrev)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_OnGoing_Page)
  ;
  (self._partsDetail_OnGoing_BtnNext):ComputePos()
  ;
  (self._partsDetail_OnGoing_BtnPrev):ComputePos()
  ;
  (self._partsDetail_OnGoing_Page):ComputePos()
  ;
  (self._partsDetail_OnGoing_BtnNext):SetShow(false)
  ;
  (self._partsDetail_OnGoing_BtnPrev):SetShow(false)
  ;
  (self._partsDetail_OnGoing_Page):SetShow(false)
  ;
  (self._frameContents):AddChild(self._partsDetail_WaitWorker_Title)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_WaitWorker_Title)
  ;
  (self._partsDetail_WaitWorker_Title):SetSpanSize(0, ((self._partsDetail_OnGoing_BG):GetSpanSize()).y + (self._partsDetail_OnGoing_BG):GetSizeY() + 5)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_WaitWorker_Value)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_Btn_WaitWorkerChange)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_WorkSpeed)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_WorkSpeed_Value)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_MoveDistance)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_MoveDistance_Value)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_MoveSpeed)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_MoveSpeed_Value)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_EstimatedTime)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_EstimatedTime_Value)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_WorkingCount)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_Btn_SetWorkingCount)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._partsDetail_EstimatedTimeBig_Value)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._check_IgnoreWorkingCount)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._btn_workingSet)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._btn_workingDo)
  ;
  (self._partsDetail_WaitWorker_Title):AddChild(self._btn_ImmediatelyDo)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_WaitWorker_Value)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_Btn_WaitWorkerChange)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_WorkSpeed)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_WorkSpeed_Value)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_MoveDistance)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_MoveDistance_Value)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_MoveSpeed)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_MoveSpeed_Value)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_EstimatedTime)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_EstimatedTime_Value)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_WorkingCount)
  Worldmap_Grand_GuildCraft:RemoveControl(self._check_IgnoreWorkingCount)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_Btn_SetWorkingCount)
  Worldmap_Grand_GuildCraft:RemoveControl(self._partsDetail_EstimatedTimeBig_Value)
  Worldmap_Grand_GuildCraft:RemoveControl(self._btn_workingSet)
  Worldmap_Grand_GuildCraft:RemoveControl(self._btn_workingDo)
  Worldmap_Grand_GuildCraft:RemoveControl(self._btn_ImmediatelyDo)
  ;
  (self._partsDetail_WaitWorker_Value):SetSpanSize(5, 25)
  ;
  (self._partsDetail_Btn_WaitWorkerChange):SetSpanSize(168, 0)
  ;
  (self._partsDetail_MoveDistance):SetSpanSize(0, 60)
  ;
  (self._partsDetail_WorkSpeed):SetSpanSize(0, 85)
  ;
  (self._partsDetail_MoveSpeed):SetSpanSize(0, 110)
  ;
  (self._partsDetail_MoveDistance_Value):SetSpanSize(80, 60)
  ;
  (self._partsDetail_WorkSpeed_Value):SetSpanSize(80, 85)
  ;
  (self._partsDetail_MoveSpeed_Value):SetSpanSize(80, 110)
  ;
  (self._partsDetail_EstimatedTime):SetSpanSize(170, 60)
  ;
  (self._partsDetail_EstimatedTime_Value):SetSpanSize(140, 70)
  ;
  (self._partsDetail_EstimatedTimeBig_Value):SetSpanSize(10, 75)
  ;
  (self._partsDetail_WorkingCount):SetSpanSize(135, 110)
  ;
  (self._partsDetail_Btn_SetWorkingCount):SetSpanSize(168, 110)
  ;
  (self._check_IgnoreWorkingCount):SetSpanSize(0, 137)
  ;
  (self._btn_workingSet):SetSpanSize(0, 135)
  ;
  (self._btn_workingDo):SetSpanSize(168, 135)
  ;
  (self._btn_ImmediatelyDo):SetSpanSize(0, 135)
  ;
  (self._partsDetail_Btn_WaitWorkerChange):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_ChangeWorker()")
  ;
  (self._partsDetail_Btn_SetWorkingCount):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_Right_WorkCount()")
  ;
  (self._btn_workingSet):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_Right_SetWork()")
  ;
  (self._btn_workingDo):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_Right_DoWork()")
  ;
  (self._check_IgnoreWorkingCount):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_Right_IgnoreWorkingCount()")
end

GuildCraft_Right:Init()
GuildCraft_Left.SetData = function(self)
  -- function num : 0_2 , upvalues : WorkDataRow
  WorkDataRow = {}
  self._totalRow = 0
  local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(self._houseKeyRaw)
  local reciepeCount = guildHouseInfoSSW:getReceipeCount()
  for reciepeIdx = 0, reciepeCount - 1 do
    local houseCraftWrapper = guildHouseInfoSSW:getHouseCraftWrapperByIndex(reciepeIdx)
    local recipeKeyRaw = houseCraftWrapper:getReceipeKeyRaw()
    if recipeKeyRaw == self._reciepeKeyRaw then
      local maxLevel = guildHouseInfoSSW:getMaxLevel(recipeKeyRaw)
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R10 in 'UnsetPending'

      WorkDataRow[self._totalRow] = {}
      for level = 1, maxLevel do
        -- DECOMPILER ERROR at PC40: Confused about usage of register: R14 in 'UnsetPending'

        WorkDataRow[self._totalRow] = {isTitle = true, level = level, value1 = nil, value2 = nil, receipeKey = self._reciepeKeyRaw}
        self._totalRow = self._totalRow + 1
        local exchangeCount = guildHouseInfoSSW:getItemExchangeListCount(recipeKeyRaw, level)
        local exchangeCol = (math.ceil)(exchangeCount / self.maxIconCol + 0.5)
        for exchangeColIdx = 0, exchangeCol - 1 do
          local startIdx = exchangeColIdx * self.maxIconCol
          local endIdx = exchangeColIdx * (self.maxIconCol - 1) + self.maxIconCol
          if exchangeCount < endIdx then
            endIdx = exchangeCount
          end
          -- DECOMPILER ERROR at PC77: Confused about usage of register: R22 in 'UnsetPending'

          WorkDataRow[self._totalRow] = {isTitle = false, level = level, value1 = startIdx, value2 = endIdx, receipeKey = self._reciepeKeyRaw}
          self._totalRow = self._totalRow + 1
        end
      end
    end
  end
end

GuildCraft_Left.Update = function(self, isFromEvent)
  -- function num : 0_3 , upvalues : GuildCraft_Left, WorkDataRow
  local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(self._houseKeyRaw)
  local MyGuildHouseCraftInfoManager = (getSelfPlayer()):getGuildHouseCraftInfoManager()
  local guildHouseInfo = (MyGuildHouseCraftInfoManager:getGuildHouseInfoByKeyRaw(self._reciepeKeyRaw))
  local itemExchangeKeyRaw_byHouse = nil
  if guildHouseInfo ~= nil then
    itemExchangeKeyRaw_byHouse = guildHouseInfo:getItemExchangeKeyRaw()
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R6 in 'UnsetPending'

    GuildCraft_Left._WorkingExchangeKey = itemExchangeKeyRaw_byHouse
  end
  for titleIdx = 0, GuildCraft_Left.titleCount - 1 do
    ((GuildCraft_Left.titlePool)[titleIdx]):SetShow(false)
  end
  for iconRowIdx = 0, GuildCraft_Left.maxIconRow - 1 do
    for iconColIdx = 0, GuildCraft_Left.maxIconCol - 1 do
      local slotPool = ((GuildCraft_Left.iconPool)[iconRowIdx])[iconColIdx]
      ;
      (slotPool.bg):SetShow(false)
      ;
      (slotPool.icon):SetShow(false)
      ;
      (slotPool.border):SetShow(false)
      ;
      (slotPool.ani):SetShow(false)
      ;
      (slotPool.bg):SetCheck(false)
      ;
      (slotPool.bg):addInputEvent("Mouse_On", "")
      ;
      (slotPool.bg):addInputEvent("Mouse_Out", "")
      ;
      (slotPool.bg):addInputEvent("Mouse_LUp", "")
    end
  end
  local uiSlotNo = 0
  for rowNo = GuildCraft_Left._startSlotIndex, GuildCraft_Left._totalRow - 1 do
    if uiSlotNo > 8 then
      break
    end
    local dataArray = WorkDataRow[rowNo]
    if dataArray.isTitle == true then
      ((GuildCraft_Left.titlePool)[uiSlotNo]):SetShow(true)
      ;
      ((GuildCraft_Left.titlePool)[uiSlotNo]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_RECIPEGRADE_TITLE", "grade", dataArray.level))
    else
      local startIdx = dataArray.value1
      local endIdx = dataArray.value2
      local exchangeCount = guildHouseInfoSSW:getItemExchangeListCount(dataArray.receipeKey, dataArray.level)
      for Idx = 0, GuildCraft_Left.maxIconRow - 1 do
        if endIdx <= startIdx + Idx then
          break
        end
        local dataIdx = startIdx + Idx
        local slotPool = ((GuildCraft_Left.iconPool)[uiSlotNo])[Idx]
        local itemExchangeSSW = guildHouseInfoSSW:getItemExchangeByIndex(dataIdx)
        if itemExchangeSSW:isSet() then
          local itemExchangeSS = itemExchangeSSW:get()
          local itemExchangeKeyRaw = itemExchangeSSW:getExchangeKeyRaw()
          local workIcon = "icon/" .. itemExchangeSSW:getIcon()
          local itemStatic = nil
          if itemExchangeSSW:getUseExchangeIcon() == false then
            itemStatic = (itemExchangeSS:getFirstDropGroup()):getItemStaticStatus()
            workIcon = "icon/" .. getItemIconPath(itemStatic)
          end
          ;
          (slotPool.bg):SetShow(true)
          ;
          (slotPool.icon):SetShow(true)
          ;
          (slotPool.border):SetShow(false)
          if itemExchangeKeyRaw_byHouse == itemExchangeKeyRaw then
            (slotPool.ani):SetShow(true)
            if isFromEvent then
              (slotPool.bg):SetCheck(true)
            end
          else
            ;
            (slotPool.ani):SetShow(false)
          end
          ;
          (slotPool.icon):ChangeTextureInfoName(workIcon)
          ;
          (slotPool.bg):addInputEvent("Mouse_On", "GuildCraft_Left_ItemToolTip( true, " .. rowNo .. ", " .. itemExchangeKeyRaw .. ", " .. uiSlotNo .. ", " .. Idx .. " )")
          ;
          (slotPool.bg):addInputEvent("Mouse_Out", "GuildCraft_Left_ItemToolTip( false," .. rowNo .. ", " .. itemExchangeKeyRaw .. ", " .. uiSlotNo .. ", " .. Idx .. " )")
          ;
          (slotPool.bg):addInputEvent("Mouse_LUp", "GuildCraft_Left_Set_RightItem( " .. rowNo .. ", " .. itemExchangeKeyRaw .. " )")
          ;
          (slotPool.bg):setTooltipEventRegistFunc("GuildCraft_Left_ItemToolTip( true, " .. rowNo .. ", " .. itemExchangeKeyRaw .. ", " .. uiSlotNo .. ", " .. Idx .. " )")
        end
      end
    end
    do
      do
        uiSlotNo = uiSlotNo + 1
        -- DECOMPILER ERROR at PC256: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  do
    local isScrollShow = GuildCraft_Left._totalRow > 9
    ;
    (GuildCraft_Left._scroll):SetShow(isScrollShow)
    ;
    (UIScroll.SetButtonSize)(GuildCraft_Left._scroll, GuildCraft_Left.maxIconRow, GuildCraft_Left._totalRow)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

GuildCraft_Left_Set_RightItem = function(rowNo, itemExchangeKeyRaw)
  -- function num : 0_4 , upvalues : WorkDataRow, GuildCraft_Left, GuildCraft_Right
  local dataArray = WorkDataRow[rowNo]
  if dataArray.isTitle == false then
    local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(GuildCraft_Left._houseKeyRaw)
    local exchangeCount = guildHouseInfoSSW:getItemExchangeListCount(dataArray.receipeKey, dataArray.level)
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R5 in 'UnsetPending'

    GuildCraft_Right._itemExchangeKeyRaw = itemExchangeKeyRaw
    local MyGuildHouseCraftInfoManager = (getSelfPlayer()):getGuildHouseCraftInfoManager()
    local guildHouseInfo = MyGuildHouseCraftInfoManager:getGuildHouseInfoByKeyRaw(dataArray.receipeKey)
    if guildHouseInfo == nil then
      GuildCraft_DoWork_SetButton(false)
    else
      local itemExchangeKeyRaw_byHouse = guildHouseInfo:getItemExchangeKeyRaw()
      if GuildCraft_Right._itemExchangeKeyRaw ~= itemExchangeKeyRaw_byHouse then
        GuildCraft_DoWork_SetButton(false)
      else
        GuildCraft_DoWork_SetButton(true)
      end
    end
  end
  do
    GuildCraft_Right:Update_WorkerList()
    GuildCraft_Right:Update_Worker()
    GuildCraft_Right:Update_WorkingWorker()
    GuildCraft_Right:Update_Reciepe()
    GuildCraft_Right:Update_Parts()
    GuildCraft_Right:Update_Detail()
    local scroll = (GuildCraft_Right._frame):GetVScroll()
    scroll:SetControlTop()
    ;
    (GuildCraft_Right._frame):UpdateContentPos()
    ;
    (GuildCraft_Right._frame):UpdateContentScroll()
  end
end

GuildCraft_Left_ItemToolTip = function(isShow, rowNo, itemExchangeKeyRaw, uiSlotNo, Idx)
  -- function num : 0_5 , upvalues : WorkDataRow, GuildCraft_Left
  if isShow == true then
    local dataArray = WorkDataRow[rowNo]
    local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(GuildCraft_Left._houseKeyRaw)
    local exchangeCount = guildHouseInfoSSW:getItemExchangeListCount(dataArray.receipeKey, dataArray.level)
    local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(itemExchangeKeyRaw)
    local control = (((GuildCraft_Left.iconPool)[uiSlotNo])[Idx]).icon
    if itemExchangeSSW:isSet() then
      registTooltipControl(control, Panel_Tooltip_Work)
      FGlobal_Show_Tooltip_Work(itemExchangeSSW, control)
    end
    Panel_Tooltip_Work:SetIgnore(true)
  else
    do
      local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(GuildCraft_Left._houseKeyRaw)
      local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(itemExchangeKeyRaw)
      if itemExchangeSSW:isSet() then
        FGlobal_Hide_Tooltip_Work(itemExchangeSSW, true)
      end
      Panel_Tooltip_Item_hideTooltip()
      Panel_Tooltip_Work:SetIgnore(false)
    end
  end
end

GuildCraft_Left_ScrollEvent = function(isScrollUp)
  -- function num : 0_6 , upvalues : GuildCraft_Left
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  GuildCraft_Left._startSlotIndex = (UIScroll.ScrollEvent)(GuildCraft_Left._scroll, isScrollUp, GuildCraft_Left.maxIconRow, GuildCraft_Left._totalRow, GuildCraft_Left._startSlotIndex, 1)
  GuildCraft_Left:Update()
end

GuildCraft_Right.Update_Reciepe = function(self)
  -- function num : 0_7 , upvalues : GuildCraft_Left, GuildCraft_Right
  if self._itemExchangeKeyRaw ~= nil then
    local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(GuildCraft_Left._houseKeyRaw)
    local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(GuildCraft_Right._itemExchangeKeyRaw)
    local itemExchangeSS = itemExchangeSSW:get()
    local workIcon = "icon/" .. itemExchangeSSW:getIcon()
    local itemName = (itemExchangeSSW:getDescription())
    local itemStatic = nil
    if itemExchangeSSW:getUseExchangeIcon() == false then
      itemStatic = (itemExchangeSS:getFirstDropGroup()):getItemStaticStatus()
      workIcon = "icon/" .. getItemIconPath(itemStatic)
    end
    ;
    (GuildCraft_Right._workingItem_Icon):ChangeTextureInfoName(workIcon)
    ;
    (GuildCraft_Right._workingItem_Name):SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
    ;
    (GuildCraft_Right._workingItem_Name):SetText(itemName)
  else
    do
      ;
      (self._workingItem_Icon):ChangeTextureInfoName("")
      ;
      (self._workingItem_Name):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_SELECTITEM"))
      ;
      (self._workingItem_WokingCount):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_LEFTWORKCOUNT", "now", "-", "max", "-"))
      ;
      (self._workingItem_WorkVolum):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WORKVOLUME", "workVolume", "-"))
      GuildCraft_Right:SetFrameContentsSize()
    end
  end
end

local sizeChange = false
local baseBgSizeY = (GuildCraft_Right._bg):GetSizeY()
local panelSizeY = Worldmap_Grand_GuildCraft:GetSizeY()
GuildCraft_Right.Update_Parts = function(self)
  -- function num : 0_8 , upvalues : GuildCraft_Left, GuildCraft_Right, UI_color, sizeChange
  local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(GuildCraft_Left._houseKeyRaw)
  for partsIdx = 0, self.maxPartsCount - 1 do
    local slotPool = (self.partsPool)[partsIdx]
    ;
    (slotPool.bg):SetShow(false)
    ;
    (slotPool.icon):SetShow(false)
    ;
    (slotPool.border):SetShow(false)
    ;
    (slotPool.count):SetShow(false)
    ;
    (slotPool.bg):SetCheck(false)
    ;
    (slotPool.icon):ChangeTextureInfoName("")
    ;
    (slotPool.bg):addInputEvent("Mouse_LUp", "")
  end
  if GuildCraft_Right._itemExchangeKeyRaw ~= nil then
    local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(GuildCraft_Right._itemExchangeKeyRaw)
    if itemExchangeSSW:isSet() then
      local completeCountGetter = {}
      completeCountGetter.get = function(self, index, fullCount, itemExchangeKeyRaw)
    -- function num : 0_8_0
    if self._data == nil then
      return 0
    end
    if (self._data):getItemExchangeKeyRaw() ~= itemExchangeKeyRaw then
      return 0
    end
    return fullCount - (self._data):getCompletePointByIndex(index)
  end

      completeCountGetter.getCompletePointCount = function(self, itemExchangeCount)
    -- function num : 0_8_1
    if self._data == nil then
      return itemExchangeCount
    end
    local exchangeCount = (self._data):getCompletePointCount()
    if itemExchangeCount < exchangeCount then
      return itemExchangeCount
    else
      return exchangeCount
    end
  end

      local MyGuildHouseCraftInfoManager = (getSelfPlayer()):getGuildHouseCraftInfoManager()
      local guildHouseCraftInfo = MyGuildHouseCraftInfoManager:getGuildHouseInfoByKeyRaw(GuildCraft_Left._reciepeKeyRaw)
      completeCountGetter._data = guildHouseCraftInfo
      local sameWorkingCount = 0
      if guildHouseCraftInfo ~= nil then
        sameWorkingCount = guildHouseCraftInfo:getSameWorkingCountListCount()
      end
      local itemExchangeSS = itemExchangeSSW:get()
      local itemExchangeCount = getExchangeSourceNeedItemList(itemExchangeSS, true)
      local exchangeCount = completeCountGetter:getCompletePointCount(itemExchangeCount)
      local workVolume = Int64toInt32(itemExchangeSS._productTime / toInt64(0, 1000))
      self.lastSlotPosY = 0
      self.workingCount = 0
      self.haveCount = 0
      for partsIdx = 0, exchangeCount - 1 do
        local slotPool = (self.partsPool)[partsIdx]
        local itemStaticInfomationWrapper = getExchangeSourceNeedItemByIndex(partsIdx)
        local itemStaticWrapper = itemStaticInfomationWrapper:getStaticStatus()
        local itemStatic = itemStaticWrapper:get()
        local gradeType = itemStaticWrapper:getGradeType()
        GuildCraft_ChangeBorder_ByItemGrade(gradeType, slotPool.border)
        local enchantItemKeyRaw = (itemStaticInfomationWrapper:getKey()):get()
        local itemIcon = "icon/" .. getItemIconPath(itemStatic)
        local fullCount = Int64toInt32(itemStaticInfomationWrapper:getCount_s64())
        local haveCount = completeCountGetter:get(partsIdx, fullCount, itemExchangeSSW:getExchangeKeyRaw())
        ;
        (slotPool.bg):SetShow(true)
        ;
        (slotPool.icon):SetShow(true)
        ;
        (slotPool.count):SetShow(true)
        ;
        (slotPool.icon):ChangeTextureInfoName(itemIcon)
        local sameWorkerCount = 0
        do
          do
            if guildHouseCraftInfo ~= nil then
              local count = guildHouseCraftInfo:getSameWorkingCountByIndex(partsIdx)
              if count > -1 then
                sameWorkerCount = count
              end
            end
            if sameWorkerCount > 0 then
              if GuildCraft_Left._WorkingExchangeKey == GuildCraft_Right._itemExchangeKeyRaw then
                (slotPool.count):SetText(haveCount .. "(" .. sameWorkerCount .. ")\n/" .. fullCount)
              else
                ;
                (slotPool.count):SetText(haveCount .. "/" .. fullCount)
              end
            else
              ;
              (slotPool.count):SetText(haveCount .. "/" .. fullCount)
            end
            if fullCount <= haveCount then
              (slotPool.count):SetFontColor(UI_color.C_FF88DF00)
            else
              ;
              (slotPool.count):SetFontColor(UI_color.C_FFE7E7E7)
            end
            ;
            (slotPool.bg):addInputEvent("Mouse_LUp", "GuildCraft_Right_Set_WorkingItem( " .. enchantItemKeyRaw .. " )")
            self.workingCount = self.workingCount + fullCount
            self.haveCount = self.haveCount + haveCount
            self.lastSlotPosY = ((self._workingList_Title):GetSpanSize()).y + ((slotPool.bg):GetSpanSize()).y + (slotPool.bg):GetSizeY() * 1.25
            -- DECOMPILER ERROR at PC231: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
      if itemExchangeCount > 5 then
        self._workingList_Height = 150
        sizeChange = true
      else
        self._workingList_Height = 90
        sizeChange = false
      end
      ;
      (self._workingItem_WokingCount):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_LEFTWORKCOUNT", "now", self.haveCount, "max", self.workingCount))
      ;
      (self._workingItem_WorkVolum):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WORKVOLUME", "workVolume", workVolume))
      ;
      (self._workingItem_WokingProgress_Ongoing):SetProgressRate(self.haveCount / self.workingCount * 100)
      ;
      (self._workingItem_WokingProgress_Complete):SetProgressRate(self.haveCount / self.workingCount * 100)
    end
  else
    do
      ;
      (self._workingItem_WokingProgress_Ongoing):SetProgressRate(0)
      ;
      (self._workingItem_WokingProgress_Complete):SetProgressRate(0)
      self._workingList_Height = 30
      self.lastSlotPosY = ((self._workingList_Title):GetSpanSize()).y + (self._workingList_Title):GetSizeY() + (((self.partsPool)[0]).bg):GetSizeY() * 1.35
      ;
      (self._workingItem_WokingCount):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_LEFTWORKCOUNT", "now", "-", "max", "-"))
      GuildCraft_Right:SetFrameContentsSize()
    end
  end
end

GuildCraft_Right_Set_WorkingItem = function(enchantItemKeyRaw)
  -- function num : 0_9 , upvalues : GuildCraft_Right
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  GuildCraft_Right._itemEnchantKeyRaw = enchantItemKeyRaw
  GuildCraft_Right:Update_WorkingWorker()
  GuildCraft_Right:Update_Worker()
  GuildCraft_Right:Update_Detail()
end

GuildCraft_Right.Update_Detail = function(self)
  -- function num : 0_10 , upvalues : GuildCraft_Left, GuildCraft_Right
  (self._partsDetail_Title):SetSpanSize(0, self.lastSlotPosY)
  local houseKeyRaw = GuildCraft_Left._houseKeyRaw
  local exchangeItemKeyRaw = GuildCraft_Right._itemExchangeKeyRaw
  local enchantItemKeyRaw = GuildCraft_Right._itemEnchantKeyRaw
  if exchangeItemKeyRaw ~= nil then
    local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(exchangeItemKeyRaw)
    if itemExchangeSSW:isSet() then
      local itemEnchantSSW = getItemEnchantStaticStatus(ItemEnchantKey(enchantItemKeyRaw))
      local itemEnchantSS = itemEnchantSSW:get()
      local itemKey = ItemEnchantKey(enchantItemKeyRaw)
      local gradeType = itemEnchantSSW:getGradeType()
      local itemIcon = "icon/" .. getItemIconPath(itemEnchantSS)
      local fullCount = itemExchangeSSW:getResourceItemNeedCountByKeyRaw(enchantItemKeyRaw)
      local itemName = getItemName(itemEnchantSS)
      local haveWareHouseCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_HASCOUNT_WAREHOUSE", "hasCount", tostring(warehouse_getItemCountForGuildWarehouse(itemKey)))
      ;
      (self._partsDetail_Item_Name):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
      ;
      (self._partsDetail_Item_Name):SetText(itemName)
      ;
      (self._partsDetail_Item_Icon):ChangeTextureInfoName(itemIcon)
      ;
      (self._partsDetail_HaveCount):SetText(haveWareHouseCount)
    end
  else
    do
      ;
      (self._partsDetail_Item_Icon):ChangeTextureInfoName("")
      ;
      (self._partsDetail_Item_Name):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_SELECTWORK"))
      ;
      (self._partsDetail_OnGoing_BG):SetSpanSize(0, ((self._partsDetail_Title):GetSpanSize()).y + (self._partsDetail_Title):GetSizeY() + (self._partsDetail_Item_BG):GetSizeY() + 10)
      ;
      (self._partsDetail_WaitWorker_Title):SetSpanSize(0, ((self._partsDetail_OnGoing_BG):GetSpanSize()).y + (self._partsDetail_OnGoing_BG):GetSizeY() + 5)
      GuildCraft_Right:SetFrameContentsSize()
    end
  end
end

GuildCraft_Right.SelectDefaultWorker = function(self)
  -- function num : 0_11 , upvalues : GuildCraft_Left, GuildCraft_Right
  local guildHouseWaitWorkerList = getGuildHouseWaitWorkerWrapperList(GuildCraft_Left._reciepeKeyRaw)
  local guildHouseWaitWorkerCount = #guildHouseWaitWorkerList
  if guildHouseWaitWorkerCount > 0 then
    local houseUseType = (CppEnums.eHouseUseType).Count
    local productCategory = (CppEnums.ProductCategory).ProductCategory_LargeCraft
    local workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_GuildHouseLargeCraft
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R6 in 'UnsetPending'

    GuildCraft_Right._SelectedWorkerNoRaw = (guildHouseWaitWorkerList[1]).NoRaw
    local workerWrapperLua = getWorkerWrapper(GuildCraft_Right._SelectedWorkerNoRaw, true)
    local workSpeed = workerWrapperLua:getWorkEfficienceWithSkill(workingType, houseUseType, 0, productCategory) / 1000000
    local moveSpeed = workerWrapperLua:getMoveSpeedWithSkill(workingType, houseUseType, 0) / 100
    local position = ToClient_GetGuildHouseCraftPosition(GuildCraft_Left._houseKeyRaw, GuildCraft_Left._reciepeKeyRaw)
    local distance = ToClient_getCalculateMoveDistance(WorkerNo((guildHouseWaitWorkerList[1]).NoRaw), position) / 100
    local workerLev = workerWrapperLua:getLevel()
    local workerGradeColor = workerWrapperLua:getGradeToColorString()
    local workerName = workerWrapperLua:getName()
    local workerCurrentAp = workerWrapperLua:getActionPoint()
    local workerMaxAp = workerWrapperLua:getMaxActionPoint()
    local string = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. workerLev .. " " .. workerGradeColor .. workerName .. "<PAOldColor> (" .. workerCurrentAp .. "/" .. workerMaxAp .. ")"
    ;
    (GuildCraft_Right._partsDetail_WaitWorker_Value):SetText(string)
    ;
    (GuildCraft_Right._partsDetail_MoveDistance_Value):SetText(": " .. (string.format)("%.2f", distance))
    ;
    (GuildCraft_Right._partsDetail_WorkSpeed_Value):SetText(": " .. (string.format)("%.2f", workSpeed))
    ;
    (GuildCraft_Right._partsDetail_MoveSpeed_Value):SetText(": " .. (string.format)("%.2f", moveSpeed))
  else
    do
      -- DECOMPILER ERROR at PC115: Confused about usage of register: R3 in 'UnsetPending'

      GuildCraft_Right._SelectedWorkerNoRaw = nil
      ;
      (GuildCraft_Right._partsDetail_WaitWorker_Value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WORKVOLUM", "workerCount", guildHouseWaitWorkerCount))
      ;
      (GuildCraft_Right._partsDetail_MoveDistance_Value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_UNTITLE_VALUE", "Volum", "-"))
      ;
      (GuildCraft_Right._partsDetail_WorkSpeed_Value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_UNTITLE_VALUE", "Volum", "-"))
      ;
      (GuildCraft_Right._partsDetail_MoveSpeed_Value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_UNTITLE_VALUE", "Volum", "-"))
    end
  end
end

GuildCraft_Right.Update_WorkingWorker = function(self, page)
  -- function num : 0_12 , upvalues : GuildCraft_Left, GuildCraft_Right
  for workingWorkerIdx = 0, self._maxWorkingWorkerSlot - 1 do
    local slot = (self.workingWorkerPool)[workingWorkerIdx]
    ;
    (slot.time):SetShow(false)
    ;
    (slot.btnCancle):addInputEvent("Mouse_LUp", "")
  end
  self._progressingWork_Height = 0
  ;
  (self._partsDetail_OnGoing_BtnNext):addInputEvent("Mouse_LUp", "")
  ;
  (self._partsDetail_OnGoing_BtnPrev):addInputEvent("Mouse_LUp", "")
  local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(GuildCraft_Left._houseKeyRaw)
  if GuildCraft_Left._reciepeKeyRaw ~= nil and GuildCraft_Right._itemExchangeKeyRaw ~= nil then
    self.workingWorkerArray = getGuildHouseWorkingWorkerWrapperList(GuildCraft_Left._reciepeKeyRaw, GuildCraft_Right._itemExchangeKeyRaw)
    local workingWorkerCount = #self.workingWorkerArray
    if workingWorkerCount > 0 then
      self._maxWorkingWorkerPage = (math.ceil)(workingWorkerCount / self._maxWorkingWorkerSlot)
      if page == nil then
        self._nowWorkingWorkerPage = 1
      else
        self._nowWorkingWorkerPage = page
      end
      local nextPageNo = self._nowWorkingWorkerPage + 1
      local prevPageNo = self._nowWorkingWorkerPage - 1
      if self._maxWorkingWorkerPage < nextPageNo then
        nextPageNo = self._maxWorkingWorkerPage
      end
      if prevPageNo < 1 then
        prevPageNo = 1
      end
      local startIdx = self._maxWorkingWorkerSlot * self._nowWorkingWorkerPage - (self._maxWorkingWorkerSlot - 1)
      local endIdx = startIdx + (self._maxWorkingWorkerSlot - 1)
      ;
      (self._partsDetail_OnGoing_Page):SetText(self._nowWorkingWorkerPage .. "/" .. self._maxWorkingWorkerPage)
      ;
      (self._partsDetail_OnGoing_BG):SetShow(true)
      local uiCount = 0
      for page_idx = startIdx, endIdx do
        if workingWorkerCount < page_idx then
          break
        end
        local workerNoRaw = ((self.workingWorkerArray)[page_idx]).NoRaw
        local workerWrapperLua = getWorkerWrapper(workerNoRaw, true)
        local leftTime = workerWrapperLua:getLeftWorkingTime()
        local workerName = workerWrapperLua:getName()
        local workerLev = workerWrapperLua:getLevel()
        local workerGradeColor = workerWrapperLua:getGradeToColorString()
        local workerHomeWayPoint = workerWrapperLua:getHomeWaypoint()
        local homeName = ToClient_GetNodeNameByWaypointKey(workerHomeWayPoint)
        local string = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. workerLev .. " " .. workerGradeColor .. workerName .. "<PAOldColor>(" .. homeName .. ")"
        local progressRate = ToClient_getWorkingProgress(workerNoRaw) * 100000
        local leftWorkCount = ToClient_getNpcWorkerWorkingCount(workerNoRaw)
        local leftCount_Str = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_BUILDING_ONGOING", "workerNo", leftWorkCount)
        if leftWorkCount < 1 then
          leftCount_Str = PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WORKINGWORKER_ONCEWORKING")
        end
        local slot = (self.workingWorkerPool)[uiCount]
        ;
        (slot.time):SetShow(true)
        ;
        (slot.btnCancle):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_Right_StopWork( " .. page_idx .. " )")
        ;
        (slot.progress):SetProgressRate(progressRate)
        ;
        (slot.time):SetText(string)
        ;
        (slot.btnCancle):SetText(leftCount_Str)
        uiCount = uiCount + 1
      end
      do
        do
          do
            if workingWorkerCount > 5 then
              (self._partsDetail_OnGoing_BtnNext):SetShow(true)
              ;
              (self._partsDetail_OnGoing_BtnPrev):SetShow(true)
              ;
              (self._partsDetail_OnGoing_Page):SetShow(true)
              ;
              (self._partsDetail_OnGoing_BG):SetSize((self._partsDetail_OnGoing_BG):GetSizeX(), ((((self.workingWorkerPool)[0]).time):GetSizeY() + 15) * 5 + 30)
              self._progressingWork_Height = ((((self.workingWorkerPool)[0]).time):GetSizeY() + 18) * 5 + 30
            else
              ;
              (self._partsDetail_OnGoing_BtnNext):SetShow(false)
              ;
              (self._partsDetail_OnGoing_BtnPrev):SetShow(false)
              ;
              (self._partsDetail_OnGoing_Page):SetShow(false)
              ;
              (self._partsDetail_OnGoing_BG):SetSize((self._partsDetail_OnGoing_BG):GetSizeX(), ((((self.workingWorkerPool)[0]).time):GetSizeY() + 15) * workingWorkerCount + 10)
              self._progressingWork_Height = ((((self.workingWorkerPool)[0]).time):GetSizeY() + 18) * workingWorkerCount + 30
            end
            ;
            (self._partsDetail_OnGoing_BtnNext):ComputePos()
            ;
            (self._partsDetail_OnGoing_BtnPrev):ComputePos()
            ;
            (self._partsDetail_OnGoing_Page):ComputePos()
            ;
            (self._partsDetail_OnGoing_BtnNext):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_Right_WorkingWorker_Paging(" .. nextPageNo .. ")")
            ;
            (self._partsDetail_OnGoing_BtnPrev):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_Right_WorkingWorker_Paging(" .. prevPageNo .. ")")
            ;
            (self._partsDetail_OnGoing_BtnNext):SetShow(false)
            ;
            (self._partsDetail_OnGoing_BtnPrev):SetShow(false)
            ;
            (self._partsDetail_OnGoing_Page):SetShow(false)
            ;
            (self._partsDetail_OnGoing_BG):SetShow(false)
            ;
            (self._partsDetail_OnGoing_BG):SetSize((self._partsDetail_OnGoing_BG):GetSizeX(), 0)
            ;
            (self._partsDetail_OnGoing_BtnNext):SetShow(false)
            ;
            (self._partsDetail_OnGoing_BtnPrev):SetShow(false)
            ;
            (self._partsDetail_OnGoing_Page):SetShow(false)
            ;
            (self._partsDetail_OnGoing_BG):SetShow(false)
            ;
            (self._partsDetail_OnGoing_BG):SetSize((self._partsDetail_OnGoing_BG):GetSizeX(), 0)
            GuildCraft_Right:SetFrameContentsSize()
          end
        end
      end
    end
  end
end

HandleClicked_GuildCraft_Right_WorkingWorker_Paging = function(PageNo)
  -- function num : 0_13 , upvalues : GuildCraft_Right
  GuildCraft_Right:Update_WorkingWorker(PageNo)
end

GuildCraft_Right.Update_WorkerList = function(self)
  -- function num : 0_14
  local myWorkerCount = ToClient_getMyNpcWorkerCount()
  local waitWorkerCount = 0
  for workerIdx = 0, myWorkerCount - 1 do
    local guildWorkingType = (CppEnums.NpcWorkingType).eNpcWorkingType_GuildHouseLargeCraft
    local workerWrapper = ToClient_getMyNpcWorkerByIndex(workerIdx)
    local workerNoRaw = ((workerWrapper:get()):getWorkerNo()):get_s64()
    local workerWrapperLua = getWorkerWrapper(workerNoRaw, true)
    if workerWrapperLua:isWorking() == false and workerWrapperLua:getIsAuctionInsert() == false then
      waitWorkerCount = waitWorkerCount + 1
    end
  end
  ;
  (self._partsDetail_WaitWorker_Value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WORKVOLUM", "workerCount", waitWorkerCount))
end

GuildCraft_Right.Update_Worker = function(self)
  -- function num : 0_15 , upvalues : GuildCraft_Left, GuildCraft_Right
  if self._SelectedWorkerNoRaw ~= nil then
    local houseUseType = (CppEnums.eHouseUseType).Count
    local productCategory = (CppEnums.ProductCategory).ProductCategory_LargeCraft
    local workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_GuildHouseLargeCraft
    local workerNoRaw = self._SelectedWorkerNoRaw
    local workerWrapperLua = getWorkerWrapper(workerNoRaw, true)
    local workerLev = workerWrapperLua:getLevel()
    local workerGradeColor = workerWrapperLua:getGradeToColorString()
    local workerName = workerWrapperLua:getName()
    local workerCurrentAp = workerWrapperLua:getActionPoint()
    local workerMaxAp = workerWrapperLua:getMaxActionPoint()
    local workerHomeWayPoint = workerWrapperLua:getHomeWaypoint()
    local homeName = ToClient_GetNodeNameByWaypointKey(workerHomeWayPoint)
    local string = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. workerLev .. " " .. workerGradeColor .. workerName .. "<PAOldColor> (" .. workerCurrentAp .. "/" .. workerMaxAp .. ")"
    ;
    (self._partsDetail_WaitWorker_Value):SetText(string)
    local workSpeed = workerWrapperLua:getWorkEfficienceWithSkill(workingType, houseUseType, 0, productCategory) / 1000000
    local moveSpeed = workerWrapperLua:getMoveSpeedWithSkill(workingType, houseUseType, 0) / 100
    local position = ToClient_GetGuildHouseCraftPosition(GuildCraft_Left._houseKeyRaw, GuildCraft_Left._reciepeKeyRaw)
    local distance = ToClient_getCalculateMoveDistance(WorkerNo(workerNoRaw), position) / 100
    ;
    (self._partsDetail_MoveDistance_Value):SetText(": " .. (string.format)("%.2f", distance))
    ;
    (self._partsDetail_WorkSpeed_Value):SetText(": " .. (string.format)("%.2f", workSpeed))
    ;
    (self._partsDetail_MoveSpeed_Value):SetText(": " .. (string.format)("%.2f", moveSpeed))
    if GuildCraft_Right._itemExchangeKeyRaw ~= nil then
      local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(GuildCraft_Left._houseKeyRaw)
      local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(GuildCraft_Right._itemExchangeKeyRaw)
      if itemExchangeSSW:isSet() then
        local itemExchangeSS = itemExchangeSSW:get()
        local workVolume = Int64toInt32(itemExchangeSS._productTime / toInt64(0, 1000))
        local workBaseTime = ToClient_getNpcWorkingBaseTime() / 1000
        local totalWorkTime = (math.ceil)(workVolume / (math.floor)(workSpeed)) * workBaseTime + distance / moveSpeed * 2
        ;
        (self._partsDetail_EstimatedTime_Value):SetText(((Util.Time).timeFormatting)((math.floor)(totalWorkTime)))
      else
        do
          do
            do
              ;
              (self._partsDetail_EstimatedTime_Value):SetText("-")
              ;
              (self._partsDetail_EstimatedTime_Value):SetText("-")
              ;
              (self._partsDetail_WorkSpeed_Value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_UNTITLE_VALUE", "Volum", "-"))
              ;
              (self._partsDetail_MoveDistance_Value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_UNTITLE_VALUE", "Volum", "-"))
              ;
              (self._partsDetail_MoveSpeed_Value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_UNTITLE_VALUE", "Volum", "-"))
              ;
              (self._partsDetail_EstimatedTime_Value):SetText("-")
              GuildCraft_Right:SetFrameContentsSize()
            end
          end
        end
      end
    end
  end
end

GuildCraft_Right.SetFrameContentsSize = function(self)
  -- function num : 0_16 , upvalues : sizeChange, GuildCraft_Left, panelSizeY, baseBgSizeY
  local sum = self._workingItem_Height + self._workingList_Height + self._partsDetail_Height + self._progressingWork_Height + self._workerInfo_Height + 30
  ;
  (self._frameContents):SetSize((self._frameContents):GetSizeX(), sum)
  ;
  (self._frame):SetSize((self._bg):GetSizeX(), 440)
  if sizeChange then
    (self._bg):SetSize((self._bg):GetSizeX(), (math.min)(sum + 20, 460))
    ;
    (GuildCraft_Left._bg):SetSize((GuildCraft_Left._bg):GetSizeX(), (math.min)(sum + 20, 460))
    Worldmap_Grand_GuildCraft:SetSize(Worldmap_Grand_GuildCraft:GetSizeX(), (math.min)(600, panelSizeY + (sum + 20 - baseBgSizeY)))
  else
    ;
    (self._bg):SetSize((self._bg):GetSizeX(), baseBgSizeY)
    ;
    (GuildCraft_Left._bg):SetSize((GuildCraft_Left._bg):GetSizeX(), baseBgSizeY)
    Worldmap_Grand_GuildCraft:SetSize(Worldmap_Grand_GuildCraft:GetSizeX(), panelSizeY)
  end
  local scrollSizeY = (self._frameScroll):GetSizeY()
  local scrollBtn_PercentY = scrollSizeY / sum * 100
  local scrollBtn_SizeY = scrollSizeY * (scrollBtn_PercentY / 100)
  ;
  (self._frameScrollBtn):SetSize((self._frameScrollBtn):GetSizeX(), scrollBtn_SizeY)
  ;
  (self._frame):UpdateContentScroll()
  ;
  (self._frame):UpdateContentPos()
end

GuildCraft_ChangeBorder_ByItemGrade = function(gradeType, control)
  -- function num : 0_17
  if gradeType > 0 and gradeType <= #(UI.itemSlotConfig).borderTexture then
    control:ChangeTextureInfoName((((UI.itemSlotConfig).borderTexture)[gradeType]).texture)
    local x1, y1, x2, y2 = setTextureUV_Func(control, (((UI.itemSlotConfig).borderTexture)[gradeType]).x1, (((UI.itemSlotConfig).borderTexture)[gradeType]).y1, (((UI.itemSlotConfig).borderTexture)[gradeType]).x2, (((UI.itemSlotConfig).borderTexture)[gradeType]).y2)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:SetShow(true)
  else
    do
      control:SetShow(false)
    end
  end
end

local maybeCancel_workerNo = nil
HandleClicked_GuildCraft_Right_StopWork = function(page_idx)
  -- function num : 0_18 , upvalues : GuildCraft_Right, maybeCancel_workerNo
  local workerNoRaw = ((GuildCraft_Right.workingWorkerArray)[page_idx]).NoRaw
  maybeCancel_workerNo = WorkerNo(workerNoRaw)
  local _leftWorkCount = ToClient_getNpcWorkerWorkingCount(workerNoRaw)
  if _leftWorkCount < 1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKING_PROGRESS_LEFTWORKCOUNT_ACK"))
    return 
  else
    local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(workerNoRaw)
    local workName = esSSW:getDescription()
    local cancelWorkContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LARGECRAFT_WORKMANAGER_CANCELWORK_CONTENT", "workName", workName)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_LARGECRAFT_WORKMANAGER_CANCELWORK_TITLE"), content = cancelWorkContent, functionYes = _GuildCraft_Right_StopWork, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData, "top")
  end
end

_GuildCraft_Right_StopWork = function()
  -- function num : 0_19 , upvalues : maybeCancel_workerNo, GuildCraft_Right
  ToClient_requestCancelNextWorking(maybeCancel_workerNo)
  maybeCancel_workerWrapper = nil
  GuildCraft_Right:Update_WorkingWorker(GuildCraft_Right._nowWorkingWorkerPage)
end

HandleClicked_GuildCraft_ChangeWorker = function()
  -- function num : 0_20 , upvalues : GuildCraft_Left
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Worldmap_Grand_GuildCraft_ChangeWorker, true)
  FGlobal_GuildCraft_ChangeWorker_Open(GuildCraft_Left._houseKeyRaw)
end

FGlobal_GuildCraft_SetWorker = function(workerNoRaw)
  -- function num : 0_21 , upvalues : GuildCraft_Right
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  GuildCraft_Right._SelectedWorkerNoRaw = workerNoRaw
  GuildCraft_Right:Update_WorkingWorker()
  GuildCraft_Right:Update_Worker()
  GuildCraft_Right:Update_Detail()
  GuildCraft_Right:SetFrameContentsSize()
  GuildCraft_WorkCount_AutoSet()
end

GuildCraft_WorkCount_AutoSet = function()
  -- function num : 0_22 , upvalues : GuildCraft_Right
  if GuildCraft_Right._itemEnchantKeyRaw == nil then
    (GuildCraft_Right._partsDetail_WorkingCount):SetText("")
    return 
  else
    if GuildCraft_Right._SelectedWorkerNoRaw == nil then
      (GuildCraft_Right._partsDetail_WorkingCount):SetText("")
      return 
    else
      local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(GuildCraft_Right._itemExchangeKeyRaw)
      local workerWrapperLua = getWorkerWrapper(GuildCraft_Right._SelectedWorkerNoRaw, true)
      local enchantItemKeyRaw = GuildCraft_Right._itemEnchantKeyRaw
      local itemKey = ItemEnchantKey(enchantItemKeyRaw)
      local fullCount_s64 = itemExchangeSSW:getResourceItemNeedCountByKeyRaw(enchantItemKeyRaw)
      local haveCount_s64 = warehouse_getItemCountForGuildWarehouse(itemKey)
      local nowAp_s64 = toInt64(0, workerWrapperLua:getActionPoint())
      local progressCount_s64 = toInt64(0, 0)
      local leftCount_s64 = toInt64(0, 0)
      if toInt64(0, 0) < fullCount_s64 - progressCount_s64 then
        leftCount_s64 = fullCount_s64 - progressCount_s64
      end
      if nowAp_s64 <= toInt64(0, 0) then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WORKERAPTOOLOW"))
        ;
        (GuildCraft_Right._partsDetail_WorkingCount):SetText("")
        return 
      end
      if haveCount_s64 <= toInt64(0, 0) then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_NEEDSTUFF"))
        ;
        (GuildCraft_Right._partsDetail_WorkingCount):SetText("")
        return 
      end
      local workCount_s64 = fullCount_s64
      if nowAp_s64 < workCount_s64 then
        workCount_s64 = nowAp_s64
      end
      if leftCount_s64 < workCount_s64 then
        workCount_s64 = leftCount_s64
      end
      if haveCount_s64 < workCount_s64 then
        workCount_s64 = haveCount_s64
      end
      _guildCraft_Right_SetWorkCount(workCount_s64)
    end
  end
end

HandleClicked_GuildCraft_Right_WorkCount = function()
  -- function num : 0_23 , upvalues : GuildCraft_Right
  if GuildCraft_Right._itemEnchantKeyRaw == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_PLZ_SELECT_WORK"))
  else
    if GuildCraft_Right._SelectedWorkerNoRaw == nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_PLZ_SELECT_WORKER"))
    else
      local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(GuildCraft_Right._itemExchangeKeyRaw)
      local workerWrapperLua = getWorkerWrapper(GuildCraft_Right._SelectedWorkerNoRaw, true)
      local enchantItemKeyRaw = GuildCraft_Right._itemEnchantKeyRaw
      local itemKey = ItemEnchantKey(enchantItemKeyRaw)
      local fullCount_s64 = itemExchangeSSW:getResourceItemNeedCountByKeyRaw(enchantItemKeyRaw)
      local haveCount_s64 = warehouse_getItemCountForGuildWarehouse(itemKey)
      local nowAp_s64 = toInt64(0, workerWrapperLua:getActionPoint())
      local progressCount_s64 = toInt64(0, 0)
      local leftCount_s64 = toInt64(0, 0)
      if toInt64(0, 0) < fullCount_s64 - progressCount_s64 then
        leftCount_s64 = fullCount_s64 - progressCount_s64
      end
      if nowAp_s64 <= toInt64(0, 0) then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WORKERAPTOOLOW"))
        return 
      end
      if haveCount_s64 <= toInt64(0, 0) then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_NEEDSTUFF"))
        return 
      end
      local workCount_s64 = fullCount_s64
      if nowAp_s64 < workCount_s64 then
        workCount_s64 = nowAp_s64
      end
      if leftCount_s64 < workCount_s64 then
        workCount_s64 = leftCount_s64
      end
      if haveCount_s64 < workCount_s64 then
        workCount_s64 = haveCount_s64
      end
      Panel_NumberPad_Show(true, workCount_s64, 0, _guildCraft_Right_SetWorkCount)
    end
  end
end

_guildCraft_Right_SetWorkCount = function(inputNumber)
  -- function num : 0_24 , upvalues : GuildCraft_Right
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  GuildCraft_Right._workingCount = Int64toInt32(inputNumber)
  ;
  (GuildCraft_Right._partsDetail_WorkingCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_BUILDING_DEFAULT", "getWorkingCount", GuildCraft_Right._workingCount))
end

HandleClicked_GuildCraft_Right_SetWork = function()
  -- function num : 0_25 , upvalues : GuildCraft_Left, GuildCraft_Right
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return 
  end
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  if not isGuildMaster and not isGuildSubMaster then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_NPCSHOP_GUILD3"))
    return 
  end
  local houseKeyRaw = GuildCraft_Left._houseKeyRaw
  local workerNoRaw = GuildCraft_Right._SelectedWorkerNoRaw
  local receipeKeyRaw = GuildCraft_Left._reciepeKeyRaw
  local itemExchangeKeyRaw = GuildCraft_Right._itemExchangeKeyRaw
  if houseKeyRaw == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WRONG_HOUSEKEYRAW"))
    return 
  end
  if receipeKeyRaw == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WRONG_RECIPEKEYRAW"))
    return 
  end
  if workerNoRaw == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_PLZ_SELECT_WORKER"))
    return 
  end
  local MyGuildHouseCraftInfoManager = (getSelfPlayer()):getGuildHouseCraftInfoManager()
  local guildHouseInfo = MyGuildHouseCraftInfoManager:getGuildHouseInfoByKeyRaw(receipeKeyRaw)
  local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(itemExchangeKeyRaw)
  local itemName = itemExchangeSSW:getDescription()
  if guildHouseInfo == nil then
    local requestResult = MyGuildHouseCraftInfoManager:requestTrSetItemExchangeKeyForLua(houseKeyRaw, receipeKeyRaw, itemExchangeKeyRaw)
    if requestResult == true then
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_SET_WORKINGITEM", "item_name", itemName))
    end
  else
    do
      local itemExchangeKeyRaw_byHouse = guildHouseInfo:getItemExchangeKeyRaw()
      if itemExchangeKeyRaw_byHouse ~= itemExchangeKeyRaw then
        local resetWorkSetup = function()
    -- function num : 0_25_0 , upvalues : MyGuildHouseCraftInfoManager, houseKeyRaw, receipeKeyRaw, itemExchangeKeyRaw, itemName
    MyGuildHouseCraftInfoManager:requestTrClearItemExchangeKeForLua(houseKeyRaw, receipeKeyRaw)
    GuildCraft_DoWork_SetButton(true)
    local requestResult = MyGuildHouseCraftInfoManager:requestTrSetItemExchangeKeyForLua(houseKeyRaw, receipeKeyRaw, itemExchangeKeyRaw)
    if requestResult == true then
      Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_SET_WORKINGITEM", "item_name", itemName))
    end
  end

        local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
        local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_RESETITEM_NOTIFY")
        local messageBoxData = {title = messageTitle, content = messageBoxMemo, functionYes = resetWorkSetup, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData)
      end
    end
  end
end

HandleClicked_GuildCraft_Right_DoWork = function()
  -- function num : 0_26 , upvalues : GuildCraft_Left, GuildCraft_Right
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return 
  end
  local houseKeyRaw = GuildCraft_Left._houseKeyRaw
  local workerNoRaw = GuildCraft_Right._SelectedWorkerNoRaw
  local receipeKeyRaw = GuildCraft_Left._reciepeKeyRaw
  local itemExchangeKeyRaw = GuildCraft_Right._itemExchangeKeyRaw
  local itemEnchantKeyRaw = GuildCraft_Right._itemEnchantKeyRaw
  local workCount = GuildCraft_Right._workingCount
  if houseKeyRaw == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WRONG_HOUSEKEYRAW"))
    return 
  end
  if receipeKeyRaw == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WRONG_RECIPEKEYRAW"))
    return 
  end
  if workerNoRaw == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_PLZ_SELECT_WORKER"))
    return 
  end
  local itemExchangeSSW = ToClient_getItemExchangeSourceStaticStatusWrapper(itemExchangeKeyRaw)
  if itemExchangeSSW:isSet() then
    getExchangeSourceNeedItemList(itemExchangeSSW:get(), true)
    local ignoreWorkingCount = (GuildCraft_Right._check_IgnoreWorkingCount):IsCheck()
    ToClient_requestStartGuildHouseLargeCraft(houseKeyRaw, WorkerNo(workerNoRaw), receipeKeyRaw, itemExchangeKeyRaw, itemEnchantKeyRaw, workCount, ignoreWorkingCount)
  else
    do
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_WRONG_ITEM"))
      do return  end
      GuildCraft_Right:SelectDefaultWorker()
    end
  end
end

HandleClicked_GuildCraft_Right_IgnoreWorkingCount = function()
  -- function num : 0_27 , upvalues : GuildCraft_Right
  if (GuildCraft_Right._check_IgnoreWorkingCount):IsCheck() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_BUILDING_IGNOREWORKINGCOUNT")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

GuildCraft_DoWork_SetButton = function(isAble)
  -- function num : 0_28 , upvalues : GuildCraft_Right
  (GuildCraft_Right._btn_workingSet):SetShow(not isAble)
  ;
  (GuildCraft_Right._check_IgnoreWorkingCount):SetShow(isAble)
  ;
  (GuildCraft_Right._btn_workingDo):SetIgnore(not isAble)
  ;
  (GuildCraft_Right._btn_workingDo):SetMonoTone(not isAble)
end

FGlobal_GuildCraft_Open = function(houseKeyRaw, reciepeKeyRaw)
  -- function num : 0_29 , upvalues : GuildCraft_Left, GuildCraft_Right, Panel_Info
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  GuildCraft_Left._houseKeyRaw = houseKeyRaw
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R2 in 'UnsetPending'

  GuildCraft_Left._reciepeKeyRaw = reciepeKeyRaw
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  GuildCraft_Right._SelectedWorkerNoRaw = nil
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  GuildCraft_Right._itemExchangeKeyRaw = nil
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  GuildCraft_Right._itemEnchantKeyRaw = nil
  ;
  (GuildCraft_Right._check_IgnoreWorkingCount):SetCheck(false)
  local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper(GuildCraft_Left._houseKeyRaw)
  guildHouseInfoSSW:getItemExchangeListCount(GuildCraft_Left._reciepeKeyRaw, 1)
  local itemExchangeSSW = guildHouseInfoSSW:getItemExchangeByIndex(0)
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R4 in 'UnsetPending'

  if itemExchangeSSW:isSet() then
    GuildCraft_Right._itemExchangeKeyRaw = itemExchangeSSW:getExchangeKeyRaw()
  end
  local houseInfoCraftWrapper = guildHouseInfoSSW:getHouseCraftWrapperByKeyRaw(GuildCraft_Left._reciepeKeyRaw)
  local houseName = guildHouseInfoSSW:getHouseName()
  local recipeName = houseInfoCraftWrapper:getReciepeName()
  ;
  (Panel_Info._title):SetText(houseName .. " - " .. recipeName)
  ;
  (Panel_Info._useTypeDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (Panel_Info._useTypeDesc):SetAutoResize(true)
  ;
  (Panel_Info._useTypeDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GRAND_GUILDCRAFT_GUILDHOUSE_DESC"))
  GuildCraft_Left:SetData()
  GuildCraft_Left:Update()
  for iconRowIdx = 0, GuildCraft_Left.maxIconRow - 1 do
    for iconColIdx = 0, GuildCraft_Left.maxIconCol - 1 do
      local slot = ((GuildCraft_Left.iconPool)[iconRowIdx])[iconColIdx]
      if iconRowIdx == 1 and iconColIdx == 0 then
        (slot.bg):SetCheck(true)
      else
        ;
        (slot.bg):SetCheck(false)
      end
    end
  end
  for partsIdx = 0, GuildCraft_Right.maxPartsCount - 1 do
    local slot = (GuildCraft_Right.partsPool)[partsIdx]
    if partsIdx == 0 then
      (slot.bg):SetCheck(true)
    else
      ;
      (slot.bg):SetCheck(false)
    end
  end
  local itemExchangeSS = itemExchangeSSW:get()
  local itemExchangeCount = getExchangeSourceNeedItemList(itemExchangeSS, true)
  local itemStaticInfomationWrapper = getExchangeSourceNeedItemByIndex(0)
  -- DECOMPILER ERROR at PC144: Confused about usage of register: R10 in 'UnsetPending'

  GuildCraft_Right._itemEnchantKeyRaw = (itemStaticInfomationWrapper:getKey()):get()
  GuildCraft_Right_Set_WorkingItem(GuildCraft_Right._itemEnchantKeyRaw)
  GuildCraft_Right:SelectDefaultWorker()
  GuildCraft_Left_Set_RightItem(1, GuildCraft_Right._itemExchangeKeyRaw)
  GuildCraft_Right:Update_Worker()
  GuildCraft_Right:Update_Detail()
end

GuildCraft_Close = function()
  -- function num : 0_30 , upvalues : GuildCraft_Left, GuildCraft_Right
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  GuildCraft_Left._houseKeyRaw = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  GuildCraft_Left._reciepeKeyRaw = nil
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  GuildCraft_Right._SelectedWorkerNoRaw = nil
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  GuildCraft_Right._itemExchangeKeyRaw = nil
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  GuildCraft_Right._itemEnchantKeyRaw = nil
  WorldMapPopupManager:pop()
end

GuildCraft_onScreenResize = function()
  -- function num : 0_31
  Worldmap_Grand_GuildCraft:ComputePos()
end

FromClient_WorldMap_WorkerDataUpdateByGuildHouse = function(workerNoRaw)
  -- function num : 0_32 , upvalues : GuildCraft_Right
  if not Worldmap_Grand_GuildCraft:GetShow() then
    return 
  end
  GuildCraft_Right:Update_WorkingWorker()
  GuildCraft_Right:Update_Worker()
  GuildCraft_Right:Update_Parts()
  GuildCraft_Right:Update_Detail()
  GuildCraft_Right:SelectDefaultWorker()
end

FromClient_GuildHouseInfoSet = function(receipeKeyRaw, guildHouseCraftInfo)
  -- function num : 0_33 , upvalues : GuildCraft_Left
  if not Worldmap_Grand_GuildCraft:GetShow() then
    return 
  end
  GuildCraft_Left:Update(true)
end

FromClient_GuildHouseInfoClearItemExchangeKey = function(receipeKeyRaw, guildHouseCraftInfo)
  -- function num : 0_34 , upvalues : GuildCraft_Left
  if not Worldmap_Grand_GuildCraft:GetShow() then
    return 
  end
  GuildCraft_Left:Update(true)
end

FromClient_GuildHouseInfoCompleteResource = function(receipeKeyRaw, guildHouseCraftInfo)
  -- function num : 0_35 , upvalues : GuildCraft_Right
  if not Worldmap_Grand_GuildCraft:GetShow() then
    return 
  end
  GuildCraft_Right:Update_Parts()
  GuildCraft_Right:Update_WorkingWorker()
  GuildCraft_Right:Update_Worker()
  GuildCraft_Right:Update_Detail()
  GuildCraft_Right:SelectDefaultWorker()
end

registerEvent("WorldMap_WorkerDataUpdateByGuildHouse", "FromClient_WorldMap_WorkerDataUpdateByGuildHouse")
registerEvent("FromClient_GuildHouseInfoSet", "FromClient_GuildHouseInfoSet")
registerEvent("FromClient_GuildHouseInfoClearItemExchangeKey", "FromClient_GuildHouseInfoClearItemExchangeKey")
registerEvent("FromClient_GuildHouseInfoCompleteResource", "FromClient_GuildHouseInfoCompleteResource")
registerEvent("onScreenResize", "GuildCraft_onScreenResize")

