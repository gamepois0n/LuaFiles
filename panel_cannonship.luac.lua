-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\panel_cannonship.luac 

-- params : ...
-- function num : 0
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_VT = CppEnums.VehicleType
Panel_CannonShip:SetShow(false, false)
Panel_CannonShip:RegisterShowEventFunc(true, "CannonShipShowAni()")
Panel_CannonShip:RegisterShowEventFunc(false, "CannonShipHideAni()")
Panel_CannonShip_Value_IsCannon = false
local progresssBG = (UI.getChildControl)(Panel_CannonShip, "Cannon_ProgresssBG")
local progresss = (UI.getChildControl)(Panel_CannonShip, "Progress2_1")
local progresss_Head = (UI.getChildControl)(progresss, "Progress2_1_Bar_Head")
local shootCount = (UI.getChildControl)(Panel_CannonShip, "StaticText_ShootCount")
local vehicle_actorKeyRaw = 0
local fireGuide = {fireGuide_BG = (UI.getChildControl)(Panel_CannonShip, "Static_CommandBG"), fireGuide_KeyShift1 = (UI.getChildControl)(Panel_CannonShip, "StaticText_Key_Shift1"), fireGuide_KeyShift2 = (UI.getChildControl)(Panel_CannonShip, "StaticText_Key_Shift2"), fireGuide_KeyShift3 = (UI.getChildControl)(Panel_CannonShip, "StaticText_Key_Shift3"), fireGuide_KeyShift4 = (UI.getChildControl)(Panel_CannonShip, "StaticText_Key_Shift4"), fireGuide_KeyW = (UI.getChildControl)(Panel_CannonShip, "StaticText_Key_W"), fireGuide_KeyS = (UI.getChildControl)(Panel_CannonShip, "StaticText_Key_S"), fireGuide_MouseL = (UI.getChildControl)(Panel_CannonShip, "Static_Key_MouseL_0"), fireGuide_MouseR = (UI.getChildControl)(Panel_CannonShip, "Static_Key_MouseR_0"), fireGuide_Space = (UI.getChildControl)(Panel_CannonShip, "StaticText_Key_Space"), fireGuide_Text_Ready = (UI.getChildControl)(Panel_CannonShip, "StaticText_Ready"), fireGuide_Text_High = (UI.getChildControl)(Panel_CannonShip, "StaticText_HighAngle"), fireGuide_Text_Low = (UI.getChildControl)(Panel_CannonShip, "StaticText_LowAngle"), fireGuide_Text_Fire = (UI.getChildControl)(Panel_CannonShip, "StaticText_Fire")}
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_KeyShift1)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_KeyShift2)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_KeyShift3)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_KeyShift4)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_KeyW)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_KeyS)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_MouseL)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_MouseR)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_Space)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_Text_Ready)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_Text_High)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_Text_Low)
;
(fireGuide.fireGuide_BG):AddChild(fireGuide.fireGuide_Text_Fire)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_KeyShift1)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_KeyShift2)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_KeyShift3)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_KeyShift4)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_KeyW)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_KeyS)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_MouseL)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_MouseR)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_Space)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_Text_Ready)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_Text_High)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_Text_Low)
Panel_CannonShip:RemoveControl(fireGuide.fireGuide_Text_Fire)
CannonShipShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_CannonShip:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.05)
  aniInfo1.AxisX = Panel_CannonShip:GetSizeX() / 2
  aniInfo1.AxisY = Panel_CannonShip:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_CannonShip:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.05)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_CannonShip:GetSizeX() / 2
  aniInfo2.AxisY = Panel_CannonShip:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

CannonShipHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_CannonShip:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_CannonShip:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local CannonShip_Initialize = function()
  -- function num : 0_2 , upvalues : progresssBG, progresss, progresss_Head, fireGuide
  Panel_CannonShip:SetPosX(getScreenSizeX() / 2 - Panel_CannonShip:GetSizeX() / 2 - 240)
  Panel_CannonShip:SetPosY(getScreenSizeY() / 2)
  progresssBG:SetShow(false)
  progresss:SetShow(false)
  progresss:SetProgressRate(100)
  progresss:SetCurrentProgressRate(100)
  progresss_Head:SetShow(false)
  progresss:SetAniSpeed(0)
  ;
  (fireGuide.fireGuide_BG):SetPosX(Panel_CannonShip:GetSizeX() / 2 + 400)
  ;
  (fireGuide.fireGuide_KeyShift1):SetPosX(10)
  ;
  (fireGuide.fireGuide_KeyShift2):SetPosX(10)
  ;
  (fireGuide.fireGuide_KeyShift3):SetPosX(10)
  ;
  (fireGuide.fireGuide_KeyShift4):SetPosX(10)
  ;
  (fireGuide.fireGuide_KeyW):SetPosX(65)
  ;
  (fireGuide.fireGuide_KeyS):SetPosX(65)
  ;
  (fireGuide.fireGuide_MouseL):SetPosX(65)
  ;
  (fireGuide.fireGuide_MouseR):SetPosX(81)
  ;
  (fireGuide.fireGuide_Text_Ready):SetPosX(70)
  ;
  (fireGuide.fireGuide_Text_High):SetPosX(100)
  ;
  (fireGuide.fireGuide_Text_Low):SetPosX(100)
  ;
  (fireGuide.fireGuide_Text_Fire):SetPosX(112)
  ;
  (fireGuide.fireGuide_KeyShift1):SetFontColor(4294312447)
  ;
  (fireGuide.fireGuide_KeyShift2):SetFontColor(4294312447)
  ;
  (fireGuide.fireGuide_KeyShift3):SetFontColor(4294312447)
  ;
  (fireGuide.fireGuide_KeyShift4):SetFontColor(4294312447)
  ;
  (fireGuide.fireGuide_KeyW):SetFontColor(4294312447)
  ;
  (fireGuide.fireGuide_KeyS):SetFontColor(4294312447)
