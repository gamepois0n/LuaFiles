-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\frame_guild_quest_sub.luac 

-- params : ...
-- function num : 0
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
Panel_Current_Guild_Quest:SetShow(false)
Panel_Current_Guild_Quest:SetIgnore(false)
GuildProgressQuestInfoPage = {_txtQuestTitle, _txtQuestLimitTime, _btnQuestNavi, _btnQuestGiveup, _btnQuestReward, _questBG; _firstUpdate = true, _currentTime = 0, _RewardPosX = 0, _btnQuestNaviOriginPosX = 0, _btnQuestGiveupOriginPosX = 0, _btnQuestRewardOriginPosX = 0, 
_txtQuestCondition = {}
}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R3 in 'UnsetPending'

GuildProgressQuestInfoPage.initialize = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  self._txtQuestTitle = (UI.getChildControl)(Panel_Current_Guild_Quest, "StaticText_Title")
  self._txtQuestLimitTime = (UI.getChildControl)(Panel_Current_Guild_Quest, "StaticText_LimitTime")
  self._btnQuestNavi = (UI.getChildControl)(Panel_Current_Guild_Quest, "Checkbox_Quest_Navi")
  self._btnQuestGiveup = (UI.getChildControl)(Panel_Current_Guild_Quest, "Checkbox_Quest_Giveup")
  self._btnQuestReward = (UI.getChildControl)(Panel_Current_Guild_Quest, "Checkbox_Quest_Reward")
  self._questBG = (UI.getChildControl)(Panel_Current_Guild_Quest, "Static_BG")
  ;
  (self._questBG):SetShow(false)
  for index = 0, 4 do
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R5 in 'UnsetPending'

    (self._txtQuestCondition)[index] = (UI.getChildControl)(Panel_Current_Guild_Quest, "StaticText_Condition" .. tostring(index + 1))
    ;
    ((self._txtQuestCondition)[index]):SetShow(false)
    ;
    ((self._txtQuestCondition)[index]):SetAutoResize(true)
    ;
    ((self._txtQuestCondition)[index]):SetIgnore(true)
    ;
    ((self._txtQuestCondition)[index]):SetTextMode(UI_TM.eTextMode_AutoWrap)
  end
  ;
  (self._txtQuestTitle):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (self._txtQuestTitle):SetSize((self._txtQuestTitle):GetSizeX() + 50, (self._txtQuestTitle):GetSizeY())
  self._btnQuestNaviOriginPosX = (self._btnQuestNavi):GetPosX() - 120
  self._btnQuestGiveupOriginPosX = (self._btnQuestGiveup):GetPosX() - 120
  self._btnQuestRewardOriginPosX = (self._btnQuestReward):GetPosX() - 120
  ;
  (self._btnQuestGiveup):addInputEvent("Mouse_LUp", "HandleCliekedQuestGiveup()")
  ;
  (self._btnQuestReward):addInputEvent("Mouse_LUp", "HandleCliekedGuildQuestReward()")
  ;
  (self._btnQuestGiveup):addInputEvent("Mouse_On", "questGiveUp_Over(true)")
  ;
  (self._btnQuestReward):addInputEvent("Mouse_On", "QuestReward_Over(true)")
  ;
  (self._btnQuestGiveup):addInputEvent("Mouse_Out", "questGiveUp_Over(false)")
  ;
  (self._btnQuestReward):addInputEvent("Mouse_Out", "QuestReward_Over(false)")
end

HandleCliekedQuestGiveup = function()
  -- function num : 0_1 , upvalues : UI_PP
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_GIVERUP_MESSAGE_0"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_GIVERUP_MESSAGE_1"), functionYes = ToClient_RequestGuildQuestGiveup, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

local _saveGuildTitle = ""
FGlobal_getCompleteGuildTitle = function()
  -- function num : 0_2 , upvalues : _saveGuildTitle
  return _saveGuildTitle
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R4 in 'UnsetPending'

