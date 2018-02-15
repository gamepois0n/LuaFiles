-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\liferanking\panel_liferanking_renewal.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_LifeRanking:SetShow(false, false)
Panel_LifeRanking:RegisterShowEventFunc(true, "LifeRankingShowAni()")
Panel_LifeRanking:RegisterShowEventFunc(false, "LifeRankingHideAni()")
LifeRankingShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_LifeRanking)
  local aniInfo1 = Panel_LifeRanking:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.2)
  aniInfo1.AxisX = Panel_LifeRanking:GetSizeX() / 2
  aniInfo1.AxisY = Panel_LifeRanking:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_LifeRanking:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.2)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_LifeRanking:GetSizeX() / 2
  aniInfo2.AxisY = Panel_LifeRanking:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

LifeRankingHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo1 = Panel_LifeRanking:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

PaGlobal_LifeRanking = {
_ui = {_txtTitle = (UI.getChildControl)(Panel_LifeRanking, "StaticText_Title"), _btnClose = (UI.getChildControl)(Panel_LifeRanking, "Button_Win_Close"), _btnHelp = (UI.getChildControl)(Panel_LifeRanking, "Button_Question"), _scroll = (UI.getChildControl)(Panel_LifeRanking, "Scroll_RankingList"), _listBg = (UI.getChildControl)(Panel_LifeRanking, "Static_BG"), _myRanking = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyRanking"), _inMyRankRate = (UI.getChildControl)(Panel_LifeRanking, "Slider_InMyRank"), firstRanker = (UI.getChildControl)(Panel_LifeRanking, "StaticText_Rank_First"), firstRankerName = (UI.getChildControl)(Panel_LifeRanking, "StaticText_FirstCharacterName"), firstRankerGuild = (UI.getChildControl)(Panel_LifeRanking, "StaticText_FirstGuildName"), secondRanker = (UI.getChildControl)(Panel_LifeRanking, "StaticText_Rank_Second"), secondRankerName = (UI.getChildControl)(Panel_LifeRanking, "StaticText_SecondCharacterName"), secondRankerGuild = (UI.getChildControl)(Panel_LifeRanking, "StaticText_SecondGuildName"), thirdRanker = (UI.getChildControl)(Panel_LifeRanking, "StaticText_Rank_Third"), thirdRankerName = (UI.getChildControl)(Panel_LifeRanking, "StaticText_ThirdCharacterName"), thirdRankerGuild = (UI.getChildControl)(Panel_LifeRanking, "StaticText_ThirdGuildName"), 
_topGrade = {(UI.getChildControl)(Panel_LifeRanking, "StaticText_Grade_First"), (UI.getChildControl)(Panel_LifeRanking, "StaticText_Grade_Second"), (UI.getChildControl)(Panel_LifeRanking, "StaticText_Grade_Third")}
, 
_tab = {[0] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Gathering"), [1] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Fishing"), [2] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Hunting"), [3] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Cook"), [4] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Alchemy"), [5] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Manufacture"), [6] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Mating"), [7] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Trade"), [8] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Growth"), [9] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Sail"), [10] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Wealth"), [11] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Combat"), [12] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_LocalWar"), [13] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Rally")}
, 
_tabName = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_GATHER"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_FISH"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_HUNT"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_COOK"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_ALCHEMY"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_MANUFACTURE"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_HORSE"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_TRADE"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_GROWTH"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYCOMBAT_TAB_SAIL"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_WEALTH"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_COMBAT"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_LOCALWAR"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYCOMBAT_NAK_PVPMATCH_NAME")}
, 
_tabMyRank = {[0] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Gathering"), [1] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Fishing"), [2] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Hunting"), [3] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Cook"), [4] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Alchemy"), [5] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Manufacture"), [6] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Mating"), [7] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Trade"), [8] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Growth"), [9] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Sail"), [10] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Wealth"), [11] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Combat"), [12] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_LocalWar"), [13] = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyALLRanking_Text_Rally")}
, 
_tooltip = {_bg = (UI.getChildControl)(Panel_LifeRanking, "Static_TooltipBG"), _name = (UI.getChildControl)(Panel_LifeRanking, "Tooltip_Name"), _desc = (UI.getChildControl)(Panel_LifeRanking, "Tooltip_Description")}
}
, _react = false, _createTabCount = 14, _createListCount = 30, _listCount = 0, _startIndex = 0, _selectedTabIdx = 0, 
_listPool = {}
, 
_rankerData = {}
, 
_posConfig = {_tabStartPosX = 14, _tabPosXGap = 100, _listStartPosY = 265, _listPosYGap = 15.5}
, _serverChange = true, 
_listUpdate = {[0] = false, [1] = false, [2] = false, [3] = false, [4] = false, [5] = false, [6] = false, [7] = false, [8] = false, [9] = false, [10] = false, [11] = false, [12] = false, [13] = false}
}
local rankingTabId = {tab_Gathering = 0, tab_Fishing = 1, tab_Hunting = 2, tab_Cook = 3, tab_Alchemy = 4, tab_Manufacture = 5, tab_Mating = 6, tab_Trade = 7, tab_Growth = 8, tab_Sail = 9, tab_Wealth = 10, tab_Combat = 11, tab_LocalWar = 12, tab_Rally = 13}
-- DECOMPILER ERROR at PC476: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.Initialize = function(self)
  -- function num : 0_2
  for listIdx = 0, self._createListCount - 1 do
    local rankList = {}
    rankList.rank = (UI.createAndCopyBasePropertyControl)(Panel_LifeRanking, "StaticText_PlayerRank", Panel_LifeRanking, "LifeRanking_Rank_" .. listIdx)
    ;
    (rankList.rank):SetPosX(174)
    ;
    (rankList.rank):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.name = (UI.createAndCopyBasePropertyControl)(Panel_LifeRanking, "StaticText_PlayerName", Panel_LifeRanking, "LifeRanking_Name_" .. listIdx)
    ;
    (rankList.name):SetPosX(211)
    ;
    (rankList.name):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.guild = (UI.createAndCopyBasePropertyControl)(Panel_LifeRanking, "StaticText_AnotherGuildName", Panel_LifeRanking, "LifeRanking_Guild_" .. listIdx)
    ;
    (rankList.guild):SetPosX(491)
    ;
    (rankList.guild):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    rankList.grade = (UI.createAndCopyBasePropertyControl)(Panel_LifeRanking, "StaticText_MyLifeGrade", Panel_LifeRanking, "LifeRanking_GradeList_" .. listIdx)
    ;
    (rankList.grade):SetPosX(673)
    ;
    (rankList.grade):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    -- DECOMPILER ERROR at PC99: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._listPool)[listIdx] = rankList
  end
  if Panel_LifeRanking:GetShow() then
    Panel_LifeRanking:SetShow(false, false)
  end
  for idx = 0, self._createTabCount - 1 do
    (((self._ui)._tab)[idx]):SetCheck(false)
  end
  local setShowCount = 0
  for index = 0, self._createTabCount - 1 do
    if FGlobal_LifeRanking_CheckEnAble(index) then
      (((self._ui)._tab)[index]):SetShow(true)
      ;
      (((self._ui)._tab)[index]):SetSpanSize(40, 37 * setShowCount + 183)
      setShowCount = setShowCount + 1
    else
      ;
      (((self._ui)._tab)[index]):SetShow(false)
    end
  end
  ;
  (((self._ui)._tab)[0]):SetCheck(true)
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_LifeRanking:SetPosX((screenSizeX - Panel_LifeRanking:GetSizeX()) / 2)
  Panel_LifeRanking:SetPosY((screenSizeY - Panel_LifeRanking:GetSizeY()) / 2)
  Panel_LifeRanking:SetChildIndex(((self._ui)._tooltip)._bg, 9999)
  Panel_LifeRanking:SetChildIndex(((self._ui)._tooltip)._name, 9999)
  Panel_LifeRanking:SetChildIndex(((self._ui)._tooltip)._desc, 9999)
