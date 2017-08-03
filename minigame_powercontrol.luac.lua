-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_powercontrol.luac 

-- params : ...
-- function num : 0
local MGKT = CppEnums.MiniGameKeyType
local MGT = CppEnums.MiniGameType
Panel_MiniGame_PowerControl:SetShow(false)
local ui = {_gauge_L_BG = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_PowerGauge_BG_L"), _gauge_R_BG = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_PowerGauge_BG_R"), _gaugeDanger_L = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_Danger_L"), _gaugeDanger_R = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_Danger_R"), _gauge_L = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Progress2_PowerGauge_L"), _gauge_R = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Progress2_PowerGauge_R"), _gaugeDeco_L = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_Cow_Deco_L"), _gaugeDeco_R = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_Cow_Deco_R"), _milky_L = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_MilkyLeft"), _milky_R = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_MilkyRight"), _txt_MilkyRate = (UI.getChildControl)(Panel_MiniGame_PowerControl, "StaticText_MilkyRate"), _mouse_L = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_L_Btn_L"), _mouse_R = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_R_Btn_R"), _gameTimer = (UI.getChildControl)(Panel_MiniGame_PowerControl, "StaticText_Timer"), _result_Success = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_Result_Success"), _resultFailed = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Static_Result_Failed"), _progress_Milk = (UI.getChildControl)(Panel_MiniGame_PowerControl, "Progress2_Milk")}
local gameMode = 0
local directionType = 0
local milkRate = -1
local leftMilkyRate = 1
local rightMilkyRate = 1
local isPlayingMilky = false
local currTime = -1
local gameEndTimer = 21
local endTimer = 0
local isSuccess = false
local isPressed_L = false
local isPressed_R = false
local onKeyDown = function(keyType)
  -- function num : 0_0 , upvalues : MGKT, isPressed_L, isPressed_R
  if MGKT.MiniGameKeyType_M0 == keyType then
    isPressed_L = true
  else
    if MGKT.MiniGameKeyType_M1 == keyType then
      isPressed_R = true
    end
  end
end

local onKeyUp = function(keyType)
  -- function num : 0_1 , upvalues : MGKT, isPressed_L, directionType, ui, isPressed_R
  if MGKT.MiniGameKeyType_M0 == keyType then
    audioPostEvent_SystemUi(11, 5)
    isPressed_L = false
    directionType = 1
    ;
    (ui._gauge_L_BG):SetAlpha(0.6)
    ;
    (ui._gauge_L):SetAlpha(0.6)
    ;
    (ui._gaugeDeco_L):SetAlpha(0.6)
    ;
    (ui._gauge_R_BG):SetAlpha(1)
    ;
    (ui._gauge_R):SetAlpha(1)
    ;
    (ui._gaugeDeco_R):SetAlpha(1)
  else
    if MGKT.MiniGameKeyType_M1 == keyType then
      audioPostEvent_SystemUi(11, 5)
      isPressed_R = false
      directionType = 0
      ;
      (ui._gauge_L_BG):SetAlpha(1)
      ;
      (ui._gauge_L):SetAlpha(1)
      ;
      (ui._gaugeDeco_L):SetAlpha(1)
      ;
      (ui._gauge_R_BG):SetAlpha(0.6)
      ;
      (ui._gauge_R):SetAlpha(0.6)
      ;
      (ui._gaugeDeco_R):SetAlpha(0.6)
    end
  end
end

