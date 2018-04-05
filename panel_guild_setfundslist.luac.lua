-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_setfundslist.luac 

-- params : ...
-- function num : 0
Panel_Guild_SetFundsList:SetShow(false)
Panel_Guild_SetFundsList:ActiveMouseEventEffect(true)
Panel_Guild_SetFundsList:setMaskingChild(true)
Panel_Guild_SetFundsList:setGlassBackground(true)
Panel_Guild_SetFundsList:SetDragEnable(true)
Panel_Guild_SetFundsList:SetDragAll(true)
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local maxGuildList = 19
local maxIncentiveGrade = 4
local _guildList = {}
local _selectedMemberIndex = 0
local _selectSortType = -1
local _listSort = {name = false, tempFundsVal = "0"}
local _guildMemberList = {}
local _guildInfo = {}
local _frameGuildList = (UI.getChildControl)(Panel_Guild_SetFundsList, "Frame_GuildList")
local _contentGuildList = (UI.getChildControl)(_frameGuildList, "Frame_1_Content")
local _scroll = (UI.getChildControl)(_frameGuildList, "VerticalScroll")
local _staticBottomBG = (UI.getChildControl)(Panel_Guild_SetFundsList, "Static_BottomBG")
local _staticBottomBG2 = (UI.getChildControl)(Panel_Guild_SetFundsList, "Static_BottomBG2")
local _btnSetEachFunds = (UI.getChildControl)(_staticBottomBG, "Button_SetEachFunds")
local _btnSetAllFunds = (UI.getChildControl)(_staticBottomBG2, "Button_SetAllFunds")
local _editAllFunds = (UI.getChildControl)(_staticBottomBG2, "Edit_InputAllFunds")
local _checkAllUnlimited = (UI.getChildControl)(_staticBottomBG2, "CheckButton_FundsLimit")
local _btnClose = (UI.getChildControl)(Panel_Guild_SetFundsList, "Button_WinClose")
local _btnQuestion = (UI.getChildControl)(Panel_Guild_SetFundsList, "Button_Question")
_btnSetAllFunds:addInputEvent("Mouse_LUp", "Guild_Funds_SetAllFunds()")
_btnSetEachFunds:addInputEvent("Mouse_LUp", "Guild_Funds_SetEachFunds()")
_editAllFunds:addInputEvent("Mouse_LUp", "Guild_Funds_EditAllFunds()")
_checkAllUnlimited:addInputEvent("Mouse_LUp", "Guild_Funds_CheckAllUnlimited()")
_btnClose:addInputEvent("Mouse_LUp", "Panel_Guild_SetFundsList_Close()")
_btnQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelGuild\" )")
_btnQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelGuild\", \"true\")")
_btnQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelGuild\", \"false\")")
local Guild_Funds = {_memberGrade = (UI.getChildControl)(Panel_Guild_SetFundsList, "StaticText_C_Grade"), _memberName = (UI.getChildControl)(Panel_Guild_SetFundsList, "StaticText_C_CharName"), _memberContribution = (UI.getChildControl)(Panel_Guild_SetFundsList, "StaticText_C_ContributedTendency"), _memberFundsLimitEdit = (UI.getChildControl)(Panel_Guild_SetFundsList, "Edit_C_InputFunds"), _memberFundsIsUnlimited = (UI.getChildControl)(Panel_Guild_SetFundsList, "CheckButton_C_FundsLimit"), _title_CharName = (UI.getChildControl)(Panel_Guild_SetFundsList, "StaticText_M_CharName"), _title_Ap = (UI.getChildControl)(Panel_Guild_SetFundsList, "StaticText_M_ContributedTendency"), _title_Funds = (UI.getChildControl)(Panel_Guild_SetFundsList, "StaticText_M_Funds")}
;
(Guild_Funds._title_CharName):addInputEvent("Mouse_LUp", "HandleClicked_GuildFundsSort(0)")
;
(Guild_Funds._title_Ap):addInputEvent("Mouse_LUp", "HandleClicked_GuildFundsSort(1)")
;
(Guild_Funds._title_Funds):addInputEvent("Mouse_LUp", "HandleClicked_GuildFundsSort(2)")
;
(Guild_Funds._memberGrade):SetShow(false)
;
(Guild_Funds._memberName):SetShow(false)
;
(Guild_Funds._memberContribution):SetShow(false)
;
(Guild_Funds._memberFundsLimitEdit):SetShow(false)
;
(Guild_Funds._memberFundsIsUnlimited):SetShow(false)
local _ySize = (Guild_Funds._memberGrade):GetSizeY()
local frameTextGap = 10
local _memberCtrlCount = 0
Guild_Funds.ResetControl = function(self)
  -- function num : 0_0 , upvalues : _guildInfo, _memberCtrlCount, maxGuildList, _scroll, _contentGuildList, _guildList, UCT, Guild_Funds, _ySize, frameTextGap, _frameGuildList
  _guildInfo = ToClient_GetMyGuildInfoWrapper()
  if _guildInfo == nil then
    return 
  end
  _memberCtrlCount = _guildInfo:getMemberCount()
  if maxGuildList < _memberCtrlCount then
    _scroll:SetShow(true)
  else
    _scroll:SetShow(false)
  end
  _contentGuildList:DestroyAllChild()
  for index = 1, _memberCtrlCount do
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R5 in 'UnsetPending'

    _guildList[index] = {}
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (_guildList[index])._memberGrade = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, _contentGuildList, "StaticText_Grade_" .. index - 1)
    -- DECOMPILER ERROR at PC57: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (_guildList[index])._memberName = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, _contentGuildList, "StaticText_MemberName_" .. index - 1)
    -- DECOMPILER ERROR at PC69: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (_guildList[index])._memberContribution = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, _contentGuildList, "StaticText_MemberContribution_" .. index - 1)
    -- DECOMPILER ERROR at PC81: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (_guildList[index])._memberFundsLimitEdit = (UI.createControl)(UCT.PA_UI_CONTROL_EDIT, _contentGuildList, "Edit_memberInputFunds_" .. index - 1)
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (_guildList[index])._memberFundsIsUnlimited = (UI.createControl)(UCT.PA_UI_CONTROL_CHECKBUTTON, _contentGuildList, "Check_memberFundsButton_" .. index - 1)
    CopyBaseProperty(Guild_Funds._memberGrade, (_guildList[index])._memberGrade)
    CopyBaseProperty(Guild_Funds._memberName, (_guildList[index])._memberName)
    CopyBaseProperty(Guild_Funds._memberContribution, (_guildList[index])._memberContribution)
    CopyBaseProperty(Guild_Funds._memberFundsLimitEdit, (_guildList[index])._memberFundsLimitEdit)
    CopyBaseProperty(Guild_Funds._memberFundsIsUnlimited, (_guildList[index])._memberFundsIsUnlimited)
    local guildMemberInfo = _guildInfo:getMember(index - 1)
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
    posY = (_ySize + frameTextGap / 2) * (index - 1) + frameTextGap
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
    ((_guildList[index])._memberFundsLimitEdit):SetPosY(posY)
    ;
    ((_guildList[index])._memberFundsLimitEdit):SetShow(true)
    ;
    ((_guildList[index])._memberFundsIsUnlimited):SetPosY(posY)
    ;
    ((_guildList[index])._memberFundsIsUnlimited):SetShow(true)
  end
  Panel_Guild_SetFundsList:SetChildIndex(Guild_Funds._title_CharName, 9999)
  Panel_Guild_SetFundsList:SetChildIndex(Guild_Funds._title_Ap, 9999)
  Panel_Guild_SetFundsList:SetChildIndex(Guild_Funds._title_Funds, 9999)
  _frameGuildList:UpdateContentScroll()
  _scroll:SetControlTop()
  _frameGuildList:UpdateContentPos()
