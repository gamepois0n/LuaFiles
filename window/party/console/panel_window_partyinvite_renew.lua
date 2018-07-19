Panel_Window_PartyInvite:ignorePadSnapMoveToOtherPanel()
local Panel_Window_PartyInvite_info = {
  _ui = {
    static_TabBg = nil,
    radioButton_Guild = nil,
    radioButton_Friend = nil,
    tabRadionButton = {},
    list2_Worker = nil
  },
  _value = {currentIndex = nil, currentTabIndex = nil},
  _config = {},
  _enum = {
    eTAB_GUILD = 0,
    eTAB_FRIEND = 1,
    eTAB_COUNT = 2
  },
  _color = {
    unSelected = Defines.Color.C_FF525B6D,
    selected = Defines.Color.C_FFEEEEEE
  },
  _guildOnlineMemberListInfo = {},
  _friendOnlineMemberListInfo = {},
  _texture_Icon = {
    ["path"] = "Renewal/UI_Icon/Console_ClassSymbol.dds",
    [0] = {
      x1 = 1,
      x2 = 172,
      y1 = 57,
      y2 = 228
    },
    [4] = {
      x1 = 58,
      x2 = 172,
      y1 = 114,
      y2 = 228
    },
    [8] = {
      x1 = 115,
      x2 = 172,
      y1 = 171,
      y2 = 228
    },
    [11] = {
      x1 = 0,
      x2 = 0,
      y1 = 0,
      y2 = 0
    },
    [12] = {
      x1 = 172,
      x2 = 172,
      y1 = 228,
      y2 = 228
    },
    [16] = {
      x1 = 229,
      x2 = 172,
      y1 = 285,
      y2 = 228
    },
    [19] = {
      x1 = 286,
      x2 = 229,
      y1 = 342,
      y2 = 285
    },
    [20] = {
      x1 = 286,
      x2 = 172,
      y1 = 342,
      y2 = 228
    },
    [21] = {
      x1 = 400,
      x2 = 172,
      y1 = 456,
      y2 = 228
    },
    [23] = {
      x1 = 343,
      x2 = 229,
      y1 = 399,
      y2 = 285
    },
    [24] = {
      x1 = 343,
      x2 = 172,
      y1 = 399,
      y2 = 228
    },
    [25] = {
      x1 = 115,
      x2 = 229,
      y1 = 171,
      y2 = 285
    },
    [26] = {
      x1 = 172,
      x2 = 229,
      y1 = 228,
      y2 = 285
    },
    [27] = {
      x1 = 229,
      x2 = 229,
      y1 = 285,
      y2 = 285
    },
    [28] = {
      x1 = 1,
      x2 = 229,
      y1 = 57,
      y2 = 285
    },
    [29] = {
      x1 = 1,
      x2 = 286,
      y1 = 57,
      y2 = 342
    },
    [31] = {
      x1 = 58,
      x2 = 229,
      y1 = 114,
      y2 = 285
    }
  }
}
function Panel_Window_PartyInvite_info:registEventHandler()
  Panel_Window_PartyInvite:registerPadEvent(__eConsoleUIPadEvent_LT, "PaGlobalFunc_PartyInvite_SelectTab(-1)")
  Panel_Window_PartyInvite:registerPadEvent(__eConsoleUIPadEvent_RT, "PaGlobalFunc_PartyInvite_SelectTab(1)")
end
function Panel_Window_PartyInvite_info:registerMessageHandler()
  registerEvent("onScreenResize", "FromClient_PartyInvite_Resize")
  registerEvent("ResponseParty_invite", "FromClient_PartyInvite_Update")
  registerEvent("ResponseParty_updatePartyList", "FromClient_PartyInvite_Update")
  registerEvent("ResponseParty_refuse", "FromClient_PartyInvite_Update")
  registerEvent("ResponseParty_changeLeader", "FromClient_PartyInvite_Update")
  registerEvent("ResponseParty_withdraw", "FromClient_PartyInvite_Update")
end
function Panel_Window_PartyInvite_info:initialize()
  self:childControl()
  self:initValue()
  self:resize()
  self:registerMessageHandler()
  self:registEventHandler()
end
function Panel_Window_PartyInvite_info:initValue()
  self._value.currentIndex = nil
  self._value.currentTabIndex = nil
