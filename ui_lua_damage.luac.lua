-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\damage\ui_lua_damage.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_AV = CppEnums.PA_UI_ALIGNVERTICAL
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local RED_A0 = (Defines.Color).C_00FF0000
local RED_A1 = (Defines.Color).C_FFFF0000
local WHITE_A0 = (Defines.Color).C_00FFFFFF
local WHITE_A1 = (Defines.Color).C_FFFFFFFF
local GREEN_A0 = (Defines.Color).C_00B5FF6D
local GREEN_A1 = (Defines.Color).C_FFB5FF6D
local SKY_BLUE_A0 = (Defines.Color).C_006DC6FF
local SKY_BLUE_A1 = (Defines.Color).C_FF6DC6FF
local LIGHT_ORANGE_A0 = (Defines.Color).C_00FFD46D
local LIGHT_ORANGE_A1 = (Defines.Color).C_FFFFD46D
local ORANGE_A0 = (Defines.Color).C_00FFAB6D
local ORANGE_A1 = (Defines.Color).C_FFFFAB6D
local ORANGE_B0 = (Defines.Color).C_00FF4729
local ORANGE_B1 = (Defines.Color).C_FFFF4729
local PURPLE_A0 = (Defines.Color).C_00B75EDD
local PURPLE_A1 = (Defines.Color).C_FFB75EDD
local uiGruopValue = (Defines.UIGroup).PAGameUIGroup_ScreenEffect
local OPT = CppEnums.OtherListType
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_AH = CppEnums.PA_UI_ALIGNHORIZON
local DamagePanel = {}
local DamagePanel_Index = 1
local DamagePanel_Count = 20
local isShowAttackEffect = ToClient_getRenderHitEffect()
local effectControlSetting = {
{_name = "Critical"}
, 
{_name = "Block"}
, 
{_name = "Guard"}
, 
{_name = "Immune"}
, 
{_name = "Miss"}
, 
{_name = "Exp"}
, 
{_name = "BackAttack"}
, 
{_name = "CounterAttack"}
, 
{_name = "DownAttack"}
, 
{_name = "SpeedAttack"}
, 
{_name = "SkillPoint"}
, 
{_name = "AirAttack"}
, 
{_name = "KindDamage"}
; 
[93] = {_name = "Static_Wp"}
, 
[94] = {_name = "Static_Plus"}
, 
[95] = {_name = "Static_Minus"}
, 
[96] = {_name = "Static_Karma"}
, 
[97] = {_name = "Static_Intimacy"}
, 
[99] = {_name = "Contribute"}
}
local UpdatePanel = nil
local createUIData = function()
  -- function num : 0_0 , upvalues : effectControlSetting
  for key,value in pairs(effectControlSetting) do
    local control = (UI.getChildControl)(Panel_Damage, value._name)
    if control ~= nil then
      value._sizeX = control:GetSizeX()
      value._sizeY = control:GetSizeY()
    end
  end
end

local createDamageControl = function(target)
  -- function num : 0_1 , upvalues : UCT, effectControlSetting
  local numberStaticBase = (UI.getChildControl)(Panel_Damage, "NumberStatic")
  local damageData = (UI.createControl)(UCT.PA_UI_CONTROL_NUMSTATIC, target._panel, "StaticText_Damage")
  CopyBaseProperty(numberStaticBase, damageData)
  damageData:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Damage/damageText.dds")
  damageData:SetShowPercent(false)
  damageData:SetNumberSizeWidth(40)
  damageData:SetNumberSizeHeight(40)
  damageData:SetNumSpanSize(-10)
  target.damage = damageData
  local effectControl, effectData = nil, nil
  for idx,value in pairs(effectControlSetting) do
    effectControl = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, target._panel, value._name)
    CopyBaseProperty((UI.getChildControl)(Panel_Damage, value._name), effectControl)
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (target.effectList)[idx] = effectControl
  end
end

