-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\camp\panel_window_camp.luac 

-- params : ...
-- function num : 0
Panel_Window_Camp:SetShow(false)
Panel_Window_Camp:setGlassBackground(true)
Panel_Window_Camp:ActiveMouseEventEffect(true)
Panel_Icon_Camp:ActiveMouseEventEffect(true)
PaGlobal_Camp = {
_ui = {_btn_UnSealTent = (UI.getChildControl)(Panel_Window_Camp, "Button_UnsealTent"), _btn_InvenOpen = (UI.getChildControl)(Panel_Window_Camp, "Button_Warehouse"), _btn_Repair = (UI.getChildControl)(Panel_Window_Camp, "Button_Repair"), _btn_ShopOpen = (UI.getChildControl)(Panel_Window_Camp, "Button_Shop"), _btn_Close = (UI.getChildControl)(Panel_Window_Camp, "Button_Win_Close"), _btn_Seal = (UI.getChildControl)(Panel_Window_Camp, "Button_SealTent"), _btn_RemoteSeal = (UI.getChildControl)(Panel_Window_Camp, "Button_RemoteSealTent"), _guideIcon = (UI.getChildControl)(Panel_Window_Camp, "Static_GuideIcon"), 
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
, _btn_Camp = (UI.getChildControl)(Panel_Icon_Camp, "Button_CampIcon"), _itemSlots = (Array.new)(), _actorKeyRaw = nil, _isCamping = false}
-- DECOMPILER ERROR at PC128: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_Initialize = function(self)
  -- function num : 0_0
  FGlobal_Camp_SetPos()
  local isShow = ToClient_isCampingReigsted()
  Panel_Icon_Camp:SetShow(isShow)
  for index,value in pairs((self._config)._slotNo) do
    local slot = {}
    ;
    (SlotItem.new)(slot, "CampEquip_" .. value, value, ((self._ui)._slotBg)[value], (self._config)._itemSlot)
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "PaGlobal_Camp:Camp_RClick(" .. value .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "PaGlobal_Camp:Camp_EquipItemTooltipShow(" .. value .. ", true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "PaGlobal_Camp:Camp_EquipItemTooltipShow(" .. value .. ", false)")
    -- DECOMPILER ERROR at PC54: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._itemSlots)[value] = slot
  end
  ;
  (self._btn_Camp):ActiveMouseEventEffect(true)
end

-- DECOMPILER ERROR at PC131: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_Open = function(self)
  -- function num : 0_1
  ToClient_openCampingInfo()
end

FGlobal_Camp_Close = function()
  -- function num : 0_2
  PaGlobal_Camp:Camp_Close()
  if Panel_Window_Inventory:GetShow() then
    Inventory_ShowToggle()
    handleClickedNpcShow_WindowClose()
  end
end

-- DECOMPILER ERROR at PC136: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_Close = function(self)
  -- function num : 0_3
  Panel_Window_Camp:SetShow(false)
  self._isCamping = false
end

FromClient_Camp_OpenByActorKeyRaw = function(actorKeyRaw)
  -- function num : 0_4
  PaGlobal_Camp:Camp_OpenByActorKeyRaw(actorKeyRaw)
  if Panel_Window_Camp:GetShow() then
    FGlobal_Camp_Close()
    return 
  end
  if Panel_Window_Inventory:GetShow() == false then
    Inventory_ShowToggle()
  end
  FGlobal_Camp_SetPos()
  Panel_Window_Camp:SetShow(true)
  PaGlobal_Camp:Camp_Update()
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  self._isCamping = true
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_OpenByActorKeyRaw = function(self, actorKeyRaw)
  -- function num : 0_5
  self._actorKeyRaw = actorKeyRaw
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_SealTent = function(self)
  -- function num : 0_6
  ToClient_requestServantSealCampingTent()
  FGlobal_Camp_Close()
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_UnSealTent = function(self)
  -- function num : 0_7
  ToClient_requestServantUnsealCampingTent(0)
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_FunctionOpen = function(self, slotIndex)
  -- function num : 0_8
  local isSetItem = ((self._config)._isSetItem)[slotIndex]
  if isSetItem then
    if slotIndex == 3 then
      ToClient_requestCampingInventoryOpen()
      PaGlobal_Camp:Camp_Close()
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

-- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_RemoteSeal = function(self)
  -- function num : 0_9
  local FunctionYesRemoteSeal = function()
    -- function num : 0_9_0
    ToClient_requestServantCompulsionSealCampingTent()
    FGlobal_Camp_Close()
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
  PaGlobal_Camp:Camp_Update()
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_Update = function(self)
  -- function num : 0_13
  local isUnseal = ToClient_isCampingUnseal()
  for index,value in pairs((self._config)._slotNo) do
    local slot = (self._itemSlots)[value]
    local campWrapper = getServantInfoFromActorKey(self._actorKeyRaw)
    if campWrapper ~= nil then
      local itemWrapper = campWrapper:getEquipItem(value)
      -- DECOMPILER ERROR at PC23: Confused about usage of register: R10 in 'UnsetPending'

      if isUnseal then
        if itemWrapper ~= nil then
          ((self._config)._isSetItem)[value] = true
          slot:setItem(itemWrapper)
        else
          -- DECOMPILER ERROR at PC30: Confused about usage of register: R10 in 'UnsetPending'

          ;
          ((self._config)._isSetItem)[value] = false
          slot:clearItem()
        end
      else
        -- DECOMPILER ERROR at PC36: Confused about usage of register: R10 in 'UnsetPending'

        ;
        ((self._config)._isSetItem)[value] = false
        slot:clearItem()
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
    ((self._ui)._btn_Seal):addInputEvent("Mouse_LUp", "PaGlobal_Camp:Camp_SealTent()")
    ;
    ((self._ui)._btn_RemoteSeal):addInputEvent("Mouse_LUp", "PaGlobal_Camp:Camp_RemoteSeal()")
  else
    ;
    ((self._ui)._btn_UnSealTent):SetShow(true)
    ;
    ((self._ui)._btn_Seal):SetShow(false)
    ;
    ((self._ui)._btn_RemoteSeal):SetShow(false)
    ;
    ((self._ui)._btn_UnSealTent):addInputEvent("Mouse_LUp", "PaGlobal_Camp:Camp_UnSealTent()")
  end
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_TooltipShow = function(self, isShow)
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

-- DECOMPILER ERROR at PC168: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.GuideTooltipShow = function(self, isShow)
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

-- DECOMPILER ERROR at PC171: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_EquipItemTooltipShow = function(self, slotNo, isShow)
  -- function num : 0_16
  local slot = (self._itemSlots)[slotNo]
  Panel_Tooltip_Item_SetPosition(slotNo, slot, "CampEquip")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "CampEquip", isShow)
end

FGlobal_Camp_GetActorKeyRaw = function()
  -- function num : 0_17
  local self = PaGlobal_Camp
  return self._actorKeyRaw
end

FGlobal_Camp_SetPos = function()
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
end

-- DECOMPILER ERROR at PC178: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_Register = function(self)
  -- function num : 0_19
  FGlobal_CampRegister_Open()
end

-- DECOMPILER ERROR at PC181: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_RClick = function(self, slotNo)
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

CampInfo_ChangeEquipItem = function(slotNo)
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

FGlobal_IsCamping = function()
  -- function num : 0_22
  return PaGlobal_Camp._isCamping
end

FGlobal_SetIsCamping = function()
  -- function num : 0_23
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Camp._isCamping = false
end

FromClient_InitializeCamp = function()
  -- function num : 0_24
  local isShow = ToClient_isCampingReigsted()
  Panel_Icon_Camp:SetShow(isShow)
end

-- DECOMPILER ERROR at PC192: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Camp.Camp_registMessageHandler = function(self)
  -- function num : 0_25
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_Camp_Close()")
  ;
  (self._btn_Camp):addInputEvent("Mouse_LUp", "PaGlobal_Camp:Camp_Open()")
  ;
  (self._btn_Camp):addInputEvent("Mouse_On", "PaGlobal_Camp:Camp_TooltipShow( true )")
  ;
  (self._btn_Camp):addInputEvent("Mouse_Out", "PaGlobal_Camp:Camp_TooltipShow( false )")
  ;
  ((self._ui)._btn_Repair):addInputEvent("Mouse_LUp", "PaGlobal_Camp:Camp_FunctionOpen(" .. 4 .. ")")
  ;
  ((self._ui)._btn_InvenOpen):addInputEvent("Mouse_LUp", "PaGlobal_Camp:Camp_FunctionOpen(" .. 3 .. ")")
  ;
  ((self._ui)._btn_ShopOpen):addInputEvent("Mouse_LUp", "PaGlobal_Camp:Camp_FunctionOpen(" .. 5 .. ")")
  ;
  ((self._ui)._guideIcon):addInputEvent("Mouse_On", "PaGlobal_Camp:GuideTooltipShow( true )")
  ;
  ((self._ui)._guideIcon):addInputEvent("Mouse_Out", "PaGlobal_Camp:GuideTooltipShow( false )")
  registerEvent("FromClient_OpenCampingRepair", "FromClient_OpenCampingRepair")
  registerEvent("FromClient_OpenCampingShop", "FromClient_OpenCampingShop")
  registerEvent("FromClient_OpenCampingInfo", "FromClient_Camp_OpenByActorKeyRaw")
  registerEvent("EventServantEquipItem", "CampInfo_ChangeEquipItem")
  registerEvent("EventServantEquipmentUpdate", "FromClient_CampingUpdate")
  registerEvent("FromClient_CampingTentSeal", "FromClient_CampingUpdate")
  registerEvent("FromClient_CampingTentUnSeal", "FromClient_CampingUpdate")
  registerEvent("FromClient_CampingTentUnSeal", "FromClient_CampingUpdate")
  registerEvent("FromClient_InitializeCamp", "FromClient_InitializeCamp")
end

PaGlobal_Camp:Camp_Initialize()
PaGlobal_Camp:Camp_registMessageHandler()

