-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tooltip\panel_tooltip_item.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local _const = Defines.u64_const
local u64_hour = toUint64(0, 3600)
local u64_minute = toUint64(0, 60)
local UI_color = Defines.Color
local UI_RewardType = CppEnums.RewardType
local isGrowthContents = ToClient_IsContentsGroupOpen("35")
local isTotemContents = ToClient_IsContentsGroupOpen("44")
local isExtractionCommon = ToClient_IsContentsGroupOpen("1006")
local isExtractionJapan = ToClient_IsContentsGroupOpen("1007")
local isItemLock = ToClient_IsContentsGroupOpen("219")
local isCronStone = ToClient_IsContentsGroupOpen("222")
local normalTooltip = {mainPanel = Panel_Tooltip_Item, itemName = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_Name"), itemIcon = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_Icon"), enchantLevel = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_Enchant_value"), itemType = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_Type"), dying = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_Dying"), isEnchantable = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_isEnchantable"), isSealed = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_isSealed"), bindType = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_BindType"), balksExtraction = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_Balks"), cronsExtraction = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_Cron"), useDyeColorTitle = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_DyeColorInfo"), 
useDyeColorIcon_Part = {(UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part2"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part3"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part4"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part5"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part6"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part7"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part8"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part9"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part10"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part11"), (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part12"); [0] = (UI.getChildControl)(Panel_Tooltip_Item, "Static_DyeColorIcon_Part1")}
, useLimit_category = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_category"), useLimit_panel = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_panel"), useLimit_level = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_level"), useLimit_level_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_level_value"), useLimit_extendedslot = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_extendedslot"), useLimit_extendedslot_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_extendedslot_value"), useLimit_class = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_class"), useLimit_class_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_class_value"), useLimit_Exp = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_Exp"), useLimit_Exp_gage = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_Exp_gage"), useLimit_Exp_gage_value = (UI.getChildControl)(Panel_Tooltip_Item, "Progress_UseLimit_Exp_gage_value"), useLimit_Exp_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_Exp_value"), useLimit_endurance = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_endurance"), useLimit_endurance_gage = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_endurance_gage"), useLimit_endurance_gage_value = (UI.getChildControl)(Panel_Tooltip_Item, "Progress_UseLimit_endurance_gage_value"), useLimit_dynamic_endurance_gage_value = (UI.getChildControl)(Panel_Tooltip_Item, "Progress2_MaxEndurance"), useLimit_endurance_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_endurance_value"), remainTime = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_remainTime"), remainTime_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_remainTime_value"), expireIcon_white = (UI.getChildControl)(Panel_Tooltip_Item, "Static_Expire_Icon1"), expireIcon_red = (UI.getChildControl)(Panel_Tooltip_Item, "Static_Expire_Icon2"), expireIcon_end = (UI.getChildControl)(Panel_Tooltip_Item, "Static_Expire_Icon3"), defaultEffect_category = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_category"), defaultEffect_panel = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_panel"), attack = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_attack"), attack_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_attack_value"), attack_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_attackDiff_value"), isMeleeAttack = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_attack_isMeleeAttack"), isRangeAttack = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_attack_isRangeAttack"), isMagicAttack = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_attack_isMagicAttack"), defense = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_defense"), defense_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_defense_value"), defense_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_defenseDiff_value"), weight = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_weight"), weight_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_weight_value"), weight_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_DefaultEffect_weightDiff_value"), _hit = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_hit"), _hit_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_hit_value"), _hit_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_hitDiff_value"), _dv = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_dv"), _dv_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_dv_value"), _dv_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_dvDiff_value"), _pv = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_pv"), _pv_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_pv_value"), _pv_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_pvDiff_value"), soketOption_panel = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_SoketOption_panel"), 
soketSlot = {}
, 
soketName = {}
, 
soketEffect = {}
, itemProducedPlace = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_ProducedPlace"), itemDescription = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_Description"), itemPrice_panel = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_ItemPrice_panel"), itemPrice_transportBuy = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_ItemPrice_transportBuy"), itemPrice_transportBuy_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_ItemPrice_transportBuy_value"), itemPrice_storeSell = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_ItemPrice_storeSell"), itemPrice_storeSell_value = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_ItemPrice_storeSell_value"), grapeSize = ((UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_UseLimit_endurance_value")):GetSizeX(), panelSize = Panel_Tooltip_Item:GetSizeY(), socketSize = ((UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_SoketOption_panel")):GetSizeY(), deltaTime = 0, att_Value = 0, def_Value = 0, wei_Value = 0, tradeInfo_Panel = (UI.getChildControl)(Panel_Tooltip_Item, "Static_TradeInfoPanel"), tradeInfo_Title = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_TradePriceTitle"), tradeInfo_Value = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_TradePriceValue"), equipSlotName = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_EquipTypeName"), productNotify = (UI.getChildControl)(Panel_Tooltip_Item, "Static_ProductNotify"), itemLockNotify = (UI.getChildControl)(Panel_Tooltip_Item, "Static_ItemLockNotify"), personalTrade = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_IsPersnalTrade"), itemLock = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_IsItemLock"), exchangeTitle = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_ExchangeTitle"), exchangeDesc = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_ExchangeDescription"), bagSize = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_BagSize"), equipmentInBag = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_EquipmentInBag"), cronStoneEnchant = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_CronEnchant"), cronStoneGrade = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_CronGrade"), cronStoneProgressBg = (UI.getChildControl)(Panel_Tooltip_Item, "Static_CronStoneStackBg"), cronStoneProgress = (UI.getChildControl)(Panel_Tooltip_Item, "Progress2_StackCount"), 
cronStoneGradeValue = {[0] = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_Grade1"), [1] = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_Grade2"), [2] = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_Grade3"), [3] = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_Grade4")}
, 
cronStoneCountValue = {[0] = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_Count1"), [1] = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_Count2"), [2] = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_Count3"), [3] = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_Count4")}
, cronStoneValue = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_CronStackDesc"), enchantDifficulty = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_EnchantDifficulty"), soulCollector = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_SoulCollector")}
local equippedTooltip = {equippedTag = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_nowEquiped_tag"), mainPanel = Panel_Tooltip_Item_equipped, itemName = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_Name"), itemIcon = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_Icon"), enchantLevel = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_Enchant_value"), itemType = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_Type"), dying = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_Dying"), isEnchantable = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_isEnchantable"), isSealed = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_isSealed"), bindType = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_BindType"), balksExtraction = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_Balks"), cronsExtraction = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_Cron"), useDyeColorTitle = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_DyeColorInfo"), 
useDyeColorIcon_Part = {(UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part2"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part3"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part4"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part5"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part6"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part7"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part8"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part9"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part10"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part11"), (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part12"); [0] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_DyeColorIcon_Part1")}
, useLimit_category = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_category"), useLimit_panel = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_panel"), useLimit_level = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_level"), useLimit_level_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_level_value"), useLimit_extendedslot = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_extendedslot"), useLimit_extendedslot_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_extendedslot_value"), useLimit_class = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_class"), useLimit_class_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_class_value"), useLimit_Exp = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_Exp"), useLimit_Exp_gage = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_Exp_gage"), useLimit_Exp_gage_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Progress_UseLimit_Exp_gage_value"), useLimit_Exp_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_Exp_value"), useLimit_endurance = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_endurance"), useLimit_endurance_gage = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_endurance_gage"), useLimit_endurance_gage_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Progress_UseLimit_endurance_gage_value"), useLimit_dynamic_endurance_gage_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Progress2_MaxEndurance"), useLimit_endurance_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_endurance_value"), remainTime = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_remainTime"), remainTime_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_remainTime_value"), expireIcon_white = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_Expire_Icon1"), expireIcon_red = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_Expire_Icon2"), expireIcon_end = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_Expire_Icon3"), defaultEffect_category = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_category"), defaultEffect_panel = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_panel"), attack = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_attack"), attack_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_attack_value"), attack_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_attackDiff_value"), isMeleeAttack = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_attack_isMeleeAttack"), isRangeAttack = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_attack_isRangeAttack"), isMagicAttack = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_attack_isMagicAttack"), defense = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_defense"), defense_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_defense_value"), defense_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_defenseDiff_value"), weight = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_weight"), weight_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_weight_value"), weight_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "StaticText_DefaultEffect_weightDiff_value"), _hit = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_hit"), _hit_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_hit_value"), _hit_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_hitDiff_value"), _dv = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_dv"), _dv_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_dv_value"), _dv_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_dvDiff_value"), _pv = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_pv"), _pv_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_DefaultEffect_pv_value"), _pv_diffValue = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_DefaultEffect_pvDiff_value"), soketOption_panel = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_SoketOption_panel"), 
soketSlot = {}
, 
soketName = {}
, 
soketEffect = {}
, itemProducedPlace = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_ProducedPlace"), itemDescription = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_Description"), itemPrice_panel = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_ItemPrice_panel"), itemPrice_transportBuy = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_ItemPrice_transportBuy"), itemPrice_transportBuy_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_ItemPrice_transportBuy_value"), itemPrice_storeSell = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_ItemPrice_storeSell"), itemPrice_storeSell_value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_ItemPrice_storeSell_value"), arrow = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_Arrow"), arrow_L = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_Arrow_L"), grapeSize = ((UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_UseLimit_endurance_value")):GetSizeX(), panelSize = Panel_Tooltip_Item:GetSizeY(), socketSize = ((UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_SoketOption_panel")):GetSizeY(), deltaTime = 0, att_Value = 0, def_Value = 0, wei_Value = 0, tradeInfo_Panel = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_TradeInfoPanel"), tradeInfo_Title = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_TradePriceTitle"), tradeInfo_Value = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_TradePriceValue"), equipSlotName = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_EquipTypeName"), productNotify = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_ProductNotify"), itemLockNotify = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_ItemLockNotify"), personalTrade = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_IsPersnalTrade"), itemLock = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_IsItemLock"), exchangeTitle = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_ExchangeTitle"), exchangeDesc = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_ExchangeDescription"), cronStoneEnchant = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_CronEnchant"), cronStoneGrade = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_CronGrade"), cronStoneProgressBg = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Static_CronStoneStackBg"), cronStoneProgress = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Progress2_StackCount"), 
cronStoneGradeValue = {[0] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_Grade1"), [1] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_Grade2"), [2] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_Grade3"), [3] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_Grade4")}
, 
cronStoneCountValue = {[0] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_Count1"), [1] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_Count2"), [2] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_Count3"), [3] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_Count4")}
, cronStoneValue = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_CronStackDesc"), enchantDifficulty = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_EnchantDifficulty"), soulCollector = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "StaticText_SoulCollector")}
local chattingLinkedItemTooltip = {mainPanel = Panel_Tooltip_Item_chattingLinkedItem, itemName = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_Name"), itemIcon = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_Icon"), closeBtn = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Button_Win_Close"), enchantLevel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_Enchant_value"), itemType = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_Type"), dying = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_Dying"), isEnchantable = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_isEnchantable"), isSealed = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_isSealed"), bindType = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_BindType"), balksExtraction = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_Balks"), cronsExtraction = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_Cron"), useDyeColorTitle = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_DyeColorInfo"), 
useDyeColorIcon_Part = {(UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part2"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part3"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part4"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part5"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part6"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part7"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part8"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part9"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part10"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part11"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part12"); [0] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_DyeColorIcon_Part1")}
, useLimit_category = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_category"), useLimit_panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_panel"), useLimit_level = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_level"), useLimit_level_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_level_value"), useLimit_extendedslot = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_extendedslot"), useLimit_extendedslot_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_extendedslot_value"), useLimit_class = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_class"), useLimit_class_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_class_value"), useLimit_Exp = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_Exp"), useLimit_Exp_gage = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_Exp_gage"), useLimit_Exp_gage_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Progress_UseLimit_Exp_gage_value"), useLimit_Exp_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_Exp_value"), useLimit_endurance = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_endurance"), useLimit_endurance_gage = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_endurance_gage"), useLimit_endurance_gage_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Progress_UseLimit_endurance_gage_value"), useLimit_dynamic_endurance_gage_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Progress2_MaxEndurance"), useLimit_endurance_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_endurance_value"), remainTime = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_remainTime"), remainTime_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_remainTime_value"), expireIcon_white = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_Expire_Icon1"), expireIcon_red = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_Expire_Icon2"), expireIcon_end = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_Expire_Icon3"), defaultEffect_category = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_category"), defaultEffect_panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_panel"), attack = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_attack"), attack_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_attack_value"), attack_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_attackDiff_value"), isMeleeAttack = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_attack_isMeleeAttack"), isRangeAttack = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_attack_isRangeAttack"), isMagicAttack = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_attack_isMagicAttack"), defense = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_defense"), defense_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_defense_value"), defense_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_defenseDiff_value"), weight = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_weight"), weight_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_weight_value"), weight_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_DefaultEffect_weightDiff_value"), _hit = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_hit"), _hit_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_hit_value"), _hit_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_hitDiff_value"), _dv = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_dv"), _dv_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_dv_value"), _dv_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_dvDiff_value"), _pv = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_pv"), _pv_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_pv_value"), _pv_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_DefaultEffect_pvDiff_value"), soketOption_panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_SoketOption_panel"), 
soketSlot = {}
, 
soketName = {}
, 
soketEffect = {}
, itemProducedPlace = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_ProducedPlace"), itemDescription = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_Description"), itemPrice_panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_ItemPrice_panel"), itemPrice_transportBuy = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_ItemPrice_transportBuy"), itemPrice_transportBuy_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_ItemPrice_transportBuy_value"), itemPrice_storeSell = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_ItemPrice_storeSell"), itemPrice_storeSell_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_ItemPrice_storeSell_value"), grapeSize = ((UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_UseLimit_endurance_value")):GetSizeX(), panelSize = Panel_Tooltip_Item_chattingLinkedItem:GetSizeY(), socketSize = ((UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_SoketOption_panel")):GetSizeY(), deltaTime = 0, att_Value = 0, def_Value = 0, wei_Value = 0, tradeInfo_Panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_TradeInfoPanel"), tradeInfo_Title = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_TradePriceTitle"), tradeInfo_Value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_TradePriceValue"), equipSlotName = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_EquipTypeName"), productNotify = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_ProductNotify"), itemLockNotify = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_ItemLockNotify"), personalTrade = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_IsPersnalTrade"), itemLock = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_IsItemLock"), exchangeTitle = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_ExchangeTitle"), exchangeDesc = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_ExchangeDescription"), cronStoneEnchant = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_CronEnchant"), cronStoneGrade = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_CronGrade"), cronStoneProgressBg = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Static_CronStoneStackBg"), cronStoneProgress = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Progress2_StackCount"), 
cronStoneGradeValue = {[0] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_Grade1"), [1] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_Grade2"), [2] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_Grade3"), [3] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_Grade4")}
, 
cronStoneCountValue = {[0] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_Count1"), [1] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_Count2"), [2] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_Count3"), [3] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_Count4")}
, cronStoneValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_CronStackDesc"), enchantDifficulty = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_EnchantDifficulty"), soulCollector = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "StaticText_SoulCollector")}
local chattingLinkedItemClickTooltip = {mainPanel = Panel_Tooltip_Item_chattingLinkedItemClick, itemName = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_Name"), itemIcon = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_Icon"), closeBtn = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Button_Win_Close"), enchantLevel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_Enchant_value"), itemType = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_Type"), dying = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_Dying"), isEnchantable = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_isEnchantable"), isSealed = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_isSealed"), bindType = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_BindType"), balksExtraction = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_Balks"), cronsExtraction = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_Cron"), useDyeColorTitle = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_DyeColorInfo"), 
useDyeColorIcon_Part = {(UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part2"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part3"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part4"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part5"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part6"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part7"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part8"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part9"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part10"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part11"), (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part12"); [0] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_DyeColorIcon_Part1")}
, useLimit_category = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_category"), useLimit_panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_panel"), useLimit_level = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_level"), useLimit_level_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_level_value"), useLimit_extendedslot = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_extendedslot"), useLimit_extendedslot_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_extendedslot_value"), useLimit_class = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_class"), useLimit_class_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_class_value"), useLimit_Exp = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_Exp"), useLimit_Exp_gage = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_Exp_gage"), useLimit_Exp_gage_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Progress_UseLimit_Exp_gage_value"), useLimit_Exp_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_Exp_value"), useLimit_endurance = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_endurance"), useLimit_endurance_gage = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_endurance_gage"), useLimit_endurance_gage_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Progress_UseLimit_endurance_gage_value"), useLimit_dynamic_endurance_gage_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Progress2_MaxEndurance"), useLimit_endurance_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_endurance_value"), remainTime = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_remainTime"), remainTime_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_remainTime_value"), expireIcon_white = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_Expire_Icon1"), expireIcon_red = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_Expire_Icon2"), expireIcon_end = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_Expire_Icon3"), defaultEffect_category = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_category"), defaultEffect_panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_panel"), attack = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_attack"), attack_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_attack_value"), attack_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_attackDiff_value"), isMeleeAttack = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_attack_isMeleeAttack"), isRangeAttack = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_attack_isRangeAttack"), isMagicAttack = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_attack_isMagicAttack"), defense = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_defense"), defense_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_defense_value"), defense_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_defenseDiff_value"), weight = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_weight"), weight_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_weight_value"), weight_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_DefaultEffect_weightDiff_value"), _hit = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_hit"), _hit_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_hit_value"), _hit_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_hitDiff_value"), _dv = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_dv"), _dv_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_dv_value"), _dv_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_dvDiff_value"), _pv = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_pv"), _pv_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_pv_value"), _pv_diffValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_DefaultEffect_pvDiff_value"), soketOption_panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_SoketOption_panel"), 
soketSlot = {}
, 
soketName = {}
, 
soketEffect = {}
, itemProducedPlace = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_ProducedPlace"), itemDescription = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_Description"), itemPrice_panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_ItemPrice_panel"), itemPrice_transportBuy = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_ItemPrice_transportBuy"), itemPrice_transportBuy_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_ItemPrice_transportBuy_value"), itemPrice_storeSell = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_ItemPrice_storeSell"), itemPrice_storeSell_value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_ItemPrice_storeSell_value"), grapeSize = ((UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_UseLimit_endurance_value")):GetSizeX(), panelSize = Panel_Tooltip_Item_chattingLinkedItemClick:GetSizeY(), socketSize = ((UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_SoketOption_panel")):GetSizeY(), deltaTime = 0, att_Value = 0, def_Value = 0, wei_Value = 0, tradeInfo_Panel = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_TradeInfoPanel"), tradeInfo_Title = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_TradePriceTitle"), tradeInfo_Value = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_TradePriceValue"), equipSlotName = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_EquipTypeName"), productNotify = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_ProductNotify"), itemLockNotify = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_ItemLockNotify"), personalTrade = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_IsPersnalTrade"), itemLock = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_IsItemLock"), exchangeTitle = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_ExchangeTitle"), exchangeDesc = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_ExchangeDescription"), cronStoneEnchant = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_CronEnchant"), cronStoneGrade = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_CronGrade"), cronStoneProgressBg = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Static_CronStoneStackBg"), cronStoneProgress = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Progress2_StackCount"), 
cronStoneGradeValue = {[0] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_Grade1"), [1] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_Grade2"), [2] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_Grade3"), [3] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_Grade4")}
, 
cronStoneCountValue = {[0] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_Count1"), [1] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_Count2"), [2] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_Count3"), [3] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_Count4")}
, cronStoneValue = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_CronStackDesc"), enchantDifficulty = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_EnchantDifficulty"), soulCollector = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "StaticText_SoulCollector")}
local servantKindTypeString = {
[0] = {[3] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BARD"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SADDLE"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_STIRRUP"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HORSEHEAD"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_FOOT"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_ARMOR"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_STIRRUP"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_SADDLE"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_FACE")}
, 
[1] = {[3] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_CORVER"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_TIRE"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_FLAG"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_INSIGNIA"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_LAMP"), [25] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_BODY"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_BODY"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_TIRE"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_FLAG"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_INSIGNIA"), [26] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_CORVER")}
, 
[2] = {[3] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_SHIPARMOR_25"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_SHIPARMOR_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_SHIPARMOR_5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_SHIPARMOR_6"), [25] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_SHIPARMOR_3"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_SHIPARMOR_13"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_SHIPARMOR_15"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_SHIPARMOR_16"), [26] = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_SHIPARMOR_14")}
}
local Panel_Tooltip_Item_DataObject = {
slotData = {}
, currentSlotNo = -1, currentSlotType = "", index = -1, isNormal = false, isSkill = false, itemMarket = false, inventory = false, equip = false, isTooltipClickOpen = false}
local EquipItem_Lock = {itemLock = false, equipment = false, itemAccNo = -1}
local savedSlotNo = 0
Panel_Tooltip_Item_Initialize = function()
  -- function num : 0_0 , upvalues : chattingLinkedItemTooltip, chattingLinkedItemClickTooltip, normalTooltip, equippedTooltip, UI_TM, Panel_Tooltip_Item_DataObject
  Panel_Tooltip_Item:SetShow(false, false)
  Panel_Tooltip_Item:setMaskingChild(true)
  Panel_Tooltip_Item:SetIgnore(true)
  Panel_Tooltip_Item:SetIgnoreChild(true)
  Panel_Tooltip_Item:setGlassBackground(true)
  Panel_Tooltip_Item_equipped:SetShow(false, false)
  Panel_Tooltip_Item_equipped:setMaskingChild(true)
  Panel_Tooltip_Item_equipped:SetIgnore(true)
  Panel_Tooltip_Item_equipped:SetIgnoreChild(true)
  Panel_Tooltip_Item_equipped:setGlassBackground(true)
  Panel_Tooltip_Item_chattingLinkedItem:SetShow(false, false)
  Panel_Tooltip_Item_chattingLinkedItem:setMaskingChild(true)
  Panel_Tooltip_Item_chattingLinkedItem:SetIgnore(true)
  Panel_Tooltip_Item_chattingLinkedItem:SetIgnoreChild(true)
  Panel_Tooltip_Item_chattingLinkedItem:setGlassBackground(true)
  ;
  (chattingLinkedItemTooltip.closeBtn):addInputEvent("Mouse_LUp", "Panel_Tooltip_Item_chattingLinkedItem_hideTooltip()")
  ;
  (chattingLinkedItemClickTooltip.closeBtn):addInputEvent("Mouse_LUp", "Panel_Tooltip_Item_chattingLinkedItemClick_hideTooltip()")
  for idx = 1, 6 do
    -- DECOMPILER ERROR at PC88: Confused about usage of register: R4 in 'UnsetPending'

    (normalTooltip.soketSlot)[idx] = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_SoketOption_soketSlot" .. idx)
    -- DECOMPILER ERROR at PC98: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (normalTooltip.soketName)[idx] = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_SoketOption_soketName" .. idx)
    -- DECOMPILER ERROR at PC108: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (normalTooltip.soketEffect)[idx] = (UI.getChildControl)(Panel_Tooltip_Item, "Tooltip_Item_SoketOption_soketEffect" .. idx)
    -- DECOMPILER ERROR at PC118: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (equippedTooltip.soketSlot)[idx] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_SoketOption_soketSlot" .. idx)
    -- DECOMPILER ERROR at PC128: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (equippedTooltip.soketName)[idx] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_SoketOption_soketName" .. idx)
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (equippedTooltip.soketEffect)[idx] = (UI.getChildControl)(Panel_Tooltip_Item_equipped, "Tooltip_Item_SoketOption_soketEffect" .. idx)
    -- DECOMPILER ERROR at PC148: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (chattingLinkedItemTooltip.soketSlot)[idx] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_SoketOption_soketSlot" .. idx)
    -- DECOMPILER ERROR at PC158: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (chattingLinkedItemTooltip.soketName)[idx] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_SoketOption_soketName" .. idx)
    -- DECOMPILER ERROR at PC168: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (chattingLinkedItemTooltip.soketEffect)[idx] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItem, "Tooltip_Item_SoketOption_soketEffect" .. idx)
    -- DECOMPILER ERROR at PC178: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (chattingLinkedItemClickTooltip.soketSlot)[idx] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_SoketOption_soketSlot" .. idx)
    -- DECOMPILER ERROR at PC188: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (chattingLinkedItemClickTooltip.soketName)[idx] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_SoketOption_soketName" .. idx)
    -- DECOMPILER ERROR at PC198: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (chattingLinkedItemClickTooltip.soketEffect)[idx] = (UI.getChildControl)(Panel_Tooltip_Item_chattingLinkedItemClick, "Tooltip_Item_SoketOption_soketEffect" .. idx)
  end
  local SetTextWrap = function(control)
    -- function num : 0_0_0 , upvalues : UI_TM
    if control == nil then
      (UI.ASSERT)(false, "SetTextWrap(control) , control nil")
      return 
    end
    control:SetTextMode(UI_TM.eTextMode_AutoWrap)
    control:SetAutoResize(true)
  end

  local InitControls = function(target)
    -- function num : 0_0_1 , upvalues : SetTextWrap
    SetTextWrap(target.itemType)
    SetTextWrap(target.isEnchantable)
    SetTextWrap(target.isSealed)
    SetTextWrap(target.useLimit_category)
    SetTextWrap(target.useLimit_level)
    SetTextWrap(target.useLimit_extendedslot)
    SetTextWrap(target.useLimit_extendedslot_value)
    SetTextWrap(target.useLimit_class)
    SetTextWrap(target.useLimit_class_value)
    SetTextWrap(target.useLimit_Exp)
    SetTextWrap(target.useLimit_Exp_value)
    SetTextWrap(target.useLimit_endurance)
    SetTextWrap(target.useLimit_endurance_value)
    SetTextWrap(target.remainTime)
    SetTextWrap(target.remainTime_value)
    SetTextWrap(target.defaultEffect_category)
    SetTextWrap(target.attack)
    SetTextWrap(target.attack_value)
    SetTextWrap(target.attack_diffValue)
    SetTextWrap(target.defense)
    SetTextWrap(target.defense_value)
    SetTextWrap(target.defense_diffValue)
    SetTextWrap(target._hit)
    SetTextWrap(target._hit_value)
    SetTextWrap(target._hit_diffValue)
    SetTextWrap(target._dv)
    SetTextWrap(target._dv_value)
    SetTextWrap(target._dv_diffValue)
    SetTextWrap(target._pv)
    SetTextWrap(target._pv_value)
    SetTextWrap(target._pv_diffValue)
    SetTextWrap(target.weight)
    SetTextWrap(target.weight_value)
    SetTextWrap(target.weight_diffValue)
    SetTextWrap(target.itemProducedPlace)
    SetTextWrap(target.itemDescription)
    SetTextWrap(target.tradeInfo_Title)
    SetTextWrap(target.tradeInfo_Value)
    SetTextWrap(target.equipSlotName)
    SetTextWrap(target.exchangeDesc)
    SetTextWrap(target.productNotify)
    SetTextWrap(target.itemLockNotify)
    SetTextWrap(target.itemLock)
    for idx = 1, 6 do
      SetTextWrap((target.soketName)[idx])
      SetTextWrap((target.soketEffect)[idx])
    end
  end

  InitControls(normalTooltip)
  InitControls(equippedTooltip)
  InitControls(chattingLinkedItemTooltip)
  InitControls(chattingLinkedItemClickTooltip)
  SetTextWrap(normalTooltip.bagSize)
  SetTextWrap(normalTooltip.equipmentInBag)
  local skillTooltipFunctionList = {GetParentPosX = function()
    -- function num : 0_0_2 , upvalues : Panel_Tooltip_Item_DataObject
    local slot = Panel_Tooltip_Item_DataObject.skillSlot
    return (slot.icon):GetParentPosX()
  end
, GetParentPosY = function()
    -- function num : 0_0_3 , upvalues : Panel_Tooltip_Item_DataObject
    local slot = Panel_Tooltip_Item_DataObject.skillSlot
    return (slot.icon):GetParentPosY()
  end
, GetSizeX = function()
    -- function num : 0_0_4 , upvalues : Panel_Tooltip_Item_DataObject
    local slot = Panel_Tooltip_Item_DataObject.skillSlot
    return (slot.icon):GetSizeX()
  end
, GetSizeY = function()
    -- function num : 0_0_5 , upvalues : Panel_Tooltip_Item_DataObject
    local slot = Panel_Tooltip_Item_DataObject.skillSlot
    return (slot.icon):GetSizeY()
  end
}
  Panel_SkillTooltip_SetPosition(1, skillTooltipFunctionList, "itemToSkill")
