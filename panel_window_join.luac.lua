-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\join\panel_window_join.luac 

-- params : ...
-- function num : 0
local UIMode = Defines.UIMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Panel_Join:SetShow(false, false)
Panel_Join:setMaskingChild(true)
Panel_Join:ActiveMouseEventEffect(true)
Panel_Join:setGlassBackground(true)
Panel_Join:RegisterShowEventFunc(true, "Panel_Join_ShowAni()")
Panel_Join:RegisterShowEventFunc(false, "Panel_Join_HideAni()")
Panel_Join_ShowAni = function()
  -- function num : 0_0
end

Panel_Join_HideAni = function()
  -- function num : 0_1
end

local join = {
radioBtn = {[0] = (UI.getChildControl)(Panel_Join, "RadioButton_LocalWar"), [1] = (UI.getChildControl)(Panel_Join, "RadioButton_Colosseum")}
, _index = 0, _conditionCheck = true, _mainBg = (UI.getChildControl)(Panel_Join, "Static_BG"), _title = (UI.getChildControl)(Panel_Join, "StaticText_ContentTitle"), _titleBg = (UI.getChildControl)(Panel_Join, "Static_BG_1"), _headIcon = (UI.getChildControl)(Panel_Join, "Static_HeadIcon"), _myRank = (UI.getChildControl)(Panel_Join, "StaticText_MyRank"), _myPoint = (UI.getChildControl)(Panel_Join, "StaticText_MyPoint"), _condition = (UI.getChildControl)(Panel_Join, "StaticText_Condition"), _ruleTitle = (UI.getChildControl)(Panel_Join, "StaticText_RuleTitle"), _ruleBg = (UI.getChildControl)(Panel_Join, "Static_BG_2"), _ruleContent = (UI.getChildControl)(Panel_Join, "StaticText_RuleContent"), _rewardTitle = (UI.getChildControl)(Panel_Join, "StaticText_RewardTitle"), _rewardBg = (UI.getChildControl)(Panel_Join, "Static_BG_3"), _rewardContent = (UI.getChildControl)(Panel_Join, "StaticText_RewardContent"), btn_Join = (UI.getChildControl)(Panel_Join, "Button_Join"), btn_Rank = (UI.getChildControl)(Panel_Join, "Button_Rank"), btn_Close = (UI.getChildControl)(Panel_Join, "Button_Close")}
;
(join._ruleContent):SetTextMode(UI_TM.eTextMode_AutoWrap)
;
(join._rewardContent):SetTextMode(UI_TM.eTextMode_AutoWrap)
local localWar = {_title = PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_TITLE"), _condition = PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_CONDITION"), _iconTextureUrl = "New_UI_Common_ForLua/Window/Join/localwar.dds", 
_rule = {PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_RULE1"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_RULE2"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_RULE3"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_RULE4"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_RULE5"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_RULE6"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_RULE7"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_RULE8"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_RULE10"); [0] = "체크�\169 더미"}
, 
_reward = {PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_REWARD1"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_REWARD_3"); [0] = "체크�\169 더미"}
}
local colosseum = {_title = PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_COLOSSEUM_TITLE"), _condition = PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_COLOSSEUM_CONDITION"), _iconTextureUrl = "New_UI_Common_ForLua/Window/Join/colosseum.dds", 
_rule = {PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_COLOSSEUM_RULE_1"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_COLOSSEUM_RULE_2"), PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_COLOSSEUM_RULE_3"); [0] = "체크�\169 더미"}
, 
_reward = {PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_COLOSSEUM_REWARD_1"); [0] = "체크�\169 더미"}
}
Panel_Join_Init = function()
  -- function num : 0_2 , upvalues : join
  for index,value in pairs(join.radioBtn) do
    value:SetCheck(false)
  end
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  join._index = 0
  ;
  ((join.radioBtn)[join._index]):SetCheck(true)
end