local createDamagePanel = function()
  -- function num : 0_2 , upvalues : DamagePanel_Count, createDamageControl, DamagePanel
  for index = 1, DamagePanel_Count do
    local panel = (UI.createPanel)("damagePanel_" .. tostring(index), (Defines.UIGroup).PAGameUIGroup_ScreenEffect)
    CopyBaseProperty(Panel_Damage, panel)
    if panel == nil then
      return 
    end
    local target = {
effectList = {}
, damage = nil, _posX = 0, _posY = 0, _posZ = 0, _panel = panel}
    createDamageControl(target)
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R6 in 'UnsetPending'

    DamagePanel[index] = target
    panel:setFlushAble(false)
    panel:SetIgnore(true)
    panel:SetIgnoreChild(true)
    panel:SetShow(false, false)
  end
end

local SetAnimationPanel = function(targetPanel, startendColor, middleColor, timeRate)
  -- function num : 0_3 , upvalues : UI_ANI_ADV
  local aniInfo0 = targetPanel:addColorAnimation(0 * timeRate, 0.1 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo0:SetStartColor(startendColor)
  aniInfo0:SetEndColor(middleColor)
  aniInfo0:SetStartIntensity(1)
  aniInfo0:SetEndIntensity(2)
  aniInfo0.IsChangeChild = true
  local aniInfo1 = targetPanel:addColorAnimation(0.3 * timeRate, 0.5 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo1:SetStartColor(middleColor)
  aniInfo1:SetEndColor(startendColor)
  aniInfo1:SetStartIntensity(2)
  aniInfo1:SetEndIntensity(1)
  aniInfo1:SetHideAtEnd(true)
  aniInfo1.IsChangeChild = true
end

local SetAnimationControl = function(targetStatic, posX, posY, timeRate)
  -- function num : 0_4 , upvalues : isShowAttackEffect, UI_ANI_ADV, UI_AH
  targetStatic:SetPosX(posX)
  targetStatic:SetPosY(posY + 500)
  targetStatic:SetShow(isShowAttackEffect)
  targetStatic:SetAlpha(0)
  local aniInfo2 = targetStatic:addMoveAnimation(0 * timeRate, 0.2 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo2.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo2.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo2:SetStartPosition(posX, posY - 150)
  aniInfo2:SetEndPosition(posX, posY - 200)
  local aniInfo3 = targetStatic:addMoveAnimation(0.2 * timeRate, 0.5 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo3.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo3.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo3:SetStartPosition(posX, posY - 200)
  aniInfo3:SetEndPosition(posX, posY - 250)
end

local SetAnimation_CounterAttack = function(targetStatic, posX, posY, timeRate)
  -- function num : 0_5 , upvalues : isShowAttackEffect, UI_ANI_ADV, UI_AH
  targetStatic:SetPosX(posX)
  targetStatic:SetPosY(posY + 500)
  targetStatic:SetShow(isShowAttackEffect)
  targetStatic:SetAlpha(0)
  local aniInfo2 = targetStatic:addMoveAnimation(0 * timeRate, 0.2 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo2.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo2.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo2:SetStartPosition(posX, posY - 200)
  aniInfo2:SetEndPosition(posX, posY - 200)
  local aniInfo3 = targetStatic:addMoveAnimation(0.2 * timeRate, 0.5 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo3.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo3.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo3:SetStartPosition(posX, posY - 200)
  aniInfo3:SetEndPosition(posX, posY - 200)
  local aniInfo4 = targetStatic:addScaleAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo4:SetStartScale(1.5)
  aniInfo4:SetEndScale(1)
  aniInfo4.AxisX = 83
  aniInfo4.AxisY = 16.5
end

local SetAnimation_KindDamage = function(targetStatic, posX, posY, timeRate)
  -- function num : 0_6 , upvalues : isShowAttackEffect, UI_ANI_ADV, UI_AH
  targetStatic:SetPosX(posX - 120)
  targetStatic:SetPosY(posY + 200)
  targetStatic:SetShow(isShowAttackEffect)
  targetStatic:SetAlpha(0)
  local aniInfo2 = targetStatic:addMoveAnimation(0 * timeRate, 0.1 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo2.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo2.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo2:SetStartPosition(posX, posY - 50)
  aniInfo2:SetEndPosition(posX, posY - 150)
  local aniInfo3 = targetStatic:addMoveAnimation(0.4 * timeRate, 0.6 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo3.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo3.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo3:SetStartPosition(posX, posY - 150)
  aniInfo3:SetEndPosition(posX, posY - 200)
end

LuaDamagePostflushAndRestoreFunction = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_7 , upvalues : UpdatePanel
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  UpdatePanel:SetShow(true, false)
end

local initialize = function()
  -- function num : 0_8 , upvalues : UpdatePanel, uiGruopValue, createUIData, createDamagePanel
  UpdatePanel = (UI.createPanel)("Panel_DamageDisplay", uiGruopValue)
  UpdatePanel:SetShow(true, false)
  UpdatePanel:SetIgnore(true)
  UpdatePanel:SetPosX(0)
  UpdatePanel:SetPosY(0)
  UpdatePanel:SetAlpha(0)
  UpdatePanel:SetSize(1, 1)
  UpdatePanel:RegisterUpdateFunc("DamageOutputFunction_UpdatePosition")
  UpdatePanel:RegisterShowEventFunc(true, " ")
  UpdatePanel:RegisterShowEventFunc(false, " ")
  createUIData()
  createDamagePanel()
end

registerEvent("FromClient_RenderModeChangeState", "LuaDamagePostflushAndRestoreFunction")
Panel_CounterAttack:SetShow(false)
CounterAttack_ResizeScreen = function()
  -- function num : 0_9
  Panel_CounterAttack:SetSize(getScreenSizeX(), getScreenSizeY())
end

CounterAttack_Show = function()
  -- function num : 0_10
  Panel_CounterAttack:ResetVertexAni()
  Panel_CounterAttack:SetShow(true)
  Panel_CounterAttack:SetVertexAniRun("Ani_Color_Counter", true)
end

CounterAttack_ResizeScreen()
registerEvent("onScreenResize", "CounterAttack_ResizeScreen")
DamageOutputFunction_UpdatePosition = function()
  -- function num : 0_11 , upvalues : DamagePanel_Count, DamagePanel
  local cameraRotation = getCameraYawPitchRoll()
  local cameraPosition = getCameraPosition()
  for index = 1, DamagePanel_Count do
    local damageData = DamagePanel[index]
    local panel = damageData._panel
    if panel:GetShow() then
      local posX = damageData._posX
      local posY = damageData._posY + 150
      local posZ = damageData._posZ
      local transformData = getTransformRevers(posX, posY, posZ)
      if transformData.x > -1 and transformData.y > -1 then
        panel:SetPosX(transformData.x)
        panel:SetPosY(transformData.y)
      else
        panel:SetPosX(-1000)
        panel:SetPosY(-1000)
      end
    end
  end
end

FromClient_TendencyChanged = function(actorKeyRaw, tendencyValue)
  -- function num : 0_12
  local selfWrapper = getSelfPlayer()
  local selfProxy = selfWrapper:get()
  local selfActorKeyRaw = selfWrapper:getActorKey()
  local selfPosition = float3(selfProxy:getPositionX(), selfProxy:getPositionY(), selfProxy:getPositionZ())
  if selfActorKeyRaw == actorKeyRaw and (tendencyValue < 0 or tendencyValue >= 100) then
    if tendencyValue < 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DAMAGE_TENDENCYCHANGED"))
    end
    DamageOutputFunction_OnDamage((getSelfPlayer()):getActorKey(), tendencyValue, 96, 10, selfPosition, false, (getSelfPlayer()):getActorKey(), true)
  end
end

FromClient_VaryIntimacy = function(actorKeyRaw, intimacyValue)
  -- function num : 0_13
  local actorProxy = (getActor(actorKeyRaw)):get()
  local actorPosition = float3(actorProxy:getPositionX(), actorProxy:getPositionY(), actorProxy:getPositionZ())
  if intimacyValue ~= 0 then
    audioPostEvent_SystemUi(7, 0)
    DamageOutputFunction_OnDamage(actorKeyRaw, intimacyValue, 97, 10, actorPosition, false, (getSelfPlayer()):getActorKey(), true)
  end
end

DamageOutputFunction_gainExperience = function(experience)
  -- function num : 0_14
  local selfProxy = (getSelfPlayer()):get()
  local selfPosition = float3(selfProxy:getPositionX(), selfProxy:getPositionY(), selfProxy:getPositionZ())
  if experience > 0 then
    DamageOutputFunction_OnDamage((getSelfPlayer()):getActorKey(), experience, 99, 10, selfPosition, false, (getSelfPlayer()):getActorKey(), false)
  end
end

FromClient_WpChanged = function(prevWp, wp)
  -- function num : 0_15
  local selfProxy = (getSelfPlayer()):get()
  local selfPosition = float3(selfProxy:getPositionX(), selfProxy:getPositionY(), selfProxy:getPositionZ())
  local varyWp = wp - prevWp
  if varyWp < 0 or varyWp > 1 then
    DamageOutputFunction_OnDamage((getSelfPlayer()):getActorKey(), varyWp, 93, 10, selfPosition, false, (getSelfPlayer()):getActorKey(), false)
  end
end

DamageOutputFunction_OnDamage = function(attakeeKeyRaw, effectNumber, effectType, additionalDamageType, posFloat3, isTribeAttack, attackerActorKeyRaw, isNotRandom)
  -- function num : 0_16 , upvalues : DamagePanel, DamagePanel_Index, DamagePanel_Count, WHITE_A0, WHITE_A1, RED_A0, RED_A1, ORANGE_A0, ORANGE_A1, GREEN_A0, GREEN_A1, SKY_BLUE_A0, SKY_BLUE_A1, LIGHT_ORANGE_A0, LIGHT_ORANGE_A1, isShowAttackEffect, SetAnimationPanel, SetAnimationControl, effectControlSetting, SetAnimation_CounterAttack
  local target = DamagePanel[DamagePanel_Index]
  DamagePanel_Index = DamagePanel_Index + 1
  if DamagePanel_Count < DamagePanel_Index then
    DamagePanel_Index = 1
  end
  if isNotRandom == true then
    target._posX = posFloat3.x
    target._posY = posFloat3.y
    target._posZ = posFloat3.z
  else
    target._posX = posFloat3.x + getRandomValue(-50, 50)
    target._posY = posFloat3.y
    target._posZ = posFloat3.z + getRandomValue(-50, 50)
  end
  if effectType > 90 then
    local talker = dialog_getTalker()
    if talker ~= nil then
      local talkerRaw = talker:get()
      target._posX = talkerRaw:getPositionX()
      target._posY = talkerRaw:getPositionY()
      target._posZ = talkerRaw:getPositionZ()
    end
  end
  do
    for _,control in pairs(target.effectList) do
      control:SetShow(false)
    end
    do
      if (effectType == 96 or effectType == 97 or effectType == 93) and effectNumber == 0 then
        return 
      end
      local selfPlayer = getSelfPlayer()
      local attackeeIsSelfPlayer = selfPlayer ~= nil and selfPlayer:getActorKey() == attakeeKeyRaw
      local baseX = 0
      local baseY = 0
      if isNotRandom == true then
        baseX = 160
        baseY = 130
      end
      local startendColor = WHITE_A0
      local middleColor = WHITE_A1
      if attackeeIsSelfPlayer then
        startendColor = RED_A0
        middleColor = RED_A1
      end
      if effectType == 8 and effectNumber <= 0 then
        return 
      end
      local timeRate = 2
      local showSymbol = 0
      local isDamageShow = true
      local isShowKindDamage = (effectType <= 2 and isTribeAttack)
      if effectType ~= 0 or effectType == 1 then
        startendColor = ORANGE_A0
        middleColor = ORANGE_A1
      elseif effectType == 2 then
        isDamageShow = false
      elseif effectType == 3 then
        isDamageShow = false
      elseif effectType == 4 then
        isDamageShow = false
      elseif effectType == 5 then
        isDamageShow = false
      elseif effectType == 6 then
        startendColor = GREEN_A0
        middleColor = GREEN_A1
        isDamageShow = false
      elseif effectType == 7 then
        startendColor = SKY_BLUE_A0
        middleColor = SKY_BLUE_A1
        isDamageShow = false
      elseif effectType == 8 then
        startendColor = LIGHT_ORANGE_A0
        middleColor = LIGHT_ORANGE_A1
        timeRate = 4
        showSymbol = 0
      elseif effectType == 93 then
        startendColor = WHITE_A0
        middleColor = WHITE_A1
        timeRate = 4
        showSymbol = 1
        isDamageShow = false
      elseif effectType == 96 then
        startendColor = WHITE_A0
        middleColor = WHITE_A1
        timeRate = 4
        showSymbol = 1
        isDamageShow = false
      elseif effectType == 97 then
        startendColor = WHITE_A0
        middleColor = WHITE_A1
        timeRate = 4
        showSymbol = 1
        isDamageShow = false
      elseif effectType == 99 then
        startendColor = WHITE_A0
        middleColor = WHITE_A1
        timeRate = 4
        showSymbol = 1
        isDamageShow = false
      else
        (UI.ASSERT)(false, "이상�\156 효과번호�\128 들어�\180.")
      end
      local targetPanel = target._panel
      targetPanel:SetShow(isShowAttackEffect, false)
      targetPanel:SetWorldPosX(target._posX)
      targetPanel:SetWorldPosY(target._posY)
      targetPanel:SetWorldPosZ(target._posZ)
      SetAnimationPanel(targetPanel, startendColor, middleColor, timeRate)
      if isRealServiceMode() == false and isDamageMeter() == true then
        local nameStatic = target.damage
        local numberWidth = 0
        local numberHeight = 50
        if effectType <= 6 then
          setDamageNameStatic(nameStatic, effectNumber, showSymbol, startendColor)
          numberWidth = nameStatic:getNumberWidth()
          SetAnimationControl(nameStatic, -numberWidth / 2, baseY, timeRate)
          baseY = baseY + numberHeight
        else
          nameStatic:SetShow(false)
        end
      end
      if effectType ~= 0 and effectType ~= 6 then
        -- DECOMPILER ERROR at PC261: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC261: Unhandled construct in 'MakeBoolean' P3

        if (effectType == 7 and effectType == 1) or effectType == 4 then
          baseX = baseX - (effectControlSetting[effectType])._sizeX / 2
          SetAnimationControl((target.effectList)[effectType], baseX, baseY, timeRate)
        end
      end
      if effectType ~= 5 or effectType == 8 then
        baseX = baseX - (effectControlSetting[6])._sizeX
        SetAnimationControl((target.effectList)[6], baseX, baseY - 60, timeRate)
      elseif effectType == 93 then
        baseX = baseX - (effectControlSetting[effectType])._sizeX
        baseY = baseY + 5
        SetAnimationControl((target.effectList)[effectType], baseX, baseY, timeRate)
      elseif effectType == 96 then
        baseX = baseX - (effectControlSetting[96])._sizeX
        baseY = baseY + 5
        SetAnimationControl((target.effectList)[96], baseX, baseY, timeRate)
      elseif effectType == 97 then
        baseX = baseX - (effectControlSetting[97])._sizeX
        baseY = baseY + 5
        SetAnimationControl((target.effectList)[97], baseX, baseY, timeRate)
      elseif effectType == 99 then
        baseX = baseX - (effectControlSetting[99])._sizeX
        baseY = baseY + 50
        SetAnimationControl((target.effectList)[99], baseX, baseY - 50, timeRate)
      else
        (UI.ASSERT)(false, "이상�\156 효과번호�\128 들어�\180.")
      end
      if isDamageShow then
        if additionalDamageType == 0 and effectType == 1 then
          if attackeeIsSelfPlayer then
            ((target.effectList)[7]):AddEffect("Ui_Damage_CriticalBackattack_Red", false, 0, 0)
            render_setPointBlur(0.04, 0.03)
            render_setColorBypass(0.8, 0.15)
            render_setColorBalance(float3(-0.3, 0, 0), 0.12)
          else
            ((target.effectList)[7]):AddEffect("Ui_Damage_CriticalBackattack_White", false, 0, 0)
            audioPostEvent_SystemUi3D(14, 2, attackerActorKeyRaw)
            render_setChromaticBlur(50, 0.1)
            render_setPointBlur(0.025, 0.03)
            render_setColorBypass(0.3, 0.08)
          end
          baseX = baseX - (effectControlSetting[7])._sizeX / 2
          SetAnimationControl((target.effectList)[7], baseX, baseY, 10)
        elseif additionalDamageType == 0 then
          if attackeeIsSelfPlayer then
            ((target.effectList)[7]):AddEffect("Ui_Damage_Backattack_red", false, 0, 0)
            render_setPointBlur(0.04, 0.03)
            render_setColorBypass(0.8, 0.15)
            render_setColorBalance(float3(-0.3, 0, 0), 0.12)
          else
            ((target.effectList)[7]):AddEffect("Ui_Damage_Backattack", false, 0, 0)
            audioPostEvent_SystemUi3D(14, 0, attackerActorKeyRaw)
            render_setChromaticBlur(50, 0.1)
            render_setPointBlur(0.025, 0.03)
            render_setColorBypass(0.3, 0.08)
          end
          baseX = baseX - (effectControlSetting[7])._sizeX / 2
          SetAnimationControl((target.effectList)[7], baseX, baseY, 10)
        elseif additionalDamageType == 1 then
          if effectType == 1 then
            if attackeeIsSelfPlayer then
              ((target.effectList)[8]):AddEffect("Ui_Damage_CriticalCounter_Red", false, 0, 0)
              render_setPointBlur(0.04, 0.03)
              render_setColorBypass(0.8, 0.15)
              render_setColorBalance(float3(-0.3, 0, 0), 0.12)
            else
              ((target.effectList)[8]):AddEffect("Ui_Damage_CriticalCounter_White", false, 0, 0)
              audioPostEvent_SystemUi3D(14, 2, attackerActorKeyRaw)
              render_setChromaticBlur(65, 0.15)
              render_setPointBlur(0.025, 0.03)
              render_setColorBypass(0.3, 0.08)
            end
          elseif attackeeIsSelfPlayer then
            ((target.effectList)[8]):AddEffect("Ui_Damage_Counter", false, 0, 0)
            render_setPointBlur(0.04, 0.03)
            render_setColorBypass(0.8, 0.15)
            render_setColorBalance(float3(-0.3, 0, 0), 0.12)
          else
            ((target.effectList)[8]):AddEffect("Ui_Damage_Counter", false, 0, 0)
            audioPostEvent_SystemUi3D(14, 2, attackerActorKeyRaw)
            render_setChromaticBlur(65, 0.15)
            render_setPointBlur(0.025, 0.03)
            render_setColorBypass(0.3, 0.08)
          end
          CounterAttack_Show()
          baseX = baseX - (effectControlSetting[8])._sizeX / 2
          SetAnimation_CounterAttack((target.effectList)[8], baseX, baseY, timeRate)
        elseif additionalDamageType == 2 then
          if effectType == 1 then
            if attackeeIsSelfPlayer then
              ((target.effectList)[9]):AddEffect("Ui_Damage_CriticalDownattack_Red", false, 0, 0)
              render_setPointBlur(0.04, 0.03)
              render_setColorBypass(0.8, 0.15)
              render_setColorBalance(float3(-0.3, 0, 0), 0.12)
            else
              ((target.effectList)[9]):AddEffect("Ui_Damage_CriticalDownattack_White", false, 0, 0)
              audioPostEvent_SystemUi3D(14, 3, attackerActorKeyRaw)
              render_setChromaticBlur(55, 0.15)
              render_setPointBlur(0.025, 0.03)
              render_setColorBypass(0.3, 0.08)
            end
          elseif attackeeIsSelfPlayer then
            ((target.effectList)[9]):AddEffect("Ui_Damage_Downattack", false, 0, 0)
            render_setPointBlur(0.04, 0.03)
            render_setColorBypass(0.8, 0.15)
            render_setColorBalance(float3(-0.3, 0, 0), 0.12)
          else
            ((target.effectList)[9]):AddEffect("Ui_Damage_Downattack", false, 0, 0)
            audioPostEvent_SystemUi3D(14, 3, attackerActorKeyRaw)
            render_setChromaticBlur(55, 0.15)
            render_setPointBlur(0.025, 0.03)
            render_setColorBypass(0.3, 0.08)
          end
          baseX = baseX - (effectControlSetting[9])._sizeX / 2
          SetAnimation_CounterAttack((target.effectList)[9], baseX, baseY, timeRate)
        elseif additionalDamageType == 3 then
          if effectType == 1 then
            if attackeeIsSelfPlayer then
              ((target.effectList)[10]):AddEffect("Ui_Damage_CriticalSpeedattack_Red", false, 0, 0)
              render_setPointBlur(0.04, 0.03)
              render_setColorBypass(0.8, 0.15)
              render_setColorBalance(float3(-0.3, 0, 0), 0.12)
            else
              ((target.effectList)[10]):AddEffect("Ui_Damage_CriticalSpeedattack_White", false, 0, 0)
              audioPostEvent_SystemUi3D(14, 4, attackerActorKeyRaw)
              render_setChromaticBlur(55, 0.15)
              render_setPointBlur(0.025, 0.03)
              render_setColorBypass(0.3, 0.08)
            end
          elseif attackeeIsSelfPlayer then
            ((target.effectList)[10]):AddEffect("Ui_Damage_Speedattack", false, 0, 0)
            render_setPointBlur(0.04, 0.03)
            render_setColorBypass(0.8, 0.15)
            render_setColorBalance(float3(-0.3, 0, 0), 0.12)
          else
            ((target.effectList)[10]):AddEffect("Ui_Damage_Speedattack", false, 0, 0)
            audioPostEvent_SystemUi3D(14, 4, attackerActorKeyRaw)
            render_setChromaticBlur(55, 0.15)
            render_setPointBlur(0.025, 0.03)
            render_setColorBypass(0.3, 0.08)
          end
          baseX = baseX - (effectControlSetting[10])._sizeX / 2
          SetAnimation_CounterAttack((target.effectList)[10], baseX, baseY, timeRate)
        elseif additionalDamageType == 4 then
          if effectType == 1 then
            if attackeeIsSelfPlayer then
              ((target.effectList)[12]):AddEffect("Ui_Damage_CriticalAirattack_Red", false, 0, 0)
              render_setPointBlur(0.04, 0.03)
              render_setColorBypass(0.8, 0.15)
              render_setColorBalance(float3(-0.3, 0, 0), 0.12)
            else
              ((target.effectList)[12]):AddEffect("Ui_Damage_CriticalAirattack_White", false, 0, 0)
              audioPostEvent_SystemUi3D(14, 5, attackerActorKeyRaw)
              render_setChromaticBlur(55, 0.15)
              render_setPointBlur(0.025, 0.03)
              render_setColorBypass(0.3, 0.08)
            end
          elseif attackeeIsSelfPlayer then
            ((target.effectList)[12]):AddEffect("Ui_Damage_Airattack", false, 0, 0)
            render_setPointBlur(0.04, 0.03)
            render_setColorBypass(0.8, 0.15)
            render_setColorBalance(float3(-0.3, 0, 0), 0.12)
          else
            ((target.effectList)[12]):AddEffect("Ui_Damage_Airattack", false, 0, 0)
            audioPostEvent_SystemUi3D(14, 5, attackerActorKeyRaw)
            render_setChromaticBlur(55, 0.15)
            render_setPointBlur(0.025, 0.03)
            render_setColorBypass(0.3, 0.08)
          end
          baseX = baseX - (effectControlSetting[12])._sizeX / 2
          SetAnimation_CounterAttack((target.effectList)[12], baseX, baseY, timeRate)
        elseif effectType == 1 then
          if attackeeIsSelfPlayer then
            ((target.effectList)[1]):AddEffect("Ui_Damage_Critical", false, 0, 0)
            render_setPointBlur(0.045, 0.05)
            render_setColorBypass(0.8, 0.15)
          else
            ((target.effectList)[1]):AddEffect("Ui_Damage_Critical", false, 0, 0)
            audioPostEvent_SystemUi3D(14, 2, attackerActorKeyRaw)
            render_setChromaticBlur(70, 0.09)
            render_setPointBlur(0.025, 0.03)
            render_setColorBypass(0.5, 0.08)
          end
          baseX = baseX - (effectControlSetting[1])._sizeX / 2
          SetAnimation_CounterAttack((target.effectList)[1], baseX, baseY, timeRate)
        end
      end
      do
        -- DECOMPILER ERROR at PC1049: Unhandled construct in 'MakeBoolean' P1

        if additionalDamageType ~= 99 or effectType == 96 or effectType == 97 or effectType == 93 then
          local arrowControl = (target.effectList)[94]
          if effectNumber < 0 then
            arrowControl = (target.effectList)[95]
            ;
            ((target.effectList)[94]):ResetVertexAni(true)
          else
            arrowControl = (target.effectList)[94]
            ;
            ((target.effectList)[95]):ResetVertexAni(true)
          end
          baseX = baseX + (effectControlSetting[effectType])._sizeX
          SetAnimationControl(arrowControl, baseX, baseY + 10, timeRate)
        end
        -- DECOMPILER ERROR: 66 unprocessed JMP targets
      end
    end
  end
end

FGlobal_SetMamageShow = function()
  -- function num : 0_17 , upvalues : isShowAttackEffect
  isShowAttackEffect = ToClient_getRenderHitEffect()
end

FromClient_AddDamageProcess = function(attakeeKeyRaw, effectNumber, effectType, additionalDamageType, posFloat3, isTribeAttack, attackerActorKeyRaw)
  -- function num : 0_18
  if (ToClient_getGameOptionControllerWrapper()):getRenderHitEffectParty() == false then
    local selfPlayerWrapper = getSelfPlayer()
    if selfPlayerWrapper == nil then
      return 
    end
    local attakeeActor = getCharacterActor(attakeeKeyRaw)
    local attackerActor = getCharacterActor(attackerActorKeyRaw)
    local actorKeyRaw = (getSelfPlayer()):getActorKey()
    if actorKeyRaw ~= attakeeKeyRaw and actorKeyRaw ~= attackerActorKeyRaw and (attakeeActor == nil or attakeeActor:isOwnerSelfPlayer() == false) and (attackerActor == nil or attackerActor:isOwnerSelfPlayer() == false) then
      return 
    end
  end
  do
    DamageOutputFunction_OnDamage(attakeeKeyRaw, effectNumber, effectType, additionalDamageType, posFloat3, isTribeAttack, attackerActorKeyRaw, false)
  end
end

registerEvent("addDamage", "FromClient_AddDamageProcess")
registerEvent("gainExplorationExperience", "DamageOutputFunction_gainExperience")
registerEvent("FromClient_VaryIntimacy", "FromClient_VaryIntimacy")
registerEvent("FromClient_TendencyChanged", "FromClient_TendencyChanged")
registerEvent("FromClient_WpChangedWithParam", "FromClient_WpChanged")
registerEvent("update_Monster_Info_Req", "panel_Update_Monster_Info")
initialize()

