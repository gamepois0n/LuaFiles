-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_gradient.luac 

-- params : ...
-- function num : 0
Panel_Minigame_Gradient:SetShow(false, false)
local MGKT = CppEnums.MiniGameKeyType
local _LButton_L = (UI.getChildControl)(Panel_Minigame_Gradient, "Static_L_Btn_L")
local _RButton_R = (UI.getChildControl)(Panel_Minigame_Gradient, "Static_R_Btn_R")
local _gaugeBG = (UI.getChildControl)(Panel_Minigame_Gradient, "Static_GaugeBG")
local _gaugeBar = (UI.getChildControl)(Panel_Minigame_Gradient, "Static_GaugeBar")
local _fontGood = (UI.getChildControl)(Panel_Minigame_Gradient, "Static_Result_Good")
local _fontBad = (UI.getChildControl)(Panel_Minigame_Gradient, "Static_Result_Bad")
local _math_random = math.random
local _math_randomseed = math.randomseed
local _math_lerp = (Util.Math).Lerp
local ClickDirection = {None = 0, Left = -1, Right = 1}
local define = {sequenceClickTimeSpan = 1, ClickTimeSpanMaxWeight = 0.35, ClickTimeSpanMinWeight = 0.15, speedWeight = 1, gageSize = Panel_Minigame_Gradient:GetSizeX()}
_gaugeBar:SetPosY(4)
local data = {currentPos = 0.5, lastClickTime = 0, lastClickDirection = 0, currentSpeed = 0}
local isGradientPlay = false
MiniGame_GaugeBarMoveCalc = function(fDeltaTime)
  -- function num : 0_0 , upvalues : data, define, _math_lerp, _fontBad, _fontGood, _gaugeBar
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  data.lastClickTime = data.lastClickTime + fDeltaTime
  local currentPos = data.currentPos + data.currentSpeed * fDeltaTime
  if currentPos < 0 then
    currentPos = 0
    ;
    ((getSelfPlayer()):get()):SetMiniGameResult(0)
  else
    if currentPos > 1 then
      currentPos = 1
      ;
      ((getSelfPlayer()):get()):SetMiniGameResult(3)
    end
  end
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

  data.currentPos = currentPos
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

  data.currentSpeed = data.currentSpeed - (0.5 - currentPos) * define.speedWeight * fDeltaTime
  local controlPos = _math_lerp(33, 250, currentPos)
  -- DECOMPILER ERROR at PC61: Unhandled construct in 'MakeBoolean' P1

  if (controlPos < 90 or controlPos > 195) and _fontBad:GetShow() == false then
    audioPostEvent_SystemUi(11, 2)
    _fontBad:SetShow(true, true)
    _fontGood:SetShow(false, true)
    _fontBad:ResetVertexAni()
    _fontBad:SetVertexAniRun("Bad_Ani", true)
    _fontBad:SetVertexAniRun("Bad_ScaleAni", true)
    if controlPos < 90 then
      audioPostEvent_SystemUi(11, 2)
      ;
      ((getSelfPlayer()):get()):SetMiniGameResult(1)
    else
      audioPostEvent_SystemUi(11, 2)
      ;
      ((getSelfPlayer()):get()):SetMiniGameResult(2)
    end
  end
  if _fontGood:GetShow() == false then
    audioPostEvent_SystemUi(11, 1)
    ;
    ((getSelfPlayer()):get()):SetMiniGameResult(4)
    _fontBad:SetShow(false, true)
    _fontGood:SetShow(true, true)
    _fontGood:ResetVertexAni()
    _fontGood:SetVertexAniRun("Good_Ani", true)
    _fontGood:SetVertexAniRun("Good_ScaleAni", true)
  end
  _gaugeBar:SetPosX(controlPos)
end

Panel_Minigame_Gradient_Start = function()
  -- function num : 0_1 , upvalues : _gaugeBar, _math_randomseed, _math_random, data, ClickDirection, isGradientPlay
  Panel_Minigame_Gradient:SetShow(true, false)
  Panel_Minigame_Gradient:RegisterUpdateFunc("Panel_Minigame_UpdateFunc")
  _gaugeBar:SetPosX(centerPos)
  _math_randomseed((os.time)())
  local speed = _math_random()
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  data.currentSpeed = (speed - 0.5) / 4
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  data.lastClickDirection = ClickDirection.None
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  data.lastClickTime = 0
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  data.currentPos = 0.5
  isGradientPlay = true
end

Panel_Minigame_Gradient_End = function()
  -- function num : 0_2 , upvalues : isGradientPlay
  Panel_Minigame_Gradient:RegisterUpdateFunc("")
  Panel_Minigame_Gradient:SetShow(false, false)
  isGradientPlay = false
end

local Panel_Minigame_Gradient_GaugeMove_Left = function()
  -- function num : 0_3 , upvalues : data, ClickDirection, define, _math_lerp, _LButton_L
  local lastClickDirection = data.lastClickDirection
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  data.lastClickDirection = ClickDirection.Left
  local speedWeight = define.ClickTimeSpanMinWeight
  if ClickDirection.Left == lastClickDirection and data.lastClickTime < define.sequenceClickTimeSpan then
    speedWeight = _math_lerp(define.ClickTimeSpanMaxWeight, define.ClickTimeSpanMinWeight, data.lastClickTime / define.sequenceClickTimeSpan)
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

    data.lastClickDirection = ClickDirection.None
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  data.currentSpeed = data.currentSpeed - speedWeight
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

  data.lastClickTime = 0
  _LButton_L:ResetVertexAni()
  _LButton_L:SetVertexAniRun("Ani_Color_Left", true)
end

local Panel_Minigame_Gradient_GaugeMove_Right = function()
  -- function num : 0_4 , upvalues : data, ClickDirection, define, _math_lerp, _RButton_R
  local lastClickDirection = data.lastClickDirection
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  data.lastClickDirection = ClickDirection.Right
  local speedWeight = define.ClickTimeSpanMinWeight
  if ClickDirection.Right == lastClickDirection and data.lastClickTime < define.sequenceClickTimeSpan then
    speedWeight = _math_lerp(define.ClickTimeSpanMaxWeight, define.ClickTimeSpanMinWeight, data.lastClickTime / define.sequenceClickTimeSpan)
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

    data.lastClickDirection = ClickDirection.None
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  data.currentSpeed = data.currentSpeed + speedWeight
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

  data.lastClickTime = 0
  _RButton_R:ResetVertexAni()
  _RButton_R:SetVertexAniRun("Ani_Color_Right", true)
end

MiniGame_Gradient_KeyPress = function(keyType)
  -- function num : 0_5 , upvalues : isGradientPlay, MGKT, Panel_Minigame_Gradient_GaugeMove_Left, Panel_Minigame_Gradient_GaugeMove_Right
  if not isGradientPlay then
    return 
  end
  if MGKT.MiniGameKeyType_M0 == keyType then
    Panel_Minigame_Gradient_GaugeMove_Left()
  else
    if MGKT.MiniGameKeyType_M1 == keyType then
      Panel_Minigame_Gradient_GaugeMove_Right()
    end
  end
end

registerEvent("EventActionMiniGameKeyDownOnce", "MiniGame_Gradient_KeyPress")

