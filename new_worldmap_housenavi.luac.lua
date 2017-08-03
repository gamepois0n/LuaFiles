-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\new_worldmap_housenavi.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local filterBG = (UI.getChildControl)(Panel_NodeMenu, "Filter_Bg")
local _myHosueCombo = (UI.getChildControl)(Panel_NodeMenu, "Combobox_Filter_Own")
local _typeCombo = (UI.getChildControl)(Panel_NodeMenu, "Combobox_Filter_Type")
local _levelCombo = (UI.getChildControl)(Panel_NodeMenu, "Combobox_Filter_Lev")
local _edit_Search = (UI.getChildControl)(Panel_NodeMenu, "Filter_Edit_Type")
local _btn_Search = (UI.getChildControl)(Panel_NodeMenu, "Filter_Button_TypeSearch")
local _myhouseList = _myHosueCombo:GetListControl()
local _typeList = _typeCombo:GetListControl()
local _levelList = _levelCombo:GetListControl()
local _typeListScroll = _typeList:GetScroll()
local _beforeReceipeIndex = 0
local _houseMaxLevel = 5
local _itemSize = 0
local defaultKeyWord = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_GRAND_HOUSENAVI_DEFAULTKEYWORD")
Panel_NodeHouseFilter:RegisterShowEventFunc(true, "FGlobal_HouseFilter_ShowAni()")
Panel_NodeHouseFilter:RegisterShowEventFunc(false, "FGlobal_HouseFilter_HideAni()")
Panel_NodeHouseFilter:SetShow(false, false)
FGlobal_HouseFilter_ShowAni = function()
  -- function num : 0_0
end

FGlobal_HouseFilter_HideAni = function()
  -- function num : 0_1
end

