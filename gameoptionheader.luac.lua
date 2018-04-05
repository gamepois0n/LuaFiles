-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\option\gameoptionheader.luac 

-- params : ...
-- function num : 0
local CONTROL = CppEnums.PA_UI_CONTROL_TYPE
PaGlobal_Option = {
UIMODE = {Main = 1, Category = 2, Search = 3}
, 
SPEC = {LowNormal = 1, MidNormal = 2, HighNormal = 3, HighestNormal = 4, LowSiege = 5, MidSiege = 6, HighSiege = 7, HighestSiege = 8}
, 
GRAPHIC = {VeryVeryLow = 6, VeryLow = 0, Low = 1, Medium = 2, High = 3, VeryHigh = 4, VeryVeryHigh = 5}
, 
ALERT = {ChangeRegion = 0, NormalTrade = 1, RoyalTrade = 2, FitnessLevelUp = 3, TerritoryWar = 4, GuildWar = 5, OtherPlayerGetItem = 6, ItemMarket = 7, LifeLevelUp = 8, GuildQuestMessage = 9, NearMonster = 10, OtherMarket = 11, EnchantSuccess = 12, EnchantFail = 13}
, 
_tooltip = {
ResetAll = {}
, 
SaveSetting = {}
, 
Apply = {}
, 
Cancel = {}
, 
Confirm = {}
, 
Home = {}
, 
CustomSave = {}
, 
ResetFrame = {}
}
, 
_ui = {_staticMainTopBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainTopBg"), _staticSubTopBg = (UI.getChildControl)(Panel_Window_cOption, "Static_SubTopBg"), _staticMainBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainBg"), _staticSpecBG = nil, _staticCategoryBG = nil, _list2 = nil, _listSearchBg = (UI.getChildControl)(Panel_Window_cOption, "List2_Search"), 
_specDescTable = {}
, 
_categoryTitleTable = {}
, 
_categoryDescTable = {}
}
, 
_list2 = {_curCategory = nil, _curFrame = nil, 
_tree2IndexMap = {}
, _selectedKey = nil, _selectedSubKey = nil}
, 
_frames = {
Performance = {Optimize = Panel_Performance_Optimize, OptimizeBeta = Panel_Performance_OptimizeBeta, GraphicQuality = Panel_Performance_GraphicQuality, Camera = Panel_Performance_Camera, Npc = Panel_Performance_Npc}
, 
Graphic = {Window = Panel_Graphic_Window, Quality = Panel_Graphic_Quality, Effect = Panel_Graphic_Effect, Camera = Panel_Graphic_Camera, ScreenShot = Panel_Graphic_ScreenShot}
, 
Sound = {OnOff = Panel_Sound_OnOff, Volume = Panel_Sound_Volume}
, 
Function = {Convenience = Panel_Function_Convenience, View = Panel_Function_View, Alert = Panel_Function_Alert, Worldmap = Panel_Function_Worldmap, Nation = Panel_Function_Nation, Etc = Panel_Function_Etc}
, 
Interface = {Action = Panel_Interface_Action, UI = Panel_Interface_UI, QuickSlot = Panel_Interface_QuickSlot, Function = Panel_Interface_Function, Mouse = Panel_Interface_Mouse, Pad = Panel_Interface_Pad}
}
, 
_functions = {}
, 
_searchElementTable = {}
, 
_elements = {
AimAssist = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
UseNewQuickSlot = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EnableSimpleUI = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
IsOnScreenSaver = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
UIFontSizeType = {_defaultValue = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ShowNavPathEffectType = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
RefuseRequests = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
IsPvpRefuse = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
IsExchangeRefuse = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
RotateRadarMode = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
HideWindowByAttacked = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AudioResourceType = {_defaultValue = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ServiceResourceType = {_controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
UseChattingFilter = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
ChatChannelType = {_defaultValue = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
SelfPlayerNameTagVisible = {_defaultValue = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
OtherPlayerNameTagVisible = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
PartyPlayerNameTagVisible = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuildPlayerNameTagVisible = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
RankingPlayerNameTagVisible = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineZoneChange = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineQuestNPC = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineNpcIntimacy = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineWarAlly = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineNonWarPlayer = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineEnemy = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineGuild = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLineParty = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GuideLinePartyMemberEffect = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
PetRender = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
FairyRender = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
RenderHitEffect = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
DamageMeter = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
ShowComboGuide = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
HideMastOnCarrier = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
WorkerVisible = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
WorldMapOpenType = {_defaultValue = 3, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
WorldmapCameraPitchType = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
TextureQuality = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON, _isPictureTooltipOn = true}
, 
GraphicOption = {_defaultValue = 2, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
AntiAliasing = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _isPictureTooltipOn = true}
, 
SSAO = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _isPictureTooltipOn = true}
, 
PostFilter = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
Tessellation = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _isPictureTooltipOn = true}
, 
GraphicUltra = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
Dof = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _isPictureTooltipOn = true}
, 
Representative = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _isPictureTooltipOn = true}
, 
CharacterEffect = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
SnowPoolOnlyInSafeZone = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
BloodEffect = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
LensBlood = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AutoOptimization = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AutoOptimizationFrameLimit = {_defaultValue = 0.33333, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 60}
, 
UpscaleEnable = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
SelfPlayerOnlyEffect = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
NearestPlayerOnlyEffect = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
SelfPlayerOnlyLantern = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
PresentLock = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
ShowHpRular = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
UseEffectFrameOptimization = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EffectFrameOptimization = {_defaultValue = 0.03, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0.1, _sliderValueMax = 25}
, 
UsePlayerEffectDistOptimization = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
PlayerEffectDistOptimization = {_defaultValue = 0.5, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 10, _sliderValueMax = 50}
, 
UseCharacterUpdateFrameOptimize = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
UseOtherPlayerUpdate = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
Fov = {_defaultValue = 0.33333, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 40, _sliderValueMax = 70, _settingRightNow = true}
, 
CameraEffectMaster = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
CameraShakePower = {_defaultValue = 0.5, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
MotionBlurPower = {_defaultValue = 0.5, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
CameraTranslatePower = {_defaultValue = 0.5, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
CameraFovPower = {_defaultValue = 0.5, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
LUT = {_defaultValue = 8, _controlType = CONTROL.PA_UI_CONTROL_BUTTON, _settingRightNow = true}
, 
MouseInvertX = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
MouseInvertY = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
MouseSensitivityX = {_defaultValue = 0.473684, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
MouseSensitivityY = {_defaultValue = 0.473684, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
GameMouseMode = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
IsUIModeMouseLock = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadEnable = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadVibration = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadInvertX = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadInvertY = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
GamePadSensitivityX = {_defaultValue = 0.473684, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
GamePadSensitivityY = {_defaultValue = 0.315789, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
ConsolePadKeyType = {_defaultValue = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ScreenShotQuality = {_defaultValue = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ScreenShotFormat = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
WatermarkAlpha = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 20, _sliderValueMax = 100}
, 
WatermarkScale = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
WatermarkPosition = {_defaultValue = 3, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
WatermarkService = {_defaultValue = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ScreenMode = {_defaultValue = 2, _isChangeDisplay = true, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
ScreenResolution = {_isChangeDisplay = true, _controlType = CONTROL.PA_UI_CONTROL_COMBOBOX, _comboBoxList = nil}
, 
CropModeEnable = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
CropModeScaleX = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 50, _sliderValueMax = 100}
, 
CropModeScaleY = {_defaultValue = 0.6, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 50, _sliderValueMax = 100}
, 
UIScale = {_defaultValue = 0.3333, _isChangeDisplay = true, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 50, _sliderValueMax = 200}
, 
GammaValue = {_defaultValue = 0.5, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = -50, _sliderValueMax = 50, _settingRightNow = true}
, 
ContrastValue = {_defaultValue = 0.7, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = -50, _sliderValueMax = 50, _settingRightNow = true}
, 
EffectAlpha = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 30, _sliderValueMax = 100}
, 
SkillPostEffect = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100}
, 
ColorBlind = {_defaultValue = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
BlackSpiritNotice = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
ShowCashAlert = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
ShowGuildLoginMessage = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
EnableMusic = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _settingRightNow = true}
, 
EnableSound = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _settingRightNow = true}
, 
EnableEnv = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _settingRightNow = true}
, 
EnableRidingSound = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _settingRightNow = true}
, 
EnableWhisperMusic = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _settingRightNow = true}
, 
EnableTraySoundOnOff = {_defaultValue = false, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON, _settingRightNow = true}
, 
BattleSoundType = {_defaultValue = 2, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON, _settingRightNow = true}
, 
EnableAudioFairy = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
, 
VolumeMaster = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100, _settingRightNow = true}
, 
VolumeMusic = {_defaultValue = 0.62, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100, _settingRightNow = true}
, 
VolumeFx = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100, _settingRightNow = true}
, 
VolumeEnv = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100, _settingRightNow = true}
, 
VolumeDlg = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100, _settingRightNow = true}
, 
VolumeHitFxVolume = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100, _settingRightNow = true}
, 
VolumeHitFxWeight = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100, _settingRightNow = true}
, 
VolumeOtherPlayer = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100, _settingRightNow = true}
, 
VolumeFairy = {_defaultValue = 0.5, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 0, _sliderValueMax = 100, _settingRightNow = true}
, 
AlertNormalTrade = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertRoyalTrade = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertOtherPlayerGetItem = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertLifeLevelUp = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertItemMarket = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertOtherMarket = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertChangeRegion = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertFitnessLevelUp = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertTerritoryWar = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertGuildWar = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertEnchantSuccess = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertEnchantFail = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertGuildQuestMessage = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AlertNearMonster = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AutoRunCamera = {_defaultValue = true, _controlType = CONTROL.PA_UI_CONTROL_CHECKBUTTON}
, 
AutoRunCameraRotation = {_defaultValue = 1, _controlType = CONTROL.PA_UI_CONTROL_SLIDER, _sliderValueMin = 10, _sliderValueMax = 30}
, 
KeyCustomMode = {_defaultValue = 0, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON, _settingRightNow = true}
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
ActionAutoMoveWalkMode = {actionInputType = 43, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
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
ActionWalkMode = {actionInputType = 50, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
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
UiAlchemyStone = {uiInputType = 20, _controlType = CONTROL.PA_UI_CONTROL_RADIOBUTTON}
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
}
, 
_userInitScreenResolution = {width = 0, height = 0}
, 
_findStrings = {}
, _keyCustomPadMode = nil, _keyCustomInputType = nil, _resetCheck = nil, _availableResolutionList = nil, _screenResolutionCount = nil, 
_fpsTextControl = {}
}
-- DECOMPILER ERROR at PC1874: Confused about usage of register: R1 in 'UnsetPending'

