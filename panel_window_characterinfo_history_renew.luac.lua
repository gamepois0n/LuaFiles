-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\panel_window_characterinfo_history_renew.luac 

-- params : ...
-- function num : 0
local _mainPanel = Panel_Window_CharacterInfo_Renew
local _panel = Panel_Window_CharacterInfo_History_Renew
local CharacterHistoryInfo = {
_ui = {stc_MonthTapBg = (UI.getChildControl)(_panel, "Static_Month_Tap"), frame_HistoryList = (UI.getChildControl)(_panel, "Frame_Title_List"), frameBG = nil}
, defaultFrameBG_CharacterInfo_History = nil, 
currentValue = {_year = ToClient_GetThisYear(), _month = ToClient_GetThisMonth(), _day = ToClient_GetToday(), _myHistory = 0, _guildHistory = 1}
, _circleRightPosModification = 51, _circleLeftPosModification = -80, _datePosModification = 100, _historyPosModification = 95, 
_dayRightHistoryValue = {}
, _historyRightValueLength = 0, 
_dayLeftHistoryValue = {}
, _historyLeftValueLength = 0, 
_dayCircleValue = {}
, 
_dayDateValue = {}
, _dateValueLength = 0, _lastShowedYear = ToClient_GetThisYear(), _lastShowedMonth = ToClient_GetThisMonth()}
CharacterHistoryInfo.init = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_Year = (UI.getChildControl)((self._ui).stc_MonthTapBg, "StaticText_Year")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_LB = (UI.getChildControl)((self._ui).stc_MonthTapBg, "Static_LT_ConsoleUI")
  ;
  ((self._ui).stc_LB):addInputEvent("Mouse_LUp", "InputMLUp_CharacterHistoryInfo_DecreaseMonth()")
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_RB = (UI.getChildControl)((self._ui).stc_MonthTapBg, "Static_RT_ConsoleUI")
  ;
  ((self._ui).stc_RB):addInputEvent("Mouse_LUp", "InputMLUp_CharacterHistoryInfo_IncreaseMonth()")
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Month = {}
  for ii = 1, 12 do
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).radioButton_Month)[ii] = (UI.getChildControl)((self._ui).stc_MonthTapBg, "RadioButton_Month" .. ii)
    ;
    (((self._ui).radioButton_Month)[ii]):addInputEvent("Mouse_LUp", "InputMLUp_CharacterHistoryInfo_TapToOpen(" .. ii .. ")")
    ;
    (((self._ui).radioButton_Month)[ii]):SetFontColor((Defines.Color).C_FF444444)
  end
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_Content = ((self._ui).frame_HistoryList):GetFrameContent()
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Line_V = (UI.getChildControl)((self._ui).frame_Content, "Static_Line_Vertical")
  -- DECOMPILER ERROR at PC94: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_HistroyLine_R = (UI.getChildControl)((self._ui).frame_Content, "StaticText_HistoryLine_Right")
  -- DECOMPILER ERROR at PC102: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_HistroyLine_L = (UI.getChildControl)((self._ui).frame_Content, "StaticText_HistoryLine_Left")
  -- DECOMPILER ERROR at PC110: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Date_L = (UI.getChildControl)((self._ui).frame_Content, "StaticText_Date_Left")
  -- DECOMPILER ERROR at PC118: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Date_R = (UI.getChildControl)((self._ui).frame_Content, "StaticText_Date_Right")
  -- DECOMPILER ERROR at PC126: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Circle_L = (UI.getChildControl)((self._ui).frame_Content, "Static_Circle_Left")
  -- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Line_H_L = (UI.getChildControl)((self._ui).stc_Circle_L, "Static_Line_Horizon_Left")
  -- DECOMPILER ERROR at PC142: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Circle_R = (UI.getChildControl)((self._ui).frame_Content, "Static_Circle_Right")
  -- DECOMPILER ERROR at PC150: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Line_H_R = (UI.getChildControl)((self._ui).stc_Circle_R, "Static_Line_Horizon_Right")
  -- DECOMPILER ERROR at PC158: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_VScroll = (UI.getChildControl)((self._ui).frame_HistoryList, "Frame_VerticalScroll")
  -- DECOMPILER ERROR at PC166: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frameBG = (UI.getChildControl)((self._ui).frame_Content, "Static_FrameContentBG")
  ;
  ((self._ui).frameBG):SetIgnore(false)
  ;
  ((self._ui).stc_Line_V):SetShow(false)
  ;
  ((self._ui).txt_HistroyLine_R):SetShow(false)
  ;
  ((self._ui).txt_HistroyLine_L):SetShow(false)
  ;
  ((self._ui).txt_Date_L):SetShow(false)
  ;
  ((self._ui).txt_Date_R):SetShow(false)
  ;
  ((self._ui).stc_Circle_L):SetShow(false)
  ;
  ((self._ui).stc_Circle_R):SetShow(false)
