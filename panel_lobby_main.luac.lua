-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\lobby\panel_lobby_main.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local ePcWorkingType = CppEnums.PcWorkType
local UI_Class = CppEnums.ClassType
local const_64 = Defines.s64_const
local UCT_BUTTON = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON
local UCT_RADIOBUTTON = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON
local UCT_STATICTEXT = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT
local UCT_STATIC = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC
Panel_CharacterSelect:SetShow(false, false)
local CCSC_Frame = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Frame_CharacterSelect")
local _frameContents = (UI.getChildControl)(CCSC_Frame, "Frame_1_Content")
local _frameScroll = (UI.getChildControl)(CCSC_Frame, "Frame_1_VerticalScroll")
local bottomFrame = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Frame_BottomDesc")
local _frameBottomDesc = (UI.getChildControl)(bottomFrame, "Frame_1_Content")
local Panel_Lobby_ClassUI = {
ClassButtons = {}
, 
ClassNames = {}
, 
ClassStatus = {}
}
local txt_BottomDesc = (UI.getChildControl)(_frameBottomDesc, "StaticText_Desc")
-- DECOMPILER ERROR at PC73: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Warrior] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Warrior")
-- DECOMPILER ERROR at PC81: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Ranger] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Ranger")
-- DECOMPILER ERROR at PC89: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Sorcerer] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Sorcer")
-- DECOMPILER ERROR at PC97: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Giant] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Giant")
-- DECOMPILER ERROR at PC105: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Tamer] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Tamer")
-- DECOMPILER ERROR at PC113: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_BladeMaster] = (UI.getChildControl)(_frameContents, "RadioButton_Select_BladeMaster")
-- DECOMPILER ERROR at PC121: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_BladeMasterWomen] = (UI.getChildControl)(_frameContents, "RadioButton_Select_BladeMasterWomen")
-- DECOMPILER ERROR at PC129: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Valkyrie] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Valkyrie")
-- DECOMPILER ERROR at PC137: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Wizard] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Wizard")
-- DECOMPILER ERROR at PC145: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_WizardWomen] = (UI.getChildControl)(_frameContents, "RadioButton_Select_WizardWomen")
-- DECOMPILER ERROR at PC153: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_NinjaWomen] = (UI.getChildControl)(_frameContents, "RadioButton_Select_NinjaWomen")
-- DECOMPILER ERROR at PC161: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_NinjaMan] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Kunoichi")
-- DECOMPILER ERROR at PC169: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_ShyWomen] = (UI.getChildControl)(_frameContents, "RadioButton_Select_ShyWomen")
-- DECOMPILER ERROR at PC177: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Shy] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Shy")
-- DECOMPILER ERROR at PC185: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Temp] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Temp")
-- DECOMPILER ERROR at PC193: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_DarkElf] = (UI.getChildControl)(_frameContents, "RadioButton_Select_DarkElf")
-- DECOMPILER ERROR at PC201: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Temp1] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Temp1")
-- DECOMPILER ERROR at PC209: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Temp2] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Temp2")
-- DECOMPILER ERROR at PC217: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Angle] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Angle")
-- DECOMPILER ERROR at PC225: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_Combattant] = (UI.getChildControl)(_frameContents, "RadioButton_Select_Combattant")
-- DECOMPILER ERROR at PC233: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassButtons)[UI_Class.ClassType_CombattantWomen] = (UI.getChildControl)(_frameContents, "RadioButton_Select_CombattantWomen")
-- DECOMPILER ERROR at PC241: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Warrior] = (UI.getChildControl)(_frameContents, "StaticText_WarriorName")
-- DECOMPILER ERROR at PC249: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Ranger] = (UI.getChildControl)(_frameContents, "StaticText_RangerName")
-- DECOMPILER ERROR at PC257: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Sorcerer] = (UI.getChildControl)(_frameContents, "StaticText_SorcerName")
-- DECOMPILER ERROR at PC265: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Giant] = (UI.getChildControl)(_frameContents, "StaticText_GiantName")
-- DECOMPILER ERROR at PC273: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Tamer] = (UI.getChildControl)(_frameContents, "StaticText_TamerName")
-- DECOMPILER ERROR at PC281: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_BladeMaster] = (UI.getChildControl)(_frameContents, "StaticText_BladeMasterName")
-- DECOMPILER ERROR at PC289: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_BladeMasterWomen] = (UI.getChildControl)(_frameContents, "StaticText_BladeMasterWomenName")
-- DECOMPILER ERROR at PC297: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Valkyrie] = (UI.getChildControl)(_frameContents, "StaticText_ValkyrieName")
-- DECOMPILER ERROR at PC305: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Wizard] = (UI.getChildControl)(_frameContents, "StaticText_WizardName")
-- DECOMPILER ERROR at PC313: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_WizardWomen] = (UI.getChildControl)(_frameContents, "StaticText_WizardWomenName")
-- DECOMPILER ERROR at PC321: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_NinjaWomen] = (UI.getChildControl)(_frameContents, "StaticText_NinjaWomenName")
-- DECOMPILER ERROR at PC329: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_NinjaMan] = (UI.getChildControl)(_frameContents, "StaticText_KunoichiName")
-- DECOMPILER ERROR at PC337: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_ShyWomen] = (UI.getChildControl)(_frameContents, "StaticText_ShyWomenName")
-- DECOMPILER ERROR at PC345: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Shy] = (UI.getChildControl)(_frameContents, "StaticText_ShyName")
-- DECOMPILER ERROR at PC353: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Temp] = (UI.getChildControl)(_frameContents, "StaticText_TempName")
-- DECOMPILER ERROR at PC361: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_DarkElf] = (UI.getChildControl)(_frameContents, "StaticText_DarkElfName")
-- DECOMPILER ERROR at PC369: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Temp1] = (UI.getChildControl)(_frameContents, "StaticText_Temp1Name")
-- DECOMPILER ERROR at PC377: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Temp2] = (UI.getChildControl)(_frameContents, "StaticText_Temp2Name")
-- DECOMPILER ERROR at PC385: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Angle] = (UI.getChildControl)(_frameContents, "StaticText_AngleName")
-- DECOMPILER ERROR at PC393: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Combattant] = (UI.getChildControl)(_frameContents, "StaticText_CombattantName")
-- DECOMPILER ERROR at PC401: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_CombattantWomen] = (UI.getChildControl)(_frameContents, "StaticText_CombattantWomenName")
-- DECOMPILER ERROR at PC409: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Warrior] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Warrior")
-- DECOMPILER ERROR at PC417: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Ranger] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Ranger")
-- DECOMPILER ERROR at PC425: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Sorcerer] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Sorcerer")
-- DECOMPILER ERROR at PC433: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Giant] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Giant")
-- DECOMPILER ERROR at PC441: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Tamer] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_BeastMaster")
-- DECOMPILER ERROR at PC449: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_BladeMaster] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_BladerMaster")
-- DECOMPILER ERROR at PC457: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_BladeMasterWomen] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_BladerMasterWomen")
-- DECOMPILER ERROR at PC465: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Valkyrie] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Valkyrie")
-- DECOMPILER ERROR at PC473: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Wizard] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Wizard")
-- DECOMPILER ERROR at PC481: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_WizardWomen] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Wizard")
-- DECOMPILER ERROR at PC489: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_NinjaWomen] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_NinjaWomen")
-- DECOMPILER ERROR at PC497: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_NinjaMan] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_NinjaWomen")
-- DECOMPILER ERROR at PC505: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_ShyWomen] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_NinjaWomen")
-- DECOMPILER ERROR at PC513: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Shy] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_NinjaWomen")
-- DECOMPILER ERROR at PC521: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Temp] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Temp")
-- DECOMPILER ERROR at PC529: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_DarkElf] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_DarkElf")
-- DECOMPILER ERROR at PC537: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Combattant] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Striker")
-- DECOMPILER ERROR at PC545: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Temp1] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Temp1")
-- DECOMPILER ERROR at PC553: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Temp2] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Temp2")
-- DECOMPILER ERROR at PC561: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_Angle] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Temp3")
-- DECOMPILER ERROR at PC569: Confused about usage of register: R17 in 'UnsetPending'

