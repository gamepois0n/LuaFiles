-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\trademarket\panel_tradegame.luac 

-- params : ...
-- function num : 0
Panel_TradeGame:SetShow(false)
Panel_TradeGame:setGlassBackground(true)
Panel_TradeGame:SetDragEnable(true)
Panel_TradeGame:SetDragAll(true)
Panel_TradeGame:SetPosX(getScreenSizeX() / 2 - Panel_TradeGame:GetSizeX() / 2)
Panel_TradeGame:SetPosY(getScreenSizeY() / 2 - Panel_TradeGame:GetSizeY() / 2)
local VCK = CppEnums.VirtualKeyCode
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local enTradeGameSwitchType = {enTradeGameSwitchType_Small = 0, enTradeGameSwitchType_Large = 1}
local enTradeGameResult = {enTradeGameResult_None; enTradeGameResult_Less = 0, enTradeGameResult_More = 1, enTradeGameResult_Correct = 2, enTradeGameResult_NoTryCount = 3}
local enTradeGameState = {enTradeGameState_Play = 1, enTradeGameState_Finish = 2}
local lowDice_Msg = {}
local highDice_Msg = {}
lowDice_Msg[1] = {_low = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_LOWDICE0_LOW"), _middle = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_LOWDICE0_MIDDLE"), _high = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_LOWDICE0_HIGH")}
lowDice_Msg[2] = {_low = "", _middle = "", _high = ""}
lowDice_Msg[3] = {_low = "", _middle = "", _high = ""}
lowDice_Msg[4] = {_low = "", _middle = "", _high = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_LOWDICE4_HIGH")}
highDice_Msg[1] = {_low = "", _middle = "", _high = ""}
highDice_Msg[2] = {_low = "", _middle = "", _high = ""}
highDice_Msg[3] = {_low = "", _middle = "", _high = ""}
highDice_Msg[4] = {_low = "", _middle = "", _high = ""}
local result_Msg = {success = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_RESULT_MSG_SUCCESS"), fail = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_RESULT_MSG_FAIL")}
local tradeGame = {_tradeGameState = enTradeGameState.enTradeGameState_Finish, _minGoalValue = 0, _maxGoalValue = 0, _tryCount = 0, _currentDiceValue = 0, _updownValue = 1, _prevDiceResult = enTradeGameResult.enTradeGameResult_Less, _isRotateSwitch = false}
local tradeGameBG = (UI.getChildControl)(Panel_TradeGame, "Static_TradeGame_BG")
local balanceArm = (UI.getChildControl)(Panel_TradeGame, "Static_ScaleBalance_Arm")
local balancePlateLeft = (UI.getChildControl)(Panel_TradeGame, "Static_ScaleBalance_Plate_Left")
local balancePlateRight = (UI.getChildControl)(Panel_TradeGame, "Static_ScaleBalance_Plate_Right")
local balancePoll = (UI.getChildControl)(Panel_TradeGame, "Static_ScaleBalance_Poll")
local btnLowDice = (UI.getChildControl)(Panel_TradeGame, "Button_TradeGame_LowDice")
local btnHighDice = (UI.getChildControl)(Panel_TradeGame, "Button_TradeGame_HighDice")
local btnRestart = (UI.getChildControl)(Panel_TradeGame, "Button_Restart")
local btnSellAll = (UI.getChildControl)(Panel_TradeGame, "Button_SellAll")
local remainCount = (UI.getChildControl)(Panel_TradeGame, "StaticText_RemainCount")
local processMsg = (UI.getChildControl)(Panel_TradeGame, "StaticText_ProcessMsg")
local resultMsg = (UI.getChildControl)(Panel_TradeGame, "StaticText_ResultMsg")
local tradeGameDescBG = (UI.getChildControl)(Panel_TradeGame, "Static_TradeGame_DescBG")
local tradeGameDescText = (UI.getChildControl)(Panel_TradeGame, "StaticText_Desc")
local tradeGameDescText_1 = (UI.getChildControl)(Panel_TradeGame, "StaticText_Desc_1")
local tradeGameDescText_2 = (UI.getChildControl)(Panel_TradeGame, "StaticText_Desc_2")
local tradeGameDescText_3 = (UI.getChildControl)(Panel_TradeGame, "StaticText_Desc_3")
local tradeGameDescText_4 = (UI.getChildControl)(Panel_TradeGame, "StaticText_Desc_4")
local btnClose = (UI.getChildControl)(Panel_TradeGame, "Button_Close")
local btnQuestion = (UI.getChildControl)(Panel_TradeGame, "Button_Question")
local msgTooltipType = 0
local processMsgPosY = processMsg:GetPosY()
btnLowDice:addInputEvent("Mouse_LUp", "tradeGame_LowDice()")
btnLowDice:addInputEvent("Mouse_On", "TradeGame_HelpDesc(true," .. 1 .. ")")
btnLowDice:addInputEvent("Mouse_Out", "TradeGame_HelpDesc(false)")
btnHighDice:addInputEvent("Mouse_LUp", "tradeGame_HighDice()")
btnHighDice:addInputEvent("Mouse_On", "TradeGame_HelpDesc(true," .. 2 .. ")")
btnHighDice:addInputEvent("Mouse_Out", "TradeGame_HelpDesc(false)")
btnRestart:addInputEvent("Mouse_LUp", "TradeGame_Restart()")
btnSellAll:addInputEvent("Mouse_LUp", "HandleClicked_TradeItem_AllSellQuestion()")
processMsg:addInputEvent("Mouse_On", "TradeGame_HelpDesc(true, " .. msgTooltipType .. ")")
processMsg:addInputEvent("Mouse_Out", "TradeGame_HelpDesc( false )")
btnClose:addInputEvent("Mouse_LUp", "Fglobal_TradeGame_Close()")
processMsg:SetAutoResize(true)
local textSizeY = tradeGameDescText:GetTextSizeY()
tradeGameDescText:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
tradeGameDescText:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRADEGAME_DESC"))
tradeGameDescText_1:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
tradeGameDescText_1:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRADEGAME_DESC1"))
tradeGameDescText_2:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
tradeGameDescText_2:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRADEGAME_DESC2"))
tradeGameDescText_3:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
tradeGameDescText_3:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRADEGAME_DESC3"))
tradeGameDescText_4:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
tradeGameDescText_4:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TRADEGAME_DESC4"))
if (getGameServiceType() == 7 or getGameServiceType() == 8) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
  processMsg:SetTextMode(UI_TM.eTextMode_LimitText)