Panel_Join_Update = function(index)
  -- function num : 0_3 , upvalues : join, localWar, colosseum
  if index == nil then
    index = join._index
  else
    -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

    join._index = index
  end
  local self = nil
  if index == 0 then
    self = localWar
  else
    if index == 1 then
      self = colosseum
    else
      self = localWar
    end
  end
  ;
  (join._title):SetText(self._title)
  ;
  (join._condition):SetText(self._condition)
  ;
  (join._headIcon):ChangeTextureInfoName(self._iconTextureUrl)
  MyRankRangeAndPoint(index)
  do
    if index == 0 and ToClient_GetMyTeamNoLocalWar() > 0 then
      local teamName = nil
      if ToClient_GetMyTeamNoLocalWar() == 1 then
        teamName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_TITLE_1", "title", self._title)
      else
        teamName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_TITLE_2", "title", self._title)
      end
      ;
      (join._title):SetText(teamName)
    end
    local ruleCount = #self._rule
    local rewardCount = #self._reward
    local posY = (join._titleBg):GetPosY() + (join._titleBg):GetSizeY()
    local gapY = 5
    local textSizeY = 20
    if ruleCount > 0 then
      (join._ruleTitle):SetShow(true)
      ;
      (join._ruleBg):SetShow(true)
      ;
      (join._ruleContent):SetShow(true)
      local content = ""
      for i = 1, ruleCount do
        if i == 1 then
          content = (self._rule)[i]
        else
          content = content .. "\n" .. (self._rule)[i]
        end
      end
      ;
      (join._ruleContent):SetText(content)
      ;
      (join._ruleBg):SetSize((join._ruleBg):GetSizeX(), (join._ruleContent):GetTextSizeY() + gapY * 2)
      posY = (join._ruleBg):GetPosY() + (join._ruleBg):GetSizeY() + gapY * 2
    else
      do
        ;
        (join._ruleTitle):SetShow(false)
        ;
        (join._ruleBg):SetShow(false)
        ;
        (join._ruleContent):SetShow(false)
        posY = posY + gapY * 2
        if rewardCount > 0 then
          (join._rewardTitle):SetShow(true)
          ;
          (join._rewardBg):SetShow(true)
          ;
          (join._rewardContent):SetShow(true)
          ;
          (join._rewardTitle):SetPosY(posY)
          posY = posY + (join._rewardTitle):GetTextSizeY() + gapY
          ;
          (join._rewardBg):SetPosY(posY)
          posY = posY + gapY
          ;
          (join._rewardContent):SetPosY(posY)
          local content = ""
          for i = 1, rewardCount do
            if i == 1 then
              content = (self._reward)[i]
            else
              content = content .. "\n" .. (self._reward)[i]
            end
          end
          ;
          (join._rewardContent):SetText(content)
          ;
          (join._rewardBg):SetSize((join._rewardBg):GetSizeX(), (join._rewardContent):GetTextSizeY() + gapY * 2)
          posY = (join._rewardBg):GetPosY() + (join._rewardBg):GetSizeY() + gapY
        else
          do
            ;
            (join._rewardTitle):SetShow(false)
            ;
            (join._rewardBg):SetShow(false)
            ;
            (join._rewardContent):SetShow(false)
            if index == 0 then
              if ToClient_GetMyTeamNoLocalWar() == 0 then
                (join.btn_Join):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_ADMIN_1"))
              else
                ;
                (join.btn_Join):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_CANCEL_1"))
              end
            else
              if index == 1 then
                if ToClient_IsRequestedPvP() then
                  (join.btn_Join):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_ADMIN_2"))
                else
                  ;
                  (join.btn_Join):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_CANCEL_2"))
                end
              end
            end
            ;
            (join._mainBg):SetSize((join._mainBg):GetSizeX(), posY - (join._mainBg):GetPosY())
            Panel_Join:SetSize(Panel_Join:GetSizeX(), (join._mainBg):GetSizeY() + 125)
            ;
            (join.btn_Join):ComputePos()
            ;
            (join.btn_Rank):ComputePos()
          end
        end
      end
    end
  end
end

