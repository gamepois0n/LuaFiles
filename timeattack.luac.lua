-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\timeattack\timeattack.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
registerEvent("FromClient_startTimeAttack", "FromClient_startTimeAttack")
registerEvent("FromClient_endTimeAttack", "FromClient_endTimeAttack")
Panel_TimeAttack:SetShow(false)
PaGlobal_TimeAttack = {_expiredTime = 0, _isProgress = false, _uiTitle = (UI.getChildControl)(Panel_TimeAttack, "StaticText_Title"), _uiRemainTime = (UI.getChildControl)(Panel_TimeAttack, "StaticText_BossName")}
-- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.openTimeAttack = function(self)
  -- function num : 0_0
  Panel_TimeAttack:SetShow(true)
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.closeTimeAttack = function(self)
  -- function num : 0_1
  Panel_TimeAttack:SetShow(false)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.setInfo = function(self, expiredTime)
  -- function num : 0_2
  self._expiredTime = expiredTime
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.getExpiredTime = function(self)
  -- function num : 0_3
  return self._expiredTime
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.isProgress = function(self)
  -- function num : 0_4
  return self._isProgress
end

FromClient_startTimeAttack = function(expiredTime)
  -- function num : 0_5
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_TimeAttack._isProgress = true
  PaGlobal_TimeAttack:setInfo(expiredTime)
  PaGlobal_TimeAttack:openTimeAttack()
end

FromClient_endTimeAttack = function(isSuccess)
  -- function num : 0_6
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  if (isSuccess ~= 1 or isSuccess == 0) then
    PaGlobal_TimeAttack._isProgress = false
    PaGlobal_TimeAttack:closeTimeAttack()
  end
end

Panel_TimeAttack:RegisterUpdateFunc("PaGlobal_UpdateTimeAttack")
PaGlobal_UpdateTimeAttack = function()
  -- function num : 0_7
  if PaGlobal_TimeAttack:isProgress() == true then
    (PaGlobal_TimeAttack._uiRemainTime):SetText(converStringFromLeftDateTime(PaGlobal_TimeAttack:getExpiredTime()))
  end
end


