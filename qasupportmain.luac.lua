-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\qasupport\qasupportmain.luac 

-- params : ...
-- function num : 0
allydisJoin = function()
  -- function num : 0_0
  ToClient_RequestDisjoinGuildAlliance()
end

allydestroy = function()
  -- function num : 0_1
  ToClient_RequestDestroyGuildAlliance()
end

testCreate = function()
  -- function num : 0_2
  ToClient_qaCreateItem(10010, 15, 1)
end

workerready = function(level)
  -- function num : 0_3
  ToClient_qaCreateItem(64204, 0, 1)
  ToClient_qaCreateItem(64205, 0, 1)
  ToClient_qaCreateItem(64206, 0, 1)
  ToClient_qaCreateItem(64214, 0, 1)
  ToClient_qaCreateItem(64215, 0, 1)
  ToClient_qaCreateItem(64216, 0, 1)
  ToClient_qaCreateItem(64234, 0, 1)
  ToClient_qaCreateItem(64235, 0, 1)
  ToClient_qaCreateItem(64236, 0, 1)
  ToClient_qaCreateItem(64264, 0, 1)
  ToClient_qaCreateItem(64265, 0, 1)
  ToClient_qaCreateItem(64266, 0, 1)
  ToClient_qaCreateItem(64320, 0, 1)
  ToClient_qaCreateItem(64321, 0, 1)
  ToClient_qaCreateItem(64322, 0, 1)
  ToClient_qaCreateItem(64304, 0, 1)
  ToClient_qaCreateItem(64305, 0, 1)
  ToClient_qaCreateItem(64306, 0, 1)
  ToClient_qaLevelUpAllWorker(level)
end

runAutoFrameCheck = function()
  -- function num : 0_4
  FGlobal_AutoFrameCheck_setMinFrame(25)
  FGlobal_setAutoFrameCheckRepeat(true)
  FGlobal_AutoFrameCheck_addPositionList(100, 100, 100)
  FGlobal_AutoFrameCheck_Start()
end

local UI_CT = CppEnums.ClassType
behero = function()
  -- function num : 0_5
  ToClient_qaCreateItem(9693, 0, 10)
  ToClient_qaCreateItem(793, 0, 20)
  ToClient_qaCreateItem(45220, 0, 1)
  ToClient_qaCreateItem(45252, 0, 1)
  ToClient_qaCreateItem(45284, 0, 1)
  ToClient_qaCreateItem(65475, 0, 10)
  ToClient_qaCreateItem(65476, 0, 10)
  ToClient_qaCreateItem(65477, 0, 10)
  ToClient_qaCreateItem(65478, 0, 10)
  ToClient_qaCreateItem(65479, 0, 10)
  ToClient_qaCreateItem(65480, 0, 10)
  ToClient_qaCreateItem(65481, 0, 10)
  ToClient_qaCreateItem(65482, 0, 10)
  ToClient_qaCreateItem(43706, 0, 1)
  ToClient_qaCreateItem(65492, 0, 1)
  ToClient_qaCreateItem(65493, 0, 1)
  ToClient_qaCreateItem(65494, 0, 1)
end

warready = function(enchantLeve1)
  -- function num : 0_6
  createBuffItem(enchantLeve1)
  item(enchantLeve1)
  createBossArmor(enchantLeve1)
  createAccessory(enchantLeve1)
end

createBuffItem = function(enchantLevel)
  -- function num : 0_7
  ToClient_qaCreateItem(65487, 0, 1)
  ToClient_qaCreateItem(65488, 0, 1)
  ToClient_qaCreateItem(65489, 0, 1)
  ToClient_qaCreateItem(65490, 0, 1)
  ToClient_qaCreateItem(65491, 0, 1)
  ToClient_qaCreateItem(529, 0, 150)
end

