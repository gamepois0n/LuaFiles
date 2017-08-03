-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\challengepresent\panel_special_reward.luac 

-- params : ...
-- function num : 0
local UI_RewardType = CppEnums.RewardType
local reward = {currentBenefitReward = -1, currentRewardCount = -1}
local pcRoomGift_icon = (UI.getChildControl)(Panel_NewEventProduct_Alarm, "Static_Icon")
local pcRoomGift_Text = (UI.getChildControl)(Panel_NewEventProduct_Alarm, "StaticText_SumText")
Panel_NewEventProduct_Alarm:SetShow(false)
local nextPcRoomGiftRewardTime = toInt64(0, 0)
local messagePosition = function()
  -- function num : 0_0
  Panel_ChallengeReward_Alert:SetSpanSize(0, 10)
  Panel_SpecialReward_Alert:SetSpanSize(50, 10)
  Panel_NewEventProduct_Alarm:SetSpanSize(70, 10)
  Panel_ChallengeReward_Alert:ComputePos()
  Panel_SpecialReward_Alert:ComputePos()
  Panel_NewMail_Alarm:ComputePos()
  Panel_NewQuest_Alarm:ComputePos()
  Panel_NewEventProduct_Alarm:ComputePos()
end

local isNewbie = function()
  -- function num : 0_1
  if not questList_hasProgressQuest(118, 1) and not questList_hasProgressQuest(138, 1) and not questList_hasProgressQuest(120, 1) and not questList_hasProgressQuest(121, 1) and not questList_hasProgressQuest(161, 1) then
    return questList_hasProgressQuest(160, 1)
  end
end

completeBenefitReward_ShowMessage = function()
  -- function num : 0_2 , upvalues : reward
  local self = reward
  if self.currentBenefitReward == -1 then
    return 
  end
  local rewardWrapper = ToClient_GetBenefitRewardInfoWrapper(self.currentBenefitReward)
  if rewardWrapper ~= nil and rewardWrapper:getType() == 0 then
    local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_SPECIAL_REWARD_BENEFITREWARD_MAIN"), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SPECIAL_REWARD_ARCHIVEMENT", "specialRewardName", rewardWrapper:getName())}
    Proc_ShowBigMessage_Ack_WithOut_ChattingMessage(message)
  end
end

FromClient_CompleteBenefitReward = function()
  -- function num : 0_3 , upvalues : reward, isNewbie, messagePosition
  if isFlushedUI() then
    return 
  end
  local self = reward
  local rewardCount = ToClient_GetBenefitRewardInfoCount()
  if rewardCount == 0 or rewardCount == nil then
    self.currentBenefitReward = -1
    return 
  end
  self.currentBenefitReward = rewardCount - 1
  if isNewbie() or ((getSelfPlayer()):get()):getLevel() > 5 then
    Panel_SpecialReward_Alert:SetShow(true)
    completeBenefitReward_ShowMessage()
    FromClient_SpecialReward_UpdateText()
  end
  messagePosition()
end

check_BenefitRewardAlert_Hide = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_4
  local currentRenderMode = {(Defines.RenderMode).eRenderMode_Default, (Defines.RenderMode).eRenderMode_WorldMap}
  if CheckRenderMode(prevRenderModeList, currentRenderMode) == false then
    return 
  end
  if ((getSelfPlayer()):get()):getLevel() > 1 then
    return 
  end
  Panel_SpecialReward_Alert:SetShow(false)
  TooltipSimple_Hide()
end

registerEvent("FromClient_RenderModeChangeState", "check_BenefitRewardAlert_Hide")
check_BenefitRewardAlert_PostEvent = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_5 , upvalues : reward, isNewbie
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  local self = reward
  if (isNewbie() or ((getSelfPlayer()):get()):getLevel() > 5) and self.currentBenefitReward == ToClient_GetBenefitRewardInfoCount() - 1 then
    return 
  end
  FromClient_CompleteBenefitReward()
end

