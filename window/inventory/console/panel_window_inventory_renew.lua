local _panel = Panel_Window_Inventory
local _isInitialized = false
local UPPER_TAB_TYPE = {
  UNDEFINED = 0,
  EQUIPMENT_TAB = 1,
  COSTUME_TAB = 2,
  INFORMATION_TAB = 3,
  SERVANT_TAB = 4,
  AUXILIARY_TAB = 5
}
local LOWER_TAB_TYPE = {
  UNDEFINED = 0,
  INVENTORY_TAB = 1,
  CASH_INVEN_TAB = 2
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
    slot_equips = nil,
    stc_equipBG = nil,
    txt_attackText = nil,
    txt_awakenAttackText = nil,
    txt_defenceText = nil,
    txt_attackValue = nil,
    txt_awakenAttackValue = nil,
    txt_defenceValue = nil,
    chk_autoActive = nil,
    slot_costumes = nil,
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
    stc_equipSlotBG = {},
    slot_equips = {},
    stc_costumeSlotBG = {},
    slot_costumes = {},
    potencialBars = {},
    stc_servantInvenSlotBG = {},
    slot_servantInven = {},
    stc_servantEquipSlotBG = {},
    slot_servantEquip = {},
    stc_servantCostumeSlotBG = {},
    slot_servantCostume = {},
    stc_keyGuide = UI.getChildControl(_panel, "Static_Key_Guide"),
    txt_keyGuideA = nil,
    txt_keyGuideA2 = nil,
    txt_keyGuideX = nil,
    txt_keyGuideY = nil,
    txt_keyGuideB = nil,
    txt_keyGuideDPad = nil,
    stc_keyGuideSetFunctor = UI.getChildControl(_panel, "Static_Key_Guide_SetFunctor"),
    txt_keyGuideSetFunctorAlterKey = nil,
    stc_slotBorder = UI.getChildControl(_panel, "Static_SlotBorder"),
    stc_snapEffect = UI.getChildControl(_panel, "Static_SnapHighlight"),
    ref_snapTarget = nil
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
  _newItemAtSlot = {},
  _servantInvenSlotMax = 80,
  _servantEquipSlotMax = 6,
  _defaultXGap = 54,
  _defaultYGap = 54,
  _weightDesignatorTarget = nil,
  _weightDesignatorIsAnimating = false,
  _servantActorKeyRaw = {},
  _tooltipWhereType = nil,
  _tooltipSlotNo = nil,
  _rClickFunc = nil,
  _filterFunc = nil,
  _multipleSelectEndFunc = nil,
  _multipleSelectEndButton = nil,
  _otherWindowOpenFunc = nil,
  _effect = nil,
  _currentUpperTab = 0,
  _currentLowerTab = 0,
  _slotRingIndex = 0,
  _slotEarringIndex = 0,
  _showAniIsPlaying = false,
  _showAniElapsed = 0,
  _showAniDuration = 0.3,
  _monitorItemCooltime = false,
  _extendedSlotArray = {},
  _multipleSelect = {
    [CppEnums.ItemWhereType.eInventory] = {},
    [CppEnums.ItemWhereType.eCashInventory] = {}
  },
  _puzzleCompleteSlot = nil,
  _snapEffectAniFlag = false,
  _sinCurveTheta = 0,
  _deleteWhereType = nil,
  _deleteSlotNo = nil,
  _deleteCount = nil
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
    tabImageUV = {
      {
        149,
        283,
        197,
        331
      },
      {
        149,
        332,
        197,
        380
      },
      {
        149,
        332,
        197,
        380
      }
    },
    weightIconPath = "renewal/ui_icon/console_icon_00.dds",
    weightIconUV = {
      1,
      194,
      36,
      221
    },
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
    moveItemToType = CppEnums.MoveItemToType.Type_Vehicle,
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
    tabImageUV = {
      {
        2,
        64,
        44,
        106
      },
      {
        2,
        20,
        44,
        62
      },
      {
        2,
        20,
        44,
        62
      }
    },
    weightIconPath = "renewal/ui_icon/console_icon_01.dds",
    weightIconUV = {
      62,
      221,
      97,
      248
    },
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
    moveItemToType = CppEnums.MoveItemToType.Type_Vehicle,
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
    tabImageUV = {
      {
        266,
        152,
        308,
        194
      },
      {
        266,
        108,
        308,
        150
      },
      {
        266,
        108,
        308,
        150
      }
    },
    weightIconPath = "renewal/ui_icon/console_icon_01.dds",
    weightIconUV = {
      62,
      193,
      97,
      220
    },
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
    moveItemToType = CppEnums.MoveItemToType.Type_Ship,
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
    tabImageUV = {
      {
        266,
        152,
        308,
        194
      },
      {
        266,
        108,
        308,
        150
      },
      {
        266,
        108,
        308,
        150
      }
    },
    weightIconPath = "renewal/ui_icon/console_icon_01.dds",
    weightIconUV = {
      62,
      193,
      97,
      220
    },
    equipSlotNoList = {
      4,
      5,
      6,
      25
    },
    costumeSlotNoList = {
      15,
      16,
      14,
      26
    },
    moveItemToType = CppEnums.MoveItemToType.Type_Ship,
    pictogramUV = {
      [4] = {
        1,
        216,
        43,
        258
      },
      [5] = {
        1,
        302,
        43,
        344
      },
      [6] = {
        87,
        216,
        129,
        258
      },
      [25] = {
        1,
        259,
        43,
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
      [14] = {
        130,
        259,
        172,
        301
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
local _lowerTabData = {
  [LOWER_TAB_TYPE.INVENTORY_TAB] = {
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_RENEW_INVENTORY"),
    whereType = WHERE_TYPE.INVENTORY
  },
  [LOWER_TAB_TYPE.CASH_INVEN_TAB] = {
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_RENEW_PEARLINVEN"),
    whereType = WHERE_TYPE.CASH_INVEN
  }
}
local _equipSlotNo = {
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
}
local _costumeSlotNo = {
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
}
local KEY_GUIDE_TYPE = {
  A = 1,
  A_HOLD = 2,
  X = 3,
  Y = 4,
  B = 5,
  D_PAD = 6
}
local _keyGuideData = {
  ["InventoryInfo_InvenSlotBG_"] = {
    [KEY_GUIDE_TYPE.A] = "Select",
    [KEY_GUIDE_TYPE.A_HOLD] = "(Hold to) Move",
    [KEY_GUIDE_TYPE.X] = "Arranged",
    [KEY_GUIDE_TYPE.Y] = "Delete",
    [KEY_GUIDE_TYPE.B] = "Exit",
    [KEY_GUIDE_TYPE.D_PAD] = "Navigate"
  },
  ["InventoryInfo_EquipSlotBG_"] = {
    [KEY_GUIDE_TYPE.A] = "Take Off",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = ""
  },
  ["InventoryInfo_CostumeSlotBG_"] = {
    [KEY_GUIDE_TYPE.A] = "Take Off",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = "Visibility"
  },
  ["InventoryInfo_ServantInvenSlotBG_"] = {
    [KEY_GUIDE_TYPE.A] = "Move",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = ""
  },
  ["InventoryInfo_ServantEquipSlotBG_"] = {
    [KEY_GUIDE_TYPE.A] = "Take Off",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = "Visibility"
  },
  ["InventoryInfo_ServantCostumeSlotBG_"] = {
    [KEY_GUIDE_TYPE.A] = "Take Off",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = "Visibility"
  },
  ["CheckButton_ToggleHelmet"] = {
    [KEY_GUIDE_TYPE.A] = "Visibility",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = ""
  },
  ["CheckButton_ToggleHelmetOpen"] = {
    [KEY_GUIDE_TYPE.A] = "Visibility",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = ""
  },
  ["CheckButton_ToggleUnderwear"] = {
    [KEY_GUIDE_TYPE.A] = "Visibility",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = ""
  },
  ["CheckButton_ToggleCloak"] = {
    [KEY_GUIDE_TYPE.A] = "Visibility",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = ""
  },
  ["CheckButton_ToggleShowNameWhenCamouflage"] = {
    [KEY_GUIDE_TYPE.A] = "Visibility",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.Y] = ""
  },
  [UPPER_TAB_TYPE.INFORMATION_TAB] = {
    [KEY_GUIDE_TYPE.A] = "",
    [KEY_GUIDE_TYPE.A_HOLD] = "",
    [KEY_GUIDE_TYPE.X] = "",
    [KEY_GUIDE_TYPE.Y] = "",
    [KEY_GUIDE_TYPE.D_PAD] = ""
  }
}
local _configForInven = {
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
}
local _configForEquip = {
  createIcon = true,
  createBorder = true,
  createCount = false,
  createCash = true,
  createEnchant = true,
  createEnduranceIcon = true,
  createItemLock = true
}
local _configForCostume = {
  createIcon = true,
  createBorder = true,
  createCount = false,
  createCash = true,
  createEnchant = true,
  createEnduranceIcon = true,
  createItemLock = true
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
  self._ui.txt_keyGuideA = UI.getChildControl(self._ui.stc_keyGuide, "StaticText_KeyGuideA")
  self._ui.txt_keyGuideA2 = UI.getChildControl(self._ui.stc_keyGuide, "StaticText_KeyGuideA2")
  self._ui.txt_keyGuideX = UI.getChildControl(self._ui.stc_keyGuide, "StaticText_KeyGuideX")
  self._ui.txt_keyGuideY = UI.getChildControl(self._ui.stc_keyGuide, "StaticText_KeyGuideY")
  self._ui.txt_keyGuideB = UI.getChildControl(self._ui.stc_keyGuide, "StaticText_KeyGuideB")
  self._ui.txt_keyGuideDPad = UI.getChildControl(self._ui.stc_keyGuide, "StaticText_KeyGuideDPad")
  self._keyGuideList = {
    [1] = self._ui.txt_keyGuideA,
    [2] = self._ui.txt_keyGuideA2,
    [3] = self._ui.txt_keyGuideX,
    [4] = self._ui.txt_keyGuideY,
    [5] = self._ui.txt_keyGuideB,
    [6] = self._ui.txt_keyGuideDPad
  }
  self._ui.txt_keyGuideB:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GENERIC_KEYGUIDE_XBOX_EXIT"))
  self._ui.txt_keyGuideSetFunctorAlterKey = UI.getChildControl(self._ui.stc_keyGuideSetFunctor, "StaticText_KeyGuideAlter")
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
  self._ui.stc_equipSlotBG = {}
  self._ui.equipSlotTemplate = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT_TAB], "Static_EquipSlotTemplate")
  local xSize, ySize = 55, 54
  local startX, startY = self._ui.equipSlotTemplate:GetPosX(), self._ui.equipSlotTemplate:GetPosY()
  local columnMax = 6
  local slotPos = {}
  if nil == self._ui.stc_equipBG then
    self._ui.stc_equipBG = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT_TAB], "Static_EquipBG")
  end
  for ii = 1, 32 do
    if nil ~= _equipSlotNo[ii] then
      slotPos[ii] = UI.getChildControl(self._ui.stc_equipBG, "Static_Slot_" .. _equipSlotNo[ii])
      if nil ~= slotPos[ii] then
        slotPos[ii]:SetShow(false)
      end
    end
  end
  local lanternSlot = UI.getChildControl(self._ui.stc_equipBG, "Static_Slot_13")
  lanternSlot:SetShow(false)
  for ii = 1, #_equipSlotNo do
    self._ui.stc_equipSlotBG[ii] = UI.cloneControl(self._ui.equipSlotTemplate, self._ui.stc_equipBG, "InventoryInfo_EquipSlotBG_" .. ii)
    local slotBG = self._ui.stc_equipSlotBG[ii]
    local slotIndex = _equipSlotNo[ii]
    if 13 == slotIndex then
      slotBG:SetPosX(startX + (ii - 1) % columnMax * xSize + self._defaultXGap)
    else
      slotBG:SetPosX(startX + (ii - 1) % columnMax * xSize)
    end
    slotBG:SetPosY(startY + math.floor((ii - 1) / columnMax) * ySize)
    local pictogram = UI.getChildControl(slotBG, "Static_ItemPictogram")
    if nil ~= _equipSlotNo[ii] then
      local x1, y1, x2, y2 = setTextureUV_Func(pictogram, _equipPictogramUV[_equipSlotNo[ii]][1], _equipPictogramUV[_equipSlotNo[ii]][2], _equipPictogramUV[_equipSlotNo[ii]][3], _equipPictogramUV[_equipSlotNo[ii]][4])
      pictogram:getBaseTexture():setUV(x1, y1, x2, y2)
      pictogram:setRenderTexture(pictogram:getBaseTexture())
      self._ui.slot_equips[ii] = {}
      local slot = self._ui.slot_equips[ii]
      SlotItem.new(slot, "equipSlot_" .. ii, ii, slotBG, _configForEquip)
      slot.equipSlotNoList = _equipSlotNo[ii]
      slot.pictogram = pictogram
      slot:createChild()
      if ToClient_isXBox() or ToClient_IsDevelopment() then
        slotBG:registerPadEvent(__eConsoleUIPadEvent_Up_A, "InputMRUp_InventoryInfo_EquipSlot(" .. _equipSlotNo[ii] .. ")")
      else
        slot.icon:addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_EquipSlot(" .. _equipSlotNo[ii] .. ")")
        slot.icon:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_EquipSlot(" .. _equipSlotNo[ii] .. ")")
      end
      slot.icon:addInputEvent("Mouse_On", "InputMOn_InventoryInfo_equipShowTooltip(" .. _equipSlotNo[ii] .. ", true)")
      slot.icon:addInputEvent("Mouse_Out", "InputMOn_InventoryInfo_equipShowTooltip(" .. _equipSlotNo[ii] .. ", false)")
      Panel_Tooltip_Item_SetPosition(_equipSlotNo[ii], slot, "equipment")
    end
  end
  self._ui.equipSlotTemplate:SetShow(false)
  self._ui.txt_attackValue = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT_TAB], "StaticText_AttackPowerValue")
  self._ui.txt_awakenAttackValue = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT_TAB], "StaticText_AwakenAttackPowerValue")
  self._ui.txt_defenceValue = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT_TAB], "StaticText_DefencePowerValue")
  self._ui.txt_attackText = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT_TAB], "StaticText_AttackPower")
  self._ui.txt_awakenAttackText = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT_TAB], "StaticText_AwakenAttackPower")
  self._ui.txt_defenceText = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT_TAB], "StaticText_DefencePower")
  self._ui.chk_autoActive = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.EQUIPMENT_TAB], "CheckButton_AutoActive")
  self._ui.chk_autoActive:addInputEvent("Mouse_LUp", "Input_InventoryInfo_AutoActive()")
