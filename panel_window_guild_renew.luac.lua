-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\console\panel_window_guild_renew.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local Window_GuildInfo = {
_ui = {_static_RadioButtonBg = (UI.getChildControl)(Panel_Console_Window_Guild, "Static_RadioButtonBg"), _static_GuildInfomationBg = (UI.getChildControl)(Panel_Console_Window_Guild, "Static_GuildInformationBg"), _static_GuildListBg = (UI.getChildControl)(Panel_Console_Window_Guild, "Static_GuildListBg"), _static_GuildMoneyBg = (UI.getChildControl)(Panel_Console_Window_Guild, "Static_GuildMoneyBg"), _static_BottomBg = (UI.getChildControl)(Panel_Console_Window_Guild, "Static_BottomBg"), 
_radioButton = {}
, 
_guildInfomation = {}
, 
_guildList = {}
, 
_guildMoney = {}
, 
_bottom = {}
}
, 
_config = {_isVoiceOpen = ToClient_IsContentsGroupOpen("75")}
, _selectSortType = -1, 
_listSort = {_gradeSort, _levelSort, _nameSort, _apSort, _expriationSort, _wpSort, _kpSort; _grade = false, _level = false, _name = false, _ap = false, _expiration = false, _wp = false, _kp = false}
, 
_memberListInfo = {}
, 
_memberListUI = {}
, _tabIndex = 0, _selectMemberIndex = -1}
Window_GuildInfo.SetSortFunc = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  (self._listSort)._gradeSort = function(w1, w2)
    -- function num : 0_0_0 , upvalues : self
    local w1Grade = w1._grade
    local w2Grade = w2._grade
    if w1Grade == 2 then
      w1Grade = 3
    else
      if w1Grade == 3 then
        w1Grade = 2
      end
    end
    if w2Grade == 2 then
      w2Grade = 3
    else
      if w2Grade == 3 then
        w2Grade = 2
      end
    end
    if w1Grade >= w2Grade then
      do
        do return (self._listSort)._grade ~= true end
        do return w2Grade < w1Grade end
        -- DECOMPILER ERROR: 4 unprocessed JMP targets
      end
    end
  end

  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._listSort)._levelSort = function(w1, w2)
    -- function num : 0_0_1 , upvalues : self
    -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

    if (self._listSort)._level == true and w2._level < w1._level then
      return true
    end
    if w1._level < w2._level then
      return true
    end
  end

  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._listSort)._nameSort = function(w1, w2)
    -- function num : 0_0_2 , upvalues : self
    -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

    if (self._listSort)._name == true and w1._name < w2._name then
      return true
    end
    if w2._name < w1._name then
      return true
    end
  end

  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._listSort)._apSort = function(w1, w2)
    -- function num : 0_0_3 , upvalues : self
    -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

    if (self._listSort)._ap == true and w2._ap < w1._ap then
      return true
    end
    if w1._ap < w2._ap then
      return true
    end
  end

  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._listSort)._expriationSort = function(w1, w2)
    -- function num : 0_0_4 , upvalues : self
    -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

    if (self._listSort)._expiration == true and w2._expiration < w1._expiration then
      return true
    end
    if w1._expiration < w2._expiration then
      return true
    end
  end

  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._listSort)._wpSort = function(w1, w2)
    -- function num : 0_0_5 , upvalues : self
    -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

    if (self._listSort)._wp == true and w2._wp < w1._wp then
      return true
    end
    -- DECOMPILER ERROR at PC27: Unhandled construct in 'MakeBoolean' P1

    if (self._listSort)._wp == false and (self._listSort)._kp == true and w2._kp < w1._kp then
      return true
    end
    if w1._wp < w2._wp then
      return true
    end
  end

end

PaGlobalFunc_Guild_HandleMenberSort = function(sortType)
  -- function num : 0_1 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  self._selectSortType = sortType
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  if sortType == 0 then
    if (self._listSort)._grade == false then
      (self._listSort)._grade = true
    else
      -- DECOMPILER ERROR at PC12: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (self._listSort)._grade = false
    end
    ;
    (table.sort)(self._memberListInfo, (self._listSort)._gradeSort)
  else
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

    if sortType == 1 then
      if (self._listSort)._level == false then
        (self._listSort)._level = true
      else
        -- DECOMPILER ERROR at PC30: Confused about usage of register: R2 in 'UnsetPending'

        ;
        (self._listSort)._level = false
      end
      ;
      (table.sort)(self._memberListInfo, (self._listSort)._levelSort)
    else
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

      if sortType == 2 then
        if (self._listSort)._name == false then
          (self._listSort)._name = true
        else
          -- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

          ;
          (self._listSort)._name = false
        end
        ;
        (table.sort)(self._memberListInfo, (self._listSort)._nameSort)
      else
        -- DECOMPILER ERROR at PC63: Confused about usage of register: R2 in 'UnsetPending'

        if sortType == 3 then
          if (self._listSort)._ap == false then
            (self._listSort)._ap = true
          else
            -- DECOMPILER ERROR at PC66: Confused about usage of register: R2 in 'UnsetPending'

            ;
            (self._listSort)._ap = false
          end
          ;
          (table.sort)(self._memberListInfo, (self._listSort)._apSort)
        else
          -- DECOMPILER ERROR at PC81: Confused about usage of register: R2 in 'UnsetPending'

          if sortType == 4 then
            if (self._listSort)._expiration == false then
              (self._listSort)._expiration = true
            else
              -- DECOMPILER ERROR at PC84: Confused about usage of register: R2 in 'UnsetPending'

              ;
              (self._listSort)._expiration = false
            end
            ;
            (table.sort)(self._memberListInfo, (self._listSort)._expriationSort)
          else
            -- DECOMPILER ERROR at PC99: Confused about usage of register: R2 in 'UnsetPending'

            if sortType == 5 then
              if (self._listSort)._wp == false then
                (self._listSort)._wp = true
              else
                -- DECOMPILER ERROR at PC106: Confused about usage of register: R2 in 'UnsetPending'

                if (self._listSort)._kp == false then
                  (self._listSort)._kp = true
                else
                  -- DECOMPILER ERROR at PC109: Confused about usage of register: R2 in 'UnsetPending'

                  ;
                  (self._listSort)._wp = false
                  -- DECOMPILER ERROR at PC111: Confused about usage of register: R2 in 'UnsetPending'

                  ;
                  (self._listSort)._kp = false
                end
              end
              ;
              (table.sort)(self._memberListInfo, (self._listSort)._wpSort)
            end
          end
        end
      end
    end
  end
end

Window_GuildInfo.GuildInfo_Open = function(self)
  -- function num : 0_2
  ((self._ui)._static_GuildInfomationBg):SetShow(true)
end

Window_GuildInfo.GuildList_Open = function(self)
  -- function num : 0_3
  ((self._ui)._static_GuildListBg):SetShow(true)
end

Window_GuildInfo.GuildInfo_Close = function(self)
  -- function num : 0_4
  ((self._ui)._static_GuildInfomationBg):SetShow(false)
end

Window_GuildInfo.GuildList_Close = function(self)
  -- function num : 0_5
  ((self._ui)._static_GuildListBg):SetShow(false)
end

PaGlobalFunc_Guild_InfoOpen = function()
  -- function num : 0_6 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  self._selectMemberIndex = -1
  ;
  (((self._ui)._bottom)._button_Contract):SetShow(false)
  ;
  (((self._ui)._bottom)._button_Leave):SetShow(false)
  ;
  ((self._ui)._radioButton_GuildMoneyInput):SetShow(false)
  ;
  ((self._ui)._radioButton_GuildMoneyOutput):SetShow(false)
  self:GuildInfo_Open()
  self:GuildList_Close()
  self:UpdateGuildInfo()
end

