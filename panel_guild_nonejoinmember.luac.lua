-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_nonejoinmember.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Panel_Guild_NoneJoinMember:SetShow(false)
PaGlobal_Guild_NoneJoinMember = {btn_Close = (UI.getChildControl)(Panel_Guild_NoneJoinMember, "Button_Close"), btn_GuildNPCNavi = (UI.getChildControl)(Panel_Guild_NoneJoinMember, "Button_GuildNPCNavi"), btn_GuidlRank = (UI.getChildControl)(Panel_Guild_NoneJoinMember, "Button_GuildRank"), _frame = (UI.getChildControl)(Panel_Guild_NoneJoinMember, "Frame_GuildDesc")}
-- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_NoneJoinMember._frame_GuildContents = (UI.getChildControl)(PaGlobal_Guild_NoneJoinMember._frame, "Frame_1_Content")
-- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_NoneJoinMember.Initialize = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  local guildDesc = (UI.getChildControl)(PaGlobal_Guild_NoneJoinMember._frame_GuildContents, "StaticText_Desc")
  guildDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  guildDesc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILD_NONEJOINMEMBER_DESC"))
  guildDesc:SetSize(guildDesc:GetSizeX(), guildDesc:GetTextSizeY())
  ;
  (self._frame_GuildContents):SetSize((self._frame_GuildContents):GetSizeX(), guildDesc:GetTextSizeY())
  ;
  (self._frame):UpdateContentPos()
  ;
  (self._frame):UpdateContentScroll()
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_NoneJoinMember.Open = function(self)
  -- function num : 0_1
  Panel_Guild_NoneJoinMember:SetShow(true)
  audioPostEvent_SystemUi(1, 30)
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_NoneJoinMember.Close = function(self)
  -- function num : 0_2
  Panel_Guild_NoneJoinMember:SetShow(false)
  audioPostEvent_SystemUi(1, 31)
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_NoneJoinMember.GuildNpcNavi = function(self)
  -- function num : 0_3
  HandleClicked_TownNpcIcon_NaviStart(11)
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_NoneJoinMember.GuildRankOpen = function(self)
  -- function num : 0_4
  GuildRank_Web_Show()
end

PaGlobal_Guild_NoneJoinMember_OnScreenSizeRefresh = function()
  -- function num : 0_5
  Panel_Guild_NoneJoinMember:ComputePos()
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_NoneJoinMember.SimpleTooltips = function(self, isShow, tipType)
  -- function num : 0_6
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILD_NONEJOINMEMBER_GUILDNAVI")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NONEJOINMEMBER_CREATEGUILD_DESC")
    control = self.btn_GuildNPCNavi
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GUILD_RANK_TITLE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_NONEJOINMEMBER_GUILDRANK_DESC")
      control = self.btn_GuidlRank
    end
  end
  TooltipSimple_Show(control, name, desc)
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_Guild_NoneJoinMember.EventHandler = function(self)
  -- function num : 0_7
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_Guild_NoneJoinMember:Close()")
  ;
  (self.btn_GuildNPCNavi):addInputEvent("Mouse_LUp", "PaGlobal_Guild_NoneJoinMember:GuildNpcNavi()")
  ;
  (self.btn_GuidlRank):addInputEvent("Mouse_LUp", "PaGlobal_Guild_NoneJoinMember:GuildRankOpen()")
  ;
  (self.btn_GuildNPCNavi):addInputEvent("Mouse_On", "PaGlobal_Guild_NoneJoinMember:SimpleTooltips(true, 0)")
  ;
  (self.btn_GuildNPCNavi):addInputEvent("Mouse_Out", "PaGlobal_Guild_NoneJoinMember:SimpleTooltips(false)")
  ;
  (self.btn_GuidlRank):addInputEvent("Mouse_On", "PaGlobal_Guild_NoneJoinMember:SimpleTooltips(true, 1)")
  ;
  (self.btn_GuidlRank):addInputEvent("Mouse_Out", "PaGlobal_Guild_NoneJoinMember:SimpleTooltips(false)")
  registerEvent("onScreenResize", "PaGlobal_Guild_NoneJoinMember_OnScreenSizeRefresh")
end

PaGlobal_Guild_NoneJoinMember:Initialize()
PaGlobal_Guild_NoneJoinMember:EventHandler()