end
function InventoryInfo:initCostumeUIControls()
  self._ui.stc_costumeSlotBG = {}
  self._ui.costumeSlotTemplate = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME_TAB], "Static_CostumeSlotTemplate")
  local xSize, ySize = 55, 54
  local startX, startY = self._ui.costumeSlotTemplate:GetPosX(), self._ui.costumeSlotTemplate:GetPosY()
  local columnMax = 4
  for ii = 1, #_costumeSlotNo do
    self._ui.stc_costumeSlotBG[ii] = UI.cloneControl(self._ui.costumeSlotTemplate, self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME_TAB], "InventoryInfo_CostumeSlotBG_" .. ii)
    local slotBG = self._ui.stc_costumeSlotBG[ii]
    slotBG:SetPosX(startX + (ii - 1) % columnMax * xSize)
    slotBG:SetPosY(startY + math.floor((ii - 1) / columnMax) * ySize)
    local pictogram = UI.getChildControl(slotBG, "Static_ItemPictogram")
    local x1, y1, x2, y2 = setTextureUV_Func(pictogram, _equipPictogramUV[_costumeSlotNo[ii]][1], _equipPictogramUV[_costumeSlotNo[ii]][2], _equipPictogramUV[_costumeSlotNo[ii]][3], _equipPictogramUV[_costumeSlotNo[ii]][4])
    pictogram:getBaseTexture():setUV(x1, y1, x2, y2)
    pictogram:setRenderTexture(pictogram:getBaseTexture())
    local slot = {}
    SlotItem.new(slot, "costumeSlot_" .. ii, ii, slotBG, _configForCostume)
    slot.costumeSlotNoList = _costumeSlotNo[ii]
    slot:createChild()
    if ToClient_isXBox() or ToClient_IsDevelopment() then
      slotBG:registerPadEvent(__eConsoleUIPadEvent_Up_A, "InputMRUp_InventoryInfo_EquipSlot(" .. _costumeSlotNo[ii] .. ")")
    else
      slot.icon:addInputEvent("Mouse_RUp", "InputMRUp_InventoryInfo_EquipSlot(" .. _costumeSlotNo[ii] .. ")")
      slot.icon:addInputEvent("Mouse_LUp", "InputMLUp_InventoryInfo_EquipSlot(" .. _costumeSlotNo[ii] .. ")")
    end
    slot.icon:addInputEvent("Mouse_On", "InputMOn_InventoryInfo_equipShowTooltip(" .. _costumeSlotNo[ii] .. ", true)")
    slot.icon:addInputEvent("Mouse_Out", "InputMOn_InventoryInfo_equipShowTooltip(" .. _costumeSlotNo[ii] .. ", false)")
    slot.pictogram = pictogram
    slot.chk_toggleButton = UI.getChildControl(slotBG, "CheckButton_ShowToggle")
    slot.chk_toggleButton:addInputEvent("Mouse_LUp", "Input_InventoryInfo_CostumeShowToggle(" .. ii .. ")")
    slotBG:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "Input_InventoryInfo_CostumeShowToggle(" .. ii .. ")")
    slotBG:SetChildOrder(slot.icon:GetKey(), slot.chk_toggleButton:GetKey())
    Panel_Tooltip_Item_SetPosition(_costumeSlotNo[ii], slot, "equipment")
    self._ui.slot_costumes[ii] = slot
  end
  self._ui.costumeSlotTemplate:SetShow(false)
  self._ui.chk_HideHelmet = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME_TAB], "CheckButton_ToggleHelmet")
  self._ui.chk_openHelmet = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME_TAB], "CheckButton_ToggleHelmetOpen")
  self._ui.chk_showUnderwear = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME_TAB], "CheckButton_ToggleUnderwear")
  self._ui.chk_toggleCloak = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME_TAB], "CheckButton_ToggleCloak")
  self._ui.chk_toggleNameWhenCamo = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.COSTUME_TAB], "CheckButton_ToggleShowNameWhenCamouflage")
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
  self._ui.frame_characterInfo = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.INFORMATION_TAB], "Frame_CharacterInfo")
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
  self._ui.frame_setEffect = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.INFORMATION_TAB], "Frame_SetItemEffect")
  self._ui.stc_setEffectBG = UI.getChildControl(self._ui.frame_setEffect:GetFrameContent(), "Static_ContentBG")
  self._ui.setItemEffectTitleList = {}
  self._ui.setItemEffectValueList = {}
  self._setItemEffectTitleCount = 1
  self._setItemEffectValueCount = 1
  frameContent:SetSize(self._ui.frame_characterInfo:GetSizeX(), self._ui.frame_characterInfo:GetSizeY() - 10)
  self._ui.frame_characterInfo:UpdateContentPos()
  self._ui.frame_characterInfo:GetVScroll():SetControlTop()
  self._ui.frame_characterInfo:GetVScroll():SetShow(false)
  self._ui.stc_noSetEffect = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.INFORMATION_TAB], "StaticText_NoSetEffect")