Window_GuildInfo.UpdateGuildInfo = function(self)
  -- function num : 0_7
  self:SetDataByGuildGrade()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  local myGuildAllianceChair = (ToClient_GetMyGuildAlliancChairGuild())
  local myGuildAllianceCache = nil
  if myGuildAllianceChair ~= nil then
    myGuildAllianceCache = myGuildAllianceChair
  else
    myGuildAllianceCache = myGuildInfo
  end
  if myGuildInfo ~= nil then
    local guildRank = myGuildInfo:getMemberCountLevel()
    local guildRankString = ""
    if guildRank == 1 then
      guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_SMALL")
    else
      if guildRank == 2 then
        guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_MIDDLE")
      else
        if guildRank == 3 then
          guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIG")
        else
          if guildRank == 4 then
            guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIGGEST")
          end
        end
      end
    end
    local skillPointInfo = ToClient_getSkillPointInfo(3)
    local skillPointPercent = (string.format)("%.0f", skillPointInfo._currentExp / skillPointInfo._nextLevelExp * 100)
    if tonumber(skillPointPercent) > 100 then
      skillPointPercent = 100
    end
    ;
    (((self._ui)._guildInfomation)._staticText_GuildTitle):SetText(myGuildInfo:getName())
    ;
    (((self._ui)._guildInfomation)._staticText_RankValue):SetText(guildRankString .. "(" .. myGuildInfo:getMemberCount() .. "/" .. myGuildInfo:getJoinableMemberCount() .. ")")
    ;
    (((self._ui)._guildInfomation)._staticText_MasterValue):SetText(myGuildInfo:getGuildMasterName())
    ;
    (((self._ui)._guildInfomation)._staticText_Protectvalue):SetText(myGuildInfo:getProtectGuildMemberCount() .. "/" .. myGuildInfo:getAvaiableProtectGuildMemberCount())
    local pointValue = tostring(skillPointInfo._remainPoint) .. "/" .. tostring(skillPointInfo._acquirePoint - 1)
    local pointPercent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_SKILLPOINTPERCENT_SUBTITLE", "skillPointPercent", skillPointPercent)
    ;
    (((self._ui)._guildInfomation)._staticText_PointValue):SetText(pointValue .. pointPercent)
    local guildArea1 = ""
    local territoryKey = ""
    local territoryWarName = ""
    ;
    (((self._ui)._guildInfomation)._staticText_TerritoryAreaValue):SetText("-")
    if myGuildAllianceCache:getTerritoryCount() > 0 then
      for idx = 0, myGuildAllianceCache:getTerritoryCount() - 1 do
        territoryKey = myGuildAllianceCache:getTerritoryKeyAt(idx)
        if territoryKey >= 0 then
          local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(territoryKey)
          if territoryInfoWrapper ~= nil then
            guildArea1 = territoryInfoWrapper:getTerritoryName()
            local territoryComma = ", "
            if territoryWarName == "" then
              territoryComma = ""
            end
            territoryWarName = territoryWarName .. territoryComma .. guildArea1
          end
        end
      end
      ;
      (((self._ui)._guildInfomation)._staticText_TerritoryAreaValue):SetText(territoryWarName)
    end
    local guildServantElephantCount = guildStable_getServantCount((CppEnums.VehicleType).Type_Elephant)
    local guildServantShipCount = guildStable_getServantCount((CppEnums.VehicleType).Type_SailingBoat)
    local guilServantValueCount = ""
    ;
    (((self._ui)._guildInfomation)._staticText_ServantValue):SetText("-")
    if guildServantElephantCount > 0 then
      guilServantValueCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_SERVANTCOUNT_ELEPHANT_ONLY", "guildServantElephantCount", guildServantElephantCount)
    end
    if guildServantShipCount > 0 then
      if guildServantElephantCount > 0 then
        guilServantValueCount = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_SERVANTCOUNT_GUILDVEHICLE_BOTH", "guilServantValueCount", guilServantValueCount, "guildServantShipCount", guildServantShipCount)
      else
        guilServantValueCount = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_SERVANTCOUNT_SAILBOAT_ONLY", "guildServantShipCount", guildServantShipCount)
      end
    end
    ;
    (((self._ui)._guildInfomation)._staticText_ServantValue):SetText(guilServantValueCount)
    local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
    if isGuildMaster == true then
      local isSet = setGuildTextureByGuildNo(myGuildInfo:getGuildNo_s64(), ((self._ui)._guildInfomation)._staticText_GuildTitle)
      if isSet == false then
        (((self._ui)._guildInfomation)._staticText_GuildTitle):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(((self._ui)._guildInfomation)._staticText_GuildTitle, 183, 1, 188, 6)
        ;
        ((((self._ui)._guildInfomation)._staticText_GuildTitle):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((self._ui)._guildInfomation)._staticText_GuildTitle):setRenderTexture((((self._ui)._guildInfomation)._staticText_GuildTitle):getBaseTexture())
      else
        do
          do
            ;
            ((((self._ui)._guildInfomation)._staticText_GuildTitle):getBaseTexture()):setUV(0, 0, 1, 1)
            ;
            (((self._ui)._guildInfomation)._staticText_GuildTitle):setRenderTexture((((self._ui)._guildInfomation)._staticText_GuildTitle):getBaseTexture())
            PaGlobalFunc_Guild_Close()
          end
        end
      end
    end
  end
end

Window_GuildInfo.SetDataByGuildGrade = function(self)
  -- function num : 0_8
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local guildGrade = (myGuildInfo:getGuildGrade())
  local memberData = nil
  local memberCount = myGuildInfo:getMemberCount()
  for memberIdx = 0, memberCount - 1 do
    memberData = myGuildInfo:getMember(memberIdx)
    if memberData:isSelf() then
      break
    end
  end
  do
    if memberData == nil then
      return 
    end
    if (guildGrade == 0 and not ((getSelfPlayer()):get()):isGuildMaster()) or ((getSelfPlayer()):get()):isGuildSubMaster() then
      local accumulateTax_s64 = myGuildInfo:getAccumulateTax()
      local accumulateCost_s64 = myGuildInfo:getAccumulateGuildHouseCost()
      do
        local businessFunds_s64 = myGuildInfo:getGuildBusinessFunds_s64()
        -- DECOMPILER ERROR at PC96: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC96: Unhandled construct in 'MakeBoolean' P3

        if ((toInt64(0, 0) >= accumulateTax_s64 and toInt64(0, 0) >= accumulateCost_s64) or memberData:isCollectableBenefit()) and memberData:isFreeAgent() == false and toInt64(0, 0) < memberData:getContractedBenefit() and toInt64(0, 0) == businessFunds_s64 then
        end
      end
    end
  end
end

PaGlobalFunc_Guild_ListOpen = function()
  -- function num : 0_9 , upvalues : Window_GuildInfo, UI_color
  local self = Window_GuildInfo
  ;
  (((self._ui)._bottom)._button_Contract):SetShow(true)
  ;
  (((self._ui)._bottom)._button_Leave):SetShow(true)
  self._selectMemberIndex = -1
  self:GuildList_Open()
  self:GuildInfo_Close()
  self:UpdateGuildList()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  local guildGrade = (myGuildInfo:getGuildGrade())
  local memberData = nil
  local memberCount = myGuildInfo:getMemberCount()
  for memberIdx = 0, memberCount - 1 do
    memberData = myGuildInfo:getMember(memberIdx)
    if memberData:isSelf() then
      break
    end
  end
  do
    if memberData == nil then
      return 
    end
    if guildGrade == 0 then
      local accumulateTax_s64 = myGuildInfo:getAccumulateTax()
      local accumulateCost_s64 = myGuildInfo:getAccumulateGuildHouseCost()
      local businessFunds_s64 = myGuildInfo:getGuildBusinessFunds_s64()
      if toInt64(0, 0) < accumulateTax_s64 or toInt64(0, 0) < accumulateCost_s64 then
        if businessFunds_s64 < accumulateTax_s64 or businessFunds_s64 < accumulateCost_s64 then
          ((self._ui)._radioButton_GuildMoneyInput):SetMonoTone(false)
          ;
          ((self._ui)._radioButton_GuildMoneyInput):SetEnable(true)
        else
          ;
          ((self._ui)._radioButton_GuildMoneyInput):SetMonoTone(true)
          ;
          ((self._ui)._radioButton_GuildMoneyInput):SetEnable(false)
        end
      else
        ;
        ((self._ui)._radioButton_GuildMoneyInput):SetMonoTone(true)
        ;
        ((self._ui)._radioButton_GuildMoneyInput):SetEnable(false)
      end
      if memberData:isCollectableBenefit() and memberData:isFreeAgent() == false and toInt64(0, 0) < memberData:getContractedBenefit() then
        ((self._ui)._radioButton_GuildMoneyOutput):SetEnable(true)
        ;
        ((self._ui)._radioButton_GuildMoneyOutput):SetMonoTone(false)
        if toInt64(0, 0) == businessFunds_s64 then
          ((self._ui)._radioButton_GuildMoneyOutput):SetFontColor(UI_color.C_FFF26A6A)
        else
          ;
          ((self._ui)._radioButton_GuildMoneyOutput):SetFontColor(UI_color.C_FFC4A68A)
        end
      else
        ;
        ((self._ui)._radioButton_GuildMoneyOutput):SetEnable(false)
        ;
        ((self._ui)._radioButton_GuildMoneyOutput):SetMonoTone(true)
      end
    end
  end
