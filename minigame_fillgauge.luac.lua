-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_fillgauge.luac 

-- params : ...
-- function num : 0
local MGKT = CppEnums.MiniGameKeyType
local UIColor = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local VCK = CppEnums.VirtualKeyCode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
Panel_FillGauge:SetShow(false, false)
local ui = {_fillGauge_BG = (UI.getChildControl)(Panel_FillGauge, "Static_GaugeBG"), _myGauge = (UI.getChildControl)(Panel_FillGauge, "Progress2_MyGauge"), _middleLine = (UI.getChildControl)(Panel_FillGauge, "Static_MiddleLine"), _pushGong = (UI.getChildControl)(Panel_FillGauge, "Static_Gong"), _mouseL = (UI.getChildControl)(Panel_FillGauge, "Static_L_Btn_L"), _mouseR = (UI.getChildControl)(Panel_FillGauge, "Static_R_Btn_R"), _text_TitleText = (UI.getChildControl)(Panel_FillGauge, "StaticText_TitleText"), _text_RemainTime = (UI.getChildControl)(Panel_FillGauge, "StaticText_RemainTimeText"), _text_Timer = (UI.getChildControl)(Panel_FillGauge, "StaticText_Timer"), _result_Success = (UI.getChildControl)(Panel_FillGauge, "Static_Result_Success"), _result_Failed = (UI.getChildControl)(Panel_FillGauge, "Static_Result_Failed")}
local ballGroup = {}
local ball_Index = 1
local sumDeltaTime = 0
local currentPercent = 0
local remainTime = 20
local gameProgress = {playing = 1, ending = 2}
local gameProgressValue = gameProgress.ending
local init = function()
  -- function num : 0_0 , upvalues : UCT, ui, ballGroup
  registerEvent("onScreenResize", "FillGauge_RePosition")
  FillGauge_RePosition()
  Panel_FillGauge:RegisterUpdateFunc("Panel_Minigame_UpdateFunc")
  for k = 1, 50 do
    local ball = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, ui._myGauge, "ball_" .. tostring(k))
    CopyBaseProperty(ui._pushGong, ball)
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R5 in 'UnsetPending'

    ballGroup[k] = ball
    ball:SetPosY(4)
  end
end

FillGauge_RePosition = function()
  -- function num : 0_1
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  Panel_FillGauge:SetPosX(screenX / 2 - 135.5)
  Panel_FillGauge:SetPosY(scrY / 2 - 250)
end

local setProgress = function(isSetProgress)
  -- function num : 0_2 , upvalues : currentPercent, ui
  if currentPercent < 0 then
    currentPercent = 0
  else
    if currentPercent > 100 then
      currentPercent = 100
      FillGauge_Result()
    end
  end
  ;
  (ui._myGauge):SetProgressRate(currentPercent)
  if isSetProgress then
    (ui._myGauge):SetCurrentProgressRate(currentPercent)
  end
end

Panel_Minigame_FillGauge_Start = function()
  -- function num : 0_3 , upvalues : ui, gameProgressValue, gameProgress, remainTime, currentPercent, setProgress
  (ui._result_Success):SetShow(false)
  ;
  (ui._result_Failed):SetShow(false)
  ;
  (ui._result_Success):ResetVertexAni()
  ;
  (ui._result_Failed):ResetVertexAni()
  ;
  (ui._result_Success):SetAlpha(0)
  ;
  (ui._result_Failed):SetAlpha(0)
  gameProgressValue = gameProgress.playing
  remainTime = 20
  Panel_FillGauge:SetShow(true, false)
  currentPercent = 0
  setProgress(true)
end

FillGauge_UpdateGauge = function(deltaTime, isLeft)
  -- function num : 0_4 , upvalues : gameProgressValue, gameProgress, currentPercent, setProgress, ui, ballGroup, ball_Index
  if gameProgressValue ~= gameProgress.playing then
    return 
  end
  currentPercent = currentPercent + 3.7
  setProgress(false)
  ;
  (ui._myGauge):ResetVertexAni()
  ;
  (ui._mouseL):ResetVertexAni()
  ;
  (ui._mouseR):ResetVertexAni()
  ;
  (ui._myGauge):SetVertexAniRun("Ani_Color_myGaugeEff", true)
  if isLeft then
    (ui._mouseL):SetVertexAniRun("Ani_Color_Left", true)
  else
    ;
    (ui._mouseR):SetVertexAniRun("Ani_Color_Right", true)
  end
  ;
  (ballGroup[ball_Index]):SetShow(true)
  ;
  (ballGroup[ball_Index]):SetPosX(0)
  ball_Index = ball_Index + 1
  if ball_Index > 50 then
    ball_Index = 1
  end
end

FillGauge_UpdatePerFrame = function(deltaTime)
  -- function num : 0_5 , upvalues : gameProgressValue, gameProgress, sumDeltaTime, currentPercent, setProgress
  if gameProgressValue == gameProgress.playing then
    sumDeltaTime = sumDeltaTime + deltaTime * 30
    local number, underZero = (math.modf)(sumDeltaTime)
    sumDeltaTime = underZero
    currentPercent = currentPercent - number
    setProgress(false)
    FillGauge_EndTimer(deltaTime)
  else
  end
  do
    if gameProgressValue == gameProgress.ending then
      FillGauge_BallUpdate(deltaTime)
    end
  end
end

