-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\savagedefence\savagedefenceinfo.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_SavageDefenceInfo:SetShow(false)
Panel_SavageDefenceInfo:setMaskingChild(true)
Panel_SavageDefenceInfo:ActiveMouseEventEffect(true)
Panel_SavageDefenceInfo:setGlassBackground(true)
local SavegeDefenceInfo = {_blackBG = (UI.getChildControl)(Panel_SavageDefenceInfo, "Static_BlackBG"), _txtTitle = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Title"), _btnClose = (UI.getChildControl)(Panel_SavageDefenceInfo, "Button_Win_Close"), _btnHelp = (UI.getChildControl)(Panel_SavageDefenceInfo, "Button_Question"), _listBg = (UI.getChildControl)(Panel_SavageDefenceInfo, "Static_SavageDefenceListBG"), _scroll = (UI.getChildControl)(Panel_SavageDefenceInfo, "Scroll_SavageDefenceList"), _txtRule = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_RuleContent"), _txtReward = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_RewardContent"), _txtInfo = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_InfoContent"), _btnInmy = (UI.getChildControl)(Panel_SavageDefenceInfo, "Button_InmyChannel"), _list2 = (UI.getChildControl)(Panel_SavageDefenceInfo, "List2_SavageDefenceList"), _desc_Rule_Title = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_SavageDefence_Rule"), _desc_rule = (UI.getChildControl)(Panel_SavageDefenceInfo, "Static_BG_1"), 
desc_Rule = {(UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_2"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_3"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_4"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_5"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_6"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_7"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_8"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_9"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_10"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_11"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_12"); [0] = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Rule_1")}
, 
desc_RuleText = {PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_2"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_3"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_4"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_5"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_6"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_7"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_8"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_9"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_10"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_12"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_1")}
, _desc_Reward_Title = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_SavageDefence_Reward"), _desc_Reward = (UI.getChildControl)(Panel_SavageDefenceInfo, "Static_BG_2"), 
desc_Reward = {(UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Reward_2"); [0] = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Reward_1")}
, 
desc_RewardText = {PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_REWARD_2"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_REWARD_1")}
, _desc_Explanation_Title = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_SavageDefence_Explanation"), _desc_Explanation = (UI.getChildControl)(Panel_SavageDefenceInfo, "Static_BG_3"), 
desc_Explanation = {(UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Explanation_2"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Explanation_3"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Explanation_4"), (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Explanation_5"); [0] = (UI.getChildControl)(Panel_SavageDefenceInfo, "StaticText_Desc_Explanation_1")}
, 
desc_ExplanationText = {PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_2"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_3"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_4"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_5"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_1")}
, _createListCount = 14, _startIndex = 0, 
_listPool = {}
, _openDesc = -1, _maxDescRuleSize = 40, _maxDescRewardSize = 20, _maxDescExplanationSize = 30, 
_posConfig = {_listStartPosY = 25, _iconStartPosY = 88, _listPosYGap = 31}
}
SavageDefenceInfo_Initionalize = function()
  -- function num : 0_0 , upvalues : SavegeDefenceInfo, UI_TM
  local self = SavegeDefenceInfo
  ;
  (self._list2):changeAnimationSpeed(10)
  ;
  (self._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "SavageDefenceInfo_ListUpdate")
  ;
  (self._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self._txtRule):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txtReward):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txtInfo):SetTextMode(UI_TM.eTextMode_AutoWrap)
  for _,control in pairs(self.desc_Rule) do
    (self._desc_rule):AddChild(control)
  end
  for _,control in pairs(self.desc_Rule) do
    Panel_SavageDefenceInfo:RemoveControl(control)
  end
  for _,control in pairs(self.desc_Rule) do
    control:SetTextMode(UI_TM.eTextMode_AutoWrap)
    control:SetAutoResize(true)
  end
  for index = 0, #self.desc_RuleText do
    ((self.desc_Rule)[index]):SetText((self.desc_RuleText)[index])
    self._maxDescRuleSize = self._maxDescRuleSize + ((self.desc_Rule)[index]):GetTextSizeY()
  end
  for _,control in pairs(self.desc_Reward) do
    (self._desc_Reward):AddChild(control)
  end
  for _,control in pairs(self.desc_Reward) do
    Panel_SavageDefenceInfo:RemoveControl(control)
  end
  for _,control in pairs(self.desc_Reward) do
    control:SetTextMode(UI_TM.eTextMode_AutoWrap)
    control:SetAutoResize(true)
  end
  for index = 0, #self.desc_RewardText do
    ((self.desc_Reward)[index]):SetText((self.desc_RewardText)[index])
    self._maxDescRewardSize = self._maxDescRewardSize + ((self.desc_Reward)[index]):GetTextSizeY()
  end
  for _,control in pairs(self.desc_Explanation) do
    (self._desc_Explanation):AddChild(control)
  end
  for _,control in pairs(self.desc_Explanation) do
    Panel_SavageDefenceInfo:RemoveControl(control)
  end
  for _,control in pairs(self.desc_Explanation) do
    control:SetTextMode(UI_TM.eTextMode_AutoWrap)
    control:SetAutoResize(true)
  end
  for index = 0, #self.desc_ExplanationText do
    ((self.desc_Explanation)[index]):SetText((self.desc_ExplanationText)[index])
    self._maxDescExplanationSize = self._maxDescExplanationSize + ((self.desc_Explanation)[index]):GetTextSizeY()
  end
  ;
  (self._txtRule):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_RULE"))
  ;
  (self._txtReward):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_REWARD"))
  ;
  (self._txtInfo):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_INFO"))
  ;
  (self._desc_Reward_Title):SetPosY(85)
  ;
  (self._desc_Explanation_Title):SetPosY(110)
  for index = 0, #self.desc_RuleText do
    ((self.desc_Rule)[index]):SetPosX(5)
  end
  ;
  ((self.desc_Rule)[0]):SetPosY(5)
  ;
  ((self.desc_Rule)[1]):SetPosY(((self.desc_Rule)[0]):GetPosY() + ((self.desc_Rule)[0]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[2]):SetPosY(((self.desc_Rule)[1]):GetPosY() + ((self.desc_Rule)[1]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[3]):SetPosY(((self.desc_Rule)[2]):GetPosY() + ((self.desc_Rule)[2]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[4]):SetPosY(((self.desc_Rule)[3]):GetPosY() + ((self.desc_Rule)[3]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[5]):SetPosY(((self.desc_Rule)[4]):GetPosY() + ((self.desc_Rule)[4]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[6]):SetPosY(((self.desc_Rule)[5]):GetPosY() + ((self.desc_Rule)[5]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[7]):SetPosY(((self.desc_Rule)[6]):GetPosY() + ((self.desc_Rule)[6]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[8]):SetPosY(((self.desc_Rule)[7]):GetPosY() + ((self.desc_Rule)[7]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[9]):SetPosY(((self.desc_Rule)[8]):GetPosY() + ((self.desc_Rule)[8]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[10]):SetPosY(((self.desc_Rule)[9]):GetPosY() + ((self.desc_Rule)[9]):GetTextSizeY() + 2)
  ;
  ((self.desc_Rule)[11]):SetPosY(((self.desc_Rule)[10]):GetPosY() + ((self.desc_Rule)[10]):GetTextSizeY() + 2)
  for index = 0, #self.desc_RewardText do
    ((self.desc_Reward)[index]):SetPosX(5)
  end
  ;
  ((self.desc_Reward)[0]):SetPosY(5)
  ;
  ((self.desc_Reward)[1]):SetPosY(((self.desc_Reward)[0]):GetPosY() + ((self.desc_Reward)[0]):GetTextSizeY() + 2)
  for index = 0, #self.desc_ExplanationText do
    ((self.desc_Explanation)[index]):SetPosX(5)
  end
  ;
  ((self.desc_Explanation)[0]):SetPosY(5)
  ;
  ((self.desc_Explanation)[1]):SetPosY(((self.desc_Explanation)[0]):GetPosY() + ((self.desc_Explanation)[0]):GetTextSizeY() + 2)
  ;
  ((self.desc_Explanation)[2]):SetPosY(((self.desc_Explanation)[1]):GetPosY() + ((self.desc_Explanation)[1]):GetTextSizeY() + 2)
  ;
  ((self.desc_Explanation)[3]):SetPosY(((self.desc_Explanation)[2]):GetPosY() + ((self.desc_Explanation)[2]):GetTextSizeY() + 2)
  ;
  ((self.desc_Explanation)[4]):SetPosY(((self.desc_Explanation)[3]):GetPosY() + ((self.desc_Explanation)[3]):GetTextSizeY() + 2)
  ;
  (self._txtRule):SetPosX(5)
  ;
  (self._txtRule):SetPosY(5)
  ;
  (self._blackBG):SetSize(getScreenSizeX() + 250, getScreenSizeY() + 250)
  ;
  (self._blackBG):SetHorizonCenter()
  ;
  (self._blackBG):SetVerticalMiddle()
  ;
  (self._btnClose):addInputEvent("Mouse_LUp", "FGlobal_SavageDefenceInfo_Close()")
end

SavageDefenceInfo_ListUpdate = function(contents, key)
  -- function num : 0_1 , upvalues : SavegeDefenceInfo
  local self = SavegeDefenceInfo
  local idx = Int64toInt32(key)
  local savageDefenceListBG = (UI.getChildControl)(contents, "StaticText_ListBG")
  savageDefenceListBG:SetShow(true)
  local savageDefenceListServer = (UI.getChildControl)(contents, "StaticText_Channel")
  savageDefenceListServer:SetShow(true)
  local savageDefenceListJoinMember = (UI.getChildControl)(contents, "StaticText_JoinMemberCount")
  savageDefenceListJoinMember:SetShow(true)
  local savageDefenceListStatus = (UI.getChildControl)(contents, "StaticText_DefenceStatus")
  savageDefenceListStatus:SetShow(true)
  local savageDefenceListWave = (UI.getChildControl)(contents, "StaticText_DefenceWave")
  savageDefenceListWave:SetShow(true)
  local savageDefenceListJoinBtn = (UI.getChildControl)(contents, "Button_Join")
  savageDefenceListJoinBtn:SetShow(true)
  local curChannelData = getCurrentChannelServerData()
  if curChannelData ~= nil then
    _PA_LOG("정태�\164", "idx : " .. tostring(idx))
    local savageDefenceStatusData = ToClient_getSavageDefenceStatusData(1)
    local getServerNo = savageDefenceStatusData:getServerNo()
    _PA_LOG("정태�\164", "getServerNo : " .. tostring(getServerNo))
    local getJoinMemberCount = savageDefenceStatusData:getTotalJoinCount()
    local getCurrentState = savageDefenceStatusData:getState()
    local getWave = savageDefenceStatusData:getWave()
    local channelName = getChannelName(curChannelData._worldNo, getServerNo)
    if getJoinMemberCount < 0 then
      getJoinMemberCount = 0
    end
    if getCurrentState == 0 then
      isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_JOIN_WAITING")
      isWarTime = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_WAITING")
      savageDefenceListJoinBtn:SetFontColor((Defines.Color).C_FF3B8BBE)
      savageDefenceListJoinBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_JOIN"))
      savageDefenceListJoinBtn:SetIgnore(false)
    else
      if getCurrentState == 1 then
        isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_ING")
        isWarTime = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_TIME", "warTimeMinute", warTimeMinute, "warTimeSecond", Int64toInt32(warTimeSecond))
        savageDefenceListJoinBtn:SetFontColor((Defines.Color).C_FF3B8BBE)
        savageDefenceListJoinBtn:SetText("게임�\145")
        savageDefenceListJoinBtn:SetIgnore(false)
      else
        if getCurrentState == 2 then
          isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_SOONFINISH")
          isWarTime = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_TIME", "warTimeMinute", warTimeMinute, "warTimeSecond", Int64toInt32(warTimeSecond))
          savageDefenceListJoinBtn:SetFontColor((Defines.Color).C_FFF26A6A)
          savageDefenceListJoinBtn:SetText("게임�\145")
          savageDefenceListJoinBtn:SetIgnore(true)
        else
          if getCurrentState == 3 then
            isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_FINISH")
            isWarTime = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_FINISH")
            savageDefenceListJoinBtn:SetFontColor((Defines.Color).C_FFF26A6A)
            savageDefenceListJoinBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CANTJOIN"))
            savageDefenceListJoinBtn:SetIgnore(true)
          end
        end
      end
    end
    savageDefenceListServer:SetText(channelName)
    savageDefenceListJoinMember:SetText(getJoinMemberCount)
    savageDefenceListStatus:SetText(isCurrentState)
    savageDefenceListWave:SetText(getWave)
    savageDefenceListJoinBtn:addInputEvent("Mouse_LUp", "SavegeDefenceInfo_join()")
  end
end

SavegeDefenceInfo.update = function(self)
  -- function num : 0_2
  local serverCount = ToClient_SavageDefenceStatusCount()
  ;
  ((self._list2):getElementManager()):clearKey()
  for idx = 0, serverCount - 1 do
    ((self._list2):getElementManager()):pushKey(toInt64(0, idx))
  end
end

SavegeDefenceInfo_join = function()
  -- function num : 0_3
  ToClient_SavageDefenceJoin()
end

SavegeDefenceInfo_tossCoin = function(coin)
  -- function num : 0_4
  ToClient_SavageDefenceCoinToss(coin)
end

SavegeDefenceInfo_testitem = function(index)
  -- function num : 0_5
  ToClient_SavageDefenceBuyItem(index)
end

SavegeDefenceInfo_unjoin = function()
  -- function num : 0_6
  ToClient_SavageDefenceUnJoin()
end

FGlobal_SavageDefenceInfo_Open = function()
  -- function num : 0_7
  ToClient_SavageDefenceStatusRefreshReq()
end

FGlobal_SavageDefenceInfo_Close = function()
  -- function num : 0_8 , upvalues : SavegeDefenceInfo
  local self = SavegeDefenceInfo
  self._openDesc = -1
  ;
  (self._desc_Rule_Title):SetCheck(false)
  ;
  (self._desc_Reward_Title):SetCheck(false)
  ;
  (self._desc_Explanation_Title):SetCheck(false)
  ;
  (self._desc_rule):SetShow(false)
  ;
  (self._desc_Reward):SetShow(false)
  ;
  (self._desc_Explanation):SetShow(false)
  ;
  (self._desc_rule):SetSize((self._desc_rule):GetSizeX(), 1)
  ;
  (self._desc_Reward):SetSize((self._desc_Reward):GetSizeX(), 1)
  ;
  (self._desc_Explanation):SetSize((self._desc_Explanation):GetSizeX(), 1)
  Panel_SavageDefenceInfo:SetShow(false)
  TooltipSimple_Hide()
end

SavageDefenceInfo_Repos = function()
  -- function num : 0_9 , upvalues : SavegeDefenceInfo
  local self = SavegeDefenceInfo
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_SavageDefenceInfo:SetPosX((screenSizeX - Panel_SavageDefenceInfo:GetSizeX()) / 2)
  Panel_SavageDefenceInfo:SetPosY((screenSizeY - Panel_SavageDefenceInfo:GetSizeY()) / 2)
  Panel_SavageDefenceInfo:ComputePos()
  ;
  (self._blackBG):SetSize(getScreenSizeX() + 250, getScreenSizeY() + 250)
  ;
  (self._blackBG):SetHorizonCenter()
  ;
  (self._blackBG):SetVerticalMiddle()
end

local rule_ani_SpeedTime = 5
local _desc_Rule_TitleSize = 0
SavageDefenceInfo_InformationOpen = function(deltaTime)
  -- function num : 0_10 , upvalues : SavegeDefenceInfo, rule_ani_SpeedTime
  local self = SavegeDefenceInfo
  if (self._desc_Rule_Title):IsCheck() then
    local value = (self._desc_rule):GetSizeY() + (self._maxDescRuleSize - (self._desc_rule):GetSizeY()) * deltaTime * rule_ani_SpeedTime
    if value < 10 then
      value = 10
    end
    ;
    (self._desc_rule):SetSize((self._desc_rule):GetSizeX(), value)
    ;
    (self._desc_rule):SetShow(true)
  else
    do
      do
        local value = (self._desc_rule):GetSizeY() - (self._maxDescRuleSize + (self._desc_rule):GetSizeY()) * deltaTime * rule_ani_SpeedTime
        if value < 10 then
          value = 10
        end
        ;
        (self._desc_rule):SetSize((self._desc_rule):GetSizeX(), value)
        if (self._desc_rule):GetSizeY() <= 10 then
          (self._desc_rule):SetShow(false)
        end
        if (self._desc_Reward_Title):IsCheck() then
          local value = (self._desc_Reward):GetSizeY() + (self._maxDescRewardSize - (self._desc_Reward):GetSizeY()) * deltaTime * rule_ani_SpeedTime
          if value < 10 then
            value = 10
          end
          ;
          (self._desc_Reward):SetSize((self._desc_Reward):GetSizeX(), value)
          ;
          (self._desc_Reward):SetShow(true)
        else
          do
            do
              local value = (self._desc_Reward):GetSizeY() - (self._maxDescRewardSize + (self._desc_Reward):GetSizeY()) * deltaTime * rule_ani_SpeedTime
              if value < 10 then
                value = 10
              end
              ;
              (self._desc_Reward):SetSize((self._desc_Reward):GetSizeX(), value)
              if (self._desc_Reward):GetSizeY() <= 10 then
                (self._desc_Reward):SetShow(false)
              end
              if (self._desc_Explanation_Title):IsCheck() then
                local value = (self._desc_Explanation):GetSizeY() + (self._maxDescExplanationSize - (self._desc_Explanation):GetSizeY()) * deltaTime * rule_ani_SpeedTime
                if value < 10 then
                  value = 10
                end
                ;
                (self._desc_Explanation):SetSize((self._desc_Explanation):GetSizeX(), value)
                ;
                (self._desc_Explanation):SetShow(true)
              else
                do
                  do
                    local value = (self._desc_Explanation):GetSizeY() - (self._maxDescExplanationSize + (self._desc_Explanation):GetSizeY()) * deltaTime * rule_ani_SpeedTime
                    if value < 10 then
                      value = 10
                    end
                    ;
                    (self._desc_Explanation):SetSize((self._desc_Explanation):GetSizeX(), value)
                    if (self._desc_Explanation):GetSizeY() <= 10 then
                      (self._desc_Explanation):SetShow(false)
                    end
                    ;
                    (self._desc_rule):SetPosY((self._desc_Rule_Title):GetPosY() + (self._desc_Rule_Title):GetSizeY())
                    if (self._desc_rule):GetShow() then
                      (self._desc_Reward_Title):SetPosY((self._desc_rule):GetPosY() + (self._desc_rule):GetSizeY() + 10)
                    else
                      ;
                      (self._desc_Reward_Title):SetPosY((self._desc_Rule_Title):GetPosY() + (self._desc_Rule_Title):GetSizeY() + 5)
                    end
                    ;
                    (self._desc_Reward):SetPosY((self._desc_Reward_Title):GetPosY() + (self._desc_Reward_Title):GetSizeY())
                    if (self._desc_Reward):GetShow() then
                      (self._desc_Explanation_Title):SetPosY((self._desc_Reward):GetPosY() + (self._desc_Reward):GetSizeY() + 10)
                    else
                      ;
                      (self._desc_Explanation_Title):SetPosY((self._desc_Reward_Title):GetPosY() + (self._desc_Reward_Title):GetSizeY() + 5)
                    end
                    ;
                    (self._desc_Explanation):SetPosY((self._desc_Explanation_Title):GetPosY() + (self._desc_Explanation_Title):GetSizeY())
                    for _,control in pairs(self.desc_Rule) do
                      control:SetShow(control:GetPosY() + control:GetSizeY() < (self._desc_rule):GetSizeY())
                    end
                    for _,control in pairs(self.desc_Reward) do
                      control:SetShow(control:GetPosY() + control:GetSizeY() < (self._desc_Reward):GetSizeY())
                    end
                    for _,control in pairs(self.desc_Explanation) do
                      control:SetShow(control:GetPosY() + control:GetSizeY() < (self._desc_Explanation):GetSizeY())
                    end
                    -- DECOMPILER ERROR: 6 unprocessed JMP targets
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

FromClient_refreshSavageDefencePlayer = function(count)
  -- function num : 0_11
  for idx = 0, count do
    local key = ToClient_getSavageDefencePlayerkey(idx)
    local coin = ToClient_getSavageDefencePlayerCoin(idx)
    if key == (getSelfPlayer()):getActorKey() then
      PaGlobal_SavageDefenceShop_SetCoin(coin)
    end
  end
end

FromClient_UpdateSavageDefenceStatus = function()
  -- function num : 0_12 , upvalues : SavegeDefenceInfo
  local self = SavegeDefenceInfo
  Panel_SavageDefenceInfo:SetShow(true)
  ;
  (self._desc_Rule_Title):SetCheck(true)
  ;
  (self._desc_Reward_Title):SetCheck(false)
  ;
  (self._desc_Explanation_Title):SetCheck(false)
  ;
  (self._desc_rule):SetShow(false)
  ;
  (self._desc_Reward):SetShow(false)
  ;
  (self._desc_Explanation):SetShow(false)
  ;
  (self._desc_rule):SetSize((self._desc_rule):GetSizeX(), 1)
  ;
  (self._desc_Reward):SetSize((self._desc_Reward):GetSizeX(), 1)
  ;
  (self._desc_Explanation):SetSize((self._desc_Explanation):GetSizeX(), 1)
  self:update()
end

FromClient_luaLoadComplete_SavageDefence = function()
  -- function num : 0_13
  SavageDefenceInfo_Initionalize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_SavageDefence")
registerEvent("FromClient_UpdateSavageDefenceStatus", "FromClient_UpdateSavageDefenceStatus")
registerEvent("FromClient_refreshSavageDefencePlayer", "FromClient_refreshSavageDefencePlayer")
Panel_SavageDefenceInfo:RegisterUpdateFunc("SavageDefenceInfo_InformationOpen")

