-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\frame_guild_warfare.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local _constGuildListMaxCount = 150
local _startMemberIndex = 0
local frame_Warfare, content_Warfare = nil, nil
GuildWarfareInfoPage = {_scrollBar; _frameDefaultBG_Warfare = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_WarfareBG"), 
_list = {}
}
local _iconHelper = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_IconHelper")
local ui_Icons = {[0] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_CommandCenter"), [1] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_Tower"), [2] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_CastleGate"), [3] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_Help"), [4] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_Summons"), [5] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_Installation"), [6] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_Master"), [7] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_Commander"), [8] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_Member"), [9] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_Death"), [10] = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_M_CharName"), [11] = (UI.getChildControl)(Panel_Guild_Warfare, "Static_M_KillBySiege")}
local staticText_CommandCenter = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_CommandCenter")
local staticText_Tower = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_Tower")
local staticText_CastleGate = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_CastleGate")
local staticText_Help = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_Help")
local staticText_Summons = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_Summons")
local staticText_Installation = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_Installation")
local staticText_Master = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_Master")
local staticText_Commander = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_Commander")
local staticText_Member = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_Member")
local staticText_Death = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_Death")
local staticText_KillBySiege = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_KillBySiege")
local staticText_CharName = (UI.getChildControl)(Panel_Guild_Warfare, "StaticText_S_CharName")
local _selectSortType = 11
local _listSort = {command = false, tower = false, castlegate = false, help = false, summons = false, installation = false, master = false, commander = false, member = false, death = false, name = false, killBySiege = false}
local tempGuildWarfareList = {}
for iconidx = 0, 11 do
  (ui_Icons[iconidx]):addInputEvent("Mouse_LUp", "HandleClicked_GuildWarfareListSort( " .. iconidx .. " )")
end
Panel_Guild_Warfare_Icon_ToolTip_Func = function()
  -- function num : 0_0 , upvalues : ui_Icons
  for idx = 0, 11 do
    (ui_Icons[idx]):addInputEvent("Mouse_On", "Panel_Guild_Warfare_Icon_ToolTip_Show(" .. idx .. ", true )")
    ;
    (ui_Icons[idx]):addInputEvent("Mouse_Out", "Panel_Guild_Warfare_Icon_ToolTip_Show(" .. idx .. ", false )")
  end
end

Panel_Guild_Warfare_Icon_ToolTip_Show = function(iconNo, isOn)
  -- function num : 0_1 , upvalues : _iconHelper
  local mouse_posX = getMousePosX()
  local mouse_posY = getMousePosY()
  local panel_posX = (GuildWarfareInfoPage._frameDefaultBG_Warfare):GetParentPosX()
  local panel_posY = (GuildWarfareInfoPage._frameDefaultBG_Warfare):GetParentPosY()
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
                          _iconHelper:SetShow(false)
                        else
                          if iconNo == 11 then
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
    end
  else
    _iconHelper:SetShow(false)
  end
end

local frameSizeY = 0
local contentSizeY = 0
-- DECOMPILER ERROR at PC203: Confused about usage of register: R26 in 'UnsetPending'

