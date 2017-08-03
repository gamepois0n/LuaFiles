-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\tutorial\tutorial_manager.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialManager = {_isDoingTutorial = false, _currentPhaseNo = 0, _isInitialized = false, _isAllowCallBlackSpirit = false, _isAllowShowQuickSlot = true, _isAllowNewQuickSlot = true, _isAllowMainQuestWidget = true, _classType = 0, 
_phaseList = {}
, 
_classBasicSkillPhaseList = {}
, _skippableLevel = 50, 
_questList = {
[1] = {_questGroupNo = 650, _questId = 1}
, 
[2] = {_questGroupNo = 650, _questId = 2}
, 
[3] = {_questGroupNo = 650, _questId = 3}
, 
[4] = {_questGroupNo = 653, _questId = 5}
, 
[5] = {_questGroupNo = 1001, _questId = 71}
, 
[6] = {_questGroupNo = 653, _questId = 7}
, 
[7] = {_questGroupNo = 2039, _questId = 2}
, 
[8] = {_questGroupNo = 2039, _questId = 3}
, 
[10] = {_questGroupNo = 654, _questId = 4}
, 
[11] = {_questGroupNo = 658, _questId = 8}
}
, 
_checkPointList = {
[1] = {_phaseNo = 1, _stepNo = 1}
, 
[2] = {_phaseNo = 5, _stepNo = 2}
, 
[3] = {_phaseNo = 5, _stepNo = 3}
, 
[4] = {_phaseNo = 6, _stepNo = 1}
, 
[5] = {_phaseNo = 7, _stepNo = 1}
, 
[6] = {_phaseNo = 7, _stepNo = 2}
, 
[7] = {_phaseNo = 8, _stepNo = 1}
, 
[8] = {_phaseNo = 8, _stepNo = 2}
, 
[9] = {_phaseNo = 9, _stepNo = 1}
, 
[10] = {_phaseNo = 14, _stepNo = 1}
, 
[11] = {_phaseNo = 15, _stepNo = 1}
, 
[13] = {_phaseNo = 17, _stepNo = 1}
, 
[15] = {_phaseNo = 20, _stepNo = 1}
}
, 
_firstCutSceneList = {[1] = "CS_Velia_00_PHM_Start_0001.pas", [2] = "CS_Velia_00_PHW_Start_0001.pas", [3] = "CS_Velia_00_PGM_Start_0001.pas", [4] = "CS_Velia_00_PBW_Start_0001.pas", [5] = "CS_Velia_00_PKM_Start_0001.pas", [6] = "CS_Velia_00_PEW_Start_0001.pas", [7] = "CS_Velia_00_PVW_Start_0001.pas", [8] = "CS_Velia_00_PKW_Start_0001.pas", [9] = "CS_Velia_00_PWM_Start_0001.pas", [10] = "CS_Velia_00_PWW_Start_0001.pas", [11] = "CS_Velia_00_PNW_Start_0001.pas", [12] = "CS_Velia_00_PNM_Start_0001.pas"}
}
Panel_Tutorial:RegisterUpdateFunc("FGlobal_TutorialManager_UpdatePerFrame")
timeRatio = 1
tutotest = function(phaseNo, stepNo, ratio)
  -- function num : 0_0
  PaGlobal_TutorialManager:startTutorial(phaseNo, stepNo)
  if ratio ~= nil then
    timeRatio = ratio
  end
end

tutoend = function()
  -- function num : 0_1
  PaGlobal_TutorialManager:endTutorial()
end

tutospeed = function(ratio)
  -- function num : 0_2
  timeRatio = ratio
end

-- DECOMPILER ERROR at PC139: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getClassType = function(self)
  -- function num : 0_3
  return self._classType
end

