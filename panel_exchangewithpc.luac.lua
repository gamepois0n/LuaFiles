-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\exchange\panel_exchangewithpc.luac 

-- params : ...
-- function num : 0
Panel_Window_Exchange:SetShow(false, false)
Panel_Window_Exchange:setMaskingChild(true)
Panel_Window_Exchange:setGlassBackground(true)
Panel_Window_Exchange:RegisterShowEventFunc(true, "ExchangeShowAni()")
Panel_Window_Exchange:RegisterShowEventFunc(false, "ExchangeHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local exchangePC = {_btnClose, _btnLock, _btnExchange, _textOtherName, _textOtherSlotCount, _textOtherMoney, _textOtherWeight, _textOtherInfo, _textureOtherLock, _textureOtherUnLock, _textMyName, _textMySlotCount, _textMyMoney, _textMyWeight, _textMyInfo, _textureMyLock, _textureMyUnLock, _btnMyMoney; MAX_SLOT_COUNT = 12, 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, 
mySlotConfig = {slotCount = MAX_SLOT_COUNT, slotCols = 6, slotRows = 2, slotStartX = 11, slotStartY = 275, slotGapX = 48, slotGapY = 48, slotEnchantX = 13, slotEnchantY = 13}
, 
otherSlotConfig = {slotCount = MAX_SLOT_COUNT, slotCols = 6, slotRows = 2, slotStartX = 11, slotStartY = 80, slotGapX = 48, slotGapY = 48, slotEnchantX = 13, slotEnchantY = 13}
, _otherSlots = (Array.new)(), _otherSlotsBG = (Array.new)(), _mySlots = (Array.new)(), _mySlotsBG = (Array.new)()}
ExchangeShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Down)(Panel_Window_Exchange)
  Inventory_updateSlotData()
end

ExchangeHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_Exchange:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_Exchange:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  local aniInfo2 = Panel_Window_Exchange:addScaleAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(0.97)
  aniInfo2.AxisX = 416
  aniInfo2.AxisY = 294
  aniInfo2.IsChangeChild = true
  Inventory_Filter_Init()
end

