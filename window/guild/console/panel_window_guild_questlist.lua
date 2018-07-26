local _parent = Panel_Window_Guild_Renew
local _panel = Panel_Window_Guild_QuestList
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PP = CppEnums.PAUIMB_PRIORITY
local _disableColor = Defines.Color.C_FF525B6D
local _enableColor = Defines.Color.C_FFEEEEEE
local GuildQuestList = {
  _ui = {
    stc_TopArea = UI.getChildControl(_panel, "Static_TopArea"),
    stc_RadioBtnBg = UI.getChildControl(_panel, "Static_RadioButtonBg"),
    list_QestList = UI.getChildControl(_panel, "List2_QuestList")
  },
  _tabType = {
    preOcc = 0,
    wide = 1,
    preOccInfo = 2,
    dataCount = 3
  },
  _btnCtrl = {},
  _parentBg = nil,
  _currentQuestIdx = nil,
  _currentQuestTab = 0,
  _isShowingPreOccInfo = false
}
function GuildQuestList:init()
  self._ui.btn_ProgressQuestSlot = UI.getChildControl(self._ui.stc_TopArea, "Button_QuestSlot")
  self._ui.stc_ProgressQuestIcon = UI.getChildControl(self._ui.stc_TopArea, "Static_QuestIcon")
  self._ui.txt_ProgressQuestName = UI.getChildControl(self._ui.stc_TopArea, "StaticText_QuestName")
  self._ui.txt_ProgressCondition = UI.getChildControl(self._ui.stc_TopArea, "StaticText_Condition")
  self._ui.txt_ProgressTime = UI.getChildControl(self._ui.stc_TopArea, "StaticText_Time")
  self._ui.txt_NotProcess = UI.getChildControl(self._ui.stc_TopArea, "StaticText_NotProcess")
  self._ui.txt_OtherServerDesc1 = UI.getChildControl(self._ui.stc_TopArea, "StaticText_Desc1")
  self._ui.txt_OtherServerDesc2 = UI.getChildControl(self._ui.stc_TopArea, "StaticText_Desc2")
  self._btnCtrl[self._tabType.preOcc] = UI.getChildControl(self._ui.stc_RadioBtnBg, "RadioButton_Occupancy")
  self._btnCtrl[self._tabType.wide] = UI.getChildControl(self._ui.stc_RadioBtnBg, "RadioButton_General")
  self._btnCtrl[self._tabType.preOccInfo] = UI.getChildControl(self._ui.stc_RadioBtnBg, "RadioButton_Current")
  self:registEvent()
end
function GuildQuestList:open()
  InputMLUp_GuildQuestList_OpenQuestTab(self._tabType.preOcc)
  self:updateProgressQuest()
end
function GuildQuestList:updateQuestList()
  local guildQuestListCount = ToClient_RequestGuildQuestCount()
  self._ui.list_QestList:getElementManager():clearKey()
  for index = 0, guildQuestListCount - 1 do
    self._ui.list_QestList:getElementManager():pushKey(toInt64(0, index))
  end