else
  processMsg:SetTextMode(UI_TM.eTextMode_AutoWrap)
end
TradeGame_Restart = function()
  -- function num : 0_0
  local talker = dialog_getTalker()
  if talker == nil then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = (selfPlayer:get()):getInventorySlotCount(true)
  local inventory = (selfPlayer:get()):getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local invenMaxSize = inventory:sizeXXX()
  local freeCount = inventory:getFreeCount()
  if invenUseSize - useStartSlot <= invenUseSize - freeCount - useStartSlot then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_SELLLIST_DONTPLAYGAME"))
    return 
  end
  local wp = selfPlayer:getWp()
  if FGlobal_MySellCount() <= 0 then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_2")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_1"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    if wp < 5 then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_3")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_1"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      return 
    end
    do
      local tradeGameRestartGo = function()
    -- function num : 0_0_0 , upvalues : talker
    ToClient_TradeGameStart(talker:getActorKey())
  end

      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_4") .. " " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERRANDOMSELECT_NOWWP", "getWp", wp)
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEMARKET_TRADEGAME_MSG_1"), content = messageBoxMemo, functionYes = tradeGameRestartGo, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  end
end

local isLowDiceClicked = nil
local tradeGameSuccess = false
local isTradeGameEnd = false
local applyRotateValue = 0
local deltaTimeElapsed = 0
local fixedDegree = 30
local startRadian = 0
local startDegree = -30
local elapsedAngle = 0
local leftStartPosX = 0
local leftStartPosY = 0
local rightStartPosX = 0
local rightStartPosY = 0
local centerPosX = 0
local centerPosY = 0
local halfSizeX = balancePlateRight:GetSizeX() / 2
local limitAngle = 60 * math.pi / 180
leftStartPosX = balancePlateLeft:GetPosX() + halfSizeX
leftStartPosY = balancePlateLeft:GetPosY()
rightStartPosX = balancePlateRight:GetPosX() + halfSizeX
rightStartPosY = balancePlateRight:GetPosY()
centerPosX = balanceArm:GetPosX() + balanceArm:GetSizeX() / 2
centerPosY = balanceArm:GetPosY() + balanceArm:GetSizeY() / 2
local resetTradeGameInfo = function()
  -- function num : 0_1 , upvalues : tradeGame, deltaTimeElapsed, balanceArm, enTradeGameState, enTradeGameResult
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  tradeGame._currentDiceValue = 0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  tradeGame._minGoalValue = 0
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  tradeGame._maxGoalValue = 0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  tradeGame._updownValue = 1
  deltaTimeElapsed = 0
  balanceArm:SetRotate(0)
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  tradeGame._isRotateSwitch = false
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  tradeGame._tradeGameState = enTradeGameState.enTradeGameState_Finish
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  tradeGame._prevDiceResult = enTradeGameResult.enTradeGameResult_Less
end

