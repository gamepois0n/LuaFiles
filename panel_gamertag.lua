function PaGlobal_CheckGamerTag()
  if not ToClient_isDataDownloadStart() then
    return
  end
  Panel_GamerTag:SetShow(true)
  local bg = UI.getChildControl(Panel_GamerTag, "Static_GameTagBG")
  local text = UI.getChildControl(bg, "StaticText_GameTagText")
  local GamerTagString = ToClient_XboxGamerTag()
  text:SetText(GamerTagString)
  local percentText = UI.getChildControl(bg, "StaticText_GameTagPercentText")
  if false == ToClient_isDataDownloadComplete() then
    text:SetPosY(text:GetPosY() - 11)
    percentText:SetPosY(percentText:GetPosY() + 12)
    percentText:SetShow(true)
  else
    percentText:SetShow(false)
  end
end
function FGlobal_DataInstallation_PerFrameUpdate()
  if true == ToClient_isDataDownloadComplete() then
    percentText:SetText("Installation Complete")
    return
  end
  local bg = UI.getChildControl(Panel_GamerTag, "Static_GameTagBG")
  local percentText = UI.getChildControl(bg, "StaticText_GameTagPercentText")
  percentText:SetText("Installation : " .. tostring(ToClient_getDataDownloadProgress()) .. "%")
end
Panel_GamerTag:RegisterUpdateFunc("FGlobal_DataInstallation_PerFrameUpdate")