end
function GuildQuestList:updateProgressQuest()
  local guildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == guildInfo then
    return
  end
  self._ui.btn_ProgressQuestSlot:SetShow(false)
  self._ui.stc_ProgressQuestIcon:SetShow(false)
  self._ui.txt_ProgressQuestName:SetShow(false)
  self._ui.txt_ProgressCondition:SetShow(false)
  self._ui.txt_ProgressTime:SetShow(false)
  self._ui.txt_NotProcess:SetShow(false)
  self._ui.txt_OtherServerDesc1:SetShow(false)
  self._ui.txt_OtherServerDesc2:SetShow(false)
  local isProgressing = ToClient_isProgressingGuildQuest()
  if true == isProgressing then
    local currentGuildQuestName = ToClient_getCurrentGuildQuestName()
    local requireGuildRank = ToClient_getCurrentGuildQuestGrade()
    local requireGuildRankStr = ""
    if 1 == requireGuildRank then
      requireGuildRankStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_SMALL")
    elseif 2 == requireGuildRank then
      requireGuildRankStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_MIDDLE")
    elseif 3 == requireGuildRank then
      requireGuildRankStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIG")
    elseif 4 == requireGuildRank then
      requireGuildRankStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIGGEST")
    end
    self._ui.txt_ProgressQuestName:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_LIMIT", "currentGuildQuestName", currentGuildQuestName, "requireGuildRankStr", requireGuildRankStr))
    local remainTime = ToClient_getCurrentGuildQuestRemainedTime()
    local strMinute = math.floor(remainTime / 60)
    if remainTime <= 0 then
      self._ui.txt_ProgressTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_TIMEOUT"))
    else
      self._ui.txt_ProgressTime:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_REMAINTIME", "time_minute", strMinute))
    end
    if true == ToClient_isSatisfyCurrentGuildQuest() then
      self._ui.txt_ProgressTime:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_ACQUIRE_COMPLATE"))
    end
    local conditionStr = ""
    local questConditionCount = ToClient_getCurrentGuildQuestConditionCount()
    for idx = 0, questConditionCount - 1 do
      local currentGuildQuestInfo = ToClient_getCurrentGuildQuestConditionAt(idx)
      conditionStr = conditionStr .. currentGuildQuestInfo._desc .. " ( " .. currentGuildQuestInfo._currentCount .. " / " .. currentGuildQuestInfo._destCount .. " ) " .. "\n"
    end
    self._ui.txt_ProgressCondition:SetText(conditionStr)
    self._ui.btn_ProgressQuestSlot:addInputEvent("Mouse_LUp", "InputMLUp_GuildQuestList_ShowCurrentProgressingQuestInfo()")
    self._ui.btn_ProgressQuestSlot:SetShow(true)
    self._ui.stc_ProgressQuestIcon:SetShow(true)
    self._ui.txt_ProgressQuestName:SetShow(true)
    self._ui.txt_ProgressCondition:SetShow(true)
    self._ui.txt_ProgressTime:SetShow(true)
  else
    local temporaryWrapper = getTemporaryInformationWrapper()
    local worldNo = temporaryWrapper:getSelectedWorldServerNo()
    local channelName = getChannelName(worldNo, ToClient_getCurrentGuildQuestServerNo())
    if true == ToClient_isGuildQuestOtherServer() then
      if nil == channelName then
        self._ui.txt_OtherServerDesc1:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_PROGRESSNOQUEST_ANOTHER"))
        self._ui.txt_OtherServerDesc1:SetShow(true)
        self._ui.txt_OtherServerDesc2:SetShow(false)
      else
        self._ui.txt_OtherServerDesc2:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_PROGRESSNOQUEST_ANOTHERCHANNEL", "channel", channelName))
        self._ui.txt_OtherServerDesc1:SetShow(false)
        self._ui.txt_OtherServerDesc2:SetShow(true)
      end
    else
      self._ui.txt_NotProcess:SetShow(true)
    end
  end
end
function GuildQuestList:registEvent()
  self._ui.list_QestList:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_GuildQuestList_CreateQuest")
  self._ui.list_QestList:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._btnCtrl[self._tabType.preOcc]:addInputEvent("Mouse_LUp", "InputMLUp_GuildQuestList_OpenQuestTab(" .. self._tabType.preOcc .. ")")
  self._btnCtrl[self._tabType.wide]:addInputEvent("Mouse_LUp", "InputMLUp_GuildQuestList_OpenQuestTab(" .. self._tabType.wide .. ")")
  self._btnCtrl[self._tabType.preOccInfo]:addInputEvent("Mouse_LUp", "InputMLUp_GuildQuestList_OpenQuestTab(" .. self._tabType.preOccInfo .. ")")
  _parent:registerPadEvent(__eConsoleUIPadEvent_LT, "InputMLUp_GuildQuestList_OpenQuestTabToLeft()")
  _parent:registerPadEvent(__eConsoleUIPadEvent_RT, "InputMLUp_GuildQuestList_OpenQuestTabToRight()")
  registerEvent("ResponseGuildQuestList", "FromClient_GuildQuestList_UpdateQuestList")
  registerEvent("ResponseUpdateGuildQuest", "FromClient_GuildQuestList_UpdateQuestList")
  registerEvent("ResponseAcceptGuildQuest", "PaGlobalFunc_GuildQuestList_ResponseQuest")
  registerEvent("ResponseUpdateGiveupGuildQuest", "PaGlobalFunc_GuildQuestList_ResponseQuest")
  registerEvent("ResponseCompleteGuildQuest", "PaGlobalFunc_GuildQuestList_ResponseQuest")
  registerEvent("FromClient_ResponseOtherGuildQuestList", "FromClient_GuildQuestList_UpdateOtherGuildQuestList")
  registerEvent("updateGuildInfo", "FromClient_GuildQuestList_UpdateOtherGuildQuestList")
