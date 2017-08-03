-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\consolepad_panellist.luac 

-- params : ...
-- function num : 0
local isAbleConsolePadGroup = ToClient_IsContentsGroupOpen("282")
local panelList = {Panel_Window_Inventory, Panel_Invertory_Manufacture_BG, Panel_Invertory_ExchangeButton, Panel_AlchemyFigureHead, Panel_AlchemyStone, Panel_Window_ServantInventory, Panel_Equipment, Panel_Menu, Panel_Window_Exchange_Number, Panel_Looting, Panel_LifeRanking, Panel_GameExit, Panel_ExitConfirm, Panel_ChannelSelect, Panel_Window_Warehouse, Panel_Window_Skill, Panel_Win_System, Panel_UseItem, Panel_Win_Check, Panel_Window_Quest_New, Panel_CheckedQuestInfo, Panel_Mail_Main, Panel_Mail_Detail; [0] = Panel_Window_CharInfo_Status}
FromClient_SetFocusPanelStat = function()
  -- function num : 0_0 , upvalues : isAbleConsolePadGroup, panelList
  if isAbleConsolePadGroup then
    for _,panel in pairs(panelList) do
      panel:setUsableConsolePanel(true)
    end
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_SetFocusPanelStat")