MyRankRangeAndPoint = function(index)
  -- function num : 0_4 , upvalues : localWar, colosseum, join
  local self = nil
  if index == 0 then
    self = localWar
  else
    if index == 1 then
      self = colosseum
    else
      self = localWar
    end
  end
  local myRank, myPoint, myRankRate, rankGrade = nil, nil, nil, nil
  if index == 1 then
    myRank = ToClient_GetMyMatchRank(0)
    local servnerUserCnt = ToClient_GetMatchRankerUserCount(0)
    myRankRate = tonumber(myRank / servnerUserCnt * 100)
    myPoint = ToClient_GetMyMatchPoint(0)
  else
    do
      if index == 0 then
        myRank = ToClient_GetContentsMyRank(2)
        local servnerUserCnt = ToClient_GetContentsRankUserCount(2)
        myRankRate = tonumber(myRank / servnerUserCnt * 100)
        myPoint = ToClient_GetMyAccumulatedKillCount()
      end
      do
        ;
        (join._myPoint):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_JOIN_MYPOINT", "point", myPoint))
        if myPoint == 0 then
          (join._myRank):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_RANK_NONE"))
        else
          if myRank <= 30 then
            (join._myRank):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_JOIN_MYRANK", "rank", myRank))
          else
            if myRankRate >= 0 and myRankRate <= 20 then
              rankGrade = "A"
            else
              if myRankRate > 20 and myRankRate <= 40 then
                rankGrade = "B"
              else
                if myRankRate > 40 and myRankRate <= 60 then
                  rankGrade = "C"
                else
                  if myRankRate > 60 and myRankRate <= 80 then
                    rankGrade = "D"
                  else
                    if myRankRate > 80 and myRankRate <= 100 then
                      rankGrade = "E"
                    end
                  end
                end
              end
            end
            ;
            (join._myRank):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_JOIN_GRADE", "grade", rankGrade))
          end
        end
      end
    end
  end
end

Join_SelectTap = function(index)
  -- function num : 0_5 , upvalues : join
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  join._index = index
  Panel_Join_Update(index)
end

RankWindow_Show = function()
  -- function num : 0_6 , upvalues : join
  for idx,value in pairs(join.radioBtn) do
    if ((join.radioBtn)[idx]):IsCheck() then
      Panel_Join_Close()
      FGlobal_LifeRanking_Show(idx)
      break
    end
  end
end

Content_Join = function()
  -- function num : 0_7 , upvalues : join
  for idx,value in pairs(join.radioBtn) do
    if ((join.radioBtn)[idx]):IsCheck() then
      if idx == 0 then
        local partyMemberCount = RequestParty_getPartyMemberCount()
        -- DECOMPILER ERROR at PC22: Confused about usage of register: R6 in 'UnsetPending'

        if partyMemberCount > 0 then
          join._conditionCheck = Panel_Join_PartyMasterCheck(partyMemberCount)
          if join._conditionCheck then
            for index = 0, partyMemberCount - 1 do
              local memberData = RequestParty_getPartyMemberAt(index)
              local memberLv = memberData._level
              if memberLv < 50 then
                Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_MESSAGE_1"))
                return 
              end
            end
          end
        else
          do
            -- DECOMPILER ERROR at PC48: Confused about usage of register: R6 in 'UnsetPending'

            join._conditionCheck = true
            if join._conditionCheck then
              if ToClient_GetMyTeamNoLocalWar() == 0 then
                ToClient_JoinLocalWar()
                break
              end
              local pcPosition = ((getSelfPlayer()):get()):getPosition()
              do
                do
                  do
                    local regionInfo = getRegionInfoByPosition(pcPosition)
                    ToClient_UnJoinLocalWar()
                    do break end
                    if ToClient_GetMyTeamNoLocalWar() == 0 then
                      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_MESSAGE_3"))
                      break
                    end
                    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_MESSAGE_4"))
                    do break end
                    if idx == 1 then
                      if ToClient_GetMyTeamNoLocalWar() == 0 then
                        if ToClient_IsRequestedPvP() then
                          ToClient_UnRequestMatchInfo()
                          break
                        end
                        HandleClicked_RegisterMatch()
                        break
                      end
                      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_MESSAGE_5"))
                    end
                    do break end
                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC116: LeaveBlock: unexpected jumping out IF_STMT

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

Panel_Join_PartyMasterCheck = function(count)
  -- function num : 0_8
  local isSelfMaster = false
  for index = 0, count - 1 do
    local memberData = RequestParty_getPartyMemberAt(index)
    local isMaster = memberData._isMaster
    if RequestParty_isSelfPlayer(index) and isMaster then
      isSelfMaster = true
      break
    end
  end
  do
    return isSelfMaster
  end
end

