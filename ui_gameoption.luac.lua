-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\option\ui_gameoption.luac 

-- params : ...
-- function num : 0
Panel_Window_Option:setMaskingChild(true)
Panel_Window_Option:ActiveMouseEventEffect(true)
Panel_Window_Option:setGlassBackground(true)
Panel_Window_Option:RegisterShowEventFunc(true, "Option_ShowAni()")
Panel_Window_Option:RegisterShowEventFunc(false, "Option_HideAni()")
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local isSaveSetting = ToClient_IsContentsGroupOpen("258")
local gamePanel_Main = {_btn_Display = (UI.getChildControl)(Panel_Window_Option, "RadioButton_Display"), _btn_Sound = (UI.getChildControl)(Panel_Window_Option, "RadioButton_Sound"), _btn_Game = (UI.getChildControl)(Panel_Window_Option, "RadioButton_Game"), _btn_KeyConfig = (UI.getChildControl)(Panel_Window_Option, "RadioButton_Key"), _btn_KeyConfig_UI = (UI.getChildControl)(Panel_Window_Option, "RadioButton_KeyUI"), _btn_Language = (UI.getChildControl)(Panel_Window_Option, "RadioButton_Language"), _txt_Comment = (UI.getChildControl)(Panel_Window_Option, "StaticText_OptionComment"), _btn_Reset = (UI.getChildControl)(Panel_Window_Option, "Button_Reset"), _btn_SaveSetting = (UI.getChildControl)(Panel_Window_Option, "Button_SaveSetting"), _btn_Apply = (UI.getChildControl)(Panel_Window_Option, "Button_Apply"), _btn_Confirm = (UI.getChildControl)(Panel_Window_Option, "Button_Confirm"), _btn_Cancel = (UI.getChildControl)(Panel_Window_Option, "Button_Cancel"), _btn_Close = (UI.getChildControl)(Panel_Window_Option, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_Option, "Button_Question")}
local _frame_Display = (UI.getChildControl)(Panel_GameOption_Display, "Frame_Display")
local _frameContent_Display = (UI.getChildControl)(_frame_Display, "Frame_1_Content")
local _frame_Sound = (UI.getChildControl)(Panel_GameOption_Sound, "Frame_Sound")
local _frameContent_Sound = (UI.getChildControl)(_frame_Sound, "Frame_1_Content")
local _frame_Game = (UI.getChildControl)(Panel_GameOption_Game, "Frame_Game")
local _frameContent_Game = (UI.getChildControl)(_frame_Game, "Frame_1_Content")
local _frame_KeyConfig = (UI.getChildControl)(Panel_GameOption_Key, "Frame_KeyConfig")
local _static_KeySetTitle = (UI.getChildControl)(Panel_GameOption_Key, "StaticText_ControlSetting")
local _static_KeySetBG = (UI.getChildControl)(Panel_GameOption_Key, "StaticText_KeyboardSet")
local _static_PadSetBG = (UI.getChildControl)(Panel_GameOption_Key, "StaticText_GamePadSet")
local _static_ResetKeyConfig = (UI.getChildControl)(Panel_GameOption_Key, "Button_Reset_Key")
local _frameContent_KeyConfig = (UI.getChildControl)(_frame_KeyConfig, "Frame_1_Content")
local _frame_KeyConfig_UI = (UI.getChildControl)(Panel_GameOption_Key_UI, "Frame_KeyConfig_UI")
local _static_KeySetTitle_UI = (UI.getChildControl)(Panel_GameOption_Key_UI, "StaticText_ControlSet_UI")
local _static_KeySetBG_UI = (UI.getChildControl)(Panel_GameOption_Key_UI, "StaticText_KeyboardSet_UI")
local _static_PadSetBG_UI = (UI.getChildControl)(Panel_GameOption_Key_UI, "StaticText_GamePadSet_UI")
local _static_ResetKeyConfig_UI = (UI.getChildControl)(Panel_GameOption_Key_UI, "Button_ResetUI")
local _static_ResetPositionConfig_UI = (UI.getChildControl)(Panel_GameOption_Key_UI, "Button_ResetUI_Position")
local _frameContent_KeyConfig_UI = (UI.getChildControl)(_frame_KeyConfig_UI, "Frame_1_Content")
local _frame_Language = (UI.getChildControl)(Panel_GameOption_Language, "Frame_Language")
local _frameContent_Language = (UI.getChildControl)(_frame_Language, "Frame_1_Content")
local _display_SizeY = _frameContent_Display:GetSizeY()
local _sound_SizeY = _frameContent_Sound:GetSizeY()
local _game_SizeY = _frameContent_Game:GetSizeY()
local _keyConfig_SizeY = _frameContent_KeyConfig:GetSizeY()
local _keyConfig_UI_SizeY = _frameContent_KeyConfig_UI:GetSizeY()
local _Language_SizeY = _frameContent_Language:GetSizeY()
local _display_sld = (UI.getChildControl)(_frame_Display, "Frame_1_VerticalScroll")
local _sound_sld = (UI.getChildControl)(_frame_Sound, "Frame_1_VerticalScroll")
local _game_sld = (UI.getChildControl)(_frame_Game, "Frame_1_VerticalScroll")
local _keyConfig_sld = (UI.getChildControl)(_frame_KeyConfig, "Frame_1_VerticalScroll")
local _keyConfigUI_sld = (UI.getChildControl)(_frame_KeyConfig_UI, "Frame_1_VerticalScroll")
local _Language_sld = (UI.getChildControl)(_frame_Language, "Frame_1_VerticalScroll")
local _display_sld_btn = (UI.getChildControl)(_display_sld, "Frame_1_VerticalScroll_CtrlButton")
local _sound_sld_btn = (UI.getChildControl)(_sound_sld, "Frame_1_VerticalScroll_CtrlButton")
local _game_sld_btn = (UI.getChildControl)(_game_sld, "Frame_1_VerticalScroll_CtrlButton")
local _keyConfig_sld_btn = (UI.getChildControl)(_keyConfig_sld, "Frame_1_VerticalScroll_CtrlButton")
local _keyConfigUI_sld_btn = (UI.getChildControl)(_keyConfigUI_sld, "Frame_1_VerticalScroll_CtrlButton")
local _Language_sld_btn = (UI.getChildControl)(_Language_sld, "Frame_1_VerticalScroll_CtrlButton")
local frame_Display = {
_btn_ScreenMode = {[0] = (UI.getChildControl)(_frameContent_Display, "RadioButton_FullScreen"), [1] = (UI.getChildControl)(_frameContent_Display, "RadioButton_FullWindow"), [2] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Window")}
, _btn_ScrSize = (UI.getChildControl)(_frameContent_Display, "Button_ScreenSize"), _btn_ScrSize_L = (UI.getChildControl)(_frameContent_Display, "Button_ScrSize_L"), _btn_ScrSize_R = (UI.getChildControl)(_frameContent_Display, "Button_ScrSize_R"), _btn_Trxt = (UI.getChildControl)(_frameContent_Display, "Button_TexQuality"), _btn_Trxt_L = (UI.getChildControl)(_frameContent_Display, "Button_Txtr_L"), _btn_Trxt_R = (UI.getChildControl)(_frameContent_Display, "Button_Txtr_R"), _btn_Rndr = (UI.getChildControl)(_frameContent_Display, "Button_RenderQuality"), _btn_Rndr_L = (UI.getChildControl)(_frameContent_Display, "Button_Rndr_L"), _btn_Rndr_R = (UI.getChildControl)(_frameContent_Display, "Button_Rndr_R"), _btn_LUT = (UI.getChildControl)(_frameContent_Display, "Button_LUT"), _btn_LUT_L = (UI.getChildControl)(_frameContent_Display, "Button_LUT_L"), _btn_LUT_R = (UI.getChildControl)(_frameContent_Display, "Button_LUT_R"), _btn_LUT_Reset = (UI.getChildControl)(_frameContent_Display, "Button_LUT_Reset"), _btn_LUT_Reset2 = (UI.getChildControl)(_frameContent_Display, "Button_LUT_Reset2"), _btn_DOF = (UI.getChildControl)(_frameContent_Display, "CheckButton_DOF"), _btn_AntiAlli = (UI.getChildControl)(_frameContent_Display, "CheckButton_Anti"), _btn_Ultra = (UI.getChildControl)(_frameContent_Display, "CheckButton_Ultra"), _btn_LensBlood = (UI.getChildControl)(_frameContent_Display, "CheckButton_LensBlood"), _btn_BloodEffect = (UI.getChildControl)(_frameContent_Display, "CheckButton_BloodEffect"), _btn_Represent = (UI.getChildControl)(_frameContent_Display, "CheckButton_Representativepartmodel"), _btn_SnowPoolOnlyInSafeZone = (UI.getChildControl)(_frameContent_Display, "CheckButton_SnowPoolOnlyInSafeZone"), _btn_SSAO = (UI.getChildControl)(_frameContent_Display, "CheckButton_SSAO"), _btn_Tessellation = (UI.getChildControl)(_frameContent_Display, "CheckButton_Tessellation"), _btn_PostFilter = (UI.getChildControl)(_frameContent_Display, "CheckButton_PostFilter"), _btn_CharacterEffect = (UI.getChildControl)(_frameContent_Display, "CheckButton_CharacterEffect"), _txt_FPS = (UI.getChildControl)(_frameContent_Display, "StaticText_FPS"), _txt_Gamma = (UI.getChildControl)(_frameContent_Display, "StaticText_GammaControl"), _slide_Gamma = (UI.getChildControl)(_frameContent_Display, "Slider_GammaControl"), _txt_Contrast = (UI.getChildControl)(_frameContent_Display, "StaticText_ContrastControl"), _slide_Contrast = (UI.getChildControl)(_frameContent_Display, "Slider_ContrastControl"), _txt_EffectAlpha = (UI.getChildControl)(_frameContent_Display, "StaticText_EffectAlpha"), _slide_EffectAlpha = (UI.getChildControl)(_frameContent_Display, "Slider_EffectAlpha_Value"), _txt_ColorByPass = (UI.getChildControl)(_frameContent_Display, "StaticText_ColorByPass"), _slide_ColorByPass = (UI.getChildControl)(_frameContent_Display, "Slider_ColorByPass"), _txt_UIScale = (UI.getChildControl)(_frameContent_Display, "StaticText_UISize"), _txt_UIScaleLow = (UI.getChildControl)(_frameContent_Display, "StaticText_UI_LOW"), _txt_UIScaleMidle = (UI.getChildControl)(_frameContent_Display, "StaticText_UI_MID"), _txt_UIScaleHigh = (UI.getChildControl)(_frameContent_Display, "StaticText_UI_HIGH"), _slide_UIScale = (UI.getChildControl)(_frameContent_Display, "Slider_UI_Scaling"), _txt_CameraMaster = (UI.getChildControl)(_frameContent_Display, "StaticText_CameraMaster"), _slide_CameraMaster = (UI.getChildControl)(_frameContent_Display, "Slider_CameraMasterControl"), _txt_CameraShake = (UI.getChildControl)(_frameContent_Display, "StaticText_CameraShake"), _slide_CameraShake = (UI.getChildControl)(_frameContent_Display, "Slider_CameraShakeControl"), _txt_MotionBlur = (UI.getChildControl)(_frameContent_Display, "StaticText_CameraBlur"), _slide_MotionBlur = (UI.getChildControl)(_frameContent_Display, "Slider_CameraBlurControl"), _txt_CameraPos = (UI.getChildControl)(_frameContent_Display, "StaticText_CameraPos"), _slide_CameraPos = (UI.getChildControl)(_frameContent_Display, "Slider_CameraPos"), _txt_CameraFov = (UI.getChildControl)(_frameContent_Display, "StaticText_CameraFov"), _slide_CameraFov = (UI.getChildControl)(_frameContent_Display, "Slider_CameraFov"), _txt_OptimizationKing = (UI.getChildControl)(_frameContent_Display, "CheckButton_OptimizationKing"), _tooltip = (UI.getChildControl)(_frameContent_Display, "StaticText_ControlTooltip"), _optimizationDesc = (UI.getChildControl)(_frameContent_Display, "StaticText_OptimizeTip"), _txt_Fov = (UI.getChildControl)(_frameContent_Display, "StaticText_FovControl"), _slide_Fov = (UI.getChildControl)(_frameContent_Display, "Slider_FovControl"), _btn_Reset = (UI.getChildControl)(_frameContent_Display, "Button_Reset"), 
_btn_ScreenShotFormat = {[0] = (UI.getChildControl)(_frameContent_Display, "RadioButton_ScreenshotFormat_BMP"), [1] = (UI.getChildControl)(_frameContent_Display, "RadioButton_ScreenshotFormat_JPG"), [2] = (UI.getChildControl)(_frameContent_Display, "RadioButton_ScreenshotFormat_PNG")}
, 
_btn_ColorBlind = {[0] = (UI.getChildControl)(_frameContent_Display, "Radiobutton_ColorBlindNone"), [1] = (UI.getChildControl)(_frameContent_Display, "Radiobutton_ColorBlind_Protanopia"), [2] = (UI.getChildControl)(_frameContent_Display, "Radiobutton_ColorBlind_Deuteranopia")}
, 
_btn_ScreenShotSize = {[0] = (UI.getChildControl)(_frameContent_Display, "RadioButton_ScreenshotSize_Default"), [1] = (UI.getChildControl)(_frameContent_Display, "RadioButton_ScreenshotSize_4K"), [2] = (UI.getChildControl)(_frameContent_Display, "RadioButton_ScreenshotSize_8K")}
, _btn_NearestPlayerOnlyEffect = (UI.getChildControl)(_frameContent_Display, "CheckButton_OtherUserEffect"), _btn_SelfPlayerOnlyEffect = (UI.getChildControl)(_frameContent_Display, "CheckButton_OtherUserEffectAll"), _btn_SelfPlayerOnlyLantern = (UI.getChildControl)(_frameContent_Display, "CheckButton_OtherUserLantern"), _btn_LowPower = (UI.getChildControl)(_frameContent_Display, "CheckButton_LowPower"), _btn_UpscaleEnable = (UI.getChildControl)(_frameContent_Display, "CheckButton_Upscale"), _btn_CropModeEnable = (UI.getChildControl)(_frameContent_Display, "CheckButton_CropMode"), _slide_CropModeScaleX = (UI.getChildControl)(_frameContent_Display, "Slider_CropModeX"), _slide_CropModeScaleY = (UI.getChildControl)(_frameContent_Display, "Slider_CropModeY"), _btn_WorkerVisible = (UI.getChildControl)(_frameContent_Display, "CheckButton_WorkerVisible"), _btn_AutoOptimization = (UI.getChildControl)(_frameContent_Display, "CheckButton_AutoOptimization"), _slide_AutoOptimization = (UI.getChildControl)(_frameContent_Display, "Slider_AutoOptimization"), _slideText_FrameRate = (UI.getChildControl)(_frameContent_Display, "StaticText_FPS_MID"), _txt_WaterMarkAlphaTitle = (UI.getChildControl)(_frameContent_Display, "StaticText_WaterMakrAlpha"), _txt_WaterMarkMin = (UI.getChildControl)(_frameContent_Display, "StaticText_Alpha_Min"), _txt_WaterMarkDefault = (UI.getChildControl)(_frameContent_Display, "StaticText_Alpha_Default"), _txt_WaterMarkMax = (UI.getChildControl)(_frameContent_Display, "StaticText_Alpha_Max"), _slide_WatermarkAlpha = (UI.getChildControl)(_frameContent_Display, "Slider_AlphaControl"), _txt_ScreenShotAlphaSizeTitle = (UI.getChildControl)(_frameContent_Display, "StaticText_ScreenShotAlphaSize"), _txt_ScreenShotAlphaPosTitle = (UI.getChildControl)(_frameContent_Display, "StaticText_ScreenShotAlphaPos"), _txt_ScreenShotAlphaTypeTitle = (UI.getChildControl)(_frameContent_Display, "StaticText_ScreenShotAlphaType"), 
_btn_WatermarkPosition = {[0] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_LeftTop"), [1] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_RightTop"), [2] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_LeftBotton"), [3] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_RightBottom")}
, 
_btn_WatermarkService = {[0] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_Kor"), [1] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_Jap"), [2] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_Na"), [3] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_Rus"), [4] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_Tw"), [5] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_Sa"), [6] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_None")}
, 
_btn_WatermarkScale = {[0] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_AlphaSmall"), [1] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_AlphaNormal"), [2] = (UI.getChildControl)(_frameContent_Display, "RadioButton_Screenshot_AlphaBig")}
, 
_pictureTooltip = {[0] = (UI.getChildControl)(_frameContent_Display, "Static_trxt"), [1] = (UI.getChildControl)(_frameContent_Display, "Static_AntiAlli"), [2] = (UI.getChildControl)(_frameContent_Display, "Static_Dof"), [3] = (UI.getChildControl)(_frameContent_Display, "Static_Tesselation"), [4] = (UI.getChildControl)(_frameContent_Display, "Static_Ssao"), [5] = (UI.getChildControl)(_frameContent_Display, "Static_NpcDetail")}
}
local isDev = ToClient_IsDevelopment()
local _btn_Gamma = (UI.getChildControl)(frame_Display._slide_Gamma, "Slider_GammaControl_Button")
local _btn_Contrast = (UI.getChildControl)(frame_Display._slide_Contrast, "Slider_ContrastControl_Button")
local _btn_EffectAlpha = (UI.getChildControl)(frame_Display._slide_EffectAlpha, "Slider_EffectAlpha_Button")
local _btn_UIScale = (UI.getChildControl)(frame_Display._slide_UIScale, "Slider_UI_Scaling_Button")
local _btn_CameraMaster = (UI.getChildControl)(frame_Display._slide_CameraMaster, "Slider_CameraMaster_Button")
local _btn_ColorByPass = (UI.getChildControl)(frame_Display._slide_ColorByPass, "Slider_ColorByPass_Button")
local _btn_CameraShake = (UI.getChildControl)(frame_Display._slide_CameraShake, "Slider_CameraShake_Button")
local _btn_MotionBlur = (UI.getChildControl)(frame_Display._slide_MotionBlur, "Slider_CameraBlur_Button")
local _btn_CameraPos = (UI.getChildControl)(frame_Display._slide_CameraPos, "Slider_CameraPos_Button")
local _btn_CameraFov = (UI.getChildControl)(frame_Display._slide_CameraFov, "Slider_CameraFov_Button")
local _btn_CropModeScaleX = (UI.getChildControl)(frame_Display._slide_CropModeScaleX, "Slider_CropModeX_Button")
local _btn_CropModeScaleY = (UI.getChildControl)(frame_Display._slide_CropModeScaleY, "Slider_CropModeY_Button")
local _btn_AutoOptimizationSlide = (UI.getChildControl)(frame_Display._slide_AutoOptimization, "Slider_AutoOptimization_Button")
local _btn_Fov = (UI.getChildControl)(frame_Display._slide_Fov, "Slider_FovControl_Button")
local _btn_WatermarkAlpha = (UI.getChildControl)(frame_Display._slide_WatermarkAlpha, "Slider_AlphaControl_Button")
local frame_Sound = {_btn_MusicOnOff = (UI.getChildControl)(_frameContent_Sound, "Checkbox_MusicOnOff"), _btn_FXOnOff = (UI.getChildControl)(_frameContent_Sound, "Checkbox_FXOnOff"), _btn_EnvFXOnOff = (UI.getChildControl)(_frameContent_Sound, "Checkbox_EnvFXOnOff"), _btn_RiddingOnOff = (UI.getChildControl)(_frameContent_Sound, "Checkbox_RiddingOnOff"), _btn_WhisperOnOff = (UI.getChildControl)(_frameContent_Sound, "Checkbox_WhisperOnOff"), _btn_TraySoundOnOff = (UI.getChildControl)(_frameContent_Sound, "Checkbox_TraySoundOnOff"), _btn_CombatAllwaysOff = (UI.getChildControl)(_frameContent_Sound, "RadioButton_AllwaysCombatOff"), _btn_CombatAllwaysOn = (UI.getChildControl)(_frameContent_Sound, "RadioButton_AllwaysCombatOn"), _btn_CombatAllwaysLowOff = (UI.getChildControl)(_frameContent_Sound, "RadioButton_AllwaysCombatLowOff"), _txt_NpcVoiceTitle = (UI.getChildControl)(_frameContent_Sound, "StaticText_NpcVoiceSelect"), _btn_NpcVoice1 = (UI.getChildControl)(_frameContent_Sound, "RadioButton_NpcVoice1"), _btn_NpcVoice2 = (UI.getChildControl)(_frameContent_Sound, "RadioButton_NpcVoice2"), _btn_NpcVoice3 = (UI.getChildControl)(_frameContent_Sound, "RadioButton_NpcVoice3"), _txt_TotalVol = (UI.getChildControl)(_frameContent_Sound, "StaticText_TotalVolume"), _slide_TotalVol = (UI.getChildControl)(_frameContent_Sound, "Slider_TotalVolumeControl"), _txt_MusicVol = (UI.getChildControl)(_frameContent_Sound, "StaticText_MusicVolume"), _slide_MusicVol = (UI.getChildControl)(_frameContent_Sound, "Slider_MusicVolumeControl"), _txt_FxVol = (UI.getChildControl)(_frameContent_Sound, "StaticText_FXVolume"), _slide_FxVol = (UI.getChildControl)(_frameContent_Sound, "Slider_FXVolumeControl"), _txt_EnvFxVol = (UI.getChildControl)(_frameContent_Sound, "StaticText_EnvFXVolume"), _slide_EnvFxVol = (UI.getChildControl)(_frameContent_Sound, "Slider_EnvFXVolumeControl"), _txt_VoiceVol = (UI.getChildControl)(_frameContent_Sound, "StaticText_VoiceVolume"), _slide_VoiceVol = (UI.getChildControl)(_frameContent_Sound, "Slider_VoiceVolumeControl"), _txt_hitFxVolume = (UI.getChildControl)(_frameContent_Sound, "StaticText_AttackVolume"), _slide_hitFxVolume = (UI.getChildControl)(_frameContent_Sound, "Slider_AttackVolumeControl"), _txt_hitFxWeightVolume = (UI.getChildControl)(_frameContent_Sound, "StaticText_AttackSmothVolume"), _slide_hitFxWeightVolume = (UI.getChildControl)(_frameContent_Sound, "Slider_AttackSmothVolumeControl"), _txt_otherPlayerVolume = (UI.getChildControl)(_frameContent_Sound, "StaticText_OtherUserVolume"), _slide_otherPlayerVolume = (UI.getChildControl)(_frameContent_Sound, "Slider_OtherUserVolumeControl"), _btn_Reset = (UI.getChildControl)(_frameContent_Sound, "Button_Reset")}
local _btn_TotalVol = (UI.getChildControl)(frame_Sound._slide_TotalVol, "Slider_TotalVolume_Button")
local _btn_MusicVol = (UI.getChildControl)(frame_Sound._slide_MusicVol, "Slider_MusicVolume_Button")
local _btn_FxVol = (UI.getChildControl)(frame_Sound._slide_FxVol, "Slider_FXVolume_Button")
local _btn_EnvFxVol = (UI.getChildControl)(frame_Sound._slide_EnvFxVol, "Slider_EnvFXVolume_Button")
local _btn_VoiceVol = (UI.getChildControl)(frame_Sound._slide_VoiceVol, "Slider_VoiceVolume_Button")
local _btn_hitFxVolume = (UI.getChildControl)(frame_Sound._slide_hitFxVolume, "Slider_VoiceVolume_Button")
local _btn_hitFxWeightVolume = (UI.getChildControl)(frame_Sound._slide_hitFxWeightVolume, "Slider_VoiceVolume_Button")
local _btn_otherPlayerVolume = (UI.getChildControl)(frame_Sound._slide_otherPlayerVolume, "Slider_VoiceVolume_Button")
local frame_Game = {_btn_ShowTag = (UI.getChildControl)(_frameContent_Game, "Checkbox_ShowCharTag"), _btn_AutoAim = (UI.getChildControl)(_frameContent_Game, "CheckButton_AutoAim"), _btn_RejectInvitation = (UI.getChildControl)(_frameContent_Game, "Checkbox_RejectInvitation"), _btn_HideWindow = (UI.getChildControl)(_frameContent_Game, "CheckButton_HideUIWindow"), _btn_EnableSimpleUI = (UI.getChildControl)(_frameContent_Game, "Checkbox_SimpleUI"), _btn_SpiritGuide = (UI.getChildControl)(_frameContent_Game, "Checkbox_SpiritGuide"), _btn_MouseMove = (UI.getChildControl)(_frameContent_Game, "CheckBox_MoveMouse"), _btn_MiniMapRotation = (UI.getChildControl)(_frameContent_Game, "CheckBox_Minimap"), _btn_ShowAttackEffect = (UI.getChildControl)(_frameContent_Game, "CheckBox_ShowAttackEffect"), _btn_Alert_BlackSpirit = (UI.getChildControl)(_frameContent_Game, "CheckButton_BlackSpirit_Alert"), _btn_UseNewQuickSlot = (UI.getChildControl)(_frameContent_Game, "CheckButton_NewQuickSlot"), _btn_UseChattingFilter = (UI.getChildControl)(_frameContent_Game, "CheckButton_UseChattingFilter"), _btn_IsOnScreenSaver = (UI.getChildControl)(_frameContent_Game, "CheckButton_ScreenSaver"), _btn_UIModeMouseLock = (UI.getChildControl)(_frameContent_Game, "CheckButton_UIModeMouseLock"), _btn_PvpRefuse = (UI.getChildControl)(_frameContent_Game, "CheckButton_PvpRefuse"), _btn_ExchangeRefuse = (UI.getChildControl)(_frameContent_Game, "CheckButton_ExchangeRefuse"), _btn_HideMast = (UI.getChildControl)(_frameContent_Game, "CheckButton_HideMast"), _btn_ShowCashAlert = (UI.getChildControl)(_frameContent_Game, "CheckButton_ShowCashAlert"), _btn_EnableOVR = (UI.getChildControl)(_frameContent_Game, "Checkbox_SupportOculus"), _btn_MouseX = (UI.getChildControl)(_frameContent_Game, "Checkbox_MouseX"), _btn_MouseY = (UI.getChildControl)(_frameContent_Game, "Checkbox_MouseY"), _txt_Pad_Title = (UI.getChildControl)(_frameContent_Game, "StaticText_GamePadSet"), _btn_UsePad = (UI.getChildControl)(_frameContent_Game, "Checkbox_UsePad"), _btn_UseVibe = (UI.getChildControl)(_frameContent_Game, "Checkbox_UseVibe"), _btn_PadX = (UI.getChildControl)(_frameContent_Game, "Checkbox_PadX"), _btn_PadY = (UI.getChildControl)(_frameContent_Game, "Checkbox_PadY"), _btn_SelfNameShowAllways = (UI.getChildControl)(_frameContent_Game, "CheckButton_SelfPlayer"), _btn_SelfNameShowNoShow = (UI.getChildControl)(_frameContent_Game, "Checkbox_MyCharacterNickNameShow"), _btn_SelfNameShowImportant = (UI.getChildControl)(_frameContent_Game, "Checkbox_AttackNameShow"), _btn_PetAll = (UI.getChildControl)(_frameContent_Game, "RadioButton_PetVisualAll"), _btn_PetMine = (UI.getChildControl)(_frameContent_Game, "RadioButton_PetVisualMine"), _btn_PetHide = (UI.getChildControl)(_frameContent_Game, "RadioButton_PetVisualHide"), _title_FontResize = (UI.getChildControl)(_frameContent_Game, "StaticText_FontResize"), _btn_FontResizeDefault = (UI.getChildControl)(_frameContent_Game, "RadioButton_FontResizeDefault"), _btn_FontResizeBig = (UI.getChildControl)(_frameContent_Game, "RadioButton_FontResizeBig"), _btn_FontResizeMoreBig = (UI.getChildControl)(_frameContent_Game, "RadioButton_FontResizeMoreBig"), _btn_NavGuideNone = (UI.getChildControl)(_frameContent_Game, "RadioButton_NavGuideNone"), _btn_NavGuideArrow = (UI.getChildControl)(_frameContent_Game, "RadioButton_NavGuideArrow"), _btn_NavGuideEffect = (UI.getChildControl)(_frameContent_Game, "RadioButton_NavGuideEffect"), _btn_NavGuideFairy = (UI.getChildControl)(_frameContent_Game, "RadioButton_NavGuideFairy"), _btn_WorldMapOpenByWestMaintain = (UI.getChildControl)(_frameContent_Game, "RadioButton_WorldMapOpenByWestMaintain"), _btn_WorldMapOpenByCharacterToWest = (UI.getChildControl)(_frameContent_Game, "RadioButton_WorldMapOpenByCharacterToWest"), _btn_WorldMapOpenByCharacterMaintain = (UI.getChildControl)(_frameContent_Game, "RadioButton_WorldMapOpenByCharacterMaintain"), _btn_WorldMapOpenByNone = (UI.getChildControl)(_frameContent_Game, "RadioButton_WorldMapOpenByNone"), _btn_WorldMapCameraAngle = (UI.getChildControl)(_frameContent_Game, "StaticText_WorldMapOpenAngle"), _btn_WorldMapCameraDefaultAngle = (UI.getChildControl)(_frameContent_Game, "RadioButton_WorldMapDefaultAngle"), _btn_WorldMapCameraDegree30 = (UI.getChildControl)(_frameContent_Game, "RadioButton_WorldMapDegree30"), _btn_WorldMapCameraDegree90 = (UI.getChildControl)(_frameContent_Game, "RadioButton_WorldMapDegree90"), _btn_OtherNameShow = (UI.getChildControl)(_frameContent_Game, "Checkbox_AnotherCharacterNickNameShow"), _btn_PartyNameShow = (UI.getChildControl)(_frameContent_Game, "Checkbox_PartyNickName"), _btn_GuildNameShow = (UI.getChildControl)(_frameContent_Game, "Checkbox_GuildAndClanCharacterNickName"), _btn_GuideLineHumanRelation = (UI.getChildControl)(_frameContent_Game, "Checkbox_CharacterOutline_HumanRelation"), _btn_GuideLineQuestObject = (UI.getChildControl)(_frameContent_Game, "Checkbox_CharacterOutline_QuestObjectLine"), _btn_GuideLineZoneChange = (UI.getChildControl)(_frameContent_Game, "Checkbox_CharacterOutline_ZoneChange"), _btn_GuideLineWarAlly = (UI.getChildControl)(_frameContent_Game, "Checkbox_CharacterOutline_WarAlly"), _btn_GuideLineGuild = (UI.getChildControl)(_frameContent_Game, "Checkbox_CharacterOutline_Guild"), _btn_GuideLineParty = (UI.getChildControl)(_frameContent_Game, "Checkbox_CharacterOutline_Party"), _btn_GuideLineEnemy = (UI.getChildControl)(_frameContent_Game, "Checkbox_CharacterOutline_Enemy"), _btn_GuideLineNonWarPlayer = (UI.getChildControl)(_frameContent_Game, "Checkbox_CharacterOutline_NonWarPlayer"), _btn_GuideLinePartyEffect = (UI.getChildControl)(_frameContent_Game, "Checkbox_PartyAttackEffect"), _btn_Alert_Region = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_Region"), _btn_Alert_TerritoryTrade = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_TerritoryTrade"), _btn_Alert_RoyalTrade = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_RoyalTrade"), _btn_Alert_Fitness = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_FitnessLevelUp"), _btn_Alert_TerritoryWar = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_TerritoryWar"), _btn_Alert_GuildWar = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_GuildWarStart"), _btn_Alert_PlayerGotItem = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_AnotherPlayerGotItem"), _btn_Alert_ItemMarket = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_ItemMarket"), _btn_Alert_LifeLevUp = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_LifeLevUp"), _btn_Alert_GuildQuest = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_GuildQuest"), _btn_Alert_NearMonster = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_NearMonster"), _btn_Alert_ServantMarket = (UI.getChildControl)(_frameContent_Game, "CheckButton_Alert_ServantMarket"), _btn_GuildLogin = (UI.getChildControl)(_frameContent_Game, "CheckButton_GuildLogin"), _txt_MouXSen = (UI.getChildControl)(_frameContent_Game, "StaticText_MouseXSen"), _slide_MouXSen = (UI.getChildControl)(_frameContent_Game, "Slider_MouseXSenControl"), _txt_MouYSen = (UI.getChildControl)(_frameContent_Game, "StaticText_MouseYSen"), _slide_MouYSen = (UI.getChildControl)(_frameContent_Game, "Slider_MouseYSenControl"), _txt_X_0 = (UI.getChildControl)(_frameContent_Game, "StaticText_PadXSen_0"), _txt_X_50 = (UI.getChildControl)(_frameContent_Game, "StaticText_PadXSen_50"), _txt_X_100 = (UI.getChildControl)(_frameContent_Game, "StaticText_PadXSen_100"), _txt_PadXSen = (UI.getChildControl)(_frameContent_Game, "StaticText_PadXSen"), _slide_PadXSen = (UI.getChildControl)(_frameContent_Game, "Slider_PadXSenControl"), _txt_Y_0 = (UI.getChildControl)(_frameContent_Game, "StaticText_PadYSen_0"), _txt_Y_50 = (UI.getChildControl)(_frameContent_Game, "StaticText_PadYSen_50"), _txt_Y_100 = (UI.getChildControl)(_frameContent_Game, "StaticText_PadYSen_100"), _txt_PadYSen = (UI.getChildControl)(_frameContent_Game, "StaticText_PadYSen"), _slide_PadYSen = (UI.getChildControl)(_frameContent_Game, "Slider_PadYSenControl"), _btn_Reset = (UI.getChildControl)(_frameContent_Game, "Button_Reset")}
local randerPlayerColorStr = {zoneChange = "ZoneChange", warAlly = "WarAlly", guild = "Guild", party = "Party", enemy = "Enemy", nonWarPlayer = "NonWarPlayer"}
value_GameOption_Check_ComboGuide = frame_Game._btn_SpiritGuide
value_GameOption_Check_ComboGuide:SetCheck(true)
_currentSpiritGuideCheck = true
local _btn_MouXSen = (UI.getChildControl)(frame_Game._slide_MouXSen, "Slider_MouseXSen_Button")
local _btn_MouYSen = (UI.getChildControl)(frame_Game._slide_MouYSen, "Slider_MouseYSen_Button")
local _btn_PadXSen = (UI.getChildControl)(frame_Game._slide_PadXSen, "Slider_PadXSen_Button")
local _btn_PadYSen = (UI.getChildControl)(frame_Game._slide_PadYSen, "Slider_PadYSen_Button")
local frame_Key = {_staticInputTitle_Func1 = (UI.getChildControl)(_frameContent_KeyConfig, "StaticText_Key_0"), _staticInputTitle_Func2 = (UI.getChildControl)(_frameContent_KeyConfig, "StaticText_Key_1"), _button_key = (UI.getChildControl)(_frameContent_KeyConfig, "RadioButton_Key_0"), _button_Pad_Func1 = (UI.getChildControl)(_frameContent_KeyConfig, "RadioButton_Pad_0"), _button_Pad_Func2 = (UI.getChildControl)(_frameContent_KeyConfig, "RadioButton_Pad_1"), _sample_keyButton = (UI.getChildControl)(_frameContent_KeyConfig, "RadioButton_Key_0")}
local frame_Key_UI = {_staticInputTitle_Func1 = (UI.getChildControl)(_frameContent_KeyConfig_UI, "StaticText_Key_0"), _button_key = (UI.getChildControl)(_frameContent_KeyConfig_UI, "RadioButton_Key_0"), _button_Pad_Func1 = (UI.getChildControl)(_frameContent_KeyConfig_UI, "RadioButton_Pad_0"), _sample_keyButton = (UI.getChildControl)(_frameContent_KeyConfig_UI, "RadioButton_Key_0")}
isChecked_SkillCommand = true
local isChecked_KeyViewer = false
local isChecked_HideWindow = true
local isKeyConfig_Open = false
local isKeyConfig_UI_Open = false
local isAutoAim = true
local chk_Option = {SCREEN_RESOLUTION_COUNT; FULL_SCREEN_IDX = 0, FULL_SCREEN_WINDOWED_IDX = 1, WINDOWED_IDX = 2, SCREEN_MODE_COUNT = 3, 
screenResolutionList = {}
, SCREENSHOT_BMP = 0, SCREENSHOT_JPG = 1, SCREENSHOT_PNG = 2, SCREENSHOTSIZE_DEFAULT = 0, SCREENSHOTSIZE_4k = 1, SCREENSHOTSIZE_8k = 2, WATERMARK_ALPHA = 0, WATERMARK_BOLD = 1, WATERMARK_NONE = 2, WATERMARK_SERVICE_KR = 0, WATERMARK_SERVICE_JP = 1, WATERMARK_SERVICE_NA = 2, WATERMARK_SERVICE_RU = 3, WATERMARK_SERVICE_TW = 4, WATERMARK_SERVICE_SA = 5, WATERMARK_SERVICE_NONE = 6, WATERMARK_POSITION_LT = 0, WATERMARK_POSITION_RT = 1, WATERMARK_POSITION_LB = 2, WATERMARK_POSITION_RB = 3, WATERMARK_SCALE_SMALL = 0, WATERMARK_SCALE_REGULAR = 1, WATERMARK_SCALE_LARGE = 2, COLORBLIND_NONE = 0, COLORBLIND_PROTANOPIA = 1, COLORBLIND_DEUTERANOP = 2, TEXTURE_QUALITY_HIGH = 0, TEXTURE_QUALITY_NORMAL = 1, TEXTURE_QUALITY_LOW = 2, TEXTURE_QUALITY_COUNT = 3, GRAPHIC_OPTION_HIGH0 = 0, GRAPHIC_OPTION_HIGH1 = 1, GRAPHIC_OPTION_NORMAL0 = 2, GRAPHIC_OPTION_NORMAL1 = 3, GRAPHIC_OPTION_LOW0 = 4, GRAPHIC_OPTION_LOW1 = 5, GRAPHIC_OPTION_VERYLOW = 6, GRAPHIC_OPTION_COUNT = 7, RESOLUTION_WIDTH = 1280, RESOLUTION_HEIGHT = 720, currentScreenModeIdx = 0, currentScreenShotFormat = 0, currentScreenShotSize = 0, currentColorBlind = 0, currentSelfPlayerOnlyEffect = false, currentSelfPlayerOnlyLantern = false, currentNearestPlayerOnlyEffect = false, currentLowPower = false, currentUpscaleEnable = false, currentCropModeEnable = false, currentCropModeScaleX = 0, currentCropModeScaleY = 0, currentLUT = 0, currentAutoOptimization = true, currentOptimizationFrame = 20, currentScreenResolutionIdx = 0, currentTextureQualityIdx = 0, currentGraphicOptionIdx = 0, currentGammaValue = 0, currentContrastValue = 0, currentCheckDof = true, currentCheckAA = true, currentCheckUltra = false, currentCheckLensBlood = true, currentCheckBloodEffect = true, currentCheckSSAO = true, currentCheckTessellation = true, currentCheckPostFilter = true, currentCheckCharacterEffect = true, currentCheckUIScale = 1, currentCheckRepresent = true, currentCheckSnowPoolOnlyInSafeZone = false, currentCheckWorkerVisible = true, currentMaster = 0, currentMusic = 0, currentFxSound = 0, currentEnvSound = 0, currentDlgSound = 0, currentHitFxWeight = 0, currentPlayerVolume = 0, currentCheckMusic = true, currentCheckSound = true, currentCheckEnvSound = true, currentCheckCombatMusic = (CppEnums.BattleSoundType).Sound_Nomal, currentCheckNpcVoice = getGameServiceResType(), currentCheckRiddingMusic = true, currentCheckWhisperMusic = true, currentCheckTraySoundOnOff = true, currentCheckNameTag = false, currentCheckShowSkillCmd = true, currentCheckShowComboGuide = true, currentCheckAutoAim = true, currentCheckHideWindowByAttacked = true, currentCheckShowGuildLoginMessage = true, currentCheckEnableSimpleUI = true, currentCheckRenderCharacterColor = true, currentCheckEnableOVR = true, currentCheckMiniMapRotation = false, currentCheckRejectInvitation = false, currentCheckEffectAlpha = 1, currentCheckCameraMasterPower = 1, currentCheckColorByPass = 1, currentCheckCameraShakePower = 0.5, currentCheckMotionBlurPower = 0.5, currentCheckCameraPosPower = 0.7, currentCheckCameraFovPower = 0.7, currentCheckMouseMove = false, currentCheckMouseInvertX = false, currentCheckMouseInvertY = false, currentCheckMouseSensitivityX = 1.05, currentCheckMouseSensitivityY = 1.05, currentCheckPadEnable = false, currentCheckPadVibration = false, currentCheckPadInvertX = false, currentCheckPadInvertY = false, currentCheckPadSensitivityX = 1.05, currentCheckPadSensitivityY = 1.05, currentCheckIsHideMast = true, currentCheckShowCashAlert = false, currentSelfPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, currentOtherPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, currentPartyPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, currentGuildPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, currentNavPathEffectType = (CppEnums.NavPathEffectType).eNavPathEffectType_Arrow, currentWorldMapOpenType = (CppEnums.WorldMapAnimationStyle).noAnimation, currentWorldMapCameraType = (CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Default, currentServiceResourceType = (CppEnums.ServiceResourceType).eServiceResourceType_KR, currentChatChannelType = (CppEnums.ServiceResourceType).eServiceResourceType_KR, currentFovValue = 50, currentCheckIsUIModeMouseLock = false, currentCheckShowAttackEffect = true, currentCheckBlackSpiritAlert = true, currentCheckIsPvpRefuse = false, currentCheckIsExchangeRefuse = false, currentCheckIsOnScreenSaver = true, currentCheckUseNewQuickSlot = false, currentGuideLineZoneChange = false, currentGuideLineWarAlly = false, currentGuideLineGuild = false, currentGuideLineQuestLine = true, currentGuideLineNonWarPlayer = false, currentGuideLineParty = false, currentGuideLineHumanRelation = true, currentGuideLineEnemy = false, currentGuideLinePartyMemberEffect = false, appliedScreenModeIdx = 0, appliedScreenShotFormat = 0, appliedScreenShotSize = 0, appliedColorBlind = 0, appliedSelfPlayerOnlyEffect = true, appliedSelfPlayerOnlyLantern = false, appliedLowPower = false, appliedUpscaleEnable = false, appliedCropModeEnable = false, appliedCropModeScaleX = 0, appliedCropModeScaleY = 0, appliedAutoOptimization = true, appliedOptimizationFrame = 20, appliedLUT = 0, appliedScreenResolutionIdx = 0, appliedTextureQualityIdx = 0, appliedGraphicOptionIdx = 0, appliedGammaValue = 0, appliedContrastValue = 0, appliedCheckDof = true, appliedCheckAA = true, appliedCheckUltra = false, appliedCheckLensBlood = true, appliedCheckBloodEffect = true, appliedCheckRepresent = true, appliedCheckSnowPoolOnlyInSafeZone = false, appliedCheckSSAO = true, appliedCheckTessellation = true, appliedCheckPostFilter = true, appliedCheckCharacterEffect = true, appliedCheckUIScale = 1, appliedCheckEffectAlpha = 1, appliedMaster = 0, appliedMusic = 0, appliedFxSound = 0, appliedEnvSound = 0, appliedDlgSound = 0, appliedHitFxWeight = 0, appliedPlayerVolume = 0, appliedCheckMusic = true, appliedCheckSound = true, appliedCheckEnvSound = true, appliedCheckCombatMusic = (CppEnums.BattleSoundType).Sound_Nomal, appliedCheckNpcVoice = getGameServiceResType(), appliedCheckRiddingMusic = true, appliedCheckWhisperMusic = true, appliedCheckTraySoundOnOff = true, appliedCheckNameTag = false, appliedCheckShowSkillCmd = true, appliedCheckShowComboGuide = true, appliedCheckAutoAim = true, appliedCheckHideWindowByAttacked = true, appliedCheckShowGuildLoginMessage = true, appliedCheckEnableSimpleUI = true, appliedCheckRenderCharacterColor = true, appliedCheckEnableOVR = true, appliedCheckMiniMapRotation = false, appliedCheckRejectInvitation = false, appliedCheckCameraMasterPower = 1, appliedCheckCameraShakePower = 0.5, appliedCheckMotionBlurPower = 0.5, appliedCheckCameraPosPower = 0.7, appliedCheckCameraFovPower = 0.7, appliedCheckMouseMove = false, appliedCheckMouseInvertX = false, appliedCheckMouseInvertY = false, appliedCheckMouseSensitivityX = 1.05, appliedCheckMouseSensitivityY = 1.05, appliedCheckPadEnable = false, appliedCheckPadVibration = false, appliedCheckPadInvertX = false, appliedCheckPadInvertY = false, appliedCheckPadSensitivityX = 1.05, appliedCheckPadSensitivityY = 1.05, appliedCheckIsHideMast = true, appliedCheckShowCashAlert = false, appliedCheckSelfNameShow = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, appliedOtherPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, appliedPartyPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, appliedGuildPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, appliedPetObjectShow = (CppEnums.PetVisibleType).ePetVisibleType_All, appliedWatermarkPosition = (CppEnums.WatermarkPositionType).eWatermarkPositionType_RightDown, appliedWatermarkScale = (CppEnums.WatermarkScaleType).eWatermarkScaleType_Regular, appliedWatermarkService = (CppEnums.WatermarkServiceType).eWatermarkServiceType_KR, appliedWatermarkAlpha = 0.5, appliedFontResizeType = 0, appliedNavPathEffectType = (CppEnums.NavPathEffectType).eNavPathEffectType_Arrow, appliedWorldMapOpenType = (CppEnums.WorldMapAnimationStyle).noAnimation, appliedWorldMapCameraType = (CppEnums.WorldMapAnimationStyle).eWorldMapCameraPitchType_Default, appliedServiceResourceType = (CppEnums.ServiceResourceType).eServiceResourceType_KR, appliedChatChannelType = (CppEnums.ServiceResourceType).eServiceResourceType_KR, appliedFovValue = 50, appliedCheckWorkerVisible = true, appliedCheckIsUIModeMouseLock = false, appliedCheckShowAttackEffect = true, appliedCheckBlackSpiritAlert = true, appliedCheckIsPvpRefuse = false, appliedCheckIsExchangeRefuse = false, appliedCheckIsOnScreenSaver = true, appliedCheckUseNewQuickSlot = false, appliedGuideLineZoneChange = false, appliedGuideLineWarAlly = false, appliedGuideLineGuild = false, appliedGuideLineQuestLine = true, appliedGuideLineNonWarPlayer = false, appliedGuideLineParty = false, appliedGuideLineHumanRelation = true, appliedGuideLineEnemy = false, appliedGuideLinePartyMemberEffect = false, savedScreenModeIdx = 0, savedScreenShotFormat = 0, savedScreenShotSize = 0, savedColorBlind = 0, savedSelfPlayerOnlyEffect = true, savedNearestPlayerOnlyEffect = true, savedSelfPlayerOnlyLantern = false, savedLowPower = false, savedUpscaleEnable = false, savedCropModeEnable = false, savedCropModeScaleX = 0, savedCropModeScaleY = 0, savedAutoOptimization = true, savedOptimizationFrame = 20, savedLUT = 0, savedScreenResolutionIdx = 0, savedTextureQualityIdx = 0, savedGraphicOptionIdx = 0, savedGammaValue = 0, savedContrastValue = 0, savedCheckDof = true, savedCheckAA = true, savedCheckUltra = false, savedCheckLensBlood = true, savedCheckBloodEffect = true, savedCheckRepresent = true, savedCheckSnowPoolOnlyInSafeZone = false, savedCheckSSAO = true, savedCheckTessellation = true, savedCheckPostFilter = true, savedCheckCharacterEffect = true, savedCheckUIScale = 1, savedCheckWorkerVisible = true, savedMaster = 0, savedMusic = 0, savedFxSound = 0, savedEnvSound = 0, savedDlgSound = 0, savedHitFxWeight = 0, savedPlayerVolume = 0, savedCheckMusic = true, savedCheckSound = true, savedCheckEnvSound = true, savedCheckCombatMusic = (CppEnums.BattleSoundType).Sound_Nomal, savedCheckNpcVoice = getGameServiceResType(), savedCheckRiddingMusic = true, savedCheckWhisperMusic = true, savedCheckTraySoundOnOff = true, savedCheckNameTag = false, savedCheckShowSkillCmd = true, savedCheckShowComboGuide = true, savedCheckAutoAim = true, savedCheckHideWindowByAttacked = true, savedCheckShowGuildLoginMessage = true, savedCheckEnableSimpleUI = true, savedCheckRenderCharacterColor = true, savedCheckEnableOVR = true, savedCheckMiniMapRotation = false, savedCheckRejectInvitation = false, savedCheckCameraMasterPower = 1, savedCheckColorByPass = 1, savedCheckCameraShakePower = 0.5, savedCheckMotionBlurPower = 0.5, savedCheckCameraPosPower = 0.7, savedCheckCameraFovPower = 0.7, savedCheckEffectAlpha = 1, savedCheckMouseMove = false, savedCheckMouseInvertX = false, savedCheckMouseInvertY = false, savedCheckMouseSensitivityX = 1.05, savedCheckMouseSensitivityY = 1.05, savedCheckPadEnable = false, savedCheckPadVibration = false, savedCheckPadInvertX = false, savedCheckPadInvertY = false, savedCheckPadSensitivityX = 1.05, savedCheckPadSensitivityY = 1.05, savedCheckIsHideMast = true, savedCheckShowCasheAlert = false, savedCheckSelfNameShow = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, savedOtherPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, savedPartyPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, savedGuildPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow, savedPetObjectShow = (CppEnums.PetVisibleType).ePetVisibleType_All, savedFontResizeType = 0, savedNavPathEffectType = (CppEnums.NavPathEffectType).eNavPathEffectType_Arrow, savedWorldMapOpenType = (CppEnums.WorldMapAnimationStyle).noAnimation, savedWorldMapCameraType = (CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Default, savedServiceResourceType = (CppEnums.ServiceResourceType).eServiceResourceType_KR, savedChatChannelType = (CppEnums.ServiceResourceType).eServiceResourceType_KR, savedFovValue = 50, savedCheckIsUIModeMouseLock = false, savedCheckShowAttackEffect = true, savedCheckBlackSpiritAlert = true, savedCheckIsPvpRefuse = false, savedCheckIsExchangeRefuse = false, savedCheckIsOnScreenSaver = true, savedCheckUseNewQuickSlot = false, savedCheckGuideLineZoneChange = false, savedCheckGuideLineWarAlly = false, savedCheckGuideLineGuild = false, savedCheckGuideLineQuestLine = true, savedCheckGuideLineNonWarPlayer = false, savedCheckGuideLineParty = false, savedCheckGuideLineHumanRelation = true, savedCheckGuideLineEnemy = false, savedCheckGuideLinePartyMemberEffect = false}
local isVoiceOpen = ToClient_IsContentsGroupOpen("75")
local INPUT_COUNT_START = 0
local INPUT_COUNT_END = isVoiceOpen and 49 or 48
local STATIC_INPUT_TITLE = {}
local BUTTON_KEY = {}
local BUTTON_PAD = {}
local INPUT_TYPE = nil
local keyConfigListShowCount = isVoiceOpen and 52 or 51
local configDataIndex = 0
local keyConfigData = {}
local getKeyConfigData = function(index)
  -- function num : 0_0 , upvalues : keyConfigData, configDataIndex
  return keyConfigData[configDataIndex + index - 2]
end

local setKeyConfigDataTitle = function(index, title)
  -- function num : 0_1 , upvalues : keyConfigData
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  keyConfigData[index] = {titleText = title, buttonKeyText = "", padKeyText = "", padOnly = false}
end

local setKeyConfigDataConfigButton = function(index, button)
  -- function num : 0_2 , upvalues : keyConfigData
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  (keyConfigData[index]).buttonKeyText = button
end

local setKeyConfigDataConfigPad = function(index, pad)
  -- function num : 0_3 , upvalues : keyConfigData
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  (keyConfigData[index]).padKeyText = pad
end

local setKeyConfigDataConfigOnlyPad = function(index, padOnly)
  -- function num : 0_4 , upvalues : keyConfigData
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  (keyConfigData[index]).padOnly = padOnly
end

local updateKeyConfig = function()
  -- function num : 0_5 , upvalues : keyConfigListShowCount, getKeyConfigData, STATIC_INPUT_TITLE, BUTTON_KEY, BUTTON_PAD
  for index = 0, keyConfigListShowCount - 1 do
    local keyConfigData = getKeyConfigData(index)
    if keyConfigData ~= nil then
      (STATIC_INPUT_TITLE[index]):SetText(keyConfigData.titleText)
      if keyConfigData.padOnly == false then
        (BUTTON_KEY[index]):SetText(keyConfigData.buttonKeyText)
        ;
        (BUTTON_KEY[index]):SetShow(true)
      else
        ;
        (BUTTON_KEY[index]):SetShow(false)
      end
      ;
      (BUTTON_PAD[index]):SetText(keyConfigData.padKeyText)
      if (BUTTON_PAD[index]):IsLimitText() then
        (BUTTON_PAD[index]):addInputEvent("Mouse_On", "GameOption_UIKeySetting_PadKey_Simpletooltip( true, " .. index .. ", 0 )")
        ;
        (BUTTON_PAD[index]):addInputEvent("Mouse_Out", "GameOption_UIKeySetting_PadKey_Simpletooltip( false, " .. index .. ", 0 )")
      else
        ;
        (BUTTON_PAD[index]):addInputEvent("Mouse_On", "")
        ;
        (BUTTON_PAD[index]):addInputEvent("Mouse_Out", "")
      end
      if (STATIC_INPUT_TITLE[index]):IsLimitText() then
        (STATIC_INPUT_TITLE[index]):addInputEvent("Mouse_On", "GameOption_UIKeySetting_Simpletooltip( true, " .. index .. ", 0 )")
        ;
        (STATIC_INPUT_TITLE[index]):addInputEvent("Mouse_Out", "GameOption_UIKeySetting_Simpletooltip( false, " .. index .. ", 0 )")
        ;
        (STATIC_INPUT_TITLE[index]):SetIgnore(false)
      else
        ;
        (STATIC_INPUT_TITLE[index]):addInputEvent("Mouse_On", "")
        ;
        (STATIC_INPUT_TITLE[index]):addInputEvent("Mouse_Out", "")
        ;
        (STATIC_INPUT_TITLE[index]):SetIgnore(true)
      end
    end
  end
end

local INPUT_COUNT_START_UI = 0
local INPUT_COUNT_END_UI = 37
local STATIC_INPUT_TITLE_UI = {}
local BUTTON_KEY_UI = {}
local BUTTON_PAD_UI = {}
local INPUT_TYPE_UI = nil
local keyConfigListShowCount_UI = 38
local configDataIndex_UI = 0
local keyConfigData_UI = {}
local getKeyConfigData_UI = function(index)
  -- function num : 0_6 , upvalues : keyConfigData_UI, configDataIndex_UI
  return keyConfigData_UI[configDataIndex_UI + index]
end

local setKeyConfigData_UI = function(index, title, button, padKey)
  -- function num : 0_7 , upvalues : keyConfigData_UI
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R4 in 'UnsetPending'

  if title ~= nil then
    keyConfigData_UI[index] = {titleText = title, buttonKeyText = button, padKeyText = padKey}
  else
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R4 in 'UnsetPending'

    if button ~= nil then
      (keyConfigData_UI[index]).buttonKeyText = button
    else
      -- DECOMPILER ERROR at PC17: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (keyConfigData_UI[index]).padKeyText = padKey
    end
  end
end

local setKeyConfigData_UITitle = function(index, title)
  -- function num : 0_8 , upvalues : setKeyConfigData_UI
  setKeyConfigData_UI(index, title, "", "")
end

local setKeyConfigData_UIConfigButton = function(index, button)
  -- function num : 0_9 , upvalues : setKeyConfigData_UI
  setKeyConfigData_UI(index, nil, button, nil)
end

local setKeyConfigData_UIConfigPad = function(index, pad)
  -- function num : 0_10 , upvalues : setKeyConfigData_UI
  setKeyConfigData_UI(index, nil, nil, pad)
end

local updateKeyConfig_UI = function()
  -- function num : 0_11 , upvalues : keyConfigListShowCount_UI, getKeyConfigData_UI, STATIC_INPUT_TITLE_UI, BUTTON_KEY_UI, BUTTON_PAD_UI
  for index = 0, keyConfigListShowCount_UI - 1 do
    local keyConfigData_UI = getKeyConfigData_UI(index)
    if keyConfigData_UI ~= nil and (CppEnums.UiInputType).UiInputType_Cancel ~= index then
      (STATIC_INPUT_TITLE_UI[index]):SetText(keyConfigData_UI.titleText)
      ;
      (BUTTON_KEY_UI[index]):SetText(keyConfigData_UI.buttonKeyText)
      ;
      (BUTTON_PAD_UI[index]):SetText(keyConfigData_UI.padKeyText)
      if (BUTTON_PAD_UI[index]):IsLimitText() then
        (BUTTON_PAD_UI[index]):addInputEvent("Mouse_On", "GameOption_UIKeySetting_PadKey_Simpletooltip( true, " .. index .. ", 1 )")
        ;
        (BUTTON_PAD_UI[index]):addInputEvent("Mouse_Out", "GameOption_UIKeySetting_PadKey_Simpletooltip( false, " .. index .. ", 1 )")
      else
        ;
        (BUTTON_PAD_UI[index]):addInputEvent("Mouse_On", "")
        ;
        (BUTTON_PAD_UI[index]):addInputEvent("Mouse_Out", "")
      end
      if (STATIC_INPUT_TITLE_UI[index]):IsLimitText() then
        (STATIC_INPUT_TITLE_UI[index]):addInputEvent("Mouse_On", "GameOption_UIKeySetting_Simpletooltip( true, " .. index .. ", 1 )")
        ;
        (STATIC_INPUT_TITLE_UI[index]):addInputEvent("Mouse_Out", "GameOption_UIKeySetting_Simpletooltip( false, " .. index .. ", 1 )")
        ;
        (STATIC_INPUT_TITLE_UI[index]):SetIgnore(false)
      else
        ;
        (STATIC_INPUT_TITLE_UI[index]):addInputEvent("Mouse_On", "")
        ;
        (STATIC_INPUT_TITLE_UI[index]):addInputEvent("Mouse_Out", "")
        ;
        (STATIC_INPUT_TITLE_UI[index]):SetIgnore(true)
      end
    end
  end
end

local GetStr_Option = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TXT_DISPLAY_HELP"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TXT_SOUND_HELP"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TXT_GAME_HELP"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TXT_KEY_HELP"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_GAMMA"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_INTERFACE"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_MASTERVOLUME"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_BGMVOLUME"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_FXVOLUME"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_ENVVOLUME"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_DIALOGVOLUME"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_CAMERASHAKE"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_MOUSESENSEX"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_MOUSESENSEY"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_PADSENSEX"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_PADSENSEY"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TXT_KEYUI_HELP"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_CAMERABLUR"), [18] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_HITFXVOLUME"), [19] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_HITFXWEIGHT"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_OTHERUSERVOLUME"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_CONTRAST"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_CAMERAPOS"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_CAMERAFOV"), [24] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_FOV"), [25] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_CAMERAMASTER"), [26] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TXT_LANGUAGE_HELP"), [27] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TXT_EFFECTALPHA"), [28] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TXT_COLORBYPASS")}
local _volumeParam = SoundVolumeParam()
Panel_Window_Option:AddChild(_frame_Display)
Panel_GameOption_Display:RemoveControl(_frame_Display)
Panel_Window_Option:AddChild(_frame_Sound)
Panel_GameOption_Sound:RemoveControl(_frame_Sound)
Panel_Window_Option:AddChild(_frame_Game)
Panel_GameOption_Game:RemoveControl(_frame_Game)
Panel_Window_Option:AddChild(_static_KeySetBG)
Panel_Window_Option:AddChild(_static_PadSetBG)
Panel_Window_Option:AddChild(_static_KeySetTitle)
Panel_Window_Option:AddChild(_static_ResetKeyConfig)
Panel_Window_Option:AddChild(_frame_KeyConfig)
Panel_GameOption_Key:RemoveControl(_static_KeySetBG)
Panel_GameOption_Key:RemoveControl(_static_PadSetBG)
Panel_GameOption_Key:RemoveControl(_static_KeySetTitle)
Panel_GameOption_Key:RemoveControl(_static_ResetKeyConfig)
Panel_GameOption_Key:RemoveControl(_frame_KeyConfig)
Panel_Window_Option:AddChild(_static_KeySetBG_UI)
Panel_Window_Option:AddChild(_static_PadSetBG_UI)
Panel_Window_Option:AddChild(_static_KeySetTitle_UI)
Panel_Window_Option:AddChild(_static_ResetKeyConfig_UI)
Panel_Window_Option:AddChild(_static_ResetPositionConfig_UI)
Panel_Window_Option:AddChild(_frame_KeyConfig_UI)
Panel_GameOption_Key_UI:RemoveControl(_static_KeySetBG_UI)
Panel_GameOption_Key_UI:RemoveControl(_static_PadSetBG_UI)
Panel_GameOption_Key_UI:RemoveControl(_static_KeySetTitle_UI)
Panel_GameOption_Key_UI:RemoveControl(_static_ResetKeyConfig_UI)
Panel_GameOption_Key_UI:RemoveControl(_static_ResetPositionConfig_UI)
Panel_GameOption_Key_UI:RemoveControl(_frame_KeyConfig_UI)
Panel_Window_Option:AddChild(_frame_Language)
Panel_GameOption_Language:RemoveControl(_frame_Language)
;
(gamePanel_Main._btn_Display):addInputEvent("Mouse_LUp", "ShowFrame_Func()")
;
(gamePanel_Main._btn_Display):addInputEvent("Mouse_On", "GameOption_SimpleToolTips( true, 1 )")
;
(gamePanel_Main._btn_Display):addInputEvent("Mouse_Out", "GameOption_SimpleToolTips( false )")
;
(gamePanel_Main._btn_Sound):addInputEvent("Mouse_LUp", "ShowFrame_Func()")
;
(gamePanel_Main._btn_Sound):addInputEvent("Mouse_On", "GameOption_SimpleToolTips( true, 2 )")
;
(gamePanel_Main._btn_Sound):addInputEvent("Mouse_Out", "GameOption_SimpleToolTips( false )")
;
(gamePanel_Main._btn_Game):addInputEvent("Mouse_LUp", "ShowFrame_Func()")
;
(gamePanel_Main._btn_Game):addInputEvent("Mouse_On", "GameOption_SimpleToolTips( true, 3 )")
;
(gamePanel_Main._btn_Game):addInputEvent("Mouse_Out", "GameOption_SimpleToolTips( false )")
;
(gamePanel_Main._btn_KeyConfig):addInputEvent("Mouse_LUp", "ShowFrame_Func()")
;
(gamePanel_Main._btn_KeyConfig):addInputEvent("Mouse_On", "GameOption_SimpleToolTips( true, 4 )")
;
(gamePanel_Main._btn_KeyConfig):addInputEvent("Mouse_Out", "GameOption_SimpleToolTips( false )")
;
(gamePanel_Main._btn_KeyConfig_UI):addInputEvent("Mouse_LUp", "ShowFrame_Func()")
;
(gamePanel_Main._btn_KeyConfig_UI):addInputEvent("Mouse_On", "GameOption_SimpleToolTips( true, 5 )")
;
(gamePanel_Main._btn_KeyConfig_UI):addInputEvent("Mouse_Out", "GameOption_SimpleToolTips( false )")
;
(gamePanel_Main._btn_Language):addInputEvent("Mouse_LUp", "ShowFrame_Func()")
;
(gamePanel_Main._btn_Language):addInputEvent("Mouse_On", "GameOption_SimpleToolTips( true, 6 )")
;
(gamePanel_Main._btn_Language):addInputEvent("Mouse_Out", "GameOption_SimpleToolTips( false )")
local simpleToolTipIdx = {_btn_ScreenMode0 = 0, _btn_ScreenMode1 = 1, _btn_ScreenMode2 = 2, _btn_ScrSize = 3, _btn_Trxt = 4, _btn_Rndr = 5, _btn_AntiAlli = 6, _btn_SSAO = 7, _btn_PostFilter = 8, _btn_DOF = 9, _btn_Tessellation = 10, _btn_Ultra = 11, _btn_BloodEffect = 12, _btn_LensBlood = 13, _btn_CharacterEffect = 14, _btn_SelfPlayerOnlyEffect = 15, _btn_SelfPlayerOnlyLantern = 16, _btn_CropModeEnable = 17, _btn_CropModeScaleX = 18, _btn_CropModeScaleY = 19, _btn_UpscaleEnable = 20, _btn_UIScale = 21, _btn_CameraMaster = 22, _btn_CameraShake = 23, _btn_MotionBlur = 24, _btn_CameraPos = 25, _btn_CameraFov = 26, _btn_LUT = 27, _btn_LUT_Reset = 28, _btn_Gamma = 29, _btn_Contrast = 30, _btn_Fov = 31, _btn_MusicOnOff = 32, _btn_FXOnOff = 33, _btn_EnvFXOnOff = 34, _btn_TotalVol = 35, _btn_MusicVol = 36, _btn_FxVol = 37, _btn_EnvFxVol = 38, _btn_VoiceVol = 39, _btn_hitFxVolume = 40, _btn_hitFxWeightVolume = 41, _btn_otherPlayerVolume = 42, _btn_AutoAim = 43, _btn_HideWindow = 44, _btn_GuildLogin = 45, _btn_RejectInvitation = 46, _btn_EnableSimpleUI = 47, _btn_SpiritGuide = 48, _btn_MouseMove = 49, _btn_EnableOVR = 50, _btn_SelfNameShowAllways = 51, _btn_SelfNameShowImportant = 52, _btn_SelfNameShowNoShow = 53, _btn_OtherNameShow = 54, _btn_PartyNameShow = 55, _btn_GuildNameShow = 56, _btn_Alert_Region = 57, _btn_Alert_TerritoryTrade = 58, _btn_Alert_RoyalTrade = 59, _btn_Alert_Fitness = 60, _btn_Alert_TerritoryWar = 61, _btn_Alert_GuildWar = 62, _btn_Alert_PlayerGotItem = 63, _btn_Alert_ItemMarket = 64, _btn_Alert_LifeLevUp = 65, _btn_Alert_GuildQuest = 66, _btn_MouseX = 67, _btn_MouseY = 68, _btn_MouXSen = 69, _btn_MouYSen = 70, _btn_UsePad = 71, _btn_UseVibe = 72, _btn_PadX = 73, _btn_PadY = 74, _btn_PadXSen = 75, _btn_PadYSen = 76, _btn_MiniMapRotation = 77, _btn_NearestPlayerOnlyEffect = 78, _btn_PetAll = 79, _btn_PetMine = 80, _btn_PetHide = 81, _btn_NavGuideNone = 82, _btn_NavGuideArrow = 83, _btn_NavGuideEffect = 84, _btn_NavGuideFairy = 85, _btn_ShowAttackEffect = 86, _btn_Alert_BlackSpirit = 87, _btn_RiddingOnOff = 88, _btn_CombatAllwaysOn = 89, _btn_CombatAllwaysOff = 90, _btn_CombatAllwaysLowOff = 91, _btn_UseNewQuickSlot = 92, _btn_UseChattingFilter = 93, _btn_GuideLineHumanRelation = 94, _btn_GuideLineZoneChange = 95, _btn_GuideLineWarAlly = 96, _btn_GuideLineGuild = 97, _btn_GuideLineParty = 98, _btn_GuideLineEnemy = 99, _btn_GuideLineNonWarPlayer = 100, _btn_GuideLineQuestObject = 101, _btn_IsOnScreenSaver = 102, _btn_WhisperOnOff = 103, _btn_UIModeMouseLock = 104, _btn_PvpRefuse = 105, _btn_TraySoundOnOff = 106, _btn_ColorBlind_None = 107, _btn_ColorBlind_Red = 108, _btn_ColorBlind_Green = 109, _btn_WorldMapOpenByWestMaintain = 110, _btn_WorldMapOpenByCharacterToWest = 111, _btn_WorldMapOpenByCharacterMaintain = 112, _btn_WorldMapOpenByNone = 113, _btn_WorldMapCameraAngle = 114, _btn_WorldMapCameraDefaultAngle = 115, _btn_WorldMapCameraDegree30 = 116, _btn_WorldMapCameraDegree90 = 117, _btn_Alert_NearMonster = 118, _btn_GuideLinePartyEffect = 119, _btn_WorkerVisible = 120, _btn_AutoOptimization = 121, _btn_AutoOptimizationSlide = 122, _btn_HideMast = 123, _btn_ShowCashAlert = 124, _btn_FontResizeDefault = 125, _btn_FontResizeBig = 126, _btn_FontResizeMoreBig = 127, _btn_SnowPoolOnlyInSafeZone = 128, _btn_Alert_ServantMarket = 129, _btn_LowPower = 130, _btn_ScreenShotSize_4k = 131, _btn_ScreenShotSize_8k = 132, _btn_EffectAlpha = 133, _btn_ExchangeRefuse = 134, _btn_ScreenShotSize_Default = 135}
local toolTipIdxValue = {
[simpleToolTipIdx._btn_ScreenMode0] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SCREENMODE0"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SCREENMODE0"), control = (frame_Display._btn_ScreenMode)[0]}
, 
[simpleToolTipIdx._btn_ScreenMode1] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SCREENMODE1"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SCREENMODE1"), control = (frame_Display._btn_ScreenMode)[1]}
, 
[simpleToolTipIdx._btn_ScreenMode2] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SCREENMODE2"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SCREENMODE2"), control = (frame_Display._btn_ScreenMode)[2]}
, 
[simpleToolTipIdx._btn_ScrSize] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SCRSIZE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SCRSIZE"), control = frame_Display._btn_ScrSize}
, 
[simpleToolTipIdx._btn_Trxt] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_TRXT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_TRXT"), control = frame_Display._btn_Trxt}
, 
[simpleToolTipIdx._btn_Rndr] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_RNDR"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_RNDR"), control = frame_Display._btn_Rndr}
, 
[simpleToolTipIdx._btn_AntiAlli] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ANTIALLI"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ANTIALLI"), control = frame_Display._btn_AntiAlli}
, 
[simpleToolTipIdx._btn_SSAO] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SSAO"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SSAO"), control = frame_Display._btn_SSAO}
, 
[simpleToolTipIdx._btn_PostFilter] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_FILTER"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_FILTER"), control = frame_Display._btn_PostFilter}
, 
[simpleToolTipIdx._btn_DOF] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_DOF"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_DOF"), control = frame_Display._btn_DOF}
, 
[simpleToolTipIdx._btn_Tessellation] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_TESSELLATION"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_TESSELLATION"), control = frame_Display._btn_Tessellation}
, 
[simpleToolTipIdx._btn_Ultra] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ULTRA"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ULTRA"), control = frame_Display._btn_Ultra}
, 
[simpleToolTipIdx._btn_BloodEffect] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_BLOODEFFECT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_BLOODEFFECT"), control = frame_Display._btn_BloodEffect}
, 
[simpleToolTipIdx._btn_LensBlood] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_LENSBLOOD"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_LENSBLOOD"), control = frame_Display._btn_LensBlood}
, 
[simpleToolTipIdx._btn_CharacterEffect] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CHARACTEREFFECT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_CHARACTEREFFECT"), control = frame_Display._btn_CharacterEffect}
, 
[simpleToolTipIdx._btn_SelfPlayerOnlyEffect] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SELFPLAYERONLYEFFECT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SELFPLAYERONLYEFFECT"), control = frame_Display._btn_SelfPlayerOnlyEffect}
, 
[simpleToolTipIdx._btn_NearestPlayerOnlyEffect] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_NEARESTPLAYERONLYEFFECT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NEARESTPLAYERONLYEFFECT"), control = frame_Display._btn_NearestPlayerOnlyEffect}
, 
[simpleToolTipIdx._btn_SnowPoolOnlyInSafeZone] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SNOWPOOLONLYINSAFEZONE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SNOWPOOLONLYINSAFEZONE"), control = frame_Display._btn_SnowPoolOnlyInSafeZone}
, 
[simpleToolTipIdx._btn_SelfPlayerOnlyLantern] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SELFPLAYERONLYLANTERN"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SELFPLAYERONLYLANTERN"), control = frame_Display._btn_SelfPlayerOnlyLantern}
, 
[simpleToolTipIdx._btn_CropModeEnable] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CROPMODEENABLE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_CROPMODEENABLE"), control = frame_Display._btn_CropModeEnable}
, 
[simpleToolTipIdx._btn_CropModeScaleX] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CROPMODESCALEX"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_CROPMODESCALEX"), control = _btn_CropModeScaleX}
, 
[simpleToolTipIdx._btn_CropModeScaleY] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CROPMODESCALEY"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_CROPMODESCALEY"), control = _btn_CropModeScaleY}
, 
[simpleToolTipIdx._btn_AutoOptimization] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_AUTOOPTIMIZATION"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_AUTOOPTIMIZATION"), control = frame_Display._btn_AutoOptimization}
, 
[simpleToolTipIdx._btn_AutoOptimizationSlide] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_AUTOOPTIMIZATIONSLIDE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_AUTOOPTIMIZATIONSLIDE"), control = _btn_AutoOptimizationSlide}
, 
[simpleToolTipIdx._btn_UpscaleEnable] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_UPSCALE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_UPSCALE"), control = frame_Display._btn_UpscaleEnable}
, 
[simpleToolTipIdx._btn_UIScale] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_UISCALE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_UISCALE"), control = _btn_UIScale}
, 
[simpleToolTipIdx._btn_EffectAlpha] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_EFFECTALPHA"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_EFFECTALPHA"), control = _btn_EffectAlpha}
, 
[simpleToolTipIdx._btn_CameraMaster] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CAMERAMASTER"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_CAMERAMASTER"), control = _btn_CameraMaster}
, 
[simpleToolTipIdx._btn_CameraShake] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CAMERASHAKE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_CAMERASHAKE"), control = _btn_CameraShake}
, 
[simpleToolTipIdx._btn_MotionBlur] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_MOTIONBLUR"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_MOTIONBLUR"), control = _btn_MotionBlur}
, 
[simpleToolTipIdx._btn_CameraPos] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CAMERAPOS"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_CAMERAPOS"), control = _btn_CameraPos}
, 
[simpleToolTipIdx._btn_CameraFov] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CAMERAFOV"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_CAMERAFOV"), control = _btn_CameraFov}
, 
[simpleToolTipIdx._btn_LUT] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_LUT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_LUT"), control = frame_Display._btn_LUT}
, 
[simpleToolTipIdx._btn_LUT_Reset] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_LUT_RESET"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_LUT_RESET"), control = frame_Display._btn_LUT_Reset}
, 
[simpleToolTipIdx._btn_Gamma] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_GAMMA"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_GAMMA"), control = _btn_Gamma}
, 
[simpleToolTipIdx._btn_Contrast] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CONTRAST"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_CONTRAST"), control = _btn_Contrast}
, 
[simpleToolTipIdx._btn_Fov] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_FOV"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_FOV"), control = _btn_Fov}
, 
[simpleToolTipIdx._btn_ColorBlind_Red] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_COLORBLIND_TOOLTIP_NAME_RED"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_COLORBLIND_TOOLTIP_DESC_RED"), control = (frame_Display._btn_ColorBlind)[1]}
, 
[simpleToolTipIdx._btn_ColorBlind_Green] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_COLORBLIND_TOOLTIP_NAME_GREEN"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_COLORBLIND_TOOLTIP_DESC_GREEN"), control = (frame_Display._btn_ColorBlind)[2]}
, 
[simpleToolTipIdx._btn_WorkerVisible] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_WORKERVISIBLE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_WORKERVISIBLE"), control = frame_Display._btn_WorkerVisible}
, 
[simpleToolTipIdx._btn_MusicOnOff] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_MUSICONOFF"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_MUSICONOFF"), control = frame_Sound._btn_MusicOnOff}
, 
[simpleToolTipIdx._btn_FXOnOff] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_FXONOFF"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_FXONOFF"), control = frame_Sound._btn_FXOnOff}
, 
[simpleToolTipIdx._btn_EnvFXOnOff] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ENVFXONOFF"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ENVFXONOFF"), control = frame_Sound._btn_EnvFXOnOff}
, 
[simpleToolTipIdx._btn_TotalVol] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_TOTALVOL"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_TOTALVOL"), control = _btn_TotalVol}
, 
[simpleToolTipIdx._btn_MusicVol] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_MUSICVOL"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_MUSICVOL"), control = _btn_MusicVol}
, 
[simpleToolTipIdx._btn_FxVol] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_FXVOL"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_FXVOL"), control = _btn_FxVol}
, 
[simpleToolTipIdx._btn_EnvFxVol] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ENVFXVOL"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ENVFXVOL"), control = _btn_EnvFxVol}
, 
[simpleToolTipIdx._btn_VoiceVol] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_VOICEVOL"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_VOICEVOL"), control = _btn_VoiceVol}
, 
[simpleToolTipIdx._btn_hitFxVolume] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_HITFXVOLUME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_HITFXVOLUME"), control = _btn_hitFxVolume}
, 
[simpleToolTipIdx._btn_hitFxWeightVolume] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_HITFXWEIGHTVOLUME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_HITFXWEIGHTVOLUME"), control = _btn_hitFxWeightVolume}
, 
[simpleToolTipIdx._btn_otherPlayerVolume] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_OTHERPLAYERVOLUME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_OTHERPLAYERVOLUME"), control = _btn_otherPlayerVolume}
, 
[simpleToolTipIdx._btn_WhisperOnOff] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_WHISPERONOFF"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_WHISPERONOFFDESC"), control = frame_Sound._btn_WhisperOnOff}
, 
[simpleToolTipIdx._btn_TraySoundOnOff] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_TRAYSOUNDONOFF"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_TRAYSOUNDONOFFDESC"), control = frame_Sound._btn_TraySoundOnOff}
, 
[simpleToolTipIdx._btn_AutoAim] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_AUTOAIM"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_AUTOAIM"), control = frame_Game._btn_AutoAim}
, 
[simpleToolTipIdx._btn_HideWindow] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_HIDEWINDOW"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_HIDEWINDOW"), control = frame_Game._btn_HideWindow}
, 
[simpleToolTipIdx._btn_GuildLogin] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_GUILDLOGIN"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_GUILDLOGIN"), control = frame_Game._btn_GuildLogin}
, 
[simpleToolTipIdx._btn_RejectInvitation] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_REJECTINVITATION"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_REJECTINVITATION"), control = frame_Game._btn_RejectInvitation}
, 
[simpleToolTipIdx._btn_EnableSimpleUI] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ENABLESIMPLEUI"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ENABLESIMPLEUI"), control = frame_Game._btn_EnableSimpleUI}
, 
[simpleToolTipIdx._btn_SpiritGuide] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SPIRITGUIDE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SPIRITGUIDE"), control = frame_Game._btn_SpiritGuide}
, 
[simpleToolTipIdx._btn_MouseMove] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_MOUSEMOVE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_MOUSEMOVE"), control = frame_Game._btn_MouseMove}
, 
[simpleToolTipIdx._btn_MiniMapRotation] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_MINIMAPROTATION"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_MINIMAPROTATION"), control = frame_Game._btn_MiniMapRotation}
, 
[simpleToolTipIdx._btn_ShowAttackEffect] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ATTACKEFFECT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_DESC_ATTACKEFFECT"), control = frame_Game._btn_ShowAttackEffect}
, 
[simpleToolTipIdx._btn_Alert_BlackSpirit] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_BLACKSPIRITALERT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_DESC_BLACKSPIRITALERT"), control = frame_Game._btn_Alert_BlackSpirit}
, 
[simpleToolTipIdx._btn_UseNewQuickSlot] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_NEWQUICKSLOT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_DESC_NEWQUICKSLOT"), control = frame_Game._btn_UseNewQuickSlot}
, 
[simpleToolTipIdx._btn_UseChattingFilter] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CHATTINGFILTER"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_DESC_CHATTINGFILTER"), control = frame_Game._btn_UseChattingFilter}
, 
[simpleToolTipIdx._btn_EnableOVR] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ENABLEOVR"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ENABLEOVR"), control = frame_Game._btn_EnableOVR}
, 
[simpleToolTipIdx._btn_SelfNameShowAllways] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SELFNAMESHOWALLWAYS"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SELFNAMESHOWALLWAYS"), control = frame_Game._btn_SelfNameShowAllways}
, 
[simpleToolTipIdx._btn_SelfNameShowImportant] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SELFNAMESHOWIMPORTANT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SELFNAMESHOWIMPORTANT"), control = frame_Game._btn_SelfNameShowImportant}
, 
[simpleToolTipIdx._btn_SelfNameShowNoShow] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_SELFNAMESHOWNOSHOW"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_SELFNAMESHOWNOSHOW"), control = frame_Game._btn_SelfNameShowNoShow}
, 
[simpleToolTipIdx._btn_PetAll] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_PETALL_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_PETALL_TOOLTIP_DESC"), control = frame_Game._btn_PetAll}
, 
[simpleToolTipIdx._btn_PetMine] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_PETMINE_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_PETMINE_TOOLTIP_DESC"), control = frame_Game._btn_PetMine}
, 
[simpleToolTipIdx._btn_PetHide] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_PETHIDE_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_PETHIDE_TOOLTIP_DESC"), control = frame_Game._btn_PetHide}
, 
[simpleToolTipIdx._btn_FontResizeDefault] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FONTRESIZE_TOOLTIP_NAME_DEFAULT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FONTRESIZE_TOOLTIP_DESC_DEFAULT"), control = frame_Game._btn_FontResizeDefault}
, 
[simpleToolTipIdx._btn_FontResizeBig] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FONTRESIZE_TOOLTIP_NAME_BIG"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FONTRESIZE_TOOLTIP_DESC_BIG"), control = frame_Game._btn_FontResizeBig}
, 
[simpleToolTipIdx._btn_FontResizeMoreBig] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FONTRESIZE_TOOLTIP_NAME_MOREBIG"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FONTRESIZE_TOOLTIP_DESC_MOREBIG"), control = frame_Game._btn_FontResizeMoreBig}
, 
[simpleToolTipIdx._btn_NavGuideNone] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NAV_NONE_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NAV_NONE_TOOLTIP_DESC"), control = frame_Game._btn_NavGuideNone}
, 
[simpleToolTipIdx._btn_NavGuideArrow] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NAV_ARROW_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NAV_ARROW_TOOLTIP_DESC"), control = frame_Game._btn_NavGuideArrow}
, 
[simpleToolTipIdx._btn_NavGuideEffect] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NAV_EFFECT_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NAV_EFFECT_TOOLTIP_DESC"), control = frame_Game._btn_NavGuideEffect}
, 
[simpleToolTipIdx._btn_NavGuideFairy] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NAV_FAIRY_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NAV_FAIRY_TOOLTIP_DESC"), control = frame_Game._btn_NavGuideFairy}
, 
[simpleToolTipIdx._btn_OtherNameShow] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_OTHERNAMESHOW"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_OTHERNAMESHOW"), control = frame_Game._btn_OtherNameShow}
, 
[simpleToolTipIdx._btn_PartyNameShow] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_PARTYNAMESHOW"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_PARTYNAMESHOW"), control = frame_Game._btn_PartyNameShow}
, 
[simpleToolTipIdx._btn_GuildNameShow] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_GUILDNAMESHOW"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_GUILDNAMESHOW"), control = frame_Game._btn_GuildNameShow}
, 
[simpleToolTipIdx._btn_GuideLineHumanRelation] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_HUMANRELATION_TITLE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_HUMANRELATION_DESC"), control = frame_Game._btn_GuideLineHumanRelation}
, 
[simpleToolTipIdx._btn_GuideLineQuestObject] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_QUESTLINE_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_QUESTLINE_TOOLTIP_DESC"), control = frame_Game._btn_GuideLineQuestObject}
, 
[simpleToolTipIdx._btn_GuideLineZoneChange] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_ZONECHANGE_TITLE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_ZONECHANGE_DESC"), control = frame_Game._btn_GuideLineZoneChange}
, 
[simpleToolTipIdx._btn_GuideLineWarAlly] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_WARALLY_TITLE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_WARALLY_DESC"), control = frame_Game._btn_GuideLineWarAlly}
, 
[simpleToolTipIdx._btn_GuideLineGuild] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_GUILD_TITLE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_GUILD_DESC"), control = frame_Game._btn_GuideLineGuild}
, 
[simpleToolTipIdx._btn_GuideLineParty] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_PARTY_TITLE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_PARTY_DESC"), control = frame_Game._btn_GuideLineParty}
, 
[simpleToolTipIdx._btn_GuideLineEnemy] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_ENEMY_TITLE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_ENEMY_DESC"), control = frame_Game._btn_GuideLineEnemy}
, 
[simpleToolTipIdx._btn_GuideLineNonWarPlayer] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_NONWARPLAYER_TITLE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_GAME_GUIDELINE_NONWARPLAYER_DESC"), control = frame_Game._btn_GuideLineNonWarPlayer}
, 
[simpleToolTipIdx._btn_Alert_Region] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_REGION"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_REGION"), control = frame_Game._btn_Alert_Region}
, 
[simpleToolTipIdx._btn_Alert_TerritoryTrade] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_TERRITORYTRADE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_TERRITORYTRADE"), control = frame_Game._btn_Alert_TerritoryTrade}
, 
[simpleToolTipIdx._btn_Alert_RoyalTrade] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_ROYALTRADE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_ROYALTRADE"), control = frame_Game._btn_Alert_RoyalTrade}
, 
[simpleToolTipIdx._btn_Alert_Fitness] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_FITNESS"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_FITNESS"), control = frame_Game._btn_Alert_Fitness}
, 
[simpleToolTipIdx._btn_Alert_TerritoryWar] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_TERRITORYWAR"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_TERRITORYWAR"), control = frame_Game._btn_Alert_TerritoryWar}
, 
[simpleToolTipIdx._btn_Alert_GuildWar] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_GUILDWAR"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_GUILDWAR"), control = frame_Game._btn_Alert_GuildWar}
, 
[simpleToolTipIdx._btn_Alert_PlayerGotItem] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_PLAYERGOTITEM"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_PLAYERGOTITEM"), control = frame_Game._btn_Alert_PlayerGotItem}
, 
[simpleToolTipIdx._btn_Alert_ItemMarket] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_ITEMMARKET"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_ITEMMARKET"), control = frame_Game._btn_Alert_ItemMarket}
, 
[simpleToolTipIdx._btn_Alert_LifeLevUp] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_LIFELEVUP"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_LIFELEVUP"), control = frame_Game._btn_Alert_LifeLevUp}
, 
[simpleToolTipIdx._btn_Alert_GuildQuest] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_GUILDQUEST"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_GUILDQUEST"), control = frame_Game._btn_Alert_GuildQuest}
, 
[simpleToolTipIdx._btn_Alert_NearMonster] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_NEARMONSTER"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_NEARMONSTER"), control = frame_Game._btn_Alert_NearMonster}
, 
[simpleToolTipIdx._btn_Alert_ServantMarket] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ALERT_SERVANTMARKET"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_ALERT_SERVANTMARKET"), control = frame_Game._btn_Alert_ServantMarket}
, 
[simpleToolTipIdx._btn_MouseX] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_MOUSEX"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_MOUSEX"), control = frame_Game._btn_MouseX}
, 
[simpleToolTipIdx._btn_MouseY] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_MOUSEY"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_MOUSEY"), control = frame_Game._btn_MouseY}
, 
[simpleToolTipIdx._btn_MouXSen] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_MOUXSEN"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_MOUXSEN"), control = _btn_MouXSen}
, 
[simpleToolTipIdx._btn_MouYSen] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_MOUYSEN"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_MOUYSEN"), control = _btn_MouYSen}
, 
[simpleToolTipIdx._btn_UsePad] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_USEPAD"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_USEPAD"), control = frame_Game._btn_UsePad}
, 
[simpleToolTipIdx._btn_UseVibe] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_USEVIBE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_USEVIBE"), control = frame_Game._btn_UseVibe}
, 
[simpleToolTipIdx._btn_PadX] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_PADX"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_PADX"), control = frame_Game._btn_PadX}
, 
[simpleToolTipIdx._btn_PadY] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_PADY"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_PADY"), control = frame_Game._btn_PadY}
, 
[simpleToolTipIdx._btn_PadXSen] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_PADXSEN"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_PADXSEN"), control = _btn_PadXSen}
, 
[simpleToolTipIdx._btn_PadYSen] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_PADYSEN"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_PADYSEN"), control = _btn_PadYSen}
, 
[simpleToolTipIdx._btn_RiddingOnOff] = {name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_SERVANT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_SOUND_SERVANT"), control = frame_Sound._btn_RiddingOnOff}
, 
[simpleToolTipIdx._btn_CombatAllwaysOn] = {name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_COMBATALLWAYS"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_SOUND_COMBATALLWAYS"), control = frame_Sound._btn_CombatAllwaysOn}
, 
[simpleToolTipIdx._btn_CombatAllwaysOff] = {name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_COMBATTURNOFF"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_SOUND_COMBATTURNOFF"), control = frame_Sound._btn_CombatAllwaysOff}
, 
[simpleToolTipIdx._btn_CombatAllwaysLowOff] = {name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_COMBATNORMAL"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_SOUND_COMBATNORMAL"), control = frame_Sound._btn_CombatAllwaysLowOff}
, 
[simpleToolTipIdx._btn_IsOnScreenSaver] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ISONSCREENSAVER"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_ISONSCREENSAVERDESC"), control = frame_Game._btn_IsOnScreenSaver}
, 
[simpleToolTipIdx._btn_UIModeMouseLock] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_UIMODEMOUSELOCK"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_UIMODEMOUSELOCKDESC"), control = frame_Game._btn_UIModeMouseLock}
, 
[simpleToolTipIdx._btn_PvpRefuse] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_PVPREFUSE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_PVPREFUSEDESC"), control = frame_Game._btn_PvpRefuse}
, 
[simpleToolTipIdx._btn_ExchangeRefuse] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_REJECTEXCHANGE"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_DESC_REJECTEXCHANGE"), control = frame_Game._btn_ExchangeRefuse}
, 
[simpleToolTipIdx._btn_HideMast] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_HIDEMAST"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_HIDEMAST_DESC"), control = frame_Game._btn_HideMast}
, 
[simpleToolTipIdx._btn_ShowCashAlert] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CASHALERT"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_CASHALERT_DESC"), control = frame_Game._btn_ShowCashAlert}
, 
[simpleToolTipIdx._btn_WorldMapOpenByWestMaintain] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPOPENBYWESTMAINTAIN_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPOPENBYWESTMAINTAIN_TOOLTIP_DESC"), control = frame_Game._btn_WorldMapOpenByWestMaintain}
, 
[simpleToolTipIdx._btn_WorldMapOpenByCharacterToWest] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPOPENBYCHARACTERTOWEST_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPOPENBYCHARACTERTOWEST_TOOLTIP_DESC"), control = frame_Game._btn_WorldMapOpenByCharacterToWest}
, 
[simpleToolTipIdx._btn_WorldMapOpenByCharacterMaintain] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPOPENBYCHARACTERMAINTAIN_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPOPENBYCHARACTERMAINTAIN_TOOLTIP_DESC"), control = frame_Game._btn_WorldMapOpenByCharacterMaintain}
, 
[simpleToolTipIdx._btn_WorldMapOpenByNone] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPOPENBYNOANIMATION_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPOPENBYNOANIMATION_TOOLTIP_DESC"), control = frame_Game._btn_WorldMapOpenByNone}
, 
[simpleToolTipIdx._btn_WorldMapCameraDefaultAngle] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPCAMERADEFAULTDEGREE_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPCAMERADEFAULTDEGREE_TOOLTIP_DESC"), control = frame_Game._btn_WorldMapCameraDefaultAngle}
, 
[simpleToolTipIdx._btn_WorldMapCameraDegree30] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPCAMERADEGREE30_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPCAMERADEGREE30_TOOLTIP_DESC"), control = frame_Game._btn_WorldMapCameraDegree30}
, 
[simpleToolTipIdx._btn_WorldMapCameraDegree90] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPCAMERADEGREE90_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_WORLDMAPCAMERADEGREE90_TOOLTIP_DESC"), control = frame_Game._btn_WorldMapCameraDegree90}
, 
[simpleToolTipIdx._btn_GuideLinePartyEffect] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_PARTYMEMBEREFFECT_TOOLTIP_NAME"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_PARTYMEMBEREFFECT_TOOLTIP_DESC"), control = frame_Game._btn_GuideLinePartyEffect}
, 
[simpleToolTipIdx._btn_LowPower] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_LOWPOWER"), desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_LOWPOWER_TOOLTIP_DESC"), control = frame_Display._btn_LowPower}
, 
[simpleToolTipIdx._btn_ScreenShotSize_4k] = {name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_DISPLAY_SCREENSHOTSIZE_4K_NAME"), desc = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_DISPLAY_SCREENSHOTSIZE_4K_DESC"), control = (frame_Display._btn_ScreenShotSize)[1]}
, 
[simpleToolTipIdx._btn_ScreenShotSize_8k] = {name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_DISPLAY_SCREENSHOTSIZE_8K_NAME"), desc = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_DISPLAY_SCREENSHOTSIZE_8K_DESC"), control = (frame_Display._btn_ScreenShotSize)[2]}
, 
[simpleToolTipIdx._btn_ScreenShotSize_Default] = {name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_DISPLAY_SCREENSHOTSIZE_DEFAULT_NAME"), desc = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_DISPLAY_SCREENSHOTSIZE_DEFAULT_DESC"), control = (frame_Display._btn_ScreenShotSize)[0]}
}
local scaleRangeTable = {minScaleValue = 50, maxScaleValue = 120, minScaleHeight = 720, midleScaleHeight = 900, HighScaleHeight = 1080, MaxScaleHeight = 1600}
local effectAlphaRangeTable = {minAlphaValue = 30, maxAlphaValue = 100}
local const_UiScaleValue = {50, 90, 100, 120, 140, 200}
local isFindScreenResolution = true
local screenResolutionIndex = 1
local currentResolutionX = 0
local currentResolutionY = 0
if false == isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_KOR) then
  const_LowMaxScaleValue = 100
end
Panel_GameOption_Initialize = function()
  -- function num : 0_12 , upvalues : chk_Option, gamePanel_Main, isSaveSetting, UI_TM, GetStr_Option, frame_Display, frame_Game, frame_Sound, isDev
  HideAllFrame_Func()
  getFrameSize_SetSlideSize()
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if chk_Option.currentCheckUIScale ~= chk_Option.appliedCheckUIScale then
    chk_Option.appliedCheckUIScale = chk_Option.currentCheckUIScale
    GameOption_UIScale_Change()
  end
  if Panel_Login ~= nil and Panel_Login:GetShow() then
    (gamePanel_Main._buttonQuestion):SetShow(false)
    ;
    (gamePanel_Main._btn_SaveSetting):SetShow(false)
  else
    ;
    (gamePanel_Main._buttonQuestion):SetShow(true)
    if isSaveSetting then
      (gamePanel_Main._btn_SaveSetting):SetShow(true)
    else
      ;
      (gamePanel_Main._btn_SaveSetting):SetShow(false)
    end
  end
  ;
  (gamePanel_Main._txt_Comment):SetTextMode(UI_TM.eTextMode_AutoWrap)
  if isGameTypeKorea() then
    (gamePanel_Main._txt_Comment):SetTextSpan(130, 0)
  else
    ;
    (gamePanel_Main._txt_Comment):SetTextSpan(10, 0)
  end
  ;
  (gamePanel_Main._txt_Comment):SetText(GetStr_Option[0])
  ;
  (gamePanel_Main._txt_Comment):SetSize((gamePanel_Main._txt_Comment):GetSizeX(), (gamePanel_Main._txt_Comment):GetSizeY())
  ;
  (gamePanel_Main._btn_Display):SetCheck(true)
  ;
  (gamePanel_Main._btn_Sound):SetCheck(false)
  ;
  (gamePanel_Main._btn_Game):SetCheck(false)
  ;
  (gamePanel_Main._btn_KeyConfig):SetCheck(false)
  ;
  (gamePanel_Main._btn_KeyConfig_UI):SetCheck(false)
  ;
  (gamePanel_Main._btn_Language):SetCheck(false)
  local fullMode_TextSize = ((frame_Display._btn_ScreenMode)[0]):GetTextSizeX() + 5
  local windowFullMode_TextSize = ((frame_Display._btn_ScreenMode)[1]):GetTextSizeX() + 5
  local windowMode_TextSize = ((frame_Display._btn_ScreenMode)[2]):GetTextSizeX() + 5
  local fullMode = (frame_Display._btn_ScreenMode)[0]
  local windowFullMode = (frame_Display._btn_ScreenMode)[1]
  local windowMode = (frame_Display._btn_ScreenMode)[2]
  local dof_TextSize = (frame_Display._btn_DOF):GetTextSizeX() + 5
  local antiAlli_TextSize = (frame_Display._btn_AntiAlli):GetTextSizeX() + 5
  local ultra_TextSize = (frame_Display._btn_Ultra):GetTextSizeX() + 5
  local lensBlood_TextSize = (frame_Display._btn_LensBlood):GetTextSizeX() + 5
  local bloodEffect_TextSize = (frame_Display._btn_BloodEffect):GetTextSizeX() + 5
  local represent_TextSize = (frame_Display._btn_Represent):GetTextSizeX() + 5
  local snowPoolOnlyInSafeZone_TextSize = (frame_Display._btn_SnowPoolOnlyInSafeZone):GetTextSizeX() + 5
  local SSAO_TextSize = (frame_Display._btn_SSAO):GetTextSizeX() + 5
  local Tessellation_TextSize = (frame_Display._btn_Tessellation):GetTextSizeX() + 5
  local PostFilter_TextSize = (frame_Display._btn_PostFilter):GetTextSizeX() + 5
  local characterEffect_TextSize = (frame_Display._btn_CharacterEffect):GetTextSizeX() + 5
  local SelfPlayerOnlyEffect_TextSize = (frame_Display._btn_SelfPlayerOnlyEffect):GetTextSizeX() + 5
  local NearestPlayerOnlyEffect_TextSize = (frame_Display._btn_NearestPlayerOnlyEffect):GetTextSizeX() + 5
  local SelfPlayerOnlyLantern_TextSize = (frame_Display._btn_SelfPlayerOnlyLantern):GetTextSizeX() + 5
  local LowPower_TextSize = (frame_Display._btn_LowPower):GetTextSizeX() + 5
  local UpscaleEnable_TextSize = (frame_Display._btn_UpscaleEnable):GetTextSizeX() + 5
  local CropModeEnable_TextSize = (frame_Display._btn_CropModeEnable):GetTextSizeX() + 5
  local AutoOptimization_TextSize = (frame_Display._btn_AutoOptimization):GetTextSizeX() + 5
  local IsOnScreenSaver_TextSize = (frame_Game._btn_IsOnScreenSaver):GetTextSizeX() + 5
  local WorkerVisible_TextSize = (frame_Display._btn_WorkerVisible):GetTextSizeX() + 5
  local dof = frame_Display._btn_DOF
  local antiAlli = frame_Display._btn_AntiAlli
  local ultra = frame_Display._btn_Ultra
  local lensBlood = frame_Display._btn_LensBlood
  local bloodEffect = frame_Display._btn_BloodEffect
  local represent = frame_Display._btn_Represent
  local snowPoolOnlyInSafeZone = frame_Display._btn_SnowPoolOnlyInSafeZone
  local SSAO = frame_Display._btn_SSAO
  local Tessellation = frame_Display._btn_Tessellation
  local PostFilter = frame_Display._btn_PostFilter
  local characterEffect = frame_Display._btn_CharacterEffect
  local SelfPlayerOnlyEffect = frame_Display._btn_SelfPlayerOnlyEffect
  local NearestPlayerOnlyEffect = frame_Display._btn_NearestPlayerOnlyEffect
  local SelfPlayerOnlyLantern = frame_Display._btn_SelfPlayerOnlyLantern
  local LowPower = frame_Display._btn_LowPower
  local UpscaleEnable = frame_Display._btn_UpscaleEnable
  local WorkerVisible = frame_Display._btn_WorkerVisible
  local CropModeEnable = frame_Display._btn_CropModeEnable
  local AutoOptimization = frame_Display._btn_AutoOptimization
  local IsOnscreenSaver = frame_Game._btn_IsOnScreenSaver
  fullMode:SetEnableArea(0, 0, fullMode:GetSizeX() + fullMode_TextSize, fullMode:GetSizeY())
  windowFullMode:SetEnableArea(0, 0, windowFullMode:GetSizeX() + windowFullMode_TextSize, windowFullMode:GetSizeY())
  windowMode:SetEnableArea(0, 0, windowMode:GetSizeX() + windowMode_TextSize, windowMode:GetSizeY())
  dof:SetEnableArea(0, 0, dof:GetSizeX() + dof_TextSize, dof:GetSizeY())
  antiAlli:SetEnableArea(0, 0, antiAlli:GetSizeX() + antiAlli_TextSize, antiAlli:GetSizeY())
  ultra:SetEnableArea(0, 0, ultra:GetSizeX() + ultra_TextSize, ultra:GetSizeY())
  lensBlood:SetEnableArea(0, 0, lensBlood:GetSizeX() + lensBlood_TextSize, lensBlood:GetSizeY())
  bloodEffect:SetEnableArea(0, 0, bloodEffect:GetSizeX() + bloodEffect_TextSize, bloodEffect:GetSizeY())
  represent:SetEnableArea(0, 0, represent:GetSizeX() + represent_TextSize, represent:GetSizeY())
  snowPoolOnlyInSafeZone:SetEnableArea(0, 0, snowPoolOnlyInSafeZone:GetSizeX() + snowPoolOnlyInSafeZone_TextSize, snowPoolOnlyInSafeZone:GetSizeY())
  SSAO:SetEnableArea(0, 0, SSAO:GetSizeX() + SSAO_TextSize, SSAO:GetSizeY())
  Tessellation:SetEnableArea(0, 0, Tessellation:GetSizeX() + Tessellation_TextSize, Tessellation:GetSizeY())
  PostFilter:SetEnableArea(0, 0, PostFilter:GetSizeX() + PostFilter_TextSize, PostFilter:GetSizeY())
  characterEffect:SetEnableArea(0, 0, characterEffect:GetSizeX() + characterEffect_TextSize, characterEffect:GetSizeY())
  SelfPlayerOnlyEffect:SetEnableArea(0, 0, SelfPlayerOnlyEffect:GetSizeX() + SelfPlayerOnlyEffect_TextSize, SelfPlayerOnlyEffect:GetSizeY())
  SelfPlayerOnlyLantern:SetEnableArea(0, 0, SelfPlayerOnlyLantern:GetSizeX() + SelfPlayerOnlyLantern_TextSize, SelfPlayerOnlyLantern:GetSizeY())
  UpscaleEnable:SetEnableArea(0, 0, UpscaleEnable:GetSizeX() + UpscaleEnable_TextSize, UpscaleEnable:GetSizeY())
  CropModeEnable:SetEnableArea(0, 0, CropModeEnable:GetSizeX() + CropModeEnable_TextSize, CropModeEnable:GetSizeY())
  AutoOptimization:SetEnableArea(0, 0, AutoOptimization:GetSizeX() + AutoOptimization_TextSize, AutoOptimization:GetSizeY())
  IsOnscreenSaver:SetEnableArea(0, 0, IsOnscreenSaver:GetSizeX() + IsOnScreenSaver_TextSize, IsOnscreenSaver:GetSizeY())
  WorkerVisible:SetEnableArea(0, 0, WorkerVisible:GetSizeX() + WorkerVisible_TextSize, WorkerVisible:GetSizeY())
  local ss_FormatBMP_TextSize = ((frame_Display._btn_ScreenShotFormat)[0]):GetTextSizeX() + 5
  local ss_FormatJPG_TextSize = ((frame_Display._btn_ScreenShotFormat)[1]):GetTextSizeX() + 5
  local ss_FormatPNG_TextSize = ((frame_Display._btn_ScreenShotFormat)[2]):GetTextSizeX() + 5
  local ss_FormatBMP = (frame_Display._btn_ScreenShotFormat)[0]
  local ss_FormatJPG = (frame_Display._btn_ScreenShotFormat)[1]
  local ss_FormatPNG = (frame_Display._btn_ScreenShotFormat)[2]
  ss_FormatBMP:SetEnableArea(0, 0, ss_FormatBMP:GetSizeX() + ss_FormatBMP_TextSize, ss_FormatBMP:GetSizeY())
  ss_FormatJPG:SetEnableArea(0, 0, ss_FormatJPG:GetSizeX() + ss_FormatJPG_TextSize, ss_FormatJPG:GetSizeY())
  ss_FormatPNG:SetEnableArea(0, 0, ss_FormatPNG:GetSizeX() + ss_FormatPNG_TextSize, ss_FormatPNG:GetSizeY())
  if (frame_Game._btn_SpiritGuide):IsCheck() ~= _currentSpiritGuideCheck then
    (frame_Game._btn_SpiritGuide):SetCheck(_currentSpiritGuideCheck)
  end
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_Window_Option:SetPosX((screenSizeX - Panel_Window_Option:GetSizeX()) / 2)
  Panel_Window_Option:SetPosY((screenSizeY - Panel_Window_Option:GetSizeY()) / 2)
  local btnDisplaySizeX = (gamePanel_Main._btn_Display):GetSizeX() + 23
  local btnDisplayTextPosX = btnDisplaySizeX - btnDisplaySizeX / 2 - (gamePanel_Main._btn_Display):GetTextSizeX() / 2
  local btnSoundSizeX = (gamePanel_Main._btn_Sound):GetSizeX() + 23
  local btnSoundTextPosX = btnSoundSizeX - btnSoundSizeX / 2 - (gamePanel_Main._btn_Sound):GetTextSizeX() / 2
  local btnGameSizeX = (gamePanel_Main._btn_Game):GetSizeX() + 23
  local btnGameTextPosX = btnGameSizeX - btnGameSizeX / 2 - (gamePanel_Main._btn_Game):GetTextSizeX() / 2
  local btnKeySizeX = (gamePanel_Main._btn_KeyConfig):GetSizeX() + 23
  local btnKeyTextPosX = btnKeySizeX - btnKeySizeX / 2 - (gamePanel_Main._btn_KeyConfig):GetTextSizeX() / 2
  local btnKeyUiSizeX = (gamePanel_Main._btn_KeyConfig_UI):GetSizeX() + 23
  local btnKeyUiTextPosX = btnKeyUiSizeX - btnKeyUiSizeX / 2 - (gamePanel_Main._btn_KeyConfig_UI):GetTextSizeX() / 2
  local btnLanguageSizeX = (gamePanel_Main._btn_Language):GetSizeX() + 23
  local btnLanguageTextPosX = btnLanguageSizeX - btnLanguageSizeX / 2 - (gamePanel_Main._btn_Language):GetTextSizeX() / 2
  ;
  (gamePanel_Main._btn_Display):SetTextSpan(btnDisplayTextPosX, 5)
  ;
  (gamePanel_Main._btn_Sound):SetTextSpan(btnSoundTextPosX, 5)
  ;
  (gamePanel_Main._btn_Game):SetTextSpan(btnGameTextPosX, 5)
  ;
  (gamePanel_Main._btn_KeyConfig):SetTextSpan(btnKeyTextPosX, 5)
  ;
  (gamePanel_Main._btn_KeyConfig_UI):SetTextSpan(btnKeyUiTextPosX, 5)
  ;
  (gamePanel_Main._btn_Language):SetTextSpan(btnLanguageTextPosX, 5)
  ;
  (frame_Game._btn_ShowTag):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_ShowTag):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_BTN_CHARACTERNAME"))
  ;
  (frame_Game._btn_AutoAim):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_AutoAim):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_BTN_TARGETHELP"))
  ;
  (frame_Game._btn_RejectInvitation):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_RejectInvitation):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_BTN_REJECT"))
  ;
  (frame_Game._btn_HideWindow):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_HideWindow):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_HIDE_HIT"))
  ;
  (frame_Game._btn_EnableSimpleUI):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_EnableSimpleUI):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_BTN_SIMPLE_UI"))
  ;
  (frame_Game._btn_SpiritGuide):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_SpiritGuide):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_SPRITGUIDE"))
  ;
  (frame_Game._btn_MouseMove):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_MouseMove):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_BTN_MOUSEMOVE"))
  ;
  (frame_Game._btn_MiniMapRotation):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_MiniMapRotation):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_MINIMAPROTATION"))
  ;
  (frame_Game._btn_ShowAttackEffect):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_ShowAttackEffect):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_SHOWATTACKEFFECT"))
  ;
  (frame_Game._btn_Alert_BlackSpirit):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_BlackSpirit):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_BLACKSPIRITALERT"))
  ;
  (frame_Game._btn_UseNewQuickSlot):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_UseNewQuickSlot):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_QUICKSLOT"))
  ;
  (frame_Game._btn_UseChattingFilter):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_UseChattingFilter):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_CHATFILTERING"))
  ;
  (frame_Game._btn_IsOnScreenSaver):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_IsOnScreenSaver):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_SCREENSAVER"))
  ;
  (frame_Game._btn_EnableOVR):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_EnableOVR):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_BTN_RENDER_OVR"))
  ;
  (frame_Game._btn_MouseX):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_MouseX):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_BTN_MOUSEINVERTX"))
  ;
  (frame_Game._btn_MouseY):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_MouseY):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_BTN_MOUSEINVERTY"))
  ;
  (frame_Game._btn_SelfNameShowAllways):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_SelfNameShowAllways):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_SELFPLAYER"))
  ;
  (frame_Game._btn_SelfNameShowNoShow):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_SelfNameShowNoShow):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_MYCHARACTERNICKNAME"))
  ;
  (frame_Game._btn_SelfNameShowImportant):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_SelfNameShowImportant):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_ATTACKNAMESHOW"))
  ;
  (frame_Game._btn_PetAll):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_PetAll):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_PETVISUAL_ALL"))
  ;
  (frame_Game._btn_PetMine):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_PetMine):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_PETVISUAL_MINE"))
  ;
  (frame_Game._btn_PetHide):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_PetHide):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_PETVISUAL_HIDE"))
  ;
  (frame_Game._btn_FontResizeDefault):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_FontResizeDefault):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FONTRESIZE_TOOLTIP_NAME_DEFAULT"))
  ;
  (frame_Game._btn_FontResizeBig):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_FontResizeBig):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FONTRESIZE_TOOLTIP_NAME_BIG"))
  ;
  (frame_Game._btn_FontResizeMoreBig):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_FontResizeMoreBig):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FONTRESIZE_TOOLTIP_NAME_MOREBIG"))
  ;
  (frame_Game._btn_NavGuideNone):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_NavGuideNone):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_NAVPATH_NONE"))
  ;
  (frame_Game._btn_NavGuideArrow):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_NavGuideArrow):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_NAVPATH_ARROW"))
  ;
  (frame_Game._btn_NavGuideEffect):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_NavGuideEffect):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_NAVPATH_EFFECT"))
  ;
  (frame_Game._btn_NavGuideFairy):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_NavGuideFairy):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_NAVPATH_FAIRY"))
  ;
  (frame_Game._btn_OtherNameShow):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_OtherNameShow):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_ANOTHERCHARACTERNICKNAME"))
  ;
  (frame_Game._btn_PartyNameShow):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_PartyNameShow):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_PARTYNICKNAME"))
  ;
  (frame_Game._btn_GuildNameShow):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuildNameShow):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_GUILDCHARNICKNAME"))
  ;
  (frame_Game._btn_GuideLineHumanRelation):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuideLineHumanRelation):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_OPTION_CHARACTEROUTLINE_HUMANRELATION"))
  ;
  (frame_Game._btn_GuideLineQuestObject):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuideLineQuestObject):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_QUEST"))
  ;
  (frame_Game._btn_GuideLineZoneChange):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuideLineZoneChange):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_OPTION_CHARACTEROUTLINE_ZONECHANGE"))
  ;
  (frame_Game._btn_GuideLineWarAlly):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuideLineWarAlly):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_OPTION_CHARACTEROUTLINE_WARALLY"))
  ;
  (frame_Game._btn_GuideLineGuild):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuideLineGuild):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_OPTION_CHARACTEROUTLINE_GUILD"))
  ;
  (frame_Game._btn_GuideLineParty):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuideLineParty):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_OPTION_CHARACTEROUTLINE_PARTY"))
  ;
  (frame_Game._btn_GuideLineEnemy):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuideLineEnemy):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_OPTION_CHARACTEROUTLINE_ENEMY"))
  ;
  (frame_Game._btn_GuideLineNonWarPlayer):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuideLineNonWarPlayer):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_OPTION_CHARACTEROUTLINE_NONWARPLAYER"))
  ;
  (frame_Game._btn_GuideLinePartyEffect):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuideLinePartyEffect):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_PARTYMEMBEREFFECT_TOOLTIP_NAME"))
  ;
  (frame_Game._btn_Alert_Region):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_Region):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_REGION_INOUT"))
  ;
  (frame_Game._btn_Alert_TerritoryTrade):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_TerritoryTrade):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_NORMALTRADE"))
  ;
  (frame_Game._btn_Alert_RoyalTrade):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_RoyalTrade):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_GOLDENTRADE"))
  ;
  (frame_Game._btn_Alert_Fitness):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_Fitness):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_FITNESS"))
  ;
  (frame_Game._btn_Alert_TerritoryWar):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_TerritoryWar):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_SIEGE"))
  ;
  (frame_Game._btn_Alert_GuildWar):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_GuildWar):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_GUILDWAR"))
  ;
  (frame_Game._btn_Alert_PlayerGotItem):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_PlayerGotItem):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_ANOTHERGOTITEM"))
  ;
  (frame_Game._btn_Alert_ItemMarket):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_ItemMarket):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_DEALMARKET"))
  ;
  (frame_Game._btn_Alert_LifeLevUp):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_LifeLevUp):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_ANOTHERLIFELEVEL"))
  ;
  (frame_Game._btn_Alert_GuildQuest):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_GuildQuest):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_ANOTHERGUILDQUEST"))
  ;
  (frame_Game._btn_Alert_NearMonster):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_NearMonster):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_NEARMONSTER"))
  ;
  (frame_Game._btn_Alert_ServantMarket):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_Alert_ServantMarket):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_CHK_SERVANTMARKET"))
  ;
  (frame_Game._btn_GuildLogin):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_GuildLogin):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_GUILDLOGIN"))
  ;
  (frame_Game._btn_UIModeMouseLock):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_UIModeMouseLock):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_UIMODEMOUSELOCK"))
  ;
  (frame_Game._btn_PvpRefuse):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_PvpRefuse):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_PVPREFUSE"))
  ;
  (frame_Game._btn_ExchangeRefuse):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_ExchangeRefuse):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TOOLTIP_NAME_REJECTEXCHANGE"))
  ;
  (frame_Game._btn_HideMast):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_HideMast):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_HIDEMAST"))
  ;
  (frame_Game._btn_ShowCashAlert):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_ShowCashAlert):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_GAME_CASHALERT"))
  ;
  (frame_Game._btn_WorldMapOpenByWestMaintain):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_WorldMapOpenByWestMaintain):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_WORLDMAPOPENBYMAINTAIN"))
  ;
  (frame_Game._btn_WorldMapOpenByCharacterToWest):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_WorldMapOpenByCharacterToWest):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_WORLDMAPOPENBYCHARACTERTOWEST"))
  ;
  (frame_Game._btn_WorldMapOpenByCharacterMaintain):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_WorldMapOpenByCharacterMaintain):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_WORLDMAPOPENBYCHARACTERMAINTAIN"))
  ;
  (frame_Game._btn_WorldMapOpenByNone):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_WorldMapOpenByNone):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_WORLDMAPOPENBYNONE"))
  ;
  (frame_Game._btn_WorldMapCameraAngle):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_WorldMapCameraAngle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_WORLDMAPOPENCAMERADEGREE"))
  ;
  (frame_Game._btn_WorldMapCameraDefaultAngle):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_WorldMapCameraDefaultAngle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_WORLDMAPOPENCAMERADEFAULT"))
  ;
  (frame_Game._btn_WorldMapCameraDegree30):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_WorldMapCameraDegree30):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_WORLDMAPOPENCAMERADEGREE30"))
  ;
  (frame_Game._btn_WorldMapCameraDegree90):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Game._btn_WorldMapCameraDegree90):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_WORLDMAPOPENCAMERADEGREE90"))
  ;
  (frame_Display._btn_DOF):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_DOF):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_DOFTOGGLE"))
  ;
  (frame_Display._btn_AntiAlli):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_AntiAlli):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_ANTI"))
  ;
  (frame_Display._btn_Ultra):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_Ultra):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_ULTRA"))
  ;
  (frame_Display._btn_LensBlood):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_LensBlood):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_BLOODONSCREEN"))
  ;
  (frame_Display._btn_BloodEffect):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_BloodEffect):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_BLOOD"))
  ;
  (frame_Display._btn_Represent):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_Represent):SetText(PAGetString(Defines.StringSheet_GAME, "OPTION_TXT_REPRESENTATIVE"))
  ;
  (frame_Display._btn_SnowPoolOnlyInSafeZone):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_SnowPoolOnlyInSafeZone):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_SNOWPOOLONLYINSAFEZONE"))
  ;
  (frame_Display._btn_SSAO):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_SSAO):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_SSAO"))
  ;
  (frame_Display._btn_Tessellation):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_Tessellation):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_TESSELLATION"))
  ;
  (frame_Display._btn_PostFilter):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_PostFilter):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_FILTER"))
  ;
  (frame_Display._btn_CharacterEffect):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_CharacterEffect):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_CHARACTEREFFECT"))
  ;
  (frame_Display._btn_NearestPlayerOnlyEffect):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_NearestPlayerOnlyEffect):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_SELFONLY_EFFECT"))
  ;
  (frame_Display._btn_SelfPlayerOnlyEffect):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_SelfPlayerOnlyEffect):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_NEARESTPLAYERONLYEFFECT"))
  ;
  (frame_Display._btn_SelfPlayerOnlyLantern):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_SelfPlayerOnlyLantern):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_SELFONLY_LANTERN"))
  ;
  (frame_Display._btn_LowPower):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_LowPower):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_LOWPOWER"))
  ;
  (frame_Display._btn_UpscaleEnable):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_UpscaleEnable):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_UPSCALE"))
  ;
  (frame_Display._btn_CropModeEnable):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_CropModeEnable):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_CROPMODE"))
  ;
  (frame_Display._btn_WorkerVisible):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._btn_WorkerVisible):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_WORKERVISIBLE"))
  ;
  ((frame_Display._btn_ScreenShotSize)[1]):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  ((frame_Display._btn_ScreenShotSize)[1]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_DISPLAY_SCREENSHOTSIZE_4K_NAME"))
  ;
  ((frame_Display._btn_ScreenShotSize)[2]):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  ((frame_Display._btn_ScreenShotSize)[2]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_DISPLAY_SCREENSHOTSIZE_8K_NAME"))
  ;
  ((frame_Display._btn_ScreenShotSize)[0]):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  ((frame_Display._btn_ScreenShotSize)[0]):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_DISPLAY_SCREENSHOTSIZE_DEFAULT_NAME"))
  ;
  (frame_Sound._btn_MusicOnOff):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_MusicOnOff):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_BGMTOGGLE"))
  ;
  (frame_Sound._btn_FXOnOff):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_FXOnOff):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_EFFECTSOUNDTOGGLE"))
  ;
  (frame_Sound._btn_EnvFXOnOff):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_EnvFXOnOff):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TXT_ENVSOUNDTOGGLE"))
  ;
  (frame_Sound._btn_RiddingOnOff):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_RiddingOnOff):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_SERVANT"))
  ;
  (frame_Sound._btn_WhisperOnOff):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_WhisperOnOff):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_WHISPER"))
  ;
  (frame_Sound._btn_CombatAllwaysOff):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_CombatAllwaysOff):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_COMBATTURNOFF"))
  ;
  (frame_Sound._btn_CombatAllwaysOn):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_CombatAllwaysOn):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_COMBATALLWAYS"))
  ;
  (frame_Sound._btn_CombatAllwaysLowOff):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_CombatAllwaysLowOff):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_COMBATNORMAL"))
  ;
  (frame_Sound._btn_NpcVoice1):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_NpcVoice2):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_NpcVoice3):SetTextMode(UI_TM.eTextMode_LimitText)
  if isGameServiceTypeDev() or isGameTypeTaiwan() or isGameTypeKorea() or isGameTypeJapan() then
    (frame_Game._title_FontResize):SetShow(true)
    ;
    (frame_Game._btn_FontResizeDefault):SetShow(true)
    ;
    (frame_Game._btn_FontResizeBig):SetShow(true)
    ;
    (frame_Game._btn_FontResizeMoreBig):SetShow(true)
  else
    ;
    (frame_Game._title_FontResize):SetShow(false)
    ;
    (frame_Game._btn_FontResizeDefault):SetShow(false)
    ;
    (frame_Game._btn_FontResizeBig):SetShow(false)
    ;
    (frame_Game._btn_FontResizeMoreBig):SetShow(false)
  end
  if isGameTypeKR2() then
    (frame_Game._txt_PadXSen):SetShow(false)
    ;
    (frame_Game._slide_PadXSen):SetShow(false)
    ;
    (frame_Game._txt_PadYSen):SetShow(false)
    ;
    (frame_Game._slide_PadYSen):SetShow(false)
    ;
    (frame_Game._btn_UsePad):SetShow(false)
    ;
    (frame_Game._btn_UseVibe):SetShow(false)
    ;
    (frame_Game._btn_PadX):SetShow(false)
    ;
    (frame_Game._btn_PadY):SetShow(false)
    ;
    (frame_Game._txt_X_0):SetShow(false)
    ;
    (frame_Game._txt_X_50):SetShow(false)
    ;
    (frame_Game._txt_X_100):SetShow(false)
    ;
    (frame_Game._txt_Y_0):SetShow(false)
    ;
    (frame_Game._txt_Y_50):SetShow(false)
    ;
    (frame_Game._txt_Y_100):SetShow(false)
    ;
    (frame_Game._txt_Pad_Title):SetShow(false)
  end
  if true == isDev or true == isUsePcExchangeInLocalizingValue() then
    (frame_Game._btn_ExchangeRefuse):SetShow(true)
  else
    ;
    (frame_Game._btn_ExchangeRefuse):SetShow(false)
  end
  if isGameTypeRussia() or isGameTypeEnglish() or isGameTypeSA() or isGameTypeKR2() then
    (frame_Sound._txt_NpcVoiceTitle):SetShow(false)
    ;
    (frame_Sound._btn_NpcVoice1):SetShow(false)
    ;
    (frame_Sound._btn_NpcVoice2):SetShow(false)
    ;
    (frame_Sound._btn_NpcVoice3):SetShow(false)
  else
    ;
    (frame_Sound._txt_NpcVoiceTitle):SetShow(true)
    ;
    (frame_Sound._btn_NpcVoice1):SetShow(true)
    ;
    (frame_Sound._btn_NpcVoice2):SetShow(true)
    ;
    (frame_Sound._btn_NpcVoice3):SetShow(true)
  end
  if isGameTypeKorea() then
    (frame_Sound._btn_NpcVoice1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN"))
    ;
    (frame_Sound._btn_NpcVoice2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE"))
    ;
    (frame_Sound._btn_NpcVoice3):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
  else
    if isGameTypeJapan() then
      (frame_Sound._btn_NpcVoice1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE"))
      ;
      (frame_Sound._btn_NpcVoice2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN"))
      ;
      (frame_Sound._btn_NpcVoice3):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
    else
    end
  end
  if not isGameTypeRussia() or isGameTypeEnglish() then
    (frame_Sound._btn_NpcVoice1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
    ;
    (frame_Sound._btn_NpcVoice2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE"))
    ;
    (frame_Sound._btn_NpcVoice3):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN"))
  else
    if isGameTypeTaiwan() then
      (frame_Sound._btn_NpcVoice1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH"))
      ;
      (frame_Sound._btn_NpcVoice2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE"))
      ;
      (frame_Sound._btn_NpcVoice3):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN"))
    else
      _PA_LOG("LUA", "�\173 국가 리소스가 추가되면 �\180 곳도 수정 판단 해주어야합니�\164.")
    end
  end
  ;
  (frame_Sound._btn_TraySoundOnOff):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Sound._btn_TraySoundOnOff):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GAMEOPTION_SOUND_BTN_TRAYSOUND"))
  if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_NA) or (CppEnums.GameServiceType).eGameServiceType_DEV == getGameServiceType() then
    (frame_Game._btn_UseChattingFilter):SetShow(true)
  else
    ;
    (frame_Game._btn_UseChattingFilter):SetShow(false)
  end
  ;
  (frame_Display._btn_Represent):SetIgnore(true)
  ;
  (frame_Display._btn_Represent):SetMonoTone(true)
  if GetGraphicDeviceMemory() then
    (frame_Display._btn_Represent):SetIgnore(false)
    ;
    (frame_Display._btn_Represent):SetMonoTone(false)
  else
    setRepresentative(false)
  end
  if isGameServiceTypeDev() then
    (frame_Display._txt_OptimizationKing):SetShow(true)
  else
    ;
    (frame_Display._txt_OptimizationKing):SetShow(false)
  end
  ;
  (frame_Display._optimizationDesc):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Display._optimizationDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_OPTIMIZETIP"))
  if (frame_Display._optimizationDesc):IsLimitText() then
    (frame_Display._optimizationDesc):addInputEvent("Mouse_On", "GameOption_SimpleTipOnce( true )")
    ;
    (frame_Display._optimizationDesc):addInputEvent("Mouse_Out", "GameOption_SimpleTipOnce( false )")
  else
    ;
    (frame_Display._optimizationDesc):addInputEvent("Mouse_On", "")
    ;
    (frame_Display._optimizationDesc):addInputEvent("Mouse_Out", "")
  end
end

local isOnServiceResourceTypeList = {[(CppEnums.ServiceResourceType).eServiceResourceType_Dev] = false, [(CppEnums.ServiceResourceType).eServiceResourceType_KR] = false, [(CppEnums.ServiceResourceType).eServiceResourceType_EN] = true, [(CppEnums.ServiceResourceType).eServiceResourceType_JP] = false, [(CppEnums.ServiceResourceType).eServiceResourceType_CN] = false, [(CppEnums.ServiceResourceType).eServiceResourceType_RU] = false, [(CppEnums.ServiceResourceType).eServiceResourceType_FR] = true, [(CppEnums.ServiceResourceType).eServiceResourceType_DE] = true, [(CppEnums.ServiceResourceType).eServiceResourceType_ES] = false, [(CppEnums.ServiceResourceType).eServiceResourceType_TW] = false}
local isOnServiceResourceTypeTag = {[(CppEnums.ServiceResourceType).eServiceResourceType_Dev] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_DEV"), [(CppEnums.ServiceResourceType).eServiceResourceType_KR] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_KR"), [(CppEnums.ServiceResourceType).eServiceResourceType_EN] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_EN"), [(CppEnums.ServiceResourceType).eServiceResourceType_JP] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_JP"), [(CppEnums.ServiceResourceType).eServiceResourceType_CN] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_CN"), [(CppEnums.ServiceResourceType).eServiceResourceType_RU] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_RU"), [(CppEnums.ServiceResourceType).eServiceResourceType_FR] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_FR"), [(CppEnums.ServiceResourceType).eServiceResourceType_DE] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_DE"), [(CppEnums.ServiceResourceType).eServiceResourceType_ES] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_ES"), [(CppEnums.ServiceResourceType).eServiceResourceType_TW] = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_TEXT_TW")}
local _btn_ServiceResourceType = {}
local serviceResEnumsNumber = {}
local serviceResCount = 0
local _txt_LanguageOption, _txt_ChatChannelOption = nil, nil
local _ServiceResComputePosY = 0
local createServiceResOption = function(frame, frameContent)
  -- function num : 0_13 , upvalues : isOnServiceResourceTypeList, _btn_ServiceResourceType, isOnServiceResourceTypeTag, serviceResEnumsNumber, serviceResCount, UI_TM, _ServiceResComputePosY, _txt_LanguageOption, _frameContent_Game
  local serviceResourceTypeControl = (UI.getChildControl)(frameContent, "RadioButton_ServiceResourceType")
  local _frameContent = (UI.getChildControl)(frame, "Frame_1_Content")
  local _txt_LanguageDesc = (UI.getChildControl)(_frameContent, "Static_LanguageCommentBG")
  local _txt_ChattingLanguageDesc = (UI.getChildControl)(_frameContent, "Static_ChattingLanguageCommentBG")
  local posYCount = 0
  local btn_index = 0
  local Size = (CppEnums.ServiceResourceType).eServiceResourceTypeCount
  for index = 0, Size do
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R13 in 'UnsetPending'

    if isOnServiceResourceTypeList[index] then
      _btn_ServiceResourceType[btn_index] = (UI.createAndCopyBasePropertyControl)(_frameContent, "RadioButton_ServiceResourceType", _frameContent, "RadioButton_ServiceResourceType_" .. btn_index)
      ;
      (_btn_ServiceResourceType[btn_index]):SetPosY(serviceResourceTypeControl:GetPosY() + posYCount * 25)
      ;
      (_btn_ServiceResourceType[btn_index]):SetText(tostring(isOnServiceResourceTypeTag[index]))
      ;
      (_btn_ServiceResourceType[btn_index]):addInputEvent("Mouse_LUp", "GameOption_ServiceResourceTypeFunc()")
      -- DECOMPILER ERROR at PC67: Confused about usage of register: R13 in 'UnsetPending'

      serviceResEnumsNumber[btn_index] = index
      posYCount = posYCount + 1
      btn_index = btn_index + 1
      serviceResCount = serviceResCount + 1
    end
  end
  _txt_LanguageDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _txt_LanguageDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GMAEOPTION_LANGUAGESETTING_DESC"))
  _txt_LanguageDesc:SetSize(545, _txt_LanguageDesc:GetTextSizeY() + 10)
  _txt_LanguageDesc:SetPosY(serviceResourceTypeControl:GetPosY() + (posYCount) * 25)
  _ServiceResComputePosY = (posYCount) * 25 + _txt_LanguageDesc:GetSizeY()
  _txt_LanguageOption = (UI.getChildControl)(_frameContent_Game, "StaticText_Language")
end

local _btn_ChatLanguageType = {}
local ChatChannelEnumsNumber = {}
local createChatChannelOption = function(frame, frameContent)
  -- function num : 0_14 , upvalues : _btn_ChatLanguageType, _ServiceResComputePosY, ChatChannelEnumsNumber, isOnServiceResourceTypeList, isOnServiceResourceTypeTag, UI_TM, _txt_ChatChannelOption
  local serviceResourceTypeControl = (UI.getChildControl)(frameContent, "RadioButton_ChannelChat_Language")
  local _frameContent = (UI.getChildControl)(frame, "Frame_1_Content")
  local _txt_LanguageDesc = (UI.getChildControl)(_frameContent, "Static_LanguageCommentBG")
  local _txt_ChattingLanguageDesc = (UI.getChildControl)(_frameContent, "Static_ChattingLanguageCommentBG")
  local posYCount = 0
  local btn_index = 0
  local Size = (CppEnums.ServiceResourceType).eServiceResourceTypeCount
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R9 in 'UnsetPending'

  _btn_ChatLanguageType[0] = (UI.createAndCopyBasePropertyControl)(_frameContent, "RadioButton_ChannelChat_Language", _frameContent, "RadioButton_ChannelChat_Language_" .. btn_index)
  ;
  (_btn_ChatLanguageType[0]):SetPosY(serviceResourceTypeControl:GetPosY() + (_ServiceResComputePosY - 25) + posYCount * 25)
  ;
  (_btn_ChatLanguageType[0]):SetText(tostring("International"))
  ;
  (_btn_ChatLanguageType[0]):addInputEvent("Mouse_LUp", "ChatChannelOption()")
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R9 in 'UnsetPending'

  ChatChannelEnumsNumber[btn_index] = 1
  posYCount = posYCount + 1
  btn_index = btn_index + 1
  for index = 1, Size do
    -- DECOMPILER ERROR at PC82: Confused about usage of register: R13 in 'UnsetPending'

    if isOnServiceResourceTypeList[index] then
      _btn_ChatLanguageType[btn_index] = (UI.createAndCopyBasePropertyControl)(_frameContent, "RadioButton_ChannelChat_Language", _frameContent, "RadioButton_ChannelChat_Language_" .. btn_index)
      ;
      (_btn_ChatLanguageType[btn_index]):SetPosY(serviceResourceTypeControl:GetPosY() + (_ServiceResComputePosY - 25) + (posYCount) * 25)
      ;
      (_btn_ChatLanguageType[btn_index]):SetText(tostring(isOnServiceResourceTypeTag[index]))
      ;
      (_btn_ChatLanguageType[btn_index]):addInputEvent("Mouse_LUp", "ChatChannelOption()")
      -- DECOMPILER ERROR at PC109: Confused about usage of register: R13 in 'UnsetPending'

      ChatChannelEnumsNumber[btn_index] = index
      posYCount = posYCount + 1
      btn_index = btn_index + 1
    end
  end
  _txt_ChattingLanguageDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _txt_ChattingLanguageDesc:SetPosY(serviceResourceTypeControl:GetPosY() + (_ServiceResComputePosY - 25) + (posYCount) * 25)
  _txt_ChattingLanguageDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GMAEOPTION_CHATTINGSETTING_DESC"))
  _txt_ChattingLanguageDesc:SetSize(545, _txt_ChattingLanguageDesc:GetTextSizeY() + 10)
  _txt_ChatChannelOption = (UI.getChildControl)(_frameContent, "StaticText_ChannelChat_Language")
  _txt_ChatChannelOption:SetSpanSize(0, _txt_LanguageDesc:GetPosY() + _txt_LanguageDesc:GetSizeY() + 10)
end

local eraseChatChannelOption = function(frameContent)
  -- function num : 0_15
  local textChannelChat = (UI.getChildControl)(frameContent, "StaticText_ChannelChat_Language")
  local radioChannelChat = (UI.getChildControl)(frameContent, "RadioButton_ChannelChat_Language")
  local _txt_LanguageDesc = (UI.getChildControl)(frameContent, "Static_LanguageCommentBG")
  local _txt_ChattingLanguageDesc = (UI.getChildControl)(frameContent, "Static_ChattingLanguageCommentBG")
  ;
  (UI.deleteControl)(textChannelChat)
  ;
  (UI.deleteControl)(radioChannelChat)
  ;
  (UI.deleteControl)(_txt_LanguageDesc)
  ;
  (UI.deleteControl)(_txt_ChattingLanguageDesc)
end

local loadLanguageResType = function()
  -- function num : 0_16 , upvalues : _frame_Language, _frameContent_Language, _frame_Game, _frameContent_Game, _txt_LanguageOption, createServiceResOption, createChatChannelOption, eraseChatChannelOption
  local serviceType = (getGameServiceType())
  local _cpy_frame, _cpy_frameContent = nil, nil
  if isNeedGameOptionFromServer() == false then
    _cpy_frame = _frame_Language
    _cpy_frameContent = _frameContent_Language
  else
    _cpy_frame = _frame_Game
    _cpy_frameContent = _frameContent_Game
  end
  _txt_LanguageOption = (UI.getChildControl)(_cpy_frameContent, "StaticText_Language")
  if serviceType == (CppEnums.GameServiceType).eGameServiceType_NA_ALPHA or serviceType == (CppEnums.GameServiceType).eGameServiceType_NA_REAL or serviceType == (CppEnums.GameServiceType).eGameServiceType_DEV then
    createServiceResOption(_cpy_frame, _cpy_frameContent)
    createChatChannelOption(_cpy_frame, _cpy_frameContent)
  else
    local serviceResourceType = (UI.getChildControl)(_cpy_frameContent, "RadioButton_ServiceResourceType")
    local _txt_LanguageDesc = (UI.getChildControl)(_cpy_frameContent, "Static_LanguageCommentBG")
    local _txt_ChattingLanguageDesc = (UI.getChildControl)(_cpy_frameContent, "Static_ChattingLanguageCommentBG")
    if serviceResourceType ~= nil then
      serviceResourceType:SetShow(false)
      ;
      (UI.deleteControl)(serviceResourceType)
    end
    if _txt_LanguageOption ~= nil then
      _txt_LanguageOption:SetShow(false)
      ;
      (UI.deleteControl)(_txt_LanguageOption)
      _txt_LanguageOption = nil
    end
    if _txt_LanguageDesc ~= nil then
      _txt_LanguageDesc:SetShow(false)
      ;
      (UI.deleteControl)(_txt_LanguageDesc)
      _txt_LanguageDesc = nil
    end
    if _txt_ChattingLanguageDesc ~= nil then
      _txt_ChattingLanguageDesc:SetShow(false)
      ;
      (UI.deleteControl)(_txt_ChattingLanguageDesc)
      _txt_ChattingLanguageDesc = nil
    end
    eraseChatChannelOption(_cpy_frameContent)
    _frameContent_Game:SetSize(_frameContent_Game:GetSizeX(), 1)
  end
end

loadLanguageResType()
getFrameSize_SetSlideSize = function()
  -- function num : 0_17 , upvalues : gamePanel_Main, _display_sld, _display_SizeY, _display_sld_btn, _sound_sld, _sound_SizeY, _sound_sld_btn, _frame_Sound, _game_sld, _game_SizeY, _game_sld_btn, _frame_Game, _keyConfig_sld, _keyConfig_SizeY, _keyConfig_sld_btn, _frame_KeyConfig, _keyConfigUI_sld, _keyConfig_UI_SizeY, _keyConfigUI_sld_btn, _frame_KeyConfig_UI, _Language_sld, _Language_SizeY, _frame_Language
  if (gamePanel_Main._btn_Display):IsCheck() then
    _display_sld:SetShow(false)
    if _display_SizeY >= 600 then
      _display_sld:SetShow(true)
      _display_sld_btn:SetShow(true)
    end
  else
    if (gamePanel_Main._btn_Sound):IsCheck() then
      _sound_sld:SetShow(false)
      if _sound_SizeY >= 600 then
        _sound_sld:SetShow(true)
        _sound_sld_btn:SetShow(true)
        local _sound_sld_btnSize = _frame_Sound:GetSizeY() - (_sound_SizeY - _frame_Sound:GetSizeY())
      end
    else
      do
        if (gamePanel_Main._btn_Game):IsCheck() then
          _game_sld:SetShow(false)
          if _game_SizeY >= 600 then
            _game_sld:SetShow(true)
            _game_sld_btn:SetShow(true)
            local _game_sld_btnSize = _frame_Game:GetSizeY() - (_game_SizeY - _frame_Game:GetSizeY())
          end
        else
          do
            if (gamePanel_Main._btn_KeyConfig):IsCheck() then
              _keyConfig_sld:SetShow(false)
              if _keyConfig_SizeY >= 600 then
                _keyConfig_sld:SetShow(true)
                _keyConfig_sld_btn:SetShow(true)
                local _keyConfig_sld_btnSize = _frame_KeyConfig:GetSizeY() - (_keyConfig_SizeY - _frame_KeyConfig:GetSizeY())
              end
            else
              do
                if (gamePanel_Main._btn_KeyConfig_UI):IsCheck() then
                  _keyConfigUI_sld:SetShow(false)
                  if _keyConfig_UI_SizeY >= 600 then
                    _keyConfigUI_sld:SetShow(true)
                    _keyConfigUI_sld_btn:SetShow(true)
                    local _keyConfigUI_sld_btnSize = _frame_KeyConfig_UI:GetSizeY() - (_keyConfig_UI_SizeY - _frame_KeyConfig_UI:GetSizeY())
                  end
                else
                  do
                    if (gamePanel_Main._btn_Language):IsCheck() then
                      _Language_sld:SetShow(false)
                      if _Language_SizeY >= 600 then
                        _Language_sld:SetShow(true)
                        _Language_sld:SetShow(true)
                        local _Language_sld_btnSize = _frame_Language:GetSizeY() - (_Language_SizeY - _frame_Language:GetSizeY())
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

HideAllFrame_Func = function()
  -- function num : 0_18 , upvalues : _frame_Display, _frame_Sound, _frame_Game, _frame_KeyConfig, _frame_KeyConfig_UI, _frame_Language, _static_KeySetBG, _static_PadSetBG, _static_ResetKeyConfig, _static_KeySetTitle, _static_KeySetBG_UI, _static_PadSetBG_UI, _static_ResetKeyConfig_UI, _static_ResetPositionConfig_UI, _static_KeySetTitle_UI
  _frame_Display:SetShow(false)
  _frame_Sound:SetShow(false)
  _frame_Game:SetShow(false)
  _frame_KeyConfig:SetShow(false)
  _frame_KeyConfig_UI:SetShow(false)
  _frame_Language:SetShow(false)
  _static_KeySetBG:SetShow(false)
  _static_PadSetBG:SetShow(false)
  _static_ResetKeyConfig:SetShow(false)
  _static_KeySetTitle:SetShow(false)
  _static_KeySetBG_UI:SetShow(false)
  _static_PadSetBG_UI:SetShow(false)
  _static_ResetKeyConfig_UI:SetShow(false)
  _static_ResetPositionConfig_UI:SetShow(false)
  _static_KeySetTitle_UI:SetShow(false)
end

optionCommentary = function()
  -- function num : 0_19 , upvalues : gamePanel_Main, UI_TM, GetStr_Option, _static_KeySetBG, _static_PadSetBG, _static_ResetKeyConfig, _static_KeySetTitle, _static_KeySetBG_UI, _static_PadSetBG_UI, _static_ResetKeyConfig_UI, _static_ResetPositionConfig_UI, _static_KeySetTitle_UI
  if (gamePanel_Main._btn_Display):IsCheck() then
    (gamePanel_Main._txt_Comment):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (gamePanel_Main._txt_Comment):SetText(GetStr_Option[0])
    ;
    (gamePanel_Main._txt_Comment):SetSize((gamePanel_Main._txt_Comment):GetSizeX(), (gamePanel_Main._txt_Comment):GetSizeY())
  else
    if (gamePanel_Main._btn_Sound):IsCheck() then
      (gamePanel_Main._txt_Comment):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (gamePanel_Main._txt_Comment):SetText(GetStr_Option[1])
      ;
      (gamePanel_Main._txt_Comment):SetSize((gamePanel_Main._txt_Comment):GetSizeX(), (gamePanel_Main._txt_Comment):GetSizeY())
    else
      if (gamePanel_Main._btn_Game):IsCheck() then
        (gamePanel_Main._txt_Comment):SetTextMode(UI_TM.eTextMode_AutoWrap)
        ;
        (gamePanel_Main._txt_Comment):SetText(GetStr_Option[2])
        ;
        (gamePanel_Main._txt_Comment):SetSize((gamePanel_Main._txt_Comment):GetSizeX(), (gamePanel_Main._txt_Comment):GetSizeY())
      else
        if (gamePanel_Main._btn_KeyConfig):IsCheck() then
          _static_KeySetBG:SetShow(true)
          if isGameTypeKR2() then
            _static_PadSetBG:SetShow(false)
          else
            _static_PadSetBG:SetShow(true)
          end
          _static_ResetKeyConfig:SetShow(true)
          _static_KeySetTitle:SetShow(true)
          ;
          (gamePanel_Main._txt_Comment):SetTextMode(UI_TM.eTextMode_AutoWrap)
          ;
          (gamePanel_Main._txt_Comment):SetText(GetStr_Option[3])
          ;
          (gamePanel_Main._txt_Comment):SetSize((gamePanel_Main._txt_Comment):GetSizeX(), (gamePanel_Main._txt_Comment):GetSizeY())
        else
          if (gamePanel_Main._btn_KeyConfig_UI):IsCheck() then
            _static_KeySetBG_UI:SetShow(true)
            if isGameTypeKR2() then
              _static_PadSetBG_UI:SetShow(false)
            else
              _static_PadSetBG_UI:SetShow(true)
            end
            _static_ResetKeyConfig_UI:SetShow(true)
            _static_ResetPositionConfig_UI:SetShow(false)
            _static_KeySetTitle_UI:SetShow(true)
            ;
            (gamePanel_Main._txt_Comment):SetTextMode(UI_TM.eTextMode_AutoWrap)
            ;
            (gamePanel_Main._txt_Comment):SetText(GetStr_Option[16])
            ;
            (gamePanel_Main._txt_Comment):SetSize((gamePanel_Main._txt_Comment):GetSizeX(), (gamePanel_Main._txt_Comment):GetSizeY())
          else
            if (gamePanel_Main._btn_Language):IsCheck() then
              (gamePanel_Main._txt_Comment):SetTextMode(UI_TM.eTextMode_AutoWrap)
              ;
              (gamePanel_Main._txt_Comment):SetText(GetStr_Option[26])
              ;
              (gamePanel_Main._txt_Comment):SetSize((gamePanel_Main._txt_Comment):GetSizeX(), (gamePanel_Main._txt_Comment):GetSizeY())
            end
          end
        end
      end
    end
  end
end

gameOption_SetEnableArea_Func = function()
  -- function num : 0_20 , upvalues : _frame_Display, _frame_Sound, _frame_Game
  local updateList = {}
  if _frame_Display:GetShow() == true then
    updateList = {}
  else
    if _frame_Sound:GetShow() == true then
      updateList = {}
    else
      if _frame_Game:GetShow() == true then
        updateList = {}
      end
    end
  end
  for key,value in pairs(updateList) do
    value:SetEnableArea(0, 0, value:GetSizeX() + value:GetTextSizeX() + 5, value:GetSizeY())
  end
end

ShowFrame_Func = function()
  -- function num : 0_21 , upvalues : gamePanel_Main, _frame_Display, isKeyConfig_Open, isKeyConfig_UI_Open, _frame_Sound, _frame_Game, _frame_KeyConfig, configDataIndex, updateKeyConfig, _frame_KeyConfig_UI, configDataIndex_UI, updateKeyConfig_UI, _frame_Language
  audioPostEvent_SystemUi(0, 0)
  getFrameSize_SetSlideSize()
  if (gamePanel_Main._btn_Display):IsCheck() then
    HideAllFrame_Func()
    _frame_Display:SetShow(true)
    isKeyConfig_Open = false
    isKeyConfig_UI_Open = false
    gameOption_SetEnableArea_Func()
    optionCommentary()
  else
    if (gamePanel_Main._btn_Sound):IsCheck() then
      HideAllFrame_Func()
      _frame_Sound:SetShow(true)
      isKeyConfig_Open = false
      isKeyConfig_UI_Open = false
      gameOption_SetEnableArea_Func()
      optionCommentary()
    else
      if (gamePanel_Main._btn_Game):IsCheck() then
        HideAllFrame_Func()
        _frame_Game:SetShow(true)
        isKeyConfig_Open = false
        isKeyConfig_UI_Open = false
        gameOption_SetEnableArea_Func()
        optionCommentary()
      else
        if (gamePanel_Main._btn_KeyConfig):IsCheck() and isKeyConfig_Open == false then
          HideAllFrame_Func()
          _frame_KeyConfig:SetShow(true)
          isKeyConfig_Open = true
          isKeyConfig_UI_Open = false
          Option_Init_KeyConfig()
          KeyCustom_Action_UpdateButtonText_Key()
          KeyCustom_Action_UpdateButtonText_Pad()
          configDataIndex = 0
          updateKeyConfig()
          gameOption_SetEnableArea_Func()
          optionCommentary()
        else
          if (gamePanel_Main._btn_KeyConfig_UI):IsCheck() and isKeyConfig_UI_Open == false then
            HideAllFrame_Func()
            _frame_KeyConfig_UI:SetShow(true)
            isKeyConfig_Open = false
            isKeyConfig_UI_Open = true
            Option_Init_KeyConfig_UI()
            KeyCustom_Ui_UpdateButtonText_Key()
            KeyCustom_Ui_UpdateButtonText_Pad()
            configDataIndex_UI = 0
            updateKeyConfig_UI()
            gameOption_SetEnableArea_Func()
            optionCommentary()
          else
            if (gamePanel_Main._btn_Language):IsCheck() and isKeyConfig_UI_Open == false then
              HideAllFrame_Func()
              _frame_Language:SetShow(true)
              isKeyConfig_Open = false
              isKeyConfig_UI_Open = true
              Option_Init_KeyConfig_UI()
              KeyCustom_Ui_UpdateButtonText_Key()
              KeyCustom_Ui_UpdateButtonText_Pad()
              configDataIndex_UI = 0
              updateKeyConfig_UI()
              gameOption_SetEnableArea_Func()
              optionCommentary()
            end
          end
        end
      end
    end
  end
end

FGlobal_GameOptionOpen = function()
  -- function num : 0_22 , upvalues : gamePanel_Main, _game_sld, _frame_Game
  if not Panel_Window_Option:GetShow() then
    showGameOption()
  end
  ;
  (gamePanel_Main._btn_Display):SetCheck(false)
  ;
  (gamePanel_Main._btn_Sound):SetCheck(false)
  ;
  (gamePanel_Main._btn_Game):SetCheck(true)
  ;
  (gamePanel_Main._btn_KeyConfig):SetCheck(false)
  ;
  (gamePanel_Main._btn_KeyConfig_UI):SetCheck(false)
  ShowFrame_Func()
  _game_sld:SetControlBottom()
  _frame_Game:UpdateContentScroll()
  _frame_Game:UpdateContentPos()
end

Option_ShowAni = function()
  -- function num : 0_23 , upvalues : _frame_Display, UI_ANI_ADV, _display_sld, _sound_sld, _game_sld, _keyConfig_sld, _keyConfigUI_sld, _frame_Game
  (UIAni.fadeInSCR_Down)(Panel_Window_Option)
  _frame_Display:SetShow(true)
  local aniInfo1 = Panel_Window_Option:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.15)
  aniInfo1.AxisX = Panel_Window_Option:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_Option:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_Option:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.15)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_Option:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_Option:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
  _display_sld:SetControlPos(0)
  _sound_sld:SetControlPos(0)
  _game_sld:SetControlPos(0)
  _keyConfig_sld:SetControlPos(0)
  _keyConfigUI_sld:SetControlPos(0)
  _frame_Display:UpdateContentPos()
  _frame_Display:UpdateContentScroll()
  _frame_Game:UpdateContentScroll()
  _frame_Game:UpdateContentPos()
end

Option_HideAni = function()
  -- function num : 0_24
  Panel_Window_Option:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Window_Option, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

Option_Hide = function()
  -- function num : 0_25
  SetUIMode((Defines.UIMode).eUIMode_Default)
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
  Panel_Window_Option:SetShow(false, true)
  TooltipSimple_Hide()
end

Option_Update = function()
  -- function num : 0_26
  GameOption_RefreshFPSText()
end

Option_RegistMessageHandler = function()
  -- function num : 0_27
  registerEvent("EventGameOptionToggle", "GameOption_TogglePanel")
  registerEvent("EventGameOptionInitGameOption", "GameOption_InitGameOption")
  registerEvent("EventGameOptionInitDisplayModeList", "GameOption_InitDisplayModeList")
  registerEvent("EventGameOptionDefault", "GameOption_DefaultOption")
end

local serviceType = getGameServiceType()
local TYPE = CppEnums.CountryType
if isGameTypeSA() or isGameServiceTypeDev() then
  ((frame_Display._btn_WatermarkService)[5]):SetShow(true)
else
  ;
  ((frame_Display._btn_WatermarkService)[5]):SetShow(false)
end
if isGameServiceTypeDev() then
  ((frame_Display._btn_WatermarkService)[6]):SetShow(true)
else
  ;
  ((frame_Display._btn_WatermarkService)[6]):SetShow(false)
end
Option_RegistEventHandler = function()
  -- function num : 0_28 , upvalues : gamePanel_Main, frame_Display, chk_Option, _btn_CropModeScaleX, _btn_CropModeScaleY, _btn_AutoOptimizationSlide, _frameContent_Display, _btn_Gamma, _btn_WatermarkAlpha, _btn_Contrast, _btn_UIScale, _btn_Fov, frame_Sound, _btn_TotalVol, _btn_MusicVol, _btn_FxVol, _btn_EnvFxVol, _btn_VoiceVol, _btn_hitFxWeightVolume, _btn_otherPlayerVolume, frame_Game, randerPlayerColorStr, _btn_EffectAlpha, _btn_CameraMaster, _btn_ColorByPass, _btn_CameraShake, _btn_MotionBlur, _btn_CameraPos, _btn_CameraFov, _btn_MouXSen, _btn_MouYSen, _btn_PadXSen, _btn_PadYSen, _btn_hitFxVolume, _static_ResetKeyConfig, _static_ResetKeyConfig_UI, _static_ResetPositionConfig_UI, simpleToolTipIdx
  (gamePanel_Main._btn_Close):addInputEvent("Mouse_LUp", "Option_Hide()")
  ;
  (gamePanel_Main._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"UIGameOption\" )")
  ;
  (gamePanel_Main._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"UIGameOption\", \"true\")")
  ;
  (gamePanel_Main._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"UIGameOption\", \"false\")")
  ;
  (gamePanel_Main._btn_Apply):addInputEvent("Mouse_LUp", "GameOption_Apply()")
  ;
  (gamePanel_Main._btn_SaveSetting):addInputEvent("Mouse_LUp", "GameOption_SaveSetting()")
  ;
  (gamePanel_Main._btn_Confirm):addInputEvent("Mouse_LUp", "GameOption_Confirm()")
  ;
  (gamePanel_Main._btn_Cancel):addInputEvent("Mouse_LUp", "GameOption_Cancel()")
  ;
  ((frame_Display._btn_ScreenMode)[chk_Option.FULL_SCREEN_IDX]):addInputEvent("Mouse_LUp", "GameOption_CheckFullScreen()")
  ;
  ((frame_Display._btn_ScreenMode)[chk_Option.FULL_SCREEN_WINDOWED_IDX]):addInputEvent("Mouse_LUp", "GameOption_CheckFullScreenWindowed()")
  ;
  ((frame_Display._btn_ScreenMode)[chk_Option.WINDOWED_IDX]):addInputEvent("Mouse_LUp", "GameOption_CheckWindowed()")
  ;
  ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_BMP]):addInputEvent("Mouse_LUp", "GameOption_CheckScreenShotBMP()")
  ;
  ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_JPG]):addInputEvent("Mouse_LUp", "GameOption_CheckScreenShotJPG()")
  ;
  ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_PNG]):addInputEvent("Mouse_LUp", "GameOption_CheckScreenShotPNG()")
  ;
  ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_4k]):addInputEvent("Mouse_LUp", "GameOption_CheckScreenShotSize_4k()")
  ;
  ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_8k]):addInputEvent("Mouse_LUp", "GameOption_CheckScreenShotSize_8k()")
  ;
  ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_DEFAULT]):addInputEvent("Mouse_LUp", "GameOption_CheckScreenShotSize_Default()")
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_KR]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkService(0)")
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_JP]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkService(1)")
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_NA]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkService(2)")
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_RU]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkService(3)")
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_TW]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkService(4)")
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_SA]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkService(5)")
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_NONE]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkService(6)")
  ;
  ((frame_Display._btn_WatermarkPosition)[chk_Option.WATERMARK_POSITION_LT]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkPosition(0)")
  ;
  ((frame_Display._btn_WatermarkPosition)[chk_Option.WATERMARK_POSITION_RT]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkPosition(1)")
  ;
  ((frame_Display._btn_WatermarkPosition)[chk_Option.WATERMARK_POSITION_LB]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkPosition(2)")
  ;
  ((frame_Display._btn_WatermarkPosition)[chk_Option.WATERMARK_POSITION_RB]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkPosition(3)")
  ;
  ((frame_Display._btn_WatermarkScale)[chk_Option.WATERMARK_SCALE_SMALL]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkScale(0)")
  ;
  ((frame_Display._btn_WatermarkScale)[chk_Option.WATERMARK_SCALE_REGULAR]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkScale(1)")
  ;
  ((frame_Display._btn_WatermarkScale)[chk_Option.WATERMARK_SCALE_LARGE]):addInputEvent("Mouse_LUp", "GameOption_CheckWatermarkScale(2)")
  ;
  ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_NONE]):addInputEvent("Mouse_LUp", "GameOption_CheckColorBlindNONE()")
  ;
  ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_PROTANOPIA]):addInputEvent("Mouse_LUp", "GameOption_CheckColorBlindPROTANOPIA()")
  ;
  ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_DEUTERANOP]):addInputEvent("Mouse_LUp", "GameOption_CheckColorBlindEDUTERANOP()")
  ;
  (frame_Display._btn_SelfPlayerOnlyEffect):addInputEvent("Mouse_LUp", "GameOption_CheckSelfPlayerOnlyEffect()")
  ;
  (frame_Display._btn_NearestPlayerOnlyEffect):addInputEvent("Mouse_LUp", "GameOption_CheckNearestPlayerOnlyEffect()")
  ;
  (frame_Display._btn_SelfPlayerOnlyLantern):addInputEvent("Mouse_LUp", "GameOption_CheckSelfPlayerOnlyLantern()")
  ;
  (frame_Display._btn_LowPower):addInputEvent("Mouse_LUp", "GameOption_CheckLowPower()")
  ;
  (frame_Display._btn_UpscaleEnable):addInputEvent("Mouse_LUp", "GameOption_CheckUpscale()")
  ;
  (frame_Display._btn_CropModeEnable):addInputEvent("Mouse_LUp", "GameOption_CheckCropMode()")
  ;
  (frame_Display._slide_CropModeScaleX):addInputEvent("Mouse_LUp", "GameOption_CropModeScaleX_slider()")
  ;
  (frame_Display._slide_CropModeScaleY):addInputEvent("Mouse_LUp", "GameOption_CropModeScaleY_slider()")
  _btn_CropModeScaleX:addInputEvent("Mouse_LUp", "GameOption_CropModeScaleX_button()")
  _btn_CropModeScaleY:addInputEvent("Mouse_LUp", "GameOption_CropModeScaleY_button()")
  ;
  (frame_Display._btn_AutoOptimization):addInputEvent("Mouse_LUp", "GameOption_CheckAutoOptimization()")
  ;
  (frame_Display._slide_AutoOptimization):addInputEvent("Mouse_LUp", "GameOption_AutoOptimization_slider()")
  ;
  (frame_Display._slide_AutoOptimization):addInputEvent("Mouse_LPress", "GameOption_AutoOptimization_slider()")
  _btn_AutoOptimizationSlide:addInputEvent("Mouse_LUp", "GameOption_AutoOptimization_slider()")
  _btn_AutoOptimizationSlide:addInputEvent("Mouse_LPress", "GameOption_AutoOptimization_slider()")
  ;
  (frame_Display._btn_ScrSize):addInputEvent("Mouse_LUp", "GameOption_ScreenResolutionIncrease()")
  ;
  (frame_Display._btn_ScrSize_L):addInputEvent("Mouse_LUp", "GameOption_ScreenResolutionDecrease()")
  ;
  (frame_Display._btn_ScrSize_R):addInputEvent("Mouse_LUp", "GameOption_ScreenResolutionIncrease()")
  ;
  (frame_Display._btn_LUT):addInputEvent("Mouse_LUp", "GameOption_LUTIncrease()")
  ;
  (frame_Display._btn_LUT_L):addInputEvent("Mouse_LUp", "GameOption_LUTDecrease()")
  ;
  (frame_Display._btn_LUT_R):addInputEvent("Mouse_LUp", "GameOption_LUTIncrease()")
  ;
  (frame_Display._btn_LUT_Reset):addInputEvent("Mouse_LUp", "GameOption_SetRecommandationLUT()")
  ;
  (frame_Display._btn_LUT_Reset2):addInputEvent("Mouse_LUp", "GameOption_SetRecommandationLUT2()")
  ;
  (frame_Display._slide_EffectAlpha):addInputEvent("Mouse_LPress", "GameOption_EffectAlpha_slider()")
  ;
  (frame_Display._slide_ColorByPass):addInputEvent("Mouse_LPress", "GameOption_ColorByPass_slider()")
  ;
  (frame_Display._slide_CameraMaster):addInputEvent("Mouse_LPress", "GameOption_CameraMasterPower_slider()")
  ;
  (frame_Display._slide_CameraShake):addInputEvent("Mouse_LPress", "GameOption_CameraShakePower_slider()")
  ;
  (frame_Display._slide_MotionBlur):addInputEvent("Mouse_LPress", "GameOption_MotionBlurPower_slider()")
  ;
  (frame_Display._slide_CameraPos):addInputEvent("Mouse_LPress", "GameOption_CameraPosPower_slider()")
  ;
  (frame_Display._slide_CameraFov):addInputEvent("Mouse_LPress", "GameOption_CameraFovPower_slider()")
  ;
  (frame_Display._btn_Trxt):addInputEvent("Mouse_LUp", "GameOption_TextureQualityIncrease()")
  ;
  (frame_Display._btn_Trxt_L):addInputEvent("Mouse_LUp", "GameOption_TextureQualityDecrease()")
  ;
  (frame_Display._btn_Trxt_R):addInputEvent("Mouse_LUp", "GameOption_TextureQualityIncrease()")
  ;
  (frame_Display._btn_Rndr):addInputEvent("Mouse_LUp", "GameOption_GraphicOptionIncrease()")
  ;
  (frame_Display._btn_Rndr_L):addInputEvent("Mouse_LUp", "GameOption_GraphicOptionDecrease()")
  ;
  (frame_Display._btn_Rndr_R):addInputEvent("Mouse_LUp", "GameOption_GraphicOptionIncrease()")
  ;
  (frame_Display._btn_DOF):addInputEvent("Mouse_LUp", "GameOption_CheckDof()")
  ;
  (frame_Display._btn_AntiAlli):addInputEvent("Mouse_LUp", "GameOption_CheckAA()")
  ;
  (frame_Display._btn_Ultra):addInputEvent("Mouse_LUp", "GameOption_CheckUltra()")
  ;
  (frame_Display._btn_LensBlood):addInputEvent("Mouse_LUp", "GameOption_CheckLensBlood()")
  ;
  (frame_Display._btn_BloodEffect):addInputEvent("Mouse_LUp", "GameOption_CheckBloodEffect()")
  ;
  (frame_Display._btn_Represent):addInputEvent("Mouse_LUp", "GameOption_CheckRepresent()")
  ;
  (frame_Display._btn_SnowPoolOnlyInSafeZone):addInputEvent("Mouse_LUp", "GameOption_CheckSnowPoolOnlyInSafeZone()")
  ;
  (frame_Display._btn_SSAO):addInputEvent("Mouse_LUp", "GameOption_CheckSSAO()")
  ;
  (frame_Display._btn_Tessellation):addInputEvent("Mouse_LUp", "GameOption_CheckTessellation()")
  ;
  (frame_Display._btn_PostFilter):addInputEvent("Mouse_LUp", "GameOption_CheckPostFilter()")
  ;
  (frame_Display._btn_CharacterEffect):addInputEvent("Mouse_LUp", "GameOption_CheckCharacterEffect()")
  ;
  (frame_Display._btn_WorkerVisible):addInputEvent("Mouse_LUp", "GameOption_CheckWorkerVisible()")
  if isGameTypeKR2() then
    (frame_Display._slide_WatermarkAlpha):SetShow(false)
    ;
    (frame_Display._txt_WaterMarkAlphaTitle):SetShow(false)
    ;
    (frame_Display._txt_WaterMarkMin):SetShow(false)
    ;
    (frame_Display._txt_WaterMarkDefault):SetShow(false)
    ;
    (frame_Display._txt_WaterMarkMax):SetShow(false)
    ;
    (frame_Display._txt_ScreenShotAlphaSizeTitle):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkScale)[0]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkScale)[1]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkScale)[2]):SetShow(false)
    ;
    (frame_Display._txt_ScreenShotAlphaPosTitle):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkPosition)[0]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkPosition)[1]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkPosition)[2]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkPosition)[3]):SetShow(false)
    ;
    (frame_Display._txt_ScreenShotAlphaTypeTitle):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkService)[0]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkService)[1]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkService)[2]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkService)[3]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkService)[4]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkService)[5]):SetShow(false)
    ;
    ((frame_Display._btn_WatermarkService)[6]):SetShow(false)
    _frameContent_Display:SetSize(_frameContent_Display:GetSizeX(), 1800)
  end
  ;
  (frame_Display._slide_Gamma):addInputEvent("Mouse_LPress", "GameOption_ChangeGamma_slider()")
  ;
  (frame_Display._slide_Contrast):addInputEvent("Mouse_LPress", "GameOption_ChangeContrast_slider()")
  ;
  (frame_Display._slide_UIScale):addInputEvent("Mouse_LPress", "GameOption_UIScale_Change()")
  ;
  (frame_Display._slide_Fov):addInputEvent("Mouse_LPress", "GameOption_ChangeFov_slider()")
  ;
  (frame_Display._slide_WatermarkAlpha):addInputEvent("Mouse_LPress", "GameOption_ChangeWatermarkAlpha_slider()")
  _btn_Gamma:addInputEvent("Mouse_LPress", "GameOption_ChangeGamma_button()")
  _btn_WatermarkAlpha:addInputEvent("Mouse_LPress", "GameOption_ChangeWatermarkAlpha_slider()")
  _btn_Contrast:addInputEvent("Mouse_LPress", "GameOption_ChangeContrast_button()")
  _btn_UIScale:addInputEvent("Mouse_LPress", "GameOption_UIScale_Change()")
  _btn_Fov:addInputEvent("Mouse_LPress", "GameOption_ChangeFov_button()")
  ;
  (frame_Sound._btn_MusicOnOff):addInputEvent("Mouse_LUp", "GameOption_CheckMusic()")
  ;
  (frame_Sound._btn_FXOnOff):addInputEvent("Mouse_LUp", "GameOption_CheckSound()")
  ;
  (frame_Sound._btn_EnvFXOnOff):addInputEvent("Mouse_LUp", "GameOption_CheckEnvSound()")
  ;
  (frame_Sound._btn_RiddingOnOff):addInputEvent("Mouse_LUp", "GameOption_CheckRiddingMusic()")
  ;
  (frame_Sound._btn_WhisperOnOff):addInputEvent("Mouse_LUp", "GameOption_CheckWhisperMusic()")
  ;
  (frame_Sound._btn_TraySoundOnOff):addInputEvent("Mouse_LUp", "GameOption_CheckTraySound()")
  ;
  (frame_Sound._btn_CombatAllwaysOff):addInputEvent("Mouse_LUp", "GameOption_CheckCombatSound()")
  ;
  (frame_Sound._btn_CombatAllwaysOn):addInputEvent("Mouse_LUp", "GameOption_CheckCombatSound()")
  ;
  (frame_Sound._btn_CombatAllwaysLowOff):addInputEvent("Mouse_LUp", "GameOption_CheckCombatSound()")
  ;
  (frame_Sound._btn_NpcVoice1):addInputEvent("Mouse_LUp", "GameOption_CheckNpcVoice()")
  ;
  (frame_Sound._btn_NpcVoice2):addInputEvent("Mouse_LUp", "GameOption_CheckNpcVoice()")
  ;
  (frame_Sound._btn_NpcVoice3):addInputEvent("Mouse_LUp", "GameOption_CheckNpcVoice()")
  ;
  (frame_Sound._slide_TotalVol):addInputEvent("Mouse_LPress", "GameOption_Master_slider()")
  ;
  (frame_Sound._slide_MusicVol):addInputEvent("Mouse_LPress", "GameOption_Music_slider()")
  ;
  (frame_Sound._slide_FxVol):addInputEvent("Mouse_LPress", "GameOption_FxSound_slider()")
  ;
  (frame_Sound._slide_EnvFxVol):addInputEvent("Mouse_LPress", "GameOption_EnvSound_slider()")
  ;
  (frame_Sound._slide_VoiceVol):addInputEvent("Mouse_LPress", "GameOption_DlgSound_slider()")
  ;
  (frame_Sound._slide_hitFxWeightVolume):addInputEvent("Mouse_LPress", "GameOption_HitFxWeight_slider()")
  ;
  (frame_Sound._slide_otherPlayerVolume):addInputEvent("Mouse_LPress", "GameOption_OtherPlayer_slider()")
  _btn_TotalVol:addInputEvent("Mouse_LPress", "GameOption_Master_button()")
  _btn_MusicVol:addInputEvent("Mouse_LPress", "GameOption_Music_button()")
  _btn_FxVol:addInputEvent("Mouse_LPress", "GameOption_FxSound_button()")
  _btn_EnvFxVol:addInputEvent("Mouse_LPress", "GameOption_EnvSound_button()")
  _btn_VoiceVol:addInputEvent("Mouse_LPress", "GameOption_DlgSound_button()")
  _btn_hitFxWeightVolume:addInputEvent("Mouse_LPress", "GameOption_HitFxWeight_button()")
  _btn_otherPlayerVolume:addInputEvent("Mouse_LPress", "GameOption_OtherPlayer_button()")
  ;
  (frame_Game._btn_ShowTag):addInputEvent("Mouse_LUp", "GameOption_CheckNameTag()")
  ;
  (frame_Game._btn_AutoAim):addInputEvent("Mouse_LUp", "GameOption_AutoAim()")
  ;
  (frame_Game._btn_GuildLogin):addInputEvent("Mouse_LUp", "Panel_GuildLogin_MainFunc()")
  ;
  (frame_Game._btn_RejectInvitation):addInputEvent("Mouse_LUp", "Panel_RejectInvitation_MainFunc()")
  ;
  (frame_Game._btn_HideWindow):addInputEvent("Mouse_LUp", "GameOption_CheckHideWindow()")
  ;
  (frame_Game._btn_EnableSimpleUI):addInputEvent("Mouse_LUp", "GameOption_CheckSimpleUI()")
  ;
  (frame_Game._btn_MouseMove):addInputEvent("Mouse_LUp", "GameOption_CheckMouseMove()")
  ;
  (frame_Game._btn_MiniMapRotation):addInputEvent("Mouse_LUp", "GameOption_CheckMiniMapRotation()")
  ;
  (frame_Game._btn_ShowAttackEffect):addInputEvent("Mouse_LUp", "GameOption_CheckShowAttackEffect()")
  ;
  (frame_Game._btn_Alert_BlackSpirit):addInputEvent("Mouse_LUp", "GameOption_CheckBlackSpiritAlert()")
  ;
  (frame_Game._btn_UseNewQuickSlot):addInputEvent("Mouse_LUp", "GameOption_CheckUseNewQuickSlot()")
  ;
  (frame_Game._btn_UseChattingFilter):addInputEvent("Mouse_LUp", "GameOption_CheckUseChattingFilter()")
  ;
  (frame_Game._btn_IsOnScreenSaver):addInputEvent("Mouse_LUp", "GameOption_CheckIsOnScreenSaver()")
  ;
  (frame_Game._btn_EnableOVR):addInputEvent("Mouse_LUp", "GameOption_CheckEnableOVR()")
  ;
  (frame_Game._btn_UIModeMouseLock):addInputEvent("Mouse_LUp", "GameOption_CheckUIModeMouseLock()")
  ;
  (frame_Game._btn_PvpRefuse):addInputEvent("Mouse_LUp", "GameOption_CheckPvpRefuse()")
  ;
  (frame_Game._btn_ExchangeRefuse):addInputEvent("Mouse_LUp", "GameOption_CheckExchangeRefuse()")
  ;
  (frame_Game._btn_HideMast):addInputEvent("Mouse_LUp", "GameOption_CheckHideMast()")
  ;
  (frame_Game._btn_ShowCashAlert):addInputEvent("Mouse_LUp", "GameOption_CheckCashAlert()")
  ;
  (frame_Game._btn_MouseX):addInputEvent("Mouse_LUp", "GameOption_CheckMouseInvertX()")
  ;
  (frame_Game._btn_MouseY):addInputEvent("Mouse_LUp", "GameOption_CheckMouseInvertY()")
  ;
  (frame_Game._slide_MouXSen):addInputEvent("Mouse_LPress", "GameOption_MouseSensitivityX_slider()")
  ;
  (frame_Game._slide_MouYSen):addInputEvent("Mouse_LPress", "GameOption_MouseSensitivityY_slider()")
  ;
  (frame_Game._btn_UsePad):addInputEvent("Mouse_LUp", "GameOption_CheckPadEnable()")
  ;
  (frame_Game._btn_UseVibe):addInputEvent("Mouse_LUp", "GameOption_CheckPadVibration()")
  ;
  (frame_Game._btn_PadX):addInputEvent("Mouse_LUp", "GameOption_CheckPadInvertX()")
  ;
  (frame_Game._btn_PadY):addInputEvent("Mouse_LUp", "GameOption_CheckPadInvertY()")
  ;
  (frame_Game._btn_Alert_Region):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(0)")
  ;
  (frame_Game._btn_Alert_TerritoryTrade):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(1)")
  ;
  (frame_Game._btn_Alert_RoyalTrade):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(2)")
  ;
  (frame_Game._btn_Alert_Fitness):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(3)")
  ;
  (frame_Game._btn_Alert_TerritoryWar):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(4)")
  ;
  (frame_Game._btn_Alert_GuildWar):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(5)")
  ;
  (frame_Game._btn_Alert_PlayerGotItem):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(6)")
  ;
  (frame_Game._btn_Alert_ItemMarket):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(7)")
  ;
  (frame_Game._btn_Alert_LifeLevUp):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(8)")
  ;
  (frame_Game._btn_Alert_GuildQuest):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(9)")
  ;
  (frame_Game._btn_Alert_NearMonster):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(10)")
  ;
  (frame_Game._btn_Alert_ServantMarket):addInputEvent("Mouse_LUp", "GameOption_CheckAlertMSG(11)")
  ;
  (frame_Game._slide_PadXSen):addInputEvent("Mouse_LPress", "GameOption_PadSensitivityX_slider()")
  ;
  (frame_Game._slide_PadYSen):addInputEvent("Mouse_LPress", "GameOption_PadSensitivityY_slider()")
  ;
  (frame_Sound._slide_hitFxVolume):addInputEvent("Mouse_LPress", "GameOption_hitFxVolume_slider()")
  ;
  (frame_Game._btn_SelfNameShowAllways):addInputEvent("Mouse_LUp", "GameOption_CheckSelfPlayerNameTagVisible()")
  ;
  (frame_Game._btn_SelfNameShowImportant):addInputEvent("Mouse_LUp", "GameOption_CheckSelfPlayerNameTagVisible()")
  ;
  (frame_Game._btn_SelfNameShowNoShow):addInputEvent("Mouse_LUp", "GameOption_CheckSelfPlayerNameTagVisible()")
  ;
  (frame_Game._btn_PetAll):addInputEvent("Mouse_LUp", "GameOption_CheckPetObjectShow()")
  ;
  (frame_Game._btn_PetMine):addInputEvent("Mouse_LUp", "GameOption_CheckPetObjectShow()")
  ;
  (frame_Game._btn_PetHide):addInputEvent("Mouse_LUp", "GameOption_CheckPetObjectShow()")
  ;
  (frame_Game._btn_FontResizeDefault):addInputEvent("Mouse_LUp", "GameOption_CheckFontResize()")
  ;
  (frame_Game._btn_FontResizeBig):addInputEvent("Mouse_LUp", "GameOption_CheckFontResize()")
  ;
  (frame_Game._btn_FontResizeMoreBig):addInputEvent("Mouse_LUp", "GameOption_CheckFontResize()")
  ;
  (frame_Game._btn_NavGuideNone):addInputEvent("Mouse_LUp", "GameOption_CheckNavGuidType()")
  ;
  (frame_Game._btn_NavGuideArrow):addInputEvent("Mouse_LUp", "GameOption_CheckNavGuidType()")
  ;
  (frame_Game._btn_NavGuideEffect):addInputEvent("Mouse_LUp", "GameOption_CheckNavGuidType()")
  ;
  (frame_Game._btn_NavGuideFairy):addInputEvent("Mouse_LUp", "GameOption_CheckNavGuidType()")
  ;
  (frame_Game._btn_WorldMapOpenByWestMaintain):addInputEvent("Mouse_LUp", "GameOption_CheckWorldMapOpenType()")
  ;
  (frame_Game._btn_WorldMapOpenByCharacterToWest):addInputEvent("Mouse_LUp", "GameOption_CheckWorldMapOpenType()")
  ;
  (frame_Game._btn_WorldMapOpenByCharacterMaintain):addInputEvent("Mouse_LUp", "GameOption_CheckWorldMapOpenType()")
  ;
  (frame_Game._btn_WorldMapOpenByNone):addInputEvent("Mouse_LUp", "GameOption_CheckWorldMapOpenType()")
  ;
  (frame_Game._btn_WorldMapCameraDefaultAngle):addInputEvent("Mouse_LUp", "GameOption_WorldMapAngle()")
  ;
  (frame_Game._btn_WorldMapCameraDegree30):addInputEvent("Mouse_LUp", "GameOption_WorldMapAngle()")
  ;
  (frame_Game._btn_WorldMapCameraDegree90):addInputEvent("Mouse_LUp", "GameOption_WorldMapAngle()")
  ;
  (frame_Game._btn_OtherNameShow):addInputEvent("Mouse_LUp", "GameOption_CheckOtherPlayerNameTagVisible()")
  ;
  (frame_Game._btn_PartyNameShow):addInputEvent("Mouse_LUp", "GameOption_CheckPartyPlayerNameTagVisible()")
  ;
  (frame_Game._btn_GuildNameShow):addInputEvent("Mouse_LUp", "GameOption_CheckGuildPlayerNameTagVisible()")
  ;
  (frame_Game._btn_GuideLineHumanRelation):addInputEvent("Mouse_LUp", "GameOption_CheckGuideLine_HumanRelation()")
  ;
  (frame_Game._btn_GuideLineQuestObject):addInputEvent("Mouse_LUp", "GameOption_CheckGuideLine_QuestLine()")
  ;
  (frame_Game._btn_GuideLineZoneChange):addInputEvent("Mouse_LUp", "GameOption_CheckGuideLine_RanderColor( \"" .. randerPlayerColorStr.zoneChange .. "\" )")
  ;
  (frame_Game._btn_GuideLineWarAlly):addInputEvent("Mouse_LUp", "GameOption_CheckGuideLine_RanderColor( \"" .. randerPlayerColorStr.warAlly .. "\" )")
  ;
  (frame_Game._btn_GuideLineGuild):addInputEvent("Mouse_LUp", "GameOption_CheckGuideLine_RanderColor( \"" .. randerPlayerColorStr.guild .. "\" )")
  ;
  (frame_Game._btn_GuideLineParty):addInputEvent("Mouse_LUp", "GameOption_CheckGuideLine_RanderColor( \"" .. randerPlayerColorStr.party .. "\" )")
  ;
  (frame_Game._btn_GuideLineEnemy):addInputEvent("Mouse_LUp", "GameOption_CheckGuideLine_RanderColor( \"" .. randerPlayerColorStr.enemy .. "\" )")
  ;
  (frame_Game._btn_GuideLineNonWarPlayer):addInputEvent("Mouse_LUp", "GameOption_CheckGuideLine_RanderColor( \"" .. randerPlayerColorStr.nonWarPlayer .. "\" )")
  ;
  (frame_Game._btn_GuideLinePartyEffect):addInputEvent("Mouse_LUp", "GameOption_CheckGuideLine_PartyMemberEffect()")
  _btn_EffectAlpha:addInputEvent("Mouse_LPress", "GameOption_EffectAlpha_button()")
  _btn_CameraMaster:addInputEvent("Mouse_LPress", "GameOption_CameraMasterPower_button()")
  _btn_ColorByPass:addInputEvent("Mouse_LPress", "GameOption_ColorByPass_button()")
  _btn_CameraShake:addInputEvent("Mouse_LPress", "GameOption_CameraShakePower_button()")
  _btn_MotionBlur:addInputEvent("Mouse_LPress", "GameOption_MotionBlurPower_button()")
  _btn_CameraPos:addInputEvent("Mouse_LPress", "GameOption_CameraPosPower_button()")
  _btn_CameraFov:addInputEvent("Mouse_LPress", "GameOption_CameraFovPower_button()")
  _btn_MouXSen:addInputEvent("Mouse_LPress", "GameOption_MouseSensitivityX_button()")
  _btn_MouYSen:addInputEvent("Mouse_LPress", "GameOption_MouseSensitivityY_button()")
  _btn_PadXSen:addInputEvent("Mouse_LPress", "GameOption_PadSensitivityX_button()")
  _btn_PadYSen:addInputEvent("Mouse_LPress", "GameOption_PadSensitivityY_button()")
  _btn_hitFxVolume:addInputEvent("Mouse_LPress", "GameOption_hitFxVolume_button()")
  _static_ResetKeyConfig:addInputEvent("Mouse_LUp", "GameOption_ReSetKeyConfig(" .. 0 .. ") ")
  _static_ResetKeyConfig_UI:addInputEvent("Mouse_LUp", "GameOption_ReSetKeyConfig(" .. 1 .. ")")
  _static_ResetPositionConfig_UI:addInputEvent("Mouse_LUp", "GameOption_UIPositon_Reset()")
  ;
  (frame_Display._btn_Reset):addInputEvent("Mouse_LUp", "GameOption_ResetDisplayOption()")
  ;
  (frame_Sound._btn_Reset):addInputEvent("Mouse_LUp", "GameOption_ResetSoundOption()")
  ;
  (frame_Game._btn_Reset):addInputEvent("Mouse_LUp", "GameOption_ResetGameOption()")
  ;
  (gamePanel_Main._btn_Reset):addInputEvent("Mouse_LUp", "GameOption_ResetAllOption()")
  value_GameOption_Check_ComboGuide:addInputEvent("Mouse_LUp", "GameOption_ShowComboGuide()")
  ;
  (frame_Display._btn_DOF):addInputEvent("Mouse_On", "Show_PictureTooltips( true , " .. 2 .. ")")
  ;
  (frame_Display._btn_DOF):addInputEvent("Mouse_Out", "Show_PictureTooltips( false )")
  ;
  (frame_Display._btn_LensBlood):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_LensBlood .. ")")
  ;
  (frame_Display._btn_LensBlood):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_LensBlood .. ")")
  ;
  (frame_Display._btn_LensBlood):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_AntiAlli):addInputEvent("Mouse_On", "Show_PictureTooltips( true , " .. 1 .. ")")
  ;
  (frame_Display._btn_AntiAlli):addInputEvent("Mouse_Out", "Show_PictureTooltips( false )")
  ;
  (frame_Display._btn_Ultra):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Ultra .. ")")
  ;
  (frame_Display._btn_Ultra):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Ultra .. ")")
  ;
  (frame_Display._btn_Ultra):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_BloodEffect):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_BloodEffect .. ")")
  ;
  (frame_Display._btn_BloodEffect):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_BloodEffect .. ")")
  ;
  (frame_Display._btn_BloodEffect):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_SSAO):addInputEvent("Mouse_On", "Show_PictureTooltips( true , " .. 4 .. ")")
  ;
  (frame_Display._btn_SSAO):addInputEvent("Mouse_Out", "Show_PictureTooltips( false )")
  ;
  (frame_Display._btn_Represent):addInputEvent("Mouse_On", "Show_PictureTooltips( true , " .. 5 .. ")")
  ;
  (frame_Display._btn_Represent):addInputEvent("Mouse_Out", "Show_PictureTooltips( false )")
  ;
  (frame_Display._btn_SnowPoolOnlyInSafeZone):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SnowPoolOnlyInSafeZone .. ")")
  ;
  (frame_Display._btn_SnowPoolOnlyInSafeZone):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SnowPoolOnlyInSafeZone .. ")")
  ;
  (frame_Display._btn_SnowPoolOnlyInSafeZone):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_Tessellation):addInputEvent("Mouse_On", "Show_PictureTooltips( true , " .. 3 .. ")")
  ;
  (frame_Display._btn_Tessellation):addInputEvent("Mouse_Out", "Show_PictureTooltips( false )")
  ;
  (frame_Display._btn_PostFilter):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PostFilter .. ")")
  ;
  (frame_Display._btn_PostFilter):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PostFilter .. ")")
  ;
  (frame_Display._btn_PostFilter):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_CharacterEffect):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CharacterEffect .. ")")
  ;
  (frame_Display._btn_CharacterEffect):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CharacterEffect .. ")")
  ;
  (frame_Display._btn_CharacterEffect):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_UpscaleEnable):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UpscaleEnable .. ")")
  ;
  (frame_Display._btn_UpscaleEnable):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UpscaleEnable .. ")")
  ;
  (frame_Display._btn_UpscaleEnable):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  ((frame_Display._btn_ScreenMode)[0]):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenMode0 .. ")")
  ;
  ((frame_Display._btn_ScreenMode)[0]):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenMode0 .. ")")
  ;
  ((frame_Display._btn_ScreenMode)[0]):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  ((frame_Display._btn_ScreenMode)[1]):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenMode1 .. ")")
  ;
  ((frame_Display._btn_ScreenMode)[1]):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenMode1 .. ")")
  ;
  ((frame_Display._btn_ScreenMode)[1]):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  ((frame_Display._btn_ScreenMode)[2]):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenMode2 .. ")")
  ;
  ((frame_Display._btn_ScreenMode)[2]):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenMode2 .. ")")
  ;
  ((frame_Display._btn_ScreenMode)[2]):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_ScrSize):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScrSize .. ")")
  ;
  (frame_Display._btn_ScrSize):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScrSize .. ")")
  ;
  (frame_Display._btn_ScrSize):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_Trxt):addInputEvent("Mouse_On", "Show_PictureTooltips( true , " .. 0 .. ")")
  ;
  (frame_Display._btn_Trxt):addInputEvent("Mouse_Out", "Show_PictureTooltips( false )")
  ;
  (frame_Display._btn_Rndr):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Rndr .. ")")
  ;
  (frame_Display._btn_Rndr):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Rndr .. ")")
  ;
  (frame_Display._btn_Rndr):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_SelfPlayerOnlyEffect):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfPlayerOnlyEffect .. ")")
  ;
  (frame_Display._btn_SelfPlayerOnlyEffect):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfPlayerOnlyEffect .. ")")
  ;
  (frame_Display._btn_SelfPlayerOnlyEffect):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_NearestPlayerOnlyEffect):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NearestPlayerOnlyEffect .. ")")
  ;
  (frame_Display._btn_NearestPlayerOnlyEffect):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NearestPlayerOnlyEffect .. ")")
  ;
  (frame_Display._btn_NearestPlayerOnlyEffect):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_SelfPlayerOnlyLantern):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfPlayerOnlyLantern .. ")")
  ;
  (frame_Display._btn_SelfPlayerOnlyLantern):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfPlayerOnlyLantern .. ")")
  ;
  (frame_Display._btn_SelfPlayerOnlyLantern):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_LowPower):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_LowPower .. ")")
  ;
  (frame_Display._btn_LowPower):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_LowPower .. ")")
  ;
  (frame_Display._btn_LowPower):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_CropModeEnable):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CropModeEnable .. ")")
  ;
  (frame_Display._btn_CropModeEnable):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CropModeEnable .. ")")
  ;
  (frame_Display._btn_CropModeEnable):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_AutoOptimization):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_AutoOptimization .. ")")
  ;
  (frame_Display._btn_AutoOptimization):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_AutoOptimization .. ")")
  ;
  (frame_Display._btn_AutoOptimization):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_CropModeScaleX:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CropModeScaleX .. ")")
  _btn_CropModeScaleX:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CropModeScaleX .. ")")
  _btn_CropModeScaleX:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_CropModeScaleY:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CropModeScaleY .. ")")
  _btn_CropModeScaleY:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CropModeScaleY .. ")")
  _btn_CropModeScaleY:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_EffectAlpha:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EffectAlpha .. ")")
  _btn_EffectAlpha:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EffectAlpha .. ")")
  _btn_EffectAlpha:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_UIScale:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UIScale .. ")")
  _btn_UIScale:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UIScale .. ")")
  _btn_UIScale:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_CameraMaster:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CameraMaster .. ")")
  _btn_CameraMaster:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CameraMaster .. ")")
  _btn_CameraMaster:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_CameraShake:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CameraShake .. ")")
  _btn_CameraShake:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CameraShake .. ")")
  _btn_CameraShake:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_MotionBlur:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MotionBlur .. ")")
  _btn_MotionBlur:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MotionBlur .. ")")
  _btn_MotionBlur:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_CameraPos:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CameraPos .. ")")
  _btn_CameraPos:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CameraPos .. ")")
  _btn_CameraPos:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_CameraFov:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CameraFov .. ")")
  _btn_CameraFov:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CameraFov .. ")")
  _btn_CameraFov:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_LUT):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_LUT .. ")")
  ;
  (frame_Display._btn_LUT):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_LUT .. ")")
  ;
  (frame_Display._btn_LUT):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_LUT_Reset):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_LUT_Reset .. ")")
  ;
  (frame_Display._btn_LUT_Reset):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_LUT_Reset .. ")")
  ;
  (frame_Display._btn_LUT_Reset):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_Gamma:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Gamma .. ")")
  _btn_Gamma:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Gamma .. ")")
  _btn_Gamma:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_Contrast:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Contrast .. ")")
  _btn_Contrast:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Contrast .. ")")
  _btn_Contrast:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_Fov:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Fov .. ")")
  _btn_Fov:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Fov .. ")")
  _btn_Fov:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  ((frame_Display._btn_ColorBlind)[1]):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ColorBlind_Red .. ")")
  ;
  ((frame_Display._btn_ColorBlind)[1]):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ColorBlind_Red .. ")")
  ;
  ((frame_Display._btn_ColorBlind)[1]):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  ((frame_Display._btn_ColorBlind)[2]):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ColorBlind_Green .. ")")
  ;
  ((frame_Display._btn_ColorBlind)[2]):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ColorBlind_Green .. ")")
  ;
  ((frame_Display._btn_ColorBlind)[2]):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Display._btn_WorkerVisible):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorkerVisible .. ")")
  ;
  (frame_Display._btn_WorkerVisible):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorkerVisible .. ")")
  ;
  (frame_Display._btn_WorkerVisible):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  ((frame_Display._btn_ScreenShotSize)[1]):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenShotSize_4k .. ")")
  ;
  ((frame_Display._btn_ScreenShotSize)[1]):addInputEvent("Mouse_Out", "Button_Simpletooltips( false, " .. simpleToolTipIdx._btn_ScreenShotSize_4k .. ")")
  ;
  ((frame_Display._btn_ScreenShotSize)[1]):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenShotSize_4k .. ")")
  ;
  ((frame_Display._btn_ScreenShotSize)[2]):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenShotSize_8k .. ")")
  ;
  ((frame_Display._btn_ScreenShotSize)[2]):addInputEvent("Mouse_Out", "Button_Simpletooltips( false, " .. simpleToolTipIdx._btn_ScreenShotSize_8k .. ")")
  ;
  ((frame_Display._btn_ScreenShotSize)[2]):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenShotSize_8k .. ")")
  ;
  ((frame_Display._btn_ScreenShotSize)[0]):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenShotSize_Default .. ")")
  ;
  ((frame_Display._btn_ScreenShotSize)[0]):addInputEvent("Mouse_Out", "Button_Simpletooltips( false, " .. simpleToolTipIdx._btn_ScreenShotSize_Default .. ")")
  ;
  ((frame_Display._btn_ScreenShotSize)[0]):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ScreenShotSize_Default .. ")")
  ;
  (frame_Sound._btn_MusicOnOff):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MusicOnOff .. ")")
  ;
  (frame_Sound._btn_MusicOnOff):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MusicOnOff .. ")")
  ;
  (frame_Sound._btn_MusicOnOff):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Sound._btn_FXOnOff):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FXOnOff .. ")")
  ;
  (frame_Sound._btn_FXOnOff):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FXOnOff .. ")")
  ;
  (frame_Sound._btn_FXOnOff):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Sound._btn_EnvFXOnOff):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EnvFXOnOff .. ")")
  ;
  (frame_Sound._btn_EnvFXOnOff):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EnvFXOnOff .. ")")
  ;
  (frame_Sound._btn_EnvFXOnOff):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Sound._btn_RiddingOnOff):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_RiddingOnOff .. ")")
  ;
  (frame_Sound._btn_RiddingOnOff):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_RiddingOnOff .. ")")
  ;
  (frame_Sound._btn_RiddingOnOff):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Sound._btn_CombatAllwaysOff):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CombatAllwaysOff .. ")")
  ;
  (frame_Sound._btn_CombatAllwaysOff):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CombatAllwaysOff .. ")")
  ;
  (frame_Sound._btn_CombatAllwaysOff):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Sound._btn_CombatAllwaysOn):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CombatAllwaysOn .. ")")
  ;
  (frame_Sound._btn_CombatAllwaysOn):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CombatAllwaysOn .. ")")
  ;
  (frame_Sound._btn_CombatAllwaysOn):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Sound._btn_CombatAllwaysLowOff):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CombatAllwaysLowOff .. ")")
  ;
  (frame_Sound._btn_CombatAllwaysLowOff):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_CombatAllwaysLowOff .. ")")
  ;
  (frame_Sound._btn_CombatAllwaysLowOff):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Sound._btn_WhisperOnOff):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WhisperOnOff .. ")")
  ;
  (frame_Sound._btn_WhisperOnOff):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WhisperOnOff .. ")")
  ;
  (frame_Sound._btn_WhisperOnOff):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Sound._btn_TraySoundOnOff):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_TraySoundOnOff .. ")")
  ;
  (frame_Sound._btn_TraySoundOnOff):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_TraySoundOnOff .. ")")
  ;
  (frame_Sound._btn_TraySoundOnOff):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_TotalVol:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_TotalVol .. ")")
  _btn_TotalVol:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_TotalVol .. ")")
  _btn_TotalVol:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_MusicVol:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MusicVol .. ")")
  _btn_MusicVol:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MusicVol .. ")")
  _btn_MusicVol:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_FxVol:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FxVol .. ")")
  _btn_FxVol:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FxVol .. ")")
  _btn_FxVol:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_EnvFxVol:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EnvFxVol .. ")")
  _btn_EnvFxVol:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EnvFxVol .. ")")
  _btn_EnvFxVol:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_VoiceVol:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_VoiceVol .. ")")
  _btn_VoiceVol:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_VoiceVol .. ")")
  _btn_VoiceVol:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_hitFxVolume:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_hitFxVolume .. ")")
  _btn_hitFxVolume:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_hitFxVolume .. ")")
  _btn_hitFxVolume:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_hitFxWeightVolume:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_hitFxWeightVolume .. ")")
  _btn_hitFxWeightVolume:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_hitFxWeightVolume .. ")")
  _btn_hitFxWeightVolume:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_otherPlayerVolume:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_otherPlayerVolume .. ")")
  _btn_otherPlayerVolume:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_otherPlayerVolume .. ")")
  _btn_otherPlayerVolume:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Sound._btn_NpcVoice1):addInputEvent("Mouse_On", "GameOption_SimpleToolTips(true, 7)")
  ;
  (frame_Sound._btn_NpcVoice1):addInputEvent("Mouse_Out", "GameOption_SimpleToolTips(false, 7)")
  ;
  (frame_Sound._btn_NpcVoice2):addInputEvent("Mouse_On", "GameOption_SimpleToolTips(true, 8)")
  ;
  (frame_Sound._btn_NpcVoice2):addInputEvent("Mouse_Out", "GameOption_SimpleToolTips(false, 8)")
  ;
  (frame_Sound._btn_NpcVoice3):addInputEvent("Mouse_On", "GameOption_SimpleToolTips(true, 9)")
  ;
  (frame_Sound._btn_NpcVoice3):addInputEvent("Mouse_Out", "GameOption_SimpleToolTips(false, 9)")
  ;
  (frame_Game._btn_AutoAim):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_AutoAim .. ")")
  ;
  (frame_Game._btn_AutoAim):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_AutoAim .. ")")
  ;
  (frame_Game._btn_AutoAim):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_HideWindow):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_HideWindow .. ")")
  ;
  (frame_Game._btn_HideWindow):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_HideWindow .. ")")
  ;
  (frame_Game._btn_HideWindow):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuildLogin):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuildLogin .. ")")
  ;
  (frame_Game._btn_GuildLogin):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuildLogin .. ")")
  ;
  (frame_Game._btn_GuildLogin):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_RejectInvitation):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_RejectInvitation .. ")")
  ;
  (frame_Game._btn_RejectInvitation):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_RejectInvitation .. ")")
  ;
  (frame_Game._btn_RejectInvitation):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_EnableSimpleUI):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EnableSimpleUI .. ")")
  ;
  (frame_Game._btn_EnableSimpleUI):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EnableSimpleUI .. ")")
  ;
  (frame_Game._btn_EnableSimpleUI):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_SpiritGuide):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SpiritGuide .. ")")
  ;
  (frame_Game._btn_SpiritGuide):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SpiritGuide .. ")")
  ;
  (frame_Game._btn_SpiritGuide):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_MouseMove):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouseMove .. ")")
  ;
  (frame_Game._btn_MouseMove):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouseMove .. ")")
  ;
  (frame_Game._btn_MouseMove):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_MiniMapRotation):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MiniMapRotation .. ")")
  ;
  (frame_Game._btn_MiniMapRotation):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MiniMapRotation .. ")")
  ;
  (frame_Game._btn_MiniMapRotation):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_ShowAttackEffect):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ShowAttackEffect .. ")")
  ;
  (frame_Game._btn_ShowAttackEffect):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ShowAttackEffect .. ")")
  ;
  (frame_Game._btn_ShowAttackEffect):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_BlackSpirit):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_BlackSpirit .. ")")
  ;
  (frame_Game._btn_Alert_BlackSpirit):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_BlackSpirit .. ")")
  ;
  (frame_Game._btn_Alert_BlackSpirit):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_UseNewQuickSlot):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UseNewQuickSlot .. ")")
  ;
  (frame_Game._btn_UseNewQuickSlot):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UseNewQuickSlot .. ")")
  ;
  (frame_Game._btn_UseNewQuickSlot):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_UseChattingFilter):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UseChattingFilter .. ")")
  ;
  (frame_Game._btn_UseChattingFilter):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UseChattingFilter .. ")")
  ;
  (frame_Game._btn_UseChattingFilter):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_IsOnScreenSaver):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_IsOnScreenSaver .. ")")
  ;
  (frame_Game._btn_IsOnScreenSaver):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_IsOnScreenSaver .. ")")
  ;
  (frame_Game._btn_IsOnScreenSaver):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_UIModeMouseLock):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UIModeMouseLock .. ")")
  ;
  (frame_Game._btn_UIModeMouseLock):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UIModeMouseLock .. ")")
  ;
  (frame_Game._btn_UIModeMouseLock):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_PvpRefuse):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PvpRefuse .. ")")
  ;
  (frame_Game._btn_PvpRefuse):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PvpRefuse .. ")")
  ;
  (frame_Game._btn_PvpRefuse):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_ExchangeRefuse):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ExchangeRefuse .. ")")
  ;
  (frame_Game._btn_ExchangeRefuse):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ExchangeRefuse .. ")")
  ;
  (frame_Game._btn_ExchangeRefuse):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_HideMast):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_HideMast .. ")")
  ;
  (frame_Game._btn_HideMast):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_HideMast .. ")")
  ;
  (frame_Game._btn_HideMast):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_ShowCashAlert):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ShowCashAlert .. ")")
  ;
  (frame_Game._btn_ShowCashAlert):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_ShowCashAlert .. ")")
  ;
  (frame_Game._btn_ShowCashAlert):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_EnableOVR):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EnableOVR .. ")")
  ;
  (frame_Game._btn_EnableOVR):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_EnableOVR .. ")")
  ;
  (frame_Game._btn_EnableOVR):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_SelfNameShowAllways):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfNameShowAllways .. ")")
  ;
  (frame_Game._btn_SelfNameShowAllways):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfNameShowAllways .. ")")
  ;
  (frame_Game._btn_SelfNameShowAllways):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_SelfNameShowImportant):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfNameShowImportant .. ")")
  ;
  (frame_Game._btn_SelfNameShowImportant):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfNameShowImportant .. ")")
  ;
  (frame_Game._btn_SelfNameShowImportant):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_SelfNameShowNoShow):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfNameShowNoShow .. ")")
  ;
  (frame_Game._btn_SelfNameShowNoShow):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_SelfNameShowNoShow .. ")")
  ;
  (frame_Game._btn_SelfNameShowNoShow):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_OtherNameShow):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_OtherNameShow .. ")")
  ;
  (frame_Game._btn_OtherNameShow):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_OtherNameShow .. ")")
  ;
  (frame_Game._btn_OtherNameShow):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_PartyNameShow):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PartyNameShow .. ")")
  ;
  (frame_Game._btn_PartyNameShow):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PartyNameShow .. ")")
  ;
  (frame_Game._btn_PartyNameShow):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuildNameShow):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuildNameShow .. ")")
  ;
  (frame_Game._btn_GuildNameShow):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuildNameShow .. ")")
  ;
  (frame_Game._btn_GuildNameShow):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLineHumanRelation):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineHumanRelation .. ")")
  ;
  (frame_Game._btn_GuideLineHumanRelation):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLineHumanRelation):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineHumanRelation .. ")")
  ;
  (frame_Game._btn_GuideLineQuestObject):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineQuestObject .. ")")
  ;
  (frame_Game._btn_GuideLineQuestObject):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLineQuestObject):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineQuestObject .. ")")
  ;
  (frame_Game._btn_GuideLineZoneChange):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineZoneChange .. ")")
  ;
  (frame_Game._btn_GuideLineZoneChange):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLineZoneChange):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineZoneChange .. ")")
  ;
  (frame_Game._btn_GuideLineWarAlly):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineWarAlly .. ")")
  ;
  (frame_Game._btn_GuideLineWarAlly):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLineWarAlly):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineWarAlly .. ")")
  ;
  (frame_Game._btn_GuideLineGuild):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineGuild .. ")")
  ;
  (frame_Game._btn_GuideLineGuild):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLineGuild):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineGuild .. ")")
  ;
  (frame_Game._btn_GuideLineParty):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineParty .. ")")
  ;
  (frame_Game._btn_GuideLineParty):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLineParty):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineParty .. ")")
  ;
  (frame_Game._btn_GuideLineEnemy):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineEnemy .. ")")
  ;
  (frame_Game._btn_GuideLineEnemy):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLineEnemy):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineEnemy .. ")")
  ;
  (frame_Game._btn_GuideLineNonWarPlayer):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineNonWarPlayer .. ")")
  ;
  (frame_Game._btn_GuideLineNonWarPlayer):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLineNonWarPlayer):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLineNonWarPlayer .. ")")
  ;
  (frame_Game._btn_GuideLinePartyEffect):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLinePartyEffect .. ")")
  ;
  (frame_Game._btn_GuideLinePartyEffect):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_GuideLinePartyEffect):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_GuideLinePartyEffect .. ")")
  ;
  (frame_Game._btn_PetAll):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PetAll .. ")")
  ;
  (frame_Game._btn_PetAll):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PetAll .. ")")
  ;
  (frame_Game._btn_PetAll):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_PetMine):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PetMine .. ")")
  ;
  (frame_Game._btn_PetMine):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PetMine .. ")")
  ;
  (frame_Game._btn_PetMine):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_PetHide):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PetHide .. ")")
  ;
  (frame_Game._btn_PetHide):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PetHide .. ")")
  ;
  (frame_Game._btn_PetHide):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_FontResizeDefault):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FontResizeDefault .. ")")
  ;
  (frame_Game._btn_FontResizeDefault):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FontResizeDefault .. ")")
  ;
  (frame_Game._btn_FontResizeDefault):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_FontResizeBig):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FontResizeBig .. ")")
  ;
  (frame_Game._btn_FontResizeBig):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FontResizeBig .. ")")
  ;
  (frame_Game._btn_FontResizeBig):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_FontResizeMoreBig):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FontResizeMoreBig .. ")")
  ;
  (frame_Game._btn_FontResizeMoreBig):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_FontResizeMoreBig .. ")")
  ;
  (frame_Game._btn_FontResizeMoreBig):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_NavGuideNone):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NavGuideNone .. ")")
  ;
  (frame_Game._btn_NavGuideNone):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NavGuideNone .. ")")
  ;
  (frame_Game._btn_NavGuideNone):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_NavGuideArrow):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NavGuideArrow .. ")")
  ;
  (frame_Game._btn_NavGuideArrow):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NavGuideArrow .. ")")
  ;
  (frame_Game._btn_NavGuideArrow):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_NavGuideEffect):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NavGuideEffect .. ")")
  ;
  (frame_Game._btn_NavGuideEffect):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NavGuideEffect .. ")")
  ;
  (frame_Game._btn_NavGuideEffect):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_NavGuideFairy):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NavGuideFairy .. ")")
  ;
  (frame_Game._btn_NavGuideFairy):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_NavGuideFairy .. ")")
  ;
  (frame_Game._btn_NavGuideFairy):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_WorldMapOpenByWestMaintain):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapOpenByWestMaintain .. ")")
  ;
  (frame_Game._btn_WorldMapOpenByWestMaintain):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapOpenByWestMaintain .. ")")
  ;
  (frame_Game._btn_WorldMapOpenByWestMaintain):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_WorldMapOpenByCharacterToWest):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapOpenByCharacterToWest .. ")")
  ;
  (frame_Game._btn_WorldMapOpenByCharacterToWest):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapOpenByCharacterToWest .. ")")
  ;
  (frame_Game._btn_WorldMapOpenByCharacterToWest):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_WorldMapOpenByCharacterMaintain):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapOpenByCharacterMaintain .. ")")
  ;
  (frame_Game._btn_WorldMapOpenByCharacterMaintain):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapOpenByCharacterMaintain .. ")")
  ;
  (frame_Game._btn_WorldMapOpenByCharacterMaintain):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_WorldMapOpenByNone):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapOpenByNone .. ")")
  ;
  (frame_Game._btn_WorldMapOpenByNone):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapOpenByNone .. ")")
  ;
  (frame_Game._btn_WorldMapOpenByNone):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_WorldMapCameraDefaultAngle):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapCameraDefaultAngle .. ")")
  ;
  (frame_Game._btn_WorldMapCameraDefaultAngle):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapCameraDefaultAngle .. ")")
  ;
  (frame_Game._btn_WorldMapCameraDefaultAngle):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_WorldMapCameraDegree30):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapCameraDegree30 .. ")")
  ;
  (frame_Game._btn_WorldMapCameraDegree30):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapCameraDegree30 .. ")")
  ;
  (frame_Game._btn_WorldMapCameraDegree30):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_WorldMapCameraDegree90):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapCameraDegree90 .. ")")
  ;
  (frame_Game._btn_WorldMapCameraDegree90):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_WorldMapCameraDegree90 .. ")")
  ;
  (frame_Game._btn_WorldMapCameraDegree90):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_Region):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_Region .. ")")
  ;
  (frame_Game._btn_Alert_Region):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_Region .. ")")
  ;
  (frame_Game._btn_Alert_Region):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_TerritoryTrade):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_TerritoryTrade .. ")")
  ;
  (frame_Game._btn_Alert_TerritoryTrade):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_TerritoryTrade .. ")")
  ;
  (frame_Game._btn_Alert_TerritoryTrade):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_RoyalTrade):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_RoyalTrade .. ")")
  ;
  (frame_Game._btn_Alert_RoyalTrade):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_RoyalTrade .. ")")
  ;
  (frame_Game._btn_Alert_RoyalTrade):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_Fitness):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_Fitness .. ")")
  ;
  (frame_Game._btn_Alert_Fitness):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_Fitness .. ")")
  ;
  (frame_Game._btn_Alert_Fitness):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_TerritoryWar):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_TerritoryWar .. ")")
  ;
  (frame_Game._btn_Alert_TerritoryWar):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_TerritoryWar .. ")")
  ;
  (frame_Game._btn_Alert_TerritoryWar):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_GuildWar):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_GuildWar .. ")")
  ;
  (frame_Game._btn_Alert_GuildWar):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_GuildWar .. ")")
  ;
  (frame_Game._btn_Alert_GuildWar):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_PlayerGotItem):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_PlayerGotItem .. ")")
  ;
  (frame_Game._btn_Alert_PlayerGotItem):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_PlayerGotItem .. ")")
  ;
  (frame_Game._btn_Alert_PlayerGotItem):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_ItemMarket):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_ItemMarket .. ")")
  ;
  (frame_Game._btn_Alert_ItemMarket):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_ItemMarket .. ")")
  ;
  (frame_Game._btn_Alert_ItemMarket):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_LifeLevUp):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_LifeLevUp .. ")")
  ;
  (frame_Game._btn_Alert_LifeLevUp):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_LifeLevUp .. ")")
  ;
  (frame_Game._btn_Alert_LifeLevUp):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_GuildQuest):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_GuildQuest .. ")")
  ;
  (frame_Game._btn_Alert_GuildQuest):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_GuildQuest .. ")")
  ;
  (frame_Game._btn_Alert_GuildQuest):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_NearMonster):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_NearMonster .. ")")
  ;
  (frame_Game._btn_Alert_NearMonster):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_NearMonster .. ")")
  ;
  (frame_Game._btn_Alert_NearMonster):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_Alert_ServantMarket):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_ServantMarket .. ")")
  ;
  (frame_Game._btn_Alert_ServantMarket):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_Alert_ServantMarket .. ")")
  ;
  (frame_Game._btn_Alert_ServantMarket):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_MouseX):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouseX .. ")")
  ;
  (frame_Game._btn_MouseX):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouseX .. ")")
  ;
  (frame_Game._btn_MouseX):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_MouseY):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouseY .. ")")
  ;
  (frame_Game._btn_MouseY):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouseY .. ")")
  ;
  (frame_Game._btn_MouseY):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_MouXSen:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouXSen .. ")")
  _btn_MouXSen:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouXSen .. ")")
  _btn_MouXSen:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_MouYSen:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouYSen .. ")")
  _btn_MouYSen:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_MouYSen .. ")")
  _btn_MouYSen:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_UsePad):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UsePad .. ")")
  ;
  (frame_Game._btn_UsePad):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UsePad .. ")")
  ;
  (frame_Game._btn_UsePad):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_UseVibe):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UseVibe .. ")")
  ;
  (frame_Game._btn_UseVibe):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_UseVibe .. ")")
  ;
  (frame_Game._btn_UseVibe):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_PadX):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PadX .. ")")
  ;
  (frame_Game._btn_PadX):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PadX .. ")")
  ;
  (frame_Game._btn_PadX):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  ;
  (frame_Game._btn_PadY):addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PadY .. ")")
  ;
  (frame_Game._btn_PadY):setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PadY .. ")")
  ;
  (frame_Game._btn_PadY):addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_PadXSen:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PadXSen .. ")")
  _btn_PadXSen:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PadXSen .. ")")
  _btn_PadXSen:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
  _btn_PadYSen:addInputEvent("Mouse_On", "Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PadYSen .. ")")
  _btn_PadYSen:setTooltipEventRegistFunc("Button_Simpletooltips( true, " .. simpleToolTipIdx._btn_PadYSen .. ")")
  _btn_PadYSen:addInputEvent("Mouse_Out", "Button_Simpletooltips( false )")
end

InitGraphicOptionAll = function(gameOptionSetting, optionType)
  -- function num : 0_29 , upvalues : chk_Option, currentResolutionX, currentResolutionY
  local screenModeIdx = gameOptionSetting:getScreenMode()
  GameOption_InitScreenMode(screenModeIdx)
  GameOption_SetScreenModeButtons(chk_Option.currentScreenModeIdx)
  local screenWidth = gameOptionSetting:getScreenResolutionWidth()
  local screenHeight = gameOptionSetting:getScreenResolutionHeight()
  local screenResolutionIdx = GameOption_FindScreenResolutionIdx(screenWidth, screenHeight)
  currentResolutionX = screenWidth
  currentResolutionY = screenHeight
  if screenResolutionIdx == 0 then
    GameOption_InitScreenResolution(0)
    GameOption_SetScreenResolutionText_exception(screenWidth, screenHeight)
  else
    GameOption_InitScreenResolution(screenResolutionIdx)
    GameOption_SetScreenResolutionText(chk_Option.currentScreenResolutionIdx)
  end
  local LUT = gameOptionSetting:getCameraLUTFilter()
  GameOption_InitLUT(LUT)
  local ScreenShotFormat = gameOptionSetting:getScreenShotFormat()
  GameOption_InitScreenShotFormat(ScreenShotFormat)
  GameOption_CheckScreenShotFormat(ScreenShotFormat)
  local ScreenShotSize = gameOptionSetting:getScreenShotQuality()
  GameOption_InitScreenShotSize(ScreenShotSize)
  GameOption_CheckScreenShotSize(ScreenShotSize)
  local WatermarkService = gameOptionSetting:getWatermarkService()
  GameOption_InitWatermarkService(WatermarkService)
  GameOption_CheckWatermarkService(WatermarkService)
  local WatermarkPosition = gameOptionSetting:getWatermarkPosition()
  GameOption_InitWatermarkPosition(WatermarkPosition)
  GameOption_CheckWatermarkPosition(WatermarkPosition)
  local WatermarkScale = gameOptionSetting:getWatermarkScale()
  GameOption_InitWatermarkScale(WatermarkScale)
  GameOption_CheckWatermarkScale(WatermarkScale)
  local WatermarkAlpha = gameOptionSetting:getWatermarkAlpha()
  GameOption_InitWatermarkAlpha(WatermarkAlpha)
  GameOption_SetWatermarkAlpha(WatermarkAlpha)
  local ColorBlindType = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
  GameOption_InitColorBlindMode(ColorBlindType)
  GameOption_CheckColorBlind(ColorBlindType)
  local SelfPlayerOnlyEffect = gameOptionSetting:getSelfPlayerOnlyEffect()
  GameOption_InitSelfPlayerOnlyEffect(SelfPlayerOnlyEffect)
  GameOption_CheckSelfPlayerOnlyEffect()
  local NearestPlayerOnlyEffect = gameOptionSetting:getNearestPlayerOnlyEffect()
  GameOption_InitNearestPlayerOnlyEffect(NearestPlayerOnlyEffect)
  GameOption_CheckNearestPlayerOnlyEffect()
  local SelfPlayerOnlyLantern = gameOptionSetting:getSelfPlayerOnlyLantern()
  GameOption_InitSelfPlayerOnlyLantern(SelfPlayerOnlyLantern)
  GameOption_CheckSelfPlayerOnlyLantern()
  local LowPower = gameOptionSetting:getPresentLock()
  GameOption_InitLowPower(LowPower)
  GameOption_CheckLowPower()
  local UpscaleEnable = gameOptionSetting:getUpscaleEnable()
  GameOption_InitUpscale(UpscaleEnable)
  GameOption_CheckUpscale()
  local CropModeEnable = gameOptionSetting:getCropModeEnable()
  local CropModeScaleX = gameOptionSetting:getCropModeScaleX()
  local CropModeScaleY = gameOptionSetting:getCropModeScaleY()
  GameOption_InitCropMode(CropModeEnable, CropModeScaleX, CropModeScaleY)
  local AutoOptimization = gameOptionSetting:getAutoOptimization()
  local OptimizationFrame = gameOptionSetting:getAutoOptimizationFrameLimit()
  GameOption_InitAutoOptimization(AutoOptimization, OptimizationFrame)
  local textureQualityIdx = gameOptionSetting:getTextureQuality()
  GameOption_InitTextureQuality(textureQualityIdx)
  GameOption_SetTextureQualityText(chk_Option.currentTextureQualityIdx)
  local graphicOptionIdx = gameOptionSetting:getGraphicOption()
  GameOption_InitGraphicOption(graphicOptionIdx)
  GameOption_SetGraphicOptionText(graphicOptionIdx)
  GameOption_InitGraphicCustomOption(gameOptionSetting)
  GameOption_SetGraphicCustomOption()
  local posPowerValue = gameOptionSetting:getCameraTranslatePower()
  GameOption_InitCameraPos(posPowerValue)
  GameOption_SetGammaValueText(posPowerValue)
  local fovPowerValue = gameOptionSetting:getCameraFovPower()
  GameOption_InitCameraFov(fovPowerValue)
  GameOption_SetGammaValueText(fovPowerValue)
  local gammaValue = gameOptionSetting:getGammaValue()
  GameOption_InitGamma(gammaValue)
  GameOption_SetGammaValueText(gammaValue)
  local contrastValue = gameOptionSetting:getContrastValue()
  GameOption_InitContrast(contrastValue)
  GameOption_SetContrastValueText(contrastValue)
  local fovValue = gameOptionSetting:getFov()
  GameOption_InitFov(fovValue)
  GameOption_SetFovValueText(fovValue)
  local uiScale = gameOptionSetting:getUIScale()
  uiScale = uiScale + 0.002
  local uiScale_Percent = (math.floor)((uiScale) * 100)
  uiScale = uiScale_Percent / 100
  if CppDefine.ChangeUIAndResolution == true then
    uiScale = GameOption_InitScale_50_200(uiScale)
  else
    uiScale = GameOption_InitScale(uiScale, screenHeight)
  end
  GameOption_SetUIMode(uiScale)
  setUIScale(uiScale)
  local workerVisible = gameOptionSetting:getWorkerVisible()
  GameOption_InitWorkerVisible(workerVisible)
  GameOption_CheckWorkerVisible(workerVisible)
end

InitSoundOptionAll = function(gameOptionSetting)
  -- function num : 0_30
  local enableMusic = gameOptionSetting:getEnableMusic()
  local enableSound = gameOptionSetting:getEnableSound()
  local enableEnvSound = gameOptionSetting:getEnableEnvSound()
  local masterVolume = gameOptionSetting:getMasterVolume()
  local musicVolume = gameOptionSetting:getMusicVolume()
  local fxVolume = gameOptionSetting:getFxVolume()
  local envVolume = gameOptionSetting:getEnvSoundVolume()
  local dlgVolume = gameOptionSetting:getDialogueVolume()
  local hitFxVolume = gameOptionSetting:getHitFxVolume()
  local hitFxWeight = gameOptionSetting:getHitFxWeight()
  local otherplayerVolume = gameOptionSetting:getOtherPlayerVolume()
  local combatMusic = gameOptionSetting:getEnableBattleSoundType()
  local riddingMusic = gameOptionSetting:getEnableRidingSound()
  local whisperMusic = gameOptionSetting:getEnableWhisperSound()
  local TraySound = gameOptionSetting:getEnableTraySound()
  local npcVoiceType = gameOptionSetting:getAudioResourceType()
  GameOption_InitSound(enableMusic, enableSound, enableEnvSound, nil, masterVolume, fxVolume, dlgVolume, envVolume, musicVolume, hitFxWeight, otherplayerVolume, riddingMusic, combatMusic, whisperMusic, TraySound, npcVoiceType)
  GameOption_SetVolumeText(masterVolume, fxVolume, dlgVolume, envVolume, musicVolume, hitFxVolume, hitFxWeight, otherplayerVolume)
end

local currentLUT = nil
GameOption_InitGameOption = function(gameOptionSetting, optionType)
  -- function num : 0_31 , upvalues : frame_Game, gamePanel_Main, currentLUT
  (frame_Game._btn_HideWindow):SetCheck(true)
  ;
  (gamePanel_Main._btn_Apply):SetEnable(false)
  InitGraphicOptionAll(gameOptionSetting, optionType)
  InitSoundOptionAll(gameOptionSetting)
  GameOption_SetGameMode(gameOptionSetting)
  GameOption_InitSystemNotify()
  currentLUT = gameOptionSetting:getCameraLUTFilter()
end

FGlobal_GetCurrentLUT = function()
  -- function num : 0_32 , upvalues : currentLUT
  return currentLUT
end

Option_Init_KeyConfig = function()
  -- function num : 0_33 , upvalues : frame_Key, UI_TM, keyConfigListShowCount, STATIC_INPUT_TITLE, _frameContent_KeyConfig, BUTTON_KEY, BUTTON_PAD, INPUT_COUNT_START, INPUT_COUNT_END, setKeyConfigDataTitle, setKeyConfigDataConfigOnlyPad, _frame_KeyConfig
  local adderPosY = 35
  local titleStaticPosY = (frame_Key._button_Pad_Func1):GetPosY()
  local keyButtonPosY = (frame_Key._button_Pad_Func1):GetPosY()
  local padButtonPosY = (frame_Key._button_Pad_Func1):GetPosY()
  ;
  (frame_Key._staticInputTitle_Func1):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Key._button_Pad_Func2):SetTextMode(UI_TM.eTextMode_LimitText)
  for ii = 0, keyConfigListShowCount - 1 do
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R8 in 'UnsetPending'

    if STATIC_INPUT_TITLE[ii] == nil then
      STATIC_INPUT_TITLE[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, _frameContent_KeyConfig, "StaticText_InputTitle_" .. tostring(ii))
      CopyBaseProperty(frame_Key._staticInputTitle_Func1, STATIC_INPUT_TITLE[ii])
      ;
      (STATIC_INPUT_TITLE[ii]):SetIgnore(true)
      ;
      (STATIC_INPUT_TITLE[ii]):SetShow(true)
    end
    -- DECOMPILER ERROR at PC81: Confused about usage of register: R8 in 'UnsetPending'

    if BUTTON_KEY[ii] == nil then
      BUTTON_KEY[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, _frameContent_KeyConfig, "Button_Key_" .. tostring(ii))
      CopyBaseProperty(frame_Key._button_key, BUTTON_KEY[ii])
      ;
      (BUTTON_KEY[ii]):addInputEvent("Mouse_LUp", "KeyCustom_Action_ButtonPushed_Key(" .. ii .. ")")
      ;
      (BUTTON_KEY[ii]):SetShow(true)
    end
    -- DECOMPILER ERROR at PC119: Confused about usage of register: R8 in 'UnsetPending'

    if BUTTON_PAD[ii] == nil then
      BUTTON_PAD[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, _frameContent_KeyConfig, "Button_Pad_" .. tostring(ii))
      CopyBaseProperty(frame_Key._button_Pad_Func2, BUTTON_PAD[ii])
      ;
      (BUTTON_PAD[ii]):addInputEvent("Mouse_LUp", "KeyCustom_Action_ButtonPushed_Pad(" .. ii .. ")")
      if isGameTypeKR2() then
        (BUTTON_PAD[ii]):SetShow(false)
      else
        ;
        (BUTTON_PAD[ii]):SetShow(true)
      end
    end
    ;
    (STATIC_INPUT_TITLE[ii]):SetPosY(titleStaticPosY)
    ;
    (BUTTON_KEY[ii]):SetPosY(keyButtonPosY)
    ;
    (BUTTON_PAD[ii]):SetPosY(padButtonPosY)
    titleStaticPosY = titleStaticPosY + adderPosY
    keyButtonPosY = keyButtonPosY + adderPosY
    padButtonPosY = padButtonPosY + adderPosY
  end
  for index = INPUT_COUNT_START, INPUT_COUNT_END do
    local titleString = PAGetString(Defines.StringSheet_GAME, "Lua_KeyCustom_Action_" .. index)
    setKeyConfigDataTitle(index, titleString)
  end
  setKeyConfigDataTitle(-2, (frame_Key._staticInputTitle_Func1):GetText())
  setKeyConfigDataTitle(-1, (frame_Key._staticInputTitle_Func2):GetText())
  setKeyConfigDataConfigOnlyPad(-2, true)
  setKeyConfigDataConfigOnlyPad(-1, true)
  ;
  (frame_Key._button_key):SetShow(false)
  ;
  (frame_Key._button_Pad_Func2):SetShow(false)
  ;
  (frame_Key._staticInputTitle_Func1):SetShow(false)
  ;
  (frame_Key._staticInputTitle_Func2):SetShow(false)
  ;
  (frame_Key._button_Pad_Func1):SetShow(false)
  ;
  (frame_Key._button_Pad_Func2):SetShow(false)
  _frame_KeyConfig:UpdateContentScroll()
  _frame_KeyConfig:UpdateContentPos()
end

Option_Init_KeyConfig_UI = function()
  -- function num : 0_34 , upvalues : frame_Key_UI, UI_TM, keyConfigListShowCount_UI, STATIC_INPUT_TITLE_UI, _frameContent_KeyConfig_UI, BUTTON_KEY_UI, BUTTON_PAD_UI, INPUT_COUNT_START_UI, INPUT_COUNT_END_UI, setKeyConfigData_UITitle, _frame_KeyConfig_UI
  local adderPosY = 35
  local titleStaticPosY = (frame_Key_UI._button_Pad_Func1):GetPosY()
  local keyButtonPosY = (frame_Key_UI._button_Pad_Func1):GetPosY()
  local padButtonPosY = (frame_Key_UI._button_Pad_Func1):GetPosY()
  ;
  (frame_Key_UI._staticInputTitle_Func1):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (frame_Key_UI._button_Pad_Func1):SetTextMode(UI_TM.eTextMode_LimitText)
  for ii = 0, keyConfigListShowCount_UI - 1 do
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R8 in 'UnsetPending'

    if (CppEnums.UiInputType).UiInputType_Cancel ~= ii then
      if STATIC_INPUT_TITLE_UI[ii] == nil then
        STATIC_INPUT_TITLE_UI[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, _frameContent_KeyConfig_UI, "StaticText_InputTitle_" .. tostring(ii))
        CopyBaseProperty(frame_Key_UI._staticInputTitle_Func1, STATIC_INPUT_TITLE_UI[ii])
        ;
        (STATIC_INPUT_TITLE_UI[ii]):SetIgnore(false)
        ;
        (STATIC_INPUT_TITLE_UI[ii]):SetShow(true)
      end
      -- DECOMPILER ERROR at PC86: Confused about usage of register: R8 in 'UnsetPending'

      if BUTTON_KEY_UI[ii] == nil then
        BUTTON_KEY_UI[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, _frameContent_KeyConfig_UI, "Button_Key_" .. tostring(ii))
        CopyBaseProperty(frame_Key_UI._button_key, BUTTON_KEY_UI[ii])
        ;
        (BUTTON_KEY_UI[ii]):addInputEvent("Mouse_LUp", "KeyCustom_UI_ButtonPushed_Key(" .. ii .. ")")
        ;
        (BUTTON_KEY_UI[ii]):SetShow(true)
      end
      -- DECOMPILER ERROR at PC124: Confused about usage of register: R8 in 'UnsetPending'

      if BUTTON_PAD_UI[ii] == nil then
        BUTTON_PAD_UI[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, _frameContent_KeyConfig_UI, "Button_Pad_" .. tostring(ii))
        CopyBaseProperty(frame_Key_UI._button_Pad_Func1, BUTTON_PAD_UI[ii])
        ;
        (BUTTON_PAD_UI[ii]):addInputEvent("Mouse_LUp", "KeyCustom_UI_ButtonPushed_Pad(" .. ii .. ")")
        if isGameTypeKR2() then
          (BUTTON_PAD_UI[ii]):SetShow(false)
        else
          ;
          (BUTTON_PAD_UI[ii]):SetShow(true)
        end
      end
      ;
      (STATIC_INPUT_TITLE_UI[ii]):SetPosY(titleStaticPosY)
      ;
      (BUTTON_KEY_UI[ii]):SetPosY(keyButtonPosY)
      ;
      (BUTTON_PAD_UI[ii]):SetPosY(padButtonPosY)
      titleStaticPosY = titleStaticPosY + adderPosY
      keyButtonPosY = keyButtonPosY + adderPosY
      padButtonPosY = padButtonPosY + adderPosY
    end
  end
  for index = INPUT_COUNT_START_UI, INPUT_COUNT_END_UI do
    local titleString = PAGetString(Defines.StringSheet_GAME, "Lua_KeyCustom_Ui_" .. index)
    setKeyConfigData_UITitle(index, titleString)
  end
  ;
  (frame_Key_UI._staticInputTitle_Func1):SetShow(false)
  ;
  (frame_Key_UI._button_key):SetShow(false)
  ;
  (frame_Key_UI._button_Pad_Func1):SetShow(false)
  _frame_KeyConfig_UI:UpdateContentScroll()
  _frame_KeyConfig_UI:UpdateContentPos()
end

GameOption_InitScreenMode = function(screenModeIdx)
  -- function num : 0_35 , upvalues : chk_Option
  local self = chk_Option
  if screenModeIdx >= 0 and screenModeIdx < self.SCREEN_MODE_COUNT then
    self.currentScreenModeIdx = screenModeIdx
    self.savedScreenModeIdx = screenModeIdx
    self.appliedScreenModeIdx = screenModeIdx
  end
end

GameOption_SetCurrentScreenMode = function(screenModeIdx)
  -- function num : 0_36 , upvalues : chk_Option
  local self = chk_Option
  if self.currentScreenModeIdx ~= screenModeIdx then
    self.currentScreenModeIdx = screenModeIdx
    GameOption_SetScreenModeButtons(screenModeIdx)
  end
  GameOption_UpdateOptionChanged()
end

GameOption_SetScreenModeButtons = function(screenModeIdx)
  -- function num : 0_37 , upvalues : chk_Option, frame_Display
  if screenModeIdx == chk_Option.FULL_SCREEN_IDX then
    ((frame_Display._btn_ScreenMode)[chk_Option.FULL_SCREEN_IDX]):SetCheck(true)
    ;
    ((frame_Display._btn_ScreenMode)[chk_Option.FULL_SCREEN_WINDOWED_IDX]):SetCheck(false)
    ;
    ((frame_Display._btn_ScreenMode)[chk_Option.WINDOWED_IDX]):SetCheck(false)
  else
    if screenModeIdx == chk_Option.FULL_SCREEN_WINDOWED_IDX then
      ((frame_Display._btn_ScreenMode)[chk_Option.FULL_SCREEN_IDX]):SetCheck(false)
      ;
      ((frame_Display._btn_ScreenMode)[chk_Option.FULL_SCREEN_WINDOWED_IDX]):SetCheck(true)
      ;
      ((frame_Display._btn_ScreenMode)[chk_Option.WINDOWED_IDX]):SetCheck(false)
    else
      if screenModeIdx == chk_Option.WINDOWED_IDX then
        ((frame_Display._btn_ScreenMode)[chk_Option.FULL_SCREEN_IDX]):SetCheck(false)
        ;
        ((frame_Display._btn_ScreenMode)[chk_Option.FULL_SCREEN_WINDOWED_IDX]):SetCheck(false)
        ;
        ((frame_Display._btn_ScreenMode)[chk_Option.WINDOWED_IDX]):SetCheck(true)
      end
    end
  end
end

GameOption_InitScale = function(uiScale, screenHeight)
  -- function num : 0_38 , upvalues : scaleRangeTable, const_UiScaleValue, chk_Option
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  if screenHeight <= scaleRangeTable.minScaleHeight then
    scaleRangeTable.minScaleValue = const_UiScaleValue[1]
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

    scaleRangeTable.maxScaleValue = const_UiScaleValue[2]
  else
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R2 in 'UnsetPending'

    if scaleRangeTable.minScaleHeight < screenHeight and screenHeight <= scaleRangeTable.midleScaleHeight then
      scaleRangeTable.minScaleValue = const_UiScaleValue[1]
      -- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

      scaleRangeTable.maxScaleValue = const_UiScaleValue[3]
    else
      -- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

      if scaleRangeTable.midleScaleHeight < screenHeight and screenHeight <= scaleRangeTable.HighScaleHeight then
        scaleRangeTable.minScaleValue = const_UiScaleValue[1]
        -- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

        scaleRangeTable.maxScaleValue = const_UiScaleValue[4]
      else
        -- DECOMPILER ERROR at PC58: Confused about usage of register: R2 in 'UnsetPending'

        if scaleRangeTable.HighScaleHeight < screenHeight and screenHeight <= scaleRangeTable.MaxScaleHeight then
          scaleRangeTable.minScaleValue = const_UiScaleValue[1]
          -- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

          scaleRangeTable.maxScaleValue = const_UiScaleValue[5]
        else
          -- DECOMPILER ERROR at PC67: Confused about usage of register: R2 in 'UnsetPending'

          scaleRangeTable.minScaleValue = const_UiScaleValue[5]
          -- DECOMPILER ERROR at PC71: Confused about usage of register: R2 in 'UnsetPending'

          scaleRangeTable.maxScaleValue = const_UiScaleValue[6]
        end
      end
    end
  end
  uiScale = (math.floor)(uiScale * 100) / 100
  if scaleRangeTable.maxScaleValue < uiScale * 100 then
    uiScale = 0.8
  end
  -- DECOMPILER ERROR at PC84: Confused about usage of register: R2 in 'UnsetPending'

  chk_Option.appliedCheckUIScale = uiScale
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R2 in 'UnsetPending'

  chk_Option.savedCheckUIScale = uiScale
  -- DECOMPILER ERROR at PC88: Confused about usage of register: R2 in 'UnsetPending'

  chk_Option.currentCheckUIScale = uiScale
  return uiScale
end

GameOption_InitScale_50_200 = function(uiScale)
  -- function num : 0_39 , upvalues : scaleRangeTable, const_UiScaleValue, chk_Option
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  scaleRangeTable.minScaleValue = const_UiScaleValue[1]
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  scaleRangeTable.maxScaleValue = const_UiScaleValue[6]
  uiScale = (math.floor)(uiScale * 100) / 100
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.appliedCheckUIScale = uiScale
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.savedCheckUIScale = uiScale
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.currentCheckUIScale = uiScale
  return uiScale
end

GameOption_InitScreenShotFormat = function(Format)
  -- function num : 0_40 , upvalues : chk_Option
  local self = chk_Option
  self.currentScreenShotFormat = Format
  self.savedScreenShotFormat = Format
  self.appliedScreenShotFormat = Format
  GameOption_UpdateOptionChanged()
end

GameOption_InitScreenShotSize = function(isSize)
  -- function num : 0_41 , upvalues : chk_Option
  local self = chk_Option
  self.currentScreenShotSize = isSize
  self.savedScreenShotSize = isSize
  self.appliedScreenShotSize = isSize
  GameOption_UpdateOptionChanged()
end

GameOption_InitWatermarkService = function(Format)
  -- function num : 0_42 , upvalues : chk_Option
  local self = chk_Option
  self.currentWatermarkService = Format
  self.savedWatermarkService = Format
  self.appliedWatermarkService = Format
  GameOption_UpdateOptionChanged()
end

GameOption_InitWatermarkPosition = function(Format)
  -- function num : 0_43 , upvalues : chk_Option
  local self = chk_Option
  self.currentWatermarkPosition = Format
  self.savedWatermarkPosition = Format
  self.appliedWatermarkPosition = Format
  GameOption_UpdateOptionChanged()
end

GameOption_InitWatermarkScale = function(Format)
  -- function num : 0_44 , upvalues : chk_Option
  local self = chk_Option
  self.currentWatermarkScale = Format
  self.savedWatermarkScale = Format
  self.appliedWatermarkScale = Format
  GameOption_UpdateOptionChanged()
end

GameOption_InitColorBlindMode = function(Format)
  -- function num : 0_45 , upvalues : chk_Option
  local self = chk_Option
  self.currentColorBlind = Format
  self.savedColorBlind = Format
  self.appliedColorBlind = Format
  GameOption_UpdateOptionChanged()
end

GameOption_InitSelfPlayerOnlyEffect = function(isSelfPlayerOnlyEffect)
  -- function num : 0_46 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = isSelfPlayerOnlyEffect
  ;
  (frame_Display._btn_SelfPlayerOnlyEffect):SetCheck(check)
  self.currentSelfPlayerOnlyEffect = check
  self.savedSelfPlayerOnlyEffect = check
  self.appliedSelfPlayerOnlyEffect = check
  GameOption_UpdateOptionChanged()
end

GameOption_InitNearestPlayerOnlyEffect = function(isNearestPlayerOnlyEffect)
  -- function num : 0_47 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = isNearestPlayerOnlyEffect
  ;
  (frame_Display._btn_NearestPlayerOnlyEffect):SetCheck(check)
  self.currentNearestPlayerOnlyEffect = check
  self.savedNearestPlayerOnlyEffect = check
  self.appliedNearestPlayerOnlyEffect = check
  GameOption_UpdateOptionChanged()
end

GameOption_InitWorkerVisible = function(isWorkerVisible)
  -- function num : 0_48 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = isWorkerVisible
  ;
  (frame_Display._btn_WorkerVisible):SetCheck(check)
  self.currentCheckWorkerVisible = check
  self.savedCheckWorkerVisible = check
  self.appliedCheckWorkerVisible = check
  GameOption_UpdateOptionChanged()
end

GameOption_InitSelfPlayerOnlyLantern = function(isSelfPlayerOnlyLantern)
  -- function num : 0_49 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = isSelfPlayerOnlyLantern
  ;
  (frame_Display._btn_SelfPlayerOnlyLantern):SetCheck(check)
  self.currentSelfPlayerOnlyLantern = check
  self.savedSelfPlayerOnlyLantern = check
  self.appliedSelfPlayerOnlyLantern = check
  GameOption_UpdateOptionChanged()
end

GameOption_InitLowPower = function(isLowPower)
  -- function num : 0_50 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = isLowPower
  ;
  (frame_Display._btn_LowPower):SetCheck(check)
  self.currentLowPower = check
  self.savedLowPower = check
  self.appliedLowPower = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckScreenShotBMP = function()
  -- function num : 0_51 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetScreenShotFormat(self.SCREENSHOT_BMP)
end

GameOption_CheckScreenShotJPG = function()
  -- function num : 0_52 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetScreenShotFormat(self.SCREENSHOT_JPG)
end

GameOption_CheckScreenShotPNG = function()
  -- function num : 0_53 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetScreenShotFormat(self.SCREENSHOT_PNG)
end

GameOption_CheckScreenShotSize_4k = function()
  -- function num : 0_54 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetScreenShotSize(self.SCREENSHOTSIZE_4k)
end

GameOption_CheckScreenShotSize_8k = function()
  -- function num : 0_55 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetScreenShotSize(self.SCREENSHOTSIZE_8k)
end

GameOption_CheckScreenShotSize_Default = function()
  -- function num : 0_56 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetScreenShotSize(self.SCREENSHOTSIZE_DEFAULT)
end

GameOption_SetScreenShotFormat = function(Format)
  -- function num : 0_57 , upvalues : chk_Option
  local self = chk_Option
  if self.currentScreenShotFormat ~= Format then
    self.currentScreenShotFormat = Format
    GameOption_CheckScreenShotFormat(Format)
  end
  GameOption_UpdateOptionChanged()
end

GameOption_SetScreenShotSize = function(isSize)
  -- function num : 0_58 , upvalues : chk_Option
  local self = chk_Option
  if self.currentScreenShotSize ~= isSize then
    self.currentScreenShotSize = isSize
    GameOption_CheckScreenShotSize(isSize)
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckColorBlindNONE = function()
  -- function num : 0_59 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetColorBlindMode(self.COLORBLIND_NONE)
end

GameOption_CheckColorBlindPROTANOPIA = function()
  -- function num : 0_60 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetColorBlindMode(self.COLORBLIND_PROTANOPIA)
end

GameOption_CheckColorBlindEDUTERANOP = function()
  -- function num : 0_61 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetColorBlindMode(self.COLORBLIND_DEUTERANOP)
end

GameOption_SetColorBlindMode = function(Format)
  -- function num : 0_62 , upvalues : chk_Option
  local self = chk_Option
  if self.currentColorBlind ~= Format then
    self.currentColorBlind = Format
    GameOption_CheckColorBlind(Format)
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckScreenShotFormat = function(Format)
  -- function num : 0_63 , upvalues : frame_Display, chk_Option
  if Format == 0 then
    ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_BMP]):SetCheck(true)
    ;
    ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_JPG]):SetCheck(false)
    ;
    ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_PNG]):SetCheck(false)
  else
    if Format == 1 then
      ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_BMP]):SetCheck(false)
      ;
      ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_JPG]):SetCheck(true)
      ;
      ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_PNG]):SetCheck(false)
    else
      if Format == 2 then
        ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_BMP]):SetCheck(false)
        ;
        ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_JPG]):SetCheck(false)
        ;
        ((frame_Display._btn_ScreenShotFormat)[chk_Option.SCREENSHOT_PNG]):SetCheck(true)
      end
    end
  end
end

GameOption_CheckScreenShotSize = function(isSize)
  -- function num : 0_64 , upvalues : frame_Display, chk_Option
  if isSize == 0 then
    ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_DEFAULT]):SetCheck(true)
    ;
    ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_4k]):SetCheck(false)
    ;
    ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_8k]):SetCheck(false)
  else
    if isSize == 1 then
      ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_DEFAULT]):SetCheck(false)
      ;
      ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_4k]):SetCheck(true)
      ;
      ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_8k]):SetCheck(false)
    else
      if isSize == 2 then
        ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_DEFAULT]):SetCheck(false)
        ;
        ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_4k]):SetCheck(false)
        ;
        ((frame_Display._btn_ScreenShotSize)[chk_Option.SCREENSHOTSIZE_8k]):SetCheck(true)
      end
    end
  end
end

GameOption_CheckColorBlind = function(Format)
  -- function num : 0_65 , upvalues : frame_Display, chk_Option
  if Format == 0 then
    ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_NONE]):SetCheck(true)
    ;
    ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_PROTANOPIA]):SetCheck(false)
    ;
    ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_DEUTERANOP]):SetCheck(false)
  else
    if Format == 1 then
      ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_NONE]):SetCheck(false)
      ;
      ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_PROTANOPIA]):SetCheck(true)
      ;
      ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_DEUTERANOP]):SetCheck(false)
    else
      if Format == 2 then
        ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_NONE]):SetCheck(false)
        ;
        ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_PROTANOPIA]):SetCheck(false)
        ;
        ((frame_Display._btn_ColorBlind)[chk_Option.COLORBLIND_DEUTERANOP]):SetCheck(true)
      end
    end
  end
end

GameOption_CheckFullScreen = function()
  -- function num : 0_66 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetCurrentScreenMode(self.FULL_SCREEN_IDX)
end

GameOption_CheckFullScreenWindowed = function()
  -- function num : 0_67 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetCurrentScreenMode(self.FULL_SCREEN_WINDOWED_IDX)
end

GameOption_CheckWindowed = function()
  -- function num : 0_68 , upvalues : chk_Option
  local self = chk_Option
  GameOption_SetCurrentScreenMode(self.WINDOWED_IDX)
end

GameOption_CheckWatermarkService = function(watermark_type)
  -- function num : 0_69 , upvalues : frame_Display, chk_Option
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_KR]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_JP]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_NA]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_RU]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_TW]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_SA]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkService)[chk_Option.WATERMARK_SERVICE_NONE]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkService)[watermark_type]):SetCheck(true)
  local self = chk_Option
  if self.currentWatermarkService ~= watermark_type then
    self.currentWatermarkService = watermark_type
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckWatermarkPosition = function(watermark_type)
  -- function num : 0_70 , upvalues : frame_Display, chk_Option
  ((frame_Display._btn_WatermarkPosition)[chk_Option.WATERMARK_POSITION_LT]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkPosition)[chk_Option.WATERMARK_POSITION_RT]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkPosition)[chk_Option.WATERMARK_POSITION_LB]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkPosition)[chk_Option.WATERMARK_POSITION_RB]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkPosition)[watermark_type]):SetCheck(true)
  local self = chk_Option
  if self.currentWatermarkPosition ~= watermark_type then
    self.currentWatermarkPosition = watermark_type
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckWatermarkScale = function(watermark_type)
  -- function num : 0_71 , upvalues : frame_Display, chk_Option
  ((frame_Display._btn_WatermarkScale)[chk_Option.WATERMARK_SCALE_SMALL]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkScale)[chk_Option.WATERMARK_SCALE_REGULAR]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkScale)[chk_Option.WATERMARK_SCALE_LARGE]):SetCheck(false)
  ;
  ((frame_Display._btn_WatermarkScale)[watermark_type]):SetCheck(true)
  local self = chk_Option
  if self.currentWatermarkScale ~= watermark_type then
    self.currentWatermarkScale = watermark_type
  end
  GameOption_UpdateOptionChanged()
end

GameOption_InitWatermarkAlpha = function(watermarkAlpha)
  -- function num : 0_72 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  self.currentWatermarkAlpha = watermarkAlpha
  self.savedWatermarkAlpha = watermarkAlpha
  self.appliedWatermarkAlpha = watermarkAlpha
  ;
  (frame_Display._slide_WatermarkAlpha):SetControlPos(watermarkAlpha * 100)
end

GameOption_SetWatermarkAlpha = function(watermarkAlpha)
  -- function num : 0_73 , upvalues : chk_Option
  local self = chk_Option
  self.currentWatermarkAlpha = watermarkAlpha
  setWatermarkAlpha(watermarkAlpha)
  GameOption_UpdateOptionChanged()
end

GameOption_ChangeWatermarkAlpha_slider = function()
  -- function num : 0_74 , upvalues : frame_Display
  local ratio = (frame_Display._slide_WatermarkAlpha):GetControlPos()
  GameOption_SetWatermarkAlpha(ratio)
end

GameOption_ChangeWatermarkAlpha_button = function()
  -- function num : 0_75 , upvalues : _btn_WatermarkAlpha, frame_Display
  local ratio = _btn_WatermarkAlpha:GetPosX() / ((frame_Display._slide_WatermarkAlpha):GetSizeX() - _btn_WatermarkAlpha:GetSizeX())
  GameOption_SetWatermarkAlpha(ratio)
end

GameOption_InitScreenResolution = function(screenResolutionIdx)
  -- function num : 0_76 , upvalues : chk_Option
  local self = chk_Option
  if screenResolutionIdx >= 0 and screenResolutionIdx <= self.SCREEN_RESOLUTION_COUNT then
    self.currentScreenResolutionIdx = screenResolutionIdx
    self.savedScreenResolutionIdx = screenResolutionIdx
    self.appliedScreenResolutionIdx = screenResolutionIdx
  end
end

GameOption_SetCurrentScreenResolution = function(screenResolutionIdx)
  -- function num : 0_77 , upvalues : chk_Option
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  if screenResolutionIdx > 0 and screenResolutionIdx <= chk_Option.SCREEN_RESOLUTION_COUNT then
    chk_Option.currentScreenResolutionIdx = screenResolutionIdx
    GameOption_SetScreenResolutionText(screenResolutionIdx)
  end
  GameOption_UpdateOptionChanged()
end

GameOption_SetScreenResolutionText = function(screenResolutionIdx)
  -- function num : 0_78 , upvalues : chk_Option, frame_Display, scaleRangeTable, const_UiScaleValue
  local self = chk_Option
  if screenResolutionIdx > 0 and screenResolutionIdx <= self.SCREEN_RESOLUTION_COUNT then
    local screenResolution = (self.screenResolutionList)[screenResolutionIdx]
    ;
    (frame_Display._btn_ScrSize):SetText(tostring(screenResolution.width .. " x " .. screenResolution.height))
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R3 in 'UnsetPending'

    scaleRangeTable.minScaleValue = const_UiScaleValue[1]
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R3 in 'UnsetPending'

    scaleRangeTable.maxScaleValue = const_UiScaleValue[6]
    if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_KOR) then
      GameOption_UIScale_Change()
    end
    if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_JAP) then
      GameOption_Fix_UiScale()
    end
  end
end

GameOption_Fix_UiScale = function()
  -- function num : 0_79 , upvalues : chk_Option
  GameOption_SetUIMode(chk_Option.currentCheckUIScale)
end

GameOption_SetScreenResolutionText_exception = function(screenWidth, screenHeight)
  -- function num : 0_80 , upvalues : frame_Display
  (frame_Display._btn_ScrSize):SetText(tostring(screenWidth .. " x " .. screenHeight))
end

GameOption_FindScreenResolutionIdx = function(screenWidth, screenHeight)
  -- function num : 0_81 , upvalues : chk_Option, isFindScreenResolution, screenResolutionIndex
  local self = chk_Option
  local screenResolutionList = self.screenResolutionList
  for ii = 1, self.SCREEN_RESOLUTION_COUNT do
    if (screenResolutionList[ii]).width == screenWidth and (screenResolutionList[ii]).height == screenHeight then
      isFindScreenResolution = true
      return ii
    end
  end
  isFindScreenResolution = false
  local searchIndex = 0
  local minHeight = 0
  local searchHeight = 0
  local minWidth = 0
  local searchWidth = 0
  for ii = 1, self.SCREEN_RESOLUTION_COUNT do
    for jj = 1, self.SCREEN_RESOLUTION_COUNT do
      if (screenResolutionList[ii]).width == screenWidth and (screenResolutionList[ii]).width == (screenResolutionList[jj]).width then
        searchHeight = (math.abs)((screenResolutionList[jj]).height - screenHeight)
        if minHeight == 0 then
          minHeight = searchHeight
          searchIndex = jj
        else
          if searchHeight < minHeight then
            minHeight = searchHeight
            searchIndex = jj
          end
        end
      end
    end
  end
  if searchIndex ~= 0 then
    screenResolutionIndex = searchIndex
    return 0
  end
  for ii = 1, self.SCREEN_RESOLUTION_COUNT do
    for jj = 1, self.SCREEN_RESOLUTION_COUNT do
      if (screenResolutionList[ii]).height == screenHeight and (screenResolutionList[ii]).height == (screenResolutionList[jj]).height then
        searchWidth = (math.abs)((screenResolutionList[jj]).width - screenWidth)
        if minWidth == 0 then
          minWidth = searchWidth
          searchIndex = jj
        else
          if searchWidth < minWidth then
            minWidth = searchWidth
            searchIndex = jj
          end
        end
      end
    end
  end
  if searchIndex ~= 0 then
    screenResolutionIndex = searchIndex
    return 0
  end
  for ii = 1, self.SCREEN_RESOLUTION_COUNT do
    for jj = 1, self.SCREEN_RESOLUTION_COUNT do
      if (screenResolutionList[ii]).width ~= screenWidth then
        searchWidth = (math.abs)((screenResolutionList[jj]).width - screenWidth)
        if minWidth == 0 then
          minWidth = searchWidth
          searchIndex = jj
        else
          if searchWidth < minWidth then
            minWidth = searchWidth
            searchIndex = jj
          end
        end
      end
    end
    for jj = 1, self.SCREEN_RESOLUTION_COUNT do
      if (screenResolutionList[searchIndex]).width == (screenResolutionList[jj]).width then
        searchHeight = (math.abs)((screenResolutionList[jj]).height - screenHeight)
        if minHeight == 0 then
          minHeight = searchHeight
          searchIndex = jj
        else
          if searchHeight < minHeight then
            minHeight = searchHeight
            searchIndex = jj
          end
        end
      end
    end
  end
  screenResolutionIndex = searchIndex
  return 0
end

GameOption_ScreenResolutionIncrease = function()
  -- function num : 0_82 , upvalues : frame_Display, chk_Option
  if not isOptionVariableAction() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ISOPTIONVARIABLEACTION_MEMO")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    ;
    (frame_Display._btn_ScrSize):EraseAllEffect()
    ;
    (frame_Display._btn_ScrSize):AddEffect("UI_ButtonLineRight_White", false, 0, 0)
    ;
    (frame_Display._btn_ScrSize):AddEffect("UI_ButtonLineRight_Blue", false, 0, 0)
    GameOption_SetCurrentScreenResolution(chk_Option.currentScreenResolutionIdx + 1)
  end
end

GameOption_ScreenResolutionDecrease = function()
  -- function num : 0_83 , upvalues : frame_Display, chk_Option
  if not isOptionVariableAction() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ISOPTIONVARIABLEACTION_MEMO")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    ;
    (frame_Display._btn_ScrSize):EraseAllEffect()
    ;
    (frame_Display._btn_ScrSize):AddEffect("UI_ButtonLineLeft_White", false, 0, 0)
    ;
    (frame_Display._btn_ScrSize):AddEffect("UI_ButtonLineLeft_Blue", false, 0, 0)
    GameOption_SetCurrentScreenResolution(chk_Option.currentScreenResolutionIdx - 1)
  end
end

local LUTRecommandation = -1
local LUTRecommandation2 = -1
local LUTRecommandationName = "Vibrance"
local LUTRecommandationName2 = "NonContrast"
GameOption_InitLUT = function(LUT)
  -- function num : 0_84 , upvalues : chk_Option
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.currentLUT = LUT
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.savedLUT = LUT
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.appliedLUT = LUT
  GameOption_SetLUTText(LUT)
end

GameOption_SetRecommandationLUT = function()
  -- function num : 0_85 , upvalues : LUTRecommandation, LUTRecommandationName, frame_Display
  if LUTRecommandation == -1 then
    for idx = 0, 30 do
      if getCameraLUTFilterName(idx) == LUTRecommandationName then
        LUTRecommandation = idx
        break
      end
    end
  end
  do
    local _contrastValue = 0.7
    if LUTRecommandation ~= -1 then
      GameOption_SetCurrentLUT(LUTRecommandation)
      GameOption_SetContrast(_contrastValue)
      ;
      (frame_Display._slide_Contrast):SetControlPos(_contrastValue * 100)
    end
  end
end

GameOption_SetRecommandationLUT2 = function()
  -- function num : 0_86 , upvalues : LUTRecommandation2, LUTRecommandationName2, frame_Display
  if LUTRecommandation2 == -1 then
    for idx = 0, 30 do
      if getCameraLUTFilterName(idx) == LUTRecommandationName2 then
        LUTRecommandation2 = idx
        break
      end
    end
  end
  do
    local _contrastValue = 0.5
    if LUTRecommandation2 ~= -1 then
      GameOption_SetCurrentLUT(LUTRecommandation2)
      GameOption_SetContrast(_contrastValue)
      ;
      (frame_Display._slide_Contrast):SetControlPos(_contrastValue * 100)
    end
  end
end

GameOption_SetCurrentLUT = function(LUT)
  -- function num : 0_87 , upvalues : chk_Option, currentLUT
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.currentLUT = LUT
  GameOption_SetLUTText(LUT)
  setCameraLUTFilter(LUT)
  currentLUT = LUT
end

GameOption_SetLUTText = function(LUT)
  -- function num : 0_88 , upvalues : LUTRecommandationName, LUTRecommandationName2, frame_Display
  local filterName = getCameraLUTFilterName(LUT)
  if filterName == LUTRecommandationName or filterName == LUTRecommandationName2 then
    (frame_Display._btn_LUT):SetText(filterName .. "  <PAColor0xffffce22>[" .. PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_RECOMMANDATION") .. "]<PAOldColor>")
  else
    ;
    (frame_Display._btn_LUT):SetText(filterName)
  end
end

GameOption_LUTIncrease = function()
  -- function num : 0_89 , upvalues : frame_Display, chk_Option
  (frame_Display._btn_LUT):EraseAllEffect()
  ;
  (frame_Display._btn_LUT):AddEffect("UI_ButtonLineRight_White", false, 0, 0)
  ;
  (frame_Display._btn_LUT):AddEffect("UI_ButtonLineRight_Blue", false, 0, 0)
  GameOption_SetCurrentLUT(chk_Option.currentLUT + 1)
end

GameOption_LUTDecrease = function()
  -- function num : 0_90 , upvalues : frame_Display, chk_Option
  (frame_Display._btn_LUT):EraseAllEffect()
  ;
  (frame_Display._btn_LUT):AddEffect("UI_ButtonLineLeft_White", false, 0, 0)
  ;
  (frame_Display._btn_LUT):AddEffect("UI_ButtonLineLeft_Blue", false, 0, 0)
  GameOption_SetCurrentLUT(chk_Option.currentLUT - 1)
end

GameOption_InitTextureQuality = function(textureQualityIdx)
  -- function num : 0_91 , upvalues : chk_Option
  local self = chk_Option
  if textureQualityIdx >= 0 and textureQualityIdx < self.TEXTURE_QUALITY_COUNT then
    self.currentTextureQualityIdx = textureQualityIdx
    self.savedTextureQualityIdx = textureQualityIdx
    self.appliedTextureQualityIdx = textureQualityIdx
  end
end

GameOption_SetCurrentTextureQuality = function(textureQualityIdx)
  -- function num : 0_92 , upvalues : chk_Option
  local self = chk_Option
  if textureQualityIdx >= 0 and textureQualityIdx < self.TEXTURE_QUALITY_COUNT then
    self.currentTextureQualityIdx = textureQualityIdx
    GameOption_SetTextureQualityText(textureQualityIdx)
  end
  GameOption_UpdateOptionChanged()
end

GameOption_SetTextureQualityText = function(textureQualityIdx)
  -- function num : 0_93 , upvalues : chk_Option, frame_Display
  if textureQualityIdx == chk_Option.TEXTURE_QUALITY_HIGH then
    (frame_Display._btn_Trxt):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_HIGH"))
  else
    if textureQualityIdx == chk_Option.TEXTURE_QUALITY_NORMAL then
      (frame_Display._btn_Trxt):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_MIDDLE"))
    else
      if textureQualityIdx == chk_Option.TEXTURE_QUALITY_LOW then
        (frame_Display._btn_Trxt):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_LOW"))
      end
    end
  end
end

GameOption_TextureQualityIncrease = function()
  -- function num : 0_94 , upvalues : frame_Display, chk_Option
  if not isOptionVariableAction() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ISOPTIONVARIABLEACTION_MEMO")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    ;
    (frame_Display._btn_Trxt):EraseAllEffect()
    ;
    (frame_Display._btn_Trxt):AddEffect("UI_ButtonLineRight_White", false, 0, 0)
    ;
    (frame_Display._btn_Trxt):AddEffect("UI_ButtonLineRight_Blue", false, 0, 0)
    local self = chk_Option
    local texQuality = self.currentTextureQualityIdx - 1
    if texQuality < 0 then
      texQuality = 0
    end
    local validTexQuality = getValidTextureQuality()
    if texQuality < validTexQuality then
      MessageBox_TextureQualityAlert()
      return 
    end
    GameOption_SetCurrentTextureQuality(texQuality)
  end
end

GameOption_TextureQualityDecrease = function()
  -- function num : 0_95 , upvalues : frame_Display, chk_Option
  if not isOptionVariableAction() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ISOPTIONVARIABLEACTION_MEMO")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    ;
    (frame_Display._btn_Trxt):EraseAllEffect()
    ;
    (frame_Display._btn_Trxt):AddEffect("UI_ButtonLineLeft_White", false, 0, 0)
    ;
    (frame_Display._btn_Trxt):AddEffect("UI_ButtonLineLeft_Blue", false, 0, 0)
    local self = chk_Option
    GameOption_SetCurrentTextureQuality(self.currentTextureQualityIdx + 1)
  end
end

GameOption_TextureQualityApply = function()
  -- function num : 0_96 , upvalues : chk_Option
  local self = chk_Option
  local texQuality = self.currentTextureQualityIdx - 1
  GameOption_SetCurrentTextureQuality(texQuality)
end

MessageBox_TextureQualityAlert = function()
  -- function num : 0_97
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TEXTUREQUALITYALERT_MEMO")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionYes = GameOption_TextureQualityApply, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

GameOption_InitGraphicOption = function(graphicOptionIdx)
  -- function num : 0_98 , upvalues : chk_Option
  local self = chk_Option
  if graphicOptionIdx >= 0 and graphicOptionIdx < self.GRAPHIC_OPTION_COUNT then
    self.currentGraphicOptionIdx = graphicOptionIdx
    self.savedGraphicOptionIdx = graphicOptionIdx
    self.appliedGraphicOptionIdx = graphicOptionIdx
  end
end

GameOption_SetCurrentGraphicOption = function(graphicOptionIdx)
  -- function num : 0_99 , upvalues : chk_Option
  local self = chk_Option
  if graphicOptionIdx >= 0 and graphicOptionIdx < self.GRAPHIC_OPTION_COUNT then
    self.currentGraphicOptionIdx = graphicOptionIdx
    GameOption_SetGraphicOptionText(graphicOptionIdx)
  end
  GameOption_GraphicChanged()
  GameOption_UpdateOptionChanged()
end

GameOption_SetGraphicOptionText = function(graphicOptionIdx)
  -- function num : 0_100 , upvalues : chk_Option, frame_Display
  if graphicOptionIdx == chk_Option.GRAPHIC_OPTION_HIGH0 then
    (frame_Display._btn_Rndr):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_VERYHIGH"))
  else
    if graphicOptionIdx == chk_Option.GRAPHIC_OPTION_HIGH1 then
      (frame_Display._btn_Rndr):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_HIGH"))
    else
      if graphicOptionIdx == chk_Option.GRAPHIC_OPTION_NORMAL0 then
        (frame_Display._btn_Rndr):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_MIDDLEHIGH"))
      else
        if graphicOptionIdx == chk_Option.GRAPHIC_OPTION_NORMAL1 then
          (frame_Display._btn_Rndr):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_MIDDLE"))
        else
          if graphicOptionIdx == chk_Option.GRAPHIC_OPTION_LOW0 then
            (frame_Display._btn_Rndr):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_LOW"))
          else
            if graphicOptionIdx == chk_Option.GRAPHIC_OPTION_LOW1 then
              (frame_Display._btn_Rndr):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_VERYLOW"))
            else
              if graphicOptionIdx == chk_Option.GRAPHIC_OPTION_VERYLOW then
                (frame_Display._btn_Rndr):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_OPTION_FASTMODE"))
              end
            end
          end
        end
      end
    end
  end
end

GameOption_GraphicOptionIncrease = function()
  -- function num : 0_101 , upvalues : chk_Option, frame_Display
  if not isOptionVariableAction() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ISOPTIONVARIABLEACTION_MEMO")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    local self = chk_Option
    ;
    (frame_Display._btn_Rndr):EraseAllEffect()
    ;
    (frame_Display._btn_Rndr):AddEffect("UI_ButtonLineRight_White", false, 0, 0)
    ;
    (frame_Display._btn_Rndr):AddEffect("UI_ButtonLineRight_Blue", false, 0, 0)
    local nextIndex = self.currentGraphicOptionIdx - 1
    if nextIndex ~= chk_Option.GRAPHIC_OPTION_VERYLOW then
      self.currentCheckAA = true
      ;
      (frame_Display._btn_AntiAlli):SetCheck(self.currentCheckAA)
      self.currentCheckSSAO = true
      ;
      (frame_Display._btn_SSAO):SetCheck(self.currentCheckSSAO)
    end
    if nextIndex <= chk_Option.GRAPHIC_OPTION_NORMAL0 then
      self.currentCheckDof = true
      ;
      (frame_Display._btn_DOF):SetCheck(self.currentCheckDof)
    end
    if nextIndex <= chk_Option.GRAPHIC_OPTION_HIGH1 then
      self.currentCheckTessellation = true
      ;
      (frame_Display._btn_Tessellation):SetCheck(self.currentCheckTessellation)
    end
    GameOption_SetCurrentGraphicOption(nextIndex)
  end
end

GameOption_GraphicOptionDecrease = function()
  -- function num : 0_102 , upvalues : chk_Option, frame_Display
  if not isOptionVariableAction() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ISOPTIONVARIABLEACTION_MEMO")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    local self = chk_Option
    ;
    (frame_Display._btn_Rndr):EraseAllEffect()
    ;
    (frame_Display._btn_Rndr):AddEffect("UI_ButtonLineLeft_White", false, 0, 0)
    ;
    (frame_Display._btn_Rndr):AddEffect("UI_ButtonLineLeft_Blue", false, 0, 0)
    local nextIndex = self.currentGraphicOptionIdx + 1
    if nextIndex == chk_Option.GRAPHIC_OPTION_VERYLOW then
      self.currentCheckAA = false
      ;
      (frame_Display._btn_AntiAlli):SetCheck(self.currentCheckAA)
      self.currentCheckSSAO = false
      ;
      (frame_Display._btn_SSAO):SetCheck(self.currentCheckSSAO)
    end
    if chk_Option.GRAPHIC_OPTION_NORMAL0 < nextIndex then
      self.currentCheckDof = false
      ;
      (frame_Display._btn_DOF):SetCheck(self.currentCheckDof)
    end
    if chk_Option.GRAPHIC_OPTION_HIGH1 < nextIndex then
      self.currentCheckTessellation = false
      ;
      (frame_Display._btn_Tessellation):SetCheck(self.currentCheckTessellation)
    end
    GameOption_SetCurrentGraphicOption(nextIndex)
  end
end

GameOption_InitGraphicCustomOption = function(gameOptionSetting)
  -- function num : 0_103 , upvalues : chk_Option
  local self = chk_Option
  local dof = gameOptionSetting:getDof()
  self.currentCheckDof = dof
  self.appliedCheckDof = dof
  self.savedCheckDof = dof
  local aa = gameOptionSetting:getAntiAliasing()
  self.currentCheckAA = aa
  self.appliedCheckAA = aa
  self.savedCheckAA = aa
  local ul = gameOptionSetting:getGraphicUltra()
  self.currentCheckUltra = ul
  self.appliedCheckUltra = ul
  self.savedCheckUltra = ul
  local lb = gameOptionSetting:getLensBlood()
  self.currentCheckLensBlood = lb
  self.appliedCheckLensBlood = lb
  self.savedCheckLensBlood = lb
  local be = gameOptionSetting:getBloodEffect() == 2
  self.currentCheckBloodEffect = be
  self.appliedCheckBloodEffect = be
  self.savedCheckBloodEffect = be
  local re = gameOptionSetting:getRepresentative()
  self.currentCheckRepresent = re
  self.appliedCheckRepresent = re
  self.savedCheckRepresent = re
  local snowpool = gameOptionSetting:getSnowPoolOnlyInSafeZone()
  self.currentCheckSnowPoolOnlyInSafeZone = snowpool
  self.appliedCheckSnowPoolOnlyInSafeZone = snowpool
  self.savedCheckSnowPoolOnlyInSafeZone = snowpool
  local ssao = gameOptionSetting:getSSAO()
  self.currentCheckSSAO = ssao
  self.appliedCheckSSAO = ssao
  self.savedCheckSSAO = ssao
  local tess = gameOptionSetting:getTessellation()
  self.currentCheckTessellation = tess
  self.appliedCheckTessellation = tess
  self.savedCheckTessellation = tess
  local fi = gameOptionSetting:getPostFilter() == 2
  self.currentCheckPostFilter = fi
  self.appliedCheckPostFilter = fi
  self.savedCheckPostFilter = fi
  do
    local ce = gameOptionSetting:getCharacterEffect()
    self.currentCheckCharacterEffect = ce
    self.appliedCheckCharacterEffect = ce
    self.savedCheckCharacterEffect = ce
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

GameOption_GraphicChanged = function()
  -- function num : 0_104 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  if self.currentCheckUltra then
    GameOption_SetGraphicOptionText(chk_Option.GRAPHIC_OPTION_HIGH0)
    ;
    (frame_Display._btn_Rndr):SetEnable(false)
    ;
    (frame_Display._btn_Rndr_L):SetEnable(false)
    ;
    (frame_Display._btn_Rndr_R):SetEnable(false)
    ;
    (frame_Display._btn_Rndr):SetMonoTone(true)
    ;
    (frame_Display._btn_Rndr_L):SetMonoTone(true)
    ;
    (frame_Display._btn_Rndr_R):SetMonoTone(true)
  else
    GameOption_SetGraphicOptionText(self.currentGraphicOptionIdx)
    ;
    (frame_Display._btn_Rndr):SetEnable(true)
    ;
    (frame_Display._btn_Rndr_L):SetEnable(true)
    ;
    (frame_Display._btn_Rndr_R):SetEnable(true)
    ;
    (frame_Display._btn_Rndr):SetMonoTone(false)
    ;
    (frame_Display._btn_Rndr_L):SetMonoTone(false)
    ;
    (frame_Display._btn_Rndr_R):SetMonoTone(false)
  end
  if self.currentGraphicOptionIdx < chk_Option.GRAPHIC_OPTION_VERYLOW or self.currentCheckUltra then
    (frame_Display._btn_SSAO):SetEnable(true)
    ;
    (frame_Display._btn_SSAO):SetMonoTone(false)
  else
    ;
    (frame_Display._btn_SSAO):SetEnable(false)
    ;
    (frame_Display._btn_SSAO):SetMonoTone(true)
  end
  if (self.currentGraphicOptionIdx < chk_Option.GRAPHIC_OPTION_NORMAL0 or self.currentCheckUltra) and getDX11Feature() then
    (frame_Display._btn_Tessellation):SetEnable(true)
    ;
    (frame_Display._btn_Tessellation):SetMonoTone(false)
  else
    ;
    (frame_Display._btn_Tessellation):SetEnable(false)
    ;
    (frame_Display._btn_Tessellation):SetMonoTone(true)
  end
end

GameOption_SetGraphicCustomOption = function()
  -- function num : 0_105 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  ;
  (frame_Display._btn_DOF):SetCheck(self.currentCheckDof)
  ;
  (frame_Display._btn_AntiAlli):SetCheck(self.currentCheckAA)
  ;
  (frame_Display._btn_Ultra):SetCheck(self.currentCheckUltra)
  ;
  (frame_Display._btn_LensBlood):SetCheck(self.currentCheckLensBlood)
  ;
  (frame_Display._btn_BloodEffect):SetCheck(self.currentCheckBloodEffect)
  ;
  (frame_Display._btn_SSAO):SetCheck(self.currentCheckSSAO)
  ;
  (frame_Display._btn_Tessellation):SetCheck(self.currentCheckTessellation)
  ;
  (frame_Display._btn_PostFilter):SetCheck(self.currentCheckPostFilter)
  ;
  (frame_Display._btn_CharacterEffect):SetCheck(self.currentCheckCharacterEffect)
  ;
  (frame_Display._btn_Represent):SetCheck(self.currentCheckRepresent)
  ;
  (frame_Display._btn_SnowPoolOnlyInSafeZone):SetCheck(self.currentCheckSnowPoolOnlyInSafeZone)
  GameOption_GraphicChanged()
end

GameOption_CheckDof = function()
  -- function num : 0_106 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_DOF):IsCheck()
  self.currentCheckDof = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckSelfPlayerOnlyEffect = function()
  -- function num : 0_107 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_SelfPlayerOnlyEffect):IsCheck()
  self.currentSelfPlayerOnlyEffect = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckNearestPlayerOnlyEffect = function()
  -- function num : 0_108 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_NearestPlayerOnlyEffect):IsCheck()
  self.currentNearestPlayerOnlyEffect = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckSelfPlayerOnlyLantern = function()
  -- function num : 0_109 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_SelfPlayerOnlyLantern):IsCheck()
  self.currentSelfPlayerOnlyLantern = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckLowPower = function()
  -- function num : 0_110 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_LowPower):IsCheck()
  self.currentLowPower = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckAA = function()
  -- function num : 0_111 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_AntiAlli):IsCheck()
  self.currentCheckAA = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckSSAO = function()
  -- function num : 0_112 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_SSAO):IsCheck()
  self.currentCheckSSAO = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckTessellation = function()
  -- function num : 0_113 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_Tessellation):IsCheck()
  self.currentCheckTessellation = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckPostFilter = function()
  -- function num : 0_114 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_PostFilter):IsCheck()
  self.currentCheckPostFilter = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckCharacterEffect = function()
  -- function num : 0_115 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_CharacterEffect):IsCheck()
  self.currentCheckCharacterEffect = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckUltra = function()
  -- function num : 0_116 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_Ultra):IsCheck()
  self.currentCheckUltra = check
  GameOption_GraphicChanged()
  GameOption_UpdateOptionChanged()
end

GameOption_CheckLensBlood = function()
  -- function num : 0_117 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_LensBlood):IsCheck()
  self.currentCheckLensBlood = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckBloodEffect = function()
  -- function num : 0_118 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_BloodEffect):IsCheck()
  self.currentCheckBloodEffect = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckRepresent = function()
  -- function num : 0_119 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_Represent):IsCheck()
  self.currentCheckRepresent = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckSnowPoolOnlyInSafeZone = function()
  -- function num : 0_120 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_SnowPoolOnlyInSafeZone):IsCheck()
  self.currentCheckSnowPoolOnlyInSafeZone = check
  GameOption_UpdateOptionChanged()
end

GameOption_RefreshFPSText = function()
  -- function num : 0_121 , upvalues : frame_Display
  local value = (math.floor)(ToClient_getFPS())
  if value < 20 then
    (frame_Display._txt_FPS):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FPS") .. ": " .. "<PAColor0xfff25221>" .. tostring(value) .. "<PAOldColor>")
  else
    ;
    (frame_Display._txt_FPS):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_FPS") .. ": " .. "<PAColor0xff00f281>" .. tostring(value) .. "<PAOldColor>")
  end
end

GameOption_CheckWorkerVisible = function()
  -- function num : 0_122 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_WorkerVisible):IsCheck()
  self.currentCheckWorkerVisible = check
  GameOption_UpdateOptionChanged()
end

GameOption_InitUpscale = function(isUpscaleEnable)
  -- function num : 0_123 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = isUpscaleEnable
  ;
  (frame_Display._btn_UpscaleEnable):SetCheck(check)
  self.currentUpscaleEnable = check
  self.savedUpscaleEnable = check
  self.appliedUpscaleEnable = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckUpscale = function()
  -- function num : 0_124 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_UpscaleEnable):IsCheck()
  self.currentUpscaleEnable = check
  GameOption_UpdateOptionChanged()
end

GameOption_InitCropMode = function(isEnable, scaleX, scaleY)
  -- function num : 0_125 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  ;
  (frame_Display._btn_CropModeEnable):SetCheck(isEnable)
  self.currentCropModeEnable = isEnable
  self.savedCropModeEnable = isEnable
  self.appliedCropModeEnable = isEnable
  self.currentCropModeScaleX = scaleX
  self.savedCropModeScaleX = scaleX
  self.appliedCropModeScaleX = scaleX
  self.currentCropModeScaleY = scaleY
  self.savedCropModeScaleY = scaleY
  self.appliedCropModeScaleY = scaleY
  ;
  (frame_Display._slide_CropModeScaleX):SetControlPos(scaleX * 200 - 100)
  ;
  (frame_Display._slide_CropModeScaleY):SetControlPos(scaleY * 200 - 100)
  GameOption_UpdateOptionChanged()
end

GameOption_CheckCropMode = function()
  -- function num : 0_126 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_CropModeEnable):IsCheck()
  self.currentCropModeEnable = check
  GameOption_UpdateOptionChanged()
end

GameOption_SetCropModeScaleX = function(scale)
  -- function num : 0_127 , upvalues : chk_Option
  local self = chk_Option
  local convertedScale = 0.5 + scale * 0.5
  self.currentCropModeScaleX = convertedScale
  self.appliedCropModeScaleX = self.currentCropModeScaleX
  setCropModeScaleX(convertedScale)
end

GameOption_CropModeScaleX_slider = function()
  -- function num : 0_128 , upvalues : frame_Display
  local ratio = (frame_Display._slide_CropModeScaleX):GetControlPos()
  GameOption_SetCropModeScaleX(ratio)
end

GameOption_CropModeScaleX_button = function()
  -- function num : 0_129 , upvalues : _btn_CropModeScaleX, frame_Display
  local ratio = _btn_CropModeScaleX:GetPosX() / ((frame_Display._slide_CropModeScaleX):GetSizeX() - _btn_CropModeScaleX:GetSizeX())
  GameOption_SetCropModeScaleX(ratio)
end

GameOption_SetCropModeScaleY = function(scale)
  -- function num : 0_130 , upvalues : chk_Option
  local self = chk_Option
  local convertedScale = 0.5 + scale * 0.5
  self.currentCropModeScaleY = convertedScale
  self.appliedCropModeScaleY = self.currentCropModeScaleY
  setCropModeScaleY(convertedScale)
end

GameOption_CropModeScaleY_slider = function()
  -- function num : 0_131 , upvalues : frame_Display
  local ratio = (frame_Display._slide_CropModeScaleY):GetControlPos()
  GameOption_SetCropModeScaleY(ratio)
end

GameOption_CropModeScaleY_button = function()
  -- function num : 0_132 , upvalues : _btn_CropModeScaleY, frame_Display
  local ratio = _btn_CropModeScaleY:GetPosX() / ((frame_Display._slide_CropModeScaleY):GetSizeX() - _btn_CropModeScaleY:GetSizeX())
  GameOption_SetCropModeScaleY(ratio)
end

GameOption_InitAutoOptimization = function(isEnable, frame)
  -- function num : 0_133 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  ;
  (frame_Display._btn_AutoOptimization):SetCheck(isEnable)
  self.currentAutoOptimization = isEnable
  self.savedAutoOptimization = isEnable
  self.appliedAutoOptimization = isEnable
  self.currentOptimizationFrame = frame
  self.savedOptimizationFrame = frame
  self.appliedOptimizationFrame = frame
  ;
  (frame_Display._slide_AutoOptimization):SetControlPos(frame / 60 * 100)
  ;
  (frame_Display._slideText_FrameRate):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_OPTION_AUTOOPTIMIZATION_SET_FPS", "fps", (math.floor)(frame)))
  GameOption_UpdateOptionChanged()
end

GameOption_CheckAutoOptimization = function()
  -- function num : 0_134 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local check = (frame_Display._btn_AutoOptimization):IsCheck()
  self.currentAutoOptimization = check
  GameOption_UpdateOptionChanged()
end

GameOption_AutoOptimizationSetFrame = function(ratio)
  -- function num : 0_135 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  local convertedFrame = (math.ceil)(ratio * 60)
  ;
  (frame_Display._slideText_FrameRate):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_OPTION_AUTOOPTIMIZATION_SET_FPS", "fps", convertedFrame))
  self.currentOptimizationFrame = convertedFrame
  if self.appliedAutoOptimization then
    setAutoOptimizationFrameLimit(convertedFrame)
  end
  GameOption_UpdateOptionChanged()
end

GameOption_AutoOptimization_slider = function()
  -- function num : 0_136 , upvalues : frame_Display
  local ratio = (frame_Display._slide_AutoOptimization):GetControlPos()
  GameOption_AutoOptimizationSetFrame(ratio)
end

GameOption_InitCameraPos = function(posPowerValue)
  -- function num : 0_137 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  self.currentCheckCameraPosPower = posPowerValue
  self.savedCheckCameraPosPower = posPowerValue
  self.appliedCheckCameraPosPower = posPowerValue
  ;
  (frame_Display._slide_CameraPos):SetControlPos(posPowerValue * 100)
end

GameOption_SetCameraPosValueText = function(posPowerValue)
  -- function num : 0_138 , upvalues : frame_Display, GetStr_Option
  local value = (math.floor)(posPowerValue * 100 + 0.5 - 50)
  ;
  (frame_Display._txt_CameraPos):SetText(GetStr_Option[22] .. " ( <PAColor0xffbcf281>" .. tostring(value) .. "% <PAOldColor>) ")
end

GameOption_InitCameraFov = function(fovPowerValue)
  -- function num : 0_139 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  self.currentCheckCameraFovPower = fovPowerValue
  self.savedCheckCameraFovPower = fovPowerValue
  self.appliedCheckCameraFovPower = fovPowerValue
  ;
  (frame_Display._slide_CameraFov):SetControlPos(fovPowerValue * 100)
end

GameOption_SetCameraFovValueText = function(fovPowerValue)
  -- function num : 0_140 , upvalues : frame_Display, GetStr_Option
  local value = (math.floor)(posPowerValue * 100 + 0.5 - 50)
  ;
  (frame_Display._txt_CameraFov):SetText(GetStr_Option[23] .. " ( <PAColor0xffbcf281>" .. tostring(value) .. "% <PAOldColor>) ")
end

GameOption_InitGamma = function(gammaValue)
  -- function num : 0_141 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  self.currentGammaValue = gammaValue
  self.savedGammaValue = gammaValue
  self.appliedGammaValue = gammaValue
  ;
  (frame_Display._slide_Gamma):SetControlPos(gammaValue * 100)
end

GameOption_SetGammaValueText = function(gammaValue)
  -- function num : 0_142 , upvalues : frame_Display, GetStr_Option
  local value = (math.floor)(gammaValue * 100 + 0.5 - 50)
  ;
  (frame_Display._txt_Gamma):SetText(GetStr_Option[4] .. " ( <PAColor0xffbcf281>" .. tostring(value) .. "% <PAOldColor>) ")
end

GameOption_SetGamma = function(gammaValue)
  -- function num : 0_143 , upvalues : chk_Option
  local self = chk_Option
  self.currentGammaValue = gammaValue
  GameOption_SetGammaValueText(gammaValue)
  setGammaValue(gammaValue)
  GameOption_UpdateOptionChanged()
end

GameOption_ChangeGamma_slider = function()
  -- function num : 0_144 , upvalues : frame_Display
  local ratio = (frame_Display._slide_Gamma):GetControlPos()
  GameOption_SetGamma(ratio)
end

GameOption_ChangeGamma_button = function()
  -- function num : 0_145 , upvalues : _btn_Gamma, frame_Display
  local ratio = _btn_Gamma:GetPosX() / ((frame_Display._slide_Gamma):GetSizeX() - _btn_Gamma:GetSizeX())
  GameOption_SetGamma(ratio)
end

GameOption_InitContrast = function(contrastValue)
  -- function num : 0_146 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  self.currentContrastValue = contrastValue
  self.savedContrastValue = contrastValue
  self.appliedContrastValue = contrastValue
  ;
  (frame_Display._slide_Contrast):SetControlPos(contrastValue * 100)
end

GameOption_SetContrastValueText = function(contrastValue)
  -- function num : 0_147 , upvalues : frame_Display, GetStr_Option
  local value = (math.floor)(contrastValue * 100 + 0.5 - 50)
  ;
  (frame_Display._txt_Contrast):SetText(GetStr_Option[21] .. " ( <PAColor0xffbcf281>" .. tostring(value) .. "% <PAOldColor>) ")
end

GameOption_SetContrast = function(contrastValue)
  -- function num : 0_148 , upvalues : chk_Option
  local self = chk_Option
  self.currentContrastValue = contrastValue
  GameOption_SetContrastValueText(contrastValue)
  setContrastValue(contrastValue)
  GameOption_UpdateOptionChanged()
end

GameOption_ChangeContrast_slider = function()
  -- function num : 0_149 , upvalues : frame_Display
  local ratio = (frame_Display._slide_Contrast):GetControlPos()
  GameOption_SetContrast(ratio)
end

GameOption_ChangeContrast_button = function()
  -- function num : 0_150 , upvalues : _btn_Contrast, frame_Display
  local ratio = _btn_Contrast:GetPosX() / ((frame_Display._slide_Contrast):GetSizeX() - _btn_Contrast:GetSizeX())
  GameOption_SetContrast(ratio)
end

GameOption_InitFov = function(fovValue)
  -- function num : 0_151 , upvalues : chk_Option, frame_Display
  local self = chk_Option
  self.currentFovValue = fovValue
  self.savedFovValue = fovValue
  self.appliedFovValue = fovValue
  if fovValue < 40 then
    fovValue = 40
  else
    if fovValue > 70 then
      fovValue = 70
    end
  end
  local sliderValue = (fovValue - 40) / 30 * 100
  ;
  (frame_Display._slide_Fov):SetControlPos(sliderValue)
end

GameOption_SetFovValueText = function(fovValue)
  -- function num : 0_152 , upvalues : frame_Display, GetStr_Option
  local value = (math.floor)(fovValue + 0.5)
  ;
  (frame_Display._txt_Fov):SetText(GetStr_Option[24] .. " ( <PAColor0xffbcf281>" .. tostring(value) .. " <PAOldColor>) ")
end

GameOption_SetFov = function(fovValue)
  -- function num : 0_153 , upvalues : chk_Option
  local self = chk_Option
  self.currentFovValue = fovValue
  GameOption_SetFovValueText(fovValue)
  setFov(fovValue)
  GameOption_UpdateOptionChanged()
end

GameOption_ChangeFov_slider = function()
  -- function num : 0_154 , upvalues : frame_Display
  local fov = 40 + 30 * (frame_Display._slide_Fov):GetControlPos()
  GameOption_SetFov(fov)
end

GameOption_ChangeFov_button = function()
  -- function num : 0_155 , upvalues : _btn_Fov, frame_Display
  local ratio = _btn_Fov:GetPosX() / ((frame_Display._slide_Fov):GetSizeX() - _btn_Fov:GetSizeX())
  local fov = 40 + 30 * ratio
  GameOption_SetFov(fov)
end

;
(frame_Display._slide_UIScale):SetInterval(150)
GameOption_SetUIMode = function(uiScale)
  -- function num : 0_156 , upvalues : scaleRangeTable, frame_Display, GetStr_Option
  local uiScale_Slider = uiScale
  local uiScale_Percent = (math.floor)(uiScale * 100)
  local interval = scaleRangeTable.maxScaleValue - scaleRangeTable.minScaleValue
  ;
  (frame_Display._slide_UIScale):SetControlPos((uiScale_Percent - scaleRangeTable.minScaleValue) / interval * 100)
  ;
  (frame_Display._txt_UIScale):SetText(GetStr_Option[5] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", uiScale_Percent) .. "% <PAOldColor>)")
end

GameOption_UIScale_Change = function()
  -- function num : 0_157 , upvalues : frame_Display, scaleRangeTable, chk_Option, GetStr_Option
  local slide_posX = (frame_Display._slide_UIScale):GetControlPos()
  local interval = scaleRangeTable.maxScaleValue - scaleRangeTable.minScaleValue
  ;
  (frame_Display._txt_UIScaleLow):SetText(tostring(scaleRangeTable.minScaleValue))
  ;
  (frame_Display._txt_UIScaleMidle):SetText(tostring(scaleRangeTable.minScaleValue + interval * 0.5))
  ;
  (frame_Display._txt_UIScaleHigh):SetText(tostring(scaleRangeTable.maxScaleValue))
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

  chk_Option.currentCheckUIScale = (scaleRangeTable.minScaleValue + interval * slide_posX) * 0.01
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R2 in 'UnsetPending'

  chk_Option.currentCheckUIScale = (math.floor)((chk_Option.currentCheckUIScale + 0.002) * 100) / 100
  ;
  (frame_Display._txt_UIScale):SetText(GetStr_Option[5] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", chk_Option.currentCheckUIScale * 100) .. "% <PAOldColor>)")
end

GameOption_InitSystemNotify = function()
  -- function num : 0_158 , upvalues : frame_Game
  (frame_Game._btn_Alert_Region):SetCheck(ToClient_GetMessageFilter(0))
  ;
  (frame_Game._btn_Alert_TerritoryTrade):SetCheck(ToClient_GetMessageFilter(1))
  ;
  (frame_Game._btn_Alert_RoyalTrade):SetCheck(ToClient_GetMessageFilter(2))
  ;
  (frame_Game._btn_Alert_Fitness):SetCheck(ToClient_GetMessageFilter(3))
  ;
  (frame_Game._btn_Alert_TerritoryWar):SetCheck(ToClient_GetMessageFilter(4))
  ;
  (frame_Game._btn_Alert_GuildWar):SetCheck(ToClient_GetMessageFilter(5))
  ;
  (frame_Game._btn_Alert_PlayerGotItem):SetCheck(ToClient_GetMessageFilter(6))
  ;
  (frame_Game._btn_Alert_ItemMarket):SetCheck(ToClient_GetMessageFilter(7))
  ;
  (frame_Game._btn_Alert_LifeLevUp):SetCheck(ToClient_GetMessageFilter(8))
  ;
  (frame_Game._btn_Alert_GuildQuest):SetCheck(ToClient_GetMessageFilter(9))
  ;
  (frame_Game._btn_Alert_NearMonster):SetCheck(ToClient_GetMessageFilter(10))
  ;
  (frame_Game._btn_Alert_ServantMarket):SetCheck(ToClient_GetMessageFilter(11))
end

GameOption_InitSound = function(enableMusic, enableSound, enableEnvSound, hitFxType, masterVolume, fxVolume, dlgVolume, envVolume, musicVolume, hitFxWeight, otherPlayerVolume, riddingMusic, combatMusic, whisperMusic, TraySound, npcVoiceType)
  -- function num : 0_159 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  self.currentMaster = masterVolume
  self.appliedMaster = masterVolume
  self.savedMaster = masterVolume
  self.currentMusic = musicVolume
  self.appliedMusic = musicVolume
  self.savedMusic = musicVolume
  self.currentFxSound = fxVolume
  self.appliedFxSound = fxVolume
  self.savedFxSound = fxVolume
  self.currentEnvSound = envVolume
  self.appliedEnvSound = envVolume
  self.savedEnvSound = envVolume
  self.currentDlgSound = dlgVolume
  self.appliedDlgSound = dlgVolume
  self.savedDlgSound = dlgVolume
  self.currentCheckMusic = enableMusic
  self.appliedCheckMusic = enableMusic
  self.savedCheckMusic = enableMusic
  self.currentCheckSound = enableSound
  self.appliedCheckSound = enableSound
  self.savedCheckSound = enableSound
  self.currentCheckEnvSound = enableEnvSound
  self.appliedCheckEnvSound = enableEnvSound
  self.savedCheckEnvSound = enableEnvSound
  self.currentCheckRiddingMusic = riddingMusic
  self.appliedCheckRiddingMusic = riddingMusic
  self.savedCheckRiddingMusic = riddingMusic
  self.currentCheckWhisperMusic = whisperMusic
  self.appliedCheckWhisperMusic = whisperMusic
  self.savedCheckWhisperMusic = whisperMusic
  self.currentCheckTraySoundOnOff = TraySound
  self.appliedCheckTraySoundOnOff = TraySound
  self.savedCheckTraySoundOnOff = TraySound
  self.currentHitFxWeight = hitFxWeight
  self.appliedHitFxWeight = hitFxWeight
  self.savedHitFxWeight = hitFxWeight
  self.currentPlayerVolume = otherPlayerVolume
  self.appliedPlayerVolume = otherPlayerVolume
  self.savedPlayerVolume = otherPlayerVolume
  self.currentCheckCombatMusic = combatMusic
  self.appliedCheckCombatMusic = combatMusic
  self.savedCheckCombatMusic = combatMusic
  self.currentCheckNpcVoice = npcVoiceType
  self.appliedCheckNpcVoice = npcVoiceType
  self.savedCheckNpcVoice = npcVoiceType
  ;
  (frame_Sound._slide_TotalVol):SetControlPos(masterVolume)
  ;
  (frame_Sound._slide_MusicVol):SetControlPos(musicVolume)
  ;
  (frame_Sound._slide_FxVol):SetControlPos(fxVolume)
  ;
  (frame_Sound._slide_EnvFxVol):SetControlPos(envVolume)
  ;
  (frame_Sound._slide_VoiceVol):SetControlPos(dlgVolume)
  ;
  (frame_Sound._slide_hitFxWeightVolume):SetControlPos(hitFxWeight)
  ;
  (frame_Sound._slide_otherPlayerVolume):SetControlPos(otherPlayerVolume)
  ;
  (frame_Sound._btn_MusicOnOff):SetCheck(enableMusic)
  ;
  (frame_Sound._btn_FXOnOff):SetCheck(enableSound)
  ;
  (frame_Sound._btn_EnvFXOnOff):SetCheck(enableEnvSound)
  ;
  (frame_Sound._btn_RiddingOnOff):SetCheck(riddingMusic)
  ;
  (frame_Sound._btn_WhisperOnOff):SetCheck(whisperMusic)
  ;
  (frame_Sound._btn_TraySoundOnOff):SetCheck(TraySound)
  ;
  (frame_Sound._btn_CombatAllwaysOff):SetCheck((CppEnums.BattleSoundType).Sound_NotUse == combatMusic)
  ;
  (frame_Sound._btn_CombatAllwaysOn):SetCheck((CppEnums.BattleSoundType).Sound_Always == combatMusic)
  ;
  (frame_Sound._btn_CombatAllwaysLowOff):SetCheck((CppEnums.BattleSoundType).Sound_Nomal == combatMusic)
  if (CppEnums.ServiceResourceType).eServiceResourceType_KR ~= npcVoiceType then
    (frame_Sound._btn_NpcVoice1):SetCheck(not isGameTypeKorea())
    ;
    (frame_Sound._btn_NpcVoice2):SetCheck((CppEnums.ServiceResourceType).eServiceResourceType_JP == npcVoiceType)
    ;
    (frame_Sound._btn_NpcVoice3):SetCheck((CppEnums.ServiceResourceType).eServiceResourceType_EN == npcVoiceType)
    if (CppEnums.ServiceResourceType).eServiceResourceType_JP ~= npcVoiceType then
      (frame_Sound._btn_NpcVoice1):SetCheck(not isGameTypeJapan())
      ;
      (frame_Sound._btn_NpcVoice2):SetCheck((CppEnums.ServiceResourceType).eServiceResourceType_KR == npcVoiceType)
      ;
      (frame_Sound._btn_NpcVoice3):SetCheck((CppEnums.ServiceResourceType).eServiceResourceType_EN == npcVoiceType)
      if (CppEnums.ServiceResourceType).eServiceResourceType_EN ~= npcVoiceType then
        (frame_Sound._btn_NpcVoice1):SetCheck(isGameTypeRussia() and not isGameTypeEnglish())
        ;
        (frame_Sound._btn_NpcVoice2):SetCheck((CppEnums.ServiceResourceType).eServiceResourceType_JP == npcVoiceType)
        ;
        (frame_Sound._btn_NpcVoice3):SetCheck((CppEnums.ServiceResourceType).eServiceResourceType_KR == npcVoiceType)
        if (CppEnums.ServiceResourceType).eServiceResourceType_TW ~= npcVoiceType then
          do
            (frame_Sound._btn_NpcVoice1):SetCheck(not isGameTypeTaiwan())
            ;
            (frame_Sound._btn_NpcVoice2):SetCheck((CppEnums.ServiceResourceType).eServiceResourceType_JP == npcVoiceType)
            ;
            (frame_Sound._btn_NpcVoice3):SetCheck((CppEnums.ServiceResourceType).eServiceResourceType_KR == npcVoiceType)
            _PA_LOG("LUA", "�\173 국가 리소스가 추가되면 �\180 곳도 수정 판단 해주어야합니�\164.")
            -- DECOMPILER ERROR: 21 unprocessed JMP targets
          end
        end
      end
    end
  end
end

GameOption_SetVolumeText = function(masterVolume, fxVolume, dlgVolume, envVolume, musicVolume, hitFxVolume, hitFxWeight, otherplayerVolume)
  -- function num : 0_160 , upvalues : frame_Sound, GetStr_Option
  local master = (math.floor)(masterVolume + 0.5)
  local music = (math.floor)(musicVolume + 0.5)
  local fx = (math.floor)(fxVolume + 0.5)
  local env = (math.floor)(envVolume + 0.5)
  local dlg = (math.floor)(dlgVolume + 0.5)
  local hitFx = (math.floor)(hitFxVolume + 0.5)
  local hitFxW = (math.floor)(hitFxWeight + 0.5)
  local otherVolume = (math.floor)(otherplayerVolume + 0.5)
  ;
  (frame_Sound._txt_TotalVol):SetText(GetStr_Option[6] .. " ( <PAColor0xffbcf281>" .. master .. "% <PAOldColor>)")
  ;
  (frame_Sound._txt_MusicVol):SetText(GetStr_Option[7] .. " ( <PAColor0xffbcf281>" .. music .. "% <PAOldColor>)")
  ;
  (frame_Sound._txt_FxVol):SetText(GetStr_Option[8] .. " ( <PAColor0xffbcf281>" .. fx .. "% <PAOldColor>)")
  ;
  (frame_Sound._txt_EnvFxVol):SetText(GetStr_Option[9] .. " ( <PAColor0xffbcf281>" .. env .. "% <PAOldColor>)")
  ;
  (frame_Sound._txt_VoiceVol):SetText(GetStr_Option[10] .. " ( <PAColor0xffbcf281>" .. dlg .. "% <PAOldColor>)")
  ;
  (frame_Sound._txt_hitFxVolume):SetText(GetStr_Option[18] .. " ( <PAColor0xffbcf281>" .. hitFx .. "% <PAOldColor>)")
  ;
  (frame_Sound._txt_hitFxWeightVolume):SetText(GetStr_Option[19] .. " ( <PAColor0xffbcf281>" .. hitFxW .. "% <PAOldColor>)")
  ;
  (frame_Sound._txt_otherPlayerVolume):SetText(GetStr_Option[20] .. " ( <PAColor0xffbcf281>" .. otherVolume .. "% <PAOldColor>)")
end

GameOption_SetVolume = function(masterVolume, fxVolume, dlgVolume, envVolume, musicVolume, hitFxVolume, hitFxWeight, otherVolume)
  -- function num : 0_161 , upvalues : chk_Option, _volumeParam
  local self = chk_Option
  self.currentMaster = masterVolume
  self.currentMusic = musicVolume
  self.currentFxSound = fxVolume
  self.currentEnvSound = envVolume
  self.currentDlgSound = dlgVolume
  self.currentHitFxVolume = hitFxVolume
  self.currentHitFxWeight = hitFxWeight
  self.currentPlayerVolume = otherVolume
  GameOption_SetVolumeText(masterVolume, fxVolume, dlgVolume, envVolume, musicVolume, hitFxVolume, hitFxWeight, otherVolume)
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R9 in 'UnsetPending'

  _volumeParam.master = masterVolume
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R9 in 'UnsetPending'

  _volumeParam.fx = fxVolume
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R9 in 'UnsetPending'

  _volumeParam.dlg = dlgVolume
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R9 in 'UnsetPending'

  _volumeParam.env = envVolume
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R9 in 'UnsetPending'

  _volumeParam.music = musicVolume
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R9 in 'UnsetPending'

  _volumeParam.hitFx = hitFxVolume
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R9 in 'UnsetPending'

  _volumeParam.otherPlayerVolume = otherVolume
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R9 in 'UnsetPending'

  _volumeParam.hitFxWeight = hitFxWeight
  setVolumeParam(_volumeParam)
  GameOption_UpdateOptionChanged()
end

GameOption_SetEnableSound = function(enableMusic, enableSound, enableEnvSound, hitFxType)
  -- function num : 0_162 , upvalues : chk_Option
  local self = chk_Option
  self.currentCheckMusic = enableMusic
  self.currentCheckSound = enableSound
  self.currentCheckEnvSound = enableEnvSound
  setEnableSound(enableSound, enableMusic, enableEnvSound, nil)
  GameOption_UpdateOptionChanged()
end

GameOption_Master_slider = function()
  -- function num : 0_163 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local volume = (frame_Sound._slide_TotalVol):GetControlPos() * 100
  GameOption_SetVolume(volume, self.currentFxSound, self.currentDlgSound, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_Master_button = function()
  -- function num : 0_164 , upvalues : chk_Option, _btn_TotalVol, frame_Sound
  local self = chk_Option
  local volume = _btn_TotalVol:GetPosX() / ((frame_Sound._slide_TotalVol):GetSizeX() - _btn_TotalVol:GetSizeX()) * 100
  GameOption_SetVolume(volume, self.currentFxSound, self.currentDlgSound, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_Music_slider = function()
  -- function num : 0_165 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local volume = (frame_Sound._slide_MusicVol):GetControlPos() * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, self.currentDlgSound, self.currentEnvSound, volume, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_Music_button = function()
  -- function num : 0_166 , upvalues : chk_Option, _btn_MusicVol, frame_Sound
  local self = chk_Option
  local volume = _btn_MusicVol:GetPosX() / ((frame_Sound._slide_MusicVol):GetSizeX() - _btn_MusicVol:GetSizeX()) * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, self.currentDlgSound, self.currentEnvSound, volume, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_FxSound_slider = function()
  -- function num : 0_167 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local volume = (frame_Sound._slide_FxVol):GetControlPos() * 100
  GameOption_SetVolume(self.currentMaster, volume, self.currentDlgSound, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_FxSound_button = function()
  -- function num : 0_168 , upvalues : chk_Option, _btn_FxVol, frame_Sound
  local self = chk_Option
  local volume = _btn_FxVol:GetPosX() / ((frame_Sound._slide_FxVol):GetSizeX() - _btn_FxVol:GetSizeX()) * 100
  GameOption_SetVolume(self.currentMaster, volume, self.currentDlgSound, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_EnvSound_slider = function()
  -- function num : 0_169 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local volume = (frame_Sound._slide_EnvFxVol):GetControlPos() * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, self.currentDlgSound, volume, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_EnvSound_button = function()
  -- function num : 0_170 , upvalues : chk_Option, _btn_EnvFxVol, frame_Sound
  local self = chk_Option
  local volume = _btn_EnvFxVol:GetPosX() / ((frame_Sound._slide_EnvFxVol):GetSizeX() - _btn_EnvFxVol:GetSizeX()) * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, self.currentDlgSound, volume, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_DlgSound_slider = function()
  -- function num : 0_171 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local volume = (frame_Sound._slide_VoiceVol):GetControlPos() * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, volume, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_DlgSound_button = function()
  -- function num : 0_172 , upvalues : chk_Option, _btn_VoiceVol, frame_Sound
  local self = chk_Option
  local volume = _btn_VoiceVol:GetPosX() / ((frame_Sound._slide_VoiceVol):GetSizeX() - _btn_VoiceVol:GetSizeX()) * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, volume, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, self.currentPlayerVolume)
end

GameOption_CheckMusic = function()
  -- function num : 0_173 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local check = (frame_Sound._btn_MusicOnOff):IsCheck()
  self.currentCheckMusic = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckSound = function()
  -- function num : 0_174 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local check = (frame_Sound._btn_FXOnOff):IsCheck()
  self.currentCheckSound = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckEnvSound = function()
  -- function num : 0_175 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local check = (frame_Sound._btn_EnvFXOnOff):IsCheck()
  self.currentCheckEnvSound = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckRiddingMusic = function()
  -- function num : 0_176 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local check = (frame_Sound._btn_RiddingOnOff):IsCheck()
  self.currentCheckRiddingMusic = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckWhisperMusic = function()
  -- function num : 0_177 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local check = (frame_Sound._btn_WhisperOnOff):IsCheck()
  self.currentCheckWhisperMusic = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckTraySound = function()
  -- function num : 0_178 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local check = (frame_Sound._btn_TraySoundOnOff):IsCheck()
  self.currentCheckTraySoundOnOff = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckCombatSound = function()
  -- function num : 0_179 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local combatOffCheck = (frame_Sound._btn_CombatAllwaysOff):IsCheck()
  local combatOnCheck = (frame_Sound._btn_CombatAllwaysOn):IsCheck()
  local combatLowOffCheck = (frame_Sound._btn_CombatAllwaysLowOff):IsCheck()
  if combatOffCheck then
    self.currentCheckCombatMusic = (CppEnums.BattleSoundType).Sound_NotUse
  else
    if combatOnCheck then
      self.currentCheckCombatMusic = (CppEnums.BattleSoundType).Sound_Always
    else
      self.currentCheckCombatMusic = (CppEnums.BattleSoundType).Sound_Nomal
    end
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckNpcVoice = function()
  -- function num : 0_180 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local voice1Check = (frame_Sound._btn_NpcVoice1):IsCheck()
  local voice2Check = (frame_Sound._btn_NpcVoice2):IsCheck()
  local voice3Check = (frame_Sound._btn_NpcVoice3):IsCheck()
  if voice1Check then
    if isGameTypeKorea() then
      self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_KR
    else
      if isGameTypeJapan() then
        self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_JP
      else
      end
    end
    if not isGameTypeRussia() or isGameTypeEnglish() then
      self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_EN
    else
      if isGameTypeTaiwan() then
        self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_TW
      else
        _PA_LOG("LUA", "�\173 국가 리소스가 추가되면 �\180 곳도 수정 판단 해주어야합니�\164.")
      end
    end
  else
    if voice2Check then
      if isGameTypeKorea() then
        self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_JP
      else
        if isGameTypeJapan() then
          self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_KR
        else
        end
      end
      if not isGameTypeRussia() or isGameTypeEnglish() then
        self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_KR
      else
        if isGameTypeTaiwan() then
          self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_JP
        end
      end
    else
      if voice3Check then
        if isGameTypeKorea() then
          self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_EN
        else
          if isGameTypeJapan() then
            self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_EN
          else
          end
        end
      end
    end
  end
  if not isGameTypeRussia() or isGameTypeEnglish() then
    self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_JP
  else
    if isGameTypeTaiwan() then
      self.currentCheckNpcVoice = (CppEnums.ServiceResourceType).eServiceResourceType_KR
    end
  end
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_NPCVOICE_RESTART"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
  GameOption_UpdateOptionChanged()
end

GameOption_CheckHitFxType = function()
  -- function num : 0_181
end

GameOption_HitFxWeight_slider = function()
  -- function num : 0_182 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local volume = (frame_Sound._slide_hitFxWeightVolume):GetControlPos() * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, self.currentDlgSound, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, volume, self.currentPlayerVolume)
end

GameOption_HitFxWeight_button = function()
  -- function num : 0_183 , upvalues : chk_Option, _btn_hitFxWeightVolume, frame_Sound
  local self = chk_Option
  local volume = _btn_hitFxWeightVolume:GetPosX() / ((frame_Sound._slide_hitFxWeightVolume):GetSizeX() - _btn_hitFxWeightVolume:GetSizeX()) * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, self.currentDlgSound, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, volume, self.currentPlayerVolume)
end

GameOption_OtherPlayer_slider = function()
  -- function num : 0_184 , upvalues : chk_Option, frame_Sound
  local self = chk_Option
  local volume = (frame_Sound._slide_otherPlayerVolume):GetControlPos() * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, self.currentDlgSound, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, volume)
end

GameOption_OtherPlayer_button = function()
  -- function num : 0_185 , upvalues : chk_Option, _btn_otherPlayerVolume, frame_Sound
  local self = chk_Option
  local volume = _btn_otherPlayerVolume:GetPosX() / ((frame_Sound._slide_otherPlayerVolume):GetSizeX() - _btn_otherPlayerVolume:GetSizeX()) * 100
  GameOption_SetVolume(self.currentMaster, self.currentFxSound, self.currentDlgSound, self.currentEnvSound, self.currentMusic, self.currentHitFxVolume, self.currentHitFxWeight, volume)
end

GameOption_SetGameMode = function(gameOptionSetting)
  -- function num : 0_186 , upvalues : randerPlayerColorStr, serviceResCount, serviceResEnumsNumber, ChatChannelEnumsNumber, chk_Option, frame_Game, _btn_ServiceResourceType, _btn_ChatLanguageType, frame_Display, frame_Sound, effectAlphaRangeTable, GetStr_Option
  local showSkillCmd = gameOptionSetting:getShowSkillCmd()
  local showComboGuide = gameOptionSetting:getShowComboGuide()
  local mouseMove = gameOptionSetting:getGameMouseMode()
  local minimapRotation = gameOptionSetting:getRadarRotateMode()
  local showAttackEffect = gameOptionSetting:getRenderHitEffect()
  local blackSpiritAlert = gameOptionSetting:getBlackSpiritNotice()
  local useNewQuickSlot = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).NewQuickSlot)
  local useChattingFilter = gameOptionSetting:getUseChattingFilter()
  local isOnScreenSaver = gameOptionSetting:getIsOnScreenSaver()
  local isUIModeMouseLock = gameOptionSetting:getUIModeMouseLock()
  local isPvpRefuse = gameOptionSetting:getPvpRefuse()
  local isExchangeRefuse = gameOptionSetting:getIsExchangeRefuse()
  local isHideMast = gameOptionSetting:getHideMastOnCarrier()
  local showCashAlert = gameOptionSetting:getCashAlert()
  local autoAim = gameOptionSetting:getAimAssist()
  local hideWindowByAttacked = gameOptionSetting:getHideWindowByAttacked()
  local showGuildLoginMessage = gameOptionSetting:getShowGuildLoginMessage()
  local mouseInvertX = gameOptionSetting:getMouseInvertX()
  local mouseInvertY = gameOptionSetting:getMouseInvertY()
  local mouseSensitivityX = gameOptionSetting:getMouseSensitivityX()
  local mouseSensitivityY = gameOptionSetting:getMouseSensitivityY()
  local padEnable = gameOptionSetting:getGamePadEnable()
  local padVibration = gameOptionSetting:getGamePadVibration()
  local padInvertX = gameOptionSetting:getGamePadInvertX()
  local padInvertY = gameOptionSetting:getGamePadInvertY()
  local padSensitivityX = gameOptionSetting:getGamePadSensitivityX()
  local padSensitivityY = gameOptionSetting:getGamePadSensitivityY()
  local effectAlpha = gameOptionSetting:getEffectAlpha()
  local colorByPassValue = gameOptionSetting:getSkillPostEffect()
  local cameraMasterPower = gameOptionSetting:getCameraMasterPower()
  local cameraShakePower = gameOptionSetting:getCameraShakePower()
  local motionBlurPower = gameOptionSetting:getMotionBlurPower()
  local CameraPosPower = gameOptionSetting:getCameraTranslatePower()
  local CameraFovPower = gameOptionSetting:getCameraFovPower()
  local selfNameShow = gameOptionSetting:getSelfPlayerNameTagVisible()
  local hitFxVolume = gameOptionSetting:getHitFxVolume()
  local RejectInvitation = gameOptionSetting:getRefuseRequests()
  local enableSimpleUI = gameOptionSetting:getEnableSimpleUI()
  local isRenderCharacterColor = gameOptionSetting:getRenderCharacterColor()
  local enableOVR = gameOptionSetting:getEnableOVR()
  local selfPlayerNameTagVisible = gameOptionSetting:getSelfPlayerNameTagVisible()
  local otherPlayerNameTagVisible = gameOptionSetting:getOtherPlayerNameTagVisible()
  local partyPlayerNameTagVisible = gameOptionSetting:getPartyPlayerNameTagVisible()
  local guildPlayerNameTagVisible = gameOptionSetting:getGuildPlayerNameTagVisible()
  local guideLineHumanRelation = gameOptionSetting:getShowHumanRelation()
  local guideLineQuestLine = gameOptionSetting:getShowQuestActorColor()
  local guideLineZoneChange = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.zoneChange)
  local guideLineWarAlly = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.warAlly)
  local guideLineGuild = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.guild)
  local guideLineParty = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.party)
  local guideLineEnemy = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.enemy)
  local guideLineNonWarPlayer = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.nonWarPlayer)
  local petObject = gameOptionSetting:getPetRender()
  local fontResizeType = gameOptionSetting:getUIFontSizeType()
  local navPathEffectType = gameOptionSetting:getShowNavPathEffectType()
  local worldmapOpenType = gameOptionSetting:getWorldmapOpenType()
  local worldmapCameraType = gameOptionSetting:getWorldMapCameraPitchType()
  local partyMemberEffect = gameOptionSetting:getRenderHitEffectParty()
  local ServiceResType = gameOptionSetting:getServiceResType()
  local ChatChannelType = gameOptionSetting:getChatLanguageType()
  for index = 0, serviceResCount - 1 do
    if serviceResEnumsNumber[index] == ServiceResType then
      ServiceResType = serviceResEnumsNumber[index]
      break
    end
  end
  do
    for index = 0, serviceResCount do
      if ChatChannelEnumsNumber[index] == ChatChannelType then
        ChatChannelType = ChatChannelEnumsNumber[index]
        break
      end
    end
    do
      local self = chk_Option
      self.currentCheckShowSkillCmd = showSkillCmd
      self.appliedCheckShowSkillCmd = showSkillCmd
      self.savedCheckShowSkillCmd = showSkillCmd
      self.currentCheckAutoAim = autoAim
      self.appliedCheckAutoAim = autoAim
      self.savedCheckAutoAim = autoAim
      self.currentCheckHideWindowByAttacked = hideWindowByAttacked
      self.appliedCheckHideWindowByAttacked = hideWindowByAttacked
      self.savedCheckHideWindowByAttacked = hideWindowByAttacked
      self.currentCheckShowGuildLoginMessage = showGuildLoginMessage
      self.appliedCheckShowGuildLoginMessage = showGuildLoginMessage
      self.savedCheckShowGuildLoginMessage = showGuildLoginMessage
      self.currentCheckEnableSimpleUI = enableSimpleUI
      self.appliedCheckEnableSimpleUI = enableSimpleUI
      self.savedCheckEnableSimpleUI = enableSimpleUI
      self.currentCheckEnableOVR = enableOVR
      self.appliedCheckEnableOVR = enableOVR
      self.savedCheckEnableOVR = enableOVR
      self.currentCheckRenderCharacterColor = isRenderCharacterColor
      self.appliedCheckRenderCharacterColor = isRenderCharacterColor
      self.savedCheckRenderCharacterColor = isRenderCharacterColor
      self.currentCheckMouseMove = mouseMove
      self.appliedCheckMouseMove = mouseMove
      self.savedCheckMouseMove = mouseMove
      self.currentCheckMiniMapRotation = minimapRotation
      self.appliedCheckMiniMapRotation = minimapRotation
      self.savedCheckMiniMapRotation = minimapRotation
      self.currentCheckShowAttackEffect = showAttackEffect
      self.appliedCheckShowAttackEffect = showAttackEffect
      self.savedCheckShowAttackEffect = showAttackEffect
      self.currentCheckBlackSpiritAlert = blackSpiritAlert
      self.appliedCheckBlackSpiritAlert = blackSpiritAlert
      self.savedCheckBlackSpiritAlert = blackSpiritAlert
      self.currentCheckUseNewQuickSlot = useNewQuickSlot
      self.appliedCheckUseNewQuickSlot = useNewQuickSlot
      self.savedCheckUseNewQuickSlot = useNewQuickSlot
      self.currentCheckUseChattingFilter = useChattingFilter
      self.appliedCheckUseChattingFilter = useChattingFilter
      self.savedCheckUseChattingFilter = useChattingFilter
      self.currentCheckIsOnScreenSaver = isOnScreenSaver
      self.appliedCheckIsOnScreenSaver = isOnScreenSaver
      self.savedCheckisOnScreenSaver = isOnScreenSaver
      self.currentCheckIsUIModeMouseLock = isUIModeMouseLock
      self.appliedCheckIsUIModeMouseLock = isUIModeMouseLock
      self.savedCheckIsUIModeMouseLock = isUIModeMouseLock
      self.currentCheckIsPvpRefuse = isPvpRefuse
      self.appliedCheckIsPvpRefuse = isPvpRefuse
      self.savedCheckisPvpRefuse = isPvpRefuse
      self.currentCheckIsExchangeRefuse = isExchangeRefuse
      self.appliedCheckIsExchangeRefuse = isExchangeRefuse
      self.savedCheckIsExchangeRefuse = isExchangeRefuse
      self.currentCheckIsHideMast = isHideMast
      self.appliedCheckIsHideMast = isHideMast
      self.savedCheckIsHideMast = isHideMast
      self.currentCheckShowCashAlert = showCashAlert
      self.appliedCheckShowCashAlert = showCashAlert
      self.savedCheckShowCasheAlert = showCashAlert
      self.currentCheckRejectInvitation = RejectInvitation
      self.appliedCheckRejectInvitation = RejectInvitation
      self.savedCheckRejectInvitation = RejectInvitation
      self.currentPetObjectShow = petObject
      self.appliedPetObjectShow = petObject
      self.savedPetObjectShow = petObject
      self.currentFontResizeType = fontResizeType
      self.appliedFontResizeType = fontResizeType
      self.savedFontResizeType = fontResizeType
      self.currentNavPathEffectType = navPathEffectType
      self.appliedNavPathEffectType = navPathEffectType
      self.savedNavPathEffectType = navPathEffectType
      self.currentWorldMapOpenType = worldmapOpenType
      self.appliedWorldMapOpenType = worldmapOpenType
      self.savedWorldMapOpenType = worldmapOpenType
      self.currentWorldMapCameraType = worldmapCameraType
      self.appliedWorldMapCameraType = worldmapCameraType
      self.savedWorldMapCameraType = worldmapCameraType
      self.currentServiceResourceType = ServiceResType
      self.appliedServiceResourceType = ServiceResType
      self.savedServiceResourceType = ServiceResType
      self.currentChatChannelType = ChatChannelType
      self.appliedChatChannelType = ChatChannelType
      self.savedChatChannelType = ChatChannelType
      self.currentCheckEffectAlpha = effectAlpha
      self.currentCheckMouseInvertX = mouseInvertX
      self.currentCheckMouseInvertY = mouseInvertY
      self.currentCheckMouseSensitivityX = mouseSensitivityX
      self.currentCheckMouseSensitivityY = mouseSensitivityY
      self.currentCheckPadEnable = padEnable
      self.currentCheckPadVibration = padVibration
      self.currentCheckPadInvertX = padInvertX
      self.currentCheckPadInvertY = padInvertY
      self.currentCheckPadSensitivityX = padSensitivityX
      self.currentCheckPadSensitivityY = padSensitivityY
      self.currentSelfPlayerNameTagVisible = selfPlayerNameTagVisible
      self.currentOtherPlayerNameTagVisible = otherPlayerNameTagVisible
      self.currentPartyPlayerNameTagVisible = partyPlayerNameTagVisible
      self.currentGuildPlayerNameTagVisible = guildPlayerNameTagVisible
      self.currentGuideLineHumanRelation = guideLineHumanRelation
      self.currentGuideLineQuestLine = guideLineQuestLine
      self.currentGuideLineZoneChange = guideLineZoneChange
      self.currentGuideLineWarAlly = guideLineWarAlly
      self.currentGuideLineGuild = guideLineGuild
      self.currentGuideLineParty = guideLineParty
      self.currentGuideLineEnemy = guideLineEnemy
      self.currentGuideLineNonWarPlayer = guideLineNonWarPlayer
      self.currentGuideLinePartyMemberEffect = partyMemberEffect
      self.currentHitFxVolume = hitFxVolume
      self.currentCheckShowComboGuide = showComboGuide
      self.appliedCheckEffectAlpha = effectAlpha
      self.appliedCheckMouseInvertX = mouseInvertX
      self.appliedCheckMouseInvertY = mouseInvertY
      self.appliedCheckMouseSensitivityX = mouseSensitivityX
      self.appliedCheckMouseSensitivityY = mouseSensitivityY
      self.appliedCheckPadEnable = padEnable
      self.appliedCheckPadVibration = padVibration
      self.appliedCheckPadInvertX = padInvertX
      self.appliedCheckPadInvertY = padInvertY
      self.appliedCheckPadSensitivityX = padSensitivityX
      self.appliedCheckPadSensitivityY = padSensitivityY
      self.appliedSelfPlayerNameTagVisible = selfPlayerNameTagVisible
      self.appliedOtherPlayerNameTagVisible = otherPlayerNameTagVisible
      self.appliedPartyPlayerNameTagVisible = partyPlayerNameTagVisible
      self.appliedGuildPlayerNameTagVisible = guildPlayerNameTagVisible
      self.appliedGuideLineHumanRelation = guideLineHumanRelation
      self.appliedGuideLineQuestLine = guideLineQuestLine
      self.appliedGuideLineZoneChange = guideLineZoneChange
      self.appliedGuideLineWarAlly = guideLineWarAlly
      self.appliedGuideLineGuild = guideLineGuild
      self.appliedGuideLineParty = guideLineParty
      self.appliedGuideLineEnemy = guideLineEnemy
      self.appliedGuideLineNonWarPlayer = guideLineNonWarPlayer
      self.appliedGuideLinePartyMemberEffect = partyMemberEffect
      self.appliedHitFxVolume = hitFxVolume
      self.appliedCheckShowComboGuide = showComboGuide
      self.savedCheckEffectAlpha = effectAlpha
      self.savedCheckMouseInvertX = mouseInvertX
      self.savedCheckMouseInvertY = mouseInvertY
      self.savedCheckMouseSensitivityX = mouseSensitivityX
      self.savedCheckMouseSensitivityY = mouseSensitivityY
      self.savedCheckPadEnable = padEnable
      self.savedCheckPadVibration = padVibration
      self.savedCheckPadInvertX = padInvertX
      self.savedCheckPadInvertY = padInvertY
      self.savedCheckPadSensitivityX = padSensitivityX
      self.savedCheckPadSensitivityY = padSensitivityY
      self.savedCheckSelfNameShow = selfNameShow
      self.savedSelfPlayerNameTagVisible = selfPlayerNameTagVisible
      self.savedOtherPlayerNameTagVisible = otherPlayerNameTagVisible
      self.savedPartyPlayerNameTagVisible = partyPlayerNameTagVisible
      self.savedGuildPlayerNameTagVisible = guildPlayerNameTagVisible
      self.savedGuideLineHumanRelation = guideLineHumanRelation
      self.savedGuideLineQuestLine = guideLineQuestLine
      self.savedGuideLineZoneChange = guideLineZoneChange
      self.savedGuideLineWarAlly = guideLineWarAlly
      self.savedGuideLineGuild = guideLineGuild
      self.savedGuideLineParty = guideLineParty
      self.savedGuideLineEnemy = guideLineEnemy
      self.savedGuideLineNonWarPlayer = guideLineNonWarPlayer
      self.savedGuideLinePartyMemberEffect = partyMemberEffect
      self.savedHitFxVolume = hitFxVolume
      self.savedCheckShowComboGuide = showComboGuide
      _currentSpiritGuideCheck = showComboGuide
      ;
      (frame_Game._btn_AutoAim):SetCheck(autoAim)
      ;
      (frame_Game._btn_HideWindow):SetCheck(hideWindowByAttacked)
      ;
      (frame_Game._btn_MouseMove):SetCheck(mouseMove)
      ;
      (frame_Game._btn_MiniMapRotation):SetCheck(minimapRotation)
      ;
      (frame_Game._btn_ShowAttackEffect):SetCheck(showAttackEffect)
      ;
      (frame_Game._btn_Alert_BlackSpirit):SetCheck(blackSpiritAlert)
      ;
      (frame_Game._btn_UseNewQuickSlot):SetCheck(useNewQuickSlot)
      ;
      (frame_Game._btn_UseChattingFilter):SetCheck(useChattingFilter)
      ;
      (frame_Game._btn_IsOnScreenSaver):SetCheck(isOnScreenSaver)
      ;
      (frame_Game._btn_UIModeMouseLock):SetCheck(isUIModeMouseLock)
      ;
      (frame_Game._btn_PvpRefuse):SetCheck(isPvpRefuse)
      ;
      (frame_Game._btn_ExchangeRefuse):SetCheck(isExchangeRefuse)
      ;
      (frame_Game._btn_HideMast):SetCheck(isHideMast)
      ;
      (frame_Game._btn_ShowCashAlert):SetCheck(showCashAlert)
      ;
      (frame_Game._btn_GuildLogin):SetCheck(showGuildLoginMessage)
      ;
      (frame_Game._btn_MouseX):SetCheck(mouseInvertX)
      ;
      (frame_Game._btn_MouseY):SetCheck(mouseInvertY)
      ;
      (frame_Game._btn_UsePad):SetCheck(padEnable)
      ;
      (frame_Game._btn_UseVibe):SetCheck(padVibration)
      ;
      (frame_Game._btn_PadX):SetCheck(padInvertX)
      ;
      (frame_Game._btn_PadY):SetCheck(padInvertY)
      ;
      (frame_Game._btn_SelfNameShowAllways):SetCheck((CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == selfPlayerNameTagVisible)
      ;
      (frame_Game._btn_SelfNameShowImportant):SetCheck((CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow == selfPlayerNameTagVisible)
      ;
      (frame_Game._btn_SelfNameShowNoShow):SetCheck((CppEnums.VisibleNameTagType).eVisibleNameTagType_NoShow == selfPlayerNameTagVisible)
      ;
      (frame_Game._btn_OtherNameShow):SetCheck((CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == otherPlayerNameTagVisible)
      ;
      (frame_Game._btn_PartyNameShow):SetCheck((CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == partyPlayerNameTagVisible)
      ;
      (frame_Game._btn_GuildNameShow):SetCheck((CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == guildPlayerNameTagVisible)
      ;
      (frame_Game._btn_GuideLineHumanRelation):SetCheck(guideLineHumanRelation)
      ;
      (frame_Game._btn_GuideLineQuestObject):SetCheck(guideLineQuestLine)
      ;
      (frame_Game._btn_GuideLineZoneChange):SetCheck(guideLineZoneChange)
      ;
      (frame_Game._btn_GuideLineWarAlly):SetCheck(guideLineWarAlly)
      ;
      (frame_Game._btn_GuideLineGuild):SetCheck(guideLineGuild)
      ;
      (frame_Game._btn_GuideLineParty):SetCheck(guideLineParty)
      ;
      (frame_Game._btn_GuideLineEnemy):SetCheck(guideLineEnemy)
      ;
      (frame_Game._btn_GuideLineNonWarPlayer):SetCheck(guideLineNonWarPlayer)
      ;
      (frame_Game._btn_GuideLinePartyEffect):SetCheck(partyMemberEffect)
      ;
      (frame_Game._btn_PetAll):SetCheck((CppEnums.PetVisibleType).ePetVisibleType_All == petObject)
      ;
      (frame_Game._btn_PetMine):SetCheck((CppEnums.PetVisibleType).ePetVisibleType_Mine == petObject)
      ;
      (frame_Game._btn_PetHide):SetCheck((CppEnums.PetVisibleType).ePetVisibleType_Hide == petObject)
      ;
      (frame_Game._btn_FontResizeDefault):SetCheck((CppEnums.UIFontSizeType).eUIFontSizeType_Normal == fontResizeType)
      ;
      (frame_Game._btn_FontResizeBig):SetCheck((CppEnums.UIFontSizeType).eUIFontSizeType_Biggish == fontResizeType)
      ;
      (frame_Game._btn_FontResizeMoreBig):SetCheck((CppEnums.UIFontSizeType).eUIFontSizeType_Big == fontResizeType)
      ;
      (frame_Game._btn_NavGuideNone):SetCheck((CppEnums.NavPathEffectType).eNavPathEffectType_None == navPathEffectType)
      ;
      (frame_Game._btn_NavGuideArrow):SetCheck((CppEnums.NavPathEffectType).eNavPathEffectType_Arrow == navPathEffectType)
      ;
      (frame_Game._btn_NavGuideEffect):SetCheck((CppEnums.NavPathEffectType).eNavPathEffectType_PathEffect == navPathEffectType)
      ;
      (frame_Game._btn_NavGuideFairy):SetCheck((CppEnums.NavPathEffectType).eNavPathEffectType_Fairy == navPathEffectType)
      ;
      (frame_Game._btn_WorldMapOpenByWestMaintain):SetCheck((CppEnums.WorldMapAnimationStyle).afterSpinNorth == worldmapOpenType)
      ;
      (frame_Game._btn_WorldMapOpenByCharacterToWest):SetCheck((CppEnums.WorldMapAnimationStyle).characterToNorthSmooth == worldmapOpenType)
      ;
      (frame_Game._btn_WorldMapOpenByCharacterMaintain):SetCheck((CppEnums.WorldMapAnimationStyle).characterMaintainSmooth == worldmapOpenType)
      ;
      (frame_Game._btn_WorldMapOpenByNone):SetCheck((CppEnums.WorldMapAnimationStyle).noAnimation == worldmapOpenType)
      ;
      (frame_Game._btn_WorldMapCameraDefaultAngle):SetCheck((CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Default == worldmapCameraType)
      ;
      (frame_Game._btn_WorldMapCameraDegree30):SetCheck((CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Degree30 == worldmapCameraType)
      ;
      (frame_Game._btn_WorldMapCameraDegree90):SetCheck((CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Degree90 == worldmapCameraType)
      ;
      (frame_Game._btn_RejectInvitation):SetCheck(RejectInvitation)
      if 0 < serviceResCount then
        for index = 0, serviceResCount - 1 do
          (_btn_ServiceResourceType[index]):SetCheck(serviceResEnumsNumber[index] == ServiceResType)
        end
      end
      if 0 < serviceResCount then
        for index = 0, serviceResCount do
          if ChatChannelEnumsNumber[index] ~= ChatChannelType then
            do
              (_btn_ChatLanguageType[index]):SetCheck(nil == _btn_ChatLanguageType[index])
              -- DECOMPILER ERROR at PC840: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC840: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
      ;
      (frame_Game._btn_EnableSimpleUI):SetCheck(enableSimpleUI)
      ;
      (frame_Game._btn_EnableOVR):SetCheck(enableOVR)
      value_GameOption_Check_ComboGuide:SetCheck(showComboGuide)
      local mouseSensitivityX_Percent = (mouseSensitivityX - 0.1) / 1.9 * 100
      local mouseSensitivityY_Percent = (mouseSensitivityY - 0.1) / 1.9 * 100
      local padSensitivityX_Percent = (padSensitivityX - 0.1) / 1.9 * 100
      local padSensitivityY_Percent = (padSensitivityY - 0.1) / 1.9 * 100
      local effectAlpha_Percent = effectAlpha * 100
      local colorByPass_Percent = colorByPassValue * 100
      local cameraMasterPower_Percent = cameraMasterPower * 100
      local cameraShakePower_Percent = cameraShakePower * 100
      local motionBlurPower_Percent = motionBlurPower * 100
      local CameraPosPower_Percent = CameraPosPower * 100
      local CameraFovPower_Percent = CameraFovPower * 100
      ;
      (frame_Display._slide_EffectAlpha):SetControlPos(effectAlpha_Percent)
      ;
      (frame_Display._slide_ColorByPass):SetControlPos(colorByPass_Percent)
      ;
      (frame_Display._slide_CameraMaster):SetControlPos(cameraMasterPower_Percent)
      ;
      (frame_Display._slide_CameraShake):SetControlPos(cameraShakePower_Percent)
      ;
      (frame_Display._slide_MotionBlur):SetControlPos(motionBlurPower_Percent)
      ;
      (frame_Game._slide_MouXSen):SetControlPos(mouseSensitivityX_Percent)
      ;
      (frame_Game._slide_MouYSen):SetControlPos(mouseSensitivityY_Percent)
      ;
      (frame_Game._slide_PadXSen):SetControlPos(padSensitivityX_Percent)
      ;
      (frame_Game._slide_PadYSen):SetControlPos(padSensitivityY_Percent)
      ;
      (frame_Sound._slide_hitFxVolume):SetControlPos(hitFxVolume)
      do
        local interval = effectAlphaRangeTable.maxAlphaValue - effectAlphaRangeTable.minAlphaValue
        ;
        (frame_Display._slide_EffectAlpha):SetControlPos((effectAlpha_Percent - effectAlphaRangeTable.minAlphaValue) / interval * 100)
        ;
        (frame_Display._txt_EffectAlpha):SetText(GetStr_Option[27] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(effectAlpha_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Display._txt_ColorByPass):SetText(GetStr_Option[28] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(colorByPass_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Display._txt_CameraMaster):SetText(GetStr_Option[25] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(cameraMasterPower_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Display._txt_CameraShake):SetText(GetStr_Option[11] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(cameraShakePower_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Display._txt_MotionBlur):SetText(GetStr_Option[17] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(motionBlurPower_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Display._txt_CameraPos):SetText(GetStr_Option[22] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(CameraPosPower_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Display._txt_CameraFov):SetText(GetStr_Option[23] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(CameraFovPower_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Game._txt_MouXSen):SetText(GetStr_Option[12] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(mouseSensitivityX_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Game._txt_MouYSen):SetText(GetStr_Option[13] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(mouseSensitivityY_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Game._txt_PadXSen):SetText(GetStr_Option[14] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(padSensitivityX_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Game._txt_PadYSen):SetText(GetStr_Option[15] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(padSensitivityY_Percent, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Sound._txt_hitFxVolume):SetText(GetStr_Option[18] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(hitFxVolume, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Sound._txt_hitFxVolume):SetText(GetStr_Option[18] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(hitFxVolume, 100)) .. "% <PAOldColor>) ")
        ;
        (frame_Sound._txt_hitFxVolume):SetText(GetStr_Option[18] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(hitFxVolume, 100)) .. "% <PAOldColor>) ")
        if nil ~= Panel_SkillCommand then
          Panel_SkillCommand:SetShow(showSkillCmd, false)
          isChecked_SkillCommand = showSkillCmd
        end
        setRotateRadarMode(self.currentCheckMiniMapRotation)
        -- DECOMPILER ERROR: 29 unprocessed JMP targets
      end
    end
  end
end

FGlobal_IsChecked_SkillCommand = function()
  -- function num : 0_187
  return isChecked_SkillCommand
end

FGlobal_SkillCommand_LevelCheck = function()
  -- function num : 0_188
  if ((getSelfPlayer()):get()):getLevel() >= 50 then
    setShowSkillCmd(false)
    GameOption_UpdateOptionChanged()
    Panel_SkillCommand:SetShow(false, false)
    isChecked_SkillCommand = false
  end
end

GameOption_ShowComboGuide = function()
  -- function num : 0_189 , upvalues : chk_Option
  local self = chk_Option
  local check = value_GameOption_Check_ComboGuide:IsCheck()
  self.currentCheckShowComboGuide = check
  GameOption_UpdateOptionChanged()
end

GameOption_AutoAim = function()
  -- function num : 0_190 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_AutoAim):IsCheck()
  self.currentCheckAutoAim = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckHideWindow = function()
  -- function num : 0_191 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_HideWindow):IsCheck()
  self.currentCheckHideWindowByAttacked = check
  GameOption_UpdateOptionChanged()
end

GameOption_GetHideWindow = function()
  -- function num : 0_192 , upvalues : chk_Option
  local self = chk_Option
  return self.appliedCheckHideWindowByAttacked
end

SimpleUI_EnableCheck = function(simpleUI_Check)
  -- function num : 0_193 , upvalues : frame_Game
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil and (selfPlayer:get()):getLevel() == 6 then
    (frame_Game._btn_EnableSimpleUI):SetCheck(simpleUI_Check)
  end
  GameOption_CheckSimpleUI()
end

GameOption_CheckSimpleUI = function()
  -- function num : 0_194 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_EnableSimpleUI):IsCheck()
  self.currentCheckEnableSimpleUI = check
  GameOption_UpdateOptionChanged()
end

GameOption_GetEnableSimpleUI = function()
  -- function num : 0_195 , upvalues : chk_Option
  local self = chk_Option
  return self.appliedCheckEnableSimpleUI
end

GameOption_CheckEnableOVR = function()
  -- function num : 0_196 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_EnableOVR):IsCheck()
  self.currentCheckEnableOVR = check
  GameOption_UpdateOptionChanged()
end

GameOption_GetEnableOVR = function()
  -- function num : 0_197 , upvalues : chk_Option
  local self = chk_Option
  return self.appliedCheckEnableOVR
end

Panel_KeyViewer_MainFunc = function()
  -- function num : 0_198 , upvalues : isChecked_KeyViewer
  if isChecked_KeyViewer == false then
    FGlobal_KeyViewer_Show()
    isChecked_KeyViewer = true
  else
    if isChecked_KeyViewer == true then
      FGlobal_KeyViewer_Hide()
      isChecked_KeyViewer = false
    end
  end
end

Panel_GuildLogin_MainFunc = function()
  -- function num : 0_199 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local GuildLoginState = (frame_Game._btn_GuildLogin):IsCheck()
  self.currentCheckShowGuildLoginMessage = GuildLoginState
  GameOption_UpdateOptionChanged()
end

GameOption_ShowGuildLoginMessage = function()
  -- function num : 0_200 , upvalues : chk_Option
  local self = chk_Option
  return self.appliedCheckShowGuildLoginMessage
end

Panel_RejectInvitation_MainFunc = function()
  -- function num : 0_201 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_RejectInvitation):IsCheck()
  self.currentCheckRejectInvitation = check
  GameOption_UpdateOptionChanged()
end

GameOption_SpiritGuide_ShowFunc = function()
  -- function num : 0_202 , upvalues : frame_Game
  local tempCheck = (frame_Game._btn_SpiritGuide):IsCheck()
end

GameOption_EffectAlpha_slider = function()
  -- function num : 0_203 , upvalues : chk_Option, frame_Display, effectAlphaRangeTable, GetStr_Option
  local self = chk_Option
  local volume = (frame_Display._slide_EffectAlpha):GetControlPos()
  local interval = effectAlphaRangeTable.maxAlphaValue - effectAlphaRangeTable.minAlphaValue
  volume = (effectAlphaRangeTable.minAlphaValue + interval * volume) / 100
  self.currentCheckEffectAlpha = volume
  setEffectAlpha(self.currentCheckEffectAlpha)
  ;
  (frame_Display._txt_EffectAlpha):SetText(GetStr_Option[27] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_EffectAlpha_button = function()
  -- function num : 0_204 , upvalues : chk_Option, _btn_EffectAlpha, frame_Display, effectAlphaRangeTable, GetStr_Option
  local self = chk_Option
  local volume = _btn_EffectAlpha:GetPosX() / ((frame_Display._slide_EffectAlpha):GetSizeX() - _btn_EffectAlpha:GetSizeX())
  local interval = effectAlphaRangeTable.maxAlphaValue - effectAlphaRangeTable.minAlphaValue
  volume = (effectAlphaRangeTable.minAlphaValue + interval * volume) / 100
  self.currentCheckEffectAlpha = volume
  setEffectAlpha(self.currentCheckEffectAlpha)
  ;
  (frame_Display._slide_EffectAlpha):SetControlPos(self.currentCheckEffectAlpha)
  ;
  (frame_Display._txt_EffectAlpha):SetText(GetStr_Option[27] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_SetEffectAlpha = function()
  -- function num : 0_205 , upvalues : chk_Option, frame_Display, GetStr_Option
  local self = chk_Option
  local currentCheckEffectAlpha = self.currentCheckEffectAlpha * 100
  setEffectAlpha(self.currentCheckEffectAlpha)
  ;
  (frame_Display._slide_EffectAlpha):SetControlPos(currentCheckEffectAlpha)
  ;
  (frame_Display._txt_EffectAlpha):SetText(GetStr_Option[27] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(currentCheckEffectAlpha, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_ColorByPass_slider = function()
  -- function num : 0_206 , upvalues : chk_Option, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = (frame_Display._slide_ColorByPass):GetControlPos()
  self.currentCheckCameraMasterPower = volume
  setSkillPostEffect(self.currentCheckCameraMasterPower)
  ;
  (frame_Display._txt_ColorByPass):SetText(GetStr_Option[28] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_ColorByPass_button = function()
  -- function num : 0_207 , upvalues : chk_Option, _btn_ColorByPass, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = _btn_ColorByPass:GetPosX() / ((frame_Display._slide_ColorByPass):GetSizeX() - _btn_ColorByPass:GetSizeX())
  self.currentCheckColorByPass = volume
  setSkillPostEffect(self.currentCheckColorByPass)
  ;
  (frame_Display._txt_ColorByPass):SetText(GetStr_Option[28] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_SetColorByPass = function()
  -- function num : 0_208 , upvalues : chk_Option, frame_Display, GetStr_Option
  local colorByPass_Percent = chk_Option.currentCheckColorByPass * 100
  ;
  (frame_Display._slide_ColorByPass):SetControlPos(colorByPass_Percent)
  setSkillPostEffect(chk_Option.currentCheckColorByPass)
  ;
  (frame_Display._txt_ColorByPass):SetText(GetStr_Option[28] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(colorByPass_Percent, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_CameraMasterPower_slider = function()
  -- function num : 0_209 , upvalues : chk_Option, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = (frame_Display._slide_CameraMaster):GetControlPos()
  self.currentCheckCameraMasterPower = volume
  setCameraMasterPower(self.currentCheckCameraMasterPower)
  ;
  (frame_Display._txt_CameraMaster):SetText(GetStr_Option[25] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_CameraMasterPower_button = function()
  -- function num : 0_210 , upvalues : chk_Option, _btn_CameraMaster, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = _btn_CameraMaster:GetPosX() / ((frame_Display._slide_CameraMaster):GetSizeX() - _btn_CameraMaster:GetSizeX())
  self.currentCheckCameraMasterPower = volume
  setCameraMasterPower(self.currentCheckCameraMasterPower)
  ;
  (frame_Display._txt_CameraMaster):SetText(GetStr_Option[25] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_SetCameraMasterPower = function()
  -- function num : 0_211 , upvalues : chk_Option, frame_Display, GetStr_Option
  local cameraMasterPower_Percent = chk_Option.currentCheckCameraMasterPower * 100
  ;
  (frame_Display._slide_CameraMaster):SetControlPos(cameraMasterPower_Percent)
  setCameraMasterPower(chk_Option.currentCheckCameraMasterPower)
  ;
  (frame_Display._txt_MotionBlur):SetText(GetStr_Option[25] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(cameraMasterPower_Percent, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_CameraShakePower_slider = function()
  -- function num : 0_212 , upvalues : chk_Option, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = (frame_Display._slide_CameraShake):GetControlPos()
  self.currentCheckCameraShakePower = volume
  setCameraShakePower(self.currentCheckCameraShakePower)
  ;
  (frame_Display._txt_CameraShake):SetText(GetStr_Option[11] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_CameraShakePower_button = function()
  -- function num : 0_213 , upvalues : chk_Option, _btn_CameraShake, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = _btn_CameraShake:GetPosX() / ((frame_Display._slide_CameraShake):GetSizeX() - _btn_CameraShake:GetSizeX())
  self.currentCheckCameraShakePower = volume
  setCameraShakePower(self.currentCheckCameraShakePower)
  ;
  (frame_Display._txt_CameraShake):SetText(GetStr_Option[11] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_SetCameraShakePower = function()
  -- function num : 0_214 , upvalues : chk_Option, frame_Display, GetStr_Option
  local cameraShakePower_Percent = chk_Option.currentCheckCameraShakePower * 100
  ;
  (frame_Display._slide_CameraShake):SetControlPos(cameraShakePower_Percent)
  setCameraShakePower(chk_Option.currentCheckCameraShakePower)
  ;
  (frame_Display._txt_MotionBlur):SetText(GetStr_Option[11] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(cameraShakePower_Percent, 100)) .. "% <PAOldColor>)")
end

GameOption_MotionBlurPower_slider = function()
  -- function num : 0_215 , upvalues : chk_Option, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = (frame_Display._slide_MotionBlur):GetControlPos()
  self.currentCheckMotionBlurPower = volume
  setMotionBlurPower(self.currentCheckMotionBlurPower)
  ;
  (frame_Display._txt_MotionBlur):SetText(GetStr_Option[17] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_MotionBlurPower_button = function()
  -- function num : 0_216 , upvalues : chk_Option, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = (frame_Display._slide_MotionBlur):GetControlPos()
  self.currentCheckMotionBlurPower = volume
  setMotionBlurPower(self.currentCheckMotionBlurPower)
  ;
  (frame_Display._txt_MotionBlur):SetText(GetStr_Option[17] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_SetMotionBlurPower = function()
  -- function num : 0_217 , upvalues : chk_Option, frame_Display, GetStr_Option
  local motionBlurPower_Percent = chk_Option.currentCheckMotionBlurPower * 100
  ;
  (frame_Display._slide_MotionBlur):SetControlPos(motionBlurPower_Percent)
  setMotionBlurPower(chk_Option.currentCheckMotionBlurPower)
  ;
  (frame_Display._txt_MotionBlur):SetText(GetStr_Option[17] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(motionBlurPower_Percent, 100)) .. "% <PAOldColor>)")
end

GameOption_CameraPosPower_slider = function()
  -- function num : 0_218 , upvalues : chk_Option, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = (frame_Display._slide_CameraPos):GetControlPos()
  self.currentCheckCameraPosPower = volume
  setCameraTranslatePower(self.currentCheckCameraPosPower)
  ;
  (frame_Display._txt_CameraPos):SetText(GetStr_Option[22] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_CameraPosPower_button = function()
  -- function num : 0_219 , upvalues : chk_Option, _btn_CameraPos, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = _btn_CameraPos:GetPosX() / ((frame_Display._slide_CameraPos):GetSizeX() - _btn_CameraPos:GetSizeX())
  self.currentCheckCameraPosPower = volume
  setCameraTranslatePower(self.currentCheckCameraPosPower)
  ;
  (frame_Display._txt_CameraPos):SetText(GetStr_Option[22] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_SetCameraPosPower = function()
  -- function num : 0_220 , upvalues : chk_Option, frame_Display, GetStr_Option
  local CameraPosPower_Percent = chk_Option.currentCheckCameraPosPower * 100
  ;
  (frame_Display._slide_CameraPos):SetControlPos(CameraPosPower_Percent)
  setCameraTranslatePower(chk_Option.currentCheckCameraPosPower)
  ;
  (frame_Display._txt_CameraPos):SetText(GetStr_Option[22] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(CameraPosPower_Percent, 100)) .. "% <PAOldColor>)")
end

GameOption_CameraFovPower_slider = function()
  -- function num : 0_221 , upvalues : chk_Option, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = (frame_Display._slide_CameraFov):GetControlPos()
  self.currentCheckCameraFovPower = volume
  setCameraFovPower(self.currentCheckCameraFovPower)
  ;
  (frame_Display._txt_CameraFov):SetText(GetStr_Option[23] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_CameraFovPower_button = function()
  -- function num : 0_222 , upvalues : chk_Option, _btn_CameraFov, frame_Display, GetStr_Option
  local self = chk_Option
  local volume = _btn_CameraFov:GetPosX() / ((frame_Display._slide_CameraFov):GetSizeX() - _btn_CameraFov:GetSizeX())
  self.currentCheckCameraFovPower = volume
  setCameraFovPower(self.currentCheckCameraFovPower)
  ;
  (frame_Display._txt_CameraFov):SetText(GetStr_Option[23] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_SetCameraFovPower = function()
  -- function num : 0_223 , upvalues : chk_Option, frame_Display, GetStr_Option
  local CameraFovPower_Percent = chk_Option.currentCheckCameraFovPower * 100
  ;
  (frame_Display._slide_CameraFov):SetControlPos(CameraFovPower_Percent)
  setCameraFovPower(chk_Option.currentCheckCameraFovPower)
  ;
  (frame_Display._txt_CameraFov):SetText(GetStr_Option[23] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(CameraFovPower_Percent, 100)) .. "% <PAOldColor>)")
end

GameOption_CheckMouseMove = function()
  -- function num : 0_224 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_MouseMove):IsCheck()
  self.currentCheckMouseMove = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckMiniMapRotation = function()
  -- function num : 0_225 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_MiniMapRotation):IsCheck()
  self.currentCheckMiniMapRotation = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckShowAttackEffect = function()
  -- function num : 0_226 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_ShowAttackEffect):IsCheck()
  self.currentCheckShowAttackEffect = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckBlackSpiritAlert = function()
  -- function num : 0_227 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_Alert_BlackSpirit):IsCheck()
  self.currentCheckBlackSpiritAlert = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckUseNewQuickSlot = function()
  -- function num : 0_228 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_UseNewQuickSlot):IsCheck()
  self.currentCheckUseNewQuickSlot = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckUseChattingFilter = function()
  -- function num : 0_229 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_UseChattingFilter):IsCheck()
  self.currentCheckUseChattingFilter = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckIsOnScreenSaver = function()
  -- function num : 0_230 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_IsOnScreenSaver):IsCheck()
  self.currentCheckIsOnScreenSaver = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckUIModeMouseLock = function()
  -- function num : 0_231 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_UIModeMouseLock):IsCheck()
  self.currentCheckIsUIModeMouseLock = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckPvpRefuse = function()
  -- function num : 0_232 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_PvpRefuse):IsCheck()
  self.currentCheckIsPvpRefuse = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckExchangeRefuse = function()
  -- function num : 0_233 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_ExchangeRefuse):IsCheck()
  self.currentCheckIsExchangeRefuse = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckHideMast = function()
  -- function num : 0_234 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_HideMast):IsCheck()
  self.currentCheckIsHideMast = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckCashAlert = function()
  -- function num : 0_235 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_ShowCashAlert):IsCheck()
  self.currentCheckShowCashAlert = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckMouseInvertX = function()
  -- function num : 0_236 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_MouseX):IsCheck()
  self.currentCheckMouseInvertX = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckMouseInvertY = function()
  -- function num : 0_237 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_MouseY):IsCheck()
  self.currentCheckMouseInvertY = check
  GameOption_UpdateOptionChanged()
end

GameOption_MouseSensitivityX_slider = function()
  -- function num : 0_238 , upvalues : chk_Option, frame_Game, GetStr_Option
  local self = chk_Option
  local volume = (frame_Game._slide_MouXSen):GetControlPos()
  self.currentCheckMouseSensitivityX = volume * 1.9 + 0.1
  ;
  (frame_Game._txt_MouXSen):SetText(GetStr_Option[12] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_MouseSensitivityX_button = function()
  -- function num : 0_239 , upvalues : chk_Option, _btn_MouXSen, frame_Game, GetStr_Option
  local self = chk_Option
  local volume = _btn_MouXSen:GetPosX() / ((frame_Game._slide_MouXSen):GetSizeX() - _btn_MouXSen:GetSizeX())
  self.currentCheckMouseSensitivityX = volume * 1.9 + 0.1
  ;
  (frame_Game._txt_MouXSen):SetText(GetStr_Option[12] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_MouseSensitivityY_slider = function()
  -- function num : 0_240 , upvalues : chk_Option, frame_Game, GetStr_Option
  local self = chk_Option
  local volume = (frame_Game._slide_MouYSen):GetControlPos()
  self.currentCheckMouseSensitivityY = volume * 1.9 + 0.1
  ;
  (frame_Game._txt_MouYSen):SetText(GetStr_Option[13] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_MouseSensitivityY_button = function()
  -- function num : 0_241 , upvalues : chk_Option, _btn_MouYSen, frame_Game, GetStr_Option
  local self = chk_Option
  local volume = _btn_MouYSen:GetPosX() / ((frame_Game._slide_MouYSen):GetSizeX() - _btn_MouYSen:GetSizeX())
  self.currentCheckMouseSensitivityY = volume * 1.9 + 0.1
  ;
  (frame_Game._txt_MouYSen):SetText(GetStr_Option[13] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_hitFxVolume_slider = function()
  -- function num : 0_242 , upvalues : chk_Option, _btn_hitFxVolume, frame_Sound, _volumeParam, GetStr_Option
  local self = chk_Option
  local volume = _btn_hitFxVolume:GetPosX() / ((frame_Sound._slide_hitFxVolume):GetSizeX() - _btn_hitFxVolume:GetSizeX())
  self.currentHitFxVolume = volume * 100
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.master = self.currentMaster
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.fx = self.currentFxSound
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.dlg = self.currentDlgSound
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.env = self.currentEnvSound
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.music = self.currentMusic
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.hitFx = self.currentHitFxVolume
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.otherPlayerVolume = self.currentPlayerVolume
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.hitFxWeight = self.currentHitFxWeight
  setVolumeParam(_volumeParam)
  ;
  (frame_Sound._txt_hitFxVolume):SetText(GetStr_Option[18] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_CheckPadEnable = function()
  -- function num : 0_243 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_UsePad):IsCheck()
  self.currentCheckPadEnable = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckSelfPlayerNameTagVisible = function()
  -- function num : 0_244 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_SelfNameShowAllways):IsCheck() then
    self.currentSelfPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    if (frame_Game._btn_SelfNameShowImportant):IsCheck() then
      self.currentSelfPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
    else
      self.currentSelfPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_NoShow
    end
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckPetObjectShow = function()
  -- function num : 0_245 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_PetAll):IsCheck() then
    self.currentPetObjectShow = (CppEnums.PetVisibleType).ePetVisibleType_All
  else
    if (frame_Game._btn_PetMine):IsCheck() then
      self.currentPetObjectShow = (CppEnums.PetVisibleType).ePetVisibleType_Mine
    else
      self.currentPetObjectShow = (CppEnums.PetVisibleType).ePetVisibleType_Hide
    end
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckFontResize = function()
  -- function num : 0_246 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_FontResizeDefault):IsCheck() then
    self.currentFontResizeType = (CppEnums.UIFontSizeType).eUIFontSizeType_Normal
  else
    if (frame_Game._btn_FontResizeBig):IsCheck() then
      self.currentFontResizeType = (CppEnums.UIFontSizeType).eUIFontSizeType_Biggish
    else
      self.currentFontResizeType = (CppEnums.UIFontSizeType).eUIFontSizeType_Big
    end
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckNavGuidType = function()
  -- function num : 0_247 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_NavGuideNone):IsCheck() then
    self.currentNavPathEffectType = (CppEnums.NavPathEffectType).eNavPathEffectType_None
  else
    if (frame_Game._btn_NavGuideArrow):IsCheck() then
      self.currentNavPathEffectType = (CppEnums.NavPathEffectType).eNavPathEffectType_Arrow
    else
      if (frame_Game._btn_NavGuideEffect):IsCheck() then
        self.currentNavPathEffectType = (CppEnums.NavPathEffectType).eNavPathEffectType_PathEffect
      else
        self.currentNavPathEffectType = (CppEnums.NavPathEffectType).eNavPathEffectType_Fairy
      end
    end
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckWorldMapOpenType = function()
  -- function num : 0_248 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_WorldMapOpenByWestMaintain):IsCheck() then
    self.currentWorldMapOpenType = (CppEnums.WorldMapAnimationStyle).afterSpinNorth
  else
    if (frame_Game._btn_WorldMapOpenByCharacterToWest):IsCheck() then
      self.currentWorldMapOpenType = (CppEnums.WorldMapAnimationStyle).characterToNorthSmooth
    else
      if (frame_Game._btn_WorldMapOpenByCharacterMaintain):IsCheck() then
        self.currentWorldMapOpenType = (CppEnums.WorldMapAnimationStyle).characterMaintainSmooth
      else
        if (frame_Game._btn_WorldMapOpenByNone):IsCheck() then
          self.currentWorldMapOpenType = (CppEnums.WorldMapAnimationStyle).noAnimation
        else
          self.currentWorldMapOpenType = (CppEnums.WorldMapAnimationStyle).afterSpinNorth
        end
      end
    end
  end
  GameOption_UpdateOptionChanged()
end

GameOption_WorldMapAngle = function()
  -- function num : 0_249 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_WorldMapCameraDefaultAngle):IsCheck() then
    self.currentWorldMapCameraType = (CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Default
  else
    if (frame_Game._btn_WorldMapCameraDegree30):IsCheck() then
      self.currentWorldMapCameraType = (CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Degree30
    else
      if (frame_Game._btn_WorldMapCameraDegree90):IsCheck() then
        self.currentWorldMapCameraType = (CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Degree90
      else
        self.currentWorldMapCameraType = (CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Default
      end
    end
  end
  GameOption_UpdateOptionChanged()
end

GameOption_ServiceResourceTypeFunc = function()
  -- function num : 0_250 , upvalues : chk_Option, serviceResCount, _btn_ServiceResourceType, serviceResEnumsNumber, _btn_ChatLanguageType, ChatChannelEnumsNumber
  local self = chk_Option
  for index = 0, serviceResCount - 1 do
    if (_btn_ServiceResourceType[index]):IsCheck() then
      self.currentServiceResourceType = serviceResEnumsNumber[index]
      self.currentChatChannelType = self.currentServiceResourceType
      for indexLang = 0, serviceResCount do
        (_btn_ChatLanguageType[indexLang]):SetCheck(ChatChannelEnumsNumber[indexLang] == self.currentChatChannelType)
      end
      break
    end
  end
  do
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_LANGUAGESETTING"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    GameOption_UpdateOptionChanged()
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

ChatChannelOption = function()
  -- function num : 0_251 , upvalues : chk_Option, serviceResCount, _btn_ChatLanguageType, ChatChannelEnumsNumber
  local self = chk_Option
  for index = 0, serviceResCount do
    if (_btn_ChatLanguageType[index]):IsCheck() then
      self.currentChatChannelType = ChatChannelEnumsNumber[index]
      break
    end
  end
  do
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_LANGUAGESETTING"), functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    GameOption_UpdateOptionChanged()
  end
end

GameOption_CheckOtherPlayerNameTagVisible = function()
  -- function num : 0_252 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_OtherNameShow):IsCheck() then
    self.currentOtherPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    self.currentOtherPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckPartyPlayerNameTagVisible = function()
  -- function num : 0_253 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_PartyNameShow):IsCheck() then
    self.currentPartyPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    self.currentPartyPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckGuildPlayerNameTagVisible = function()
  -- function num : 0_254 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_GuildNameShow):IsCheck() then
    self.currentGuildPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    self.currentGuildPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckGuildPlayerNameTagVisible = function()
  -- function num : 0_255 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  if (frame_Game._btn_GuildNameShow):IsCheck() then
    self.currentGuildPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
  else
    self.currentGuildPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckGuideLine_HumanRelation = function()
  -- function num : 0_256 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  self.currentGuideLineHumanRelation = (frame_Game._btn_GuideLineHumanRelation):IsCheck()
  GameOption_UpdateOptionChanged()
end

GameOption_CheckGuideLine_QuestLine = function()
  -- function num : 0_257 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  self.currentGuideLineQuestLine = (frame_Game._btn_GuideLineQuestObject):IsCheck()
  GameOption_UpdateOptionChanged()
end

GameOption_CheckGuideLine_PartyMemberEffect = function()
  -- function num : 0_258 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  self.currentGuideLinePartyMemberEffect = (frame_Game._btn_GuideLinePartyEffect):IsCheck()
  GameOption_UpdateOptionChanged()
end

GameOption_CheckGuideLine_RanderColor = function(renderColorType)
  -- function num : 0_259 , upvalues : randerPlayerColorStr, chk_Option, frame_Game
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if randerPlayerColorStr.zoneChange == renderColorType then
    chk_Option.currentGuideLineZoneChange = (frame_Game._btn_GuideLineZoneChange):IsCheck()
  else
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

    if randerPlayerColorStr.warAlly == renderColorType then
      chk_Option.currentGuideLineWarAlly = (frame_Game._btn_GuideLineWarAlly):IsCheck()
    else
      -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

      if randerPlayerColorStr.guild == renderColorType then
        chk_Option.currentGuideLineGuild = (frame_Game._btn_GuideLineGuild):IsCheck()
      else
        -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

        if randerPlayerColorStr.party == renderColorType then
          chk_Option.currentGuideLineParty = (frame_Game._btn_GuideLineParty):IsCheck()
        else
          -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

          if randerPlayerColorStr.enemy == renderColorType then
            chk_Option.currentGuideLineEnemy = (frame_Game._btn_GuideLineEnemy):IsCheck()
          else
            -- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

            if randerPlayerColorStr.nonWarPlayer == renderColorType then
              chk_Option.currentGuideLineNonWarPlayer = (frame_Game._btn_GuideLineNonWarPlayer):IsCheck()
            end
          end
        end
      end
    end
  end
  GameOption_UpdateOptionChanged()
end

GameOption_CheckPadVibration = function()
  -- function num : 0_260 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_UseVibe):IsCheck()
  self.currentCheckPadVibration = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckPadInvertX = function()
  -- function num : 0_261 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_PadX):IsCheck()
  self.currentCheckPadInvertX = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckPadInvertY = function()
  -- function num : 0_262 , upvalues : chk_Option, frame_Game
  local self = chk_Option
  local check = (frame_Game._btn_PadY):IsCheck()
  self.currentCheckPadInvertY = check
  GameOption_UpdateOptionChanged()
end

GameOption_CheckAlertMSG = function(alertType)
  -- function num : 0_263 , upvalues : frame_Game
  if alertType == 0 then
    bCheck = (frame_Game._btn_Alert_Region):IsCheck()
  else
    if alertType == 1 then
      bCheck = (frame_Game._btn_Alert_TerritoryTrade):IsCheck()
    else
      if alertType == 2 then
        bCheck = (frame_Game._btn_Alert_RoyalTrade):IsCheck()
      else
        if alertType == 3 then
          bCheck = (frame_Game._btn_Alert_Fitness):IsCheck()
        else
          if alertType == 4 then
            bCheck = (frame_Game._btn_Alert_TerritoryWar):IsCheck()
          else
            if alertType == 5 then
              bCheck = (frame_Game._btn_Alert_GuildWar):IsCheck()
            else
              if alertType == 6 then
                bCheck = (frame_Game._btn_Alert_PlayerGotItem):IsCheck()
              else
                if alertType == 7 then
                  bCheck = (frame_Game._btn_Alert_ItemMarket):IsCheck()
                else
                  if alertType == 8 then
                    bCheck = (frame_Game._btn_Alert_LifeLevUp):IsCheck()
                  else
                    if alertType == 9 then
                      bCheck = (frame_Game._btn_Alert_GuildQuest):IsCheck()
                    else
                      if alertType == 10 then
                        bCheck = (frame_Game._btn_Alert_NearMonster):IsCheck()
                      else
                        if alertType == 11 then
                          bCheck = (frame_Game._btn_Alert_ServantMarket):IsCheck()
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
  ToClient_SetMessageFilter(alertType, bCheck)
end

GameOption_PadSensitivityX_slider = function()
  -- function num : 0_264 , upvalues : chk_Option, frame_Game, GetStr_Option
  local self = chk_Option
  local volume = (frame_Game._slide_PadXSen):GetControlPos()
  self.currentCheckPadSensitivityX = volume * 1.9 + 0.1
  ;
  (frame_Game._txt_PadXSen):SetText(GetStr_Option[14] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_PadSensitivityX_button = function()
  -- function num : 0_265 , upvalues : chk_Option, _btn_PadXSen, frame_Game, GetStr_Option
  local self = chk_Option
  local volume = _btn_PadXSen:GetPosX() / ((frame_Game._slide_PadXSen):GetSizeX() - _btn_PadXSen:GetSizeX())
  self.currentCheckPadSensitivityX = volume * 1.9 + 0.1
  ;
  (frame_Game._txt_PadXSen):SetText(GetStr_Option[14] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_PadSensitivityY_slider = function()
  -- function num : 0_266 , upvalues : chk_Option, frame_Game, GetStr_Option
  local self = chk_Option
  local volume = (frame_Game._slide_PadYSen):GetControlPos()
  self.currentCheckPadSensitivityY = volume * 1.9 + 0.1
  ;
  (frame_Game._txt_PadYSen):SetText(GetStr_Option[15] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_PadSensitivityY_button = function()
  -- function num : 0_267 , upvalues : chk_Option, _btn_PadYSen, frame_Game, GetStr_Option
  local self = chk_Option
  local volume = _btn_PadYSen:GetPosX() / ((frame_Game._slide_PadYSen):GetSizeX() - _btn_PadYSen:GetSizeX())
  self.currentCheckPadSensitivityY = volume * 1.9 + 0.1
  ;
  (frame_Game._txt_PadYSen):SetText(GetStr_Option[15] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

GameOption_hitFxVolume_button = function()
  -- function num : 0_268 , upvalues : chk_Option, _btn_hitFxVolume, frame_Sound, _volumeParam, GetStr_Option
  local self = chk_Option
  local volume = _btn_hitFxVolume:GetPosX() / ((frame_Sound._slide_hitFxVolume):GetSizeX() - _btn_hitFxVolume:GetSizeX())
  self.currentHitFxVolume = volume * 100
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.master = self.currentMaster
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.fx = self.currentFxSound
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.dlg = self.currentDlgSound
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.env = self.currentEnvSound
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.music = self.currentMusic
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.hitFx = self.currentHitFxVolume
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.otherPlayerVolume = self.currentPlayerVolume
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  _volumeParam.hitFxWeight = self.currentHitFxWeight
  setVolumeParam(_volumeParam)
  ;
  (frame_Sound._txt_hitFxVolume):SetText(GetStr_Option[18] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(volume * 100, 100)) .. "% <PAOldColor>)")
  GameOption_UpdateOptionChanged()
end

KeyCustom_Action_ButtonPushed_Key = function(inputTypeIndex)
  -- function num : 0_269 , upvalues : configDataIndex, INPUT_TYPE
  local inputType = configDataIndex + inputTypeIndex - 2
  if inputType >= 0 then
    INPUT_TYPE = inputType
    SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionKey)
    setKeyCustomizing(true)
  end
end

KeyCustom_Action_ButtonPushed_Pad = function(inputTypeIndex)
  -- function num : 0_270 , upvalues : configDataIndex, INPUT_TYPE
  local inputType = configDataIndex + inputTypeIndex - 2
  if inputType >= 0 then
    INPUT_TYPE = inputType
    SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPad)
    setKeyCustomizing(true)
  else
    if inputType == -1 then
      KeyCustom_Action_ButtonPushed_PadFunc2()
    else
      KeyCustom_Action_ButtonPushed_PadFunc1()
    end
  end
end

KeyCustom_Action_ButtonPushed_PadFunc1 = function()
  -- function num : 0_271
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPadFunc1)
  setKeyCustomizing(true)
end

KeyCustom_Action_ButtonPushed_PadFunc2 = function()
  -- function num : 0_272
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPadFunc2)
  setKeyCustomizing(true)
end

KeyCustom_Action_UpdateButtonText_Key = function()
  -- function num : 0_273 , upvalues : INPUT_COUNT_START, INPUT_COUNT_END, setKeyConfigDataConfigButton, updateKeyConfig
  for ii = INPUT_COUNT_START, INPUT_COUNT_END do
    setKeyConfigDataConfigButton(ii, keyCustom_GetString_ActionKey(ii))
  end
  updateKeyConfig()
end

KeyCustom_Action_UpdateButtonText_Pad = function()
  -- function num : 0_274 , upvalues : keyConfigData, INPUT_COUNT_START, INPUT_COUNT_END, setKeyConfigDataConfigPad, updateKeyConfig
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  (keyConfigData[-2]).padKeyText = keyCustom_GetString_ActionPadFunc1()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (keyConfigData[-1]).padKeyText = keyCustom_GetString_ActionPadFunc2()
  for ii = INPUT_COUNT_START, INPUT_COUNT_END do
    setKeyConfigDataConfigPad(ii, keyCustom_GetString_ActionPad(ii))
  end
  updateKeyConfig()
end

KeyCustom_Action_GetInputType = function()
  -- function num : 0_275 , upvalues : INPUT_TYPE
  return INPUT_TYPE
end

KeyCustom_Action_KeyButtonCheckReset = function(inputType)
  -- function num : 0_276 , upvalues : BUTTON_KEY
  (BUTTON_KEY[inputType + 2]):SetCheck(false)
end

KeyCustom_Action_PadButtonCheckReset = function(inputType)
  -- function num : 0_277 , upvalues : BUTTON_PAD
  (BUTTON_PAD[inputType + 2]):SetCheck(false)
end

KeyCustom_Action_FuncPadButtonCheckReset = function(inputType)
  -- function num : 0_278 , upvalues : BUTTON_PAD
  (BUTTON_PAD[inputType]):SetCheck(false)
end

ResetKeyCustombyAttacked = function()
  -- function num : 0_279 , upvalues : INPUT_TYPE, INPUT_TYPE_UI
  if Panel_Window_Option:GetShow() then
    setKeyCustomizing(false)
    if INPUT_TYPE ~= nil then
      KeyCustom_Action_UpdateButtonText_Key()
      KeyCustom_Action_KeyButtonCheckReset(INPUT_TYPE)
    end
    if INPUT_TYPE_UI ~= nil then
      KeyCustom_Ui_UpdateButtonText_Key()
      KeyCustom_Ui_KeyButtonCheckReset(INPUT_TYPE_UI)
    end
    SetUIMode((Defines.UIMode).eUIMode_Default)
  end
end

KeyCustom_UI_ButtonPushed_Key = function(inputTypeIndex)
  -- function num : 0_280 , upvalues : configDataIndex_UI, INPUT_TYPE_UI
  local inputType = configDataIndex_UI + inputTypeIndex
  INPUT_TYPE_UI = inputType
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_UiKey)
  setKeyCustomizing(true)
end

KeyCustom_UI_ButtonPushed_Pad = function(inputTypeIndex)
  -- function num : 0_281 , upvalues : configDataIndex_UI, INPUT_TYPE_UI
  local inputType = configDataIndex_UI + inputTypeIndex
  INPUT_TYPE_UI = inputType
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_UiPad)
  setKeyCustomizing(true)
end

KeyCustom_Ui_UpdateButtonText_Key = function()
  -- function num : 0_282 , upvalues : INPUT_COUNT_START_UI, INPUT_COUNT_END_UI, setKeyConfigData_UIConfigButton, updateKeyConfig_UI
  for ii = INPUT_COUNT_START_UI, INPUT_COUNT_END_UI do
    setKeyConfigData_UIConfigButton(ii, keyCustom_GetString_UiKey(ii))
  end
  updateKeyConfig_UI()
end

KeyCustom_Ui_UpdateButtonText_Pad = function()
  -- function num : 0_283 , upvalues : INPUT_COUNT_START_UI, INPUT_COUNT_END_UI, setKeyConfigData_UIConfigPad, updateKeyConfig_UI
  for ii = INPUT_COUNT_START_UI, INPUT_COUNT_END_UI do
    setKeyConfigData_UIConfigPad(ii, keyCustom_GetString_UiPad(ii))
  end
  updateKeyConfig_UI()
end

KeyCustom_Ui_GetInputType = function()
  -- function num : 0_284 , upvalues : INPUT_TYPE_UI
  return INPUT_TYPE_UI
end

KeyCustom_Ui_KeyButtonCheckReset = function(inputType)
  -- function num : 0_285 , upvalues : BUTTON_KEY_UI
  (BUTTON_KEY_UI[inputType]):SetCheck(false)
end

KeyCustom_Ui_PadButtonCheckReset = function(inputType)
  -- function num : 0_286 , upvalues : BUTTON_PAD_UI
  (BUTTON_PAD_UI[inputType]):SetCheck(false)
end

GameOption_UpdateOptionChanged = function()
  -- function num : 0_287 , upvalues : chk_Option, gamePanel_Main
  local self = chk_Option
  if self.currentScreenModeIdx == self.appliedScreenModeIdx and self.currentScreenResolutionIdx == self.appliedScreenModeIdx and self.currentScreenShotFormat == self.appliedScreenShotFormat and self.currentScreenShotSize == self.appliedScreenShotSize and self.currentWatermarkService == self.appliedWatermarkService and self.currentWatermarkPosition == self.appliedWatermarkPosition and self.currentWatermarkScale == self.appliedWatermarkScale and self.currentWatermarkAlpha == self.appliedWatermarkAlpha and self.currentColorBlind == self.appliedColorBlind and self.currentSelfPlayerOnlyEffect == self.appliedSelfPlayerOnlyEffect and self.currentNearestPlayerOnlyEffect == self.appliedNearestPlayerOnlyEffect and self.currentSelfPlayerOnlyLantern == self.appliedSelfPlayerOnlyLantern and self.currentLowPower == self.appliedLowPower and self.currentUpscaleEnable == self.appliedUpscaleEnable and self.currentCropModeEnable == self.appliedCropModeEnable and self.currentCropModeScaleX == self.appliedCropModeScaleX and self.currentCropModeScaleY == self.appliedCropModeScaleY and self.currentAutoOptimization == self.appliedAutoOptimization and self.currentOptimizationFrame == self.appliedOptimizationFrame and self.currentTextureQualityIdx == self.appliedTextureQualityIdx and self.currentGraphicOptionIdx == self.appliedGraphicOptionIdx and self.currentGammaValue == self.appliedGammaValue and self.currentContrastValue == self.appliedContrastValue and self.currentCheckDof == self.appliedCheckDof and self.currentCheckAA == self.appliedCheckAA and self.currentCheckUltra == self.appliedCheckUltra and self.currentCheckLensBlood == self.appliedCheckLensBlood and self.currentCheckBloodEffect == self.appliedCheckBloodEffect and self.currentCheckRepresent == self.appliedCheckRepresent and self.currentCheckSnowPoolOnlyInSafeZone == self.appliedCheckSnowPoolOnlyInSafeZone and self.currentCheckSSAO == self.appliedCheckSSAO and self.currentCheckTessellation == self.appliedCheckTessellation and self.currentCheckPostFilter == self.appliedCheckPostFilter and self.currentCheckCharacterEffect == self.appliedCheckCharacterEffect and self.currentMaster == self.appliedMaster and self.currentMusic == self.appliedMusic and self.currentFxSound == self.appliedFxSound and self.currentEnvSound == self.appliedEnvSound and self.currentDlgSound == self.appliedDlgSound and self.currentCheckMusic == self.appliedCheckMusic and self.currentCheckSound == self.appliedCheckSound and self.currentCheckEnvSound == self.appliedCheckEnvSound and self.currentCheckCombatMusic == self.appliedCheckCombatMusic and self.currentCheckNpcVoice == self.appliedCheckNpcVoice and self.currentCheckRiddingMusic == self.appliedCheckRiddingMusic and self.currentCheckWhisperMusic == self.appliedCheckWhisperMusic and self.currentCheckTraySoundOnOff == self.appliedCheckTraySoundOnOff and self.currentCheckShowSkillCmd == self.appliedCheckShowSkillCmd and self.currentCheckAutoAim == self.appliedCheckAutoAim and self.currentCheckHideWindowByAttacked == self.appliedCheckHideWindowByAttacked and self.currentCheckShowGuildLoginMessage == self.appliedCheckShowGuildLoginMessage and self.currentCheckEnableSimpleUI == self.appliedCheckEnableSimpleUI and self.currentCheckRenderCharacterColor == self.appliedCheckRenderCharacterColor and self.currentCheckMouseMove == self.appliedCheckMouseMove and self.currentCheckEnableOVR == self.appliedCheckEnableOVR and self.currentCheckEffectAlpha == self.appliedCheckEffectAlpha and self.currentCheckMouseInvertX == self.appliedCheckMouseInvertX and self.currentCheckMouseInvertY == self.appliedCheckMouseInvertY and self.currentCheckMouseSensitivityX == self.appliedCheckMouseSensitivityX and self.currentCheckMouseSensitivityY == self.appliedCheckMouseSensitivityY and self.currentCheckPadEnable == self.appliedCheckPadEnable and self.currentCheckPadVibration == self.appliedCheckPadVibration and self.currentCheckPadInvertX == self.appliedCheckPadInvertX and self.currentCheckPadInvertY == self.appliedCheckPadInvertY and self.currentCheckPadSensitivityX == self.appliedCheckPadSensitivityX and self.currentCheckPadSensitivityY == self.appliedCheckPadSensitivityY and self.currentCheckCameraMasterPower == self.appliedCheckCameraMasterPower and self.currentCheckColorByPass == self.appliedCheckColorByPass and self.currentCheckCameraShakePower == self.appliedCheckCameraShakePower and self.currentCheckMotionBlurPower == self.appliedCheckMotionBlurPower and self.currentCheckCameraPosPower == self.appliedCheckCameraPosPower and self.currentCheckCameraFovPower == self.appliedCheckCameraFovPower and self.currentCheckUIScale == self.appliedCheckUIScale and self.currentSelfPlayerNameTagVisible == self.appliedSelfPlayerNameTagVisible and self.currentOtherPlayerNameTagVisible == self.appliedOtherPlayerNameTagVisible and self.currentPartyPlayerNameTagVisible == self.appliedPartyPlayerNameTagVisible and self.currentGuildPlayerNameTagVisible == self.appliedGuildPlayerNameTagVisible and self.currentPetObjectShow == self.appliedPetObjectShow and self.currentFontResizeType == self.appliedFontResizeType and self.currentNavPathEffectType == self.appliedNavPathEffectType and self.currentWorldMapOpenType == self.appliedWorldMapOpenType and self.currentWorldMapCameraType == self.appliedWorldMapCamreraType and self.currentHitFxWeight == self.appliedHitFxWeight and self.currentPlayerVolume == self.appliedPlayerVolume and self.currentFovValue == self.appliedFovValue and self.currentServiceResourceType == self.appliedServiceResourceType and self.currentChatChannelType == self.appliedChatChannelType and self.currentCheckIsUIModeMouseLock == self.appliedCheckIsUIModeMouseLock and self.currentCheckIsPvpRefuse == self.appliedCheckIsPvpRefuse and self.currentCheckIsExchangeRefuse == self.appliedCheckIsExchangeRefuse and self.currentCheckIsHideMast == self.appliedCheckIsHideMast and self.currentCheckWorkerVisible == self.appliedCheckWorkerVisible and self.currentCheckShowCashAlert == self.appliedCheckShowCashAlert then
    (gamePanel_Main._btn_Apply):SetEnable(false)
  else
    ;
    (gamePanel_Main._btn_Apply):SetEnable(true)
  end
end

GameOption_InitDisplayModeList = function(availableScreenResolution)
  -- function num : 0_288 , upvalues : chk_Option
  local self = chk_Option
  local screenResolutionList = self.screenResolutionList
  self.SCREEN_RESOLUTION_COUNT = availableScreenResolution:getDisplayModeListSize()
  for ii = 1, self.SCREEN_RESOLUTION_COUNT do
    local screenResolution = {height, width}
    screenResolution.height = availableScreenResolution:getDisplayModeHeight(ii - 1)
    screenResolution.width = availableScreenResolution:getDisplayModeWidth(ii - 1)
    screenResolutionList[ii] = screenResolution
  end
end

GameOption_TogglePanel = function()
  -- function num : 0_289 , upvalues : gamePanel_Main, frame_Game, isKeyConfig_Open, isKeyConfig_UI_Open
  if (CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode == (UI.Get_ProcessorInputMode)() then
    return 
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Gacha_Roulette then
    return 
  end
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_Window_Option:SetIgnore(false)
  local selfPlayer = getSelfPlayer()
  if isNeedGameOptionFromServer() == false then
    (gamePanel_Main._btn_Game):SetShow(false)
    ;
    (gamePanel_Main._btn_KeyConfig):SetShow(false)
    ;
    (gamePanel_Main._btn_KeyConfig_UI):SetShow(false)
    local serviceType = getGameServiceType()
    if serviceType ~= (CppEnums.GameServiceType).eGameServiceType_NA_ALPHA and serviceType ~= (CppEnums.GameServiceType).eGameServiceType_NA_REAL and serviceType ~= (CppEnums.GameServiceType).eGameServiceType_DEV then
      (gamePanel_Main._btn_Language):SetShow(false)
    end
  else
    do
      ;
      (gamePanel_Main._btn_Language):SetShow(false)
      if selfPlayer ~= nil then
        if (selfPlayer:get()):getLevel() > 5 then
          (frame_Game._btn_EnableSimpleUI):SetIgnore(false)
        else
          ;
          (frame_Game._btn_EnableSimpleUI):SetIgnore(true)
        end
      else
        ;
        (frame_Game._btn_EnableSimpleUI):SetIgnore(true)
      end
      local isShow = Panel_Window_Option:IsShow()
      if isShow == false then
        Panel_GameOption_Initialize()
        Panel_Window_Option:SetShow(true, true)
        isKeyConfig_Open = false
        isKeyConfig_UI_Open = false
        audioPostEvent_SystemUi(1, 0)
        if isNeedGameOptionFromServer() == true then
          keyCustom_StartEdit()
        end
      else
        Panel_GameOption_Initialize()
        Panel_Window_Option:SetShow(false, true)
        audioPostEvent_SystemUi(1, 0)
        if Panel_Tooltip_SimpleText:GetShow() then
          TooltipSimple_Hide()
        end
      end
    end
  end
end

GameOption_Cancel = function()
  -- function num : 0_290 , upvalues : chk_Option, currentLUT, isFindScreenResolution, _volumeParam, gamePanel_Main
  local self = chk_Option
  if self.appliedScreenModeIdx ~= self.currentScreenModeIdx then
    setScreenMode(self.appliedScreenModeIdx)
  end
  if self.appliedScreenShotFormat ~= self.currentScreenShotFormat then
    setScreenShotFormat(self.appliedScreenShotFormat)
  end
  if self.appliedScreenShotSize ~= self.currentScreenShotSize then
    setScreenShotQuality(self.appliedScreenShotSize)
  end
  if self.currentWatermarkPosition ~= self.appliedWatermarkPosition then
    self.appliedWatermarkPosition = self.currentWatermarkPosition
    setWatermarkPosition(self.appliedWatermarkPosition)
  end
  if self.currentWatermarkScale ~= self.appliedWatermarkScale then
    self.appliedWatermarkScale = self.currentWatermarkScale
    setWatermarkScale(self.appliedWatermarkScale)
  end
  if self.currentWatermarkService ~= self.appliedWatermarkService then
    self.appliedWatermarkService = self.currentWatermarkService
    setWatermarkService(self.appliedWatermarkService)
  end
  if self.currentWatermarkAlpha ~= self.appliedWatermarkAlpha then
    self.appliedWatermarkAlpha = self.currentWatermarkAlpha
    setWatermarkAlpha(self.appliedWatermarkAlpha)
  end
  if self.appliedColorBlind ~= self.currentColorBlind then
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode, self.appliedColorBlind)
    ToClient_ChangeColorBlindMode(self.appliedColorBlind)
    FGlobal_Rador_SetColorBlindMode()
    FGlobal_ChangeEffectCheck()
    FGlobal_Window_Servant_ColorBlindUpdate()
    UIMain_QuestUpdate()
  end
  if self.appliedSelfPlayerOnlyEffect ~= self.currentSelfPlayerOnlyEffect then
    setSelfPlayerOnlyEffect(self.appliedSelfPlayerOnlyEffect)
  end
  if self.appliedNearestPlayerOnlyEffect ~= self.currentNearestPlayerOnlyEffect then
    setNearestPlayerOnlyEffect(self.appliedNearestPlayerOnlyEffect)
  end
  if self.appliedSelfPlayerOnlyLantern ~= self.currentSelfPlayerOnlyLantern then
    setSelfPlayerOnlyLantern(self.appliedSelfPlayerOnlyLantern)
  end
  if self.appliedLowPower ~= self.currentLowPower then
    setPresentLock(self.appliedLowPower)
  end
  if self.appliedUpscaleEnable ~= self.currentUpscaleEnable then
    setUpscaleEnable(self.appliedUpscaleEnable)
  end
  if self.appliedCropModeEnable ~= self.currentCropModeEnable then
    setCropModeEnable(self.appliedCropModeEnable)
  end
  if self.appliedCropModeScaleX ~= self.currentCropModeScaleX then
    setCropModeScaleX(self.appliedCropModeScaleX)
  end
  if self.appliedCropModeScaleY ~= self.currentCropModeScaleY then
    setCropModeScaleY(self.appliedCropModeScaleY)
  end
  if self.appliedAutoOptimization ~= self.currentAutoOptimization then
    setAutoOptimization(self.appliedAutoOptimization)
  end
  if self.appliedOptimizationFrame ~= self.currentOptimizationFrame then
    setAutoOptimizationFrameLimit(self.appliedOptimizationFrame)
  end
  if self.appliedLUT ~= self.currentLUT then
    setCameraLUTFilter(self.appliedLUT)
    currentLUT = self.appliedLUT
  end
  if self.appliedScreenResolutionIdx ~= self.currentScreenResolutionIdx and isFindScreenResolution == true then
    local index = self.appliedScreenResolutionIdx
    local screenDataSize = #self.screenResolutionList
    if screenDataSize < index then
      index = screenDataSize
    end
    setScreenResolution(((self.screenResolutionList)[index]).width, ((self.screenResolutionList)[index]).height)
  end
  do
    if self.appliedTextureQualityIdx ~= self.currentTextureQualityIdx then
      setTextureQuality(self.appliedTextureQualityIdx)
    end
    if self.appliedGraphicOptionIdx ~= self.currentGraphicOptionIdx then
      setGraphicOption(self.appliedGraphicOptionIdx)
    end
    if self.appliedCheckDof ~= self.currentCheckDof then
      setDof(self.appliedCheckDof)
    end
    if self.appliedCheckAA ~= self.currentCheckAA then
      setAntiAliasing(self.appliedCheckAA)
    end
    if self.appliedCheckUltra ~= self.currentCheckUltra then
      setGraphicUltra(self.appliedCheckUltra)
    end
    if self.appliedCheckLensBlood ~= self.currentCheckLensBlood then
      setLensBlood(self.appliedCheckLensBlood)
    end
    if self.appliedCheckBloodEffect ~= self.currentCheckBloodEffect then
      if self.appliedCheckBloodEffect == true then
        setBloodEffect(2)
      else
        setBloodEffect(0)
      end
    end
    if self.appliedCheckRepresent ~= self.currentCheckRepresent then
      setRepresentative(self.appliedCheckRepresent)
    end
    if self.appliedCheckSnowPoolOnlyInSafeZone ~= self.currentCheckSnowPoolOnlyInSafeZone then
      setSnowPoolOnlyInSafeZone(self.appliedCheckSnowPoolOnlyInSafeZone)
    end
    if self.appliedCheckSSAO ~= self.currentCheckSSAO then
      setSSAO(self.appliedCheckSSAO)
    end
    if self.appliedCheckTessellation ~= self.currentCheckTessellation then
      setTessellation(self.appliedCheckTessellation)
    end
    if self.appliedCheckPostFilter ~= self.currentCheckPostFilter then
      if self.appliedCheckPostFilter == true then
        setPostFilter(2)
      else
        setPostFilter(1)
      end
    end
    if self.appliedCheckCharacterEffect ~= self.currentCheckCharacterEffect then
      setCharacterEffect(self.appliedCheckCharacterEffect)
    end
    if self.appliedGammaValue ~= self.currentGammaValue then
      setGammaValue(self.appliedGammaValue)
    end
    if self.appliedContrastValue ~= self.currentContrastValue then
      setContrastValue(self.appliedContrastValue)
    end
    if self.appliedFovValue ~= self.currentFovValue then
      setFov(self.appliedFovValue)
    end
    -- DECOMPILER ERROR at PC341: Confused about usage of register: R1 in 'UnsetPending'

    if self.appliedMaster ~= self.currentMaster or self.appliedMusic ~= self.currentMusic or self.appliedFxSound ~= self.currentFxSound or self.appliedEnvSound ~= self.currentEnvSound or self.appliedDlgSound ~= self.currentDlgSound or self.appliedHitFxVolume ~= self.currentHitFxVolume or self.appliedHitFxWeight ~= self.currentHitFxWeight or self.appliedPlayerVolume ~= self.currentPlayerVolume then
      _volumeParam.master = self.appliedMaster
      -- DECOMPILER ERROR at PC344: Confused about usage of register: R1 in 'UnsetPending'

      _volumeParam.fx = self.appliedFxSound
      -- DECOMPILER ERROR at PC347: Confused about usage of register: R1 in 'UnsetPending'

      _volumeParam.dlg = self.appliedDlgSound
      -- DECOMPILER ERROR at PC350: Confused about usage of register: R1 in 'UnsetPending'

      _volumeParam.env = self.appliedEnvSound
      -- DECOMPILER ERROR at PC353: Confused about usage of register: R1 in 'UnsetPending'

      _volumeParam.music = self.appliedMusic
      -- DECOMPILER ERROR at PC356: Confused about usage of register: R1 in 'UnsetPending'

      _volumeParam.hitFx = self.appliedHitFxVolume
      -- DECOMPILER ERROR at PC359: Confused about usage of register: R1 in 'UnsetPending'

      _volumeParam.otherPlayerVolume = self.appliedPlayerVolume
      -- DECOMPILER ERROR at PC362: Confused about usage of register: R1 in 'UnsetPending'

      _volumeParam.hitFxWeight = self.appliedHitFxWeight
      setVolumeParam(_volumeParam)
    end
    if self.appliedCheckMusic ~= self.currentCheckMusic or self.appliedCheckSound ~= self.currentCheckSound or self.appliedCheckEnvSound ~= self.currentCheckEnvSound then
      setEnableSound(self.appliedCheckSound, self.appliedCheckMusic, self.appliedCheckEnvSound, self.appliedCheckWhisperMusic, self.appliedCheckTraySoundOnOff)
    end
    if self.appliedCheckCombatMusic ~= self.currentCheckCombatMusic then
      setEnableBattleSoundType(self.appliedCheckCombatMusic)
    end
    if self.appliedCheckNpcVoice ~= self.currentCheckNpcVoice then
      setAudioResourceType(self.appliedCheckNpcVoice)
    end
    if self.appliedCheckRiddingMusic ~= self.currentCheckRiddingMusic then
      setEnableRidingSound(self.appliedCheckRiddingMusic)
    end
    if self.appliedCheckWhisperMusic ~= self.currentCheckWhisperMusic then
      setEnableSound(self.appliedCheckSound, self.appliedCheckMusic, self.appliedCheckEnvSound, self.appliedCheckWhisperMusic, self.appliedCheckTraySoundOnOff)
    end
    if self.appliedCheckTraySoundOnOff ~= self.currentCheckTraySoundOnOff then
      setEnableSound(self.appliedCheckSound, self.appliedCheckMusic, self.appliedCheckEnvSound, self.appliedCheckWhisperMusic, self.appliedCheckTraySoundOnOff)
    end
    if self.appliedCheckShowSkillCmd ~= self.currentCheckShowSkillCmd then
      setShowSkillCmd(self.appliedCheckShowSkillCmd)
    end
    if self.appliedCheckAutoAim ~= self.currentCheckAutoAim then
      setAimAssist(self.appliedCheckAutoAim)
    end
    if self.appliedCheckHideWindowByAttacked ~= self.currentCheckHideWindowByAttacked then
      setHideWindowByAttacked(self.appliedCheckHideWindowByAttacked)
    end
    if self.appliedCheckShowGuildLoginMessage ~= self.currentCheckShowGuildLoginMessage then
      setShowGuildLoginMessage(self.appliedCheckShowGuildLoginMessage)
    end
    if self.appliedCheckEnableSimpleUI ~= self.currentCheckEnableSimpleUI then
      setEnableSimpleUI(self.appliedCheckEnableSimpleUI)
    end
    if self.appliedCheckRenderCharacterColor ~= self.currentCheckRenderCharacterColor then
      setRenderCharacterColor(self.appliedCheckRenderCharacterColor)
    end
    if self.appliedCheckMouseMove ~= self.currentCheckMouseMove then
      setGameMouseMode(self.appliedCheckMouseMove)
    end
    if self.appliedCheckMouseInvertX ~= self.currentCheckMouseInvertX then
      setMouseInvertX(self.appliedCheckMouseInvertX)
    end
    if self.appliedCheckMouseInvertY ~= self.currentCheckMouseInvertY then
      setMouseInvertY(self.appliedCheckMouseInvertY)
    end
    if self.appliedCheckMouseSensitivityX ~= self.currentCheckMouseSensitivityX then
      setMouseSensitivityX(self.appliedCheckMouseSensitivityX)
    end
    if self.appliedCheckMouseSensitivityY ~= self.currentCheckMouseSensitivityY then
      setMouseSensitivityY(self.appliedCheckMouseSensitivityY)
    end
    if self.appliedCheckPadEnable ~= self.currentCheckPadEnable then
      setGamePadEnable(self.appliedCheckPadEnable)
    end
    if self.appliedCheckPadVibration ~= self.currentCheckPadVibration then
      setGamePadVibration(self.appliedCheckPadVibration)
    end
    if self.appliedCheckPadInvertX ~= self.currentCheckPadInvertX then
      setGamePadInvertX(self.appliedCheckPadInvertX)
    end
    if self.appliedCheckPadInvertY ~= self.currentCheckPadInvertY then
      setGamePadInvertY(self.appliedCheckPadInvertY)
    end
    if self.appliedCheckPadSensitivityX ~= self.currentCheckPadSensitivityX then
      setGamePadSensitivityX(self.appliedCheckPadSensitivityX)
    end
    if self.appliedCheckPadSensitivityY ~= self.currentCheckPadSensitivityY then
      setGamePadSensitivityY(self.appliedCheckPadSensitivityY)
    end
    if self.appliedCheckEffectAlpha ~= self.currentCheckEffectAlpha then
      setEffectAlpha(self.appliedCheckEffectAlpha)
    end
    if self.appliedCheckCameraMasterPower ~= self.currentCheckCameraMasterPower then
      setCameraMasterPower(self.appliedCheckCameraMasterPower)
    end
    if self.appliedCheckColorByPass ~= self.currentCheckColorByPass then
      setSkillPostEffect(self.appliedCheckColorByPass)
    end
    if self.appliedCheckCameraShakePower ~= self.currentCheckCameraShakePower then
      setCameraShakePower(self.appliedCheckCameraShakePower)
    end
    if self.appliedCheckMotionBlurPower ~= self.currentCheckMotionBlurPower then
      setMotionBlurPower(self.appliedCheckMotionBlurPower)
    end
    if self.appliedCheckCameraPosPower ~= self.currentCheckCameraPosPower then
      setCameraTranslatePower(self.appliedCheckCameraPosPower)
    end
    if self.appliedCheckCameraFovPower ~= self.currentCheckCameraFovPower then
      setCameraFovPower(self.appliedCheckCameraFovPower)
    end
    if self.appliedCheckSelfNameShow ~= self.currentCheckSelfNameShow then
      setUISelfPlayerNameTagAllwaysShow(self.appliedCheckSelfNameShow)
    end
    if self.appliedServiceResourceType ~= self.currentServiceResourceType then
      ToClient_saveServiceResourceType(self.appliedServiceResourceType)
    end
    if self.appliedChatChannelType ~= self.currentChatChannelType then
      ToClient_saveChatChannelType(self.appliedChatChannelType)
    end
    if self.appliedCheckUIScale ~= self.currentCheckUIScale then
      setUIScale(self.appliedCheckUIScale)
    end
    if self.appliedCheckWorkerVisible ~= self.currentCheckWorkerVisible then
      ToClient_setWorkerVisible(self.appliedCheckWorkerVisible)
    end
    ;
    (gamePanel_Main._btn_Apply):SetEnable(false)
    SetUIMode((Defines.UIMode).eUIMode_Default)
    ;
    (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
    keyCustom_RollBack()
    Panel_Window_Option:SetShow(false, true)
    audioPostEvent_SystemUi(1, 0)
    setAudioOptionByConfig()
    if Panel_Tooltip_SimpleText:GetShow() then
      TooltipSimple_Hide()
    end
  end
end

GameOption_Confirm = function()
  -- function num : 0_291
  if isNeedGameOptionFromServer() == true then
    FGlobal_QuestWindowRateSetting()
    Panel_UIControl_SetShow(false)
  end
  GameOption_Apply()
  Panel_Window_Option:SetShow(false, true)
  audioPostEvent_SystemUi(1, 0)
end

GameOption_SaveSetting = function()
  -- function num : 0_292
  PaGlobal_Panel_SaveSetting_Show()
end

GameOption_Apply = function()
  -- function num : 0_293 , upvalues : chk_Option, frame_Display, _volumeParam, frame_Game, randerPlayerColorStr, gamePanel_Main
  local isChangedDisplay = false
  local isResetUI = false
  local self = chk_Option
  SetUIMode((Defines.UIMode).eUIMode_Default)
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
  if self.currentScreenModeIdx ~= self.appliedScreenModeIdx then
    self.appliedScreenModeIdx = self.currentScreenModeIdx
    setScreenMode(self.appliedScreenModeIdx)
    isChangedDisplay = true
  end
  if self.currentScreenShotFormat ~= self.appliedScreenShotFormat then
    self.appliedScreenShotFormat = self.currentScreenShotFormat
    setScreenShotFormat(self.appliedScreenShotFormat)
  end
  if self.currentScreenShotSize ~= self.appliedScreenShotSize then
    self.appliedScreenShotSize = self.currentScreenShotSize
    setScreenShotQuality(self.appliedScreenShotSize)
  end
  if self.currentCheckEffectAlpha ~= self.appliedCheckEffectAlpha then
    self.appliedCheckEffectAlpha = self.currentCheckEffectAlpha
    setEffectAlpha(self.appliedCheckEffectAlpha)
  end
  if self.currentWatermarkPosition ~= self.appliedWatermarkPosition then
    self.appliedWatermarkPosition = self.currentWatermarkPosition
    setWatermarkPosition(self.appliedWatermarkPosition)
  end
  if self.currentWatermarkScale ~= self.appliedWatermarkScale then
    self.appliedWatermarkScale = self.currentWatermarkScale
    setWatermarkScale(self.appliedWatermarkScale)
  end
  if self.currentWatermarkService ~= self.appliedWatermarkService then
    self.appliedWatermarkService = self.currentWatermarkService
    setWatermarkService(self.appliedWatermarkService)
  end
  if self.currentWatermarkAlpha ~= self.appliedWatermarkAlpha then
    self.appliedWatermarkAlpha = self.currentWatermarkAlpha
    setWatermarkAlpha(self.appliedWatermarkAlpha)
  end
  if self.currentColorBlind ~= self.appliedColorBlind then
    self.appliedColorBlind = self.currentColorBlind
    ;
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode, self.appliedColorBlind)
    ToClient_ChangeColorBlindMode(self.appliedColorBlind)
    FGlobal_Rador_SetColorBlindMode()
    FGlobal_ChangeEffectCheck()
    FGlobal_Window_Servant_ColorBlindUpdate()
    UIMain_QuestUpdate()
  end
  if self.currentSelfPlayerOnlyEffect ~= self.appliedSelfPlayerOnlyEffect then
    self.appliedSelfPlayerOnlyEffect = self.currentSelfPlayerOnlyEffect
    setSelfPlayerOnlyEffect(self.appliedSelfPlayerOnlyEffect)
  end
  if self.currentNearestPlayerOnlyEffect ~= self.appliedNearestPlayerOnlyEffect then
    self.appliedNearestPlayerOnlyEffect = self.currentNearestPlayerOnlyEffect
    setNearestPlayerOnlyEffect(self.appliedNearestPlayerOnlyEffect)
  end
  if self.currentSelfPlayerOnlyLantern ~= self.appliedSelfPlayerOnlyLantern then
    self.appliedSelfPlayerOnlyLantern = self.currentSelfPlayerOnlyLantern
    setSelfPlayerOnlyLantern(self.appliedSelfPlayerOnlyLantern)
  end
  if self.currentLowPower ~= self.appliedLowPower then
    self.appliedLowPower = self.currentLowPower
    setPresentLock(self.appliedLowPower)
  end
  if self.currentUpscaleEnable ~= self.appliedUpscaleEnable then
    self.appliedUpscaleEnable = self.currentUpscaleEnable
    setUpscaleEnable(self.appliedUpscaleEnable)
  end
  if self.currentCropModeScaleX > 0.95 and self.currentCropModeScaleY > 0.95 and self.currentCropModeEnable then
    (frame_Display._btn_CropModeEnable):SetCheck(false)
    self.currentCropModeEnable = false
  end
  if self.currentCropModeEnable ~= self.appliedCropModeEnable then
    self.appliedCropModeEnable = self.currentCropModeEnable
    setCropModeEnable(self.appliedCropModeEnable)
  end
  if self.appliedCropModeEnable then
    GameOption_CropModeScaleX_slider()
    GameOption_CropModeScaleY_slider()
  end
  if self.currentAutoOptimization ~= self.appliedAutoOptimization then
    self.appliedAutoOptimization = self.currentAutoOptimization
    setAutoOptimization(self.appliedAutoOptimization)
  end
  if self.appliedAutoOptimization then
    self.appliedOptimizationFrame = self.currentOptimizationFrame
    GameOption_AutoOptimization_slider()
  end
  if self.currentCheckEnableOVR ~= self.appliedCheckEnableOVR then
    self.appliedCheckEnableOVR = self.currentCheckEnableOVR
    setRenderOVR(self.appliedCheckEnableOVR)
  end
  if self.currentScreenResolutionIdx ~= self.appliedScreenResolutionIdx then
    self.appliedScreenResolutionIdx = self.currentScreenResolutionIdx
    local index = self.appliedScreenResolutionIdx
    local screenDataSize = #self.screenResolutionList
    if screenDataSize < index then
      index = screenDataSize
    end
    setScreenResolution(((self.screenResolutionList)[index]).width, ((self.screenResolutionList)[index]).height)
    isChangedDisplay = true
    if close_force_WindowPanelList ~= nil then
      close_force_WindowPanelList()
    end
  end
  do
    if self.currentTextureQualityIdx ~= self.appliedTextureQualityIdx then
      self.appliedTextureQualityIdx = self.currentTextureQualityIdx
      setTextureQuality(self.appliedTextureQualityIdx)
    end
    if self.currentGraphicOptionIdx ~= self.appliedGraphicOptionIdx then
      self.appliedGraphicOptionIdx = self.currentGraphicOptionIdx
      setGraphicOption(self.appliedGraphicOptionIdx)
    end
    if self.currentCheckDof ~= self.appliedCheckDof then
      self.appliedCheckDof = self.currentCheckDof
      setDof(self.appliedCheckDof)
    end
    if self.currentCheckAA ~= self.appliedCheckAA then
      self.appliedCheckAA = self.currentCheckAA
      setAntiAliasing(self.appliedCheckAA)
    end
    if self.currentCheckUltra ~= self.appliedCheckUltra then
      self.appliedCheckUltra = self.currentCheckUltra
      setGraphicUltra(self.appliedCheckUltra)
    end
    if self.currentCheckLensBlood ~= self.appliedCheckLensBlood then
      self.appliedCheckLensBlood = self.currentCheckLensBlood
      setLensBlood(self.appliedCheckLensBlood)
    end
    if self.currentCheckBloodEffect ~= self.appliedCheckBloodEffect then
      self.appliedCheckBloodEffect = self.currentCheckBloodEffect
      if self.appliedCheckBloodEffect == true then
        setBloodEffect(2)
      else
        setBloodEffect(0)
      end
    end
    if self.currentCheckRepresent ~= self.appliedCheckRepresent then
      self.appliedCheckRepresent = self.currentCheckRepresent
      setRepresentative(self.appliedCheckRepresent)
    end
    if self.currentCheckSnowPoolOnlyInSafeZone ~= self.appliedCheckSnowPoolOnlyInSafeZone then
      self.appliedCheckSnowPoolOnlyInSafeZone = self.currentCheckSnowPoolOnlyInSafeZone
      setSnowPoolOnlyInSafeZone(self.appliedCheckSnowPoolOnlyInSafeZone)
    end
    if self.currentCheckSSAO ~= self.appliedCheckSSAO then
      self.appliedCheckSSAO = self.currentCheckSSAO
      setSSAO(self.appliedCheckSSAO)
    end
    if self.currentCheckTessellation ~= self.appliedCheckTessellation then
      self.appliedCheckTessellation = self.currentCheckTessellation
      setTessellation(self.appliedCheckTessellation)
    end
    if self.currentCheckPostFilter ~= self.appliedCheckPostFilter then
      self.appliedCheckPostFilter = self.currentCheckPostFilter
      if self.appliedCheckPostFilter == true then
        setPostFilter(2)
      else
        setPostFilter(1)
      end
    end
    if self.currentCheckCharacterEffect ~= self.appliedCheckCharacterEffect then
      self.appliedCheckCharacterEffect = self.currentCheckCharacterEffect
      setCharacterEffect(self.appliedCheckCharacterEffect)
    end
    if self.currentGammaValue ~= self.appliedGammaValue then
      self.appliedGammaValue = self.currentGammaValue
      setGammaValue(self.appliedGammaValue)
    end
    if self.currentContrastValue ~= self.appliedContrastValue then
      self.appliedContrastValue = self.currentContrastValue
      setContrastValue(self.appliedContrastValue)
    end
    if self.currentFovValue ~= self.appliedFovValue then
      self.appliedFovValue = self.currentFovValue
      setFov(self.appliedFovValue)
    end
    if self.currentMaster ~= self.appliedMaster or self.currentMusic ~= self.appliedMusic or self.currentEnvSound ~= self.appliedEnvSound or self.currentFxSound ~= self.appliedFxSound or self.currentDlgSound ~= self.appliedDlgSound or self.currentHitFxVolume ~= self.appliedHitFxVolume or self.currentHitFxWeight ~= self.appliedHitFxWeight or self.currentPlayerVolume ~= self.appliedPlayerVolume then
      self.appliedMaster = self.currentMaster
      self.appliedMusic = self.currentMusic
      self.appliedFxSound = self.currentFxSound
      self.appliedEnvSound = self.currentEnvSound
      self.appliedDlgSound = self.currentDlgSound
      self.appliedHitFxVolume = self.currentHitFxVolume
      self.appliedHitFxWeight = self.currentHitFxWeight
      self.appliedPlayerVolume = self.currentPlayerVolume
      -- DECOMPILER ERROR at PC447: Confused about usage of register: R3 in 'UnsetPending'

      _volumeParam.master = self.appliedMaster
      -- DECOMPILER ERROR at PC450: Confused about usage of register: R3 in 'UnsetPending'

      _volumeParam.fx = self.appliedFxSound
      -- DECOMPILER ERROR at PC453: Confused about usage of register: R3 in 'UnsetPending'

      _volumeParam.dlg = self.appliedDlgSound
      -- DECOMPILER ERROR at PC456: Confused about usage of register: R3 in 'UnsetPending'

      _volumeParam.env = self.appliedEnvSound
      -- DECOMPILER ERROR at PC459: Confused about usage of register: R3 in 'UnsetPending'

      _volumeParam.music = self.appliedMusic
      -- DECOMPILER ERROR at PC462: Confused about usage of register: R3 in 'UnsetPending'

      _volumeParam.hitFx = self.appliedHitFxVolume
      -- DECOMPILER ERROR at PC465: Confused about usage of register: R3 in 'UnsetPending'

      _volumeParam.otherPlayerVolume = self.appliedPlayerVolume
      -- DECOMPILER ERROR at PC468: Confused about usage of register: R3 in 'UnsetPending'

      _volumeParam.hitFxWeight = self.appliedHitFxWeight
      setVolumeParam(_volumeParam)
    end
    if self.currentCheckMusic ~= self.appliedCheckMusic or self.currentCheckSound ~= self.appliedCheckSound or self.currentCheckEnvSound ~= self.appliedCheckEnvSound then
      self.appliedCheckMusic = self.currentCheckMusic
      self.appliedCheckSound = self.currentCheckSound
      self.appliedCheckEnvSound = self.currentCheckEnvSound
      setEnableSound(self.appliedCheckSound, self.appliedCheckMusic, self.appliedCheckEnvSound, self.appliedCheckWhisperMusic, self.appliedCheckTraySoundOnOff)
    end
    if self.currentCheckShowSkillCmd ~= self.appliedCheckShowSkillCmd then
      self.appliedCheckShowSkillCmd = self.currentCheckShowSkillCmd
    end
    if self.currentCheckAutoAim ~= self.appliedCheckAutoAim then
      self.appliedCheckAutoAim = self.currentCheckAutoAim
      setAimAssist(self.appliedCheckAutoAim)
    end
    if self.currentCheckHideWindowByAttacked ~= self.appliedCheckHideWindowByAttacked then
      self.appliedCheckHideWindowByAttacked = self.currentCheckHideWindowByAttacked
      setHideWindowByAttacked(self.appliedCheckHideWindowByAttacked)
    end
    if self.currentCheckShowGuildLoginMessage ~= self.appliedCheckShowGuildLoginMessage then
      self.appliedCheckShowGuildLoginMessage = self.currentCheckShowGuildLoginMessage
      setShowGuildLoginMessage(self.appliedCheckShowGuildLoginMessage)
    end
    if self.currentCheckEnableSimpleUI ~= self.appliedCheckEnableSimpleUI then
      self.appliedCheckEnableSimpleUI = self.currentCheckEnableSimpleUI
      local selfPlayer = getSelfPlayer()
      if selfPlayer ~= nil then
        if (selfPlayer:get()):getLevel() > 5 then
          (frame_Game._btn_EnableSimpleUI):SetCheck(self.appliedCheckEnableSimpleUI)
          setEnableSimpleUI(self.appliedCheckEnableSimpleUI)
        else
          ;
          (frame_Game._btn_EnableSimpleUI):SetCheck(false)
          setEnableSimpleUI(false)
        end
      else
        ;
        (frame_Game._btn_EnableSimpleUI):SetCheck(false)
        setEnableSimpleUI(false)
      end
    end
    do
      if self.currentCheckEnableOVR ~= self.appliedCheckEnableOVR then
        self.appliedCheckEnableOVR = self.currentCheckEnableOVR
        GameOption_CheckEnableOVR(self.appliedCheckEnableOVR)
      end
      if self.currentCheckMouseMove ~= self.appliedCheckMouseMove then
        self.appliedCheckMouseMove = self.currentCheckMouseMove
        setGameMouseMode(self.appliedCheckMouseMove)
      end
      if self.currentCheckMouseInvertX ~= self.appliedCheckMouseInvertX then
        self.appliedCheckMouseInvertX = self.currentCheckMouseInvertX
        setMouseInvertX(self.appliedCheckMouseInvertX)
      end
      if self.currentCheckMouseInvertY ~= self.appliedCheckMouseInvertY then
        self.appliedCheckMouseInvertY = self.currentCheckMouseInvertY
        setMouseInvertY(self.appliedCheckMouseInvertY)
      end
      if self.currentCheckMouseSensitivityX ~= self.appliedCheckMouseSensitivityX then
        self.appliedCheckMouseSensitivityX = self.currentCheckMouseSensitivityX
        setMouseSensitivityX(self.appliedCheckMouseSensitivityX)
      end
      if self.currentCheckMouseSensitivityY ~= self.appliedCheckMouseSensitivityY then
        self.appliedCheckMouseSensitivityY = self.currentCheckMouseSensitivityY
        setMouseSensitivityY(self.appliedCheckMouseSensitivityY)
      end
      if self.currentHitFxVolume ~= self.appliedHitFxVolume then
        self.appliedHitFxVolume = self.currentHitFxVolume
        GameOption_hitFxVolume_button()
      end
      if self.currentCheckPadEnable ~= self.appliedCheckPadEnable then
        self.appliedCheckPadEnable = self.currentCheckPadEnable
        setGamePadEnable(self.appliedCheckPadEnable)
      end
      if self.currentCheckPadVibration ~= self.appliedCheckPadVibration then
        self.appliedCheckPadVibration = self.currentCheckPadVibration
        setGamePadVibration(self.appliedCheckPadVibration)
      end
      if self.currentCheckPadInvertX ~= self.appliedCheckPadInvertX then
        self.appliedCheckPadInvertX = self.currentCheckPadInvertX
        setGamePadInvertX(self.appliedCheckPadInvertX)
      end
      if self.currentCheckPadInvertY ~= self.appliedCheckPadInvertY then
        self.appliedCheckPadInvertY = self.currentCheckPadInvertY
        setGamePadInvertY(self.appliedCheckPadInvertY)
      end
      if self.currentCheckPadSensitivityX ~= self.appliedCheckPadSensitivityX then
        self.appliedCheckPadSensitivityX = self.currentCheckPadSensitivityX
        setGamePadSensitivityX(self.appliedCheckPadSensitivityX)
      end
      if self.currentCheckPadSensitivityY ~= self.appliedCheckPadSensitivityY then
        self.appliedCheckPadSensitivityY = self.currentCheckPadSensitivityY
        setGamePadSensitivityY(self.appliedCheckPadSensitivityY)
      end
      if self.currentCheckCameraMasterPower ~= self.appliedCheckCameraMasterPower then
        self.appliedCheckCameraMasterPower = self.currentCheckCameraMasterPower
        GameOption_CameraMasterPower_button()
      end
      if self.currentCheckColorByPass ~= self.appliedCheckColorByPass then
        self.appliedCheckColorByPass = self.currentCheckColorByPass
        GameOption_ColorByPass_button()
      end
      if self.currentCheckCameraShakePower ~= self.appliedCheckCameraShakePower then
        self.appliedCheckCameraShakePower = self.currentCheckCameraShakePower
        GameOption_CameraShakePower_button()
      end
      if self.currentCheckMotionBlurPower ~= self.appliedCheckMotionBlurPower then
        self.appliedCheckMotionBlurPower = self.currentCheckMotionBlurPower
        GameOption_MotionBlurPower_button()
      end
      if self.currentSelfPlayerNameTagVisible ~= self.appliedSelfPlayerNameTagVisible then
        self.appliedSelfPlayerNameTagVisible = self.currentSelfPlayerNameTagVisible
        setSelfPlayerNameTagVisible(self.appliedSelfPlayerNameTagVisible)
      end
      if self.currentOtherPlayerNameTagVisible ~= self.appliedOtherPlayerNameTagVisible then
        self.appliedOtherPlayerNameTagVisible = self.currentOtherPlayerNameTagVisible
        setOtherPlayerNameTagVisible(self.appliedOtherPlayerNameTagVisible)
      end
      if self.currentPartyPlayerNameTagVisible ~= self.appliedPartyPlayerNameTagVisible then
        self.appliedPartyPlayerNameTagVisible = self.currentPartyPlayerNameTagVisible
        setPartyPlayerNameTagVisible(self.appliedPartyPlayerNameTagVisible)
      end
      if self.currentPetObjectShow ~= self.appliedPetObjectShow then
        self.appliedPetObjectShow = self.currentPetObjectShow
        setPetRender(self.appliedPetObjectShow)
      end
      if self.currentFontResizeType ~= self.appliedFontResizeType then
        self.appliedFontResizeType = self.currentFontResizeType
        setUIFontSizeType(self.appliedFontResizeType)
        GameOption_FontResizeCheckFontType(self.appliedFontResizeType)
      end
      if self.currentNavPathEffectType ~= self.appliedNavPathEffectType then
        self.appliedNavPathEffectType = self.currentNavPathEffectType
        setShowNavPathEffectType(self.appliedNavPathEffectType)
      end
      if self.currentWorldMapOpenType ~= self.appliedWorldMapOpenType then
        self.appliedWorldMapOpenType = self.currentWorldMapOpenType
        setWorldmapOpenType(self.appliedWorldMapOpenType)
      end
      if self.currentWorldMapCameraType ~= self.appliedWorldMapCameraType then
        self.appliedWorldMapCameraType = self.currentWorldMapCameraType
        setWorldMapCameraPitchType(self.appliedWorldMapCameraType)
      end
      if self.currentServiceResourceType ~= self.appliedServiceResourceType then
        self.appliedServiceResourceType = self.currentServiceResourceType
        ToClient_saveServiceResourceType(self.appliedServiceResourceType)
      end
      if self.currentChatChannelType ~= self.appliedChatChannelType then
        self.appliedChatChannelType = self.currentChatChannelType
        ToClient_saveChatChannelType(self.appliedChatChannelType)
      end
      if self.currentGuildPlayerNameTagVisible ~= self.appliedGuildPlayerNameTagVisible then
        self.appliedGuildPlayerNameTagVisible = self.currentGuildPlayerNameTagVisible
        if (frame_Game._btn_GuildNameShow):IsCheck() then
          self.appliedGuildPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow
        else
          self.appliedGuildPlayerNameTagVisible = (CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow
        end
        setGuildPlayerNameTagVisible(self.appliedGuildPlayerNameTagVisible)
      end
      if self.currentCheckWorkerVisible ~= self.appliedCheckWorkerVisible then
        self.appliedCheckWorkerVisible = self.currentCheckWorkerVisible
        ToClient_setWorkerVisible(self.appliedCheckWorkerVisible)
      end
      if self.currentGuideLineHumanRelation ~= self.appliedGuideLineHumanRelation then
        self.appliedGuideLineHumanRelation = self.currentGuideLineHumanRelation
        setShowHumanRelation(self.appliedGuideLineHumanRelation)
      end
      if self.currentGuideLineQuestLine ~= self.appliedGuideLineQuestLine then
        self.appliedGuideLineQuestLine = self.currentGuideLineQuestLine
        setShowQuestActorColor(self.appliedGuideLineQuestLine)
      end
      if self.currentGuideLineZoneChange ~= self.appliedGuideLineZoneChange then
        self.appliedGuideLineZoneChange = self.currentGuideLineZoneChange
        setRenderPlayerColor(randerPlayerColorStr.zoneChange, self.appliedGuideLineZoneChange)
      end
      if self.currentGuideLineWarAlly ~= self.appliedGuideLineWarAlly then
        self.appliedGuideLineWarAlly = self.currentGuideLineWarAlly
        setRenderPlayerColor(randerPlayerColorStr.warAlly, self.appliedGuideLineWarAlly)
      end
      if self.currentGuideLineGuild ~= self.appliedGuideLineGuild then
        self.appliedGuideLineGuild = self.currentGuideLineGuild
        setRenderPlayerColor(randerPlayerColorStr.guild, self.appliedGuideLineGuild)
      end
      if self.currentGuideLineParty ~= self.appliedGuideLineParty then
        self.appliedGuideLineParty = self.currentGuideLineParty
        setRenderPlayerColor(randerPlayerColorStr.party, self.appliedGuideLineParty)
      end
      if self.currentGuideLineEnemy ~= self.appliedGuideLineEnemy then
        self.appliedGuideLineEnemy = self.currentGuideLineEnemy
        setRenderPlayerColor(randerPlayerColorStr.enemy, self.appliedGuideLineEnemy)
      end
      if self.currentGuideLineNonWarPlayer ~= self.appliedGuideLineNonWarPlayer then
        self.appliedGuideLineNonWarPlayer = self.currentGuideLineNonWarPlayer
        setRenderPlayerColor(randerPlayerColorStr.nonWarPlayer, self.appliedGuideLineNonWarPlayer)
      end
      if self.currentGuideLinePartyMemberEffect ~= self.appliedGuideLinePartyMemberEffect then
        self.appliedGuideLinePartyMemberEffect = self.currentGuideLinePartyMemberEffect
        ;
        (ToClient_getGameOptionControllerWrapper()):setRenderHitEffectParty(self.appliedGuideLinePartyMemberEffect)
      end
      if self.currentCheckRejectInvitation ~= self.appliedCheckRejectInvitation then
        self.appliedCheckRejectInvitation = self.currentCheckRejectInvitation
        setRefuseRequests(self.appliedCheckRejectInvitation)
      end
      if self.currentCheckMiniMapRotation ~= self.appliedCheckMiniMapRotation then
        self.appliedCheckMiniMapRotation = self.currentCheckMiniMapRotation
        setRotateRadarMode(self.appliedCheckMiniMapRotation)
      end
      if self.currentCheckShowAttackEffect ~= self.appliedCheckShowAttackEffect then
        self.appliedCheckShowAttackEffect = self.currentCheckShowAttackEffect
        setRenderHitEffect(self.appliedCheckShowAttackEffect)
      end
      if self.currentCheckBlackSpiritAlert ~= self.appliedCheckBlackSpiritAlert then
        self.appliedCheckBlackSpiritAlert = self.currentCheckBlackSpiritAlert
        setBlackSpiritNotice(self.appliedCheckBlackSpiritAlert)
      end
      if self.currentCheckUseNewQuickSlot ~= self.appliedCheckUseNewQuickSlot then
        self.appliedCheckUseNewQuickSlot = self.currentCheckUseNewQuickSlot
        ;
        (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).NewQuickSlot, self.appliedCheckUseNewQuickSlot)
      end
      if self.currentCheckUseChattingFilter ~= self.appliedCheckUseChattingFilter then
        self.appliedCheckUseChattingFilter = self.currentCheckUseChattingFilter
        setUseChattingFilter(self.appliedCheckUseChattingFilter)
      end
      if self.currentCheckIsOnScreenSaver ~= self.appliedCheckIsOnScreenSaver then
        self.appliedCheckIsOnScreenSaver = self.currentCheckIsOnScreenSaver
        setIsOnScreenSaver(self.appliedCheckIsOnScreenSaver)
      end
      if self.currentCheckIsUIModeMouseLock ~= self.appliedCheckIsUIModeMouseLock then
        self.appliedCheckIsUIModeMouseLock = self.currentCheckIsUIModeMouseLock
        setIsUIModeMouseLock(self.appliedCheckIsUIModeMouseLock)
      end
      if self.currentCheckIsPvpRefuse ~= self.appliedCheckIsPvpRefuse then
        self.appliedCheckIsPvpRefuse = self.currentCheckIsPvpRefuse
        setIsPvpRefuse(self.appliedCheckIsPvpRefuse)
      end
      if self.currentCheckIsExchangeRefuse ~= self.appliedCheckIsExchangeRefuse then
        self.appliedCheckIsExchangeRefuse = self.currentCheckIsExchangeRefuse
        setIsExchangeRefuse(self.appliedCheckIsExchangeRefuse)
      end
      if self.currentCheckIsHideMast ~= self.appliedCheckIsHideMast then
        self.appliedCheckIsHideMast = self.currentCheckIsHideMast
        setHideMastOnCarrier(self.appliedCheckIsHideMast)
      end
      if self.currentCheckShowCashAlert ~= self.appliedCheckShowCashAlert then
        self.appliedCheckShowCashAlert = self.currentCheckShowCashAlert
        setShowCashAlert(self.appliedCheckShowCashAlert)
      end
      if self.currentCheckShowComboGuide ~= self.appliedCheckShowComboGuide then
        self.appliedCheckShowComboGuide = self.currentCheckShowComboGuide
        setShowComboGuide(self.appliedCheckShowComboGuide)
        if nil ~= Panel_MovieTheater_320 then
          Panel_MovieTheater320_JustClose()
          _currentSpiritGuideCheck = check
        end
      end
      if self.currentCheckMusic ~= self.appliedCheckMusic then
        self.appliedCheckMusic = self.currentCheckMusic
        setEnableSound(self.currentCheckSound, self.appliedCheckMusic, self.currentCheckEnvSound, self.currentCheckWhisperMusic, self.currentCheckTraySoundOnOff)
      end
      if self.currentCheckSound ~= self.appliedCheckSound then
        self.appliedCheckSound = self.currentCheckSound
        setEnableSound(self.appliedCheckSound, self.currentCheckMusic, self.currentCheckEnvSound, self.currentCheckWhisperMusic, self.currentCheckTraySoundOnOff)
      end
      if self.currentCheckEnvSound ~= self.appliedCheckEnvSound then
        self.appliedCheckEnvSound = self.currentCheckEnvSound
        setEnableSound(self.currentCheckSound, self.currentCheckMusic, self.appliedCheckEnvSound, self.currentCheckWhisperMusic, self.currentCheckTraySoundOnOff)
      end
      if self.currentCheckRiddingMusic ~= self.appliedCheckRiddingMusic then
        self.appliedCheckRiddingMusic = self.currentCheckRiddingMusic
        setEnableRidingSound(self.appliedCheckRiddingMusic)
      end
      if self.currentCheckWhisperMusic ~= self.appliedCheckWhisperMusic then
        self.appliedCheckWhisperMusic = self.currentCheckWhisperMusic
        setEnableSound(self.currentCheckSound, self.currentCheckMusic, self.appliedCheckEnvSound, self.currentCheckWhisperMusic, self.currentCheckTraySoundOnOff)
      end
      if self.currentCheckTraySoundOnOff ~= self.appliedCheckTraySoundOnOff then
        self.appliedCheckTraySoundOnOff = self.currentCheckTraySoundOnOff
        setEnableSound(self.currentCheckSound, self.currentCheckMusic, self.appliedCheckEnvSound, self.currentCheckWhisperMusic, self.currentCheckTraySoundOnOff)
      end
      if self.currentCheckCombatMusic ~= self.appliedCheckCombatMusic then
        self.appliedCheckCombatMusic = self.currentCheckCombatMusic
        setEnableBattleSoundType(self.appliedCheckCombatMusic)
      end
      if self.currentCheckNpcVoice ~= self.appliedCheckNpcVoice then
        self.appliedCheckNpcVoice = self.currentCheckNpcVoice
        setAudioResourceType(self.appliedCheckNpcVoice)
      end
      if self.currentCheckUIScale ~= self.appliedCheckUIScale then
        self.appliedCheckUIScale = self.currentCheckUIScale
        GameOption_UIScale_Change()
        setUIScale(self.currentCheckUIScale)
      end
      local uiScale = self.currentCheckUIScale
      uiScale = uiScale + 0.002
      local uiScale_Percent = (math.floor)((uiScale) * 100)
      uiScale = uiScale_Percent / 100
      local screenHeight = (ToClient_getGameOptionControllerWrapper()):getScreenResolutionHeight()
      if CppDefine.ChangeUIAndResolution == true then
        uiScale = GameOption_InitScale_50_200(uiScale)
      else
        uiScale = GameOption_InitScale(uiScale, screenHeight)
      end
      GameOption_SetUIMode(uiScale)
      setUIScale(uiScale)
      ;
      (gamePanel_Main._btn_Apply):SetEnable(false)
      if true == isChangedDisplay then
        local messageboxData = {title = "changeDisplay", content = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_DISPLAYCOMMIT_COMMENT"), functionApply = GameOption_ChangeDisplayApply, functionCancel = GameOption_ChangeDisplayCancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW, isTimeCount = true, countTime = 10, timeString = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_DISPLAYCOMMIT_TIMELEFT"), isStartTimer = true, afterFunction = GameOption_ChangeDisplayTimeOut}
        allClearMessageData()
        ;
        (MessageBox.showMessageBox)(messageboxData)
      else
        do
          saveGameOption(false)
          keyCustom_applyChange()
          keyCustom_StartEdit()
          if (frame_Game._btn_SpiritGuide):IsCheck() ~= _currentSpiritGuideCheck then
            _currentSpiritGuideCheck = (frame_Game._btn_SpiritGuide):IsCheck()
          end
          if isLuaLoadingComplete then
            FGlobal_SetMamageShow()
            FGlobal_NewMainQuest_Alarm_Check()
            QuickSlot_UpdateData()
            FGlobal_NewQuickSlot_Update()
          end
        end
      end
    end
  end
end

FGlobal_SpiritGuide_IsShow = function()
  -- function num : 0_294
  return _currentSpiritGuideCheck
end

GameOption_ChangeDisplayApply = function()
  -- function num : 0_295 , upvalues : chk_Option
  if isNeedGameOptionFromServer() == true then
    FGlobal_QuestWindowRateSetting()
  end
  saveGameOption(true)
  local self = chk_Option
  self.savedScreenModeIdx = self.appliedScreenModeIdx
  self.savedScreenShotFormat = self.appliedScreenShotFormat
  self.savedScreenShotSize = self.appliedScreenShotSize
  self.savedWatermarkPosition = self.appliedWatermarkPosition
  self.savedWatermarkScale = self.appliedWatermarkScale
  self.savedWatermarkService = self.appliedWatermarkService
  self.savedWatermarkAlpha = self.appliedWatermarkAlpha
  self.savedColorBlind = self.appliedColorBlind
  self.savedSelfPlayerOnlyEffect = self.appliedSelfPlayerOnlyEffect
  self.savedNearestPlayerOnlyEffect = self.appliedNearestPlayerOnlyEffect
  self.savedSelfPlayerOnlyLantern = self.appliedSelfPlayerOnlyLantern
  self.savedLowPower = self.appliedLowPower
  self.savedUpscaleEnable = self.appliedUpscaleEnable
  self.savedCropModeEnable = self.appliedCropModeEnable
  self.savedCropModeScaleX = self.appliedCropModeScaleX
  self.savedCropModeScaleY = self.appliedCropModeScaleY
  self.savedAutoOptimization = self.appliedAutoOptimization
  self.savedOptimizationFrame = self.appliedOptimizationFrame
  self.savedLUT = self.currentLUT
  self.savedScreenResolutionIdx = self.appliedScreenResolutionIdx
  self.savedTextureQualityIdx = self.appliedTextureQualityIdx
  self.savedGraphicOptionIdx = self.appliedGraphicOptionIdx
  self.savedCheckDof = self.appliedCheckDof
  self.savedCheckAA = self.appliedCheckAA
  self.savedCheckUltra = self.appliedCheckUltra
  self.savedCheckLensBlood = self.appliedCheckLensBlood
  self.savedCheckSnowPoolOnlyInSafeZone = self.appliedCheckSnowPoolOnlyInSafeZone
  self.savedCheckSSAO = self.appliedCheckSSAO
  self.savedCheckTessellation = self.appliedCheckTessellation
  self.savedCheckPostFilter = self.appliedCheckPostFilter
  self.savedCheckCharacterEffect = self.appliedCheckCharacterEffect
  self.savedGammaValue = self.currentGammaValue
  self.savedContrastValue = self.currentContrastValue
  self.savedMaster = self.currentMaster
  self.savedMusic = self.currentMusic
  self.savedFxSound = self.currentFxSound
  self.savedEnvSound = self.currentEnvSound
  self.savedDlgSound = self.currentDlgSound
  self.savedHitFxVolume = self.currentHitFxVolume
  self.savedHitFxWeight = self.currentHitFxWeight
  self.savedPlayerVolume = self.currentPlayerVolume
  self.savedCheckCombatMusic = self.currentCheckCombatMusic
  self.savedCheckNpcVoice = self.currentCheckNpcVoice
  self.savedCheckMusic = self.appliedCheckMusic
  self.savedCheckSound = self.appliedCheckSound
  self.savedCheckEnvSound = self.appliedCheckEnvSound
  self.savedCheckCombatMusic = self.appliedCheckCombatMusic
  self.savedCheckRiddingMusic = self.appliedCheckRiddingMusic
  self.savedCheckWhisperMusic = self.appliedCheckWhisperMusic
  self.savedCheckTraySoundOnOff = self.appliedCheckTraySoundOnOff
  self.savedCheckShowSkillCmd = self.appliedCheckShowSkillCmd
  self.savedCheckAutoAim = self.appliedCheckAutoAim
  self.savedCheckHideWindowByAttacked = self.appliedCheckHideWindowByAttacked
  self.savedCheckShowGuildLoginMessage = self.appliedCheckShowGuildLoginMessage
  self.savedCheckEnableSimpleUI = self.appliedCheckEnableSimpleUI
  self.savedCheckRenderCharacterColor = self.appliedCheckRenderCharacterColor
  self.savedCheckMouseMove = self.appliedCheckMouseMove
  self.savedCheckMouseInvertX = self.appliedCheckMouseInvertX
  self.savedCheckMouseInvertY = self.appliedCheckMouseInvertY
  self.savedCheckMouseSensitivityX = self.appliedCheckMouseSensitivityX
  self.savedCheckMouseSensitivityY = self.appliedCheckMouseSensitivityY
  self.savedCheckPadEnable = self.appliedCheckPadEnable
  self.savedCheckPadVibration = self.appliedCheckPadVibration
  self.savedCheckPadInvertX = self.appliedCheckPadInvertX
  self.savedCheckPadInvertY = self.appliedCheckPadInvertY
  self.savedCheckPadSensitivityX = self.appliedCheckPadSensitivityX
  self.savedCheckPadSensitivityY = self.appliedCheckPadSensitivityY
  self.savedCheckCameraMasterPower = self.appliedCheckCameraMasterPower
  self.savedCheckColorByPass = self.appliedCheckColorByPass
  self.savedCheckCameraShakePower = self.appliedCheckCameraShakePower
  self.savedCheckMotionBlurPower = self.appliedCheckMotionBlurPower
  self.savedCheckCameraPosPower = self.appliedCheckCameraPosPower
  self.savedCheckCameraFovPower = self.appliedCheckCameraFovPower
  self.savedCheckSelfNameShow = self.appliedCheckSelfNameShow
  self.savedCheckUIScale = self.appliedCheckUIScale
  self.savedPetObjectShow = self.appliedPetObjectShow
  self.savedFontResizeType = self.appliedFontResizeType
  self.savedNavPathEffectType = self.appliedNavPathEffectType
  self.savedWorldMapOpenType = self.appliedWorldMapOpenType
  self.savedWorldMapCameraType = self.appliedWorldMapCameraType
  self.savedServiceResourceType = self.appliedServiceResourceType
  self.savedChatChannelType = self.appliedChatChannelType
  self.savedFovValue = self.appliedFovValue
  reloadGameUI()
end

GameOption_ChangeDisplayCancel = function()
  -- function num : 0_296 , upvalues : chk_Option, currentResolutionX, currentResolutionY, screenResolutionIndex, scaleRangeTable
  local self = chk_Option
  if self.appliedScreenModeIdx ~= self.savedScreenModeIdx then
    self.appliedScreenModeIdx = self.savedScreenModeIdx
    GameOption_SetCurrentScreenMode(self.savedScreenModeIdx)
    setScreenMode(self.savedScreenModeIdx)
  end
  if self.appliedScreenResolutionIdx ~= self.savedScreenResolutionIdx then
    local index = self.savedScreenResolutionIdx
    local screenDataSize = #self.screenResolutionList
    if screenDataSize < index then
      index = screenDataSize
    end
    index = GameOption_FindScreenResolutionIdx(currentResolutionX, currentResolutionY)
    if index == 0 then
      index = screenResolutionIndex
    end
    self.appliedScreenResolutionIdx = index
    GameOption_SetCurrentScreenResolution(index)
    setScreenResolution(((self.screenResolutionList)[index]).width, ((self.screenResolutionList)[index]).height)
  end
  do
    if self.appliedCheckUIScale ~= self.savedCheckUIScale then
      self.savedCheckUIScale = (math.min)((math.max)(scaleRangeTable.minScaleValue * 0.01, self.savedCheckUIScale), scaleRangeTable.maxScaleValue * 0.01)
      self.savedCheckUIScale = (math.ceil)(self.savedCheckUIScale * 100) / 100
      setUIScale(self.savedCheckUIScale)
      self.appliedCheckUIScale = self.savedCheckUIScale
      GameOption_SetUIMode(self.appliedCheckUIScale)
    end
  end
end

GameOption_ChangeDisplayTimeOut = function()
  -- function num : 0_297
  if (MessageBox.isPopUp)() == true then
    messageBox_CancelButtonUp()
  end
end

GameExitOpen = function()
  -- function num : 0_298
  GameExitShowToggle()
  GameOption_Cancel()
end

GameUIRepos = function()
  -- function num : 0_299
  Panel_UIControl_SetShow(true)
  GameOption_Cancel()
end

GameOption_ReSetKeyConfig = function(target)
  -- function num : 0_300
  if target == 0 then
    keyCustom_SetDefaultAction()
    KeyCustom_Action_UpdateButtonText_Key()
    KeyCustom_Action_UpdateButtonText_Pad()
    GameOption_Apply()
  else
    if target == 1 then
      keyCustom_SetDefaultUI()
      KeyCustom_Ui_UpdateButtonText_Key()
      KeyCustom_Ui_UpdateButtonText_Pad()
      GameOption_Apply()
    else
      return 
    end
  end
end

GameOption_ResetAllOption = function()
  -- function num : 0_301
  GameOption_ResetDisplayOption()
  GameOption_ResetSoundOption()
  GameOption_ResetGameOption()
  keyCustom_SetDefaultAction()
  KeyCustom_Action_UpdateButtonText_Key()
  KeyCustom_Action_UpdateButtonText_Pad()
  keyCustom_SetDefaultUI()
  KeyCustom_Ui_UpdateButtonText_Key()
  KeyCustom_Ui_UpdateButtonText_Pad()
  GameOption_Apply()
end

GameOption_DefaultOption = function(gameOptionSetting, optionType)
  -- function num : 0_302 , upvalues : chk_Option, randerPlayerColorStr, frame_Game
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  if optionType == 1 then
    chk_Option.RESOLUTION_WIDTH = gameOptionSetting:getScreenResolutionWidth()
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.RESOLUTION_HEIGHT = gameOptionSetting:getScreenResolutionHeight()
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentScreenModeIdx = gameOptionSetting:getScreenMode()
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentScreenShotFormat = gameOptionSetting:getScreenShotFormat()
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentScreenShotSize = gameOptionSetting:getScreenShotQuality()
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentWatermarkPosition = gameOptionSetting:getWatermarkPosition()
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentWatermarkService = gameOptionSetting:getWatermarkService()
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentWatermarkScale = gameOptionSetting:getWatermarkScale()
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentWatermarkAlpha = gameOptionSetting:getWatermarkAlpha()
    -- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentColorBlind = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).ColorBlindMode)
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentSelfPlayerOnlyEffect = gameOptionSetting:getSelfPlayerOnlyEffect()
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentNearestPlayerOnlyEffect = gameOptionSetting:getNearestPlayerOnlyEffect()
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentSelfPlayerOnlyLantern = gameOptionSetting:getSelfPlayerOnlyLantern()
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentLowPower = gameOptionSetting:getPresentLock()
    -- DECOMPILER ERROR at PC66: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentUpscaleEnable = gameOptionSetting:getUpscaleEnable()
    -- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCropModeEnable = gameOptionSetting:getCropModeEnable()
    -- DECOMPILER ERROR at PC74: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCropModeScaleX = gameOptionSetting:getCropModeScaleX()
    -- DECOMPILER ERROR at PC78: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCropModeScaleY = gameOptionSetting:getCropModeScaleY()
    -- DECOMPILER ERROR at PC82: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentAutoOptimization = gameOptionSetting:getAutoOptimization()
    -- DECOMPILER ERROR at PC86: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentOptimizationFrame = gameOptionSetting:getAutoOptimizationFrameLimit()
    -- DECOMPILER ERROR at PC90: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentLUT = gameOptionSetting:getCameraLUTFilter()
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentScreenResolutionIdx = GameOption_FindScreenResolutionIdx(chk_Option.RESOLUTION_WIDTH, chk_Option.RESOLUTION_HEIGHT)
    -- DECOMPILER ERROR at PC102: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentTextureQualityIdx = gameOptionSetting:getTextureQuality()
    -- DECOMPILER ERROR at PC106: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGraphicOptionIdx = gameOptionSetting:getGraphicOption()
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGammaValue = gameOptionSetting:getGammaValue()
    -- DECOMPILER ERROR at PC114: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentContrastValue = gameOptionSetting:getContrastValue()
    -- DECOMPILER ERROR at PC118: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckDof = gameOptionSetting:getDof()
    -- DECOMPILER ERROR at PC122: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckAA = gameOptionSetting:getAntiAliasing()
    -- DECOMPILER ERROR at PC126: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckUltra = gameOptionSetting:getGraphicUltra()
    -- DECOMPILER ERROR at PC130: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckLensBlood = gameOptionSetting:getLensBlood()
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckBloodEffect = gameOptionSetting:getBloodEffect() ~= 0
    -- DECOMPILER ERROR at PC142: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckRepresent = gameOptionSetting:getRepresentative()
    -- DECOMPILER ERROR at PC146: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckSnowPoolOnlyInSafeZone = gameOptionSetting:getSnowPoolOnlyInSafeZone()
    -- DECOMPILER ERROR at PC150: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckSSAO = gameOptionSetting:getSSAO()
    -- DECOMPILER ERROR at PC154: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckTessellation = gameOptionSetting:getTessellation()
    -- DECOMPILER ERROR at PC162: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckPostFilter = gameOptionSetting:getPostFilter() ~= 0
    -- DECOMPILER ERROR at PC166: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckCharacterEffect = gameOptionSetting:getCharacterEffect()
    -- DECOMPILER ERROR at PC168: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckUIScale = 1
    -- DECOMPILER ERROR at PC172: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentFovValue = gameOptionSetting:getFov()
    -- DECOMPILER ERROR at PC176: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckEffectAlpha = gameOptionSetting:getEffectAlpha()
    -- DECOMPILER ERROR at PC180: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckCameraMasterPower = gameOptionSetting:getCameraMasterPower()
    -- DECOMPILER ERROR at PC184: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckColorByPass = gameOptionSetting:getSkillPostEffect()
    -- DECOMPILER ERROR at PC188: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckCameraShakePower = gameOptionSetting:getCameraShakePower()
    -- DECOMPILER ERROR at PC192: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckMotionBlurPower = gameOptionSetting:getMotionBlurPower()
    -- DECOMPILER ERROR at PC196: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckCameraPosPower = gameOptionSetting:getCameraTranslatePower()
    -- DECOMPILER ERROR at PC200: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckCameraFovPower = gameOptionSetting:getCameraFovPower()
  end
  -- DECOMPILER ERROR at PC206: Confused about usage of register: R2 in 'UnsetPending'

  if optionType == 2 then
    chk_Option.currentMaster = gameOptionSetting:getMasterVolume()
    -- DECOMPILER ERROR at PC210: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentMusic = gameOptionSetting:getMusicVolume()
    -- DECOMPILER ERROR at PC214: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentFxSound = gameOptionSetting:getFxVolume()
    -- DECOMPILER ERROR at PC218: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentEnvSound = gameOptionSetting:getEnvSoundVolume()
    -- DECOMPILER ERROR at PC222: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckCombatMusic = gameOptionSetting:getEnableBattleSoundType()
    -- DECOMPILER ERROR at PC226: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckNpcVoice = gameOptionSetting:getAudioResourceType()
    -- DECOMPILER ERROR at PC230: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentDlgSound = gameOptionSetting:getDialogueVolume()
    -- DECOMPILER ERROR at PC234: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentHitFxVolume = gameOptionSetting:getHitFxVolume()
    -- DECOMPILER ERROR at PC238: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentHitFxWeight = gameOptionSetting:getHitFxWeight()
    -- DECOMPILER ERROR at PC242: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentPlayerVolume = gameOptionSetting:getOtherPlayerVolume()
    -- DECOMPILER ERROR at PC246: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckMusic = gameOptionSetting:getEnableMusic()
    -- DECOMPILER ERROR at PC250: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckSound = gameOptionSetting:getEnableSound()
    -- DECOMPILER ERROR at PC254: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckEnvSound = gameOptionSetting:getEnableEnvSound()
    -- DECOMPILER ERROR at PC258: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckRiddingMusic = gameOptionSetting:getEnableRidingSound()
    -- DECOMPILER ERROR at PC262: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckWhisperMusic = gameOptionSetting:getEnableWhisperSound()
    -- DECOMPILER ERROR at PC266: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckTraySoundOnOff = gameOptionSetting:getEnableTraySound()
  end
  -- DECOMPILER ERROR at PC272: Confused about usage of register: R2 in 'UnsetPending'

  if optionType == 3 then
    chk_Option.currentCheckShowSkillCmd = gameOptionSetting:getShowSkillCmd()
    -- DECOMPILER ERROR at PC276: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckShowComboGuide = gameOptionSetting:getShowComboGuide()
    -- DECOMPILER ERROR at PC280: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckAutoAim = gameOptionSetting:getAimAssist()
    -- DECOMPILER ERROR at PC284: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckHideWindowByAttacked = gameOptionSetting:getHideWindowByAttacked()
    -- DECOMPILER ERROR at PC288: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckShowGuildLoginMessage = gameOptionSetting:getShowGuildLoginMessage()
    -- DECOMPILER ERROR at PC292: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckEnableSimpleUI = gameOptionSetting:getEnableSimpleUI()
    -- DECOMPILER ERROR at PC296: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckMouseMove = gameOptionSetting:getGameMouseMode()
    -- DECOMPILER ERROR at PC300: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckEnableOVR = gameOptionSetting:getEnableOVR()
    -- DECOMPILER ERROR at PC304: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckMouseInvertX = gameOptionSetting:getMouseInvertX()
    -- DECOMPILER ERROR at PC308: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckMouseInvertY = gameOptionSetting:getMouseInvertY()
    -- DECOMPILER ERROR at PC312: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckMouseSensitivityX = gameOptionSetting:getMouseSensitivityX()
    -- DECOMPILER ERROR at PC316: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckMouseSensitivityY = gameOptionSetting:getMouseSensitivityY()
    -- DECOMPILER ERROR at PC320: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckPadEnable = gameOptionSetting:getGamePadEnable()
    -- DECOMPILER ERROR at PC324: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckPadVibration = gameOptionSetting:getGamePadVibration()
    -- DECOMPILER ERROR at PC328: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckPadInvertX = gameOptionSetting:getGamePadInvertX()
    -- DECOMPILER ERROR at PC332: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckPadInvertY = gameOptionSetting:getGamePadInvertY()
    -- DECOMPILER ERROR at PC336: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckPadSensitivityX = gameOptionSetting:getGamePadSensitivityX()
    -- DECOMPILER ERROR at PC340: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckPadSensitivityY = gameOptionSetting:getGamePadSensitivityY()
    -- DECOMPILER ERROR at PC344: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckIsHideMast = gameOptionSetting:getHideMastOnCarrier()
    -- DECOMPILER ERROR at PC348: Confused about usage of register: R2 in 'UnsetPending'

    chk_option.currentCheckShowCashAlert = gameOptionSetting:getCashAlert()
    -- DECOMPILER ERROR at PC352: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentSelfPlayerNameTagVisible = gameOptionSetting:getSelfPlayerNameTagVisible()
    -- DECOMPILER ERROR at PC356: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentOtherPlayerNameTagVisible = gameOptionSetting:getOtherPlayerNameTagVisible()
    -- DECOMPILER ERROR at PC360: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentPartyPlayerNameTagVisible = gameOptionSetting:getPartyPlayerNameTagVisible()
    -- DECOMPILER ERROR at PC364: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuildPlayerNameTagVisible = gameOptionSetting:getGuildPlayerNameTagVisible()
    -- DECOMPILER ERROR at PC368: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentPetObjectShow = gameOptionSetting:getPetRender()
    -- DECOMPILER ERROR at PC372: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentFontResizeType = gameOptionSetting:getUIFontSizeType()
    -- DECOMPILER ERROR at PC376: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentNavPathEffectType = gameOptionSetting:getShowNavPathEffectType()
    -- DECOMPILER ERROR at PC380: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentWorldMapOpenType = gameOptionSetting:getWorldmapOpenType()
    -- DECOMPILER ERROR at PC384: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentWorldMapCameraType = gameOptionSetting:getWorldMapCameraPitchType()
    -- DECOMPILER ERROR at PC388: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentServiceResourceType = gameOptionSetting:getServiceResType()
    -- DECOMPILER ERROR at PC392: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentChatChannelType = gameOptionSetting:getChatLanguageType()
    -- DECOMPILER ERROR at PC396: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckIsUIModeMouseLock = gameOptionSetting:getUIModeMouseLock()
    -- DECOMPILER ERROR at PC400: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckRejectInvitation = gameOptionSetting:getRefuseRequests()
    -- DECOMPILER ERROR at PC404: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckMiniMapRotation = gameOptionSetting:getRadarRotateMode()
    -- DECOMPILER ERROR at PC408: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckShowAttackEffect = gameOptionSetting:getRenderHitEffect()
    -- DECOMPILER ERROR at PC412: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckBlackSpiritAlert = gameOptionSetting:getBlackSpiritNotice()
    -- DECOMPILER ERROR at PC416: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckIsPvpRefuse = gameOptionSetting:getPvpRefuse()
    -- DECOMPILER ERROR at PC420: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckIsExchangeRefuse = gameOptionSetting:getIsExchangeRefuse()
    -- DECOMPILER ERROR at PC424: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckIsOnScreenSaver = gameOptionSetting:getIsOnScreenSaver()
    -- DECOMPILER ERROR at PC426: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentCheckUseNewQuickSlot = false
    ;
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).NewQuickSlot, chk_Option.currentCheckUseNewQuickSlot)
    -- DECOMPILER ERROR at PC441: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuideLineZoneChange = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.zoneChange)
    -- DECOMPILER ERROR at PC447: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuideLineWarAlly = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.warAlly)
    -- DECOMPILER ERROR at PC453: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuideLineGuild = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.guild)
    -- DECOMPILER ERROR at PC457: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuideLineQuestLine = gameOptionSetting:getShowQuestActorColor()
    -- DECOMPILER ERROR at PC463: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuideLineNonWarPlayer = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.nonWarPlayer)
    -- DECOMPILER ERROR at PC469: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuideLineParty = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.party)
    -- DECOMPILER ERROR at PC473: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuideLineHumanRelation = gameOptionSetting:getShowHumanRelation()
    -- DECOMPILER ERROR at PC479: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuideLineEnemy = gameOptionSetting:getRenderPlayerColor(randerPlayerColorStr.enemy)
    -- DECOMPILER ERROR at PC483: Confused about usage of register: R2 in 'UnsetPending'

    chk_Option.currentGuideLinePartyMemberEffect = gameOptionSetting:getRenderHitEffectParty()
    ;
    (frame_Game._btn_Alert_Region):SetCheck(ToClient_SetMessageFilter(0, false))
    ;
    (frame_Game._btn_Alert_TerritoryTrade):SetCheck(ToClient_SetMessageFilter(1, false))
    ;
    (frame_Game._btn_Alert_RoyalTrade):SetCheck(ToClient_SetMessageFilter(2, false))
    ;
    (frame_Game._btn_Alert_Fitness):SetCheck(ToClient_SetMessageFilter(3, false))
    ;
    (frame_Game._btn_Alert_TerritoryWar):SetCheck(ToClient_SetMessageFilter(4, false))
    ;
    (frame_Game._btn_Alert_GuildWar):SetCheck(ToClient_SetMessageFilter(5, false))
    ;
    (frame_Game._btn_Alert_PlayerGotItem):SetCheck(ToClient_SetMessageFilter(6, false))
    ;
    (frame_Game._btn_Alert_ItemMarket):SetCheck(ToClient_SetMessageFilter(7, false))
    ;
    (frame_Game._btn_Alert_LifeLevUp):SetCheck(ToClient_SetMessageFilter(8, false))
    ;
    (frame_Game._btn_Alert_GuildQuest):SetCheck(ToClient_SetMessageFilter(9, false))
    ;
    (frame_Game._btn_Alert_NearMonster):SetCheck(ToClient_SetMessageFilter(10, false))
    ;
    (frame_Game._btn_Alert_ServantMarket):SetCheck(ToClient_SetMessageFilter(11, false))
  end
  -- DECOMPILER ERROR: 5 unprocessed JMP targets
end

GameOption_ResetDisplayOption = function()
  -- function num : 0_303 , upvalues : chk_Option, scaleRangeTable, frame_Display, GetStr_Option, gamePanel_Main
  resetDisplayOption()
  GameOption_SetScreenModeButtons(chk_Option.currentScreenModeIdx)
  if chk_Option.currentScreenResolutionIdx == 0 then
    GameOption_SetScreenResolutionText_exception(chk_Option.RESOLUTION_WIDTH, chk_Option.RESOLUTION_HEIGHT)
  else
    GameOption_SetScreenResolutionText(chk_Option.currentScreenResolutionIdx)
  end
  GameOption_SetCurrentLUT(chk_Option.currentLUT)
  local uiScale_Percent = 100
  local pos = (uiScale_Percent - scaleRangeTable.minScaleValue) / (scaleRangeTable.maxScaleValue - scaleRangeTable.minScaleValue) * 100
  ;
  (frame_Display._slide_UIScale):SetControlPos(pos)
  ;
  (frame_Display._txt_UIScale):SetText(GetStr_Option[5] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", uiScale_Percent) .. "% <PAOldColor>)")
  GameOption_SetEffectAlpha()
  GameOption_SetCameraMasterPower()
  GameOption_SetColorByPass()
  GameOption_SetCameraShakePower()
  GameOption_SetMotionBlurPower()
  GameOption_SetCameraPosPower()
  GameOption_SetCameraFovPower()
  GameOption_SetTextureQualityText(chk_Option.currentTextureQualityIdx)
  GameOption_SetGraphicOptionText(chk_Option.currentGraphicOptionIdx)
  GameOption_SetGraphicCustomOption()
  ;
  (frame_Display._slide_Gamma):SetControlPos(chk_Option.currentGammaValue * 100)
  GameOption_SetGammaValueText(chk_Option.currentGammaValue)
  ;
  (frame_Display._slide_Contrast):SetControlPos(chk_Option.currentContrastValue * 100)
  GameOption_SetContrastValueText(chk_Option.currentContrastValue)
  GameOption_CheckScreenShotFormat(chk_Option.currentScreenShotFormat)
  GameOption_CheckScreenShotSize(chk_Option.currentScreenShotSize)
  GameOption_CheckWatermarkService(chk_Option.currentWatermarkService)
  GameOption_CheckWatermarkPosition(chk_Option.currentWatermarkPosition)
  GameOption_CheckWatermarkScale(chk_Option.currentWatermarkScale)
  ;
  (frame_Display._slide_WatermarkAlpha):SetControlPos(chk_Option.currentWatermarkAlpha * 100)
  GameOption_CheckColorBlind(chk_Option.currentColorBlind)
  ;
  (frame_Display._btn_SelfPlayerOnlyEffect):SetCheck(chk_Option.currentSelfPlayerOnlyEffect)
  GameOption_CheckSelfPlayerOnlyEffect()
  ;
  (frame_Display._btn_NearestPlayerOnlyEffect):SetCheck(chk_Option.currentNearestPlayerOnlyEffect)
  GameOption_CheckNearestPlayerOnlyEffect()
  ;
  (frame_Display._btn_SelfPlayerOnlyLantern):SetCheck(chk_Option.currentSelfPlayerOnlyLantern)
  GameOption_CheckSelfPlayerOnlyLantern()
  ;
  (frame_Display._btn_LowPower):SetCheck(chk_Option.currentLowPower)
  GameOption_CheckLowPower()
  ;
  (frame_Display._btn_UpscaleEnable):SetCheck(chk_Option.currentUpscaleEnable)
  GameOption_CheckUpscale()
  ;
  (frame_Display._btn_CropModeEnable):SetCheck(chk_Option.currentCropModeEnable)
  ;
  (frame_Display._slide_CropModeScaleX):SetControlPos(chk_Option.currentCropModeScaleX * 200 - 100)
  ;
  (frame_Display._slide_CropModeScaleY):SetControlPos(chk_Option.currentCropModeScaleY * 200 - 100)
  GameOption_CheckCropMode()
  ;
  (frame_Display._btn_AutoOptimization):SetCheck(chk_Option.currentAutoOptimization)
  ;
  (frame_Display._slide_AutoOptimization):SetControlPos(chk_Option.currentOptimizationFrame / 60 * 100)
  GameOption_CheckAutoOptimization()
  GameOption_AutoOptimization_slider()
  local sliderValue = (chk_Option.currentFovValue - 40) / 30 * 100
  ;
  (frame_Display._slide_Fov):SetControlPos(sliderValue)
  GameOption_SetFov(chk_Option.currentFovValue)
  GameOption_SetFovValueText(chk_Option.currentFovValue)
  ;
  (gamePanel_Main._btn_Apply):SetEnable(true)
  GameOption_UpdateOptionChanged()
end

GameOption_ResetSoundOption = function()
  -- function num : 0_304 , upvalues : frame_Sound, chk_Option, gamePanel_Main
  resetSoundOption()
  ;
  (frame_Sound._btn_MusicOnOff):SetCheck(chk_Option.currentCheckMusic)
  ;
  (frame_Sound._btn_FXOnOff):SetCheck(chk_Option.currentCheckSound)
  ;
  (frame_Sound._btn_EnvFXOnOff):SetCheck(chk_Option.currentCheckEnvSound)
  ;
  (frame_Sound._btn_RiddingOnOff):SetCheck(chk_Option.currentCheckRiddingMusic)
  ;
  (frame_Sound._btn_WhisperOnOff):SetCheck(chk_Option.currentCheckWhisperMusic)
  ;
  (frame_Sound._btn_TraySoundOnOff):SetCheck(chk_Option.currentCheckTraySoundOnOff)
  do
    local updateCombatSoundTarget = {[(CppEnums.BattleSoundType).Sound_NotUse] = frame_Sound._btn_CombatAllwaysOff, [(CppEnums.BattleSoundType).Sound_Always] = frame_Sound._btn_CombatAllwaysOn, [(CppEnums.BattleSoundType).Sound_Nomal] = frame_Sound._btn_CombatAllwaysLowOff}
    for key,value in pairs(updateCombatSoundTarget) do
      value:SetCheck(key == chk_Option.currentCheckCombatMusic)
    end
    ;
    (frame_Sound._btn_NpcVoice1):SetCheck(true)
    ;
    (frame_Sound._btn_NpcVoice2):SetCheck(false)
    ;
    (frame_Sound._btn_NpcVoice3):SetCheck(false)
    -- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

    self.currentMaster = 0
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R1 in 'UnsetPending'

    self.currentMusic = 0
    -- DECOMPILER ERROR at PC91: Confused about usage of register: R1 in 'UnsetPending'

    self.currentFxSound = 0
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R1 in 'UnsetPending'

    self.currentEnvSound = 0
    -- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

    self.currentDlgSound = 0
    -- DECOMPILER ERROR at PC97: Confused about usage of register: R1 in 'UnsetPending'

    self.currentHitFxWeight = 0
    -- DECOMPILER ERROR at PC99: Confused about usage of register: R1 in 'UnsetPending'

    self.currentPlayerVolume = 0
    ;
    (frame_Sound._slide_TotalVol):SetControlPos(chk_Option.currentMaster)
    ;
    (frame_Sound._slide_MusicVol):SetControlPos(chk_Option.currentMusic)
    ;
    (frame_Sound._slide_FxVol):SetControlPos(chk_Option.currentFxSound)
    ;
    (frame_Sound._slide_EnvFxVol):SetControlPos(chk_Option.currentEnvSound)
    ;
    (frame_Sound._slide_VoiceVol):SetControlPos(chk_Option.currentDlgSound)
    ;
    (frame_Sound._slide_hitFxVolume):SetControlPos(chk_Option.currentHitFxVolume)
    ;
    (frame_Sound._slide_hitFxWeightVolume):SetControlPos(chk_Option.currentHitFxWeight)
    ;
    (frame_Sound._slide_otherPlayerVolume):SetControlPos(chk_Option.currentPlayerVolume)
    GameOption_SetVolumeText(chk_Option.currentMaster, chk_Option.currentFxSound, chk_Option.currentDlgSound, chk_Option.currentEnvSound, chk_Option.currentMusic, chk_Option.currentHitFxVolume, chk_Option.currentHitFxWeight, chk_Option.currentPlayerVolume)
    ;
    (gamePanel_Main._btn_Apply):SetEnable(true)
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

GameOption_ResetGameOption = function()
  -- function num : 0_305 , upvalues : chk_Option, frame_Game, GetStr_Option, gamePanel_Main
  resetGameOption()
  local mouseSensitivityX_Percent = (chk_Option.currentCheckMouseSensitivityX - 0.1) / 1.9 * 100
  local mouseSensitivityY_Percent = (chk_Option.currentCheckMouseSensitivityY - 0.1) / 1.9 * 100
  local padSensitivityX_Percent = (chk_Option.currentCheckPadSensitivityX - 0.1) / 1.9 * 100
  local padSensitivityY_Percent = (chk_Option.currentCheckPadSensitivityY - 0.1) / 1.9 * 100
  _currentSpiritGuideCheck = chk_Option.currentCheckShowComboGuide
  if Panel_SkillCommand ~= nil then
    Panel_SkillCommand:SetShow(chk_Option.currentCheckShowSkillCmd, false)
    isChecked_SkillCommand = chk_Option.currentCheckShowSkillCmd
  end
  local updateTarget = {[(CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow] = frame_Game._btn_SelfNameShowAllways, [(CppEnums.VisibleNameTagType).eVisibleNameTagType_ImportantShow] = frame_Game._btn_SelfNameShowImportant, [(CppEnums.VisibleNameTagType).eVisibleNameTagType_NoShow] = frame_Game._btn_SelfNameShowNoShow}
  local updatePetTarget = {[(CppEnums.PetVisibleType).ePetVisibleType_All] = frame_Game._btn_PetAll, [(CppEnums.PetVisibleType).ePetVisibleType_Mine] = frame_Game._btn_PetMine, [(CppEnums.PetVisibleType).ePetVisibleType_Hide] = frame_Game._btn_PetHide}
  local updateFontResizeTarget = {[0] = frame_Game._btn_FontResizeDefault, [1] = frame_Game._btn_FontResizeBig, [2] = frame_Game._btn_FontResizeMoreBig}
  local updateNavPathEffect = {[(CppEnums.NavPathEffectType).eNavPathEffectType_None] = frame_Game._btn_NavGuideNone, [(CppEnums.NavPathEffectType).eNavPathEffectType_Arrow] = frame_Game._btn_NavGuideArrow, [(CppEnums.NavPathEffectType).eNavPathEffectType_PathEffect] = frame_Game._btn_NavGuideEffect, [(CppEnums.NavPathEffectType).eNavPathEffectType_Fairy] = frame_Game._btn_NavGuideFairy}
  local updateWorldmapOpenTypeList = {[(CppEnums.WorldMapAnimationStyle).afterSpinNorth] = frame_Game._btn_WorldMapOpenByWestMaintain, [(CppEnums.WorldMapAnimationStyle).characterToNorthSmooth] = frame_Game._btn_WorldMapOpenByCharacterToWest, [(CppEnums.WorldMapAnimationStyle).characterMaintainSmooth] = frame_Game._btn_WorldMapOpenByCharacterMaintain, [(CppEnums.WorldMapAnimationStyle).noAnimation] = frame_Game._btn_WorldMapOpenByNone}
  do
    local updateWorldmapCameraTypeList = {[(CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Default] = frame_Game._btn_WorldMapCameraDefaultAngle, [(CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Degree30] = frame_Game._btn_WorldMapCameraDegree30, [(CppEnums.WorldMapCameraPitchType).eWorldMapCameraPitchType_Degree90] = frame_Game._btn_WorldMapCameraDegree90}
    for key,value in pairs(updateTarget) do
      value:SetCheck(key == chk_Option.currentSelfPlayerNameTagVisible)
    end
    for key,value in pairs(updatePetTarget) do
      value:SetCheck(key == chk_Option.currentPetObjectShow)
    end
    for key,value in pairs(updateFontResizeTarget) do
      value:SetCheck(key == chk_Option.currentFontResizeType)
    end
    for key,value in pairs(updateNavPathEffect) do
      value:SetCheck(key == chk_Option.currentNavPathEffectType)
    end
    for key,value in pairs(updateWorldmapOpenTypeList) do
      value:SetCheck(key == chk_Option.currentWorldMapOpenType)
    end
    for key,value in pairs(updateWorldmapCameraTypeList) do
      value:SetCheck(key == chk_Option.currentWorldMapCameraType)
    end
    ;
    (frame_Game._btn_OtherNameShow):SetCheck((CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == chk_Option.currentOtherPlayerNameTagVisible)
    ;
    (frame_Game._btn_PartyNameShow):SetCheck((CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == chk_Option.currentPartyPlayerNameTagVisible)
    ;
    (frame_Game._btn_GuildNameShow):SetCheck((CppEnums.VisibleNameTagType).eVisibleNameTagType_AllwaysShow == chk_Option.currentGuildPlayerNameTagVisible)
    ;
    (frame_Game._btn_GuideLineHumanRelation):SetCheck(chk_Option.currentGuideLineHumanRelation)
    ;
    (frame_Game._btn_GuideLineQuestObject):SetCheck(chk_Option.currentGuideLineQuestLine)
    ;
    (frame_Game._btn_GuideLineZoneChange):SetCheck(chk_Option.currentGuideLineZoneChange)
    ;
    (frame_Game._btn_GuideLineWarAlly):SetCheck(chk_Option.currentGuideLineWarAlly)
    ;
    (frame_Game._btn_GuideLineGuild):SetCheck(chk_Option.currentGuideLineGuild)
    ;
    (frame_Game._btn_GuideLineParty):SetCheck(chk_Option.currentGuideLineParty)
    ;
    (frame_Game._btn_GuideLineEnemy):SetCheck(chk_Option.currentGuideLineEnemy)
    ;
    (frame_Game._btn_GuideLineNonWarPlayer):SetCheck(chk_Option.currentGuideLineNonWarPlayer)
    ;
    (frame_Game._btn_GuideLinePartyEffect):SetCheck(chk_Option.currentGuideLinePartyMemberEffect)
    ;
    (frame_Game._btn_AutoAim):SetCheck(chk_Option.currentCheckAutoAim)
    ;
    (frame_Game._btn_HideWindow):SetCheck(chk_Option.currentCheckHideWindowByAttacked)
    ;
    (frame_Game._btn_GuildLogin):SetCheck(chk_Option.currentCheckShowGuildLoginMessage)
    ;
    (frame_Game._btn_RejectInvitation):SetCheck(chk_Option.currentCheckRejectInvitation)
    ;
    (frame_Game._btn_EnableSimpleUI):SetCheck(chk_Option.currentCheckEnableSimpleUI)
    value_GameOption_Check_ComboGuide:SetCheck(chk_Option.currentCheckShowComboGuide)
    ;
    (frame_Game._btn_MouseMove):SetCheck(chk_Option.currentCheckMouseMove)
    ;
    (frame_Game._btn_MiniMapRotation):SetCheck(chk_Option.currentCheckMiniMapRotation)
    ;
    (frame_Game._btn_ShowAttackEffect):SetCheck(chk_Option.currentCheckShowAttackEffect)
    ;
    (frame_Game._btn_Alert_BlackSpirit):SetCheck(chk_Option.currentCheckBlackSpiritAlert)
    ;
    (frame_Game._btn_UseNewQuickSlot):SetCheck(chk_Option.currentCheckUseNewQuickSlot)
    ;
    (frame_Game._btn_UseChattingFilter):SetCheck(chk_Option.currentCheckUseChattingFilter)
    ;
    (frame_Game._btn_IsOnScreenSaver):SetCheck(chk_Option.currentCheckIsOnScreenSaver)
    ;
    (frame_Game._btn_UIModeMouseLock):SetCheck(chk_Option.currentCheckIsUIModeMouseLock)
    ;
    (frame_Game._btn_PvpRefuse):SetCheck(chk_Option.currentCheckIsPvpRefuse)
    ;
    (frame_Game._btn_ExchangeRefuse):SetCheck(chk_Option.currentCheckIsExchangeRefuse)
    ;
    (frame_Game._btn_HideMast):SetCheck(chk_Option.currentCheckIsHideMast)
    ;
    (frame_Game._btn_ShowCashAlert):SetCheck(chk_option.currentCheckShowCashAlert)
    ;
    (frame_Game._btn_EnableOVR):SetCheck(chk_Option.currentCheckEnableOVR)
    ;
    (frame_Game._btn_MouseX):SetCheck(chk_Option.currentCheckMouseInvertX)
    ;
    (frame_Game._btn_MouseY):SetCheck(chk_Option.currentCheckMouseInvertY)
    ;
    (frame_Game._slide_MouXSen):SetControlPos(mouseSensitivityX_Percent)
    ;
    (frame_Game._txt_MouXSen):SetText(GetStr_Option[12] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(mouseSensitivityX_Percent, 100)) .. "% <PAOldColor>) ")
    ;
    (frame_Game._slide_MouYSen):SetControlPos(mouseSensitivityY_Percent)
    ;
    (frame_Game._txt_MouYSen):SetText(GetStr_Option[13] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(mouseSensitivityY_Percent, 100)) .. "% <PAOldColor>) ")
    ;
    (frame_Game._btn_UsePad):SetCheck(chk_Option.currentCheckPadEnable)
    ;
    (frame_Game._btn_UseVibe):SetCheck(chk_Option.currentCheckPadVibration)
    ;
    (frame_Game._btn_PadX):SetCheck(chk_Option.currentCheckPadInvertX)
    ;
    (frame_Game._btn_PadY):SetCheck(chk_Option.currentCheckPadInvertY)
    ;
    (frame_Game._slide_PadXSen):SetControlPos(padSensitivityX_Percent)
    ;
    (frame_Game._txt_PadXSen):SetText(GetStr_Option[14] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(padSensitivityX_Percent, 100)) .. "% <PAOldColor>) ")
    ;
    (frame_Game._slide_PadYSen):SetControlPos(padSensitivityY_Percent)
    ;
    (frame_Game._txt_PadYSen):SetText(GetStr_Option[15] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", (math.min)(padSensitivityY_Percent, 100)) .. "% <PAOldColor>) ")
    ;
    (gamePanel_Main._btn_Apply):SetEnable(true)
    -- DECOMPILER ERROR: 15 unprocessed JMP targets
  end
end

GameOption_UIPositon_Reset = function()
  -- function num : 0_306
end

GameOption_SimpleToolTips = function(isShow, optionType)
  -- function num : 0_307 , upvalues : gamePanel_Main, frame_Sound
  if optionType == 1 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_DISPLAY_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_DISPLAY_DESC")
    uiControl = gamePanel_Main._btn_Display
  else
    if optionType == 2 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_SOUND_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_SOUND_DESC")
      uiControl = gamePanel_Main._btn_Sound
    else
      if optionType == 3 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_GMAE_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_GMAE_DESC")
        uiControl = gamePanel_Main._btn_Game
      else
        if optionType == 4 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_KEYCONFIG_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_KEYCONFIG_DESC")
          uiControl = gamePanel_Main._btn_KeyConfig
        else
          if optionType == 5 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_KEYCONFIGUI_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_KEYCONFIGUI_DESC")
            uiControl = gamePanel_Main._btn_KeyConfig_UI
          else
            if optionType == 6 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_LANGUAGE_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_TOOLTIP_LANGUAGE_DESC")
              uiControl = gamePanel_Main._btn_Language
            else
              if optionType == 7 then
                if isGameTypeKorea() then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN_DESC")
                  uiControl = frame_Sound._btn_NpcVoice1
                else
                  if isGameTypeJapan() then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE_DESC")
                    uiControl = frame_Sound._btn_NpcVoice1
                  else
                  end
                end
                if not isGameTypeRussia() or isGameTypeEnglish() then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH_DESC")
                  uiControl = frame_Sound._btn_NpcVoice1
                else
                  if isGameTypeTaiwan() then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH_DESC")
                    uiControl = frame_Sound._btn_NpcVoice1
                  else
                    _PA_LOG("LUA", "�\173 국가 리소스가 추가되면 �\180 곳도 수정 판단 해주어야합니�\164.")
                  end
                end
              else
                if optionType == 8 then
                  if isGameTypeKorea() then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE_DESC")
                    uiControl = frame_Sound._btn_NpcVoice2
                  else
                    if isGameTypeJapan() then
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN_DESC")
                      uiControl = frame_Sound._btn_NpcVoice2
                    else
                    end
                  end
                  if not isGameTypeRussia() or isGameTypeEnglish() then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE_DESC")
                    uiControl = frame_Sound._btn_NpcVoice2
                  else
                    if isGameTypeTaiwan() then
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_JAPANESE_DESC")
                      uiControl = frame_Sound._btn_NpcVoice2
                    else
                      _PA_LOG("LUA", "�\173 국가 리소스가 추가되면 �\180 곳도 수정 판단 해주어야합니�\164.")
                    end
                  end
                else
                  if optionType == 9 then
                    if isGameTypeKorea() then
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH_DESC")
                      uiControl = frame_Sound._btn_NpcVoice3
                    else
                      if isGameTypeJapan() then
                        name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH")
                        desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ENGLISH_DESC")
                        uiControl = frame_Sound._btn_NpcVoice3
                      else
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
  if not isGameTypeRussia() or isGameTypeEnglish() then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN_DESC")
    uiControl = frame_Sound._btn_NpcVoice3
  else
    if isGameTypeTaiwan() then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_KOREAN_DESC")
      uiControl = frame_Sound._btn_NpcVoice3
    else
      _PA_LOG("LUA", "�\173 국가 리소스가 추가되면 �\180 곳도 수정 판단 해주어야합니�\164.")
    end
  end
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

Button_Simpletooltips = function(isShow, targetNo)
  -- function num : 0_308 , upvalues : toolTipIdxValue
  if isShow == true then
    registTooltipControl((toolTipIdxValue[targetNo]).control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show((toolTipIdxValue[targetNo]).control, (toolTipIdxValue[targetNo]).name, (toolTipIdxValue[targetNo]).desc)
  else
    TooltipSimple_Hide()
  end
end

Show_PictureTooltips = function(isShow, tooltipType)
  -- function num : 0_309 , upvalues : frame_Display
  for index = 0, #frame_Display._pictureTooltip do
    ((frame_Display._pictureTooltip)[index]):SetShow(false)
  end
  Button_Simpletooltips(false)
  if not isShow then
    return 
  end
  ;
  ((frame_Display._pictureTooltip)[tooltipType]):SetShow(true)
  ;
  ((frame_Display._pictureTooltip)[tooltipType]):ComputePos()
  if tooltipType == 0 then
    local posY = (frame_Display._btn_Trxt):GetPosY()
    ;
    ((frame_Display._pictureTooltip)[tooltipType]):SetPosY(posY + 30)
  else
    do
      if tooltipType == 1 then
        local posY = (frame_Display._btn_AntiAlli):GetPosY()
        ;
        ((frame_Display._pictureTooltip)[tooltipType]):SetPosY(posY + 30)
      else
        do
          if tooltipType == 2 then
            local posY = (frame_Display._btn_DOF):GetPosY()
            ;
            ((frame_Display._pictureTooltip)[tooltipType]):SetPosY(posY + 30)
          else
            do
              if tooltipType == 3 then
                local posY = (frame_Display._btn_Tessellation):GetPosY()
                ;
                ((frame_Display._pictureTooltip)[tooltipType]):SetPosY(posY + 30)
              else
                do
                  if tooltipType == 4 then
                    local posY = (frame_Display._btn_SSAO):GetPosY()
                    ;
                    ((frame_Display._pictureTooltip)[tooltipType]):SetPosY(posY + 30)
                  else
                    do
                      if tooltipType == 5 then
                        local posY = (frame_Display._btn_Represent):GetPosY()
                        ;
                        ((frame_Display._pictureTooltip)[tooltipType]):SetPosY(posY + 30)
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

FGlobal_getUIScale = function()
  -- function num : 0_310 , upvalues : scaleRangeTable
  local uiScale = {}
  uiScale.min = scaleRangeTable.minScaleValue
  uiScale.max = scaleRangeTable.maxScaleValue
  return uiScale
end

FGlobal_returnUIScale = function()
  -- function num : 0_311 , upvalues : chk_Option
  return chk_Option.currentCheckUIScale
end

FGlobal_saveUIScale = function(scale)
  -- function num : 0_312 , upvalues : chk_Option
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.currentCheckUIScale = scale / 100
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.appliedCheckUIScale = chk_Option.currentCheckUIScale
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  chk_Option.savedCheckUIScale = chk_Option.currentCheckUIScale
end

FGlobal_ApplyUIScale = function(scalePercent)
  -- function num : 0_313 , upvalues : scaleRangeTable, chk_Option, frame_Display, GetStr_Option
  local interval = scaleRangeTable.maxScaleValue - scaleRangeTable.minScaleValue
  local uiScale_Percent = scalePercent
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R3 in 'UnsetPending'

  chk_Option.currentCheckUIScale = (math.floor)(scalePercent / 100 * 100) / 100
  ;
  (frame_Display._txt_UIScale):SetText(GetStr_Option[5] .. " ( <PAColor0xffbcf281>" .. (string.format)("%.0f", chk_Option.currentCheckUIScale * 100) .. "% <PAOldColor>)")
  ;
  (frame_Display._txt_UIScaleLow):SetText(tostring(scaleRangeTable.minScaleValue))
  ;
  (frame_Display._txt_UIScaleMidle):SetText(tostring(scaleRangeTable.minScaleValue + interval * 0.5))
  ;
  (frame_Display._txt_UIScaleHigh):SetText(tostring(scaleRangeTable.maxScaleValue))
  ;
  (frame_Display._slide_UIScale):SetControlPos((uiScale_Percent - scaleRangeTable.minScaleValue) / interval * 100)
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R3 in 'UnsetPending'

  chk_Option.appliedCheckUIScale = chk_Option.currentCheckUIScale
  -- DECOMPILER ERROR at PC72: Confused about usage of register: R3 in 'UnsetPending'

  chk_Option.savedCheckUIScale = chk_Option.currentCheckUIScale
  setUIScale(chk_Option.savedCheckUIScale)
end

Panel_GameOption_Initialize()
Option_RegistEventHandler()
Option_RegistMessageHandler()
Panel_Window_Option:RegisterUpdateFunc("Option_Update")
ToClient_initGameOption()
gameOption_SetEnableArea_Func()
GameOption_FontResizeCheckFontType = function(fontRaiseSize)
  -- function num : 0_314
  local addFontSize = convertUIFontTypeToUIFontSize(fontRaiseSize)
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

getUiFontSize = function()
  -- function num : 0_315 , upvalues : frame_Game
  if (frame_Game._btn_FontResizeDefault):IsCheck() then
    return 0
  else
    if (frame_Game._btn_FontResizeBig):IsCheck() then
      return 1
    else
      if (frame_Game._btn_FontResizeMoreBig):IsCheck() then
        return 2
      end
    end
  end
end

local simpleUI_Check = (frame_Game._btn_EnableSimpleUI):IsCheck()
SimpleUI_Check = function()
  -- function num : 0_316 , upvalues : simpleUI_Check
  SimpleUI_EnableCheck(simpleUI_Check)
end

SimpleUI_EnableCheck(simpleUI_Check)
FromClient_ChangeScreenMode = function()
  -- function num : 0_317
  reloadGameUI()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_CHANGESCREENMODE_FULL")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionYes = ToClient_ChangePreScreenMode, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

GameOption_SimpleTipOnce = function(isShow)
  -- function num : 0_318 , upvalues : frame_Display
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_OPTIMIZATIONDESC_TOOLTIP")
  desc = PAGetString(Defines.StringSheet_RESOURCE, "OPTION_TEXT_OPTIMIZETIP")
  control = frame_Display._optimizationDesc
  TooltipSimple_Show(control, name, desc)
end

GameOption_UIKeySetting_Simpletooltip = function(isShow, index, keyType)
  -- function num : 0_319 , upvalues : getKeyConfigData, STATIC_INPUT_TITLE, getKeyConfigData_UI, STATIC_INPUT_TITLE_UI
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  if keyType == 0 then
    local keyConfigData = getKeyConfigData(index)
    name = keyConfigData.titleText
    control = STATIC_INPUT_TITLE[index]
  else
    do
      do
        if keyType == 1 then
          local keyConfigData_UI = getKeyConfigData_UI(index)
          name = keyConfigData_UI.titleText
          control = STATIC_INPUT_TITLE_UI[index]
        end
        TooltipSimple_Show(control, name, desc)
      end
    end
  end
end

GameOption_UIKeySetting_PadKey_Simpletooltip = function(isShow, index, keyType)
  -- function num : 0_320 , upvalues : getKeyConfigData, BUTTON_PAD, getKeyConfigData_UI, BUTTON_PAD_UI
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  if keyType == 0 then
    local keyConfigData = getKeyConfigData(index)
    name = keyConfigData.padKeyText
    control = BUTTON_PAD[index]
  else
    do
      do
        if keyType == 1 then
          local keyConfigData_UI = getKeyConfigData_UI(index)
          name = keyConfigData_UI.padKeyText
          control = BUTTON_PAD_UI[index]
        end
        TooltipSimple_Show(control, name, desc)
      end
    end
  end
end

GameOption_Repos = function()
  -- function num : 0_321 , upvalues : chk_Option
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_Window_Option:SetPosX((screenSizeX - Panel_Window_Option:GetSizeX()) / 2)
  Panel_Window_Option:SetPosY((screenSizeY - Panel_Window_Option:GetSizeY()) / 2)
  if CppDefine.ChangeUIAndResolution == true then
    local uiScale = chk_Option.currentCheckUIScale
    uiScale = uiScale + 0.002
    GameOption_InitScale_50_200(uiScale)
  end
end

isNearMonsterAlert = function()
  -- function num : 0_322 , upvalues : frame_Game
  return (frame_Game._btn_Alert_NearMonster):IsCheck()
end

registerEvent("FromClient_ChangeScreenMode", "FromClient_ChangeScreenMode")
registerEvent("onScreenResize", "GameOption_Repos")

