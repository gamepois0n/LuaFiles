local UIMode = Defines.UIMode
local IM = CppEnums.EProcessorInputMode
function appear_blackSpirit(questNo, blackSpiritUIType)
  ToClient_SaveUiInfo(false)
  close_WindowPanelList()
  local preUIMode = GetUIMode()
  SetUIMode(UIMode.eUIMode_NpcDialog_Dummy)
  local callSummon = RequestAppearBlackSpirit(questNo, blackSpiritUIType)
  if callSummon then
    if true == _ContentsGroup_RenewUI_Dailog then
      PaGlobalFunc_MainDialog_Close()
      PaGlobalFunc_Dialog_Main_SetRenderMode()
    else
      Panel_Npc_Dialog:SetShow(false)
      FGlobal_Dialog_renderMode:set()
    end
  else
    SetUIMode(preUIMode)
    ToClient_PopBlackSpiritFlush()
    if true == _ContentsGroup_RenewUI_Dailog then
      PaGlobalFunc_MainDialog_Close()
    else
      Panel_Npc_Dialog:SetShow(false)
    end
  end
end
registerEvent("appear_blackSpirit", "appear_blackSpirit")
