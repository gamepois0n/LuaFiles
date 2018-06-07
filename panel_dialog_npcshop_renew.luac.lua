-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_dialog_npcshop_renew.luac 

-- params : ...
-- function num : 0
local Panel_Dialog_NPCShop_Info = {_initialize = false, 
_ui = {static_BG = nil, static_Title_BG = nil, staticText_Title_Icon_Text = nil, static_BG_Inner = nil, staticText_Tap_Group = nil, static_LT = nil, static_RT = nil, radioButton_Buy = nil, radioButton_Sell = nil, radioButton_Re_Buy = nil, 
radioButton_Tab = {}
, static_Line = nil, frame_Item_List = nil, frame_Content = nil, radioButton_Left_templete = nil, static_Item_Slot_Left_templete = nil, staticText_Name_Left_templete = nil, staticText_Desc_Left_templete = nil, staticText_Price_Left_templete = nil, radioButton_Right_templete = nil, static_Item_Slot_Right_templete = nil, staticText_Name_Right_templete = nil, staticText_Desc_Right_templete = nil, staticText_Price_Right_templete = nil, frame_VerticalScroll = nil, frame_HorizontalScroll = nil, static_Silver = nil, radioButton_Inventory = nil, staticText_Inventory = nil, radioButton_Storage = nil, staticText_Storage = nil, static_Line = nil, static_Key_Guide_ConsoleUI = nil, staticText_Move_ConsoleUI = nil, staticText_Cancel_ConsoleUI = nil, staticText_SomeOrAll_ConsoleUI = nil, staticText_BuyOrSell_ConsoleUI = nil}
, 
_config = {slotCount = 14, slotRows = 0, slotCols = 2}
, 
_space = {itemButtonSpaceY = 0, itemButtonSizeY = 0, tabButtonSizeX = 0, tabButtonSpaceX = 160}
, 
_value = {isCamping = false, lastSelectedSlotIndex = nil, selectedSlotIndex = nil, selectedSlotKeyValue = nil, lastTabIndex = 0, lastStartSlotNo = 0, startSlotIndex = 0, lastScrollValue = 0, inputNumber = 0, itemListSize = 0, enableTrade = false, enableSell = false}
, 
_enum = {etabIndexBuy = 0, etabIndexSell = 1, etabIndexRepurchase = 2}
, 
_text = {textHaveInvenMoney = PAGetString(Defines.StringSheet_RESOURCE, "SHOP_TXT_MYMONEY"), textHaveStorageMoney = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_ICON_MONEY2"), textShop = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_WINDOWTITLE")}
, 
_slots = {}
, 
_slotConfig = {createIcon = true, createBorder = true, createCount = false, createCash = true, createEnchant = true, createEnduranceIcon = true}
, _showAniIsPlaying = false, _currentTabIndex = 0}
local UI_color = Defines.Color
local _const = Defines.s64_const
local ItemSlotTemplete = {}
ItemSlotTemplete.New = function(self)
  -- function num : 0_0 , upvalues : Panel_Dialog_NPCShop_Info, _const, UI_color
  local slot = {selected = false, slotNo = 0, keyValue = -1, showInvenCount = false, isStackable = false, radioButton = nil, item_Slot = nil, staticText_Name = nil, staticText_Desc = nil, staticText_Price = nil}
  slot.setPos = function(self, row)
    -- function num : 0_0_0 , upvalues : Panel_Dialog_NPCShop_Info
    local shopInfo = Panel_Dialog_NPCShop_Info
    local spanX = ((self.radioButton):GetSpanSize()).x
    local newSpanY = (row + 1) * (shopInfo._space).itemButtonSpaceY + row * (shopInfo._space).itemButtonSizeY
    ;
    (self.radioButton):SetSpanSize(spanX, newSpanY)
  end

  slot.setItem = function(self, itemStaticWrapper, s64_stackCount, s64_price, s64_invenCount, rentTime, Intimacy, disable)
    -- function num : 0_0_1 , upvalues : Panel_Dialog_NPCShop_Info, _const, UI_color
    local shopInfo = Panel_Dialog_NPCShop_Info
    local talker = nil
    local characterKey = 0
    local count = 0
    local intimacyValue = 0
    if (shopInfo._value).isCamping == false or (shopInfo._value).isCamping == nil then
      talker = dialog_getTalker()
      characterKey = talker:getCharacterKey()
      count = getIntimacyInformationCount(characterKey)
      intimacyValue = talker:getIntimacy()
    end
    local enable = (_const.s64_0 ~= s64_stackCount and not disable)
    local hasIntimacy = itemStaticWrapper:hasMenatlCardKey()
    ;
    (self.staticText_Name):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    (self.staticText_Name):SetText(itemStaticWrapper:getName())
    ;
    (self.staticText_Desc):SetFontColor(UI_color.C_FFFFFFFF)
    if enable then
      (self.staticText_Name):SetFontColor(UI_color.C_FFFFFFFF)
    else
      (self.staticText_Name):SetFontColor(UI_color.C_FFAAAAAA)
    end
    ;
    (self.icon):setItemByStaticStatus(itemStaticWrapper)
    ;
    ((self.icon).icon):SetMonoTone(not enable)
    ;
    (self.staticText_Price):SetText(makeDotMoney(s64_price))
    local strCount = (string.format)("%d", Int64toInt32(s64_stackCount))
    if s64_stackCount < _const.s64_0 then
      (self.staticText_Desc):SetFontColor(UI_color.C_FF3BD3FF)
      ;
      (self.staticText_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "NPCSHOP_SOLDOUT"))
      ;
      ((self.icon).icon):SetMonoTone(false)
      ;
      (self.staticText_Price):SetMonoTone(false)
    else
      (self.staticText_Desc):SetFontColor(UI_color.C_FF3BD3FF)
      ;
      (self.staticText_Desc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "NPCSHOP_REMAIN_COUNT", "count", strCount))
    end
    if rentTime ~= nil and rentTime > 0 then
      (self.staticText_Desc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEM_ABLE_RENTTIME", "itemRentTime", rentTime))
    end
    if Intimacy ~= nil and Intimacy > 0 and ((shopInfo._value).isCamping == false or (shopInfo._value).isCamping == nil) then
      (self.staticText_Desc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "NPCSHOP_NEED_INTIMACY", "intimacy", Intimacy))
      if intimacyValue < Intimacy then
        (self.staticText_Desc):SetFontColor(UI_color.C_FFD20000)
        ;
        ((self.icon).icon):SetMonoTone(true)
        ;
        (self.staticText_Price):SetMonoTone(true)
        ;
        (self.staticText_Desc):SetMonoTone(true)
      end
    end
    local craftType = nil
    local gather = 0
    fishing = 1
    hunting = 2
    cooking = 3
    alchemy = 4
    manufacture = 5
    training = 6
    trade = 7
    local lifeminLevel = 0
    local lifeType = {[0] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_GATHERING"), [1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_FISHING"), [2] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_HUNTING"), [3] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_COOKING"), [4] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_ALCHEMY"), [5] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_PROCESSING"), [6] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_OBEDIENCE"), [7] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TRADE")}
    local craftType = (itemStaticWrapper:get()):getLifeExperienceType()
    local lifeminLevel = (itemStaticWrapper:get()):getLifeMinLevel(craftType)
    do
      if lifeminLevel > 0 then
        local myLifeLevel = ((getSelfPlayer()):get()):getLifeExperienceLevel(craftType)
        if myLifeLevel < lifeminLevel then
          (self.staticText_Desc):SetFontColor(UI_color.C_FFF26A6A)
          ;
          (self.staticText_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_EQUIP_IMPOSSIBLE"))
        else
          (self.staticText_Desc):SetFontColor(UI_color.C_FF3BD3FF)
          ;
          (self.staticText_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_EQUIP_POSSIBLE"))
        end
      end
      do
        local itemStatic = itemStaticWrapper:get()
        self.isStackable = itemStatic:isStackableXXX()
        if s64_invenCount ~= nil then
          if self.isStackable == true then
            local strCount = (string.format)("%d", Int64toInt32(s64_invenCount))
            ;
            (self.staticText_Desc):SetFontColor(UI_color.C_FFEE7001)
            ;
            (self.staticText_Desc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "NPCSHOP_HAVE_COUNT", "count", strCount))
            self.showInvenCount = true
          else
            local strCount = (string.format)("%d", Int64toInt32(s64_invenCount))
            ;
            (self.staticText_Desc):SetFontColor(UI_color.C_FFEE7001)
            ;
            (self.staticText_Desc):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "NPCSHOP_HAVE_COUNT", "count", strCount))
            self.showInvenCount = false
          end
        else
          self.showInvenCount = false
        end
        if hasIntimacy then
          (self.radioButton):SetIgnore(true)
          ;
          ((self.icon).icon):SetMonoTone(true)
          ;
          (self.staticText_Name):SetMonoTone(true)
          ;
          (self.staticText_Price):SetMonoTone(true)
          ;
          (self.staticText_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_ALREADYHASINTIMACY"))
        else
          (self.radioButton):SetIgnore(false)
          ;
          ((self.icon).icon):SetMonoTone(false)
          ;
          (self.staticText_Name):SetMonoTone(false)
          ;
          (self.staticText_Price):SetMonoTone(false)
          ;
          (self.staticText_Desc):SetMonoTone(false)
        end
        self.keyValue = (itemStatic._key):get()
        self:setShow(true)
        -- DECOMPILER ERROR: 16 unprocessed JMP targets
      end
    end
  end

  slot.setShow = function(self, bShow)
    -- function num : 0_0_2
    if not bShow then
      bShow = false
    end
    ;
    (self.radioButton):SetShow(bShow)
    ;
    (self.staticText_Name):SetShow(bShow)
    ;
    (self.staticText_Price):SetShow(bShow)
    ;
    (self.staticText_Desc):SetShow(bShow)
    ;
    (self.item_Slot):SetShow(bShow)
    ;
    ((self.icon).icon):SetShow(bShow)
  end

  slot.setSelect = function(self, bSelect)
    -- function num : 0_0_3
    self.selected = bSelect
    ;
    (self.radioButton):SetCheck(bSelect)
  end

  slot.clearItem = function(self)
    -- function num : 0_0_4
    self:setSelect(false)
    self:setShow(false)
    self.keyValue = -1
  end

  return slot
end

Panel_Dialog_NPCShop_Info.registerMessageHandler = function(self)
  -- function num : 0_1
  Panel_Dialog_NPCShop:RegisterShowEventFunc(true, "PaGlobalFunc_Dialog_NPCShop_ShowAni()")
  Panel_Dialog_NPCShop:RegisterShowEventFunc(false, "PaGlobalFunc_Dialog_NPCShop_HideAni()")
  registerEvent("onScreenResize", "FromClient_onScreenResize_Dialog_NPCShop")
  registerEvent("EventNpcShopUpdate", "FromClient_Dialog_NPCShop_UpdateContent")
  registerEvent("FromClient_InventoryUpdate", "FromClient_Dialog_NPCShop_UpdateMoney")
  registerEvent("EventWarehouseUpdate", "FromClient_Dialog_NPCShop_UpdateMoneyWarehouse")
  registerEvent("UpdateGuildPriceLimit", "FromClient_Dialog_NPCShop_UpdateGuildPriceLimit")
end

Panel_Dialog_NPCShop_Info.registEventHandler = function(self)
  -- function num : 0_2
  for index = 0, 2 do
    (((self._ui).radioButton_Tab)[index]):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_NPCShop_TabButtonClick(" .. index .. ")")
  end
  ;
  ((self._ui).staticText_Cancel_ConsoleUI):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_NPCShop_Close()")
  ;
  ((self._ui).staticText_BuyOrSell_ConsoleUI):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_NPCShop_BuyOrSellItem()")
  ;
  ((self._ui).staticText_SomeOrAll_ConsoleUI):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_NPCShop_BuySomeOrSellAllItem()")
end

Panel_Dialog_NPCShop_Info.initialize = function(self)
  -- function num : 0_3
  self._initialize = true
  self:close()
  self:childControl()
  self:initValue()
  self:createSlot()
  self:registerMessageHandler()
  self:registEventHandler()
end

Panel_Dialog_NPCShop_Info.initValue = function(self)
  -- function num : 0_4
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._config).slotRows = (self._config).slotCount / (self._config).slotCols
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).lastTabIndex = (self._enum).etabIndexBuy
end

