-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_singauge.luac 

-- params : ...
-- function num : 0
local MGKT = CppEnums.MiniGameKeyType
local UIColor = Defines.Color
Panel_SinGauge:SetShow(false, false)
local gameOptionActionKey = {Forward = 0, Back = 1, Left = 2, Right = 3, Attack = 4, SubAttack = 5, Dash = 6, Jump = 7}
local _math_random = math.random
local _math_randomSeed = math.randomseed
local _sinGaugeBG = (UI.getChildControl)(Panel_SinGauge, "Static_SinGaugeBG")
local _sinGaugeBar = (UI.getChildControl)(Panel_SinGauge, "Static_SinGauge")
local _sinGaugeBarEffect = (UI.getChildControl)(Panel_SinGauge, "Static_SinGaugeEffect")
local _spaceBar = (UI.getChildControl)(Panel_SinGauge, "Static_SpaceBar")
local _spaceBarEff = (UI.getChildControl)(Panel_SinGauge, "Static_SpaceBar_Eff")
local _sinGauge_Result_Perfect = (UI.getChildControl)(Panel_SinGauge, "Static_Result_Perfect")
local _sinGauge_Result_Good = (UI.getChildControl)(Panel_SinGauge, "Static_Result_Good")
local _sinGauge_Result_Bad = (UI.getChildControl)(Panel_SinGauge, "Static_Result_Bad")
local gaugeBarSizeX = 0
local gaugeIsGrowing = true
local checkGaugeCount = 0
local preTick = getTickCount32()
_sinGaugeBar:SetSize(0, 20)
local sinGaugeBarStart = false
local isFinished = true
local actionString = ""
if getGamePadEnable() then
  actionString = keyCustom_GetString_ActionPad(gameOptionActionKey.Jump)
else
  actionString = keyCustom_GetString_ActionKey(gameOptionActionKey.Jump)
end
_spaceBar:SetText(actionString)
SinGauge_RePosition = function()
  -- function num : 0_0
  screenX = getScreenSizeX()
  sizeX = Panel_SinGauge:GetSizeX() / 2
  Panel_SinGauge:SetPosX(screenX / 2 - sizeX)
  Panel_SinGauge:SetPosY(400)
end

local SinGaugeBar_OnFail = function()
  -- function num : 0_1 , upvalues : isFinished, _sinGauge_Result_Bad
  audioPostEvent_SystemUi(11, 7)
  isFinished = true
  Panel_SinGauge:RegisterUpdateFunc("")
  ;
  ((getSelfPlayer()):get()):SetMiniGameResult(0)
  _sinGauge_Result_Bad:ResetVertexAni()
  _sinGauge_Result_Bad:SetVertexAniRun("Bad_Ani", true)
  _sinGauge_Result_Bad:SetVertexAniRun("Bad_ScaleAni", true)
  _sinGauge_Result_Bad:SetVertexAniRun("Bad_AniEnd", true)
  _sinGauge_Result_Bad:SetShow(true)
end

local gaugeSpeed = 0.8
SinGaugeBar_UpdateGauge = function()
  -- function num : 0_2 , upvalues : preTick, gaugeSpeed, sinGaugeBarStart, gaugeBarSizeX, gaugeIsGrowing, _sinGaugeBar, checkGaugeCount, isFinished, SinGaugeBar_OnFail
  local currentTick = getTickCount32()
  local deltaTick = currentTick - preTick
  local deltaTime = deltaTick / 1000 * gaugeSpeed
  if sinGaugeBarStart == true then
    if gaugeBarSizeX >= 0 and gaugeIsGrowing == true and gaugeBarSizeX < 273 then
      gaugeBarSizeX = gaugeBarSizeX + (gaugeBarSizeX + 1) / 273 * 273 * 10 * deltaTime
      if gaugeBarSizeX > 273 then
        gaugeBarSizeX = 273
        gaugeIsGrowing = false
      end
      _sinGaugeBar:SetSize(gaugeBarSizeX, 20)
    else
      if gaugeIsGrowing == false and gaugeBarSizeX > 10 and checkGaugeCount < 5 then
        gaugeBarSizeX = gaugeBarSizeX - (gaugeBarSizeX + 1) / 273 * 273 * 2.5 * deltaTime
        if gaugeBarSizeX < 10 then
          gaugeBarSizeX = 10
          gaugeIsGrowing = true
          checkGaugeCount = checkGaugeCount + 1
        end
        _sinGaugeBar:SetSize(gaugeBarSizeX, 20)
      else
        if gaugeIsGrowing == true and gaugeBarSizeX >= 273 then
          gaugeIsGrowing = false
          gaugeBarSizeX = 273
        else
          if gaugeIsGrowing == false and gaugeBarSizeX <= 0 and checkGaugeCount < 5 then
            gaugeIsGrowing = true
            gaugeBarSizeX = 0
            checkGaugeCount = checkGaugeCount + 1
          end
        end
      end
    end
  end
  preTick = currentTick
  if checkGaugeCount == 3 then
    isFinished = true
    SinGaugeBar_OnFail()
  end