local tradeGameSet = 0
local setTradeGameCountrySet = function()
  -- function num : 0_2 , upvalues : tradeGameSet, processMsg
  if (getGameServiceType() == 7 or getGameServiceType() == 8) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
    tradeGameSet = 1
    processMsg:SetIgnore(false)
  else
    tradeGameSet = 0
    processMsg:SetIgnore(true)
  end
end

FromClient_TradeGameStart = function(minGoal, maxGoal, tryCount, startDice)
  -- function num : 0_3 , upvalues : tradeGameSuccess, isTradeGameEnd, resultMsg, processMsg, resetTradeGameInfo, isLowDiceClicked, balancePoll, balanceArm, tradeGame, remainCount, btnRestart, btnSellAll, enTradeGameState, enTradeGameResult, startDegree, fixedDegree, startRadian, elapsedAngle
  tradeGameSuccess = false
  isTradeGameEnd = false
  resultMsg:SetShow(false)
  processMsg:SetShow(true)
  processMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_PROCESSMSG"))
  ProcessMsg_SetPos()
  resetTradeGameInfo()
  isLowDiceClicked = nil
  balancePoll:EraseAllEffect()
  balanceArm:EraseAllEffect()
  resultMsg:EraseAllEffect()
  SetUIMode((Defines.UIMode).eUIMode_TradeGame)
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R4 in 'UnsetPending'

  tradeGame._currentDiceValue = startDice
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R4 in 'UnsetPending'

  tradeGame._minGoalValue = minGoal
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R4 in 'UnsetPending'

  tradeGame._maxGoalValue = maxGoal
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R4 in 'UnsetPending'

  tradeGame._tryCount = tryCount
  remainCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEGAME_REMAINCOUNT", "tryCount", tradeGame._tryCount))
  if not Panel_TradeGame:GetShow() then
    Panel_TradeGame:SetShow(true)
  end
  btnRestart:SetShow(false)
  btnSellAll:SetShow(false)
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R4 in 'UnsetPending'

  tradeGame._tradeGameState = enTradeGameState.enTradeGameState_Play
  -- DECOMPILER ERROR at PC85: Confused about usage of register: R4 in 'UnsetPending'

  if startDice > 0 then
    tradeGame._prevDiceResult = enTradeGameResult.enTradeGameResult_More
  else
    -- DECOMPILER ERROR at PC90: Confused about usage of register: R4 in 'UnsetPending'

    tradeGame._prevDiceResult = enTradeGameResult.enTradeGameResult_Less
  end
  startDegree = fixedDegree * startDice / 100
  startRadian = startDegree * math.pi / 180
  elapsedAngle = startDegree
  move_TradeGameControl(startRadian)
  processMsg:EraseAllEffect()
end

global_Update_TradeGame = function(deltaTime)
  -- function num : 0_4 , upvalues : tradeGame, deltaTimeElapsed, startRadian, applyRotateValue
  if tradeGame._isRotateSwitch == true then
    deltaTimeElapsed = deltaTimeElapsed + deltaTime * tradeGame._updownValue
    local tmepApplyAngle = startRadian + deltaTimeElapsed
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

    -- DECOMPILER ERROR at PC21: Unhandled construct in 'MakeBoolean' P1

    if tradeGame._updownValue == 1 and applyRotateValue < tmepApplyAngle then
      tradeGame._isRotateSwitch = false
    end
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

    if tmepApplyAngle < applyRotateValue then
      tradeGame._isRotateSwitch = false
    end
    move_TradeGameControl(tmepApplyAngle)
  end
end