end

Guild_Funds.UpdateData = function(self)
  -- function num : 0_1 , upvalues : _guildInfo, _guildMemberList, _guildList, _scroll, _contentGuildList
  GuildFunds_SetGuildMemberList()
  GuildFunds_updateSort()
  _guildInfo = ToClient_GetMyGuildInfoWrapper()
  if _guildInfo == nil then
    return 
  end
  local memberCount = _guildInfo:getMemberCount()
  for index = 1, memberCount do
    local dataIdx = (_guildMemberList[index]).idxFromServer
    local guildMemberInfo = _guildInfo:getMember(dataIdx)
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
    local memberIsLimit = guildMemberInfo:getIsPriceLimit()
    ;
    ((_guildList[index])._memberFundsIsUnlimited):SetCheck(not memberIsLimit)
    if memberIsLimit == true then
      ((_guildList[index])._memberFundsLimitEdit):SetText(makeDotMoney(guildMemberInfo:getPriceLimit()))
      ;
      ((_guildList[index])._memberFundsLimitEdit):SetIgnore(false)
    else
      ;
      ((_guildList[index])._memberFundsLimitEdit):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED"))
      ;
      ((_guildList[index])._memberFundsLimitEdit):SetIgnore(true)
    end
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
          do
            local tempActivityText = tostring(guildMemberInfo:getTotalActivity()) .. "(+" .. tostring(guildMemberInfo:getUsableActivity()) .. ")"
            ;
            ((_guildList[index])._memberContribution):SetText(tempActivityText)
            if gradeType == 0 then
              ((_guildList[index])._memberFundsLimitEdit):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED"))
              ;
              ((_guildList[index])._memberFundsLimitEdit):SetIgnore(true)
              ;
              ((_guildList[index])._memberFundsIsUnlimited):SetCheck(true)
              ;
              ((_guildList[index])._memberFundsIsUnlimited):SetIgnore(true)
            else
              ;
              ((_guildList[index])._memberFundsIsUnlimited):SetIgnore(false)
              ;
              ((_guildList[index])._memberFundsIsUnlimited):addInputEvent("Mouse_LUp", "ToggleLimitOfMember(" .. index .. ")")
              ;
              ((_guildList[index])._memberFundsLimitEdit):addInputEvent("Mouse_LUp", "SetTempFundsOfMember(" .. index .. ")")
            end
            -- DECOMPILER ERROR at PC232: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC232: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC232: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC232: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  _scroll:SetInterval(_contentGuildList:GetSizeY() / 100 * 1.1)
