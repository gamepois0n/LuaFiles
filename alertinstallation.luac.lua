-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\housing\alertinstallation.luac 

-- params : ...
-- function num : 0
local eWarningType = {eHarvestWarningType_BirdAttack = 0, eHarvestWarningType_BugDetect = 1, eHarvestWarningType_BugAttack = 2, eHarvestWarningType_NeedLop = 3, eHarvestWarningType_NeedWaterUp = 4}
local warningString = {[eWarningType.eHarvestWarningType_BirdAttack] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_BIRDATTACK"), [eWarningType.eHarvestWarningType_BugDetect] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_BUGDETECT"), [eWarningType.eHarvestWarningType_BugAttack] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_BUGATTACK"), [eWarningType.eHarvestWarningType_NeedLop] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_NEEDLOP"), [eWarningType.eHarvestWarningType_NeedWaterUp] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_NEEDWATERUP")}
local warningString1 = {[eWarningType.eHarvestWarningType_BirdAttack] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_BIRDATTACK_2"), [eWarningType.eHarvestWarningType_BugDetect] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_BUGDETECT_2"), [eWarningType.eHarvestWarningType_BugAttack] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_BUGATTACK_2"), [eWarningType.eHarvestWarningType_NeedLop] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_NEEDLOP_2"), [eWarningType.eHarvestWarningType_NeedWaterUp] = PAGetString(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_NEEDWATERUP_2")}
local warningMessage = {[eWarningType.eHarvestWarningType_BirdAttack] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_0 , upvalues : warningString, eWarningType
  Proc_ShowMessage_Ack_With_ChatType(characterSSW:getName() .. " : " .. warningString[eWarningType.eHarvestWarningType_BirdAttack], nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
end
, [eWarningType.eHarvestWarningType_BugDetect] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_1 , upvalues : warningString, eWarningType
  Proc_ShowMessage_Ack_With_ChatType(characterSSW:getName() .. " : " .. warningString[eWarningType.eHarvestWarningType_BugDetect], nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
end
, [eWarningType.eHarvestWarningType_BugAttack] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_2
end
, [eWarningType.eHarvestWarningType_NeedLop] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_3 , upvalues : warningString, eWarningType
  Proc_ShowMessage_Ack_With_ChatType(characterSSW:getName() .. " : " .. warningString[eWarningType.eHarvestWarningType_NeedLop], nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
end
, [eWarningType.eHarvestWarningType_NeedWaterUp] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_4 , upvalues : warningString, eWarningType
  if (math.floor)(progressingInfo:getNeedWater() / 200000) == (math.floor)(addtionalValue1 / 200000) then
    return 
  end
  if progressingInfo:getNeedWater() >= 500000 then
    Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_GETNEEDWATER", "getName", characterSSW:getName())), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
  else
    Proc_ShowMessage_Ack_With_ChatType(characterSSW:getName() .. " : " .. warningString[eWarningType.eHarvestWarningType_NeedWaterUp], nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
  end
end
}
local warningMessage1 = {[eWarningType.eHarvestWarningType_BirdAttack] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_5 , upvalues : warningString1, eWarningType
  Proc_ShowMessage_Ack_With_ChatType(characterSSW:getName() .. " : " .. warningString1[eWarningType.eHarvestWarningType_BirdAttack], nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
end
, [eWarningType.eHarvestWarningType_BugDetect] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_6 , upvalues : warningString1, eWarningType
  Proc_ShowMessage_Ack_With_ChatType(characterSSW:getName() .. " : " .. warningString1[eWarningType.eHarvestWarningType_BugDetect], nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
end
, [eWarningType.eHarvestWarningType_BugAttack] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_7
end
, [eWarningType.eHarvestWarningType_NeedLop] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_8 , upvalues : warningString1, eWarningType
  Proc_ShowMessage_Ack_With_ChatType(characterSSW:getName() .. " : " .. warningString1[eWarningType.eHarvestWarningType_NeedLop], nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
end
, [eWarningType.eHarvestWarningType_NeedWaterUp] = function(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  -- function num : 0_9 , upvalues : warningString1, eWarningType
  if (math.floor)(progressingInfo:getNeedWater() / 200000) == (math.floor)(addtionalValue1 / 200000) then
    return 
  end
  if progressingInfo:getNeedWater() >= 500000 then
    Proc_ShowMessage_Ack_With_ChatType((PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALERTINSTALLATION_GETNEEDWATER", "getName", characterSSW:getName())), nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
  else
    Proc_ShowMessage_Ack_With_ChatType(characterSSW:getName() .. " : " .. warningString1[eWarningType.eHarvestWarningType_NeedWaterUp], nil, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Harvest)
  end
end
}
FromClient_InstallationInfoWarning = function(warningType, tentPosition, characterSSW, progressingInfo, actorWrapper, addtionalValue1)
  -- function num : 0_10 , upvalues : warningMessage1, warningMessage
  if progressingInfo == nil then
    return 
  end
  if actorWrapper == nil then
    return 
  end
  local installationType = ((actorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):getInstallationType()
  if (CppEnums.InstallationType).eType_LivestockHarvest == installationType then
    (warningMessage1[warningType])(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  else
    ;
    (warningMessage[warningType])(tentPosition, characterSSW, progressingInfo, addtionalValue1)
  end
end

registerEvent("FromClient_InstallationInfoWarning", "FromClient_InstallationInfoWarning")

