-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_manager.luac 

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

Panel_Tutorial:RegisterUpdateFunc("FGlobal_TutorialManager_UpdatePerFrame")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_TutorialManager")
registerEvent("FromClient_DeleteNavigationGuide", "FromClient_DeleteNavigationGuide_TutorialManager")
registerEvent("EventQuestUpdateNotify", "FromClient_EventQuestUpdateNotify_TutorialManager")
registerEvent("FromClient_UpdateQuestList", "FromClient_UpdateQuestList_TutorialManager")
registerEvent("selfPlayer_regionChanged", "FromClient_selfPlayer_regionChanged_TutorialManager")
registerEvent("FromClient_ImmediatelyCloseWorldMap", "FromClient_ImmediatelyCloseWorldMap_TutorialManager")
registerEvent("FromClient_RClickedWorldMapNode", "FromClient_RClickedWorldMapNode_TutorialManager")
registerEvent("FromClient_RenderStateChange", "FromClient_RenderStateChange_TutorialManager")
registerEvent("FromClient_RClickWorldmapPanel", "FromClient_RClickWorldmapPanel_TutorialManager")
registerEvent("FromClient_resetTownMode", "FromClient_resetTownMode_TutorialManager")
registerEvent("FromClient_RClickedWorldMapHouse", "FromClient_RClickedWorldMapHouse_TutorialManager")
registerEvent("FromClint_EventUpdateExplorationNode", "FromClint_EventUpdateExplorationNode_TutorialManager")
registerEvent("FromClient_RegisterExplorationNode", "FromClient_RegisterExplorationNode_TutorialManager")
-- DECOMPILER ERROR at PC191: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getClassType = function(self)
  -- function num : 0_3
  return self._classType
end

FGlobal_TutorialManager_UpdatePerFrame = function(deltaTime)
  -- function num : 0_4
  PaGlobal_TutorialManager:updatePerFrame(deltaTime)
end

-- DECOMPILER ERROR at PC196: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isDoingTutorial = function(self)
  -- function num : 0_5
  if not Panel_Tutorial:GetShow() then
    return self._isDoingTutorial
  end
end

-- DECOMPILER ERROR at PC199: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setDoingTutorial = function(self, bDoing)
  -- function num : 0_6
  self._isDoingTutorial = bDoing
end

-- DECOMPILER ERROR at PC202: Confused about usage of register: R0 in 'UnsetPending'

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
  if questList_hasProgressQuest(658, 8) == true then
    checkPointNo = 15
  end
  return checkPointNo
end

-- DECOMPILER ERROR at PC205: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isSatisfiedQuestCondition = function(self, questGroupNo, questId)
  -- function num : 0_8
  local uiQuestInfo = ToClient_GetQuestInfo(questGroupNo, questId)
  if uiQuestInfo == nil then
    _PA_ASSERT(false, "퀘스트가 정보�\128 없어�\156 진행�\160 �\152 없습니다. 데이터가 �\128경된것인거나 루아테이블의 오타일수�\132 있습니다. PaGlobal_TutorialManager:isSatisfiedQuestCondition()")
    return nil
  end
  return uiQuestInfo:isSatisfied()
end

-- DECOMPILER ERROR at PC208: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC211: Confused about usage of register: R0 in 'UnsetPending'

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
  self._isInitialized = true
end

-- DECOMPILER ERROR at PC214: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getClassBasicSkillPhase = function(self)
  -- function num : 0_11
  if self._classType ~= nil then
    return (self._classBasicSkillPhaseList)[self._classType]
  end
  _PA_ASSERT(false, "PaGlobal_TutorialManager:getClassBasicSkillPhase() : classType�\180 비정상적입니�\164.")
  return nil
end

-- DECOMPILER ERROR at PC217: Confused about usage of register: R0 in 'UnsetPending'

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
end

-- DECOMPILER ERROR at PC220: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.checkPossibleTutorial = function(self, phaseNo)
  -- function num : 0_13
  if PaGlobal_ArousalTutorial_Manager:isDoingArousalTutorial() == true then
    _PA_LOG("곽민�\176", "각성 튜토리얼 진행중이�\128�\156 튜토리얼�\132 시작시키�\128 않습니다. phaseNo : " .. tostring(phaseNo))
    return false
  end
  return true
end

