-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guildwarinfo\guildwarinfo.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_GuildWarInfo:ActiveMouseEventEffect(true)
Panel_GuildWarInfo:setGlassBackground(true)
Panel_GuildWarInfo:SetShow(false, false)
Panel_GuildWarInfo:RegisterShowEventFunc(true, "Panel_GuildWarInfo_ShowAni()")
Panel_GuildWarInfo:RegisterShowEventFunc(false, "Panel_GuildWarInfo_HideAni()")
Panel_GuildWarInfo_ShowAni = function()
  -- function num : 0_0
  Panel_GuildWarInfo:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_GuildWarInfo, 0, 0.3)
end

Panel_GuildWarInfo_HideAni = function()
  -- function num : 0_1
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_GuildWarInfo, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

local territoryName = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TERRITORYNAME_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TERRITORYNAME_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TERRITORYNAME_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TERRITORYNAME_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TERRITORYNAME_4")}
local selectTerritoy = 0
local siegingAreaCount = 3
local isCalpheon, isMedia, isValencia = 2, 3, 4
if ToClient_IsContentsGroupOpen("4") then
  siegingAreaCount = 5
else
  if ToClient_IsContentsGroupOpen("3") then
    siegingAreaCount = 4
  else
    if ToClient_IsContentsGroupOpen("2") then
      siegingAreaCount = 3
    else
      siegingAreaCount = 2
    end
  end
