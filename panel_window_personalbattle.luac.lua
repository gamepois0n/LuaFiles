-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\personalbattle\panel_window_personalbattle.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
PaGlobal_PersonalBattle = {
_ui = {_blackBG = (UI.getChildControl)(Panel_Window_PersonalBattle, "Static_BlackBG"), _txtTitle = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Title"), _btnClose = (UI.getChildControl)(Panel_Window_PersonalBattle, "Button_Win_Close"), _listBg = (UI.getChildControl)(Panel_Window_PersonalBattle, "Static_PersonalBattleListBG"), _scroll = (UI.getChildControl)(Panel_Window_PersonalBattle, "Scroll_PersonalBattleList"), _txtRule = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_RuleContent"), _txtReward = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_RewardContent"), _txtInfo = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_InfoContent"), _list2 = (UI.getChildControl)(Panel_Window_PersonalBattle, "List2_PersonalBattleList"), _desc_Rule_Title = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_PersonalBattle_Rule"), _desc_rule = (UI.getChildControl)(Panel_Window_PersonalBattle, "Static_BG_1"), 
desc_Rule = {(UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Rule_2"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Rule_3"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Rule_4"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Rule_5"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Rule_6"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Rule_7"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Rule_8"); [0] = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Rule_1")}
, 
desc_RuleText = {PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_RULETEXT_2"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_RULETEXT_3"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_RULETEXT_4"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_RULETEXT_5"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_RULETEXT_6"), PAGetStringParam2(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_RULETEXT_7", "time", 5, "count", 3), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_RULETEXT_8"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_RULETEXT_1")}
, _desc_Reward_Title = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_PersonalBattle_Reward"), _desc_Reward = (UI.getChildControl)(Panel_Window_PersonalBattle, "Static_BG_2"), 
desc_Reward = {(UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Reward_2"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Reward_3"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Reward_4"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Reward_5"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Reward_6"); [0] = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Reward_1")}
, 
desc_RewardText = {PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_REWARD_2"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_REWARD_3"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_REWARD_4"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_REWARD_5"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_REWARD_6"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_REWARD_1")}
, _desc_Explanation_Title = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_PersonalBattle_Explanation"), _desc_Explanation = (UI.getChildControl)(Panel_Window_PersonalBattle, "Static_BG_3"), 
desc_Explanation = {(UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Explanation_2"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Explanation_3"), (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Explanation_4"); [0] = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_Desc_Explanation_1")}
, 
desc_ExplanationText = {PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_EXPLANATION_2"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_EXPLANATION_3"), PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_EXPLANATION_4"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_DESC_EXPLANATION_1")}
, _RankInfo = (UI.getChildControl)(Panel_Window_PersonalBattle, "StaticText_RankInfo")}
, _createListCount = 14, _startIndex = 0, 
_listPool = {}
, _openDesc = -1, _maxDescRuleSize = 40, _maxDescRewardSize = 20, _maxDescExplanationSize = 30, 
_posConfig = {_listStartPosY = 25, _iconStartPosY = 88, _listPosYGap = 31}
}
-- DECOMPILER ERROR at PC330: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_PersonalBattle.initialize = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  local self = PaGlobal_PersonalBattle
  ;
  ((self._ui)._list2):changeAnimationSpeed(10)
  ;
  ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_PersonalBattle_ListUpdate")
  ;
  ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._txtRule):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self._ui)._txtReward):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self._ui)._txtInfo):SetTextMode(UI_TM.eTextMode_AutoWrap)
  for _,control in pairs((self._ui).desc_Rule) do
    ((self._ui)._desc_rule):AddChild(control)
  end
  for _,control in pairs((self._ui).desc_Rule) do
    Panel_Window_PersonalBattle:RemoveControl(control)
  end
  for _,control in pairs((self._ui).desc_Rule) do
    control:SetTextMode(UI_TM.eTextMode_AutoWrap)
    control:SetAutoResize(true)
  end
  for index = 0, #(self._ui).desc_RuleText do
    (((self._ui).desc_Rule)[index]):SetText(((self._ui).desc_RuleText)[index])
    self._maxDescRuleSize = self._maxDescRuleSize + (((self._ui).desc_Rule)[index]):GetTextSizeY()
  end
  ;
  ((self._ui)._desc_Reward_Title):SetShow(false)
  ;
  ((self._ui)._desc_Reward):SetShow(false)
  for _,control in pairs((self._ui).desc_Reward) do
    control:SetShow(false)
  end
  for _,control in pairs((self._ui).desc_Explanation) do
    ((self._ui)._desc_Explanation):AddChild(control)
  end
  for _,control in pairs((self._ui).desc_Explanation) do
    Panel_Window_PersonalBattle:RemoveControl(control)
  end
  for _,control in pairs((self._ui).desc_Explanation) do
    control:SetTextMode(UI_TM.eTextMode_AutoWrap)
    control:SetAutoResize(true)
  end
  for index = 0, #(self._ui).desc_ExplanationText do
    (((self._ui).desc_Explanation)[index]):SetText(((self._ui).desc_ExplanationText)[index])
    self._maxDescExplanationSize = self._maxDescExplanationSize + (((self._ui).desc_Explanation)[index]):GetTextSizeY()
  end
  ;
  ((self._ui)._txtRule):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_RULE"))
  ;
  ((self._ui)._txtReward):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_REWARD"))
  ;
  ((self._ui)._txtInfo):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_INFO"))
  ;
  ((self._ui)._desc_Explanation_Title):SetPosY(85)
  for index = 0, #(self._ui).desc_RuleText do
    (((self._ui).desc_Rule)[index]):SetPosX(5)
  end
  ;
  (((self._ui).desc_Rule)[0]):SetPosY(5)
  ;
  (((self._ui).desc_Rule)[1]):SetPosY((((self._ui).desc_Rule)[0]):GetPosY() + (((self._ui).desc_Rule)[0]):GetTextSizeY() + 2)
  ;
  (((self._ui).desc_Rule)[2]):SetPosY((((self._ui).desc_Rule)[1]):GetPosY() + (((self._ui).desc_Rule)[1]):GetTextSizeY() + 2)
  ;
  (((self._ui).desc_Rule)[3]):SetPosY((((self._ui).desc_Rule)[2]):GetPosY() + (((self._ui).desc_Rule)[2]):GetTextSizeY() + 2)
  ;
  (((self._ui).desc_Rule)[4]):SetPosY((((self._ui).desc_Rule)[3]):GetPosY() + (((self._ui).desc_Rule)[3]):GetTextSizeY() + 2)
  ;
  (((self._ui).desc_Rule)[5]):SetPosY((((self._ui).desc_Rule)[4]):GetPosY() + (((self._ui).desc_Rule)[4]):GetTextSizeY() + 2)
  ;
  (((self._ui).desc_Rule)[6]):SetPosY((((self._ui).desc_Rule)[5]):GetPosY() + (((self._ui).desc_Rule)[5]):GetTextSizeY() + 2)
  ;
  (((self._ui).desc_Rule)[7]):SetPosY((((self._ui).desc_Rule)[6]):GetPosY() + (((self._ui).desc_Rule)[6]):GetTextSizeY() + 2)
  for index = 0, #(self._ui).desc_ExplanationText do
    (((self._ui).desc_Explanation)[index]):SetPosX(5)
  end
  ;
  (((self._ui).desc_Explanation)[0]):SetPosY(5)
  ;
  (((self._ui).desc_Explanation)[1]):SetPosY((((self._ui).desc_Explanation)[0]):GetPosY() + (((self._ui).desc_Explanation)[0]):GetTextSizeY() + 2)
  ;
  (((self._ui).desc_Explanation)[2]):SetPosY((((self._ui).desc_Explanation)[1]):GetPosY() + (((self._ui).desc_Explanation)[1]):GetTextSizeY() + 2)
  ;
  (((self._ui).desc_Explanation)[3]):SetPosY((((self._ui).desc_Explanation)[2]):GetPosY() + (((self._ui).desc_Explanation)[2]):GetTextSizeY() + 2)
  ;
  ((self._ui)._txtRule):SetPosX(5)
  ;
  ((self._ui)._txtRule):SetPosY(5)
  ;
  ((self._ui)._blackBG):SetSize(getScreenSizeX() + 250, getScreenSizeY() + 250)
  ;
  ((self._ui)._blackBG):SetHorizonCenter()
  ;
  ((self._ui)._blackBG):SetVerticalMiddle()
  ;
  ((self._ui)._btnClose):addInputEvent("Mouse_LUp", "PaGlobal_PersonalBattle:close()")