FGlobal_TutorialManager_UpdatePerFrame = function(deltaTime)
  -- function num : 0_4
  PaGlobal_TutorialManager:updatePerFrame(deltaTime)
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isDoingTutorial = function(self)
  -- function num : 0_5
  if not Panel_Tutorial:GetShow() then
    return self._isDoingTutorial
  end
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setDoingTutorial = function(self, bDoing)
  -- function num : 0_6
  self._isDoingTutorial = bDoing
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.findCheckPointNoForContinue = function(self)
  -- function num : 0_7
  local checkPointNo = -1
  if questList_isClearQuest(650, 1) == false and questList_hasProgressQuest(650, 1) == false then
    checkPointNo = 1
  else
    if questList_hasProgressQuest(650, 1) == true then
      checkPointNo = 2
    else
      if questList_isClearQuest(650, 1) == true and questList_isClearQuest(650, 2) == false and questList_hasProgressQuest(650, 2) == false then
        checkPointNo = 2
      else
        if questList_hasProgressQuest(650, 2) == true then
          checkPointNo = 3
        else
          if questList_isClearQuest(650, 2) == true and questList_isClearQuest(650, 3) == false and questList_hasProgressQuest(650, 3) == false then
            checkPointNo = 4
          else
            if questList_hasProgressQuest(650, 3) == true and self:isSatisfiedQuestCondition(650, 3) == false then
              checkPointNo = 5
            else
              if questList_hasProgressQuest(650, 3) == true and self:isSatisfiedQuestCondition(650, 3) == true then
                checkPointNo = 6
              end
            end
          end
        end
      end
    end
  end
  if questList_hasProgressQuest(653, 5) == true and questList_isClearQuest(1001, 71) == false and questList_hasProgressQuest(1001, 71) == false then
    checkPointNo = 7
  else
    if questList_hasProgressQuest(653, 5) == true and questList_hasProgressQuest(1001, 71) == true and self:isSatisfiedQuestCondition(1001, 71) == false then
      checkPointNo = 8
    end
  end
  if questList_isClearQuest(653, 5) == true and questList_hasProgressQuest(653, 7) == true then
    checkPointNo = 9
  end
  if questList_hasProgressQuest(2039, 2) == true and self:isSatisfiedQuestCondition(2039, 2) == false then
    checkPointNo = 10
  end
  if questList_hasProgressQuest(658, 8) == true and self:isSatisfiedQuestCondition(658, 8) == false then
    checkPointNo = 15
  end
  return checkPointNo
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isSatisfiedQuestCondition = function(self, questGroupNo, questId)
  -- function num : 0_8
  local uiQuestInfo = ToClient_GetQuestInfo(questGroupNo, questId)
  if uiQuestInfo == nil then
    _PA_ASSERT(false, "퀘스트가 정보�\128 없어�\156 진행�\160 �\152 없습니다. 데이터가 �\128경된것인거나 루아테이블의 오타일수�\132 있습니다. PaGlobal_TutorialManager:isSatisfiedQuestCondition()")
    return nil
  end
  return uiQuestInfo:isSatisfied()
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.checkHaveOverLevelCharacter = function(self, destLevel)
  -- function num : 0_9
  local characterDataCount = getCharacterDataCount()
  local compLevel = self._skippableLevel
  if destLevel ~= nil then
    compLevel = destLevel
  end
  for index = 0, characterDataCount - 1 do
    local characterData = getCharacterDataByIndex(index)
    if compLevel <= characterData._level then
      return true
    end
  end
  return false
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.initialize = function(self)
  -- function num : 0_10
  if getSelfPlayer() ~= nil then
    self._classType = (getSelfPlayer()):getClassType()
  end
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[1] = PaGlobal_TutorialPhase_BasicMove
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[2] = PaGlobal_TutorialPhase_BasicControl
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[3] = PaGlobal_TutorialPhase_InteractionSupplyBox
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[4] = PaGlobal_TutorialPhase_InventoryAndQuickSlot
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[5] = PaGlobal_TutorialPhase_CallBlackSpirit
  self:initializeClassBasicSkillPhaseTable()
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[6] = self:getClassBasicSkillPhase()
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[7] = PaGlobal_TutorialPhase_FindRequestTarget
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[8] = PaGlobal_TutorialPhase_WesternGuardCamp
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[9] = PaGlobal_TutorialPhase_AncientStoneChamber
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[10] = PaGlobal_TutorialPhase_WorldmapNodeAndNavi
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[11] = PaGlobal_TutorialPhase_WorldmapBuyHouse
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[12] = PaGlobal_TutorialPhase_WorldmapMenu
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[13] = PaGlobal_TutorialPhase_Hidel_FindNearNpc
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[14] = PaGlobal_TutorialPhase_Hidel_Trade
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[15] = PaGlobal_TutorialPhase_Hidel_Worker
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[16] = PaGlobal_TutorialPhase_NewItemEquip
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[17] = PaGlobal_TutorialPhase_ItemSell
  -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[18] = PaGlobal_TutorialPhase_Enchant
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[19] = PaGlobal_TutorialPhase_ExtractionEnchantStone
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[20] = PaGlobal_TutorialPhase_WallRiding
  -- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[21] = PaGlobal_TutorialPhase_ItemSellPractice
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._phaseList)[22] = PaGlobal_TutorialPhase_EnchantStack
  self._isInitialized = true
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getClassBasicSkillPhase = function(self)
  -- function num : 0_11
  if self._classType ~= nil then
    return (self._classBasicSkillPhaseList)[self._classType]
  end
  _PA_ASSERT(false, "PaGlobal_TutorialManager:getClassBasicSkillPhase() : classType�\180 비정상적입니�\164.")
  return nil
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.initializeClassBasicSkillPhaseTable = function(self)
  -- function num : 0_12
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_Warrior] = PaGlobal_TutorialPhase_BasicSkill_Warrior
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_Sorcerer] = PaGlobal_TutorialPhase_BasicSkill_Sorcerer
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_Ranger] = PaGlobal_TutorialPhase_BasicSkill_Ranger
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_Giant] = PaGlobal_TutorialPhase_BasicSkill_Giant
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_Tamer] = PaGlobal_TutorialPhase_BasicSkill_Tamer
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_BladeMaster] = PaGlobal_TutorialPhase_BasicSkill_BladeMaster
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_BladeMasterWomen] = PaGlobal_TutorialPhase_BasicSkill_BladeMasterWomen
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_Valkyrie] = PaGlobal_TutorialPhase_BasicSkill_Valkyrie
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_NinjaMan] = PaGlobal_TutorialPhase_BasicSkill_NinjaMan
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_NinjaWomen] = PaGlobal_TutorialPhase_BasicSkill_NinjaWomen
  -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_Wizard] = PaGlobal_TutorialPhase_BasicSkill_Wizard
  -- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_WizardWomen] = PaGlobal_TutorialPhase_BasicSkill_WizardWomen
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_DarkElf] = PaGlobal_TutorialPhase_BasicSkill_DarkElf
  -- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[(CppEnums.ClassType).ClassType_Combattant] = PaGlobal_TutorialPhase_BasicSkill_Combattant
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._classBasicSkillPhaseList)[23] = PaGlobal_TutorialPhase_BasicSkill_CombattantWomen
  _PA_LOG("임승�\177", " CppEnums.ClassType.ClassType_CombattantWomen : " .. tostring((CppEnums.ClassType).ClassType_CombattantWomen))
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.checkPossibleTutorial = function(self, phaseNo)
  -- function num : 0_13
  if PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true then
    _PA_LOG("곽민�\176", "각성 튜토리얼 진행중이�\128�\156 튜토리얼�\132 시작시키�\128 않습니다. phaseNo : " .. tostring(phaseNo))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.continueTutorial = function(self)
  -- function num : 0_14
  local checkPointNo = self:findCheckPointNoForContinue()
  if checkPointNo == -1 then
    _PA_LOG("곽민�\176", "튜토리얼�\132 이어�\156 �\160 �\128점을 찾을 �\152 없어�\156 튜토리얼�\132 시작하지 않습니다. 만약 튜토리얼�\132 진행해야 하는 상황이라�\180 체크포인트를 찾는 조건�\132 확인해주세요. findCheckPointNoForContinue()")
    return 
  end
  local destCheckPoint = (self._checkPointList)[checkPointNo]
  if destCheckPoint == nil or destCheckPoint._phaseNo == nil or destCheckPoint._stepNo == nil then
    _PA_LOG("곽민�\176", "튜토리얼 checkPoint정보�\128 없습니다.")
    return 
  end
  self:initialize()
  self:startTutorial(destCheckPoint._phaseNo, destCheckPoint._stepNo)
