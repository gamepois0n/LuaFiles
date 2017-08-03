-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stableequipinfo.luac 

-- params : ...
-- function num : 0
Panel_Window_StableEquipInfo:SetShow(false, false)
Panel_Window_StableEquipInfo:setMaskingChild(true)
Panel_Window_StableEquipInfo:ActiveMouseEventEffect(true)
Panel_Window_StableEquipInfo:SetDragEnable(true)
;
((UI.getChildControl)(Panel_Window_StableEquipInfo, "Stable_Info_Equipment")):setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
StableEquipInfoWindow_Show = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_StableEquipInfo:SetShow(true, false)
  ;
  (UIAni.fadeInSCR_Right)(Panel_Window_StableEquipInfo)
  local aniInfo3 = Panel_Window_StableEquipInfo:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = false
end

StableEquipInfoWindow_Hide = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Window_StableEquipInfo:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_StableEquipInfo:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local stableEquipInfo = {
slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, 
slotNoDef = {chest = 3, rightHand = 4, boots = 5, helm = 6, armor = 7, belt = 12}
, 
slotNoId = {[3] = "equipIcon_upperArmor", [4] = "equipIcon_weapon", [5] = "equipIcon_foot", [6] = "equipIcon_helm", [7] = "equipIcon_upperArmor2", [12] = "equipIcon_stirrups"}
, _staticBG = (UI.getChildControl)(Panel_Window_StableEquipInfo, "Static_EquipBG"), _staticEnchantLevel = (UI.getChildControl)(Panel_Window_StableEquipInfo, "Static_Text_Slot_Enchant_value"), _slot = (Array.new)(), _currentSlotNo = 0}
stableEquipInfo.init = function(self)
  -- function num : 0_2
  for _,value in pairs(self.slotNoDef) do
    local slot = {}
    slot.icon = (UI.getChildControl)(Panel_Window_StableEquipInfo, (self.slotNoId)[value])
    ;
    (SlotItem.new)(slot, "StableEquipment_" .. value, value, Panel_Window_StableEquipInfo, self.slotConfig)
    slot:createChild()
    ;
    (slot.icon):SetShow(true)
    CopyBaseProperty(self._staticEnchantLevel, slot.enchantText)
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
    ;
    (slot.icon):addInputEvent("Mouse_On", "StableEquipInfo_MouseOn(" .. value .. ",true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "StableEquipInfo_MouseOn(" .. value .. ",false)")
    Panel_Tooltip_Item_SetPosition(value, slot, "StableEquipment")
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._slot)[value] = slot
  end
end

stableEquipInfo.update = function(self)
  -- function num : 0_3 , upvalues : stableEquipInfo
  local self = stableEquipInfo
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  for _,v in pairs(self.slotNoDef) do
    local itemWrapper = servantInfo:getEquipItem(v)
    local slot = (self._slot)[v]
    if itemWrapper ~= nil then
      slot:setItem(itemWrapper)
    else
      slot:clearItem()
    end
  end
end

stableEquipInfo.registEventHandler = function(self)
  -- function num : 0_4
end

stableEquipInfo.registMessageHandler = function(self)
  -- function num : 0_5
  registerEvent("onScreenResize", "StableEquipInfo_Resize")
end

StableEquipInfo_Resize = function()
  -- function num : 0_6
  Panel_Window_StableEquipInfo:SetSpanSize(28, 360)
  Panel_Window_StableEquipInfo:ComputePos()
end

StableEquipInfo_MouseOn = function(slotNo, isOn)
  -- function num : 0_7
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "StableEquipment", isOn)
end

StableEquipInfo_Open = function()
  -- function num : 0_8 , upvalues : stableEquipInfo
  local self = stableEquipInfo
  self:update()
  Panel_Window_StableEquipInfo:SetShow(true)
  if Panel_Window_StableEquipInfo:GetShow() then
    return 
  end
end

StableEquipInfo_Close = function()
  -- function num : 0_9
  if not Panel_Window_StableEquipInfo:GetShow() then
    return 
  end
  Panel_Window_StableEquipInfo:SetShow(false)
end

stableEquipInfo:init()
stableEquipInfo:registEventHandler()
stableEquipInfo:registMessageHandler()
StableEquipInfo_Resize()

