-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_alliance.luac 

-- params : ...
-- function num : 0
Panel_Guild_Ally:SetShow(false)
local Panel_GuildAlly_InfoBg = (UI.getChildControl)(Panel_Guild_Ally, "Static_InfoBg")
PaGlobal_GuildAlliance = {
_ui = {_guildAllianceName = (UI.getChildControl)(Panel_GuildAlly_InfoBg, "StaticText_AllyNameValue"), _chairName = (UI.getChildControl)(Panel_GuildAlly_InfoBg, "StaticText_AllyLeaderValue"), _memberCount = (UI.getChildControl)(Panel_GuildAlly_InfoBg, "StaticText_MemberCountValue"), 
_guildList = {}
, _allianceMark = (UI.getChildControl)(Panel_GuildAlly_InfoBg, "Static_Ally_Icon"), _btnOpenOption = (UI.getChildControl)(Panel_GuildAlly_InfoBg, "Button_Change"), _allianceNotice = (UI.getChildControl)(Panel_Guild_Ally, "MultilineEdit_Notice"), _btnInitNotice = (UI.getChildControl)(Panel_Guild_Ally, "Button_Reset"), _btnSetNotice = (UI.getChildControl)(Panel_Guild_Ally, "Button_Notice"), _btnClose = (UI.getChildControl)(Panel_Guild_Ally, "Button_Close")}
, 
_optionUi = {_btnCancel = (UI.getChildControl)(Panel_Guild_AllyOption, "Button_Cancel"), _btnApply = (UI.getChildControl)(Panel_Guild_AllyOption, "Button_Admin")}
}
-- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.Initialize = function(self)
  -- function num : 0_0 , upvalues : Panel_GuildAlly_InfoBg
  for index = 0, 3 do
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui)._guildList)[index] = (UI.getChildControl)(Panel_GuildAlly_InfoBg, "StaticText_AllyGuild_" .. tostring(index))
    ;
    (((self._ui)._guildList)[index]):SetShow(false)
  end
  ;
  ((self._ui)._allianceNotice):SetMaxEditLine(10)
  ;
  ((self._ui)._allianceNotice):SetMaxInput(200)
  ;
  ((self._ui)._allianceNotice):addInputEvent("Mouse_LUp", "HandleClicked_AllianceNoticeEditSetFocus()")
  ;
  ((self._ui)._btnClose):addInputEvent("Mouse_LUp", "PaGlobal_GuildAlliance:close()")
  ;
  ((self._ui)._btnInitNotice):addInputEvent("Mouse_LUp", "PaGlobal_GuildAlliance:initNotice()")
  ;
  ((self._ui)._btnSetNotice):addInputEvent("Mouse_LUp", "PaGlobal_GuildAlliance:setNotice()")
  ;
  ((self._ui)._btnOpenOption):addInputEvent("Mouse_LUp", "PaGlobal_GuildAlliance:openOption()")
  ;
  ((self._ui)._allianceMark):addInputEvent("Mouse_LUp", "PaGlobal_GuildAlliance:changeMark()")
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.initOption = function(self)
  -- function num : 0_1
  ((self._optionUi)._btnCancel):addInputEvent("Mouse_LUp", "PaGlobal_GuildAlliance:closeOption()")
  ;
  ((self._optionUi)._btnApply):addInputEvent("Mouse_LUp", "PaGlobal_GuildAlliance:applyOption()")
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.UpdateGuildAllianceInfo = function(self)
  -- function num : 0_2
  local guildAlliance = ToClient_GetMyGuildAllianceWrapper()
  if guildAlliance == nil then
    return 
  end
  local allianceNo = guildAlliance:guildAllianceNo_s64()
  local allianceName = guildAlliance:getRepresentativeName()
  local chairName = guildAlliance:getGuildAllianceChairName()
  local memberCount = guildAlliance:getMemberCount()
  local memberUserCount = guildAlliance:getUserCount()
  local notice = guildAlliance:getNotice()
  local isSet = setGuildTextureByAllianceNo(allianceNo, (self._ui)._allianceMark)
  if isSet == false then
    ((self._ui)._allianceMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
    local x1, y1, x2, y2 = setTextureUV_Func((self._ui)._allianceMark, 183, 1, 188, 6)
    ;
    (((self._ui)._allianceMark):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    ((self._ui)._allianceMark):setRenderTexture(((self._ui)._allianceMark):getBaseTexture())
  else
    do
      ;
      (((self._ui)._allianceMark):getBaseTexture()):setUV(0, 0, 1, 1)
      ;
      ((self._ui)._allianceMark):setRenderTexture(((self._ui)._allianceMark):getBaseTexture())
      ;
      ((self._ui)._guildAllianceName):SetText(allianceName)
      ;
      ((self._ui)._chairName):SetText(chairName)
      ;
      ((self._ui)._memberCount):SetText(tostring(memberUserCount) .. " / 100")
      for index = 0, memberCount - 1 do
        local member = guildAlliance:getMemberGuild(index)
        if member ~= nil then
          (((self._ui)._guildList)[index]):SetText(member:getName())
          ;
          (((self._ui)._guildList)[index]):SetShow(true)
        end
      end
      ;
      ((self._ui)._allianceNotice):SetEnable(true)
      ;
      ((self._ui)._allianceNotice):SetEditText(notice, false)
    end
  end
end

FGlobal_GuildAllianceInfoOpen = function()
  -- function num : 0_3
  local self = PaGlobal_GuildAlliance
  self:open()
end

FGlobal_GuildAllianceInfoInit = function()
  -- function num : 0_4
  local self = PaGlobal_GuildAlliance
  self:Initialize()
  self:initOption()
end

HandleClicked_AllianceNoticeEditSetFocus = function()
  -- function num : 0_5
  local self = PaGlobal_GuildAlliance
  SetFocusEdit((self._ui)._allianceNotice)
  ;
  ((self._ui)._allianceNotice):SetEditText(((self._ui)._allianceNotice):GetEditText(), true)
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.open = function(self)
  -- function num : 0_6
  if not self:checkContentsGroup() then
    return 
  end
  self:UpdateGuildAllianceInfo()
  Panel_Guild_Ally:SetShow(true)
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.close = function(self)
  -- function num : 0_7
  Panel_Guild_Ally:SetShow(false)
  self:closeOption()
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.openOption = function(self)
  -- function num : 0_8
  if not self:checkContentsGroup() then
    return 
  end
  Panel_Guild_AllyOption:SetShow(true)
end

-- DECOMPILER ERROR at PC110: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.closeOption = function(self)
  -- function num : 0_9
  Panel_Guild_AllyOption:SetShow(false)
end

-- DECOMPILER ERROR at PC113: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.applyOption = function(self)
  -- function num : 0_10
end

-- DECOMPILER ERROR at PC116: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.changeMark = function(self)
  -- function num : 0_11
  messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ADDMARK_MESSAGEBOX_TITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_ADDMARK_MESSAGEBOX_TEXT"), functionYes = PaGlobal_GuildAlliance.changeMarkContinue, functionNo = MessageBox_Empty_function, priority = (CppEnums.PA_UI_CONTROL_TYPE).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
end

-- DECOMPILER ERROR at PC119: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.changeMarkContinue = function(self)
  -- function num : 0_12
  guildMarkUpdate(true)
end

FGlobal_GuildAllianceOnMarkChanged = function()
  -- function num : 0_13
  local self = PaGlobal_GuildAlliance
  if self:isShowing() then
    self:UpdateGuildAllianceInfo()
  end
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.checkContentsGroup = function(self)
  -- function num : 0_14
  return _ContentsGroup_guildAlliance
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.initNotice = function(self)
  -- function num : 0_15
  ClearFocusEdit()
  ToClient_SetGuildAllianceNotice(tostring(" "))
end

-- DECOMPILER ERROR at PC130: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.setNotice = function(self)
  -- function num : 0_16
  ClearFocusEdit()
  ToClient_SetGuildAllianceNotice(tostring(((self._ui)._allianceNotice):GetEditText()))
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.updateLimitMemberCount = function(self)
  -- function num : 0_17
  _PA_LOG("cylee", "GuildAlliance:updateLimitMemberCount()")
end

-- DECOMPILER ERROR at PC136: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.updateTaxConst = function(self)
  -- function num : 0_18
  _PA_LOG("cylee", "GuildAlliance:updateTaxConst()")
end

-- DECOMPILER ERROR at PC139: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_GuildAlliance.isShowing = function(self)
  -- function num : 0_19
  return Panel_Guild_Ally:GetShow()
end

FGlobal_OnGuildAllianceUpdate = function()
  -- function num : 0_20
  _PA_LOG("cylee", "FGlobal_OnGuildAllianceUpdate() - FromClient_GuildAllianceUpdate")
  local self = PaGlobal_GuildAlliance
  if self:isShowing() then
    self:UpdateGuildAllianceInfo()
  end
end

registerEvent("FromClient_luaLoadComplete", "FGlobal_GuildAllianceInfoInit")
registerEvent("EventChangeGuildInfo", "FGlobal_GuildAllianceOnMarkChanged")
registerEvent("FromClient_GuildAllianceUpdate", "FGlobal_OnGuildAllianceUpdate")

