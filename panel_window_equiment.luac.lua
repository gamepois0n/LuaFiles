-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\equipment\panel_window_equiment.luac 

-- params : ...
-- function num : 0
Panel_Equipment:SetShow(false, false)
Panel_Equipment:ActiveMouseEventEffect(true)
Panel_Equipment:setMaskingChild(true)
Panel_Equipment:setGlassBackground(true)
Panel_Equipment:RegisterShowEventFunc(true, "EquipmentWindow_ShowAni()")
Panel_Equipment:RegisterShowEventFunc(false, "EquipmentWindow_HideAni()")
local EquipNoMin = (CppEnums.EquipSlotNo).rightHand
local EquipNoMax = (CppEnums.EquipSlotNo).equipSlotNoCount
local UnUsedEquipNo_01 = 100
local UnUsedEquipNo_02 = 101
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local CT = CppEnums.ClassType
local isContentsEnable = ToClient_IsContentsGroupOpen("35")
local isKR2ContentsEnable = isGameTypeKR2()
local awakenWeapon = {[CT.ClassType_Warrior] = ToClient_IsContentsGroupOpen("901"), [CT.ClassType_Ranger] = ToClient_IsContentsGroupOpen("902"), [CT.ClassType_Sorcerer] = ToClient_IsContentsGroupOpen("903"), [CT.ClassType_Giant] = ToClient_IsContentsGroupOpen("904"), [CT.ClassType_Tamer] = ToClient_IsContentsGroupOpen("905"), [CT.ClassType_BladeMaster] = ToClient_IsContentsGroupOpen("906"), [CT.ClassType_BladeMasterWomen] = ToClient_IsContentsGroupOpen("907"), [CT.ClassType_Valkyrie] = ToClient_IsContentsGroupOpen("908"), [CT.ClassType_Wizard] = ToClient_IsContentsGroupOpen("909"), [CT.ClassType_WizardWomen] = ToClient_IsContentsGroupOpen("910"), [CT.ClassType_NinjaMan] = ToClient_IsContentsGroupOpen("911"), [CT.ClassType_NinjaWomen] = ToClient_IsContentsGroupOpen("912"), [CT.ClassType_DarkElf] = ToClient_IsContentsGroupOpen("913"), [CT.ClassType_Combattant] = ToClient_IsContentsGroupOpen("914"), [CT.ClassType_CombattantWomen] = ToClient_IsContentsGroupOpen("918")}
local classType = (getSelfPlayer()):getClassType()
local awakenWeaponContentsOpen = awakenWeapon[classType]
local equip = {
slotConfig = {createIcon = false, createBorder = true, createCount = true, createCash = true, createEnduranceIcon = true, createItemLock = true}
, 
slotNoId = {[0] = "Static_Slot_RightHand", [1] = "Static_Slot_LeftHand", [2] = "Static_Slot_Gather", [3] = "Static_Slot_Chest", [4] = "Static_Slot_Glove", [5] = "Static_Slot_Boots", [6] = "Static_Slot_Helm", [7] = "Static_Slot_Necklace", [8] = "Static_Slot_Ring1", [9] = "Static_Slot_Ring2", [10] = "Static_Slot_Earing1", [11] = "Static_Slot_Earing2", [12] = "Static_Slot_Belt", [13] = "Static_Slot_Lantern", [14] = "Static_Slot_Avatar_Chest", [15] = "Static_Slot_Avatar_Gloves", [16] = "Static_Slot_Avatar_Boots", [17] = "Static_Slot_Avatar_Helm", [18] = "Static_Slot_Avatar_RightHand", [19] = "Static_Slot_Avatar_LeftHand", [20] = "Static_Slot_Avatar_UnderWear", [22] = "Static_Slot_FaceDecoration1", [23] = "Static_Slot_FaceDecoration2", [21] = "Static_Slot_FaceDecoration3", [27] = "Static_Slot_AlchemyStone", [29] = "Static_Slot_AwakenWeapon", [30] = "Static_Slot_Avatar_AwakenWeapon"}
, 
avataEquipSlotId = {[14] = "Check_Slot_Avatar_Chest", [15] = "Check_Slot_Avatar_Gloves", [16] = "Check_Slot_Avatar_Boots", [17] = "Check_Slot_Avatar_Helm", [18] = "Check_Slot_Avatar_RightHand", [19] = "Check_Slot_Avatar_LeftHand", [20] = "Check_Slot_Avatar_UnderWear", [22] = "Check_Slot_FaceDecoration1", [23] = "Check_Slot_FaceDecoration2", [21] = "Check_Slot_FaceDecoration3", [30] = "Check_Slot_Avatar_AwakenWeapon"}
, 
equipSlotId = {[6] = "Check_Slot_Helm"}
, 
_checkFlag = {[14] = 1, [15] = 2, [16] = 4, [17] = 8, [18] = 32, [19] = 64, [20] = 16, [22] = 256, [23] = 512, [21] = 128, [3] = 65536, [4] = 131072, [5] = 262144, [6] = 524288, [0] = 2097152, [1] = 4194304, [30] = 1024}
, 
slotNoIdToString = {[0] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_MAINHAND"), [1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_SUBHAND"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_GATHERTOOLS"), [3] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_UPPERBODY"), [4] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_GLOVES"), [5] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_BOOTS"), [6] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_HELM"), [7] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_NECKLACE"), [8] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"), [9] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"), [10] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"), [11] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"), [12] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_WAISTBAND"), [13] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_LANTERN"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_BODY"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HANDS"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_BOOTS"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HELM"), [18] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_MAIN"), [19] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_SUB"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_UNDERWEAR"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_EYES"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_MOUSE"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HEAD"), [27] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_alchemyStone"), [29] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_awakenWeapon"), [30] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_avatarAwakenWeapon")}
, slots = (Array.new)(), slotBGs = (Array.new)(), avataSlots = (Array.new)(), defaultSlots = (Array.new)(), staticTitle = (UI.getChildControl)(Panel_Equipment, "Static_Text_Title"), buttonClose = (UI.getChildControl)(Panel_Equipment, "Button_Close"), enchantText = (UI.getChildControl)(Panel_Equipment, "Static_Text_Slot_Enchant_value"), attackText = (UI.getChildControl)(Panel_Equipment, "StaticText_Attack"), attackValue = (UI.getChildControl)(Panel_Equipment, "StaticText_Attack_Value"), defenceText = (UI.getChildControl)(Panel_Equipment, "StaticText_Defence"), defenceValue = (UI.getChildControl)(Panel_Equipment, "StaticText_Defence_Value"), awakenText = (UI.getChildControl)(Panel_Equipment, "StaticText_AwakenAttack"), awakenValue = (UI.getChildControl)(Panel_Equipment, "StaticText_AwakenAttack_Value"), effectBG = (UI.getChildControl)(Panel_Equipment, "Static_Effect"), checkCloak = (UI.getChildControl)(Panel_Equipment, "CheckButton_Cloak_Invisual"), checkHelm = (UI.getChildControl)(Panel_Equipment, "CheckButton_Helm_Invisual"), checkHelmOpen = (UI.getChildControl)(Panel_Equipment, "CheckButton_HelmOpen"), btn_PetList = (UI.getChildControl)(Panel_Equipment, "Button_PetInfo"), checkUnderwear = (UI.getChildControl)(Panel_Equipment, "CheckButton_Underwear_Invisual"), checkCamouflage = (UI.getChildControl)(Panel_Equipment, "CheckButton_ShowNameWhenCamouflage"), checkPopUp = (UI.getChildControl)(Panel_Equipment, "CheckButton_PopUp"), btn_ServantInventory = (UI.getChildControl)(Panel_Equipment, "Button_ServantInventory"), 
extendedSlotInfoArray = {}
, checkExtendedSlot = 0, checkBox_AlchemyStone = (UI.getChildControl)(Panel_Equipment, "CheckBox_AlchemyStone"), slotRingIndex = 0, slotEaringIndex = 0}
local alchemyStoneQuickKey = (UI.getChildControl)(Panel_Equipment, "Static_Slot_AlchemyStone_Key")
local isAlchemyStoneCheck = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).AlchemyStone)
;
(equip.checkBox_AlchemyStone):SetCheck(isAlchemyStoneCheck)
;
(equip.checkBox_AlchemyStone):addInputEvent("Mouse_LUp", "AlchemyStone_CheckEventForSave()")
AlchemyStone_CheckEventForSave = function(isShow)
  -- function num : 0_0 , upvalues : equip
  local isCheck = (equip.checkBox_AlchemyStone):IsCheck()
  if isShow ~= nil and isCheck then
    isCheck = isShow
  end
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).AlchemyStone, isCheck)
end