if true == ToClient_isXBox() then
  ((PaGlobal_Option._elements).TextureQuality)._defaultValue = 0
  -- DECOMPILER ERROR at PC1879: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((PaGlobal_Option._elements).ConsolePadKeyType)._defaultValue = 2
end
isChecked_SkillCommand = true
-- DECOMPILER ERROR at PC1885: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Option.Get = function(self, optionName)
  -- function num : 0_0
  local option = (self._elements)[optionName]
  if option == nil then
    return false
  end
  local value = option._initValue
  if option._applyValue ~= nil then
    value = option._applyValue
  end
  if value == nil then
    _PA_LOG("후진", "[GameOption][GET] 값을 얻어 오는�\176 실패했습니다.  Name : " .. optionName)
  end
  return value
end

-- DECOMPILER ERROR at PC1889: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AimAssist = function(value)
  -- function num : 0_1
  setAimAssist(value)
end

-- DECOMPILER ERROR at PC1893: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseNewQuickSlot = function(value)
  -- function num : 0_2
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).NewQuickSlot, value, (CppEnums.VariableStorageType).eVariableStorageType_User)
end

-- DECOMPILER ERROR at PC1897: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableSimpleUI = function(value)
  -- function num : 0_3
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

-- DECOMPILER ERROR at PC1901: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).IsOnScreenSaver = function(value)
  -- function num : 0_4
  setIsOnScreenSaver(value)
