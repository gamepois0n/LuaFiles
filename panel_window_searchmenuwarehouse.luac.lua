-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\warehouse\panel_window_searchmenuwarehouse.luac 

-- params : ...
-- function num : 0
Panel_Window_SearchMenuWareHouse:SetShow(false, false)
Panel_Window_SearchMenuWareHouse:setMaskingChild(true)
Panel_Window_SearchMenuWareHouse:ActiveMouseEventEffect(true)
Panel_Window_SearchMenuWareHouse:setGlassBackground(true)
Panel_Window_SearchMenuWareHouse:RegisterShowEventFunc(true, "SearchMenuWarehouseShowAni()")
Panel_Window_SearchMenuWareHouse:RegisterShowEventFunc(false, "SearchMenuWarehouseHideAni()")
local UI_color = Defines.Color
SearchMenuWarehouseShowAni = function()
  -- function num : 0_0
  Panel_Window_SearchMenuWareHouse:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Window_SearchMenuWareHouse, 0, 0.15)
  audioPostEvent_SystemUi(1, 0)
end

SearchMenuWarehouseShowAni = function()
  -- function num : 0_1 , upvalues : UI_color
  Panel_Window_SearchMenuWareHouse:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_SearchMenuWareHouse:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  audioPostEvent_SystemUi(1, 0)
end

local searchmenuwarehouse = {
ui = {ListBG = (UI.getChildControl)(Panel_Window_SearchMenuWareHouse, "List_Bg"), list_Title = (UI.getChildControl)(Panel_Window_SearchMenuWareHouse, "List_Title"), list_KeyWord = (UI.getChildControl)(Panel_Window_SearchMenuWareHouse, "List_KeyWord"), list_SearchBG = (UI.getChildControl)(Panel_Window_SearchMenuWareHouse, "List_SearchListBG"), list_scroll = (UI.getChildControl)(Panel_Window_SearchMenuWareHouse, "Scroll_List")}
, 
warehouseButton = {}
, btnMaxCount = 6, scrollStartIdx = 0, warehouseMaxCount = 0}
-- DECOMPILER ERROR at PC79: Confused about usage of register: R2 in 'UnsetPending'

;
(searchmenuwarehouse.ui).list_scrollBtn = (UI.getChildControl)((searchmenuwarehouse.ui).list_scroll, "Scroll_CtrlButton")
searchmenuwarehouse.Init = function(self)
  -- function num : 0_2 , upvalues : searchmenuwarehouse
  searchmenuwarehouse:MakeSearchMenuWareHouseButton()
end

searchmenuwarehouse.UpdateList = function(self)
  -- function num : 0_3
  if self.warehouseMaxCount == 0 then
    self.warehouseMaxCount = ToClient_getWareHouseCount()
    ;
    (UIScroll.SetButtonSize)((self.ui).list_scroll, self.btnMaxCount, self.warehouseMaxCount)
    ;
    ((self.ui).list_KeyWord):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_NODETYPEKEYWORD", "keyword", PAGetString(Defines.StringSheet_RESOURCE, "WAREHOUSE_TXT_TITLE"), "count", self.warehouseMaxCount))
  end
  for idx = 0, self.btnMaxCount - 1 do
    ((self.warehouseButton)[idx]):SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
    ;
    ((self.warehouseButton)[idx]):SetText("")
    ;
    ((self.warehouseButton)[idx]):SetShow(false)
    ;
    ((self.warehouseButton)[idx]):addInputEvent("Mouse_LUp", "")
  end
  local btnCount = 0
  for idx = self.scrollStartIdx, self.warehouseMaxCount - 1 do
    if self.btnMaxCount <= btnCount then
      break
    end
    local resultString = ToClient_getWareHouseName(idx)
    local slot = (self.warehouseButton)[btnCount]
    slot:addInputEvent("Mouse_LUp", "HandleClicked_ViewWareHouse( " .. idx .. " )")
    slot:addInputEvent("Mouse_UpScroll", "SearchMenuWareHouse_Scroll( true )")
    slot:addInputEvent("Mouse_DownScroll", "SearchMenuWareHouse_Scroll( false )")
    slot:SetText(resultString)
    slot:SetShow(true)
    btnCount = btnCount + 1
  end
end

