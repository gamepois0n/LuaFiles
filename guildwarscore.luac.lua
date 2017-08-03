-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guildwarinfo\guildwarscore.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_GuildWarScore:ActiveMouseEventEffect(true)
Panel_GuildWarScore:setGlassBackground(true)
Panel_GuildWarScore:SetShow(false, false)
Panel_GuildWarScore:RegisterShowEventFunc(true, "Panel_GuildWarScore_ShowAni()")
Panel_GuildWarScore:RegisterShowEventFunc(false, "Panel_GuildWarScore_HideAni()")
Panel_GuildWarScore_ShowAni = function()
  -- function num : 0_0
end

Panel_GuildWarScore_HideAni = function()
  -- function num : 0_1
end

local currentGuildWrapper = nil
local _iconHelper = (UI.getChildControl)(Panel_GuildWarScore, "StaticText_IconHelper")
local guildWarScoreTitle = (UI.getChildControl)(Panel_GuildWarScore, "StaticText_TitleBar")
local btn_Close = (UI.getChildControl)(Panel_GuildWarScore, "Button_Win_Close")
btn_Close:addInputEvent("Mouse_LUp", "Panel_GuildWarScore_Close()")
local ui_Icons = {[0] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_CommandCenter"), [1] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_Tower"), [2] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_CastleGate"), [3] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_Help"), [4] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_Summons"), [5] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_Installation"), [6] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_Master"), [7] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_Commander"), [8] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_Member"), [9] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_Death"), [10] = (UI.getChildControl)(Panel_GuildWarScore, "Static_M_KillBySiege")}
local tempGuildWarfareList = {}
local _selectSortType = 11
local _listSort = {command = false, tower = false, castlegate = false, help = false, summons = false, installation = false, master = false, commander = false, member = false, death = false, killBySiege = false}
Panel_GuildWarScore_Icon_ToolTip_Func = function()
  -- function num : 0_2 , upvalues : ui_Icons
  for idx = 0, 10 do
    (ui_Icons[idx]):addInputEvent("Mouse_On", "Panel_GuildWarScore_Icon_ToolTip_Show(" .. idx .. ", true )")
    ;
    (ui_Icons[idx]):addInputEvent("Mouse_Out", "Panel_GuildWarScore_Icon_ToolTip_Show(" .. idx .. ", false )")
  end
end

Panel_GuildWarScore_Icon_ToolTip_Show = function(iconNo, isOn)
  -- function num : 0_3 , upvalues : _iconHelper
  local mouse_posX = getMousePosX()
  local mouse_posY = getMousePosY()
  local panel_posX = Panel_GuildWarScore:GetPosX()
  local panel_posY = Panel_GuildWarScore:GetPosY()
  _iconHelper:SetPosX(mouse_posX - panel_posX)
  _iconHelper:SetPosY(mouse_posY - panel_posY + 15)
  if isOn == true then
    if iconNo == 0 then
      _iconHelper:SetShow(true)
      _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_COMMAND"))
    else
      if iconNo == 1 then
        _iconHelper:SetShow(true)
        _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_TOWER"))
      else
        if iconNo == 2 then
          _iconHelper:SetShow(true)
          _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_DOOR"))
        else
          if iconNo == 3 then
            _iconHelper:SetShow(true)
            _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_HELPER"))
          else
            if iconNo == 4 then
              _iconHelper:SetShow(true)
              _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_SUMMON"))
            else
              if iconNo == 5 then
                _iconHelper:SetShow(true)
                _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_OBJECT"))
              else
                if iconNo == 6 then
                  _iconHelper:SetShow(true)
                  _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_MASTER"))
                else
                  if iconNo == 7 then
                    _iconHelper:SetShow(true)
                    _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_COMMANDER"))
                  else
                    if iconNo == 8 then
                      _iconHelper:SetShow(true)
                      _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_MEMBER"))
                    else
                      if iconNo == 9 then
                        _iconHelper:SetShow(true)
                        _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_TXT_WARFARE_HELP_DEATH"))
                      else
                        if iconNo == 10 then
                          _iconHelper:SetShow(true)
                          _iconHelper:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILD_WARFARE_RIDEMACHINE_KILL"))
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  else
    _iconHelper:SetShow(false)
  end
end