local _buttonQuestion = (UI.getChildControl)(Panel_Equipment, "Button_Question")
local toolTip_Templete = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_1")
local toolTip_BlankSlot = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Equipment, "toolTip_BlankSlot_For_Equipment")
CopyBaseProperty(toolTip_Templete, toolTip_BlankSlot)
toolTip_BlankSlot:SetColor(UI_color.C_FFFFFFFF)
toolTip_BlankSlot:SetAlpha(1)
toolTip_BlankSlot:SetFontColor(UI_color.C_FFC4BEBE)
toolTip_BlankSlot:SetAutoResize(true)
toolTip_BlankSlot:SetTextHorizonCenter()
toolTip_BlankSlot:SetShow(false)
toolTip_BlankSlot:SetIgnore(false)
equip_checkUseableSlot = function(index)
  -- function num : 0_1 , upvalues : UnUsedEquipNo_01
  local returnValue = true
  if index == UnUsedEquipNo_01 or index == nUsedEquipNo_02 or index == (CppEnums.EquipSlotNo).equipSlotNoCount or index == (CppEnums.EquipSlotNo).explorationBonus0 or index == (CppEnums.EquipSlotNo).installation4 or index == (CppEnums.EquipSlotNo).body or index == (CppEnums.EquipSlotNo).avatarBody then
    returnValue = false
  end
  return returnValue
end