end

Window_GuildInfo.UpdateGuildList = function(self)
  -- function num : 0_10
  self._selectMemberIndex = -1
  self:SetGuildList()
  PaGlobalFunc_Guild_HandleMenberSort(0)
  self:GuildListUpdate()
end

Window_GuildInfo.SetGuildList = function(self)
  -- function num : 0_11
  self._memberListInfo = {}
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local memberCount = myGuildListInfo:getMemberCount()
  for index = 0, memberCount - 1 do
    local myGuildMemberInfo = myGuildListInfo:getMember(index)
    if myGuildMemberInfo == nil then
      return 
    end
    local memberInfo = {_idx = index, _online = myGuildMemberInfo:isOnline(), _grade = myGuildMemberInfo:getGrade(), _level = myGuildMemberInfo:getLevel(), _class = myGuildMemberInfo:getClassType(), _name = myGuildMemberInfo:getName(), _charName = myGuildMemberInfo:getCharacterName(), _ap = Int64toInt32(myGuildMemberInfo:getTotalActivity()), _expiration = myGuildMemberInfo:getContractedExpirationUtc(), _wp = myGuildMemberInfo:getMaxWp(), _kp = myGuildMemberInfo:getExplorationPoint(), _userNo = myGuildMemberInfo:getUserNo()}
    -- DECOMPILER ERROR at PC57: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (self._memberListInfo)[index] = memberInfo
  end
end

Window_GuildInfo.GuildListUpdate = function(self)
  -- function num : 0_12
  (((self._ui)._list2_GuildList):getElementManager()):clearKey()
  for index = 0, #self._memberListInfo do
    (((self._ui)._list2_GuildList):getElementManager()):pushKey(toInt64(0, index))
    ;
    ((self._ui)._list2_GuildList):requestUpdateByKey(toInt64(0, index))
  end
end

Window_GuildInfo.InitRegistEvnet = function(self)
  -- function num : 0_13
  registerEvent("FromClient_ResponseGuildUpdate", "PaGlobalFunc_FromClient_ResponseGuildUpdate")
  registerEvent("ResponseGuild_invite", "PaGlobalFunc_FromClient_ResponseGuild_invite")
  registerEvent("ResponseGuild_refuse", "PaGlobalFunc_FromClient_ResponseGuild_refuse")
  registerEvent("FromClient_GuildInviteForGuildGrade", "PaGlobalFunc_FromClient_ResponseGuildInviteForGuildGrade")
  registerEvent("FromClient_RequestExpelMemberFromGuild", "PaGlobalFunc_FromClient_RequestExpelMemberFromGuild")
  registerEvent("FromClient_UpdateGuildContract", "PaGlobalFunc_FromClient_ResponseUpdateGuildContract")
  registerEvent("FromClient_NotifyGuildMessage", "PaGlobalFunc_FromClient_NotifyGuildMessage")
end

PaGlobalFunc_FromClient_NotifyGuildMessage = function(msgType, strParam1, strParam2, s64_param1, s64_param2, s64_param3)
  -- function num : 0_14
  local param1 = Int64toInt32(s64_param1)
  local param2 = Int64toInt32(s64_param2)
  local param3 = Int64toInt32(s64_param3)
  if msgType == 0 then
    local message = ""
    if param1 == 0 then
      message = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_CLAN_OUT")
    else
      message = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_GUILD_OUT")
    end
    Proc_ShowMessage_Ack(message)
  else
    do
      if msgType == 1 then
        local message = ""
        if param1 == 0 then
          message = PAGetStringParam1(Defines.StringSheet_GAME, "GAME_MESSAGE_CLANMEMBER_OUT", "familyName", strParam1)
        else
          message = PAGetStringParam1(Defines.StringSheet_GAME, "GAME_MESSAGE_GUILDMEMBER_OUT", "familyName", strParam1)
        end
        Proc_ShowMessage_Ack(message)
      else
        do
          if msgType == 2 then
            local message = ""
            if param1 == 0 then
              message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_JOIN_GUILD", "name", strParam1)
            else
              message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_JOIN_GUILD", "name", strParam1)
            end
            Proc_ShowMessage_Ack(message)
          else
            do
              if msgType == 3 then
                local message = ""
                if param1 == 0 then
                  message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_WHO_JOIN_CLAN", "name", strParam1)
                else
                  message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_WHO_JOIN_GUILD", "name", strParam1)
                end
                Proc_ShowMessage_Ack(message)
              else
                do
                  if msgType == 4 then
                    local message = ""
                    if param1 == 0 then
                      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_CLAN_MSG", "name", strParam1)
                    else
                      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD_MSG", "name", strParam1)
                    end
                    Proc_ShowMessage_Ack(message)
                  else
                    do
                      if msgType == 5 then
                        local textGrade = ""
                        if param1 == 0 then
                          textGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN")
                        else
                          textGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD")
                        end
                        local message = ""
                        if param2 == 0 then
                          message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_EXPEL_SELF", "guild", strParam2)
                        else
                          message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_EXPEL_OTHER", "name", strParam1, "guild", strParam2)
                        end
                        Proc_ShowMessage_Ack(message)
                      else
                        do
                          if msgType == 6 then
                            local message = ""
                            if param1 <= 30 and param2 > 30 then
                              message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_COMPORATETAX_GUILDMEMBERCOUNT", "membercount", "30", "silver", PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERCOUNT_10"))
                            else
                              if param1 <= 50 and param2 > 50 then
                                message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_COMPORATETAX_GUILDMEMBERCOUNT", "membercount", "50", "silver", PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERCOUNT_25"))
                              else
                                if param1 <= 75 and param2 > 75 then
                                  message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_COMPORATETAX_GUILDMEMBERCOUNT", "membercount", "75", "silver", PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERCOUNT_50"))
                                else
                                  message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_INCREASE_GUILDMEMBERCOUNT", "membercount", param2)
                                end
                              end
                            end
                            Proc_ShowMessage_Ack(message)
                          else
                            do
                              if msgType == 7 then
                                local message = ""
                                local characterName = strParam1
                                local userNickName = strParam2
                                if GameOption_ShowGuildLoginMessage() == true then
                                  if param1 == 0 then
                                    message = PAGetStringParam2(Defines.StringSheet_GAME, "GAME_MESSAGE_LOGIN_GUILD_MEMBER", "familyName", userNickName, "characterName", characterName)
                                  else
                                    if param1 == 1 then
                                      message = PAGetStringParam2(Defines.StringSheet_GAME, "GAME_MESSAGE_LOGOUT_GUILD_MEMBER", "familyName", userNickName, "characterName", characterName)
                                    end
                                  end
                                  Proc_ShowMessage_Ack(message)
                                end
                              else
                                do
                                  if msgType == 8 then
                                    local message = ""
                                    local characterName = strParam1
                                    local userNickName = strParam2
                                  else
                                    do
                                      if msgType == 9 then
                                        local message = {}
                                        if param1 > 15 then
                                          message.main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERLEVELUP_MAIN", "strParam1", strParam1, "param1", param1)
                                          message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
                                          message.addMsg = ""
                                          Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
                                        end
                                      else
                                        do
                                          if msgType == 10 then
                                            local message = {}
                                            if param1 <= 8 then
                                              local lifeLevel = nil
                                              if _ContentsGroup_isUsedNewCharacterInfo == false then
                                                lifeLevel = FGlobal_CraftLevel_Replace(param2, param1)
                                              else
                                                lifeLevel = FGlobal_UI_CharacterInfo_Basic_Global_CraftLevelReplace(param2)
                                              end
                                              message.main = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERLIFELEVELUP_MAIN", "strParam1", strParam1, "param1", lifeType[param1], "lifeLevel", lifeLevel)
                                              message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
                                              message.addMsg = ""
                                              Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
                                            end
                                          else
                                            do
                                              if msgType == 11 then
                                                local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(param1))
                                                if itemSSW == nil then
                                                  return 
                                                end
                                                local itemName = itemSSW:getName()
                                                local itemClassify = itemSSW:getItemClassify()
                                                local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
                                                local enchantLevelHigh = 0
                                                if enchantLevel ~= nil and enchantLevel ~= 0 then
                                                  if enchantLevel >= 16 then
                                                    enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel)
                                                  else
                                                    if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemClassify then
                                                      enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel + 15)
                                                    else
                                                      enchantLevelHigh = "+ " .. enchantLevel
                                                    end
                                                  end
                                                end
                                                local message = {}
                                                message.main = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERENCHANTSUCCESS_MAIN1", "strParam1", strParam1, "param1", enchantLevelHigh, "strParam2", itemName)
                                                message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
                                                message.addMsg = ""
                                                Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
                                              else
                                                do
                                                  if msgType == 12 then
                                                    local message = ""
                                                    message = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDDUELWILLBEEND")
                                                    Proc_ShowMessage_Ack(message)
                                                  else
                                                    do
                                                      if msgType == 13 then
                                                        local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(param1))
                                                        if itemSSW == nil then
                                                          return 
                                                        end
                                                        local itemName = itemSSW:getName()
                                                        local itemClassify = itemSSW:getItemClassify()
                                                        local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
                                                        local enchantLevelHigh = 0
                                                        if enchantLevel ~= nil and enchantLevel ~= 0 then
                                                          if enchantLevel >= 16 then
                                                            enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel)
                                                          else
                                                            if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemClassify then
                                                              enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel + 15)
                                                            else
                                                              enchantLevelHigh = "+ " .. enchantLevel
                                                            end
                                                          end
                                                        end
                                                        local message = {}
                                                        message.main = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERPROMOTION_CAPHRAS", "strParam1", strParam1, "param1", enchantLevelHigh, "strParam2", itemName)
                                                        message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
                                                        message.addMsg = ""
                                                        Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
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
          end
        end
      end
    end
  end