end

-- DECOMPILER ERROR at PC1905: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UIFontSizeType = function(value)
  -- function num : 0_5
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

-- DECOMPILER ERROR at PC1909: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ShowNavPathEffectType = function(value)
  -- function num : 0_6
  setShowNavPathEffectType(value)
end

-- DECOMPILER ERROR at PC1913: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).RefuseRequests = function(value)
  -- function num : 0_7
  setRefuseRequests(value)
end

-- DECOMPILER ERROR at PC1917: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).IsPvpRefuse = function(value)
  -- function num : 0_8
  setIsPvpRefuse(value)
end

-- DECOMPILER ERROR at PC1921: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).IsExchangeRefuse = function(value)
  -- function num : 0_9
  setIsExchangeRefuse(value)
end

-- DECOMPILER ERROR at PC1925: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).RotateRadarMode = function(value)
  -- function num : 0_10
  setRotateRadarMode(value)
end

-- DECOMPILER ERROR at PC1929: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).HideWindowByAttacked = function(value)
  -- function num : 0_11
  setHideWindowByAttacked(value)
end

-- DECOMPILER ERROR at PC1934: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AutoRunCamera = function(value)
  -- function num : 0_12
  setAutoRunCamera(value)
end

-- DECOMPILER ERROR at PC1939: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AutoRunCameraRotation = function(value)
  -- function num : 0_13
  setAutoRunCameraRotation(value)
end

-- DECOMPILER ERROR at PC1943: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AudioResourceType = function(value)
  -- function num : 0_14
  setAudioResourceType(PaGlobal_Option:radioButtonMapping_AudioResourceType(value))
end

-- DECOMPILER ERROR at PC1947: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ServiceResourceType = function(value)
  -- function num : 0_15
  if ToClient_isAvailableChangeServiceType() == false then
    return 
  end
  ToClient_saveServiceResourceType(PaGlobal_Option:radioButtonMapping_ServiceResourceType(value))