item = function(enchantLeve1)
  -- function num : 0_8 , upvalues : UI_CT
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local isClassType = (getSelfPlayer()):getClassType()
  if isClassType == UI_CT.ClassType_Warrior then
    ToClient_qaCreateItem(10010, enchantLeve1, 1)
    ToClient_qaCreateItem(10138, enchantLeve1, 1)
    ToClient_qaCreateItem(10140, enchantLeve1, 1)
    ToClient_qaCreateItem(14702, enchantLeve1, 1)
    ToClient_qaLevelUp(60)
    ToClient_qaConditionCompleteQuest()
    ToClient_qaCompleteQuest(285, 4)
    ToClient_qaCompleteQuest(653, 6)
    ToClient_qaCreateItem(142, 0, 1)
    ToClient_qaCreateItem(143, 0, 2)
    ToClient_qaCreateItem(144, 0, 3)
    ToClient_qaCreateItem(594, 0, 200)
  else
    if isClassType == UI_CT.ClassType_Ranger then
      ToClient_qaCreateItem(10210, enchantLeve1, 1)
      ToClient_qaCreateItem(10338, enchantLeve1, 1)
      ToClient_qaCreateItem(10340, enchantLeve1, 1)
      ToClient_qaCreateItem(14732, enchantLeve1, 1)
      ToClient_qaLevelUp(60)
      ToClient_qaConditionCompleteQuest()
      ToClient_qaCompleteQuest(293, 4)
      ToClient_qaCompleteQuest(653, 6)
      ToClient_qaCreateItem(151, 0, 1)
      ToClient_qaCreateItem(152, 0, 1)
      ToClient_qaCreateItem(153, 0, 1)
      ToClient_qaCreateItem(532, 0, 200)
    else
      if isClassType == UI_CT.ClassType_Sorcerer then
        ToClient_qaCreateItem(10410, enchantLeve1, 1)
        ToClient_qaCreateItem(10538, enchantLeve1, 1)
        ToClient_qaCreateItem(10540, enchantLeve1, 1)
        ToClient_qaCreateItem(14712, enchantLeve1, 1)
        ToClient_qaLevelUp(60)
        ToClient_qaConditionCompleteQuest()
        ToClient_qaCompleteQuest(287, 4)
        ToClient_qaCompleteQuest(653, 6)
        ToClient_qaCreateItem(145, 0, 1)
        ToClient_qaCreateItem(146, 0, 1)
        ToClient_qaCreateItem(147, 0, 1)
        ToClient_qaCreateItem(532, 0, 200)
      else
        if isClassType == UI_CT.ClassType_Giant then
          ToClient_qaCreateItem(10610, enchantLeve1, 1)
          ToClient_qaCreateItem(10738, enchantLeve1, 1)
          ToClient_qaCreateItem(10740, enchantLeve1, 1)
          ToClient_qaCreateItem(14722, enchantLeve1, 1)
          ToClient_qaLevelUp(60)
          ToClient_qaConditionCompleteQuest()
          ToClient_qaCompleteQuest(290, 4)
          ToClient_qaCompleteQuest(653, 6)
          ToClient_qaCreateItem(148, 0, 1)
          ToClient_qaCreateItem(149, 0, 1)
          ToClient_qaCreateItem(150, 0, 1)
          ToClient_qaCreateItem(594, 0, 200)
        else
          if isClassType == UI_CT.ClassType_Tamer then
            ToClient_qaCreateItem(13210, enchantLeve1, 1)
            ToClient_qaCreateItem(13038, enchantLeve1, 1)
            ToClient_qaCreateItem(13040, enchantLeve1, 1)
            ToClient_qaCreateItem(14742, enchantLeve1, 1)
            ToClient_qaLevelUp(60)
            ToClient_qaConditionCompleteQuest()
            ToClient_qaCompleteQuest(296, 4)
            ToClient_qaCompleteQuest(653, 6)
            ToClient_qaCreateItem(154, 0, 1)
            ToClient_qaCreateItem(155, 0, 1)
            ToClient_qaCreateItem(156, 0, 1)
            ToClient_qaCreateItem(532, 0, 200)
          else
            if isClassType == UI_CT.ClassType_BladeMaster then
              ToClient_qaCreateItem(13310, enchantLeve1, 1)
              ToClient_qaCreateItem(13138, enchantLeve1, 1)
              ToClient_qaCreateItem(13140, enchantLeve1, 1)
              ToClient_qaCreateItem(14762, enchantLeve1, 1)
              ToClient_qaLevelUp(60)
              ToClient_qaConditionCompleteQuest()
              ToClient_qaCompleteQuest(319, 4)
              ToClient_qaCompleteQuest(653, 6)
              ToClient_qaCreateItem(160, 0, 1)
              ToClient_qaCreateItem(161, 0, 1)
              ToClient_qaCreateItem(162, 0, 1)
              ToClient_qaCreateItem(594, 0, 200)
            else
              if isClassType == UI_CT.ClassType_Valkyrie then
                ToClient_qaCreateItem(10010, enchantLeve1, 1)
                ToClient_qaCreateItem(10138, enchantLeve1, 1)
                ToClient_qaCreateItem(10140, enchantLeve1, 1)
                ToClient_qaCreateItem(14752, enchantLeve1, 1)
                ToClient_qaLevelUp(60)
                ToClient_qaConditionCompleteQuest()
                ToClient_qaCompleteQuest(298, 4)
                ToClient_qaCompleteQuest(653, 6)
                ToClient_qaCreateItem(157, 0, 1)
                ToClient_qaCreateItem(158, 0, 1)
                ToClient_qaCreateItem(159, 0, 1)
                ToClient_qaCreateItem(598, 0, 200)
              else
                if isClassType == UI_CT.ClassType_BladeMasterWomen then
                  ToClient_qaCreateItem(13310, enchantLeve1, 1)
                  ToClient_qaCreateItem(13138, enchantLeve1, 1)
                  ToClient_qaCreateItem(13140, enchantLeve1, 1)
                  ToClient_qaCreateItem(14772, enchantLeve1, 1)
                  ToClient_qaLevelUp(60)
                  ToClient_qaConditionCompleteQuest()
                  ToClient_qaCompleteQuest(321, 4)
                  ToClient_qaCompleteQuest(653, 6)
                  ToClient_qaCreateItem(163, 0, 1)
                  ToClient_qaCreateItem(164, 0, 1)
                  ToClient_qaCreateItem(165, 0, 1)
                  ToClient_qaCreateItem(594, 0, 200)
                else
                  if isClassType == UI_CT.ClassType_NinjaWomen then
                    ToClient_qaCreateItem(13210, enchantLeve1, 1)
                    ToClient_qaCreateItem(14538, enchantLeve1, 1)
                    ToClient_qaCreateItem(14540, enchantLeve1, 1)
                    ToClient_qaCreateItem(14792, enchantLeve1, 1)
                    ToClient_qaLevelUp(60)
                    ToClient_qaConditionCompleteQuest()
                    ToClient_qaCompleteQuest(327, 4)
                    ToClient_qaCompleteQuest(653, 6)
                    ToClient_qaCreateItem(169, 0, 1)
                    ToClient_qaCreateItem(170, 0, 1)
                    ToClient_qaCreateItem(171, 0, 1)
                    ToClient_qaCreateItem(594, 0, 200)
                  else
                    if isClassType == UI_CT.ClassType_NinjaMan then
                      ToClient_qaCreateItem(13210, enchantLeve1, 1)
                      ToClient_qaCreateItem(14638, enchantLeve1, 1)
                      ToClient_qaCreateItem(14640, enchantLeve1, 1)
                      ToClient_qaCreateItem(14782, enchantLeve1, 1)
                      ToClient_qaLevelUp(60)
                      ToClient_qaConditionCompleteQuest()
                      ToClient_qaCompleteQuest(325, 4)
                      ToClient_qaCompleteQuest(653, 6)
                      ToClient_qaCreateItem(166, 0, 1)
                      ToClient_qaCreateItem(167, 0, 1)
                      ToClient_qaCreateItem(168, 0, 1)
                      ToClient_qaCreateItem(594, 0, 200)
                    else
                      if isClassType == UI_CT.ClassType_WizardWomen then
                        ToClient_qaCreateItem(14410, enchantLeve1, 1)
                        ToClient_qaCreateItem(10338, enchantLeve1, 1)
                        ToClient_qaCreateItem(10340, enchantLeve1, 1)
                        ToClient_qaCreateItem(14802, enchantLeve1, 1)
                        ToClient_qaLevelUp(60)
                        ToClient_qaConditionCompleteQuest()
                        ToClient_qaCompleteQuest(334, 5)
                        ToClient_qaCompleteQuest(653, 6)
                        ToClient_qaCreateItem(172, 0, 1)
                        ToClient_qaCreateItem(173, 0, 1)
                        ToClient_qaCreateItem(174, 0, 1)
                        ToClient_qaCreateItem(532, 0, 200)
                      else
                        if isClassType == UI_CT.ClassType_Wizard then
                          ToClient_qaCreateItem(14410, enchantLeve1, 1)
                          ToClient_qaCreateItem(10338, enchantLeve1, 1)
                          ToClient_qaCreateItem(10340, enchantLeve1, 1)
                          ToClient_qaCreateItem(14812, enchantLeve1, 1)
                          ToClient_qaLevelUp(60)
                          ToClient_qaConditionCompleteQuest()
                          ToClient_qaCompleteQuest(336, 5)
                          ToClient_qaCompleteQuest(653, 6)
                          ToClient_qaCreateItem(175, 0, 1)
                          ToClient_qaCreateItem(176, 0, 1)
                          ToClient_qaCreateItem(177, 0, 1)
                          ToClient_qaCreateItem(532, 0, 200)
                        else
                          if isClassType == UI_CT.ClassType_DarkElf then
                            ToClient_qaCreateItem(11360, enchantLeve1, 1)
                            ToClient_qaCreateItem(10738, enchantLeve1, 1)
                            ToClient_qaCreateItem(10740, enchantLeve1, 1)
                            ToClient_qaCreateItem(14817, enchantLeve1, 1)
                            ToClient_qaLevelUp(60)
                            ToClient_qaConditionCompleteQuest()
                            ToClient_qaCompleteQuest(338, 5)
                            ToClient_qaCompleteQuest(653, 6)
                            ToClient_qaCreateItem(178, 0, 1)
                            ToClient_qaCreateItem(179, 0, 1)
                            ToClient_qaCreateItem(180, 0, 1)
                            ToClient_qaCreateItem(532, 0, 200)
                          else
                            if isClassType == UI_CT.ClassType_Combattant then
                              ToClient_qaCreateItem(11210, enchantLeve1, 1)
                              ToClient_qaCreateItem(11338, enchantLeve1, 1)
                              ToClient_qaCreateItem(11340, enchantLeve1, 1)
                              ToClient_qaCreateItem(14822, enchantLeve1, 1)
                              ToClient_qaLevelUp(60)
                              ToClient_qaConditionCompleteQuest()
                              ToClient_qaCompleteQuest(342, 7)
                              ToClient_qaCompleteQuest(653, 6)
                              ToClient_qaCreateItem(181, 0, 1)
                              ToClient_qaCreateItem(182, 0, 1)
                              ToClient_qaCreateItem(183, 0, 1)
                              ToClient_qaCreateItem(594, 0, 200)
                            else
                              if isClassType == UI_CT.ClassType_CombattantWomen then
                                ToClient_qaCreateItem(11210, enchantLeve1, 1)
                                ToClient_qaCreateItem(11338, enchantLeve1, 1)
                                ToClient_qaCreateItem(11340, enchantLeve1, 1)
                                ToClient_qaCreateItem(14830, enchantLeve1, 1)
                                ToClient_qaLevelUp(60)
                                ToClient_qaConditionCompleteQuest()
                                ToClient_qaCompleteQuest(343, 5)
                                ToClient_qaCompleteQuest(653, 6)
                                ToClient_qaCreateItem(184, 0, 1)
                                ToClient_qaCreateItem(185, 0, 1)
                                ToClient_qaCreateItem(186, 0, 1)
                                ToClient_qaCreateItem(594, 0, 200)
                              else
                                if isClassType == UI_CT.ClassType_Lahn then
                                  ToClient_qaCreateItem(13410, enchantLeve1, 1)
                                  ToClient_qaCreateItem(13538, enchantLeve1, 1)
                                  ToClient_qaCreateItem(13540, enchantLeve1, 1)
                                  ToClient_qaCreateItem(550502, enchantLeve1, 1)
                                  ToClient_qaLevelUp(60)
                                  ToClient_qaConditionCompleteQuest()
                                  ToClient_qaCompleteQuest(345, 5)
                                  ToClient_qaCompleteQuest(653, 6)
                                  ToClient_qaCreateItem(184, 0, 1)
                                  ToClient_qaCreateItem(185, 0, 1)
                                  ToClient_qaCreateItem(186, 0, 1)
                                  ToClient_qaCreateItem(594, 0, 200)
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