end

FromClient_CharacterHistoryInfo_updateInfo = function()
  -- function num : 0_1 , upvalues : CharacterHistoryInfo
  if CharacterHistoryInfo == nil then
    return 
  end
  self = CharacterHistoryInfo
  self:updateInfo((self.currentValue)._year, (self.currentValue)._month)
end

CharacterHistoryInfo.updateInfo = function(self, indexYear, indexMonth)
  -- function num : 0_2
  local _journalListCount = ToClient_GetJournalListCount(indexYear, indexMonth, (self.currentValue)._myHistory)
  if _journalListCount <= 0 then
    if indexYear == ToClient_GetThisYear() and indexMonth == ToClient_GetThisMonth() then
      do return false end
      local _historyRightValueIdx = 0
      local _historyLeftValueIdx = 0
      local _dateValueIdx = 0
      local _dayIndex = nil
      local _recvJournal = {}
      local _txtYAxis = 40
      local _isHistoryLeftSide = true
      local _isFirstHistory = true
      ;
      ((self._ui).txt_Year):SetText(indexYear)
      for _month = 1, 12 do
        (((self._ui).radioButton_Month)[_month]):SetFontColor((Defines.Color).C_FF444444)
      end
      ;
      (((self._ui).radioButton_Month)[indexMonth]):SetFontColor((Defines.Color).C_FFEEEEEE)
      local _thisYear = ToClient_GetThisYear()
      local _thisMonth = ToClient_GetThisMonth()
      local _today = ToClient_GetToday()
      for _journalReadingIndex = _journalListCount - 1, 0, -1 do
        _recvJournal = ToClient_GetJournal(indexYear, indexMonth, (self.currentValue)._myHistory, _journalReadingIndex)
        if _thisYear > indexYear or _thisMonth > indexMonth or _today >= _recvJournal:getJournalDay() or _recvJournal:getJournalDay() ~= _dayIndex then
          _dayIndex = _recvJournal:getJournalDay()
          if _isFirstHistory == true then
            _isHistoryLeftSide = true
            _isFirstHistory = false
          else
            _isHistoryLeftSide = not _isHistoryLeftSide
            _txtYAxis = _txtYAxis + 100
          end
          if self._dateValueLength <= _dateValueIdx then
            if _isHistoryLeftSide == true then
              local _dayDateTitle = (UI.createAndCopyBasePropertyControl)((self._ui).frame_Content, "StaticText_Date_Left", (self._ui).frame_Content, "StaticText_Date_Title" .. "no" .. self._dateValueLength)
              -- DECOMPILER ERROR at PC112: Confused about usage of register: R20 in 'UnsetPending'

              ;
              (self._dayDateValue)[_dateValueIdx] = _dayDateTitle
              ;
              ((self._dayDateValue)[_dateValueIdx]):SetAutoResize(true)
              ;
              ((self._dayDateValue)[_dateValueIdx]):SetText(tostring(_recvJournal:getJournalMonth()) .. "ì›\148 " .. _recvJournal:getJournalDay() .. "ì\188")
              ;
              ((self._dayDateValue)[_dateValueIdx]):SetPosX(((self._ui).stc_Line_V):GetPosX() - ((self._dayDateValue)[_dateValueIdx]):GetSizeX() - self._datePosModification)
              local _dayCircle = (UI.createAndCopyBasePropertyControl)((self._ui).frame_Content, "Static_Circle_Left", (self._ui).frame_Content, "Static_Circle_Left_Date" .. self._dateValueLength)
              local _dayHorizonLine = (UI.createAndCopyBasePropertyControl)((self._ui).stc_Circle_L, "Static_Line_Horizon_Left", _dayCircle, "Static_Line_Horizon_Left_Date" .. self._dateValueLength)
              -- DECOMPILER ERROR at PC168: Confused about usage of register: R22 in 'UnsetPending'

              ;
              (self._dayCircleValue)[_dateValueIdx] = _dayCircle
              ;
              ((self._dayCircleValue)[_dateValueIdx]):SetPosX(((self._ui).stc_Line_V):GetPosX() + self._circleLeftPosModification)
              self._dateValueLength = self._dateValueLength + 1
            else
              do
                local _dayDateTitle = (UI.createAndCopyBasePropertyControl)((self._ui).frame_Content, "StaticText_Date_Right", (self._ui).frame_Content, "StaticText_Date_Title" .. "no" .. self._dateValueLength)
                -- DECOMPILER ERROR at PC196: Confused about usage of register: R20 in 'UnsetPending'

                ;
                (self._dayDateValue)[_dateValueIdx] = _dayDateTitle
                ;
                ((self._dayDateValue)[_dateValueIdx]):SetAutoResize(true)
                ;
                ((self._dayDateValue)[_dateValueIdx]):SetText(tostring(_recvJournal:getJournalMonth()) .. "ì›\148 " .. _recvJournal:getJournalDay() .. "ì\188")
                ;
                ((self._dayDateValue)[_dateValueIdx]):SetPosX(((self._ui).stc_Line_V):GetPosX() + self._datePosModification)
                local _dayCircle = (UI.createAndCopyBasePropertyControl)((self._ui).frame_Content, "Static_Circle_Right", (self._ui).frame_Content, "Static_Circle_Right_Date" .. self._dateValueLength)
                do
                  local _dayHorizonLine = (UI.createAndCopyBasePropertyControl)((self._ui).stc_Circle_R, "Static_Line_Horizon_Right", _dayCircle, "Static_Line_Horizon_Right_Date" .. self._dateValueLength)
                  -- DECOMPILER ERROR at PC247: Confused about usage of register: R22 in 'UnsetPending'

                  ;
                  (self._dayCircleValue)[_dateValueIdx] = _dayCircle
                  ;
                  ((self._dayCircleValue)[_dateValueIdx]):SetPosX(((self._ui).stc_Line_V):GetPosX() + self._circleRightPosModification)
                  self._dateValueLength = self._dateValueLength + 1
                  ;
                  ((self._dayDateValue)[_dateValueIdx]):SetText(tostring(_recvJournal:getJournalMonth()) .. "ì›\148 " .. _recvJournal:getJournalDay() .. "ì\188")
                  ;
                  ((self._dayDateValue)[_dateValueIdx]):SetPosY(_txtYAxis - 7)
                  ;
                  ((self._dayDateValue)[_dateValueIdx]):SetShow(true)
                  ;
                  ((self._dayCircleValue)[_dateValueIdx]):SetPosY(_txtYAxis)
                  ;
                  ((self._dayCircleValue)[_dateValueIdx]):SetShow(true)
                  _dateValueIdx = _dateValueIdx + 1
                  _txtYAxis = _txtYAxis + 45
                  local _historyValue = nil
                  if _isHistoryLeftSide == true then
                    do
                      if (self._dayLeftHistoryValue)[_historyLeftValueIdx] == nil then
                        local _dayHistoryLine = (UI.createAndCopyBasePropertyControl)((self._ui).frame_Content, "StaticText_HistoryLine_Left", (self._ui).frame_Content, "StaticText_HistoryLine_LeftNo" .. self._historyLeftValueLength)
                        -- DECOMPILER ERROR at PC315: Confused about usage of register: R21 in 'UnsetPending'

                        ;
                        (self._dayLeftHistoryValue)[_historyLeftValueIdx] = _dayHistoryLine
                        self._historyLeftValueLength = self._historyLeftValueLength + 1
                      end
                      _historyValue = (self._dayLeftHistoryValue)[_historyLeftValueIdx]
                      _historyValue:SetText(tostring(_recvJournal:getName()) .. " Â·")
                      _historyValue:SetPosX(((self._ui).stc_Line_V):GetPosX() - _historyValue:GetSizeX() - self._historyPosModification)
                      _historyLeftValueIdx = _historyLeftValueIdx + 1
                      do
                        do
                          if (self._dayRightHistoryValue)[_historyRightValueIdx] == nil then
                            local _dayHistoryLine = (UI.createAndCopyBasePropertyControl)((self._ui).frame_Content, "StaticText_HistoryLine_Right", (self._ui).frame_Content, "StaticText_HistoryLine_RightNo" .. self._historyRightValueLength)
                            -- DECOMPILER ERROR at PC358: Confused about usage of register: R21 in 'UnsetPending'

                            ;
                            (self._dayRightHistoryValue)[_historyRightValueIdx] = _dayHistoryLine
                            self._historyRightValueLength = self._historyRightValueLength + 1
                          end
                          _historyValue = (self._dayRightHistoryValue)[_historyRightValueIdx]
                          _historyValue:SetText("Â· " .. tostring(_recvJournal:getName()))
                          _historyValue:SetPosX(((self._ui).stc_Line_V):GetPosX() + self._historyPosModification)
                          _historyRightValueIdx = _historyRightValueIdx + 1
                          _historyValue:SetAutoResize(true)
                          _historyValue:SetPosY(_txtYAxis)
                          _historyValue:SetIgnore(true)
                          _historyValue:SetShow(true)
                          _txtYAxis = _txtYAxis + 30
                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC394: LeaveBlock: unexpected jumping out IF_STMT

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
      if _dateValueIdx < self._dateValueLength then
        for _earseIndex = _dateValueIdx, self._dateValueLength - 1 do
          ((self._dayCircleValue)[_earseIndex]):SetShow(false)
          ;
          ((self._dayDateValue)[_earseIndex]):SetShow(false)
        end
      end
      do
        if _historyRightValueIdx < self._historyRightValueLength then
          for _earseIndex = _historyRightValueIdx, self._historyRightValueLength - 1 do
            ((self._dayRightHistoryValue)[_earseIndex]):SetShow(false)
          end
        end
        do
          if _historyLeftValueIdx < self._historyLeftValueLength then
            for _earseIndex = _historyLeftValueIdx, self._historyLeftValueLength - 1 do
              ((self._dayLeftHistoryValue)[_earseIndex]):SetShow(false)
            end
          end
          do
            if (self._dayCircleValue)[_dateValueIdx - 1] == nil then
              ((self._ui).stc_Line_V):SetShow(false)
            else
              ;
              ((self._ui).stc_Line_V):SetSize(((self._ui).stc_Line_V):GetSizeX(), ((self._dayCircleValue)[_dateValueIdx - 1]):GetPosY() + 16)
              ;
              ((self._ui).stc_Line_V):SetShow(true)
            end
            ;
            ((self._ui).frame_HistoryList):UpdateContentScroll()
            ;
            ((self._ui).frame_VScroll):SetControlTop()
            ;
            ((self._ui).frame_HistoryList):UpdateContentPos()
            if _txtYAxis < ((self._ui).frame_HistoryList):GetSizeY() then
              ((self._ui).frameBG):SetIgnore(true)
              ;
              ((self._ui).frame_VScroll):SetShow(false)
            else
              ;
              ((self._ui).frame_Content):SetSize(((self._ui).frame_Content):GetSizeX(), _txtYAxis + 30)
              ;
              ((self._ui).frameBG):SetSize(((self._ui).frame_Content):GetSizeX(), ((self._ui).frame_Content):GetSizeY())
              ;
              ((self._ui).frameBG):SetIgnore(false)
              ;
              ((self._ui).frame_VScroll):SetShow(true)
            end
            return true
          end
        end
      end
    end
  end
