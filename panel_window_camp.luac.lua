-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\camp\panel_window_camp.luac 

-- params : ...
-- function num : 0
Panel_Window_Camp:SetShow(false)
Panel_Window_Camp:setGlassBackground(true)
Panel_Window_Camp:ActiveMouseEventEffect(true)
Panel_Icon_Camp:ActiveMouseEventEffect(true)
PaGlobal_Camp = {
_ui = {_btn_UnSealTent = (UI.getChildControl)(Panel_Window_Camp, "Button_UnsealTent"), _btn_InvenOpen = (UI.getChildControl)(Panel_Window_Camp, "Button_Warehouse"), _btn_Repair = (UI.getChildControl)(Panel_Window_Camp, "Button_Repair"), _btn_ShopOpen = (UI.getChildControl)(Panel_Window_Camp, "Button_Shop"), _btn_Close = (UI.getChildControl)(Panel_Window_Camp, "Button_Win_Close"), _btn_Seal = (UI.getChildControl)(Panel_Window_Camp, "Button_SealTent"), _btn_RemoteSeal = (UI.getChildControl)(Panel_Window_Camp, "Button_RemoteSealTent"), _guideIcon = (UI.getChildControl)(Panel_Window_Camp, "Static_GuideIcon"), _txtTitle = (UI.getChildControl)(Panel_Window_Camp, "Static_Panel_Camp_Tent_Title"), _titleBG = (UI.getChildControl)(Panel_Window_Camp, "Static_Panel_Camp_TitleBG"), _contentBG = (UI.getChildControl)(Panel_Window_Camp, "Static_Panel_Camp_Tent_Content_Bg"), 
_slotBg = {[3] = (UI.getChildControl)(Panel_Window_Camp, "Static_ItemSlotBg_Warehouse"), [4] = (UI.getChildControl)(Panel_Window_Camp, "Static_ItemSlotBg_Repair"), [5] = (UI.getChildControl)(Panel_Window_Camp, "Static_ItemSlotBg_Shop")}
}
, 
_config = {
_itemSlot = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true, createEnduranceIcon = true}
, 
_slotNo = {3, 4, 5}
, 
_slotID = {[3] = "Static_Icon_CampInven", [4] = "Static_Icon_CampRepair", [5] = "Static_Icon_CampShop"}
, 
_isSetItem = {[3] = false, [4] = false, [5] = false}
}
, _btn_Camp = (UI.getChildControl)(Panel_Icon_Camp, "Button_CampIcon"), _itemSlots = (Array.new)(), _actorKeyRaw = nil, _isCamping = false, _panelSizeY = 0, _isOpen = false}
-- DECOMPILER ERROR at PC148: Confused about usage of register: R0 in 'UnsetPending'

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
end

-- DECOMPILER ERROR at PC151: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.open = function(self)
  -- function num : 0_1
  ToClient_openCampingInfo()
end

-- DECOMPILER ERROR at PC154: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.close = function(self)
  -- function num : 0_2
  Panel_Window_Camp:SetShow(false)
  self._isCamping = false
  if Panel_Window_Inventory:GetShow() then
    Inventory_ShowToggle()
    handleClickedNpcShow_WindowClose()
  end
end

FromClient_Camp_OpenByActorKeyRaw = function(actorKeyRaw)
  -- function num : 0_3
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
  PaGlobal_Camp:resizeSet()
  Panel_Window_Camp:SetShow(true)
  PaGlobal_Camp:update()
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Camp._isCamping = true
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.openByActorKeyRaw = function(self, actorKeyRaw)
  -- function num : 0_4
  self._actorKeyRaw = actorKeyRaw
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.sealTent = function(self)
  -- function num : 0_5
  ToClient_requestServantSealCampingTent()
  PaGlobal_Camp:close()
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.unSealTent = function(self)
  -- function num : 0_6
  ToClient_requestServantUnsealCampingTent(0)
  self._isOpen = true
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.functionOpen = function(self, slotIndex)
  -- function num : 0_7
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

-- DECOMPILER ERROR at PC171: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.remoteSeal = function(self)
  -- function num : 0_8
  local FunctionYesRemoteSeal = function()
    -- function num : 0_8_0
    ToClient_requestServantCompulsionSealCampingTent()
    PaGlobal_Camp:close()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_REMOTERESET_DESC")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_CAMP_REMOTERESET_TITLE"), content = messageBoxMemo, functionYes = FunctionYesRemoteSeal, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FromClient_OpenCampingRepair = function()
  -- function num : 0_9
  PaGlobal_Repair:repair_OpenPanel(true)
end

FromClient_OpenCampingShop = function()
  -- function num : 0_10
  NpcShop_UpdateContent()
end

FromClient_CampingUpdate = function()
  -- function num : 0_11
  PaGlobal_Camp:update()
end