end

Panel_Minigame_SinGauge_Start = function()
  -- function num : 0_3 , upvalues : _math_randomSeed, gaugeSpeed, _math_random, isFinished, gaugeBarSizeX, _sinGaugeBar, _sinGaugeBarEffect, _sinGauge_Result_Bad, _sinGauge_Result_Good, _sinGauge_Result_Perfect, sinGaugeBarStart, checkGaugeCount, gaugeIsGrowing, preTick
  _math_randomSeed((os.time)())
  gaugeSpeed = 0.88 + _math_random(0, 200) / 1000 + ((getSelfPlayer()):get()):getFishGrade() * 0.03
  isFinished = false
  gaugeBarSizeX = 0
  _sinGaugeBar:SetSize(0, 20)
  _sinGaugeBarEffect:AddEffect("UI_Fishing_Aura01", false, 0, 0)
  Panel_SinGauge:SetShow(true, false)
  Panel_SinGauge:RegisterUpdateFunc("SinGaugeBar_UpdateGauge")
  _sinGauge_Result_Bad:SetShow(false)
  _sinGauge_Result_Good:SetShow(false)
  _sinGauge_Result_Perfect:SetShow(false)
  sinGaugeBarStart = true
  checkGaugeCount = 0
  gaugeIsGrowing = true
  preTick = getTickCount32()
end

Panel_Minigame_SinGauge_End = function()
  -- function num : 0_4 , upvalues : _sinGaugeBarEffect, isFinished, sinGaugeBarStart
  Panel_SinGauge:RegisterUpdateFunc("")
  Panel_SinGauge:SetShow(false, false)
  _sinGaugeBarEffect:EraseAllEffect()
  isFinished = true
  sinGaugeBarStart = false
end

MiniGame_SinGauge_KeyPress = function(keyType)
  -- function num : 0_5 , upvalues : isFinished, MGKT, _sinGaugeBar, gaugeBarSizeX, sinGaugeBarStart, _sinGauge_Result_Perfect, _sinGauge_Result_Good, SinGaugeBar_OnFail
  if isFinished then
    return 
  end
  if MGKT.MiniGameKeyType_Space == keyType then
    _sinGaugeBar:SetSize(gaugeBarSizeX, 20)
    sinGaugeBarStart = false
    Panel_SinGauge:RegisterUpdateFunc("")
    if gaugeBarSizeX == 273 then
      audioPostEvent_SystemUi(11, 0)
      audioPostEvent_SystemUi(11, 13)
      ;
      ((getSelfPlayer()):get()):SetMiniGameResult(3)
      isFinished = true
      _sinGauge_Result_Perfect:ResetVertexAni()
      _sinGauge_Result_Perfect:SetVertexAniRun("Perfect_Ani", true)
      _sinGauge_Result_Perfect:SetVertexAniRun("Perfect_ScaleAni", true)
      _sinGauge_Result_Perfect:SetVertexAniRun("Perfect_AniEnd", true)
      _sinGauge_Result_Perfect:SetShow(true)
    else
      if gaugeBarSizeX > 167 then
        audioPostEvent_SystemUi(11, 0)
        audioPostEvent_SystemUi(11, 13)
        ;
        ((getSelfPlayer()):get()):SetMiniGameResult(11)
        isFinished = true
        _sinGauge_Result_Good:ResetVertexAni()
        _sinGauge_Result_Good:SetVertexAniRun("Good_Ani", true)
        _sinGauge_Result_Good:SetVertexAniRun("Good_ScaleAni", true)
        _sinGauge_Result_Good:SetVertexAniRun("Good_AniEnd", true)
        _sinGauge_Result_Good:SetShow(true)
      else
        isFinished = true
        SinGaugeBar_OnFail()
      end
    end
  end
end

registerEvent("onScreenResize", "SinGauge_RePosition")
registerEvent("EventActionMiniGameKeyDownOnce", "MiniGame_SinGauge_KeyPress")
SinGauge_RePosition()