end
function InventoryInfo:initServantUIControl()
  self._ui.frame_servantInven = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT_TAB], "Frame_ServantInven")
  local frameContent = self._ui.frame_servantInven:GetFrameContent()
  self._ui.stc_servantInfoBG = UI.getChildControl(frameContent, "Static_ContentBG")
  local progressBG = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT_TAB], "Static_ServantWeightProgressBG")
  self._ui.stc_contentBG = UI.getChildControl(frameContent, "Static_ContentBG")
  self._ui.txt_servantName = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT_TAB], "StaticText_ServantName")
  self._ui.progress2_servantWeight = UI.getChildControl(progressBG, "Progress2_ServantWeight")
  self._ui.txt_servantInvenCountDisplay = UI.getChildControl(progressBG, "StaticText_SlotCount")
  self._ui.txt_servantWeightValue = UI.getChildControl(progressBG, "StaticText_WeightValue")
  self._ui.stc_horseWeight = UI.getChildControl(progressBG, "Static_HorseWeight")
  self._ui.txt_servantEquipInfo = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT_TAB], "StaticText_ServantEquipSlot")
  self._ui.txt_servantCostumeInfo = UI.getChildControl(self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT_TAB], "StaticText_ServantCostumeSlot")
  self._ui.txt_noServant = UI.getChildControl(self._ui.stc_subWindowUpper, "StaticText_NoServant")
  self._ui.txt_noServant:SetText(PAGetString(Defines.StringSheet_GAME, "Lua_WindowTradeMarket_NotVehicleNear"))
  self._ui.servantInvenSlotTemplate = UI.getChildControl(frameContent, "Static_ServantSlotTemplate")
  self._ui.servantEquipSlotTemplate = UI.getChildControl(self._ui.txt_servantEquipInfo, "Static_EquipItemSlot_Template")
  self._ui.servantCostumeSlotTemplate = UI.getChildControl(self._ui.txt_servantCostumeInfo, "Static_CostumeItemSlot_Template")
  self._ui.servantInvenSlotTemplate:SetShow(false)
  self._ui.servantEquipSlotTemplate:SetShow(false)
  self._ui.servantCostumeSlotTemplate:SetShow(false)
  local slot = self._ui.slot_servantInven
  local slotBG = self._ui.stc_servantInvenSlotBG
  for ii = 1, self._servantInvenSlotMax do
    slotBG[ii] = UI.cloneControl(self._ui.servantInvenSlotTemplate, frameContent, "InventoryInfo_ServantInvenSlotBG_" .. ii)
    slot[ii] = {}
    SlotItem.new(slot[ii], "ServantInvenSlot_" .. ii, ii, slotBG[ii], _configForInven)
    slot[ii]:createChild()
    slotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_Up_A, "InputMRUp_InventoryInfo_ServantInvenSlot(" .. ii .. ")")
    slot[ii].icon:addInputEvent("Mouse_On", "Input_InventoryInfo_ServantInvenTooltip(" .. ii .. ", true)")
    slot[ii].icon:addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantInvenTooltip(" .. ii .. ", false)")
  end
  local slot_servantEquip = self._ui.slot_servantEquip
  local stc_servantEquipSlotBG = self._ui.stc_servantEquipSlotBG
  for ii = 1, self._servantEquipSlotMax do
    stc_servantEquipSlotBG[ii] = UI.cloneControl(self._ui.servantEquipSlotTemplate, self._ui.txt_servantEquipInfo, "InventoryInfo_ServantEquipSlotBG_" .. ii)
    stc_servantEquipSlotBG[ii]:SetPosX((ii - 1) * self._defaultXGap)
    slot_servantEquip[ii] = {}
    SlotItem.new(slot_servantEquip[ii], "ServantEquipSlot_" .. ii, ii, stc_servantEquipSlotBG[ii], _configForEquip)
    slot_servantEquip[ii]:createChild()
    stc_servantEquipSlotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_A, "InputMLUp_InventoryInfo_ServantEquipDropHandler()")
    stc_servantEquipSlotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_Up_A, "InputMRUp_InventoryInfo_ServantEquipSlot(true, " .. ii .. ")")
    stc_servantEquipSlotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "Input_InventoryInfo_ServantEquipToggle(true, " .. ii .. ")")
    slot_servantEquip[ii].icon:addInputEvent("Mouse_On", "Input_InventoryInfo_ServantEquipShowTooltip(true," .. ii .. ", true)")
    slot_servantEquip[ii].icon:addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantEquipShowTooltip(true," .. ii .. ", false)")
    slot_servantEquip[ii].pictogram = UI.getChildControl(stc_servantEquipSlotBG[ii], "Static_ItemPictogram")
    slot_servantEquip[ii].chk_toggleButton = UI.getChildControl(stc_servantEquipSlotBG[ii], "CheckButton_ShowToggle")
    stc_servantEquipSlotBG[ii]:SetChildOrder(slot_servantEquip[ii].icon:GetKey(), slot_servantEquip[ii].chk_toggleButton:GetKey())
  end
  local slot_servantCostume = self._ui.slot_servantCostume
  local stc_servantCostumeSlotBG = self._ui.stc_servantCostumeSlotBG
  for ii = 1, self._servantEquipSlotMax do
    stc_servantCostumeSlotBG[ii] = UI.cloneControl(self._ui.servantCostumeSlotTemplate, self._ui.txt_servantCostumeInfo, "InventoryInfo_ServantCostumeSlotBG_" .. ii)
    stc_servantCostumeSlotBG[ii]:SetPosX((ii - 1) * self._defaultXGap)
    slot_servantCostume[ii] = {}
    SlotItem.new(slot_servantCostume[ii], "ServantCostumeSlot_" .. ii, ii, stc_servantCostumeSlotBG[ii], _configForCostume)
    slot_servantCostume[ii]:createChild()
    stc_servantCostumeSlotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_A, "InputMLUp_InventoryInfo_ServantEquipDropHandler()")
    stc_servantCostumeSlotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_Up_A, "InputMRUp_InventoryInfo_ServantEquipSlot(false, " .. ii .. ")")
    stc_servantCostumeSlotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "Input_InventoryInfo_ServantEquipToggle(false, " .. ii .. ")")
    slot_servantCostume[ii].icon:addInputEvent("Mouse_On", "Input_InventoryInfo_ServantEquipShowTooltip(false," .. ii .. ", true)")
    slot_servantCostume[ii].icon:addInputEvent("Mouse_Out", "Input_InventoryInfo_ServantEquipShowTooltip(false," .. ii .. ", false)")
    slot_servantCostume[ii].pictogram = UI.getChildControl(stc_servantCostumeSlotBG[ii], "Static_ItemPictogram")
    slot_servantCostume[ii].chk_toggleButton = UI.getChildControl(stc_servantCostumeSlotBG[ii], "CheckButton_ShowToggle")
    stc_servantCostumeSlotBG[ii]:SetChildOrder(slot_servantCostume[ii].icon:GetKey(), slot_servantCostume[ii].chk_toggleButton:GetKey())
  end
end
function InventoryInfo:initInventory()
  self._ui.stc_invenSlotBG = {}
  self._newItemAtSlot = {}
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
    slotBG[ii] = UI.cloneControl(slotTemplate, self._ui.stc_invenBG, "InventoryInfo_InvenSlotBG_" .. ii)
    slotBG[ii]:SetPosX(startX + (ii - 1) % columnMax * xSize)
    slotBG[ii]:SetPosY(startY + math.floor((ii - 1) / columnMax) * ySize)
    slot[ii] = {}
    SlotItem.new(slot[ii], "InvenSlot_" .. ii, ii, slotBG[ii], _configForInven)
    slot[ii]:createChild()
    slot[ii].icon:addInputEvent("Mouse_On", "InputMOn_InventoryInfo_invenShowTooltip(" .. ii .. ")")
    slot[ii].icon:addInputEvent("Mouse_Out", "InputMOut_InventoryInfo_invenHideTooltip(" .. ii .. ")")
    slot[ii].icon:addInputEvent("Mouse_PressMove", "InputDrag_InventoryInfo_invenDrag(" .. ii .. ")")
    slot[ii].icon:SetEnableDragAndDrop(true)
    slotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_Y, "Input_InventoryInfo_ItemDelete(" .. ii .. ")")
    slotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_Up_A, "InputMRUp_InventoryInfo_InvenSlot(" .. ii .. ")")
    UIScroll.InputEventByControl(slotBG[ii], "InputScroll_InventoryInfo_Inventory")
    UIScroll.InputEventByControl(slot[ii].icon, "InputScroll_InventoryInfo_Inventory")
    slot[ii].icon:SetPosX(1)
    slot[ii].icon:SetPosY(1)
    slot[ii].icon:SetSize(44, 44)
    slot[ii].border:SetSize(44, 44)
    slot[ii].count:ComputePos()
    slot[ii].stc_multipleSelect = UI.getChildControl(slotBG[ii], "Static_MultipleSelect")
    slotBG[ii]:SetChildOrder(slot[ii].icon:GetKey(), slot[ii].stc_multipleSelect:GetKey())
    Panel_Tooltip_Item_SetPosition(ii, slot[ii], "inventory")
    self._ui.stc_lockedSlots[ii] = UI.createAndCopyBasePropertyControl(_panel, "Static_LockedSlot", slotBG[ii], "Static_LockedSlot_" .. ii)
    if ToClient_isXBox() or ToClient_IsDevelopment() then
      if ii <= columnMax then
        slotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "InputScroll_InventoryInfo_Inventory(true)")
      elseif ii > columnMax * (self._invenSlotRowMax - 1) then
        slotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "InputScroll_InventoryInfo_Inventory(false)")
      end
    end
  end
  slotTemplate:SetShow(false)
  self._ui.scroll_inven = UI.getChildControl(self._ui.stc_subWindowLower, "Scroll_Inventory")
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
  _panel:registerPadEvent(__eConsoleUIPadEvent_LB, "Toggle_InventoryTab_forPadEventFunc(-1)")
  _panel:registerPadEvent(__eConsoleUIPadEvent_RB, "Toggle_InventoryTab_forPadEventFunc(1)")
  _panel:registerPadEvent(__eConsoleUIPadEvent_Up_X, "Input_InventoryInfo_AutoSort()")
  self._ui.stc_xBoxKey_LB:addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetUpperTabLeft()")
  self._ui.stc_xBoxKey_RB:addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetUpperTabRight()")
  self._ui.stc_xBoxKey_LT:addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetLowerTabLeft()")
  self._ui.stc_xBoxKey_RT:addInputEvent("Mouse_LUp", "Input_InventoryInfo_SetLowerTabRight()")
end
function InventoryInfo:registMessageHandler()
  _panel:RegisterShowEventFunc(true, "PaGlobalFunc_InventoryInfo_ShowAni()")
  _panel:RegisterShowEventFunc(false, "PaGlobalFunc_InventoryInfo_HideAni()")
  _panel:RegisterUpdateFunc("PaGlobalFunc_Window_InventoryInfo_PerFrameUpdate")
  registerEvent("FromClient_PadSnapChangeTarget", "FromClient_InventoryInfo_PadSnapChangeTarget")
  registerEvent("progressEventCancelByAttacked", "PaGlobalFunc_InventoryInfo_Close")
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
  registerEvent("EventSelfServantUpdate", "PaGlobalFunc_InventoryInfo_UpdateServantTab")
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
  self:setServantTabPictogram()
  _panel:SetShow(true, false)
  if _ContentsGroup_RenewUI_Chatting then
    PaGlobalFunc_ChattingInfo_Close()
  end
  self._ui.stc_keyGuideSetFunctor:SetShow(false)
  if Defines.UIMode.eUIMode_Default == GetUIMode() then
    if _ContentsGroup_RenewUI_Quest and true == PaGlobalFunc_Quest_GetShow() then
      PaGlobalFunc_Quest_Close()
    else
      FGlobal_Panel_Radar_Show(false, false)
      Panel_TimeBar:SetShow(false, false)
      FGlobal_QuestWidget_Close()
    end
  end
  if nil ~= openType then
    self._ui.rdo_tabButtons[openType]:SetCheck(true)
    self:setTabTo(openType)
  else
    self._ui.rdo_tabButtons[UPPER_TAB_TYPE.EQUIPMENT_TAB]:SetCheck(true)
    self:setTabTo(UPPER_TAB_TYPE.EQUIPMENT_TAB)
  end
  self:initMultipleSelect()
  self:updateInventory()
  self:updateWeight()
  self._monitorItemCooltime = true
