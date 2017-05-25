-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\timeattack\timeattack.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
registerEvent("FromClient_startTimeAttack", "FromClient_startTimeAttack")
registerEvent("FromClient_endTimeAttack", "FromClient_endTimeAttack")
Panel_TimeAttack:SetShow(false)
PaGlobal_TimeAttack = {_monsterKey = 0, _expiredTime = 0, _isProgress = false, _uiTitle = (UI.getChildControl)(Panel_TimeAttack, "StaticText_Title"), _uiRemainTime = (UI.getChildControl)(Panel_TimeAttack, "StaticText_BossName")}
-- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.openTimeAttack = function(self)
  -- function num : 0_0
  Panel_TimeAttack:SetShow(true)
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.closeTimeAttack = function(self)
  -- function num : 0_1
  Panel_TimeAttack:SetShow(false)
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.setInfo = function(self, monster, expiredTime)
  -- function num : 0_2
  self._monsterKey = monster
  self._expiredTime = expiredTime
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.getExpiredTime = function(self)
  -- function num : 0_3
  return self._expiredTime
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TimeAttack.isProgress = function(self)
  -- function num : 0_4
  return self._isProgress
end

FromClient_startTimeAttack = function(monster, expiredTime)
  -- function num : 0_5
  (PaGlobal_TimeAttack._uiTitle):SetShow(false)
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  PaGlobal_TimeAttack._isProgress = true
  PaGlobal_TimeAttack:setInfo(monster, expiredTime)
  PaGlobal_TimeAttack:openTimeAttack()
end

FromClient_endTimeAttack = function(isSuccess, monster)
  -- function num : 0_6
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  if (isSuccess ~= 1 or isSuccess == 0) then
    PaGlobal_TimeAttack._isProgress = false
    PaGlobal_TimeAttack:closeTimeAttack()
  end
end

Panel_TimeAttack:RegisterUpdateFunc("PaGlobal_UpdateTimeAttack")
PaGlobal_UpdateTimeAttack = function()
  -- function num : 0_7
  if PaGlobal_TimeAttack:isProgress() == true then
    local leftTime = getLeftSecond_TTime64(PaGlobal_TimeAttack:getExpiredTime())
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

    if leftTime <= toInt64(0, 0) then
      PaGlobal_TimeAttack._isProgress = false
      PaGlobal_TimeAttack:closeTimeAttack()
      return 
    end
    ;
    (PaGlobal_TimeAttack._uiRemainTime):SetText(converStringFromLeftDateTime(PaGlobal_TimeAttack:getExpiredTime()))
  end
end


