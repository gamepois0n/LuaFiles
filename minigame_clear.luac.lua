-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_clear.luac 

-- params : ...
-- function num : 0
FGlobal_MiniGame_HerbMachine = function()
  -- function num : 0_0
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameHerbMachine, (CppEnums.MiniGameParam).eMiniGameParamDefault) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameHerbMachine, (CppEnums.MiniGameParam).eMiniGameParamDefault)
  end
end

FGlobal_MiniGame_Buoy = function()
  -- function num : 0_1
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameBuoy, (CppEnums.MiniGameParam).eMiniGameParamDefault) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameBuoy, (CppEnums.MiniGameParam).eMiniGameParamDefault)
  end
end

FGlobal_MiniGame_PowerControl = function()
  -- function num : 0_2
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGamePowerControl, (CppEnums.MiniGameParam).eMiniGameParamDefault) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGamePowerControl, (CppEnums.MiniGameParam).eMiniGameParamDefault)
  end
end

FGlobal_MiniGame_Tutorial = function()
  -- function num : 0_3
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameTutorial, (CppEnums.MiniGameParam).eMiniGameParamDefault) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameTutorial, (CppEnums.MiniGameParam).eMiniGameParamDefault)
  end
end

FGlobal_MiniGame_HouseControl_Empty = function()
  -- function num : 0_4
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).Empty) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).Empty)
  end
end

FGlobal_MiniGame_HouseControl_Depot = function()
  -- function num : 0_5
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).Depot) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).Depot)
  end
end

FGlobal_MiniGame_HouseControl_Refinery = function()
  -- function num : 0_6
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).Refinery) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).Refinery)
  end
end

FGlobal_MiniGame_HouseControl_LocalSpecailtiesWorkshop = function()
  -- function num : 0_7
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).LocalSpecailtiesWorkshop) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).LocalSpecailtiesWorkshop)
  end
end

FGlobal_MiniGame_HouseControl_Shipyard = function()
  -- function num : 0_8
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).Shipyard) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameBuyHouse, (CppEnums.eHouseUseType).Shipyard)
  end
end

FGlobal_MiniGame_RequestPlantInvest = function(param)
  -- function num : 0_9
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameInvestPlant, param) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameInvestPlant, param)
  end
end

FGlobal_Tutorial_RequestSitDown = function()
  -- function num : 0_10
  if questList_hasProgressQuest(2001, 189) then
    request_clearMiniGame((CppEnums.MiniGame).eTutorialSitDown, (CppEnums.MiniGameParam).eMiniGameParamDefault)
  end
end

FGlobal_Tutorial_RequestLean = function()
  -- function num : 0_11
  if questList_hasProgressQuest(2001, 190) then
    request_clearMiniGame((CppEnums.MiniGame).eTutorialLean, (CppEnums.MiniGameParam).eMiniGameParamDefault)
  end
end

FGlobal_MiniGame_RequestPlantWorking = function()
  -- function num : 0_12
end

FGlobal_MiniGame_RequestExtraction = function()
  -- function num : 0_13
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameExtraction, (CppEnums.MiniGameParam).eMiniGameParamDefault) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameExtraction, (CppEnums.MiniGameParam).eMiniGameParamDefault)
  end
end

FGlobal_MiniGame_RequestEditingHouse = function(param)
  -- function num : 0_14
  if questList_hasProgressMiniGame((CppEnums.MiniGame).eMiniGameEditingHouse, param) then
    request_clearMiniGame((CppEnums.MiniGame).eMiniGameEditingHouse, param)
  end
end


