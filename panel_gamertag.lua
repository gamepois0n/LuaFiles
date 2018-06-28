function PaGlobal_CheckGamerTag()
  if false == ToClient_isXBox() then
    return
  end
  Panel_GamerTag:SetShow(true)
  local bg = UI.getChildControl(Panel_GamerTag, "Static_GameTagBG")
  local text = UI.getChildControl(bg, "StaticText_GameTagText")
  local GamerTagString = ToClient_XboxGamerTag()
  text:SetText(GamerTagString)
end
