-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_steeringgear.luac 

-- params : ...
-- function num : 0
Panel_SteeringWheel:SetShow(false, false)
local MGKT = CppEnums.MiniGameKeyType
local purposeText = (UI.getChildControl)(Panel_SteeringWheel, "StaticText_Purpose")
local _LButton_L = (UI.getChildControl)(Panel_SteeringWheel, "Static_L_Btn_L")
local _RButton_R = (UI.getChildControl)(Panel_SteeringWheel, "Static_R_Btn_R")
local _marble = (UI.getChildControl)(Panel_SteeringWheel, "Static_Marble")
local _fontGood = (UI.getChildControl)(Panel_SteeringWheel, "Static_Result_Good")
local _fontBad = (UI.getChildControl)(Panel_SteeringWheel, "Static_Result_Bad")
local _math_random = math.random
local _math_randomseed = math.randomseed
local _math_lerp = (Util.Math).Lerp
local ClickDirection = {None = 0, Left = -1, Right = 1, baseX = 141, baseY = 154, startX = 40, startY = 66}
local vector = 1
local speed = 0.5
local isSteering = false
local deltaTime = 0
local isSuccess = true
MiniGame_SteeringWhellMoveCalc = function(fDeltaTime)
  -- function num : 0_0 , upvalues : isSteering, deltaTime, purposeText, ClickDirection, isSuccess, speed, vector, _marble
  if not isSteering then
    return 
  end
  deltaTime = deltaTime + fDeltaTime
  if deltaTime < 3 then
    purposeText:SetText("이상기류�\188 만났습니�\164. 서둘�\172 조타륜을 잡아주세�\148!(" .. (math.ceil)(3 - deltaTime) .. " �\136)")
    return 
  end
  if ClickDirection.startX < 38 or ClickDirection.startX > 243 then
    purposeText:SetText("실패")
    isSteering = false
    isSuccess = false
    return 
  end
  if deltaTime > 8 and isSuccess then
    purposeText:SetText("이상기류�\188 무사�\136 헤쳐나갔습니�\164.")
    if deltaTime > 9.1 then
      isSteering = false
    end
    return 
  end
  speed = speed * 1.01
  purposeText:SetText("시작")
  local posX = (ClickDirection.startX - ClickDirection.baseX) * (math.cos)(fDeltaTime * vector * speed) - (ClickDirection.startY - ClickDirection.baseY) * (math.sin)(fDeltaTime * vector * speed) + ClickDirection.baseX
  local posY = (ClickDirection.startX - ClickDirection.baseX) * (math.sin)(fDeltaTime * vector * speed) + (ClickDirection.startY - ClickDirection.baseY) * (math.cos)(fDeltaTime * vector * speed) + ClickDirection.baseY
  -- DECOMPILER ERROR at PC123: Confused about usage of register: R3 in 'UnsetPending'

  ClickDirection.startX = posX
  -- DECOMPILER ERROR at PC125: Confused about usage of register: R3 in 'UnsetPending'

  ClickDirection.startY = posY
  _marble:SetPosX(ClickDirection.startX - 21)
  _marble:SetPosY(ClickDirection.startY - 21)
end

Panel_Minigame_SteeringWheel_Init = function()
  -- function num : 0_1 , upvalues : speed, ClickDirection, deltaTime, isSuccess
  speed = 0.5
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  ClickDirection.startX = 40
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  ClickDirection.startY = 66
  deltaTime = 0
  isSuccess = true
end

Panel_Minigame_SteeringWheel_Start = function()
  -- function num : 0_2 , upvalues : ClickDirection, _marble, vector, purposeText, isSteering
  Panel_Minigame_SteeringWheel_Init()
  local randomAngle = (math.random)(0, 45) + 22.5
  local randomRadian = (math.rad)(randomAngle)
  local posX = (ClickDirection.startX - ClickDirection.baseX) * (math.cos)(randomRadian) - (ClickDirection.startY - ClickDirection.baseY) * (math.sin)(randomRadian) + ClickDirection.baseX
  local posY = (ClickDirection.startX - ClickDirection.baseX) * (math.sin)(randomRadian) + (ClickDirection.startY - ClickDirection.baseY) * (math.cos)(randomRadian) + ClickDirection.baseY
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R4 in 'UnsetPending'

  ClickDirection.startX = posX
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R4 in 'UnsetPending'

  ClickDirection.startY = posY
  _marble:SetPosX(ClickDirection.startX - 21)
  _marble:SetPosY(ClickDirection.startY - 21)
  if randomAngle > 45 then
    vector = -1
  else
    vector = 1
  end
  purposeText:SetText("시작")
  isSteering = true
  Panel_SteeringWheel:SetShow(true, true)
  Panel_SteeringWheel:RegisterUpdateFunc("Panel_Minigame_UpdateFunc")
end

Panel_Minigame_SteeringWheel_End = function()
  -- function num : 0_3 , upvalues : isSuccess
  if isSuccess then
    ((getSelfPlayer()):get()):SetMiniGameResult(0)
  else
    ;
    ((getSelfPlayer()):get()):SetMiniGameResult(1)
  end
  Panel_SteeringWheel:RegisterUpdateFunc("")
  Panel_SteeringWheel:SetShow(false, false)
end

local Panel_Minigame_SteeringWheel_GaugeMove_Left = function()
  -- function num : 0_4 , upvalues : vector, speed, _LButton_L
  local randomSpeed = ((math.random)(0, 3) + 1) / 10
  if vector > 0 then
    if speed < randomSpeed then
      speed = (math.max)(randomSpeed - speed, 0.1)
      vector = -1
    else
      speed = (math.max)(speed - randomSpeed, 0.1)
    end
  else
    speed = speed + randomSpeed
  end
  _LButton_L:ResetVertexAni()
  _LButton_L:SetVertexAniRun("Ani_Color_Left", true)
end

local Panel_Minigame_SteeringWheel_GaugeMove_Right = function()
  -- function num : 0_5 , upvalues : vector, speed, _RButton_R
  local randomSpeed = ((math.random)(0, 3) + 1) / 10
  if vector < 0 then
    if speed < randomSpeed then
      speed = (math.max)(randomSpeed - speed, 0.1)
      vector = 1
    else
      speed = (math.max)(speed - randomSpeed, 0.1)
    end
  else
    speed = speed + randomSpeed
  end
  _RButton_R:ResetVertexAni()
  _RButton_R:SetVertexAniRun("Ani_Color_Right", true)
end

MiniGame_SteeringWheel_KeyPress = function(keyType)
  -- function num : 0_6 , upvalues : isSteering, MGKT, Panel_Minigame_SteeringWheel_GaugeMove_Left, Panel_Minigame_SteeringWheel_GaugeMove_Right
  if not isSteering then
    return 
  end
  if MGKT.MiniGameKeyType_M0 == keyType then
    Panel_Minigame_SteeringWheel_GaugeMove_Left()
  else
    if MGKT.MiniGameKeyType_M1 == keyType then
      Panel_Minigame_SteeringWheel_GaugeMove_Right()
    end
  end
end

registerEvent("EventActionMiniGameKeyDownOnce", "MiniGame_SteeringWheel_KeyPress")

