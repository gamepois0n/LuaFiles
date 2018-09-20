local _parent = Panel_Window_Guild_Renew
local _panel = Panel_Window_Guild_MemberList
local _disableColor = Defines.Color.C_FF525B6D
local _enableColor = Defines.Color.C_FFEEEEEE
local GuildMemberList = {
  _ui = {
    list_MemberList = UI.getChildControl(_panel, "List2_MemberList")
  },
  _listSortFunction = {
    gradeSort,
    levelSort,
    nameSort,
    apSort
  },
  _memberListInfo = {},
  _memberListControlData = {},
  _parentBg = nil,
  _currentSortType = nil
}
function GuildMemberList:init()
  self:registEvent()
  self:setSortFunc()
end
function GuildMemberList:SetMemberInfo()
  self._memberListInfo = {}
  local guildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == guildInfo then
    _PA_ASSERT(false, "\234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList:SetMemberInfo")
    return
  end
  ToClient_updateXboxGuildUserGamerTag()
  local memberCount = guildInfo:getMemberCount()
  for memberIdx = 0, memberCount - 1 do
    local memberInfo = guildInfo:getMember(memberIdx)
    if nil ~= memberInfo then
      local info = {
        _idx = memberIdx,
        _online = memberInfo:isOnline(),
        _grade = memberInfo:getGrade(),
        _level = memberInfo:getLevel(),
        _class = memberInfo:getClassType(),
        _name = memberInfo:getName(),
        _charName = memberInfo:getCharacterName(),
        _ap = Int64toInt32(memberInfo:getTotalActivity()),
        _expiration = memberInfo:getContractedExpirationUtc(),
        _wp = memberInfo:getMaxWp(),
        _kp = memberInfo:getExplorationPoint(),
        _userNo = memberInfo:getUserNo(),
        _contractable = memberInfo:getContractableUtc(),
        _saying = memberInfo:isVoiceChatSpeak(),
        _permissionHas = memberInfo:isVoicePermissionHas(),
        _gamerTag = ToClient_getXboxGuildUserGamerTag(memberInfo:getUserNo())
      }
      if memberInfo:getUserNo() == getSelfPlayer():get():getUserNo() then
        info._hearing = memberInfo:isVoiceChatListen()
      elseif 0 < memberInfo:getVoiceVolume() then
        info._hearing = true
      else
        info._hearing = false
      end
      self._memberListInfo[memberIdx + 1] = info
    end
  end
end
function GuildMemberList:setSortFunc()
  function self._listSortFunction.gradeSort(w1, w2)
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
    return w1Grade < w2Grade
  end
end
function GuildMemberList:registEvent()
  self._ui.list_MemberList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_GuildMemberList_CreateControl")
  self._ui.list_MemberList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  registerEvent("FromClient_GuildListUpdate", "FromClient_GuildMemberList_GuildListUpdate")
  registerEvent("FromClient_VoiceChatState", "FromClient_GuildMemberList_RequestClearAndUpdateMember")
  registerEvent("FromClient_RequestExpelMemberFromGuild", "FromClient_GuildMemberList_RequestClearAndUpdateMember")
  registerEvent("FromClient_ResponseGuildMasterChange", "FromClient_GuildMemberList_ResponseGuildMasterChange")
  registerEvent("FromClient_RequestChangeGuildMemberGrade", "FromClient_GuildMemberList_RequestChangeMemberGrade")
  registerEvent("FromClient_ResponseChangeGuildMemberGrade", "FromClient_GuildMemberList_ResponseChangeMemberGrade")
end
function GuildMemberList:open()
  self:SetMemberInfo()
  self:clearAndUpdateList()
end
function GuildMemberList:clearAndUpdateList()
  PaGlobalFunc_GuildMemberList_MemberSort(0)
  self._ui.list_MemberList:getElementManager():clearKey()
  for memberIdx = 0, #self._memberListInfo - 1 do
    self._ui.list_MemberList:getElementManager():pushKey(toInt64(0, memberIdx))
  end