end

PaGlobalFunc_FromClient_ResponseGuildInviteForGuildGrade = function(targetActorKeyRaw, targetName, preGuildActivity)
  -- function num : 0_15
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    _PA_ASSERT(false, "ResponseGuildInviteForGuildGrade 에서 길드 정보�\128 없습니다.")
    return 
  end
  if targetName == nil then
    _PA_ASSERT(false, "targetName 정보�\128 없습니다.")
    return 
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  if guildGrade == 0 then
    toClient_RequestInviteGuild(targetName, 0, 0, 0)
  else
    PaGlobalFunc_AgreementGuild_Open_ForJoin(targetActorKeyRaw, targetName, preGuildActivity)
  end
end

PaGlobalFunc_FromClient_ResponseGuildUpdate = function()
  -- function num : 0_16 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  if PaGlobalFunc_Guild_GetShow() == true then
    self:UpdateGuildInfo()
    self:UpdateGuildList()
  end
end

PaGlobalFunc_FromClient_RequestExpelMemberFromGuild = function()
  -- function num : 0_17 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  if PaGlobalFunc_Guild_GetShow() == true then
    self:UpdateGuildInfo()
    self:UpdateGuildList()
  end
end

PaGlobalFunc_FromClient_ResponseGuild_refuse = function(questName, s64_joinableTime)
  -- function num : 0_18
  if toInt64(0, 0) < s64_joinableTime then
    local lefttimeText = convertStringFromDatetime(getLeftSecond_TTime64(s64_joinableTime))
    local contentString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_MSGBOX_JOINWAITTIME_CONTENT", "questName", questName, "lefttimeText", lefttimeText)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INVITE"), content = contentString, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
      if myGuildInfo == nil then
        _PA_ASSERT(false, "FromClient_ResponseGuild_refuse 에서 길드 정보�\128 없습니다.")
      end
      local textGuild = ""
      local guildGrade = myGuildInfo:getGuildGrade()
      if guildGrade == 0 then
        textGuild = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN")
      else
        textGuild = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD")
      end
      local contentString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_REFUSE_GUILDINVITE", "name", questName, "guild", textGuild)
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INVITE"), content = contentString, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

