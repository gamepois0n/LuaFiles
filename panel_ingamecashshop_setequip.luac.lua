-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\ingamecashshop\panel_ingamecashshop_setequip.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_classType = CppEnums.ClassType
local UI_PreviewType = CppEnums.InGameCashShopPreviewType
local CT = CppEnums.ClassType
Panel_IngameCashShop_SetEquip:SetShow(false)
local awakenWeaponContentsOpen = ToClient_IsContentsGroupOpen("901")
local isCouponOpen = ToClient_IsContentsGroupOpen("224")
local CashShopSetEquip = {BTN_BuyAll = (UI.getChildControl)(Panel_IngameCashShop_SetEquip, "Button_BuyAll"), BTN_Exit = (UI.getChildControl)(Panel_IngameCashShop_SetEquip, "Button_Exit"), BTN_QNA = (UI.getChildControl)(Panel_IngameCashShop_SetEquip, "Button_QNA"), 
SlotUIPool = {}
, beforProductNoRaw = -1, nowProductNoRaw = -1, beforSetClass = -1, nowSetClass = -1, 
serventType = {horse = 0, ship = 1, carriage = 2}
, hasServantType = -1, 
SetEquipSlotNo = {14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 13}
, 
SetCharacterEquipName = {[14] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BODY"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HANDS"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BOOTS"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HELM"), [18] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_MAINHANDS"), [19] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SUBHANDS"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_UNDERWEAR"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EARING"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EYE"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_MOUTH"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LAMPLIGHT")}
, 
SetHorseEquipName = {[14] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BARD"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SADDLE"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_STIRRUP"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HORSEHEAD"), [18] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EMPTYSLOT"), [19] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EMPTYSLOT"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EMPTYSLOT"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EMPTYSLOT"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EMPTYSLOT"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EMPTYSLOT")}
, 
SetCarriageEquipName = {[14] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "14", [15] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "15", [16] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "16", [17] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "17", [18] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "18", [19] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "19", [20] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "20", [21] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "21", [22] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "22", [23] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CARRIAGEAVATAR") .. "23"}
}
local TemplateSetEquip = {ItemBG = (UI.getChildControl)(Panel_IngameCashShop_SetEquip, "Static_ItemBG"), ItemName = (UI.getChildControl)(Panel_IngameCashShop_SetEquip, "StaticText_ItemName"), BTN_UnSet = (UI.getChildControl)(Panel_IngameCashShop_SetEquip, "Button_UnSet")}
local savedProductNo = -1
CashShopSetEquip.Initialize = function(self)
  -- function num : 0_0 , upvalues : UI_PUCT, TemplateSetEquip
  local startPosY = 40
  local slotYGap = 32
  local sizeY = 0
  for index,value in pairs(self.SetEquipSlotNo) do
    local tempSlot = {}
    local CreateItemBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_IngameCashShop_SetEquip, "CashShop_SetEquip_ItemBG_" .. value)
    CopyBaseProperty(TemplateSetEquip.ItemBG, CreateItemBG)
    CreateItemBG:SetPosX(10)
    CreateItemBG:SetPosY(startPosY)
    CreateItemBG:SetShow(false)
    tempSlot.ItemBG = CreateItemBG
    local CreateItemName = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, CreateItemBG, "CashShop_SetEquip_ItemName_" .. value)
    CopyBaseProperty(TemplateSetEquip.ItemName, CreateItemName)
    CreateItemName:SetPosX(0)
    CreateItemName:SetPosY(0)
    CreateItemName:SetText((self.SetCharacterEquipName)[value])
    CreateItemName:SetShow(false)
    tempSlot.ItemName = CreateItemName
    local CreateBTN_UnSet = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, CreateItemBG, "CashShop_SetEquip_UnSetBTN_" .. value)
    CopyBaseProperty(TemplateSetEquip.BTN_UnSet, CreateBTN_UnSet)
    CreateBTN_UnSet:SetPosX(CreateItemBG:GetSizeX() - CreateBTN_UnSet:GetSizeX())
    CreateBTN_UnSet:SetPosY(5)
    CreateBTN_UnSet:SetShow(false)
    CreateBTN_UnSet:addInputEvent("Mouse_LUp", "HandleClicked_CashShopSetEquip_UnSetEquip(" .. value .. ")")
    tempSlot.BTN_UnSet = CreateBTN_UnSet
    startPosY = startPosY + slotYGap
    sizeY = sizeY + CreateItemBG:GetSizeY() + 2
    -- DECOMPILER ERROR at PC101: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (self.SlotUIPool)[value] = tempSlot
  end
  Panel_IngameCashShop_SetEquip:SetSize(Panel_IngameCashShop_SetEquip:GetSizeX(), sizeY + 85)
  ;
  (self.BTN_BuyAll):SetPosY(Panel_IngameCashShop_SetEquip:GetSizeY() - (self.BTN_BuyAll):GetSizeY() - 7)
  ;
  (self.BTN_BuyAll):addInputEvent("Mouse_LUp", "HandleClicked_CashShopMoveCart()")
  cashShop_SetEquip_SetPosition()
  ;
  (getIngameCashMall()):clearCart()
  if isGameTypeKR2() then
    (self.BTN_QNA):SetShow(false)
  end
end

CashShopSetEquip.Update = function(self)
  -- function num : 0_1 , upvalues : UI_PreviewType, UI_color, CashShopSetEquip
  local nowClass = self.nowSetClass
  for index,value in pairs(self.SetEquipSlotNo) do
    local UiBase = (self.SlotUIPool)[value]
    local previewAvatar = (getIngameCashMall()):getCashShopPreviewType()
    if UI_PreviewType.SelfPlayer == previewAvatar or UI_PreviewType.NormalPlayerCharacter == previewAvatar or UI_PreviewType.Others == previewAvatar then
      (UiBase.ItemName):SetText((self.SetCharacterEquipName)[value])
    else
      if UI_PreviewType.SelflVehicleCharacter == previewAvatar or UI_PreviewType.NormalVehicleCharacter == previewAvatar then
        if (CppEnums.ServantKind).Type_Horse == self.hasServantType then
          (UiBase.ItemName):SetText((self.SetHorseEquipName)[value])
        else
          if (CppEnums.ServantKind).Type_Ship == self.hasServantType then
            (UiBase.ItemName):SetText((self.SetCarriageEquipName)[value])
          else
            if (CppEnums.ServantKind).Type_FourWheeledCarriage == self.hasServantType then
              (UiBase.ItemName):SetText((self.SetCarriageEquipName)[value])
            end
          end
        end
      end
    end
    ;
    (UiBase.ItemName):SetFontColor(UI_color.C_FFFFFFFF)
  end
  local cartListCount = (getIngameCashMall()):getViewListCount()
  for equipItem_Idx = 0, cartListCount - 1 do
    local iGCSelectedItem = (getIngameCashMall()):getViewItemByIndex(equipItem_Idx)
    local CPSSW = iGCSelectedItem:getCashProductStaticStatus()
    local productNoRaw = CPSSW:getNoRaw()
    local itemCount = CPSSW:getInnerItemListCount()
    for itemIdx = 0, itemCount - 1 do
      local itemSSW = CPSSW:getInnerItemByIndex(itemIdx)
      if itemSSW:isEquipable() then
        local equipSlotNo = itemSSW:getEquipSlotNo()
        local UiBase = (self.SlotUIPool)[equipSlotNo]
        local itemName = itemSSW:getName()
        local itemGrade = itemSSW:getGradeType()
        CashShopSetEquip:SetEquipSlot(equipSlotNo, itemName, itemGrade)
        ;
        (UiBase.ItemName):addInputEvent("Mouse_On", "cashShop_SetEquip_ShowTooltip( true, " .. equipSlotNo .. " )")
        ;
        (UiBase.ItemName):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
      end
    end
  end
end

CashShopSetEquip.SetEquipSlot = function(self, equipSlotNo, itemName, itemGrade)
  -- function num : 0_2 , upvalues : UI_color
  local colorCode = nil
  if itemGrade == 0 then
    colorCode = UI_color.C_FFFFFFFF
  else
    if itemGrade == 1 then
      colorCode = 4284350320
    else
      if itemGrade == 2 then
        colorCode = 4283144191
      else
        if itemGrade == 3 then
          colorCode = 4294953010
        else
          if itemGrade == 4 then
            colorCode = 4294929408
          else
            colorCode = UI_color.C_FFFFFFFF
          end
        end
      end
    end
  end
  ;
  (((self.SlotUIPool)[equipSlotNo]).ItemName):SetText(itemName)
  ;
  (((self.SlotUIPool)[equipSlotNo]).ItemName):SetFontColor(colorCode)
end

cashShop_SetEquip_ShowTooltip = function(isshow, equipSlotNo)
  -- function num : 0_3 , upvalues : CashShopSetEquip
  local self = CashShopSetEquip
  local cartListCount = (getIngameCashMall()):getViewListCount()
  local UiBase = ((self.SlotUIPool)[equipSlotNo]).ItemName
  for equipItem_Idx = 0, cartListCount - 1 do
    local iGCSelectedItem = (getIngameCashMall()):getViewItemByIndex(equipItem_Idx)
    local CPSSW = iGCSelectedItem:getCashProductStaticStatus()
    local productNoRaw = CPSSW:getNoRaw()
    local itemCount = CPSSW:getInnerItemListCount()
    for itemIdx = 0, itemCount - 1 do
      local itemSSW = CPSSW:getInnerItemByIndex(itemIdx)
      if itemSSW:isEquipable() then
        local tempEquipSlotNo = itemSSW:getEquipSlotNo()
        if equipSlotNo == tempEquipSlotNo then
          Panel_Tooltip_Item_Show(itemSSW, UiBase, true, false)
        end
      end
    end
  end
