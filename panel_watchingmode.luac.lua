-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\interaction\panel_watchingmode.luac 

-- params : ...
-- function num : 0
Panel_WatchingMode:SetDragAll(true)
Panel_WatchingMode:SetIgnore(true)
local watchingMode = {skillCommandBg = (UI.getChildControl)(Panel_WatchingMode, "Static_CommandBG"), key_W = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_W"), key_A = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_A"), key_S = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_S"), key_D = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_D"), key_Q = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_Q"), key_E = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_E"), key_R = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_R"), key_Low = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_SpeedLow"), key_Fast = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_SpeedFast"), key_Shift = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_Shift"), key_Caps = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Key_Caps"), forward = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Forward"), left = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Left"), back = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Back"), right = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Right"), small = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Small"), big = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Big"), exit = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Exit"), speedLow = (UI.getChildControl)(Panel_WatchingMode, "StaticText_CameraSpeedLow"), speedFast = (UI.getChildControl)(Panel_WatchingMode, "StaticText_CameraSpeedFast"), speed = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Speed"), caps = (UI.getChildControl)(Panel_WatchingMode, "StaticText_Caps")}
local showToogleBtn = (UI.getChildControl)(Panel_WatchingMode, "Button_ShowCommand")
local remainTime = ((UI.getChildControl)(Panel_WatchingMode, "StaticText_RemainTime"))
local resurrectionTime = nil
local onShip = false
WatchingModeInt = function()
  -- function num : 0_0 , upvalues : watchingMode, showToogleBtn
  local self = watchingMode
  ;
  (self.skillCommandBg):SetIgnore(false)
  ;
  (self.skillCommandBg):AddChild(self.key_W)
  ;
  (self.skillCommandBg):AddChild(self.key_A)
  ;
  (self.skillCommandBg):AddChild(self.key_S)
  ;
  (self.skillCommandBg):AddChild(self.key_D)
  ;
  (self.skillCommandBg):AddChild(self.key_Q)
  ;
  (self.skillCommandBg):AddChild(self.key_E)
  ;
  (self.skillCommandBg):AddChild(self.key_R)
  ;
  (self.skillCommandBg):AddChild(self.key_Low)
  ;
  (self.skillCommandBg):AddChild(self.key_Fast)
  ;
  (self.skillCommandBg):AddChild(self.key_Shift)
  ;
  (self.skillCommandBg):AddChild(self.key_Caps)
  ;
  (self.skillCommandBg):AddChild(self.forward)
  ;
  (self.skillCommandBg):AddChild(self.left)
  ;
  (self.skillCommandBg):AddChild(self.back)
  ;
  (self.skillCommandBg):AddChild(self.right)
  ;
  (self.skillCommandBg):AddChild(self.small)
  ;
  (self.skillCommandBg):AddChild(self.big)
  ;
  (self.skillCommandBg):AddChild(self.exit)
  ;
  (self.skillCommandBg):AddChild(self.speedLow)
  ;
  (self.skillCommandBg):AddChild(self.speedFast)
  ;
  (self.skillCommandBg):AddChild(self.speed)
  ;
  (self.skillCommandBg):AddChild(self.caps)
  Panel_WatchingMode:RemoveControl(self.key_W)
  Panel_WatchingMode:RemoveControl(self.key_A)
  Panel_WatchingMode:RemoveControl(self.key_S)
  Panel_WatchingMode:RemoveControl(self.key_D)
  Panel_WatchingMode:RemoveControl(self.key_Q)
  Panel_WatchingMode:RemoveControl(self.key_E)
  Panel_WatchingMode:RemoveControl(self.key_R)
  Panel_WatchingMode:RemoveControl(self.key_Low)
  Panel_WatchingMode:RemoveControl(self.key_Fast)
  Panel_WatchingMode:RemoveControl(self.key_Shift)
  Panel_WatchingMode:RemoveControl(self.key_Caps)
  Panel_WatchingMode:RemoveControl(self.forward)
  Panel_WatchingMode:RemoveControl(self.left)
  Panel_WatchingMode:RemoveControl(self.back)
  Panel_WatchingMode:RemoveControl(self.right)
  Panel_WatchingMode:RemoveControl(self.small)
  Panel_WatchingMode:RemoveControl(self.big)
  Panel_WatchingMode:RemoveControl(self.exit)
  Panel_WatchingMode:RemoveControl(self.speedLow)
  Panel_WatchingMode:RemoveControl(self.speedFast)
  Panel_WatchingMode:RemoveControl(self.speed)
  Panel_WatchingMode:RemoveControl(self.caps)
  showToogleBtn:addInputEvent("Mouse_LUp", "ShowCommandFunc()")
end

