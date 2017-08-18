-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\frame_guild_history.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
Panel_Guild_Journal:SetShow(false)
local pastMonth_DayCount = {[1] = 31, [2] = 29, [3] = 31, [4] = 30, [5] = 31, [6] = 30, [7] = 31, [8] = 31, [9] = 30, [10] = 31, [11] = 30, [12] = 31}
local currentValue = {_year = ToClient_GetThisYear(), _month = ToClient_GetThisMonth(), _day = ToClient_GetToday(), _myHistory = 0, _guildHistory = 1}
local monthValue = (UI.getChildControl)(Panel_Guild_Journal, "StaticText_MainMonth")
local monthLine = (UI.getChildControl)(Panel_Guild_Journal, "Static_HorizontalCenter")
local verticalLine = (UI.getChildControl)(Panel_Guild_Journal, "Static_VerticalLine")
local dayLeftValue = (UI.getChildControl)(Panel_Guild_Journal, "StaticText_DayLeft_Value")
local dayLeftLine = (UI.getChildControl)(Panel_Guild_Journal, "Static_HorizontalLeft")
local dayHistoryLeftValue = (UI.getChildControl)(Panel_Guild_Journal, "StaticText_HistoryLeftList")
local dayRightValue = (UI.getChildControl)(Panel_Guild_Journal, "StaticText_DayRight_Value")
local dayRightLine = (UI.getChildControl)(Panel_Guild_Journal, "Static_HorizontalRight")
local dayHistoryRightValue = (UI.getChildControl)(Panel_Guild_Journal, "StaticText_HistoryRightList")
local _frameHistoryList = (UI.getChildControl)(Panel_Guild_Journal, "Frame_HistoryList")
local _contentHistoryList = (UI.getChildControl)(_frameHistoryList, "Frame_1_Content")
local _scroll = (UI.getChildControl)(_frameHistoryList, "Frame_1_VerticalScroll")
local noScroll_FrameSize = _frameHistoryList:GetSizeY()
_frameHistoryList:SetIgnore(false)
local firstLogYearValue = 2014
local thisYearValue = currentValue._year
local radioBtn_Year = (UI.getChildControl)(Panel_Guild_Journal, "RadioButton_YearStic")
local radioBtn_YearValue = (UI.getChildControl)(Panel_Guild_Journal, "StaticText_YearSticText")
local selectedYear = (UI.getChildControl)(Panel_Guild_Journal, "StaticText_SelectYearValue")
local yearLeftButton = (UI.getChildControl)(Panel_Guild_Journal, "Button_Year_Left")
local yearRightButton = (UI.getChildControl)(Panel_Guild_Journal, "Button_Year_Right")
local yearIndex = {}
local radioBtn_YearPosX = radioBtn_Year:GetPosX()
local radioBtn_YearGap = 15
local topMonth = (UI.getChildControl)(Panel_Guild_Journal, "RadioButton_Month")
local monthIndex = {}
local haveInfoMonth = nil
local _monthCount = 11
for index = 0, 11 do
  monthIndex[index] = nil
  monthIndex[index] = {}
  monthIndex[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_RADIOBUTTON, Panel_Guild_Journal, "RadioButton_Month_" .. index + 1)
  CopyBaseProperty(topMonth, monthIndex[index])
  ;
  (monthIndex[index]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_HISTORY_MONTH", "month", index + 1))
  ;
  (monthIndex[index]):SetSpanSize(((monthIndex[index]):GetSizeX() + 15) * _monthCount + 20)
  ;
  (monthIndex[index]):addInputEvent("Mouse_LUp", "HandleClicked_GuildHistory_MonthCheck(" .. index .. ")")
  ;
  (monthIndex[index]):SetShow(true)
  _monthCount = _monthCount - 1
end
local helpWidget = nil
guild_helpWidget_Create = function()
  -- function num : 0_0 , upvalues : helpWidget, UI_PUCT, _contentHistoryList, UI_color
  local tooltipBase = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_1")
  helpWidget = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, _contentHistoryList, "HelpWindow_For_GuildHistory")
  CopyBaseProperty(tooltipBase, helpWidget)
  helpWidget:SetColor(UI_color.C_FFFFFFFF)
  helpWidget:SetAlpha(1)
  helpWidget:SetFontColor(UI_color.C_FFC4BEBE)
  helpWidget:SetAutoResize(true)
  helpWidget:SetShow(false)
  _contentHistoryList:SetChildIndex(helpWidget, 9999)