end
function PaGlobalFunc_InventoryInfo_Close()
  InventoryInfo:close()
end
function InventoryInfo:close()
  Panel_Tooltip_Item_hideTooltip()
  TooltipSimple_Hide()
  if nil ~= self._otherWindowOpenFunc then
    local callFunc = self._otherWindowOpenFunc
    self._otherWindowOpenFunc = nil
    callFunc()
  end
  Inventory_SetFunctor(nil, nil, nil, nil)
  _panel:SetShow(false, false)
  if Defines.UIMode.eUIMode_Default == GetUIMode() and _ContentsGroup_RenewUI_Quest and false == PaGlobalFunc_Quest_GetShow() then
    FGlobal_Panel_Radar_Show(true, false)
    Panel_TimeBar:SetShow(true, false)
    FGlobal_QuestWidget_Open()
  end
  if DragManager:isDragging() then
    DragManager:clearInfo()
  end
  PaGlobalFunc_MultiButtonPopup_Close()
  if true == _ContentsGroup_RenewUI_Tutorial then
    PaGlobal_TutorialManager:handleClosedInventory()
  end
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
  Panel_Tooltip_Item_hideTooltip()
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
  Panel_Tooltip_Item_hideTooltip()
  TooltipSimple_Hide()
  if tab == UPPER_TAB_TYPE.EQUIPMENT_TAB then
    self:updateEquipment()
  elseif tab == UPPER_TAB_TYPE.COSTUME_TAB then
    self:updateCostume()
  elseif tab == UPPER_TAB_TYPE.INFORMATION_TAB then
    self:updateInformation()
  elseif tab == UPPER_TAB_TYPE.SERVANT_TAB then
    self:updateServant()
  end
end
function InventoryInfo:updateEquipment()
  if not _isInitialized or not _panel:GetShow() then
    return
  end
  self._extendedSlotArray = {}
  for ii = 1, #_equipSlotNo do
    local slot = self._ui.slot_equips[ii]
    local slotIndex = _equipSlotNo[ii]
    local itemWrapper = ToClient_getEquipmentItem(slotIndex)
    if nil ~= itemWrapper then
      self:extendedSlotInfo(itemWrapper, slotIndex)
      slot:setItem(itemWrapper, slotIndex, true)
      slot.pictogram:SetShow(false)
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
      slot = self._ui.slot_equips[index]
      if nil ~= slot then
        self._ui.slot_equips[index].pictogram:SetShow(false)
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
  for ii = 1, #_costumeSlotNo do
    local slotIndex = _costumeSlotNo[ii]
    local slot = self._ui.slot_costumes[ii]
    local isShow = true
    local itemWrapper = ToClient_getEquipmentItem(slotIndex)
    if nil ~= itemWrapper then
      self:extendedSlotInfo(itemWrapper, slotIndex)
      slot:setItem(itemWrapper, slotIndex, true)
      isShow = ToClient_IsSetAvatarEquipSlotFlag(_avatarCheckFlag[slotIndex])
      slot.pictogram:SetShow(false)
      slot.icon:SetEnable(true)
      slot.icon:SetMonoTone(false)
      slot.enchantText:SetMonoTone(false)
      slot.chk_toggleButton:SetShow(true)
    else
      slot:clearItem()
      slot.pictogram:SetShow(true)
      slot.chk_toggleButton:SetShow(false)
    end
    slot.chk_toggleButton:SetCheck(isShow)
  end
  self:checkUnderwearState()
  for childSlot, parentSlot in pairs(self._extendedSlotArray) do
    local itemWrapper = ToClient_getEquipmentItem(parentSlot)
    local index = self:getIndexFromCostumeSlotNo(childSlot)
    if nil ~= index then
      slot = self._ui.slot_costumes[index]
      if nil ~= slot then
        self._ui.slot_costumes[index].pictogram:SetShow(false)
        self:setItemInfoUseWrapper(slot, itemWrapper, true, true)
      end
    end
  end
  if primWeaponIsFishingRod then
    local fishingRodWrapper = ToClient_getEquipmentItem(0)
    local index = self:getIndexFromCostumeSlotNo(18)
    self._ui.slot_costumes[index].pictogram:SetShow(false)
    self:setItemInfoUseWrapper(self._ui.slot_costumes[index], fishingRodWrapper, true, true)
    index = self:getIndexFromCostumeSlotNo(19)
    self._ui.slot_costumes[index].pictogram:SetShow(false)
    self:setItemInfoUseWrapper(self._ui.slot_costumes[index], fishingRodWrapper, true, true)
  end
end
function InventoryInfo:checkUnderwearState()
  local equippedUnderwearWrapper = ToClient_getEquipmentItem(20)
  if nil ~= equippedUnderwearWrapper then
    self._ui.chk_showUnderwear:SetCheck(getSelfPlayer():get():getUnderwearModeInhouse())
    self._ui.chk_showUnderwear:SetEnable(true)
    self._ui.chk_showUnderwear:SetMonoTone(false)
    self._ui.slot_costumes[self:getIndexFromCostumeSlotNo(20)].chk_toggleButton:SetCheck(ToClient_IsSetAvatarEquipSlotFlag(_avatarCheckFlag[20]))
  else
    if getSelfPlayer():get():getUnderwearModeInhouse() then
      getSelfPlayer():get():setUnderwearModeInhouse(false)
      Toclient_setShowAvatarEquip()
    end
    self._ui.chk_showUnderwear:SetCheck(false)
    self._ui.chk_showUnderwear:SetEnable(false)
    self._ui.chk_showUnderwear:SetMonoTone(true)
    self._ui.slot_costumes[self:getIndexFromCostumeSlotNo(20)].chk_toggleButton:SetCheck(true)
  end
end
function InventoryInfo:updateInformation()
  if not _isInitialized then
    return
  end
  if UPPER_TAB_TYPE.INFORMATION_TAB ~= self._currentUpperTab then
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
      self._ui.txt_fitnessSubtitles[ii]:SetText(self._ui.txt_fitnessSubtitles[ii]:GetText() .. " " .. tostring(ToClient_GetFitnessLevelStatus(ii - 1) / 10000))
    else
      self._ui.txt_fitnessSubtitles[ii]:SetText(self._ui.txt_fitnessSubtitles[ii]:GetText() .. " " .. tostring(ToClient_GetFitnessLevelStatus(ii - 1)))
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
  if content:GetSizeY() > self._ui.frame_setEffect:GetSizeY() then
    self._ui.frame_setEffect:GetVScroll():SetShow(true)
    self._ui.frame_setEffect:UpdateContentScroll()
    self._ui.frame_setEffect:GetVScroll():SetControlPos(0)
    self._ui.frame_setEffect:UpdateContentPos()
  else
    self._ui.frame_setEffect:GetVScroll():SetShow(false)
  end
end
function PaGlobalFunc_InventoryInfo_UpdateServantTab()
  InventoryInfo:updateServant()
end
function InventoryInfo:setServantTabPictogram()
  self._servantActorKeyRaw = self:getNearbyServantsActorKeys()
  if nil == self._servantActorKeyRaw then
    return nil
  end
  if #self._servantActorKeyRaw > 0 then
    local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
    if nil == servantWrapper then
      self._servantActorKeyRaw = {}
    end
    local vehicleType = servantWrapper:getVehicleType()
    local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
    local control = self._ui.rdo_tabButtons[UPPER_TAB_TYPE.SERVANT_TAB]
    control:ChangeTextureInfoName("renewal/button/console_tapbtn_00.dds")
    do
      local x1, y1, x2, y2 = setTextureUV_Func(control, _servantData[dataType].tabImageUV[1][1], _servantData[dataType].tabImageUV[1][2], _servantData[dataType].tabImageUV[1][3], _servantData[dataType].tabImageUV[1][4])
      control:getBaseTexture():setUV(x1, y1, x2, y2)
      control:setRenderTexture(control:getBaseTexture())
    end
    do
      local x1, y1, x2, y2 = setTextureUV_Func(control, _servantData[dataType].tabImageUV[2][1], _servantData[dataType].tabImageUV[2][2], _servantData[dataType].tabImageUV[2][3], _servantData[dataType].tabImageUV[2][4])
      control:getOnTexture():setUV(x1, y1, x2, y2)
    end
    local x1, y1, x2, y2 = setTextureUV_Func(control, _servantData[dataType].tabImageUV[3][1], _servantData[dataType].tabImageUV[3][2], _servantData[dataType].tabImageUV[3][3], _servantData[dataType].tabImageUV[3][4])
    control:getClickTexture():setUV(x1, y1, x2, y2)
  end
  return self._servantActorKeyRaw