GuildProgressQuestInfoPage.UpdateData = function(self)
  -- function num : 0_3 , upvalues : _saveGuildTitle, UI_color
  local boolProgressing = ToClient_isProgressingGuildQuest()
  if boolProgressing == true then
    if Panel_Npc_Dialog:IsShow() == false and Panel_CheckedQuest:IsShow() == true then
      Panel_Current_Guild_Quest:SetShow(true)
    end
    for index = 0, 4 do
      ((self._txtQuestCondition)[index]):SetShow(false)
      ;
      ((self._txtQuestCondition)[index]):SetText("")
    end
    local stringLen = (string.len)(ToClient_getCurrentGuildQuestName())
    local guildQuestTitle = ToClient_getCurrentGuildQuestName()
    _saveGuildTitle = guildQuestTitle
    ;
    (self._txtQuestTitle):SetText(guildQuestTitle)
    local remainTime = ToClient_getCurrentGuildQuestRemainedTime()
    local strMinute = (math.floor)(remainTime / 60)
    if remainTime <= 0 then
      (self._txtQuestLimitTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_TIMEOUT"))
    else
      ;
      (self._txtQuestLimitTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_REMAINTIME", "time_minute", strMinute))
    end
    local passValue = (self._txtQuestLimitTime):GetText()
    ;
    (GuildQuestInfoPage._txtProgressLimitTime):SetText(passValue)
    if stringLen > 37 then
      stringLen = 37
    end
    ;
    (self._btnQuestNavi):SetPosX(self._btnQuestNaviOriginPosX + stringLen * 4.5)
    ;
    (self._btnQuestGiveup):SetPosX(self._btnQuestGiveupOriginPosX + stringLen * 4.5)
    ;
    (self._btnQuestReward):SetPosX(self._btnQuestRewardOriginPosX + stringLen * 4.5)
    self._RewardPosX = (self._btnQuestReward):GetPosX()
    local questConditionCount = ToClient_getCurrentGuildQuestConditionCount()
    local questConditionDefaultPosY = 40
    for index = 0, 4 do
      if index < questConditionCount then
        local currentGuildQuestInfo = ToClient_getCurrentGuildQuestConditionAt(index)
        ;
        ((self._txtQuestCondition)[index]):SetShow(true)
        ;
        ((self._txtQuestCondition)[index]):SetText("- " .. currentGuildQuestInfo._desc .. " ( " .. currentGuildQuestInfo._currentCount .. " / " .. currentGuildQuestInfo._destCount .. " ) ")
        local conditonPosY = 0
        if index == 0 then
          conditonPosY = questConditionDefaultPosY + index * ((self._txtQuestCondition)[index]):GetTextSizeY()
        else
          conditonPosY = questConditionDefaultPosY + index * ((self._txtQuestCondition)[index - 1]):GetTextSizeY()
        end
        ;
        ((self._txtQuestCondition)[index]):SetPosY(conditonPosY)
        if currentGuildQuestInfo._currentCount == currentGuildQuestInfo._destCount then
          ((self._txtQuestCondition)[index]):SetFontColor(UI_color.C_FF626262)
        else
          ;
          ((self._txtQuestCondition)[index]):SetFontColor(UI_color.C_FFC4BEBE)
        end
      end
    end
    ;
    (self._txtQuestTitle):SetShow(true)
    ;
    (self._txtQuestLimitTime):SetShow(true)
    ;
    (self._btnQuestNavi):SetShow(false)
    if ((getSelfPlayer()):get()):isGuildMaster() == true then
      (self._btnQuestGiveup):SetShow(true)
      ;
      (self._btnQuestReward):SetPosX(self._RewardPosX)
    else
      ;
      (self._btnQuestGiveup):SetShow(false)
      ;
      (self._btnQuestReward):SetPosX((self._btnQuestGiveup):GetPosX())
    end
    if ToClient_getCurrentGuildQuestBaseRewardCount() <= 0 and ToClient_getCurrentGuildQuestSelectRewardCount() <= 0 then
      (self._btnQuestReward):SetShow(false)
    else
      ;
      (self._btnQuestReward):SetShow(true)
    end
    local guildQuestSizeY = 0
    guildQuestSizeY = ((self._txtQuestCondition)[questConditionCount - 1]):GetPosY() + ((self._txtQuestCondition)[questConditionCount - 1]):GetSizeY() + 10
    Panel_Current_Guild_Quest:SetSize(Panel_Current_Guild_Quest:GetSizeX(), guildQuestSizeY)
    ;
    (self._questBG):SetSize(Panel_Current_Guild_Quest:GetSizeX(), Panel_Current_Guild_Quest:GetSizeY())
  else
    do
      Panel_Current_Guild_Quest:SetShow(false)
    end
  end
end

FGlobal_QuestConditionUpdateEffect = function(index)
  -- function num : 0_4
end

FGlobal_CurrentGuildQuestShow = function()
  -- function num : 0_5
  if Panel_Current_Guild_Quest:GetShow() == false and ToClient_isProgressingGuildQuest() == true then
    Panel_Current_Guild_Quest:SetShow(true)
  end
end

FGlobal_CurrentGuildQuestHide = function()
  -- function num : 0_6
  if Panel_Current_Guild_Quest:GetShow() == true then
    Panel_Current_Guild_Quest:SetShow(false)
  end
end

GuildQuest_Update = function()
  -- function num : 0_7
  GuildProgressQuestInfoPage:UpdateData()
end

guildQuestWidget_MouseOn = function(isShow)
  -- function num : 0_8
  local self = GuildProgressQuestInfoPage
  if isShow == true then
    (QuestInfoData.guildQuestDescShowWindow)()
    ;
    (self._questBG):SetShow(true)
  else
    ;
    (QuestInfoData.questDescHideWindow)()
    ;
    (self._questBG):SetShow(false)
  end
end

Panel_Current_Guild_Quest:addInputEvent("Mouse_On", "guildQuestWidget_MouseOn( true )")
Panel_Current_Guild_Quest:addInputEvent("Mouse_Out", "guildQuestWidget_MouseOn( false )")
registerEvent("FromClient_UpdateProgressGuildQuestList", "GuildQuest_Update")

