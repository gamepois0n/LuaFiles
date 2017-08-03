-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\common\common_blackspirit.luac 

-- params : ...
-- function num : 0
local UIMode = Defines.UIMode
local IM = CppEnums.EProcessorInputMode
appear_blackSpirit = function(questNo, blackSpiritUIType)
  -- function num : 0_0 , upvalues : UIMode, IM
  ToClient_SaveUiInfo(false)
  close_WindowPanelList()
  local preUIMode = GetUIMode()
  SetUIMode(UIMode.eUIMode_NpcDialog_Dummy)
  local callSummon = RequestAppearBlackSpirit(questNo, blackSpiritUIType)
  if callSummon then
    Panel_Npc_Dialog:SetShow(false)
    FGlobal_Dialog_renderMode:set()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
  else
    SetUIMode(preUIMode)
    ToClient_PopBlackSpiritFlush()
    Panel_Npc_Dialog:SetShow(false)
  end
end

registerEvent("appear_blackSpirit", "appear_blackSpirit")

