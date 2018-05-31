-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\inventory\console\panel_window_inventory_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_Inventory
local _isInitialized = false
local UPPER_TAB_TYPE = {UNDEFINED = 0, EQUIPMENT = 1, COSTUME = 2, INFORMATION = 3, SERVANT = 4, AUXILIARY = 5}
local LOWER_TAB_TYPE = {UNDEFINED = 0, INVENTORY = 1, CASH_INVEN = 2}
local WHERE_TYPE = {INVENTORY = (CppEnums.ItemWhereType).eInventory, EQUIPMENT = (CppEnums.ItemWhereType).eEquip, WAREHOUSE = (CppEnums.ItemWhereType).eWarehouse, SERVANT_INVEN = (CppEnums.ItemWhereType).eServantInventory, SERVANT_EQUIP = (CppEnums.ItemWhereType).eServantEquip, GUILD_WAREHOUSE = (CppEnums.ItemWhereType).eGuildWarehouse, CASH_INVEN = (CppEnums.ItemWhereType).eCashInventory, INVEN_BAG = (CppEnums.ItemWhereType).eInventoryBag, CASH_INVEN_BAG = (CppEnums.ItemWhereType).eCashInventoryBag}
local UI_color = Defines.Color
local InventoryInfo = {_haveExtentedSlot; 
_ui = {stc_windowTopEnd = (UI.getChildControl)(_panel, "Static_WindowTopEnd"), stc_rotateDeco1 = nil, stc_rotateDeco2 = nil, stc_topEndPictogram = nil, txt_topEndTitle = nil, stc_subWindowMoney = (UI.getChildControl)(_panel, "Static_SubWindowMoney"), stc_silverIcon = nil, txt_Silver = nil, txt_Pearl = nil, txt_Mileage = nil, stc_subWindowUpper = (UI.getChildControl)(_panel, "Static_SubWindowUpper"), stc_upperBorderLeft = nil, stc_upperBorderRight = nil, groups = nil, stc_topEndBorder = (UI.getChildControl)(_panel, "Static_TopEndBorder"), rdo_tabButtons = nil, equipSlotTemplate = nil, costumeSlotTemplate = nil, invenSlotTemplate = nil, servantInvenSlotTemplate = nil, servantEquipSlotTemplate = nil, servantCostumeSlotTemplate = nil, stc_EquipBG = nil, txt_attackValue = nil, txt_awakenAttackValue = nil, txt_defenceValue = nil, chk_autoActive = nil, chk_hideHelmet = nil, chk_openHelmet = nil, chk_showUnderwear = nil, chk_toggleCloak = nil, chk_toggleNameWhenCamo = nil, frame_characterInfo = nil, stc_characterInfoBG = nil, txt_resistValues = nil, txt_fitnessSubtitles = nil, txt_fitnessValues = nil, setItemEffectTitleList = nil, setItemEffectValueList = nil, frame_setEffect = nil, stc_setEffectBG = nil, stc_noSetEffect = nil, frame_servantInven = nil, stc_servantInfoBG = nil, stc_contentBG = nil, txt_servantName = nil, progress2_servantWeight = nil, txt_servantInvenCountDisplay = nil, txt_servantWeightValue = nil, stc_horseWeight = nil, txt_servantEquipInfo = nil, txt_servantCostumeInfo = nil, txt_noServant = nil, stc_subWindowLower = (UI.getChildControl)(_panel, "Static_SubWindowLower"), stc_itemSlotTemplate = nil, stc_highlight = nil, txt_invenName = nil, scroll_inven = nil, stc_invenBG = nil, stc_plusSlot = nil, 
stc_lockedSlots = {}
, 
invenSlots = {}
, 
stc_invenSlotBG = {}
, stc_weightBarBG = (UI.getChildControl)(_panel, "Static_WeightBarBG"), progress2_Weight = nil, progress2_Equipment = nil, progress2_Silver = nil, stc_designator = nil, stc_designatorImage = nil, stc_designatorFlippedImage = nil, txt_weightGlow = nil, txt_weight = nil, stc_xBoxKey_LB = (UI.getChildControl)(_panel, "Static_XBoxKey_LB"), stc_xBoxKey_RB = (UI.getChildControl)(_panel, "Static_XBoxKey_RB"), stc_xBoxKey_LT = nil, stc_xBoxKey_RT = nil, 
equipSlotBG = {}
, 
equipSlots = {}
, 
costumeSlotBG = {}
, 
costumeSlots = {}
, 
potencialBars = {}
, 
stc_servantInvenSlotBG = {}
, 
servantInvenSlots = {}
, 
stc_servantEquipSlotBG = {}
, 
servantEquipSlots = {}
, 
stc_servantCostumeSlotBG = {}
, 
servantCostumeSlots = {}
, txt_KeyGuideY = nil}
, _isAutoSort = false, _rotateVal1 = 45, _rotateVal2 = 0, _tabXGab = 80, _resistCount = 4, _fitnessCount = 3, _setItemEffectTitleCount = nil, _setItemEffectValueCount = nil, _setItemEffectData = nil, _invenSlotColumnMax = 8, _invenSlotRowMax = 9, _invenSlotMax = 72, _invenStartSlotIndex = 0, 
_slotEtcData = {}
, _servantInvenSlotMax = 50, _servantEquipSlotMax = 6, _defaultXGap = 54, _defaultYGap = 54, _weightDesignatorTarget = nil, _weightDesignatorIsAnimating = false, _servantActorKeyRaw = nil, _tooltipWhereType = nil, _tooltipSlotNo = nil, _rClickFunc = nil, _filterFunc = nil, _otherWindowOpenFunc = nil, _effect = nil, _currentUpperTab = 0, 
_upperTabsData = {
[UPPER_TAB_TYPE.EQUIPMENT] = {}
, 
[UPPER_TAB_TYPE.COSTUME] = {}
, 
[UPPER_TAB_TYPE.INFORMATION] = {}
, 
[UPPER_TAB_TYPE.SERVANT] = {}
, 
[UPPER_TAB_TYPE.AUXILIARY] = {}
}
, _currentLowerTab = 0, 
_lowerTabData = {
[LOWER_TAB_TYPE.INVENTORY] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_RENEW_INVENTORY"), whereType = WHERE_TYPE.INVENTORY}
, 
[LOWER_TAB_TYPE.CASH_INVEN] = {name = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_RENEW_PEARLINVEN"), whereType = WHERE_TYPE.CASH_INVEN}
}
, 
_equipSlotIndex = {0, 6, 10, 11, 7, 27, 1, 3, 4, 8, 9, 2, 29, 5, 12, 31, 13}
, 
_costumeSlotIndex = {14, 15, 16, 17, 18, 19, 20, 22, 23, 21, 30}
, 
_configForInven = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCooltime = true, createExpiration = true, createExpirationBG = true, createExpiration2h = true, createClassEquipBG = true, createEnduranceIcon = true, createCooltimeText = true, createCash = true, createItemLock = true, createBagIcon = true, createSoulComplete = true}
, 
_configForEquip = {createIcon = true, createBorder = true, createCount = false, createCash = true, createEnchant = true, createEnduranceIcon = true, createItemLock = true}
, 
_configForCostume = {createIcon = true, createBorder = true, createCount = false, createCash = true, createEnchant = true, createEnduranceIcon = true, createItemLock = true}
, _slotRingIndex = 0, _slotEarringIndex = 0, _showAniIsPlaying = false, _showAniElapsed = 0, _showAniDuration = 0.3, _monitorItemCooltime = false, 
_extendedSlotArray = {}
}
local _avatarCheckFlag = {[14] = 1, [15] = 2, [16] = 4, [17] = 8, [18] = 32, [19] = 64, [20] = 16, [22] = 256, [23] = 512, [21] = 128, [3] = 65536, [4] = 131072, [5] = 262144, [6] = 524288, [0] = 2097152, [1] = 4194304, [30] = 1024}
local _awakenWeaponContentsOption = {[(CppEnums.ClassType).ClassType_Warrior] = ToClient_IsContentsGroupOpen("901"), [(CppEnums.ClassType).ClassType_Ranger] = ToClient_IsContentsGroupOpen("902"), [(CppEnums.ClassType).ClassType_Sorcerer] = ToClient_IsContentsGroupOpen("903"), [(CppEnums.ClassType).ClassType_Giant] = ToClient_IsContentsGroupOpen("904"), [(CppEnums.ClassType).ClassType_Tamer] = ToClient_IsContentsGroupOpen("905"), [(CppEnums.ClassType).ClassType_BladeMaster] = ToClient_IsContentsGroupOpen("906"), [(CppEnums.ClassType).ClassType_BladeMasterWomen] = ToClient_IsContentsGroupOpen("907"), [(CppEnums.ClassType).ClassType_Valkyrie] = ToClient_IsContentsGroupOpen("908"), [(CppEnums.ClassType).ClassType_Wizard] = ToClient_IsContentsGroupOpen("909"), [(CppEnums.ClassType).ClassType_WizardWomen] = ToClient_IsContentsGroupOpen("910"), [(CppEnums.ClassType).ClassType_NinjaMan] = ToClient_IsContentsGroupOpen("911"), [(CppEnums.ClassType).ClassType_NinjaWomen] = ToClient_IsContentsGroupOpen("912"), [(CppEnums.ClassType).ClassType_DarkElf] = ToClient_IsContentsGroupOpen("913"), [(CppEnums.ClassType).ClassType_Combattant] = ToClient_IsContentsGroupOpen("914"), [(CppEnums.ClassType).ClassType_CombattantWomen] = ToClient_IsContentsGroupOpen("918"), [(CppEnums.ClassType).ClassType_Lahn] = ToClient_IsContentsGroupOpen("916"), [(CppEnums.ClassType).ClassType_Orange] = ToClient_IsContentsGroupOpen("943")}
local _equipSlotNoIdToString = {[0] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_MAINHAND"), [1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_SUBHAND"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_GATHERTOOLS"), [3] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_UPPERBODY"), [4] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_GLOVES"), [5] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_BOOTS"), [6] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_HELM"), [7] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_NECKLACE"), [8] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"), [9] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"), [10] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"), [11] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"), [12] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_WAISTBAND"), [13] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_LANTERN"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_BODY"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HANDS"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_BOOTS"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HELM"), [18] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_MAIN"), [19] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_SUB"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_UNDERWEAR"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_EYES"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_MOUSE"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HEAD"), [27] = PAGetString(Defines.StringSheet_GAME, "Lua_equipSlotNo_String_alchemyStone"), [29] = PAGetString(Defines.StringSheet_GAME, "Lua_equipSlotNo_String_awakenWeapon"), [30] = PAGetString(Defines.StringSheet_GAME, "Lua_equipSlotNo_String_avatarAwakenWeapon"), [31] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_QUESTBOOK")}
local SERVANT_TYPE = {HORSE_AND_ETC = 1, CARRIAGE = 2, SMALL_SHIP = 3, BIG_SHIP = 4}
local _vehicleTypeToSERVANT_TYPE = {[(CppEnums.VehicleType).Type_Horse] = SERVANT_TYPE.HORSE_AND_ETC, [(CppEnums.VehicleType).Type_Camel] = SERVANT_TYPE.HORSE_AND_ETC, [(CppEnums.VehicleType).Type_Donkey] = SERVANT_TYPE.HORSE_AND_ETC, [(CppEnums.VehicleType).Type_Elephant] = SERVANT_TYPE.HORSE_AND_ETC, [(CppEnums.VehicleType).Type_RidableBabyElephant] = SERVANT_TYPE.HORSE_AND_ETC, [(CppEnums.VehicleType).Type_Carriage] = SERVANT_TYPE.CARRIAGE, [(CppEnums.VehicleType).Type_CowCarriage] = SERVANT_TYPE.CARRIAGE, [(CppEnums.VehicleType).Type_Train] = SERVANT_TYPE.CARRIAGE, [(CppEnums.VehicleType).Type_RepairableCarriage] = SERVANT_TYPE.CARRIAGE, [(CppEnums.VehicleType).Type_SailingBoat] = SERVANT_TYPE.BIG_SHIP, [(CppEnums.VehicleType).Type_PersonalBattleShip] = SERVANT_TYPE.BIG_SHIP, [(CppEnums.VehicleType).Type_PersonTradeShip] = SERVANT_TYPE.BIG_SHIP, [(CppEnums.VehicleType).Type_PersonalBoat] = SERVANT_TYPE.BIG_SHIP, [(CppEnums.VehicleType).Type_Boat] = SERVANT_TYPE.SMALL_SHIP, [(CppEnums.VehicleType).Type_Raft] = SERVANT_TYPE.SMALL_SHIP, [(CppEnums.VehicleType).Type_FishingBoat] = SERVANT_TYPE.SMALL_SHIP}
local _servantData = {
[SERVANT_TYPE.HORSE_AND_ETC] = {
equipSlotNoList = {3, 4, 5, 6, 12}
, 
costumeSlotNoList = {14, 15, 16, 17}
, 
pictogramUV = {
[3] = {259, 87, 301, 129}
, 
[4] = {259, 173, 301, 215}
, 
[5] = {259, 44, 301, 86}
, 
[6] = {259, 130, 301, 172}
, 
[12] = {259, 216, 301, 258}
, 
[14] = {302, 87, 344, 129}
, 
[15] = {302, 173, 344, 215}
, 
[16] = {302, 44, 344, 86}
, 
[17] = {302, 130, 344, 172}
}
, 
checkFlag = {[3] = 1, [4] = 2, [5] = 4, [6] = 8, [14] = 16, [15] = 32, [16] = 64, [17] = 128}
}
, 
[SERVANT_TYPE.CARRIAGE] = {
equipSlotNoList = {4, 5, 6, 13, 25}
, 
costumeSlotNoList = {14, 15, 26}
, 
pictogramUV = {
[4] = {173, 173, 215, 215}
, 
[5] = {130, 302, 172, 344}
, 
[6] = {87, 302, 129, 344}
, 
[13] = {44, 44, 86, 86}
, 
[25] = {173, 216, 215, 258}
, 
[14] = {216, 216, 258, 258}
, 
[15] = {216, 173, 258, 215}
, 
[16] = {302, 87, 344, 129}
, 
[17] = {302, 87, 344, 129}
, 
[26] = {130, 173, 172, 215}
}
}
, 
[SERVANT_TYPE.BIG_SHIP] = {
equipSlotNoList = {3, 4, 5, 12, 25}
, 
costumeSlotNoList = {14, 15, 16, 26}
, 
pictogramUV = {
[3] = {87, 259, 129, 301}
, 
[4] = {1, 216, 43, 258}
, 
[5] = {173, 259, 215, 301}
, 
[12] = {173, 302, 215, 344}
, 
[25] = {1, 259, 43, 301}
, 
[14] = {130, 259, 172, 301}
, 
[15] = {44, 216, 86, 258}
, 
[16] = {216, 259, 258, 301}
, 
[26] = {44, 259, 86, 301}
}
}
, 
[SERVANT_TYPE.SMALL_SHIP] = {
equipSlotNoList = {4, 5, 6, 25}
, 
costumeSlotNoList = {14, 15, 16, 26}
, 
pictogramUV = {
[4] = {1, 216, 43, 258}
, 
[5] = {173, 173, 215, 215}
, 
[6] = {173, 173, 215, 215}
, 
[25] = {1, 259, 43, 301}
, 
[14] = {130, 259, 172, 301}
, 
[15] = {44, 216, 86, 258}
, 
[16] = {44, 302, 86, 344}
, 
[26] = {44, 259, 86, 301}
}
, 
checkFlag = {[4] = 2, [5] = 4, [6] = 8, [25] = 128, [14] = 16, [15] = 32, [16] = 64, [26] = 256}
}
}
local _equipPictogramUV = {
[0] = {1, 87, 43, 129}
, 
[1] = {87, 87, 129, 129}
, 
[2] = {1, 44, 43, 86}
, 
[3] = {130, 87, 172, 129}
, 
[4] = {130, 44, 172, 86}
, 
[5] = {173, 1, 215, 43}
, 
[6] = {87, 44, 129, 86}
, 
[7] = {130, 1, 172, 43}
, 
[8] = {1, 1, 43, 43}
, 
[9] = {1, 1, 43, 43}
, 
[10] = {44, 1, 86, 43}
, 
[11] = {44, 1, 86, 43}
, 
[12] = {87, 1, 129, 43}
, 
[13] = {44, 44, 86, 86}
, 
[14] = {44, 130, 86, 172}
, 
[15] = {87, 130, 129, 172}
, 
[16] = {216, 1, 258, 43}
, 
[17] = {1, 130, 43, 172}
, 
[18] = {173, 130, 215, 172}
, 
[19] = {130, 130, 172, 172}
, 
[20] = {216, 44, 258, 86}
, 
[22] = {1, 173, 43, 215}
, 
[23] = {44, 173, 86, 215}
, 
[21] = {216, 130, 258, 172}
, 
[27] = {173, 44, 215, 86}
, 
[29] = {44, 87, 86, 129}
, 
[30] = {87, 173, 129, 215}
, 
[31] = {173, 87, 215, 129}
}
local over_SlotEffect = nil
local effectScene = {
newItem = {}
}
FromClient_luaLoadComplete_InventoryInfo_Init = function()
  -- function num : 0_0 , upvalues : InventoryInfo
  InventoryInfo:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_InventoryInfo_Init")
InventoryInfo.initialize = function(self)
  -- function num : 0_1 , upvalues : _panel, _isInitialized
  local traceImage = (UI.getChildControl)(_panel, "Static_TraceImage")
  traceImage:SetShow(false)
  _panel:setGlassBackground(true)
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_topEndPictogram = (UI.getChildControl)((self._ui).stc_windowTopEnd, "Static_TitlePicto")
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_topEndTitle = (UI.getChildControl)((self._ui).stc_windowTopEnd, "StaticText_Title")
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_Silver = (UI.getChildControl)((self._ui).stc_subWindowMoney, "StaticText_Silver")
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_Pearl = (UI.getChildControl)((self._ui).stc_subWindowMoney, "StaticText_Pearl")
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).txt_Mileage = (UI.getChildControl)((self._ui).stc_subWindowMoney, "StaticText_Mileage")
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_silverIcon = (UI.getChildControl)((self._ui).stc_subWindowMoney, "Static_SilverIcon")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).rdo_tabButtons = {}
  local radioButtonCount = 4
  for ii = 1, radioButtonCount do
    -- DECOMPILER ERROR at PC78: Confused about usage of register: R7 in 'UnsetPending'

    ((self._ui).rdo_tabButtons)[ii] = (UI.getChildControl)((self._ui).stc_topEndBorder, "RadioButton_" .. ii)
  end
  local rdoBtnsStartX = _panel:GetSizeX() / 2 - self._tabXGab * radioButtonCount / 2 + self._tabXGab / 2 - (((self._ui).rdo_tabButtons)[1]):GetSizeX() / 2
  for ii = 1, radioButtonCount do
    (((self._ui).rdo_tabButtons)[ii]):SetPosX(rdoBtnsStartX + self._tabXGab * (ii - 1))
  end
  -- DECOMPILER ERROR at PC142: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).groups = {[1] = (UI.getChildControl)((self._ui).stc_subWindowUpper, "Static_EquipGroup"), [2] = (UI.getChildControl)((self._ui).stc_subWindowUpper, "Static_PearlGroup"), [3] = (UI.getChildControl)((self._ui).stc_subWindowUpper, "Static_InformationGroup"), [4] = (UI.getChildControl)((self._ui).stc_subWindowUpper, "Static_ServantGroup")}
  -- DECOMPILER ERROR at PC150: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).stc_upperBorderLeft = (UI.getChildControl)((self._ui).stc_subWindowUpper, "Static_SubWindowBorderLeft")
  -- DECOMPILER ERROR at PC158: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).stc_upperBorderRight = (UI.getChildControl)((self._ui).stc_subWindowUpper, "Static_SubWindowBorderRight")
  -- DECOMPILER ERROR at PC166: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).txt_bagName = (UI.getChildControl)((self._ui).stc_subWindowLower, "StaticText_BagName")
  -- DECOMPILER ERROR at PC174: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).progress2_Weight = (UI.getChildControl)((self._ui).stc_weightBarBG, "Progress2_Weight")
  -- DECOMPILER ERROR at PC182: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).progress2_Equipment = (UI.getChildControl)((self._ui).stc_weightBarBG, "Progress2_Equipment")
  -- DECOMPILER ERROR at PC190: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).progress2_Silver = (UI.getChildControl)((self._ui).stc_weightBarBG, "Progress2_Silver")
  -- DECOMPILER ERROR at PC198: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).stc_designator = (UI.getChildControl)((self._ui).stc_weightBarBG, "Static_DesignatorGroup")
  -- DECOMPILER ERROR at PC206: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).stc_designatorImage = (UI.getChildControl)((self._ui).stc_designator, "Static_Designator")
  -- DECOMPILER ERROR at PC214: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).stc_designatorFlippedImage = (UI.getChildControl)((self._ui).stc_designator, "Static_DesignatorFlipped")
  -- DECOMPILER ERROR at PC222: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).txt_weightGlow = (UI.getChildControl)((self._ui).stc_designator, "StaticText_ValueGlow")
  -- DECOMPILER ERROR at PC230: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).txt_weight = (UI.getChildControl)((self._ui).stc_designator, "StaticText_Value")
  -- DECOMPILER ERROR at PC238: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).stc_xBoxKey_LT = (UI.getChildControl)((self._ui).stc_subWindowLower, "Static_XBoxKey_LT")
  -- DECOMPILER ERROR at PC246: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._ui).stc_xBoxKey_RT = (UI.getChildControl)((self._ui).stc_subWindowLower, "Static_XBoxKey_RT")
  self:initEquipmentUIControls()
  self:initCostumeUIControls()
  self:initInformationUIControl()
  self:initServantUIControl()
  self:initInventory()
  self:registEventHandler()
  self:registMessageHandler()
  _isInitialized = true