end

local _firstOpenCheck = true
GuildHistory_DataUpdate = function()
  -- function num : 0_1 , upvalues : _firstOpenCheck, firstLogYearValue, haveInfoMonth, currentValue
  if _firstOpenCheck then
    _firstOpenCheck = false
    HandleClicked_GuildHistory_YearCheck(ToClient_GetThisYear() - firstLogYearValue)
    HandleClicked_GuildHistory_MonthCheck(ToClient_GetThisMonth() - 1)
    haveInfoMonth = ToClient_GetThisMonth()
    return 
  end
  ToClient_RequestJournalList(currentValue._year, currentValue._month, currentValue._guildHistory)
end

local _dayHistoryValue = {}
FromClient_GuildHistoryInfo_Update = function()
  -- function num : 0_2 , upvalues : haveInfoMonth, currentValue, monthIndex, UI_color, _contentHistoryList, UI_PUCT, monthValue, monthLine, verticalLine, dayLeftValue, dayLeftLine, dayRightValue, dayRightLine, dayHistoryLeftValue, _dayHistoryValue, dayHistoryRightValue, noScroll_FrameSize, _scroll, _frameHistoryList
  if haveInfoMonth == nil then
    return 
  end
  _listCount = ToClient_GetJournalListCount(currentValue._year, currentValue._month, currentValue._guildHistory)
  if _listCount == 0 then
    if currentValue._year == ToClient_GetThisYear() and currentValue._month == ToClient_GetThisMonth() then
      for i = 0, 11 do
        if haveInfoMonth - 1 == i then
          (monthIndex[i]):SetFontColor(UI_color.C_FFFFFFFF)
        else
          ;
          (monthIndex[i]):SetFontColor(UI_color.C_FF888888)
        end
      end
      do return  end
      _contentHistoryList:DestroyAllChild()
      guild_helpWidget_Create()
      _contentHistoryList:SetIgnore(true)
      if currentValue._day == 0 then
        for i = 0, 11 do
          if haveInfoMonth - 1 == i then
            (monthIndex[i]):SetFontColor(UI_color.C_FFFFFFFF)
          else
            ;
            (monthIndex[i]):SetFontColor(UI_color.C_FF888888)
          end
        end
        return 
      end
      local frameContent = {_monthValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, _contentHistoryList, "StaticText_Month_Value"), _monthLine = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, _contentHistoryList, "Static_MonthLine"), _verticalLine = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, _contentHistoryList, "Static_VerticalLine")}
      CopyBaseProperty(monthValue, frameContent._monthValue)
      CopyBaseProperty(monthLine, frameContent._monthLine)
      CopyBaseProperty(verticalLine, frameContent._verticalLine)
      ;
      (frameContent._monthValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLD_MAP_SIEGE_YEAR", "year", currentValue._year) .. " " .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_HISTORY_MONTH", "month", currentValue._month))
      ;
      (frameContent._monthValue):SetShow(true)
      ;
      (frameContent._monthLine):SetShow(true)
      ;
      (frameContent._verticalLine):SetShow(true)
      local sizeY = 10
      local lineGap = 30
      local textSizeY = 20
      local _journalInfo = {}
      local emptyDay = 0
      local _dayValue = {}
      local _dayLine = {}
      local dayLogCount = 1
      local firstDay = 0
      for dayIndex = currentValue._day, 1, -1 do
        _dayValue[dayIndex] = {}
        _dayLine[dayIndex] = {}
        if dayLogCount % 2 == 1 then
          local _dayLeftValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, _contentHistoryList, "StaticText_DayLeft_Value_" .. dayIndex)
          local _dayLeftLine = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, _contentHistoryList, "Static_DayLeftLine_" .. dayIndex)
          CopyBaseProperty(dayLeftValue, _dayLeftValue)
          CopyBaseProperty(dayLeftLine, _dayLeftLine)
          _dayValue[dayIndex] = _dayLeftValue
          _dayLine[dayIndex] = _dayLeftLine
        else
          do
            local _dayRightValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, _contentHistoryList, "StaticText_DayRight_Value_" .. dayIndex)
            do
              local _dayRightLine = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, _contentHistoryList, "Static_DayRightLine" .. dayIndex)
              CopyBaseProperty(dayRightValue, _dayRightValue)
              CopyBaseProperty(dayRightLine, _dayRightLine)
              _dayValue[dayIndex] = _dayRightValue
              _dayLine[dayIndex] = _dayRightLine
              do
                local checkLog = false
                for i = _listCount - 1, 0, -1 do
                  _journalInfo[i] = {}
                  _journalInfo[i] = ToClient_GetJournal(currentValue._year, currentValue._month, currentValue._guildHistory, i)
                  if _journalInfo[i] ~= nil and dayIndex == (_journalInfo[i]):getJournalDay() then
                    if checkLog == false then
                      checkLog = true
                    end
                    sizeY = sizeY + textSizeY
                    if dayLogCount % 2 == 1 then
                      local _dayHistoryLeftValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, _contentHistoryList, "StaticText_GuildHistory_" .. i)
                      CopyBaseProperty(dayHistoryLeftValue, _dayHistoryLeftValue)
                      -- DECOMPILER ERROR at PC283: Confused about usage of register: R20 in 'UnsetPending'

                      _dayHistoryValue[i] = _dayHistoryLeftValue
                      ;
                      (_dayHistoryValue[i]):SetText(tostring((_journalInfo[i]):getName()))
                      ;
                      (_dayHistoryValue[i]):addInputEvent("Mouse_On", "GuildHistory_HelpWidget_Show(true," .. i .. ", true)")
                      ;
                      (_dayHistoryValue[i]):addInputEvent("Mouse_Out", "GuildHistory_HelpWidget_Show(false)")
                    else
                      do
                        do
                          do
                            local _dayHistoryRightValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, _contentHistoryList, "StaticText_GuildHistory_" .. i)
                            CopyBaseProperty(dayHistoryRightValue, _dayHistoryRightValue)
                            -- DECOMPILER ERROR at PC323: Confused about usage of register: R20 in 'UnsetPending'

                            _dayHistoryValue[i] = _dayHistoryRightValue
                            ;
                            (_dayHistoryValue[i]):SetText(tostring((_journalInfo[i]):getName()))
                            ;
                            (_dayHistoryValue[i]):addInputEvent("Mouse_On", "GuildHistory_HelpWidget_Show(true," .. i .. ", false)")
                            ;
                            (_dayHistoryValue[i]):addInputEvent("Mouse_Out", "GuildHistory_HelpWidget_Show(false)")
                            ;
                            (_dayHistoryValue[i]):SetAutoResize(true)
                            ;
                            (_dayHistoryValue[i]):SetPosY(sizeY + 30)
                            ;
                            (_dayHistoryValue[i]):SetShow(true)
                            ;
                            (_dayHistoryValue[i]):SetIgnore(false)
                            -- DECOMPILER ERROR at PC368: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC368: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC368: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                            -- DECOMPILER ERROR at PC368: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC368: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC368: LeaveBlock: unexpected jumping out IF_STMT

                          end
                        end
                      end
                    end
                  end
                end
                if checkLog == true then
                  sizeY = sizeY + lineGap
                  ;
                  (_dayValue[dayIndex]):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_HISTORY_DAY", "day", dayIndex))
                  ;
                  (_dayValue[dayIndex]):SetShow(true)
                  ;
                  (_dayLine[dayIndex]):SetShow(true)
                  ;
                  (_dayValue[dayIndex]):SetPosY(sizeY + 30)
                  ;
                  (_dayLine[dayIndex]):SetPosY(sizeY + 20)
                  dayLogCount = dayLogCount + 1
                  firstDay = dayIndex
                end
                -- DECOMPILER ERROR at PC400: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC400: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC400: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC400: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
      if firstDay > 0 then
        _contentHistoryList:SetSize(_contentHistoryList:GetSizeX(), (_dayLine[firstDay]):GetPosY() + 50)
        ;
        (frameContent._verticalLine):SetSize((frameContent._verticalLine):GetSizeX(), (_dayLine[firstDay]):GetPosY() - 20)
        ;
        (frameContent._verticalLine):SetShow(true)
        if noScroll_FrameSize < (_dayLine[firstDay]):GetPosY() + 50 then
          _scroll:SetShow(true)
        else
          _scroll:SetShow(false)
        end
      else
        ;
        (frameContent._verticalLine):SetSize((frameContent._verticalLine):GetSizeX(), noScroll_FrameSize)
        ;
        (frameContent._verticalLine):SetShow(false)
        _contentHistoryList:SetSize(_contentHistoryList:GetSizeX(), noScroll_FrameSize)
        _scroll:SetShow(false)
      end
      _scroll:SetInterval(_contentHistoryList:GetSizeY() / 100 * 1.1)
      _frameHistoryList:UpdateContentScroll()
      _scroll:SetControlTop()
      _frameHistoryList:UpdateContentPos()
      haveInfoMonth = currentValue._month
    end
  end
