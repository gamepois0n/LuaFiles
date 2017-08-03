-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stableshop.luac 

-- params : ...
-- function num : 0
Panel_Window_StableShop:SetShow(false, false)
Panel_Window_StableShop:setMaskingChild(true)
Panel_Window_StableShop:ActiveMouseEventEffect(true)
Panel_Window_StableShop:setGlassBackground(true)
local stableShop = {buttonBuyTab = (UI.getChildControl)(Panel_Window_StableShop, "RadioButton_Tab_Buy"), buttonBuy = (UI.getChildControl)(Panel_Window_StableShop, "Button_Command"), scroll = (UI.getChildControl)(Panel_Window_StableShop, "Scroll_Slot_List"), staticMoney = (UI.getChildControl)(Panel_Window_StableShop, "Static_Text_Money"), staticBackPanel = (UI.getChildControl)(Panel_Window_StableShop, "Static_Blackpanel"), baseButton = (UI.getChildControl)(Panel_Window_StableShop, "Button_List"), baseRemainCount = (UI.getChildControl)(Panel_Window_StableShop, "StaticText_RemainCount"), baseInventoryCount = (UI.getChildControl)(Panel_Window_StableShop, "StaticText_InventoryCount"), baseCurrentPrice = (UI.getChildControl)(Panel_Window_StableShop, "StaticText_CurrentPrice"), baseIcon = (UI.getChildControl)(Panel_Window_StableShop, "Static_Icon_Item"), baseEffect = (UI.getChildControl)(Panel_Window_StableShop, "Button_List_Effect"), buttonClose = (UI.getChildControl)(Panel_Window_StableShop, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_StableShop, "Button_Question"), 
slotConfig = {createIcon = true, createBorder = true, createCount = false, createCash = true}
, 
config = {slotCount = 7, slotStartX = 13, slotStartY = 73, slotGapX = 2, slotGapY = 60}
, 
position = {iconPosX = 6, iconPosY = 9, invenCountX = 295, invenCountY = 25, remainCountPosX = 60, remainCountPosY = 40, pricePosX = 288, pricePosY = 42, trendPosX = 50, trendPosY = 25}
, iconSize = 150, borderSize = 150, borderPos = 0, countSpanSize = 4, selectSlotNo = 0, startSlotIndex = 0, slots = (Array.new)()}
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
stableShop.init = function(self)
  -- function num : 0_0
  ;
  (UI.ASSERT)(self.buttonBuyTab ~= nil and type(self.buttonBuyTab) ~= "number", "RadioButton_Tab_Buy")
  ;
  (UI.ASSERT)(self.buttonBuy ~= nil and type(self.buttonBuy) ~= "number", "RadioButton_Tab_Buy")
  ;
  (UI.ASSERT)(self.baseButton ~= nil and type(self.baseButton) ~= "number", "Button_List")
  ;
  (UI.ASSERT)(self.baseRemainCount ~= nil and type(self.baseRemainCount) ~= "number", "StaticText_RemainCount")
  ;
  (UI.ASSERT)(self.baseInventoryCount ~= nil and type(self.baseInventoryCount) ~= "number", "StaticText_InventoryCount")
  ;
  (UI.ASSERT)(self.baseCurrentPrice ~= nil and type(self.baseCurrentPrice) ~= "number", "StaticText_CurrentPrice")
  ;
  (UI.ASSERT)(self.baseIcon ~= nil and type(self.baseIcon) ~= "number", "Static_Icon_Item")
  ;
  (UI.ASSERT)(self.baseEffect ~= nil and type(self.baseEffect) ~= "number", "Button_List_Effect")
  ;
  (UI.ASSERT)(self.scroll ~= nil and type(self.scroll) ~= "number", "Scroll_Slot_List")
  ;
  (UI.ASSERT)(self.staticMoney ~= nil and type(self.staticMoney) ~= "number", "Static_Text_Money")
  ;
  (UI.ASSERT)(self.staticBackPanel ~= nil and type(self.staticBackPanel) ~= "number", "Static_Blackpanel")
  -- DECOMPILER ERROR: 21 unprocessed JMP targets
end

stableShop.registEventHandler = function(self)
  -- function num : 0_1
  (self.buttonBuy):addInputEvent("Mouse_LUp", "StableShop_BuyItem()")
  ;
  (self.staticBackPanel):addInputEvent("Mouse_UpScroll", "StableShop_ScrollEvent( true )")
  ;
  (self.staticBackPanel):addInputEvent("Mouse_DownScroll", "StableShop_ScrollEvent( false )")
  ;
  (self.buttonClose):addInputEvent("Mouse_LUp", "StableShop_WindowClose()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowStableMarket\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelWindowStableMarket\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelWindowStableMarket\", \"false\")")
  ;
  (UIScroll.InputEvent)(self.scroll, "StableShop_ScrollEvent")