local frameSizeY = 0
local contentSizeY = 0
local _constGuildListMaxCount = 17
local _startMemberIndex = 0
local GuildWarScore = {
_list = {}
}
GuildWarScore.initialize = function(self)
  -- function num : 0_4 , upvalues : frameSizeY, contentSizeY, UI_PUCT, UI_color, _constGuildListMaxCount
  Panel_GuildWarScore_Icon_ToolTip_Func()
  local constStartY = 5
  self.frame_Warfare = (UI.getChildControl)(Panel_GuildWarScore, "Frame_GuildWarfare")
  self.content_Warfare = (UI.getChildControl)(self.frame_Warfare, "Frame_1_Content")
  frameSizeY = (self.frame_Warfare):GetSizeY()
  contentSizeY = (self.content_Warfare):GetSizeY()
  local copyCharName = (UI.getChildControl)(self.content_Warfare, "StaticText_C_CharName")
  local copyTower = (UI.getChildControl)(self.content_Warfare, "StaticText_C_Tower")
  local copyCommandCenter = (UI.getChildControl)(self.content_Warfare, "StaticText_C_CommandCenter")
  local copyCastleGate = (UI.getChildControl)(self.content_Warfare, "StaticText_C_CastleGate")
  local copyHelp = (UI.getChildControl)(self.content_Warfare, "StaticText_C_Help")
  local copySummons = (UI.getChildControl)(self.content_Warfare, "StaticText_C_Summons")
  local copyInstallation = (UI.getChildControl)(self.content_Warfare, "StaticText_C_Installation")
  local copyMaster = (UI.getChildControl)(self.content_Warfare, "StaticText_C_Master")
  local copyCommander = (UI.getChildControl)(self.content_Warfare, "StaticText_C_Commander")
  local copyMember = (UI.getChildControl)(self.content_Warfare, "StaticText_C_Member")
  local copyDeath = (UI.getChildControl)(self.content_Warfare, "StaticText_C_Death")
  local copyKillBySiege = (UI.getChildControl)(self.content_Warfare, "StaticText_C_KillBySiege")
  local copyPartline = (UI.getChildControl)(self.content_Warfare, "Static_C_PartLine")
  self._scrollBar = (UI.getChildControl)(self.frame_Warfare, "VerticalScroll")
  ;
  (UIScroll.InputEvent)(self._scrollBar, "Panel_GuildWarScore_MouseScrollEvent")
  ;
  (self.content_Warfare):addInputEvent("Mouse_UpScroll", "Panel_GuildWarScore_MouseScrollEvent( true )")
  ;
  (self.content_Warfare):addInputEvent("Mouse_DownScroll", "Panel_GuildWarScore_MouseScrollEvent( false )")
  local createWarfareInfo = function(pIndex)
    -- function num : 0_4_0 , upvalues : UI_PUCT, self, copyCharName, copyTower, copyCommandCenter, copyCastleGate, copyHelp, copySummons, copyInstallation, copyMaster, copyCommander, copyMember, copyDeath, copyKillBySiege, copyPartline, constStartY, UI_color
    local rtGuildWarfareInfo = {}
    rtGuildWarfareInfo._txtCharName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_CharName_" .. pIndex)
    rtGuildWarfareInfo._txtTower = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_Tower_" .. pIndex)
    rtGuildWarfareInfo._txtCommandCenter = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_CommandCenter_" .. pIndex)
    rtGuildWarfareInfo._txtCastleGate = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_CastleGate_" .. pIndex)
    rtGuildWarfareInfo._txtHelp = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_Help_" .. pIndex)
    rtGuildWarfareInfo._txtSummons = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_Summons_" .. pIndex)
    rtGuildWarfareInfo._txtInstallation = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_Installation_" .. pIndex)
    rtGuildWarfareInfo._txtMaster = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_Master_" .. pIndex)
    rtGuildWarfareInfo._txtCommander = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_Commander_" .. pIndex)
    rtGuildWarfareInfo._txtMember = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_Member_" .. pIndex)
    rtGuildWarfareInfo._txtDeath = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_Death_" .. pIndex)
    rtGuildWarfareInfo._txtKillBySiege = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.content_Warfare, "StaticText_C_KillBySiege_" .. pIndex)
    rtGuildWarfareInfo._Partline = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.content_Warfare, "Static_C_PartLine_" .. pIndex)
    CopyBaseProperty(copyCharName, rtGuildWarfareInfo._txtCharName)
    CopyBaseProperty(copyTower, rtGuildWarfareInfo._txtTower)
    CopyBaseProperty(copyCommandCenter, rtGuildWarfareInfo._txtCommandCenter)
    CopyBaseProperty(copyCastleGate, rtGuildWarfareInfo._txtCastleGate)
    CopyBaseProperty(copyHelp, rtGuildWarfareInfo._txtHelp)
    CopyBaseProperty(copySummons, rtGuildWarfareInfo._txtSummons)
    CopyBaseProperty(copyInstallation, rtGuildWarfareInfo._txtInstallation)
    CopyBaseProperty(copyMaster, rtGuildWarfareInfo._txtMaster)
    CopyBaseProperty(copyCommander, rtGuildWarfareInfo._txtCommander)
    CopyBaseProperty(copyMember, rtGuildWarfareInfo._txtMember)
    CopyBaseProperty(copyDeath, rtGuildWarfareInfo._txtDeath)
    CopyBaseProperty(copyKillBySiege, rtGuildWarfareInfo._txtKillBySiege)
    CopyBaseProperty(copyPartline, rtGuildWarfareInfo._Partline)
    ;
    (rtGuildWarfareInfo._txtCharName):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtTower):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtCommandCenter):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtCastleGate):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtHelp):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtSummons):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtInstallation):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtMaster):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtCommander):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtMember):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtDeath):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._txtKillBySiege):SetPosY(constStartY + pIndex * 25)
    ;
    (rtGuildWarfareInfo._Partline):SetPosY(pIndex * 25)
    rtGuildWarfareInfo.SetShow = function(self, isShow)
      -- function num : 0_4_0_0 , upvalues : rtGuildWarfareInfo
      (rtGuildWarfareInfo._txtCharName):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtTower):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtCommandCenter):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtCastleGate):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtHelp):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtSummons):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtInstallation):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtMaster):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtCommander):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtMember):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtDeath):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._txtKillBySiege):SetShow(isShow)
      ;
      (rtGuildWarfareInfo._Partline):SetShow(isShow)
    end

    rtGuildWarfareInfo.SetData = function(self, pData)
      -- function num : 0_4_0_1 , upvalues : rtGuildWarfareInfo, UI_color
      if pData:isOnline() then
        (rtGuildWarfareInfo._txtCharName):SetText(pData:getName() .. " (" .. pData:getCharacterName() .. ")")
        ;
        (rtGuildWarfareInfo._txtCharName):SetFontColor(UI_color.C_FFEFEFEF)
      else
        ;
        (rtGuildWarfareInfo._txtCharName):SetText(pData:getName() .. " ( - )")
        ;
        (rtGuildWarfareInfo._txtCharName):SetFontColor(UI_color.C_FFC4BEBE)
      end
      ;
      (rtGuildWarfareInfo._txtCommandCenter):SetText(pData:commandPostCount())
      ;
      (rtGuildWarfareInfo._txtTower):SetText(pData:towerCount())
      ;
      (rtGuildWarfareInfo._txtCastleGate):SetText(pData:gateCount())
      ;
      (rtGuildWarfareInfo._txtHelp):SetText(pData:assistCount())
      ;
      (rtGuildWarfareInfo._txtSummons):SetText(pData:summonedCount())
      ;
      (rtGuildWarfareInfo._txtInstallation):SetText(pData:obstacleCount())
      ;
      (rtGuildWarfareInfo._txtMaster):SetText(pData:guildMasterCount())
      ;
      (rtGuildWarfareInfo._txtCommander):SetText(pData:squadLeaderCount())
      ;
      (rtGuildWarfareInfo._txtMember):SetText(pData:squadMemberCount())
      ;
      (rtGuildWarfareInfo._txtDeath):SetText(pData:deathCount())
      ;
      (rtGuildWarfareInfo._txtKillBySiege):SetText(pData:killBySiegeWeaponCount())
    end

    return rtGuildWarfareInfo
  end

  for index = 0, _constGuildListMaxCount - 1 do
    -- DECOMPILER ERROR at PC136: Confused about usage of register: R20 in 'UnsetPending'

    (self._list)[index] = createWarfareInfo(index)
  end
  ;
  (UI.deleteControl)(copyCharName)
  ;
  (UI.deleteControl)(copyTower)
  ;
  (UI.deleteControl)(copyCommandCenter)
  ;
  (UI.deleteControl)(copyCastleGate)
  ;
  (UI.deleteControl)(copyHelp)
  ;
  (UI.deleteControl)(copySummons)
  ;
  (UI.deleteControl)(copyInstallation)
  ;
  (UI.deleteControl)(copyMaster)
  ;
  (UI.deleteControl)(copyCommander)
  ;
  (UI.deleteControl)(copyMember)
  ;
  (UI.deleteControl)(copyDeath)
  ;
  (UI.deleteControl)(copyKillBySiege)
  ;
  (UI.deleteControl)(copyPartline)
  copyCharName, copyTower, copyCommandCenter, copyCastleGate, copyHelp, copySummons, copyInstallation, copyMaster, copyCommander, copyMember, copyDeath, copyKillBySiege, copyPartline = nil
