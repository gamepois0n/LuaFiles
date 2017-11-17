-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_autotraining.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local autoTrain = ToClient_IsAutoLevelUp()
local autoTraining_Init = function()
  -- function num : 0_0 , upvalues : autoTrain
  if not ToClient_IsContentsGroupOpen("57") then
    return 
  end
  if autoTrain then
    ToClient_RequestSetAutoLevelUp(false)
  end
  FGlobal_PersonalIcon_ButtonPosUpdate()
end

AutoTraining_Set = function()
  -- function num : 0_1 , upvalues : IM, autoTrain
  if Panel_Global_Manual:GetShow() then
    Proc_ShowMessage_Ack("미니게임 중에�\148 흑정령의 수련�\132 이용�\160 �\152 없습니다.")
    return 
  end
  if Panel_Gacha_Roulette:GetShow() then
    Proc_ShowMessage_Ack("룰렛�\180 돌아�\128�\148 중에�\148 흑정령의 수련�\132 이용�\160 �\152 없습니다.")
    return 
  end
  if Panel_EventNotify:GetShow() then
    close_WindowPanelList()
    FGlobal_NpcNavi_Hide()
    EventNotify_Close()
  end
  if Panel_ScreenShotAlbum_FullScreen:GetShow() then
    ScreenshotAlbum_FullScreen_Close()
  end
  if Panel_ScreenShotAlbum:GetShow() then
    ScreenshotAlbum_Close()
  end
  if check_ShowWindow() then
    close_WindowPanelList()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    FGlobal_NpcNavi_Hide()
  end
  if check_ShowWindow() and FGlobal_NpcNavi_IsShowCheck() then
    close_WindowPanelList()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    FGlobal_NpcNavi_Hide()
  else
    if not check_ShowWindow() and FGlobal_NpcNavi_IsShowCheck() then
      FGlobal_NpcNavi_Hide()
    else
      if check_ShowWindow() and not FGlobal_NpcNavi_IsShowCheck() then
        close_WindowPanelList()
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    end
  end
  local pcPosition = ((getSelfPlayer()):get()):getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  if not (regionInfo:get()):isSafeZone() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_1"))
    return 
  end
  local needExp = Int64toInt32(((getSelfPlayer()):get()):getNeedExp_s64())
  local currentexp = Int64toInt32(((getSelfPlayer()):get()):getExp_s64())
  local expRate = currentexp * 100 / needExp
  local e1 = 10000
  local msg = ""
  ToClient_RequestSetAutoLevelUp(not autoTrain)
end

AutoTraining_Stop = function()
  -- function num : 0_2 , upvalues : autoTrain
  autoTrain = ToClient_IsAutoLevelUp()
end

AutoTraining_ToolTip = function(isShow)
  -- function num : 0_3 , upvalues : autoTrain
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local currentLevel = ((getSelfPlayer()):get()):getLevel()
  local name, desc = (PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_8")), nil
  local maxExpPercent = ToClient_GetAutoLevelUpMaxExpPercent(currentLevel) / 10000
  if autoTrain then
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_6", "percent", maxExpPercent)
  else
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_7", "percent", maxExpPercent)
  end
end

Init_AutoTraining = function()
  -- function num : 0_4 , upvalues : autoTraining_Init
  autoTraining_Init()
end

isAutoTraining = function()
  -- function num : 0_5 , upvalues : autoTrain
  return autoTrain
end

FromClient_SetAutoLevelUp = function(isAuto)
  -- function num : 0_6 , upvalues : autoTrain
  autoTrain = isAuto
  if autoTrain then
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_3")
  else
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_4")
  end
  Proc_ShowMessage_Ack(msg)
end


