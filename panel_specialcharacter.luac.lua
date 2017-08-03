-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\panel_specialcharacter.luac 

-- params : ...
-- function num : 0
local Edit_CandidateList = {[1] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_1"), [2] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_2"), [3] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_3"), [4] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_4"), [5] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_5"), [6] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_6"), [7] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_7"), [8] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_8"), [9] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_9"), [10] = (UI.getChildControl)(Panel_SpecialCharacter, "StaticText_10")}
FromClient_ImeShowPanel = function(isShow)
  -- function num : 0_0
  Panel_SpecialCharacter:SetShow(isShow)
end

FromClient_ChangePos = function(Pos)
  -- function num : 0_1
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  local halfX = Panel_SpecialCharacter:GetSizeX() * 0.5
  local PanelY = Panel_SpecialCharacter:GetSizeY()
  if Pos.x - halfX < 0 then
    Pos.x = halfX
  end
  if Pos.y < 0 then
    Pos.y = 0
  end
  if screenX < Pos.x + halfX then
    Pos.x = screenX - halfX
  end
  if screenY < Pos.y + PanelY then
    Pos.y = screenY - PanelY
  end
  Panel_SpecialCharacter:SetPosX(Pos.x)
  Panel_SpecialCharacter:SetPosY(Pos.y)
end

FromClient_ChangeText = function(Text, index)
  -- function num : 0_2 , upvalues : Edit_CandidateList
  local Edit_Candidate = Edit_CandidateList[index]
  Edit_Candidate:SetText(Text)
end

FromClient_ChangePanelSize = function(size)
  -- function num : 0_3 , upvalues : Edit_CandidateList
  local Edit_Candidate = Edit_CandidateList[size.x]
  size.x = Edit_Candidate:GetTextSizeX() + 10
  Panel_SpecialCharacter:SetSize(size.x, size.y)
end

registerEvent("FromClient_ImeShowPanel", "FromClient_ImeShowPanel")
registerEvent("FromClient_ChangePos", "FromClient_ChangePos")
registerEvent("FromClient_ChangeText", "FromClient_ChangeText")
registerEvent("FromClient_ChangePanelSize", "FromClient_ChangePanelSize")