HandleClicked_ViewWareHouse = function(idx)
  -- function num : 0_4
  local waypointKey = ToClient_getWareHouseWaypointKey(idx)
  Warehouse_OpenPanelFromWorldmap(waypointKey, (CppEnums.WarehoouseFromType).eWarehoouseFromType_Worldmap)
  if Panel_Window_Inventory:GetShow() then
    Panel_Window_Inventory:SetShow(false, false)
  end
end

SearchMenuWareHouse_Scroll = function(isUp)
  -- function num : 0_5 , upvalues : searchmenuwarehouse
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  searchmenuwarehouse.scrollStartIdx = (UIScroll.ScrollEvent)((searchmenuwarehouse.ui).list_scroll, isUp, searchmenuwarehouse.btnMaxCount, searchmenuwarehouse.warehouseMaxCount, searchmenuwarehouse.scrollStartIdx, 1)
  searchmenuwarehouse:UpdateList()
end

HandleClicked_SearchMenuWareHouse_ScrollPress = function()
  -- function num : 0_6 , upvalues : searchmenuwarehouse
  local scrollPos = ((searchmenuwarehouse.ui).list_scroll):GetControlPos()
  local resultCount = searchmenuwarehouse.warehouseMaxCount
  local maxViewCount = searchmenuwarehouse.btnMaxCount
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R3 in 'UnsetPending'

  searchmenuwarehouse.scrollStartIdx = (math.ceil)((resultCount - maxViewCount) * scrollPos)
  searchmenuwarehouse:UpdateList()
end

searchmenuwarehouse.MakeSearchMenuWareHouseButton = function(self)
  -- function num : 0_7
  for idx = 0, self.btnMaxCount - 1 do
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R5 in 'UnsetPending'

    (self.warehouseButton)[idx] = (UI.createAndCopyBasePropertyControl)(Panel_Window_SearchMenuWareHouse, "List_itemName", (self.ui).list_SearchBG, "WorldmapGrand_SearchResultList_" .. idx)
    ;
    ((self.warehouseButton)[idx]):SetPosX(4)
    ;
    ((self.warehouseButton)[idx]):SetPosY(5 + (((self.warehouseButton)[idx]):GetSizeY() + 3) * idx)
    ;
    ((self.warehouseButton)[idx]):SetText("")
    ;
    ((self.warehouseButton)[idx]):SetShow(false)
  end
end

searchmenuwarehouse.Open = function(self)
  -- function num : 0_8 , upvalues : searchmenuwarehouse
  ToClient_FindWareHouse(getCurrentWaypointKey())
  self.scrollStartIdx = 0
  ;
  ((self.ui).list_scroll):SetControlTop()
  ;
  ((self.ui).list_scroll):SetControlPos(0)
  Panel_Window_SearchMenuWareHouse:SetShow(true, false)
  searchmenuwarehouse:UpdateList()
end

searchmenuwarehouse.Close = function(self)
  -- function num : 0_9
  Panel_Window_SearchMenuWareHouse:SetShow(false, false)
  self.warehouseMaxCount = 0
end

FGlobal_SearchMenuWareHouse_Open = function()
  -- function num : 0_10 , upvalues : searchmenuwarehouse
  searchmenuwarehouse:Open()
end

FGlobal_SearchMenuWareHouse_Close = function()
  -- function num : 0_11 , upvalues : searchmenuwarehouse
  searchmenuwarehouse:Close()
end

FGlobal_SearchMenuWareHouse_Show = function(isShow)
  -- function num : 0_12
  Panel_Window_SearchMenuWareHouse:SetShow(isShow, false)
end

searchmenuwarehouse.RegistEventHandler = function(self)
  -- function num : 0_13
  ((self.ui).ListBG):addInputEvent("Mouse_UpScroll", "SearchMenuWareHouse_Scroll( true )")
  ;
  ((self.ui).ListBG):addInputEvent("Mouse_DownScroll", "SearchMenuWareHouse_Scroll( false )")
  ;
  ((self.ui).list_scrollBtn):addInputEvent("Mouse_LPress", "HandleClicked_SearchMenuWareHouse_ScrollPress()")
  ;
  ((self.ui).list_scroll):addInputEvent("Mouse_LUp", "HandleClicked_SearchMenuWareHouse_ScrollPress()")
end

searchmenuwarehouse.RegistMessageHandler = function(self)
  -- function num : 0_14
end

searchmenuwarehouse:Init()
searchmenuwarehouse:RegistEventHandler()
searchmenuwarehouse:RegistMessageHandler()