end

InventoryInfo.initEquipmentUIControls = function(self)
  -- function num : 0_2 , upvalues : UPPER_TAB_TYPE, _equipPictogramUV, WHERE_TYPE
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).equipSlotBG = {}
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).equipSlotTemplate = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.EQUIPMENT], "Static_EquipSlotTemplate")
  local xSize, ySize = 55, 54
  local startX, startY = ((self._ui).equipSlotTemplate):GetPosX(), ((self._ui).equipSlotTemplate):GetPosY()
  local columnMax = 6
  local slotPos = {}
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R7 in 'UnsetPending'

  if (self._ui).stc_EquipBG == nil then
    (self._ui).stc_EquipBG = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.EQUIPMENT], "Static_EquipBG")
  end
  for ii = 1, 32 do
    if (self._equipSlotIndex)[ii] ~= nil then
      slotPos[ii] = (UI.getChildControl)((self._ui).stc_EquipBG, "Static_Slot_" .. (self._equipSlotIndex)[ii])
      if slotPos[ii] ~= nil then
        (slotPos[ii]):SetShow(false)
      end
    end
  end
  local lanternSlot = (UI.getChildControl)((self._ui).stc_EquipBG, "Static_Slot_13")
  lanternSlot:SetShow(false)
  for ii = 1, #self._equipSlotIndex do
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R12 in 'UnsetPending'

    ((self._ui).equipSlotBG)[ii] = (UI.cloneControl)((self._ui).equipSlotTemplate, (self._ui).stc_EquipBG, "equipSlotBG_" .. ii)
    local slotBG = ((self._ui).equipSlotBG)[ii]
    local slotIndex = (self._equipSlotIndex)[ii]
    if slotIndex == 13 then
      slotBG:SetPosX(startX + (ii - 1) % columnMax * xSize + self._defaultXGap)
    else
      slotBG:SetPosX(startX + (ii - 1) % columnMax * xSize)
    end
    slotBG:SetPosY(startY + (math.floor)((ii - 1) / columnMax) * ySize)
    local pictogram = (UI.getChildControl)(slotBG, "Static_ItemPictogram")
    if (self._equipSlotIndex)[ii] ~= nil then
      local x1, y1, x2, y2 = setTextureUV_Func(pictogram, (_equipPictogramUV[(self._equipSlotIndex)[ii]])[1], (_equipPictogramUV[(self._equipSlotIndex)[ii]])[2], (_equipPictogramUV[(self._equipSlotIndex)[ii]])[3], (_equipPictogramUV[(self._equipSlotIndex)[ii]])[4])
      ;
      (pictogram:getBaseTexture()):setUV(x1, y1, x2, y2)
      pictogram:setRenderTexture(pictogram:getBaseTexture())
      -- DECOMPILER ERROR at PC172: Confused about usage of register: R19 in 'UnsetPending'

      ;
      ((self._ui).equipSlots)[ii] = {}
      local slot = ((self._ui).equipSlots)[ii]
      ;
      (SlotItem.new)(slot, "equipSlot_" .. ii, ii, slotBG, self._configForEquip)
      slot.equipSlotNoList = (self._equipSlotIndex)[ii]
      slot.pictogram = pictogram
      slot:createChild()
      ;
      (slot.icon):addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. (self._equipSlotIndex)[ii] .. ")")
      ;
      (slot.icon):addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. (self._equipSlotIndex)[ii] .. ")")
      ;
      (slot.icon):addInputEvent("Mouse_On", "InputMOn_InventoryInfo_equipShowTooltip(" .. (self._equipSlotIndex)[ii] .. ", true)")
      ;
      (slot.icon):addInputEvent("Mouse_Out", "InputMOn_InventoryInfo_equipShowTooltip(" .. (self._equipSlotIndex)[ii] .. ", false)")
      Panel_Tooltip_Item_SetPosition((self._equipSlotIndex)[ii], slot, "equipment")
    end
  end
  ;
  ((self._ui).equipSlotTemplate):SetShow(false)
  -- DECOMPILER ERROR at PC256: Confused about usage of register: R8 in 'UnsetPending'

  ;
  (self._ui).txt_attackValue = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.EQUIPMENT], "StaticText_AttackPowerValue")
  -- DECOMPILER ERROR at PC267: Confused about usage of register: R8 in 'UnsetPending'

  ;
  (self._ui).txt_awakenAttackValue = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.EQUIPMENT], "StaticText_AwakenAttackPowerValue")
  -- DECOMPILER ERROR at PC278: Confused about usage of register: R8 in 'UnsetPending'

  ;
  (self._ui).txt_defenceValue = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.EQUIPMENT], "StaticText_DefencePowerValue")
  -- DECOMPILER ERROR at PC289: Confused about usage of register: R8 in 'UnsetPending'

  ;
  (self._ui).chk_autoActive = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.EQUIPMENT], "CheckButton_AutoActive")
  ;
  ((self._ui).chk_autoActive):addInputEvent("Mouse_LUp", "Input_InventoryInfo_AutoActive()")
end

InventoryInfo.initCostumeUIControls = function(self)
  -- function num : 0_3 , upvalues : UPPER_TAB_TYPE, _equipPictogramUV, WHERE_TYPE
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).costumeSlotBG = {}
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).costumeSlotTemplate = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.COSTUME], "Static_CostumeSlotTemplate")
  local xSize, ySize = 55, 54
  local startX, startY = ((self._ui).costumeSlotTemplate):GetPosX(), ((self._ui).costumeSlotTemplate):GetPosY()
  local columnMax = 4
  for ii = 1, #self._costumeSlotIndex do
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R10 in 'UnsetPending'

    ((self._ui).costumeSlotBG)[ii] = (UI.cloneControl)((self._ui).costumeSlotTemplate, ((self._ui).groups)[UPPER_TAB_TYPE.COSTUME], "costumeSlotBG_" .. ii)
    local slotBG = ((self._ui).costumeSlotBG)[ii]
    slotBG:SetPosX(startX + (ii - 1) % columnMax * xSize)
    slotBG:SetPosY(startY + (math.floor)((ii - 1) / columnMax) * ySize)
    local pictogram = (UI.getChildControl)(slotBG, "Static_ItemPictogram")
    local x1, y1, x2, y2 = setTextureUV_Func(pictogram, (_equipPictogramUV[(self._costumeSlotIndex)[ii]])[1], (_equipPictogramUV[(self._costumeSlotIndex)[ii]])[2], (_equipPictogramUV[(self._costumeSlotIndex)[ii]])[3], (_equipPictogramUV[(self._costumeSlotIndex)[ii]])[4])
    ;
    (pictogram:getBaseTexture()):setUV(x1, y1, x2, y2)
    pictogram:setRenderTexture(pictogram:getBaseTexture())
    local slot = {}
    ;
    (SlotItem.new)(slot, "costumeSlot_" .. ii, ii, slotBG, self._configForCostume)
    slot.costumeSlotNoList = (self._costumeSlotIndex)[ii]
    slot:createChild()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. (self._costumeSlotIndex)[ii] .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. (self._costumeSlotIndex)[ii] .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "InputMOn_InventoryInfo_equipShowTooltip(" .. (self._costumeSlotIndex)[ii] .. ", true)")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "InputMOn_InventoryInfo_equipShowTooltip(" .. (self._costumeSlotIndex)[ii] .. ", false)")
    slot.pictogram = pictogram
    slot.toggleButton = (UI.getChildControl)(slotBG, "CheckButton_ShowToggle")
    ;
    (slot.toggleButton):addInputEvent("Mouse_LUp", "Input_InventoryInfo_CostumeShowToggle(" .. ii .. ")")
    slotBG:SetChildOrder((slot.icon):GetKey(), (slot.toggleButton):GetKey())
    Panel_Tooltip_Item_SetPosition((self._costumeSlotIndex)[ii], slot, "equipment")
    -- DECOMPILER ERROR at PC193: Confused about usage of register: R17 in 'UnsetPending'

    ;
    ((self._ui).costumeSlots)[ii] = slot
  end
  ;
  ((self._ui).costumeSlotTemplate):SetShow(false)
  -- DECOMPILER ERROR at PC210: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui).chk_HideHelmet = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleHelmet")
  -- DECOMPILER ERROR at PC221: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui).chk_openHelmet = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleHelmetOpen")
  -- DECOMPILER ERROR at PC232: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui).chk_showUnderwear = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleUnderwear")
  -- DECOMPILER ERROR at PC243: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui).chk_toggleCloak = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleCloak")
  -- DECOMPILER ERROR at PC254: Confused about usage of register: R6 in 'UnsetPending'

  ;
  (self._ui).chk_toggleNameWhenCamo = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleShowNameWhenCamouflage")
  ;
  ((self._ui).chk_HideHelmet):SetCheck(not ToClient_IsShowHelm())
  ;
  ((self._ui).chk_openHelmet):SetCheck(ToClient_IsShowBattleHelm())
  ;
  ((getSelfPlayer()):get()):setUnderwearModeInhouse(false)
  ;
  ((self._ui).chk_showUnderwear):SetCheck(((getSelfPlayer()):get()):getUnderwearModeInhouse())
  ;
  ((self._ui).chk_toggleCloak):SetCheck(not ToClient_IsShowCloak())
  ;
  ((self._ui).chk_toggleNameWhenCamo):SetCheck(Toclient_setShowNameWhenCamouflage())
  ;
  ((self._ui).chk_HideHelmet):addInputEvent("Mouse_LUp", "Input_InventoryInfo_HideHelmet()")
  ;
  ((self._ui).chk_openHelmet):addInputEvent("Mouse_LUp", "Input_InventoryInfo_OpenHelmet()")
  ;
  ((self._ui).chk_showUnderwear):addInputEvent("Mouse_LUp", "Input_InventoryInfo_ToggleUnderwear()")
  ;
  ((self._ui).chk_toggleCloak):addInputEvent("Mouse_LUp", "Input_InventoryInfo_ToggleCloak()")
  ;
  ((self._ui).chk_toggleNameWhenCamo):addInputEvent("Mouse_LUp", "Input_InventoryInfo_ToggleNameWhenCamo()")
end

InventoryInfo.initInformationUIControl = function(self)
  -- function num : 0_4 , upvalues : UPPER_TAB_TYPE
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).frame_characterInfo = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.INFORMATION], "Frame_CharacterInfo")
  local frameContent = ((self._ui).frame_characterInfo):GetFrameContent()
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_characterInfoBG = (UI.getChildControl)(frameContent, "Static_ContentBG")
  local potencialTitle = (UI.getChildControl)(frameContent, "StaticText_PotencialPart")
  local textTemplate = (UI.getChildControl)(potencialTitle, "StaticText_PotencialTemplate")
  local barTemplate = (UI.getChildControl)(potencialTitle, "Static_PotencialBarTemplate")
  local textPosX, textPosY = textTemplate:GetPosX(), textTemplate:GetPosY()
  local barPosX, barPosY = barTemplate:GetPosX(), barTemplate:GetPosY()
  local textList = {}
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R10 in 'UnsetPending'

  ;
  (self._ui).potencialBars = {}
  local potencialCount = 6
  local classtype = (getSelfPlayer()):getClassType()
  local potencialNames = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_1"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_2"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_3"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_4"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_5"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_6"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_7")}
  for ii = 1, potencialCount do
    textList[ii] = (UI.cloneControl)(textTemplate, potencialTitle, "StaticText_Potencial_" .. ii)
    -- DECOMPILER ERROR at PC120: Confused about usage of register: R17 in 'UnsetPending'

    ;
    ((self._ui).potencialBars)[ii] = (UI.cloneControl)(barTemplate, potencialTitle, "Static_PotencialBar_" .. ii)
    ;
    (textList[ii]):SetSpanSize(textPosX + (ii - 1) % 2 * 210, textPosY + (math.floor)((ii - 1) / 2) * 45)
    ;
    (textList[ii]):ComputePos()
    ;
    (((self._ui).potencialBars)[ii]):SetPosX(barPosX + (ii - 1) % 2 * 210)
    ;
    (((self._ui).potencialBars)[ii]):SetPosY(barPosY + (math.floor)((ii - 1) / 2) * 45)
    ;
    (textList[ii]):SetText(potencialNames[ii])
  end
  do
    if (CppEnums.ClassType).ClassType_WizardWomen == classtype or (CppEnums.ClassType).ClassType_Wizard == classtype then
      (textList[1]):SetText(potencialNames[1])
    else
      ;
      (textList[1]):SetText(potencialNames[0])
    end
    textTemplate:SetShow(false)
    barTemplate:SetShow(false)
    local resistanceTitle = (UI.getChildControl)(frameContent, "StaticText_ResistancePart")
    -- DECOMPILER ERROR at PC196: Confused about usage of register: R14 in 'UnsetPending'

    ;
    (self._ui).txt_resistValues = {}
    for ii = 1, self._resistCount do
      -- DECOMPILER ERROR at PC210: Confused about usage of register: R18 in 'UnsetPending'

      ((self._ui).txt_resistValues)[ii] = (UI.getChildControl)(resistanceTitle, "StaticText_ResistValue_" .. ii)
    end
    local fitnessTitle = (UI.getChildControl)(frameContent, "StaticText_FitnessPart")
    -- DECOMPILER ERROR at PC219: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self._ui).txt_fitnessSubtitles = {}
    -- DECOMPILER ERROR at PC222: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self._ui).txt_fitnessValues = {}
    for ii = 1, self._fitnessCount do
      -- DECOMPILER ERROR at PC236: Confused about usage of register: R19 in 'UnsetPending'

      ((self._ui).txt_fitnessSubtitles)[ii] = (UI.getChildControl)(fitnessTitle, "StaticText_Fitness_" .. ii)
      -- DECOMPILER ERROR at PC246: Confused about usage of register: R19 in 'UnsetPending'

      ;
      ((self._ui).txt_fitnessValues)[ii] = (UI.getChildControl)(fitnessTitle, "StaticText_fitnessValue_" .. ii)
    end
    -- DECOMPILER ERROR at PC258: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self._ui).frame_setEffect = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.INFORMATION], "Frame_SetItemEffect")
    -- DECOMPILER ERROR at PC268: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self._ui).stc_setEffectBG = (UI.getChildControl)(((self._ui).frame_setEffect):GetFrameContent(), "Static_ContentBG")
    -- DECOMPILER ERROR at PC271: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self._ui).setItemEffectTitleList = {}
    -- DECOMPILER ERROR at PC274: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self._ui).setItemEffectValueList = {}
    self._setItemEffectTitleCount = 1
    self._setItemEffectValueCount = 1
    frameContent:SetSize(((self._ui).frame_characterInfo):GetSizeX(), ((self._ui).frame_characterInfo):GetSizeY() - 10)
    ;
    ((self._ui).frame_characterInfo):UpdateContentPos()
    ;
    (((self._ui).frame_characterInfo):GetVScroll()):SetControlTop()
    ;
    (((self._ui).frame_characterInfo):GetVScroll()):SetShow(false)
    -- DECOMPILER ERROR at PC315: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self._ui).stc_noSetEffect = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.INFORMATION], "StaticText_NoSetEffect")
  end
end

InventoryInfo.initServantUIControl = function(self)
  -- function num : 0_5 , upvalues : UPPER_TAB_TYPE, WHERE_TYPE
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).frame_servantInven = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.SERVANT], "Frame_ServantInven")
  local frameContent = ((self._ui).frame_servantInven):GetFrameContent()
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._ui).stc_servantInfoBG = (UI.getChildControl)(frameContent, "Static_ContentBG")
  local progressBG = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.SERVANT], "Static_ServantWeightProgressBG")
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).stc_contentBG = (UI.getChildControl)(frameContent, "Static_ContentBG")
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_servantName = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.SERVANT], "StaticText_ServantName")
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).progress2_servantWeight = (UI.getChildControl)(progressBG, "Progress2_ServantWeight")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_servantInvenCountDisplay = (UI.getChildControl)(progressBG, "StaticText_SlotCount")
  -- DECOMPILER ERROR at PC69: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_servantWeightValue = (UI.getChildControl)(progressBG, "StaticText_WeightValue")
  -- DECOMPILER ERROR at PC76: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).stc_horseWeight = (UI.getChildControl)(progressBG, "Static_HorseWeight")
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_servantEquipInfo = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.SERVANT], "StaticText_ServantEquipSlot")
  -- DECOMPILER ERROR at PC98: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_servantCostumeInfo = (UI.getChildControl)(((self._ui).groups)[UPPER_TAB_TYPE.SERVANT], "StaticText_ServantCostumeSlot")
  -- DECOMPILER ERROR at PC106: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_noServant = (UI.getChildControl)((self._ui).stc_subWindowUpper, "StaticText_NoServant")
  -- DECOMPILER ERROR at PC113: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).servantInvenSlotTemplate = (UI.getChildControl)(frameContent, "Static_ServantSlotTemplate")
  -- DECOMPILER ERROR at PC121: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).servantEquipSlotTemplate = (UI.getChildControl)((self._ui).txt_servantEquipInfo, "Static_EquipItemSlot_Template")
  -- DECOMPILER ERROR at PC129: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).servantCostumeSlotTemplate = (UI.getChildControl)((self._ui).txt_servantCostumeInfo, "Static_CostumeItemSlot_Template")
  ;
  ((self._ui).servantInvenSlotTemplate):SetShow(false)
  ;
  ((self._ui).servantEquipSlotTemplate):SetShow(false)
  ;
  ((self._ui).servantCostumeSlotTemplate):SetShow(false)
  local slot = (self._ui).servantInvenSlots
  local slotBG = (self._ui).stc_servantInvenSlotBG
  for ii = 1, self._servantInvenSlotMax do
    slotBG[ii] = (UI.cloneControl)((self._ui).servantInvenSlotTemplate, frameContent, "ServantInvenSlotBG_" .. ii)
    slot[ii] = {}
    ;
    (SlotItem.new)(slot[ii], "ServantInvenSlot_" .. ii, ii, slotBG[ii], self._configForInven)
    ;
    (slot[ii]):createChild()
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_ServantInvenSlot(" .. ii .. ")")
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantInvenDropHandler(" .. ii .. ")")
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_On", "Input_InventoryInfo_ServantInvenTooltip(" .. ii .. ", true)")
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantInvenTooltip(" .. ii .. ", false)")
  end
  local servantEquipSlot = (self._ui).servantEquipSlots
  local stc_servantEquipSlotBG = (self._ui).stc_servantEquipSlotBG
  for ii = 1, self._servantEquipSlotMax do
    stc_servantEquipSlotBG[ii] = (UI.cloneControl)((self._ui).servantEquipSlotTemplate, (self._ui).txt_servantEquipInfo, "ServantEquipSlotBG_" .. ii)
    ;
    (stc_servantEquipSlotBG[ii]):SetPosX((ii - 1) * self._defaultXGap)
    servantEquipSlot[ii] = {}
    ;
    (SlotItem.new)(servantEquipSlot[ii], "ServantEquipSlot_" .. ii, ii, stc_servantEquipSlotBG[ii], self._configForEquip)
    ;
    (servantEquipSlot[ii]):createChild()
    ;
    ((servantEquipSlot[ii]).icon):addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_ServantEquipSlot(" .. ii .. ")")
    ;
    ((servantEquipSlot[ii]).icon):addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantEquipSlot(" .. ii .. ")")
    ;
    ((servantEquipSlot[ii]).icon):addInputEvent("Mouse_On", "Input_InventoryInfo_ServantEquipShowTooltip(" .. WHERE_TYPE.SERVANT_EQUIP .. "," .. ii .. ", true)")
    ;
    ((servantEquipSlot[ii]).icon):addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantEquipShowTooltip(" .. WHERE_TYPE.SERVANT_EQUIP .. "," .. ii .. ", false)")
    -- DECOMPILER ERROR at PC303: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (servantEquipSlot[ii]).pictogram = (UI.getChildControl)(stc_servantEquipSlotBG[ii], "Static_ItemPictogram")
    -- DECOMPILER ERROR at PC310: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (servantEquipSlot[ii]).toggleButton = (UI.getChildControl)(stc_servantEquipSlotBG[ii], "CheckButton_ShowToggle")
    ;
    ((servantEquipSlot[ii]).toggleButton):addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantEquipToggle(" .. ii .. ")")
    ;
    (stc_servantEquipSlotBG[ii]):SetChildOrder(((servantEquipSlot[ii]).icon):GetKey(), ((servantEquipSlot[ii]).toggleButton):GetKey())
  end
  local servantCostumeSlots = (self._ui).servantCostumeSlots
  local stc_servantCostumeSlotBG = (self._ui).stc_servantCostumeSlotBG
  for ii = 1, self._servantEquipSlotMax do
    stc_servantCostumeSlotBG[ii] = (UI.cloneControl)((self._ui).servantCostumeSlotTemplate, (self._ui).txt_servantCostumeInfo, "ServantCostumeSlotBG_" .. ii)
    ;
    (stc_servantCostumeSlotBG[ii]):SetPosX((ii - 1) * self._defaultXGap)
    servantCostumeSlots[ii] = {}
    ;
    (SlotItem.new)(servantCostumeSlots[ii], "ServantCostumeSlot_" .. ii, ii, stc_servantCostumeSlotBG[ii], self._configForCostume)
    ;
    (servantCostumeSlots[ii]):createChild()
    ;
    ((servantCostumeSlots[ii]).icon):addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_ServantCostumeSlot(" .. ii .. ")")
    ;
    ((servantCostumeSlots[ii]).icon):addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantCostumeSlot(" .. ii .. ")")
    ;
    ((servantCostumeSlots[ii]).icon):addInputEvent("Mouse_On", "Input_InventoryInfo_ServantCostumeShowTooltip(" .. WHERE_TYPE.SERVANT_EQUIP .. "," .. ii .. ", true)")
    ;
    ((servantCostumeSlots[ii]).icon):addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantCostumeShowTooltip(" .. WHERE_TYPE.SERVANT_EQUIP .. "," .. ii .. ", false)")
    -- DECOMPILER ERROR at PC420: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (servantCostumeSlots[ii]).pictogram = (UI.getChildControl)(stc_servantCostumeSlotBG[ii], "Static_ItemPictogram")
    -- DECOMPILER ERROR at PC427: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (servantCostumeSlots[ii]).toggleButton = (UI.getChildControl)(stc_servantCostumeSlotBG[ii], "CheckButton_ShowToggle")
    ;
    ((servantCostumeSlots[ii]).toggleButton):addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantCostumeToggle(" .. ii .. ")")
    ;
    (stc_servantCostumeSlotBG[ii]):SetChildOrder(((servantCostumeSlots[ii]).icon):GetKey(), ((servantCostumeSlots[ii]).toggleButton):GetKey())
  end