end

CashShopSetEquip.Return_ServantType = function(self, itemSSW, servantType)
  -- function num : 0_4
  local returnValue = nil
  if (CppEnums.ServantKind).Type_Ship == servantType then
    if not (itemSSW:get()):isServantTypeUsable((CppEnums.ServantKind).Type_Ship) then
      returnValue = (itemSSW:get()):isServantTypeUsable((CppEnums.ServantKind).Type_Raft)
      if (CppEnums.ServantKind).Type_FourWheeledCarriage == servantType then
        if not (itemSSW:get()):isServantTypeUsable((CppEnums.ServantKind).Type_TwoWheelCarriage) then
          returnValue = (itemSSW:get()):isServantTypeUsable((CppEnums.ServantKind).Type_FourWheeledCarriage)
          returnValue = (itemSSW:get()):isServantTypeUsable(servantType)
          return returnValue
        end
      end
    end
  end
end

cashShop_SetEquip_SetPosition = function()
  -- function num : 0_5
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_IngameCashShop_SetEquip:GetSizeX()
  local panelSizeY = Panel_IngameCashShop_SetEquip:GetSizeY()
  Panel_IngameCashShop_SetEquip:SetPosX(scrSizeX - panelSizeX - 20)
  Panel_IngameCashShop_SetEquip:SetPosY(scrSizeY - panelSizeY - 60)
end

HandleClicked_CashShopSetEquip_UnSetEquip = function(equipSlotNo)
  -- function num : 0_6 , upvalues : CashShopSetEquip
  local self = CashShopSetEquip
  local productNoRaw = (getIngameCashMall()):getEquipCartItemByIndex(equipSlotNo)
  ;
  (getIngameCashMall()):popProductInEquipCart(productNoRaw)
  self:Update()
end

HandleClicked_CashShopMoveCart = function()
  -- function num : 0_7
  (getIngameCashMall()):insertToCartFromViewList()
  if FGlobal_IsShow_IngameCashShop_NewCart() then
    FGlobal_Update_IngameCashShop_NewCart()
  else
    FGlobal_Open_IngameCashShop_NewCart()
  end
end

FGlobal_CashShop_SetEquip_Update = function(productNoRaw)
  -- function num : 0_8 , upvalues : CashShopSetEquip, savedProductNo, UI_color
  local self = CashShopSetEquip
  local myClass = (getSelfPlayer()):getClassType()
  savedProductNo = productNoRaw
  local CPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(productNoRaw)
  if CPSSW == nil then
    return 
  end
  local itemCount = CPSSW:getInnerItemListCount()
  local checkClass = -1
  local itemType = nil
  local listClass = {}
  for classIdx = 0, getCharacterClassCount() - 1 do
    local classType = getCharacterClassTypeByIndex(classIdx)
    listClass[classType] = true
  end
  local hasEquipment = false
  local hasUsableServant = false
  local hasUsableHorse = false
  local hasUsableCarriage = false
  local hasUsableBoat = false
  local hasFishingBoat = false
  local hasLantern = false
  local hasCamel = false
  for itemIdx = 0, itemCount - 1 do
    local itemSSW = CPSSW:getInnerItemByIndex(itemIdx)
    itemType = itemSSW:getItemType()
    if (CppEnums.EquipSlotNo).lantern == itemSSW:getEquipSlotNo() then
      hasLantern = true
    else
      if itemSSW:isUsableServant() then
        hasUsableServant = true
        if self:Return_ServantType(itemSSW, (CppEnums.ServantKind).Type_Horse) then
          hasUsableHorse = true
          self.hasServantType = (CppEnums.ServantKind).Type_Horse
        else
          if self:Return_ServantType(itemSSW, (CppEnums.ServantKind).Type_Ship) then
            hasUsableBoat = true
            self.hasServantType = (CppEnums.ServantKind).Type_Ship
          else
            if self:Return_ServantType(itemSSW, (CppEnums.ServantKind).Type_FishingBoat) then
              hasFishingBoat = true
              self.hasServantType = (CppEnums.ServantKind).Type_FishingBoat
            else
              if self:Return_ServantType(itemSSW, (CppEnums.ServantKind).Type_FourWheeledCarriage) then
                hasUsableCarriage = true
                self.hasServantType = (CppEnums.ServantKind).Type_FourWheeledCarriage
              else
                if self:Return_ServantType(itemSSW, (CppEnums.ServantKind).Type_Camel) then
                  hasCamel = true
                  self.hasServantType = (CppEnums.ServantKind).Type_Camel
                end
              end
            end
          end
        end
      else
        if itemSSW:isEquipable() then
          hasEquipment = true
          for classType,_ in pairs(listClass) do
            if ((itemSSW:get())._usableClassType):isOn(classType) == false then
              listClass[classType] = nil
            end
          end
        end
      end
    end
  end
  if listClass[myClass] == true then
    checkClass = myClass
  else
    for key,_ in pairs(listClass) do
      checkClass = key
      do break end
    end
  end
  do
    for index,value in pairs(self.SetEquipSlotNo) do
      (((self.SlotUIPool)[value]).ItemName):SetText((self.SetCharacterEquipName)[value])
      ;
      (((self.SlotUIPool)[value]).ItemName):SetFontColor(UI_color.C_FFFFFFFF)
    end
    if CPSSW:isShowWindowItemKey() then
      self.nowSetClass = -1
      CashShopController_ForceOffAllButton()
      ;
      (getIngameCashMall()):changeViewCharacter(productNoRaw)
      return 
    end
    if (hasEquipment ~= true or hasLantern ~= false) and hasUsableServant == true then
      self.beforSetClass = self.nowSetClass
      self.nowSetClass = checkClass
      local cartProductKeyList = (Array.new)()
      local cartListCount = (getIngameCashMall()):getViewListCount()
      for equipItem_Idx = 0, cartListCount - 1 do
        local iGCSelectedItem = (getIngameCashMall()):getViewItemByIndex(equipItem_Idx)
        local CPSSW = iGCSelectedItem:getCashProductStaticStatus()
        cartProductKeyList:push_back(CPSSW:getNoRaw())
      end
      for key,noRaw in pairs(cartProductKeyList) do
        local CPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(noRaw)
        local itemCount = CPSSW:getInnerItemListCount()
        for itemIdx = 0, itemCount - 1 do
          local itemSSW = CPSSW:getInnerItemByIndex(itemIdx)
          if self:Return_ServantType(itemSSW, self.hasServantType) == false then
            (getIngameCashMall()):popProductInEquipCart(noRaw)
            break
          end
        end
      end
      self.nowSetClass = -1
      local characterKeyRaw = (getIngameCashMall()):getDelegateServantKey(self.hasServantType)
      CashShopController_ForceOffAllButton()
      ;
      (getIngameCashMall()):changeViewVehicleCharacter(characterKeyRaw)
      ;
      (getIngameCashMall()):pushProductInEquipCart(productNoRaw)
    else
      do
        if hasEquipment == true and hasLantern == false then
          self.beforSetClass = self.nowSetClass
          self.nowSetClass = checkClass
          if self.beforSetClass == self.nowSetClass then
            local cartProductKeyList = (Array.new)()
            local cartListCount = (getIngameCashMall()):getViewListCount()
            for equipItem_Idx = 0, cartListCount - 1 do
              local iGCSelectedItem = (getIngameCashMall()):getViewItemByIndex(equipItem_Idx)
              local CPSSW = iGCSelectedItem:getCashProductStaticStatus()
              cartProductKeyList:push_back(CPSSW:getNoRaw())
            end
            for key,noRaw in pairs(cartProductKeyList) do
              local CPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(noRaw)
              local itemCount = CPSSW:getInnerItemListCount()
              for itemIdx = 0, itemCount - 1 do
                local itemSSW = CPSSW:getInnerItemByIndex(itemIdx)
                if itemSSW:isEquipable() and ((itemSSW:get())._usableClassType):isOn(self.nowSetClass) == false then
                  (getIngameCashMall()):popProductInEquipCart(noRaw)
                  break
                end
              end
            end
            if myClass == self.nowSetClass then
              (getIngameCashMall()):changeViewMyCharacter()
            else
              local characterSSW = getCharacterStaticStatusWrapperByClassType(self.nowSetClass)
              local characterKeyRaw = characterSSW:getCharacterKey()
              ;
              (getIngameCashMall()):changeViewPlayerCharacter(characterKeyRaw)
            end
            do
              CashShop_SetEquip_AutoUnderWearShow(productNoRaw)
              CashShop_SetEquip_AutoUpHair(productNoRaw)
              ;
              (getIngameCashMall()):pushProductInEquipCart(productNoRaw)
              self.nowSetClass = -1
              CashShopController_ForceOffAllButton()
              ;
              (getIngameCashMall()):changeViewCharacter(productNoRaw)
            end
          end
        end
      end
    end
  end
end

CashSHop_IsUnderWearItem = function(productNoRaw)
  -- function num : 0_9
  local CPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(productNoRaw)
  local count = CPSSW:getInnerItemListCount()
  for key = 0, count - 1 do
    local itemSSW = CPSSW:getInnerItemByIndex(0)
    local itemType = itemSSW:getEquipSlotNo()
    if (CppEnums.EquipSlotNo).avatarUnderWear == itemType then
      return true
    end
  end
  return false
end

