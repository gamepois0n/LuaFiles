-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_gradienty.luac 

-- params : ...
-- function num : 0
Panel_MiniGame_Gradient_Y:SetShow(false, false)
local MGKT = CppEnums.MiniGameKeyType
local ui = {_keyUp = (UI.getChildControl)(Panel_MiniGame_Gradient_Y, "Static_Key_Up"), _keyDown = (UI.getChildControl)(Panel_MiniGame_Gradient_Y, "Static_Key_Down"), _keyUp_Eff = (UI.getChildControl)(Panel_MiniGame_Gradient_Y, "Static_Key_Up_Eff"), _keyDown_Eff = (UI.getChildControl)(Panel_MiniGame_Gradient_Y, "Static_Key_Down_Eff"), _gaugeBG = (UI.getChildControl)(Panel_MiniGame_Gradient_Y, "Static_GradientY_BG"), _gaugeCursor = (UI.getChildControl)(Panel_MiniGame_Gradient_Y, "Static_GradientY_Cur"), _fontGood = (UI.getChildControl)(Panel_MiniGame_Gradient_Y, "Static_Result_Good"), _fontBad = (UI.getChildControl)(Panel_MiniGame_Gradient_Y, "Static_Result_Bad")}
local KeyDirection = {None = 0, Up = -1, Down = 1}
local _math_random = math.random
local _math_randomseed = math.randomseed
local _math_lerp = (Util.Math).Lerp
local define = {sequenceClickTimeSpan = 1.1, ClickTimeSpanMaxWeight = 0.25, ClickTimeSpanMinWeight = 0.15, speedWeight = 5, gageSize = Panel_MiniGame_Gradient_Y:GetSizeY()}
;
(ui._gaugeCursor):SetPosX(-42)
local data = {currentPos = 0.5, lastClickTime = 0, lastKeyDirection = 0, currentSpeed = 0}
local isGradientYPlay = false
MiniGame_GaugeBarMoveCalcY = function(fDeltaTime)
  -- function num : 0_0 , upvalues : data, define, _math_lerp, ui
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  data.lastClickTime = data.lastClickTime + fDeltaTime
  local currentPos = data.currentPos + data.currentSpeed * fDeltaTime
  if currentPos < 0 then
    currentPos = 0
  else
    if currentPos > 1 then
      currentPos = 1
    end
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

  data.currentPos = currentPos
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

  data.currentSpeed = data.currentSpeed - (0.5 - currentPos) * define.speedWeight * fDeltaTime
  local controlPos = _math_lerp(7, 254, currentPos)
  -- DECOMPILER ERROR at PC48: Unhandled construct in 'MakeBoolean' P1

  if (controlPos < 58 or controlPos > 184) and (ui._fontBad):GetShow() == false then
    audioPostEvent_SystemUi(11, 2)
    ;
    (ui._fontBad):SetShow(true, true)
    ;
    (ui._fontGood):SetShow(false, true)
    ;
    (ui._fontBad):ResetVertexAni()
    ;
    (ui._fontBad):SetVertexAniRun("Bad_Ani", true)
    ;
    (ui._fontBad):SetVertexAniRun("Bad_ScaleAni", true)
    if controlPos < 58 then
      audioPostEvent_SystemUi(11, 2)
      ;
      ((getSelfPlayer()):get()):SetMiniGameResult(1)
    else
      if controlPos > 184 then
        audioPostEvent_SystemUi(11, 2)
        ;
        ((getSelfPlayer()):get()):SetMiniGameResult(2)
      end
    end
  end
  if (ui._fontGood):GetShow() == false then
    audioPostEvent_SystemUi(11, 1)
    ;
    (ui._fontBad):SetShow(false, true)
    ;
    (ui._fontGood):SetShow(true, true)
    ;
    (ui._fontGood):ResetVertexAni()
    ;
    (ui._fontGood):SetVertexAniRun("Good_Ani", true)
    ;
    (ui._fontGood):SetVertexAniRun("Good_ScaleAni", true)
  end
  ;
  (ui._gaugeCursor):SetPosY(controlPos)
end