end

stableShop.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("FromClient_InventoryUpdate", "StableShop_UpdateMoney")
  registerEvent("FromClient_InventoryUpdate", "StableShop_UpdateSlotData")
  registerEvent("FromClient_NpcShopUpdateByStable", "StableShop_UpdateSlotData")
end

stableShop.createSlot = function(self)
  -- function num : 0_3
  for ii = 0, (self.config).slotCount - 1 do
    local slot = {}
    slot.slotNo = ii
    slot.panel = Panel_Window_StableShop
    slot.button = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Window_StableShop, "ServantShop_Slot_Button_" .. ii)
    CopyBaseProperty(self.baseButton, slot.button)
    ;
    (slot.button):addInputEvent("Mouse_LUp", "StableShop_SlotLClick(" .. ii .. ")")
    ;
    (slot.button):addInputEvent("Mouse_UpScroll", "StableShop_ScrollEvent( true )")
    ;
    (slot.button):addInputEvent("Mouse_DownScroll", "StableShop_ScrollEvent( false )")
    slot.invenCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.button, "ServantShop_Slot_InventoryCount_" .. ii)
    CopyBaseProperty(self.baseInventoryCount, slot.invenCount)
    slot.remainCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.button, "ServantShop_Slot_RemainCount_" .. ii)
    CopyBaseProperty(self.baseRemainCount, slot.remainCount)
    slot.price = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.button, "ServantShop_Slot_Price_" .. ii)
    CopyBaseProperty(self.baseCurrentPrice, slot.price)
    slot.icon = {}
    ;
    (SlotItem.new)(slot.icon, "ServantShop_Slot_Icon_" .. ii, ii, slot.button, self.slotConfig)
    ;
    (slot.icon):createChild()
    slot.effect = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, slot.button, "ServantShop_Slot_Effect_" .. ii)
    CopyBaseProperty(self.baseEffect, slot.effect)
    ;
    (slot.effect):SetIgnore(true)
    ;
    (slot.effect):addInputEvent("Mouse_UpScroll", "StableShop_ScrollEvent( true )")
    ;
    (slot.effect):addInputEvent("Mouse_DownScroll", "StableShop_ScrollEvent( false )")
    ;
    (slot.button):SetPosX((self.config).slotStartX)
    ;
    (slot.button):SetPosY((self.config).slotStartY + (self.config).slotGapY * ii)
    ;
    (slot.button):SetShow(true)
    ;
    ((slot.icon).icon):SetPosX((self.position).iconPosX)
    ;
    ((slot.icon).icon):SetPosY((self.position).iconPosY)
    ;
    ((slot.icon).icon):SetShow(true)
    ;
    (slot.remainCount):SetPosX((self.position).remainCountPosX)
    ;
    (slot.remainCount):SetPosY((self.position).remainCountPosY)
    ;
    (slot.remainCount):SetShow(true)
    ;
    (slot.invenCount):SetPosX((self.position).invenCountX)
    ;
    (slot.invenCount):SetPosY((self.position).invenCountY)
    ;
    (slot.invenCount):SetShow(true)
    ;
    (slot.price):SetPosX((self.position).pricePosX)
    ;
    (slot.price):SetPosY((self.position).pricePosY)
    ;
    (slot.price):SetShow(true)
    ;
    (slot.effect):SetPosX(0)
    ;
    (slot.effect):SetPosY(0)
    -- DECOMPILER ERROR at PC218: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.slots)[ii] = slot
  end
  ;
  (self.buttonBuyTab):SetCheck(true)
  ;
  (self.scroll):SetControlPos(0)
end

