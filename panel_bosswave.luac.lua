-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\bosswave\panel_bosswave.luac 

-- params : ...
-- function num : 0
Panel_BossWave:SetShow(false)
Panel_BossWave:setMaskingChild(true)
Panel_BossWave:setGlassBackground(true)
Panel_BossWave:SetDragAll(true)
local bossWave = {_icon = (UI.getChildControl)(Panel_BossWave, "Static_Icon"), _clearIcon = (UI.getChildControl)(Panel_BossWave, "Static_ClearIcon"), _hpProgressBg = (UI.getChildControl)(Panel_BossWave, "Static_HpBg"), _hpProgress = (UI.getChildControl)(Panel_BossWave, "Progress2_HpGauge"), _bossName = (UI.getChildControl)(Panel_BossWave, "StaticText_BossName"), _maxWaveCount = 5, 
_uiPool = {}
, 
_texture = {
icon = {
[0] = {x1 = 1, y1 = 54, x2 = 20, y2 = 81}
, 
[1] = {x1 = 1, y1 = 110, x2 = 20, y2 = 137}
, 
[2] = {x1 = 1, y1 = 138, x2 = 20, y2 = 165}
, 
[3] = {x1 = 1, y1 = 166, x2 = 20, y2 = 193}
, 
[4] = {x1 = 1, y1 = 194, x2 = 20, y2 = 221}
}
, 
progressBg = {}
, 
progress = {
[0] = {x1 = 28, y1 = 94, x2 = 40, y2 = 100}
, 
[1] = {x1 = 28, y1 = 112, x2 = 40, y2 = 118}
, 
[2] = {x1 = 28, y1 = 129, x2 = 40, y2 = 135}
, 
[3] = {x1 = 28, y1 = 146, x2 = 40, y2 = 152}
, 
[4] = {x1 = 28, y1 = 162, x2 = 40, y2 = 168}
}
}
, 
uiPool = {}
, 
_currentWaveBoss = {}
, _currentWaveMaxCount = 0, _currentBossActorProxy = nil, 
_name = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSWAVE_NAME_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSWAVE_NAME_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSWAVE_NAME_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSWAVE_NAME_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_BOSSWAVE_NAME_4")}
, resetCheck = false}
bossWave.Init = function(self)
  -- function num : 0_0
  for index = 0, self._maxWaveCount - 1 do
    local temp = {}
    temp._icon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_BossWave, "Static_BossWave_Icon_" .. index)
    CopyBaseProperty(self._icon, temp._icon)
    ;
    (temp._icon):SetPosY((self._icon):GetPosY() + 40 * index)
    temp._clearIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_BossWave, "Static_BossWave_ClearIcon_" .. index)
    CopyBaseProperty(self._clearIcon, temp._clearIcon)
    ;
    (temp._clearIcon):SetPosY((self._clearIcon):GetPosY() + 40 * index)
    ;
    (temp._clearIcon):SetShow(false)
    temp._hpProgressBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_BossWave, "Static_BossWave_HpProgressBg_" .. index)
    CopyBaseProperty(self._hpProgressBg, temp._hpProgressBg)
    ;
    (temp._hpProgressBg):SetPosY((self._hpProgressBg):GetPosY() + 40 * index)
    temp._hpProgress = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, Panel_BossWave, "Progress2_BossWave_HpProgress_" .. index)
    CopyBaseProperty(self._hpProgress, temp._hpProgress)
    ;
    (temp._hpProgress):SetPosY((self._hpProgress):GetPosY() + 40 * index)
    ;
    (temp._hpProgress):SetProgressRate(0)
    temp._bossName = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_BossWave, "StaticText_BossWave_Name_" .. index)
    CopyBaseProperty(self._bossName, temp._bossName)
    ;
    (temp._bossName):SetPosY((self._bossName):GetPosY() + 40 * index)
    ;
    (temp._bossName):SetText((self._name)[index])
    -- DECOMPILER ERROR at PC135: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.uiPool)[index] = temp
    self:ChangeTexture(index)
  end
  ;
  (self._icon):SetShow(false)
  ;
  (self._clearIcon):SetShow(false)
  ;
  (self._hpProgressBg):SetShow(false)
  ;
  (self._hpProgress):SetShow(false)
  ;
  (self._bossName):SetShow(false)
end