end

InventoryInfo.initInventory = function(self)
  -- function num : 0_6 , upvalues : _panel
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).stc_invenSlotBG = {}
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).invenSlotTemplate = (UI.getChildControl)((self._ui).stc_subWindowLower, "Static_ItemSlotTemplate")
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_highlight = (UI.getChildControl)((self._ui).stc_subWindowLower, "Static_InvenHighlight")
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_invenBG = (UI.getChildControl)((self._ui).stc_subWindowLower, "Static_InventoryBG")
  local slotBG = (self._ui).stc_invenSlotBG
  local slotTemplate = (self._ui).invenSlotTemplate
  local xSize, ySize = self._defaultXGap, self._defaultYGap
  local startX, startY = 0, 0
  local columnMax = self._invenSlotColumnMax
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R8 in 'UnsetPending'

  ;
  (self._ui).invenSlots = (Array.new)()
  local slot = (self._ui).invenSlots
  for ii = 1, self._invenSlotMax do
    slotBG[ii] = (UI.cloneControl)(slotTemplate, (self._ui).stc_invenBG, "InvenSlotBG_" .. ii)
    ;
    (slotBG[ii]):SetPosX(startX + (ii - 1) % columnMax * xSize)
    ;
    (slotBG[ii]):SetPosY(startY + (math.floor)((ii - 1) / columnMax) * ySize)
    slot[ii] = {}
    ;
    (SlotItem.new)(slot[ii], "InvenSlot_" .. ii, ii, slotBG[ii], self._configForInven)
    ;
    (slot[ii]):createChild()
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_InvenSlot(" .. ii .. ")")
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_LDown", "InputMLDown_InventoryInfo_InvenSlot(" .. ii .. ")")
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_LUp", "InputDrag_InventoryInfo_invenDragEnd(" .. ii .. ")")
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_On", "InputMOn_InventoryInfo_invenShowTooltip(" .. ii .. ")")
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_Out", "InputMOut_InventoryInfo_invenHideTooltip(" .. ii .. ")")
    ;
    ((slot[ii]).icon):addInputEvent("Mouse_PressMove", "InputDrag_InventoryInfo_invenDrag(" .. ii .. ")")
    ;
    (slotBG[ii]):registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "Input_InventoryInfo_ItemDelete(" .. ii .. ")")
    ;
    ((slot[ii]).icon):SetEnableDragAndDrop(true)
    ;
    (UIScroll.InputEventByControl)(slotBG[ii], "InputScroll_InventoryInfo_Inventory")
    ;
    (UIScroll.InputEventByControl)((slot[ii]).icon, "InputScroll_InventoryInfo_Inventory")
    Panel_Tooltip_Item_SetPosition(ii, slot[ii], "inventory")
    local effectSlot = {}
    effectSlot.isFirstItem = false
    -- DECOMPILER ERROR at PC175: Confused about usage of register: R14 in 'UnsetPending'

    ;
    (self._slotEtcData)[ii] = effectSlot
    -- DECOMPILER ERROR at PC187: Confused about usage of register: R14 in 'UnsetPending'

    ;
    ((self._ui).stc_lockedSlots)[ii] = (UI.createAndCopyBasePropertyControl)(_panel, "Static_LockedSlot", slotBG[ii], "Static_LockedSlot_" .. ii)
  end
  slotTemplate:SetShow(false)
  -- DECOMPILER ERROR at PC199: Confused about usage of register: R9 in 'UnsetPending'

  ;
  (self._ui).scroll_inven = (UI.getChildControl)((self._ui).stc_subWindowLower, "Scroll_Inventory")
  ;
  ((self._ui).scroll_inven):SetShow(false)
  ;
  (UIScroll.InputEvent)((self._ui).scroll_inven, "InputScroll_InventoryInfo_Inventory")
  ;
  (UIScroll.InputEventByControl)((self._ui).stc_invenBG, "InputScroll_InventoryInfo_Inventory")
  -- DECOMPILER ERROR at PC224: Confused about usage of register: R9 in 'UnsetPending'

  ;
  (self._ui).btn_invenPuzzle = (UI.getChildControl)((self._ui).stc_subWindowLower, "Button_Puzzle")
  ;
  ((self._ui).btn_invenPuzzle):SetShow(false)
  -- DECOMPILER ERROR at PC237: Confused about usage of register: R9 in 'UnsetPending'

  ;
  (self._ui).stc_plusSlot = (UI.getChildControl)((self._ui).stc_invenBG, "Static_OnlyPlus")
end

InventoryInfo.registEventHandler = function(self)
  -- function num : 0_7 , upvalues : _panel
  for ii = 1, #(self._ui).rdo_tabButtons do
    (((self._ui).rdo_tabButtons)[ii]):addInputEvent("Mouse_LUp", "PaGlobalFunc_InventoryInfo_SetUpperTabTo(" .. ii .. ")")
  end
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_B, "PaGlobalFunc_InventoryInfo_Close")
  ;
  ((self._ui).stc_xBoxKey_LB):addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetUpperTabLeft()")
  ;
  ((self._ui).stc_xBoxKey_RB):addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetUpperTabRight()")
  ;
  ((self._ui).stc_xBoxKey_LT):addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetLowerTabLeft()")
  ;
  ((self._ui).stc_xBoxKey_RT):addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetLowerTabRight()")
end

InventoryInfo.registMessageHandler = function(self)
  -- function num : 0_8 , upvalues : _panel
  _panel:RegisterShowEventFunc(true, "PaGlobalFunc_InventoryInfo_ShowAni()")
  _panel:RegisterShowEventFunc(false, "PaGlobalFunc_InventoryInfo_HideAni()")
  _panel:RegisterUpdateFunc("PaGlobalFunc_Window_InventoryInfo_PerFrameUpdate")
  registerEvent("onScreenResize", "FromClient_InventoryInfo_OnScreenResize")
  registerEvent("EventEquipmentUpdate", "FromClient_InventoryInfo_EquipmentHaveChanged")
  registerEvent("EventEquipItem", "FromClient_InventoryInfo_EventEquipItem")
  registerEvent("EventPCEquipSetShow", "FromClient_InventoryInfo_EventPCEquipSetShow")
  registerEvent("FromClient_WeightChanged", "FromClient_InventoryInfo_updateInvenSlot")
  registerEvent("FromClient_InventoryUpdate", "FromClient_InventoryInfo_updateInvenSlot")
  registerEvent("EventInventorySetShow", "FromClient_InventoryInfo_SetShow")
  registerEvent("EventInventorySetShowWithFilter", "FromClient_InventoryInfo_SetShowWithFilter")
  registerEvent("EventAddItemToInventory", "FromClient_InventoryInfo_AddItem")
  registerEvent("EventUnEquipItemToInventory", "FromClient_InventoryInfo_UnequipItem")
  registerEvent("FromClient_UseItemAskFromOtherPlayer", "FromClient_InventoryInfo_UseItemAskFromOtherPlayer")
  registerEvent("FromClient_FindExchangeItemNPC", "FromClient_InventoryInfo_FindExchangeItemNPC")
  registerEvent("FromClient_InventoryUpdatebyAddItem", "FromClient_InventoryInfo_updateSlotDatabyAddItem")
  registerEvent("FromClient_UpdateInventoryBag", "FromClient_InventoryInfo_updateSlotDatabyAddItem")
  registerEvent("EventServantEquipmentUpdate", "FromClient_InventoryInfo_ServantEquipChanged")
  registerEvent("EventServantEquipItem", "FromClient_InventoryInfo_ServantEquipOn")
  registerEvent("FromClient_UpdateTolerance", "FromClient_InventoryInfo_ResistChanged")
  registerEvent("FromClient_UpdateSelfPlayerStatPoint", "FromClient_InventoryInfo_PotentialChanged")
  registerEvent("FromClientFitnessUp", "FromClient_InventoryInfo_FitnessChanged")
end

PaGlobalFunc_InventoryInfo_IsOpened = function()
  -- function num : 0_9 , upvalues : _panel
  return _panel:GetShow()
end

PaGlobalFunc_InventoryInfo_Open = function(openType)
  -- function num : 0_10 , upvalues : InventoryInfo
  InventoryInfo:open(openType)
end

InventoryInfo.open = function(self, openType)
  -- function num : 0_11 , upvalues : _panel, UPPER_TAB_TYPE
  _panel:SetShow(true, true)
  if openType ~= nil then
    (((self._ui).rdo_tabButtons)[openType]):SetCheck(true)
    self:setTabTo(openType)
  else
    ;
    (((self._ui).rdo_tabButtons)[UPPER_TAB_TYPE.EQUIPMENT]):SetCheck(true)
    self:setTabTo(UPPER_TAB_TYPE.EQUIPMENT)
  end
  self:updateInventory()
  self:updateWeight()
  self._monitorItemCooltime = true
end

PaGlobalFunc_InventoryInfo_Close = function()
  -- function num : 0_12 , upvalues : InventoryInfo
  InventoryInfo:close()
end

InventoryInfo.close = function(self)
  -- function num : 0_13 , upvalues : _panel
  if _panel:IsUISubApp() then
    Inventory_SetFunctor(nil, nil, nil, nil)
    return 
  end
  do
    if self._otherWindowOpenFunc ~= nil then
      local callFunc = self._otherWindowOpenFunc
      self._otherWindowOpenFunc = nil
      callFunc()
    end
    _panel:SetShow(false, true)
    PaGlobalFunc_InventoryPopup_Close()
    self._weightDesignatorTarget = getScreenSizeY()
    self._weightDesignatorIsAnimating = true
    self._monitorItemCooltime = false
    self._slotRingIndex = 0
    self._slotEarringIndex = 0
  end
end

PaGlobalFunc_InventoryInfo_ShowAni = function()
  -- function num : 0_14 , upvalues : InventoryInfo, _panel
  audioPostEvent_SystemUi(1, 1)
  local self = InventoryInfo
  self._showAniIsPlaying = true
  _panel:ResetVertexAni()
  local aniInfo1 = _panel:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartPosition(getScreenSizeX(), 0)
  aniInfo1:SetEndPosition(getScreenSizeX() - _panel:GetSizeX(), 0)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(false)
  aniInfo1:SetDisableWhileAni(true)
  aniInfo1:SetIgnoreUpdateSnapping(true)
  ;
  ((self._ui).stc_topEndPictogram):ComputePos()
  ;
  ((self._ui).stc_topEndPictogram):ResetVertexAni()
  ;
  ((self._ui).stc_topEndPictogram):SetVertexAniRun("Ani_Move_Pos_Show", true)
  ;
  ((self._ui).txt_topEndTitle):ComputePos()
  ;
  ((self._ui).txt_topEndTitle):ResetVertexAni()
  ;
  ((self._ui).txt_topEndTitle):SetVertexAniRun("Ani_Move_Pos_Show", true)
end

PaGlobalFunc_InventoryInfo_HideAni = function()
  -- function num : 0_15 , upvalues : _panel
  audioPostEvent_SystemUi(1, 1)
  _panel:ResetVertexAni()
  local aniInfo1 = _panel:addMoveAnimation(0, 0.3, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartPosition(_panel:GetPosX(), 0)
  aniInfo1:SetEndPosition(_panel:GetPosX() + 600, 0)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  aniInfo1:SetIgnoreUpdateSnapping(true)
end

InventoryInfo.updateAllUpperTab = function(self)
  -- function num : 0_16
  self:updateEquipment()
  self:updateCostume()
  self:updateInformation()
  self:updateServant()
end

InventoryInfo.updateSilverPearlMileage = function(self)
  -- function num : 0_17
  local silver = (Defines.s64_const).s64_0
  local pearl = (Defines.s64_const).s64_0
  local mileage = (Defines.s64_const).s64_0
  local moneyItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, getMoneySlotNo())
  if moneyItemWrapper ~= nil then
    silver = (moneyItemWrapper:get()):getCount_s64()
  end
  local pearlItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getPearlSlotNo())
  if pearlItemWrapper ~= nil then
    pearl = (pearlItemWrapper:get()):getCount_s64()
  end
  local mileagelItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getMileageSlotNo())
  if mileagelItemWrapper ~= nil then
    mileage = (mileagelItemWrapper:get()):getCount_s64()
  end
  ;
  ((self._ui).txt_Silver):SetText(makeDotMoney(silver))
  ;
  ((self._ui).txt_Pearl):SetText(makeDotMoney(pearl))
  ;
  ((self._ui).txt_Mileage):SetText(makeDotMoney(mileage))
  self:updateSilverIcon((self._ui).stc_silverIcon, silver)
end

InventoryInfo.updateSilverIcon = function(self, control, silver)
  -- function num : 0_18
  if Int64toInt32(silver) >= 100000 then
    control:ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver4.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 0, 0, 30, 30)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver4_Over.dds")
    control:ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver4_Over.dds")
  else
    do
      if Int64toInt32(silver) >= 20000 then
        control:ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver3.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(control, 0, 0, 30, 30)
        ;
        (control:getBaseTexture()):setUV(x1, y1, x2, y2)
        control:setRenderTexture(control:getBaseTexture())
        control:ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver3_Over.dds")
        control:ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver3_Over.dds")
      else
        do
          if Int64toInt32(silver) >= 5000 then
            control:ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver2.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(control, 0, 0, 30, 30)
            ;
            (control:getBaseTexture()):setUV(x1, y1, x2, y2)
            control:setRenderTexture(control:getBaseTexture())
            control:ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver2_Over.dds")
            control:ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver2_Over.dds")
          else
            do
              control:ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver1.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(control, 0, 0, 30, 30)
              ;
              (control:getBaseTexture()):setUV(x1, y1, x2, y2)
              control:setRenderTexture(control:getBaseTexture())
              control:ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver1_Over.dds")
              control:ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver1_Over.dds")
            end
          end
        end
      end
    end
  end
end

InventoryInfo.updateUpperTab = function(self, tab)
  -- function num : 0_19 , upvalues : UPPER_TAB_TYPE
  if tab == UPPER_TAB_TYPE.EQUIPMENT then
    self:updateEquipment()
  else
    if tab == UPPER_TAB_TYPE.COSTUME then
      self:updateCostume()
    else
      if tab == UPPER_TAB_TYPE.INFORMATION then
        self:updateInformation()
      else
        if tab == UPPER_TAB_TYPE.SERVANT then
          self:updateServant()
        end
      end
    end
  end
end

InventoryInfo.updateEquipment = function(self)
  -- function num : 0_20 , upvalues : _isInitialized, _panel
  if not _isInitialized or not _panel:GetShow() then
    return 
  end
  self._extendedSlotArray = {}
  for ii = 1, #self._equipSlotIndex do
    local slot = ((self._ui).equipSlots)[ii]
    local slotIndex = (self._equipSlotIndex)[ii]
    local itemWrapper = ToClient_getEquipmentItem(slotIndex)
    if itemWrapper ~= nil then
      self:extendedSlotInfo(itemWrapper, slotIndex)
      slot:setItem(itemWrapper, slotIndex, true)
      ;
      (slot.pictogram):SetShow(false)
      if slot.toggleButton ~= nil then
        (((self._ui).equipSlotBG)[ii]):SetChildOrder(slot, slot.toggleButton)
      end
      ;
      (slot.icon):SetEnable(true)
      ;
      (slot.icon):SetMonoTone(false)
      ;
      (slot.enchantText):SetMonoTone(false)
    else
      slot:clearItem()
      ;
      (slot.pictogram):SetShow(true)
    end
  end
  for childSlot,parentSlot in pairs(self._extendedSlotArray) do
    local itemWrapper = ToClient_getEquipmentItem(parentSlot)
    local index = self:getIndexFromEquipSlotIndex(childSlot)
    slot = ((self._ui).equipSlots)[index]
    if slot ~= nil then
      ((((self._ui).equipSlots)[index]).pictogram):SetShow(false)
      self:setItemInfoUseWrapper(slot, itemWrapper, true, true)
    end
  end
  local autoActiveIsOn = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).AlchemyStone)
  if ToClient_getEquipmentItem(27) ~= nil and autoActiveIsOn then
    ((self._ui).chk_autoActive):SetCheck(true)
  else
    ;
    ((self._ui).chk_autoActive):SetCheck(false)
  end
  self:updateAttackStat(false)
end

InventoryInfo.updateAttackStat = function(self, showWithEffect)
  -- function num : 0_21
  ToClient_updateAttackStat()
  local attackValNew = ToClient_getOffence()
  local awakenAttackValNew = ToClient_getAwakenOffence()
  local defenceAttackValNew = ToClient_getDefence()
  local attackValOld = tonumber(((self._ui).txt_attackValue):GetText())
  local awakenAttackValOld = tonumber(((self._ui).txt_awakenAttackValue):GetText())
  local defenceAttackValOld = tonumber(((self._ui).txt_defenceValue):GetText())
  ;
  ((self._ui).txt_attackValue):SetText(attackValNew)
  ;
  ((self._ui).txt_awakenAttackValue):SetText(awakenAttackValNew)
  ;
  ((self._ui).txt_defenceValue):SetText(defenceAttackValNew)
  if showWithEffect == false then
    return 
  end
  if attackValOld ~= attackValNew then
    ((self._ui).txt_attackValue):AddEffect("fUI_SkillButton01", false, 0, 0)
    ;
    ((self._ui).txt_attackValue):AddEffect("UI_SkillButton01", false, 0, 0)
  end
  if awakenAttackValOld ~= awakenAttackValNew then
    ((self._ui).txt_awakenAttackValue):AddEffect("fUI_SkillButton01", false, 0, 0)
    ;
    ((self._ui).txt_awakenAttackValue):AddEffect("UI_SkillButton01", false, 0, 0)
  end
  if defenceAttackValOld ~= defenceAttackValNew then
    ((self._ui).txt_defenceValue):AddEffect("fUI_SkillButton01", false, 0, 0)
    ;
    ((self._ui).txt_defenceValue):AddEffect("UI_SkillButton01", false, 0, 0)
  end
end

InventoryInfo.updateCostume = function(self)
  -- function num : 0_22 , upvalues : _isInitialized, _panel, _avatarCheckFlag
  if not _isInitialized or not _panel:GetShow() then
    return 
  end
  self._extendedSlotArray = {}
  for ii = 1, #self._costumeSlotIndex do
    local slotIndex = (self._costumeSlotIndex)[ii]
    local slot = ((self._ui).costumeSlots)[ii]
    local isShow = true
    local itemWrapper = ToClient_getEquipmentItem(slotIndex)
    if itemWrapper ~= nil then
      self:extendedSlotInfo(itemWrapper, slotIndex)
      slot:setItem(itemWrapper, slotIndex, true)
      isShow = ToClient_IsSetAvatarEquipSlotFlag(_avatarCheckFlag[slotIndex])
      if slot.toggleButton ~= nil then
        (((self._ui).equipSlotBG)[ii]):SetChildOrder(slot, slot.toggleButton)
      end
      ;
      (slot.pictogram):SetShow(false)
      ;
      (slot.icon):SetEnable(true)
      ;
      (slot.icon):SetMonoTone(false)
      ;
      (slot.enchantText):SetMonoTone(false)
    else
      slot:clearItem()
      ;
      (slot.pictogram):SetShow(true)
    end
    ;
    (slot.toggleButton):SetCheck(isShow)
  end
  for childSlot,parentSlot in pairs(self._extendedSlotArray) do
    local itemWrapper = ToClient_getEquipmentItem(parentSlot)
    local index = self:getIndexFromCostumeSlotIndex(childSlot)
    slot = ((self._ui).costumeSlots)[index]
    if slot ~= nil then
      ((((self._ui).costumeSlots)[index]).pictogram):SetShow(false)
      self:setItemInfoUseWrapper(slot, itemWrapper, true, true)
    end
  end
end