end

-- DECOMPILER ERROR at PC1951: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseChattingFilter = function(value)
  -- function num : 0_16
  setUseChattingFilter(value)
end

-- DECOMPILER ERROR at PC1955: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ChatChannelType = function(value)
  -- function num : 0_17
  if ToClient_isAvailableChangeServiceType() == false then
    return 
  end
  ToClient_saveChatChannelType(PaGlobal_Option:radioButtonMapping_ChatChannelType(value))
end

-- DECOMPILER ERROR at PC1959: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SelfPlayerNameTagVisible = function(value)
  -- function num : 0_18
  setSelfPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1963: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).OtherPlayerNameTagVisible = function(value)
  -- function num : 0_19
  if value == true then
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  setOtherPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1967: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PartyPlayerNameTagVisible = function(value)
  -- function num : 0_20
  if value == true then
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  setPartyPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1971: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuildPlayerNameTagVisible = function(value)
  -- function num : 0_21
  if value == true then
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  setGuildPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1975: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).RankingPlayerNameTagVisible = function(value)
  -- function num : 0_22
  if value == true then
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    value = (CppEnums.VisibleNameTagType).eVisibleNameTagType_NoShow
  end
  setRankingPlayerNameTagVisible(value)
end

-- DECOMPILER ERROR at PC1979: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineZoneChange = function(value)
  -- function num : 0_23
  setRenderPlayerColor("ZoneChange", value)
end

-- DECOMPILER ERROR at PC1983: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineQuestNPC = function(value)
  -- function num : 0_24
  setShowQuestActorColor(value)
end

-- DECOMPILER ERROR at PC1987: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineNpcIntimacy = function(value)
  -- function num : 0_25
  setShowHumanRelation(value)
end

-- DECOMPILER ERROR at PC1991: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineWarAlly = function(value)
  -- function num : 0_26
  setRenderPlayerColor("WarAlly", value)
end

-- DECOMPILER ERROR at PC1995: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineNonWarPlayer = function(value)
  -- function num : 0_27
  setRenderPlayerColor("NonWarPlayer", value)
end

-- DECOMPILER ERROR at PC1999: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineEnemy = function(value)
  -- function num : 0_28
  setRenderPlayerColor("Enemy", value)
end

-- DECOMPILER ERROR at PC2003: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineGuild = function(value)
  -- function num : 0_29
  setRenderPlayerColor("Guild", value)
end

-- DECOMPILER ERROR at PC2007: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLineParty = function(value)
  -- function num : 0_30
  setRenderPlayerColor("Party", value)
end

-- DECOMPILER ERROR at PC2011: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GuideLinePartyMemberEffect = function(value)
  -- function num : 0_31
  (ToClient_getGameOptionControllerWrapper()):setRenderHitEffectParty(value)
end

-- DECOMPILER ERROR at PC2015: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PetRender = function(value)
  -- function num : 0_32
  setPetRender(value)
end

-- DECOMPILER ERROR at PC2019: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).FairyRender = function(value)
  -- function num : 0_33
  if value == 0 then
    setFairyRender(true)
  else
    setFairyRender(false)
  end
end

-- DECOMPILER ERROR at PC2023: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).RenderHitEffect = function(value)
  -- function num : 0_34
  setRenderHitEffect(value)
end

-- DECOMPILER ERROR at PC2027: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).DamageMeter = function(value)
  -- function num : 0_35
  setOnDamageMeter(value)
end

-- DECOMPILER ERROR at PC2031: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ShowComboGuide = function(value)
  -- function num : 0_36
  setShowComboGuide(value)
  if Panel_MovieTheater_320 ~= nil then
    Panel_MovieTheater320_JustClose()
  end
end

-- DECOMPILER ERROR at PC2035: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).HideMastOnCarrier = function(value)
  -- function num : 0_37
  setHideMastOnCarrier(value)
end

-- DECOMPILER ERROR at PC2039: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WorkerVisible = function(value)
  -- function num : 0_38
  ToClient_setWorkerVisible(value)
end

-- DECOMPILER ERROR at PC2043: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WorldMapOpenType = function(value)
  -- function num : 0_39
  setWorldmapOpenType(value)
end

-- DECOMPILER ERROR at PC2047: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WorldmapCameraPitchType = function(value)
  -- function num : 0_40
  setWorldMapCameraPitchType(value)
end

-- DECOMPILER ERROR at PC2051: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).TextureQuality = function(value)
  -- function num : 0_41
  setTextureQuality(PaGlobal_Option:radioButtonMapping_TextureQuality(value))
end