CashShop_SetEquip_AutoUnderWearShow = function(productNoRaw)
  -- function num : 0_10
  if CashSHop_IsUnderWearItem(productNoRaw) then
    HandleClicked_CashShopController_AutoToggleUnderWear()
  else
    HandleClicked_CashShopController_AutoToggleOffAll()
  end
end

CashShop_SetEquip_AutoUpHair = function(productNoRaw)
  -- function num : 0_11
  local CPSSW = ToClient_GetCashProductStaticStatusWrapperByKeyRaw(productNoRaw)
  local count = CPSSW:getInnerItemListCount()
  local isUpHairMode = false
  for key = 0, count - 1 do
    local itemSSW = CPSSW:getInnerItemByIndex(key)
    local itemType = itemSSW:getEquipSlotNo()
    if (CppEnums.EquipSlotNo).faceDecoration1 == itemType or (CppEnums.EquipSlotNo).faceDecoration2 == itemType or (CppEnums.EquipSlotNo).faceDecoration3 == itemType then
      isUpHairMode = true
      break
    end
  end
  do
    CashShopController_HideHairBtnCheck(isUpHairMode)
  end
end

FGlobal_CashShop_SetEquip_Open = function()
  -- function num : 0_12 , upvalues : CashShopSetEquip
  local self = CashShopSetEquip
  cashShop_SetEquip_SetPosition()
  self:Update()
  Panel_IngameCashShop_SetEquip:SetShow(true)
  self.nowSetClass = -1
end

FGlobal_CashShop_SetEquip_Close = function()
  -- function num : 0_13
  cashShop_SetEquip_Close()
end

cashShop_SetEquip_Close = function()
  -- function num : 0_14
  Panel_IngameCashShop_SetEquip:SetShow(false)
end

HandleClicked_CashShop_Close = function()
  -- function num : 0_15
  if Panel_Win_System:GetShow() then
    Proc_ShowMessage_Ack("알림창을 먼저 닫아주세�\148.")
    return 
  end
  InGameShopBuy_Close()
  Panel_IngameCashShop_HowUsePearlShop_Close()
  FGlobal_CashShop_GoodsTooltipInfo_Close()
  InGameShopDetailInfo_Close()
  PaymentPassword_Close()
  chargeDaumCash_Close()
  termsofDaumCash_Close()
  Panel_IngameCashShop_MakePaymentsFromCart:SetShow(false)
  Panel_IngameCashShop_BuyPearlBox:SetShow(false)
  IngameCashShopCoupon_Close()
  InGameShop_Close()
end

HandleClicked_QNAWebLink_Open = function()
  -- function num : 0_16
  FGlobal_QnAWebLink_Open()
end

FromClient_CashShopSetEquip_Resize = function()
  -- function num : 0_17
  cashShop_SetEquip_SetPosition()
end

CashShopSetEquip.registEventHandler = function(self)
  -- function num : 0_18
  (self.BTN_Exit):addInputEvent("Mouse_LUp", "HandleClicked_CashShop_Close()")
  ;
  (self.BTN_QNA):addInputEvent("Mouse_LUp", "HandleClicked_QNAWebLink_Open()")
  registerEvent("onScreenResize", "FromClient_CashShopSetEquip_Resize")
end