InventoryInfo.updateInformation = function(self)
  -- function num : 0_23 , upvalues : _isInitialized, UPPER_TAB_TYPE
  if not _isInitialized then
    return 
  end
  if UPPER_TAB_TYPE.INFORMATION ~= self._currentUpperTab then
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local potentialType = {move = 0, attack = 1, cast = 2}
  local potencialValues = {[1] = selfPlayer:characterStatPointSpeed(potentialType.attack), [2] = selfPlayer:characterStatPointSpeed(potentialType.move), [3] = selfPlayer:characterStatPointCritical(), [4] = selfPlayer:getCharacterStatPointFishing(), [5] = selfPlayer:getCharacterStatPointCollection(), [6] = selfPlayer:getCharacterStatPointDropItem()}
  local potencialValueLimit = {[1] = selfPlayer:characterStatPointLimitedSpeed(potentialType.attack), [2] = selfPlayer:characterStatPointLimitedSpeed(potentialType.move), [3] = selfPlayer:characterStatPointLimitedCritical(), [4] = selfPlayer:getCharacterStatPointLimitedFishing(), [5] = selfPlayer:getCharacterStatPointLimitedCollection(), [6] = selfPlayer:getCharacterStatPointLimitedDropItem()}
  if (CppEnums.ClassType).ClassType_WizardWomen == classtype or (CppEnums.ClassType).ClassType_Wizard == classtype then
    potencialValues[1] = selfPlayer:characterStatPointSpeed(potentialType.cast)
    potencialValueLimit[1] = selfPlayer:characterStatPointLimitedSpeed(potentialType.cast)
  end
  for ii = 1, #potencialValues do
    if potencialValueLimit[ii] < potencialValues[ii] then
      potencialValues[ii] = potencialValueLimit[ii]
    end
    if ii < 3 then
      potencialValues[ii] = potencialValues[ii] - 5
    end
    local displayBarTemp = {}
    for jj = 1, 5 do
      displayBarTemp[jj] = (UI.getChildControl)(((self._ui).potencialBars)[ii], "Static_Potencial_" .. jj - 1)
      ;
      (displayBarTemp[jj]):SetShow(jj <= potencialValues[ii])
    end
  end
  local resistData = {[1] = selfPlayer:getStunResistance(), [2] = selfPlayer:getKnockdownResistance(), [3] = selfPlayer:getCatchResistance(), [4] = selfPlayer:getKnockbackResistance()}
  for ii = 1, self._resistCount do
    (((self._ui).txt_resistValues)[ii]):SetText(tostring(resistData[ii] / 10000) .. " %")
  end
  ;
  (((self._ui).txt_fitnessSubtitles)[1]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE"))
  ;
  (((self._ui).txt_fitnessSubtitles)[2]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE"))
  ;
  (((self._ui).txt_fitnessSubtitles)[3]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE"))
  local selfProxy = selfPlayer:get()
  for ii = 1, self._fitnessCount do
    (((self._ui).txt_fitnessValues)[ii]):SetText("Lv. " .. tostring(selfProxy:getFitnessLevel(ii - 1)))
    if ii == 2 then
      (((self._ui).txt_fitnessSubtitles)[ii]):SetText((((self._ui).txt_fitnessSubtitles)[ii]):GetText() .. tostring(ToClient_GetFitnessLevelStatus(ii - 1) / 10000))
    else
      (((self._ui).txt_fitnessSubtitles)[ii]):SetText((((self._ui).txt_fitnessSubtitles)[ii]):GetText() .. tostring(ToClient_GetFitnessLevelStatus(ii - 1)))
    end
  end
  local sortedInfoList = ToClient_GetSkillPieceInfo()
  if not sortedInfoList then
    ((self._ui).stc_noSetEffect):SetShow(true)
    ;
    ((self._ui).frame_setEffect):SetShow(false)
    return 
  else
    ((self._ui).stc_noSetEffect):SetShow(false)
    ;
    ((self._ui).frame_setEffect):SetShow(true)
  end
  self._setItemEffectData = {}
  self._setItemEffectTitleCount = 1
  self._setItemEffectValueCount = 1
  local containGroup = function(title)
    -- function num : 0_23_0 , upvalues : self
    for ii = 1, #self._setItemEffectData do
      if (self._setItemEffectData)[ii] ~= nil and title == (self._setItemEffectData)[ii] then
        return true
      end
    end
    return false
  end

  local data = {}
  local titles = (self._ui).setItemEffectTitleList
  local values = (self._ui).setItemEffectValueList
  for ii = 1, #titles do
    (titles[ii]):SetShow(false)
  end
  for ii = 1, #values do
    (values[ii]):SetShow(false)
  end
  for ii = 1, #sortedInfoList + 1 do
    data[ii] = {}
    -- DECOMPILER ERROR at PC302: Confused about usage of register: R16 in 'UnsetPending'

    ;
    (data[ii]).skillNo = (sortedInfoList[ii - 1]):getSkillNo()
    -- DECOMPILER ERROR at PC308: Confused about usage of register: R16 in 'UnsetPending'

    ;
    (data[ii]).groupTitle = (sortedInfoList[ii - 1]):getGroupTitle()
    -- DECOMPILER ERROR at PC314: Confused about usage of register: R16 in 'UnsetPending'

    ;
    (data[ii]).isApplied = (sortedInfoList[ii - 1]):getApply()
    -- DECOMPILER ERROR at PC320: Confused about usage of register: R16 in 'UnsetPending'

    ;
    (data[ii]).point = (sortedInfoList[ii - 1]):getPoint()
    -- DECOMPILER ERROR at PC326: Confused about usage of register: R16 in 'UnsetPending'

    ;
    (data[ii]).descTitle = (sortedInfoList[ii - 1]):getDescTitle()
    -- DECOMPILER ERROR at PC332: Confused about usage of register: R16 in 'UnsetPending'

    ;
    (data[ii]).desc = (sortedInfoList[ii - 1]):getDesc()
    if not containGroup((data[ii]).groupTitle) then
      if titles[self._setItemEffectTitleCount] == nil then
        titles[self._setItemEffectTitleCount] = (UI.createAndCopyBasePropertyControl)(((self._ui).frame_setEffect):GetFrameContent(), "StaticText_SetItemEffectTitle", ((self._ui).frame_setEffect):GetFrameContent(), "StaticText_SetItemEffectTitle" .. ii)
      end
      ;
      (titles[self._setItemEffectTitleCount]):SetShow(true)
      ;
      (titles[self._setItemEffectTitleCount]):SetText((data[ii]).groupTitle)
      ;
      (titles[self._setItemEffectTitleCount]):SetPosX(50)
      ;
      (titles[self._setItemEffectTitleCount]):SetPosY((self._setItemEffectTitleCount - 1) * 40 + (self._setItemEffectValueCount - 1) * 30 + 10)
      -- DECOMPILER ERROR at PC392: Confused about usage of register: R16 in 'UnsetPending'

      ;
      (self._setItemEffectData)[self._setItemEffectTitleCount] = (data[ii]).groupTitle
      self._setItemEffectTitleCount = self._setItemEffectTitleCount + 1
    end
    if values[self._setItemEffectValueCount] == nil then
      values[self._setItemEffectValueCount] = (UI.createAndCopyBasePropertyControl)(((self._ui).frame_setEffect):GetFrameContent(), "StaticText_SetItemEffectValue", ((self._ui).frame_setEffect):GetFrameContent(), "StaticText_SetItemEffectValue" .. ii)
    end
    ;
    (values[self._setItemEffectValueCount]):SetShow(true)
    if (data[ii]).isApplied == true then
      (values[self._setItemEffectValueCount]):SetFontColor((Defines.Color).C_FF96D4FC)
    else
      (values[self._setItemEffectValueCount]):SetFontColor((Defines.Color).C_FFC4BEBE)
    end
    ;
    (values[self._setItemEffectValueCount]):SetText((data[ii]).descTitle .. " : " .. (data[ii]).desc)
    ;
    (values[self._setItemEffectValueCount]):SetPosX(50)
    ;
    (values[self._setItemEffectValueCount]):SetPosY((self._setItemEffectTitleCount - 1) * 40 + (self._setItemEffectValueCount - 1) * 30 + 10)
    self._setItemEffectValueCount = self._setItemEffectValueCount + 1
  end
  ;
  ((self._ui).frame_setEffect):UpdateContentPos()
  local content = ((self._ui).frame_setEffect):GetFrameContent()
  do
    local sizeY = self._setItemEffectTitleCount * 40 + self._setItemEffectValueCount * 30 + 10
    ;
    ((self._ui).stc_characterInfoBG):SetSize(content:GetSizeX(), sizeY)
    ;
    ((self._ui).frame_setEffect):UpdateContentPos()
    if ((self._ui).frame_setEffect):GetSizeY() < content:GetSizeY() then
      (((self._ui).frame_setEffect):GetVScroll()):SetShow(true)
      ;
      (((self._ui).frame_setEffect):GetVScroll()):SetControlTop()
    else
      (((self._ui).frame_setEffect):GetVScroll()):SetShow(false)
    end
    ;
    ((self._ui).frame_setEffect):UpdateContentScroll()
    -- DECOMPILER ERROR: 12 unprocessed JMP targets
  end
end

InventoryInfo.updateServant = function(self)
  -- function num : 0_24 , upvalues : _isInitialized, _panel, UPPER_TAB_TYPE
  if not _isInitialized or not _panel:GetShow() then
    return 
  end
  local actorKeysRaw = self:getNearbyServantsActorKeys()
  if #actorKeysRaw > 0 then
    (((self._ui).groups)[UPPER_TAB_TYPE.SERVANT]):SetShow(true)
    ;
    ((self._ui).txt_noServant):SetShow(false)
    self:updateServantInven(actorKeysRaw[1])
    self._servantActorKeyRaw = actorKeysRaw
  else
    ;
    (((self._ui).groups)[UPPER_TAB_TYPE.SERVANT]):SetShow(false)
    ;
    ((self._ui).txt_noServant):SetShow(true)
    self._servantActorKeyRaw = nil
    return 
  end
  self:updateServantEquipOrCostume(true)
  self:updateServantEquipOrCostume(false)
end

InventoryInfo.updateServantInven = function(self, actorKeyRaw)
  -- function num : 0_25 , upvalues : _isInitialized, _panel
  if not _isInitialized or not _panel:GetShow() then
    return 
  end
  local areaYSize = 0
  if actorKeyRaw == nil then
    return 0
  end
  local vehicleActorWrapper = getVehicleActor(actorKeyRaw)
  if vehicleActorWrapper == nil then
    return 0
  end
  local vehicleActor = vehicleActorWrapper:get()
  if vehicleActor == nil then
    return 0
  end
  local vehicleInven = vehicleActor:getInventory()
  if vehicleInven == nil then
    return 0
  end
  local s64_weightMax = vehicleActor:getPossessableWeight_s64()
  local s64_weightAll = vehicleActor:getCurrentWeight_s64()
  local s64_weightMax_div = s64_weightMax / (Defines.s64_const).s64_100
  local s64_weightAll_div = s64_weightAll / (Defines.s64_const).s64_100
  ;
  ((self._ui).progress2_servantWeight):SetProgressRate(Int64toInt32(s64_weightAll / s64_weightMax_div))
  local allWeight = (string.format)("%.1f", Int64toInt32(s64_weightAll_div) / 100)
  local maxWeight = (string.format)("%.0f", Int64toInt32(s64_weightMax_div) / 100)
  ;
  ((self._ui).txt_servantWeightValue):SetText(allWeight .. " /" .. maxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  local useStartSlot = inventorySlotNoUserStart()
  local fullCount = vehicleInven:size() - useStartSlot
  local freeCount = vehicleInven:getFreeCount()
  local startX = ((self._ui).servantInvenSlotTemplate):GetPosX()
  local startY = ((self._ui).servantInvenSlotTemplate):GetPosY()
  local columnMax = self._invenSlotColumnMax
  ;
  ((self._ui).txt_servantInvenCountDisplay):SetText(tostring(fullCount - freeCount .. "/" .. fullCount))
  for ii = 1, #(self._ui).stc_servantInvenSlotBG do
    (((self._ui).stc_servantInvenSlotBG)[ii]):SetShow(false)
  end
  for ii = 1, fullCount do
    local slotBG = ((self._ui).stc_servantInvenSlotBG)[ii]
    local slot = ((self._ui).servantInvenSlots)[ii]
    if slotBG == nil then
      slotBG = (UI.cloneControl)((self._ui).servantInvenSlotTemplate, ((self._ui).frame_servantInven):GetFrameContent(), "servantInvenSlotBG_" .. R28_PC143)
    end
    slotBG:SetPosX(startX + (ii - 1) % columnMax * self._defaultXGap)
    slotBG:SetPosY(startY + (math.floor)((ii - 1) / columnMax) * self._defaultYGap)
    slotBG:SetShow(true)
    if slot == nil then
      slot = {}
      ;
      (SlotItem.new)(slot, "ServantInvenSlot_" .. R27_PC175, R27_PC175, R28_PC143, self._configForInven)
      slot:createChild()
      -- DECOMPILER ERROR at PC185: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC186: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC188: Overwrote pending register: R27 in 'AssignReg'

      ;
      (slot.icon):addInputEvent("Mouse_RUp", R27_PC175)
      -- DECOMPILER ERROR at PC193: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC194: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC196: Overwrote pending register: R27 in 'AssignReg'

      ;
      (slot.icon):addInputEvent("Mouse_LUp", R27_PC175)
      -- DECOMPILER ERROR at PC201: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC202: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC204: Overwrote pending register: R27 in 'AssignReg'

      ;
      (slot.icon):addInputEvent("Mouse_On", R27_PC175)
      -- DECOMPILER ERROR at PC209: Overwrote pending register: R27 in 'AssignReg'

      -- DECOMPILER ERROR at PC210: Overwrote pending register: R28 in 'AssignReg'

      -- DECOMPILER ERROR at PC212: Overwrote pending register: R27 in 'AssignReg'

      ;
      (slot.icon):addInputEvent("Mouse_Out", R27_PC175)
    end
    local itemWrapper = getServantInventoryItemBySlotNo(actorKeyRaw, ii - 1 + useStartSlot)
    -- DECOMPILER ERROR at PC222: Overwrote pending register: R27 in 'AssignReg'

    if itemWrapper ~= nil then
      slot:setItem(R27_PC175)
    else
      slot:clearItem()
    end
  end
  local lastSlot = ((self._ui).stc_servantInvenSlotBG)[fullCount]
  ;
  ((self._ui).stc_contentBG):SetSize(((self._ui).stc_contentBG):GetSizeX(), lastSlot:GetSizeY() + lastSlot:GetPosY())
  ;
  (((self._ui).frame_servantInven):GetFrameContent()):SetSize((((self._ui).frame_servantInven):GetFrameContent()):GetSizeX(), lastSlot:GetSizeY() + lastSlot:GetPosY())
  ;
  ((self._ui).frame_servantInven):UpdateContentPos()
  ;
  ((self._ui).frame_servantInven):UpdateContentScroll()
  return lastSlot:GetSizeY() + lastSlot:GetPosY() + ((self._ui).frame_servantInven):GetPosY()
end

InventoryInfo.updateServantEquipOrCostume = function(self, isEquip)
  -- function num : 0_26 , upvalues : _vehicleTypeToSERVANT_TYPE, _servantData, UPPER_TAB_TYPE
  if self._servantActorKeyRaw == nil then
    return 
  end
  if (self._servantActorKeyRaw)[1] == nil then
    return 
  end
  local servantWrapper = getServantInfoFromActorKey((self._servantActorKeyRaw)[1])
  if servantWrapper == nil then
    return 
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  if dataType == nil then
    return 
  end
  local equipOrCostumeSlots, equipOrCostumeSlotsBG, slotNoList = nil, nil, nil
  if isEquip == true then
    equipOrCostumeSlots = (self._ui).servantEquipSlots
    equipOrCostumeSlotsBG = (self._ui).stc_servantEquipSlotBG
    slotNoList = (_servantData[dataType]).equipSlotNoList
  else
    equipOrCostumeSlots = (self._ui).servantCostumeSlots
    equipOrCostumeSlotsBG = (self._ui).stc_servantCostumeSlotBG
    slotNoList = (_servantData[dataType]).costumeSlotNoList
  end
  local checkFlagList = (_servantData[dataType]).checkFlag
  local UV = (_servantData[dataType]).pictogramUV
  local slotCount = #slotNoList
  local group = ((self._ui).groups)[UPPER_TAB_TYPE.SERVANT]
  local startX = group:GetSizeX() / 2 - ((equipOrCostumeSlotsBG[1]):getParent()):GetPosX() - (slotCount * self._defaultXGap + (equipOrCostumeSlotsBG[1]):GetSizeX()) / 2
  _PA_LOG("박범�\128", "group:GetSizeX() : " .. group:GetSizeX())
  _PA_LOG("박범�\128", "slotCount : " .. slotCount)
  _PA_LOG("박범�\128", "slotCount * self._defaultXGap : " .. tostring(slotCount * self._defaultXGap))
  for ii = 1, self._servantEquipSlotMax do
    local slot = equipOrCostumeSlots[ii]
    local slotBG = equipOrCostumeSlotsBG[ii]
    if ii <= slotCount then
      slotBG:SetShow(true)
      slotBG:SetPosX(startX + (ii - 1) * self._defaultXGap)
      local slotNo = slotNoList[ii]
      local itemWrapper = servantWrapper:getEquipItem(slotNo)
      if slot.pictogram == nil then
        _PA_LOG("박범�\128", "slot pictogram at " .. " is nil")
        slot.pictogram = (UI.getChildControl)(slotBG, "Static_ItemPictogram")
      end
      if slot.toggleButton == nil then
        slot.toggleButton = (UI.getChildControl)(slotBG, "CheckButton_ShowToggle")
      end
      if itemWrapper ~= nil then
        slot:setItem(itemWrapper, slotNo, true)
        ;
        (slot.pictogram):SetShow(false)
        if (CppEnums.VehicleType).Type_Elephant == vehicleType then
          (slot.toggleButton):SetShow(false)
        else
          if checkFlagList[slotNo] == nil then
            (slot.toggleButton):SetShow(false)
          else
            ;
            (slot.toggleButton):SetShow(true)
            local checkBool = ToClient_IsSetVehicleEquipSlotFlag(vehicleType, checkFlagList[slotNo])
            ;
            (slot.toggleButton):SetCheck(checkBool)
          end
        end
      else
        do
          slot:clearItem()
          ;
          (slot.toggleButton):SetShow(false)
          ;
          (slot.pictogram):SetShow(true)
          do
            do
              local x1, y1, x2, y2 = setTextureUV_Func(slot.pictogram, (UV[slotNo])[1], (UV[slotNo])[2], (UV[slotNo])[3], (UV[slotNo])[4])
              ;
              ((slot.pictogram):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (slot.pictogram):setRenderTexture((slot.pictogram):getBaseTexture())
              slotBG:SetShow(false)
              -- DECOMPILER ERROR at PC219: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC219: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC219: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC219: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC219: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC219: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

hideInvenColor = function()
  -- function num : 0_27 , upvalues : InventoryInfo
  ((InventoryInfo._ui).stc_highlight):SetShow(false)
end

InventoryInfo.updateInventory = function(self, ignorePanelVisibility)
  -- function num : 0_28 , upvalues : _isInitialized, _panel, LOWER_TAB_TYPE, UI_color, effectScene
  if not ignorePanelVisibility and (not _isInitialized or not _panel:GetShow()) then
    return 
  end
  if not ignorePanelVisibility and LOWER_TAB_TYPE.UNDEFINED == self._currentLowerTab then
    return 
  end
  if ignorePanelVisibility then
    self._currentLowerTab = LOWER_TAB_TYPE.INVENTORY
  end
  if LOWER_TAB_TYPE.CASH_INVEN == self._currentLowerTab then
    local ImageAni = ((self._ui).stc_highlight):addColorAnimation(0, 0.25, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
    ImageAni:SetStartColor(UI_color.C_FFFFFFFF)
    ImageAni:SetEndColor(4278255615)
  else
    do
      do
        local ImageAni = ((self._ui).stc_highlight):addColorAnimation(0, 0.25, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
        ImageAni:SetStartColor(4278255615)
        ImageAni:SetEndColor(UI_color.C_FFFFFFFF)
        self:updateSilverPearlMileage()
        local playerLevel = ((getSelfPlayer()):get()):getLevel()
        local selfPlayer = getSelfPlayer()
        local invenUseSize = (selfPlayer:get()):getInventorySlotCount(LOWER_TAB_TYPE.CASH_INVEN == self._currentLowerTab)
        local useStartSlot = inventorySlotNoUserStart()
        local inventory = Inventory_GetCurrentInventory()
        local currentWhereType = Inventory_GetCurrentInventoryType()
        local invenMaxSize = inventory:sizeXXX()
        local slotNoList = (Array.new)()
        local classType = selfPlayer:getClassType()
        slotNoList:fill(useStartSlot, invenMaxSize - 1)
        self._isAutoSort = false
        if self._isAutoSort then
          local sortList = (Array.new)()
          sortList:fill(useStartSlot, invenUseSize - 1)
          sortList:quicksort(PaGlobalFunc_InventoryInfo_ItemComparer)
          for ii = 1, #sortList do
            slotNoList[ii] = sortList[ii]
          end
        end
        Panel_Inventory_isBlackStone_16001 = false
        Panel_Inventory_isBlackStone_16002 = false
        Panel_Inventory_isSocketItem = false
        ;
        ((self._ui).stc_plusSlot):SetShow(false)
        do
          local openedSlotCount = invenUseSize - useStartSlot
          for ii = 1, self._invenSlotMax do
            local slot = ((self._ui).invenSlots)[ii]
            slot:clearItem()
            slotNo = slotNoList[ii + self._invenStartSlotIndex]
            slot.slotNo = slotNo
            if ii - 1 + self._invenStartSlotIndex < openedSlotCount then
              (slot.icon):EraseAllEffect()
              local itemWrapper = getInventoryItemByType(((self._lowerTabData)[self._currentLowerTab]).whereType, slotNoList[ii + self._invenStartSlotIndex])
              if itemWrapper ~= nil then
                slot:setItem(itemWrapper, slotNo)
                slot.isEmpty = false
                local isFiltered = false
                if self._filterFunc ~= nil and type(self._filterFunc) == "function" then
                  isFiltered = (self._filterFunc)(slotNo, itemWrapper, currentWhereType)
                end
                ;
                (slot.icon):SetEnable(not isFiltered)
                ;
                (slot.icon):SetMonoTone(isFiltered)
                ;
                (slot.icon):SetIgnore(isFiltered)
                if isFiltered then
                  (slot.icon):SetAlpha(0.5)
                  ;
                  (slot.icon):EraseAllEffect()
                else
                  if self._filterFunc ~= nil then
                    (slot.icon):AddEffect("UI_Inventory_Filtering", true, 0, 0)
                  end
                  self:addEffectMapea(ii, slotNo)
                end
                Panel_Inventory_isBlackStone_16002 = self:addEffectBlackStone(ii, isFiltered, slotNo)
                local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
                self:autoSetPotion(playerLevel, itemKey, currentWhereType, slotNo)
                PaGlobal_TutorialManager:handleUpdateInventorySlotData(slot, itemKey)
                if (itemKey == 42000 or itemKey == 42001 or itemKey == 41607 or itemKey == 42002 or itemKey == 42010 or itemKey == 42003 or itemKey == 42004 or itemKey == 42034 or itemKey == 42035 or itemKey == 42037 or itemKey == 42036 or itemKey == 42006 or itemKey == 42008 or itemKey == 42039 or itemKey == 42038 or itemKey == 42007 or itemKey == 42053 or itemKey == 41610 or itemKey == 42009 or itemKey == 42054 or itemKey == 42057 or itemKey == 42061 or itemKey == 42066 or itemKey == 42055 or itemKey == 42056) and PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true and not FGlobal_FirstSummonItemUse() then
                  (slot.icon):AddEffect("fUI_Tuto_ItemHp_01A", true, 0, 0)
                end
                if itemKey == 42405 and questList_hasProgressQuest(4015, 6) then
                  (slot.icon):AddEffect("fUI_Tuto_ItemHp_01A", true, 0, 0)
                end
                local itemSSW = itemWrapper:getStaticStatus()
                local item_type = itemSSW:getItemType()
                if item_type == 5 then
                  Panel_Inventory_isSocketItem = true
                end
                local isSoulCollector = itemWrapper:isSoulCollector()
                local isCurrentSoulCount = itemWrapper:getSoulCollectorCount()
                local isMaxSoulCount = itemWrapper:getSoulCollectorMaxCount()
                local itemIconPath = (itemWrapper:getStaticStatus()):getIconPath()
                if isSoulCollector then
                  (slot.icon):ChangeTextureInfoName("icon/" .. itemIconPath)
                  if isCurrentSoulCount == 0 then
                    (slot.icon):ChangeTextureInfoName("icon/" .. itemIconPath)
                  end
                  if isCurrentSoulCount > 0 then
                    (slot.icon):ChangeTextureInfoName("New_UI_Common_forLua/ExceptionIcon/00040351_1.dds")
                  end
                  if isCurrentSoulCount == isMaxSoulCount then
                    (slot.icon):ChangeTextureInfoName("New_UI_Common_forLua/ExceptionIcon/00040351_2.dds")
                  end
                  local x1, y1, x2, y2 = setTextureUV_Func(slot.icon, 0, 0, 42, 42)
                  ;
                  ((slot.icon):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (slot.icon):setRenderTexture((slot.icon):getBaseTexture())
                end
                local offencePoint = 0
                local defencePoint = 0
                local equipOffencePoint = 0
                local equipDefencePoint = 0
                local isEquip = ((itemWrapper:getStaticStatus()):get()):isEquipable()
                local matchEquip = false
                local isAccessory = false
                offencePoint = self:compareSpec(currentWhereType, slotNo, isAccessory)
                local currentEndurance = (itemWrapper:get()):getEndurance()
                local isUsableServant = (itemWrapper:getStaticStatus()):isUsableServant()
                if not isUsableServant and not Panel_Window_Exchange:GetShow() then
                  if isEquip and defencePoint ~= nil and offencePoint ~= nil and currentEndurance > 0 and matchEquip == true and isAccessory == false and equipDefencePoint + equipOffencePoint < defencePoint + offencePoint then
                    (slot.icon):AddEffect("fUI_BetterItemAura01", true, 0, 0)
                    local equipPos = (itemWrapper:getStaticStatus()):getEquipSlotNo()
                    Panel_NewEquip_Update(equipPos)
                    PaGlobal_TutorialManager:handleNewEquipInInventory(slot)
                  end
                  if currentEndurance > 0 and matchEquip == true and isAccessory == true and equipOffencePoint + equipDefencePoint < offencePoint + defencePoint then
                    (slot.icon):AddEffect("fUI_BetterItemAura01", true, 0, 0)
                    local equipPos = (itemWrapper:getStaticStatus()):getEquipSlotNo()
                    Panel_NewEquip_Update(equipPos)
                  end
                  if slotNo < self._invenSlotMax and ((self._slotEtcData)[slotNo]).isFirstItem == true then
                    local newItemEffectSceneId = (slot.icon):AddEffect("fUI_NewItem02", true, 0, 0)
                    -- DECOMPILER ERROR at PC511: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    (effectScene.newItem)[slotNo] = newItemEffectSceneId
                    UIMain_ItemUpdate()
                  end
                end
                local isUsableClass = nil
                if itemSSW ~= nil then
                  if (itemSSW:get()):isWeapon() or (itemSSW:get()):isSubWeapon() or (itemSSW:get()):isAwakenWeapon() then
                    isUsableClass = ((itemSSW:get())._usableClassType):isOn(classType)
                  else
                    isUsableClass = true
                  end
                else
                  isUsableClass = false
                end
                if isEquip == false then
                  (slot.icon):SetColor(UI_color.C_FFFFFFFF)
                elseif isUsableClass == true then
                  (slot.icon):SetColor(UI_color.C_FFFFFFFF)
                else
                  (slot.icon):SetColor(UI_color.C_FFD20000)
                end
                local itemBindType = ((itemSSW:get())._vestedType):getItemKey()
                if Panel_Window_Exchange:GetShow() and itemBindType > 0 then
                  (slot.icon):SetColor(UI_color.C_FFD20000)
                end
              end
              ;
              (((self._ui).stc_lockedSlots)[ii]):SetShow(false)
            elseif ii - 1 + self._invenStartSlotIndex == openedSlotCount then
              local posX = (ii - 1) % self._invenSlotColumnMax * self._defaultXGap
              local posY = (math.floor)((ii - 1) / self._invenSlotColumnMax) * self._defaultYGap
              ;
              ((self._ui).stc_plusSlot):SetPosX(posX + 1)
              ;
              ((self._ui).stc_plusSlot):SetPosY(posY + 1)
              ;
              ((self._ui).stc_plusSlot):SetShow(true)
              ;
              (((self._ui).stc_lockedSlots)[ii]):SetShow(false)
            else
              (((self._ui).stc_lockedSlots)[ii]):SetShow(true)
            end
          end
          if self._invenSlotMax < openedSlotCount then
            ((self._ui).scroll_inven):SetShow(true)
          end
          PaGlobal_TutorialManager:handleOpenedInventory()
          self:findPuzzle()
          -- DECOMPILER ERROR: 29 unprocessed JMP targets
        end
      end
    end
  end
end

InventoryInfo.findPuzzle = function(self)
  -- function num : 0_29 , upvalues : LOWER_TAB_TYPE
  if self._isAutoSort == true then
    return 
  end
  if LOWER_TAB_TYPE.UNDEFINED == self._currentLowerTab then
    return 
  end
  local whereType = ((self._lowerTabData)[self._currentLowerTab]).whereType
  local isFind = findPuzzleAndReadyMake(whereType)
  local useSlotNo = inventorySlotNoUserStart()
  if not isFind then
    return 
  end
  local count = getPuzzleSlotCount()
  for ii = 1, count do
    local solvedSlot = getPuzzleSlotAt(ii - 1)
    for jj = 1, self._invenSlotMax do
      if solvedSlot == (((self._ui).invenSlots)[jj]).slotNo then
        ((((self._ui).invenSlots)[jj]).icon):AddEffect("UI_Item_MineCraft", true, 0, 0)
      end
    end
  end
  local slotNumber = getPuzzleSlotAt(0)
  for ii = 1, self._invenSlotMax do
    if slotNumber == (((self._ui).invenSlots)[ii]).slotNo then
      local bg = ((self._ui).stc_invenSlotBG)[ii]
      local spanX = (((self._ui).stc_invenBG):GetSpanSize()).x
      local spanY = (((self._ui).stc_invenBG):GetSpanSize()).y
      ;
      ((self._ui).btn_invenPuzzle):SetShow(true)
      ;
      ((self._ui).btn_invenPuzzle):SetPosX(bg:GetPosX() + spanX + 30)
      ;
      ((self._ui).btn_invenPuzzle):SetPosY(bg:GetPosY() + spanY + 30)
      ;
      ((self._ui).btn_invenPuzzle):removeInputEvent("Mouse_LUp")
      ;
      ((self._ui).btn_invenPuzzle):addInputEvent("Mouse_LUp", "Input_InventoryInfo_CompletePuzzle()")
    end
  end
end

InventoryInfo.updateWeight = function(self)
  -- function num : 0_30
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local _const = Defines.s64_const
  local normalInventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local s64_moneyWeight = normalInventory:getMoneyWeight_s64()
  local s64_equipmentWeight = (selfPlayer:getEquipment()):getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local s64_allWeight_div = s64_allWeight / _const.s64_100
  local s64_maxWeight_div = s64_maxWeight / _const.s64_100
  local allWeight = (string.format)("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local maxWeight = (string.format)("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  local weightLength = Int64toInt32(s64_allWeight / s64_maxWeight_div)
  if Int64toInt32(s64_allWeight) <= Int64toInt32(s64_maxWeight) then
    ((self._ui).progress2_Weight):SetProgressRate(weightLength)
    ;
    ((self._ui).progress2_Equipment):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_maxWeight_div))
    ;
    ((self._ui).progress2_Silver):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_maxWeight_div))
  else
    ;
    ((self._ui).progress2_Weight):SetProgressRate(weightLength)
    ;
    ((self._ui).progress2_Equipment):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_allWeight_div))
    ;
    ((self._ui).progress2_Silver):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_allWeight_div))
  end
  local val = ((self._ui).progress2_Weight):GetProgressRate()
  self._weightDesignatorTarget = ((self._ui).progress2_Weight):GetSizeY() - ((self._ui).progress2_Weight):GetSizeY() * (val / 100)
  self._weightDesignatorIsAnimating = true
  ;
  ((self._ui).txt_weight):SetText(allWeight .. " / " .. maxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  ;
  ((self._ui).txt_weightGlow):SetText(allWeight .. " / " .. maxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end

PaGlobalFunc_Window_InventoryInfo_PerFrameUpdate = function(deltaTime)
  -- function num : 0_31 , upvalues : InventoryInfo
  local self = InventoryInfo
  if deltaTime <= 0 then
    return 
  end
  if InventoryInfo._weightDesignatorIsAnimating == true then
    InventoryInfo:animateWeightDesignator()
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

  if InventoryInfo._showAniIsPlaying == true then
    InventoryInfo._showAniElapsed = InventoryInfo._showAniElapsed + deltaTime
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

    if InventoryInfo._showAniDuration < InventoryInfo._showAniElapsed then
      InventoryInfo._showAniIsPlaying = false
    end
  end
  if self._monitorItemCooltime == false then
    return 
  end
  local useStartSlot = inventorySlotNoUserStart()
  local currentWhereType = Inventory_GetCurrentInventoryType()
  for ii = 1, self._invenSlotMax do
    local slot = ((self._ui).invenSlots)[ii]
    local slotNo = slot.slotNo
    local remainTime = 0
    local itemReuseTime = 0
    local realRemainTime = 0
    local intRemainTime = 0
    if CppEnums.TInventorySlotNoUndefined ~= slotNo then
      remainTime = getItemCooltime(currentWhereType, slotNo)
      itemReuseTime = getItemReuseCycle(currentWhereType, slotNo) / 1000
      realRemainTime = remainTime * (itemReuseTime)
      intRemainTime = realRemainTime - realRemainTime % 1 + 1
    end
    if remainTime > 0 then
      (slot.cooltime):UpdateCoolTime(remainTime)
      ;
      (slot.cooltime):SetShow(true)
      ;
      (slot.cooltimeText):SetText(Time_Formatting_ShowTop(intRemainTime))
      if intRemainTime <= itemReuseTime then
        (slot.cooltimeText):SetShow(true)
      else
        ;
        (slot.cooltimeText):SetShow(false)
      end
    else
      if (slot.cooltime):GetShow() then
        (slot.cooltime):SetShow(false)
        ;
        (slot.cooltimeText):SetShow(false)
        local skillSlotItemPosX = (slot.cooltime):GetParentPosX()
        local skillSlotItemPosY = (slot.cooltime):GetParentPosY()
        audioPostEvent_SystemUi(2, 1)
        Panel_Inventory_CoolTime_Effect_Item_Slot:SetShow(true, true)
        Panel_Inventory_CoolTime_Effect_Item_Slot:AddEffect("UI_Button_Hide", false, 2.5, 7)
        Panel_Inventory_CoolTime_Effect_Item_Slot:AddEffect("fUI_Button_Hide", false, 2.5, 7)
        Panel_Inventory_CoolTime_Effect_Item_Slot:SetPosX(skillSlotItemPosX - 7)
        Panel_Inventory_CoolTime_Effect_Item_Slot:SetPosY(skillSlotItemPosY - 10)
      end
    end
  end
end

InventoryInfo.animateWeightDesignator = function(self)
  -- function num : 0_32
  local designtorY = ((self._ui).stc_designator):GetPosY()
  local difference = self._weightDesignatorTarget - designtorY
  if (math.abs)(difference) > 1 then
    local moveAmount = difference * 0.1
    ;
    ((self._ui).stc_designator):SetPosY(designtorY + moveAmount)
  else
    do
      ;
      ((self._ui).stc_designator):SetPosY(self._weightDesignatorTarget)
      self._weightDesignatorIsAnimating = false
      do
        local showFlipped = getScreenSizeY() - 50 < designtorY
        ;
        ((self._ui).stc_designatorImage):SetShow(not showFlipped)
        ;
        ((self._ui).stc_designatorFlippedImage):SetShow(showFlipped)
        if showFlipped then
          ((self._ui).txt_weightGlow):SetPosY(-50)
          ;
          ((self._ui).txt_weight):SetPosY(-53)
        else
          ((self._ui).txt_weightGlow):SetPosY(31)
          ;
          ((self._ui).txt_weight):SetPosY(28)
        end
        -- DECOMPILER ERROR: 3 unprocessed JMP targets
      end
    end
  end
end

InventoryInfo.setTabTo = function(self, tabIndex)
  -- function num : 0_33 , upvalues : UPPER_TAB_TYPE, LOWER_TAB_TYPE
  self._currentUpperTab = tabIndex
  for ii = 1, #(self._ui).groups do
    (((self._ui).groups)[ii]):SetShow(false)
    ;
    (((self._ui).rdo_tabButtons)[ii]):SetCheck(false)
  end
  ;
  (((self._ui).rdo_tabButtons)[tabIndex]):SetCheck(true)
  ;
  (((self._ui).groups)[tabIndex]):SetShow(true)
  if tabIndex == UPPER_TAB_TYPE.INFORMATION then
    ((self._ui).stc_subWindowLower):SetShow(false)
  else
    ;
    ((self._ui).stc_subWindowLower):SetShow(true)
  end
  ;
  ((self._ui).txt_noServant):SetShow(false)
  if tabIndex == UPPER_TAB_TYPE.COSTUME then
    Input_InventoryInfo_SetLowerTabTo(LOWER_TAB_TYPE.CASH_INVEN)
  else
    if tabIndex == UPPER_TAB_TYPE.EQUIPMENT then
      Input_InventoryInfo_SetLowerTabTo(LOWER_TAB_TYPE.INVENTORY)
    else
      if tabIndex == UPPER_TAB_TYPE.SERVANT then
        Input_InventoryInfo_SetLowerTabTo(LOWER_TAB_TYPE.INVENTORY)
      end
    end
  end
  self:updateUpperTab(tabIndex)
end

PaGlobalFunc_InventoryInfo_SetUpperTabTo = function(tabIndex)
  -- function num : 0_34 , upvalues : InventoryInfo
  InventoryInfo:setTabTo(tabIndex)
end

Input_InventoryInfo_SetUpperTabLeft = function()
  -- function num : 0_35 , upvalues : InventoryInfo
  local self = InventoryInfo
  self._currentUpperTab = self._currentUpperTab - 1
  if self._currentUpperTab < 1 then
    self._currentUpperTab = #(self._ui).rdo_tabButtons
  end
  self:setTabTo(self._currentUpperTab)
end

_panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "Toggle_InventoryTab_forPadEventFunc(-1)")
_panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "Toggle_InventoryTab_forPadEventFunc(1)")
Toggle_InventoryTab_forPadEventFunc = function(value)
  -- function num : 0_36
  if value == 1 then
    Input_InventoryInfo_SetUpperTabRight()
  else
    Input_InventoryInfo_SetUpperTabLeft()
  end
end

Input_InventoryInfo_SetUpperTabRight = function()
  -- function num : 0_37 , upvalues : InventoryInfo
  local self = InventoryInfo
  self._currentUpperTab = self._currentUpperTab + 1
  if #(self._ui).rdo_tabButtons < self._currentUpperTab then
    self._currentUpperTab = 1
  end
  self:setTabTo(self._currentUpperTab)
end

Input_InventoryInfo_SetLowerTabLeft = function()
  -- function num : 0_38 , upvalues : InventoryInfo
  local self = InventoryInfo
  self._currentLowerTab = self._currentLowerTab - 1
  if self._currentLowerTab < 1 then
    self._currentLowerTab = #self._lowerTabData
  end
  ;
  ((self._ui).txt_bagName):SetText(((self._lowerTabData)[self._currentLowerTab]).name)
  self:updateInventory()
end

Input_InventoryInfo_SetLowerTabRight = function()
  -- function num : 0_39 , upvalues : InventoryInfo
  local self = InventoryInfo
  self._currentLowerTab = self._currentLowerTab + 1
  if #self._lowerTabData < self._currentLowerTab then
    self._currentLowerTab = 1
  end
  ;
  ((self._ui).txt_bagName):SetText(((self._lowerTabData)[self._currentLowerTab]).name)
  self:updateInventory()
end

Input_InventoryInfo_SetLowerTabTo = function(tabIndex)
  -- function num : 0_40 , upvalues : InventoryInfo
  local self = InventoryInfo
  if tabIndex ~= self._currentLowerTab then
    self._invenStartSlotIndex = 0
    self._currentLowerTab = tabIndex
    ;
    ((self._ui).txt_bagName):SetText(((self._lowerTabData)[self._currentLowerTab]).name)
    self:updateInventory()
  end
end

InputMRUp_InventoryInfo_EquipSlot = function(slotType, index)
  -- function num : 0_41 , upvalues : InventoryInfo
  local self = InventoryInfo
  if not isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT) or self:invokeShiftRUpFunction(slotType, index) == false and self:invokeRUpFunction(slotType, index) == false then
    local itemWrapper = ToClient_getEquipmentItem(index)
    if itemWrapper ~= nil then
      equipmentDoUnequip(index)
    end
  end