local Worldmap_HouseNavi_Init = function()
  -- function num : 0_2 , upvalues : filterBG, _edit_Search, _btn_Search, _myHosueCombo, _typeCombo, _levelCombo, _myhouseList, _itemSize, _typeList, _levelList, _houseMaxLevel
  filterBG:AddChild(_edit_Search)
  filterBG:AddChild(_btn_Search)
  filterBG:AddChild(_myHosueCombo)
  filterBG:AddChild(_typeCombo)
  filterBG:AddChild(_levelCombo)
  Panel_NodeMenu:RemoveControl(_edit_Search)
  Panel_NodeMenu:RemoveControl(_btn_Search)
  Panel_NodeMenu:RemoveControl(_myHosueCombo)
  Panel_NodeMenu:RemoveControl(_typeCombo)
  Panel_NodeMenu:RemoveControl(_levelCombo)
  _myHosueCombo:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERFIILTER"))
  _myhouseList:SetItemQuantity(3)
  _myHosueCombo:AddItem(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERRFILTER_ALL"))
  _myHosueCombo:AddItem(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERFIILTER_MINE"))
  _myHosueCombo:AddItem(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERFIILTER_MINE_AT"))
  _myHosueCombo:AddItem(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERFILTER_OTHER"))
  _itemSize = _myhouseList:GetItemHeight()
  _myhouseList:SetSize(_myhouseList:GetSizeX(), 3 * _itemSize)
  _typeCombo:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_USETYPEFILTER"))
  _typeList:SetItemQuantity(5)
  _levelCombo:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_LEVELFILTER"))
  _levelList:SetItemQuantity(_houseMaxLevel)
  for i = 1, _houseMaxLevel do
    _levelCombo:AddItem(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_LEVELFILTER") .. " " .. R8_PC133)
  end
  _myHosueCombo:addInputEvent("Mouse_LUp", "ToggleCombo(" .. 0 .. ")")
  _typeCombo:addInputEvent("Mouse_LUp", "ToggleCombo(" .. 1 .. ")")
  _levelCombo:addInputEvent("Mouse_LUp", "ToggleCombo(" .. 2 .. ")")
  _myhouseList:addInputEvent("Mouse_LUp", "FGlobal_SelectedFilter()")
  _typeList:addInputEvent("Mouse_LUp", "FGlobal_SelectedFilter()")
  _levelList:addInputEvent("Mouse_LUp", "FGlobal_SelectedFilter()")
  _edit_Search:addInputEvent("Mouse_LUp", "HandleClicked_HouseNaviEditSearch()")
  _btn_Search:addInputEvent("Mouse_LUp", "HandleClicked_HouseNaviSearch()")
  _edit_Search:RegistReturnKeyEvent("HandleClicked_HouseNaviSearch()")
end

ToggleCombo = function(index)
  -- function num : 0_3 , upvalues : _myHosueCombo, _typeCombo, _levelCombo, _edit_Search, defaultKeyWord
  if index == 0 then
    _myHosueCombo:ToggleListbox()
  else
    if index == 1 then
      _typeCombo:ToggleListbox()
    else
      if index == 2 then
        _levelCombo:ToggleListbox()
      end
    end
  end
  _edit_Search:SetEditText(defaultKeyWord, true)
end

FGlobal_FilterReset = function()
  -- function num : 0_4 , upvalues : _myHosueCombo, _typeCombo, _levelCombo, _edit_Search, defaultKeyWord
  ToCleint_findHouseByFilter((CppEnums.HouseOwnerFilter).HOUSE_OWNER_ALL, -1, 1)
  _myHosueCombo:SetSelectItemIndex(0)
  _typeCombo:SetSelectItemIndex(0)
  _levelCombo:SetSelectItemIndex(0)
  _edit_Search:SetEditText(defaultKeyWord, true)
end

FGlobal_SelectedFilter = function()
  -- function num : 0_5 , upvalues : _myHosueCombo, _typeCombo, _levelCombo
  local ownerIndex = _myHosueCombo:GetSelectIndex()
  local receipeIndex = _typeCombo:GetSelectIndex()
  local receipeKey = ToClient_getReceipeTypeByIndex(receipeIndex - 1)
  local levelIndex = _levelCombo:GetSelectIndex()
  _myHosueCombo:SetSelectItemIndex(ownerIndex)
  _typeCombo:SetSelectItemIndex(receipeIndex)
  _levelCombo:SetSelectItemIndex(levelIndex)
  FGlobal_FilterEffectClear()
  ToCleint_findHouseByFilter(ownerIndex, receipeKey, levelIndex + 1)
end

FromClient_WorldMap_HouseNaviShow = function(isShow)
  -- function num : 0_6
  FGlobal_FilterReset()
  FGlobal_FilterReceiPeOn()
end

FGlobal_FilterReceiPeOn = function()
  -- function num : 0_7 , upvalues : _typeCombo, _typeList, _itemSize, _typeListScroll
  local count = ToClient_getTownReceipeList()
  _typeCombo:DeleteAllItem()
  local quantity = 0
  if count > 10 then
    quantity = 10
  else
    quantity = count
  end
  _typeList:SetSize(_typeList:GetSizeX(), quantity * _itemSize)
  _typeList:SetItemQuantity(quantity)
  _typeCombo:AddItem(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_OWNERRFILTER_ALL"))
  for idx = 0, count - 1 do
    _typeCombo:AddItem(ToClient_getReceipeName(ToClient_getReceipeTypeByIndex(R10_PC40)))
  end
  _typeCombo:SetSelectItemIndex(0)
  _typeListScroll:SetControlPos(0)
end

FGlobal_FilterLevelOn = function()
  -- function num : 0_8 , upvalues : _typeCombo, _levelCombo
  local receipeIndex = _typeCombo:GetSelectIndex()
  if receipeIndex <= 0 then
    return 
  end
  local maxLevel = ToClient_getReceipeMaxLevelByIndex(receipeIndex)
  _levelCombo:DeleteAllItem()
  for i = 1, maxLevel do
    _levelCombo:AddItem(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_LEVELFILTER") .. " " .. i)
  end
end

FGlobal_HouseNavi_Close = function()
  -- function num : 0_9 , upvalues : IM
  ClearFocusEdit()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

HandleClicked_HouseNaviEditSearch = function()
  -- function num : 0_10 , upvalues : _edit_Search, IM
  _edit_Search:SetEditText("", true)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetUIMode((Defines.UIMode).eUIMode_WoldMapSearch)
end

HandleClicked_HouseNaviSearch = function()
  -- function num : 0_11 , upvalues : _myHosueCombo, _typeCombo, _levelCombo, _edit_Search, IM
  FGlobal_FilterEffectClear()
  _myHosueCombo:SetSelectItemIndex(0)
  _typeCombo:SetSelectItemIndex(0)
  _levelCombo:SetSelectItemIndex(0)
  local searchKeyword = _edit_Search:GetEditText()
  ToClient_findHouseByItemNameInTown(searchKeyword)
  ClearFocusEdit()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  SetUIMode((Defines.UIMode).eUIMode_WorldMap)
end

WorldMap_HouseNavi_Resize = function()
  -- function num : 0_12 , upvalues : filterBG
  filterBG:ComputePos()
end

Worldmap_HouseNavi_Init()
registerEvent("FromClient_SetTownMode", "FromClient_WorldMap_HouseNaviShow")
registerEvent("onScreenResize", "WorldMap_HouseNavi_Resize")