end

local GetBottomPos = function(control)
  -- function num : 0_1
  if control == nil then
    (UI.ASSERT)(false, "GetBottomPos(control) , control nil")
    return 
  end
  return control:GetPosY() + control:GetSizeY()
end

Panel_Tooltip_Item_SetPosition = function(slotNo, slot, slotType)
  -- function num : 0_2 , upvalues : Panel_Tooltip_Item_DataObject
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R3 in 'UnsetPending'

  if (Panel_Tooltip_Item_DataObject.slotData)[slotType] == nil then
    (Panel_Tooltip_Item_DataObject.slotData)[slotType] = {}
  end
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((Panel_Tooltip_Item_DataObject.slotData)[slotType])[slotNo] = slot
end

Panel_Tooltip_Item_GetCurrentSlotType = function()
  -- function num : 0_3 , upvalues : Panel_Tooltip_Item_DataObject
  return Panel_Tooltip_Item_DataObject.currentSlotType
end

Panel_Tooltip_Item_Refresh = function()
  -- function num : 0_4 , upvalues : Panel_Tooltip_Item_DataObject
  if Panel_Tooltip_Item_DataObject.currentSlotNo == -2 then
    return 
  else
    if Panel_Tooltip_Item_DataObject.currentSlotNo ~= -1 then
      if Panel_Tooltip_Item_DataObject.isNormal then
        Panel_Tooltip_Item_Show_GeneralNormal(Panel_Tooltip_Item_DataObject.currentSlotNo, Panel_Tooltip_Item_DataObject.currentSlotType, true, Panel_Tooltip_Item_DataObject.index)
      else
        Panel_Tooltip_Item_Show_GeneralStatic(Panel_Tooltip_Item_DataObject.currentSlotNo, Panel_Tooltip_Item_DataObject.currentSlotType, true, Panel_Tooltip_Item_DataObject.index)
      end
    else
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

Panel_Tooltip_Item_Show = function(itemStaticStatus, uiBase, isSSW, isItemWrapper, chattingLinkedItem, index, isItemMarket, invenSlotNo)
  -- function num : 0_5 , upvalues : Panel_Tooltip_Item_DataObject, normalTooltip, equippedTooltip
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R8 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.itemMarket = isItemMarket
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R8 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.inventory = nil
  local isEquipalbeItem, servantItem = showTooltip_Item(normalTooltip, itemStaticStatus, isSSW, isItemWrapper, chattingLinkedItem, index, nil, invenSlotNo)
  local equipItemWrapper = nil
  if isEquipalbeItem and not servantItem and isItemMarket then
    if isSSW then
      equipItemWrapper = getEquipmentItem(itemStaticStatus:getEquipSlotNo())
    else
      equipItemWrapper = getEquipmentItem((itemStaticStatus:getStaticStatus()):getEquipSlotNo())
    end
    if equipItemWrapper ~= nil then
      showTooltip_Item(equippedTooltip, equipItemWrapper, false, true)
    end
  end
  if uiBase:IsUISubApp() then
    Panel_Tooltip_Item_Set_Position_UISubApp(uiBase)
    ;
    (normalTooltip.mainPanel):OpenUISubApp()
    if equipItemWrapper ~= nil then
      (equippedTooltip.mainPanel):OpenUISubApp()
    end
  else
    Panel_Tooltip_Item_Set_Position(uiBase)
  end
end

Panel_Tooltip_Item_Show_ForQuest = function(itemEnchantKey, isSSW, isItemWrapper)
  -- function num : 0_6 , upvalues : Panel_Tooltip_Item_DataObject, normalTooltip
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R3 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.itemMarket = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R3 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.inventory = nil
  local itemStaticStatus = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  showTooltip_Item(normalTooltip, itemStaticStatus, isSSW, isItemWrapper)
  Panel_Tooltip_Item_Set_Position(Panel_QuestInfo)
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R4 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.currentSlotNo = -2
end

Panel_Tooltip_Item_Show_ForChattingLinkedItem = function(itemStaticStatus, uiBase, isSSW, isItemWrapper, chattingLinkedItem, isClicked)
  -- function num : 0_7 , upvalues : Panel_Tooltip_Item_DataObject, chattingLinkedItemTooltip, chattingLinkedItemClickTooltip
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R6 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.itemMarket = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R6 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.inventory = nil
  ;
  (chattingLinkedItemTooltip.closeBtn):SetIgnore(false)
  ;
  (chattingLinkedItemClickTooltip.closeBtn):SetIgnore(false)
  if isClicked then
    showTooltip_Item(chattingLinkedItemClickTooltip, itemStaticStatus, isSSW, isItemWrapper, chattingLinkedItem, index)
  else
    showTooltip_Item(chattingLinkedItemTooltip, itemStaticStatus, isSSW, isItemWrapper, chattingLinkedItem, index)
  end
  Panel_Tooltip_Item_chattingLinkedItem_Set_Position(uiBase, isClicked)
end