CashShopSetEquip:Initialize()
CashShopSetEquip:registEventHandler()
Panel_IngameCashShop_Controller:SetShow(false)
Panel_CustomizationMessage:SetShow(false, false)
Panel_CustomizationMessage:SetIgnore(true)
local CashShopController = {GameTime_Slider = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Slider_GameTime"), BTN_Light = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_Light"), BTN_EyeSee = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_EyeSee"), BTN_ShowUI = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_ShowUI"), SunIcon = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_Sun"), btn_SpecialMove = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_SpecialMove"), MoonIcon = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_Moon"), SunShine1 = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_SunShine1"), SunShine2 = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_SunShine2"), SunShine3 = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_SunShine3"), SunShine4 = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_SunShine4"), SunShine5 = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_SunShine5"), SunShine6 = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_SunShine6"), btn_SpecialMove1 = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_SpecialMove1"), btn_SpecialMove2 = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_SpecialMove2"), ChaCTR_Area = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_CharacterController"), RotateArrow_L = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_Left_RotateArrow"), RotateArrow_R = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_Right_RotateArrow"), static_SetOptionBG = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_SetOptionBG"), static_SetOptionEnduranceBG = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_SetOptionEnduranceBG"), txt_Endurance = (UI.getChildControl)(Panel_IngameCashShop_Controller, "StaticText_Endurance"), Slider_Endurance = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Slider_Endurance"), btn_ShowUnderwear = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_ShowUnderWear"), btn_HideAvatar = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_HideAvatar"), btn_HideHair = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_HideHair"), btn_HideHelm = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_HideHelm"), btn_AwakenWeapon = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_AwakenWeapon"), btn_WarStance = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_WarStance"), btn_OpenHelm = (UI.getChildControl)(Panel_IngameCashShop_Controller, "CheckButton_OpenHelm"), cameraControlBG = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_CameraControlBG"), cameraControlTitle = (UI.getChildControl)(Panel_IngameCashShop_Controller, "StaticText_CameraControlTitle"), cameraControlMoveBG = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_CameraControlMoveBG"), cameraControlWheelBG = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_CameraControlWheelBG"), cameraControlRotateBG = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_CameraControlRotateBG"), cameraControlMove = (UI.getChildControl)(Panel_IngameCashShop_Controller, "StaticText_CameraControlMove"), cameraControlWheel = (UI.getChildControl)(Panel_IngameCashShop_Controller, "StaticText_CameraControlWheel"), cameraControlRotate = (UI.getChildControl)(Panel_IngameCashShop_Controller, "StaticText_CameraControlRotate"), petLookBG = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Static_SetPetLookBG"), btn_Coupon = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_Coupon"), btn_AllDoff = (UI.getChildControl)(Panel_IngameCashShop_Controller, "Button_AllDoff"), isLdown = false, isRdown = false, lMovePos = 0, yMovePos = 0, isShowUI = true, xStartPos = 0, yStartPos = 0, savedTabType = 0}
CashShopController.btn_petLookBefore = (UI.getChildControl)(CashShopController.petLookBG, "Button_Before")
CashShopController.btn_petLookNext = (UI.getChildControl)(CashShopController.petLookBG, "Button_Next")
CashShopController.txt_petLookNameMain = (UI.getChildControl)(CashShopController.petLookBG, "StaticText_PetLookNameMain")
CashShopController.txt_petLookNameSub = (UI.getChildControl)(CashShopController.petLookBG, "StaticText_PetLookNameSub")
;
(CashShopController.petLookBG):SetAlpha(0.6)
;
(CashShopController.btn_AwakenWeapon):SetShow(awakenWeaponContentsOpen)
CashShopController.GameTime_SliderCtrlBTN = (UI.getChildControl)(CashShopController.GameTime_Slider, "Slider_GameTime_Button")
CashShopController.Slider_EnduranceCtrlBTN = (CashShopController.Slider_Endurance):GetControlButton()
local StaticText_CustomizationMessage = (UI.getChildControl)(Panel_CustomizationMessage, "StaticText_CustomizationMessage")
CashShopController.Initialize = function(self)
  -- function num : 0_19 , upvalues : UI_color
  (self.GameTime_Slider):SetInterval(23)
  ;
  (self.Slider_Endurance):SetInterval(100)
  ;
  (self.static_SetOptionBG):AddChild(self.static_SetOptionEnduranceBG)
  ;
  (self.static_SetOptionBG):AddChild(self.txt_Endurance)
  ;
  (self.static_SetOptionBG):AddChild(self.btn_ShowUnderwear)
  ;
  (self.static_SetOptionBG):AddChild(self.btn_HideAvatar)
  ;
  (self.static_SetOptionBG):AddChild(self.Slider_Endurance)
  ;
  (self.static_SetOptionBG):AddChild(self.btn_HideHair)
  ;
  (self.static_SetOptionBG):AddChild(self.btn_HideHelm)
  ;
  (self.static_SetOptionBG):AddChild(self.btn_OpenHelm)
  ;
  (self.static_SetOptionBG):AddChild(self.btn_AwakenWeapon)
  ;
  (self.static_SetOptionBG):AddChild(self.btn_WarStance)
  ;
  (self.static_SetOptionBG):AddChild(self.btn_AllDoff)
  Panel_IngameCashShop_Controller:RemoveControl(self.static_SetOptionEnduranceBG)
  Panel_IngameCashShop_Controller:RemoveControl(self.txt_Endurance)
  Panel_IngameCashShop_Controller:RemoveControl(self.btn_ShowUnderwear)
  Panel_IngameCashShop_Controller:RemoveControl(self.btn_HideAvatar)
  Panel_IngameCashShop_Controller:RemoveControl(self.Slider_Endurance)
  Panel_IngameCashShop_Controller:RemoveControl(self.btn_HideHair)
  Panel_IngameCashShop_Controller:RemoveControl(self.btn_HideHelm)
  Panel_IngameCashShop_Controller:RemoveControl(self.btn_OpenHelm)
  Panel_IngameCashShop_Controller:RemoveControl(self.btn_AwakenWeapon)
  Panel_IngameCashShop_Controller:RemoveControl(self.btn_WarStance)
  Panel_IngameCashShop_Controller:RemoveControl(self.btn_AllDoff)
  ;
  (self.static_SetOptionEnduranceBG):SetPosX(5)
  ;
  (self.static_SetOptionEnduranceBG):SetPosY(10)
  ;
  (self.txt_Endurance):SetPosX(5)
  ;
  (self.txt_Endurance):SetPosY(10)
  ;
  (self.Slider_Endurance):SetPosX((self.txt_Endurance):GetPosX() + (self.txt_Endurance):GetSizeX() + 3)
  ;
  (self.Slider_Endurance):SetPosY(17)
  ;
  (self.btn_AllDoff):SetPosX((self.Slider_Endurance):GetPosX() - 50)
  ;
  (self.btn_AllDoff):SetPosY(45)
  ;
  (self.btn_ShowUnderwear):SetPosX((self.btn_AllDoff):GetPosX() + (self.btn_AllDoff):GetSizeX() - 1)
  ;
  (self.btn_ShowUnderwear):SetPosY(45)
  ;
  (self.btn_HideAvatar):SetPosX((self.btn_ShowUnderwear):GetPosX() + (self.btn_ShowUnderwear):GetSizeX() - 1)
  ;
  (self.btn_HideAvatar):SetPosY(45)
  ;
  (self.btn_HideHair):SetPosX((self.btn_HideAvatar):GetPosX() + (self.btn_HideAvatar):GetSizeX() - 1)
  ;
  (self.btn_HideHair):SetPosY(45)
  ;
  (self.btn_HideHelm):SetPosX((self.btn_HideHair):GetPosX() + (self.btn_HideHair):GetSizeX() - 1)
  ;
  (self.btn_HideHelm):SetPosY(45)
  ;
  (self.btn_OpenHelm):SetPosX((self.btn_HideHelm):GetPosX() + (self.btn_HideHelm):GetSizeX() - 1)
  ;
  (self.btn_OpenHelm):SetPosY(45)
  ;
  (self.btn_AwakenWeapon):SetPosX((self.btn_OpenHelm):GetPosX() + (self.btn_OpenHelm):GetSizeX() - 1)
  ;
  (self.btn_AwakenWeapon):SetPosY(45)
  ;
  (self.btn_WarStance):SetPosX((self.btn_AwakenWeapon):GetPosX() + (self.btn_AwakenWeapon):GetSizeX() - 1)
  ;
  (self.btn_WarStance):SetPosY(45)
  ;
  (self.cameraControlBG):AddChild(self.cameraControlTitle)
  ;
  (self.cameraControlBG):AddChild(self.cameraControlMoveBG)
  ;
  (self.cameraControlBG):AddChild(self.cameraControlWheelBG)
  ;
  (self.cameraControlBG):AddChild(self.cameraControlRotateBG)
  ;
  (self.cameraControlBG):AddChild(self.cameraControlMove)
  ;
  (self.cameraControlBG):AddChild(self.cameraControlWheel)
  ;
  (self.cameraControlBG):AddChild(self.cameraControlRotate)
  Panel_IngameCashShop_Controller:RemoveControl(self.cameraControlTitle)
  Panel_IngameCashShop_Controller:RemoveControl(self.cameraControlMoveBG)
  Panel_IngameCashShop_Controller:RemoveControl(self.cameraControlWheelBG)
  Panel_IngameCashShop_Controller:RemoveControl(self.cameraControlRotateBG)
  Panel_IngameCashShop_Controller:RemoveControl(self.cameraControlMove)
  Panel_IngameCashShop_Controller:RemoveControl(self.cameraControlWheel)
  Panel_IngameCashShop_Controller:RemoveControl(self.cameraControlRotate)
  ;
  (self.cameraControlTitle):SetPosY(35)
  ;
  (self.cameraControlMoveBG):SetPosY(50)
  ;
  (self.cameraControlWheelBG):SetPosY(90)
  ;
  (self.cameraControlRotateBG):SetPosY(130)
  ;
  (self.cameraControlMove):SetPosX(45)
  ;
  (self.cameraControlMove):SetPosY(50)
  ;
  (self.cameraControlWheel):SetPosX(45)
  ;
  (self.cameraControlWheel):SetPosY(90)
  ;
  (self.cameraControlRotate):SetPosX(45)
  ;
  (self.cameraControlRotate):SetPosY(130)
  ;
  (self.GameTime_Slider):SetShow(false)
  ;
  (self.BTN_Light):SetShow(false)
  ;
  (self.SunIcon):SetShow(true)
  ;
  (self.MoonIcon):SetShow(false)
  ;
  (self.btn_SpecialMove):SetShow(false)
  ;
  (self.cameraControlBG):SetIgnore(false)
  ;
  (self.cameraControlBG):SetAlpha(0.8)
  ;
  (self.cameraControlTitle):SetAlpha(0.8)
  ;
  (self.cameraControlMoveBG):SetAlpha(0.8)
  ;
  (self.cameraControlWheelBG):SetAlpha(0.8)
  ;
  (self.cameraControlRotateBG):SetAlpha(0.8)
  ;
  (self.cameraControlMove):SetAlpha(0.8)
  ;
  (self.cameraControlWheel):SetAlpha(0.8)
  ;
  (self.cameraControlRotate):SetAlpha(0.8)
  ;
  (self.cameraControlTitle):SetFontColor(UI_color.C_AAFFFFFF)
  ;
  (self.cameraControlMove):SetFontColor(UI_color.C_AAFFFFFF)
  ;
  (self.cameraControlWheel):SetFontColor(UI_color.C_AAFFFFFF)
  ;
  (self.cameraControlRotate):SetFontColor(UI_color.C_AAFFFFFF)
  ;
  (self.ChaCTR_Area):AddChild(self.RotateArrow_L)
  ;
  (self.ChaCTR_Area):AddChild(self.RotateArrow_R)
  Panel_IngameCashShop_Controller:RemoveControl(self.RotateArrow_L)
  Panel_IngameCashShop_Controller:RemoveControl(self.RotateArrow_R)
  ;
  (self.cameraControlBG):SetSpanSize(17, 60)
  FGlobal_CashShop_SetEquip_CouponEffectCheck()
  local _btn_SizeX = (self.btn_Coupon):GetSizeX() + 23
  local _btn_TextSizeX = _btn_SizeX - _btn_SizeX / 2 - (self.btn_Coupon):GetTextSizeX() / 2
  ;
  (self.btn_Coupon):SetTextSpan(_btn_TextSizeX, 4)
  if isGameTypeKR2() then
    (self.static_SetOptionEnduranceBG):SetShow(false)
    ;
    (self.txt_Endurance):SetShow(false)
    ;
    (self.Slider_Endurance):SetShow(false)
    ;
    (self.btn_ShowUnderwear):SetShow(false)
    ;
    (self.static_SetOptionBG):SetSize((self.static_SetOptionBG):GetSizeX(), 60)
    ;
    (self.btn_AllDoff):SetPosY(15)
    ;
    (self.btn_ShowUnderwear):SetPosY(15)
    ;
    (self.btn_HideAvatar):SetPosY(15)
    ;
    (self.btn_HideHair):SetPosY(15)
    ;
    (self.btn_HideHelm):SetPosY(15)
    ;
    (self.btn_OpenHelm):SetPosY(15)
    ;
    (self.btn_AwakenWeapon):SetPosY(15)
    ;
    (self.btn_WarStance):SetPosY(15)
  end
end

FGlobal_CashShop_SetEquip_CouponEffectCheck = function()
  -- function num : 0_20 , upvalues : CashShopController, isCouponOpen
  local self = CashShopController
  local count = ToClient_GetCouponInfoUsableCount()
  if isCouponOpen then
    (self.btn_Coupon):EraseAllEffect()
    ;
    (self.btn_Coupon):SetShow(true)
    ;
    (self.btn_Coupon):SetSpanSize(10, 90)
    if count > 0 then
      (self.btn_Coupon):AddEffect("UI_Cuponbox_Line", true, -10, 58)
    end
  else
    ;
    (self.btn_Coupon):SetShow(false)
  end
end

CashShopController.Open = function(self)
  -- function num : 0_21 , upvalues : StaticText_CustomizationMessage
  local nowTime = (getIngameCashMall()):getWeatherTime()
  ;
  (getIngameCashMall()):setWeatherTime(6, nowTime)
  local controlPos = 4.1666666666667 * nowTime
  ;
  (self.GameTime_Slider):SetControlPos(controlPos)
  local isLightOn = (getIngameCashMall()):getLight()
  ;
  (self.BTN_Light):SetCheck(isLightOn)
  local isCharacterViewCamera = (getIngameCashMall()):getCharacterViewCamera()
  ;
  (self.BTN_EyeSee):SetCheck(isCharacterViewCamera)
  local endurancePercents = (getIngameCashMall()):getEquipmentEndurancePercents()
  ;
  (self.Slider_Endurance):SetControlPos(endurancePercents * 100)
  local isShowUnderwear = (getIngameCashMall()):getIsShowUnderwear()
  ;
  (self.btn_ShowUnderwear):SetCheck(isShowUnderwear)
  local isShowWithoutAvatar = (getIngameCashMall()):getIsShowWithoutAvatar()
  ;
  (self.btn_HideAvatar):SetCheck(isShowWithoutAvatar)
  local isFaceVisibleHair = (getIngameCashMall()):getFaceVisibleHair()
  ;
  (self.btn_HideHair):SetCheck(isFaceVisibleHair)
  local isAwakenWeapon = (getIngameCashMall()):getAwakenWeaponView()
  ;
  (self.btn_AwakenWeapon):SetCheck(isAwakenWeapon)
  local isWarStance = (getIngameCashMall()):getBattleView()
  ;
  (self.btn_WarStance):SetCheck(isWarStance)
  local isHelmOpen = (getIngameCashMall()):getIsShowBattleHelmet()
  ;
  (self.btn_OpenHelm):SetCheck(isHelmOpen)
  ;
  (self.btn_Coupon):SetSpanSize(10, 90)
  Panel_IngameCashShop_Controller:SetShow(true)
  Panel_CustomizationMessage:SetShow(true, false)
  local message = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_CONTROLLER_MSG")
  StaticText_CustomizationMessage:SetText(message)
  StaticText_CustomizationMessage:SetSize(StaticText_CustomizationMessage:GetTextSizeX() + 10 + (StaticText_CustomizationMessage:GetSpanSize()).x, 25)
  StaticText_CustomizationMessage:SetSpanSize(0, 0)
  StaticText_CustomizationMessage:SetShow(true)
  StaticText_CustomizationMessage:SetIgnore(true)
  self.isShowUI = true
  self:ResetViewCharacterPosition()
  ;
  (self.BTN_ShowUI):SetCheck(false)
  self:SetPosition()
