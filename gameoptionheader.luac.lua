-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\option\gameoptionheader.luac 

-- params : ...
-- function num : 0
local CONTROL = CppEnums.PA_UI_CONTROL_TYPE
PaGlobal_Option = {
UIMODE = {Main = 1, Spec = 2, Category = 3, Search = 4}
, 
SPEC = {LowNormal = 1, MidNormal = 2, HighNormal = 3, HighestNormal = 4, LowSiege = 5, MidSiege = 6, HighSiege = 7, HighestSiege = 8}
, 
GRAPHIC = {VeryVeryLow = 6, VeryLow = 0, Low = 1, Medium = 2, High = 3, VeryHigh = 4, VeryVeryHigh = 5}
, 
ALERT = {Item = 0, Life = 0, Pvp = 0, Boss = 0, Etc = 0, ChangeRegion = 0, Growth = 0, AttackedOrFail = 0, HorseRace = 0, GetItem = 0, Guild = 0, War = 0, Party = 0}
, 
_ui = {_staticMainTopBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainTopBg"), _staticSubTopBg = (UI.getChildControl)(Panel_Window_cOption, "Static_SubTopBg"), _staticMainBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainBg"), _staticSpecBG = nil, _staticCategoryBG = nil, _list2 = nil, _listSearchBg = (UI.getChildControl)(Panel_Window_cOption, "List2_Search")}
, 
_list2 = {_curCategory = nil, _curFrame = nil, 
_tree2IndexMap = {}
, _selectedKey = nil, _selectedSubKey = nil}
, 
_frames = {
Performance = {Camera = Panel_Performance_Camera, GraphicQuality = Panel_Performance_GraphicQuality, Npc = Panel_Performance_Npc, Optimize = Panel_Performance_Optimize, OptimizeBeta = Panel_Performance_OptimizeBeta}
, 
Function = {Alert = Panel_Function_Alert, Convenience = Panel_Function_Convenience, Etc = Panel_Function_Etc, Interaction = Panel_Function_Interaction, Nation = Panel_Function_Nation, View = Panel_Function_View, Worldmap = Panel_Function_Worldmap}
, 
Graphic = {Camera = Panel_Graphic_Camera, Effect = Panel_Graphic_Effect, Quality = Panel_Graphic_Quality, ScreenShot = Panel_Graphic_ScreenShot, Window = Panel_Graphic_Window}
, 
Interface = {Action = Panel_Interface_Action, Function = Panel_Interface_Function, Mouse = Panel_Interface_Mouse, Pad = Panel_Interface_Pad, QuickSlot = Panel_Interface_QuickSlot, UI = Panel_Interface_UI}
, 
Alert = {Alarm = Panel_Alert_Alarm}
, 
Sound = {Volume = Panel_Sound_Volume, OnOff = Panel_Sound_OnOff}
}
, 
_functions = {}
, 
_elements = {
AimAssist = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
UseNewQuickSlot = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EnableSimpleUI = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
IsOnScreenSaver = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
UIFontSizeType = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ShowNavPathEffectType = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
RefuseRequests = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
IsPvpRefuse = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
IsExchangeRefuse = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
RotateRadarMode = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
HideWindowByAttacked = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AudioResourceType = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
WatermarkNation = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ServiceResourceType = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UseChattingFilter = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
ChatChannelType = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
SelfPlayerNameTagVisible = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
OtherPlayerNameTagVisible = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
PartyPlayerNameTagVisible = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuildPlayerNameTagVisible = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
RankingPlayerNameTagVisible = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineZoneChange = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineQuestNPC = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineNpcIntimacy = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineWarAlly = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineNonWarPlayer = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineEnemy = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineGuild = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineParty = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLinePartyMemberEffect = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
PetRender = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
RenderHitEffect = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
ShowComboGuide = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
HideMastOnCarrier = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
WorkerVisible = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
WorldMapOpenType = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
WorldmapCameraPitchType = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
TextureQuality = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
GraphicOption = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
AntiAliasing = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
SSAO = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
PostFilter = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
Tessellation = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GraphicUltra = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
Dof = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
Representative = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
CharacterEffect = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
SnowPoolOnlyInSafeZone = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
BloodEffect = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
LensBlood = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AutoOptimization = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AutoOptimizationFrameLimit = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 60}
, 
UpscaleEnable = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
PresentLock = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
UseEffectFrameOptimization = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EffectFrameOptimization = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0.1, _sliderValueMax = 25}
, 
UsePlayerEffectDistOptimization = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
PlayerEffectDistOptimization = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 10, _sliderValueMax = 50}
, 
UseCharacterUpdateFrameOptimize = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
UseOtherPlayerUpdate = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
Fov = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 40, _sliderValueMax = 70, _settingRightNow = true}
, 
CameraEffectMaster = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
CameraShakePower = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
MotionBlurPower = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
CameraTranslatePower = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
CameraFovPower = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
LUT = {_controlType = CONTROL.PA_UI_CONTROL_BUTTON, _settingRightNow = true}
, 
MouseInvertX = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
MouseInvertY = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
MouseSensitivityX = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
MouseSensitivityY = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
GameMouseMode = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
IsUIModeMouseLock = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadEnable = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadVibration = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadInvertX = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadInvertY = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadSensitivityX = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
GamePadSensitivityY = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
ScreenShotQuality = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ScreenShotFormat = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
WatermarkAlpha = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 20, _sliderValueMax = 100}
, 
WatermarkScale = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
WatermarkPosition = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
WatermarkService = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ScreenMode = {_isChangeDisplay = true, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ScreenResolution = {_isChangeDisplay = true, _controlType = CONTROL.PA_UI_CONTROL_COMBOBOX, _comboBoxList = nil}
, 
CropModeEnable = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
CropModeScaleX = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 50, _sliderValueMax = 100}
, 
CropModeScaleY = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 50, _sliderValueMax = 100}
, 
UIScale = {_isChangeDisplay = true, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 50, _sliderValueMax = 200}
, 
GammaValue = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = -50, _sliderValueMax = 50, _settingRightNow = true}
, 
ContrastValue = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = -50, _sliderValueMax = 50, _settingRightNow = true}
, 
EffectAlpha = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 30, _sliderValueMax = 100}
, 
SkillPostEffect = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
ColorBlind = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
BlackSpiritNotice = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
ShowCashAlert = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
ShowGuildLoginMessage = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EnableMusic = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EnableSound = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EnableEnv = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EnableRidingSound = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EnableWhisperMusic = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EnableTraySoundOnOff = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
BattleSoundType = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
VolumeMaster = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
VolumeMusic = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
VolumeFx = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
VolumeEnv = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
VolumeDlg = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
VolumeHitFxVolume = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
VolumeHitFxWeight = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
VolumeOtherPlayer = {_controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
AlertItem = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertLife = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertPvp = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertBoss = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertEtc = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertChangeRegion = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertGrowth = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertAttackedOrFail = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertHorseRace = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertGetItem = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertGuild = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertWar = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertParty = {_controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
KeyCustomMode = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON, _settingRightNow = true}
, 
PadFunction1 = {actionInputType = "PadFunction1", _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
PadFunction2 = {actionInputType = "PadFunction2", _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionMoveFront = {actionInputType = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionMoveBack = {actionInputType = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionMoveLeft = {actionInputType = 2, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionMoveRight = {actionInputType = 3, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionAttack1 = {actionInputType = 4, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionAttack2 = {actionInputType = 5, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionDash = {actionInputType = 6, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionJump = {actionInputType = 7, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionInteraction = {actionInputType = 8, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionAutoRun = {actionInputType = 9, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionWeaponInOut = {actionInputType = 10, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionCameraReset = {actionInputType = 11, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionCrouchOrSkill = {actionInputType = 12, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionGrabOrGuard = {actionInputType = 13, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionKick = {actionInputType = 14, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionServantOrder1 = {actionInputType = 15, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionServantOrder2 = {actionInputType = 16, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionServantOrder3 = {actionInputType = 17, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionServantOrder4 = {actionInputType = 18, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot1 = {actionInputType = 19, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot2 = {actionInputType = 20, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot3 = {actionInputType = 21, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot4 = {actionInputType = 22, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot5 = {actionInputType = 23, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot6 = {actionInputType = 24, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot7 = {actionInputType = 25, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot8 = {actionInputType = 26, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot9 = {actionInputType = 27, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot10 = {actionInputType = 28, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot11 = {actionInputType = 29, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot12 = {actionInputType = 30, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot13 = {actionInputType = 31, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot14 = {actionInputType = 32, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot15 = {actionInputType = 33, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot16 = {actionInputType = 34, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot17 = {actionInputType = 35, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot18 = {actionInputType = 36, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot19 = {actionInputType = 37, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionQuickSlot20 = {actionInputType = 38, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionComplicated0 = {actionInputType = 39, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionComplicated1 = {actionInputType = 40, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionComplicated2 = {actionInputType = 41, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionComplicated3 = {actionInputType = 42, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionWalkMode = {actionInputType = 43, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionCameraUp = {actionInputType = 44, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionCameraDown = {actionInputType = 45, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionCameraLeft = {actionInputType = 46, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionCameraRight = {actionInputType = 47, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionCameraRotateGameMode = {actionInputType = 48, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ActionPushToTalk = {actionInputType = 49, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiCursorOnOff = {uiInputType = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiHelp = {uiInputType = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiMentalKnowledge = {uiInputType = 2, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiInventory = {uiInputType = 3, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiBlackSpirit = {uiInputType = 4, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiChat = {uiInputType = 5, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiPlayerInfo = {uiInputType = 6, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiSkill = {uiInputType = 7, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiWorldMap = {uiInputType = 8, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiDyeing = {uiInputType = 9, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiProductionNote = {uiInputType = 10, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiManufacture = {uiInputType = 11, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiGuild = {uiInputType = 12, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiMail = {uiInputType = 13, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiFriendList = {uiInputType = 14, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiPresent = {uiInputType = 15, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiQuestHistory = {uiInputType = 16, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiCashShop = {uiInputType = 18, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiBeautyShop = {uiInputType = 19, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiAlchemySton = {uiInputType = 20, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiHouse = {uiInputType = 21, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiWorker = {uiInputType = 22, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiPet = {uiInputType = 23, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiMaid = {uiInputType = 24, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiServant = {uiInputType = 25, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiGuildServant = {uiInputType = 26, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiDeleteNavigation = {uiInputType = 27, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiCameraSpeedUp = {uiInputType = 28, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiCameraSpeedDown = {uiInputType = 29, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiPositionNotify = {uiInputType = 30, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiInteraction1 = {uiInputType = 31, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiInteraction2 = {uiInputType = 32, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiInteraction3 = {uiInputType = 33, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiInteraction4 = {uiInputType = 34, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiInteraction5 = {uiInputType = 35, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiChatTabPrev = {uiInputType = 36, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiChatTabNext = {uiInputType = 37, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiConfirm = {uiInputType = 38, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiTravelCursorRight = {uiInputType = 39, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiTravelCursorLeft = {uiInputType = 40, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiTravelCursorUp = {uiInputType = 41, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiTravelCursorDown = {uiInputType = 42, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiPanelTravelPrev = {uiInputType = 43, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiPanelTravelNext = {uiInputType = 44, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UiPossessionByBlackSpirit = {uiInputType = 45, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
}
, 
_userInitScreenResolution = {width = 0, height = 0}
, 
_findStrings = {}
, _keyCustomPadMode = nil, _keyCustomInputType = nil, _resetCheck = nil, _availableResolutionList = nil, _screenResolutionCount = nil}
-- DECOMPILER ERROR at PC1574: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AimAssist = function(value)
  -- function num : 0_0
  setAimAssist(value)
end

-- DECOMPILER ERROR at PC1578: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseNewQuickSlot = function(value)
  -- function num : 0_1
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).NewQuickSlot, value, (CppEnums.VariableStorageType).eVariableStorageType_User)
end

-- DECOMPILER ERROR at PC1582: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableSimpleUI = function(value)
  -- function num : 0_2
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil then
    if (selfPlayer:get()):getLevel() > 5 then
      setEnableSimpleUI(value)
    else
      setEnableSimpleUI(false)
    end
  else
    setEnableSimpleUI(false)
  end
end

-- DECOMPILER ERROR at PC1586: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).IsOnScreenSaver = function(value)
  -- function num : 0_3
  setIsOnScreenSaver(value)
end

-- DECOMPILER ERROR at PC1590: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UIFontSizeType = function(value)
  -- function num : 0_4
  setUIFontSizeType(value)
  local addFontSize = convertUIFontTypeToUIFontSize(value)
  ;
  (ToClient_getFontWrapper("BaseFont_10")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_Glow")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_10_Bold")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_10_Normal")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_10_Line")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_10_Glow")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_8")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_8_Bold")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_8_Line")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_8_Glow")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_7_Bold")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_6")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_12")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_12_Yellow")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_12_Bold")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_12_Glow")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("SubTitleFont_14")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("SubTitleFont_14_Bold")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("SubTitleFont_14_Glow")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("TitleFont_18")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_18_Glow")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("TitleFont_22")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_22_Glow")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("HeaderFont_26")):changeCurrentFontSizeBeMore(addFontSize)
  ;
  (ToClient_getFontWrapper("BaseFont_26_Glow")):changeCurrentFontSizeBeMore(addFontSize)
end

-- DECOMPILER ERROR at PC1594: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ShowNavPathEffectType = function(value)
  -- function num : 0_5
  setShowNavPathEffectType(value)
end

-- DECOMPILER ERROR at PC1598: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).RefuseRequests = function(value)
  -- function num : 0_6
  setRefuseRequests(value)
end

-- DECOMPILER ERROR at PC1602: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).IsPvpRefuse = function(value)
  -- function num : 0_7
  setIsPvpRefuse(value)
end

-- DECOMPILER ERROR at PC1606: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).IsExchangeRefuse = function(value)
  -- function num : 0_8
  setIsExchangeRefuse(value)
end

-- DECOMPILER ERROR at PC1610: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).RotateRadarMode = function(value)
  -- function num : 0_9
  setRotateRadarMode(value)
end

-- DECOMPILER ERROR at PC1614: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).HideWindowByAttacked = function(value)
  -- function num : 0_10
  setHideWindowByAttacked(value)
end

-- DECOMPILER ERROR at PC1618: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AudioResourceType = function(value)
  -- function num : 0_11
  setAudioResourceType(PaGlobal_Option:radioButtonMapping_AudioResourceType(value))
end

-- DECOMPILER ERROR at PC1622: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WatermarkNation = function(value)
  -- function num : 0_12
  setWatermarkService(PaGlobal_Option:radioButtonMapping_WatermarkService(value))
end

-- DECOMPILER ERROR at PC1626: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ServiceResourceType = function(value)
  -- function num : 0_13
  ToClient_saveServiceResourceType(PaGlobal_Option:radioButtonMapping_ServiceResourceType(value))
end

-- DECOMPILER ERROR at PC1630: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseChattingFilter = function(value)
  -- function num : 0_14
  setUseChattingFilter(value)
end

-- DECOMPILER ERROR at PC1634: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ChatChannelType = function(value)
  -- function num : 0_15
  ToClient_saveServiceResourceType(PaGlobal_Option:radioButtonMapping_ChatChannelType(value))
end

-- DECOMPILER ERROR at PC1638: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SelfPlayerNameTagVisible = function(value)
  -- function num : 0_16
  setSelfPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1642: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).OtherPlayerNameTagVisible = function(value)
  -- function num : 0_17
  if value == true then
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  setOtherPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1646: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PartyPlayerNameTagVisible = function(value)
  -- function num : 0_18
  if value == true then
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  setPartyPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1650: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuildPlayerNameTagVisible = function(value)
  -- function num : 0_19
  if value == true then
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  setGuildPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1654: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).RankingPlayerNameTagVisible = function(value)
  -- function num : 0_20
  if value == true then
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_NoShow
  end
  setRankingPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1658: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineZoneChange = function(value)
  -- function num : 0_21
  setRenderPlayerColor("ZoneChange", value)
end

-- DECOMPILER ERROR at PC1662: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineQuestNPC = function(value)
  -- function num : 0_22
  setShowQuestActorColor(value)
end

-- DECOMPILER ERROR at PC1666: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineNpcIntimacy = function(value)
  -- function num : 0_23
  setShowHumanRelation(value)
end

-- DECOMPILER ERROR at PC1670: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineWarAlly = function(value)
  -- function num : 0_24
  setRenderPlayerColor("WarAlly", value)
end

-- DECOMPILER ERROR at PC1674: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineNonWarPlayer = function(value)
  -- function num : 0_25
  setRenderPlayerColor("NonWarPlayer", value)
end

-- DECOMPILER ERROR at PC1678: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineEnemy = function(value)
  -- function num : 0_26
  setRenderPlayerColor("Enemy", value)
end

-- DECOMPILER ERROR at PC1682: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineGuild = function(value)
  -- function num : 0_27
  setRenderPlayerColor("Guild", value)
end

-- DECOMPILER ERROR at PC1686: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineParty = function(value)
  -- function num : 0_28
  setRenderPlayerColor("Party", value)
end

-- DECOMPILER ERROR at PC1690: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLinePartyMemberEffect = function(value)
  -- function num : 0_29
  (ToClient_getGameOptionControllerWrapper()):setRenderHitEffectParty(value)
end

-- DECOMPILER ERROR at PC1694: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PetRender = function(value)
  -- function num : 0_30
  setPetRender(value)
end

-- DECOMPILER ERROR at PC1698: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).RenderHitEffect = function(value)
  -- function num : 0_31
  setRenderHitEffect(value)
end

-- DECOMPILER ERROR at PC1702: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ShowComboGuide = function(value)
  -- function num : 0_32
  setShowComboGuide(value)
  if Panel_MovieTheater_320 ~= nil then
    Panel_MovieTheater320_JustClose()
  end
end

-- DECOMPILER ERROR at PC1706: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).HideMastOnCarrier = function(value)
  -- function num : 0_33
  setHideMastOnCarrier(value)
end

-- DECOMPILER ERROR at PC1710: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WorkerVisible = function(value)
  -- function num : 0_34
  ToClient_setWorkerVisible(value)
end

-- DECOMPILER ERROR at PC1714: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WorldMapOpenType = function(value)
  -- function num : 0_35
  setWorldmapOpenType(value)
end

-- DECOMPILER ERROR at PC1718: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WorldmapCameraPitchType = function(value)
  -- function num : 0_36
  setWorldMapCameraPitchType(value)
end

-- DECOMPILER ERROR at PC1722: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).TextureQuality = function(value)
  -- function num : 0_37
  setTextureQuality(PaGlobal_Option:radioButtonMapping_TextureQuality(value))
end

-- DECOMPILER ERROR at PC1726: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GraphicOption = function(value)
  -- function num : 0_38
  setGraphicOption(PaGlobal_Option:radioButtonMapping_GraphicOption(value))
end

-- DECOMPILER ERROR at PC1730: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AntiAliasing = function(value)
  -- function num : 0_39
  setAntiAliasing(value)
end

-- DECOMPILER ERROR at PC1734: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SSAO = function(value)
  -- function num : 0_40
  setSSAO(value)
end

-- DECOMPILER ERROR at PC1738: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PostFilter = function(value)
  -- function num : 0_41
  if value == true then
    setPostFilter(2)
  else
    setPostFilter(1)
  end
end

-- DECOMPILER ERROR at PC1742: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).Tessellation = function(value)
  -- function num : 0_42
  setTessellation(value)
end

-- DECOMPILER ERROR at PC1746: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GraphicUltra = function(value)
  -- function num : 0_43
  setGraphicUltra(value)
end

-- DECOMPILER ERROR at PC1750: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).Dof = function(value)
  -- function num : 0_44
  setDof(value)
end

-- DECOMPILER ERROR at PC1754: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).Representative = function(value)
  -- function num : 0_45
  setRepresentative(value)
end

-- DECOMPILER ERROR at PC1758: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CharacterEffect = function(value)
  -- function num : 0_46
  setCharacterEffect(value)
end

-- DECOMPILER ERROR at PC1762: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SnowPoolOnlyInSafeZone = function(value)
  -- function num : 0_47
  setSnowPoolOnlyInSafeZone(value)
end

-- DECOMPILER ERROR at PC1766: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).BloodEffect = function(value)
  -- function num : 0_48
  if value == true then
    setBloodEffect(2)
  else
    setBloodEffect(0)
  end
end

-- DECOMPILER ERROR at PC1770: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).LensBlood = function(value)
  -- function num : 0_49
  setLensBlood(value)
end

-- DECOMPILER ERROR at PC1774: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AutoOptimization = function(value)
  -- function num : 0_50
  setAutoOptimization(value)
end

-- DECOMPILER ERROR at PC1778: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AutoOptimizationFrameLimit = function(value)
  -- function num : 0_51
  local convertedFrame = (math.ceil)(value * 60)
  local autoOptimization = (PaGlobal_Option._elements).AutoOptimization
  local check = autoOptimization._initValue
  if autoOptimization._curValue ~= nil then
    check = autoOptimization._curValue
  else
    if autoOptimization._applyValue ~= nil then
      check = autoOptimization._applyValue
    end
  end
  if check == true then
    setAutoOptimizationFrameLimit(convertedFrame)
  end
end

-- DECOMPILER ERROR at PC1782: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UpscaleEnable = function(value)
  -- function num : 0_52
  setUpscaleEnable(value)
end

-- DECOMPILER ERROR at PC1786: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PresentLock = function(value)
  -- function num : 0_53
  setPresentLock(value)
end

-- DECOMPILER ERROR at PC1790: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseEffectFrameOptimization = function(value)
  -- function num : 0_54
  setUseOptimizationEffectFrame(value)
end

-- DECOMPILER ERROR at PC1794: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EffectFrameOptimization = function(value)
  -- function num : 0_55
  local convertedFrame = value * 24.9 + 0.1
  local useEffectFrameOptimization = (PaGlobal_Option._elements).UseEffectFrameOptimization
  local check = useEffectFrameOptimization._initValue
  if useEffectFrameOptimization._curValue ~= nil then
    check = useEffectFrameOptimization._curValue
  else
    if useEffectFrameOptimization._applyValue ~= nil then
      check = useEffectFrameOptimization._applyValue
    end
  end
  if check == true then
    setEffectFrameEffectOptimization(convertedFrame)
  end
end

-- DECOMPILER ERROR at PC1798: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UsePlayerEffectDistOptimization = function(value)
  -- function num : 0_56
  setUsePlayerOptimizationEffectFrame(value)
end

-- DECOMPILER ERROR at PC1802: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PlayerEffectDistOptimization = function(value)
  -- function num : 0_57
  local convertedFrame = value * 40 + 10
  local usePlayerEffectDistOptimization = (PaGlobal_Option._elements).UsePlayerEffectDistOptimization
  local check = usePlayerEffectDistOptimization._initValue
  if usePlayerEffectDistOptimization._curValue ~= nil then
    check = usePlayerEffectDistOptimization._curValue
  else
    if usePlayerEffectDistOptimization._applyValue ~= nil then
      check = usePlayerEffectDistOptimization._applyValue
    end
  end
  if check == true then
    setPlayerEffectFrameEffectOptimization(convertedFrame * 100)
  end
end

-- DECOMPILER ERROR at PC1806: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseCharacterUpdateFrameOptimize = function(value)
  -- function num : 0_58
  setUseCharacterDistUpdate(value)
end

-- DECOMPILER ERROR at PC1810: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseOtherPlayerUpdate = function(value)
  -- function num : 0_59
  FromClient_OtherPlayeUpdateNEW(value, true)
end

-- DECOMPILER ERROR at PC1814: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).Fov = function(value)
  -- function num : 0_60
  value = value * 30 + 40
  setFov(value)
end

-- DECOMPILER ERROR at PC1818: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CameraEffectMaster = function(value)
  -- function num : 0_61
  setCameraMasterPower(value)
end

-- DECOMPILER ERROR at PC1822: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CameraShakePower = function(value)
  -- function num : 0_62
  setCameraShakePower(value)
end

-- DECOMPILER ERROR at PC1826: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MotionBlurPower = function(value)
  -- function num : 0_63
  setMotionBlurPower(value)
end

-- DECOMPILER ERROR at PC1830: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CameraTranslatePower = function(value)
  -- function num : 0_64
  setCameraTranslatePower(value)
end

-- DECOMPILER ERROR at PC1834: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CameraFovPower = function(value)
  -- function num : 0_65
  setCameraFovPower(value)
end

-- DECOMPILER ERROR at PC1838: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MouseInvertX = function(value)
  -- function num : 0_66
  setMouseInvertX(value)
end

-- DECOMPILER ERROR at PC1842: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MouseInvertY = function(value)
  -- function num : 0_67
  setMouseInvertY(value)
end

-- DECOMPILER ERROR at PC1846: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MouseSensitivityX = function(value)
  -- function num : 0_68
  local convertedValue = value * 1.9 + 0.1
  setMouseSensitivityX(convertedValue)
end

-- DECOMPILER ERROR at PC1850: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MouseSensitivityY = function(value)
  -- function num : 0_69
  local convertedValue = value * 1.9 + 0.1
  setMouseSensitivityY(convertedValue)
end

-- DECOMPILER ERROR at PC1854: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GameMouseMode = function(value)
  -- function num : 0_70
  setGameMouseMode(value)
end

-- DECOMPILER ERROR at PC1858: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).IsUIModeMouseLock = function(value)
  -- function num : 0_71
  setIsUIModeMouseLock(value)
end

-- DECOMPILER ERROR at PC1862: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadEnable = function(value)
  -- function num : 0_72
  setGamePadEnable(value)
end

-- DECOMPILER ERROR at PC1866: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadVibration = function(value)
  -- function num : 0_73
  setGamePadVibration(value)
end

-- DECOMPILER ERROR at PC1870: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadInvertX = function(value)
  -- function num : 0_74
  setGamePadInvertX(value)
end

-- DECOMPILER ERROR at PC1874: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadInvertY = function(value)
  -- function num : 0_75
  setGamePadInvertY(value)
end

-- DECOMPILER ERROR at PC1878: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadSensitivityX = function(value)
  -- function num : 0_76
  local convertedValue = value * 1.9 + 0.1
  setGamePadSensitivityX(convertedValue)
end

-- DECOMPILER ERROR at PC1882: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadSensitivityY = function(value)
  -- function num : 0_77
  local convertedValue = value * 1.9 + 0.1
  setGamePadSensitivityY(convertedValue)
end

-- DECOMPILER ERROR at PC1886: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ScreenShotQuality = function(value)
  -- function num : 0_78
  setScreenShotQuality(value)
end

-- DECOMPILER ERROR at PC1890: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ScreenShotFormat = function(value)
  -- function num : 0_79
  setScreenShotFormat(value)
end

-- DECOMPILER ERROR at PC1894: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WatermarkAlpha = function(value)
  -- function num : 0_80
  setWatermarkAlpha(value)
end

-- DECOMPILER ERROR at PC1898: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WatermarkScale = function(value)
  -- function num : 0_81
  setWatermarkScale(value)
end

-- DECOMPILER ERROR at PC1902: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WatermarkPosition = function(value)
  -- function num : 0_82
  setWatermarkPosition(value)
end

-- DECOMPILER ERROR at PC1906: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WatermarkService = function(value)
  -- function num : 0_83
  setWatermarkService(PaGlobal_Option:radioButtonMapping_WatermarkService(value))
end

-- DECOMPILER ERROR at PC1910: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ScreenMode = function(value)
  -- function num : 0_84
  setScreenMode(value)
  ischangedeplay = true
end

-- DECOMPILER ERROR at PC1914: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ScreenResolution = function(value)
  -- function num : 0_85
  local width = 1280
  local height = 720
  if value ~= -1 then
    width = (PaGlobal_Option._userInitScreenResolution).width
    height = (PaGlobal_Option._userInitScreenResolution).height
  else
    width = (PaGlobal_Option._availableResolutionList):getDisplayModeWidth(value)
    height = (PaGlobal_Option._availableResolutionList):getDisplayModeHeight(value)
  end
  setScreenResolution(width, height)
end

-- DECOMPILER ERROR at PC1918: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CropModeEnable = function(value)
  -- function num : 0_86
  setCropModeEnable(value)
end

-- DECOMPILER ERROR at PC1922: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CropModeScaleX = function(value)
  -- function num : 0_87
  local convertedScale = 0.5 + value * 0.5
  local cropModeEnable = (PaGlobal_Option._elements).CropModeEnable
  local check = cropModeEnable._initValue
  if cropModeEnable._curValue ~= nil then
    check = cropModeEnable._curValue
  else
    if cropModeEnable._applyValue ~= nil then
      check = cropModeEnable._applyValue
    end
  end
  if check == true then
    setCropModeScaleX(convertedScale)
  end
end

-- DECOMPILER ERROR at PC1926: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CropModeScaleY = function(value)
  -- function num : 0_88
  local convertedScale = 0.5 + value * 0.5
  local cropModeScaleX = (PaGlobal_Option._elements).CropModeScaleX
  local cropModeScaleY = (PaGlobal_Option._elements).CropModeScaleY
  local check = cropModeScaleX._initValue
  if cropModeScaleX._curValue ~= nil then
    check = cropModeScaleX._curValue
  else
    if cropModeScaleX._applyValue ~= nil then
      check = cropModeScaleX._applyValue
    end
  end
  if check == true then
    setCropModeScaleY(convertedScale)
  end
end

-- DECOMPILER ERROR at PC1930: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UIScale = function(value)
  -- function num : 0_89
  local interval = ((PaGlobal_Option._elements).UIScale)._sliderValueMax - ((PaGlobal_Option._elements).UIScale)._sliderValueMin
  local convertedValue = (((PaGlobal_Option._elements).UIScale)._sliderValueMin + interval * value) * 0.01
  convertedValue = (math.floor)((convertedValue + 0.002) * 100) / 100
  setUIScale(convertedValue)
end

-- DECOMPILER ERROR at PC1934: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GammaValue = function(value)
  -- function num : 0_90
  setGammaValue(value)
end

-- DECOMPILER ERROR at PC1938: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ContrastValue = function(value)
  -- function num : 0_91
  setContrastValue(value)
end

-- DECOMPILER ERROR at PC1942: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EffectAlpha = function(value)
  -- function num : 0_92
  setEffectAlpha(value)
end

-- DECOMPILER ERROR at PC1946: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SkillPostEffect = function(value)
  -- function num : 0_93
  setSkillPostEffect(value)
end

-- DECOMPILER ERROR at PC1950: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ColorBlind = function(value)
  -- function num : 0_94
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode, value, (CppEnums.VariableStorageType).eVariableStorageType_User)
  ToClient_ChangeColorBlindMode(value)
  FGlobal_Rador_SetColorBlindMode()
  FGlobal_ChangeEffectCheck()
  FGlobal_Window_Servant_ColorBlindUpdate()
  UIMain_QuestUpdate()
end

-- DECOMPILER ERROR at PC1954: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).BlackSpiritNotice = function(value)
  -- function num : 0_95
  setBlackSpiritNotice(value)
end

-- DECOMPILER ERROR at PC1958: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ShowCashAlert = function(value)
  -- function num : 0_96
  setShowCashAlert(value)
end

-- DECOMPILER ERROR at PC1962: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ShowGuildLoginMessage = function(value)
  -- function num : 0_97
  setShowGuildLoginMessage(value)
end

-- DECOMPILER ERROR at PC1966: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).LUT = function(LUT)
  -- function num : 0_98
  GameOption_SetLUTText(LUT)
  setCameraLUTFilter(LUT)
end

-- DECOMPILER ERROR at PC1972: Confused about usage of register: R1 in 'UnsetPending'

;
((PaGlobal_Option._elements).LUT).GetButtonText = function(self, LUT)
  -- function num : 0_99
  local filterName = getCameraLUTFilterName(LUT)
  local filterString = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_PHOTOFILTER_" .. filterName)
  if filterName == LUTRecommandationName or filterName == LUTRecommandationName2 then
    filterString = filterString .. "  <PAColor0xffffce22>[" .. PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_RECOMMANDATION") .. "]<PAOldColor>"
  end
  return filterString
end

-- DECOMPILER ERROR at PC1976: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableMusic = function(value)
  -- function num : 0_100
  setEnableSoundMusic(value)
end

-- DECOMPILER ERROR at PC1980: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableSound = function(value)
  -- function num : 0_101
  setEnableSoundFx(value)
end

-- DECOMPILER ERROR at PC1984: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableEnv = function(value)
  -- function num : 0_102
  setEnableSoundEnv(value)
end

-- DECOMPILER ERROR at PC1988: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableRidingSound = function(value)
  -- function num : 0_103
  setEnableRidingSound(value)
end

-- DECOMPILER ERROR at PC1992: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableWhisperMusic = function(value)
  -- function num : 0_104
  setEnableSoundWhisper(value)
end

-- DECOMPILER ERROR at PC1996: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableTraySoundOnOff = function(value)
  -- function num : 0_105
  setEnableSoundTray(value)
end

-- DECOMPILER ERROR at PC2000: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).BattleSoundType = function(value)
  -- function num : 0_106
  setEnableBattleSoundType(value)
end

-- DECOMPILER ERROR at PC2004: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeMaster = function(value)
  -- function num : 0_107
  setVolumeParamMaster(value * 100)
end

-- DECOMPILER ERROR at PC2009: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeMusic = function(value)
  -- function num : 0_108
  setVolumeParamMusic(value * 100)
end

-- DECOMPILER ERROR at PC2014: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeFx = function(value)
  -- function num : 0_109
  setVolumeParamFx(value * 100)
end

-- DECOMPILER ERROR at PC2019: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeEnv = function(value)
  -- function num : 0_110
  setVolumeParamEnv(value * 100)
end

-- DECOMPILER ERROR at PC2024: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeDlg = function(value)
  -- function num : 0_111
  setVolumeParamDialog(value * 100)
end

-- DECOMPILER ERROR at PC2029: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeHitFxVolume = function(value)
  -- function num : 0_112
  setVolumeParamHitFxVolume(value * 100)
end

-- DECOMPILER ERROR at PC2034: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeHitFxWeight = function(value)
  -- function num : 0_113
  setVolumeParamHitFxWeight(value * 100)
end

-- DECOMPILER ERROR at PC2039: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeOtherPlayer = function(value)
  -- function num : 0_114
  setVolumeParamOtherPlayer(value * 100)
end

-- DECOMPILER ERROR at PC2044: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertItem = function(value)
  -- function num : 0_115
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).Item, value)
end

-- DECOMPILER ERROR at PC2049: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertLife = function(value)
  -- function num : 0_116
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).Life, value)
end

-- DECOMPILER ERROR at PC2054: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertPvp = function(value)
  -- function num : 0_117
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).Pvp, value)
end

-- DECOMPILER ERROR at PC2059: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertBoss = function(value)
  -- function num : 0_118
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).Boss, value)
end

-- DECOMPILER ERROR at PC2064: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertEtc = function(value)
  -- function num : 0_119
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).Etc, value)
end

-- DECOMPILER ERROR at PC2069: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertChangeRegion = function(value)
  -- function num : 0_120
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).ChangeRegion, value)
end

-- DECOMPILER ERROR at PC2074: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertGrowth = function(value)
  -- function num : 0_121
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).AlertGrowth, value)
end

-- DECOMPILER ERROR at PC2079: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertAttackedOrFail = function(value)
  -- function num : 0_122
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).AttackedOrFail, value)
end

-- DECOMPILER ERROR at PC2084: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertHorseRace = function(value)
  -- function num : 0_123
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).HorseRace, value)
end

-- DECOMPILER ERROR at PC2089: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertGetItem = function(value)
  -- function num : 0_124
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).GetItem, value)
end

-- DECOMPILER ERROR at PC2094: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertGuild = function(value)
  -- function num : 0_125
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).Guild, value)
end

-- DECOMPILER ERROR at PC2099: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertWar = function(value)
  -- function num : 0_126
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).War, value)
end

-- DECOMPILER ERROR at PC2104: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertParty = function(value)
  -- function num : 0_127
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).Party, value)
end