end

InputMLUp_InventoryInfo_EquipSlot = function(slotType, index)
  -- function num : 0_42
end

Input_InventoryInfo_AutoActive = function()
  -- function num : 0_43 , upvalues : InventoryInfo
  _PA_LOG("박범�\128", "Input_InventoryInfo_AutoActive, " .. tostring(((InventoryInfo._ui).chk_autoActive):IsCheck()))
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).AlchemyStone, ((InventoryInfo._ui).chk_autoActive):IsCheck(), (CppEnums.VariableStorageType).eVariableStorageType_Character)
end

Input_InventoryInfo_HideHelmet = function()
  -- function num : 0_44 , upvalues : InventoryInfo
  selfPlayerShowHelmet(not ((InventoryInfo._ui).chk_HideHelmet):IsCheck())
end

Input_InventoryInfo_OpenHelmet = function()
  -- function num : 0_45 , upvalues : InventoryInfo
  selfPlayerShowBattleHelmet(((InventoryInfo._ui).chk_openHelmet):IsCheck())
end

Input_InventoryInfo_ToggleUnderwear = function(isShow)
  -- function num : 0_46 , upvalues : InventoryInfo
  local self = InventoryInfo
  if not IsSelfPlayerWaitAction() or IsSelfPlayerBattleWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_UNDERWEAR"))
    if ((self._ui).chk_showUnderwear):IsCheck() then
      ((self._ui).chk_showUnderwear):SetCheck(false)
    else
      ;
      ((self._ui).chk_showUnderwear):SetCheck(true)
    end
    return 
  end
  local selfPlayer = getSelfPlayer()
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local isSafeZone = (regionInfo:get()):isSafeZone()
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
    ((self._ui).chk_showUnderwear):SetCheck(false)
  end
end

Input_InventoryInfo_ToggleCloak = function()
  -- function num : 0_47 , upvalues : InventoryInfo
  selfPlayerShowCloak(not ((InventoryInfo._ui).chk_toggleCloak):IsCheck())
end

Input_InventoryInfo_ToggleNameWhenCamo = function()
  -- function num : 0_48
  Toclient_setShowNameWhenCamouflage(not ((getSelfPlayer()):get()):isShowNameWhenCamouflage())
end

InputMRUp_InventoryInfo_ServantInvenSlot = function(index)
  -- function num : 0_49 , upvalues : InventoryInfo
  if InputMLUp_InventoryInfo_ServantInvenDropHandler() then
    return 
  end
  local self = InventoryInfo
  if (self._servantActorKeyRaw)[1] == nil then
    return 
  end
  local servantWrapper = getServantInfoFromActorKey((self._servantActorKeyRaw)[1])
  if servantWrapper == nil then
    return 
  end
  local vehicleType = servantWrapper:getVehicleType()
  FGlobal_PopupMoveItem_Init((CppEnums.ItemWhereType).eServantInventory, index, vehicleType, (self._servantActorKeyRaw)[1], true)