FromClient_JoinLocalWar = function(teamNo)
  -- function num : 0_9
  local teamName = nil
  if teamNo == 1 then
    teamName = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_BELONG_1")
  else
    teamName = PAGetString(Defines.StringSheet_GAME, "LUA_LOCALWAR_BELONG_2")
  end
  local msg, showRate, msgType = {main, sub; addMsg = ""}, 3, 34
  msg.main = PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_WELCOME_1")
  msg.sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_WELCOME_2", "team", teamName)
  Proc_ShowMessage_Ack_For_RewardSelect(msg, showRate, msgType)
  if Panel_Npc_Dialog:GetShow() then
    Panel_Join_Close()
  else
    FGlobal_NewLocalWar_Show()
  end
end

FromClient_UnJoinLocalWar = function(unJoinType)
  -- function num : 0_10
  local msg, showRate, msgType = {main = PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_LEAVEMSG_1"), sub = "", addMsg = ""}, 3, 35
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R4 in 'UnsetPending'

  if unJoinType == 1 then
    main.sub = PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_LEAVEMSG_2")
  else
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R4 in 'UnsetPending'

    if unJoinType == 2 then
      main.sub = PAGetString(Defines.StringSheet_GAME, "LUA_JOIN_LOCALWAR_LEAVEMSG_3")
    end
  end
  Proc_ShowMessage_Ack_For_RewardSelect(msg, showRate, msgType)
  if Panel_Npc_Dialog:GetShow() then
    Panel_Join_Close()
  else
    NewLocalWar_Hide()
  end
end

Panel_Join_Show = function()
  -- function num : 0_11 , upvalues : join
  local self = join
  if Panel_Window_Enchant:GetShow() then
    PaGlobal_Enchant:enchantClose()
  else
    if Panel_Window_Socket:GetShow() then
      Socket_WindowClose()
      ToClient_BlackspiritEnchantClose()
    end
  end
  local isSiegeChannel = ToClient_isSiegeChannel()
  FGlobal_LifeRanking_Close()
  SkillAwaken_Close()
  if not Panel_Join:GetShow() then
    Panel_Join:SetShow(true)
    Panel_Join_Repos()
  end
  if isSiegeChannel then
    (self.btn_Join):SetIgnore(true)
    ;
    (self.btn_Join):SetMonoTone(true)
  else
    ;
    (self.btn_Join):SetIgnore(false)
    ;
    (self.btn_Join):SetMonoTone(false)
  end
  Panel_Join_Init()
  Panel_Join_Update()
end

Panel_Join_Close = function()
  -- function num : 0_12
  if Panel_Join:GetShow() then
    Panel_Join:SetShow(false)
  end
end

Panel_Join_Repos = function()
  -- function num : 0_13
  Panel_Join:SetPosX(getScreenSizeX() / 2 + Panel_Join:GetSizeX())
  Panel_Join:SetPosY(getScreenSizeY() / 2 - Panel_Join:GetSizeY() * 2 / 3 - 50)
end

Panel_Join_RegisterEvent = function()
  -- function num : 0_14 , upvalues : join
  (join.btn_Close):addInputEvent("Mouse_LUp", "Panel_Join_Close()")
  ;
  (join.btn_Join):addInputEvent("Mouse_LUp", "Content_Join()")
  ;
  (join.btn_Rank):addInputEvent("Mouse_LUp", "RankWindow_Show()")
  for idx,value in pairs(join.radioBtn) do
    ((join.radioBtn)[idx]):addInputEvent("Mouse_LUp", "Join_SelectTap( " .. idx .. " )")
  end
  registerEvent("FromClient_JoinLocalWar", "FromClient_JoinLocalWar")
  registerEvent("FromClient_UnJoinLocalWar", "FromClient_UnJoinLocalWar")
end

Join_Simpletooltips = function(isShow, index)
  -- function num : 0_15 , upvalues : join
  local name, desc, uiControl = nil
  if isShow then
    if index == 0 then
      name = "붉은 전장"
      desc = ""
      uiControl = (join.radioBtn)[index]
    else
      if index == 1 then
        name = "결투�\165"
        desc = ""
        uiControl = (join.radioBtn)[index]
      end
    end
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

Panel_Join_RegisterEvent()