Panel_Dialog_NPCShop_Info.childControl = function(self)
  -- function num : 0_5
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).static_BG = (UI.getChildControl)(Panel_Dialog_NPCShop, "Static_BG")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Title_BG = (UI.getChildControl)(Panel_Dialog_NPCShop, "Static_Title_BG")
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Title_Icon_Text = (UI.getChildControl)((self._ui).static_Title_BG, "StaticText_Title_Icon_Text")
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_BG_Inner = (UI.getChildControl)(Panel_Dialog_NPCShop, "Static_BG_Inner")
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Tap_Group = (UI.getChildControl)(Panel_Dialog_NPCShop, "StaticText_Tap_Group")
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_LT = (UI.getChildControl)((self._ui).staticText_Tap_Group, "Static_LT")
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_RT = (UI.getChildControl)((self._ui).staticText_Tap_Group, "Static_RT")
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Buy = (UI.getChildControl)((self._ui).staticText_Tap_Group, "RadioButton_Buy")
  -- DECOMPILER ERROR at PC67: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Sell = (UI.getChildControl)((self._ui).staticText_Tap_Group, "RadioButton_Sell")
  -- DECOMPILER ERROR at PC75: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Re_Buy = (UI.getChildControl)((self._ui).staticText_Tap_Group, "RadioButton_Re_Buy")
  -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radioButton_Tab)[0] = (self._ui).radioButton_Buy
  -- DECOMPILER ERROR at PC85: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radioButton_Tab)[1] = (self._ui).radioButton_Sell
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radioButton_Tab)[2] = (self._ui).radioButton_Re_Buy
  -- DECOMPILER ERROR at PC96: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._space).tabButtonSizeX = ((self._ui).radioButton_Buy):GetSizeX()
  -- DECOMPILER ERROR at PC104: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Line = (UI.getChildControl)((self._ui).staticText_Tap_Group, "Static_Line")
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_Item_List = (UI.getChildControl)(Panel_Dialog_NPCShop, "Frame_Item_List")
  -- DECOMPILER ERROR at PC119: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_Content = (UI.getChildControl)((self._ui).frame_Item_List, "Frame_Content")
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Left_templete = (UI.getChildControl)((self._ui).frame_Content, "RadioButton_Left")
  -- DECOMPILER ERROR at PC135: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Item_Slot_Left_templete = (UI.getChildControl)((self._ui).radioButton_Left_templete, "Static_Item_Slot_Left")
  -- DECOMPILER ERROR at PC143: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Name_Left_templete = (UI.getChildControl)((self._ui).radioButton_Left_templete, "StaticText_Name_Left")
  -- DECOMPILER ERROR at PC151: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Desc_Left_templete = (UI.getChildControl)((self._ui).radioButton_Left_templete, "StaticText_Desc_Left")
  -- DECOMPILER ERROR at PC159: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Price_Left_templete = (UI.getChildControl)((self._ui).radioButton_Left_templete, "StaticText_Price_Left")
  -- DECOMPILER ERROR at PC167: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Right_templete = (UI.getChildControl)((self._ui).frame_Content, "RadioButton_Right")
  -- DECOMPILER ERROR at PC175: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Item_Slot_Right_templete = (UI.getChildControl)((self._ui).radioButton_Right_templete, "Static_Item_Slot_Right")
  -- DECOMPILER ERROR at PC183: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Name_Right_templete = (UI.getChildControl)((self._ui).radioButton_Right_templete, "StaticText_Name_Right")
  -- DECOMPILER ERROR at PC191: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Desc_Right_templete = (UI.getChildControl)((self._ui).radioButton_Right_templete, "StaticText_Desc_Right")
  -- DECOMPILER ERROR at PC199: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Price_Right_templete = (UI.getChildControl)((self._ui).radioButton_Right_templete, "StaticText_Price_Right")
  ;
  ((self._ui).radioButton_Left_templete):SetShow(false)
  ;
  ((self._ui).static_Item_Slot_Left_templete):SetShow(false)
  ;
  ((self._ui).staticText_Name_Left_templete):SetShow(false)
  ;
  ((self._ui).staticText_Desc_Left_templete):SetShow(false)
  ;
  ((self._ui).staticText_Price_Left_templete):SetShow(false)
  ;
  ((self._ui).radioButton_Right_templete):SetShow(false)
  ;
  ((self._ui).static_Item_Slot_Right_templete):SetShow(false)
  ;
  ((self._ui).staticText_Name_Right_templete):SetShow(false)
  ;
  ((self._ui).staticText_Desc_Right_templete):SetShow(false)
  ;
  ((self._ui).staticText_Price_Right_templete):SetShow(false)
  -- DECOMPILER ERROR at PC256: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._space).itemButtonSpaceY = (((self._ui).radioButton_Left_templete):GetSpanSize()).y
  -- DECOMPILER ERROR at PC262: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._space).itemButtonSizeY = ((self._ui).radioButton_Left_templete):GetSizeY()
  -- DECOMPILER ERROR at PC270: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_VerticalScroll = (UI.getChildControl)((self._ui).frame_Item_List, "Frame_VerticalScroll")
  -- DECOMPILER ERROR at PC277: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Silver = (UI.getChildControl)(Panel_Dialog_NPCShop, "Static_Silver")
  -- DECOMPILER ERROR at PC285: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Inventory = (UI.getChildControl)((self._ui).static_Silver, "RadioButton_Inventory")
  -- DECOMPILER ERROR at PC293: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Inventory = (UI.getChildControl)((self._ui).static_Silver, "StaticText_Inventory")
  -- DECOMPILER ERROR at PC301: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Storage = (UI.getChildControl)((self._ui).static_Silver, "RadioButton_Storage")
  -- DECOMPILER ERROR at PC309: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Storage = (UI.getChildControl)((self._ui).static_Silver, "StaticText_Storage")
  -- DECOMPILER ERROR at PC317: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Line = (UI.getChildControl)((self._ui).static_Silver, "Static_Line")
  -- DECOMPILER ERROR at PC324: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Key_Guide_ConsoleUI = (UI.getChildControl)(Panel_Dialog_NPCShop, "Static_Key_Guide_ConsoleUI")
  -- DECOMPILER ERROR at PC332: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Move_ConsoleUI = (UI.getChildControl)((self._ui).static_Key_Guide_ConsoleUI, "StaticText_Move_ConsoleUI")
  -- DECOMPILER ERROR at PC340: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Cancel_ConsoleUI = (UI.getChildControl)((self._ui).static_Key_Guide_ConsoleUI, "StaticText_Cancel_ConsoleUI")
  -- DECOMPILER ERROR at PC348: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_SomeOrAll_ConsoleUI = (UI.getChildControl)((self._ui).static_Key_Guide_ConsoleUI, "StaticText_SomeOrAll_ConsoleUI")
  -- DECOMPILER ERROR at PC356: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_BuyOrSell_ConsoleUI = (UI.getChildControl)((self._ui).static_Key_Guide_ConsoleUI, "StaticText_BuyOrSell_ConsoleUI")
end

Panel_Dialog_NPCShop_Info.open = function(self, showAni)
  -- function num : 0_6
  if showAni == true then
    Panel_Dialog_NPCShop:SetShow(true, true)
  else
    Panel_Dialog_NPCShop:SetShow(true, false)
  end
