-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\politics\panel_window_politics.luac 

-- params : ...
-- function num : 0
local PaGlobal_Window_Politics = {
_ui = {stt_title = (UI.getChildControl)(Panel_Window_Politics, "StaticText_Title"), btn_close = (UI.getChildControl)(Panel_Window_Politics, "Button_Win_Close"), btnTemplate_class = (UI.getChildControl)(Panel_Window_Politics, "RadioButton_ClassTemplate"), btn_class = nil, stc_classIcon = nil, stc_listBG = (UI.getChildControl)(Panel_Window_Politics, "Static_BG"), txt_dataRefreshing = nil, list2_visibleCandidateList = nil, btn_sortByDate = (UI.getChildControl)(Panel_Window_Politics, "Button_SortByDate"), btn_sortByVote = (UI.getChildControl)(Panel_Window_Politics, "Button_SortByVote"), btn_registCandidate = (UI.getChildControl)(Panel_Window_Politics, "Button_RegistCandidate"), btn_cancelCandidate = (UI.getChildControl)(Panel_Window_Politics, "Button_CancelCandidate"), txt_TimeLeft = (UI.getChildControl)(Panel_Window_Politics, "StaticText_TimeLeft")}
, _storedCandidateList = nil, _countOfWholeCandidate = nil, _currentClassTap = nil, _sort = nil, _depositMoney = 0, _clickedCandidate = nil, 
_SORT_BY = {REGIST_DATE_NEW_FIRST = 1, REGIST_DATE_OLD_FIRST = 2, VOTE_GAINED_DESCENDING = 3, VOTE_GAINED_ASCENDING = 4}
}
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_Class = CppEnums.ClassType
PaGlobal_Window_Politics.initialize = function(self)
  -- function num : 0_0
  ((self._ui).stt_title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_TITLE"))
  ;
  ((self._ui).btn_close):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_Close()")
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_dataRefreshing = (UI.getChildControl)((self._ui).stc_listBG, "StaticText_DataRefreshing")
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_visibleCandidateList = (UI.getChildControl)((self._ui).stc_listBG, "List2_Politics")
  ;
  ((self._ui).list2_visibleCandidateList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_Window_Politics_CandidateListControlCreate")
  ;
  ((self._ui).list2_visibleCandidateList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui).btn_sortByDate):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_sortCandidatesBy(" .. (self._SORT_BY).REGIST_DATE_NEW_FIRST .. ")")
  ;
  ((self._ui).btn_sortByDate):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_SORT_REGIST") .. " â–\188")
  ;
  ((self._ui).btn_sortByVote):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_sortCandidatesBy(" .. (self._SORT_BY).VOTE_GAINED_DESCENDING .. ")")
  ;
  ((self._ui).btn_sortByVote):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_SORT_VOTE") .. " â–\188")
  ;
  ((self._ui).btn_registCandidate):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_RegistCandidateButtonPressed()")
  ;
  ((self._ui).btn_cancelCandidate):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_CancelCandidateButtonPressed()")
  self._depositMoney = 100000000
  registerEvent("FromClient_responseListCandidate", "FromClient_Window_Politics_ListArrived")
  registerEvent("FromClient_responseRegisterCandidate", "FromClient_Window_Politics_RegistCandidateResponse")
  registerEvent("FromClient_responseCancelCandidate", "FromClient_Window_Politics_CancelCandidateResponse")
  registerEvent("FromClient_responseVoteCandidate", "FromClient_Window_Politics_VoteResponse")
end

FGlobal_Window_Politics_Open = function()
  -- function num : 0_1 , upvalues : PaGlobal_Window_Politics
  PaGlobal_Window_Politics:open()
end

politicsTest = function()
  -- function num : 0_2 , upvalues : PaGlobal_Window_Politics
  PaGlobal_Window_Politics:open()
end

PaGlobal_Window_Politics.open = function(self)
  -- function num : 0_3
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  self._currentClassTap = selfPlayer:getClassType()
  Panel_Window_Politics:SetShow(true)
  self._sort = 0
  self:initClassButtons()
  FGlobal_Window_Politics_RequestNewList()
end

PaGlobal_Window_Politics.initClassButtons = function(self)
  -- function num : 0_4
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).btn_class = {}
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_classIcon = {}
  local classCount = getPossibleClassCount()
  local xOffset = 15
  local yOffset = ((self._ui).btnTemplate_class):GetPosY()
  local rowWidth = ((self._ui).btnTemplate_class):GetSizeX() + 15
  local columnHeight = ((self._ui).btnTemplate_class):GetSizeY() + 10
  local columnMax = (math.floor)((Panel_Window_Politics:GetSizeX() - xOffset * 2) / rowWidth)
  for i = 0, classCount - 1 do
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R11 in 'UnsetPending'

    if ToClient_checkCreatePossibleClass(i) == true then
      ((self._ui).btn_class)[i] = (UI.createAndCopyBasePropertyControl)(Panel_Window_Politics, "RadioButton_ClassTemplate", Panel_Window_Politics, "RadioButton_Class_" .. i)
      ;
      (((self._ui).btn_class)[i]):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_setClassTabTo(" .. i .. " )")
      ;
      (((self._ui).btn_class)[i]):addInputEvent("Mouse_On", "FGlobal_Window_Politics_showSimpleTooltip(true, " .. i .. ")")
      ;
      (((self._ui).btn_class)[i]):addInputEvent("Mouse_Out", "FGlobal_Window_Politics_showSimpleTooltip(false)")
      -- DECOMPILER ERROR at PC93: Confused about usage of register: R11 in 'UnsetPending'

      ;
      ((self._ui).stc_classIcon)[i] = (UI.createAndCopyBasePropertyControl)(Panel_Window_Politics, "Static_ClassIconTemplate", ((self._ui).btn_class)[i], "Static_ClassIcon_" .. i)
      self:changeTextureClass(((self._ui).stc_classIcon)[i], i)
      if i == self._currentClassTap then
        (((self._ui).stc_classIcon)[i]):SetColor((Defines.Color).C_FF008AFF)
      else
        ;
        (((self._ui).stc_classIcon)[i]):SetColor((Defines.Color).C_FFEFEFEF)
      end
      ;
      (((self._ui).stc_classIcon)[i]):SetIgnore(true)
      local row = (math.floor)(i % columnMax)
      local xPos = xOffset + rowWidth * row
      ;
      (((self._ui).btn_class)[i]):SetPosX(xPos)
      if columnMax ~= 0 then
        (((self._ui).btn_class)[i]):SetPosY(yOffset + columnHeight * (math.floor)(i / columnMax))
      end
    end
  end
  ;
  (((self._ui).btn_class)[self._currentClassTap]):SetCheck(true)
  local rowCount = (math.ceil)(classCount / columnMax)
  local classButtonsYArea = rowWidth * rowCount + yOffset
  ;
  ((self._ui).stc_listBG):SetPosY(classButtonsYArea + 5)
  Panel_Window_Politics:SetSize(Panel_Window_Politics:GetSizeX(), classButtonsYArea + 53 + ((self._ui).stc_listBG):GetSizeY())
  Panel_Window_Politics:SetPosY((getScreenSizeY() - Panel_Window_Politics:GetSizeY()) / 2)
  ;
  ((self._ui).btn_registCandidate):ComputePos()
  ;
  ((self._ui).btn_cancelCandidate):ComputePos()
  ;
  ((self._ui).txt_TimeLeft):ComputePos()
  ;
  ((self._ui).btn_sortByDate):ComputePos()
  ;
  ((self._ui).btn_sortByVote):ComputePos()