end

-- DECOMPILER ERROR at PC174: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.startTutorial = function(self, phaseNo, stepNo, typeNo)
  -- function num : 0_15
  _PA_LOG("곽민�\176", "#####튜토리얼 시작시도#####")
  if PaGlobal_AutoManager._ActiveState == true then
    PaGlobal_AutoManager:stop()
  end
  if self:checkPossibleTutorial(phaseNo) == false then
    _PA_LOG("곽민�\176", "튜토리얼 시작 조건�\132 만족하지 못해�\156 시작하지 않습니다. phaseNo : " .. tostring(phaseNo))
    return 
  end
  if self._isInitialized == false then
    self:initialize()
  end
  local destPhaseNo = 0
  if phaseNo == nil or phaseNo == 0 then
    destPhaseNo = 1
  else
    destPhaseNo = phaseNo
  end
  if self:getPhase(destPhaseNo) == nil then
    _PA_LOG("곽민�\176", "시작하려�\148 페이즈가 없습니다. destPhaseNo : " .. tostring(destPhaseNo))
    return 
  end
  local destStepNo = 0
  if stepNo == nil or stepNo == 0 then
    destStepNo = 1
  else
    destStepNo = stepNo
  end
  local destTypeNo = 0
  if typeNo == nil or typeNo == 0 then
    destTypeNo = 1
  else
    destTypeNo = typeNo
  end
  ;
  ((self._phaseList)[destPhaseNo]):startPhase(destStepNo, destTypeNo)
