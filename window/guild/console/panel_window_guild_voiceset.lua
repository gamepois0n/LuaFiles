local _panel = Panel_Window_Guild_VoiceSet
_panel:ignorePadSnapMoveToOtherPanel()
local GuildVoiceSet = {
  _ui = {
    txt_Title = UI.getChildControl(_panel, "StaticText_Title"),
    stc_CenterBg = UI.getChildControl(_panel, "Static_CenterBg")
  },
  _currentMember = nil
}
function GuildVoiceSet:init()
  self._ui.check_Mic = UI.getChildControl(self._ui.stc_CenterBg, "CheckButton_Mic")
  self._ui.check_Hearing = UI.getChildControl(self._ui.stc_CenterBg, "CheckButton_Hearing")
  PaGlobal_registerPanelOnBlackBackground(_panel)
  self:registEventHandler()
end
function GuildVoiceSet:open()
  self._currentMember = PaGlobalFunc_GuildMemberFunction_GetMemberInfo()
  if nil == self._currentMember then
    _PA_ASSERT(false, "GuildVoiceSet \236\157\152 _currentMember \234\176\128 nil \236\158\133\235\139\136\235\139\164!!")
    return
  end
  self:update()
  _panel:SetShow(true)
end
function GuildVoiceSet:update()
  self._ui.check_Mic:SetCheck(false)
  self._ui.check_Hearing:SetCheck(false)
  local isSaying = self._currentMember:isVoiceChatSpeak()
  local isListening = self._currentMember:isVoiceChatListen()
  self._ui.check_Mic:SetCheck(isSaying)
  self._ui.check_Hearing:SetCheck(isListening)
end
function GuildVoiceSet:close()
  _panel:SetShow(false)
end
function GuildVoiceSet:registEventHandler()
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_GuildVoiceSet_Confirm()")
end
function PaGlobalFunc_GuildVoiceSet_Open()
  local self = GuildVoiceSet
  self:open()
end
function PaGlobalFunc_GuildVoiceSet_Close()
  local self = GuildVoiceSet
  self:close()
end
function PaGlobalFunc_GuildVoiceSet_Confirm()
  local self = GuildVoiceSet
  local isSaying = self._ui.check_Mic:IsCheck()
  local isHearing = self._ui.check_Hearing:IsCheck()
  local guildListIdx = PaGlobalFunc_GuildMemberFunction_GetMemberSortIndex()
  ToClient_VoiceChatChangeState(CppEnums.VoiceChatType.eVoiceChatType_Guild, self._currentMember:getUserNo(), isSaying, isHearing, true)
  PaGlobalFunc_GuildMemberList_MemberVoiceUpdate(guildListIdx, isSaying, isHearing)
  self:close()
end
function PaGlobalFunc_GuildVoiceSet_Init()
  local self = GuildVoiceSet
  self:init()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_GuildVoiceSet_Init")