local clothBagSlotNo = nil
Panel_Tooltip_Item_Show_GeneralNormal = function(slotNo, slotType, isOn, index)
  -- function num : 0_8 , upvalues : Panel_Tooltip_Item_DataObject, EquipItem_Lock, clothBagSlotNo, normalTooltip, equippedTooltip
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R4 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.itemMarket = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R4 in 'UnsetPending'

  EquipItem_Lock.equipment = false
  if Panel_Tooltip_Item_Show_General(slotNo, slotType, isOn, true, index) == false then
    return 
  end
  clothBagSlotNo = nil
  local slot = ((Panel_Tooltip_Item_DataObject.slotData)[slotType])[slotNo]
  local parent = false
  local inven = false
  if slotType == "servant_inventory" then
    if getServantInventorySize(ServantInventory_GetActorKeyRawFromIndex(0)) <= slotNo then
      return 
    end
    parent = true
  else
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R7 in 'UnsetPending'

    if slotType == "inventory" then
      Panel_Tooltip_Item_DataObject.inventory = true
      local selfPlayerWrapper = getSelfPlayer()
      if selfPlayerWrapper == nil then
        return 
      end
      local selfPlayer = selfPlayerWrapper:get()
      if selfPlayer == nil then
        return 
      end
      clothBagSlotNo = Global_GetInventorySlotNoByNotSorted(slotNo)
      local inventory = Inventory_GetCurrentInventory()
      local inventorySlotNo = slotNo + Inventory_GetStartIndex() + inventorySlotNoUserStart()
      if inventory:sizeXXX() <= inventorySlotNo then
        return 
      end
      parent = true
      inven = true
    else
      do
        if slotType == "Auction" then
          local myAuctionInfo = RequestGetAuctionInfo()
          local auctionType = myAuctionInfo:getAuctionType()
          local itemCount = 0
          if auctionType == 0 then
            itemCount = myAuctionInfo:getItemAuctionListCount()
          else
            if auctionType == 4 then
              itemCount = myAuctionInfo:getMySellingItemAuctionCount()
            else
              if auctionType == 6 then
                itemCount = myAuctionInfo:getMyItemBidListCount()
              end
            end
          end
          if itemCount < slotNo then
            return 
          end
        end
        do
          local itemWrapper = nil
          local isEquipOn = false
          local isServantEquipOn = false
          if slotType == "servant_inventory" then
            itemWrapper = getServantInventoryItemBySlotNo(ServantInventory_GetActorKeyRawFromIndex(index), slotNo)
          else
            if slotType == "QuickSlot" then
              local quickSlotInfo = getQuickSlotItem(slotNo)
              if quickSlotInfo == nil then
                return 
              end
              local selfPlayerWrapper = getSelfPlayer()
              if selfPlayerWrapper == nil then
                return 
              end
              local selfPlayer = selfPlayerWrapper:get()
              if selfPlayer == nil then
                return 
              end
              local whereType = QuickSlot_GetInventoryTypeFrom(quickSlotInfo._type)
              local inventory = selfPlayer:getInventoryByType(whereType)
              local invenSlotNo = inventory:getSlot(quickSlotInfo._itemKey)
              if inventory:sizeXXX() <= invenSlotNo then
                return 
              end
              itemWrapper = getInventoryItemByType(whereType, invenSlotNo)
              if (CppEnums.ContentsEventType).ContentsType_InventoryBag == ((itemWrapper:getStaticStatus()):get()):getContentsEventType() then
                invenSlotNo = ToClient_GetItemNoByInventory(whereType, quickSlotInfo._itemNo_s64)
                itemWrapper = getInventoryItemByType(whereType, invenSlotNo)
                clothBagSlotNo = invenSlotNo
              end
            else
              do
                if slotType == "inventory" then
                  itemWrapper = Inventory_GetToopTipItem()
                else
                  if slotType == "Enchant" then
                    if slotNo == 0 then
                      itemWrapper = PaGlobal_Enchant:enchantItem_ToItemWrapper()
                    else
                      itemWrapper = PaGlobal_Enchant:enchantItem_FromItemWrapper()
                    end
                  else
                    if slotType == "SocketItem" then
                      itemWrapper = SocketItem_FromItemWrapper()
                      isEquipOn = true
                    else
                      if slotType == "WareHouse" then
                        itemWrapper = Warehouse_GetToopTipItem()
                        parent = true
                        inven = true
                      else
                        if slotType == "looting" then
                          itemWrapper = looting_getItem(slotNo)
                        else
                          if slotType == "equipment" then
                            itemWrapper = getEquipmentItem(slotNo)
                            isEquipOn = true
                            parent = true
                            inven = true
                            -- DECOMPILER ERROR at PC220: Confused about usage of register: R10 in 'UnsetPending'

                            EquipItem_Lock.equipment = true
                            -- DECOMPILER ERROR at PC226: Confused about usage of register: R10 in 'UnsetPending'

                            EquipItem_Lock.itemLock = ToClient_EquipSlot_CheckItemLock(slotNo, 1)
                          else
                            if slotType == "disassemble_source" then
                              itemWrapper = disassemble_GetSourceItem(slotNo)
                            else
                              if slotType == "disassemble_result" then
                                itemWrapper = disassemble_GetResultItem(slotNo)
                              else
                                if slotType == "product_recipe" then
                                  itemWrapper = product_GetRecipeItem(0)
                                else
                                  if slotType == "product_result" then
                                    itemWrapper = product_GetResultItem(slotNo)
                                  else
                                    if slotType == "ServantEquipment" then
                                      local servantWrapper = getServantInfoFromActorKey(Servant_GetActorKeyFromItemToolTip())
                                      if servantWrapper ~= nil then
                                        itemWrapper = servantWrapper:getEquipItem(slotNo)
                                      end
                                      isEquipOn = true
                                      isServantEquipOn = false
                                    else
                                      do
                                        if slotType == "ServantShipEquipment" then
                                          local servantWrapper = getServantInfoFromActorKey(Servant_GetActorKeyFromItemToolTip())
                                          if servantWrapper ~= nil then
                                            itemWrapper = servantWrapper:getEquipItem(slotNo)
                                          end
                                          isEquipOn = true
                                          isServantEquipOn = true
                                        else
                                          do
                                            if slotType == "StableEquipment" then
                                              local servantInfo = stable_getServant(StableList_SelectSlotNo())
                                              if servantInfo ~= nil then
                                                itemWrapper = servantInfo:getEquipItem(slotNo)
                                              end
                                            else
                                              do
                                                if slotType == "LinkedHorseEquip" then
                                                  local servantWrapper = getServantInfoFromActorKey(Servant_GetActorKeyFromItemToolTip())
                                                  local servantInfo = stable_getServantFromOwnerServant(servantWrapper:getServantNo(), FGlobal_LinkedHorse_SelectedIndex())
                                                  if servantInfo ~= nil then
                                                    itemWrapper = servantInfo:getEquipItem(slotNo)
                                                  end
                                                else
                                                  do
                                                    if slotType == "exchangeOther" then
                                                      itemWrapper = tradePC_GetOtherItem(slotNo)
                                                    else
                                                      if slotType == "tradeMarket_Sell" then
                                                        itemWrapper = npcShop_getItemWrapperByShopSlotNo(slotNo)
                                                      else
                                                        if slotType == "tradeMarket_VehicleSell" then
                                                          itemWrapper = npcShop_getVehicleItemWrapper(slotNo)
                                                        else
                                                          if slotType == "exchangeSelf" then
                                                            itemWrapper = tradePC_GetMyItem(slotNo)
                                                          else
                                                            if slotType == "DeliveryInformation" then
                                                              local deliverySlotNo = DeliveryInformation_SlotIndex(slotNo)
                                                              local deliveryList = delivery_list(DeliveryInformation_WaypointKey())
                                                              if deliveryList ~= nil and deliverySlotNo < deliveryList:size() then
                                                                local deliveryInfo = deliveryList:atPointer(deliverySlotNo)
                                                                if deliveryInfo ~= nil then
                                                                  itemWrapper = deliveryInfo:getItemWrapper(deliverySlotNo)
                                                                end
                                                              end
                                                            else
                                                              do
                                                                if slotType == "DeliveryCarriageInformation" then
                                                                  local deliverySlotNo = DeliveryCarriageInformation_SlotIndex(slotNo)
                                                                  local deliveryList = deliveryCarriage_dlieveryList(DeliveryCarriageInformation_ObjectID())
                                                                  if deliveryList ~= nil and deliverySlotNo < deliveryList:size() then
                                                                    local deliveryInfo = deliveryList:atPointer(deliverySlotNo)
                                                                    if deliveryInfo ~= nil then
                                                                      itemWrapper = deliveryInfo:getItemWrapper(deliverySlotNo)
                                                                    end
                                                                  end
                                                                else
                                                                  do
                                                                    if slotType == "DeliveryRequest" then
                                                                      itemWrapper = delivery_packItem(slotNo)
                                                                    else
                                                                      if slotType == "Auction" then
                                                                        local myAuctionInfo = RequestGetAuctionInfo()
                                                                        local auctionType = (myAuctionInfo:getAuctionType())
                                                                        local itemAuctionData = nil
                                                                        if auctionType == 0 then
                                                                          itemAuctionData = myAuctionInfo:getItemAuctionListAt(slotNo - 1)
                                                                        else
                                                                          if auctionType == 4 then
                                                                            itemAuctionData = myAuctionInfo:getMySellingItemAuctionAt(slotNo - 1)
                                                                          else
                                                                            if auctionType == 6 then
                                                                              itemAuctionData = myAuctionInfo:getMyItemBidListAt(slotNo - 1)
                                                                            end
                                                                          end
                                                                        end
                                                                        if itemAuctionData ~= nil then
                                                                          itemWrapper = itemAuctionData:getItem()
                                                                        end
                                                                      else
                                                                        do
                                                                          if slotType == "AuctionRegister" then
                                                                            slotNo = Auction_GetSeletedItemSlot()
                                                                            if slotNo ~= -1 then
                                                                              itemWrapper = getInventoryItem(slotNo)
                                                                            end
                                                                          else
                                                                            if slotType == "Socket" then
                                                                              slotNo = Socket_GetSlotNo()
                                                                              if slotNo ~= -1 then
                                                                                itemWrapper = getInventoryItem(slotNo)
                                                                              end
                                                                            else
                                                                              if slotType == "HousingMode" then
                                                                                local realSlotNo = Panel_Housing_SlotNo(slotNo)
                                                                                if realSlotNo ~= -1 then
                                                                                  itemWrapper = getInventoryItem(realSlotNo)
                                                                                end
                                                                              else
                                                                                do
                                                                                  if slotType == "FixEquip" then
                                                                                    local slotNumber = 0
                                                                                    if slotNo == 0 then
                                                                                      slotNumber = PaGlobal_FixEquip:fixEquip_GetMainSlotNo()
                                                                                      if slotNumber ~= nil then
                                                                                        itemWrapper = getInventoryItem(slotNumber)
                                                                                      end
                                                                                    else
                                                                                      slotNumber = PaGlobal_FixEquip:fixEquip_GetSubSlotNo()
                                                                                      if slotNumber ~= nil then
                                                                                        itemWrapper = getInventoryItem(slotNumber)
                                                                                      end
                                                                                    end
                                                                                  else
                                                                                    do
                                                                                      if slotType == "DailyStamp" then
                                                                                        itemWrapper = ToClient_getRewardItem(slotNo)
                                                                                      else
                                                                                        if slotType == "clothExtraction" then
                                                                                          itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, slotNo)
                                                                                        else
                                                                                          if slotType == "CampEquip" then
                                                                                            local actorKeyRaw = PaGlobal_Camp:getActorKeyRaw()
                                                                                            local servantWrapper = getServantInfoFromActorKey(actorKeyRaw)
                                                                                            if servantWrapper ~= nil then
                                                                                              itemWrapper = servantWrapper:getEquipItem(slotNo)
                                                                                            end
                                                                                            if itemWrapper ~= nil then
                                                                                              isEquipOn = true
                                                                                              isServantEquipOn = true
                                                                                            end
                                                                                          else
                                                                                            do
                                                                                              ;
                                                                                              (UI.ASSERT)(false, "showTooltip(normal)으로 정의되지 않은 slot�\128�\133(" .. slotType .. ")�\180 들어왔습니다. 확인해주세요.")
                                                                                              do return  end
                                                                                              if itemWrapper == nil then
                                                                                                return 
                                                                                              end
                                                                                              local isEquipalbeItem = false
                                                                                              local servantItem = false
                                                                                              local skillKey = SkillKey()
                                                                                              -- DECOMPILER ERROR at PC552: Confused about usage of register: R13 in 'UnsetPending'

                                                                                              Panel_Tooltip_Item_DataObject.isSkill = false
                                                                                              -- DECOMPILER ERROR at PC561: Confused about usage of register: R13 in 'UnsetPending'

                                                                                              if (itemWrapper:getStaticStatus()):isSkillBook(skillKey) then
                                                                                                Panel_Tooltip_Item_DataObject.skillSlot = slot
                                                                                                Panel_SkillTooltip_Show(skillKey:getSkillNo(), false, "itemToSkill", false)
                                                                                                -- DECOMPILER ERROR at PC570: Confused about usage of register: R13 in 'UnsetPending'

                                                                                                Panel_Tooltip_Item_DataObject.isSkill = true
                                                                                                return 
                                                                                              else
                                                                                                if not isEquipOn then
                                                                                                  local itemSSW = itemWrapper:getStaticStatus()
                                                                                                  if not itemSSW:isEquipable() then
                                                                                                    isEquipalbeItem = showTooltip_Item(normalTooltip, itemWrapper, false, true, nil, nil)
                                                                                                  else
                                                                                                    -- DECOMPILER ERROR at PC599: Overwrote pending register: R11 in 'AssignReg'

                                                                                                    isEquipalbeItem = showTooltip_Item(normalTooltip, itemWrapper, false, true, nil, slotNo)
                                                                                                  end
                                                                                                else
                                                                                                  do
                                                                                                    showTooltip_Item(equippedTooltip, itemWrapper, false, true)
                                                                                                    if isEquipalbeItem and not isEquipOn then
                                                                                                      local equipItemWrapper = nil
                                                                                                      if servantItem or isServantEquipOn then
                                                                                                        local temporaryWrapper = getTemporaryInformationWrapper()
                                                                                                        if temporaryWrapper ~= nil then
                                                                                                          local servantWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
                                                                                                          if servantWrapper ~= nil then
                                                                                                            local servantKind = servantWrapper:getServantKind()
                                                                                                            if ((itemWrapper:getStaticStatus()):get()):isServantTypeUsable(servantKind) then
                                                                                                              equipItemWrapper = servantWrapper:getEquipItem((itemWrapper:getStaticStatus()):getEquipSlotNo())
                                                                                                            end
                                                                                                          end
                                                                                                        end
                                                                                                      else
                                                                                                        do
                                                                                                          do
                                                                                                            local accSlotNo = FGlobal_AccSlotNo(itemWrapper)
                                                                                                            -- DECOMPILER ERROR at PC653: Confused about usage of register: R15 in 'UnsetPending'

                                                                                                            if accSlotNo ~= nil then
                                                                                                              EquipItem_Lock.itemAccNo = accSlotNo
                                                                                                              equipItemWrapper = getEquipmentItem(accSlotNo)
                                                                                                            else
                                                                                                              -- DECOMPILER ERROR at PC660: Confused about usage of register: R15 in 'UnsetPending'

                                                                                                              EquipItem_Lock.itemAccNo = -1
                                                                                                              equipItemWrapper = getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())
                                                                                                            end
                                                                                                            if equipItemWrapper ~= nil and slotType ~= "Enchant" then
                                                                                                              showTooltip_Item(equippedTooltip, equipItemWrapper, false, true)
                                                                                                              ;
                                                                                                              (equippedTooltip.arrow):ChangeTextureInfoName("new_ui_common_forlua/widget/tooltip/tooltip_00.dds")
                                                                                                              local x1, y1, x2, y2 = setTextureUV_Func(equippedTooltip.arrow, 38, 43, 74, 109)
                                                                                                              ;
                                                                                                              ((equippedTooltip.arrow):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                              ;
                                                                                                              (equippedTooltip.arrow):setRenderTexture((equippedTooltip.arrow):getBaseTexture())
                                                                                                            end
                                                                                                            do
                                                                                                              if slotType == "Enchant" then
                                                                                                                local isCash = ((itemWrapper:getStaticStatus()):get()):isCash()
                                                                                                                if isCash == false then
                                                                                                                  showTooltip_Item(equippedTooltip, itemWrapper, false, true, nil, nil, true)
                                                                                                                end
                                                                                                                ;
                                                                                                                (equippedTooltip.arrow):ChangeTextureInfoName("new_ui_common_forlua/widget/tooltip/tooltip_00.dds")
                                                                                                                local x1, y1, x2, y2 = setTextureUV_Func(equippedTooltip.arrow, 1, 43, 37, 109)
                                                                                                                ;
                                                                                                                ((equippedTooltip.arrow):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                                                ;
                                                                                                                (equippedTooltip.arrow):setRenderTexture((equippedTooltip.arrow):getBaseTexture())
                                                                                                              end
                                                                                                              do
                                                                                                                if ((slot.icon):getParent()):IsUISubApp() then
                                                                                                                  Panel_Tooltip_Item_Set_Position_UISubApp(slot.icon, parent, inven)
                                                                                                                  ;
                                                                                                                  (equippedTooltip.mainPanel):OpenUISubApp()
                                                                                                                  if not isEquipOn then
                                                                                                                    (normalTooltip.mainPanel):OpenUISubApp()
                                                                                                                  end
                                                                                                                else
                                                                                                                  Panel_Tooltip_Item_Set_Position(slot.icon, parent, inven)
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

Panel_Tooltip_Item_Show_GeneralStatic = function(slotNo, slotType, isOn, index)
  -- function num : 0_9 , upvalues : Panel_Tooltip_Item_DataObject, normalTooltip, equippedTooltip
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R4 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.itemMarket = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R4 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.inventory = nil
  if Panel_Tooltip_Item_Show_General(slotNo, slotType, isOn, false, index) == false then
    return 
  end
  local isSSW = true
  local isItemWrapper = false
  local inven = false
  local parent = false
  local slot = ((Panel_Tooltip_Item_DataObject.slotData)[slotType])[slotNo]
  local itemSSW = nil
  if slotType == "QuestReward_Base" or slotType == "QuestReward_Select" or slotType == "Dialog_QuestReward_Base" or slotType == "Dialog_QuestReward_Select" then
    itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(slot._item))
  else
    if slotType == "shop" then
      local shopItemWrapper = nil
      if (Panel_Window_NpcShop.npcShop).lastTabIndex == 0 or (Panel_Window_NpcShop.npcShop).lastTabIndex == nil then
        shopItemWrapper = npcShop_getItemBuy(slotNo)
        if shopItemWrapper ~= nil then
          itemSSW = shopItemWrapper:getStaticStatus()
        end
      else
        if (Panel_Window_NpcShop.npcShop).lastTabIndex == 1 then
          itemSSW = npcShop_getItemWrapperByShopSlotNo(slotNo)
          isSSW = false
        else
          itemSSW = npcShop_getItemRepurchaseForToolTip(slotNo)
          isItemWrapper = true
          isSSW = false
        end
      end
      inven = true
      parent = true
    else
      do
        if slotType == "workListMilibogi" then
          itemSSW = HouseControl_getItemStaticStatusByIndex(slotNo)
        else
          if slotType == "tradeMarket" then
            itemSSW = global_TradeMarketGraph_StaticStatus(slotNo)
          else
            if slotType == "tradeMarket_Buy" then
              itemSSW = (npcShop_getItemBuy(slotNo)):getStaticStatus()
            else
              if slotType == "tradeSupply" then
                local shopItemWrapper = ToClient_worldmap_getTradeSupplyItem(TradeNpcItemInfo_getTerritoryKey(), slotNo - 1)
                if shopItemWrapper ~= nil then
                  itemSSW = shopItemWrapper:getStaticStatus()
                end
              else
                do
                  if slotType == "tradeEventInfo" then
                    local shopItemWrapper = ToClient_worldmap_getTradeSupplyItem(index, slotNo)
                    if shopItemWrapper ~= nil then
                      itemSSW = shopItemWrapper:getStaticStatus()
                    end
                  else
                    do
                      if slotType == "product_source" then
                        local informationWrapper = product_GetSourceItem(slotNo)
                        if informationWrapper ~= nil then
                          itemSSW = informationWrapper:getStaticStatus()
                          if itemSSW ~= nil then
                            showTooltip_Item(normalTooltip, itemSSW, true, false)
                          end
                        end
                      else
                        do
                          if slotType == "Socket_Insert" then
                            local mainSlotNo = Socket_GetSlotNo()
                            local invenItemWrapper = getInventoryItem(mainSlotNo)
                            if invenItemWrapper ~= nil then
                              itemSSW = invenItemWrapper:getPushedItem(slotNo - 1)
                            end
                          else
                            do
                              if slotType == "popupItem" then
                                local ESSWrapper = getPopupIteWrapper()
                                if ESSWrapper ~= nil then
                                  itemSSW = ESSWrapper:getPopupItemAt(slotNo - 1)
                                end
                              else
                                do
                                  if slotType == "TerritoryAuth_Auction" then
                                    local myAuctionInfo = RequestGetAuctionInfo()
                                    itemSSW = myAuctionInfo:getTerritoryTradeitem(slotNo)
                                  else
                                    do
                                      if slotType == "Dialog_ChallengeReward_Base" or slotType == "Dialog_ChallengeReward_Select" then
                                        itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(slot._item))
                                      else
                                        if slotType == "Dialog_ChallengePcroomReward_Base" or slotType == "Dialog_ChallengePcroomReward_Select" then
                                          itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(slot._item))
                                        else
                                          if slotType == "DailyStamp" then
                                            itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(slotNo))
                                          else
                                            if slotType == "masterpiecdAuction" then
                                              local myAuctionInfo = (RequestGetAuctionInfo())
                                              local goodsInfo = nil
                                              if (CppEnums.AuctionTabType).AuctionTab_SellItem == index then
                                                goodsInfo = myAuctionInfo:getItemAuctionListAt(slotNo)
                                              else
                                                if (CppEnums.AuctionTabType).AuctionTab_MySellPage == index then
                                                  goodsInfo = myAuctionInfo:getMySellingItemAuctionAt(slotNo)
                                                else
                                                  if (CppEnums.AuctionTabType).AuctionTab_MyBidPage == index then
                                                    goodsInfo = myAuctionInfo:getMyItemBidListAt(slotNo)
                                                  end
                                                end
                                              end
                                              if goodsInfo == nil then
                                                return 
                                              end
                                              local itemWrapper = goodsInfo:getItem()
                                              itemSSW = itemWrapper:getStaticStatus()
                                            else
                                              do
                                                ;
                                                (UI.ASSERT)(false, "showTooltip(static)으로 정의되지 않은 slot�\128�\133(" .. slotType .. ")�\180 들어왔습니다. 확인해주세요.")
                                                do return  end
                                                if itemSSW == nil then
                                                  return 
                                                end
                                                local skillKey = SkillKey()
                                                local isSkillBook = false
                                                if isSSW == true and isItemWrapper == false then
                                                  isSkillBook = itemSSW:isSkillBook(skillKey)
                                                else
                                                  isSkillBook = (itemSSW:getStaticStatus()):isSkillBook(skillKey)
                                                end
                                                -- DECOMPILER ERROR at PC289: Confused about usage of register: R12 in 'UnsetPending'

                                                if isSkillBook then
                                                  Panel_Tooltip_Item_DataObject.isSkill = true
                                                  -- DECOMPILER ERROR at PC291: Confused about usage of register: R12 in 'UnsetPending'

                                                  Panel_Tooltip_Item_DataObject.skillSlot = slot
                                                  Panel_SkillTooltip_Show(skillKey:getSkillNo(), false, "itemToSkill", false)
                                                  return 
                                                end
                                                -- DECOMPILER ERROR at PC301: Confused about usage of register: R12 in 'UnsetPending'

                                                Panel_Tooltip_Item_DataObject.isSkill = false
                                                local isEquipalbeItem, servantItem = showTooltip_Item(normalTooltip, itemSSW, isSSW, isItemWrapper)
                                                if isEquipalbeItem then
                                                  local equipItemWrapper = nil
                                                  if servantItem then
                                                    local temporaryWrapper = getTemporaryInformationWrapper()
                                                    if temporaryWrapper ~= nil and temporaryWrapper:isSelfVehicle() then
                                                      if isItemWrapper or not isSSW then
                                                        equipItemWrapper = (temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)):getEquipItem((itemSSW:getStaticStatus()):getEquipSlotNo())
                                                      else
                                                        equipItemWrapper = (temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)):getEquipItem(itemSSW:getEquipSlotNo())
                                                      end
                                                    end
                                                  else
                                                    do
                                                      do
                                                        if isItemWrapper or not isSSW then
                                                          equipItemWrapper = getEquipmentItem((itemSSW:getStaticStatus()):getEquipSlotNo())
                                                        else
                                                          equipItemWrapper = getEquipmentItem(itemSSW:getEquipSlotNo())
                                                        end
                                                        if equipItemWrapper ~= nil and not servantItem then
                                                          showTooltip_Item(equippedTooltip, equipItemWrapper, false, true)
                                                        end
                                                        if ((slot.icon):getParent()):IsUISubApp() then
                                                          Panel_Tooltip_Item_Set_Position_UISubApp((slot.icon):getParent())
                                                          ;
                                                          (normalTooltip.mainPanel):OpenUISubApp()
                                                          if equipItemWrapper ~= nil then
                                                            (equippedTooltip.mainPanel):OpenUISubApp()
                                                          end
                                                        else
                                                          Panel_Tooltip_Item_Set_Position((slot.icon):getParent())
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
          end
        end
      end
    end
  end
end

Panel_Tooltip_Item_Show_General = function(slotNo, slotType, isOn, isNormal, index)
  -- function num : 0_10 , upvalues : Panel_Tooltip_Item_DataObject, normalTooltip, equippedTooltip, UI_RewardType
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R5 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.itemMarket = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R5 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.inventory = nil
  if isOn ~= true then
    if Panel_Tooltip_Item_DataObject.currentSlotNo == slotNo then
      Panel_Tooltip_Item_hideTooltip()
      -- DECOMPILER ERROR at PC13: Confused about usage of register: R5 in 'UnsetPending'

      Panel_Tooltip_Item_DataObject.currentSlotNo = -1
      -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

      Panel_Tooltip_Item_DataObject.currentSlotType = ""
      -- DECOMPILER ERROR at PC17: Confused about usage of register: R5 in 'UnsetPending'

      Panel_Tooltip_Item_DataObject.index = -1
    end
    return false
  end
  if slotNo < 0 then
    return false
  end
  Panel_Tooltip_Item_hideTooltip()
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R5 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.currentSlotNo = slotNo
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R5 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.currentSlotType = slotType
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R5 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.index = index
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R5 in 'UnsetPending'

  Panel_Tooltip_Item_DataObject.isNormal = isNormal
  -- DECOMPILER ERROR at PC35: Confused about usage of register: R5 in 'UnsetPending'

  normalTooltip.deltaTime = 0
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R5 in 'UnsetPending'

  equippedTooltip.deltaTime = 0
  local slot = ((Panel_Tooltip_Item_DataObject.slotData)[slotType])[slotNo]
  if slot == nil then
    return false
  end
  if slot._type ~= nil and (UI_RewardType.RewardType_Exp == slot._type or UI_RewardType.RewardType_SkillExp == slot._type or UI_RewardType.RewardType_ProductExp == slot._type) then
    return false
  end
  return true
end

local linkItemTooltipParent = nil
Panel_Tooltip_Item_chattingLinkedItem_Set_Position = function(positionData, isClicked)
  -- function num : 0_11 , upvalues : linkItemTooltipParent
  local target = nil
  if isClicked then
    target = Panel_Tooltip_Item_chattingLinkedItemClick
    linkItemTooltipParent = positionData
  else
    target = Panel_Tooltip_Item_chattingLinkedItem
  end
  local chattingLinkedItemShow = target:GetShow()
  if not chattingLinkedItemShow then
    return 
  end
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  local itemLinkedPosX = target:GetSizeX()
  local itemLinkedPosY = target:GetSizeY()
  local posX = positionData:GetParentPosX()
  local posY = positionData:GetParentPosY()
  local isLeft = screenSizeX / 2 < posX
  local isTop = screenSizeY / 2 < posY
  if not isLeft then
    posX = posX + positionData:GetSizeX()
  end
  if isTop then
    posY = posY + positionData:GetSizeY()
    local yDiff = posY - itemLinkedPosY
    if yDiff < 0 then
      posY = posY - yDiff
    end
  else
    local yDiff = screenSizeY - (posY + itemLinkedPosY)
    if yDiff < 0 then
      posY = posY + yDiff
    end
  end
  if isLeft then
    posX = posX - itemLinkedPosX
  end
  do
    local yTmp = posY
    if isTop then
      yTmp = yTmp - itemLinkedPosY
    end
    target:SetPosX(posX)
    target:SetPosY(yTmp)
    if Panel_Tooltip_Item_chattingLinkedItemClick:GetShow() and target ~= Panel_Tooltip_Item_chattingLinkedItemClick then
      if positionData == linkItemTooltipParent then
        if isLeft then
          target:SetPosX(posX - Panel_Tooltip_Item_chattingLinkedItemClick:GetSizeX())
        else
          target:SetPosX(posX + Panel_Tooltip_Item_chattingLinkedItemClick:GetSizeX())
        end
      else
        target:SetPosX(posX)
      end
      target:SetPosY(yTmp)
    end
    -- DECOMPILER ERROR: 11 unprocessed JMP targets
  end
end

Panel_Tooltip_Item_Set_Position_UISubApp = function(positionData, parent, inven)
  -- function num : 0_12 , upvalues : equippedTooltip, normalTooltip
  local itemShow = Panel_Tooltip_Item:GetShow()
  local equipItemShow = Panel_Tooltip_Item_equipped:GetShow()
  if not itemShow and not equipItemShow then
    return 
  end
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  local itemPosX = Panel_Tooltip_Item:GetSizeX()
  local itemPosY = Panel_Tooltip_Item:GetSizeY()
  local itemEquipPosX = Panel_Tooltip_Item_equipped:GetSizeX()
  local itemEquipPosY = Panel_Tooltip_Item_equipped:GetSizeY()
  local posX = positionData:GetScreenParentPosX()
  local posY = positionData:GetScreenParentPosY()
  if parent and inven then
    posX = (positionData:getParent()):GetScreenParentPosX()
    posY = (positionData:getParent()):GetScreenParentPosY() + 10
  else
    if parent then
      posX = (positionData:getParent()):GetScreenParentPosX()
      posY = (positionData:getParent()):GetScreenParentPosY() - 500
    end
  end
  local isLeft = screenSizeX / 2 < posX
  local isTop = screenSizeY / 2 < posY
  local tooltipSize = {width = 0, height = 0}
  local tooltipEquipped = {width = 0, height = 0}
  local sumSize = {width = 0, height = 0}
  if Panel_Tooltip_Item:GetShow() then
    tooltipSize.width = Panel_Tooltip_Item:GetSizeX()
    tooltipSize.height = Panel_Tooltip_Item:GetSizeY()
    sumSize.width = sumSize.width + tooltipSize.width
    sumSize.height = (math.max)(sumSize.height, tooltipSize.height)
  end
  if Panel_Tooltip_Item_equipped:GetShow() then
    tooltipEquipped.width = Panel_Tooltip_Item_equipped:GetSizeX()
    tooltipEquipped.height = Panel_Tooltip_Item_equipped:GetSizeY()
    sumSize.width = sumSize.width + tooltipEquipped.width
    sumSize.height = (math.max)(sumSize.height, tooltipEquipped.height)
  end
  if not isLeft then
    if parent and inven then
      posX = (positionData:getParent()):GetSizeX() + posX
    else
      posX = posX + (positionData:getParent()):GetSizeX() + positionData:GetSizeX()
    end
  end
  if Panel_Tooltip_Item:GetShow() then
    if isLeft then
      posX = posX - tooltipSize.width
    end
    local yTmp = posY
    if isTop then
      do
        Panel_Tooltip_Item:SetPosX(posX)
        Panel_Tooltip_Item:SetPosY(yTmp)
        if Panel_Tooltip_Item_equipped:GetShow() then
          if isLeft then
            posX = posX - tooltipEquipped.width
          else
            posX = posX + tooltipSize.width
          end
          local yTmp = posY
          if isTop then
            do
              do
                Panel_Tooltip_Item_equipped:SetPosX(posX)
                Panel_Tooltip_Item_equipped:SetPosY(yTmp)
                if (equippedTooltip.mainPanel):GetShow() and (normalTooltip.mainPanel):GetShow() then
                  local arrow = equippedTooltip.arrow
                  if Panel_Tooltip_Item:GetPosX() < Panel_Tooltip_Item_equipped:GetPosX() then
                    (equippedTooltip.arrow):SetShow(false)
                    arrow = equippedTooltip.arrow_L
                    arrow:SetShow(true)
                    arrow:SetPosY(((equippedTooltip.mainPanel):GetSizeY() - arrow:GetSizeY()) / 2)
                    arrow:SetPosX(-arrow:GetSizeX() / 2)
                  else
                    (equippedTooltip.arrow_L):SetShow(false)
                    arrow = equippedTooltip.arrow
                    arrow:SetShow(true)
                    arrow:SetPosY(((equippedTooltip.mainPanel):GetSizeY() - arrow:GetSizeY()) / 2)
                    arrow:SetPosX((equippedTooltip.mainPanel):GetSizeX() - arrow:GetSizeX() / 2)
                  end
                else
                  (equippedTooltip.arrow):SetShow(false)
                  ;
                  (equippedTooltip.arrow_L):SetShow(false)
                end
                -- DECOMPILER ERROR: 16 unprocessed JMP targets
              end
            end
          end
        end
      end
    end
  end