end
local oneLineTextSizeY = 17
local guildWarInfo_ShowCheck = false
local siegeType = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_DEAD"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_SIEGESYMBOLDESTROY"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_SIEGETENTDESTROY"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_LORDKILL"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_GUILDMASTERKILL"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_CASTLEGATEDESTROY"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_SQUADCAPTAINKILL"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_GUILDMEMBERKILL"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_HELP"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_SUMMONKILL"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_INSTALLKILL"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_SIEGETYPE_IGNORE")}
local warInfo_Main = {btn_Close = (UI.getChildControl)(Panel_GuildWarInfo, "Button_Win_Close"), btn_Question = (UI.getChildControl)(Panel_GuildWarInfo, "Button_Question"), comboBox_Territory = (UI.getChildControl)(Panel_GuildWarInfo, "Combobox_Territory"), checkPopUp = (UI.getChildControl)(Panel_GuildWarInfo, "CheckButton_PopUp"), frame_SiegeInfo = (UI.getChildControl)(Panel_GuildWarInfo, "Frame_SiegeInfo"), subTitle = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_TitleBar")}
local comboxList = (UI.getChildControl)(warInfo_Main.comboBox_Territory, "Combobox_List")
comboxList:SetSize(comboxList:GetSizeX(), 20 * siegingAreaCount + 5)
;
(warInfo_Main.btn_Question):SetShow(false)
;
(warInfo_Main.btn_Close):addInputEvent("Mouse_LUp", "Panel_GuildWarInfo_Hide()")
;
(warInfo_Main.checkPopUp):addInputEvent("Mouse_LUp", "HandleClicked_GuildWarInfo_PopUp()")
;
(warInfo_Main.checkPopUp):addInputEvent("Mouse_On", "GuildWarInfo_PopUp_ShowIconToolTip( true )")
;
(warInfo_Main.checkPopUp):addInputEvent("Mouse_Out", "GuildWarInfo_PopUp_ShowIconToolTip( false )")
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
;
(warInfo_Main.checkPopUp):SetShow(isPopUpContentsEnable)
;
(warInfo_Main.comboBox_Territory):SetText(territoryName[0])
;
(warInfo_Main.comboBox_Territory):addInputEvent("Mouse_LUp", "HandleClicked_Territory()")
;
((warInfo_Main.comboBox_Territory):GetListControl()):addInputEvent("Mouse_LUp", "GuildWarInfo_Set_Territory()")
Panel_GuildWarInfo:SetChildIndex(warInfo_Main.comboBox_Territory, 9999)
local warInfo_Content = {frame_content = (UI.getChildControl)(warInfo_Main.frame_SiegeInfo, "Frame_1_Content"), _scroll = (UI.getChildControl)(warInfo_Main.frame_SiegeInfo, "VerticalScroll"), contentBg = (UI.getChildControl)(Panel_GuildWarInfo, "Static_GuildWarInfoBg"), guildMarkBg = (UI.getChildControl)(Panel_GuildWarInfo, "Static_GuildIconBg"), guildMark = (UI.getChildControl)(Panel_GuildWarInfo, "Static_GuildIcon"), guildName = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_GuildName"), guildMaster = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_GuildMaster"), lordCrownIcon = (UI.getChildControl)(Panel_GuildWarInfo, "Static_LordIcon"), guildWarIconBg = (UI.getChildControl)(Panel_GuildWarInfo, "Static_GuildWarIconBg"), siegeEnduranceIcon = (UI.getChildControl)(Panel_GuildWarInfo, "Static_SiegeEnduranceIcon"), siegeEnduranceValue = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_SiegeEnduranceValue"), destroySiegeCountIcon = (UI.getChildControl)(Panel_GuildWarInfo, "Static_DestroySiegeCountIcon"), destroySiegeCountValue = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_DestroySiegeCountValue"), killCountIcon = (UI.getChildControl)(Panel_GuildWarInfo, "Static_KillCountIcon"), killCountValue = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_KillCountValue"), deathCountIcon = (UI.getChildControl)(Panel_GuildWarInfo, "Static_DeathCountIcon"), deathCountValue = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_DeathCountValue"), cannonCountIcon = (UI.getChildControl)(Panel_GuildWarInfo, "Static_CanonCountIcon"), cannonCountValue = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_CanonCountValue"), descBG = (UI.getChildControl)(Panel_GuildWarInfo, "Static_DescBg"), moraleIcon = (UI.getChildControl)(Panel_GuildWarInfo, "Static_MoraleIcon"), moraleProgressBg = (UI.getChildControl)(Panel_GuildWarInfo, "Static_Morale_ProgressBg"), moraleProgress = (UI.getChildControl)(Panel_GuildWarInfo, "Progress2_Morale"), btn_CurrentInfo = (UI.getChildControl)(Panel_GuildWarInfo, "Button_CurrentInfo"), btn_Cheer = (UI.getChildControl)(Panel_GuildWarInfo, "Button_Cheer"), cheerPoint = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_CheerPoint"), setFree = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_SetFree"), setFreeDesc = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_SetFreeDesc"), _tooltip = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_Help"), _battleGuildText = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_SiegeGuildCount")}
;
(warInfo_Content._battleGuildText):SetText("")
;
(warInfo_Content.setFreeDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
local progressBarHead = (UI.getChildControl)(warInfo_Content.moraleProgress, "Progress2_Morale_Bar_Head")
progressBarHead:SetShow(false)
local textSizeY = 0
for v,control in pairs(warInfo_Content) do
  control:SetShow(false)
end
local warInfo_Log = {frame_SiegeLog = (UI.getChildControl)(Panel_GuildWarInfo, "Frame_SiegeLog"), textLog = (UI.getChildControl)(Panel_GuildWarInfo, "StaticText_GuildWar_Log"), isGuildMasterBg = (UI.getChildControl)(Panel_GuildWarInfo, "Static_LogBg")}
local log_Content = {frame_content = (UI.getChildControl)(warInfo_Log.frame_SiegeLog, "Frame_1_Content"), _scroll = (UI.getChildControl)(warInfo_Log.frame_SiegeLog, "VerticalScroll"), 
textLog = {}
, 
isGuildMasterBg = {}
}
;
(log_Content._scroll):SetShow(false)
oneLineTextSizeY = (warInfo_Log.textLog):GetTextSizeY()
local battleGuildCount = {}
local warInfoContent = {}
local guildMpCheck = {}
for territoryIndex = 0, siegingAreaCount - 1 do
  battleGuildCount[territoryIndex] = -1
  warInfoContent[territoryIndex] = {}
  guildMpCheck[territoryIndex] = {}
end
local WarInfoUI_Init = function(territoryKey)
  -- function num : 0_2 , upvalues : battleGuildCount, warInfoContent, guildMpCheck, warInfo_Content
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if isSiegeBeing(territoryKey) == false then
    battleGuildCount[territoryKey] = ToClient_SiegeGuildCount(territoryKey)
    local battleGuildCountIndex = 0
    if battleGuildCount[territoryKey] <= 0 then
      battleGuildCountIndex = 1
    else
      battleGuildCountIndex = battleGuildCount[territoryKey]
    end
    for index = 0, battleGuildCountIndex do
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R6 in 'UnsetPending'

      (warInfoContent[territoryKey])[index] = {}
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R6 in 'UnsetPending'

      ;
      (guildMpCheck[territoryKey])[index] = {}
    end
    for index = 0, battleGuildCountIndex do
      -- DECOMPILER ERROR at PC48: Confused about usage of register: R6 in 'UnsetPending'

      (warInfoContent[territoryKey])[index] = {_guildNo = nil, _guildName = nil, _guildMaster = nil, _siegeEnduranceValue = 100, _destroySiegeCountValue = 0, _killCountValue = 0, _deathCountValue = 0, _cannonCountValue = 0, _guildMp = 0}
      -- DECOMPILER ERROR at PC51: Confused about usage of register: R6 in 'UnsetPending'

      ;
      (guildMpCheck[territoryKey])[index] = 0
    end
    ;
    (warInfo_Content.descBG):SetShow(true)
  end
end

BattleGuildCount_Update = function()
  -- function num : 0_3 , upvalues : siegingAreaCount, WarInfoUI_Init
  for territoryIndex = 0, siegingAreaCount - 1 do
    WarInfoUI_Init(territoryIndex)
  end
  SiegeStatusUpdate()
end

local gapY = 5
local eliminatedGuildCount = 0
local _currentTerritoryKey = 0
local controlReGenerate = nil
FromClient_WarInfoContent_Set = function(territoryKey)
  -- function num : 0_4 , upvalues : warInfo_Content, selectTerritoy, controlReGenerate, _currentTerritoryKey, battleGuildCount, UI_PUCT, warInfoContent, gapY, territoryName, warInfo_Main, eliminatedGuildCount, guildWarInfo_ShowCheck
  if Panel_GuildWarInfo:GetShow() == false then
    return 
  end
  local isSiegeChannel = ToClient_doMinorSiegeInTerritory(territoryKey)
  local self = warInfo_Content
  if territoryKey == nil then
    territoryKey = selectTerritoy
  end
  if controlReGenerate == nil then
    controlReGenerate = true
    ;
    (self.frame_content):DestroyAllChild()
  else
    if _currentTerritoryKey ~= territoryKey then
      (self.frame_content):DestroyAllChild()
      controlReGenerate = true
    else
      controlReGenerate = false
    end
  end
  ;
  (self.frame_content):SetShow(true)
  if territoryKey == -1 then
    territoryKey = selectTerritoy
  end
  _currentTerritoryKey = territoryKey
  if battleGuildCount[territoryKey] <= 0 then
    if controlReGenerate == true then
      local index = 0
      local contentBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.frame_content, "Static_WarInfoContent_" .. index)
      CopyBaseProperty(self.contentBg, contentBg)
      -- DECOMPILER ERROR at PC65: Confused about usage of register: R5 in 'UnsetPending'

      ;
      ((warInfoContent[territoryKey])[index]).contentBg = contentBg
      ;
      (((warInfoContent[territoryKey])[index]).contentBg):SetPosX(10)
      ;
      (((warInfoContent[territoryKey])[index]).contentBg):SetPosY(gapY)
      ;
      (((warInfoContent[territoryKey])[index]).contentBg):SetShow(true)
      local setFree = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_setFree_" .. index)
      CopyBaseProperty(self.setFree, setFree)
      -- DECOMPILER ERROR at PC106: Confused about usage of register: R6 in 'UnsetPending'

      ;
      ((warInfoContent[territoryKey])[index]).setFree = setFree
      ;
      (((warInfoContent[territoryKey])[index]).setFree):SetShow(true)
      ;
      (((warInfoContent[territoryKey])[index]).setFree):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREE", "selectTerritoy", territoryName[territoryKey]))
      if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
        (((warInfoContent[territoryKey])[index]).setFree):SetPosY(10)
      end
      local setFreeDesc = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_setFreeDesc_" .. index)
      CopyBaseProperty(self.setFreeDesc, setFreeDesc)
      -- DECOMPILER ERROR at PC160: Confused about usage of register: R7 in 'UnsetPending'

      ;
      ((warInfoContent[territoryKey])[index]).setFreeDesc = setFreeDesc
      ;
      (((warInfoContent[territoryKey])[index]).setFreeDesc):SetShow(true)
      ;
      (((warInfoContent[territoryKey])[index]).setFreeDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREEDESC"))
      ;
      (warInfo_Content._battleGuildText):SetShow(isSiegeBeing(territoryKey))
      ;
      (warInfo_Main.frame_SiegeInfo):UpdateContentPos()
      ;
      (self._scroll):SetControlTop()
      ;
      (self._scroll):SetShow(false)
    end
    do
      do return  end
      if battleGuildCount[territoryKey] == 1 then
        local isOccupyGuild = true
        local guildWrapper = ToClient_GetOccupyGuildWrapper(territoryKey)
        if guildWrapper == nil then
          guildWrapper = ToClient_SiegeGuildAt(territoryKey, 0)
          isOccupyGuild = false
        end
        if controlReGenerate == true then
          local index = 0
          local contentBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.frame_content, "Static_WarInfoContent_" .. index)
          CopyBaseProperty(self.contentBg, contentBg)
          -- DECOMPILER ERROR at PC235: Confused about usage of register: R7 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).contentBg = contentBg
          ;
          (((warInfoContent[territoryKey])[index]).contentBg):SetPosX(10)
          ;
          (((warInfoContent[territoryKey])[index]).contentBg):SetPosY(gapY)
          ;
          (((warInfoContent[territoryKey])[index]).contentBg):SetShow(true)
          local setFree = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_setFree_" .. index)
          CopyBaseProperty(self.setFree, setFree)
          -- DECOMPILER ERROR at PC276: Confused about usage of register: R8 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).setFree = setFree
          ;
          (((warInfoContent[territoryKey])[index]).setFree):SetShow(true)
          if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
            (((warInfoContent[territoryKey])[index]).setFree):SetPosY(10)
          end
          local setFreeDesc = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_setFreeDesc_" .. index)
          CopyBaseProperty(self.setFreeDesc, setFreeDesc)
          -- DECOMPILER ERROR at PC316: Confused about usage of register: R9 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).setFreeDesc = setFreeDesc
          ;
          (((warInfoContent[territoryKey])[index]).setFreeDesc):SetShow(true)
          index = 1
          local contentBg1 = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.frame_content, "Static_WarInfoContent_" .. index)
          CopyBaseProperty(self.contentBg, contentBg1)
          -- DECOMPILER ERROR at PC341: Confused about usage of register: R10 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).contentBg = contentBg1
          ;
          (((warInfoContent[territoryKey])[index]).contentBg):SetPosY(((((warInfoContent[territoryKey])[index]).contentBg):GetSizeY() + gapY) * index + gapY)
          ;
          (((warInfoContent[territoryKey])[index]).contentBg):SetShow(true)
          local occupyGuildBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.frame_content, "Static_WarInfoContentBg_" .. index)
          CopyBaseProperty(self.contentBg, occupyGuildBg)
          -- DECOMPILER ERROR at PC382: Confused about usage of register: R11 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).occupyGuildBg = occupyGuildBg
          ;
          (((warInfoContent[territoryKey])[index]).occupyGuildBg):SetPosX(10)
          ;
          (((warInfoContent[territoryKey])[index]).occupyGuildBg):SetPosY(((((warInfoContent[territoryKey])[0]).contentBg):GetSizeY() + gapY) * battleGuildCount[selectTerritoy] + gapY)
          ;
          (((warInfoContent[territoryKey])[index]).occupyGuildBg):SetShow(true)
          local guildMarkBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Static_GuildMarkBg_" .. index)
          CopyBaseProperty(self.guildMarkBg, guildMarkBg)
          -- DECOMPILER ERROR at PC436: Confused about usage of register: R12 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).guildMarkBg = guildMarkBg
          ;
          (((warInfoContent[territoryKey])[index]).guildMarkBg):SetShow(true)
          local guildMark = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Static_GuildMark_" .. index)
          CopyBaseProperty(self.guildMark, guildMark)
          -- DECOMPILER ERROR at PC463: Confused about usage of register: R13 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).guildMark = guildMark
          ;
          (((warInfoContent[territoryKey])[index]).guildMark):SetShow(true)
          local guildName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "StaticText_GuildName_" .. index)
          CopyBaseProperty(self.guildName, guildName)
          -- DECOMPILER ERROR at PC490: Confused about usage of register: R14 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).guildName = guildName
          ;
          (((warInfoContent[territoryKey])[index]).guildName):SetShow(true)
          local lordCrownIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "StaticText_LordIcon")
          CopyBaseProperty(self.lordCrownIcon, lordCrownIcon)
          -- DECOMPILER ERROR at PC515: Confused about usage of register: R15 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).lordCrownIcon = lordCrownIcon
          ;
          (((warInfoContent[territoryKey])[index]).lordCrownIcon):SetShow(false)
          local guildMaster = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "StaticText_GuildMaster_" .. index)
          CopyBaseProperty(self.guildMaster, guildMaster)
          -- DECOMPILER ERROR at PC542: Confused about usage of register: R16 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).guildMaster = guildMaster
          ;
          (((warInfoContent[territoryKey])[index]).guildMaster):SetShow(true)
          local guildWarIconBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Static_GuildWarIconBg_" .. index)
          CopyBaseProperty(self.guildWarIconBg, guildWarIconBg)
          -- DECOMPILER ERROR at PC569: Confused about usage of register: R17 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).guildWarIconBg = guildWarIconBg
          ;
          (((warInfoContent[territoryKey])[index]).guildWarIconBg):SetShow(true)
          local destroySiegeCountIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Static_DestroySiegeCountIcon_" .. index)
          CopyBaseProperty(self.destroySiegeCountIcon, destroySiegeCountIcon)
          -- DECOMPILER ERROR at PC596: Confused about usage of register: R18 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).destroySiegeCountIcon = destroySiegeCountIcon
          ;
          (((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):SetShow(true)
          local destroySiegeCountValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "StaticText_DestroySiegeCountValue_" .. index)
          CopyBaseProperty(self.destroySiegeCountValue, destroySiegeCountValue)
          -- DECOMPILER ERROR at PC623: Confused about usage of register: R19 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).destroySiegeCountValue = destroySiegeCountValue
          ;
          (((warInfoContent[territoryKey])[index]).destroySiegeCountValue):SetShow(true)
          local killCountIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Static_KillCountIcon_" .. index)
          CopyBaseProperty(self.killCountIcon, killCountIcon)
          -- DECOMPILER ERROR at PC650: Confused about usage of register: R20 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).killCountIcon = killCountIcon
          ;
          (((warInfoContent[territoryKey])[index]).killCountIcon):SetShow(true)
          local killCountValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "StaticText_KillCountValue_" .. index)
          CopyBaseProperty(self.killCountValue, killCountValue)
          -- DECOMPILER ERROR at PC677: Confused about usage of register: R21 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).killCountValue = killCountValue
          ;
          (((warInfoContent[territoryKey])[index]).killCountValue):SetShow(true)
          local deathCountIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Static_DeathCountIcon_" .. index)
          CopyBaseProperty(self.deathCountIcon, deathCountIcon)
          -- DECOMPILER ERROR at PC704: Confused about usage of register: R22 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).deathCountIcon = deathCountIcon
          ;
          (((warInfoContent[territoryKey])[index]).deathCountIcon):SetShow(true)
          local deathCountValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "StaticText_DeathCountValue_" .. index)
          CopyBaseProperty(self.deathCountValue, deathCountValue)
          -- DECOMPILER ERROR at PC731: Confused about usage of register: R23 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).deathCountValue = deathCountValue
          ;
          (((warInfoContent[territoryKey])[index]).deathCountValue):SetShow(true)
          local cannonCountIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Static_CannonCountIcon_" .. index)
          CopyBaseProperty(self.cannonCountIcon, cannonCountIcon)
          -- DECOMPILER ERROR at PC758: Confused about usage of register: R24 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).cannonCountIcon = cannonCountIcon
          ;
          (((warInfoContent[territoryKey])[index]).cannonCountIcon):SetShow(true)
          local cannonCountValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "StaticText_CannonCountValue_" .. index)
          CopyBaseProperty(self.cannonCountValue, cannonCountValue)
          -- DECOMPILER ERROR at PC785: Confused about usage of register: R25 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).cannonCountValue = cannonCountValue
          ;
          (((warInfoContent[territoryKey])[index]).cannonCountValue):SetShow(true)
          local moraleIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Static_MoraleIcon_" .. index)
          CopyBaseProperty(self.moraleIcon, moraleIcon)
          -- DECOMPILER ERROR at PC812: Confused about usage of register: R26 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).moraleIcon = moraleIcon
          ;
          (((warInfoContent[territoryKey])[index]).moraleIcon):SetShow(false)
          local moraleProgressBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Static_MoraleProgressBg_" .. index)
          CopyBaseProperty(self.moraleProgressBg, moraleProgressBg)
          -- DECOMPILER ERROR at PC839: Confused about usage of register: R27 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).moraleProgressBg = moraleProgressBg
          ;
          (((warInfoContent[territoryKey])[index]).moraleProgressBg):SetShow(false)
          local moraleProgress = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_PROGRESS2, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Progress2_MoraleProgress_" .. index)
          CopyBaseProperty(self.moraleProgress, moraleProgress)
          -- DECOMPILER ERROR at PC866: Confused about usage of register: R28 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).moraleProgress = moraleProgress
          ;
          (((warInfoContent[territoryKey])[index]).moraleProgress):SetShow(false)
          local btn_CurrentInfo = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Button_CurrentInfo_" .. index)
          CopyBaseProperty(self.btn_CurrentInfo, btn_CurrentInfo)
          -- DECOMPILER ERROR at PC893: Confused about usage of register: R29 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).btn_CurrentInfo = btn_CurrentInfo
          ;
          (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetShow(true)
          if isSiegeChannel then
            (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetIgnore(false)
          else
            ;
            (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetIgnore(true)
          end
          local btn_Cheer = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "Button_Cheer_" .. index)
          CopyBaseProperty(self.btn_Cheer, btn_Cheer)
          -- DECOMPILER ERROR at PC937: Confused about usage of register: R30 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).btn_Cheer = btn_Cheer
          ;
          (((warInfoContent[territoryKey])[index]).btn_Cheer):SetShow(false)
          ;
          (((warInfoContent[territoryKey])[index]).btn_Cheer):SetIgnore(true)
          local cheerPoint = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).occupyGuildBg, "StaticText_CheerPoint_" .. index)
          CopyBaseProperty(self.cheerPoint, cheerPoint)
          -- DECOMPILER ERROR at PC971: Confused about usage of register: R31 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index]).cheerPoint = cheerPoint
          ;
          (((warInfoContent[territoryKey])[index]).cheerPoint):SetShow(false)
        end
        do
          ;
          (((warInfoContent[territoryKey])[0]).setFree):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREE_END", "selectTerritoy", territoryName[territoryKey]))
          if isOccupyGuild then
            (((warInfoContent[territoryKey])[0]).setFreeDesc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREEDESC_END", "getName", guildWrapper:getName()))
          else
            ;
            (((warInfoContent[territoryKey])[0]).setFreeDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREEDESC"))
          end
          local index = 1
          -- DECOMPILER ERROR at PC1027: Confused about usage of register: R6 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index])._guildNo = guildWrapper:getGuildNo_s64()
          -- DECOMPILER ERROR at PC1033: Confused about usage of register: R6 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index])._guildName = guildWrapper:getName()
          -- DECOMPILER ERROR at PC1039: Confused about usage of register: R6 in 'UnsetPending'

          ;
          ((warInfoContent[territoryKey])[index])._guildMaster = guildWrapper:getGuildMasterName()
          local currentGuildWrapper = ToClient_GetGuildInfoWrapperByGuildNo(guildWrapper:getGuildNo_s64())
          -- DECOMPILER ERROR at PC1054: Confused about usage of register: R7 in 'UnsetPending'

          if isGameTypeKorea() then
            ((warInfoContent[territoryKey])[index])._destroySiegeCountValue = currentGuildWrapper:getTotalSiegeCount(0)
            -- DECOMPILER ERROR at PC1061: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((warInfoContent[territoryKey])[index])._killCountValue = currentGuildWrapper:getTotalSiegeCount(1)
            -- DECOMPILER ERROR at PC1068: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((warInfoContent[territoryKey])[index])._deathCountValue = currentGuildWrapper:getTotalSiegeCount(2)
            -- DECOMPILER ERROR at PC1075: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((warInfoContent[territoryKey])[index])._cannonCountValue = currentGuildWrapper:getTotalSiegeCount(3)
          else
            for gmIndex = 0, currentGuildWrapper:getMemberCount() - 1 do
              local guildMemberData = currentGuildWrapper:getMember(gmIndex)
              -- DECOMPILER ERROR at PC1102: Confused about usage of register: R12 in 'UnsetPending'

              ;
              ((warInfoContent[territoryKey])[index])._destroySiegeCountValue = ((warInfoContent[territoryKey])[index])._destroySiegeCountValue + guildMemberData:commandPostCount() + guildMemberData:towerCount() + guildMemberData:gateCount()
              -- DECOMPILER ERROR at PC1119: Confused about usage of register: R12 in 'UnsetPending'

              ;
              ((warInfoContent[territoryKey])[index])._killCountValue = ((warInfoContent[territoryKey])[index])._killCountValue + guildMemberData:guildMasterCount() + guildMemberData:squadLeaderCount() + guildMemberData:squadMemberCount()
              -- DECOMPILER ERROR at PC1130: Confused about usage of register: R12 in 'UnsetPending'

              ;
              ((warInfoContent[territoryKey])[index])._deathCountValue = ((warInfoContent[territoryKey])[index])._deathCountValue + guildMemberData:deathCount()
              -- DECOMPILER ERROR at PC1141: Confused about usage of register: R12 in 'UnsetPending'

              ;
              ((warInfoContent[territoryKey])[index])._cannonCountValue = ((warInfoContent[territoryKey])[index])._cannonCountValue + guildMemberData:summonedCount()
            end
          end
          do
            ;
            (((warInfoContent[territoryKey])[index]).guildMaster):SetText(((warInfoContent[territoryKey])[index])._guildMaster)
            -- DECOMPILER ERROR at PC1158: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((warInfoContent[territoryKey])[index])._guildMp = currentGuildWrapper:getGuildMp()
            local isSet = setGuildTextureByGuildNo(((warInfoContent[territoryKey])[index])._guildNo, ((warInfoContent[territoryKey])[index]).guildMark)
            if isSet == false then
              (((warInfoContent[territoryKey])[index]).guildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(((warInfoContent[territoryKey])[index]).guildMark, 183, 1, 188, 6)
              ;
              ((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (((warInfoContent[territoryKey])[index]).guildMark):setRenderTexture((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture())
            else
              do
                ;
                ((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture()):setUV(0, 0, 1, 1)
                ;
                (((warInfoContent[territoryKey])[index]).guildMark):setRenderTexture((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture())
                ;
                (((warInfoContent[territoryKey])[index]).guildName):SetText(((warInfoContent[territoryKey])[index])._guildName)
                occupyGuildWrapper = ToClient_GetOccupyGuildWrapper(territoryKey)
                -- DECOMPILER ERROR at PC1269: Unhandled construct in 'MakeBoolean' P1

                if occupyGuildWrapper ~= nil and ((warInfoContent[territoryKey])[index])._guildNo == occupyGuildWrapper:getGuildNo_s64() then
                  (((warInfoContent[territoryKey])[index]).lordCrownIcon):SetShow(true)
                  ;
                  (((warInfoContent[territoryKey])[index]).guildName):SetPosX((((warInfoContent[territoryKey])[index]).lordCrownIcon):GetPosX() + (((warInfoContent[territoryKey])[index]).lordCrownIcon):GetSizeX() + 5)
                  ;
                  (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetIgnore(false)
                end
                ;
                (((warInfoContent[territoryKey])[index]).guildMaster):SetText("??????")
                ;
                (((warInfoContent[territoryKey])[index]).guildName):SetText("????????")
                ;
                (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetIgnore(true)
                ;
                (((warInfoContent[territoryKey])[index]).guildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
                do
                  local x1, y1, x2, y2 = setTextureUV_Func(((warInfoContent[territoryKey])[index]).guildMark, 183, 1, 188, 6)
                  ;
                  ((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (((warInfoContent[territoryKey])[index]).guildMark):setRenderTexture((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture())
                  ;
                  (((warInfoContent[territoryKey])[index]).destroySiegeCountValue):SetText(((warInfoContent[territoryKey])[index])._destroySiegeCountValue)
                  ;
                  (((warInfoContent[territoryKey])[index]).killCountValue):SetText(((warInfoContent[territoryKey])[index])._killCountValue)
                  ;
                  (((warInfoContent[territoryKey])[index]).deathCountValue):SetText(((warInfoContent[territoryKey])[index])._deathCountValue)
                  ;
                  (((warInfoContent[territoryKey])[index]).cannonCountValue):SetText(((warInfoContent[territoryKey])[index])._cannonCountValue)
                  local currentGuildMp = currentGuildWrapper:getGuildMp()
                  -- DECOMPILER ERROR at PC1411: Confused about usage of register: R9 in 'UnsetPending'

                  if ((warInfoContent[territoryKey])[index])._guildMp ~= currentGuildMp then
                    ((warInfoContent[territoryKey])[index])._guildMp = currentGuildMp
                  end
                  ;
                  (((warInfoContent[territoryKey])[index]).moraleProgress):SetAniSpeed(0)
                  ;
                  (((warInfoContent[territoryKey])[index]).moraleProgress):SetProgressRate(((warInfoContent[territoryKey])[index])._guildMp / 1500 * 100)
                  do
                    local msg = GuildMp_Check(0, territoryKey)
                    ;
                    (((warInfoContent[territoryKey])[index]).cheerPoint):SetText(msg)
                    ;
                    (((warInfoContent[territoryKey])[index]).cheerPoint):SetPosX((((warInfoContent[territoryKey])[index]).moraleIcon):GetPosX() + (((warInfoContent[territoryKey])[index]).moraleIcon):GetSizeX() + 5)
                    ;
                    (self.frame_content):SetSize((self.frame_content):GetSizeX(), (warInfo_Main.frame_SiegeInfo):GetSizeY())
                    ;
                    (warInfo_Main.frame_SiegeInfo):UpdateContentScroll()
                    ;
                    (self._scroll):SetControlTop()
                    ;
                    (warInfo_Main.frame_SiegeInfo):UpdateContentPos()
                    ;
                    (self._scroll):SetShow(false)
                    ;
                    (warInfo_Content._battleGuildText):SetShow(isSiegeBeing(territoryKey))
                    ;
                    (warInfo_Main.frame_SiegeInfo):UpdateContentPos()
                    ;
                    (self._scroll):SetControlTop()
                    ;
                    (self._scroll):SetShow(false)
                    ;
                    (((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 1 .. ")")
                    ;
                    (((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                    ;
                    (((warInfoContent[territoryKey])[index]).killCountIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 2 .. ")")
                    ;
                    (((warInfoContent[territoryKey])[index]).killCountIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                    ;
                    (((warInfoContent[territoryKey])[index]).deathCountIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 3 .. ")")
                    ;
                    (((warInfoContent[territoryKey])[index]).deathCountIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                    ;
                    (((warInfoContent[territoryKey])[index]).cannonCountIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 4 .. ")")
                    ;
                    (((warInfoContent[territoryKey])[index]).cannonCountIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                    ;
                    (((warInfoContent[territoryKey])[index]).moraleIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 5 .. ")")
                    ;
                    (((warInfoContent[territoryKey])[index]).moraleIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                    ;
                    (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):addInputEvent("Mouse_LUp", "HandleClicked_GuildScore(" .. territoryKey .. ", " .. index .. ")")
                    ;
                    (((warInfoContent[territoryKey])[index]).btn_Cheer):addInputEvent("Mouse_LUp", "HandleClicked_Cheer(" .. territoryKey .. ", " .. index .. ")")
                    do return  end
                    if battleGuildCount[territoryKey] > 1 then
                      local index = 0
                      local startIndex = 0
                      local lastIndex = battleGuildCount[territoryKey]
                      if controlReGenerate == true then
                        if isSiegeBeing(territoryKey) == false then
                          local index = 0
                          local contentBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.frame_content, "Static_WarInfoContent_" .. index)
                          CopyBaseProperty(self.contentBg, contentBg)
                          -- DECOMPILER ERROR at PC1681: Confused about usage of register: R8 in 'UnsetPending'

                          ;
                          ((warInfoContent[territoryKey])[index]).contentBg = contentBg
                          ;
                          (((warInfoContent[territoryKey])[index]).contentBg):SetPosY(gapY)
                          ;
                          (((warInfoContent[territoryKey])[index]).contentBg):SetShow(true)
                          local setFree = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_setFree_" .. index)
                          CopyBaseProperty(self.setFree, setFree)
                          -- DECOMPILER ERROR at PC1715: Confused about usage of register: R9 in 'UnsetPending'

                          ;
                          ((warInfoContent[territoryKey])[index]).setFree = setFree
                          ;
                          (((warInfoContent[territoryKey])[index]).setFree):SetShow(true)
                          if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
                            (((warInfoContent[territoryKey])[index]).setFree):SetPosY(10)
                          end
                          local setFreeDesc = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_setFreeDesc_" .. index)
                          CopyBaseProperty(self.setFreeDesc, setFreeDesc)
                          -- DECOMPILER ERROR at PC1755: Confused about usage of register: R10 in 'UnsetPending'

                          ;
                          ((warInfoContent[territoryKey])[index]).setFreeDesc = setFreeDesc
                          ;
                          (((warInfoContent[territoryKey])[index]).setFreeDesc):SetShow(true)
                          local guildWrapper = ToClient_GetOccupyGuildWrapper(territoryKey)
                          if guildWrapper == nil then
                            (((warInfoContent[territoryKey])[index]).setFree):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREE", "selectTerritoy", territoryName[territoryKey]))
                            ;
                            (((warInfoContent[territoryKey])[index]).setFreeDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREEDESC"))
                          else
                            ;
                            (((warInfoContent[territoryKey])[index]).setFree):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREE_END", "selectTerritoy", territoryName[territoryKey]))
                            ;
                            (((warInfoContent[territoryKey])[index]).setFreeDesc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREEDESC_END", "getName", guildWrapper:getName()))
                          end
                          startIndex = 1
                          lastIndex = battleGuildCount[territoryKey] + 1
                          if lastIndex <= 3 then
                            (((warInfoContent[territoryKey])[index]).contentBg):SetPosX(10)
                          end
                        end
                        do
                          for index = startIndex, lastIndex - 1 do
                            local contentBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.frame_content, "Static_WarInfoContent_" .. index)
                            CopyBaseProperty(self.contentBg, contentBg)
                            -- DECOMPILER ERROR at PC1855: Confused about usage of register: R11 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).contentBg = contentBg
                            ;
                            (((warInfoContent[territoryKey])[index]).contentBg):SetPosY(((((warInfoContent[territoryKey])[index]).contentBg):GetSizeY() + gapY) * index + gapY)
                            ;
                            (((warInfoContent[territoryKey])[index]).contentBg):SetShow(false)
                            if lastIndex < 4 then
                              (((warInfoContent[territoryKey])[index]).contentBg):SetPosX(10)
                            end
                            local guildMarkBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_GuildMarkBg_" .. index)
                            CopyBaseProperty(self.guildMarkBg, guildMarkBg)
                            -- DECOMPILER ERROR at PC1908: Confused about usage of register: R12 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).guildMarkBg = guildMarkBg
                            ;
                            (((warInfoContent[territoryKey])[index]).guildMarkBg):SetShow(true)
                            local guildMark = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_GuildMark_" .. index)
                            CopyBaseProperty(self.guildMark, guildMark)
                            -- DECOMPILER ERROR at PC1935: Confused about usage of register: R13 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).guildMark = guildMark
                            ;
                            (((warInfoContent[territoryKey])[index]).guildMark):SetShow(true)
                            local guildName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_GuildName_" .. index)
                            CopyBaseProperty(self.guildName, guildName)
                            -- DECOMPILER ERROR at PC1962: Confused about usage of register: R14 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).guildName = guildName
                            ;
                            (((warInfoContent[territoryKey])[index]).guildName):SetShow(true)
                            local lordCrownIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_LordIcon")
                            CopyBaseProperty(self.lordCrownIcon, lordCrownIcon)
                            -- DECOMPILER ERROR at PC1987: Confused about usage of register: R15 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).lordCrownIcon = lordCrownIcon
                            ;
                            (((warInfoContent[territoryKey])[index]).lordCrownIcon):SetShow(false)
                            local guildMaster = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_GuildMaster_" .. index)
                            CopyBaseProperty(self.guildMaster, guildMaster)
                            -- DECOMPILER ERROR at PC2014: Confused about usage of register: R16 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).guildMaster = guildMaster
                            ;
                            (((warInfoContent[territoryKey])[index]).guildMaster):SetShow(true)
                            local guildWarIconBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_GuildWarIconBg_" .. index)
                            CopyBaseProperty(self.guildWarIconBg, guildWarIconBg)
                            -- DECOMPILER ERROR at PC2041: Confused about usage of register: R17 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).guildWarIconBg = guildWarIconBg
                            ;
                            (((warInfoContent[territoryKey])[index]).guildWarIconBg):SetShow(true)
                            local siegeEnduranceIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_SiegeEnduranceIcon_" .. index)
                            CopyBaseProperty(self.siegeEnduranceIcon, siegeEnduranceIcon)
                            -- DECOMPILER ERROR at PC2068: Confused about usage of register: R18 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).siegeEnduranceIcon = siegeEnduranceIcon
                            ;
                            (((warInfoContent[territoryKey])[index]).siegeEnduranceIcon):SetShow(true)
                            local siegeEnduranceValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_SiegeEnduranceValue_" .. index)
                            CopyBaseProperty(self.siegeEnduranceValue, siegeEnduranceValue)
                            -- DECOMPILER ERROR at PC2095: Confused about usage of register: R19 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).siegeEnduranceValue = siegeEnduranceValue
                            ;
                            (((warInfoContent[territoryKey])[index]).siegeEnduranceValue):SetShow(true)
                            local destroySiegeCountIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_DestroySiegeCountIcon_" .. index)
                            CopyBaseProperty(self.destroySiegeCountIcon, destroySiegeCountIcon)
                            -- DECOMPILER ERROR at PC2122: Confused about usage of register: R20 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).destroySiegeCountIcon = destroySiegeCountIcon
                            ;
                            (((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):SetShow(true)
                            local destroySiegeCountValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_DestroySiegeCountValue_" .. index)
                            CopyBaseProperty(self.destroySiegeCountValue, destroySiegeCountValue)
                            -- DECOMPILER ERROR at PC2149: Confused about usage of register: R21 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).destroySiegeCountValue = destroySiegeCountValue
                            ;
                            (((warInfoContent[territoryKey])[index]).destroySiegeCountValue):SetShow(true)
                            local killCountIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_KillCountIcon_" .. index)
                            CopyBaseProperty(self.killCountIcon, killCountIcon)
                            -- DECOMPILER ERROR at PC2176: Confused about usage of register: R22 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).killCountIcon = killCountIcon
                            ;
                            (((warInfoContent[territoryKey])[index]).killCountIcon):SetShow(true)
                            local killCountValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_KillCountValue_" .. index)
                            CopyBaseProperty(self.killCountValue, killCountValue)
                            -- DECOMPILER ERROR at PC2203: Confused about usage of register: R23 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).killCountValue = killCountValue
                            ;
                            (((warInfoContent[territoryKey])[index]).killCountValue):SetShow(true)
                            local deathCountIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_DeathCountIcon_" .. index)
                            CopyBaseProperty(self.deathCountIcon, deathCountIcon)
                            -- DECOMPILER ERROR at PC2230: Confused about usage of register: R24 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).deathCountIcon = deathCountIcon
                            ;
                            (((warInfoContent[territoryKey])[index]).deathCountIcon):SetShow(true)
                            local deathCountValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_DeathCountValue_" .. index)
                            CopyBaseProperty(self.deathCountValue, deathCountValue)
                            -- DECOMPILER ERROR at PC2257: Confused about usage of register: R25 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).deathCountValue = deathCountValue
                            ;
                            (((warInfoContent[territoryKey])[index]).deathCountValue):SetShow(true)
                            local cannonCountIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_CannonCountIcon_" .. index)
                            CopyBaseProperty(self.cannonCountIcon, cannonCountIcon)
                            -- DECOMPILER ERROR at PC2284: Confused about usage of register: R26 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).cannonCountIcon = cannonCountIcon
                            ;
                            (((warInfoContent[territoryKey])[index]).cannonCountIcon):SetShow(true)
                            local cannonCountValue = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_CannonCountValue_" .. index)
                            CopyBaseProperty(self.cannonCountValue, cannonCountValue)
                            -- DECOMPILER ERROR at PC2311: Confused about usage of register: R27 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).cannonCountValue = cannonCountValue
                            ;
                            (((warInfoContent[territoryKey])[index]).cannonCountValue):SetShow(true)
                            local moraleIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_MoraleIcon_" .. index)
                            CopyBaseProperty(self.moraleIcon, moraleIcon)
                            -- DECOMPILER ERROR at PC2338: Confused about usage of register: R28 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).moraleIcon = moraleIcon
                            ;
                            (((warInfoContent[territoryKey])[index]).moraleIcon):SetShow(false)
                            local moraleProgressBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, ((warInfoContent[territoryKey])[index]).contentBg, "Static_MoraleProgressBg_" .. index)
                            CopyBaseProperty(self.moraleProgressBg, moraleProgressBg)
                            -- DECOMPILER ERROR at PC2365: Confused about usage of register: R29 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).moraleProgressBg = moraleProgressBg
                            ;
                            (((warInfoContent[territoryKey])[index]).moraleProgressBg):SetShow(false)
                            local moraleProgress = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_PROGRESS2, ((warInfoContent[territoryKey])[index]).contentBg, "Progress2_MoraleProgress_" .. index)
                            CopyBaseProperty(self.moraleProgress, moraleProgress)
                            -- DECOMPILER ERROR at PC2392: Confused about usage of register: R30 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).moraleProgress = moraleProgress
                            ;
                            (((warInfoContent[territoryKey])[index]).moraleProgress):SetShow(false)
                            ;
                            (((warInfoContent[territoryKey])[index]).moraleProgress):SetAniSpeed(0)
                            ;
                            (((warInfoContent[territoryKey])[index]).moraleProgress):SetProgressRate(0)
                            local btn_CurrentInfo = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, ((warInfoContent[territoryKey])[index]).contentBg, "Button_CurrentInfo_" .. index)
                            CopyBaseProperty(self.btn_CurrentInfo, btn_CurrentInfo)
                            -- DECOMPILER ERROR at PC2433: Confused about usage of register: R31 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).btn_CurrentInfo = btn_CurrentInfo
                            ;
                            (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetShow(true)
                            if isSiegeChannel then
                              (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetIgnore(false)
                            else
                              ;
                              (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetIgnore(true)
                            end
                            local btn_Cheer = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, ((warInfoContent[territoryKey])[index]).contentBg, "Button_Cheer_" .. index)
                            CopyBaseProperty(self.btn_Cheer, btn_Cheer)
                            -- DECOMPILER ERROR at PC2477: Confused about usage of register: R32 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).btn_Cheer = btn_Cheer
                            ;
                            (((warInfoContent[territoryKey])[index]).btn_Cheer):SetShow(false)
                            local cheerPoint = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ((warInfoContent[territoryKey])[index]).contentBg, "StaticText_CheerPoint_" .. index)
                            CopyBaseProperty(self.cheerPoint, cheerPoint)
                            -- DECOMPILER ERROR at PC2504: Confused about usage of register: R33 in 'UnsetPending'

                            ;
                            ((warInfoContent[territoryKey])[index]).cheerPoint = cheerPoint
                            ;
                            (((warInfoContent[territoryKey])[index]).cheerPoint):SetShow(false)
                            ;
                            (((warInfoContent[territoryKey])[index]).cheerPoint):SetPosX((((warInfoContent[territoryKey])[index]).moraleIcon):GetPosX() + (((warInfoContent[territoryKey])[index]).moraleIcon):GetSizeX() + 5)
                          end
                          do
                            if isSiegeBeing(territoryKey) == false then
                              startIndex = 1
                              lastIndex = battleGuildCount[territoryKey] + 1
                            else
                              startIndex = 0
                              lastIndex = battleGuildCount[territoryKey]
                            end
                            eliminatedGuildCount = 0
                            local siegeGuildIndex = 0
                            for index = startIndex, lastIndex - 1 do
                              local guildWrapper = ToClient_SiegeGuildAt(territoryKey, siegeGuildIndex)
                              local siegeBuildingInfo = ToClient_SiegeGuildBuildingInfoAt(territoryKey, siegeGuildIndex)
                              if guildWrapper == nil then
                                return 
                              end
                              if siegeBuildingInfo:isEnterSiege() == false then
                                index = lastIndex - 1 - eliminatedGuildCount
                                eliminatedGuildCount = eliminatedGuildCount + 1
                              else
                                index = index - eliminatedGuildCount
                              end
                              local _destroySiegeCountValue = 0
                              local _killCountValue = 0
                              local _deathCountValue = 0
                              local _cannonCountValue = 0
                              local destroySiegeCountEffect = false
                              local killCountEffect = false
                              local deathCountEffect = false
                              local cannonCountEffect = false
                              -- DECOMPILER ERROR at PC2590: Confused about usage of register: R21 in 'UnsetPending'

                              ;
                              ((warInfoContent[territoryKey])[index])._guildNo = guildWrapper:getGuildNo_s64()
                              -- DECOMPILER ERROR at PC2596: Confused about usage of register: R21 in 'UnsetPending'

                              ;
                              ((warInfoContent[territoryKey])[index])._guildName = guildWrapper:getName()
                              -- DECOMPILER ERROR at PC2602: Confused about usage of register: R21 in 'UnsetPending'

                              ;
                              ((warInfoContent[territoryKey])[index])._guildMaster = guildWrapper:getGuildMasterName()
                              -- DECOMPILER ERROR at PC2609: Confused about usage of register: R21 in 'UnsetPending'

                              ;
                              ((warInfoContent[territoryKey])[index])._siegeEnduranceValue = siegeBuildingInfo:getRemainHp() / 10000
                              local currentGuildWrapper = ToClient_GetGuildInfoWrapperByGuildNo(guildWrapper:getGuildNo_s64())
                              if isGameTypeKorea() then
                                _destroySiegeCountValue = currentGuildWrapper:getTotalSiegeCount(0)
                                _killCountValue = currentGuildWrapper:getTotalSiegeCount(1)
                                _deathCountValue = currentGuildWrapper:getTotalSiegeCount(2)
                                _cannonCountValue = currentGuildWrapper:getTotalSiegeCount(3)
                              else
                                for gmIndex = 0, currentGuildWrapper:getMemberCount() - 1 do
                                  local guildMemberData = currentGuildWrapper:getMember(gmIndex)
                                  _destroySiegeCountValue = _destroySiegeCountValue + guildMemberData:commandPostCount() + guildMemberData:towerCount() + guildMemberData:gateCount()
                                  _killCountValue = _killCountValue + guildMemberData:guildMasterCount() + guildMemberData:squadLeaderCount() + guildMemberData:squadMemberCount()
                                  _deathCountValue = _deathCountValue + guildMemberData:deathCount()
                                  _cannonCountValue = _cannonCountValue + guildMemberData:summonedCount()
                                end
                              end
                              do
                                -- DECOMPILER ERROR at PC2678: Confused about usage of register: R22 in 'UnsetPending'

                                if _destroySiegeCountValue ~= ((warInfoContent[territoryKey])[index])._destroySiegeCountValue then
                                  ((warInfoContent[territoryKey])[index])._destroySiegeCountValue = _destroySiegeCountValue
                                  destroySiegeCountEffect = true
                                end
                                -- DECOMPILER ERROR at PC2689: Confused about usage of register: R22 in 'UnsetPending'

                                if _killCountValue ~= ((warInfoContent[territoryKey])[index])._killCountValue then
                                  ((warInfoContent[territoryKey])[index])._killCountValue = _killCountValue
                                  killCountEffect = true
                                end
                                -- DECOMPILER ERROR at PC2700: Confused about usage of register: R22 in 'UnsetPending'

                                if _deathCountValue ~= ((warInfoContent[territoryKey])[index])._deathCountValue then
                                  ((warInfoContent[territoryKey])[index])._deathCountValue = _deathCountValue
                                  deathCountEffect = true
                                end
                                -- DECOMPILER ERROR at PC2711: Confused about usage of register: R22 in 'UnsetPending'

                                if _cannonCountValue ~= ((warInfoContent[territoryKey])[index])._cannonCountValue then
                                  ((warInfoContent[territoryKey])[index])._cannonCountValue = _cannonCountValue
                                  cannonCountEffect = true
                                end
                                local isSet = setGuildTextureByGuildNo(((warInfoContent[territoryKey])[index])._guildNo, ((warInfoContent[territoryKey])[index]).guildMark)
                                if isSet == false then
                                  (((warInfoContent[territoryKey])[index]).guildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
                                  local x1, y1, x2, y2 = setTextureUV_Func(((warInfoContent[territoryKey])[index]).guildMark, 183, 1, 188, 6)
                                  ;
                                  ((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  (((warInfoContent[territoryKey])[index]).guildMark):setRenderTexture((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture())
                                else
                                  do
                                    ;
                                    ((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture()):setUV(0, 0, 1, 1)
                                    ;
                                    (((warInfoContent[territoryKey])[index]).guildMark):setRenderTexture((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture())
                                    ;
                                    (((warInfoContent[territoryKey])[index]).guildName):SetText(((warInfoContent[territoryKey])[index])._guildName)
                                    ;
                                    (((warInfoContent[territoryKey])[index]).guildMaster):SetText(((warInfoContent[territoryKey])[index])._guildMaster)
                                    local occupyGuildWrapper = ToClient_GetOccupyGuildWrapper(territoryKey)
                                    ;
                                    (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetIgnore(false)
                                    if occupyGuildWrapper ~= nil then
                                      if ((warInfoContent[territoryKey])[index])._guildNo == occupyGuildWrapper:getGuildNo_s64() then
                                        (((warInfoContent[territoryKey])[index]).lordCrownIcon):SetShow(true)
                                        ;
                                        (((warInfoContent[territoryKey])[index]).guildName):SetPosX((((warInfoContent[territoryKey])[index]).lordCrownIcon):GetPosX() + (((warInfoContent[territoryKey])[index]).lordCrownIcon):GetSizeX() + 5)
                                      else
                                        if isSiegeBeing(territoryKey) == false then
                                          (((warInfoContent[territoryKey])[index]).guildName):SetText("????????")
                                          ;
                                          (((warInfoContent[territoryKey])[index]).guildMaster):SetText("??????")
                                          ;
                                          (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetIgnore(true)
                                          ;
                                          (((warInfoContent[territoryKey])[index]).guildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
                                          local x1, y1, x2, y2 = setTextureUV_Func(((warInfoContent[territoryKey])[index]).guildMark, 183, 1, 188, 6)
                                          ;
                                          ((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
                                          ;
                                          (((warInfoContent[territoryKey])[index]).guildMark):setRenderTexture((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture())
                                        end
                                      end
                                    else
                                      do
                                        if isSiegeBeing(territoryKey) == false then
                                          (((warInfoContent[territoryKey])[index]).guildName):SetText("????????")
                                          ;
                                          (((warInfoContent[territoryKey])[index]).guildMaster):SetText("??????")
                                          ;
                                          (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):SetIgnore(true)
                                          ;
                                          (((warInfoContent[territoryKey])[index]).guildMark):ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
                                          local x1, y1, x2, y2 = setTextureUV_Func(((warInfoContent[territoryKey])[index]).guildMark, 183, 1, 188, 6)
                                          ;
                                          ((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture()):setUV(x1, y1, x2, y2)
                                          ;
                                          (((warInfoContent[territoryKey])[index]).guildMark):setRenderTexture((((warInfoContent[territoryKey])[index]).guildMark):getBaseTexture())
                                        end
                                        do
                                          ;
                                          (((warInfoContent[territoryKey])[index]).siegeEnduranceValue):SetText((string.format)("%.1f", ((warInfoContent[territoryKey])[index])._siegeEnduranceValue) .. "%")
                                          if destroySiegeCountEffect == true then
                                            (((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):EraseAllEffect()
                                            ;
                                            (((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):AddEffect("UI_GuildWar_ArrowMark01", false, 0, 0)
                                          end
                                          ;
                                          (((warInfoContent[territoryKey])[index]).destroySiegeCountValue):SetText(_destroySiegeCountValue)
                                          if killCountEffect == true then
                                            (((warInfoContent[territoryKey])[index]).killCountIcon):EraseAllEffect()
                                            ;
                                            (((warInfoContent[territoryKey])[index]).killCountIcon):AddEffect("UI_GuildWar_ArrowMark01", false, 0, 0)
                                          end
                                          ;
                                          (((warInfoContent[territoryKey])[index]).killCountValue):SetText(_killCountValue)
                                          if deathCountEffect == true then
                                            (((warInfoContent[territoryKey])[index]).deathCountIcon):EraseAllEffect()
                                            ;
                                            (((warInfoContent[territoryKey])[index]).deathCountIcon):AddEffect("UI_GuildWar_ArrowMark01", false, 0, 0)
                                          end
                                          ;
                                          (((warInfoContent[territoryKey])[index]).deathCountValue):SetText(_deathCountValue)
                                          if cannonCountEffect == true then
                                            (((warInfoContent[territoryKey])[index]).cannonCountIcon):EraseAllEffect()
                                            ;
                                            (((warInfoContent[territoryKey])[index]).cannonCountIcon):AddEffect("UI_GuildWar_ArrowMark01", false, 0, 0)
                                          end
                                          ;
                                          (((warInfoContent[territoryKey])[index]).cannonCountValue):SetText(_cannonCountValue)
                                          local currentGuildMp = currentGuildWrapper:getGuildMp()
                                          -- DECOMPILER ERROR at PC3121: Confused about usage of register: R25 in 'UnsetPending'

                                          if ((warInfoContent[territoryKey])[index])._guildMp ~= currentGuildMp then
                                            ((warInfoContent[territoryKey])[index])._guildMp = currentGuildMp
                                          end
                                          ;
                                          (((warInfoContent[territoryKey])[index]).moraleProgress):SetProgressRate(((warInfoContent[territoryKey])[index])._guildMp / 1500 * 100)
                                          -- DECOMPILER ERROR at PC3157: Unhandled construct in 'MakeBoolean' P3

                                          if (isSiegeEnd() == false and siegeBuildingInfo:isEnterSiege() == false) or isSiegeBeing(territoryKey) == false then
                                            (((warInfoContent[territoryKey])[index]).btn_Cheer):SetIgnore(true)
                                          else
                                            ;
                                            (((warInfoContent[territoryKey])[index]).btn_Cheer):SetIgnore(false)
                                          end
                                          ;
                                          (((warInfoContent[territoryKey])[index]).contentBg):SetShow(true)
                                          do
                                            local msg = GuildMp_Check(siegeGuildIndex, territoryKey)
                                            ;
                                            (((warInfoContent[territoryKey])[index]).cheerPoint):SetText(msg)
                                            if siegeBuildingInfo:isEnterSiege() == false then
                                              (((warInfoContent[territoryKey])[index]).contentBg):SetMonoTone(true)
                                              ;
                                              (((warInfoContent[territoryKey])[index]).siegeEnduranceValue):SetText((string.format)("%.1f", 0) .. "%")
                                            else
                                              ;
                                              (((warInfoContent[territoryKey])[index]).contentBg):SetMonoTone(false)
                                            end
                                            ;
                                            (((warInfoContent[territoryKey])[index]).siegeEnduranceIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 0 .. ")")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).siegeEnduranceIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 1 .. ")")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).killCountIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 2 .. ")")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).killCountIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).deathCountIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 3 .. ")")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).deathCountIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).cannonCountIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 4 .. ")")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).cannonCountIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).moraleIcon):addInputEvent("Mouse_On", "Panel_GuildWarInfo_Icon_ToolTip_Show(" .. territoryKey .. ", " .. index .. ", " .. 5 .. ")")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).moraleIcon):addInputEvent("Mouse_Out", "Panel_GuildWarInfo_Icon_ToolTip_Show()")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).btn_CurrentInfo):addInputEvent("Mouse_LUp", "HandleClicked_GuildScore(" .. territoryKey .. ", " .. index .. ")")
                                            ;
                                            (((warInfoContent[territoryKey])[index]).btn_Cheer):addInputEvent("Mouse_LUp", "HandleClicked_Cheer(" .. territoryKey .. ", " .. index .. ")")
                                            siegeGuildIndex = siegeGuildIndex + 1
                                            -- DECOMPILER ERROR at PC3381: LeaveBlock: unexpected jumping out DO_STMT

                                            -- DECOMPILER ERROR at PC3381: LeaveBlock: unexpected jumping out DO_STMT

                                            -- DECOMPILER ERROR at PC3381: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                            -- DECOMPILER ERROR at PC3381: LeaveBlock: unexpected jumping out IF_STMT

                                            -- DECOMPILER ERROR at PC3381: LeaveBlock: unexpected jumping out DO_STMT

                                            -- DECOMPILER ERROR at PC3381: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                            -- DECOMPILER ERROR at PC3381: LeaveBlock: unexpected jumping out IF_STMT

                                            -- DECOMPILER ERROR at PC3381: LeaveBlock: unexpected jumping out DO_STMT

                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                            ;
                            (warInfo_Main.frame_SiegeInfo):UpdateContentScroll()
                            if guildWarInfo_ShowCheck == true then
                              (self._scroll):SetControlTop()
                              guildWarInfo_ShowCheck = false
                            end
                            ;
                            (warInfo_Main.frame_SiegeInfo):UpdateContentPos()
                            if lastIndex > 3 then
                              (self._scroll):SetShow(true)
                              ;
                              (self.frame_content):SetSize((self.frame_content):GetSizeX(), (self.contentBg):GetSizeY() + (((warInfoContent[territoryKey])[lastIndex - 1]).contentBg):GetPosY() + gapY)
                            else
                              ;
                              (self._scroll):SetShow(false)
                              ;
                              (self.frame_content):SetSize((self.frame_content):GetSizeX(), (warInfo_Main.frame_SiegeInfo):GetSizeY())
                              ;
                              (self.frame_content):SetPosY(0)
                              ;
                              (self._scroll):SetControlTop()
                            end
                            do
                              local leftGuildCount = battleGuildCount[territoryKey] - eliminatedGuildCount
                              ;
                              (warInfo_Content._battleGuildText):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_LEFT_GUILD_COUNT", "leftGuildCount", leftGuildCount))
                              ;
                              (warInfo_Content._battleGuildText):SetShow(isSiegeBeing(territoryKey))
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
  end
