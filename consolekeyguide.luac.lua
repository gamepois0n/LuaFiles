-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\consolekey\consolekeyguide.luac 

-- params : ...
-- function num : 0
local isDev = isGameServiceTypeDev()
Panel_ConsoleKeyGuide:SetShow(isDev)
Panel_ConsoleKeyGuide_updateConsole = function()
  -- function num : 0_0
  if ToClient_isConsoleUIMode() then
    Panel_ConsoleKeyGuide:SetShow(isGameServiceTypeDev())
  else
    Panel_ConsoleKeyGuide:SetShow(false)
  end
end


