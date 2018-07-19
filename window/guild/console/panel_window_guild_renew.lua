local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local Window_GuildInfo = {
  _ui = {
    _static_RadioButtonBg = UI.getChildControl(Panel_Console_Window_Guild, "Static_RadioButtonBg"),
    _static_GuildInfomationBg = UI.getChildControl(Panel_Console_Window_Guild, "Static_GuildInformationBg"),
    _static_GuildListBg = UI.getChildControl(Panel_Console_Window_Guild, "Static_GuildListBg"),
    _static_GuildMoneyBg = UI.getChildControl(Panel_Console_Window_Guild, "Static_GuildMoneyBg"),
    _static_BottomBg = UI.getChildControl(Panel_Console_Window_Guild, "Static_BottomBg"),
    _radioButton = {},
    _guildInfomation = {},
    _guildList = {},
    _guildMoney = {},
    _bottom = {}
  },
  _config = {
    _isVoiceOpen = ToClient_IsContentsGroupOpen("75"),
    _maxTitleTab = 2
  },
  _selectSortType = -1,
  _listSort = {
    _grade = false,
    _gradeSort,
    _level = false,
    _levelSort,
    _name = false,
    _nameSort,
    _ap = false,
    _apSort,
    _expiration = false,
    _expriationSort,
    _wp = false,
    _wpSort,
    _kp = false,
    _kpSort
  },
  _memberListInfo = {},
  _memberListUI = {},
  _tabIndex = 0,
  _selectMemberIndex = -1,
  _deleteMemberIndex = -1
}
function Window_GuildInfo:SetSortFunc()
  function self._listSort._gradeSort(w1, w2)
    local w1Grade = w1._grade
    local w2Grade = w2._grade
    if 2 == w1Grade then
      w1Grade = 3
    elseif 3 == w1Grade then
      w1Grade = 2
    end
    if 2 == w2Grade then
      w2Grade = 3
    elseif 3 == w2Grade then
      w2Grade = 2
    end
    if true == self._listSort._grade then
      return w1Grade < w2Grade
    else
      return w1Grade > w2Grade
    end
  end
  function self._listSort._levelSort(w1, w2)
    if true == self._listSort._level then
      if w2._level < w1._level then
        return true
      end
    elseif w1._level < w2._level then
      return true
    end
  end
  function self._listSort._nameSort(w1, w2)
    if true == self._listSort._name then
      if w1._name < w2._name then
        return true
      end
    elseif w2._name < w1._name then
      return true
    end
  end
  function self._listSort._apSort(w1, w2)
    if true == self._listSort._ap then
      if w2._ap < w1._ap then
        return true
      end
    elseif w1._ap < w2._ap then
      return true
    end
  end
  function self._listSort._expriationSort(w1, w2)
    if true == self._listSort._expiration then
      if w2._expiration < w1._expiration then
        return true
      end
    elseif w1._expiration < w2._expiration then
      return true
    end
  end
  function self._listSort._wpSort(w1, w2)
    if true == self._listSort._wp then
      if w2._wp < w1._wp then
        return true
      end
    elseif false == self._listSort._wp and true == self._listSort._kp then
      if w2._kp < w1._kp then
        return true
      end
    elseif w1._wp < w2._wp then
      return true
    end
  end
end
function PaGlobalFunc_Guild_HandleMenberSort(sortType)
  local self = Window_GuildInfo
  self._selectSortType = sortType
  if 0 == sortType then
    if false == self._listSort._grade then
      self._listSort._grade = true
    else
      self._listSort._grade = false
    end
    table.sort(self._memberListInfo, self._listSort._gradeSort)
  elseif 1 == sortType then
    if false == self._listSort._level then
      self._listSort._level = true
    else
      self._listSort._level = false
    end
    table.sort(self._memberListInfo, self._listSort._levelSort)
  elseif 2 == sortType then
    if false == self._listSort._name then
      self._listSort._name = true
    else
      self._listSort._name = false
    end
    table.sort(self._memberListInfo, self._listSort._nameSort)
  elseif 3 == sortType then
    if false == self._listSort._ap then
      self._listSort._ap = true
    else
      self._listSort._ap = false
    end
    table.sort(self._memberListInfo, self._listSort._apSort)
  elseif 4 == sortType then
    if false == self._listSort._expiration then
      self._listSort._expiration = true
    else
      self._listSort._expiration = false
    end
    table.sort(self._memberListInfo, self._listSort._expriationSort)
  elseif 5 == sortType then
    if false == self._listSort._wp then
      self._listSort._wp = true
    elseif false == self._listSort._kp then
      self._listSort._kp = true
    else
      self._listSort._wp = false
      self._listSort._kp = false
    end
    table.sort(self._memberListInfo, self._listSort._wpSort)
  end
end
function Window_GuildInfo:GuildInfo_Open()
  self._ui._static_GuildInfomationBg:SetShow(true)
end
function Window_GuildInfo:GuildList_Open()
  self._ui._static_GuildListBg:SetShow(true)
end
function Window_GuildInfo:GuildInfo_Close()
  self._ui._static_GuildInfomationBg:SetShow(false)
end
function Window_GuildInfo:GuildList_Close()
  self._ui._static_GuildListBg:SetShow(false)
end
function PaGlobalFunc_Guild_InfoOpen()
  local self = Window_GuildInfo
  self._selectMemberIndex = -1
  self._ui._bottom._button_Contract:SetShow(false)
  self._ui._bottom._button_Leave:SetShow(false)
  self._ui._radioButton_GuildMoneyInput:SetShow(false)
  self._ui._radioButton_GuildMoneyOutput:SetShow(false)
  self._ui._radioButton._radioButton_GuildInfo:SetFontColor(Defines.Color.C_FFEFEFEF)
  self._ui._radioButton._radioButton_GuildList:SetFontColor(Defines.Color.C_FF888888)
  self:GuildInfo_Open()
  self:GuildList_Close()
  self:UpdateGuildInfo()
