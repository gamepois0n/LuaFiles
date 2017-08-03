-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\localwar\panel_localwarinfo.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_LocalWarInfo:SetShow(false, false)
Panel_LocalWarInfo:RegisterShowEventFunc(true, "LocalWarInfoShowAni()")
Panel_LocalWarInfo:RegisterShowEventFunc(false, "LocalWarInfoHideAni()")
LocalWarInfoShowAni = function()
  -- function num : 0_0
  Panel_LocalWarInfo:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_LocalWarInfo, 0, 0.3)
end

LocalWarInfoHideAni = function()
  -- function num : 0_1
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_LocalWarInfo, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

local localWarInfo = {_blackBG = (UI.getChildControl)(Panel_LocalWarInfo, "Static_BlackBG"), _txtTitle = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Title"), _btnClose = (UI.getChildControl)(Panel_LocalWarInfo, "Button_Win_Close"), _btnHelp = (UI.getChildControl)(Panel_LocalWarInfo, "Button_Question"), _listBg = (UI.getChildControl)(Panel_LocalWarInfo, "Static_LocalWarListBG"), _scroll = (UI.getChildControl)(Panel_LocalWarInfo, "Scroll_LocalWarList"), _txtRule = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_RuleContent"), _txtReward = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_RewardContent"), _txtInfo = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_InfoContent"), _btnInmy = (UI.getChildControl)(Panel_LocalWarInfo, "Button_InmyChannel"), _txt_M_Level = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Limit_Level"), _txt_M_Ap = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Limit_AP"), _txt_M_Dp = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Limit_DP"), _txt_M_ADSum = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Limit_ADSum"), _icon_Level = (UI.getChildControl)(Panel_LocalWarInfo, "Static_M_Limit_Level"), _icon_AP = (UI.getChildControl)(Panel_LocalWarInfo, "Static_M_Limit_AP"), _icon_DP = (UI.getChildControl)(Panel_LocalWarInfo, "Static_M_Limit_DP"), _icon_AD = (UI.getChildControl)(Panel_LocalWarInfo, "Static_M_Limit_AD"), _desc_Rule_Title = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_LocalWar_Rule"), _desc_rule = (UI.getChildControl)(Panel_LocalWarInfo, "Static_BG_1"), 
desc_Rule = {(UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_2"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_3"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_4"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_5"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_6"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_7"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_8"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_9"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_10"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_11"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_12"); [0] = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Rule_1")}
, 
desc_RuleText = {PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_2"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_3"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_4"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_5"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_6"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_7"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_8"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_9"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_10"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_12"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_RULETEXT_1")}
, _desc_Reward_Title = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_LocalWar_Reward"), _desc_Reward = (UI.getChildControl)(Panel_LocalWarInfo, "Static_BG_2"), 
desc_Reward = {(UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Reward_2"); [0] = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Reward_1")}
, 
desc_RewardText = {PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_REWARD_2"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_REWARD_1")}
, _desc_Explanation_Title = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_LocalWar_Explanation"), _desc_Explanation = (UI.getChildControl)(Panel_LocalWarInfo, "Static_BG_3"), 
desc_Explanation = {(UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Explanation_2"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Explanation_3"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Explanation_4"), (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Explanation_5"); [0] = (UI.getChildControl)(Panel_LocalWarInfo, "StaticText_Desc_Explanation_1")}
, 
desc_ExplanationText = {PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_2"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_3"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_4"), PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_5"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DESC_EXPLANATION_1")}
, _createListCount = 14, _startIndex = 0, 
_listPool = {}
, _openDesc = -1, _maxDescRuleSize = 40, _maxDescRewardSize = 20, _maxDescExplanationSize = 30, 
_posConfig = {_listStartPosY = 25, _iconStartPosY = 88, _listPosYGap = 31}
}
local localWarServerCountLimit = 0
LocalWarInfo_Initionalize = function()
  -- function num : 0_2 , upvalues : localWarInfo, UI_TM
  local self = localWarInfo
  for listIdx = 0, self._createListCount - 1 do
    local localWar = {}
    localWar.BG = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "StaticText_ListBG", self._listBg, "LocalWarInfo_BG_" .. listIdx)
    ;
    (localWar.BG):SetPosX(5)
    ;
    (localWar.BG):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    localWar.level = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "StaticText_Limit_Level", localWar.BG, "localWarInfo_Level_" .. listIdx)
    ;
    (localWar.level):SetPosX(10)
    ;
    (localWar.level):SetPosY(4)
    localWar.ap = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "StaticText_Limit_AP", localWar.BG, "localWarInfo_AP_" .. listIdx)
    ;
    (localWar.ap):SetPosX(35)
    ;
    (localWar.ap):SetPosY(4)
    localWar.dp = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "StaticText_Limit_DP", localWar.BG, "localWarInfo_DP_" .. listIdx)
    ;
    (localWar.dp):SetPosX(60)
    ;
    (localWar.dp):SetPosY(4)
    localWar.adSum = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "StaticText_Limit_ADSum", localWar.BG, "localWarInfo_ADSum_" .. listIdx)
    ;
    (localWar.adSum):SetPosX(85)
    ;
    (localWar.adSum):SetPosY(4)
    localWar.unLimit = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "StaticText_Limit_Unlimit", localWar.BG, "localWarInfo_Unlimit_" .. listIdx)
    ;
    (localWar.unLimit):SetPosX(45)
    ;
    (localWar.unLimit):SetPosY(5)
    localWar.channel = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "StaticText_Channel", localWar.BG, "localWarInfo_Channel_" .. listIdx)
    ;
    (localWar.channel):SetPosX(140)
    ;
    (localWar.channel):SetPosY(5)
    localWar.joinMember = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "StaticText_JoinMemberCount", localWar.BG, "localWarInfo_JoinMember_" .. listIdx)
    ;
    (localWar.joinMember):SetPosX(278)
    ;
    (localWar.joinMember):SetPosY(5)
    localWar.remainTime = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "StaticText_RemainTime", localWar.BG, "localWarInfo_RemainTime_" .. listIdx)
    ;
    (localWar.remainTime):SetPosX(340)
    ;
    (localWar.remainTime):SetPosY(5)
    localWar.join = (UI.createAndCopyBasePropertyControl)(Panel_LocalWarInfo, "Button_Join", localWar.BG, "localWarInfo_Join_" .. listIdx)
    ;
    (localWar.join):SetPosX(440)
    ;
    (localWar.join):SetPosY(5)
    -- DECOMPILER ERROR at PC193: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._listPool)[listIdx] = localWar
    ;
    (localWar.BG):addInputEvent("Mouse_UpScroll", "LocalWarInfo_ScrollEvent( true )")
    ;
    (localWar.BG):addInputEvent("Mouse_DownScroll", "LocalWarInfo_ScrollEvent( false )")
    ;
    (localWar.channel):addInputEvent("Mouse_UpScroll", "LocalWarInfo_ScrollEvent( true )")
    ;
    (localWar.channel):addInputEvent("Mouse_DownScroll", "LocalWarInfo_ScrollEvent( false )")
    ;
    (localWar.joinMember):addInputEvent("Mouse_UpScroll", "LocalWarInfo_ScrollEvent( true )")
    ;
    (localWar.joinMember):addInputEvent("Mouse_DownScroll", "LocalWarInfo_ScrollEvent( false )")
    ;
    (localWar.remainTime):addInputEvent("Mouse_UpScroll", "LocalWarInfo_ScrollEvent( true )")
    ;
    (localWar.remainTime):addInputEvent("Mouse_DownScroll", "LocalWarInfo_ScrollEvent( false )")
    ;
    (UIScroll.InputEventByControl)(localWar.BG, "LocalWarInfo_ScrollEvent")
    ;
    (UIScroll.InputEventByControl)(localWar.channel, "LocalWarInfo_ScrollEvent")
    ;
    (UIScroll.InputEventByControl)(localWar.joinMember, "LocalWarInfo_ScrollEvent")
    ;
    (UIScroll.InputEventByControl)(localWar.remainTime, "LocalWarInfo_ScrollEvent")
  end
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_LocalWarInfo:SetPosX((screenSizeX - Panel_LocalWarInfo:GetSizeX()) / 2)
  Panel_LocalWarInfo:SetPosY((screenSizeY - Panel_LocalWarInfo:GetSizeY()) / 2)
  ;
  (self._icon_Level):addInputEvent("Mouse_On", "LocalWarInfo_SimpleTooltip( true, 0 )")
  ;
  (self._icon_Level):addInputEvent("Mouse_Out", "LocalWarInfo_SimpleTooltip( false, 0 )")
  ;
  (self._icon_AP):addInputEvent("Mouse_On", "LocalWarInfo_SimpleTooltip( true, 1 )")
  ;
  (self._icon_AP):addInputEvent("Mouse_Out", "LocalWarInfo_SimpleTooltip( false, 1 )")
  ;
  (self._icon_DP):addInputEvent("Mouse_On", "LocalWarInfo_SimpleTooltip( true, 2 )")
  ;
  (self._icon_DP):addInputEvent("Mouse_Out", "LocalWarInfo_SimpleTooltip( false, 2 )")
  ;
  (self._icon_AD):addInputEvent("Mouse_On", "LocalWarInfo_SimpleTooltip( true, 3 )")
  ;
  (self._icon_AD):addInputEvent("Mouse_Out", "LocalWarInfo_SimpleTooltip( false, 3 )")
  ;
  (self._icon_Level):setTooltipEventRegistFunc("LocalWarInfo_SimpleTooltip( true, 0 )")
  ;
  (self._icon_AP):setTooltipEventRegistFunc("LocalWarInfo_SimpleTooltip( true, 1 )")
  ;
  (self._icon_DP):setTooltipEventRegistFunc("LocalWarInfo_SimpleTooltip( true, 2 )")
  ;
  (self._icon_AD):setTooltipEventRegistFunc("LocalWarInfo_SimpleTooltip( true, 3 )")
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
    Panel_LocalWarInfo:RemoveControl(control)
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
    Panel_LocalWarInfo:RemoveControl(control)
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
    Panel_LocalWarInfo:RemoveControl(control)
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
  if isGameTypeKorea() or isGameTypeJapan() or isGameTypeRussia() or isGameTypeEnglish() then
    (self._icon_Level):SetShow(true)
    ;
    (self._icon_Level):SetSpanSize(60, 62)
    ;
    (self._icon_AP):SetSpanSize(87, 62)
    ;
    (self._icon_DP):SetSpanSize(115, 62)
    ;
    (self._icon_AD):SetSpanSize(145, 62)
  else
    ;
    (self._icon_Level):SetShow(false)
    ;
    (self._icon_AP):SetSpanSize(60, 62)
    ;
    (self._icon_DP):SetSpanSize(100, 62)
    ;
    (self._icon_AD):SetSpanSize(145, 62)
  end
  ;
  (self._scroll):SetControlTop()