PaGlobalFunc_FromClient_ResponseUpdateGuildContract = function(notifyType, userNickName, characterName, strParam1, strParam2, s64_param1, s64_param2, s64_param3)
  -- function num : 0_19 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  local param1 = Int64toInt32(s64_param1)
  local param2 = Int64toInt32(s64_param2)
  local param3 = Int64toInt32(s64_param3)
  if notifyType == 0 then
    local tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PENSION")
    local guildWrapper = ToClient_GetMyGuildInfoWrapper()
    if guildWrapper == nil then
      return 
    end
    local guildGrade = guildWrapper:getGuildGrade()
    if guildGrade == 1 then
      Proc_ShowMessage_Ack(tempStr)
    end
  else
    do
      if notifyType == 1 then
        local tempStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_DEPOSIT", "userNickName", userNickName, "money", tostring(param1))
        Proc_ShowMessage_Ack(tempStr)
      else
        do
          if notifyType == 2 then
            local isWarehouseGet = FGlobal_GetDailyPay_WarehouseCheckReturn()
            local tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_COLLECTION_INVEN", "money", makeDotMoney(param1))
            if isWarehouseGet == true then
              tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_COLLECTION_WAREHOUSE", "money", makeDotMoney(param1))
            else
              tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_COLLECTION_INVEN", "money", makeDotMoney(param1))
            end
            if param2 == 1 then
              Proc_ShowMessage_Ack(tempStr)
            end
          else
            do
              if notifyType == 3 then
                local tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_HIRE_RENEWAL", "userNickName", userNickName)
                Proc_ShowMessage_Ack(tempStr)
              else
                do
                  if notifyType == 4 then
                    local tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_EXPIRATION", "userNickName", userNickName)
                    Proc_ShowMessage_Ack(tempStr)
                  else
                    do
                      if notifyType == 5 then
                        local periodDay = (getTemporaryInformationWrapper()):getContractedPeriodDay()
                        local benefit = (getTemporaryInformationWrapper()):getContractedBenefit()
                        local penalty = (getTemporaryInformationWrapper()):getContractedPenalty()
                        local guildWrapper = ToClient_GetMyGuildInfoWrapper()
                        if guildWrapper == nil then
                          _PA_ASSERT(false, "길드원이 고용계약서를 받는�\176 길드 정보�\128 없습니다.")
                          return 
                        end
                        local guildName = guildWrapper:getName()
                        PaGlobal_AgreementGuild_InviteOpen(false, userNickName, characterName, guildName, periodDay, benefit, penalty, guildWrapper:getGuildNo_s64())
                      else
                        do
                          if notifyType == 6 then
                            local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PAYMENTS", "typeMoney", tostring(param2))
                            if param1 ~= 0 then
                              tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UNPAID", "typeMoney", tostring(param2))
                            end
                            Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INCOMETAX", "type", tempTxt))
                          else
                            do
                              if notifyType == 7 then
                                local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_LEAVE", "userNickName", userNickName)
                                if param1 > 0 then
                                  tempTxt = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PENALTIES", "tempTxt", tempTxt, "money", tostring(param1))
                                end
                                Proc_ShowMessage_Ack(tempTxt)
                              else
                                do
                                  if notifyType == 8 then
                                    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_FIRE", "userNickName", userNickName)
                                    if param1 > 0 then
                                      tempTxt = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BONUS", "tempTxt", tempTxt, "money", tostring(param1))
                                    end
                                    Proc_ShowMessage_Ack(tempTxt)
                                  else
                                    do
                                      if notifyType == 9 then
                                        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UPGRADES"))
                                      else
                                      end
                                      if notifyType ~= 10 or notifyType == 11 then
                                        local text = ""
                                        if param3 == 1 then
                                          text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BESTMONEY", "money", makeDotMoney(s64_param1))
                                        else
                                          text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_NOTBESTMONEY", "money", makeDotMoney(s64_param1))
                                        end
                                        Proc_ShowMessage_Ack(text)
                                      else
                                        do
                                          if notifyType == 12 then
                                            local text = nil
                                            if param1 == 1 then
                                              text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BIDCANCEL")
                                            else
                                              text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BIDSUCCESS")
                                            end
                                            Proc_ShowMessage_Ack(text)
                                          else
                                            do
                                              if notifyType == 13 then
                                                if toInt64(0, 0) == s64_param1 then
                                                  Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_USEGUILDSHOP_BUY", "userNickName", tostring(userNickName), "param2", makeDotMoney(s64_param2)))
                                                end
                                                if _ContentsGroup_RenewUI_NpcShop == true and PaGlobalFunc_Dialog_NPCShop_IsShow() and npcShop_isGuildShopContents() then
                                                  FromClient_Dialog_NPCShop_UpdateMoneyWarehouse()
                                                  return 
                                                end
                                                if Panel_Window_NpcShop:IsShow() and npcShop_isGuildShopContents() then
                                                  NpcShop_UpdateMoneyWarehouse()
                                                  return 
                                                end
                                              else
                                                if notifyType == 14 then
                                                  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INCENTIVE"))
                                                else
                                                  if notifyType == 15 then
                                                    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PAYMENTS", "typeMoney", tostring(param2))
                                                    if param1 ~= 0 then
                                                      tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UNPAID", "typeMoney", tostring(param2))
                                                    end
                                                    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_HOUSECOSTS", "tempTxt", tempTxt))
                                                  else
                                                    do
                                                      if notifyType == 16 then
                                                        local text = ""
                                                        if param1 == 0 then
                                                          text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_CREATE_CLAN", "name", userNickName)
                                                        else
                                                          text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_CREATE_GUILD", "name", userNickName)
                                                        end
                                                        Proc_ShowMessage_Ack(text)
                                                      else
                                                        do
                                                          do
                                                            -- DECOMPILER ERROR at PC436: Unhandled construct in 'MakeBoolean' P1

                                                            if notifyType == 17 and ToClient_GetMessageFilter(9) == false then
                                                              local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ACCEPT_GUILDQUEST")
                                                              Proc_ShowMessage_Ack(text)
                                                            end
                                                            do
                                                              -- DECOMPILER ERROR at PC452: Unhandled construct in 'MakeBoolean' P1

                                                              if notifyType == 18 and ToClient_GetMessageFilter(9) == false then
                                                                local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_COMPLETE_GUILDQUEST")
                                                                Proc_ShowMessage_Ack(text)
                                                              end
                                                              if notifyType == 19 then
                                                                local regionInfoWrapper = getRegionInfoWrapper(param2)
                                                                if regionInfoWrapper == nil then
                                                                  _PA_ASSERT(false, "성주�\128 마을세금�\132 수금했는�\176 마을 정보�\128 없습니다.")
                                                                  return 
                                                                end
                                                                local text = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_LORD_MOVETAX_TO_GUILDMONEY", "region", regionInfoWrapper:getAreaName(), "silver", makeDotMoney(s64_param1))
                                                                Proc_ShowMessage_Ack(text)
                                                              else
                                                              end
                                                              do
                                                                -- DECOMPILER ERROR at PC503: Unhandled construct in 'MakeBoolean' P1

                                                                if (notifyType ~= 20 or notifyType == 21) and (CppEnums.GuildWarType).GuildWarType_Normal == ToClient_GetGuildWarType() then
                                                                  if param3 == 1 then
                                                                    local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ACCEPT_BATTLE_NO_RESOURCE")
                                                                    Proc_ShowMessage_Ack(text)
                                                                  else
                                                                    do
                                                                      local tendency = param1
                                                                      do
                                                                        local text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_DECLARE_WAR_CONSUME", "silver", makeDotMoney(s64_param2))
                                                                        Proc_ShowMessage_Ack(text)
                                                                        if (((((notifyType == 22 and notifyType ~= 23) or notifyType == 24) and notifyType ~= 25) or notifyType == 26) and notifyType ~= 27) or notifyType == 28 then
                                                                          if param1 == 0 then
                                                                            local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMP_DOWN")
                                                                            Proc_ShowMessage_Ack(userNickName .. text)
                                                                          else
                                                                            do
                                                                              do
                                                                                local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMP_UP")
                                                                                Proc_ShowMessage_Ack(userNickName .. text)
                                                                                if Panel_GuildWarInfo:GetShow() then
                                                                                  FromClient_WarInfoContent_Set()
                                                                                end
                                                                                if notifyType == 29 then
                                                                                  if param1 == 0 then
                                                                                    local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_CHEER_GUILD")
                                                                                    Proc_ShowMessage_Ack(userNickName .. text)
                                                                                    FromClient_NotifySiegeScoreToLog()
                                                                                  else
                                                                                    do
                                                                                      FromClient_NotifySiegeScoreToLog()
                                                                                      do
                                                                                        if notifyType == 30 then
                                                                                          local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DONOT_GUILDQUEST")
                                                                                          Proc_ShowMessage_Ack(text)
                                                                                        else
                                                                                        end
                                                                                        if notifyType ~= 31 or notifyType == 32 then
                                                                                          local regionInfoWrapper = getRegionInfoWrapper(param3)
                                                                                          local areaName = ""
                                                                                          if regionInfoWrapper ~= nil then
                                                                                            areaName = regionInfoWrapper:getAreaName()
                                                                                          end
                                                                                          local characterStaticStatusWarpper = getCharacterStaticStatusWarpper(param2)
                                                                                          local characterName = ""
                                                                                          if characterStaticStatusWarpper ~= nil then
                                                                                            characterName = characterStaticStatusWarpper:getName()
                                                                                          end
                                                                                          local msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BUILDING_AUTODESTROYBUILD", "areaName", areaName, "characterName", characterName)
                                                                                          Proc_ShowMessage_Ack(msg)
                                                                                        else
                                                                                          do
                                                                                            if notifyType == 38 then
                                                                                              local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDE_PAYPROPERTYTAX", "typeMoney", makeDotMoney(s64_param1))
                                                                                              Proc_ShowMessage_Ack(tempTxt)
                                                                                            else
                                                                                              do
                                                                                                if notifyType == 39 then
                                                                                                  local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_GETWELFARE", "typeMoney", makeDotMoney(s64_param1))
                                                                                                  Proc_ShowMessage_Ack(tempTxt)
                                                                                                else
                                                                                                  do
                                                                                                    do
                                                                                                      if notifyType == 43 then
                                                                                                        local tempTxt = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NOTIFYWELFARE")
                                                                                                        Proc_ShowMessage_Ack(tempTxt)
                                                                                                      end
                                                                                                      self:UpdateGuildList()
                                                                                                      self:UpdateGuildInfo()
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
            end
          end
        end
      end
    end
  end
end

PaGlobalFunc_Guild_Accept = function()
  -- function num : 0_20
  ToClient_RequestRefuseGuildInvite()
end

PaGlobalFunc_Guild_Refuse = function()
  -- function num : 0_21
  ToClient_RequestRefuseGuildInvite()
end