Panel_Minigame_GradientY_Start = function()
  -- function num : 0_1 , upvalues : ui, _math_randomseed, _math_random, data, KeyDirection, isGradientYPlay
  Panel_MiniGame_Gradient_Y:SetShow(true, false)
  Panel_MiniGame_Gradient_Y:RegisterUpdateFunc("Panel_Minigame_UpdateFunc")
  ;
  (ui._keyUp_Eff):SetShow(false)
  ;
  (ui._keyDown_Eff):SetShow(false)
  ;
  (ui._gaugeCursor):SetPosY(centerPos)
  _math_randomseed((os.time)())
  local speed = _math_random()
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

  data.currentSpeed = (speed - 0.35) / 1.6
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  data.lastKeyDirection = KeyDirection.None
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

  data.lastClickTime = 0
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

  data.currentPos = 0.5
  isGradientYPlay = true
end

Panel_Minigame_GradientY_End = function()
  -- function num : 0_2 , upvalues : isGradientYPlay
  Panel_MiniGame_Gradient_Y:RegisterUpdateFunc("")
  Panel_MiniGame_Gradient_Y:SetShow(false, false)
  isGradientYPlay = false
end

local Panel_Minigame_GradientY_GaugeMove_Up = function()
  -- function num : 0_3 , upvalues : data, KeyDirection, define, _math_lerp, ui
  local lastKeyDirection = data.lastKeyDirection
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  data.lastKeyDirection = KeyDirection.Up
  local speedWeight = define.ClickTimeSpanMinWeight
  if KeyDirection.Up == lastKeyDirection and data.lastClickTime < define.sequenceClickTimeSpan then
    speedWeight = _math_lerp(define.ClickTimeSpanMaxWeight, define.ClickTimeSpanMinWeight, data.lastClickTime / define.sequenceClickTimeSpan)
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

    data.lastKeyDirection = KeyDirection.None
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  data.currentSpeed = data.currentSpeed - speedWeight
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

  data.lastClickTime = 0
  ;
  (ui._keyUp):ResetVertexAni()
  ;
  (ui._keyUp):SetVertexAniRun("Ani_Color_Up", true)
  ;
  (ui._keyUp_Eff):SetShow(true)
  ;
  (ui._keyUp_Eff):ResetVertexAni()
  ;
  (ui._keyUp_Eff):SetVertexAniRun("Ani_Color_UpEff", true)
end

local Panel_Minigame_GradientY_GaugeMove_Down = function()
  -- function num : 0_4 , upvalues : data, KeyDirection, define, _math_lerp, ui
  local lastKeyDirection = data.lastKeyDirection
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  data.lastKeyDirection = KeyDirection.Down
  local speedWeight = define.ClickTimeSpanMinWeight
  if KeyDirection.Down == lastKeyDirection and data.lastClickTime < define.sequenceClickTimeSpan then
    speedWeight = _math_lerp(define.ClickTimeSpanMaxWeight, define.ClickTimeSpanMinWeight, data.lastClickTime / define.sequenceClickTimeSpan)
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

    data.lastKeyDirection = KeyDirection.None
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  data.currentSpeed = data.currentSpeed + speedWeight
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

  data.lastClickTime = 0
  ;
  (ui._keyDown):ResetVertexAni()
  ;
  (ui._keyDown):SetVertexAniRun("Ani_Color_Down", true)
  ;
  (ui._keyDown_Eff):SetShow(true)
  ;
  (ui._keyDown_Eff):ResetVertexAni()
  ;
  (ui._keyDown_Eff):SetVertexAniRun("Ani_Color_DownEff", true)
end

MiniGame_GradientY_KeyPress = function(keyType)
  -- function num : 0_5 , upvalues : isGradientYPlay, MGKT, Panel_Minigame_GradientY_GaugeMove_Up, Panel_Minigame_GradientY_GaugeMove_Down
  if not isGradientYPlay then
    return 
  end
  if MGKT.MiniGameKeyType_W == keyType then
    Panel_Minigame_GradientY_GaugeMove_Up()
  else
    if MGKT.MiniGameKeyType_S == keyType then
      Panel_Minigame_GradientY_GaugeMove_Down()
    end
  end
end

registerEvent("EventActionMiniGameKeyDownOnce", "MiniGame_GradientY_KeyPress")