end
function InventoryInfo:updateServant()
  if not _isInitialized or not _panel:GetShow() then
    return
  end
  if UPPER_TAB_TYPE.SERVANT_TAB ~= InventoryInfo._currentUpperTab then
    return
  end
  local actorKeysRaw = self:getNearbyServantsActorKeys()
  if #actorKeysRaw > 0 then
    self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT_TAB]:SetShow(true)
    self._ui.txt_noServant:SetShow(false)
    self:updateServantInven(actorKeysRaw[1])
    self._servantActorKeyRaw = actorKeysRaw
  else
    self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT_TAB]:SetShow(false)
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
    return
  end
  local vehicleActorWrapper = getVehicleActor(actorKeyRaw)
  if nil == vehicleActorWrapper then
    return
  end
  local vehicleActor = vehicleActorWrapper:get()
  if nil == vehicleActor then
    return
  end
  local vehicleInven = vehicleActor:getInventory()
  if nil == vehicleInven then
    return
  end
  local s64_weightMax = vehicleActor:getPossessableWeight_s64()
  local s64_weightAll = vehicleActor:getCurrentWeight_s64()
  local s64_weightMax_div = s64_weightMax / Defines.s64_const.s64_100
  local s64_weightAll_div = s64_weightAll / Defines.s64_const.s64_100
  self._ui.progress2_servantWeight:SetProgressRate(Int64toInt32(s64_weightAll / s64_weightMax_div))
  local allWeight = string.format("%.1f", Int64toInt32(s64_weightAll_div) / 100)
  local maxWeight = string.format("%.0f", Int64toInt32(s64_weightMax_div) / 100)
  self._ui.txt_servantWeightValue:SetText(allWeight .. " /" .. maxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  local fullCount = vehicleInven:size() - __eTInventorySlotNoUseStart
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
    local slot = self._ui.slot_servantInven[ii]
    slotBG:SetPosX(startX + (ii - 1) % columnMax * self._defaultXGap)
    slotBG:SetPosY(startY + math.floor((ii - 1) / columnMax) * self._defaultYGap)
    slotBG:SetShow(true)
    local itemWrapper = getServantInventoryItemBySlotNo(actorKeyRaw, ii - 1 + __eTInventorySlotNoUseStart)
    if nil ~= itemWrapper then
      slot:setItem(itemWrapper)
    else
      slot:clearItem()
    end
  end
  local rowCount = math.ceil(fullCount / columnMax)
  local lastSlot = self._ui.stc_servantInvenSlotBG[fullCount]
  self._ui.stc_contentBG:SetSize(self._ui.stc_contentBG:GetSizeX(), lastSlot:GetSizeY() + lastSlot:GetPosY())
  local frameContent = self._ui.frame_servantInven:GetFrameContent()
  frameContent:SetSize(frameContent:GetSizeX(), self._ui.stc_contentBG:GetSizeY())
  if self._ui.stc_contentBG:GetSizeY() > self._ui.frame_servantInven:GetSizeY() then
    self._ui.frame_servantInven:GetVScroll():SetShow(true)
    self._ui.frame_servantInven:UpdateContentScroll()
    self._ui.frame_servantInven:GetVScroll():SetControlPos(0)
    self._ui.frame_servantInven:UpdateContentPos()
  else
    self._ui.frame_servantInven:GetVScroll():SetShow(false)
  end
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
  self._ui.stc_horseWeight:ChangeTextureInfoName(_servantData[dataType].weightIconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_horseWeight, _servantData[dataType].weightIconUV[1], _servantData[dataType].weightIconUV[2], _servantData[dataType].weightIconUV[3], _servantData[dataType].weightIconUV[4])
  self._ui.stc_horseWeight:getBaseTexture():setUV(x1, y1, x2, y2)
  self._ui.stc_horseWeight:setRenderTexture(self._ui.stc_horseWeight:getBaseTexture())
  local equipOrCostumeSlots, equipOrCostumeSlotsBG, slotNoList
  if true == isEquip then
    equipOrCostumeSlots = self._ui.slot_servantEquip
    equipOrCostumeSlotsBG = self._ui.stc_servantEquipSlotBG
    slotNoList = _servantData[dataType].equipSlotNoList
  else
    equipOrCostumeSlots = self._ui.slot_servantCostume
    equipOrCostumeSlotsBG = self._ui.stc_servantCostumeSlotBG
    slotNoList = _servantData[dataType].costumeSlotNoList
  end
  local checkFlagList = _servantData[dataType].checkFlag
  local UV = _servantData[dataType].pictogramUV
  local slotCount = #slotNoList
  local group = self._ui.stc_upperGroups[UPPER_TAB_TYPE.SERVANT_TAB]
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
        elseif nil == checkFlagList or nil == checkFlagList[slotNo] then
          slot.chk_toggleButton:SetShow(false)
        else
          slot.chk_toggleButton:SetShow(true)
          local checkBool = ToClient_IsSetVehicleEquipSlotFlag(vehicleType, checkFlagList[slotNo])
          slot.chk_toggleButton:SetCheck(not checkBool)
        end
      else
        slot:clearItem()
        slot.chk_toggleButton:SetShow(false)
        slot.pictogram:SetShow(true)
        slot.pictogram:ChangeTextureInfoName("renewal/ui_icon/console_icon_equip.dds")
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
    self._currentLowerTab = LOWER_TAB_TYPE.INVENTORY_TAB
  end
  self:updateSilverPearlMileage()
  local playerLevel = getSelfPlayer():get():getLevel()
  local selfPlayer = getSelfPlayer()
  local invenUseSize = selfPlayer:get():getInventorySlotCount(LOWER_TAB_TYPE.CASH_INVEN_TAB == self._currentLowerTab)
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
    slot.stc_multipleSelect:SetShow(false)
    if ii - 1 + self._invenStartSlotIndex < self._invenCapacity then
      local itemWrapper = getInventoryItemByType(_lowerTabData[self._currentLowerTab].whereType, slotNoList[ii + self._invenStartSlotIndex])
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
        if true == self._multipleSelect[currentWhereType][slotNo] then
          slot.stc_multipleSelect:SetShow(true)
        end
        Panel_Inventory_isBlackStone_16002 = self:addEffectBlackStone(ii, isFiltered, slotNo)
        local itemKey = itemWrapper:get():getKey():getItemKey()
        self:autoSetPotion(playerLevel, itemKey, currentWhereType, slotNo)
        PaGlobal_TutorialManager:handleUpdateInventorySlotData(slot, itemKey)
        if (42000 == itemKey or 42001 == itemKey or 41607 == itemKey or 42002 == itemKey or 42010 == itemKey or 42003 == itemKey or 42004 == itemKey or 42034 == itemKey or 42035 == itemKey or 42037 == itemKey or 42036 == itemKey or 42006 == itemKey or 42008 == itemKey or 42039 == itemKey or 42038 == itemKey or 42007 == itemKey or 42053 == itemKey or 41610 == itemKey or 42009 == itemKey or 42054 == itemKey or 42057 == itemKey or 42061 == itemKey or 42066 == itemKey or 42055 == itemKey or 42056 == itemKey) and false == _ContentsGroup_RenewUI_Tutorial and true == PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() and not FGlobal_FirstSummonItemUse() then
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
          if slotNo < self._invenSlotMax and true == self._newItemAtSlot[slotNo] then
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
  PaGlobal_TutorialManager:handleOpenedInventory()
  self:findPuzzle()
  if "QuickSlot" == Panel_Tooltip_Item_GetCurrentSlotType() then
    Panel_Tooltip_Item_Refresh(_panel:GetPosX() - 20, getScreenSizeY() - 100)
  end
  if true == _panel:GetShow() then
    Panel_Tooltip_Item_Refresh(_panel:GetPosX() - 20, getScreenSizeY() - 100)
  end
  Panel_NewEquip_EffectLastUpdate()
  if _ContentsGroup_RenewUI_Repair and true == PaGlobalFunc_FixMaxEnduranceInfo_GetShow() then
    PaGlobalFunc_FixMaxEnduranceInfo_UpdateProgressBar()
  end
  if _ContentsGroup_RenewUI_Repair and true == PaGlobalFunc_RepairInfo_GetShow() then
    PaGlobalFunc_RepairInfo_UpdateSilver()
  end
end
function InventoryInfo:findPuzzle()
  if true == self._isAutoSort then
    return
  end
  if LOWER_TAB_TYPE.UNDEFINED == self._currentLowerTab then
    return
  end
  local whereType = _lowerTabData[self._currentLowerTab].whereType
  local isFind = findPuzzleAndReadyMake(whereType)
  if not isFind or true == ToClient_IsSortedInventory() then
    self._ui.btn_invenPuzzle:SetShow(false)
    self._puzzleCompleteSlot = nil
    return
  end
  local count = getPuzzleSlotCount()
  for ii = 1, count do
    local puzzleSlotNo = getPuzzleSlotAt(ii - 1)
    for jj = 1, self._invenSlotMax do
      if puzzleSlotNo == self._ui.slot_inven[jj].slotNo then
        self._ui.slot_inven[jj].icon:AddEffect("UI_Item_MineCraft", true, -2, -2)
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
      self._puzzleCompleteSlot = slotNumber
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
  if true == self._snapEffectAniFlag and nil ~= self._ui.ref_snapTarget then
    local value = math.sin(self._sinCurveTheta)
    local adjustedValue = value * 15
    self._ui.stc_snapEffect:SetSize(self._ui.ref_snapTarget:GetSizeX() + 9 + adjustedValue * 2, self._ui.ref_snapTarget:GetSizeY() + 9 + adjustedValue * 2)
    self._ui.stc_snapEffect:SetPosX(self._ui.ref_snapTarget:GetParentPosX() - _panel:GetPosX() - 4 - adjustedValue)
    self._ui.stc_snapEffect:SetPosY(self._ui.ref_snapTarget:GetParentPosY() - _panel:GetPosY() - 4 - adjustedValue)
    self._ui.stc_snapEffect:SetAlpha(1 - value)
    self._sinCurveTheta = self._sinCurveTheta + deltaTime * 4
    if math.pi / 2 < self._sinCurveTheta then
      self._sinCurveTheta = 0
      self._snapEffectAniFlag = false
    end
  end
  if true == self._weightDesignatorIsAnimating then
    self:animateWeightDesignator()
  end
  if true == self._showAniIsPlaying then
    self._showAniElapsed = self._showAniElapsed + deltaTime
    if self._showAniElapsed > self._showAniDuration then
      self._showAniIsPlaying = false
    end
  end
  if false == self._monitorItemCooltime then
    return
  end
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
  if tabIndex == UPPER_TAB_TYPE.INFORMATION_TAB then
    self._ui.stc_subWindowLower:SetShow(false)
  else
    self._ui.stc_subWindowLower:SetShow(true)
  end
  self._ui.txt_noServant:SetShow(false)
  if tabIndex == UPPER_TAB_TYPE.COSTUME_TAB then
    Input_InventoryInfo_SetLowerTabTo(LOWER_TAB_TYPE.CASH_INVEN_TAB)
  elseif tabIndex == UPPER_TAB_TYPE.EQUIPMENT_TAB then
    Input_InventoryInfo_SetLowerTabTo(LOWER_TAB_TYPE.INVENTORY_TAB)
  elseif tabIndex == UPPER_TAB_TYPE.SERVANT_TAB then
    Input_InventoryInfo_SetLowerTabTo(LOWER_TAB_TYPE.INVENTORY_TAB)
  end
  self:updateUpperTab(tabIndex)
  if DragManager:isDragging() then
    DragManager:clearInfo()
  end
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
    self._currentLowerTab = #_lowerTabData
  end
  self._ui.txt_bagName:SetText(_lowerTabData[self._currentLowerTab].name)
  self:updateInventory()
end
function Input_InventoryInfo_SetLowerTabRight()
  local self = InventoryInfo
  self._currentLowerTab = self._currentLowerTab + 1
  if self._currentLowerTab > #_lowerTabData then
    self._currentLowerTab = 1
  end
  self._ui.txt_bagName:SetText(_lowerTabData[self._currentLowerTab].name)
  self:updateInventory()
end
function Input_InventoryInfo_SetLowerTabTo(tabIndex)
  local self = InventoryInfo
  if tabIndex ~= self._currentLowerTab then
    self._invenStartSlotIndex = 0
    self._ui.scroll_inven:SetControlPos(0)
    self._currentLowerTab = tabIndex
    self._ui.txt_bagName:SetText(_lowerTabData[self._currentLowerTab].name)
    self:updateInventory()
  end
end
function InputMRUp_InventoryInfo_EquipSlot(slotNo)
  local self = InventoryInfo
  if isKeyPressed(CppEnums.VirtualKeyCode.KeyCode_SHIFT) then
  else
    if DragManager:isDragging() then
      InputMLUp_InventoryInfo_EquipSlot(slotNo)
      return
    end
    local itemWrapper = ToClient_getEquipmentItem(slotNo)
    if nil ~= itemWrapper then
      if Defines.UIMode.eUIMode_Repair == GetUIMode() then
        if true == PaGlobalFunc_FixMaxEnduranceInfo_GetShow() then
          equipmentDoUnequip(slotNo)
        else
          PaGlobalFunc_RepairInfo_EquipRClick(slotNo, itemWrapper)
        end
      else
        equipmentDoUnequip(slotNo)
      end
    end
  end
end
function InputMLUp_InventoryInfo_EquipSlot(targetEquipSlotNo)
  local self = InventoryInfo
  if DragManager.dragStartPanel == _panel then
    local dragSlotNo = DragManager.dragSlotInfo
    local dragFromWhere = DragManager.dragWhereTypeInfo
    local itemWrapper = getInventoryItemByType(dragFromWhere, dragSlotNo)
    if nil ~= itemWrapper then
      local itemStatic = itemWrapper:getStaticStatus()
      if itemStatic:isEquipable() then
        if 16 == targetEquipSlotNo or 17 == targetEquipSlotNo then
          Inventory_UseItemTargetSelf(Inventory_GetCurrentInventoryType(), dragSlotNo, targetEquipSlotNo)
        else
          Inventory_UseItemTargetSelf(Inventory_GetCurrentInventoryType(), dragSlotNo, nil)
        end
        DragManager:clearInfo()
      end
    end
  end
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
function Input_InventoryInfo_ToggleUnderwear()
  local self = InventoryInfo
  local itemWrapper = ToClient_getEquipmentItem(20)
  if nil == itemWrapper then
    self._ui.chk_showUnderwear:SetCheck(false)
    return
  end
  if not IsSelfPlayerWaitAction() or IsSelfPlayerBattleWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_UNDERWEAR"))
    if getSelfPlayer():get():getUnderwearModeInhouse() then
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
      local index = self:getIndexFromCostumeSlotNo(20)
      if true == self._ui.slot_costumes[index].chk_toggleButton:IsCheck() then
        Input_InventoryInfo_CostumeShowToggle(index)
      end
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
  local servantType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  local moveToType = _servantData[servantType].moveItemToType
  FGlobal_PopupMoveItem_Init(CppEnums.ItemWhereType.eServantInventory, index - 1 + __eTInventorySlotNoUseStart, moveToType, self._servantActorKeyRaw[1], true)
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
    return false
  end
  local vehicleType = servantWrapper:getVehicleType()
  local servantType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  local moveToType = _servantData[servantType].moveItemToType
  return (DragManager:itemDragMove(moveToType, actorKeyRaw))
end
function Input_InventoryInfo_ServantInvenTooltip(index, isShow)
  local self = InventoryInfo
  Panel_Tooltip_Item_SetPosition(index - 1 + __eTInventorySlotNoUseStart, self._ui.slot_servantInven[index], "servant_inventory")
  Panel_Tooltip_Item_Show_GeneralNormal(index - 1 + __eTInventorySlotNoUseStart, "servant_inventory", isShow, nil, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end
function InputMRUp_InventoryInfo_ServantEquipSlot(isEquipment, index)
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
  if true == isEquipment then
    slotNo = _servantData[dataType].equipSlotNoList[index]
  else
    slotNo = _servantData[dataType].costumeSlotNoList[index]
  end
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
  if nil == itemWrapper then
    return
  end
  servant_doUnequip(servantWrapper:getActorKeyRaw(), slotNo)
end
function InputMLUp_InventoryInfo_ServantEquipDropHandler()
  local self = InventoryInfo
  if _panel ~= DragManager.dragStartPanel then
    return
  end
  local itemWrapper = getInventoryItemByType(Inventory_GetCurrentInventoryType(), DragManager.dragSlotInfo)
  if nil == itemWrapper then
    return
  end
  local itemSSW = itemWrapper:getStaticStatus()
  if true == itemSSW:isVehicleItem() then
    inventoryUseItem(Inventory_GetCurrentInventoryType(), DragManager.dragSlotInfo, nil)
  end
end
function Input_InventoryInfo_ServantEquipToggle(isEquipment, index)
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
    check = self._ui.slot_servantEquip[index].chk_toggleButton
  else
    slotNo = _servantData[dataType].costumeSlotNoList[index]
    check = self._ui.slot_servantCostume[index].chk_toggleButton
  end
  local itemWrapper = servantWrapper:getEquipItem(slotNo)
  if nil == itemWrapper then
    return
  end
  if true == ToClient_IsSetVehicleEquipSlotFlag(vehicleType, _servantData[dataType].checkFlag[slotNo]) then
    ToClient_ResetVehicleEquipSlotFlag(vehicleType, _servantData[dataType].checkFlag[slotNo])
    check:SetCheck(true)
  else
    ToClient_SetVehicleEquipSlotFlag(vehicleType, _servantData[dataType].checkFlag[slotNo])
    check:SetCheck(false)
  end
  ToClient_setShowVehicleEquip()
end
function Input_InventoryInfo_ServantEquipShowTooltip(isEquipment, index, isShow)
  local self = InventoryInfo
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  local dataType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  local slotNo = _servantData[dataType].equipSlotNoList[index]
  local slot = self._ui.slot_servantEquip[index]
  if false == isEquipment then
    slotNo = _servantData[dataType].costumeSlotNoList[index]
    slot = self._ui.slot_servantCostume[index]
  end
  Panel_Tooltip_Item_SetPosition(slotNo, slot, "ServantEquipment")
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "ServantEquipment", isShow, nil, _panel:GetPosX() - 20, getScreenSizeY() - 100)
end
function InputMRUp_InventoryInfo_InvenSlot(index)
  local self = InventoryInfo
  if isKeyPressed(CppEnums.VirtualKeyCode.KeyCode_SHIFT) then
  elseif Defines.UIMode.eUIMode_Repair == GetUIMode() then
    local whereType = _lowerTabData[self._currentLowerTab].whereType
    local slotNo = self._ui.slot_inven[index].slotNo
    local itemWrapper = getInventoryItemByType(whereType, slotNo)
    if nil ~= itemWrapper then
      if Panel_FixMaxEndurance_Renew:GetShow() then
        if self._ui.slot_inven[index].icon:IsEnable() then
          PaGlobalFunc_FixMaxEnduranceInfo_PickTargetOrSubject(slotNo, itemWrapper, itemWrapper:get():getCount_s64(), whereType)
        end
      else
        PaGlobalFunc_RepairInfo_InvenRClick(slotNo, itemWrapper, itemWrapper:get():getCount_s64(), whereType)
      end
    end
  elseif DragManager:isDragging() then
    InputDrag_InventoryInfo_invenDragEnd(index)
  else
    self:onInventoryItemRClick(index)
  end
end
function InputMLUp_InventoryInfo_InvenSlot(index)
  local self = InventoryInfo
  local slotNo = self._ui.slot_inven[index].slotNo
  local inventoryType = _lowerTabData[self._currentLowerTab].whereType
  local selfProxy = getSelfPlayer():get()
  if nil == selfProxy then
    return
  end
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
  elseif invenUseSize - __eTInventorySlotNoUseStart - self._invenStartSlotIndex == index - 1 then
  end
end
function Input_InventoryInfo_AutoSort()
  local self = InventoryInfo
  if nil ~= self._filterFunc or nil ~= self._rClickFunc then
    return
  end
  local isSorted = ToClient_IsSortedInventory()
  ToClient_SetSortedInventory(not isSorted)
  self._ui.txt_keyGuideX:SetText(self:getXKeyGuideString(not isSorted))
  DragManager:clearInfo()
  if false == isSorted then
    self._ui.btn_invenPuzzle:SetShow(false)
    self._puzzleCompleteSlot = nil
  end
  self:updateInventory()
end
function InventoryInfo:getXKeyGuideString(isSorted)
  if true == isSorted then
    return "Arranged"
  else
    return "Not Arranged"
  end
end
function InputMOn_InventoryInfo_invenShowTooltip(index)
  local self = InventoryInfo
  if true == self._showAniIsPlaying or not _isInitialized or nil == self._invenCapacity then
    return
  end
  local slotNo
  if index + self._invenStartSlotIndex <= self._invenCapacity then
    slotNo = self._ui.slot_inven[index].slotNo
  end
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return
  end
  if slotNo ~= nil then
    self._newItemAtSlot[slotNo] = false
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
  self._tooltipWhereType = _lowerTabData[self._currentLowerTab].whereType
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
  Panel_Tooltip_Item_hideTooltip()
  TooltipSimple_Hide()
end
function InputDrag_InventoryInfo_invenDrag(index)
  local self = InventoryInfo
  if true == ToClient_IsSortedInventory() then
    DragManager:clearInfo()
    return
  end
  local slotNo = self._ui.slot_inven[index].slotNo
  if nil ~= inventoryDragNoUseList and inventoryDragNoUseList:IsShow() then
    return
  end
  if nil ~= self._filterFunc or nil ~= self._rClickFunc then
    return
  end
  if Panel_Win_System:GetShow() then
    return
  end
  local whereType = _lowerTabData[self._currentLowerTab].whereType
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
  if Panel_Win_System:IsShow() then
    DragManager:clearInfo()
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_REPOSITIONITEM_WHILE_UI"))
    return false
  end
  if _panel == DragManager.dragStartPanel then
    if DragManager.dragWhereTypeInfo == _lowerTabData[self._currentLowerTab].whereType then
      inventory_swapItem(_lowerTabData[self._currentLowerTab].whereType, DragManager.dragSlotInfo, slotNo)
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
  local inventory = Inventory_GetCurrentInventory()
  local maxSize = inventory:sizeXXX() - __eTInventorySlotNoUseStart
  local prevSlotIndex = self._invenStartSlotIndex
  self._invenStartSlotIndex = UIScroll.ScrollEvent(self._ui.scroll_inven, isUp, self._invenSlotRowMax, maxSize, self._invenStartSlotIndex, self._invenSlotColumnMax)
  local intervalSlotIndex = INVEN_MAX_COUNT - self._invenSlotMax
  if prevSlotIndex == 0 and self._invenStartSlotIndex == 0 or prevSlotIndex == intervalSlotIndex and self._invenStartSlotIndex == intervalSlotIndex then
    return
  end
  if ToClient_isXBox() or ToClient_IsDevelopment() then
    ToClient_padSnapIgnoreGroupMove()
  end
  self:updateInventory()
end
function InventoryInfo:onInventoryItemRClick(index)
  if nil == self._ui.slot_inven[index] or nil == self._ui.slot_inven[index].slotNo then
    return
  end
  local inventoryType = _lowerTabData[self._currentLowerTab].whereType
  local slot = self._ui.slot_inven[index]
  local slotNo = slot.slotNo
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
  if nil ~= itemWrapper and slot.icon:IsEnable() then
    if false == slot.icon:IsEnable() then
      return
    end
    if selfProxy:doRideMyVehicle() and itemStatic:isUseToVehicle() then
      inventoryUseItem(inventoryType, slotNo, equipSlotNo, false)
      return
    end
    if false == _ContentsGroup_RenewUI_Stable and Panel_Window_StableStallion:GetShow() then
      local itemMaxCount = FGlobal_MaxItemCount(slotNo)
      if nil ~= itemMaxCount then
        if itemMaxCount < Int64toInt32(itemWrapper:get():getCount_s64()) then
          Panel_NumberPad_Show(true, tonumber64(itemMaxCount), slotNo, Set_StallionItemSlot, nil, itemWrapper)
        else
          Panel_NumberPad_Show(true, itemWrapper:get():getCount_s64(), slotNo, Set_StallionItemSlot, nil, itemWrapper)
        end
      end
      return
    else
    end
    if nil ~= self._rClickFunc then
      self._rClickFunc(slotNo, itemWrapper, itemWrapper:get():getCount_s64(), inventoryType)
      return
    end
    if UPPER_TAB_TYPE.SERVANT_TAB == self._currentUpperTab and nil ~= self._servantActorKeyRaw and #self._servantActorKeyRaw > 0 then
      self:onInventoryItemRClickAtServant(index)
      return
    end
    if slotNo == self._puzzleCompleteSlot then
      Input_InventoryInfo_CompletePuzzle()
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
      Panel_Tooltip_Item_hideTooltip()
      local function onClickYesButton()
        Inventory_UseItemTargetSelf(inventoryType, slotNo, equipSlotNo)
      end
      local messageboxData = {
        title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_USEITEM_TITLE"),
        content = itemEnchantWrapper:getPopupItemDesc(),
        functionYes = onClickYesButton,
        functionNo = MessageBox_Empty_function,
        priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageboxData)
    elseif itemEnchantWrapper:isExchangeItemNPC() or itemWrapper:isSoulCollector() then
      HandleClickedWayPoint(slotNo)
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
function InventoryInfo:onInventoryItemRClickAtServant(index)
  if nil == self._ui.slot_inven[index] or nil == self._ui.slot_inven[index].slotNo then
    return
  end
  local slotNo = self._ui.slot_inven[index].slotNo
  local inventoryType = _lowerTabData[self._currentLowerTab].whereType
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  local servantWrapper = getServantInfoFromActorKey(self._servantActorKeyRaw[1])
  if nil == servantWrapper or nil == slotNo or nil == itemWrapper then
    return
  end
  local vehicleType = servantWrapper:getVehicleType()
  local itemSSW = itemWrapper:getStaticStatus()
  if itemSSW:isVehicleItem() then
    Inventory_UseItemTargetSelf(inventoryType, slotNo, nil)
    return
  end
  local servantType = _vehicleTypeToSERVANT_TYPE[vehicleType]
  local moveToType = _servantData[servantType].moveItemToType
  FGlobal_PopupMoveItem_InitByInventory(slotNo, itemWrapper, itemWrapper:get():getCount_s64(), whereType)
  HandleClickedMoveItemButtonXXX(moveToType, self._servantActorKeyRaw[1])
end
function InputMOn_InventoryInfo_equipShowTooltip(slotNo, isOn)
  if true == InventoryInfo._showAniIsPlaying then
    return
  end
  Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "equipment", isOn, false, _panel:GetPosX() - 20, 200)