end

isSiegeEnd = function()
  -- function num : 0_5 , upvalues : siegingAreaCount
  local _isSiegeBeing = false
  for territoryIndex = 0, siegingAreaCount - 1 do
    if not _isSiegeBeing then
      _isSiegeBeing = isSiegeBeing(territoryIndex)
    end
  end
  return not _isSiegeBeing
end

local _logIndex = 0
local _logCount = 0
local viewalbeCount = 3
local maxLogCount = 50
local textGap = 15
local defaultLogFrameSize = (log_Content.frame_content):GetSizeY()
GuildMp_Check = function(index, territoryKey)
  -- function num : 0_6 , upvalues : guildMpCheck
  local msg = ""
  local guildMpGrade = 0
  local guildWrapper = ToClient_SiegeGuildAt(territoryKey, index)
  do
    if guildWrapper ~= nil then
      local guildMp = guildWrapper:getGuildMp()
      if guildMp < 300 then
        guildMpGrade = 0
      else
        if guildMp >= 300 and guildMp < 600 then
          guildMpGrade = 1
        else
          if guildMp >= 600 and guildMp < 900 then
            guildMpGrade = 2
          else
            if guildMp > 900 and guildMp < 1200 then
              guildMpGrade = 3
            else
              if guildMp > 1200 and guildMp < 1500 then
                guildMpGrade = 4
              else
                if guildMp >= 1500 then
                  guildMpGrade = 5
                end
              end
            end
          end
        end
      end
    end
    -- DECOMPILER ERROR at PC53: Confused about usage of register: R5 in 'UnsetPending'

    if (guildMpCheck[territoryKey])[index] ~= nil then
      if guildMpGrade < (guildMpCheck[territoryKey])[index] then
        (guildMpCheck[territoryKey])[index] = guildMpGrade
      else
        -- DECOMPILER ERROR at PC62: Confused about usage of register: R5 in 'UnsetPending'

        if (guildMpCheck[territoryKey])[index] < guildMpGrade then
          (guildMpCheck[territoryKey])[index] = guildMpGrade
        end
      end
    end
    msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_GUILDMPCHECK_MSG", "guildMpGrade", guildMpGrade)
    return msg
  end