end

-- DECOMPILER ERROR at PC333: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_PersonalBattle.open = function(self)
  -- function num : 0_1
  if ToClient_getJoinGuildBattle() == true then
    if ToClient_isPersonalBattle() == false then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoCantattendGuildBattle"))
    else
      PaGlobal_PersonalBattle:unJoin()
    end
    return 
  end
  ToClient_GuildBattleStatusRefreshReq()
  ToClient_getPersonalBattleRankInfo()
end

-- DECOMPILER ERROR at PC336: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_PersonalBattle.close = function(self)
  -- function num : 0_2
  Panel_Window_PersonalBattle:SetShow(false)
end

-- DECOMPILER ERROR at PC339: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_PersonalBattle.update = function(self)
  -- function num : 0_3
  local serverCount = ToClient_GuildBattleStatusCount()
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  for idx = 0, serverCount - 1 do
    (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, idx))
  end
end

-- DECOMPILER ERROR at PC342: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_PersonalBattle.join = function(self, idx)
  -- function num : 0_4
  local curChannelData = getCurrentChannelServerData()
  local getLevel = ((getSelfPlayer()):get()):getLevel()
  if curChannelData == nil then
    return 
  end
  local personalBattleStatusData = ToClient_getGuildBattleStatusData(idx)
  local getServerNo = personalBattleStatusData:getServerNo()
  local channelName = getChannelName(curChannelData._worldNo, getServerNo)
  local isGameMaster = ToClient_SelfPlayerIsGM()
  local channelMemo = ""
  local tempChannel = getGameChannelServerDataByWorldNo(curChannelData._worldNo, idx)
  local isBalanceServer = tempChannel._isBalanceChannel
  local joinPersonalBattle = function()
    -- function num : 0_4_0 , upvalues : getServerNo, curChannelData
    local playerWrapper = getSelfPlayer()
    local player = playerWrapper:get()
    local hp = player:getHp()
    local maxHp = player:getMaxHp()
    if player:doRideMyVehicle() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_NOT_RIDEHORSE"))
    else
      if ToClient_IsMyselfInArena() then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_SymbolNo, "eErrNoCompetitionAlreadyIn"))
        return 
      end
    end
    local appliedBuff = (getSelfPlayer()):getAppliedBuffBegin(true)
    if appliedBuff ~= nil then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CANNOTJOIN_DEBUFF"))
      return 
    end
    if IsSelfPlayerWaitAction() then
      if hp == maxHp then
        if getServerNo == curChannelData._serverNo then
          ToClient_joinPersonalBattle()
        else
          ToClient_RequestGuildBattleJoinToAnotherChannel(getServerNo)
        end
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_MAXHP_CHECK"))
      end
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALERTAREA_NOTUSEALERT"))
    end
  end

  if getServerNo == curChannelData._serverNo then
    channelMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_CURRENTCHANNELJOIN")
  else
    channelMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_CHANNELMOVE", "channelName", channelName)
  end
  local changeChannelTime = getChannelMoveableRemainTime(curChannelData._worldNo)
  local changeRealChannelTime = convertStringFromDatetime(changeChannelTime)
  if toInt64(0, 0) < changeChannelTime and getServerNo ~= curChannelData._serverNo then
    local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANGECHANNEL_PENALTY", "changeRealChannelTime", changeRealChannelTime)
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      do
        local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), content = channelMemo, functionYes = joinPersonalBattle, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData)
        PaGlobal_GuildBattlePoint:clearAttendName()
      end
    end
  end