-- DECOMPILER ERROR at PC223: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC226: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.startTutorial = function(self, phaseNo, stepNo, typeNo)
  -- function num : 0_15
  _PA_LOG("곽민�\176", "#####튜토리얼 시작시도#####")
  if self:checkPossibleTutorial(phaseNo) == false then
    _PA_LOG("곽민�\176", "튜토리얼 시작 조건�\132 만족하지 못해�\156 시작하지 않습니다. phaseNo : " .. tostring(phaseNo))
    return 
  end
  if self._isInitialized == false then
    self:initialize()
  end
  if phaseNo == nil or phaseNo == 0 then
    self._currentPhaseNo = 1
  else
    self._currentPhaseNo = phaseNo
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
  ((self._phaseList)[self._currentPhaseNo]):startPhase(destStepNo, destTypeNo)
end

-- DECOMPILER ERROR at PC229: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC232: Confused about usage of register: R0 in 'UnsetPending'

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
  _PA_LOG("곽민�\176", "#####튜토리얼 종료#####")
end

-- DECOMPILER ERROR at PC235: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getCurrentPhase = function(self)
  -- function num : 0_18
  if (self._phaseList)[self._currentPhaseNo] == nil then
    _PA_LOG("곽민�\176", "페이�\136 번호�\128 범위�\188 초과했거�\152, 페이�\136 리스트에 들어있는 값이 잘못 입력되었거나 초기�\148 되지 않았�\132 수도 있습니다. 시도�\156 현재 페이�\136 번호 : " .. tostring(self._currentPhaseNo))
    return nil
  end
  return (self._phaseList)[self._currentPhaseNo]
end

-- DECOMPILER ERROR at PC238: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.updatePerFrame = function(self, deltaTime)
  -- function num : 0_19
  (self:getCurrentPhase()):updatePerFrame(deltaTime)
end

-- DECOMPILER ERROR at PC241: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getQuestIdByQuestNoRaw = function(self, questNoRaw)
  -- function num : 0_20
  return (math.floor)(questNoRaw / 65536)
end

-- DECOMPILER ERROR at PC244: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getQuestGroupNoByQuestNoRaw = function(self, questNoRaw)
  -- function num : 0_21
  return questNoRaw % 65536
end

-- DECOMPILER ERROR at PC247: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getQuestNoRawByQuestGroupNoAndQuestId = function(self, questGroupNo, questId)
  -- function num : 0_22
  return questId * 65536 + questGroupNo
end

-- DECOMPILER ERROR at PC250: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setAllowCallBlackSpirit = function(self, bAllow)
  -- function num : 0_23
  self._isAllowCallBlackSpirit = bAllow
end

-- DECOMPILER ERROR at PC253: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isAllowCallBlackSpirit = function(self)
  -- function num : 0_24
  return self._isAllowCallBlackSpirit
end

-- DECOMPILER ERROR at PC256: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isBeginnerTutorialQuest = function(self, questGroupNo, questId)
  -- function num : 0_25
  for index,value in pairs(self._questList) do
    if value._questGroupNo == questGroupNo and value._questId == questId then
      return true
    end
  end
  return false
end

-- DECOMPILER ERROR at PC259: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isSkippablePhase = function(self, phaseTable)
  -- function num : 0_26
  if phaseTable._isSkippable == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC262: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.questionPhaseSkip = function(self, phase, stepNo, typeNo)
  -- function num : 0_27
  local askYesButton = function()
    -- function num : 0_27_0 , upvalues : phase, stepNo, typeNo
    phase:startPhaseXXX(stepNo, typeNo)
  end

  local askNoButton = function()
    -- function num : 0_27_1 , upvalues : phase
    _PA_LOG("곽민�\176", "튜토리얼�\180 사용자에 의해 스킵되었습니�\164. phase : " .. tostring(phase._phaseNo))
    PaGlobal_TutorialManager:endTutorial()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_29")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_30"), content = messageBoxMemo, functionYes = askYesButton, functionNo = askNoButton, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC265: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.acceptTriggerQuest = function(self, questNoRaw)
  -- function num : 0_28
  local questGroupNo = self:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = self:getQuestIdByQuestNoRaw(questNoRaw)
  if self:isBeginnerTutorialQuest(questGroupNo, questId) == true then
    self:continueTutorial()
  end
end

-- DECOMPILER ERROR at PC268: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.clearTriggerQuest = function(self, questNoRaw)
  -- function num : 0_29
  local questGroupNo = self:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = self:getQuestIdByQuestNoRaw(questNoRaw)
  if self:isBeginnerTutorialQuest(questGroupNo, questId) == true then
    self:continueTutorial()
  end
end

-- DECOMPILER ERROR at PC271: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setAllowShowQuickSlot = function(self, bAllow)
  -- function num : 0_30
  self._isAllowShowQuickSlot = bAllow
