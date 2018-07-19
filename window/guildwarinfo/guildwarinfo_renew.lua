Panel_Window_GuildWarInfo:SetShow(false)
PAGlobal_GuildWarInfo = {
  _isSiegeBeing = false,
  _selectedTerritoryKey = 0,
  _isSetGuildInfo = false,
  _defenceGuildNo = 0,
  _offenceGuildNo = 0
}
local ui_main = {
  btn_Close = UI.getChildControl(Panel_Window_GuildWarInfo, "Button_Close"),
  tab_Bg = UI.getChildControl(Panel_Window_GuildWarInfo, "Static_TabBg"),
  leftGuild_Bg = UI.getChildControl(Panel_Window_GuildWarInfo, "Static_LeftGuild"),
  rightGuild_Bg = UI.getChildControl(Panel_Window_GuildWarInfo, "Static_RightGuild"),
  finish_Bg = UI.getChildControl(Panel_Window_GuildWarInfo, "Static_FinishBg")
}
local ui_tab = {
  selected_territory_Name = UI.getChildControl(ui_main.tab_Bg, "StaticText_SelectedTerritoryName"),
  btn_refresh = UI.getChildControl(ui_main.tab_Bg, "Button_Reload"),
  btn_territory = {
    [0] = UI.getChildControl(ui_main.tab_Bg, "RadioButton_Territory_0"),
    [1] = UI.getChildControl(ui_main.tab_Bg, "RadioButton_Territory_1"),
    [2] = UI.getChildControl(ui_main.tab_Bg, "RadioButton_Territory_2"),
    [3] = UI.getChildControl(ui_main.tab_Bg, "RadioButton_Territory_3"),
    [4] = UI.getChildControl(ui_main.tab_Bg, "RadioButton_Territory_4")
  }
}
local ui_defenceGuild_flags = UI.getChildControl(ui_main.leftGuild_Bg, "Static_LeftFlag")
local ui_defenceGuild_info_bg = UI.getChildControl(ui_main.leftGuild_Bg, "Static_LeftBtmBg")
local ui_defenceGuild_progress_Bg = UI.getChildControl(ui_defenceGuild_info_bg, "Static_ProgressBg")
local ui_defenceGuild_info = {
  static_GuildIcon = UI.getChildControl(ui_defenceGuild_flags, "Static_GuildIcon"),
  static_GuildName = UI.getChildControl(ui_defenceGuild_flags, "StaticText_GuildName"),
  static_MasterName = UI.getChildControl(ui_defenceGuild_flags, "StaticText_MasterName"),
  progress_Castle = UI.getChildControl(ui_defenceGuild_progress_Bg, "Progress2_1"),
  text_CastleHp = UI.getChildControl(ui_defenceGuild_info_bg, "StaticText_Percent"),
  text_Building = UI.getChildControl(ui_defenceGuild_info_bg, "StaticText_DestroyValue"),
  text_Vehicle = UI.getChildControl(ui_defenceGuild_info_bg, "StaticText_ObjectDeathvalue"),
  text_Member = UI.getChildControl(ui_defenceGuild_info_bg, "StaticText_KillValue"),
  text_Die = UI.getChildControl(ui_defenceGuild_info_bg, "StaticText_DeathValue"),
  btn_TopMember = UI.getChildControl(ui_defenceGuild_info_bg, "Button_Record")
}
local ui_offenceGuild_flags = UI.getChildControl(ui_main.rightGuild_Bg, "Static_RightFlag")
local ui_offenceGuild_info_bg = UI.getChildControl(ui_main.rightGuild_Bg, "Static_RightBtmBg")
local ui_offenceGuild_progress_Bg = UI.getChildControl(ui_offenceGuild_info_bg, "Static_ProgressBg")
local ui_offenceGuild_info = {
  static_GuildIcon = UI.getChildControl(ui_offenceGuild_flags, "Static_GuildIcon"),
  static_GuildName = UI.getChildControl(ui_offenceGuild_flags, "StaticText_GiuldName"),
  static_MasterName = UI.getChildControl(ui_offenceGuild_flags, "StaticText_Name"),
  progress_Castle = UI.getChildControl(ui_offenceGuild_progress_Bg, "Progress2_1"),
  text_CastleHp = UI.getChildControl(ui_offenceGuild_info_bg, "StaticText_Percent"),
  text_Building = UI.getChildControl(ui_offenceGuild_info_bg, "StaticText_DestroyValue"),
  text_Vehicle = UI.getChildControl(ui_offenceGuild_info_bg, "StaticText_ObjectDeathvalue"),
  text_Member = UI.getChildControl(ui_offenceGuild_info_bg, "StaticText_KillValue"),
  text_Die = UI.getChildControl(ui_offenceGuild_info_bg, "StaticText_DeathValue"),
  btn_TopMember = UI.getChildControl(ui_offenceGuild_info_bg, "Button_Record")
}
local ui_finishSiege_info = {
  text_Territory_Desc = UI.getChildControl(ui_main.finish_Bg, "StaticText_FinishText"),
  text_Guild_Desc = UI.getChildControl(ui_main.finish_Bg, "StaticText_ResulfText")
}
function FGlobal_GuildWarInfo_renew_Open()
  if false == Panel_Window_GuildWarInfo:GetShow() then
    PAGlobal_GuildWarInfo:UpdateBasicInfo()
    Panel_Window_GuildWarInfo:SetShow(true)
  end