rotateBalances = function(scaleControl, startPosX, startPosY, rotCenterPosX, rotCenterPosY, elpasedDeltaTime)
  -- function num : 0_5 , upvalues : halfSizeX
  local rotPosX = startPosX - rotCenterPosX
  local rotPosY = startPosY - rotCenterPosY
  local controlPosX = rotPosX * (math.cos)(elpasedDeltaTime) - rotPosY * (math.sin)(elpasedDeltaTime)
  local controlPosY = rotPosX * (math.sin)(elpasedDeltaTime) + rotPosY * (math.cos)(elpasedDeltaTime)
  scaleControl:SetPosX(controlPosX + rotCenterPosX - halfSizeX)
  scaleControl:SetPosY(controlPosY + rotCenterPosY)
end

move_TradeGameControl = function(rateDeltaTime)
  -- function num : 0_6 , upvalues : balanceArm, balancePlateRight, rightStartPosX, rightStartPosY, centerPosX, centerPosY, balancePlateLeft, leftStartPosX, leftStartPosY
  balanceArm:SetRotate(rateDeltaTime)
  rotateBalances(balancePlateRight, rightStartPosX, rightStartPosY, centerPosX, centerPosY, rateDeltaTime)
  rotateBalances(balancePlateLeft, leftStartPosX, leftStartPosY, centerPosX, centerPosY, rateDeltaTime)
end

FromClient_TradeGameReciveDice = function(diceValue, gameResult)
  -- function num : 0_7 , upvalues : enTradeGameResult, tradeGame, enTradeGameState, remainCount, elapsedAngle, fixedDegree, applyRotateValue, msgTooltipType, processMsg
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  if enTradeGameResult.enTradeGameResult_NoTryCount == gameResult or enTradeGameResult.enTradeGameResult_None == gameResult then
    tradeGame._tradeGameState = enTradeGameState.enTradeGameState_Finish
    return 
  end
  if enTradeGameState.enTradeGameState_Play ~= tradeGame._tradeGameState then
    return 
  end
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R2 in 'UnsetPending'

  tradeGame._tryCount = tradeGame._tryCount - 1
  remainCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TRADEGAME_REMAINCOUNT", "tryCount", tradeGame._tryCount))
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

  if enTradeGameResult.enTradeGameResult_Less == tradeGame._prevDiceResult then
    tradeGame._updownValue = 1
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

    tradeGame._isRotateSwitch = true
  end
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R2 in 'UnsetPending'

  if enTradeGameResult.enTradeGameResult_More == tradeGame._prevDiceResult then
    tradeGame._updownValue = -1
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R2 in 'UnsetPending'

    tradeGame._isRotateSwitch = true
  end
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

  tradeGame._prevDiceResult = gameResult
  elapsedAngle = elapsedAngle + diceValue / 100 * fixedDegree * tradeGame._updownValue
  applyRotateValue = elapsedAngle * math.pi / 180
  -- DECOMPILER ERROR at PC80: Confused about usage of register: R2 in 'UnsetPending'

  tradeGame._currentDiceValue = tradeGame._currentDiceValue + diceValue * tradeGame._updownValue
  local processText = ""
  if isLowDiceBtnClicked() == true then
    if tradeGame._currentDiceValue > -10 and tradeGame._currentDiceValue < 10 then
      processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_1")
      msgTooltipType = 1
    else
      if tradeGame._currentDiceValue > -20 and tradeGame._currentDiceValue < 20 then
        processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_2")
        msgTooltipType = 2
      else
        if tradeGame._currentDiceValue > -30 and tradeGame._currentDiceValue < 30 then
          processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_3")
          msgTooltipType = 3
        else
          if tradeGame._currentDiceValue > -40 and tradeGame._currentDiceValue < 40 then
            processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_4")
            msgTooltipType = 4
          else
            if tradeGame._currentDiceValue > -50 and tradeGame._currentDiceValue < 50 then
              processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_5")
              msgTooltipType = 5
            else
              if tradeGame._currentDiceValue > -60 and tradeGame._currentDiceValue < 60 then
                processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_6")
                msgTooltipType = 6
              else
                processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_NOINTEREST")
                msgTooltipType = 7
              end
            end
          end
        end
      end
    end
  else
    if tradeGame._currentDiceValue > -10 and tradeGame._currentDiceValue < 10 then
      processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_1")
      msgTooltipType = 8
    else
      if tradeGame._currentDiceValue > -20 and tradeGame._currentDiceValue < 20 then
        processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_2")
        msgTooltipType = 9
      else
        if tradeGame._currentDiceValue > -30 and tradeGame._currentDiceValue < 30 then
          processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_3")
          msgTooltipType = 10
        else
          if tradeGame._currentDiceValue > -40 and tradeGame._currentDiceValue < 40 then
            processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_4")
            msgTooltipType = 11
          else
            if tradeGame._currentDiceValue > -50 and tradeGame._currentDiceValue < 50 then
              processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_5")
              msgTooltipType = 12
            else
              if tradeGame._currentDiceValue > -60 and tradeGame._currentDiceValue < 60 then
                processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_6")
                msgTooltipType = 13
              else
                processText = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_NOINTEREST")
                msgTooltipType = 14
              end
            end
          end
        end
      end
    end
  end
  processMsg:SetText(processText)
  ProcessMsg_SetPos()
