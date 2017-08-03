-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\servantcommon.luac 

-- params : ...
-- function num : 0
Servant_SceneOpen = function(panel)
  -- function num : 0_0
  SetUIMode((Defines.UIMode).eUIMode_Stable)
  setIgnoreShowDialog(true)
  ;
  (UIAni.fadeInSCR_Down)(panel)
  Panel_Npc_Dialog:SetShow(false)
  local npcKey = dialog_getTalkNpcKey()
  if npcKey == 0 then
    return 
  end
  openClientChangeScene(npcKey, 1)
  local funcCameraName = Dialog_getFuncSceneCameraName()
  changeCameraScene(funcCameraName, 0.5)
  panel:SetShow(true)
end

Servant_SceneClose = function(panel)
  -- function num : 0_1
  SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  setIgnoreShowDialog(false)
  ;
  (UIAni.fadeInSCR_Down)(panel)
  panel:SetShow(false)
  local npcKey = dialog_getTalkNpcKey()
  if npcKey ~= 0 then
    closeClientChangeScene(npcKey)
  end
  local mainCameraName = Dialog_getMainSceneCameraName()
  changeCameraScene(mainCameraName, 0.5)
  Panel_Npc_Dialog:SetShow(true)
end

Servant_ScenePushObject = function(servantInfo, beforeSceneIndex)
  -- function num : 0_2
  if servantInfo == nil then
    return 
  end
  local characterKeyRaw = servantInfo:getCharacterKeyRaw()
  local afterSceneIndex = getIndexByCharacterKey(characterKeyRaw)
  if beforeSceneIndex == afterSceneIndex then
    return beforeSceneIndex
  end
  if beforeSceneIndex ~= -1 then
    showSceneCharacter(beforeSceneIndex, false)
  end
  if afterSceneIndex ~= -1 then
    showSceneCharacter(afterSceneIndex, true)
    if not isGuildStable() then
      stable_previewEquipItem(afterSceneIndex)
    end
  end
  return afterSceneIndex
end

Servant_ScenePopObject = function(sceneIndex)
  -- function num : 0_3
  if sceneIndex ~= -1 and sceneIndex ~= nil then
    showSceneCharacter(sceneIndex, false)
  end
end

Servant_InventoryClose = function()
  -- function num : 0_4
  Inventory_SetFunctor(nil)
end

InvenFiler_Mapae = function(slotNo, itemWrapper)
  -- function num : 0_5
  if itemWrapper == nil then
    return true
  end
  local itemSSW = itemWrapper:getStaticStatus()
  if itemSSW == nil then
    return 
  end
  local returnValue = true
  local isMapae = (itemSSW:get()):isMapae()
  local isGuildMapae = (itemSSW:get()):isGuildMapae()
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  local npcType = ToClient_GetServnatTypeFromNpc()
  if npcType ~= (itemSSW:get()):getMapaeServantType() then
    return true
  end
  if isGuildStable() then
    if isGuildMapae then
      returnValue = true
    else
      returnValue = false
    end
  else
    if isMapae and not isGuildMapae then
      returnValue = true
    else
      returnValue = false
    end
  end
  return not returnValue
end

EffectFilter_Mapae = function(slotNo, itemWrapper)
  -- function num : 0_6
  if itemWrapper == nil then
    return true
  end
  local itemSSW = itemWrapper:getStaticStatus()
  if itemSSW == nil then
    return 
  end
  local returnValue = true
  local isMapae = (itemSSW:get()):isMapae()
  local isGuildMapae = (itemSSW:get()):isGuildMapae()
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  local npcType = ToClient_GetServnatTypeFromNpc()
  if npcType ~= (itemSSW:get()):getMapaeServantType() then
    return true
  end
  if isGuildStable() then
    if isGuildMapae then
      returnValue = true
    else
      returnValue = false
    end
  else
    if isMapae and not isGuildMapae then
      returnValue = true
    else
      returnValue = false
    end
  end
  return not returnValue
end

Servant_Confirm = function(strTitle, strMessage, functionYes, functionNo)
  -- function num : 0_7
  local messageboxData = {title = strTitle, content = strMessage, functionYes = functionYes, functionCancel = functionNo, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Mapae_SetEffect = function()
  -- function num : 0_8
  return "fUI_HorseNameCard01"
end