end
function PAGlobal_GuildWarInfo:UpdateBasicInfo()
  self._isSiegeBeing = isSiegeBeing(self._selectedTerritoryKey)
  local siegeWrapper = ToClient_GetSiegeWrapper(self._selectedTerritoryKey)
  if nil == siegeWrapper then
    return
  end
  if nil ~= ui_tab.btn_territory[self._selectedTerritoryKey] then
    ui_tab.btn_territory[self._selectedTerritoryKey]:SetCheck(true)
  end
  ui_tab.selected_territory_Name:SetText(siegeWrapper:getTerritoryName())
  if false == self._isSiegeBeing then
    if true == siegeWrapper:doOccupantExist() then
      ui_finishSiege_info.text_Territory_Desc:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREE_END", "selectTerritoy", siegeWrapper:getTerritoryName()))
      local guildWrapper = ToClient_GetGuildWrapperByGuildNo(siegeWrapper:getGuildNo())
      local allianceName = ""
      if nil ~= guildWrapper then
        allianceName = guildWrapper:getAllianceName()
      end
      if "" == allianceName then
        ui_finishSiege_info.text_Guild_Desc:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREEDESC_END", "getName", siegeWrapper:getGuildName()))
      else
        ui_finishSiege_info.text_Guild_Desc:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_ALLIANCE_WARINFOCONTENTS_SETFREEDESC_END", "getName", siegeWrapper:getGuildName()))
      end
    else
      ui_finishSiege_info.text_Territory_Desc:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREE", "selectTerritoy", siegeWrapper:getTerritoryName()))
      ui_finishSiege_info.text_Guild_Desc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GUILDWARINFO_WARINFOCONTENTS_SETFREEDESC"))
    end
    ui_main.leftGuild_Bg:SetShow(false)
    ui_main.rightGuild_Bg:SetShow(false)
    ui_main.finish_Bg:SetShow(true)
  else
    self:UpdateGuildScoreMain()
    ui_main.leftGuild_Bg:SetShow(true)
    ui_main.rightGuild_Bg:SetShow(true)
    ui_main.finish_Bg:SetShow(false)
  end
end
function PAGlobal_GuildWarInfo:UpdateGuildScoreMain()
  self._isSiegeBeing = isSiegeBeing(self._selectedTerritoryKey)
  if false == self._isSiegeBeing then
    return
  end
  local siegeWrapper = ToClient_GetSiegeWrapper(self._selectedTerritoryKey)
  if nil == siegeWrapper then
    return
  end
  local guildCount = ToClient_SiegeGuildCount(self._selectedTerritoryKey)
  if 2 ~= guildCount then
    return
  end
  local isDefenceGuild = false
  for index = 0, guildCount - 1 do
    local guildWrapper = ToClient_SiegeGuildAt(self._selectedTerritoryKey, index)
    local siegeBuildingInfo = ToClient_SiegeGuildBuildingInfoAt(self._selectedTerritoryKey, index)
    if nil == guildWrapper or nil == siegeBuildingInfo then
      return
    end
    if guildWrapper:getGuildNo_s64() == siegeWrapper:getGuildNo() then
      isDefenceGuild = true
      self._defenceGuildNo = guildWrapper:getGuildNo_s64()
    else
      isDefenceGuild = false
      self._offenceGuildNo = guildWrapper:getGuildNo_s64()
    end
    self:UpdateGuildScoreDetail(isDefenceGuild, guildWrapper, siegeBuildingInfo)
  end
  self._isSetGuildInfo = true
