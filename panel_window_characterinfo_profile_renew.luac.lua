-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\panel_window_characterinfo_profile_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_CharacterInfo_Profile_Renew
local _mainPanel = Panel_Window_CharacterInfo_Renew
local CharacterProfileInfo = {
_ui = {}
, defaultFrameBG_CharacterInfo_Profile = nil}
CharacterProfileInfo.init = function(self)
  -- function num : 0_0
end

FromClient_luaLoadComplete_Panel_Window_Character_ProfileInfo = function()
  -- function num : 0_1 , upvalues : CharacterProfileInfo, _mainPanel, _panel
  local self = CharacterProfileInfo
  _PA_LOG("원선", "발자취UI")
  self:init()
  self.defaultFrameBG_CharacterInfo_Profile = (UI.getChildControl)(_mainPanel, "Static_ProfileInfoBg")
  ;
  (self.defaultFrameBG_CharacterInfo_Profile):SetShow(false)
  ;
  (self.defaultFrameBG_CharacterInfo_Profile):MoveChilds((self.defaultFrameBG_CharacterInfo_Profile):GetID(), _panel)
  deletePanel(_panel:GetID())
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_Character_ProfileInfo")