PaGlobalFunc_FromClient_ResponseGuild_invite = function(s64_guildNo, hostUsername, hostName, guildName, guildGrade, periodDay, benefit, penalty)
  -- function num : 0_22
  if guildGrade == 0 then
    local luaGuildTextGuildInviteMsg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN_INVITE_MSG")
    local luaGuildTextGuildInvite = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN_INVITE")
    local contentString = hostUsername .. "(" .. hostName .. ")" .. luaGuildTextGuildInviteMsg
    local messageboxData = {title = luaGuildTextGuildInvite, content = contentString, functionYes = PaGlobalFunc_Guild_Accept, functionCancel = PaGlobalFunc_Guild_Refuse, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      if guildGrade == 1 then
        PaGlobal_AgreementGuild_InviteOpen(true, hostUsername, hostName, guildName, periodDay, benefit, penalty, s64_guildNo)
      end
    end
  end
end

PaGlobalFunc_Guild_List2EventControlCreate = function(list_content, key)
  -- function num : 0_23 , upvalues : Window_GuildInfo, UI_color
  local self = Window_GuildInfo
  local index = Int64toInt32(key)
  local memberInfo = (self._memberListInfo)[index]
  if memberInfo == nil then
    return 
  end
  local static_ListTitleBg = (UI.getChildControl)(list_content, "Static_ListTitleBg")
  local staticText_Grade = (UI.getChildControl)(list_content, "StaticText_Grade")
  local staticText_Level = (UI.getChildControl)(list_content, "StaticText_LevelTitle")
  local staticText_Name = (UI.getChildControl)(list_content, "StaticText_NameValue")
  local staticText_Activity = (UI.getChildControl)(list_content, "StaticText_ActivityValue")
  local staticText_ContributedTendency = (UI.getChildControl)(list_content, "StaticText_ContributedTendencyValue")
  local static_Focus = (UI.getChildControl)(list_content, "Static_Focus")
  static_Focus:SetShow(true)
  local static_GradeIcon = (UI.getChildControl)(list_content, "Static_GradeIcon")
  local static_VoiceIcon = (UI.getChildControl)(list_content, "Static_VoiceIcon")
  local static_MicIcon = (UI.getChildControl)(list_content, "Static_MiceIcon")
  local static_ContractIcon = (UI.getChildControl)(list_content, "Static_ContractIcon")
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  static_Focus:SetShow(index == self._selectMemberIndex)
  static_ListTitleBg:addInputEvent("Mouse_LUp", "")
  static_ListTitleBg:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_SelectMember(" .. index .. ")")
  local businessFunds_s64 = myGuildListInfo:getGuildBusinessFunds_s64()
  local guildGrade = myGuildListInfo:getGuildGrade()
  local dataIdx = memberInfo._idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  if myGuildMemberInfo == nil then
    _PA_ASSERT(false, "멤버 데이터가 없을 �\152 있나? 확인 바랍니다.")
    return 
  end
  local gradeType = myGuildMemberInfo:getGrade()
  static_GradeIcon:ChangeTextureInfoName("renewal/ui_icon/console_icon_guild_00.dds")
  if gradeType == 0 then
    local x1, y1, x2, y2 = setTextureUV_Func(static_GradeIcon, 1, 1, 37, 37)
    ;
    (static_GradeIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    static_GradeIcon:setRenderTexture(static_GradeIcon:getBaseTexture())
    staticText_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMASTER"))
  elseif gradeType == 1 then
    local x1, y1, x2, y2 = setTextureUV_Func(static_GradeIcon, 73, 1, 109, 37)
    ;
    (static_GradeIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    static_GradeIcon:setRenderTexture(static_GradeIcon:getBaseTexture())
    staticText_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDSUBMASTER"))
  elseif gradeType == 2 then
    local x1, y1, x2, y2 = setTextureUV_Func(static_GradeIcon, 38, 1, 72, 37)
    ;
    (static_GradeIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    static_GradeIcon:setRenderTexture(static_GradeIcon:getBaseTexture())
    staticText_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMEMBER"))
  elseif gradeType == 3 then
    local x1, y1, x2, y2 = setTextureUV_Func(static_GradeIcon, 110, 1, 146, 37)
    ;
    (static_GradeIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    static_GradeIcon:setRenderTexture(static_GradeIcon:getBaseTexture())
    staticText_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_SUPPLYOFFICER"))
  end
  if myGuildMemberInfo:isSelf() then
    staticText_Level:SetText(myGuildMemberInfo:getLevel())
    local maxWp = myGuildMemberInfo:getMaxWp()
    if maxWp == 0 then
      maxWp = "-"
    end
    local explorationPoint = myGuildMemberInfo:getExplorationPoint()
    staticText_ContributedTendency:SetText(maxWp .. "/" .. explorationPoint)
    if (self._config)._isVoiceOpen == true then
      if myGuildMemberInfo:isVoiceChatSpeak() then
        if myGuildMemberInfo:isVoiceSpeaking() then
          local x1, y1, x2, y2 = setTextureUV_Func(static_VoiceIcon, 422, 70, 451, 93)
          ;
          (static_VoiceIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
          static_VoiceIcon:setRenderTexture(static_VoiceIcon:getBaseTexture())
        else
          self:CheckVoiceChatMicTexture(static_MicIcon, true)
        end
        self:CheckVoiceChatMicTexture(static_MicIcon, false)
      end
      self:CheckVoiceChatListenTexture(static_VoiceIcon, myGuildMemberInfo:isVoiceChatListen())
    end
    if myGuildMemberInfo:isOnline() == true then
      local usableActivity = myGuildMemberInfo:getUsableActivity()
      if usableActivity > 10000 then
        usableActivity = 10000
      end
      local textActivity = tostring(myGuildMemberInfo:getTotalActivity()) .. "(<PAColor0xfface400>+" .. tostring(usableActivity) .. "<PAOldColor>)"
      staticText_Activity:SetText(textActivity)
      staticText_Activity:SetFontColor(UI_color.C_FFC4BEBE)
      staticText_Level:SetFontColor(UI_color.C_FFC4BEBE)
      staticText_ContributedTendency:SetFontColor(UI_color.C_FFC4BEBE)
      if myGuildMemberInfo:isSelf() then
        staticText_Name:SetFontColor(UI_color.C_FFEF9C7F)
      else
        staticText_Name:SetFontColor(UI_color.C_FFC4BEBE)
      end
      staticText_Name:SetText(myGuildMemberInfo:getName() .. " (" .. myGuildMemberInfo:getCharacterName() .. ")")
      if (self._config)._isVoiceOpen and (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
        staticText_Name:SetText(myGuildMemberInfo:getName())
      end
      if (self._config)._isVoiceOpen == true then
        static_VoiceIcon:SetIgnore(false)
        static_MicIcon:SetIgnore(false)
      end
    else
      local textActivity = tostring(myGuildMemberInfo:getTotalActivity()) .. "(+" .. tostring(myGuildMemberInfo:getUsableActivity()) .. ")"
      staticText_Activity:SetText(textActivity)
      staticText_ContributedTendency:SetFontColor(UI_color.C_FF515151)
      staticText_Activity:SetFontColor(UI_color.C_FF515151)
      staticText_Level:SetFontColor(UI_color.C_FF515151)
      staticText_Name:SetFontColor(UI_color.C_FF515151)
      staticText_Name:SetText(myGuildMemberInfo:getName() .. " ( - )")
      staticText_Level:SetText("-")
      if (self._config)._isVoiceOpen == true then
        static_VoiceIcon:SetIgnore(true)
        static_MicIcon:SetIgnore(true)
      end
    end
    local contractAble = myGuildMemberInfo:getContractableUtc()
    local expiration = myGuildMemberInfo:getContractedExpirationUtc()
    do
      local isContractState = 0
      if Int64toInt32(getLeftSecond_TTime64(expiration)) > 0 then
        isContractState = 1
        if Int64toInt32(getLeftSecond_TTime64(contractAble)) <= 0 then
          isContractState = 0
        end
      else
        isContractState = 2
      end
      PaGlobalFunc_Guild_ChangeTexture_Expiration(static_ContractIcon, isContractState)
      static_ContractIcon:SetShow(true)
      if (ToClient_GetMyGuildInfoWrapper()):getGuildGrade() == 0 then
        static_ContractIcon:SetIgnore(true)
        static_ContractIcon:SetMonoTone(true)
      else
        static_ContractIcon:SetIgnore(false)
        static_ContractIcon:SetMonoTone(false)
      end
      -- DECOMPILER ERROR: 22 unprocessed JMP targets
    end
  end
end

PaGlobalFunc_Guild_SelectMember = function(index)
  -- function num : 0_24 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  local prevIndex = self._selectMemberIndex
  self._selectMemberIndex = index
  ;
  ((self._ui)._list2_GuildList):requestUpdateByKey(toInt64(0, prevIndex))
  ;
  ((self._ui)._list2_GuildList):requestUpdateByKey(toInt64(0, self._selectMemberIndex))
end

PaGlobalFunc_Guild_HandleClickedGuildMemberContractbutton = function()
  -- function num : 0_25 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
end

PaGlobalFunc_Guild_MandateTooltipShow = function(isShow, titleType, controlIdx)
  -- function num : 0_26
end

PaGlobalFunc_Guild_ChangeTexture_Expiration = function(control, state)
  -- function num : 0_27
  if state == 2 then
    control:SetColor((Defines.Color).C_FFFF0000)
  else
    if state == 0 then
      control:SetColor((Defines.Color).C_FF008AFF)
    else
      if state == 1 then
        control:SetColor((Defines.Color).C_FFEFEFEF)
      end
    end
  end
end

PaGlobalFunc_Guild_NameTooltip = function(isShow, index, uiIndex)
  -- function num : 0_28
end

Window_GuildInfo.CheckVoiceChatMicTexture = function(self, control, onOff)
  -- function num : 0_29
  control:ChangeTextureInfoName("renewal/ui_icon/console_icon_01.dds")
  if onOff then
    local x1, y1, x2, y2 = setTextureUV_Func(control, 105, 169, 133, 197)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
  else
    do
      local x1, y1, x2, y2 = setTextureUV_Func(control, 105, 198, 133, 226)
      ;
      (control:getBaseTexture()):setUV(x1, y1, x2, y2)
      control:setRenderTexture(control:getBaseTexture())
    end
  end
end

Window_GuildInfo.CheckVoiceChatListenTexture = function(self, control, onOff)
  -- function num : 0_30
  control:ChangeTextureInfoName("renewal/ui_icon/console_icon_01.dds")
  if onOff then
    local x1, y1, x2, y2 = setTextureUV_Func(control, 134, 169, 162, 197)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
  else
    do
      local x1, y1, x2, y2 = setTextureUV_Func(control, 134, 198, 162, 226)
      ;
      (control:getBaseTexture()):setUV(x1, y1, x2, y2)
      control:setRenderTexture(control:getBaseTexture())
    end
  end
end

PaGlobalFunc_Guild_HandleClickedMemberDel = function()
  -- function num : 0_31 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local myGuildMemberInfo = myGuildListInfo:getMember(self._selectMemberIndex)
  if myGuildMemberInfo == nil then
    return 
  end
  local messageTitle = ""
  local messageContent = ""
  local yesFunction = nil
  local targetName = myGuildMemberInfo:getName()
  local characterName = myGuildMemberInfo:getCharacterName()
  local isOnlineMember = myGuildMemberInfo:isOnline()
  messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_EXPEL_GUILDMEMBER")
  messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_EXPEL_GUILDMEMBER_QUESTION", "target", "[" .. tostring(targetName) .. "]")
  yesFunction = PaGlobalFunc_Guild_MessageBoxYesFunction_ExpelMember
  local messageboxData = {title = messageTitle, content = messageContent, functionYes = yesFunction, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

PaGlobalFunc_Guild_MessageBoxYesFunction_ExpelMember = function()
  -- function num : 0_32 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  local checkedUserNo = ((self._memberListInfo)[self._selectMemberIndex])._userNo
  ToClient_RequestExpelMemberFromGuild(self._selectMemberIndex, checkedUserNo)
end

PaGlobalFunc_Guild_HandleClickedGuildDel = function()
  -- function num : 0_33 , upvalues : UCT
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    _PA_ASSERT(false, "ResponseGuildInviteForGuildGrade 에서 길드 정보�\128 없습니다.")
    return 
  end
  local guildGrade = (myGuildInfo:getGuildGrade())
  local messageboxData = nil
  if ((getSelfPlayer()):get()):isGuildMaster() == true then
    if myGuildInfo:getMemberCount() <= 1 then
      messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD_ASK"), functionYes = PaGlobalFunc_Guild_DelContinue, functionNo = MessageBox_Empty_function, priority = UCT.PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_CANT_DISPERSE"))
    end
  else
    local tempText = nil
    if guildGrade == 0 then
      tempText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLANLIST_CLANOUT_ASK")
    else
      tempText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD_ASK") .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MENTINFO")
    end
    messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD"), content = tempText, functionYes = PaGlobalFunc_Guild_LeaveContinue, functionNo = MessageBox_Empty_function, priority = UCT.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
end

PaGlobalFunc_Guild_DelContinue = function()
  -- function num : 0_34
  ToClient_RequestDestroyGuild()
  PaGlobalFunc_Guild_Close()
end

PaGlobalFunc_Guild_LeaveContinue = function()
  -- function num : 0_35
  ToClient_RequestDisjoinGuild()
  PaGlobalFunc_Guild_Close()
end

Window_GuildInfo.InitEvent = function(self)
  -- function num : 0_36
  local guildInfomation = (self._ui)._guildInfomation
  local guildList = (self._ui)._guildList
  local guildMoney = (self._ui)._guildMoney
  local bottom = (self._ui)._bottom
  ;
  (((self._ui)._radioButton)._radioButton_GuildInfo):addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_InfoOpen()")
  ;
  (((self._ui)._radioButton)._radioButton_GuildList):addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_ListOpen()")
  Panel_Console_Window_Guild:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, " PaGlobalFunc_XB_Control_Tap()")
  Panel_Console_Window_Guild:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, " PaGlobalFunc_XB_Control_Tap()")
  if _ContentsGroup_isConsolePadControl then
    Panel_Console_Window_Guild:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, " PaGlobalFunc_Guild_ContractButton()")
  else
    ;
    (bottom._button_Contract):addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_ContractButton()")
  end
  ;
  ((self._ui)._list2_GuildList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_Guild_List2EventControlCreate")
  ;
  ((self._ui)._list2_GuildList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((self._ui)._radioButton_GuildMoneyInput):addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedIncentive_Deposit()")
  ;
  ((self._ui)._radioButton_GuildMoneyOutput):addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedIncentive_Paypal()")
end

PaGlobalFunc_Guild_HandleClickedIncentive_Deposit = function()
  -- function num : 0_37
  HandleCLicked_GuildListIncentive_Deposit()
end

PaGlobalFunc_Guild_HandleClickedIncentive_Paypal = function()
  -- function num : 0_38
  local hasWareHouse = ToClient_HasWareHouseFromNpc()
  if hasWareHouse == true then
    FGlobal_GetDailyPay_Show()
  else
    ToClient_TakeMyGuildBenefit(false)
  end
end

PaGlobalFunc_Guild_ContractButton = function()
  -- function num : 0_39 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  local index = self._selectMemberIndex
  if index == -1 then
    return 
  end
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local dataIdx = ((self._memberListInfo)[index])._idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  local usableActivity = myGuildMemberInfo:getUsableActivity()
  if isGuildMaster == true then
    PaGlobalFunc_AgreementGuild_Master_ContractOpen(dataIdx, 0, usableActivity)
  else
    if isGuildSubMaster == true then
      PaGlobalFunc_AgreementGuild_Master_ContractOpen(dataIdx, 1, usableActivity)
    else
      PaGlobalFunc_AgreementGuild_Master_ContractOpen(dataIdx, 2, usableActivity)
    end
  end
end

Window_GuildInfo.InitControl = function(self)
  -- function num : 0_40
  local radioButton = (self._ui)._radioButton
  local guildInfomation = (self._ui)._guildInfomation
  local guildList = (self._ui)._guildList
  local guildMoney = (self._ui)._guildMoney
  local bottom = (self._ui)._bottom
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R6 in 'UnsetPending'

  ;
  ((self._ui)._radioButton)._radioButton_GuildInfo = (UI.getChildControl)((self._ui)._static_RadioButtonBg, "RadioButton_GuildInformation")
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R6 in 'UnsetPending'

  ;
  ((self._ui)._radioButton)._radioButton_GuildList = (UI.getChildControl)((self._ui)._static_RadioButtonBg, "RadioButton_GuildList")
  guildInfomation._staticText_GuildTitle = (UI.getChildControl)((self._ui)._static_GuildInfomationBg, "StaticText_GuildTitle")
  guildInfomation._staticGuildAllInfo = (UI.getChildControl)((self._ui)._static_GuildInfomationBg, "Static_GuildAllInfo")
  guildInfomation._staticText_MasterValue = (UI.getChildControl)(guildInfomation._staticGuildAllInfo, "StaticText_MasterValue")
  guildInfomation._staticText_RankValue = (UI.getChildControl)(guildInfomation._staticGuildAllInfo, "StaticText_GuildRankValue")
  guildInfomation._staticText_Protectvalue = (UI.getChildControl)(guildInfomation._staticGuildAllInfo, "StaticText_ProtectValue")
  guildInfomation._staticText_PointValue = (UI.getChildControl)(guildInfomation._staticGuildAllInfo, "StaticText_PointValue")
  guildInfomation._staticText_TerritoryAreaValue = (UI.getChildControl)(guildInfomation._staticGuildAllInfo, "StaticText_TerritoryAreaValue")
  guildInfomation._staticText_ServantValue = (UI.getChildControl)(guildInfomation._staticGuildAllInfo, "StaticText_GuildServantValue")
  -- DECOMPILER ERROR at PC85: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui)._staticText_GuildMoneyValue = (UI.getChildControl)((self._ui)._static_GuildMoneyBg, "StaticText_GuildMoneyValue")
  -- DECOMPILER ERROR at PC93: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui)._radioButton_GuildMoneyInput = (UI.getChildControl)((self._ui)._static_GuildMoneyBg, "RadioButton_GuildMoneyInput")
  -- DECOMPILER ERROR at PC101: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui)._radioButton_GuildMoneyOutput = (UI.getChildControl)((self._ui)._static_GuildMoneyBg, "RadioButton_GuildMoneyOutput")
  -- DECOMPILER ERROR at PC109: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui)._list2_GuildList = (UI.getChildControl)((self._ui)._static_GuildListBg, "List2_GuildlistBg")
  bottom._button_Contract = (UI.getChildControl)((self._ui)._static_BottomBg, "Button_Contract_ConsoleUI")
  bottom._button_Leave = (UI.getChildControl)((self._ui)._static_BottomBg, "Button_Leave_ConsoleUI")
  bottom._button_Close = (UI.getChildControl)((self._ui)._static_BottomBg, "Button_Close_ConsoleUI")