end

GuildHistory_HelpWidget_Show = function(isShow, index, isLeft)
  -- function num : 0_3 , upvalues : currentValue, helpWidget, _dayHistoryValue
  if index ~= nil then
    local journalInfo = ToClient_GetJournal(currentValue._year, currentValue._month, currentValue._guildHistory, index)
    if journalInfo ~= nil then
      local helpDesc = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_HISTORY_TIME", "hour", journalInfo:getJournalHour(), "minute", journalInfo:getJournalMinute(), "second", journalInfo:getJournalSecond())
      helpWidget:SetText(helpDesc)
      helpWidget:SetSize(80, 20)
    else
      do
        do
          helpWidget:SetShow(false)
          do return  end
          if isLeft == true then
            helpWidget:SetPosX((_dayHistoryValue[index]):GetPosX() - (_dayHistoryValue[index]):GetTextSizeX() - 35)
          else
            helpWidget:SetPosX((_dayHistoryValue[index]):GetPosX() + (_dayHistoryValue[index]):GetTextSizeX() + 5)
          end
          helpWidget:SetPosY((_dayHistoryValue[index]):GetPosY() - 6)
          helpWidget:SetShow(isShow)
        end
      end
    end
  end
end

HandleClicked_GuildHistory_MonthCheck = function(index)
  -- function num : 0_4 , upvalues : monthIndex, UI_color, currentValue, pastMonth_DayCount
  for i = 0, 11 do
    if index == i then
      (monthIndex[i]):SetFontColor(UI_color.C_FFFFFFFF)
    else
      ;
      (monthIndex[i]):SetFontColor(UI_color.C_FF888888)
    end
  end
  ;
  (monthIndex[index]):SetCheck(true)
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  currentValue._month = index + 1
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

  if ToClient_GetThisYear() <= currentValue._year and ToClient_GetThisMonth() < currentValue._month then
    currentValue._day = 0
  end
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  if ToClient_GetThisMonth() == currentValue._month then
    currentValue._day = ToClient_GetToday()
  else
    -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

    currentValue._day = pastMonth_DayCount[index + 1]
  end
  GuildHistory_DataUpdate()