end

SetTempFundsOfMember = function(index)
  -- function num : 0_2 , upvalues : _guildMemberList, _guildInfo
  local dataIdx = (_guildMemberList[index]).idxFromServer
  Panel_NumberPad_Show(true, _guildInfo:getGuildBusinessFunds_s64(), index, SetTempFundsOfMemberCallback)
end

SetTempFundsOfMemberCallback = function(fundsValue, index)
  -- function num : 0_3 , upvalues : _guildMemberList, _guildInfo, _guildList
  local dataIdx = (_guildMemberList[index]).idxFromServer
  local guildMemberInfo = _guildInfo:getMember(dataIdx)
  if fundsValue == guildMemberInfo:getPriceLimit() then
    ((_guildList[index])._memberFundsLimitEdit):SetText("<PAColor0xffefefef>" .. tostring(makeDotMoney(fundsValue)) .. "<PAOldColor>")
  else
    ;
    ((_guildList[index])._memberFundsLimitEdit):SetText("<PAColor0xff00b4ff>" .. tostring(makeDotMoney(fundsValue)) .. "<PAOldColor>")
  end
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (_guildMemberList[index]).tempFundsVal = tostring(fundsValue)
end

ToggleLimitOfMember = function(index)
  -- function num : 0_4 , upvalues : _guildMemberList, _guildInfo, _guildList
  local dataIdx = (_guildMemberList[index]).idxFromServer
  local guildMemberInfo = _guildInfo:getMember(dataIdx)
  local memberIsUnlimited = not guildMemberInfo:getIsPriceLimit()
  if ((_guildList[index])._memberFundsIsUnlimited):IsCheck() then
    if memberIsUnlimited then
      ((_guildList[index])._memberFundsLimitEdit):SetText("<PAColor0xffefefef>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED") .. "<PAOldColor>")
    else
      ;
      ((_guildList[index])._memberFundsLimitEdit):SetText("<PAColor0xff00b4ff>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED") .. "<PAOldColor>")
    end
    ;
    ((_guildList[index])._memberFundsLimitEdit):SetIgnore(true)
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_guildMemberList[index]).tempFundsVal = "0"
  else
    local priceLimit = guildMemberInfo:getPriceLimit()
    if memberIsUnlimited then
      ((_guildList[index])._memberFundsLimitEdit):SetText("<PAColor0xff00b4ff>" .. tostring(makeDotMoney(priceLimit)) .. "<PAOldColor>")
    else
      ;
      ((_guildList[index])._memberFundsLimitEdit):SetText("<PAColor0xffefefef>" .. tostring(makeDotMoney(priceLimit)) .. "<PAOldColor>")
    end
    ;
    ((_guildList[index])._memberFundsLimitEdit):SetIgnore(false)
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (_guildMemberList[index]).tempFundsVal = tostring(priceLimit)
  end
