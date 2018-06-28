local _panel = Panel_Window_Inventory
local _isInitialized = false
local UPPER_TAB_TYPE = {
  UNDEFINED = 0,
  EQUIPMENT = 1,
  COSTUME = 2,
  INFORMATION = 3,
  SERVANT = 4,
  AUXILIARY = 5
}
local LOWER_TAB_TYPE = {
  UNDEFINED = 0,
  INVENTORY = 1,
  CASH_INVEN = 2
}
local WHERE_TYPE = {
  INVENTORY = CppEnums.ItemWhereType.eInventory,
  EQUIPMENT = CppEnums.ItemWhereType.eEquip,
  WAREHOUSE = CppEnums.ItemWhereType.eWarehouse,
  SERVANT_INVEN = CppEnums.ItemWhereType.eServantInventory,
  SERVANT_EQUIP = CppEnums.ItemWhereType.eServantEquip,
  GUILD_WAREHOUSE = CppEnums.ItemWhereType.eGuildWarehouse,
  CASH_INVEN = CppEnums.ItemWhereType.eCashInventory,
  INVEN_BAG = CppEnums.ItemWhereType.eInventoryBag,
  CASH_INVEN_BAG = CppEnums.ItemWhereType.eCashInventoryBag
}
local UI_color = Defines.Color
local InventoryInfo = {
  _ui = {
    stc_windowTopEnd = UI.getChildControl(_panel, "Static_WindowTopEnd"),
    stc_rotateDeco1 = nil,
    stc_rotateDeco2 = nil,
    stc_topEndPictogram = nil,
    txt_topEndTitle = nil,
    stc_subWindowMoney = UI.getChildControl(_panel, "Static_SubWindowMoney"),
    stc_silverIcon = nil,
    txt_Silver = nil,
    txt_Pearl = nil,
    txt_Mileage = nil,
    stc_subWindowUpper = UI.getChildControl(_panel, "Static_SubWindowUpper"),
    stc_upperBorderLeft = nil,
    stc_upperBorderRight = nil,
    stc_upperGroups = nil,
    stc_topEndBorder = UI.getChildControl(_panel, "Static_TopEndBorder"),
    rdo_tabButtons = nil,
    equipSlotTemplate = nil,
    costumeSlotTemplate = nil,
    invenSlotTemplate = nil,
    servantInvenSlotTemplate = nil,
    servantEquipSlotTemplate = nil,
    servantCostumeSlotTemplate = nil,
    stc_EquipBG = nil,
    txt_attackText = nil,
    txt_awakenAttackText = nil,
    txt_defenceText = nil,
    txt_attackValue = nil,
    txt_awakenAttackValue = nil,
    txt_defenceValue = nil,
    chk_autoActive = nil,
    chk_hideHelmet = nil,
    chk_openHelmet = nil,
    chk_showUnderwear = nil,
    chk_toggleCloak = nil,
    chk_toggleNameWhenCamo = nil,
    frame_characterInfo = nil,
    stc_characterInfoBG = nil,
    txt_resistValues = nil,
    txt_fitnessSubtitles = nil,
    txt_fitnessValues = nil,
    setItemEffectTitleList = nil,
    setItemEffectValueList = nil,
    frame_setEffect = nil,
    stc_setEffectBG = nil,
    stc_noSetEffect = nil,
    frame_servantInven = nil,
    stc_servantInfoBG = nil,
    stc_contentBG = nil,
    txt_servantName = nil,
    progress2_servantWeight = nil,
    txt_servantInvenCountDisplay = nil,
    txt_servantWeightValue = nil,
    stc_horseWeight = nil,
    txt_servantEquipInfo = nil,
    txt_servantCostumeInfo = nil,
    txt_noServant = nil,
    stc_subWindowLower = UI.getChildControl(_panel, "Static_SubWindowLower"),
    stc_itemSlotTemplate = nil,
    stc_highlight = nil,
    txt_invenName = nil,
    scroll_inven = nil,
    stc_invenBG = nil,
    stc_plusSlot = nil,
    stc_lockedSlots = {},
    slot_inven = {},
    stc_invenSlotBG = {},
    stc_weightBarBG = UI.getChildControl(_panel, "Static_WeightBarBG"),
    progress2_Weight = nil,
    progress2_Equipment = nil,
    progress2_Silver = nil,
    stc_designator = nil,
    stc_designatorImage = nil,
    stc_designatorFlippedImage = nil,
    txt_weightGlow = nil,
    txt_weight = nil,
    stc_xBoxKey_LB = UI.getChildControl(_panel, "Static_XBoxKey_LB"),
    stc_xBoxKey_RB = UI.getChildControl(_panel, "Static_XBoxKey_RB"),
    stc_xBoxKey_LT = nil,
    stc_xBoxKey_RT = nil,
    equipSlotBG = {},
    equipSlots = {},
    costumeSlotBG = {},
    costumeSlots = {},
    potencialBars = {},
    stc_servantInvenSlotBG = {},
    servantslot_inven = {},
    stc_servantEquipSlotBG = {},
    servantEquipSlots = {},
    stc_servantCostumeSlotBG = {},
    servantCostumeSlots = {},
    stc_keyGuide = nil,
    stc_keyGuideB = nil,
    txt_keyGuideAForSelect = nil
  },
  _isAutoSort = false,
  _rotateVal1 = 45,
  _rotateVal2 = 0,
  _tabXGab = 80,
  _resistCount = 4,
  _fitnessCount = 3,
  _setItemEffectTitleCount = nil,
  _setItemEffectValueCount = nil,
  _setItemEffectData = nil,
  _invenSlotColumnMax = 8,
  _invenSlotRowMax = 9,
  _invenSlotMax = 72,
  _invenCapacity = nil,
  _invenStartSlotIndex = 0,
  _slotEtcData = {},
  _servantInvenSlotMax = 50,
  _servantEquipSlotMax = 6,
  _defaultXGap = 54,
  _defaultYGap = 54,
  _weightDesignatorTarget = nil,
  _weightDesignatorIsAnimating = false,
  _servantActorKeyRaw = nil,
  _tooltipWhereType = nil,
  _tooltipSlotNo = nil,
  _rClickFunc = nil,
  _filterFunc = nil,
  _otherWindowOpenFunc = nil,
  _effect = nil,
  _currentUpperTab = 0,
  _upperTabsData = {
    [UPPER_TAB_TYPE.EQUIPMENT] = {},
    [UPPER_TAB_TYPE.COSTUME] = {},
    [UPPER_TAB_TYPE.INFORMATION] = {},
    [UPPER_TAB_TYPE.SERVANT] = {},
    [UPPER_TAB_TYPE.AUXILIARY] = {}
  },
  _currentLowerTab = 0,
  _lowerTabData = {
    [LOWER_TAB_TYPE.INVENTORY] = {
      name = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_RENEW_INVENTORY"),
      whereType = WHERE_TYPE.INVENTORY
    },
    [LOWER_TAB_TYPE.CASH_INVEN] = {
      name = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_RENEW_PEARLINVEN"),
      whereType = WHERE_TYPE.CASH_INVEN
    }
  },
  _equipSlotNo = {
    0,
    6,
    10,
    11,
    7,
    27,
    1,
    3,
    4,
    8,
    9,
    2,
    29,
    5,
    12,
    31,
    13
  },
  _costumeSlotNo = {
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    22,
    23,
    21,
    30
  },
  _configForInven = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCooltime = true,
    createExpiration = true,
    createExpirationBG = true,
    createExpiration2h = true,
    createClassEquipBG = true,
    createEnduranceIcon = true,
    createCooltimeText = true,
    createCash = true,
    createItemLock = true,
    createBagIcon = true,
    createSoulComplete = true
  },
  _configForEquip = {
    createIcon = true,
    createBorder = true,
    createCount = false,
    createCash = true,
    createEnchant = true,
    createEnduranceIcon = true,
    createItemLock = true
  },
  _configForCostume = {
    createIcon = true,
    createBorder = true,
    createCount = false,
    createCash = true,
    createEnchant = true,
    createEnduranceIcon = true,
    createItemLock = true
  },
  _slotRingIndex = 0,
  _slotEarringIndex = 0,
  _showAniIsPlaying = false,
  _showAniElapsed = 0,
  _showAniDuration = 0.3,
  _monitorItemCooltime = false,
  _extendedSlotArray = {}
}
local _avatarCheckFlag = {
  [14] = 1,
  [15] = 2,
  [16] = 4,
  [17] = 8,
  [18] = 32,
  [19] = 64,
  [20] = 16,
  [22] = 256,
  [23] = 512,
  [21] = 128,
  [3] = 65536,
  [4] = 131072,
  [5] = 262144,
  [6] = 524288,
  [0] = 2097152,
  [1] = 4194304,
  [30] = 1024
}
local _awakenWeaponContentsOption = {
  [CppEnums.ClassType.ClassType_Warrior] = ToClient_IsContentsGroupOpen("901"),
  [CppEnums.ClassType.ClassType_Ranger] = ToClient_IsContentsGroupOpen("902"),
  [CppEnums.ClassType.ClassType_Sorcerer] = ToClient_IsContentsGroupOpen("903"),
  [CppEnums.ClassType.ClassType_Giant] = ToClient_IsContentsGroupOpen("904"),
  [CppEnums.ClassType.ClassType_Tamer] = ToClient_IsContentsGroupOpen("905"),
  [CppEnums.ClassType.ClassType_BladeMaster] = ToClient_IsContentsGroupOpen("906"),
  [CppEnums.ClassType.ClassType_BladeMasterWomen] = ToClient_IsContentsGroupOpen("907"),
  [CppEnums.ClassType.ClassType_Valkyrie] = ToClient_IsContentsGroupOpen("908"),
  [CppEnums.ClassType.ClassType_Wizard] = ToClient_IsContentsGroupOpen("909"),
  [CppEnums.ClassType.ClassType_WizardWomen] = ToClient_IsContentsGroupOpen("910"),
  [CppEnums.ClassType.ClassType_NinjaMan] = ToClient_IsContentsGroupOpen("911"),
  [CppEnums.ClassType.ClassType_NinjaWomen] = ToClient_IsContentsGroupOpen("912"),
  [CppEnums.ClassType.ClassType_DarkElf] = ToClient_IsContentsGroupOpen("913"),
  [CppEnums.ClassType.ClassType_Combattant] = ToClient_IsContentsGroupOpen("914"),
  [CppEnums.ClassType.ClassType_CombattantWomen] = ToClient_IsContentsGroupOpen("918"),
  [CppEnums.ClassType.ClassType_Lahn] = ToClient_IsContentsGroupOpen("916"),
  [CppEnums.ClassType.ClassType_Orange] = ToClient_IsContentsGroupOpen("943")
}
local _equipSlotNoIdToString = {
  [0] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_MAINHAND"),
  [1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_SUBHAND"),
  [2] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_GATHERTOOLS"),
  [3] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_UPPERBODY"),
  [4] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_GLOVES"),
  [5] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_BOOTS"),
  [6] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_HELM"),
  [7] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_NECKLACE"),
  [8] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"),
  [9] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"),
  [10] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"),
  [11] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"),
  [12] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_WAISTBAND"),
  [13] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_LANTERN"),
  [14] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_BODY"),
  [15] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HANDS"),
  [16] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_BOOTS"),
  [17] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HELM"),
  [18] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_MAIN"),
  [19] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_SUB"),
  [20] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_UNDERWEAR"),
  [22] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_EYES"),
  [23] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_MOUSE"),
  [21] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_AVATAR_HEAD"),
  [27] = PAGetString(Defines.StringSheet_GAME, "Lua_equipSlotNo_String_alchemyStone"),
  [29] = PAGetString(Defines.StringSheet_GAME, "Lua_equipSlotNo_String_awakenWeapon"),
  [30] = PAGetString(Defines.StringSheet_GAME, "Lua_equipSlotNo_String_avatarAwakenWeapon"),
  [31] = PAGetString(Defines.StringSheet_GAME, "LUA_EQUIPMENT_QUESTBOOK")
}
local SERVANT_TYPE = {
  HORSE_AND_ETC = 1,
  CARRIAGE = 2,
  SMALL_SHIP = 3,
  BIG_SHIP = 4
}
local _vehicleTypeToSERVANT_TYPE = {
  [CppEnums.VehicleType.Type_Horse] = SERVANT_TYPE.HORSE_AND_ETC,
  [CppEnums.VehicleType.Type_Camel] = SERVANT_TYPE.HORSE_AND_ETC,
  [CppEnums.VehicleType.Type_Donkey] = SERVANT_TYPE.HORSE_AND_ETC,
  [CppEnums.VehicleType.Type_Elephant] = SERVANT_TYPE.HORSE_AND_ETC,
  [CppEnums.VehicleType.Type_RidableBabyElephant] = SERVANT_TYPE.HORSE_AND_ETC,
  [CppEnums.VehicleType.Type_Carriage] = SERVANT_TYPE.CARRIAGE,
  [CppEnums.VehicleType.Type_CowCarriage] = SERVANT_TYPE.CARRIAGE,
  [CppEnums.VehicleType.Type_Train] = SERVANT_TYPE.CARRIAGE,
  [CppEnums.VehicleType.Type_RepairableCarriage] = SERVANT_TYPE.CARRIAGE,
  [CppEnums.VehicleType.Type_SailingBoat] = SERVANT_TYPE.BIG_SHIP,
  [CppEnums.VehicleType.Type_PersonalBattleShip] = SERVANT_TYPE.BIG_SHIP,
  [CppEnums.VehicleType.Type_PersonTradeShip] = SERVANT_TYPE.BIG_SHIP,
  [CppEnums.VehicleType.Type_PersonalBoat] = SERVANT_TYPE.BIG_SHIP,
  [CppEnums.VehicleType.Type_Boat] = SERVANT_TYPE.SMALL_SHIP,
  [CppEnums.VehicleType.Type_Raft] = SERVANT_TYPE.SMALL_SHIP,
  [CppEnums.VehicleType.Type_FishingBoat] = SERVANT_TYPE.SMALL_SHIP
}
local _servantData = {
  [SERVANT_TYPE.HORSE_AND_ETC] = {
    equipSlotNoList = {
      3,
      4,
      5,
      6,
      12
    },
    costumeSlotNoList = {
      14,
      15,
      16,
      17
    },
    pictogramUV = {
      [3] = {
        259,
        87,
        301,
        129
      },
      [4] = {
        259,
        173,
        301,
        215
      },
      [5] = {
        259,
        44,
        301,
        86
      },
      [6] = {
        259,
        130,
        301,
        172
      },
      [12] = {
        259,
        216,
        301,
        258
      },
      [14] = {
        302,
        87,
        344,
        129
      },
      [15] = {
        302,
        173,
        344,
        215
      },
      [16] = {
        302,
        44,
        344,
        86
      },
      [17] = {
        302,
        130,
        344,
        172
      }
    },
    checkFlag = {
      [3] = 1,
      [4] = 2,
      [5] = 4,
      [6] = 8,
      [14] = 16,
      [15] = 32,
      [16] = 64,
      [17] = 128
    }
  },
  [SERVANT_TYPE.CARRIAGE] = {
    equipSlotNoList = {
      4,
      5,
      6,
      13,
      25
    },
    costumeSlotNoList = {
      14,
      15,
      26
    },
    pictogramUV = {
      [4] = {
        173,
        173,
        215,
        215
      },
      [5] = {
        130,
        302,
        172,
        344
      },
      [6] = {
        87,
        302,
        129,
        344
      },
      [13] = {
        44,
        44,
        86,
        86
      },
      [25] = {
        173,
        216,
        215,
        258
      },
      [14] = {
        216,
        216,
        258,
        258
      },
      [15] = {
        216,
        173,
        258,
        215
      },
      [16] = {
        302,
        87,
        344,
        129
      },
      [17] = {
        302,
        87,
        344,
        129
      },
      [26] = {
        130,
        173,
        172,
        215
      }
    }
  },
  [SERVANT_TYPE.BIG_SHIP] = {
    equipSlotNoList = {
      3,
      4,
      5,
      12,
      25
    },
    costumeSlotNoList = {
      14,
      15,
      16,
      26
    },
    pictogramUV = {
      [3] = {
        87,
        259,
        129,
        301
      },
      [4] = {
        1,
        216,
        43,
        258
      },
      [5] = {
        173,
        259,
        215,
        301
      },
      [12] = {
        173,
        302,
        215,
        344
      },
      [25] = {
        1,
        259,
        43,
        301
      },
      [14] = {
        130,
        259,
        172,
        301
      },
      [15] = {
        44,
        216,
        86,
        258
      },
      [16] = {
        216,
        259,
        258,
        301
      },
      [26] = {
        44,
        259,
        86,
        301
      }
    }
  },
  [SERVANT_TYPE.SMALL_SHIP] = {
    equipSlotNoList = {
      4,
      5,
      6,
      25
    },
    costumeSlotNoList = {
      14,
      15,
      16,
      26
    },
    pictogramUV = {
      [4] = {
        1,
        216,
        43,
        258
      },
      [5] = {
        173,
        173,
        215,
        215
      },
      [6] = {
        173,
        173,
        215,
        215
      },
      [25] = {
        1,
        259,
        43,
        301
      },
      [14] = {
        130,
        259,
        172,
        301
      },
      [15] = {
        44,
        216,
        86,
        258
      },
      [16] = {
        44,
        302,
        86,
        344
      },
      [26] = {
        44,
        259,
        86,
        301
      }
    },
    checkFlag = {
      [4] = 2,
      [5] = 4,
      [6] = 8,
      [25] = 128,
      [14] = 16,
      [15] = 32,
      [16] = 64,
      [26] = 256
    }
  }
}
local _equipPictogramUV = {
  [0] = {
    1,
    87,
    43,
    129
  },
  [1] = {
    87,
    87,
    129,
    129
  },
  [2] = {
    1,
    44,
    43,
    86
  },
  [3] = {
    130,
    87,
    172,
    129
  },
  [4] = {
    130,
    44,
    172,
    86
  },
  [5] = {
    173,
    1,
    215,
    43
  },
  [6] = {
    87,
    44,
    129,
    86
  },
  [7] = {
    130,
    1,
    172,
    43
  },
  [8] = {
    1,
    1,
    43,
    43
  },
  [9] = {
    1,
    1,
    43,
    43
  },
  [10] = {
    44,
    1,
    86,
    43
  },
  [11] = {
    44,
    1,
    86,
    43
  },
  [12] = {
    87,
    1,
    129,
    43
  },
  [13] = {
    44,
    44,
    86,
    86
  },
  [14] = {
    44,
    130,
    86,
    172
  },
  [15] = {
    87,
    130,
    129,
    172
  },
  [16] = {
    216,
    1,
    258,
    43
  },
  [17] = {
    1,
    130,
    43,
    172
  },
  [18] = {
    173,
    130,
    215,
    172
  },
  [19] = {
    130,
    130,
    172,
    172
  },
  [20] = {
    216,
    44,
    258,
    86
  },
  [22] = {
    1,
    173,
    43,
    215
  },
  [23] = {
    44,
    173,
    86,
    215
  },
  [21] = {
    216,
    130,
    258,
    172
  },
  [27] = {
    173,
    44,
    215,
    86
  },
  [29] = {
    44,
    87,
    86,
    129
  },
  [30] = {
    87,
    173,
    129,
    215
  },
  [31] = {
    173,
    87,
    215,
    129
  }
}
local over_SlotEffect
local effectScene = {
  newItem = {}
}
function FromClient_luaLoadComplete_InventoryInfo_Init()
  InventoryInfo:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_InventoryInfo_Init")
function InventoryInfo:initialize()
  _panel:setGlassBackground(true)
  self._ui.stc_topEndPictogram = UI.getChildControl(self._ui.stc_windowTopEnd, "Static_TitlePicto")
  self._ui.txt_topEndTitle = UI.getChildControl(self._ui.stc_windowTopEnd, "StaticText_Title")
  self._ui.txt_Silver = UI.getChildControl(self._ui.stc_subWindowMoney, "StaticText_Silver")
  self._ui.txt_Pearl = UI.getChildControl(self._ui.stc_subWindowMoney, "StaticText_Pearl")
  self._ui.txt_Mileage = UI.getChildControl(self._ui.stc_subWindowMoney, "StaticText_Mileage")
  self._ui.stc_silverIcon = UI.getChildControl(self._ui.stc_subWindowMoney, "Static_SilverIcon")
  self._ui.rdo_tabButtons = {}
  local radioButtonCount = 4
  for ii = 1, radioButtonCount do
    self._ui.rdo_tabButtons[ii] = UI.getChildControl(self._ui.stc_topEndBorder, "RadioButton_" .. ii)
  end
  local rdoBtnsStartX = _panel:GetSizeX() / 2 - self._tabXGab * radioButtonCount / 2 + self._tabXGab / 2 - self._ui.rdo_tabButtons[1]:GetSizeX() / 2
  for ii = 1, radioButtonCount do
    self._ui.rdo_tabButtons[ii]:SetPosX(rdoBtnsStartX + self._tabXGab * (ii - 1))
  end
  self._ui.stc_upperGroups = {
    [1] = UI.getChildControl(self._ui.stc_subWindowUpper, "Static_EquipGroup"),
    [2] = UI.getChildControl(self._ui.stc_subWindowUpper, "Static_PearlGroup"),
    [3] = UI.getChildControl(self._ui.stc_subWindowUpper, "Static_InformationGroup"),
    [4] = UI.getChildControl(self._ui.stc_subWindowUpper, "Static_ServantGroup")
  }
  self._ui.stc_upperBorderLeft = UI.getChildControl(self._ui.stc_subWindowUpper, "Static_SubWindowBorderLeft")
  self._ui.stc_upperBorderRight = UI.getChildControl(self._ui.stc_subWindowUpper, "Static_SubWindowBorderRight")
  self._ui.txt_bagName = UI.getChildControl(self._ui.stc_subWindowLower, "StaticText_BagName")
  self._ui.progress2_Weight = UI.getChildControl(self._ui.stc_weightBarBG, "Progress2_Weight")
  self._ui.progress2_Equipment = UI.getChildControl(self._ui.stc_weightBarBG, "Progress2_Equipment")
  self._ui.progress2_Silver = UI.getChildControl(self._ui.stc_weightBarBG, "Progress2_Silver")
  self._ui.stc_designator = UI.getChildControl(self._ui.stc_weightBarBG, "Static_DesignatorGroup")
  self._ui.stc_designatorImage = UI.getChildControl(self._ui.stc_designator, "Static_Designator")
  self._ui.stc_designatorFlippedImage = UI.getChildControl(self._ui.stc_designator, "Static_DesignatorFlipped")
  self._ui.txt_weightGlow = UI.getChildControl(self._ui.stc_designator, "StaticText_ValueGlow")
  self._ui.txt_weight = UI.getChildControl(self._ui.stc_designator, "StaticText_Value")
  self._ui.stc_xBoxKey_LT = UI.getChildControl(self._ui.stc_subWindowLower, "Static_XBoxKey_LT")
  self._ui.stc_xBoxKey_RT = UI.getChildControl(self._ui.stc_subWindowLower, "Static_XBoxKey_RT")
  self._ui.stc_keyGuide = UI.getChildControl(_panel, "Static_Key_Guide")
  self._ui.stc_keyGuideB = UI.getChildControl(self._ui.stc_keyGuide, "StaticText_KeyGuideB")
  self._ui.stc_keyGuideB:SetText("Exit")
  self._ui.stc_keyGuideXForSort = UI.getChildControl(self._ui.stc_keyGuide, "StaticText_KeyGuideX")
  self._ui.txt_keyGuideAForSelect = UI.getChildControl(_panel, "StaticText_KeyGuideAForSelect")
  self:initEquipmentUIControls()
  self:initCostumeUIControls()
  self:initInformationUIControl()
  self:initServantUIControl()
  self:initInventory()
  self:registEventHandler()
  self:registMessageHandler()
  _isInitialized = true
end
function InventoryInfo:initEquipmentUIControls()
  self._ui.equipSlotBG = {}
  self._ui.equipSlotTemplate = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT], "Static_EquipSlotTemplate")
  local xSize, ySize = 55, 54
  local startX, startY = self._ui.equipSlotTemplate:GetPosX(), self._ui.equipSlotTemplate:GetPosY()
  local columnMax = 6
  local slotPos = {}
  if nil == self._ui.stc_EquipBG then
    self._ui.stc_EquipBG = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT], "Static_EquipBG")
  end
  for ii = 1, 32 do
    if nil ~= self._equipSlotNo[ii] then
      slotPos[ii] = UI.getChildControl(self._ui.stc_EquipBG, "Static_Slot_" .. self._equipSlotNo[ii])
      if nil ~= slotPos[ii] then
        slotPos[ii]:SetShow(false)
      end
    end
  end
  local lanternSlot = UI.getChildControl(self._ui.stc_EquipBG, "Static_Slot_13")
  lanternSlot:SetShow(false)
  for ii = 1, #self._equipSlotNo do
    self._ui.equipSlotBG[ii] = UI.cloneControl(self._ui.equipSlotTemplate, self._ui.stc_EquipBG, "equipSlotBG_" .. ii)
    local slotBG = self._ui.equipSlotBG[ii]
    local slotIndex = self._equipSlotNo[ii]
    if 13 == slotIndex then
      slotBG:SetPosX(startX + (ii - 1) % columnMax * xSize + self._defaultXGap)
    else
      slotBG:SetPosX(startX + (ii - 1) % columnMax * xSize)
    end
    slotBG:SetPosY(startY + math.floor((ii - 1) / columnMax) * ySize)
    local pictogram = UI.getChildControl(slotBG, "Static_ItemPictogram")
    if nil ~= self._equipSlotNo[ii] then
      local x1, y1, x2, y2 = setTextureUV_Func(pictogram, _equipPictogramUV[self._equipSlotNo[ii]][1], _equipPictogramUV[self._equipSlotNo[ii]][2], _equipPictogramUV[self._equipSlotNo[ii]][3], _equipPictogramUV[self._equipSlotNo[ii]][4])
      pictogram:getBaseTexture():setUV(x1, y1, x2, y2)
      pictogram:setRenderTexture(pictogram:getBaseTexture())
      self._ui.equipSlots[ii] = {}
      local slot = self._ui.equipSlots[ii]
      SlotItem.new(slot, "equipSlot_" .. ii, ii, slotBG, self._configForEquip)
      slot.equipSlotNoList = self._equipSlotNo[ii]
      slot.pictogram = pictogram
      slot:createChild()
      if ToClient_isXBox() or ToClient_IsDevelopment() then
        slot.icon:addInputEvent("Mouse_LUp", "InputMRUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. self._equipSlotNo[ii] .. ")")
        slot.icon:addInputEvent("Mouse_RUp", "InputMLUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. self._equipSlotNo[ii] .. ")")
      else
        slot.icon:addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. self._equipSlotNo[ii] .. ")")
        slot.icon:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. self._equipSlotNo[ii] .. ")")
      end
      slot.icon:addInputEvent("Mouse_On", "InputMOn_InventoryInfo_equipShowTooltip(" .. self._equipSlotNo[ii] .. ", true)")
      slot.icon:addInputEvent("Mouse_Out", "InputMOn_InventoryInfo_equipShowTooltip(" .. self._equipSlotNo[ii] .. ", false)")
      Panel_Tooltip_Item_SetPosition(self._equipSlotNo[ii], slot, "equipment")
    end
  end
  self._ui.equipSlotTemplate:SetShow(false)
  self._ui.txt_attackValue = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT], "StaticText_AttackPowerValue")
  self._ui.txt_awakenAttackValue = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT], "StaticText_AwakenAttackPowerValue")
  self._ui.txt_defenceValue = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT], "StaticText_DefencePowerValue")
  self._ui.txt_attackText = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT], "StaticText_AttackPower")
  self._ui.txt_awakenAttackText = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT], "StaticText_AwakenAttackPower")
  self._ui.txt_defenceText = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT], "StaticText_DefencePower")
  self._ui.chk_autoActive = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT], "CheckButton_AutoActive")
  self._ui.chk_autoActive:addInputEvent("Mouse_LUp", "Input_InventoryInfo_AutoActive()")