end

CashShopController.Close = function(self)
  -- function num : 0_22
  Panel_IngameCashShop_Controller:SetShow(false)
  Panel_CustomizationMessage:SetShow(false, false)
  ;
  (self.SunShine1):SetShow(false)
  ;
  (self.SunShine2):SetShow(false)
  ;
  (self.SunShine3):SetShow(false)
  ;
  (self.SunShine4):SetShow(false)
  ;
  (self.SunShine5):SetShow(false)
  ;
  (self.SunShine6):SetShow(false)
  ;
  (self.btn_SpecialMove1):SetShow(false)
  ;
  (self.btn_SpecialMove2):SetShow(false)
  ;
  (self.cameraControlBG):SetSpanSize(17, 60)
end

local tabIndexList = (Array.new)()
FGlobal_CashShop_SetEquip_BGToggle = function(tabType)
  -- function num : 0_23 , upvalues : CashShopController, tabIndexList
  local self = CashShopController
  ;
  (self.cameraControlBG):SetSpanSize(17, 60)
  for dd = 1, getCashMainCategorySize() do
    local mainTabInfo = ToClient_GetMainCategoryStaticStatusWrapperByKeyRaw(dd)
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R7 in 'UnsetPending'

    if mainTabInfo ~= nil then
      tabIndexList[dd] = {mainTabInfo:getDisplayOrder(), mainTabInfo:getNoRaw(), mainTabInfo:getTabImageNo(), mainTabInfo:getIconPath(), mainTabInfo:getCategoryType()}
    end
  end
  local realno = nil
  for dd = 1, getCashMainCategorySize() do
    if (tabIndexList[dd])[1] == tabType then
      realno = (tabIndexList[dd])[5]
    end
  end
  self.savedTabType = realno
  if realno == 7 then
    (self.cameraControlBG):SetSpanSize(17, 60)
    ;
    (self.petLookBG):SetShow(false)
    ;
    (self.static_SetOptionBG):SetShow(false)
  else
    if realno == 4 then
      (self.static_SetOptionBG):SetShow(true)
      ;
      (self.petLookBG):SetShow(false)
      ;
      (self.cameraControlBG):SetSpanSize(17, 150)
    else
      ;
      (self.cameraControlBG):SetSpanSize(17, 60)
      ;
      (self.petLookBG):SetShow(false)
      ;
      (self.static_SetOptionBG):SetShow(false)
    end
  end
end

FGlobal_CashShop_SetEquip_SelectedItem = function(productNoRaw)
  -- function num : 0_24 , upvalues : CashShopController, UI_TM
  local cashProduct = (getIngameCashMall()):getCashProductStaticStatusByProductNoRaw(productNoRaw)
  if cashProduct == nil then
    return 
  end
  local self = CashShopController
  local isMainCategory = cashProduct:getMainCategory()
  local isMiddleCategory = cashProduct:getMiddleCategory()
  if self.savedTabType ~= 4 then
    if isMainCategory == 7 and isMiddleCategory == 1 then
      (self.petLookBG):SetShow(true)
      ;
      (self.static_SetOptionBG):SetShow(false)
      ;
      (self.cameraControlBG):SetSpanSize(17, 130)
    else
      if isMainCategory == 4 then
        (self.static_SetOptionBG):SetShow(true)
        ;
        (self.petLookBG):SetShow(false)
        ;
        (self.cameraControlBG):SetSpanSize(17, 150)
      else
        if isMainCategory == 9 and isGameTypeEnglish() then
          (self.static_SetOptionBG):SetShow(true)
          ;
          (self.petLookBG):SetShow(false)
          ;
          (self.cameraControlBG):SetSpanSize(17, 150)
        else
          ;
          (self.cameraControlBG):SetSpanSize(17, 60)
          ;
          (self.petLookBG):SetShow(false)
          ;
          (self.static_SetOptionBG):SetShow(false)
        end
      end
    end
  else
    ;
    (self.static_SetOptionBG):SetShow(true)
    ;
    (self.petLookBG):SetShow(false)
    ;
    (self.cameraControlBG):SetSpanSize(17, 150)
  end
  ;
  (self.txt_petLookNameMain):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.txt_petLookNameSub):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.btn_petLookBefore):SetShow(false)
  ;
  (self.btn_petLookNext):SetShow(false)
  if (getIngameCashMall()):IsStartOfTierPet() then
    (self.btn_petLookBefore):SetShow(false)
    ;
    (self.txt_petLookNameMain):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND"))
    ;
    (self.txt_petLookNameSub):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND_DEFAULT_OPTION"))
  else
    ;
    (self.txt_petLookNameMain):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND"))
    ;
    (self.txt_petLookNameSub):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND_OPTION"))
    ;
    (self.btn_petLookBefore):SetShow(true)
  end
  if (getIngameCashMall()):IsEndOfTierPet() then
    (self.btn_petLookNext):SetShow(false)
  else
    ;
    (self.btn_petLookNext):SetShow(true)
  end
end

CashShopController.SetPosition = function(self)
  -- function num : 0_25 , upvalues : CashShopController
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_IngameCashShop_Controller:GetSizeX()
  local panelSizeY = (Panel_IngameCashShop_Controller:GetSizeY())
  local ControllerSizeX, ControllerSizeY, ControllerPosX, ControllerPosY = nil, nil, nil, nil
  if (self.BTN_ShowUI):IsCheck() then
    ControllerSizeX = scrSizeX
    ControllerSizeY = scrSizeY
    ControllerPosX = 0
    ControllerPosY = 0
  else
    ControllerSizeX = scrSizeX - (Panel_IngameCashShop:GetPosX() + Panel_IngameCashShop:GetSizeX() + 130)
    ControllerSizeY = scrSizeY
    ControllerPosX = Panel_IngameCashShop:GetPosX() + Panel_IngameCashShop:GetSizeX() + 130
    ControllerPosY = 0
  end
  Panel_IngameCashShop_Controller:SetSize(ControllerSizeX, ControllerSizeY)
  Panel_IngameCashShop_Controller:SetPosX(ControllerPosX)
  Panel_IngameCashShop_Controller:SetPosY(ControllerPosY)
  ;
  (self.ChaCTR_Area):SetSize(ControllerSizeX - 10, ControllerSizeY - 10)
  ;
  (self.ChaCTR_Area):SetPosX(10)
  ;
  (self.ChaCTR_Area):SetPosY(10)
  ;
  (self.SunIcon):SetSpanSize(110, 38)
  ;
  (self.SunShine1):SetSpanSize(250, 88)
  ;
  (self.SunShine2):SetSpanSize(200, 88)
  ;
  (self.SunShine3):SetSpanSize(150, 88)
  ;
  (self.SunShine4):SetSpanSize(100, 88)
  ;
  (self.SunShine5):SetSpanSize(50, 88)
  ;
  (self.SunShine6):SetSpanSize(0, 88)
  ;
  (self.btn_SpecialMove1):SetSpanSize(190, 88)
  ;
  (self.btn_SpecialMove2):SetSpanSize(140, 88)
  ;
  (self.static_SetOptionBG):ComputePos()
  ;
  (self.petLookBG):ComputePos()
  ;
  (self.btn_SpecialMove):ComputePos()
  ;
  (self.GameTime_Slider):ComputePos()
  ;
  (self.BTN_Light):ComputePos()
  ;
  (self.BTN_EyeSee):ComputePos()
  ;
  (self.BTN_ShowUI):ComputePos()
  ;
  (self.SunIcon):ComputePos()
  ;
  (self.MoonIcon):ComputePos()
  ;
  (self.SunShine1):ComputePos()
  ;
  (self.SunShine2):ComputePos()
  ;
  (self.SunShine3):ComputePos()
  ;
  (self.SunShine4):ComputePos()
  ;
  (self.SunShine5):ComputePos()
  ;
  (self.SunShine6):ComputePos()
  ;
  (self.btn_SpecialMove1):ComputePos()
  ;
  (self.btn_SpecialMove2):ComputePos()
  ;
  (self.btn_Coupon):ComputePos()
  ;
  (self.cameraControlBG):ComputePos()
  CashShopController:ResetViewCharacterPosition()
end

CashShopController.ResetViewCharacterPosition = function(self)
  -- function num : 0_26
  if self.isShowUI then
    local leftWindowSize = Panel_IngameCashShop:GetSizeX()
    local screenSize = getScreenSizeX()
    ;
    (getIngameCashMall()):setCreatePosition((screenSize + leftWindowSize) / 2 / screenSize, 0.5, 320)
  else
    do
      ;
      (getIngameCashMall()):setCreatePosition(0.5, 0.5, 320)
    end
  end