end

Panel_Dialog_NPCShop_Info.close = function(self, showAni)
  -- function num : 0_7
  if showAni == true then
    Panel_Dialog_NPCShop:SetShow(false, true)
  else
    Panel_Dialog_NPCShop:SetShow(false, false)
  end
end

Panel_Dialog_NPCShop_Info.resize = function(self)
  -- function num : 0_8
  Panel_Dialog_NPCShop:ComputePos()
  if Panel_Window_Inventory:GetShow() then
    local screenX = getScreenSizeX()
    local startPosX = getScreenSizeX() - Panel_Window_Inventory:GetSizeX() - 60 - Panel_Dialog_NPCShop:GetSizeX()
    if startPosX > 0 then
      Panel_Dialog_NPCShop:SetPosX(startPosX)
    else
      Panel_Dialog_NPCShop:SetHorizonLeft()
    end
  end
end

Panel_Dialog_NPCShop_Info.update = function(self)
  -- function num : 0_9
end

Panel_Dialog_NPCShop_Info.createSlot = function(self)
  -- function num : 0_10 , upvalues : ItemSlotTemplete
  local index = 0
  for row = 0, (self._config).slotRows - 1 do
    for col = 0, (self._config).slotCols - 1 do
      index = row * (self._config).slotCols + col
      local strId = "" .. row .. "_" .. col
      local slot = ItemSlotTemplete:New()
      slot.slotNo = index
      if (index) % 2 == 0 then
        slot.radioButton = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, (self._ui).frame_Content, "Content_Item_Button_" .. strId)
        CopyBaseProperty((self._ui).radioButton_Left_templete, slot.radioButton)
        slot.item_Slot = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, slot.radioButton, "Content_Item_Slot_" .. strId)
        CopyBaseProperty((self._ui).static_Item_Slot_Left_templete, slot.item_Slot)
        slot.staticText_Name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.radioButton, "Content_Item_Name_" .. strId)
        CopyBaseProperty((self._ui).staticText_Name_Left_templete, slot.staticText_Name)
        slot.staticText_Desc = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.radioButton, "Content_Item_Desc_" .. strId)
        CopyBaseProperty((self._ui).staticText_Desc_Left_templete, slot.staticText_Desc)
        slot.staticText_Price = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.radioButton, "Content_Item_Prce_" .. strId)
        CopyBaseProperty((self._ui).staticText_Price_Left_templete, slot.staticText_Price)
      else
        slot.radioButton = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_RADIOBUTTON, (self._ui).frame_Content, "Content_Item_Button_" .. strId)
        CopyBaseProperty((self._ui).radioButton_Right_templete, slot.radioButton)
        slot.item_Slot = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, slot.radioButton, "Content_Item_Slot_" .. strId)
        CopyBaseProperty((self._ui).static_Item_Slot_Right_templete, slot.item_Slot)
        slot.staticText_Name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.radioButton, "Content_Item_Name_" .. strId)
        CopyBaseProperty((self._ui).staticText_Name_Right_templete, slot.staticText_Name)
        slot.staticText_Desc = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.radioButton, "Content_Item_Desc_" .. strId)
        CopyBaseProperty((self._ui).staticText_Desc_Right_templete, slot.staticText_Desc)
        slot.staticText_Price = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.radioButton, "Content_Item_Prce_" .. strId)
        CopyBaseProperty((self._ui).staticText_Price_Right_templete, slot.staticText_Price)
      end
      if ToClient_isXBox() == true then
        (slot.radioButton):addInputEvent("Mouse_On", "PaGlobalFunc_Dialog_NPCShop_OnSlotClicked(" .. index .. ")")
        ;
        (slot.radioButton):addInputEvent("Mouse_RUp", "PaGlobalFunc_Dialog_NPCShop_OnRSlotClicked(" .. index .. ")")
        ;
        (slot.radioButton):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_NPCShop_BuySomeOrSellAllItem()")
      else
        ;
        (slot.radioButton):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_NPCShop_OnSlotClicked(" .. index .. ")")
        ;
        (slot.radioButton):addInputEvent("Mouse_RUp", "PaGlobalFunc_Dialog_NPCShop_OnRSlotClicked(" .. index .. ")")
      end
      ;
      (slot.radioButton):addInputEvent("Mouse_UpScroll", "PaGlobalFunc_Dialog_NPCShop_ScrollEvent( true )")
      ;
      (slot.radioButton):addInputEvent("Mouse_DownScroll", "PaGlobalFunc_Dialog_NPCShop_ScrollEvent( false )")
      slot.icon = {}
      ;
      (SlotItem.new)(slot.icon, "Content_Item_Icon" .. index, index, slot.item_Slot, self._slotConfig)
      ;
      (slot.icon):createChild()
      slot:setPos(row)
      slot:setShow(true)
      -- DECOMPILER ERROR at PC266: Confused about usage of register: R12 in 'UnsetPending'

      ;
      (self._slots)[index] = slot
    end
  end
end

Panel_Dialog_NPCShop_Info.updateContent = function(self, updateForce)
  -- function num : 0_11
  if (self._value).lastTabIndex == nil or (self._value).lastTabIndex < (self._enum).etabIndexBuy or (self._enum).etabIndexRepurchase < (self._value).lastTabIndex then
    (UI.ASSERT)(false, "======== [LOVELYK2] =======\nWrong NpcShop Tab Index!! : " .. (self._value).lastTabIndex)
    return 
  end
  self:open(false)
  self:setPosTabButton()
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).itemListSize = 0
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

  if (self._enum).etabIndexBuy == (self._value).lastTabIndex then
    (self._value).itemListSize = npcShop_getBuyCount()
  else
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

    if (self._enum).etabIndexSell == (self._value).lastTabIndex then
      (self._value).itemListSize = npcShop_getSellCount()
    else
      -- DECOMPILER ERROR at PC57: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (self._value).itemListSize = npcShop_getRepurchaseCount()
    end
  end
  if (self._value).itemListSize <= 0 then
    for index = 0, (self._config).slotCount - 1 do
      ((self._slots)[index]):clearItem()
    end
    PaGlobalFunc_Dialog_NPCShop_OnSlotClicked()
    ;
    ((self._ui).frame_VerticalScroll):SetEnable(false)
    ;
    ((self._ui).frame_VerticalScroll):SetMonoTone(true)
    ;
    ((self._ui).frame_VerticalScroll):SetShow(false)
    return 
  end
  if updateForce or (self._value).startSlotIndex ~= (self._value).lastStartSlotNo then
    self:updateContentData()
  end
  ;
  (UIScroll.SetButtonSize)((self._ui).frame_VerticalScroll, (self._config).slotCount, (self._value).itemListSize)
  if (self._value).itemListSize == (self._value).startSlotIndex + (self._config).slotRows then
    ((self._ui).frame_VerticalScroll):SetControlBottom()
  end
  PaGlobal_TutorialManager:handleNpcShopUpdateContent()
end

