local _panel = Panel_Window_GuildMark
_panel:ignorePadSnapMoveToOtherPanel()
local GuildMark = {
  _ui = {
    stc_CenterBg = UI.getChildControl(_panel, "Static_CenterBg"),
    stc_BottomBg = UI.getChildControl(_panel, "Static_BottomBg")
  },
  _markBgTable = {},
  _markIconTable = {},
  _maxMarkBg = 9,
  _maxMarkIcon = 9
}
function GuildMark:init()
  self._ui.stc_CurrentBg = UI.getChildControl(self._ui.stc_CenterBg, "Static_CurrentBg")
  self._ui.stc_CurrentIcon = UI.getChildControl(self._ui.stc_CenterBg, "Static_CurrentIcon")
  self._ui.txt_GuildName = UI.getChildControl(self._ui.stc_CenterBg, "StaticText_GuildName")
  self._ui.stc_BackGround = UI.getChildControl(self._ui.stc_CenterBg, "Static_BackgroundBg")
  self._ui.stc_BgFocus = UI.getChildControl(self._ui.stc_BackGround, "Static_FocusBg")
  for bgIdx = 1, self._maxMarkBg do
    self._markBgTable[bgIdx] = UI.getChildControl(self._ui.stc_BackGround, "Static_Bg" .. tostring(bgIdx))
    self._markBgTable[bgIdx]:addInputEvent("Mouse_LUp", "InputMLUp_GuildMark_SelectMarkBackground(" .. bgIdx .. ")")
  end
  self._ui.stc_Icon = UI.getChildControl(self._ui.stc_CenterBg, "Static_IconBg")
  self._ui.stc_IconFocus = UI.getChildControl(self._ui.stc_Icon, "Static_FocusBg")
  for iconIdx = 1, self._maxMarkIcon do
    self._markIconTable[iconIdx] = UI.getChildControl(self._ui.stc_Icon, "Static_Bg" .. tostring(iconIdx))
    self._markIconTable[iconIdx]:addInputEvent("Mouse_LUp", "InputMLUp_GuildMark_SelectMarkIcon(" .. iconIdx .. ")")
  end
  self._ui.txt_BConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "StaticText_B_ConsoleUI")
  self._ui.txt_YConsoleUI = UI.getChildControl(self._ui.stc_BottomBg, "StaticText_Y_ConsoleUI")
  self:registEvent()
end
function GuildMark:registEvent()
  PaGlobal_registerPanelOnBlackBackground(_panel)
  self._ui.txt_YConsoleUI:addInputEvent("Mouse_LUp", "InputMLUp_GuildMark_Confirm()")
  self._ui.txt_BConsoleUI:addInputEvent("Mouse_LUp", "InputMLUp_GuildMark_Close()")
  self._ui.txt_YConsoleUI:SetIgnore(false)
  self._ui.txt_BConsoleUI:SetIgnore(false)
end
function GuildMark:open()
  self:update()
  _panel:SetShow(true)
end
function GuildMark:update()
end
function GuildMark:close()
  _panel:SetShow(false)
end
function PaGlobalFunc_GuildMark_Open()
  local self = GuildMark
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMark")
    return
  end
  self:open()
end
function PaGlobalFunc_GuildMark_Init()
  local self = GuildMark
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMark")
    return
  end
  self:init()
end
function InputMLUp_GuildMark_Close()
  local self = GuildMark
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMark")
    return
  end
  self:close()
end
function InputMLUp_GuildMark_Confirm()
  local self = GuildMark
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMark")
    return
  end
  self:close()
end
function InputMLUp_GuildMark_SelectMarkBackground(idx)
  local self = GuildMark
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMark")
    return
  end
  local Xpos = self._markBgTable[idx]:GetPosX() - 5
  local Ypos = self._markBgTable[idx]:GetPosY() - 5
  self._ui.stc_BgFocus:SetPosXY(Xpos, Ypos)
end
function InputMLUp_GuildMark_SelectMarkIcon(idx)
  local self = GuildMark
  if nil == self then
    _PA_ASSERT(false, "\237\140\168\235\132\144\236\157\180 \236\161\180\236\158\172\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164!! : GuildMark")
    return
  end
  local Xpos = self._markIconTable[idx]:GetPosX() - 5
  local Ypos = self._markIconTable[idx]:GetPosY() - 5
  self._ui.stc_IconFocus:SetPosXY(Xpos, Ypos)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_GuildMark_Init")