end
function Window_GuildInfo:UpdateGuildInfo()
  self:SetDataByGuildGrade()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  local myGuildAllianceChair = ToClient_GetMyGuildAlliancChairGuild()
  local myGuildAllianceCache
  if nil ~= myGuildAllianceChair then
    myGuildAllianceCache = myGuildAllianceChair
  else
    myGuildAllianceCache = myGuildInfo
  end
  if myGuildInfo ~= nil then
    local guildRank = myGuildInfo:getMemberCountLevel()
    local guildRankString = ""
    if 1 == guildRank then
      guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_SMALL")
    elseif 2 == guildRank then
      guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_MIDDLE")
    elseif 3 == guildRank then
      guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIG")
    elseif 4 == guildRank then
      guildRankString = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIGGEST")
    end
    local skillPointInfo = ToClient_getSkillPointInfo(3)
    local skillPointPercent = string.format("%.0f", skillPointInfo._currentExp / skillPointInfo._nextLevelExp * 100)
    if 100 < tonumber(skillPointPercent) then
      skillPointPercent = 100
    end
    self._ui._guildInfomation._staticText_GuildTitle:SetText(myGuildInfo:getName())
    self._ui._guildInfomation._staticText_RankValue:SetText(guildRankString .. "(" .. myGuildInfo:getMemberCount() .. "/" .. myGuildInfo:getJoinableMemberCount() .. ")")
    self._ui._guildInfomation._staticText_MasterValue:SetText(myGuildInfo:getGuildMasterName())
    self._ui._guildInfomation._staticText_Protectvalue:SetText(myGuildInfo:getProtectGuildMemberCount() .. "/" .. myGuildInfo:getAvaiableProtectGuildMemberCount())
    local pointValue = tostring(skillPointInfo._remainPoint) .. "/" .. tostring(skillPointInfo._acquirePoint - 1)
    local pointPercent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_SKILLPOINTPERCENT_SUBTITLE", "skillPointPercent", skillPointPercent)
    self._ui._guildInfomation._staticText_PointValue:SetText(pointValue .. pointPercent)
    local guildArea1 = ""
    local territoryKey = ""
    local territoryWarName = ""
    self._ui._guildInfomation._staticText_TerritoryAreaValue:SetText("-")
    if 0 < myGuildAllianceCache:getTerritoryCount() then
      for idx = 0, myGuildAllianceCache:getTerritoryCount() - 1 do
        territoryKey = myGuildAllianceCache:getTerritoryKeyAt(idx)
        if territoryKey >= 0 then
          local territoryInfoWrapper = getTerritoryInfoWrapperByIndex(territoryKey)
          if nil ~= territoryInfoWrapper then
            guildArea1 = territoryInfoWrapper:getTerritoryName()
            local territoryComma = ", "
            if "" == territoryWarName then
              territoryComma = ""
            end
            territoryWarName = territoryWarName .. territoryComma .. guildArea1
          end
        end
      end
      self._ui._guildInfomation._staticText_TerritoryAreaValue:SetText(territoryWarName)
    end
    local guildServantElephantCount = guildStable_getServantCount(CppEnums.VehicleType.Type_Elephant)
    local guildServantShipCount = guildStable_getServantCount(CppEnums.VehicleType.Type_SailingBoat)
    local guilServantValueCount = ""
    self._ui._guildInfomation._staticText_ServantValue:SetText("-")
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
    self._ui._guildInfomation._staticText_ServantValue:SetText(guilServantValueCount)
    local isGuildMaster = getSelfPlayer():get():isGuildMaster()
    if true == isGuildMaster then
    else
    end
    local isSet = setGuildTextureByGuildNo(myGuildInfo:getGuildNo_s64(), self._ui._guildInfomation._staticText_GuildTitle)
    if false == isSet then
      self._ui._guildInfomation._staticText_GuildTitle:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(self._ui._guildInfomation._staticText_GuildTitle, 183, 1, 188, 6)
      self._ui._guildInfomation._staticText_GuildTitle:getBaseTexture():setUV(x1, y1, x2, y2)
      self._ui._guildInfomation._staticText_GuildTitle:setRenderTexture(self._ui._guildInfomation._staticText_GuildTitle:getBaseTexture())
    else
      self._ui._guildInfomation._staticText_GuildTitle:getBaseTexture():setUV(0, 0, 1, 1)
      self._ui._guildInfomation._staticText_GuildTitle:setRenderTexture(self._ui._guildInfomation._staticText_GuildTitle:getBaseTexture())
    end
  else
    PaGlobalFunc_Guild_Close()
  end
end
function Window_GuildInfo:SetDataByGuildGrade()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    return
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  local memberData
  local memberCount = myGuildInfo:getMemberCount()
  for memberIdx = 0, memberCount - 1 do
    memberData = myGuildInfo:getMember(memberIdx)
    if memberData:isSelf() then
      break
    end
  end
  if nil == memberData then
    return
  end
  if 0 == guildGrade then
  else
    if getSelfPlayer():get():isGuildMaster() then
    else
      if getSelfPlayer():get():isGuildSubMaster() then
      else
      end
    end
    local accumulateTax_s64 = myGuildInfo:getAccumulateTax()
    local accumulateCost_s64 = myGuildInfo:getAccumulateGuildHouseCost()
    local businessFunds_s64 = myGuildInfo:getGuildBusinessFunds_s64()
    if not (accumulateTax_s64 > toInt64(0, 0)) and not (accumulateCost_s64 > toInt64(0, 0)) or accumulateTax_s64 > businessFunds_s64 or accumulateCost_s64 > businessFunds_s64 then
    if not memberData:isCollectableBenefit() or false ~= memberData:isFreeAgent() or not (toInt64(0, 0) < memberData:getContractedBenefit()) or toInt64(0, 0) == businessFunds_s64 then
  end
end
function PaGlobalFunc_Guild_ListOpen()
  local self = Window_GuildInfo
  self._ui._bottom._button_Contract:SetShow(true)
  self._ui._bottom._button_Leave:SetShow(true)
  self._ui._radioButton._radioButton_GuildInfo:SetFontColor(Defines.Color.C_FF888888)
  self._ui._radioButton._radioButton_GuildList:SetFontColor(Defines.Color.C_FFEFEFEF)
  self._selectMemberIndex = -1
  self:GuildList_Open()
  self:GuildInfo_Close()
  self:UpdateGuildList()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    return
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  local memberData
  local memberCount = myGuildInfo:getMemberCount()
  for memberIdx = 0, memberCount - 1 do
    memberData = myGuildInfo:getMember(memberIdx)
    if memberData:isSelf() then
      break
    end
  end
  if nil == memberData then
    return
  end
  if 0 == guildGrade then
  else
    local accumulateTax_s64 = myGuildInfo:getAccumulateTax()
    local accumulateCost_s64 = myGuildInfo:getAccumulateGuildHouseCost()
    local businessFunds_s64 = myGuildInfo:getGuildBusinessFunds_s64()
    if accumulateTax_s64 > toInt64(0, 0) or accumulateCost_s64 > toInt64(0, 0) then
      if accumulateTax_s64 > businessFunds_s64 or accumulateCost_s64 > businessFunds_s64 then
        self._ui._radioButton_GuildMoneyInput:SetMonoTone(false)
        self._ui._radioButton_GuildMoneyInput:SetEnable(true)
      else
        self._ui._radioButton_GuildMoneyInput:SetMonoTone(true)
        self._ui._radioButton_GuildMoneyInput:SetEnable(false)
      end
    else
      self._ui._radioButton_GuildMoneyInput:SetMonoTone(true)
      self._ui._radioButton_GuildMoneyInput:SetEnable(false)
    end
    if memberData:isCollectableBenefit() and false == memberData:isFreeAgent() and toInt64(0, 0) < memberData:getContractedBenefit() then
      self._ui._radioButton_GuildMoneyOutput:SetEnable(true)
      self._ui._radioButton_GuildMoneyOutput:SetMonoTone(false)
      if toInt64(0, 0) == businessFunds_s64 then
        self._ui._radioButton_GuildMoneyOutput:SetFontColor(UI_color.C_FFF26A6A)
      else
        self._ui._radioButton_GuildMoneyOutput:SetFontColor(UI_color.C_FFC4A68A)
      end
    else
      self._ui._radioButton_GuildMoneyOutput:SetEnable(false)
      self._ui._radioButton_GuildMoneyOutput:SetMonoTone(true)
    end
  end