Panel_Dialog_NPCShop_Info.updateContentData = function(self)
  -- function num : 0_12 , upvalues : UI_color
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  if (self._enum).etabIndexBuy ~= (self._value).lastTabIndex and (self._config).slotRows <= (self._value).itemListSize and (self._value).itemListSize < (self._value).startSlotIndex + (self._config).slotRows then
    (self._value).startSlotIndex = (self._value).startSlotIndex
    ;
    (self.scroll):SetControlBottom()
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).lastStartSlotNo = (self._value).startSlotIndex
  local newSelectSlot = nil
  if (self._value).selectedSlotIndex ~= nil and (self._enum).etabIndexRepurchase ~= (self._value).lastTabIndex then
    local maxSlotNo = (math.min)((self._value).startSlotIndex + (self._config).slotCount, (self._value).itemListSize)
    local lastSelectedSlotNo = ((self._slots)[(self._value).selectedSlotIndex]).slotNo
    if (self._value).startSlotIndex <= lastSelectedSlotNo and lastSelectedSlotNo < maxSlotNo then
      newSelectSlot = lastSelectedSlotNo - (self._value).startSlotIndex
    end
    PaGlobalFunc_Dialog_NPCShop_OnSlotClicked()
  end
  do
    local inventory = ((getSelfPlayer()):get()):getInventory()
    for index = 0, (self._config).slotCount - 1 do
      local slot = (self._slots)[index]
      slot.slotNo = (self._value).startSlotIndex + index
      if slot.slotNo < (self._value).itemListSize then
        local shopItemWrapper, s64_inventoryItemCount = nil, nil
        if (self._enum).etabIndexBuy == (self._value).lastTabIndex then
          shopItemWrapper = npcShop_getItemBuy(slot.slotNo)
        else
          if (self._enum).etabIndexSell == (self._value).lastTabIndex then
            shopItemWrapper = npcShop_getItemSell(slot.slotNo)
            s64_inventoryItemCount = inventory:getItemCount_s64(((shopItemWrapper:getStaticStatus()):get())._key)
          else
            slot.slotNo = (self._value).itemListSize - slot.slotNo - 1
            shopItemWrapper = npcShop_getItemRepurchase(slot.slotNo)
          end
        end
        local itemPrice_s64 = nil
        do
          if shopItemWrapper ~= nil then
            local shopItem = shopItemWrapper:get()
            if (self._enum).etabIndexSell == (self._value).lastTabIndex then
              itemPrice_s64 = shopItem:getItemSellPriceWithOption()
              if ToClient_isXBox() == true then
                (slot.radioButton):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_NPCShop_BuySomeOrSellAllItem()")
              end
              slot:setItem(shopItemWrapper:getStaticStatus(), shopItem.leftCount_s64, itemPrice_s64, s64_inventoryItemCount, shopItem:getItemUsablePeriod())
            else
              if (self._enum).etabIndexBuy == (self._value).lastTabIndex then
                itemPrice_s64 = shopItem:getItemPriceWithOption()
                if ToClient_isXBox() == true then
                  (slot.radioButton):addInputEvent("Mouse_LUp", "PaGlobalFunc_Dialog_NPCShop_BuySomeOrSellAllItem()")
                end
                slot:setItem(shopItemWrapper:getStaticStatus(), shopItem.leftCount_s64, itemPrice_s64, s64_inventoryItemCount, shopItem:getItemUsablePeriod(), shopItem:getNeedIntimacy())
              else
                itemPrice_s64 = shopItem.price_s64
                if ToClient_isXBox() == true then
                  (slot.radioButton):addInputEvent("Mouse_LUp", "")
                end
                slot:setItem(shopItemWrapper:getStaticStatus(), shopItem.leftCount_s64, itemPrice_s64, s64_inventoryItemCount, shopItem:getItemUsablePeriod(), shopItem:getNeedIntimacy())
              end
            end
            ;
            ((slot.icon).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. slot.slotNo .. ",\"shop\", true)")
            ;
            ((slot.icon).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. slot.slotNo .. ",\"shop\", false)")
            Panel_Tooltip_Item_SetPosition(slot.slotNo, slot.icon, "shop")
          end
          local moneyItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, getMoneySlotNo())
          local myInvenMoney_s64 = toInt64(0, 0)
          if moneyItemWrapper ~= nil then
            myInvenMoney_s64 = (moneyItemWrapper:get()):getCount_s64()
          end
          local myWareHouseMoney_s64 = warehouse_moneyFromNpcShop_s64()
          if npcShop_isGuildShopContents() then
            local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
            if myGuildListInfo ~= nil then
              if (self._enum).etabIndexBuy == (self._value).lastTabIndex and myGuildListInfo:getGuildBusinessFunds_s64() < itemPrice_s64 then
                (slot.staticText_Price):SetFontColor(UI_color.C_FFD20000)
              else
                ;
                (slot.staticText_Price):SetFontColor(UI_color.C_FFE7E7E7)
              end
            else
              ;
              (slot.staticText_Price):SetFontColor(UI_color.C_FFD20000)
            end
          else
            do
              do
                do
                  if (self._enum).etabIndexBuy == (self._value).lastTabIndex and myInvenMoney_s64 < itemPrice_s64 and myWareHouseMoney_s64 < itemPrice_s64 then
                    (slot.staticText_Price):SetFontColor(UI_color.C_FFD20000)
                  else
                    ;
                    (slot.staticText_Price):SetFontColor(UI_color.C_FFE7E7E7)
                  end
                  slot:clearItem()
                  -- DECOMPILER ERROR at PC320: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC320: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC320: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC320: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC320: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC320: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC320: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
    if newSelectSlot ~= nil then
      PaGlobalFunc_Dialog_NPCShop_OnSlotClicked(newSelectSlot)
    else
      if (self._value).selectedSlotIndex then
        local lastSelectedSlot = (self._slots)[(self._value).selectedSlotIndex]
        if lastSelectedSlot.keyValue ~= (self._value).selectedSlotKeyValue then
          PaGlobalFunc_Dialog_NPCShop_OnSlotClicked()
        end
      end
    end
    do
      local dialogData = ToClient_GetCurrentDialogData()
      if dialogData == nil then
        ((self._ui).staticText_Title_Icon_Text):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_WINDOWTITLE"))
        return 
      end
    end
  end
end

Panel_Dialog_NPCShop_Info.perFrameUpdate = function(self)
  -- function num : 0_13
end

Panel_Dialog_NPCShop_Info.preShow = function(self)
  -- function num : 0_14 , upvalues : Panel_Dialog_NPCShop_Info
  if not PaGlobalFunc_Dialog_NPCShop_GetShow() then
    local self = Panel_Dialog_NPCShop_Info
    audioPostEvent_SystemUi(1, 0)
    InventoryWindow_Show()
    self:resize()
    self:controlInit()
    self:checkInit()
  end
end

Panel_Dialog_NPCShop_Info.controlInit = function(self)
  -- function num : 0_15 , upvalues : UI_color
  self:clearTabButton()
  self:setPosTabButton()
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).lastTabIndex = (self._enum).etabIndexBuy
  ;
  (((self._ui).radioButton_Tab)[(self._enum).etabIndexBuy]):SetCheck(true)
  ;
  (((self._ui).radioButton_Tab)[(self._enum).etabIndexBuy]):SetMonoTone(true)
  ;
  (((self._ui).radioButton_Tab)[(self._enum).etabIndexBuy]):SetFontColor(UI_color.C_FFFFFFFF)
  ;
  (((self._ui).radioButton_Tab)[(self._enum).etabIndexSell]):SetMonoTone(false)
  ;
  (((self._ui).radioButton_Tab)[(self._enum).etabIndexRepurchase]):SetMonoTone(false)
  ;
  (((self._ui).radioButton_Tab)[(self._enum).etabIndexBuy]):SetText(PAGetString(Defines.StringSheet_GAME, "NPCSHOP_BUY"))
  ;
  (((self._ui).radioButton_Tab)[(self._enum).etabIndexSell]):SetText(PAGetString(Defines.StringSheet_GAME, "NPCSHOP_SELL"))
  ;
  (((self._ui).radioButton_Tab)[(self._enum).etabIndexRepurchase]):SetText(PAGetString(Defines.StringSheet_GAME, "NPCSHOP_REPURCHASE"))
  PaGlobalFunc_Dialog_NPCShop_OnSlotClicked()
  -- DECOMPILER ERROR at PC88: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).lastScrollValue = 0
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).lastStartSlotNo = 0
  -- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).startSlotIndex = 0
  for index = 0, (self._config).slotCount - 1 do
    ((self._slots)[index]):clearItem()
  end
  self:setKeyguide()
  local talker = dialog_getTalker()
  if talker ~= nil then
    local actorProxyWrapper = getNpcActor(talker:getActorKey())
    if actorProxyWrapper ~= nil then
      local characterSSW = actorProxyWrapper:getCharacterStaticStatusWrapper()
      -- DECOMPILER ERROR at PC123: Confused about usage of register: R4 in 'UnsetPending'

      if characterSSW:isSellingNormalShop() then
        (self._value).enableSell = true
        ;
        (((self._ui).radioButton_Tab)[(self._enum).etabIndexSell]):SetShow(true)
        ;
        (((self._ui).radioButton_Tab)[(self._enum).etabIndexRepurchase]):SetShow(true)
      else
        -- DECOMPILER ERROR at PC142: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (self._value).enableSell = false
        ;
        (((self._ui).radioButton_Tab)[(self._enum).etabIndexSell]):SetShow(false)
        ;
        (((self._ui).radioButton_Tab)[(self._enum).etabIndexRepurchase]):SetShow(false)
      end
      if npcShop_isGuildShopContents() then
        if ToClient_GetMyGuildInfoWrapper() == nil then
          ((self._ui).radioButton_Inventory):SetShow(false)
          ;
          ((self._ui).radioButton_Storage):SetShow(false)
          ;
          ((self._ui).staticText_Inventory):SetShow(false)
          ;
          ((self._ui).staticText_Storage):SetShow(false)
        else
          ;
          ((self._ui).radioButton_Inventory):SetShow(true)
          ;
          ((self._ui).radioButton_Storage):SetShow(true)
          ;
          ((self._ui).staticText_Inventory):SetShow(true)
          ;
          ((self._ui).staticText_Storage):SetShow(true)
        end
      end
    else
      do
        -- DECOMPILER ERROR at PC214: Confused about usage of register: R3 in 'UnsetPending'

        if (self._value).isCamping then
          (self._value).enableSell = false
          ;
          (((self._ui).radioButton_Tab)[(self._enum).etabIndexSell]):SetShow(false)
          ;
          (((self._ui).radioButton_Tab)[(self._enum).etabIndexRepurchase]):SetShow(false)
        end
      end
    end
  end
end

Panel_Dialog_NPCShop_Info.setKeyguide = function(self)
  -- function num : 0_16
  ((self._ui).staticText_Cancel_ConsoleUI):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_KeyCustom_Ui_17"))
  if (self._enum).etabIndexBuy == (self._value).lastTabIndex then
    ((self._ui).staticText_SomeOrAll_ConsoleUI):SetShow(true)
    ;
    ((self._ui).staticText_BuyOrSell_ConsoleUI):SetText(PAGetString(Defines.StringSheet_GAME, "NPCSHOP_BUY"))
    ;
    ((self._ui).staticText_SomeOrAll_ConsoleUI):SetText(PAGetString(Defines.StringSheet_RESOURCE, "SHOP_BTN_MULTIBUY"))
  else
    if (self._enum).etabIndexSell == (self._value).lastTabIndex then
      ((self._ui).staticText_SomeOrAll_ConsoleUI):SetShow(true)
      ;
      ((self._ui).staticText_BuyOrSell_ConsoleUI):SetText(PAGetString(Defines.StringSheet_GAME, "NPCSHOP_SELL"))
      ;
      ((self._ui).staticText_SomeOrAll_ConsoleUI):SetText(PAGetString(Defines.StringSheet_RESOURCE, "SHOP_BTN_MULTISELL"))
    else
      ;
      ((self._ui).staticText_SomeOrAll_ConsoleUI):SetShow(false)
      ;
      ((self._ui).staticText_BuyOrSell_ConsoleUI):SetText(PAGetString(Defines.StringSheet_GAME, "NPCSHOP_REPURCHASE"))
      ;
      ((self._ui).staticText_SomeOrAll_ConsoleUI):SetText(PAGetString(Defines.StringSheet_RESOURCE, "SHOP_BTN_MULTIBUY"))
    end
  end
  ;
  ((self._ui).staticText_SomeOrAll_ConsoleUI):SetEnable(false)
  ;
  ((self._ui).staticText_SomeOrAll_ConsoleUI):SetMonoTone(true)
