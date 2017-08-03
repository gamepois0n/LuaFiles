-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_battlegauge.luac 

-- params : ...
-- function num : 0
local MGKT = CppEnums.MiniGameKeyType
local UIColor = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
Panel_BattleGauge:SetShow(false, false)
local ui = {_battleGauge_BG = (UI.getChildControl)(Panel_BattleGauge, "Static_GaugeBG"), _enemyGauge = (UI.getChildControl)(Panel_BattleGauge, "Progress2_EnemyGauge"), _myGauge = (UI.getChildControl)(Panel_BattleGauge, "Progress2_MyGauge"), _spaceBar = (UI.getChildControl)(Panel_BattleGauge, "Static_SpaceBar"), _spaceBarEff = (UI.getChildControl)(Panel_BattleGauge, "Static_SpaceBar_Eff"), _middleLine = (UI.getChildControl)(Panel_BattleGauge, "Static_MiddleLine"), _pushGong = (UI.getChildControl)(Panel_BattleGauge, "Static_Gong"), _text_TitleText = (UI.getChildControl)(Panel_BattleGauge, "StaticText_TitleText"), _text_RemainTime = (UI.getChildControl)(Panel_BattleGauge, "StaticText_RemainTimeText"), _text_Timer = (UI.getChildControl)(Panel_BattleGauge, "StaticText_Timer"), _result_Win = (UI.getChildControl)(Panel_BattleGauge, "Static_Result_Win"), _result_Lose = (UI.getChildControl)(Panel_BattleGauge, "Static_Result_Lose"), _result_Human = (UI.getChildControl)(Panel_BattleGauge, "Static_Human"), _result_Horse = (UI.getChildControl)(Panel_BattleGauge, "Static_Horse")}
local _enemyGauge_Head = (UI.getChildControl)(ui._enemyGauge, "Progress2_EnemyBar_Head")
local _myGauge_Head = (UI.getChildControl)(ui._myGauge, "Progress2_MyBar_Head")
local ballGroup = {}
local ball_Index = 1
local sumDeltaTime = 0
local currentPercent = 50
local remainTime = 11
local init = function()
  -- function num : 0_0 , upvalues : UCT, ui, ballGroup
  registerEvent("onScreenResize", "BattleGauge_RePosition")
  registerEvent("EventActionMiniGameKeyDownOnce", "Panel_Minigame_SpaceBar")
  Panel_BattleGauge:RegisterUpdateFunc("BattleGauge_UpdatePerFrame")
  BattleGauge_RePosition()
  for k = 1, 50 do
    local ball = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, ui._myGauge, "ball_" .. tostring(k))
    CopyBaseProperty(ui._pushGong, ball)
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R5 in 'UnsetPending'

    ballGroup[k] = ball
    ball:SetPosY(4)
  end
end

BattleGauge_RePosition = function()
  -- function num : 0_1
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  Panel_BattleGauge:SetPosX(screenX / 2 - 135.5)
  Panel_BattleGauge:SetPosY(scrY / 2 - 250)
end

local setProgress = function(isSetProgress)
  -- function num : 0_2 , upvalues : currentPercent, ui
  if currentPercent < 0 then
    currentPercent = 0
  else
    if currentPercent > 100 then
      currentPercent = 100
    end
  end
  ;
  (ui._myGauge):SetProgressRate(currentPercent)
  ;
  (ui._enemyGauge):SetProgressRate(100 - currentPercent)
  if isSetProgress then
    (ui._myGauge):SetCurrentProgressRate(currentPercent)
    ;
    (ui._enemyGauge):SetCurrentProgressRate(100 - currentPercent)
  end
end

Panel_Minigame_BattleGauge_Start = function()
  -- function num : 0_3 , upvalues : ui, remainTime, currentPercent, setProgress, _myGauge_Head
  (ui._middleLine):AddEffect("fUI_Repair01B", true, 0, 0)
  remainTime = 11
  Panel_BattleGauge:SetShow(true)
  currentPercent = 50
  setProgress(true)
  ;
  (ui._myGauge):EraseAllEffect()
  _myGauge_Head:EraseAllEffect()
end