end
function Window_GuildInfo:UpdateGuildList()
  self._selectMemberIndex = -1
  self:SetGuildList()
  PaGlobalFunc_Guild_HandleMenberSort(0)
  self:GuildListUpdate()
end
function Window_GuildInfo:SetGuildList()
  self._memberListInfo = {}
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildListInfo then
    return
  end
  local memberCount = myGuildListInfo:getMemberCount()
  for index = 0, memberCount - 1 do
    local myGuildMemberInfo = myGuildListInfo:getMember(index)
    if nil == myGuildMemberInfo then
      return
    end
    local memberInfo = {
      _idx = index,
      _online = myGuildMemberInfo:isOnline(),
      _grade = myGuildMemberInfo:getGrade(),
      _level = myGuildMemberInfo:getLevel(),
      _class = myGuildMemberInfo:getClassType(),
      _name = myGuildMemberInfo:getName(),
      _charName = myGuildMemberInfo:getCharacterName(),
      _ap = Int64toInt32(myGuildMemberInfo:getTotalActivity()),
      _expiration = myGuildMemberInfo:getContractedExpirationUtc(),
      _wp = myGuildMemberInfo:getMaxWp(),
      _kp = myGuildMemberInfo:getExplorationPoint(),
      _userNo = myGuildMemberInfo:getUserNo()
    }
    self._memberListInfo[index] = memberInfo
  end
end
function Window_GuildInfo:GuildListUpdate()
  self._ui._list2_GuildList:getElementManager():clearKey()
  for index = 0, #self._memberListInfo do
    self._ui._list2_GuildList:getElementManager():pushKey(toInt64(0, index))
    self._ui._list2_GuildList:requestUpdateByKey(toInt64(0, index))
  end
end
function Window_GuildInfo:InitRegistEvnet()
  registerEvent("FromClient_ResponseGuildUpdate", "PaGlobalFunc_FromClient_ResponseGuildUpdate")
  registerEvent("ResponseGuild_invite", "PaGlobalFunc_FromClient_ResponseGuild_invite")
  registerEvent("ResponseGuild_refuse", "PaGlobalFunc_FromClient_ResponseGuild_refuse")
  registerEvent("FromClient_GuildInviteForGuildGrade", "PaGlobalFunc_FromClient_ResponseGuildInviteForGuildGrade")
  registerEvent("FromClient_RequestExpelMemberFromGuild", "PaGlobalFunc_FromClient_RequestExpelMemberFromGuild")
  registerEvent("FromClient_UpdateGuildContract", "PaGlobalFunc_FromClient_ResponseUpdateGuildContract")
  registerEvent("FromClient_NotifyGuildMessage", "PaGlobalFunc_FromClient_NotifyGuildMessage")
end
function PaGlobalFunc_FromClient_NotifyGuildMessage(msgType, strParam1, strParam2, s64_param1, s64_param2, s64_param3)
  local param1 = Int64toInt32(s64_param1)
  local param2 = Int64toInt32(s64_param2)
  local param3 = Int64toInt32(s64_param3)
  if 0 == msgType then
    local message = ""
    if 0 == param1 then
      message = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_CLAN_OUT")
    else
      message = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_GUILD_OUT")
    end
    Proc_ShowMessage_Ack(message)
  elseif 1 == msgType then
    local message = ""
    if 0 == param1 then
      message = PAGetStringParam1(Defines.StringSheet_GAME, "GAME_MESSAGE_CLANMEMBER_OUT", "familyName", strParam1)
    else
      message = PAGetStringParam1(Defines.StringSheet_GAME, "GAME_MESSAGE_GUILDMEMBER_OUT", "familyName", strParam1)
    end
    Proc_ShowMessage_Ack(message)
  elseif 2 == msgType then
    local message = ""
    if 0 == param1 then
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_JOIN_GUILD", "name", strParam1)
    else
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_JOIN_GUILD", "name", strParam1)
    end
    Proc_ShowMessage_Ack(message)
  elseif 3 == msgType then
    local message = ""
    if 0 == param1 then
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_WHO_JOIN_CLAN", "name", strParam1)
    else
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_WHO_JOIN_GUILD", "name", strParam1)
    end
    Proc_ShowMessage_Ack(message)
  elseif 4 == msgType then
    local message = ""
    if 0 == param1 then
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_CLAN_MSG", "name", strParam1)
    else
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD_MSG", "name", strParam1)
    end
    Proc_ShowMessage_Ack(message)
  elseif 5 == msgType then
    local textGrade = ""
    if 0 == param1 then
      textGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN")
    else
      textGrade = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD")
    end
    local message = ""
    if 0 == param2 then
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_EXPEL_SELF", "guild", strParam2)
    else
      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_EXPEL_OTHER", "name", strParam1, "guild", strParam2)
    end
    Proc_ShowMessage_Ack(message)
  elseif 6 == msgType then
    local message = ""
    if param1 <= 30 and param2 > 30 then
      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_COMPORATETAX_GUILDMEMBERCOUNT", "membercount", "30", "silver", PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERCOUNT_10"))
    elseif param1 <= 50 and param2 > 50 then
      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_COMPORATETAX_GUILDMEMBERCOUNT", "membercount", "50", "silver", PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERCOUNT_25"))
    elseif param1 <= 75 and param2 > 75 then
      message = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_COMPORATETAX_GUILDMEMBERCOUNT", "membercount", "75", "silver", PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERCOUNT_50"))
    else
      message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_INCREASE_GUILDMEMBERCOUNT", "membercount", param2)
    end
    Proc_ShowMessage_Ack(message)
  elseif 7 == msgType then
    local message = ""
    local characterName = strParam1
    local userNickName = strParam2
    if true == GameOption_ShowGuildLoginMessage() then
      if 0 == param1 then
        message = PAGetStringParam2(Defines.StringSheet_GAME, "GAME_MESSAGE_LOGIN_GUILD_MEMBER", "familyName", userNickName, "characterName", characterName)
      elseif 1 == param1 then
        message = PAGetStringParam2(Defines.StringSheet_GAME, "GAME_MESSAGE_LOGOUT_GUILD_MEMBER", "familyName", userNickName, "characterName", characterName)
      end
      Proc_ShowMessage_Ack(message)
    end
  elseif 8 == msgType then
    local message = ""
    local characterName = strParam1
    local userNickName = strParam2
  elseif 9 == msgType then
    local message = {}
    if param1 > 15 then
      message.main = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERLEVELUP_MAIN", "strParam1", strParam1, "param1", param1)
      message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
      message.addMsg = ""
      Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
    end
  elseif 10 == msgType then
    local message = {}
    if param1 <= 8 then
      local lifeLevel
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
  elseif 11 == msgType then
    local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(param1))
    if itemSSW == nil then
      return
    end
    local itemName = itemSSW:getName()
    local itemClassify = itemSSW:getItemClassify()
    local enchantLevel = itemSSW:get()._key:getEnchantLevel()
    local enchantLevelHigh = 0
    if nil ~= enchantLevel and 0 ~= enchantLevel then
      if enchantLevel >= 16 then
        enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel)
      elseif CppEnums.ItemClassifyType.eItemClassify_Accessory == itemClassify then
        enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel + 15)
      else
        enchantLevelHigh = "+ " .. enchantLevel
      end
    end
    local message = {}
    message.main = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERENCHANTSUCCESS_MAIN1", "strParam1", strParam1, "param1", enchantLevelHigh, "strParam2", itemName)
    message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
    message.addMsg = ""
    Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
  elseif 12 == msgType then
    local message = ""
    message = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDDUELWILLBEEND")
    Proc_ShowMessage_Ack(message)
  elseif 13 == msgType then
    local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(param1))
    if itemSSW == nil then
      return
    end
    local itemName = itemSSW:getName()
    local itemClassify = itemSSW:getItemClassify()
    local enchantLevel = itemSSW:get()._key:getEnchantLevel()
    local enchantLevelHigh = 0
    if nil ~= enchantLevel and 0 ~= enchantLevel then
      if enchantLevel >= 16 then
        enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel)
      elseif CppEnums.ItemClassifyType.eItemClassify_Accessory == itemClassify then
        enchantLevelHigh = HighEnchantLevel_ReplaceString(enchantLevel + 15)
      else
        enchantLevelHigh = "+ " .. enchantLevel
      end
    end
    local message = {}
    message.main = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBERPROMOTION_CAPHRAS", "strParam1", strParam1, "param1", enchantLevelHigh, "strParam2", itemName)
    message.sub = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMEMBER_CHEER")
    message.addMsg = ""
    Proc_ShowMessage_Ack_For_RewardSelect(message, 3.2, 22)
  end