end
function Input_InventoryInfo_CostumeShowToggle(index)
  local self = InventoryInfo
  local toggle = self._ui.slot_costumes[index].chk_toggleButton
  local isCheck = toggle:IsCheck()
  if false == isCheck then
    ToClient_SetAvatarEquipSlotFlag(_avatarCheckFlag[_costumeSlotNo[index]])
    toggle:SetCheck(true)
    if getSelfPlayer():get():getUnderwearModeInhouse() then
      getSelfPlayer():get():setUnderwearModeInhouse(false)
      Toclient_setShowAvatarEquip()
      self._ui.chk_showUnderwear:SetCheck(false)
    end
  else
    ToClient_ResetAvatarEquipSlotFlag(_avatarCheckFlag[_costumeSlotNo[index]])
    toggle:SetCheck(false)
  end
  Toclient_setShowAvatarEquip()
end
function Input_InventoryInfo_CompletePuzzle()
  InventoryInfo._ui.btn_invenPuzzle:SetShow(false)
  requestMakePuzzle()
end
function Input_InventoryInfo_ItemDelete(index)
  local self = InventoryInfo
  if nil ~= self._filterFunc or nil ~= self._rClickFunc then
    return
  end
  local slotNo = self._ui.slot_inven[index].slotNo
  if nil == slotNo then
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
  local self = InventoryInfo
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  local itemName = itemWrapper:getStaticStatus():getName()
  self._deleteWhereType = whereType
  self._deleteSlotNo = slotNo
  self._deleteCount = count
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
  local self = InventoryInfo
  if self._deleteSlotNo == nil then
    return
  end
  local itemWrapper = getInventoryItemByType(self._deleteWhereType, self._deleteSlotNo)
  if nil == itemWrapper then
    return
  end
  if CppEnums.ContentsEventType.ContentsType_InventoryBag == itemWrapper:getStaticStatus():get():getContentsEventType() then
    local bagType = itemWrapper:getStaticStatus():getContentsEventParam1()
    local bagSize = itemWrapper:getStaticStatus():getContentsEventParam2()
    local isEmptyBag = false
    for index = 0, bagSize - 1 do
      local bagItemWrapper = getInventoryBagItemByType(self._deleteWhereType, self._deleteSlotNo, index)
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
  PaGlobal_TutorialManager:handleInventoryDelete(itemWrapper, self._deleteWhereType, self._deleteSlotNo)
