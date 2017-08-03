-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\liferanking\panel_liferanking.luac 

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

local LifeRanking = {_txtTitle = (UI.getChildControl)(Panel_LifeRanking, "StaticText_Title"), _btnClose = (UI.getChildControl)(Panel_LifeRanking, "Button_Win_Close"), _btnHelp = (UI.getChildControl)(Panel_LifeRanking, "Button_Question"), _scroll = (UI.getChildControl)(Panel_LifeRanking, "Scroll_RankingList"), _listBg = (UI.getChildControl)(Panel_LifeRanking, "Static_BG"), _myRanking = (UI.getChildControl)(Panel_LifeRanking, "StaticText_MyRanking"), _inMyRankRate = (UI.getChildControl)(Panel_LifeRanking, "Slider_InMyRank"), firstRanker = (UI.getChildControl)(Panel_LifeRanking, "StaticText_Rank_First"), firstRankerName = (UI.getChildControl)(Panel_LifeRanking, "StaticText_FirstCharacterName"), firstRankerGuild = (UI.getChildControl)(Panel_LifeRanking, "StaticText_FirstGuildName"), secondRanker = (UI.getChildControl)(Panel_LifeRanking, "StaticText_Rank_Second"), secondRankerName = (UI.getChildControl)(Panel_LifeRanking, "StaticText_SecondCharacterName"), secondRankerGuild = (UI.getChildControl)(Panel_LifeRanking, "StaticText_SecondGuildName"), thirdRanker = (UI.getChildControl)(Panel_LifeRanking, "StaticText_Rank_Third"), thirdRankerName = (UI.getChildControl)(Panel_LifeRanking, "StaticText_ThirdCharacterName"), thirdRankerGuild = (UI.getChildControl)(Panel_LifeRanking, "StaticText_ThirdGuildName"), 
_topGrade = {(UI.getChildControl)(Panel_LifeRanking, "StaticText_Grade_First"), (UI.getChildControl)(Panel_LifeRanking, "StaticText_Grade_Second"), (UI.getChildControl)(Panel_LifeRanking, "StaticText_Grade_Third")}
, 
_tab = {[0] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Gathering"), [1] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Fishing"), [2] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Hunting"), [3] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Cook"), [4] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Alchemy"), [5] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Manufacture"), [6] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Mating"), [7] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Trade"), [8] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Growth"), [9] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Sail"), [10] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Wealth"), [11] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Combat"), [12] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_LocalWar"), [13] = (UI.getChildControl)(Panel_LifeRanking, "RadioButton_Tab_Rally")}
, 
_tabName = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_GATHER"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_FISH"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_HUNT"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_COOK"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_ALCHEMY"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_MANUFACTURE"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_HORSE"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_TRADE"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_GROWTH"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYCOMBAT_TAB_SAIL"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_WEALTH"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_COMBAT"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_LIFERANKING_TAB_LOCALWAR"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_PARTYCOMBAT_NAK_PVPMATCH_NAME")}
, _createTabCount = 14, _createListCount = 30, _listCount = 0, _startIndex = 0, _selectedTabIdx = 0, 
_listPool = {}
, 
_posConfig = {_tabStartPosX = 14, _tabPosXGap = 100, _listStartPosY = 190, _listPosYGap = 15.5}
}
local rankingTabId = {tab_Gathering = 0, tab_Fishing = 1, tab_Hunting = 2, tab_Cook = 3, tab_Alchemy = 4, tab_Manufacture = 5, tab_Mating = 6, tab_Trade = 7, tab_Growth = 8, tab_Sail = 9, tab_Wealth = 10, tab_Combat = 11, tab_LocalWar = 12, tab_Rally = 13}
;
(LifeRanking._btnHelp):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"LifeRanking\" )")
;
(LifeRanking._btnHelp):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"LifeRanking\", \"true\")")
;
(LifeRanking._btnHelp):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"LifeRanking\", \"false\")")
local tooltip = {_bg = (UI.getChildControl)(Panel_LifeRanking, "Static_TooltipBG"), _name = (UI.getChildControl)(Panel_LifeRanking, "Tooltip_Name"), _desc = (UI.getChildControl)(Panel_LifeRanking, "Tooltip_Description")}
;
(tooltip._desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
;
(tooltip._bg):SetIgnore(true)
LifeRanking_Initionalize = function()
  -- function num : 0_2 , upvalues : LifeRanking, tooltip
  for listIdx = 0, LifeRanking._createListCount - 1 do
    local rankList = {}
    rankList.rank = (UI.createAndCopyBasePropertyControl)(Panel_LifeRanking, "StaticText_PlayerRank", Panel_LifeRanking, "LifeRanking_Rank_" .. listIdx)
    ;
    (rankList.rank):SetPosX(47)
    ;
    (rankList.rank):SetPosY((LifeRanking._posConfig)._listStartPosY + (LifeRanking._posConfig)._listPosYGap * listIdx)
    rankList.name = (UI.createAndCopyBasePropertyControl)(Panel_LifeRanking, "StaticText_PlayerName", Panel_LifeRanking, "LifeRanking_Name_" .. listIdx)
    ;
    (rankList.name):SetPosX(86)
    ;
    (rankList.name):SetPosY((LifeRanking._posConfig)._listStartPosY + (LifeRanking._posConfig)._listPosYGap * listIdx)
    rankList.guild = (UI.createAndCopyBasePropertyControl)(Panel_LifeRanking, "StaticText_AnotherGuildName", Panel_LifeRanking, "LifeRanking_Guild_" .. listIdx)
    ;
    (rankList.guild):SetPosX(467)
    ;
    (rankList.guild):SetPosY((LifeRanking._posConfig)._listStartPosY + (LifeRanking._posConfig)._listPosYGap * listIdx)
    rankList.grade = (UI.createAndCopyBasePropertyControl)(Panel_LifeRanking, "StaticText_MyLifeGrade", Panel_LifeRanking, "LifeRanking_GradeList_" .. listIdx)
    ;
    (rankList.grade):SetPosX(645)
    ;
    (rankList.grade):SetPosY((LifeRanking._posConfig)._listStartPosY + (LifeRanking._posConfig)._listPosYGap * listIdx)
    -- DECOMPILER ERROR at PC109: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (LifeRanking._listPool)[listIdx] = rankList
  end
  ;
  ((LifeRanking._tab)[0]):SetCheck(true)
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_LifeRanking:SetPosX((screenSizeX - Panel_LifeRanking:GetSizeX()) / 2)
  Panel_LifeRanking:SetPosY((screenSizeY - Panel_LifeRanking:GetSizeY()) / 2)
  Panel_LifeRanking:SetChildIndex(tooltip._bg, 9999)
  Panel_LifeRanking:SetChildIndex(tooltip._name, 9999)
  Panel_LifeRanking:SetChildIndex(tooltip._desc, 9999)
end

local rankerData = {}
local group_0 = Panel_LifeRanking:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
local group_1 = Panel_LifeRanking:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
LifeRanking.Update = function(self)
  -- function num : 0_3 , upvalues : LifeRanking, rankerData, group_1, UI_color
  local levelFlotFunc = function(lifeRankerWrp)
    -- function num : 0_3_0
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

  for listIdx = 0, LifeRanking._createListCount - 1 do
    local list = (LifeRanking._listPool)[listIdx]
    ;
    (list.rank):SetShow(false)
    ;
    (list.name):SetShow(false)
    ;
    (list.guild):SetShow(false)
    ;
    (list.grade):SetShow(false)
    ;
    (LifeRanking.firstRanker):SetShow(false)
    ;
    (LifeRanking.secondRanker):SetShow(false)
    ;
    (LifeRanking.thirdRanker):SetShow(false)
    ;
    (LifeRanking.firstRankerName):SetShow(false)
    ;
    (LifeRanking.secondRankerName):SetShow(false)
    ;
    (LifeRanking.thirdRankerName):SetShow(false)
    ;
    (LifeRanking.firstRankerGuild):SetShow(false)
    ;
    (LifeRanking.secondRankerGuild):SetShow(false)
    ;
    (LifeRanking.thirdRankerGuild):SetShow(false)
    ;
    ((LifeRanking._topGrade)[1]):SetShow(false)
    ;
    ((LifeRanking._topGrade)[2]):SetShow(false)
    ;
    ((LifeRanking._topGrade)[3]):SetShow(false)
  end
  local count = 0
  local lifeType, lifeRanker, rankerMoney, myLifeRanker, servnerUserCnt, myLifeRankerRate = nil, nil, nil, nil, nil, nil
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R9 in 'UnsetPending'

  if LifeRanking._selectedTabIdx <= 9 then
    LifeRanking._listCount = ToClient_GetLifeRankerCount()
    myLifeRanker = ToClient_GetLifeMyRank()
    servnerUserCnt = ToClient_GetLifeRankerUserCount()
  else
    -- DECOMPILER ERROR at PC115: Confused about usage of register: R9 in 'UnsetPending'

    if LifeRanking._selectedTabIdx == 10 then
      LifeRanking._listCount = ToClient_GetContentsRankCount(1)
      myLifeRanker = ToClient_GetContentsMyRank(1)
      servnerUserCnt = ToClient_GetContentsRankUserCount(1)
    else
      -- DECOMPILER ERROR at PC133: Confused about usage of register: R9 in 'UnsetPending'

      if LifeRanking._selectedTabIdx == 11 then
        LifeRanking._listCount = ToClient_GetContentsRankCount(0)
        myLifeRanker = ToClient_GetContentsMyRank(0)
        servnerUserCnt = ToClient_GetContentsRankUserCount(0)
      else
        -- DECOMPILER ERROR at PC151: Confused about usage of register: R9 in 'UnsetPending'

        if LifeRanking._selectedTabIdx == 12 then
          LifeRanking._listCount = ToClient_GetContentsRankCount(2)
          myLifeRanker = ToClient_GetContentsMyRank(2)
          servnerUserCnt = ToClient_GetContentsRankUserCount(2)
        else
          -- DECOMPILER ERROR at PC173: Confused about usage of register: R9 in 'UnsetPending'

          if LifeRanking._selectedTabIdx == 13 then
            LifeRanking._listCount = (math.max)(ToClient_GetMatchRankerCount(1), 1)
            myLifeRanker = ToClient_GetMyMatchRank(0)
            servnerUserCnt = ToClient_GetMatchRankerUserCount(0)
          end
        end
      end
    end
  end
  myLifeRankerRate = tonumber(myLifeRanker / servnerUserCnt * 100)
  rankerData = {}
  Panel_LifeRanking:deleteConsoleUIGroup(1, false)
  group_1 = Panel_LifeRanking:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  for listIdx = LifeRanking._startIndex, LifeRanking._listCount - 1 do
    if LifeRanking._selectedTabIdx <= 9 then
      lifeRanker = ToClient_GetLifeRankerAt(listIdx)
    else
      if LifeRanking._selectedTabIdx == 10 then
        lifeRanker = ToClient_GetMoneyRankAt(listIdx)
      else
        if LifeRanking._selectedTabIdx == 11 then
          lifeRanker = ToClient_GetBattleRankAt(listIdx)
        else
          if LifeRanking._selectedTabIdx == 12 then
            lifeRanker = ToClient_GetLocalWarRankAt(listIdx)
          else
            if LifeRanking._selectedTabIdx == 13 then
              lifeRanker = ToClient_GetMatchRankerAt(0, listIdx)
            end
          end
        end
      end
    end
    if lifeRanker == nil then
      break
    end
    local lifeRankerName = lifeRanker:getUserName()
    local lifeRankerCharName = lifeRanker:getCharacterName()
    local lifeRankerGuild = lifeRanker:getGuildName()
    local lifeRankerIntroDesc = lifeRanker:getUserIntroduction()
    -- DECOMPILER ERROR at PC267: Confused about usage of register: R17 in 'UnsetPending'

    rankerData[listIdx] = {}
    -- DECOMPILER ERROR at PC270: Confused about usage of register: R17 in 'UnsetPending'

    ;
    (rankerData[listIdx])._name = lifeRankerName
    -- DECOMPILER ERROR at PC273: Confused about usage of register: R17 in 'UnsetPending'

    ;
    (rankerData[listIdx])._desc = lifeRankerIntroDesc
    local lifeRankerLv = nil
    if LifeRanking._selectedTabIdx == 13 then
      lifeRankerLv = lifeRanker:getMatchPoint()
    else
      if LifeRanking._selectedTabIdx == 12 then
        lifeRankerLv = lifeRanker:getAccumulatedKillCount()
      else
        lifeRankerLv = lifeRanker:getLevel()
      end
    end
    if LifeRanking._createListCount > count then
      if lifeRankerLv == 0 then
        break
      end
      local list = (LifeRanking._listPool)[count]
      if listIdx == 0 then
        (LifeRanking.firstRanker):SetShow(true)
        ;
        (LifeRanking.firstRankerName):SetShow(true)
        ;
        (LifeRanking.firstRankerGuild):SetShow(true)
        ;
        ((LifeRanking._topGrade)[1]):SetShow(true)
        ;
        (LifeRanking.firstRanker):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LIFERANKING_RANK", "listIdx", listIdx + 1))
        ;
        (LifeRanking.firstRankerName):SetText(lifeRankerName .. "(" .. lifeRankerCharName .. ")")
        ;
        (LifeRanking.firstRankerGuild):SetText(lifeRankerGuild)
        if LifeRanking._selectedTabIdx <= 9 then
          ((LifeRanking._topGrade)[1]):SetText(FGlobal_CraftLevel_Replace(lifeRankerLv, LifeRanking._selectedTabIdx))
        else
          if LifeRanking._selectedTabIdx == 10 then
            ((LifeRanking._topGrade)[1]):SetShow(false)
          else
            if LifeRanking._selectedTabIdx == 11 then
              local levelFlot = levelFlotFunc(lifeRanker)
              ;
              ((LifeRanking._topGrade)[1]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. " " .. tostring(lifeRankerLv) .. tostring(levelFlot))
            else
              do
                if LifeRanking._selectedTabIdx == 12 then
                  ((LifeRanking._topGrade)[1]):SetText(lifeRankerLv)
                else
                  if LifeRanking._selectedTabIdx == 13 then
                    ((LifeRanking._topGrade)[1]):SetText(lifeRankerLv)
                  end
                end
                ;
                (LifeRanking.firstRanker):SetFontColor(UI_color.C_FFEF5378)
                ;
                (LifeRanking.firstRankerName):SetFontColor(UI_color.C_FFEF5378)
                ;
                (LifeRanking.firstRankerGuild):SetFontColor(UI_color.C_FFEF5378)
                ;
                ((LifeRanking._topGrade)[1]):SetFontColor(UI_color.C_FFEF5378)
                ;
                (LifeRanking.firstRankerName):addInputEvent("Mouse_LUp", "LifeRanking_RankerWhisper( " .. listIdx .. " )")
                ;
                (LifeRanking.firstRankerName):addInputEvent("Mouse_On", "LifeRanking_Tooltip( " .. listIdx .. ")")
                ;
                (LifeRanking.firstRankerName):addInputEvent("Mouse_Out", "LifeRanking_Tooltip()")
                group_1:addControl(0, listIdx, 1, 30, LifeRanking.firstRankerName)
                if listIdx == 1 then
                  (LifeRanking.secondRanker):SetShow(true)
                  ;
                  (LifeRanking.secondRankerName):SetShow(true)
                  ;
                  (LifeRanking.secondRankerGuild):SetShow(true)
                  ;
                  ((LifeRanking._topGrade)[2]):SetShow(true)
                  ;
                  (LifeRanking.secondRanker):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LIFERANKING_RANK", "listIdx", listIdx + 1))
                  ;
                  (LifeRanking.secondRankerName):SetText(lifeRankerName .. "(" .. lifeRankerCharName .. ")")
                  ;
                  (LifeRanking.secondRankerGuild):SetText(lifeRankerGuild)
                  if LifeRanking._selectedTabIdx <= 9 then
                    ((LifeRanking._topGrade)[2]):SetText(FGlobal_CraftLevel_Replace(lifeRankerLv, LifeRanking._selectedTabIdx))
                  else
                    if LifeRanking._selectedTabIdx == 10 then
                      ((LifeRanking._topGrade)[2]):SetShow(false)
                    else
                      if LifeRanking._selectedTabIdx == 11 then
                        local levelFlot = levelFlotFunc(lifeRanker)
                        ;
                        ((LifeRanking._topGrade)[2]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. " " .. tostring(lifeRankerLv) .. tostring(levelFlot))
                      else
                        do
                          if LifeRanking._selectedTabIdx == 12 then
                            ((LifeRanking._topGrade)[2]):SetText(lifeRankerLv)
                          else
                            if LifeRanking._selectedTabIdx == 13 then
                              ((LifeRanking._topGrade)[2]):SetText(lifeRankerLv)
                            end
                          end
                          ;
                          (LifeRanking.secondRanker):SetFontColor(UI_color.C_FF88DF00)
                          ;
                          (LifeRanking.secondRankerName):SetFontColor(UI_color.C_FF88DF00)
                          ;
                          (LifeRanking.secondRankerGuild):SetFontColor(UI_color.C_FF88DF00)
                          ;
                          ((LifeRanking._topGrade)[2]):SetFontColor(UI_color.C_FF88DF00)
                          ;
                          (LifeRanking.secondRankerName):addInputEvent("Mouse_LUp", "LifeRanking_RankerWhisper( " .. listIdx .. " )")
                          ;
                          (LifeRanking.secondRankerName):addInputEvent("Mouse_On", "LifeRanking_Tooltip( " .. listIdx .. ")")
                          ;
                          (LifeRanking.secondRankerName):addInputEvent("Mouse_Out", "LifeRanking_Tooltip()")
                          group_1:addControl(0, listIdx, 1, 30, LifeRanking.secondRankerName)
                          if listIdx == 2 then
                            (LifeRanking.thirdRanker):SetShow(true)
                            ;
                            (LifeRanking.thirdRankerName):SetShow(true)
                            ;
                            (LifeRanking.thirdRankerGuild):SetShow(true)
                            ;
                            ((LifeRanking._topGrade)[3]):SetShow(true)
                            ;
                            (LifeRanking.thirdRanker):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LIFERANKING_RANK", "listIdx", listIdx + 1))
                            ;
                            (LifeRanking.thirdRankerName):SetText(lifeRankerName .. "(" .. lifeRankerCharName .. ")")
                            ;
                            (LifeRanking.thirdRankerGuild):SetText(lifeRankerGuild)
                            if LifeRanking._selectedTabIdx <= 9 then
                              ((LifeRanking._topGrade)[3]):SetText(FGlobal_CraftLevel_Replace(lifeRankerLv, LifeRanking._selectedTabIdx))
                            else
                              if LifeRanking._selectedTabIdx == 10 then
                                ((LifeRanking._topGrade)[3]):SetShow(false)
                              else
                                if LifeRanking._selectedTabIdx == 11 then
                                  local levelFlot = levelFlotFunc(lifeRanker)
                                  ;
                                  ((LifeRanking._topGrade)[3]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. " " .. tostring(lifeRankerLv) .. tostring(levelFlot))
                                else
                                  do
                                    if LifeRanking._selectedTabIdx == 12 then
                                      ((LifeRanking._topGrade)[3]):SetText(lifeRankerLv)
                                    else
                                      if LifeRanking._selectedTabIdx == 13 then
                                        ((LifeRanking._topGrade)[3]):SetText(lifeRankerLv)
                                      end
                                    end
                                    ;
                                    (LifeRanking.thirdRanker):SetFontColor(UI_color.C_FF6DC6FF)
                                    ;
                                    (LifeRanking.thirdRankerName):SetFontColor(UI_color.C_FF6DC6FF)
                                    ;
                                    (LifeRanking.thirdRankerGuild):SetFontColor(UI_color.C_FF6DC6FF)
                                    ;
                                    ((LifeRanking._topGrade)[3]):SetFontColor(UI_color.C_FF6DC6FF)
                                    ;
                                    (LifeRanking.thirdRankerName):addInputEvent("Mouse_LUp", "LifeRanking_RankerWhisper( " .. listIdx .. " )")
                                    ;
                                    (LifeRanking.thirdRankerName):addInputEvent("Mouse_On", "LifeRanking_Tooltip( " .. listIdx .. ")")
                                    ;
                                    (LifeRanking.thirdRankerName):addInputEvent("Mouse_Out", "LifeRanking_Tooltip()")
                                    group_1:addControl(0, listIdx, 1, 30, LifeRanking.thirdRankerName)
                                    ;
                                    (list.rank):SetShow(true)
                                    ;
                                    (list.name):SetShow(true)
                                    ;
                                    (list.guild):SetShow(true)
                                    ;
                                    (list.grade):SetShow(true)
                                    ;
                                    (list.rank):SetFontColor(UI_color.C_FFC4BEBE)
                                    ;
                                    (list.name):SetFontColor(UI_color.C_FFC4BEBE)
                                    ;
                                    (list.guild):SetFontColor(UI_color.C_FFC4BEBE)
                                    ;
                                    (list.grade):SetFontColor(UI_color.C_FFC4BEBE)
                                    ;
                                    (list.rank):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LIFERANKING_RANK", "listIdx", listIdx + 1))
                                    ;
                                    (list.name):SetText(lifeRankerName .. "(" .. lifeRankerCharName .. ")")
                                    ;
                                    (list.guild):SetText(lifeRankerGuild)
                                    if LifeRanking._selectedTabIdx <= 9 then
                                      (list.grade):SetText(FGlobal_CraftLevel_Replace(lifeRankerLv, LifeRanking._selectedTabIdx))
                                    else
                                      if LifeRanking._selectedTabIdx == 10 then
                                        (list.grade):SetShow(false)
                                      else
                                        if LifeRanking._selectedTabIdx == 11 then
                                          local levelFlot = levelFlotFunc(lifeRanker)
                                          ;
                                          (list.grade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. " " .. tostring(lifeRankerLv) .. tostring(levelFlot))
                                        else
                                          do
                                            do
                                              if LifeRanking._selectedTabIdx == 12 then
                                                (list.grade):SetText(lifeRankerLv)
                                              else
                                                if LifeRanking._selectedTabIdx == 13 then
                                                  (list.grade):SetText(lifeRankerLv)
                                                end
                                              end
                                              ;
                                              (list.name):addInputEvent("Mouse_LUp", "LifeRanking_RankerWhisper( " .. listIdx .. " )")
                                              ;
                                              (list.name):addInputEvent("Mouse_On", "LifeRanking_Tooltip( " .. listIdx .. ")")
                                              ;
                                              (list.name):addInputEvent("Mouse_Out", "LifeRanking_Tooltip()")
                                              group_1:addControl(0, listIdx, 1, 30, list.name)
                                              count = count + 1
                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out DO_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                              -- DECOMPILER ERROR at PC995: LeaveBlock: unexpected jumping out IF_STMT

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
    end
  end
  lifeType = (LifeRanking._tabName)[LifeRanking._selectedTabIdx]
  local lifeRankerLv = nil
  if LifeRanking._selectedTabIdx == 12 then
    lifeRankerLv = ToClient_GetMyAccumulatedKillCount()
  else
    if LifeRanking._selectedTabIdx == 13 then
      lifeRankerLv = ToClient_GetMyMatchPoint(0)
    else
      lifeRankerLv = 1
    end
  end
  if myLifeRanker <= 30 and lifeRankerLv > 0 then
    if LifeRanking._selectedTabIdx == 12 then
      myLifeRankGroup = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_LIFERANKING_MYRANKING2_LOCALWAR", "lifeType", lifeType, "myLifeRanker", myLifeRanker, "point", lifeRankerLv)
    else
      myLifeRankGroup = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_LIFERANKING_MYRANKING2", "lifeType", lifeType, "myLifeRanker", myLifeRanker)
    end
    ;
    (LifeRanking._inMyRankRate):SetShow(false)
  else
    if lifeRankerLv == 0 then
      myLifeRankGroup = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RALLYRANKING_MYRANK_NOPOINT", "rallyType", lifeType)
      ;
      (LifeRanking._inMyRankRate):SetShow(false)
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
      (LifeRanking._inMyRankRate):SetShow(true)
    end
  end
  ;
  (LifeRanking._myRanking):SetText(myLifeRankGroup)
  ;
  (LifeRanking._inMyRankRate):SetControlPos(myLifeRankerRate)
end

FromClient_ShowLifeRank = function()
  -- function num : 0_4 , upvalues : LifeRanking
  audioPostEvent_SystemUi(1, 0)
  Panel_LifeRanking:SetShow(true, true)
  LifeRanking:Update()
end

FromClient_ShowContentsRank = function(contentsRankType)
  -- function num : 0_5
  if contentsRankType == nil then
    return 
  end
  FromClient_ShowLifeRank()
end

LifeRanking_SelectTab = function(idx)
  -- function num : 0_6 , upvalues : LifeRanking
  for listIdx = 0, LifeRanking._createListCount - 1 do
    local list = (LifeRanking._listPool)[listIdx]
    ;
    (list.rank):SetShow(false)
    ;
    (list.name):SetShow(false)
    ;
    (list.guild):SetShow(false)
    ;
    (list.grade):SetShow(false)
  end
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  LifeRanking._startIndex = 0
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  LifeRanking._selectedTabIdx = idx
  if idx <= 9 then
    ToClient_RequestLifeRanker(idx)
  else
    if idx == 10 then
      ToClient_RequestContentsRank(1)
    else
      if idx == 11 then
        ToClient_RequestContentsRank(0)
      else
        if idx == 12 then
          ToClient_RequestContentsRank(2)
        else
          if idx == 13 then
            ToClient_RequestMatchRanker(0)
          end
        end
      end
    end
  end
end

FGlobal_LifeRanking_Open = function()
  -- function num : 0_7 , upvalues : LifeRanking, group_0
  if Panel_LifeRanking:GetShow() then
    Panel_LifeRanking:SetShow(false, false)
  end
  for idx,value in pairs(LifeRanking._tab) do
    ((LifeRanking._tab)[idx]):SetCheck(false)
  end
  local setShowCount = 0
  Panel_LifeRanking:deleteConsoleUIGroup(0, false)
  group_0 = Panel_LifeRanking:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  for index = 0, 13 do
    if FGlobal_LifeRanking_CheckEnAble(index) then
      ((LifeRanking._tab)[index]):SetShow(true)
      ;
      ((LifeRanking._tab)[index]):SetSpanSize(35 + 35 * setShowCount + 5, 60)
      group_0:addControl(setShowCount, 0, 14, 1, (LifeRanking._tab)[index])
      setShowCount = setShowCount + 1
    else
      ;
      ((LifeRanking._tab)[index]):SetShow(false)
    end
  end
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

  LifeRanking._selectedTabIdx = 0
  ;
  ((LifeRanking._tab)[0]):SetCheck(true)
  ToClient_RequestLifeRanker(LifeRanking._selectedTabIdx)
end

FGlobal_LifeRanking_Close = function()
  -- function num : 0_8
  Panel_LifeRanking:SetShow(false, false)
end

LifeRanking_RankerWhisper = function(rankIdx)
  -- function num : 0_9 , upvalues : LifeRanking, IM
  local lifeRanker = nil
  if LifeRanking._selectedTabIdx <= 9 then
    lifeRanker = ToClient_GetLifeRankerAt(rankIdx)
  else
    if LifeRanking._selectedTabIdx == 11 then
      lifeRanker = ToClient_GetBattleRankAt(rankIdx)
    else
      if LifeRanking._selectedTabIdx == 10 then
        lifeRanker = ToClient_GetMoneyRankAt(rankIdx)
      else
        if LifeRanking._selectedTabIdx == 12 then
          lifeRanker = ToClient_GetLocalWarRankAt(rankIdx)
        else
          if LifeRanking._selectedTabIdx == 13 then
            lifeRanker = ToClient_GetMatchRankerAt(0, listIdx)
          end
        end
      end
    end
  end
  local lifeRankerCharName = lifeRanker:getCharacterName()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  FGlobal_ChattingInput_ShowWhisper(lifeRankerCharName)
end

LifeRanking_Simpletooltips = function(isShow, contolNo)
  -- function num : 0_10 , upvalues : LifeRanking
  local control, name = nil
  if isShow == true then
    contol = (LifeRanking._tab)[contolNo]
    name = (LifeRanking._tabName)[contolNo]
    registTooltipControl(contol, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(contol, name, nil)
  else
    TooltipSimple_Hide()
  end
end

LifeRanking_Repos = function()
  -- function num : 0_11
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_LifeRanking:SetPosX((screenSizeX - Panel_LifeRanking:GetSizeX()) / 2)
  Panel_LifeRanking:SetPosY((screenSizeY - Panel_LifeRanking:GetSizeY()) / 2)
end

LifeRanking_registEventHandler = function()
  -- function num : 0_12 , upvalues : LifeRanking
  (LifeRanking._btnClose):addInputEvent("Mouse_LUp", "FGlobal_LifeRanking_Close()")
  for idx,value in pairs(LifeRanking._tab) do
    ((LifeRanking._tab)[idx]):addInputEvent("Mouse_LUp", "LifeRanking_SelectTab( " .. idx .. " )")
    ;
    ((LifeRanking._tab)[idx]):addInputEvent("Mouse_On", "LifeRanking_Simpletooltips( true, " .. idx .. " )")
    ;
    ((LifeRanking._tab)[idx]):setTooltipEventRegistFunc("LifeRanking_Simpletooltips( true, " .. idx .. ")")
    ;
    ((LifeRanking._tab)[idx]):addInputEvent("Mouse_Out", "LifeRanking_Simpletooltips( false )")
  end
end

FromClient_ResponseMatchRank_ = function()
  -- function num : 0_13 , upvalues : LifeRanking
  LifeRanking:Update()
end

FGlobal_LifeRanking_CheckEnAble = function(rankType)
  -- function num : 0_14 , upvalues : rankingTabId
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
  -- function num : 0_15 , upvalues : LifeRanking
  local rankType = nil
  if index == 0 then
    rankType = 12
  else
    if index == 1 then
      rankType = 11
    end
  end
  if rankType ~= nil then
    FGlobal_LifeRanking_Open()
    LifeRanking_SelectTab(rankType)
    for idx,value in pairs(LifeRanking._tab) do
      ((LifeRanking._tab)[idx]):SetCheck(false)
    end
    ;
    ((LifeRanking._tab)[rankType]):SetCheck(true)
  end
end

LifeRanking_registMessageHandler = function()
  -- function num : 0_16
  registerEvent("onScreenResize", "LifeRanking_Repos")
  registerEvent("FromClient_ShowLifeRank", "FromClient_ShowLifeRank")
  registerEvent("FromClient_ShowContentsRank", "FromClient_ShowContentsRank")
  registerEvent("FromClient_ResponseMatchRank", "FromClient_ResponseMatchRank_")
end

local lifeRanking_TooltipHide = function()
  -- function num : 0_17 , upvalues : tooltip
  local self = tooltip
  ;
  (self._bg):SetShow(false)
  ;
  (self._name):SetShow(false)
  ;
  (self._desc):SetShow(false)
end

local lifeRanking_TooltipShow = function(uiControl, name, desc, index)
  -- function num : 0_18 , upvalues : lifeRanking_TooltipHide, tooltip
  lifeRanking_TooltipHide()
  local self = tooltip
  ;
  (self._bg):SetShow(true)
  ;
  (self._name):SetShow(true)
  ;
  (self._desc):SetShow(true)
  ;
  (self._name):SetText(name .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_PLAYERINTRO"))
  local nameLength = (math.max)(150, (self._name):GetTextSizeX())
  ;
  (self._desc):SetSize(nameLength, (self._desc):GetTextSizeY())
  ;
  (self._desc):SetText(desc)
  ;
  (self._bg):SetSize(nameLength + 10, (self._name):GetSizeY() + (self._desc):GetTextSizeY() + 15)
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
  (self._bg):SetPosX(posX + 20)
  ;
  (self._bg):SetPosY(posY + 25)
  ;
  (self._name):SetPosX((self._bg):GetPosX() + 5)
  ;
  (self._name):SetPosY((self._bg):GetPosY() + 5)
  ;
  (self._desc):SetPosX((self._name):GetPosX())
  ;
  (self._desc):SetPosY((self._name):GetPosY() + (self._name):GetSizeY())
end

LifeRanking_Tooltip = function(index)
  -- function num : 0_19 , upvalues : lifeRanking_TooltipHide, rankerData, LifeRanking, lifeRanking_TooltipShow
  if index == nil then
    lifeRanking_TooltipHide()
    return 
  end
  local name = (rankerData[index])._name
  local desc = (rankerData[index])._desc
  local uiControl = nil
  if index == 0 then
    uiControl = LifeRanking.firstRankerName
  else
    if index == 1 then
      uiControl = LifeRanking.secondRankerName
    else
      if index == 2 then
        uiControl = LifeRanking.thirdRankerName
      else
        uiControl = (LifeRanking._listPool)[index]
      end
    end
  end
  if desc == nil or desc == "" then
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_RECRUITMENT_PLAYERINTRO_NODATA")
  end
  lifeRanking_TooltipShow(uiControl, name, desc, index)
end

LifeRanking_Initionalize()
LifeRanking_registEventHandler()
LifeRanking_registMessageHandler()