GuildWarfareInfoPage.initialize = function(self)
  -- function num : 0_2 , upvalues : frame_Warfare, content_Warfare, contentSizeY, UCT, _constGuildListMaxCount, frameSizeY
  Panel_Guild_Warfare_Icon_ToolTip_Func()
  local constStartY = 5
  frame_Warfare = (UI.getChildControl)(Panel_Guild_Warfare, "Frame_GuildWarfare")
  content_Warfare = (UI.getChildControl)(frame_Warfare, "Frame_1_Content")
  contentSizeY = content_Warfare:GetSizeY()
  local copyCharName = (UI.getChildControl)(content_Warfare, "StaticText_C_CharName")
  local copyTower = (UI.getChildControl)(content_Warfare, "StaticText_C_Tower")
  local copyCommandCenter = (UI.getChildControl)(content_Warfare, "StaticText_C_CommandCenter")
  local copyCastleGate = (UI.getChildControl)(content_Warfare, "StaticText_C_CastleGate")
  local copyHelp = (UI.getChildControl)(content_Warfare, "StaticText_C_Help")
  local copySummons = (UI.getChildControl)(content_Warfare, "StaticText_C_Summons")
  local copyInstallation = (UI.getChildControl)(content_Warfare, "StaticText_C_Installation")
  local copyMaster = (UI.getChildControl)(content_Warfare, "StaticText_C_Master")
  local copyCommander = (UI.getChildControl)(content_Warfare, "StaticText_C_Commander")
  local copyMember = (UI.getChildControl)(content_Warfare, "StaticText_C_Member")
  local copyDeath = (UI.getChildControl)(content_Warfare, "StaticText_C_Death")
  local copyKillBySiege = (UI.getChildControl)(content_Warfare, "StaticText_C_KillBySiege")
  local copyPartline = (UI.getChildControl)(content_Warfare, "Static_C_PartLine")
  self._scrollBar = (UI.getChildControl)(frame_Warfare, "VerticalScroll")
  ;
  (UIScroll.InputEvent)(self._scrollBar, "GuildWarfareMouseScrollEvent")
  content_Warfare:addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent( true )")
  content_Warfare:addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent( false )")
  createWarfareInfo = function(pIndex)
    -- function num : 0_2_0 , upvalues : UCT, content_Warfare, copyCharName, copyTower, copyCommandCenter, copyCastleGate, copyHelp, copySummons, copyInstallation, copyMaster, copyCommander, copyMember, copyDeath, copyKillBySiege, copyPartline, constStartY
    local rtGuildWarfareInfo = {}
    rtGuildWarfareInfo._txtCharName = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_CharName_" .. pIndex)
    rtGuildWarfareInfo._txtTower = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_Tower_" .. pIndex)
    rtGuildWarfareInfo._txtCommandCenter = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_CommandCenter_" .. pIndex)
    rtGuildWarfareInfo._txtCastleGate = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_CastleGate_" .. pIndex)
    rtGuildWarfareInfo._txtHelp = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_Help_" .. pIndex)
    rtGuildWarfareInfo._txtSummons = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_Summons_" .. pIndex)
    rtGuildWarfareInfo._txtInstallation = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_Installation_" .. pIndex)
    rtGuildWarfareInfo._txtMaster = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_Master_" .. pIndex)
    rtGuildWarfareInfo._txtCommander = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_Commander_" .. pIndex)
    rtGuildWarfareInfo._txtMember = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_Member_" .. pIndex)
    rtGuildWarfareInfo._txtDeath = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_Death_" .. pIndex)
    rtGuildWarfareInfo._txtKillBySiege = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, content_Warfare, "StaticText_C_KillBySiege_" .. pIndex)
    rtGuildWarfareInfo._Partline = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, content_Warfare, "Static_C_PartLine_" .. pIndex)
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
    ;
    (rtGuildWarfareInfo._txtCharName):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtTower):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtCommandCenter):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtCastleGate):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtHelp):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtSummons):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtInstallation):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtMaster):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtCommander):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtMember):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtDeath):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtKillBySiege):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._Partline):SetIgnore(false)
    ;
    (rtGuildWarfareInfo._txtCharName):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtTower):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtCommandCenter):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtCastleGate):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtHelp):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtSummons):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtInstallation):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtMaster):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtCommander):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtMember):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtDeath):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtKillBySiege):addInputEvent("Mouse_UpScroll", "GuildWarfareMouseScrollEvent(true)")
    ;
    (rtGuildWarfareInfo._txtCharName):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtTower):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtCommandCenter):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtCastleGate):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtHelp):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtSummons):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtInstallation):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtMaster):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtCommander):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtMember):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtDeath):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    ;
    (rtGuildWarfareInfo._txtKillBySiege):addInputEvent("Mouse_DownScroll", "GuildWarfareMouseScrollEvent(false)")
    rtGuildWarfareInfo.SetShow = function(self, isShow)
      -- function num : 0_2_0_0 , upvalues : rtGuildWarfareInfo
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

    return rtGuildWarfareInfo
  end

  for index = 0, _constGuildListMaxCount - 1 do
    -- DECOMPILER ERROR at PC132: Confused about usage of register: R19 in 'UnsetPending'

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
  frameSizeY = frame_Warfare:GetSizeY()
  frame_Warfare:UpdateContentScroll()
  frame_Warfare:UpdateContentPos()
  ;
  (self._frameDefaultBG_Warfare):MoveChilds((self._frameDefaultBG_Warfare):GetID(), Panel_Guild_Warfare)
  ;
  (UI.deletePanel)(Panel_Guild_Warfare:GetID())
  Panel_Guild_Warfare = nil