end

-- DECOMPILER ERROR at PC480: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.Update = function(self)
  -- function num : 0_3 , upvalues : UI_color
  for listIdx = 0, self._createListCount - 1 do
    local list = (self._listPool)[listIdx]
    ;
    (list.rank):SetShow(false)
    ;
    (list.name):SetShow(false)
    ;
    (list.guild):SetShow(false)
    ;
    (list.grade):SetShow(false)
  end
  ;
  ((self._ui).firstRanker):SetShow(false)
  ;
  ((self._ui).secondRanker):SetShow(false)
  ;
  ((self._ui).thirdRanker):SetShow(false)
  ;
  ((self._ui).firstRankerName):SetShow(false)
  ;
  ((self._ui).secondRankerName):SetShow(false)
  ;
  ((self._ui).thirdRankerName):SetShow(false)
  ;
  ((self._ui).firstRankerGuild):SetShow(false)
  ;
  ((self._ui).secondRankerGuild):SetShow(false)
  ;
  ((self._ui).thirdRankerGuild):SetShow(false)
  ;
  (((self._ui)._topGrade)[1]):SetShow(false)
  ;
  (((self._ui)._topGrade)[2]):SetShow(false)
  ;
  (((self._ui)._topGrade)[3]):SetShow(false)
  if self._selectedTabIdx <= 9 then
    self._listCount = ToClient_GetLifeRankerCount()
  else
    if self._selectedTabIdx == 10 then
      self._listCount = ToClient_GetContentsRankCount(1)
    else
      if self._selectedTabIdx == 11 then
        self._listCount = ToClient_GetContentsRankCount(0)
      else
        if self._selectedTabIdx == 12 then
          self._listCount = ToClient_GetContentsRankCount(2)
        else
          if self._selectedTabIdx == 13 then
            self._listCount = (math.max)(ToClient_GetMatchRankerCount(1), 1)
          end
        end
      end
    end
  end
  local count = 0
  local lifeRanker, rankerMoney = nil, nil
  self._rankerData = {}
  for listIdx = self._startIndex, self._listCount - 1 do
    lifeRanker = PaGlobal_LifeRanking:GetLifeRankerAt(listIdx)
    if lifeRanker == nil then
      break
    end
    local list = (self._listPool)[count]
    local checkLv = false
    if listIdx == 0 then
      checkLv = PaGlobal_LifeRanking:FillLifeRankList(lifeRanker, (self._ui).firstRanker, (self._ui).firstRankerName, (self._ui).firstRankerGuild, ((self._ui)._topGrade)[1], listIdx, UI_color.C_FFEF5378)
    else
      if listIdx == 1 then
        checkLv = PaGlobal_LifeRanking:FillLifeRankList(lifeRanker, (self._ui).secondRanker, (self._ui).secondRankerName, (self._ui).secondRankerGuild, ((self._ui)._topGrade)[2], listIdx, UI_color.C_FF88DF00)
      else
        if listIdx == 2 then
          checkLv = PaGlobal_LifeRanking:FillLifeRankList(lifeRanker, (self._ui).thirdRanker, (self._ui).thirdRankerName, (self._ui).thirdRankerGuild, ((self._ui)._topGrade)[3], listIdx, UI_color.C_FF6DC6FF)
        else
          checkLv = PaGlobal_LifeRanking:FillLifeRankList(lifeRanker, list.rank, list.name, list.guild, list.grade, listIdx, UI_color.C_FFC4BEBE)
        end
      end
    end
    if checkLv ~= false then
      do
        if self._createListCount <= count then
          break
        end
        count = count + 1
        -- DECOMPILER ERROR at PC228: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC228: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
  local myLifeRanker = PaGlobal_LifeRanking:GetMyLifeRank(self._selectedTabIdx)
  local serverUserCnt = PaGlobal_LifeRanking:GetUserCount(self._selectedTabIdx)
  local myLifeRankerRate = (tonumber(myLifeRanker * 100 / serverUserCnt))
  local myLifeRankGroup = nil
  local lifeType = ((self._ui)._tabName)[self._selectedTabIdx]
  local lifeRankerLv = PaGlobal_LifeRanking:CheckMyLifeLv(self._selectedTabIdx)
  if myLifeRanker <= 30 and lifeRankerLv > 0 then
    if self._selectedTabIdx == 12 then
      myLifeRankGroup = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_LIFERANKING_MYRANKING2_LOCALWAR", "lifeType", lifeType, "myLifeRanker", myLifeRanker, "point", lifeRankerLv)
    else
      myLifeRankGroup = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LIFERANKING_MYRANKING2", "lifeType", lifeType, "myLifeRanker", myLifeRanker)
    end
    ;
    ((self._ui)._inMyRankRate):SetShow(false)
  else
    if lifeRankerLv == 0 then
      myLifeRankGroup = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RALLYRANKING_MYRANK_NOPOINT", "rallyType", lifeType)
      ;
      ((self._ui)._inMyRankRate):SetShow(false)
    else
      if myLifeRankerRate >= 0 and myLifeRankerRate <= 20 then
        lifeGrade = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_A")
      else
        if myLifeRankerRate > 20 and myLifeRankerRate <= 40 then
          lifeGrade = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_B")
        else
          if myLifeRankerRate > 40 and myLifeRankerRate <= 60 then
            lifeGrade = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_C")
          else
            if myLifeRankerRate > 60 and myLifeRankerRate <= 80 then
              lifeGrade = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_D")
            else
              if myLifeRankerRate > 80 and myLifeRankerRate <= 100 then
                lifeGrade = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_E")
              end
            end
          end
        end
      end
      myLifeRankGroup = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LIFERANKING_GRADETYPE", "lifeType", lifeType, "lifeGrade", tostring(lifeGrade))
      ;
      ((self._ui)._inMyRankRate):SetShow(true)
      ;
      ((self._ui)._inMyRankRate):SetControlPos(myLifeRankerRate)
    end
  end
  ;
  ((self._ui)._myRanking):SetText(myLifeRankGroup)
  if self._serverChange == true then
    PaGlobal_LifeRanking:MyLifeRankingText_Refresh()
    self._serverChange = false
  end