equip.initControl = function(self)
  -- function num : 0_2 , upvalues : EquipNoMin, EquipNoMax, awakenWeaponContentsOpen, equip, isKR2ContentsEnable
  for v = EquipNoMin, EquipNoMax do
    if equip_checkUseableSlot(v) == true then
      local slotBG = (UI.getChildControl)(Panel_Equipment, (self.slotNoId)[v] .. "_BG")
      slotBG:SetShow(false)
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R6 in 'UnsetPending'

      ;
      (self.slotBGs)[v] = slotBG
      local whereType = Inventory_GetCurrentInventoryType()
      if ToClient_EquipSlot_CheckItemLock(v, whereType) == true then
        ToClient_Inventory_RemoveItemLock(v)
      end
      if v == 15 then
        if awakenWeaponContentsOpen then
          ((self.slotBGs)[v]):SetPosX(253)
          ;
          ((self.slotBGs)[v]):SetPosY(178)
        else
          ;
          ((self.slotBGs)[v]):SetPosX(255)
          ;
          ((self.slotBGs)[v]):SetPosY(192)
        end
      end
      if v == 16 then
        if awakenWeaponContentsOpen then
          ((self.slotBGs)[v]):SetPosX(89)
          ;
          ((self.slotBGs)[v]):SetPosY(178)
        else
          ;
          ((self.slotBGs)[v]):SetPosX(87)
          ;
          ((self.slotBGs)[v]):SetPosY(192)
        end
      end
      if v == 18 then
        if awakenWeaponContentsOpen then
          ((self.slotBGs)[v]):SetPosX(89)
          ;
          ((self.slotBGs)[v]):SetPosY(240)
        else
          ;
          ((self.slotBGs)[v]):SetPosX(100)
          ;
          ((self.slotBGs)[v]):SetPosY(260)
        end
      end
      if v == 19 then
        if awakenWeaponContentsOpen then
          ((self.slotBGs)[v]):SetPosX(253)
          ;
          ((self.slotBGs)[v]):SetPosY(240)
        else
          ;
          ((self.slotBGs)[v]):SetPosX(242)
          ;
          ((self.slotBGs)[v]):SetPosY(260)
        end
      end
      if v == 20 then
        if awakenWeaponContentsOpen then
          ((self.slotBGs)[v]):SetPosX(208)
          ;
          ((self.slotBGs)[v]):SetPosY(282)
        else
          ;
          ((self.slotBGs)[v]):SetPosX(171)
          ;
          ((self.slotBGs)[v]):SetPosY(290)
        end
      end
      local slot = {}
      slot.icon = (UI.getChildControl)(Panel_Equipment, (self.slotNoId)[v])
      ;
      (slot.icon):SetPosX(slotBG:GetPosX() + 4)
      ;
      (slot.icon):SetPosY(slotBG:GetPosY() - 4)
      ;
      (SlotItem.new)(slot, "Equipment_" .. v, v, Panel_Equipment, self.slotConfig)
      slot:createChild()
      ;
      (slot.icon):addInputEvent("Mouse_RUp", "Equipment_RClick(" .. v .. ")")
      ;
      (slot.icon):addInputEvent("Mouse_LUp", "Equipment_LClick(" .. v .. ")")
      ;
      (slot.icon):addInputEvent("Mouse_On", "Equipment_MouseOn(" .. v .. ",true)")
      ;
      (slot.icon):addInputEvent("Mouse_Out", "Equipment_MouseOn(" .. v .. ",false)")
      Panel_Tooltip_Item_SetPosition(v, slot, "equipment")
      -- DECOMPILER ERROR at PC233: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (self.slots)[v] = slot
      local targetControl = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Equipment, "Equip_Enchant_" .. v)
      CopyBaseProperty(equip.enchantText, targetControl)
      targetControl:SetPosX((slot.icon):GetPosX())
      targetControl:SetPosY((slot.icon):GetPosY() + 8)
      targetControl:SetShow(false)
      slot.enchantText = targetControl
      -- DECOMPILER ERROR at PC275: Confused about usage of register: R9 in 'UnsetPending'

      if (self.avataEquipSlotId)[v] ~= nil then
        (self.avataSlots)[v] = (UI.getChildControl)(Panel_Equipment, (self.avataEquipSlotId)[v])
        ;
        ((self.avataSlots)[v]):SetShow(true)
        ;
        ((self.avataSlots)[v]):SetPosX((slot.icon):GetPosX() + (slot.icon):GetSizeX() - ((self.avataSlots)[v]):GetSizeX() * 2 / 3)
        ;
        ((self.avataSlots)[v]):SetPosY((slot.icon):GetPosY() + (slot.icon):GetSizeY() - ((self.avataSlots)[v]):GetSizeX() * 2 / 3)
        ;
        ((self.avataSlots)[v]):addInputEvent("Mouse_LUp", "AvatarEquipSlot_LClick(" .. v .. ")")
        if v <= 20 or v == 30 then
          ((self.avataSlots)[v]):addInputEvent("Mouse_On", "Equipment_SimpleToolTips( true, 4, " .. v .. " )")
          ;
          ((self.avataSlots)[v]):addInputEvent("Mouse_Out", "Equipment_SimpleToolTips( false, 4, " .. v .. " )")
        else
          ;
          ((self.avataSlots)[v]):addInputEvent("Mouse_On", "Equipment_SimpleToolTips( true, 5, " .. v .. " )")
          ;
          ((self.avataSlots)[v]):addInputEvent("Mouse_Out", "Equipment_SimpleToolTips( false, 5, " .. v .. " )")
        end
        if v == 30 then
          ((self.avataSlots)[v]):SetShow(awakenWeaponContentsOpen)
        end
      end
      -- DECOMPILER ERROR at PC385: Confused about usage of register: R9 in 'UnsetPending'

      if (self.equipSlotId)[v] ~= nil then
        (self.defaultSlots)[v] = (UI.getChildControl)(Panel_Equipment, (self.equipSlotId)[v])
        ;
        ((self.defaultSlots)[v]):SetShow(false)
      end
    end
  end
  ;
  (self.checkCloak):SetShow(true)
  ;
  (self.checkHelm):SetShow(true)
  ;
  (self.checkHelmOpen):SetShow(true)
  ;
  (self.enchantText):SetShow(false)
  ;
  (self.checkUnderwear):SetShow(not isKR2ContentsEnable)
  ;
  (self.checkCamouflage):SetShow(true)
  local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
  ;
  (self.checkPopUp):SetShow(isPopUpContentsEnable)
  ;
  (self.checkCloak):SetCheck(not ToClient_IsShowCloak())
  ;
  (self.checkHelm):SetCheck(not ToClient_IsShowHelm())
  ;
  (self.checkHelmOpen):SetCheck(ToClient_IsShowBattleHelm())
  ;
  ((getSelfPlayer()):get()):setUnderwearModeInhouse(false)
  ;
  (self.checkUnderwear):SetCheck(((getSelfPlayer()):get()):getUnderwearModeInhouse())
  ;
  (self.checkCamouflage):SetCheck(Toclient_setShowNameWhenCamouflage())
  selfPlayerShowHelmet(ToClient_IsShowHelm())
  selfPlayerShowBattleHelmet(ToClient_IsShowBattleHelm())
  ;
  (self.btn_PetList):SetShow(true)
  Equipment_RePosition()
  ;
  (self.checkHelm):addInputEvent("Mouse_On", "Equipment_SimpleToolTips( true, 0 )")
  ;
  (self.checkHelm):addInputEvent("Mouse_Out", "Equipment_SimpleToolTips( false, 0 )")
  ;
  (self.checkHelmOpen):addInputEvent("Mouse_On", "Equipment_SimpleToolTips( true, 1 )")
  ;
  (self.checkHelmOpen):addInputEvent("Mouse_Out", "Equipment_SimpleToolTips( false, 1 )")
  ;
  (self.checkCloak):addInputEvent("Mouse_On", "Equipment_SimpleToolTips( true, 6 )")
  ;
  (self.checkCloak):addInputEvent("Mouse_Out", "Equipment_SimpleToolTips( false, 6 )")
  ;
  (self.checkUnderwear):addInputEvent("Mouse_On", "Equipment_SimpleToolTips( true, 7 )")
  ;
  (self.checkUnderwear):addInputEvent("Mouse_Out", "Equipment_SimpleToolTips( false, 7 )")
  ;
  (self.btn_PetList):addInputEvent("Mouse_On", "Equipment_SimpleToolTips( true, 2 )")
  ;
  (self.btn_PetList):addInputEvent("Mouse_Out", "Equipment_SimpleToolTips( false, 2 )")
  ;
  (self.btn_ServantInventory):addInputEvent("Mouse_On", "Equipment_SimpleToolTips( true, 3 )")
  ;
  (self.btn_ServantInventory):addInputEvent("Mouse_Out", "Equipment_SimpleToolTips( false, 3 )")
  ;
  (self.checkCamouflage):addInputEvent("Mouse_On", "Equipment_SimpleToolTips( true, 8 )")
  ;
  (self.checkCamouflage):addInputEvent("Mouse_Out", "Equipment_SimpleToolTips( false, 8 )")
  ;
  (self.attackText):addInputEvent("Mouse_On", "Equipment_StatValueTooltips(true, 0)")
  ;
  (self.attackText):addInputEvent("Mouse_Out", "Equipment_StatValueTooltips(false)")
  ;
  (self.defenceText):addInputEvent("Mouse_On", "Equipment_StatValueTooltips(true, 1)")
  ;
  (self.defenceText):addInputEvent("Mouse_Out", "Equipment_StatValueTooltips(false)")
  ;
  (self.awakenText):addInputEvent("Mouse_On", "Equipment_StatValueTooltips(true, 2)")
  ;
  (self.awakenText):addInputEvent("Mouse_Out", "Equipment_StatValueTooltips(false)")
  ConsoleGroupCreate_Panel_Equipment()
end