end
function PaGlobalFunc_FromClient_ResponseGuildInviteForGuildGrade(targetActorKeyRaw, targetName, preGuildActivity)
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    _PA_ASSERT(false, "ResponseGuildInviteForGuildGrade \236\151\144\236\132\156 \234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164.")
    return
  end
  if nil == targetName then
    _PA_ASSERT(false, "targetName \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164.")
    return
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  if 0 == guildGrade then
    toClient_RequestInviteGuild(targetName, 0, 0, 0)
  else
    PaGlobalFunc_AgreementGuild_Open_ForJoin(targetActorKeyRaw, targetName, preGuildActivity)
  end
end
function PaGlobalFunc_FromClient_ResponseGuildUpdate()
  local self = Window_GuildInfo
  if false == PaGlobalFunc_Guild_GetShow() then
    return
  end
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    _PA_ASSERT(false, "ResponseGuildInviteForGuildGrade \236\151\144\236\132\156 \234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164.")
    return
  end
  self:UpdateGuildInfo()
  self:UpdateGuildList()
  local getGuildMoney = myGuildInfo:getGuildBusinessFunds_s64()
  self._ui._staticText_GuildMoneyValue:SetText(makeDotMoney(getGuildMoney))
end
function PaGlobalFunc_FromClient_RequestExpelMemberFromGuild()
  local self = Window_GuildInfo
  if true == PaGlobalFunc_Guild_GetShow() then
    self:UpdateGuildInfo()
    self:UpdateGuildList()
  end
