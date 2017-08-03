-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\beginner\panel_beginnerreward.luac 

-- params : ...
-- function num : 0
Panel_BeginnerReward:SetShow(false)
local _buttonRewardGet = (UI.getChildControl)(Panel_BeginnerReward, "Button_Reward_Get")
local _btn_Close = (UI.getChildControl)(Panel_BeginnerReward, "Button_Win_Close")
beginnerReward_Init = function()
  -- function num : 0_0
  Panel_BeginnerReward:SetShow(true)
end

HandleClickedChallengeReward = function()
  -- function num : 0_1
  audioPostEvent_SystemUi(0, 5)
  if not Panel_Window_CharInfo_Status:GetShow() then
    Panel_Window_CharInfo_Status:SetShow(true)
    audioPostEvent_SystemUi(1, 34)
  end
  HandleClicked_CharacterInfo_Tab(3)
  HandleClickedTapButton(2)
  Panel_BeginnerReward:SetShow(false)
end

beginnerReward_Close = function()
  -- function num : 0_2
  audioPostEvent_SystemUi(13, 5)
  Panel_BeginnerReward:SetShow(false, false)
end

HandleClicked_beginnerReward_Close = function()
  -- function num : 0_3
  beginnerReward_Close()
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

beginnerReward.registEventHandler = function(self)
  -- function num : 0_4 , upvalues : _btn_Close, _buttonRewardGet
  _btn_Close:addInputEvent("Mouse_LUp", "HandleClicked_beginnerReward_Close()")
  _buttonRewardGet:addInputEvent("Mouse_LUp", "HandleClickedChallengeReward()")
end

if ToClient_GetUserPlayMinute() < 1440 then
  beginnerReward_Init()
end
beginnerReward:registEventHandler()