end

FromClient_TradeGameResult = function(isSuccess)
  -- function num : 0_8 , upvalues : tradeGame, enTradeGameState, resultMsg, processMsg, result_Msg, tradeGameSuccess, balancePoll, balanceArm, btnSellAll, btnRestart, isTradeGameEnd
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  tradeGame._tradeGameState = enTradeGameState.enTradeGameState_Finish
  if isSuccess == true then
    audioPostEvent_SystemUi(11, 8)
    resultMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_BARGAINING_SUCCESS"))
    processMsg:SetText(result_Msg.success)
    tradeGameSuccess = true
    global_sellItemFromPlayer()
    balancePoll:AddEffect("fUI_TradeGame_BackgroundLight", true, 0, 0)
    balanceArm:AddEffect("fUI_TradeGame_EmeraldLight", true, 0, 0)
    btnSellAll:SetShow(true)
  else
    audioPostEvent_SystemUi(11, 9)
    resultMsg:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_BARGAINING_FAIL"))
    processMsg:SetText(result_Msg.fail)
    tradeGameSuccess = false
    balanceArm:AddEffect("fUI_TradeGame_EmeraldLight_Failed", false, 0, 0)
    btnRestart:SetShow(true)
  end
  resultMsg:SetVertexAniRun("Ani_Scale_New", true)
  resultMsg:AddEffect("fUI_TradeGame_Complete", true, 0, 0)
  resultMsg:SetShow(true)
  isTradeGameEnd = true
  ProcessMsg_SetPos()
end

tradeGame_LowDice = function()
  -- function num : 0_9 , upvalues : enTradeGameState, tradeGame, isLowDiceClicked, enTradeGameSwitchType
  if enTradeGameState.enTradeGameState_Play ~= tradeGame._tradeGameState then
    return 
  end
  isLowDiceClicked = true
  ToClient_TradeGameDice(enTradeGameSwitchType.enTradeGameSwitchType_Small)
end

tradeGame_HighDice = function()
  -- function num : 0_10 , upvalues : enTradeGameState, tradeGame, isLowDiceClicked, enTradeGameSwitchType
  if enTradeGameState.enTradeGameState_Play ~= tradeGame._tradeGameState then
    return 
  end
  isLowDiceClicked = false
  ToClient_TradeGameDice(enTradeGameSwitchType.enTradeGameSwitchType_Large)
end