end
function InventoryInfo:initCostumeUIControls()
  self._ui.costumeSlotBG = {}
  self._ui.costumeSlotTemplate = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME], "Static_CostumeSlotTemplate")
  local xSize, ySize = 55, 54
  local startX, startY = self._ui.costumeSlotTemplate:GetPosX(), self._ui.costumeSlotTemplate:GetPosY()
  local columnMax = 4
  for ii = 1, #self._costumeSlotNo do
    self._ui.costumeSlotBG[ii] = UI.cloneControl(self._ui.costumeSlotTemplate, self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME], "costumeSlotBG_" .. ii)
    local slotBG = self._ui.costumeSlotBG[ii]
    slotBG:SetPosX(startX + (ii - 1) % columnMax * xSize)
    slotBG:SetPosY(startY + math.floor((ii - 1) / columnMax) * ySize)
    local pictogram = UI.getChildControl(slotBG, "Static_ItemPictogram")
    local x1, y1, x2, y2 = setTextureUV_Func(pictogram, _equipPictogramUV[self._costumeSlotNo[ii]][1], _equipPictogramUV[self._costumeSlotNo[ii]][2], _equipPictogramUV[self._costumeSlotNo[ii]][3], _equipPictogramUV[self._costumeSlotNo[ii]][4])
    pictogram:getBaseTexture():setUV(x1, y1, x2, y2)
    pictogram:setRenderTexture(pictogram:getBaseTexture())
    local slot = {}
    SlotItem.new(slot, "costumeSlot_" .. ii, ii, slotBG, self._configForCostume)
    slot.costumeSlotNoList = self._costumeSlotNo[ii]
    slot:createChild()
    slot.icon:addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. self._costumeSlotNo[ii] .. ")")
    slot.icon:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_EquipSlot(" .. WHERE_TYPE.EQUIPMENT .. "," .. self._costumeSlotNo[ii] .. ")")
    slot.icon:addInputEvent("Mouse_On", "InputMOn_InventoryInfo_equipShowTooltip(" .. self._costumeSlotNo[ii] .. ", true)")
    slot.icon:addInputEvent("Mouse_Out", "InputMOn_InventoryInfo_equipShowTooltip(" .. self._costumeSlotNo[ii] .. ", false)")
    slot.pictogram = pictogram
    slot.chk_toggleButton = UI.getChildControl(slotBG, "CheckButton_ShowToggle")
    slot.chk_toggleButton:addInputEvent("Mouse_LUp", "Input_InventoryInfo_CostumeShowToggle(" .. ii .. ")")
    slotBG:SetChildOrder(slot.icon:GetKey(), slot.chk_toggleButton:GetKey())
    Panel_Tooltip_Item_SetPosition(self._costumeSlotNo[ii], slot, "equipment")
    self._ui.costumeSlots[ii] = slot
  end
  self._ui.costumeSlotTemplate:SetShow(false)
  self._ui.chk_HideHelmet = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleHelmet")
  self._ui.chk_openHelmet = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleHelmetOpen")
  self._ui.chk_showUnderwear = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleUnderwear")
  self._ui.chk_toggleCloak = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleCloak")
  self._ui.chk_toggleNameWhenCamo = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME], "CheckButton_ToggleShowNameWhenCamouflage")
  self._ui.chk_HideHelmet:SetCheck(not ToClient_IsShowHelm())
  self._ui.chk_openHelmet:SetCheck(ToClient_IsShowBattleHelm())
  getSelfPlayer():get():setUnderwearModeInhouse(false)
  self._ui.chk_showUnderwear:SetCheck(getSelfPlayer():get():getUnderwearModeInhouse())
  self._ui.chk_toggleCloak:SetCheck(not ToClient_IsShowCloak())
  self._ui.chk_toggleNameWhenCamo:SetCheck(Toclient_setShowNameWhenCamouflage())
  self._ui.chk_HideHelmet:addInputEvent("Mouse_LUp", "Input_InventoryInfo_HideHelmet()")
  self._ui.chk_openHelmet:addInputEvent("Mouse_LUp", "Input_InventoryInfo_OpenHelmet()")
  self._ui.chk_showUnderwear:addInputEvent("Mouse_LUp", "Input_InventoryInfo_ToggleUnderwear()")
  self._ui.chk_toggleCloak:addInputEvent("Mouse_LUp", "Input_InventoryInfo_ToggleCloak()")
  self._ui.chk_toggleNameWhenCamo:addInputEvent("Mouse_LUp", "Input_InventoryInfo_ToggleNameWhenCamo()")
end
function InventoryInfo:initInformationUIControl()
  self._ui.frame_characterInfo = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.INFORMATION], "Frame_CharacterInfo")
  local frameContent = self._ui.frame_characterInfo:GetFrameContent()
  self._ui.stc_characterInfoBG = UI.getChildControl(frameContent, "Static_ContentBG")
  local potencialTitle = UI.getChildControl(frameContent, "StaticText_PotencialPart")
  local textTemplate = UI.getChildControl(potencialTitle, "StaticText_PotencialTemplate")
  local barTemplate = UI.getChildControl(potencialTitle, "Static_PotencialBarTemplate")
  local textPosX, textPosY = textTemplate:GetPosX(), textTemplate:GetPosY()
  local barPosX, barPosY = barTemplate:GetPosX(), barTemplate:GetPosY()
  local textList = {}
  self._ui.potencialBars = {}
  local potencialCount = 6
  local classtype = getSelfPlayer():getClassType()
  local potencialNames = {
    [0] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_1"),
    [1] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_2"),
    [2] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_3"),
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_4"),
    [4] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_5"),
    [5] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_6"),
    [6] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_7")
  }
  for ii = 1, potencialCount do
    textList[ii] = UI.cloneControl(textTemplate, potencialTitle, "StaticText_Potencial_" .. ii)
    self._ui.potencialBars[ii] = UI.cloneControl(barTemplate, potencialTitle, "Static_PotencialBar_" .. ii)
    textList[ii]:SetSpanSize(textPosX + (ii - 1) % 2 * 210, textPosY + math.floor((ii - 1) / 2) * 45)
    textList[ii]:ComputePos()
    self._ui.potencialBars[ii]:SetPosX(barPosX + (ii - 1) % 2 * 210)
    self._ui.potencialBars[ii]:SetPosY(barPosY + math.floor((ii - 1) / 2) * 45)
    textList[ii]:SetText(potencialNames[ii])
  end
  if CppEnums.ClassType.ClassType_WizardWomen == classtype or CppEnums.ClassType.ClassType_Wizard == classtype then
    textList[1]:SetText(potencialNames[1])
  else
    textList[1]:SetText(potencialNames[0])
  end
  textTemplate:SetShow(false)
  barTemplate:SetShow(false)
  local resistanceTitle = UI.getChildControl(frameContent, "StaticText_ResistancePart")
  self._ui.txt_resistValues = {}
  for ii = 1, self._resistCount do
    self._ui.txt_resistValues[ii] = UI.getChildControl(resistanceTitle, "StaticText_ResistValue_" .. ii)
  end
  local fitnessTitle = UI.getChildControl(frameContent, "StaticText_FitnessPart")
  self._ui.txt_fitnessSubtitles = {}
  self._ui.txt_fitnessValues = {}
  for ii = 1, self._fitnessCount do
    self._ui.txt_fitnessSubtitles[ii] = UI.getChildControl(fitnessTitle, "StaticText_Fitness_" .. ii)
    self._ui.txt_fitnessValues[ii] = UI.getChildControl(fitnessTitle, "StaticText_fitnessValue_" .. ii)
  end
  self._ui.frame_setEffect = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.INFORMATION], "Frame_SetItemEffect")
  self._ui.stc_setEffectBG = UI.getChildControl(self._ui.frame_setEffect:GetFrameContent(), "Static_ContentBG")
  self._ui.setItemEffectTitleList = {}
  self._ui.setItemEffectValueList = {}
  self._setItemEffectTitleCount = 1
  self._setItemEffectValueCount = 1
  frameContent:SetSize(self._ui.frame_characterInfo:GetSizeX(), self._ui.frame_characterInfo:GetSizeY() - 10)
  self._ui.frame_characterInfo:UpdateContentPos()
  self._ui.frame_characterInfo:GetVScroll():SetControlTop()
  self._ui.frame_characterInfo:GetVScroll():SetShow(false)
  self._ui.stc_noSetEffect = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.INFORMATION], "StaticText_NoSetEffect")