;
(Panel_Lobby_ClassUI.ClassStatus)[UI_Class.ClassType_CombattantWomen] = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Stat_Temp5")
local Panel_Lobby_UI = {CC_CharacterCreateText = (UI.getChildControl)(Panel_CharacterCreate, "StaticText_CharacterCreate"), CC_CharacterNameEdit = (UI.getChildControl)(Panel_CharacterCreate, "Edit_CharacterName"), CC_CreateButton = (UI.getChildControl)(Panel_CharacterCreate, "Button_CharacterCreateStart"), CC_BackButton = (UI.getChildControl)(Panel_CharacterCreate, "Button_Back"), CC_DumiText1 = (UI.getChildControl)(Panel_CharacterCreate, "StaticText_1"), CC_characterCreateBG = (UI.getChildControl)(Panel_CharacterCreate, "Static_BG"), CC_DumiText3 = (UI.getChildControl)(Panel_CharacterCreate, "StaticText_3"), CC_DumiText4 = (UI.getChildControl)(Panel_CharacterCreate, "StaticText_4"), CC_FrameHead = (UI.getChildControl)(Panel_CharacterCreate, "Frame_Head"), CC_FrameHead_Content = nil, CC_FrameHead_Content_Image = nil, CC_FrameHead_Scroll = nil, CC_FrameHair = (UI.getChildControl)(Panel_CharacterCreate, "Frame_Hair"), CC_FrameHair_Content = nil, CC_FrameHair_Content_Image = nil, CC_FrameHair_Scroll = nil, CC_SelectClassButton = (UI.getChildControl)(Panel_CharacterCreate, "Button_SelectClass"), CC_CBTText = (UI.getChildControl)(Panel_CharacterCreate, "StaticText_CBT"), CCSC_CreateTitle = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "StaticText_Title"), CCSC_ClassName = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "StaticText_ClassName"), CCSC_PartLine = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_PartLine"), CCSC_ClassDescBG = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_Desc_BG"), CCSC_ClassDesc = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "StaticText_Description"), CCSC_CreateButton = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Button_CharacterCreateStart"), CCSC_CreateBG = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Static_BG"), CCSC_ClassMovie = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_CharacterCreateSelectClass, "Static_ClassMovie"), CCSC_BackButton = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Button_Back"), CCSC_SelectClassButton = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "Button_SelectClass"), CM_StaticText_CharacterName = (UI.getChildControl)(Panel_CustomizationMain, "StaticText_CharacterName"), CM_Edit_CharacterName = (UI.getChildControl)(Panel_CustomizationMain, "Edit_CharacterName")}
local Character_Status = {_stat_Ctrl = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "StaticText_Stat_Ctrl"), _stat_Att = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "StaticText_Stat_Att"), _stat_Def = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "StaticText_Stat_Def"), _stat_Evd = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "StaticText_Stat_Evd"), _stat_Cmb = (UI.getChildControl)(Panel_CharacterCreateSelectClass, "StaticText_Stat_Cmb")}
local Panel_Lobby_Global_Variable = {
UIList = {}
, UiMaker = nil, characterSelect = -1, notClearValueCharacterSelect = -1, characterSelectType = -1, selectRegionInfo = nil, isWaitLine = false, selectCharacterLevel = -1}
local Panel_Lobby_Enum = {eRotate_Left = 0, eRotate_Right = 1, eDistance_Far = 2, eDistance_Near = 3, eArrow_Up = 4, eArrow_Down = 5, eArrow_Left = 6, eArrow_Right = 7, eCharacterCustomization_HeadMesh = 0, eCharacterCustomization_HairMesh = 1}
local sortCharacterCount = 1
local columnCountByRaw = 4
local columnCount = 0
local rowCount = 0
local classNameStartX = 18
local classNameStartY = 120
local classNameGapX = 17
local classNameGapY = 130
local classButtonStartX = 15
local classButtonGapX = 10
local classButtonGapY = 5
local _CharInfo_BG = (UI.getChildControl)(Panel_CharacterSelect, "Static_CharInfo_BG")
_CharInfo_BG:setGlassBackground(false)
local Panel_CharacterDoing = {_CharInfo_Name = (UI.getChildControl)(Panel_CharacterSelect, "StaticText_CharInfo_Name"), _CharInfo_GaugeBG = (UI.getChildControl)(Panel_CharacterSelect, "Static_CharInfo_GaugeBG"), _CharInfo_Gauge = (UI.getChildControl)(Panel_CharacterSelect, "Progress2_CharInfo_Gauge"), _CharInfo_DoText = (UI.getChildControl)(Panel_CharacterSelect, "StaticText_CharInfo_Do"), _CharInfo_NowPos = (UI.getChildControl)(Panel_CharacterSelect, "StaticText_CharInfo_NowPos"), _CharInfo_WhereText = (UI.getChildControl)(Panel_CharacterSelect, "StaticText_CharInfo_Where"), _ticketNoByRegion = (UI.getChildControl)(Panel_CharacterSelect, "StaticText_TicketNoByRegion")}
local characterSelect_DoWork = {_doWork_BG = (UI.getChildControl)(Panel_CharacterSelect, "Static_Work_BG"), _doWork_GaugeBG = (UI.getChildControl)(Panel_CharacterSelect, "Static_Work_GaugeBG"), _doWork_Gauge = (UI.getChildControl)(Panel_CharacterSelect, "Static_Work_Gauge"), _doWork_Icon = (UI.getChildControl)(Panel_CharacterSelect, "Static_Work_Icon")}
local Panel_Customization = {
group = {}
}
local Panel_Lobby_LDownCheck_ViewControl = {}
local _headContentImage = {}
local _hairContentImage = {}
local characterTicketAbleUI = {}
local isSpecialCharacter = false
FGlobal_SetSpecialCharacter = function(isSC)
  -- function num : 0_0 , upvalues : isSpecialCharacter
  isSpecialCharacter = isSC