end
function Inventory_Delete_YesXXX()
  local self = InventoryInfo
  if self._deleteSlotNo == nil then
    return
  end
  deleteItem(getSelfPlayer():getActorKey(), self._deleteWhereType, self._deleteSlotNo, self._deleteCount)
  Inventory_DropEscape()
  DragManager:clearInfo()
end
function Inventory_Delete_No()
  local self = InventoryInfo
  self._deleteWhereType = nil
  self._deleteSlotNo = nil
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
    slot = self._ui.slot_costumes[self:getIndexFromCostumeSlotNo(slotNo)]
    slot.icon:AddEffect("UI_ItemInstall_Cash", false, 0, 0)
  else
    slot = self._ui.slot_equips[self:getIndexFromEquipSlotNo(slotNo)]
    slot.icon:AddEffect("UI_ItemInstall", false, 0, 0)
  end
  slot.icon:AddEffect("fUI_SkillButton01", false, 0, 0)
  self:updateAttackStat(true)
end
function FromClient_InventoryInfo_OpenServantInven(actorKeyRaw)
  self._servantActorKeyRaw = {}
  self._servantActorKeyRaw[1] = actorKeyRaw
  InventoryInfo:open(UPPER_TAB_TYPE.SERVANT_TAB)
end
function FromClient_InventoryInfo_ServantEquipOn(slotNo)
end
function FromClient_InventoryInfo_ServantEquipChanged()
  InventoryInfo:updateInventory()
  if nil ~= InventoryInfo._servantActorKeyRaw and nil ~= InventoryInfo._servantActorKeyRaw[1] then
    InventoryInfo:updateServantInven(InventoryInfo._servantActorKeyRaw[1])
    InventoryInfo:updateServantEquipOrCostume(true)
    InventoryInfo:updateServantEquipOrCostume(false)
  end
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
function UseItemFromOtherPlayer_Yes()
  useItemFromOtherPlayer(true)
end
function UseItemFromOtherPlayer_No()
  useItemFromOtherPlayer(false)
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
function FromClient_InventoryInfo_PadSnapChangeTarget(fromControl, toControl)
  local self = InventoryInfo
  if UPPER_TAB_TYPE.INFORMATION_TAB == self._currentUpperTab then
    self:setKeyGuideWithTab()
  elseif nil ~= toControl then
    self:setKeyGuideWithControl(toControl:GetID())
  end
  self._ui.ref_snapTarget = toControl
  if nil == toControl or false == toControl:GetShow() or _panel:GetID() ~= toControl:GetParentPanel():GetID() or UPPER_TAB_TYPE.INFORMATION_TAB == self._currentUpperTab then
    self._ui.stc_snapEffect:SetShow(false)
  else
    self._snapEffectAniFlag = true
    self._sinCurveTheta = 0
    self._ui.stc_snapEffect:SetShow(true)
  end
end
function InventoryInfo:setKeyGuideWithTab()
  local data = _keyGuideData[self._currentUpperTab]
  for ii = 1, #self._keyGuideList do
    if nil ~= data[ii] then
      if "" == data[ii] then
        self._keyGuideList[ii]:SetShow(false)
      else
        self._keyGuideList[ii]:SetText(data[ii])
        self._keyGuideList[ii]:SetShow(true)
      end
    end
  end