-- DECOMPILER ERROR at PC180: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.update = function(self)
  -- function num : 0_12
  local isUnseal = ToClient_isCampingUnseal()
  for index,value in pairs((self._config)._slotNo) do
    local slot = (self._itemSlots)[value]
    local campWrapper = nil
    if isUnseal then
      campWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
    end
    if campWrapper ~= nil then
      local itemWrapper = campWrapper:getEquipItem(value)
      -- DECOMPILER ERROR at PC27: Confused about usage of register: R10 in 'UnsetPending'

      if isUnseal then
        if itemWrapper ~= nil then
          ((self._config)._isSetItem)[value] = true
          slot:setItem(itemWrapper)
        else
          -- DECOMPILER ERROR at PC34: Confused about usage of register: R10 in 'UnsetPending'

          ;
          ((self._config)._isSetItem)[value] = false
          slot:clearItem()
        end
      end
    else
      do
        do
          -- DECOMPILER ERROR at PC40: Confused about usage of register: R9 in 'UnsetPending'

          ;
          ((self._config)._isSetItem)[value] = false
          slot:clearItem()
          -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_STMT

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
    ((self._ui)._btn_Seal):addInputEvent("Mouse_LUp", "PaGlobal_Camp:sealTent()")
    ;
    ((self._ui)._btn_RemoteSeal):addInputEvent("Mouse_LUp", "PaGlobal_Camp:remoteSeal()")
  else
    ;
    ((self._ui)._btn_UnSealTent):SetShow(true)
    ;
    ((self._ui)._btn_Seal):SetShow(false)
    ;
    ((self._ui)._btn_RemoteSeal):SetShow(false)
    ;
    ((self._ui)._btn_UnSealTent):addInputEvent("Mouse_LUp", "PaGlobal_Camp:unSealTent()")
  end
end

-- DECOMPILER ERROR at PC183: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.tooltipShow = function(self, isShow)
  -- function num : 0_13
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

-- DECOMPILER ERROR at PC186: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.guideTooltipShow = function(self, isShow)
  -- function num : 0_14
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

-- DECOMPILER ERROR at PC189: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.equipItemTooltipShow = function(self, slotNo, isShow)
  -- function num : 0_15
  local slot = (self._itemSlots)[slotNo]
  Panel_Tooltip_Item_SetPosition(slotNo, slot, "CampEquip")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "CampEquip", isShow)
end

-- DECOMPILER ERROR at PC192: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.getActorKeyRaw = function(self)
  -- function num : 0_16
  local self = PaGlobal_Camp
  return self._actorKeyRaw
end

-- DECOMPILER ERROR at PC195: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.setPos = function(self)
  -- function num : 0_17
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
end

-- DECOMPILER ERROR at PC198: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.register = function(self)
  -- function num : 0_18
  FGlobal_CampRegister_Open()
end

-- DECOMPILER ERROR at PC201: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.slotRClick = function(self, slotNo)
  -- function num : 0_19
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
  -- function num : 0_20
  PaGlobal_Camp:changeEquipItem(slotNo)
end

-- DECOMPILER ERROR at PC206: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.changeEquipItem = function(self, slotNo)
  -- function num : 0_21
  local self = PaGlobal_Camp
  local slot = (self._itemSlots)[slotNo]
  if self._actorKeyRaw == nil then
    return 
  end
  local campWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
  if campWrapper == nil then
    return 
  end
  if ((self._config)._isSetItem)[slotNo] == false then
    (slot.icon):AddEffect("UI_ItemInstall", false, 0, 0)
    ;
    (slot.icon):AddEffect("fUI_SkillButton01", false, 0, 0)
  end
  local itemWrapper = campWrapper:getEquipItem(slotNo + 1)
  if itemWrapper == nil then
    return 
  end
end

-- DECOMPILER ERROR at PC209: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.getIsCamping = function(self)
  -- function num : 0_22
  return PaGlobal_Camp._isCamping
end

-- DECOMPILER ERROR at PC212: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.setIsCamping = function(self)
  -- function num : 0_23
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  PaGlobal_Camp._isCamping = false
end

FromClient_InitializeCamp = function()
  -- function num : 0_24
  local isShow = ToClient_isCampingReigsted()
  Panel_Icon_Camp:SetShow(isShow)
end

-- DECOMPILER ERROR at PC217: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.resizeSet = function(self)
  -- function num : 0_25
  local isUnseal = ToClient_isCampingUnseal()
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
  PaGlobal_Camp:isUnsealShow(isUnseal)
end

-- DECOMPILER ERROR at PC220: Confused about usage of register: R0 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC223: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.registMessageHandler = function(self)
  -- function num : 0_27
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_Camp:close()")
  ;
  (self._btn_Camp):addInputEvent("Mouse_LUp", "PaGlobal_Camp:open()")
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
  registerEvent("FromClient_CampingTentSeal", "FromClient_CampingUpdate")
  registerEvent("FromClient_CampingTentUnSeal", "FromClient_CampingUpdate")
  registerEvent("FromClient_InitializeCamp", "FromClient_InitializeCamp")
end

PaGlobal_Camp:initialize()
PaGlobal_Camp:registMessageHandler()

