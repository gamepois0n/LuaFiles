-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\localwar\panel_localwar.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_LocalWar:SetShow(false)
Panel_LocalWar:setMaskingChild(true)
Panel_LocalWar:ActiveMouseEventEffect(true)
Panel_LocalWar:setGlassBackground(true)
Panel_LocalWar:RegisterShowEventFunc(true, "LocalWar_ShowAni()")
Panel_LocalWar:RegisterShowEventFunc(false, "LocalWar_HideAni()")
LocalWar_ShowAni = function()
  -- function num : 0_0
end

LocalWar_HideAni = function()
  -- function num : 0_1
end

local isLocalwarOpen = ToClient_IsContentsGroupOpen("43")
local myTeam = (UI.getChildControl)(Panel_LocalWar, "StaticText_MyTeam")
local accumulateKillCount = (UI.getChildControl)(Panel_LocalWar, "StaticText_AccumulateKillCountIcon")
local currentContinuityKillCount = (UI.getChildControl)(Panel_LocalWar, "StaticText_CurrentContinuityKillCountIcon")
local maxContinuityKillCount = (UI.getChildControl)(Panel_LocalWar, "StaticText_MaxContinuityKillCountIcon")
local buttonQuestion = (UI.getChildControl)(Panel_LocalWar, "Button_Question")
buttonQuestion:SetShow(false)
local _txt_LocalWarTime = (UI.getChildControl)(Panel_LocalWarTeam, "StaticText_TimeLine")
local _txt_LocalWarBlack = (UI.getChildControl)(Panel_LocalWarTeam, "StaticText_TeamBlackDesert")
local _txt_LocalWarRed = (UI.getChildControl)(Panel_LocalWarTeam, "StaticText_TeamRedDesert")
local _txt_TeamBlack = (UI.getChildControl)(Panel_LocalWarTeam, "StaticText_MyTeamBlack")
local _txt_TeamRed = (UI.getChildControl)(Panel_LocalWarTeam, "StaticText_MyTeamRed")
local _icon_TeamBlackBuff = (UI.getChildControl)(Panel_LocalWarTeam, "Static_BlackTeamBuff")
local _icon_TeamRedBuff = (UI.getChildControl)(Panel_LocalWarTeam, "Static_RedTeamBuff")
_icon_TeamBlackBuff:SetShow(false)
_icon_TeamRedBuff:SetShow(false)
LocalWar_Icon_Tooltip_Event = function()
  -- function num : 0_2 , upvalues : accumulateKillCount, currentContinuityKillCount, maxContinuityKillCount, buttonQuestion
  accumulateKillCount:addInputEvent("Mouse_On", "Panel_LocalWar_Icon_ToolTip_Show(" .. 0 .. ")")
  accumulateKillCount:addInputEvent("Mouse_Out", "Panel_LocalWar_Icon_ToolTip_Show()")
  currentContinuityKillCount:addInputEvent("Mouse_On", "Panel_LocalWar_Icon_ToolTip_Show(" .. 1 .. ")")
  currentContinuityKillCount:addInputEvent("Mouse_Out", "Panel_LocalWar_Icon_ToolTip_Show()")
  maxContinuityKillCount:addInputEvent("Mouse_On", "Panel_LocalWar_Icon_ToolTip_Show(" .. 2 .. ")")
  maxContinuityKillCount:addInputEvent("Mouse_Out", "Panel_LocalWar_Icon_ToolTip_Show()")
  buttonQuestion:addInputEvent("Mouse_On", "Panel_LocalWar_Icon_ToolTip_Show(" .. 3 .. ")")
  buttonQuestion:addInputEvent("Mouse_Out", "Panel_LocalWar_Icon_ToolTip_Show()")
end