end

FGlobal_Window_Politics_RequestNewList = function()
  -- function num : 0_5 , upvalues : PaGlobal_Window_Politics
  local self = PaGlobal_Window_Politics
  ;
  (((self._ui).list2_visibleCandidateList):getElementManager()):clearKey()
  ;
  ((self._ui).txt_dataRefreshing):SetShow(true)
  ;
  ((self._ui).txt_dataRefreshing):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_WAITING_FOR_LIST_DESC"))
  ;
  ((self._ui).btn_sortByDate):SetEnable(false)
  ;
  ((self._ui).btn_sortByDate):SetMonoTone(true)
  ;
  ((self._ui).btn_sortByVote):SetEnable(false)
  ;
  ((self._ui).btn_sortByVote):SetMonoTone(true)
  ;
  ((self._ui).btn_registCandidate):SetEnable(false)
  ;
  ((self._ui).btn_registCandidate):SetMonoTone(true)
  ;
  ((self._ui).btn_cancelCandidate):SetEnable(false)
  ;
  ((self._ui).btn_cancelCandidate):SetMonoTone(true)
  ToClient_requestCandidateList()
end

FromClient_Window_Politics_ListArrived = function()
  -- function num : 0_6 , upvalues : PaGlobal_Window_Politics
  local self = PaGlobal_Window_Politics
  ;
  ((self._ui).txt_dataRefreshing):SetShow(false)
  self:refreshData()
  self:refreshView()
  ;
  ((self._ui).btn_sortByDate):SetEnable(true)
  ;
  ((self._ui).btn_sortByVote):SetEnable(true)
  ;
  ((self._ui).btn_sortByDate):SetMonoTone(false)
  ;
  ((self._ui).btn_sortByVote):SetMonoTone(false)
  ;
  ((self._ui).btn_registCandidate):SetEnable(true)
  ;
  ((self._ui).btn_cancelCandidate):SetEnable(true)
  ;
  ((self._ui).btn_registCandidate):SetMonoTone(false)
  ;
  ((self._ui).btn_cancelCandidate):SetMonoTone(false)