end

-- DECOMPILER ERROR at PC177: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.startNextPhase = function(self)
  -- function num : 0_16
  self._currentPhaseNo = self._currentPhaseNo + 1
  if self._currentPhaseNo > 0 and (self._phaseList)[self._currentPhaseNo] == nil then
    self:endTutorial()
  else
    ;
    ((self._phaseList)[self._currentPhaseNo]):startPhase(1, 1)
  end
end

-- DECOMPILER ERROR at PC180: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.endTutorial = function(self)
  -- function num : 0_17
  self:setDoingTutorial(false)
  if self._currentPhaseNo == 1 then
    (getSelfPlayer()):setActionChart("WAIT")
  end
  Panel_Tutorial:SetShow(false, true)
  FGlobal_NewQuickSlot_Update()
  QuickSlot_UpdateData()
  PaGlobal_TutorialUiManager:restoreAllUiByUserSetting()
  self:setAllowCallBlackSpirit(true)
  self:setCurrentPhaseNo(0)
  _PA_LOG("곽민�\176", "#####튜토리얼 종료#####")
end

-- DECOMPILER ERROR at PC183: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getCurrentPhase = function(self)
  -- function num : 0_18
  if (self._phaseList)[self._currentPhaseNo] == nil then
    return nil
  end
  return (self._phaseList)[self._currentPhaseNo]
end

-- DECOMPILER ERROR at PC186: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setCurrentPhaseNo = function(self, phaseNo)
  -- function num : 0_19
  self._currentPhaseNo = phaseNo
end

-- DECOMPILER ERROR at PC189: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getPhase = function(self, phaseNo)
  -- function num : 0_20
  return (self._phaseList)[phaseNo]
end

-- DECOMPILER ERROR at PC192: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.updatePerFrame = function(self, deltaTime)
  -- function num : 0_21
  if self:getCurrentPhase() ~= nil and self:isDoingTutorial() == true then
    (self:getCurrentPhase()):updatePerFrame(deltaTime)
  end
end

-- DECOMPILER ERROR at PC195: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getQuestIdByQuestNoRaw = function(self, questNoRaw)
  -- function num : 0_22
  return (math.floor)(questNoRaw / 65536)
end

-- DECOMPILER ERROR at PC198: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getQuestGroupNoByQuestNoRaw = function(self, questNoRaw)
  -- function num : 0_23
  return questNoRaw % 65536
end

-- DECOMPILER ERROR at PC201: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getQuestNoRawByQuestGroupNoAndQuestId = function(self, questGroupNo, questId)
  -- function num : 0_24
  return questId * 65536 + questGroupNo
end

-- DECOMPILER ERROR at PC204: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setAllowCallBlackSpirit = function(self, bAllow)
  -- function num : 0_25
  self._isAllowCallBlackSpirit = bAllow
end

-- DECOMPILER ERROR at PC207: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isAllowCallBlackSpirit = function(self)
  -- function num : 0_26
  return self._isAllowCallBlackSpirit
end

-- DECOMPILER ERROR at PC210: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isBeginnerTutorialQuest = function(self, questGroupNo, questId)
  -- function num : 0_27
  for index,value in pairs(self._questList) do
    if value._questGroupNo == questGroupNo and value._questId == questId then
      return true
    end
  end
  return false