end

HandleClicked_CashShopController_SetTime = function()
  -- function num : 0_27 , upvalues : CashShopController
  local self = CashShopController
  local ttIndex = (self.GameTime_Slider):GetSelectIndex()
  ;
  (getIngameCashMall()):setWeatherTime(6, ttIndex)
end

HandleClicked_CashShopController_SetLight = function()
  -- function num : 0_28 , upvalues : CashShopController
  local self = CashShopController
  if not (self.BTN_Light):IsCheck() then
    (getIngameCashMall()):setLight(false)
  else
    ;
    (getIngameCashMall()):setLight(true)
  end
end

HandleClicked_CashShopController_SetCharacterViewCamera = function()
  -- function num : 0_29 , upvalues : CashShopController
  local self = CashShopController
  ;
  (getIngameCashMall()):setCharacterViewCamera((self.BTN_EyeSee):IsCheck())
end

HandleClicked_CashShopController_SetSpecialMove = function()
  -- function num : 0_30 , upvalues : CashShopController
  local self = CashShopController
  local specialMoveCheck = (self.btn_SpecialMove):IsCheck()
  local sunShineCheck = (self.SunIcon):IsCheck()
  local action = (getIngameCashMall()):getCharacterActionCount() - 1
  local characterAnimationCount = (getIngameCashMall()):getCharacterAnimationCount(action)
  if specialMoveCheck or sunShineCheck then
    (self.btn_Coupon):SetSpanSize(10, 140)
    ;
    (self.SunIcon):SetCheck(false)
    HandleClicked_SunShineToggle()
  else
    ;
    (self.btn_Coupon):SetSpanSize(10, 90)
  end
  -- DECOMPILER ERROR at PC50: Unhandled construct in 'MakeBoolean' P1

  if not (self.btn_SpecialMove1):GetShow() or characterAnimationCount == 1 then
    if specialMoveCheck then
      (self.btn_SpecialMove1):SetShow(true)
      ;
      (self.btn_SpecialMove2):SetShow(false)
      ;
      (self.btn_SpecialMove1):SetSpanSize(165, 88)
    else
      ;
      (self.btn_SpecialMove1):SetShow(false)
      ;
      (self.btn_SpecialMove2):SetShow(false)
    end
  else
    if characterAnimationCount == 2 then
      if specialMoveCheck then
        (self.btn_SpecialMove1):SetShow(true)
        ;
        (self.btn_SpecialMove2):SetShow(true)
        ;
        (self.btn_SpecialMove1):SetSpanSize(190, 88)
        ;
        (self.btn_SpecialMove2):SetSpanSize(140, 88)
      else
        ;
        (self.btn_SpecialMove1):SetShow(true)
        ;
        (self.btn_SpecialMove2):SetShow(true)
      end
    end
  end
  ;
  (self.btn_SpecialMove1):ComputePos()
  ;
  (self.btn_SpecialMove2):ComputePos()
end

HandleClicked_CashShopController_SetShowUIToggle = function()
  -- function num : 0_31 , upvalues : CashShopController
  local self = CashShopController
  if self.isShowUI == true then
    Panel_IngameCashShop:SetShow(false)
    Panel_IngameCashShop_SetEquip:SetShow(false)
    FGlobal_Close_IngameCashShop_NewCart()
    InGameShopBuy_Close()
    IngameCashShopCoupon_Close()
    if Panel_IngameCashShop_GoodsDetailInfo:GetShow() then
      InGameShopDetailInfo_Close()
    end
    self.isShowUI = false
  else
    Panel_IngameCashShop:SetShow(true)
    Panel_IngameCashShop_SetEquip:SetShow(true)
    InGameShop_ReShowByHideUI()
    FGlobal_CheckPromotionTab()
    InGameShop_Promotion_Open()
    self.isShowUI = true
  end
  self:ResetViewCharacterPosition()
  self:SetPosition()
end

HandleClicked_CashShopController_SetCharacterRotate_Start = function(isLDown)
  -- function num : 0_32 , upvalues : CashShopController
  local self = CashShopController
  if isLDown then
    self.isLdown = true
  else
    self.isRdown = true
  end
  self.lMovePos = getMousePosX()
  self.yMovePos = getMousePosY()
  self.xStartPos = getMousePosX()
  self.yStartPos = getMousePosY()
end

HandleClicked_CashShopController_SetCharacterRotate_End = function(isLDown)
  -- function num : 0_33 , upvalues : CashShopController
  local self = CashShopController
  if isLDown == nil then
    self.isLdown = false
    self.isRdown = false
  else
    if isLDown then
      do
        if (math.abs)(self.xStartPos - getMousePosX()) + (math.abs)(self.yStartPos - getMousePosY()) < 20 then
          local randValue = (math.random)(0, (getIngameCashMall()):getCharacterActionCount() - 1)
          ;
          (getIngameCashMall()):setCharacterActionKey(randValue, 0)
        end
        self.isLdown = false
        self.isRdown = false
      end
    end
  end
end

HandleClicked_CashShopController_SetCharacterScroll = function(isUp)
  -- function num : 0_34
  local upValue = 25
  if isUp == true then
    upValue = -upValue
  end
  ;
  (getIngameCashMall()):varyCameraZoom(upValue)
end

HandleClicked_CashShopController_UpdateEndurance = function()
  -- function num : 0_35 , upvalues : CashShopController
  local self = CashShopController
  local ttIndex = (self.Slider_Endurance):GetSelectIndex()
  ;
  (getIngameCashMall()):setEquipmentEndurancePercents(ttIndex / 100)
end

HandleClicked_CashShopController_OffAllEquip = function()
  -- function num : 0_36
  (getIngameCashMall()):clearEquipViewList()
end

HandleClicked_CashShopController_ToggleUnderWear = function()
  -- function num : 0_37 , upvalues : CashShopController
  local self = CashShopController
  local isChecked = (self.btn_ShowUnderwear):IsCheck()
  ;
  (getIngameCashMall()):setIsShowUnderwear(isChecked)
  if isChecked then
    (self.btn_HideAvatar):SetCheck(false)
  end
end

HandleClicked_CashShopController_ToggleAvatar = function()
  -- function num : 0_38 , upvalues : CashShopController
  local self = CashShopController
  local isChecked = (self.btn_HideAvatar):IsCheck()
  ;
  (getIngameCashMall()):setIsShowWithoutAvatar(isChecked)
  if isChecked then
    (self.btn_ShowUnderwear):SetCheck(false)
  end
end

HandleClicked_CashShopController_ToggleHideHair = function()
  -- function num : 0_39 , upvalues : CashShopController
  local self = CashShopController
  local isChecked = (self.btn_HideHair):IsCheck()
  if isChecked then
    (self.btn_HideHair):EraseAllEffect()
  end
  ;
  (getIngameCashMall()):setFaceVisibleHair(isChecked)
end

CashShopController_HideHairBtnCheck = function(isUpHairMode)
  -- function num : 0_40 , upvalues : CashShopController
  local self = CashShopController
  if isUpHairMode then
    if not (self.btn_HideHair):IsCheck() then
      (self.btn_HideHair):EraseAllEffect()
      ;
      (self.btn_HideHair):AddEffect("UI_CashShop_HairChange", true, 0, 0)
    else
      if (self.btn_HideHair):IsCheck() then
        (self.btn_HideHair):EraseAllEffect()
      end
    end
  else
    ;
    (self.btn_HideHair):EraseAllEffect()
  end
end

HandleClicked_CashShopController_ToggleHideHelm = function()
  -- function num : 0_41 , upvalues : CashShopController
  local self = CashShopController
  local isChecked = (self.btn_HideHelm):IsCheck()
  ;
  (getIngameCashMall()):setIsShowWithoutHelmet(isChecked)
end

HandleClicked_CashShopController_ToggleOpenHelm = function()
  -- function num : 0_42 , upvalues : CashShopController
  local self = CashShopController
  local isChecked = (self.btn_OpenHelm):IsCheck()
  ;
  (getIngameCashMall()):setIsShowBattleHelmet(isChecked)
end

HandleClicked_CashShopController_ToggleAwakenWeapon = function()
  -- function num : 0_43 , upvalues : CashShopController
  local isChecked = (CashShopController.btn_AwakenWeapon):IsCheck()
  ;
  (getIngameCashMall()):setAwakenWeaponView(isChecked)
end

HandleClicked_CashShopController_ToggleWarStance = function()
  -- function num : 0_44 , upvalues : CashShopController
  local isChecked = (CashShopController.btn_WarStance):IsCheck()
  ;
  (getIngameCashMall()):setBattleView(isChecked)
end

HandleClicked_CashShopController_AutoToggleUnderWear = function()
  -- function num : 0_45 , upvalues : CashShopController
  local self = CashShopController
  ;
  (self.btn_ShowUnderwear):SetCheck(true)
  ;
  (self.btn_HideAvatar):SetCheck(false)
  ;
  (getIngameCashMall()):setIsShowUnderwear(true)
end

HandleClicked_CashShopController_AutoToggleOffAll = function()
  -- function num : 0_46 , upvalues : CashShopController
  local self = CashShopController
  ;
  (self.btn_ShowUnderwear):SetCheck(false)
  ;
  (self.btn_HideAvatar):SetCheck(false)
  ;
  (getIngameCashMall()):setIsShowUnderwear(false)
  ;
  (getIngameCashMall()):setIsShowWithoutAvatar(false)
end