end
function InventoryInfo:initServantUIControl()
  self._ui.frame_servantInven = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT], "Frame_ServantInven")
  local frameContent = self._ui.frame_servantInven:GetFrameContent()
  self._ui.stc_servantInfoBG = UI.getChildControl(frameContent, "Static_ContentBG")
  local progressBG = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT], "Static_ServantWeightProgressBG")
  self._ui.stc_contentBG = UI.getChildControl(frameContent, "Static_ContentBG")
  self._ui.txt_servantName = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT], "StaticText_ServantName")
  self._ui.progress2_servantWeight = UI.getChildControl(progressBG, "Progress2_ServantWeight")
  self._ui.txt_servantInvenCountDisplay = UI.getChildControl(progressBG, "StaticText_SlotCount")
  self._ui.txt_servantWeightValue = UI.getChildControl(progressBG, "StaticText_WeightValue")
  self._ui.stc_horseWeight = UI.getChildControl(progressBG, "Static_HorseWeight")
  self._ui.txt_servantEquipInfo = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT], "StaticText_ServantEquipSlot")
  self._ui.txt_servantCostumeInfo = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT], "StaticText_ServantCostumeSlot")
  self._ui.txt_noServant = UI.getChildControl(self._ui.stc_subWindowUpper, "StaticText_NoServant")
  self._ui.txt_noServant:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_WindowTradeMarket_NotVehicleNear"))
  self._ui.servantInvenSlotTemplate = UI.getChildControl(frameContent, "Static_ServantSlotTemplate")
  self._ui.servantEquipSlotTemplate = UI.getChildControl(self._ui.txt_servantEquipInfo, "Static_EquipItemSlot_Template")
  self._ui.servantCostumeSlotTemplate = UI.getChildControl(self._ui.txt_servantCostumeInfo, "Static_CostumeItemSlot_Template")
  self._ui.servantInvenSlotTemplate:SetShow(false)
  self._ui.servantEquipSlotTemplate:SetShow(false)
  self._ui.servantCostumeSlotTemplate:SetShow(false)
  local slot = self._ui.servantslot_inven
  local slotBG = self._ui.stc_servantInvenSlotBG
  for ii = 1, self._servantInvenSlotMax do
    slotBG[ii] = UI.cloneControl(self._ui.servantInvenSlotTemplate, frameContent, "ServantInvenSlotBG_" .. ii)
    slot[ii] = {}
    SlotItem.new(slot[ii], "ServantInvenSlot_" .. ii, ii, slotBG[ii], self._configForInven)
    slot[ii]:createChild()
    slot[ii].icon:addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_ServantInvenSlot(" .. ii .. ")")
    slot[ii].icon:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantInvenDropHandler(" .. ii .. ")")
    slot[ii].icon:addInputEvent("Mouse_On", "Input_InventoryInfo_ServantInvenTooltip(" .. ii .. ", true)")
    slot[ii].icon:addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantInvenTooltip(" .. ii .. ", false)")
  end
  local servantEquipSlot = self._ui.servantEquipSlots
  local stc_servantEquipSlotBG = self._ui.stc_servantEquipSlotBG
  for ii = 1, self._servantEquipSlotMax do
    stc_servantEquipSlotBG[ii] = UI.cloneControl(self._ui.servantEquipSlotTemplate, self._ui.txt_servantEquipInfo, "ServantEquipSlotBG_" .. ii)
    stc_servantEquipSlotBG[ii]:SetPosX((ii - 1) * self._defaultXGap)
    servantEquipSlot[ii] = {}
    SlotItem.new(servantEquipSlot[ii], "ServantEquipSlot_" .. ii, ii, stc_servantEquipSlotBG[ii], self._configForEquip)
    servantEquipSlot[ii]:createChild()
    servantEquipSlot[ii].icon:addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_ServantEquipSlot(" .. ii .. ")")
    servantEquipSlot[ii].icon:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantEquipSlot(" .. ii .. ")")
    servantEquipSlot[ii].icon:addInputEvent("Mouse_On", "Input_InventoryInfo_ServantEquipShowTooltip(" .. WHERE_TYPE.SERVANT_EQUIP .. "," .. ii .. ", true)")
    servantEquipSlot[ii].icon:addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantEquipShowTooltip(" .. WHERE_TYPE.SERVANT_EQUIP .. "," .. ii .. ", false)")
    servantEquipSlot[ii].pictogram = UI.getChildControl(stc_servantEquipSlotBG[ii], "Static_ItemPictogram")
    servantEquipSlot[ii].chk_toggleButton = UI.getChildControl(stc_servantEquipSlotBG[ii], "CheckButton_ShowToggle")
    servantEquipSlot[ii].chk_toggleButton:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantEquipOrCostumeToggle(true," .. ii .. ")")
    stc_servantEquipSlotBG[ii]:SetChildOrder(servantEquipSlot[ii].icon:GetKey(), servantEquipSlot[ii].chk_toggleButton:GetKey())
  end
  local servantCostumeSlots = self._ui.servantCostumeSlots
  local stc_servantCostumeSlotBG = self._ui.stc_servantCostumeSlotBG
  for ii = 1, self._servantEquipSlotMax do
    stc_servantCostumeSlotBG[ii] = UI.cloneControl(self._ui.servantCostumeSlotTemplate, self._ui.txt_servantCostumeInfo, "ServantCostumeSlotBG_" .. ii)
    stc_servantCostumeSlotBG[ii]:SetPosX((ii - 1) * self._defaultXGap)
    servantCostumeSlots[ii] = {}
    SlotItem.new(servantCostumeSlots[ii], "ServantCostumeSlot_" .. ii, ii, stc_servantCostumeSlotBG[ii], self._configForCostume)
    servantCostumeSlots[ii]:createChild()
    servantCostumeSlots[ii].icon:addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_ServantCostumeSlot(" .. ii .. ")")
    servantCostumeSlots[ii].icon:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantCostumeSlot(" .. ii .. ")")
    servantCostumeSlots[ii].icon:addInputEvent("Mouse_On", "Input_InventoryInfo_ServantCostumeShowTooltip(" .. WHERE_TYPE.SERVANT_EQUIP .. "," .. ii .. ", true)")
    servantCostumeSlots[ii].icon:addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantCostumeShowTooltip(" .. WHERE_TYPE.SERVANT_EQUIP .. "," .. ii .. ", false)")
    servantCostumeSlots[ii].pictogram = UI.getChildControl(stc_servantCostumeSlotBG[ii], "Static_ItemPictogram")
    servantCostumeSlots[ii].chk_toggleButton = UI.getChildControl(stc_servantCostumeSlotBG[ii], "CheckButton_ShowToggle")
    servantCostumeSlots[ii].chk_toggleButton:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantEquipOrCostumeToggle(false," .. ii .. ")")
    stc_servantCostumeSlotBG[ii]:SetChildOrder(servantCostumeSlots[ii].icon:GetKey(), servantCostumeSlots[ii].chk_toggleButton:GetKey())
  end
end
function InventoryInfo:initInventory()
  self._ui.stc_invenSlotBG = {}
  self._ui.invenSlotTemplate = UI.getChildControl(self._ui.stc_subWindowLower, "Static_ItemSlotTemplate")
  self._ui.stc_invenBG = UI.getChildControl(self._ui.stc_subWindowLower, "Static_InventoryBG")
  local slotBG = self._ui.stc_invenSlotBG
  local slotTemplate = self._ui.invenSlotTemplate
  local xSize, ySize = self._defaultXGap, self._defaultYGap
  local startX, startY = 0, 0
  local columnMax = self._invenSlotColumnMax
  self._ui.slot_inven = Array.new()
  local slot = self._ui.slot_inven
  for ii = 1, self._invenSlotMax do
    slotBG[ii] = UI.cloneControl(slotTemplate, self._ui.stc_invenBG, "InvenSlotBG_" .. ii)
    slotBG[ii]:SetPosX(startX + (ii - 1) % columnMax * xSize)
    slotBG[ii]:SetPosY(startY + math.floor((ii - 1) / columnMax) * ySize)
    slot[ii] = {}
    SlotItem.new(slot[ii], "InvenSlot_" .. ii, ii, slotBG[ii], self._configForInven)
    slot[ii]:createChild()
    slot[ii].icon:addInputEvent("Mouse_LDown", "InputMLDown_InventoryInfo_InvenSlot(" .. ii .. ")")
    slot[ii].icon:addInputEvent("Mouse_LUp", "InputDrag_InventoryInfo_invenDragEnd(" .. ii .. ")")
    slot[ii].icon:addInputEvent("Mouse_On", "InputMOn_InventoryInfo_invenShowTooltip(" .. ii .. ")")
    slot[ii].icon:addInputEvent("Mouse_Out", "InputMOut_InventoryInfo_invenHideTooltip(" .. ii .. ")")
    slot[ii].icon:addInputEvent("Mouse_PressMove", "InputDrag_InventoryInfo_invenDrag(" .. ii .. ")")
    slotBG[ii]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "Input_InventoryInfo_ItemDelete(" .. ii .. ")")
    slotBG[ii]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "InputMRUp_InventoryInfo_InvenSlot(" .. ii .. ")")
    slotBG[ii]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "Input_InventoryInfo_AutoSort()")
    slot[ii].icon:SetEnableDragAndDrop(true)
    UIScroll.InputEventByControl(slotBG[ii], "InputScroll_InventoryInfo_Inventory")
    UIScroll.InputEventByControl(slot[ii].icon, "InputScroll_InventoryInfo_Inventory")
    slot[ii].expirationBG:SetPosX(2)
    slot[ii].expirationBG:SetPosY(2)
    slot[ii].icon:SetSize(44, 44)
    slot[ii].border:SetSize(46, 46)
    Panel_Tooltip_Item_SetPosition(ii, slot[ii], "inventory")
    local effectSlot = {}
    effectSlot.isFirstItem = false
    self._slotEtcData[ii] = effectSlot
    self._ui.stc_lockedSlots[ii] = UI.createAndCopyBasePropertyControl(_panel, "Static_LockedSlot", slotBG[ii], "Static_LockedSlot_" .. ii)
    if ToClient_isXBox() or ToClient_IsDevelopment() then
      if ii <= columnMax then
        slotBG[ii]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_UP, "InputScroll_InventoryInfo_Inventory(true)")
      elseif ii > columnMax * (self._invenSlotRowMax - 1) then
        slotBG[ii]:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_DOWN, "InputScroll_InventoryInfo_Inventory(false)")
      end
    end
  end
  slotTemplate:SetShow(false)
  self._ui.scroll_inven = UI.getChildControl(self._ui.stc_subWindowLower, "Scroll_Inventory")
  self._ui.scroll_inven:SetShow(false)
  UIScroll.InputEvent(self._ui.scroll_inven, "InputScroll_InventoryInfo_Inventory")
  UIScroll.InputEventByControl(self._ui.stc_invenBG, "InputScroll_InventoryInfo_Inventory")
  self._ui.btn_invenPuzzle = UI.getChildControl(self._ui.stc_subWindowLower, "Button_Puzzle")
  self._ui.btn_invenPuzzle:SetShow(false)
  self._ui.stc_plusSlot = UI.getChildControl(self._ui.stc_invenBG, "Static_OnlyPlus")
end
function InventoryInfo:registEventHandler()
  for ii = 1, #self._ui.rdo_tabButtons do
    self._ui.rdo_tabButtons[ii]:addInputEvent("Mouse_LUp", "PaGlobalFunc_InventoryInfo_SetUpperTabTo(" .. ii .. ")")
  end
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_B, "PaGlobalFunc_InventoryInfo_Close()")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "Toggle_InventoryTab_forPadEventFunc(-1)")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "Toggle_InventoryTab_forPadEventFunc(1)")
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "Input_InventoryInfo_AutoSort()")
  self._ui.stc_xBoxKey_LB:addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetUpperTabLeft()")
  self._ui.stc_xBoxKey_RB:addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetUpperTabRight()")
  self._ui.stc_xBoxKey_LT:addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetLowerTabLeft()")
  self._ui.stc_xBoxKey_RT:addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetLowerTabRight()")
end
function InventoryInfo:registMessageHandler()
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
  registerEvent("FromClient_ServantInventoryOpenWithInventory", "FromClient_InventoryInfo_OpenServantInven")
  registerEvent("FromClient_ServantInventoryUpdate", "FromClient_InventoryInfo_ServantEquipChanged")
  registerEvent("FromClient_UpdateCannonBallCount", "FromClient_InventoryInfo_ServantEquipChanged")
  registerEvent("EventServantEquipmentUpdate", "FromClient_InventoryInfo_ServantEquipChanged")
  registerEvent("EventServantEquipItem", "FromClient_InventoryInfo_ServantEquipOn")
  registerEvent("FromClient_UpdateTolerance", "FromClient_InventoryInfo_ResistChanged")
  registerEvent("FromClient_UpdateSelfPlayerStatPoint", "FromClient_InventoryInfo_PotentialChanged")
  registerEvent("FromClientFitnessUp", "FromClient_InventoryInfo_FitnessChanged")
end
function PaGlobalFunc_InventoryInfo_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_InventoryInfo_Open(openType)
  InventoryInfo:open(openType)
end
function InventoryInfo:open(openType)
  _panel:SetShow(true, false)
  self._ui.txt_keyGuideAForSelect:SetShow(false)
  if Defines.UIMode.eUIMode_Default == GetUIMode() then
    if true == PaGlobalFunc_Quest_GetShow() then
      PaGlobalFunc_Quest_Close()
    else
      FGlobal_Panel_Radar_Show(false, true)
      Panel_TimeBar:SetShow(false, true)
      FGlobal_QuestWidget_Close()
    end
  end
  if nil ~= openType then
    self._ui.rdo_tabButtons[openType]:SetCheck(true)
    self:setTabTo(openType)
  else
    self._ui.rdo_tabButtons[UPPER_TAB_TYPE.EQUIPMENT]:SetCheck(true)
    self:setTabTo(UPPER_TAB_TYPE.EQUIPMENT)
  end
  self:updateInventory()
  self:updateWeight()
  self._monitorItemCooltime = true
end
function PaGlobalFunc_InventoryInfo_Close()
  InventoryInfo:close()
end
function InventoryInfo:close()
  if _panel:IsUISubApp() then
    Inventory_SetFunctor(nil, nil, nil, nil)
    return
  end
  Panel_Tooltip_Item_hideTooltip()
  TooltipSimple_Hide()
  if nil ~= self._otherWindowOpenFunc then
    local callFunc = self._otherWindowOpenFunc
    self._otherWindowOpenFunc = nil
    callFunc()
  end
  _panel:SetShow(false, false)
  if Defines.UIMode.eUIMode_Default == GetUIMode() and false == PaGlobalFunc_Quest_GetShow() then
    FGlobal_Panel_Radar_Show(true, true)
    Panel_TimeBar:SetShow(true, true)
    FGlobal_QuestWidget_Open()
  end
  PaGlobalFunc_InventoryPopup_Close()
  self._weightDesignatorTarget = getScreenSizeY()
  self._weightDesignatorIsAnimating = true
  self._monitorItemCooltime = false
  self._slotRingIndex = 0
  self._slotEarringIndex = 0
end
function PaGlobalFunc_InventoryInfo_ShowAni()
  audioPostEvent_SystemUi(1, 1)
  local self = InventoryInfo
  self._showAniIsPlaying = true
  _panel:ResetVertexAni()
  local aniInfo1 = _panel:addMoveAnimation(0, 0.3, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartPosition(getScreenSizeX(), 0)
  aniInfo1:SetEndPosition(getScreenSizeX() - _panel:GetSizeX(), 0)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(false)
  aniInfo1:SetDisableWhileAni(true)
  aniInfo1:SetIgnoreUpdateSnapping(true)
  self._ui.stc_topEndPictogram:ComputePos()
  self._ui.stc_topEndPictogram:ResetVertexAni()
  self._ui.stc_topEndPictogram:SetVertexAniRun("Ani_Move_Pos_Show", true)
  self._ui.txt_topEndTitle:ComputePos()
  self._ui.txt_topEndTitle:ResetVertexAni()
  self._ui.txt_topEndTitle:SetVertexAniRun("Ani_Move_Pos_Show", true)
end
function PaGlobalFunc_InventoryInfo_HideAni()
  audioPostEvent_SystemUi(1, 1)
  _panel:ResetVertexAni()
  local aniInfo1 = _panel:addMoveAnimation(0, 0.3, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartPosition(_panel:GetPosX(), 0)
  aniInfo1:SetEndPosition(_panel:GetPosX() + 600, 0)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  aniInfo1:SetIgnoreUpdateSnapping(true)
  Panel_Tooltip_Item_Show_GeneralNormal(1, "inventory", false, false)
  Panel_Tooltip_Item_Show_GeneralNormal(1, "equipment", false, false, _panel:GetPosX() - 20, 200)
  TooltipSimple_Hide()
end
function InventoryInfo:updateAllUpperTab()
  self:updateEquipment()
  self:updateCostume()
  self:updateInformation()
  self:updateServant()
end
function InventoryInfo:updateSilverPearlMileage()
  local silver = Defines.s64_const.s64_0
  local pearl = Defines.s64_const.s64_0
  local mileage = Defines.s64_const.s64_0
  local moneyItemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eInventory, getMoneySlotNo())
  if nil ~= moneyItemWrapper then
    silver = moneyItemWrapper:get():getCount_s64()
  end
  local pearlItemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eCashInventory, getPearlSlotNo())
  if nil ~= pearlItemWrapper then
    pearl = pearlItemWrapper:get():getCount_s64()
  end
  local mileagelItemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eCashInventory, getMileageSlotNo())
  if nil ~= mileagelItemWrapper then
    mileage = mileagelItemWrapper:get():getCount_s64()
  end
  self._ui.txt_Silver:SetText(makeDotMoney(silver))
  self._ui.txt_Pearl:SetText(makeDotMoney(pearl))
  self._ui.txt_Mileage:SetText(makeDotMoney(mileage))
  self:updateSilverIcon(self._ui.stc_silverIcon, silver)
end
function InventoryInfo:updateSilverIcon(control, silver)
  if 100000 <= Int64toInt32(silver) then
    control:ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver4.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 0, 0, 30, 30)
    control:getBaseTexture():setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver4_Over.dds")
    control:ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver4_Over.dds")
  elseif Int64toInt32(silver) >= 20000 then
    control:ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver3.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 0, 0, 30, 30)
    control:getBaseTexture():setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver3_Over.dds")
    control:ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver3_Over.dds")
  elseif Int64toInt32(silver) >= 5000 then
    control:ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver2.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 0, 0, 30, 30)
    control:getBaseTexture():setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver2_Over.dds")
    control:ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver2_Over.dds")
  else
    control:ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver1.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(control, 0, 0, 30, 30)
    control:getBaseTexture():setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver1_Over.dds")
    control:ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver1_Over.dds")
  end
end
function InventoryInfo:updateUpperTab(tab)
  Panel_Tooltip_Item_Show_GeneralNormal(1, "inventory", false, false)
  Panel_Tooltip_Item_Show_GeneralNormal(1, "equipment", isOn, false, _panel:GetPosX() - 20, 200)
  TooltipSimple_Hide()
  if tab == UPPER_TAB_TYPE.EQUIPMENT then
    self:updateEquipment()
  elseif tab == UPPER_TAB_TYPE.COSTUME then
    self:updateCostume()
  elseif tab == UPPER_TAB_TYPE.INFORMATION then
    self:updateInformation()
  elseif tab == UPPER_TAB_TYPE.SERVANT then
    self:updateServant()
  end
end
function InventoryInfo:updateEquipment()
  if not _isInitialized or not _panel:GetShow() then
    return
  end
  self._extendedSlotArray = {}
  for ii = 1, #self._equipSlotNo do
    local slot = self._ui.equipSlots[ii]
    local slotIndex = self._equipSlotNo[ii]
    local itemWrapper = ToClient_getEquipmentItem(slotIndex)
    if nil ~= itemWrapper then
      self:extendedSlotInfo(itemWrapper, slotIndex)
      slot:setItem(itemWrapper, slotIndex, true)
      slot.pictogram:SetShow(false)
      if nil ~= slot.chk_toggleButton then
        self._ui.equipSlotBG[ii]:SetChildOrder(slot, slot.chk_toggleButton)
      end
      slot.icon:SetEnable(true)
      slot.icon:SetMonoTone(false)
      slot.enchantText:SetMonoTone(false)
    else
      slot:clearItem()
      slot.pictogram:SetShow(true)
    end
  end
  for childSlot, parentSlot in pairs(self._extendedSlotArray) do
    local itemWrapper = ToClient_getEquipmentItem(parentSlot)
    local index = self:getIndexFromEquipSlotNo(childSlot)
    if nil ~= index then
      slot = self._ui.equipSlots[index]
      if nil ~= slot then
        self._ui.equipSlots[index].pictogram:SetShow(false)
        self:setItemInfoUseWrapper(slot, itemWrapper, true, true)
      end
    end
  end
  local autoActiveIsOn = ToClient_getGameUIManagerWrapper():getLuaCacheDataListBool(CppEnums.GlobalUIOptionType.AlchemyStone)
  if nil ~= ToClient_getEquipmentItem(27) and autoActiveIsOn then
    self._ui.chk_autoActive:SetCheck(true)
  else
    self._ui.chk_autoActive:SetCheck(false)
  end
  self:updateAttackStat(false)
end
function InventoryInfo:updateAttackStat(showWithEffect)
  ToClient_updateAttackStat()
  local attackValNew = ToClient_getOffence()
  local awakenAttackValNew = ToClient_getAwakenOffence()
  local defenceAttackValNew = ToClient_getDefence()
  local attackValOld = tonumber(self._ui.txt_attackValue:GetText())
  local awakenAttackValOld = tonumber(self._ui.txt_awakenAttackValue:GetText())
  local defenceAttackValOld = tonumber(self._ui.txt_defenceValue:GetText())
  self._ui.txt_attackValue:SetText(attackValNew)
  self._ui.txt_awakenAttackValue:SetText(awakenAttackValNew)
  self._ui.txt_defenceValue:SetText(defenceAttackValNew)
  local classType = getSelfPlayer():getClassType()
  local equippedAwakenWeapon = ToClient_getEquipmentItem(CppEnums.EquipSlotNo.awakenWeapon)
  if _awakenWeaponContentsOption[classType] and nil ~= equippedAwakenWeapon then
    self._ui.txt_attackText:SetSpanSize(-140, 40)
    self._ui.txt_attackValue:SetSpanSize(-140, 13)
    self._ui.txt_defenceText:SetSpanSize(140, 40)
    self._ui.txt_defenceValue:SetSpanSize(140, 13)
    self._ui.txt_awakenAttackText:SetShow(true)
    self._ui.txt_awakenAttackValue:SetShow(true)
  else
    self._ui.txt_attackText:SetSpanSize(-90, 40)
    self._ui.txt_attackValue:SetSpanSize(-90, 13)
    self._ui.txt_defenceText:SetSpanSize(90, 40)
    self._ui.txt_defenceValue:SetSpanSize(90, 13)
    self._ui.txt_awakenAttackText:SetShow(false)
    self._ui.txt_awakenAttackValue:SetShow(false)
  end
  if false == showWithEffect then
    return
  end
  if attackValOld ~= attackValNew then
    self._ui.txt_attackValue:AddEffect("fUI_SkillButton01", false, 0, 0)
    self._ui.txt_attackValue:AddEffect("UI_SkillButton01", false, 0, 0)
  end
  if awakenAttackValOld ~= awakenAttackValNew then
    self._ui.txt_awakenAttackValue:AddEffect("fUI_SkillButton01", false, 0, 0)
    self._ui.txt_awakenAttackValue:AddEffect("UI_SkillButton01", false, 0, 0)
  end
  if defenceAttackValOld ~= defenceAttackValNew then
    self._ui.txt_defenceValue:AddEffect("fUI_SkillButton01", false, 0, 0)
    self._ui.txt_defenceValue:AddEffect("UI_SkillButton01", false, 0, 0)
  end