end

Panel_Dialog_NPCShop_Info.updateKeyguide = function(self)
  -- function num : 0_17
  self:setKeyguide()
end

Panel_Dialog_NPCShop_Info.clearTabButton = function(self)
  -- function num : 0_18 , upvalues : UI_color
  for key,value in pairs((self._ui).radioButton_Tab) do
    value:SetFontColor(UI_color.C_FF888888)
    value:SetMonoTone(true)
    value:SetCheck(false)
  end
end

Panel_Dialog_NPCShop_Info.setPosTabButton = function(self)
  -- function num : 0_19
  local tabCount = 0
  local tabButton = {}
  for index = 0, 2 do
    if (((self._ui).radioButton_Tab)[index]):GetShow() then
      tabButton[index] = ((self._ui).radioButton_Tab)[index]
      tabCount = tabCount + 1
    end
  end
  local BaseX = Panel_Dialog_NPCShop:GetPosX()
  local sizeX = Panel_Dialog_NPCShop:GetSizeX()
  local startPosX = sizeX / 2 - ((tabCount) * ((self._space).tabButtonSizeX / 2) + (tabCount - 1) * ((self._space).tabButtonSpaceX / 2))
  for index = 0, tabCount - 1 do
    (tabButton[index]):SetPosX(startPosX + index * ((self._space).tabButtonSizeX + (self._space).tabButtonSpaceX))
  end
end

Panel_Dialog_NPCShop_Info.guildCheckByBuy = function(self)
  -- function num : 0_20
  local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
  if myGuildInfo == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_NPCSHOP_GUILD1"))
    return false
  end
  local guildGrade = myGuildInfo:getGuildGrade()
  if guildGrade == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOGUE_NPCSHOP_GUILD2"))
    return false
  end
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  local isGuildSubMaster = ((getSelfPlayer()):get()):isGuildSubMaster()
  local isSupplyOfficer = ((getSelfPlayer()):get()):isGuildSupplyOfficer()
  return true
end

Panel_Dialog_NPCShop_Info.sellConfirm = function(self)
  -- function num : 0_21
  return (playerWrapper:get()):requestSellItem(slotNo, itemCount, fromWhereType, toWhereType, (self._value).isCamping)
end

Panel_Dialog_NPCShop_Info.checkInit = function(self)
  -- function num : 0_22
  if npcShop_isGuildShopContents() == true then
    return 
  end
  if ((self._ui).radioButton_Inventory):IsCheck() then
    return 
  end
  if ToClient_HasWareHouseFromNpc() then
    if toInt64(0, 0) == warehouse_moneyFromNpcShop_s64() then
      ((self._ui).radioButton_Inventory):SetCheck(true)
      ;
      ((self._ui).radioButton_Storage):SetCheck(false)
    else
      ;
      ((self._ui).radioButton_Inventory):SetCheck(false)
      ;
      ((self._ui).radioButton_Storage):SetCheck(true)
    end
    ;
    ((self._ui).radioButton_Storage):SetShow(true)
    ;
    ((self._ui).staticText_Storage):SetShow(true)
  else
    ;
    ((self._ui).radioButton_Storage):SetShow(false)
    ;
    ((self._ui).staticText_Storage):SetShow(false)
    ;
    ((self._ui).radioButton_Inventory):SetCheck(true)
    ;
    ((self._ui).radioButton_Storage):SetCheck(false)
  end
end

PaGlobalFunc_Dialog_NPCShop_Open = function()
  -- function num : 0_23 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  self._currentTabIndex = 0
end

PaGlobalFunc_Dialog_NPCShop_Close = function()
  -- function num : 0_24
  if Panel_Dialog_NPCShop:GetShow() then
    Panel_Dialog_NPCShop:SetShow(false, false)
    PaGlobalFunc_MainDialog_Bottom_OpenEndHide()
    audioPostEvent_SystemUi(1, 1)
    InventoryWindow_Close()
    PaGlobal_TutorialManager:handleNpcShopWindowClose()
    if PaGlobal_Camp:getIsCamping() then
      InventoryWindow_Close()
      PaGlobal_Camp:open()
    end
  end
end

PaGlobalFunc_Dialog_NPCShop_GetShow = function()
  -- function num : 0_25
  return Panel_Dialog_NPCShop:GetShow()
end

PaGlobalFunc_Dialog_NPCShop_IsShow = function()
  -- function num : 0_26
  return Panel_Dialog_NPCShop:IsShow()
end

PaGlobalFunc_Dialog_NPCShop_ExitButton = function()
  -- function num : 0_27
  if PaGlobalFunc_Dialog_NPCShop_GetShow() then
    Panel_Dialog_NPCShop:SetShow(false, false)
    audioPostEvent_SystemUi(1, 1)
    InventoryWindow_Close()
    ReqeustDialog_retryTalk()
    PaGlobal_TutorialManager:handleNpcShopWindowClose()
    if PaGlobal_Camp:getIsCamping() then
      InventoryWindow_Close()
      PaGlobal_Camp:open()
    end
  end
end

PaGlobalFunc_Dialog_NPCShop_GetNPCShop = function()
  -- function num : 0_28 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  return self
end

PaGlobalFunc_Dialog_NPCShop_InvenFilter_IsExchangeItem = function(slotNo, itemWrapper)
  -- function num : 0_29
  if itemWrapper == nil then
    return true
  end
  local isVested = (itemWrapper:get()):isVested()
  local isPersonalTrade = (itemWrapper:getStaticStatus()):isPersonalTrade()
  do
    if isVested then
      local isFilter = not isUsePcExchangeInLocalizingValue() or isPersonalTrade
    end
    if isFilter then
      return isFilter
    end
    local whereType = Inventory_GetCurrentInventoryType()
    if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
      return true
    end
    local isAble = npcShop_IsItemExchangeWithSystem((itemWrapper:get()):getKey())
    return not isAble
  end
end

PaGlobalFunc_Dialog_NPCShop_InvenRClick = function(slotNo)
  -- function num : 0_30
  local itemWrapper = getInventoryItem(slotNo)
  if itemWrapper ~= nil then
    itemCount = (itemWrapper:get()):getCount_s64()
    if (Defines.s64_const).s64_1 == itemCount then
      PaGlobalFunc_Dialog_NPCShop_InvenRClick_SellItem(1, slotNo)
    else
      Panel_NumberPad_Show(true, itemCount, slotNo, PaGlobalFunc_Dialog_NPCShop_InvenRClick_SellItem)
    end
  end
end

PaGlobalFunc_Dialog_NPCShop_InvenRClick_SellItem = function(itemCount, slotNo)
  -- function num : 0_31 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  local playerWrapper = getSelfPlayer()
  if playerWrapper == nil then
    return 
  end
  local e100Percent = 1000000
  local itemWrapper = getInventoryItem(slotNo)
  local itemSSW = itemWrapper:getStaticStatus()
  local itemEndurance = (itemWrapper:get()):getEndurance()
  local sellPrice_64 = itemWrapper:getSellPriceCalculate(e100Percent)
  local sellPrice_32 = Int64toInt32(sellPrice_64)
  local itemCount_32 = Int64toInt32(itemCount)
  local sellPrice = sellPrice_32 * itemCount_32
  local fromWhereType = (CppEnums.ItemWhereType).eInventory
  local toWhereType = (CppEnums.ItemWhereType).eInventory
  if npcShop_isGuildShopContents() then
    if not self:guildCheckByBuy() then
      return 
    end
    toWhereType = (CppEnums.ItemWhereType).eGuildWarehouse
  else
    if ((self._ui).radioButton_Storage):IsCheck() or sellPrice >= 500000 and ToClient_HasWareHouseFromNpc() then
      toWhereType = (CppEnums.ItemWhereType).eWarehouse
    else
      toWhereType = (CppEnums.ItemWhereType).eInventory
    end
  end
  local sellDoit = function()
    -- function num : 0_31_0 , upvalues : playerWrapper, slotNo, itemCount, fromWhereType, toWhereType, self, itemWrapper, sellPrice
    local isSocketed = false
    local sellConfirm = function()
      -- function num : 0_31_0_0 , upvalues : playerWrapper, slotNo, itemCount, fromWhereType, toWhereType, self
      (playerWrapper:get()):requestSellItem(slotNo, itemCount, fromWhereType, toWhereType, (self._value).isCamping)
    end

    local socketMaxCount = ToClient_GetMaxItemSocketCount()
    for jewelIndex = 0, socketMaxCount - 1 do
      local itemEnchantSSW = itemWrapper:getPushedItem(jewelIndex)
      if itemEnchantSSW ~= nil then
        isSocketed = true
      end
    end
    if isSocketed == true then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_1")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    else
      do
        ;
        (playerWrapper:get()):requestSellItem(slotNo, itemCount, fromWhereType, toWhereType, (self._value).isCamping)
        if sellPrice >= 500000 and toWhereType ~= (CppEnums.ItemWhereType).eGuildWarehouse and ToClient_HasWareHouseFromNpc() then
          Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_MONEYFORWAREHOUSE_ACK", "getMoney", makeDotMoney(sellPrice)), 6)
        end
      end
    end
  end

  local itemKeyForTradeInfo = (((itemWrapper:getStaticStatus()):get())._key):get()
  local tradeMasterInfo = getItemMarketMasterByItemEnchantKey(itemKeyForTradeInfo)
  if tradeMasterInfo ~= nil and itemEndurance ~= 0 then
    if sellPrice >= 500000 and toWhereType ~= (CppEnums.ItemWhereType).eGuildWarehouse and not ToClient_HasWareHouseFromNpc() then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_HIGHWEIGHT_WARNING_FOR_ITEMMARKET")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellDoit, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    else
      do
        local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_ITEMMARKET_USE_MSGMEMO")
        do
          local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellDoit, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageBoxData)
          if sellPrice >= 500000 and toWhereType ~= (CppEnums.ItemWhereType).eGuildWarehouse and not ToClient_HasWareHouseFromNpc() then
            local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_HIGHWEIGHT_WARNING")
            local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellDoit, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
            ;
            (MessageBox.showMessageBox)(messageBoxData)
          else
            do
              sellDoit()
            end
          end
        end
      end
    end
  end
