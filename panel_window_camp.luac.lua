-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\camp\panel_window_camp.luac 

-- params : ...
-- function num : 0
Panel_Window_Camp:SetShow(false)
Panel_Window_Camp:setGlassBackground(true)
Panel_Window_Camp:ActiveMouseEventEffect(true)
Panel_Icon_Camp:ActiveMouseEventEffect(true)
PaGlobal_Camp = {
_ui = {_btn_UnSealTent = (UI.getChildControl)(Panel_Window_Camp, "Button_UnsealTent"), _btn_InvenOpen = (UI.getChildControl)(Panel_Window_Camp, "Button_Warehouse"), _btn_Repair = (UI.getChildControl)(Panel_Window_Camp, "Button_Repair"), _btn_ShopOpen = (UI.getChildControl)(Panel_Window_Camp, "Button_Shop"), _btn_Close = (UI.getChildControl)(Panel_Window_Camp, "Button_Win_Close"), _btn_Seal = (UI.getChildControl)(Panel_Window_Camp, "Button_SealTent"), _btn_RemoteSeal = (UI.getChildControl)(Panel_Window_Camp, "Button_RemoteSealTent"), _guideIcon = (UI.getChildControl)(Panel_Window_Camp, "Static_GuideIcon"), _txtTitle = (UI.getChildControl)(Panel_Window_Camp, "Static_Panel_Camp_Tent_Title"), _titleBG = (UI.getChildControl)(Panel_Window_Camp, "Static_Panel_Camp_TitleBG"), _contentBG = (UI.getChildControl)(Panel_Window_Camp, "Static_Panel_Camp_Tent_Content_Bg"), _txtTentTitle = (UI.getChildControl)(Panel_Window_Camp, "StaticText_TentSlotTitle"), 
_slotBg = {[3] = (UI.getChildControl)(Panel_Window_Camp, "Static_ItemSlotBg_Warehouse"), [4] = (UI.getChildControl)(Panel_Window_Camp, "Static_ItemSlotBg_Repair"), [5] = (UI.getChildControl)(Panel_Window_Camp, "Static_ItemSlotBg_Shop"), [6] = (UI.getChildControl)(Panel_Window_Camp, "Static_TentSlotBg")}
}
, 
_config = {
_itemSlot = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
_slotNo = {3, 4, 5, 6}
, 
_slotID = {[3] = "Static_Icon_CampInven", [4] = "Static_Icon_CampRepair", [5] = "Static_Icon_CampShop"}
, 
_isSetItem = {[3] = false, [4] = false, [5] = false, [6] = false}
}
, _btn_Camp = (UI.getChildControl)(Panel_Icon_Camp, "Button_CampIcon"), _itemSlots = (Array.new)(), _actorKeyRaw = nil, _isCamping = false, _panelSizeY = 0, _isOpen = false, _btnCount = 0, _defaultSlotPosY = 0, _defaultBtnPosY = 0}
-- DECOMPILER ERROR at PC165: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.initialize = function(self)
  -- function num : 0_0
  PaGlobal_Camp:setPos()
  local isShow = ToClient_isCampingReigsted()
  Panel_Icon_Camp:SetShow(isShow)
  for index,value in pairs((self._config)._slotNo) do
    local slot = {}
    ;
    (SlotItem.new)(slot, "CampEquip_" .. value, value, ((self._ui)._slotBg)[value], (self._config)._itemSlot)
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "PaGlobal_Camp:slotRClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "PaGlobal_Camp:equipItemTooltipShow(" .. value .. ", true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "PaGlobal_Camp:equipItemTooltipShow(" .. value .. ", false)")
    -- DECOMPILER ERROR at PC55: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._itemSlots)[value] = slot
  end
  ;
  (self._btn_Camp):ActiveMouseEventEffect(true)
  self._panelSizeY = Panel_Window_Camp:GetSizeY()
  self._defaultSlotPosY = (((self._ui)._slotBg)[4]):GetPosY()
  self._defaultBtnPosY = ((self._ui)._btn_Repair):GetPosY()
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.open = function(self)
  -- function num : 0_1
  if Panel_Window_NpcShop:GetShow() then
    return 
  end
  if Panel_Window_Repair:GetShow() then
    return 
  end
  ToClient_openCampingInfo()
  PaGlobal_Camp:setBtnPos()
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.close = function(self)
  -- function num : 0_2
  if Panel_Window_Inventory:GetShow() then
    Inventory_ShowToggle()
    handleClickedNpcShow_WindowClose()
  end
  if Panel_Window_Repair:GetShow() then
    handleMClickedRepairExitButton()
  end
  Panel_Window_Camp:SetShow(false)
  self._isCamping = false
  PaGlobal_Repair:setIsCamping(false)
  npcShop:setIsCamping(false)
  self._btnCount = 0
