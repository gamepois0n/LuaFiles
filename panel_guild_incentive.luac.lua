-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\panel_guild_incentive.luac 

-- params : ...
-- function num : 0
Panel_Guild_IncentiveOption:SetShow(false)
Panel_Guild_IncentiveOption:ActiveMouseEventEffect(true)
Panel_Guild_IncentiveOption:setMaskingChild(true)
Panel_Guild_IncentiveOption:setGlassBackground(true)
Panel_Guild_IncentiveOption:SetDragEnable(true)
Panel_Guild_IncentiveOption:SetDragAll(true)
Panel_Guild_Incentive_Foundation:SetDragEnable(true)
Panel_Guild_Incentive_Foundation:SetDragAll(true)
local UI_TM = CppEnums.TextMode
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local maxGuildList = 20
local maxIncentiveGrade = 4
local _guildList = {}
local _selectedMemberIndex = 0
local _selectSortType = -1
local _listSort = {name = false}
local tempGuildIncentive = {}
local tempGuildList = {}
local _frameGuildList = (UI.getChildControl)(Panel_Guild_IncentiveOption, "Frame_GuildList")
local _contentGuildList = (UI.getChildControl)(_frameGuildList, "Frame_1_Content")
local _scroll = (UI.getChildControl)(_frameGuildList, "VerticalScroll")
local _guildFoundationValue = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_GuildMoney")
local _guildMoney = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_GuildMoney_Value")
local _totalIncentiveValue = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_Incentive_Value")
local _leftTime = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_Incentive_LeftTime")
local _leftTimeValue = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_Incentive_LeftTimeValue")
local _btnIncentive = (UI.getChildControl)(Panel_Guild_IncentiveOption, "Button_Incentive")
local _btnClose = (UI.getChildControl)(Panel_Guild_IncentiveOption, "Button_WinClose")
local _btnQuestion = (UI.getChildControl)(Panel_Guild_IncentiveOption, "Button_Question")
local guildIncentiveMoneyValue = {_btn_Apply = (UI.getChildControl)(Panel_Guild_Incentive_Foundation, "Button_Apply"), _btn_Close = (UI.getChildControl)(Panel_Guild_Incentive_Foundation, "Button_Cancel"), _txt_Desc = (UI.getChildControl)(Panel_Guild_Incentive_Foundation, "StaticText_Desc"), _txt_Founds = (UI.getChildControl)(Panel_Guild_Incentive_Foundation, "StaticText_Founds"), _edit_MoneyValue = (UI.getChildControl)(Panel_Guild_Incentive_Foundation, "Edit_MoneyValue")}
_btnIncentive:addInputEvent("Mouse_LUp", "Give_Incentive()")
_btnClose:addInputEvent("Mouse_LUp", "Panel_GuildIncentiveOption_Close()")
_btnQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelGuild\" )")
_btnQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelGuild\", \"true\")")
_btnQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelGuild\", \"false\")")
local Guild_Incentive = {_memberGrade = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_C_Grade"), _memberName = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_C_CharName"), _memberContribution = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_C_ContributedTendency"), _memberIncentiveValue = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_C_IncentiveValue"), _comboboxRank = (UI.getChildControl)(Panel_Guild_IncentiveOption, "Combobox_Destination"), _radio_Level1 = (UI.getChildControl)(Panel_Guild_IncentiveOption, "RadioButton_Level1"), _radio_Level2 = (UI.getChildControl)(Panel_Guild_IncentiveOption, "RadioButton_Level2"), _radio_Level3 = (UI.getChildControl)(Panel_Guild_IncentiveOption, "RadioButton_Level3"), _radio_Level4 = (UI.getChildControl)(Panel_Guild_IncentiveOption, "RadioButton_Level4"), _txt_Level = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_Level"), _title_CharName = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_M_CharName"), _title_Ap = (UI.getChildControl)(Panel_Guild_IncentiveOption, "StaticText_M_ContributedTendency")}
;
(Guild_Incentive._memberGrade):SetShow(false)
;
(Guild_Incentive._memberName):SetShow(false)
;
(Guild_Incentive._memberContribution):SetShow(false)
;
(Guild_Incentive._memberIncentiveValue):SetShow(false)
;
(Guild_Incentive._comboboxRank):SetShow(false)
;
(Guild_Incentive._radio_Level1):SetShow(false)
;
(Guild_Incentive._radio_Level2):SetShow(false)
;
(Guild_Incentive._radio_Level3):SetShow(false)
;
(Guild_Incentive._radio_Level4):SetShow(false)
;
(Guild_Incentive._txt_Level):SetShow(false)
local _ySize = (Guild_Incentive._memberGrade):GetSizeY()
local frameTextGap = 10
local _memberCtrlCount = 0
Guild_Incentive.ResetControl = function(self)
  -- function num : 0_0 , upvalues : _guildMoney, _memberCtrlCount, maxGuildList, _scroll, _contentGuildList, _guildList, UCT, Guild_Incentive, _ySize, frameTextGap, maxIncentiveGrade, _frameGuildList
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  _guildMoney:SetText(0 .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_INCENTIVE_MONEY"))
  _memberCtrlCount = myGuildListInfo:getMemberCount()
  if maxGuildList < _memberCtrlCount then
    _scroll:SetShow(true)
  else
    _scroll:SetShow(false)
  end
  _contentGuildList:DestroyAllChild()
  for i = 1, _memberCtrlCount do
    local index = i - 1
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R7 in 'UnsetPending'

    _guildList[index] = {}
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._memberGrade = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, _contentGuildList, "StaticText_Grade_" .. i)
    -- DECOMPILER ERROR at PC65: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._memberName = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, _contentGuildList, "StaticText_MemberName_" .. i)
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._memberContribution = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, _contentGuildList, "StaticText_MemberContribution_" .. i)
    -- DECOMPILER ERROR at PC89: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._memberIncentiveValue = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, _contentGuildList, "StaticText_memberIncentiveValue_" .. i)
    -- DECOMPILER ERROR at PC101: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._comboboxRank = (UI.createControl)(UCT.PA_UI_CONTROL_COMBOBOX, _contentGuildList, "Combobox_Rank_" .. i)
    -- DECOMPILER ERROR at PC113: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._level1 = (UI.createControl)(UCT.PA_UI_CONTROL_RADIOBUTTON, _contentGuildList, "Radiobutton_Level1_" .. i)
    -- DECOMPILER ERROR at PC125: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._level2 = (UI.createControl)(UCT.PA_UI_CONTROL_RADIOBUTTON, _contentGuildList, "Radiobutton_Level2_" .. i)
    -- DECOMPILER ERROR at PC137: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._level3 = (UI.createControl)(UCT.PA_UI_CONTROL_RADIOBUTTON, _contentGuildList, "Radiobutton_Level3_" .. i)
    -- DECOMPILER ERROR at PC149: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._level4 = (UI.createControl)(UCT.PA_UI_CONTROL_RADIOBUTTON, _contentGuildList, "Radiobutton_Level4_" .. i)
    -- DECOMPILER ERROR at PC161: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_guildList[index])._level = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, _contentGuildList, "StaticText_Level_" .. i)
    CopyBaseProperty(Guild_Incentive._memberGrade, (_guildList[index])._memberGrade)
    CopyBaseProperty(Guild_Incentive._memberName, (_guildList[index])._memberName)
    CopyBaseProperty(Guild_Incentive._memberContribution, (_guildList[index])._memberContribution)
    CopyBaseProperty(Guild_Incentive._memberIncentiveValue, (_guildList[index])._memberIncentiveValue)
    CopyBaseProperty(Guild_Incentive._comboboxRank, (_guildList[index])._comboboxRank)
    CopyBaseProperty(Guild_Incentive._radio_Level1, (_guildList[index])._level1)
    CopyBaseProperty(Guild_Incentive._radio_Level2, (_guildList[index])._level2)
    CopyBaseProperty(Guild_Incentive._radio_Level3, (_guildList[index])._level3)
    CopyBaseProperty(Guild_Incentive._radio_Level4, (_guildList[index])._level4)
    CopyBaseProperty(Guild_Incentive._txt_Level, (_guildList[index])._level)
    ;
    ((_guildList[index])._level1):SetGroup(i)
    ;
    ((_guildList[index])._level2):SetGroup(((_guildList[index])._level1):GetGroupNumber())
    ;
    ((_guildList[index])._level3):SetGroup(((_guildList[index])._level1):GetGroupNumber())
    ;
    ((_guildList[index])._level4):SetGroup(((_guildList[index])._level1):GetGroupNumber())
    local guildMemberInfo = myGuildListInfo:getMember(i - 1)
    local gradeType = guildMemberInfo:getGrade()
    local gradeValue = ""
    if gradeType == 0 then
      gradeValue = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMASTER")
    else
      if gradeType == 1 then
        gradeValue = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDSUBMASTER")
      else
        if gradeType == 2 then
          gradeValue = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMEMBER")
        else
          if gradeType == 3 then
            gradeValue = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_SUPPLYOFFICER")
          end
        end
      end
    end
    ;
    ((_guildList[index])._memberGrade):SetText(gradeValue)
    ;
    ((_guildList[index])._memberName):SetText(guildMemberInfo:getName() .. " (" .. guildMemberInfo:getCharacterName() .. ")")
    local tempActivityText = "0"
    ;
    ((_guildList[index])._memberContribution):SetText(tempActivityText)
    local posY = 0
    posY = (_ySize + frameTextGap / 2) * index + frameTextGap
    ;
    ((_guildList[index])._memberGrade):SetPosY(posY)
    ;
    ((_guildList[index])._memberGrade):SetShow(true)
    ;
    ((_guildList[index])._memberName):SetPosY(posY)
    ;
    ((_guildList[index])._memberName):SetShow(true)
    ;
    ((_guildList[index])._memberContribution):SetPosY(posY)
    ;
    ((_guildList[index])._memberContribution):SetShow(true)
    ;
    ((_guildList[index])._memberIncentiveValue):SetPosY(posY)
    ;
    ((_guildList[index])._memberIncentiveValue):SetShow(true)
    ;
    ((_guildList[index])._comboboxRank):SetPosY(posY)
    ;
    ((_guildList[index])._level1):SetPosY(posY)
    ;
    ((_guildList[index])._level2):SetPosY(posY)
    ;
    ((_guildList[index])._level3):SetPosY(posY)
    ;
    ((_guildList[index])._level4):SetPosY(posY)
    ;
    ((_guildList[index])._level):SetPosY(posY)
    ;
    ((_guildList[index])._comboboxRank):SetShow(false)
    ;
    ((_guildList[index])._level1):SetShow(true)
    ;
    ((_guildList[index])._level2):SetShow(true)
    ;
    ((_guildList[index])._level3):SetShow(true)
    ;
    ((_guildList[index])._level4):SetShow(true)
    ;
    ((_guildList[index])._level):SetShow(true)
    ;
    ((_guildList[index])._level):SetText("<PAColor0xFFF26A6A>1<PAOldColor> ë‹¨ê³„")
    ;
    ((_guildList[index])._comboboxRank):DeleteAllItem()
    for i = 1, maxIncentiveGrade do
      ((_guildList[index])._comboboxRank):AddItem(i)
    end
    ;
    ((_guildList[index])._level1):addInputEvent("Mouse_LUp", "Set_Incentive_Grade(" .. index .. ")")
    ;
    ((_guildList[index])._level2):addInputEvent("Mouse_LUp", "Set_Incentive_Grade(" .. index .. ")")
    ;
    ((_guildList[index])._level3):addInputEvent("Mouse_LUp", "Set_Incentive_Grade(" .. index .. ")")
    ;
    ((_guildList[index])._level4):addInputEvent("Mouse_LUp", "Set_Incentive_Grade(" .. index .. ")")
    ;
    ((_guildList[index])._comboboxRank):SetText(1)
    ;
    ((_guildList[index])._comboboxRank):addInputEvent("Mouse_LUp", "click_Incentive_GradeList(" .. index .. ")")
    ;
    (((_guildList[index])._comboboxRank):GetListControl()):addInputEvent("Mouse_LUp", "Set_Incentive_Grade(" .. index .. ")")
  end
  Panel_Guild_IncentiveOption:SetChildIndex(Guild_Incentive._title_CharName, 9999)
  Panel_Guild_IncentiveOption:SetChildIndex(Guild_Incentive._title_Ap, 9999)
  _frameGuildList:UpdateContentScroll()
  _scroll:SetControlTop()
  _frameGuildList:UpdateContentPos()