end

PaGlobalFunc_Dialog_NPCShop_SellConfirm = function()
  -- function num : 0_32 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  self:sellConfirm()
end

PaGlobalFunc_Dialog_NPCShop_TabButtonClick = function(tabIndex)
  -- function num : 0_33 , upvalues : Panel_Dialog_NPCShop_Info, UI_color
  local self = Panel_Dialog_NPCShop_Info
  self:clearTabButton()
  if tabIndex ~= (self._value).lastTabIndex then
    PaGlobalFunc_Dialog_NPCShop_OnSlotClicked()
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._value).lastTabIndex = tabIndex
    ;
    (((self._ui).radioButton_Tab)[tabIndex]):SetFontColor(UI_color.C_FFFFFFFF)
    ;
    (((self._ui).radioButton_Tab)[tabIndex]):SetMonoTone(false)
    if tabIndex == 2 then
      ToClient_NpcShop_UpdateRepurchaseList()
    else
      ;
      ((self._ui).frame_VerticalScroll):SetEnable(true)
      ;
      ((self._ui).frame_VerticalScroll):SetMonoTone(false)
      ;
      ((self._ui).frame_VerticalScroll):SetShow(true)
    end
    ;
    ((self._ui).frame_VerticalScroll):SetControlPos(0)
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._value).lastStartSlotNo = 0
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._value).startSlotIndex = 0
    self:updateContent(true)
  end
  self:setKeyguide()
  self:checkInit()
  PaGlobal_TutorialManager:handleNpcShopTabButtonClick(tabIndex)
end

PaGlobalFunc_Dialog_NPCShop_OnSlotClicked = function(slotIdx)
  -- function num : 0_34 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  local slot = nil
  if (self._value).lastSelectedSlotIndex ~= slotIdx then
    Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).lastSelectedSlotIndex = (self._value).selectedSlotIndex
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).selectedSlotIndex = slotIdx
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R3 in 'UnsetPending'

  if (self._value).lastSelectedSlotIndex ~= nil then
    (self._value).enableTrade = false
    local slot = (self._slots)[(self._value).lastSelectedSlotIndex]
    slot:setSelect(false)
    ;
    ((self._ui).staticText_SomeOrAll_ConsoleUI):SetEnable(false)
    ;
    ((self._ui).staticText_SomeOrAll_ConsoleUI):SetMonoTone(true)
    ;
    ((self._ui).staticText_BuyOrSell_ConsoleUI):SetEnable(false)
    ;
    ((self._ui).staticText_BuyOrSell_ConsoleUI):SetMonoTone(true)
  end
  do
    do
      -- DECOMPILER ERROR at PC56: Confused about usage of register: R3 in 'UnsetPending'

      if slotIdx ~= nil then
        (self._value).enableTrade = true
        -- DECOMPILER ERROR at PC58: Confused about usage of register: R3 in 'UnsetPending'

        ;
        (self._value).selectedSlotIndex = slotIdx
        local slot = (self._slots)[(self._value).selectedSlotIndex]
        slot:setSelect(true)
        -- DECOMPILER ERROR at PC68: Confused about usage of register: R4 in 'UnsetPending'

        ;
        (self._value).selectedSlotKeyValue = slot.keyValue
        ;
        ((self._ui).staticText_BuyOrSell_ConsoleUI):SetEnable(true)
        ;
        ((self._ui).staticText_BuyOrSell_ConsoleUI):SetMonoTone(false)
        if slot.isStackable == false then
          ((self._ui).staticText_SomeOrAll_ConsoleUI):SetEnable(false)
          ;
          ((self._ui).staticText_SomeOrAll_ConsoleUI):SetMonoTone(true)
        else
          ;
          ((self._ui).staticText_SomeOrAll_ConsoleUI):SetEnable(true)
          ;
          ((self._ui).staticText_SomeOrAll_ConsoleUI):SetMonoTone(false)
        end
      end
      if (self._enum).etabIndexBuy ~= (self._value).lastTabIndex or (self._enum).etabIndexSell == (self._value).lastTabIndex then
      end
    end
  end
end

PaGlobalFunc_Dialog_NPCShop_OnRSlotClicked = function(slotIdx)
  -- function num : 0_35
  PaGlobalFunc_Dialog_NPCShop_OnSlotClicked(slotIdx)
  PaGlobalFunc_Dialog_NPCShop_BuyOrSellItem()
end

PaGlobalFunc_Dialog_NPCShop_BuySomeOrSellAllItem = function()
  -- function num : 0_36 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  if (self._value).selectedSlotIndex ~= nil then
    local slot = (self._slots)[(self._value).selectedSlotIndex]
    if (self._enum).etabIndexBuy == (self._value).lastTabIndex then
      PaGlobalFunc_Dialog_NPCShop_BuySome()
    else
      if (self._enum).etabIndexSell == (self._value).lastTabIndex then
        PaGlobalFunc_Dialog_NpcShop_SellItemAll()
      else
        if (self._enum).etabIndexRepurchase == (self._value).lastTabIndex then
          PaGlobalFunc_Dialog_NPCShop_BuySome()
        end
      end
    end
  end
end

PaGlobalFunc_Dialog_NPCShop_BuyOrSellItem = function()
  -- function num : 0_37 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  if (self._value).selectedSlotIndex ~= nil then
    local slot = (self._slots)[(self._value).selectedSlotIndex]
    do
      if (self._enum).etabIndexBuy == (self._value).lastTabIndex then
        local fromWhereType = 0
        do
          local shopItemWrapper = npcShop_getItemBuy(slot.slotNo)
          local shopItemPrice = (shopItemWrapper:get()):getItemPriceWithOption()
          local myInvenMoney = (((getSelfPlayer()):get()):getInventory()):getMoney_s64()
          local myWarehouseMoney = warehouse_moneyFromNpcShop_s64()
          local hasIntimacy = (shopItemWrapper:getStaticStatus()):hasMenatlCardKey()
          if hasIntimacy then
            return 
          end
          if ((self._ui).radioButton_Storage):IsCheck() then
            fromWhereType = 2
          end
          if npcShop_isGuildShopContents() then
            fromWhereType = (CppEnums.ItemWhereType).eGuildWarehouse
            if not self:guildCheckByBuy() then
              return 
            end
            local selfPlayer = getSelfPlayer()
            if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == false then
              local isPriceLimit = (selfPlayer:get()):getGuildIsPriceLimit()
              local myGuildPriceLimit = (selfPlayer:get()):getGuildPriceLimit()
              if isPriceLimit == true and myGuildPriceLimit < shopItemPrice then
                Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_NPCSHOP_GUILDPRICELIMITED_NOMONEY"))
                return 
              end
            end
          end
          do
            local rv = 0
            rv = npcShop_doBuy(slot.slotNo, 1, fromWhereType, 0, (self._value).isCamping)
            local shopItemKey = (((shopItemWrapper:getStaticStatus()):get())._key):getItemKey()
            if shopItemKey >= 30000 and shopItemKey < 40000 and rv == 0 then
              local self = slot
              if ((Panel_Dialog_NPCShop_Info._ui).radioButton_Inventory):IsCheck() and shopItemPrice < myInvenMoney then
                (self.radioButton):SetIgnore(true)
                ;
                (self.item_Slot):SetMonoTone(true)
                ;
                (self.staticText_Name):SetMonoTone(true)
                ;
                (self.staticText_Desc):SetMonoTone(true)
                ;
                (self.staticText_Price):SetMonoTone(true)
              else
                if ((Panel_Dialog_NPCShop_Info._ui).radioButton_Storage):IsCheck() and shopItemPrice < myWarehouseMoney then
                  do
                    (self.radioButton):SetIgnore(true)
                    ;
                    (self.item_Slot):SetMonoTone(true)
                    ;
                    (self.staticText_Name):SetMonoTone(true)
                    ;
                    (self.staticText_Desc):SetMonoTone(true)
                    ;
                    (self.staticText_Price):SetMonoTone(true)
                    -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC172: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
          if (self._enum).etabIndexSell == (self._value).lastTabIndex then
            local shopItemWrapper = npcShop_getItemSell(slot.slotNo)
            local shopItem = shopItemWrapper:get()
            local shopItemSSW = npcShop_getItemWrapperByShopSlotNo(slot.slotNo)
            local shopItemEndurance = (shopItemSSW:get()):getEndurance()
            local pricePiece = Int64toInt32(shopItemSSW:getSellPriceCalculate(shopItem:getItemPriceOption()))
            local toWhereType = 0
            if ((self._ui).radioButton_Storage):IsCheck() then
              toWhereType = 2
            end
            if npcShop_isGuildShopContents() then
              if not self:guildCheckByBuy() then
                return 
              end
              toWhereType = (CppEnums.ItemWhereType).eGuildWarehouse
            else
              if ((self._ui).radioButton_Storage):IsCheck() or pricePiece >= 500000 and ToClient_HasWareHouseFromNpc() then
                toWhereType = 2
              end
            end
            local sellDoit = function()
    -- function num : 0_37_0 , upvalues : slot, toWhereType, self, pricePiece
    local itemSSW = npcShop_getItemWrapperByShopSlotNo(slot.slotNo)
    local isSocketed = false
    local sellConfirm = function()
      -- function num : 0_37_0_0 , upvalues : slot, toWhereType, self
      npcShop_doSellByItemNo(slot.slotNo, 1, toWhereType, (self._value).isCamping)
    end

    local socketMaxCount = ToClient_GetMaxItemSocketCount()
    for jewelIndex = 0, socketMaxCount - 1 do
      local itemEnchantSSW = itemSSW:getPushedItem(jewelIndex)
      if itemEnchantSSW ~= nil then
        isSocketed = true
      end
    end
    if isSocketed == true then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_1")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    else
      do
        npcShop_doSellByItemNo(slot.slotNo, 1, toWhereType, (self._value).isCamping)
        if pricePiece >= 500000 and ToClient_HasWareHouseFromNpc() then
          Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_MONEYFORWAREHOUSE_ACK", "getMoney", makeDotMoney(pricePiece)), 6)
        end
      end
    end
  end

            local itemKeyForTradeInfo = (((shopItemWrapper:getStaticStatus()):get())._key):get()
            local tradeMasterInfo = getItemMarketMasterByItemEnchantKey(itemKeyForTradeInfo)
            if tradeMasterInfo ~= nil and shopItemEndurance ~= 0 then
              local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_ITEMMARKET_USE_MSGMEMO")
              local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellDoit, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
              ;
              (MessageBox.showMessageBox)(messageBoxData)
            else
              do
                do
                  sellDoit()
                  if (self._enum).etabIndexRepurchase == (self._value).lastTabIndex then
                    local fromWhereType = 0
                    if ((self._ui).radioButton_Storage):IsCheck() then
                      fromWhereType = 2
                    end
                    if npcShop_isGuildShopContents() then
                      fromWhereType = (CppEnums.ItemWhereType).eGuildWarehouse
                      if not self:guildCheckByBuy() then
                        return 
                      end
                    end
                    npcShop_doRepurchase(slot.slotNo, fromWhereType, self._isCamping)
                  end
                end
                do
                  DragManager:clearInfo()
                end
              end
            end
          end
        end
      end
    end
  end