end
function Panel_Window_PartyInvite_info:resize()
end
function Panel_Window_PartyInvite_info:childControl()
  self._ui.static_TabBg = UI.getChildControl(Panel_Window_PartyInvite, "Static_TabBg")
  self._ui.radioButton_Guild = UI.getChildControl(self._ui.static_TabBg, "RadioButton_Guild")
  self._ui.radioButton_Friend = UI.getChildControl(self._ui.static_TabBg, "RadioButton_Friend")
  self._ui.tabRadionButton[self._enum.eTAB_GUILD] = self._ui.radioButton_Guild
  self._ui.tabRadionButton[self._enum.eTAB_FRIEND] = self._ui.radioButton_Friend
  self._ui.list2_Worker = UI.getChildControl(Panel_Window_PartyInvite, "List2_Worker")
  self._ui.list2_Worker:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_PartyInvite_ListSetting")
  self._ui.list2_Worker:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
end
function Panel_Window_PartyInvite_info:clearTab()
  for key, value in pairs(self._ui.tabRadionButton) do
    value:SetFontColor(self._color.unSelected)
  end
end
function Panel_Window_PartyInvite_info:setTab()
  self:clearTab()
  if nil ~= self._ui.tabRadionButton[self._value.currentTabIndex] then
    self._ui.tabRadionButton[self._value.currentTabIndex]:SetFontColor(self._color.selected)
  end
end
function Panel_Window_PartyInvite_info:setList()
  if self._value.currentTabIndex == self._enum.eTAB_GUILD then
    self:setGuildList()
  elseif self._value.currentTabIndex == self._enum.eTAB_FRIEND then
    self:setFriendList()
  end
end
function Panel_Window_PartyInvite_info:setGuildList()
  self._ui.list2_Worker:getElementManager():clearKey()
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == myGuildListInfo then
    return
  end
  local onlineIndex = 0
  local memberCount = myGuildListInfo:getMemberCount()
  for index = 0, memberCount - 1 do
    local myGuildMemberInfo = myGuildListInfo:getMember(index)
    if nil ~= myGuildMemberInfo then
      local online = myGuildMemberInfo:isOnline()
      local userNo = myGuildMemberInfo:getUserNo()
      local userName = myGuildMemberInfo:getCharacterName()
      local myNo = getSelfPlayer():get():getUserNo()
      if true == online and userNo ~= myNo and false == PaGlobalFunc_Party_CheckInParty(userName) then
        local memberInfo = {
          index = onlineIndex,
          level = myGuildMemberInfo:getLevel(),
          class = myGuildMemberInfo:getClassType(),
          name = userName,
          userNo = userNo
        }
        self._guildOnlineMemberListInfo[onlineIndex] = memberInfo
        onlineIndex = onlineIndex + 1
      end
    end
  end
  for index = 0, onlineIndex - 1 do
    self._ui.list2_Worker:getElementManager():pushKey(toInt64(0, index))
    self._ui.list2_Worker:requestUpdateByKey(toInt64(0, index))
  end
end
function Panel_Window_PartyInvite_info:setFriendList()
  self._ui.list2_Worker:getElementManager():clearKey()
  local pcFriendGroup = RequestFriends_getFriendGroupAt(0)
  if nil == pcFriendGroup then
    return
  end
  local onlineIndex = 0
  local friendCount = pcFriendGroup:getFriendCount()
  for friendIndex = 0, friendCount - 1 do
    local friendInfo = pcFriendGroup:getFriendAt(friendIndex)
    if nil ~= friendInfo then
      local isLogin = friendInfo:isOnline()
      local userNo = friendInfo:getUserNo()
      local userName = friendInfo:getCharacterName()
      if true == isLogin and false == PaGlobalFunc_Party_CheckInParty(userName) then
        local memberInfo = {
          index = onlineIndex,
          level = friendInfo:getLevel(),
          class = nil,
          name = userName,
          userNo = userNo
        }
        self._friendOnlineMemberListInfo[onlineIndex] = memberInfo
        onlineIndex = onlineIndex + 1
      end
    end
  end
  for index = 0, onlineIndex - 1 do
    self._ui.list2_Worker:getElementManager():pushKey(toInt64(0, index))
    self._ui.list2_Worker:requestUpdateByKey(toInt64(0, index))
  end