end

-- DECOMPILER ERROR at PC213: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isSkippablePhase = function(self, phaseTable)
  -- function num : 0_28
  if phaseTable._isSkippable == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC216: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.questionPhaseSkip = function(self, phase, stepNo, typeNo)
  -- function num : 0_29
  local askYesButton = function()
    -- function num : 0_29_0 , upvalues : phase, stepNo, typeNo
    phase:startPhaseXXX(stepNo, typeNo)
  end

  local askNoButton = function()
    -- function num : 0_29_1 , upvalues : phase
    _PA_LOG("곽민�\176", "튜토리얼�\180 사용자에 의해 스킵되었습니�\164. phase : " .. tostring(phase._phaseNo))
    PaGlobal_TutorialManager:endTutorial()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_29")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_30"), content = messageBoxMemo, functionYes = askYesButton, functionNo = askNoButton, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC219: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.showSuggestTutorialButton = function(self, phaseNo, stepNo, typeNo)
  -- function num : 0_30
  local askYesButton = function()
    -- function num : 0_30_0 , upvalues : self, phaseNo, stepNo, typeNo
    self:startTutorial(phaseNo, stepNo, typeNo)
  end

  local messageBoxMemo = "(테스�\184)튜토리얼�\132 시작할까요~?"
  local messageBoxData = {title = "튜토리얼 제안 버튼 테스�\184", content = messageBoxMemo, functionYes = askYesButton, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC222: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.acceptTriggerQuest = function(self, questNoRaw)
  -- function num : 0_31
  local questGroupNo = self:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = self:getQuestIdByQuestNoRaw(questNoRaw)
  if self:isBeginnerTutorialQuest(questGroupNo, questId) == true then
    self:continueTutorial()
  end
end

-- DECOMPILER ERROR at PC225: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.clearTriggerQuest = function(self, questNoRaw)
  -- function num : 0_32
  local questGroupNo = self:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = self:getQuestIdByQuestNoRaw(questNoRaw)
  if self:isBeginnerTutorialQuest(questGroupNo, questId) == true then
    self:continueTutorial()
  end
end

-- DECOMPILER ERROR at PC228: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setAllowShowQuickSlot = function(self, bAllow)
  -- function num : 0_33
  self._isAllowShowQuickSlot = bAllow
end

-- DECOMPILER ERROR at PC231: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isAllowShowQuickSlot = function(self)
  -- function num : 0_34
  if self:isDoingTutorial() == true then
    return self._isAllowShowQuickSlot
  end
  return true
end

-- DECOMPILER ERROR at PC234: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setAllowNewQuickSlot = function(self, bAllow)
  -- function num : 0_35
  self._isAllowNewQuickSlot = bAllow
end

-- DECOMPILER ERROR at PC237: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isAllowNewQuickSlot = function(self, bAllow)
  -- function num : 0_36
  if self:isDoingTutorial() == true then
    return self._isAllowNewQuickSlot
  end
  return true
end

-- DECOMPILER ERROR at PC240: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setAllowMainQuestWidget = function(self, bAllow)
  -- function num : 0_37
  self._isAllowMainQuestWidget = bAllow
end

-- DECOMPILER ERROR at PC243: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isAllowMainQuestWidget = function(self)
  -- function num : 0_38
  if self:isDoingTutorial() == true then
    return self._isAllowMainQuestWidget
  end
  return true
end

-- DECOMPILER ERROR at PC246: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getStringResize = function(self, string1, string2, stringType)
  -- function num : 0_39
  local stringSizeY = 0
  if stringType == 1 then
    (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetText(string1)
    stringSizeY = (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):GetTextSizeY()
  else
    if stringType == 2 then
      (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetText(string1)
      stringSizeY = (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):GetTextSizeY()
    else
      if stringType == 3 then
        (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetText(string1)
        stringSizeY = (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):GetTextSizeY()
      else
        if stringType == 4 then
          (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetText(string1)
          stringSizeY = (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):GetTextSizeY()
        end
      end
    end
  end
  local stringSet = string1 .. "\n" .. string2
  if stringSizeY > 20 then
    stringSet = string1 .. string2
  else
    stringSet = string1 .. "\n" .. string2
  end
  return stringSet
end