end

HandleClicked_GuildHistory_YearCheck = function(index)
  -- function num : 0_5 , upvalues : currentValue, firstLogYearValue, radioBtn_YearValue, selectedYear, radioBtn_YearPosX, yearLeftButton, yearRightButton
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  currentValue._year = firstLogYearValue + index
  radioBtn_YearValue:SetText(currentValue._year)
  selectedYear:SetText(currentValue._year)
  local sizeX = radioBtn_YearPosX
  if firstLogYearValue < currentValue._year then
    yearLeftButton:SetShow(true)
  else
    yearLeftButton:SetShow(false)
  end
  if currentValue._year < ToClient_GetThisYear() then
    yearRightButton:SetShow(true)
  else
    yearRightButton:SetShow(false)
  end
  if currentValue._year == ToClient_GetThisYear() then
    HandleClicked_MyHistory_MonthCheck(ToClient_GetThisMonth() - 1)
  else
    HandleClicked_MyHistory_MonthCheck(11)
  end
  yearLeftButton:addInputEvent("Mouse_LUp", "HandleClicked_GuildHistory_YearCheck(" .. currentValue._year - firstLogYearValue - 1 .. ")")
  yearRightButton:addInputEvent("Mouse_LUp", "HandleClicked_GuildHistory_YearCheck(" .. currentValue._year - firstLogYearValue + 1 .. ")")
end

local defaultFrameBG_History = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_Journal")
defaultFrameBG_History:MoveChilds(defaultFrameBG_History:GetID(), Panel_Guild_Journal)
deletePanel(Panel_Guild_Journal:GetID())
FGlobal_GuildHistory_Show = function(isShow)
  -- function num : 0_6 , upvalues : defaultFrameBG_History
  if isShow == true then
    defaultFrameBG_History:SetShow(true)
    GuildHistory_DataUpdate()
  else
    defaultFrameBG_History:SetShow(false)
  end
end

registerEvent("FromClient_JournalInfo_UpdateText", "FromClient_GuildHistoryInfo_Update")