end

-- DECOMPILER ERROR at PC174: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.navi = function(self)
  -- function num : 0_3
  ToClient_requestCampingNavi()
end

FromClient_Camp_OpenByActorKeyRaw = function(actorKeyRaw)
  -- function num : 0_4
  PaGlobal_Camp:openByActorKeyRaw(actorKeyRaw)
  if Panel_Window_Camp:GetShow() and PaGlobal_Camp._isOpen == false then
    PaGlobal_Camp:close()
    return 
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Camp._isOpen = false
  if Panel_Window_Inventory:GetShow() == false then
    Inventory_ShowToggle()
  end
  PaGlobal_Camp:setPos()
  PaGlobal_Camp:setBtnPos()
  Panel_Window_Camp:SetShow(true)
  PaGlobal_Camp:update()
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Camp._isCamping = true
  PaGlobal_Repair:setIsCamping(true)
  npcShop:setIsCamping(true)
end

-- DECOMPILER ERROR at PC179: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.openByActorKeyRaw = function(self, actorKeyRaw)
  -- function num : 0_5
  self._actorKeyRaw = actorKeyRaw
end

-- DECOMPILER ERROR at PC182: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.sealTent = function(self)
  -- function num : 0_6
  PaGlobal_BuildingBuff:open()
  PaGlobal_Camp:close()
end

-- DECOMPILER ERROR at PC185: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.unSealTent = function(self)
  -- function num : 0_7
  ToClient_requestServantUnsealCampingTent(0)
  self._isOpen = true
end

-- DECOMPILER ERROR at PC188: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.functionOpen = function(self, slotIndex)
  -- function num : 0_8
  local isSetItem = ((self._config)._isSetItem)[slotIndex]
  if isSetItem then
    if slotIndex == 3 then
      ToClient_requestCampingInventoryOpen()
      Panel_Window_Camp:SetShow(false)
    else
      if slotIndex == 4 then
        ToClient_requestCampingRepairOpen()
        Panel_Window_Camp:SetShow(false)
      else
        if slotIndex == 5 then
          ToClient_requestCampingShopOpen()
          Panel_Window_Camp:SetShow(false)
        end
      end
    end
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_UNEQUIPEDITEM"))
  end
end

-- DECOMPILER ERROR at PC191: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.remoteSeal = function(self)
  -- function num : 0_9
  local FunctionYesRemoteSeal = function()
    -- function num : 0_9_0
    ToClient_requestServantCompulsionSealCampingTent()
    PaGlobal_Camp:close()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_REMOTERESET_DESC")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_REMOTERESET_TITLE"), content = messageBoxMemo, functionYes = FunctionYesRemoteSeal, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FromClient_OpenCampingRepair = function()
  -- function num : 0_10
  PaGlobal_Repair:repair_OpenPanel(true)
end

FromClient_OpenCampingShop = function()
  -- function num : 0_11
  NpcShop_UpdateContent()
end

FromClient_CampingUpdate = function()
  -- function num : 0_12
  PaGlobal_Camp:update()
end

