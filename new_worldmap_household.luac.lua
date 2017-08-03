-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_household.luac 

-- params : ...
-- function num : 0
local HGLT = CppEnums.HouseGroupLocationType
local HouseButtonSetBaseTextureUV = function(pData, pPath, pX1, pY1, pX2, pY2)
  -- function num : 0_0
  pData:ChangeTextureInfoName(pPath)
  local x1, y1, x2, y2 = setTextureUV_Func(pData, pX1, pY1, pX2, pY2)
  ;
  (pData:getBaseTexture()):setUV(x1, y1, x2, y2)
end

local HouseButtonSetOnTextureUV = function(pData, pPath, pX1, pY1, pX2, pY2)
  -- function num : 0_1
  pData:ChangeOnTextureInfoName(pPath)
  x1 = setTextureUV_Func(pData, pX1, pY1, pX2, pY2)
  ;
  (pData:getOnTexture()):setUV(x1, y1, x2, y2)
end

local houseInfo, houseKey = nil, nil
local temp_houseEffectArray = (Array.new)()
local controlNameList = {[-1] = "Static_Empty", [(CppEnums.eHouseUseType).Empty] = "Static_LiveHouse", [(CppEnums.eHouseUseType).Lodging] = "Static_Inn", [(CppEnums.eHouseUseType).Depot] = "Static_WareHouse", [(CppEnums.eHouseUseType).Ranch] = "Static_Horse", [(CppEnums.eHouseUseType).WeaponForgingWorkshop] = "Static_Weapon", [(CppEnums.eHouseUseType).ArmorForgingWorkshop] = "Static_Guard", [(CppEnums.eHouseUseType).HandMadeWorkshop] = "Static_HandMade", [(CppEnums.eHouseUseType).WoodCraftWorkshop] = "Static_Carpenter", [(CppEnums.eHouseUseType).JewelryWorkshop] = "Static_Jewel", [(CppEnums.eHouseUseType).ToolWorkshop] = "Static_Tools", [(CppEnums.eHouseUseType).Refinery] = "Static_Blackstone", [(CppEnums.eHouseUseType).ImproveWorkshop] = "Static_Upgrade", [(CppEnums.eHouseUseType).CannonWorkshop] = "Static_Cannon", [(CppEnums.eHouseUseType).Shipyard] = "Static_Ships", [(CppEnums.eHouseUseType).CarriageWorkshop] = "Static_Carriage", [(CppEnums.eHouseUseType).HorseArmorWorkshop] = "Static_HorseGoods", [(CppEnums.eHouseUseType).FurnitureWorkshop] = "Static_Furniture", [(CppEnums.eHouseUseType).LocalSpecailtiesWorkshop] = "Static_Special", [(CppEnums.eHouseUseType).Wardrobe] = "Static_MakeCustomize", [(CppEnums.eHouseUseType).SiegeWeapons] = "Static_MakeCannon", [(CppEnums.eHouseUseType).ShipParts] = "Static_MakeShip", [(CppEnums.eHouseUseType).WagonParts] = "Static_MakeCarriage", [(CppEnums.eHouseUseType).AssetManagementshop] = "Static_AssetManagement", [(CppEnums.eHouseUseType).PotteryWorkshop] = "Static_PotteryWorkshop", _changeUseType = "Static_Const", _crafting = "Static_Change", _noPurchasable = "Static_Working"}
FGlobal_WorldmapHouseHold_GetControlNameList = function()
  -- function num : 0_2 , upvalues : controlNameList
  return controlNameList
end