end

InputMLUp_InventoryInfo_ServantInvenDropHandler = function()
  -- function num : 0_50 , upvalues : InventoryInfo
  local self = InventoryInfo
  if DragManager.dragStartPanel == nil then
    return false
  end
  if (self._servantActorKeyRaw)[1] == nil then
    return false
  end
  local actorKeyRaw = (self._servantActorKeyRaw)[1]
  local servantWrapper = getServantInfoFromActorKey((self._servantActorKeyRaw)[1])
  if servantWrapper == nil then
    return 
  end
  local vehicleType = servantWrapper:getVehicleType()
  return DragManager:itemDragMove(vehicleType, actorKeyRaw)
end

Input_InventoryInfo_ServantInvenTooltip = function(index, isShow)
  -- function num : 0_51 , upvalues : InventoryInfo, _panel
  _PA_LOG("박범�\128", "Input_InventoryInfo_ServantInvenTooltip, index ")
  local self = InventoryInfo
  Panel_Tooltip_Item_SetPosition(index, ((self._ui).servantInvenSlots)[index], "servant_inventory")
  Panel_Tooltip_Item_Show_GeneralNormal(index, "servant_inventory", isShow, nil, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end

InputMRUp_InventoryInfo_ServantEquipSlot = function(index)
  -- function num : 0_52 , upvalues : InventoryInfo, _vehicleTypeToSERVANT_TYPE, _servantData
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey((self._servantActorKeyRaw)[1])
  if servantWrapper == nil then
    return 
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  if dataType == nil then
    return 
  end
  local slotNo = ((_servantData[dataType]).equipSlotNoList)[index]
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  servant_doUnequip(servantWrapper:getActorKeyRaw(), slotNo)
end

InputMLUp_InventoryInfo_ServantEquipSlot = function()
  -- function num : 0_53
end

InputMLUp_InventoryInfo_ServantEquipToggle = function(index)
  -- function num : 0_54 , upvalues : InventoryInfo, _vehicleTypeToSERVANT_TYPE, _servantData
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey((self._servantActorKeyRaw)[1])
  if servantWrapper == nil then
    return 
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  if dataType == nil then
    return 
  end
  local slotNo = ((_servantData[dataType]).equipSlotNoList)[index]
  if ((((self._ui).servantEquipSlots)[index]).toggleButton):IsCheck() == true then
    ToClient_SetVehicleEquipSlotFlag(vehicleType, ((_servantData[dataType]).checkFlag)[slotNo])
  else
    ToClient_ResetVehicleEquipSlotFlag(vehicleType, ((_servantData[dataType]).checkFlag)[slotNo])
  end
  ToClient_setShowVehicleEquip()
end

InputMRUp_InventoryInfo_ServantCostumeSlot = function(index)
  -- function num : 0_55 , upvalues : InventoryInfo, _vehicleTypeToSERVANT_TYPE, _servantData
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey((self._servantActorKeyRaw)[1])
  if servantWrapper == nil then
    return 
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  if dataType == nil then
    return 
  end
  local slotNo = ((_servantData[dataType]).costumeSlotNoList)[index]
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
  if itemWrapper == nil then
    return 
  end
  servant_doUnequip(servantWrapper:getActorKeyRaw(), slotNo)
end

InputMLUp_InventoryInfo_ServantCostumeSlot = function()
  -- function num : 0_56
end

Input_InventoryInfo_ServantEquipShowTooltip = function(whereType, index, isShow)
  -- function num : 0_57 , upvalues : InventoryInfo, _vehicleTypeToSERVANT_TYPE, _servantData, _panel
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey((self._servantActorKeyRaw)[1])
  if servantWrapper == nil then
    return 
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  local slotNo = ((_servantData[dataType]).equipSlotNoList)[index]
  Panel_Tooltip_Item_SetPosition(slotNo, ((self._ui).servantEquipSlots)[index], "ServantEquipment")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "ServantEquipment", isShow, nil, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end

Input_InventoryInfo_ServantCostumeShowTooltip = function(whereType, index, isShow)
  -- function num : 0_58 , upvalues : InventoryInfo, _vehicleTypeToSERVANT_TYPE, _servantData, _panel
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey((self._servantActorKeyRaw)[1])
  if servantWrapper == nil then
    return 
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  local slotNo = ((_servantData[dataType]).costumeSlotNoList)[index]
  Panel_Tooltip_Item_SetPosition(slotNo, ((self._ui).servantCostumeSlots)[index], "ServantEquipment")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "ServantEquipment", isShow, nil, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end

InputMRUp_InventoryInfo_InvenSlot = function(index)
  -- function num : 0_59 , upvalues : InventoryInfo
  local self = InventoryInfo
  if not isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT) or self:invokeShiftRUpFunction(index) == false and self:invokeRUpFunction(index) == false then
    self:onInventoryItemRClick(index)
  end
end

InputMLDown_InventoryInfo_InvenSlot = function(index)
  -- function num : 0_60 , upvalues : InventoryInfo
  local self = InventoryInfo
  local slotNo = (((self._ui).invenSlots)[index]).slotNo
  local inventoryType = ((self._lowerTabData)[self._currentLowerTab]).whereType
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = selfProxy:getInventorySlotCount(inventoryType)
  if Panel_Chatting_Input:IsShow() and isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT) then
    local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    if itemWrapper == nil then
      return 
    end
    local focusEdit = GetFocusEdit()
    if ChatInput_CheckCurrentUiEdit(focusEdit) then
      FGlobal_ChattingInput_LinkedItemByInventory(slotNo, inventoryType)
    end
  else
    do
      if isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT) then
        if (isGameTypeJapan() or isGameTypeRussia()) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
          return 
        end
        local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
        if itemWrapper ~= nil then
          Note_On(((itemWrapper:get()):getKey()):getItemKey())
        end
      else
        do
          if invenUseSize - useStartSlot - self._invenStartSlotIndex == index - 1 then
            PaGlobal_EasyBuy:Open(5)
          end
        end
      end
    end
  end
end

