-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\panel_gamertag.luac 

-- params : ...
-- function num : 0
PaGlobal_CheckGamerTag = function()
  -- function num : 0_0
  if ToClient_isXBox() == false then
    return 
  end
  Panel_GamerTag:SetShow(true)
  local bg = (UI.getChildControl)(Panel_GamerTag, "Static_GameTagBG")
  local text = (UI.getChildControl)(bg, "StaticText_GameTagText")
  local GamerTagString = ToClient_XboxGamerTag()
  text:SetText(GamerTagString)
end