end

Panel_GuildWarScore_MouseScrollEvent = function(isUpScroll)
  -- function num : 0_5 , upvalues : currentGuildWrapper, _startMemberIndex, GuildWarScore, _constGuildListMaxCount
  local memberCount = currentGuildWrapper:getMemberCount()
  _startMemberIndex = (UIScroll.ScrollEvent)(GuildWarScore._scrollBar, isUpScroll, _constGuildListMaxCount, memberCount, _startMemberIndex, 1)
  GuildWarScore:UpdateData()
end

FromClient_ResponseSiegeWarScoreByGuildNo = function(guildNo, isShow)
  -- function num : 0_6 , upvalues : currentGuildWrapper, GuildWarScore
  if guildNoReturn() ~= guildNo then
    return 
  end
  if guildNo ~= nil then
    if currentGuildWrapper == nil then
      return 
    end
    if Panel_GuildWarScore:GetShow() == false then
      Panel_GuildWarScore:SetShow(isShow, isShow)
      Panel_GuildWarScore_RePos()
    end
    GuildWarScore:UpdateData()
  end
end

local _guildNo = nil
FGlobal_GuildWarScore_ShowToggle = function(guildNo)
  -- function num : 0_7 , upvalues : _guildNo, currentGuildWrapper, _startMemberIndex, GuildWarScore
  if Panel_GuildWarScore:GetShow() and _guildNo == guildNo then
    Panel_GuildWarScore:SetShow(false, false)
    currentGuildWrapper = nil
    _guildNo = nil
    return 
  end
  _guildNo = guildNo
  _startMemberIndex = 0
  ;
  (GuildWarScore._scrollBar):SetControlPos(0)
  currentGuildWrapper = ToClient_GetGuildInfoWrapperByGuildNo(guildNo)
  FromClient_ResponseSiegeWarScoreByGuildNo(guildNo, true)