end

GuildWarfareMouseScrollEvent = function(isUpScroll)
  -- function num : 0_3
  local guildWrapper = ToClient_GetMyGuildInfoWrapper()
  if guildWrapper == nil then
    return 
  end
  local memberCount = guildWrapper:getMemberCount()
  ;
  (UIScroll.ScrollEvent)(GuildWarfareInfoPage._scrollBar, isUpScroll, memberCount, memberCount, 0, 1)
  GuildWarfareInfoPage:UpdateData()
end

-- DECOMPILER ERROR at PC220: Confused about usage of register: R26 in 'UnsetPending'

GuildWarfareInfoPage.TitleLineReset = function(self)
  -- function num : 0_4 , upvalues : staticText_CommandCenter, staticText_Tower, staticText_CastleGate, staticText_Help, staticText_Summons, staticText_Installation, staticText_Master, staticText_Commander, staticText_Member, staticText_Death, staticText_KillBySiege, staticText_CharName
  staticText_CommandCenter:SetShow(false)
  staticText_Tower:SetShow(false)
  staticText_CastleGate:SetShow(false)
  staticText_Help:SetShow(false)
  staticText_Summons:SetShow(false)
  staticText_Installation:SetShow(false)
  staticText_Master:SetShow(false)
  staticText_Commander:SetShow(false)
  staticText_Member:SetShow(false)
  staticText_Death:SetShow(false)
  staticText_KillBySiege:SetShow(false)
  staticText_CharName:SetShow(false)
end

-- DECOMPILER ERROR at PC224: Confused about usage of register: R26 in 'UnsetPending'

GuildWarfareInfoPage.SetGuildList = function(self)
  -- function num : 0_5 , upvalues : tempGuildWarfareList
  local myGuildWarfareListInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildWarfareListInfo == nil then
    return 
  end
  local memberCount = myGuildWarfareListInfo:getMemberCount()
  for index = 1, memberCount do
    local myGuildMemberInfo = myGuildWarfareListInfo:getMember(index - 1)
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R8 in 'UnsetPending'

    tempGuildWarfareList[index] = {idx = index - 1, command = myGuildMemberInfo:commandPostCount(), tower = myGuildMemberInfo:towerCount(), castlegate = myGuildMemberInfo:gateCount(), help = myGuildMemberInfo:assistCount(), summons = myGuildMemberInfo:summonedCount(), installation = myGuildMemberInfo:obstacleCount(), master = myGuildMemberInfo:guildMasterCount(), commander = myGuildMemberInfo:squadLeaderCount(), member = myGuildMemberInfo:squadMemberCount(), death = myGuildMemberInfo:deathCount(), name = myGuildMemberInfo:getName(), killBySiege = myGuildMemberInfo:killBySiegeWeaponCount()}
  end
end

local guildListCompareCommandCenter = function(w1, w2)
  -- function num : 0_6 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.command == true and w1.command < w2.command then
    return true
  end
  if w2.command < w1.command then
    return true
  end
end

local guildListCompareTower = function(w1, w2)
  -- function num : 0_7 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.tower == true and w2.tower < w1.tower then
    return true
  end
  if w1.tower < w2.tower then
    return true
  end
end

local guildListCompareCastleGate = function(w1, w2)
  -- function num : 0_8 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.castlegate == true and w2.castlegate < w1.castlegate then
    return true
  end
  if w1.castlegate < w2.castlegate then
    return true
  end
end

local guildListCompareHelp = function(w1, w2)
  -- function num : 0_9 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.help == true and w1.help < w2.help then
    return true
  end
  if w2.help < w1.help then
    return true
  end
end

local guildListCompareSummons = function(w1, w2)
  -- function num : 0_10 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.summons == true and w2.summons < w1.summons then
    return true
  end
  if w1.summons < w2.summons then
    return true
  end
end

local guildListCompareInstallation = function(w1, w2)
  -- function num : 0_11 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.installation == true and w2.installation < w1.installation then
    return true
  end
  if w1.installation < w2.installation then
    return true
  end
end

local guildListCompareMaster = function(w1, w2)
  -- function num : 0_12 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.master == true and w2.master < w1.master then
    return true
  end
  if w1.master < w2.master then
    return true
  end