end
function Panel_Window_PartyInvite_info:setContent()
  self:setTab()
  self:setList()
end
function Panel_Window_PartyInvite_info:setIcon(control, classType)
  control:ChangeTextureInfoName(self._texture_Icon.path)
  local x1, y1, x2, y2 = setTextureUV_Func(control, self._texture_Icon[classType].x1, self._texture_Icon[classType].x2, self._texture_Icon[classType].y1, self._texture_Icon[classType].y2)
  control:getBaseTexture():setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end
function Panel_Window_PartyInvite_info:open()
  Panel_Window_PartyInvite:SetShow(true)
end
function Panel_Window_PartyInvite_info:close()
  Panel_Window_PartyInvite:SetShow(false)
end
function PaGlobalFunc_PartyInvite_GetShow()
  return Panel_Window_PartyInvite:GetShow()
end
function PaGlobalFunc_PartyInvite_Open()
  local self = Panel_Window_PartyInvite_info
  self:open()
end
function PaGlobalFunc_PartyInvite_Close()
  local self = Panel_Window_PartyInvite_info
  self:close()
end
function PaGlobalFunc_PartyInvite_Show()
  local self = Panel_Window_PartyInvite_info
  self._value.currentTabIndex = self._enum.eTAB_GUILD
  self:setContent()
  self:open()
end
function PaGlobalFunc_PartyInvite_Exit()
  local self = Panel_Window_PartyInvite_info
  self:close()
end
function PaGlobalFunc_PartyInvite_SelectTab(value)
  local self = Panel_Window_PartyInvite_info
  self._value.currentTabIndex = (self._value.currentTabIndex + value + self._enum.eTAB_COUNT) % self._enum.eTAB_COUNT
  self:setContent()
end
function PaGlobalFunc_PartyInvite_ListSetting(list_content, key)
  local self = Panel_Window_PartyInvite_info
  local id = Int64toInt32(key)
  local button_CharaterName = UI.getChildControl(list_content, "Button_Charater")
  local static_ClassIcon = UI.getChildControl(list_content, "Static_ClassIcon")
  local staticText_Level = UI.getChildControl(list_content, "StaticText_Level")
  if self._value.currentTabIndex == self._enum.eTAB_GUILD then
    local guildMemberData = self._guildOnlineMemberListInfo[id]
    button_CharaterName:SetText(guildMemberData.name)
    static_ClassIcon:SetShow(true)
    self:setIcon(static_ClassIcon, guildMemberData.class)
    staticText_Level:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. guildMemberData.level)
    button_CharaterName:addInputEvent("Mouse_LUp", "PaGlobalFunc_PartyInvite_ClickInvite(" .. id .. ")")
  elseif self._value.currentTabIndex == self._enum.eTAB_FRIEND then
    local friendMemberData = self._friendOnlineMemberListInfo[id]
    button_CharaterName:SetText(friendMemberData.name)
    static_ClassIcon:SetShow(false)
    staticText_Level:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. friendMemberData.level)
    button_CharaterName:addInputEvent("Mouse_LUp", "PaGlobalFunc_PartyInvite_ClickInvite(" .. id .. ")")
  end
end
function PaGlobalFunc_PartyInvite_ClickInvite(index)
  local self = Panel_Window_PartyInvite_info
  if self._value.currentTabIndex == self._enum.eTAB_GUILD then
    local name = self._guildOnlineMemberListInfo[index].name
    RequestParty_inviteCharacter(name)
  elseif self._value.currentTabIndex == self._enum.eTAB_FRIEND then
    local name = self._friendOnlineMemberListInfo[index].name
    RequestParty_inviteCharacter(name)
  end
end
function FromClient_PartyInvite_Init()
  local self = Panel_Window_PartyInvite_info
  self:initialize()
end
function FromClient_PartyInvite_Resize()
  local self = Panel_Window_PartyInvite_info
  self:resize()
end
function FromClient_PartyInvite_Update()
  local self = Panel_Window_PartyInvite_info
  if true == PaGlobalFunc_PartyInvite_GetShow() then
    self:setContent()
  end
end
registerEvent("FromClient_luaLoadComplete", "FromClient_PartyInvite_Init")
