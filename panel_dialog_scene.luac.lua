-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_dialog_scene.luac 

-- params : ...
-- function num : 0
Panel_Dialog_Scene:SetShow(false)
Panel_Dialog_Scene:setFlushAble(false)
global_SelectCommerceType = -1
local VCK = CppEnums.VirtualKeyCode
local scene_WorldPosition = nil
local pickingIndex = -1
enCommerceType = {enCommerceType_Luxury_Miscellaneous = 1, enCommerceType_Luxury = 2, enCommerceType_Grocery = 3, enCommerceType_Medicine = 4, enCommerceType_MilitarySupplies = 5, enCommerceType_ObjectSaint = 6, enCommerceType_Cloth = 7, enCommerceType_SeaFood = 8, enCommerceType_RawMaterial = 9, enCommerceType_Max = 10}
local beginIndex = 5
local endIndex = 14
commerceCategory = {
[beginIndex] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_GROCERY"), Type = enCommerceType.enCommerceType_Grocery}
, 
[6] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_MEDICINE"), Type = enCommerceType.enCommerceType_Medicine}
, 
[7] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_LUXURY"), Type = enCommerceType.enCommerceType_Luxury}
, 
[8] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_MISCELLANEOUS"), Type = enCommerceType.enCommerceType_Luxury_Miscellaneous}
, 
[9] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_SEED"), Type = enCommerceType.enCommerceType_Seed}
, 
[10] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_CLOTH"), Type = enCommerceType.enCommerceType_Cloth}
, 
[11] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_SAINTOBJECT"), Type = enCommerceType.enCommerceType_ObjectSaint}
, 
[12] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_SAINTOBJECT"), Type = enCommerceType.enCommerceType_MilitarySupplies}
, 
[13] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_SAINTOBJECT"), Type = enCommerceType.enCommerceType_RawMaterial}
, 
[endIndex] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_COMMERCETYPE_SEEFOOD"), Type = enCommerceType.enCommerceType_SeaFood}
}
enStableType = {enStableType_Dye = 1, enStableType_ArmorStands = 2, enStableType_Hybridization = 3, enStableType_Max = 4}
local stableCategory = {
[1] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_STABLECATEGORY_DYE"), Type = enStableType.enStableType_Dye}
, 
[2] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_STABLECATEGORY_ARMOR"), Type = enStableType.enStableType_ArmorStands}
, 
[3] = {name = PAGetString(Defines.StringSheet_GAME, "DIALOGSCENE_STABLECATEGORY_HYBRIDIZATION"), Type = enStableType.enStableType_Hybridization}
}
local _prevPickingIndex = 0
updateSceneObjectPicking = function(fDeltaTime)
  -- function num : 0_0 , upvalues : pickingIndex
  local subIndex = getCurrentSubIndex()
  if subIndex ~= -1 then
    pickingIndex = getObjectPickingIndex()
    ;
    (dialog_Scene_Click_Func[subIndex])()
  end
end

show_DialogPanel = function()
  -- function num : 0_1
  Panel_Dialog_Scene:SetShow(true)
end

hide_DialogSceneUIPanel = function()
  -- function num : 0_2
  Panel_Dialog_Scene:SetShow(false)
end

Panel_Dialog_Scene:RegisterUpdateFunc("updateSceneObjectPicking")
local dialogNpcSceneInfo = {}
local dialogScene_Category_Trade = 0
local dialogScene_Category_Stable = 1
local dialogScene_Category_Search = 2
local dialogScene_Category_Wharf = 3
dialogNpcSceneInfo.click_Trade = function()
  -- function num : 0_3 , upvalues : VCK, pickingIndex, _prevPickingIndex
  if global_IsTrading == false then
    return 
  end
  if isKeyDown_Once(VCK.KeyCode_LBUTTON) == true and pickingIndex ~= -1 then
    _prevPickingIndex = pickingIndex
    if commerceCategory[pickingIndex] ~= nil then
      global_SelectCommerceType = (commerceCategory[pickingIndex]).Type
      global_buyListOpen(global_SelectCommerceType)
    end
    global_updateCommerceInfoByType(global_SelectCommerceType, 1)
  end
end

dialogNpcSceneInfo.click_Stable = function()
  -- function num : 0_4 , upvalues : VCK, pickingIndex
  if isKeyDown_Once(VCK.KeyCode_LBUTTON) == true then
    if pickingIndex == -1 then
      return 
    end
    if getEventControl() ~= nil then
      return 
    end
  end
  if (enStableType.enStableType_Dye ~= pickingIndex or enStableType.enStableType_ArmorStands == pickingIndex) and npcShop_isShopContents() then
    npcShop_requestList(9)
    StableShop_OpenPanel()
  end
  if enStableType.enStableType_Hybridization == pickingIndex then
    StableFunction_Button_ListMating()
  end
end

dialogNpcSceneInfo.click_Search = function()
  -- function num : 0_5
end

dialogNpcSceneInfo.click_wharf = function()
  -- function num : 0_6
end

dialog_Scene_Click_Func = {[dialogScene_Category_Trade] = dialogNpcSceneInfo.click_Trade, [dialogScene_Category_Stable] = dialogNpcSceneInfo.click_Stable, [dialogScene_Category_Search] = dialogNpcSceneInfo.click_Search, [dialogScene_Category_Wharf] = dialogNpcSceneInfo.click_wharf}
global_TradeShopScene = function()
  -- function num : 0_7 , upvalues : _prevPickingIndex
  callAIHandlerByIndex(1, _prevPickingIndex, "SceneTradeBuy")
end

global_TradeShopReset = function()
  -- function num : 0_8
  callAIHandlerByIndex(3, 0, "ResetTradeshop")
end