end
function PAGlobal_GuildWarInfo:UpdateGuildScoreDetail(isDefence, guildWrapper, buildingInfo)
  local guildInfo
  if true == isDefence then
    guildInfo = ui_defenceGuild_info
  else
    guildInfo = ui_offenceGuild_info
  end
  if false == self._isSetGuildInfo then
    local guildAllianceName = guildWrapper:getAllianceName()
    if "" == guildAllianceName then
      guildInfo.static_GuildName:SetText(guildWrapper:getName())
    else
      guildInfo.static_GuildName:SetText(guildAllianceName)
    end
    guildInfo.static_MasterName:SetText(guildWrapper:getGuildMasterName())
    local isSet = setGuildTextureByGuildNo(guildWrapper:getGuildNo_s64(), guildInfo.static_GuildIcon)
    if false == isSet then
      guildInfo.static_GuildIcon:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(guildInfo.static_GuildIcon, 183, 1, 188, 6)
      guildInfo.static_GuildIcon:getBaseTexture():setUV(x1, y1, x2, y2)
      guildInfo.static_GuildIcon:setRenderTexture(guildInfo.static_GuildIcon:getBaseTexture())
    else
      guildInfo.static_GuildIcon:getBaseTexture():setUV(0, 0, 1, 1)
      guildInfo.static_GuildIcon:setRenderTexture(guildInfo.static_GuildIcon:getBaseTexture())
    end
  end
  guildInfo.text_Building:SetText(tostring(guildWrapper:getTotalSiegeCount(0)))
  guildInfo.text_Vehicle:SetText(tostring(guildWrapper:getTotalSiegeCount(3)))
  guildInfo.text_Member:SetText(tostring(guildWrapper:getTotalSiegeCount(1)))
  guildInfo.text_Die:SetText(tostring(guildWrapper:getTotalSiegeCount(2)))
  local hpPercent = buildingInfo:getRemainHp() / 10000
  guildInfo.progress_Castle:SetProgressRate(hpPercent / 100 * 100)
  guildInfo.text_CastleHp:SetText(tostring(hpPercent) .. "%")
end
function regist_GuildWarInfo_renew_ClickedEvent()
  ui_main.btn_Close:addInputEvent("Mouse_LUp", "HandleClicked_GuildWarInfo_renew_Close()")
  ui_tab.btn_refresh:addInputEvent("Mouse_LUp", "HandleClicked_GuildWarInfo_renew_Refresh()")
  for index = 0, 4 do
    ui_tab.btn_territory[index]:addInputEvent("Mouse_LUp", "HandleClicked_GuildWarInfo_renew_Territory(" .. index .. ")")
  end
  ui_defenceGuild_info.btn_TopMember:addInputEvent("Mouse_LUp", "HandleClicked_GuildWarInfo_renew_TopMember(0)")
  ui_offenceGuild_info.btn_TopMember:addInputEvent("Mouse_LUp", "HandleClicked_GuildWarInfo_renew_TopMember(1)")
end
function HandleClicked_GuildWarInfo_renew_Close()
  Panel_Window_GuildWarInfo:SetShow(false)
end
function HandleClicked_GuildWarInfo_renew_Refresh()
  ToClient_RequestSiegeScore()
end
function HandleClicked_GuildWarInfo_renew_Territory(territoryKey)
  PAGlobal_GuildWarInfo._selectedTerritoryKey = territoryKey
  PAGlobal_GuildWarInfo._isSetGuildInfo = false
  PAGlobal_GuildWarInfo:UpdateBasicInfo()
end
function HandleClicked_GuildWarInfo_renew_TopMember(type)
  if 0 == type then
    FGlobal_GuildWarScore_renew_Open(PAGlobal_GuildWarInfo._defenceGuildNo)
  elseif 1 == type then
    FGlobal_GuildWarScore_renew_Open(PAGlobal_GuildWarInfo._offenceGuildNo)
  end
end
function FromClient_GuildWarInfoUpdate_renew()
  PAGlobal_GuildWarInfo:UpdateGuildScoreMain()
  FGlobal_GuildWarScore_renew_Update()
end
registerEvent("Event_SiegeScoreUpdateData", "FromClient_GuildWarInfoUpdate_renew")
regist_GuildWarInfo_renew_ClickedEvent()