InputMOn_InventoryInfo_invenShowTooltip = function(index)
  -- function num : 0_61 , upvalues : InventoryInfo, effectScene, _panel
  if InventoryInfo._showAniIsPlaying == true then
    return 
  end
  local self = InventoryInfo
  local slotNo = (((self._ui).invenSlots)[index]).slotNo
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R4 in 'UnsetPending'

  if slotNo < self._invenSlotMax then
    ((self._slotEtcData)[slotNo]).isFirstItem = false
    if (effectScene.newItem)[slotNo] ~= nil then
      ((((self._ui).invenSlots)[index]).icon):EraseEffect((effectScene.newItem)[slotNo])
    end
  end
  self._tooltipWhereType = ((self._lowerTabData)[self._currentLowerTab]).whereType
  self._tooltipSlotNo = slotNo
  Panel_Tooltip_Item_Show_GeneralNormal(index, "inventory", true, false, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end

InputMOut_InventoryInfo_invenHideTooltip = function(index)
  -- function num : 0_62 , upvalues : InventoryInfo, over_SlotEffect
  local self = InventoryInfo
  if over_SlotEffect ~= nil then
    ((((self._ui).invenSlots)[index]).icon):EraseEffect(over_SlotEffect)
  end
  self._tooltipWhereType = nil
  self._tooltipSlotNo = nil
  Panel_Tooltip_Item_Show_GeneralNormal(index, "inventory", false, false)
  TooltipSimple_Hide()
end

InputDrag_InventoryInfo_invenDrag = function(index)
  -- function num : 0_63 , upvalues : InventoryInfo, _panel
  local self = InventoryInfo
  local slotNo = (((self._ui).invenSlots)[index]).slotNo
  if inventoryDragNoUseList ~= nil and inventoryDragNoUseList:IsShow() then
    return 
  end
  if Panel_Win_System:GetShow() then
    return 
  end
  local whereType = ((self._lowerTabData)[self._currentLowerTab]).whereType
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    local itemSSW = itemWrapper:getStaticStatus()
    local itemType = itemSSW:getItemType()
    local isTradeItem = itemSSW:isTradeAble()
    DragManager:setDragInfo(_panel, whereType, slotNo, "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath(), Inventory_GroundClick, (getSelfPlayer()):getActorKey())
    if ((itemWrapper:getStaticStatus()):get()):isItemSkill() or ((itemWrapper:getStaticStatus()):get()):isUseToVehicle() then
      QuickSlot_ShowBackGround()
    end
    Item_Move_Sound(itemWrapper)
  end
end

InputDrag_InventoryInfo_invenDragEnd = function(index)
  -- function num : 0_64 , upvalues : InventoryInfo, _panel
  local self = InventoryInfo
  local slotNo = (((self._ui).invenSlots)[index]).slotNo
  if DragManager.dragStartPanel == nil then
    return false
  end
  if InventoryInfo:checkRestrictedAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_REPOSITIONITEM"))
    return false
  end
  if Panel_Window_Exchange:IsShow() or Panel_Manufacture:IsShow() or Panel_Alchemy:IsShow() or Panel_Win_System:IsShow() then
    DragManager:clearInfo()
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_REPOSITIONITEM_WHILE_UI"))
    return false
  end
  if _panel == DragManager.dragStartPanel then
    if DragManager.dragWhereTypeInfo == ((self._lowerTabData)[self._currentLowerTab]).whereType then
      inventory_swapItem(((self._lowerTabData)[self._currentLowerTab]).whereType, DragManager.dragSlotInfo, slotNo)
    end
    DragManager:clearInfo()
  else
    return DragManager:itemDragMove((CppEnums.MoveItemToType).Type_Player, (getSelfPlayer()):getActorKey())
  end
  return true
end

local INVEN_MAX_COUNT = 192
InputScroll_InventoryInfo_Inventory = function(isUp)
  -- function num : 0_65 , upvalues : InventoryInfo, INVEN_MAX_COUNT
  local self = InventoryInfo
  local useStartSlot = inventorySlotNoUserStart()
  local inventory = Inventory_GetCurrentInventory()
  local maxSize = inventory:sizeXXX() - useStartSlot
  local prevSlotIndex = self._invenStartSlotIndex
  self._invenStartSlotIndex = (UIScroll.ScrollEvent)((self._ui).scroll_inven, isUp, self._invenSlotRowMax, maxSize, self._invenStartSlotIndex, self._invenSlotColumnMax)
  local intervalSlotIndex = INVEN_MAX_COUNT - self._invenSlotMax
  if (prevSlotIndex == 0 and self._invenStartSlotIndex == 0) or prevSlotIndex == intervalSlotIndex and self._invenStartSlotIndex == intervalSlotIndex then
    return 
  end
  self:updateInventory()
end

InventoryInfo.onInventoryItemRClick = function(self, index)
  -- function num : 0_66
  local inventoryType = ((self._lowerTabData)[self._currentLowerTab]).whereType
  local slotNo = (((self._ui).invenSlots)[index]).slotNo
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemStatic = (itemWrapper:getStaticStatus()):get()
  if itemStatic == nil then
    return 
  end
  local itemEnchantWrapper = itemWrapper:getStaticStatus()
  if itemEnchantWrapper == nil then
    return 
  end
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  if itemWrapper ~= nil then
    if selfProxy:doRideMyVehicle() and itemStatic:isUseToVehicle() then
      inventoryUseItem(inventoryType, slotNo, equipSlotNo, false)
      return 
    end
    do
      if Panel_Window_StableStallion:GetShow() then
        local itemMaxCount = FGlobal_MaxItemCount(slotNo)
        if itemMaxCount ~= nil then
          if itemMaxCount < Int64toInt32((itemWrapper:get()):getCount_s64()) then
            Panel_NumberPad_Show(true, tonumber64(itemMaxCount), slotNo, Set_StallionItemSlot, nil, itemWrapper)
          else
            Panel_NumberPad_Show(true, (itemWrapper:get()):getCount_s64(), slotNo, Set_StallionItemSlot, nil, itemWrapper)
          end
        end
        return 
      end
      if self._rClickFunc ~= nil then
        (self._rClickFunc)(slotNo, itemWrapper, (itemWrapper:get()):getCount_s64(), inventoryType)
        return 
      end
      PaGlobal_TutorialManager:handleInventorySlotRClick(((itemWrapper:get()):getKey()):getItemKey())
      PaGlobal_TutorialManager:handleInventorySlotRClickgetSlotNo(slotNo)
      if Panel_Auction_Regist_Popup ~= nil and Panel_Auction_Regist_Popup:GetShow() then
        if (itemWrapper:getStaticStatus()):isStackable() then
          Panel_NumberPad_Show(true, (itemWrapper:get()):getCount_s64(), slotNo, Auction_RegisterItemFromInventory)
        else
          Auction_RegisterItemFromInventory(1, slotNo)
        end
        return 
      else
        if Panel_Housing_SettingVendingMachine ~= nil and Panel_Housing_SettingVendingMachine:GetShow() then
          VendingMachine_RegisterItemFromInventory(slotNo, 1)
          return 
        else
          if Panel_Housing_VendingMachineList ~= nil and Panel_Housing_VendingMachineList:GetShow() then
            FGlobal_VendingMachineRegisterItemFromInventory(slotNo)
          else
            if Panel_Housing_ConsignmentSale ~= nil and Panel_Housing_ConsignmentSale:GetShow() then
              FGlobal_ConsignmentRegisterItemFromInventory((itemWrapper:get()):getCount_s64(), slotNo)
            else
              if Panel_Window_FairySetting ~= nil and Panel_Window_FairySetting:GetShow() then
                PaGlobal_FairySetting_SetPortion((itemWrapper:get()):getKey())
              else
                if Panel_FairyInfo ~= nil and Panel_Window_FairyUpgrade:GetShow() then
                  if (itemWrapper:getStaticStatus()):isStackable() == true then
                    Panel_NumberPad_Show(true, (itemWrapper:get()):getCount_s64(), slotNo, PaGlobal_FairyUpgrade_RClickItemByNumberPad, false, (itemWrapper:get()):getKey())
                  else
                    PaGlobal_FairyUpgrade_RClickItem((itemWrapper:get()):getKey(), slotNo, 1)
                  end
                else
                  if getAuctionState() then
                    return 
                  else
                    if ((itemEnchantWrapper:get())._vestedType):getItemKey() == 2 and (itemWrapper:get()):isVested() == false then
                      local bindingItemUse = function()
    -- function num : 0_66_0 , upvalues : inventoryType, slotNo
    Inventory_UseItemTargetSelf(inventoryType, slotNo, equipSlotNo)
  end

                      local messageContent = nil
                      if itemEnchantWrapper:isUserVested() then
                        messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT_USERVESTED")
                      else
                        messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT")
                      end
                      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_TITLE"), content = messageContent, functionYes = bindingItemUse, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                      ;
                      (MessageBox.showMessageBox)(messageboxData)
                    else
                      do
                        if eConnectUiType.eConnectUi_Undefined ~= (itemWrapper:getStaticStatus()):getConnectUi() then
                          Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "inventory", false, false)
                          ConnectUI((itemWrapper:getStaticStatus()):getConnectUi())
                        else
                          if (itemWrapper:getStaticStatus()):getItemType() == 8 then
                            local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
                            if itemKey == nil then
                              return 
                            end
                            audioPostEvent_SystemUi(0, 14)
                            local invenPopupConfig = {
[1] = {func = Manufacture_On, param = slotNo, icon = nil, desc = PAGetString(Defines.StringSheet_RESOURCE, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"), enable = true}
, 
[2] = {func = Note_On, param = itemKey, icon = nil, desc = PAGetString(Defines.StringSheet_RESOURCE, "PRODUCTNOTE_BTN"), enable = true}
}
                            -- DECOMPILER ERROR at PC374: Confused about usage of register: R10 in 'UnsetPending'

                            if MiniGame_Manual_Value_FishingStart == true then
                              (invenPopupConfig[1]).enable = false
                            end
                            if not PaGlobalFunc_InventoryPopup_IsOpened() then
                              PaGlobalFunc_InventoryPopup_Open(invenPopupConfig, (((self._ui).stc_invenSlotBG)[index]):GetParentPosX(), (((self._ui).stc_invenSlotBG)[index]):GetParentPosY())
                            else
                              PaGlobalFunc_InventoryPopup_Close()
                            end
                            Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "inventory", false, false)
                            return 
                          else
                            do
                              if itemEnchantWrapper:isPopupItem() then
                                Panel_UserItem_PopupItem(itemEnchantWrapper, inventoryType, slotNo, equipSlotNo)
                                _PA_LOG("박범�\128", "itemEnchantWrapper:isPopupItem()")
                                Panel_Tooltip_Item_hideTooltip()
                              else
                                if itemEnchantWrapper:isExchangeItemNPC() or itemWrapper:isSoulCollector() then
                                  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
                                  if itemKey == nil then
                                    return 
                                  end
                                  local invenPopupConfig = {
[1] = {func = HandleClickedWayPoint, param = slotNo, icon = nil, desc = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_INVENTORY_EXCHANGE_WAYPOINT_BTN"), enable = true}
, 
[2] = {func = HandleClickedWidget, param = slotNo, icon = nil, desc = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_INVENTORY_EXCHANGE_WIDGET_BTN"), enable = true}
}
                                  -- DECOMPILER ERROR at PC468: Confused about usage of register: R10 in 'UnsetPending'

                                  if MiniGame_Manual_Value_FishingStart == true then
                                    (invenPopupConfig[1]).enable = false
                                  end
                                  if not PaGlobalFunc_InventoryPopup_IsOpened() then
                                    PaGlobalFunc_InventoryPopup_Open(invenPopupConfig, getMousePosX(), getMousePosY())
                                  else
                                    PaGlobalFunc_InventoryPopup_Close()
                                  end
                                else
                                  do
                                    if not itemStatic:isUseToVehicle() then
                                      local useTradeItem = function()
    -- function num : 0_66_1 , upvalues : inventoryType, slotNo
    Inventory_UseItemTargetSelf(inventoryType, slotNo, nil)
  end

                                      local itemSSW = itemWrapper:getStaticStatus()
                                      local item_type = itemSSW:getItemType()
                                      if item_type == 2 and (itemSSW:get()):isForJustTrade() == true then
                                        local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRADEITEMUSE_CONTENT")
                                        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRADEITEMUSE_TITLE"), content = messageContent, functionYes = useTradeItem, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                        ;
                                        (MessageBox.showMessageBox)(messageboxData)
                                      else
                                        do
                                          local equipType = (itemWrapper:getStaticStatus()):getEquipType()
                                          if equipType == 16 or equipType == 17 then
                                            local accSlotNo = FGlobal_AccSlotNo(itemWrapper, true)
                                            Inventory_UseItemTargetSelf(inventoryType, slotNo, accSlotNo)
                                          else
                                            do
                                              Inventory_UseItemTargetSelf(inventoryType, slotNo, nil)
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

InputMOn_InventoryInfo_equipShowTooltip = function(index, isOn)
  -- function num : 0_67 , upvalues : InventoryInfo, _panel
  if InventoryInfo._showAniIsPlaying == true then
    return 
  end
  Panel_Tooltip_Item_Show_GeneralNormal(index, "equipment", isOn, false, _panel:GetPosX() - 20, 200)
end

Input_InventoryInfo_CostumeShowToggle = function(index)
  -- function num : 0_68 , upvalues : InventoryInfo, _avatarCheckFlag
  local self = InventoryInfo
  local isCheck = ((((self._ui).costumeSlots)[index]).toggleButton):IsCheck()
  if isCheck == true then
    ToClient_SetAvatarEquipSlotFlag(_avatarCheckFlag[(self._costumeSlotIndex)[index]])
  else
    ToClient_ResetAvatarEquipSlotFlag(_avatarCheckFlag[(self._costumeSlotIndex)[index]])
  end
  Toclient_setShowAvatarEquip()
end

Input_InventoryInfo_CompletePuzzle = function()
  -- function num : 0_69 , upvalues : InventoryInfo
  ((InventoryInfo._ui).btn_invenPuzzle):SetShow(false)
  requestMakePuzzle()
end

Input_InventoryInfo_ItemDelete = function(index)
  -- function num : 0_70 , upvalues : InventoryInfo
  local self = InventoryInfo
  local slotNo = (((self._ui).invenSlots)[index]).slotNo
  if slotNo == nil then
    return 
  end
  local whereType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemCount = (itemWrapper:get()):getCount_s64()
  if (Defines.s64_const).s64_1 == itemCount then
    Inventory_ItemDelete_Check((Defines.s64_const).s64_1, slotNo, whereType)
  else
    Panel_NumberPad_Show(true, itemCount, slotNo, Inventory_ItemDelete_Check, nil, whereType)
  end
end

Inventory_ItemDelete_Check = function(count, slotNo, whereType)
  -- function num : 0_71
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  local itemName = (itemWrapper:getStaticStatus()):getName()
  deleteWhereType = whereType
  deleteSlotNo = slotNo
  itemCount = count
  DragManager:clearInfo()
  local luaDeleteItemMsg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DELETEITEM_MSG", "itemName", itemName, "itemCount", tostring(count))
  local luaDelete = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DELETE")
  local messageContent = luaDeleteItemMsg
  local messageboxData = {title = luaDelete, content = messageContent, functionYes = Inventory_Delete_Yes, functionNo = Inventory_Delete_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Inventory_Delete_Yes = function()
  -- function num : 0_72
  if deleteSlotNo == nil then
    return 
  end
  local itemWrapper = getInventoryItemByType(deleteWhereType, deleteSlotNo)
  if itemWrapper == nil then
    return 
  end
  if (CppEnums.ContentsEventType).ContentsType_InventoryBag == ((itemWrapper:getStaticStatus()):get()):getContentsEventType() then
    local bagType = (itemWrapper:getStaticStatus()):getContentsEventParam1()
    local bagSize = (itemWrapper:getStaticStatus()):getContentsEventParam2()
    local isEmptyBag = false
    for index = 0, bagSize - 1 do
      local bagItemWrapper = getInventoryBagItemByType(deleteWhereType, deleteSlotNo, index)
      if bagItemWrapper ~= nil then
        if (CppEnums.InventoryBagType).eInventoryBagType_Cash == bagType then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_DELETEITEM_ALERT"))
        else
          if (CppEnums.InventoryBagType).eInventoryBagType_Equipment == bagType then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_DELETEITEM_ALERT2"))
          else
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_DELETEITEM_ALERT3"))
          end
        end
        DragManager:clearInfo()
        Inventory_DropEscape()
        return 
      end
    end
  end
  do
    if itemWrapper:isCash() then
      PaymentPassword(Inventory_Delete_YesXXX)
      return 
    end
    Inventory_Delete_YesXXX()
    PaGlobal_TutorialManager:handleInventoryDelete(itemWrapper, deleteWhereType, deleteSlotNo)
  end
end

Inventory_Delete_YesXXX = function()
  -- function num : 0_73
  if deleteSlotNo == nil then
    return 
  end
  deleteItem((getSelfPlayer()):getActorKey(), deleteWhereType, deleteSlotNo, itemCount)
  Inventory_DropEscape()
  DragManager:clearInfo()
end

Inventory_Delete_No = function()
  -- function num : 0_74
  deleteWhereType = nil
  deleteSlotNo = nil
  Inventory_DropEscapeAlert()
  DragManager:clearInfo()
end

FromClient_InventoryInfo_EquipmentHaveChanged = function()
  -- function num : 0_75 , upvalues : InventoryInfo
  local self = InventoryInfo
  self:updateEquipment()
  self:updateCostume()
  self:updateInventory()
end

FromClient_InventoryInfo_EventEquipItem = function(slotIndex)
  -- function num : 0_76 , upvalues : InventoryInfo
  local self = InventoryInfo
  local slot = {}
  if self:slotIndexIsCostume(slotIndex) == true then
    slot = ((self._ui).costumeSlots)[self:getIndexFromCostumeSlotIndex(slotIndex)]
    ;
    (slot.icon):AddEffect("UI_ItemInstall_Cash", false, 0, 0)
  else
    slot = ((self._ui).equipSlots)[self:getIndexFromEquipSlotIndex(slotIndex)]
    ;
    (slot.icon):AddEffect("UI_ItemInstall", false, 0, 0)
  end
  ;
  (slot.icon):AddEffect("fUI_SkillButton01", false, 0, 0)
  self:updateAttackStat(true)
end

FromClient_InventoryInfo_ServantEquipOn = function(slotIndex)
  -- function num : 0_77
end

FromClient_InventoryInfo_ServantEquipChanged = function()
  -- function num : 0_78 , upvalues : InventoryInfo
  InventoryInfo:updateInventory()
  InventoryInfo:updateServantEquipOrCostume(true)
end

FromClient_InventoryInfo_OnScreenResize = function()
  -- function num : 0_79 , upvalues : InventoryInfo, _panel
  local self = InventoryInfo
  local screenY = getScreenSizeY()
  _panel:SetSize(_panel:GetSizeX(), screenY)
  ;
  ((self._ui).stc_weightBarBG):SetSize(((self._ui).stc_weightBarBG):GetSizeX(), screenY)
  ;
  ((self._ui).progress2_Weight):SetSize(((self._ui).stc_weightBarBG):GetSizeX(), screenY)
  ;
  ((self._ui).progress2_Equipment):SetSize(((self._ui).stc_weightBarBG):GetSizeX(), screenY)
  ;
  ((self._ui).progress2_Silver):SetSize(((self._ui).stc_weightBarBG):GetSizeX(), screenY)
end

FromClient_InventoryInfo_updateInvenSlot = function()
  -- function num : 0_80 , upvalues : InventoryInfo
  InventoryInfo:updateInventory()
  InventoryInfo:updateWeight()
end

FromClient_InventoryInfo_SetShow = function(isShow)
  -- function num : 0_81 , upvalues : InventoryInfo
  if isShow == false then
    PaGlobalFunc_Window_InventoryInfo_Close()
  else
    InventoryInfo:open()
  end
end

FromClient_InventoryInfo_SetShowWithFilter = function(actorType)
  -- function num : 0_82
  PaGlobalFunc_InventoryInfo_Open()
  if (CppEnums.ActorType).ActorType_Player == actorType or (CppEnums.ActorType).ActorType_Deadbody == actorType then
    Inventory_SetFunctor(InvenFiler_InterActionDead, Inventory_UseItemTarget, InventoryWindow_Close, nil)
  else
    if (CppEnums.ActorType).ActorType_Vehicle == actorType then
      Inventory_SetFunctor(InvenFiler_InterActionFodder, Inventory_UseItemTarget, InventoryWindow_Close, nil)
    else
      if (CppEnums.ActorType).ActorType_Npc == actorType then
        Inventory_SetFunctor(InvenFiler_InterActionFuel, Inventory_UseFuelItem, InventoryWindow_Close, nil)
      end
    end
  end
end

FromClient_InventoryInfo_UnequipItem = function(whereType, slotNo)
  -- function num : 0_83 , upvalues : InventoryInfo
  local self = InventoryInfo
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemStatic = (itemWrapper:getStaticStatus()):get()
  if itemStatic == nil then
    return 
  end
  if self:slotIndexIsCostume(slotNo) then
    for ii = 1, #self._costumeSlotIndex do
      local slot = ((self._ui).costumeSlots)[ii]
      if slotNo == slot.slotNo then
        (slot.icon):AddEffect("fUI_Item_Clear", false, 0, 0)
      end
    end
  else
    do
      for ii = 1, #self._equipSlotIndex do
        local slot = ((self._ui).equipSlots)[ii]
        if slotNo == slot.slotNo then
          (slot.icon):AddEffect("fUI_Item_Clear", false, 0, 0)
        end
      end
      do
        audioPostEvent_SystemUi(2, 0)
      end
    end
  end
end

FromClient_InventoryInfo_UseItemAskFromOtherPlayer = function(fromName)
  -- function num : 0_84
  local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_USEITEM_MESSAGEBOX_REQUEST", "for_name", fromName)
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_USEITEM_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = UseItemFromOtherPlayer_Yes, functionCancel = UseItemFromOtherPlayer_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

FromClient_InventoryInfo_FindExchangeItemNPC = function()
  -- function num : 0_85
  local itemEnchantKey = ((getSelfPlayer()):get()):getCurrentFindExchangeItemEnchantKey()
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  if itemSSW == nil then
    return 
  end
  FindExchangeItemNPC(itemSSW)
end

FromClient_InventoryInfo_updateSlotDatabyAddItem = function()
  -- function num : 0_86
  if PaGlobalFunc_Window_InventoryInfo_isOpened() == true then
    Inventory_updateSlotData()
  end
end

FromClient_InventoryInfo_ResistChanged = function()
  -- function num : 0_87 , upvalues : InventoryInfo
  InventoryInfo:updateInformation()
end

FromClient_InventoryInfo_PotentialChanged = function()
  -- function num : 0_88 , upvalues : InventoryInfo
  InventoryInfo:updateInformation()
end

FromClient_InventoryInfo_FitnessChanged = function()
  -- function num : 0_89 , upvalues : InventoryInfo
  InventoryInfo:updateInformation()
end

Inventory_SetShow = function(isInvenShow)
  -- function num : 0_90
  if not isInvenShow then
    InventoryWindow_Close()
    Panel_Tooltip_Item_hideTooltip()
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
  else
    InventoryWindow_Show()
  end
end

Inventory_SetFunctor = function(filterFunction, rClickFunction, otherWindowOpenFunction, effect)
  -- function num : 0_91 , upvalues : InventoryInfo
  local self = InventoryInfo
  if otherWindowOpenFunction == self._otherWindowOpenFunc then
    do
      do
        local otherWindowOpenFuncDiff = self._otherWindowOpenFunc == nil or otherWindowOpenFunction == nil
        if otherWindowOpenFuncDiff and (filterFunction ~= nil or rClickFunction ~= nil or otherWindowOpenFunction ~= nil) then
          (self._otherWindowOpenFunc)()
        end
        if filterFunction ~= nil and type(filterFunction) ~= "function" then
          filterFunction = nil
          ;
          (UI.ASSERT)(false, "Param 1 must be Function type")
        end
        if rClickFunction ~= nil and type(rClickFunction) ~= "function" then
          rClickFunction = nil
          ;
          (UI.ASSERT)(false, "Param 2 must be Function type")
        end
        if otherWindowOpenFunction ~= nil and type(otherWindowOpenFunction) ~= "function" then
          otherWindowOpenFunction = nil
          ;
          (UI.ASSERT)(false, "Param 3 must be Function type")
        end
        if effect ~= nil and type(effect) ~= "function" then
          effect = nil
          ;
          (UI.ASSERT)(false, "Param 4 must be Function type")
        end
        self._otherWindowOpenFunc = otherWindowOpenFunction
        self._rClickFunc = rClickFunction
        self._filterFunc = filterFunction
        self._effect = effect
        if PaGlobalFunc_InventoryInfo_IsOpened() then
          self:updateInventory()
        end
        -- DECOMPILER ERROR: 8 unprocessed JMP targets
      end
    end
  end
end

local inventoryDragNoUseList = nil
FGlobal_SetInventoryDragNoUse = function(pPanel)
  -- function num : 0_92 , upvalues : inventoryDragNoUseList
  inventoryDragNoUseList = pPanel
end

PaGlobalFunc_InventoryInfo_GetSlotNo = function(fromSlotNo)
  -- function num : 0_93 , upvalues : InventoryInfo
  if fromSlotNo == nil then
    return 
  end
  local self = InventoryInfo
  local toSlotNo = (((self._ui).invenSlots)[fromSlotNo]).slotNo
  return toSlotNo
end

Inventory_GetToopTipItem = function()
  -- function num : 0_94 , upvalues : InventoryInfo
  local self = InventoryInfo
  if self._tooltipWhereType == nil then
    return nil
  end
  if self._tooltipSlotNo == nil then
    return nil
  end
  local wrapper = getInventoryItemByType(self._tooltipWhereType, self._tooltipSlotNo)
  if wrapper == nil then
    return wrapper
  end
end

Inventory_GetToolTipItemSlotNo = function()
  -- function num : 0_95 , upvalues : InventoryInfo
  local self = InventoryInfo
  if self._tooltipWhereType == nil then
    return nil
  end
  if self._tooltipSlotNo == nil then
    return nil
  end
  return self._tooltipSlotNo
end

FGlobal_CheckUnderwear = function()
  -- function num : 0_96 , upvalues : InventoryInfo
  local self = InventoryInfo
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local isSafeZone = (regionInfo:get()):isSafeZone()
  if not isSafeZone then
    ((self._ui).chk_showUnderwear):SetCheck(false)
  end
end

PaGlobalFunc_InventoryInfo_ItemComparer = function(ii, jj)
  -- function num : 0_97
  return Global_ItemComparer(ii, jj, getInventoryItemByType, Inventory_GetCurrentInventoryType())
end

Inventory_GetCurrentInventory = function()
  -- function num : 0_98
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return nil
  end
  local selfPlayer = selfPlayerWrapper:get()
  local inventory = selfPlayer:getInventoryByType(Inventory_GetCurrentInventoryType())
  return inventory
end

Inventory_GetCurrentInventoryType = function()
  -- function num : 0_99 , upvalues : InventoryInfo, LOWER_TAB_TYPE
  local self = InventoryInfo
  if LOWER_TAB_TYPE.UNDEFINED == self._currentLowerTab then
    return ((self._lowerTabData)[LOWER_TAB_TYPE.INVENTORY]).whereType
  else
    return ((self._lowerTabData)[self._currentLowerTab]).whereType
  end
end

Inventory_GetStartIndex = function()
  -- function num : 0_100 , upvalues : InventoryInfo
  return InventoryInfo._invenStartSlotIndex
end

getInventory_RealSlotNo = function(index)
  -- function num : 0_101 , upvalues : InventoryInfo
  local self = InventoryInfo
  if ((self._ui).invenSlots)[index] == nil then
    return index
  end
  return (((self._ui).invenSlots)[index]).slotNo
end

Global_GetInventorySlotNoByNotSorted = function(fromSlotNo)
  -- function num : 0_102 , upvalues : InventoryInfo
  if fromSlotNo == nil then
    return 
  end
  local self = InventoryInfo
  local toSlotNo = (((self._ui).invenSlots)[fromSlotNo]).slotNo
  return toSlotNo
end

FGlobal_AccSlotNo = function(itemWrapper, isChange)
  -- function num : 0_103 , upvalues : InventoryInfo
  local self = InventoryInfo
  local equipType = (itemWrapper:getStaticStatus()):getEquipType()
  local firstRingOffence = 0
  local firstRingDeffence = 0
  local secondRingOffence = 0
  local secondRingDeffence = 0
  local acc = nil
  if equipType == 16 then
    equipItemWrapper = ToClient_getEquipmentItem(8)
    equipItemWrapper2 = ToClient_getEquipmentItem(9)
    if equipItemWrapper ~= nil and equipItemWrapper2 ~= nil then
      acc = 8 + self._slotRingIndex
      if isChange then
        if self._slotRingIndex == 0 then
          self._slotRingIndex = 1
        else
          self._slotRingIndex = 0
        end
      end
    else
      if equipItemWrapper == nil and equipItemWrapper2 ~= nil then
        self._slotRingIndex = 0
        acc = 8
      else
        if equipItemWrapper ~= nil and equipItemWrapper2 == nil then
          self._slotRingIndex = 0
          acc = 9
        else
          self._slotRingIndex = 0
          acc = 8
        end
      end
    end
  else
    if equipType == 17 then
      equipItemWrapper = ToClient_getEquipmentItem(10)
      equipItemWrapper2 = ToClient_getEquipmentItem(11)
      if equipItemWrapper ~= nil and equipItemWrapper2 ~= nil then
        acc = 10 + self._slotEarringIndex
        if isChange then
          if self._slotEarringIndex == 0 then
            self._slotEarringIndex = 1
          else
            self._slotEarringIndex = 0
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

local isFirstSummonItemUse = false
Inventory_UseItemTargetSelf = function(whereType, slotNo, equipSlotNo)
  -- function num : 0_104 , upvalues : InventoryInfo, isFirstSummonItemUse
  local self = InventoryInfo
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  -- DECOMPILER ERROR at PC33: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC33: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC33: Unhandled construct in 'MakeBoolean' P3

  if (itemKey >= 41548 and itemKey <= 41570) or itemKey < 42000 or itemKey < 42034 or itemKey == 42054 then
    audioPostEvent_SystemUi(0, 14)
  end
  inventoryUseItem(whereType, slotNo, equipSlotNo, true)
  if (itemKey == 42000 or itemKey == 42001 or itemKey == 42002 or itemKey == 42010 or itemKey == 42003 or itemKey == 42004 or itemKey == 42034 or itemKey == 42035 or itemKey == 42037 or itemKey == 42036 or itemKey == 42006 or itemKey == 42008 or itemKey == 42039 or itemKey == 42038 or itemKey == 42007 or itemKey == 42053 or itemKey == 41610 or itemKey == 42009 or itemKey == 42054 or itemKey == 42057 or itemKey == 42061 or itemKey == 42066 or itemKey == 42055 or itemKey == 42056) and PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() then
    isFirstSummonItemUse = true
  end
end

FGlobal_FirstSummonItemUse = function()
  -- function num : 0_105 , upvalues : isFirstSummonItemUse
  return isFirstSummonItemUse
end

Inventory_UseItemTarget = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_106
  if restrictedActionForUseItem() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_USEITEM"))
    return 
  end
  local isTargetSelfPlayer = false
  inventoryUseItem(inventoryType, slotNo, isTargetSelfPlayer)
end

InventoryInfo.addEffectBlackStone = function(self, ii, isFiltered, slotNo)
  -- function num : 0_107
  local slot = ((self._ui).invenSlots)[ii]
  local itemWrapper = getInventoryItemByType(Inventory_GetCurrentInventoryType(), slotNo)
  local Panel_Inventory_isBlackStone_16002 = false
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  if itemKey == 16001 then
    if not isFiltered then
      (slot.icon):AddEffect("fUI_DarkstoneAura01", true, 0, 0)
    end
    Panel_Inventory_isBlackStone_16001 = true
  else
    if itemKey == 16002 then
      if not isFiltered then
        (slot.icon):AddEffect("fUI_DarkstoneAura02", true, 0, 0)
      end
      Panel_Inventory_isBlackStone_16002 = true
    end
  end
  return Panel_Inventory_isBlackStone_16002
end

InventoryInfo.addEffectMapea = function(self, ii, slotNo)
  -- function num : 0_108
  local slot = ((self._ui).invenSlots)[ii]
  local itemWrapper = getInventoryItemByType(Inventory_GetCurrentInventoryType(), slotNo)
  if GetUIMode() == (Defines.UIMode).eUIMode_Stable and not EffectFilter_Mapae(slotNo, itemWrapper) then
    (slot.icon):AddEffect("fUI_HorseNameCard01", true, 0, 0)
  end
end

local _hpPotionKeys = {502, 513, 514, 517, 518, 519, 524, 525, 528, 529, 530, 538, 551, 552, 553, 554, 555, 17568, 17569, 19932, 19933, 19934, 19935}
local _mpPotionKeys = {503, 515, 516, 520, 521, 522, 526, 527, 531, 532, 533, 540, 561, 562, 563, 564, 565, 17570, 17571, 19936, 19937, 19938}
InventoryInfo.autoSetPotion = function(self, playerLevel, itemKey, currentWhereType, slotNo)
  -- function num : 0_109 , upvalues : _hpPotionKeys, _mpPotionKeys
  if playerLevel <= 10 then
    local hpPotionFound = false
    for ii = 1, #_hpPotionKeys do
      if itemKey == _hpPotionKeys[ii] then
        hpPotionFound = true
        break
      end
    end
    do
      if hpPotionFound then
        FGlobal_Potion_InvenToQuickSlot(currentWhereType, slotNo, 0)
        return 
      end
      local mpPotionFound = false
      for ii = 1, #_mpPotionKeys do
        if itemKey == _mpPotionKeys[ii] then
          mpPotionFound = true
          break
        end
      end
      do
        if mpPotionFound then
          FGlobal_Potion_InvenToQuickSlot(currentWhereType, slotNo, 1)
        end
      end
    end
  end
end

InvenFiler_InterActionDead = function(slotNo, itemWrapper)
  -- function num : 0_110
  if itemWrapper == nil then
    return true
  end
  if not ((itemWrapper:getStaticStatus()):get()):isItemTargetAlive() then
    return not itemWrapper:checkConditions()
  end
end

InvenFiler_InterActionFodder = function(slotNo, itemWrapper)
  -- function num : 0_111
  if itemWrapper == nil then
    return true
  end
  do return ((itemWrapper:getStaticStatus()):get()):isUseToVehicle() and not itemWrapper:checkConditions() end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

InvenFiler_InterActionFuel = function(slotNo, itemWrapper)
  -- function num : 0_112
  if itemWrapper == nil then
    return true
  end
  return not isFusionItem(Inventory_GetCurrentInventoryType(), slotNo)
end

Inventory_UseFuelItem = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_113
  burnItemToActor(inventoryType, slotNo, 1, false)
end

FindExchangeItemNPC = function(itemSSW)
  -- function num : 0_114
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local selfPosition = float3(selfProxy:getPositionX(), selfProxy:getPositionY(), selfProxy:getPositionZ())
  local itemKey = ((itemSSW:get())._key):get()
  local npcPosition = {}
  local minIndex = 0
  local minDistance = 0
  ToClient_DeleteNaviGuideByGroup(0)
  local count = itemSSW:getExchangeItemNPCInfoListCount()
  for index = 0, count - 1 do
    local spawnData = npcByCharacterKey_getNpcInfo(itemSSW:getCharacterKeyByIdx(index), itemSSW:getDialogIndexByIdx(index))
    if spawnData ~= nil then
      local npcPos = spawnData:getPosition()
      npcPosition[index] = npcPos
      local distance = ((Util.Math).calculateDistance)(selfPosition, npcPos)
      if index == 0 then
        minDistance = distance
      else
        if distance < minDistance then
          minIndex = index
          minDistance = distance
        end
      end
    end
  end
  for ii = 0, count - 1 do
    if ii ~= minIndex and npcPosition[ii] ~= nil then
      worldmapNavigatorStart(float3((npcPosition[ii]).x, (npcPosition[ii]).y, (npcPosition[ii]).z), NavigationGuideParam(), false, false, true)
    end
  end
  if npcPosition[minIndex] ~= nil then
    worldmapNavigatorStart(float3((npcPosition[minIndex]).x, (npcPosition[minIndex]).y, (npcPosition[minIndex]).z), NavigationGuideParam(), false, false, true)
  end
  audioPostEvent_SystemUi(0, 14)
  selfProxy:setCurrentFindExchangeItemEnchantKey(itemKey)
end

InventoryInfo.compareSpec = function(self, whereType, slotNo, isAccessory)
  -- function num : 0_115
  local selfPlayerWrapper = getSelfPlayer()
  local classType = selfPlayerWrapper:getClassType()
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  local equipItemWrapper = ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())
  local offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
  local defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
  local equipOffencePoint = 0
  local equipDefencePoint = 0
  local matchEquip = false
  local isEquip = (((itemWrapper:getStaticStatus()):get())._usableClassType):isOn(classType)
  local isAwakenWeaponContentsOpen = (PaGlobal_AwakenSkill.awakenWeapon)[classType]
  if isEquip and not Panel_Window_Exchange:GetShow() then
    local equipType = (itemWrapper:getStaticStatus()):getEquipType()
    local enum_class = CppEnums.ClassType
    local firstRingOffence = 0
    local firstRingDeffence = 0
    local secondRingOffence = 0
    local secondRingDeffence = 0
    local matchEquip = true
    if equipType == 16 or equipType == 17 then
      local accSlotNo = FGlobal_AccSlotNo(itemWrapper, false)
      local equipItemWrapper = ToClient_getEquipmentItem(accSlotNo)
      if equipItemWrapper ~= nil then
        equipOffencePoint = ((equipItemWrapper:getStaticStatus()):getMinDamage(0) + (equipItemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
        equipDefencePoint = (equipItemWrapper:getStaticStatus()):getDefence()
        return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, true
      else
        return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, true
      end
    else
      do
        if equipType == 15 or equipType == 18 then
          equipItemWrapper = ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())
          if equipItemWrapper ~= nil then
            equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
            equipDefencePoint = ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getDefence()
            matchEquip = true
          else
            equipOffencePoint = 0
            equipDefencePoint = 0
            matchEquip = true
          end
          return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, true
        end
        equipItemWrapper = ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())
        if equipItemWrapper ~= nil then
          equipDefencePoint = ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getDefence(0)
          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          if ((enum_class.ClassType_Warrior == classType or enum_class.ClassType_Valkyrie == classType) and equipType == 1) or not isAwakenWeaponContentsOpen or equipType == 12 then
            offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
            equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
            defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
            matchEquip = true
          else
            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            if (enum_class.ClassType_Giant == classType and equipType == 29) or not isAwakenWeaponContentsOpen or equipType == 12 then
              offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
              equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
              matchEquip = true
            else
              -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P3

              if ((enum_class.ClassType_Ranger == classType or enum_class.ClassType_Orange == classType) and equipType == 31) or not isAwakenWeaponContentsOpen or equipType == 12 then
                offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(1) + (itemWrapper:getStaticStatus()):getMaxDamage(1)) / 2
                equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(1) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(1)) / 2
                matchEquip = true
              else
                -- DECOMPILER ERROR at PC407: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC407: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC407: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC407: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC407: Unhandled construct in 'MakeBoolean' P3

                if (enum_class.ClassType_Sorcerer == classType and equipType == 28) or not isAwakenWeaponContentsOpen or equipType == 12 then
                  offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                  equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(2) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(2)) / 2
                  matchEquip = true
                else
                  -- DECOMPILER ERROR at PC464: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC464: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC464: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC464: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC464: Unhandled construct in 'MakeBoolean' P3

                  if (enum_class.ClassType_Tamer == classType and equipType == 2) or not isAwakenWeaponContentsOpen or equipType == 12 then
                    offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                    equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(2) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(2)) / 2
                    matchEquip = true
                  else
                    -- DECOMPILER ERROR at PC526: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC526: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC526: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC526: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC526: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC526: Unhandled construct in 'MakeBoolean' P3

                    if ((enum_class.ClassType_NinjaWomen == classType or enum_class.ClassType_NinjaMan == classType) and equipType == 2) or not isAwakenWeaponContentsOpen or equipType == 12 then
                      offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                      equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
                      matchEquip = true
                    else
                      -- DECOMPILER ERROR at PC586: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC586: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC586: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC586: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC586: Unhandled construct in 'MakeBoolean' P3

                      if ((enum_class.ClassType_BladeMaster == classType or enum_class.ClassType_BladeMasterWomen == classType) and equipType == 3) or not isAwakenWeaponContentsOpen or equipType == 12 then
                        offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                        equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
                        matchEquip = true
                      else
                        -- DECOMPILER ERROR at PC646: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC646: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC646: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC646: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC646: Unhandled construct in 'MakeBoolean' P3

                        if ((enum_class.ClassType_Wizard == classType or enum_class.ClassType_WizardWomen == classType) and equipType == 6) or not isAwakenWeaponContentsOpen or equipType == 12 then
                          offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                          equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(2) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(2)) / 2
                          matchEquip = true
                        else
                          -- DECOMPILER ERROR at PC703: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC703: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC703: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC703: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC703: Unhandled construct in 'MakeBoolean' P3

                          if (enum_class.ClassType_DarkElf == classType and equipType == 63) or not isAwakenWeaponContentsOpen or equipType == 12 then
                            offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                            equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(2) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(2)) / 2
                            matchEquip = true
                          else
                            -- DECOMPILER ERROR at PC763: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC763: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC763: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC763: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC763: Unhandled construct in 'MakeBoolean' P3

                            if enum_class.ClassType_Combattant == classType or ((enum_class.ClassType_CombattantWomen == classType and equipType == 65) or not isAwakenWeaponContentsOpen or equipType == 12) then
                              offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                              equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
                              matchEquip = true
                            else
                              -- DECOMPILER ERROR at PC820: Unhandled construct in 'MakeBoolean' P3

                              -- DECOMPILER ERROR at PC820: Unhandled construct in 'MakeBoolean' P3

                              -- DECOMPILER ERROR at PC820: Unhandled construct in 'MakeBoolean' P3

                              -- DECOMPILER ERROR at PC820: Unhandled construct in 'MakeBoolean' P3

                              -- DECOMPILER ERROR at PC820: Unhandled construct in 'MakeBoolean' P3

                              if (enum_class.ClassType_Lahn == classType and equipType == 67) or not isAwakenWeaponContentsOpen or equipType == 12 then
                                offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                                equipOffencePoint = (((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((ToClient_getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
                                matchEquip = true
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
        else
          -- DECOMPILER ERROR at PC880: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC880: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC880: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC880: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC880: Unhandled construct in 'MakeBoolean' P3

          if ((enum_class.ClassType_Warrior == classType or enum_class.ClassType_Valkyrie == classType) and equipType == 1) or not isAwakenWeaponContentsOpen or equipType == 12 then
            offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
            defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
            matchEquip = true
          else
            -- DECOMPILER ERROR at PC919: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC919: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC919: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC919: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC919: Unhandled construct in 'MakeBoolean' P3

            if (enum_class.ClassType_Giant == classType and equipType == 29) or not isAwakenWeaponContentsOpen or equipType == 12 then
              offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
              defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
              matchEquip = true
            else
              -- DECOMPILER ERROR at PC965: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC965: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC965: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC965: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC965: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC965: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC965: Unhandled construct in 'MakeBoolean' P3

              if ((enum_class.ClassType_Ranger == classType or enum_class.ClassType_Orange == classType) and equipType == 31) or not isAwakenWeaponContentsOpen or equipType == 12 then
                offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(1) + (itemWrapper:getStaticStatus()):getMaxDamage(1)) / 2
                defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                matchEquip = true
              else
                -- DECOMPILER ERROR at PC1004: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC1004: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC1004: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC1004: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC1004: Unhandled construct in 'MakeBoolean' P3

                if (enum_class.ClassType_Sorcerer == classType and equipType == 28) or not isAwakenWeaponContentsOpen or equipType == 12 then
                  offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                  defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                  matchEquip = true
                else
                  -- DECOMPILER ERROR at PC1043: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC1043: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC1043: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC1043: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC1043: Unhandled construct in 'MakeBoolean' P3

                  if (enum_class.ClassType_Tamer == classType and equipType == 2) or not isAwakenWeaponContentsOpen or equipType == 12 then
                    offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                    defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                    matchEquip = true
                  else
                    -- DECOMPILER ERROR at PC1087: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1087: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1087: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1087: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1087: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1087: Unhandled construct in 'MakeBoolean' P3

                    if ((enum_class.ClassType_NinjaWomen == classType or enum_class.ClassType_NinjaMan == classType) and equipType == 2) or not isAwakenWeaponContentsOpen or equipType == 12 then
                      offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                      defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                      matchEquip = true
                    else
                      -- DECOMPILER ERROR at PC1129: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC1129: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC1129: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC1129: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC1129: Unhandled construct in 'MakeBoolean' P3

                      if ((enum_class.ClassType_BladeMaster == classType or enum_class.ClassType_BladeMasterWomen == classType) and equipType == 3) or not isAwakenWeaponContentsOpen or equipType == 12 then
                        offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                        defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                        matchEquip = true
                      else
                        -- DECOMPILER ERROR at PC1171: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC1171: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC1171: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC1171: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC1171: Unhandled construct in 'MakeBoolean' P3

                        if ((enum_class.ClassType_Wizard == classType or enum_class.ClassType_WizardWomen == classType) and equipType == 6) or not isAwakenWeaponContentsOpen or equipType == 12 then
                          offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                          defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                          matchEquip = true
                        else
                          -- DECOMPILER ERROR at PC1210: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC1210: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC1210: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC1210: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC1210: Unhandled construct in 'MakeBoolean' P3

                          if (enum_class.ClassType_DarkElf == classType and equipType == 63) or not isAwakenWeaponContentsOpen or equipType == 12 then
                            offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                            defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                            matchEquip = true
                          else
                            -- DECOMPILER ERROR at PC1252: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC1252: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC1252: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC1252: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC1252: Unhandled construct in 'MakeBoolean' P3

                            if enum_class.ClassType_Combattant == classType or ((enum_class.ClassType_CombattantWomen == classType and equipType == 65) or not isAwakenWeaponContentsOpen or equipType == 12) then
                              offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                              defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                              matchEquip = true
                            else
                              -- DECOMPILER ERROR at PC1291: Unhandled construct in 'MakeBoolean' P3

                              -- DECOMPILER ERROR at PC1291: Unhandled construct in 'MakeBoolean' P3

                              -- DECOMPILER ERROR at PC1291: Unhandled construct in 'MakeBoolean' P3

                              -- DECOMPILER ERROR at PC1291: Unhandled construct in 'MakeBoolean' P3

                              -- DECOMPILER ERROR at PC1291: Unhandled construct in 'MakeBoolean' P3

                              if (enum_class.ClassType_Lahn == classType and equipType == 67) or not isAwakenWeaponContentsOpen or equipType == 12 then
                                offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                                defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                                matchEquip = true
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
        isAccessory = false
        do return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, isAccessory end
      end
    end
  end
end

Inventory_updateSlotData = function(ignorePanelVisibility)
  -- function num : 0_116 , upvalues : InventoryInfo
  InventoryInfo:updateInventory(ignorePanelVisibility)
end

FGlobal_UpdateInventoryWeight = function()
  -- function num : 0_117 , upvalues : InventoryInfo
  InventoryInfo:updateWeight()
end

InventoryWindow_Close = function()
  -- function num : 0_118
  PaGlobalFunc_InventoryInfo_Close()
end

HandleClicked_InventoryWindow_Close = function()
  -- function num : 0_119
  PaGlobalFunc_InventoryInfo_Close()
end

Inven_FindPuzzle = function()
  -- function num : 0_120 , upvalues : InventoryInfo
  InventoryInfo:findPuzzle()
end

InventoryWindow_Show = function()
  -- function num : 0_121
  PaGlobalFunc_InventoryInfo_Open()
end

InventoryInfo.checkRestrictedAction = function(self)
  -- function num : 0_122
  if not checkManufactureAction() then
    local isRestricted = checkAlchemyAction()
  end
  return isRestricted
end

Manufacture_On = function(slotNo)
  -- function num : 0_123
  if Panel_Manufacture:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  if ToClient_GetMyTeamNoLocalWar() ~= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_LOCALWAR_ALERT"))
    return 
  end
  Panel_Invertory_Manufacture_BG:SetShow(false)
  Manufacture_Show(nil, (CppEnums.ItemWhereType).eInventory, true)
end

Note_On = function(itemKey)
  -- function num : 0_124
  ProductNote_Item_ShowToggle(itemKey)
  Panel_Invertory_Manufacture_BG:SetShow(false)
end

HandleClickedWayPoint = function(slotNo)
  -- function num : 0_125
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local inventory = selfProxy:getInventory()
  if not inventory:empty(slotNo) then
    local itemWrapper = getInventoryItem(slotNo)
    if itemWrapper == nil then
      return 
    end
    local itemSSW = itemWrapper:getStaticStatus()
    if itemSSW == nil then
      return 
    end
    FindExchangeItemNPC(itemSSW)
  end
end

FindExchangeItemNPC = function(itemSSW)
  -- function num : 0_126
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local selfPosition = float3(selfProxy:getPositionX(), selfProxy:getPositionY(), selfProxy:getPositionZ())
  local itemKey = ((itemSSW:get())._key):get()
  local npcPosition = {}
  local minIndex = 0
  local minDistance = 0
  ToClient_DeleteNaviGuideByGroup(0)
  local count = itemSSW:getExchangeItemNPCInfoListCount()
  for index = 0, count - 1 do
    local spawnData = npcByCharacterKey_getNpcInfo(itemSSW:getCharacterKeyByIdx(index), itemSSW:getDialogIndexByIdx(index))
    if spawnData ~= nil then
      local npcPos = spawnData:getPosition()
      npcPosition[index] = npcPos
      local distance = ((Util.Math).calculateDistance)(selfPosition, npcPos)
      if index == 0 then
        minDistance = distance
      else
        if distance < minDistance then
          minIndex = index
          minDistance = distance
        end
      end
    end
  end
  for ii = 0, count - 1 do
    if ii ~= minIndex and npcPosition[ii] ~= nil then
      worldmapNavigatorStart(float3((npcPosition[ii]).x, (npcPosition[ii]).y, (npcPosition[ii]).z), NavigationGuideParam(), false, false, true)
    end
  end
  if npcPosition[minIndex] ~= nil then
    worldmapNavigatorStart(float3((npcPosition[minIndex]).x, (npcPosition[minIndex]).y, (npcPosition[minIndex]).z), NavigationGuideParam(), false, false, true)
  end
  audioPostEvent_SystemUi(0, 14)
  selfProxy:setCurrentFindExchangeItemEnchantKey(itemKey)
end

HandleClickedWidget = function(slotNo)
  -- function num : 0_127
  local inventoryType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  local itemSSW = itemWrapper:getStaticStatus()
  whereUseItemSlotNo = slotNo
  whereUseItemSSW = itemSSW
  FGlobal_WhereUseITemDirectionOpen(itemSSW, slotNo)
end

PaGlobal_Inventory = {_itemKeyForTutorial = nil, _isItemSlotRClickedForTutorial = false}
-- DECOMPILER ERROR at PC1999: Confused about usage of register: R21 in 'UnsetPending'

PaGlobal_Inventory.addSlotEffectForTutorial = function(self, slot, effectString, isLoop, posX, posY)
  -- function num : 0_128
  (slot.icon):AddEffect(effectString, isLoop, posX, posY)
  ;
  (PaGlobal_TutorialUiManager:getUiMasking()):showInventoryMasking((slot.icon):GetPosX(), (slot.icon):GetPosY())
end

-- DECOMPILER ERROR at PC2003: Confused about usage of register: R21 in 'UnsetPending'

PaGlobal_Inventory.setItemKeyForTutorial = function(self, itemKey)
  -- function num : 0_129
  self._itemKeyForTutorial = itemKey
end

-- DECOMPILER ERROR at PC2007: Confused about usage of register: R21 in 'UnsetPending'

PaGlobal_Inventory.clearItemKeyForTutorial = function(self, itemKey)
  -- function num : 0_130
  self._itemKeyForTutorial = nil
end

-- DECOMPILER ERROR at PC2011: Confused about usage of register: R21 in 'UnsetPending'

PaGlobal_Inventory.isItemSlotRClickedForTutorial = function(self)
  -- function num : 0_131
  return self._isItemSlotRClickedForTutorial
end

-- DECOMPILER ERROR at PC2015: Confused about usage of register: R21 in 'UnsetPending'

PaGlobal_Inventory.setIsitemSlotRClickedForTutorial = function(self, bool)
  -- function num : 0_132
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  PaGlobal_Inventory._isItemSlotRClickedForTutorial = bool
end

-- DECOMPILER ERROR at PC2019: Confused about usage of register: R21 in 'UnsetPending'

PaGlobal_Inventory.findItemWrapper = function(self, itemWhereType, targetItemKey, targetEnchantLevel)
  -- function num : 0_133
  local inventory = ((getSelfPlayer()):get()):getInventoryByType(itemWhereType)
  if inventory == nil then
    return false
  end
  local invenMaxSize = inventory:sizeXXX()
  for ii = 0, invenMaxSize - 1 do
    local itemWrapper = getInventoryItem(ii)
    if itemWrapper ~= nil then
      local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
      local enchantLevel = ((itemWrapper:get()):getKey()):getEnchantLevel()
      if itemKey == targetItemKey then
        if targetEnchantLevel == nil then
          return itemWrapper
        else
          if targetEnchantLevel ~= nil and enchantLevel == targetEnchantLevel then
            return itemWrapper
          end
        end
      end
    end
  end
  return nil
end

FGlobal_UpdateInventorySlotData = function()
  -- function num : 0_134 , upvalues : InventoryInfo
  InventoryInfo:updateInventory()
end

Servant_GetActorKeyFromItemToolTip = function()
  -- function num : 0_135
  PaGlobalFunc_InventoryInfo_GetServantActorKey()
end

PaGlobalFunc_InventoryInfo_GetServantActorKey = function()
  -- function num : 0_136 , upvalues : InventoryInfo
  return (InventoryInfo._servantActorKeyRaw)[1]
end

FGlobal_AlchemyStonCheck = function()
  -- function num : 0_137 , upvalues : InventoryInfo
  local itemWrapper = ToClient_getEquipmentItem(27)
  local coolTime = 0
  do
    if itemWrapper ~= nil and ((InventoryInfo._ui).chk_autoActive):IsCheck() then
      local alchemyStoneType = ((itemWrapper:getStaticStatus()):get())._contentsEventParam1
      if alchemyStoneType == 0 or alchemyStoneType == 3 then
        coolTime = 302
      else
        if alchemyStoneType == 1 or alchemyStoneType == 4 then
          coolTime = 302
        else
          if alchemyStoneType == 2 or alchemyStoneType == 5 then
            coolTime = 602
          else
            if alchemyStoneType == 6 then
              coolTime = 302
            end
          end
        end
      end
    end
    return coolTime
  end
end

Inventory_PosSaveMemory = function()
  -- function num : 0_138
end

Inventory_PosLoadMemory = function()
  -- function num : 0_139
end

Inventory_SetIgnoreMoneyButton = function()
  -- function num : 0_140
end

inventory_FlushRestoreFunc = function()
  -- function num : 0_141
end

EquipmentWindow_Close = function()
  -- function num : 0_142
end

Equipment_PosSaveMemory = function()
  -- function num : 0_143
end

Equipment_PosLoadMemory = function()
  -- function num : 0_144
end

Inventory_DropEscape = function()
  -- function num : 0_145
end

InventoryInfo.invokeRUpFunction = function(self, index)
  -- function num : 0_146
  return false
end

InventoryInfo.invokeShiftRUpFunction = function(self, index)
  -- function num : 0_147
  return false
end

InventoryInfo.invokeLUpFunction = function(self, index)
  -- function num : 0_148
  return false
end

InventoryInfo.invokeShiftLUpFunction = function(self, index)
  -- function num : 0_149
  return false
end

InventoryInfo.slotIndexIsCostume = function(self, slotIndex)
  -- function num : 0_150
  for ii = 1, #self._costumeSlotIndex do
    if slotIndex == (self._costumeSlotIndex)[ii] then
      return true
    end
  end
  return false
end

InventoryInfo.getIndexFromEquipSlotIndex = function(self, slotIndex)
  -- function num : 0_151
  for ii = 1, #self._equipSlotIndex do
    if slotIndex == (self._equipSlotIndex)[ii] then
      return ii
    end
  end
  ;
  (UI.ASSERT)(false, "index " .. slotIndex .. " is not found at _equipSlotIndex")
  return nil
end

InventoryInfo.getIndexFromCostumeSlotIndex = function(self, slotIndex)
  -- function num : 0_152
  for ii = 1, #self._costumeSlotIndex do
    if slotIndex == (self._costumeSlotIndex)[ii] then
      return ii
    end
  end
  ;
  (UI.ASSERT)(false, "index " .. slotIndex .. " is not found at _costumeSlotIndex")
  return nil
end

InventoryInfo.getNearbyServantsActorKeys = function(self)
  -- function num : 0_153
  local keys = {}
  for ii = 1, (CppEnums.ServantType).Type_Count do
    if servant_checkDistance(ii - 1) then
      local vehicle = (getTemporaryInformationWrapper()):getUnsealVehicle(ii - 1)
      if vehicle ~= nil and (vehicle:getInventory()):size() > 0 and vehicle:getVehicleType() ~= (CppEnums.VehicleType).Type_CampingTent then
        keys[#keys + 1] = vehicle:getActorKeyRaw()
      end
    end
  end
  return keys
end

InventoryInfo.extendedSlotInfo = function(self, itemWrapper, slotNo)
  -- function num : 0_154
  local itemSSW = itemWrapper:getStaticStatus()
  local slotNoMax = itemSSW:getExtendedSlotCount()
  local ret = false
  for i = 1, slotNoMax do
    local extendSlotNo = itemSSW:getExtendedSlotIndex(i - 1)
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R11 in 'UnsetPending'

    if slotNoMax ~= extendSlotNo then
      (self._extendedSlotArray)[extendSlotNo] = slotNo
      ret = true
    end
  end
  return ret
end

InventoryInfo.setItemInfoUseWrapper = function(self, slot, itemWrapper, isMono, isExtended, slotNo)
  -- function num : 0_155
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