stableShop.updateSlot = function(self)
  -- function num : 0_4
  for ii = 0, (self.config).slotCount - 1 do
    (((self.slots)[ii]).button):SetShow(false)
  end
  local itemListSize = 0
  if self.tabIndexBuy == self.lastTabIndex then
    itemListSize = npcShop_getBuyCount()
  else
    if self.tabIndexSell == self.lastTabIndex then
      itemListSize = npcShop_getSellCount()
    else
      itemListSize = npcShop_getRepurchaseCount()
    end
  end
  local inventory = ((getSelfPlayer()):get()):getInventory()
  local s64_inventoryItemCount = 0
  local slotNo = 0
  for ii = self.startSlotIndex, itemListSize - 1 do
    local shopItemWrapper = npcShop_getItemBuy(ii)
    if shopItemWrapper ~= nil then
      local shopItem = shopItemWrapper:get()
      if slotNo <= (self.config).slotCount - 1 then
        local slot = (self.slots)[slotNo]
        ;
        (slot.button):SetText((shopItemWrapper:getStaticStatus()):getName())
        ;
        (slot.icon):setItemByStaticStatus(shopItemWrapper:getStaticStatus())
        ;
        (slot.invenCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_StableShop_HaveN", "Count", tostring(inventory:getItemCount_s64(((shopItemWrapper:getStaticStatus()):get())._key))))
        ;
        (slot.price):SetText(makeDotMoney(shopItem:getItemPriceWithOption()))
        if shopItem.leftCount_s64 < (Defines.s64_const).s64_0 then
          (slot.remainCount):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_StableShop_NoLimits"))
        else
          ;
          (slot.remainCount):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_StableShop_RemainCount", "Count", tostring(s64_stackCount)))
        end
        ;
        (slot.button):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. ii .. ",\"shop\", true)")
        ;
        (slot.button):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. ii .. ",\"shop\", false)")
        Panel_Tooltip_Item_SetPosition(ii, slot.icon, "shop")
        ;
        (slot.button):SetShow(true)
        slotNo = slotNo + 1
      end
    end
  end
  ;
  (self.staticMoney):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  ;
  (UIScroll.SetButtonSize)(self.scroll, (self.config).slotCount, itemListSize)
end

StableShop_UpdateMoney = function()
  -- function num : 0_5 , upvalues : stableShop
  local self = stableShop
  ;
  (self.buttonBuy):SetEnable(true)
  ;
  (self.buttonBuy):SetMonoTone(false)
  ;
  (self.staticMoney):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
end

StableShop_BuyItem = function()
  -- function num : 0_6 , upvalues : stableShop
  local self = stableShop
  npcShop_doBuy(self.selectSlotNo, 1, 0, 0, false)
end

StableShop_WindowClose = function()
  -- function num : 0_7
  if Panel_Window_StableShop:IsShow() then
    Panel_Window_StableShop:SetShow(false, false)
    audioPostEvent_SystemUi(1, 1)
  end
end

StableShop_SlotLClick = function(slotNo)
  -- function num : 0_8 , upvalues : stableShop
  local self = stableShop
  for ii = 0, (self.config).slotCount - 1 do
    (((self.slots)[ii]).effect):SetShow(false)
  end
  ;
  (((self.slots)[slotNo]).effect):SetShow(true)
  self.selectSlotNo = self.startSlotIndex + slotNo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  local characterKeyRaw = servantInfo:getCharacterKeyRaw()
  local sceneIndex = getIndexByCharacterKey(characterKeyRaw)
  stable_previewEquipItemByShop(self.selectSlotNo, sceneIndex)
end

StableShop_ScrollEvent = function(isScrollUp)
  -- function num : 0_9 , upvalues : stableShop
  local self = stableShop
  local itemCount = npcShop_getBuyCount()
  self.startSlotIndex = (UIScroll.ScrollEvent)(self.scroll, isScrollUp, (self.config).slotCount, itemCount, self.startSlotIndex, 1)
  Panel_Tooltip_Item_hideTooltip()
  self:updateSlot()
end

StableShop_OpenPanel = function()
  -- function num : 0_10 , upvalues : stableShop
  if Panel_Window_StableShop:IsShow() then
    return 
  end
  ;
  (UIAni.fadeInSCR_Down)(Panel_Window_StableShop)
  Panel_Window_StableShop:SetShow(true, true)
  local self = stableShop
  ;
  (self.scroll):SetControlPos(0)
  self:updateSlot()
end

StableShop_UpdateSlotData = function()
  -- function num : 0_11 , upvalues : stableShop
  if not Panel_Window_StableShop:IsShow() then
    return 
  end
  local self = stableShop
  self:updateSlot()
end

StableShop_ShowToggle = function()
  -- function num : 0_12 , upvalues : UI_ANI_ADV, UI_color
  local isShow = Panel_Window_StableShop:IsShow()
  if isShow == true then
    Panel_Window_StableShop:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
    local aniInfo1 = Panel_Window_StableShop:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
    aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
    aniInfo1:SetStartIntensity(3)
    aniInfo1:SetEndIntensity(1)
    aniInfo1.IsChangeChild = true
    aniInfo1:SetHideAtEnd(true)
    aniInfo1:SetDisableWhileAni(true)
  else
    do
      ;
      (UIAni.fadeInSCR_Down)(Panel_Window_StableShop)
      Panel_Window_StableShop:SetShow(true, false)
    end
  end
end

StableShop_Close = function()
  -- function num : 0_13 , upvalues : UI_ANI_ADV, UI_color
  Inventory_SetFunctor(nil)
  Panel_Window_StableShop:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_StableShop:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

stableShop:init()
stableShop:createSlot()
stableShop:registEventHandler()
stableShop:registMessageHandler()