end

local guildListCompareCommander = function(w1, w2)
  -- function num : 0_13 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.commander == true and w2.commander < w1.commander then
    return true
  end
  if w1.commander < w2.commander then
    return true
  end
end

local guildListCompareMember = function(w1, w2)
  -- function num : 0_14 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.member == true and w2.member < w1.member then
    return true
  end
  if w1.member < w2.member then
    return true
  end
end

local guildListCompareDeath = function(w1, w2)
  -- function num : 0_15 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.death == true and w2.death < w1.death then
    return true
  end
  if w1.death < w2.death then
    return true
  end
end

local guildListCompareCharName = function(w1, w2)
  -- function num : 0_16 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.name == true and w2.name < w1.name then
    return true
  end
  if w1.name < w2.name then
    return true
  end
end

local guildListCompareKillBySiege = function(w1, w2)
  -- function num : 0_17 , upvalues : _listSort
  -- DECOMPILER ERROR at PC9: Unhandled construct in 'MakeBoolean' P1

  if _listSort.killBySiege == true and w2.killBySiege < w1.killBySiege then
    return true
  end
  if w1.killBySiege < w2.killBySiege then
    return true
  end
end

HandleClicked_GuildWarfareListSort = function(sortType)
  -- function num : 0_18 , upvalues : _selectSortType, _listSort, staticText_CommandCenter, tempGuildWarfareList, guildListCompareCommandCenter, staticText_Tower, guildListCompareTower, staticText_CastleGate, guildListCompareCastleGate, staticText_Help, guildListCompareHelp, staticText_Summons, guildListCompareSummons, staticText_Installation, guildListCompareInstallation, staticText_Master, guildListCompareMaster, staticText_Commander, guildListCompareCommander, staticText_Member, guildListCompareMember, staticText_Death, guildListCompareDeath, staticText_CharName, ui_Icons, guildListCompareCharName, staticText_KillBySiege, guildListCompareKillBySiege
  _selectSortType = sortType
  GuildWarfareInfoPage:TitleLineReset()
  if sortType == 0 then
    if _listSort.command == false then
      staticText_CommandCenter:SetText("â–\178")
      -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

      _listSort.command = true
    else
      staticText_CommandCenter:SetText("â–\188")
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R1 in 'UnsetPending'

      _listSort.command = false
    end
    staticText_CommandCenter:SetShow(true)
    ;
    (table.sort)(tempGuildWarfareList, guildListCompareCommandCenter)
  else
    if sortType == 1 then
      if _listSort.tower == false then
        staticText_Tower:SetText("â–\178")
        -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

        _listSort.tower = true
      else
        staticText_Tower:SetText("â–\188")
        -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

        _listSort.tower = false
      end
      staticText_Tower:SetShow(true)
      ;
      (table.sort)(tempGuildWarfareList, guildListCompareTower)
    else
      if sortType == 2 then
        if _listSort.castlegate == false then
          staticText_CastleGate:SetText("â–\178")
          -- DECOMPILER ERROR at PC73: Confused about usage of register: R1 in 'UnsetPending'

          _listSort.castlegate = true
        else
          staticText_CastleGate:SetText("â–\188")
          -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

          _listSort.castlegate = false
        end
        staticText_CastleGate:SetShow(true)
        ;
        (table.sort)(tempGuildWarfareList, guildListCompareCastleGate)
      else
        if sortType == 3 then
          if _listSort.help == false then
            staticText_Help:SetText("â–\178")
            -- DECOMPILER ERROR at PC102: Confused about usage of register: R1 in 'UnsetPending'

            _listSort.help = true
          else
            staticText_Help:SetText("â–\188")
            -- DECOMPILER ERROR at PC109: Confused about usage of register: R1 in 'UnsetPending'

            _listSort.help = false
          end
          staticText_Help:SetShow(true)
          ;
          (table.sort)(tempGuildWarfareList, guildListCompareHelp)
        else
          if sortType == 4 then
            if _listSort.summons == false then
              staticText_Summons:SetText("â–\178")
              -- DECOMPILER ERROR at PC131: Confused about usage of register: R1 in 'UnsetPending'

              _listSort.summons = true
            else
              staticText_Summons:SetText("â–\188")
              -- DECOMPILER ERROR at PC138: Confused about usage of register: R1 in 'UnsetPending'

              _listSort.summons = false
            end
            staticText_Summons:SetShow(true)
            ;
            (table.sort)(tempGuildWarfareList, guildListCompareSummons)
          else
            if sortType == 5 then
              if _listSort.installation == false then
                staticText_Installation:SetText("â–\178")
                -- DECOMPILER ERROR at PC160: Confused about usage of register: R1 in 'UnsetPending'

                _listSort.installation = true
              else
                staticText_Installation:SetText("â–\188")
                -- DECOMPILER ERROR at PC167: Confused about usage of register: R1 in 'UnsetPending'

                _listSort.installation = false
              end
              staticText_Installation:SetShow(true)
              ;
              (table.sort)(tempGuildWarfareList, guildListCompareInstallation)
            else
              if sortType == 6 then
                if _listSort.master == false then
                  staticText_Master:SetText("â–\178")
                  -- DECOMPILER ERROR at PC189: Confused about usage of register: R1 in 'UnsetPending'

                  _listSort.master = true
                else
                  staticText_Master:SetText("â–\188")
                  -- DECOMPILER ERROR at PC196: Confused about usage of register: R1 in 'UnsetPending'

                  _listSort.master = false
                end
                staticText_Master:SetShow(true)
                ;
                (table.sort)(tempGuildWarfareList, guildListCompareMaster)
              else
                if sortType == 7 then
                  if _listSort.commander == false then
                    staticText_Commander:SetText("â–\178")
                    -- DECOMPILER ERROR at PC218: Confused about usage of register: R1 in 'UnsetPending'

                    _listSort.commander = true
                  else
                    staticText_Commander:SetText("â–\188")
                    -- DECOMPILER ERROR at PC225: Confused about usage of register: R1 in 'UnsetPending'

                    _listSort.commander = false
                  end
                  staticText_Commander:SetShow(true)
                  ;
                  (table.sort)(tempGuildWarfareList, guildListCompareCommander)
                else
                  if sortType == 8 then
                    if _listSort.member == false then
                      staticText_Member:SetText("â–\178")
                      -- DECOMPILER ERROR at PC247: Confused about usage of register: R1 in 'UnsetPending'

                      _listSort.member = true
                    else
                      staticText_Member:SetText("â–\188")
                      -- DECOMPILER ERROR at PC254: Confused about usage of register: R1 in 'UnsetPending'

                      _listSort.member = false
                    end
                    staticText_Member:SetShow(true)
                    ;
                    (table.sort)(tempGuildWarfareList, guildListCompareMember)
                  else
                    if sortType == 9 then
                      if _listSort.death == false then
                        staticText_Death:SetText("â–\178")
                        -- DECOMPILER ERROR at PC276: Confused about usage of register: R1 in 'UnsetPending'

                        _listSort.death = true
                      else
                        staticText_Death:SetText("â–\188")
                        -- DECOMPILER ERROR at PC283: Confused about usage of register: R1 in 'UnsetPending'

                        _listSort.death = false
                      end
                      staticText_Death:SetShow(true)
                      ;
                      (table.sort)(tempGuildWarfareList, guildListCompareDeath)
                    else
                      if sortType == 10 then
                        if _listSort.name == false then
                          staticText_CharName:SetText("â–\178")
                          -- DECOMPILER ERROR at PC305: Confused about usage of register: R1 in 'UnsetPending'

                          _listSort.name = true
                        else
                          staticText_CharName:SetText("â–\188")
                          -- DECOMPILER ERROR at PC312: Confused about usage of register: R1 in 'UnsetPending'

                          _listSort.name = false
                        end
                        staticText_CharName:SetShow(true)
                        staticText_CharName:SetPosX((ui_Icons[sortType]):GetPosX() + (ui_Icons[sortType]):GetSizeX() / 2 + (ui_Icons[sortType]):GetTextSizeX() / 2 + 10)
                        ;
                        (table.sort)(tempGuildWarfareList, guildListCompareCharName)
                      else
                        if sortType == 11 then
                          if _listSort.killBySiege == false then
                            staticText_KillBySiege:SetText("â–\178")
                            -- DECOMPILER ERROR at PC354: Confused about usage of register: R1 in 'UnsetPending'

                            _listSort.killBySiege = true
                          else
                            staticText_KillBySiege:SetText("â–\188")
                            -- DECOMPILER ERROR at PC361: Confused about usage of register: R1 in 'UnsetPending'

                            _listSort.killBySiege = false
                          end
                          staticText_KillBySiege:SetShow(true)
                          ;
                          (table.sort)(tempGuildWarfareList, guildListCompareKillBySiege)
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
  end
  GuildWarfareInfoPage:UpdateData()