end

local guildScore = {}
for territoryIndex = 0, siegingAreaCount - 1 do
  -- DECOMPILER ERROR at PC580: Confused about usage of register: R40 in 'UnsetPending'

  (guildScore.destroyBuildCount)[territoryIndex] = {}
  -- DECOMPILER ERROR at PC583: Confused about usage of register: R40 in 'UnsetPending'

  ;
  (guildScore.killPlayerCount)[territoryIndex] = {}
  -- DECOMPILER ERROR at PC586: Confused about usage of register: R40 in 'UnsetPending'

  ;
  (guildScore.deathCount)[territoryIndex] = {}
  -- DECOMPILER ERROR at PC589: Confused about usage of register: R40 in 'UnsetPending'

  ;
  (guildScore.killServantCount)[territoryIndex] = {}
  -- DECOMPILER ERROR at PC592: Confused about usage of register: R40 in 'UnsetPending'

  ;
  (guildScore.guildMp)[territoryIndex] = {}
end
Panel_GuildWarInfo_Icon_ToolTip_Show = function(territoryKey, index, iconType)
  -- function num : 0_7 , upvalues : warInfo_Content, warInfoContent, UI_TM
  if index == nil then
    (warInfo_Content._tooltip):SetShow(false)
    return 
  end
  local msg = ""
  local posX = 0
  local posY = 0
  if iconType > 5 then
    posX = (warInfo_Content.frame_content):GetPosX() + (((warInfoContent[territoryKey])[index]).occupyGuildBg):GetPosX()
    posY = (warInfo_Content.frame_content):GetPosY() + (((warInfoContent[territoryKey])[index]).occupyGuildBg):GetPosY()
  else
    posX = (warInfo_Content.frame_content):GetPosX() + (((warInfoContent[territoryKey])[index]).contentBg):GetPosX()
    posY = (warInfo_Content.frame_content):GetPosY() + (((warInfoContent[territoryKey])[index]).contentBg):GetPosY()
  end
  if iconType == 0 or iconType == 6 then
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TOOLTIP_0")
    ;
    (warInfo_Content._tooltip):SetPosX((((warInfoContent[territoryKey])[index]).siegeEnduranceIcon):GetPosX() + (posX) + 5)
    ;
    (warInfo_Content._tooltip):SetPosY((((warInfoContent[territoryKey])[index]).siegeEnduranceIcon):GetPosY() + (posY) + 70)
  else
    if iconType == 1 or iconType == 7 then
      msg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TOOLTIP_1")
      ;
      (warInfo_Content._tooltip):SetPosX()
      ;
      (warInfo_Content._tooltip):SetPosY()
      ;
      (warInfo_Content._tooltip):SetPosX((((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):GetPosX() + (posX) + 5)
      ;
      (warInfo_Content._tooltip):SetPosY((((warInfoContent[territoryKey])[index]).destroySiegeCountIcon):GetPosY() + (posY) + 70)
    else
      if iconType == 2 or iconType == 8 then
        msg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TOOLTIP_2")
        ;
        (warInfo_Content._tooltip):SetPosX()
        ;
        (warInfo_Content._tooltip):SetPosY()
        ;
        (warInfo_Content._tooltip):SetPosX((((warInfoContent[territoryKey])[index]).killCountIcon):GetPosX() + (posX) + 5)
        ;
        (warInfo_Content._tooltip):SetPosY((((warInfoContent[territoryKey])[index]).killCountIcon):GetPosY() + (posY) + 70)
      else
        if iconType == 3 or iconType == 9 then
          msg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TOOLTIP_3")
          ;
          (warInfo_Content._tooltip):SetPosX()
          ;
          (warInfo_Content._tooltip):SetPosY()
          ;
          (warInfo_Content._tooltip):SetPosX((((warInfoContent[territoryKey])[index]).deathCountIcon):GetPosX() + (posX) + 5)
          ;
          (warInfo_Content._tooltip):SetPosY((((warInfoContent[territoryKey])[index]).deathCountIcon):GetPosY() + (posY) + 70)
        else
          if iconType == 4 or iconType == 10 then
            msg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TOOLTIP_4")
            ;
            (warInfo_Content._tooltip):SetPosX()
            ;
            (warInfo_Content._tooltip):SetPosY()
            ;
            (warInfo_Content._tooltip):SetPosX((((warInfoContent[territoryKey])[index]).cannonCountIcon):GetPosX() + (posX) + 5)
            ;
            (warInfo_Content._tooltip):SetPosY((((warInfoContent[territoryKey])[index]).cannonCountIcon):GetPosY() + (posY) + 70)
          else
            if iconType == 5 or iconType == 11 then
              msg = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_TOOLTIP_5")
              ;
              (warInfo_Content._tooltip):SetPosX()
              ;
              (warInfo_Content._tooltip):SetPosY()
              ;
              (warInfo_Content._tooltip):SetPosX((((warInfoContent[territoryKey])[index]).moraleIcon):GetPosX() + (posX) + 5)
              ;
              (warInfo_Content._tooltip):SetPosY((((warInfoContent[territoryKey])[index]).moraleIcon):GetPosY() + (posY) + 70)
            else
              ;
              (warInfo_Content._tooltip):SetShow(false)
              return 
            end
          end
        end
      end
    end
  end
  ;
  (warInfo_Content._tooltip):SetShow(true)
  ;
  (warInfo_Content._tooltip):SetAutoResize(true)
  ;
  (warInfo_Content._tooltip):SetTextMode(UI_TM.eTextMode_None)
  ;
  (warInfo_Content._tooltip):SetText(msg)
  ;
  (warInfo_Content._tooltip):SetSize((warInfo_Content._tooltip):GetTextSizeX() + 10, (warInfo_Content._tooltip):GetTextSizeY())
end

HandleClicked_Territory = function()
  -- function num : 0_8 , upvalues : warInfo_Main, siegingAreaCount, territoryName
  (warInfo_Main.comboBox_Territory):DeleteAllItem()
  for ii = 0, siegingAreaCount - 1 do
    (warInfo_Main.comboBox_Territory):AddItem(territoryName[ii], ii)
  end
  ;
  (warInfo_Main.comboBox_Territory):ToggleListbox()
end

GuildWarInfo_Set_Territory = function(index)
  -- function num : 0_9 , upvalues : warInfo_Main, territoryName, warInfo_Content, selectTerritoy
  if index == nil then
    (warInfo_Main.comboBox_Territory):SetSelectItemIndex((warInfo_Main.comboBox_Territory):GetSelectIndex())
  else
    ;
    (warInfo_Main.comboBox_Territory):SetSelectItemIndex(index)
  end
  local territoryKey = (warInfo_Main.comboBox_Territory):GetSelectIndex()
  ;
  (warInfo_Main.comboBox_Territory):SetText(territoryName[territoryKey])
  ;
  (warInfo_Main.comboBox_Territory):ToggleListbox()
  ;
  (warInfo_Main.frame_SiegeInfo):UpdateContentScroll()
  ;
  (warInfo_Content._scroll):SetControlTop()
  ;
  (warInfo_Main.frame_SiegeInfo):UpdateContentPos()
  selectTerritoy = territoryKey
  FromClient_WarInfoContent_Set(territoryKey)
end

HandleClicked_GuildScore = function(territoryKey, index)
  -- function num : 0_10 , upvalues : warInfoContent
  local guildNo_s64 = ((warInfoContent[territoryKey])[index])._guildNo
  if guildNo_s64 == nil then
    return 
  end
  local guildWrapper = ToClient_GetGuildInfoWrapperByGuildNo(guildNo_s64)
  if guildWrapper ~= nil then
    FGlobal_GuildWarScore_ShowToggle(guildNo_s64)
  end
end

HandleClicked_Cheer = function(territoryKey, index)
  -- function num : 0_11 , upvalues : warInfoContent
  local guildNo_s64 = ((warInfoContent[territoryKey])[index])._guildNo
  local guildWrapper = ToClient_GetGuildInfoWrapperByGuildNo(guildNo_s64)
  if guildWrapper == nil then
    return 
  end
  local applyGuildMp = function()
    -- function num : 0_11_0 , upvalues : guildNo_s64
    ToClient_RequestCheerGuild(guildNo_s64)
  end

  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_CHEER_MESSAGEBOXMEMO", "getName", tostring(guildWrapper:getName()))
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_CHEER_MESSAGEBOXDATA"), content = messageBoxMemo, functionYes = applyGuildMp, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_GuildWarInfo_Show = function()
  -- function num : 0_12 , upvalues : warInfo_Main, guildWarInfo_ShowCheck, controlReGenerate, textSizeY, selectTerritoy
  if Panel_GuildWarInfo:GetShow() then
    Panel_GuildWarInfo:SetShow(false, true)
    Panel_GuildWarInfo:CloseUISubApp()
    ;
    (warInfo_Main.checkPopUp):SetCheck(false)
    return 
  end
  if not Panel_GuildWarInfo:GetShow() then
    audioPostEvent_SystemUi(1, 6)
    Panel_GuildWarInfo:SetShow(true, true)
    guildWarInfo_ShowCheck = true
  end
  controlReGenerate = nil
  textSizeY = 0
  HandleClicked_Territory()
  GuildWarInfo_Set_Territory(selectTerritoy)
  FromClient_NotifySiegeScoreToLog()
end

HandleClicked_GuildWarInfo_PopUp = function()
  -- function num : 0_13 , upvalues : warInfo_Main
  if (warInfo_Main.checkPopUp):IsCheck() then
    Panel_GuildWarInfo:OpenUISubApp()
  else
    Panel_GuildWarInfo:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

FromClient_NotifySiegeScoreToLog = function()
  -- function num : 0_14 , upvalues : viewalbeCount, log_Content, defaultLogFrameSize, textGap, UI_PUCT, warInfo_Log, siegeType, UI_TM, textSizeY, oneLineTextSizeY, warInfo_Content, guildWarInfo_ShowCheck
  if Panel_GuildWarInfo:GetShow() == false then
    return 
  end
  if ToClient_IsVillageSiegeBeing() then
    return 
  end
  local logCount = ToClient_SiegeLogCount()
  if logCount == 0 then
    return 
  end
  if logCount <= viewalbeCount then
    (log_Content._scroll):SetShow(false)
    ;
    (log_Content.frame_content):SetSize((log_Content.frame_content):GetSizeX(), defaultLogFrameSize)
  else
    ;
    (log_Content._scroll):SetShow(true)
    ;
    (log_Content.frame_content):SetSize((log_Content.frame_content):GetSizeX(), defaultLogFrameSize + (logCount - viewalbeCount) * textGap)
  end
  ;
  (log_Content.frame_content):DestroyAllChild()
  local posYIndex = 0
  local msg = ""
  for logIndex = logCount, 1, -1 do
    local siegeGuildInfo = ToClient_GetSiegeLogInfoAt(logIndex - 1)
    if siegeGuildInfo ~= nil then
      local guildMasterCheck = false
      if siegeGuildInfo._isCheerUp == true then
        local guildName = siegeGuildInfo:getGuildName()
        local userName = siegeGuildInfo:getCharacterName()
        if guildName ~= nil and userName ~= nil then
          msg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_CHEERUP", "userName", userName, "guildName", guildName)
          local txtLog = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, log_Content.frame_content, "GuildWar_Log_" .. logIndex)
          CopyBaseProperty(warInfo_Log.textLog, txtLog)
          -- DECOMPILER ERROR at PC107: Confused about usage of register: R12 in 'UnsetPending'

          ;
          (log_Content.textLog)[logIndex] = txtLog
          ;
          ((log_Content.textLog)[logIndex]):SetShow(true)
          local isGuildMasterBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, log_Content.frame_content, "GuildWar_LogBg_" .. logIndex)
          CopyBaseProperty(warInfo_Log.isGuildMasterBg, isGuildMasterBg)
          -- DECOMPILER ERROR at PC131: Confused about usage of register: R13 in 'UnsetPending'

          ;
          (log_Content.isGuildMasterBg)[logIndex] = isGuildMasterBg
          ;
          ((log_Content.textLog)[logIndex]):SetText(msg)
          ;
          ((log_Content.textLog)[logIndex]):SetPosY((log_Content.frame_content):GetSizeY() - (posYIndex + 1) * textGap - 2)
          ;
          ((log_Content.isGuildMasterBg)[logIndex]):SetShow(guildMasterCheck)
          ;
          ((log_Content.isGuildMasterBg)[logIndex]):SetPosY(((log_Content.textLog)[logIndex]):GetPosY() + 1)
          ;
          ((log_Content.isGuildMasterBg)[logIndex]):SetSize(((log_Content.textLog)[logIndex]):GetTextSizeX() + 5, 17)
          posYIndex = posYIndex + 1
        end
      else
        do
          if siegeGuildInfo._isKill == true then
            local guildWrapper = ToClient_GetGuildInfoWrapperByGuildNo(siegeGuildInfo._guildNo)
            if guildWrapper == nil then
              return 
            end
            local _guildname = guildWrapper:getName()
            local guildMemberInfo = guildWrapper:getMemberByUserNo(siegeGuildInfo._userNo)
            if guildMemberInfo == nil then
              return 
            end
            local _username = guildMemberInfo:getName()
            if _guildname ~= nil and _username ~= nil then
              local logType = siegeGuildInfo:getRecordType()
              if logType == 5 then
                msg = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_LOGTYPE_5", "_guildname", _guildname, "_username", _username, "logType", siegeType[siegeGuildInfo:getRecordType()])
              else
                if logType == 3 then
                  _PA_LOG("ì´ë¬¸ì¢\133", "ì ë ¹ì \132 ì¤\145 ì\180 íƒ\128ìž…ì´ ë“¤ì–´ì™\128ì„\160 ì•ˆë©ë‹ˆë‹¤!!")
                else
                  if logType == 9 or logType == 10 then
                    msg = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_MSG", "guildName", guildWrapper:getName(), "memberName", guildMemberInfo:getName(), "getRecordType", siegeType[siegeGuildInfo:getRecordType()])
                  else
                    if logType >= 0 and logType < 11 then
                      local opponentGuildWrapper = ToClient_GetGuildInfoWrapperByGuildNo(siegeGuildInfo._destGuildNo)
                      if opponentGuildWrapper == nil then
                        return 
                      end
                      local opponentGuildMemInfo = nil
                      if logType == 4 or logType == 6 or logType == 7 then
                        opponentGuildMemInfo = opponentGuildWrapper:getMemberByUserNo(siegeGuildInfo._destUserNo)
                      end
                      guildMasterCheck = false
                      if opponentGuildMemInfo == nil then
                        msg = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_LOGTYPE_NIL", "_guildname", _guildname, "_username", _username, "opponentGuildName", opponentGuildWrapper:getName(), "logtype", siegeType[logType])
                      else
                        if logType == 4 then
                          msg = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_LOGTYPE_4", "_guildname", _guildname, "_username", _username, "opponentGuildName", opponentGuildWrapper:getName(), "name", opponentGuildMemInfo:getName())
                          guildMasterCheck = true
                        else
                          if logType == 6 then
                            msg = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_LOGTYPE_6", "_guildname", _guildname, "_username", _username, "opponentGuildName", opponentGuildWrapper:getName(), "name", opponentGuildMemInfo:getName())
                          else
                            if logType == 7 then
                              msg = PAGetStringParam4(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_LOGTYPE_7", "_guildname", _guildname, "_username", _username, "opponentGuildName", opponentGuildWrapper:getName(), "name", opponentGuildMemInfo:getName())
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
              do
                local txtLog = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, log_Content.frame_content, "GuildWar_Log_" .. logIndex)
                CopyBaseProperty(warInfo_Log.textLog, txtLog)
                -- DECOMPILER ERROR at PC370: Confused about usage of register: R15 in 'UnsetPending'

                ;
                (log_Content.textLog)[logIndex] = txtLog
                ;
                ((log_Content.textLog)[logIndex]):SetShow(true)
                do
                  local isGuildMasterBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, log_Content.frame_content, "GuildWar_LogBg_" .. logIndex)
                  CopyBaseProperty(warInfo_Log.isGuildMasterBg, isGuildMasterBg)
                  -- DECOMPILER ERROR at PC394: Confused about usage of register: R16 in 'UnsetPending'

                  ;
                  (log_Content.isGuildMasterBg)[logIndex] = isGuildMasterBg
                  ;
                  ((log_Content.textLog)[logIndex]):SetTextMode(UI_TM.eTextMode_AutoWrap)
                  ;
                  ((log_Content.textLog)[logIndex]):SetText(msg)
                  ;
                  ((log_Content.textLog)[logIndex]):SetTextVerticalTop()
                  ;
                  ((log_Content.textLog)[logIndex]):SetTextSpan(5, 1)
                  textSizeY = textSizeY + ((log_Content.textLog)[logIndex]):GetTextSizeY()
                  if oneLineTextSizeY < ((log_Content.textLog)[logIndex]):GetTextSizeY() then
                    posYIndex = posYIndex + 1
                  end
                  ;
                  ((log_Content.textLog)[logIndex]):SetPosY((log_Content.frame_content):GetSizeY() - (posYIndex + 1) * (oneLineTextSizeY + 2))
                  ;
                  ((log_Content.textLog)[logIndex]):SetPosX(0)
                  ;
                  ((log_Content.isGuildMasterBg)[logIndex]):SetShow(guildMasterCheck)
                  ;
                  ((log_Content.isGuildMasterBg)[logIndex]):SetPosX(0)
                  ;
                  ((log_Content.isGuildMasterBg)[logIndex]):SetPosY(((log_Content.textLog)[logIndex]):GetPosY() + 1)
                  ;
                  ((log_Content.isGuildMasterBg)[logIndex]):SetSize(((log_Content.textLog)[logIndex]):GetSizeX() + 5, ((log_Content.textLog)[logIndex]):GetTextSizeY() + 2)
                  posYIndex = posYIndex + 1
                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC498: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  local descBgSize = (warInfo_Content.descBG):GetSizeY()
  ;
  (warInfo_Log.frame_SiegeLog):UpdateContentScroll()
  if guildWarInfo_ShowCheck == true then
    (log_Content._scroll):SetControlPos(1)
    guildWarInfo_ShowCheck = false
  end
  ;
  (warInfo_Log.frame_SiegeLog):UpdateContentPos()
  if textSizeY <= descBgSize then
    (log_Content._scroll):SetShow(false)
    ;
    (log_Content.frame_content):SetSize((log_Content.frame_content):GetSizeX(), defaultLogFrameSize)
  else
    ;
    (log_Content._scroll):SetShow(true)
    ;
    (log_Content.frame_content):SetSize((log_Content.frame_content):GetSizeX(), defaultLogFrameSize + (logCount - viewalbeCount) * textGap)
  end