end

CannonShip_GuideShow = function(show, showType)
  -- function num : 0_3 , upvalues : fireGuide
  if show == (fireGuide.fireGuide_BG):GetShow() then
    return 
  end
  for _,value in pairs(fireGuide) do
    value:SetShow(false)
  end
  ;
  (fireGuide.fireGuide_BG):SetSize(185, 145)
  if showType == 0 then
    (fireGuide.fireGuide_BG):SetSize(185, 145)
    ;
    (fireGuide.fireGuide_KeyW):SetPosY(10)
    ;
    (fireGuide.fireGuide_KeyS):SetPosY(40)
    ;
    (fireGuide.fireGuide_Text_High):SetPosY(40)
    ;
    (fireGuide.fireGuide_Text_Low):SetPosY(10)
    ;
    (fireGuide.fireGuide_Text_Ready):SetPosY(80)
    ;
    (fireGuide.fireGuide_Text_Fire):SetPosY(113)
    ;
    (fireGuide.fireGuide_KeyShift1):SetPosX(10)
    ;
    (fireGuide.fireGuide_KeyShift2):SetPosX(10)
    ;
    (fireGuide.fireGuide_KeyShift3):SetPosX(10)
    ;
    (fireGuide.fireGuide_KeyShift4):SetPosX(10)
    ;
    (fireGuide.fireGuide_KeyW):SetPosX(65)
    ;
    (fireGuide.fireGuide_KeyS):SetPosX(65)
    ;
    (fireGuide.fireGuide_MouseL):SetPosX(65)
    ;
    (fireGuide.fireGuide_MouseR):SetPosX(81)
    ;
    (fireGuide.fireGuide_Text_Ready):SetPosX(70)
    ;
    (fireGuide.fireGuide_Text_High):SetPosX(100)
    ;
    (fireGuide.fireGuide_Text_Low):SetPosX(100)
    ;
    (fireGuide.fireGuide_Text_Fire):SetPosX(112)
    ;
    (fireGuide.fireGuide_BG):SetShow(show)
    ;
    (fireGuide.fireGuide_KeyShift1):SetShow(show)
    ;
    (fireGuide.fireGuide_KeyShift2):SetShow(show)
    ;
    (fireGuide.fireGuide_KeyShift3):SetShow(show)
    ;
    (fireGuide.fireGuide_KeyShift4):SetShow(show)
    ;
    (fireGuide.fireGuide_KeyW):SetShow(show)
    ;
    (fireGuide.fireGuide_KeyS):SetShow(show)
    ;
    (fireGuide.fireGuide_MouseL):SetShow(show)
    ;
    (fireGuide.fireGuide_MouseR):SetShow(show)
    ;
    (fireGuide.fireGuide_Text_Ready):SetShow(show)
    ;
    (fireGuide.fireGuide_Text_High):SetShow(show)
    ;
    (fireGuide.fireGuide_Text_Low):SetShow(show)
    ;
    (fireGuide.fireGuide_Text_Fire):SetShow(show)
  else
    if showType == 1 then
      (fireGuide.fireGuide_BG):SetSize(185, 100)
      ;
      (fireGuide.fireGuide_KeyW):SetPosY(5)
      ;
      (fireGuide.fireGuide_KeyS):SetPosY(35)
      ;
      (fireGuide.fireGuide_Text_High):SetPosY(5)
      ;
      (fireGuide.fireGuide_Text_Low):SetPosY(35)
      ;
      (fireGuide.fireGuide_Space):SetPosY(65)
      ;
      (fireGuide.fireGuide_Text_Fire):SetPosY(65)
      ;
      (fireGuide.fireGuide_KeyW):SetPosX(10)
      ;
      (fireGuide.fireGuide_KeyS):SetPosX(10)
      ;
      (fireGuide.fireGuide_Text_High):SetPosX(65)
      ;
      (fireGuide.fireGuide_Text_Low):SetPosX(65)
      ;
      (fireGuide.fireGuide_Space):SetPosX(10)
      ;
      (fireGuide.fireGuide_Text_Fire):SetPosX(65)
      ;
      (fireGuide.fireGuide_BG):SetShow(show)
      ;
      (fireGuide.fireGuide_KeyW):SetShow(show)
      ;
      (fireGuide.fireGuide_KeyS):SetShow(show)
      ;
      (fireGuide.fireGuide_Space):SetShow(show)
      ;
      (fireGuide.fireGuide_Text_High):SetShow(show)
      ;
      (fireGuide.fireGuide_Text_Low):SetShow(show)
      ;
      (fireGuide.fireGuide_Text_Fire):SetShow(show)
    else
      if showType == 2 then
        (fireGuide.fireGuide_BG):SetSize(185, 38)
        ;
        (fireGuide.fireGuide_Space):SetPosY(5)
        ;
        (fireGuide.fireGuide_Space):SetPosX(10)
        ;
        (fireGuide.fireGuide_Text_Fire):SetPosY(6)
        ;
        (fireGuide.fireGuide_Text_Fire):SetPosX(85)
        ;
        (fireGuide.fireGuide_BG):SetShow(show)
        ;
        (fireGuide.fireGuide_Space):SetShow(show)
        ;
        (fireGuide.fireGuide_Text_Fire):SetShow(show)
      end
    end
  end
