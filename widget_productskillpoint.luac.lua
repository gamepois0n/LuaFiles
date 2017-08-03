-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\productskillpoint\widget_productskillpoint.luac 

-- params : ...
-- function num : 0
Panel_MainStatus_User_ProductSkillPoint:SetShow(true)
local _staticSkillExp = (UI.getChildControl)(Panel_MainStatus_User_ProductSkillPoint, "CircularProgress_SkillExp_p")
local _staticSkillPoint = (UI.getChildControl)(Panel_MainStatus_User_ProductSkillPoint, "StaticText_SkillPoint_p")
Panel_User_ProductSkillPoint_Update = function()
  -- function num : 0_0 , upvalues : _staticSkillPoint, _staticSkillExp
  local skillPointInfo = getSkillPointInfo(2)
  _staticSkillPoint:SetText(tostring(skillPointInfo._remainPoint))
  local skillExpRate = skillPointInfo._currentExp / skillPointInfo._nextLevelExp
  _staticSkillExp:SetProgressRate(skillExpRate * 100)
end