end

PaGlobalFunc_XB_Control_Tap = function()
  -- function num : 0_41 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  self._tabIndex = self._tabIndex + 1
  _PA_LOG("원선", "PaGlobalFunc_XB_Control_Tap  :  " .. self._tabIndex)
  if self._tabIndex % 2 == 0 then
    PaGlobalFunc_Guild_InfoOpen()
    ;
    (((self._ui)._radioButton)._radioButton_GuildInfo):SetCheck(true)
    ;
    (((self._ui)._radioButton)._radioButton_GuildList):SetCheck(false)
  else
    PaGlobalFunc_Guild_ListOpen()
    ;
    (((self._ui)._radioButton)._radioButton_GuildInfo):SetCheck(false)
    ;
    (((self._ui)._radioButton)._radioButton_GuildList):SetCheck(true)
  end
end

Window_GuildInfo.Initialize = function(self)
  -- function num : 0_42
  self:InitControl()
  self:InitEvent()
  self:InitRegistEvnet()
  self:SetSortFunc()
end

PaGlobalFunc_Guild_Toggle = function()
  -- function num : 0_43
  if PaGlobalFunc_Guild_GetShow() == true then
    PaGlobalFunc_Guild_Close()
  else
    PaGlobalFunc_Guild_Open()
  end