end

localWarInfo.Update = function(self)
  -- function num : 0_3 , upvalues : localWarServerCountLimit, UI_color
  for listIdx = 0, self._createListCount - 1 do
    local list = (self._listPool)[listIdx]
    ;
    (list.BG):SetShow(false)
    ;
    (list.channel):SetShow(false)
    ;
    (list.joinMember):SetShow(false)
    ;
    (list.remainTime):SetShow(false)
    ;
    (list.join):SetShow(false)
  end
  local curChannelData = getCurrentChannelServerData()
  if curChannelData == nil then
    return 
  end
  local localWarServerCount = ToClient_GetLocalwarStatusCount()
  if localWarServerCount > 6 then
    localWarServerCountLimit = 6
  else
    localWarServerCountLimit = ToClient_GetLocalwarStatusCount()
  end
  local count = 0
  for listIdx = self._startIndex, localWarServerCountLimit - 1 do
    if self._createListCount <= count then
      break
    end
    local localWarStatusData = ToClient_GetLocalwarStatusData(listIdx)
    local getServerNo = localWarStatusData:getServerNo()
    local getJoinMemberCount = localWarStatusData:getTotalJoinCount()
    local getCurrentState = localWarStatusData:getState()
    local getRemainTime = localWarStatusData:getRemainTime()
    local warTimeMinute = (math.floor)(Int64toInt32(getRemainTime / toInt64(0, 60)))
    local warTimeSecond = Int64toInt32(getRemainTime) % 60
    local channelName = getChannelName(curChannelData._worldNo, getServerNo)
    local isLimitLocalWar = localWarStatusData:isLimitedLocalWar()
    if getJoinMemberCount < 0 then
      getJoinMemberCount = 0
    end
    local list = (self._listPool)[count]
    if isGameTypeKorea() or isGameTypeJapan() then
      (list.level):SetShow(true)
      ;
      (list.level):SetPosX(0)
      ;
      (list.ap):SetPosX(25)
      ;
      (list.dp):SetPosX(55)
      ;
      (list.adSum):SetPosX(85)
    else
      ;
      (list.level):SetShow(false)
      ;
      (list.ap):SetPosX(0)
      ;
      (list.dp):SetPosX(40)
      ;
      (list.adSum):SetPosX(85)
    end
    if isLimitLocalWar then
      (list.unLimit):SetShow(false)
      ;
      (list.level):SetText(ToClient_GetLevelForLimitedLocalWar() - 1)
      ;
      (list.ap):SetText(ToClient_GetAttackForLimitedLocalWar() - 1)
      ;
      (list.dp):SetText(ToClient_GetDefenseForLimitedLocalWar() - 1)
      ;
      (list.adSum):SetText(ToClient_GetADSummaryForLimitedLocalWar() - 1)
    else
      ;
      (list.unLimit):SetShow(true)
      ;
      (list.level):SetText("")
      ;
      (list.ap):SetText("")
      ;
      (list.dp):SetText("")
      ;
      (list.adSum):SetText("")
    end
    if getCurrentState == 0 then
      isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_JOIN_WAITING")
      isWarTime = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_WAITING")
      ;
      (list.join):SetFontColor((Defines.Color).C_FF3B8BBE)
      ;
      (list.join):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_JOIN"))
      ;
      (list.join):SetIgnore(false)
    else
      if getCurrentState == 1 then
        isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_ING")
        isWarTime = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_TIME", "warTimeMinute", warTimeMinute, "warTimeSecond", Int64toInt32(warTimeSecond))
        if warTimeMinute >= 10 then
          (list.join):SetFontColor((Defines.Color).C_FF3B8BBE)
          ;
          (list.join):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_JOIN"))
          ;
          (list.join):SetIgnore(false)
        else
          ;
          (list.join):SetFontColor((Defines.Color).C_FFF26A6A)
          ;
          (list.join):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CANTJOIN"))
          ;
          (list.join):SetIgnore(true)
        end
      else
        if getCurrentState == 2 then
          isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_SOONFINISH")
          isWarTime = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_TIME", "warTimeMinute", warTimeMinute, "warTimeSecond", Int64toInt32(warTimeSecond))
          ;
          (list.join):SetFontColor((Defines.Color).C_FFF26A6A)
          ;
          (list.join):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CANTJOIN"))
          ;
          (list.join):SetIgnore(true)
        else
          if getCurrentState == 3 then
            isCurrentState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_FINISH")
            isWarTime = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_FINISH")
            ;
            (list.join):SetFontColor((Defines.Color).C_FFF26A6A)
            ;
            (list.join):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CANTJOIN"))
            ;
            (list.join):SetIgnore(true)
          end
        end
      end
    end
    ;
    (list.BG):SetShow(true)
    ;
    (list.channel):SetShow(true)
    ;
    (list.joinMember):SetShow(true)
    ;
    (list.remainTime):SetShow(true)
    ;
    (list.join):SetShow(true)
    ;
    (list.channel):SetText(channelName)
    ;
    (list.joinMember):SetText(getJoinMemberCount)
    ;
    (list.remainTime):SetText(isWarTime)
    ;
    (list.join):addInputEvent("Mouse_LUp", "LocalWawrInfo_ClickedJoinLocalWar( " .. listIdx .. "," .. tostring(isLimitLocalWar) .. " )")
    count = count + 1
  end
  do
    local inMyChannelInfo = ToClient_GetLocalwarStatusDataToServer(curChannelData._serverNo)
    if inMyChannelInfo == nil then
      (self._btnInmy):SetFontColor(UI_color.C_FFF26A6A)
      ;
      (self._btnInmy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_NOTOPENWAR"))
      ;
      (self._btnInmy):SetEnable(false)
      ;
      (self._btnInmy):addInputEvent("Mouse_LUp", "")
    else
      local inMyJoinCount = inMyChannelInfo:getTotalJoinCount()
      local inMyJoinState = inMyChannelInfo:getState()
      local inMyRemainTime = inMyChannelInfo:getRemainTime()
      local inMyRemainTimeMinute = (math.floor)(Int64toInt32(inMyRemainTime / toInt64(0, 60)))
      local inMyRemainTimeSecond = Int64toInt32(inMyRemainTime) % 60
      local inMyChannelName = getChannelName(curChannelData._worldNo, curChannelData._serverNo)
      if inMyJoinState == 0 then
        isMyChannelState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_WAITING")
      else
        if inMyJoinState == 1 then
          isMyChannelState = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_TIME", "warTimeMinute", inMyRemainTimeMinute, "warTimeSecond", Int64toInt32(inMyRemainTimeSecond))
        else
          if inMyJoinState == 2 then
            isMyChannelState = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_TIME", "warTimeMinute", inMyRemainTimeMinute, "warTimeSecond", Int64toInt32(inMyRemainTimeSecond))
          else
            if inMyJoinState == 3 then
              isMyChannelState = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_FINISH")
            end
          end
        end
      end
      ;
      (self._btnInmy):SetFontColor(UI_color.C_FF00C0D7)
      ;
      (self._btnInmy):SetText(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_OPENWAR_INMYCHANNEL", "inMyChannelName", inMyChannelName, "inMyJoinCount", inMyJoinCount, "isMyChannelState", isMyChannelState))
      ;
      (self._btnInmy):SetEnable(true)
      ;
      (self._btnInmy):addInputEvent("Mouse_LUp", "HandleClicked_InMyChannelJoin()")
    end
    do
      ;
      (UIScroll.SetButtonSize)(self._scroll, self._createListCount, localWarServerCountLimit)
    end
  end
end

FGlobal_LocalWarInfo_Open = function()
  -- function num : 0_4 , upvalues : localWarInfo
  local self = localWarInfo
  ToClient_RequestLocalwarStatus()
  if Panel_LocalWarInfo:GetShow() then
    Panel_LocalWarInfo:SetShow(false, true)
  else
    Panel_LocalWarInfo:SetShow(true, true)
  end
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
  self._startIndex = 0
  ;
  (self._scroll):SetControlTop()
  self:Update()
end

FGlobal_LocalWarInfo_Close = function()
  -- function num : 0_5 , upvalues : localWarInfo
  local self = localWarInfo
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
  Panel_LocalWarInfo:SetShow(false, true)
  TooltipSimple_Hide()
end

FGlobal_LocalWarInfo_GetOut = function()
  -- function num : 0_6
  if IsSelfPlayerWaitAction() then
    ToClient_UnJoinLocalWar()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_WAITPOSITION_POSSIBLE"))
  end
end

LocalWarInfo_Repos = function()
  -- function num : 0_7 , upvalues : localWarInfo
  local self = localWarInfo
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_LocalWarInfo:SetPosX((screenSizeX - Panel_LocalWarInfo:GetSizeX()) / 2)
  Panel_LocalWarInfo:SetPosY((screenSizeY - Panel_LocalWarInfo:GetSizeY()) / 2)
  Panel_LocalWarInfo:ComputePos()
  ;
  (self._blackBG):SetSize(getScreenSizeX() + 250, getScreenSizeY() + 250)
  ;
  (self._blackBG):SetHorizonCenter()
  ;
  (self._blackBG):SetVerticalMiddle()
end

LocalWarInfo_ScrollEvent = function(isScrollUp)
  -- function num : 0_8 , upvalues : localWarInfo, localWarServerCountLimit
  local self = localWarInfo
  local localWarServerCount = ToClient_GetLocalwarStatusCount()
  if localWarServerCount > 6 then
    localWarServerCountLimit = 6
  else
    localWarServerCountLimit = ToClient_GetLocalwarStatusCount()
  end
  self._startIndex = (UIScroll.ScrollEvent)(self._scroll, isScrollUp, self._createListCount, localWarServerCountLimit, self._startIndex, 1)
  self:Update()
end

LocalWawrInfo_ClickedJoinLocalWar = function(index, isLimitLocalWar)
  -- function num : 0_9
  local curChannelData = getCurrentChannelServerData()
  local getLevel = ((getSelfPlayer()):get()):getLevel()
  if curChannelData == nil then
    return 
  end
  local litmitLevel = ToClient_GetLevelForLimitedLocalWar()
  local limitAttack = ToClient_GetAttackForLimitedLocalWar()
  local limitDefence = ToClient_GetDefenseForLimitedLocalWar()
  local limitADSum = ToClient_GetADSummaryForLimitedLocalWar()
  local isMineADSum = getOffence() + getDefence()
  if not isLimitLocalWar and getLevel < 50 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LEVELLIMIT"))
    return 
  end
  if isLimitLocalWar then
    if litmitLevel <= getLevel then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LEVEL_LIMIT"))
    else
      if limitAttack <= getOffence() then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_ATTACK_LIMIT"))
      else
        if limitDefence <= getDefence() then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_DEFENCE_LIMIT"))
        else
          if limitADSum <= isMineADSum then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_ADSUM_LIMIT"))
          end
        end
      end
    end
  end
  local localWarStatusData = ToClient_GetLocalwarStatusData(index)
  local getServerNo = localWarStatusData:getServerNo()
  local channelName = getChannelName(curChannelData._worldNo, getServerNo)
  local isGameMaster = ToClient_SelfPlayerIsGM()
  local channelMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CHANNELMOVE", "channelName", channelName)
  local tempChannel = getGameChannelServerDataByWorldNo(curChannelData._worldNo, index)
  local joinLocalWar = function()
    -- function num : 0_9_0 , upvalues : isGameMaster, getServerNo, curChannelData
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
    if IsSelfPlayerWaitAction() then
      if hp == maxHp or isGameMaster then
        if getServerNo == curChannelData._serverNo then
          ToClient_JoinLocalWar()
        else
          ToClient_RequestLocalwarJoinToAnotherChannel(getServerNo)
        end
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_MAXHP_CHECK"))
      end
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_LOCALWARINFO"))
    end
  end

  if getServerNo == curChannelData._serverNo then
    channelMemo = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CURRENTCHANNELJOIN")
  else
    channelMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_CHANNELMOVE", "channelName", channelName)
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
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHANNELMOVE_TITLE_MSG"), content = channelMemo, functionYes = joinLocalWar, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    end
  end
end

FromClient_UpdateLocalWarStatus = function()
  -- function num : 0_10 , upvalues : localWarInfo
  local self = localWarInfo
  self:Update()
end

HandleClicked_InMyChannelJoin = function()
  -- function num : 0_11
  local playerWrapper = getSelfPlayer()
  local player = playerWrapper:get()
  local hp = player:getHp()
  local maxHp = player:getMaxHp()
  local isGameMaster = ToClient_SelfPlayerIsGM()
  if hp == maxHp or isGameMaster then
    ToClient_JoinLocalWar()
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_MAXHP_CHECK"))
  end
end

LocalWarInfo_SimpleTooltip = function(isShow, tipType)
  -- function num : 0_12 , upvalues : localWarInfo
  local self = localWarInfo
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LIMIT_TOOLTIP_LEVEL_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LIMIT_TOOLTIP_LEVEL_DESC")
    control = self._icon_Level
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LIMIT_TOOLTIP_AP_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LIMIT_TOOLTIP_AP_DESC")
      control = self._icon_AP
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LIMIT_TOOLTIP_DP_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LIMIT_TOOLTIP_DP_DESC")
        control = self._icon_DP
      else
        if tipType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LIMIT_TOOLTIP_ADSUM_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWARINFO_LIMIT_TOOLTIP_ADSUM_DESC")
          control = self._icon_AD
        end
      end
    end
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

LocalWarInfo_RegistEventHandler = function()
  -- function num : 0_13 , upvalues : localWarInfo
  local self = localWarInfo
  ;
  (self._btnClose):addInputEvent("Mouse_LUp", "FGlobal_LocalWarInfo_Close()")
  ;
  (self._listBg):addInputEvent("Mouse_UpScroll", "LocalWarInfo_ScrollEvent( true )")
  ;
  (self._listBg):addInputEvent("Mouse_DownScroll", "LocalWarInfo_ScrollEvent( false )")
  ;
  (self._desc_Rule_Title):addInputEvent("Mouse_LUp", "LocalWarInfo_DescriptionCheck(0)")
  ;
  (self._desc_Reward_Title):addInputEvent("Mouse_LUp", "LocalWarInfo_DescriptionCheck(1)")
  ;
  (self._desc_Explanation_Title):addInputEvent("Mouse_LUp", "LocalWarInfo_DescriptionCheck(2)")
  ;
  (UIScroll.InputEvent)(self._scroll, "LocalWarInfo_ScrollEvent")
  ;
  (localWarInfo._btnHelp):SetShow(false)
end

LocalWarInfo_DescriptionCheck = function(descType)
  -- function num : 0_14 , upvalues : localWarInfo
  local self = localWarInfo
  if descType == 0 then
    self._openDesc = descType
    ;
    (self._desc_rule):SetShow(true)
  else
    if descType == 1 then
      self._openDesc = descType
      ;
      (self._desc_Reward):SetShow(true)
    else
      if descType == 2 then
        self._openDesc = descType
        ;
        (self._desc_Explanation):SetShow(true)
      else
        self._openDesc = -1
      end
    end
  end
end

local rule_ani_SpeedTime = 5
local _desc_Rule_TitleSize = 0
LocalWarInfo_InformationOpen = function(deltaTime)
  -- function num : 0_15 , upvalues : localWarInfo, rule_ani_SpeedTime
  local self = localWarInfo
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

LocalWarInfo_RegistMessageHandler = function()
  -- function num : 0_16
  registerEvent("onScreenResize", "LocalWarInfo_Repos")
  registerEvent("FromClient_UpdateLocalWarStatus", "FromClient_UpdateLocalWarStatus")
  Panel_LocalWarInfo:RegisterUpdateFunc("LocalWarInfo_InformationOpen")
end

LocalWarInfo_Initionalize()
LocalWarInfo_RegistEventHandler()
LocalWarInfo_RegistMessageHandler()