end

-- DECOMPILER ERROR at PC274: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isAllowShowQuickSlot = function(self)
  -- function num : 0_31
  if self:isDoingTutorial() == true then
    return self._isAllowShowQuickSlot
  end
  return true
end

-- DECOMPILER ERROR at PC277: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setAllowNewQuickSlot = function(self, bAllow)
  -- function num : 0_32
  self._isAllowNewQuickSlot = bAllow
end

-- DECOMPILER ERROR at PC280: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isAllowNewQuickSlot = function(self, bAllow)
  -- function num : 0_33
  if self:isDoingTutorial() == true then
    return self._isAllowNewQuickSlot
  end
  return true
end

-- DECOMPILER ERROR at PC283: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.setAllowMainQuestWidget = function(self, bAllow)
  -- function num : 0_34
  self._isAllowMainQuestWidget = bAllow
end

-- DECOMPILER ERROR at PC286: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.isAllowMainQuestWidget = function(self)
  -- function num : 0_35
  if self:isDoingTutorial() == true then
    return self._isAllowMainQuestWidget
  end
  return true
end

-- DECOMPILER ERROR at PC289: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.checkTargetHouseKeyForTutorial = function(self, houseKey)
  -- function num : 0_36
  if (self:getCurrentPhase()):getTargetHouseKey() ~= houseKey then
    do return self:isDoingTutorial() ~= true or self:getCurrentPhase() == nil or (self:getCurrentPhase()).getTargetHouseKey == nil end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

FromClient_luaLoadComplete_TutorialManager = function(isTool)
  -- function num : 0_37
  PaGlobal_TutorialManager:handleLuaLoadComplete(isTool)
end

-- DECOMPILER ERROR at PC294: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleLuaLoadComplete = function(self, isTool)
  -- function num : 0_38
  _PA_LOG("곽민�\176", "@@@루아로드완료!!@@@")
end

-- DECOMPILER ERROR at PC297: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleTutorialUiManagerInitialize = function(self)
  -- function num : 0_39
  if isMoviePlayMode() == false then
    self:continueTutorial()
  end
end

-- DECOMPILER ERROR at PC300: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleOpenedInventory = function(self)
  -- function num : 0_40
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleOpenedInventory ~= nil then
    (self:getCurrentPhase()):handleOpenedInventory()
  end
end

-- DECOMPILER ERROR at PC303: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClosedInventory = function(self)
  -- function num : 0_41
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClosedInventory ~= nil then
    (self:getCurrentPhase()):handleClosedInventory()
  end
end

-- DECOMPILER ERROR at PC306: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleUpdateInventorySlotData = function(self, slot, slotItemKey)
  -- function num : 0_42
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleUpdateInventorySlotData ~= nil then
    (self:getCurrentPhase()):handleUpdateInventorySlotData(slot, slotItemKey)
  end
end

-- DECOMPILER ERROR at PC309: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleInventorySlotRClick = function(self, rClickedItemKey)
  -- function num : 0_43
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleInventorySlotRClick ~= nil then
    (self:getCurrentPhase()):handleInventorySlotRClick(rClickedItemKey)
  end
end

-- DECOMPILER ERROR at PC312: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleInventorySlotRClickgetSlotNo = function(self, SlotNo)
  -- function num : 0_44
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleInventorySlotRClickgetSlotNo ~= nil then
    (self:getCurrentPhase()):handleInventorySlotRClickgetSlotNo(SlotNo)
  end
end

-- DECOMPILER ERROR at PC315: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNewEquipInInventory = function(self, newItemSlotNo)
  -- function num : 0_45
  local phaseNo = 16
  if self._isInitialized == false then
    self:initialize()
  end
  if self:isDoingTutorial() == true then
    return 
  end
  if ((self._phaseList)[phaseNo]).handleNewEquipInInventory ~= nil then
    ((self._phaseList)[phaseNo]):handleNewEquipInInventory(newItemSlotNo)
  end
  self:startTutorial(phaseNo, 1)
end

-- DECOMPILER ERROR at PC318: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEquipItem = function(self, slotNo)
  -- function num : 0_46
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEquipItem ~= nil then
    (self:getCurrentPhase()):handleEquipItem(slotNo)
  end
end

-- DECOMPILER ERROR at PC321: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleInventoryDelete = function(self, itemWrapper, deleteWhereType, deleteSlotNo)
  -- function num : 0_47
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleInventoryDelete ~= nil then
    (self:getCurrentPhase()):handleInventoryDelete(itemWrapper, deleteWhereType, deleteSlotNo)
  end