end

Panel_Tooltip_Item_Set_Position = function(positionData, parent, inven)
  -- function num : 0_13 , upvalues : equippedTooltip, normalTooltip
  local itemShow = Panel_Tooltip_Item:GetShow()
  local equipItemShow = Panel_Tooltip_Item_equipped:GetShow()
  if not itemShow and not equipItemShow then
    return 
  end
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  local itemPosX = Panel_Tooltip_Item:GetSizeX()
  local itemPosY = Panel_Tooltip_Item:GetSizeY()
  local itemEquipPosX = Panel_Tooltip_Item_equipped:GetSizeX()
  local itemEquipPosY = Panel_Tooltip_Item_equipped:GetSizeY()
  local posX = positionData:GetParentPosX()
  local posY = positionData:GetParentPosY()
  if parent and inven then
    posX = (positionData:getParent()):GetPosX() + 7
    posY = (positionData:getParent()):GetPosY() + 10
  else
    if parent then
      posX = (positionData:getParent()):GetParentPosX()
      posY = (positionData:getParent()):GetParentPosY() - 500
    end
  end
  local isLeft = screenSizeX / 2 < posX
  local isTop = screenSizeY / 2 < posY
  local tooltipSize = {width = 0, height = 0}
  local tooltipEquipped = {width = 0, height = 0}
  do
    local sumSize = {width = 0, height = 0}
    if Panel_Tooltip_Item:GetShow() then
      tooltipSize.width = Panel_Tooltip_Item:GetSizeX()
      tooltipSize.height = Panel_Tooltip_Item:GetSizeY()
      sumSize.width = sumSize.width + tooltipSize.width
      sumSize.height = (math.max)(sumSize.height, tooltipSize.height)
    end
    if Panel_Tooltip_Item_equipped:GetShow() then
      tooltipEquipped.width = Panel_Tooltip_Item_equipped:GetSizeX()
      tooltipEquipped.height = Panel_Tooltip_Item_equipped:GetSizeY()
      sumSize.width = sumSize.width + tooltipEquipped.width
      sumSize.height = (math.max)(sumSize.height, tooltipEquipped.height)
    end
    if not isLeft then
      if parent and inven then
        posX = (positionData:getParent()):GetSizeX() + (positionData:getParent()):GetParentPosX()
      else
        posX = posX + positionData:GetSizeX()
      end
    end
    if isTop then
      posY = posY + positionData:GetSizeY()
      local yDiff = posY - sumSize.height
      if yDiff < 0 then
        posY = posY - yDiff
      end
    else
      local yDiff = screenSizeY - (posY + sumSize.height)
      if yDiff < 0 then
        posY = posY + yDiff
      end
    end
    if Panel_Tooltip_Item:GetShow() then
      if isLeft then
        posX = posX - tooltipSize.width
      end
      local yTmp = posY
      if isTop then
        yTmp = yTmp - tooltipSize.height
      end
      Panel_Tooltip_Item:SetPosX(posX)
      Panel_Tooltip_Item:SetPosY(yTmp)
    end
    if Panel_Tooltip_Item_equipped:GetShow() then
      if isLeft then
        posX = posX - tooltipEquipped.width
      else
        posX = posX + tooltipSize.width
      end
      local yTmp = posY
      if isTop then
        yTmp = yTmp - tooltipEquipped.height
      end
      Panel_Tooltip_Item_equipped:SetPosX(posX)
      Panel_Tooltip_Item_equipped:SetPosY(yTmp)
    end
    if (equippedTooltip.mainPanel):GetShow() and (normalTooltip.mainPanel):GetShow() then
      local arrow = equippedTooltip.arrow
      if Panel_Tooltip_Item:GetPosX() < Panel_Tooltip_Item_equipped:GetPosX() then
        (equippedTooltip.arrow):SetShow(false)
        arrow = equippedTooltip.arrow_L
        arrow:SetShow(true)
        arrow:SetPosY(((equippedTooltip.mainPanel):GetSizeY() - arrow:GetSizeY()) / 2)
        arrow:SetPosX(-arrow:GetSizeX() / 2)
      else
        (equippedTooltip.arrow_L):SetShow(false)
        arrow = equippedTooltip.arrow
        arrow:SetShow(true)
        arrow:SetPosY(((equippedTooltip.mainPanel):GetSizeY() - arrow:GetSizeY()) / 2)
        arrow:SetPosX((equippedTooltip.mainPanel):GetSizeX() - arrow:GetSizeX() / 2)
      end
    else
      (equippedTooltip.arrow):SetShow(false)
      ;
      (equippedTooltip.arrow_L):SetShow(false)
    end
    -- DECOMPILER ERROR: 18 unprocessed JMP targets
  end
end

Panel_Tooltip_Item_hideTooltip = function()
  -- function num : 0_14 , upvalues : Panel_Tooltip_Item_DataObject
  if Panel_Tooltip_Item_DataObject.isSkill then
    Panel_SkillTooltip_Hide()
    return 
  end
  if Panel_Tooltip_Item:IsShow() then
    Panel_Tooltip_Item:SetShow(false, false)
    Panel_Tooltip_Item:CloseUISubApp()
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

    Panel_Tooltip_Item_DataObject.currentSlotNo = -1
  end
  if Panel_Tooltip_Item_equipped:IsShow() then
    Panel_Tooltip_Item_equipped:SetShow(false, false)
    Panel_Tooltip_Item_equipped:CloseUISubApp()
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

    Panel_Tooltip_Item_DataObject.currentSlotNo = -1
  end
  if Panel_Tooltip_Item_chattingLinkedItem:IsShow() then
    Panel_Tooltip_Item_chattingLinkedItem:SetShow(false, false)
    -- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

    Panel_Tooltip_Item_DataObject.currentSlotNo = -1
  end
end

Panel_Tooltip_Item_chattingLinkedItem_hideTooltip = function()
  -- function num : 0_15
  if Panel_Tooltip_Item_chattingLinkedItem:IsShow() then
    Panel_Tooltip_Item_chattingLinkedItem:SetShow(false, false)
  end
end

Panel_Tooltip_Item_chattingLinkedItemClick_hideTooltip = function()
  -- function num : 0_16 , upvalues : linkItemTooltipParent
  if Panel_Tooltip_Item_chattingLinkedItemClick:IsShow() then
    linkItemTooltipParent = nil
    Panel_Tooltip_Item_chattingLinkedItemClick:SetShow(false, false)
  end
end

_toolTip_ChangeDyeInfoTexture = function(target, bEmpty, dyeingPart_Index, dyeingPartColor)
  -- function num : 0_17 , upvalues : UI_color
  local texturePath = "New_UI_Common_forLua/Widget/ToolTip/ToolTip_00.dds"
  local control = (target.useDyeColorIcon_Part)[dyeingPart_Index]
  if not bEmpty then
    control:ChangeTextureInfoName(texturePath)
    local x1, y1, x2, y2 = setTextureUV_Func(control, 75, 43, 93, 61)
    ;
    (control:getBaseTexture()):setUV(x1, y1, x2, y2)
    control:setRenderTexture(control:getBaseTexture())
    control:SetAlphaIgnore(true)
    control:SetColor(dyeingPartColor)
  else
    do
      control:ChangeTextureInfoName(texturePath)
      local x1, y1, x2, y2 = setTextureUV_Func(control, 98, 43, 116, 61)
      ;
      (control:getBaseTexture()):setUV(x1, y1, x2, y2)
      control:setRenderTexture(control:getBaseTexture())
      control:SetAlphaIgnore(true)
      control:SetColor(UI_color.C_FFFFFFFF)
    end
  end
end