end

Panel_GuildWarInfo_Hide = function()
  -- function num : 0_15 , upvalues : warInfo_Main
  Panel_GuildWarInfo:SetShow(false, true)
  Panel_GuildWarInfo:CloseUISubApp()
  ;
  (warInfo_Main.checkPopUp):SetCheck(false)
end

Panel_GuildWarInfo_RePos = function()
  -- function num : 0_16
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  local posY = scrY / 2 - Panel_GuildWarInfo:GetSizeY() / 2 - 100
  if posY < 0 then
    posY = scrY / 2 - Panel_GuildWarInfo:GetSizeY() / 2
  end
  Panel_GuildWarInfo:SetPosX(0)
  Panel_GuildWarInfo:SetPosY(posY)
end

SiegeStatusUpdate = function()
  -- function num : 0_17
  FromClient_WarInfoContent_Set(-1)
end

FromClient_NotifyAttackedKingOrLordTentToScore = function(percent, territoryKey, guildNo)
  -- function num : 0_18 , upvalues : selectTerritoy
  if selectTerritoy == territoryKey then
    FromClient_WarInfoContent_Set(territoryKey)
  end
end

GuildWarInfo_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_19 , upvalues : warInfo_Main
  if isShow then
    local self = warInfo_Main
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if (self.checkPopUp):IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(self.checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

registerEvent("Event_SiegeScoreUpdateData", "FromClient_WarInfoContent_Set")
registerEvent("FromClient_KingOrLordTentCountUpdate", "FromClient_WarInfoContent_Set")
registerEvent("FromClient_NotifyAttackedKingOrLordTentToScore", "FromClient_NotifyAttackedKingOrLordTentToScore")
registerEvent("FromClient_NotifySiegeScoreToLog", "FromClient_NotifySiegeScoreToLog")
registerEvent("FromClient_NotifySiegeGuildLoadComplete", "BattleGuildCount_Update")
registerEvent("onScreenResize", "Panel_GuildWarInfo_RePos")
BattleGuildCount_Update()
Panel_GuildWarInfo_RePos()