registerEvent("FromClient_RenderModeChangeState", "check_BenefitRewardAlert_PostEvent")
completeChallengeReward_ShowMessage = function()
  -- function num : 0_6 , upvalues : reward
  local self = reward
  if self.currentRewardCount == -1 then
    return 
  end
  local rewardWrapper = ToClient_GetChallengeRewardInfoWrapper(self.currentRewardCount)
  if rewardWrapper ~= nil then
    local message = {main = PAGetString(Defines.StringSheet_GAME, "LUA_SPECIAL_REWARD_CHALLENGEREWARD_MAIN"), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_REWARD_ARCHIVEMENT", "challengeName", rewardWrapper:getName())}
    Proc_ShowBigMessage_Ack_WithOut_ChattingMessage(message)
  end
end

FromClient_CompleteChallengeReward = function()
  -- function num : 0_7 , upvalues : reward, isNewbie, messagePosition
  if isFlushedUI() then
    return 
  end
  local self = reward
  local rewardCount = ToClient_GetChallengeRewardInfoCount()
  self.currentRewardCount = rewardCount - 1
  if isNewbie() or ((getSelfPlayer()):get()):getLevel() > 5 then
    Panel_ChallengeReward_Alert:SetShow(true)
    completeChallengeReward_ShowMessage()
    FromClient_ChallengeReward_UpdateText()
    FGlobal_RightBottomIconReposition()
    PcRoomGift_TimeCheck()
  end
  messagePosition()
end

check_CompleteChallengeRewardAlert_Hide = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_8
  local currentRenderMode = {(Defines.RenderMode).eRenderMode_Default, (Defines.RenderMode).eRenderMode_WorldMap}
  if CheckRenderMode(prevRenderModeList, currentRenderMode) == false then
    return 
  end
  if ((getSelfPlayer()):get()):getLevel() > 1 then
    return 
  end
  Panel_ChallengeReward_Alert:SetShow(false)
end

registerEvent("FromClient_RenderModeChangeState", "check_CompleteChallengeRewardAlert_Hide")
check_CompleteChallengeRewardAlert_PostEvent = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_9 , upvalues : reward, isNewbie
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  local self = reward
  if (isNewbie() or ((getSelfPlayer()):get()):getLevel() > 1) and self.currentRewardCount == ToClient_GetChallengeRewardInfoCount() - 1 then
    return 
  end
  FromClient_CompleteChallengeReward()
end

registerEvent("FromClient_RenderModeChangeState", "check_CompleteChallengeRewardAlert_PostEvent")
PcRoomGift_TimeCheck = function()
  -- function num : 0_10 , upvalues : nextPcRoomGiftRewardTime, messagePosition
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
  local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
  local isRussiaPremiumPack = false
  if isGameTypeRussia() then
    isRussiaPremiumPack = (selfPlayer:get()):isApplyChargeSkill(9)
  end
  local nowPlayedTime = 0
  local challengeType = 4
  if isPremiumPcRoom then
    nowPlayedTime = ToClient_GetPcRoomPlayTime()
    challengeType = 4
  end
  if isRussiaPremiumPack then
    nowPlayedTime = ToClient_GetUserPlayTimePerDay()
    challengeType = 7
  end
  local checkCount = ToClient_GetProgressChallengeCount(challengeType)
  if checkCount == 0 then
    nextPcRoomGiftRewardTime = toInt64(0, 0)
    Panel_NewEventProduct_Alarm:SetShow(false)
    return 
  end
  for checkIdx = 0, checkCount - 1 do
    local progressInfo = ToClient_GetProgressChallengeAt(challengeType, checkIdx)
    local remainedTime = toInt64(0, 0)
    if isPremiumPcRoom then
      remainedTime = toInt64(0, progressInfo:getNeedTimeForPcRoom() * 60) - nowPlayedTime
    end
    if isRussiaPremiumPack then
      remainedTime = toInt64(0, progressInfo:getNeedTimeForDay() * 60) - nowPlayedTime
    end
    if toInt64(0, 0) == nextPcRoomGiftRewardTime then
      nextPcRoomGiftRewardTime = remainedTime
    else
      if remainedTime < nextPcRoomGiftRewardTime then
        nextPcRoomGiftRewardTime = remainedTime
      end
    end
  end
  do
    if (isPremiumPcRoom or isRussiaPremiumPack) and not Panel_NewEventProduct_Alarm:GetShow() and checkCount ~= 0 then
      Panel_NewEventProduct_Alarm:SetShow(true)
      messagePosition()
      FGlobal_RightBottomIconReposition()
    end
  end
end

renderModeChange_PcRoomGift_TimeCheck = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_11
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  PcRoomGift_TimeCheck()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_PcRoomGift_TimeCheck")
PcRoomGift_TimeCheck()
local tempTime = 0
PcRoomGiftPanel_UpdatePerFrame = function(deltaTime)
  -- function num : 0_12 , upvalues : tempTime, nextPcRoomGiftRewardTime, pcRoomGift_Text
  tempTime = tempTime + deltaTime
  if tempTime > 1 then
    nextPcRoomGiftRewardTime = nextPcRoomGiftRewardTime - toInt64(0, tempTime)
    pcRoomGift_Text:SetText(convertStringFromDatetime(nextPcRoomGiftRewardTime))
    tempTime = 0
  end
  if nextPcRoomGiftRewardTime <= toInt64(0, 0) then
    nextPcRoomGiftRewardTime = toInt64(0, 0)
    PcRoomGift_TimeCheck()
  end
end

HandleClicked_PcRoomJackPotBox = function()
  -- function num : 0_13
  if not Panel_Window_CharInfo_Status:GetShow() then
    FGlobal_CharInfoStatusShowAni()
    Panel_Window_CharInfo_Status:SetShow(true)
  end
  HandleClicked_CharacterInfo_Tab(3)
  HandleClickedTapButton(5)
end

AlarmIcon_SimpleTooltips = function(isShow)
  -- function num : 0_14 , upvalues : pcRoomGift_icon
  name = PAGetString(Defines.StringSheet_GAME, "LUA_SPECIAL_REWARD_ALARMICON_TOOLTIP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_SPECIAL_REWARD_ALARMICON_TOOLTIP_DESC")
  uiControl = pcRoomGift_icon
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

SpecialReward_registEventHandler = function()
  -- function num : 0_15
  registerEvent("FromClient_CompleteBenefitReward", "FromClient_CompleteBenefitReward")
  registerEvent("FromClient_CompleteChallengeReward", "FromClient_CompleteChallengeReward")
  registerEvent("FromClient_LoadCompleteMsg", "PcRoomGift_TimeCheck")
end

SpecialReward_registMessageHandler = function()
  -- function num : 0_16 , upvalues : pcRoomGift_icon
  pcRoomGift_icon:addInputEvent("Mouse_On", "AlarmIcon_SimpleTooltips( true )")
  pcRoomGift_icon:addInputEvent("Mouse_Out", "AlarmIcon_SimpleTooltips( false )")
  pcRoomGift_icon:addInputEvent("Mouse_LUp", "HandleClicked_PcRoomJackPotBox()")
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Special_Reward")
FromClient_luaLoadComplete_Special_Reward = function()
  -- function num : 0_17
  FromClient_CompleteBenefitReward()
  FromClient_CompleteChallengeReward()
  SpecialReward_registEventHandler()
  SpecialReward_registMessageHandler()
end

Panel_NewEventProduct_Alarm:RegisterUpdateFunc("PcRoomGiftPanel_UpdatePerFrame")