-- DECOMPILER ERROR at PC200: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.update = function(self)
  -- function num : 0_13
  local isUnseal = ToClient_isCampingUnseal()
  for index,value in pairs((self._config)._slotNo) do
    local slot = (self._itemSlots)[value]
    if isUnseal then
      local itemWrapper = ToClient_requestCampingEquipItem(value)
      -- DECOMPILER ERROR at PC18: Confused about usage of register: R9 in 'UnsetPending'

      if itemWrapper ~= nil then
        ((self._config)._isSetItem)[value] = true
        slot:setItem(itemWrapper)
      else
        -- DECOMPILER ERROR at PC25: Confused about usage of register: R9 in 'UnsetPending'

        ;
        ((self._config)._isSetItem)[value] = false
        slot:clearItem()
      end
    else
      do
        do
          -- DECOMPILER ERROR at PC31: Confused about usage of register: R8 in 'UnsetPending'

          ;
          ((self._config)._isSetItem)[value] = false
          slot:clearItem()
          -- DECOMPILER ERROR at PC34: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC34: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC34: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if isUnseal then
    ((self._ui)._btn_Seal):SetShow(true)
    ;
    ((self._ui)._btn_RemoteSeal):SetShow(true)
    ;
    ((self._ui)._btn_UnSealTent):SetShow(false)
    ;
    ((self._ui)._txtTentTitle):SetShow(true)
    ;
    ((self._ui)._btn_Seal):addInputEvent("Mouse_LUp", "PaGlobal_Camp:sealTent()")
    ;
    ((self._ui)._btn_RemoteSeal):addInputEvent("Mouse_LUp", "PaGlobal_Camp:remoteSeal()")
    ;
    ((self._ui)._btn_Seal):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_BUILDINGBUFFLIST_BUTTON_TEXT"))
  else
    ;
    ((self._ui)._btn_UnSealTent):SetShow(true)
    ;
    ((self._ui)._btn_Seal):SetShow(false)
    ;
    ((self._ui)._btn_RemoteSeal):SetShow(false)
    ;
    ((self._ui)._txtTentTitle):SetShow(false)
    ;
    ((self._ui)._btn_UnSealTent):addInputEvent("Mouse_LUp", "PaGlobal_Camp:unSealTent()")
  end
end