end
function PaGlobalFunc_FromClient_ResponseGuild_refuse(questName, s64_joinableTime)
  if s64_joinableTime > toInt64(0, 0) then
    local lefttimeText = convertStringFromDatetime(getLeftSecond_TTime64(s64_joinableTime))
    local contentString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_MSGBOX_JOINWAITTIME_CONTENT", "questName", questName, "lefttimeText", lefttimeText)
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INVITE"),
      content = contentString,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  else
    local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
    if nil == myGuildInfo then
      _PA_ASSERT(false, "FromClient_ResponseGuild_refuse \236\151\144\236\132\156 \234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164.")
    end
    local textGuild = ""
    local guildGrade = myGuildInfo:getGuildGrade()
    if 0 == guildGrade then
      textGuild = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN")
    else
      textGuild = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD")
    end
    local contentString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_REFUSE_GUILDINVITE", "name", questName, "guild", textGuild)
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INVITE"),
      content = contentString,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function PaGlobalFunc_FromClient_ResponseUpdateGuildContract(notifyType, userNickName, characterName, strParam1, strParam2, s64_param1, s64_param2, s64_param3)
  local self = Window_GuildInfo
  local param1 = Int64toInt32(s64_param1)
  local param2 = Int64toInt32(s64_param2)
  local param3 = Int64toInt32(s64_param3)
  if 0 == notifyType then
    local tempStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PENSION")
    local guildWrapper = ToClient_GetMyGuildInfoWrapper()
    if nil == guildWrapper then
      return
    end
    local guildGrade = guildWrapper:getGuildGrade()
    if 1 == guildGrade then
      Proc_ShowMessage_Ack(tempStr)
    end
  elseif 1 == notifyType then
    local tempStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_DEPOSIT", "userNickName", userNickName, "money", tostring(param1))
    Proc_ShowMessage_Ack(tempStr)
  elseif 2 == notifyType then
    local isWarehouseGet = FGlobal_GetDailyPay_WarehouseCheckReturn()
    local tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_COLLECTION_INVEN", "money", makeDotMoney(param1))
    if true == isWarehouseGet then
      tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_COLLECTION_WAREHOUSE", "money", makeDotMoney(param1))
    else
      tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MONEY_COLLECTION_INVEN", "money", makeDotMoney(param1))
    end
    if 1 == param2 then
      Proc_ShowMessage_Ack(tempStr)
    end
  elseif 3 == notifyType then
    local tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_HIRE_RENEWAL", "userNickName", userNickName)
    Proc_ShowMessage_Ack(tempStr)
  elseif 4 == notifyType then
    local tempStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_EXPIRATION", "userNickName", userNickName)
    Proc_ShowMessage_Ack(tempStr)
  elseif 5 == notifyType then
    local periodDay = getTemporaryInformationWrapper():getContractedPeriodDay()
    local benefit = getTemporaryInformationWrapper():getContractedBenefit()
    local penalty = getTemporaryInformationWrapper():getContractedPenalty()
    local guildWrapper = ToClient_GetMyGuildInfoWrapper()
    if nil == guildWrapper then
      _PA_ASSERT(false, "\234\184\184\235\147\156\236\155\144\236\157\180 \234\179\160\236\154\169\234\179\132\236\149\189\236\132\156\235\165\188 \235\176\155\235\138\148\235\141\176 \234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164.")
      return
    end
    local guildName = guildWrapper:getName()
    PaGlobal_AgreementGuild_InviteOpen(false, userNickName, characterName, guildName, periodDay, benefit, penalty, guildWrapper:getGuildNo_s64())
  elseif 6 == notifyType then
    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PAYMENTS", "typeMoney", tostring(param2))
    if 0 ~= param1 then
      tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UNPAID", "typeMoney", tostring(param2))
    end
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INCOMETAX", "type", tempTxt))
  elseif 7 == notifyType then
    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_LEAVE", "userNickName", userNickName)
    if param1 > 0 then
      tempTxt = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PENALTIES", "tempTxt", tempTxt, "money", tostring(param1))
    end
    Proc_ShowMessage_Ack(tempTxt)
  elseif 8 == notifyType then
    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_FIRE", "userNickName", userNickName)
    if param1 > 0 then
      tempTxt = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BONUS", "tempTxt", tempTxt, "money", tostring(param1))
    end
    Proc_ShowMessage_Ack(tempTxt)
  elseif 9 == notifyType then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UPGRADES"))
  elseif 10 == notifyType then
  elseif 11 == notifyType then
    local text = ""
    if 1 == param3 then
      text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BESTMONEY", "money", makeDotMoney(s64_param1))
    else
      text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_NOTBESTMONEY", "money", makeDotMoney(s64_param1))
    end
    Proc_ShowMessage_Ack(text)
  elseif 12 == notifyType then
    local text
    if 1 == param1 then
      text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BIDCANCEL")
    else
      text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_BIDSUCCESS")
    end
    Proc_ShowMessage_Ack(text)
  elseif 13 == notifyType then
    if toInt64(0, 0) == s64_param1 then
      Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_USEGUILDSHOP_BUY", "userNickName", tostring(userNickName), "param2", makeDotMoney(s64_param2)))
    end
    if true == _ContentsGroup_RenewUI_NpcShop then
      if PaGlobalFunc_Dialog_NPCShop_IsShow() and npcShop_isGuildShopContents() then
        FromClient_Dialog_NPCShop_UpdateMoneyWarehouse()
        return
      end
    elseif Panel_Window_NpcShop:IsShow() and npcShop_isGuildShopContents() then
      NpcShop_UpdateMoneyWarehouse()
      return
    end
  elseif 14 == notifyType then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_INCENTIVE"))
  elseif 15 == notifyType then
    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_PAYMENTS", "typeMoney", tostring(param2))
    if 0 ~= param1 then
      tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_UNPAID", "typeMoney", tostring(param2))
    end
    Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_HOUSECOSTS", "tempTxt", tempTxt))
  elseif 16 == notifyType then
    local text = ""
    if 0 == param1 then
      text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_CREATE_CLAN", "name", userNickName)
    else
      text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_CREATE_GUILD", "name", userNickName)
    end
    Proc_ShowMessage_Ack(text)
  elseif 17 == notifyType then
    if false == ToClient_GetMessageFilter(9) then
      local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ACCEPT_GUILDQUEST")
      Proc_ShowMessage_Ack(text)
    end
  elseif 18 == notifyType then
    if false == ToClient_GetMessageFilter(9) then
      local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_COMPLETE_GUILDQUEST")
      Proc_ShowMessage_Ack(text)
    end
  elseif 19 == notifyType then
    local regionInfoWrapper = getRegionInfoWrapper(param2)
    if nil == regionInfoWrapper then
      _PA_ASSERT(false, "\236\132\177\236\163\188\234\176\128 \235\167\136\236\157\132\236\132\184\234\184\136\236\157\132 \236\136\152\234\184\136\237\150\136\235\138\148\235\141\176 \235\167\136\236\157\132 \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164.")
      return
    end
    local text = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_LORD_MOVETAX_TO_GUILDMONEY", "region", regionInfoWrapper:getAreaName(), "silver", makeDotMoney(s64_param1))
    Proc_ShowMessage_Ack(text)
  elseif 20 == notifyType then
  elseif 21 == notifyType then
    if CppEnums.GuildWarType.GuildWarType_Normal == ToClient_GetGuildWarType() then
      if param3 == 1 then
        local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ACCEPT_BATTLE_NO_RESOURCE")
        Proc_ShowMessage_Ack(text)
      else
        local tendency = param1
        local text = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_DECLARE_WAR_CONSUME", "silver", makeDotMoney(s64_param2))
        Proc_ShowMessage_Ack(text)
      end
    end
  elseif 22 == notifyType then
  elseif 23 == notifyType then
  elseif 24 == notifyType then
  elseif 25 == notifyType then
  elseif 26 == notifyType then
  elseif 27 == notifyType then
  elseif 28 == notifyType then
    if 0 == param1 then
      local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMP_DOWN")
      Proc_ShowMessage_Ack(userNickName .. text)
    else
      local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GUILDMP_UP")
      Proc_ShowMessage_Ack(userNickName .. text)
    end
    if Panel_GuildWarInfo:GetShow() then
      FromClient_WarInfoContent_Set()
    end
  elseif 29 == notifyType then
    if 0 == param1 then
      local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_CHEER_GUILD")
      Proc_ShowMessage_Ack(userNickName .. text)
      FromClient_NotifySiegeScoreToLog()
    else
      FromClient_NotifySiegeScoreToLog()
    end
  elseif 30 == notifyType then
    local text = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DONOT_GUILDQUEST")
    Proc_ShowMessage_Ack(text)
  elseif 31 == notifyType then
  elseif 32 == notifyType then
    local regionInfoWrapper = getRegionInfoWrapper(param3)
    local areaName = ""
    if nil ~= regionInfoWrapper then
      areaName = regionInfoWrapper:getAreaName()
    end
    local characterStaticStatusWarpper = getCharacterStaticStatusWarpper(param2)
    local characterName = ""
    if nil ~= characterStaticStatusWarpper then
      characterName = characterStaticStatusWarpper:getName()
    end
    local msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_BUILDING_AUTODESTROYBUILD", "areaName", areaName, "characterName", characterName)
    Proc_ShowMessage_Ack(msg)
  elseif 38 == notifyType then
    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDE_PAYPROPERTYTAX", "typeMoney", makeDotMoney(s64_param1))
    Proc_ShowMessage_Ack(tempTxt)
  elseif 39 == notifyType then
    local tempTxt = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_GETWELFARE", "typeMoney", makeDotMoney(s64_param1))
    Proc_ShowMessage_Ack(tempTxt)
  elseif 43 == notifyType then
    local tempTxt = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NOTIFYWELFARE")
    Proc_ShowMessage_Ack(tempTxt)
  end
  self:UpdateGuildList()
  self:UpdateGuildInfo()
end
function PaGlobalFunc_Guild_Accept()
  ToClient_RequestRefuseGuildInvite()
end
function PaGlobalFunc_Guild_Refuse()
  ToClient_RequestRefuseGuildInvite()