exchangePC.Init = function(self)
  -- function num : 0_2 , upvalues : exchangePC
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._btnClose = (UI.getChildControl)(Panel_Window_Exchange, "Button_Close")
  ;
  (exchangePC._btnClose):addInputEvent("Mouse_LUp", "Panel_ExchangePC_BtnClose_Mouse_Click()")
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._buttonQuestion = (UI.getChildControl)(Panel_Window_Exchange, "Button_Question")
  ;
  (exchangePC._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelExchangeWithPC\" )")
  ;
  (exchangePC._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelExchangeWithPC\", \"true\")")
  ;
  (exchangePC._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelExchangeWithPC\", \"false\")")
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._btnLock = (UI.getChildControl)(Panel_Window_Exchange, "Button_Lock")
  ;
  (exchangePC._btnLock):addInputEvent("Mouse_LUp", "Panel_ExchangePC_BtnLock_Mouse_Click()")
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._btnExchange = (UI.getChildControl)(Panel_Window_Exchange, "Button_Exchange")
  ;
  (exchangePC._btnExchange):addInputEvent("Mouse_LUp", "Panel_ExchangePC_BtnExchange_Mouse_Click()")
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._EnchantText = (UI.getChildControl)(Panel_Window_Exchange, "Static_Text_Slot_Enchant_value")
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._UselessSlot = (UI.getChildControl)(Panel_Window_Exchange, "Static_UselessSlot")
  -- DECOMPILER ERROR at PC84: Confused about usage of register: R1 in 'UnsetPending'

  exchangePc._LockedSlot = (UI.getChildControl)(Panel_Window_Exchange, "Static_LockedSlot")
  -- DECOMPILER ERROR at PC91: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textOtherName = (UI.getChildControl)(Panel_Window_Exchange, "Static_Name_Trader")
  -- DECOMPILER ERROR at PC98: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textOtherSlotCount = (UI.getChildControl)(Panel_Window_Exchange, "Static_Slot_No_Trader")
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textOtherMoney = (UI.getChildControl)(Panel_Window_Exchange, "Static_Money_Trader")
  -- DECOMPILER ERROR at PC112: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textOtherWeight = (UI.getChildControl)(Panel_Window_Exchange, "Static_Weight_Trader")
  -- DECOMPILER ERROR at PC119: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textOtherInfo = (UI.getChildControl)(Panel_Window_Exchange, "Static_Info_Trader")
  -- DECOMPILER ERROR at PC126: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textureOtherLock = (UI.getChildControl)(Panel_Window_Exchange, "Static_Lock_Trader")
  -- DECOMPILER ERROR at PC133: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textureOtherUnLock = (UI.getChildControl)(Panel_Window_Exchange, "Static_Unlock_Trader")
  for ii = 1, exchangePC.MAX_SLOT_COUNT do
    local slotNo = ii - 1
    local slotBG = {}
    local slot = {}
    slotBG.BG = (UI.createAndCopyBasePropertyControl)(Panel_Window_Exchange, "Static_Icon_Another_0", Panel_Window_Exchange, "Exchange_Another_BG_" .. slotNo)
    ;
    (SlotItem.new)(slot, "Icon_Other_" .. slotNo, slotNo, Panel_Window_Exchange, exchangePC.slotConfig)
    slot:createChild()
    CopyBaseProperty(exchangePC._EnchantText, slot.enchantText)
    ;
    (slot.enchantText):SetSize((slot.icon):GetSizeX(), (slot.icon):GetSizeY())
    ;
    (slot.enchantText):SetPosX(0)
    ;
    (slot.enchantText):SetPosY(0)
    ;
    (slot.enchantText):SetTextHorizonCenter()
    ;
    (slot.enchantText):SetTextVerticalCenter()
    local row = (math.floor)(slotNo / (exchangePC.otherSlotConfig).slotCols)
    local col = slotNo % (exchangePC.otherSlotConfig).slotCols
    ;
    (slot.icon):SetPosX((exchangePC.otherSlotConfig).slotStartX + (exchangePC.otherSlotConfig).slotGapX * col)
    ;
    (slot.icon):SetPosY((exchangePC.otherSlotConfig).slotStartY + (exchangePC.otherSlotConfig).slotGapY * row)
    ;
    (slot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"exchangeOther\", true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"exchangeOther\", false)")
    ;
    (slot.icon):SetIgnore(false)
    ;
    (slot.icon):SetSize(35, 35)
    ;
    (slot.border):SetSize(41, 41)
    ;
    (slotBG.BG):SetPosX((exchangePC.otherSlotConfig).slotStartX + (exchangePC.otherSlotConfig).slotGapX * col)
    ;
    (slotBG.BG):SetPosY((exchangePC.otherSlotConfig).slotStartY + (exchangePC.otherSlotConfig).slotGapY * row)
    Panel_Tooltip_Item_SetPosition(slotNo, slot, "exchangeOther")
    -- DECOMPILER ERROR at PC285: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (exchangePC._otherSlots)[ii] = slot
    -- DECOMPILER ERROR at PC288: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (exchangePC._otherSlotsBG)[slotNo] = slotBG
  end
  -- DECOMPILER ERROR at PC296: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textMyName = (UI.getChildControl)(Panel_Window_Exchange, "Static_Name_User")
  -- DECOMPILER ERROR at PC303: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textMySlotCount = (UI.getChildControl)(Panel_Window_Exchange, "Static_Slot_No_User")
  -- DECOMPILER ERROR at PC310: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textMyMoney = (UI.getChildControl)(Panel_Window_Exchange, "Static_Money_User")
  -- DECOMPILER ERROR at PC317: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textMyWeight = (UI.getChildControl)(Panel_Window_Exchange, "Static_Weight_User")
  -- DECOMPILER ERROR at PC324: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textMyInfo = (UI.getChildControl)(Panel_Window_Exchange, "Static_Info_User")
  -- DECOMPILER ERROR at PC331: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textureMyLock = (UI.getChildControl)(Panel_Window_Exchange, "Static_Lock_User")
  -- DECOMPILER ERROR at PC338: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._textureMyUnLock = (UI.getChildControl)(Panel_Window_Exchange, "Static_Unlock_User")
  -- DECOMPILER ERROR at PC345: Confused about usage of register: R1 in 'UnsetPending'

  exchangePC._btnMyMoney = (UI.getChildControl)(Panel_Window_Exchange, "Button_Money")
  ;
  (exchangePC._btnMyMoney):SetIgnore(true)
  for ii = 1, exchangePC.MAX_SLOT_COUNT do
    local slotNo = ii - 1
    local slotBG = {}
    local slot = {}
    slotBG.BG = (UI.createAndCopyBasePropertyControl)(Panel_Window_Exchange, "Static_Icon_Player_0", Panel_Window_Exchange, "Exchange_Player_BG_" .. slotNo)
    ;
    (SlotItem.new)(slot, "Icon_My_" .. slotNo, slotNo, Panel_Window_Exchange, exchangePC.slotConfig)
    slot:createChild()
    CopyBaseProperty(exchangePC._EnchantText, slot.enchantText)
    ;
    (slot.enchantText):SetSize((slot.icon):GetSizeX(), (slot.icon):GetSizeY())
    ;
    (slot.enchantText):SetPosX(0)
    ;
    (slot.enchantText):SetPosY(0)
    ;
    (slot.enchantText):SetTextHorizonCenter()
    ;
    (slot.enchantText):SetTextVerticalCenter()
    local row = (math.floor)(slotNo / (exchangePC.mySlotConfig).slotCols)
    local col = slotNo % (exchangePC.mySlotConfig).slotCols
    ;
    (slot.icon):SetPosX((exchangePC.mySlotConfig).slotStartX + (exchangePC.mySlotConfig).slotGapX * col)
    ;
    (slot.icon):SetPosY((exchangePC.mySlotConfig).slotStartY + (exchangePC.mySlotConfig).slotGapY * row)
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "Panel_ExchangePC_MySlotRClick(" .. slotNo .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"exchangeSelf\", true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"exchangeSelf\", false)")
    ;
    (slot.icon):SetIgnore(false)
    ;
    (slot.icon):SetSize(35, 35)
    ;
    (slot.border):SetSize(41, 41)
    ;
    (slotBG.BG):SetPosX((exchangePC.mySlotConfig).slotStartX + (exchangePC.mySlotConfig).slotGapX * col)
    ;
    (slotBG.BG):SetPosY((exchangePC.mySlotConfig).slotStartY + (exchangePC.mySlotConfig).slotGapY * row)
    Panel_Tooltip_Item_SetPosition(slotNo, slot, "exchangeSelf")
    -- DECOMPILER ERROR at PC510: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (exchangePC._mySlots)[ii] = slot
    -- DECOMPILER ERROR at PC513: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (exchangePC._mySlotsBG)[slotNo] = slotBG
  end
  ;
  (exchangePC._EnchantText):SetShow(false)