-- DECOMPILER ERROR at PC2055: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GraphicOption = function(value)
  -- function num : 0_42
  setGraphicOption(PaGlobal_Option:radioButtonMapping_GraphicOption(value))
end

-- DECOMPILER ERROR at PC2059: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AntiAliasing = function(value)
  -- function num : 0_43
  setAntiAliasing(value)
end

-- DECOMPILER ERROR at PC2063: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SSAO = function(value)
  -- function num : 0_44
  setSSAO(value)
end

-- DECOMPILER ERROR at PC2067: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PostFilter = function(value)
  -- function num : 0_45
  if value == true then
    setPostFilter(2)
  else
    setPostFilter(1)
  end
end

-- DECOMPILER ERROR at PC2071: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).Tessellation = function(value)
  -- function num : 0_46
  setTessellation(value)
end

-- DECOMPILER ERROR at PC2075: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GraphicUltra = function(value)
  -- function num : 0_47
  setGraphicUltra(value)
end

-- DECOMPILER ERROR at PC2079: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).Dof = function(value)
  -- function num : 0_48
  setDof(value)
end

-- DECOMPILER ERROR at PC2083: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).Representative = function(value)
  -- function num : 0_49
  setRepresentative(value)
end

-- DECOMPILER ERROR at PC2087: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CharacterEffect = function(value)
  -- function num : 0_50
  setCharacterEffect(value)
end

-- DECOMPILER ERROR at PC2091: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SnowPoolOnlyInSafeZone = function(value)
  -- function num : 0_51
  setSnowPoolOnlyInSafeZone(value)
end

-- DECOMPILER ERROR at PC2095: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).BloodEffect = function(value)
  -- function num : 0_52
  if value == true then
    setBloodEffect(2)
  else
    setBloodEffect(0)
  end
end

-- DECOMPILER ERROR at PC2099: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).LensBlood = function(value)
  -- function num : 0_53
  setLensBlood(value)
end

-- DECOMPILER ERROR at PC2103: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AutoOptimization = function(value)
  -- function num : 0_54
  setAutoOptimization(value)
end

-- DECOMPILER ERROR at PC2107: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AutoOptimizationFrameLimit = function(value)
  -- function num : 0_55
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

-- DECOMPILER ERROR at PC2111: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UpscaleEnable = function(value)
  -- function num : 0_56
  setUpscaleEnable(value)
end

-- DECOMPILER ERROR at PC2115: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PresentLock = function(value)
  -- function num : 0_57
  setPresentLock(value)
end

-- DECOMPILER ERROR at PC2119: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseEffectFrameOptimization = function(value)
  -- function num : 0_58
  setUseOptimizationEffectFrame(value)
end

-- DECOMPILER ERROR at PC2123: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EffectFrameOptimization = function(value)
  -- function num : 0_59
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

-- DECOMPILER ERROR at PC2127: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UsePlayerEffectDistOptimization = function(value)
  -- function num : 0_60
  setUsePlayerOptimizationEffectFrame(value)
end

-- DECOMPILER ERROR at PC2131: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).PlayerEffectDistOptimization = function(value)
  -- function num : 0_61
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

-- DECOMPILER ERROR at PC2135: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseCharacterUpdateFrameOptimize = function(value)
  -- function num : 0_62
  setUseCharacterDistUpdate(value)
end

-- DECOMPILER ERROR at PC2139: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UseOtherPlayerUpdate = function(value)
  -- function num : 0_63
  FromClient_OtherPlayeUpdate(value, true)
end

-- DECOMPILER ERROR at PC2143: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).Fov = function(value)
  -- function num : 0_64
  value = value * 30 + 40
  setFov(value)
end

-- DECOMPILER ERROR at PC2147: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CameraEffectMaster = function(value)
  -- function num : 0_65
  setCameraMasterPower(value)
end

-- DECOMPILER ERROR at PC2151: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CameraShakePower = function(value)
  -- function num : 0_66
  setCameraShakePower(value)
end

-- DECOMPILER ERROR at PC2155: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MotionBlurPower = function(value)
  -- function num : 0_67
  setMotionBlurPower(value)
end

-- DECOMPILER ERROR at PC2159: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CameraTranslatePower = function(value)
  -- function num : 0_68
  setCameraTranslatePower(value)
end

-- DECOMPILER ERROR at PC2163: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CameraFovPower = function(value)
  -- function num : 0_69
  setCameraFovPower(value)
end

-- DECOMPILER ERROR at PC2167: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MouseInvertX = function(value)
  -- function num : 0_70
  setMouseInvertX(value)
end

-- DECOMPILER ERROR at PC2171: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MouseInvertY = function(value)
  -- function num : 0_71
  setMouseInvertY(value)
end