FGlobal_HouseHoldButtonSetBaseTexture = function(houseBtn)
  -- function num : 0_3 , upvalues : controlNameList, HGLT
  if houseBtn == nil then
    return 
  end
  local houseInfo = houseBtn:FromClient_getStaticStatus()
  local houseKey = houseInfo:getHouseKey()
  local workingcnt = ToClient_getHouseWorkingWorkerList(houseInfo:get())
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(houseKey)
  local houselocationType = houseInfo:getHouseLocationType()
  local stringName = controlNameList[-1]
  local isShowConstructionAni = false
  if ToClient_IsMyHouse(houseKey) == true then
    if ToClient_GetProgressRateChangeHouseUseType(houseKey) < 100 then
      stringName = controlNameList._changeUseType
      isShowConstructionAni = true
    else
      if workingcnt >= 1 then
        stringName = controlNameList._crafting
        isShowConstructionAni = true
      else
        if rentHouseWrapper == nil then
          return 
        end
        local useType = rentHouseWrapper:getHouseUseType()
        if ToClient_IsMyLiveHouse(houseKey) == false and useType == 0 then
          useType = -1
        end
        stringName = controlNameList[useType]
        if stringName == nil then
          stringName = controlNameList[0]
        end
      end
    end
  else
    do
      if houseInfo:isPurchasable((CppEnums.eHouseUseType).Depot) == false then
        stringName = controlNameList[-1]
      else
        stringName = controlNameList._noPurchasable
      end
      local constructionAni = houseBtn:FromClient_getConstructionAni()
      local guageBG = houseBtn:FromClient_getConstructionGuageBG()
      local guage = houseBtn:FromClient_getConstructionGauge()
      local remainTime = houseBtn:FromClient_getRemainTime()
      if constructionAni ~= nil then
        constructionAni:SetShow(isShowConstructionAni)
        guageBG:SetShow(isShowConstructionAni)
        guage:SetShow(isShowConstructionAni)
        remainTime:SetShow(isShowConstructionAni)
      end
      if HGLT.eHouseGroupLocationType_onlyOne ~= houselocationType or HGLT.eHouseGroupLocationType_bottom == houselocationType then
        stringName = stringName .. "_3F"
      else
        if HGLT.eHouseGroupLocationType_center == houselocationType then
          stringName = stringName .. "_2F"
        else
          if HGLT.eHouseGroupLocationType_top == houselocationType then
            stringName = stringName .. "_1F"
          end
        end
      end
      houseBtn:EraseAllEffect()
      local posX = houseBtn:GetPosX()
      local posY = houseBtn:GetPosY()
      local scale = houseBtn:GetScale()
      local isShow = houseBtn:GetShow()
      houseBtn:SetScale(1, 1)
      CopyBaseProperty((UI.getChildControl)(Panel_HouseIcon, stringName), houseBtn)
      if ToClient_IsMyHouse(houseKey) == false and houseInfo:isPurchasable((CppEnums.eHouseUseType).Depot) == true then
        houseBtn:SetVertexAniRun("Ani_Color_New", true)
      end
      houseBtn:SetPosX(posX)
      houseBtn:SetPosY(posY)
      houseBtn:SetScale(scale.x, scale.y)
      houseBtn:setRenderTexture(houseBtn:getBaseTexture())
      houseBtn:SetShow(isShow)
      PaGlobal_TutorialManager:handleHouseHoldButtonSetBaseTexture(houseBtn)
    end
  end
end

FromClient_LClickedWorldMapHouse = function(houseBtn)
  -- function num : 0_4 , upvalues : houseInfo, houseKey
  houseInfo = houseBtn:FromClient_getStaticStatus()
  if houseInfo == nil then
    return 
  end
  clear_HouseSelectedAni_byHouse()
  houseKey = houseInfo:getHouseKey()
  local IsUsable = ToClient_IsUsable(houseKey)
  if Panel_HouseControl:GetShow() == false and Panel_House_SellBuy_Condition:GetShow() == false then
    clear_HouseSelectedAni_bySellBuy()
    if Panel_RentHouse_WorkManager:GetShow() == true then
      if Panel_Select_Inherit:GetShow() == true then
        WorldMapPopupManager:pop()
      end
      WorldMapPopupManager:pop()
      if Panel_HouseControl:GetShow() == false then
        WorldMapPopupManager:increaseLayer()
        WorldMapPopupManager:push(Panel_HouseControl, true)
      end
    else
      if Panel_Building_WorkManager:GetShow() == true or Panel_LargeCraft_WorkManager:GetShow() == true or Panel_Plant_WorkManager:GetShow() == true then
        WorldMapPopupManager:pop()
        if Panel_HouseControl:GetShow() == false then
          WorldMapPopupManager:increaseLayer()
          WorldMapPopupManager:push(Panel_HouseControl, true)
        end
      else
        WorldMapPopupManager:increaseLayer()
        WorldMapPopupManager:push(Panel_HouseControl, true)
      end
    end
  else
    if Panel_House_SellBuy_Condition:GetShow() == true then
      WorldMapPopupManager:pop()
      if Panel_HouseControl:GetShow() == false then
        WorldMapPopupManager:increaseLayer()
        WorldMapPopupManager:push(Panel_HouseControl, true)
      end
    end
  end
  show_HouseSelectedAni_byHouse()
  FGlobal_UpdateHouseControl(houseInfo)
  FGlobal_Reset_HousePanelPos()
  PaGlobal_TutorialManager:handleLClickedWorldMapHouse(houseBtn)
end