end

CannonShip_Show = function(actorKeyRaw)
  -- function num : 0_4 , upvalues : progresssBG, progresss, progresss_Head
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local seatPosition = (selfPlayer:get()):getVehicleSeatIndex()
  local isVehicleType = ((getVehicleActor(actorKeyRaw)):get()):getVehicleType()
  -- DECOMPILER ERROR at PC47: Unhandled construct in 'MakeBoolean' P1

  if ((CppEnums.VehicleType).Type_SailingBoat == isVehicleType or (CppEnums.VehicleType).Type_PersonalBattleShip == isVehicleType or (CppEnums.VehicleType).Type_PersonTradeShip == isVehicleType) and seatPosition ~= 0 and seatPosition ~= 13 and seatPosition ~= 4 and seatPosition ~= 3 and seatPosition ~= 1 and seatPosition ~= 2 then
    Panel_CannonShip:SetShow(true, true)
    progresssBG:SetShow(true)
    progresss:SetShow(true)
    progresss_Head:SetShow(true)
    CannonShip_GuideShow(true, 0)
  end
  do return  end
end

CannonShip_Full = function()
  -- function num : 0_5 , upvalues : progresss
  if not Panel_Stamina:GetShow() then
    FGlobal_CannonGauge_Open()
  end
  progresss:SetProgressRate(100)
end

CannonShip_Hide = function()
  -- function num : 0_6
  if not Panel_CannonShip:GetShow() then
    return 
  end
  CannonShip_GuideShow(false)
  Panel_CannonShip:SetShow(false, false)
  FGlobal_CannonGauge_Close()
  Panel_CannonShip_Value_IsCannon = false
end

CannonShip_AfterFire = function()
  -- function num : 0_7 , upvalues : progresss
  if Panel_CannonGauge:GetShow() then
    FGlobal_CannonGauge_Close()
  end
  progresss:SetProgressRate(0)
end

CannonShip_OneThird = function()
  -- function num : 0_8 , upvalues : progresss
  progresss:SetProgressRate(33)
end

CannonShip_TwoThird = function()
  -- function num : 0_9 , upvalues : progresss
  progresss:SetProgressRate(66)
end

CannonShip_HideGauge = function()
  -- function num : 0_10
  if Panel_CannonGauge:GetShow() then
    FGlobal_CannonGauge_Close()
  end
end

FromClient_UpdateCannonShipBallCount = function(count, VehicleTpye)
  -- function num : 0_11 , upvalues : UI_VT, shootCount
  if UI_VT.Type_SailingBoat ~= VehicleTpye and UI_VT.Type_PersonalBattleShip ~= VehicleTpye and UI_VT.Type_PersonTradeShip ~= VehicleTpye then
    return 
  end
  local shootCountValue = Int64toInt32(count)
  shootCount:SetShow(true)
  shootCount:SetText(shootCountValue)
  shootCount:SetPosY(180)
end

CannonShip_Initialize()
registerEvent("EventSelfPlayerRideOn", "CannonShip_Show")
registerEvent("EventSelfPlayerRideOff", "CannonShip_Hide")
registerEvent("FromClient_UpdateCannonBallCount", "FromClient_UpdateCannonShipBallCount")
ActionChartEventBindFunction(300, CannonShip_Full)
ActionChartEventBindFunction(301, CannonShip_AfterFire)
ActionChartEventBindFunction(302, CannonShip_OneThird)
ActionChartEventBindFunction(303, CannonShip_TwoThird)
ActionChartEventBindFunction(304, CannonShip_HideGauge)