local saveBlackScore = 0
local saveRedScore = 0
local blackTeam = 0
local redTeam = 0
local killCheck = false
local teamCheck = false
local killCount = {_accumulate, _current, _max}
local displayTime = function(timeValue)
  -- function num : 0_3
  timeValue = timeValue / 1000
  if timeValue > 3600 then
    timeValue = timeValue / 3600
    return tostring(timeValue) .. PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_HOUR")
  else
    if timeValue > 120 then
      timeValue = timeValue / 60
      return tostring(timeValue) .. PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_MINUTE")
    else
      if timeValue > 0 then
        return PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_DEADLINE")
      else
        return PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_SALECLOSE")
      end
    end
  end
end

LocalWar_KillCount_Init = function()
  -- function num : 0_4 , upvalues : _txt_TeamBlack, _txt_TeamRed, myTeam
  local team = ""
  _txt_TeamBlack:SetShow(false)
  _txt_TeamRed:SetShow(false)
  if ToClient_GetMyTeamNoLocalWar() == 1 then
    team = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_BELONG_1")
    _txt_TeamBlack:SetShow(true)
  else
    team = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_BELONG_2")
    _txt_TeamRed:SetShow(true)
  end
  myTeam:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOCALWAR_BELONG_3", "team", team))
end

Panel_LocalWar_Icon_ToolTip_Show = function(index)
  -- function num : 0_5 , upvalues : accumulateKillCount, currentContinuityKillCount, maxContinuityKillCount, buttonQuestion
  local isShow, name, desc, uiControl = true, nil, nil, nil
  if index == 0 then
    name = "누적 처치 횟수"
    uiControl = accumulateKillCount
  else
    if index == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_ACCUMULATEKILLCOUNT")
      uiControl = currentContinuityKillCount
    else
      if index == 2 then
        name = "최대 연속 처치 횟수"
        uiControl = maxContinuityKillCount
      else
        if index == 3 then
          name = "국지전이�\128?"
          desc = "국지전에 �\128�\156 설명�\180 들어갑니�\164.\n국지�\132 설명! 국지�\132 설명! 국지�\132 설명!"
          uiControl = buttonQuestion
        else
          isShow = false
        end
      end
    end
  end
  if isShow then
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

NewLocalWar_Show = function()
  -- function num : 0_6
  if not Panel_LocalWarTeam:GetShow() then
    Panel_LocalWarTeam:SetShow(true)
  else
    return 
  end
end

NewLocalWar_Hide = function()
  -- function num : 0_7
  if Panel_LocalWarTeam:GetShow() then
    Panel_LocalWarTeam:GetShow(false)
  end
end

FGlobal_NewLocalWar_Show = function()
  -- function num : 0_8 , upvalues : saveBlackScore, saveRedScore
  if ToClient_GetMyTeamNoLocalWar() == 0 then
    NewLocalWar_Hide()
    return 
  end
  saveBlackScore = 0
  saveRedScore = 0
  NewLocalWar_Show()
end