end

Guild_Incentive.UpdateData = function(self)
  -- function num : 0_1 , upvalues : _guildFoundationValue, _leftTime, _leftTimeValue, tempGuildIncentive, _guildList, _scroll, _contentGuildList
  GuildIncentive_SetGuildIncentive()
  GuildIncentive_updateSort()
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local businessFunds = myGuildListInfo:getGuildBusinessFunds_s64()
  local totalMoney64 = ToClient_getGuildTotalIncentiveMoney_s64()
  _guildFoundationValue:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_FOUNDATIONVALUE", "businessFunds", makeDotMoney(businessFunds), "totalMoney64", makeDotMoney(totalMoney64)))
  local memberCount = myGuildListInfo:getMemberCount()
  local leftTime = myGuildListInfo:getIncentiveDate()
  if Int64toInt32(leftTime) > 0 then
    local lefttimeText = convertStringFromDatetime(getLeftSecond_TTime64(leftTime))
    _leftTime:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_LEFTTIMETEXT", "lefttimeText", lefttimeText))
    _leftTime:SetShow(true)
    _leftTimeValue:SetShow(false)
  else
    do
      do
        _leftTimeValue:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_LEFTTIMEVALUE"))
        _leftTimeValue:SetShow(true)
        _leftTime:SetShow(false)
        for i = 1, memberCount do
          local index = i - 1
          local dataIdx = (tempGuildIncentive[index + 1]).idx
          local guildMemberInfo = myGuildListInfo:getMember(dataIdx)
          local gradeType = guildMemberInfo:getGrade()
          local gradeValue = ""
          if gradeType == 0 then
            gradeValue = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMASTER")
          else
            if gradeType == 1 then
              gradeValue = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDSUBMASTER")
            else
              if gradeType == 2 then
                gradeValue = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMEMBER")
              else
                if gradeType == 3 then
                  gradeValue = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_SUPPLYOFFICER")
                end
              end
            end
          end
          ;
          ((_guildList[index])._memberGrade):SetText(gradeValue)
          if guildMemberInfo:isOnline() == true then
            ((_guildList[index])._memberName):SetText(guildMemberInfo:getName() .. " (" .. guildMemberInfo:getCharacterName() .. ")")
            local usableActivity = guildMemberInfo:getUsableActivity()
            if usableActivity > 10000 then
              usableActivity = 10000
            end
            local tempActivityText = tostring(guildMemberInfo:getTotalActivity()) .. "(<PAColor0xfface400>+" .. tostring(usableActivity) .. "<PAOldColor>)"
            ;
            ((_guildList[index])._memberContribution):SetText(tempActivityText)
          else
            do
              ;
              ((_guildList[index])._memberName):SetText(guildMemberInfo:getName() .. " ( - )")
              do
                local tempActivityText = tostring(guildMemberInfo:getTotalActivity()) .. "(+" .. tostring(guildMemberInfo:getUsableActivity()) .. ")"
                ;
                ((_guildList[index])._memberContribution):SetText(tempActivityText)
                ;
                ((_guildList[index])._level1):SetCheck(false)
                ;
                ((_guildList[index])._level2):SetCheck(false)
                ;
                ((_guildList[index])._level3):SetCheck(false)
                ;
                ((_guildList[index])._level4):SetCheck(false)
                local grade = ToClient_getGuildMemberIncentiveGrade(dataIdx)
                ;
                ((_guildList[index])._level1):SetCheck(grade == 1)
                ;
                ((_guildList[index])._level2):SetCheck(grade == 2)
                ;
                ((_guildList[index])._level3):SetCheck(grade == 3)
                ;
                ((_guildList[index])._level4):SetCheck(grade == 4)
                local level1 = ((_guildList[index])._level1):IsCheck()
                local level2 = ((_guildList[index])._level2):IsCheck()
                local level3 = ((_guildList[index])._level3):IsCheck()
                local level4 = ((_guildList[index])._level4):IsCheck()
                ;
                ((_guildList[index])._level):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_GRADE_FOR_WHAT", "grade", grade))
                do
                  local incentive = ToClient_getGuildMemberIncentiveMoney_s64(dataIdx)
                  ;
                  ((_guildList[index])._memberIncentiveValue):SetText(makeDotMoney(incentive))
                  ;
                  ((_guildList[index])._comboboxRank):SetText(tostring(grade))
                  -- DECOMPILER ERROR at PC312: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC312: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC312: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC312: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
        _scroll:SetInterval(_contentGuildList:GetSizeY() / 100 * 1.1)
        -- DECOMPILER ERROR: 4 unprocessed JMP targets
      end
    end
  end