-- DECOMPILER ERROR at PC2175: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MouseSensitivityX = function(value)
  -- function num : 0_72
  local convertedValue = value * 1.9 + 0.1
  setMouseSensitivityX(convertedValue)
end

-- DECOMPILER ERROR at PC2179: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).MouseSensitivityY = function(value)
  -- function num : 0_73
  local convertedValue = value * 1.9 + 0.1
  setMouseSensitivityY(convertedValue)
end

-- DECOMPILER ERROR at PC2183: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GameMouseMode = function(value)
  -- function num : 0_74
  setGameMouseMode(value)
end

-- DECOMPILER ERROR at PC2187: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).IsUIModeMouseLock = function(value)
  -- function num : 0_75
  setIsUIModeMouseLock(value)
end

-- DECOMPILER ERROR at PC2191: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadEnable = function(value)
  -- function num : 0_76
  setGamePadEnable(value)
end

-- DECOMPILER ERROR at PC2195: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadVibration = function(value)
  -- function num : 0_77
  setGamePadVibration(value)
end

-- DECOMPILER ERROR at PC2199: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadInvertX = function(value)
  -- function num : 0_78
  setGamePadInvertX(value)
end

-- DECOMPILER ERROR at PC2203: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadInvertY = function(value)
  -- function num : 0_79
  setGamePadInvertY(value)
end

-- DECOMPILER ERROR at PC2207: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadSensitivityX = function(value)
  -- function num : 0_80
  local convertedValue = value * 1.9 + 0.1
  setGamePadSensitivityX(convertedValue)
end

-- DECOMPILER ERROR at PC2211: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GamePadSensitivityY = function(value)
  -- function num : 0_81
  local convertedValue = value * 1.9 + 0.1
  setGamePadSensitivityY(convertedValue)
end

-- DECOMPILER ERROR at PC2215: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ConsolePadKeyType = function(value)
  -- function num : 0_82
  if _ContentsGroup_isConsoleTest == true then
    setConsoleKeyType(value)
  end
end

-- DECOMPILER ERROR at PC2219: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ScreenShotQuality = function(value)
  -- function num : 0_83
  setScreenShotQuality(value)
end

-- DECOMPILER ERROR at PC2223: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ScreenShotFormat = function(value)
  -- function num : 0_84
  setScreenShotFormat(value)
end

-- DECOMPILER ERROR at PC2227: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WatermarkAlpha = function(value)
  -- function num : 0_85
  setWatermarkAlpha(value)
end

-- DECOMPILER ERROR at PC2231: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WatermarkScale = function(value)
  -- function num : 0_86
  setWatermarkScale(value)
end

-- DECOMPILER ERROR at PC2235: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WatermarkPosition = function(value)
  -- function num : 0_87
  setWatermarkPosition(value)
end

-- DECOMPILER ERROR at PC2239: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).WatermarkService = function(value)
  -- function num : 0_88
  setWatermarkService(value)
end

-- DECOMPILER ERROR at PC2244: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ScreenMode = function(value)
  -- function num : 0_89
  setScreenMode(value)
  ischangedeplay = true
end

-- DECOMPILER ERROR at PC2249: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ScreenResolution = function(value)
  -- function num : 0_90
  local width = 1280
  local height = 720
  if value == -1 then
    width = (PaGlobal_Option._userInitScreenResolution).width
    height = (PaGlobal_Option._userInitScreenResolution).height
  else
    width = (PaGlobal_Option._availableResolutionList):getDisplayModeWidth(value)
    height = (PaGlobal_Option._availableResolutionList):getDisplayModeHeight(value)
  end
  setScreenResolution(width, height)
end

-- DECOMPILER ERROR at PC2254: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CropModeEnable = function(value)
  -- function num : 0_91
  setCropModeEnable(value)
end

-- DECOMPILER ERROR at PC2259: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CropModeScaleX = function(value)
  -- function num : 0_92
  local convertedScale = 0.5 + value * 0.5
  local cropModeEnable = PaGlobal_Option:Get("CropModeEnable")
  local cropModeScaleX = convertedScale
  local cropModeScaleY = PaGlobal_Option:Get("CropModeScaleY")
  if cropModeScaleX > 0.95 and cropModeScaleY > 0.95 and cropModeEnable == true then
    PaGlobal_Option:SetXXX("CropModeEnable", false)
  end
  if cropModeEnable == true then
    setCropModeScaleX(convertedScale)
  end
end

-- DECOMPILER ERROR at PC2264: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).CropModeScaleY = function(value)
  -- function num : 0_93
  local convertedScale = 0.5 + value * 0.5
  local cropModeEnable = PaGlobal_Option:Get("CropModeEnable")
  local cropModeScaleX = PaGlobal_Option:Get("CropModeScaleX")
  local cropModeScaleY = convertedScale
  if cropModeScaleX > 0.95 and cropModeScaleY > 0.95 and cropModeEnable == true then
    PaGlobal_Option:SetXXX("CropModeEnable", false)
  end
  if cropModeEnable == true then
    setCropModeScaleY(convertedScale)
  end