end
function PaGlobalFunc_FromClient_ResponseGuild_invite(s64_guildNo, hostUsername, hostName, guildName, guildGrade, periodDay, benefit, penalty)
  if 0 == guildGrade then
    local luaGuildTextGuildInviteMsg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN_INVITE_MSG")
    local luaGuildTextGuildInvite = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLAN_INVITE")
    local contentString = hostUsername .. "(" .. hostName .. ")" .. luaGuildTextGuildInviteMsg
    local messageboxData = {
      title = luaGuildTextGuildInvite,
      content = contentString,
      functionYes = PaGlobalFunc_Guild_Accept,
      functionCancel = PaGlobalFunc_Guild_Refuse,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  elseif 1 == guildGrade then
    PaGlobal_AgreementGuild_InviteOpen(true, hostUsername, hostName, guildName, periodDay, benefit, penalty, s64_guildNo)
  end
end
function PaGlobalFunc_Guild_List2EventControlCreate(list_content, key)
  local self = Window_GuildInfo
  local index = Int64toInt32(key)
  local memberInfo = self._memberListInfo[index]
  if nil == memberInfo then
    return
  end
  local static_ListTitleBg = UI.getChildControl(list_content, "Static_ListTitleBg")
  local staticText_Grade = UI.getChildControl(list_content, "StaticText_Grade")
  local staticText_Level = UI.getChildControl(list_content, "StaticText_LevelTitle")
  local staticText_Name = UI.getChildControl(list_content, "StaticText_NameValue")
  local staticText_Activity = UI.getChildControl(list_content, "StaticText_ActivityValue")
  local staticText_ContributedTendency = UI.getChildControl(list_content, "StaticText_ContributedTendencyValue")
  local static_Focus = UI.getChildControl(list_content, "Static_Focus")
  static_Focus:SetShow(true)
  local static_GradeIcon = UI.getChildControl(list_content, "Static_GradeIcon")
  local static_VoiceIcon = UI.getChildControl(list_content, "Static_VoiceIcon")
  local static_MicIcon = UI.getChildControl(list_content, "Static_MiceIcon")
  local static_ContractIcon = UI.getChildControl(list_content, "Static_ContractIcon")
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildListInfo then
    return
  end
  static_Focus:SetShow(index == self._selectMemberIndex)
  static_ListTitleBg:addInputEvent("Mouse_LUp", "")
  static_ListTitleBg:addInputEvent("Mouse_On", "PaGlobalFunc_Guild_SelectMember(" .. index .. ")")
  static_ListTitleBg:addInputEvent("Mouse_Out", "PaGlobalFunc_Guild_SelectClear()")
  local businessFunds_s64 = myGuildListInfo:getGuildBusinessFunds_s64()
  local guildGrade = myGuildListInfo:getGuildGrade()
  local dataIdx = memberInfo._idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  if nil == myGuildMemberInfo then
    _PA_ASSERT(false, "\235\169\164\235\178\132 \235\141\176\236\157\180\237\132\176\234\176\128 \236\151\134\236\157\132 \236\136\152 \236\158\136\235\130\152? \237\153\149\236\157\184 \235\176\148\235\158\141\235\139\136\235\139\164.")
    return
  end
  local gradeType = myGuildMemberInfo:getGrade()
  static_GradeIcon:ChangeTextureInfoName("renewal/ui_icon/console_icon_guild_00.dds")
  if 0 == gradeType then
    local x1, y1, x2, y2 = setTextureUV_Func(static_GradeIcon, 1, 1, 37, 37)
    static_GradeIcon:getBaseTexture():setUV(x1, y1, x2, y2)
    static_GradeIcon:setRenderTexture(static_GradeIcon:getBaseTexture())
    staticText_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMASTER"))
  elseif 1 == gradeType then
    local x1, y1, x2, y2 = setTextureUV_Func(static_GradeIcon, 73, 1, 109, 37)
    static_GradeIcon:getBaseTexture():setUV(x1, y1, x2, y2)
    static_GradeIcon:setRenderTexture(static_GradeIcon:getBaseTexture())
    staticText_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDSUBMASTER"))
  elseif 2 == gradeType then
    local x1, y1, x2, y2 = setTextureUV_Func(static_GradeIcon, 38, 1, 72, 37)
    static_GradeIcon:getBaseTexture():setUV(x1, y1, x2, y2)
    static_GradeIcon:setRenderTexture(static_GradeIcon:getBaseTexture())
    staticText_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMEMBER"))
  elseif 3 == gradeType then
    local x1, y1, x2, y2 = setTextureUV_Func(static_GradeIcon, 110, 1, 146, 37)
    static_GradeIcon:getBaseTexture():setUV(x1, y1, x2, y2)
    static_GradeIcon:setRenderTexture(static_GradeIcon:getBaseTexture())
    staticText_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_SUPPLYOFFICER"))
  end
  if myGuildMemberInfo:isSelf() then
  else
  end
  staticText_Level:SetText(myGuildMemberInfo:getLevel())
  local maxWp = myGuildMemberInfo:getMaxWp()
  if 0 == maxWp then
    maxWp = "-"
  end
  local explorationPoint = myGuildMemberInfo:getExplorationPoint()
  staticText_ContributedTendency:SetText(maxWp .. "/" .. explorationPoint)
  if true == self._config._isVoiceOpen then
    if myGuildMemberInfo:isVoiceChatSpeak() then
      if myGuildMemberInfo:isVoiceSpeaking() then
        local x1, y1, x2, y2 = setTextureUV_Func(static_VoiceIcon, 422, 70, 451, 93)
        static_VoiceIcon:getBaseTexture():setUV(x1, y1, x2, y2)
        static_VoiceIcon:setRenderTexture(static_VoiceIcon:getBaseTexture())
      else
        self:CheckVoiceChatMicTexture(static_MicIcon, true)
      end
      self:CheckVoiceChatMicTexture(static_MicIcon, false)
    end
    self:CheckVoiceChatListenTexture(static_VoiceIcon, myGuildMemberInfo:isVoiceChatListen())
  end
  if true == myGuildMemberInfo:isOnline() then
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
    if self._config._isVoiceOpen and 0 < ToClient_getGameOptionControllerWrapper():getUIFontSizeType() then
      staticText_Name:SetText(myGuildMemberInfo:getName())
    end
    if true == self._config._isVoiceOpen then
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
    if true == self._config._isVoiceOpen then
      static_VoiceIcon:SetIgnore(true)
      static_MicIcon:SetIgnore(true)
    end
  end
  local contractAble = myGuildMemberInfo:getContractableUtc()
  local expiration = myGuildMemberInfo:getContractedExpirationUtc()
  local isContractState = 0
  if 0 < Int64toInt32(getLeftSecond_TTime64(expiration)) then
    isContractState = 1
    if 0 >= Int64toInt32(getLeftSecond_TTime64(contractAble)) then
      isContractState = 0
    end
  else
    isContractState = 2
  end
  PaGlobalFunc_Guild_ChangeTexture_Expiration(static_ContractIcon, isContractState)
  static_ContractIcon:SetShow(true)
  if 0 == ToClient_GetMyGuildInfoWrapper():getGuildGrade() then
    static_ContractIcon:SetIgnore(true)
    static_ContractIcon:SetMonoTone(true)
  else
    static_ContractIcon:SetIgnore(false)
    static_ContractIcon:SetMonoTone(false)
  end
end
function PaGlobalFunc_Guild_SelectClear()
  local self = Window_GuildInfo
  local prevIndex = self._selectMemberIndex
  self._selectMemberIndex = -1
  self._ui._list2_GuildList:requestUpdateByKey(toInt64(0, prevIndex))
end
function PaGlobalFunc_Guild_SelectMember(index)
  local self = Window_GuildInfo
  local prevIndex = self._selectMemberIndex
  self._selectMemberIndex = index
  self._ui._list2_GuildList:requestUpdateByKey(toInt64(0, prevIndex))
  self._ui._list2_GuildList:requestUpdateByKey(toInt64(0, self._selectMemberIndex))
end
function PaGlobalFunc_Guild_HandleClickedGuildMemberContractbutton()
  local self = Window_GuildInfo
end
function PaGlobalFunc_Guild_MandateTooltipShow(isShow, titleType, controlIdx)
end
function PaGlobalFunc_Guild_ChangeTexture_Expiration(control, state)
  if 2 == state then
    control:SetColor(Defines.Color.C_FFFF0000)
  elseif 0 == state then
    control:SetColor(Defines.Color.C_FF008AFF)
  elseif 1 == state then
    control:SetColor(Defines.Color.C_FFEFEFEF)
  end
end
function PaGlobalFunc_Guild_NameTooltip(isShow, index, uiIndex)
end
function Window_GuildInfo:CheckVoiceChatMicTexture(control, onOff)
  control:ChangeTextureInfoName("renewal/ui_icon/console_icon_01.dds")
  if onOff then
    local x1, y1, x2, y2 = setTextureUV_Func(control, 105, 169, 133, 197)
    control:getBaseTexture():setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
  else
    local x1, y1, x2, y2 = setTextureUV_Func(control, 105, 198, 133, 226)
    control:getBaseTexture():setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
  end
end
function Window_GuildInfo:CheckVoiceChatListenTexture(control, onOff)
  control:ChangeTextureInfoName("renewal/ui_icon/console_icon_01.dds")
  if onOff then
    local x1, y1, x2, y2 = setTextureUV_Func(control, 134, 169, 162, 197)
    control:getBaseTexture():setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
  else
    local x1, y1, x2, y2 = setTextureUV_Func(control, 134, 198, 162, 226)
    control:getBaseTexture():setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
  end
end
function PaGlobalFunc_Guild_HandleClickedMemberDel()
  local self = Window_GuildInfo
  if 1 ~= self._tabIndex then
    return
  end
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildListInfo then
    return
  end
  local myGuildMemberInfo = myGuildListInfo:getMember(self._selectMemberIndex)
  if nil == myGuildMemberInfo then
    return
  end
  self._deleteMemberIndex = self._selectMemberIndex
  local messageTitle = ""
  local messageContent = ""
  local yesFunction
  local targetName = myGuildMemberInfo:getName()
  local characterName = myGuildMemberInfo:getCharacterName()
  local isOnlineMember = myGuildMemberInfo:isOnline()
  messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_EXPEL_GUILDMEMBER")
  messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_EXPEL_GUILDMEMBER_QUESTION", "target", "[" .. tostring(targetName) .. "]")
  local messageboxData = {
    title = messageTitle,
    content = messageContent,
    functionYes = PaGlobalFunc_Guild_MessageBoxYesFunction_ExpelMember,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobalFunc_Guild_MessageBoxYesFunction_ExpelMember()
  local self = Window_GuildInfo
  local checkedUserNo = self._memberListInfo[self._deleteMemberIndex]._userNo
  ToClient_RequestExpelMemberFromGuild(self._deleteMemberIndex, checkedUserNo)
  self._deleteMemberIndex = -1
end
function PaGlobalFunc_Guild_HandleClickedGuildDel()
  local self = Window_GuildInfo
  if 1 ~= self._tabIndex then
    return
  end
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    _PA_ASSERT(false, "ResponseGuildInviteForGuildGrade \236\151\144\236\132\156 \234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164.")
    return
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  local messageboxData
  if true == getSelfPlayer():get():isGuildMaster() then
    if 1 >= myGuildInfo:getMemberCount() then
      messageboxData = {
        title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD"),
        content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD_ASK"),
        functionYes = PaGlobalFunc_Guild_DelContinue,
        functionNo = MessageBox_Empty_function,
        priority = UCT.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageboxData)
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_CANT_DISPERSE"))
    end
  else
    local tempText
    if 0 == guildGrade then
      tempText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_CLANLIST_CLANOUT_ASK")
    else
      tempText = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD_ASK") .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILD_MENTINFO")
    end
    messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WITHDRAW_GUILD"),
      content = tempText,
      functionYes = PaGlobalFunc_Guild_LeaveContinue,
      functionNo = MessageBox_Empty_function,
      priority = UCT.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function PaGlobalFunc_Guild_DelContinue()
  ToClient_RequestDestroyGuild()
  PaGlobalFunc_Guild_Close()
end
function PaGlobalFunc_Guild_LeaveContinue()
  ToClient_RequestDisjoinGuild()
  PaGlobalFunc_Guild_Close()
end
function Window_GuildInfo:InitEvent()
  local guildInfomation = self._ui._guildInfomation
  local guildList = self._ui._guildList
  local guildMoney = self._ui._guildMoney
  local bottom = self._ui._bottom
  self._ui._radioButton._radioButton_GuildInfo:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_InfoOpen()")
  self._ui._radioButton._radioButton_GuildList:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_ListOpen()")
  Panel_Console_Window_Guild:registerPadEvent(__eConsoleUIPadEvent_LB, "PaGlobalFunc_XB_Control_Tap(-1)")
  Panel_Console_Window_Guild:registerPadEvent(__eConsoleUIPadEvent_RB, "PaGlobalFunc_XB_Control_Tap(1)")
  if _ContentsGroup_isConsolePadControl then
    Panel_Console_Window_Guild:registerPadEvent(__eConsoleUIPadEvent_Up_A, " PaGlobalFunc_Guild_ContractButton()")
  else
    bottom._button_Contract:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_ContractButton()")
  end
  self._ui._list2_GuildList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_Guild_List2EventControlCreate")
  self._ui._list2_GuildList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui._radioButton_GuildMoneyInput:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedIncentive_Deposit()")
  self._ui._radioButton_GuildMoneyOutput:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedIncentive_Paypal()")
end
function PaGlobalFunc_Guild_HandleClickedIncentive_Deposit()
  HandleCLicked_GuildListIncentive_Deposit()
end
function PaGlobalFunc_Guild_HandleClickedIncentive_Paypal()
  local hasWareHouse = ToClient_HasWareHouseFromNpc()
  if true == hasWareHouse then
    FGlobal_GetDailyPay_Show()
  else
    ToClient_TakeMyGuildBenefit(false)
  end
end
function PaGlobalFunc_Guild_ContractButton()
  local self = Window_GuildInfo
  local index = self._selectMemberIndex
  if -1 == index then
    return
  end
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildListInfo then
    return
  end
  local dataIdx = self._memberListInfo[index]._idx
  local myGuildMemberInfo = myGuildListInfo:getMember(dataIdx)
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  local usableActivity = myGuildMemberInfo:getUsableActivity()
  if true == isGuildMaster then
    PaGlobalFunc_AgreementGuild_Master_ContractOpen(dataIdx, 0, usableActivity)
  elseif true == isGuildSubMaster then
    PaGlobalFunc_AgreementGuild_Master_ContractOpen(dataIdx, 1, usableActivity)
  else
    PaGlobalFunc_AgreementGuild_Master_ContractOpen(dataIdx, 2, usableActivity)
  end
end
function Window_GuildInfo:InitControl()
  local radioButton = self._ui._radioButton
  local guildInfomation = self._ui._guildInfomation
  local guildList = self._ui._guildList
  local guildMoney = self._ui._guildMoney
  local bottom = self._ui._bottom
  radioButton._radioButton_GuildInfo = UI.getChildControl(self._ui._static_RadioButtonBg, "RadioButton_GuildInformation")
  radioButton._radioButton_GuildList = UI.getChildControl(self._ui._static_RadioButtonBg, "RadioButton_GuildList")
  guildInfomation._staticText_GuildTitle = UI.getChildControl(self._ui._static_GuildInfomationBg, "StaticText_GuildTitle")
  guildInfomation._staticGuildAllInfo = UI.getChildControl(self._ui._static_GuildInfomationBg, "Static_GuildAllInfo")
  guildInfomation._staticText_MasterValue = UI.getChildControl(guildInfomation._staticGuildAllInfo, "StaticText_MasterValue")
  guildInfomation._staticText_RankValue = UI.getChildControl(guildInfomation._staticGuildAllInfo, "StaticText_GuildRankValue")
  guildInfomation._staticText_Protectvalue = UI.getChildControl(guildInfomation._staticGuildAllInfo, "StaticText_ProtectValue")
  guildInfomation._staticText_PointValue = UI.getChildControl(guildInfomation._staticGuildAllInfo, "StaticText_PointValue")
  guildInfomation._staticText_TerritoryAreaValue = UI.getChildControl(guildInfomation._staticGuildAllInfo, "StaticText_TerritoryAreaValue")
  guildInfomation._staticText_ServantValue = UI.getChildControl(guildInfomation._staticGuildAllInfo, "StaticText_GuildServantValue")
  self._ui._staticText_GuildMoneyValue = UI.getChildControl(self._ui._static_GuildMoneyBg, "StaticText_GuildMoneyValue")
  self._ui._radioButton_GuildMoneyInput = UI.getChildControl(self._ui._static_GuildMoneyBg, "RadioButton_GuildMoneyInput")
  self._ui._radioButton_GuildMoneyOutput = UI.getChildControl(self._ui._static_GuildMoneyBg, "RadioButton_GuildMoneyOutput")
  self._ui._list2_GuildList = UI.getChildControl(self._ui._static_GuildListBg, "List2_GuildlistBg")
  bottom._button_Contract = UI.getChildControl(self._ui._static_BottomBg, "Button_Contract_ConsoleUI")
  bottom._button_Leave = UI.getChildControl(self._ui._static_BottomBg, "Button_Leave_ConsoleUI")
  bottom._button_Close = UI.getChildControl(self._ui._static_BottomBg, "Button_Close_ConsoleUI")
end
function PaGlobalFunc_XB_Control_Tap(titleIndex)
  local self = Window_GuildInfo
  self._tabIndex = self._tabIndex + titleIndex
  self._tabIndex = math.min(self._tabIndex, self._config._maxTitleTab - 1)
  self._tabIndex = math.max(0, self._tabIndex)
  if 0 == self._tabIndex then
    PaGlobalFunc_Guild_InfoOpen()
  elseif 1 == self._tabIndex then
    PaGlobalFunc_Guild_ListOpen()
  else
    _PA_LOG("\236\157\180\237\152\184\236\132\156", "titleIndex\234\176\128 \236\158\152\235\170\187 \235\147\164\236\150\180\236\153\148\235\139\164.")
  end
end
function Window_GuildInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegistEvnet()
  self:SetSortFunc()
end
function PaGlobalFunc_Guild_Toggle()
  if true == PaGlobalFunc_Guild_GetShow() then
    PaGlobalFunc_Guild_Close()
  else
    PaGlobalFunc_Guild_Open()
  end
end
function PaGlobalFunc_Guild_GetShow()
  return Panel_Console_Window_Guild:GetShow()
end
function PaGlobalFunc_Guild_Open()
  local self = Window_GuildInfo
  self._selectMemberIndex = -1
  self._tabIndex = 0
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildListInfo then
    return
  end
  local memberCount = myGuildListInfo:getMemberCount()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  local isGuildMaster = getSelfPlayer():get():isGuildMaster()
  local isGuildSubMaster = getSelfPlayer():get():isGuildSubMaster()
  if myGuildInfo ~= nil then
    GuildManager._doHaveSeige = myGuildInfo:doHaveOccupyingSiege()
  end
  if getSelfPlayer():get():isGuildMaster() or getSelfPlayer():get():isGuildSubMaster() then
    if 1 == memberCount then
      self._ui._bottom._button_Leave:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD"))
      if _ContentsGroup_isConsolePadControl then
        Panel_Console_Window_Guild:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_Guild_HandleClickedGuildDisPerse()")
      else
        self._ui._bottom._button_Leave:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedGuildDisPerse()")
      end
    else
      self._ui._bottom._button_Leave:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMPETITIONGAME_USERKICK"))
      if _ContentsGroup_isConsolePadControl then
        Panel_Console_Window_Guild:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_Guild_HandleClickedMemberDel()")
      else
        self._ui._bottom._button_Leave:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedMemberDel()")
      end
    end
  else
    self._ui._bottom._button_Leave:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PARTYOPTION_BTN_LEAVE"))
    if _ContentsGroup_isConsolePadControl then
      Panel_Console_Window_Guild:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_Guild_HandleClickedGuildDel()")
    else
      self._ui._bottom._button_Leave:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_HandleClickedGuildDel()")
    end
  end
  self._ui._bottom._button_Close:addInputEvent("Mouse_LUp", "PaGlobalFunc_Guild_Close()")
  local getGuildMoney = myGuildInfo:getGuildBusinessFunds_s64()
  self._ui._staticText_GuildMoneyValue:SetText(makeDotMoney(getGuildMoney))
  Panel_Console_Window_Guild:SetShow(true, false)
  PaGlobalFunc_Guild_InfoOpen()
end
function PaGlobalFunc_Guild_HandleClickedGuildDisPerse()
  local self = Window_GuildInfo
  if 1 ~= self._tabIndex then
    return
  end
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildInfo then
    _PA_ASSERT(false, "ResponseGuildInviteForGuildGrade \236\151\144\236\132\156 \234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\151\134\236\138\181\235\139\136\235\139\164.")
    return
  end
  if false == getSelfPlayer():get():isGuildMaster() then
    return
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  local messageboxData
  if 1 >= myGuildInfo:getMemberCount() then
    messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD"),
      content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_DISPERSE_GUILD_ASK"),
      functionYes = PaGlobalFunc_Guild_HandleClickedGuildDisPerseConfirm,
      functionNo = MessageBox_Empty_function,
      priority = UCT.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_CANT_DISPERSE"))
  end
end
function PaGlobalFunc_Guild_HandleClickedGuildDisPerseConfirm()
  ToClient_RequestDestroyGuild()
  PaGlobalFunc_Guild_Close()
end
function PaGlobalFunc_Guild_Close()
  local self = Window_GuildInfo
  self._selectMemberIndex = -1
  Panel_Console_Window_Guild:SetShow(false, false)
end
function PaGlobalFunc_FromClient_Guild_luaLoadComplete()
  local self = Window_GuildInfo
  self:Initialize()
  self:UpdateGuildInfo()
  self:UpdateGuildList()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_Guild_luaLoadComplete")