end

CharacterHistoryInfo.registEvent = function(self)
  -- function num : 0_3
  registerEvent("FromClient_JournalInfo_UpdateText", "FromClient_CharacterHistoryInfo_updateInfo")
end

PaGlobalFunc_CharacterHistoryInfo_Open = function()
  -- function num : 0_4 , upvalues : CharacterHistoryInfo
  if CharacterHistoryInfo == nil then
    return 
  end
  local self = CharacterHistoryInfo
  self:open()
end

CharacterHistoryInfo.open = function(self)
  -- function num : 0_5
  ToClient_RequestJournalList((self.currentValue)._year, (self.currentValue)._month, (self.currentValue)._myHistory)
end

FromClient_luaLoadComplete_Panel_Window_CharacterInfo_History = function()
  -- function num : 0_6 , upvalues : CharacterHistoryInfo, _mainPanel, _panel
  local self = CharacterHistoryInfo
  self:init()
  self.defaultFrameBG_CharacterInfo_History = (UI.getChildControl)(_mainPanel, "Static_HistoryInfoBg")
  ;
  (self.defaultFrameBG_CharacterInfo_History):SetShow(false)
  ;
  (self.defaultFrameBG_CharacterInfo_History):MoveChilds((self.defaultFrameBG_CharacterInfo_History):GetID(), _panel)
  deletePanel(_panel:GetID())
  self:registEvent()
  self:open()