end

PaGlobalFunc_Dialog_NPCShop_BuySome = function()
  -- function num : 0_38 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  local shopItemWrapper = npcShop_getItemBuy((self._value).startSlotIndex + (self._value).selectedSlotIndex)
  local shopItem = shopItemWrapper:get()
  local itemEnchantStaticStatus = (shopItemWrapper:getStaticStatus()):get()
  local money_s64 = (((getSelfPlayer()):get()):getInventory()):getMoney_s64()
  local s64_allWeight = Int64toInt32(((getSelfPlayer()):get()):getCurrentWeight_s64())
  local s64_maxWeight = Int64toInt32(((getSelfPlayer()):get()):getPossessableWeight_s64())
  local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
  if ((self._ui).radioButton_Storage):IsCheck() then
    money_s64 = warehouse_moneyFromNpcShop_s64()
  end
  if npcShop_isGuildShopContents() then
    if not self:guildCheckByBuy() then
      return 
    end
    money_s64 = myGuildListInfo:getGuildBusinessFunds_s64()
  end
  local s64_maxMoneyNumber = money_s64 / shopItem:getItemPriceWithOption()
  local s64_maxWeightNumber = (Defines.s64_const).s64_0
  local itemWeight = nil
  if ((self._ui).radioButton_Inventory):IsCheck() then
    itemWeight = itemEnchantStaticStatus._weight - Int64toInt32(shopItem:getItemPriceWithOption()) * 2
  else
    itemWeight = itemEnchantStaticStatus._weight
  end
  if s64_allWeight < s64_maxWeight then
    s64_maxWeightNumber = toInt64(0, (math.floor)((s64_maxWeight - s64_allWeight) / itemWeight))
  end
  if s64_maxMoneyNumber < s64_maxWeightNumber or s64_maxWeightNumber < (Defines.s64_const).s64_0 then
    s64_maxWeightNumber = s64_maxMoneyNumber
  end
  if shopItem:getNeedIntimacy() > 0 then
    local talker = dialog_getTalker()
    local intimacyValue = talker:getIntimacy()
    local reduceIntimacyValue = (math.abs)(shopItem:getItemIntimacy())
    local maxNumber = toInt64(0, (math.floor)(intimacyValue / reduceIntimacyValue))
    if maxNumber < s64_maxMoneyNumber then
      s64_maxMoneyNumber = maxNumber
    end
    if maxNumber < s64_maxWeightNumber then
      s64_maxWeightNumber = maxNumber
    end
  end
  do
    Panel_NumberPad_Show(true, s64_maxMoneyNumber, param, PaGlobalFunc_Dialog_NpcShop_BuySome_ConfirmFunction, nil, nil, nil, nil, s64_maxWeightNumber)
    Panel_NumberPad_SetType("NpcShop_BuySome")
  end
end

PaGlobalFunc_Dialog_NpcShop_BuySome_ConfirmFunction = function(inputNumber, param)
  -- function num : 0_39 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).inputNumber = inputNumber
  local slot = (self._slots)[(self._value).selectedSlotIndex]
  local buyCount = (self._value).inputNumber
  local fromWhereType = (CppEnums.ItemWhereType).eInventory
  if ((self._ui).radioButton_Storage):IsCheck() then
    fromWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  local shopItemWrapper = npcShop_getItemBuy(slot.slotNo)
  local shopItem = shopItemWrapper:get()
  local selectItem = (shopItemWrapper:getStaticStatus()):getName()
  local totalPrice = shopItem:getItemPriceWithOption() * inputNumber
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_BUY_ALERT_TITLE")
  local contentString = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_NPCSHOP_BUY_ALERT_1", "item", tostring(selectItem), "number", tostring((self._value).inputNumber), "price", makeDotMoney(totalPrice))
  local messageboxData = {title = titleString, content = contentString, functionYes = PaGlobalFunc_Dialog_NpcShop_BuySome_Do, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  if npcShop_isGuildShopContents() then
    fromWhereType = (CppEnums.ItemWhereType).eGuildWarehouse
    if not self:guildCheckByBuy() then
      return 
    end
    local selfPlayer = getSelfPlayer()
    if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == false then
      local isPriceLimit = (selfPlayer:get()):getGuildIsPriceLimit()
      local myGuildPriceLimit = (selfPlayer:get()):getGuildPriceLimit()
      if isPriceLimit == true and myGuildPriceLimit < totalPrice then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_NPCSHOP_GUILDPRICELIMITED_NOMONEY"))
        return 
      end
    end
  end
  do
    if toInt64(0, 499) < (self._value).inputNumber or toInt64(0, 99999) < totalPrice then
      (MessageBox.showMessageBox)(messageboxData)
    else
      npcShop_doBuy(slot.slotNo, buyCount, fromWhereType, 0, (self._value).isCamping)
    end
  end
end

PaGlobalFunc_Dialog_NpcShop_BuySome_Do = function()
  -- function num : 0_40 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  local buyCount = (self._value).inputNumber
  local slot = (self._slots)[(self._value).selectedSlotIndex]
  local fromWhereType = (CppEnums.ItemWhereType).eInventory
  if ((self._ui).radioButton_Storage):IsCheck() then
    fromWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  if npcShop_isGuildShopContents() then
    fromWhereType = (CppEnums.ItemWhereType).eGuildWarehouse
    if not self:guildCheckByBuy() then
      return 
    end
  end
  npcShop_doBuy(slot.slotNo, buyCount, fromWhereType, 0, (self._value).isCamping)
end

PaGlobalFunc_Dialog_NpcShop_SellItemAll = function()
  -- function num : 0_41 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  if (self._value).selectedSlotIndex ~= nil then
    local slot = (self._slots)[(self._value).selectedSlotIndex]
    do
      local shopItemWrapper = npcShop_getItemSell(slot.slotNo)
      local shopItem = shopItemWrapper:get()
      local inventory = ((getSelfPlayer()):get()):getInventory()
      local s64_inventoryItemCount = inventory:getItemCount_s64(((shopItemWrapper:getStaticStatus()):get())._key)
      local shopItemSSW = npcShop_getItemWrapperByShopSlotNo(slot.slotNo)
      local itemCount = Int64toInt32(s64_inventoryItemCount)
      local pricePiece = Int64toInt32(shopItemSSW:getSellPriceCalculate(shopItem:getItemPriceOption()))
      local toWhereType = 0
      local sellPrice = pricePiece * itemCount
      local sellAllDoit = function()
    -- function num : 0_41_0 , upvalues : toWhereType, self, sellPrice, slot
    if npcShop_isGuildShopContents() then
      toWhereType = (CppEnums.ItemWhereType).eGuildWarehouse
    else
      if ((self._ui).radioButton_Storage):IsCheck() or sellPrice >= 500000 and ToClient_HasWareHouseFromNpc() then
        toWhereType = 2
      end
    end
    local itemSSW = npcShop_getItemWrapperByShopSlotNo(slot.slotNo)
    local shopItemEndurance = (itemSSW:get()):getEndurance()
    local isSocketed = false
    local sellConfirm = function()
      -- function num : 0_41_0_0 , upvalues : slot, toWhereType, self
      npcShop_doSellAll(slot.keyValue, toWhereType, (self._value).isCamping)
    end

    local socketMaxCount = ToClient_GetMaxItemSocketCount()
    for jewelIndex = 0, socketMaxCount - 1 do
      local itemEnchantSSW = itemSSW:getPushedItem(jewelIndex)
      if itemEnchantSSW ~= nil then
        isSocketed = true
      end
    end
    if isSocketed == true then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_1")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellConfirm, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    else
      do
        npcShop_doSellAll(slot.keyValue, toWhereType, (self._value).isCamping)
        if sellPrice >= 500000 and ToClient_HasWareHouseFromNpc() then
          Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_MONEYFORWAREHOUSE_ACK", "getMoney", makeDotMoney(sellPrice)), 6)
        end
      end
    end
  end

      local itemKeyForTradeInfo = (((shopItemWrapper:getStaticStatus()):get())._key):get()
      local tradeMasterInfo = getItemMarketMasterByItemEnchantKey(itemKeyForTradeInfo)
      if tradeMasterInfo ~= nil and shopItemEndurance ~= 0 then
        if sellPrice >= 500000 and toWhereType ~= (CppEnums.ItemWhereType).eGuildWarehouse and not ToClient_HasWareHouseFromNpc() then
          local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_HIGHWEIGHT_WARNING_FOR_ITEMMARKET")
          local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellAllDoit, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageBoxData)
        else
          do
            local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_ITEMMARKET_USE_MSGMEMO")
            do
              do
                local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellAllDoit, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                ;
                (MessageBox.showMessageBox)(messageBoxData)
                if sellPrice >= 500000 and toWhereType ~= (CppEnums.ItemWhereType).eGuildWarehouse and not ToClient_HasWareHouseFromNpc() then
                  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_HIGHWEIGHT_WARNING")
                  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_SELL_ALERT_2"), content = messageBoxMemo, functionYes = sellAllDoit, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                  ;
                  (MessageBox.showMessageBox)(messageBoxData)
                else
                  do
                    sellAllDoit()
                  end
                end
                DragManager:clearInfo()
              end
            end
          end
        end
      end
    end
  end