end

PaGlobalFunc_Guild_GetShow = function()
  -- function num : 0_44
  return Panel_Console_Window_Guild:GetShow()
end

PaGlobalFunc_Guild_Open = function()
  -- function num : 0_45 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  self._selectMemberIndex = -1
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildListInfo == nil then
    return 
  end
  local memberCount = myGuildListInfo:getMemberCount()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R6 in 'UnsetPending'

  if myGuildInfo ~= nil then
    GuildManager._doHaveSeige = myGuildInfo:doHaveOccupyingSiege()
  end
  if ((getSelfPlayer()):get()):isGuildMaster() or ((getSelfPlayer()):get()):isGuildSubMaster() then
    if memberCount == 1 then
      (((self._ui)._bottom)._button_Leave):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD"))
      if _ContentsGroup_isConsolePadControl then
        Panel_Console_Window_Guild:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobalFunc_Guild_HandleClickedGuildDisPerse()")
      else
        ;
        (((self._ui)._bottom)._button_Leave):addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedGuildDisPerse()")
      end
    else
      ;
      (((self._ui)._bottom)._button_Leave):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMPETITIONGAME_USERKICK"))
      if _ContentsGroup_isConsolePadControl then
        Panel_Console_Window_Guild:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobalFunc_Guild_HandleClickedMemberDel()")
      else
        ;
        (((self._ui)._bottom)._button_Leave):addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedMemberDel()")
      end
    end
  else
    ;
    (((self._ui)._bottom)._button_Leave):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PARTYOPTION_BTN_LEAVE"))
    if _ContentsGroup_isConsolePadControl then
      Panel_Console_Window_Guild:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "PaGlobalFunc_Guild_HandleClickedMemberDel()")
    else
      ;
      (((self._ui)._bottom)._button_Leave):addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedGuildDel()")
    end
  end
  ;
  (((self._ui)._bottom)._button_Close):addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_Close()")
  local getGuildMoney = myGuildInfo:getGuildBusinessFunds_s64()
  ;
  ((self._ui)._staticText_GuildMoneyValue):SetText(makeDotMoney(getGuildMoney))
  Panel_Console_Window_Guild:SetShow(true, false)
  PaGlobalFunc_Guild_InfoOpen()
end

PaGlobalFunc_Guild_HandleClickedGuildDisPerse = function()
  -- function num : 0_46 , upvalues : UCT
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    _PA_ASSERT(false, "ResponseGuildInviteForGuildGrade 에서 길드 정보�\128 없습니다.")
    return 
  end
  if ((getSelfPlayer()):get()):isGuildMaster() == false then
    return 
  end
  local guildGrade = (myGuildInfo:getGuildGrade())
  local messageboxData = nil
  if myGuildInfo:getMemberCount() <= 1 then
    messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD_ASK"), functionYes = PaGlobalFunc_Guild_HandleClickedGuildDisPerseConfirm, functionNo = MessageBox_Empty_function, priority = UCT.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_CANT_DISPERSE"))
  end
end

PaGlobalFunc_Guild_HandleClickedGuildDisPerseConfirm = function()
  -- function num : 0_47
  ToClient_RequestDestroyGuild()
  PaGlobalFunc_Guild_Close()
end

PaGlobalFunc_Guild_Close = function()
  -- function num : 0_48 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  self._selectMemberIndex = -1
  Panel_Console_Window_Guild:SetShow(false, false)
end

PaGlobalFunc_FromClient_Guild_luaLoadComplete = function()
  -- function num : 0_49 , upvalues : Window_GuildInfo
  local self = Window_GuildInfo
  self:Initialize()
  self:UpdateGuildInfo()
  self:UpdateGuildList()
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_Guild_luaLoadComplete")

