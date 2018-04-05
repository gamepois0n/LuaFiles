-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\righttopicons\panel_personalicon_autotraining2.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_AutoTraining:SetShow(false)
local isAutoTrainingEnable = ToClient_IsContentsGroupOpen("57")
Panel_AutoTraining:RegisterShowEventFunc(true, "AutoPlayShowAni()")
Panel_AutoTraining:RegisterShowEventFunc(false, "AutoPlayHideAni()")
PaGlobal_AutoPlay = {_img_AutoPlay = (UI.getChildControl)(Panel_AutoTraining, "Static_AutoPlay"), _txt_AutoPlayEnd = (UI.getChildControl)(Panel_AutoTraining, "StaticText_AutoPlay")}
local autoTrain = ToClient_IsAutoLevelUp()
AutoPlayShowAni = function()
  -- function num : 0_0
  local ImageMoveAni = Panel_AutoTraining:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ImageMoveAni:SetStartPosition(getScreenSizeX() / 2 - Panel_AutoTraining:GetSizeX() / 2, 0 - Panel_AutoTraining:GetSizeY())
  ImageMoveAni:SetEndPosition(getScreenSizeX() / 2 - Panel_AutoTraining:GetSizeX() / 2, getScreenSizeY() - getScreenSizeY() / 1.5 - Panel_AutoTraining:GetSizeY())
  ImageMoveAni.IsChangeChild = true
  Panel_AutoTraining:CalcUIAniPos(ImageMoveAni)
  ImageMoveAni:SetDisableWhileAni(true)
  PAGlobal_AutoTraining_Alarm_OnAutoTrainingStart()
end

AutoPlayHideAni = function()
  -- function num : 0_1
  local ImageMoveAni = Panel_AutoTraining:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ImageMoveAni:SetStartPosition(getScreenSizeX() / 2 - Panel_AutoTraining:GetSizeX() / 2, getScreenSizeY() - getScreenSizeY() / 1.5 - Panel_AutoTraining:GetSizeY())
  ImageMoveAni:SetEndPosition(getScreenSizeX() / 2 - Panel_AutoTraining:GetSizeX() / 2, 0 - Panel_AutoTraining:GetSizeY())
  ImageMoveAni.IsChangeChild = true
  Panel_AutoTraining:CalcUIAniPos(ImageMoveAni)
  ImageMoveAni:SetDisableWhileAni(true)
  ImageMoveAni:SetHideAtEnd(true)
  ImageMoveAni:SetDisableWhileAni(true)
  PAGlobal_AutoTraining_Alarm_OnAutoTrainingEnd()
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_AutoPlay.Init = function(self)
  -- function num : 0_2 , upvalues : autoTrain, UI_TM
  if not ToClient_IsContentsGroupOpen("57") then
    return 
  end
  if autoTrain then
    PaGlobal_AutoPlay:Open()
  end
  ;
  (self._txt_AutoPlayEnd):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_AutoPlayEnd):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_AUTOPLAY_PLAYEND"))
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_AutoPlay.Open = function(self)
  -- function num : 0_3
  Panel_AutoTraining:SetShow(true, true)
  ;
  (self._img_AutoPlay):SetVertexAniRun("Ani_Rotate_New", true)
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_AutoPlay.Close = function(self)
  -- function num : 0_4
  Panel_AutoTraining:SetShow(false, true)
end

FromClient_CantIncreaseExpWithAutoLevelUp = function()
  -- function num : 0_5
end

FromClient_SetAutoLevelUp = function(isAuto)
  -- function num : 0_6 , upvalues : autoTrain
  if isAuto == nil then
    return 
  end
  autoTrain = isAuto
  if isAuto then
    PaGlobal_AutoPlay:Open()
  else
    PaGlobal_AutoPlay:Close()
  end
end

PaGlobal_AutoPlay:Init()
registerEvent("FromClient_CantIncreaseExpWithAutoLevelUp", "FromClient_CantIncreaseExpWithAutoLevelUp")
registerEvent("FromClient_SetAutoLevelUp", "FromClient_SetAutoLevelUp")