Panel_MiniGame_PowerControl_Initialize = function()
  -- function num : 0_2 , upvalues : ui, leftMilkyRate, rightMilkyRate, directionType, milkRate, gameEndTimer, endTimer, MGT, onKeyDown, onKeyUp
  (ui._gauge_L):SetProgressRate(100)
  ;
  (ui._gauge_R):SetProgressRate(100)
  leftMilkyRate = 100
  rightMilkyRate = 100
  ;
  (ui._gauge_L_BG):SetAlpha(1)
  ;
  (ui._gauge_L):SetAlpha(1)
  ;
  (ui._gaugeDeco_L):SetAlpha(1)
  ;
  (ui._gauge_R_BG):SetAlpha(0.6)
  ;
  (ui._gauge_R):SetAlpha(0.6)
  ;
  (ui._gaugeDeco_R):SetAlpha(0.6)
  ;
  (ui._gameTimer):SetShow(true)
  ;
  (ui._milky_L):SetShow(false)
  ;
  (ui._milky_R):SetShow(false)
  directionType = 0
  milkRate = 0
  gameEndTimer = 31
  endTimer = 0
  ;
  (ui._progress_Milk):SetProgressRate(milkRate)
  ;
  (ui._result_Success):SetShow(false)
  ;
  (ui._resultFailed):SetShow(false)
  AddMiniGameKeyDownOnce(MGT.MiniGameType_14, onKeyDown)
  AddMiniGameKeyUp(MGT.MiniGameType_14, onKeyUp)
end

Panel_MiniGame_PowerControl_Start = function()
  -- function num : 0_3 , upvalues : isPlayingMilky, isSuccess
  Panel_MiniGame_PowerControl_Initialize()
  Panel_MiniGame_PowerControl:SetShow(true)
  isPlayingMilky = true
  isSuccess = false
end

Panel_MiniGame_PowerControl_End = function()
  -- function num : 0_4 , upvalues : isPlayingMilky, isSuccess
  ((getSelfPlayer()):get()):SetMiniGameResult(4)
  Panel_MiniGame_PowerControl:SetShow(false)
  isPlayingMilky = false
  isSuccess = false
end

Panel_MIniGame_PowerControl_Result = function(deltaTime)
  -- function num : 0_5 , upvalues : endTimer, gameEndTimer, ui, milkRate
  endTimer = endTimer + deltaTime
  local _endTimer = (math.floor)(endTimer)
  gameEndTimer = 0
  ;
  (ui._gameTimer):SetText("")
  if milkRate == 100 and _endTimer < 0.01 then
    Panel_MiniGame_PowerControl_Success()
  else
    if milkRate <= 99 and _endTimer < 0.01 then
      Panel_MiniGame_PowerControl_Failed()
    end
  end
  if _endTimer >= 2 then
    Panel_MiniGame_PowerControl_End()
  end
end

local isFullMilk = false
Panel_MiniGame_PowerControl_Success = function()
  -- function num : 0_6 , upvalues : isSuccess, isPlayingMilky, ui, isFullMilk
  if isSuccess == false then
    isSuccess = true
  else
    return 
  end
  audioPostEvent_SystemUi(11, 13)
  if isPlayingMilky == true then
    ToClient_MinigameResult(1, true)
    FGlobal_MiniGame_PowerControl()
  end
  isPlayingMilky = false
  ;
  (ui._gameTimer):SetShow(false)
  ;
  ((getSelfPlayer()):get()):SetMiniGameResult(0)
  ;
  (ui._result_Success):ResetVertexAni()
  ;
  (ui._result_Success):SetVertexAniRun("Good_Ani", true)
  ;
  (ui._result_Success):SetShow(true)
  ;
  (ui._milky_L):SetShow(false)
  ;
  (ui._milky_R):SetShow(false)
  isFullMilk = true
end

Panel_MiniGame_PowerControl_Failed = function()
  -- function num : 0_7 , upvalues : isPlayingMilky, directionType, isPressed_L, isPressed_R, ui
  audioPostEvent_SystemUi(11, 2)
  if isPlayingMilky == true then
    ToClient_MinigameResult(1, false)
  end
  isPlayingMilky = false
  directionType = -1
  isPressed_L = false
  isPressed_R = false
  ;
  (ui._gameTimer):SetShow(false)
  ;
  ((getSelfPlayer()):get()):SetMiniGameResult(1)
  ;
  (ui._resultFailed):ResetVertexAni()
  ;
  (ui._resultFailed):SetVertexAniRun("Bad_Ani", true)
  ;
  (ui._resultFailed):SetShow(true)
  ;
  (ui._milky_L):SetShow(false)
  ;
  (ui._milky_R):SetShow(false)