end
function PaGlobalFunc_GuildMemberList_Open()
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  self:open()
end
function PaGlobalFunc_GuildMemberList_GetMemberInfoWithIndex(index)
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  return self._memberListInfo[index + 1]
end
function PaGlobalFunc_GuildMemberList_MemberVoiceUpdate(index, isSaying, isHearing, isForce)
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  self._memberListControlData[index].check_Mice:SetCheck(true ~= isForce and false ~= isSaying)
  self._memberListControlData[index].check_Headphone:SetCheck(isHearing)
  self._memberListControlData[index].stc_HasNoMicPermission:SetShow(not isForce or not isSaying)
end
function PaGlobalFunc_GuildMemberList_Init()
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  self._parentBg = UI.getChildControl(_parent, "Static_GuildMemberBg")
  self._parentBg:SetShow(false)
  self._parentBg:MoveChilds(self._parentBg:GetID(), _panel)
  UI.deletePanel(_panel:GetID())
  self:init()
end
function PaGlobalFunc_GuildMemberList_MemberSort(sortType)
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  self._currentSortType = sortType
  if 0 == sortType then
    table.sort(self._memberListInfo, self._listSortFunction.gradeSort)
  elseif 1 == sortType then
  elseif 2 == sortType then
  elseif 3 == sortType then
  elseif 4 == sortType then
  elseif 5 == sortType then
  end
end
function PaGlobalFunc_GuildMemberList_CreateControl(content, key)
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  local guildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == guildInfo then
    _PA_ASSERT(false, "\234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : PaGlobalFunc_GuildMemberList_CreateControl")
    return
  end
  local memberIdx = Int64toInt32(key)
  local memberInfo = self._memberListInfo[memberIdx + 1]
  if nil == memberInfo then
    return
  end
  local control = {}
  local btn_GuildSlot = UI.getChildControl(content, "Button_GuildSlot")
  local txt_Grade = UI.getChildControl(content, "StaticText_Grade")
  local txt_Level = UI.getChildControl(content, "StaticText_Level")
  local txt_Name = UI.getChildControl(content, "StaticText_Name")
  local txt_Class = UI.getChildControl(content, "StaticText_Class")
  local stc_Contract = UI.getChildControl(content, "Static_Contract")
  control.stc_HasNoMicPermission = UI.getChildControl(content, "Static_Cant")
  control.check_Mice = UI.getChildControl(content, "CheckButton_Mice")
  control.check_Headphone = UI.getChildControl(content, "CheckButton_Headphone")
  txt_Grade:ChangeTextureInfoName("renewal/ui_icon/console_icon_guild_00.dds")
  if 0 == memberInfo._grade then
    local x1, y1, x2, y2 = setTextureUV_Func(txt_Grade, 1, 1, 37, 37)
    txt_Grade:getBaseTexture():setUV(x1, y1, x2, y2)
    txt_Grade:setRenderTexture(txt_Grade:getBaseTexture())
    txt_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMASTER"))
  elseif 1 == memberInfo._grade then
    local x1, y1, x2, y2 = setTextureUV_Func(txt_Grade, 73, 1, 109, 37)
    txt_Grade:getBaseTexture():setUV(x1, y1, x2, y2)
    txt_Grade:setRenderTexture(txt_Grade:getBaseTexture())
    txt_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDSUBMASTER"))
  elseif 2 == memberInfo._grade then
    local x1, y1, x2, y2 = setTextureUV_Func(txt_Grade, 110, 1, 146, 37)
    txt_Grade:getBaseTexture():setUV(x1, y1, x2, y2)
    txt_Grade:setRenderTexture(txt_Grade:getBaseTexture())
    txt_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_GUILDMEMBER"))
  elseif 3 == memberInfo._grade then
    local x1, y1, x2, y2 = setTextureUV_Func(txt_Grade, 38, 1, 72, 37)
    txt_Grade:getBaseTexture():setUV(x1, y1, x2, y2)
    txt_Grade:setRenderTexture(txt_Grade:getBaseTexture())
    txt_Grade:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_SUPPLYOFFICER"))
  end
  if true == memberInfo._online then
    txt_Grade:SetFontColor(_enableColor)
    txt_Level:SetText(memberInfo._level)
    txt_Level:SetFontColor(_enableColor)
    txt_Name:SetText(memberInfo._name .. " (" .. memberInfo._charName .. ") (" .. memberInfo._gamerTag .. ")")
    txt_Name:SetFontColor(_enableColor)
    txt_Class:SetText(CppEnums.ClassType2String[memberInfo._class])
    txt_Class:SetFontColor(_enableColor)
    control.check_Mice:SetCheck(memberInfo._saying)
    control.check_Headphone:SetCheck(memberInfo._hearing)
  else
    txt_Grade:SetFontColor(_disableColor)
    txt_Level:SetText("-")
    txt_Level:SetFontColor(_disableColor)
    txt_Name:SetText(memberInfo._name .. " ( - )")
    txt_Name:SetFontColor(_disableColor)
    txt_Class:SetText("-")
    txt_Class:SetFontColor(_disableColor)
    control.check_Mice:SetCheck(false)
    control.check_Headphone:SetCheck(false)
  end
  if 0 < Int64toInt32(getLeftSecond_TTime64(memberInfo._expiration)) then
    stc_Contract:SetColor(Defines.Color.C_FFD20000)
    if 0 >= Int64toInt32(getLeftSecond_TTime64(memberInfo._contractable)) then
      stc_Contract:SetColor(Defines.Color.C_FFF0D147)
    end
  else
    stc_Contract:SetColor(Defines.Color.C_FF309BF5)
  end
  control.stc_HasNoMicPermission:SetShow(not memberInfo._permissionHas)
  self._memberListControlData[memberIdx] = control
  btn_GuildSlot:addInputEvent("Mouse_LUp", "InputMLUp_GuildMemberList_MemberFunctionOpen(" .. memberIdx .. ")")