end

-- DECOMPILER ERROR at PC483: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.LevelFlotFunc = function(self, lifeRankerWrp)
  -- function num : 0_4
  if lifeRankerWrp == nil then
    return 
  end
  local _const = Defines.s64_const
  local rate = 0
  local rateDisplay = 0
  local s64_needExp = lifeRankerWrp:getNeedExp_s64()
  local s64_exp = lifeRankerWrp:getExperience_s64()
  if _const.s64_10000 < s64_needExp then
    rate = Int64toInt32(s64_exp / (s64_needExp / _const.s64_100))
  else
    if _const.s64_0 ~= s64_needExp then
      rate = Int64toInt32(s64_exp * _const.s64_100 / s64_needExp)
    end
  end
  if rate < 10 then
    rateDisplay = ".0" .. rate
  else
    rateDisplay = "." .. rate
  end
  return rateDisplay
end

-- DECOMPILER ERROR at PC486: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.SelectTab = function(self, idx)
  -- function num : 0_5
  self._startIndex = 0
  self._selectedTabIdx = idx
  if idx <= 9 then
    ToClient_SetLifeRankType(idx)
  end
  if self._serverChange == true then
    for idx = 0, self._createTabCount - 1 do
      -- DECOMPILER ERROR at PC16: Confused about usage of register: R6 in 'UnsetPending'

      (self._listUpdate)[idx] = false
    end
    ToClient_RequestMyLifeRankRefresh()
  else
    if (self._listUpdate)[idx] == false then
      PaGlobal_LifeRanking:RequestLifeRank(idx)
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (self._listUpdate)[idx] = true
    else
      PaGlobal_LifeRanking:Update()
    end
  end
