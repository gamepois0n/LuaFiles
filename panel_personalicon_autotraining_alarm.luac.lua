-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\righttopicons\panel_personalicon_autotraining_alarm.luac 

-- params : ...
-- function num : 0
local AutoTraining_Alarm = {_percentage = 0, _playerIsAutoTraining = false, _const = nil, _playerWrapper = nil, _s64_needExp = nil, _s64_exp = nil, _messageAt90Shown = false, 
_messageBoxData = {title = nil, content = nil, functionApply = nil, priority = nil, exitButton = false}
}
AutoTraining_Alarm.initialize = function(self)
  -- function num : 0_0
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  self._playerWrapper = selfPlayer:get()
  if self._playerWrapper == nil then
    return 
  end
  self._const = Defines.s64_const
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._messageBoxData).title = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAININGWARNING_TITLE")
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._messageBoxData).content = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAININGWARNING_CONTENT")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._messageBoxData).functionApply = PAGlobal_AutoTraining_Alarm_OnMessageConfirm
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._messageBoxData).priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW
end

PAGlobal_AutoTraining_Alarm_OnAutoTrainingStart = function()
  -- function num : 0_1 , upvalues : AutoTraining_Alarm
  local self = AutoTraining_Alarm
  self._playerIsAutoTraining = true
  self._s64_needExp = (self._playerWrapper):getNeedExp_s64()
  self._s64_exp = (self._playerWrapper):getExp_s64()
  self._messageAt90Shown = false
  registerEvent("FromClient_SelfPlayerExpChanged", "PAGlobal_AutoTraining_Alarm_CheckForExp")
  PAGlobal_AutoTraining_Alarm_CheckForExp()
end

PAGlobal_AutoTraining_Alarm_CheckForExp = function()
  -- function num : 0_2 , upvalues : AutoTraining_Alarm
  local selfPlayer = getSelfPlayer()
  local player = selfPlayer:get()
  local blackSpiritTraining = player:isApplyChargeSkill((CppEnums.UserChargeType).eUserChargeType_BlackSpritTraining)
  local blackSpiritSkillTraining = player:isApplyChargeSkill((CppEnums.UserChargeType).eUserChargeType_BlackSpritSkillTraining)
  if blackSpiritSkillTraining and not blackSpiritTraining then
    return 
  end
  local self = AutoTraining_Alarm
  if self._playerIsAutoTraining == false or self._const == nil or self._s64_needExp == nil or self._s64_exp == nil then
    return 
  end
  self._s64_exp = (self._playerWrapper):getExp_s64()
  local rate = Int64toInt32(self._s64_exp * (Defines.s64_const).s64_100 / self._s64_needExp)
  if rate >= 90 and self._messageAt90Shown == false then
    self._messageAt90Shown = true
    ;
    (MessageBox.showMessageBox)(self._messageBoxData)
  else
    if rate >= 98 then
      self._playerIsAutoTraining = false
      self._s64_needExp = nil
      self._s64_exp = nil
      ;
      (MessageBox.showMessageBox)(self._messageBoxData)
      unregisterEvent("FromClient_SelfPlayerExpChanged", "PAGlobal_AutoTraining_Alarm_CheckForExp")
    end
  end
end

PAGlobal_AutoTraining_Alarm_OnAutoTrainingEnd = function()
  -- function num : 0_3 , upvalues : AutoTraining_Alarm
  local self = AutoTraining_Alarm
  self._playerIsAutoTraining = false
  self._s64_needExp = nil
  self._s64_exp = nil
  unregisterEvent("FromClient_SelfPlayerExpChanged", "PAGlobal_AutoTraining_Alarm_CheckForExp")
end

PAGlobal_AutoTraining_Alarm_OnMessageConfirm = function()
  -- function num : 0_4
end

registerEvent("FromClient_luaLoadComplete", "luaLoadComplete")
luaLoadComplete = function()
  -- function num : 0_5 , upvalues : AutoTraining_Alarm
  AutoTraining_Alarm:initialize()
end


