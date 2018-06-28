Panel_WorldmapKeyGuide:SetShow(false)
function PaGlobal_ConsoleWorldMapKeyGuide_SetPos()
  Panel_WorldmapKeyGuide:SetPosX(getScreenSizeX() - Panel_WorldmapKeyGuide:GetSizeX())
  Panel_WorldmapKeyGuide:SetPosY(getScreenSizeY() - Panel_WorldmapKeyGuide:GetSizeY() - 50)
end
function PaGlobal_ConsoleWorldMapKeyGuide_SetShow(isShow)
  Panel_WorldmapKeyGuide:SetShow(isShow)
end
registerEvent("onScreenResize", "PaGlobal_ConsoleWorldMapKeyGuide_SetPos")
