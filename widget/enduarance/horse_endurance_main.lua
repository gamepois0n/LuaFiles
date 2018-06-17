PaGlobalHorseEnduranceList = {
  panel = Panel_HorseEndurance,
  enduranceTypeCount = 5,
  enduranceInfo = {},
  effectBG = UI.getChildControl(Panel_HorseEndurance, "Static_HorseEffect"),
  noticeEndurance = UI.getChildControl(Panel_HorseEndurance, "StaticText_NoticeEndurance"),
  repair_AutoNavi = UI.getChildControl(Panel_HorseEndurance, "CheckButton_Repair_AutoNavi"),
  repair_Navi = UI.getChildControl(Panel_HorseEndurance, "Checkbox_Repair_Navi"),
  radarSizeX = 0
}
function PaGlobalHorseEnduranceList:initialize()
  for index = 0, self.enduranceTypeCount - 1 do
    self.enduranceInfo[index] = {}
    if index == 0 then
      self.enduranceInfo[index].control = UI.getChildControl(self.panel, "Static_Horse_Head")
    elseif index == 1 then
      self.enduranceInfo[index].control = UI.getChildControl(self.panel, "Static_Horse_Body")
    elseif index == 2 then
      self.enduranceInfo[index].control = UI.getChildControl(self.panel, "Static_Horse_RiderFoot")
    elseif index == 3 then
      self.enduranceInfo[index].control = UI.getChildControl(self.panel, "Static_Horse_Saddle")
    elseif index == 4 then
      self.enduranceInfo[index].control = UI.getChildControl(self.panel, "Static_Horse_HorseFoot")
    end
    self.enduranceInfo[index].control:SetShow(false)
    self.enduranceInfo[index].color = Defines.Color.C_FF000000
    self.enduranceInfo[index].itemEquiped = false
    self.enduranceInfo[index].isBroken = false
  end
  self.noticeEndurance:SetShow(false)
  self.repair_AutoNavi:SetShow(false)
  self.repair_Navi:SetShow(false)
  self.panel:SetShow(true)
  if not self.repair_Navi:GetShow() then
    self.effectBG:EraseAllEffect()
  end
  self.effectBG:addInputEvent("Mouse_On", "HandleMEnduranceNotice(CppEnums.EnduranceType.eEnduranceType_Horse, true)")
  self.effectBG:addInputEvent("Mouse_Out", "HandleMEnduranceNotice(CppEnums.EnduranceType.eEnduranceType_Horse, false)")
  self.repair_AutoNavi:addInputEvent("Mouse_LUp", "HandleMLUpRepairNavi(CppEnums.EnduranceType.eEnduranceType_Horse, true)")
  self.repair_Navi:addInputEvent("Mouse_LUp", "HandleMLUpRepairNavi(CppEnums.EnduranceType.eEnduranceType_Horse, false)")
  self.radarSizeX = FGlobal_Panel_Radar_GetSizeX()
  Panel_HorseEndurance_Position()
  self._isInit = true
end
function PaGlobalHorseEnduranceList:checkInit()
  return self._isInit == true
end
function Panel_HorseEndurance_Position()
  local self = PaGlobalHorseEnduranceList
  self.radarSizeX = FGlobal_Panel_Radar_GetSizeX()
  self.panel:SetPosX(getScreenSizeX() - self.radarSizeX - self.panel:GetSizeX() * 1.7)
  self.panel:SetPosY(FGlobal_Panel_Radar_GetPosY() - FGlobal_Panel_Radar_GetSizeY() / 1.5)
  if Panel_Widget_TownNpcNavi:GetShow() then
    self.panel:SetPosY(Panel_Widget_TownNpcNavi:GetSizeY() + Panel_Widget_TownNpcNavi:GetPosY() + 10)
  end
end
function renderModeChange_Panel_HorseEndurance_Position(prevRenderModeList, nextRenderModeList)
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return
  end
  Panel_HorseEndurance_Position()
end
function PaGlobalHorseEnduranceList_Init()
  PaGlobalHorseEnduranceList:initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalHorseEnduranceList_Init")
registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_HorseEndurance_Position")
registerEvent("onScreenResize", "Panel_HorseEndurance_Position")