end
function InventoryInfo:updateCostume()
  if not _isInitialized or not _panel:GetShow() then
    return
  end
  local rightHandItemWrapper = ToClient_getEquipmentItem(0)
  local primWeaponIsFishingRod
  if nil ~= rightHandItemWrapper then
    primWeaponIsFishingRod = 44 == rightHandItemWrapper:getStaticStatus():getEquipType()
  end
  self._extendedSlotArray = {}
  for ii = 1, #self._costumeSlotNo do
    local slotIndex = self._costumeSlotNo[ii]
    local slot = self._ui.costumeSlots[ii]
    local isShow = true
    local itemWrapper = ToClient_getEquipmentItem(slotIndex)
    if nil ~= itemWrapper then
      self:extendedSlotInfo(itemWrapper, slotIndex)
      slot:setItem(itemWrapper, slotIndex, true)
      isShow = ToClient_IsSetAvatarEquipSlotFlag(_avatarCheckFlag[slotIndex])
      if nil ~= slot.chk_toggleButton then
        self._ui.equipSlotBG[ii]:SetChildOrder(slot, slot.chk_toggleButton)
      end
      slot.pictogram:SetShow(false)
      slot.icon:SetEnable(true)
      slot.icon:SetMonoTone(false)
      slot.enchantText:SetMonoTone(false)
    else
      slot:clearItem()
      slot.pictogram:SetShow(true)
    end
    slot.chk_toggleButton:SetCheck(isShow)
  end
  for childSlot, parentSlot in pairs(self._extendedSlotArray) do
    local itemWrapper = ToClient_getEquipmentItem(parentSlot)
    local index = self:getIndexFromCostumeSlotNo(childSlot)
    if nil ~= index then
      slot = self._ui.costumeSlots[index]
      if nil ~= slot then
        self._ui.costumeSlots[index].pictogram:SetShow(false)
        self:setItemInfoUseWrapper(slot, itemWrapper, true, true)
      end
    end
  end
  if primWeaponIsFishingRod then
    local fishingRodWrapper = ToClient_getEquipmentItem(0)
    local index = self:getIndexFromCostumeSlotNo(18)
    self._ui.costumeSlots[index].pictogram:SetShow(false)
    self:setItemInfoUseWrapper(self._ui.costumeSlots[index], fishingRodWrapper, true, true)
    index = self:getIndexFromCostumeSlotNo(19)
    self._ui.costumeSlots[index].pictogram:SetShow(false)
    self:setItemInfoUseWrapper(self._ui.costumeSlots[index], fishingRodWrapper, true, true)
  end
end
function InventoryInfo:updateInformation()
  if not _isInitialized then
    return
  end
  if UPPER_TAB_TYPE.INFORMATION ~= self._currentUpperTab then
    return
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  local potentialType = {
    move = 0,
    attack = 1,
    cast = 2
  }
  local potencialValues = {
    [1] = selfPlayer:characterStatPointSpeed(potentialType.attack),
    [2] = selfPlayer:characterStatPointSpeed(potentialType.move),
    [3] = selfPlayer:characterStatPointCritical(),
    [4] = selfPlayer:getCharacterStatPointFishing(),
    [5] = selfPlayer:getCharacterStatPointCollection(),
    [6] = selfPlayer:getCharacterStatPointDropItem()
  }
  local potencialValueLimit = {
    [1] = selfPlayer:characterStatPointLimitedSpeed(potentialType.attack),
    [2] = selfPlayer:characterStatPointLimitedSpeed(potentialType.move),
    [3] = selfPlayer:characterStatPointLimitedCritical(),
    [4] = selfPlayer:getCharacterStatPointLimitedFishing(),
    [5] = selfPlayer:getCharacterStatPointLimitedCollection(),
    [6] = selfPlayer:getCharacterStatPointLimitedDropItem()
  }
  if CppEnums.ClassType.ClassType_WizardWomen == classtype or CppEnums.ClassType.ClassType_Wizard == classtype then
    potencialValues[1] = selfPlayer:characterStatPointSpeed(potentialType.cast)
    potencialValueLimit[1] = selfPlayer:characterStatPointLimitedSpeed(potentialType.cast)
  end
  for ii = 1, #potencialValues do
    if potencialValues[ii] > potencialValueLimit[ii] then
      potencialValues[ii] = potencialValueLimit[ii]
    end
    if ii < 3 then
      potencialValues[ii] = potencialValues[ii] - 5
    end
    local displayBarTemp = {}
    for jj = 1, 5 do
      displayBarTemp[jj] = UI.getChildControl(self._ui.potencialBars[ii], "Static_Potencial_" .. jj - 1)
      displayBarTemp[jj]:SetShow(jj <= potencialValues[ii])
    end
  end
  local resistData = {
    [1] = selfPlayer:getStunResistance(),
    [2] = selfPlayer:getKnockdownResistance(),
    [3] = selfPlayer:getCatchResistance(),
    [4] = selfPlayer:getKnockbackResistance()
  }
  for ii = 1, self._resistCount do
    self._ui.txt_resistValues[ii]:SetText(tostring(resistData[ii] / 10000) .. " %")
  end
  self._ui.txt_fitnessSubtitles[1]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STAMINA_TITLE"))
  self._ui.txt_fitnessSubtitles[2]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_STRENGTH_TITLE"))
  self._ui.txt_fitnessSubtitles[3]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_FITNESS_HEALTH_TITLE"))
  local selfProxy = selfPlayer:get()
  for ii = 1, self._fitnessCount do
    self._ui.txt_fitnessValues[ii]:SetText("Lv. " .. tostring(selfProxy:getFitnessLevel(ii - 1)))
    if ii == 2 then
      self._ui.txt_fitnessSubtitles[ii]:SetText(self._ui.txt_fitnessSubtitles[ii]:GetText() .. tostring(ToClient_GetFitnessLevelStatus(ii - 1) / 10000))
    else
      self._ui.txt_fitnessSubtitles[ii]:SetText(self._ui.txt_fitnessSubtitles[ii]:GetText() .. tostring(ToClient_GetFitnessLevelStatus(ii - 1)))
    end
  end
  local sortedInfoList = ToClient_GetSkillPieceInfo()
  if not sortedInfoList then
    self._ui.stc_noSetEffect:SetShow(true)
    self._ui.frame_setEffect:SetShow(false)
    return
  else
    self._ui.stc_noSetEffect:SetShow(false)
    self._ui.frame_setEffect:SetShow(true)
  end
  self._setItemEffectData = {}
  self._setItemEffectTitleCount = 1
  self._setItemEffectValueCount = 1
  local function containGroup(title)
    for ii = 1, #self._setItemEffectData do
      if nil ~= self._setItemEffectData[ii] and title == self._setItemEffectData[ii] then
        return true
      end
    end
    return false
  end
  local data = {}
  local txt_titles = self._ui.setItemEffectTitleList
  local txt_values = self._ui.setItemEffectValueList
  for ii = 1, #txt_titles do
    txt_titles[ii]:SetShow(false)
  end
  for ii = 1, #txt_values do
    txt_values[ii]:SetShow(false)
  end
  local startY = 10
  for ii = 1, #sortedInfoList + 1 do
    data[ii] = {}
    data[ii].skillNo = sortedInfoList[ii - 1]:getSkillNo()
    data[ii].groupTitle = sortedInfoList[ii - 1]:getGroupTitle()
    data[ii].isApplied = sortedInfoList[ii - 1]:getApply()
    data[ii].point = sortedInfoList[ii - 1]:getPoint()
    data[ii].descTitle = sortedInfoList[ii - 1]:getDescTitle()
    data[ii].desc = sortedInfoList[ii - 1]:getDesc()
    if not containGroup(data[ii].groupTitle) then
      if nil == txt_titles[self._setItemEffectTitleCount] then
        txt_titles[self._setItemEffectTitleCount] = UI.createAndCopyBasePropertyControl(self._ui.frame_setEffect:GetFrameContent(), "StaticText_SetItemEffectTitle", self._ui.frame_setEffect:GetFrameContent(), "StaticText_SetItemEffectTitle" .. ii)
      end
      txt_titles[self._setItemEffectTitleCount]:SetShow(true)
      txt_titles[self._setItemEffectTitleCount]:SetText(data[ii].groupTitle)
      txt_titles[self._setItemEffectTitleCount]:SetPosX(50)
      txt_titles[self._setItemEffectTitleCount]:SetPosY(startY)
      startY = startY + txt_titles[self._setItemEffectTitleCount]:GetTextSizeY() + 12
      self._setItemEffectData[self._setItemEffectTitleCount] = data[ii].groupTitle
      self._setItemEffectTitleCount = self._setItemEffectTitleCount + 1
    end
    if nil == txt_values[self._setItemEffectValueCount] then
      txt_values[self._setItemEffectValueCount] = UI.createAndCopyBasePropertyControl(self._ui.frame_setEffect:GetFrameContent(), "StaticText_SetItemEffectValue", self._ui.frame_setEffect:GetFrameContent(), "StaticText_SetItemEffectValue" .. ii)
    end
    txt_values[self._setItemEffectValueCount]:SetShow(true)
    if true == data[ii].isApplied then
      txt_values[self._setItemEffectValueCount]:SetFontColor(Defines.Color.C_FF96D4FC)
    else
      txt_values[self._setItemEffectValueCount]:SetFontColor(Defines.Color.C_FFC4BEBE)
    end
    txt_values[self._setItemEffectValueCount]:SetText(data[ii].descTitle .. " : " .. data[ii].desc)
    txt_values[self._setItemEffectValueCount]:SetPosX(50)
    txt_values[self._setItemEffectValueCount]:SetPosY(startY)
    startY = startY + txt_values[self._setItemEffectValueCount]:GetTextSizeY() + 12
    self._setItemEffectValueCount = self._setItemEffectValueCount + 1
  end
  self._ui.frame_setEffect:UpdateContentPos()
  local content = self._ui.frame_setEffect:GetFrameContent()
  self._ui.stc_characterInfoBG:SetSize(content:GetSizeX(), startY)
  content:SetSize(content:GetSizeX(), startY)
  self._ui.frame_setEffect:UpdateContentPos()
  if content:GetSizeY() > self._ui.frame_setEffect:GetSizeY() then
    self._ui.frame_setEffect:GetVScroll():SetShow(true)
    self._ui.frame_setEffect:GetVScroll():SetControlTop()
  else
    self._ui.frame_setEffect:GetVScroll():SetShow(false)
  end
  self._ui.frame_setEffect:UpdateContentScroll()
end
function InventoryInfo:updateServant()
  if not _isInitialized or not _panel:GetShow() then
    return
  end
  local actorKeysRaw = self:getNearbyServantsActorKeys()
  if #actorKeysRaw > 0 then
    self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT]:SetShow(true)
    self._ui.txt_noServant:SetShow(false)
    self:updateServantInven(actorKeysRaw[1])
    self._servantActorKeyRaw = actorKeysRaw
  else
    self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT]:SetShow(false)
    self._ui.txt_noServant:SetShow(true)
    self._servantActorKeyRaw = nil
    return
  end
  self:updateServantEquipOrCostume(true)
  self:updateServantEquipOrCostume(false)
