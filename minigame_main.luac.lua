-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_main.luac 

-- params : ...
-- function num : 0
local MGT = CppEnums.MiniGameType
local IM = CppEnums.EProcessorInputMode
local currentMiniGame = -1
local lastUIMode = nil
ActionMiniGame_Main = function(gameIndex)
  -- function num : 0_0 , upvalues : MGT, currentMiniGame, lastUIMode
  if gameIndex < MGT.MiniGameType_0 or MGT.MiniGameType_17 < gameIndex or currentMiniGame == gameIndex then
    return 
  end
  if MGT.MiniGameType_0 == gameIndex then
    Panel_Minigame_Gradient_Start()
  else
    if MGT.MiniGameType_1 == gameIndex then
      Panel_Minigame_SinGauge_Start()
    else
      if MGT.MiniGameType_2 == gameIndex then
        Panel_Minigame_Command_Start()
      else
        if MGT.MiniGameType_3 == gameIndex then
          Panel_Minigame_Rhythm_Start()
        else
          if MGT.MiniGameType_4 == gameIndex then
            Panel_Minigame_BattleGauge_Start()
          else
            if MGT.MiniGameType_5 == gameIndex then
              Panel_Minigame_FillGauge_Start()
            else
              if MGT.MiniGameType_6 == gameIndex then
                Panel_Minigame_GradientY_Start()
              else
                if MGT.MiniGameType_7 == gameIndex then
                  Panel_Minigame_Timing_Start()
                else
                end
              end
            end
          end
        end
      end
    end
  end
  if (MGT.MiniGameType_8 == gameIndex and MGT.MiniGameType_9 ~= gameIndex) or MGT.MiniGameType_10 == gameIndex then
    Panel_Minigame_RhythmForAction_Start()
  else
    if MGT.MiniGameType_11 == gameIndex then
      Panel_Minigame_HerbMachine_Start()
    else
      if MGT.MiniGameType_12 == gameIndex then
        Panel_Minigame_Buoy_Start()
      else
        if MGT.MiniGameType_13 == gameIndex then
          Panel_Minigame_Steal_Start()
        else
          if MGT.MiniGameType_14 == gameIndex then
            Panel_MiniGame_PowerControl_Start()
          else
            if MGT.MiniGameType_15 == gameIndex then
              Panel_MiniGame_Jaksal_Start()
            else
              if MGT.MiniGameType_16 == gameIndex then
                Panel_Minigame_Rhythm_Drum_Start()
              else
                if MGT.MiniGameType_17 == gameIndex then
                  Panel_Minigame_SteeringWheel_Start()
                end
              end
            end
          end
        end
      end
    end
  end
  lastUIMode = GetUIMode()
  SetUIMode((Defines.UIMode).eUIMode_MiniGame)
  currentMiniGame = gameIndex
end

ActionMiniGame_Stop = function()
  -- function num : 0_1 , upvalues : currentMiniGame, MGT, IM, lastUIMode
  if currentMiniGame < MGT.MiniGameType_0 or MGT.MiniGameType_17 < currentMiniGame then
    return 
  end
  if MGT.MiniGameType_0 == currentMiniGame then
    Panel_Minigame_Gradient_End()
  else
    if MGT.MiniGameType_1 == currentMiniGame then
      Panel_Minigame_SinGauge_End()
    else
      if MGT.MiniGameType_2 == currentMiniGame then
        Panel_Minigame_Command_End()
      else
        if MGT.MiniGameType_3 == currentMiniGame then
          Panel_Minigame_Rhythm_End()
        else
          if MGT.MiniGameType_4 == currentMiniGame then
            Panel_Minigame_BattleGauge_End()
          else
            if MGT.MiniGameType_5 == currentMiniGame then
              Panel_Minigame_FillGauge_End()
            else
              if MGT.MiniGameType_6 == currentMiniGame then
                Panel_Minigame_GradientY_End()
              else
                if MGT.MiniGameType_7 == currentMiniGame then
                  Panel_Minigame_Timing_End()
                else
                end
              end
            end
          end
        end
      end
    end
  end
  if (MGT.MiniGameType_8 == currentMiniGame and MGT.MiniGameType_9 ~= currentMiniGame) or MGT.MiniGameType_10 == currentMiniGame then
    Panel_Minigame_RhythmForAction_End()
  else
    if MGT.MiniGameType_11 == currentMiniGame then
      Panel_Minigame_HerbMachine_End()
    else
      if MGT.MiniGameType_12 == currentMiniGame then
        Panel_Minigame_Buoy_End()
      else
        if MGT.MiniGameType_13 == currentMiniGame then
          Panel_Minigame_Steal_End()
        else
          if MGT.MiniGameType_14 == currentMiniGame then
            Panel_MiniGame_PowerControl_End()
          else
            if MGT.MiniGameType_15 == currentMiniGame then
              Panel_MiniGame_Jaksal_End()
            else
              if MGT.MiniGameType_16 == currentMiniGame then
                Panel_Minigame_Rhythm_Drum_End()
              else
                if MGT.MiniGameType_17 == currentMiniGame then
                  Panel_Minigame_SteeringWheel_End()
                end
              end
            end
          end
        end
      end
    end
  end
  SetUIMode((Defines.UIMode).eUIMode_Default)
  if AllowChangeInputMode() then
    if check_ShowWindow() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
  lastUIMode = nil
  currentMiniGame = -1