end

-- DECOMPILER ERROR at PC489: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.RankerWhisper = function(self, rankIdx)
  -- function num : 0_6
  local lifeRanker = nil
  lifeRanker = PaGlobal_LifeRanking:GetLifeRankerAt(rankIdx)
  local lifeRankerCharName = lifeRanker:getCharacterName()
  FGlobal_ChattingInput_ShowWhisper(lifeRankerCharName)
end

-- DECOMPILER ERROR at PC493: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.MyLifeRankingText_Refresh = function(self)
  -- function num : 0_7 , upvalues : UI_color
  for tab = 0, self._createTabCount - 1 do
    do
      if tab == 13 then
        local lifeRankerLvTmp = PaGlobal_LifeRanking:CheckMyLifeLv(tab)
        if lifeRankerLvTmp == 0 then
          checkData = false
          ;
          (((self._ui)._tabMyRank)[tab]):SetText("-")
          return 
        end
      end
      local myLifeRanking = PaGlobal_LifeRanking:GetMyLifeRank(tab)
      if myLifeRanking <= 30 then
        (((self._ui)._tabMyRank)[tab]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LIFERANKING_RANK", "listIdx", myLifeRanking))
        if myLifeRanking > 3 then
          (((self._ui)._tabMyRank)[tab]):SetFontColor(UI_color.C_FFC4BEBE)
        else
          if myLifeRanking == 1 then
            (((self._ui)._tabMyRank)[tab]):SetFontColor(UI_color.C_FFEF5378)
          else
            if myLifeRanking == 2 then
              (((self._ui)._tabMyRank)[tab]):SetFontColor(UI_color.C_FF88DF00)
            else
              if myLifeRanking == 3 then
                (((self._ui)._tabMyRank)[tab]):SetFontColor(UI_color.C_FF6DC6FF)
              else
                ;
                (((self._ui)._tabMyRank)[tab]):SetText("-")
              end
            end
          end
        end
      else
        local serverUserCnt = PaGlobal_LifeRanking:GetUserCount(tab)
        local myLifeRankerRate = tonumber(myLifeRanking * 100 / serverUserCnt)
        if myLifeRankerRate >= 0 and myLifeRankerRate <= 20 then
          (((self._ui)._tabMyRank)[tab]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_A"))
          ;
          (((self._ui)._tabMyRank)[tab]):SetFontColor(UI_color.C_FFC2313D)
        else
          if myLifeRankerRate > 20 and myLifeRankerRate <= 40 then
            (((self._ui)._tabMyRank)[tab]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_B"))
            ;
            (((self._ui)._tabMyRank)[tab]):SetFontColor(UI_color.C_FFD16400)
          else
            if myLifeRankerRate > 40 and myLifeRankerRate <= 60 then
              (((self._ui)._tabMyRank)[tab]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_C"))
              ;
              (((self._ui)._tabMyRank)[tab]):SetFontColor(UI_color.C_FF62B15B)
            else
              if myLifeRankerRate > 60 and myLifeRankerRate <= 80 then
                (((self._ui)._tabMyRank)[tab]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_D"))
                ;
                (((self._ui)._tabMyRank)[tab]):SetFontColor(UI_color.C_FF468ADA)
              else
                if myLifeRankerRate > 80 and myLifeRankerRate <= 100 then
                  (((self._ui)._tabMyRank)[tab]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_E"))
                  ;
                  (((self._ui)._tabMyRank)[tab]):SetFontColor(UI_color.C_FFDBB038)
                end
              end
            end
          end
        end
      end
      do
        -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
end

-- DECOMPILER ERROR at PC496: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.RequestLifeRank = function(self, tab)
  -- function num : 0_8
  if tab <= 9 then
    ToClient_RequestLifeRanker(tab)
  else
    if tab == 10 then
      ToClient_RequestContentsRank(1)
    else
      if tab == 11 then
        ToClient_RequestContentsRank(0)
      else
        if tab == 12 then
          ToClient_RequestContentsRank(2)
        else
          if tab == 13 then
            ToClient_RequestMatchRanker(0)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC499: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.GetMyLifeRank = function(self, tab)
  -- function num : 0_9
  local myRank = 0
  _PA_LOG("정태�\164", "tab : " .. tostring(tab))
  if tab <= 9 then
    myRank = ToClient_GetLifeMyRank_Param(tab)
  else
    if tab == 10 then
      myRank = ToClient_GetContentsMyRank(1)
    else
      if tab == 11 then
        myRank = ToClient_GetContentsMyRank(0)
      else
        if tab == 12 then
          myRank = ToClient_GetContentsMyRank(2)
          _PA_LOG("정태�\164", "myRank : " .. tostring(myRank))
        else
          if tab == 13 then
            myRank = ToClient_GetMyMatchRank(0)
          end
        end
      end
    end
  end
  return myRank
end

-- DECOMPILER ERROR at PC502: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.GetUserCount = function(self, tab)
  -- function num : 0_10
  local userCount = 0
  if tab <= 9 then
    userCount = ToClient_GetLifeRankerUserCount()
  else
    if tab == 10 then
      userCount = ToClient_GetContentsRankUserCount(1)
    else
      if tab == 11 then
        userCount = ToClient_GetContentsRankUserCount(0)
      else
        if tab == 12 then
          userCount = ToClient_GetContentsRankUserCount(2)
        else
          if tab == 13 then
            userCount = ToClient_GetMatchRankerUserCount(0)
          end
        end
      end
    end
  end
  return userCount
end

-- DECOMPILER ERROR at PC505: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.GetLifeRankerAt = function(self, listIdx)
  -- function num : 0_11
  local lifeRanker = nil
  if self._selectedTabIdx <= 9 then
    lifeRanker = ToClient_GetLifeRankerAt(listIdx)
  else
    if self._selectedTabIdx == 10 then
      lifeRanker = ToClient_GetMoneyRankAt(listIdx)
    else
      if self._selectedTabIdx == 11 then
        lifeRanker = ToClient_GetBattleRankAt(listIdx)
      else
        if self._selectedTabIdx == 12 then
          lifeRanker = ToClient_GetLocalWarRankAt(listIdx)
        else
          if self._selectedTabIdx == 13 then
            lifeRanker = ToClient_GetMatchRankerAt(0, listIdx)
          end
        end
      end
    end
  end
  return lifeRanker
end

-- DECOMPILER ERROR at PC508: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.GetLifeRankerLv = function(self, lifeRanker, tab)
  -- function num : 0_12
  local lifeRankerLv = 0
  if tab == 13 then
    lifeRankerLv = lifeRanker:getMatchPoint()
  else
    if tab == 12 then
      lifeRankerLv = lifeRanker:getAccumulatedKillCount()
    else
      lifeRankerLv = lifeRanker:getLevel()
    end
  end
  return lifeRankerLv
end

-- DECOMPILER ERROR at PC511: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.CheckMyLifeLv = function(self, tab)
  -- function num : 0_13
  local lifeRankerLv = 0
  if tab == 12 then
    lifeRankerLv = ToClient_GetMyAccumulatedKillCount()
  else
    if tab == 13 then
      lifeRankerLv = ToClient_GetMyMatchPoint(0)
    else
      lifeRankerLv = 1
    end
  end
  return lifeRankerLv
end

-- DECOMPILER ERROR at PC514: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.FillLifeRankList = function(self, lifeRanker, rankText, nameText, guildText, gradeText, listIdx, color)
  -- function num : 0_14
  local lifeRankerLv = PaGlobal_LifeRanking:GetLifeRankerLv(lifeRanker, self._selectedTabIdx)
  local lifeRankerName = lifeRanker:getUserName()
  local lifeRankerCharName = lifeRanker:getCharacterName()
  local lifeRankerGuild = lifeRanker:getGuildName()
  local lifeRankerIntroDesc = lifeRanker:getUserIntroduction()
  if lifeRankerLv == 0 then
    return false
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R13 in 'UnsetPending'

  ;
  (self._rankerData)[listIdx] = {}
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R13 in 'UnsetPending'

  ;
  ((self._rankerData)[listIdx])._name = lifeRankerName
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R13 in 'UnsetPending'

  ;
  ((self._rankerData)[listIdx])._desc = lifeRankerIntroDesc
  rankText:SetShow(true)
  nameText:SetShow(true)
  guildText:SetShow(true)
  gradeText:SetShow(true)
  rankText:SetFontColor(color)
  nameText:SetFontColor(color)
  guildText:SetFontColor(color)
  guildText:SetFontColor(color)
  rankText:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LIFERANKING_RANK", "listIdx", listIdx + 1))
  nameText:SetText(lifeRankerName .. "(" .. lifeRankerCharName .. ")")
  guildText:SetText(lifeRankerGuild)
  if self._selectedTabIdx <= 9 then
    if _ContentsGroup_isUsedNewCharacterInfo == false then
      gradeText:SetText(FGlobal_CraftLevel_Replace(lifeRankerLv, self._selectedTabIdx))
    else
      gradeText:SetText(FGlobal_UI_CharacterInfo_Basic_Global_CraftLevelReplace(lifeRankerLv, self._selectedTabIdx))
    end
  else
    if self._selectedTabIdx == 10 then
      gradeText:SetShow(false)
    else
      if self._selectedTabIdx == 11 then
        local levelFlot = PaGlobal_LifeRanking:LevelFlotFunc(lifeRanker)
        gradeText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. " " .. tostring(lifeRankerLv) .. tostring(levelFlot))
      else
        do
          if self._selectedTabIdx == 12 then
            gradeText:SetText(lifeRankerLv)
          else
            if self._selectedTabIdx == 13 then
              gradeText:SetText(lifeRankerLv)
            end
          end
          nameText:addInputEvent("Mouse_LUp", "PaGlobal_LifeRanking:RankerWhisper( " .. listIdx .. " )")
          nameText:addInputEvent("Mouse_On", "PaGlobal_LifeRanking:Tooltip( " .. listIdx .. ")")
          nameText:addInputEvent("Mouse_Out", "PaGlobal_LifeRanking:Tooltip()")
          return true
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC517: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.ShowAndUpdate = function(self)
  -- function num : 0_15
  audioPostEvent_SystemUi(1, 0)
  PaGlobal_LifeRanking:Update()
  if Panel_LifeRanking:GetShow() == false then
    Panel_LifeRanking:SetShow(true, true)
  end
end

FromClient_Repos = function()
  -- function num : 0_16
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_LifeRanking:SetPosX((screenSizeX - Panel_LifeRanking:GetSizeX()) / 2)
  Panel_LifeRanking:SetPosY((screenSizeY - Panel_LifeRanking:GetSizeY()) / 2)
end

FromClient_ShowLifeRank = function()
  -- function num : 0_17
  PaGlobal_LifeRanking:ShowAndUpdate()
end

FromClient_ShowContentsRank = function(contentsRankType)
  -- function num : 0_18
  if contentsRankType == nil then
    return 
  end
  PaGlobal_LifeRanking:ShowAndUpdate()
end

FromClient_ResponseMatchRank_ = function()
  -- function num : 0_19
  PaGlobal_LifeRanking:ShowAndUpdate()
end

FromClient_LifeRanking_Refresh = function()
  -- function num : 0_20
  local self = PaGlobal_LifeRanking
  self._serverChange = true
end

FromClient_UpdateLifeRanking = function()
  -- function num : 0_21
  local self = PaGlobal_LifeRanking
  if (self._listUpdate)[self._selectedTabIdx] == false then
    PaGlobal_LifeRanking:RequestLifeRank(self._selectedTabIdx)
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self._listUpdate)[self._selectedTabIdx] = true
  else
    PaGlobal_LifeRanking:Update()
  end
end

FGlobal_LifeRanking_Refresh = function()
  -- function num : 0_22
  local self = PaGlobal_LifeRanking
  if self._serverChange == true then
    ToClient_RequestMyLifeRankRefresh()
  end
  return self._serverChange
end

FGlobal_LifeRanking_Open = function()
  -- function num : 0_23
  local self = PaGlobal_LifeRanking
  if self._serverChange == true then
    for idx = 0, self._createTabCount - 1 do
      -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

      (self._listUpdate)[idx] = false
    end
    ToClient_RequestMyLifeRankRefresh()
  else
    PaGlobal_LifeRanking:ShowAndUpdate()
  end
  ;
  (((self._ui)._tabMyRank)[13]):SetShow(false)
  ;
  (((self._ui)._tab)[13]):SetShow(false)
end

FGlobal_LifeRanking_Close = function()
  -- function num : 0_24
  Panel_LifeRanking:SetShow(false, false)
end

FGlobal_LifeRanking_CheckEnAble = function(rankType)
  -- function num : 0_25 , upvalues : rankingTabId
  local self = rankingTabId
  local returnValue = true
  if self.tab_Hunting == rankType then
    if ToClient_IsContentsGroupOpen("28") then
      returnValue = true
    else
      returnValue = false
    end
  else
    if self.tab_Rally == rankType then
      if ToClient_IsContentsGroupOpen("38") then
        returnValue = true
      else
        returnValue = false
      end
    else
      if self.tab_LocalWar == rankType then
        if ToClient_IsContentsGroupOpen("43") then
          returnValue = true
        else
          returnValue = false
        end
      else
        if self.tab_Sail == rankType then
          if ToClient_IsContentsGroupOpen("83") then
            returnValue = true
          else
            returnValue = false
          end
        end
      end
    end
  end
  return returnValue
end

FGlobal_LifeRanking_Show = function(index)
  -- function num : 0_26
  local self = PaGlobal_LifeRanking
  local rankType = nil
  if index == 0 then
    rankType = 12
  else
    if index == 1 then
      rankType = 11
    end
  end
  if rankType ~= nil then
    PaGlobal_LifeRanking:SelectTab(rankType)
    ;
    ((self._tab)[rankType]):SetCheck(true)
    for idx = 0, self._createTabCount - 1 do
      ((self._tab)[idx]):SetCheck(false)
    end
  end
end

-- DECOMPILER ERROR at PC543: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.Simpletooltips = function(self, isShow, contolNo)
  -- function num : 0_27
  local control, name = nil
  if isShow == true then
    contol = ((self._ui)._tab)[contolNo]
    name = ((self._ui)._tabName)[contolNo]
    registTooltipControl(contol, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(contol, name, nil)
  else
    TooltipSimple_Hide()
  end
end

-- DECOMPILER ERROR at PC546: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.TooltipHide = function(self)
  -- function num : 0_28
  (((self._ui)._tooltip)._bg):SetShow(false)
  ;
  (((self._ui)._tooltip)._name):SetShow(false)
  ;
  (((self._ui)._tooltip)._desc):SetShow(false)
end

-- DECOMPILER ERROR at PC549: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.TooltipShow = function(self, uiControl, name, desc, index)
  -- function num : 0_29
  PaGlobal_LifeRanking:TooltipHide()
  ;
  (((self._ui)._tooltip)._bg):SetShow(true)
  ;
  (((self._ui)._tooltip)._name):SetShow(true)
  ;
  (((self._ui)._tooltip)._desc):SetShow(true)
  ;
  (((self._ui)._tooltip)._name):SetText(name .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_PLAYERINTRO"))
  local nameLength = (math.max)(150, (((self._ui)._tooltip)._name):GetTextSizeX())
  ;
  (((self._ui)._tooltip)._desc):SetSize(nameLength, (((self._ui)._tooltip)._desc):GetTextSizeY())
  ;
  (((self._ui)._tooltip)._desc):SetText(desc)
  ;
  (((self._ui)._tooltip)._bg):SetSize(nameLength + 10, (((self._ui)._tooltip)._name):GetSizeY() + (((self._ui)._tooltip)._desc):GetTextSizeY() + 15)
  local posX = 0
  local posY = 0
  if index >= 3 then
    posX = (uiControl.name):GetPosX()
    posY = (uiControl.name):GetPosY()
  else
    posX = uiControl:GetPosX()
    posY = uiControl:GetPosY()
  end
  ;
  (((self._ui)._tooltip)._bg):SetPosX(posX + 20)
  ;
  (((self._ui)._tooltip)._bg):SetPosY(posY + 25)
  ;
  (((self._ui)._tooltip)._name):SetPosX((((self._ui)._tooltip)._bg):GetPosX() + 5)
  ;
  (((self._ui)._tooltip)._name):SetPosY((((self._ui)._tooltip)._bg):GetPosY() + 5)
  ;
  (((self._ui)._tooltip)._desc):SetPosX((((self._ui)._tooltip)._name):GetPosX())
  ;
  (((self._ui)._tooltip)._desc):SetPosY((((self._ui)._tooltip)._name):GetPosY() + (((self._ui)._tooltip)._name):GetSizeY())
end

-- DECOMPILER ERROR at PC552: Confused about usage of register: R5 in 'UnsetPending'

PaGlobal_LifeRanking.Tooltip = function(self, index)
  -- function num : 0_30
  local self = PaGlobal_LifeRanking
  if index == nil then
    PaGlobal_LifeRanking:TooltipHide()
    return 
  end
  local name = ((self._rankerData)[index])._name
  local desc = ((self._rankerData)[index])._desc
  local uiControl = nil
  if index == 0 then
    uiControl = (self._ui).firstRankerName
  else
    if index == 1 then
      uiControl = (self._ui).secondRankerName
    else
      if index == 2 then
        uiControl = (self._ui).thirdRankerName
      else
        uiControl = (self._listPool)[index]
      end
    end
  end
  if desc == nil or desc == "" then
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_PLAYERINTRO_NODATA")
  end
  PaGlobal_LifeRanking:TooltipShow(uiControl, name, desc, index)
end

LifeRanking_registEventHandler = function()
  -- function num : 0_31
  ((PaGlobal_LifeRanking._ui)._btnHelp):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PaGlobal_LifeRanking\" )")
  ;
  ((PaGlobal_LifeRanking._ui)._btnHelp):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PaGlobal_LifeRanking\", \"true\")")
  ;
  ((PaGlobal_LifeRanking._ui)._btnHelp):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PaGlobal_LifeRanking\", \"false\")")
  ;
  ((PaGlobal_LifeRanking._ui)._btnClose):addInputEvent("Mouse_LUp", "FGlobal_LifeRanking_Close()")
  for idx = 0, PaGlobal_LifeRanking._createTabCount - 1 do
    (((PaGlobal_LifeRanking._ui)._tab)[idx]):addInputEvent("Mouse_LUp", "PaGlobal_LifeRanking:SelectTab( " .. idx .. " )")
  end
end

LifeRanking_registMessageHandler = function()
  -- function num : 0_32
  registerEvent("onScreenResize", "FromClient_Repos")
  registerEvent("FromClient_ShowLifeRank", "FromClient_ShowLifeRank")
  registerEvent("FromClient_ShowContentsRank", "FromClient_ShowContentsRank")
  registerEvent("FromClient_ResponseMatchRank", "FromClient_ResponseMatchRank_")
  registerEvent("FromClient_LifeRanking_Refresh", "FromClient_LifeRanking_Refresh")
  registerEvent("FromClient_UpdateLifeRanking", "FromClient_UpdateLifeRanking")
end

;
(((PaGlobal_LifeRanking._ui)._tooltip)._desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
;
(((PaGlobal_LifeRanking._ui)._tooltip)._bg):SetIgnore(true)
PaGlobal_LifeRanking:Initialize()
LifeRanking_registEventHandler()
LifeRanking_registMessageHandler()