end

-- DECOMPILER ERROR at PC2269: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).UIScale = function(value)
  -- function num : 0_94
  local interval = ((PaGlobal_Option._elements).UIScale)._sliderValueMax - ((PaGlobal_Option._elements).UIScale)._sliderValueMin
  local convertedValue = (((PaGlobal_Option._elements).UIScale)._sliderValueMin + interval * value) * 0.01
  convertedValue = (math.floor)((convertedValue + 0.002) * 100) / 100
  setUIScale(convertedValue)
end

-- DECOMPILER ERROR at PC2274: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).GammaValue = function(value)
  -- function num : 0_95
  setGammaValue(value)
end

-- DECOMPILER ERROR at PC2279: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ContrastValue = function(value)
  -- function num : 0_96
  setContrastValue(value)
end

-- DECOMPILER ERROR at PC2284: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EffectAlpha = function(value)
  -- function num : 0_97
  value = PaGlobal_Option:FromSliderValueToRealValue(value, ((PaGlobal_Option._elements).EffectAlpha)._sliderValueMin, ((PaGlobal_Option._elements).EffectAlpha)._sliderValueMax)
  value = value * 0.01
  setEffectAlpha(value)
end

-- DECOMPILER ERROR at PC2289: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SkillPostEffect = function(value)
  -- function num : 0_98
  setSkillPostEffect(value)
end

-- DECOMPILER ERROR at PC2294: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ColorBlind = function(value)
  -- function num : 0_99
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode, value, (CppEnums.VariableStorageType).eVariableStorageType_User)
  ToClient_ChangeColorBlindMode(value)
  FGlobal_Rador_SetColorBlindMode()
  FGlobal_ChangeEffectCheck()
  FGlobal_Window_Servant_ColorBlindUpdate()
  UIMain_QuestUpdate()
end

-- DECOMPILER ERROR at PC2299: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).BlackSpiritNotice = function(value)
  -- function num : 0_100
  setBlackSpiritNotice(value)
end

-- DECOMPILER ERROR at PC2304: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ShowCashAlert = function(value)
  -- function num : 0_101
  setShowCashAlert(not value)
end

-- DECOMPILER ERROR at PC2309: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ShowGuildLoginMessage = function(value)
  -- function num : 0_102
  setShowGuildLoginMessage(value)
end

-- DECOMPILER ERROR at PC2313: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).LUT = function(LUT)
  -- function num : 0_103
  setCameraLUTFilter(LUT)
end

-- DECOMPILER ERROR at PC2319: Confused about usage of register: R1 in 'UnsetPending'

;
((PaGlobal_Option._elements).LUT).GetButtonText = function(self, LUT)
  -- function num : 0_104
  local filterName = getCameraLUTFilterName(LUT)
  local filterString = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_PHOTOFILTER_" .. filterName)
  if filterName == LUTRecommandationName or filterName == LUTRecommandationName2 then
    filterString = filterString .. "  <PAColor0xffffce22>[" .. PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_RECOMMANDATION") .. "]<PAOldColor>"
  end
  return filterString
end

-- DECOMPILER ERROR at PC2325: Confused about usage of register: R1 in 'UnsetPending'

;
((PaGlobal_Option._elements).LUT).GetButtonListSize = function(self, value)
  -- function num : 0_105
  return getCameraLUTFilterSize()
end

-- DECOMPILER ERROR at PC2330: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableMusic = function(value)
  -- function num : 0_106
  setEnableSoundMusic(value)
end

-- DECOMPILER ERROR at PC2335: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableSound = function(value)
  -- function num : 0_107
  setEnableSoundFx(value)
end

-- DECOMPILER ERROR at PC2340: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableEnv = function(value)
  -- function num : 0_108
  setEnableSoundEnv(value)
end

-- DECOMPILER ERROR at PC2345: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableRidingSound = function(value)
  -- function num : 0_109
  setEnableRidingSound(value)
end

-- DECOMPILER ERROR at PC2350: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableWhisperMusic = function(value)
  -- function num : 0_110
  setEnableSoundWhisper(value)
end

-- DECOMPILER ERROR at PC2355: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableTraySoundOnOff = function(value)
  -- function num : 0_111
  setEnableSoundTray(value)
end

-- DECOMPILER ERROR at PC2360: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).BattleSoundType = function(value)
  -- function num : 0_112
  setEnableBattleSoundType(value)
end

