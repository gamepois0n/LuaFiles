Panel_WorldmapKeyGuide:SetShow(false)
function PaGlobal_ConsoleWorldMapKeyGuide_SetPos(isBottomPanelShow)
  local offsetY
  if true == isBottomPanelShow then
    offsetY = 120
  else
    offsetY = 50
  end
  Panel_WorldmapKeyGuide:SetPosX(getScreenSizeX() - Panel_WorldmapKeyGuide:GetSizeX())
  Panel_WorldmapKeyGuide:SetPosY(getScreenSizeY() - Panel_WorldmapKeyGuide:GetSizeY() - offsetY)
end
function PaGlobal_ConsoleWorldMapKeyGuide_SetShow(isShow)
  Panel_WorldmapKeyGuide:SetShow(isShow)
end
registerEvent("onScreenResize", "PaGlobal_ConsoleWorldMapKeyGuide_SetPos")