end

-- DECOMPILER ERROR at PC345: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_PersonalBattle.unJoin = function(self)
  -- function num : 0_5
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_MENU_PERSONALBATTLE_UNJOIN")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = ToClient_GuildBattle_UnjoinGuildBattle, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_PersonalBattle_ListUpdate = function(contents, key)
  -- function num : 0_6
  local self = PaGlobal_PersonalBattle
  local idx = Int64toInt32(key)
  local personalBattleListBG = (UI.getChildControl)(contents, "StaticText_ListBG")
  personalBattleListBG:SetShow(true)
  local personalBattleListServer = (UI.getChildControl)(contents, "StaticText_Channel")
  personalBattleListServer:SetShow(true)
  local personalBattleListJoinMember = (UI.getChildControl)(contents, "StaticText_JoinMemberCount")
  personalBattleListJoinMember:SetShow(true)
  local personalBattleListStatus = (UI.getChildControl)(contents, "StaticText_PersonalBattleStatus")
  personalBattleListStatus:SetShow(true)
  local personalBattleListJoinBtn = (UI.getChildControl)(contents, "Button_Join")
  personalBattleListJoinBtn:SetShow(true)
  local curChannelData = getCurrentChannelServerData()
  local worldServerData = getGameWorldServerDataByWorldNo(curChannelData._worldNo)
  local restrictedServerNo = worldServerData._restrictedServerNo
  local isAdmission = true
  if restrictedServerNo ~= 0 then
    if restrictedServerNo == curChannelData._serverNo then
      isAdmission = true
    else
      if toInt64(0, 0) < changeChannelTime then
        isAdmission = false
      else
        isAdmission = true
      end
    end
  end
  if curChannelData ~= nil then
    local personalBattleStatusData = ToClient_getGuildBattleStatusData(idx)
    local getServerNo = personalBattleStatusData:getServerNo()
    local getJoinMemberCount = personalBattleStatusData:getTotalJoinCount()
    local getIsFull = personalBattleStatusData:isFull()
    local isPersonalMode = personalBattleStatusData:isPersonalMode()
    local channelName = getChannelName(curChannelData._worldNo, getServerNo)
    local getIsStopByGM = personalBattleStatusData:isStopByGM()
    if getJoinMemberCount < 0 then
      getJoinMemberCount = 0
    end
    if isPersonalMode == false or getIsStopByGM == true then
      isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_FINISH")
      personalBattleListJoinBtn:SetFontColor((Defines.Color).C_FFF26A6A)
      personalBattleListJoinBtn:SetOverFontColor((Defines.Color).C_FFF26A6A)
      personalBattleListJoinBtn:SetClickFontColor((Defines.Color).C_FFF26A6A)
      personalBattleListJoinBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CANTJOIN"))
      personalBattleListJoinBtn:SetIgnore(true)
    else
      if personalBattleStatusData:isReadyState() == true then
        if getIsFull == true then
          isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_WAITING")
          personalBattleListJoinBtn:SetFontColor((Defines.Color).C_FFF0EF9D)
          personalBattleListJoinBtn:SetOverFontColor((Defines.Color).C_FFF0EF9D)
          personalBattleListJoinBtn:SetClickFontColor((Defines.Color).C_FFF0EF9D)
          personalBattleListJoinBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CANTJOIN"))
          personalBattleListJoinBtn:SetIgnore(true)
        else
          isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_JOIN_WAITING")
          personalBattleListJoinBtn:SetFontColor((Defines.Color).C_FF3B8BBE)
          personalBattleListJoinBtn:SetOverFontColor((Defines.Color).C_FF3B8BBE)
          personalBattleListJoinBtn:SetClickFontColor((Defines.Color).C_FF3B8BBE)
          personalBattleListJoinBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_JOIN"))
          personalBattleListJoinBtn:SetIgnore(false)
        end
      else
        if personalBattleStatusData:isGamingState() == true then
          isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_ING")
          personalBattleListJoinBtn:SetFontColor((Defines.Color).C_FFF0EF9D)
          personalBattleListJoinBtn:SetOverFontColor((Defines.Color).C_FFF0EF9D)
          personalBattleListJoinBtn:SetClickFontColor((Defines.Color).C_FFF0EF9D)
          personalBattleListJoinBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CANTJOIN"))
          personalBattleListJoinBtn:SetIgnore(true)
        else
          if personalBattleStatusData:isEndState() == true then
            isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_SOONFINISH")
            personalBattleListJoinBtn:SetFontColor((Defines.Color).C_FFF26A6A)
            personalBattleListJoinBtn:SetOverFontColor((Defines.Color).C_FFF26A6A)
            personalBattleListJoinBtn:SetClickFontColor((Defines.Color).C_FFF26A6A)
            personalBattleListJoinBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SAVAGEDEFENCEINFO_GAMING"))
            personalBattleListJoinBtn:SetIgnore(true)
          end
        end
      end
    end
    if not isAdmission then
      personalBattleListJoinBtn:SetFontColor((Defines.Color).C_FFF26A6A)
      personalBattleListJoinBtn:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVERSELECT_ISADMISSION_LIMIT"))
      personalBattleListJoinBtn:SetIgnore(true)
    end
    personalBattleListServer:SetText(channelName)
    personalBattleListJoinMember:SetText(getJoinMemberCount)
    personalBattleListStatus:SetText(isCurrentState)
    personalBattleListJoinBtn:addInputEvent("Mouse_LUp", "PaGlobal_PersonalBattle:join(" .. idx .. ")")
  end
