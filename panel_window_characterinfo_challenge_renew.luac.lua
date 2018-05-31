-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\panel_window_characterinfo_challenge_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_CharacterInfo_Challenge_Renew
local _mainPanel = Panel_Window_CharacterInfo_Renew
local CharacterChallengeInfo = {
_ui = {}
, defaultFrameBG_CharacterInfo_Challenge = nil}
CharacterChallengeInfo.init = function(self)
  -- function num : 0_0
end

FromClient_luaLoadComplete_Panel_Window_Character_ChallengeInfo = function()
  -- function num : 0_1 , upvalues : CharacterChallengeInfo, _mainPanel, _panel
  local self = CharacterChallengeInfo
  _PA_LOG("원선", "도전과제UI")
  self:init()
  self.defaultFrameBG_CharacterInfo_Challenge = (UI.getChildControl)(_mainPanel, "Static_ChallengeInfoBg")
  ;
  (self.defaultFrameBG_CharacterInfo_Challenge):SetShow(false)
  ;
  (self.defaultFrameBG_CharacterInfo_Challenge):MoveChilds((self.defaultFrameBG_CharacterInfo_Challenge):GetID(), _panel)
  deletePanel(_panel:GetID())
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_Character_ChallengeInfo")