end

click_Incentive_GradeList = function(index)
  -- function num : 0_2 , upvalues : _selectedMemberIndex, _guildList, _frameGuildList, _contentGuildList
  _selectedMemberIndex = index
  local listCombbox = ((_guildList[index])._comboboxRank):GetListControl()
  if _frameGuildList:GetSizeY() - _contentGuildList:GetPosY() - listCombbox:GetSizeY() < ((_guildList[index])._comboboxRank):GetPosY() then
    listCombbox:SetPosY(listCombbox:GetSizeY() * -1)
  else
    listCombbox:SetPosY(((_guildList[index])._comboboxRank):GetSizeY())
  end
  ;
  ((_guildList[index])._comboboxRank):ToggleListbox()
  _contentGuildList:SetChildIndex((_guildList[index])._comboboxRank, 9999)
end

Set_Incentive_Grade = function(index)
  -- function num : 0_3 , upvalues : tempGuildIncentive, _guildList, guildIncentiveMoneyValue, Guild_Incentive
  local dataIdx = (tempGuildIncentive[index + 1]).idx
  ;
  ((_guildList[index])._comboboxRank):SetSelectItemIndex(((_guildList[index])._comboboxRank):GetSelectIndex())
  local grade = 1
  ;
  ((_guildList[index])._comboboxRank):SetText(tostring(grade))
  ;
  ((_guildList[index])._comboboxRank):ToggleListbox()
  local level1 = ((_guildList[index])._level1):IsCheck()
  local level2 = ((_guildList[index])._level2):IsCheck()
  local level3 = ((_guildList[index])._level3):IsCheck()
  local level4 = ((_guildList[index])._level4):IsCheck()
  if level1 then
    grade = 1
  else
    if level2 then
      grade = 2
    else
      if level3 then
        grade = 3
      else
        if level4 then
          grade = 4
        end
      end
    end
  end
  local editMoney = tonumber64((string.gsub)((guildIncentiveMoneyValue._edit_MoneyValue):GetEditText(), ",", ""))
  ToClient_SetGuildMemberIncentiveGrade(dataIdx, grade, editMoney)
  Guild_Incentive:UpdateData()