end
function InputMLUp_GuildMemberList_MemberFunctionOpen(index)
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  PaGlobalFunc_GuildMemberFunction_Open(index)
end
function FromClient_GuildMemberList_GuildListUpdate(userNo)
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  self:SetMemberInfo()
  PaGlobalFunc_GuildMemberList_MemberSort(0)
  local requestIdx
  for idx = 0, #self._memberListInfo - 1 do
    if userNo == self._memberListInfo[idx + 1]._userNo then
      requestIdx = idx
    end
  end
  if nil == requestIdx then
    return
  end
  self._ui.list_MemberList:requestUpdateByKey(toInt64(0, requestIdx))
end
function FromClient_GuildMemberList_RequestClearAndUpdateMember()
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  self:SetMemberInfo()
  self:clearAndUpdateList()
end
function FromClient_GuildMemberList_RequestChangeMemberGrade(grade)
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  if nil ~= guildWrapper then
    local guildGrade = guildWrapper:getGuildGrade()
    if 0 ~= guildGrade then
      if 1 == grade then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GRADECHANGE_MESSAGE_2"))
      elseif 2 == grade then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GRADECHANGE_MESSAGE_3"))
      elseif 3 == grade then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_GRADECHANGE_MESSAGE_4"))
      end
    elseif 1 == grade then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CLAN_GRADECHANGE_MESSAGE_2"))
    elseif 2 == grade then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CLAN_GRADECHANGE_MESSAGE_3"))
    end
  end
  self:SetMemberInfo()
  self:clearAndUpdateList()
end
function FromClient_GuildMemberList_ResponseChangeMemberGrade(targetNo, isProtectable)
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  local userNo = Int64toInt32(getSelfPlayer():get():getUserNo())
  if userNo == Int64toInt32(targetNo) then
    if true == isProtectable then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PROTECT_GUILDMEMBER_MESSAGE_0"))
    else
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_PROTECT_GUILDMEMBER_MESSAGE_1"))
    end
  end
  self:SetMemberInfo()
  self:clearAndUpdateList()
end
function FromClient_GuildMemberList_ResponseGuildMasterChange(userNo, targetNo)
  local self = GuildMemberList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMemberList")
    return
  end
  local selfUserNo = Int64toInt32(getSelfPlayer():get():getUserNo())
  if selfUserNo == Int64toInt32(userNo) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_MASTERCHANGE_MESSAGE_0"))
  elseif selfUserNo == Int64toInt32(targetNo) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_MASTERCHANGE_MESSAGE_1"))
  end
  self:SetMemberInfo()
  self:clearAndUpdateList()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_GuildMemberList_Init")