ConsoleGroupCreate_Panel_Equipment = function()
  -- function num : 0_3 , upvalues : equip
  local self = equip
  local group_0 = Panel_Equipment:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_0:addControl(0, 0, 13, 1, ((self.slots)[6]).icon)
  group_0:addControl(1, 0, 13, 1, ((self.slots)[3]).icon)
  group_0:addControl(2, 0, 13, 1, ((self.slots)[8]).icon)
  group_0:addControl(3, 0, 13, 1, ((self.slots)[9]).icon)
  group_0:addControl(4, 0, 13, 1, ((self.slots)[4]).icon)
  group_0:addControl(5, 0, 13, 1, ((self.slots)[7]).icon)
  group_0:addControl(6, 0, 13, 1, ((self.slots)[1]).icon)
  group_0:addControl(7, 0, 13, 1, ((self.slots)[29]).icon)
  group_0:addControl(8, 0, 13, 1, ((self.slots)[0]).icon)
  group_0:addControl(9, 0, 13, 1, ((self.slots)[12]).icon)
  group_0:addControl(10, 0, 13, 1, ((self.slots)[5]).icon)
  group_0:addControl(11, 0, 13, 1, ((self.slots)[11]).icon)
  group_0:addControl(12, 0, 13, 1, ((self.slots)[10]).icon)
  local group_1 = Panel_Equipment:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_1:addControl(0, 0, 8, 1, ((self.slots)[17]).icon)
  group_1:addControl(1, 0, 8, 1, ((self.slots)[14]).icon)
  group_1:addControl(2, 0, 8, 1, ((self.slots)[15]).icon)
  group_1:addControl(3, 0, 8, 1, ((self.slots)[19]).icon)
  group_1:addControl(4, 0, 8, 1, ((self.slots)[20]).icon)
  group_1:addControl(5, 0, 8, 1, ((self.slots)[30]).icon)
  group_1:addControl(6, 0, 8, 1, ((self.slots)[18]).icon)
  group_1:addControl(7, 0, 8, 1, ((self.slots)[16]).icon)
  local group_2 = Panel_Equipment:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_2:addControl(0, 0, 1, 1, ((self.slots)[27]).icon)
  local group_3 = Panel_Equipment:addConsoleUIGroup(3, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_3:addControl(0, 0, 5, 1, ((self.slots)[13]).icon)
  group_3:addControl(1, 0, 5, 1, ((self.slots)[21]).icon)
  group_3:addControl(2, 0, 5, 1, ((self.slots)[22]).icon)
  group_3:addControl(3, 0, 5, 1, ((self.slots)[23]).icon)
  group_3:addControl(4, 0, 5, 1, ((self.slots)[2]).icon)
  local group_4 = Panel_Equipment:addConsoleUIGroup(4, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_4:addControl(0, 0, 7, 1, self.btn_ServantInventory)
  group_4:addControl(1, 0, 7, 1, self.checkCamouflage)
  group_4:addControl(2, 0, 7, 1, self.checkUnderwear)
  group_4:addControl(3, 0, 7, 1, self.btn_PetList)
  group_4:addControl(4, 0, 7, 1, self.checkHelmOpen)
  group_4:addControl(5, 0, 7, 1, self.checkHelm)
  group_4:addControl(6, 0, 7, 1, self.checkCloak)
end

HandleClicked_EquipmentWindow_Close = function()
  -- function num : 0_4 , upvalues : equip
  (equip.checkPopUp):SetCheck(false)
  Panel_Equipment:CloseUISubApp()
  EquipmentWindow_Close()
end

EquipmentWindow_Close = function()
  -- function num : 0_5 , upvalues : equip
  if Panel_Equipment:IsUISubApp() then
    return 
  end
  if Panel_Equipment:IsShow() then
    Panel_Equipment:SetShow(false, false)
    CharacterInfoWindow_Hide()
    if ToClient_IsSavedUi() then
      ToClient_SaveUiInfo(false)
      ToClient_SetSavedUi(false)
    end
  end
  HelpMessageQuestion_Out()
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  equip.slotRingIndex = 0
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

  equip.slotEaringIndex = 0
end

EquipmentWindow_ShowAni = function()
  -- function num : 0_6 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Left)(Panel_Equipment)
  local aniInfo1 = Panel_Equipment:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.05)
  aniInfo1.AxisX = Panel_Equipment:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Equipment:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Equipment:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.05)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Equipment:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Equipment:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

EquipmentWindow_HideAni = function()
  -- function num : 0_7 , upvalues : UI_ANI_ADV, UI_color
  Panel_Equipment:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Equipment:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

Equipment_MouseOn = function(slotNo, isOn)
  -- function num : 0_8
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "equipment", isOn, false)
end

Equipment_NilSlot_MouseOn = function(slotNo, isOn)
  -- function num : 0_9 , upvalues : equip, toolTip_BlankSlot
  local self = equip
  if isOn == true then
    toolTip_BlankSlot:SetText((self.slotNoIdToString)[slotNo])
    toolTip_BlankSlot:SetSize(toolTip_BlankSlot:GetTextSizeX() + 30, toolTip_BlankSlot:GetSizeY())
    toolTip_BlankSlot:SetPosX((((self.slots)[slotNo]).icon):GetPosX() - toolTip_BlankSlot:GetTextSizeX())
    toolTip_BlankSlot:SetPosY((((self.slots)[slotNo]).icon):GetPosY() - toolTip_BlankSlot:GetSizeY())
    toolTip_BlankSlot:SetShow(true)
  else
    toolTip_BlankSlot:SetShow(false)
  end
end

local _offenceValue, _awakenOffecnValue, _defenceValue = nil, nil, nil
Equipment_RClick = function(slotNo)
  -- function num : 0_10 , upvalues : equip
  local itemWrapper = getEquipmentItem(slotNo)
  if itemWrapper ~= nil then
    Equipment_Checkbutton(slotNo, true, equip.checkUnderwear)
    if Panel_Window_Repair:IsShow() and not Panel_FixEquip:GetShow() then
      PaGlobal_Repair:repair_EquipWindowRClick(slotNo, itemWrapper)
    else
      if Panel_Window_Repair:IsShow() and Panel_FixEquip:GetShow() then
        equipmentDoUnequip(slotNo)
      else
        equipmentDoUnequip(slotNo)
      end
    end
  end
end

Equipment_LClick = function(slotNo)
  -- function num : 0_11
  if DragManager.dragStartPanel == Panel_Window_Inventory then
    local dragSlotNo = DragManager.dragSlotInfo
    local itemWrapper = getInventoryItem(dragSlotNo)
    if itemWrapper ~= nil then
      local itemStatic = itemWrapper:getStaticStatus()
      if itemStatic:isEquipable() then
        Inventory_SlotRClickXXX(DragManager.dragSlotInfo, slotNo)
        DragManager:clearInfo()
      end
    end
  end
end

AvatarEquipSlot_LClick = function(slotNo)
  -- function num : 0_12 , upvalues : equip
  local self = equip
  local selfPlayer = getSelfPlayer()
  do
    if selfPlayer ~= nil and (selfPlayer:get()):getUnderwearModeInhouse() then
      local isCheckedTemp = ((self.avataSlots)[slotNo]):IsCheck()
      if isCheckedTemp then
        isCheckedTemp = false
      else
        isCheckedTemp = true
      end
      ;
      ((self.avataSlots)[slotNo]):SetCheck(isCheckedTemp)
      return 
    end
    local isChecked = ((self.avataSlots)[slotNo]):IsCheck()
    if isChecked == true then
      ToClient_SetAvatarEquipSlotFlag((self._checkFlag)[slotNo])
    else
      ToClient_ResetAvatarEquipSlotFlag((self._checkFlag)[slotNo])
    end
    Toclient_setShowAvatarEquip()
  end
end