end

Give_Incentive = function()
  -- function num : 0_4
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_INCENTIVE_PAYMENTS")
  local contentString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_INCENTIVE_PAYMENTS_CONFIRM")
  local messageboxData = {title = titleString, content = contentString, functionYes = PayIncentiveConfirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

PayIncentiveConfirm = function()
  -- function num : 0_5
  ToClient_PayGuildMemberIncentive()
  Panel_GuildIncentiveOption_Close()
  Panel_Guild_Incentive_Foundation_Close()
end

Panel_GuildIncentiveOption_ShowToggle = function()
  -- function num : 0_6
  if Panel_Guild_IncentiveOption:GetShow() then
    Panel_GuildIncentiveOption_Close()
    Panel_Guild_Incentive_Foundation_Close()
  else
    Panel_Guild_Incentive_Foundation_Open()
  end
end

Panel_GuildIncentiveOption_Close = function()
  -- function num : 0_7
  if Panel_Guild_IncentiveOption:GetShow() then
    Panel_Guild_IncentiveOption:SetShow(false)
    Panel_Guild_Incentive_Foundation_Close()
  end
end

Panel_Guild_IncentiveOption_Resize = function()
  -- function num : 0_8
  Panel_Guild_IncentiveOption:SetPosX(getScreenSizeX() / 2 - Panel_Guild_IncentiveOption:GetSizeX() / 2)
  Panel_Guild_IncentiveOption:SetPosY(getScreenSizeY() / 2 - Panel_Guild_IncentiveOption:GetSizeY() / 2 - 50)
end

Panel_Guild_Incentive_Foundation_Init = function()
  -- function num : 0_9 , upvalues : guildIncentiveMoneyValue, UI_TM, Guild_Incentive
  local self = guildIncentiveMoneyValue
  ;
  (self._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_FOUNDATION_DESC"))
  Panel_Guild_Incentive_Foundation:SetSize(Panel_Guild_Incentive_Foundation:GetSizeX(), (self._txt_Desc):GetTextSizeY() + 210)
  ;
  (self._btn_Close):ComputePos()
  ;
  (self._btn_Apply):ComputePos()
  ;
  (self._edit_MoneyValue):SetEditText("", true)
  ;
  (self._btn_Close):addInputEvent("Mouse_LUp", "Panel_Guild_Incentive_Foundation_Close()")
  ;
  (self._edit_MoneyValue):addInputEvent("Mouse_LUp", "Panel_Guild_Incentive_Foundation_Editing()")
  ;
  (Guild_Incentive._title_CharName):addInputEvent("Mouse_LUp", "HandleClicked_GuildIncentiveSort(0)")
  ;
  (Guild_Incentive._title_Ap):addInputEvent("Mouse_LUp", "HandleClicked_GuildIncentiveSort(1)")
end

Panel_Guild_Incentive_Foundation_Update = function()
  -- function num : 0_10 , upvalues : guildIncentiveMoneyValue
  local self = guildIncentiveMoneyValue
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local businessFunds = myGuildListInfo:getGuildBusinessFunds_s64()
  local businessFunds10 = businessFunds * toInt64(0, 10) / toInt64(0, 100)
  local businessFunds30 = businessFunds * toInt64(0, 30) / toInt64(0, 100)
  ;
  (self._txt_Founds):SetText(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_FOUNDATION_RANGEOFMONEY", "businessFunds", makeDotMoney(businessFunds), "businessFunds10", makeDotMoney(businessFunds10), "businessFunds30", makeDotMoney(businessFunds30)))
  ;
  (self._btn_Apply):addInputEvent("Mouse_LUp", "Panel_Guild_Incentive_Foundation_MainShowToggle()")
end

Panel_Guild_Incentive_Foundation_MainShowToggle = function()
  -- function num : 0_11 , upvalues : guildIncentiveMoneyValue, Guild_Incentive
  local self = guildIncentiveMoneyValue
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local businessFunds = myGuildListInfo:getGuildBusinessFunds_s64()
  local businessFunds10 = businessFunds * toInt64(0, 10) / toInt64(0, 100)
  local businessFunds30 = businessFunds * toInt64(0, 30) / toInt64(0, 100)
  local editMoney = tonumber64((string.gsub)((self._edit_MoneyValue):GetEditText(), ",", ""))
  if editMoney < businessFunds10 or businessFunds30 < editMoney then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_FOUNDATION_RANGEOFMONEY_ALERT"))
    return 
  end
  if Panel_Guild_IncentiveOption:GetShow() then
    Panel_GuildIncentiveOption_Close()
    Panel_Guild_Incentive_Foundation_Close()
  else
    ToClient_InitGuildIncentiveList(editMoney)
    Panel_Guild_IncentiveOption:SetShow(true)
    Guild_Incentive:ResetControl()
    Guild_Incentive:UpdateData()
    Panel_Guild_IncentiveOption_Resize()
    Panel_Guild_Incentive_Foundation_Close()
  end
end

Panel_Guild_Incentive_Foundation_Editing = function()
  -- function num : 0_12 , upvalues : guildIncentiveMoneyValue
  local self = guildIncentiveMoneyValue
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local businessFunds = myGuildListInfo:getGuildBusinessFunds_s64()
  local businessFunds10 = businessFunds * toInt64(0, 10) / toInt64(0, 100)
  local businessFunds30 = businessFunds * toInt64(0, 30) / toInt64(0, 100)
  Panel_NumberPad_Show(true, businessFunds30, nil, Panel_Guild_Incentive_Foundation_ConfirmFunction)
end

Panel_Guild_Incentive_Foundation_ConfirmFunction = function(inputNumber, param)
  -- function num : 0_13 , upvalues : guildIncentiveMoneyValue
  local self = guildIncentiveMoneyValue
  ;
  (self._edit_MoneyValue):SetEditText(makeDotMoney(inputNumber), false)
end

FGlobal_CheckGuildIncentiveUiEdit = function(targetUI)
  -- function num : 0_14 , upvalues : guildIncentiveMoneyValue
  do return targetUI ~= nil and targetUI:GetKey() == (guildIncentiveMoneyValue._edit_MoneyValue):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_GuildIncentiveClearFocusEdit = function()
  -- function num : 0_15 , upvalues : IM
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWindow)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

Panel_Guild_Incentive_Foundation_Open = function()
  -- function num : 0_16 , upvalues : guildIncentiveMoneyValue
  Panel_Guild_Incentive_Foundation:SetShow(true)
  ;
  (guildIncentiveMoneyValue._edit_MoneyValue):SetEditText("0", true)
  Panel_Guild_Incentive_Foundation_Update()
end

Panel_Guild_Incentive_Foundation_Close = function()
  -- function num : 0_17
  Panel_Guild_Incentive_Foundation:SetShow(false)
end

GuildIncentive_TitleLineReset = function()
  -- function num : 0_18 , upvalues : Guild_Incentive
  local self = Guild_Incentive
  ;
  (self._title_CharName):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CHARNAME"))
  ;
  (self._title_Ap):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_ACTIVITY"))
end

GuildIncentive_SetGuildIncentive = function()
  -- function num : 0_19 , upvalues : tempGuildIncentive
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local memberCount = myGuildListInfo:getMemberCount()
  tempGuildIncentive = {}
  for index = 1, memberCount do
    local myGuildMemberInfo = myGuildListInfo:getMember(index - 1)
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R7 in 'UnsetPending'

    tempGuildIncentive[index] = {idx = index - 1, online = myGuildMemberInfo:isOnline(), grade = myGuildMemberInfo:getGrade(), level = myGuildMemberInfo:getLevel(), class = myGuildMemberInfo:getClassType(), name = myGuildMemberInfo:getName(), ap = Int64toInt32(myGuildMemberInfo:getTotalActivity()), expiration = myGuildMemberInfo:getContractedExpirationUtc(), wp = myGuildMemberInfo:getMaxWp(), kp = myGuildMemberInfo:getExplorationPoint(), userNo = myGuildMemberInfo:getUserNo()}
  end
end

local guildIncentiveCompareName = function(w1, w2)
  -- function num : 0_20 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.name == true and w1.name < w2.name then
    return true
  end
  if w2.name < w1.name then
    return true
  end
end

local guildIncentiveCompareAp = function(w1, w2)
  -- function num : 0_21 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.ap == true and w2.ap < w1.ap then
    return true
  end
  if w1.ap < w2.ap then
    return true
  end
end

HandleClicked_GuildIncentiveSort = function(sortType)
  -- function num : 0_22 , upvalues : Guild_Incentive, _selectSortType, _listSort, tempGuildIncentive, guildIncentiveCompareName, guildIncentiveCompareAp
  local self = Guild_Incentive
  GuildIncentive_TitleLineReset()
  _selectSortType = sortType
  if sortType == 0 then
    if _listSort.name == false then
      (self._title_CharName):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CHARNAME") .. "â–\178")
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

      _listSort.name = true
    else
      ;
      (self._title_CharName):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CHARNAME") .. "â–\188")
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R2 in 'UnsetPending'

      _listSort.name = false
    end
    ;
    (table.sort)(tempGuildIncentive, guildIncentiveCompareName)
  else
    if sortType == 1 then
      if _listSort.ap == false then
        (self._title_Ap):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_ACTIVITY") .. "â–\178")
        -- DECOMPILER ERROR at PC58: Confused about usage of register: R2 in 'UnsetPending'

        _listSort.ap = true
      else
        ;
        (self._title_Ap):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_ACTIVITY") .. "â–\188")
        -- DECOMPILER ERROR at PC71: Confused about usage of register: R2 in 'UnsetPending'

        _listSort.ap = false
      end
      ;
      (table.sort)(tempGuildIncentive, guildIncentiveCompareAp)
    end
  end
  Guild_Incentive:UpdateData()
end

GuildIncentive_updateSort = function()
  -- function num : 0_23 , upvalues : Guild_Incentive, _selectSortType, tempGuildIncentive, guildIncentiveCompareName, guildIncentiveCompareAp
  local self = Guild_Incentive
  if _selectSortType == 0 then
    (table.sort)(tempGuildIncentive, guildIncentiveCompareName)
  else
    if _selectSortType == 1 then
      (table.sort)(tempGuildIncentive, guildIncentiveCompareAp)
    end
  end
end

Panel_Guild_Incentive_Foundation_Init()
registerEvent("onScreenResize", "Panel_Guild_IncentiveOption_Resize")

