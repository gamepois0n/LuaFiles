-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ui_setting\panel_ui_setting.luac 

-- params : ...
-- function num : 0
Panel_UI_Setting:SetShow(false)
local UI_TM = CppEnums.TextMode
local renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_UISetting}, false)
local UiSet = {title = (UI.getChildControl)(Panel_UI_Setting, "StaticText_Title"), main_BG = (UI.getChildControl)(Panel_UI_Setting, "Static_MainBG"), btn_Win_Close = (UI.getChildControl)(Panel_UI_Setting, "Button_Win_Close"), btn_save = (UI.getChildControl)(Panel_UI_Setting, "Button_Save"), btn_cancel = (UI.getChildControl)(Panel_UI_Setting, "Button_Cancel"), btn_reset = (UI.getChildControl)(Panel_UI_Setting, "Button_Reset"), bg_Grid = (UI.getChildControl)(Panel_UI_Setting, "Static_Grid"), btn_FieldView = (UI.getChildControl)(Panel_UI_Setting, "CheckButton_FieldView"), btn_QuickSlotMagnetic = (UI.getChildControl)(Panel_UI_Setting, "CheckButton_QuickSlot"), chk_GridView = (UI.getChildControl)(Panel_UI_Setting, "CheckButton_GridView"), txt_UISize = (UI.getChildControl)(Panel_UI_Setting, "StaticText_UISize"), txt_UI_LOW = (UI.getChildControl)(Panel_UI_Setting, "StaticText_UI_LOW"), txt_UI_HIGH = (UI.getChildControl)(Panel_UI_Setting, "StaticText_UI_HIGH"), slider_UI_Scale = (UI.getChildControl)(Panel_UI_Setting, "Slider_UI_Scaling"), txt_UIFreeSet = (UI.getChildControl)(Panel_UI_Setting, "StaticText_FreeSet"), btn_UIFreeSet1 = (UI.getChildControl)(Panel_UI_Setting, "Button_UI1"), btn_UIFreeSet2 = (UI.getChildControl)(Panel_UI_Setting, "Button_UI2"), btn_UIFreeSet3 = (UI.getChildControl)(Panel_UI_Setting, "Button_UI3"), btn_SaveUIFreeSet = (UI.getChildControl)(Panel_UI_Setting, "Button_SaveFreeSet"), panelCount = 0, 
panelPool = {}
, preScale = 0, currentScale = 100, minScale = 50, maxScale = 120, replaceScale = 0, nowCurrentPercent = 0, saveScale = 100}
local UiSave = {txt_Desc = (UI.getChildControl)(Panel_SaveFreeSet, "StaticText_Desc"), btn_SaveClose = (UI.getChildControl)(Panel_SaveFreeSet, "Button_Win_Close"), btn_SaveDefault = (UI.getChildControl)(Panel_SaveFreeSet, "Button_DefaultUI"), btn_SaveUI1 = (UI.getChildControl)(Panel_SaveFreeSet, "Button_UI1"), btn_SaveUI2 = (UI.getChildControl)(Panel_SaveFreeSet, "Button_UI2"), btn_SaveUI3 = (UI.getChildControl)(Panel_SaveFreeSet, "Button_UI3"), bg_Block = (UI.getChildControl)(Panel_SaveFreeSet, "Static_Block")}
;
(UiSave.txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
UiSet.btn_Scale = (UI.getChildControl)(UiSet.slider_UI_Scale, "Slider_UI_Scaling_Button")
;
(UiSave.txt_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SAVEFREESET_DESC"))
;
(UiSet.btn_QuickSlotMagnetic):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_UISETTING_QUICKSLOT_MAGNETIC"))
;
(UiSet.btn_FieldView):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_UI_SETTING_CHKBTN_FIELDVIEW"))
;
(UiSet.chk_GridView):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_UISETTING_GRIDVIEW"))
;
(UiSet.title):AddChild(UiSet.main_BG)
;
(UiSet.title):AddChild(UiSet.btn_save)
;
(UiSet.title):AddChild(UiSet.btn_cancel)
;
(UiSet.title):AddChild(UiSet.btn_reset)
;
(UiSet.title):AddChild(UiSet.btn_FieldView)
;
(UiSet.title):AddChild(UiSet.chk_GridView)
;
(UiSet.title):AddChild(UiSet.btn_QuickSlotMagnetic)
;
(UiSet.title):AddChild(UiSet.txt_UIFreeSet)
;
(UiSet.title):AddChild(UiSet.txt_UISize)
;
(UiSet.title):AddChild(UiSet.txt_UI_LOW)
;
(UiSet.title):AddChild(UiSet.txt_UI_HIGH)
;
(UiSet.title):AddChild(UiSet.slider_UI_Scale)
;
(UiSet.title):AddChild(UiSet.btn_UIFreeSet1)
;
(UiSet.title):AddChild(UiSet.btn_UIFreeSet2)
;
(UiSet.title):AddChild(UiSet.btn_UIFreeSet3)
;
(UiSet.title):AddChild(UiSet.btn_SaveUIFreeSet)
;
(UiSet.title):AddChild(UiSet.btn_Win_Close)
Panel_UI_Setting:RemoveControl(UiSet.main_BG)
Panel_UI_Setting:RemoveControl(UiSet.btn_save)
Panel_UI_Setting:RemoveControl(UiSet.btn_cancel)
Panel_UI_Setting:RemoveControl(UiSet.btn_reset)
Panel_UI_Setting:RemoveControl(UiSet.btn_FieldView)
Panel_UI_Setting:RemoveControl(UiSet.chk_GridView)
Panel_UI_Setting:RemoveControl(UiSet.btn_QuickSlotMagnetic)
Panel_UI_Setting:RemoveControl(UiSet.txt_UIFreeSet)
Panel_UI_Setting:RemoveControl(UiSet.txt_UISize)
Panel_UI_Setting:RemoveControl(UiSet.txt_UI_LOW)
Panel_UI_Setting:RemoveControl(UiSet.txt_UI_HIGH)
Panel_UI_Setting:RemoveControl(UiSet.slider_UI_Scale)
Panel_UI_Setting:RemoveControl(UiSet.btn_UIFreeSet1)
Panel_UI_Setting:RemoveControl(UiSet.btn_UIFreeSet2)
Panel_UI_Setting:RemoveControl(UiSet.btn_UIFreeSet3)
Panel_UI_Setting:RemoveControl(UiSet.btn_SaveUIFreeSet)
Panel_UI_Setting:RemoveControl(UiSet.btn_Win_Close)
;
(UiSet.main_BG):ComputePos()
;
(UiSet.title):ComputePos()
;
(UiSet.btn_save):ComputePos()
;
(UiSet.btn_cancel):ComputePos()
;
(UiSet.btn_reset):ComputePos()
;
(UiSet.btn_FieldView):ComputePos()
;
(UiSet.chk_GridView):ComputePos()
;
(UiSet.btn_QuickSlotMagnetic):ComputePos()
;
(UiSet.txt_UIFreeSet):ComputePos()
;
(UiSet.txt_UISize):ComputePos()
;
(UiSet.txt_UI_LOW):ComputePos()
;
(UiSet.txt_UI_HIGH):ComputePos()
;
(UiSet.slider_UI_Scale):ComputePos()
;
(UiSet.btn_UIFreeSet1):ComputePos()
;
(UiSet.btn_UIFreeSet2):ComputePos()
;
(UiSet.btn_UIFreeSet3):ComputePos()
;
(UiSet.btn_SaveUIFreeSet):ComputePos()
;
(UiSet.btn_Win_Close):ComputePos()
;
(UiSet.btn_FieldView):SetEnableArea(0, 0, (UiSet.btn_FieldView):GetTextSizeX() + 25, (UiSet.btn_FieldView):GetSizeY())
;
(UiSet.btn_QuickSlotMagnetic):SetEnableArea(0, 0, (UiSet.btn_QuickSlotMagnetic):GetTextSizeX() + 25, (UiSet.btn_QuickSlotMagnetic):GetSizeY())
;
(UiSet.chk_GridView):SetEnableArea(0, 0, (UiSet.chk_GridView):GetTextSizeX() + 25, (UiSet.chk_GridView):GetSizeY())
local Template = {static_able = (UI.getChildControl)(Panel_UI_Setting, "Static_Able"), static_disAble = (UI.getChildControl)(Panel_UI_Setting, "Static_DisAble"), btn_close = (UI.getChildControl)(Panel_UI_Setting, "Button_Close")}
;
(Template.static_able):SetShow(false)
;
(Template.static_disAble):SetShow(false)
;
(Template.btn_close):SetShow(false)
local original_MouseX = 0
local original_MouseY = 0
local original_controlPosX = 0
local original_controlPosY = 0
local posGapX = 0
local posGapY = 0
local isLargePartyOpen = ToClient_IsContentsGroupOpen("286")
local closePanelState = {[0] = false, [1] = false, [2] = false, [3] = false, [4] = false}
local closeEmptyPanelState = {[0] = false, [1] = false, [2] = false, [3] = false, [4] = false}
local panelID = {ExpGage = 1, ServantIcon = 2, Radar = 3, Quest = 4, Chat0 = 5, Chat1 = 6, Chat2 = 7, Chat3 = 8, Chat4 = 9, GameTip = 10, QuickSlot = 11, HPBar = 12, Pvp = 13, ClassResource = 14, Adrenallin = 15, UIMain = 16, House = 17, NewEquip = 18, Party = 19, TimeBar = 20, ActionGuide = 21, KeyGuide = 22, NewQuickSlot0 = 23, NewQuickSlot1 = 24, NewQuickSlot2 = 25, NewQuickSlot3 = 26, NewQuickSlot4 = 27, NewQuickSlot5 = 28, NewQuickSlot6 = 29, NewQuickSlot7 = 30, NewQuickSlot8 = 31, NewQuickSlot9 = 32, NewQuickSlot10 = 33, NewQuickSlot11 = 34, NewQuickSlot12 = 35, NewQuickSlot13 = 36, NewQuickSlot14 = 37, NewQuickSlot15 = 38, NewQuickSlot16 = 39, NewQuickSlot17 = 40, NewQuickSlot18 = 41, NewQuickSlot19 = 42, SkillCoolTime = 43, MainQuest = 44, LargeParty = 45}
local panelControl = {}
if CppDefine.ChangeUIAndResolution == true then
  panelControl = {
[panelID.ExpGage] = {control = Panel_SelfPlayerExpGage, posFixed = true, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_SelfPlayer_ExpGage, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_1"), isShow = true}
, 
[panelID.ServantIcon] = {control = Panel_Window_Servant, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_ServantWindow, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_2"), isShow = true}
, 
[panelID.Radar] = {control = Panel_Radar, posFixed = true, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_RadarMap, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_3"), isShow = true}
, 
[panelID.Quest] = {control = Panel_CheckedQuest, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_CheckedQuest, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_4"), isShow = true}
, 
[panelID.Chat0] = {control = Panel_Chat0, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_5"), isShow = true}
, 
[panelID.Chat1] = {control = Panel_Chat1, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_6"), isShow = false}
, 
[panelID.Chat2] = {control = Panel_Chat2, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_7"), isShow = false}
, 
[panelID.Chat3] = {control = Panel_Chat3, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_8"), isShow = false}
, 
[panelID.Chat4] = {control = Panel_Chat4, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_9"), isShow = false}
, 
[panelID.GameTip] = {control = Panel_GameTips, posFixed = true, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_GameTips, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_10"), isShow = true}
, 
[panelID.QuickSlot] = {control = Panel_QuickSlot, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_QuickSlot, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_11"), isShow = true}
, 
[panelID.HPBar] = {control = Panel_MainStatus_User_Bar, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_12"), isShow = false}
, 
[panelID.Pvp] = {control = Panel_PvpMode, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_PvpMode, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_13"), isShow = true}
, 
[panelID.ClassResource] = {control = Panel_ClassResource, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_14"), isShow = true}
, 
[panelID.Adrenallin] = {control = Panel_Adrenallin, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_Adrenallin, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_15"), isShow = true}
, 
[panelID.UIMain] = {control = Panel_UIMain, posFixed = true, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_UIMenu, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_16"), isShow = true}
, 
[panelID.House] = {control = Panel_MyHouseNavi, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_MyHouseNavi, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_17"), isShow = true}
, 
[panelID.NewEquip] = {control = Panel_NewEquip, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewEquipment, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_18"), isShow = true}
, 
[panelID.Party] = {control = Panel_Party, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_Party, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_19"), isShow = true}
, 
[panelID.TimeBar] = {control = Panel_TimeBar, posFixed = true, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_TimeBar, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_20"), isShow = true}
, 
[panelID.ActionGuide] = {control = Panel_SkillCommand, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_21"), isShow = true}
, 
[panelID.KeyGuide] = {control = Panel_Movie_KeyViewer, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_KeyViewer, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_22"), isShow = false}
, 
[panelID.NewQuickSlot0] = {control = Panel_NewQuickSlot_0, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_0, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_1"), isShow = false}
, 
[panelID.NewQuickSlot1] = {control = Panel_NewQuickSlot_1, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_1, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_2"), isShow = false}
, 
[panelID.NewQuickSlot2] = {control = Panel_NewQuickSlot_2, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_2, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_3"), isShow = false}
, 
[panelID.NewQuickSlot3] = {control = Panel_NewQuickSlot_3, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_3, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_4"), isShow = false}
, 
[panelID.NewQuickSlot4] = {control = Panel_NewQuickSlot_4, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_4, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_5"), isShow = false}
, 
[panelID.NewQuickSlot5] = {control = Panel_NewQuickSlot_5, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_5, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_6"), isShow = false}
, 
[panelID.NewQuickSlot6] = {control = Panel_NewQuickSlot_6, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_6, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_7"), isShow = false}
, 
[panelID.NewQuickSlot7] = {control = Panel_NewQuickSlot_7, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_7, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_8"), isShow = false}
, 
[panelID.NewQuickSlot8] = {control = Panel_NewQuickSlot_8, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_8, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_9"), isShow = false}
, 
[panelID.NewQuickSlot9] = {control = Panel_NewQuickSlot_9, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_9, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_10"), isShow = false}
, 
[panelID.NewQuickSlot10] = {control = Panel_NewQuickSlot_10, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_10, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_11"), isShow = false}
, 
[panelID.NewQuickSlot11] = {control = Panel_NewQuickSlot_11, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_11, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_12"), isShow = false}
, 
[panelID.NewQuickSlot12] = {control = Panel_NewQuickSlot_12, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_12, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_13"), isShow = false}
, 
[panelID.NewQuickSlot13] = {control = Panel_NewQuickSlot_13, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_13, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_14"), isShow = false}
, 
[panelID.NewQuickSlot14] = {control = Panel_NewQuickSlot_14, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_14, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_15"), isShow = false}
, 
[panelID.NewQuickSlot15] = {control = Panel_NewQuickSlot_15, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_15, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_16"), isShow = false}
, 
[panelID.NewQuickSlot16] = {control = Panel_NewQuickSlot_16, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_16, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_17"), isShow = false}
, 
[panelID.NewQuickSlot17] = {control = Panel_NewQuickSlot_17, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_17, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_18"), isShow = false}
, 
[panelID.NewQuickSlot18] = {control = Panel_NewQuickSlot_18, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_18, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_19"), isShow = false}
, 
[panelID.NewQuickSlot19] = {control = Panel_NewQuickSlot_19, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_19, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_20"), isShow = false}
, 
[panelID.SkillCoolTime] = {control = Panel_SkillCooltime, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_SkillCoolTime, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UISETTING_SKILLCOOLTIME"), isShow = false}
, 
[panelID.MainQuest] = {control = Panel_MainQuest, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_MainQuest, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_MAINQUEST_TITLE"), isShow = false}
, 
[panelID.LargeParty] = {control = Panel_LargeParty, posFixed = false, isChange = false, PAGameUIType = (CppEnums.PAGameUIType).PAGameUIPanel_LargeParty, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_LARGEPARTY_TITLE"), isShow = true}
}
else
  panelControl = {
[panelID.ExpGage] = {control = Panel_SelfPlayerExpGage, posFixed = true, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_1"), isShow = true}
, 
[panelID.ServantIcon] = {control = Panel_Window_Servant, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_2"), isShow = true}
, 
[panelID.Radar] = {control = Panel_Radar, posFixed = true, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_3"), isShow = true}
, 
[panelID.Quest] = {control = Panel_CheckedQuest, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_4"), isShow = true}
, 
[panelID.Chat0] = {control = Panel_Chat0, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_5"), isShow = true}
, 
[panelID.Chat1] = {control = Panel_Chat1, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_6"), isShow = false}
, 
[panelID.Chat2] = {control = Panel_Chat2, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_7"), isShow = false}
, 
[panelID.Chat3] = {control = Panel_Chat3, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_8"), isShow = false}
, 
[panelID.Chat4] = {control = Panel_Chat4, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_9"), isShow = false}
, 
[panelID.GameTip] = {control = Panel_GameTips, posFixed = true, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_10"), isShow = true}
, 
[panelID.QuickSlot] = {control = Panel_QuickSlot, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_11"), isShow = true}
, 
[panelID.HPBar] = {control = Panel_MainStatus_User_Bar, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_12"), isShow = false}
, 
[panelID.Pvp] = {control = Panel_PvpMode, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_13"), isShow = true}
, 
[panelID.ClassResource] = {control = Panel_ClassResource, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_14"), isShow = true}
, 
[panelID.Adrenallin] = {control = Panel_Adrenallin, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_15"), isShow = true}
, 
[panelID.UIMain] = {control = Panel_UIMain, posFixed = true, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_16"), isShow = true}
, 
[panelID.House] = {control = Panel_MyHouseNavi, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_17"), isShow = true}
, 
[panelID.NewEquip] = {control = Panel_NewEquip, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_18"), isShow = true}
, 
[panelID.Party] = {control = Panel_Party, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_19"), isShow = true}
, 
[panelID.TimeBar] = {control = Panel_TimeBar, posFixed = true, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_20"), isShow = true}
, 
[panelID.ActionGuide] = {control = Panel_SkillCommand, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_21"), isShow = true}
, 
[panelID.KeyGuide] = {control = Panel_Movie_KeyViewer, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANELCONTROL_22"), isShow = false}
, 
[panelID.NewQuickSlot0] = {control = Panel_NewQuickSlot_0, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_1"), isShow = false}
, 
[panelID.NewQuickSlot1] = {control = Panel_NewQuickSlot_1, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_2"), isShow = false}
, 
[panelID.NewQuickSlot2] = {control = Panel_NewQuickSlot_2, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_3"), isShow = false}
, 
[panelID.NewQuickSlot3] = {control = Panel_NewQuickSlot_3, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_4"), isShow = false}
, 
[panelID.NewQuickSlot4] = {control = Panel_NewQuickSlot_4, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_5"), isShow = false}
, 
[panelID.NewQuickSlot5] = {control = Panel_NewQuickSlot_5, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_6"), isShow = false}
, 
[panelID.NewQuickSlot6] = {control = Panel_NewQuickSlot_6, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_7"), isShow = false}
, 
[panelID.NewQuickSlot7] = {control = Panel_NewQuickSlot_7, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_8"), isShow = false}
, 
[panelID.NewQuickSlot8] = {control = Panel_NewQuickSlot_8, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_9"), isShow = false}
, 
[panelID.NewQuickSlot9] = {control = Panel_NewQuickSlot_9, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_10"), isShow = false}
, 
[panelID.NewQuickSlot10] = {control = Panel_NewQuickSlot_10, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_11"), isShow = false}
, 
[panelID.NewQuickSlot11] = {control = Panel_NewQuickSlot_11, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_12"), isShow = false}
, 
[panelID.NewQuickSlot12] = {control = Panel_NewQuickSlot_12, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_13"), isShow = false}
, 
[panelID.NewQuickSlot13] = {control = Panel_NewQuickSlot_13, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_14"), isShow = false}
, 
[panelID.NewQuickSlot14] = {control = Panel_NewQuickSlot_14, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_15"), isShow = false}
, 
[panelID.NewQuickSlot15] = {control = Panel_NewQuickSlot_15, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_16"), isShow = false}
, 
[panelID.NewQuickSlot16] = {control = Panel_NewQuickSlot_16, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_17"), isShow = false}
, 
[panelID.NewQuickSlot17] = {control = Panel_NewQuickSlot_17, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_18"), isShow = false}
, 
[panelID.NewQuickSlot18] = {control = Panel_NewQuickSlot_18, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_19"), isShow = false}
, 
[panelID.NewQuickSlot19] = {control = Panel_NewQuickSlot_19, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_QUICKSLOT_20"), isShow = false}
, 
[panelID.SkillCoolTime] = {control = Panel_SkillCooltime, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UISETTING_SKILLCOOLTIME"), isShow = false}
, 
[panelID.MainQuest] = {control = Panel_MainQuest, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_MAINQUEST_TITLE"), isShow = false}
, 
[panelID.LargeParty] = {control = Panel_LargeParty, posFixed = false, 
prePos = {x = 0, y = 0}
, name = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_LARGEPARTY_TITLE"), isShow = true}
}
end
UiSet.panelCount = #panelControl
PAGlobal_setIsChangePanelState = function(index, state, ischatPanel)
  -- function num : 0_0 , upvalues : UiSet, panelControl
  if ischatPanel == false then
    for idx = 1, UiSet.panelCount do
      -- DECOMPILER ERROR at PC15: Confused about usage of register: R7 in 'UnsetPending'

      if (panelControl[idx]).PAGameUIType == index then
        (panelControl[idx]).isChange = sate
        return 
      end
    end
  else
    do
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (panelControl[index]).isChange = state
    end
  end
end

PAGlobal_setPanelChattingPoolRelativeSize = function(index, sizex, sizey)
  -- function num : 0_1 , upvalues : UiSet, panelID, panelControl
  local scale = UiSet.currentScale / 100
  local preScale = UiSet.preScale
  local currentScreenSize = {x = getScreenSizeX(), y = getScreenSizeY()}
  index = index + panelID.Chat0
  local slot = (panelControl[index]).control
  local posX = slot:GetPosX()
  local posY = slot:GetPosY()
  local rateX = 0
  local rateY = 0
  if CppDefine.ChangeUIAndResolution == true then
    rateX = posX + slot:GetSizeX() / 2
    rateY = posY + slot:GetSizeY() / 2
    if (panelControl[index]).isChange == false then
      ((panelControl[index]).control):SetRelativePosX(0)
      ;
      ((panelControl[index]).control):SetRelativePosY(0)
      slot:SetRelativePosX(0)
      slot:SetRelativePosY(0)
    else
      ;
      ((panelControl[index]).control):SetRelativePosX((rateX) / currentScreenSize.x)
      ;
      ((panelControl[index]).control):SetRelativePosY((rateY) / currentScreenSize.y)
      slot:SetRelativePosX((rateX) / currentScreenSize.x)
      slot:SetRelativePosY((rateY) / currentScreenSize.y)
    end
  else
    rateX = posX / preScreenSize.x
    rateY = posY / preScreenSize.y
    ;
    ((panelControl[index]).control):SetPosX(changeScreenSize.x * (rateX))
    ;
    ((panelControl[index]).control):SetPosY(changeScreenSize.y * (rateY))
  end
end

local BG_Texture = {
{107, 1, 159, 53}
, 
{1, 1, 53, 53}
, 
{54, 1, 106, 53}
}
local cachePosX = {}
local cachePosY = {}
local cacheSizeX = {}
local cacheSizeY = {}
local cachePreScale = {}
local ChatPanelIsOpenState = {[1] = false, [2] = false, [3] = false, [4] = false, [5] = false}
UiSet_Initialize = function()
  -- function num : 0_2 , upvalues : UiSet, panelControl, panelID
  for idx = 1, UiSet.panelCount do
    local slot = {}
    local fixedType = ""
    if (panelControl[idx]).posFixed then
      fixedType = "Static_DisAble"
    else
      fixedType = "Static_Able"
    end
    slot.control = (UI.createAndCopyBasePropertyControl)(Panel_UI_Setting, fixedType, Panel_UI_Setting, "UiSet_CreateControl_" .. idx)
    ;
    (slot.control):SetShow(true)
    ;
    (slot.control):SetSize(((panelControl[idx]).control):GetSizeX(), ((panelControl[idx]).control):GetSizeY())
    ;
    (slot.control):SetPosX(((panelControl[idx]).control):GetPosX())
    ;
    (slot.control):SetPosY(((panelControl[idx]).control):GetPosY())
    ;
    (slot.control):addInputEvent("Mouse_LDown", "HandleClicked_UiSet_MoveControlSet_Start( " .. idx .. " )")
    ;
    (slot.control):addInputEvent("Mouse_LPress", "HandleClicked_UiSet_MoveControl( " .. idx .. " )")
    ;
    (slot.control):addInputEvent("Mouse_LUp", "HandleClicked_UiSet_PositionCheck( " .. idx .. " )")
    slot.close = (UI.createAndCopyBasePropertyControl)(Panel_UI_Setting, "Button_Close", slot.control, "UiSet_Btn_CreateClose_" .. idx)
    ;
    (slot.close):SetShow(true)
    ;
    (slot.close):SetPosX((slot.control):GetSizeX() - (slot.close):GetSizeX() - 3)
    ;
    (slot.close):SetPosY(3)
    ;
    (slot.close):addInputEvent("Mouse_LUp", "HandleClicked_UiSet_ControlShowToggle( " .. idx .. " )")
    ;
    (slot.close):SetCheck(((panelControl[idx]).control):GetShow())
    -- DECOMPILER ERROR at PC129: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (UiSet.panelPool)[idx] = slot
    -- DECOMPILER ERROR at PC137: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (panelControl[idx]).isShow = ((panelControl[idx]).control):GetShow()
    if (panelControl[idx]).isShow then
      if (panelControl[idx]).posFixed then
        (slot.control):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UI_SETTING_SLOTCONTROL_IMPOSSIBLE", "name", (panelControl[idx]).name))
      else
        ;
        (slot.control):SetText((panelControl[idx]).name)
      end
    else
      if idx == 21 then
        (slot.control):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_UISETTING_SKILLGUIDE_EXTRA"))
      else
        ;
        (slot.control):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UI_SETTING_SLOTCONTROL_OFF", "name", (panelControl[idx]).name))
      end
    end
    local stateValue = 0
    if not (panelControl[idx]).isShow then
      stateValue = 1
    else
      if (panelControl[idx]).posFixed then
        stateValue = 3
      else
        stateValue = 2
      end
    end
    UiSet_ChangeTexture_BG(idx, stateValue)
    if CppDefine.ChangeUIAndResolution == true and ToClient_GetUiInfo((panelControl[idx]).PAGameUIType, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
      local relativePosX, relativePosY = nil, nil
      if panelID.Chat0 <= idx and idx <= panelID.Chat4 then
        relativePosX = ToClient_GetUiInfo((panelControl[idx]).PAGameUIType, idx - panelID.Chat0, (CppEnums.PanelSaveType).PanelSaveType_RelativePositionX)
        relativePosY = ToClient_GetUiInfo((panelControl[idx]).PAGameUIType, idx - panelID.Chat0, (CppEnums.PanelSaveType).PanelSaveType_RelativePositionY)
      else
        relativePosX = ToClient_GetUiInfo((panelControl[idx]).PAGameUIType, 0, (CppEnums.PanelSaveType).PanelSaveType_RelativePositionX)
        relativePosY = ToClient_GetUiInfo((panelControl[idx]).PAGameUIType, 0, (CppEnums.PanelSaveType).PanelSaveType_RelativePositionY)
      end
      -- DECOMPILER ERROR at PC300: Confused about usage of register: R9 in 'UnsetPending'

      if relativePosX == -1 or relativePosX == -1 then
        if ((panelControl[idx]).control):GetRelativePosX() > 0 or ((panelControl[idx]).control):GetRelativePosY() > 0 then
          (panelControl[idx]).isChange = true
        else
          -- DECOMPILER ERROR at PC304: Confused about usage of register: R9 in 'UnsetPending'

          ;
          (panelControl[idx]).isChange = false
        end
      else
        -- DECOMPILER ERROR at PC312: Confused about usage of register: R9 in 'UnsetPending'

        if relativePosX > 0 or relativePosY > 0 then
          (panelControl[idx]).isChange = true
        end
      end
      -- DECOMPILER ERROR at PC320: Confused about usage of register: R9 in 'UnsetPending'

      if (panelControl[idx]).posFixed == true then
        (panelControl[idx]).isChange = false
      end
      ;
      ((panelControl[idx]).control):SetRelativePosX(relativePosX)
      ;
      ((panelControl[idx]).control):SetRelativePosY(relativePosY)
      ;
      (((UiSet.panelPool)[idx]).control):SetRelativePosX(relativePosX)
      ;
      (((UiSet.panelPool)[idx]).control):SetRelativePosY(relativePosY)
    end
  end
  ;
  (UiSet.slider_UI_Scale):SetInterval(160)
end

UiSet_update = function()
  -- function num : 0_3 , upvalues : UiSet, panelID, isLargePartyOpen, panelControl
  (UiSet.slider_UI_Scale):SetControlPos(UiSet.nowCurrentPercent)
  local scaleText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UI_SETTING_SCALETEXT", "currentScale", UiSet.currentScale)
  ;
  (UiSet.txt_UISize):SetText(tostring(scaleText))
  ;
  (UiSet.txt_UI_LOW):SetText(UiSet.minScale)
  ;
  (UiSet.txt_UI_HIGH):SetText(UiSet.maxScale)
  for idx = 1, UiSet.panelCount do
    local slot = (UiSet.panelPool)[idx]
    ;
    (slot.control):SetScale(1, 1)
    ;
    (slot.control):SetShow(true)
    if idx == panelID.LargeParty and isLargePartyOpen == false then
      (slot.control):SetShow(false)
    end
    slot.originPosX = ((panelControl[idx]).control):GetPosX()
    slot.originPosY = ((panelControl[idx]).control):GetPosY()
    slot.originSizeX = ((panelControl[idx]).control):GetSizeX()
    slot.originSizeY = ((panelControl[idx]).control):GetSizeY()
    ;
    (slot.control):SetPosX(slot.originPosX)
    ;
    (slot.control):SetPosY(slot.originPosY)
    ;
    (slot.control):SetSize(slot.originSizeX, slot.originSizeY)
    ;
    (slot.close):SetScale(1, 1)
    ;
    (slot.close):SetShow(true)
    ;
    (slot.close):SetPosX((slot.control):GetSizeX() - (slot.close):GetSizeX() - 3)
    ;
    (slot.close):SetPosY(3)
    ;
    (slot.close):SetCheck((panelControl[idx]).isShow)
    if idx == panelID.Chat0 or idx == panelID.Chat1 or idx == panelID.Chat2 or idx == panelID.Chat3 or idx == panelID.Chat4 then
      local chatPanel = ToClient_getChattingPanel(idx - panelID.Chat0)
      if chatPanel:isOpen() then
        if idx == panelID.Chat0 then
          (slot.control):SetShow(true)
          ;
          (slot.close):SetShow(true)
        else
          if chatPanel:isCombinedToMainPanel() then
            (slot.control):SetShow(false)
            ;
            (slot.close):SetShow(false)
          else
            ;
            (slot.control):SetShow(true)
            ;
            (slot.close):SetShow(true)
          end
        end
      else
        if chatPanel:isCombinedToMainPanel() == false or idx == panelID.Chat0 then
          (slot.control):SetShow(true)
          ;
          (slot.close):SetShow(true)
        else
          ;
          (slot.control):SetShow(false)
          ;
          (slot.close):SetShow(false)
        end
      end
    else
      do
        if idx == panelID.ClassResource then
          if (CppEnums.ClassType).ClassType_Sorcerer == (getSelfPlayer()):getClassType() or (CppEnums.ClassType).ClassType_Combattant == (getSelfPlayer()):getClassType() or (CppEnums.ClassType).ClassType_CombattantWomen == (getSelfPlayer()):getClassType() then
            (slot.control):SetShow(true)
            ;
            (slot.close):SetShow(true)
            -- DECOMPILER ERROR at PC284: Confused about usage of register: R6 in 'UnsetPending'

            if (CppEnums.ClassType).ClassType_Combattant == (getSelfPlayer()):getClassType() or (CppEnums.ClassType).ClassType_CombattantWomen == (getSelfPlayer()):getClassType() then
              (panelControl[panelID.ClassResource]).name = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_FIGHTERTITLE")
            end
          else
            ;
            (slot.control):SetShow(false)
            ;
            (slot.close):SetShow(false)
          end
        else
          if idx == panelID.ActionGuide then
            if isChecked_SkillCommand == true then
              UiSet_ChangeTexture_BG(R7_PC305, 2)
            else
              UiSet_ChangeTexture_BG(R7_PC305, 1)
            end
            -- DECOMPILER ERROR at PC313: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC314: Confused about usage of register: R6 in 'UnsetPending'

            ;
            (panelControl[idx]).isShow = R7_PC305
          else
            -- DECOMPILER ERROR at PC324: Overwrote pending register: R7 in 'AssignReg'

            if idx == panelID.KeyGuide then
              if isChecked_KeyViewer == true then
                UiSet_ChangeTexture_BG(R7_PC305, 2)
              else
                -- DECOMPILER ERROR at PC329: Overwrote pending register: R7 in 'AssignReg'

                UiSet_ChangeTexture_BG(R7_PC305, 1)
              end
            else
              -- DECOMPILER ERROR at PC339: Overwrote pending register: R7 in 'AssignReg'

              -- DECOMPILER ERROR at PC344: Overwrote pending register: R7 in 'AssignReg'

              if idx == panelID.Adrenallin then
                if (getSelfPlayer()):isEnableAdrenalin() then
                  (slot.control):SetShow(true)
                  -- DECOMPILER ERROR at PC348: Overwrote pending register: R7 in 'AssignReg'

                  ;
                  (slot.close):SetShow(true)
                else
                  -- DECOMPILER ERROR at PC353: Overwrote pending register: R7 in 'AssignReg'

                  ;
                  (slot.control):SetShow(false)
                  -- DECOMPILER ERROR at PC357: Overwrote pending register: R7 in 'AssignReg'

                  ;
                  (slot.close):SetShow(false)
                end
              else
                -- DECOMPILER ERROR at PC370: Overwrote pending register: R7 in 'AssignReg'

                if idx == panelID.Pvp then
                  if isPvpEnable() then
                    (slot.control):SetShow(true)
                    -- DECOMPILER ERROR at PC374: Overwrote pending register: R7 in 'AssignReg'

                    ;
                    (slot.close):SetShow(true)
                  else
                    -- DECOMPILER ERROR at PC379: Overwrote pending register: R7 in 'AssignReg'

                    ;
                    (slot.control):SetShow(false)
                    -- DECOMPILER ERROR at PC383: Overwrote pending register: R7 in 'AssignReg'

                    ;
                    (slot.close):SetShow(false)
                  end
                end
              end
            end
          end
        end
        -- DECOMPILER ERROR at PC397: Overwrote pending register: R7 in 'AssignReg'

        if (panelControl[idx]).isShow then
          if (panelControl[idx]).posFixed then
            (slot.control):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UI_SETTING_SLOTCONTROL_IMPOSSIBLE", "name", (panelControl[idx]).name))
          else
            -- DECOMPILER ERROR at PC410: Overwrote pending register: R7 in 'AssignReg'

            ;
            (slot.control):SetText((panelControl[idx]).name)
          end
        else
          -- DECOMPILER ERROR at PC419: Overwrote pending register: R7 in 'AssignReg'

          if idx == 21 then
            (slot.control):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_UISETTING_SKILLGUIDE_EXTRA"))
          else
            -- DECOMPILER ERROR at PC428: Overwrote pending register: R7 in 'AssignReg'

            ;
            (slot.control):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UI_SETTING_SLOTCONTROL_OFF", "name", (panelControl[idx]).name))
          end
        end
        do
          local stateValue = 0
          -- DECOMPILER ERROR at PC440: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC441: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC442: Overwrote pending register: R7 in 'AssignReg'

          if not R7_PC305 then
            stateValue = 1
          else
            -- DECOMPILER ERROR at PC447: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC448: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC449: Overwrote pending register: R7 in 'AssignReg'

            if R7_PC305 then
              stateValue = 3
            else
              stateValue = 2
            end
          end
          -- DECOMPILER ERROR at PC455: Overwrote pending register: R7 in 'AssignReg'

          R7_PC305(R8_PC458, stateValue)
          -- DECOMPILER ERROR at PC459: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC459: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC459: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

HandleClicked_UiSet_MoveControlSet_Start = function(idx)
  -- function num : 0_4 , upvalues : panelControl, original_MouseX, original_MouseY, UiSet, original_controlPosX, original_controlPosY, posGapX, posGapY
  if (panelControl[idx]).posFixed then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_POSFIXED_ACK"))
    return 
  end
  original_MouseX = getMousePosX()
  original_MouseY = getMousePosY()
  local control = ((UiSet.panelPool)[idx]).control
  original_controlPosX = control:GetPosX()
  original_controlPosY = control:GetPosY()
  posGapX = original_MouseX - original_controlPosX
  posGapY = original_MouseY - original_controlPosY
end

HandleClicked_UiSet_MoveControl = function(idx)
  -- function num : 0_5 , upvalues : panelControl, UiSet, posGapX, posGapY, cachePosX, cachePosY, cachePreScale, cacheSizeX, cacheSizeY
  if (panelControl[idx]).posFixed then
    return 
  end
  local scale = UiSet.currentScale / 100
  local mouseX = getMousePosX()
  local mouseY = getMousePosY()
  local control = ((UiSet.panelPool)[idx]).control
  control:SetPosX(mouseX - posGapX)
  control:SetPosY(mouseY - posGapY)
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R5 in 'UnsetPending'

  cachePosX[idx] = control:GetPosX()
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R5 in 'UnsetPending'

  cachePosY[idx] = control:GetPosY()
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R5 in 'UnsetPending'

  cachePreScale[idx] = scale
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R5 in 'UnsetPending'

  cacheSizeX[idx] = control:GetSizeX()
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R5 in 'UnsetPending'

  cacheSizeY[idx] = control:GetSizeY()
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R5 in 'UnsetPending'

  if CppDefine.ChangeUIAndResolution == true then
    (panelControl[idx]).isChange = true
  end
end

HandleClicked_UiSet_PositionCheck = function(index)
  -- function num : 0_6 , upvalues : UiSet
  if index < 23 or index > 42 then
    return 
  end
  if not (UiSet.btn_QuickSlotMagnetic):IsCheck() then
    return 
  end
  local basePosX = (((UiSet.panelPool)[index]).control):GetPosX()
  local basePosY = (((UiSet.panelPool)[index]).control):GetPosY()
  for qIndex = 23, 42 do
    if index ~= qIndex then
      local control = ((UiSet.panelPool)[qIndex]).control
      if basePosX < control:GetPosX() + control:GetSizeX() + 25 and control:GetPosX() < basePosX and control:GetPosY() - 20 < basePosY and basePosY < control:GetPosY() + 20 then
        (((UiSet.panelPool)[index]).control):SetPosX(control:GetPosX() + control:GetSizeX())
        ;
        (((UiSet.panelPool)[index]).control):SetPosY(control:GetPosY())
        break
      end
      if basePosY < control:GetPosY() + control:GetSizeY() + 32 and control:GetPosY() < basePosY and control:GetPosX() - 20 < basePosX and basePosX < control:GetPosX() + 20 then
        (((UiSet.panelPool)[index]).control):SetPosX(control:GetPosX())
        ;
        (((UiSet.panelPool)[index]).control):SetPosY(control:GetPosY() + control:GetSizeY())
        break
      end
      if control:GetPosX() - control:GetSizeX() - 25 < basePosX and basePosX < control:GetPosX() and control:GetPosY() - 20 < basePosY and basePosY < control:GetPosY() + 20 then
        (((UiSet.panelPool)[index]).control):SetPosX(control:GetPosX() - control:GetSizeX())
        ;
        (((UiSet.panelPool)[index]).control):SetPosY(control:GetPosY())
        break
      end
      if control:GetPosY() - control:GetSizeY() - 32 < basePosY and basePosY < control:GetPosY() and control:GetPosX() - 20 < basePosX and basePosX < control:GetPosX() + 20 then
        (((UiSet.panelPool)[index]).control):SetPosX(control:GetPosX())
        ;
        (((UiSet.panelPool)[index]).control):SetPosY(control:GetPosY() - control:GetSizeY())
        break
      end
    end
  end
end

UiSet_MoveControlSet_End = function(idx)
  -- function num : 0_7 , upvalues : panelControl
  if (panelControl[idx]).posFixed then
    return 
  end
end

UiSet_ChangeTexture_BG = function(idx, state)
  -- function num : 0_8 , upvalues : UiSet, BG_Texture
  local control = ((UiSet.panelPool)[idx]).control
  control:ChangeTextureInfoName("New_UI_Common_forLua/Default/UIcontrolPanel.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, (BG_Texture[state])[1], (BG_Texture[state])[2], (BG_Texture[state])[3], (BG_Texture[state])[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

HandleClicked_UiSet_ControlShowToggle = function(idx)
  -- function num : 0_9 , upvalues : panelID, UiSet, panelControl
  local panelOpen = 0
  if idx == panelID.MainQuest then
    if getSelfPlayer() == nil then
      _PA_ASSERT(false, "SelfPlayerê°\128 nil ìž…ë‹ˆë‹\164.")
      return 
    end
    if ((getSelfPlayer()):get()):getLevel() < PaGlobal_MainQuest._closeableLevel and Panel_MainQuest:GetShow() == true then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_MAINQUESTWIDGET_NOTYETCLOSEABLELEVEL_ACK"))
      return 
    end
  end
  if idx == panelID.Pvp and not isPvpEnable() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_NOTYETPVP_ACK"))
    ;
    (((UiSet.panelPool)[idx]).close):SetCheck((panelControl[idx]).isShow)
    return 
  else
    if idx == panelID.Adrenallin and not (getSelfPlayer()):isEnableAdrenalin() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_NOTYETSPRIT_ACK"))
      ;
      (((UiSet.panelPool)[idx]).close):SetCheck((panelControl[idx]).isShow)
      return 
    else
      if idx == panelID.ServantIcon or idx == panelID.House or idx == panelID.NewEquip or idx == panelID.Party or idx == panelID.QuickSlot or idx == panelID.Adrenallin or idx == panelID.LargeParty then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_NOTRANDOMHIDE_ACK"))
        ;
        (((UiSet.panelPool)[idx]).close):SetCheck((panelControl[idx]).isShow)
        return 
      else
        if (idx == panelID.NewQuickSlot0 or idx == panelID.NewQuickSlot1 or idx == panelID.NewQuickSlot2 or idx == panelID.NewQuickSlot3 or idx == panelID.NewQuickSlot4 or idx == panelID.NewQuickSlot5 or idx == panelID.NewQuickSlot6 or idx == panelID.NewQuickSlot7 or idx == panelID.NewQuickSlot8 or idx == panelID.NewQuickSlot9 or idx == panelID.NewQuickSlot10 or idx == panelID.NewQuickSlot11 or idx == panelID.NewQuickSlot12 or idx == panelID.NewQuickSlot13 or idx == panelID.NewQuickSlot14 or idx == panelID.NewQuickSlot15 or idx == panelID.NewQuickSlot16 or idx == panelID.NewQuickSlot17 or idx == panelID.NewQuickSlot18 or idx == panelID.NewQuickSlot19) and not isUseNewQuickSlot() then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_NEWQUICKSETTING"))
          ;
          (((UiSet.panelPool)[idx]).close):SetCheck((panelControl[idx]).isShow)
          return 
        else
          -- DECOMPILER ERROR at PC246: Confused about usage of register: R2 in 'UnsetPending'

          if (panelControl[idx]).isShow then
            (panelControl[idx]).isShow = false
            UiSet_ChangeTexture_BG(idx, 1)
            -- DECOMPILER ERROR at PC253: Confused about usage of register: R2 in 'UnsetPending'

            ;
            (panelControl[idx]).isShow = false
            if idx == 21 then
              (((UiSet.panelPool)[idx]).control):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_UISETTING_SKILLGUIDE_EXTRA"))
            else
              ;
              (((UiSet.panelPool)[idx]).control):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UI_SETTING_SLOTCONTROL_OFF", "name", (panelControl[idx]).name))
            end
            panelOpen = false
          else
            -- DECOMPILER ERROR at PC287: Confused about usage of register: R2 in 'UnsetPending'

            ;
            (panelControl[idx]).isShow = true
            if (panelControl[idx]).posFixed then
              UiSet_ChangeTexture_BG(idx, 3)
            else
              UiSet_ChangeTexture_BG(idx, 2)
            end
            -- DECOMPILER ERROR at PC304: Confused about usage of register: R2 in 'UnsetPending'

            ;
            (panelControl[idx]).isShow = true
            ;
            (((UiSet.panelPool)[idx]).control):SetText((panelControl[idx]).name)
            panelOpen = true
          end
        end
      end
    end
  end
  if idx == panelID.Chat0 or idx == panelID.Chat1 or idx == panelID.Chat2 or idx == panelID.Chat3 or idx == panelID.Chat4 then
    Chatting_setIsOpenValue(idx - 5, panelOpen)
  end
end

UiSet_FreeSet_Open = function()
  -- function num : 0_10 , upvalues : UiSet
  Panel_SaveFreeSet:SetShow(true)
  ;
  (UiSet.title):SetShow(false)
end

PaGlobal_UiSet_FreeSet_Close = function()
  -- function num : 0_11 , upvalues : UiSet
  Panel_SaveFreeSet:SetShow(false)
  ;
  (UiSet.title):SetShow(true)
  ;
  (UiSet.chk_GridView):SetCheck(false)
end

UiSet_GridView = function()
  -- function num : 0_12 , upvalues : UiSet
  local isCheck = (UiSet.chk_GridView):IsCheck()
  if isCheck then
    (UiSet.bg_Grid):SetShow(true)
  else
    ;
    (UiSet.bg_Grid):SetShow(false)
  end
end

UiSet_ConfrimSetting_Sub = function(isReset)
  -- function num : 0_13 , upvalues : UiSet, panelControl, panelID
  local scale = UiSet.currentScale / 100
  local preScale = UiSet.preScale
  local currentScreenSize = {x = getScreenSizeX(), y = getScreenSizeY()}
  local preScreenSize = {x = currentScreenSize.x / preScale, y = currentScreenSize.y / preScale}
  local changeScreenSize = {x = currentScreenSize.x / scale, y = currentScreenSize.y / scale}
  for idx = 1, UiSet.panelCount do
    local controlPosX = (((UiSet.panelPool)[idx]).control):GetPosX()
    local controlPosY = (((UiSet.panelPool)[idx]).control):GetPosY()
    local slot = ((UiSet.panelPool)[idx]).control
    local posX = slot:GetPosX()
    local posY = slot:GetPosY()
    local rateX = 0
    local rateY = 0
    if CppDefine.ChangeUIAndResolution == true then
      rateX = posX + slot:GetSizeX() / 2
      rateY = posY + slot:GetSizeY() / 2
      if (panelControl[idx]).isChange == false then
        ((panelControl[idx]).control):SetRelativePosX(0)
        ;
        ((panelControl[idx]).control):SetRelativePosY(0)
        slot:SetRelativePosX(0)
        slot:SetRelativePosY(0)
      else
        ;
        ((panelControl[idx]).control):SetRelativePosX((rateX) / currentScreenSize.x)
        ;
        ((panelControl[idx]).control):SetRelativePosY((rateY) / currentScreenSize.y)
        slot:SetRelativePosX((rateX) / currentScreenSize.x)
        slot:SetRelativePosY((rateY) / currentScreenSize.y)
      end
    else
      rateX = posX / preScreenSize.x
      rateY = posY / preScreenSize.y
      ;
      ((panelControl[idx]).control):SetPosX(changeScreenSize.x * (rateX))
      ;
      ((panelControl[idx]).control):SetPosY(changeScreenSize.y * (rateY))
    end
    if idx == panelID.Pvp and isPvpEnable() then
      ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
    end
    if idx == panelID.Adrenallin then
      ((panelControl[idx]).control):SetShow((getSelfPlayer()):isEnableAdrenalin())
    else
      if idx == panelID.GameTip then
        ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
        Panel_GameTipMask:SetShow((panelControl[idx]).isShow)
        Panel_GameTipMask:SetPosX(controlPosX + 15)
        Panel_GameTipMask:SetPosY(controlPosY - 7)
      else
        -- DECOMPILER ERROR at PC226: Unhandled construct in 'MakeBoolean' P1

        if idx == panelID.ClassResource and ((CppEnums.ClassType).ClassType_Sorcerer == (getSelfPlayer()):getClassType() or (CppEnums.ClassType).ClassType_Combattant == (getSelfPlayer()):getClassType() or (CppEnums.ClassType).ClassType_CombattantWomen == (getSelfPlayer()):getClassType()) then
          ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
        end
      end
    end
    if idx == panelID.ActionGuide then
      setShowSkillCmd((panelControl[idx]).isShow)
      isChecked_SkillCommand = (panelControl[idx]).isShow
      ;
      ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
      GameOption_UpdateOptionChanged()
      FGlobal_SkillCommand_Show((panelControl[idx]).isShow)
    else
      if idx == panelID.KeyGuide then
        if (panelControl[idx]).isShow == true then
          FGlobal_KeyViewer_Show()
        else
          FGlobal_KeyViewer_Hide()
        end
        isChecked_KeyViewer = (panelControl[idx]).isShow
        GameOption_UpdateOptionChanged()
      else
        if idx == panelID.NewQuickSlot0 then
          if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
            quickSlot_Clear(0)
          end
          ;
          ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
        else
          if idx == panelID.NewQuickSlot1 then
            if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
              quickSlot_Clear(1)
            end
            ;
            ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
          else
            if idx == panelID.NewQuickSlot2 then
              if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                quickSlot_Clear(2)
              end
              ;
              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
            else
              if idx == panelID.NewQuickSlot3 then
                if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                  quickSlot_Clear(3)
                end
                ;
                ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
              else
                if idx == panelID.NewQuickSlot4 then
                  if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                    quickSlot_Clear(4)
                  end
                  ;
                  ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                else
                  if idx == panelID.NewQuickSlot5 then
                    if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                      quickSlot_Clear(5)
                    end
                    ;
                    ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                  else
                    if idx == panelID.NewQuickSlot6 then
                      if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                        quickSlot_Clear(6)
                      end
                      ;
                      ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                    else
                      if idx == panelID.NewQuickSlot7 then
                        if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                          quickSlot_Clear(7)
                        end
                        ;
                        ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                      else
                        if idx == panelID.NewQuickSlot8 then
                          if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                            quickSlot_Clear(8)
                          end
                          ;
                          ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                        else
                          if idx == panelID.NewQuickSlot9 then
                            if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                              quickSlot_Clear(9)
                            end
                            ;
                            ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                          else
                            if idx == panelID.NewQuickSlot10 then
                              if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                quickSlot_Clear(10)
                              end
                              ;
                              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                            else
                              if idx == panelID.NewQuickSlot11 then
                                if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                  quickSlot_Clear(11)
                                end
                                ;
                                ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                              else
                                if idx == panelID.NewQuickSlot12 then
                                  if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                    quickSlot_Clear(12)
                                  end
                                  ;
                                  ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                else
                                  if idx == panelID.NewQuickSlot13 then
                                    if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                      quickSlot_Clear(13)
                                    end
                                    ;
                                    ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                  else
                                    if idx == panelID.NewQuickSlot14 then
                                      if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                        quickSlot_Clear(14)
                                      end
                                      ;
                                      ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                    else
                                      if idx == panelID.NewQuickSlot15 then
                                        if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                          quickSlot_Clear(15)
                                        end
                                        ;
                                        ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                      else
                                        if idx == panelID.NewQuickSlot16 then
                                          if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                            quickSlot_Clear(16)
                                          end
                                          ;
                                          ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                        else
                                          if idx == panelID.NewQuickSlot17 then
                                            if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                              quickSlot_Clear(17)
                                            end
                                            ;
                                            ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                          else
                                            if idx == panelID.NewQuickSlot18 then
                                              if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                                quickSlot_Clear(18)
                                              end
                                              ;
                                              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                            else
                                              if idx == panelID.NewQuickSlot19 then
                                                if (panelControl[idx]).isShow == false and isUseNewQuickSlot() then
                                                  quickSlot_Clear(19)
                                                end
                                                ;
                                                ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                              else
                                                ;
                                                ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
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
  ToClient_SaveUiInfo(true)
  return scale
end

HandleClicked_UiSet_ConfirmSetting = function(isReset)
  -- function num : 0_14 , upvalues : renderMode
  PaGlobal_UiSet_FreeSet_Close()
  SetUIMode((Defines.UIMode).eUIMode_Default)
  renderMode:reset()
  local scale = UiSet_ConfrimSetting_Sub(isReset)
  Panel_NewEquip_EffectLastUpdate()
  FGlobal_PetListNew_NoPet()
  scale = scale + 0.002
  local uiScale_Percent = (math.floor)((scale) * 100)
  scale = uiScale_Percent / 100
  setUIScale(scale)
  GameOption_SetUIMode(scale)
  saveGameOption(false)
  Panel_Menu:SetShow(true)
end

UiSet_Panel_ShowValueUpdate = function()
  -- function num : 0_15 , upvalues : UiSet, panelControl
  for idx = 1, UiSet.panelCount do
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R4 in 'UnsetPending'

    (panelControl[idx]).isShow = ((panelControl[idx]).control):GetShow()
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R4 in 'UnsetPending'

    ;
    ((panelControl[idx]).prePos).x = ((panelControl[idx]).control):GetPosX()
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R4 in 'UnsetPending'

    ;
    ((panelControl[idx]).prePos).y = ((panelControl[idx]).control):GetPosY()
  end
end

HandleClicked_UiSet_FieldViewToggle = function()
  -- function num : 0_16 , upvalues : UiSet
  if (UiSet.btn_FieldView):IsCheck() then
    FieldViewMode_ShowToggle(true)
  else
    FieldViewMode_ShowToggle(false)
  end
end

HandleClicked_UiSet_ChangeScale = function()
  -- function num : 0_17 , upvalues : UiSet, cachePosX, cachePosY, cacheSizeX, cacheSizeY, cachePreScale, panelID
  local nowPercent = (UiSet.slider_UI_Scale):GetControlPos()
  local realPercent = (math.ceil)(UiSet.replaceScale / 100 * (nowPercent * 100) + UiSet.minScale)
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  UiSet.currentScale = realPercent
  local scaleText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_UI_SETTING_SCALETEXT", "currentScale", realPercent)
  ;
  (UiSet.txt_UISize):SetText(tostring(scaleText))
  local scale = UiSet.currentScale / 100
  local screensizeX = getScreenSizeX()
  local screensizeY = getScreenSizeY()
  for idx = 1, UiSet.panelCount do
    local slot = (UiSet.panelPool)[idx]
    local parentsPosX = cachePosX[idx]
    if parentsPosX == nil then
      parentsPosX = slot.originPosX
    end
    local parentsPosY = cachePosY[idx]
    if parentsPosY == nil then
      parentsPosY = slot.originPosY
    end
    local sizeX = cacheSizeX[idx]
    if sizeX == nil then
      sizeX = slot.originSizeX
    end
    local sizeY = cacheSizeY[idx]
    if sizeY == nil then
      sizeY = slot.originSizeY
    end
    local preScale = cachePreScale[idx]
    if preScale == nil then
      preScale = UiSet.preScale
    end
    local rateX = parentsPosX / (screensizeX - sizeX)
    local rateY = parentsPosY / (screensizeY - sizeY)
    ;
    (slot.control):SetSize(sizeX * (1 / preScale) * scale, sizeY * (1 / preScale) * scale)
    if idx == panelID.ExpGage then
      (slot.control):SetHorizonLeft()
      ;
      (slot.control):SetVerticalTop()
    else
      if idx == panelID.Radar then
        (slot.control):SetHorizonRight()
        ;
        (slot.control):SetVerticalTop()
        ;
        (slot.control):SetSpanSize(0, 20)
      else
        if idx == panelID.GameTip then
          (slot.control):SetHorizonLeft()
          ;
          (slot.control):SetVerticalBottom()
        else
          if idx == panelID.UIMain then
            (slot.control):SetHorizonRight()
            ;
            (slot.control):SetVerticalBottom()
          else
            ;
            (slot.control):SetPosX(parentsPosX + rateX * sizeX - rateX * (slot.control):GetSizeX())
            ;
            (slot.control):SetPosY(parentsPosY + rateY * sizeY - rateY * (slot.control):GetSizeY())
          end
        end
      end
    end
    ;
    (slot.control):ComputePos()
    ;
    (slot.close):ComputePos()
  end
end

HandleClicked_UiSet_ChangeScale_LDown = function()
  -- function num : 0_18 , upvalues : UiSet, cachePosX, cachePosY, cachePreScale, cacheSizeX, cacheSizeY
  local scale = UiSet.currentScale / 100
  for idx = 1, UiSet.panelCount do
    local control = ((UiSet.panelPool)[idx]).control
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R6 in 'UnsetPending'

    cachePosX[idx] = control:GetPosX()
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R6 in 'UnsetPending'

    cachePosY[idx] = control:GetPosY()
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R6 in 'UnsetPending'

    cachePreScale[idx] = scale
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R6 in 'UnsetPending'

    cacheSizeX[idx] = control:GetSizeX()
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R6 in 'UnsetPending'

    cacheSizeY[idx] = control:GetSizeY()
  end
end

UiSet_ScaleSet = function()
  -- function num : 0_19 , upvalues : UiSet
  local scaleValue = FGlobal_getUIScale()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  UiSet.minScale = scaleValue.min
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  UiSet.maxScale = scaleValue.max
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  UiSet.currentScale = FGlobal_returnUIScale() * 100
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  UiSet.replaceScale = UiSet.maxScale - UiSet.minScale
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  UiSet.preScale = FGlobal_returnUIScale()
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  UiSet.nowCurrentPercent = (math.ceil)((UiSet.currentScale - UiSet.minScale) / UiSet.replaceScale * 100)
end

FGlobal_UiSet_Open = function()
  -- function num : 0_20 , upvalues : UiSet, renderMode, panelID, ChatPanelIsOpenState
  close_force_WindowPanelList()
  ToClient_SaveUiInfo(false)
  ;
  (UiSet.bg_Grid):SetShow(false)
  ;
  (UiSet.chk_GridView):SetCheck(false)
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_NOTCURRENTACTION_ACK"))
    return 
  end
  Panel_FieldViewMode:SetShow(false)
  UiSet_Panel_ShowValueUpdate()
  SetUIMode((Defines.UIMode).eUIMode_UiSetting)
  renderMode:set()
  Panel_UI_Setting:SetShow(true)
  ;
  (UiSet.btn_FieldView):SetCheck(false)
  ;
  (UiSet.btn_QuickSlotMagnetic):SetCheck(true)
  audioPostEvent_SystemUi(1, 41)
  UiSet_ScaleSet()
  for idx = 1, UiSet.panelCount do
    local slot = (UiSet.panelPool)[idx]
    if idx == panelID.ExpGage then
      (slot.control):SetHorizonLeft()
      ;
      (slot.control):SetVerticalTop()
    else
      if idx == panelID.TimeBar then
        (slot.control):SetHorizonRight()
        ;
        (slot.control):SetVerticalTop()
      else
        if idx == panelID.Radar then
          (slot.control):SetHorizonRight()
          ;
          (slot.control):SetVerticalTop()
          ;
          (slot.control):SetSpanSize(0, 20)
        else
          if idx == panelID.GameTip then
            (slot.control):SetHorizonLeft()
            ;
            (slot.control):SetVerticalBottom()
          else
            if idx == panelID.UIMain then
              (slot.control):SetHorizonRight()
              ;
              (slot.control):SetVerticalBottom()
            end
          end
        end
      end
    end
  end
  ;
  (UiSet.bg_Grid):SetAlpha(0.7)
  UiSet_update()
  local count = ToClient_getChattingPanelCount()
  for chattingPanelindex = 0, count - 1 do
    local chatPanel = ToClient_getChattingPanel(chattingPanelindex)
    -- DECOMPILER ERROR at PC151: Confused about usage of register: R6 in 'UnsetPending'

    if chatPanel:isOpen() then
      ChatPanelIsOpenState[chattingPanelindex + 1] = true
    else
      -- DECOMPILER ERROR at PC155: Confused about usage of register: R6 in 'UnsetPending'

      ChatPanelIsOpenState[chattingPanelindex + 1] = false
    end
  end
end

FGlobal_UiSet_Close = function()
  -- function num : 0_21 , upvalues : renderMode, ChatPanelIsOpenState, closePanelState
  PaGlobal_UiSet_FreeSet_Close()
  if Panel_UI_Setting:IsShow() == false then
    return 
  end
  PaGlobal_UiSet_FreeSet_Close()
  SetUIMode((Defines.UIMode).eUIMode_Default)
  renderMode:reset()
  Panel_UI_Setting:SetShow(false)
  Panel_Menu:SetShow(true)
  local count = ToClient_getChattingPanelCount()
  for chattingPanelindex = 0, count - 1 do
    Chatting_setIsOpenValue(chattingPanelindex, ChatPanelIsOpenState[chattingPanelindex + 1])
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R5 in 'UnsetPending'

    ChatPanelIsOpenState[chattingPanelindex + 1] = false
  end
  for idx = 0, 4 do
    if closePanelState[idx] == true then
      HandleClicked_Chatting_Close(idx)
    end
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R5 in 'UnsetPending'

    closePanelState[idx] = false
  end
end

UiSet_OnScreenEvent = function()
  -- function num : 0_22 , upvalues : UiSet, UiSave
  Panel_UI_Setting:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_SaveFreeSet:ComputePos()
  ;
  (UiSet.title):ComputePos()
  ;
  (UiSet.btn_save):ComputePos()
  ;
  (UiSet.btn_cancel):ComputePos()
  ;
  (UiSet.btn_reset):ComputePos()
  ;
  (UiSet.bg_Grid):ComputePos()
  ;
  (UiSave.bg_Block):ComputePos()
  local scale = ToClient_GetUIScale()
  scale = scale + 0.002
  scale = (math.floor)((scale) * 100)
  FGlobal_saveUIScale(scale)
end

UiSet_registEventHandler = function()
  -- function num : 0_23 , upvalues : UiSave, UiSet
  (UiSave.btn_SaveClose):addInputEvent("Mouse_LUp", "PaGlobal_UiSet_FreeSet_Close()")
  ;
  (UiSave.btn_SaveDefault):addInputEvent("Mouse_LUp", "HandleClicked_UiSet_ConfirmSetting()")
  ;
  (UiSet.btn_save):addInputEvent("Mouse_LUp", "UiSet_FreeSet_Open()")
  ;
  (UiSet.btn_cancel):addInputEvent("Mouse_LUp", "FGlobal_UiSet_Close()")
  ;
  (UiSet.btn_reset):addInputEvent("Mouse_LUp", "HandleClicked_Reset_UiSetting_Msg()")
  ;
  (UiSet.btn_Win_Close):addInputEvent("Mouse_LUp", "FGlobal_UiSet_Close()")
  ;
  (UiSave.btn_SaveDefault):addInputEvent("Mouse_LUp", "HandleClicked_UiSet_ConfirmSetting()")
  ;
  (UiSet.chk_GridView):addInputEvent("Mouse_LUp", "UiSet_GridView()")
  if CppDefine.ChangeUIAndResolution == true then
    (UiSet.btn_Scale):addInputEvent("Mouse_LDown", "HandleClicked_UiSet_ChangeScale_LDown()")
    ;
    (UiSet.slider_UI_Scale):addInputEvent("Mouse_LDown", "HandleClicked_UiSet_ChangeScale_LDown()")
  end
  ;
  (UiSet.btn_Scale):addInputEvent("Mouse_LPress", "HandleClicked_UiSet_ChangeScale()")
  ;
  (UiSet.slider_UI_Scale):addInputEvent("Mouse_LPress", "HandleClicked_UiSet_ChangeScale()")
  ;
  (UiSet.btn_FieldView):addInputEvent("Mouse_LUp", "HandleClicked_UiSet_FieldViewToggle()")
end

HandleClicked_Reset_UiSetting_Msg = function()
  -- function num : 0_24 , upvalues : UiSet, renderMode, panelControl, panelID, cachePosX, cachePosY, ChatPanelIsOpenState
  local reset_GameUI = function()
    -- function num : 0_24_0 , upvalues : UiSet, renderMode, panelControl, panelID, cachePosX, cachePosY, ChatPanelIsOpenState
    local screenSizeX = getScreenSizeX()
    local screenSizeY = getScreenSizeY()
    local const_LowMaxScaleValue = 90
    local const_MidleMaxScaleValue = 100
    local const_HightMaxScaleValue = 120
    local minScaleHeight = 720
    local midleScaleHeight = 900
    local uiScale = 1
    local gameOptionSetting = ToClient_getGameOptionControllerWrapper()
    local screenHeight = gameOptionSetting:getScreenResolutionHeight()
    if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_KOR) == false then
      const_LowMaxScaleValue = 100
    end
    if screenHeight <= minScaleHeight then
      maxScaleValue = const_LowMaxScaleValue
    else
      if minScaleHeight < screenHeight and screenHeight <= midleScaleHeight then
        maxScaleValue = const_MidleMaxScaleValue
      else
        maxScaleValue = const_HightMaxScaleValue
      end
    end
    uiScale = (math.floor)(uiScale * 100) / 100
    if maxScaleValue < uiScale * 100 then
      uiScale = 0.8
    end
    -- DECOMPILER ERROR at PC44: Confused about usage of register: R10 in 'UnsetPending'

    UiSet.nowCurrentPercent = uiScale
    SetUIMode((Defines.UIMode).eUIMode_Default)
    renderMode:reset()
    if CppDefine.ChangeUIAndResolution == true then
      for idx = 1, UiSet.panelCount do
        ((panelControl[idx]).control):SetRelativePosX(0)
        ;
        ((panelControl[idx]).control):SetRelativePosY(0)
        -- DECOMPILER ERROR at PC76: Confused about usage of register: R14 in 'UnsetPending'

        ;
        (panelControl[idx]).isChange = false
      end
    end
    do
      for idx = 1, UiSet.panelCount do
        -- DECOMPILER ERROR at PC194: Confused about usage of register: R14 in 'UnsetPending'

        if idx ~= panelID.ServantIcon and idx ~= panelID.House and idx ~= panelID.NewEquip and idx ~= panelID.Party and idx ~= panelID.Adrenallin and idx ~= panelID.QuickSlot and idx ~= panelID.NewQuickSlot0 and idx ~= panelID.NewQuickSlot1 and idx ~= panelID.NewQuickSlot2 and idx ~= panelID.NewQuickSlot3 and idx ~= panelID.NewQuickSlot4 and idx ~= panelID.NewQuickSlot5 and idx ~= panelID.NewQuickSlot6 and idx ~= panelID.NewQuickSlot7 and idx ~= panelID.NewQuickSlot8 and idx ~= panelID.NewQuickSlot9 and idx ~= panelID.NewQuickSlot10 and idx ~= panelID.NewQuickSlot11 and idx ~= panelID.NewQuickSlot12 and idx ~= panelID.NewQuickSlot13 and idx ~= panelID.NewQuickSlot14 and idx ~= panelID.NewQuickSlot15 and idx ~= panelID.NewQuickSlot16 and idx ~= panelID.NewQuickSlot17 and idx ~= panelID.NewQuickSlot18 and idx ~= panelID.NewQuickSlot19 then
          if idx == panelID.LargeParty then
            (panelControl[idx]).isShow = true
            if (panelControl[idx]).posFixed then
              UiSet_ChangeTexture_BG(idx, 3)
            else
              UiSet_ChangeTexture_BG(idx, 2)
            end
            if idx == panelID.Pvp and isPvpEnable() then
              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
            end
            if idx == panelID.Adrenallin and (getSelfPlayer()):isEnableAdrenalin() then
              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
            end
            if idx == panelID.GameTip then
              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
              Panel_GameTipMask:SetShow((panelControl[idx]).isShow)
              Panel_GameTipMask:SetPosX((((UiSet.panelPool)[idx]).control):GetPosX() + 15)
              Panel_GameTipMask:SetPosY((((UiSet.panelPool)[idx]).control):GetPosY() - 7)
            else
              -- DECOMPILER ERROR at PC322: Unhandled construct in 'MakeBoolean' P1

              if idx == panelID.ClassResource and ((CppEnums.ClassType).ClassType_Sorcerer == (getSelfPlayer()):getClassType() or (CppEnums.ClassType).ClassType_Combattant == (getSelfPlayer()):getClassType() or (CppEnums.ClassType).ClassType_CombattantWomen == (getSelfPlayer()):getClassType()) then
                ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
              end
            end
            if idx == panelID.QuickSlot then
              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
            else
              if idx == panelID.ActionGuide then
                setShowSkillCmd((panelControl[idx]).isShow)
                isChecked_SkillCommand = (panelControl[idx]).isShow
                ;
                ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                GameOption_UpdateOptionChanged()
              else
                -- DECOMPILER ERROR at PC367: Confused about usage of register: R14 in 'UnsetPending'

                if idx == panelID.KeyGuide then
                  (panelControl[idx]).isShow = false
                  Panel_KeyViewer_Hide()
                  PanelMovieKeyViewer_RestorePosition()
                else
                  if idx == panelID.NewQuickSlot0 then
                    ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                  else
                    if idx == panelID.NewQuickSlot1 then
                      ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                    else
                      if idx == panelID.NewQuickSlot2 then
                        ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                      else
                        if idx == panelID.NewQuickSlot3 then
                          ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                        else
                          if idx == panelID.NewQuickSlot4 then
                            ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                          else
                            if idx == panelID.NewQuickSlot5 then
                              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                            else
                              if idx == panelID.NewQuickSlot6 then
                                ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                              else
                                if idx == panelID.NewQuickSlot7 then
                                  ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                else
                                  if idx == panelID.NewQuickSlot8 then
                                    ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                  else
                                    if idx == panelID.NewQuickSlot9 then
                                      ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                    else
                                      if idx == panelID.NewQuickSlot10 then
                                        ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                      else
                                        if idx == panelID.NewQuickSlot11 then
                                          ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                        else
                                          if idx == panelID.NewQuickSlot12 then
                                            ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                          else
                                            if idx == panelID.NewQuickSlot13 then
                                              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                            else
                                              if idx == panelID.NewQuickSlot14 then
                                                ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                              else
                                                if idx == panelID.NewQuickSlot15 then
                                                  ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                                else
                                                  if idx == panelID.NewQuickSlot16 then
                                                    ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                                  else
                                                    if idx == panelID.NewQuickSlot17 then
                                                      ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                                    else
                                                      if idx == panelID.NewQuickSlot18 then
                                                        ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                                      else
                                                        if idx == panelID.NewQuickSlot19 then
                                                          ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                                        else
                                                          if idx == panelID.Party then
                                                            ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                                          else
                                                            if idx == panelID.LargeParty then
                                                              ((panelControl[idx]).control):SetShow((panelControl[idx]).isShow)
                                                            else
                                                              ;
                                                              ((panelControl[idx]).control):SetShow(true)
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
            -- DECOMPILER ERROR at PC674: Confused about usage of register: R14 in 'UnsetPending'

            if CppDefine.ChangeUIAndResolution == true then
              if idx == panelID.ServantIcon then
                cachePosX[idx] = 10
                -- DECOMPILER ERROR at PC694: Confused about usage of register: R14 in 'UnsetPending'

                cachePosY[idx] = (((UiSet.panelPool)[panelID.ExpGage]).control):GetPosY() + (((UiSet.panelPool)[panelID.ExpGage]).control):GetSizeY() + 15
              else
                -- DECOMPILER ERROR at PC711: Confused about usage of register: R14 in 'UnsetPending'

                if idx == panelID.Quest then
                  cachePosX[idx] = screenSizeX - (((UiSet.panelPool)[panelID.Quest]).control):GetSizeX() - 20
                  -- DECOMPILER ERROR at PC749: Confused about usage of register: R14 in 'UnsetPending'

                  cachePosY[idx] = (((UiSet.panelPool)[panelID.Radar]).control):GetPosY() + (((UiSet.panelPool)[panelID.Radar]).control):GetSizeY() + (((UiSet.panelPool)[panelID.MainQuest]).control):GetSizeY() + 20 + (((UiSet.panelPool)[panelID.NewEquip]).control):GetSizeY()
                else
                  -- DECOMPILER ERROR at PC772: Confused about usage of register: R14 in 'UnsetPending'

                  if idx == panelID.Chat0 or idx == panelID.Chat1 or idx == panelID.Chat2 or idx == panelID.Chat3 or idx == panelID.Chat4 then
                    cachePosX[idx] = 0
                    -- DECOMPILER ERROR at PC785: Confused about usage of register: R14 in 'UnsetPending'

                    cachePosY[idx] = screenSizeY - (((UiSet.panelPool)[idx]).control):GetSizeY() - Panel_GameTips:GetSizeY()
                  else
                    -- DECOMPILER ERROR at PC802: Confused about usage of register: R14 in 'UnsetPending'

                    if idx == panelID.QuickSlot then
                      cachePosX[idx] = (screenSizeX - (((UiSet.panelPool)[panelID.QuickSlot]).control):GetSizeX()) / 2
                      -- DECOMPILER ERROR at PC813: Confused about usage of register: R14 in 'UnsetPending'

                      cachePosY[idx] = screenSizeY - (((UiSet.panelPool)[panelID.QuickSlot]).control):GetSizeY()
                    else
                      -- DECOMPILER ERROR at PC831: Confused about usage of register: R14 in 'UnsetPending'

                      if idx == panelID.HPBar then
                        cachePosX[idx] = screenSizeX / 2 - (((UiSet.panelPool)[panelID.HPBar]).control):GetSizeX() / 2
                        -- DECOMPILER ERROR at PC851: Confused about usage of register: R14 in 'UnsetPending'

                        cachePosY[idx] = screenSizeY - (((UiSet.panelPool)[panelID.QuickSlot]).control):GetSizeY() - (((UiSet.panelPool)[panelID.HPBar]).control):GetSizeY()
                      else
                        -- DECOMPILER ERROR at PC870: Confused about usage of register: R14 in 'UnsetPending'

                        if idx == panelID.Pvp then
                          cachePosX[idx] = screenSizeX / 2 - (((UiSet.panelPool)[panelID.HPBar]).control):GetSizeX() / 2 - 20
                          -- DECOMPILER ERROR at PC890: Confused about usage of register: R14 in 'UnsetPending'

                          cachePosY[idx] = screenSizeY - (((UiSet.panelPool)[panelID.QuickSlot]).control):GetSizeY() - (((UiSet.panelPool)[panelID.Pvp]).control):GetSizeY()
                        else
                          -- DECOMPILER ERROR at PC918: Confused about usage of register: R14 in 'UnsetPending'

                          if idx == panelID.ClassResource then
                            cachePosX[idx] = screenSizeX / 2 - (((UiSet.panelPool)[panelID.HPBar]).control):GetSizeX() / 2 + (((UiSet.panelPool)[panelID.ClassResource]).control):GetSizeX() - 5
                            -- DECOMPILER ERROR at PC948: Confused about usage of register: R14 in 'UnsetPending'

                            cachePosY[idx] = screenSizeY - (((UiSet.panelPool)[panelID.QuickSlot]).control):GetSizeY() - (((UiSet.panelPool)[panelID.HPBar]).control):GetSizeY() - (((UiSet.panelPool)[panelID.ClassResource]).control):GetSizeY() + 5
                          else
                            -- DECOMPILER ERROR at PC967: Confused about usage of register: R14 in 'UnsetPending'

                            if idx == panelID.Adrenallin then
                              cachePosX[idx] = screenSizeX / 2 - (((UiSet.panelPool)[panelID.Adrenallin]).control):GetSizeX() / 2 + 225
                              -- DECOMPILER ERROR at PC979: Confused about usage of register: R14 in 'UnsetPending'

                              cachePosY[idx] = screenSizeY - (((UiSet.panelPool)[panelID.QuickSlot]).control):GetSizeY() - 76
                            else
                              -- DECOMPILER ERROR at PC986: Confused about usage of register: R14 in 'UnsetPending'

                              if idx == panelID.House then
                                cachePosX[idx] = 10
                                -- DECOMPILER ERROR at PC1002: Confused about usage of register: R14 in 'UnsetPending'

                                if Panel_Window_Servant:GetShow() then
                                  cachePosX[idx] = (((UiSet.panelPool)[panelID.ServantIcon]).control):GetSizeX() + 10
                                end
                                -- DECOMPILER ERROR at PC1022: Confused about usage of register: R14 in 'UnsetPending'

                                cachePosY[idx] = (((UiSet.panelPool)[panelID.ExpGage]).control):GetPosY() + (((UiSet.panelPool)[panelID.ExpGage]).control):GetSizeY() + 15
                              else
                                -- DECOMPILER ERROR at PC1035: Confused about usage of register: R14 in 'UnsetPending'

                                if idx == panelID.NewEquip then
                                  cachePosX[idx] = FGlobal_GetPersonalIconPosY(4) + FGlobal_GetPersonalIconSizeY()
                                  -- DECOMPILER ERROR at PC1040: Confused about usage of register: R14 in 'UnsetPending'

                                  cachePosY[idx] = FGlobal_GetPersonalIconPosX(4)
                                else
                                  -- DECOMPILER ERROR at PC1049: Confused about usage of register: R14 in 'UnsetPending'

                                  if idx == panelID.ActionGuide then
                                    cacahePosX[idx] = screenSizeX / 2 * 1.2
                                    -- DECOMPILER ERROR at PC1053: Confused about usage of register: R14 in 'UnsetPending'

                                    cachePosY[idx] = screenSizeY / 2 * 0.85
                                  else
                                    -- DECOMPILER ERROR at PC1069: Confused about usage of register: R14 in 'UnsetPending'

                                    if idx == panelID.KeyGuide then
                                      cachePosX[idx] = (((UiSet.panelPool)[panelID.KeyGuide]).control):GetSizeX() / 3
                                      -- DECOMPILER ERROR at PC1080: Confused about usage of register: R14 in 'UnsetPending'

                                      cachePosY[idx] = (((UiSet.panelPool)[panelID.KeyGuide]).control):GetSizeY() * 2.3
                                    else
                                      -- DECOMPILER ERROR at PC1088: Confused about usage of register: R14 in 'UnsetPending'

                                      if idx == panelID.SkillCoolTime then
                                        cachePosX[idx] = screenSizeX * 0.33
                                        -- DECOMPILER ERROR at PC1091: Confused about usage of register: R14 in 'UnsetPending'

                                        cachePosY[idx] = screenSizeY * 0.42
                                      else
                                        -- DECOMPILER ERROR at PC1108: Confused about usage of register: R14 in 'UnsetPending'

                                        if idx == panelID.MainQuest then
                                          cachePosX[idx] = screenSizeX - (((UiSet.panelPool)[panelID.MainQuest]).control):GetSizeX() - 20
                                          -- DECOMPILER ERROR at PC1128: Confused about usage of register: R14 in 'UnsetPending'

                                          cachePosY[idx] = (((UiSet.panelPool)[panelID.Radar]).control):GetPosY() + (((UiSet.panelPool)[panelID.Radar]).control):GetSizeY() + 10
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
              if idx == panelID.NewQuickSlot0 or idx == panelID.NewQuickSlot1 or idx == panelID.NewQuickSlot2 or idx == panelID.NewQuickSlot3 or idx == panelID.NewQuickSlot4 or idx == panelID.NewQuickSlot5 or idx == panelID.NewQuickSlot6 or idx == panelID.NewQuickSlot7 or idx == panelID.NewQuickSlot8 or idx == panelID.NewQuickSlot9 or idx == panelID.NewQuickSlot10 or idx == panelID.NewQuickSlot11 or idx == panelID.NewQuickSlot12 or idx == panelID.NewQuickSlot13 or idx == panelID.NewQuickSlot14 or idx == panelID.NewQuickSlot15 or idx == panelID.NewQuickSlot16 or idx == panelID.NewQuickSlot17 or idx == panelID.NewQuickSlot18 or idx == panelID.NewQuickSlot19 then
                local panelIdx = idx - panelID.NewQuickSlot0
                -- DECOMPILER ERROR at PC1222: Confused about usage of register: R15 in 'UnsetPending'

                cachePosX[idx] = screenSizeX * 0.35 + (((panelControl[idx]).control):GetSizeX() + 5) * panelIdx
                -- DECOMPILER ERROR at PC1231: Confused about usage of register: R15 in 'UnsetPending'

                cachePosY[idx] = screenSizeY - ((panelControl[idx]).control):GetSizeY() - 5
              end
            end
            do
              -- DECOMPILER ERROR at PC1232: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC1232: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC1232: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC1232: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
      Panel_NewEquip_EffectLastUpdate()
      FGlobal_ResetRadarUI()
      HouseNaviBasicInitPosition()
      FGlobal_PetListNew_NoPet()
      PartyPanel_Repos()
      local count = ToClient_getChattingPanelCount()
      for chattingPanelindex = 0, count - 1 do
        Chatting_setIsOpenValue(chattingPanelindex, ChatPanelIsOpenState[chattingPanelindex + 1])
        -- DECOMPILER ERROR at PC1257: Confused about usage of register: R15 in 'UnsetPending'

        ChatPanelIsOpenState[chattingPanelindex + 1] = false
      end
      Chatting_setIsOpenValue(0, true)
      -- DECOMPILER ERROR at PC1264: Confused about usage of register: R11 in 'UnsetPending'

      ChatPanelIsOpenState[1] = true
      FGlobal_ChattingPanel_Reset()
      FGlobal_NewQuickSlot_InitPos(false)
      FGlobal_SkillCommand_ResetPosition()
      resetGameUI()
      UiSet_update()
      ToClient_SaveUiInfo(true)
      FGlobal_MyHouseNavi_Update()
    end
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_ALLINTERFACERESET_CONFIRM")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_UI_SETTING_ALLINTERFACERESET"), content = messageBoxMemo, functionYes = reset_GameUI, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

UiSet_Initialize()
UiSet_registEventHandler()
;
(UiSave.btn_SaveUI1):addInputEvent("Mouse_LUp", "savePresetInfo( " .. 0 .. ")")
;
(UiSave.btn_SaveUI2):addInputEvent("Mouse_LUp", "savePresetInfo( " .. 1 .. ")")
;
(UiSave.btn_SaveUI3):addInputEvent("Mouse_LUp", "savePresetInfo( " .. 2 .. ")")
;
(UiSave.btn_SaveDefault):addInputEvent("Mouse_LUp", "HandleClicked_UiSet_ConfirmSetting()")
;
(UiSet.btn_UIFreeSet1):addInputEvent("Mouse_LUp", "applyPresetInfo( " .. 0 .. ")")
;
(UiSet.btn_UIFreeSet2):addInputEvent("Mouse_LUp", "applyPresetInfo( " .. 1 .. ")")
;
(UiSet.btn_UIFreeSet3):addInputEvent("Mouse_LUp", "applyPresetInfo( " .. 2 .. ")")
savePresetInfo = function(presetIndex)
  -- function num : 0_25 , upvalues : UiSet, panelControl, panelID
  local currentScreenSize = {x = getScreenSizeX(), y = getScreenSizeY()}
  for idx = 1, UiSet.panelCount do
    local slot = ((UiSet.panelPool)[idx]).control
    local controlPos = float2()
    controlPos.x = slot:GetPosX()
    controlPos.y = slot:GetPosY()
    local rateX = controlPos.x + slot:GetSizeX() / 2
    local rateY = controlPos.y + slot:GetSizeY() / 2
    local relativePos = float2()
    relativePos.x = rateX / currentScreenSize.x
    relativePos.y = rateY / currentScreenSize.y
    local isShow = (panelControl[idx]).isShow
    local controlShowToggle = (((UiSet.panelPool)[idx]).close):IsCheck()
    local uiType = (panelControl[idx]).PAGameUIType
    local chatWindowIndex = 0
    if panelID.Chat0 <= idx and idx <= panelID.Chat4 then
      chatWindowIndex = idx - panelID.Chat0
      local chatPanel = ToClient_getChattingPanel(idx - panelID.Chat0)
      local chatPanelSize = float2()
      chatPanelSize.x = chatPanel:getPanelSizeX()
      chatPanelSize.y = chatPanel:getPanelSizeY()
      ToClient_setUISettingChattingPanelInfo(presetIndex, chatWindowIndex, chatPanel:isOpen(), chatPanel:isCombinedToMainPanel(), uiType, controlPos, controlShowToggle, relativePos, chatPanelSize, setUISettingChattingPanelInfo)
      ToClient_setUISettingChattingOption(presetIndex, chatWindowIndex, Chatting_getUsedSmoothChattingUp())
      ;
      ((panelControl[idx]).control):SetSize(sizeX, sizeY)
    end
    do
      do
        ToClient_setUISettingPanelInfo(uiType, controlPos.x, controlPos.y, controlShowToggle, chatWindowIndex, relativePos.x, relativePos.y)
        -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  ;
  (ToClient_getGameUIManagerWrapper()):saveUISettingPresetInfo(presetIndex)
  ;
  (ToClient_getGameUIManagerWrapper()):saveUISettingChattingPresetInfo(presetIndex)
  HandleClicked_UiSet_ConfirmSetting()
end

applyPresetInfo = function(presetIndex)
  -- function num : 0_26 , upvalues : UiSet, panelID, panelControl
  if (ToClient_getGameUIManagerWrapper()):isPresetListEmpty(presetIndex) then
    return 
  end
  for idx = 1, UiSet.panelCount do
    local chatWindowIndex = 0
    if panelID.Chat0 <= idx and idx <= panelID.Chat4 then
      chatWindowIndex = idx - panelID.Chat0
      ToClient_getUISettingChattingPanelInfo(presetIndex, chatWindowIndex)
    end
    ToClient_getUISettingPanelInfo(presetIndex, idx, (panelControl[idx]).PAGameUIType, chatWindowIndex)
  end
  UiSet_update()
  UiSet_ConfrimSetting_Sub(false)
end

FromClient_getUiSettingChattingPanelInfo = function(chatWindowIndex, isOpen, isCombined, sizeX, sizeY, isUsedSmoothChattingup)
  -- function num : 0_27 , upvalues : panelID, closePanelState, closeEmptyPanelState, ChatPanelIsOpenState, UiSet, panelControl
  local index = chatWindowIndex + panelID.Chat0
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R7 in 'UnsetPending'

  closePanelState[chatWindowIndex] = false
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R7 in 'UnsetPending'

  closeEmptyPanelState[chatWindowIndex] = false
  local chatPanel = ToClient_getChattingPanel(chatWindowIndex)
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R8 in 'UnsetPending'

  if isOpen then
    ChatPanelIsOpenState[chatWindowIndex + 1] = true
    HandleClicked_Chatting_AddTabByIndex(chatWindowIndex)
    if index == panelID.Chat0 then
      (((UiSet.panelPool)[index]).control):SetShow(true)
      ;
      (((UiSet.panelPool)[index]).close):SetShow(true)
      ;
      ((panelControl[index]).control):SetSize(sizeX, sizeY)
      ;
      (((UiSet.panelPool)[index]).control):SetSize(sizeX, sizeY)
      chatPanel:setPanelSize(sizeX, sizeY)
    else
      if isCombined then
        HandleClicked_Chatting_Close(chatWindowIndex)
        ;
        (((UiSet.panelPool)[index]).control):SetShow(false)
        ;
        (((UiSet.panelPool)[index]).close):SetShow(false)
      else
        HandleClicked_Chatting_Division(chatWindowIndex)
        ;
        (((UiSet.panelPool)[index]).control):SetShow(true)
        ;
        (((UiSet.panelPool)[index]).close):SetShow(true)
        ;
        ((panelControl[index]).control):SetSize(sizeX, sizeY)
        ;
        (((UiSet.panelPool)[index]).control):SetSize(sizeX, sizeY)
        chatPanel:setPanelSize(sizeX, sizeY)
      end
    end
  else
    if isCombined == false or index == panelID.Chat0 then
      if index ~= panelID.Chat0 then
        HandleClicked_Chatting_Division(chatWindowIndex)
      end
      ;
      (((UiSet.panelPool)[index]).control):SetShow(true)
      ;
      (((UiSet.panelPool)[index]).close):SetShow(true)
      ;
      ((panelControl[index]).control):SetSize(sizeX, sizeY)
      ;
      (((UiSet.panelPool)[index]).control):SetSize(sizeX, sizeY)
      ;
      ((panelControl[index]).control):SetShow(true)
      chatPanel:setPanelSize(sizeX, sizeY)
      -- DECOMPILER ERROR at PC166: Confused about usage of register: R8 in 'UnsetPending'

      closeEmptyPanelState[chatWindowIndex] = true
      -- DECOMPILER ERROR at PC169: Confused about usage of register: R8 in 'UnsetPending'

      ChatPanelIsOpenState[chatWindowIndex + 1] = false
    else
      ;
      (((UiSet.panelPool)[index]).control):SetShow(false)
      ;
      (((UiSet.panelPool)[index]).close):SetShow(false)
      HandleClicked_Chatting_Close(chatWindowIndex)
      -- DECOMPILER ERROR at PC189: Confused about usage of register: R8 in 'UnsetPending'

      closePanelState[chatWindowIndex] = true
    end
  end
  Chatting_setUsedSmoothChattingUp(isUsedSmoothChattingup)
end

FromClient_getUiSettingPanelInfo = function(panelIndex, posX, posY, isShow, chatWindowIndex, relativePosX, relativePosY)
  -- function num : 0_28 , upvalues : panelControl, UiSet, closeEmptyPanelState, panelID
  if (panelControl[panelIndex]).posFixed == false then
    (((UiSet.panelPool)[panelIndex]).control):SetPosX(posX)
    ;
    (((UiSet.panelPool)[panelIndex]).control):SetPosY(posY)
    ;
    (((UiSet.panelPool)[panelIndex]).control):SetRelativePosX(relativePosX)
    ;
    (((UiSet.panelPool)[panelIndex]).control):SetRelativePosY(relativePosY)
    ;
    ((panelControl[panelIndex]).control):SetPosX(posX)
    ;
    ((panelControl[panelIndex]).control):SetPosY(posY)
    ;
    ((panelControl[panelIndex]).control):SetRelativePosX(relativePosX)
    ;
    ((panelControl[panelIndex]).control):SetRelativePosY(relativePosY)
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (panelControl[panelIndex]).isChange = true
  else
    -- DECOMPILER ERROR at PC63: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (panelControl[panelIndex]).isChange = false
  end
  ;
  (((UiSet.panelPool)[panelIndex]).control):SetShow(isShow)
  ;
  ((panelControl[panelIndex]).control):SetShow(isShow)
  if closeEmptyPanelState[panelIndex - panelID.Chat0] == false then
    ((panelControl[panelIndex]).control):SetShow(isShow)
  end
  if panelIndex == panelID.GameTip then
    Panel_GameTipMask:SetShow(isShow)
  end
  if (((UiSet.panelPool)[panelIndex]).close):IsCheck() ~= isShow then
    if panelIndex == panelID.ActionGuide then
      isChecked_SkillCommand = isShow
    end
    if panelIndex ~= panelID.ServantIcon and panelIndex ~= panelID.House and panelIndex ~= panelID.NewEquip and panelIndex ~= panelID.Party and panelIndex ~= panelID.QuickSlot and panelIndex ~= panelID.Adrenallin and panelIndex ~= panelID.LargeParty then
      HandleClicked_UiSet_ControlShowToggle(panelIndex)
    end
  end
end

FromClient_applyChattingOptionToLua = function(presetIndex, chatWindowIndex, chatFontSizeType, chatNameType, isCombined, transparency, isUsedSmoothChattingUp)
  -- function num : 0_29
  ChattingOption_Open(chatWindowIndex, chatWindowIndex, isCombined)
  FGlobal_Chatting_PanelTransparency(chatWindowIndex, transparency, false)
  HandleClicked_ChattingTypeFilter_Notice(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_World(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_Battle(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_Public(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_RolePlay(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_Team(chatWindowIndex)
  HandleClicked_ChattingDivision()
  HandleClicked_ChattingTypeFilter_WorldWithItem(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_Guild(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_Party(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_Private(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_Arsha(chatWindowIndex)
  HandleClicked_ChattingTypeFilter_System(chatWindowIndex)
  HandleClicked_ChattingSystemTypeFilter_Undefine(chatWindowIndex)
  HandleClicked_ChattingSystemTypeFilter_PrivateItem(chatWindowIndex)
  HandleClicked_ChattingSystemTypeFilter_PartyItem(chatWindowIndex)
  HandleClicked_ChattingSystemTypeFilter_Market(chatWindowIndex)
  HandleClicked_ChattingSystemTypeFilter_Worker(chatWindowIndex)
  HandleClicked_ChattingSystemTypeFilter_Harvest(chatWindowIndex)
  HandleClicked_ChattingColor_Notice(chatWindowIndex)
  HandleClicked_ChattingColor_World(chatWindowIndex)
  HandleClicked_ChattingColor_Public(chatWindowIndex)
  HandleClicked_ChattingColor_RolePlay(chatWindowIndex)
  HandleClicked_ChattingColor_Team(chatWindowIndex)
  HandleClicked_ChattingColor_WorldWithItem(chatWindowIndex)
  HandleClicked_ChattingColor_Guild(chatWindowIndex)
  HandleClicked_ChattingColor_Party(chatWindowIndex)
  HandleClicked_ChattingColor_Private(chatWindowIndex)
  HandleClicked_ChattingColor_Arsha(chatWindowIndex)
  HandleClicked_ChattingColor_MainSystem(chatWindowIndex)
  Panel_ChatOption:SetShow(false, false)
  Panel_ChatOption:SetIgnore(true)
  ChattingColor_Hide()
  Chatting_setUsedSmoothChattingUp(isUsedSmoothChattingUp)
  ChattingOption_UpdateChattingAnimationControl(isUsedSmoothChattingUp)
  setisChangeFontSize(true)
end

registerEvent("FromClient_getUiSettingPanelInfo", "FromClient_getUiSettingPanelInfo")
registerEvent("FromClient_getUiSettingChattingPanelInfo", "FromClient_getUiSettingChattingPanelInfo")
registerEvent("FromClient_applyChattingOptionToLua", "FromClient_applyChattingOptionToLua")
registerEvent("onScreenResize", "UiSet_OnScreenEvent")
renderMode:setClosefunctor(renderMode, FGlobal_UiSet_Close)