end

PaGlobalFunc_Dialog_NPCShop_ScrollEvent = function(isUpScroll)
  -- function num : 0_42 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).startSlotIndex = (UIScroll.ScrollEvent)((self._ui).frame_VerticalScroll, isUpScroll, (self._config).slotRows, (self._value).itemListSize, (self._value).startSlotIndex, (self._config).slotCols)
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

  if (self._value).startSlotIndex < (self._config).slotCols then
    (self._value).startSlotIndex = (self._value).startSlotIndex * (self._config).slotCols
  end
  Panel_Tooltip_Item_hideTooltip()
  self:updateContent(false)
end

PaGlobalFunc_Dialog_NPCShop_ShowAni = function()
  -- function num : 0_43
  audioPostEvent_SystemUi(1, 1)
  Panel_Dialog_NPCShop:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Dialog_NPCShop, 0, 0.3)
end

PaGlobalFunc_Dialog_NPCShop_HideAni = function()
  -- function num : 0_44
  local ani1 = (UIAni.AlphaAnimation)(0, Panel_Dialog_NPCShop, 0, 0.2)
  ani1:SetHideAtEnd(true)
end

PaGlobalFunc_Dialog_NPCShop_IsExchangeItem = function(slotNo, itemWrapper)
  -- function num : 0_45
  if itemWrapper == nil then
    return true
  end
  local isVested = (itemWrapper:get()):isVested()
  local isPersonalTrade = (itemWrapper:getStaticStatus()):isPersonalTrade()
  do
    if isVested then
      local isFilter = not isUsePcExchangeInLocalizingValue() or isPersonalTrade
    end
    if isFilter then
      return isFilter
    end
    local whereType = Inventory_GetCurrentInventoryType()
    if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
      return true
    end
    local isAble = npcShop_IsItemExchangeWithSystem((itemWrapper:get()):getKey())
    return not isAble
  end
end

FromClient_Init_Dialog_NPCShop = function()
  -- function num : 0_46 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  self:initialize()
  self:resize()
end

FromClient_onScreenResize_Dialog_NPCShop = function()
  -- function num : 0_47 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  self:resize()
end

FromClient_Dialog_NPCShop_UpdateContent = function()
  -- function num : 0_48 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  local talker = dialog_getTalker()
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).isCamping = PaGlobal_Camp:getIsCamping()
  if talker == nil and ((self._value).isCamping == false or (self._value).isCamping == nil) then
    return 
  end
  if (self._value).isCamping == false or (self._value).isCamping == nil then
    local actorProxyWrapper = getNpcActor(talker:getActorKey())
    if actorProxyWrapper ~= nil then
      local actorProxy = actorProxyWrapper:get()
      local characterStaticStatus = actorProxy:getCharacterStaticStatus()
      if characterStaticStatus:isTradeMerchant() == true then
        return 
      end
    end
  end
  do
    if global_IsTrading == true then
      return 
    end
    self:preShow()
    ;
    ((self._ui).frame_VerticalScroll):SetControlPos(0)
    self:updateContent(true)
    Inventory_SetFunctor(PaGlobalFunc_Dialog_NPCShop_IsExchangeItem, PaGlobalFunc_Dialog_NPCShop_InvenRClick, PaGlobalFunc_Dialog_NPCShop_Close, nil)
    FromClient_Dialog_NPCShop_UpdateMoney()
    FromClient_Dialog_NPCShop_UpdateMoneyWarehouse()
    FromClient_Dialog_NPCShop_UpdateGuildPriceLimit()
  end
end

FromClient_Dialog_NPCShop_UpdateMoney = function()
  -- function num : 0_49 , upvalues : Panel_Dialog_NPCShop_Info
  if _ContentsGroup_InvenUpdateCheck == true and PaGlobalFunc_Dialog_NPCShop_GetShow() == false then
    return 
  end
  local self = Panel_Dialog_NPCShop_Info
  ;
  ((self._ui).radioButton_Buy):SetEnable(true)
  ;
  ((self._ui).radioButton_Buy):SetMonoTone(false)
  if not npcShop_isGuildShopContents() then
    ((self._ui).staticText_Inventory):SetShow(true)
    ;
    ((self._ui).staticText_Inventory):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
    ;
    ((self._ui).radioButton_Inventory):SetShow(true)
    ;
    ((self._ui).radioButton_Inventory):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_ICON_MONEY"))
    ;
    ((self._ui).radioButton_Inventory):SetIgnore(false)
    if not ToClient_HasWareHouseFromNpc() then
      ((self._ui).radioButton_Storage):SetShow(false)
      ;
      ((self._ui).staticText_Storage):SetShow(false)
    else
      ;
      ((self._ui).radioButton_Storage):SetShow(true)
      ;
      ((self._ui).staticText_Storage):SetShow(true)
    end
  end
end

FromClient_Dialog_NPCShop_UpdateMoneyWarehouse = function()
  -- function num : 0_50 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  if not npcShop_isGuildShopContents() then
    ((self._ui).staticText_Storage):SetShow(true)
    ;
    ((self._ui).staticText_Storage):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
    ;
    ((self._ui).radioButton_Storage):SetShow(true)
    ;
    ((self._ui).radioButton_Storage):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_ITEMMARKET_ICON_MONEY2"))
    ;
    ((self._ui).radioButton_Storage):SetIgnore(false)
    if not ToClient_HasWareHouseFromNpc() then
      ((self._ui).radioButton_Storage):SetShow(false)
      ;
      ((self._ui).staticText_Storage):SetShow(false)
    else
      ;
      ((self._ui).radioButton_Storage):SetShow(true)
      ;
      ((self._ui).staticText_Storage):SetShow(true)
      ;
      ((self._ui).radioButton_Storage):SetIgnore(false)
    end
  end
end

FromClient_Dialog_NPCShop_UpdateGuildPriceLimit = function()
  -- function num : 0_51 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if ToClient_GetMyGuildInfoWrapper() == nil then
    return 
  end
  if selfPlayer ~= nil and npcShop_isGuildShopContents() then
    ((self._ui).staticText_Inventory):SetShow(true)
    ;
    ((self._ui).radioButton_Inventory):SetShow(true)
    ;
    ((self._ui).radioButton_Inventory):SetIgnore(true)
    ;
    ((self._ui).radioButton_Storage):SetShow(true)
    ;
    ((self._ui).staticText_Storage):SetShow(true)
    ;
    ((self._ui).radioButton_Storage):SetIgnore(true)
    ;
    ((self._ui).radioButton_Inventory):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_NPCSHOP_GUILDPRICELIMITED"))
    if (selfPlayer:get()):isGuildMaster() == false and (selfPlayer:get()):getGuildIsPriceLimit() == true then
      ((self._ui).staticText_Inventory):SetText(makeDotMoney(makeDotMoney((selfPlayer:get()):getGuildPriceLimit())))
    else
      ;
      ((self._ui).staticText_Inventory):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WINDOW_USEGUILDFUNDS_UNLIMITED"))
    end
    local myGuildListInfo = ToClient_GetMyGuildInfoWrapper()
    ;
    ((self._ui).radioButton_Storage):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NPCSHOP_GUILDMONEY"))
    ;
    ((self._ui).staticText_Storage):SetText(makeDotMoney(myGuildListInfo:getGuildBusinessFunds_s64()))
    ;
    ((self._ui).radioButton_Inventory):SetCheck(false)
    ;
    ((self._ui).radioButton_Storage):SetCheck(false)
  end
end

Toggle_NPCShopTab_forPadEventFunc = function(value)
  -- function num : 0_52 , upvalues : Panel_Dialog_NPCShop_Info
  local self = Panel_Dialog_NPCShop_Info
  self._currentTabIndex = self._currentTabIndex + value
  if self._currentTabIndex < 0 then
    self._currentTabIndex = 2
  else
    if self._currentTabIndex > 2 then
      self._currentTabIndex = 0
    end
  end
  PaGlobalFunc_Dialog_NPCShop_TabButtonClick(self._currentTabIndex)
end

Panel_Dialog_NPCShop:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LT, "Toggle_NPCShopTab_forPadEventFunc(-1)")
Panel_Dialog_NPCShop:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RT, "Toggle_NPCShopTab_forPadEventFunc(1)")
registerEvent("FromClient_luaLoadComplete", "FromClient_Init_Dialog_NPCShop")