Panel_Tooltip_Item_ShowInfo = function(target, inputValue, isSSW, isItemWrapper, chattingLinkedItem, index, isNextEnchantInfo, invenSlotNo)
  -- function num : 0_18 , upvalues : equippedTooltip, clothBagSlotNo, normalTooltip, UI_color, UI_TM, isExtractionCommon, isExtractionJapan, Panel_Tooltip_Item_DataObject, isItemLock, EquipItem_Lock, servantKindTypeString, isGrowthContents, isTotemContents, chattingLinkedItemTooltip, chattingLinkedItemClickTooltip, GetBottomPos
  (target.expireIcon_white):SetShow(false)
  ;
  (target.expireIcon_red):SetShow(false)
  ;
  (target.expireIcon_end):SetShow(false)
  local itemSSW, itemWrapper, item, itemKeyForTradeInfo = nil, nil, nil, nil
  if isSSW and not isItemWrapper then
    itemSSW = inputValue
    if itemSSW == nil then
      (target.mainPanel):SetShow(false, false)
      ;
      (target.mainPanel):CloseUISubApp()
      return false, false
    end
    item = itemSSW:get()
    itemKeyForTradeInfo = ((itemSSW:get())._key):get()
  else
    itemWrapper = inputValue
    if itemWrapper == nil then
      (target.mainPanel):SetShow(false, false)
      ;
      (target.mainPanel):CloseUISubApp()
      return false, false
    end
    itemSSW = itemWrapper:getStaticStatus()
    item = itemWrapper:get()
    itemKeyForTradeInfo = ((itemSSW:get())._key):get()
  end
  if equippedTooltip == target and isNextEnchantInfo == true then
    (equippedTooltip.equippedTag):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_NEXT_ENCHANT"))
    local nextEnchantLevel = ((itemSSW:get())._key):getEnchantLevel() + 1
    if nextEnchantLevel > 20 then
      (target.mainPanel):SetShow(false, false)
      ;
      (target.mainPanel):CloseUISubApp()
      return false, false
    end
    local enchantItemKey = ItemEnchantKey(((itemSSW:get())._key):getItemKey(), nextEnchantLevel)
    enchantItemKey:set(((itemSSW:get())._key):getItemKey(), nextEnchantLevel)
    itemSSW = getItemEnchantStaticStatus(enchantItemKey)
    if itemSSW == nil or itemSSW:get() == nil then
      (target.mainPanel):SetShow(false, false)
      ;
      (target.mainPanel):CloseUISubApp()
      return false, false
    end
    itemKeyForTradeInfo = ((itemSSW:get())._key):get()
  else
    do
      ;
      (equippedTooltip.equippedTag):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_CURRENT_EQUIP"))
      if invenSlotNo ~= nil then
        clothBagSlotNo = invenSlotNo
      end
      if normalTooltip == target then
        (normalTooltip.bagSize):SetShow(false)
        ;
        (normalTooltip.equipmentInBag):SetShow(false)
        if (CppEnums.ContentsEventType).ContentsType_InventoryBag == (itemSSW:get()):getContentsEventType() and clothBagSlotNo ~= nil then
          local bagSize = itemSSW:getContentsEventParam2()
          local whereType = (CppEnums.ItemWhereType).eInventory
          if (itemSSW:get()):isCash() then
            whereType = (CppEnums.ItemWhereType).eCashInventory
          end
          ;
          (normalTooltip.bagSize):SetShow(true)
          ;
          (normalTooltip.bagSize):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_BAGSIZE", "size", bagSize))
          local itemNameinBag = ""
          for index = 0, bagSize - 1 do
            local bagItemWrapper = getInventoryBagItemByType(whereType, clothBagSlotNo, index)
            if bagItemWrapper ~= nil then
              if itemNameinBag == "" then
                itemNameinBag = tostring((bagItemWrapper:getStaticStatus()):getName())
              else
                itemNameinBag = itemNameinBag .. "\n" .. tostring((bagItemWrapper:getStaticStatus()):getName())
              end
            end
          end
          if itemNameinBag == "" then
            (normalTooltip.equipmentInBag):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_BAG_EMPTY"))
          else
            ;
            (normalTooltip.equipmentInBag):SetText(itemNameinBag)
          end
          ;
          (normalTooltip.equipmentInBag):SetShow(true)
        end
      end
      do
        local tradeInfo = nil
        local tradeSummaryInfo = getItemMarketSummaryInClientByItemEnchantKey(itemKeyForTradeInfo)
        local tradeMasterInfo = getItemMarketMasterByItemEnchantKey(itemKeyForTradeInfo)
        local itemClassifyType = itemSSW:getItemClassify()
        if tradeSummaryInfo ~= nil then
          tradeInfo = tradeSummaryInfo
        else
          if tradeMasterInfo ~= nil then
            tradeInfo = tradeMasterInfo
          else
            tradeInfo = nil
          end
        end
        if tradeInfo ~= nil then
          local tradeMasterItemName = (tradeInfo:getItemEnchantStaticStatusWrapper()):getName()
          if tradeSummaryInfo ~= nil and toInt64(0, 0) ~= tradeSummaryInfo:getDisplayedTotalAmount() then
            (target.tradeInfo_Value):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_TRADEINFO_REGISTPRICE", "highestOnePrice", makeDotMoney(tradeInfo:getDisplayedHighestOnePrice()), "LowestOnePrice", makeDotMoney(tradeInfo:getDisplayedLowestOnePrice())))
          else
            ;
            (target.tradeInfo_Value):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_TRADEINFO_HIGHANDLOWPRICE", "getMaxPrice", makeDotMoney(tradeMasterInfo:getMaxPrice()), "getMinPrice", makeDotMoney(tradeMasterInfo:getMinPrice())))
          end
          ;
          (target.tradeInfo_Panel):SetShow(true)
          ;
          (target.tradeInfo_Title):SetShow(true)
          ;
          (target.tradeInfo_Value):SetShow(true)
        else
          do
            ;
            (target.tradeInfo_Panel):SetShow(false)
            ;
            (target.tradeInfo_Title):SetShow(false)
            ;
            (target.tradeInfo_Value):SetShow(false)
            ;
            (target.equipSlotName):SetShow(false)
            do
              if itemSSW:getItemType() == 1 then
                local EquipslotNo = itemSSW:getEquipSlotNo()
                if EquipslotNo == 21 then
                  (target.equipSlotName):SetShow(true)
                  ;
                  (target.equipSlotName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_EQUIPSLOTNAME_HEAD"))
                else
                  if EquipslotNo == 22 then
                    (target.equipSlotName):SetShow(true)
                    ;
                    (target.equipSlotName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_EQUIPSLOTNAME_EYES"))
                  else
                    if EquipslotNo == 23 then
                      (target.equipSlotName):SetShow(true)
                      ;
                      (target.equipSlotName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_EQUIPSLOTNAME_MOUSE"))
                    end
                  end
                end
              end
              local classType = (getSelfPlayer()):getClassType()
              local nameColorGrade = itemSSW:getGradeType()
              if nameColorGrade == 0 then
                (target.itemName):SetFontColor(UI_color.C_FFFFFFFF)
              else
                if nameColorGrade == 1 then
                  (target.itemName):SetFontColor(4284350320)
                else
                  if nameColorGrade == 2 then
                    (target.itemName):SetFontColor(4283144191)
                  else
                    if nameColorGrade == 3 then
                      (target.itemName):SetFontColor(4294953010)
                    else
                      if nameColorGrade == 4 then
                        (target.itemName):SetFontColor(4294929408)
                      else
                        ;
                        (target.itemName):SetFontColor(UI_color.C_FFFFFFFF)
                      end
                    end
                  end
                end
              end
              ;
              (target.itemIcon):ChangeTextureInfoName("icon/" .. itemSSW:getIconPath())
              local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
              if enchantLevel > 0 and enchantLevel < 16 then
                (target.enchantLevel):SetText("+" .. tostring(enchantLevel))
                ;
                (target.enchantLevel):SetShow(true)
              else
                if enchantLevel == 16 then
                  (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
                  ;
                  (target.enchantLevel):SetShow(true)
                else
                  if enchantLevel == 17 then
                    (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
                    ;
                    (target.enchantLevel):SetShow(true)
                  else
                    if enchantLevel == 18 then
                      (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
                      ;
                      (target.enchantLevel):SetShow(true)
                    else
                      if enchantLevel == 19 then
                        (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
                        ;
                        (target.enchantLevel):SetShow(true)
                      else
                        if enchantLevel == 20 then
                          (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
                          ;
                          (target.enchantLevel):SetShow(true)
                        else
                          ;
                          (target.enchantLevel):SetShow(false)
                        end
                      end
                    end
                  end
                end
              end
              if (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
                if enchantLevel == 1 then
                  (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_1"))
                  ;
                  (target.enchantLevel):SetShow(true)
                else
                  if enchantLevel == 2 then
                    (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_2"))
                    ;
                    (target.enchantLevel):SetShow(true)
                  else
                    if enchantLevel == 3 then
                      (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_3"))
                      ;
                      (target.enchantLevel):SetShow(true)
                    else
                      if enchantLevel == 4 then
                        (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_4"))
                        ;
                        (target.enchantLevel):SetShow(true)
                      else
                        if enchantLevel == 5 then
                          (target.enchantLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ENCHANTLEVEL_5"))
                          ;
                          (target.enchantLevel):SetShow(true)
                        end
                      end
                    end
                  end
                end
              end
              if (itemSSW:get()):isCash() then
                (target.enchantLevel):SetShow(false)
              end
              ;
              (target.itemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
              if itemSSW:getItemType() == 1 and enchantLevel > 15 then
                (target.itemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel) .. " " .. itemSSW:getName())
              else
                if enchantLevel > 0 and (CppEnums.ItemClassifyType).eItemClassify_Accessory == itemSSW:getItemClassify() then
                  (target.itemName):SetText(HighEnchantLevel_ReplaceString(enchantLevel + 15) .. " " .. itemSSW:getName())
                else
                  ;
                  (target.itemName):SetText(itemSSW:getName())
                end
              end
              local changeItemNamePos = 25
              if (target.itemName):GetLineCount() > 1 then
                changeItemNamePos = ((target.itemName):GetLineCount() - 1) * 11 + 25
              end
              local item_type = itemSSW:getItemType()
              local isTradeItem = itemSSW:isTradeAble()
              if item_type == 1 then
                (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIPMENT"))
              else
                if item_type == 2 then
                  if isTradeItem == true then
                    (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TRADE_ITEM"))
                  else
                    ;
                    (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_CONSUME"))
                  end
                else
                  if item_type == 3 then
                    (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TENT_TOOL"))
                  else
                    if item_type == 4 then
                      (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_INSTALL_TOOL"))
                    else
                      if item_type == 5 then
                        (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_SOCKET_ITEM"))
                      else
                        if item_type == 6 then
                          (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_CANNONBALL"))
                        else
                          if item_type == 7 then
                            (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_LICENCE"))
                          else
                            if item_type == 8 then
                              (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_PRODUCTION"))
                            else
                              if item_type == 9 then
                                (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_ENTER_AIR"))
                              else
                                if item_type == 10 then
                                  (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_SPECIAL_PRODUCTION"))
                                else
                                  if (itemSSW:get()):isForJustTrade() == true then
                                    (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOMAL") .. "/" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TRADE_ITEM"))
                                  else
                                    ;
                                    (target.itemType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOMAL"))
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
              if item_type == 8 and (itemSSW:get()):isForJustTrade() == true then
                (target.itemType):SetText((target.itemType):GetText() .. "/" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TRADE_ITEM"))
              end
              ;
              (target.isSealed):SetShow(false)
              if itemSSW:isEquipable() and not isSSW and not (itemSSW:get()):isCash() and item:isSealed() then
                (target.isSealed):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_ISEQUIPSEAL"))
                ;
                (target.isSealed):SetShow(true)
              end
              local isAble = false
              if itemWrapper ~= nil then
                isAble = requestIsRegisterItemForItemMarket((itemWrapper:get()):getKey())
              end
              if (itemSSW:get()):isCash() and not isSSW and isAble and item:isSealed() and not itemSSW:isStackable() and not item:isVested() then
                (target.isSealed):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_TAXFREE"))
                ;
                (target.isSealed):SetShow(true)
              end
              ;
              (target.isEnchantable):SetShow(false)
              local isPossibleToEnchant = (itemSSW:get()):isEnchantable()
              if itemSSW:isEquipable() then
                if isPossibleToEnchant == false then
                  (target.isEnchantable):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOT_ENCHANT"))
                  ;
                  (target.isEnchantable):SetShow(true)
                else
                  ;
                  (target.isEnchantable):SetShow(false)
                end
              end
              local interiorPoint = 0
              if (itemSSW:get()):isItemInstallation() then
                interiorPoint = ((itemSSW:getCharacterStaticStatus()):getObjectStaticStatus()):getInteriorSensPoint()
                if interiorPoint > 0 then
                  (target.isEnchantable):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_INTERIOR_POINT") .. interiorPoint .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_POINT"))
                  ;
                  (target.isEnchantable):SetShow(true)
                end
              else
                if not (target.isEnchantable):GetShow() then
                  (target.isEnchantable):SetShow(false)
                end
              end
              local itemBindType = ((itemSSW:get())._vestedType):getItemKey()
              if not isSSW and item:isVested() then
                if itemSSW:isUserVested() then
                  (target.bindType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_HOLDED_FAMILYACOUNT"))
                else
                  ;
                  (target.bindType):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_HOLDED"))
                end
                ;
                (target.bindType):SetShow(true)
              else
                if itemBindType == 1 then
                  if isSSW and itemSSW:isUserVested() then
                    (target.bindType):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_GETBIND_FAMILY"))
                    ;
                    (target.bindType):SetShow(true)
                  else
                    ;
                    (target.bindType):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_GETBIND_CHARACTER"))
                    ;
                    (target.bindType):SetShow(true)
                  end
                else
                  if itemBindType == 2 then
                    if isSSW and itemSSW:isUserVested() then
                      (target.bindType):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_EQUIPBIND_FAMILY"))
                      ;
                      (target.bindType):SetShow(true)
                    else
                      ;
                      (target.bindType):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_EQUIPBIND_CHARACTER"))
                      ;
                      (target.bindType):SetShow(true)
                    end
                  else
                    ;
                    (target.bindType):SetShow(false)
                  end
                end
              end
              local balksCount = itemSSW:getExtractionCount_s64()
              local cronsCount = itemSSW:getCronCount_s64()
              if balksCount ~= nil and toInt64(0, 0) ~= balksCount and (itemSSW:get()):isCash() and (isExtractionCommon or isExtractionJapan) then
                (target.balksExtraction):SetShow(true)
                ;
                (target.balksExtraction):SetFontColor(UI_color.C_FFBC56E1)
                ;
                (target.balksExtraction):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_BALKS_EXTRACTION", "balksCount", Int64toInt32(balksCount)))
              else
                ;
                (target.balksExtraction):SetShow(false)
              end
              if cronsCount ~= nil and toInt64(0, 0) ~= cronsCount and (itemSSW:get()):isCash() and (isExtractionCommon or isExtractionJapan) then
                (target.cronsExtraction):SetShow(true)
                ;
                (target.cronsExtraction):SetFontColor(UI_color.C_FFBC56E1)
                ;
                (target.cronsExtraction):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_CRONS_EXTRACTION", "cronsCount", Int64toInt32(cronsCount)))
              else
                ;
                (target.cronsExtraction):SetShow(false)
              end
              ;
              (target.personalTrade):SetShow(false)
              if isUsePcExchangeInLocalizingValue() or (CppEnums.CountryType).DEV == getGameServiceType() then
                (target.personalTrade):SetShow(true)
                if itemWrapper ~= nil then
                  if itemSSW:isPersonalTrade() and not (itemWrapper:get()):isVested() then
                    (target.personalTrade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_PERSONALTRADE_ENABLE"))
                  else
                    ;
                    (target.personalTrade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_PERSONALTRADE_DISABLE"))
                  end
                else
                  if itemSSW ~= nil then
                    if itemSSW:isPersonalTrade() then
                      (target.personalTrade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_PERSONALTRADE_ENABLE"))
                    else
                      ;
                      (target.personalTrade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_PERSONALTRADE_DISABLE"))
                    end
                  end
                end
              end
              ;
              (target.cronStoneEnchant):SetShow(false)
              ;
              (target.cronStoneValue):SetShow(false)
              ;
              (target.cronStoneGrade):SetShow(false)
              ;
              (target.cronStoneProgressBg):SetShow(false)
              ;
              (target.cronStoneProgress):SetShow(false)
              ;
              ((target.cronStoneGradeValue)[0]):SetShow(false)
              ;
              ((target.cronStoneGradeValue)[1]):SetShow(false)
              ;
              ((target.cronStoneGradeValue)[2]):SetShow(false)
              ;
              ((target.cronStoneGradeValue)[3]):SetShow(false)
              ;
              ((target.cronStoneCountValue)[0]):SetShow(false)
              ;
              ((target.cronStoneCountValue)[1]):SetShow(false)
              ;
              ((target.cronStoneCountValue)[2]):SetShow(false)
              ;
              ((target.cronStoneCountValue)[3]):SetShow(false)
              ;
              (target.cronStoneValue):SetSize(300, (target.cronStoneValue):GetSizeY())
              ;
              (target.cronStoneValue):SetTextMode(UI_TM.eTextMode_AutoWrap)
              if (equippedTooltip ~= target or isNextEnchantInfo ~= true) and itemWrapper ~= nil then
                local currentEnchantFailCount = itemWrapper:getCronEnchantFailCount()
                if currentEnchantFailCount > 0 then
                  local itemSSW = itemWrapper:getStaticStatus()
                  local itemClassifyType = itemSSW:getItemClassify()
                  local enchantLevel = ((itemSSW:get())._key):getEnchantLevel()
                  local gradeCount = ToClient_GetCronEnchnatInfoCount(itemClassifyType, enchantLevel)
                  local startPosX = 2
                  local lastCount = 0
                  local lastIndex = gradeCount - 1
                  if gradeCount > 0 then
                    local cronEnchantSSW = ToClient_GetCronEnchantWrapper(itemClassifyType, enchantLevel, lastIndex)
                    local enchantablelastCount = cronEnchantSSW:getCount()
                    if currentEnchantFailCount > 0 then
                      for gradeIndex = 0, gradeCount - 1 do
                        local cronEnchantSSW = ToClient_GetCronEnchantWrapper(itemClassifyType, enchantLevel, gradeIndex)
                        local enchantableCount = cronEnchantSSW:getCount()
                        ;
                        ((target.cronStoneGradeValue)[gradeIndex]):SetFontColor((Defines.Color).C_FF69BB4C)
                        ;
                        ((target.cronStoneGradeValue)[gradeIndex]):SetPosX(startPosX + 300 * enchantableCount / enchantablelastCount)
                        ;
                        ((target.cronStoneCountValue)[gradeIndex]):SetText(enchantableCount)
                        ;
                        ((target.cronStoneCountValue)[gradeIndex]):SetFontColor((Defines.Color).C_FF69BB4C)
                        ;
                        ((target.cronStoneCountValue)[gradeIndex]):SetPosX(startPosX + 300 * enchantableCount / enchantablelastCount)
                        if currentEnchantFailCount < enchantableCount then
                          ((target.cronStoneCountValue)[gradeIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
                          ;
                          ((target.cronStoneGradeValue)[gradeIndex]):SetFontColor((Defines.Color).C_FFC4BEBE)
                        end
                        if gradeCount - 1 == gradeIndex then
                          lastCount = enchantableCount
                        end
                      end
                    end
                    do
                      do
                        local bonusText = ""
                        if itemWrapper:getAddedDD() > 0 then
                          if bonusText == "" then
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_ATTACK", "value", itemWrapper:getAddedDD())
                          else
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_ATTACKB", "value", itemWrapper:getAddedDD())
                          end
                        end
                        if (math.floor)(itemWrapper:getAddedHIT() / 4) > 0 then
                          if bonusText == "" then
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_HIT", "value", (math.floor)(itemWrapper:getAddedHIT() / 4))
                          else
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_HITB", "value", (math.floor)(itemWrapper:getAddedHIT() / 4))
                          end
                        end
                        if itemWrapper:getAddedDV() > 0 then
                          if bonusText == "" then
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_DODGE", "value", itemWrapper:getAddedDV())
                          else
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_DODGEB", "value", itemWrapper:getAddedDV())
                          end
                        end
                        if itemWrapper:getAddedPV() > 0 then
                          if bonusText == "" then
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_REDUCE", "value", itemWrapper:getAddedPV())
                          else
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_REDUCEB", "value", itemWrapper:getAddedPV())
                          end
                        end
                        if itemWrapper:getAddedMaxHP() > 0 then
                          if bonusText == "" then
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_HP", "value", itemWrapper:getAddedMaxHP())
                          else
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_HPB", "value", itemWrapper:getAddedMaxHP())
                          end
                        end
                        if itemWrapper:getAddedMaxMP() > 0 then
                          if bonusText == "" then
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_MP", "value", itemWrapper:getAddedMaxMP())
                          else
                            bonusText = bonusText .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_MPB", "value", itemWrapper:getAddedMaxMP())
                          end
                        end
                        if bonusText == "" then
                          bonusText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_NOTHING")
                        end
                        ;
                        (target.cronStoneEnchant):SetShow(true)
                        ;
                        (target.cronStoneValue):SetShow(true)
                        ;
                        (target.cronStoneGrade):SetShow(true)
                        ;
                        (target.cronStoneProgressBg):SetShow(true)
                        ;
                        (target.cronStoneProgress):SetShow(true)
                        ;
                        ((target.cronStoneGradeValue)[0]):SetShow(true)
                        ;
                        ((target.cronStoneGradeValue)[1]):SetShow(true)
                        ;
                        ((target.cronStoneGradeValue)[2]):SetShow(true)
                        ;
                        ((target.cronStoneGradeValue)[3]):SetShow(true)
                        ;
                        ((target.cronStoneCountValue)[0]):SetShow(true)
                        ;
                        ((target.cronStoneCountValue)[1]):SetShow(true)
                        ;
                        ((target.cronStoneCountValue)[2]):SetShow(true)
                        ;
                        ((target.cronStoneCountValue)[3]):SetShow(true)
                        ;
                        (target.cronStoneGrade):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_VALUE", "failCount", currentEnchantFailCount))
                        ;
                        (target.cronStoneValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOOLTIP_CRONENCHANT_BONUS", "bonusText", bonusText))
                        ;
                        (target.cronStoneProgress):SetProgressRate(0)
                        ;
                        (target.cronStoneProgress):SetProgressRate(currentEnchantFailCount / lastCount * 100)
                        ;
                        (target.itemLock):SetShow(false)
                        if Panel_Tooltip_Item_DataObject.inventory == true and isItemLock == true and not Panel_Tooltip_Item_equipped:GetShow() then
                          local itemSSW = itemWrapper:getStaticStatus()
                          if ToClient_Inventory_CheckItemLock(Inventory_GetToolTipItemSlotNo()) and (itemSSW:get()):isCash() == false then
                            (target.itemLock):SetShow(true)
                            ;
                            (target.itemLock):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TOOLTIP_ITEM_ITEMLOCK"))
                            ;
                            (target.productNotify):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_TOOLTIP_ITEM_SHIFTCLICK") .. "\n" .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TOOLTIP_ITEM_SHIFTRCLICK_UNLOCK"))
                          else
                            ;
                            (target.itemLock):SetShow(false)
                            ;
                            (target.productNotify):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_TOOLTIP_ITEM_SHIFTCLICK") .. "\n" .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TOOLTIP_ITEM_SHIFTRCLICK_LOCK"))
                          end
                        else
                          do
                            if EquipItem_Lock.equipment == true then
                              if EquipItem_Lock.itemLock then
                                (target.itemLock):SetShow(true)
                                ;
                                (target.itemLock):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TOOLTIP_ITEM_ITEMLOCK"))
                              else
                                ;
                                (target.itemLock):SetShow(false)
                              end
                            else
                              local itemCheckLock = false
                              if EquipItem_Lock.itemAccNo ~= -1 then
                                itemCheckLock = ToClient_EquipSlot_CheckItemLock(EquipItem_Lock.itemAccNo, 1)
                                if itemCheckLock then
                                  (equippedTooltip.itemLock):SetShow(true)
                                  ;
                                  (equippedTooltip.itemLock):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TOOLTIP_ITEM_ITEMLOCK"))
                                else
                                  ;
                                  (equippedTooltip.itemLock):SetShow(false)
                                end
                              end
                            end
                            do
                              ;
                              (target.useDyeColorTitle):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[0]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[1]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[2]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[3]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[4]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[5]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[6]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[7]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[8]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[9]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[10]):SetShow(false)
                              ;
                              ((target.useDyeColorIcon_Part)[11]):SetShow(false)
                              ;
                              (target.dying):SetShow(false)
                              if itemWrapper ~= nil or chattingLinkedItem ~= nil then
                                local dyeAble = itemSSW:isDyeable()
                                if itemSSW:isEquipable() then
                                  local dyeingPartCount = 0
                                  if itemWrapper ~= nil then
                                    dyeingPartCount = itemWrapper:getDyeingPartCount()
                                  else
                                    if chattingLinkedItem ~= nil then
                                      dyeingPartCount = chattingLinkedItem:getDyeingPartCount()
                                    end
                                  end
                                  if dyeAble == true then
                                    for dyeingPart_Index = 0, dyeingPartCount - 1 do
                                      local bEmpty = false
                                      if itemWrapper ~= nil then
                                        bEmpty = itemWrapper:isEmptyDyeingPartColorAt(dyeingPart_Index)
                                        if not itemWrapper:isAllreadyDyeingSlot(dyeingPart_Index) then
                                          bEmpty = true
                                        end
                                      else
                                        if chattingLinkedItem ~= nil then
                                          bEmpty = chattingLinkedItem:isEmptyDyeingPartColorAt(dyeingPart_Index)
                                          if not chattingLinkedItem:isAllreadyDyeingSlot(dyeingPart_Index) then
                                            bEmpty = true
                                          end
                                        end
                                      end
                                      if not bEmpty then
                                        (target.dying):SetShow(true)
                                        local dyeingPartColor = nil
                                        if itemWrapper ~= nil then
                                          dyeingPartColor = itemWrapper:getDyeingPartColorAt(dyeingPart_Index)
                                        else
                                          if chattingLinkedItem ~= nil then
                                            dyeingPartColor = chattingLinkedItem:getDyeingPartColorAt(dyeingPart_Index)
                                          end
                                        end
                                        _toolTip_ChangeDyeInfoTexture(target, bEmpty, dyeingPart_Index, dyeingPartColor)
                                      else
                                        do
                                          do
                                            _toolTip_ChangeDyeInfoTexture(target, bEmpty, dyeingPart_Index, UI_color.C_FFFFFFFF)
                                            ;
                                            ((target.useDyeColorIcon_Part)[dyeingPart_Index]):SetShow(true)
                                            -- DECOMPILER ERROR at PC2071: LeaveBlock: unexpected jumping out DO_STMT

                                            -- DECOMPILER ERROR at PC2071: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                            -- DECOMPILER ERROR at PC2071: LeaveBlock: unexpected jumping out IF_STMT

                                          end
                                        end
                                      end
                                    end
                                    if dyeingPartCount > 0 then
                                      local isPearlPallete = ""
                                      if itemWrapper ~= nil and itemWrapper:isExpirationDyeing() then
                                        isPearlPallete = "(" .. PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAUGE_DYEINGPACKEAGE_TITLE") .. ")"
                                      end
                                      ;
                                      (target.useDyeColorTitle):SetShow(true)
                                      ;
                                      (target.useDyeColorTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_DYE_DYEINFO") .. isPearlPallete)
                                    end
                                  else
                                    do
                                      do
                                        ;
                                        (target.useDyeColorTitle):SetShow(true)
                                        ;
                                        (target.useDyeColorTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_DYE_DYEIMPOSSIBLE"))
                                        local useLimitShow = false
                                        local minLevel = (itemSSW:get())._minLevel
                                        local isExistMaxLevel = (itemSSW:get()):isMaxLevelRestricted()
                                        local myInfo = getSelfPlayer()
                                        local myLevel = (myInfo:get()):getLevel()
                                        local minLevelString = tostring(minLevel)
                                        local jewelLevel = 0
                                        local maxLevel = (itemSSW:get())._maxLevel
                                        local maxLevelString = tostring(maxLevel)
                                        if not isSSW then
                                          jewelLevel = item:getJewelValidLevel()
                                          if 0 ~= jewelLevel then
                                            minLevelString = minLevelString .. "(" .. tostring(minLevel + jewelLevel) .. ")"
                                          end
                                        end
                                        if isExistMaxLevel == true then
                                          if not isSSW and 0 ~= jewelLevel then
                                            maxLevelString = maxLevelString .. "(" .. tostring(maxLevel + jewelLevel) .. ")"
                                          end
                                          ;
                                          (target.useLimit_level_value):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_TOOLTIP_USEITEM_LIMIT", "minLevel", minLevelString, "maxLevel", maxLevelString))
                                          ;
                                          (target.useLimit_level_value):SetShow(true)
                                          ;
                                          (target.useLimit_level):SetShow(true)
                                          useLimitShow = true
                                          if myLevel < maxLevel then
                                            (target.useLimit_level_value):SetFontColor(UI_color.C_FFC4BEBE)
                                          end
                                        else
                                          if 1 < minLevel then
                                            if myLevel < minLevel then
                                              (target.useLimit_level_value):SetFontColor(UI_color.C_FFF26A6A)
                                            else
                                              ;
                                              (target.useLimit_level_value):SetFontColor(UI_color.C_FFC4BEBE)
                                            end
                                            ;
                                            (target.useLimit_level_value):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "PANEL_TOOLTIP_USEITEM_FROM", "limitLevel", minLevelString))
                                            ;
                                            (target.useLimit_level_value):SetShow(true)
                                            ;
                                            (target.useLimit_level):SetShow(true)
                                            useLimitShow = true
                                          else
                                            ;
                                            (target.useLimit_level_value):SetShow(false)
                                            ;
                                            (target.useLimit_level):SetShow(false)
                                          end
                                        end
                                        local craftType = nil
                                        local gather = 0
                                        fishing = 1
                                        hunting = 2
                                        cooking = 3
                                        alchemy = 4
                                        manufacture = 5
                                        training = 6
                                        trade = 7
                                        local lifeminLevel = 0
                                        local lifeType = {[0] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_GATHERING"), [1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_FISHING"), [2] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_HUNTING"), [3] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_COOKING"), [4] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_ALCHEMY"), [5] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_PROCESSING"), [6] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_OBEDIENCE"), [7] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TRADE"), [8] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_GROWTH")}
                                        local craftType = (itemSSW:get()):getLifeExperienceType()
                                        local lifeminLevel = (itemSSW:get()):getLifeMinLevel(craftType)
                                        do
                                          if 0 < lifeminLevel then
                                            local myLifeLevel = (myInfo:get()):getLifeExperienceLevel(craftType)
                                            ;
                                            (target.useLimit_level_value):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_TOOLTIP_USELIMIT_LEVEL_VALUE", "craftType", lifeType[craftType], "lifeminLevel", FGlobal_CraftLevel_Replace(lifeminLevel, craftType)))
                                            ;
                                            (target.useLimit_level_value):SetShow(true)
                                            ;
                                            (target.useLimit_level):SetShow(true)
                                            useLimitShow = true
                                            if myLifeLevel < lifeminLevel then
                                              (target.useLimit_level_value):SetFontColor(UI_color.C_FFF26A6A)
                                            else
                                              ;
                                              (target.useLimit_level_value):SetFontColor(UI_color.C_FFC4BEBE)
                                            end
                                          end
                                          local item_type = itemSSW:getItemType()
                                          local equip = {
slotNoId = {[0] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_MAINHAND"), [1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_SUBHAND"), [2] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_PICKINGTOOLS"), [3] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_UPPERBODY"), [4] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_GLOVES"), [5] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_BOOTS"), [6] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_HELM"), [7] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_NECKLACE"), [8] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"), [9] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_RING"), [10] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"), [11] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EARRING"), [12] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_WAISTBAND"), [13] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_LANTERN"), [14] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_UPPERBODY"), [15] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_GLOVES"), [16] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_BOOTS"), [17] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_HELM"), [18] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_MAINHAND"), [19] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_SUBHAND")}
, 
extendedSlotInfoArray = {}
, checkExtendedSlot = 0}
                                          ;
                                          (target.useLimit_extendedslot_value):SetShow(false)
                                          if 1 == item_type then
                                            if ItemTooltip_UsableClssTypeCheck(itemSSW) then
                                              local itemName = itemSSW:getName()
                                              local slotNoMax = itemSSW:getExtendedSlotCount()
                                              local extendedSlotString = ""
                                              local compareSlot = {}
                                              for i = 1, slotNoMax do
                                                local extendSlotNo = itemSSW:getExtendedSlotIndex(i - 1)
                                                -- DECOMPILER ERROR at PC2590: Confused about usage of register: R54 in 'UnsetPending'

                                                if slotNoMax ~= extendSlotNo then
                                                  (equip.extendedSlotInfoArray)[extendSlotNo] = i
                                                  equip.checkExtendedSlot = 1
                                                  compareSlot[i] = extendSlotNo
                                                  local compareCheck = false
                                                  if 1 == i then
                                                    extendedSlotString = extendedSlotString .. ", " .. (equip.slotNoId)[extendSlotNo]
                                                  else
                                                    if 1 < i then
                                                      extendedSlotString = extendedSlotString .. ", " .. (equip.slotNoId)[extendSlotNo]
                                                    end
                                                  end
                                                end
                                              end
                                              if 1 == equip.checkExtendedSlot then
                                                local selfSlotNo = itemSSW:getEquipSlotNo()
                                                -- DECOMPILER ERROR at PC2625: Confused about usage of register: R50 in 'UnsetPending'

                                                ;
                                                (equip.extendedSlotInfoArray)[selfSlotNo] = selfSlotNo
                                                ;
                                                (target.useLimit_extendedslot_value):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EXTENDEDSLOT", "selfSlotNo", (equip.slotNoId)[selfSlotNo], "extendedSlotString", extendedSlotString))
                                                ;
                                                (target.useLimit_extendedslot_value):SetShow(true)
                                                useLimitShow = true
                                              else
                                                do
                                                  do
                                                    ;
                                                    (target.useLimit_extendedslot_value):SetShow(false)
                                                    local itemName = itemSSW:getName()
                                                    local slotNoMax = itemSSW:getExtendedSlotCount()
                                                    local extendedSlotString = ""
                                                    local compareSlot = {}
                                                    local servantKindType = (ItemTooltip_UsableServantKind(itemSSW))
                                                    if nil ~= servantKindType then
                                                      for i = 1, slotNoMax do
                                                        local extendSlotNo = itemSSW:getExtendedSlotIndex(i - 1)
                                                        -- DECOMPILER ERROR at PC2680: Confused about usage of register: R55 in 'UnsetPending'

                                                        if slotNoMax ~= extendSlotNo then
                                                          (equip.extendedSlotInfoArray)[extendSlotNo] = i
                                                          equip.checkExtendedSlot = 1
                                                          compareSlot[i] = extendSlotNo
                                                          local compareCheck = false
                                                          if 1 == i then
                                                            extendedSlotString = extendedSlotString .. ", " .. (servantKindTypeString[servantKindType])[extendSlotNo]
                                                          else
                                                            if 1 < i then
                                                              extendedSlotString = extendedSlotString .. ", " .. (servantKindTypeString[servantKindType])[extendSlotNo]
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                    do
                                                      if 1 == equip.checkExtendedSlot then
                                                        local selfSlotNo = itemSSW:getEquipSlotNo()
                                                        -- DECOMPILER ERROR at PC2715: Confused about usage of register: R51 in 'UnsetPending'

                                                        ;
                                                        (equip.extendedSlotInfoArray)[selfSlotNo] = selfSlotNo
                                                        ;
                                                        (target.useLimit_extendedslot_value):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_EXTENDEDSLOT", "selfSlotNo", (servantKindTypeString[servantKindType])[selfSlotNo], "extendedSlotString", extendedSlotString))
                                                        ;
                                                        (target.useLimit_extendedslot_value):SetShow(true)
                                                        useLimitShow = true
                                                      else
                                                        do
                                                          do
                                                            ;
                                                            (target.useLimit_extendedslot_value):SetShow(false)
                                                            local isAllClass = true
                                                            local classNameList = nil
                                                            for idx = 0, getCharacterClassCount() - 1 do
                                                              local classType = getCharacterClassTypeByIndex(idx)
                                                              local className = (getCharacterClassName(classType))
                                                              if nil ~= className and className ~= "" and className ~= " " then
                                                                if ((itemSSW:get())._usableClassType):isOn(classType) then
                                                                  if nil == classNameList then
                                                                    classNameList = className
                                                                  else
                                                                    classNameList = classNameList .. ", " .. className
                                                                  end
                                                                else
                                                                  isAllClass = false
                                                                end
                                                              end
                                                            end
                                                            do
                                                              if isAllClass or nil == classNameList then
                                                                (target.useLimit_class_value):SetShow(false)
                                                                ;
                                                                (target.useLimit_class):SetShow(false)
                                                              else
                                                                useLimitShow = true
                                                                ;
                                                                (target.useLimit_class_value):SetTextMode(UI_TM.eTextMode_AutoWrap)
                                                                ;
                                                                (target.useLimit_class_value):SetShow(true)
                                                                ;
                                                                (target.useLimit_class):SetShow(true)
                                                                local isUsableClass = ((itemSSW:get())._usableClassType):isOn(classType)
                                                                if isUsableClass == false then
                                                                  (target.useLimit_class_value):SetFontColor(UI_color.C_FFF26A6A)
                                                                else
                                                                  ;
                                                                  (target.useLimit_class_value):SetFontColor(UI_color.C_FFC4BEBE)
                                                                end
                                                                if nil ~= classNameList then
                                                                  (target.useLimit_class_value):SetText("- " .. classNameList .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_ITEMTOOLTIP_CLASSONLY"))
                                                                else
                                                                  ;
                                                                  (target.useLimit_class_value):SetText(" ")
                                                                end
                                                              end
                                                              do
                                                                if not isSSW then
                                                                  if (item:getExpirationDate()):isIndefinite() then
                                                                    (target.remainTime_value):SetShow(false)
                                                                    ;
                                                                    (target.remainTime):SetShow(false)
                                                                  else
                                                                    local s64_remainingTime = getLeftSecond_s64(item:getExpirationDate())
                                                                    local fontColor = UI_color.C_FFC4BEBE
                                                                    local itemExpiration = item:getExpirationDate()
                                                                    local leftPeriod = FromClient_getTradeItemExpirationDate(itemExpiration, ((itemWrapper:getStaticStatus()):get())._expirationPeriod)
                                                                    if not (itemSSW:get()):isCash() and itemSSW:isTradeAble() then
                                                                      (target.remainTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_REMAINTIME_PRICEREMAIN"))
                                                                    else
                                                                      ;
                                                                      (target.remainTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ITEM_REMAINTIME_REMAINTIME"))
                                                                    end
                                                                    if (Defines.s64_const).s64_0 == s64_remainingTime then
                                                                      if not (itemSSW:get()):isCash() and itemSSW:isTradeAble() then
                                                                        (target.remainTime_value):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_REMAIN_TIME") .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_MARKETPRICE") .. " : " .. leftPeriod / 10000 .. " %)")
                                                                      else
                                                                        ;
                                                                        (target.remainTime_value):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_REMAIN_TIME"))
                                                                      end
                                                                      fontColor = UI_color.C_FFF26A6A
                                                                    else
                                                                      if not (itemSSW:get()):isCash() and itemSSW:isTradeAble() then
                                                                        (target.remainTime_value):SetText(convertStringFromDatetime(s64_remainingTime) .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_MARKETPRICE") .. " : " .. leftPeriod / 10000 .. " %)")
                                                                      else
                                                                        ;
                                                                        (target.remainTime_value):SetText(convertStringFromDatetime(s64_remainingTime))
                                                                      end
                                                                    end
                                                                    ;
                                                                    (target.remainTime_value):SetFontColor(fontColor)
                                                                    ;
                                                                    (target.remainTime_value):SetShow(true)
                                                                    ;
                                                                    (target.remainTime):SetShow(true)
                                                                    useLimitShow = true
                                                                  end
                                                                else
                                                                  do
                                                                    ;
                                                                    (target.remainTime_value):SetShow(false)
                                                                    ;
                                                                    (target.remainTime):SetShow(false)
                                                                    ;
                                                                    (target.useLimit_category):SetShow(false)
                                                                    ;
                                                                    (target.useLimit_panel):SetShow(useLimitShow)
                                                                    local attackShow = false
                                                                    local defenseShow = false
                                                                    local attackString = ""
                                                                    local minAttack = 0
                                                                    local maxAttack = 0
                                                                    for idx = 0, 2 do
                                                                      local currentMin = itemSSW:getMinDamage(idx)
                                                                      if minAttack < currentMin then
                                                                        minAttack = currentMin
                                                                      end
                                                                      local currentMax = itemSSW:getMaxDamage(idx)
                                                                      if maxAttack < currentMax then
                                                                        maxAttack = currentMax
                                                                      end
                                                                    end
                                                                    if 0 ~= maxAttack and 0 ~= minAttack then
                                                                      attackShow = true
                                                                    end
                                                                    if 1 == itemSSW:getItemType() and 36 == itemSSW:getEquipType() then
                                                                      minAttack = itemSSW:getMinDamage(0)
                                                                      maxAttack = itemSSW:getMaxDamage(0)
                                                                    end
                                                                    attackString = tostring(minAttack) .. " ~ " .. tostring(maxAttack)
                                                                    ;
                                                                    (target.attack_value):SetText(attackString)
                                                                    ;
                                                                    (target.attack_value):SetShow(attackShow)
                                                                    ;
                                                                    (target.attack):SetShow(attackShow)
                                                                    target.att_Value = (maxAttack + minAttack) / 2
                                                                    local defenseString = ""
                                                                    local def_value = 0
                                                                    if item_type == 1 then
                                                                      for idx = 0, 2 do
                                                                        local currentdef_value = itemSSW:getDefence(idx)
                                                                        if def_value < currentdef_value then
                                                                          def_value = currentdef_value
                                                                        end
                                                                      end
                                                                    end
                                                                    do
                                                                      if 0 ~= def_value then
                                                                        defenseShow = true
                                                                      end
                                                                      defenseString = tostring(def_value)
                                                                      ;
                                                                      (target.defense_value):SetText(defenseString)
                                                                      ;
                                                                      (target.defense_value):SetShow(defenseShow)
                                                                      ;
                                                                      (target.defense):SetShow(defenseShow)
                                                                      target.def_Value = def_value
                                                                      local gotWeight = (itemSSW:get())._weight
                                                                      local hit = 0
                                                                      local hitShow = false
                                                                      local hitString = ""
                                                                      hitString = tostring(hit)
                                                                      ;
                                                                      (target._hit_value):SetText(hitString)
                                                                      ;
                                                                      (target._hit_value):SetShow(hitShow)
                                                                      ;
                                                                      (target._hit):SetShow(hitShow)
                                                                      local dv = 0
                                                                      local dvShow = false
                                                                      local dvString = ""
                                                                      dvString = tostring(dv)
                                                                      ;
                                                                      (target._dv_value):SetText(dvString)
                                                                      ;
                                                                      (target._dv_value):SetShow(dvShow)
                                                                      ;
                                                                      (target._dv):SetShow(dvShow)
                                                                      local pv = 0
                                                                      local pvShow = false
                                                                      local pvString = ""
                                                                      pvString = tostring(pv)
                                                                      ;
                                                                      (target._pv_value):SetText(pvString)
                                                                      ;
                                                                      (target._pv_value):SetShow(pvShow)
                                                                      ;
                                                                      (target._pv):SetShow(pvShow)
                                                                      if 99 < gotWeight then
                                                                        (target.weight):SetShow(true)
                                                                        ;
                                                                        (target.weight_value):SetShow(true)
                                                                        local calcWeight = gotWeight / 10000
                                                                        ;
                                                                        (target.weight_value):SetText((string.format)("%.2f", calcWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
                                                                      else
                                                                        do
                                                                          ;
                                                                          (target.weight):SetShow(true)
                                                                          ;
                                                                          (target.weight_value):SetShow(true)
                                                                          do
                                                                            local calcWeight = gotWeight / 10000
                                                                            ;
                                                                            (target.weight_value):SetText((string.format)("%.2f", calcWeight) .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
                                                                            target.wei_Value = gotWeight / 10000
                                                                            if (itemSSW:get()):isCash() then
                                                                              (target.weight):SetShow(false)
                                                                              ;
                                                                              (target.weight_value):SetShow(false)
                                                                            end
                                                                            if Panel_Tooltip_Item_equipped:GetShow() then
                                                                              local _weightPoint = 0
                                                                              local _offencePoint = 0
                                                                              local _defencePoint = 0
                                                                              if 0 == normalTooltip.att_Value then
                                                                                _offencePoint = 0
                                                                              else
                                                                                _offencePoint = normalTooltip.att_Value - equippedTooltip.att_Value
                                                                              end
                                                                              if 0 == normalTooltip.def_Value then
                                                                                _defencePoint = 0
                                                                              else
                                                                                _defencePoint = normalTooltip.def_Value - equippedTooltip.def_Value
                                                                              end
                                                                              _weightPoint = normalTooltip.wei_Value - equippedTooltip.wei_Value
                                                                              if 0 < _weightPoint then
                                                                                _weightPoint = "<PAColor0xFFFF0000>�\178" .. (string.format)("%.2f", _weightPoint) .. "<PAOldColor>"
                                                                              else
                                                                                if _weightPoint < 0 then
                                                                                  _weightPoint = "<PAColor0xFFFFCE22>�\188" .. (string.format)("%.2f", _weightPoint * -1) .. "<PAOldColor>"
                                                                                end
                                                                              end
                                                                              if 0 ~= _offencePoint and 0 == _defencePoint then
                                                                                if 0 < _offencePoint then
                                                                                  _offencePoint = "<PAColor0xFFFFCE22>�\178" .. _offencePoint .. "<PAOldColor>"
                                                                                else
                                                                                  if _offencePoint < 0 then
                                                                                    _offencePoint = "<PAColor0xFFFF0000>�\188" .. _offencePoint * -1 .. "<PAOldColor>"
                                                                                  end
                                                                                end
                                                                                attackString = "(" .. _offencePoint .. " )"
                                                                                ;
                                                                                (normalTooltip.attack_diffValue):SetText(attackString)
                                                                                ;
                                                                                (normalTooltip.attack_diffValue):SetShow(true)
                                                                                ;
                                                                                (normalTooltip.defense_diffValue):SetText("")
                                                                                ;
                                                                                (normalTooltip.defense_diffValue):SetShow(false)
                                                                              else
                                                                                if 0 ~= _offencePoint and 0 ~= _defencePoint then
                                                                                  if 0 < _offencePoint then
                                                                                    _offencePoint = "<PAColor0xFFFFCE22>�\178" .. _offencePoint .. "<PAOldColor>"
                                                                                  else
                                                                                    if _offencePoint < 0 then
                                                                                      _offencePoint = "<PAColor0xFFFF0000>�\188" .. _offencePoint * -1 .. "<PAOldColor>"
                                                                                    end
                                                                                  end
                                                                                  if 0 < _defencePoint then
                                                                                    _defencePoint = "<PAColor0xFFFFCE22>�\178" .. _defencePoint .. "<PAOldColor>"
                                                                                  else
                                                                                    if _defencePoint < 0 then
                                                                                      _defencePoint = "<PAColor0xFFFF0000>�\188" .. _defencePoint * -1 .. "<PAOldColor>"
                                                                                    end
                                                                                  end
                                                                                  attackString = "(" .. _offencePoint .. " )"
                                                                                  ;
                                                                                  (normalTooltip.attack_diffValue):SetText(attackString)
                                                                                  defenseString = "(" .. _defencePoint .. " )"
                                                                                  ;
                                                                                  (normalTooltip.defense_diffValue):SetText(defenseString)
                                                                                  ;
                                                                                  (normalTooltip.attack_diffValue):SetShow(true)
                                                                                  ;
                                                                                  (normalTooltip.defense_diffValue):SetShow(true)
                                                                                else
                                                                                  if 0 == _offencePoint and 0 ~= _defencePoint then
                                                                                    if 0 < _defencePoint then
                                                                                      _defencePoint = "<PAColor0xFFFFCE22>�\178" .. _defencePoint .. "<PAOldColor>"
                                                                                    else
                                                                                      if _defencePoint < 0 then
                                                                                        _defencePoint = "<PAColor0xFFFF0000>�\188" .. _defencePoint * -1 .. "<PAOldColor>"
                                                                                      end
                                                                                    end
                                                                                    defenseString = "(" .. _defencePoint .. " )"
                                                                                    ;
                                                                                    (normalTooltip.defense_diffValue):SetText(defenseString)
                                                                                    ;
                                                                                    (normalTooltip.attack_diffValue):SetText("")
                                                                                    ;
                                                                                    (normalTooltip.attack_diffValue):SetShow(false)
                                                                                    ;
                                                                                    (normalTooltip.defense_diffValue):SetShow(true)
                                                                                  else
                                                                                    ;
                                                                                    (normalTooltip.attack_diffValue):SetShow(false)
                                                                                    ;
                                                                                    (normalTooltip.defense_diffValue):SetShow(false)
                                                                                  end
                                                                                end
                                                                              end
                                                                              if 0 ~= _weightPoint then
                                                                                (normalTooltip.weight_diffValue):SetText(" (" .. _weightPoint .. " )")
                                                                                ;
                                                                                (normalTooltip.weight_diffValue):SetShow(true)
                                                                              end
                                                                              if 0 == normalTooltip.att_Value and 0 == normalTooltip.def_Value then
                                                                                (normalTooltip.attack_diffValue):SetShow(false)
                                                                                ;
                                                                                (normalTooltip.defense_diffValue):SetShow(false)
                                                                                ;
                                                                                (normalTooltip.weight_diffValue):SetShow(false)
                                                                              end
                                                                            else
                                                                              do
                                                                                ;
                                                                                (normalTooltip.attack_diffValue):SetShow(false)
                                                                                ;
                                                                                (normalTooltip.defense_diffValue):SetShow(false)
                                                                                ;
                                                                                (normalTooltip.weight_diffValue):SetShow(false)
                                                                                local soketCount = 0
                                                                                if false == ((itemSSW:get()):getEnchant()):empty() then
                                                                                  soketCount = ((itemSSW:get()):getEnchant())._socketCount
                                                                                end
                                                                                local itemEnchantSSW = nil
                                                                                if not isSSW then
                                                                                  soketCount = item:getUsableItemSocketCount()
                                                                                end
                                                                                local socketMaxCount = ToClient_GetMaxItemSocketCount()
                                                                                for jewelIdx = 0, 5 do
                                                                                  if jewelIdx < socketMaxCount - 1 then
                                                                                    if not isSSW then
                                                                                      itemEnchantSSW = itemWrapper:getPushedItem(jewelIdx)
                                                                                    else
                                                                                      itemEnchantSSW = nil
                                                                                      if isItemWrapper or nil ~= chattingLinkedItem then
                                                                                        local pushedKey = nil
                                                                                        if isItemWrapper then
                                                                                          pushedKey = item:getPushedKey(jewelIdx)
                                                                                        else
                                                                                          if nil ~= chattingLinkedItem then
                                                                                            pushedKey = chattingLinkedItem:getPushedKey(jewelIdx)
                                                                                          end
                                                                                        end
                                                                                        if pushedKey ~= nil and 0 < pushedKey:get() then
                                                                                          itemEnchantSSW = getItemEnchantStaticStatus(pushedKey)
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                    do
                                                                                      if target.mainPanel ~= Panel_Tooltip_Item_equipped and nil ~= Panel_Tooltip_Item_DataObject.itemMarket then
                                                                                        itemEnchantSSW = nil
                                                                                      end
                                                                                      if soketCount <= jewelIdx then
                                                                                        ((target.soketName)[jewelIdx + 1]):SetShow(false)
                                                                                        ;
                                                                                        ((target.soketEffect)[jewelIdx + 1]):SetShow(false)
                                                                                        ;
                                                                                        ((target.soketSlot)[jewelIdx + 1]):SetShow(false)
                                                                                      else
                                                                                        if nil ~= itemEnchantSSW then
                                                                                          ((target.soketName)[jewelIdx + 1]):SetShow(true)
                                                                                          ;
                                                                                          ((target.soketEffect)[jewelIdx + 1]):SetShow(true)
                                                                                          ;
                                                                                          ((target.soketSlot)[jewelIdx + 1]):SetShow(true)
                                                                                          ;
                                                                                          ((target.soketName)[jewelIdx + 1]):SetText(itemEnchantSSW:getName())
                                                                                          ;
                                                                                          ((target.soketSlot)[jewelIdx + 1]):ChangeTextureInfoName("icon/" .. itemEnchantSSW:getIconPath())
                                                                                          local x1, y1, x2, y2 = setTextureUV_Func((target.soketSlot)[jewelIdx + 1], 0, 0, 42, 42)
                                                                                          ;
                                                                                          (((target.soketSlot)[jewelIdx + 1]):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                                          ;
                                                                                          ((target.soketSlot)[jewelIdx + 1]):setRenderTexture(((target.soketSlot)[jewelIdx + 1]):getBaseTexture())
                                                                                          local skillSSW = (itemEnchantSSW:getSkillByIdx(classType))
                                                                                          if nil == skillSSW then
                                                                                            ((target.soketEffect)[jewelIdx + 1]):SetText(" ")
                                                                                          else
                                                                                            local buffList = ""
                                                                                            for buffIdx = 0, skillSSW:getBuffCount() - 1 do
                                                                                              local desc = (skillSSW:getBuffDescription(buffIdx))
                                                                                              if nil ~= desc then
                                                                                                do
                                                                                                  if desc == "" then
                                                                                                    break
                                                                                                  end
                                                                                                  if nil == buffList or buffList == "" then
                                                                                                    buffList = desc
                                                                                                  else
                                                                                                    buffList = buffList .. " / " .. desc
                                                                                                  end
                                                                                                  -- DECOMPILER ERROR at PC3909: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                                                                  -- DECOMPILER ERROR at PC3909: LeaveBlock: unexpected jumping out IF_STMT

                                                                                                end
                                                                                              end
                                                                                            end
                                                                                            ;
                                                                                            ((target.soketEffect)[jewelIdx + 1]):SetText(buffList)
                                                                                          end
                                                                                        else
                                                                                          do
                                                                                            do
                                                                                              ;
                                                                                              ((target.soketName)[jewelIdx + 1]):SetShow(true)
                                                                                              ;
                                                                                              ((target.soketEffect)[jewelIdx + 1]):SetShow(true)
                                                                                              ;
                                                                                              ((target.soketSlot)[jewelIdx + 1]):SetShow(true)
                                                                                              ;
                                                                                              ((target.soketName)[jewelIdx + 1]):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EMPTY_SLOT"))
                                                                                              ;
                                                                                              ((target.soketEffect)[jewelIdx + 1]):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EMPTY_SLOT_DESC"))
                                                                                              ;
                                                                                              ((target.soketSlot)[jewelIdx + 1]):ChangeTextureInfoName(" ")
                                                                                              ;
                                                                                              ((target.soketName)[jewelIdx + 1]):SetShow(false)
                                                                                              ;
                                                                                              ((target.soketEffect)[jewelIdx + 1]):SetShow(false)
                                                                                              ;
                                                                                              ((target.soketSlot)[jewelIdx + 1]):SetShow(false)
                                                                                              -- DECOMPILER ERROR at PC4000: LeaveBlock: unexpected jumping out DO_STMT

                                                                                              -- DECOMPILER ERROR at PC4000: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                              -- DECOMPILER ERROR at PC4000: LeaveBlock: unexpected jumping out IF_STMT

                                                                                              -- DECOMPILER ERROR at PC4000: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                                                                              -- DECOMPILER ERROR at PC4000: LeaveBlock: unexpected jumping out IF_STMT

                                                                                              -- DECOMPILER ERROR at PC4000: LeaveBlock: unexpected jumping out DO_STMT

                                                                                              -- DECOMPILER ERROR at PC4000: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                                                              -- DECOMPILER ERROR at PC4000: LeaveBlock: unexpected jumping out IF_STMT

                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                                ;
                                                                                (target.soketOption_panel):SetShow(0 ~= soketCount)
                                                                                ;
                                                                                (target.useLimit_Exp):SetShow(false)
                                                                                ;
                                                                                (target.useLimit_Exp_gage):SetShow(false)
                                                                                ;
                                                                                (target.useLimit_Exp_gage_value):SetShow(false)
                                                                                ;
                                                                                (target.useLimit_Exp_value):SetShow(false)
                                                                                if (isGrowthContents or isTotemContents) and nil ~= itemWrapper and (32 == (itemSSW:get()):getContentsEventType() or 37 == (itemSSW:get()):getContentsEventType()) then
                                                                                  local alchemyStoneType = ((itemWrapper:getStaticStatus()):get())._contentsEventParam1
                                                                                  if alchemyStoneType < 3 then
                                                                                    local alchemystoneExp = itemWrapper:getExperience() / 10000
                                                                                    ;
                                                                                    (target.useLimit_Exp):SetShow(true)
                                                                                    ;
                                                                                    (target.useLimit_Exp_gage):SetShow(true)
                                                                                    ;
                                                                                    (target.useLimit_Exp_gage_value):SetShow(true)
                                                                                    ;
                                                                                    (target.useLimit_Exp_value):SetShow(true)
                                                                                    ;
                                                                                    (target.useLimit_Exp_value):SetText((string.format)("%.2f", alchemystoneExp) .. "%")
                                                                                    ;
                                                                                    (target.useLimit_Exp_gage_value):SetCurrentProgressRate(alchemystoneExp)
                                                                                    ;
                                                                                    (target.useLimit_Exp_gage_value):SetProgressRate(alchemystoneExp)
                                                                                    ;
                                                                                    (target.useLimit_Exp_gage_value):SetAniSpeed(0)
                                                                                  end
                                                                                end
                                                                                local maxEndurance = 32767
                                                                                local dynamicMaxEndurance = 32767
                                                                                if false == (itemSSW:get()):isUnbreakable() then
                                                                                  maxEndurance = (itemSSW:get()):getMaxEndurance()
                                                                                end
                                                                                if not isSSW then
                                                                                  dynamicMaxEndurance = item:getMaxEndurance()
                                                                                end
                                                                                local currentEndurance = maxEndurance
                                                                                if not isSSW then
                                                                                  currentEndurance = item:getEndurance()
                                                                                end
                                                                                local calcEndurance = currentEndurance / maxEndurance
                                                                                local calcDynamicEndurance = dynamicMaxEndurance / maxEndurance
                                                                                ;
                                                                                (target.useLimit_endurance_gage_value):SetCurrentProgressRate(calcEndurance * 100)
                                                                                ;
                                                                                (target.useLimit_endurance_gage_value):SetProgressRate(calcEndurance * 100)
                                                                                ;
                                                                                (target.useLimit_endurance_gage_value):SetAniSpeed(0)
                                                                                ;
                                                                                (target.useLimit_dynamic_endurance_gage_value):SetCurrentProgressRate(calcDynamicEndurance * 100)
                                                                                ;
                                                                                (target.useLimit_dynamic_endurance_gage_value):SetProgressRate(calcDynamicEndurance * 100)
                                                                                ;
                                                                                (target.useLimit_dynamic_endurance_gage_value):SetAniSpeed(0)
                                                                                if 32767 ~= dynamicMaxEndurance then
                                                                                  (target.useLimit_endurance_value):SetText(currentEndurance .. " / " .. dynamicMaxEndurance .. "  [" .. maxEndurance .. "]")
                                                                                  ;
                                                                                  (target.useLimit_endurance):SetShow(true)
                                                                                  ;
                                                                                  (target.useLimit_endurance_value):SetShow(true)
                                                                                  ;
                                                                                  (target.useLimit_endurance_gage_value):SetShow(true)
                                                                                  ;
                                                                                  (target.useLimit_dynamic_endurance_gage_value):SetShow(true)
                                                                                  ;
                                                                                  (target.useLimit_endurance_gage):SetShow(true)
                                                                                elseif 32767 ~= maxEndurance then
                                                                                  (target.useLimit_endurance_value):SetText(currentEndurance .. " / " .. maxEndurance)
                                                                                  ;
                                                                                  (target.useLimit_endurance):SetShow(true)
                                                                                  ;
                                                                                  (target.useLimit_endurance_value):SetShow(true)
                                                                                  ;
                                                                                  (target.useLimit_endurance_gage_value):SetShow(true)
                                                                                  ;
                                                                                  (target.useLimit_dynamic_endurance_gage_value):SetShow(false)
                                                                                  ;
                                                                                  (target.useLimit_endurance_gage):SetShow(true)
                                                                                else
                                                                                  (target.useLimit_endurance):SetShow(false)
                                                                                  ;
                                                                                  (target.useLimit_endurance_value):SetShow(false)
                                                                                  ;
                                                                                  (target.useLimit_endurance_gage_value):SetShow(false)
                                                                                  ;
                                                                                  (target.useLimit_dynamic_endurance_gage_value):SetShow(false)
                                                                                  ;
                                                                                  (target.useLimit_endurance_gage):SetShow(false)
                                                                                end
                                                                                if Panel_House_InstallationMode:GetShow() then
                                                                                  (target.useLimit_endurance):SetShow(false)
                                                                                  ;
                                                                                  (target.useLimit_endurance_value):SetShow(false)
                                                                                  ;
                                                                                  (target.useLimit_endurance_gage_value):SetShow(false)
                                                                                  ;
                                                                                  (target.useLimit_dynamic_endurance_gage_value):SetShow(false)
                                                                                  ;
                                                                                  (target.useLimit_endurance_gage):SetShow(false)
                                                                                end
                                                                                local check_fishingRod = function(itemKey)
    -- function num : 0_18_0
    if itemKey == 17591 or itemKey == 17592 or itemKey == 17596 or itemKey == 17612 or itemKey == 17613 or itemKey == 17669 then
      return true
    else
      return false
    end
  end

                                                                                if nil ~= itemWrapper then
                                                                                  local isCash = ((itemWrapper:getStaticStatus()):get()):isCash()
                                                                                  if true == isCash and false == check_fishingRod(((itemSSW:get())._key):getItemKey()) then
                                                                                    (target.useLimit_endurance):SetShow(false)
                                                                                    ;
                                                                                    (target.useLimit_endurance_value):SetShow(false)
                                                                                    ;
                                                                                    (target.useLimit_endurance_gage_value):SetShow(false)
                                                                                    ;
                                                                                    (target.useLimit_dynamic_endurance_gage_value):SetShow(false)
                                                                                    ;
                                                                                    (target.useLimit_endurance_gage):SetShow(false)
                                                                                  end
                                                                                elseif nil ~= itemSSW then
                                                                                  local isCash = (itemSSW:get()):isCash()
                                                                                  if true == isCash and false == check_fishingRod(((itemSSW:get())._key):getItemKey()) then
                                                                                    (target.useLimit_endurance):SetShow(false)
                                                                                    ;
                                                                                    (target.useLimit_endurance_value):SetShow(false)
                                                                                    ;
                                                                                    (target.useLimit_endurance_gage_value):SetShow(false)
                                                                                    ;
                                                                                    (target.useLimit_dynamic_endurance_gage_value):SetShow(false)
                                                                                    ;
                                                                                    (target.useLimit_endurance_gage):SetShow(false)
                                                                                  end
                                                                                end
                                                                                ;
                                                                                (target.enchantDifficulty):SetShow(false)
                                                                                do
                                                                                  if nil ~= itemSSW then
                                                                                    local enchantDifficulty = (itemSSW:get()):getEnchantDifficulty()
                                                                                    if 0 < enchantDifficulty then
                                                                                      (target.enchantDifficulty):SetShow(true)
                                                                                      if 1 == enchantDifficulty then
                                                                                        (target.enchantDifficulty):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ENCHANTDIFFICULTY_EASY"))
                                                                                      elseif 2 == enchantDifficulty then
                                                                                        (target.enchantDifficulty):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ENCHANTDIFFICULTY_NORMAL"))
                                                                                      elseif 3 == enchantDifficulty then
                                                                                        (target.enchantDifficulty):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_ENCHANTDIFFICULTY_HARD"))
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                  ;
                                                                                  (target.soulCollector):SetShow(false)
                                                                                  if true == Panel_Tooltip_Item_DataObject.inventory and nil ~= itemSSW then
                                                                                    local isSoulCollecTor = itemWrapper:isSoulCollector()
                                                                                    if true == isSoulCollecTor then
                                                                                      (target.soulCollector):SetShow(true)
                                                                                      local countSoul = nil
                                                                                      if itemWrapper:getSoulCollectorMaxCount() < itemWrapper:getSoulCollectorCount() then
                                                                                        countSoul = itemWrapper:getSoulCollectorMaxCount()
                                                                                      else
                                                                                        countSoul = itemWrapper:getSoulCollectorCount()
                                                                                      end
                                                                                      ;
                                                                                      (target.soulCollector):SetText("- " .. PAGetString(Defines.StringSheet_GAME, "LUA_SOULCOLLECTOR_STATE") .. " : " .. tostring(countSoul) .. "/" .. tostring(itemWrapper:getSoulCollectorMaxCount()))
                                                                                    end
                                                                                  end
                                                                                  ;
                                                                                  (target.mainPanel):SetSize((target.mainPanel):GetSizeX(), target.panelSize - 30 * (6 - soketCount - 1))
                                                                                  ;
                                                                                  (target.soketOption_panel):SetSize((target.soketOption_panel):GetSizeX(), target.socketSize - 30 * (6 - soketCount))
                                                                                  ;
                                                                                  (target.itemProducedPlace):ComputePos()
                                                                                  ;
                                                                                  (target.itemDescription):ComputePos()
                                                                                  ;
                                                                                  (target.itemPrice_panel):ComputePos()
                                                                                  ;
                                                                                  (target.itemPrice_transportBuy):ComputePos()
                                                                                  ;
                                                                                  (target.itemPrice_transportBuy_value):ComputePos()
                                                                                  ;
                                                                                  (target.itemPrice_storeSell):ComputePos()
                                                                                  ;
                                                                                  (target.itemPrice_storeSell_value):ComputePos()
                                                                                  if true == (itemSSW:get()):isForJustTrade() and not isSSW then
                                                                                    local nodeLevel = ToClient_GetNodeLevel(itemWrapper:getProductionRegionKey())
                                                                                    if 1 <= nodeLevel then
                                                                                      (target.itemProducedPlace):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_PRODUCT_PLACE") .. " : " .. itemWrapper:getProductionRegion() .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_LINK") .. ")")
                                                                                    else
                                                                                      (target.itemProducedPlace):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_PRODUCT_PLACE") .. " : " .. itemWrapper:getProductionRegion() .. " (" .. PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOLINK") .. ")")
                                                                                    end
                                                                                  else
                                                                                    (target.itemProducedPlace):SetText("")
                                                                                  end
                                                                                  ;
                                                                                  (target.itemDescription):SetTextMode(UI_TM.eTextMode_AutoWrap)
                                                                                  ;
                                                                                  (target.itemDescription):SetAutoResize(true)
                                                                                  local _desc = PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_DESC_TITLE") .. " " .. itemSSW:getDescription()
                                                                                  if item_type == 2 and true == (itemSSW:get()):isForJustTrade() then
                                                                                    _desc = _desc .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_TOOLTIP_DESC_TRADEITEM")
                                                                                  end
                                                                                  if itemSSW:getEnchantDescription() ~= "" then
                                                                                    _desc = _desc .. "\n\n- " .. itemSSW:getEnchantDescription()
                                                                                  end
                                                                                  ;
                                                                                  (target.itemDescription):SetText(_desc)
                                                                                  local isExchangeItem = itemSSW:isExchangeItem()
                                                                                  local exchangeDesc = ""
                                                                                  if isExchangeItem then
                                                                                    (target.exchangeTitle):SetShow(true)
                                                                                    ;
                                                                                    (target.exchangeDesc):SetShow(true)
                                                                                    ;
                                                                                    (target.exchangeDesc):SetText(itemSSW:getExchangeDescription())
                                                                                  else
                                                                                    (target.exchangeTitle):SetShow(false)
                                                                                    ;
                                                                                    (target.exchangeDesc):SetShow(false)
                                                                                    ;
                                                                                    (target.exchangeDesc):SetText("")
                                                                                  end
                                                                                  local _const = Defines.s64_const
                                                                                  local isTradeItem = itemSSW:isTradeAble()
                                                                                  if isTradeItem == true and not isSSW then
                                                                                    if _const.s64_0 < item:getBuyingPrice_s64() then
                                                                                      (target.itemPrice_transportBuy_value):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_AUCTION_GOLDTEXT") .. " " .. tostring(makeDotMoney(item:getBuyingPrice_s64())))
                                                                                    else
                                                                                      (target.itemPrice_transportBuy_value):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOTHING"))
                                                                                    end
                                                                                    ;
                                                                                    (target.itemPrice_transportBuy):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TRADE_BUY_PRICE") .. " : ")
                                                                                    ;
                                                                                    (target.itemPrice_transportBuy):SetFontColor(4287137928)
                                                                                    ;
                                                                                    (target.itemPrice_transportBuy):SetShow(true)
                                                                                    ;
                                                                                    (target.itemPrice_transportBuy_value):SetShow(true)
                                                                                    ;
                                                                                    (target.itemPrice_panel):SetSize((target.itemPrice_panel):GetSizeX(), 50)
                                                                                    ;
                                                                                    (target.itemPrice_transportBuy_value):SetSpanSize((target.itemPrice_transportBuy):GetTextSizeX() + 20, 0)
                                                                                  else
                                                                                    (target.itemPrice_transportBuy):SetText("")
                                                                                    ;
                                                                                    (target.itemPrice_transportBuy):SetFontColor(4290733156)
                                                                                    ;
                                                                                    (target.itemPrice_transportBuy):SetShow(true)
                                                                                    ;
                                                                                    (target.itemPrice_transportBuy_value):SetShow(false)
                                                                                    ;
                                                                                    (target.itemPrice_panel):SetSize((target.itemPrice_panel):GetSizeX(), 25)
                                                                                    ;
                                                                                    (target.itemPrice_transportBuy_value):SetSpanSize((target.itemPrice_transportBuy):GetTextSizeX() + 20, 0)
                                                                                  end
                                                                                  local s64_originalPrice = (itemSSW:get())._originalPrice_s64
                                                                                  local s64_sellPrice = (itemSSW:get())._sellPriceToNpc_s64
                                                                                  if isTradeItem then
                                                                                    (target.itemPrice_storeSell):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_TRADE_ORIGINAL_PRICE") .. ":")
                                                                                    if _const.s64_0 < s64_originalPrice and 0 == enchantLevel then
                                                                                      (target.itemPrice_storeSell_value):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_AUCTION_GOLDTEXT") .. " " .. tostring(makeDotMoney(s64_originalPrice)))
                                                                                      ;
                                                                                      (target.itemPrice_storeSell_value):SetFontColor(4292726146)
                                                                                    else
                                                                                      (target.itemPrice_storeSell_value):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOT_SELLING_ITEM"))
                                                                                      ;
                                                                                      (target.itemPrice_storeSell_value):SetFontColor(4290733156)
                                                                                    end
                                                                                  else
                                                                                    (target.itemPrice_storeSell):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_SELL_PRICE") .. " : ")
                                                                                    if _const.s64_0 < s64_sellPrice and 0 == enchantLevel then
                                                                                      (target.itemPrice_storeSell_value):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_AUCTION_GOLDTEXT") .. " " .. tostring(makeDotMoney(s64_sellPrice)))
                                                                                      ;
                                                                                      (target.itemPrice_storeSell_value):SetFontColor(4292726146)
                                                                                    else
                                                                                      (target.itemPrice_storeSell_value):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_NOT_SELLING_ITEM"))
                                                                                      ;
                                                                                      (target.itemPrice_storeSell_value):SetFontColor(4290733156)
                                                                                    end
                                                                                  end
                                                                                  ;
                                                                                  (target.itemPrice_storeSell_value):SetSpanSize((target.itemPrice_storeSell):GetTextSizeX() + 20, 0)
                                                                                  local elementBiggap = 10
                                                                                  local elementgap = 2
                                                                                  local TooltipYPos = 10
                                                                                  if target.mainPanel == Panel_Tooltip_Item_equipped then
                                                                                    (target.itemType):SetPosY(8)
                                                                                    ;
                                                                                    (chattingLinkedItemTooltip.itemType):SetPosX(175)
                                                                                    ;
                                                                                    (chattingLinkedItemClickTooltip.itemType):SetPosX(175)
                                                                                    ;
                                                                                    (target.dying):SetPosY(50 + (changeItemNamePos))
                                                                                    local showPosisionSetting = function(target, attackShow, defenseShow, hitShow, dvShow, pvShow)
    -- function num : 0_18_1 , upvalues : changeItemNamePos
    local index = -1
    local bottomTarget = 0
    local stringPos = 31
    local stringInterval = 22
    local valuePos = 22
    local valueInterval = 22
    local resultStringPos = 0
    local resultValuePos = 0
    if attackShow == true then
      index = index + 1
      bottomTarget = 1
      resultStringPos = stringPos + stringInterval * (index)
      resultValuePos = valuePos + valueInterval * (index)
      ;
      (target.attack):SetPosY(resultStringPos + changeItemNamePos)
      ;
      (target.attack_value):SetPosY(resultValuePos + changeItemNamePos)
    end
    if hitShow == true then
      index = index + 1
      bottomTarget = 2
      resultStringPos = stringPos + stringInterval * (index)
      resultValuePos = valuePos + valueInterval * (index)
      ;
      (target._hit):SetPosY(resultStringPos + changeItemNamePos)
      ;
      (target._hit_value):SetPosY(resultValuePos + changeItemNamePos)
      ;
      (target._hit_value):SetPosX((target._hit):GetPosX() + (target._hit):GetTextSizeX() + 10)
    end
    if defenseShow == true then
      index = index + 1
      bottomTarget = 3
      resultStringPos = stringPos + stringInterval * (index)
      resultValuePos = valuePos + valueInterval * (index)
      ;
      (target.defense):SetPosY(resultStringPos + changeItemNamePos)
      ;
      (target.defense_value):SetPosY(resultValuePos + changeItemNamePos)
    end
    if dvShow == true then
      index = index + 1
      bottomTarget = 4
      resultStringPos = stringPos + stringInterval * (index)
      resultValuePos = valuePos + valueInterval * (index)
      ;
      (target._dv):SetPosY(resultStringPos + changeItemNamePos)
      ;
      (target._dv_value):SetPosY(resultValuePos + changeItemNamePos)
      ;
      (target._dv_value):SetPosX((target._dv):GetPosX() + (target._dv):GetTextSizeX() + 10)
    end
    if pvShow == true then
      index = index + 1
      bottomTarget = 5
      resultStringPos = stringPos + stringInterval * (index)
      resultValuePos = valuePos + valueInterval * (index)
      ;
      (target._pv):SetPosY(resultStringPos + changeItemNamePos)
      ;
      (target._pv_value):SetPosY(resultValuePos + changeItemNamePos)
      ;
      (target._pv_value):SetPosX((target._pv):GetPosX() + (target._pv):GetTextSizeX() + 10)
    end
    return bottomTarget
  end

                                                                                    local bottomTarget = showPosisionSetting(target, attackShow, defenseShow, hitShow, dvShow, pvShow)
                                                                                    if 0 == bottomTarget then
                                                                                      (target.itemIcon):SetPosY(30 + (changeItemNamePos))
                                                                                      local iconPosY = (target.itemIcon):GetPosY()
                                                                                      local iconSizeY = (target.itemIcon):GetSizeY()
                                                                                      ;
                                                                                      (target.weight):SetPosY(iconPosY + iconSizeY - 15)
                                                                                      ;
                                                                                      (target.weight_value):SetPosY(iconPosY + iconSizeY - 15)
                                                                                    else
                                                                                      if 1 == bottomTarget then
                                                                                        TooltipYPos = GetBottomPos(target.attack) + elementgap
                                                                                      elseif 2 == bottomTarget then
                                                                                        TooltipYPos = GetBottomPos(target._hit) + elementgap
                                                                                      elseif 3 == bottomTarget then
                                                                                        TooltipYPos = GetBottomPos(target.defense) + elementgap
                                                                                      elseif 4 == bottomTarget then
                                                                                        TooltipYPos = GetBottomPos(target._dv) + elementgap
                                                                                      elseif 5 == bottomTarget then
                                                                                        TooltipYPos = GetBottomPos(target._pv) + elementgap
                                                                                      end
                                                                                      local iconSizeY = (target.itemIcon):GetSizeY()
                                                                                      local iconPosY = (TooltipYPos - (changeItemNamePos)) * 0.5 - iconSizeY * 0.5 + (changeItemNamePos)
                                                                                      ;
                                                                                      (target.itemIcon):SetPosY(iconPosY + (changeItemNamePos))
                                                                                      ;
                                                                                      (target.weight):SetPosY(TooltipYPos)
                                                                                      ;
                                                                                      (target.weight_value):SetPosY(TooltipYPos)
                                                                                    end
                                                                                    TooltipYPos = GetBottomPos(target.weight_value) + elementgap
                                                                                    local itemiconPosY = GetBottomPos(target.itemIcon) + elementgap
                                                                                    if TooltipYPos < itemiconPosY then
                                                                                      TooltipYPos = itemiconPosY
                                                                                    end
                                                                                    local iconPosY = (target.itemIcon):GetPosY()
                                                                                    local iconSizeY = (target.itemIcon):GetSizeY()
                                                                                    local enchantSizeY = (target.enchantLevel):GetSizeY()
                                                                                    ;
                                                                                    (target.enchantLevel):SetPosY(iconPosY + iconSizeY * 0.5 - enchantSizeY * 0.5)
                                                                                    if (normalTooltip.attack_diffValue):GetShow() then
                                                                                      (normalTooltip.attack_diffValue):SetPosX((normalTooltip.attack_value):GetPosX() + (normalTooltip.attack_value):GetTextSizeX() + 10)
                                                                                      ;
                                                                                      (normalTooltip.attack_diffValue):SetPosY((normalTooltip.attack_value):GetPosY() + 7)
                                                                                    end
                                                                                    if (normalTooltip.defense_diffValue):GetShow() then
                                                                                      (normalTooltip.defense_diffValue):SetPosX((normalTooltip.defense_value):GetPosX() + (normalTooltip.defense_value):GetTextSizeX() + 10)
                                                                                      ;
                                                                                      (normalTooltip.defense_diffValue):SetPosY((normalTooltip.defense_value):GetPosY() + 7)
                                                                                    end
                                                                                    if (normalTooltip.weight_diffValue):GetShow() then
                                                                                      (normalTooltip.weight_diffValue):SetPosX((normalTooltip.weight_value):GetPosX() + (normalTooltip.weight_value):GetTextSizeX() + 10)
                                                                                      ;
                                                                                      (normalTooltip.weight_diffValue):SetPosY((normalTooltip.weight_value):GetPosY())
                                                                                    end
                                                                                    if (target.isEnchantable):GetShow() then
                                                                                      (target.isEnchantable):SetPosY(TooltipYPos + 5)
                                                                                      TooltipYPos = GetBottomPos(target.isEnchantable) + elementgap
                                                                                    end
                                                                                    if (target.isSealed):GetShow() then
                                                                                      (target.isSealed):SetPosY(TooltipYPos + 5)
                                                                                      TooltipYPos = GetBottomPos(target.isSealed) + elementgap
                                                                                    end
                                                                                    if (target.bindType):GetShow() then
                                                                                      (target.bindType):SetPosY(TooltipYPos)
                                                                                      TooltipYPos = GetBottomPos(target.bindType) + elementgap
                                                                                    end
                                                                                    if (target.cronStoneEnchant):GetShow() then
                                                                                      (target.cronStoneEnchant):SetPosY(TooltipYPos + 5)
                                                                                      TooltipYPos = GetBottomPos(target.cronStoneEnchant)
                                                                                      ;
                                                                                      (target.cronStoneGrade):SetPosY(TooltipYPos)
                                                                                      TooltipYPos = GetBottomPos(target.cronStoneGrade)
                                                                                      ;
                                                                                      (target.cronStoneValue):SetPosY(TooltipYPos + 5)
                                                                                      TooltipYPos = GetBottomPos(target.cronStoneValue)
                                                                                      ;
                                                                                      (target.cronStoneProgressBg):SetPosY(TooltipYPos + 13)
                                                                                      ;
                                                                                      (target.cronStoneProgress):SetPosY(TooltipYPos + 19)
                                                                                      ;
                                                                                      ((target.cronStoneGradeValue)[0]):SetPosY(TooltipYPos + 5)
                                                                                      ;
                                                                                      ((target.cronStoneGradeValue)[1]):SetPosY(TooltipYPos + 5)
                                                                                      ;
                                                                                      ((target.cronStoneGradeValue)[2]):SetPosY(TooltipYPos + 5)
                                                                                      ;
                                                                                      ((target.cronStoneGradeValue)[3]):SetPosY(TooltipYPos + 5)
                                                                                      ;
                                                                                      ((target.cronStoneCountValue)[0]):SetPosY(TooltipYPos + 25)
                                                                                      ;
                                                                                      ((target.cronStoneCountValue)[1]):SetPosY(TooltipYPos + 25)
                                                                                      ;
                                                                                      ((target.cronStoneCountValue)[2]):SetPosY(TooltipYPos + 25)
                                                                                      ;
                                                                                      ((target.cronStoneCountValue)[3]):SetPosY(TooltipYPos + 25)
                                                                                      TooltipYPos = GetBottomPos((target.cronStoneCountValue)[0]) + elementgap
                                                                                    end
                                                                                    if (target.personalTrade):GetShow() then
                                                                                      (target.personalTrade):SetPosY(TooltipYPos)
                                                                                      TooltipYPos = GetBottomPos(target.personalTrade) + elementgap
                                                                                    end
                                                                                    if (target.enchantDifficulty):GetShow() then
                                                                                      (target.enchantDifficulty):SetPosY(TooltipYPos + 10)
                                                                                      TooltipYPos = GetBottomPos(target.enchantDifficulty) + elementBiggap
                                                                                    end
                                                                                    if (target.itemLock):GetShow() then
                                                                                      (target.itemLock):SetPosY(TooltipYPos)
                                                                                      TooltipYPos = GetBottomPos(target.itemLock) + elementgap
                                                                                    end
                                                                                    if (target.soulCollector):GetShow() then
                                                                                      (target.soulCollector):SetPosY(TooltipYPos)
                                                                                      TooltipYPos = GetBottomPos(target.soulCollector) + elementgap
                                                                                    end
                                                                                    if (target.tradeInfo_Panel):GetShow() then
                                                                                      (target.tradeInfo_Panel):SetPosY(TooltipYPos)
                                                                                      ;
                                                                                      (target.tradeInfo_Title):SetPosY(TooltipYPos + 5)
                                                                                      ;
                                                                                      (target.tradeInfo_Value):SetPosY(TooltipYPos + (target.tradeInfo_Title):GetSizeY() + 5)
                                                                                      TooltipYPos = GetBottomPos(target.tradeInfo_Panel) + elementgap
                                                                                    end
                                                                                    if (target.balksExtraction):GetShow() then
                                                                                      (target.balksExtraction):SetPosY(TooltipYPos)
                                                                                      TooltipYPos = GetBottomPos(target.balksExtraction) + elementgap
                                                                                    end
                                                                                    if (target.cronsExtraction):GetShow() then
                                                                                      (target.cronsExtraction):SetPosY(TooltipYPos - 5)
                                                                                      TooltipYPos = GetBottomPos(target.cronsExtraction) + elementgap
                                                                                    end
                                                                                    if (target.useDyeColorTitle):GetShow() then
                                                                                      (target.useDyeColorTitle):SetPosY(TooltipYPos)
                                                                                      TooltipYPos = GetBottomPos(target.useDyeColorTitle) + elementgap
                                                                                    end
                                                                                    do
                                                                                      do
                                                                                        if itemSSW:isEquipable() and itemSSW:isDyeable() then
                                                                                          local dyeingPartCount = 0
                                                                                          if nil ~= itemWrapper then
                                                                                            dyeingPartCount = itemWrapper:getDyeingPartCount()
                                                                                          elseif nil ~= chattingLinkedItem then
                                                                                            dyeingPartCount = chattingLinkedItem:getDyeingPartCount()
                                                                                          end
                                                                                          if 0 < dyeingPartCount then
                                                                                            for dyeingPart_Index = 0, dyeingPartCount - 1 do
                                                                                              ((target.useDyeColorIcon_Part)[dyeingPart_Index]):SetPosY(TooltipYPos)
                                                                                              if 0 == dyeingPart_Index then
                                                                                                ((target.useDyeColorIcon_Part)[dyeingPart_Index]):SetPosX(15)
                                                                                              else
                                                                                                ((target.useDyeColorIcon_Part)[dyeingPart_Index]):SetPosX(((target.useDyeColorIcon_Part)[dyeingPart_Index - 1]):GetPosX() + ((target.useDyeColorIcon_Part)[dyeingPart_Index]):GetSizeX() + 6)
                                                                                              end
                                                                                            end
                                                                                            TooltipYPos = GetBottomPos((target.useDyeColorIcon_Part)[0]) + elementgap + 10
                                                                                          end
                                                                                        end
                                                                                        if useLimitShow == true then
                                                                                          (target.useLimit_category):SetShow(true)
                                                                                          if (target.useLimit_category):GetShow() then
                                                                                            (target.useLimit_panel):SetPosY(TooltipYPos)
                                                                                            ;
                                                                                            (target.useLimit_category):SetPosY(TooltipYPos)
                                                                                            TooltipYPos = TooltipYPos + elementgap
                                                                                            if (target.useLimit_class_value):GetShow() then
                                                                                              (target.useLimit_class_value):SetPosY(TooltipYPos + 4)
                                                                                              TooltipYPos = GetBottomPos(target.useLimit_class_value) + elementgap
                                                                                            end
                                                                                            if (target.useLimit_level_value):GetShow() then
                                                                                              (target.useLimit_level_value):SetPosY(TooltipYPos + 4)
                                                                                              TooltipYPos = GetBottomPos(target.useLimit_level_value) + elementgap
                                                                                            end
                                                                                            if (target.useLimit_extendedslot_value):GetShow() then
                                                                                              (target.useLimit_extendedslot_value):SetPosY(TooltipYPos)
                                                                                              TooltipYPos = GetBottomPos(target.useLimit_extendedslot_value) + elementgap
                                                                                            end
                                                                                            if (target.remainTime):GetShow() then
                                                                                              (target.remainTime):SetPosY(TooltipYPos)
                                                                                              ;
                                                                                              (target.remainTime_value):SetPosY(TooltipYPos)
                                                                                              TooltipYPos = GetBottomPos(target.remainTime_value) + elementgap
                                                                                              local s64_remainingTime = getLeftSecond_s64(item:getExpirationDate())
                                                                                              if (Defines.s64_const).s64_0 == s64_remainingTime then
                                                                                                (target.expireIcon_end):SetShow(true)
                                                                                                ;
                                                                                                (target.expireIcon_end):SetPosX((target.remainTime_value):GetPosX() - 15)
                                                                                                ;
                                                                                                (target.expireIcon_end):SetPosY(TooltipYPos - 17)
                                                                                              elseif Int64toInt32(s64_remainingTime) <= 7200 then
                                                                                                (target.expireIcon_red):SetShow(true)
                                                                                                ;
                                                                                                (target.expireIcon_red):SetPosX((target.remainTime_value):GetPosX() - 15)
                                                                                                ;
                                                                                                (target.expireIcon_red):SetPosY(TooltipYPos - 17)
                                                                                              else
                                                                                                (target.expireIcon_white):SetShow(true)
                                                                                                ;
                                                                                                (target.expireIcon_white):SetPosX((target.remainTime_value):GetPosX() - 15)
                                                                                                ;
                                                                                                (target.expireIcon_white):SetPosY(TooltipYPos - 17)
                                                                                              end
                                                                                            else
                                                                                              (target.expireIcon_white):SetShow(false)
                                                                                              ;
                                                                                              (target.expireIcon_red):SetShow(false)
                                                                                              ;
                                                                                              (target.expireIcon_end):SetShow(false)
                                                                                            end
                                                                                            ;
                                                                                            (target.useLimit_panel):SetSize((target.useLimit_panel):GetSizeX(), TooltipYPos - (target.useLimit_panel):GetPosY() + elementBiggap / 2)
                                                                                            TooltipYPos = GetBottomPos(target.useLimit_panel) + elementBiggap / 2
                                                                                          end
                                                                                        end
                                                                                        if (target.soketOption_panel):GetShow() then
                                                                                          (target.soketOption_panel):SetPosY(TooltipYPos)
                                                                                          TooltipYPos = TooltipYPos + elementgap
                                                                                          for idx = 1, 6 do
                                                                                            if ((target.soketSlot)[idx]):GetShow() then
                                                                                              ((target.soketSlot)[idx]):SetPosY(TooltipYPos + 1)
                                                                                              ;
                                                                                              ((target.soketName)[idx]):SetPosY(TooltipYPos)
                                                                                              TooltipYPos = GetBottomPos((target.soketName)[idx]) + elementgap
                                                                                              ;
                                                                                              ((target.soketEffect)[idx]):SetPosY(TooltipYPos)
                                                                                              TooltipYPos = GetBottomPos((target.soketEffect)[idx]) + elementgap
                                                                                              TooltipYPos = TooltipYPos + elementBiggap
                                                                                            end
                                                                                          end
                                                                                          ;
                                                                                          (target.soketOption_panel):SetSize((target.soketOption_panel):GetSizeX(), TooltipYPos - (target.soketOption_panel):GetPosY() - elementBiggap / 2)
                                                                                          TooltipYPos = GetBottomPos(target.soketOption_panel) + elementBiggap
                                                                                        end
                                                                                        if true == (itemSSW:get()):isForJustTrade() and not isSSW then
                                                                                          (target.itemProducedPlace):SetPosY(TooltipYPos)
                                                                                          TooltipYPos = GetBottomPos(target.itemProducedPlace) + elementBiggap
                                                                                        end
                                                                                        if normalTooltip == target and (target.bagSize):GetShow() then
                                                                                          (target.bagSize):SetPosY(TooltipYPos)
                                                                                          TooltipYPos = GetBottomPos(target.bagSize)
                                                                                          if (target.equipmentInBag):GetShow() then
                                                                                            (target.equipmentInBag):SetPosY(TooltipYPos)
                                                                                            TooltipYPos = GetBottomPos(target.equipmentInBag) + elementBiggap
                                                                                          end
                                                                                        end
                                                                                        ;
                                                                                        (target.itemDescription):SetPosY(TooltipYPos + 10)
                                                                                        TooltipYPos = GetBottomPos(target.itemDescription) + elementgap
                                                                                        if (target.exchangeTitle):GetShow() then
                                                                                          (target.exchangeTitle):SetPosY(TooltipYPos + 10)
                                                                                          TooltipYPos = GetBottomPos(target.exchangeTitle) + elementgap
                                                                                          ;
                                                                                          (target.exchangeDesc):SetPosY(TooltipYPos)
                                                                                          TooltipYPos = GetBottomPos(target.exchangeDesc) + elementgap
                                                                                        end
                                                                                        if (target.equipSlotName):GetShow() then
                                                                                          (target.equipSlotName):SetPosY(TooltipYPos)
                                                                                          TooltipYPos = GetBottomPos(target.equipSlotName) + elementgap
                                                                                        end
                                                                                        ;
                                                                                        (target.itemPrice_panel):SetPosY(TooltipYPos)
                                                                                        TooltipYPos = TooltipYPos + elementgap * 2
                                                                                        ;
                                                                                        (target.itemPrice_transportBuy):SetPosY(TooltipYPos + 20)
                                                                                        ;
                                                                                        (target.itemPrice_transportBuy_value):SetPosY(TooltipYPos + 20)
                                                                                        ;
                                                                                        (target.itemPrice_storeSell):SetPosY(TooltipYPos)
                                                                                        ;
                                                                                        (target.itemPrice_storeSell_value):SetPosY(TooltipYPos)
                                                                                        TooltipYPos = GetBottomPos(target.itemPrice_storeSell_value) + elementBiggap
                                                                                        TooltipYPos = GetBottomPos(target.itemPrice_panel) + elementBiggap / 2
                                                                                        if (target.useLimit_Exp):GetShow() then
                                                                                          (target.useLimit_Exp):SetPosY(TooltipYPos + elementgap)
                                                                                          ;
                                                                                          (target.useLimit_Exp_gage):SetPosY(TooltipYPos + 15)
                                                                                          ;
                                                                                          (target.useLimit_Exp_gage_value):SetPosY(TooltipYPos + 20)
                                                                                          ;
                                                                                          (target.useLimit_Exp_value):SetPosY(TooltipYPos + 15 + ((target.useLimit_Exp_gage):GetSizeY() - (target.useLimit_Exp_value):GetSizeY()) / 2)
                                                                                          TooltipYPos = GetBottomPos(target.useLimit_Exp) + elementBiggap
                                                                                        end
                                                                                        if (target.useLimit_endurance):GetShow() then
                                                                                          (target.useLimit_endurance):SetPosY(TooltipYPos + elementgap)
                                                                                          ;
                                                                                          (target.useLimit_endurance_gage):SetPosY(TooltipYPos + 15)
                                                                                          ;
                                                                                          (target.useLimit_endurance_value):SetPosY(TooltipYPos + 15)
                                                                                          ;
                                                                                          (target.useLimit_endurance_gage_value):SetPosY(TooltipYPos + 15 + ((target.useLimit_endurance_gage):GetSizeY() - (target.useLimit_endurance_gage_value):GetSizeY()) / 2)
                                                                                          ;
                                                                                          (target.useLimit_dynamic_endurance_gage_value):SetPosY(TooltipYPos + 15 + ((target.useLimit_endurance_gage):GetSizeY() - (target.useLimit_dynamic_endurance_gage_value):GetSizeY()) / 2)
                                                                                          TooltipYPos = GetBottomPos(target.useLimit_endurance) + elementBiggap
                                                                                        end
                                                                                        ;
                                                                                        (target.itemLockNotify):SetShow(false)
                                                                                        if normalTooltip == target and true == Panel_Tooltip_Item_DataObject.inventory then
                                                                                          if (isGameTypeKorea() or isGameTypeJapan() or isGameTypeRussia() or isGameTypeEnglish() or isGameTypeTaiwan()) and getContentsServiceType() ~= (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
                                                                                            if false == (itemSSW:get()):isCash() and false == itemWrapper:isSoulCollector() then
                                                                                              (target.productNotify):SetShow(true)
                                                                                            else
                                                                                              (target.productNotify):SetShow(false)
                                                                                            end
                                                                                          else
                                                                                            (target.productNotify):SetShow(false)
                                                                                          end
                                                                                          if true == isItemLock and not (itemSSW:get()):isCash() then
                                                                                            (target.itemLockNotify):SetShow(false)
                                                                                            if false == (itemWrapper:getStaticStatus()):isStackable() then
                                                                                              if ToClient_Inventory_CheckItemLock(Inventory_GetToolTipItemSlotNo()) then
                                                                                                if false == ((itemWrapper:getStaticStatus()):get())._hideFromNote then
                                                                                                  (target.productNotify):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_TOOLTIP_ITEM_SHIFTCLICK") .. "\n" .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TOOLTIP_ITEM_SHIFTRCLICK_UNLOCK"))
                                                                                                else
                                                                                                  (target.productNotify):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TOOLTIP_ITEM_SHIFTRCLICK_UNLOCK"))
                                                                                                end
                                                                                              elseif false == ((itemWrapper:getStaticStatus()):get())._hideFromNote then
                                                                                                (target.productNotify):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_TOOLTIP_ITEM_SHIFTCLICK") .. "\n" .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TOOLTIP_ITEM_SHIFTRCLICK_LOCK"))
                                                                                              else
                                                                                                (target.productNotify):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_TOOLTIP_ITEM_SHIFTRCLICK_LOCK"))
                                                                                              end
                                                                                            elseif false == ((itemWrapper:getStaticStatus()):get())._hideFromNote then
                                                                                              (target.productNotify):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_TOOLTIP_ITEM_SHIFTCLICK"))
                                                                                            else
                                                                                              (target.productNotify):SetShow(false)
                                                                                            end
                                                                                          end
                                                                                        else
                                                                                          (target.productNotify):SetShow(false)
                                                                                          ;
                                                                                          (target.itemLockNotify):SetShow(false)
                                                                                        end
                                                                                        if not itemSSW:isStackable() or (target.productNotify):GetShow() then
                                                                                          (target.productNotify):SetPosY(TooltipYPos + elementgap)
                                                                                          TooltipYPos = GetBottomPos(target.productNotify) + elementgap
                                                                                        end
                                                                                        if (target.itemLockNotify):GetShow() then
                                                                                          (target.itemLockNotify):SetPosY(TooltipYPos + elementgap)
                                                                                          TooltipYPos = GetBottomPos(target.itemLockNotify) + elementgap
                                                                                        end
                                                                                        ;
                                                                                        (target.mainPanel):SetSize((target.mainPanel):GetSizeX(), TooltipYPos + elementBiggap / 2)
                                                                                        do return item_type == 1, itemSSW:isUsableServant() end
                                                                                        -- DECOMPILER ERROR: 94 unprocessed JMP targets
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

showTooltip_Item = function(target, itemWrapper, isSSW, isItemWrapper, chattingLinkedItem, index, isNextEnchantInfo, invenSlotNo)
  -- function num : 0_19
  audioPostEvent_SystemUi(1, 13)
  ;
  (target.mainPanel):SetShow(true, false)
  local ret, ret2 = Panel_Tooltip_Item_ShowInfo(target, itemWrapper, isSSW, isItemWrapper, chattingLinkedItem, index, isNextEnchantInfo, invenSlotNo)
  return ret, ret2
end

ItemTooltip_UsableClssTypeCheck = function(itemSSW)
  -- function num : 0_20
  if itemSSW == nil then
    return 
  end
  local isUsable = false
  for idx = 0, getCharacterClassCount() - 1 do
    local classType = getCharacterClassTypeByIndex(idx)
    if ((itemSSW:get())._usableClassType):isOn(classType) then
      isUsable = true
      break
    end
  end
  do
    return isUsable
  end
end

ItemTooltip_UsableServantKind = function(itemSSW)
  -- function num : 0_21
  if itemSSW == nil then
    return 
  end
  local servantKind = CppEnums.ServantKind
  local servantKindType = nil
  for index = 0, servantKind.Type_Count - 1 do
    if (itemSSW:get()):isServantTypeUsable(index) then
      if servantKind.Type_Horse == index or servantKind.Type_Camel == index or servantKind.Type_Donkey == index or servantKind.Type_Elephant == index then
        servantKindType = 0
      else
        if servantKind.Type_TwoWheelCarriage == index or servantKind.Type_FourWheeledCarriage == index then
          servantKindType = 1
        else
          if servantKind.Type_Ship == index or servantKind.Type_Raft == index or servantKind.Type_FishingBoat == index then
            servantKindType = 2
          end
        end
      end
    end
  end
  return servantKindType
end

Panel_Tooltip_Item_Initialize()

