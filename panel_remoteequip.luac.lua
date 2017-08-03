-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\remotecontrol\panel_remoteequip.luac 

-- params : ...
-- function num : 0
Panel_RemoteEquipment:SetShow(false)
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local remoteEquip = {
normalEquipSlotBg = {}
, 
normalEquipSlot = {}
, 
cashEquipSlotBg = {}
, 
cashEquipSlot = {}
, normalEquipCount = 16, cashEquipCount = 11, 
config = {createBorder = true, createIcon = true, createRemoteEnchant = true, createCash = true, createExpirationBG = true, createExpiration2h = true}
, equipNoMin = (CppEnums.EquipSlotNo).rightHand, EquipNoMax = (CppEnums.EquipSlotNo).equipSlotNoCount, attackValue = (UI.getChildControl)(Panel_RemoteEquipment, "StaticText_AttackValue"), deffenceValue = (UI.getChildControl)(Panel_RemoteEquipment, "StaticText_DefenceValue"), awakenValue = (UI.getChildControl)(Panel_RemoteEquipment, "StaticText_AwakenValue")}
local remoteEquipSlotId = {
normal = {[1] = 6, [2] = 0, [3] = 29, [4] = 1, [5] = 10, [6] = 3, [7] = 4, [8] = 5, [9] = 12, [10] = 11, [11] = 7, [12] = 8, [13] = 9, [14] = 27, [15] = 13, [16] = 2}
, 
cash = {[1] = 17, [2] = 14, [3] = 15, [4] = 16, [5] = 18, [6] = 20, [7] = 19, [8] = 30, [9] = 21, [10] = 22, [11] = 23}
}
remoteEquip.Init = function(self)
  -- function num : 0_0
  for index = 1, self.normalEquipCount do
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R5 in 'UnsetPending'

    (self.normalEquipSlotBg)[index] = (UI.getChildControl)(Panel_RemoteEquipment, "Static_SlotBG" .. index)
    local slot = {}
    ;
    (SlotItem.new)(slot, "RemoteEquipNormalIcon_" .. index, index, (self.normalEquipSlotBg)[index], self.config)
    ;
    (slot.icon):SetSize(((self.normalEquipSlotBg)[index]):GetSizeX() - 2, ((self.normalEquipSlotBg)[index]):GetSizeY() - 2)
    ;
    (slot.icon):SetPosX(1)
    ;
    (slot.icon):SetPosY(1)
    slot:createChild()
    ;
    (slot.border):SetSize(((self.normalEquipSlotBg)[index]):GetSizeX(), ((self.normalEquipSlotBg)[index]):GetSizeY())
    ;
    (slot.expiration2h):SetSize(((self.normalEquipSlotBg)[index]):GetSizeX(), ((self.normalEquipSlotBg)[index]):GetSizeY())
    ;
    (slot.expirationBG):SetSize(((self.normalEquipSlotBg)[index]):GetSizeX(), ((self.normalEquipSlotBg)[index]):GetSizeY())
    ;
    (slot.remoteEnchantText):SetSize(((self.normalEquipSlotBg)[index]):GetSizeX() - 2, ((self.normalEquipSlotBg)[index]):GetSizeY() - 2)
    -- DECOMPILER ERROR at PC95: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.normalEquipSlot)[index] = slot
  end
  for index = 1, self.cashEquipCount do
    -- DECOMPILER ERROR at PC109: Confused about usage of register: R5 in 'UnsetPending'

    (self.cashEquipSlotBg)[index] = (UI.getChildControl)(Panel_RemoteEquipment, "Static_CashSlotBG" .. index)
    local slot = {}
    ;
    (SlotItem.new)(slot, "RemoteEquipNormalIcon_" .. index, index, (self.cashEquipSlotBg)[index], self.config)
    ;
    (slot.icon):SetSize(((self.cashEquipSlotBg)[index]):GetSizeX() - 2, ((self.cashEquipSlotBg)[index]):GetSizeY() - 2)
    ;
    (slot.icon):SetPosX(1)
    ;
    (slot.icon):SetPosY(1)
    slot:createChild()
    ;
    (slot.border):SetSize(((self.cashEquipSlotBg)[index]):GetSizeX(), ((self.cashEquipSlotBg)[index]):GetSizeY())
    ;
    (slot.expiration2h):SetSize(((self.cashEquipSlotBg)[index]):GetSizeX(), ((self.cashEquipSlotBg)[index]):GetSizeY())
    ;
    (slot.expirationBG):SetSize(((self.cashEquipSlotBg)[index]):GetSizeX(), ((self.cashEquipSlotBg)[index]):GetSizeY())
    ;
    (slot.remoteEnchantText):SetSize(((self.cashEquipSlotBg)[index]):GetSizeX() - 2, ((self.cashEquipSlotBg)[index]):GetSizeY() - 2)
    ;
    (slot.isCash):SetSize(70, 70)
    ;
    (slot.isCash):SetPosX(1)
    ;
    (slot.isCash):SetPosY(1)
    -- DECOMPILER ERROR at PC205: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.cashEquipSlot)[index] = slot
  end
