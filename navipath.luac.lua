-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\navipath\navipath.luac 

-- params : ...
-- function num : 0
local UIColor = Defines.Color
FromClient_CreateNaviPathUI = function(selfPlayer)
  -- function num : 0_0 , upvalues : UIColor
  selfPlayer:insertColorTable(1000, UIColor.C_FFF68383)
  selfPlayer:insertColorTable(10000, UIColor.C_FFECADAD)
  selfPlayer:insertColorTable(20000, UIColor.C_FFE5C6C6)
  selfPlayer:insertColorTable(1000000, UIColor.C_FFCECECE)
  selfPlayer:insertEndColorTable()
end

registerEvent("FromClient_CreateNaviPathUI", "FromClient_CreateNaviPathUI")

