-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\uicontrolbar\panel_uicontrol.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local VCK = CppEnums.VirtualKeyCode
local UI_IT = CppEnums.UiInputType
Panel_UIControl:SetShow(false)
Panel_UIControl:RegisterShowEventFunc(true, "UI_Control_ShowAni()")
Panel_UIControl:RegisterShowEventFunc(false, "UI_Control_HideAni()")
UI_Control_ShowAni = function()
  -- function num : 0_0
  Panel_UIControl:SetShow(true)
end

UI_Control_HideAni = function()
  -- function num : 0_1
  Panel_UIControl:SetShow(false)
end

local expText = (UI.getChildControl)(Panel_SelfPlayerExpGage, "StaticText_EXPText")
local mainBarText = (UI.getChildControl)(Panel_MainStatus_User_Bar, "StaticText_MainBarText")
local quickSlotText = (UI.getChildControl)(Panel_QuickSlot, "StaticText_quickSlot")
local questListText = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_questText")
local fieldViewText = (UI.getChildControl)(Panel_FieldViewMode, "StaticText_viewModeText")
local raderText = (UI.getChildControl)(Panel_Radar, "StaticText_raderText")
local npcNaviText = (UI.getChildControl)(Panel_NpcNavi, "StaticText_npcNaviText")
local pvpText = (UI.getChildControl)(Panel_PvpMode, "StaticText_pvpText")
local servantText = (UI.getChildControl)(Panel_Window_Servant, "StaticText_servantText")
local questResizeButton = (UI.getChildControl)(Panel_CheckedQuest, "Button_Size")
Movable_UI = function()
  -- function num : 0_2 , upvalues : mainBarText, quickSlotText, servantText, pvpText, npcNaviText, questResizeButton, fieldViewText
  mainBarText:SetShow(false)
  Panel_MainStatus_User_Bar:SetIgnore(false)
  Panel_MainStatus_User_Bar:SetDragEnable(true)
  Panel_MainStatus_User_Bar:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  PaGlobalAppliedBuffList:setMovableUIForControlMode()
  quickSlotText:SetShow(false)
  Panel_QuickSlot:SetIgnore(false)
  Panel_QuickSlot:SetDragEnable(true)
  Panel_QuickSlot:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  servantText:SetShow(false)
  Panel_Window_Servant:SetDragEnable(true)
  Panel_Window_Servant:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  pvpText:SetShow(false)
  Panel_PvpMode:SetIgnore(false)
  _pvpButton:SetIgnore(true)
  Panel_PvpMode:SetDragEnable(true)
  Panel_PvpMode:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  Panel_ClassResource:SetIgnore(false)
  Panel_ClassResource:SetDragEnable(true)
  Panel_ClassResource:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  npcNaviText:SetShow(false)
  Panel_NpcNavi:SetDragEnable(true)
  Panel_Party:SetDragAll(true)
  Panel_Party:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  FGlobal_Panel_Radar_Movable_UI()
  Panel_CheckedQuest:SetDragEnable(true)
  Panel_CheckedQuest:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  questResizeButton:SetShow(true)
  Panel_NewEquip:SetDragAll(true)
  fieldViewText:SetShow(false)
  Panel_FieldViewMode:SetIgnore(false)
  Panel_FieldViewMode:SetDragAll(true)
  Panel_FieldViewMode:SetDragEnable(true)
  Panel_FieldViewMode:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  Panel_SkillCommand:SetIgnore(false)
  Panel_SkillCommand:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_isWidget.dds")
  FGlobal_SetMovableMode(true)
end

Movable_UI_Cancel = function()
  -- function num : 0_3 , upvalues : mainBarText, quickSlotText, pvpText, npcNaviText, questResizeButton, servantText, fieldViewText
  mainBarText:SetShow(false)
  Panel_MainStatus_User_Bar:SetIgnore(true)
  Panel_MainStatus_User_Bar:SetDragEnable(false)
  Panel_MainStatus_User_Bar:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
  MainStatusBar_PosX = Panel_MainStatus_User_Bar:GetPosX()
  MainStatusBar_PosY = Panel_MainStatus_User_Bar:GetPosY()
  quickSlotText:SetShow(false)
  Panel_QuickSlot:SetIgnore(true)
  Panel_QuickSlot:SetDragEnable(false)
  Panel_QuickSlot:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
  Panel_ClassResource:SetIgnore(true)
  Panel_ClassResource:SetDragEnable(false)
  Panel_ClassResource:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
  pvpText:SetShow(false)
  Panel_PvpMode:SetIgnore(true)
  Panel_PvpMode:SetDragEnable(false)
  _pvpButton:SetIgnore(false)
  Panel_PvpMode:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
  npcNaviText:SetShow(false)
  Panel_NpcNavi:SetDragEnable(false)
  FGlobal_Panel_Radar_Movable_UI_Cancel()
  Panel_CheckedQuest:SetDragEnable(false)
  Panel_CheckedQuest:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
  questResizeButton:SetShow(false)
  Panel_NewEquip:SetDragAll(false)
  PaGlobalAppliedBuffList:cancelMovableUIForControlMode()
  servantText:SetShow(false)
  Panel_Window_Servant:SetDragEnable(false)
  Panel_Window_Servant:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
  local temporaryWrapper = getTemporaryInformationWrapper()
  if temporaryWrapper == nil or temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle) == nil and temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship) == nil and temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Pet) == nil then
    Panel_Window_Servant:SetShow(false)
  end
  fieldViewText:SetShow(false)
  Panel_FieldViewMode:SetIgnore(true)
  Panel_FieldViewMode:SetDragAll(false)
  Panel_FieldViewMode:SetDragEnable(false)
  Panel_FieldViewMode:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
  Panel_Party:SetDragEnable(false)
  Panel_Party:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
  Panel_SkillCommand:SetIgnore(true)
  Panel_SkillCommand:ChangeTextureInfoName("New_UI_Common_forLua/Default/window_sample_empty.dds")
  FGlobal_SetMovableMode(false)
end

Panel_UIControl_SetShow = function(bShow)
  -- function num : 0_4
  if bShow == Panel_UIControl:GetShow() then
    return 
  end
  if bShow then
    FieldViewMode_ShowToggle(true)
    Panel_UIControl:SetShow(true, true)
    Movable_UI()
    ResetPos_WidgetButton()
  else
    FieldViewMode_ShowToggle(false)
    SelfPlayerStatusBar_RefleshPosition()
    Movable_UI_Cancel()
    Panel_UIControl:SetShow(false, true)
    ResetPos_WidgetButton()
  end
end