end

-- DECOMPILER ERROR at PC286: Confused about usage of register: R38 in 'UnsetPending'

GuildWarfareInfoPage.GuildListSortSet = function(self)
  -- function num : 0_19 , upvalues : staticText_CharName, _listSort, tempGuildWarfareList, guildListCompareCharName, ui_Icons
  GuildWarfareInfoPage:TitleLineReset()
  staticText_CharName:SetText("â–\178")
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  _listSort.name = true
  staticText_CharName:SetShow(true)
  ;
  (table.sort)(tempGuildWarfareList, guildListCompareCharName)
  staticText_CharName:SetPosX((ui_Icons[10]):GetPosX() + (ui_Icons[10]):GetSizeX() / 2 + (ui_Icons[10]):GetTextSizeX() / 2 + 10)
end

-- DECOMPILER ERROR at PC303: Confused about usage of register: R38 in 'UnsetPending'

GuildWarfareInfoPage.updateSort = function(self)
  -- function num : 0_20 , upvalues : _selectSortType, tempGuildWarfareList, guildListCompareCommandCenter, guildListCompareTower, guildListCompareCastleGate, guildListCompareHelp, guildListCompareSummons, guildListCompareInstallation, guildListCompareMaster, guildListCompareCommander, guildListCompareMember, guildListCompareDeath, guildListCompareCharName, guildListCompareKillBySiege
  if _selectSortType == 0 then
    (table.sort)(tempGuildWarfareList, guildListCompareCommandCenter)
  else
    if _selectSortType == 1 then
      (table.sort)(tempGuildWarfareList, guildListCompareTower)
    else
      if _selectSortType == 2 then
        (table.sort)(tempGuildWarfareList, guildListCompareCastleGate)
      else
        if _selectSortType == 3 then
          (table.sort)(tempGuildWarfareList, guildListCompareHelp)
        else
          if _selectSortType == 4 then
            (table.sort)(tempGuildWarfareList, guildListCompareSummons)
          else
            if _selectSortType == 5 then
              (table.sort)(tempGuildWarfareList, guildListCompareInstallation)
            else
              if _selectSortType == 6 then
                (table.sort)(tempGuildWarfareList, guildListCompareMaster)
              else
                if _selectSortType == 7 then
                  (table.sort)(tempGuildWarfareList, guildListCompareCommander)
                else
                  if _selectSortType == 8 then
                    (table.sort)(tempGuildWarfareList, guildListCompareMember)
                  else
                    if _selectSortType == 9 then
                      (table.sort)(tempGuildWarfareList, guildListCompareDeath)
                    else
                      if _selectSortType == 10 then
                        (table.sort)(tempGuildWarfareList, guildListCompareCharName)
                      else
                        if _selectSortType == 11 then
                          (table.sort)(tempGuildWarfareList, guildListCompareKillBySiege)
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
  end