createBossArmor = function(enchantLevel)
  -- function num : 0_9
  ToClient_qaCreateItem(11013, enchantLevel, 1)
  ToClient_qaCreateItem(11101, enchantLevel, 1)
  ToClient_qaCreateItem(11015, enchantLevel, 1)
  ToClient_qaCreateItem(11016, enchantLevel, 1)
  ToClient_qaCreateItem(11103, enchantLevel, 1)
  ToClient_qaCreateItem(11017, enchantLevel, 1)
end

createAccessory = function(enchantLeve1)
  -- function num : 0_10
  if enchantLeve1 == 16 then
    ToClient_qaCreateItem(12230, 0, 1)
    ToClient_qaCreateItem(12031, 0, 2)
    ToClient_qaCreateItem(11828, 0, 2)
    ToClient_qaCreateItem(11607, 0, 1)
    ToClient_qaCreateItem(15801, 0, 2)
    ToClient_qaCreateItem(15852, 0, 2)
    ToClient_qaCreateItem(15807, 0, 2)
    ToClient_qaCreateItem(15211, 0, 2)
    ToClient_qaCreateItem(15616, 0, 2)
    ToClient_qaCreateItem(15201, 0, 2)
    ToClient_qaCreateItem(15654, 0, 2)
    ToClient_qaCreateItem(60, 0, 200)
  else
    if enchantLeve1 == 17 then
      ToClient_qaCreateItem(12230, 1, 1)
      ToClient_qaCreateItem(12031, 1, 2)
      ToClient_qaCreateItem(11828, 1, 2)
      ToClient_qaCreateItem(11607, 1, 1)
      ToClient_qaCreateItem(15801, 0, 2)
      ToClient_qaCreateItem(15852, 0, 2)
      ToClient_qaCreateItem(15807, 0, 2)
      ToClient_qaCreateItem(15211, 0, 2)
      ToClient_qaCreateItem(15616, 0, 2)
      ToClient_qaCreateItem(15201, 0, 2)
      ToClient_qaCreateItem(15654, 0, 2)
      ToClient_qaCreateItem(60, 0, 200)
    else
      if enchantLeve1 == 18 then
        ToClient_qaCreateItem(12230, 2, 1)
        ToClient_qaCreateItem(12031, 2, 2)
        ToClient_qaCreateItem(11828, 2, 2)
        ToClient_qaCreateItem(11607, 2, 1)
        ToClient_qaCreateItem(15801, 0, 2)
        ToClient_qaCreateItem(15852, 0, 2)
        ToClient_qaCreateItem(15807, 0, 2)
        ToClient_qaCreateItem(15211, 0, 2)
        ToClient_qaCreateItem(15616, 0, 2)
        ToClient_qaCreateItem(15201, 0, 2)
        ToClient_qaCreateItem(15654, 0, 2)
        ToClient_qaCreateItem(60, 0, 200)
      else
        if enchantLeve1 == 19 then
          ToClient_qaCreateItem(12230, 3, 1)
          ToClient_qaCreateItem(12031, 4, 2)
          ToClient_qaCreateItem(11828, 3, 2)
          ToClient_qaCreateItem(11607, 3, 1)
          ToClient_qaCreateItem(15801, 0, 2)
          ToClient_qaCreateItem(15852, 0, 2)
          ToClient_qaCreateItem(15807, 0, 2)
          ToClient_qaCreateItem(15211, 0, 2)
          ToClient_qaCreateItem(15616, 0, 2)
          ToClient_qaCreateItem(15201, 0, 2)
          ToClient_qaCreateItem(15654, 0, 2)
          ToClient_qaCreateItem(60, 0, 200)
        else
          if enchantLeve1 == 20 then
            ToClient_qaCreateItem(12230, 4, 1)
            ToClient_qaCreateItem(12031, 4, 2)
            ToClient_qaCreateItem(11828, 4, 2)
            ToClient_qaCreateItem(11607, 4, 1)
            ToClient_qaCreateItem(15801, 0, 2)
            ToClient_qaCreateItem(15852, 0, 2)
            ToClient_qaCreateItem(15807, 0, 2)
            ToClient_qaCreateItem(15211, 0, 2)
            ToClient_qaCreateItem(15616, 0, 2)
            ToClient_qaCreateItem(15201, 0, 2)
            ToClient_qaCreateItem(15654, 0, 2)
            ToClient_qaCreateItem(60, 0, 200)
          else
            Proc_ShowMessage_Ack("16~20 까지 범위�\140 장신�\172 생성�\180 �\128능합니다.")
          end
        end
      end
    end
  end
end

clearAllianceJoinQueue = function()
  -- function num : 0_11
  ToClient_RequestClearAllianceJoinQueue()
end

requestAddAlliance = function(name, taxRate, limitCount)
  -- function num : 0_12
  ToClient_RequestAddAllianceJoinQueue(name, taxRate, limitCount)
end

createGuildAlliance = function(allianceName)
  -- function num : 0_13
  ToClient_CreateGuildAlliance(allianceName)
end

sendJoinGuildAlliance = function(doAccept)
  -- function num : 0_14
  ToClient_sendJoinGuildAlliance(doAccept)
end

cancelCreateGuildAlliance = function()
  -- function num : 0_15
  ToClient_CancelCreateGuildAlliance()
end


