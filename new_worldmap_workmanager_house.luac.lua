-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_workmanager_house.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_TM = CppEnums.TextMode
local VCK = CppEnums.VirtualKeyCode
Panel_RentHouse_WorkManager:setMaskingChild(true)
Panel_RentHouse_WorkManager:setGlassBackground(true)
Panel_RentHouse_WorkManager:TEMP_UseUpdateListSwap(true)
Panel_RentHouse_WorkManager:ActiveMouseEventEffect(true)
Panel_Select_Inherit:setMaskingChild(true)
Panel_Select_Inherit:setGlassBackground(true)
Panel_Select_Inherit:TEMP_UseUpdateListSwap(true)
Panel_Select_Inherit:ActiveMouseEventEffect(true)
Panel_RentHouse_WorkManager:RegisterShowEventFunc(true, "Panel_RentHouse_WorkManager_ShowAni()")
Panel_RentHouse_WorkManager:RegisterShowEventFunc(false, "Panel_RentHouse_WorkManager_HideAni()")
Panel_RentHouse_WorkManager_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_RentHouse_WorkManager:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.05)
  aniInfo1.AxisX = Panel_RentHouse_WorkManager:GetSizeX() / 2
  aniInfo1.AxisY = Panel_RentHouse_WorkManager:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_RentHouse_WorkManager:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.05)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_RentHouse_WorkManager:GetSizeX() / 2
  aniInfo2.AxisY = Panel_RentHouse_WorkManager:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_RentHouse_WorkManager_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_RentHouse_WorkManager:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_RentHouse_WorkManager:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local houseInfoSS, houseKey, param = nil, nil, nil