end

-- DECOMPILER ERROR at PC314: Confused about usage of register: R38 in 'UnsetPending'

GuildWarfareInfoPage.UpdateData = function(self)
  -- function num : 0_21 , upvalues : contentSizeY, _constGuildListMaxCount, tempGuildWarfareList, UI_color, content_Warfare, _startMemberIndex, frameSizeY, frame_Warfare
  GuildWarfareInfoPage:SetGuildList()
  GuildWarfareInfoPage:updateSort()
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    return 
  end
  contentSizeY = 0
  for index = 0, _constGuildListMaxCount - 1 do
    ((self._list)[index]):SetShow(false)
  end
  local memberCount = myGuildInfo:getMemberCount()
  for index = 0, memberCount - 1 do
    local dataIdx = (tempGuildWarfareList[index + 1]).idx
    local myGuildMemberInfo = myGuildInfo:getMember(dataIdx)
    if myGuildMemberInfo == nil then
      return 
    end
    if myGuildMemberInfo:isOnline() then
      if myGuildMemberInfo:isSelf() then
        (((self._list)[index])._txtCharName):SetFontColor(UI_color.C_FFEF9C7F)
      else
        ;
        (((self._list)[index])._txtCharName):SetFontColor(UI_color.C_FFC4BEBE)
      end
      ;
      (((self._list)[index])._txtCharName):SetText(myGuildMemberInfo:getName() .. " (" .. myGuildMemberInfo:getCharacterName() .. ")")
      ;
      (((self._list)[index])._txtCommandCenter):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtTower):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtCastleGate):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtHelp):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtSummons):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtInstallation):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtMaster):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtCommander):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtMember):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtDeath):SetFontColor(UI_color.C_FFC4BEBE)
      ;
      (((self._list)[index])._txtKillBySiege):SetFontColor(UI_color.C_FFC4BEBE)
    else
      ;
      (((self._list)[index])._txtCharName):SetText(myGuildMemberInfo:getName() .. " ( - )")
      ;
      (((self._list)[index])._txtCharName):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtCommandCenter):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtTower):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtCastleGate):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtHelp):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtSummons):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtInstallation):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtMaster):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtCommander):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtMember):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtDeath):SetFontColor(UI_color.C_FF515151)
      ;
      (((self._list)[index])._txtKillBySiege):SetFontColor(UI_color.C_FF515151)
    end
    ;
    (((self._list)[index])._txtCommandCenter):SetText(myGuildMemberInfo:commandPostCount())
    ;
    (((self._list)[index])._txtTower):SetText(myGuildMemberInfo:towerCount())
    ;
    (((self._list)[index])._txtCastleGate):SetText(myGuildMemberInfo:gateCount())
    ;
    (((self._list)[index])._txtHelp):SetText(myGuildMemberInfo:assistCount())
    ;
    (((self._list)[index])._txtSummons):SetText(myGuildMemberInfo:summonedCount())
    ;
    (((self._list)[index])._txtInstallation):SetText(myGuildMemberInfo:obstacleCount())
    ;
    (((self._list)[index])._txtMaster):SetText(myGuildMemberInfo:guildMasterCount())
    ;
    (((self._list)[index])._txtCommander):SetText(myGuildMemberInfo:squadLeaderCount())
    ;
    (((self._list)[index])._txtMember):SetText(myGuildMemberInfo:squadMemberCount())
    ;
    (((self._list)[index])._txtDeath):SetText(myGuildMemberInfo:deathCount())
    ;
    (((self._list)[index])._txtKillBySiege):SetText(myGuildMemberInfo:killBySiegeWeaponCount())
    contentSizeY = contentSizeY + (((self._list)[index])._txtCharName):GetSizeY() + 2
    content_Warfare:SetSize(content_Warfare:GetSizeX(), contentSizeY)
  end
  for index = 0, _constGuildListMaxCount - 1 do
    if _startMemberIndex + index < memberCount then
      ((self._list)[index]):SetShow(true)
    else
      ;
      ((self._list)[index]):SetShow(false)
    end
  end
  if contentSizeY <= frameSizeY then
    (self._scrollBar):SetShow(false)
  else
    ;
    (self._scrollBar):SetShow(true)
  end
  frame_Warfare:UpdateContentScroll()
  frame_Warfare:UpdateContentPos()
end

-- DECOMPILER ERROR at PC318: Confused about usage of register: R38 in 'UnsetPending'

GuildWarfareInfoPage.Show = function(self)
  -- function num : 0_22 , upvalues : _selectSortType
  (self._frameDefaultBG_Warfare):SetShow(true)
  ;
  (self._scrollBar):SetControlPos(0)
  self:SetGuildList()
  _selectSortType = 10
  self:GuildListSortSet()
  self:UpdateData()
end

-- DECOMPILER ERROR at PC321: Confused about usage of register: R38 in 'UnsetPending'

GuildWarfareInfoPage.Hide = function(self)
  -- function num : 0_23
  if (self._frameDefaultBG_Warfare):GetShow() == true then
    (self._frameDefaultBG_Warfare):SetShow(false)
  end
end

registerEvent("Event_SiegeScoreUpdateData", "FromClient_GuildWarfareInfoUpdate")
FromClient_GuildWarfareInfoUpdate = function()
  -- function num : 0_24
  GuildWarfareInfoPage:UpdateData()
end