end

remoteEquip.Update = function(self)
  -- function num : 0_1 , upvalues : remoteEquipSlotId
  for index = 1, #remoteEquipSlotId.normal do
    local itemWrapper = getEquipmentItem((remoteEquipSlotId.normal)[index])
    if itemWrapper ~= nil then
      local slot = (self.normalEquipSlot)[index]
      slot:setItem(itemWrapper)
      ;
      (slot.icon):addInputEvent("Mouse_LUp", "RemoteEquip_Unequip(" .. index .. ", false )")
      ;
      (slot.icon):addInputEvent("Mouse_RUp", "RemoteEquip_Unequip(" .. index .. ", false )")
    else
      do
        do
          local slot = (self.normalEquipSlot)[index]
          slot:clearItem()
          -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  for index = 1, #remoteEquipSlotId.cash do
    local itemWrapper = getEquipmentItem((remoteEquipSlotId.cash)[index])
    if itemWrapper ~= nil then
      local slot = (self.cashEquipSlot)[index]
      slot:setItem(itemWrapper)
      ;
      (slot.icon):addInputEvent("Mouse_LUp", "RemoteEquip_Unequip(" .. index .. ", true )")
      ;
      (slot.icon):addInputEvent("Mouse_RUp", "RemoteEquip_Unequip(" .. index .. ", true )")
    else
      do
        do
          local slot = (self.cashEquipSlot)[index]
          slot:clearItem()
          -- DECOMPILER ERROR at PC79: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC79: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC79: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  RemoteEquip_UpdateStat()
end

RemoteEquip_Unequip = function(index, isCash)
  -- function num : 0_2 , upvalues : remoteEquipSlotId
  local slotNo = nil
  if isCash then
    slotNo = (remoteEquipSlotId.cash)[index]
  else
    slotNo = (remoteEquipSlotId.normal)[index]
  end
  local itemWrapper = getEquipmentItem(slotNo)
  if itemWrapper ~= nil then
    equipmentDoUnequip(slotNo)
  end
end

remoteEquip.Open = function(self)
  -- function num : 0_3
  self:Update()
  Panel_RemoteEquipment:SetShow(true)
  Panel_RemoteEquipment:SetPosX(Panel_RemoteInventory:GetPosX() - Panel_RemoteEquipment:GetSizeX() - 10)
  Panel_RemoteEquipment:SetPosY(getScreenSizeY() / 2 - Panel_RemoteEquipment:GetSizeY() / 2)
end

remoteEquip.Close = function(self)
  -- function num : 0_4
  Panel_RemoteEquipment:SetShow(false)
end

FGlobal_RemoteEquip_ShowToggle = function()
  -- function num : 0_5 , upvalues : remoteEquip
  if Panel_RemoteEquipment:GetShow() then
    remoteEquip:Close()
  else
    remoteEquip:Open()
  end
end

RemoteEquip_UpdateSlot = function()
  -- function num : 0_6 , upvalues : remoteEquip
  remoteEquip:Update()
end

RemoteEquip_UpdateStat = function()
  -- function num : 0_7 , upvalues : remoteEquip
  local self = remoteEquip
  local attackValue = getOffence()
  local deffenceValue = getDefence()
  local awakenValue = getAwakenOffence()
  ;
  (self.attackValue):SetText("공격�\165 : " .. attackValue)
  ;
  (self.deffenceValue):SetText("방어�\165 : " .. deffenceValue)
  ;
  (self.awakenValue):SetText("각성무기 공격�\165 : " .. awakenValue)
  local isSetAwakenWeapon = getEquipmentItem((CppEnums.EquipSlotNo).awakenWeapon)
  if isSetAwakenWeapon ~= nil then
    (self.awakenValue):SetShow(true)
  else
    ;
    (self.awakenValue):SetShow(false)
  end
end

remoteEquip:Init()
remoteEquip:Update()
registerEvent("EventEquipmentUpdate", "RemoteEquip_UpdateSlot")