ShowCommandFunc = function(respawnTime, isMast)
  -- function num : 0_1 , upvalues : watchingMode, showToogleBtn, resurrectionTime, remainTime, onShip
  local self = watchingMode
  local checkToggleBtn = showToogleBtn:IsCheck()
  Panel_WatchingMode:SetShow(true)
  if checkToggleBtn then
    (self.skillCommandBg):SetShow(false)
  else
    ;
    (self.skillCommandBg):SetShow(true)
  end
  ;
  (self.key_W):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveFront))
  ;
  (self.key_S):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveBack))
  ;
  (self.key_A):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveLeft))
  ;
  (self.key_D):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveRight))
  ;
  (self.key_Q):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_CrouchOrSkill))
  ;
  (self.key_E):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_GrabOrGuard))
  ;
  (self.key_R):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction))
  ;
  (self.key_Low):SetText(keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_CameraSpeedDown))
  ;
  (self.key_Fast):SetText(keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_CameraSpeedUp))
  ;
  (self.key_Shift):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Dash))
  ;
  (self.key_Low):SetSize((self.key_Low):GetTextSizeX() + 10, (self.key_Low):GetSizeY())
  ;
  (self.key_Fast):SetSize((self.key_Fast):GetTextSizeX() + 10, (self.key_Fast):GetSizeY())
  if respawnTime ~= nil or resurrectionTime ~= nil then
    if respawnTime ~= nil then
      resurrectionTime = respawnTime
    end
    remainTime:SetShow(true)
    ;
    (self.key_R):SetShow(false)
    ;
    (self.exit):SetShow(false)
    ;
    (self.key_Shift):SetPosY(250)
    ;
    (self.speed):SetPosY(251)
    ;
    (self.key_Low):SetPosY(190)
    ;
    (self.speedLow):SetPosY(191)
    ;
    (self.key_Fast):SetPosY(220)
    ;
    (self.speedFast):SetPosY(221)
    ;
    (self.key_Caps):SetPosY(280)
    ;
    (self.caps):SetPosY(281)
  else
    if isMast or onShip then
      remainTime:SetShow(false)
      ;
      (self.key_R):SetShow(false)
      ;
      (self.exit):SetShow(false)
      ;
      (self.key_Shift):SetPosY(250)
      ;
      (self.speed):SetPosY(251)
      ;
      (self.key_Low):SetPosY(190)
      ;
      (self.speedLow):SetPosY(191)
      ;
      (self.key_Fast):SetPosY(220)
      ;
      (self.speedFast):SetPosY(221)
      ;
      (self.key_Caps):SetPosY(280)
      ;
      (self.caps):SetPosY(281)
      onShip = true
    else
      remainTime:SetShow(false)
      ;
      (self.key_R):SetShow(true)
      ;
      (self.exit):SetShow(true)
      ;
      (self.key_Shift):SetPosY(280)
      ;
      (self.speed):SetPosY(281)
      ;
      (self.key_Low):SetPosY(220)
      ;
      (self.speedLow):SetPosY(221)
      ;
      (self.key_Fast):SetPosY(250)
      ;
      (self.speedFast):SetPosY(251)
      ;
      (self.key_Caps):SetPosY(310)
      ;
      (self.caps):SetPosY(311)
    end
  end
  if Panel_ActionMessage:GetShow() then
    ActionMessageHide()
  end
end

FromClient_NotifyObserverModeEnd_ReturnTime = function()
  -- function num : 0_2 , upvalues : resurrectionTime, onShip
  deadMessage_ResurrectionTimeReturn(resurrectionTime)
  resurrectionTime = nil
  onShip = false
end

WatchingMode_UpdatePerFrame = function(deltaTime)
  -- function num : 0_3 , upvalues : resurrectionTime, remainTime
  if resurrectionTime ~= nil then
    if resurrectionTime > 0 then
      resurrectionTime = resurrectionTime - deltaTime
      local regenTime = tostring((string.format)("%.0f", resurrectionTime))
      remainTime:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "WATCHINGMODE_TEXT_RESPAWN_TIME", "regenTime", tostring(regenTime)))
    else
      do
        local regenTime = "0"
        remainTime:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "WATCHINGMODE_TEXT_RESPAWN_TIME", "regenTime", tostring(regenTime)))
        resurrectionTime = 0
        observerCameraModeStop()
      end
    end
  end
end

isDeadInWatchingMode = function()
  -- function num : 0_4 , upvalues : resurrectionTime
  do return (resurrectionTime ~= nil and Panel_WatchingMode:GetShow()) end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

FromClient_WatchModeCloseByKingOrLordTentDestroy = function()
  -- function num : 0_5 , upvalues : resurrectionTime
  if isDeadInWatchingMode() then
    resurrectionTime = 0
    GuildManager:Hide()
    observerCameraModeStop()
  end
end

FromClient_FrameEventCallBack_Observer = function()
  -- function num : 0_6
  if isObserverMode() == true then
    ShowCommandFunc(nil, true)
  end
end

Panel_WatchingMode:RegisterUpdateFunc("WatchingMode_UpdatePerFrame")
registerEvent("FromClient_NotifyObserverModeEnd", "FromClient_NotifyObserverModeEnd_ReturnTime")
registerEvent("FromClient_FrameEventCallBack_Observer", "FromClient_FrameEventCallBack_Observer")
WatchingModeInt()