end

local rule_ani_SpeedTime = 5
local _desc_Rule_TitleSize = 0
FGlobal_PersonalBattle_InformationOpen = function(deltaTime)
  -- function num : 0_7 , upvalues : rule_ani_SpeedTime
  local self = PaGlobal_PersonalBattle
  if ((self._ui)._desc_Rule_Title):IsCheck() then
    local value = ((self._ui)._desc_rule):GetSizeY() + (self._maxDescRuleSize - ((self._ui)._desc_rule):GetSizeY()) * deltaTime * rule_ani_SpeedTime
    if value < 10 then
      value = 10
    end
    ;
    ((self._ui)._desc_rule):SetSize(((self._ui)._desc_rule):GetSizeX(), value)
    ;
    ((self._ui)._desc_rule):SetShow(true)
  else
    do
      do
        local value = ((self._ui)._desc_rule):GetSizeY() - (self._maxDescRuleSize + ((self._ui)._desc_rule):GetSizeY()) * deltaTime * rule_ani_SpeedTime
        if value < 10 then
          value = 10
        end
        ;
        ((self._ui)._desc_rule):SetSize(((self._ui)._desc_rule):GetSizeX(), value)
        if ((self._ui)._desc_rule):GetSizeY() <= 10 then
          ((self._ui)._desc_rule):SetShow(false)
        end
        if ((self._ui)._desc_Explanation_Title):IsCheck() then
          local value = ((self._ui)._desc_Explanation):GetSizeY() + (self._maxDescExplanationSize - ((self._ui)._desc_Explanation):GetSizeY()) * deltaTime * rule_ani_SpeedTime
          if value < 10 then
            value = 10
          end
          ;
          ((self._ui)._desc_Explanation):SetSize(((self._ui)._desc_Explanation):GetSizeX(), value)
          ;
          ((self._ui)._desc_Explanation):SetShow(true)
        else
          do
            do
              local value = ((self._ui)._desc_Explanation):GetSizeY() - (self._maxDescExplanationSize + ((self._ui)._desc_Explanation):GetSizeY()) * deltaTime * rule_ani_SpeedTime
              if value < 10 then
                value = 10
              end
              ;
              ((self._ui)._desc_Explanation):SetSize(((self._ui)._desc_Explanation):GetSizeX(), value)
              if ((self._ui)._desc_Explanation):GetSizeY() <= 10 then
                ((self._ui)._desc_Explanation):SetShow(false)
              end
              ;
              ((self._ui)._desc_rule):SetPosY(((self._ui)._desc_Rule_Title):GetPosY() + ((self._ui)._desc_Rule_Title):GetSizeY())
              if ((self._ui)._desc_rule):GetShow() then
                ((self._ui)._desc_Explanation_Title):SetPosY(((self._ui)._desc_rule):GetPosY() + ((self._ui)._desc_rule):GetSizeY() + 10)
              else
                ;
                ((self._ui)._desc_Explanation_Title):SetPosY(((self._ui)._desc_Rule_Title):GetPosY() + ((self._ui)._desc_Rule_Title):GetSizeY() + 5)
              end
              ;
              ((self._ui)._desc_Explanation):SetPosY(((self._ui)._desc_Explanation_Title):GetPosY() + ((self._ui)._desc_Explanation_Title):GetSizeY())
              for _,control in pairs((self._ui).desc_Rule) do
                control:SetShow(control:GetPosY() + control:GetSizeY() < ((self._ui)._desc_rule):GetSizeY())
              end
              for _,control in pairs((self._ui).desc_Explanation) do
                control:SetShow(control:GetPosY() + control:GetSizeY() < ((self._ui)._desc_Explanation):GetSizeY())
              end
              -- DECOMPILER ERROR: 4 unprocessed JMP targets
            end
          end
        end
      end
    end
  end
