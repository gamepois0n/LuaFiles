-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\summonbosstutorial_manager.luac 

-- params : ...
-- function num : 0
Panel_SummonBossTutorial:RegisterUpdateFunc("FGlobal_SummonBossTutorialManager_UpdatePerFrame")
local summonText = {}
PaGlobal_SummonBossTutorial_Manager = {_isDoingSummonBossTutorial = false, _stepNo = 0, _updateTime = 0}
-- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.isDoingSummonBossTutorial = function(self)
  -- function num : 0_0
  return self._isDoingSummonBossTutorial
end

-- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.setDoingSummonBossTutorial = function(self, bDoing)
  -- function num : 0_1
  self._isDoingSummonBossTutorial = bDoing
end

-- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.checkPossibleTutorial = function(self, index)
  -- function num : 0_2
  if PaGlobal_TutorialManager:isDoingTutorial() == true or PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GLOBALKEYBINDER_TUTORIALALERT"))
    return false
  end
  if isFlushedUI() then
    return false
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return false
  end
  local inventory = (selfPlayer:get()):getInventoryByType((CppEnums.ItemWhereType).eInventory)
  if inventory == nil then
    return false
  end
  local hasSummonItem = true
  -- DECOMPILER ERROR at PC57: Unhandled construct in 'MakeBoolean' P1

  if index == 0 and toInt64(0, 0) == inventory:getItemCount_s64(ItemEnchantKey(42000, 1)) then
    hasSummonItem = false
  end
  if index == 1 and toInt64(0, 0) == inventory:getItemCount_s64(ItemEnchantKey(42001, 1)) then
    hasSummonItem = false
  end
  if hasSummonItem == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SUMMONBOSSTUTORIAL_NOITEM"))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.startTutorial = function(self, index)
  -- function num : 0_3 , upvalues : summonText
  if self:checkPossibleTutorial(index) == false then
    return 
  end
  Panel_SummonBossTutorial:SetShow(true, true)
  PaGlobal_SummonBossTutorial_Manager:setDoingSummonBossTutorial(true)
  PaGlobal_SummonBossTutorial_UiManager:hideAllTutorialUi()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(false)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._bubbleKey_R):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):EraseAllEffect()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
  ;
  (PaGlobal_SummonBossTutorial_UiManager:getUiKeyButton()):ButtonToggleAll(false)
  ;
  (PaGlobal_SummonBossTutorial_UiManager:getUiKeyButton()):setShowAll(false)
  ;
  (PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit()):hideBubbleKey()
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R2 in 'UnsetPending'

  if index == 0 then
    summonText[0] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_23")
    -- DECOMPILER ERROR at PC116: Confused about usage of register: R2 in 'UnsetPending'

    summonText[1] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_24")
    -- DECOMPILER ERROR at PC123: Confused about usage of register: R2 in 'UnsetPending'

    summonText[2] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_26")
  else
    -- DECOMPILER ERROR at PC133: Confused about usage of register: R2 in 'UnsetPending'

    if index == 1 then
      summonText[0] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_29")
      -- DECOMPILER ERROR at PC140: Confused about usage of register: R2 in 'UnsetPending'

      summonText[1] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_30")
      -- DECOMPILER ERROR at PC147: Confused about usage of register: R2 in 'UnsetPending'

      summonText[2] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_31")
    else
      -- DECOMPILER ERROR at PC157: Confused about usage of register: R2 in 'UnsetPending'

      if index == 2 then
        summonText[0] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_50")
        -- DECOMPILER ERROR at PC164: Confused about usage of register: R2 in 'UnsetPending'

        summonText[1] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_51")
        -- DECOMPILER ERROR at PC171: Confused about usage of register: R2 in 'UnsetPending'

        summonText[2] = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_52")
      end
    end
  end
  self._stepNo = 51
  self:setDoingSummonBossTutorial(true)
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.updateDeltaTime_SummonBoss_Step1 = function(self, deltaTime)
  -- function num : 0_4 , upvalues : summonText
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(false)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._bubbleKey_I):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetText(summonText[0])
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetText(summonText[1])
  local textSizeX = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeX()
  local textSizeY = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeY()
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetSize((((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeX() + (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._bubbleKey_I):GetSizeX() + 30, (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeY() + textSizeY + 40)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetSize(textSizeX, textSizeY)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetPosX(scrX / 2 - (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):GetSizeX() / 2 - (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):GetSizeX() / 2)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetPosY(100)
  local obsidianX = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):GetPosX()
  local obsidianY = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):GetPosY()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosX(obsidianX + 80)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosY(obsidianY + 30)
  local obsidianB_X = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosX()
  local obsidianB_Y = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosY()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosY(obsidianB_Y + 25)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._bubbleKey_I):SetPosX((((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetPosX() + (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeX() + 10)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._bubbleKey_I):SetPosY((((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetPosY())
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosY((((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetPosY() + textSizeY + 5)
  local invenOpenCheck = Panel_Window_Inventory:GetShow()
  self._updateTime = self._updateTime + deltaTime
  if invenOpenCheck or self._updateTime > 20 then
    if not Panel_Window_Inventory:GetShow() then
      InventoryWindow_Show()
    end
    audioPostEvent_SystemUi(4, 12)
    self._updateTime = 0
    self._stepNo = 52
    ;
    (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._bubbleKey_I):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.updateDeltaTime_SummonBoss_Step2 = function(self, deltaTime)
  -- function num : 0_5 , upvalues : summonText
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(false)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_25"))
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetText(summonText[2])
  local textSizeX = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeX()
  local textSizeY = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeY()
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetSize((((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeX() + 20, (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeY() + textSizeY + 40)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetSize(textSizeX, textSizeY)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetPosX(scrX / 2 - (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):GetSizeX() / 2 - (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):GetSizeX() / 2)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetPosY(100)
  local obsidianX = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):GetPosX()
  local obsidianY = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):GetPosY()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosX(obsidianX + 80)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosY(obsidianY + 30)
  local obsidianB_X = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosX()
  local obsidianB_Y = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosY()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosY(obsidianB_Y + 25)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosY((((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetPosY() + textSizeY + 5)
  if FGlobal_FirstSummonItemUse() then
    self._updateTime = 0
    self._stepNo = 53
  end
  if not Panel_Window_Inventory:GetShow() then
    self._updateTime = 0
    self._stepNo = 0
    PaGlobal_SummonBossTutorial_Manager:endTutorial()
  end
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.updateDeltaTime_SummonBoss_Step3 = function(self, deltaTime)
  -- function num : 0_6
  self._updateTime = self._updateTime + deltaTime
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B_Left):SetShow(false)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetShow(true)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_27"))
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_28"))
  local textSizeX = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeX()
  local textSizeY = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetTextSizeY()
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetSize((((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeX() + 20, (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):GetTextSizeY() + textSizeY + 40)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetSize(textSizeX, textSizeY)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetPosX(scrX / 2 - (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):GetSizeX() / 2 - (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):GetSizeX() / 2)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):SetPosY(100)
  local obsidianX = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):GetPosX()
  local obsidianY = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian):GetPosY()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosX(obsidianX + 80)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):SetPosY(obsidianY + 30)
  local obsidianB_X = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosX()
  local obsidianB_Y = (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_B):GetPosY()
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):SetPosY(obsidianB_Y + 25)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosX(obsidianB_X + 3)
  ;
  (((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text_2):SetPosY((((PaGlobal_SummonBossTutorial_UiManager:getUiBlackSpirit())._ui)._obsidian_Text):GetPosY() + textSizeY + 5)
  if self._updateTime > 8 then
    self._updateTime = 0
    self._stepNo = 0
    PaGlobal_SummonBossTutorial_Manager:endTutorial()
  end
end

FGlobal_SummonBossTutorialManager_UpdatePerFrame = function(deltaTime)
  -- function num : 0_7
  PaGlobal_SummonBossTutorial_Manager:updatePerFrame(deltaTime)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.updatePerFrame = function(self, deltaTime)
  -- function num : 0_8
  if self._stepNo == 51 then
    self:updateDeltaTime_SummonBoss_Step1(deltaTime)
  else
    if self._stepNo == 52 then
      self:updateDeltaTime_SummonBoss_Step2(deltaTime)
    else
      if self._stepNo == 53 then
        self:updateDeltaTime_SummonBoss_Step3(deltaTime)
      end
    end
  end
end

local summonBossQuest = {
groupId = {654, 655}
, 
questId = {3, 5}
}
-- DECOMPILER ERROR at PC53: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.checkQuestCondition = function(self)
  -- function num : 0_9 , upvalues : summonBossQuest
  for index = 1, #summonBossQuest.groupId do
    local bossTutorialProgress = questList_hasProgressQuest((summonBossQuest.groupId)[index], (summonBossQuest.questId)[index])
    if bossTutorialProgress then
      local uiQuestInfo = ToClient_GetQuestInfo((summonBossQuest.groupId)[index], (summonBossQuest.questId)[index])
      local questCondition = uiQuestInfo:getDemandAt(0)
      if questCondition._destCount <= questCondition._currentCount then
        PaGlobal_SummonBossTutorial_Manager:endTutorial()
        return 
      end
    end
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_SummonBossTutorial_Manager.endTutorial = function(self)
  -- function num : 0_10
  Panel_SummonBossTutorial:SetShow(false, true)
  self._isDoingSummonBossTutorial = false
end