end

-- DECOMPILER ERROR at PC324: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleUpdateQuickSlotPerFrame = function(self, slot, quickSlotItemKey)
  -- function num : 0_48
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleUpdateQuickSlotPerFrame ~= nil then
    (self:getCurrentPhase()):handleUpdateQuickSlotPerFrame(slot, quickSlotItemKey)
  end
end

-- DECOMPILER ERROR at PC327: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleUpdateNewQuickSlotPerFrame = function(self, panelIdx, slot, newQuickSlotItemKey)
  -- function num : 0_49
end

-- DECOMPILER ERROR at PC330: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuickSlotClick = function(self, clickedItemKey)
  -- function num : 0_50
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuickSlotClick ~= nil then
    (self:getCurrentPhase()):handleQuickSlotClick(clickedItemKey)
  end
end

-- DECOMPILER ERROR at PC333: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNewQuickSlotClick = function(self, clickedItemKey)
  -- function num : 0_51
end

-- DECOMPILER ERROR at PC336: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuickSlotRegistItem = function(self, slotIndex, dragWhereTypeInfo, dragSlotInfo)
  -- function num : 0_52
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuickSlotRegistItem ~= nil then
    (self:getCurrentPhase()):handleQuickSlotRegistItem(slotIndex, dragWhereTypeInfo, dragSlotInfo)
  end
end

FromClient_EventQuestUpdateNotify_TutorialManager = function(isAccept, questNoRaw)
  -- function num : 0_53
  PaGlobal_TutorialManager:handleEventQuestUpdateNotify(isAccept, questNoRaw)
end

-- DECOMPILER ERROR at PC341: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEventQuestUpdateNotify = function(self, isAccept, questNoRaw)
  -- function num : 0_54
  _PA_LOG("곽민�\176", "Manager: " .. "isAccept : " .. tostring(isAccept) .. ", QuestGroupNo : " .. tostring(self:getQuestGroupNoByQuestNoRaw(questNoRaw)) .. ", QuestId : " .. tostring(self:getQuestIdByQuestNoRaw(questNoRaw)))
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEventQuestUpdateNotify ~= nil then
    (self:getCurrentPhase()):handleEventQuestUpdateNotify(isAccept, questNoRaw)
  else
    if self:isDoingTutorial() == false then
      if isAccept == true then
        self:acceptTriggerQuest(questNoRaw)
      else
        if isAccept == false then
          self:clearTriggerQuest(questNoRaw)
        end
      end
    end
  end
end

FromClient_UpdateQuestList_TutorialManager = function()
  -- function num : 0_55
  PaGlobal_TutorialManager:handleQuestWidgetUpdate()
end

-- DECOMPILER ERROR at PC346: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuestWidgetUpdate = function(self)
  -- function num : 0_56
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuestWidgetUpdate ~= nil then
    (self:getCurrentPhase()):handleQuestWidgetUpdate()
  end
end

-- DECOMPILER ERROR at PC349: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleAfterAndPopFlush = function(self)
  -- function num : 0_57
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleAfterAndPopFlush ~= nil then
    (self:getCurrentPhase()):handleAfterAndPopFlush()
  end
end

-- DECOMPILER ERROR at PC352: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleUpdateMainDialog = function(self)
  -- function num : 0_58
end

-- DECOMPILER ERROR at PC355: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedQuestWidgetFindTarget = function(self, questGroupId, questId, condition, isAuto)
  -- function num : 0_59
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedQuestWidgetFindTarget ~= nil then
    (self:getCurrentPhase()):handleClickedQuestWidgetFindTarget(questGroupId, questId, condition, isAuto)
  end
end

FromClient_DeleteNavigationGuide_TutorialManager = function(key)
  -- function num : 0_60
  PaGlobal_TutorialManager:handleDeleteNavigationGuide(key)
end

-- DECOMPILER ERROR at PC360: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleDeleteNavigationGuide = function(self, key)
  -- function num : 0_61
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleDeleteNavigationGuide ~= nil then
    (self:getCurrentPhase()):handleDeleteNavigationGuide(key)
  end
end

-- DECOMPILER ERROR at PC363: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuestWidgetMouseOver = function(self, show)
  -- function num : 0_62
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuestWidgetMouseOver ~= nil then
    (self:getCurrentPhase()):handleQuestWidgetMouseOver(show)
  end
end