local _affiliatedTownKey = 0
local prevGetWearHouseKey = nil
local defalut_Control = {_title = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Title"), _btn_Close = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Button_Win_Close"), _btn_Question = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Button_Question"), _tooltip_WorkName = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Tooltip_Workname"), 
_houseInfo = {_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_HouseInfo_BG"), _Name = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_HouseInfo_Name"), _Desc = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_HouseInfo_Desc"), _UseType_Icon = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_HouseInfo_UseType_Icon"), _UseType_Name = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_HouseInfo_UseType_Name"), _UseType_Desc = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_HouseInfo_UseType_Desc")}
, 
_work_List = {_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkList_BG"), _Title = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkList_Title"), _Scroll = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Scroll_WorkList"), 
_Level = {}
, 
_Icon = {}
, 
_Icon_Button = {}
, 
_Icon_Border = {}
, 
_Icon_Over = {}
, 
_Icon_Disable = {}
, 
_Template = {_Level = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkList_Level"), _Icon = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkList_Icon"), _Icon_Button = (UI.getChildControl)(Panel_RentHouse_WorkManager, "RadioButton_WorkList_Icon_BG"), _Icon_Border = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkList_Border"), _Icon_Over = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkList_Icon_Over"), _Icon_Disable = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkList_Icon_Disable"), _collumMax = 5, _collum_PosX_Gap = 10, _rowMax = 4, _row_PosY_Gap = 2}
}
, 
_worker_List = {_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkerList_BG"), _Title = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkerList_Title"), _Scroll = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Scroll_WorkerList"), _No_Worker = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_NoWorker"), 
_Button = {}
, 
_Progress = {}
, 
_ActionPoint = {}
, 
_Template = {_Button = (UI.getChildControl)(Panel_RentHouse_WorkManager, "RadioButton_Worker"), _Progress = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Progress2_Worker_ActionPoint"), _ActionPoint = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Worker_ActionPoint"), _rowMax = 7, _row_PosY_Gap = 1}
}
, 
_work_Info = {_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_BG"), _Title = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Title"), _Result_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_Result_BG"), _Result_Title = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Result_Title"), _Result_Line_1 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_Result_Line_1"), _Result_Line_2 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_Result_Line_2"), _Result_Icon = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_Result_Icon"), _Result_Icon_BG_1 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_Result_Icon_BG_1"), _Result_Icon_BG_2 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_Result_Icon_BG_2"), _Result_Name = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Result_Name"), _Resource_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_Resource_BG"), _Resource_Title = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Resource_Title"), _Resource_Line_1 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_Resource_Line_1"), _Resource_Line_2 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_WorkInfo_Resource_Line_2"), 
_Resource_Icon = {}
, 
_Resource_Icon_BG = {}
, 
_Resource_Icon_Boder = {}
, 
_Resource_Icon_Over = {}
, 
_Resource_Count = {}
, 
_Resource_Level = {}
, 
_Template = {_Resource_Icon = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Resource_Icon"), _Resource_Icon_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Resource_Icon_BG"), _Resource_Icon_Boder = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Resource_Icon_Boder"), _Resource_Icon_Over = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Resource_Icon_Over"), _Resource_Count = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Resource_Count"), _Resource_Level = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_WorkInfo_Resource_EnchantLevel"), _collumMax = 6, _collum_PosX_Gap = 2}
}
, 
_work_Estimated = {_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_Estimated_BG"), _Title = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_Title"), _Time_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_Time_BG"), _Time_Value = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_Time_Value"), _Time_Line = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_Estimated_Time_Line"), _Time_Count = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_Time_Count"), _Work_Count = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Button_Estimated_Work_Count"), _Work_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_Estimated_Work_BG"), _Work_Line_1 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_Estimated_Work_Line_1"), _Work_Line_2 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_Estimated_Work_Line_2"), _Work_Volume_Text = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_WorkVolum_Text"), _Work_Volume_Value = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_WorkVolum_Value"), _Work_Speed_Text = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_WorkSpeed_Text"), _Work_Speed_Value = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_WorkSpeed_Value"), _Move_BG = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_Estimated_Move_BG"), _Move_Line_1 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_Estimated_Move_Line_1"), _Move_Line_2 = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Static_Estimated_Move_Line_2"), _Move_Distance_Text = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_MoveDistance_Text"), _Move_Distance_Value = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_MoveDistance_Value"), _Move_Speed_Text = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_MoveSpeed_Text"), _Move_Speed_Value = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_Estimated_MoveSpeed_Value"), _Button_DoWork = (UI.getChildControl)(Panel_RentHouse_WorkManager, "Button_doWork"), _Button_DisableWork = (UI.getChildControl)(Panel_RentHouse_WorkManager, "StaticText_DisableWork")}
, 
_select_Inherit = {_BG = (UI.getChildControl)(Panel_Select_Inherit, "Static_Select_Inherit_BG"), _Title = (UI.getChildControl)(Panel_Select_Inherit, "Static_Text_Select_Inherit_Title"), _Btn_Close = (UI.getChildControl)(Panel_Select_Inherit, "Button_Select_Inherit_Close"), _Desc = (UI.getChildControl)(Panel_Select_Inherit, "StaticText_Select_Inherit_Desc"), _Slider = (UI.getChildControl)(Panel_Select_Inherit, "Slider_Inherit"), _Line_1 = (UI.getChildControl)(Panel_Select_Inherit, "StaticText_Select_Inherit_Line_1"), _Line_2 = (UI.getChildControl)(Panel_Select_Inherit, "StaticText_Select_Inherit_Line_2"), 
_Icon_BG = {}
, 
_Icon_Border = {}
, 
_Icon_Over = {}
, 
_Icon = {}
, 
_Enchant_Level = {}
, 
_Template = {_Icon_BG = (UI.getChildControl)(Panel_Select_Inherit, "Static_Select_Inherit_IconBG"), _Icon_Border = (UI.getChildControl)(Panel_Select_Inherit, "Static_Select_Inherit_Icon_Border"), _Icon_Over = (UI.getChildControl)(Panel_Select_Inherit, "Static_Select_Inherit_Icon_Over"), _Icon = (UI.getChildControl)(Panel_Select_Inherit, "Static_Select_Inherit_Icon"), _Enchant_Level = (UI.getChildControl)(Panel_Select_Inherit, "StaticText_Select_Inherit_Level"), _collumMax = 5, _collum_PosX_Gap = 8}
}
}
;
(defalut_Control._btn_Question):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"HouseManageWork\" )")
;
(defalut_Control._btn_Question):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"HouseManageWork\", \"true\")")
;
(defalut_Control._btn_Question):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"HouseManageWork\", \"false\")")
local post_SelectedWorker = nil
defalut_Control.Init_Control = function(self)
  -- function num : 0_2 , upvalues : defalut_Control
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._houseInfo)._BG, (self._houseInfo)._Name)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._houseInfo)._BG, (self._houseInfo)._Desc)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_List)._BG, (self._work_List)._Title)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_List)._BG, (self._work_List)._Scroll)
  FGlobal_Set_Table_Control(self._work_List, "_Icon_Button", "_Icon_Button", true, true)
  FGlobal_Set_Table_Control(self._work_List, "_Icon_Border", "_Icon_Button", true, true)
  FGlobal_Set_Table_Control(self._work_List, "_Icon_Over", "_Icon_Button", true, true)
  FGlobal_Set_Table_Control(self._work_List, "_Icon", "_Icon_Button", true, true)
  FGlobal_Set_Table_Control(self._work_List, "_Level", "_Icon_Button", true, false)
  FGlobal_Set_Table_Control(self._work_List, "_Icon_Disable", "_Icon_Button", true, true)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._worker_List)._BG, (self._worker_List)._Title)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._worker_List)._BG, (self._worker_List)._Scroll)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._worker_List)._BG, (self._worker_List)._No_Worker)
  FGlobal_Set_Table_Control(self._worker_List, "_Button", "_Button", true, false)
  FGlobal_Set_Table_Control(self._worker_List, "_Progress", "_Button", true, false)
  FGlobal_Set_Table_Control(self._worker_List, "_ActionPoint", "_Button", true, false)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Title)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_BG)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Title)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Line_1)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Line_2)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Icon_BG_1)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Icon_BG_2)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Icon)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Result_Name)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Resource_BG)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Resource_Title)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Resource_Line_1)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Info)._BG, (self._work_Info)._Resource_Line_2)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Icon_BG", "_Resource_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Icon_Boder", "_Resource_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Icon_Over", "_Resource_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Icon", "_Resource_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Count", "_Resource_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._work_Info, "_Resource_Level", "_Resource_Icon_BG", false, true)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Title)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Time_BG)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Time_Value)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Time_Line)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Time_Count)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Work_Count)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Work_BG)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Work_Line_1)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Work_Line_2)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Work_Volume_Text)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Work_Volume_Value)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Work_Speed_Text)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Work_Speed_Value)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Move_BG)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Move_Line_1)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Move_Line_2)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Move_Distance_Text)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Move_Distance_Value)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Move_Speed_Text)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Move_Speed_Value)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Button_DoWork)
  FGlobal_AddChild(Panel_RentHouse_WorkManager, (self._work_Estimated)._BG, (self._work_Estimated)._Button_DisableWork)
  FGlobal_Set_Table_Control(self._select_Inherit, "_Icon_BG", "_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._select_Inherit, "_Icon_Border", "_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._select_Inherit, "_Icon_Over", "_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._select_Inherit, "_Icon", "_Icon_BG", false, true)
  FGlobal_Set_Table_Control(self._select_Inherit, "_Enchant_Level", "_Icon_BG", false, true)
  ;
  (defalut_Control._tooltip_WorkName):SetShow(false)
end

defalut_Control:Init_Control()
defalut_Control.Init_Function = function(self)
  -- function num : 0_3
  (self._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_RentHouse_WorkManager_Close()")
  ;
  ((self._work_List)._BG):addInputEvent("Mouse_UpScroll", "HandleScroll_Work_List_UpDown(true)")
  ;
  ((self._work_List)._BG):addInputEvent("Mouse_DownScroll", "HandleScroll_Work_List_UpDown(false)")
  ;
  ((self._work_List)._Scroll):addInputEvent("Mouse_UpScroll", "HandleScroll_Work_List_UpDown(true)")
  ;
  ((self._work_List)._Scroll):addInputEvent("Mouse_DownScroll", "HandleScroll_Work_List_UpDown(false)")
  ;
  ((self._work_List)._Scroll):addInputEvent("Mouse_LDown", "HandleScroll_Work_List_OnClick()")
  ;
  ((self._work_List)._Scroll):addInputEvent("Mouse_LUp", "HandleScroll_Work_List_OnClick()")
  ;
  (((self._work_List)._Scroll):GetControlButton()):addInputEvent("Mouse_UpScroll", "HandleScroll_Work_List_UpDown(true)")
  ;
  (((self._work_List)._Scroll):GetControlButton()):addInputEvent("Mouse_DownScroll", "HandleScroll_Work_List_UpDown(false)")
  ;
  (((self._work_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LDown", "HandleScroll_Work_List_OnClick()")
  ;
  (((self._work_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LUp", "HandleScroll_Work_List_OnClick()")
  ;
  (((self._work_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LPress", "HandleScroll_Work_List_OnClick()")
  for key,value in pairs((self._work_List)._Icon_Over) do
    value:addInputEvent("Mouse_LUp", "Work_List_Select(" .. key .. ")")
    value:addInputEvent("Mouse_On", "HandleOn_Work_List(" .. key .. ")")
    value:addInputEvent("Mouse_Out", "HandleOut_Work_List(" .. key .. ")")
    value:addInputEvent("Mouse_UpScroll", "HandleScroll_Work_List_UpDown(true)")
    value:addInputEvent("Mouse_DownScroll", "HandleScroll_Work_List_UpDown(false)")
  end
  ;
  ((self._worker_List)._BG):addInputEvent("Mouse_UpScroll", "HandleScroll_Worker_List_UpDown(true)")
  ;
  ((self._worker_List)._BG):addInputEvent("Mouse_DownScroll", "HandleScroll_Worker_List_UpDown(false)")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_UpScroll", "HandleScroll_Worker_List_UpDown(true)")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_DownScroll", "HandleScroll_Worker_List_UpDown(false)")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_LDown", "HandleScroll_Worker_List_OnClick()")
  ;
  ((self._worker_List)._Scroll):addInputEvent("Mouse_LUp", "HandleScroll_Worker_List_OnClick()")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_UpScroll", "HandleScroll_Worker_List_UpDown(true)")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_DownScroll", "HandleScroll_Worker_List_UpDown(false)")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LDown", "HandleScroll_Worker_List_OnClick()")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LUp", "HandleScroll_Worker_List_OnClick()")
  ;
  (((self._worker_List)._Scroll):GetControlButton()):addInputEvent("Mouse_LPress", "HandleScroll_Worker_List_OnClick()")
  for key,value in pairs((self._worker_List)._Button) do
    value:addInputEvent("Mouse_On", "HandleOn_Worker_List(" .. key .. ")")
    value:addInputEvent("Mouse_Out", "HandleOut_Worker_List()")
    value:addInputEvent("Mouse_UpScroll", "HandleScroll_Worker_List_UpDown(true)")
    value:addInputEvent("Mouse_DownScroll", "HandleScroll_Worker_List_UpDown(false)")
  end
  ;
  ((self._work_Info)._Result_Icon_BG_2):addInputEvent("Mouse_On", "Item_Tooltip_Show_Test(true)")
  ;
  ((self._work_Info)._Result_Icon_BG_2):addInputEvent("Mouse_Out", "Item_Tooltip_Hide_Test()")
  for key,value in pairs((self._work_Info)._Resource_Icon_Over) do
    value:addInputEvent("Mouse_On", "Item_Tooltip_Show_Test(false, " .. key .. ")")
    value:addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
  end
  ;
  ((self._work_Estimated)._Work_Count):addInputEvent("Mouse_LUp", "HandleClicked_WorkCount_House()")
  ;
  ((self._work_Estimated)._Button_DoWork):addInputEvent("Mouse_LUp", "HandleClick_doWork()")
  ;
  ((self._select_Inherit)._Btn_Close):addInputEvent("Mouse_LUp", "WorldMapPopupManager:pop()")
  ;
  ((self._select_Inherit)._BG):addInputEvent("Mouse_UpScroll", "HandleScroll_Inherit_List_UpDown(true)")
  ;
  ((self._select_Inherit)._BG):addInputEvent("Mouse_DownScroll", "HandleScroll_Inherit_List_UpDown(false)")
  ;
  ((self._select_Inherit)._Slider):addInputEvent("Mouse_UpScroll", "HandleScroll_Inherit_List_UpDown(true)")
  ;
  ((self._select_Inherit)._Slider):addInputEvent("Mouse_DownScroll", "HandleScroll_Inherit_List_UpDown(false)")
  ;
  ((self._select_Inherit)._Slider):addInputEvent("Mouse_LDown", "HandleScroll_Inherit_List_OnClick()")
  ;
  (((self._select_Inherit)._Slider):GetControlButton()):addInputEvent("Mouse_UpScroll", "HandleScroll_Inherit_List_UpDown(true)")
  ;
  (((self._select_Inherit)._Slider):GetControlButton()):addInputEvent("Mouse_DownScroll", "HandleScroll_Inherit_List_UpDown(false)")
  ;
  (((self._select_Inherit)._Slider):GetControlButton()):addInputEvent("Mouse_LDown", "HandleScroll_Inherit_List_OnClick()")
  ;
  (((self._select_Inherit)._Slider):GetControlButton()):addInputEvent("Mouse_LUp", "HandleScroll_Inherit_List_OnClick()")
  ;
  (((self._select_Inherit)._Slider):GetControlButton()):addInputEvent("Mouse_LPress", "HandleScroll_Inherit_List_OnClick()")
  for key,value in pairs((self._select_Inherit)._Icon_Over) do
    value:addInputEvent("Mouse_LUp", "HandleClick_Inherit_Item(" .. key .. ")")
    value:addInputEvent("Mouse_On", "HandleOn_Inherit_Item_Tooltip(" .. key .. ")")
    value:addInputEvent("Mouse_Out", "HandleOut_Inherit_Item_Tooltip()")
    value:addInputEvent("Mouse_UpScroll", "HandleScroll_Inherit_List_UpDown(true)")
    value:addInputEvent("Mouse_DownScroll", "HandleScroll_Inherit_List_UpDown(false)")
  end
end

defalut_Control:Init_Function()
local Work_List = {
_data_Table = {}
, 
_dataIndex = {}
, _dataIndex_First = nil, _dataIndex_previous = nil, _workList_Count = nil, _workableType = nil, _workingCount = 1, _collumMax = ((defalut_Control._work_List)._Template)._collumMax, _rowMax = ((defalut_Control._work_List)._Template)._rowMax, _slotCount = ((defalut_Control._work_List)._Template)._collumMax * ((defalut_Control._work_List)._Template)._rowMax, _scroll = (defalut_Control._work_List)._Scroll, _contentRow = 0, _offsetIndex = 0, _offset_Max = 0, _position = nil, _selected_Data_Row = nil, _selected_Data_Collum = nil, _selected_Work = nil, _selected_Index = nil, _over_Index = nil}
local Inherit_List = {}
Work_List._setData = function(self)
  -- function num : 0_4 , upvalues : param, houseInfoSS, Inherit_List, _affiliatedTownKey, houseKey, defalut_Control
  local level = param._level
  local receipeKey = param._useType
  self._workList_Count = ToClient_getHouseWorkableListCount(houseInfoSS)
  local workCount = ToClient_getRentHouseWorkableListByCustomOnlySize(receipeKey, 1, level)
  self._data_Table = {}
  local collumIndex = 1
  local rowIndex = 1
  local levelIndex = 1
  local savedLevel = 0
  local levelCount = 0
  local levelUp = false
  for index = 1, workCount do
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R14 in 'UnsetPending'

    if (index == 1 or levelUp == true) and (self._data_Table)[rowIndex] == nil then
      (self._data_Table)[rowIndex] = {}
      -- DECOMPILER ERROR at PC38: Confused about usage of register: R14 in 'UnsetPending'

      ;
      ((self._data_Table)[rowIndex])._level = levelIndex
      rowIndex = rowIndex + 1
      levelUp = false
    end
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R14 in 'UnsetPending'

    if (self._data_Table)[rowIndex] == nil then
      (self._data_Table)[rowIndex] = {}
    end
    local esSSW = ToClient_getHouseWorkableItemExchangeByIndex(houseInfoSS, index - 1)
    -- DECOMPILER ERROR at PC64: Confused about usage of register: R15 in 'UnsetPending'

    if esSSW:isSet() then
      if ((self._data_Table)[rowIndex])[collumIndex] == nil then
        ((self._data_Table)[rowIndex])[collumIndex] = {}
      end
      local esSS = esSSW:get()
      local itemStaticWrapper = esSSW:getResultItemStaticStatusWrapper()
      local itemStatic = itemStaticWrapper:get()
      local gradeType = itemStaticWrapper:getGradeType()
      local workVolume = Int64toInt32(esSS._productTime / toInt64(0, 1000))
      local workName = esSSW:getDescription()
      local workDesc = esSSW:getDetailDescription()
      local workIcon = "icon/" .. esSSW:getIcon()
      local workKey = ToClient_getWorkableExchangeKeyByIndex(index - 1)
      local exchangeKeyRaw = esSSW:getExchangeKeyRaw()
      local resultIcon = workIcon
      local resultName = workName
      local resultKey = nil
      if esSSW:getUseExchangeIcon() == false then
        resultName = getItemName(itemStatic)
        resultKey = itemStatic._key
      end
      -- DECOMPILER ERROR at PC127: Confused about usage of register: R28 in 'UnsetPending'

      ;
      ((self._data_Table)[rowIndex])[collumIndex] = {_index = index, _level = levelIndex, _workName = workName, _workDesc = workDesc, _workKey = workKey, _workIcon = workIcon, _workVolume = workVolume, _resultIcon = resultIcon, _resultName = resultName, _resultKey = resultKey, _gradeType = gradeType, _exchangeKeyRaw = exchangeKeyRaw, _isCraftable = true, 
_resource = {}
, 
_inherit = {}
, _resourceCount = 1}
      local eSSCount = getExchangeSourceNeedItemList(esSS, true)
      local inheritIndex = ToClient_getDyanmicEnchantIndex(exchangeKeyRaw)
      local haveCount_Inherit = 0
      -- DECOMPILER ERROR at PC139: Confused about usage of register: R31 in 'UnsetPending'

      if inheritIndex > -1 then
        Inherit_List._selected_inherit = nil
        haveCount_Inherit = Inherit_List:SetData(exchangeKeyRaw, ((self._data_Table)[rowIndex])[collumIndex])
      else
        -- DECOMPILER ERROR at PC150: Confused about usage of register: R31 in 'UnsetPending'

        Inherit_List._selected_inherit = -1
      end
      -- DECOMPILER ERROR at PC154: Confused about usage of register: R31 in 'UnsetPending'

      ;
      (((self._data_Table)[rowIndex])[collumIndex])._resourceCount = eSSCount
      for idx = 1, eSSCount do
        -- DECOMPILER ERROR at PC171: Confused about usage of register: R35 in 'UnsetPending'

        if ((((self._data_Table)[rowIndex])[collumIndex])._resource)[idx] == nil then
          ((((self._data_Table)[rowIndex])[collumIndex])._resource)[idx] = {}
        end
        local _idx = idx - 1
        if inheritIndex > -1 then
          if idx == 1 then
            _idx = inheritIndex
          else
            if idx <= inheritIndex then
              _idx = idx - 2
            end
          end
        end
        local itemStaticInfomationWrapper = getExchangeSourceNeedItemByIndex(_idx)
        local itemStaticWrapper = itemStaticInfomationWrapper:getStaticStatus()
        local itemStatic = itemStaticWrapper:get()
        local itemKey = itemStaticInfomationWrapper:getKey()
        local _gradeType = itemStaticWrapper:getGradeType()
        local resourceKey = itemStatic._key
        local itemIcon = "icon/" .. getItemIconPath(itemStatic)
        local needCount = Int64toInt32(itemStaticInfomationWrapper:getCount_s64())
        local haveCount = 0
        if inheritIndex ~= _idx then
          if _affiliatedTownKey ~= 0 then
            haveCount = Int64toInt32(warehouse_getItemCount(_affiliatedTownKey, itemKey))
          else
            haveCount = 0
          end
        else
          if inheritIndex == _idx then
            haveCount = haveCount_Inherit
          end
        end
        -- DECOMPILER ERROR at PC238: Confused about usage of register: R45 in 'UnsetPending'

        ;
        ((((self._data_Table)[rowIndex])[collumIndex])._resource)[idx] = {_itemKey = itemKey, _resourceKey = resourceKey, _itemIcon = itemIcon, _needCount = needCount, _haveCount = haveCount, _gradeType = _gradeType, _isInheritIndex = inheritIndex == _idx}
        -- DECOMPILER ERROR at PC244: Confused about usage of register: R45 in 'UnsetPending'

        if haveCount < needCount then
          (((self._data_Table)[rowIndex])[collumIndex])._isCraftable = false
        end
      end
      if levelIndex ~= savedLevel then
        levelCount = ToClient_getRentHouseWorkableListByCustomOnlySize(receipeKey, 1, levelIndex)
        savedLevel = levelIndex
      end
      if index == levelCount then
        levelUp = true
        collumIndex = self._collumMax
        levelIndex = levelIndex + 1
        if level < levelIndex then
          break
        end
      end
      if collumIndex < self._collumMax then
        collumIndex = collumIndex + 1
      else
        collumIndex = 1
        rowIndex = rowIndex + 1
      end
    end
  end
  do
    local _offset_Max = rowIndex - self._rowMax
    if _offset_Max < 0 then
      _offset_Max = 0
    end
    self._offset_Max = _offset_Max
    self._offsetIndex = 0
    self._contentRow = rowIndex
    self._position = (ToClient_GetHouseInfoStaticStatusWrapper(houseKey)):getPosition()
    ;
    (UIScroll.SetButtonSize)((defalut_Control._work_List)._Scroll, self._rowMax, self._contentRow)
    self._selected_Data_Row = nil
    self._selected_Data_Collum = nil
    self._selected_Work = nil
    self._selected_Index = nil
    -- DECOMPILER ERROR: 8 unprocessed JMP targets
  end
end

Work_List._updateSlot = function(self, _isFirst)
  -- function num : 0_5 , upvalues : defalut_Control
  FGlobal_Clear_Control((defalut_Control._work_List)._Level)
  FGlobal_Clear_Control((defalut_Control._work_List)._Icon)
  FGlobal_Clear_Control((defalut_Control._work_List)._Icon_Over)
  FGlobal_Clear_Control((defalut_Control._work_List)._Icon_Button)
  FGlobal_Clear_Control((defalut_Control._work_List)._Icon_Border)
  FGlobal_Clear_Control((defalut_Control._work_List)._Icon_Disable)
  self._dataIndex = {}
  local collumIndex = 1
  local rowIndex = self._offsetIndex + 1
  local isFirst = _isFirst
  for index = 1, self._slotCount do
    if (self._data_Table)[rowIndex] == nil then
      break
    end
    if ((self._data_Table)[rowIndex])._level ~= nil and collumIndex == 1 then
      rowByIndex = (math.ceil)(index / self._collumMax)
      ;
      (((defalut_Control._work_List)._Level)[rowByIndex]):SetText(((self._data_Table)[rowIndex])._level .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSEWORKLIST_HOUSE_LEVEL"))
      ;
      (((defalut_Control._work_List)._Level)[rowByIndex]):SetShow(true)
    end
    if ((self._data_Table)[rowIndex])[collumIndex] ~= nil then
      if isFirst == true then
        self._dataIndex_First = index
        isFirst = false
      end
      -- DECOMPILER ERROR at PC96: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (self._dataIndex)[index] = {_rowIndex = rowIndex, _collumIndex = collumIndex}
      if self._selected_Index == (((self._data_Table)[rowIndex])[collumIndex])._index then
        (((defalut_Control._work_List)._Icon_Button)[index]):SetCheck(true)
      else
        ;
        (((defalut_Control._work_List)._Icon_Button)[index]):SetCheck(false)
      end
      ;
      (((defalut_Control._work_List)._Icon)[index]):ChangeTextureInfoName((((self._data_Table)[rowIndex])[collumIndex])._workIcon)
      ;
      (((defalut_Control._work_List)._Icon)[index]):SetShow(true)
      if (((self._data_Table)[rowIndex])[collumIndex])._isCraftable == true then
        (((defalut_Control._work_List)._Icon)[index]):SetMonoTone(false)
        ;
        (((defalut_Control._work_List)._Icon_Disable)[index]):SetShow(false)
      else
        if (((self._data_Table)[rowIndex])[collumIndex])._isCraftable == false then
          (((defalut_Control._work_List)._Icon)[index]):SetMonoTone(true)
          ;
          (((defalut_Control._work_List)._Icon_Disable)[index]):SetShow(true)
        end
      end
      ;
      (((defalut_Control._work_List)._Icon_Over)[index]):SetShow(true)
      ;
      (((defalut_Control._work_List)._Icon_Button)[index]):SetShow(true)
      local gradeType = (((self._data_Table)[rowIndex])[collumIndex])._gradeType
      if gradeType > 0 and gradeType <= #(UI.itemSlotConfig).borderTexture then
        (((defalut_Control._work_List)._Icon_Border)[index]):ChangeTextureInfoName((((UI.itemSlotConfig).borderTexture)[gradeType]).texture)
        local x1, y1, x2, y2 = setTextureUV_Func(((defalut_Control._work_List)._Icon_Border)[index], (((UI.itemSlotConfig).borderTexture)[gradeType]).x1, (((UI.itemSlotConfig).borderTexture)[gradeType]).y1, (((UI.itemSlotConfig).borderTexture)[gradeType]).x2, (((UI.itemSlotConfig).borderTexture)[gradeType]).y2)
        ;
        ((((defalut_Control._work_List)._Icon_Border)[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((defalut_Control._work_List)._Icon_Border)[index]):setRenderTexture((((defalut_Control._work_List)._Icon_Border)[index]):getBaseTexture())
        ;
        (((defalut_Control._work_List)._Icon_Border)[index]):SetShow(true)
      else
        do
          do
            do
              ;
              (((defalut_Control._work_List)._Icon_Border)[index]):SetShow(false)
              if collumIndex < self._collumMax then
                collumIndex = collumIndex + 1
              else
                collumIndex = 1
                rowIndex = rowIndex + 1
              end
              -- DECOMPILER ERROR at PC286: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC286: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC286: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC286: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC286: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC286: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  ;
  ((defalut_Control._work_List)._Scroll):SetControlPos(self._offsetIndex / self._offset_Max)
  HandleOn_Work_List_Refresh()
end

Work_List_Select = function(index)
  -- function num : 0_6 , upvalues : Work_List, VCK, Inherit_List
  if Panel_Window_Exchange_Number:IsShow() then
    Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
  end
  if (Work_List._dataIndex)[index] == nil then
    return 
  end
  if Panel_Select_Inherit:GetShow() == true then
    WorldMapPopupManager:pop()
  end
  if isKeyPressed(VCK.KeyCode_CONTROL) then
    HandleClick_Work_List(index)
    return 
  end
  local rowIndex = ((Work_List._dataIndex)[index])._rowIndex
  local collumIndex = ((Work_List._dataIndex)[index])._collumIndex
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R3 in 'UnsetPending'

  Work_List._selected_Data_Row = rowIndex
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R3 in 'UnsetPending'

  Work_List._selected_Data_Collum = collumIndex
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R3 in 'UnsetPending'

  Work_List._selected_Work = (((Work_List._data_Table)[rowIndex])[collumIndex])._workKey
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R3 in 'UnsetPending'

  Work_List._selected_Index = (((Work_List._data_Table)[rowIndex])[collumIndex])._index
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R3 in 'UnsetPending'

  if #(((Work_List._data_Table)[rowIndex])[collumIndex])._inherit == 1 and Inherit_List._selected_inherit ~= -1 then
    Inherit_List._selected_inherit = (((((Work_List._data_Table)[rowIndex])[collumIndex])._inherit)[1])._itemNoRaw
  else
    -- DECOMPILER ERROR at PC90: Confused about usage of register: R3 in 'UnsetPending'

    if Inherit_List._selected_inherit ~= -1 then
      Inherit_List._selected_inherit = nil
    end
  end
  Work_Info_Update()
  Work_List:_updateSlot()
  Work_Estimated_Update()
end

HandleOn_Work_List = function(index)
  -- function num : 0_7 , upvalues : VCK, Work_List, defalut_Control, houseInfoSS
  if isKeyPressed(VCK.KeyCode_CONTROL) then
    Keep_Tooltip_Work = true
    return 
  end
  local rowIndex = ((Work_List._dataIndex)[index])._rowIndex
  local collumIndex = ((Work_List._dataIndex)[index])._collumIndex
  local uiBase = ((defalut_Control._work_List)._Icon_Border)[index]
  local workIndex = (((Work_List._data_Table)[rowIndex])[collumIndex])._index
  local esSSW = ToClient_getHouseWorkableItemExchangeByIndex(houseInfoSS, workIndex - 1)
  if esSSW:isSet() then
    FGlobal_Show_Tooltip_Work(esSSW, uiBase)
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R6 in 'UnsetPending'

    Work_List._over_Index = index
  end
  if rowIndex ~= Work_List._selected_Data_Row or collumIndex ~= Work_List._selected_Data_Collum then
    Work_Info_Update(true)
    Work_Estimated_Update(true)
  else
    Work_Info_Update()
    Work_Estimated_Update()
  end
end

HandleOut_Work_List = function(index)
  -- function num : 0_8 , upvalues : VCK, Work_List, houseInfoSS, defalut_Control
  if isKeyPressed(VCK.KeyCode_CONTROL) or Work_List._over_Index ~= index then
    return 
  end
  if (Work_List._dataIndex)[index] ~= nil then
    local rowIndex = ((Work_List._dataIndex)[index])._rowIndex
    local collumIndex = ((Work_List._dataIndex)[index])._collumIndex
    local workIndex = (((Work_List._data_Table)[rowIndex])[collumIndex])._index
    local esSSW = ToClient_getHouseWorkableItemExchangeByIndex(houseInfoSS, workIndex - 1)
    if esSSW:isSet() then
      FGlobal_Hide_Tooltip_Work(esSSW, true)
      -- DECOMPILER ERROR at PC42: Confused about usage of register: R5 in 'UnsetPending'

      Work_List._over_Index = nil
    end
  else
    do
      FGlobal_Hide_Tooltip_Work(0, true)
      Work_Info_Update()
      Work_Estimated_Update()
      ;
      (defalut_Control._tooltip_WorkName):SetShow(false)
    end
  end
end

HandleOn_Work_List_Refresh = function()
  -- function num : 0_9 , upvalues : Work_List, defalut_Control
  local index = Work_List._over_Index
  if index ~= nil then
    if (((defalut_Control._work_List)._Icon)[index]):GetShow() then
      HandleOn_Work_List(index)
    else
      HandleOut_Work_List(index)
    end
  end
end

HandleClick_Work_List = function(index)
  -- function num : 0_10 , upvalues : Work_List, houseInfoSS
  local rowIndex = ((Work_List._dataIndex)[index])._rowIndex
  local collumIndex = ((Work_List._dataIndex)[index])._collumIndex
  local workIndex = (((Work_List._data_Table)[rowIndex])[collumIndex])._index
  local esSSW = ToClient_getHouseWorkableItemExchangeByIndex(houseInfoSS, workIndex - 1)
  if esSSW:isSet() then
    FGlobal_Show_Tooltip_Work_Copy(esSSW)
  end
end

local Worker_List = {
_data_Table = {}
, 
_dataIndex = {}
, _rowMax = ((defalut_Control._worker_List)._Template)._rowMax, _contentRow = nil, _offsetIndex = nil, _offset_Max = nil, _selected_Worker = nil, _selected_WorkerKey = nil, _selected_Index = nil, _over_Index = nil}
local workingTime = {}
local homeWayKey = {}
local sortDistanceValue = {}
local Worker_SortByRegionInfo = function(workIndex)
  -- function num : 0_11 , upvalues : houseInfoSS, Work_List, workingTime, homeWayKey, sortDistanceValue, Worker_List
  if workIndex == nil then
    workIndex = 0
  end
  local esSSW = ToClient_getHouseWorkableItemExchangeByIndex(houseInfoSS, workIndex)
  if esSSW:isSet() == false then
    return 
  end
  local esSS = esSSW:get()
  local productCategory = esSS._productCategory
  local workableKey = ToClient_getWorkableExchangeKeyByIndex(workIndex)
  local sortMethod = 0
  local waitingWorkerCount = ToClient_getHouseWaitWorkerList(houseInfoSS, productCategory, workableKey, sortMethod)
  local rowIndex = Work_List._selected_Data_Row
  local collumIndex = Work_List._selected_Data_Collum
  if waitingWorkerCount == 0 then
    return 
  end
  local possibleWorkerIndex = 0
  for index = 1, waitingWorkerCount do
    local npcWaitingWorker = ToClient_getHouseWaitWorkerByIndex(houseInfoSS, index - 1)
    local workerNoRaw = (npcWaitingWorker:getWorkerNo()):get_s64()
    local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
    if ToClient_isWaitWorker(npcWaitingWorker) == true and workerWrapperLua:getIsAuctionInsert() == false then
      possibleWorkerIndex = possibleWorkerIndex + 1
      local firstWorkerNo = npcWaitingWorker:getWorkerNo()
      local workerNoChar = firstWorkerNo:get_s64()
      local npcWaitingWorkerSS = npcWaitingWorker:getWorkerStaticStatus()
      local workerNo = WorkerNo(workerNoChar)
      local workSpeed = npcWaitingWorkerSS:getEfficiency(productCategory, ItemExchangeKey(workableKey))
      local moveSpeed = npcWaitingWorkerSS._moveSpeed / 100
      local distance = ToClient_getCalculateMoveDistance(workerNo, Work_List._position) / 100
      local workVolume = (((Work_List._data_Table)[rowIndex])[collumIndex])._workVolume
      local workBaseTime = ToClient_getNpcWorkingBaseTimeForHouse() / 1000
      local totalWorkTime = (math.ceil)(workVolume / workSpeed) * workBaseTime + distance / moveSpeed * 2
      -- DECOMPILER ERROR at PC102: Confused about usage of register: R27 in 'UnsetPending'

      workingTime[possibleWorkerIndex] = Int64toInt32(totalWorkTime)
      -- DECOMPILER ERROR at PC106: Confused about usage of register: R27 in 'UnsetPending'

      homeWayKey[possibleWorkerIndex] = npcWaitingWorker:getHomeWaypoint()
      -- DECOMPILER ERROR at PC108: Confused about usage of register: R27 in 'UnsetPending'

      sortDistanceValue[possibleWorkerIndex] = distance
    end
  end
  local possibleWorkerCount = possibleWorkerIndex
  local temp = nil
  local workerDataSwap = function(index, sortCount)
    -- function num : 0_11_0 , upvalues : Worker_List, temp, sortDistanceValue
    if index ~= sortCount and ((Worker_List._data_Table)[index])._homeWaypoint ~= ((Worker_List._data_Table)[sortCount])._homeWaypoint then
      temp = (Worker_List._data_Table)[index]
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (Worker_List._data_Table)[index] = (Worker_List._data_Table)[sortCount]
      -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (Worker_List._data_Table)[sortCount] = temp
      temp = sortDistanceValue[index]
      -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

      sortDistanceValue[index] = sortDistanceValue[sortCount]
      -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

      sortDistanceValue[sortCount] = temp
    end
  end

  for ii = 1, possibleWorkerCount do
    local temp = nil
    for i = possibleWorkerCount, 1, -1 do
      if i > 1 and workingTime[i] < workingTime[i - 1] then
        temp = (Worker_List._data_Table)[i]
        -- DECOMPILER ERROR at PC143: Confused about usage of register: R22 in 'UnsetPending'

        ;
        (Worker_List._data_Table)[i] = (Worker_List._data_Table)[i - 1]
        -- DECOMPILER ERROR at PC147: Confused about usage of register: R22 in 'UnsetPending'

        ;
        (Worker_List._data_Table)[i - 1] = temp
        temp = workingTime[i]
        -- DECOMPILER ERROR at PC154: Confused about usage of register: R22 in 'UnsetPending'

        workingTime[i] = workingTime[i - 1]
        -- DECOMPILER ERROR at PC157: Confused about usage of register: R22 in 'UnsetPending'

        workingTime[i - 1] = temp
        temp = sortDistanceValue[i]
        -- DECOMPILER ERROR at PC164: Confused about usage of register: R22 in 'UnsetPending'

        sortDistanceValue[i] = sortDistanceValue[i - 1]
        -- DECOMPILER ERROR at PC167: Confused about usage of register: R22 in 'UnsetPending'

        sortDistanceValue[i - 1] = temp
      end
    end
    if temp == nil then
      break
    end
  end
  do
    local territory = {}
    if FGlobal_WayPointKey_Return() > 0 and FGlobal_WayPointKey_Return() <= 300 then
      territory[0] = true
      territory[1] = false
      territory[2] = false
      territory[3] = false
    else
      if FGlobal_WayPointKey_Return() >= 301 and FGlobal_WayPointKey_Return() <= 600 then
        territory[0] = false
        territory[1] = true
        territory[2] = false
        territory[3] = false
      else
        if FGlobal_WayPointKey_Return() >= 601 and FGlobal_WayPointKey_Return() <= 1000 then
          territory[0] = false
          territory[1] = false
          territory[2] = true
          territory[3] = false
        else
          if FGlobal_WayPointKey_Return() >= 1101 then
            territory[0] = false
            territory[1] = false
            territory[2] = false
            territory[3] = true
          end
        end
      end
    end
    local _sortCount = 0
    for ii = _sortCount + 1, possibleWorkerCount do
      if ((Worker_List._data_Table)[ii])._homeWaypoint == FGlobal_WayPointKey_Return() then
        _sortCount = _sortCount + 1
        if ii ~= _sortCount then
          workerDataSwap(ii, _sortCount)
        end
      end
    end
    local sortByRegion = function(territoryKey)
    -- function num : 0_11_1 , upvalues : _sortCount, possibleWorkerCount, Worker_List, workerDataSwap, sortDistanceValue
    local sortTerritoryCount = 0
    local startValue = _sortCount + 1
    if possibleWorkerCount < startValue then
      return 
    end
    if territoryKey == 0 then
      for jj = startValue, possibleWorkerCount do
        if ((Worker_List._data_Table)[jj])._homeWaypoint > 0 and ((Worker_List._data_Table)[jj])._homeWaypoint <= 300 then
          if startValue ~= jj then
            workerDataSwap(jj, startValue + sortTerritoryCount)
          end
          _sortCount = _sortCount + 1
          sortTerritoryCount = sortTerritoryCount + 1
        end
      end
    else
      do
        if territoryKey == 1 then
          for jj = startValue, possibleWorkerCount do
            if ((Worker_List._data_Table)[jj])._homeWaypoint >= 301 and ((Worker_List._data_Table)[jj])._homeWaypoint <= 600 then
              if startValue ~= jj then
                workerDataSwap(jj, startValue + (sortTerritoryCount))
              end
              _sortCount = _sortCount + 1
              sortTerritoryCount = sortTerritoryCount + 1
            end
          end
        else
          do
            if territoryKey == 2 then
              for jj = startValue, possibleWorkerCount do
                if ((Worker_List._data_Table)[jj])._homeWaypoint >= 601 and ((Worker_List._data_Table)[jj])._homeWaypoint <= 1000 then
                  if startValue ~= jj then
                    workerDataSwap(jj, startValue + (sortTerritoryCount))
                  end
                  _sortCount = _sortCount + 1
                  sortTerritoryCount = sortTerritoryCount + 1
                end
              end
            else
              do
                if territoryKey == 3 then
                  for jj = startValue, possibleWorkerCount do
                    if ((Worker_List._data_Table)[jj])._homeWaypoint >= 1101 then
                      if startValue ~= jj then
                        workerDataSwap(jj, startValue + (sortTerritoryCount))
                      end
                      _sortCount = _sortCount + 1
                      sortTerritoryCount = sortTerritoryCount + 1
                    end
                  end
                end
                do
                  if sortTerritoryCount > 1 then
                    for ii = startValue + 1, startValue + (sortTerritoryCount) - 1 do
                      for jj = startValue + (sortTerritoryCount) - 1, startValue + 1, -1 do
                        if sortDistanceValue[jj] < sortDistanceValue[jj - 1] then
                          workerDataSwap(jj, jj - 1)
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

    if waitingWorkerCount ~= _sortCount then
      if territory[0] == true then
        sortByRegion(0)
        sortByRegion(1)
        sortByRegion(2)
        sortByRegion(3)
      else
        if territory[1] == true then
          sortByRegion(1)
          sortByRegion(0)
          sortByRegion(2)
          sortByRegion(3)
        else
          if territory[2] == true then
            sortByRegion(2)
            sortByRegion(1)
            sortByRegion(0)
            sortByRegion(3)
          else
            if territory[3] == true then
              sortByRegion(3)
              sortByRegion(1)
              sortByRegion(0)
              sortByRegion(2)
            end
          end
        end
      end
    end
  end
end

Worker_List._setData = function(self)
  -- function num : 0_12 , upvalues : houseInfoSS, defalut_Control, param, Worker_SortByRegionInfo
  local workIndex = 0
  local esSSW = ToClient_getHouseWorkableItemExchangeByIndex(houseInfoSS, workIndex)
  if esSSW:isSet() then
    local esSS = esSSW:get()
    local productCategory = esSS._productCategory
    local workableKey = ToClient_getWorkableExchangeKeyByIndex(workIndex)
    local sortMethod = 0
    local waitingWorkerCount = ToClient_getHouseWaitWorkerList(houseInfoSS, productCategory, workableKey, sortMethod)
    if waitingWorkerCount <= 0 then
      ((defalut_Control._work_Estimated)._Button_DisableWork):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_RENTHOUSE_WORKMANAGER_WORKERLIST_NOWORKER"))
    else
      ;
      ((defalut_Control._work_Estimated)._Button_DisableWork):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_RENTHOUSE_WORKMANAGER_BTN_DISABLEWORK"))
    end
    self._data_Table = {}
    local _idx = 0
    for Index = 1, waitingWorkerCount do
      local npcWaitingWorker = ToClient_getHouseWaitWorkerByIndex(houseInfoSS, Index - 1)
      local workerNoRaw = (npcWaitingWorker:getWorkerNo()):get_s64()
      local workerWrapperLua = getWorkerWrapper(workerNoRaw, false)
      if ToClient_isWaitWorker(npcWaitingWorker) == true and workerWrapperLua:getIsAuctionInsert() == false then
        _idx = _idx + 1
        -- DECOMPILER ERROR at PC80: Confused about usage of register: R16 in 'UnsetPending'

        if (self._data_Table)[_idx] == nil then
          (self._data_Table)[_idx] = {}
        end
        local checkData = npcWaitingWorker:getStaticSkillCheckData()
        checkData:set((CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouse, param._houseUseType, 0)
        checkData._diceCheckForceSuccess = true
        local firstWorkerNo = npcWaitingWorker:getWorkerNo()
        local workerNoChar = firstWorkerNo:get_s64()
        local npcWaitingWorkerSS = npcWaitingWorker:getWorkerStaticStatus()
        local workerNo = WorkerNo(workerNoChar)
        local workSpeed = npcWaitingWorker:getWorkEfficienceWithSkill(checkData, productCategory)
        local moveSpeed = npcWaitingWorker:getMoveSpeedWithSkill(checkData) / 100
        local maxPoint = npcWaitingWorkerSS._actionPoint
        local currentPoint = npcWaitingWorker:getActionPoint()
        local workerRegionWrapper = ToClient_getRegionInfoWrapper(npcWaitingWorker)
        local isWorkable = ToClient_getWorkerWorkerableHouse(houseInfoSS, Index - 1)
        local homeWaypoint = npcWaitingWorker:getHomeWaypoint()
        local name = ""
        if isWorkable then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. npcWaitingWorker:getLevel() .. " " .. getWorkerName(npcWaitingWorkerSS) .. "(<PAColor0xff868686>" .. workerRegionWrapper:getAreaName() .. "<PAOldColor>)"
        else
          name = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. npcWaitingWorker:getLevel() .. " " .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_HOUSE_NOTFINDNODE", "npcWaitingWorkerSS", getWorkerName(npcWaitingWorkerSS), "getAreaName", workerRegionWrapper:getAreaName())
        end
        local workerGrade = ((npcWaitingWorkerSS:getCharacterStaticStatus())._gradeType):get()
        -- DECOMPILER ERROR at PC186: Confused about usage of register: R30 in 'UnsetPending'

        ;
        (self._data_Table)[_idx] = {_workerNo = workerNo, _workerNo_s64 = workerNoChar, _workerNoChar = Int64toInt32(workerNoChar), _name = name, _workSpeed = workSpeed / 1000000, _moveSpeed = moveSpeed, _maxPoint = maxPoint, _currentPoint = currentPoint, _homeWaypoint = homeWaypoint, _isWorkable = isWorkable, _workerGrade = workerGrade}
      end
    end
    local _offset_Max = _idx - self._rowMax
    if _offset_Max < 0 then
      _offset_Max = 0
    end
    self._offset_Max = _offset_Max
    self._offsetIndex = 0
    self._contentRow = _idx
    ;
    (UIScroll.SetButtonSize)((defalut_Control._worker_List)._Scroll, self._rowMax, self._contentRow)
  else
    do
      _PA_LOG("LUA", "Worker_List:_setData() = > not esSSW:isSet()")
      Worker_SortByRegionInfo()
    end
  end
end

Worker_List._updateSlot = function(self)
  -- function num : 0_13 , upvalues : Work_List, defalut_Control, Worker_List
  if Work_List._workList_Count == 0 then
    return 
  end
  FGlobal_Clear_Control((defalut_Control._worker_List)._Button)
  FGlobal_Clear_Control((defalut_Control._worker_List)._ActionPoint)
  FGlobal_Clear_Control((defalut_Control._worker_List)._Progress)
  local rowIndex = self._offsetIndex + 1
  for index = 1, self._rowMax do
    local _dataIndex = rowIndex + index - 1
    local data = (self._data_Table)[_dataIndex]
    if data == nil then
      break
    end
    local name = data._name
    local actionPoint = tostring(data._currentPoint) .. "/" .. tostring(data._maxPoint)
    local preogressRate = (math.floor)(data._currentPoint / data._maxPoint * 100)
    local workerGrade = data._workerGrade
    ;
    (((defalut_Control._worker_List)._Button)[index]):SetFontColor(ConvertFromGradeToColor(workerGrade))
    ;
    (((defalut_Control._worker_List)._Button)[index]):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
    ;
    (((defalut_Control._worker_List)._Button)[index]):SetText(name)
    ;
    (((defalut_Control._worker_List)._Button)[index]):addInputEvent("Mouse_LUp", "Worker_List_Select(" .. index .. ")")
    ;
    (((defalut_Control._worker_List)._ActionPoint)[index]):SetText(actionPoint)
    ;
    (((defalut_Control._worker_List)._Progress)[index]):SetProgressRate(preogressRate)
    ;
    (((defalut_Control._worker_List)._Button)[index]):SetShow(true)
    ;
    (((defalut_Control._worker_List)._Progress)[index]):SetShow(true)
    if Worker_List._selected_WorkerKey == data._workerNoChar then
      (((defalut_Control._worker_List)._Button)[index]):SetCheck(true)
      ;
      (((defalut_Control._worker_List)._ActionPoint)[index]):SetShow(true)
    else
      ;
      (((defalut_Control._worker_List)._Button)[index]):SetCheck(false)
      ;
      (((defalut_Control._worker_List)._ActionPoint)[index]):SetShow(false)
    end
    -- DECOMPILER ERROR at PC149: Confused about usage of register: R12 in 'UnsetPending'

    ;
    (self._dataIndex)[index] = _dataIndex
  end
  do
    ;
    ((defalut_Control._worker_List)._Scroll):SetControlPos(self._offsetIndex / self._offset_Max)
    HandleOn_Worker_List_Refresh()
  end
end

Worker_List_Select = function(index)
  -- function num : 0_14 , upvalues : Worker_List, _affiliatedTownKey, prevGetWearHouseKey, defalut_Control, Work_List
  if Panel_Window_Exchange_Number:IsShow() then
    Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
  end
  local selectedIndex = (Worker_List._dataIndex)[index]
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

  if (Worker_List._dataIndex)[index] ~= nil then
    Worker_List._selected_Worker = ((Worker_List._data_Table)[selectedIndex])._workerNo
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

    Worker_List._selected_WorkerKey = ((Worker_List._data_Table)[selectedIndex])._workerNoChar
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

    Worker_List._selected_WorkerNoRaw = ((Worker_List._data_Table)[selectedIndex])._workerNo_s64
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

    Worker_List._selected_Index = selectedIndex
    _affiliatedTownKey = ((Worker_List._data_Table)[selectedIndex])._homeWaypoint
    if prevGetWearHouseKey ~= _affiliatedTownKey then
      warehouse_requestInfo(_affiliatedTownKey)
    end
    FGlobal_HouseCraft_WorkManager_Refresh(false)
    ;
    ((defalut_Control._worker_List)._No_Worker):SetShow(false)
  else
    _affiliatedTownKey = 0
    ;
    ((defalut_Control._worker_List)._No_Worker):SetShow(true)
  end
  -- DECOMPILER ERROR at PC72: Confused about usage of register: R2 in 'UnsetPending'

  Work_List._workingCount = 1
  ;
  ((defalut_Control._work_Estimated)._Time_Count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_BUILDING_ONGOING", "getWorkingCount", Work_List._workingCount))
  Worker_List:_updateSlot()
  Work_Estimated_Update()
end

HandleOn_Worker_List = function(index)
  -- function num : 0_15 , upvalues : Worker_List, defalut_Control
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  Worker_List._over_Index = index
  ;
  (((defalut_Control._worker_List)._ActionPoint)[index]):SetShow(true)
  Work_Estimated_Update(false)
  local self = Worker_List
  local workerIndex = self._offsetIndex + index
  local npcWaitingWorker = ToClient_getNpcWorkerByWorkerNo(((Worker_List._data_Table)[workerIndex])._workerNo_s64)
  if npcWaitingWorker ~= nil then
    local uiBase = ((defalut_Control._worker_List)._Button)[index]
    FGlobal_ShowWorkerTooltipByWorkerNoRaw(((Worker_List._data_Table)[workerIndex])._workerNo_s64, uiBase, true)
  end
end

HandleOut_Worker_List = function()
  -- function num : 0_16 , upvalues : Worker_List
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  Worker_List._over_Index = nil
  Worker_List:_updateSlot()
  Work_Estimated_Update()
  FGlobal_HideWorkerTooltip()
end

HandleOn_Worker_List_Refresh = function()
  -- function num : 0_17 , upvalues : Worker_List
  if Worker_List._over_Index ~= nil then
    HandleOn_Worker_List(Worker_List._over_Index)
  end
end

Work_Info_Update = function(isWorkOver)
  -- function num : 0_18 , upvalues : Work_List, defalut_Control
  local rowIndex = Work_List._selected_Data_Row
  local collumIndex = Work_List._selected_Data_Collum
  if isWorkOver then
    rowIndex = ((Work_List._dataIndex)[Work_List._over_Index])._rowIndex
    collumIndex = ((Work_List._dataIndex)[Work_List._over_Index])._collumIndex
    ;
    ((defalut_Control._work_Info)._Result_Icon_BG_1):SetShow(false)
  else
    ;
    ((defalut_Control._work_Info)._Result_Icon_BG_1):SetShow(true)
  end
  if rowIndex == nil or collumIndex == nil or (Work_List._data_Table)[rowIndex] == nil or ((Work_List._data_Table)[rowIndex])[collumIndex] == nil then
    return 
  end
  local icon = (((Work_List._data_Table)[rowIndex])[collumIndex])._resultIcon
  local key = (((Work_List._data_Table)[rowIndex])[collumIndex])._resultKey
  local name = (((Work_List._data_Table)[rowIndex])[collumIndex])._resultName
  ;
  ((defalut_Control._work_Info)._Result_Icon):ChangeTextureInfoName(icon)
  ;
  ((defalut_Control._work_Info)._Result_Name):SetText(name)
  FGlobal_Clear_Control((defalut_Control._work_Info)._Resource_Icon)
  FGlobal_Clear_Control((defalut_Control._work_Info)._Resource_Icon_BG)
  FGlobal_Clear_Control((defalut_Control._work_Info)._Resource_Icon_Boder)
  FGlobal_Clear_Control((defalut_Control._work_Info)._Resource_Icon_Over)
  FGlobal_Clear_Control((defalut_Control._work_Info)._Resource_Count)
  FGlobal_Clear_Control((defalut_Control._work_Info)._Resource_Level)
  local resourceCount = #(((Work_List._data_Table)[rowIndex])[collumIndex])._resource
  for idx = 1, resourceCount do
    local itemKey = (((((Work_List._data_Table)[rowIndex])[collumIndex])._resource)[idx])._itemKey
    local itemIcon = (((((Work_List._data_Table)[rowIndex])[collumIndex])._resource)[idx])._itemIcon
    local needCount = (((((Work_List._data_Table)[rowIndex])[collumIndex])._resource)[idx])._needCount
    local haveCount = (((((Work_List._data_Table)[rowIndex])[collumIndex])._resource)[idx])._haveCount
    local resourceCount = tostring(haveCount) .. "/" .. tostring(needCount)
    if haveCount < needCount then
      resourceCount = "<PAColor0xFFDB2B2B>" .. resourceCount .. "<PAOldColor>"
    end
    local gradeType = (((((Work_List._data_Table)[rowIndex])[collumIndex])._resource)[idx])._gradeType
    if gradeType > 0 and gradeType <= #(UI.itemSlotConfig).borderTexture then
      (((defalut_Control._work_Info)._Resource_Icon_Boder)[idx]):ChangeTextureInfoName((((UI.itemSlotConfig).borderTexture)[gradeType]).texture)
      local x1, y1, x2, y2 = setTextureUV_Func(((defalut_Control._work_Info)._Resource_Icon_Boder)[idx], (((UI.itemSlotConfig).borderTexture)[gradeType]).x1, (((UI.itemSlotConfig).borderTexture)[gradeType]).y1, (((UI.itemSlotConfig).borderTexture)[gradeType]).x2, (((UI.itemSlotConfig).borderTexture)[gradeType]).y2)
      ;
      ((((defalut_Control._work_Info)._Resource_Icon_Boder)[idx]):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (((defalut_Control._work_Info)._Resource_Icon_Boder)[idx]):setRenderTexture((((defalut_Control._work_Info)._Resource_Icon_Boder)[idx]):getBaseTexture())
      ;
      (((defalut_Control._work_Info)._Resource_Icon_Boder)[idx]):SetShow(true)
    else
      do
        do
          ;
          (((defalut_Control._work_Info)._Resource_Icon_Boder)[idx]):SetShow(false)
          ;
          (((defalut_Control._work_Info)._Resource_Icon)[idx]):ChangeTextureInfoName(itemIcon)
          ;
          (((defalut_Control._work_Info)._Resource_Count)[idx]):SetText(resourceCount)
          ;
          (((defalut_Control._work_Info)._Resource_Level)[idx]):SetText("")
          ;
          (((defalut_Control._work_Info)._Resource_Icon)[idx]):SetShow(true)
          ;
          (((defalut_Control._work_Info)._Resource_Icon_BG)[idx]):SetShow(true)
          ;
          (((defalut_Control._work_Info)._Resource_Icon_Over)[idx]):SetShow(true)
          ;
          (((defalut_Control._work_Info)._Resource_Count)[idx]):SetShow(true)
          -- DECOMPILER ERROR at PC296: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC296: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC296: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

Work_Estimated_Update = function(isWorkOver)
  -- function num : 0_19 , upvalues : Work_List, defalut_Control, Worker_List
  _PA_LOG("정태�\164", "111isWorkOver : " .. tostring(isWorkOver))
  local rowIndex = Work_List._selected_Data_Row
  local collumIndex = Work_List._selected_Data_Collum
  if rowIndex == nil or collumIndex == nil then
    return 
  end
  _PA_LOG("정태�\164", "222밖밖밖밖밖밖밖밖밖rowIndex : " .. tostring(rowIndex) .. " / collumIndex : " .. tostring(collumIndex))
  if isWorkOver then
    _PA_LOG("정태�\164", "333안안안안안안안안rowIndex : " .. tostring(rowIndex) .. " / collumIndex : " .. tostring(collumIndex))
    _PA_LOG("정태�\164", "444Work_List._over_Index : " .. tostring(Work_List._over_Index))
    rowIndex = ((Work_List._dataIndex)[Work_List._over_Index])._rowIndex
    collumIndex = ((Work_List._dataIndex)[Work_List._over_Index])._collumIndex
  end
  local distance = 0
  local workVolume = 0
  local workSpeed = 0
  local moveSpeed = 0
  if ((Work_List._data_Table)[rowIndex])[collumIndex] ~= nil then
    workVolume = (((Work_List._data_Table)[rowIndex])[collumIndex])._workVolume
    ;
    ((defalut_Control._work_Estimated)._Work_Volume_Value):SetText(": " .. workVolume)
    if (((Work_List._data_Table)[rowIndex])[collumIndex])._isCraftable == true then
      ((defalut_Control._work_Estimated)._Work_Count):SetShow(true)
      ;
      ((defalut_Control._work_Estimated)._Button_DoWork):SetShow(true)
      ;
      ((defalut_Control._work_Estimated)._Button_DisableWork):SetShow(false)
    else
      if (((Work_List._data_Table)[rowIndex])[collumIndex])._isCraftable == false then
        ((defalut_Control._work_Estimated)._Work_Count):SetShow(false)
        ;
        ((defalut_Control._work_Estimated)._Button_DoWork):SetShow(false)
        ;
        ((defalut_Control._work_Estimated)._Button_DisableWork):SetShow(true)
      end
    end
  end
  local workerIndex = Worker_List._selected_Index
  if isWorkOver == false then
    workerIndex = (Worker_List._dataIndex)[Worker_List._over_Index]
  end
  if (Worker_List._data_Table)[workerIndex] ~= nil then
    distance = ToClient_getCalculateMoveDistance(((Worker_List._data_Table)[workerIndex])._workerNo, Work_List._position) / 100
    workSpeed = ((Worker_List._data_Table)[workerIndex])._workSpeed
    moveSpeed = ((Worker_List._data_Table)[workerIndex])._moveSpeed
    ;
    ((defalut_Control._work_Estimated)._Move_Distance_Value):SetText(": " .. (string.format)("%.0f", distance))
    ;
    ((defalut_Control._work_Estimated)._Work_Speed_Value):SetText(": " .. (string.format)("%.2f", workSpeed))
    ;
    ((defalut_Control._work_Estimated)._Move_Speed_Value):SetText(": " .. (string.format)("%.2f", moveSpeed))
  else
    ;
    ((defalut_Control._work_Estimated)._Move_Distance_Value):SetText("--")
    ;
    ((defalut_Control._work_Estimated)._Work_Speed_Value):SetText("--")
    ;
    ((defalut_Control._work_Estimated)._Move_Speed_Value):SetText("--")
  end
  if (Worker_List._data_Table)[workerIndex] ~= nil and ((Work_List._data_Table)[rowIndex])[collumIndex] ~= nil then
    local workBaseTime = ToClient_getNpcWorkingBaseTimeForHouse() / 1000
    local totalWorkTime = (math.ceil)(workVolume / workSpeed) * workBaseTime + distance / moveSpeed * 2
    ;
    ((defalut_Control._work_Estimated)._Time_Value):SetText(((Util.Time).timeFormatting)((math.floor)(totalWorkTime)))
  else
    do
      ;
      ((defalut_Control._work_Estimated)._Time_Value):SetText("--")
    end
  end
end

local Scroll_UpDown = function(isUp, _target)
  -- function num : 0_20
  if isUp == false then
    _target._offsetIndex = (math.min)(_target._offset_Max, _target._offsetIndex + 1)
  else
    _target._offsetIndex = (math.max)(0, _target._offsetIndex - 1)
  end
  _target:_updateSlot()
end

HandleScroll_Work_List_UpDown = function(isUp)
  -- function num : 0_21 , upvalues : Scroll_UpDown, Work_List
  Scroll_UpDown(isUp, Work_List)
end

HandleScroll_Worker_List_UpDown = function(isUp)
  -- function num : 0_22 , upvalues : Scroll_UpDown, Worker_List
  Scroll_UpDown(isUp, Worker_List)
end

HandleScroll_Inherit_List_UpDown = function(isUp)
  -- function num : 0_23 , upvalues : Scroll_UpDown, Inherit_List
  Scroll_UpDown(isUp, Inherit_List)
end

local ScrollOnClick = function(_target, _scroll)
  -- function num : 0_24
  local _scroll_Button = _scroll:GetControlButton()
  local _scroll_Blank = _scroll:GetSizeY() - _scroll_Button:GetSizeY()
  local _scroll_Percent = _scroll_Button:GetPosY() / _scroll_Blank
  _target._offsetIndex = 0
  _target._offsetIndex = (math.floor)(_scroll_Percent * _target._offset_Max)
  _target:_updateSlot()
end

HandleScroll_Work_List_OnClick = function()
  -- function num : 0_25 , upvalues : ScrollOnClick, Work_List, defalut_Control
  ScrollOnClick(Work_List, (defalut_Control._work_List)._Scroll)
end

HandleScroll_Worker_List_OnClick = function()
  -- function num : 0_26 , upvalues : ScrollOnClick, Worker_List, defalut_Control
  ScrollOnClick(Worker_List, (defalut_Control._worker_List)._Scroll)
end

local SliderOnClick = function(_target, _slider)
  -- function num : 0_27
  local _scroll_Button = _slider:GetControlButton()
  local _scroll_Blank = _slider:GetSizeX() - _scroll_Button:GetSizeX()
  local _scroll_Percent = _scroll_Button:GetPosX() / _scroll_Blank
  _target._offsetIndex = 0
  do
    if _target._offset_Max > 0 then
      local countValue = _target._offset_Max + 1
      _target._offsetIndex = (math.min)((math.floor)(_scroll_Percent * countValue), _target._offset_Max)
    end
    _target:_updateSlot()
  end
end

HandleScroll_Inherit_List_OnClick = function()
  -- function num : 0_28 , upvalues : SliderOnClick, Inherit_List, defalut_Control
  SliderOnClick(Inherit_List, (defalut_Control._select_Inherit)._Slider)
end

Item_Tooltip_Show_Test = function(isResult, idx)
  -- function num : 0_29 , upvalues : Work_List, defalut_Control, UI_TM, _affiliatedTownKey
  local rowIndex = Work_List._selected_Data_Row
  local collumIndex = Work_List._selected_Data_Collum
  if (Work_List._data_Table)[rowIndex] == nil then
    return 
  end
  local staticStatusKey, uiBase = nil, nil
  local resourceData = ((((Work_List._data_Table)[rowIndex])[collumIndex])._resource)[idx]
  if isResult then
    staticStatusKey = (((Work_List._data_Table)[rowIndex])[collumIndex])._resultKey
    uiBase = (defalut_Control._work_Info)._Result_Icon_BG_1
  else
    if isResult == false and idx ~= nil and resourceData ~= nil then
      staticStatusKey = (((((Work_List._data_Table)[rowIndex])[collumIndex])._resource)[idx])._resourceKey
      uiBase = ((defalut_Control._work_Info)._Resource_Icon_BG)[idx]
    end
  end
  if staticStatusKey == nil and isResult == true then
    local workDes = (((Work_List._data_Table)[rowIndex])[collumIndex])._workDesc
    if workDes == "" then
      return 
    end
    ;
    (defalut_Control._tooltip_WorkName):SetAutoResize(true)
    ;
    (defalut_Control._tooltip_WorkName):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (defalut_Control._tooltip_WorkName):SetText(workDes)
    ;
    (defalut_Control._tooltip_WorkName):SetShow(true)
    local textSize = (defalut_Control._tooltip_WorkName):GetTextSizeX()
    ;
    (defalut_Control._tooltip_WorkName):SetSize(textSize + 5, (defalut_Control._tooltip_WorkName):GetSizeY())
    local uiParent = (defalut_Control._work_Info)._BG
    ;
    (defalut_Control._tooltip_WorkName):SetPosX(uiParent:GetPosX() + uiBase:GetPosX() + uiBase:GetSizeX())
    ;
    (defalut_Control._tooltip_WorkName):SetPosY(uiParent:GetPosY() + uiBase:GetPosY() + 2)
  else
    do
      if staticStatusKey == nil or uiBase == nil then
        return 
      else
        local exchangeKeyRaw = (((Work_List._data_Table)[rowIndex])[collumIndex])._exchangeKeyRaw
        local inheritIndex = ToClient_getDyanmicEnchantIndex(exchangeKeyRaw)
        if #(((Work_List._data_Table)[rowIndex])[collumIndex])._inherit >= 1 and inheritIndex + 1 == idx then
          local itemNoRaw = (((((Work_List._data_Table)[rowIndex])[collumIndex])._inherit)[1])._itemNoRaw
          local itemWrapper = warehouse_getItemByItemNo(_affiliatedTownKey, itemNoRaw)
          if itemWrapper ~= nil then
            Panel_Tooltip_Item_Show(itemWrapper, uiBase, false, true)
          end
        else
          do
            local staticStatusWrapper = getItemEnchantStaticStatus(staticStatusKey)
            Panel_Tooltip_Item_Show(staticStatusWrapper, uiBase, true, false)
          end
        end
      end
    end
  end
end

Item_Tooltip_Hide_Test = function()
  -- function num : 0_30 , upvalues : defalut_Control
  if (defalut_Control._tooltip_WorkName):GetShow() == true then
    (defalut_Control._tooltip_WorkName):SetShow(false)
  end
  Panel_Tooltip_Item_hideTooltip()
end

FGlobal_RentHouse_WorkManager_Open = function(houseInfoSSWrapper, _param)
  -- function num : 0_31 , upvalues : Worker_List, houseInfoSS, houseKey, param, prevGetWearHouseKey, Work_List, defalut_Control, UI_TM
  Panel_RentHouse_WorkManager:SetShow(true, true)
  local PosX = Panel_HouseControl:GetPosX(PosX)
  local PosY = Panel_HouseControl:GetPosY(PosY)
  Panel_RentHouse_WorkManager:SetPosX(PosX)
  Panel_RentHouse_WorkManager:SetPosY(PosY)
  if houseInfoSSWrapper == nil then
    FGlobal_RentHouse_WorkManager_Close()
    return 
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R4 in 'UnsetPending'

  Worker_List._selected_Worker = nil
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R4 in 'UnsetPending'

  Worker_List._selected_WorkerKey = nil
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R4 in 'UnsetPending'

  Worker_List._selected_Index = nil
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R4 in 'UnsetPending'

  Worker_List._over_Index = nil
  houseInfoSS = houseInfoSSWrapper:get()
  houseKey = houseInfoSSWrapper:getHouseKey()
  param = _param
  prevGetWearHouseKey = nil
  Work_List:_setData()
  Work_List:_updateSlot(true)
  Work_List_Select(Work_List._dataIndex_First)
  Work_List:_updateSlot()
  Worker_List:_setData()
  Worker_List:_updateSlot()
  Worker_List_Select(1)
  Worker_List:_updateSlot()
  ;
  (defalut_Control._title):SetText(param._houseName)
  Set_HouseUseType_Texture_BG((defalut_Control._houseInfo)._BG)
  Set_HouseUseType_Texture_Icon((defalut_Control._houseInfo)._UseType_Icon)
  ;
  ((defalut_Control._houseInfo)._UseType_Name):SetText(param._useTypeName)
  ;
  ((defalut_Control._houseInfo)._UseType_Desc):SetAutoResize(true)
  ;
  ((defalut_Control._houseInfo)._UseType_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((defalut_Control._houseInfo)._UseType_Desc):SetText(param._useType_Desc)
end

FGlobal_RentHouse_WorkManager_Close = function()
  -- function num : 0_32
  FGlobal_WorldMapWindowEscape()
end

HandleClick_doWork = function()
  -- function num : 0_33 , upvalues : Worker_List, Inherit_List
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return 
  end
  if Worker_List._selected_Worker == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_RentHouseNoWorkingByWorkerNotSelect"))
    return 
  end
  if Inherit_List._selected_inherit == nil then
    WorldMapPopupManager:increaseLayer(true)
    WorldMapPopupManager:push(Panel_Select_Inherit, true)
    FGlobal_Inherit_List_Open()
  else
    HandleClick_doWork_Continue()
  end
end

HandleClick_doWork_Continue = function()
  -- function num : 0_34 , upvalues : Worker_List, Inherit_List
  if ToClient_WareHouseCheckSealed(Worker_List._selected_Worker, Inherit_List._selected_inherit) == false then
    HandleClick_doWork_Continue_ItemClearWarning()
    return 
  end
  local cancelFunction = function()
    -- function num : 0_34_0 , upvalues : Inherit_List
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

    Inherit_List._selected_inherit = nil
    -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

    Inherit_List._over_Index = nil
    return 
  end

  local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_RENTHOUSE_STAMPING_CLEAR")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageContent, functionYes = HandleClick_doWork_Continue_ItemClearWarning, functionNo = cancelFunction, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

HandleClick_doWork_Continue_ItemClearWarning = function()
  -- function num : 0_35 , upvalues : Inherit_List
  if Inherit_List._selected_inherit == -1 then
    HandleClick_doWork_Confirm()
    return 
  end
  local cancelFunction = function()
    -- function num : 0_35_0 , upvalues : Inherit_List
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

    Inherit_List._selected_inherit = nil
    -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

    Inherit_List._over_Index = nil
    return 
  end

  local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_RENTHOUSE_IMPROVE_ITEMCLEARWARNING")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageContent, functionYes = HandleClick_doWork_Confirm, functionNo = cancelFunction, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

HandleClick_doWork_Confirm = function()
  -- function num : 0_36 , upvalues : Work_List, Inherit_List, houseInfoSS, Worker_List, param, _affiliatedTownKey, post_SelectedWorker
  local workingCount = Work_List._workingCount
  local itemNoRaw = Inherit_List._selected_inherit
  if itemNoRaw ~= nil then
    if houseInfoSS == nil or Work_List._selected_Work == nil or Worker_List._selected_Worker == nil then
      return 
    end
    if param._houseUseType == 11 then
      local warehouseWrapper = warehouse_get(_affiliatedTownKey)
      local itemWrapper = warehouseWrapper:getItemByItemNoRaw(itemNoRaw)
      local hasJewel = false
      local socketMaxCount = ToClient_GetMaxItemSocketCount()
      for jewelIdx = 0, socketMaxCount - 1 do
        local itemEnchantSSW = itemWrapper:getPushedItem(jewelIdx)
        if itemEnchantSSW ~= nil then
          hasJewel = true
          break
        end
      end
      do
        if hasJewel == true then
          local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
          local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_NEWWORDMAP_WORKMANAGER_HOUSE_HASJEWEL")
          local messageboxData = {title = messageTitle, content = messageContent, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData)
          -- DECOMPILER ERROR at PC69: Confused about usage of register: R9 in 'UnsetPending'

          Inherit_List._selected_inherit = nil
          -- DECOMPILER ERROR at PC71: Confused about usage of register: R9 in 'UnsetPending'

          Inherit_List._over_Index = nil
          return 
        end
        do
          local workingType = (CppEnums.NpcWorkingType).eNpcWorkingType_PlantRentHouse
          local houseUseType = param._houseUseType
          local rowIndex = Work_List._selected_Data_Row
          local colIndex = Work_List._selected_Data_Collum
          local itemExchangeKeyRaw = (((Work_List._data_Table)[rowIndex])[colIndex])._exchangeKeyRaw
          local workerNoRaw = Worker_List._selected_WorkerNoRaw
          local workerWrapperLua = getWorkerWrapper(workerNoRaw, true)
          local waypointKey = workerWrapperLua:getHomeWaypoint()
          local workerRepeatCount = workerWrapperLua:getAdditionalRepeatCount(workingType, houseUseType, waypointKey, itemExchangeKeyRaw)
          do
            local isPassCheck = true
            if workerRepeatCount > 0 then
              local resourceCount = #(((Work_List._data_Table)[rowIndex])[colIndex])._resource
              for idx = 1, resourceCount do
                local needCount = (((((Work_List._data_Table)[rowIndex])[colIndex])._resource)[idx])._needCount
                local haveCount = (((((Work_List._data_Table)[rowIndex])[colIndex])._resource)[idx])._haveCount
                local isMaterialFull = haveCount - needCount * (workerRepeatCount + 1) >= 0
                if not isMaterialFull then
                  isPassCheck = false
                  break
                end
              end
            end
            if not isPassCheck then
              Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERMANAGER_REPEATWORK_NEEDMATERIAL"))
              return 
            end
            ToClient_requestStartRentHouseWorkingToNpcWorker(houseInfoSS, Worker_List._selected_Worker, Work_List._selected_Work, workingCount, itemNoRaw)
            FGlobal_RedoWork(0, houseInfoSS, Worker_List._selected_Worker, nil, Work_List._selected_Work, nil, workingCount, itemNoRaw, nil, _affiliatedTownKey)
            post_SelectedWorker = Worker_List._selected_Worker
            FGlobal_RentHouse_WorkManager_Close()
            -- DECOMPILER ERROR: 5 unprocessed JMP targets
          end
        end
      end
    end
  end
end

LimitWorkableCount_House = function()
  -- function num : 0_37 , upvalues : Work_List, Worker_List
  local rowIndex = Work_List._selected_Data_Row
  local collumIndex = Work_List._selected_Data_Collum
  local resourceCount = (((Work_List._data_Table)[rowIndex])[collumIndex])._resourceCount
  local haveCount = {}
  local minHaveCount = ((Worker_List._data_Table)[Worker_List._selected_Index])._currentPoint
  if resourceCount > 1 then
    for i = 1, resourceCount do
      local data = ((((Work_List._data_Table)[rowIndex])[collumIndex])._resource)[i]
      if data._isInheritIndex == false then
        minHaveCount = (math.min)(data._haveCount / data._needCount, minHaveCount)
      end
    end
  else
    do
      do
        local data = ((((Work_List._data_Table)[rowIndex])[collumIndex])._resource)[1]
        minHaveCount = (math.min)(data._haveCount / data._needCount, minHaveCount)
        return (math.max)((math.floor)(minHaveCount), 1)
      end
    end
  end
end

local set_Workable_Count = function(inputNumber)
  -- function num : 0_38 , upvalues : Work_List, defalut_Control
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  Work_List._workingCount = Int64toInt32(inputNumber)
  ;
  ((defalut_Control._work_Estimated)._Time_Count):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_WORKMANAGER_BUILDING_DEFAULT", "getWorkingCount", Work_List._workingCount))
end

HandleClicked_WorkCount_House = function()
  -- function num : 0_39 , upvalues : set_Workable_Count
  local s64_MaxWorkableCount = toInt64(0, 50000)
  if s64_MaxWorkableCount <= toInt64(0, 0) then
    _PA_LOG("이문�\133", "일꾼�\180 작업�\160 �\152 없습니다.")
  else
    Panel_NumberPad_Show(true, s64_MaxWorkableCount, 0, set_Workable_Count, false)
  end
end

Inherit_List = {
_data = {}
, _Item_MaxCount = ((defalut_Control._select_Inherit)._Template)._collumMax, _contentCollum = 0, _offsetIndex = 0, _offset_Max = 0, _slotMax = 0, _selected_inherit = nil}
Inherit_List.SetData = function(self, exchangeKeyRaw, _data_Parent)
  -- function num : 0_40 , upvalues : _affiliatedTownKey
  local haveCount = ToClient_getDynamicEnchantLevelItemListByRentHouse(_affiliatedTownKey, exchangeKeyRaw)
  for index = 1, haveCount do
    local itemNoRaw = ToClient_getDynamicEnchantLevelItemKeyByRentHouse(index - 1)
    local itemWrapper = ToClient_getDynamicEnchantLevelItemWrapper(index - 1)
    local itemESSW = itemWrapper:getStaticStatus()
    local itemStatic = itemESSW:get()
    local itemKey = itemStatic._key
    local enchantLevel = itemKey:getEnchantLevel()
    local itemIcon = "icon/" .. itemESSW:getIconPath()
    local stackCount = 0
    if _affiliatedTownKey ~= 0 then
      stackCount = warehouse_getItemCountByItemNo(_affiliatedTownKey, itemNoRaw)
    end
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R16 in 'UnsetPending'

    ;
    (_data_Parent._inherit)[index] = {_itemNoRaw = itemNoRaw, _itemKey = itemKey, _itemIcon = itemIcon, _enchantLevel = enchantLevel, _stackCount = stackCount, _data_Parent = _data_Parent}
  end
  return haveCount
end

Inherit_List._updateSlot = function(self)
  -- function num : 0_41 , upvalues : defalut_Control, Inherit_List
  local _data = self._data
  if _data == nil then
    return 
  end
  ;
  ((defalut_Control._select_Inherit)._Slider):SetInterval(self._offset_Max)
  for idx = 1, self._Item_MaxCount do
    local index = self._offsetIndex + idx
    if _data[index] ~= nil then
      local icon = (_data[index])._itemIcon
      local enchantLevel = (_data[index])._enchantLevel
      local gradeType = ((((_data[index])._data_Parent)._resource)[1])._gradeType
      ;
      (((defalut_Control._select_Inherit)._Icon)[idx]):ChangeTextureInfoName(icon)
      if enchantLevel > 0 then
        local printenchantLevel = ""
        if enchantLevel > 0 and enchantLevel < 15 then
          printenchantLevel = "+" .. tostring(enchantLevel)
        else
          if enchantLevel == 15 then
            printenchantLevel = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1")
          else
            if enchantLevel == 16 then
              printenchantLevel = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2")
            else
              if enchantLevel == 17 then
                printenchantLevel = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3")
              else
                if enchantLevel == 18 then
                  printenchantLevel = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4")
                else
                  if enchantLevel == 19 then
                    printenchantLevel = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
                  else
                    if enchantLevel >= 20 then
                      printenchantLevel = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5")
                    end
                  end
                end
              end
            end
          end
        end
        ;
        (((defalut_Control._select_Inherit)._Enchant_Level)[idx]):SetText(printenchantLevel)
        ;
        (((defalut_Control._select_Inherit)._Enchant_Level)[idx]):SetShow(true)
      else
        do
          ;
          (((defalut_Control._select_Inherit)._Enchant_Level)[idx]):SetShow(false)
          if gradeType > 0 and gradeType <= #(UI.itemSlotConfig).borderTexture then
            (((defalut_Control._select_Inherit)._Icon_Border)[idx]):ChangeTextureInfoName((((UI.itemSlotConfig).borderTexture)[gradeType]).texture)
            local x1, y1, x2, y2 = setTextureUV_Func(((defalut_Control._select_Inherit)._Icon_Border)[idx], (((UI.itemSlotConfig).borderTexture)[gradeType]).x1, (((UI.itemSlotConfig).borderTexture)[gradeType]).y1, (((UI.itemSlotConfig).borderTexture)[gradeType]).x2, (((UI.itemSlotConfig).borderTexture)[gradeType]).y2)
            ;
            ((((defalut_Control._select_Inherit)._Icon_Border)[idx]):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (((defalut_Control._select_Inherit)._Icon_Border)[idx]):setRenderTexture((((defalut_Control._select_Inherit)._Icon_Border)[idx]):getBaseTexture())
            ;
            (((defalut_Control._select_Inherit)._Icon_Border)[idx]):SetShow(true)
          else
            do
              do
                do
                  ;
                  (((defalut_Control._select_Inherit)._Icon_Border)[idx]):SetShow(false)
                  ;
                  (((defalut_Control._select_Inherit)._Icon_BG)[idx]):SetShow(true)
                  ;
                  (((defalut_Control._select_Inherit)._Icon_Over)[idx]):SetShow(true)
                  ;
                  (((defalut_Control._select_Inherit)._Icon)[idx]):SetShow(true)
                  ;
                  (((defalut_Control._select_Inherit)._Icon_BG)[idx]):SetShow(false)
                  ;
                  (((defalut_Control._select_Inherit)._Icon)[idx]):SetShow(false)
                  ;
                  (((defalut_Control._select_Inherit)._Enchant_Level)[idx]):SetShow(false)
                  ;
                  (((defalut_Control._select_Inherit)._Icon_Over)[idx]):SetShow(false)
                  ;
                  (((defalut_Control._select_Inherit)._Icon_Border)[idx]):SetShow(false)
                  -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC264: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  UISlider_SetButtonSize((defalut_Control._select_Inherit)._Slider, self._Item_MaxCount, self._contentCollum)
  if ((defalut_Control._select_Inherit)._Slider):GetShow() then
    ((defalut_Control._select_Inherit)._Line_2):SetShow(false)
    ;
    ((defalut_Control._select_Inherit)._Slider):SetControlPos(self._offsetIndex / self._offset_Max * 100)
  else
    ;
    ((defalut_Control._select_Inherit)._Line_2):SetShow(true)
  end
  HandleOn_Inherit_Item_Tooltip(Inherit_List._over_Index)
end

FGlobal_Inherit_List_Open = function()
  -- function num : 0_42 , upvalues : Inherit_List, Work_List
  local self = Inherit_List
  local rowIndex = Work_List._selected_Data_Row
  local collumIndex = Work_List._selected_Data_Collum
  local _data = ((Work_List._data_Table)[rowIndex])[collumIndex]
  if _data == nil then
    return 
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R4 in 'UnsetPending'

  Inherit_List._data = _data._inherit
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R4 in 'UnsetPending'

  Inherit_List._contentCollum = #_data._inherit
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R4 in 'UnsetPending'

  Inherit_List._offsetIndex = 0
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R4 in 'UnsetPending'

  Inherit_List._offset_Max = Inherit_List._contentCollum - Inherit_List._Item_MaxCount
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R4 in 'UnsetPending'

  Inherit_List._slotMax = Inherit_List._contentCollum
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R4 in 'UnsetPending'

  if Inherit_List._offset_Max < 0 then
    Inherit_List._offset_Max = 0
  else
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R4 in 'UnsetPending'

    Inherit_List._slotMax = Inherit_List._Item_MaxCount
  end
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R4 in 'UnsetPending'

  Inherit_List._selected_inherit = nil
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R4 in 'UnsetPending'

  Inherit_List._over_Index = nil
  Inherit_List:_updateSlot()
end

HandleClick_Inherit_Item = function(idx)
  -- function num : 0_43 , upvalues : Inherit_List
  local itemIndex = Inherit_List._offsetIndex + idx
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  Inherit_List._selected_inherit = ((Inherit_List._data)[itemIndex])._itemNoRaw
  HandleClick_doWork_Continue()
  WorldMapPopupManager:pop()
end

HandleOn_Inherit_Item_Tooltip = function(idx)
  -- function num : 0_44 , upvalues : Inherit_List, Work_List, _affiliatedTownKey, defalut_Control
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  if idx ~= nil then
    Inherit_List._over_Index = idx
  else
    return 
  end
  local itemIndex = Inherit_List._offsetIndex + idx
  if (Inherit_List._data)[itemIndex] == nil then
    HandleOut_Inherit_Item_Tooltip()
    return 
  end
  local rowIndex = Work_List._selected_Data_Row
  local collumIndex = Work_List._selected_Data_Collum
  local exchangeKeyRaw = (((Work_List._data_Table)[rowIndex])[collumIndex])._exchangeKeyRaw
  local haveCount = ToClient_getDynamicEnchantLevelItemListByRentHouse(_affiliatedTownKey, exchangeKeyRaw)
  local itemWrapper = ToClient_getDynamicEnchantLevelItemWrapper(itemIndex - 1)
  local uiBase = ((defalut_Control._select_Inherit)._Icon_BG)[idx]
  Panel_Tooltip_Item_Show(itemWrapper, uiBase, false, true)
end

HandleOut_Inherit_Item_Tooltip = function()
  -- function num : 0_45 , upvalues : Inherit_List
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  Inherit_List._over_Index = nil
  Panel_Tooltip_Item_hideTooltip()
end

FromClient_House_StopWork = function()
  -- function num : 0_46 , upvalues : Worker_List
  if Panel_RentHouse_WorkManager:GetShow() then
    Worker_List:_setData()
    Worker_List:_updateSlot()
    if Worker_List._selected_Index == nil then
      Worker_List_Select(1)
    end
  end
end

FGlobal_HouseCraft_WorkManager_Refresh = function()
  -- function num : 0_47 , upvalues : Work_List
  local index = nil
  local offsetIndex = Work_List._offsetIndex
  for key,value in pairs(Work_List._dataIndex) do
    if value._rowIndex == Work_List._selected_Data_Row and value._collumIndex == Work_List._selected_Data_Collum then
      index = key
      break
    end
  end
  do
    Work_List:_setData()
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

    Work_List._offsetIndex = offsetIndex
    Work_List:_updateSlot()
    if index ~= nil then
      Work_List_Select(index)
    else
      Work_List_Select(Work_List._dataIndex_First)
    end
    Work_Info_Update()
    Work_Estimated_Update()
  end
end

FromClient_WareHouse_Update_ForHouseCraft = function(affiliatedTownKey)
  -- function num : 0_48 , upvalues : prevGetWearHouseKey, _affiliatedTownKey
  if prevGetWearHouseKey == affiliatedTownKey then
    return 
  end
  prevGetWearHouseKey = affiliatedTownKey
  if affiliatedTownKey == _affiliatedTownKey and Panel_RentHouse_WorkManager:GetShow() == true then
    FGlobal_HouseCraft_WorkManager_Refresh()
  end
end

registerEvent("EventWarehouseUpdate", "FromClient_WareHouse_Update_ForHouseCraft")
registerEvent("WorldMap_StopWorkerWorking", "FromClient_House_StopWork")

