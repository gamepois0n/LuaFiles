-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\equipment\panel_window_servant_equipment.luac 

-- params : ...
-- function num : 0
Panel_ServantEquipment:ActiveMouseEventEffect(true)
Panel_ServantEquipment:setGlassBackground(true)
Panel_ServantEquipment:RegisterShowEventFunc(true, "ServantEquipment_ShowAni()")
Panel_ServantEquipment:RegisterShowEventFunc(false, "ServantEquipment_HideAni()")
local UI_color = Defines.Color
local servantEquip = {
slotConfig = {createIcon = false, createBorder = true, createCount = true, createCash = true}
, 
slotNoDef = {rightHand = 0, leftHand = 1, chest = 4, pants = 5, glove = 6, boots = 7, helm = 8, shoulder = 9, necklace = 10, ring1 = 11, ring2 = 12, earing1 = 13, earing2 = 14, belt = 15, lantern = 16, avatarChest = 17, avatarPants = 18, avatarGlove = 19, avatarBoots = 20, avatarShoulder = 21, avatarWeapon = 22, avatarSubWeapon = 23}
, 
slotNoId = {[0] = "Static_Slot_RightHand", [1] = "Static_Slot_LeftHand", [4] = "Static_Slot_Chest", [5] = "Static_Slot_Pants", [6] = "Static_Slot_Glove", [7] = "Static_Slot_Boots", [8] = "Static_Slot_Helm", [9] = "Static_Slot_Shoulder", [10] = "Static_Slot_Necklace", [11] = "Static_Slot_Ring1", [12] = "Static_Slot_Ring2", [13] = "Static_Slot_Earing1", [14] = "Static_Slot_Earing2", [15] = "Static_Slot_Belt", [16] = "Static_Slot_Lantern", [17] = "Static_Slot_Avatar_Cheat", [18] = "Static_Slot_Avatar_Pants", [19] = "Static_Slot_Avatar_Gloves", [20] = "Static_Slot_Avatar_Boots", [21] = "Static_Slot_Avatar_Shoulder", [22] = "Static_Slot_Avatar_RightHand", [23] = "Static_Slot_Avatar_LeftHand"}
, slots = (Array.new)(), staticTitle = (UI.getChildControl)(Panel_ServantEquipment, "Static_Text_Title"), buttonClose = (UI.getChildControl)(Panel_ServantEquipment, "Button_Close")}
servantEquip.initControl = function(self)
  -- function num : 0_0
  ;
  (UI.ASSERT)(self.staticTitle ~= nil and type(self.staticTitle) ~= "number", "Static_Text_Title")
  ;
  (UI.ASSERT)(self.buttonClose ~= nil and type(self.staticCapacity) ~= "number", "Button_Close")
  for _,v in pairs(self.slotNoDef) do
    local slot = {}
    ;
    (SlotItem.new)(slot, "ServantEquipment_" .. v, v, Panel_ServantEquipment, self.slotConfig)
    slot.icon = (UI.getChildControl)(Panel_ServantEquipment, (self.slotNoId)[v])
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "ServantEquipment_RClick(" .. v .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "ServantEquipment_LClick(" .. v .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "ServantEquipment_MouseOn(" .. v .. ",true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "ServantEquipment_MouseOn(" .. v .. ",false)")
    -- DECOMPILER ERROR at PC85: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self.slots)[v] = slot
    Panel_Tooltip_Item_SetPosition(v, slot, "ServantEquipment")
  end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

servantEquip.registEventHandler = function(self)
  -- function num : 0_1
  (self.buttonClose):addInputEvent("Mouse_LUp", "ServantEquipmentWindow_Close()")
end

servantEquip.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("EventServantEquipmentUpdate", "ServantEquipment_updateSlotData")
end

ServantEquipment_updateSlotData = function()
  -- function num : 0_3 , upvalues : servantEquip
  local self = servantEquip
  local temporaryWrapper = getTemporaryInformationWrapper()
  if temporaryWrapper == nil or not temporaryWrapper:isSelfVehicle() then
    return 
  end
  for _,v in pairs(self.slotNoDef) do
    local itemWrapper = (temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)):getEquipItem(v)
    local slot = (self.slots)[v]
    if itemWrapper ~= nil then
      slot:setItem(itemWrapper)
    else
      slot:clearItem()
    end
  end
end

ServantEquipment_MouseOn = function(slotNo, isOn)
  -- function num : 0_4
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "servant_inventory", isOn, false)
end

ServantEquipment_RClick = function(slotNo)
  -- function num : 0_5
  local temporaryWrapper = getTemporaryInformationWrapper()
  if temporaryWrapper == nil or not temporaryWrapper:isSelfVehicle() then
    return 
  end
  local servantInfo = (temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)):getEquipItem(slotNo)
  if servantInfo == nil then
    return 
  end
  servant_doUnequip(servantInfo:getActorKeyRaw(), slotNo)
end

ServantEquipment_LClick = function(slotNo)
  -- function num : 0_6
  if DragManager.dragStartPanel == Panel_Window_Inventory then
    local dragSlotNo = DragManager.dragSlotInfo
    local itemWrapper = getInventoryItem(dragSlotNo)
    if itemWrapper ~= nil then
      local itemStatic = itemWrapper:getStaticStatus()
      if itemStatic:isEquipable() then
        Inventory_SlotRClick(DragManager.dragSlotInfo)
        ;
        (DragManager.clearInfo)()
      end
    end
  end
end

local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
ServantEquipment_ShowToggle = function()
  -- function num : 0_7
  local isShow = Panel_ServantEquipment:GetShow()
  if isShow == true then
    Panel_ServantEquipment:SetShow(false, true)
  else
    Panel_ServantEquipment:SetShow(true, true)
  end
end

ServantEquipmentWindow_Close = function()
  -- function num : 0_8
end

ServantEquipment_ShowAni = function()
  -- function num : 0_9
  (UIAni.fadeInSCR_Left)(Panel_ServantEquipment)
end

ServantEquipment_HideAni = function()
  -- function num : 0_10 , upvalues : UI_ANI_ADV, UI_color
  Panel_ServantEquipment:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_ServantEquipment:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  local aniInfo2 = Panel_ServantEquipment:addScaleAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(0.97)
  aniInfo2.AxisX = 200
  aniInfo2.AxisY = 295
  aniInfo2.IsChangeChild = true
  aniInfo2:SetDisableWhileAni(true)
end

servantEquip:initControl()
servantEquip:registEventHandler()
servantEquip:registMessageHandler()