-- DECOMPILER ERROR at PC2365: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).EnableAudioFairy = function(value)
  -- function num : 0_113
  setEnableFairySound(value)
end

-- DECOMPILER ERROR at PC2370: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeMaster = function(value)
  -- function num : 0_114
  setVolumeParamMaster(value * 100)
end

-- DECOMPILER ERROR at PC2375: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeMusic = function(value)
  -- function num : 0_115
  setVolumeParamMusic(value * 100)
end

-- DECOMPILER ERROR at PC2380: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeFx = function(value)
  -- function num : 0_116
  setVolumeParamFx(value * 100)
end

-- DECOMPILER ERROR at PC2385: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeEnv = function(value)
  -- function num : 0_117
  setVolumeParamEnv(value * 100)
end

-- DECOMPILER ERROR at PC2390: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeDlg = function(value)
  -- function num : 0_118
  setVolumeParamDialog(value * 100)
end

-- DECOMPILER ERROR at PC2395: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeHitFxVolume = function(value)
  -- function num : 0_119
  setVolumeParamHitFxVolume(value * 100)
end

-- DECOMPILER ERROR at PC2400: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeHitFxWeight = function(value)
  -- function num : 0_120
  setVolumeParamHitFxWeight(value * 100)
end

-- DECOMPILER ERROR at PC2405: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeOtherPlayer = function(value)
  -- function num : 0_121
  setVolumeParamOtherPlayer(value * 100)
end

-- DECOMPILER ERROR at PC2410: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).VolumeFairy = function(value)
  -- function num : 0_122
  setVolumeFairy(value * 100)
end

-- DECOMPILER ERROR at PC2415: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertNormalTrade = function(value)
  -- function num : 0_123
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).NormalTrade, not value)
end

-- DECOMPILER ERROR at PC2420: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertRoyalTrade = function(value)
  -- function num : 0_124
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).RoyalTrade, not value)
end

-- DECOMPILER ERROR at PC2425: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertOtherPlayerGetItem = function(value)
  -- function num : 0_125
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).OtherPlayerGetItem, not value)
end

-- DECOMPILER ERROR at PC2430: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertLifeLevelUp = function(value)
  -- function num : 0_126
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).LifeLevelUp, not value)
end

-- DECOMPILER ERROR at PC2435: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertItemMarket = function(value)
  -- function num : 0_127
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).ItemMarket, not value)
end

-- DECOMPILER ERROR at PC2440: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertOtherMarket = function(value)
  -- function num : 0_128
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).OtherMarket, not value)
end

-- DECOMPILER ERROR at PC2445: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertChangeRegion = function(value)
  -- function num : 0_129
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).ChangeRegion, not value)
end

-- DECOMPILER ERROR at PC2450: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertFitnessLevelUp = function(value)
  -- function num : 0_130
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).FitnessLevelUp, not value)
end

-- DECOMPILER ERROR at PC2455: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertTerritoryWar = function(value)
  -- function num : 0_131
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).TerritoryWar, not value)
end

-- DECOMPILER ERROR at PC2460: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertGuildWar = function(value)
  -- function num : 0_132
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).GuildWar, not value)
end

-- DECOMPILER ERROR at PC2465: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertEnchantSuccess = function(value)
  -- function num : 0_133
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).EnchantSuccess, not value)
end

-- DECOMPILER ERROR at PC2470: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertEnchantFail = function(value)
  -- function num : 0_134
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).EnchantFail, not value)
end

-- DECOMPILER ERROR at PC2475: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertGuildQuestMessage = function(value)
  -- function num : 0_135
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).GuildQuestMessage, not value)
end

-- DECOMPILER ERROR at PC2480: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).AlertNearMonster = function(value)
  -- function num : 0_136
  ToClient_SetMessageFilter((PaGlobal_Option.ALERT).NearMonster, not value)
end

-- DECOMPILER ERROR at PC2484: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SelfPlayerOnlyEffect = function(value)
  -- function num : 0_137
  setSelfPlayerOnlyEffect(value)
end

-- DECOMPILER ERROR at PC2488: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).NearestPlayerOnlyEffect = function(value)
  -- function num : 0_138
  setNearestPlayerOnlyEffect(value)
end

-- DECOMPILER ERROR at PC2492: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).SelfPlayerOnlyLantern = function(value)
  -- function num : 0_139
  setSelfPlayerOnlyLantern(value)
end

-- DECOMPILER ERROR at PC2496: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_Option._functions).ShowHpRular = function(value)
  -- function num : 0_140
  GameOptionApply_CharacterNameTag_Ruler(value)
  setShowHpRular(value)
end

ConsolePadType = function(value)
  -- function num : 0_141
  selfPlayerSetConsolePadType(value)
end


