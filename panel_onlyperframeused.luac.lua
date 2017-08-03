-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\panel_onlyperframeused.luac 

-- params : ...
-- function num : 0
local luaLoadAfterTime = 0
local luaLoadAfterFrameCount = 0
local alchemyStoneTimeCheck = 0
FGlobal_getLuaLoadTime = function()
  -- function num : 0_0 , upvalues : luaLoadAfterTime
  return luaLoadAfterTime
end

FGlobal_getFrameCount = function()
  -- function num : 0_1 , upvalues : luaLoadAfterFrameCount
  return luaLoadAfterFrameCount
end

Panel_OnlyPerframeUsedFunction = function(deltaTime)
  -- function num : 0_2 , upvalues : luaLoadAfterTime, luaLoadAfterFrameCount, alchemyStoneTimeCheck
  luaLoadAfterTime = luaLoadAfterTime + deltaTime
  luaLoadAfterFrameCount = luaLoadAfterFrameCount + 1
  if NewQuickSlot_UpdatePerFrame ~= nil then
    NewQuickSlot_UpdatePerFrame(deltaTime)
  end
  if Competition_UpdatePerFrame ~= nil then
    Competition_UpdatePerFrame(deltaTime)
  end
  if GameTips_MessageUpdate ~= nil then
    GameTips_MessageUpdate(deltaTime)
  end
  if OnlyPerFrame_ProgressBar_Collect_Update ~= nil then
    OnlyPerFrame_ProgressBar_Collect_Update(deltaTime)
  end
  if WorldMap_NaviButton_RePos ~= nil then
    WorldMap_NaviButton_RePos()
  end
  if ChattingViewManager_UpdatePerFrame ~= nil then
    ChattingViewManager_UpdatePerFrame(deltaTime)
  end
  do
    if FGlobal_AlchemyStonCheck() ~= nil then
      local cooltime = FGlobal_AlchemyStonCheck()
      if cooltime > 0 then
        if alchemyStoneTimeCheck == 0 then
          FGlobal_AlchemyStone_Use()
        end
        alchemyStoneTimeCheck = alchemyStoneTimeCheck + deltaTime
        if cooltime < alchemyStoneTimeCheck then
          alchemyStoneTimeCheck = 0
        end
      else
        alchemyStoneTimeCheck = 0
      end
    end
    if FGlobal_AutoQuestManager_UpdatePerFrame ~= nil then
      FGlobal_AutoQuestManager_UpdatePerFrame(deltaTime)
    end
    if AutoFrameCheckManager_UpdatePerFrame ~= nil then
      AutoFrameCheckManager_UpdatePerFrame()
    end
    if Update_ReconnectHorse ~= nil then
      Update_ReconnectHorse()
    end
    if Auto_FrameMove ~= nil then
      Auto_FrameMove(deltaTime)
    end
    if Panel_ConsoleKeyGuide_updateConsole ~= nil then
      Panel_ConsoleKeyGuide_updateConsole()
    end
    if (CppEnums.CountryType).DEV == getGameServiceType() and ConsoleUISimplifyPerFrameUpdate ~= nil then
      ConsoleUISimplifyPerFrameUpdate(deltaTime)
    end
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_OnlyPerframeUsed")
FromClient_luaLoadComplete_OnlyPerframeUsed = function()
  -- function num : 0_3
  Panel_OnlyPerframeUsed:SetShow(true)
  Panel_OnlyPerframeUsed:RegisterUpdateFunc("Panel_OnlyPerframeUsedFunction")
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    Panel_OnlyPerframeUsed:setConsoleUIPanelType(3)
  end
end


