-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\common\common_consoleui.luac 

-- params : ...
-- function num : 0
local TYPE = CppEnums.PA_CONSOLE_UI_SIMPLIFY_TYPE
PaGlobal_ConsoleUISimplifyManager = {
_simpleUIList = {Panel_ConsoleHpMpGauge, Panel_ConsoleAutoPotion, Panel_MainStatus, Panel_Console_QuickSlot, Panel_ConsoleEnemyGauge, Panel_ConsoleHouseIcon, Panel_ConsoleQuest, Panel_ConsoleServantIcon, Panel_Console_MainQuest, Panel_Console_CheckedQuest, Panel_Console_Rader, Panel_Console_PersonalIcon, Panel_Console_Menu, Panel_Console_Party}
, 
_mainUIList = {Panel_MainStatus_User_Bar, Panel_MainQuest, Panel_CheckedQuest, Panel_ChallengeReward_Alert, Panel_UIMain, Panel_Radar, Panel_QuickSlot, Panel_SelfPlayerExpGage, Panel_PersonalIcon, Panel_PersonalIcon_Left, Panel_TimeBar, Panel_GameTips, Panel_GameTipMask, Panel_Chat0, Panel_UIMain_Console}
, _simplifyMode = TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_NOTEVENT, _currentTime = 0, _isUpdate = false}
-- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleUISimplifyManager.initialize = function(self)
  -- function num : 0_0 , upvalues : TYPE
  for key,value in pairs(PaGlobal_ConsoleUISimplifyManager._simpleUIList) do
    value:setConsoleUIPanelType(TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_ALWAYS)
  end
  for key,value in pairs(PaGlobal_ConsoleUISimplifyManager._mainUIList) do
    value:setConsoleUIPanelType(TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_MAINSTATUS)
  end
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleUISimplifyManager.OpenUIList = function(self, index)
  -- function num : 0_1 , upvalues : TYPE
  if typeState == TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_SIMPLIFY then
    for key,value in pairs(PaGlobal_ConsoleUISimplifyManager._simpleUIList) do
      value:SetShow(true)
    end
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleUISimplifyManager.CloseUIList = function(self, index)
  -- function num : 0_2
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_ConsoleUISimplifyManager.changeMode = function(self, typeState)
  -- function num : 0_3 , upvalues : TYPE
  if typeState == TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_SIMPLIFY then
    for key,value in pairs(PaGlobal_ConsoleUISimplifyManager._simpleUIList) do
      value:SetShow(true)
    end
    for key,value in pairs(PaGlobal_ConsoleUISimplifyManager._mainUIList) do
      value:SetShow(false)
    end
  else
    do
      if typeState == TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_MAINSTATUS then
        for key,value in pairs(PaGlobal_ConsoleUISimplifyManager._simpleUIList) do
          value:SetShow(false)
        end
        for key,value in pairs(PaGlobal_ConsoleUISimplifyManager._mainUIList) do
          value:SetShow(true)
        end
      end
    end
  end
end

local callOnce = false
-- DECOMPILER ERROR at PC63: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ConsoleUISimplifyManager.update = function(self, deltaTime)
  -- function num : 0_4 , upvalues : callOnce, TYPE
  if self._isUpdate == false then
    self._currentTime = 0
    callOnce = false
    return 
  end
  self._currentTime = self._currentTime + deltaTime
  if self._currentTime < 0.1 and callOnce == false then
    if self._simplifyMode == TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_SIMPLIFY then
      ToClient_setSimplyfiyMode(TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_SIMPLIFY)
      callOnce = true
    else
      if self._simplifyMode == TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_MAINSTATUS then
        ToClient_setSimplyfiyMode(TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_MAINSTATUS)
        callOnce = true
      end
    end
  end
  if self._currentTime > 0.1 then
    if self._simplifyMode == TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_SIMPLIFY then
      ToClient_simplify_Show()
    else
      if self._simplifyMode == TYPE.eCONSOLE_UI_SIMPLIFY_TYPE_MAINSTATUS then
        ToClient_simplify_Hide()
      end
    end
    self._currentTime = 0
    self._isUpdate = false
    callOnce = false
  end
end

ConsoleUISimplifyPerFrameUpdate = function(deltaTime)
  -- function num : 0_5
  PaGlobal_ConsoleUISimplifyManager:update(deltaTime)
end

FromClient_setSimplify_Signal = function(typeState)
  -- function num : 0_6
  if ToClient_getSimplyfiyMode() == typeState then
    _PA_LOG("광운", "똑같�\128 �\147 2�\136 하게 할지 말아�\188!!!")
    return 
  end
  if PaGlobal_ConsoleUISimplifyManager._isUpdate ~= false then
    return 
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_ConsoleUISimplifyManager._isUpdate = true
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_ConsoleUISimplifyManager._simplifyMode = typeState
end

PaGlobal_ConsoleUISimplifyManager:initialize()
registerEvent("FromClient_setSimplify_Signal", "FromClient_setSimplify_Signal")