end

Guild_Funds_SetEachFunds = function()
  -- function num : 0_5 , upvalues : _guildInfo, _guildMemberList, _guildList
  if PaGlobal_Guild_SetFundsList_safeZoneCheck() == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_ALERT"))
    return 
  end
  for index = 1, _guildInfo:getMemberCount() do
    local dataIdx = (_guildMemberList[index]).idxFromServer
    local guildMember = _guildInfo:getMember(dataIdx)
    if guildMember:getGrade() ~= 0 and ((_guildList[index])._memberFundsIsUnlimited):IsCheck() and guildMember:getIsPriceLimit() then
      ToClient_SetGuildMemberPriceLimit(dataIdx, 0, false)
      ;
      ((_guildList[index])._memberFundsLimitEdit):SetText("<PAColor0xffefefef>" .. PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED") .. "<PAOldColor>")
    end
    if not guildMember:getIsPriceLimit() then
      ToClient_SetGuildMemberPriceLimit(dataIdx, (_guildMemberList[index]).tempFundsVal, true)
      ;
      ((_guildList[index])._memberFundsLimitEdit):SetText("<PAColor0xffefefef>" .. tostring(makeDotMoney((_guildMemberList[index]).tempFundsVal)) .. "<PAOldColor>")
    else
      if (_guildMemberList[index]).tempFundsVal ~= tostring(guildMember:getPriceLimit()) then
        ToClient_SetGuildMemberPriceLimit(dataIdx, (_guildMemberList[index]).tempFundsVal, true)
        ;
        ((_guildList[index])._memberFundsLimitEdit):SetText("<PAColor0xffefefef>" .. tostring(makeDotMoney((_guildMemberList[index]).tempFundsVal)) .. "<PAOldColor>")
      end
    end
  end
end

Panel_Guild_SetFundsList_Close = function()
  -- function num : 0_6
  if Panel_Guild_SetFundsList:GetShow() then
    Panel_Guild_SetFundsList:SetShow(false)
  end
end

Panel_Guild_SetFundsList_Resize = function()
  -- function num : 0_7
  Panel_Guild_SetFundsList:SetPosX(getScreenSizeX() / 2 - Panel_Guild_SetFundsList:GetSizeX() / 2)
  Panel_Guild_SetFundsList:SetPosY(getScreenSizeY() / 2 - Panel_Guild_SetFundsList:GetSizeY() / 2 - 50)
end

PaGlobal_Guild_SetFundsList_Open = function()
  -- function num : 0_8 , upvalues : _guildInfo, Guild_Funds, _editAllFunds, _checkAllUnlimited
  if PaGlobal_Guild_SetFundsList_safeZoneCheck() then
    _guildInfo = ToClient_GetMyGuildInfoWrapper()
    Panel_Guild_SetFundsList:SetShow(true)
    Guild_Funds:ResetControl()
    Guild_Funds:UpdateData()
    Panel_Guild_SetFundsList_Resize()
    _editAllFunds:SetText("0")
    _editAllFunds:SetIgnore(false)
    _checkAllUnlimited:SetCheck(false)
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_ALERT"))
  end
end

PaGlobal_Guild_SetFundsList_safeZoneCheck = function()
  -- function num : 0_9
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local pcPosition = (player:get()):getPosition()
  if pcPosition == nil then
    return 
  end
  local regionInfo = getRegionInfoByPosition(pcPosition)
  return (regionInfo:get()):isSafeZone()
end

GuildFunds_TitleLineReset = function()
  -- function num : 0_10 , upvalues : Guild_Funds
  local self = Guild_Funds
  ;
  (self._title_CharName):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CHARNAME"))
  ;
  (self._title_Ap):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_ACTIVITY"))
  ;
  (self._title_Funds):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CURRENTFUNDS"))
end

GuildFunds_SetGuildMemberList = function()
  -- function num : 0_11 , upvalues : _guildInfo, _guildMemberList
  _guildInfo = ToClient_GetMyGuildInfoWrapper()
  if _guildInfo == nil then
    return 
  end
  local memberCount = _guildInfo:getMemberCount()
  _guildMemberList = {}
  for index = 1, memberCount do
    local myGuildMemberInfo = _guildInfo:getMember(index - 1)
    -- DECOMPILER ERROR at PC61: Confused about usage of register: R6 in 'UnsetPending'

    _guildMemberList[index] = {idxFromServer = index - 1, online = myGuildMemberInfo:isOnline(), grade = myGuildMemberInfo:getGrade(), level = myGuildMemberInfo:getLevel(), class = myGuildMemberInfo:getClassType(), name = myGuildMemberInfo:getName(), ap = Int64toInt32(myGuildMemberInfo:getTotalActivity()), expiration = myGuildMemberInfo:getContractedExpirationUtc(), wp = myGuildMemberInfo:getMaxWp(), kp = myGuildMemberInfo:getExplorationPoint(), userNo = myGuildMemberInfo:getUserNo(), tempFundsVal = tostring(myGuildMemberInfo:getPriceLimit())}
  end
end

local guildFundsCompareByName = function(w1, w2)
  -- function num : 0_12 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.name == true and w1.name < w2.name then
    return true
  end
  if w2.name < w1.name then
    return true
  end
end

local guildFundsCompareByAp = function(w1, w2)
  -- function num : 0_13 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.ap == true and w2.ap < w1.ap then
    return true
  end
  if w1.ap < w2.ap then
    return true
  end
end

local guildFundsCompareByFunds = function(w1, w2)
  -- function num : 0_14 , upvalues : _listSort
  -- DECOMPILER ERROR at PC13: Unhandled construct in 'MakeBoolean' P1

  if _listSort.funds == true and tonumber(w2.tempFundsVal) < tonumber(w1.tempFundsVal) then
    return true
  end
  if tonumber(w1.tempFundsVal) < tonumber(w2.tempFundsVal) then
    return true
  end
end

HandleClicked_GuildFundsSort = function(sortType)
  -- function num : 0_15 , upvalues : Guild_Funds, _selectSortType, _listSort, _guildMemberList, guildFundsCompareByName, guildFundsCompareByAp, guildFundsCompareByFunds
  local self = Guild_Funds
  GuildFunds_TitleLineReset()
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
    (table.sort)(_guildMemberList, guildFundsCompareByName)
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
      (table.sort)(_guildMemberList, guildFundsCompareByAp)
    else
      if sortType == 2 then
        if _listSort.funds == false then
          (self._title_Funds):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CURRENTFUNDS") .. "â–\178")
          -- DECOMPILER ERROR at PC95: Confused about usage of register: R2 in 'UnsetPending'

          _listSort.funds = true
        else
          ;
          (self._title_Funds):SetText(PAGetString(Defines.StringSheet_RESOURCE, "GUILD_TEXT_CURRENTFUNDS") .. "â–\188")
          -- DECOMPILER ERROR at PC108: Confused about usage of register: R2 in 'UnsetPending'

          _listSort.funds = false
        end
        ;
        (table.sort)(_guildMemberList, guildFundsCompareByFunds)
      end
    end
  end
  Guild_Funds:UpdateData()
end

GuildFunds_updateSort = function()
  -- function num : 0_16 , upvalues : Guild_Funds, _selectSortType, _guildMemberList, guildFundsCompareByName, guildFundsCompareByAp, guildFundsCompareByFunds
  local self = Guild_Funds
  if _selectSortType == 0 then
    (table.sort)(_guildMemberList, guildFundsCompareByName)
  else
    if _selectSortType == 1 then
      (table.sort)(_guildMemberList, guildFundsCompareByAp)
    else
      if _selectSortType == 2 then
        (table.sort)(_guildMemberList, guildFundsCompareByFunds)
      end
    end
  end
end

Guild_Funds_EditAllFunds = function()
  -- function num : 0_17 , upvalues : _guildInfo
  Panel_NumberPad_Show(true, _guildInfo:getGuildBusinessFunds_s64(), 0, Guild_Funds_EditAllFundsCallBack)
end

Guild_Funds_EditAllFundsCallBack = function(inputNumber)
  -- function num : 0_18 , upvalues : _editAllFunds
  _editAllFunds:SetText(tostring(inputNumber))
end

Guild_Funds_CheckAllUnlimited = function()
  -- function num : 0_19 , upvalues : _checkAllUnlimited, _editAllFunds
  if _checkAllUnlimited:IsCheck() then
    _editAllFunds:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED"))
    _editAllFunds:SetIgnore(true)
  else
    _editAllFunds:SetText("0")
    _editAllFunds:SetIgnore(false)
  end
end

Guild_Funds_SetAllFunds = function()
  -- function num : 0_20 , upvalues : _guildInfo, _editAllFunds, _checkAllUnlimited
  _guildInfo = ToClient_GetMyGuildInfoWrapper()
  if _guildInfo == nil then
    return 
  end
  if PaGlobal_Guild_SetFundsList_safeZoneCheck() == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_INCENTIVE_ALERT"))
    return 
  end
  local allFundsVal = _editAllFunds:GetText()
  for i = 0, _guildInfo:getMemberCount() - 1 do
    local processed = false
    local guildMemberInfo = _guildInfo:getMember(i)
    if guildMemberInfo:getGrade() ~= 0 and _checkAllUnlimited:IsCheck() and guildMemberInfo:getIsPriceLimit() then
      ToClient_SetGuildMemberPriceLimit(i, 0, false)
    end
    if not guildMemberInfo:getIsPriceLimit() then
      ToClient_SetGuildMemberPriceLimit(i, allFundsVal, true)
    else
      if allFundsVal ~= tostring(guildMemberInfo:getPriceLimit()) then
        ToClient_SetGuildMemberPriceLimit(i, allFundsVal, true)
      end
    end
  end
  Panel_Guild_SetFundsList_Close()
end

registerEvent("onScreenResize", "Panel_Guild_SetFundsList_Resize")

