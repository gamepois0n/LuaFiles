-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_hammer.luac 

-- params : ...
-- function num : 0
local HammerManagerNew = {_isStart, _uiProgressBG, _uiProgressBar, _percentValue, _resultValue, _dirGauge}
MiniGame_Hammer_Init = function()
  -- function num : 0_0 , upvalues : HammerManagerNew
  local this = HammerManagerNew
  this._uiProgressBG = (UI.getChildControl)(Panel_Hammer_New, "Static_GaugeBG")
  this._uiProgressBar = (UI.getChildControl)(Panel_Hammer_New, "Progress2_Gauge")
  this._isStart = false
  this._percentValue = 0
  this._resultValue = 0
  this._countEnd = 0
  Panel_Hammer_New:RegisterUpdateFunc("Update_HammerGauge")
end

MiniGame_Hammer_Start = function()
  -- function num : 0_1 , upvalues : HammerManagerNew
  local this = HammerManagerNew
  Panel_Hammer_New:SetShow(true)
  this._isStart = true
  this._dirGauge = 5
  this._percentValue = 0
  this._resultValue = 0
  this._countEnd = 0
end

Update_HammerGauge = function()
  -- function num : 0_2 , upvalues : HammerManagerNew
  _PA_LOG("민혁", "얘는 언제 들어옵니�\140?")
  local this = HammerManagerNew
  if this._isStart == false then
    return 
  end
  this._percentValue = this._percentValue + this._dirGauge
  if this._percentValue > 100 then
    this._percentValue = 100
    this._dirGauge = -5
  else
    if this._percentValue < 0 then
      this._percentValue = 0
      this._dirGauge = 5
      this._countEnd = this._countEnd + 1
    end
  end
  ;
  (this._uiProgressBar):SetProgressRate(this._percentValue)
  if this._countEnd > 3 then
    this._isStart = false
    MiniGame_Hammer_End()
  end
end

MiniGame_Hammer_End = function()
  -- function num : 0_3
  Panel_Hammer_New:SetShow(false)
end

Panel_Hammer_New:SetShow(false)
MiniGame_Hammer_Init()