end
function PaGlobalFunc_GuildQuestList_Open()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  self:open()
end
function PaGlobalFunc_GuildQuestList_Init()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  self._parentBg = UI.getChildControl(_parent, "Static_GuildQuestBg")
  self._parentBg:SetShow(false)
  self._parentBg:MoveChilds(self._parentBg:GetID(), _panel)
  UI.deletePanel(_panel:GetID())
  self:init()
end
function PaGlobalFunc_GuildQuestList_CreateQuest(content, key)
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  local questIdx = Int64toInt32(key)
  local questInfo = ToClient_RequestGuildQuestAt(questIdx)
  if nil == questInfo then
    return
  end
  local btn_QuestSlot = UI.getChildControl(content, "Button_QuestSlot")
  local txt_QuestName = UI.getChildControl(content, "StaticText_QuestName")
  local txt_Condition = UI.getChildControl(content, "StaticText_Condition")
  local txt_Time = UI.getChildControl(content, "StaticText_Time")
  local txt_NeedMoney = UI.getChildControl(content, "StaticText_NeedMoney")
  local requireGuildRank = questInfo:getGuildQuestGrade()
  local requireGuildRankStr = ""
  if 1 == requireGuildRank then
    requireGuildRankStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_SMALL")
  elseif 2 == requireGuildRank then
    requireGuildRankStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_MIDDLE")
  elseif 3 == requireGuildRank then
    requireGuildRankStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIG")
  elseif 4 == requireGuildRank then
    requireGuildRankStr = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_BIGGEST")
  end
  txt_QuestName:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_LIMIT", "currentGuildQuestName", questInfo:getTitle(), "requireGuildRankStr", requireGuildRankStr))
  txt_Condition:setLineCountByLimitAutoWrap(3)
  txt_Condition:SetTextMode(CppEnums.TextMode.eTextMode_Limit_AutoWrap)
  txt_Condition:SetText(questInfo:getDesc())
  if false == self._isShowingPreOccInfo then
    local questTime = PaGlobalFunc_GuildQuestList_QuestTime(questInfo:getLimitMinute())
    txt_Time:SetText(questTime)
    txt_Time:SetShow(true)
    local needMoney = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_PREGOLD", "pre_gold", Uint64toUint32(questInfo:getPreGoldCount()))
    txt_NeedMoney:SetText(needMoney)
    txt_NeedMoney:SetShow(true)
    btn_QuestSlot:addInputEvent("Mouse_LUp", "InputMLUp_GuildQuestList_ShowQuestInfo(" .. questIdx .. ")")
  else
    txt_Time:SetShow(false)
    txt_NeedMoney:SetShow(false)
  end
end
function PaGlobalFunc_GuildQuestList_QuestTime(timeValue)
  if timeValue >= 60 then
    timeValue2 = timeValue % 60
    timeValue = timeValue / 60
    if 0 == timeValue2 then
      return string.format("%d ", timeValue) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_HOUR")
    else
      return string.format("%d ", timeValue) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_HOUR") .. string.format(" %d ", timeValue2) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_MINUTE")
    end
  else
    return string.format("%d ", timeValue) .. PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_MINUTE")
  end
end
function PaGlobalFunc_GuildQuestList_GetCurrentQuestIndex()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  return self._currentQuestIdx
end
function PaGlobalFunc_GuildQuestList_GetIsShowingPreOccInfo()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  return self._isShowingPreOccInfo
end
function InputMLUp_GuildQuestList_OpenQuestTab(tabType)
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  for idx = 0, self._tabType.dataCount - 1 do
    if tabType == idx then
      self._btnCtrl[idx]:SetFontColor(Defines.Color.C_FFEEEEEE)
    else
      self._btnCtrl[idx]:SetFontColor(Defines.Color.C_FF888888)
    end
  end
  self._currentQuestTab = tabType
  if tabType == self._tabType.preOcc then
    ToClient_RequestGuildQuestList(true)
  elseif tabType == self._tabType.wide then
    ToClient_RequestGuildQuestList(false)
  elseif tabType == self._tabType.preOccInfo then
    ToClient_RequestOtherGuildQuest()
  end