end

FromClient_PersonalBattle_StartSoon = function()
  -- function num : 0_8
  local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_SELECTED_MASTER"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE"), addMsg = ""}
  if ToClient_GuildBattle_AmIMasterForThisBattle() == false then
    msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_PERSONALBATTLE_STARTSOON")
  end
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 5, 78, false)
end

FromClient_PersonalBattleRankInfoResult = function(winCount, loseCount, rating, ranking)
  -- function num : 0_9
  local self = PaGlobal_PersonalBattle
  local msg = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDBATTLE_PERSONALBATTLE_RANKINFO", "winCount", tostring(winCount), "loseCount", tostring(loseCount), "rating", tostring(rating), "ranking", tostring(ranking))
  ;
  ((self._ui)._RankInfo):SetText(msg)
end

FromClient_UpdateGuildBattleStatus = function()
  -- function num : 0_10
  local self = PaGlobal_PersonalBattle
  Panel_Window_PersonalBattle:SetShow(true)
  ;
  ((self._ui)._desc_Rule_Title):SetCheck(true)
  ;
  ((self._ui)._desc_Explanation_Title):SetCheck(false)
  ;
  ((self._ui)._desc_rule):SetShow(false)
  ;
  ((self._ui)._desc_Explanation):SetShow(false)
  ;
  ((self._ui)._desc_rule):SetSize(((self._ui)._desc_rule):GetSizeX(), 1)
  ;
  ((self._ui)._desc_Explanation):SetSize(((self._ui)._desc_Explanation):GetSizeX(), 1)
  self:update()
end

FromClient_luaLoadComplete_PersonalBattleWindow = function()
  -- function num : 0_11
  PaGlobal_PersonalBattle:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PersonalBattleWindow")
registerEvent("FromClient_PersonalBattleRankInfoResult", "FromClient_PersonalBattleRankInfoResult")
registerEvent("FromClient_UpdateGuildBattleStatus", "FromClient_UpdateGuildBattleStatus")
registerEvent("FromClient_PersonalBattle_StartSoon", "FromClient_PersonalBattle_StartSoon")
Panel_Window_PersonalBattle:RegisterUpdateFunc("FGlobal_PersonalBattle_InformationOpen")