-- DECOMPILER ERROR at PC366: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleQuestWidgetScrollEvent = function(self, isDown)
  -- function num : 0_63
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleQuestWidgetScrollEvent ~= nil then
    (self:getCurrentPhase()):handleQuestWidgetScrollEvent(isDown)
  end
end

-- DECOMPILER ERROR at PC369: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEventSelfPlayerUsedSkill = function(self, skillWrapper)
  -- function num : 0_64
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEventSelfPlayerUsedSkill ~= nil then
    (self:getCurrentPhase()):handleEventSelfPlayerUsedSkill(skillWrapper)
  end
end

-- DECOMPILER ERROR at PC372: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleShowQuestNewWindow = function(self, isShow)
  -- function num : 0_65
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleShowQuestNewWindow ~= nil then
    (self:getCurrentPhase()):handleShowQuestNewWindow(isShow)
  end
end

-- DECOMPILER ERROR at PC375: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRadarMouseOn = function(self)
  -- function num : 0_66
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRadarMouseOn ~= nil then
    (self:getCurrentPhase()):handleRadarMouseOn()
  end
end

-- DECOMPILER ERROR at PC378: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleBeforeShowDialog = function(self)
  -- function num : 0_67
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleBeforeShowDialog ~= nil then
    (self:getCurrentPhase()):handleBeforeShowDialog()
  end
end

-- DECOMPILER ERROR at PC381: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleShowDialog = function(self, dialogData)
  -- function num : 0_68
  if self:isDoingTutorial() == true then
    if FGlobal_Dialog_IsAllowTutorialPanelShow() == false then
      Panel_Tutorial:SetShow(false, false)
    end
    if self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleShowDialog ~= nil then
      (self:getCurrentPhase()):handleShowDialog(dialogData)
    end
  end
end

-- DECOMPILER ERROR at PC384: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedExitButton = function(self, talker)
  -- function num : 0_69
  if self:isDoingTutorial() == true then
    if FGlobal_Dialog_IsAllowTutorialPanelShow() == false then
      Panel_Tutorial:SetShow(true, true)
    end
    if self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedExitButton ~= nil then
      (self:getCurrentPhase()):handleClickedExitButton(talker)
    end
  end
end

-- DECOMPILER ERROR at PC387: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNpcShopUpdateContent = function(self)
  -- function num : 0_70
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleNpcShopUpdateContent ~= nil then
    (self:getCurrentPhase()):handleNpcShopUpdateContent()
  end
end

-- DECOMPILER ERROR at PC390: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNpcShopTabButtonClick = function(self, tabIndex)
  -- function num : 0_71
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleNpcShopTabButtonClick ~= nil then
    (self:getCurrentPhase()):handleNpcShopTabButtonClick(tabIndex)
  end
end

-- DECOMPILER ERROR at PC393: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleCloseIntroMovie = function(self)
  -- function num : 0_72
  if ((getSelfPlayer()):get()):getLevel() == 1 then
    self:continueTutorial()
  end
end

-- DECOMPILER ERROR at PC396: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleStopCutScene = function(self, cutSceneName)
  -- function num : 0_73
  if ((getSelfPlayer()):get()):getLevel() == 1 then
    for index,value in ipairs(self._firstCutSceneList) do
      if cutSceneName == value then
        self:continueTutorial()
        return 
      end
    end
  end
end

FromClient_selfPlayer_regionChanged_TutorialManager = function(regionInfo)
  -- function num : 0_74
  PaGlobal_TutorialManager:handleRegionChanged(regionInfo)
end

-- DECOMPILER ERROR at PC401: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRegionChanged = function(self, regionInfo)
  -- function num : 0_75
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRegionChanged ~= nil then
    _PA_LOG("곽민�\176", "[튜토리얼�\145 �\128�\173 이동] RegionKeyRaw : " .. tostring(regionInfo:getRegionKey()) .. " / AreaName : " .. tostring(regionInfo:getAreaName()))
    ;
    (self:getCurrentPhase()):handleRegionChanged(regionInfo)
  end
end

-- DECOMPILER ERROR at PC404: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleBeforeWorldmapOpen = function(self)
  -- function num : 0_76
  if self:isDoingTutorial() == true then
    if FGlobal_WorldmapMain_IsAllowTutorialPanelShow() == false then
      Panel_Tutorial:SetShow(false, false)
      return 
    end
    if self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleBeforeWorldmapOpen ~= nil then
      (self:getCurrentPhase()):handleBeforeWorldmapOpen()
    end
  end
end