end

local leftMilkyRate_Timer = 0
local rightMilkyRate_Timer = 0
local updateRightMilky = function(value)
  -- function num : 0_8 , upvalues : rightMilkyRate, ui, leftMilkyRate
  rightMilkyRate = (math.max)((math.min)(rightMilkyRate + value, 100), 0)
  ;
  (ui._gauge_R):SetProgressRate(rightMilkyRate)
  ;
  (ui._gaugeDanger_L):SetAlpha(0.88 - leftMilkyRate * 0.01)
end

local updateLeftMilky = function(value)
  -- function num : 0_9 , upvalues : leftMilkyRate, ui, rightMilkyRate
  leftMilkyRate = (math.max)((math.min)(leftMilkyRate + value, 100), 0)
  ;
  (ui._gauge_L):SetProgressRate(leftMilkyRate)
  ;
  (ui._gaugeDanger_R):SetAlpha(0.88 - rightMilkyRate * 0.01)
end

Panel_MiniGame_PowerControl_MouseClick_UpdateFunc = function(deltaTime)
  -- function num : 0_10 , upvalues : currTime, gameEndTimer, ui, milkRate, isPressed_L, directionType, updateLeftMilky, updateRightMilky, isPressed_R, isPlayingMilky, isFullMilk, leftMilkyRate, rightMilkyRate
  currTime = currTime + deltaTime
  gameEndTimer = gameEndTimer - deltaTime
  local _gameEndTimer = (math.floor)(gameEndTimer)
  ;
  (ui._txt_MilkyRate):SetText((math.floor)(milkRate) .. " %")
  if isPressed_L and directionType == 0 then
    updateLeftMilky(-175 * deltaTime)
    updateRightMilky(65 * deltaTime)
    milkRate = milkRate + 0.3
    ;
    (ui._mouse_L):ResetVertexAni()
    ;
    (ui._mouse_L):SetVertexAniRun("Ani_Color_Left", true)
    ;
    (ui._milky_L):SetShow(true)
    ;
    (ui._milky_R):SetShow(false)
    ;
    (ui._progress_Milk):SetProgressRate(milkRate)
  else
    if isPressed_R and directionType == 1 then
      updateRightMilky(-175 * deltaTime)
      updateLeftMilky(65 * deltaTime)
      milkRate = milkRate + 0.3
      ;
      (ui._mouse_R):ResetVertexAni()
      ;
      (ui._mouse_R):SetVertexAniRun("Ani_Color_Right", true)
      ;
      (ui._milky_L):SetShow(false)
      ;
      (ui._milky_R):SetShow(true)
      ;
      (ui._progress_Milk):SetProgressRate(milkRate)
    else
      updateLeftMilky(65 * deltaTime)
      updateRightMilky(65 * deltaTime)
      ;
      (ui._milky_L):SetShow(false)
      ;
      (ui._milky_R):SetShow(false)
    end
  end
  if isPlayingMilky == true then
    (ui._gameTimer):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MINIGAME_POWERCONTROL_REMAINTIME", "gameEndTimer", _gameEndTimer))
  end
  isFullMilk = false
  if milkRate >= 100 then
    milkRate = 100
    isFullMilk = true
  end
  if leftMilkyRate <= 1 then
    Panel_MiniGame_PowerControl_Failed()
  else
    if rightMilkyRate <= 1 then
      Panel_MiniGame_PowerControl_Failed()
    end
  end
  if _gameEndTimer <= 0 or isFullMilk == true then
    Panel_MIniGame_PowerControl_Result(deltaTime)
  end
end

Panel_MiniGame_PowerControl_Initialize()
Panel_MiniGame_PowerControl:RegisterUpdateFunc("Panel_MiniGame_PowerControl_MouseClick_UpdateFunc")