local equipMentPosX = 0
local equipMentPosY = 0
Equipment_PosSaveMemory = function()
  -- function num : 0_13 , upvalues : equipMentPosX, equipMentPosY
  equipMentPosX = Panel_Equipment:GetPosX()
  equipMentPosY = Panel_Equipment:GetPosY()
end

Equipment_PosLoadMemory = function()
  -- function num : 0_14 , upvalues : equipMentPosX, equipMentPosY
  Panel_Equipment:SetPosX(equipMentPosX)
  Panel_Equipment:SetPosY(equipMentPosY)
end

Equipment_SetShow = function(isShow)
  -- function num : 0_15 , upvalues : equip, EquipNoMin, EquipNoMax, alchemyStoneQuickKey
  local self = equip
  if Panel_Window_Camp:GetShow() then
    return 
  end
  if isShow == true then
    if GetUIMode() == (Defines.UIMode).eUIMode_NpcDialog then
      Panel_Equipment:SetShow(false, false)
    else
      Panel_Equipment:SetShow(true, true)
    end
  else
    if Panel_Equipment:IsUISubApp() then
      return 
    end
    Panel_Equipment:SetShow(false, false)
    if ToClient_IsSavedUi() then
      ToClient_SaveUiInfo(false)
      ToClient_SetSavedUi(false)
    end
  end
  Inventory_SetFunctor(nil, nil, EquipmentWindow_Close, nil)
  for v = EquipNoMin, EquipNoMax do
    if equip_checkUseableSlot(v) == true and (self.avataSlots)[v] ~= nil and (self._checkFlag)[v] ~= nil then
      local isCheck = ToClient_IsSetAvatarEquipSlotFlag((self._checkFlag)[v])
      ;
      ((self.avataSlots)[v]):SetCheck(isCheck)
    end
  end
  local alchemyStoneQuickKeyString = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_AlchemySton)
  alchemyStoneQuickKey:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_QUICKCOMMAND", "keyString", alchemyStoneQuickKeyString))
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local isSafeZone = (regionInfo:get()):isSafeZone()
  if not isSafeZone then
    (self.checkUnderwear):SetEnable(true)
    ;
    (self.checkUnderwear):SetCheck(false)
  end
  Equipment_updateSlotData()
end

FGlobal_Equipment_SetHide = function(isShow)
  -- function num : 0_16
  Equipment_SetShow(isShow)
end

FGlobal_Equipment_SetFunctionButtonHide = function(isShow)
  -- function num : 0_17 , upvalues : equip, isKR2ContentsEnable
  (equip.btn_PetList):SetShow(isShow)
  if isKR2ContentsEnable then
    (equip.checkUnderwear):SetShow(false)
  else
    ;
    (equip.checkUnderwear):SetShow(isShow)
  end
  ;
  (equip.checkCamouflage):SetShow(isShow)
  ;
  (equip.btn_ServantInventory):SetShow(isShow)
  ;
  (equip.checkBox_AlchemyStone):SetShow(isShow)
end

equip.registEventHandler = function(self)
  -- function num : 0_18 , upvalues : _buttonQuestion
  (self.buttonClose):addInputEvent("Mouse_LUp", "HandleClicked_EquipmentWindow_Close()")
  ;
  (self.checkCloak):addInputEvent("Mouse_LUp", "Check_Cloak()")
  ;
  (self.checkHelm):addInputEvent("Mouse_LUp", "Check_Helm()")
  ;
  (self.checkHelmOpen):addInputEvent("Mouse_LUp", "Check_HelmOpen()")
  ;
  (self.checkUnderwear):addInputEvent("Mouse_LUp", "Check_Underwear()")
  ;
  (self.checkCamouflage):addInputEvent("Mouse_LUp", "Check_ShowNameWhenCamouflage()")
  ;
  (self.checkPopUp):addInputEvent("Mouse_LUp", "Check_PopUI()")
  ;
  (self.checkPopUp):addInputEvent("Mouse_On", "Equipment__PopUp_ShowIconToolTip(true)")
  ;
  (self.checkPopUp):addInputEvent("Mouse_Out", "Equipment__PopUp_ShowIconToolTip(false)")
  _buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowEquipment\" )")
  _buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelWindowEquipment\", \"true\")")
  _buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelWindowEquipment\", \"false\")")
  ;
  (self.btn_PetList):addInputEvent("Mouse_LUp", "FGlobal_PetListNew_Toggle()")
  ;
  (self.btn_ServantInventory):addInputEvent("Mouse_LUp", "HandleClicked_ServantInventoryOpen()")
end

local extendedSlotInfo = function(itemWrapper, SlotNo)
  -- function num : 0_19 , upvalues : equip
  local itemSSW = itemWrapper:getStaticStatus()
  local itemName = itemSSW:getName()
  local slotNoMax = itemSSW:getExtendedSlotCount()
  local extendedSlotString = ""
  local compareSlot = {}
  for i = 1, slotNoMax do
    local extendSlotNo = itemSSW:getExtendedSlotIndex(i - 1)
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R12 in 'UnsetPending'

    if slotNoMax ~= extendSlotNo then
      (equip.extendedSlotInfoArray)[extendSlotNo] = SlotNo
      setItemCount = (equip.extendedSlotInfoArray)[extendSlotNo]
      -- DECOMPILER ERROR at PC25: Confused about usage of register: R12 in 'UnsetPending'

      equip.checkExtendedSlot = 1
      compareSlot[i] = extendSlotNo
      extendedSlotString = extendedSlotString .. ", " .. (equip.slotNoId)[extendSlotNo] .. "_BG"
    end
  end
end