end
function InventoryInfo:setKeyGuideWithControl(controlName)
  local numStart, numEnd = string.find(controlName, "%d+")
  if nil ~= numStart then
    controlName = string.sub(controlName, 1, numStart - 1)
  end
  local data = _keyGuideData[controlName]
  if nil == data then
    return
  end
  for ii = 1, #self._keyGuideList do
    if nil == data[ii] then
      self._keyGuideList[ii]:SetShow(true)
      self._keyGuideList[ii]:SetText(_keyGuideData.InventoryInfo_InvenSlotBG_[ii])
    elseif "" == data[ii] then
      self._keyGuideList[ii]:SetShow(false)
    else
      self._keyGuideList[ii]:SetText(data[ii])
      self._keyGuideList[ii]:SetShow(true)
    end
  end
  if UPPER_TAB_TYPE.SERVANT_TAB == self._currentUpperTab then
    self._keyGuideList[KEY_GUIDE_TYPE.A]:SetText("Move")
  end
  self._keyGuideList[KEY_GUIDE_TYPE.X]:SetText(self:getXKeyGuideString(ToClient_IsSortedInventory()))
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
function PaGlobalFunc_InventoryInfo_InitMultipleSelect()
  return InventoryInfo:initMultipleSelect()
end
function InventoryInfo:initMultipleSelect()
  self._multipleSelect = {}
  self._multipleSelect = {
    [CppEnums.ItemWhereType.eInventory] = {},
    [CppEnums.ItemWhereType.eCashInventory] = {}
  }
  for ii = 1, __eTInventorySlotNoMax do
    self._multipleSelect[CppEnums.ItemWhereType.eInventory][ii] = false
  end
  for ii = 1, __eTCashInventorySlotNoMax do
    self._multipleSelect[CppEnums.ItemWhereType.eCashInventory][ii] = false
  end
end
function InventoryInfo:getMultipleSelect()
  local rv = {}
  for ii = 1, #self._multipleSelect[CppEnums.ItemWhereType.eInventory] do
    if true == self._multipleSelect[CppEnums.ItemWhereType.eInventory] then
      rv[#rv + 1] = {}
      rv[#rv + 1].slotNo = ii
      rv[#rv + 1].whereType = CppEnums.ItemWhereType.eInventory
    end
  end
  for ii = 1, #self._multipleSelect[CppEnums.ItemWhereType.eCashInventory] do
    if true == self._multipleSelect[CppEnums.ItemWhereType.eCashInventory] then
      rv[#rv + 1] = {}
      rv[#rv + 1].slotNo = ii
      rv[#rv + 1].whereType = CppEnums.ItemWhereType.eCashInventory
    end
  end
  return rv
end
function InventoryInfo:handleCompleteMultipleSelection()
  if not self._multipleSelectEndFunc then
    return
  end
  local multipleSelectInfo = self:getMultipleSelect()
  self._multipleSelectEndFunc(multipleSelectInfo)
end
function PaGlobalFunc_InventoryInfo_HandleCompleteMultipleSelection()
  return InventoryInfo:handleCompleteMultipleSelection()
end
function PaGlobalFunc_InventoryInfo_ToggleMultipleSelect(index, whereType)
  local self = InventoryInfo
  local slotNo = self._ui.slot_inven[index].slotNo
  if nil == slotNo then
    return
  end
  if nil == whereType then
    return
  end
  self._multipleSelect[whereType][slotNo] = true ~= self._multipleSelect[whereType][slotNo]
  self:updateInventory()
end
function Inventory_SetFunctor(filterFunction, rClickFunction, otherWindowOpenFunction, effect, multiSelectParam)
  local self = InventoryInfo
  DragManager:clearInfo()
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
    self._ui.stc_keyGuideSetFunctor:SetShow(true)
    if nil ~= multiSelectParam then
      if nil ~= multiSelectParam.multipleSelectEndFunc and "function" == type(multiSelectParam.multipleSelectEndFunc) then
        self._multipleSelectEndFunc = multiSelectParam.multipleSelectEndFunc
        self._ui.txt_keyGuideSetFunctorAlterKey:SetShow(true)
        self._ui.txt_keyGuideSetFunctorAlterKey:SetText(PAGetString(Defines.StringSheet_GAME, "EXCHANGE_TEXT_STATE_FINAL_CHECK"))
        if nil ~= multiSelectParam.button then
          self._multipleSelectEndButton = multiSelectParam.button
          _panel:registerPadEvent(self._multipleSelectEndButton, "PaGlobalFunc_InventoryInfo_HandleCompleteMultipleSelection()")
          PaGlobalFunc_SetKeyGuideUVTo(self._ui.txt_keyGuideSetFunctorAlterKey, self._multipleSelectEndButton)
        else
          _panel:registerPadEvent(self._multipleSelectEndButton, "")
          self._multipleSelectEndButton = nil
          PaGlobalFunc_SetKeyGuideUVTo(self._ui.txt_keyGuideSetFunctorAlterKey, self._multipleSelectEndButton)
        end
        if nil ~= multiSelectParam.keyGuideString then
          self._ui.txt_keyGuideSetFunctorAlterKey:SetText(tostring(multiSelectParam.keyGuideString))
        end
      end
    else
      if nil ~= self._multipleSelectEndButton then
        _panel:registerPadEvent(self._multipleSelectEndButton, "")
      end
      self._multipleSelectEndFunc = nil
      self._multipleSelectEndButton = nil
      self._ui.txt_keyGuideSetFunctorAlterKey:SetShow(false)
    end
  else
    self._ui.stc_keyGuideSetFunctor:SetShow(false)
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
function PaGlobalFunc_InventoryInfo_CurrentTabIsServant()
  return UPPER_TAB_TYPE.SERVANT_TAB == InventoryInfo._currentUpperTab
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
    return _lowerTabData[LOWER_TAB_TYPE.INVENTORY_TAB].whereType
  else
    return _lowerTabData[self._currentLowerTab].whereType
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
function Global_GetInventorySlotNoByNotSorted(fromIndex)
  if nil == fromIndex then
    return
  end
  local self = InventoryInfo
  local toSlotNo = self._ui.slot_inven[fromIndex].slotNo
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
  if (42000 == itemKey or 42001 == itemKey or 42002 == itemKey or 42010 == itemKey or 42003 == itemKey or 42004 == itemKey or 42034 == itemKey or 42035 == itemKey or 42037 == itemKey or 42036 == itemKey or 42006 == itemKey or 42008 == itemKey or 42039 == itemKey or 42038 == itemKey or 42007 == itemKey or 42053 == itemKey or 41610 == itemKey or 42009 == itemKey or 42054 == itemKey or 42057 == itemKey or 42061 == itemKey or 42066 == itemKey or 42055 == itemKey or 42056 == itemKey) and false == _ContentsGroup_RenewUI_Tutorial and PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() then
    isFirstSummonItemUse = true
  end
end
function FGlobal_FirstSummonItemUse()
  return isFirstSummonItemUse
end
function Inventory_UseItemTarget(slotNo, itemWrapper, count_s64, inventoryType)
  if InventoryInfo:checkRestrictedAction() then
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
  PaGlobal_TutorialUiManager:getUiMasking():showInventoryMasking(slot.cooltime:GetParentPosX() - 8, slot.cooltime:GetParentPosY() - 8)
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
  for ii = 1, #_costumeSlotNo do
    if slotIndex == _costumeSlotNo[ii] then
      return true
    end
  end
  return false
end
function InventoryInfo:getIndexFromEquipSlotNo(slotIndex)
  for ii = 1, #_equipSlotNo do
    if slotIndex == _equipSlotNo[ii] then
      return ii
    end
  end
  UI.ASSERT(false, "index " .. slotIndex .. " is not found at _equipSlotNo")
  return nil
end
function InventoryInfo:getIndexFromCostumeSlotNo(slotIndex)
  for ii = 1, #_costumeSlotNo do
    if slotIndex == _costumeSlotNo[ii] then
      return ii
    end
  end
  UI.ASSERT(false, "index " .. slotIndex .. " is not found at _costumeSlotNo")
  return nil
end
function InventoryInfo:getNearbyServantsActorKeys()
  local keys = {}
  if self._currentUpperTab == UPPER_TAB_TYPE.SERVANT_TAB then
    local actorProxyWrapper = interaction_getInteractable()
    if nil ~= actorProxyWrapper then
      local actorKeyRaw = actorProxyWrapper:get():getActorKeyRaw()
      local servantInfo = getServantInfoFromActorKey(actorKeyRaw)
      if nil ~= servantInfo then
        keys[1] = actorKeyRaw
      end
    end
  end
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
function PaGlobalFunc_InventoryInfo_GetSlotBorder()
  return InventoryInfo._ui.stc_slotBorder
end
function HandleClicked_Inventory_Palette_Open()
  audioPostEvent_SystemUi(1, 24)
  PaGlobalFunc_Dyeing_Open()
end
function PaGlobalFunc_InventoryInfo_PopMoney()
  if false == PaGlobalFunc_Warehouse_GetShow() then
    return
  end
  local self = InventoryInfo
  local whereType = CppEnums.ItemWhereType.eInventory
  local slotNo = getMoneySlotNo()
  FGlobal_PopupMoveItem_Init(whereType, slotNo, CppEnums.MoveItemToType.Type_Player, getSelfPlayer():getActorKey(), true)
end
function PaGlobalFunc_InventoryInfo_SetMoneyButton(setUp)
  if true == setUp then
    _panel:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_InventoryInfo_PopMoney()")
  else
    _panel:registerPadEvent(__eConsoleUIPadEvent_Up_X, "Input_InventoryInfo_AutoSort()")
  end
end
function InventoryInfo:generateXBoxKeyGuide(key, str)
  local txt_keyGuide = UI.createControl(UCT.PA_UI_CONTROL_STATICTEXT, parent, "StaticText_KeyGuideFor_" .. key .. "_" .. str)
  return txt_keyGuide
end
local _buttonUV = {
  [__eConsoleUIPadEvent_X] = {
    136,
    1,
    180,
    45
  },
  [__eConsoleUIPadEvent_Up_X] = {
    136,
    1,
    180,
    45
  },
  [__eConsoleUIPadEvent_Y] = {
    46,
    1,
    90,
    45
  },
  [__eConsoleUIPadEvent_A] = {
    1,
    1,
    45,
    45
  },
  [__eConsoleUIPadEvent_Empty] = {
    0,
    0,
    2,
    2
  }
}
function PaGlobalFunc_SetKeyGuideUVTo(control, buttonIndex)
  control:ChangeTextureInfoName("renewal/ui_icon/console_xboxkey_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, _buttonUV[buttonIndex][1], _buttonUV[buttonIndex][2], _buttonUV[buttonIndex][3], _buttonUV[buttonIndex][4])
  control:getBaseTexture():setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end