TradeGame_HelpDesc = function(isShow, btnType)
  -- function num : 0_11 , upvalues : btnLowDice, btnHighDice, msgTooltipType, tradeGameSet, processMsg
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local control = nil
  local helpDesc = ""
  if btnType == 1 then
    control = btnLowDice
    helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_WARNNING_BARGAIN")
  else
    if btnType == 2 then
      control = btnHighDice
      helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_STRONG_BARGAIN")
    else
      if msgTooltipType == 0 and tradeGameSet == 1 then
        control = processMsg
        helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_PROCESSMSG")
      else
        if msgTooltipType == 1 and tradeGameSet == 1 then
          control = processMsg
          helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_1")
        else
          if msgTooltipType == 2 and tradeGameSet == 1 then
            control = processMsg
            helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_2")
          else
            if msgTooltipType == 3 and tradeGameSet == 1 then
              control = processMsg
              helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_3")
            else
              if msgTooltipType == 4 and tradeGameSet == 1 then
                control = processMsg
                helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_4")
              else
                if msgTooltipType == 5 and tradeGameSet == 1 then
                  control = processMsg
                  helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_5")
                else
                  if msgTooltipType == 6 and tradeGameSet == 1 then
                    control = processMsg
                    helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICELOWVALUE_6")
                  else
                    if msgTooltipType == 7 and tradeGameSet == 1 then
                      control = processMsg
                      helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_NOINTEREST")
                    else
                      if msgTooltipType == 8 and tradeGameSet == 1 then
                        control = processMsg
                        helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_1")
                      else
                        if msgTooltipType == 9 and tradeGameSet == 1 then
                          control = processMsg
                          helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_2")
                        else
                          if msgTooltipType == 10 and tradeGameSet == 1 then
                            control = processMsg
                            helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_3")
                          else
                            if msgTooltipType == 11 and tradeGameSet == 1 then
                              control = processMsg
                              helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_4")
                            else
                              if msgTooltipType == 12 and tradeGameSet == 1 then
                                control = processMsg
                                helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_5")
                              else
                                if msgTooltipType == 13 and tradeGameSet == 1 then
                                  control = processMsg
                                  helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_DICEHIGHVALUE_6")
                                else
                                  if msgTooltipType == 14 and tradeGameSet == 1 then
                                    control = processMsg
                                    helpDesc = PAGetString(Defines.StringSheet_GAME, "LUA_TRADEGAME_NOINTEREST")
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
  if control ~= nil then
    TooltipSimple_Show(control, helpDesc)
  end
end

Fglobal_TradeGame_Close = function()
  -- function num : 0_12
  Panel_TradeGame:SetShow(false)
  SetUIMode((Defines.UIMode).eUIMode_Trade)
end

FGlobal_isTradeGameSuccess = function()
  -- function num : 0_13 , upvalues : tradeGameSuccess
  tradeGameSuccess = false
end

isTradeGameSuccess = function()
  -- function num : 0_14 , upvalues : tradeGameSuccess
  return tradeGameSuccess
end

isLowDiceBtnClicked = function()
  -- function num : 0_15 , upvalues : isLowDiceClicked
  return isLowDiceClicked
end

isTradeGameFinish = function()
  -- function num : 0_16 , upvalues : isTradeGameEnd
  return isTradeGameEnd
end

ProcessMsg_SetPos = function()
  -- function num : 0_17 , upvalues : tradeGameBG, processMsg, processMsgPosY
  local bgSizeY = tradeGameBG:GetSizeY()
  local bgPosY = tradeGameBG:GetPosY()
  local processMsgSizeY = processMsg:GetTextSizeY()
  if bgSizeY + bgPosY < processMsgSizeY + processMsgPosY then
    processMsg:SetPosY(processMsgPosY + (bgSizeY + bgPosY - (processMsgSizeY + processMsgPosY + 5)))
  else
    processMsg:SetPosY(processMsgPosY)
  end
end

TradeGameDesc_SetPos = function()
  -- function num : 0_18 , upvalues : textSizeY, tradeGameDescBG, tradeGameDescText, tradeGameDescText_1, tradeGameDescText_2, tradeGameDescText_3, tradeGameDescText_4
  local index = 0
  local sizeY = 0
  local setPos = function(control, nextControl)
    -- function num : 0_18_0 , upvalues : sizeY, textSizeY, index, tradeGameDescBG
    sizeY = control:GetTextSizeY()
    if textSizeY < sizeY then
      index = index + 1
    end
    if nextControl ~= nil then
      nextControl:SetPosY(nextControl:GetPosY() + textSizeY * index + 2)
    else
      Panel_TradeGame:SetSize(Panel_TradeGame:GetSizeX(), Panel_TradeGame:GetSizeY() + textSizeY * index)
      tradeGameDescBG:SetSize(tradeGameDescBG:GetSizeX(), tradeGameDescBG:GetSizeY() + textSizeY * index)
    end
  end

  setPos(tradeGameDescText, tradeGameDescText_1)
  setPos(tradeGameDescText_1, tradeGameDescText_2)
  setPos(tradeGameDescText_2, tradeGameDescText_3)
  setPos(tradeGameDescText_3, tradeGameDescText_4)
  setPos(tradeGameDescText_4, nil)
end

setTradeGameCountrySet()
registerEvent("FromClient_TradeGameStart", "FromClient_TradeGameStart")
registerEvent("FromClient_TradeGameResult", "FromClient_TradeGameResult")
registerEvent("FromClient_TradeGameReciveDice", "FromClient_TradeGameReciveDice")
TradeGameDesc_SetPos()