end

Panel_ExchangePC_Update_Slot = function()
  -- function num : 0_3 , upvalues : exchangePC
  local otherSlotCount = 0
  local _otherSlot = {}
  for ii = 1, exchangePC.MAX_SLOT_COUNT do
    local slot = (exchangePC._otherSlots)[ii]
    local itemWrapper = tradePC_GetOtherItem(ii - 1)
    local slotNo = ii - 1
    if itemWrapper ~= nil then
      slot:setItem(itemWrapper)
      otherSlotCount = otherSlotCount + 1
      _otherSlot[ii] = 1
    else
      slot:clearItem()
      _otherSlot[ii] = 0
    end
  end
  local otherName = tradePC_GetOtherName()
  ;
  (exchangePC._textOtherName):SetText(tradePC_GetOtherName())
  ;
  (exchangePC._textOtherSlotCount):SetText(otherSlotCount .. "/" .. exchangePC.MAX_SLOT_COUNT)
  local otherMoney = tostring(tradePC_GetOtherMoney_s64())
  ;
  (exchangePC._textOtherMoney):SetText(otherMoney)
  local otherWeight = tradePC_GetOtherWeight_s64()
  otherWeight = Int64toInt32(otherWeight) / 10000
  ;
  (exchangePC._textOtherWeight):SetText((string.format)("%.1f", otherWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  local otherInfo = tradePC_GetOtherInfo()
  if otherInfo == 1 then
    (exchangePC._textOtherInfo):SetText(PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_TRADE"))
  else
    if otherInfo == 2 then
      (exchangePC._textOtherInfo):SetText(PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_LOCK"))
    else
      if otherInfo == 3 then
        (exchangePC._textOtherInfo):SetText(PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_FINAL_CHECK"))
      else
        ;
        (exchangePC._textOtherInfo):SetText(PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_ERROR"))
      end
    end
  end
  local isOtherLock = tradePC_GetOtherLock()
  ;
  (exchangePC._textureOtherLock):SetShow(isOtherLock)
  ;
  (exchangePC._textureOtherUnLock):SetShow(not isOtherLock)
  for ii = 1, exchangePC.MAX_SLOT_COUNT do
    -- DECOMPILER ERROR at PC150: Unhandled construct in 'MakeBoolean' P1

    if isOtherLock == true and _otherSlot[ii] == 0 then
      (((exchangePC._otherSlotsBG)[ii - 1]).BG):ChangeTextureInfoName("new_ui_common_forlua/default/useless_slot.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(((exchangePC._otherSlotsBG)[ii - 1]).BG, 5, 5, 36, 36)
      ;
      ((((exchangePC._otherSlotsBG)[ii - 1]).BG):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (((exchangePC._otherSlotsBG)[ii - 1]).BG):setRenderTexture((((exchangePC._otherSlotsBG)[ii - 1]).BG):getBaseTexture())
    end
    do
      ;
      (((exchangePC._otherSlotsBG)[ii - 1]).BG):ChangeTextureInfoName("new_ui_common_forlua/default/UI_Item_LootingWin_Slot.dds")
      do
        local x1, y1, x2, y2 = setTextureUV_Func(((exchangePC._otherSlotsBG)[ii - 1]).BG, 0, 0, 47, 47)
        ;
        ((((exchangePC._otherSlotsBG)[ii - 1]).BG):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((exchangePC._otherSlotsBG)[ii - 1]).BG):setRenderTexture((((exchangePC._otherSlotsBG)[ii - 1]).BG):getBaseTexture())
        -- DECOMPILER ERROR at PC236: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  local mySlotCount = 0
  local _mySlot = {}
  for ii = 1, exchangePC.MAX_SLOT_COUNT do
    local slot = (exchangePC._mySlots)[ii]
    local itemWrapper = tradePC_GetMyItem(ii - 1)
    local slotNo = ii - 1
    if itemWrapper ~= nil then
      slot:setItem(itemWrapper)
      mySlotCount = mySlotCount + 1
      _mySlot[ii] = 1
    else
      slot:clearItem()
      _mySlot[ii] = 0
    end
  end
  local myName = tostring(tradePC_GetMyName())
  ;
  (exchangePC._textMyName):SetText(tradePC_GetMyName())
  ;
  (exchangePC._textMySlotCount):SetText(mySlotCount .. "/" .. exchangePC.MAX_SLOT_COUNT)
  local s64_myMoney = tradePC_GetMyMoney_s64()
  ;
  (exchangePC._textMyMoney):SetText(tostring(s64_myMoney))
  local txt_SizeX = -(exchangePC._textMyMoney):GetTextSizeX()
  ;
  (exchangePC._btnMyMoney):SetEnableArea(txt_SizeX - 5, 0, (exchangePC._btnMyMoney):GetSizeX(), (exchangePC._btnMyMoney):GetSizeY())
  local s64_myWeight = tradePC_GetMyWeight_s64()
  s64_myWeight = Int64toInt32(s64_myWeight) / 10000
  ;
  (exchangePC._textMyWeight):SetText((string.format)("%.1f", s64_myWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  local myInfo = tradePC_GetMyInfo()
  if myInfo == 1 then
    (exchangePC._textMyInfo):SetText(PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_TRADE"))
  else
    if myInfo == 2 then
      (exchangePC._textMyInfo):SetText(PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_LOCK"))
    else
      if myInfo == 3 then
        (exchangePC._textMyInfo):SetText(PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_FINAL_CHECK"))
      else
        ;
        (exchangePC._textMyInfo):SetText(PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_ERROR"))
      end
    end
  end
  local isMyLock = tradePC_GetMyLock()
  ;
  (exchangePC._textureMyLock):SetShow(isMyLock)
  ;
  (exchangePC._textureMyUnLock):SetShow(not isMyLock)
  for ii = 1, exchangePC.MAX_SLOT_COUNT do
    -- DECOMPILER ERROR at PC408: Unhandled construct in 'MakeBoolean' P1

    if isMyLock == true and _mySlot[ii] == 0 then
      (((exchangePC._mySlotsBG)[ii - 1]).BG):ChangeTextureInfoName("new_ui_common_forlua/default/useless_slot.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(((exchangePC._mySlotsBG)[ii - 1]).BG, 5, 5, 36, 36)
      ;
      ((((exchangePC._mySlotsBG)[ii - 1]).BG):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (((exchangePC._mySlotsBG)[ii - 1]).BG):setRenderTexture((((exchangePC._mySlotsBG)[ii - 1]).BG):getBaseTexture())
    end
    do
      ;
      (((exchangePC._mySlotsBG)[ii - 1]).BG):ChangeTextureInfoName("new_ui_common_forlua/default/UI_Item_LootingWin_Slot.dds")
      do
        local x1, y1, x2, y2 = setTextureUV_Func(((exchangePC._mySlotsBG)[ii - 1]).BG, 0, 0, 47, 47)
        ;
        ((((exchangePC._mySlotsBG)[ii - 1]).BG):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (((exchangePC._mySlotsBG)[ii - 1]).BG):setRenderTexture((((exchangePC._mySlotsBG)[ii - 1]).BG):getBaseTexture())
        -- DECOMPILER ERROR at PC494: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  ExChangePC_UpdateFilter()
end

ExChangePC_UpdateFilter = function()
  -- function num : 0_4 , upvalues : exchangePC
  for ii = 1, exchangePC.MAX_SLOT_COUNT do
    Inventory_EraseEffect_While_Exchange(ii - 1)
  end
  for ii = 1, exchangePC.MAX_SLOT_COUNT do
    local slot = (exchangePC._mySlots)[ii]
    local itemWrapper = tradePC_GetMyItem(ii - 1)
    if itemWrapper ~= nil then
      local slotNo = tradePC_GetMyItemInvenSlotNo(ii - 1)
      Inventory_AddEffect_While_Exchange(slotNo)
    end
  end
end

ExchangePC_MessageBox_RequestConfirm = function()
  -- function num : 0_5
  tradePC_Request(true)
end

ExchangePC_MessageBox_RequestCancel = function()
  -- function num : 0_6
  tradePC_Request(false)
end

ExchangePC_MessageBox_ResponseConfirm = function()
  -- function num : 0_7
  tradePC_Response()
  InventoryWindow_Close()
  Inventory_SetFunctor(ExchangePC_InventoryFilter, ExchangePC_InventoryRClick, nil, nil)
  InventoryWindow_Show()
  if Panel_Equipment:GetShow() then
    FGlobal_Equipment_SetHide(false)
  end
  if Panel_Window_Exchange:IsShow() == false then
    Panel_Window_Exchange:SetShow(true, true)
  end
  Panel_ExchangePC_Update_Slot()
end

ExchangePC_InventoryFilter = function(slotNo, itemWrapper, inventoryType)
  -- function num : 0_8
  if itemWrapper == nil then
    return true
  end
  local itemEnchantSSW = itemWrapper:getStaticStatus()
  local itemEnchantKey = (itemEnchantSSW:get())._key
  local itemPersonalTradeItem = itemEnchantSSW:isPersonalTrade()
  local isAble = isPersonalTradeByItemEnchantKey(itemEnchantKey)
  local isVested = (itemWrapper:get()):isVested()
  if isAble and itemPersonalTradeItem and isUsePcExchangeInLocalizingValue() then
    local isCheck = not isVested
  end
  return not isCheck
end

ExchangePC_InventoryRClick = function(slotNo, itemWrapper, itemCount, inventoryType)
  -- function num : 0_9
  if (Defines.s64_const).s64_1 == itemCount then
    Panel_ExchangePC_InteractionFromNumberWindow(1, slotNo, inventoryType)
  else
    Panel_NumberPad_Show(true, itemCount, slotNo, Panel_ExchangePC_InteractionFromNumberWindow, nil, inventoryType)
  end
end

ExchangePC_MessageBox_ResponseCancel = function()
  -- function num : 0_10
  tradePC_Cancel()
  InventoryWindow_Close()
  Inventory_SetFunctor(nil, nil, nil, nil)
  if Panel_Window_Exchange:IsShow() then
    Panel_Window_Exchange:SetShow(false, true)
  end
end

ExchangePc_MessageBox_CloseConfirm = function()
  -- function num : 0_11
  tradePC_Cancel()
  InventoryWindow_Close()
  Inventory_SetFunctor(nil, nil, nil, nil)
  Interaction_Reset()
  if Panel_Window_Exchange:IsShow() then
    Panel_Window_Exchange:SetShow(false, true)
  end
end

ExChangePC_ChangeMoney = function(inputNumber, param)
  -- function num : 0_12
  tradePC_ChangeMoney(inputNumber)
end

EventTradePC_MessageBoxToRequest = function(actorName)
  -- function num : 0_13
  local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "EXCHANGE_TEXT_TRADE_REQUEST", "actorName", tostring(actorName))
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_TRADE_REQUEST_TITLE"), content = contentString, functionYes = ExchangePC_MessageBox_RequestConfirm, functionCancel = ExchangePC_MessageBox_RequestCancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  local isExist = (MessageBox.doHaveMessageBoxData)(messageboxData.title)
  if isExist == false then
    (MessageBox.showMessageBox)(messageboxData)
  end
end

EventTradePC_ReceiveToMyRequest = function()
  -- function num : 0_14
  InventoryWindow_Close()
  Inventory_SetFunctor(ExchangePC_InventoryFilter, ExchangePC_InventoryRClick, nil, nil)
  InventoryWindow_Show()
  if Panel_Equipment:GetShow() then
    FGlobal_Equipment_SetHide(false)
  end
  if Panel_Window_Exchange:IsShow() == false then
    Panel_Window_Exchange:SetShow(true, true)
  end
  Panel_ExchangePC_Update_Slot()
end

EventTradePC_ReceiveOtherPlayerRequest = function(actorName)
  -- function num : 0_15
  local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "EXCHANGE_TEXT_TRADE_ACCEPT", "actorName", tostring(actorName))
  local messageboxData = {title = PAGetString(Defines.StringSheet_RESOURCE, "EXCHANGE_TEXT_TITLE"), content = contentString, functionYes = ExchangePC_MessageBox_ResponseConfirm, functionCancel = ExchangePC_MessageBox_ResponseCancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

EventTradePC_ReceiveCancel = function(reason)
  -- function num : 0_16
  InventoryWindow_Close()
  Inventory_SetFunctor(nil, nil, nil, nil)
  if Panel_Window_Exchange:IsShow() then
    Panel_Window_Exchange:SetShow(false, true)
  end
  local contentString = reason
  local messageboxData = {title = PAGetString(Defines.StringSheet_RESOURCE, "EXCHANGE_TEXT_TITLE"), content = contentString, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Panel_ExchangePC_Complete = function()
  -- function num : 0_17
  InventoryWindow_Close()
  Inventory_SetFunctor(nil, nil, nil, nil)
  if Panel_Window_Exchange:IsShow() then
    Panel_Window_Exchange:SetShow(false, true)
  end
  local contentString = PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_COMPLETE")
  local messageboxData = {title = PAGetString(Defines.StringSheet_RESOURCE, "EXCHANGE_TEXT_TITLE"), content = contentString, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

EventTradePC_IsAbleTradingWithPlayer = function()
  -- function num : 0_18
  return true
end

Panel_ExchangePC_BtnClose_Mouse_Click = function()
  -- function num : 0_19
  local contentString = PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_CANCEL")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_TITLE"), content = contentString, functionYes = ExchangePc_MessageBox_CloseConfirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Panel_ExchangePC_BtnLock_Mouse_Click = function()
  -- function num : 0_20
  tradePC_Lock()
end

Panel_ExchangePC_BtnExchange_Mouse_Click = function()
  -- function num : 0_21
  tradePC_Confirm()
end

Panel_ExchangePC_BtnMyMoney_Mouse_Click = function()
  -- function num : 0_22
  return 
end

local _slot = {}
local _slotIndex = 0
Panel_ExchangePC_MySlotRClick = function(slotIndex)
  -- function num : 0_23 , upvalues : _slot, _slotIndex
  tradePC_PopItem(slotIndex)
  Inventory_EraseEffect_While_Exchange(slotIndex)
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  _slot[slotIndex] = nil
  if slotIndex == _slotIndex and _slotIndex > 0 then
    _slotIndex = _slotIndex - 1
  end
end

Panel_ExchangePC_InteractionFromNumberWindow = function(inputNumber, invenSlotNo, whereType)
  -- function num : 0_24 , upvalues : _slotIndex, _slot
  Inventory_AddEffect_While_Exchange(invenSlotNo)
  tradePC_RegisterItem(whereType, invenSlotNo, inputNumber)
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  if _slotIndex == 0 then
    _slot[0] = invenSlotNo
    _slotIndex = _slotIndex + 1
  else
    for i = 0, _slotIndex do
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R7 in 'UnsetPending'

      if _slot[i] == nil then
        _slot[i] = invenSlotNo
        aaa = true
        break
      end
    end
    do
      _slotIndex = _slotIndex + 1
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R3 in 'UnsetPending'

      _slot[_slotIndex] = invenSlotNo
      Panel_ExchangePC_Update_Slot()
    end
  end
end

registerEvent("EventTradePCMessageBoxToRequest", "EventTradePC_MessageBoxToRequest")
registerEvent("EventTradePCReceiveToMyRequest", "EventTradePC_ReceiveToMyRequest")
registerEvent("EventTradePCReceiveOtherPlayerRequest", "EventTradePC_ReceiveOtherPlayerRequest")
registerEvent("EventTradePCReceiveCancel", "EventTradePC_ReceiveCancel")
registerEvent("EventTradePCUpdateSlots", "Panel_ExchangePC_Update_Slot")
registerEvent("EventTradePCComplete", "Panel_ExchangePC_Complete")
registerEvent("Event_IsAbleTradingWithPlayer", "EventTradePC_IsAbleTradingWithPlayer")
exchangePC:Init()