FillGauge_BallUpdate = function(deltaTime)
  -- function num : 0_6 , upvalues : ballGroup, ui, currentPercent
  for _,value in pairs(ballGroup) do
    if value:GetShow() then
      value:SetPosX(value:GetPosX() + value:GetSizeX())
      if (ui._myGauge):GetSizeX() * currentPercent / 100 <= value:GetPosX() + value:GetSizeX() then
        value:SetShow(false)
      end
    end
  end
end

FillGauge_EndTimer = function(deltaTime)
  -- function num : 0_7 , upvalues : remainTime, ui, currentPercent
  remainTime = remainTime - deltaTime
  local remainSec = (math.floor)(remainTime)
  if remainTime > 0 then
    (ui._text_Timer):SetText(remainSec .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND"))
  else
    if remainTime <= 0 then
      if currentPercent >= 100 then
        audioPostEvent_SystemUi(11, 1)
        ;
        (ui._result_Success):SetShow(true)
        ;
        (ui._result_Success):ResetVertexAni()
        ;
        (ui._result_Success):SetVertexAniRun("Ani_Scale_Result_Success_empty", true)
        ;
        (ui._result_Success):SetVertexAniRun("Ani_Scale_Result_Success", true)
        ;
        (ui._result_Success):SetVertexAniRun("Ani_Color_Result_Success_empty", true)
        ;
        (ui._result_Success):SetVertexAniRun("Ani_Color_Result_Success", true)
        ;
        ((getSelfPlayer()):get()):SetMiniGameResult(0)
      else
        if currentPercent <= 99 then
          audioPostEvent_SystemUi(11, 2)
          ;
          (ui._result_Failed):SetShow(true)
          ;
          (ui._result_Failed):ResetVertexAni()
          ;
          (ui._result_Failed):SetVertexAniRun("Ani_Scale_Result_Failed_empty", true)
          ;
          (ui._result_Failed):SetVertexAniRun("Ani_Scale_Result_Failed", true)
          ;
          (ui._result_Failed):SetVertexAniRun("Ani_Color_Result_Failed_empty", true)
          ;
          (ui._result_Failed):SetVertexAniRun("Ani_Color_Result_Failed", true)
          ;
          ((getSelfPlayer()):get()):SetMiniGameResult(3)
        end
      end
      Panel_Minigame_FillGauge_End()
    end
  end
end

FillGauge_Result = function()
  -- function num : 0_8 , upvalues : gameProgressValue, gameProgress, currentPercent, ui
  gameProgressValue = gameProgress.ending
  if currentPercent >= 100 then
    audioPostEvent_SystemUi(11, 1)
    ;
    (ui._result_Success):SetShow(true)
    ;
    (ui._result_Success):ResetVertexAni()
    ;
    (ui._result_Success):SetVertexAniRun("Ani_Scale_Result_Success_empty", true)
    ;
    (ui._result_Success):SetVertexAniRun("Ani_Scale_Result_Success", true)
    ;
    (ui._result_Success):SetVertexAniRun("Ani_Color_Result_Success_empty", true)
    ;
    (ui._result_Success):SetVertexAniRun("Ani_Color_Result_Success", true)
    ;
    ((getSelfPlayer()):get()):SetMiniGameResult(0)
  else
    audioPostEvent_SystemUi(11, 2)
    ;
    (ui._result_Failed):SetShow(true)
    ;
    (ui._result_Failed):ResetVertexAni()
    ;
    (ui._result_Failed):SetVertexAniRun("Ani_Scale_Result_Failed_empty", true)
    ;
    (ui._result_Failed):SetVertexAniRun("Ani_Scale_Result_Failed", true)
    ;
    (ui._result_Failed):SetVertexAniRun("Ani_Color_Result_Failed_empty", true)
    ;
    (ui._result_Failed):SetVertexAniRun("Ani_Color_Result_Failed", true)
    ;
    ((getSelfPlayer()):get()):SetMiniGameResult(3)
  end
  Panel_Minigame_FillGauge_End()
end

Panel_Minigame_FillGauge_End = function()
  -- function num : 0_9
  Panel_FillGauge:SetShow(false, false)
end

Panel_MiniGame_FillGauge_Hide = function()
  -- function num : 0_10 , upvalues : UI_PSFT, UI_ANI_ADV, UIColor
  Panel_FillGauge:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local fillGauge_Hide = Panel_FillGauge:addColorAnimation(2.4, 2.75, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  fillGauge_Hide:SetStartColor(UIColor.C_FFFFFFFF)
  fillGauge_Hide:SetEndColor(UIColor.C_00FFFFFF)
  fillGauge_Hide:SetStartIntensity(3)
  fillGauge_Hide:SetEndIntensity(1)
  fillGauge_Hide.IsChangeChild = true
  fillGauge_Hide:SetHideAtEnd(true)
  fillGauge_Hide:SetDisableWhileAni(true)
end

Panel_MiniGame_FillGauge_Show = function()
  -- function num : 0_11 , upvalues : UI_ANI_ADV, UIColor
  local fillGauge_Show = Panel_FillGauge:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  fillGauge_Show:SetStartColor(UIColor.C_00FFFFFF)
  fillGauge_Show:SetEndColor(UIColor.C_FFFFFFFF)
  fillGauge_Show:SetStartIntensity(3)
  fillGauge_Show:SetEndIntensity(1)
  fillGauge_Show.IsChangeChild = true
  fillGauge_Show:SetHideAtEnd(false)
  fillGauge_Show:SetDisableWhileAni(true)
end

Panel_MiniGame_FillGauge_IsPlaying = function()
  -- function num : 0_12 , upvalues : gameProgressValue, gameProgress
  do return gameProgressValue == gameProgress.playing end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

init()