local setItemInfoUseWrapper = function(slot, itemWrapper, isMono, isExtended, slotNo)
  -- function num : 0_20
  slot:setItem(itemWrapper, slotNo, true)
  local itemSSW = itemWrapper:getStaticStatus()
  local enchantCount = ((itemSSW:get())._key):getEnchantLevel()
  if enchantCount > 0 and enchantCount < 16 and isExtended == false then
    (slot.enchantText):SetText("+" .. tostring(enchantCount))
    ;
    (slot.enchantText):SetShow(true)
  else
    if enchantCount == 16 and isExtended == false then
      (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
      ;
      (slot.enchantText):SetShow(true)
    else
      if enchantCount == 17 and isExtended == false then
        (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
        ;
        (slot.enchantText):SetShow(true)
      else
        if enchantCount == 18 and isExtended == false then
          (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
          ;
          (slot.enchantText):SetShow(true)
        else
          if enchantCount == 19 and isExtended == false then
            (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
            ;
            (slot.enchantText):SetShow(true)
          else
            if enchantCount == 20 and isExtended == false then
              (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
              ;
              (slot.enchantText):SetShow(true)
            else
              ;
              (slot.enchantText):SetShow(false)
            end
          end
        end
      end
    end
  end
  if (itemSSW:get()):isCash() then
    (slot.enchantText):SetShow(false)
  end
  if (CppEnums.ItemClassifyType).eItemClassify_Accessory == (itemWrapper:getStaticStatus()):getItemClassify() then
    if enchantCount == 1 and isExtended == false then
      (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
      ;
      (slot.enchantText):SetShow(true)
    else
      if enchantCount == 2 and isExtended == false then
        (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
        ;
        (slot.enchantText):SetShow(true)
      else
        if enchantCount == 3 and isExtended == false then
          (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
          ;
          (slot.enchantText):SetShow(true)
        else
          if enchantCount == 4 and isExtended == false then
            (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
            ;
            (slot.enchantText):SetShow(true)
          else
            if enchantCount == 5 and isExtended == false then
              (slot.enchantText):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
              ;
              (slot.enchantText):SetShow(true)
            end
          end
        end
      end
    end
  end
  if isExtended == false then
    (slot.icon):SetEnable(true)
  else
    ;
    (slot.icon):SetEnable(false)
  end
  if isMono == true then
    (slot.icon):SetMonoTone(true)
    ;
    (slot.enchantText):SetMonoTone(true)
  else
    if isMono == false then
      (slot.icon):SetMonoTone(false)
      ;
      (slot.enchantText):SetMonoTone(false)
    end
  end
end

Equipment_updateSlotData = function()
  -- function num : 0_21 , upvalues : equip, EquipNoMin, EquipNoMax, extendedSlotInfo, setItemInfoUseWrapper, awakenWeaponContentsOpen, isContentsEnable, alchemyStoneQuickKey, _offenceValue, _awakenOffecnValue, _defenceValue
  local self = equip
  self.extendedSlotInfoArray = {}
  self.checkExtendedSlot = 0
  for v = EquipNoMin, EquipNoMax do
    if equip_checkUseableSlot(v) == true then
      local itemWrapper = getEquipmentItem(v)
      local slot = (self.slots)[v]
      local slotBG = (self.slotBGs)[v]
      if itemWrapper ~= nil then
        extendedSlotInfo(itemWrapper, v)
        setItemInfoUseWrapper(slot, itemWrapper, false, false, v)
        local whereType = Inventory_GetCurrentInventoryType()
        slotBG:SetShow(false)
        if ToClient_EquipSlot_CheckItemLock(v, 1) == true then
          (slot.icon):addInputEvent("Mouse_On", "Equipment_MouseOn(" .. v .. ",true)")
          ;
          (slot.icon):addInputEvent("Mouse_Out", "Equipment_MouseOn(" .. v .. ",false)")
          local itemss = itemWrapper:getStaticStatus()
          do
            do
              local name = itemss:getName()
              ;
              (slot.enchantText):SetShow(false)
              slot:clearItem()
              ;
              (slot.icon):SetEnable(true)
              slotBG:SetShow(true)
              if (CppEnums.EquipSlotNo).awakenWeapon == v or (CppEnums.EquipSlotNo).avatarAwakenWeapon == v then
                slotBG:SetShow(awakenWeaponContentsOpen)
                ;
                (slot.icon):SetEnable(awakenWeaponContentsOpen)
                ;
                (slot.icon):SetShow(awakenWeaponContentsOpen)
              end
              ;
              (slot.icon):addInputEvent("Mouse_On", "Equipment_NilSlot_MouseOn(" .. v .. ",true)")
              ;
              (slot.icon):addInputEvent("Mouse_Out", "Equipment_NilSlot_MouseOn(" .. v .. ",false)")
              -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  local isSetAwakenWeapon = getEquipmentItem((CppEnums.EquipSlotNo).awakenWeapon)
  local titleSpanSizeY = (math.max)(((equip.attackText):GetSpanSize()).y, 95)
  local valueSpanSizeY = (math.max)(((equip.attackValue):GetSpanSize()).y, 70)
  if awakenWeaponContentsOpen and isSetAwakenWeapon ~= nil then
    (equip.awakenText):SetShow(true)
    ;
    (equip.awakenValue):SetShow(true)
    ;
    (equip.awakenText):SetSpanSize(0, titleSpanSizeY)
    ;
    (equip.awakenValue):SetSpanSize(0, valueSpanSizeY)
    ;
    (equip.attackText):SetSpanSize(35, titleSpanSizeY)
    ;
    (equip.defenceText):SetSpanSize(35, titleSpanSizeY)
    ;
    (equip.attackValue):SetSpanSize(25, valueSpanSizeY)
    ;
    (equip.defenceValue):SetSpanSize(25, valueSpanSizeY)
  else
    ;
    (equip.awakenText):SetShow(false)
    ;
    (equip.awakenValue):SetShow(false)
    ;
    (equip.attackText):SetSpanSize(105, titleSpanSizeY)
    ;
    (equip.defenceText):SetSpanSize(105, titleSpanSizeY)
    ;
    (equip.attackValue):SetSpanSize(95, valueSpanSizeY)
    ;
    (equip.defenceValue):SetSpanSize(95, valueSpanSizeY)
  end
  if self.checkExtendedSlot == 1 then
    for extendSlotNo,parentSlotNo in pairs(self.extendedSlotInfoArray) do
      local itemWrapper = getEquipmentItem(parentSlotNo)
      local setSlotBG = (self.slotBGs)[extendSlotNo]
      slot = (self.slots)[extendSlotNo]
      setSlotBG:SetShow(false)
      setItemInfoUseWrapper(slot, itemWrapper, true, true)
    end
  end
  do
    if not isContentsEnable then
      ((self.slotBGs)[27]):SetShow(false)
      ;
      (((self.slots)[27]).icon):SetShow(false)
      alchemyStoneQuickKey:SetShow(false)
    end
    interaction_Forceed()
    updateAttackStat()
    ;
    (self.attackValue):SetText(tostring(getOffence()))
    ;
    (self.defenceValue):SetText(tostring(getDefence()))
    ;
    (self.awakenValue):SetText(tostring(getAwakenOffence()))
    _offenceValue = getOffence()
    _awakenOffecnValue = getAwakenOffence()
    _defenceValue = getDefence()
    if Panel_Global_Manual:GetShow() then
      setFishingResourcePool_text()
    end
    if Panel_Fishing:GetShow() then
      setFishingResourcePool_text()
    end
    if getEquipmentItem(27) == nil then
      (equip.checkBox_AlchemyStone):SetShow(false)
      ;
      (equip.checkBox_AlchemyStone):SetCheck(false)
      AlchemyStone_CheckEventForSave(false)
    else
      if Panel_Window_Repair:GetShow() then
        (equip.checkBox_AlchemyStone):SetShow(false)
      else
        ;
        (equip.checkBox_AlchemyStone):SetShow(true)
      end
    end
    local alchemyStoneQuickKeyString = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_AlchemySton)
    alchemyStoneQuickKey:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_QUICKCOMMAND", "keyString", alchemyStoneQuickKeyString))
  end
end

local _awakenValue = 0
Equipment_equipItem = function(slotNo)
  -- function num : 0_22 , upvalues : equip, _offenceValue, _awakenOffecnValue, awakenWeaponContentsOpen, _defenceValue
  local self = equip
  local slot = (self.slots)[slotNo]
  if slotNo > 13 and slotNo < 24 then
    (slot.icon):AddEffect("UI_ItemInstall_Cash", false, 0, 0)
  else
    ;
    (slot.icon):AddEffect("UI_ItemInstall", false, 0, 0)
  end
  ;
  (slot.icon):AddEffect("fUI_SkillButton01", false, 0, 0)
  if slotNo < 14 or slotNo == 29 then
    (self.effectBG):AddEffect("UI_ItemInstall_BigRing", false, -0.9, -58)
  else
    ;
    (self.effectBG):AddEffect("UI_ItemInstall_BigRing02", false, -0.9, -58)
  end
  updateAttackStat()
  local itemWrapper = getEquipmentItem(slotNo)
  if itemWrapper ~= nil then
    if _offenceValue ~= getOffence() then
      (self.attackValue):AddEffect("fUI_SkillButton01", false, 0, 0)
      ;
      (self.attackValue):AddEffect("UI_SkillButton01", false, 0, 0)
    end
    if _awakenOffecnValue ~= getAwakenOffence() and awakenWeaponContentsOpen then
      (self.awakenValue):AddEffect("fUI_SkillButton01", false, 0, 0)
      ;
      (self.awakenValue):AddEffect("UI_SkillButton01", false, 0, 0)
    end
    if _defenceValue ~= getDefence() then
      (self.defenceValue):AddEffect("fUI_SkillButton01", false, 0, 0)
      ;
      (self.defenceValue):AddEffect("UI_SkillButton01", false, 0, 0)
    end
    PaGlobal_TutorialManager:handleEquipItem(slotNo)
  end
end

Equipment_onScreenResize = function()
  -- function num : 0_23
  Panel_Equipment:SetPosX(Panel_Window_Inventory:GetPosX() - Panel_Equipment:GetSizeX())
  Panel_Equipment:SetPosY(getScreenSizeY() - getScreenSizeY() / 2 - Panel_Equipment:GetSizeY() / 2)
end

equip.registMessageHandler = function(self)
  -- function num : 0_24
  registerEvent("EventEquipmentUpdate", "Equipment_updateSlotData")
  registerEvent("EventEquipItem", "Equipment_equipItem")
  registerEvent("EventPCEquipSetShow", "Equipment_SetShow")
  registerEvent("onScreenResize", "Equipment_onScreenResize")
end

Check_Cloak = function()
  -- function num : 0_25 , upvalues : equip
  selfPlayerShowCloak(not (equip.checkCloak):IsCheck())
end

Check_Helm = function()
  -- function num : 0_26 , upvalues : equip
  selfPlayerShowHelmet(not (equip.checkHelm):IsCheck())
end

Check_HelmOpen = function()
  -- function num : 0_27 , upvalues : equip
  selfPlayerShowBattleHelmet((equip.checkHelmOpen):IsCheck())
end

Check_ShowNameWhenCamouflage = function()
  -- function num : 0_28
  Toclient_setShowNameWhenCamouflage(not ((getSelfPlayer()):get()):isShowNameWhenCamouflage())
end

Check_PopUI = function()
  -- function num : 0_29 , upvalues : equip
  if (equip.checkPopUp):IsCheck() then
    Panel_Equipment:OpenUISubApp()
  else
    Panel_Equipment:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

Check_Underwear = function()
  -- function num : 0_30 , upvalues : equip
  local self = equip
  if not IsSelfPlayerWaitAction() or IsSelfPlayerBattleWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_UNDERWEAR"))
    if (self.checkUnderwear):IsCheck() then
      (self.checkUnderwear):SetCheck(false)
    else
      ;
      (self.checkUnderwear):SetCheck(true)
    end
    return 
  end
  local selfPlayer = getSelfPlayer()
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local isSafeZone = (regionInfo:get()):isSafeZone()
  Equipment_Checkbutton(20, false, equip.checkUnderwear)
  if isSafeZone then
    if (selfPlayer:get()):getUnderwearModeInhouse() then
      (selfPlayer:get()):setUnderwearModeInhouse(false)
      Toclient_setShowAvatarEquip()
    else
      ;
      (selfPlayer:get()):setUnderwearModeInhouse(true)
    end
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_EQUIP_UNDERWARE_ALERT"))
    ;
    (equip.checkUnderwear):SetCheck(false)
  end
end

FGlobal_CheckUnderwear = function()
  -- function num : 0_31 , upvalues : equip
  local self = equip
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local isSafeZone = (regionInfo:get()):isSafeZone()
  if not isSafeZone then
    (self.checkUnderwear):SetCheck(false)
  end
end

Equipment_SimpleToolTips = function(isShow, btnType, flagControl)
  -- function num : 0_32 , upvalues : equip
  if btnType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_CHECKHELM_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_CHECKHELM_DESC")
    uiControl = equip.checkHelm
  else
    if btnType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_CHECKHELMOPEN_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_CHECKHELMOPEN_DESC")
      uiControl = equip.checkHelmOpen
    else
      if btnType == 2 then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_BTN_PETLIST_NAME")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_BTN_PETLIST_DESC")
        uiControl = equip.btn_PetList
      else
        if btnType == 3 then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_BTN_SERVANTINVENTORY_NAME")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_BTN_SERVANTINVENTORY_DESC")
          uiControl = equip.btn_ServantInventory
        else
          if btnType == 4 then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_BTN_CHECKFLAG_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_BTN_CHECKFLAG_DESC")
            uiControl = (UI.getChildControl)(Panel_Equipment, (equip.avataEquipSlotId)[flagControl])
          else
            if btnType == 5 then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_BTN_CHECKFLAG_DECO_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIPS_BTN_CHECKFLAG_DECO_DESC")
              uiControl = (UI.getChildControl)(Panel_Equipment, (equip.avataEquipSlotId)[flagControl])
            else
              if btnType == 6 then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIP_CLOAK_NAME")
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_TOOLTIP_CLOAK_DESC")
                uiControl = equip.checkCloak
              else
                if btnType == 7 then
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_UNDERWEAR_TOOLTIP_NAME")
                  desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_UNDERWEAR_TOOLTIP_DESC")
                  uiControl = equip.checkCloak
                else
                  if btnType == 8 then
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_CAMOUFLAGE_TOOLTIP_NAME")
                    desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_CAMOUFLAGE_TOOLTIP_DESC")
                    uiControl = equip.checkCamouflage
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

Equipment_StatValueTooltips = function(isShow, tipType)
  -- function num : 0_33 , upvalues : equip
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local self = equip
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "CHARACTERINFO_TEXT_ATTACK")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_ATTACK_TEXT_TOOLTIP_DESC")
    control = self.attackText
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "CHARACTERINFO_TEXT_DEFENCE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_DEFENCE_TEXT_TOOLTIP_DESC")
      control = self.defenceText
    else
      if tipType == 2 then
        name = PAGetString(Defines.StringSheet_RESOURCE, "EQUIPMENT_TOOLTIP_AWAKEN_TITLE")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AWAKEN_TEXT_TOOLTIP_DESC")
        control = self.awakenText
      end
    end
  end
  TooltipSimple_Show(control, name, desc)
end

HandleClicked_ServantInventoryOpen = function()
  -- function num : 0_34
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local isFreeBattle = (selfPlayer:get()):isBattleGroundDefine()
  if GetUIMode() == (Defines.UIMode).eUIMode_Repair then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_REPAIRMODENOOPENINVENTORY"))
    return 
  end
  if selfplayerIsInHorseRace() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ICON_MAID_DONT_OPEN_SERVENTINVENTORY"))
    return 
  end
  if isFreeBattle == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_FREEBATTLE_NOT_USE"))
    return 
  end
  Panel_Window_ServantInventory:SetPosX(getScreenSizeX() - Panel_Equipment:GetSizeX() - Panel_Equipment:GetPosX())
  Panel_Window_ServantInventory:SetPosY(getScreenSizeY() - Panel_Equipment:GetSizeY() - Panel_Equipment:GetPosY())
  ServantInventory_OpenAll()
end

FromClient_ChangeUnderwearMode_Equipment = function(isUnderwearModeInHouse)
  -- function num : 0_35 , upvalues : equip
  local self = equip
  ;
  (self.checkUnderwear):SetCheck(isUnderwearModeInHouse)
end

FGlobal_AlchemyStonCheck = function()
  -- function num : 0_36 , upvalues : equip
  local itemWrapper = getEquipmentItem(27)
  local coolTime = 0
  do
    if itemWrapper ~= nil and (equip.checkBox_AlchemyStone):IsCheck() then
      local alchemyStoneType = ((itemWrapper:getStaticStatus()):get())._contentsEventParam1
      if alchemyStoneType == 0 or alchemyStoneType == 3 then
        coolTime = 182
      else
        if alchemyStoneType == 1 or alchemyStoneType == 4 then
          coolTime = 182
        else
          if alchemyStoneType == 2 or alchemyStoneType == 5 then
            coolTime = 602
          end
        end
      end
    end
    return coolTime
  end
end

FGlobal_AccSlotNo = function(itemWrapper, isChange)
  -- function num : 0_37 , upvalues : equip
  local equipType = (itemWrapper:getStaticStatus()):getEquipType()
  local firstRingOffence = 0
  local firstRingDeffence = 0
  local secondRingOffence = 0
  local secondRingDeffence = 0
  local acc = nil
  if equipType == 16 then
    equipItemWrapper = getEquipmentItem(8)
    equipItemWrapper2 = getEquipmentItem(9)
    if equipItemWrapper ~= nil and equipItemWrapper2 ~= nil then
      acc = 8 + equip.slotRingIndex
      -- DECOMPILER ERROR at PC35: Confused about usage of register: R8 in 'UnsetPending'

      if isChange then
        if equip.slotRingIndex == 0 then
          equip.slotRingIndex = 1
        else
          -- DECOMPILER ERROR at PC38: Confused about usage of register: R8 in 'UnsetPending'

          equip.slotRingIndex = 0
        end
      end
    else
      -- DECOMPILER ERROR at PC47: Confused about usage of register: R8 in 'UnsetPending'

      if equipItemWrapper == nil and equipItemWrapper2 ~= nil then
        equip.slotRingIndex = 0
        acc = 8
      else
        -- DECOMPILER ERROR at PC57: Confused about usage of register: R8 in 'UnsetPending'

        if equipItemWrapper ~= nil and equipItemWrapper2 == nil then
          equip.slotRingIndex = 0
          acc = 9
        else
          -- DECOMPILER ERROR at PC61: Confused about usage of register: R8 in 'UnsetPending'

          equip.slotRingIndex = 0
          acc = 8
        end
      end
    end
  else
    if equipType == 17 then
      equipItemWrapper = getEquipmentItem(10)
      equipItemWrapper2 = getEquipmentItem(11)
      if equipItemWrapper ~= nil and equipItemWrapper2 ~= nil then
        acc = 10 + equip.slotEaringIndex
        -- DECOMPILER ERROR at PC90: Confused about usage of register: R8 in 'UnsetPending'

        if isChange then
          if equip.slotEaringIndex == 0 then
            equip.slotEaringIndex = 1
          else
            -- DECOMPILER ERROR at PC93: Confused about usage of register: R8 in 'UnsetPending'

            equip.slotEaringIndex = 0
          end
        end
      else
        if equipItemWrapper == nil and equipItemWrapper2 ~= nil then
          acc = 10
        else
          if equipItemWrapper ~= nil and equipItemWrapper2 == nil then
            acc = 11
          else
            acc = 10
          end
        end
      end
    end
  end
  return acc
end

local posXDefault = 345
Equipment_RePosition = function()
  -- function num : 0_38 , upvalues : equip, posXDefault
  local self = equip
  if (self.checkCloak):GetShow() then
    (self.checkCloak):SetPosX(posXDefault)
    posXDefault = posXDefault - 30
  end
  if (self.checkHelm):GetShow() then
    (self.checkHelm):SetPosX(posXDefault)
    posXDefault = posXDefault - 30
  end
  if (self.checkHelmOpen):GetShow() then
    (self.checkHelmOpen):SetPosX(posXDefault)
    posXDefault = posXDefault - 30
  end
  if (self.btn_PetList):GetShow() then
    (self.btn_PetList):SetPosX(posXDefault)
    posXDefault = posXDefault - 30
  end
  if (self.checkUnderwear):GetShow() then
    (self.checkUnderwear):SetPosX(posXDefault)
    posXDefault = posXDefault - 30
  end
  if (self.checkCamouflage):GetShow() then
    (self.checkCamouflage):SetPosX(posXDefault)
    posXDefault = posXDefault - 30
  end
  if (self.btn_ServantInventory):GetShow() then
    (self.btn_ServantInventory):SetPosX(posXDefault)
    posXDefault = posXDefault - 30
  end
end

Equipment_Checkbutton = function(index, isShow, controlBtn)
  -- function num : 0_39 , upvalues : equip
  if index ~= 20 then
    return 
  end
  if isShow == false then
    local itemWrapper = getEquipmentItem(index)
    if itemWrapper == nil then
      controlBtn:SetCheck(false)
      return 
    end
  else
    do
      if index == 20 then
        local selfPlayer = getSelfPlayer()
        ;
        (selfPlayer:get()):setUnderwearModeInhouse(false)
        Toclient_setShowAvatarEquip()
        ;
        (equip.checkUnderwear):SetCheck(false)
      end
    end
  end
end

Equipment__PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_40 , upvalues : equip
  if isShow then
    local self = equip
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if (self.checkPopUp):IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(self.checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

equip:initControl()
equip:registEventHandler()
equip:registMessageHandler()
registerEvent("FromClient_ChangeUnderwearModeInHouse", "FromClient_ChangeUnderwearMode_Equipment")