NewLocalWar_Update = function()
  -- function num : 0_9 , upvalues : _txt_LocalWarBlack, _txt_LocalWarRed, saveBlackScore, saveRedScore
  local teamBlackPoint = ToClient_GetLocalwarTeamPoint(0)
  local teamRedPoint = ToClient_GetLocalwarTeamPoint(1)
  local isTeam = ToClient_GetMyTeamNoLocalWar()
  _txt_LocalWarBlack:EraseAllEffect()
  _txt_LocalWarRed:EraseAllEffect()
  if saveBlackScore < teamBlackPoint then
    if teamBlackPoint > 99 and teamBlackPoint < 1000 then
      _txt_LocalWarBlack:AddEffect("UI_GuildWar_ArrowMark_Big01", false, 5, -1.5)
    else
      if teamBlackPoint > 9 and teamBlackPoint < 100 then
        _txt_LocalWarBlack:AddEffect("UI_GuildWar_ArrowMark_Big01", false, -1, -1.5)
      else
        if teamBlackPoint < 10 then
          _txt_LocalWarBlack:AddEffect("UI_GuildWar_ArrowMark_Big01", false, -5, -1.5)
        else
          _txt_LocalWarBlack:AddEffect("UI_GuildWar_ArrowMark_Big01", false, 0, 0)
        end
      end
    end
    saveBlackScore = teamBlackPoint
  end
  if saveRedScore < teamRedPoint then
    if teamRedPoint > 99 and teamRedPoint < 1000 then
      _txt_LocalWarRed:AddEffect("UI_GuildWar_ArrowMark_Big01", false, -4, -1.5)
    else
      if teamRedPoint > 9 and teamRedPoint < 100 then
        _txt_LocalWarRed:AddEffect("UI_GuildWar_ArrowMark_Big01", false, 1, -1.5)
      else
        if teamRedPoint < 10 then
          _txt_LocalWarRed:AddEffect("UI_GuildWar_ArrowMark_Big01", false, 5, -1.5)
        else
          _txt_LocalWarRed:AddEffect("UI_GuildWar_ArrowMark_Big01", false, 0, 0)
        end
      end
    end
    saveRedScore = teamRedPoint
  end
  _txt_LocalWarBlack:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOCALWAR_BLACKDESERTTEAM", "teamBlackPoint", teamBlackPoint))
  _txt_LocalWarRed:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOCALWAR_REDDESERTTEAM", "teamRedPoint", teamRedPoint))
end

local _winningTeam = 2
LocalwarReloadUI = function()
  -- function num : 0_10 , upvalues : _winningTeam, _txt_LocalWarTime
  local teamBlackPoint = ToClient_GetLocalwarTeamPoint(0)
  local teamRedPoint = ToClient_GetLocalwarTeamPoint(1)
  if teamBlackPoint < teamRedPoint then
    _winningTeam = 0
  else
    if teamRedPoint < teamBlackPoint then
      _winningTeam = 1
    else
      _winningTeam = 2
    end
  end
  if ToClient_GetLocalwarState() ~= 0 or ToClient_GetLocalwarState() == 1 then
    _txt_LocalWarTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_SOONFINISH"))
  else
    if ToClient_GetLocalwarState() == 2 then
      _txt_LocalWarTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_FINISH"))
      if ToClient_GetMyTeamNoLocalWar() == 0 then
        NewLocalWar_Hide()
      end
    end
  end
  if ToClient_GetMyTeamNoLocalWar() == 0 then
    NewLocalWar_Hide()
  end
end

LocalwarReloadUI()
NewLocalWar_TurnAround = function()
  -- function num : 0_11 , upvalues : _winningTeam, teamCheck
  local teamBlackPoint = ToClient_GetLocalwarTeamPoint(0)
  local teamRedPoint = ToClient_GetLocalwarTeamPoint(1)
  local myTeamIndex = ToClient_GetMyTeamNoLocalWar() - 1
  local prevWinningTeam = _winningTeam
  if teamBlackPoint < teamRedPoint then
    _winningTeam = 0
  else
    if teamRedPoint < teamBlackPoint then
      _winningTeam = 1
    else
      return 
    end
  end
  if prevWinningTeam == _winningTeam or prevWinningTeam == 2 then
    return 
  end
  if _winningTeam == 0 then
    msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_REDTEAM_TURNAROUND"), sub = "", addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 1.8, 47, false)
    teamCheck = true
  else
    if _winningTeam == 1 then
      msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_BLACKTEAM_TURNAROUND"), sub = "", addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(msg, 1.8, 47, false)
      teamCheck = false
    end
  end
end

