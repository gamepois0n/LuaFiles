-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\globalkeybinder\new_globalkeybinder.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local UIMode = Defines.UIMode
local _uiMode = UIMode.eUIMode_Default
local mouseKeyTable = {}
local isOnlyCombat = false
local curProcessedInputType = (CppEnums.UiInputType).UiInputType_Undefined
local escHandle = false
PaGlobal_GlobalKeyBinder = {
_uiMode = {}
}
-- DECOMPILER ERROR at PC20: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Update = function(self, deltaTime)
  -- function num : 0_0 , upvalues : IM
  local curUIMode = (GetUIMode())
  local rv = nil
  rv = (self.Process_Normal)(deltaTime)
  if rv == true then
    self:Clear()
    return 
  end
  if getInputMode() == IM.eProcessorInputMode_ChattingInputMode then
    (self.Process_ChattingInputMode)(deltaTime)
    return 
  end
  if (self._uiMode)[curUIMode] == nil or ((self._uiMode)[curUIMode])._keyBinderData == nil then
    self:Clear()
    return 
  end
  local KeyBinder = ((self._uiMode)[curUIMode])._keyBinderData
  if ((self._uiMode)[curUIMode])._setInputMode ~= nil then
    (UI.Set_ProcessorInputMode)(((self[curUIMode])._uiMode)._setInputMode)
  end
  for i in pairs(KeyBinder) do
    if ((KeyBinder[i])._CustomCondition)() == true then
      ((KeyBinder[i])._ProcessFunc)(deltaTime)
    end
  end
  self:Clear()
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Register = function(self, uiMode, func, setInputMode, customCondition)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R5 in 'UnsetPending'

  if (self._uiMode)[uiMode] == nil then
    (self._uiMode)[uiMode] = {}
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self._uiMode)[uiMode])._setInputMode = inputMode
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R5 in 'UnsetPending'

  if ((self._uiMode)[uiMode])._keyBinderData == nil then
    ((self._uiMode)[uiMode])._keyBinderData = {}
  end
  do
    if customCondition == nil then
      local defaultCondition = function()
    -- function num : 0_1_0
    return true
  end

      customCondition = defaultCondition
    end
    local idx = #((self._uiMode)[uiMode])._keyBinderData + 1
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (((self._uiMode)[uiMode])._keyBinderData)[idx] = {_ProcessFunc = func, _CustomCondition = customCondition}
  end
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Init = function(self)
  -- function num : 0_2 , upvalues : IM, UIMode
  local checkCustomCondition_CommonWindow = function()
    -- function num : 0_2_0 , upvalues : IM
    do
      local curMode = getInputMode()
      do return curMode == IM.eProcessorInputMode_GameMode or curMode == IM.eProcessorInputMode_UiMode or curMode == IM.eProcessorInputMode_UiControlMode end
      -- DECOMPILER ERROR: 1 unprocessed JMP targets
    end
  end

  local checkCustomCondition_GameMode = function()
    -- function num : 0_2_1 , upvalues : IM
    do return getInputMode() == IM.eProcessorInputMode_GameMode end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  local checkCustomCondition_NotChattingMode = function()
    -- function num : 0_2_2 , upvalues : IM
    do return getInputMode() ~= IM.eProcessorInputMode_ChattingInputMode end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end

  self:Register(UIMode.eUIMode_Default, self.Process_UIMode_CommonWindow, nil, checkCustomCondition_CommonWindow)
  self:Register(UIMode.eUIMode_Default, self.Process_GameMode, nil, checkCustomCondition_GameMode)
  self:Register(UIMode.eUIMode_Default, self.Process_UIMode_SkillkeyBinder, nil, checkCustomCondition_CommonWindow)
  self:Register(UIMode.eUIMode_Default, self.Process_UiModeNotInput, nil, checkCustomCondition_NotChattingMode)
  self:Register(UIMode.eUIMode_Default, self.Process_ChattingMacro)
  self:Register(UIMode.eUIMode_Housing, self.Process_UIMode_Housing)
  self:Register(UIMode.eUIMode_Mental, self.Process_UIMode_Mental, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_MentalGame, self.Process_UIMode_MentalGame, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_NpcDialog, self.Process_UIMode_NpcDialog, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_Trade, self.Process_UIMode_Trade, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_WorldMap, self.Process_UIMode_WorldMap, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_Stable, self.Process_UIMode_Stable, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_MiniGame, self.Process_UIMode_MiniGame, IM.eProcessorInputMode_GameMode)
  self:Register(UIMode.eUIMode_DeadMessage, self.Process_UIMode_DeadMessage, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_PreventMoveNSkill, self.Process_UIMode_PreventMoveNSkill, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_Movie, self.Process_UIMode_Movie, IM.eProcessorInputMode_GameMode)
  self:Register(UIMode.eUIMode_GameExit, self.Process_UIMode_GameExit, IM.eProcessorInputMode_UiModeNotInput)
  self:Register(UIMode.eUIMode_Repair, self.Process_UIMode_Repair, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_KeyCustom_ActionKey, self.Process_UIMode_KeyCustom_ActionKey, IM.eProcessorInputMode_KeyCustomizing)
  self:Register(UIMode.eUIMode_KeyCustom_ActionPad, self.Process_UIMode_KeyCustom_ActionPad, IM.eProcessorInputMode_KeyCustomizing)
  self:Register(UIMode.eUIMode_KeyCustom_UiKey, self.Process_UIMode_KeyCustom_UiKey, IM.eProcessorInputMode_KeyCustomizing)
  self:Register(UIMode.eUIMode_KeyCustom_UiPad, self.Process_UIMode_KeyCustom_UiPad, IM.eProcessorInputMode_KeyCustomizing)
  self:Register(UIMode.eUIMode_KeyCustom_ActionPadFunc1, self.Process_UIMode_KeyCustom_ActionPadFunc1, IM.eProcessorInputMode_KeyCustomizing)
  self:Register(UIMode.eUIMode_KeyCustom_ActionPadFunc2, self.Process_UIMode_KeyCustom_ActionPadFunc2, IM.eProcessorInputMode_KeyCustomizing)
  self:Register(UIMode.eUIMode_PopupItem, self.Process_UIMode_PopupItem, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_Extraction, self.Process_UIMode_Extraction, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_InGameCustomize, self.Process_UIMode_InGameCustomize, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_InGameCashShop, self.Process_UIMode_InGameCashShop, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_DyeNew, self.Process_UIMode_Dye, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_ItemMarket, self.Process_UIMode_ItemMarket, IM.eProcessorInputMode_UiModeNotInput)
  self:Register(UIMode.eUIMode_ProductNote, self.Process_UIMode_ProductNote)
  self:Register(UIMode.eUIMode_QnAWebLink, self.Process_UIMode_QnAWebLink)
  self:Register(UIMode.eUIMode_TradeGame, self.Process_UIMode_TradeGame, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_Cutscene, self.Process_UIMode_CutSceneMode)
  self:Register(UIMode.eUIMode_UiSetting, self.Process_UIMode_UiSetting, IM.eProcessorInputMode_UiMode)
  self:Register(UIMode.eUIMode_Gacha_Roulette, self.Process_UIMode_Gacha_Roulette, IM.eProcessorInputMode_UiModeNotInput)
  self:Register(UIMode.eUIMode_EventNotify, self.Process_UIMode_EventNotify)
  self:Register(UIMode.eUIMode_WoldMapSearch, self.Process_WorldMapSearch)
  self:Register(UIMode.eUIMode_ScreenShotMode, self.Process_UIMode_ScreenShotMode, IM.eProcessorInputMode_UiModeNotInput)
  self:Register(UIMode.eUIMode_InGameDance, self.Process_UIMode_InGameDance, IM.eProcessorInputMode_UiMode)
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.Clear = function(self)
  -- function num : 0_3 , upvalues : mouseKeyTable
  mouseKeyTable = {}