-- DECOMPILER ERROR at PC407: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleWorldMapOpenComplete = function(self)
  -- function num : 0_77
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleWorldMapOpenComplete ~= nil then
    (self:getCurrentPhase()):handleWorldMapOpenComplete()
  end
end

FromClient_ImmediatelyCloseWorldMap_TutorialManager = function()
  -- function num : 0_78
  PaGlobal_TutorialManager:handleWorldMapImmediatelyClose()
end

-- DECOMPILER ERROR at PC412: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_79
  if self:isDoingTutorial() == true then
    if FGlobal_WorldmapMain_IsAllowTutorialPanelShow() == false then
      Panel_Tutorial:SetShow(true, true)
    end
    if self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleWorldMapImmediatelyClose ~= nil then
      (self:getCurrentPhase()):handleWorldMapImmediatelyClose()
    end
  end
end

-- DECOMPILER ERROR at PC415: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_80
  _PA_LOG("곽민�\176", "LClick uiNodeButton:getWaypointKey() : " .. tostring(uiNodeButton:getWaypointKey()))
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleLClickWorldMapNode ~= nil then
    (self:getCurrentPhase()):handleLClickWorldMapNode(uiNodeButton)
  end
end

FromClient_RClickedWorldMapNode_TutorialManager = function(uiNodeButton)
  -- function num : 0_81
  PaGlobal_TutorialManager:handleRClickWorldMapNode(uiNodeButton)
end

-- DECOMPILER ERROR at PC420: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_82
  _PA_LOG("곽민�\176", "RClick uiNodeButton:getWaypointKey() : " .. tostring(uiNodeButton:getWaypointKey()))
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRClickWorldMapNode ~= nil then
    (self:getCurrentPhase()):handleRClickWorldMapNode(uiNodeButton)
  end
end

FromClient_RenderStateChange_TutorialManager = function(changeState)
  -- function num : 0_83
  PaGlobal_TutorialManager:handleRenderStateChange(changeState)
end

-- DECOMPILER ERROR at PC425: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRenderStateChange = function(self, changeState)
  -- function num : 0_84
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRenderStateChange ~= nil then
    (self:getCurrentPhase()):handleRenderStateChange(changeState)
  end
end

FromClient_RClickWorldmapPanel_TutorialManager = function(pos3D, immediately, isTopPicking, uiKnowledgeStatic)
  -- function num : 0_85
  PaGlobal_TutorialManager:handleRClickWorldmapPanel(pos3D, immediately, isTopPicking, uiKnowledgeStatic)
end

-- DECOMPILER ERROR at PC430: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRClickWorldmapPanel = function(self, pos3D, immediately, isTopPicking, uiKnowledgeStatic)
  -- function num : 0_86
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRClickWorldmapPanel ~= nil then
    (self:getCurrentPhase()):handleRClickWorldmapPanel(pos3D, immediately, isTopPicking, uiKnowledgeStatic)
  end
end

-- DECOMPILER ERROR at PC433: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleWorldmapMainEventTempControl = function(self)
  -- function num : 0_87
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleWorldmapMainEventTempControl ~= nil then
    (self:getCurrentPhase()):handleWorldmapMainEventTempControl()
  end
end

-- DECOMPILER ERROR at PC436: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedGrandWorldMapSearchNodeType = function(self, typeIndex)
  -- function num : 0_88
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedGrandWorldMapSearchNodeType ~= nil then
    (self:getCurrentPhase()):handleClickedGrandWorldMapSearchNodeType(typeIndex)
  end
end

-- DECOMPILER ERROR at PC439: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedGrandWorldmapGotoNodeFocus = function(self, resultIdx)
  -- function num : 0_89
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedGrandWorldmapGotoNodeFocus ~= nil then
    (self:getCurrentPhase()):handleClickedGrandWorldmapGotoNodeFocus(resultIdx)
  end
end

FromClient_resetTownMode_TutorialManager = function()
  -- function num : 0_90
  PaGlobal_TutorialManager:handleResetTownMode()
end

-- DECOMPILER ERROR at PC444: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleResetTownMode = function(self)
  -- function num : 0_91
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleResetTownMode ~= nil then
    (self:getCurrentPhase()):handleResetTownMode()
  end
end

-- DECOMPILER ERROR at PC447: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleNpcNavi_ShowToggle = function(self, isShow)
  -- function num : 0_92
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleNpcNavi_ShowToggle ~= nil then
    (self:getCurrentPhase()):handleNpcNavi_ShowToggle(isShow)
  end
end