local saveLocalWarTime = 0
local delayTime = 1
local localwarDeltaTime = 0
NewLocalWar_TimeUpdate = function(deltaTime)
  -- function num : 0_12 , upvalues : localwarDeltaTime, delayTime, saveLocalWarTime, _txt_LocalWarTime
  localwarDeltaTime = localwarDeltaTime + deltaTime
  if delayTime <= localwarDeltaTime then
    local warTime = ToClient_GetLocalwarRemainedTime()
    if saveLocalWarTime > 0 and warTime == 0 then
      _txt_LocalWarTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_SOONFINISH"))
    end
    saveLocalWarTime = warTime
    if warTime == 0 then
      if ToClient_GetLocalwarState() == 1 then
        _txt_LocalWarTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_SOONFINISH"))
      end
      return 
    end
    local warTimeMinute = (math.floor)(warTime / 60)
    local warTimeSecond = warTime % 60
    if warTimeMinute < 10 then
      warTimeMinute = "0" .. warTimeMinute
    end
    if warTimeSecond < 10 then
      warTimeSecond = "0" .. warTimeSecond
    end
    localwarDeltaTime = 0
    _txt_LocalWarTime:SetText(tostring(warTimeMinute) .. " : " .. tostring(warTimeSecond))
  end
end

FromClient_KillLocalWar = function(killPlayer, deadPlayer, killPlayerTeam, getScore)
  -- function num : 0_13 , upvalues : blackTeam, redTeam
  if killPlayer == nil or deadPlayer == nil then
    return 
  end
  local teamBlackPoint = ToClient_GetLocalwarTeamPoint(0)
  local teamRedPoint = ToClient_GetLocalwarTeamPoint(1)
  blackTeam = teamBlackPoint
  redTeam = teamRedPoint
  local isTeam = (ToClient_GetMyTeamNoLocalWar())
  local mainMessage = nil
  if isTeam == killPlayerTeam then
    do
      if getScore >= 100 then
        local isMsg = {main = "[" .. killPlayer .. "]", sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOCALWAR_GETSCROE_ALOT", "getScore", getScore), addMsg = ""}
        Proc_ShowMessage_Ack_For_RewardSelect(isMsg, 5, 49, false)
      end
      mainMessage = "<PAColor0xFF2C7BFF>" .. PAGetStringParam3(Defines.StringSheet_GAME, "LUA_LOCALWAR_KILLPLAYER", "killPlayer", killPlayer, "deadPlayer", deadPlayer, "score", getScore) .. "<PAOldColor>"
      do
        if getScore >= 100 then
          local isMsg2 = {main = "[" .. killPlayer .. "]", sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOCALWAR_GETSCROE_ALOT", "getScore", getScore), addMsg = ""}
          Proc_ShowMessage_Ack_For_RewardSelect(isMsg2, 5, 48, false)
        end
        mainMessage = "<PAColor0xFFC02A2A>" .. PAGetStringParam3(Defines.StringSheet_GAME, "LUA_LOCALWAR_KILLPLAYER", "killPlayer", killPlayer, "deadPlayer", deadPlayer, "score", getScore) .. "<PAOldColor>"
        local msg = {main = mainMessage, sub = "", addMsg = ""}
        if msg.main ~= nil then
          chatting_sendMessage("", msg.main, (CppEnums.ChatType).Battle)
        end
        NewLocalWar_Update()
        NewLocalWar_TurnAround()
      end
    end
  end
end

FromClient_MultiKillLocalWar = function(killerName, deadPlayerName, killCount, posX, posY, posZ)
  -- function num : 0_14
  if killCount >= 5 then
    local killPlayerPos3D = float3(posX, posY, posZ)
    LocalWar_MultiKillPlayerIcon_WorldMap(killerName, killCount, killPlayerPos3D)
  end
end

FromClient_UpdateLocalwarState = function(state)
  -- function num : 0_15 , upvalues : isLocalwarOpen, _txt_LocalWarTime
  if state == nil or state == "" then
    return 
  end
  if not isLocalwarOpen then
    return 
  end
  local msg = {main = "", sub = "", addMsg = ""}
  if state == 0 then
    msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_RECRUITMENT_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_RECRUITMENT_SUB"), addMsg = ""}
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 34, false)
  else
    if state == 1 then
      msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_START_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_START_SUB"), addMsg = ""}
      Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 34, false)
    else
      if state == 2 then
        local teamBlackPoint = ToClient_GetLocalwarTeamPoint(0)
        local teamRedPoint = ToClient_GetLocalwarTeamPoint(1)
        local winnerTeamNo = 2
        if teamBlackPoint < teamRedPoint then
          winnerTeamNo = 2
        else
          if teamRedPoint < teamBlackPoint then
            winnerTeamNo = 1
          end
        end
        if winnerTeamNo == ToClient_GetMyTeamNoLocalWar() then
          msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_WARWIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_MOVEBEFOREREGION"), addMsg = ""}
          Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 45, false)
        else
          msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_WARLOSE"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_MOVEBEFOREREGION"), addMsg = ""}
          Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 46, false)
        end
        _txt_LocalWarTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_FINISH"))
      else
        do
          if state == 3 then
            msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_FINISH_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_FINISH_SUB"), addMsg = ""}
            Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 34, false)
          end
        end
      end
    end
  end