end

GlobalKeyBinder_MouseKeyMap = function(uiInputType)
  -- function num : 0_4 , upvalues : mouseKeyTable
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  mouseKeyTable[uiInputType] = true
  PaGlobal_GlobalKeyBinder:Update(0)
end

GlobalKeyBinder_CheckKeyPressed = function(keyCode)
  -- function num : 0_5
  return isKeyDown_Once(keyCode)
end

GlobalKeyBinder_CheckCustomKeyPressed = function(uiInputType)
  -- function num : 0_6 , upvalues : mouseKeyTable, VCK
  do return (keyCustom_IsDownOnce_Ui(uiInputType) or mouseKeyTable[uiInputType]) and not GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_MENU) and not isPhotoMode() end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

SetUIMode = function(uiMode)
  -- function num : 0_7 , upvalues : UIMode, _uiMode
  if uiMode >= 0 and uiMode < UIMode.eUIMode_Count then
    _uiMode = uiMode
  end
end

GetUIMode = function()
  -- function num : 0_8 , upvalues : _uiMode
  return _uiMode
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_GlobalKeyBinder.CheckMouseDragEvent = function(self)
  -- function num : 0_9 , upvalues : VCK, escHandle
  if DragManager:isDragging() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    DragManager:clearInfo()
    Inventory_DropEscape()
    escHandle = true
  else
    escHandle = false
  end
end

getEscHandle = function()
  -- function num : 0_10 , upvalues : escHandle
  return escHandle
end

getCurProcessedInputType = function()
  -- function num : 0_11 , upvalues : VCK
  local undefined = (CppEnums.UiInputType).UiInputType_Undefined
  if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_MENU) and isPhotoMode() then
    return undefined
  end
  if undefined ~= uiInputType then
    return uiInputType
  end
  return undefined
end

FromClient_GlobalKeyBinderUpdate = function(deltaTime)
  -- function num : 0_12
  PaGlobal_GlobalKeyBinder:CheckMouseDragEvent()
  PaGlobal_GlobalKeyBinder:Update(deltaTime)
end

GlobalKeyBinder_Null = function()
  -- function num : 0_13
end

FromClient_GlobalKeyBinderLoad = function()
  -- function num : 0_14 , upvalues : isOnlyCombat
  isOnlyCombat = ToClient_isFakeUIMode()
  PaGlobal_GlobalKeyBinder:Init()
  if isOnlyCombat == true then
    registerEvent("EventGlobalKeyBinder", "GlobalKeyBinder_Null")
  else
    registerEvent("EventGlobalKeyBinder", "FromClient_GlobalKeyBinderUpdate")
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_GlobalKeyBinderLoad")