BattleGauge_UpdateGauge = function(deltaTime)
  -- function num : 0_4 , upvalues : currentPercent, setProgress, ui, _myGauge_Head, ballGroup, ball_Index
  currentPercent = currentPercent + 6
  setProgress(false)
  ;
  (ui._spaceBar):ResetVertexAni()
  ;
  (ui._spaceBarEff):ResetVertexAni()
  ;
  (ui._myGauge):ResetVertexAni()
  ;
  (ui._spaceBar):SetVertexAniRun("Ani_Color_Space", true)
  ;
  (ui._spaceBarEff):SetVertexAniRun("Ani_Color_SpaceEff", true)
  ;
  (ui._myGauge):SetVertexAniRun("Ani_Color_myGaugeEff", true)
  if currentPercent >= 51 then
    (ui._result_Human):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Instance/MiniGame_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(ui._result_Human, 23, 48, 43, 68)
    ;
    ((ui._result_Human):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (ui._result_Human):setRenderTexture((ui._result_Human):getBaseTexture())
    ;
    (ui._result_Human):SetVertexAniRun("Ani_Scale_Winner", true)
    _myGauge_Head:EraseAllEffect()
    _myGauge_Head:AddEffect("fUI_Repair01B", true, 0, 0)
    ;
    (ui._result_Horse):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Instance/MiniGame_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(ui._result_Horse, 44, 69, 64, 92)
    ;
    ((ui._result_Horse):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (ui._result_Horse):setRenderTexture((ui._result_Horse):getBaseTexture())
    ;
    (ui._result_Horse):ResetVertexAni()
    ;
    (ui._result_Horse):SetScale(1, 1)
  else
    do
      if currentPercent <= 50 then
        (ui._result_Human):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Instance/MiniGame_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(ui._result_Human, 44, 48, 64, 68)
        ;
        ((ui._result_Human):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (ui._result_Human):setRenderTexture((ui._result_Human):getBaseTexture())
        ;
        (ui._result_Human):ResetVertexAni()
        ;
        (ui._result_Human):SetScale(1, 1)
        _myGauge_Head:EraseAllEffect()
        _myGauge_Head:AddEffect("fUI_Repair01B", true, 0, 0)
        ;
        (ui._result_Horse):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Instance/MiniGame_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(ui._result_Horse, 23, 69, 43, 92)
        ;
        ((ui._result_Horse):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (ui._result_Horse):setRenderTexture((ui._result_Horse):getBaseTexture())
        ;
        (ui._result_Horse):SetVertexAniRun("Ani_Scale_Winner", true)
      end
      do
        ;
        (ballGroup[ball_Index]):SetShow(true)
        ;
        (ballGroup[ball_Index]):SetPosX(0)
        ball_Index = ball_Index + 1
        if ball_Index > 50 then
          ball_Index = 1
        end
      end
    end
  end
end

BattleGauge_UpdatePerFrame = function(deltaTime)
  -- function num : 0_5 , upvalues : sumDeltaTime, currentPercent, setProgress, _myGauge_Head, ui
  sumDeltaTime = sumDeltaTime + deltaTime * 35
  local number, underZero = (math.modf)(sumDeltaTime)
  sumDeltaTime = underZero
  currentPercent = currentPercent - number
  setProgress(false)
  BattleGauge_EndTimer(deltaTime)
  BattleGauge_BallUpdate(deltaTime)
  _myGauge_Head:AddEffect("fUI_Repair01B", true, 0, 0)
  if currentPercent >= 51 then
    (ui._result_Win):SetShow(true)
    ;
    (ui._result_Lose):SetShow(false)
  else
    if currentPercent <= 50 then
      (ui._result_Lose):SetShow(true)
      ;
      (ui._result_Win):SetShow(false)
    end
  end
end

BattleGauge_BallUpdate = function(deltaTime)
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

BattleGauge_EndTimer = function(deltaTime)
  -- function num : 0_7 , upvalues : remainTime, ui, currentPercent
  remainTime = remainTime - deltaTime
  local remainSec = (math.floor)(remainTime)
  if remainTime > 0 then
    (ui._text_Timer):SetText(remainSec .. PAGetString(Defines.StringSheet_GAME, "LUA_GLOBAL_TIME_SECOND"))
  else
    if remainTime <= 0 then
      if currentPercent >= 50 then
        audioPostEvent_SystemUi(11, 1)
        ;
        ((getSelfPlayer()):get()):SetMiniGameResult(0)
      else
        if currentPercent <= 50 then
          audioPostEvent_SystemUi(11, 2)
          ;
          ((getSelfPlayer()):get()):SetMiniGameResult(3)
        end
      end
      Panel_Minigame_BattleGauge_End()
    end
  end
end

Panel_Minigame_SpaceBar = function(keyType)
  -- function num : 0_8 , upvalues : MGKT
  if MGKT.MiniGameKeyType_Space == keyType then
    BattleGauge_UpdateGauge(deltaTime)
  end
end

BattleGauge_Result = function(timer)
  -- function num : 0_9
  local remainTime = timer
end

Panel_Minigame_BattleGauge_End = function()
  -- function num : 0_10
  Panel_BattleGauge:SetShow(false)
end

init()

