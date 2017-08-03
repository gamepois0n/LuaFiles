-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\event\panel_event_100day.luac 

-- params : ...
-- function num : 0
local _buttonRewardBG = (UI.getChildControl)(Panel_Event_100Day, "Button_Reward_BG")
local _buttonRewardGet = (UI.getChildControl)(Panel_Event_100Day, "Button_Reward_Get")
local _StaticText_Title = (UI.getChildControl)(Panel_Event_100Day, "StaticText_Title")
local _btn_Close = (UI.getChildControl)(Panel_Event_100Day, "Button_Win_Close")
local _EventUserName = (UI.getChildControl)(Panel_Event_100Day, "EventUserName")
local _EventItemIcon = (UI.getChildControl)(Panel_Event_100Day, "Static_EventItemIcon")
local _EventBeginnerBG = (UI.getChildControl)(Panel_Event_100Day, "EventBeginnerBG")
local _EventGameExit = (UI.getChildControl)(Panel_Event_100Day, "Button_GameExit")
local _EventCancle = (UI.getChildControl)(Panel_Event_100Day, "Button_GameExitCancle")
FGlobal_Event_100Day_Init = function()
  -- function num : 0_0 , upvalues : _EventItemIcon, _EventUserName
  local player = getSelfPlayer()
  local classType = (getSelfPlayer()):getClassType()
  if player == nil then
    return 
  end
  _EventItemIcon:SetShow(false)
  _EventUserName:SetShow(false)
  Panel_Event_100Day:SetShow(false)
end

FGlobal_Event_100Day_Open = function()
  -- function num : 0_1
  Panel_Event_100Day:SetShow(true)
end

FGlobal_Event_100Day_GameExitOpen = function()
  -- function num : 0_2 , upvalues : _EventBeginnerBG, _EventGameExit, _EventCancle, _btn_Close, _StaticText_Title, _EventItemIcon, _EventUserName, _buttonRewardGet, _buttonRewardBG
  _EventBeginnerBG:ChangeTextureInfoName("New_UI_Common_forLua/Window/Event/eventBeginnerExitBG.dds")
  Panel_Event_100Day:SetSize(770, 630)
  _EventGameExit:SetShow(true)
  _EventCancle:SetShow(true)
  Panel_Event_100Day:ComputePos()
  _EventBeginnerBG:ComputePos()
  _EventGameExit:ComputePos()
  _EventCancle:ComputePos()
  _btn_Close:ComputePos()
  _StaticText_Title:ComputePos()
  _EventItemIcon:SetPosX(85)
  _EventUserName:SetPosX(94)
  Panel_Event_100Day:SetPosY(Panel_Event_100Day:GetPosY() - 100)
  Panel_Event_100Day:SetShow(true)
  _buttonRewardGet:SetShow(false)
  _buttonRewardBG:SetShow(false)
end

HandleClickedChallengeReward = function()
  -- function num : 0_3
  audioPostEvent_SystemUi(0, 5)
  if not Panel_Window_CharInfo_Status:GetShow() then
    Panel_Window_CharInfo_Status:SetShow(true)
    audioPostEvent_SystemUi(1, 34)
  end
  HandleClicked_CharacterInfo_Tab(3)
  HandleClickedTapButton(2)
  Panel_Event_100Day:SetShow(false)
end

FGlobal_Event_100Day_Close = function()
  -- function num : 0_4
  audioPostEvent_SystemUi(13, 5)
  Panel_Event_100Day:SetShow(false, false)
end

HandleClicked_event_100Day_Close = function()
  -- function num : 0_5
  FGlobal_Event_100Day_Close()
end

HandleClicked_GameOff_Yes = function()
  -- function num : 0_6
  FGlobal_Event_100Day_Close()
  Panel_GameExit_GameOff_Yes()
end

registEventHandler = function()
  -- function num : 0_7 , upvalues : _btn_Close, _buttonRewardGet, _EventGameExit, _EventCancle
  _btn_Close:addInputEvent("Mouse_LUp", "HandleClicked_event_100Day_Close()")
  _buttonRewardGet:addInputEvent("Mouse_LUp", "HandleClickedChallengeReward()")
  _EventGameExit:addInputEvent("Mouse_LUp", "HandleClicked_GameOff_Yes()")
  _EventCancle:addInputEvent("Mouse_LUp", "HandleClicked_event_100Day_Close()")
end

FGlobal_Event_100Day_Init()
if isGameTypeKorea() ~= true or ToClient_GetUserPlayMinute() < 2880 then
  registEventHandler()
end