end

FromClient_LocalWarKickOut = function()
  -- function num : 0_16
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_KICKOUT"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_KICKOUT_SUB"), addMsg = ""}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 34, false)
end

FromClient_LocalWarAdvantage = function(teamNo)
  -- function num : 0_17
  local advantageMsg = {main = "", sub = "", addMsg = ""}
  if teamNo == nil then
    return 
  end
  if teamNo == 0 then
    advantageMsg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_ADVANTAGEMSG_PARAM0_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_ADVANTAGEMSG_PARAM0_SUB"), addMsg = ""}
  else
    if teamNo == 1 then
      advantageMsg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_ADVANTAGEMSG_PARAM1_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_ADVANTAGEMSG_PARAM1_SUB"), addMsg = ""}
    else
      if teamNo == 2 then
        advantageMsg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_ADVANTAGEMSG_PARAM2_MAIN"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_ADVANTAGEMSG_PARAM2_SUB"), addMsg = ""}
      end
    end
  end
  Proc_ShowMessage_Ack_For_RewardSelect(advantageMsg, 5, 34, false)
end

FromClient_UpdateMyKillCountLocalWar = function()
  -- function num : 0_18
end

LocalWar_MultiKillPlayerIcon_WorldMap = function(name, count, pos)
  -- function num : 0_19
  local showTime = 180
  ToClient_worldmapAddIcon("Static_RedIcon_LocalWar", pos, showTime)
end

local sizeX = Panel_LocalWar:GetSizeX()
local sizeY = Panel_LocalWar:GetSizeY()
local iconPosX = accumulateKillCount:GetPosX()
local gapX = 60
local gapY = 30
Panel_NewLocalWar_Repos = function()
  -- function num : 0_20
  Panel_LocalWarTeam:SetPosX(getScreenSizeX() / 2 - Panel_LocalWarTeam:GetSizeX() / 2)
  Panel_LocalWarTeam:SetPosY(0)
end

NewLocalWar_Init = function()
  -- function num : 0_21
  if ToClient_GetMyTeamNoLocalWar() == 0 then
    NewLocalWar_Hide()
    return 
  end
end

NewLocalWar_Init()
LocalWar_Icon_Tooltip_Event()
FGlobal_NewLocalWar_Show()
NewLocalWar_Update()
LocalWar_KillCount_Init()
registerEvent("onScreenResize", "Panel_NewLocalWar_Repos")
registerEvent("FromClient_UpdateMyKillCountLocalWar", "FromClient_UpdateMyKillCountLocalWar")
registerEvent("FromClient_KillLocalWar", "FromClient_KillLocalWar")
registerEvent("FromClient_MultiKillLocalWar", "FromClient_MultiKillLocalWar")
registerEvent("FromClient_UpdateLocalwarState", "FromClient_UpdateLocalwarState")
registerEvent("FromClient_LocalWarKickOut", "FromClient_LocalWarKickOut")
Panel_LocalWarTeam:RegisterUpdateFunc("NewLocalWar_TimeUpdate")

