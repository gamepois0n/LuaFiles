-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\timeattack\timeattack.luac 

-- params : ...
-- function num : 0
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_TimeAttack")
registerEvent("FromClient_startTimeAttack", "FromClient_startTimeAttack")
registerEvent("FromClient_endTimeAttack", "FromClient_endTimeAttack")
Panel_TimeAttack:SetShow(false)
PaGlobal_TimeAttack = {_expiredTime = 0, _isProgress = false, _uiTitle = (UI.getChildControl)(Panel_TimeAttack, "StaticText_Title"), _uiRemainTime = (UI.getChildControl)(Panel_TimeAttack, "StaticText_BossName")}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TimeAttack.openTimeAttack = function(self)
  -- function num : 0_0
  Panel_TimeAttack:SetShow(true)
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TimeAttack.closeTimeAttack = function(self)
  -- function num : 0_1
  Panel_TimeAttack:SetShow(false)
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TimeAttack.setInfo = function(self, expiredTime)
  -- function num : 0_2
  self._expiredTime = expiredTime
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TimeAttack.getExpiredTime = function(self)
  -- function num : 0_3
  return self._expiredTime
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

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

FromClient_endTimeAttack = function(isSuccess, clearTime)
  -- function num : 0_6
  local msg = {}
  if isSuccess == 1 then
    local timeString = ((Util.Time).timeFormatting)(clearTime)
    msg.main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TIMAATTACK_SUCCESSMSG", "time", timeString)
    msg.sub = ""
    msg.addMsg = ""
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 70)
  else
    do
      if isSuccess == 0 then
        msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_TIMAATTACK_FAILMSG")
        msg.sub = ""
        msg.addMsg = ""
        Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 71)
      end
      -- DECOMPILER ERROR at PC40: Confused about usage of register: R3 in 'UnsetPending'

      PaGlobal_TimeAttack._isProgress = false
      PaGlobal_TimeAttack:closeTimeAttack()
    end
  end
end

FromClient_luaLoadComplete_TimeAttack = function()
  -- function num : 0_7
  local isProgress = ToClient_isProgressTimeAttack()
  if isProgress == true then
    local expiredTime = ToClient_getTimeAttackExpiredTime()
    FromClient_startTimeAttack(expiredTime)
  end
end

Panel_TimeAttack:RegisterUpdateFunc("PaGlobal_UpdateTimeAttack")
PaGlobal_UpdateTimeAttack = function()
  -- function num : 0_8
  if PaGlobal_TimeAttack:isProgress() == true then
    (PaGlobal_TimeAttack._uiRemainTime):SetText(converStringFromLeftDateTime(PaGlobal_TimeAttack:getExpiredTime()))
  end
end