end

PaGlobal_Window_Politics.refreshData = function(self)
  -- function num : 0_7
  self._storedCandidateList = {}
  self._countOfWholeCandidate = ToClient_getCandidateListSize()
  for i = 1, self._countOfWholeCandidate do
    local queriedCandidateInfoWrapper = ToClient_getCandidateInfo(i - 1)
    local candidateClass = queriedCandidateInfoWrapper:getClassType()
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R7 in 'UnsetPending'

    if candidateClass ~= nil then
      if (self._storedCandidateList)[candidateClass] == nil then
        (self._storedCandidateList)[candidateClass] = {}
      end
      local candidateInfo = {index = i - 1, registerTime = queriedCandidateInfoWrapper:getRegisterTime(), userNo = queriedCandidateInfoWrapper:getUserNo(), userCharacterNo = queriedCandidateInfoWrapper:getCharacterNo(), classType = candidateClass, voteCount = queriedCandidateInfoWrapper:getVoteCount(), characterName = queriedCandidateInfoWrapper:getCharacterName(), introduceSelf = queriedCandidateInfoWrapper:getIntroduction(), level = queriedCandidateInfoWrapper:getLevel(), guildNo = queriedCandidateInfoWrapper:getGuildNo()}
      -- DECOMPILER ERROR at PC57: Confused about usage of register: R8 in 'UnsetPending'

      ;
      ((self._storedCandidateList)[candidateClass])[#(self._storedCandidateList)[candidateClass] + 1] = candidateInfo
    end
  end
  if ToClient_IsDevelopment() then
    for i = 1, 10000 do
      local candidateClass = getRandomValue(0, getPossibleClassCount())
      -- DECOMPILER ERROR at PC82: Confused about usage of register: R6 in 'UnsetPending'

      if candidateClass ~= nil then
        if (self._storedCandidateList)[candidateClass] == nil then
          (self._storedCandidateList)[candidateClass] = (Array.new)()
        end
        local candidateInfo = {registerTime = 0, userNo = nil, userCharacterNo = nil, classType = candidateClass, voteCount = getRandomValue(0, 100000000), characterName = "dummy " .. candidateClass .. " Candidate" .. i, introduceSelf = "self introduce text. length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- length test ---- ", level = 61, guildNo = nil}
        -- DECOMPILER ERROR at PC108: Confused about usage of register: R7 in 'UnsetPending'

        ;
        ((self._storedCandidateList)[candidateClass])[#(self._storedCandidateList)[candidateClass] + 1] = candidateInfo
      end
    end
  end
end

PaGlobal_Window_Politics.refreshView = function(self)
  -- function num : 0_8
  (((self._ui).list2_visibleCandidateList):getElementManager()):clearKey()
  if self._storedCandidateList == nil or (self._storedCandidateList)[self._currentClassTap] == nil or #(self._storedCandidateList)[self._currentClassTap] < 1 then
    ((self._ui).txt_dataRefreshing):SetShow(true)
    ;
    ((self._ui).txt_dataRefreshing):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_NO_CANDIDATE_FOUND"))
  else
    ;
    ((self._ui).txt_dataRefreshing):SetShow(false)
    local idx = 0
    for k,v in pairs((self._storedCandidateList)[self._currentClassTap]) do
      (((self._ui).list2_visibleCandidateList):getElementManager()):pushKey(k)
      idx = idx + 1
    end
  end
end

FGlobal_Window_Politics_setClassTabTo = function(classNum)
  -- function num : 0_9 , upvalues : PaGlobal_Window_Politics
  local self = PaGlobal_Window_Politics
  if classNum ~= self._currentClassTap then
    self._currentClassTap = classNum
    self:refreshView()
    for i = 0, #(self._ui).btn_class do
      if i == classNum then
        (((self._ui).stc_classIcon)[i]):SetColor((Defines.Color).C_FF008AFF)
      else
        ;
        (((self._ui).stc_classIcon)[i]):SetColor((Defines.Color).C_FFEFEFEF)
      end
    end
  else
    do
      do return  end
    end
  end
end

FGlobal_Window_Politics_CandidateListControlCreate = function(control, key)
  -- function num : 0_10 , upvalues : PaGlobal_Window_Politics
  local self = PaGlobal_Window_Politics
  local stc_bg = (UI.getChildControl)(control, "Static_1")
  local txt_guildName = (UI.getChildControl)(stc_bg, "StaticText_GuildName")
  local txt_familyName = (UI.getChildControl)(stc_bg, "StaticText_FamilyNameText")
  local txt_charName = (UI.getChildControl)(stc_bg, "StaticText_CharName")
  local stc_charImage = (UI.getChildControl)(stc_bg, "Static_CharacterImage")
  local txt_level = (UI.getChildControl)(stc_bg, "StaticText_Level")
  local txt_class = (UI.getChildControl)(stc_bg, "StaticText_ClassText")
  local txt_voteGained = (UI.getChildControl)(stc_bg, "StaticText_VoteGained")
  local btn_vote = (UI.getChildControl)(stc_bg, "Button_Vote")
  local txt_introduceBG = (UI.getChildControl)(stc_bg, "Static_IntroduceBG")
  local txt_introduce = (UI.getChildControl)(txt_introduceBG, "StaticText_Introduce")
  local candidateInfo = ((self._storedCandidateList)[self._currentClassTap])[Int64toInt32(key)]
  if candidateInfo == nil then
    return 
  end
  if candidateInfo.userCharacterNo ~= nil then
    btn_vote:addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_VoteButtonPressed(" .. candidateInfo.index .. ")")
  end
  _PA_LOG("ë°•ë²”ì¤\128", "candidateInfo.userCharacterNo : " .. tostring(candidateInfo.userCharacterNo))
  if candidateInfo.guildNo ~= nil then
    local guildInfoWrapper = ToClient_GetGuildInfoWrapperByGuildNo(candidateInfo.guildNo)
    if guildInfoWrapper ~= nil then
      txt_guildName:SetShow(true)
      txt_guildName:SetText("<" .. guildInfoWrapper:getName() .. ">" or "")
    end
  else
    do
      txt_guildName:SetShow(false)
      txt_level:SetText(candidateInfo.level or "")
      txt_class:SetText((CppEnums.ClassType2String)[self._currentClassTap])
      txt_charName:SetText(candidateInfo.characterName or "")
      txt_familyName:SetShow(false)
      txt_voteGained:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_POLITICS_VOTE_COUNT", "count", candidateInfo.voteCount or "0"))
      txt_introduce:SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
      txt_introduce:setLineCountByLimitAutoWrap((math.floor)(txt_introduce:GetSizeY() / txt_introduce:GetTextSizeY()))
      txt_introduce:SetText(candidateInfo.introduceSelf or "")
    end
  end
end

FGlobal_Window_Politics_sortCandidatesBy = function(sortType)
  -- function num : 0_11 , upvalues : PaGlobal_Window_Politics
  local self = PaGlobal_Window_Politics
  if sortType == (self._SORT_BY).REGIST_DATE_NEW_FIRST then
    self._sort = (self._SORT_BY).REGIST_DATE_NEW_FIRST
    ;
    ((self._ui).btn_sortByDate):removeInputEvent("Mouse_LUp")
    ;
    ((self._ui).btn_sortByDate):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_sortCandidatesBy(" .. (self._SORT_BY).REGIST_DATE_OLD_FIRST .. ")")
    ;
    ((self._ui).btn_sortByDate):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_SORT_REGIST") .. " â–\188")
  else
    if sortType == (self._SORT_BY).REGIST_DATE_OLD_FIRST then
      self._sort = (self._SORT_BY).REGIST_DATE_OLD_FIRST
      ;
      ((self._ui).btn_sortByDate):removeInputEvent("Mouse_LUp")
      ;
      ((self._ui).btn_sortByDate):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_sortCandidatesBy(" .. (self._SORT_BY).REGIST_DATE_NEW_FIRST .. ")")
      ;
      ((self._ui).btn_sortByDate):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_SORT_REGIST") .. " â–\178")
    else
      if sortType == (self._SORT_BY).VOTE_GAINED_DESCENDING then
        self._sort = (self._SORT_BY).VOTE_GAINED_DESCENDING
        ;
        ((self._ui).btn_sortByVote):removeInputEvent("Mouse_LUp")
        ;
        ((self._ui).btn_sortByVote):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_sortCandidatesBy(" .. (self._SORT_BY).VOTE_GAINED_ASCENDING .. ")")
        ;
        ((self._ui).btn_sortByVote):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_SORT_VOTE") .. " â–\188")
      else
        if sortType == (self._SORT_BY).VOTE_GAINED_ASCENDING then
          self._sort = (self._SORT_BY).VOTE_GAINED_ASCENDING
          ;
          ((self._ui).btn_sortByVote):removeInputEvent("Mouse_LUp")
          ;
          ((self._ui).btn_sortByVote):addInputEvent("Mouse_LUp", "FGlobal_Window_Politics_sortCandidatesBy(" .. (self._SORT_BY).VOTE_GAINED_DESCENDING .. ")")
          ;
          ((self._ui).btn_sortByVote):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_SORT_VOTE") .. " â–\178")
        end
      end
    end
  end
  local sortF = nil
  if self._sort == (self._SORT_BY).REGIST_DATE_NEW_FIRST then
    sortF = FGlobal_Window_Politics_sortByRegisterTime
  else
    if self._sort == (self._SORT_BY).REGIST_DATE_OLD_FIRST then
      sortF = FGlobal_Window_Politics_sortByRegisterTimeRev
    else
      if self._sort == (self._SORT_BY).VOTE_GAINED_DESCENDING then
        sortF = FGlobal_Window_Politics_sortByVoteGained
      else
        if self._sort == (self._SORT_BY).VOTE_GAINED_ASCENDING then
          sortF = FGlobal_Window_Politics_sortByVoteGainedRev
        end
      end
    end
  end
  if sortF ~= nil then
    (table.sort)((self._storedCandidateList)[self._currentClassTap], sortF)
  end
  self:refreshView()
end

FGlobal_Window_Politics_sortByRegisterTime = function(ii, jj)
  -- function num : 0_12
  do return jj.registerTime < ii.registerTime end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_Window_Politics_sortByVoteGained = function(ii, jj)
  -- function num : 0_13
  do return jj.voteCount < ii.voteCount end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_Window_Politics_sortByRegisterTimeRev = function(ii, jj)
  -- function num : 0_14
  do return ii.registerTime < jj.registerTime end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_Window_Politics_sortByVoteGainedRev = function(ii, jj)
  -- function num : 0_15
  do return ii.voteCount < jj.voteCount end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_Window_Politics_RegistCandidateButtonPressed = function()
  -- function num : 0_16 , upvalues : PaGlobal_Window_Politics
  local MessageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_REGIST_NOTICE_TITLE"), content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_POLITICS_REGIST_NOTICE_DESC", "amount", tostring(makeDotMoney(toInt64(0, PaGlobal_Window_Politics._depositMoney)))), functionYes = FGlobal_Window_Politics_RegistCandidate, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(MessageBoxData)
end

FGlobal_Window_Politics_RegistCandidate = function()
  -- function num : 0_17
  ToClient_registerCandidate()
end

FromClient_Window_Politics_RegistCandidateResponse = function(isSuccess)
  -- function num : 0_18
  local Message = ""
  if isSuccess then
    Message = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_REGIST_CANDIDATE_SUCC")
  else
    Message = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_REGIST_CANDIDATE_FAIL")
  end
  local MessageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_WAITING_FOR_LIST_TITLE"), content = Message, functionApply = FGlobal_Window_Politics_RequestNewList, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(MessageBoxData)
end

FGlobal_Window_Politics_CancelCandidateButtonPressed = function()
  -- function num : 0_19
  ToClient_cancelCandidate()
end

FromClient_Window_Politics_CancelCandidateResponse = function(isSuccess)
  -- function num : 0_20
  local Message = ""
  if isSuccess then
    Message = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_CANCEL_CANDIDATE_SUCC")
  else
    Message = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_CANCEL_CANDIDATE_FAIL")
  end
  local MessageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_WAITING_FOR_LIST_TITLE"), content = Message, functionApply = FGlobal_Window_Politics_RequestNewList, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(MessageBoxData)
end

FGlobal_Window_Politics_VoteButtonPressed = function(index)
  -- function num : 0_21 , upvalues : PaGlobal_Window_Politics
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Window_Politics._clickedCandidate = index
  local MessageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_VOTE_NOTE_TITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_VOTE_NOTE_DESC"), functionYes = FGlobal_Window_Politics_Vote, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(MessageBoxData)
end

FGlobal_Window_Politics_Vote = function()
  -- function num : 0_22 , upvalues : PaGlobal_Window_Politics
  clickedCandidateWrapper = ToClient_getCandidateInfo(PaGlobal_Window_Politics._clickedCandidate)
  ToClient_voteCandidate(clickedCandidateWrapper:getCharacterNo())
end

FromClient_Window_Politics_VoteResponse = function(isSuccess)
  -- function num : 0_23
  local Message = ""
  if isSuccess then
    Message = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_VOTE_SUCC")
  else
    Message = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_VOTE_FAIL")
  end
  local MessageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_POLITICS_WAITING_FOR_LIST_TITLE"), content = Message, functionApply = FGlobal_Window_Politics_RequestNewList, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(MessageBoxData)
end

FGlobal_Window_Politics_Close = function()
  -- function num : 0_24 , upvalues : PaGlobal_Window_Politics
  PaGlobal_Window_Politics:btn_close()
end

PaGlobal_Window_Politics.btn_close = function(self)
  -- function num : 0_25
  Panel_Window_Politics:SetShow(false)
end

PaGlobal_Window_Politics.changeTextureClass = function(self, control, classType)
  -- function num : 0_26 , upvalues : UI_Class
  control:ChangeTextureInfoName("Renewal/UI_Icon/PC_Icon_ClassSymbol_00.dds")
  local x1, y1, x2, y2 = nil, nil, nil, nil
  if classType == UI_Class.ClassType_Warrior then
    x1 = setTextureUV_Func(control, 2, 2, 43, 43)
  else
    -- DECOMPILER ERROR at PC31: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC32: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC33: Overwrote pending register: R4 in 'AssignReg'

    if classType == UI_Class.ClassType_Ranger then
      x1 = setTextureUV_Func(control, 44, 2, 85, 43)
    else
      -- DECOMPILER ERROR at PC47: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC48: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

      if classType == UI_Class.ClassType_Sorcerer then
        x1 = setTextureUV_Func(control, 86, 2, 127, 43)
      else
        -- DECOMPILER ERROR at PC63: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC64: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC65: Overwrote pending register: R4 in 'AssignReg'

        if classType == UI_Class.ClassType_Lahn then
          x1 = setTextureUV_Func(control, 128, 86, 169, 127)
        else
          -- DECOMPILER ERROR at PC79: Overwrote pending register: R6 in 'AssignReg'

          -- DECOMPILER ERROR at PC80: Overwrote pending register: R5 in 'AssignReg'

          -- DECOMPILER ERROR at PC81: Overwrote pending register: R4 in 'AssignReg'

          if classType == UI_Class.ClassType_Giant then
            x1 = setTextureUV_Func(control, 128, 2, 169, 43)
          else
            -- DECOMPILER ERROR at PC95: Overwrote pending register: R6 in 'AssignReg'

            -- DECOMPILER ERROR at PC96: Overwrote pending register: R5 in 'AssignReg'

            -- DECOMPILER ERROR at PC97: Overwrote pending register: R4 in 'AssignReg'

            if classType == UI_Class.ClassType_Tamer then
              x1 = setTextureUV_Func(control, 170, 2, 211, 43)
            else
              -- DECOMPILER ERROR at PC111: Overwrote pending register: R6 in 'AssignReg'

              -- DECOMPILER ERROR at PC112: Overwrote pending register: R5 in 'AssignReg'

              -- DECOMPILER ERROR at PC113: Overwrote pending register: R4 in 'AssignReg'

              if classType == UI_Class.ClassType_Combattant then
                x1 = setTextureUV_Func(control, 2, 86, 43, 127)
              else
                -- DECOMPILER ERROR at PC127: Overwrote pending register: R6 in 'AssignReg'

                -- DECOMPILER ERROR at PC128: Overwrote pending register: R5 in 'AssignReg'

                -- DECOMPILER ERROR at PC129: Overwrote pending register: R4 in 'AssignReg'

                if classType == UI_Class.ClassType_CombattantWomen then
                  x1 = setTextureUV_Func(control, 44, 86, 85, 127)
                else
                  -- DECOMPILER ERROR at PC143: Overwrote pending register: R6 in 'AssignReg'

                  -- DECOMPILER ERROR at PC144: Overwrote pending register: R5 in 'AssignReg'

                  -- DECOMPILER ERROR at PC145: Overwrote pending register: R4 in 'AssignReg'

                  if classType == UI_Class.ClassType_BladeMaster then
                    x1 = setTextureUV_Func(control, 212, 2, 253, 43)
                  else
                    -- DECOMPILER ERROR at PC159: Overwrote pending register: R6 in 'AssignReg'

                    -- DECOMPILER ERROR at PC160: Overwrote pending register: R5 in 'AssignReg'

                    -- DECOMPILER ERROR at PC161: Overwrote pending register: R4 in 'AssignReg'

                    if classType == UI_Class.ClassType_BladeMasterWomen then
                      x1 = setTextureUV_Func(control, 212, 44, 253, 85)
                    else
                      -- DECOMPILER ERROR at PC175: Overwrote pending register: R6 in 'AssignReg'

                      -- DECOMPILER ERROR at PC176: Overwrote pending register: R5 in 'AssignReg'

                      -- DECOMPILER ERROR at PC177: Overwrote pending register: R4 in 'AssignReg'

                      if classType == UI_Class.ClassType_Valkyrie then
                        x1 = setTextureUV_Func(control, 2, 44, 43, 85)
                      else
                        -- DECOMPILER ERROR at PC191: Overwrote pending register: R6 in 'AssignReg'

                        -- DECOMPILER ERROR at PC192: Overwrote pending register: R5 in 'AssignReg'

                        -- DECOMPILER ERROR at PC193: Overwrote pending register: R4 in 'AssignReg'

                        if classType == UI_Class.ClassType_NinjaWomen then
                          x1 = setTextureUV_Func(control, 170, 44, 211, 84)
                        else
                          -- DECOMPILER ERROR at PC207: Overwrote pending register: R6 in 'AssignReg'

                          -- DECOMPILER ERROR at PC208: Overwrote pending register: R5 in 'AssignReg'

                          -- DECOMPILER ERROR at PC209: Overwrote pending register: R4 in 'AssignReg'

                          if classType == UI_Class.ClassType_NinjaMan then
                            x1 = setTextureUV_Func(control, 128, 44, 169, 85)
                          else
                            -- DECOMPILER ERROR at PC223: Overwrote pending register: R6 in 'AssignReg'

                            -- DECOMPILER ERROR at PC224: Overwrote pending register: R5 in 'AssignReg'

                            -- DECOMPILER ERROR at PC225: Overwrote pending register: R4 in 'AssignReg'

                            if classType == UI_Class.ClassType_DarkElf then
                              x1 = setTextureUV_Func(control, 84, 84, 127, 127)
                            else
                              -- DECOMPILER ERROR at PC239: Overwrote pending register: R6 in 'AssignReg'

                              -- DECOMPILER ERROR at PC240: Overwrote pending register: R5 in 'AssignReg'

                              -- DECOMPILER ERROR at PC241: Overwrote pending register: R4 in 'AssignReg'

                              if classType == UI_Class.ClassType_Wizard then
                                x1 = setTextureUV_Func(control, 44, 44, 85, 85)
                              else
                                -- DECOMPILER ERROR at PC255: Overwrote pending register: R6 in 'AssignReg'

                                -- DECOMPILER ERROR at PC256: Overwrote pending register: R5 in 'AssignReg'

                                -- DECOMPILER ERROR at PC257: Overwrote pending register: R4 in 'AssignReg'

                                if classType == UI_Class.ClassType_WizardWomen then
                                  x1 = setTextureUV_Func(control, 84, 44, 127, 85)
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
  if classType ~= nil then
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
  end
end

FGlobal_Window_Politics_showSimpleTooltip = function(isShow, classNum)
  -- function num : 0_27 , upvalues : PaGlobal_Window_Politics
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  TooltipSimple_Show(((PaGlobal_Window_Politics._ui).btn_class)[classNum], (CppEnums.ClassType2String)[classNum])
end

FromClient_luaLoadComplete_Panel_Window_Politics = function()
  -- function num : 0_28 , upvalues : PaGlobal_Window_Politics
  PaGlobal_Window_Politics:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_Politics")