show_HouseSelectedAni_byHouse = function()
  -- function num : 0_5 , upvalues : houseKey
  local _HouseBtn = ToClient_findHouseButtonByKey(houseKey)
  if _HouseBtn ~= nil then
    local _selectedAni = _HouseBtn:FromClient_getSelectedAni()
    _selectedAni:SetShow(true)
    _selectedAni:SetHorizonCenter()
    _selectedAni:SetVerticalMiddle()
    _HouseBtn:SetVertexAniRun("Ani_Color_New", true)
  end
end

clear_HouseSelectedAni_byHouse = function()
  -- function num : 0_6 , upvalues : houseKey
  if houseKey == nil then
    return 
  end
  local _HouseBtn = ToClient_findHouseButtonByKey(houseKey)
  if _HouseBtn ~= nil then
    local _selectedAni = _HouseBtn:FromClient_getSelectedAni()
    _selectedAni:SetShow(false)
    _HouseBtn:ResetVertexAni()
    if ToClient_IsMyHouse(houseKey) == false and (ToClient_GetHouseInfoStaticStatusWrapper(houseKey)):isPurchasable((CppEnums.eHouseUseType).Depot) == true then
      _HouseBtn:SetVertexAniRun("Ani_Color_New", true)
    end
  end
end

FromClient_RClickedWorldMapHouse = function(houseBtn)
  -- function num : 0_7
  local houseInfo = houseBtn:FromClient_getStaticStatus()
  if houseInfo == nil then
    return 
  end
  FromClient_RClickWorldmapPanel(houseInfo:getPosition(), false, true)
end

FGlobal_SelectedHouseInfo = function(_houseKey)
  -- function num : 0_8
  local houseInfoSSW = (ToClient_findHouseButtonByKey(_houseKey)):FromClient_getStaticStatus()
  return houseInfoSSW
end

FromClient_AppliedChangeUseType_Ack = function(houseInfoSSWrapper)
  -- function num : 0_9
  local _houseKey = houseInfoSSWrapper:getHouseKey()
  local houseName = houseInfoSSWrapper:getName()
  local rentHouse = ToClient_GetRentHouseWrapper(_houseKey)
  local currentUseType = rentHouse:getType()
  local realIndex = houseInfoSSWrapper:getIndexByReceipeKey(currentUseType)
  local houseInfoCraftWrapper = houseInfoSSWrapper:getHouseCraftWrapperByIndex(realIndex)
  local useType_Name = houseInfoCraftWrapper:getReciepeName()
  local currentHouseLevel = rentHouse:getLevel()
  if currentHouseLevel > 1 then
    Proc_ShowMessage_Ack(houseName .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_ONCHANGE_END_1", "typeName", useType_Name, "typeLevel", currentHouseLevel))
  else
    if currentHouseLevel == 1 then
      Proc_ShowMessage_Ack(houseName .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_ONCHANGE_END_2", "typeName", useType_Name))
    end
  end
end

FGlobal_FilterClear = function()
  -- function num : 0_10 , upvalues : temp_houseEffectArray
  temp_houseEffectArray = (Array.new)()
end

FGlobal_FilterEffectClear = function()
  -- function num : 0_11 , upvalues : temp_houseEffectArray
  for idx = 1, temp_houseEffectArray:length() do
    (temp_houseEffectArray[idx]):EraseAllEffect()
  end
  FGlobal_FilterClear()
end

local houseEffectArray_Key = 0
FromClient_HouseFilterOn = function(house_btn)
  -- function num : 0_12 , upvalues : temp_houseEffectArray
  local btn = house_btn
  btn:AddEffect("UI_ArrowMark_Diagonal01", true, 70, 80)
  temp_houseEffectArray:push_back(btn)
end

FromClient_HouseFilterOnByHouse = function(house_btn)
  -- function num : 0_13 , upvalues : temp_houseEffectArray
  local btn = house_btn
  btn:AddEffect("UI_ArrowMark_Diagonal01", true, 70, 80)
  temp_houseEffectArray:push_back(btn)
end

registerEvent("FromClient_LClickedWorldMapHouse", "FromClient_LClickedWorldMapHouse")
registerEvent("FromClient_SetHouseTexture", "FGlobal_HouseHoldButtonSetBaseTexture")
registerEvent("FromClient_AppliedChangeUseType", "FromClient_AppliedChangeUseType_Ack")
registerEvent("FromClient_RClickedWorldMapHouse", "FromClient_RClickedWorldMapHouse")
registerEvent("FromClient_HouseFilterOn", "FromClient_HouseFilterOn")
registerEvent("FromClient_HouseFilterOnByHouse", "FromClient_HouseFilterOnByHouse")

