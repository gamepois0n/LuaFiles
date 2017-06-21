-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\minigame\minigame_hammer.luac 

-- params : ...
-- function num : 0
Panel_Hammer:SetShow(false)
local HammerManager = {_uiReadyGroup, _uiButtonSpace, _uiSingaugeGroup, _uiSingaugeRedLine, _uiSingaugeMatchLine, _uiSingaugeBar, _uiResultText; _isDoing = false, _isSucc = false, _power = 0, _result = 0, _preTick = 0, _isUpdateGauge = false, _dirGauge = false}
MiniGame_Hammer_Init = function()
  -- function num : 0_0 , upvalues : HammerManager
  local this = HammerManager
  this._uiReadyGroup = (UI.getChildControl)(Panel_Hammer, "Static_ReadyGroup")
  this._uiButtonSpace = (UI.getChildControl)(this._uiReadyGroup, "StaticText_Btn_Space_2")
  this._uiSingaugeGroup = (UI.getChildControl)(Panel_Hammer, "Static_SinGaugeGroup")
  this._uiSingaugeRedLine = (UI.getChildControl)(this._uiSingaugeGroup, "Static_RedLine")
  this._uiSingaugeMatchLine = (UI.getChildControl)(this._uiSingaugeGroup, "Static_SinGaugeLine_1")
  this._uiSingaugeBar = (UI.getChildControl)(this._uiSingaugeGroup, "Static_SinGauge")
  this._uiResultText = (UI.getChildControl)(Panel_Hammer, "StaticText_Result")
  ;
  (this._uiReadyGroup):SetShow(false)
  ;
  (this._uiSingaugeGroup):SetShow(false)
  ;
  (UIAni.AlphaAnimation)(1, this._uiButtonSpace, 0.75, 1)
end

MiniGame_Hammer_Start = function()
  -- function num : 0_1 , upvalues : HammerManager
  local this = HammerManager
  this._isDoing = true
  this._power = 0
  this._result = 0
  Panel_Hammer:SetShow(true)
  Panel_Hammer:RegisterUpdateFunc("Update_HammerGauge")
  ;
  (this._uiReadyGroup):SetShow(true)
end

MiniGame_Hammer_Hit = function()
  -- function num : 0_2 , upvalues : HammerManager
  local this = HammerManager
  ;
  (this._uiReadyGroup):SetShow(false)
  ;
  (this._uiSingaugeGroup):SetShow(true)
  this._isUpdateGauge = true
end

local gaugeSpeed = 0.8
Update_HammerGauge = function()
  -- function num : 0_3 , upvalues : HammerManager, gaugeSpeed
  local this = HammerManager
  _PA_LOG("�\128민혁", "Update_HammerGauge()")
  if this._isUpdateGauge == false then
    return 
  end
  local currentTick = getTickCount32()
  local deltaTick = currentTick - this._preTick
  local deltaBar = deltaTick / 1000 * gaugeSpeed
  if deltaTick > 2000 then
    deltaBar = 0.8
  end
  this._preTick = currentTick
  local nowBarSize = (this._uiSingaugeBar):GetSizeX()
  if this._dirGauge == false then
    nowBarSize = nowBarSize + (nowBarSize + 1) / 273 * 273 * 10 * deltaBar
    if nowBarSize > 273 then
      nowBarSize = 273
      this._dirGauge = true
    end
    ;
    (this._uiSingaugeBar):SetSize(nowBarSize, 20)
  else
    nowBarSize = nowBarSize - (nowBarSize + 1) / 273 * 273 * 2.5 * deltaBar
    if nowBarSize < 5 then
      nowBarSize = 5
      this._dirGauge = false
    end
    ;
    (this._uiSingaugeBar):SetSize(nowBarSize, 20)
  end
  if isKeyDown_Once((CppEnums.VirtualKeyCode).KeyCode_SPACE) then
    this._power = nowBarSize
    this._isUpdateGauge = false
    MiniGame_Hammer_Result()
  end
end

MiniGame_Hammer_Result = function()
  -- function num : 0_4 , upvalues : HammerManager
  local this = HammerManager
  ;
  (this._uiSingaugeGroup):SetShow(false)
  ;
  (this._uiResultText):SetText("100�\144 ! 당신�\128 뚝배�\176 킬러!")
  ;
  (this._uiResultText):SetShow(true)
end

MiniGame_Hammer_End = function()
  -- function num : 0_5 , upvalues : HammerManager
  local this = HammerManager
  ;
  (this._uiReadyGroup):SetShow(false)
  ;
  (this._uiSingaugeGroup):SetShow(false)
  ;
  (this._uiResultText):SetShow(false)
end

MiniGame_Hammer_Init()