bossWave.ChangeTexture = function(self, index)
  -- function num : 0_1
  local ddsLink = "New_UI_Common_forLua/Widget/Party/Party_01.dds"
  local control = (self.uiPool)[index]
  ;
  (((self.uiPool)[index])._icon):ChangeTextureInfoName(ddsLink)
  local x1, y1, x2, y2 = setTextureUV_Func(((self.uiPool)[index])._icon, (((self._texture).icon)[index]).x1, (((self._texture).icon)[index]).y1, (((self._texture).icon)[index]).x2, (((self._texture).icon)[index]).y2)
  ;
  ((control._icon):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (control._icon):setRenderTexture((control._icon):getBaseTexture())
  ;
  (control._hpProgress):ChangeTextureInfoName(ddsLink)
  local x1, y1, x2, y2 = setTextureUV_Func(control._hpProgress, (((self._texture).progress)[index]).x1, (((self._texture).progress)[index]).y1, (((self._texture).progress)[index]).x2, (((self._texture).progress)[index]).y2)
  ;
  ((control._hpProgress):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (control._hpProgress):setRenderTexture((control._hpProgress):getBaseTexture())
end

bossWave.MonoToneSet = function(self, index, bool)
  -- function num : 0_2
  for _,control in pairs((self.uiPool)[index]) do
  end
end

bossWave.SetShow = function(self, count)
  -- function num : 0_3
  for index = 0, self._maxWaveCount - 1 do
    for _,control in pairs((self.uiPool)[index]) do
      control:SetShow(false)
    end
  end
  for index = 0, count - 1 do
    for _,control in pairs((self.uiPool)[index]) do
      control:SetShow(true)
    end
    ;
    (((self.uiPool)[index])._clearIcon):SetShow(false)
    self:MonoToneSet(index, false)
  end
  Panel_BossWave:SetSize(Panel_BossWave:GetSizeX(), (((self.uiPool)[count - 1])._hpProgressBg):GetPosY() + (((self.uiPool)[count - 1])._hpProgressBg):GetSizeY() + 10)
end

local clearTime = 0
bossWave.Open = function(self)
  -- function num : 0_4 , upvalues : clearTime
  Panel_BossWave:SetShow(true)
  Panel_BossWave:SetPosX(getScreenSizeX() - Panel_Radar:GetSizeX() - Panel_BossWave:GetSizeX() - 20)
  Panel_BossWave:SetPosY(80)
  clearTime = 0
end

bossWave.Close = function(self)
  -- function num : 0_5 , upvalues : bossWave, clearTime
  Panel_BossWave:SetShow(false)
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  bossWave._currentWaveMaxCount = 0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  bossWave._currentBossActorProxy = nil
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  bossWave._currentWaveBoss = {}
  clearTime = 0
end

FromClient_ActivateAltarOfTrainingUIMode = function(hp1, hp2, hp3, hp4, hp5)
  -- function num : 0_6 , upvalues : bossWave, clearTime
  if not Panel_BossWave:GetShow() then
    bossWave:SetShow(5)
    bossWave:Open()
  end
  clearTime = 0
  if h1 == nil then
    h1 = 100
  end
  if h2 == nil then
    h2 = 100
  end
  if h3 == nil then
    h3 = 100
  end
  if h4 == nil then
    h4 = 100
  end
  if h5 == nil then
    h5 = 100
  end
  ;
  (((bossWave.uiPool)[0])._hpProgress):SetProgressRate(hp1)
  ;
  (((bossWave.uiPool)[1])._hpProgress):SetProgressRate(hp2)
  ;
  (((bossWave.uiPool)[2])._hpProgress):SetProgressRate(hp3)
  ;
  (((bossWave.uiPool)[3])._hpProgress):SetProgressRate(hp4)
  ;
  (((bossWave.uiPool)[4])._hpProgress):SetProgressRate(hp5)
end

FromClient_ActivateAltarOfTrainingUIModeQuest = function(hp1, hp2, hp3)
  -- function num : 0_7 , upvalues : bossWave, clearTime
  if not Panel_BossWave:GetShow() then
    bossWave:SetShow(3)
    bossWave:Open()
  end
  clearTime = 0
  if h1 == nil then
    h1 = 100
  end
  if h2 == nil then
    h2 = 100
  end
  if h3 == nil then
    h3 = 100
  end
  ;
  (((bossWave.uiPool)[0])._hpProgress):SetProgressRate(hp1)
  ;
  (((bossWave.uiPool)[1])._hpProgress):SetProgressRate(hp2)
  ;
  (((bossWave.uiPool)[2])._hpProgress):SetProgressRate(hp3)
end

BossWave_Check = function(deltaTime)
  -- function num : 0_8 , upvalues : clearTime, bossWave
  clearTime = clearTime + deltaTime
  if clearTime > 10 then
    bossWave:Close()
  end
end

bossWave.registerEvent = function(self)
  -- function num : 0_9
  registerEvent("FromClient_ActivateAltarOfTrainingUIMode", "FromClient_ActivateAltarOfTrainingUIMode")
  registerEvent("FromClient_ActivateAltarOfTrainingUIModeQuest", "FromClient_ActivateAltarOfTrainingUIModeQuest")
  Panel_BossWave:RegisterUpdateFunc("BossWave_Check")
end

bossWave:Init()
bossWave:registerEvent()