end

guildNoReturn = function()
  -- function num : 0_8 , upvalues : _guildNo
  return _guildNo
end

GuildWarScore.UpdateData = function(self)
  -- function num : 0_9 , upvalues : _constGuildListMaxCount, _startMemberIndex, guildWarScoreTitle
  for index = 0, _constGuildListMaxCount - 1 do
    ((self._list)[index]):SetShow(false)
  end
  if guildNoReturn() == nil then
    return 
  end
  local currentGuildWrapper = ToClient_GetGuildInfoWrapperByGuildNo(guildNoReturn())
  if currentGuildWrapper == nil then
    return 
  end
  local memberCount = currentGuildWrapper:getMemberCount()
  for index = 0, _constGuildListMaxCount - 1 do
    if _startMemberIndex + index < memberCount then
      ((self._list)[index]):SetData(currentGuildWrapper:getMember(_startMemberIndex + index))
      ;
      ((self._list)[index]):SetShow(true)
    else
      ;
      ((self._list)[index]):SetShow(false)
    end
  end
  guildWarScoreTitle:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARSCORE_SCORETITLE", "getName", currentGuildWrapper:getName()))
  if memberCount > 17 then
    (self._scrollBar):SetShow(true)
  else
    ;
    (self._scrollBar):SetShow(false)
  end
end

FromClient_GuildWarScoreUpdate = function()
  -- function num : 0_10 , upvalues : GuildWarScore
  GuildWarScore:UpdateData()
end

Panel_GuildWarScore_RePos = function()
  -- function num : 0_11
  if Panel_GuildWarInfo:GetShow() then
    if Panel_GuildWarInfo:GetPosX() + Panel_GuildWarInfo:GetSizeX() + Panel_GuildWarScore:GetSizeX() - 40 < getScreenSizeX() then
      Panel_GuildWarScore:SetPosX(Panel_GuildWarInfo:GetPosX() + Panel_GuildWarInfo:GetSizeX() - 40)
    else
      Panel_GuildWarScore:SetPosX(Panel_GuildWarInfo:GetPosX() - Panel_GuildWarScore:GetSizeX() + 40)
    end
    Panel_GuildWarScore:SetPosY(Panel_GuildWarInfo:GetPosY())
  end
end

Panel_GuildWarScore_Close = function()
  -- function num : 0_12
  Panel_GuildWarScore:SetShow(false, false)
end

GuildWarScore:initialize()
registerEvent("FromClient_ResponseSiegeWarScoreByGuildNo", "FromClient_ResponseSiegeWarScoreByGuildNo")
registerEvent("Event_SiegeScoreUpdateData", "FromClient_GuildWarScoreUpdate")
registerEvent("onScreenResize", "Panel_GuildWarScore_RePos")

