-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\item\connectui.luac 

-- params : ...
-- function num : 0
eConnectUiType = {eConnectUi_Undefined = -1, eConnectUi_BlackStone = 0, eConnectUi_Socket = 1, eConnectUi_Beer = 2, eConnectUi_Improve = 3, eConnectUi_DyePalette = 4, eConnectUi_Count = 5}
ConnectUI = function(connectUiType)
  -- function num : 0_0
  if eConnectUiType.eConnectUi_BlackStone == connectUiType then
    if not IsSelfPlayerWaitAction() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_SUMMON_BLACKSPIRIT"))
      return 
    end
    ToClient_AddBlackSpiritFlush(0, true, (CppEnums.EFlush_BlackSpirit_Ui_Type).eFlush_BlackSpirit_Ui_ItemEnchant)
  else
    if eConnectUiType.eConnectUi_Socket == connectUiType then
      if not IsSelfPlayerWaitAction() then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_SUMMON_BLACKSPIRIT"))
        return 
      end
      ToClient_AddBlackSpiritFlush(0, true, (CppEnums.EFlush_BlackSpirit_Ui_Type).eFlush_BlackSpirit_Ui_Socket)
    else
      if eConnectUiType.eConnectUi_Beer == connectUiType then
        WorkerManager_ShowToggle()
      else
        if eConnectUiType.eConnectUi_Improve == connectUiType then
          if not IsSelfPlayerWaitAction() then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_SUMMON_BLACKSPIRIT"))
            return 
          end
          ToClient_AddBlackSpiritFlush(0, true, (CppEnums.EFlush_BlackSpirit_Ui_Type).eFlush_BlackSpirit_Ui_Improve)
        else
          if eConnectUiType.eConnectUi_DyePalette == connectUiType then
            HandleClicked_Inventory_Palette_Open()
          end
        end
      end
    end
  end
end


