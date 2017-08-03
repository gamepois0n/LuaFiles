-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\ingamecustomize\ingamecustomize.luac 

-- params : ...
-- function num : 0
local renderMode = (RenderModeWrapper.new)(100, {(Defines.RenderMode).eRenderMode_IngameCustomize}, false)
local gameExitPhoto = false
local CharacterSlotIndex = 0
IngameCustomize_Show = function()
  -- function num : 0_0 , upvalues : renderMode
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_BEAUTYOPENALERT_INDEAD"))
    return 
  end
  ToClient_SaveUiInfo(false)
  if isFlushedUI() then
    return 
  end
  local terraintype = selfPlayerNaviMaterial()
  if terraintype == 8 or terraintype == 9 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_DONTOPEN_INWATER"))
    return 
  end
  if not FGlobal_IsCommercialService() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_NOTUSE"))
    return 
  end
  if GetUIMode() == (Defines.UIMode).eUIMode_Gacha_Roulette then
    return 
  end
  if getCustomizingManager() == nil then
    return 
  end
  if (getCustomizingManager()):isShow() == true then
    return 
  end
  local isShowSuccess = (getCustomizingManager()):show()
  if isShowSuccess == false then
    return 
  end
  if Panel_Win_System:GetShow() then
    allClearMessageData()
  end
  if Panel_CustomizingAlbum:GetShow() then
    CustomizingAlbum_Close()
  end
  audioPostEvent_SystemUi(1, 2)
  SetUIMode((Defines.UIMode).eUIMode_InGameCustomize)
  renderMode:set()
end

IngameCustomize_Hide = function()
  -- function num : 0_1 , upvalues : gameExitPhoto, CharacterSlotIndex
  if getCustomizingManager() == nil then
    return 
  end
  if (getCustomizingManager()):isShow() == false then
    return 
  end
  if isChangedCustomizationData() == true then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECUSTOMIZATION_MSGBOX_CANCEL")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = HandleClicked_CloseIngameCustomization, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      HandleClicked_CloseIngameCustomization()
      do
        if gameExitPhoto == true then
          local gameExitIndex = FGlobal_GetGameExitIndex()
          TargetWindow_ShowToggle(gameExitIndex)
          refreshCharacterInfoData(CharacterSlotIndex + 1)
        end
        gameExitPhoto = false
      end
    end
  end
end

HandleClicked_CloseIngameCustomization = function()
  -- function num : 0_2 , upvalues : renderMode
  CloseCharacterCustomization()
  ;
  (getCustomizingManager()):hide()
  renderMode:reset()
  SetUIMode((Defines.UIMode).eUIMode_Default)
  Panel_CustomizationMessage:SetShow(false)
  Panel_CustomizationStatic:SetShow(false)
  Panel_Chat0:SetShow(true)
  Panel_Cash_Customization:SetShow(false)
  CashCumaBuy_Close()
  allClearMessageData()
  CustomizingAlbum_Close()
  closeExplorer()
  Panel_CustomizationVoice:SetShow(false)
end

IsGameExitPhoto = function(isCheck)
  -- function num : 0_3 , upvalues : gameExitPhoto
  gameExitPhoto = isCheck
end

characterSlot_Index = function(index)
  -- function num : 0_4 , upvalues : CharacterSlotIndex
  CharacterSlotIndex = index
end

renderMode:setClosefunctor(renderMode, IngameCustomize_Hide)