-- DECOMPILER ERROR at PC450: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedTownNpcIconNaviStart = function(self, spawnType, isAuto)
  -- function num : 0_93
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedTownNpcIconNaviStart ~= nil then
    (self:getCurrentPhase()):handleClickedTownNpcIconNaviStart(spawnType, isAuto)
  end
end

-- DECOMPILER ERROR at PC453: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleHouseHoldButtonSetBaseTexture = function(self, houseBtn)
  -- function num : 0_94
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleHouseHoldButtonSetBaseTexture ~= nil then
    (self:getCurrentPhase()):handleHouseHoldButtonSetBaseTexture(houseBtn)
  end
end

-- DECOMPILER ERROR at PC456: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleLClickedWorldMapHouse = function(self, uiHouseButton)
  -- function num : 0_95
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleLClickedWorldMapHouse ~= nil then
    (self:getCurrentPhase()):handleLClickedWorldMapHouse(uiHouseButton)
  end
end

FromClient_RClickedWorldMapHouse_TutorialManager = function(uiHouseButton)
  -- function num : 0_96
  PaGlobal_TutorialManager:handleRClickedWorldMapHouse(uiHouseButton)
end

-- DECOMPILER ERROR at PC461: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRClickedWorldMapHouse = function(self, uiHouseButton)
  -- function num : 0_97
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRClickedWorldMapHouse ~= nil then
    (self:getCurrentPhase()):handleRClickedWorldMapHouse(uiHouseButton)
  end
end

-- DECOMPILER ERROR at PC464: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedHouseControlSetUseType = function(self, index, groupType)
  -- function num : 0_98
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedHouseControlSetUseType ~= nil then
    (self:getCurrentPhase()):handleClickedHouseControlSetUseType(index, groupType)
  end
end

-- DECOMPILER ERROR at PC467: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedHouseControlBuyHouseContinue = function(self)
  -- function num : 0_99
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedHouseControlBuyHouseContinue ~= nil then
    (self:getCurrentPhase()):handleClickedHouseControlBuyHouseContinue()
  end
end

-- DECOMPILER ERROR at PC470: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedHouseControlSellHouseContinue = function(self, houseKey)
  -- function num : 0_100
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedHouseControlSellHouseContinue ~= nil then
    (self:getCurrentPhase()):handleClickedHouseControlSellHouseContinue(houseKey)
  end
end

-- DECOMPILER ERROR at PC473: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleCloseHouseControl = function(self)
  -- function num : 0_101
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleCloseHouseControl ~= nil then
    (self:getCurrentPhase()):handleCloseHouseControl()
  end
end

-- DECOMPILER ERROR at PC476: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleTradeMarketSellSomeConfirm = function(self, itemKey)
  -- function num : 0_102
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleTradeMarketSellSomeConfirm ~= nil then
    (self:getCurrentPhase()):handleTradeMarketSellSomeConfirm(itemKey)
  end
end

-- DECOMPILER ERROR at PC479: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedTradeItemAllSell = function(self, talker)
  -- function num : 0_103
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedTradeItemAllSell ~= nil then
    (self:getCurrentPhase()):handleClickedTradeItemAllSell(talker)
  end
end

-- DECOMPILER ERROR at PC482: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleGrandWorldMap_CheckPopup = function(self, openPanelEnum, popupPanel)
  -- function num : 0_104
  _PA_LOG("곽민�\176", "handleGrandWorldMap_CheckPopup( " .. tostring(openPanelEnum) .. ", " .. tostring(popupPanel) .. " )")
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleGrandWorldMap_CheckPopup ~= nil then
    (self:getCurrentPhase()):handleGrandWorldMap_CheckPopup(openPanelEnum, popupPanel)
  end
end

-- DECOMPILER ERROR at PC485: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleInteractionShow = function(self, actorProxyWrapper)
  -- function num : 0_105
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleInteractionShow ~= nil then
    (self:getCurrentPhase()):handleInteractionShow(actorProxyWrapper)
  end
end

-- DECOMPILER ERROR at PC488: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_106
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickedDialogFuncButton ~= nil then
    (self:getCurrentPhase()):handleClickedDialogFuncButton(funcButtonType)
  end
end

-- DECOMPILER ERROR at PC491: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleOnNodeUpgradeClick = function(self, nodeKey)
  -- function num : 0_107
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleOnNodeUpgradeClick ~= nil then
    (self:getCurrentPhase()):handleOnNodeUpgradeClick(nodeKey)
  end
end

FromClint_EventUpdateExplorationNode_TutorialManager = function(waypointKey)
  -- function num : 0_108
  PaGlobal_TutorialManager:handleEventUpdateExplorationNode(waypointKey)