end

InputMLUp_CharacterHistoryInfo_TapToOpen = function(monthIdx)
  -- function num : 0_7 , upvalues : CharacterHistoryInfo
  local self = CharacterHistoryInfo
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.currentValue)._month = monthIdx
  ToClient_RequestJournalList((self.currentValue)._year, (self.currentValue)._month, (self.currentValue)._myHistory)
end

InputMLUp_CharacterHistoryInfo_DecreaseMonth = function()
  -- function num : 0_8 , upvalues : CharacterHistoryInfo
  local self = CharacterHistoryInfo
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  if (self.currentValue)._year < 2015 then
    (self.currentValue)._year = self._lastShowedYear
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self.currentValue)._month = self._lastShowedMonth
    return 
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.currentValue)._month = (self.currentValue)._month - 1
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  if (self.currentValue)._month < 0 then
    (self.currentValue)._year = (self.currentValue)._year - 1
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self.currentValue)._month = 12
  end
  if self:updateInfo((self.currentValue)._year, (self.currentValue)._month) == false then
    InputMLUp_CharacterHistoryInfo_DecreaseMonth()
  else
    self._lastShowedYear = (self.currentValue)._year
    self._lastShowedMonth = (self.currentValue)._month
  end
end

InputMLUp_CharacterHistoryInfo_IncreaseMonth = function()
  -- function num : 0_9 , upvalues : CharacterHistoryInfo
  local self = CharacterHistoryInfo
  if ToClient_GetThisYear() < (self.currentValue)._year then
    return 
  else
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

    if ToClient_GetThisYear() == (self.currentValue)._year and ToClient_GetThisMonth() < (self.currentValue)._month then
      (self.currentValue)._year = self._lastShowedYear
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (self.currentValue)._month = self._lastShowedMonth
      return 
    end
  end
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.currentValue)._month = (self.currentValue)._month + 1
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

  if (self.currentValue)._month > 12 then
    (self.currentValue)._year = (self.currentValue)._year + 1
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (self.currentValue)._month = 1
  end
  if self:updateInfo((self.currentValue)._year, (self.currentValue)._month) == false then
    InputMLUp_CharacterHistoryInfo_IncreaseMonth()
  else
    self._lastShowedYear = (self.currentValue)._year
    self._lastShowedMonth = (self.currentValue)._month
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_CharacterInfo_History")