end

FGlobal_getIsSpecialCharacter = function()
  -- function num : 0_1 , upvalues : isSpecialCharacter
  return isSpecialCharacter
end

local Panel_Lobby_Function_Initialize = function()
  -- function num : 0_2 , upvalues : Panel_Lobby_UI, Panel_Lobby_ClassUI, UI_Class, UI_TM, classButtonStartX, classButtonGapX, columnCount, classButtonGapY, rowCount, classNameStartX, classNameGapX, sortCharacterCount, columnCountByRaw
  (UI.ASSERT)(Panel_CharacterCreateSelectClass ~= nil, "createCharacter_SelectClass\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CCSC_ClassName ~= nil, "CCSC_ClassName\t\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CCSC_PartLine ~= nil, "CCSC_PartLine\t\t\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CCSC_ClassDescBG ~= nil, "CCSC_ClassDescBG\t\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CCSC_ClassDesc ~= nil, "CCSC_ClassDesc\t\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CCSC_CreateButton ~= nil, "CCSC_CreateButton\t\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CCSC_ClassMovie ~= nil, "CCSC_ClassMovie\t\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CCSC_BackButton ~= nil, "CCSC_BackButton\t\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CCSC_SelectClassButton ~= nil, "CCSC_SelectClassButton\t\tnil")
  ;
  (UI.ASSERT)(Panel_CharacterCreate ~= nil, "createCharacter\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CC_CharacterCreateText ~= nil, "CC_CharacterCreateText\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CC_CharacterNameEdit ~= nil, "CC_CharacterNameEdit\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CC_CreateButton ~= nil, "CC_CreateButton\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CC_BackButton ~= nil, "CC_BackButton\t\t\t\tnil")
  ;
  (UI.ASSERT)(Panel_Lobby_UI.CC_SelectClassButton ~= nil, "CC_SelectClassButton\t\tnil")
  if isGameServiceTypeKor() then
    (Panel_Lobby_UI.CC_CharacterNameEdit):SetMaxInput(15)
  elseif isGameServiceTypeDev() then
    (Panel_Lobby_UI.CC_CharacterNameEdit):SetMaxInput(15)
  else
    (Panel_Lobby_UI.CC_CharacterNameEdit):SetMaxInput(30)
  end
  -- DECOMPILER ERROR at PC180: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_UI.CC_FrameHead_Content = (UI.getChildControl)(Panel_Lobby_UI.CC_FrameHead, "Frame_Head_Content")
  -- DECOMPILER ERROR at PC188: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_UI.CC_FrameHead_Content_Image = (UI.getChildControl)(Panel_Lobby_UI.CC_FrameHead_Content, "Frame_Head_Content_Image")
  -- DECOMPILER ERROR at PC196: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_UI.CC_FrameHead_Scroll = (UI.getChildControl)(Panel_Lobby_UI.CC_FrameHead, "Frame_Head_Scroll")
  -- DECOMPILER ERROR at PC204: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_UI.CC_FrameHair_Content = (UI.getChildControl)(Panel_Lobby_UI.CC_FrameHair, "Frame_Hair_Content")
  -- DECOMPILER ERROR at PC212: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_UI.CC_FrameHair_Content_Image = (UI.getChildControl)(Panel_Lobby_UI.CC_FrameHair_Content, "Frame_Hair_Content_Image")
  -- DECOMPILER ERROR at PC220: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_UI.CC_FrameHair_Scroll = (UI.getChildControl)(Panel_Lobby_UI.CC_FrameHair, "Frame_Hair_Scroll")
  Panel_CharacterCreate:SetShow(false, false)
  Panel_CharacterCreateSelectClass:SetShow(false, false)
  ;
  (Panel_Lobby_UI.CCSC_CreateBG):SetSize(450, getScreenSizeY())
  ;
  (Panel_Lobby_UI.CC_characterCreateBG):setGlassBackground(true)
  ;
  (Panel_Lobby_UI.CCSC_CreateBG):setGlassBackground(true)
  ;
  (Panel_Lobby_UI.CCSC_ClassName):addInputEvent("Mouse_LUp", "")
  ;
  (Panel_Lobby_UI.CCSC_PartLine):addInputEvent("Mouse_LUp", "")
  ;
  (Panel_Lobby_UI.CCSC_ClassDescBG):addInputEvent("Mouse_LUp", "")
  ;
  (Panel_Lobby_UI.CCSC_ClassDesc):addInputEvent("Mouse_LUp", "")
  ;
  (Panel_Lobby_UI.CCSC_CreateButton):addInputEvent("Mouse_LUp", "changeCreateCharacterMode()")
  ;
  (Panel_Lobby_UI.CCSC_BackButton):addInputEvent("Mouse_LUp", "Panel_CharacterCreateCancel()")
  ;
  (Panel_Lobby_UI.CCSC_SelectClassButton):addInputEvent("Mouse_LUp", "")
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Warrior]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Ranger]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Sorcerer]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Giant]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Tamer]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_BladeMaster]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_BladeMasterWomen]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Valkyrie]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Wizard]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_WizardWomen]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_NinjaWomen]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_NinjaMan]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_ShyWomen]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Shy]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Temp]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_DarkElf]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Combattant]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Temp1]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Temp2]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_CombattantWomen]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Warrior]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_WARRIOR"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Ranger]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_RANGER"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Sorcerer]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_SOCERER"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Giant]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_GIANT"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Tamer]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_TAMER"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_BladeMaster]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_BLADERMASTER"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_BladeMasterWomen]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_BLADERMASTERWOMEN"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Valkyrie]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_VALKYRIE"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Wizard]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_WIZARD"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_WizardWomen]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_WIZARDWOMEN"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_NinjaWomen]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_KUNOICHI"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_NinjaMan]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_NINJA"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_ShyWomen]):SetText("샤이 여자")
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Shy]):SetText("샤이 남자")
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Temp]):SetText("임시")
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_DarkElf]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_DARKELF"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Combattant]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHARACTERCREATE_SELECTCLASS_STRIKER"))
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Temp1]):SetText("임시1")
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_Temp2]):SetText("임시2")
  ;
  ((Panel_Lobby_ClassUI.ClassNames)[UI_Class.ClassType_CombattantWomen]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_CLASSTYPE_COMBATTANTWOMEN"))
  for index = 0, UI_Class.ClassType_Count - 1 do
    if (Panel_Lobby_ClassUI.ClassButtons)[index] ~= nil then
      ((Panel_Lobby_ClassUI.ClassButtons)[index]):addInputEvent("Mouse_LUp", "Panel_Lobby_function_SelectClassType(" .. R8_PC709 .. ", true)")
      ;
      ((Panel_Lobby_ClassUI.ClassButtons)[index]):addInputEvent("Mouse_On", "Panel_Lobby_SelectClass_MouseEvent(" .. R8_PC709 .. ", true)")
      -- DECOMPILER ERROR at PC727: Overwrote pending register: R8 in 'AssignReg'

      ;
      ((Panel_Lobby_ClassUI.ClassButtons)[index]):addInputEvent("Mouse_Out", "Panel_Lobby_SelectClass_MouseEvent(" .. R8_PC709 .. ", false)")
    end
  end
  local count = getPossibleClassCount()
  for index = 0, count - 1 do
    local classType = getPossibleClassTypeFromIndex(index)
    local classButton = (Panel_Lobby_ClassUI.ClassButtons)[classType]
    local className = (Panel_Lobby_ClassUI.ClassNames)[classType]
    -- DECOMPILER ERROR at PC749: Overwrote pending register: R8 in 'AssignReg'

    if classButton ~= nil then
      R8_PC709 = R8_PC709(classButton)
      if R8_PC709 then
        R8_PC709(classButton, classButtonStartX + classButton:GetPosX() + (classButton:GetSizeX() + classButtonGapX) * columnCount)
        -- DECOMPILER ERROR at PC766: Overwrote pending register: R8 in 'AssignReg'

        R8_PC709(classButton, classButton:GetPosY() + (classButton:GetSizeY() + classButtonGapY) * rowCount)
        -- DECOMPILER ERROR at PC777: Overwrote pending register: R8 in 'AssignReg'

        R8_PC709(className, classNameStartX + className:GetPosX() + (className:GetSizeX() + classNameGapX) * columnCount)
        -- DECOMPILER ERROR at PC790: Overwrote pending register: R8 in 'AssignReg'

        R8_PC709(className, classButton:GetPosY() + classButton:GetSizeY() - className:GetTextSizeY() - 10)
        -- DECOMPILER ERROR at PC801: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC803: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC806: Overwrote pending register: R8 in 'AssignReg'

        if R8_PC709 == 0 then
          columnCount = R8_PC709
          -- DECOMPILER ERROR at PC808: Overwrote pending register: R8 in 'AssignReg'

          -- DECOMPILER ERROR at PC809: Overwrote pending register: R8 in 'AssignReg'

          rowCount = R8_PC709
        else
          -- DECOMPILER ERROR at PC812: Overwrote pending register: R8 in 'AssignReg'

          -- DECOMPILER ERROR at PC813: Overwrote pending register: R8 in 'AssignReg'

          columnCount = R8_PC709
        end
        -- DECOMPILER ERROR at PC815: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC816: Overwrote pending register: R8 in 'AssignReg'

        sortCharacterCount = R8_PC709
        -- DECOMPILER ERROR at PC818: Overwrote pending register: R8 in 'AssignReg'

        R8_PC709(className, 88, ((Panel_Lobby_ClassUI.ClassNames)[classType]):GetTextSizeY() + 5)
      end
    end
  end
  ;
  (Panel_Lobby_UI.CC_SelectClassButton):addInputEvent("Mouse_LUp", "changeCreateCharacterMode_SelectClass()")
  ;
  (Panel_Lobby_UI.CC_CreateButton):addInputEvent("Mouse_LUp", "Panel_CharacterCreateOk()")
  ;
  (Panel_Lobby_UI.CC_BackButton):addInputEvent("Mouse_LUp", "Panel_CharacterCreateCancel()")
  local scrX = getScreenSizeX()
  do
    local scrY = getScreenSizeY()
    ;
    (Panel_Lobby_UI.CCSC_ClassMovie):SetPosX(scrX - 441)
    ;
    (Panel_Lobby_UI.CCSC_ClassMovie):SetPosY(scrY - 372)
    ;
    (Panel_Lobby_UI.CCSC_ClassMovie):SetUrl(422, 237, "coui://UI_Data/UI_Html/Class_Movie.html")
    ;
    (Panel_Lobby_UI.CCSC_ClassMovie):SetSize(422, 237)
    ;
    (Panel_Lobby_UI.CCSC_ClassMovie):SetSpanSize(-1, 0)
    ;
    (Panel_Lobby_UI.CCSC_ClassMovie):SetShow(true)
    -- DECOMPILER ERROR: 22 unprocessed JMP targets
  end
end

local Panel_Lobby_function_StartUp_CreateCharacter_SelectClass = function()
  -- function num : 0_3 , upvalues : UI_Class, Panel_Lobby_Global_Variable, _frameContents, Character_Status, Panel_Lobby_UI, bottomFrame, CCSC_Frame, _frameScroll, Panel_Lobby_ClassUI
  Panel_Lobby_function_SelectClassType(UI_Class.ClassType_Warrior)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_Global_Variable.UiMaker = Panel_CharacterCreateSelectClass
  ;
  (Panel_Lobby_Global_Variable.UiMaker):SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_CharacterCreateSelectClass:SetShow(true, false)
  Panel_CharacterCreateSelectClass:SetSize(getScreenSizeX(), getScreenSizeY())
  _frameContents:ComputePos()
  for _,value in pairs(Character_Status) do
    value:ComputePos()
  end
  for _,value in pairs(Panel_Lobby_UI) do
    value:ComputePos()
  end
  bottomFrame:ComputePos()
  ;
  (bottomFrame:GetVScroll()):SetControlTop()
  bottomFrame:UpdateContentPos()
  bottomFrame:UpdateContentScroll()
  CCSC_Frame:ComputePos()
  ;
  (CCSC_Frame:GetVScroll()):SetControlTop()
  CCSC_Frame:UpdateContentPos()
  CCSC_Frame:UpdateContentScroll()
  local scrSizeY = getScreenSizeY()
  local sumSizeY = scrSizeY - ((Panel_Lobby_UI.CCSC_ClassName):GetSizeY() + (Panel_Lobby_UI.CCSC_ClassMovie):GetSizeY() + (Panel_Lobby_UI.CCSC_ClassDescBG):GetSizeY() + 72)
  CCSC_Frame:SetSize(_frameContents:GetSizeX(), sumSizeY)
  if sumSizeY < _frameContents:GetSizeY() then
    _frameScroll:SetShow(true)
  else
    _frameScroll:SetShow(false)
  end
  for classIndex = 0, UI_Class.ClassType_Count - 1 do
    local classButton = (Panel_Lobby_ClassUI.ClassButtons)[classIndex]
    local className = (Panel_Lobby_ClassUI.ClassNames)[classIndex]
    local classStatus = (Panel_Lobby_ClassUI.ClassStatus)[classIndex]
    if classButton ~= nil then
      classButton:SetShow(false)
      classButton:ComputePos()
    end
    if className ~= nil then
      className:SetShow(false)
      className:ComputePos()
    end
    if classStatus ~= nil then
      classStatus:ComputePos()
    end
  end
  local ClassBtn_Show = function(classIndex)
    -- function num : 0_3_0 , upvalues : Panel_Lobby_ClassUI
    local classButton = (Panel_Lobby_ClassUI.ClassButtons)[classIndex]
    local className = (Panel_Lobby_ClassUI.ClassNames)[classIndex]
    if classButton ~= nil then
      classButton:SetShow(true)
    end
    if className ~= nil then
      className:SetShow(true)
    end
  end

  local count = getPossibleClassCount()
  for index = 0, count - 1 do
    classType = getPossibleClassTypeFromIndex(index)
    ClassBtn_Show(classType)
  end
end

Panel_Lobby_Function_showCharacterCreate_SelectClass = function()
  -- function num : 0_4 , upvalues : Panel_Lobby_function_StartUp_CreateCharacter_SelectClass
  FGlobal_CharacterSelect_Close()
  Panel_Lobby_function_DeleteButton()
  Panel_Lobby_function_ClearData()
  Panel_Lobby_function_StartUp_CreateCharacter_SelectClass()
  Panel_CharacterCreate:SetShow(false, false)
  Panel_Customization_Control:SetShow(false, false)
  Panel_CustomizationMotion:SetShow(false, false)
  Panel_CustomizationExpression:SetShow(false, false)
  Panel_CustomizationCloth:SetShow(false, false)
  Panel_CustomizationTest:SetShow(false, false)
  Panel_CharacterCreateSelectClass:SetShow(true, false)
  Panel_CustomizationMesh:SetShow(false, false)
  Panel_CustomizationMain:SetShow(false, false)
  Panel_CustomizationStatic:SetShow(false, false)
  Panel_CustomizationMessage:SetShow(false, false)
  Panel_CustomizationFrame:SetShow(false, false)
  Panel_CharacterCreateSelectClass:SetSize(getScreenSizeY(), getScreenSizeX())
end

Panel_Lobby_Function_showCharacterCustomization = function(customizationData)
  -- function num : 0_5 , upvalues : Panel_Lobby_UI, Panel_Lobby_Global_Variable
  Panel_Lobby_function_DeleteButton()
  Panel_CharacterCreateSelectClass:SetShow(false, false)
  ;
  (Panel_Lobby_UI.CM_Edit_CharacterName):SetEditText("")
  resizeUIScale()
  ShowCharacterCustomization(customizationData, Panel_Lobby_Global_Variable.characterSelectType, false)
  viewCharacterCreateMode(Panel_Lobby_Global_Variable.characterSelectType)
end

Panel_Lobby_function_ClearData = function()
  -- function num : 0_6 , upvalues : Panel_Lobby_Global_Variable
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_Global_Variable.characterSelect = -1
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_Global_Variable.characterSelectType = -1
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_Global_Variable.selectRegionInfo = nil
end

Panel_Lobby_function_SelectClassType = function(index, isOn)
  -- function num : 0_7 , upvalues : UI_Class, isSpecialCharacter, Panel_Lobby_ClassUI, Panel_Lobby_UI, Panel_Lobby_Global_Variable, UI_TM, txt_BottomDesc, _frameBottomDesc
  if index < UI_Class.ClassType_Count then
    if ToClient_checkCreatePossibleClass(index, isSpecialCharacter) == false then
      return 
    end
    for key,value in pairs(Panel_Lobby_ClassUI.ClassButtons) do
      value:SetMonoTone(true)
      value:SetVertexAniRun("Ani_Color_Reset", true)
      value:EraseAllEffect()
    end
    ;
    ((Panel_Lobby_ClassUI.ClassButtons)[index]):SetMonoTone(false)
    ;
    ((Panel_Lobby_ClassUI.ClassButtons)[index]):AddEffect("UI_CharactorSelcect_Line", true, 10, 4)
    local movieName = getClassMovie(index, isSpecialCharacter)
    if movieName ~= nil then
      (Panel_Lobby_UI.CCSC_ClassMovie):TriggerEvent("PlayMovie", "coui://" .. movieName)
    end
    viewCharacterCreateSelectClassMode(index)
    -- DECOMPILER ERROR at PC60: Confused about usage of register: R3 in 'UnsetPending'

    Panel_Lobby_Global_Variable.characterSelectType = index
    ;
    (Panel_Lobby_UI.CCSC_ClassName):SetText(getClassName(index, isSpecialCharacter))
    ;
    (Panel_Lobby_UI.CCSC_ClassDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (Panel_Lobby_UI.CCSC_ClassDesc):SetText(getClassDescription(index, isSpecialCharacter))
    ;
    (Panel_Lobby_UI.CCSC_ClassDesc):SetShow(false)
    txt_BottomDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
    txt_BottomDesc:SetText(getClassDescription(index, isSpecialCharacter))
    _frameBottomDesc:SetSize(_frameBottomDesc:GetSizeX(), txt_BottomDesc:GetTextSizeY())
    for _,value in pairs(Panel_Lobby_ClassUI.ClassStatus) do
      value:SetShow(false)
    end
    ;
    ((Panel_Lobby_ClassUI.ClassStatus)[index]):SetShow(true)
  end
end

Panel_Lobby_SelectClass_MouseEvent = function(index, isOn)
  -- function num : 0_8 , upvalues : Panel_Lobby_ClassUI
  local classButton = (Panel_Lobby_ClassUI.ClassButtons)[index]
  if classButton ~= nil then
    if isOn == true then
      classButton:SetVertexAniRun("Ani_Color_Bright", true)
    else
      classButton:ResetVertexAni()
    end
  end
end

Panel_CharacterCreateOk = function()
  -- function num : 0_9 , upvalues : Panel_Lobby_Global_Variable, Panel_Lobby_UI, isSpecialCharacter
  chracterCreate(Panel_Lobby_Global_Variable.characterSelectType, (Panel_Lobby_UI.CC_CharacterNameEdit):GetEditText(), isSpecialCharacter)
end

Panel_CharacterCreateOK_NewCustomization = function()
  -- function num : 0_10 , upvalues : Panel_Lobby_UI, Panel_Lobby_Global_Variable, isSpecialCharacter
  local _edit_CharacterName = (Panel_Lobby_UI.CM_Edit_CharacterName):GetEditText()
  local createCharacterFunc = function()
    -- function num : 0_10_0 , upvalues : Panel_Lobby_Global_Variable, _edit_CharacterName, isSpecialCharacter
    chracterCreate(Panel_Lobby_Global_Variable.characterSelectType, _edit_CharacterName, isSpecialCharacter)
  end

  local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOBBY_MAIN_CHARACTERCREATE_RECONFIRM_CHARACTERNAME", "name", _edit_CharacterName)
  local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = createCharacterFunc, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
  ClearFocusEdit()
  closeExplorer()
  Panel_CustomizingAlbum:SetShow(false)
end

Panel_CharacterCreateCancel = function()
  -- function num : 0_11
  Panel_CharacterCreateSelectClass:SetShow(false)
  characterCreateCancel(FGlobal_getIsSpecialCharacter())
end

Panel_Lobby_function_DeleteButton = function()
  -- function num : 0_12 , upvalues : Panel_Lobby_Global_Variable
  if Panel_Lobby_Global_Variable.UiMaker == nil then
    return 
  end
  for _,value in pairs(Panel_Lobby_Global_Variable.UIList) do
    (UI.deleteControl)(value)
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_Global_Variable.UIList = {}
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  Panel_Lobby_Global_Variable.UiMaker = nil
end

Panel_Lobby_Function_Initialize()
registerEvent("EventChangeLobbyStageToCharacterCreate_SelectClass", "Panel_Lobby_Function_showCharacterCreate_SelectClass")
registerEvent("EventCharacterCustomizationInitUi", "Panel_Lobby_Function_showCharacterCustomization")