end

-- DECOMPILER ERROR at PC496: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_109
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEventUpdateExplorationNode ~= nil then
    (self:getCurrentPhase()):handleEventUpdateExplorationNode(waypointKey)
  end
end

-- DECOMPILER ERROR at PC499: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickPlantdoWork = function(self, plantKey, workingCount)
  -- function num : 0_110
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickPlantdoWork ~= nil then
    (self:getCurrentPhase()):handleClickPlantdoWork(plantKey, workingCount)
  end
end

-- DECOMPILER ERROR at PC502: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleSetTownMode = function(self, waypointKey)
  -- function num : 0_111
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleSetTownMode ~= nil then
    (self:getCurrentPhase()):handleSetTownMode(waypointKey)
  end
end

FromClient_RegisterExplorationNode_TutorialManager = function(waypointKey)
  -- function num : 0_112
  _PA_LOG("곽민�\176", "�\136 노드 등록 waypointKey : " .. tostring(waypointKey))
  PaGlobal_TutorialManager:handleRegisterExplorationNode(waypointKey)
end

-- DECOMPILER ERROR at PC507: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleRegisterExplorationNode = function(self, waypointKey)
  -- function num : 0_113
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleRegisterExplorationNode ~= nil then
    (self:getCurrentPhase()):handleRegisterExplorationNode(waypointKey)
  else
    if waypointKey == 301 then
      local phaseNo = 13
      if self._isInitialized == false then
        self:initialize()
      end
      if ((self._phaseList)[phaseNo]).checkPossibleForPhaseStart ~= nil and ((self._phaseList)[phaseNo]):checkPossibleForPhaseStart(1) == false then
        return 
      end
      self:startTutorial(phaseNo, 1)
    end
  end
end

-- DECOMPILER ERROR at PC510: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickWorldmapTutorialButton = function(self, buttonNum)
  -- function num : 0_114
  local phaseNo = 0
  if buttonNum == 1 then
    phaseNo = 10
  else
    if buttonNum == 2 then
      phaseNo = 11
    else
      if buttonNum == 3 then
        phaseNo = 12
      end
    end
  end
  if self._isInitialized == false then
    self:initialize()
  end
  _PA_LOG("곽민�\176", "phaseNo : " .. tostring(phaseNo))
  if ((self._phaseList)[phaseNo]).checkPossibleForPhaseStart ~= nil and ((self._phaseList)[phaseNo]):checkPossibleForPhaseStart(1) == false then
    return 
  end
  self:startTutorial(phaseNo, 1)
end

-- DECOMPILER ERROR at PC513: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleEnchantResultShow = function(self, resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  -- function num : 0_115
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleEnchantResultShow ~= nil then
    (self:getCurrentPhase()):handleEnchantResultShow(resultType, mainWhereType, mainSlotNo, subWhereType, subSlotNo)
  end
end

-- DECOMPILER ERROR at PC516: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleExtractionEnchantStoneResultShow = function(self)
  -- function num : 0_116
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleExtractionEnchantStoneResultShow ~= nil then
    (self:getCurrentPhase()):handleExtractionEnchantStoneResultShow()
  end
end

-- DECOMPILER ERROR at PC519: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleOpenExtractionPanel = function(self, isShow)
  -- function num : 0_117
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleOpenExtractionPanel ~= nil then
    (self:getCurrentPhase()):handleOpenExtractionPanel(isShow)
  end
end

-- DECOMPILER ERROR at PC522: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleClickExtractionEnchantStoneButton = function(self)
  -- function num : 0_118
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleClickExtractionEnchantStoneButton ~= nil then
    (self:getCurrentPhase()):handleClickExtractionEnchantStoneButton()
  end
end

-- DECOMPILER ERROR at PC525: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleApplyExtractionEnchantStone = function(self)
  -- function num : 0_119
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleApplyExtractionEnchantStone ~= nil then
    (self:getCurrentPhase()):handleApplyExtractionEnchantStone()
  end
end

-- DECOMPILER ERROR at PC528: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.handleMouseLUpBubble = function(self)
  -- function num : 0_120
  if self:isDoingTutorial() == true and self:getCurrentPhase() ~= nil and (self:getCurrentPhase()).handleMouseLUpBubble ~= nil then
    (self:getCurrentPhase()):handleMouseLUpBubble()
  end
end

-- DECOMPILER ERROR at PC531: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialManager.getStringResize = function(self, string1, string2, stringType)
  -- function num : 0_121
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