end

Panel_Minigame_EventKeyPress = function(keyType)
  -- function num : 0_2 , upvalues : currentMiniGame, MGT
  if currentMiniGame < MGT.MiniGameType_0 or MGT.MiniGameType_17 < currentMiniGame then
    return 
  end
  if ((((((MGT.MiniGameType_0 ~= currentMiniGame or MGT.MiniGameType_1 == currentMiniGame) and MGT.MiniGameType_2 ~= currentMiniGame) or MGT.MiniGameType_3 == currentMiniGame) and MGT.MiniGameType_4 ~= currentMiniGame) or MGT.MiniGameType_5 == currentMiniGame) and MGT.MiniGameType_6 ~= currentMiniGame) or MGT.MiniGameType_7 == currentMiniGame then
    Panel_Minigame_Timing_Freeze(keyType)
  else
  end
  if ((MGT.MiniGameType_8 ~= currentMiniGame or MGT.MiniGameType_9 == currentMiniGame) and MGT.MiniGameType_10 ~= currentMiniGame) or MGT.MiniGameType_11 == currentMiniGame then
    Panel_Minigame_HerbMachine_Freeze(keyType)
  else
    if MGT.MiniGameType_12 == currentMiniGame then
      Panel_Minigame_Buoy_Freeze(keyType)
    else
      if MGT.MiniGameType_13 == currentMiniGame then
        Minigame_Steal_PressKey(keyType)
      else
      end
    end
  end
  if MGT.MiniGameType_14 ~= currentMiniGame or MGT.MiniGameType_15 == currentMiniGame then
    Panel_MiniGame_Jaksal_KeyPressCheck(keyType)
  else
  end
  if MGT.MiniGameType_16 == currentMiniGame then
  end
end

registerEvent("EventActionMiniGameKeyDownOnce", "Panel_Minigame_EventKeyPress")
Panel_Minigame_UpdateFunc = function(deltaTime)
  -- function num : 0_3 , upvalues : currentMiniGame, MGT
  if currentMiniGame < MGT.MiniGameType_0 or MGT.MiniGameType_17 < currentMiniGame then
    return 
  end
  if MGT.MiniGameType_0 == currentMiniGame then
    MiniGame_GaugeBarMoveCalc(deltaTime)
  else
  end
  if MGT.MiniGameType_1 ~= currentMiniGame or MGT.MiniGameType_2 == currentMiniGame then
    Command_UpdateText(deltaTime)
  else
    if MGT.MiniGameType_3 == currentMiniGame then
      RhythmGame_UpdateFunc(deltaTime)
    else
    end
  end
  if MGT.MiniGameType_4 ~= currentMiniGame or MGT.MiniGameType_5 == currentMiniGame then
    FillGauge_UpdatePerFrame(deltaTime)
  else
    if MGT.MiniGameType_6 == currentMiniGame then
      MiniGame_GaugeBarMoveCalcY(deltaTime)
    else
      if MGT.MiniGameType_7 == currentMiniGame then
        Panel_Minigame_Timing_Perframe(deltaTime)
      else
      end
    end
  end
  if ((MGT.MiniGameType_8 ~= currentMiniGame or MGT.MiniGameType_9 == currentMiniGame) and MGT.MiniGameType_10 ~= currentMiniGame) or MGT.MiniGameType_11 == currentMiniGame then
    Panel_Minigame_HerbMachine_Perframe(deltaTime)
  else
    if MGT.MiniGameType_12 == currentMiniGame then
      Panel_Minigame_Buoy_Perframe(deltaTime)
    else
    end
  end
  if ((MGT.MiniGameType_13 ~= currentMiniGame or MGT.MiniGameType_14 == currentMiniGame) and MGT.MiniGameType_15 ~= currentMiniGame) or MGT.MiniGameType_16 == currentMiniGame then
    RhythmGame_Drum_UpdateFunc(deltaTime)
  else
    if MGT.MiniGameType_17 == currentMiniGame then
      MiniGame_SteeringWhellMoveCalc(deltaTime)
    end
  end
end

local keyDownFunctorList = {}
local keyUpFunctorList = {}
AddMiniGameKeyDownOnce = function(miniGameType, functor)
  -- function num : 0_4 , upvalues : keyDownFunctorList
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  keyDownFunctorList[miniGameType] = functor
end

AddMiniGameKeyUp = function(miniGameType, functor)
  -- function num : 0_5 , upvalues : keyUpFunctorList
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  keyUpFunctorList[miniGameType] = functor
end

EventActionMiniGameKeyDownOnce = function(keyType)
  -- function num : 0_6 , upvalues : keyDownFunctorList, currentMiniGame
  local functor = keyDownFunctorList[currentMiniGame]
  if functor ~= nil then
    functor(keyType)
  end
end

EventActionMiniGameKeyUp = function(keyType)
  -- function num : 0_7 , upvalues : keyUpFunctorList, currentMiniGame
  local functor = keyUpFunctorList[currentMiniGame]
  if functor ~= nil then
    functor(keyType)
  end
end

registerEvent("EventStartActionMiniGame", "ActionMiniGame_Main")
registerEvent("EventEndActionMiniGame", "ActionMiniGame_Stop")
registerEvent("EventActionMiniGameKeyDownOnce", "EventActionMiniGameKeyDownOnce")
registerEvent("EventActionMiniGameKeyUp", "EventActionMiniGameKeyUp")