HandleClicked_CashShopController_AutoToggleUpHair = function(isUpHairMode)
  -- function num : 0_47 , upvalues : CashShopController
  local self = CashShopController
  ;
  (self.btn_HideHair):SetCheck(isUpHairMode)
  ;
  (getIngameCashMall()):setFaceVisibleHair(isUpHairMode)
end

CashShopController_ForceOffAllButton = function()
  -- function num : 0_48 , upvalues : CashShopController
  local self = CashShopController
  if (self.btn_HideHelm):IsCheck() then
    (self.btn_HideHelm):SetCheck(false)
    ;
    (getIngameCashMall()):setIsShowWithoutHelmet(false)
  end
  if (self.btn_OpenHelm):IsCheck() then
    (self.btn_OpenHelm):SetCheck(false)
    ;
    (getIngameCashMall()):setIsShowBattleHelmet(false)
  end
  if (self.btn_AwakenWeapon):IsCheck() then
    (self.btn_AwakenWeapon):SetCheck(false)
    ;
    (getIngameCashMall()):setAwakenWeaponView(false)
  end
  if (self.btn_WarStance):IsCheck() then
    (self.btn_WarStance):SetCheck(false)
    ;
    (getIngameCashMall()):setBattleView(false)
  end
  if (self.btn_ShowUnderwear):IsCheck() then
    (self.btn_ShowUnderwear):SetCheck(false)
    ;
    (getIngameCashMall()):setIsShowUnderwear(false)
  end
  if (self.btn_HideAvatar):IsCheck() then
    (self.btn_HideAvatar):SetCheck(false)
    ;
    (getIngameCashMall()):setIsShowWithoutAvatar(false)
  end
  if (self.btn_HideHair):IsCheck() then
    (self.btn_HideHair):SetCheck(false)
    ;
    (getIngameCashMall()):setFaceVisibleHair(false)
  end
end

cashShop_Controller_UpdateCharacterRotate = function(deltatime)
  -- function num : 0_49 , upvalues : CashShopController
  local self = CashShopController
  if self.isLdown == false and self.isRdown == false then
    return 
  end
  local currPos = getMousePosX()
  local currPosY = getMousePosY()
  if currPos == self.lMovePos and currPosY == self.yMovePos then
    return 
  end
  local radianAngle = (self.lMovePos - currPos) / (getScreenSizeX() / 10)
  local cameraPitch = (currPosY - self.yMovePos) / (getScreenSizeY() / 2)
  self.lMovePos = currPos
  self.yMovePos = currPosY
  if self.isLdown then
    (getIngameCashMall()):varyCameraPositionByUpAndRightVector(radianAngle * 30, cameraPitch * 90)
  end
  if self.isRdown then
    (getIngameCashMall()):rotateViewCharacter(radianAngle)
    ;
    (getIngameCashMall()):varyCameraPitch(-cameraPitch / 1.5)
  end
end

cashShop_Controller_Open = function()
  -- function num : 0_50 , upvalues : CashShopController
  CashShopController:Open()
  ;
  (CashShopController.petLookBG):SetShow(false)
  ;
  (CashShopController.static_SetOptionBG):SetShow(false)
end

cashShop_Controller_Close = function()
  -- function num : 0_51 , upvalues : CashShopController
  CashShopController:Close()
end

_cashShopController_ButtonTooltip = function(isShow, buttonType)
  -- function num : 0_52 , upvalues : CashShopController
  local self = CashShopController
  local uiControl, name, desc = nil, nil, nil
  if buttonType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SHOWUNDERWEAR")
    uiControl = self.btn_ShowUnderwear
  else
    if buttonType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HIDEAVATAR")
      uiControl = self.btn_HideAvatar
    else
      if buttonType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HIDHAIR")
        uiControl = self.btn_HideHair
      else
        if buttonType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_ALLDOFF")
          uiControl = self.btn_AllDoff
        else
          if buttonType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_EYESEE")
            uiControl = self.BTN_EyeSee
          else
            if buttonType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SHOWUI")
              uiControl = self.BTN_ShowUI
            else
              if buttonType == 6 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HIDEHELM")
                uiControl = self.btn_HideHelm
              else
                if buttonType == 7 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SUNICON")
                  uiControl = self.SunIcon
                else
                  if buttonType == 8 then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_AWAKENWEAPON")
                    uiControl = self.btn_AwakenWeapon
                  else
                    if buttonType == 9 then
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_TOOLTIP_WARSTANCE")
                      uiControl = self.btn_WarStance
                    else
                      if buttonType == 10 then
                        name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SPECIALACTION_TOOLTIP")
                        uiControl = self.btn_SpecialMove
                      else
                        if buttonType == 11 then
                          name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_OPENHELM")
                          uiControl = self.btn_OpenHelm
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

FromClient_CashShopController_Resize = function()
  -- function num : 0_53 , upvalues : CashShopController
  CashShopController:SetPosition()
end

FromClient_ChangeAwakenWeapon = function(isAwakenWeaponView)
  -- function num : 0_54 , upvalues : CashShopController
  (CashShopController.btn_AwakenWeapon):SetCheck(isAwakenWeaponView)
end

FromClient_ChangeCashshopBattle = function(isBattle)
  -- function num : 0_55 , upvalues : CashShopController
  (CashShopController.btn_WarStance):SetCheck(isBattle)
end

HandleClicked_SunShineToggle = function()
  -- function num : 0_56 , upvalues : CashShopController
  local self = CashShopController
  local sunShineCheck = (self.SunIcon):IsCheck()
  local specialMoveCheck = (self.btn_SpecialMove):IsCheck()
  if sunShineCheck or specialMoveCheck then
    (self.btn_Coupon):SetSpanSize(10, 140)
  else
    ;
    (self.btn_Coupon):SetSpanSize(10, 90)
  end
  if (self.btn_SpecialMove1):GetShow() then
    (self.btn_SpecialMove1):SetShow(false)
    ;
    (self.btn_SpecialMove2):SetShow(false)
    ;
    (self.btn_SpecialMove):SetCheck(false)
  end
  ;
  (self.SunShine1):SetShow(sunShineCheck)
  ;
  (self.SunShine2):SetShow(sunShineCheck)
  ;
  (self.SunShine3):SetShow(sunShineCheck)
  ;
  (self.SunShine4):SetShow(sunShineCheck)
  ;
  (self.SunShine5):SetShow(sunShineCheck)
  ;
  (self.SunShine6):SetShow(sunShineCheck)
end

HandleClicked_SunShineSetting = function(weatherType)
  -- function num : 0_57
  if weatherType == 1 then
    weatherIndex = 0
  else
    if weatherType == 2 then
      weatherIndex = 3
    else
      if weatherType == 3 then
        weatherIndex = 7
      else
        if weatherType == 4 then
          weatherIndex = 11
        else
          if weatherType == 5 then
            weatherIndex = 15
          else
            if weatherType == 6 then
              weatherIndex = 19
            end
          end
        end
      end
    end
  end
  ;
  (getIngameCashMall()):setWeatherTime(6, weatherIndex)
end

HandleClicked_SpecialMoveSetting = function(moveType)
  -- function num : 0_58
  local animationValue = 0
  if moveType == 1 then
    animationValue = 1
  else
    if moveType == 2 then
      animationValue = 2
    else
      animationValue = 0
    end
  end
  local action = (getIngameCashMall()):getCharacterActionCount() - 1
  local animation = (getIngameCashMall()):getCharacterAnimationCount(action)
  if animation == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SPECIALACTION"))
    return 
  end
  ;
  (getIngameCashMall()):setCharacterActionKey((getIngameCashMall()):getCharacterActionCount() - 1, animationValue)
end

HandleClicked_PetLookChangeTier = function(isBefore)
  -- function num : 0_59 , upvalues : CashShopController
  local self = CashShopController
  local cashMallInfo = getIngameCashMall()
  if isBefore then
    cashMallInfo:changeViewPrevTierPet()
    if cashMallInfo:IsStartOfTierPet() then
      (self.txt_petLookNameMain):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND"))
      ;
      (self.txt_petLookNameSub):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND_DEFAULT_OPTION"))
      ;
      (self.btn_petLookBefore):SetShow(false)
    else
      ;
      (self.txt_petLookNameMain):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND"))
      ;
      (self.txt_petLookNameSub):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND_OPTION"))
      ;
      (self.btn_petLookBefore):SetShow(true)
    end
    if cashMallInfo:IsEndOfTierPet() then
      (self.btn_petLookNext):SetShow(false)
    else
      ;
      (self.btn_petLookNext):SetShow(true)
    end
  else
    cashMallInfo:changeViewNextTierPet()
    if cashMallInfo:IsEndOfTierPet() then
      (self.btn_petLookNext):SetShow(false)
    else
      ;
      (self.btn_petLookNext):SetShow(true)
    end
    if cashMallInfo:IsStartOfTierPet() then
      (self.txt_petLookNameMain):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND"))
      ;
      (self.txt_petLookNameSub):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND_DEFAULT_OPTION"))
      ;
      (self.btn_petLookBefore):SetShow(false)
    else
      ;
      (self.txt_petLookNameMain):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND"))
      ;
      (self.txt_petLookNameSub):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_LOOKAROUND_OPTION"))
      ;
      (self.btn_petLookBefore):SetShow(true)
    end
  end
end

FromClient_ChangeSpecialMove = function()
  -- function num : 0_60 , upvalues : CashShopController
  local self = CashShopController
  local action = (getIngameCashMall()):getCharacterActionCount() - 1
  local animation = (getIngameCashMall()):getCharacterAnimationCount(action)
  if animation == 0 then
    (self.btn_SpecialMove):SetShow(false)
    return 
  end
  ;
  (self.btn_SpecialMove):SetShow(true)