end
function InputMLUp_GuildQuestList_OpenQuestTabToLeft()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  local currentTab = self._currentQuestTab
  currentTab = currentTab - 1
  currentTab = currentTab % self._tabType.dataCount
  InputMLUp_GuildQuestList_OpenQuestTab(currentTab)
end
function InputMLUp_GuildQuestList_OpenQuestTabToRight()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  local currentTab = self._currentQuestTab
  currentTab = currentTab + 1
  currentTab = currentTab % self._tabType.dataCount
  InputMLUp_GuildQuestList_OpenQuestTab(currentTab)
end
function InputMLUp_GuildQuestList_ShowQuestInfo(questIdx)
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  self._currentQuestIdx = questIdx
  PaGlobalFunc_GuildQuestInfo_Open()
end
function InputMLUp_GuildQuestList_ShowCurrentProgressingQuestInfo()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  PaGlobalFunc_GuildQuestInfo_OpenCurrentProgressingQuest()
end
function InputMLUp_GuildQuestList_AcceptQuest()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  local guildInfo = ToClient_GetMyGuildInfoWrapper()
  if nil == guildInfo then
    _PA_ASSERT(false, "\234\184\184\235\147\156 \236\160\149\235\179\180\234\176\128 \236\152\172\235\176\148\235\165\180\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : InputMLUp_GuildQuestList_AcceptQuest")
    return
  end
  local preGold_s64 = ToClient_RequestGuildQuestAt(self._currentQuestIdx):getPreGoldCount()
  local guildBusinessFunds_s64 = guildInfo:getGuildBusinessFunds_s64()
  if preGold_s64 > guildBusinessFunds_s64 then
    if nil == getInventoryItem(0) then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUESTACCEPTFAIL"))
      return
    end
    local myGold_s64 = getInventoryItem(0):get():getCount_s64()
    if preGold_s64 > myGold_s64 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUESTACCEPTFAIL"))
      return
    else
      local messageboxData = {
        title = "",
        content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_QUESTACCEPT_BYINVENTORY"),
        functionYes = PaGlobalFunc_GuildQuestList_AcceptContinue,
        functionCancel = MessageBox_Empty_function,
        priority = UI_PP.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageboxData)
      return
    end
  end
  local messageboxData = {
    title = "",
    content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TEXT_QUESTACCEPT"),
    functionYes = PaGlobalFunc_GuildQuestList_AcceptContinue,
    functionCancel = MessageBox_Empty_function,
    priority = UI_PP.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobalFunc_GuildQuestList_AcceptContinue()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  if nil ~= Panel_Window_Guild_QuestInfo and true == PaGlobalFunc_GuildQuestInfo_GetShow() then
    PaGlobalFunc_GuildQuestInfo_Close()
  end
  ToClient_RequestGuildQuestAccept(ToClient_RequestGuildQuestAt(self._currentQuestIdx)._questIndex)
end
function InputMLUp_GuildQuestList_GiveupQuest()
  local messageboxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_GIVERUP_MESSAGE_0"),
    content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_QUEST_GIVERUP_MESSAGE_1"),
    functionYes = ToClient_RequestGuildQuestGiveup,
    functionCancel = MessageBox_Empty_function,
    priority = UI_PP.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobalFunc_GuildQuestList_ResponseQuest()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  if nil ~= Panel_Window_Guild_QuestInfo and true == PaGlobalFunc_GuildQuestInfo_GetShow() then
    PaGlobalFunc_GuildQuestInfo_Close()
  end
  InputMLUp_GuildQuestList_OpenQuestTab(self._currentQuestTab)
end
function FromClient_GuildQuestList_UpdateQuestList(actorName, characterName)
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  self._isShowingPreOccInfo = false
  self:updateProgressQuest()
  self:updateQuestList()
end
function FromClient_GuildQuestList_UpdateOtherGuildQuestList()
  local self = GuildQuestList
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildQuestList")
    return
  end
  self._isShowingPreOccInfo = true
  self:updateProgressQuest()
  self:updateQuestList()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_GuildQuestList_Init")
