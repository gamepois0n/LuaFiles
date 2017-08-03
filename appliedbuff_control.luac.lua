-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\buff\appliedbuff_control.luac 

-- params : ...
-- function num : 0
local buffTooltipIndex = 0
local isTooltipDebuff = false
ShowBuffTooltip = function(buffIndex, isDebuff)
  -- function num : 0_0 , upvalues : buffTooltipIndex, isTooltipDebuff
  local appliedBuff = (getSelfPlayer()):getAppliedBuffByIndex(buffIndex - 1, isDebuff)
  if appliedBuff == nil then
    return 
  end
  buffTooltipIndex = buffIndex
  isTooltipDebuff = isDebuff
  local icon = nil
  if isDebuff then
    icon = (PaGlobalAppliedBuffList._uiDeBuffList)[buffIndex]
  else
    icon = (PaGlobalAppliedBuffList._uiBuffList)[buffIndex]
  end
  local tooltipIndex = buffIndex
  if isDebuff then
    tooltipIndex = tooltipIndex + PaGlobalAppliedBuffList._maxBuffCount
  end
  if appliedBuff ~= nil then
    TooltipCommon_Show(tooltipIndex, icon, appliedBuff:getIconName(), appliedBuff:getBuffDesc(), "")
  end
end

HideBuffTooltip = function(buffIndex, isDebuff)
  -- function num : 0_1
  local tooltipIndex = buffIndex
  if isDebuff then
    tooltipIndex = tooltipIndex + PaGlobalAppliedBuffList._maxBuffCount
  end
  TooltipCommon_Hide(tooltipIndex)
end

local sumCount = 0
local default_uiBackBuffPosX = (PaGlobalAppliedBuffList._uiBackBuff):GetPosX()
-- DECOMPILER ERROR at PC17: Confused about usage of register: R4 in 'UnsetPending'

PaGlobalAppliedBuffList.updateBuff = function(self, isDebuff)
  -- function num : 0_2 , upvalues : sumCount, default_uiBackBuffPosX
  local uiBuffList = self._uiDeBuffList
  local uiBackBuff = self._uiBackDeBuff
  if isDebuff == false then
    uiBuffList = self._uiBuffList
    uiBackBuff = self._uiBackBuff
  end
  local buffIndex = 0
  local appliedBuff = (getSelfPlayer()):getAppliedBuffBegin(isDebuff)
  while appliedBuff ~= nil do
    buffIndex = buffIndex + 1
    if self._maxBuffCount < buffIndex then
      buffIndex = buffIndex - 1
      break
    end
    local u64_calc_time1 = appliedBuff:getRemainedTime_u64() / (Defines.u64_const).u64_1000
    ;
    (uiBuffList[buffIndex]):ChangeTextureInfoName("icon/" .. appliedBuff:getIconName())
    ;
    (uiBuffList[buffIndex]):SetShow(true)
    ;
    (uiBuffList[buffIndex]):SetText(((Util.Time).inGameTimeFormattingTop)(u64_calc_time1))
    appliedBuff = (getSelfPlayer()):getAppliedBuffNext(isDebuff)
  end
  do
    if buffIndex > 0 then
      uiBackBuff:SetSize((buffIndex) * 33 + 4, 52)
      uiBackBuff:SetShow(true)
    else
      uiBackBuff:SetShow(false)
    end
    sumCount = sumCount + (buffIndex)
    while buffIndex < self._maxBuffCount do
      buffIndex = buffIndex + 1
      ;
      (uiBuffList[buffIndex]):SetShow(false)
    end
    if buffIndex > 17 then
      uiBackBuff:SetPosX(default_uiBackBuffPosX - (buffIndex - 17) / 2 * 33)
    else
      uiBackBuff:SetPosX(default_uiBackBuffPosX)
    end
    for index = 1, buffIndex do
      (uiBuffList[index]):SetPosX(uiBackBuff:GetPosX() + 33 * (index - 1) + 2)
    end
  end
end

-- DECOMPILER ERROR at PC21: Confused about usage of register: R4 in 'UnsetPending'

PaGlobalAppliedBuffList.updateBuffList = function(self)
  -- function num : 0_3 , upvalues : sumCount
  sumCount = 0
  PaGlobalAppliedBuffList:updateBuff(true)
  PaGlobalAppliedBuffList:updateBuff(false)
  if sumCount == 0 then
    TooltipCommon_Hide(TooltipCommon_getCurrentIndex())
  end
end

local _cumulateTime = 0
AppliedBuffList_Update = function(fDeltaTime)
  -- function num : 0_4 , upvalues : _cumulateTime
  if isFlushedUI() then
    return 
  end
  _cumulateTime = _cumulateTime + fDeltaTime
  PaGlobalAppliedBuffList:updateBuffList()
  local cumulateTimeInSecond = (math.floor)(_cumulateTime)
  local u64_cumulateTime = toUint64(0, cumulateTimeInSecond)
  if _cumulateTime > 1 then
    _cumulateTime = 0
  end
end

ResponseBuff_changeBuffList = function()
  -- function num : 0_5
  if isFlushedUI() then
    return 
  end
  PaGlobalAppliedBuffList:updateBuffList()
end

buff_RunPostRestoreFunction = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_6
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  ResponseBuff_changeBuffList()
end

registerEvent("FromClient_RenderModeChangeState", "buff_RunPostRestoreFunction")
reloadAppliedBuffPanel = function()
  -- function num : 0_7
  PaGlobalAppliedBuffList:show()
  ResponseBuff_changeBuffList()
end

FGlobal_BuffTooltipOff = function()
  -- function num : 0_8 , upvalues : buffTooltipIndex, isTooltipDebuff
  HideBuffTooltip(buffTooltipIndex, isTooltipDebuff)
end

reloadAppliedBuffPanel()
registerEvent("ResponseBuff_changeBuffList", "ResponseBuff_changeBuffList")
Panel_AppliedBuffList:RegisterUpdateFunc("AppliedBuffList_Update")