end
function InventoryInfo:updateServantInven(actorKeyRaw)
  if not _isInitialized or not _panel:GetShow() then
    return
  end
  local areaYSize = 0
  if nil == actorKeyRaw then
    return 0
  end
  local vehicleActorWrapper = getVehicleActor(actorKeyRaw)
  if nil == vehicleActorWrapper then
    return 0
  end
  local vehicleActor = vehicleActorWrapper:get()
  if nil == vehicleActor then
    return 0
  end
  local vehicleInven = vehicleActor:getInventory()
  if nil == vehicleInven then
    return 0
  end
  local s64_weightMax = vehicleActor:getPossessableWeight_s64()
  local s64_weightAll = vehicleActor:getCurrentWeight_s64()
  local s64_weightMax_div = s64_weightMax / Defines.s64_const.s64_100
  local s64_weightAll_div = s64_weightAll / Defines.s64_const.s64_100
  self._ui.progress2_servantWeight:SetProgressRate(Int64toInt32(s64_weightAll / s64_weightMax_div))
  local allWeight = string.format("%.1f", Int64toInt32(s64_weightAll_div) / 100)
  local maxWeight = string.format("%.0f", Int64toInt32(s64_weightMax_div) / 100)
  self._ui.txt_servantWeightValue:SetText(allWeight .. " /" .. maxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  local useStartSlot = inventorySlotNoUserStart()
  local fullCount = vehicleInven:size() - useStartSlot
  local freeCount = vehicleInven:getFreeCount()
  local startX = self._ui.servantInvenSlotTemplate:GetPosX()
  local startY = self._ui.servantInvenSlotTemplate:GetPosY()
  local columnMax = self._invenSlotColumnMax
  self._ui.txt_servantInvenCountDisplay:SetText(tostring(fullCount - freeCount .. "/" .. fullCount))
  for ii = 1, #self._ui.stc_servantInvenSlotBG do
    self._ui.stc_servantInvenSlotBG[ii]:SetShow(false)
  end
  for ii = 1, fullCount do
    local slotBG = self._ui.stc_servantInvenSlotBG[ii]
    local slot = self._ui.servantslot_inven[ii]
    if nil == slotBG then
      slotBG = UI.cloneControl(self._ui.servantInvenSlotTemplate, self._ui.frame_servantInven:GetFrameContent(), "servantInvenSlotBG_" .. ii)
    end
    slotBG:SetPosX(startX + (ii - 1) % columnMax * self._defaultXGap)
    slotBG:SetPosY(startY + math.floor((ii - 1) / columnMax) * self._defaultYGap)
    slotBG:SetShow(true)
    if nil == slot then
      slot = {}
      SlotItem.new(slot, "ServantInvenSlot_" .. ii, ii, slotBG, self._configForInven)
      slot:createChild()
      slot.icon:addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_ServantInvenSlot(" .. ii .. ")")
      slot.icon:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_ServantInvenDropHandler(" .. ii .. ")")
      slot.icon:addInputEvent("Mouse_On", "Input_InventoryInfo_ServantInvenTooltip(" .. ii .. ", true)")
      slot.icon:addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantInvenTooltip(" .. ii .. ", false)")
    end
    local itemWrapper = getServantInventoryItemBySlotNo(actorKeyRaw, ii - 1 + useStartSlot)
    if nil ~= itemWrapper then
      slot:setItem(itemWrapper)
    else
      slot:clearItem()
    end
  end
  local rowCount = math.ceil(fullCount / columnMax)
  local lastSlot = self._ui.stc_servantInvenSlotBG[#self._ui.stc_servantInvenSlotBG]
  self._ui.stc_contentBG:SetSize(self._ui.stc_contentBG:GetSizeX(), lastSlot:GetSizeY() + lastSlot:GetPosY())
  local frameContent = self._ui.frame_servantInven:GetFrameContent()
  frameContent:SetSize(frameContent:GetSizeX(), self._ui.stc_contentBG:GetSizeY())
  self._ui.frame_servantInven:UpdateContentPos()
  self._ui.frame_servantInven:UpdateContentScroll()
  return lastSlot:GetSizeY() + lastSlot:GetPosY() + self._ui.frame_servantInven:GetPosY()
end
function InventoryInfo:updateServantEquipOrCostume(isEquip)
  if nil == self._servantActorKeyRaw then
    return
  end
  if nil == self._servantActorKeyRaw[1] then
    return
  end
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  if nil == dataType then
    return
  end
  local equipOrCostumeSlots, equipOrCostumeSlotsBG, slotNoList
  if true == isEquip then
    equipOrCostumeSlots = self._ui.servantEquipSlots
    equipOrCostumeSlotsBG = self._ui.stc_servantEquipSlotBG
    slotNoList = _servantData[dataType].equipSlotNoList
  else
    equipOrCostumeSlots = self._ui.servantCostumeSlots
    equipOrCostumeSlotsBG = self._ui.stc_servantCostumeSlotBG
    slotNoList = _servantData[dataType].costumeSlotNoList
  end
  local checkFlagList = _servantData[dataType].checkFlag
  local UV = _servantData[dataType].pictogramUV
  local slotCount = #slotNoList
  local group = self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT]
  local startX = group:GetSizeX() / 2 - ((slotCount - 1) * self._defaultXGap + equipOrCostumeSlotsBG[1]:GetSizeX()) / 2
  for ii = 1, self._servantEquipSlotMax do
    local slot = equipOrCostumeSlots[ii]
    local slotBG = equipOrCostumeSlotsBG[ii]
    if ii <= slotCount then
      slotBG:SetShow(true)
      slotBG:SetPosX(startX + (ii - 1) * self._defaultXGap)
      local slotNo = slotNoList[ii]
      local itemWrapper = servantWrapper:getEquipItem(slotNo)
      if nil == slot.pictogram then
        slot.pictogram = UI.getChildControl(slotBG, "Static_ItemPictogram")
      end
      if nil == slot.chk_toggleButton then
        slot.chk_toggleButton = UI.getChildControl(slotBG, "CheckButton_ShowToggle")
      end
      if nil ~= itemWrapper then
        slot:setItem(itemWrapper, slotNo, true)
        slot.pictogram:SetShow(false)
        if CppEnums.VehicleType.Type_Elephant == vehicleType then
          slot.chk_toggleButton:SetShow(false)
        elseif nil == checkFlagList[slotNo] then
          slot.chk_toggleButton:SetShow(false)
        else
          slot.chk_toggleButton:SetShow(true)
          local checkBool = ToClient_IsSetVehicleEquipSlotFlag(vehicleType, checkFlagList[slotNo])
          slot.chk_toggleButton:SetCheck(checkBool)
        end
      else
        slot:clearItem()
        slot.chk_toggleButton:SetShow(false)
        slot.pictogram:SetShow(true)
        local x1, y1, x2, y2 = setTextureUV_Func(slot.pictogram, UV[slotNo][1], UV[slotNo][2], UV[slotNo][3], UV[slotNo][4])
        slot.pictogram:getBaseTexture():setUV(x1, y1, x2, y2)
        slot.pictogram:setRenderTexture(slot.pictogram:getBaseTexture())
      end
    else
      slotBG:SetShow(false)
    end
  end
end
function InventoryInfo:updateInventory(ignorePanelVisibility)
  if not ignorePanelVisibility and (not _isInitialized or not _panel:GetShow()) then
    return
  end
  if not ignorePanelVisibility and LOWER_TAB_TYPE.UNDEFINED == self._currentLowerTab then
    return
  end
  if ignorePanelVisibility then
    self._currentLowerTab = LOWER_TAB_TYPE.INVENTORY
  end
  self:updateSilverPearlMileage()
  local playerLevel = getSelfPlayer():get():getLevel()
  local selfPlayer = getSelfPlayer()
  local invenUseSize = selfPlayer:get():getInventorySlotCount(LOWER_TAB_TYPE.CASH_INVEN == self._currentLowerTab)
  local useStartSlot = __eTInventorySlotNoUseStart
  local inventory = Inventory_GetCurrentInventory()
  local currentWhereType = Inventory_GetCurrentInventoryType()
  local invenMaxSize = inventory:sizeXXX()
  local slotNoList = Array.new()
  local classType = selfPlayer:getClassType()
  slotNoList:fill(useStartSlot, invenMaxSize - 1)
  self._isAutoSort = ToClient_IsSortedInventory()
  if self._isAutoSort then
    local sortList = Array.new()
    sortList:fill(useStartSlot, invenUseSize - 1)
    sortList:quicksort(PaGlobalFunc_InventoryInfo_ItemComparer)
    for ii = 1, #sortList do
      slotNoList[ii] = sortList[ii]
    end
  end
  Panel_Inventory_isBlackStone_16001 = false
  Panel_Inventory_isBlackStone_16002 = false
  Panel_Inventory_isSocketItem = false
  self._ui.stc_plusSlot:SetShow(false)
  Panel_NewEquip_EffectClear()
  self._invenCapacity = invenUseSize - useStartSlot
  for ii = 1, self._invenSlotMax do
    local slot = self._ui.slot_inven[ii]
    slot:clearItem()
    slotNo = slotNoList[ii + self._invenStartSlotIndex]
    slot.slotNo = slotNo
    slot.icon:EraseAllEffect()
    if ii - 1 + self._invenStartSlotIndex < self._invenCapacity then
      local itemWrapper = getInventoryItemByType(self._lowerTabData[self._currentLowerTab].whereType, slotNoList[ii + self._invenStartSlotIndex])
      if nil ~= itemWrapper then
        slot:setItem(itemWrapper, slotNo)
        slot.isEmpty = false
        local isFiltered = false
        if nil ~= self._filterFunc and "function" == type(self._filterFunc) then
          isFiltered = self._filterFunc(slotNo, itemWrapper, currentWhereType)
        end
        slot.icon:SetEnable(not isFiltered)
        slot.icon:SetMonoTone(isFiltered)
        slot.icon:SetIgnore(isFiltered)
        if isFiltered then
          slot.icon:SetAlpha(0.5)
          slot.icon:EraseAllEffect()
        else
          if nil ~= self._filterFunc then
            slot.icon:AddEffect("UI_Inventory_Filtering", true, 0, 0)
          end
          self:addEffectMapea(ii, slotNo)
        end
        Panel_Inventory_isBlackStone_16002 = self:addEffectBlackStone(ii, isFiltered, slotNo)
        local itemKey = itemWrapper:get():getKey():getItemKey()
        self:autoSetPotion(playerLevel, itemKey, currentWhereType, slotNo)
        PaGlobal_TutorialManager:handleUpdateInventorySlotData(slot, itemKey)
        if (42000 == itemKey or 42001 == itemKey or 41607 == itemKey or 42002 == itemKey or 42010 == itemKey or 42003 == itemKey or 42004 == itemKey or 42034 == itemKey or 42035 == itemKey or 42037 == itemKey or 42036 == itemKey or 42006 == itemKey or 42008 == itemKey or 42039 == itemKey or 42038 == itemKey or 42007 == itemKey or 42053 == itemKey or 41610 == itemKey or 42009 == itemKey or 42054 == itemKey or 42057 == itemKey or 42061 == itemKey or 42066 == itemKey or 42055 == itemKey or 42056 == itemKey) and true == PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() and not FGlobal_FirstSummonItemUse() then
          slot.icon:AddEffect("fUI_Tuto_ItemHp_01A", true, 0, 0)
        end
        if 42405 == itemKey and questList_hasProgressQuest(4015, 6) then
          slot.icon:AddEffect("fUI_Tuto_ItemHp_01A", true, 0, 0)
        end
        local itemSSW = itemWrapper:getStaticStatus()
        local item_type = itemSSW:getItemType()
        if item_type == 5 then
          Panel_Inventory_isSocketItem = true
        end
        local isSoulCollector = itemWrapper:isSoulCollector()
        local isCurrentSoulCount = itemWrapper:getSoulCollectorCount()
        local isMaxSoulCount = itemWrapper:getSoulCollectorMaxCount()
        local itemIconPath = itemWrapper:getStaticStatus():getIconPath()
        if isSoulCollector then
          slot.icon:ChangeTextureInfoName("icon/" .. itemIconPath)
          if 0 == isCurrentSoulCount then
            slot.icon:ChangeTextureInfoName("icon/" .. itemIconPath)
          end
          if isCurrentSoulCount > 0 then
            slot.icon:ChangeTextureInfoName("New_UI_Common_forLua/ExceptionIcon/00040351_1.dds")
          end
          if isCurrentSoulCount == isMaxSoulCount then
            slot.icon:ChangeTextureInfoName("New_UI_Common_forLua/ExceptionIcon/00040351_2.dds")
          end
          local x1, y1, x2, y2 = setTextureUV_Func(slot.icon, 0, 0, 42, 42)
          slot.icon:getBaseTexture():setUV(x1, y1, x2, y2)
          slot.icon:setRenderTexture(slot.icon:getBaseTexture())
        end
        local offencePoint = 0
        local defencePoint = 0
        local equipOffencePoint = 0
        local equipDefencePoint = 0
        local isEquip = itemWrapper:getStaticStatus():get():isEquipable()
        local matchEquip = false
        local isAccessory = false
        offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, isAccessory = self:compareSpec(currentWhereType, slotNo, isAccessory)
        local currentEndurance = itemWrapper:get():getEndurance()
        local isUsableServant = itemWrapper:getStaticStatus():isUsableServant()
        if not isUsableServant and not Panel_Window_Exchange:GetShow() then
          if isEquip and nil ~= defencePoint and nil ~= offencePoint and currentEndurance > 0 and true == matchEquip and false == isAccessory and defencePoint + offencePoint > equipDefencePoint + equipOffencePoint then
            slot.icon:AddEffect("fUI_BetterItemAura01", true, 0, 0)
            local equipPos = itemWrapper:getStaticStatus():getEquipSlotNo()
            Panel_NewEquip_Update(equipPos)
            PaGlobal_TutorialManager:handleNewEquipInInventory(slot)
          end
          if currentEndurance > 0 and true == matchEquip and true == isAccessory and offencePoint + defencePoint > equipOffencePoint + equipDefencePoint then
            slot.icon:AddEffect("fUI_BetterItemAura01", true, 0, 0)
            local equipPos = itemWrapper:getStaticStatus():getEquipSlotNo()
            Panel_NewEquip_Update(equipPos)
          end
          if slotNo < self._invenSlotMax and true == self._slotEtcData[slotNo].isFirstItem then
            local newItemEffectSceneId = slot.icon:AddEffect("fUI_NewItem02", true, 0, 0)
            effectScene.newItem[slotNo] = newItemEffectSceneId
            UIMain_ItemUpdate()
          end
        end
        local isUsableClass
        if nil ~= itemSSW then
          if itemSSW:get():isWeapon() or itemSSW:get():isSubWeapon() or itemSSW:get():isAwakenWeapon() then
            isUsableClass = itemSSW:get()._usableClassType:isOn(classType)
          else
            isUsableClass = true
          end
        else
          isUsableClass = false
        end
        if false == isEquip then
          slot.icon:SetColor(UI_color.C_FFFFFFFF)
        elseif true == isUsableClass then
          slot.icon:SetColor(UI_color.C_FFFFFFFF)
        else
          slot.icon:SetColor(UI_color.C_FFD20000)
        end
        local itemBindType = itemSSW:get()._vestedType:getItemKey()
        if Panel_Window_Exchange:GetShow() and itemBindType > 0 then
          slot.icon:SetColor(UI_color.C_FFD20000)
        end
      end
      self._ui.stc_lockedSlots[ii]:SetShow(false)
    elseif ii - 1 + self._invenStartSlotIndex == self._invenCapacity then
      local posX = (ii - 1) % self._invenSlotColumnMax * self._defaultXGap
      local posY = math.floor((ii - 1) / self._invenSlotColumnMax) * self._defaultYGap
      if false == _ContentsGroup_ForXBoxFinalCert then
        self._ui.stc_lockedSlots[ii]:SetShow(true)
        self._ui.stc_plusSlot:SetShow(false)
      else
        self._ui.stc_plusSlot:SetPosX(posX + 1)
        self._ui.stc_plusSlot:SetPosY(posY + 1)
        self._ui.stc_plusSlot:SetShow(true)
        self._ui.stc_lockedSlots[ii]:SetShow(false)
      end
    else
      self._ui.stc_lockedSlots[ii]:SetShow(true)
    end
  end
  if self._invenCapacity > self._invenSlotMax then
    self._ui.scroll_inven:SetShow(true)
  end
  PaGlobal_TutorialManager:handleOpenedInventory()
  self:findPuzzle()
  Panel_NewEquip_EffectLastUpdate()
  if true == PaGlobalFunc_FixMaxEnduranceInfo_GetShow() then
    _PA_LOG("\235\176\149\235\178\148\236\164\128", "PaGlobalFunc_FixMaxEnduranceInfo_GetShow true ")
    PaGlobalFunc_FixMaxEnduranceInfo_UpdateProgressBar()
  end
end
function InventoryInfo:findPuzzle()
  if true == self._isAutoSort then
    return
  end
  if LOWER_TAB_TYPE.UNDEFINED == self._currentLowerTab then
    return
  end
  local whereType = self._lowerTabData[self._currentLowerTab].whereType
  local isFind = findPuzzleAndReadyMake(whereType)
  local useSlotNo = inventorySlotNoUserStart()
  if not isFind then
    return
  end
  local count = getPuzzleSlotCount()
  for ii = 1, count do
    local slotNo = getPuzzleSlotAt(ii - 1)
    for jj = 1, self._invenSlotMax do
      if slotNo == self._ui.slot_inven[jj].slotNo then
        self._ui.slot_inven[jj].icon:AddEffect("UI_Item_MineCraft", true, 0, 0)
      end
    end
  end
  local slotNumber = getPuzzleSlotAt(0)
  for ii = 1, self._invenSlotMax do
    if slotNumber == self._ui.slot_inven[ii].slotNo then
      local bg = self._ui.stc_invenSlotBG[ii]
      local spanX = self._ui.stc_invenBG:GetSpanSize().x
      local spanY = self._ui.stc_invenBG:GetSpanSize().y
      self._ui.btn_invenPuzzle:SetShow(true)
      self._ui.btn_invenPuzzle:SetPosX(bg:GetPosX() + spanX + 30)
      self._ui.btn_invenPuzzle:SetPosY(bg:GetPosY() + spanY + 30)
      self._ui.btn_invenPuzzle:addInputEvent("Mouse_LUp", "Input_InventoryInfo_CompletePuzzle()")
    end
  end
end
function InventoryInfo:updateWeight()
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local _const = Defines.s64_const
  local normalInventory = selfPlayer:getInventoryByType(CppEnums.ItemWhereType.eInventory)
  local s64_moneyWeight = normalInventory:getMoneyWeight_s64()
  local s64_equipmentWeight = selfPlayer:getEquipment():getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local s64_allWeight_div = s64_allWeight / _const.s64_100
  local s64_maxWeight_div = s64_maxWeight / _const.s64_100
  local allWeight = string.format("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local maxWeight = string.format("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  local weightLength = Int64toInt32(s64_allWeight / s64_maxWeight_div)
  if Int64toInt32(s64_allWeight) <= Int64toInt32(s64_maxWeight) then
    self._ui.progress2_Weight:SetProgressRate(weightLength)
    self._ui.progress2_Equipment:SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_maxWeight_div))
    self._ui.progress2_Silver:SetProgressRate(Int64toInt32(s64_moneyWeight / s64_maxWeight_div))
  else
    self._ui.progress2_Weight:SetProgressRate(weightLength)
    self._ui.progress2_Equipment:SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_allWeight_div))
    self._ui.progress2_Silver:SetProgressRate(Int64toInt32(s64_moneyWeight / s64_allWeight_div))
  end
  local val = self._ui.progress2_Weight:GetProgressRate()
  self._weightDesignatorTarget = self._ui.progress2_Weight:GetSizeY() - self._ui.progress2_Weight:GetSizeY() * (val / 100)
  self._weightDesignatorIsAnimating = true
  self._ui.txt_weight:SetText(allWeight .. " / " .. maxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  self._ui.txt_weightGlow:SetText(allWeight .. " / " .. maxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
end
function PaGlobalFunc_Window_InventoryInfo_PerFrameUpdate(deltaTime)
  local self = InventoryInfo
  if deltaTime <= 0 then
    return
  end
  if true == InventoryInfo._weightDesignatorIsAnimating then
    InventoryInfo:animateWeightDesignator()
  end
  if true == InventoryInfo._showAniIsPlaying then
    InventoryInfo._showAniElapsed = InventoryInfo._showAniElapsed + deltaTime
    if InventoryInfo._showAniElapsed > InventoryInfo._showAniDuration then
      InventoryInfo._showAniIsPlaying = false
    end
  end
  if false == self._monitorItemCooltime then
    return
  end
  local useStartSlot = inventorySlotNoUserStart()
  local currentWhereType = Inventory_GetCurrentInventoryType()
  for ii = 1, self._invenSlotMax do
    local slot = self._ui.slot_inven[ii]
    local slotNo = slot.slotNo
    local remainTime = 0
    local itemReuseTime = 0
    local realRemainTime = 0
    local intRemainTime = 0
    if CppEnums.TInventorySlotNoUndefined ~= slotNo then
      remainTime = getItemCooltime(currentWhereType, slotNo)
      itemReuseTime = getItemReuseCycle(currentWhereType, slotNo) / 1000
      realRemainTime = remainTime * itemReuseTime
      intRemainTime = realRemainTime - realRemainTime % 1 + 1
    end
    if remainTime > 0 then
      slot.cooltime:UpdateCoolTime(remainTime)
      slot.cooltime:SetShow(true)
      slot.cooltimeText:SetText(Time_Formatting_ShowTop(intRemainTime))
      if itemReuseTime >= intRemainTime then
        slot.cooltimeText:SetShow(true)
      else
        slot.cooltimeText:SetShow(false)
      end
    elseif slot.cooltime:GetShow() then
      slot.cooltime:SetShow(false)
      slot.cooltimeText:SetShow(false)
      local skillSlotItemPosX = slot.cooltime:GetParentPosX()
      local skillSlotItemPosY = slot.cooltime:GetParentPosY()
      audioPostEvent_SystemUi(2, 1)
      Panel_Inventory_CoolTime_Effect_Item_Slot:SetShow(true, true)
      Panel_Inventory_CoolTime_Effect_Item_Slot:AddEffect("UI_Button_Hide", false, 2.5, 7)
      Panel_Inventory_CoolTime_Effect_Item_Slot:AddEffect("fUI_Button_Hide", false, 2.5, 7)
      Panel_Inventory_CoolTime_Effect_Item_Slot:SetPosX(skillSlotItemPosX - 7)
      Panel_Inventory_CoolTime_Effect_Item_Slot:SetPosY(skillSlotItemPosY - 10)
    end
  end
end
function InventoryInfo:animateWeightDesignator()
  local designtorY = self._ui.stc_designator:GetPosY()
  local difference = self._weightDesignatorTarget - designtorY
  if math.abs(difference) > 1 then
    local moveAmount = difference * 0.1
    self._ui.stc_designator:SetPosY(designtorY + moveAmount)
  else
    self._ui.stc_designator:SetPosY(self._weightDesignatorTarget)
    self._weightDesignatorIsAnimating = false
  end
  local showFlipped = designtorY > getScreenSizeY() - 50
  self._ui.stc_designatorImage:SetShow(not showFlipped)
  self._ui.stc_designatorFlippedImage:SetShow(showFlipped)
  if showFlipped then
    self._ui.txt_weightGlow:SetPosY(-50)
    self._ui.txt_weight:SetPosY(-53)
  else
    self._ui.txt_weightGlow:SetPosY(31)
    self._ui.txt_weight:SetPosY(28)
  end
end
function InventoryInfo:setTabTo(tabIndex)
  self._currentUpperTab = tabIndex
  for ii = 1, #self._ui.stc_upperGroups do
    self._ui.stc_upperGroups[ii]:SetShow(false)
    self._ui.rdo_tabButtons[ii]:SetCheck(false)
  end
  self._ui.rdo_tabButtons[tabIndex]:SetCheck(true)
  self._ui.stc_upperGroups[tabIndex]:SetShow(true)
  if tabIndex == UPPER_TAB_TYPE.INFORMATION then
    self._ui.stc_subWindowLower:SetShow(false)
  else
    self._ui.stc_subWindowLower:SetShow(true)
  end
  self._ui.txt_noServant:SetShow(false)
  if tabIndex == UPPER_TAB_TYPE.COSTUME then
    Input_InventoryInfo_SetLowerTabTo(LOWER_TAB_TYPE.CASH_INVEN)
  elseif tabIndex == UPPER_TAB_TYPE.EQUIPMENT then
    Input_InventoryInfo_SetLowerTabTo(LOWER_TAB_TYPE.INVENTORY)
  elseif tabIndex == UPPER_TAB_TYPE.SERVANT then
    Input_InventoryInfo_SetLowerTabTo(LOWER_TAB_TYPE.INVENTORY)
  end
  self:updateUpperTab(tabIndex)
end
function PaGlobalFunc_InventoryInfo_SetUpperTabTo(tabIndex)
  InventoryInfo:setTabTo(tabIndex)
end
function Input_InventoryInfo_SetUpperTabLeft()
  local self = InventoryInfo
  self._currentUpperTab = self._currentUpperTab - 1
  if self._currentUpperTab < 1 then
    self._currentUpperTab = #self._ui.rdo_tabButtons
  end
  self:setTabTo(self._currentUpperTab)
end
function Toggle_InventoryTab_forPadEventFunc(value)
  if 1 == value then
    Input_InventoryInfo_SetUpperTabRight()
  else
    Input_InventoryInfo_SetUpperTabLeft()
  end
end
function Input_InventoryInfo_SetUpperTabRight()
  local self = InventoryInfo
  self._currentUpperTab = self._currentUpperTab + 1
  if self._currentUpperTab > #self._ui.rdo_tabButtons then
    self._currentUpperTab = 1
  end
  self:setTabTo(self._currentUpperTab)
end
function Input_InventoryInfo_SetLowerTabLeft()
  local self = InventoryInfo
  self._currentLowerTab = self._currentLowerTab - 1
  if self._currentLowerTab < 1 then
    self._currentLowerTab = #self._lowerTabData
  end
  self._ui.txt_bagName:SetText(self._lowerTabData[self._currentLowerTab].name)
  self:updateInventory()
end
function Input_InventoryInfo_SetLowerTabRight()
  local self = InventoryInfo
  self._currentLowerTab = self._currentLowerTab + 1
  if self._currentLowerTab > #self._lowerTabData then
    self._currentLowerTab = 1
  end
  self._ui.txt_bagName:SetText(self._lowerTabData[self._currentLowerTab].name)
  self:updateInventory()
end
function Input_InventoryInfo_SetLowerTabTo(tabIndex)
  local self = InventoryInfo
  if tabIndex ~= self._currentLowerTab then
    self._invenStartSlotIndex = 0
    self._ui.scroll_inven:SetControlTop()
    self._currentLowerTab = tabIndex
    self._ui.txt_bagName:SetText(self._lowerTabData[self._currentLowerTab].name)
    self:updateInventory()
  end
end
function InputMRUp_InventoryInfo_EquipSlot(whereType, index)
  local self = InventoryInfo
  if isKeyPressed(CppEnums.VirtualKeyCode.KeyCode_SHIFT) then
  else
    local itemWrapper = ToClient_getEquipmentItem(index)
    if nil ~= itemWrapper then
      if Defines.UIMode.eUIMode_Repair == GetUIMode() then
        if true == PaGlobalFunc_FixMaxEnduranceInfo_GetShow() then
          equipmentDoUnequip(index)
        else
          PaGlobalFunc_RepairInfo_EquipRClick(index, itemWrapper)
        end
      else
        equipmentDoUnequip(index)
      end
    end
  end
end
function InputMLUp_InventoryInfo_EquipSlot(slotType, index)
end
function Input_InventoryInfo_AutoActive()
  ToClient_getGameUIManagerWrapper():setLuaCacheDataListBool(CppEnums.GlobalUIOptionType.AlchemyStone, InventoryInfo._ui.chk_autoActive:IsCheck(), CppEnums.VariableStorageType.eVariableStorageType_Character)
end
function Input_InventoryInfo_HideHelmet()
  selfPlayerShowHelmet(not InventoryInfo._ui.chk_HideHelmet:IsCheck())
end
function Input_InventoryInfo_OpenHelmet()
  selfPlayerShowBattleHelmet(InventoryInfo._ui.chk_openHelmet:IsCheck())
end
function Input_InventoryInfo_ToggleUnderwear(isShow)
  local self = InventoryInfo
  if not IsSelfPlayerWaitAction() or IsSelfPlayerBattleWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_UNDERWEAR"))
    if self._ui.chk_showUnderwear:IsCheck() then
      self._ui.chk_showUnderwear:SetCheck(false)
    else
      self._ui.chk_showUnderwear:SetCheck(true)
    end
    return
  end
  local selfPlayer = getSelfPlayer()
  local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
  local isSafeZone = regionInfo:get():isSafeZone()
  if isSafeZone then
    if selfPlayer:get():getUnderwearModeInhouse() then
      selfPlayer:get():setUnderwearModeInhouse(false)
      Toclient_setShowAvatarEquip()
    else
      selfPlayer:get():setUnderwearModeInhouse(true)
    end
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_EQUIP_UNDERWARE_ALERT"))
    self._ui.chk_showUnderwear:SetCheck(false)
  end
end
function Input_InventoryInfo_ToggleCloak()
  selfPlayerShowCloak(not InventoryInfo._ui.chk_toggleCloak:IsCheck())
end
function Input_InventoryInfo_ToggleNameWhenCamo()
  Toclient_setShowNameWhenCamouflage(not getSelfPlayer():get():isShowNameWhenCamouflage())
end
function InputMRUp_InventoryInfo_ServantInvenSlot(index)
  if InputMLUp_InventoryInfo_ServantInvenDropHandler() then
    return
  end
  local self = InventoryInfo
  if nil == self._servantActorKeyRaw[1] then
    return
  end
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  FGlobal_PopupMoveItem_Init(CppEnums.ItemWhereType.eServantInventory, index, vehicleType, self._servantActorKeyRaw[1], true)
end
function InputMLUp_InventoryInfo_ServantInvenDropHandler()
  local self = InventoryInfo
  if nil == DragManager.dragStartPanel then
    return false
  end
  if nil == self._servantActorKeyRaw[1] then
    return false
  end
  local actorKeyRaw = self._servantActorKeyRaw[1]
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  return (DragManager:itemDragMove(vehicleType, actorKeyRaw))
end
function Input_InventoryInfo_ServantInvenTooltip(index, isShow)
  local self = InventoryInfo
  Panel_Tooltip_Item_SetPosition(index, self._ui.servantslot_inven[index], "servant_inventory")
  Panel_Tooltip_Item_Show_GeneralNormal(index, "servant_inventory", isShow, nil, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end
function InputMRUp_InventoryInfo_ServantEquipSlot(index)
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  if nil == dataType then
    return
  end
  local slotNo = _servantData[dataType].equipSlotNoList[index]
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
  if nil == itemWrapper then
    return
  end
  servant_doUnequip(servantWrapper:getActorKeyRaw(), slotNo)
end
function InputMLUp_InventoryInfo_ServantEquipSlot(isEquipment, index)
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  if nil == dataType then
    return
  end
  local slotNo, check
  if true == isEquipment then
    slotNo = _servantData[dataType].equipSlotNoList[index]
    check = self._ui.servantEquipSlots[index].chk_toggleButton:IsCheck()
  else
    slotNo = _servantData[dataType].costumeSlotNoList[index]
    check = self._ui.servantCostumeSlots[index].chk_toggleButton:IsCheck()
  end
  if true == check then
    ToClient_SetVehicleEquipSlotFlag(vehicleType, _servantData[dataType].checkFlag[slotNo])
  else
    ToClient_ResetVehicleEquipSlotFlag(vehicleType, _servantData[dataType].checkFlag[slotNo])
  end
  ToClient_setShowVehicleEquip()
end
function InputMRUp_InventoryInfo_ServantCostumeSlot(index)
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  if nil == dataType then
    return
  end
  local slotNo = _servantData[dataType].costumeSlotNoList[index]
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
  if nil == itemWrapper then
    return
  end
  servant_doUnequip(servantWrapper:getActorKeyRaw(), slotNo)
end
function InputMLUp_InventoryInfo_ServantCostumeSlot()
end
function Input_InventoryInfo_ServantEquipShowTooltip(whereType, index, isShow)
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  local slotNo = _servantData[dataType].equipSlotNoList[index]
  Panel_Tooltip_Item_SetPosition(slotNo, self._ui.servantEquipSlots[index], "ServantEquipment")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "ServantEquipment", isShow, nil, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end
function Input_InventoryInfo_ServantCostumeShowTooltip(whereType, index, isShow)
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  local slotNo = _servantData[dataType].costumeSlotNoList[index]
  Panel_Tooltip_Item_SetPosition(slotNo, self._ui.servantCostumeSlots[index], "ServantEquipment")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "ServantEquipment", isShow, nil, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end
function InputMRUp_InventoryInfo_InvenSlot(index)
  local self = InventoryInfo
  if isKeyPressed(CppEnums.VirtualKeyCode.KeyCode_SHIFT) then
  else
    local actorKeysRaw = self:getNearbyServantsActorKeys()
    if UPPER_TAB_TYPE.SERVANT == self._currentUpperTab and #actorKeysRaw > 0 then
      self:onInventoryItemTransfer(index)
    else
      self:onInventoryItemRClick(index)
    end
  end
end
function InputMLDown_InventoryInfo_InvenSlot(index)
  local self = InventoryInfo
  local slotNo = self._ui.slot_inven[index].slotNo
  local inventoryType = self._lowerTabData[self._currentLowerTab].whereType
  local selfProxy = getSelfPlayer():get()
  if nil == selfProxy then
    return
  end
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = selfProxy:getInventorySlotCount(inventoryType)
  if Panel_Chatting_Input:IsShow() and isKeyPressed(CppEnums.VirtualKeyCode.KeyCode_SHIFT) then
    local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    if nil == itemWrapper then
      return
    end
    local focusEdit = GetFocusEdit()
    if true == _ContentsGroup_RenewUI_Chatting then
    elseif ChatInput_CheckCurrentUiEdit(focusEdit) then
      FGlobal_ChattingInput_LinkedItemByInventory(slotNo, inventoryType)
    end
  elseif isKeyPressed(CppEnums.VirtualKeyCode.KeyCode_SHIFT) then
    if (isGameTypeJapan() or isGameTypeRussia()) and getContentsServiceType() == CppEnums.ContentsServiceType.eContentsServiceType_CBT then
      return
    end
    local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    if nil ~= itemWrapper then
      Note_On(itemWrapper:get():getKey():getItemKey())
    end
  elseif invenUseSize - useStartSlot - self._invenStartSlotIndex == index - 1 then
  end
end
function Input_InventoryInfo_AutoSort()
  local self = InventoryInfo
  local isSorted = ToClient_IsSortedInventory()
  ToClient_SetSortedInventory(not isSorted)
  if isSorted then
    self._ui.stc_keyGuideXForSort:SetText("Arranged")
  else
    self._ui.stc_keyGuideXForSort:SetText("Not Arranged")
  end
  self:updateInventory()
end
function InputMOn_InventoryInfo_invenShowTooltip(index)
  if true == InventoryInfo._showAniIsPlaying then
    return
  end
  local self = InventoryInfo
  local slotNo
  if index + self._invenStartSlotIndex <= self._invenCapacity then
    slotNo = self._ui.slot_inven[index].slotNo
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  if slotNo ~= nil then
    self._slotEtcData[slotNo].isFirstItem = false
    if nil ~= effectScene.newItem[slotNo] then
      self._ui.slot_inven[index].icon:EraseEffect(effectScene.newItem[slotNo])
    end
  elseif true == _ContentsGroup_ForXBoxXR and true == _ContentsGroup_ForXBoxFinalCert and index + self._invenStartSlotIndex == self._invenCapacity + 1 then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_ADDINVENTORY_TOOLTIP_NAME")
    local desc = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_ADDINVENTORY_TOOLTIP_DESC")
    local control = self._ui.slot_inven[index].icon
    TooltipSimple_Show(control, name, desc)
    return
  else
    TooltipSimple_Hide()
  end
  self._tooltipWhereType = self._lowerTabData[self._currentLowerTab].whereType
  self._tooltipSlotNo = slotNo
  Panel_Tooltip_Item_Show_GeneralNormal(index, "inventory", true, false, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end
function InputMOut_InventoryInfo_invenHideTooltip(index)
  local self = InventoryInfo
  if nil ~= over_SlotEffect then
    self._ui.slot_inven[index].icon:EraseEffect(over_SlotEffect)
  end
  self._tooltipWhereType = nil
  self._tooltipSlotNo = nil
  Panel_Tooltip_Item_Show_GeneralNormal(index, "inventory", false, false)
  TooltipSimple_Hide()
end
function InputDrag_InventoryInfo_invenDrag(index)
  local self = InventoryInfo
  local slotNo = self._ui.slot_inven[index].slotNo
  if nil ~= inventoryDragNoUseList and inventoryDragNoUseList:IsShow() then
    return
  end
  if nil ~= self._rClickFunc then
    return
  end
  if Panel_Win_System:GetShow() then
    return
  end
  local whereType = self._lowerTabData[self._currentLowerTab].whereType
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if nil == itemWrapper then
  else
    local itemSSW = itemWrapper:getStaticStatus()
    local itemType = itemSSW:getItemType()
    local isTradeItem = itemSSW:isTradeAble()
    DragManager:setDragInfo(_panel, whereType, slotNo, "Icon/" .. itemWrapper:getStaticStatus():getIconPath(), Inventory_GroundClick, getSelfPlayer():getActorKey())
    if itemWrapper:getStaticStatus():get():isItemSkill() or itemWrapper:getStaticStatus():get():isUseToVehicle() then
      QuickSlot_ShowBackGround()
    end
    Item_Move_Sound(itemWrapper)
  end
end
function InputDrag_InventoryInfo_invenDragEnd(index)
  local self = InventoryInfo
  local slotNo = self._ui.slot_inven[index].slotNo
  if nil == DragManager.dragStartPanel then
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
    if DragManager.dragWhereTypeInfo == self._lowerTabData[self._currentLowerTab].whereType then
      inventory_swapItem(self._lowerTabData[self._currentLowerTab].whereType, DragManager.dragSlotInfo, slotNo)
    end
    DragManager:clearInfo()
  else
    return (DragManager:itemDragMove(CppEnums.MoveItemToType.Type_Player, getSelfPlayer():getActorKey()))
  end
  return true
end
local INVEN_MAX_COUNT = 192
function InputScroll_InventoryInfo_Inventory(isUp)
  local self = InventoryInfo
  local useStartSlot = inventorySlotNoUserStart()
  local inventory = Inventory_GetCurrentInventory()
  local maxSize = inventory:sizeXXX() - useStartSlot
  local prevSlotIndex = self._invenStartSlotIndex
  self._invenStartSlotIndex = UIScroll.ScrollEvent(self._ui.scroll_inven, isUp, self._invenSlotRowMax, maxSize, self._invenStartSlotIndex, self._invenSlotColumnMax)
  local intervalSlotIndex = INVEN_MAX_COUNT - self._invenSlotMax
  if prevSlotIndex == 0 and self._invenStartSlotIndex == 0 or prevSlotIndex == intervalSlotIndex and self._invenStartSlotIndex == intervalSlotIndex then
    return
  end
  if ToClient_isXBox() or ToClient_IsDevelopment() then
    ToClient_setIgnoreSnapping()
  end
  self:updateInventory()
end
function InventoryInfo:onInventoryItemRClick(index)
  if nil == self._ui.slot_inven[index] or nil == self._ui.slot_inven[index].slotNo then
    return
  end
  local inventoryType = self._lowerTabData[self._currentLowerTab].whereType
  local slotNo = self._ui.slot_inven[index].slotNo
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if nil == itemWrapper then
    return
  end
  local itemStatic = itemWrapper:getStaticStatus():get()
  if nil == itemStatic then
    return
  end
  local itemEnchantWrapper = itemWrapper:getStaticStatus()
  if nil == itemEnchantWrapper then
    return
  end
  local selfProxy = getSelfPlayer():get()
  if nil == selfProxy then
    return
  end
  if nil ~= itemWrapper then
    if selfProxy:doRideMyVehicle() and itemStatic:isUseToVehicle() then
      inventoryUseItem(inventoryType, slotNo, equipSlotNo, false)
      return
    end
    if Panel_Window_StableStallion:GetShow() then
      local itemMaxCount = FGlobal_MaxItemCount(slotNo)
      if nil ~= itemMaxCount then
        if itemMaxCount < Int64toInt32(itemWrapper:get():getCount_s64()) then
          Panel_NumberPad_Show(true, tonumber64(itemMaxCount), slotNo, Set_StallionItemSlot, nil, itemWrapper)
        else
          Panel_NumberPad_Show(true, itemWrapper:get():getCount_s64(), slotNo, Set_StallionItemSlot, nil, itemWrapper)
        end
      end
      return
    end
    if nil ~= self._rClickFunc then
      self._rClickFunc(slotNo, itemWrapper, itemWrapper:get():getCount_s64(), inventoryType)
      return
    end
    PaGlobal_TutorialManager:handleInventorySlotRClick(itemWrapper:get():getKey():getItemKey())
    PaGlobal_TutorialManager:handleInventorySlotRClickgetSlotNo(slotNo)
    if nil ~= Panel_Auction_Regist_Popup and Panel_Auction_Regist_Popup:GetShow() then
      if itemWrapper:getStaticStatus():isStackable() then
        Panel_NumberPad_Show(true, itemWrapper:get():getCount_s64(), slotNo, Auction_RegisterItemFromInventory)
      else
        Auction_RegisterItemFromInventory(1, slotNo)
      end
      return
    elseif nil ~= Panel_Housing_SettingVendingMachine and Panel_Housing_SettingVendingMachine:GetShow() then
      VendingMachine_RegisterItemFromInventory(slotNo, 1)
      return
    elseif nil ~= Panel_Housing_VendingMachineList and Panel_Housing_VendingMachineList:GetShow() then
      FGlobal_VendingMachineRegisterItemFromInventory(slotNo)
    elseif nil ~= Panel_Housing_ConsignmentSale and Panel_Housing_ConsignmentSale:GetShow() then
      FGlobal_ConsignmentRegisterItemFromInventory(itemWrapper:get():getCount_s64(), slotNo)
    elseif nil ~= Panel_Window_FairySetting and Panel_Window_FairySetting:GetShow() then
      PaGlobal_FairySetting_SetPortion(itemWrapper:get():getKey())
    elseif nil ~= Panel_FairyInfo and Panel_Window_FairyUpgrade:GetShow() then
      if true == itemWrapper:getStaticStatus():isStackable() then
        Panel_NumberPad_Show(true, itemWrapper:get():getCount_s64(), slotNo, PaGlobal_FairyUpgrade_RClickItemByNumberPad, false, itemWrapper:get():getKey())
      else
        PaGlobal_FairyUpgrade_RClickItem(itemWrapper:get():getKey(), slotNo, 1)
      end
    elseif getAuctionState() then
      return
    elseif 2 == itemEnchantWrapper:get()._vestedType:getItemKey() and false == itemWrapper:get():isVested() then
      local function bindingItemUse()
        Inventory_UseItemTargetSelf(inventoryType, slotNo, equipSlotNo)
      end
      local messageContent
      if itemEnchantWrapper:isUserVested() then
        messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT_USERVESTED")
      else
        messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT")
      end
      local messageboxData = {
        title = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_TITLE"),
        content = messageContent,
        functionYes = bindingItemUse,
        functionNo = MessageBox_Empty_function,
        priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageboxData)
    elseif eConnectUiType.eConnectUi_Undefined ~= itemWrapper:getStaticStatus():getConnectUi() then
      Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "inventory", false, false)
      ConnectUI(itemWrapper:getStaticStatus():getConnectUi())
    elseif itemWrapper:getStaticStatus():getItemType() == 8 then
      return
    elseif itemEnchantWrapper:isPopupItem() then
      Panel_UserItem_PopupItem(itemEnchantWrapper, inventoryType, slotNo, equipSlotNo)
      Panel_Tooltip_Item_hideTooltip()
    elseif itemEnchantWrapper:isExchangeItemNPC() or itemWrapper:isSoulCollector() then
      local itemKey = itemWrapper:get():getKey():getItemKey()
      if nil == itemKey then
        return
      end
      local invenPopupConfig = {
        [1] = {
          func = HandleClickedWayPoint,
          param = slotNo,
          icon = nil,
          desc = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_INVENTORY_EXCHANGE_WAYPOINT_BTN"),
          enable = true
        },
        [2] = {
          func = HandleClickedWidget,
          param = slotNo,
          icon = nil,
          desc = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_INVENTORY_EXCHANGE_WIDGET_BTN"),
          enable = true
        }
      }
      if MiniGame_Manual_Value_FishingStart == true then
        invenPopupConfig[1].enable = false
      end
      if not PaGlobalFunc_InventoryPopup_IsOpened() then
        PaGlobalFunc_InventoryPopup_Open(invenPopupConfig, getMousePosX(), getMousePosY())
      else
        PaGlobalFunc_InventoryPopup_Close()
      end
    elseif not itemStatic:isUseToVehicle() then
      local function useTradeItem()
        Inventory_UseItemTargetSelf(inventoryType, slotNo, nil)
      end
      local itemSSW = itemWrapper:getStaticStatus()
      local item_type = itemSSW:getItemType()
      if 2 == item_type and true == itemSSW:get():isForJustTrade() then
        local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRADEITEMUSE_CONTENT")
        local messageboxData = {
          title = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRADEITEMUSE_TITLE"),
          content = messageContent,
          functionYes = useTradeItem,
          functionNo = MessageBox_Empty_function,
          priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
        }
        MessageBox.showMessageBox(messageboxData)
      else
        local equipType = itemWrapper:getStaticStatus():getEquipType()
        if 16 == equipType or 17 == equipType then
          local accSlotNo = FGlobal_AccSlotNo(itemWrapper, true)
          Inventory_UseItemTargetSelf(inventoryType, slotNo, accSlotNo)
        else
          Inventory_UseItemTargetSelf(inventoryType, slotNo, nil)
        end
      end
    end
  end
end
function InventoryInfo:onInventoryItemTransfer(index)
  if nil == self._ui.slot_inven[index] or nil == self._ui.slot_inven[index].slotNo then
    return
  end
  local slotNo = self._ui.slot_inven[index].slotNo
  local whereType = _lowerTabData[self._currentLowerTab].whereType
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  FGlobal_PopupMoveItem_InitByInventory(slotNo, itemWrapper, itemWrapper:get():getCount_s64(), whereType)
end
function InputMOn_InventoryInfo_equipShowTooltip(index, isOn)
  if true == InventoryInfo._showAniIsPlaying then
    return
  end
  Panel_Tooltip_Item_Show_GeneralNormal(index, "equipment", isOn, false, _panel:GetPosX() - 20, 200)
end
function Input_InventoryInfo_CostumeShowToggle(index)
  local self = InventoryInfo
  local isCheck = self._ui.costumeSlots[index].chk_toggleButton:IsCheck()
  if true == isCheck then
    ToClient_SetAvatarEquipSlotFlag(_avatarCheckFlag[self._costumeSlotNo[index]])
  else
    ToClient_ResetAvatarEquipSlotFlag(_avatarCheckFlag[self._costumeSlotNo[index]])
  end
  Toclient_setShowAvatarEquip()
end
function Input_InventoryInfo_CompletePuzzle()
  InventoryInfo._ui.btn_invenPuzzle:SetShow(false)
  requestMakePuzzle()
end
function Input_InventoryInfo_ItemDelete(index)
  _PA_LOG("\235\176\149\235\178\148\236\164\128", "Input_InventoryInfo_ItemDelete")
  local self = InventoryInfo
  if nil ~= self._rClickFunc then
    return
  end
  local slotNo = self._ui.slot_inven[index].slotNo
  if nil == slotNo then
    _PA_LOG("\235\176\149\235\178\148\236\164\128", "slotNo nil")
    return
  end
  local whereType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if nil == itemWrapper then
    return
  end
  local itemCount = itemWrapper:get():getCount_s64()
  if Defines.s64_const.s64_1 == itemCount then
    Inventory_ItemDelete_Check(Defines.s64_const.s64_1, slotNo, whereType)
  else
    Panel_NumberPad_Show(true, itemCount, slotNo, Inventory_ItemDelete_Check, nil, whereType)
  end
end
function Inventory_ItemDelete_Check(count, slotNo, whereType)
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  local itemName = itemWrapper:getStaticStatus():getName()
  deleteWhereType = whereType
  deleteSlotNo = slotNo
  itemCount = count
  DragManager:clearInfo()
  local luaDeleteItemMsg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DELETEITEM_MSG", "itemName", itemName, "itemCount", tostring(count))
  local luaDelete = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DELETE")
  local messageContent = luaDeleteItemMsg
  local messageboxData = {
    title = luaDelete,
    content = messageContent,
    functionYes = Inventory_Delete_Yes,
    functionNo = Inventory_Delete_No,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function Inventory_Delete_Yes()
  if deleteSlotNo == nil then
    return
  end
  local itemWrapper = getInventoryItemByType(deleteWhereType, deleteSlotNo)
  if nil == itemWrapper then
    return
  end
  if CppEnums.ContentsEventType.ContentsType_InventoryBag == itemWrapper:getStaticStatus():get():getContentsEventType() then
    local bagType = itemWrapper:getStaticStatus():getContentsEventParam1()
    local bagSize = itemWrapper:getStaticStatus():getContentsEventParam2()
    local isEmptyBag = false
    for index = 0, bagSize - 1 do
      local bagItemWrapper = getInventoryBagItemByType(deleteWhereType, deleteSlotNo, index)
      if nil ~= bagItemWrapper then
        if CppEnums.InventoryBagType.eInventoryBagType_Cash == bagType then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_DELETEITEM_ALERT"))
        elseif CppEnums.InventoryBagType.eInventoryBagType_Equipment == bagType then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_DELETEITEM_ALERT2"))
        else
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_DELETEITEM_ALERT3"))
        end
        DragManager:clearInfo()
        Inventory_DropEscape()
        return
      end
    end
  end
  if itemWrapper:isCash() then
    PaymentPassword(Inventory_Delete_YesXXX)
    return
  end
  Inventory_Delete_YesXXX()
  PaGlobal_TutorialManager:handleInventoryDelete(itemWrapper, deleteWhereType, deleteSlotNo)
end
function Inventory_Delete_YesXXX()
  if deleteSlotNo == nil then
    return
  end
  deleteItem(getSelfPlayer():getActorKey(), deleteWhereType, deleteSlotNo, itemCount)
  Inventory_DropEscape()
  DragManager:clearInfo()
end
function Inventory_Delete_No()
  deleteWhereType = nil
  deleteSlotNo = nil
  DragManager:clearInfo()
end
function FromClient_InventoryInfo_EquipmentHaveChanged()
  local self = InventoryInfo
  self:updateEquipment()
  self:updateCostume()
  self:updateInventory()
end
function FromClient_InventoryInfo_EventEquipItem(slotNo)
  local self = InventoryInfo
  local slot = {}
  if true == self:slotNoIsCostume(slotNo) then
    slot = self._ui.costumeSlots[self:getIndexFromCostumeSlotNo(slotNo)]
    slot.icon:AddEffect("UI_ItemInstall_Cash", false, 0, 0)
  else
    slot = self._ui.equipSlots[self:getIndexFromEquipSlotNo(slotNo)]
    slot.icon:AddEffect("UI_ItemInstall", false, 0, 0)
  end
  slot.icon:AddEffect("fUI_SkillButton01", false, 0, 0)
  self:updateAttackStat(true)
end
function FromClient_InventoryInfo_OpenServantInven(actorKeyRaw)
  self._servantActorKeyRaw = {}
  self._servantActorKeyRaw[1] = actorKeyRaw
  InventoryInfo:open(UPPER_TAB_TYPE.SERVANT)
end
function FromClient_InventoryInfo_ServantEquipOn(slotNo)
end
function FromClient_InventoryInfo_ServantEquipChanged()
  InventoryInfo:updateInventory()
  InventoryInfo:updateServantEquipOrCostume(true)
  InventoryInfo:updateServantEquipOrCostume(false)
end
function FromClient_InventoryInfo_OnScreenResize()
  local self = InventoryInfo
  local screenY = getScreenSizeY()
  Panel_NewEquip_EffectLastUpdate()
  _panel:SetSize(_panel:GetSizeX(), screenY)
  self._ui.stc_weightBarBG:SetSize(self._ui.stc_weightBarBG:GetSizeX(), screenY)
  self._ui.progress2_Weight:SetSize(self._ui.stc_weightBarBG:GetSizeX(), screenY)
  self._ui.progress2_Equipment:SetSize(self._ui.stc_weightBarBG:GetSizeX(), screenY)
  self._ui.progress2_Silver:SetSize(self._ui.stc_weightBarBG:GetSizeX(), screenY)
end
function FromClient_InventoryInfo_updateInvenSlot()
  InventoryInfo:updateInventory()
  InventoryInfo:updateWeight()
end
function FromClient_InventoryInfo_SetShow(isShow)
  if false == isShow then
    PaGlobalFunc_Window_InventoryInfo_Close()
  else
    InventoryInfo:open()
  end
end
function FromClient_InventoryInfo_SetShowWithFilter(actorType)
  PaGlobalFunc_InventoryInfo_Open()
  if CppEnums.ActorType.ActorType_Player == actorType or CppEnums.ActorType.ActorType_Deadbody == actorType then
    Inventory_SetFunctor(InvenFiler_InterActionDead, Inventory_UseItemTarget, InventoryWindow_Close, nil)
  elseif CppEnums.ActorType.ActorType_Vehicle == actorType then
    Inventory_SetFunctor(InvenFiler_InterActionFodder, Inventory_UseItemTarget, InventoryWindow_Close, nil)
  elseif CppEnums.ActorType.ActorType_Npc == actorType then
    Inventory_SetFunctor(InvenFiler_InterActionFuel, Inventory_UseFuelItem, InventoryWindow_Close, nil)
  end
end
function FromClient_InventoryInfo_UnequipItem(whereType, slotNo)
  local self = InventoryInfo
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if nil == itemWrapper then
    return
  end
  local itemStatic = itemWrapper:getStaticStatus():get()
  if nil == itemStatic then
    return
  end
  if nil == self._invenCapacity then
    return
  end
  for ii = 0, self._invenCapacity - 1 do
    if nil ~= self._ui.slot_inven[ii] and nil ~= self._ui.slot_inven[ii].slotNo and slotNo == self._ui.slot_inven[ii].slotNo then
      self._ui.stc_invenSlotBG[ii]:AddEffect("fUI_Item_Clear", false, 0, 0)
    end
  end
  audioPostEvent_SystemUi(2, 0)
end
function FromClient_InventoryInfo_UseItemAskFromOtherPlayer(fromName)
  local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_USEITEM_MESSAGEBOX_REQUEST", "for_name", fromName)
  local messageboxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_USEITEM_MESSAGEBOX_TITLE"),
    content = messageboxMemo,
    functionYes = UseItemFromOtherPlayer_Yes,
    functionCancel = UseItemFromOtherPlayer_No,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function FromClient_InventoryInfo_FindExchangeItemNPC()
  local itemEnchantKey = getSelfPlayer():get():getCurrentFindExchangeItemEnchantKey()
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  if nil == itemSSW then
    return
  end
  FindExchangeItemNPC(itemSSW)
end
function FromClient_InventoryInfo_updateSlotDatabyAddItem()
  if true == PaGlobalFunc_Window_InventoryInfo_isOpened() then
    Inventory_updateSlotData()
  end
end
function FromClient_InventoryInfo_ResistChanged()
  InventoryInfo:updateInformation()
end
function FromClient_InventoryInfo_PotentialChanged()
  InventoryInfo:updateInformation()
end
function FromClient_InventoryInfo_FitnessChanged()
  InventoryInfo:updateInformation()
end
function Inventory_SetShow(isInvenShow)
  if not isInvenShow then
    InventoryWindow_Close()
    Panel_Tooltip_Item_hideTooltip()
    PaGlobal_TutorialUiManager:getUiMasking():hideQuestMasking()
  else
    InventoryWindow_Show()
  end
end
function Inventory_SetFunctor(filterFunction, rClickFunction, otherWindowOpenFunction, effect)
  local self = InventoryInfo
  if nil ~= self._otherWindowOpenFunc and nil ~= otherWindowOpenFunction then
    local otherWindowOpenFuncDiff = otherWindowOpenFunction ~= self._otherWindowOpenFunc
    if otherWindowOpenFuncDiff and (nil ~= filterFunction or nil ~= rClickFunction or nil ~= otherWindowOpenFunction) then
      self._otherWindowOpenFunc()
    end
  end
  if nil ~= filterFunction and "function" ~= type(filterFunction) then
    filterFunction = nil
    UI.ASSERT(false, "Param 1 must be Function type")
  end
  if nil ~= rClickFunction and "function" ~= type(rClickFunction) then
    rClickFunction = nil
    UI.ASSERT(false, "Param 2 must be Function type")
  end
  if nil ~= otherWindowOpenFunction and "function" ~= type(otherWindowOpenFunction) then
    otherWindowOpenFunction = nil
    UI.ASSERT(false, "Param 3 must be Function type")
  end
  if nil ~= effect and "function" ~= type(effect) then
    effect = nil
    UI.ASSERT(false, "Param 4 must be Function type")
  end
  if nil ~= rClickFunction and "function" == type(rClickFunction) then
    self._ui.stc_keyGuide:SetShow(false)
    self._ui.txt_keyGuideAForSelect:SetShow(true)
  else
    self._ui.txt_keyGuideAForSelect:SetShow(false)
    self._ui.stc_keyGuide:SetShow(true)
  end
  self._otherWindowOpenFunc = otherWindowOpenFunction
  self._rClickFunc = rClickFunction
  self._filterFunc = filterFunction
  self._effect = effect
  if PaGlobalFunc_InventoryInfo_GetShow() then
    self:updateInventory()
  end
end
local inventoryDragNoUseList
function FGlobal_SetInventoryDragNoUse(pPanel)
  inventoryDragNoUseList = pPanel
end
function PaGlobalFunc_InventoryInfo_GetSlotNo(fromSlotNo)
  if nil == fromSlotNo then
    return
  end
  local self = InventoryInfo
  local toSlotNo = self._ui.slot_inven[fromSlotNo].slotNo
  return toSlotNo
end
function Inventory_GetToopTipItem()
  local self = InventoryInfo
  if nil == self._tooltipWhereType then
    return nil
  end
  if nil == self._tooltipSlotNo then
    return nil
  end
  local wrapper = getInventoryItemByType(self._tooltipWhereType, self._tooltipSlotNo)
  if nil == wrapper then
  end
  return wrapper
end
function Inventory_GetToolTipItemSlotNo()
  local self = InventoryInfo
  if nil == self._tooltipWhereType then
    return nil
  end
  if nil == self._tooltipSlotNo then
    return nil
  end
  return self._tooltipSlotNo
end
function FGlobal_CheckUnderwear()
  local self = InventoryInfo
  local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
  local isSafeZone = regionInfo:get():isSafeZone()
  if not isSafeZone then
    self._ui.chk_showUnderwear:SetCheck(false)
  end
end
function PaGlobalFunc_InventoryInfo_ItemComparer(ii, jj)
  return Global_ItemComparer(ii, jj, getInventoryItemByType, Inventory_GetCurrentInventoryType())
end
function Inventory_GetCurrentInventory()
  local selfPlayerWrapper = getSelfPlayer()
  if nil == selfPlayerWrapper then
    return nil
  end
  local selfPlayer = selfPlayerWrapper:get()
  local inventory = selfPlayer:getInventoryByType(Inventory_GetCurrentInventoryType())
  return inventory
end
function Inventory_GetCurrentInventoryType()
  local self = InventoryInfo
  if LOWER_TAB_TYPE.UNDEFINED == self._currentLowerTab then
    return self._lowerTabData[LOWER_TAB_TYPE.INVENTORY].whereType
  else
    return self._lowerTabData[self._currentLowerTab].whereType
  end
end
function Inventory_GetStartIndex()
  return InventoryInfo._invenStartSlotIndex
end
function getInventory_RealSlotNo(index)
  local self = InventoryInfo
  if nil == self._ui.slot_inven[index] then
    return index
  end
  return self._ui.slot_inven[index].slotNo
end
function Global_GetInventorySlotNoByNotSorted(fromSlotNo)
  if nil == fromSlotNo then
    return
  end
  local self = InventoryInfo
  local toSlotNo = self._ui.slot_inven[fromSlotNo].slotNo
  return toSlotNo
end
function FGlobal_AccSlotNo(itemWrapper, isChange)
  local self = InventoryInfo
  local equipType = itemWrapper:getStaticStatus():getEquipType()
  local firstRingOffence = 0
  local firstRingDeffence = 0
  local secondRingOffence = 0
  local secondRingDeffence = 0
  local acc
  if 16 == equipType then
    equipItemWrapper = ToClient_getEquipmentItem(8)
    equipItemWrapper2 = ToClient_getEquipmentItem(9)
    if nil ~= equipItemWrapper and nil ~= equipItemWrapper2 then
      acc = 8 + self._slotRingIndex
      if isChange then
        if 0 == self._slotRingIndex then
          self._slotRingIndex = 1
        else
          self._slotRingIndex = 0
        end
      end
    elseif nil == equipItemWrapper and nil ~= equipItemWrapper2 then
      self._slotRingIndex = 0
      acc = 8
    elseif nil ~= equipItemWrapper and nil == equipItemWrapper2 then
      self._slotRingIndex = 0
      acc = 9
    else
      self._slotRingIndex = 0
      acc = 8
    end
  elseif 17 == equipType then
    equipItemWrapper = ToClient_getEquipmentItem(10)
    equipItemWrapper2 = ToClient_getEquipmentItem(11)
    if nil ~= equipItemWrapper and nil ~= equipItemWrapper2 then
      acc = 10 + self._slotEarringIndex
      if isChange then
        if 0 == self._slotEarringIndex then
          self._slotEarringIndex = 1
        else
          self._slotEarringIndex = 0
        end
      end
    elseif nil == equipItemWrapper and nil ~= equipItemWrapper2 then
      acc = 10
    elseif nil ~= equipItemWrapper and nil == equipItemWrapper2 then
      acc = 11
    else
      acc = 10
    end
  end
  return acc
end
local isFirstSummonItemUse = false
function Inventory_UseItemTargetSelf(whereType, slotNo, equipSlotNo)
  local self = InventoryInfo
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if nil == itemWrapper then
    return
  end
  local itemKey = itemWrapper:get():getKey():getItemKey()
  if itemKey >= 41548 and itemKey <= 41570 or itemKey >= 42000 and itemKey <= 42010 or itemKey >= 42034 and itemKey <= 42040 or 42053 == itemKey or 42054 == itemKey then
    audioPostEvent_SystemUi(0, 14)
  end
  inventoryUseItem(whereType, slotNo, equipSlotNo, true)
  if (42000 == itemKey or 42001 == itemKey or 42002 == itemKey or 42010 == itemKey or 42003 == itemKey or 42004 == itemKey or 42034 == itemKey or 42035 == itemKey or 42037 == itemKey or 42036 == itemKey or 42006 == itemKey or 42008 == itemKey or 42039 == itemKey or 42038 == itemKey or 42007 == itemKey or 42053 == itemKey or 41610 == itemKey or 42009 == itemKey or 42054 == itemKey or 42057 == itemKey or 42061 == itemKey or 42066 == itemKey or 42055 == itemKey or 42056 == itemKey) and PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() then
    isFirstSummonItemUse = true
  end
end
function FGlobal_FirstSummonItemUse()
  return isFirstSummonItemUse
end
function Inventory_UseItemTarget(slotNo, itemWrapper, count_s64, inventoryType)
  if restrictedActionForUseItem() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_USEITEM"))
    return
  end
  local isTargetSelfPlayer = false
  inventoryUseItem(inventoryType, slotNo, isTargetSelfPlayer)
end
function InventoryInfo:addEffectBlackStone(ii, isFiltered, slotNo)
  local slot = self._ui.slot_inven[ii]
  local itemWrapper = getInventoryItemByType(Inventory_GetCurrentInventoryType(), slotNo)
  local Panel_Inventory_isBlackStone_16002 = false
  local itemKey = itemWrapper:get():getKey():getItemKey()
  if 16001 == itemKey then
    if not isFiltered then
      slot.icon:AddEffect("fUI_DarkstoneAura01", true, 0, 0)
    end
    Panel_Inventory_isBlackStone_16001 = true
  elseif 16002 == itemKey then
    if not isFiltered then
      slot.icon:AddEffect("fUI_DarkstoneAura02", true, 0, 0)
    end
    Panel_Inventory_isBlackStone_16002 = true
  end
  return Panel_Inventory_isBlackStone_16002
end
function InventoryInfo:addEffectMapea(ii, slotNo)
  local slot = self._ui.slot_inven[ii]
  local itemWrapper = getInventoryItemByType(Inventory_GetCurrentInventoryType(), slotNo)
  if GetUIMode() == Defines.UIMode.eUIMode_Stable and not EffectFilter_Mapae(slotNo, itemWrapper) then
    slot.icon:AddEffect("fUI_HorseNameCard01", true, 0, 0)
  end
end
local _hpPotionKeys = {
  502,
  513,
  514,
  517,
  518,
  519,
  524,
  525,
  528,
  529,
  530,
  538,
  551,
  552,
  553,
  554,
  555,
  17568,
  17569,
  19932,
  19933,
  19934,
  19935
}
local _mpPotionKeys = {
  503,
  515,
  516,
  520,
  521,
  522,
  526,
  527,
  531,
  532,
  533,
  540,
  561,
  562,
  563,
  564,
  565,
  17570,
  17571,
  19936,
  19937,
  19938
}
function InventoryInfo:autoSetPotion(playerLevel, itemKey, currentWhereType, slotNo)
  if playerLevel <= 10 then
    local hpPotionFound = false
    for ii = 1, #_hpPotionKeys do
      if itemKey == _hpPotionKeys[ii] then
        hpPotionFound = true
        break
      end
    end
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
    if mpPotionFound then
      FGlobal_Potion_InvenToQuickSlot(currentWhereType, slotNo, 1)
    end
  end
end
function InvenFiler_InterActionDead(slotNo, itemWrapper)
  if nil == itemWrapper then
    return true
  end
  return itemWrapper:getStaticStatus():get():isItemTargetAlive() or not itemWrapper:checkConditions()
end
function InvenFiler_InterActionFodder(slotNo, itemWrapper)
  if nil == itemWrapper then
    return true
  end
  return not itemWrapper:getStaticStatus():get():isUseToVehicle() or not itemWrapper:checkConditions()
end
function InvenFiler_InterActionFuel(slotNo, itemWrapper)
  if nil == itemWrapper then
    return true
  end
  return not isFusionItem(Inventory_GetCurrentInventoryType(), slotNo)
end
function Inventory_UseFuelItem(slotNo, itemWrapper, count_s64, inventoryType)
  burnItemToActor(inventoryType, slotNo, 1, false)
end
function FindExchangeItemNPC(itemSSW)
  local selfProxy = getSelfPlayer():get()
  if nil == selfProxy then
    return
  end
  local selfPosition = float3(selfProxy:getPositionX(), selfProxy:getPositionY(), selfProxy:getPositionZ())
  local itemKey = itemSSW:get()._key:get()
  local npcPosition = {}
  local minIndex = 0
  local minDistance = 0
  ToClient_DeleteNaviGuideByGroup(0)
  local count = itemSSW:getExchangeItemNPCInfoListCount()
  for index = 0, count - 1 do
    local spawnData = npcByCharacterKey_getNpcInfo(itemSSW:getCharacterKeyByIdx(index), itemSSW:getDialogIndexByIdx(index))
    if nil ~= spawnData then
      local npcPos = spawnData:getPosition()
      npcPosition[index] = npcPos
      local distance = Util.Math.calculateDistance(selfPosition, npcPos)
      if 0 == index then
        minDistance = distance
      elseif distance < minDistance then
        minIndex = index
        minDistance = distance
      end
    end
  end
  for ii = 0, count - 1 do
    if ii ~= minIndex and nil ~= npcPosition[ii] then
      worldmapNavigatorStart(float3(npcPosition[ii].x, npcPosition[ii].y, npcPosition[ii].z), NavigationGuideParam(), false, false, true)
    end
  end
  if nil ~= npcPosition[minIndex] then
    worldmapNavigatorStart(float3(npcPosition[minIndex].x, npcPosition[minIndex].y, npcPosition[minIndex].z), NavigationGuideParam(), false, false, true)
  end
  audioPostEvent_SystemUi(0, 14)
  selfProxy:setCurrentFindExchangeItemEnchantKey(itemKey)
end
function InventoryInfo:compareSpec(whereType, slotNo, isAccessory)
  local selfPlayerWrapper = getSelfPlayer()
  local classType = selfPlayerWrapper:getClassType()
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  local equipItemWrapper = ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo())
  local offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
  local defencePoint = itemWrapper:getStaticStatus():getDefence(0)
  local equipOffencePoint = 0
  local equipDefencePoint = 0
  local matchEquip = false
  local isEquip = itemWrapper:getStaticStatus():get()._usableClassType:isOn(classType)
  local isAwakenWeaponContentsOpen = PaGlobal_AwakenSkill.awakenWeapon[classType]
  if isEquip and not Panel_Window_Exchange:GetShow() then
    local equipType = itemWrapper:getStaticStatus():getEquipType()
    local enum_class = CppEnums.ClassType
    local firstRingOffence = 0
    local firstRingDeffence = 0
    local secondRingOffence = 0
    local secondRingDeffence = 0
    local matchEquip = true
    if 16 == equipType or 17 == equipType then
      local accSlotNo = FGlobal_AccSlotNo(itemWrapper, false)
      local equipItemWrapper = ToClient_getEquipmentItem(accSlotNo)
      if nil ~= equipItemWrapper then
        equipOffencePoint = (equipItemWrapper:getStaticStatus():getMinDamage(0) + equipItemWrapper:getStaticStatus():getMaxDamage(0)) / 2
        equipDefencePoint = equipItemWrapper:getStaticStatus():getDefence()
        return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, true
      else
        return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, true
      end
    elseif 15 == equipType or 18 == equipType then
      equipItemWrapper = ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo())
      if nil ~= equipItemWrapper then
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(0) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(0)) / 2
        equipDefencePoint = ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getDefence()
        matchEquip = true
      else
        equipOffencePoint = 0
        equipDefencePoint = 0
        matchEquip = true
      end
      return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, true
    end
    equipItemWrapper = ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo())
    if nil ~= equipItemWrapper then
      equipDefencePoint = ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getDefence(0)
      if (enum_class.ClassType_Warrior == classType or enum_class.ClassType_Valkyrie == classType) and (1 == equipType or 8 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(0) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(0)) / 2
        defencePoint = itemWrapper:getStaticStatus():getDefence(0)
        matchEquip = true
      elseif enum_class.ClassType_Giant == classType and (29 == equipType or 34 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(0) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(0)) / 2
        matchEquip = true
      elseif (enum_class.ClassType_Ranger == classType or enum_class.ClassType_Orange == classType) and (31 == equipType or 32 == equipType or 73 == equipType or 74 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(1) + itemWrapper:getStaticStatus():getMaxDamage(1)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(1) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(1)) / 2
        matchEquip = true
      elseif enum_class.ClassType_Sorcerer == classType and (28 == equipType or 33 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(2) + itemWrapper:getStaticStatus():getMaxDamage(2)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(2) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(2)) / 2
        matchEquip = true
      elseif enum_class.ClassType_Tamer == classType and (2 == equipType or 37 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(2) + itemWrapper:getStaticStatus():getMaxDamage(2)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(2) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(2)) / 2
        matchEquip = true
      elseif (enum_class.ClassType_NinjaWomen == classType or enum_class.ClassType_NinjaMan == classType) and (2 == equipType or 56 == equipType or 55 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(0) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(0)) / 2
        matchEquip = true
      elseif (enum_class.ClassType_BladeMaster == classType or enum_class.ClassType_BladeMasterWomen == classType) and (3 == equipType or 36 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(0) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(0)) / 2
        matchEquip = true
      elseif (enum_class.ClassType_Wizard == classType or enum_class.ClassType_WizardWomen == classType) and (6 == equipType or 32 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(2) + itemWrapper:getStaticStatus():getMaxDamage(2)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(2) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(2)) / 2
        matchEquip = true
      elseif enum_class.ClassType_DarkElf == classType and (63 == equipType or 34 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(2) + itemWrapper:getStaticStatus():getMaxDamage(2)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(2) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(2)) / 2
        matchEquip = true
      elseif enum_class.ClassType_Combattant == classType or enum_class.ClassType_CombattantWomen == classType and (65 == equipType or 66 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(0) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(0)) / 2
        matchEquip = true
      elseif enum_class.ClassType_Lahn == classType and (67 == equipType or 70 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
        offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
        equipOffencePoint = (ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMinDamage(0) + ToClient_getEquipmentItem(itemWrapper:getStaticStatus():getEquipSlotNo()):getStaticStatus():getMaxDamage(0)) / 2
        matchEquip = true
      end
    elseif (enum_class.ClassType_Warrior == classType or enum_class.ClassType_Valkyrie == classType) and (1 == equipType or 8 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif enum_class.ClassType_Giant == classType and (29 == equipType or 34 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif (enum_class.ClassType_Ranger == classType or enum_class.ClassType_Orange == classType) and (31 == equipType or 32 == equipType or 73 == equipType or 74 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(1) + itemWrapper:getStaticStatus():getMaxDamage(1)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif enum_class.ClassType_Sorcerer == classType and (28 == equipType or 33 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(2) + itemWrapper:getStaticStatus():getMaxDamage(2)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif enum_class.ClassType_Tamer == classType and (2 == equipType or 37 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(2) + itemWrapper:getStaticStatus():getMaxDamage(2)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif (enum_class.ClassType_NinjaWomen == classType or enum_class.ClassType_NinjaMan == classType) and (2 == equipType or 56 == equipType or 55 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif (enum_class.ClassType_BladeMaster == classType or enum_class.ClassType_BladeMasterWomen == classType) and (3 == equipType or 36 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif (enum_class.ClassType_Wizard == classType or enum_class.ClassType_WizardWomen == classType) and (6 == equipType or 32 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(2) + itemWrapper:getStaticStatus():getMaxDamage(2)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif enum_class.ClassType_DarkElf == classType and (63 == equipType or 34 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(2) + itemWrapper:getStaticStatus():getMaxDamage(2)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif enum_class.ClassType_Combattant == classType or enum_class.ClassType_CombattantWomen == classType and (65 == equipType or 66 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    elseif enum_class.ClassType_Lahn == classType and (67 == equipType or 70 == equipType or isAwakenWeaponContentsOpen and 57 == equipType) or 13 == equipType or 9 == equipType or 11 == equipType or 12 == equipType then
      offencePoint = (itemWrapper:getStaticStatus():getMinDamage(0) + itemWrapper:getStaticStatus():getMaxDamage(0)) / 2
      defencePoint = itemWrapper:getStaticStatus():getDefence(0)
      matchEquip = true
    end
    isAccessory = false
    return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, isAccessory
  end
end
function Inventory_updateSlotData(ignorePanelVisibility)
  InventoryInfo:updateInventory(ignorePanelVisibility)
end
function FGlobal_UpdateInventoryWeight()
  InventoryInfo:updateWeight()
end
function InventoryWindow_Close()
  PaGlobalFunc_InventoryInfo_Close()
end
function HandleClicked_InventoryWindow_Close()
  PaGlobalFunc_InventoryInfo_Close()
end
function Inven_FindPuzzle()
  InventoryInfo:findPuzzle()
end
function InventoryWindow_Show()
  PaGlobalFunc_InventoryInfo_Open()
end
function InventoryInfo:checkRestrictedAction()
  local isRestricted = checkManufactureAction() or checkAlchemyAction()
  return isRestricted
end
function Manufacture_On(slotNo)
  if Panel_Manufacture:GetShow() then
    return
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return
  end
  if 0 ~= ToClient_GetMyTeamNoLocalWar() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_LOCALWAR_ALERT"))
    return
  end
  Panel_Invertory_Manufacture_BG:SetShow(false)
  Manufacture_Show(nil, CppEnums.ItemWhereType.eInventory, true)
end
function Note_On(itemKey)
  ProductNote_Item_ShowToggle(itemKey)
  Panel_Invertory_Manufacture_BG:SetShow(false)
end
function HandleClickedWayPoint(slotNo)
  local selfProxy = getSelfPlayer():get()
  if nil == selfProxy then
    return
  end
  local inventory = selfProxy:getInventory()
  if not inventory:empty(slotNo) then
    local itemWrapper = getInventoryItem(slotNo)
    if nil == itemWrapper then
      return
    end
    local itemSSW = itemWrapper:getStaticStatus()
    if nil == itemSSW then
      return
    end
    FindExchangeItemNPC(itemSSW)
  end
end
function FindExchangeItemNPC(itemSSW)
  local selfProxy = getSelfPlayer():get()
  if nil == selfProxy then
    return
  end
  local selfPosition = float3(selfProxy:getPositionX(), selfProxy:getPositionY(), selfProxy:getPositionZ())
  local itemKey = itemSSW:get()._key:get()
  local npcPosition = {}
  local minIndex = 0
  local minDistance = 0
  ToClient_DeleteNaviGuideByGroup(0)
  local count = itemSSW:getExchangeItemNPCInfoListCount()
  for index = 0, count - 1 do
    local spawnData = npcByCharacterKey_getNpcInfo(itemSSW:getCharacterKeyByIdx(index), itemSSW:getDialogIndexByIdx(index))
    if nil ~= spawnData then
      local npcPos = spawnData:getPosition()
      npcPosition[index] = npcPos
      local distance = Util.Math.calculateDistance(selfPosition, npcPos)
      if 0 == index then
        minDistance = distance
      elseif distance < minDistance then
        minIndex = index
        minDistance = distance
      end
    end
  end
  for ii = 0, count - 1 do
    if ii ~= minIndex and nil ~= npcPosition[ii] then
      worldmapNavigatorStart(float3(npcPosition[ii].x, npcPosition[ii].y, npcPosition[ii].z), NavigationGuideParam(), false, false, true)
    end
  end
  if nil ~= npcPosition[minIndex] then
    worldmapNavigatorStart(float3(npcPosition[minIndex].x, npcPosition[minIndex].y, npcPosition[minIndex].z), NavigationGuideParam(), false, false, true)
  end
  audioPostEvent_SystemUi(0, 14)
  selfProxy:setCurrentFindExchangeItemEnchantKey(itemKey)
end
function HandleClickedWidget(slotNo)
  local inventoryType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  local itemSSW = itemWrapper:getStaticStatus()
  whereUseItemSlotNo = slotNo
  whereUseItemSSW = itemSSW
  FGlobal_WhereUseITemDirectionOpen(itemSSW, slotNo)
end
PaGlobal_Inventory = {_itemKeyForTutorial = nil, _isItemSlotRClickedForTutorial = false}
function PaGlobal_Inventory:addSlotEffectForTutorial(slot, effectString, isLoop, posX, posY)
  slot.icon:AddEffect(effectString, isLoop, posX, posY)
  PaGlobal_TutorialUiManager:getUiMasking():showInventoryMasking(slot.icon:GetPosX(), slot.icon:GetPosY())
end
function PaGlobal_Inventory:setItemKeyForTutorial(itemKey)
  self._itemKeyForTutorial = itemKey
end
function PaGlobal_Inventory:clearItemKeyForTutorial(itemKey)
  self._itemKeyForTutorial = nil
end
function PaGlobal_Inventory:isItemSlotRClickedForTutorial()
  return self._isItemSlotRClickedForTutorial
end
function PaGlobal_Inventory:setIsitemSlotRClickedForTutorial(bool)
  PaGlobal_Inventory._isItemSlotRClickedForTutorial = bool
end
function PaGlobal_Inventory:findItemWrapper(itemWhereType, targetItemKey, targetEnchantLevel)
  local inventory = getSelfPlayer():get():getInventoryByType(itemWhereType)
  if nil == inventory then
    return false
  end
  local invenMaxSize = inventory:sizeXXX()
  for ii = 0, invenMaxSize - 1 do
    local itemWrapper = getInventoryItem(ii)
    if nil ~= itemWrapper then
      local itemKey = itemWrapper:get():getKey():getItemKey()
      local enchantLevel = itemWrapper:get():getKey():getEnchantLevel()
      if itemKey == targetItemKey then
        if nil == targetEnchantLevel then
          return itemWrapper
        elseif nil ~= targetEnchantLevel and enchantLevel == targetEnchantLevel then
          return itemWrapper
        end
      end
    end
  end
  return nil
end
function FGlobal_UpdateInventorySlotData()
  InventoryInfo:updateInventory()
end
function Servant_GetActorKeyFromItemToolTip()
  PaGlobalFunc_InventoryInfo_GetServantActorKey()
end
function PaGlobalFunc_InventoryInfo_GetServantActorKey()
  return InventoryInfo._servantActorKeyRaw[1]
end
function FGlobal_AlchemyStonCheck()
  local itemWrapper = ToClient_getEquipmentItem(27)
  local coolTime = 0
  if nil ~= itemWrapper and InventoryInfo._ui.chk_autoActive:IsCheck() then
    local alchemyStoneType = itemWrapper:getStaticStatus():get()._contentsEventParam1
    if 0 == alchemyStoneType or 3 == alchemyStoneType then
      coolTime = 302
    elseif 1 == alchemyStoneType or 4 == alchemyStoneType then
      coolTime = 302
    elseif 2 == alchemyStoneType or 5 == alchemyStoneType then
      coolTime = 602
    elseif 6 == alchemyStoneType then
      coolTime = 302
    end
  end
  return coolTime
end
function Inventory_PosSaveMemory()
end
function Inventory_PosLoadMemory()
end
function Inventory_SetIgnoreMoneyButton()
end
function inventory_FlushRestoreFunc()
end
function EquipmentWindow_Close()
end
function Equipment_PosSaveMemory()
end
function Equipment_PosLoadMemory()
end
function Inventory_DropEscape()
end
function InventoryInfo:slotNoIsCostume(slotIndex)
  for ii = 1, #self._costumeSlotNo do
    if slotIndex == self._costumeSlotNo[ii] then
      return true
    end
  end
  return false
end
function InventoryInfo:getIndexFromEquipSlotNo(slotIndex)
  for ii = 1, #self._equipSlotNo do
    if slotIndex == self._equipSlotNo[ii] then
      return ii
    end
  end
  UI.ASSERT(false, "index " .. slotIndex .. " is not found at _equipSlotNo")
  return nil
end
function InventoryInfo:getIndexFromCostumeSlotNo(slotIndex)
  for ii = 1, #self._costumeSlotNo do
    if slotIndex == self._costumeSlotNo[ii] then
      return ii
    end
  end
  UI.ASSERT(false, "index " .. slotIndex .. " is not found at _costumeSlotNo")
  return nil
end
function InventoryInfo:getNearbyServantsActorKeys()
  local keys = {}
  for ii = 1, CppEnums.ServantType.Type_Count do
    if servant_checkDistance(ii - 1) then
      local vehicle = getTemporaryInformationWrapper():getUnsealVehicle(ii - 1)
      if nil ~= vehicle and 0 < vehicle:getInventory():size() and vehicle:getVehicleType() ~= CppEnums.VehicleType.Type_CampingTent then
        keys[#keys + 1] = vehicle:getActorKeyRaw()
      end
    end
  end
  return keys
end
function InventoryInfo:extendedSlotInfo(itemWrapper, slotNo)
  local itemSSW = itemWrapper:getStaticStatus()
  local slotNoMax = itemSSW:getExtendedSlotCount()
  local ret = false
  for i = 1, slotNoMax do
    local extendSlotNo = itemSSW:getExtendedSlotIndex(i - 1)
    if slotNoMax ~= extendSlotNo then
      self._extendedSlotArray[extendSlotNo] = slotNo
      ret = true
    end
  end
  return ret
end
function InventoryInfo:setItemInfoUseWrapper(slot, itemWrapper, isMono, isExtended, slotNo)
  slot:setItem(itemWrapper, slotNo, true)
  local itemSSW = itemWrapper:getStaticStatus()
  local enchantCount = itemSSW:get()._key:getEnchantLevel()
  if enchantCount > 0 and enchantCount < 16 and false == isExtended then
    slot.enchantText:SetText("+" .. tostring(enchantCount))
    slot.enchantText:SetShow(true)
  elseif 16 == enchantCount and false == isExtended then
    slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
    slot.enchantText:SetShow(true)
  elseif 17 == enchantCount and false == isExtended then
    slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
    slot.enchantText:SetShow(true)
  elseif 18 == enchantCount and false == isExtended then
    slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
    slot.enchantText:SetShow(true)
  elseif 19 == enchantCount and false == isExtended then
    slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
    slot.enchantText:SetShow(true)
  elseif 20 == enchantCount and false == isExtended then
    slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
    slot.enchantText:SetShow(true)
  else
    slot.enchantText:SetShow(false)
  end
  if itemSSW:get():isCash() then
    slot.enchantText:SetShow(false)
  end
  if CppEnums.ItemClassifyType.eItemClassify_Accessory == itemWrapper:getStaticStatus():getItemClassify() then
    if 1 == enchantCount and false == isExtended then
      slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
      slot.enchantText:SetShow(true)
    elseif 2 == enchantCount and false == isExtended then
      slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
      slot.enchantText:SetShow(true)
    elseif 3 == enchantCount and false == isExtended then
      slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
      slot.enchantText:SetShow(true)
    elseif 4 == enchantCount and false == isExtended then
      slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
      slot.enchantText:SetShow(true)
    elseif 5 == enchantCount and false == isExtended then
      slot.enchantText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
      slot.enchantText:SetShow(true)
    end
  end
  if false == isExtended then
    slot.icon:SetEnable(true)
  else
    slot.icon:SetEnable(false)
  end
  if true == isMono then
    slot.icon:SetMonoTone(true)
    slot.enchantText:SetMonoTone(true)
  elseif false == isMono then
    slot.icon:SetMonoTone(false)
    slot.enchantText:SetMonoTone(false)
  end
end