-- DECOMPILER ERROR at PC203: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.tooltipShow = function(self, isShow)
  -- function num : 0_14
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_TOOLTIP_TITLE")
    local desc = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_TOOLTIP_DESC")
    TooltipSimple_Show(self._btn_Camp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

-- DECOMPILER ERROR at PC206: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.guideTooltipShow = function(self, isShow)
  -- function num : 0_15
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_GUIDETOOLTIP_TITLE")
    local desc = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_GUIDETOOLTIP_DESC")
    TooltipSimple_Show((self._ui)._guideIcon, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

-- DECOMPILER ERROR at PC209: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.equipItemTooltipShow = function(self, slotNo, isShow)
  -- function num : 0_16
  local slot = (self._itemSlots)[slotNo]
  Panel_Tooltip_Item_SetPosition(slotNo, slot, "CampEquip")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "CampEquip", isShow)
end

-- DECOMPILER ERROR at PC212: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.getActorKeyRaw = function(self)
  -- function num : 0_17
  local self = PaGlobal_Camp
  return self._actorKeyRaw
end

-- DECOMPILER ERROR at PC215: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.setPos = function(self)
  -- function num : 0_18
  local posX = 0
  local posY = 0
  if Panel_Icon_Duel:GetShow() then
    posX = Panel_Icon_Duel:GetPosX() + Panel_Icon_Duel:GetSizeX() - 3
    posY = Panel_Icon_Duel:GetPosY()
  else
    if Panel_Icon_Maid:GetShow() then
      posX = Panel_Icon_Maid:GetPosX() + Panel_Icon_Maid:GetSizeX() - 3
      posY = Panel_Icon_Maid:GetPosY()
    else
      if Panel_Window_PetIcon:GetShow() then
        posX = Panel_Window_PetIcon:GetPosX() + Panel_Window_PetIcon:GetSizeX() - 3
        posY = Panel_Window_PetIcon:GetPosY()
      else
        if FGlobal_HouseIconCount() > 0 and Panel_MyHouseNavi:GetShow() then
          posX = Panel_MyHouseNavi:GetPosX() + 60 * FGlobal_HouseIconCount() - 3
          posY = Panel_MyHouseNavi:GetPosY()
        else
          if FGlobal_ServantIconCount() > 0 and Panel_Window_Servant:GetShow() then
            posX = Panel_Window_Servant:GetPosX() + 60 * FGlobal_ServantIconCount() - 3
            posY = Panel_Window_Servant:GetPosY()
          else
            posX = 0
            posY = Panel_SelfPlayerExpGage:GetPosY() + Panel_SelfPlayerExpGage:GetSizeY() + 15
          end
        end
      end
    end
  end
  Panel_Icon_Camp:SetPosX(posX)
  Panel_Icon_Camp:SetPosY(posY)
  PaGlobal_PossessByBlackSpiritIcon:setPosIcon()
end

-- DECOMPILER ERROR at PC218: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.register = function(self)
  -- function num : 0_19
  FGlobal_CampRegister_Open()
end

-- DECOMPILER ERROR at PC221: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.slotRClick = function(self, slotNo)
  -- function num : 0_20
  local self = PaGlobal_Camp
  local campWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if campWrapper == nil then
    return 
  end
  local itemWrapper = campWrapper:getEquipItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  if slotNo == 3 and Panel_Window_ServantInventory:GetShow() then
    return 
  end
  if slotNo == 4 and Panel_Window_Repair:GetShow() then
    return 
  end
  if slotNo == 5 and Panel_Window_NpcShop:GetShow() then
    return 
  end
  servant_doUnequip(campWrapper:getActorKeyRaw(), slotNo)
end

EventServantEquipItem = function(slotNo)
  -- function num : 0_21
  PaGlobal_Camp:changeEquipItem(slotNo)
end

-- DECOMPILER ERROR at PC226: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.changeEquipItem = function(self, slotNo)
  -- function num : 0_22
  if slotNo == 4 or slotNo == 5 or slotNo == 6 then
    local self = PaGlobal_Camp
    local slot = (self._itemSlots)[slotNo]
    if slot == nil then
      return 
    end
    if self._actorKeyRaw == nil then
      return 
    end
    local campWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
    if campWrapper == nil then
      return 
    end
    ;
    (slot.icon):AddEffect("UI_ItemInstall", false, 0, 0)
    ;
    (slot.icon):AddEffect("fUI_SkillButton01", false, 0, 0)
    local itemWrapper = campWrapper:getEquipItem(slotNo + 1)
    if itemWrapper == nil then
      return 
    end
  end
end

-- DECOMPILER ERROR at PC229: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.getIsCamping = function(self)
  -- function num : 0_23
  return PaGlobal_Camp._isCamping
end

-- DECOMPILER ERROR at PC232: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.setIsCamping = function(self, isCamping)
  -- function num : 0_24
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  PaGlobal_Camp._isCamping = isCamping
end

FromClient_InitializeCamp = function()
  -- function num : 0_25
  local isShow = ToClient_isCampingReigsted()
  Panel_Icon_Camp:SetShow(isShow)
end

-- DECOMPILER ERROR at PC237: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.isUnsealShow = function(self, isShow)
  -- function num : 0_26
  for index,value in pairs((self._config)._slotNo) do
    (((self._ui)._slotBg)[value]):SetShow(isShow)
  end
  ;
  ((self._ui)._txtTitle):SetShow(isShow)
  ;
  ((self._ui)._btn_ShopOpen):SetShow(isShow)
  ;
  ((self._ui)._btn_Repair):SetShow(isShow)
  ;
  ((self._ui)._btn_InvenOpen):SetShow(isShow)
  ;
  ((self._ui)._contentBG):SetShow(isShow)
end

-- DECOMPILER ERROR at PC240: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.setBtnPos = function(self)
  -- function num : 0_27
  local isUnseal = ToClient_isCampingUnseal()
  PaGlobal_Camp:isUnsealShow(isUnseal)
  if isUnseal == false then
    Panel_Window_Camp:SetSize(Panel_Window_Camp:GetSizeX(), self._panelSizeY - 180)
    ;
    ((self._ui)._titleBG):SetSize(((self._ui)._titleBG):GetSizeX(), self._panelSizeY - 244)
    ;
    ((self._ui)._btn_UnSealTent):SetSpanSize(((self._ui)._btn_UnSealTent):GetPosX() / 2 - 24, 20)
  else
    Panel_Window_Camp:SetSize(Panel_Window_Camp:GetSizeX(), self._panelSizeY)
    ;
    ((self._ui)._titleBG):SetSize(((self._ui)._titleBG):GetSizeX(), self._panelSizeY - 64)
  end
  self._btnCount = 0
  for index,value in pairs((self._config)._slotNo) do
    local btn = nil
    if value == 3 then
      btn = (self._ui)._btn_InvenOpen
    else
      if value == 4 then
        btn = (self._ui)._btn_Repair
      else
        if value == 5 then
          btn = (self._ui)._btn_ShopOpen
        else
          if value == 6 then
            btn = nil
          end
        end
      end
    end
    if btn ~= nil then
      if isUnseal == false then
        do
          (((self._ui)._slotBg)[value]):SetPosY(self._defaultSlotPosY + 55 * self._btnCount)
          btn:SetPosY(self._defaultBtnPosY + 55 * self._btnCount)
          ;
          ((self._ui)._contentBG):SetSize(((self._ui)._contentBG):GetSizeX(), 55 * (self._btnCount + 1) + 5)
          ;
          ((self._ui)._titleBG):SetSize(((self._ui)._titleBG):GetSizeX(), 190 + 55 * (self._btnCount + 1) + 5)
          Panel_Window_Camp:SetSize(Panel_Window_Camp:GetSizeX(), 290 + 55 * (self._btnCount + 1) + 5)
          ;
          ((self._ui)._btn_Seal):SetPosY(Panel_Window_Camp:GetSizeY() - ((self._ui)._btn_Seal):GetSizeY() - 13)
          ;
          ((self._ui)._btn_RemoteSeal):SetPosY(Panel_Window_Camp:GetSizeY() - ((self._ui)._btn_RemoteSeal):GetSizeY() - 13)
          self._btnCount = self._btnCount + 1
          -- DECOMPILER ERROR at PC165: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC165: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC165: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC165: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

FromClient_CampingTentSeal = function()
  -- function num : 0_28
  PaGlobal_Camp:close()
end

-- DECOMPILER ERROR at PC245: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.registMessageHandler = function(self)
  -- function num : 0_29
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_Camp:close()")
  ;
  (self._btn_Camp):addInputEvent("Mouse_LUp", "PaGlobal_Camp:open()")
  ;
  (self._btn_Camp):addInputEvent("Mouse_RUp", "PaGlobal_Camp:navi()")
  ;
  (self._btn_Camp):addInputEvent("Mouse_On", "PaGlobal_Camp:tooltipShow( true )")
  ;
  (self._btn_Camp):addInputEvent("Mouse_Out", "PaGlobal_Camp:tooltipShow( false )")
  ;
  ((self._ui)._btn_Repair):addInputEvent("Mouse_LUp", "PaGlobal_Camp:functionOpen(" .. 4 .. ")")
  ;
  ((self._ui)._btn_InvenOpen):addInputEvent("Mouse_LUp", "PaGlobal_Camp:functionOpen(" .. 3 .. ")")
  ;
  ((self._ui)._btn_ShopOpen):addInputEvent("Mouse_LUp", "PaGlobal_Camp:functionOpen(" .. 5 .. ")")
  ;
  ((self._ui)._guideIcon):addInputEvent("Mouse_On", "PaGlobal_Camp:guideTooltipShow( true )")
  ;
  ((self._ui)._guideIcon):addInputEvent("Mouse_Out", "PaGlobal_Camp:guideTooltipShow( false )")
  registerEvent("FromClient_OpenCampingRepair", "FromClient_OpenCampingRepair")
  registerEvent("FromClient_OpenCampingShop", "FromClient_OpenCampingShop")
  registerEvent("FromClient_OpenCampingInfo", "FromClient_Camp_OpenByActorKeyRaw")
  registerEvent("EventServantEquipItem", "EventServantEquipItem")
  registerEvent("EventServantEquipmentUpdate", "FromClient_CampingUpdate")
  registerEvent("FromClient_CampingTentSeal", "FromClient_CampingTentSeal")
  registerEvent("FromClient_CampingTentUnSeal", "FromClient_CampingUpdate")
  registerEvent("FromClient_InitializeCamp", "FromClient_InitializeCamp")
end

PaGlobal_Camp:initialize()
PaGlobal_Camp:registMessageHandler()