end

FGlobal_SpecialMoveSettingCheck = function()
  -- function num : 0_61 , upvalues : CashShopController
  local self = CashShopController
  local action = (getIngameCashMall()):getCharacterActionCount() - 1
  local characterAnimationCount = (getIngameCashMall()):getCharacterAnimationCount(action)
  ;
  (self.btn_SpecialMove1):SetShow(false)
  ;
  (self.btn_SpecialMove2):SetShow(false)
end

FGlobal_SpecialMoveSettingNoShow = function()
  -- function num : 0_62 , upvalues : CashShopController
  local self = CashShopController
  ;
  (self.btn_SpecialMove1):SetShow(false)
  ;
  (self.btn_SpecialMove2):SetShow(false)
end

IngameCashShop_CameraHelp = function(isShow)
  -- function num : 0_63 , upvalues : CashShopController, UI_color
  local self = CashShopController
  if isShow then
    (self.cameraControlBG):SetAlpha(1)
    ;
    (self.cameraControlMoveBG):SetAlpha(1)
    ;
    (self.cameraControlWheelBG):SetAlpha(1)
    ;
    (self.cameraControlRotateBG):SetAlpha(1)
    ;
    (self.cameraControlTitle):SetAlpha(1)
    ;
    (self.cameraControlMove):SetAlpha(1)
    ;
    (self.cameraControlWheel):SetAlpha(1)
    ;
    (self.cameraControlRotate):SetAlpha(1)
    ;
    (self.cameraControlTitle):SetFontColor(UI_color.C_FFC4BEBE)
    ;
    (self.cameraControlMove):SetFontColor(UI_color.C_FFEFEFEF)
    ;
    (self.cameraControlWheel):SetFontColor(UI_color.C_FFEFEFEF)
    ;
    (self.cameraControlRotate):SetFontColor(UI_color.C_FFEFEFEF)
  else
    ;
    (self.cameraControlBG):SetAlpha(0.8)
    ;
    (self.cameraControlMoveBG):SetAlpha(0.8)
    ;
    (self.cameraControlWheelBG):SetAlpha(0.8)
    ;
    (self.cameraControlRotateBG):SetAlpha(0.8)
    ;
    (self.cameraControlTitle):SetAlpha(0.8)
    ;
    (self.cameraControlMove):SetAlpha(0.8)
    ;
    (self.cameraControlWheel):SetAlpha(0.8)
    ;
    (self.cameraControlRotate):SetAlpha(0.8)
    ;
    (self.cameraControlTitle):SetFontColor(UI_color.C_AAFFFFFF)
    ;
    (self.cameraControlMove):SetFontColor(UI_color.C_AAFFFFFF)
    ;
    (self.cameraControlWheel):SetFontColor(UI_color.C_AAFFFFFF)
    ;
    (self.cameraControlRotate):SetFontColor(UI_color.C_AAFFFFFF)
  end
end

CashShopController.registEventHandler = function(self)
  -- function num : 0_64
  (self.GameTime_Slider):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_SetTime()")
  ;
  (self.GameTime_SliderCtrlBTN):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_SetTime()")
  ;
  (self.GameTime_SliderCtrlBTN):addInputEvent("Mouse_LPress", "HandleClicked_CashShopController_SetTime()")
  ;
  (self.BTN_Light):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_SetLight()")
  ;
  (self.BTN_EyeSee):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_SetCharacterViewCamera()")
  ;
  (self.BTN_ShowUI):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_SetShowUIToggle()")
  ;
  (self.ChaCTR_Area):addInputEvent("Mouse_LDown", "HandleClicked_CashShopController_SetCharacterRotate_Start(true)")
  ;
  (self.ChaCTR_Area):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_SetCharacterRotate_End(true)")
  ;
  (self.ChaCTR_Area):addInputEvent("Mouse_Out", "HandleClicked_CashShopController_SetCharacterRotate_End()")
  ;
  (self.ChaCTR_Area):addInputEvent("Mouse_RDown", "HandleClicked_CashShopController_SetCharacterRotate_Start(false)")
  ;
  (self.ChaCTR_Area):addInputEvent("Mouse_RUp", "HandleClicked_CashShopController_SetCharacterRotate_End(false)")
  ;
  (self.ChaCTR_Area):addInputEvent("Mouse_UpScroll", "HandleClicked_CashShopController_SetCharacterScroll(true)")
  ;
  (self.ChaCTR_Area):addInputEvent("Mouse_DownScroll", "HandleClicked_CashShopController_SetCharacterScroll(false)")
  ;
  (self.Slider_Endurance):addInputEvent("Mouse_LPress", "HandleClicked_CashShopController_UpdateEndurance()")
  ;
  (self.Slider_EnduranceCtrlBTN):addInputEvent("Mouse_LPress", "HandleClicked_CashShopController_UpdateEndurance()")
  ;
  (self.btn_AllDoff):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_OffAllEquip()")
  ;
  (self.btn_ShowUnderwear):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_ToggleUnderWear()")
  ;
  (self.btn_HideAvatar):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_ToggleAvatar()")
  ;
  (self.btn_HideHair):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_ToggleHideHair()")
  ;
  (self.btn_HideHelm):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_ToggleHideHelm()")
  ;
  (self.btn_OpenHelm):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_ToggleOpenHelm()")
  ;
  (self.btn_AwakenWeapon):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_ToggleAwakenWeapon()")
  ;
  (self.btn_WarStance):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_ToggleWarStance()")
  ;
  (self.btn_ShowUnderwear):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 0 .. ")")
  ;
  (self.btn_ShowUnderwear):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.btn_HideAvatar):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 1 .. ")")
  ;
  (self.btn_HideAvatar):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.btn_HideHair):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 2 .. ")")
  ;
  (self.btn_HideHair):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.btn_HideHelm):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 6 .. ")")
  ;
  (self.btn_HideHelm):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.btn_OpenHelm):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 11 .. ")")
  ;
  (self.btn_OpenHelm):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.btn_AwakenWeapon):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 8 .. ")")
  ;
  (self.btn_AwakenWeapon):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.btn_WarStance):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 9 .. ")")
  ;
  (self.btn_WarStance):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.btn_AllDoff):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 3 .. ")")
  ;
  (self.btn_AllDoff):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.BTN_EyeSee):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 4 .. ")")
  ;
  (self.BTN_EyeSee):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.BTN_ShowUI):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 5 .. ")")
  ;
  (self.BTN_ShowUI):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.SunIcon):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 7 .. ")")
  ;
  (self.SunIcon):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.btn_SpecialMove):addInputEvent("Mouse_On", "_cashShopController_ButtonTooltip( true, " .. 10 .. ")")
  ;
  (self.btn_SpecialMove):addInputEvent("Mouse_Out", "_cashShopController_ButtonTooltip( false )")
  ;
  (self.cameraControlBG):addInputEvent("Mouse_On", "IngameCashShop_CameraHelp( true )")
  ;
  (self.cameraControlBG):addInputEvent("Mouse_Out", "IngameCashShop_CameraHelp( false )")
  ;
  (self.SunIcon):addInputEvent("Mouse_LUp", "HandleClicked_SunShineToggle()")
  ;
  (self.SunShine1):addInputEvent("Mouse_LUp", "HandleClicked_SunShineSetting( 1 )")
  ;
  (self.SunShine2):addInputEvent("Mouse_LUp", "HandleClicked_SunShineSetting( 2 )")
  ;
  (self.SunShine3):addInputEvent("Mouse_LUp", "HandleClicked_SunShineSetting( 3 )")
  ;
  (self.SunShine4):addInputEvent("Mouse_LUp", "HandleClicked_SunShineSetting( 4 )")
  ;
  (self.SunShine5):addInputEvent("Mouse_LUp", "HandleClicked_SunShineSetting( 5 )")
  ;
  (self.SunShine6):addInputEvent("Mouse_LUp", "HandleClicked_SunShineSetting( 6 )")
  ;
  (self.btn_SpecialMove):addInputEvent("Mouse_LUp", "HandleClicked_CashShopController_SetSpecialMove()")
  ;
  (self.btn_SpecialMove1):addInputEvent("Mouse_LUp", "HandleClicked_SpecialMoveSetting( 1 )")
  ;
  (self.btn_SpecialMove2):addInputEvent("Mouse_LUp", "HandleClicked_SpecialMoveSetting( 2 )")
  Panel_IngameCashShop_Controller:RegisterUpdateFunc("cashShop_Controller_UpdateCharacterRotate")
  ;
  (self.btn_petLookBefore):addInputEvent("Mouse_LUp", "HandleClicked_PetLookChangeTier(true)")
  ;
  (self.btn_petLookNext):addInputEvent("Mouse_LUp", "HandleClicked_PetLookChangeTier(false)")
  ;
  (self.btn_Coupon):addInputEvent("Mouse_LUp", "IngameCashShopCoupon_Open()")
end

CashShopController.registMessageHandler = function(self)
  -- function num : 0_65
  registerEvent("onScreenResize", "FromClient_CashShopController_Resize")
  registerEvent("FromClient_ChangeAwakenWeapon", "FromClient_ChangeAwakenWeapon")
  registerEvent("FromClient_ChangeSpecialMove", "FromClient_ChangeSpecialMove")
end

CashShopController:Initialize()
CashShopController:registEventHandler()
CashShopController:registMessageHandler()

